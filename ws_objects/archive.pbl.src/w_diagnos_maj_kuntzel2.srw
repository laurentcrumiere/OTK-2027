$PBExportHeader$w_diagnos_maj_kuntzel2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_kuntzel2 from window
end type
type st_16 from statictext within w_diagnos_maj_kuntzel2
end type
type sle_sante from singlelineedit within w_diagnos_maj_kuntzel2
end type
type sle_sanguin from singlelineedit within w_diagnos_maj_kuntzel2
end type
type sle_allergie from singlelineedit within w_diagnos_maj_kuntzel2
end type
type sle_medicament from singlelineedit within w_diagnos_maj_kuntzel2
end type
type sle_maux from singlelineedit within w_diagnos_maj_kuntzel2
end type
type sle_surnum from singlelineedit within w_diagnos_maj_kuntzel2
end type
type sle_extraction from singlelineedit within w_diagnos_maj_kuntzel2
end type
type sle_agenesie from singlelineedit within w_diagnos_maj_kuntzel2
end type
type lb_medicament from listbox within w_diagnos_maj_kuntzel2
end type
type lb_surnu from listbox within w_diagnos_maj_kuntzel2
end type
type dw_1 from datawindow within w_diagnos_maj_kuntzel2
end type
type ddplb_levres from dropdownpicturelistbox within w_diagnos_maj_kuntzel2
end type
type ddplb_volume from dropdownpicturelistbox within w_diagnos_maj_kuntzel2
end type
type st_8 from statictext within w_diagnos_maj_kuntzel2
end type
type st_9 from statictext within w_diagnos_maj_kuntzel2
end type
type ddplb_phonation from dropdownpicturelistbox within w_diagnos_maj_kuntzel2
end type
type ddplb_deglutition from dropdownpicturelistbox within w_diagnos_maj_kuntzel2
end type
type cbx_levre_inf from checkbox within w_diagnos_maj_kuntzel2
end type
type cbx_levre_sup from checkbox within w_diagnos_maj_kuntzel2
end type
type st_13 from statictext within w_diagnos_maj_kuntzel2
end type
type cbx_langue from checkbox within w_diagnos_maj_kuntzel2
end type
type sle_prematurites from singlelineedit within w_diagnos_maj_kuntzel2
end type
type st_12 from statictext within w_diagnos_maj_kuntzel2
end type
type ddplb_amplitude from dropdownpicturelistbox within w_diagnos_maj_kuntzel2
end type
type st_11 from statictext within w_diagnos_maj_kuntzel2
end type
type ddlb_chemin from dropdownlistbox within w_diagnos_maj_kuntzel2
end type
type st_10 from statictext within w_diagnos_maj_kuntzel2
end type
type cbx_ressaut from checkbox within w_diagnos_maj_kuntzel2
end type
type cbx_craquement from checkbox within w_diagnos_maj_kuntzel2
end type
type cbx_douleur from checkbox within w_diagnos_maj_kuntzel2
end type
type ddlb_langue from dropdownlistbox within w_diagnos_maj_kuntzel2
end type
type ddlb_vegetations from dropdownlistbox within w_diagnos_maj_kuntzel2
end type
type ddlb_amygdales from dropdownlistbox within w_diagnos_maj_kuntzel2
end type
type st_6 from statictext within w_diagnos_maj_kuntzel2
end type
type st_5 from statictext within w_diagnos_maj_kuntzel2
end type
type st_4 from statictext within w_diagnos_maj_kuntzel2
end type
type cbx_onychophagie from checkbox within w_diagnos_maj_kuntzel2
end type
type cbx_bruxisme from checkbox within w_diagnos_maj_kuntzel2
end type
type cbx_suceur from checkbox within w_diagnos_maj_kuntzel2
end type
type st_3 from statictext within w_diagnos_maj_kuntzel2
end type
type st_2 from statictext within w_diagnos_maj_kuntzel2
end type
type ddlb_respiration from dropdownlistbox within w_diagnos_maj_kuntzel2
end type
type st_1 from statictext within w_diagnos_maj_kuntzel2
end type
type gb_7 from groupbox within w_diagnos_maj_kuntzel2
end type
type gb_6 from groupbox within w_diagnos_maj_kuntzel2
end type
type gb_3 from groupbox within w_diagnos_maj_kuntzel2
end type
type gb_2 from groupbox within w_diagnos_maj_kuntzel2
end type
type gb_1 from groupbox within w_diagnos_maj_kuntzel2
end type
type mle_paro from multilineedit within w_diagnos_maj_kuntzel2
end type
end forward

