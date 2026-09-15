$PBExportHeader$w_liste_documents_non_lus.srw
forward
global type w_liste_documents_non_lus from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_documents_non_lus
end type
type cb_imprimer from uo_picturebutton_390x120 within w_liste_documents_non_lus
end type
type cb_autre from uo_picturebutton_390x120 within w_liste_documents_non_lus
end type
type cb_ecran from uo_picturebutton_390x120 within w_liste_documents_non_lus
end type
type uo_1 from resize_fenetre within w_liste_documents_non_lus
end type
type st_2 from statictext within w_liste_documents_non_lus
end type
type st_1 from statictext within w_liste_documents_non_lus
end type
type rb_que_editions from radiobutton within w_liste_documents_non_lus
end type
type rb_que_documents from radiobutton within w_liste_documents_non_lus
end type
type sle_pat from singlelineedit within w_liste_documents_non_lus
end type
type rb_tous_pat from radiobutton within w_liste_documents_non_lus
end type
type rb_un_pat from radiobutton within w_liste_documents_non_lus
end type
type dw_prati from datawindow within w_liste_documents_non_lus
end type
type rb_un from radiobutton within w_liste_documents_non_lus
end type
type rb_tous from radiobutton within w_liste_documents_non_lus
end type
type em_nb from editmask within w_liste_documents_non_lus
end type
type gb_4 from groupbox within w_liste_documents_non_lus
end type
type gb_3 from groupbox within w_liste_documents_non_lus
end type
type gb_2 from groupbox within w_liste_documents_non_lus
end type
type gb_1 from groupbox within w_liste_documents_non_lus
end type
type rb_tous_doc from radiobutton within w_liste_documents_non_lus
end type
type em_date_min from uo_date_calendrier within w_liste_documents_non_lus
end type
type em_date_max from uo_date_calendrier within w_liste_documents_non_lus
end type
type cbx_filtre from u_cst_togglebutton within w_liste_documents_non_lus
end type
type dw_liste from u_basedw within w_liste_documents_non_lus
end type
end forward

global type w_liste_documents_non_lus from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 4242
integer height = 2296
string title = "Liste des Documents importants non lus"
windowtype windowtype = child!
long backcolor = 15780518
cb_fermer cb_fermer
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_ecran cb_ecran
uo_1 uo_1
st_2 st_2
st_1 st_1
rb_que_editions rb_que_editions
rb_que_documents rb_que_documents
sle_pat sle_pat
rb_tous_pat rb_tous_pat
rb_un_pat rb_un_pat
dw_prati dw_prati
rb_un rb_un
rb_tous rb_tous
em_nb em_nb
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
rb_tous_doc rb_tous_doc
em_date_min em_date_min
em_date_max em_date_max
cbx_filtre cbx_filtre
dw_liste dw_liste
end type
global w_liste_documents_non_lus w_liste_documents_non_lus

type variables
boolean prepa_faite
double nb_dossier,increment,var_code_local




n_cst_PowerFilter iu_PowerFilter
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,nat_min,nat_max,tit1,tit2,n
double code_min,code_max
date da_min,da_max

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
	
	if rb_tous_doc.checked then 
		// tous
		nat_min = "D"
		nat_max = "E"
		tit2 = "Pour les éditions et les documents"
	else
		if rb_que_documents.checked then 
			nat_min = "D"
			nat_max = "D"
			tit2 = "Pour les documents"
		else
			nat_min = "E"
			nat_max = "E"
			tit2 = "Pour les éditions"
		end if
	end if
	
	
	da_min = date(em_date_min.text)
	da_max =  date(em_date_max.text)

	tit2 = tit2 +" - Du "+em_date_min.text+" au "+em_date_max.text
	
	double max_row
	SELECT count(*) INTO :max_row FROM historique_editions ;

	increment = integer(max_row / 10)

	open(w_patience)
	
	dw_liste.object.Titre1.text = tit1
	dw_liste.object.Titre2.text = tit2

	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,da_min,da_max, nat_min, nat_max)
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

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if

uo_1.taille(this)
cbx_filtre.backcolor = this.backcolor
end event

on w_liste_documents_non_lus.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_ecran=create cb_ecran
this.uo_1=create uo_1
this.st_2=create st_2
this.st_1=create st_1
this.rb_que_editions=create rb_que_editions
this.rb_que_documents=create rb_que_documents
this.sle_pat=create sle_pat
this.rb_tous_pat=create rb_tous_pat
this.rb_un_pat=create rb_un_pat
this.dw_prati=create dw_prati
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.em_nb=create em_nb
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.rb_tous_doc=create rb_tous_doc
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.cbx_filtre=create cbx_filtre
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_autre
this.Control[iCurrent+4]=this.cb_ecran
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.rb_que_editions
this.Control[iCurrent+9]=this.rb_que_documents
this.Control[iCurrent+10]=this.sle_pat
this.Control[iCurrent+11]=this.rb_tous_pat
this.Control[iCurrent+12]=this.rb_un_pat
this.Control[iCurrent+13]=this.dw_prati
this.Control[iCurrent+14]=this.rb_un
this.Control[iCurrent+15]=this.rb_tous
this.Control[iCurrent+16]=this.em_nb
this.Control[iCurrent+17]=this.gb_4
this.Control[iCurrent+18]=this.gb_3
this.Control[iCurrent+19]=this.gb_2
this.Control[iCurrent+20]=this.gb_1
this.Control[iCurrent+21]=this.rb_tous_doc
this.Control[iCurrent+22]=this.em_date_min
this.Control[iCurrent+23]=this.em_date_max
this.Control[iCurrent+24]=this.cbx_filtre
this.Control[iCurrent+25]=this.dw_liste
end on

