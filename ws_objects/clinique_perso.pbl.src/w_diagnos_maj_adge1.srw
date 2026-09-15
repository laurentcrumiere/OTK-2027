$PBExportHeader$w_diagnos_maj_adge1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_adge1 from window
end type
type dw_diagnostic from datawindow within w_diagnos_maj_adge1
end type
type pb_2 from picturebutton within w_diagnos_maj_adge1
end type
type ole_photo007 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo006 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo005 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo004 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo003 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo002 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo001 from gearbox within w_diagnos_maj_adge1
end type
type cb_annuler from commandbutton within w_diagnos_maj_adge1
end type
type mle_remarques from multilineedit within w_diagnos_maj_adge1
end type
type ddlb_duree from dropdownlistbox within w_diagnos_maj_adge1
end type
type st_3 from statictext within w_diagnos_maj_adge1
end type
type ddlb_brackets from dropdownlistbox within w_diagnos_maj_adge1
end type
type st_2 from statictext within w_diagnos_maj_adge1
end type
type ddlb_arcade from dropdownlistbox within w_diagnos_maj_adge1
end type
type st_1 from statictext within w_diagnos_maj_adge1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_adge1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_adge1
end type
type cb_fermer from commandbutton within w_diagnos_maj_adge1
end type
type gb_66 from groupbox within w_diagnos_maj_adge1
end type
type ole_photo008 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo009 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo010 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo011 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo012 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo013 from gearbox within w_diagnos_maj_adge1
end type
type ole_photo014 from gearbox within w_diagnos_maj_adge1
end type
end forward

global type w_diagnos_maj_adge1 from window
integer x = 5
integer y = 8
integer width = 3643
integer height = 2012
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
dw_diagnostic dw_diagnostic
pb_2 pb_2
ole_photo007 ole_photo007
ole_photo006 ole_photo006
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
cb_annuler cb_annuler
mle_remarques mle_remarques
ddlb_duree ddlb_duree
st_3 st_3
ddlb_brackets ddlb_brackets
st_2 st_2
ddlb_arcade ddlb_arcade
st_1 st_1
cb_enregistrer cb_enregistrer
cb_imprimer cb_imprimer
cb_fermer cb_fermer
gb_66 gb_66
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
ole_photo011 ole_photo011
ole_photo012 ole_photo012
ole_photo013 ole_photo013
ole_photo014 ole_photo014
end type
global w_diagnos_maj_adge1 w_diagnos_maj_adge1

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

public subroutine init ();ddlb_arcade.selectitem(integer(mid(page,1530,1)))
ddlb_brackets.selectitem(integer(mid(page,1531,1)))
ddlb_duree.selectitem(integer(mid(page,1532,1)))


mle_remarques.text = RightTrim(mid(page,1330,200))

string pt,diag

//SELECT plan_traitement, traitement_effectue INTO :pt,:diag FROM patient WHERE code = :var_code_local ;
//mle_plan.text = pt
//mle_diagnostic.text = diag

dw_diagnostic.SetTransObject(SQLCA)
dw_diagnostic.Retrieve(var_code_local)


modif = false

end subroutine

event open;var_code_local = message.doubleparm

string vn,vm 
select trim(nom)+' '+isnull(prenom,''),moulage INTO :vn,:vm FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if

this.title = "Page N°1 : "+vn+" - N° dossier : "+string(var_code_local)+" (Moulage : "+vm+")"

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

init()

// place la window ds la mdi -> confort utilisateur
mep_win_mdi(this,1)

end event