global type w_diagnos_maj_kuntzel2 from window
integer x = 5
integer y = 8
integer width = 3657
integer height = 2312
boolean titlebar = true
string title = "Page N°2"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 12632256
st_16 st_16
sle_sante sle_sante
sle_sanguin sle_sanguin
sle_allergie sle_allergie
sle_medicament sle_medicament
sle_maux sle_maux
sle_surnum sle_surnum
sle_extraction sle_extraction
sle_agenesie sle_agenesie
lb_medicament lb_medicament
lb_surnu lb_surnu
dw_1 dw_1
ddplb_levres ddplb_levres
ddplb_volume ddplb_volume
st_8 st_8
st_9 st_9
ddplb_phonation ddplb_phonation
ddplb_deglutition ddplb_deglutition
cbx_levre_inf cbx_levre_inf
cbx_levre_sup cbx_levre_sup
st_13 st_13
cbx_langue cbx_langue
sle_prematurites sle_prematurites
st_12 st_12
ddplb_amplitude ddplb_amplitude
st_11 st_11
ddlb_chemin ddlb_chemin
st_10 st_10
cbx_ressaut cbx_ressaut
cbx_craquement cbx_craquement
cbx_douleur cbx_douleur
ddlb_langue ddlb_langue
ddlb_vegetations ddlb_vegetations
ddlb_amygdales ddlb_amygdales
st_6 st_6
st_5 st_5
st_4 st_4
cbx_onychophagie cbx_onychophagie
cbx_bruxisme cbx_bruxisme
cbx_suceur cbx_suceur
st_3 st_3
st_2 st_2
ddlb_respiration ddlb_respiration
st_1 st_1
gb_7 gb_7
gb_6 gb_6
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
mle_paro mle_paro
end type
global w_diagnos_maj_kuntzel2 w_diagnos_maj_kuntzel2

type variables
double var_code_local 
string page
boolean modif

integer secondes_attente
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();modif = false

ddlb_respiration.selectitem(integer(mid(page,300,1)))
ddplb_deglutition.selectitem(integer(mid(page,301,1)))
ddplb_phonation.selectitem(integer(mid(page,302,1)))
if mid(page,303,1) = 'O' then
	cbx_suceur.checked = true
else
	cbx_suceur.checked = false
end if
if mid(page,304,1) = 'O' then
	cbx_onychophagie.checked = true
else
	cbx_onychophagie.checked = false
end if
if mid(page,305,1) = 'O' then
	cbx_bruxisme.checked = true
else
	cbx_bruxisme.checked = false
end if

ddlb_amygdales.selectitem(integer(mid(page,306,1)))
ddlb_vegetations.selectitem(integer(mid(page,307,1)))
ddlb_langue.selectitem(integer(mid(page,308,1)))
ddplb_levres.selectitem(integer(mid(page,309,1)))
ddplb_volume.selectitem(integer(mid(page,310,1)))

if mid(page,311,1) = 'O' then
	cbx_douleur.checked = true
else
	cbx_douleur.checked = false
end if
if mid(page,312,1) = 'O' then
	cbx_craquement.checked = true
else
	cbx_craquement.checked = false
end if
if mid(page,313,1) = 'O' then
	cbx_ressaut.checked = true
else
	cbx_ressaut.checked = false
end if
ddlb_chemin.selectitem(integer(mid(page,314,1)))
ddplb_amplitude.selectitem(integer(mid(page,315,1)))

sle_prematurites.text = Righttrim(mid(page,320,30))
mle_paro.text = Righttrim(mid(page,350,150))

if mid(page,600,1) = 'O' then
	cbx_langue.checked = true
else
	cbx_langue.checked = false
end if
if mid(page,601,1) = 'O' then
	cbx_levre_sup.checked = true
else
	cbx_levre_sup.checked = false
end if
if mid(page,602,1) = 'O' then
	cbx_levre_inf.checked = true
else
	cbx_levre_inf.checked = false
end if

lb_surnu.selectitem(integer(mid(page,603,1)))
lb_medicament.selectitem(integer(mid(page,604,1)))

