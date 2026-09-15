$PBExportHeader$w_diagnos_maj_87479_1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_87479_1 from w_diagnos_maj_
end type
type st_1 from statictext within w_diagnos_maj_87479_1
end type
type st_2 from statictext within w_diagnos_maj_87479_1
end type
type st_3 from statictext within w_diagnos_maj_87479_1
end type
type st_4 from statictext within w_diagnos_maj_87479_1
end type
type st_5 from statictext within w_diagnos_maj_87479_1
end type
type st_6 from statictext within w_diagnos_maj_87479_1
end type
type st_7 from statictext within w_diagnos_maj_87479_1
end type
type st_8 from statictext within w_diagnos_maj_87479_1
end type
type st_9 from statictext within w_diagnos_maj_87479_1
end type
type st_10 from statictext within w_diagnos_maj_87479_1
end type
type st_11 from statictext within w_diagnos_maj_87479_1
end type
type st_12 from statictext within w_diagnos_maj_87479_1
end type
type st_13 from statictext within w_diagnos_maj_87479_1
end type
type st_14 from statictext within w_diagnos_maj_87479_1
end type
type ole_photo001 from gearbox within w_diagnos_maj_87479_1
end type
type st_15 from statictext within w_diagnos_maj_87479_1
end type
type st_16 from statictext within w_diagnos_maj_87479_1
end type
type ddlb_nature_ttm from dropdownlistbox within w_diagnos_maj_87479_1
end type
type sle_durée from singlelineedit within w_diagnos_maj_87479_1
end type
type mle_suivi from multilineedit within w_diagnos_maj_87479_1
end type
type mle_remarques from multilineedit within w_diagnos_maj_87479_1
end type
type mle_buts_ttm from multilineedit within w_diagnos_maj_87479_1
end type
type mle_extrac from multilineedit within w_diagnos_maj_87479_1
end type
type mle_type_app from multilineedit within w_diagnos_maj_87479_1
end type
type cb_comm_def from commandbutton within w_diagnos_maj_87479_1
end type
type cb_enr_nv_comm from commandbutton within w_diagnos_maj_87479_1
end type
type r_1 from rectangle within w_diagnos_maj_87479_1
end type
type ln_1 from line within w_diagnos_maj_87479_1
end type
type ln_2 from line within w_diagnos_maj_87479_1
end type
type ln_3 from line within w_diagnos_maj_87479_1
end type
type ln_4 from line within w_diagnos_maj_87479_1
end type
type ln_5 from line within w_diagnos_maj_87479_1
end type
type ln_6 from line within w_diagnos_maj_87479_1
end type
type ln_7 from line within w_diagnos_maj_87479_1
end type
type ln_8 from line within w_diagnos_maj_87479_1
end type
type ln_9 from line within w_diagnos_maj_87479_1
end type
end forward

global type w_diagnos_maj_87479_1 from w_diagnos_maj_
integer width = 2853
integer height = 3480
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
st_11 st_11
st_12 st_12
st_13 st_13
st_14 st_14
ole_photo001 ole_photo001
st_15 st_15
st_16 st_16
ddlb_nature_ttm ddlb_nature_ttm
sle_durée sle_durée
mle_suivi mle_suivi
mle_remarques mle_remarques
mle_buts_ttm mle_buts_ttm
mle_extrac mle_extrac
mle_type_app mle_type_app
cb_comm_def cb_comm_def
cb_enr_nv_comm cb_enr_nv_comm
r_1 r_1
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
ln_4 ln_4
ln_5 ln_5
ln_6 ln_6
ln_7 ln_7
ln_8 ln_8
ln_9 ln_9
end type
global w_diagnos_maj_87479_1 w_diagnos_maj_87479_1

type variables
boolean modif
end variables

forward prototypes
public subroutine load_ctrls ()
public subroutine unload_ctrls ()
end prototypes

public subroutine load_ctrls ();f.lirepage(ddlb_nature_ttm,page_buffer[1],1,1)
f.lirepage(sle_durée,page_buffer[1],2,25)
f.lirepage(mle_suivi,page_buffer[1],27,500)
f.lirepage(mle_remarques,page_buffer[1],527,500)
f.lirepage(mle_buts_ttm,page_buffer[1],1027,250)
f.lirepage(mle_extrac,page_buffer[1],2591,150)
f.lirepage(mle_type_app,page_buffer[1],2741,150)
// max carac = 2891

string vn,vp 
date vd
integer age_an, age_mois

select nom,prenom,date_naissance INTO :vn,:vp,:vd FROM patient WHERE patient.code = :var_code_local ;
st_8.text = vp + " " + vn

if isnull(vd) then
	vd = today()
end if

