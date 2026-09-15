$PBExportHeader$w_diagnos_maj_piquet2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_piquet2 from w_diagnos_maj_
end type
type cbx_6 from checkbox within w_diagnos_maj_piquet2
end type
type cbx_5 from checkbox within w_diagnos_maj_piquet2
end type
type cbx_4 from checkbox within w_diagnos_maj_piquet2
end type
type cbx_3 from checkbox within w_diagnos_maj_piquet2
end type
type cbx_2 from checkbox within w_diagnos_maj_piquet2
end type
type cbx_1 from checkbox within w_diagnos_maj_piquet2
end type
type ole_photo005 from gearbox within w_diagnos_maj_piquet2
end type
type ole_photo004 from gearbox within w_diagnos_maj_piquet2
end type
type ole_photo003 from gearbox within w_diagnos_maj_piquet2
end type
type ole_photo002 from gearbox within w_diagnos_maj_piquet2
end type
type ole_photo001 from gearbox within w_diagnos_maj_piquet2
end type
type mle_remarques from multilineedit within w_diagnos_maj_piquet2
end type
type mle_diag_cephal from multilineedit within w_diagnos_maj_piquet2
end type
type sle_surnum from singlelineedit within w_diagnos_maj_piquet2
end type
type sle_agenesie from singlelineedit within w_diagnos_maj_piquet2
end type
type cbx_ds3 from checkbox within w_diagnos_maj_piquet2
end type
type cbx_ds4 from checkbox within w_diagnos_maj_piquet2
end type
type cbx_ds2 from checkbox within w_diagnos_maj_piquet2
end type
type st_4 from statictext within w_diagnos_maj_piquet2
end type
type cbx_ds1 from checkbox within w_diagnos_maj_piquet2
end type
type st_3 from statictext within w_diagnos_maj_piquet2
end type
type st_2 from statictext within w_diagnos_maj_piquet2
end type
type st_1 from statictext within w_diagnos_maj_piquet2
end type
type mle_diag_clin from multilineedit within w_diagnos_maj_piquet2
end type
type ole_photo006 from gearbox within w_diagnos_maj_piquet2
end type
type ole_photo007 from gearbox within w_diagnos_maj_piquet2
end type
type ole_photo008 from gearbox within w_diagnos_maj_piquet2
end type
type ole_photo009 from gearbox within w_diagnos_maj_piquet2
end type
type ole_photo010 from gearbox within w_diagnos_maj_piquet2
end type
type sle_1 from singlelineedit within w_diagnos_maj_piquet2
end type
type em_1 from editmask within w_diagnos_maj_piquet2
end type
type em_2 from editmask within w_diagnos_maj_piquet2
end type
type em_3 from editmask within w_diagnos_maj_piquet2
end type
type em_4 from editmask within w_diagnos_maj_piquet2
end type
type em_5 from editmask within w_diagnos_maj_piquet2
end type
type em_6 from editmask within w_diagnos_maj_piquet2
end type
type em_7 from editmask within w_diagnos_maj_piquet2
end type
type em_8 from editmask within w_diagnos_maj_piquet2
end type
type em_9 from editmask within w_diagnos_maj_piquet2
end type
type em_10 from editmask within w_diagnos_maj_piquet2
end type
type dw_diag2 from datawindow within w_diagnos_maj_piquet2
end type
type dw_diag1 from datawindow within w_diagnos_maj_piquet2
end type
type gb_7 from groupbox within w_diagnos_maj_piquet2
end type
type gb_5 from groupbox within w_diagnos_maj_piquet2
end type
type gb_6 from groupbox within w_diagnos_maj_piquet2
end type
type gb_4 from groupbox within w_diagnos_maj_piquet2
end type
type ln_1 from line within w_diagnos_maj_piquet2
end type
type ln_2 from line within w_diagnos_maj_piquet2
end type
end forward

