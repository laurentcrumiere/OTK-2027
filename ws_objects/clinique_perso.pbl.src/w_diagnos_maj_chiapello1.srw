$PBExportHeader$w_diagnos_maj_chiapello1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_chiapello1 from window
end type
type dw_diagnostic from datawindow within w_diagnos_maj_chiapello1
end type
type em_1 from editmask within w_diagnos_maj_chiapello1
end type
type sle_1 from singlelineedit within w_diagnos_maj_chiapello1
end type
type st_2 from statictext within w_diagnos_maj_chiapello1
end type
type st_1 from statictext within w_diagnos_maj_chiapello1
end type
type ole_photo008 from gearbox within w_diagnos_maj_chiapello1
end type
type ole_photo007 from gearbox within w_diagnos_maj_chiapello1
end type
type ole_photo006 from gearbox within w_diagnos_maj_chiapello1
end type
type ole_photo005 from gearbox within w_diagnos_maj_chiapello1
end type
type ole_photo004 from gearbox within w_diagnos_maj_chiapello1
end type
type ole_photo002 from gearbox within w_diagnos_maj_chiapello1
end type
type ole_photo003 from gearbox within w_diagnos_maj_chiapello1
end type
type ole_photo001 from gearbox within w_diagnos_maj_chiapello1
end type
type pb_2 from picturebutton within w_diagnos_maj_chiapello1
end type
type pb_1 from picturebutton within w_diagnos_maj_chiapello1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_chiapello1
end type
type cb_sauver from commandbutton within w_diagnos_maj_chiapello1
end type
type cb_annuler from commandbutton within w_diagnos_maj_chiapello1
end type
type cb_fermer from commandbutton within w_diagnos_maj_chiapello1
end type
end forward

global type w_diagnos_maj_chiapello1 from window
integer width = 4553
integer height = 2524
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
dw_diagnostic dw_diagnostic
em_1 em_1
sle_1 sle_1
st_2 st_2
st_1 st_1
ole_photo008 ole_photo008
ole_photo007 ole_photo007
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo002 ole_photo002
ole_photo003 ole_photo003
ole_photo001 ole_photo001
pb_2 pb_2
pb_1 pb_1
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
end type
global w_diagnos_maj_chiapello1 w_diagnos_maj_chiapello1

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

public subroutine save ();//f.ecrire_pt(mle_1,var_code_local)

f.ecrirepage(sle_1,page,10,30)
//max carac = 50


UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

public subroutine init ();date	l_str


SELECT debut_traitement INTO :l_str FROM patient WHERE code = :var_code_local ;
if not isnull(l_str) then em_1.text = string(l_str,"dd/mm/yyyy")	//on n'affiche que si pas NULL

//f.lire_pt(mle_1,var_code_local)

f.lirepage(sle_1,page,10,30)
//max carac = 50

cb_fermer.setfocus()
modif = false


dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)
end subroutine

on w_diagnos_maj_chiapello1.create
this.dw_diagnostic=create dw_diagnostic
this.em_1=create em_1
this.sle_1=create sle_1
this.st_2=create st_2
this.st_1=create st_1
this.ole_photo008=create ole_photo008
this.ole_photo007=create ole_photo007
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo002=create ole_photo002
this.ole_photo003=create ole_photo003
this.ole_photo001=create ole_photo001
this.pb_2=create pb_2
this.pb_1=create pb_1
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.Control[]={this.dw_diagnostic,&
this.em_1,&
this.sle_1,&
this.st_2,&
this.st_1,&
this.ole_photo008,&
this.ole_photo007,&
this.ole_photo006,&
this.ole_photo005,&
this.ole_photo004,&
this.ole_photo002,&
this.ole_photo003,&
this.ole_photo001,&
this.pb_2,&
this.pb_1,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer}
end on

on w_diagnos_maj_chiapello1.destroy
destroy(this.dw_diagnostic)
destroy(this.em_1)
destroy(this.sle_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.ole_photo008)
destroy(this.ole_photo007)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo002)
destroy(this.ole_photo003)
destroy(this.ole_photo001)
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
integer an, mois_local
double vnd

select nom, prenom, date_naissance, numero_dossier INTO :vn,:vp,:vd, :vnd FROM patient WHERE code = :var_code_local ;

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
	mois_local = month(today()) - month( vd ) +12
ELSE
	mois_local = month(today()) - month( vd )
