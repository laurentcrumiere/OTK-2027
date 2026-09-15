$PBExportHeader$w_erasme_envoi_soins_trans.srw
forward
global type w_erasme_envoi_soins_trans from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_erasme_envoi_soins_trans
end type
type cb_autre from uo_picturebutton_390x120 within w_erasme_envoi_soins_trans
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_erasme_envoi_soins_trans
end type
type cb_ecran from uo_picturebutton_390x120 within w_erasme_envoi_soins_trans
end type
type uo_size from resize_fenetre within w_erasme_envoi_soins_trans
end type
type rb_un from radiobutton within w_erasme_envoi_soins_trans
end type
type rb_tous from radiobutton within w_erasme_envoi_soins_trans
end type
type em_nb from editmask within w_erasme_envoi_soins_trans
end type
type st_max from statictext within w_erasme_envoi_soins_trans
end type
type st_min from statictext within w_erasme_envoi_soins_trans
end type
type em_max from editmask within w_erasme_envoi_soins_trans
end type
type em_min from editmask within w_erasme_envoi_soins_trans
end type
type dw_1 from datawindow within w_erasme_envoi_soins_trans
end type
type gb_1 from groupbox within w_erasme_envoi_soins_trans
end type
type dw_prati from datawindow within w_erasme_envoi_soins_trans
end type
type dw_liste from u_basedw within w_erasme_envoi_soins_trans
end type
type dw_export from datawindow within w_erasme_envoi_soins_trans
end type
type st_1 from statictext within w_erasme_envoi_soins_trans
end type
type st_3 from statictext within w_erasme_envoi_soins_trans
end type
type em_date_min from uo_date_calendrier within w_erasme_envoi_soins_trans
end type
type st_2 from statictext within w_erasme_envoi_soins_trans
end type
type em_date_max from uo_date_calendrier within w_erasme_envoi_soins_trans
end type
type pb_transferer from uo_picturebutton_390x120 within w_erasme_envoi_soins_trans
end type
end forward

global type w_erasme_envoi_soins_trans from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3781
integer height = 2132
string title = "Envois des soins (Fichier TRANS)"
windowtype windowtype = child!
long backcolor = 15780518
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_fermer cb_fermer
cb_ecran cb_ecran
uo_size uo_size
rb_un rb_un
rb_tous rb_tous
em_nb em_nb
st_max st_max
st_min st_min
em_max em_max
em_min em_min
dw_1 dw_1
gb_1 gb_1
dw_prati dw_prati
dw_liste dw_liste
dw_export dw_export
st_1 st_1
st_3 st_3
em_date_min em_date_min
st_2 st_2
em_date_max em_date_max
pb_transferer pb_transferer
end type
global w_erasme_envoi_soins_trans w_erasme_envoi_soins_trans

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row


string mode_fonctionnement 	// Vaudra M pour Manuel, A pour Automatique
string fichier_log

end variables

forward prototypes
public subroutine prepa ()
public subroutine traitement_word (integer tab_type[], ref datawindow ldatawin)
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit, p
double code_min,code_max, v_montant
date date_min,date_max

if not prepa_faite then

	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=pra_min
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if
	
	ok_mdp = false
	
		
	 SELECT "prati"."pasfin"   INTO :pasfin  		 FROM "dba"."prati"  
		WHERE ( "prati"."code" = :pra_min ) ;

		open(w_mot_passe_financier)

	if ok_mdp then
	
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		date_min = date(em_date_min.text)
		date_max = date(em_date_max.text)
		
		tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
		
		open(w_patience)
		dw_liste.Modify("titre.text = '"+tit+"'")
		dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max)
		close(w_patience)
	
		em_nb.text = string(dw_liste.rowcount())+" Soins"
		em_nb.visible = true
	
		prepa_faite = true

	end if
end if

end subroutine

public subroutine traitement_word (integer tab_type[], ref datawindow ldatawin);uo_lien_word	luo
string			lcourrier[]
string			lchemin[]
int				i = 0
boolean			un_pb = false
string			rep_courrier