global type w_diagnos_maj_piquet2 from w_diagnos_maj_
integer width = 4553
integer height = 2524
string title = "Page Clinique N°2"
cbx_6 cbx_6
cbx_5 cbx_5
cbx_4 cbx_4
cbx_3 cbx_3
cbx_2 cbx_2
cbx_1 cbx_1
ole_photo005 ole_photo005
ole_photo004 ole_photo004
ole_photo003 ole_photo003
ole_photo002 ole_photo002
ole_photo001 ole_photo001
mle_remarques mle_remarques
mle_diag_cephal mle_diag_cephal
sle_surnum sle_surnum
sle_agenesie sle_agenesie
cbx_ds3 cbx_ds3
cbx_ds4 cbx_ds4
cbx_ds2 cbx_ds2
st_4 st_4
cbx_ds1 cbx_ds1
st_3 st_3
st_2 st_2
st_1 st_1
mle_diag_clin mle_diag_clin
ole_photo006 ole_photo006
ole_photo007 ole_photo007
ole_photo008 ole_photo008
ole_photo009 ole_photo009
ole_photo010 ole_photo010
sle_1 sle_1
em_1 em_1
em_2 em_2
em_3 em_3
em_4 em_4
em_5 em_5
em_6 em_6
em_7 em_7
em_8 em_8
em_9 em_9
em_10 em_10
dw_diag2 dw_diag2
dw_diag1 dw_diag1
gb_7 gb_7
gb_5 gb_5
gb_6 gb_6
gb_4 gb_4
ln_1 ln_1
ln_2 ln_2
end type
global w_diagnos_maj_piquet2 w_diagnos_maj_piquet2

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();string rem
SELECT remarques INTO :rem FROM diagnos WHERE code = :var_code_local ;
if isnull (rem) then rem = ""
mle_remarques.text = rem

if mid(page_buffer[1],1400,1) = 'O' then
	cbx_ds1.checked = true
end if
if mid(page_buffer[1],1401,1) = 'O' then
	cbx_ds2.checked = true
end if
if mid(page_buffer[1],1402,1) = 'O' then
	cbx_ds3.checked = true
end if
if mid(page_buffer[1],1403,1) = 'O' then
	cbx_ds4.checked = true
end if

sle_agenesie.text = RightTrim(mid(page_buffer[1],1404,40))
sle_surnum.text = RightTrim(mid(page_buffer[1],1444,40))
mle_diag_clin.text = RightTrim(mid(page_buffer[1],723,300))
mle_diag_cephal.text = RightTrim(mid(page_buffer[1],1700,200))

// rajout des modifs du 27/09/2005
//f.lire_pt( mle_plan_traitement, var_code_local)
//f.lire_d(mle_1, var_code_local)

f.lirepage(sle_1, page_buffer[1],2280,30)
f.lirepage(cbx_1, page_buffer[1],2310)
f.lirepage(cbx_2, page_buffer[1],2311)
f.lirepage(cbx_3, page_buffer[1],2312)
f.lirepage(cbx_4, page_buffer[1],2313)
f.lirepage(cbx_5, page_buffer[1],2314)
f.lirepage(cbx_6, page_buffer[1],2315)
f.lirepage(em_1, page_buffer[1],2320,10)
f.lirepage(em_2, page_buffer[1],2330,10)
f.lirepage(em_3, page_buffer[1],2340,10)
f.lirepage(em_4, page_buffer[1],2350,10)
f.lirepage(em_5, page_buffer[1],2360,10)
f.lirepage(em_6, page_buffer[1],2370,10)
f.lirepage(em_7, page_buffer[1],2380,10)
f.lirepage(em_8, page_buffer[1],2390,10)
f.lirepage(em_9, page_buffer[1],2400,10)
f.lirepage(em_10, page_buffer[1],2410,10)
// max carac = 2420



dw_diag1.SetTransObject(SQLCA)
dw_diag1.Retrieve(var_code_local)

dw_diag2.SetTransObject(SQLCA)
dw_diag2.Retrieve(var_code_local)



end subroutine

public subroutine unload_ctrls ();if cbx_ds1.checked then
	place("O",page_buffer[2],1400)
else
	place("N",page_buffer[2],1400)
end if
if cbx_ds2.checked then
	place("O",page_buffer[2],1401)
else
	place("N",page_buffer[2],1401)
end if
if cbx_ds3.checked then
	place("O",page_buffer[2],1402)
else
	place("N",page_buffer[2],1402)
end if
if cbx_ds4.checked then
	place("O",page_buffer[2],1403)
else
	place("N",page_buffer[2],1403)
end if
place_avec_blancs(sle_agenesie.text,page_buffer[2],1404,40)
place_avec_blancs(sle_surnum.text,page_buffer[2],1444,40)
place_avec_blancs(mle_diag_clin.text,page_buffer[2],723,300)
place_avec_blancs(mle_diag_cephal.text,page_buffer[2],1700,200)

