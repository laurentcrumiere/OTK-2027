$PBExportHeader$w_efacturation_belgique_reglements.srw
forward
global type w_efacturation_belgique_reglements from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_efacturation_belgique_reglements
end type
type cb_autre from uo_picturebutton_390x120 within w_efacturation_belgique_reglements
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_efacturation_belgique_reglements
end type
type cb_ecran from uo_picturebutton_390x120 within w_efacturation_belgique_reglements
end type
type uo_size from resize_fenetre within w_efacturation_belgique_reglements
end type
type em_nb from editmask within w_efacturation_belgique_reglements
end type
type cbx_filtre from u_cst_togglebutton within w_efacturation_belgique_reglements
end type
type st_1 from statictext within w_efacturation_belgique_reglements
end type
type st_3 from statictext within w_efacturation_belgique_reglements
end type
type em_date_min from uo_date_calendrier within w_efacturation_belgique_reglements
end type
type st_2 from statictext within w_efacturation_belgique_reglements
end type
type em_date_max from uo_date_calendrier within w_efacturation_belgique_reglements
end type
type dw_oa from datawindow within w_efacturation_belgique_reglements
end type
type dw_prati from datawindow within w_efacturation_belgique_reglements
end type
type cbx_detail_facture from checkbox within w_efacturation_belgique_reglements
end type
type st_4 from statictext within w_efacturation_belgique_reglements
end type
type st_5 from statictext within w_efacturation_belgique_reglements
end type
type gb_4 from groupbox within w_efacturation_belgique_reglements
end type
type dw_liste from u_basedw within w_efacturation_belgique_reglements
end type
end forward

global type w_efacturation_belgique_reglements from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3781
integer height = 2132
string title = "Historique des envois"
windowtype windowtype = child!
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_fermer cb_fermer
cb_ecran cb_ecran
uo_size uo_size
em_nb em_nb
cbx_filtre cbx_filtre
st_1 st_1
st_3 st_3
em_date_min em_date_min
st_2 st_2
em_date_max em_date_max
dw_oa dw_oa
dw_prati dw_prati
cbx_detail_facture cbx_detail_facture
st_4 st_4
st_5 st_5
gb_4 gb_4
dw_liste dw_liste
end type
global w_efacturation_belgique_reglements w_efacturation_belgique_reglements

type variables
boolean prepa_faite
double increment	
double nb_dossier

double min, max,max_row

n_cst_PowerFilter iu_PowerFilter

// pour les liste avec possibilité de sélectionner les patients ...
boolean tout_selectionne  = true



string oa_min, oa_max, statut_min, statut_max, v_nom_praticien, pra_min, pra_max

end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();
date date_min, date_max
integer index_statut
string tit, texte_statut

if not prepa_faite then
	
	pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
	SELECT nom INTO :v_nom_praticien FROM prati WHERE code = :pra_min ;
	tit = "Pour le Dr "+v_nom_praticien


	oa_min=dw_oa.gettext()
	tit = tit +  " - Pour l'OA : " + oa_min

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
	open(w_patience)
	
	dw_liste.object.sous_titre.text = tit
	dw_liste.retrieve(oa_min, pra_min, date_min, date_max )
	
	
	close(w_patience)


end if

end subroutine

on w_efacturation_belgique_reglements.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.cb_ecran=create cb_ecran
this.uo_size=create uo_size
this.em_nb=create em_nb
this.cbx_filtre=create cbx_filtre
this.st_1=create st_1
this.st_3=create st_3
this.em_date_min=create em_date_min
this.st_2=create st_2
this.em_date_max=create em_date_max
this.dw_oa=create dw_oa
this.dw_prati=create dw_prati
this.cbx_detail_facture=create cbx_detail_facture
this.st_4=create st_4
this.st_5=create st_5
this.gb_4=create gb_4
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_autre
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.cb_ecran
this.Control[iCurrent+5]=this.uo_size
this.Control[iCurrent+6]=this.em_nb
this.Control[iCurrent+7]=this.cbx_filtre
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.em_date_min
this.Control[iCurrent+11]=this.st_2
this.Control[iCurrent+12]=this.em_date_max
this.Control[iCurrent+13]=this.dw_oa
this.Control[iCurrent+14]=this.dw_prati
this.Control[iCurrent+15]=this.cbx_detail_facture
this.Control[iCurrent+16]=this.st_4
this.Control[iCurrent+17]=this.st_5
this.Control[iCurrent+18]=this.gb_4
this.Control[iCurrent+19]=this.dw_liste
end on

