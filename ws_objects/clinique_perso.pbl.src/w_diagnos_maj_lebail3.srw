$PBExportHeader$w_diagnos_maj_lebail3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_lebail3 from window
end type
type ole_photo005 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo006 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo002 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo001 from gearbox within w_diagnos_maj_lebail3
end type
type cb_imprimer from commandbutton within w_diagnos_maj_lebail3
end type
type cb_precedent from commandbutton within w_diagnos_maj_lebail3
end type
type mle_remarques from multilineedit within w_diagnos_maj_lebail3
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_lebail3
end type
type cb_annuler from commandbutton within w_diagnos_maj_lebail3
end type
type cb_fermer from commandbutton within w_diagnos_maj_lebail3
end type
type gb_7 from groupbox within w_diagnos_maj_lebail3
end type
type ole_photo003 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo004 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo007 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo008 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo009 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo010 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo011 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo012 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo013 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo014 from gearbox within w_diagnos_maj_lebail3
end type
type ole_photo015 from gearbox within w_diagnos_maj_lebail3
end type
end forward

global type w_diagnos_maj_lebail3 from window
integer width = 3561
integer height = 2024
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
ole_photo005 ole_photo005
ole_photo006 ole_photo006
ole_photo002 ole_photo002
ole_photo001 ole_photo001
cb_imprimer cb_imprimer
cb_precedent cb_precedent
mle_remarques mle_remarques
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_7 gb_7
ole_photo003 ole_photo003
ole_photo004 ole_photo004
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
ole_photo011 ole_photo011
ole_photo012 ole_photo012
ole_photo013 ole_photo013
ole_photo014 ole_photo014
ole_photo015 ole_photo015
end type
global w_diagnos_maj_lebail3 w_diagnos_maj_lebail3

type variables
double var_code_local 
String var_nom_local,moul_local
boolean modif
double zoom
string page
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();string rem

SELECT remarques INTO :rem FROM diagnos WHERE code = :var_code_local ;

modif = false


mle_remarques.text = rem


//max carac depuis 17/08/2004 = 1976


end subroutine

event open;var_code_local = message.doubleparm


string vn,vm,vp 
date vd
integer an, mois

select nom,prenom,moulage,date_naissance INTO :vn,:vp,:vm,:vd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if
if isnull(vp) then
	vp = ""
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

this.title = "Page N°3 : "+vn+ " " +vp+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(mois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if

init()
mep_win_mdi(this,1)

cb_fermer.setfocus()

end event

on w_diagnos_maj_lebail3.create
this.ole_photo005=create ole_photo005
this.ole_photo006=create ole_photo006
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.cb_imprimer=create cb_imprimer
this.cb_precedent=create cb_precedent
this.mle_remarques=create mle_remarques
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_7=create gb_7
this.ole_photo003=create ole_photo003
this.ole_photo004=create ole_photo004
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.ole_photo011=create ole_photo011
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.ole_photo014=create ole_photo014
this.ole_photo015=create ole_photo015
this.Control[]={this.ole_photo005,&
this.ole_photo006,&
this.ole_photo002,&
this.ole_photo001,&
this.cb_imprimer,&
this.cb_precedent,&
this.mle_remarques,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_7,&
this.ole_photo003,&
this.ole_photo004,&
this.ole_photo007,&
this.ole_photo008,&
this.ole_photo009,&
this.ole_photo010,&
this.ole_photo011,&
this.ole_photo012,&
this.ole_photo013,&
this.ole_photo014,&
this.ole_photo015}
end on

on w_diagnos_maj_lebail3.destroy
destroy(this.ole_photo005)
destroy(this.ole_photo006)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.cb_imprimer)
destroy(this.cb_precedent)
destroy(this.mle_remarques)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_7)
destroy(this.ole_photo003)
destroy(this.ole_photo004)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.ole_photo011)
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.ole_photo014)
destroy(this.ole_photo015)
end on

type ole_photo005 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 2912
integer y = 12
integer width = 512
integer height = 336
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 59
integer y = 360
integer width = 512
integer height = 336
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 773
integer y = 12
integer width = 512
integer height = 336
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 59
integer y = 12
integer width = 512
integer height = 336
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type cb_imprimer from commandbutton within w_diagnos_maj_lebail3
integer x = 3145
integer y = 1244
integer width = 338
integer height = 96
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
parent.Print ( job,parent.x,parent.y)
PrintClose(Job)
end event

type cb_precedent from commandbutton within w_diagnos_maj_lebail3
integer x = 3145
integer y = 1364
integer width = 338
integer height = 96
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Précédent"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		if ui_v2020 then
			OpenWithParm( w_diagnos_maj_lebail2, var_code_local, w_mdi_2020)
		else
			OpenSheetWithParm ( w_diagnos_maj_lebail2 , var_code_local , w_mdi , 1 , Original! )
		end if
		Close(w_diagnos_maj_lebail3)
	end if
else
	if ui_v2020 then
		OpenWithParm( w_diagnos_maj_lebail2, var_code_local, w_mdi_2020)
	else
		OpenSheetWithParm ( w_diagnos_maj_lebail2 , var_code_local , w_mdi , 1 , Original! )
	end if
	close(w_diagnos_maj_lebail3)
end if
end event

type mle_remarques from multilineedit within w_diagnos_maj_lebail3
integer x = 983
integer y = 1156
integer width = 1431
integer height = 240
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_lebail3
integer x = 3145
integer y = 1604
integer width = 338
integer height = 96
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;string rem


rem = mle_remarques.text


UPDATE diagnos SET perso = :page,remarques = :rem WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
	else
		modif = false
		COMMIT ;
end if

//max carac depuis 17/08/2004 = 1976
end event

type cb_annuler from commandbutton within w_diagnos_maj_lebail3
integer x = 3145
integer y = 1484
integer width = 338
integer height = 96
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()

end event

type cb_fermer from commandbutton within w_diagnos_maj_lebail3
integer x = 3145
integer y = 1724
integer width = 338
integer height = 96
integer taborder = 90
integer textsize = -8
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

type gb_7 from groupbox within w_diagnos_maj_lebail3
integer x = 951
integer y = 1088
integer width = 1504
integer height = 332
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Remarques"
end type

type ole_photo003 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 1486
integer y = 12
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 2199
integer y = 12
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 773
integer y = 360
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 1486
integer y = 360
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 2199
integer y = 360
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 2912
integer y = 360
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 59
integer y = 708
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 773
integer y = 708
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 1486
integer y = 708
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 2199
integer y = 708
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

type ole_photo015 from gearbox within w_diagnos_maj_lebail3
boolean visible = true
integer x = 2912
integer y = 708
integer width = 512
integer height = 336
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo015.destroy
call gearbox::destroy
end on