on w_diagnos_maj_adge1.create
this.dw_diagnostic=create dw_diagnostic
this.pb_2=create pb_2
this.ole_photo007=create ole_photo007
this.ole_photo006=create ole_photo006
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.cb_annuler=create cb_annuler
this.mle_remarques=create mle_remarques
this.ddlb_duree=create ddlb_duree
this.st_3=create st_3
this.ddlb_brackets=create ddlb_brackets
this.st_2=create st_2
this.ddlb_arcade=create ddlb_arcade
this.st_1=create st_1
this.cb_enregistrer=create cb_enregistrer
this.cb_imprimer=create cb_imprimer
this.cb_fermer=create cb_fermer
this.gb_66=create gb_66
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.ole_photo011=create ole_photo011
this.ole_photo012=create ole_photo012
this.ole_photo013=create ole_photo013
this.ole_photo014=create ole_photo014
this.Control[]={this.dw_diagnostic,&
this.pb_2,&
this.ole_photo007,&
this.ole_photo006,&
this.ole_photo005,&
this.ole_photo004,&
this.ole_photo003,&
this.ole_photo002,&
this.ole_photo001,&
this.cb_annuler,&
this.mle_remarques,&
this.ddlb_duree,&
this.st_3,&
this.ddlb_brackets,&
this.st_2,&
this.ddlb_arcade,&
this.st_1,&
this.cb_enregistrer,&
this.cb_imprimer,&
this.cb_fermer,&
this.gb_66,&
this.ole_photo008,&
this.ole_photo009,&
this.ole_photo010,&
this.ole_photo011,&
this.ole_photo012,&
this.ole_photo013,&
this.ole_photo014}
end on

on w_diagnos_maj_adge1.destroy
destroy(this.dw_diagnostic)
destroy(this.pb_2)
destroy(this.ole_photo007)
destroy(this.ole_photo006)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.cb_annuler)
destroy(this.mle_remarques)
destroy(this.ddlb_duree)
destroy(this.st_3)
destroy(this.ddlb_brackets)
destroy(this.st_2)
destroy(this.ddlb_arcade)
destroy(this.st_1)
destroy(this.cb_enregistrer)
destroy(this.cb_imprimer)
destroy(this.cb_fermer)
destroy(this.gb_66)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.ole_photo011)
destroy(this.ole_photo012)
destroy(this.ole_photo013)
destroy(this.ole_photo014)
end on

type dw_diagnostic from datawindow within w_diagnos_maj_adge1
string tag = "no resizeall brush"
integer x = 37
integer y = 884
integer width = 3543
integer height = 540
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_adge"
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

type pb_2 from picturebutton within w_diagnos_maj_adge1
integer x = 3429
integer y = 1724
integer width = 146
integer height = 120
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ar_left.bmp"
alignment htextalign = left!
end type

event clicked;//openwithparm(w_diagnos_maj_adge2,var_code_local)
OpenSheetWithParm ( w_diagnos_maj_adge2 , var_code_local , w_mdi , 0 , Original! )
close(parent)
end event

type ole_photo007 from gearbox within w_diagnos_maj_adge1
integer x = 3104
integer y = 12
integer width = 512
integer height = 424
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_adge1
integer x = 2587
integer y = 12
integer width = 512
integer height = 424
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_adge1
integer x = 2071
integer y = 12
integer width = 512
integer height = 424
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_adge1
integer x = 1554
integer y = 12
integer width = 512
integer height = 424
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_adge1
integer x = 1038
integer y = 12
integer width = 512
integer height = 424
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_adge1
integer x = 521
integer y = 12
integer width = 512
integer height = 424
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_adge1
integer x = 5
integer y = 12
integer width = 512
integer height = 424
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type cb_annuler from commandbutton within w_diagnos_maj_adge1
integer x = 2121
integer y = 1724
integer width = 338
integer height = 120
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

on clicked;init()
end on

type mle_remarques from multilineedit within w_diagnos_maj_adge1
integer x = 338
integer y = 1588
integer width = 1321
integer height = 268
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

type ddlb_duree from dropdownlistbox within w_diagnos_maj_adge1
integer x = 2235
integer y = 1580
integer width = 645
integer height = 384
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"  6 Mois","12 Mois","18 Mois","24 Mois","30 Mois","36 Mois","_"}
end type

