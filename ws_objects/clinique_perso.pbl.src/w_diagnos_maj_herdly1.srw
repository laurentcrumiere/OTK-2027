$PBExportHeader$w_diagnos_maj_herdly1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_herdly1 from window
end type
type cb_imprimer from commandbutton within w_diagnos_maj_herdly1
end type
type ole_photo006 from gearbox within w_diagnos_maj_herdly1
end type
type ole_photo005 from gearbox within w_diagnos_maj_herdly1
end type
type ole_photo004 from gearbox within w_diagnos_maj_herdly1
end type
type ole_photo003 from gearbox within w_diagnos_maj_herdly1
end type
type ole_photo002 from gearbox within w_diagnos_maj_herdly1
end type
type ole_photo001 from gearbox within w_diagnos_maj_herdly1
end type
type st_1 from statictext within w_diagnos_maj_herdly1
end type
type cb_page2 from commandbutton within w_diagnos_maj_herdly1
end type
type cb_fermer from commandbutton within w_diagnos_maj_herdly1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_herdly1
end type
type cb_annuler from commandbutton within w_diagnos_maj_herdly1
end type
type mle_remarque from multilineedit within w_diagnos_maj_herdly1
end type
end forward

global type w_diagnos_maj_herdly1 from window
integer x = 18
integer y = 168
integer width = 3474
integer height = 1936
boolean titlebar = true
string title = "page1"
long backcolor = 67108864
cb_imprimer cb_imprimer
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
st_1 st_1
cb_page2 cb_page2
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
mle_remarque mle_remarque
end type
global w_diagnos_maj_herdly1 w_diagnos_maj_herdly1

type variables
double var_code_local 
string page
boolean modif
uo_fx_pages_cliniques f
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();f.lirepage(mle_remarque,page,1,500)

modif = false
cb_fermer.setfocus()
end subroutine

on w_diagnos_maj_herdly1.create
this.cb_imprimer=create cb_imprimer
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.st_1=create st_1
this.cb_page2=create cb_page2
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.mle_remarque=create mle_remarque
this.Control[]={this.cb_imprimer,&
this.ole_photo006,&
this.ole_photo005,&
this.ole_photo004,&
this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.st_1,&
this.cb_page2,&
this.cb_fermer,&
this.cb_enregistrer,&
this.cb_annuler,&
this.mle_remarque}
end on

on w_diagnos_maj_herdly1.destroy
destroy(this.cb_imprimer)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.st_1)
destroy(this.cb_page2)
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.mle_remarque)
end on

event open;var_code_local = message.doubleparm

string vn,vm 

select trim(nom)+' '+isnull(prenom,''),moulage INTO :vn,:vm FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if

this.title = "Page Clinique N°1 : "+vn+" - N° dossier : "+string(var_code_local)+" (Moulage : "+vm+")"

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if

//if len(page) < 4000 then
//	page = page + space(4000 - len(page))
//end if

init()
end event

type cb_imprimer from commandbutton within w_diagnos_maj_herdly1
integer x = 1390
integer y = 1688
integer width = 375
integer height = 128
integer taborder = 30
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

type ole_photo006 from gearbox within w_diagnos_maj_herdly1
integer x = 2523
integer y = 580
integer width = 823
integer height = 528
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_herdly1
integer x = 1335
integer y = 580
integer width = 823
integer height = 528
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_herdly1
integer x = 146
integer y = 580
integer width = 823
integer height = 528
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_herdly1
integer x = 2523
integer y = 20
integer width = 823
integer height = 528
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_herdly1
integer x = 1335
integer y = 20
integer width = 823
integer height = 528
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_herdly1
integer x = 146
integer y = 20
integer width = 823
integer height = 528
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type st_1 from statictext within w_diagnos_maj_herdly1
integer x = 146
integer y = 1144
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Remarques :"
boolean focusrectangle = false
end type

type cb_page2 from commandbutton within w_diagnos_maj_herdly1
integer x = 1801
integer y = 1688
integer width = 375
integer height = 128
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page N°&2"
end type

event clicked;openwithparm(w_diagnos_maj_herdly2,var_code_local)
close(parent)

end event

type cb_fermer from commandbutton within w_diagnos_maj_herdly1
integer x = 3026
integer y = 1688
integer width = 375
integer height = 128
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans les enregistrer ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if

end event

type cb_enregistrer from commandbutton within w_diagnos_maj_herdly1
integer x = 2624
integer y = 1688
integer width = 375
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;f.ecrirepage(mle_remarque,page,1,500)



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_herdly1
integer x = 2213
integer y = 1688
integer width = 375
integer height = 128
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()

end event

type mle_remarque from multilineedit within w_diagnos_maj_herdly1
integer x = 151
integer y = 1212
integer width = 3195
integer height = 432
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 500
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