string rem
rem = mle_remarques.text
UPDATE diagnos SET remarques = :rem WHERE code = :var_code_local ;
if SQLCA.Sqlcode <> 0 then
	Messagebox("ERREUR ...","Impossible de mettre à jour le champs 'Remarques'")
else
	COMMIT ;
end if

// rajout des modifs du 27/09/2005
//f.ecrire_pt( mle_plan_traitement, var_code_local)
//f.ecrire_d(mle_1, var_code_local)

f.ecrirepage(sle_1, page_buffer[2],2280,30)
f.ecrirepage(cbx_1, page_buffer[2],2310)
f.ecrirepage(cbx_2, page_buffer[2],2311)
f.ecrirepage(cbx_3, page_buffer[2],2312)
f.ecrirepage(cbx_4, page_buffer[2],2313)
f.ecrirepage(cbx_5, page_buffer[2],2314)
f.ecrirepage(cbx_6, page_buffer[2],2315)
f.ecrirepage(em_1, page_buffer[2],2320,10)
f.ecrirepage(em_2, page_buffer[2],2330,10)
f.ecrirepage(em_3, page_buffer[2],2340,10)
f.ecrirepage(em_4, page_buffer[2],2350,10)
f.ecrirepage(em_5, page_buffer[2],2360,10)
f.ecrirepage(em_6, page_buffer[2],2370,10)
f.ecrirepage(em_7, page_buffer[2],2380,10)
f.ecrirepage(em_8, page_buffer[2],2390,10)
f.ecrirepage(em_9, page_buffer[2],2400,10)
f.ecrirepage(em_10, page_buffer[2],2410,10)
// max carac = 2420
end subroutine

on w_diagnos_maj_piquet2.create
int iCurrent
call super::create
this.cbx_6=create cbx_6
this.cbx_5=create cbx_5
this.cbx_4=create cbx_4
this.cbx_3=create cbx_3
this.cbx_2=create cbx_2
this.cbx_1=create cbx_1
this.ole_photo005=create ole_photo005
this.ole_photo004=create ole_photo004
this.ole_photo003=create ole_photo003
this.ole_photo002=create ole_photo002
this.ole_photo001=create ole_photo001
this.mle_remarques=create mle_remarques
this.mle_diag_cephal=create mle_diag_cephal
this.sle_surnum=create sle_surnum
this.sle_agenesie=create sle_agenesie
this.cbx_ds3=create cbx_ds3
this.cbx_ds4=create cbx_ds4
this.cbx_ds2=create cbx_ds2
this.st_4=create st_4
this.cbx_ds1=create cbx_ds1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_diag_clin=create mle_diag_clin
this.ole_photo006=create ole_photo006
this.ole_photo007=create ole_photo007
this.ole_photo008=create ole_photo008
this.ole_photo009=create ole_photo009
this.ole_photo010=create ole_photo010
this.sle_1=create sle_1
this.em_1=create em_1
this.em_2=create em_2
this.em_3=create em_3
this.em_4=create em_4
this.em_5=create em_5
this.em_6=create em_6
this.em_7=create em_7
this.em_8=create em_8
this.em_9=create em_9
this.em_10=create em_10
this.dw_diag2=create dw_diag2
this.dw_diag1=create dw_diag1
this.gb_7=create gb_7
this.gb_5=create gb_5
this.gb_6=create gb_6
this.gb_4=create gb_4
this.ln_1=create ln_1
this.ln_2=create ln_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cbx_6
this.Control[iCurrent+2]=this.cbx_5
this.Control[iCurrent+3]=this.cbx_4
this.Control[iCurrent+4]=this.cbx_3
this.Control[iCurrent+5]=this.cbx_2
this.Control[iCurrent+6]=this.cbx_1
this.Control[iCurrent+7]=this.ole_photo005
this.Control[iCurrent+8]=this.ole_photo004
this.Control[iCurrent+9]=this.ole_photo003
this.Control[iCurrent+10]=this.ole_photo002
this.Control[iCurrent+11]=this.ole_photo001
this.Control[iCurrent+12]=this.mle_remarques
this.Control[iCurrent+13]=this.mle_diag_cephal
this.Control[iCurrent+14]=this.sle_surnum
this.Control[iCurrent+15]=this.sle_agenesie
this.Control[iCurrent+16]=this.cbx_ds3
this.Control[iCurrent+17]=this.cbx_ds4
this.Control[iCurrent+18]=this.cbx_ds2
this.Control[iCurrent+19]=this.st_4
this.Control[iCurrent+20]=this.cbx_ds1
this.Control[iCurrent+21]=this.st_3
this.Control[iCurrent+22]=this.st_2
this.Control[iCurrent+23]=this.st_1
this.Control[iCurrent+24]=this.mle_diag_clin
this.Control[iCurrent+25]=this.ole_photo006
this.Control[iCurrent+26]=this.ole_photo007
this.Control[iCurrent+27]=this.ole_photo008
this.Control[iCurrent+28]=this.ole_photo009
this.Control[iCurrent+29]=this.ole_photo010
this.Control[iCurrent+30]=this.sle_1
this.Control[iCurrent+31]=this.em_1
this.Control[iCurrent+32]=this.em_2
this.Control[iCurrent+33]=this.em_3
this.Control[iCurrent+34]=this.em_4
this.Control[iCurrent+35]=this.em_5
this.Control[iCurrent+36]=this.em_6
this.Control[iCurrent+37]=this.em_7
this.Control[iCurrent+38]=this.em_8
this.Control[iCurrent+39]=this.em_9
this.Control[iCurrent+40]=this.em_10
this.Control[iCurrent+41]=this.dw_diag2
this.Control[iCurrent+42]=this.dw_diag1
this.Control[iCurrent+43]=this.gb_7
this.Control[iCurrent+44]=this.gb_5
this.Control[iCurrent+45]=this.gb_6
this.Control[iCurrent+46]=this.gb_4
this.Control[iCurrent+47]=this.ln_1
this.Control[iCurrent+48]=this.ln_2
end on