if (month(today()) < month( vd )) then
	age_an = year(today()) - year( vd ) - 1
ELSE
	age_an = year(today()) - year( vd )
END IF	

if (month(today()) < month( vd )) then
	age_mois = month(today()) - month( vd ) +12
ELSE
	age_mois = month(today()) - month( vd )
END IF

st_9.text = "Age : " + string(age_an) + " ans " + string(age_mois) + " mois "
end subroutine

public subroutine unload_ctrls ();f.ecrirepage(ddlb_nature_ttm,page_buffer[2],1,1)
f.ecrirepage(sle_durée,page_buffer[2],2,25)
f.ecrirepage(mle_suivi,page_buffer[2],27,500)
f.ecrirepage(mle_remarques,page_buffer[2],527,500)
f.ecrirepage(mle_buts_ttm,page_buffer[2],1027,250)
f.ecrirepage(mle_extrac,page_buffer[2],2591,150)
f.ecrirepage(mle_type_app,page_buffer[2],2741,150)
// max carac = 2891
end subroutine

on w_diagnos_maj_87479_1.create
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
this.st_11=create st_11
this.st_12=create st_12
this.st_13=create st_13
this.st_14=create st_14
this.ole_photo001=create ole_photo001
this.st_15=create st_15
this.st_16=create st_16
this.ddlb_nature_ttm=create ddlb_nature_ttm
this.sle_durée=create sle_durée
this.mle_suivi=create mle_suivi
this.mle_remarques=create mle_remarques
this.mle_buts_ttm=create mle_buts_ttm
this.mle_extrac=create mle_extrac
this.mle_type_app=create mle_type_app
this.cb_comm_def=create cb_comm_def
this.cb_enr_nv_comm=create cb_enr_nv_comm
this.r_1=create r_1
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_4=create ln_4
this.ln_5=create ln_5
this.ln_6=create ln_6
this.ln_7=create ln_7
this.ln_8=create ln_8
this.ln_9=create ln_9
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
this.Control[iCurrent+11]=this.st_11
this.Control[iCurrent+12]=this.st_12
this.Control[iCurrent+13]=this.st_13
this.Control[iCurrent+14]=this.st_14
this.Control[iCurrent+15]=this.ole_photo001
this.Control[iCurrent+16]=this.st_15
this.Control[iCurrent+17]=this.st_16
this.Control[iCurrent+18]=this.ddlb_nature_ttm
this.Control[iCurrent+19]=this.sle_durée
this.Control[iCurrent+20]=this.mle_suivi
this.Control[iCurrent+21]=this.mle_remarques
this.Control[iCurrent+22]=this.mle_buts_ttm
this.Control[iCurrent+23]=this.mle_extrac
this.Control[iCurrent+24]=this.mle_type_app
this.Control[iCurrent+25]=this.cb_comm_def
this.Control[iCurrent+26]=this.cb_enr_nv_comm
this.Control[iCurrent+27]=this.r_1
this.Control[iCurrent+28]=this.ln_1
this.Control[iCurrent+29]=this.ln_2
this.Control[iCurrent+30]=this.ln_3
this.Control[iCurrent+31]=this.ln_4
this.Control[iCurrent+32]=this.ln_5
this.Control[iCurrent+33]=this.ln_6
this.Control[iCurrent+34]=this.ln_7
this.Control[iCurrent+35]=this.ln_8
this.Control[iCurrent+36]=this.ln_9
end on

on w_diagnos_maj_87479_1.destroy
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
destroy(this.st_11)
destroy(this.st_12)
destroy(this.st_13)
destroy(this.st_14)
destroy(this.ole_photo001)
destroy(this.st_15)
destroy(this.st_16)
destroy(this.ddlb_nature_ttm)
destroy(this.sle_durée)
destroy(this.mle_suivi)
destroy(this.mle_remarques)
destroy(this.mle_buts_ttm)
destroy(this.mle_extrac)
destroy(this.mle_type_app)
destroy(this.cb_comm_def)
destroy(this.cb_enr_nv_comm)
destroy(this.r_1)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_4)
destroy(this.ln_5)
destroy(this.ln_6)
destroy(this.ln_7)
destroy(this.ln_8)
destroy(this.ln_9)
end on

type pb_suivant from w_diagnos_maj_`pb_suivant within w_diagnos_maj_87479_1
string tag = "87479_2"
integer x = 2661
integer y = 3124
integer taborder = 120
end type

type pb_precedant from w_diagnos_maj_`pb_precedant within w_diagnos_maj_87479_1
boolean visible = false
integer x = 2496
integer y = 3124
end type

