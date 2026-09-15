$PBExportHeader$w_diagnos_maj_villemagne1.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_villemagne1 from window
end type
type em_contention from editmask within w_diagnos_maj_villemagne1
end type
type em_trait from editmask within w_diagnos_maj_villemagne1
end type
type sle_pronostic from singlelineedit within w_diagnos_maj_villemagne1
end type
type sle_contention from singlelineedit within w_diagnos_maj_villemagne1
end type
type st_8 from statictext within w_diagnos_maj_villemagne1
end type
type st_7 from statictext within w_diagnos_maj_villemagne1
end type
type st_6 from statictext within w_diagnos_maj_villemagne1
end type
type st_5 from statictext within w_diagnos_maj_villemagne1
end type
type st_4 from statictext within w_diagnos_maj_villemagne1
end type
type st_1 from statictext within w_diagnos_maj_villemagne1
end type
type sle_dents from singlelineedit within w_diagnos_maj_villemagne1
end type
type st_2 from statictext within w_diagnos_maj_villemagne1
end type
type st_3 from statictext within w_diagnos_maj_villemagne1
end type
type sle_agenesie from singlelineedit within w_diagnos_maj_villemagne1
end type
type sle_surnum from singlelineedit within w_diagnos_maj_villemagne1
end type
type mle_diagnostic from multilineedit within w_diagnos_maj_villemagne1
end type
type cb_imprimer from commandbutton within w_diagnos_maj_villemagne1
end type
type cb_suivant from commandbutton within w_diagnos_maj_villemagne1
end type
type mle_appareil from multilineedit within w_diagnos_maj_villemagne1
end type
type mle_sequence from multilineedit within w_diagnos_maj_villemagne1
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_villemagne1
end type
type cb_annuler from commandbutton within w_diagnos_maj_villemagne1
end type
type cb_fermer from commandbutton within w_diagnos_maj_villemagne1
end type
type gb_8 from groupbox within w_diagnos_maj_villemagne1
end type
type gb_5 from groupbox within w_diagnos_maj_villemagne1
end type
type gb_4 from groupbox within w_diagnos_maj_villemagne1
end type
end forward

global type w_diagnos_maj_villemagne1 from window
integer x = 5
integer y = 8
integer width = 3671
integer height = 2312
boolean titlebar = true
string title = "Page N°1"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 12632256
em_contention em_contention
em_trait em_trait
sle_pronostic sle_pronostic
sle_contention sle_contention
st_8 st_8
st_7 st_7
st_6 st_6
st_5 st_5
st_4 st_4
st_1 st_1
sle_dents sle_dents
st_2 st_2
st_3 st_3
sle_agenesie sle_agenesie
sle_surnum sle_surnum
mle_diagnostic mle_diagnostic
cb_imprimer cb_imprimer
cb_suivant cb_suivant
mle_appareil mle_appareil
mle_sequence mle_sequence
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
gb_8 gb_8
gb_5 gb_5
gb_4 gb_4
end type
global w_diagnos_maj_villemagne1 w_diagnos_maj_villemagne1

type variables
double var_code_local 
string page
boolean modif
uo_fx_pages_cliniques f		//modif du 22/11/2002
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();modif = false

mle_diagnostic.text = Righttrim(trim(mid(page,1,350)))
mle_sequence.text = Righttrim(trim(mid(page,351,350)))
mle_appareil.text = Righttrim(trim(mid(page,701,350)))

sle_agenesie.text = Righttrim(trim(mid(page,1060,40)))
sle_surnum.text = Righttrim(trim(mid(page,1100,40)))
sle_dents.text = Righttrim(trim(mid(page,1150,40)))

sle_contention.text = Righttrim(trim(mid(page,1200,100)))
sle_pronostic.text = Righttrim(trim(mid(page,1300,100)))

em_trait.text = Righttrim(trim(mid(page,1400,3)))
em_contention.text = Righttrim(trim(mid(page,1405,3)))

f.lire_d(mle_diagnostic,var_code_local)	//modif du 22/11/2002
end subroutine

event open;
var_code_local = message.doubleparm


string vn,vm,vp 
date vd
integer an, mois

