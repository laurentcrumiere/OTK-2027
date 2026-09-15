$PBExportHeader$w_diagnos_maj_rigaldies1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_rigaldies1 from window
end type
type pb_1 from picturebutton within w_diagnos_maj_rigaldies1
end type
type pb_2 from picturebutton within w_diagnos_maj_rigaldies1
end type
type em_diag4 from singlelineedit within w_diagnos_maj_rigaldies1
end type
type em_diag3 from singlelineedit within w_diagnos_maj_rigaldies1
end type
type em_diag2 from singlelineedit within w_diagnos_maj_rigaldies1
end type
type em_trait from singlelineedit within w_diagnos_maj_rigaldies1
end type
type mle_maxi from multilineedit within w_diagnos_maj_rigaldies1
end type
type mle_mand from multilineedit within w_diagnos_maj_rigaldies1
end type
type mle_inter from multilineedit within w_diagnos_maj_rigaldies1
end type
type mle_anomalies from multilineedit within w_diagnos_maj_rigaldies1
end type
type st_4 from statictext within w_diagnos_maj_rigaldies1
end type
type st_3 from statictext within w_diagnos_maj_rigaldies1
end type
type mle_observations from multilineedit within w_diagnos_maj_rigaldies1
end type
type p1_st_9 from statictext within w_diagnos_maj_rigaldies1
end type
type p1_st_8 from statictext within w_diagnos_maj_rigaldies1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_rigaldies1
end type
type cb_annuler from commandbutton within w_diagnos_maj_rigaldies1
end type
type cb_fermer from commandbutton within w_diagnos_maj_rigaldies1
end type
type gb_41 from groupbox within w_diagnos_maj_rigaldies1
end type
type gb_555 from groupbox within w_diagnos_maj_rigaldies1
end type
type gb_56 from groupbox within w_diagnos_maj_rigaldies1
end type
type gb_5 from groupbox within w_diagnos_maj_rigaldies1
end type
type gb_22 from groupbox within w_diagnos_maj_rigaldies1
end type
type gb_33 from groupbox within w_diagnos_maj_rigaldies1
end type
type gb_1 from groupbox within w_diagnos_maj_rigaldies1
end type
type p1_gb_1 from groupbox within w_diagnos_maj_rigaldies1
end type
type em_extrac from singlelineedit within w_diagnos_maj_rigaldies1
end type
type gb_6 from groupbox within w_diagnos_maj_rigaldies1
end type
type em_diag1 from singlelineedit within w_diagnos_maj_rigaldies1
end type
type em_squelet from singlelineedit within w_diagnos_maj_rigaldies1
end type
end forward

global type w_diagnos_maj_rigaldies1 from window
integer x = 9
integer y = 16
integer width = 2898
integer height = 1936
boolean titlebar = true
string title = "Page Clinique N°1"
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
pb_1 pb_1
pb_2 pb_2
em_diag4 em_diag4
em_diag3 em_diag3
em_diag2 em_diag2
em_trait em_trait
mle_maxi mle_maxi
mle_mand mle_mand
mle_inter mle_inter
mle_anomalies mle_anomalies
st_4 st_4
st_3 st_3
mle_observations mle_observations
p1_st_9 p1_st_9
p1_st_8 p1_st_8
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_41 gb_41
gb_555 gb_555
gb_56 gb_56
gb_5 gb_5
gb_22 gb_22
gb_33 gb_33
gb_1 gb_1
p1_gb_1 p1_gb_1
em_extrac em_extrac
gb_6 gb_6
em_diag1 em_diag1
em_squelet em_squelet
end type
global w_diagnos_maj_rigaldies1 w_diagnos_maj_rigaldies1

type variables
double var_code_local 
string page
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();mle_observations.text =  trim(mid(page,1,210))
em_squelet.text = trim(mid(page,211,38))
em_diag1.text = trim(mid(page,249,35))
em_diag2.text = trim(mid(page,284,35))
em_diag3.text = trim(mid(page,319,35))
em_diag4.text = trim(mid(page,354,35))
mle_anomalies.text =  trim(mid(page,389,76))

em_trait.text = trim(mid(page,465,38))
mle_inter.text = trim(mid(page,503,76))
em_extrac.text = trim(mid(page,579,38))
mle_mand.text =  trim(mid(page,617,114))
mle_maxi.text =  trim(mid(page,731,114))



end subroutine

event open;var_code_local = message.doubleparm

SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;


if isnull(page) then
	page = space(1000)
end if

init()

mep_win_mdi(this,1)
mle_observations.setfocus()
end event

