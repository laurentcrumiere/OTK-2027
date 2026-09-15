$PBExportHeader$w_diagnos_maj_legall1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_legall1 from window
end type
type dw_diagnostic2 from datawindow within w_diagnos_maj_legall1
end type
type dw_diagnostic1 from datawindow within w_diagnos_maj_legall1
end type
type dw_plan from datawindow within w_diagnos_maj_legall1
end type
type st_1 from statictext within w_diagnos_maj_legall1
end type
type ole_photo005 from gearbox within w_diagnos_maj_legall1
end type
type ole_photo004 from gearbox within w_diagnos_maj_legall1
end type
type ole_photo003 from gearbox within w_diagnos_maj_legall1
end type
type ole_photo002 from gearbox within w_diagnos_maj_legall1
end type
type ole_photo001 from gearbox within w_diagnos_maj_legall1
end type
type pb_2 from picturebutton within w_diagnos_maj_legall1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_legall1
end type
type cb_sauver from commandbutton within w_diagnos_maj_legall1
end type
type cb_annuler from commandbutton within w_diagnos_maj_legall1
end type
type cb_fermer from commandbutton within w_diagnos_maj_legall1
end type
type ole_photo006 from gearbox within w_diagnos_maj_legall1
end type
type ole_photo007 from gearbox within w_diagnos_maj_legall1
end type
type ole_photo008 from gearbox within w_diagnos_maj_legall1
end type
type ole_photo009 from gearbox within w_diagnos_maj_legall1
end type
type ole_photo010 from gearbox within w_diagnos_maj_legall1
end type
type st_3 from statictext within w_diagnos_maj_legall1
end type
type mle_remarques from multilineedit within w_diagnos_maj_legall1
end type
type st_4 from statictext within w_diagnos_maj_legall1
end type
type mle_timing from multilineedit within w_diagnos_maj_legall1
end type
type st_5 from statictext within w_diagnos_maj_legall1
end type
type mle_consultation from multilineedit within w_diagnos_maj_legall1
end type
type st_2 from statictext within w_diagnos_maj_legall1
end type
type dw_diag from datawindow within w_diagnos_maj_legall1
end type
end forward

global type w_diagnos_maj_legall1 from window
integer width = 3552
integer height = 2228
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 67108864
dw_diagnostic2 dw_diagnostic2
dw_diagnostic1 dw_diagnostic1
dw_plan dw_plan
st_1 st_1
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
pb_2 pb_2
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
st_3 st_3
mle_remarques mle_remarques
st_4 st_4
mle_timing mle_timing
st_5 st_5
mle_consultation mle_consultation
st_2 st_2
dw_diag dw_diag
end type
global w_diagnos_maj_legall1 w_diagnos_maj_legall1

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

public subroutine save ();//f.ecrire_pt(mle_plt,var_code_local)
//f.ecrire_d(mle_diag,var_code_local)

f.ecrirepage(mle_timing,page,10,400)
f.ecrirepage(mle_remarques,page,410,300)
f.ecrirepage(mle_consultation,page,710,200)		//max carac = 910



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1) : ",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if


dw_diagnostic1.accepttext()
dw_diagnostic2.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diagnostic1.setItem(1, "patient_traitement_effectue_html", dw_diagnostic1.getitemString(1, "texte_brut_traitement_effectue"))
dw_diagnostic2.setItem(1, "patient_plan_traitement_html", dw_diagnostic2.getitemString(1, "texte_brut_plan_traitement"))

if dw_diagnostic1.update() = 1 and  dw_diagnostic2.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if

end subroutine

public subroutine init ();//f.lire_pt(mle_plt,var_code_local)
//f.lire_d(mle_diag,var_code_local)

f.lirepage(mle_timing,page,10,400)
f.lirepage(mle_remarques,page,410,300)
f.lirepage(mle_consultation,page,710,200)		//max carac = 910

dw_diagnostic1.SetTransObject(SQLCA)
dw_diagnostic1.Retrieve(var_code_local)

dw_diagnostic2.SetTransObject(SQLCA)
dw_diagnostic2.Retrieve(var_code_local)

cb_fermer.setfocus()

modif = false

end subroutine

