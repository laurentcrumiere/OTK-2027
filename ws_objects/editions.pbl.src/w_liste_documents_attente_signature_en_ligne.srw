$PBExportHeader$w_liste_documents_attente_signature_en_ligne.srw
forward
global type w_liste_documents_attente_signature_en_ligne from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_documents_attente_signature_en_ligne
end type
type cb_imprimer from uo_picturebutton_390x120 within w_liste_documents_attente_signature_en_ligne
end type
type cb_autre from uo_picturebutton_390x120 within w_liste_documents_attente_signature_en_ligne
end type
type cb_ecran from uo_picturebutton_390x120 within w_liste_documents_attente_signature_en_ligne
end type
type uo_1 from resize_fenetre within w_liste_documents_attente_signature_en_ligne
end type
type st_2 from statictext within w_liste_documents_attente_signature_en_ligne
end type
type sle_pat from singlelineedit within w_liste_documents_attente_signature_en_ligne
end type
type rb_tous_pat from radiobutton within w_liste_documents_attente_signature_en_ligne
end type
type rb_un_pat from radiobutton within w_liste_documents_attente_signature_en_ligne
end type
type dw_prati from datawindow within w_liste_documents_attente_signature_en_ligne
end type
type rb_un from radiobutton within w_liste_documents_attente_signature_en_ligne
end type
type rb_tous from radiobutton within w_liste_documents_attente_signature_en_ligne
end type
type em_nb from editmask within w_liste_documents_attente_signature_en_ligne
end type
type gb_4 from groupbox within w_liste_documents_attente_signature_en_ligne
end type
type gb_2 from groupbox within w_liste_documents_attente_signature_en_ligne
end type
type gb_1 from groupbox within w_liste_documents_attente_signature_en_ligne
end type
type em_date_rdv_min from uo_date_calendrier within w_liste_documents_attente_signature_en_ligne
end type
type em_date_rdv_max from uo_date_calendrier within w_liste_documents_attente_signature_en_ligne
end type
type cbx_filtre from u_cst_togglebutton within w_liste_documents_attente_signature_en_ligne
end type
type rb_pas_rdv from radiobutton within w_liste_documents_attente_signature_en_ligne
end type
type rb_rdv from radiobutton within w_liste_documents_attente_signature_en_ligne
end type
type em_date_min from uo_date_calendrier within w_liste_documents_attente_signature_en_ligne
end type
type st_1 from statictext within w_liste_documents_attente_signature_en_ligne
end type
type em_date_max from uo_date_calendrier within w_liste_documents_attente_signature_en_ligne
end type
type st_3 from statictext within w_liste_documents_attente_signature_en_ligne
end type
type gb_3 from groupbox within w_liste_documents_attente_signature_en_ligne
end type
type dw_liste from u_basedw within w_liste_documents_attente_signature_en_ligne
end type
type cb_relancer from uo_picturebutton_390x120 within w_liste_documents_attente_signature_en_ligne
end type
end forward

global type w_liste_documents_attente_signature_en_ligne from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 4242
integer height = 2296
string title = "Liste des Documents en attente de Signature en Ligne"
windowtype windowtype = child!
cb_fermer cb_fermer
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_ecran cb_ecran
uo_1 uo_1
st_2 st_2
sle_pat sle_pat
rb_tous_pat rb_tous_pat
rb_un_pat rb_un_pat
dw_prati dw_prati
rb_un rb_un
rb_tous rb_tous
em_nb em_nb
gb_4 gb_4
gb_2 gb_2
gb_1 gb_1
em_date_rdv_min em_date_rdv_min
em_date_rdv_max em_date_rdv_max
cbx_filtre cbx_filtre
rb_pas_rdv rb_pas_rdv
rb_rdv rb_rdv
em_date_min em_date_min
st_1 st_1
em_date_max em_date_max
st_3 st_3
gb_3 gb_3
dw_liste dw_liste
cb_relancer cb_relancer
end type
global w_liste_documents_attente_signature_en_ligne w_liste_documents_attente_signature_en_ligne

type variables
boolean prepa_faite
double nb_dossier,increment,var_code_local




