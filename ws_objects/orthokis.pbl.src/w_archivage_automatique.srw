$PBExportHeader$w_archivage_automatique.srw
forward
global type w_archivage_automatique from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_archivage_automatique
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_archivage_automatique
end type
type cb_ecran from uo_picturebutton_390x120 within w_archivage_automatique
end type
type uo_size from resize_fenetre within w_archivage_automatique
end type
type rb_un from radiobutton within w_archivage_automatique
end type
type rb_tous from radiobutton within w_archivage_automatique
end type
type em_nb from editmask within w_archivage_automatique
end type
type gb_1 from groupbox within w_archivage_automatique
end type
type dw_prati from datawindow within w_archivage_automatique
end type
type dw_liste from u_basedw within w_archivage_automatique
end type
type cb_archivage from uo_picturebutton_390x120 within w_archivage_automatique
end type
type st_1 from statictext within w_archivage_automatique
end type
type st_2 from statictext within w_archivage_automatique
end type
type st_rdv from statictext within w_archivage_automatique
end type
type st_soins from statictext within w_archivage_automatique
end type
type st_3 from statictext within w_archivage_automatique
end type
type st_4 from statictext within w_archivage_automatique
end type
type st_5 from statictext within w_archivage_automatique
end type
type st_6 from statictext within w_archivage_automatique
end type
type dw_type2 from datawindow within w_archivage_automatique
end type
type st_7 from statictext within w_archivage_automatique
end type
type sle_archivage from singlelineedit within w_archivage_automatique
end type
type rb_tous_dossier from radiobutton within w_archivage_automatique
end type
type rb_un_dossier from radiobutton within w_archivage_automatique
end type
type dw_dossier from datawindow within w_archivage_automatique
end type
type gb_2 from groupbox within w_archivage_automatique
end type
type gb_3 from groupbox within w_archivage_automatique
end type
type gb_4 from gb_1 within w_archivage_automatique
end type
end forward

global type w_archivage_automatique from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3781
integer height = 2160
string title = "Archivage Automatique de dossiers"
windowtype windowtype = child!
long backcolor = 15780518
cb_imprimer cb_imprimer
cb_fermer cb_fermer
cb_ecran cb_ecran
uo_size uo_size
rb_un rb_un
rb_tous rb_tous
em_nb em_nb
gb_1 gb_1
dw_prati dw_prati
dw_liste dw_liste
cb_archivage cb_archivage
st_1 st_1
st_2 st_2
st_rdv st_rdv
st_soins st_soins
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
dw_type2 dw_type2
st_7 st_7
sle_archivage sle_archivage
rb_tous_dossier rb_tous_dossier
rb_un_dossier rb_un_dossier
dw_dossier dw_dossier
gb_2 gb_2
gb_3 gb_3
gb_4 gb_4
end type
global w_archivage_automatique w_archivage_automatique

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row

integer v_delai_archivage_rdv, v_delai_archivage_soins

end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max
string v_titre

if not prepa_faite then
	prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		v_titre = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		select nom + isnull(' ' + prenom, '') into :v_titre from prati where code = :pra_min ;
		v_titre = "Pour le Dr " + v_titre
	end if
	
	// Type de dossier
	String v_dos1, v_dos2
	if rb_tous_dossier.checked then 
		v_dos1 = ""
		v_dos2 = "ZZZZZZ"
	else
		v_dos1 = dw_dossier.getitemstring(dw_dossier.getrow(),"code")
		v_dos2 = v_dos1
	end if

	// mise en place du filtre qui va bien
	string v_filtre
	date date_delai_rdv, date_delai_soins
	
	select top 1 dateadd (month, - :v_delai_archivage_rdv, cast(getdate() as date)) into :date_delai_rdv from param ;
	select top 1 dateadd (month, - :v_delai_archivage_soins, cast(getdate() as date)) into :date_delai_soins from param ;

	v_filtre = "(date_fin_dernier_soin < date('" + string(date_delai_soins) + "')  or isnull(date_fin_dernier_soin)) and (dernier_rdv  < date('" + string(date_delai_rdv) +"') or isnull(dernier_rdv))"
	v_filtre = v_filtre + " and (patient_relance > dernier_rdv   or isnull(patient_relance))"
	dw_liste.setfilter(v_filtre)
	dw_liste.filter()
	dw_liste.object.titre.text = v_titre
	open(w_patience)
	dw_liste.retrieve(pra_min,pra_max, v_dos1, v_dos2)
	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	em_nb.visible = true
	
	
end if

end subroutine

