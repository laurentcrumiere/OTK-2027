$PBExportHeader$w_attestation_duplicata.srw
forward
global type w_attestation_duplicata from w_fenetre_arakis
end type
type pb_imprimer from uo_picturebutton_780x120 within w_attestation_duplicata
end type
type pb_annuler from uo_picturebutton_780x120 within w_attestation_duplicata
end type
type st_2 from statictext within w_attestation_duplicata
end type
type em_numero from editmask within w_attestation_duplicata
end type
type st_3 from statictext within w_attestation_duplicata
end type
type em_date from editmask within w_attestation_duplicata
end type
type st_1 from statictext within w_attestation_duplicata
end type
type em_duplicata from editmask within w_attestation_duplicata
end type
end forward

global type w_attestation_duplicata from w_fenetre_arakis
integer width = 3141
integer height = 836
string title = "Impression d~'un duplicata d~'attestation"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_imprimer pb_imprimer
pb_annuler pb_annuler
st_2 st_2
em_numero em_numero
st_3 st_3
em_date em_date
st_1 st_1
em_duplicata em_duplicata
end type
global w_attestation_duplicata w_attestation_duplicata

forward prototypes
public subroutine imprimer ()
end prototypes

public subroutine imprimer ();
//*************************************************************************************
//  ATTENTION ! Pour la belgique, la fonction est dupliquée de w_facture_impression
//  sauf pour le montant sur le reçu qui doit toujours être à zéro !!
//*************************************************************************************

long v_num, v_code, lig, ligtot, v_cle
date v_date_local 

integer v_code_titre
string v_nom, v_prenom, v_nomp,v_adr1,v_adr2,v_codep,v_ville,v_code_pays, v_pays, v_titre, v_prati
double v_numero_dossier

v_num = double(em_duplicata.text)

var_suite = true 


// Code du patient
v_code = w_click_soins_reg.dw_soins.getitemnumber(1,"soins_code")
v_date_local = date(em_date.text)


// Enregistrement de la facture
// Insert dans la table
INSERT INTO "facture"  ( "numero",  "date" )   VALUES ( :v_num,   :v_date_local )  ;

if SQLCA.SQLcode = -1 Then
	
	// Problème dans le INSERT
	CHOOSE CASE SQLCA.SQLdbCode
	CASE -193
	// Problème de clé 
		Messagebox("ATTENTION !","Ce numéro d'attestation existe déjà !")
	CASE ELSE
			Messagebox("Erreur SQL",SQLCA.SQLErrText)
	END CHOOSE
	
	var_suite = false
	
	rollback ;
	
else
	
	ligtot = w_attestation_impression.dw_facture.rowcount()
	for lig = 1 to ligtot
		v_cle = w_attestation_impression.dw_facture.getitemnumber(lig,"cle")
		update soins set numero_facture = :v_num where code = :v_code and cle = :v_cle ;
	next 
	
	commit ;

end if