n_cst_PowerFilter iu_PowerFilter
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,nat_min,nat_max,tit1,tit2,n
double code_min,code_max, v_code
long lig, tot, v_cpt
date da_min,da_max, da_rdv_min, da_rdv_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit1 = "Analyse pour tous les praticiens - "
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	  SELECT "nom"  INTO :n FROM "prati"  
   	WHERE ( "prati"."code" = :pra_min ) ;
		tit1 = "Analyse pour le Dr : "+n+" - "
	end if
	if rb_tous_pat.checked then
		code_min = -99999999
		code_max = 999999999
		tit1 = tit1+"Pour tous les patients"
	else
		code_min=var_code_local
		code_max=var_code_local
		tit1 = tit1+"Pour le patient : "+sle_pat.text
	end if
	

	da_min = date(em_date_min.text)
	da_max =  date(em_date_max.text)

	tit2 = tit2 +" Documents du "+em_date_min.text+" au "+em_date_max.text
	
	double max_row
	SELECT count(*) INTO :max_row FROM historique_editions ;

	increment = integer(max_row / 10)

	open(w_patience)
	
	dw_liste.object.Titre1.text = tit1
	dw_liste.object.Titre2.text = tit2

	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,da_min,da_max)
	
	
	
	if rb_rdv.checked then
		
		da_rdv_min = date(em_date_rdv_min.text)
		da_rdv_max = date(em_date_rdv_max.text)
		
		// On élimines les lignes pour les patiens qui n'ont pas rendez-dans la période 
		tot = dw_liste.rowcount()
		
		for lig = tot to 1 step -1
			v_code = dw_liste.GetItemNumber(lig, "code")
			SELECT isnull(count(*),0) into :v_cpt
			FROM rdv, etat_rdv WHERE rdv.code = :v_code and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' 
			and date(rdv) between :da_rdv_min and :da_rdv_max ;
			
			if v_cpt = 0 then
				dw_liste.deleterow(lig)
			end if
			
		next



	end if
	
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Editions/Documents"
	//em_nb.visible = true
end if

end subroutine

event open;call super::open;
dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

em_date_min.setDate(date(1900,1,1))
em_date_max.setDate((today()))

em_date_rdv_min.setDate(today())
em_date_rdv_max.setDate(relativedate(today(), 10))

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if

uo_1.taille(this)
cbx_filtre.backcolor = this.backcolor
end event

on w_liste_documents_attente_signature_en_ligne.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_ecran=create cb_ecran
this.uo_1=create uo_1
this.st_2=create st_2
this.sle_pat=create sle_pat
this.rb_tous_pat=create rb_tous_pat
this.rb_un_pat=create rb_un_pat
this.dw_prati=create dw_prati
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.em_nb=create em_nb
this.gb_4=create gb_4
this.gb_2=create gb_2
this.gb_1=create gb_1
this.em_date_rdv_min=create em_date_rdv_min
this.em_date_rdv_max=create em_date_rdv_max
this.cbx_filtre=create cbx_filtre
this.rb_pas_rdv=create rb_pas_rdv
this.rb_rdv=create rb_rdv
this.em_date_min=create em_date_min
this.st_1=create st_1
this.em_date_max=create em_date_max
this.st_3=create st_3
this.gb_3=create gb_3
this.dw_liste=create dw_liste
this.cb_relancer=create cb_relancer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_autre
this.Control[iCurrent+4]=this.cb_ecran
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.sle_pat
this.Control[iCurrent+8]=this.rb_tous_pat
this.Control[iCurrent+9]=this.rb_un_pat
this.Control[iCurrent+10]=this.dw_prati
this.Control[iCurrent+11]=this.rb_un
this.Control[iCurrent+12]=this.rb_tous
this.Control[iCurrent+13]=this.em_nb
this.Control[iCurrent+14]=this.gb_4
this.Control[iCurrent+15]=this.gb_2
this.Control[iCurrent+16]=this.gb_1
this.Control[iCurrent+17]=this.em_date_rdv_min
this.Control[iCurrent+18]=this.em_date_rdv_max
this.Control[iCurrent+19]=this.cbx_filtre
this.Control[iCurrent+20]=this.rb_pas_rdv
this.Control[iCurrent+21]=this.rb_rdv
this.Control[iCurrent+22]=this.em_date_min
this.Control[iCurrent+23]=this.st_1
this.Control[iCurrent+24]=this.em_date_max
this.Control[iCurrent+25]=this.st_3
this.Control[iCurrent+26]=this.gb_3
this.Control[iCurrent+27]=this.dw_liste
this.Control[iCurrent+28]=this.cb_relancer
end on