on w_liste_documents_non_lus.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_ecran)
destroy(this.uo_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_que_editions)
destroy(this.rb_que_documents)
destroy(this.sle_pat)
destroy(this.rb_tous_pat)
destroy(this.rb_un_pat)
destroy(this.dw_prati)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.em_nb)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.rb_tous_doc)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.cbx_filtre)
destroy(this.dw_liste)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_liste_documents_non_lus
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_documents_non_lus
integer x = 2793
integer y = 1996
integer width = 485
integer taborder = 90
end type

event clicked;fermer_fenetre(parent)
end event

type cb_imprimer from uo_picturebutton_390x120 within w_liste_documents_non_lus
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

type cb_autre from uo_picturebutton_390x120 within w_liste_documents_non_lus
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
end event

type cb_ecran from uo_picturebutton_390x120 within w_liste_documents_non_lus
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
end event

type uo_1 from resize_fenetre within w_liste_documents_non_lus
boolean visible = false
integer x = 2597
integer y = 144
integer taborder = 11
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type st_2 from statictext within w_liste_documents_non_lus
integer x = 1221
integer y = 1508
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
string text = "Au"
boolean focusrectangle = false
end type

type st_1 from statictext within w_liste_documents_non_lus
integer x = 512
integer y = 1508
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
string text = "Du"
boolean focusrectangle = false
end type

type rb_que_editions from radiobutton within w_liste_documents_non_lus
event clicked pbm_bnclicked
integer x = 361
integer y = 1084
integer width = 1417
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Uniquement les éditions produites"
end type

type rb_que_documents from radiobutton within w_liste_documents_non_lus
event clicked pbm_bnclicked
integer x = 361
integer y = 1180
integer width = 1147
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Uniquement les documents (acquis)"
end type

type sle_pat from singlelineedit within w_liste_documents_non_lus
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

type rb_tous_pat from radiobutton within w_liste_documents_non_lus
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

type rb_un_pat from radiobutton within w_liste_documents_non_lus
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

type dw_prati from datawindow within w_liste_documents_non_lus
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

type rb_un from radiobutton within w_liste_documents_non_lus
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

type rb_tous from radiobutton within w_liste_documents_non_lus
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

type em_nb from editmask within w_liste_documents_non_lus
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

type gb_4 from groupbox within w_liste_documents_non_lus
integer x = 283
integer y = 1424
integer width = 2121
integer height = 196
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Période"
end type

type gb_3 from groupbox within w_liste_documents_non_lus
integer x = 283
integer y = 884
integer width = 2121
integer height = 436
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du type d~'édition / documents"
end type

type gb_2 from groupbox within w_liste_documents_non_lus
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

type gb_1 from groupbox within w_liste_documents_non_lus
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

type rb_tous_doc from radiobutton within w_liste_documents_non_lus
integer x = 361
integer y = 984
integer width = 1417
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Toutes éditions et tous documents"
boolean checked = true
end type

type em_date_min from uo_date_calendrier within w_liste_documents_non_lus
event destroy ( )
integer x = 672
integer y = 1492
integer taborder = 150
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_documents_non_lus
event destroy ( )
integer x = 1376
integer y = 1492
integer taborder = 160
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type cbx_filtre from u_cst_togglebutton within w_liste_documents_non_lus
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

type dw_liste from u_basedw within w_liste_documents_non_lus
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 14
integer y = 12
integer width = 4178
integer height = 1968
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_liste_documents_non_lus"
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event retrieverow;maj_patience(row,increment)

end event

event rbuttondown;call super::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event doubleclicked;call super::doubleclicked;

// ouvertur du document en reprenant des script existant
m_btdroit_historique m_menu

m_menu = create m_btdroit_historique
m_menu.dw_locale = this
m_menu.var_code_local  = this.getitemnumber(row,"code")
m_menu.w_locale = create w_patient_ged

selectrow(row, true)

m_menu.m_visualiserlecourrier.triggerevent(clicked!)







//
//
//// double clic, comme dans la salle d'attente !!
//
//if row > 0 then
//
//	var_code 				= 	this.getitemnumber(row,"code")
//	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
//	var_nom 				= this.getitemstring(row,"nom")
//	var_nomp 				= ""
//	var_pay 					= ""
//	var_moul 				= ""
//
//	// On n'ouvre pas la salle d'attentre mais la GED !!!!!
//	
//	
//	// Raccourci 
//	uo_raccourci_histo_editions uo_ged
//	
//	uo_ged = create uo_raccourci_histo_editions
//	
//	
//	// Raccourci historique
//	window fenetre_parent, v_fenetre_mdi_mere
//	
//	// On a besoin du nom patient pour la fenetre mere
//	if mdi_patient then
//		uo_ged.init(var_code, var_nom, v_fenetre_mdi_mere)
//	else
//		// Le passage de w_md_patient est inutile .. uniquement pour compatibilité
//		uo_ged.init(var_code, var_nom, v_fenetre_mdi_mere)
//	end if
//
//	if rb_que_editions.checked then 
//		uo_ged.ouvrir_partie("E")
//	else
//		uo_ged.ouvrir_partie("D")
//	end if
//	
//end if
//
end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;iu_PowerFilter.event ue_positionbuttons()
end event

