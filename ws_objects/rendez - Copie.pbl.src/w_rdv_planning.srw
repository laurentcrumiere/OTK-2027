$PBExportHeader$w_rdv_planning.srw
forward
global type w_rdv_planning from w_fenetre_arakis
end type
type em_date from uo_date_calendrier within w_rdv_planning
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_rdv_planning
end type
type cb_ecran from uo_picturebutton_390x120 within w_rdv_planning
end type
type cb_imprimer from uo_picturebutton_390x120 within w_rdv_planning
end type
type cb_autre from uo_picturebutton_390x120 within w_rdv_planning
end type
type st_2 from statictext within w_rdv_planning
end type
type st_1 from statictext within w_rdv_planning
end type
type em_faut_max from editmask within w_rdv_planning
end type
type em_faut_min from editmask within w_rdv_planning
end type
type em_nb from editmask within w_rdv_planning
end type
type dw_prati from datawindow within w_rdv_planning
end type
type rb_un from radiobutton within w_rdv_planning
end type
type rb_tous from radiobutton within w_rdv_planning
end type
type st_min from statictext within w_rdv_planning
end type
type gb_1 from groupbox within w_rdv_planning
end type
type uo_1 from resize_fenetre within w_rdv_planning
end type

type pb_prec from uo_picturebutton_transparent within w_rdv_planning
end type
type pb_suiv from uo_picturebutton_transparent within w_rdv_planning
end type
type cbx_filtre from u_cst_togglebutton within w_rdv_planning
end type
type em_date2 from uo_date_calendrier within w_rdv_planning
end type
type st_au from statictext within w_rdv_planning
end type
type dw_liste from u_basedw within w_rdv_planning
end type
end forward

global type w_rdv_planning from w_fenetre_arakis
integer x = 23
integer y = 200
integer width = 3657
integer height = 1952
string title = "Planning d~'une journée"
windowtype windowtype = child!
long backcolor = 15780518
em_date em_date
cb_fermer cb_fermer
cb_ecran cb_ecran
cb_imprimer cb_imprimer
cb_autre cb_autre
st_2 st_2
st_1 st_1
em_faut_max em_faut_max
em_faut_min em_faut_min
em_nb em_nb
dw_prati dw_prati
rb_un rb_un
rb_tous rb_tous
st_min st_min
gb_1 gb_1
uo_1 uo_1
pb_prec pb_prec
pb_suiv pb_suiv
cbx_filtre cbx_filtre
em_date2 em_date2
st_au st_au
dw_liste dw_liste
end type
global w_rdv_planning w_rdv_planning

type variables
boolean prepa_faite
double nb_dossier


n_cst_PowerFilter iu_PowerFilter
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
date var_date,v_da, var_date2
integer cpt,f_min,f_max

	SetPointer(HourGlass!)	//pour faire patienter
	prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	var_date = date(em_date.text)
	var_date2 = date(em_date2.text)
	f_min = integer(em_faut_min.text)
	f_max = integer(em_faut_max.text)

	string v_souligner_adultes
	v_souligner_adultes = profilestring(dir_ini+"orthokis.ini","admini","souligner_adultes","N")

	
	// Conservation ou pas de tous les rdv ... uniquement sur le planning, par sur les descendants
	if this.title = "Planning d'une journée" then
		if profilestring(dir_ini+inifile_orthokis,"rendez-vous","conservation_rdv_planning","N") = "N" then
			// on élimine les rdv éliminés de l'agenda
			dw_liste.setfilter("elimine_agenda = 'N'")
			dw_liste.filter()
		else
			dw_liste.setfilter("")
			dw_liste.filter()
		end if
	end if
	
	
	dw_liste.retrieve(pra_min,pra_max,var_date,var_date2,f_min,f_max, v_souligner_adultes)

	//em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
	//em_nb.visible = true
	SetPointer(Arrow!)	//on remet le pointer normal
	cbx_filtre.visible = true


end subroutine

event open;call super::open;
em_date.setDate(today())
em_date2.setDate(today())
em_faut_max.text = "99"
dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()


