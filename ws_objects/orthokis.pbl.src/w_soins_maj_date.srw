$PBExportHeader$w_soins_maj_date.srw
forward
global type w_soins_maj_date from window
end type
type cb_fermer from uo_picturebutton_390x120 within w_soins_maj_date
end type
type st_4 from statictext within w_soins_maj_date
end type
type st_3 from statictext within w_soins_maj_date
end type
type st_2 from statictext within w_soins_maj_date
end type
type cbx_debut_traitement from checkbox within w_soins_maj_date
end type
type cbx_demande from checkbox within w_soins_maj_date
end type
type st_1 from statictext within w_soins_maj_date
end type
end forward

global type w_soins_maj_date from window
integer width = 2318
integer height = 1136
boolean titlebar = true
string title = "Mise à jour de dates"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
cb_fermer cb_fermer
st_4 st_4
st_3 st_3
st_2 st_2
cbx_debut_traitement cbx_debut_traitement
cbx_demande cbx_demande
st_1 st_1
end type
global w_soins_maj_date w_soins_maj_date

type variables
double var_code_local

date v_date_demande, v_date_traitement
end variables

event open;

centrer(this)

var_code_local = message.doubleparm


st_1.text = st_1.text + " "+string(v_date)

select date_prem_demande , debut_traitement into :v_date_demande, :v_date_traitement from patient where code = :var_code_local ;


st_2.text = st_2.text + " "+string(v_date_demande)
st_3.text = st_3.text + " "+string(v_date_traitement)


end event

on w_soins_maj_date.create
this.cb_fermer=create cb_fermer
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.cbx_debut_traitement=create cbx_debut_traitement
this.cbx_demande=create cbx_demande
this.st_1=create st_1
this.Control[]={this.cb_fermer,&
this.st_4,&
this.st_3,&
this.st_2,&
this.cbx_debut_traitement,&
this.cbx_demande,&
this.st_1}
end on

on w_soins_maj_date.destroy
destroy(this.cb_fermer)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cbx_debut_traitement)
destroy(this.cbx_demande)
destroy(this.st_1)
end on

type cb_fermer from uo_picturebutton_390x120 within w_soins_maj_date
integer x = 809
integer y = 856
integer width = 498
integer taborder = 20
string text = "&Ok"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;

if cbx_demande.checked then
  	UPDATE "patient"   	SET "date_prem_demande" = :v_date   	WHERE code = :var_code_local   ;
	commit ;
end if


if cbx_debut_traitement.checked then
  	UPDATE "patient"   	SET "debut_traitement" = :v_date   	WHERE code = :var_code_local   ;
	commit ;
end if


close(parent)
end event

type st_4 from statictext within w_soins_maj_date
integer x = 46
integer y = 716
integer width = 1522
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Si vous ne cochez rien, aucune date ne sera mise à jour."
boolean focusrectangle = false
end type

type st_3 from statictext within w_soins_maj_date
integer x = 1102
integer y = 548
integer width = 905
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Valeur actuelle :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_soins_maj_date
integer x = 1102
integer y = 368
integer width = 960
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Valeur actuelle :"
boolean focusrectangle = false
end type

type cbx_debut_traitement from checkbox within w_soins_maj_date
integer x = 165
integer y = 536
integer width = 818
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Date de début de traitement"
end type

type cbx_demande from checkbox within w_soins_maj_date
integer x = 165
integer y = 368
integer width = 795
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Date de première demande"
end type

type st_1 from statictext within w_soins_maj_date
integer x = 64
integer y = 116
integer width = 2048
integer height = 176
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Si vous le souhaitez, vous pouvez mettre à jour les dates suivantes (en les cochant) au "
boolean focusrectangle = false
end type