END IF

this.title = "Page Clinique N°1 : " + vn + " " + vp +" - N° dossier : "+string(vnd) + " - Age : " + string(an) + " ans " + string(mois_local) + " mois "

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if

//if len(page) < 4000 then
//	page = page + space(4000 - len(page))
//end if

init()
mep_win_mdi(this,1)

end event

type dw_diagnostic from datawindow within w_diagnos_maj_chiapello1
string tag = "no resizeall brush"
integer x = 37
integer y = 1612
integer width = 1221
integer height = 784
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_chiapello"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;////string nom
////
////dw_plan.SetTransObject(SQLCA)
////dw_plan.Retrieve()
////dw_plan.visible = TRUE
//
//string nom
//String nom_colonne;
//
//nom_colonne = this.getColumnName();
//
//// Si le curseur est dans le champ "Plan de traitement"
//// Alors on affiche la datawindow pour pouvoir choisir un nouveau plan de ttt
//// Sinon on affiche la datawindow pour pouvoir choisir un nouveau diagnostic
////       si le curseur est dans le champ "Diagnostic"
//
//IF nom_colonne = "plan_traitement" THEN
//	//dw_plan.Retrieve()
//	dw_plan.visible = TRUE
//	dw_diag.visible = FALSE
//ELSE
//	IF nom_colonne = "traitement_effectue" THEN
//		//dw_diag.Retrieve()
//		dw_diag.visible = TRUE	
//		dw_plan.visible = FALSE
//	END IF
//END IF
end event

type em_1 from editmask within w_diagnos_maj_chiapello1
integer x = 3383
integer y = 40
integer width = 366
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "none"
alignment alignment = center!
boolean displayonly = true
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type sle_1 from singlelineedit within w_diagnos_maj_chiapello1
integer x = 823
integer y = 40
integer width = 1051
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_2 from statictext within w_diagnos_maj_chiapello1
integer x = 2606
integer y = 40
integer width = 777
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date de début de traitement :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_chiapello1
integer x = 229
integer y = 40
integer width = 594
integer height = 76
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Durée du traitement :"
boolean focusrectangle = false
end type

type ole_photo008 from gearbox within w_diagnos_maj_chiapello1
integer x = 3474
integer y = 1672
integer width = 1006
integer height = 532
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_chiapello1
integer x = 2377
integer y = 1672
integer width = 1006
integer height = 532
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_chiapello1
integer x = 1280
integer y = 1672
integer width = 1006
integer height = 532
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_chiapello1
integer x = 2377
integer y = 228
integer width = 1920
integer height = 1292
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_chiapello1
integer x = 1189
integer y = 912
integer width = 960
integer height = 684
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_chiapello1
integer x = 1189
integer y = 152
integer width = 960
integer height = 684
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_chiapello1
integer x = 137
integer y = 912
integer width = 960
integer height = 684
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_chiapello1
integer x = 137
integer y = 152
integer width = 960
integer height = 684
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type pb_2 from picturebutton within w_diagnos_maj_chiapello1
integer x = 4343
integer y = 2280
integer width = 137
integer height = 112
integer taborder = 80
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
		OpenSheetWithParm(w_diagnos_maj_chiapello2,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_chiapello2,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type pb_1 from picturebutton within w_diagnos_maj_chiapello1
boolean visible = false
integer x = 4160
integer y = 2280
integer width = 137
integer height = 112
integer taborder = 70
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
//		OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
//	OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_chiapello1
integer x = 2368
integer y = 2280
integer width = 402
integer height = 112
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

type cb_sauver from commandbutton within w_diagnos_maj_chiapello1
integer x = 3264
integer y = 2280
integer width = 402
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;save()


dw_diagnostic.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diagnostic.setItem(1, "patient_traitement_effectue_html", dw_diagnostic.getitemString(1, "texte_brut_traitement_effectue"))
dw_diagnostic.setItem(1, "patient_plan_traitement_html", dw_diagnostic.getitemString(1, "texte_brut_plan_traitement"))

if dw_diagnostic.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_chiapello1
integer x = 2816
integer y = 2280
integer width = 402
integer height = 112
integer taborder = 40
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

type cb_fermer from commandbutton within w_diagnos_maj_chiapello1
integer x = 3712
integer y = 2280
integer width = 402
integer height = 112
integer taborder = 60
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