on w_efacturation_belgique_reglements.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_fermer)
destroy(this.cb_ecran)
destroy(this.uo_size)
destroy(this.em_nb)
destroy(this.cbx_filtre)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.st_2)
destroy(this.em_date_max)
destroy(this.dw_oa)
destroy(this.dw_prati)
destroy(this.cbx_detail_facture)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.gb_4)
destroy(this.dw_liste)
end on

event open;call super::open;
open(w_patience)

uo_size.taille(this)

em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

dw_liste.settransobject(sqlca)

dw_oa.settransobject(sqlca)
dw_oa.retrieve()



prepa_faite = false

cbx_filtre.backcolor = this.backcolor



close(w_patience)




end event

event resize;

uo_size.retaille(this)

// repositionnement 
//cbx_filtre.x = gb_filtre.x + 19
//cbx_filtre.y = gb_filtre.y + 55
//

// pour qu'il se resize mais ... pas trop 
cbx_filtre.y = cb_ecran.y
cbx_filtre.height = min(cbx_filtre.height, cb_ecran.height)
cbx_filtre.width  =  min(800, cb_ecran.x - cbx_filtre.x - 30)
end event

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_reglements
end type

type cb_imprimer from uo_picturebutton_390x120 within w_efacturation_belgique_reglements
integer x = 2263
integer y = 1868
integer width = 457
integer taborder = 130
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_efacturation_belgique_reglements
integer x = 1774
integer y = 1868
integer width = 457
integer taborder = 140
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false

this.enabled (false)
cb_imprimer.enabled( false )
cb_ecran.enabled ( true)
cb_ecran.default ( true)

dw_liste.visible = false

cbx_filtre.visible = false

end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_efacturation_belgique_reglements
integer x = 3246
integer y = 1868
integer width = 457
integer taborder = 10
end type

event clicked;fermer_fenetre(parent)
end event

type cb_ecran from uo_picturebutton_390x120 within w_efacturation_belgique_reglements
integer x = 626
integer y = 1868
integer width = 457
integer taborder = 60
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;
// On enlève la liste le temps du chargement - surtout pour une 2ème fois
dw_liste.visible = false

// pour les excités des clics
cb_fermer.enabled(false)
prepa()
// pour les excités des clics
cb_fermer.enabled(true)


if ui_v2020 then
	// pour qu'il redessinne correctement le bouton
	//cb_autre.default = true
	SetRedraw(true)
end if

cb_imprimer.enabled ( true)
cb_autre.enabled ( true )
cb_imprimer.default ( true )

dw_liste.visible = true


if cbx_filtre.tag <> "no visible" then
	cbx_filtre.visible = true
end if


end event

type uo_size from resize_fenetre within w_efacturation_belgique_reglements
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 20
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type em_nb from editmask within w_efacturation_belgique_reglements
boolean visible = false
integer x = 23
integer y = 1700
integer width = 498
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

type cbx_filtre from u_cst_togglebutton within w_efacturation_belgique_reglements
event destroy ( )
boolean visible = false
integer x = 18
integer y = 1888
integer width = 425
integer height = 92
integer taborder = 90
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


end event

event constructor;call super::constructor;cbx_filtre.backcolor = couleur_fond_fenetre

end event

type st_1 from statictext within w_efacturation_belgique_reglements
integer x = 315
integer y = 648
integer width = 544
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date d~'envoi :"
end type

type st_3 from statictext within w_efacturation_belgique_reglements
integer x = 443
integer y = 772
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

type em_date_min from uo_date_calendrier within w_efacturation_belgique_reglements
integer x = 850
integer y = 752
integer taborder = 160
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type st_2 from statictext within w_efacturation_belgique_reglements
integer x = 1376
integer y = 772
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