on w_archivage_automatique.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_fermer=create cb_fermer
this.cb_ecran=create cb_ecran
this.uo_size=create uo_size
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.em_nb=create em_nb
this.gb_1=create gb_1
this.dw_prati=create dw_prati
this.dw_liste=create dw_liste
this.cb_archivage=create cb_archivage
this.st_1=create st_1
this.st_2=create st_2
this.st_rdv=create st_rdv
this.st_soins=create st_soins
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.dw_type2=create dw_type2
this.st_7=create st_7
this.sle_archivage=create sle_archivage
this.rb_tous_dossier=create rb_tous_dossier
this.rb_un_dossier=create rb_un_dossier
this.dw_dossier=create dw_dossier
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_fermer
this.Control[iCurrent+3]=this.cb_ecran
this.Control[iCurrent+4]=this.uo_size
this.Control[iCurrent+5]=this.rb_un
this.Control[iCurrent+6]=this.rb_tous
this.Control[iCurrent+7]=this.em_nb
this.Control[iCurrent+8]=this.gb_1
this.Control[iCurrent+9]=this.dw_prati
this.Control[iCurrent+10]=this.dw_liste
this.Control[iCurrent+11]=this.cb_archivage
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.st_2
this.Control[iCurrent+14]=this.st_rdv
this.Control[iCurrent+15]=this.st_soins
this.Control[iCurrent+16]=this.st_3
this.Control[iCurrent+17]=this.st_4
this.Control[iCurrent+18]=this.st_5
this.Control[iCurrent+19]=this.st_6
this.Control[iCurrent+20]=this.dw_type2
this.Control[iCurrent+21]=this.st_7
this.Control[iCurrent+22]=this.sle_archivage
this.Control[iCurrent+23]=this.rb_tous_dossier
this.Control[iCurrent+24]=this.rb_un_dossier
this.Control[iCurrent+25]=this.dw_dossier
this.Control[iCurrent+26]=this.gb_2
this.Control[iCurrent+27]=this.gb_3
this.Control[iCurrent+28]=this.gb_4
end on

on w_archivage_automatique.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_fermer)
destroy(this.cb_ecran)
destroy(this.uo_size)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.em_nb)
destroy(this.gb_1)
destroy(this.dw_prati)
destroy(this.dw_liste)
destroy(this.cb_archivage)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_rdv)
destroy(this.st_soins)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.dw_type2)
destroy(this.st_7)
destroy(this.sle_archivage)
destroy(this.rb_tous_dossier)
destroy(this.rb_un_dossier)
destroy(this.dw_dossier)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_4)
end on

event open;call super::open;string s_code_praticien


open(w_patience)

//insertion de "O" ds la table "table_vide"-->column "v1"
UPDATE table_vide SET v1='O' WHERE cle = 1;
commit;

SELECT min(numero_dossier), max(numero_dossier),count(*) INTO :min, :max,:max_row 
FROM patient WHERE numero_dossier < 100000000 ;

increment = integer(max_row / 10)

dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if

// Praticien par defaut
s_code_praticien = fxg_get_praticien_par_defaut()
dw_prati.setitem(1, "code",s_code_praticien )


// recup des param 
select top 1 delai_archivage_rdv, delai_archivage_soins 
into :v_delai_archivage_rdv, :v_delai_archivage_soins 
from param ;

st_rdv.text  = "- qui n'ont pas eu de rendez-vous depuis " + string(v_delai_archivage_rdv)+" mois."
st_soins.text = "- qui n'ont plus de soin actif depuis " + string(v_delai_archivage_soins)+" mois."


dw_type2.settransobject(sqlca)
dw_type2.retrieve()
// On se postionne sur le premier TYPE DE DOSSIER qui commence par "ARCHIV"
long lig
lig = dw_type2.find("upper(left(nom,6)) = 'ARCHIV'",0,9999)
if lig > 0 then
	dw_type2.scrollTorow(lig)
	dw_type2.setrow(lig)
end if

dw_dossier.settransobject(sqlca)
dw_dossier.retrieve()

uo_size.taille(this)
prepa_faite = false



close(w_patience)

end event

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_archivage_automatique
integer x = 768
integer y = 588
end type

type cb_imprimer from uo_picturebutton_390x120 within w_archivage_automatique
integer x = 1742
integer y = 1852
integer width = 489
integer height = 152
integer taborder = 110
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_archivage_automatique
integer x = 2866
integer y = 1852
integer width = 489
integer height = 152
integer taborder = 30
end type

event clicked;fermer_fenetre(parent)



end event

