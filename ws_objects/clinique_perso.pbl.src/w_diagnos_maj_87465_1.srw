$PBExportHeader$w_diagnos_maj_87465_1.srw
forward
global type w_diagnos_maj_87465_1 from w_diagnos_maj_
end type
type st_1 from statictext within w_diagnos_maj_87465_1
end type
type st_2 from statictext within w_diagnos_maj_87465_1
end type
type st_3 from statictext within w_diagnos_maj_87465_1
end type
type st_4 from statictext within w_diagnos_maj_87465_1
end type
type st_5 from statictext within w_diagnos_maj_87465_1
end type
type st_6 from statictext within w_diagnos_maj_87465_1
end type
type st_7 from statictext within w_diagnos_maj_87465_1
end type
type st_8 from statictext within w_diagnos_maj_87465_1
end type
type st_9 from statictext within w_diagnos_maj_87465_1
end type
type st_10 from statictext within w_diagnos_maj_87465_1
end type
type ole_photo001 from gearbox within w_diagnos_maj_87465_1
end type
type ole_photo002 from gearbox within w_diagnos_maj_87465_1
end type
type ole_photo004 from gearbox within w_diagnos_maj_87465_1
end type
type ole_photo005 from gearbox within w_diagnos_maj_87465_1
end type
type ole_photo006 from gearbox within w_diagnos_maj_87465_1
end type
type ole_photo007 from gearbox within w_diagnos_maj_87465_1
end type
type sle_1 from singlelineedit within w_diagnos_maj_87465_1
end type
type em_date_debut from editmask within w_diagnos_maj_87465_1
end type
type mle_1 from multilineedit within w_diagnos_maj_87465_1
end type
type mle_diag from multilineedit within w_diagnos_maj_87465_1
end type
type sle_3 from singlelineedit within w_diagnos_maj_87465_1
end type
type sle_4 from singlelineedit within w_diagnos_maj_87465_1
end type
type mle_plan_ttm from multilineedit within w_diagnos_maj_87465_1
end type
type mle_4 from multilineedit within w_diagnos_maj_87465_1
end type
type em_date_dep from editmask within w_diagnos_maj_87465_1
end type
type em_date_naissance from editmask within w_diagnos_maj_87465_1
end type
type ln_1 from line within w_diagnos_maj_87465_1
end type
type ln_2 from line within w_diagnos_maj_87465_1
end type
end forward

global type w_diagnos_maj_87465_1 from w_diagnos_maj_
integer width = 4562
integer height = 2496
string title = "Page Clinique N° 1"
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
st_7 st_7
st_8 st_8
st_9 st_9
st_10 st_10
ole_photo001 ole_photo001
ole_photo002 ole_photo002
ole_photo004 ole_photo004
ole_photo005 ole_photo005
ole_photo006 ole_photo006
ole_photo007 ole_photo007
sle_1 sle_1
em_date_debut em_date_debut
mle_1 mle_1
mle_diag mle_diag
sle_3 sle_3
sle_4 sle_4
mle_plan_ttm mle_plan_ttm
mle_4 mle_4
em_date_dep em_date_dep
em_date_naissance em_date_naissance
ln_1 ln_1
ln_2 ln_2
end type
global w_diagnos_maj_87465_1 w_diagnos_maj_87465_1

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(sle_1,page_buffer[1],1,35)
f.lirepage(em_date_debut,page_buffer[1],36,10)
f.lirepage(mle_1,page_buffer[1],46,500)
f.lirepage(mle_diag,page_buffer[1],546,500)
f.lirepage(sle_3,page_buffer[1],1046,25)
f.lirepage(sle_4,page_buffer[1],1071,25)
f.lirepage(mle_plan_ttm,page_buffer[1],1096,500)
f.lirepage(mle_4,page_buffer[1],1596,500)
f.lirepage(em_date_dep,page_buffer[1],2096,10)
f.lirepage(em_date_naissance,page_buffer[1],2106,10)
// max carac = 2116


date		ld_naissance, deb_trait, date_prem_dem
string		nom, prenom, pt, diag

// Récupération des différentes dates
select date_naissance, debut_traitement, date_prem_demande into :ld_naissance, :deb_trait, :date_prem_dem from patient where patient.code = :var_code_local ;
// date de naissance
if isnull(ld_naissance) then ld_naissance = date("0000-00-00")
em_date_naissance.text = string(ld_naissance, "dd/mm/yyyy")
// date de début de traitement
if isnull(deb_trait) then deb_trait = date("0000-00-00")
em_date_debut.text = " " + string(deb_trait, "dd/mm/yyyy")
// date de première demande
if isnull(date_prem_dem) then date_prem_dem = date("0000-00-00")
em_date_DEP.text = " " + string(date_prem_dem, "dd/mm/yyyy")

