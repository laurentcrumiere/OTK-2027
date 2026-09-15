$PBExportHeader$w_confidentiel_soiron.srw
forward
global type w_confidentiel_soiron from window
end type
type mle_confiden from multilineedit within w_confidentiel_soiron
end type
type uo_1 from resize_fenetre within w_confidentiel_soiron
end type
type cb_3 from commandbutton within w_confidentiel_soiron
end type
type cb_2 from commandbutton within w_confidentiel_soiron
end type
type cb_1 from commandbutton within w_confidentiel_soiron
end type
type gb_5 from groupbox within w_confidentiel_soiron
end type
end forward

global type w_confidentiel_soiron from window
integer x = 37
integer y = 168
integer width = 2181
integer height = 1112
boolean titlebar = true
string title = "Zone Confidentielle du Patient"
windowtype windowtype = response!
long backcolor = 12632256
mle_confiden mle_confiden
uo_1 uo_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
gb_5 gb_5
end type
global w_confidentiel_soiron w_confidentiel_soiron

type variables
double var_code_local 
string page
boolean modif
end variables

event open;var_code_local = message.doubleparm

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(6000)
end if

if len(page) < 6000 then
	page = page + space(6000 - len(page))
end if

modif = false
mle_confiden.text = Righttrim(mid(page,1200,250))
end event

on w_confidentiel_soiron.create
this.mle_confiden=create mle_confiden
this.uo_1=create uo_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.gb_5=create gb_5
this.Control[]={this.mle_confiden,&
this.uo_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.gb_5}
end on

on w_confidentiel_soiron.destroy
destroy(this.mle_confiden)
destroy(this.uo_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.gb_5)
end on

event resize;//uo_1.retaille(this)
end event

type mle_confiden from multilineedit within w_confidentiel_soiron
event modified pbm_enmodified
integer x = 78
integer y = 92
integer width = 1970
integer height = 720
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 250
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true

end event

type uo_1 from resize_fenetre within w_confidentiel_soiron
boolean visible = false
integer x = 827
integer y = 1212
integer width = 946
integer height = 356
integer taborder = 20
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cb_3 from commandbutton within w_confidentiel_soiron
integer x = 1769
integer y = 876
integer width = 320
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_2 from commandbutton within w_confidentiel_soiron
integer x = 1417
integer y = 876
integer width = 320
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

event clicked;place_avec_blancs(mle_confiden.text,page,1200,250)

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end event

type cb_1 from commandbutton within w_confidentiel_soiron
integer x = 1070
integer y = 876
integer width = 320
integer height = 96
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

event clicked;//dw_1.retrieve(var_code_local)
end event

type gb_5 from groupbox within w_confidentiel_soiron
integer x = 46
integer y = 12
integer width = 2057
integer height = 852
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "ZONE CONFIDENTIELLE"
end type

