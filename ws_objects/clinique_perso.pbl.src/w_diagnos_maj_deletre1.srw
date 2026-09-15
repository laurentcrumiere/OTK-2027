$PBExportHeader$w_diagnos_maj_deletre1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_deletre1 from window
end type
type cb_imprimer from commandbutton within w_diagnos_maj_deletre1
end type
type cb_suite from commandbutton within w_diagnos_maj_deletre1
end type
type mle_extraction from multilineedit within w_diagnos_maj_deletre1
end type
type mle_traitement from multilineedit within w_diagnos_maj_deletre1
end type
type mle_maxillaire from multilineedit within w_diagnos_maj_deletre1
end type
type mle_mandibule from multilineedit within w_diagnos_maj_deletre1
end type
type mle_interception from multilineedit within w_diagnos_maj_deletre1
end type
type sle_t from singlelineedit within w_diagnos_maj_deletre1
end type
type sle_ddm from singlelineedit within w_diagnos_maj_deletre1
end type
type sle_v from singlelineedit within w_diagnos_maj_deletre1
end type
type sle_ap from singlelineedit within w_diagnos_maj_deletre1
end type
type st_3 from statictext within w_diagnos_maj_deletre1
end type
type st_2 from statictext within w_diagnos_maj_deletre1
end type
type st_1 from statictext within w_diagnos_maj_deletre1
end type
type mle_diag_squelettique from multilineedit within w_diagnos_maj_deletre1
end type
type dw_patient from datawindow within w_diagnos_maj_deletre1
end type
type mle_anomalies from multilineedit within w_diagnos_maj_deletre1
end type
type mle_observations from multilineedit within w_diagnos_maj_deletre1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_deletre1
end type
type cb_annuler from commandbutton within w_diagnos_maj_deletre1
end type
type cb_fermer from commandbutton within w_diagnos_maj_deletre1
end type
type gb_55555 from groupbox within w_diagnos_maj_deletre1
end type
type gb_555 from groupbox within w_diagnos_maj_deletre1
end type
type gb_444 from groupbox within w_diagnos_maj_deletre1
end type
type gb_44 from groupbox within w_diagnos_maj_deletre1
end type
type gb_77 from groupbox within w_diagnos_maj_deletre1
end type
type gb_66 from groupbox within w_diagnos_maj_deletre1
end type
type gb_55 from groupbox within w_diagnos_maj_deletre1
end type
type gb_5 from groupbox within w_diagnos_maj_deletre1
end type
type gb_4 from groupbox within w_diagnos_maj_deletre1
end type
end forward

global type w_diagnos_maj_deletre1 from window
integer x = 5
integer width = 2912
integer height = 1948
boolean titlebar = true
string title = "Page N°1"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 12632256
cb_imprimer cb_imprimer
cb_suite cb_suite
mle_extraction mle_extraction
mle_traitement mle_traitement
mle_maxillaire mle_maxillaire
mle_mandibule mle_mandibule
mle_interception mle_interception
sle_t sle_t
sle_ddm sle_ddm
sle_v sle_v
sle_ap sle_ap
st_3 st_3
st_2 st_2
st_1 st_1
mle_diag_squelettique mle_diag_squelettique
dw_patient dw_patient
mle_anomalies mle_anomalies
mle_observations mle_observations
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_55555 gb_55555
gb_555 gb_555
gb_444 gb_444
gb_44 gb_44
gb_77 gb_77
gb_66 gb_66
gb_55 gb_55
gb_5 gb_5
gb_4 gb_4
end type
global w_diagnos_maj_deletre1 w_diagnos_maj_deletre1

type variables
double var_code_local 
string page
boolean modif
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();dw_patient.retrieve(var_code_local)

modif = false

mle_observations.text = Righttrim(trim(mid(page,1,120)))
mle_diag_squelettique.text = Righttrim(trim(mid(page,201,40)))
sle_ap.text = Righttrim(trim(mid(page,301,40)))
sle_v.text = Righttrim(trim(mid(page,341,40)))
sle_t.text = Righttrim(trim(mid(page,381,40)))
sle_ddm.text = Righttrim(trim(mid(page,421,40)))
mle_anomalies.text = Righttrim(trim(mid(page,501,80)))

mle_traitement.text = Righttrim(trim(mid(page,601,40)))
mle_interception.text = Righttrim(trim(mid(page,641,80)))
mle_extraction.text = Righttrim(trim(mid(page,721,40)))
mle_mandibule.text = Righttrim(trim(mid(page,801,120)))
mle_maxillaire.text = Righttrim(trim(mid(page,1001,120)))