// Récupération nom + prénom
select patient.nom, patient.prenom into :nom,:prenom from patient where patient.code = :var_code_local ;
if isnull(nom) then nom = ""
if isnull(prenom) then prenom = ""
sle_1.text = nom + "  " + prenom

// Récupération Diagnostic et Plan de traitement
SELECT plan_traitement, traitement_effectue INTO :pt,:diag FROM patient WHERE code = :var_code_local ;
mle_diag.text = diag
mle_plan_ttm.text = pt
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(sle_1,page_buffer[2],1,35)
f.ecrirepage(em_date_debut,page_buffer[2],36,10)
f.ecrirepage(mle_1,page_buffer[2],46,500)
f.ecrirepage(mle_diag,page_buffer[2],546,500)
f.ecrirepage(sle_3,page_buffer[2],1046,25)
f.ecrirepage(sle_4,page_buffer[2],1071,25)
f.ecrirepage(mle_plan_ttm,page_buffer[2],1096,500)
f.ecrirepage(mle_4,page_buffer[2],1596,500)
f.ecrirepage(em_date_dep,page_buffer[2],2096,10)
f.ecrirepage(em_date_naissance,page_buffer[2],2106,10)
// max carac = 2116
end subroutine

on w_diagnos_maj_87465_1.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_7=create st_7
this.st_8=create st_8
this.st_9=create st_9
this.st_10=create st_10
this.ole_photo001=create ole_photo001
this.ole_photo002=create ole_photo002
this.ole_photo004=create ole_photo004
this.ole_photo005=create ole_photo005
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.sle_1=create sle_1
this.em_date_debut=create em_date_debut
this.mle_1=create mle_1
this.mle_diag=create mle_diag
this.sle_3=create sle_3
this.sle_4=create sle_4
this.mle_plan_ttm=create mle_plan_ttm
this.mle_4=create mle_4
this.em_date_dep=create em_date_dep
this.em_date_naissance=create em_date_naissance
this.ln_1=create ln_1
this.ln_2=create ln_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.st_6
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.st_8
this.Control[iCurrent+9]=this.st_9
this.Control[iCurrent+10]=this.st_10
this.Control[iCurrent+11]=this.ole_photo001
this.Control[iCurrent+12]=this.ole_photo002
this.Control[iCurrent+13]=this.ole_photo004
this.Control[iCurrent+14]=this.ole_photo005
this.Control[iCurrent+15]=this.ole_photo006
this.Control[iCurrent+16]=this.ole_photo007
this.Control[iCurrent+17]=this.sle_1
this.Control[iCurrent+18]=this.em_date_debut
this.Control[iCurrent+19]=this.mle_1
this.Control[iCurrent+20]=this.mle_diag
this.Control[iCurrent+21]=this.sle_3
this.Control[iCurrent+22]=this.sle_4
this.Control[iCurrent+23]=this.mle_plan_ttm
this.Control[iCurrent+24]=this.mle_4
this.Control[iCurrent+25]=this.em_date_dep
this.Control[iCurrent+26]=this.em_date_naissance
this.Control[iCurrent+27]=this.ln_1
this.Control[iCurrent+28]=this.ln_2
end on

on w_diagnos_maj_87465_1.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.ole_photo001)
destroy(this.ole_photo002)
destroy(this.ole_photo004)
destroy(this.ole_photo005)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.sle_1)
destroy(this.em_date_debut)
destroy(this.mle_1)
destroy(this.mle_diag)
destroy(this.sle_3)
destroy(this.sle_4)
destroy(this.mle_plan_ttm)
destroy(this.mle_4)
destroy(this.em_date_dep)
destroy(this.em_date_naissance)
destroy(this.ln_1)
destroy(this.ln_2)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87465_1
string tag = "87465_2"
integer x = 4361
integer y = 2256
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87465_1
boolean visible = false
integer x = 4197
integer y = 2256
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87465_1
integer x = 2441
integer y = 2256
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87465_1
integer x = 3319
integer y = 2256
end type

event cb_sauver::clicked;call super::clicked;string pt, diag
date  deb_trait, date_prem_dem

