$PBExportHeader$w_delaire_type_patient.srw
forward
global type w_delaire_type_patient from w_fenetre_arakis
end type
type pb_ok from uo_picturebutton_390x120 within w_delaire_type_patient
end type
type ddlb_classe from dropdownlistbox within w_delaire_type_patient
end type
type ddlb_population from dropdownlistbox within w_delaire_type_patient
end type
type st_3 from statictext within w_delaire_type_patient
end type
type st_4 from statictext within w_delaire_type_patient
end type
end forward

global type w_delaire_type_patient from w_fenetre_arakis
integer width = 1294
integer height = 800
string title = "Création de Patient"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_ok pb_ok
ddlb_classe ddlb_classe
ddlb_population ddlb_population
st_3 st_3
st_4 st_4
end type
global w_delaire_type_patient w_delaire_type_patient

type variables


string v_delaire_ou_tridim 

end variables

on w_delaire_type_patient.create
int iCurrent
call super::create
this.pb_ok=create pb_ok
this.ddlb_classe=create ddlb_classe
this.ddlb_population=create ddlb_population
this.st_3=create st_3
this.st_4=create st_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_ok
this.Control[iCurrent+2]=this.ddlb_classe
this.Control[iCurrent+3]=this.ddlb_population
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_4
end on

on w_delaire_type_patient.destroy
call super::destroy
destroy(this.pb_ok)
destroy(this.ddlb_classe)
destroy(this.ddlb_population)
destroy(this.st_3)
destroy(this.st_4)
end on

event open;call super::open;

// Valeurs par défaut : Classe II Caucasien

ddlb_classe.SelectItem(2)
ddlb_population.SelectItem(2)

end event

type p_fond from w_fenetre_arakis`p_fond within w_delaire_type_patient
end type

type pb_ok from uo_picturebutton_390x120 within w_delaire_type_patient
integer x = 398
integer y = 492
integer width = 411
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Ok"
boolean default = true
end type

event clicked;call super::clicked;
string val_retour

// on se sert de variable globales pour passage de param en rerout


choose case ddlb_classe.text
	Case "Classe III"
		param_win[1] = "CLIII"
	Case "Classe II"
		param_win[1] = "CLII"
	Case "Classe I"
		param_win[1] = "CLI"
end choose


choose case left(ddlb_population.text,3)
	Case "Asi"
		param_win[2] = "Asiatique"
	Case "Cau"
		param_win[2] = "Caucasienne"
	Case "Cen"
		param_win[2] = "CentreAfricaine"
	Case "Méd"
		param_win[2] = "Mediterraneenne"
	Case "Nor"
		param_win[2] = "NordAfricaine"
end choose

Close(parent)
end event

type ddlb_classe from dropdownlistbox within w_delaire_type_patient
integer x = 453
integer y = 28
integer width = 795
integer height = 452
integer taborder = 10
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string item[] = {"Classe I","Classe II","Classe III"}
borderstyle borderstyle = stylelowered!
end type

type ddlb_population from dropdownlistbox within w_delaire_type_patient
integer x = 453
integer y = 236
integer width = 795
integer height = 656
integer taborder = 20
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean sorted = false
string item[] = {"Asiaique","Caucasienne","Centre Africaine","Méditerrannéene","Nord Africaine"}
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_delaire_type_patient
integer x = 101
integer y = 48
integer width = 302
integer height = 80
boolean bringtotop = true
integer textsize = -12
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Classe "
alignment alignment = right!
end type

type st_4 from statictext within w_delaire_type_patient
integer x = 9
integer y = 252
integer width = 393
integer height = 80
boolean bringtotop = true
integer textsize = -12
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Population"
alignment alignment = right!
end type