type cb_ecran from uo_picturebutton_390x120 within w_archivage_automatique
integer x = 1179
integer y = 1852
integer width = 489
integer height = 152
integer taborder = 40
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;prepa()
if dw_liste.rowcount() = 0 then
	if  not PLANIFICATION_EN_COURS then
		Messagebox("ATTENTION !", "Vous n'avez aucun dossier à archiver.")
	end if
	fermer_fenetre(parent)
else
		
	this.enabled = false
	cb_imprimer.enabled ( true )
	dw_liste.visible = true
	this.default ( false)
	cb_archivage.enabled ( true )
	cb_archivage.default ( true)
end if


end event

type uo_size from resize_fenetre within w_archivage_automatique
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 30
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type rb_un from radiobutton within w_archivage_automatique
integer x = 448
integer y = 208
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

event clicked;rb_tous.checked = false
dw_prati.visible = true
end event

type rb_tous from radiobutton within w_archivage_automatique
integer x = 448
integer y = 112
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
boolean checked = true
end type

event clicked;rb_un.checked = false
dw_prati.visible = false
end event

type em_nb from editmask within w_archivage_automatique
boolean visible = false
integer x = 23
integer y = 1892
integer width = 1079
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXX"
end type

type gb_1 from groupbox within w_archivage_automatique
integer x = 283
integer y = 32
integer width = 2121
integer height = 304
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du praticien"
end type

type dw_prati from datawindow within w_archivage_automatique
string tag = "position brush"
boolean visible = false
integer x = 1216
integer y = 212
integer width = 859
integer height = 72
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type dw_liste from u_basedw within w_archivage_automatique
boolean visible = false
integer x = 18
integer y = 16
integer width = 3707
integer height = 1824
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_liste_patients_archivage_automatique"
end type

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event retrieverow;call super::retrieverow;
if mod(row , 10) = 0 then 
	// pour voir l'animation de patience !!!
	yield()
end if
end event

event doubleclicked;call super::doubleclicked;

// double clic, comme dans la salle d'attente !!

if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
	var_nom 				= this.getitemstring(row,"nom")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
end if

end event

type cb_archivage from uo_picturebutton_390x120 within w_archivage_automatique
integer x = 2309
integer y = 1852
integer width = 489
integer height = 152
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "&Archivage"
boolean default = true
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;
boolean v_suite

double tot , var_code_local, var_numero_local, num

tot = dw_liste.rowcount()

if PLANIFICATION_EN_COURS then
	v_suite = true
else
	if Messagebox("ATTENTION","Vous allez archiver "+ string(tot)+" dossiers !~n~n1. Cette opération peut être longue.~n~n2. Si vous êtes en réseau, VOUS DEVEZ DEMANDER aux autres utilisateurs de quitter ORTHOkis le temps de l'archivage.~nDe plus, VOUS DEVEZ FERMER les toutes les fenêtres.~n~nConfirmez-vous ?",question!,YesNo!,2) = 1 then
		v_suite = true
	else
		v_suite = false
	end if
end if

if v_suite then
	
		em_nb.visible = true
	
		if not PLANIFICATION_EN_COURS then
			open(w_patience)
		end if

		long lig
		
		for lig = 1 to tot
			
			var_code_local = dw_liste.getitemnumber(lig,"code")
			var_numero_local = dw_liste.getitemnumber(lig,"numero_dossier")
		
			num = proposer_numero_archivage(abs(var_numero_local))
			
			
			if not PLANIFICATION_EN_COURS then
				em_nb.text = string(lig)+" / "+string(tot) + "   ("+string(var_numero_local)+")"
				
				yield()
			end if

		// var_numero_local = ancien code ; num = nouveau
			
			if num < 1000000000 then
				
				string type_dossier, zone, ancien_type_dossier
				
				// zone d'archivage
				zone = sle_archivage.text
				
				
				// Ancien Type de dossier 
				ancien_type_dossier = dw_liste.GetItemString(lig,"type_dossier")
					
				
				//Type de dossier une fois archivé
				type_dossier = dw_type2.Gettext()
			
				
				// changer le numero de dossier
		
				
				// Modif des infos d'archivage et du numéro de dossier
				update patient set type_dossier = :type_dossier, archivage = :zone, numero_dossier = :num
				where code = :var_code_local ;
						
				if sqlca.sqlcode = 0 then
					commit ;	
					ajout_histo_actions(var_code_local, "NUMPAT", today(),"Ancien N° : "+string(var_numero_local)+" -> Nouveau N° "+string(num))

					// Si le nouveau type de dossier est différent 
					if ancien_type_dossier <> type_dossier then
							// Mise à jour de l'historique des dossiers
							INSERT INTO histo_dossier (code, date_heure, type_dossier) 
							VALUES (:var_code_local, getdate(), :type_dossier) ;
							// Mémorisation de la création du dossier
							ajout_histo_actions(var_code,"ARCPAT",today(),"" )
					end if
					
					commit ;

				else
					rollback ;
					if not PLANIFICATION_EN_COURS then
						MessageBox("ERREUR DANS LA RENUMEROTATION DU DOSSIER !",sqlca.sqlerrtext)
					end if
				end if
				
	
			end if 		// Le nouveau numéro est bon
			
		
		next
		
		if not PLANIFICATION_EN_COURS then
			em_nb.text = "Enregistrement"
		end if
		
		commit ;
		
		if not PLANIFICATION_EN_COURS then
			close(w_patience)
		end if
		
		if not PLANIFICATION_EN_COURS then
			Messagebox("INFORMATION","L'archivage de "+ string(tot)+" dossiers est terminé !")
		end if