on w_diagnos_maj_legall1.create
this.dw_diagnostic2=create dw_diagnostic2
this.dw_diagnostic1=create dw_diagnostic1
this.dw_plan=create dw_plan
this.st_1=create st_1
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.pb_2=create pb_2
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.st_3=create st_3
this.mle_remarques=create mle_remarques
this.st_4=create st_4
this.mle_timing=create mle_timing
this.st_5=create st_5
this.mle_consultation=create mle_consultation
this.st_2=create st_2
this.dw_diag=create dw_diag
this.Control[]={this.dw_diagnostic2,&
this.dw_diagnostic1,&
this.dw_plan,&
this.st_1,&
this.ole_photo005,&
this.ole_photo004,&
this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.pb_2,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer,&
this.ole_photo006,&
this.ole_photo007,&
this.ole_photo008,&
this.ole_photo009,&
this.ole_photo010,&
this.st_3,&
this.mle_remarques,&
this.st_4,&
this.mle_timing,&
this.st_5,&
this.mle_consultation,&
this.st_2,&
this.dw_diag}
end on

on w_diagnos_maj_legall1.destroy
destroy(this.dw_diagnostic2)
destroy(this.dw_diagnostic1)
destroy(this.dw_plan)
destroy(this.st_1)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.pb_2)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.st_3)
destroy(this.mle_remarques)
destroy(this.st_4)
destroy(this.mle_timing)
destroy(this.st_5)
destroy(this.mle_consultation)
destroy(this.st_2)
destroy(this.dw_diag)
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

this.title = "Page Clinique N°1 : " + vn + " " + vp +" - N° dossier : "+string(var_code_local) + " - Age : " + string(an) + " ans " + string(mois) + " mois "

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

type dw_diagnostic2 from datawindow within w_diagnos_maj_legall1
string tag = "no resizeall brush"
integer x = 55
integer y = 944
integer width = 1582
integer height = 536
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_legal_plan"
boolean border = false
boolean livescroll = true
end type

type dw_diagnostic1 from datawindow within w_diagnos_maj_legall1
string tag = "no resizeall brush"
integer x = 1728
integer y = 1340
integer width = 1765
integer height = 536
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_legal_diag"
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

type dw_plan from datawindow within w_diagnos_maj_legall1
boolean visible = false
integer x = 73
integer y = 724
integer width = 1522
integer height = 660
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_plan_ttt_affichage"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;// Si tout le texte dans la zone "Diagnostic" est sélectionné 
// Alors on remplace tout et on met le diagnostic cliqué
// Sinon si rien sélectionné
//			alors rajouter à la suite le diagnostic
//			sinon si début de texte sélectionné
//					alors on remet la fin du texte + le diagnostic cliqué
//					sinon (fin de texte sélectionné) on remet le début du texte + le diagnostic cliqué

string texte ,  texte_diag , texte_final
string texte_selectionne
char c = "~n"
char r = "~r"

dw_diagnostic2.accepttext()

if this.rowcount() > 0 then

	texte = dw_diag.GetItemString(this.GetRow(),"texte")
	texte_diag = dw_diagnostic2.GetItemString(dw_diagnostic2.GetRow(),"traitement_effectue")
	
	
	texte_selectionne = dw_diagnostic2.SelectedText()
	
	IF texte_diag = texte_selectionne OR IsNull(texte_diag)THEN
		texte_final = texte
	ELSE	
		texte_final = texte_diag + " " + texte	
	END IF	
	
	dw_diagnostic2.SetItem(dw_diagnostic2.GetRow(),"traitement_effectue",texte_final)
	
end if
this.visible = FALSE
end event

event rbuttondown;this.visible = FALSE
end event

event losefocus;this.visible = FALSE
end event

type st_1 from statictext within w_diagnos_maj_legall1
integer x = 1728
integer y = 1280
integer width = 343
integer height = 56
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Diagnostic :"
boolean focusrectangle = false
end type

type ole_photo005 from gearbox within w_diagnos_maj_legall1
integer x = 2862
integer y = 28
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_legall1
integer x = 2162
integer y = 28
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_legall1
integer x = 1463
integer y = 28
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_legall1
integer x = 763
integer y = 28
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_legall1
integer x = 64
integer y = 28
integer width = 640
integer height = 408
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type pb_2 from picturebutton within w_diagnos_maj_legall1
integer x = 3323
integer y = 1960
integer width = 137
integer height = 112
integer taborder = 100
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
		OpenSheetWithParm(w_diagnos_maj_legall2,var_code_local,w_mdi,1,Original!)
		Close(parent)
	end if
