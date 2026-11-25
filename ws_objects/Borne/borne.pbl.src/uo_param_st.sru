$PBExportHeader$uo_param_st.sru
forward
global type uo_param_st from userobject
end type
type pb_modifier_police from uo_picturebutton_390x120 within uo_param_st
end type
type st_police from statictext within uo_param_st
end type
type st_couleur from statictext within uo_param_st
end type
type cb_2 from commandbutton within uo_param_st
end type
type ddlb_position from dropdownlistbox within uo_param_st
end type
type st_9 from statictext within uo_param_st
end type
type cbx_italique from checkbox within uo_param_st
end type
type cbx_gras from checkbox within uo_param_st
end type
type em_taille from editmask within uo_param_st
end type
type st_5 from statictext within uo_param_st
end type
type st_4 from statictext within uo_param_st
end type
type mle_texte from multilineedit within uo_param_st
end type
end forward

global type uo_param_st from userobject
integer width = 3703
integer height = 596
long backcolor = 15780518
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_modifier_police pb_modifier_police
st_police st_police
st_couleur st_couleur
cb_2 cb_2
ddlb_position ddlb_position
st_9 st_9
cbx_italique cbx_italique
cbx_gras cbx_gras
em_taille em_taille
st_5 st_5
st_4 st_4
mle_texte mle_texte
end type
global uo_param_st uo_param_st

type variables


statictext st_param



end variables

forward prototypes
public subroutine charger (string zone_de_texte, string texte_par_defaut)
public subroutine sauver (string zone_de_texte)
end prototypes

public subroutine charger (string zone_de_texte, string texte_par_defaut);// Fenêtre de bienvenue
string v_texte
v_texte = ProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_texte",texte_par_defaut)
v_texte = remplace(v_texte,"char(13)",char(13))
v_texte = remplace(v_texte,"char(10)",char(10))

mle_texte.text = v_texte

em_taille.text = ProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_taille","48")

if ProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_gras","N") = 'O' then
	cbx_gras.checked = true
else
	cbx_gras.checked = false
end if

if ProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_italique","N") = 'O' then
	cbx_italique.checked = true
else
	cbx_italique.checked = false
end if