if ldatawin.AcceptText() = 1 then
// si pas de pb pour valider la dernière modif
// éventuelle de l'utilisateur -> on poursuit

	open(w_patience)
	
	// on alloue la mémoire
	luo = create uo_lien_word
	
	// recup du chemin courrier
	rep_courrier = fxg_get_rep_courriers()
	
	do 
		// maj var de boucle
		i++
		// on retrouve le nom du fichier de ce type de courrier (cf var globales)
		lcourrier[i] = luo.get_courrier(tab_type[i])
		// récup du chemin du courrier
		// -> pour l'instant obligation d'être ds racine rep courrier
		lchemin[i] = rep_courrier
		// si l'un des nom est vide -> on l'indique
		if lcourrier[i] = "" then un_pb = true
		
	// on boucle tant qu'il y a des types de courrier différents
	// ET que pas d'erreur rencotrée
	loop while i < upperbound(tab_type) AND not un_pb
	
	if not un_pb then
	// si on a bien retrouvé tous les courriers pour ce type de lettre
		// on lance le traitement par word
		if not PLANIFICATION_EN_COURS then
			if luo.traiter_avec_word( courriers_word_type_impr( ), lcourrier, ldatawin, lchemin,false) = -1 then
			// un pb est rencontré
				messagebox("Erreur","Un problème est survenu durant l'opération,~n impossible de poursuivre !", StopSign!)
			end if
		else
			// on forme une impression directe
			if luo.traiter_avec_word( Service_MajEtImprime , lcourrier, ldatawin, lchemin,false) = -1 then
				// Pas de message d'erreur durant la planification des actions 
				fxg_ajout_journal_planification('DEP', "L'impression des Lettres Word n'a pas pu être effectuée. Une erreur est survenue durant l'opération.")
			end if
		end if
	else
	// pas de courrier trouvé -> msg d'erreur
		if not PLANIFICATION_EN_COURS then
			messagebox("ATTENTION", "Il faut avant tout indiquer un/des fichier(s) au format ~nMicrosoft WORD pour ce(s) courrier(s) (menu 'Impression', 'Courriers Word', 'Paramètres Publipostage').~n~nImpossible de poursuivre !", Exclamation!)
			fxg_ajout_journal_planification('DEP', "L'impression des Lettres Word n'a pas pu être effectuée. Courrier Word non spécifié.")
		end if
	end if
	
	// libération mémoire
	destroy luo
	
	close(w_patience)
	
else
// si un pb sur le accepttext -> msg d'erreur
	messagebox("Erreur","Impossible de poursuivre ! ~n~nUne des valeurs que vous venez de rentrer ~nest incorrect !", StopSign!)
end if
end subroutine

on w_erasme_envoi_soins_trans.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.cb_ecran=create cb_ecran
this.uo_size=create uo_size
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.em_nb=create em_nb
this.st_max=create st_max
this.st_min=create st_min
this.em_max=create em_max
this.em_min=create em_min
this.dw_1=create dw_1
this.gb_1=create gb_1
this.dw_prati=create dw_prati
this.dw_liste=create dw_liste
this.dw_export=create dw_export
this.st_1=create st_1
this.st_3=create st_3
this.em_date_min=create em_date_min
this.st_2=create st_2
this.em_date_max=create em_date_max
this.pb_transferer=create pb_transferer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_autre
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.cb_ecran
this.Control[iCurrent+5]=this.uo_size
this.Control[iCurrent+6]=this.rb_un
this.Control[iCurrent+7]=this.rb_tous
this.Control[iCurrent+8]=this.em_nb
this.Control[iCurrent+9]=this.st_max
this.Control[iCurrent+10]=this.st_min
this.Control[iCurrent+11]=this.em_max
this.Control[iCurrent+12]=this.em_min
this.Control[iCurrent+13]=this.dw_1
this.Control[iCurrent+14]=this.gb_1
this.Control[iCurrent+15]=this.dw_prati
this.Control[iCurrent+16]=this.dw_liste
this.Control[iCurrent+17]=this.dw_export
this.Control[iCurrent+18]=this.st_1
this.Control[iCurrent+19]=this.st_3
this.Control[iCurrent+20]=this.em_date_min
this.Control[iCurrent+21]=this.st_2
this.Control[iCurrent+22]=this.em_date_max
this.Control[iCurrent+23]=this.pb_transferer
end on

on w_erasme_envoi_soins_trans.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_fermer)
destroy(this.cb_ecran)
destroy(this.uo_size)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.em_nb)
destroy(this.st_max)
destroy(this.st_min)
destroy(this.em_max)
destroy(this.em_min)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.dw_prati)
destroy(this.dw_liste)
destroy(this.dw_export)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.st_2)
destroy(this.em_date_max)
destroy(this.pb_transferer)
end on