sle_agenesie.text = Righttrim(mid(page,610,30))
sle_extraction.text = Righttrim(mid(page,650,30))
sle_surnum.text = Righttrim(mid(page,700,30))
sle_allergie.text = Righttrim(mid(page,750,30))
sle_maux.text = Righttrim(mid(page,800,30))
sle_medicament.text = Righttrim(mid(page,850,30))
sle_sante.text = Righttrim(mid(page,900,30))
sle_sanguin.text = Righttrim(mid(page,950,30))


end subroutine

event open;
var_code_local = message.doubleparm

dw_1.settransobject(SQLCA)
dw_1.retrieve(var_code_local)

string vn,vm 
date vd
integer an, mois

select nom,moulage,date_naissance INTO :vn,:vm,:vd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
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

this.title = "Page N°2 : "+vn+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(mois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

init()


end event

on w_diagnos_maj_kuntzel2.create
this.st_16=create st_16
this.sle_sante=create sle_sante
this.sle_sanguin=create sle_sanguin
this.sle_allergie=create sle_allergie
this.sle_medicament=create sle_medicament
this.sle_maux=create sle_maux
this.sle_surnum=create sle_surnum
this.sle_extraction=create sle_extraction
this.sle_agenesie=create sle_agenesie
this.lb_medicament=create lb_medicament
this.lb_surnu=create lb_surnu
this.dw_1=create dw_1
this.ddplb_levres=create ddplb_levres
this.ddplb_volume=create ddplb_volume
this.st_8=create st_8
this.st_9=create st_9
this.ddplb_phonation=create ddplb_phonation
this.ddplb_deglutition=create ddplb_deglutition
this.cbx_levre_inf=create cbx_levre_inf
this.cbx_levre_sup=create cbx_levre_sup
this.st_13=create st_13
this.cbx_langue=create cbx_langue
this.sle_prematurites=create sle_prematurites
this.st_12=create st_12
this.ddplb_amplitude=create ddplb_amplitude
this.st_11=create st_11
this.ddlb_chemin=create ddlb_chemin
this.st_10=create st_10
this.cbx_ressaut=create cbx_ressaut
this.cbx_craquement=create cbx_craquement
this.cbx_douleur=create cbx_douleur
this.ddlb_langue=create ddlb_langue
this.ddlb_vegetations=create ddlb_vegetations
this.ddlb_amygdales=create ddlb_amygdales
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.cbx_onychophagie=create cbx_onychophagie
this.cbx_bruxisme=create cbx_bruxisme
this.cbx_suceur=create cbx_suceur
this.st_3=create st_3
this.st_2=create st_2
this.ddlb_respiration=create ddlb_respiration
this.st_1=create st_1
this.gb_7=create gb_7
this.gb_6=create gb_6
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.mle_paro=create mle_paro
this.Control[]={this.st_16,&
this.sle_sante,&
this.sle_sanguin,&
this.sle_allergie,&
this.sle_medicament,&
this.sle_maux,&
this.sle_surnum,&
this.sle_extraction,&
this.sle_agenesie,&
this.lb_medicament,&
this.lb_surnu,&
this.dw_1,&
this.ddplb_levres,&
this.ddplb_volume,&
this.st_8,&
this.st_9,&
this.ddplb_phonation,&
this.ddplb_deglutition,&
this.cbx_levre_inf,&
this.cbx_levre_sup,&
this.st_13,&
this.cbx_langue,&
this.sle_prematurites,&
this.st_12,&
this.ddplb_amplitude,&
this.st_11,&
this.ddlb_chemin,&
this.st_10,&
this.cbx_ressaut,&
this.cbx_craquement,&
this.cbx_douleur,&
this.ddlb_langue,&
this.ddlb_vegetations,&
this.ddlb_amygdales,&
this.st_6,&
this.st_5,&
this.st_4,&
this.cbx_onychophagie,&
this.cbx_bruxisme,&
this.cbx_suceur,&
this.st_3,&
this.st_2,&
this.ddlb_respiration,&
this.st_1,&
this.gb_7,&
this.gb_6,&
this.gb_3,&
this.gb_2,&
this.gb_1,&
this.mle_paro}
end on

on w_diagnos_maj_kuntzel2.destroy
destroy(this.st_16)
destroy(this.sle_sante)
destroy(this.sle_sanguin)
destroy(this.sle_allergie)
destroy(this.sle_medicament)
destroy(this.sle_maux)
destroy(this.sle_surnum)
destroy(this.sle_extraction)
destroy(this.sle_agenesie)
destroy(this.lb_medicament)
destroy(this.lb_surnu)
destroy(this.dw_1)
destroy(this.ddplb_levres)
destroy(this.ddplb_volume)
destroy(this.st_8)
destroy(this.st_9)
destroy(this.ddplb_phonation)
destroy(this.ddplb_deglutition)
destroy(this.cbx_levre_inf)
destroy(this.cbx_levre_sup)
destroy(this.st_13)
destroy(this.cbx_langue)
destroy(this.sle_prematurites)
destroy(this.st_12)
destroy(this.ddplb_amplitude)
destroy(this.st_11)
destroy(this.ddlb_chemin)
destroy(this.st_10)
destroy(this.cbx_ressaut)
destroy(this.cbx_craquement)
destroy(this.cbx_douleur)
destroy(this.ddlb_langue)
destroy(this.ddlb_vegetations)
destroy(this.ddlb_amygdales)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.cbx_onychophagie)
destroy(this.cbx_bruxisme)
destroy(this.cbx_suceur)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.ddlb_respiration)
destroy(this.st_1)
destroy(this.gb_7)
destroy(this.gb_6)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.mle_paro)
end on