on w_diagnos_maj_piquet2.destroy
call super::destroy
destroy(this.cbx_6)
destroy(this.cbx_5)
destroy(this.cbx_4)
destroy(this.cbx_3)
destroy(this.cbx_2)
destroy(this.cbx_1)
destroy(this.ole_photo005)
destroy(this.ole_photo004)
destroy(this.ole_photo003)
destroy(this.ole_photo002)
destroy(this.ole_photo001)
destroy(this.mle_remarques)
destroy(this.mle_diag_cephal)
destroy(this.sle_surnum)
destroy(this.sle_agenesie)
destroy(this.cbx_ds3)
destroy(this.cbx_ds4)
destroy(this.cbx_ds2)
destroy(this.st_4)
destroy(this.cbx_ds1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_diag_clin)
destroy(this.ole_photo006)
destroy(this.ole_photo007)
destroy(this.ole_photo008)
destroy(this.ole_photo009)
destroy(this.ole_photo010)
destroy(this.sle_1)
destroy(this.em_1)
destroy(this.em_2)
destroy(this.em_3)
destroy(this.em_4)
destroy(this.em_5)
destroy(this.em_6)
destroy(this.em_7)
destroy(this.em_8)
destroy(this.em_9)
destroy(this.em_10)
destroy(this.dw_diag2)
destroy(this.dw_diag1)
destroy(this.gb_7)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.gb_4)
destroy(this.ln_1)
destroy(this.ln_2)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_piquet2
string tag = "piquet3"
integer x = 4334
integer y = 2232
integer taborder = 280
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_piquet2
string tag = "piquet1"
integer x = 4169
integer y = 2232
integer taborder = 270
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_piquet2
integer x = 2414
integer y = 2232
integer taborder = 230
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_piquet2
integer x = 3291
integer y = 2232
integer taborder = 250
end type

event cb_sauver::clicked;call super::clicked;



dw_diag1.accepttext()
 // Mise à jour des zones pour myOrthokis
dw_diag1.setItem(1, "traitement_effectue_html", dw_diag1.getitemString(1, "texte_brut_traitement_effectue"))

if dw_diag1.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if


dw_diag2.accepttext()

// Mise à jour des zones pour myOrthokis
dw_diag2.setItem(1, "plan_traitement_html", dw_diag2.getitemString(1, "texte_brut_plan_traitement"))

if dw_diag2.update() = 1 then
	commit ;
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR DANS LA MISE A JOUR N°"+string(sqlca.sqlcode),sqlca.sqlerrtext)
	end if
else
	rollback ;
end if