event open;call super::open;
// récupération du mode de fonctionnement : A Automatique ou M Manuel
mode_fonctionnement = message.StringParm

open(w_patience)

//insertion de "O" ds la table "table_vide"-->column "v1"
UPDATE table_vide SET v1='O' WHERE cle = 1;
commit;

SELECT min(numero_dossier), max(numero_dossier),count(*) INTO :min, :max,:max_row 
FROM patient WHERE numero_dossier < 100000000 ;

em_min.text = string(min)
em_max.text = string(max)


em_date_min.setDate(date(1901,1,1))
em_date_max.setdate(today())


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

uo_size.taille(this)
prepa_faite = false
close(w_patience)

// Fichier Log pour consigner les actions
fichier_log = dir_courriers + "Envoi_soins_erasme.log"


if mode_fonctionnement = "A" then
	
	cb_ecran.triggerevent(clicked!)
	pb_transferer.triggerevent(clicked!)
	cb_fermer.triggerevent(clicked!)
	
end if




	
end event

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_erasme_envoi_soins_trans
end type

type cb_imprimer from uo_picturebutton_390x120 within w_erasme_envoi_soins_trans
integer x = 1614
integer y = 1868
integer taborder = 110
boolean enabled = false
string text = "&Imprimer"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_erasme_envoi_soins_trans
integer x = 1207
integer y = 1868
integer taborder = 110
boolean enabled = false
string text = "&Autre"
end type

event clicked;call super::clicked;prepa_faite = false
this.enabled = false
cb_imprimer.enabled = false
cb_ecran.enabled = true
dw_liste.visible = false
em_nb.visible = false
pb_transferer.enabled = false


composant_visible_selon_tag(parent , "a masquer", true)


end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_erasme_envoi_soins_trans
integer x = 2533
integer y = 1868
integer taborder = 30
end type

type cb_ecran from uo_picturebutton_390x120 within w_erasme_envoi_soins_trans
integer x = 800
integer y = 1868
integer taborder = 40
string text = "&Ecran"
boolean default = true
end type

event clicked;call super::clicked;prepa()
this.enabled = false
cb_imprimer.enabled = true
cb_autre.enabled = true
dw_liste.visible = true

this.default = false
cb_imprimer.default = true

pb_transferer.enabled = true

composant_visible_selon_tag(parent , "a masquer", false)
end event

type uo_size from resize_fenetre within w_erasme_envoi_soins_trans
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 30
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type rb_un from radiobutton within w_erasme_envoi_soins_trans
integer x = 448
integer y = 324
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

type rb_tous from radiobutton within w_erasme_envoi_soins_trans
integer x = 448
integer y = 228
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

type em_nb from editmask within w_erasme_envoi_soins_trans
boolean visible = false
integer x = 23
integer y = 1892
integer width = 722
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

type st_max from statictext within w_erasme_envoi_soins_trans
string tag = "a masquer"
integer x = 1335
integer y = 624
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Au Dossier N°"
alignment alignment = right!
end type

type st_min from statictext within w_erasme_envoi_soins_trans
string tag = "a masquer"
integer x = 347
integer y = 624
integer width = 389
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Du Dossier N°"
alignment alignment = right!
end type

type em_max from editmask within w_erasme_envoi_soins_trans
integer x = 1774
integer y = 612
integer width = 498
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type em_min from editmask within w_erasme_envoi_soins_trans
integer x = 786
integer y = 612
integer width = 498
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type dw_1 from datawindow within w_erasme_envoi_soins_trans
boolean visible = false
integer y = 260
integer width = 325
integer height = 668
integer taborder = 40
string dataobject = "dw_liste_tous_patients_edition"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event retrieverow;maj_patience(row,increment)
end event

type gb_1 from groupbox within w_erasme_envoi_soins_trans
integer x = 283
integer y = 148
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

type dw_prati from datawindow within w_erasme_envoi_soins_trans
string tag = "position brush"
boolean visible = false
integer x = 1216
integer y = 328
integer width = 859
integer height = 72
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type dw_liste from u_basedw within w_erasme_envoi_soins_trans
boolean visible = false
integer x = 1106
integer y = 48
integer width = 3707
integer height = 1824
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_erasme_liste_soins"
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