if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if

cbx_filtre.backcolor = this.backcolor

uo_1.taille(this)


end event

on w_rdv_planning.create
int iCurrent
call super::create
this.em_date=create em_date
this.cb_fermer=create cb_fermer
this.cb_ecran=create cb_ecran
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.st_2=create st_2
this.st_1=create st_1
this.em_faut_max=create em_faut_max
this.em_faut_min=create em_faut_min
this.em_nb=create em_nb
this.dw_prati=create dw_prati
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.st_min=create st_min
this.gb_1=create gb_1
this.uo_1=create uo_1
this.pb_prec=create pb_prec
this.pb_suiv=create pb_suiv
this.cbx_filtre=create cbx_filtre
this.em_date2=create em_date2
this.st_au=create st_au
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date
this.Control[iCurrent+2]=this.cb_fermer
this.Control[iCurrent+3]=this.cb_ecran
this.Control[iCurrent+4]=this.cb_imprimer
this.Control[iCurrent+5]=this.cb_autre
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.em_faut_max
this.Control[iCurrent+9]=this.em_faut_min
this.Control[iCurrent+10]=this.em_nb
this.Control[iCurrent+11]=this.dw_prati
this.Control[iCurrent+12]=this.rb_un
this.Control[iCurrent+13]=this.rb_tous
this.Control[iCurrent+14]=this.st_min
this.Control[iCurrent+15]=this.gb_1
this.Control[iCurrent+16]=this.uo_1
this.Control[iCurrent+17]=this.pb_prec
this.Control[iCurrent+18]=this.pb_suiv
this.Control[iCurrent+19]=this.cbx_filtre
this.Control[iCurrent+20]=this.em_date2
this.Control[iCurrent+21]=this.st_au
this.Control[iCurrent+22]=this.dw_liste
end on

on w_rdv_planning.destroy
call super::destroy
destroy(this.em_date)
destroy(this.cb_fermer)
destroy(this.cb_ecran)
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_faut_max)
destroy(this.em_faut_min)
destroy(this.em_nb)
destroy(this.dw_prati)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.st_min)
destroy(this.gb_1)
destroy(this.uo_1)
destroy(this.pb_prec)
destroy(this.pb_suiv)
destroy(this.cbx_filtre)
destroy(this.em_date2)
destroy(this.st_au)
destroy(this.dw_liste)
end on

event resize;call super::resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_rdv_planning
end type

type em_date from uo_date_calendrier within w_rdv_planning
integer x = 2395
integer y = 20
integer taborder = 20
end type

on em_date.destroy
call uo_date_calendrier::destroy
end on

type cb_fermer from uo_picturebutton_390x120_fermer within w_rdv_planning
integer x = 2779
integer y = 1692
integer width = 480
integer taborder = 50
end type

event clicked;fermer_fenetre(parent)
end event

type cb_ecran from uo_picturebutton_390x120 within w_rdv_planning
integer x = 1801
integer y = 1692
integer width = 480
integer taborder = 40
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;prepa()

cb_imprimer.default (true)
dw_liste.visible = true
cb_autre.enabled ( true )

pb_suiv.visible = true
pb_prec.visible = true

composant_visible_selon_tag(parent , "a masquer", false)

end event

type cb_imprimer from uo_picturebutton_390x120 within w_rdv_planning
integer x = 2290
integer y = 1692
integer width = 480
integer taborder = 40
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;//prepa()
dw_liste.print()


end event

type cb_autre from uo_picturebutton_390x120 within w_rdv_planning
integer x = 1312
integer y = 1692
integer width = 480
integer taborder = 40
boolean enabled = false
string text = "Autre &Date"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false
cb_ecran.enabled (true)
cb_ecran.default(true)
cb_imprimer.default = false
dw_liste.visible = false
em_nb.visible = false
em_date.setfocus()
this.enabled ( false)
composant_visible_selon_tag(parent , "a masquer", true)

pb_suiv.visible = false
pb_prec.visible = false
cbx_filtre.visible = false
end event