on w_diagnos_maj_rigaldies1.create
this.pb_1=create pb_1
this.pb_2=create pb_2
this.em_diag4=create em_diag4
this.em_diag3=create em_diag3
this.em_diag2=create em_diag2
this.em_trait=create em_trait
this.mle_maxi=create mle_maxi
this.mle_mand=create mle_mand
this.mle_inter=create mle_inter
this.mle_anomalies=create mle_anomalies
this.st_4=create st_4
this.st_3=create st_3
this.mle_observations=create mle_observations
this.p1_st_9=create p1_st_9
this.p1_st_8=create p1_st_8
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_41=create gb_41
this.gb_555=create gb_555
this.gb_56=create gb_56
this.gb_5=create gb_5
this.gb_22=create gb_22
this.gb_33=create gb_33
this.gb_1=create gb_1
this.p1_gb_1=create p1_gb_1
this.em_extrac=create em_extrac
this.gb_6=create gb_6
this.em_diag1=create em_diag1
this.em_squelet=create em_squelet
this.Control[]={this.pb_1,&
this.pb_2,&
this.em_diag4,&
this.em_diag3,&
this.em_diag2,&
this.em_trait,&
this.mle_maxi,&
this.mle_mand,&
this.mle_inter,&
this.mle_anomalies,&
this.st_4,&
this.st_3,&
this.mle_observations,&
this.p1_st_9,&
this.p1_st_8,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_41,&
this.gb_555,&
this.gb_56,&
this.gb_5,&
this.gb_22,&
this.gb_33,&
this.gb_1,&
this.p1_gb_1,&
this.em_extrac,&
this.gb_6,&
this.em_diag1,&
this.em_squelet}
end on

on w_diagnos_maj_rigaldies1.destroy
destroy(this.pb_1)
destroy(this.pb_2)
destroy(this.em_diag4)
destroy(this.em_diag3)
destroy(this.em_diag2)
destroy(this.em_trait)
destroy(this.mle_maxi)
destroy(this.mle_mand)
destroy(this.mle_inter)
destroy(this.mle_anomalies)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.mle_observations)
destroy(this.p1_st_9)
destroy(this.p1_st_8)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_41)
destroy(this.gb_555)
destroy(this.gb_56)
destroy(this.gb_5)
destroy(this.gb_22)
destroy(this.gb_33)
destroy(this.gb_1)
destroy(this.p1_gb_1)
destroy(this.em_extrac)
destroy(this.gb_6)
destroy(this.em_diag1)
destroy(this.em_squelet)
end on

type pb_1 from picturebutton within w_diagnos_maj_rigaldies1
boolean visible = false
integer x = 64
integer y = 1716
integer width = 137
integer height = 112
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ar_right.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;//if modif then
//	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
//		OpenSheetWithParm(w_diagnos_maj_xxxxx,var_code_local,w_mdi,1,Original!)
//		Close(parent)
//	end if
//else
	OpenSheetWithParm(w_diagnos_maj_rigaldies4,var_code_local,w_mdi,1,Original!)
	close(parent)
//end if

end event

type pb_2 from picturebutton within w_diagnos_maj_rigaldies1
integer x = 238
integer y = 1716
integer width = 137
integer height = 112
integer taborder = 150
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ar_left.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;//if modif then
//	if MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre sans enregistrer ?",Question!,YesNo!) = 1 then
//		OpenSheetWithParm(w_diagnos_maj_***,var_code_local,w_mdi,1,Original!)
//		Close(parent)
//	end if
//else
	OpenSheetWithParm(w_diagnos_maj_rigaldies2,var_code_local,w_mdi,1,Original!)
	close(parent)
//end if

end event

type em_diag4 from singlelineedit within w_diagnos_maj_rigaldies1
integer x = 265
integer y = 1148
integer width = 983
integer height = 92
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 35
borderstyle borderstyle = stylelowered!
end type

type em_diag3 from singlelineedit within w_diagnos_maj_rigaldies1
integer x = 265
integer y = 1048
integer width = 983
integer height = 92
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 35
borderstyle borderstyle = stylelowered!
end type

type em_diag2 from singlelineedit within w_diagnos_maj_rigaldies1
integer x = 265
integer y = 952
integer width = 983
integer height = 92
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 35
borderstyle borderstyle = stylelowered!
end type

type em_trait from singlelineedit within w_diagnos_maj_rigaldies1
integer x = 1417
integer y = 148
integer width = 1184
integer height = 92
integer taborder = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 38
borderstyle borderstyle = stylelowered!
end type

type mle_maxi from multilineedit within w_diagnos_maj_rigaldies1
integer x = 1440
integer y = 1284
integer width = 1147
integer height = 232
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 114
borderstyle borderstyle = stylelowered!
end type

type mle_mand from multilineedit within w_diagnos_maj_rigaldies1
integer x = 1440
integer y = 904
integer width = 1147
integer height = 232
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 114
borderstyle borderstyle = stylelowered!
end type

type mle_inter from multilineedit within w_diagnos_maj_rigaldies1
integer x = 1440
integer y = 368
integer width = 1147
integer height = 176
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 76
borderstyle borderstyle = stylelowered!
end type