pt = mle_plan_ttm.text
diag = mle_diag.text
deb_trait = date(em_date_debut.text)
date_prem_dem = date(em_date_DEP.text)

	UPDATE patient SET plan_traitement = :pt, traitement_effectue = :diag, debut_traitement = :deb_trait, date_prem_demande = :date_prem_dem WHERE code = :var_code_local ;
	if SQLCA.Sqlcode <> 0 then
		son(4)
		Messagebox("ERREUR BASE DE DONNEES (N°2)",SQLCA.SqlErrText)
	else
		modif = false
		COMMIT ;
	end if
end event

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87465_1
integer x = 2880
integer y = 2256
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87465_1
integer x = 3758
integer y = 2256
end type

type st_1 from statictext within w_diagnos_maj_87465_1
integer x = 987
integer y = 48
integer width = 434
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nom / Prénom :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87465_1
integer x = 2578
integer y = 48
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Né(e) le :"
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87465_1
integer x = 55
integer y = 936
integer width = 635
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Début de traitement le :"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_87465_1
integer x = 55
integer y = 1080
integer width = 219
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notes :"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87465_1
integer x = 55
integer y = 1320
integer width = 302
integer height = 72
boolean bringtotop = true
integer textsize = -10
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

type st_6 from statictext within w_diagnos_maj_87465_1
integer x = 869
integer y = 1584
integer width = 535
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Plan de traitement :"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_87465_1
integer x = 3223
integer y = 1584
integer width = 384
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Appareillage :"
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_87465_1
integer x = 274
integer y = 2136
integer width = 192
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Devis :"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_87465_1
integer x = 1563
integer y = 2208
integer width = 329
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "1ère D.E.P :"
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_87465_1
integer x = 55
integer y = 2280
integer width = 434
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Durée estimée :"
boolean focusrectangle = false
end type

type ole_photo001 from gearbox within w_diagnos_maj_87465_1
integer x = 1426
integer y = 168
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_87465_1
integer x = 2030
integer y = 168
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_87465_1
integer x = 2633
integer y = 168
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo005 from gearbox within w_diagnos_maj_87465_1
integer x = 1426
integer y = 600
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo006 from gearbox within w_diagnos_maj_87465_1
integer x = 2030
integer y = 600
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_87465_1
integer x = 2633
integer y = 600
integer width = 521
integer height = 360
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type sle_1 from singlelineedit within w_diagnos_maj_87465_1
integer x = 1426
integer y = 24
integer width = 1015
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 35
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

type em_date_debut from editmask within w_diagnos_maj_87465_1
integer x = 686
integer y = 936
integer width = 329
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type mle_1 from multilineedit within w_diagnos_maj_87465_1
integer x = 357
integer y = 1080
integer width = 4169
integer height = 216
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 500
end type

type mle_diag from multilineedit within w_diagnos_maj_87465_1
integer x = 357
integer y = 1320
integer width = 4169
integer height = 216
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
boolean autovscroll = true
integer limit = 500
end type

type sle_3 from singlelineedit within w_diagnos_maj_87465_1
integer x = 494
integer y = 2112
integer width = 741
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type sle_4 from singlelineedit within w_diagnos_maj_87465_1
integer x = 494
integer y = 2256
integer width = 741
integer height = 96
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type mle_plan_ttm from multilineedit within w_diagnos_maj_87465_1
integer x = 27
integer y = 1656
integer width = 2222
integer height = 384
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
integer limit = 500
end type

type mle_4 from multilineedit within w_diagnos_maj_87465_1
integer x = 2304
integer y = 1656
integer width = 2222
integer height = 384
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean vscrollbar = true
integer limit = 500
end type

type em_date_dep from editmask within w_diagnos_maj_87465_1
integer x = 1920
integer y = 2208
integer width = 329
integer height = 72
integer taborder = 100
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_date_naissance from editmask within w_diagnos_maj_87465_1
integer x = 2825
integer y = 48
integer width = 329
integer height = 72
integer taborder = 20
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
boolean displayonly = true
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type ln_1 from line within w_diagnos_maj_87465_1
integer linethickness = 4
integer beginx = 2277
integer beginy = 1584
integer endx = 2277
integer endy = 2040
end type

type ln_2 from line within w_diagnos_maj_87465_1
integer linethickness = 4
integer beginx = 55
integer beginy = 1032
integer endx = 4498
integer endy = 1032
end type

