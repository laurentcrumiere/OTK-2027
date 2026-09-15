$PBExportHeader$w_diagnos_maj_trovero5.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_trovero5 from window
end type
type cb_imprimer from commandbutton within w_diagnos_maj_trovero5
end type
type mle_flux from multilineedit within w_diagnos_maj_trovero5
end type
type mle_plan_trait from multilineedit within w_diagnos_maj_trovero5
end type
type mle_comment from multilineedit within w_diagnos_maj_trovero5
end type
type st_5 from statictext within w_diagnos_maj_trovero5
end type
type st_4 from statictext within w_diagnos_maj_trovero5
end type
type st_3 from statictext within w_diagnos_maj_trovero5
end type
type cb_fermer from commandbutton within w_diagnos_maj_trovero5
end type
type cb_annuler from commandbutton within w_diagnos_maj_trovero5
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_trovero5
end type
end forward

global type w_diagnos_maj_trovero5 from window
integer x = 5
integer width = 2907
integer height = 1940
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
boolean center = true
cb_imprimer cb_imprimer
mle_flux mle_flux
mle_plan_trait mle_plan_trait
mle_comment mle_comment
st_5 st_5
st_4 st_4
st_3 st_3
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
end type
global w_diagnos_maj_trovero5 w_diagnos_maj_trovero5

type variables
double var_code_local 
string page
boolean modif
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();string pt

SELECT plan_traitement INTO :pt FROM patient WHERE code = :var_code_local ;


modif = false

mle_flux.text = RightTrim(mid(page,500,500))
mle_comment.text = RightTrim(mid(page,1000,500))
mle_plan_trait.text = pt

end subroutine

event open;var_code_local = message.doubleparm


string vn,vm 
date vd
integer an, mois

select trim(nom)+' '+isnull(prenom,''),moulage,date_naissance INTO :vn,:vm,:vd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
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

this.title = "Page N°5 : "+vn+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(mois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if


init()

// place la window ds la mdi -> confort utilisateur
mep_win_mdi(this,1)
end event

on w_diagnos_maj_trovero5.create
this.cb_imprimer=create cb_imprimer
this.mle_flux=create mle_flux
this.mle_plan_trait=create mle_plan_trait
this.mle_comment=create mle_comment
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.Control[]={this.cb_imprimer,&
this.mle_flux,&
this.mle_plan_trait,&
this.mle_comment,&
this.st_5,&
this.st_4,&
this.st_3,&
this.cb_fermer,&
this.cb_annuler,&
this.cb_enregistrer}
end on

on w_diagnos_maj_trovero5.destroy
destroy(this.cb_imprimer)
destroy(this.mle_flux)
destroy(this.mle_plan_trait)
destroy(this.mle_comment)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
end on

type cb_imprimer from commandbutton within w_diagnos_maj_trovero5
event clicked pbm_bnclicked
integer x = 471
integer y = 1664
integer width = 384
integer height = 108
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end event

type mle_flux from multilineedit within w_diagnos_maj_trovero5
integer x = 69
integer y = 648
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
end type

event modified;modif = true
end event

type mle_plan_trait from multilineedit within w_diagnos_maj_trovero5
integer x = 69
integer y = 124
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
end type

event modified;modif = true
end event

type mle_comment from multilineedit within w_diagnos_maj_trovero5
integer x = 69
integer y = 1176
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
end type

event modified;modif = true
end event

type st_5 from statictext within w_diagnos_maj_trovero5
integer x = 69
integer y = 572
integer width = 379
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Flux mécanique"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_trovero5
integer x = 69
integer y = 48
integer width = 411
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Plan de traitement "
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_trovero5
integer x = 69
integer y = 1096
integer width = 526
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Commentaires"
boolean focusrectangle = false
end type

type cb_fermer from commandbutton within w_diagnos_maj_trovero5
event clicked pbm_bnclicked
integer x = 2327
integer y = 1664
integer width = 384
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_trovero5
event clicked pbm_bnclicked
integer x = 1522
integer y = 1664
integer width = 384
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;//init()
//
//init_photos(var_code_local)
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_trovero5
event clicked pbm_bnclicked
integer x = 1925
integer y = 1664
integer width = 384
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;string pt

place_avec_blancs(mle_flux.text,page,500,500)
place_avec_blancs(mle_comment.text,page,1000,500)

pt = mle_plan_trait.text

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
	else
	UPDATE patient SET plan_traitement = :pt WHERE code = :var_code_local ;
	if SQLCA.Sqlcode <> 0 then
		son(4)
		Messagebox("ERREUR BASE DE DONNEES (N°3)",SQLCA.SqlErrText)
	else
		modif = false
		COMMIT ;
	end if
end if


end event