ddlb_position.selectitem(ProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_position","Cent"),1)
//ddlb_police.selectitem(ProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_police","Forte"),1)

st_police.text = ProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_police","Comic Sans MS")

long couleur
couleur = long (ProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_couleur","0") )
st_couleur.BackColor = couleur

appliquer_police( mle_texte, st_police.text, integer(em_taille.text), cbx_gras.checked, cbx_italique.checked, ddlb_position.text, couleur)

end subroutine

public subroutine sauver (string zone_de_texte);
// Fenêtre de bienvenue

// faut virer les retours à la ligne !!!
string v_texte
v_texte = remplace(mle_texte.text,char(10),"char(10)")
v_texte = remplace(v_texte,char(13),"char(13)")

SetProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_texte",v_texte)


SetProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_taille",em_taille.text)

if cbx_gras.checked then
	SetProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_gras","O")
else
	SetProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_gras","N")
end if
if cbx_italique.checked then
	SetProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_italique","O")
else
	SetProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_italique","N")
end if
SetProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_position",ddlb_position.text)
//SetProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_police",ddlb_police.text)
SetProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_police",st_police.text)
SetProfileString (dir_ini+"orthokis.ini","Borne","st_"+zone_de_texte+"_couleur",string(st_couleur.backcolor))


end subroutine

on uo_param_st.create
this.pb_modifier_police=create pb_modifier_police
this.st_police=create st_police
this.st_couleur=create st_couleur
this.cb_2=create cb_2
this.ddlb_position=create ddlb_position
this.st_9=create st_9
this.cbx_italique=create cbx_italique
this.cbx_gras=create cbx_gras
this.em_taille=create em_taille
this.st_5=create st_5
this.st_4=create st_4
this.mle_texte=create mle_texte
this.Control[]={this.pb_modifier_police,&
this.st_police,&
this.st_couleur,&
this.cb_2,&
this.ddlb_position,&
this.st_9,&
this.cbx_italique,&
this.cbx_gras,&
this.em_taille,&
this.st_5,&
this.st_4,&
this.mle_texte}
end on

on uo_param_st.destroy
destroy(this.pb_modifier_police)
destroy(this.st_police)
destroy(this.st_couleur)
destroy(this.cb_2)
destroy(this.ddlb_position)
destroy(this.st_9)
destroy(this.cbx_italique)
destroy(this.cbx_gras)
destroy(this.em_taille)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.mle_texte)
end on

event constructor;

//pb_modifier_police.PictureName =  "pb_390_120.JPG"
end event

type pb_modifier_police from uo_picturebutton_390x120 within uo_param_st
integer x = 2967
integer y = 428
integer width = 654
integer taborder = 40
string text = "Modifier Police"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;// choose font

n_choosefont ln_cf

If ln_cf.of_ChooseFont(w_config, st_police.text, long(em_taille.Text), st_couleur.BackColor) Then
	
//	// Mémoi dans les cases !!!
	st_police.Text	= ln_cf.iFaceName
	//em_taille.Text	= string(ln_cf.iTextSize)
	st_couleur.BackColor	= ln_cf.iTextColor
	if ln_cf.iItalic then
		cbx_italique.checked	= true
	else
		cbx_italique.checked	= false
	end if
//	if ln_cf.iUnderline then
//		tab_1.tabpage_divers.cbx_rtf_souligne_police.checked	= true
//	else
//		tab_1.tabpage_divers.cbx_rtf_souligne_police.checked	= false
//	end if
	if ln_cf.iBold then
		cbx_gras.checked	= true
	else
		cbx_gras.checked	= false
	end if
	
	appliquer_police( mle_texte, st_police.text, integer(em_taille.text), cbx_gras.checked, cbx_italique.checked, ddlb_position.text, st_couleur.backcolor)

End If

end event

type st_police from statictext within uo_param_st
string tag = "nobackcolor"
integer x = 242
integer y = 460
integer width = 453
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type st_couleur from statictext within uo_param_st
string tag = "nobackcolor"
integer x = 2464
integer y = 460
integer width = 206
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean border = true
boolean focusrectangle = false
end type

type cb_2 from commandbutton within uo_param_st
integer x = 2683
integer y = 460
integer width = 192
integer height = 80
integer taborder = 30
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
end type

event clicked;long couleur_choisie

//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	st_couleur.backcolor = couleur_choisie
end if

appliquer_police( mle_texte, st_police.text, integer(em_taille.text), cbx_gras.checked, cbx_italique.checked, ddlb_position.text, st_couleur.backcolor)

end event

type ddlb_position from dropdownlistbox within uo_param_st
integer x = 1993
integer y = 452
integer width = 457
integer height = 460
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string item[] = {"Gauche","Centré","Droite"}
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;appliquer_police( mle_texte, st_police.text, integer(em_taille.text), cbx_gras.checked, cbx_italique.checked, ddlb_position.text, st_couleur.backcolor)

end event

type st_9 from statictext within uo_param_st
integer x = 1723
integer y = 468
integer width = 265
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Position :"
boolean focusrectangle = false
end type

type cbx_italique from checkbox within uo_param_st
integer x = 1426
integer y = 460
integer width = 270
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Italique"
end type

event clicked;appliquer_police( mle_texte, st_police.text, integer(em_taille.text), cbx_gras.checked, cbx_italique.checked, ddlb_position.text, st_couleur.backcolor)

end event

type cbx_gras from checkbox within uo_param_st
integer x = 1189
integer y = 464
integer width = 229
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Gras"
end type

event clicked;appliquer_police( mle_texte, st_police.text, integer(em_taille.text), cbx_gras.checked, cbx_italique.checked, ddlb_position.text, st_couleur.backcolor)

end event

type em_taille from editmask within uo_param_st
integer x = 887
integer y = 460
integer width = 265
integer height = 84
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
borderstyle borderstyle = stylelowered!
string mask = "###"
boolean spin = true
double increment = 1
end type

event modified;appliquer_police( mle_texte, st_police.text, integer(em_taille.text), cbx_gras.checked, cbx_italique.checked, ddlb_position.text, st_couleur.backcolor)

end event

type st_5 from statictext within uo_param_st
integer x = 704
integer y = 468
integer width = 197
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Taille :"
boolean focusrectangle = false
end type

type st_4 from statictext within uo_param_st
integer x = 18
integer y = 468
integer width = 219
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Police :"
boolean focusrectangle = false
end type

type mle_texte from multilineedit within uo_param_st
integer x = 18
integer y = 12
integer width = 3648
integer height = 404
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