type em_date_max from uo_date_calendrier within w_efacturation_belgique_reglements
integer x = 1659
integer y = 752
integer taborder = 170
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type dw_oa from datawindow within w_efacturation_belgique_reglements
string tag = "position brush"
integer x = 553
integer y = 412
integer width = 1984
integer height = 76
integer taborder = 110
boolean bringtotop = true
string dataobject = "dw_cherche_organismes_assureurs_belgique_ddlb"
boolean border = false
end type

type dw_prati from datawindow within w_efacturation_belgique_reglements
string tag = "position brush"
integer x = 699
integer y = 224
integer width = 859
integer height = 76
integer taborder = 120
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type cbx_detail_facture from checkbox within w_efacturation_belgique_reglements
string tag = "no resize"
integer x = 1198
integer y = 1916
integer width = 471
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Détail Patients"
borderstyle borderstyle = styleraised!
end type

event clicked;if checked then
	dw_liste.object.datawindow.detail.height = 84
else
	dw_liste.object.datawindow.detail.height = 0
end if

end event

type st_4 from statictext within w_efacturation_belgique_reglements
integer x = 315
integer y = 232
integer width = 338
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Praticien : "
boolean focusrectangle = false
end type

type st_5 from statictext within w_efacturation_belgique_reglements
integer x = 315
integer y = 416
integer width = 197
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "O.A. :"
boolean focusrectangle = false
end type

type gb_4 from groupbox within w_efacturation_belgique_reglements
string tag = "no resize"
integer x = 1166
integer y = 1856
integer width = 594
integer height = 168
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 15780518
borderstyle borderstyle = styleraised!
end type

type dw_liste from u_basedw within w_efacturation_belgique_reglements
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 27
integer y = 16
integer width = 3707
integer height = 1824
integer taborder = 40
boolean bringtotop = true
string dataobject = "dw_efacturation_belgique_envois_reglements"
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event retrieverow;call super::retrieverow;
//if mod(row , 10) = 0 then 
//	// pour voir l'animation de patience !!!
//	yield()
//end if
end event

event doubleclicked;call super::doubleclicked;long l_numero_facture

l_numero_facture = this.getitemnumber(row,"efacture_belgique_numero_facture")

//param_win[1] = "C"
//openwithparm(w_efacturation_belgique_maj, l_numero_facture)


// Consultation de la facture
param_win[1] = "C"
// type de facture
param_win[2] = this.getitemString(row,"efacture_belgique_type_facture")

openwithparm(w_efacturation_belgique_maj, l_numero_facture)

end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;if isvalid (iu_PowerFilter) then
	// Is valid car si on utilise les thèmes ... ça merde
	iu_PowerFilter.event ue_positionbuttons()
end if
end event

event buttonclicked;call super::buttonclicked;

// renvoi effectif de l'envoi

if row > 0 then 
	string ls_object 
	boolean lb_ok_suite = true
	ls_Object = String(dwo.name)
	
	string v_code_praticien, v_code_oa
	integer v_numero_envoi , v_cpt
	date v_date_envoi, v_date_envoi_nouvelle
	
	v_code_praticien = getitemString(row, "code_praticien")
	v_code_oa =  getitemString(row, "code_oa")
	v_numero_envoi =  getitemNumber(row, "numero_envoi")
	v_date_envoi =  getitemDate(row, "date_envoi")

	
	choose case ls_object

		case "b_paye"
			// Paiement de l'envoi
			param_win[1] = v_code_praticien
			param_win[2] = v_code_oa
			param_win[3] = string(v_date_envoi)
			param_win[4] = string(v_numero_envoi)
			
			//open(w_efacturation_belgique_reglements_factures)
			guo_fenetre_modale.wf_ouvrir(w_efacturation_belgique_reglements_factures)

			if message.doubleparm = 1 then 
				// il y a eu des saisies => actualisation de la liste
				cb_ecran.postevent(clicked!)
			end if
			
	end choose
end if
end event