event show;

clinique_affichee = true

secondes_attente = 3
timer(1)
end event

event timer;
secondes_attente = secondes_attente - 1

if secondes_attente = 1 then
	copie_ecran_fenetre_clipboard()
end if

if secondes_attente = 0 then
	close(this)
end if
end event

type st_16 from statictext within w_diagnos_maj_kuntzel2
integer x = 32
integer y = 2120
integer width = 997
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Logiciel ORTHOKIS - (c) ARAKIS"
alignment alignment = center!
boolean border = true
boolean focusrectangle = false
end type

type sle_sante from singlelineedit within w_diagnos_maj_kuntzel2
integer x = 2331
integer y = 1816
integer width = 946
integer height = 76
integer taborder = 310
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type sle_sanguin from singlelineedit within w_diagnos_maj_kuntzel2
integer x = 2331
integer y = 1892
integer width = 946
integer height = 76
integer taborder = 320
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type sle_allergie from singlelineedit within w_diagnos_maj_kuntzel2
integer x = 2331
integer y = 1588
integer width = 946
integer height = 76
integer taborder = 280
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type sle_medicament from singlelineedit within w_diagnos_maj_kuntzel2
integer x = 2331
integer y = 1740
integer width = 946
integer height = 76
integer taborder = 300
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type sle_maux from singlelineedit within w_diagnos_maj_kuntzel2
integer x = 2331
integer y = 1664
integer width = 946
integer height = 76
integer taborder = 290
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type sle_surnum from singlelineedit within w_diagnos_maj_kuntzel2
integer x = 553
integer y = 1772
integer width = 946
integer height = 76
integer taborder = 260
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type sle_extraction from singlelineedit within w_diagnos_maj_kuntzel2
integer x = 553
integer y = 1700
integer width = 946
integer height = 76
integer taborder = 250
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type sle_agenesie from singlelineedit within w_diagnos_maj_kuntzel2
integer x = 553
integer y = 1628
integer width = 946
integer height = 76
integer taborder = 240
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

type lb_medicament from listbox within w_diagnos_maj_kuntzel2
integer x = 1723
integer y = 1628
integer width = 448
integer height = 320
integer taborder = 270
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
string item[] = {"Allergie","Maux d~'estomac","Médicaments","Pb de Santé","Pb sanguins"}
borderstyle borderstyle = stylelowered!
end type

type lb_surnu from listbox within w_diagnos_maj_kuntzel2
integer x = 27
integer y = 1628
integer width = 475
integer height = 204
integer taborder = 230
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
string item[] = {"Surnuméraires","Agénésies","Extractions"}
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_diagnos_maj_kuntzel2
integer x = 763
integer y = 36
integer width = 2176
integer height = 620
integer taborder = 10
string dataobject = "dw_diagnos_kuntzel4"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ddplb_levres from dropdownpicturelistbox within w_diagnos_maj_kuntzel2
event selectionchanged pbm_cbnselchange
integer x = 3026
integer y = 748
integer width = 425
integer height = 288
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Augmenté","Diminué"}
integer itempictureindex[] = {0,1,2}
string picturename[] = {"Custom033!","Custom034!"}
long picturemaskcolor = 536870912
end type

