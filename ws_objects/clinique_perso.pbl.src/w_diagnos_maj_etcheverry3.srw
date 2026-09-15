$PBExportHeader$w_diagnos_maj_etcheverry3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_etcheverry3 from window
end type
type st_3 from statictext within w_diagnos_maj_etcheverry3
end type
type st_4 from statictext within w_diagnos_maj_etcheverry3
end type
type st_5 from statictext within w_diagnos_maj_etcheverry3
end type
type mle_comment from multilineedit within w_diagnos_maj_etcheverry3
end type
type mle_plan_trait from multilineedit within w_diagnos_maj_etcheverry3
end type
type mle_flux from multilineedit within w_diagnos_maj_etcheverry3
end type
type pb_2 from picturebutton within w_diagnos_maj_etcheverry3
end type
type pb_1 from picturebutton within w_diagnos_maj_etcheverry3
end type
type cb_imprimer from commandbutton within w_diagnos_maj_etcheverry3
end type
type cb_sauver from commandbutton within w_diagnos_maj_etcheverry3
end type
type cb_annuler from commandbutton within w_diagnos_maj_etcheverry3
end type
type cb_fermer from commandbutton within w_diagnos_maj_etcheverry3
end type
end forward

global type w_diagnos_maj_etcheverry3 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
st_3 st_3
st_4 st_4
st_5 st_5
mle_comment mle_comment
mle_plan_trait mle_plan_trait
mle_flux mle_flux
pb_2 pb_2
pb_1 pb_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
end type
global w_diagnos_maj_etcheverry3 w_diagnos_maj_etcheverry3

type variables
double var_code_local 
boolean modif
string page
uo_fx_pages_cliniques f

end variables

forward prototypes
public subroutine save ()
public subroutine init ()
end prototypes

public subroutine save ();f.ecrirepage(mle_comment,page,605,500)
f.ecrirepage(mle_flux,page,1105,500)
f.ecrirepage(mle_plan_trait,page,1605,500)		//max carac = 2105



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

public subroutine init ();f.lirepage(mle_comment,page,605,500)
f.lirepage(mle_flux,page,1105,500)
f.lirepage(mle_plan_trait,page,1605,500)		//max carac = 2105


cb_fermer.setfocus()
modif = false

end subroutine

on w_diagnos_maj_etcheverry3.create
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.mle_comment=create mle_comment
this.mle_plan_trait=create mle_plan_trait
this.mle_flux=create mle_flux
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.Control[]={this.st_3,&
this.st_4,&
this.st_5,&
this.mle_comment,&
this.mle_plan_trait,&
this.mle_flux,&
this.pb_2,&
this.pb_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer}
end on

on w_diagnos_maj_etcheverry3.destroy
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.mle_comment)
destroy(this.mle_plan_trait)
destroy(this.mle_flux)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
end on

event open;var_code_local = message.doubleparm

string vn,vp
date vd
integer an, mois

select nom, prenom, date_naissance INTO :vn,:vp,:vd FROM patient WHERE code = :var_code_local ;

if isnull(vn) then
	vn = ""
end if
if isnull(vp) then
	vp = ""
end if
if isnull(vd) then
	vd = Today()
end if

if (month(today()) < month( vd )) then
	an = year(today()) - year( vd ) - 1
ELSE
	an = year(today()) - year( vd )
END IF	

if (month(today()) < month( vd )) then
	mois = month(today()) - month( vd ) +12
ELSE
	mois = month(today()) - month( vd )
END IF

this.title = "Page Clinique N°3 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

//if len(page) < 6000 then
//	page = page + space(6000 - len(page))
//end if

init()
mep_win_mdi(this,1)

end event

type st_3 from statictext within w_diagnos_maj_etcheverry3
integer x = 402
integer y = 1144
integer width = 919
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 12632256
boolean enabled = false
string text = "Commentaires :"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_etcheverry3
integer x = 402
integer y = 92
integer width = 919
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 12632256
boolean enabled = false
string text = "Plan de traitement :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_etcheverry3
integer x = 402
integer y = 616
integer width = 919
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 12632256
boolean enabled = false
string text = "Flux mécanique :"
boolean focusrectangle = false
end type

type mle_comment from multilineedit within w_diagnos_maj_etcheverry3
integer x = 402
integer y = 1224
integer width = 2775
integer height = 312
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_plan_trait from multilineedit within w_diagnos_maj_etcheverry3
integer x = 402
integer y = 172
integer width = 2775
integer height = 312
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type mle_flux from multilineedit within w_diagnos_maj_etcheverry3
integer x = 402
integer y = 696
integer width = 2775
integer height = 312
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type pb_2 from picturebutton within w_diagnos_maj_etcheverry3
integer x = 3323
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ar_left.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		OpenSheetWithParm(w_diagnos_maj_etcheverry4,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_etcheverry4,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_etcheverry3
integer x = 3150
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ar_right.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		OpenSheetWithParm(w_diagnos_maj_etcheverry2,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_etcheverry2,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_etcheverry3
integer x = 1385
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print ( job, 0, 0)
PrintClose(Job)
end event

type cb_sauver from commandbutton within w_diagnos_maj_etcheverry3
integer x = 2272
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;save()
end event

type cb_annuler from commandbutton within w_diagnos_maj_etcheverry3
integer x = 1829
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

event clicked;init()
end event

type cb_fermer from commandbutton within w_diagnos_maj_etcheverry3
integer x = 2715
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;if modif then
	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
		Close(parent)
	end if
else
	close(parent)
end if

end event