end subroutine

event open;
var_code_local = message.doubleparm

dw_patient.settransobject(SQLCA)

string vn,vm 
select trim(nom)+' '+isnull(prenom,''),moulage INTO :vn,:vm FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if

this.title = "Page N°1 : "+vn+" - N° dossier : "+string(var_code_local)+" (Moulage : "+vm+")"

init()


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if


init()


end event

on w_diagnos_maj_deletre1.create
this.cb_imprimer=create cb_imprimer
this.cb_suite=create cb_suite
this.mle_extraction=create mle_extraction
this.mle_traitement=create mle_traitement
this.mle_maxillaire=create mle_maxillaire
this.mle_mandibule=create mle_mandibule
this.mle_interception=create mle_interception
this.sle_t=create sle_t
this.sle_ddm=create sle_ddm
this.sle_v=create sle_v
this.sle_ap=create sle_ap
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.mle_diag_squelettique=create mle_diag_squelettique
this.dw_patient=create dw_patient
this.mle_anomalies=create mle_anomalies
this.mle_observations=create mle_observations
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_55555=create gb_55555
this.gb_555=create gb_555
this.gb_444=create gb_444
this.gb_44=create gb_44
this.gb_77=create gb_77
this.gb_66=create gb_66
this.gb_55=create gb_55
this.gb_5=create gb_5
this.gb_4=create gb_4
this.Control[]={this.cb_imprimer,&
this.cb_suite,&
this.mle_extraction,&
this.mle_traitement,&
this.mle_maxillaire,&
this.mle_mandibule,&
this.mle_interception,&
this.sle_t,&
this.sle_ddm,&
this.sle_v,&
this.sle_ap,&
this.st_3,&
this.st_2,&
this.st_1,&
this.mle_diag_squelettique,&
this.dw_patient,&
this.mle_anomalies,&
this.mle_observations,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_55555,&
this.gb_555,&
this.gb_444,&
this.gb_44,&
this.gb_77,&
this.gb_66,&
this.gb_55,&
this.gb_5,&
this.gb_4}
end on

on w_diagnos_maj_deletre1.destroy
destroy(this.cb_imprimer)
destroy(this.cb_suite)
destroy(this.mle_extraction)
destroy(this.mle_traitement)
destroy(this.mle_maxillaire)
destroy(this.mle_mandibule)
destroy(this.mle_interception)
destroy(this.sle_t)
destroy(this.sle_ddm)
destroy(this.sle_v)
destroy(this.sle_ap)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.mle_diag_squelettique)
destroy(this.dw_patient)
destroy(this.mle_anomalies)
destroy(this.mle_observations)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_55555)
destroy(this.gb_555)
destroy(this.gb_444)
destroy(this.gb_44)
destroy(this.gb_77)
destroy(this.gb_66)
destroy(this.gb_55)
destroy(this.gb_5)
destroy(this.gb_4)
end on

type cb_imprimer from commandbutton within w_diagnos_maj_deletre1
integer x = 590
integer y = 1728
integer width = 352
integer height = 108
integer taborder = 81
integer textsize = -10
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

type cb_suite from commandbutton within w_diagnos_maj_deletre1
integer x = 960
integer y = 1724
integer width = 352
integer height = 108
integer taborder = 150
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Suivante"
end type

event clicked;	openwithparm(w_diagnos_maj_deletre2,var_code_local)
	close(parent)

end event

type mle_extraction from multilineedit within w_diagnos_maj_deletre1
integer x = 1600
integer y = 908
integer width = 1152
integer height = 112
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type mle_traitement from multilineedit within w_diagnos_maj_deletre1
integer x = 1605
integer y = 444
integer width = 1152
integer height = 112
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type mle_maxillaire from multilineedit within w_diagnos_maj_deletre1
integer x = 1600
integer y = 1416
integer width = 1152
integer height = 248
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 120
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type mle_mandibule from multilineedit within w_diagnos_maj_deletre1
integer x = 1595
integer y = 1092
integer width = 1152
integer height = 248
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 120
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type mle_interception from multilineedit within w_diagnos_maj_deletre1
integer x = 1600
integer y = 640
integer width = 1152
integer height = 196
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 80
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type sle_t from singlelineedit within w_diagnos_maj_deletre1
integer x = 261
integer y = 1200
integer width = 1207
integer height = 80
integer taborder = 60
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

type sle_ddm from singlelineedit within w_diagnos_maj_deletre1
integer x = 261
integer y = 1296
integer width = 1207
integer height = 80
integer taborder = 70
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