event selectionchanged;modif = true

end event

type ddplb_volume from dropdownpicturelistbox within w_diagnos_maj_kuntzel2
event selectionchanged pbm_cbnselchange
integer x = 3026
integer y = 860
integer width = 425
integer height = 288
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Augmenté","Diminué"}
integer itempictureindex[] = {0,1,2}
string picturename[] = {"Custom033!","Custom034!"}
long picturemaskcolor = 536870912
end type

event selectionchanged;modif = true

end event

type st_8 from statictext within w_diagnos_maj_kuntzel2
integer x = 2715
integer y = 764
integer width = 315
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Lèvres Tonus"
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_kuntzel2
integer x = 2770
integer y = 892
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Volume"
alignment alignment = right!
boolean focusrectangle = false
end type

type ddplb_phonation from dropdownpicturelistbox within w_diagnos_maj_kuntzel2
event selectionchanged pbm_cbnselchange
integer x = 320
integer y = 932
integer width = 672
integer height = 276
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normale","Pathologique"}
integer itempictureindex[] = {0,1}
string picturename[] = {"Custom035!"}
long picturemaskcolor = 553648127
end type

event selectionchanged;modif = true

end event

type ddplb_deglutition from dropdownpicturelistbox within w_diagnos_maj_kuntzel2
event selectionchanged pbm_cbnselchange
integer x = 320
integer y = 840
integer width = 672
integer height = 276
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normale","Infantile"}
integer itempictureindex[] = {0,1}
string picturename[] = {"Custom035!"}
long picturemaskcolor = 553648127
end type

event selectionchanged;modif = true

end event

type cbx_levre_inf from checkbox within w_diagnos_maj_kuntzel2
integer x = 2857
integer y = 1360
integer width = 311
integer height = 80
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Lèvre Inf"
boolean lefttext = true
end type

event clicked;modif = true

end event

type cbx_levre_sup from checkbox within w_diagnos_maj_kuntzel2
integer x = 2510
integer y = 1360
integer width = 311
integer height = 76
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Lèvre Sup"
boolean lefttext = true
end type

event clicked;modif = true

end event

type st_13 from statictext within w_diagnos_maj_kuntzel2
integer x = 1751
integer y = 1360
integer width = 421
integer height = 68
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Anomalie Frein :"
boolean focusrectangle = false
end type

type cbx_langue from checkbox within w_diagnos_maj_kuntzel2
integer x = 2190
integer y = 1352
integer width = 265
integer height = 76
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 79741120
string text = "Langue"
boolean lefttext = true
end type

event clicked;modif = true

end event

type sle_prematurites from singlelineedit within w_diagnos_maj_kuntzel2
integer x = 910
integer y = 1312
integer width = 494
integer height = 92
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 30
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type st_12 from statictext within w_diagnos_maj_kuntzel2
integer x = 581
integer y = 1320
integer width = 297
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Prématurités"
boolean focusrectangle = false
end type

type ddplb_amplitude from dropdownpicturelistbox within w_diagnos_maj_kuntzel2
integer x = 910
integer y = 1216
integer width = 494
integer height = 288
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normale","Diminuée"}
integer itempictureindex[] = {0,1}
string picturename[] = {"Custom034!","Custom035!"}
long picturemaskcolor = 553648127
end type

event selectionchanged;modif = true

end event

type st_11 from statictext within w_diagnos_maj_kuntzel2
integer x = 581
integer y = 1224
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Amplitude"
boolean focusrectangle = false
end type

type ddlb_chemin from dropdownlistbox within w_diagnos_maj_kuntzel2
integer x = 910
integer y = 1120
integer width = 494
integer height = 276
integer taborder = 160
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Normal","Dévié à Droite","Dévié à Gauche"}
end type

event selectionchanged;modif = true

end event

type st_10 from statictext within w_diagnos_maj_kuntzel2
integer x = 581
integer y = 1140
integer width = 320
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Chemin Ferm."
boolean focusrectangle = false
end type

type cbx_ressaut from checkbox within w_diagnos_maj_kuntzel2
integer x = 46
integer y = 1312
integer width = 384
integer height = 76
integer taborder = 150
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Ressaut"
boolean lefttext = true
end type