on w_liste_documents_attente_signature_en_ligne.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_ecran)
destroy(this.uo_1)
destroy(this.st_2)
destroy(this.sle_pat)
destroy(this.rb_tous_pat)
destroy(this.rb_un_pat)
destroy(this.dw_prati)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.em_nb)
destroy(this.gb_4)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.em_date_rdv_min)
destroy(this.em_date_rdv_max)
destroy(this.cbx_filtre)
destroy(this.rb_pas_rdv)
destroy(this.rb_rdv)
destroy(this.em_date_min)
destroy(this.st_1)
destroy(this.em_date_max)
destroy(this.st_3)
destroy(this.gb_3)
destroy(this.dw_liste)
destroy(this.cb_relancer)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_liste_documents_attente_signature_en_ligne
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_documents_attente_signature_en_ligne
integer x = 3323
integer y = 1996
integer width = 485
integer taborder = 90
end type

event clicked;fermer_fenetre(parent)
end event

type cb_imprimer from uo_picturebutton_390x120 within w_liste_documents_attente_signature_en_ligne
integer x = 2263
integer y = 1996
integer width = 485
integer taborder = 80
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()


end event

type cb_autre from uo_picturebutton_390x120 within w_liste_documents_attente_signature_en_ligne
integer x = 1733
integer y = 1996
integer width = 485
integer taborder = 80
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false
cb_ecran.enabled (true)
cb_imprimer.enabled ( false)
this.enabled ( false)
dw_liste.visible = false
cbx_filtre.visible = false
cb_relancer.enabled ( false )
end event

type cb_ecran from uo_picturebutton_390x120 within w_liste_documents_attente_signature_en_ligne
integer x = 1202
integer y = 1996
integer width = 485
integer taborder = 60
string text = "&Ecran"
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;prepa()
//cb_ecran.enabled (false)
cb_imprimer.enabled ( true)
cb_autre.enabled ( true )
dw_liste.visible = true
cbx_filtre.visible = true

if dw_liste.rowcount() > 0 then 
	cb_relancer.enabled ( true )
end if
end event

type uo_1 from resize_fenetre within w_liste_documents_attente_signature_en_ligne
boolean visible = false
integer x = 2597
integer y = 144
integer taborder = 11
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type st_2 from statictext within w_liste_documents_attente_signature_en_ligne
integer x = 1646
integer y = 1404
integer width = 101
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "au"
boolean focusrectangle = false
end type

type sle_pat from singlelineedit within w_liste_documents_attente_signature_en_ligne
boolean visible = false
integer x = 992
integer y = 684
integer width = 1303
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean enabled = false
boolean autohscroll = false
end type

type rb_tous_pat from radiobutton within w_liste_documents_attente_signature_en_ligne
event clicked pbm_bnclicked
integer x = 361
integer y = 588
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les patients"
boolean checked = true
end type

event clicked;sle_pat.visible = false
end event

type rb_un_pat from radiobutton within w_liste_documents_attente_signature_en_ligne
event clicked pbm_bnclicked
integer x = 361
integer y = 684
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un patient"
end type

event clicked;var_suite = false

open (w_cherche)

if var_suite then
	sle_pat.text = var_nom
	var_code_local = var_code
	sle_pat.visible = true
else
	this.checked = false
	rb_tous_pat.checked = true
end if
end event

type dw_prati from datawindow within w_liste_documents_attente_signature_en_ligne
string tag = "no resizeall"
boolean visible = false
integer x = 1216
integer y = 300
integer width = 873
integer height = 80
integer taborder = 10
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type rb_un from radiobutton within w_liste_documents_attente_signature_en_ligne
integer x = 361
integer y = 288
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

on clicked;rb_tous.checked = false
dw_prati.visible = true
end on

type rb_tous from radiobutton within w_liste_documents_attente_signature_en_ligne
integer x = 361
integer y = 192
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

on clicked;rb_un.checked = false
dw_prati.visible = false
end on

type em_nb from editmask within w_liste_documents_attente_signature_en_ligne
boolean visible = false
integer x = 55
integer y = 2020
integer width = 905
integer height = 100
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

type gb_4 from groupbox within w_liste_documents_attente_signature_en_ligne
integer x = 283
integer y = 1176
integer width = 2121
integer height = 384
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Selon un rendez-vous"
end type