end if

fermer_fenetre(parent)
end event

type st_1 from statictext within w_archivage_automatique
integer x = 475
integer y = 788
integer width = 2917
integer height = 108
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 255
long backcolor = 65535
string text = "ATTENTION !"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_archivage_automatique
integer x = 471
integer y = 896
integer width = 2917
integer height = 108
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 255
long backcolor = 65535
string text = "Cette fonction vous permet d~'archiver automatiquement les patients"
boolean focusrectangle = false
end type

type st_rdv from statictext within w_archivage_automatique
integer x = 471
integer y = 992
integer width = 2917
integer height = 108
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 255
long backcolor = 65535
string text = "rdv"
boolean focusrectangle = false
end type

type st_soins from statictext within w_archivage_automatique
integer x = 471
integer y = 1088
integer width = 2917
integer height = 108
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 255
long backcolor = 65535
string text = "soins"
boolean focusrectangle = false
end type

type st_3 from statictext within w_archivage_automatique
integer x = 265
integer y = 972
integer width = 146
integer height = 108
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 255
long backcolor = 65535
string text = "et"
boolean focusrectangle = false
end type

type st_4 from statictext within w_archivage_automatique
integer x = 471
integer y = 1184
integer width = 2917
integer height = 108
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 255
long backcolor = 65535
string text = "- qui n~'ont pas de date de recontact (ou pas depuis dernier rendez-vous)"
boolean focusrectangle = false
end type

type st_5 from statictext within w_archivage_automatique
integer x = 265
integer y = 1064
integer width = 146
integer height = 108
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 255
long backcolor = 65535
string text = "et"
boolean focusrectangle = false
end type

type st_6 from statictext within w_archivage_automatique
integer x = 352
integer y = 1476
integer width = 1010
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Type de dossier une fois archivé"
end type

type dw_type2 from datawindow within w_archivage_automatique
string tag = "brush no resize all"
integer x = 1362
integer y = 1476
integer width = 864
integer height = 76
integer taborder = 90
boolean bringtotop = true
string dataobject = "dw_dossier_ddlb1"
boolean border = false
boolean livescroll = true
end type

type st_7 from statictext within w_archivage_automatique
integer x = 370
integer y = 1612
integer width = 480
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Zone archivage "
end type

type sle_archivage from singlelineedit within w_archivage_automatique
integer x = 859
integer y = 1604
integer width = 928
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type rb_tous_dossier from radiobutton within w_archivage_automatique
integer x = 439
integer y = 444
integer width = 891
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les Types de Dossiers  "
boolean checked = true
end type

event clicked;dw_dossier.visible = false
end event

type rb_un_dossier from radiobutton within w_archivage_automatique
integer x = 439
integer y = 552
integer width = 677
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un Type de Dossier  "
end type

event rb_un_dossier::clicked;call super::clicked;dw_dossier.visible = true
end event

type dw_dossier from datawindow within w_archivage_automatique
string tag = "position"
boolean visible = false
integer x = 1211
integer y = 552
integer width = 937
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type gb_2 from groupbox within w_archivage_automatique
integer x = 142
integer y = 716
integer width = 3465
integer height = 620
integer taborder = 40
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial Black"
long textcolor = 65535
long backcolor = 65535
end type

type gb_3 from groupbox within w_archivage_automatique
integer x = 302
integer y = 1368
integer width = 2213
integer height = 396
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Informations des dossiers une fois archivés"
end type

type gb_4 from gb_1 within w_archivage_automatique
integer x = 274
integer y = 356
integer width = 2272
integer height = 328
integer taborder = 70
string text = "Choix du Dossier"
end type