end event

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_piquet2
integer x = 2853
integer y = 2232
integer taborder = 240
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_piquet2
integer x = 3730
integer y = 2232
integer taborder = 260
end type

type cbx_6 from checkbox within w_diagnos_maj_piquet2
integer x = 878
integer y = 2136
integer width = 274
integer height = 72
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "autre"
end type

type cbx_5 from checkbox within w_diagnos_maj_piquet2
integer x = 878
integer y = 2064
integer width = 384
integer height = 72
integer taborder = 180
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "bilan ORL"
end type

type cbx_4 from checkbox within w_diagnos_maj_piquet2
integer x = 878
integer y = 1992
integer width = 549
integer height = 72
integer taborder = 170
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "bilan orthophonique"
end type

type cbx_3 from checkbox within w_diagnos_maj_piquet2
integer x = 219
integer y = 2136
integer width = 521
integer height = 72
integer taborder = 160
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "télécrane de face"
end type

type cbx_2 from checkbox within w_diagnos_maj_piquet2
integer x = 219
integer y = 2064
integer width = 521
integer height = 72
integer taborder = 150
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "télécrane de profil"
end type

type cbx_1 from checkbox within w_diagnos_maj_piquet2
integer x = 219
integer y = 1992
integer width = 411
integer height = 72
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "panoramique"
end type

type ole_photo005 from gearbox within w_diagnos_maj_piquet2
integer x = 3675
integer y = 24
integer width = 631
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo005.destroy
call gearbox::destroy
end on

type ole_photo004 from gearbox within w_diagnos_maj_piquet2
integer x = 2798
integer y = 24
integer width = 631
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo004.destroy
call gearbox::destroy
end on

type ole_photo003 from gearbox within w_diagnos_maj_piquet2
integer x = 1920
integer y = 24
integer width = 631
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo003.destroy
call gearbox::destroy
end on

type ole_photo002 from gearbox within w_diagnos_maj_piquet2
integer x = 1042
integer y = 24
integer width = 631
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo002.destroy
call gearbox::destroy
end on

type ole_photo001 from gearbox within w_diagnos_maj_piquet2
integer x = 165
integer y = 24
integer width = 631
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type mle_remarques from multilineedit within w_diagnos_maj_piquet2
integer x = 2359
integer y = 1728
integer width = 1975
integer height = 408
integer taborder = 220
boolean bringtotop = true
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

type mle_diag_cephal from multilineedit within w_diagnos_maj_piquet2
boolean visible = false
integer x = 4992
integer y = 720
integer width = 736
integer height = 212
boolean bringtotop = true
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

type sle_surnum from singlelineedit within w_diagnos_maj_piquet2
integer x = 603
integer y = 1200
integer width = 1207
integer height = 72
integer taborder = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_agenesie from singlelineedit within w_diagnos_maj_piquet2
integer x = 603
integer y = 1080
integer width = 1207
integer height = 72
integer taborder = 110
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type cbx_ds3 from checkbox within w_diagnos_maj_piquet2
boolean visible = false
integer x = 5321
integer y = 216
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean lefttext = true
end type

event clicked;modif = true
end event

type cbx_ds4 from checkbox within w_diagnos_maj_piquet2
boolean visible = false
integer x = 5595
integer y = 216
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean lefttext = true
end type

event clicked;modif = true
end event

type cbx_ds2 from checkbox within w_diagnos_maj_piquet2
boolean visible = false
integer x = 5595
integer y = 144
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean lefttext = true
end type

event clicked;modif = true
end event

type st_4 from statictext within w_diagnos_maj_piquet2
boolean visible = false
integer x = 5074
integer y = 192
integer width = 119
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "DS"
boolean focusrectangle = false
end type

type cbx_ds1 from checkbox within w_diagnos_maj_piquet2
boolean visible = false
integer x = 5321
integer y = 144
integer width = 64
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean lefttext = true
end type

event clicked;modif = true
end event

type st_3 from statictext within w_diagnos_maj_piquet2
integer x = 329
integer y = 1176
integer width = 247
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Dents Surnum."
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_piquet2
integer x = 329
integer y = 1080
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
boolean enabled = false
string text = "Agénésie"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_piquet2
boolean visible = false
integer x = 4855
integer y = 144
integer width = 334
integer height = 76
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Panoramique"
boolean focusrectangle = false
end type