type mle_anomalies from multilineedit within w_diagnos_maj_rigaldies1
integer x = 87
integer y = 1392
integer width = 1147
integer height = 176
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 76
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_diagnos_maj_rigaldies1
integer x = 78
integer y = 1156
integer width = 174
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "DDM :"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_rigaldies1
integer x = 78
integer y = 1064
integer width = 174
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "T :"
alignment alignment = right!
boolean focusrectangle = false
end type

type mle_observations from multilineedit within w_diagnos_maj_rigaldies1
integer x = 64
integer y = 152
integer width = 1189
integer height = 360
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean vscrollbar = true
integer limit = 210
borderstyle borderstyle = stylelowered!
end type

type p1_st_9 from statictext within w_diagnos_maj_rigaldies1
integer x = 78
integer y = 972
integer width = 174
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "V :"
alignment alignment = right!
boolean focusrectangle = false
end type

type p1_st_8 from statictext within w_diagnos_maj_rigaldies1
integer x = 78
integer y = 880
integer width = 174
integer height = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "A.P :"
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_rigaldies1
integer x = 1929
integer y = 1720
integer width = 384
integer height = 108
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

on clicked;place_avec_blancs(mle_observations.text,page,1,210)
place_avec_blancs(em_squelet.text,page,211,38)
place_avec_blancs(em_diag1.text,page,249,35)
place_avec_blancs(em_diag2.text,page,284,35)
place_avec_blancs(em_diag3.text,page,319,35)
place_avec_blancs(em_diag4.text,page,354,35)
place_avec_blancs(mle_anomalies.text,page,389,76)

place_avec_blancs(em_trait.text,page,465,38)
place_avec_blancs(mle_inter.text,page,503,76)
place_avec_blancs(em_extrac.text,page,579,38)
place_avec_blancs(mle_mand.text,page,617,114)
place_avec_blancs(mle_maxi.text,page,731,114)





UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;
COMMIT ;



end on

type cb_annuler from commandbutton within w_diagnos_maj_rigaldies1
integer x = 1527
integer y = 1720
integer width = 384
integer height = 108
integer taborder = 130
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;init()
end on

type cb_fermer from commandbutton within w_diagnos_maj_rigaldies1
integer x = 2331
integer y = 1720
integer width = 384
integer height = 108
integer taborder = 150
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

on clicked;close(parent)

end on

type gb_41 from groupbox within w_diagnos_maj_rigaldies1
integer x = 1381
integer y = 832
integer width = 1266
integer height = 360
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Mandibule"
borderstyle borderstyle = stylelowered!
end type

type gb_555 from groupbox within w_diagnos_maj_rigaldies1
integer x = 1381
integer y = 296
integer width = 1266
integer height = 288
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Interception"
borderstyle borderstyle = stylelowered!
end type

type gb_56 from groupbox within w_diagnos_maj_rigaldies1
integer x = 1381
integer y = 60
integer width = 1266
integer height = 216
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Traitement"
borderstyle borderstyle = stylelowered!
end type

type gb_5 from groupbox within w_diagnos_maj_rigaldies1
integer x = 14
integer y = 56
integer width = 1266
integer height = 492
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Observations"
borderstyle borderstyle = stylelowered!
end type

type gb_22 from groupbox within w_diagnos_maj_rigaldies1
integer x = 14
integer y = 556
integer width = 1266
integer height = 212
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Diagnostique Squelettique"
borderstyle borderstyle = stylelowered!
end type

type gb_33 from groupbox within w_diagnos_maj_rigaldies1
integer x = 1381
integer y = 1212
integer width = 1266
integer height = 360
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Maxillaire"
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_diagnos_maj_rigaldies1
integer x = 14
integer y = 780
integer width = 1266
integer height = 512
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Diagnostic Dentaire"
borderstyle borderstyle = stylelowered!
end type

type p1_gb_1 from groupbox within w_diagnos_maj_rigaldies1
integer x = 14
integer y = 1312
integer width = 1266
integer height = 296
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Anomalies"
borderstyle borderstyle = stylelowered!
end type

type em_extrac from singlelineedit within w_diagnos_maj_rigaldies1
integer x = 1422
integer y = 680
integer width = 1184
integer height = 92
integer taborder = 100
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 38
borderstyle borderstyle = stylelowered!
end type

type gb_6 from groupbox within w_diagnos_maj_rigaldies1
integer x = 1381
integer y = 600
integer width = 1266
integer height = 216
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
string text = "Extractions"
borderstyle borderstyle = stylelowered!
end type

type em_diag1 from singlelineedit within w_diagnos_maj_rigaldies1
integer x = 265
integer y = 852
integer width = 983
integer height = 92
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 35
borderstyle borderstyle = stylelowered!
end type

type em_squelet from singlelineedit within w_diagnos_maj_rigaldies1
integer x = 64
integer y = 636
integer width = 1184
integer height = 92
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 38
borderstyle borderstyle = stylelowered!
end type

