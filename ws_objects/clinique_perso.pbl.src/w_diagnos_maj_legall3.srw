$PBExportHeader$w_diagnos_maj_legall3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_legall3 from window
end type
type ole_photo035 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo034 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo033 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo032 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo031 from gearbox within w_diagnos_maj_legall3
end type
type pb_2 from picturebutton within w_diagnos_maj_legall3
end type
type pb_1 from picturebutton within w_diagnos_maj_legall3
end type
type cb_imprimer from commandbutton within w_diagnos_maj_legall3
end type
type cb_sauver from commandbutton within w_diagnos_maj_legall3
end type
type cb_annuler from commandbutton within w_diagnos_maj_legall3
end type
type cb_fermer from commandbutton within w_diagnos_maj_legall3
end type
type ole_photo036 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo037 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo038 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo039 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo040 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo021 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo022 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo023 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo024 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo025 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo026 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo027 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo028 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo029 from gearbox within w_diagnos_maj_legall3
end type
type ole_photo030 from gearbox within w_diagnos_maj_legall3
end type
end forward

global type w_diagnos_maj_legall3 from window
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
ole_photo035 ole_photo035
ole_photo034 ole_photo034
ole_photo033 ole_photo033
ole_photo032 ole_photo032
ole_photo031 ole_photo031
pb_2 pb_2
pb_1 pb_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
ole_photo036 ole_photo036
ole_photo037 ole_photo037
ole_photo038 ole_photo038
ole_photo039 ole_photo039
ole_photo040 ole_photo040
ole_photo021 ole_photo021
ole_photo022 ole_photo022
ole_photo023 ole_photo023
ole_photo024 ole_photo024
ole_photo025 ole_photo025
ole_photo026 ole_photo026
ole_photo027 ole_photo027
ole_photo028 ole_photo028
ole_photo029 ole_photo029
ole_photo030 ole_photo030
end type
global w_diagnos_maj_legall3 w_diagnos_maj_legall3

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

public subroutine save ();//prototype : f.ecrirepage(sle_patient1,page,66,5)



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

public subroutine init ();// prototype : f.lirepage(sle_patient1,page,66,5)


cb_fermer.setfocus()
modif = false

end subroutine

on w_diagnos_maj_legall3.create
this.ole_photo035=create ole_photo035
this.ole_photo034=create ole_photo034
this.ole_photo033=create ole_photo033
this.ole_photo032=create ole_photo032
this.ole_photo031=create ole_photo031
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.ole_photo036=create ole_photo036
this.ole_photo037=create ole_photo037
this.ole_photo038=create ole_photo038
this.ole_photo039=create ole_photo039
this.ole_photo040=create ole_photo040
this.ole_photo021=create ole_photo021
this.ole_photo022=create ole_photo022
this.ole_photo023=create ole_photo023
this.ole_photo024=create ole_photo024
this.ole_photo025=create ole_photo025
this.ole_photo026=create ole_photo026
this.ole_photo027=create ole_photo027
this.ole_photo028=create ole_photo028
this.ole_photo029=create ole_photo029
this.ole_photo030=create ole_photo030
this.Control[]={this.ole_photo035,&
this.ole_photo034,&
this.ole_photo033,&
this.ole_photo032,&
this.ole_photo031,&
this.pb_2,&
this.pb_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.ole_photo036,&
this.ole_photo037,&
this.ole_photo038,&
this.ole_photo039,&
this.ole_photo040,&
this.ole_photo021,&
this.ole_photo022,&
this.ole_photo023,&
this.ole_photo024,&
this.ole_photo025,&
this.ole_photo026,&
this.ole_photo027,&
this.ole_photo028,&
this.ole_photo029,&
this.ole_photo030}
end on

on w_diagnos_maj_legall3.destroy
destroy(this.ole_photo035)
destroy(this.ole_photo034)
destroy(this.ole_photo033)
destroy(this.ole_photo032)
destroy(this.ole_photo031)
destroy(this.pb_2)
destroy(this.pb_1)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.ole_photo036)
destroy(this.ole_photo037)
destroy(this.ole_photo038)
destroy(this.ole_photo039)
destroy(this.ole_photo040)
destroy(this.ole_photo021)
destroy(this.ole_photo022)
destroy(this.ole_photo023)
destroy(this.ole_photo024)
destroy(this.ole_photo025)
destroy(this.ole_photo026)
destroy(this.ole_photo027)
destroy(this.ole_photo028)
destroy(this.ole_photo029)
destroy(this.ole_photo030)
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

type ole_photo035 from gearbox within w_diagnos_maj_legall3
integer x = 2802
integer y = 860
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo034 from gearbox within w_diagnos_maj_legall3
integer x = 2149
integer y = 860
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_legall3
integer x = 1495
integer y = 860
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_legall3
integer x = 841
integer y = 860
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo031 from gearbox within w_diagnos_maj_legall3
integer x = 187
integer y = 860
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type pb_2 from picturebutton within w_diagnos_maj_legall3
boolean visible = false
integer x = 3323
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 60
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
//		OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
//	OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_legall3
integer x = 3150
integer y = 1708
integer width = 137
integer height = 112
integer taborder = 50
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
		OpenSheetWithParm(w_diagnos_maj_legall2,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_legall2,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_legall3
integer x = 1385
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 10
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

type cb_sauver from commandbutton within w_diagnos_maj_legall3
boolean visible = false
integer x = 2272
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 30
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

type cb_annuler from commandbutton within w_diagnos_maj_legall3
boolean visible = false
integer x = 1829
integer y = 1708
integer width = 402
integer height = 112
integer taborder = 20
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

type cb_fermer from commandbutton within w_diagnos_maj_legall3
integer x = 2715
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

type ole_photo036 from gearbox within w_diagnos_maj_legall3
integer x = 187
integer y = 1280
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

type ole_photo037 from gearbox within w_diagnos_maj_legall3
integer x = 841
integer y = 1280
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo037.destroy
call gearbox::destroy
end on

type ole_photo038 from gearbox within w_diagnos_maj_legall3
integer x = 1495
integer y = 1280
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo038.destroy
call gearbox::destroy
end on

type ole_photo039 from gearbox within w_diagnos_maj_legall3
integer x = 2149
integer y = 1280
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo039.destroy
call gearbox::destroy
end on

type ole_photo040 from gearbox within w_diagnos_maj_legall3
integer x = 2802
integer y = 1280
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo040.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_legall3
integer x = 187
integer y = 20
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_legall3
integer x = 841
integer y = 20
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo023 from gearbox within w_diagnos_maj_legall3
integer x = 1495
integer y = 20
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_legall3
integer x = 2149
integer y = 20
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo025 from gearbox within w_diagnos_maj_legall3
integer x = 2802
integer y = 20
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_legall3
integer x = 187
integer y = 440
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type ole_photo027 from gearbox within w_diagnos_maj_legall3
integer x = 841
integer y = 440
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_legall3
integer x = 1495
integer y = 440
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_legall3
integer x = 2149
integer y = 440
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_legall3
integer x = 2802
integer y = 440
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