select nom,prenom,moulage,date_naissance INTO :vn,:vp,:vm,:vd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if
if isnull(vp) then
	vp = ""
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

this.title = "Page N°1 : "+vn+" " +vp+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(mois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(2000)
end if

init()



end event

on w_diagnos_maj_villemagne1.create
this.em_contention=create em_contention
this.em_trait=create em_trait
this.sle_pronostic=create sle_pronostic
this.sle_contention=create sle_contention
this.st_8=create st_8
this.st_7=create st_7
this.st_6=create st_6
this.st_5=create st_5
this.st_4=create st_4
this.st_1=create st_1
this.sle_dents=create sle_dents
this.st_2=create st_2
this.st_3=create st_3
this.sle_agenesie=create sle_agenesie
this.sle_surnum=create sle_surnum
this.mle_diagnostic=create mle_diagnostic
this.cb_imprimer=create cb_imprimer
this.cb_suivant=create cb_suivant
this.mle_appareil=create mle_appareil
this.mle_sequence=create mle_sequence
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.gb_8=create gb_8
this.gb_5=create gb_5
this.gb_4=create gb_4
this.Control[]={this.em_contention,&
this.em_trait,&
this.sle_pronostic,&
this.sle_contention,&
this.st_8,&
this.st_7,&
this.st_6,&
this.st_5,&
this.st_4,&
this.st_1,&
this.sle_dents,&
this.st_2,&
this.st_3,&
this.sle_agenesie,&
this.sle_surnum,&
this.mle_diagnostic,&
this.cb_imprimer,&
this.cb_suivant,&
this.mle_appareil,&
this.mle_sequence,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.gb_8,&
this.gb_5,&
this.gb_4}
end on

on w_diagnos_maj_villemagne1.destroy
destroy(this.em_contention)
destroy(this.em_trait)
destroy(this.sle_pronostic)
destroy(this.sle_contention)
destroy(this.st_8)
destroy(this.st_7)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_1)
destroy(this.sle_dents)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.sle_agenesie)
destroy(this.sle_surnum)
destroy(this.mle_diagnostic)
destroy(this.cb_imprimer)
destroy(this.cb_suivant)
destroy(this.mle_appareil)
destroy(this.mle_sequence)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.gb_8)
destroy(this.gb_5)
destroy(this.gb_4)
end on

type em_contention from editmask within w_diagnos_maj_villemagne1
event modified pbm_enmodified
integer x = 882
integer y = 1844
integer width = 160
integer height = 72
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
string displaydata = ""
end type

event modified;modif = true
end event

type em_trait from editmask within w_diagnos_maj_villemagne1
event modified pbm_enmodified
integer x = 882
integer y = 1736
integer width = 160
integer height = 72
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "xxx"
string displaydata = ""
end type

event modified;modif = true
end event

type sle_pronostic from singlelineedit within w_diagnos_maj_villemagne1
event modified pbm_enmodified
integer x = 443
integer y = 1964
integer width = 2427
integer height = 80
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type sle_contention from singlelineedit within w_diagnos_maj_villemagne1
event modified pbm_enmodified
integer x = 443
integer y = 1632
integer width = 2427
integer height = 80
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean autohscroll = false
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

event modified;modif = true
end event

type st_8 from statictext within w_diagnos_maj_villemagne1
integer x = 110
integer y = 1992
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Pronostic"
boolean focusrectangle = false
end type

type st_7 from statictext within w_diagnos_maj_villemagne1
integer x = 110
integer y = 1852
integer width = 722
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Durée de la contention (en mois)"
boolean focusrectangle = false
end type

type st_6 from statictext within w_diagnos_maj_villemagne1
integer x = 110
integer y = 1736
integer width = 658
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Durée du traitement (en mois)"
boolean focusrectangle = false
end type

type st_5 from statictext within w_diagnos_maj_villemagne1
integer x = 110
integer y = 1624
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Contention"
boolean focusrectangle = false
end type

type st_4 from statictext within w_diagnos_maj_villemagne1
integer x = 128
integer y = 768
integer width = 1234
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Plan de Traitement"
boolean focusrectangle = false
end type