type dw_export from datawindow within w_erasme_envoi_soins_trans
boolean visible = false
integer x = 366
integer y = 840
integer width = 2592
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_erasme_liste_soins_export"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_erasme_envoi_soins_trans
string tag = "a masquer"
integer x = 352
integer y = 988
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date des soins (exécution) :"
end type

type st_3 from statictext within w_erasme_envoi_soins_trans
string tag = "a masquer"
integer x = 480
integer y = 1112
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type em_date_min from uo_date_calendrier within w_erasme_envoi_soins_trans
string tag = "a masquer no resizeall"
integer x = 855
integer y = 1100
integer taborder = 270
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_2 from statictext within w_erasme_envoi_soins_trans
string tag = "a masquer"
integer x = 1321
integer y = 1112
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type em_date_max from uo_date_calendrier within w_erasme_envoi_soins_trans
string tag = "a masquer no resizeall"
integer x = 1669
integer y = 1100
integer taborder = 280
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type pb_transferer from uo_picturebutton_390x120 within w_erasme_envoi_soins_trans
integer x = 2021
integer y = 1868
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string text = "&Transférer"
end type

event clicked;call super::clicked;
long lig, tot
double v_code
string v_inami

boolean v_suite

string v_id_erasme, v_code_praticien 

decimal{2} v_total, v_hn, v_montant_inami

integer num_fichier_log

num_fichier_log = fileopen(fichier_log ,linemode!,write!,LockReadWrite!,Append!)


if mode_fonctionnement = "A" then 
	v_suite = true