type cb_imprimer from w_diagnos_maj_`cb_imprimer within w_diagnos_maj_87479_1
integer x = 741
integer y = 3124
integer taborder = 80
end type

type cb_sauver from w_diagnos_maj_`cb_sauver within w_diagnos_maj_87479_1
integer x = 1618
integer y = 3124
integer taborder = 100
end type

type cb_annuler from w_diagnos_maj_`cb_annuler within w_diagnos_maj_87479_1
integer x = 1179
integer y = 3124
integer taborder = 90
end type

type cb_fermer from w_diagnos_maj_`cb_fermer within w_diagnos_maj_87479_1
integer x = 2057
integer y = 3124
integer taborder = 110
end type

type st_1 from statictext within w_diagnos_maj_87479_1
integer x = 713
integer y = 24
integer width = 1417
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "CABINET D’ORTHODONTIE"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_87479_1
integer x = 713
integer y = 96
integer width = 1417
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "Docteurs A.MONNET  -  J. SCHULZ"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_87479_1
integer x = 713
integer y = 168
integer width = 1417
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "Chirurgiens-Dentistes"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_87479_1
integer x = 713
integer y = 240
integer width = 1417
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "Spécialistes Qualifiés en Orthopédie Dento-Faciale"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_87479_1
integer x = 713
integer y = 312
integer width = 1417
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "Orthodontie de l’enfant et de l’adulte"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_87479_1
integer x = 713
integer y = 384
integer width = 1417
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "21 Rue de la Paix – 55100 VERDUN"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_87479_1
integer x = 713
integer y = 456
integer width = 1417
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tél : 03.29.85.06.34"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_8 from statictext within w_diagnos_maj_87479_1
integer x = 82
integer y = 672
integer width = 1317
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 65535
string text = "Prénom + Nom"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_9 from statictext within w_diagnos_maj_87479_1
integer x = 82
integer y = 792
integer width = 1317
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 65535
string text = "Age Patient"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_10 from statictext within w_diagnos_maj_87479_1
integer x = 55
integer y = 984
integer width = 613
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Nature du traitement :"
boolean focusrectangle = false
end type

type st_11 from statictext within w_diagnos_maj_87479_1
integer x = 55
integer y = 1104
integer width = 613
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Durée prévue :"
boolean focusrectangle = false
end type

type st_12 from statictext within w_diagnos_maj_87479_1
integer x = 55
integer y = 1224
integer width = 613
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Type d~'appareillage :"
boolean focusrectangle = false
end type

type st_13 from statictext within w_diagnos_maj_87479_1
integer x = 55
integer y = 1416
integer width = 613
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Extractions :"
boolean focusrectangle = false
end type

type st_14 from statictext within w_diagnos_maj_87479_1
integer x = 55
integer y = 1608
integer width = 613
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
boolean underline = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Buts du traitement :"
boolean focusrectangle = false
end type

type ole_photo001 from gearbox within w_diagnos_maj_87479_1
string tag = "{EFS/PR}"
integer x = 1893
integer y = 600
integer width = 823
integer height = 552
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo001.destroy
call gearbox::destroy
end on

type st_15 from statictext within w_diagnos_maj_87479_1
integer x = 82
integer y = 1968
integer width = 933
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "SUIVI CLINIQUE DU TRAITEMENT"
boolean focusrectangle = false
end type

type st_16 from statictext within w_diagnos_maj_87479_1
integer x = 82
integer y = 2592
integer width = 384
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
long backcolor = 67108864
string text = "REMARQUES"
boolean focusrectangle = false
end type

type ddlb_nature_ttm from dropdownlistbox within w_diagnos_maj_87479_1
integer x = 713
integer y = 960
integer width = 494
integer height = 288
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 16711680
boolean sorted = false
boolean vscrollbar = true
string item[] = {"orthopédie","orthodontie"}
borderstyle borderstyle = stylelowered!
end type

type sle_durée from singlelineedit within w_diagnos_maj_87479_1
integer x = 713
integer y = 1080
integer width = 713
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
integer limit = 25
borderstyle borderstyle = stylelowered!
end type

type mle_suivi from multilineedit within w_diagnos_maj_87479_1
integer x = 55
integer y = 2112
integer width = 2743
integer height = 336
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_remarques from multilineedit within w_diagnos_maj_87479_1
integer x = 55
integer y = 2736
integer width = 2743
integer height = 336
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
integer limit = 500
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_buts_ttm from multilineedit within w_diagnos_maj_87479_1
integer x = 713
integer y = 1584
integer width = 2085
integer height = 264
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
integer limit = 250
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_extrac from multilineedit within w_diagnos_maj_87479_1
integer x = 713
integer y = 1392
integer width = 2085
integer height = 168
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
integer limit = 150
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type mle_type_app from multilineedit within w_diagnos_maj_87479_1
integer x = 713
integer y = 1200
integer width = 2085
integer height = 168
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Times New Roman"
long textcolor = 33554432
integer limit = 150
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