type st_1 from statictext within w_diagnos_maj_villemagne1
integer x = 2181
integer y = 360
integer width = 343
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Dents extraites"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_dents from singlelineedit within w_diagnos_maj_villemagne1
event modified pbm_enmodified
integer x = 2574
integer y = 352
integer width = 837
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

event modified;modif = true
end event

type st_2 from statictext within w_diagnos_maj_villemagne1
integer x = 2277
integer y = 100
integer width = 247
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Agénésie"
alignment alignment = right!
boolean focusrectangle = false
end type

type st_3 from statictext within w_diagnos_maj_villemagne1
integer x = 2034
integer y = 232
integer width = 489
integer height = 76
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
boolean enabled = false
string text = "Dents Surnuméraires."
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_agenesie from singlelineedit within w_diagnos_maj_villemagne1
event modified pbm_enmodified
integer x = 2574
integer y = 88
integer width = 837
integer height = 80
integer taborder = 20
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

type sle_surnum from singlelineedit within w_diagnos_maj_villemagne1
event modified pbm_enmodified
integer x = 2574
integer y = 220
integer width = 837
integer height = 80
integer taborder = 30
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

type mle_diagnostic from multilineedit within w_diagnos_maj_villemagne1
integer x = 105
integer y = 80
integer width = 1705
integer height = 624
integer taborder = 10
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

type cb_imprimer from commandbutton within w_diagnos_maj_villemagne1
integer x = 1824
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen( )
PrintScreen(Job, 10,1000)
PrintClose(Job)
end event

type cb_suivant from commandbutton within w_diagnos_maj_villemagne1
integer x = 2194
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Suivant"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		openwithparm(w_diagnos_maj_villemagne2,var_code_local)
		Close(w_diagnos_maj_villemagne1)
	end if
else
	openwithparm(w_diagnos_maj_villemagne2,var_code_local)
	close(w_diagnos_maj_villemagne1)
end if
end event

type mle_appareil from multilineedit within w_diagnos_maj_villemagne1
event modified pbm_enmodified
integer x = 1893
integer y = 948
integer width = 1705
integer height = 596
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 350
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true

end event

type mle_sequence from multilineedit within w_diagnos_maj_villemagne1
integer x = 105
integer y = 948
integer width = 1705
integer height = 596
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean vscrollbar = true
integer limit = 350
borderstyle borderstyle = stylelowered!
boolean ignoredefaultbutton = true
end type

event modified;modif = true

end event

type cb_enregistrer from commandbutton within w_diagnos_maj_villemagne1
integer x = 2912
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 140
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

event clicked;place_avec_blancs(mle_diagnostic.text,page,1,350)
place_avec_blancs(mle_sequence.text,page,351,350)
place_avec_blancs(mle_appareil.text,page,701,350)

place_avec_blancs(sle_agenesie.text,page,1060,40)
place_avec_blancs(sle_surnum.text,page,1100,40)
place_avec_blancs(sle_dents.text,page,1150,40)

place_avec_blancs(sle_contention.text,page,1200,100)
place_avec_blancs(sle_pronostic.text,page,1300,100)

place_avec_blancs(em_trait.text,page,1400,3)
place_avec_blancs(em_contention.text,page,1405,3)

f.ecrire_d(mle_diagnostic,var_code_local)	//modif du 22/11/2002

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if



end event

type cb_annuler from commandbutton within w_diagnos_maj_villemagne1
integer x = 2555
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;init()
end on

type cb_fermer from commandbutton within w_diagnos_maj_villemagne1
integer x = 3264
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 150
integer textsize = -8
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

type gb_8 from groupbox within w_diagnos_maj_villemagne1
integer x = 82
integer y = 24
integer width = 1760
integer height = 708
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Diagnostic"
end type

type gb_5 from groupbox within w_diagnos_maj_villemagne1
integer x = 1856
integer y = 868
integer width = 1760
integer height = 696
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Appareillage"
end type

type gb_4 from groupbox within w_diagnos_maj_villemagne1
integer x = 82
integer y = 868
integer width = 1760
integer height = 696
integer textsize = -8
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 12632256
string text = "Séquences thérapeutiques"
end type