event clicked;modif = true

end event

type cbx_craquement from checkbox within w_diagnos_maj_kuntzel2
integer x = 46
integer y = 1224
integer width = 384
integer height = 76
integer taborder = 140
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Craquement"
boolean lefttext = true
end type

event clicked;modif = true

end event

type cbx_douleur from checkbox within w_diagnos_maj_kuntzel2
integer x = 46
integer y = 1132
integer width = 384
integer height = 76
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Douleur"
boolean lefttext = true
end type

event clicked;modif = true

end event

type ddlb_langue from dropdownlistbox within w_diagnos_maj_kuntzel2
integer x = 2034
integer y = 932
integer width = 622
integer height = 276
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"Normale","Macroglossie"}
end type

event selectionchanged;modif = true

end event

type ddlb_vegetations from dropdownlistbox within w_diagnos_maj_kuntzel2
integer x = 2034
integer y = 836
integer width = 622
integer height = 276
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"Normales","Hypertrophiques","Retirées"}
end type

event selectionchanged;modif = true

end event

type ddlb_amygdales from dropdownlistbox within w_diagnos_maj_kuntzel2
integer x = 2034
integer y = 740
integer width = 622
integer height = 276
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"Normales","Hypertrophiques","Retirées"}
end type

event selectionchanged;modif = true

end event

type st_6 from statictext within w_diagnos_maj_kuntzel2
integer x = 1742
integer y = 932
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Langue"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_kuntzel2
integer x = 1742
integer y = 848
integer width = 274
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Végétations"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_kuntzel2
integer x = 1742
integer y = 760
integer width = 256
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Amygdales"
boolean focusrectangle = false
end type

type cbx_onychophagie from checkbox within w_diagnos_maj_kuntzel2
integer x = 1138
integer y = 852
integer width = 421
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Onychophagie "
boolean lefttext = true
end type

event clicked;modif = true

end event

type cbx_bruxisme from checkbox within w_diagnos_maj_kuntzel2
integer x = 1138
integer y = 944
integer width = 421
integer height = 76
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Bruxisme "
boolean lefttext = true
end type

event clicked;modif = true

end event

type cbx_suceur from checkbox within w_diagnos_maj_kuntzel2
integer x = 1138
integer y = 768
integer width = 421
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Suceur pouce "
boolean lefttext = true
end type

event clicked;modif = true

end event

type st_3 from statictext within w_diagnos_maj_kuntzel2
integer x = 64
integer y = 932
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Phonation"
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_kuntzel2
integer x = 64
integer y = 852
integer width = 251
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Déglutition"
boolean focusrectangle = false
end type

type ddlb_respiration from dropdownlistbox within w_diagnos_maj_kuntzel2
integer x = 320
integer y = 748
integer width = 672
integer height = 276
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
string item[] = {"Nasale","Buccale","Mixte"}
end type

event selectionchanged;modif = true

end event

type st_1 from statictext within w_diagnos_maj_kuntzel2
integer x = 64
integer y = 764
integer width = 265
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Respiration"
boolean focusrectangle = false
end type

type gb_7 from groupbox within w_diagnos_maj_kuntzel2
integer x = 1723
integer y = 1160
integer width = 1554
integer height = 296
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "EXAMEN PARODONTAL"
borderstyle borderstyle = styleraised!
end type

type gb_6 from groupbox within w_diagnos_maj_kuntzel2
integer x = 27
integer y = 1068
integer width = 1477
integer height = 388
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "ATM"
borderstyle borderstyle = styleraised!
end type

type gb_3 from groupbox within w_diagnos_maj_kuntzel2
integer x = 1719
integer y = 700
integer width = 1797
integer height = 348
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
end type

type gb_2 from groupbox within w_diagnos_maj_kuntzel2
integer x = 1102
integer y = 700
integer width = 549
integer height = 348
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "PARAFONCTIONS"
borderstyle borderstyle = styleraised!
end type

type gb_1 from groupbox within w_diagnos_maj_kuntzel2
integer x = 27
integer y = 700
integer width = 1006
integer height = 348
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "FONCTIONS"
borderstyle borderstyle = styleraised!
end type

type mle_paro from multilineedit within w_diagnos_maj_kuntzel2
integer x = 1765
integer y = 1216
integer width = 1477
integer height = 144
integer taborder = 190
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autovscroll = true
integer limit = 150
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