type sle_v from singlelineedit within w_diagnos_maj_deletre1
integer x = 261
integer y = 1104
integer width = 1207
integer height = 80
integer taborder = 50
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

type sle_ap from singlelineedit within w_diagnos_maj_deletre1
integer x = 261
integer y = 1008
integer width = 1207
integer height = 80
integer taborder = 40
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

type st_3 from statictext within w_diagnos_maj_deletre1
integer x = 174
integer y = 1272
integer width = 69
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "T"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_2 from statictext within w_diagnos_maj_deletre1
integer x = 146
integer y = 1176
integer width = 96
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "V"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_deletre1
integer x = 114
integer y = 1096
integer width = 128
integer height = 76
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "A.P"
alignment alignment = right!
boolean focusrectangle = false
end type

type mle_diag_squelettique from multilineedit within w_diagnos_maj_deletre1
integer x = 123
integer y = 800
integer width = 1326
integer height = 112
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type dw_patient from datawindow within w_diagnos_maj_deletre1
integer x = 37
integer y = 16
integer width = 2807
integer height = 324
integer taborder = 10
string dataobject = "dw_patient_petite"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type mle_anomalies from multilineedit within w_diagnos_maj_deletre1
integer x = 105
integer y = 1460
integer width = 1349
integer height = 212
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 80
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type mle_observations from multilineedit within w_diagnos_maj_deletre1
integer x = 119
integer y = 444
integer width = 1330
integer height = 248
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 120
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true

end event

type cb_enregistrer from commandbutton within w_diagnos_maj_deletre1
integer x = 1330
integer y = 1724
integer width = 352
integer height = 108
integer taborder = 160
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

event clicked;place_avec_blancs(mle_observations.text,page,1,120)
place_avec_blancs(mle_diag_squelettique.text,page,201,40)
place_avec_blancs(sle_ap.text,page,301,40)
place_avec_blancs(sle_v.text,page,341,40)
place_avec_blancs(sle_t.text,page,381,40)
place_avec_blancs(sle_ddm.text ,page,421,40)
place_avec_blancs(mle_anomalies.text,page,501,80)

place_avec_blancs(mle_traitement.text,page,601,40)
place_avec_blancs(mle_interception.text ,page,641,80)
place_avec_blancs(mle_extraction.text,page,721,40)
place_avec_blancs(mle_mandibule.text,page,801,120)
place_avec_blancs(mle_maxillaire.text,page,1101,1120)




UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if dw_patient.update() = 1 and SQLCA.Sqlcode = 0 then
	modif = false
	COMMIT ;
else
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
end if

end event

type cb_annuler from commandbutton within w_diagnos_maj_deletre1
integer x = 1701
integer y = 1724
integer width = 352
integer height = 108
integer taborder = 140
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;init()
end on

type cb_fermer from commandbutton within w_diagnos_maj_deletre1
integer x = 2071
integer y = 1724
integer width = 352
integer height = 108
integer taborder = 170
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type gb_55555 from groupbox within w_diagnos_maj_deletre1
integer x = 1563
integer y = 856
integer width = 1216
integer height = 192
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Extraction"
end type

type gb_555 from groupbox within w_diagnos_maj_deletre1
integer x = 1568
integer y = 392
integer width = 1216
integer height = 192
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Traitement"
end type

type gb_444 from groupbox within w_diagnos_maj_deletre1
integer x = 1568
integer y = 1368
integer width = 1216
integer height = 324
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Maxillaire"
end type

type gb_44 from groupbox within w_diagnos_maj_deletre1
integer x = 1563
integer y = 1044
integer width = 1216
integer height = 324
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Mandibule"
end type

type gb_77 from groupbox within w_diagnos_maj_deletre1
integer x = 1568
integer y = 588
integer width = 1216
integer height = 268
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Interception"
end type

type gb_66 from groupbox within w_diagnos_maj_deletre1
integer x = 73
integer y = 1408
integer width = 1422
integer height = 288
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Anomalies"
end type

type gb_55 from groupbox within w_diagnos_maj_deletre1
integer x = 87
integer y = 748
integer width = 1403
integer height = 192
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Diagnostic Squelettique"
end type

type gb_5 from groupbox within w_diagnos_maj_deletre1
integer x = 73
integer y = 948
integer width = 1426
integer height = 444
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Diagnostic Dentaire"
end type

type gb_4 from groupbox within w_diagnos_maj_deletre1
integer x = 87
integer y = 396
integer width = 1403
integer height = 324
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Oberservations"
end type