if var_suite then
	// on peut imprimer la facture / attestaion
	
	
	if Belgique then
	
		if profilestring(dir_ini+inifile_orthokis,"DEP-FSE","attestations_word","N")  ="O" then 
			
			// impression WORD
			if FileExists(dir_ini + nom_fichier_attestation) then
				
				// On écrit l'info de duplication de suite pour être sure
				
				// Création du fichier si n'existe pas ... sera temporaire
				string inifile_echeancier = "echeancier.ini"
				integer v_file
				FileDelete (dir_ini + inifile_echeancier)
				v_file = FileOpen(dir_ini + inifile_echeancier, linemode!, Write!, LockWrite!, Replace!)
				FileWrite(v_file, "")
				FileClose(v_file)
				SetProfileString( dir_ini + inifile_echeancier, "Admini","Duplicata_attestation" ,  "DUPLICATA DE L'ATTESTATION N°"+em_numero.text )
				
				
				m_orthosoins m_menu
				m_menu = create m_orthosoins
				m_menu.utiliser_courrier_word ("A", 0)
				
			else
				Messagebox("ATTENTION","Le fichier d'impression de l'Attestation de Soins est introuvable.~n~nVeuillez contacter ARAKIS.")
			end if
		else
	
			// recherche de l'imprimante spécifique pour les dep et feuilles de soins
			if profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","feuilles_soins_active","N") = "O" then 
				w_attestation_impression.dw_attest.Modify ('DataWindow.Printer="'+m_orthosoins.getimprimspecif(v_code)+'" ')
			end if
	
			// Ajustement inutile car déjà fait avant, dans l'open de w_attestation_impression
			m_orthosoins.ajustement_recto(w_attestation_impression.dw_attest)
	
			// Mise à jour de la date dans l'attestation
			ligtot = w_attestation_impression.dw_attest.rowcount()
			
			for lig = 1 to ligtot
				w_attestation_impression.dw_attest.setitem(lig , "date" , v_date_local)
				
				// sur une duplicata .. pas de montant reçu
				w_attestation_impression.dw_attest.setitem(lig , "montant_recu" , 0)
			next
			
			
			// Mise en place de l'info de duplicata
			w_attestation_impression.dw_attest.object.t_duplicata.visible = true
			w_attestation_impression.dw_attest.object.t_duplicata.text = "DUPLICATA DE L'ATTESTATION N°"+em_numero.text
			w_attestation_impression.dw_attest.print()
			
			w_attestation_impression.dw_attest.object.t_duplicata.visible = false
		end if
		
		
		ajout_histo_editions(v_code,"FEUSOI",today(),"Attestation N°"+string(v_num) +" - Duplicata du N°"+em_numero.text +" du "+param_win[2] )
	
	end if
	
end if

close(this)
end subroutine

on w_attestation_duplicata.create
int iCurrent
call super::create
this.pb_imprimer=create pb_imprimer
this.pb_annuler=create pb_annuler
this.st_2=create st_2
this.em_numero=create em_numero
this.st_3=create st_3
this.em_date=create em_date
this.st_1=create st_1
this.em_duplicata=create em_duplicata
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_imprimer
this.Control[iCurrent+2]=this.pb_annuler
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.em_numero
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.em_date
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.em_duplicata
end on

on w_attestation_duplicata.destroy
call super::destroy
destroy(this.pb_imprimer)
destroy(this.pb_annuler)
destroy(this.st_2)
destroy(this.em_numero)
destroy(this.st_3)
destroy(this.em_date)
destroy(this.st_1)
destroy(this.em_duplicata)
end on

event open;call super::open;
double num_max

// récup des paramètres passés en variable globale 

em_numero.text = param_win[1]


// depuis em_date.text = param_win[2]
em_date.text = string(today())


// on prend le numero le plus récent ... + 1
declare cur_facture CURSOR FOR select numero from "facture" order by "date" desc, numero desc ;
open cur_facture ;
fetch cur_facture into :num_max ;
close cur_facture ;


em_duplicata.text = string(num_max + 1)
end event

type p_fond from w_fenetre_arakis`p_fond within w_attestation_duplicata
end type

type pb_imprimer from uo_picturebutton_780x120 within w_attestation_duplicata
integer x = 1435
integer y = 524
integer width = 777
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Imprimer Duplicata"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

imprimer()


end event

type pb_annuler from uo_picturebutton_780x120 within w_attestation_duplicata
integer x = 553
integer y = 528
integer width = 777
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;

close(parent)
end event

type st_2 from statictext within w_attestation_duplicata
integer x = 123
integer y = 80
integer width = 891
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° de l~'attestation à dupliquer "
alignment alignment = right!
end type

type em_numero from editmask within w_attestation_duplicata
integer x = 1056
integer y = 68
integer width = 512
integer height = 92
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
string text = "0"
alignment alignment = right!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
string mask = "#########"
boolean spin = true
end type

type st_3 from statictext within w_attestation_duplicata
integer x = 1979
integer y = 252
integer width = 233
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date"
alignment alignment = center!
end type

type em_date from editmask within w_attestation_duplicata
integer x = 2231
integer y = 232
integer width = 453
integer height = 100
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type st_1 from statictext within w_attestation_duplicata
integer x = 123
integer y = 248
integer width = 891
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° du duplicata"
alignment alignment = right!
end type

type em_duplicata from editmask within w_attestation_duplicata
integer x = 1056
integer y = 236
integer width = 512
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#########"
boolean spin = true
end type