else
	
	if MessageBox("ATTENTION","Vous allez générer le fichier de transfert.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then 
		v_suite = true
	else
		v_suite = false
	end if
end if
	
if v_suite then

	if mode_fonctionnement = "A" then 
		FileWrite( num_fichier_log , "------------------------------------------   MODE AUTOMATIQUE --------------------------------------------")
	else
		FileWrite( num_fichier_log , "----------------------------------------------   MODE MANUEL ------------------------------------------------")
	end if
	
	FileWrite( num_fichier_log , "*** Début du transfert : "+string(today())+ " à "+ string(now()) +" ***")
	
	open(w_patience)

	tot = dw_liste.rowcount()

	
	for lig = 1 to tot
		
		v_code = dw_liste.GetItemNumber(lig, "code")
		v_code_praticien = dw_liste.GetItemString(lig, "code_praticien")
		
				
		dw_export.insertrow(0)
		
		select isnull(identifiant_erasme, '') into :v_id_erasme from erasme_patient where code_patient = :v_code ;
		dw_export.SetItem(lig, "Unieknr", left(v_id_erasme + space(12), 12))
		
		// Patnr
		dw_export.SetItem(lig, "patnr", left(v_id_erasme + space(20), 20))
		
		// compteur
		dw_export.SetItem(lig, "volgnr", string(lig, "00000"))
		
		
		// dates
		dw_export.SetItem(lig, "vandat", string( dw_liste.GetItemDate(lig, "soins_date_exe"), "yyyymmdd"))
		dw_export.SetItem(lig, "totdat", string( dw_liste.GetItemDate(lig, "soins_date_exe"), "yyyymmdd"))
		
		
		// praticien
		select isnull(identifiant_erasme, '') into :v_id_erasme from erasme_praticien where code_praticien = :v_code_praticien ;
		dw_export.SetItem(lig, "dokt", right("000000" + trim(v_id_erasme), 6))
		dw_export.SetItem(lig, "med_sign", right("000000" + trim(v_id_erasme), 6))
	
		
		// Inami
		v_inami =  dw_liste.GetItemString(lig, "soins_type")
		v_inami =  left(v_inami, 6)
		dw_export.SetItem(lig, "rizivnr",v_inami)

		// ambulant
		dw_export.SetItem(lig, "ag", '2')
		
		// nombre de prestation
		dw_export.SetItem(lig, "aant", '0001')
		
		
		// pourcentage honoraires
		dw_export.SetItem(lig, "prohon", '100')

		// statut montant
		dw_export.SetItem(lig, "bedrstat", '1')
		
		// Montants
		v_total = dw_liste.GetItemNumber(lig, "soins_total")
		v_hn = dw_liste.GetItemNumber(lig, "soins_hn") 
		
		zero(v_total)
		zero(v_hn)
		
		if v_hn < 0 then 
			// en principe pas possible mais .. sécurité ...
			v_hn = 0 
		end if
		
		if v_total < 0 then 
			// en principe pas possible mais .. sécurité ...
			v_total = 0 
		end if
		
		v_montant_inami = v_total - v_hn

		if v_montant_inami < 0 then
			v_montant_inami = 0
			v_hn  = v_total
		end if
		
		dw_export.SetItem(lig, "bedrm", string( v_montant_inami , "00000000.00") ) 
		dw_export.SetItem(lig, "bedrp", string( v_hn , "00000000.00") ) 
		
		// indication de remise
		dw_export.SetItem(lig, "kode_korting", '0')
		
		
		// imputation comptable
		dw_export.SetItem(lig, "verd", '8478 ')
		
		
		// reference
		dw_export.SetItem(lig, "referentie", string( dw_liste.GetItemDate(lig, "soins_date_exe"), "yyyymmdd")+ "0000")
	
		// Med_sign est mis à jour plus haut

		// campus
		dw_export.SetItem(lig, "campus_id","ERA")
		

		// divers
		dw_export.SetItem(lig, "nomax","0")
		dw_export.SetItem(lig, "att_print","0")
		dw_export.SetItem(lig, "notar","0")


		// Montant total
		dw_export.SetItem(lig, "imp_tot", string( v_total  , "00000000.00") ) 

		dw_export.SetItem(lig, "euro","2")


		// imputation comptable
		dw_export.SetItem(lig, "dataware", '8478 ')
		
		
		
		// on marque comme quoi transféré
		dw_liste.SetItem(lig, "soins_date_cara", today())
		

	
	next

	// Mise à jour de la base de données
	dw_liste.accepttext()
//	if dw_liste.update() = 1 then
//		commit ;
//	else
//		rollback ;
//		if mode_fonctionnement = "M" then
//			messagebox("ATTENTION","Une erreur s'est produite pendant la mémorisation de l'envoi en base de données.~n~n"+sqlca.sqlerrtext)
//		else
//			FileWrite(num_fichier_log ,"XXXXX    ERREUR PENDANT LA MEMORIDATION DE L'ENVOI EN BASE DE DONNEES  XXXXX")
//		end if
//	end if
		


	// faire le update de la liste 
	// lexport

	string fichier_export
	
	
	// sauvegarde dans un fichier temporaaire
	fichier_export = dir_ini + "export_soins_erasme.tmp"
	dw_export.SaveAsFormattedText(fichier_export, EncodingANSI!, '', '' )


	// Construction du fichier final
	string v_nom_fichier, v_nom_dossier
	integer v_num_fichier
	string v_ligne_lue
	long num_file_ecrit, num_file_lu
	
	select top 1 isnull(numero_fichier_transf,0), isnull(dossier_fichier_transf,'') into :v_num_fichier, :v_nom_dossier from erasme_param ;
	
	zeroi(v_num_fichier)

	v_num_fichier = v_num_fichier + 1
	if v_num_fichier = 10000 then
		v_num_fichier = 1
	end if
	
	
	v_nom_fichier = v_nom_dossier + "ORTHOK" + string(v_num_fichier, "0000") + ".MTR"
	
	// On met le fichier à Blanc avant toute exécution !!
	
	num_file_ecrit = fileopen(v_nom_fichier ,linemode!,write!,LockReadWrite!,replace!)
	num_file_lu = fileopen(fichier_export ,linemode!,read!)
	
	filewrite(num_file_ecrit,"TTT" + string(today(), "yyyymmdd"))


	// recopie ensuite du fichier généré précédemment
	do while 	FileRead(num_file_lu, v_ligne_lue) > 0
	
		filewrite(num_file_ecrit, v_ligne_lue)
	
	loop
	
	// Enregistrement final
	filewrite(num_file_ecrit,"EEE" + string(dw_liste.rowcount(), "000000"))

	// Mémorisation du nuveau numéro de fichier
	update erasme_param set numero_fichier_transf = :v_num_fichier ;
	commit ;
	

	FileClose(num_file_lu)
	FileClose(num_file_ecrit)
	
	close(w_patience)
	
	FileWrite(num_fichier_log ,"Fichier généré : " + v_nom_fichier+" - " + string(dw_liste.rowcount()) + " lignes de soins" )
	FileWrite(num_fichier_log , "*** Début du transfert : "+string(today())+ " à "+ string(now()) +" ***")
	FileClose(num_fichier_log)
	

end if








end event