type mle_diag_clin from multilineedit within w_diagnos_maj_piquet2
boolean visible = false
integer x = 5074
integer y = 384
integer width = 384
integer height = 192
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 300
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type ole_photo006 from gearbox within w_diagnos_maj_piquet2
integer x = 165
integer y = 528
integer width = 631
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo006.destroy
call gearbox::destroy
end on

type ole_photo007 from gearbox within w_diagnos_maj_piquet2
integer x = 1042
integer y = 528
integer width = 631
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo007.destroy
call gearbox::destroy
end on

type ole_photo008 from gearbox within w_diagnos_maj_piquet2
integer x = 1920
integer y = 528
integer width = 631
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo008.destroy
call gearbox::destroy
end on

type ole_photo009 from gearbox within w_diagnos_maj_piquet2
integer x = 2798
integer y = 528
integer width = 631
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo009.destroy
call gearbox::destroy
end on

type ole_photo010 from gearbox within w_diagnos_maj_piquet2
integer x = 3675
integer y = 528
integer width = 631
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo010.destroy
call gearbox::destroy
end on

type sle_1 from singlelineedit within w_diagnos_maj_piquet2
integer x = 1152
integer y = 2136
integer width = 960
integer height = 72
integer taborder = 200
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type em_1 from editmask within w_diagnos_maj_piquet2
integer x = 466
integer y = 432
integer width = 329
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_2 from editmask within w_diagnos_maj_piquet2
integer x = 1344
integer y = 432
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_3 from editmask within w_diagnos_maj_piquet2
integer x = 2222
integer y = 432
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_4 from editmask within w_diagnos_maj_piquet2
integer x = 3099
integer y = 432
integer width = 329
integer height = 72
integer taborder = 40
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_5 from editmask within w_diagnos_maj_piquet2
integer x = 3977
integer y = 432
integer width = 329
integer height = 72
integer taborder = 50
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_6 from editmask within w_diagnos_maj_piquet2
integer x = 466
integer y = 936
integer width = 329
integer height = 72
integer taborder = 60
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_7 from editmask within w_diagnos_maj_piquet2
integer x = 1344
integer y = 936
integer width = 329
integer height = 72
integer taborder = 70
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_8 from editmask within w_diagnos_maj_piquet2
integer x = 2222
integer y = 936
integer width = 329
integer height = 72
integer taborder = 80
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_9 from editmask within w_diagnos_maj_piquet2
integer x = 3099
integer y = 936
integer width = 329
integer height = 72
integer taborder = 90
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_10 from editmask within w_diagnos_maj_piquet2
integer x = 3977
integer y = 936
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
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type dw_diag2 from datawindow within w_diagnos_maj_piquet2
integer x = 2336
integer y = 1144
integer width = 2025
integer height = 436
integer taborder = 160
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_piquet2"
boolean border = false
boolean livescroll = true
end type

type dw_diag1 from datawindow within w_diagnos_maj_piquet2
integer x = 142
integer y = 1404
integer width = 2025
integer height = 436
integer taborder = 150
boolean bringtotop = true
string title = "none"
string dataobject = "dw_diag_piquet1"
boolean border = false
boolean livescroll = true
end type

type gb_7 from groupbox within w_diagnos_maj_piquet2
integer x = 2304
integer y = 1656
integer width = 2085
integer height = 528
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "REMARQUES"
end type

type gb_5 from groupbox within w_diagnos_maj_piquet2
boolean visible = false
integer x = 110
integer y = 1896
integer width = 2085
integer height = 384
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "DEMANDE D~'EXAMENS COMPLEMENTAIRES"
end type

type gb_6 from groupbox within w_diagnos_maj_piquet2
integer x = 2304
integer y = 1080
integer width = 2085
integer height = 528
integer taborder = 120
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "PLAN DE TRAITEMENT"
end type

type gb_4 from groupbox within w_diagnos_maj_piquet2
integer x = 110
integer y = 1344
integer width = 2085
integer height = 528
integer taborder = 130
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 81324524
string text = "DIAGNOSTIC"
end type

type ln_1 from line within w_diagnos_maj_piquet2
boolean visible = false
integer linethickness = 5
integer beginx = 5486
integer beginy = 144
integer endx = 5486
integer endy = 288
end type

type ln_2 from line within w_diagnos_maj_piquet2
boolean visible = false
integer linethickness = 5
integer beginx = 5239
integer beginy = 216
integer endx = 5751
integer endy = 216
end type