else
	OpenSheetWithParm(w_diagnos_maj_legall2,var_code_local,w_mdi,1,Original!)
	close(parent)
end if

end event

type cb_imprimer from commandbutton within w_diagnos_maj_legall1
integer x = 1559
integer y = 1960
integer width = 402
integer height = 112
integer taborder = 60
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

type cb_sauver from commandbutton within w_diagnos_maj_legall1
integer x = 2446
integer y = 1960
integer width = 402
integer height = 112
integer taborder = 80
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

type cb_annuler from commandbutton within w_diagnos_maj_legall1
integer x = 2002
integer y = 1960
integer width = 402
integer height = 112
integer taborder = 70
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

type cb_fermer from commandbutton within w_diagnos_maj_legall1
integer x = 2889
integer y = 1960
integer width = 402
integer height = 112
integer taborder = 90
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

type ole_photo006 from gearbox within w_diagnos_maj_legall1
integer x = 64
integer y = 448
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_legall1
integer x = 763
integer y = 448
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_legall1
integer x = 1463
integer y = 448
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_legall1
integer x = 2162
integer y = 448
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_legall1
integer x = 2862
integer y = 448
integer width = 640
integer height = 408
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type st_3 from statictext within w_diagnos_maj_legall1
integer x = 59
integer y = 1516
integer width = 343
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Remarques :"
boolean focusrectangle = false
end type

type mle_remarques from multilineedit within w_diagnos_maj_legall1
integer x = 64
integer y = 1600
integer width = 1522
integer height = 196
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type st_4 from statictext within w_diagnos_maj_legall1
integer x = 1728
integer y = 880
integer width = 192
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Timing :"
boolean focusrectangle = false
end type

type mle_timing from multilineedit within w_diagnos_maj_legall1
integer x = 1737
integer y = 944
integer width = 1696
integer height = 308
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 400
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type st_5 from statictext within w_diagnos_maj_legall1
integer x = 64
integer y = 1828
integer width = 544
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Motif de la Consultation :"
boolean focusrectangle = false
end type

type mle_consultation from multilineedit within w_diagnos_maj_legall1
integer x = 64
integer y = 1888
integer width = 1317
integer height = 196
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 200
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true
end event

type st_2 from statictext within w_diagnos_maj_legall1
integer x = 64
integer y = 880
integer width = 439
integer height = 56
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plan de Traitement :"
boolean focusrectangle = false
end type

type dw_diag from datawindow within w_diagnos_maj_legall1
boolean visible = false
integer x = 1733
integer y = 1088
integer width = 1696
integer height = 660
integer taborder = 23
boolean bringtotop = true
string dataobject = "dw_diagnostic_affichage"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;// Si tout le texte dans la zone "Diagnostic" est sélectionné 
// Alors on remplace tout et on met le diagnostic cliqué
// Sinon si rien sélectionné
//			alors rajouter à la suite le diagnostic
//			sinon si début de texte sélectionné
//					alors on remet la fin du texte + le diagnostic cliqué
//					sinon (fin de texte sélectionné) on remet le début du texte + le diagnostic cliqué

string texte ,  texte_diag , texte_final
string texte_selectionne
char c = "~n"
char r = "~r"

dw_diagnostic1.accepttext()

if this.rowcount() > 0 then

	texte = dw_diag.GetItemString(this.GetRow(),"texte")
	texte_diag = dw_diagnostic1.GetItemString(dw_diagnostic1.GetRow(),"traitement_effectue")
	
	
	texte_selectionne = dw_diagnostic1.SelectedText()
	
	IF texte_diag = texte_selectionne OR IsNull(texte_diag)THEN
		texte_final = texte
	ELSE	
		texte_final = texte_diag + " " + texte	
	END IF	
	
	dw_diagnostic2.SetItem(dw_diagnostic1.GetRow(),"traitement_effectue",texte_final)
	
end if
this.visible = FALSE
end event

event rbuttondown;this.visible = FALSE
end event

event losefocus;this.visible = FALSE
end event