type gb_2 from groupbox within w_liste_documents_attente_signature_en_ligne
integer x = 283
integer y = 508
integer width = 2121
integer height = 304
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du patient"
end type

type gb_1 from groupbox within w_liste_documents_attente_signature_en_ligne
integer x = 283
integer y = 120
integer width = 2121
integer height = 304
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

type em_date_rdv_min from uo_date_calendrier within w_liste_documents_attente_signature_en_ligne
event destroy ( )
integer x = 1143
integer y = 1388
integer taborder = 150
boolean bringtotop = true
end type

on em_date_rdv_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_rdv_max from uo_date_calendrier within w_liste_documents_attente_signature_en_ligne
event destroy ( )
integer x = 1806
integer y = 1396
integer taborder = 160
boolean bringtotop = true
end type

on em_date_rdv_max.destroy
call uo_date_calendrier::destroy
end on

type cbx_filtre from u_cst_togglebutton within w_liste_documents_attente_signature_en_ligne
event destroy ( )
boolean visible = false
integer x = 192
integer y = 1996
integer width = 539
integer height = 92
integer taborder = 60
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event constructor;call super::constructor;cbx_filtre.backcolor = parent.backcolor	

end event

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


end event

type rb_pas_rdv from radiobutton within w_liste_documents_attente_signature_en_ligne
integer x = 361
integer y = 1288
integer width = 558
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
string text = "Pas de sélection"
boolean checked = true
end type

type rb_rdv from radiobutton within w_liste_documents_attente_signature_en_ligne
integer x = 361
integer y = 1400
integer width = 754
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
string text = "Qui ont rendez-vous du"
end type

type em_date_min from uo_date_calendrier within w_liste_documents_attente_signature_en_ligne
event destroy ( )
integer x = 480
integer y = 948
integer taborder = 160
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_1 from statictext within w_liste_documents_attente_signature_en_ligne
integer x = 946
integer y = 956
integer width = 101
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "au"
boolean focusrectangle = false
end type

type em_date_max from uo_date_calendrier within w_liste_documents_attente_signature_en_ligne
event destroy ( )
integer x = 1070
integer y = 948
integer taborder = 170
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type st_3 from statictext within w_liste_documents_attente_signature_en_ligne
integer x = 357
integer y = 956
integer width = 101
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Du"
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_liste_documents_attente_signature_en_ligne
integer x = 283
integer y = 832
integer width = 2121
integer height = 304
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Date du document"
end type

type dw_liste from u_basedw within w_liste_documents_attente_signature_en_ligne
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 14
integer y = 12
integer width = 4178
integer height = 1968
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_liste_documents_en_attente_signature_en_ligne_2023"
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event retrieverow;maj_patience(row,increment)

end event

event rbuttondown;call super::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)

	// FONCTION IDENTIQUE A OpenMenuPatient_Listes sauf qu'on prend un autre menu 
	
	m_patientcourant_signature m
	
	
	//création du menu en mémoire
	m = create m_patientcourant_signature
	
	
	//passe le code du patient qui nous interresse et lance le menu en popup
	m.CodePatientCourant = this.getitemnumber(this.getrow(),"code")
	m.dw_clic = this

	m.PopMenu(this.pointerX(),this.pointerY())
	
	//supression du menu de la mémoire
	destroy m

end if
end event

event doubleclicked;call super::doubleclicked;string v_statut_signature
string v_fichier_pdf

if row > 0 then
	v_statut_signature	= this.getitemstring (row , "historique_editions_statut_signature")
	v_fichier_pdf	= this.getitemstring (row , "historique_editions_nom_courrier")
	var_code_local  = this.getitemnumber(row,"code")

	if v_statut_signature = "A1" or v_statut_signature = "A2" or v_statut_signature = "A3" then

		param_win[1] = v_statut_signature
		param_win[2] = v_fichier_pdf
		param_win[3] = this.getitemstring (row , "historique_editions_code_interne")
		OpenWithParm(w_signature_en_ligne, var_code_local )
	end if
end if
end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;iu_PowerFilter.event ue_positionbuttons()
end event

type cb_relancer from uo_picturebutton_390x120 within w_liste_documents_attente_signature_en_ligne
integer x = 2793
integer y = 1996
integer width = 485
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string text = "&Relancer"
string iconname = "lc_envoi_message_16.png"
end type

event clicked;call super::clicked;openWithParm(w_liste_documents_attente_signature_en_ligne_relance, parent)
end event