type st_3 from statictext within w_diagnos_maj_adge1
integer x = 1993
integer y = 1592
integer width = 229
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Durée :"
boolean focusrectangle = false
end type

type ddlb_brackets from dropdownlistbox within w_diagnos_maj_adge1
integer x = 2231
integer y = 1456
integer width = 777
integer height = 532
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Métal","Esthétique","Lingual","Arc droit","Tip-edge","Tweed","_"}
end type

type st_2 from statictext within w_diagnos_maj_adge1
integer x = 1952
integer y = 1476
integer width = 288
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Brackets :"
boolean focusrectangle = false
end type

type ddlb_arcade from dropdownlistbox within w_diagnos_maj_adge1
integer x = 805
integer y = 1440
integer width = 777
integer height = 532
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Narrow tapered","Tapered","Narrow ovoïd","Ovoïd","_"}
end type

type st_1 from statictext within w_diagnos_maj_adge1
integer x = 302
integer y = 1448
integer width = 503
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Forme d~'arcade :"
boolean focusrectangle = false
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_adge1
integer x = 2496
integer y = 1724
integer width = 338
integer height = 120
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;string pt, diag

place(string(ddlb_arcade.FindItem(ddlb_arcade.text,1)),page,1530)
place(string(ddlb_brackets.FindItem(ddlb_brackets.text,1)),page,1531)
place(string(ddlb_duree.FindItem(ddlb_duree.text,1)),page,1532)

place_avec_blancs(mle_remarques.text,page,1330,200)

//pt = mle_plan.text
//diag = mle_diagnostic.text

UPDATE diagnos SET perso = :page  WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
	rollback ;
else
	
	dw_diagnostic.accepttext()

	// Mise à jour des zones pour myOrthokis
	dw_diagnostic.setItem(1, "patient_traitement_effectue_html", dw_diagnostic.getitemString(1, "texte_brut_traitement_effectue"))
	dw_diagnostic.setItem(1, "patient_plan_traitement_html", dw_diagnostic.getitemString(1, "texte_brut_plan_traitement"))
	
	if dw_diagnostic.update() = 1 then
		modif = false
		commit ;
		if sqlca.sqlcode <> 0 then
			Messagebox("ERREUR BASE DE DONNEES (N°2)",sqlca.sqlerrtext)
		end if
	else
		rollback ;
	end if
end if




end event

type cb_imprimer from commandbutton within w_diagnos_maj_adge1
integer x = 1746
integer y = 1724
integer width = 338
integer height = 120
integer taborder = 70
integer textsize = -8
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

type cb_fermer from commandbutton within w_diagnos_maj_adge1
integer x = 2871
integer y = 1724
integer width = 338
integer height = 120
integer taborder = 110
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

type gb_66 from groupbox within w_diagnos_maj_adge1
integer x = 302
integer y = 1524
integer width = 1381
integer height = 352
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Remarques"
end type

type ole_photo008 from gearbox within w_diagnos_maj_adge1
integer y = 440
integer width = 512
integer height = 424
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_adge1
integer x = 521
integer y = 440
integer width = 512
integer height = 424
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_adge1
integer x = 1038
integer y = 440
integer width = 512
integer height = 424
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type ole_photo011 from gearbox within w_diagnos_maj_adge1
integer x = 1554
integer y = 440
integer width = 512
integer height = 424
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo011.destroy
call gearbox::destroy
end on

type ole_photo012 from gearbox within w_diagnos_maj_adge1
integer x = 2071
integer y = 440
integer width = 512
integer height = 424
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo012.destroy
call gearbox::destroy
end on

type ole_photo013 from gearbox within w_diagnos_maj_adge1
integer x = 2587
integer y = 440
integer width = 512
integer height = 424
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo013.destroy
call gearbox::destroy
end on

type ole_photo014 from gearbox within w_diagnos_maj_adge1
integer x = 3104
integer y = 440
integer width = 512
integer height = 424
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo014.destroy
call gearbox::destroy
end on