type st_2 from statictext within w_rdv_planning
integer x = 2395
integer y = 236
integer width = 119
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "A"
alignment alignment = center!
end type

type st_1 from statictext within w_rdv_planning
integer x = 2153
integer y = 136
integer width = 375
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Fauteuil N°"
alignment alignment = center!
end type

type em_faut_max from editmask within w_rdv_planning
integer x = 2533
integer y = 224
integer width = 247
integer height = 88
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~99"
end type

type em_faut_min from editmask within w_rdv_planning
integer x = 2533
integer y = 120
integer width = 247
integer height = 88
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~99"
end type

type em_nb from editmask within w_rdv_planning
boolean visible = false
integer x = 9
integer y = 856
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

type dw_prati from datawindow within w_rdv_planning
string tag = "no resizeall"
boolean visible = false
integer x = 969
integer y = 192
integer width = 869
integer height = 80
integer taborder = 90
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type rb_un from radiobutton within w_rdv_planning
integer x = 183
integer y = 192
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

type rb_tous from radiobutton within w_rdv_planning
integer x = 183
integer y = 96
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

type st_min from statictext within w_rdv_planning
string tag = "a masquer"
integer x = 2213
integer y = 32
integer width = 146
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date"
end type

type gb_1 from groupbox within w_rdv_planning
integer x = 18
integer y = 16
integer width = 2121
integer height = 304
integer taborder = 10
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

type uo_1 from resize_fenetre within w_rdv_planning
boolean visible = false
integer x = 581
integer y = 660
integer taborder = 71
boolean bringtotop = true
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type pb_prec from uo_picturebutton_transparent within w_rdv_planning
boolean visible = false
integer x = 869
integer y = 1688
integer taborder = 20
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-G.png"
string powertiptext = "Jour précédent (où vous avez saisi des rendez-vous)"
end type

event clicked;call super::clicked;// on passe au jour précédent !!!

// Si pas de rdv, on continue dans la limite de 50 jour

long nb_jours_limite = 50
boolean fin = false

do while not fin 

	em_date.setdate( relativedate(date(em_date.text), -1)  )
	em_date2.setdate( relativedate(date(em_date2.text), -1)  )
	
	prepa_faite = false
	prepa()
	
	if dw_liste.rowcount() > 0  or date(em_date.text) < relativedate(today(), - nb_jours_limite) then
		fin = true
	end if
	
loop
 

end event

type pb_suiv from uo_picturebutton_transparent within w_rdv_planning
boolean visible = false
integer x = 1070
integer y = 1688
integer taborder = 30
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-D.png"
string powertiptext = "Jour suivant (où vous avez saisi des rendez-vous)"
end type

event clicked;call super::clicked;
// on passe au jours suivant !!!
// Si pas de rdv, on continue dans la limite de 50 jour

long nb_jours_limite = 50
boolean fin = false

do while not fin 

	em_date.setdate( relativedate(date(em_date.text), 1)  )
	em_date2.setdate( relativedate(date(em_date2.text), 1)  )

	prepa_faite = false
	prepa()
	
	if dw_liste.rowcount() > 0  or date(em_date.text) > relativedate(today(),nb_jours_limite) then
		fin = true
	end if
	
loop
 

end event

type cbx_filtre from u_cst_togglebutton within w_rdv_planning
event destroy ( )
boolean visible = false
integer x = 82
integer y = 1704
integer width = 718
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

type em_date2 from uo_date_calendrier within w_rdv_planning
integer x = 3090
integer y = 20
integer taborder = 30
boolean bringtotop = true
end type

on em_date2.destroy
call uo_date_calendrier::destroy
end on

type st_au from statictext within w_rdv_planning
integer x = 2912
integer y = 32
integer width = 133
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "au"
boolean focusrectangle = false
end type

type dw_liste from u_basedw within w_rdv_planning
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 32
integer y = 8
integer width = 3570
integer height = 1672
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_rdv_planning"
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

event doubleclicked;call super::doubleclicked;

// double clic, comme dans la salle d'attente !!

if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
	var_nom 				= this.getitemstring(row,"patient_nom")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
end if

end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