type cb_comm_def from commandbutton within w_diagnos_maj_87479_1
integer x = 741
integer y = 3264
integer width = 343
integer height = 100
integer taborder = 130
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Comm. Def."
end type

event clicked;// lecture et affichage du choix du menu déroulant "Nature"
ddlb_nature_ttm.SelectItem(Integer(ProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Nature","false")))

// Lecture du contenu "Durée"
sle_durée.Text = ProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Duree","false")

// Lecture des contenus des MLE.
mle_type_app.Text = gfx_tout_remplacer(ProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Appareil","false"),"\n",char(13) + char(10))
mle_extrac.Text = gfx_tout_remplacer(ProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Extraction","false"),"\n",char(13) + char(10))
mle_buts_ttm.Text = gfx_tout_remplacer(ProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Buts","false"),"\n",char(13) + char(10))
mle_suivi.Text = gfx_tout_remplacer(ProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Suivi","false"),"\n",char(13) + char(10))
mle_remarques.Text = gfx_tout_remplacer(ProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Remarques","false"),"\n",char(13) + char(10))

modif = true

end event

type cb_enr_nv_comm from commandbutton within w_diagnos_maj_87479_1
integer x = 2025
integer y = 3264
integer width = 443
integer height = 100
integer taborder = 140
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enr.Nv.Comm.Def."
end type

event clicked;If MessageBox("ATTENTION","Vous allez enregistrer de nouveaux commentaires par défaut.~n~nVoulez-vous vraiment procéder à cet enregistrement ?",Question!,YesNo!, 2) = 1 Then
	// Enregistrement de la position du choix dans le menu déroulant "Nature"
	SetProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Nature",String(FindExactement(ddlb_nature_ttm,ddlb_nature_ttm.Text)))
	
	// Enregistrement du SLE "Durée"
	SetProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Duree",sle_durée.Text)
	
	// Enregistrement des MLE.
	SetProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Appareil",gfx_tout_remplacer(mle_type_app.Text, char(13) + char(10), "\n"))
	SetProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Extraction",gfx_tout_remplacer(mle_extrac.Text, char(13) + char(10), "\n"))
	SetProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Buts",gfx_tout_remplacer(mle_buts_ttm.Text, char(13) + char(10), "\n"))
	SetProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Suivi",gfx_tout_remplacer(mle_suivi.Text, char(13) + char(10), "\n"))
	SetProfileString (dir_photos+inifile_photo,"commentaires_predefinis","Remarques",gfx_tout_remplacer(mle_remarques.Text, char(13) + char(10), "\n"))
end if


end event

type r_1 from rectangle within w_diagnos_maj_87479_1
integer linethickness = 4
long fillcolor = 65535
integer x = 55
integer y = 648
integer width = 1371
integer height = 240
end type

type ln_1 from line within w_diagnos_maj_87479_1
integer linethickness = 4
integer beginx = 55
integer beginy = 2544
integer endx = 2798
integer endy = 2544
end type

type ln_2 from line within w_diagnos_maj_87479_1
integer linethickness = 4
integer beginx = 55
integer beginy = 2688
integer endx = 2798
integer endy = 2688
end type

type ln_3 from line within w_diagnos_maj_87479_1
integer linethickness = 4
integer beginx = 55
integer beginy = 2544
integer endx = 55
integer endy = 2688
end type

type ln_4 from line within w_diagnos_maj_87479_1
integer linethickness = 4
integer beginx = 2798
integer beginy = 2544
integer endx = 2798
integer endy = 2688
end type

type ln_5 from line within w_diagnos_maj_87479_1
integer linethickness = 4
integer beginx = 55
integer beginy = 1920
integer endx = 2798
integer endy = 1920
end type

type ln_6 from line within w_diagnos_maj_87479_1
integer linethickness = 4
integer beginx = 2798
integer beginy = 1920
integer endx = 2798
integer endy = 2064
end type

type ln_7 from line within w_diagnos_maj_87479_1
integer linethickness = 4
integer beginx = 55
integer beginy = 2064
integer endx = 2798
integer endy = 2064
end type

type ln_8 from line within w_diagnos_maj_87479_1
integer linethickness = 4
integer beginx = 55
integer beginy = 1920
integer endx = 55
integer endy = 2064
end type

type ln_9 from line within w_diagnos_maj_87479_1
long linecolor = 255
integer linethickness = 4
integer beginx = 2025
integer beginy = 3364
integer endx = 2469
integer endy = 3364
end type

