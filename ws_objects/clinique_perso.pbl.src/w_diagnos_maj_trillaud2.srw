$PBExportHeader$w_diagnos_maj_trillaud2.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_trillaud2 from window
end type
type cb_suivant from commandbutton within w_diagnos_maj_trillaud2
end type
type em_d20 from editmask within w_diagnos_maj_trillaud2
end type
type em_d19 from editmask within w_diagnos_maj_trillaud2
end type
type em_d18 from editmask within w_diagnos_maj_trillaud2
end type
type em_d17 from editmask within w_diagnos_maj_trillaud2
end type
type em_d16 from editmask within w_diagnos_maj_trillaud2
end type
type em_d11 from editmask within w_diagnos_maj_trillaud2
end type
type em_d12 from editmask within w_diagnos_maj_trillaud2
end type
type em_d13 from editmask within w_diagnos_maj_trillaud2
end type
type em_d14 from editmask within w_diagnos_maj_trillaud2
end type
type em_d15 from editmask within w_diagnos_maj_trillaud2
end type
type em_d10 from editmask within w_diagnos_maj_trillaud2
end type
type em_d9 from editmask within w_diagnos_maj_trillaud2
end type
type em_d8 from editmask within w_diagnos_maj_trillaud2
end type
type em_d7 from editmask within w_diagnos_maj_trillaud2
end type
type em_d6 from editmask within w_diagnos_maj_trillaud2
end type
type em_d1 from editmask within w_diagnos_maj_trillaud2
end type
type em_d2 from editmask within w_diagnos_maj_trillaud2
end type
type em_d3 from editmask within w_diagnos_maj_trillaud2
end type
type em_d4 from editmask within w_diagnos_maj_trillaud2
end type
type em_d5 from editmask within w_diagnos_maj_trillaud2
end type
type cb_precedent from commandbutton within w_diagnos_maj_trillaud2
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_trillaud2
end type
type cb_annuler from commandbutton within w_diagnos_maj_trillaud2
end type
type cb_fermer from commandbutton within w_diagnos_maj_trillaud2
end type
type ole_photo023 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo024 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo025 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo030 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo029 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo028 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo021 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo026 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo022 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo027 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo031 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo032 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo033 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo034 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo035 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo036 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo037 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo038 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo039 from gearbox within w_diagnos_maj_trillaud2
end type
type ole_photo040 from gearbox within w_diagnos_maj_trillaud2
end type
end forward

global type w_diagnos_maj_trillaud2 from window
integer x = 5
integer y = 8
integer width = 3552
integer height = 1944
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 12632256
cb_suivant cb_suivant
em_d20 em_d20
em_d19 em_d19
em_d18 em_d18
em_d17 em_d17
em_d16 em_d16
em_d11 em_d11
em_d12 em_d12
em_d13 em_d13
em_d14 em_d14
em_d15 em_d15
em_d10 em_d10
em_d9 em_d9
em_d8 em_d8
em_d7 em_d7
em_d6 em_d6
em_d1 em_d1
em_d2 em_d2
em_d3 em_d3
em_d4 em_d4
em_d5 em_d5
cb_precedent cb_precedent
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
ole_photo023 ole_photo023
ole_photo024 ole_photo024
ole_photo025 ole_photo025
ole_photo030 ole_photo030
ole_photo029 ole_photo029
ole_photo028 ole_photo028
ole_photo021 ole_photo021
ole_photo026 ole_photo026
ole_photo022 ole_photo022
ole_photo027 ole_photo027
ole_photo031 ole_photo031
ole_photo032 ole_photo032
ole_photo033 ole_photo033
ole_photo034 ole_photo034
ole_photo035 ole_photo035
ole_photo036 ole_photo036
ole_photo037 ole_photo037
ole_photo038 ole_photo038
ole_photo039 ole_photo039
ole_photo040 ole_photo040
end type
global w_diagnos_maj_trillaud2 w_diagnos_maj_trillaud2

type variables
double var_code_local 
String var_nom_local,moul_local
boolean modif
double zoom
string page

uo_fx_pages_cliniques	f
end variables

forward prototypes
public subroutine init ()
public subroutine save ()
end prototypes

public subroutine init ();f.lirepage(em_d20,page,2420,7)
f.lirepage(em_d19,page,2427,7)
f.lirepage(em_d18,page,2434,7)
f.lirepage(em_d17,page,2441,7)
f.lirepage(em_d16,page,2448,7)
f.lirepage(em_d11,page,2455,7)
f.lirepage(em_d12,page,2462,7)
f.lirepage(em_d13,page,2469,7)
f.lirepage(em_d14,page,2476,7)
f.lirepage(em_d15,page,2483,7)
f.lirepage(em_d10,page,2490,7)
f.lirepage(em_d9,page,2497,7)
f.lirepage(em_d8,page,2504,7)
f.lirepage(em_d7,page,2511,7)
f.lirepage(em_d6,page,2518,7)
f.lirepage(em_d1,page,2525,7)
f.lirepage(em_d2,page,2532,7)
f.lirepage(em_d3,page,2539,7)
f.lirepage(em_d4,page,2546,7)
f.lirepage(em_d5,page,2553,7)
// max carac = 2560


cb_fermer.setfocus()
modif = false
end subroutine

public subroutine save ();f.ecrirepage(em_d20,page,2420,7)
f.ecrirepage(em_d19,page,2427,7)
f.ecrirepage(em_d18,page,2434,7)
f.ecrirepage(em_d17,page,2441,7)
f.ecrirepage(em_d16,page,2448,7)
f.ecrirepage(em_d11,page,2455,7)
f.ecrirepage(em_d12,page,2462,7)
f.ecrirepage(em_d13,page,2469,7)
f.ecrirepage(em_d14,page,2476,7)
f.ecrirepage(em_d15,page,2483,7)
f.ecrirepage(em_d10,page,2490,7)
f.ecrirepage(em_d9,page,2497,7)
f.ecrirepage(em_d8,page,2504,7)
f.ecrirepage(em_d7,page,2511,7)
f.ecrirepage(em_d6,page,2518,7)
f.ecrirepage(em_d1,page,2525,7)
f.ecrirepage(em_d2,page,2532,7)
f.ecrirepage(em_d3,page,2539,7)
f.ecrirepage(em_d4,page,2546,7)
f.ecrirepage(em_d5,page,2553,7)
// max carac = 2560



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end subroutine

event open;var_code_local = message.doubleparm

string vn,vm 
date vd
integer an, lmois

select nom,moulage,date_naissance INTO :vn,:vm,:vd FROM patient WHERE code = :var_code_local ;

if isnull(vm) then vm = ""
if isnull(vd) then vd = Today()

if (month(today()) < month( vd )) then
	an = year(today()) - year( vd ) - 1
ELSE
	an = year(today()) - year( vd )
END IF	

if (month(today()) < month( vd )) then
	lmois = month(today()) - month( vd ) +12
ELSE
	lmois = month(today()) - month( vd )
END IF

this.title = "Page N°2 : "+vn+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(lmois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

//charge tout ce qui va bien
init()
mep_win_mdi(this,1)

end event

on w_diagnos_maj_trillaud2.create
this.cb_suivant=create cb_suivant
this.em_d20=create em_d20
this.em_d19=create em_d19
this.em_d18=create em_d18
this.em_d17=create em_d17
this.em_d16=create em_d16
this.em_d11=create em_d11
this.em_d12=create em_d12
this.em_d13=create em_d13
this.em_d14=create em_d14
this.em_d15=create em_d15
this.em_d10=create em_d10
this.em_d9=create em_d9
this.em_d8=create em_d8
this.em_d7=create em_d7
this.em_d6=create em_d6
this.em_d1=create em_d1
this.em_d2=create em_d2
this.em_d3=create em_d3
this.em_d4=create em_d4
this.em_d5=create em_d5
this.cb_precedent=create cb_precedent
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.ole_photo023=create ole_photo023
this.ole_photo024=create ole_photo024
this.ole_photo025=create ole_photo025
this.ole_photo030=create ole_photo030
this.ole_photo029=create ole_photo029
this.ole_photo028=create ole_photo028
this.ole_photo021=create ole_photo021
this.ole_photo026=create ole_photo026
this.ole_photo022=create ole_photo022
this.ole_photo027=create ole_photo027
this.ole_photo031=create ole_photo031
this.ole_photo032=create ole_photo032
this.ole_photo033=create ole_photo033
this.ole_photo034=create ole_photo034
this.ole_photo035=create ole_photo035
this.ole_photo036=create ole_photo036
this.ole_photo037=create ole_photo037
this.ole_photo038=create ole_photo038
this.ole_photo039=create ole_photo039
this.ole_photo040=create ole_photo040
this.Control[]={this.cb_suivant,&
this.em_d20,&
this.em_d19,&
this.em_d18,&
this.em_d17,&
this.em_d16,&
this.em_d11,&
this.em_d12,&
this.em_d13,&
this.em_d14,&
this.em_d15,&
this.em_d10,&
this.em_d9,&
this.em_d8,&
this.em_d7,&
this.em_d6,&
this.em_d1,&
this.em_d2,&
this.em_d3,&
this.em_d4,&
this.em_d5,&
this.cb_precedent,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer,&
this.ole_photo023,&
this.ole_photo024,&
this.ole_photo025,&
this.ole_photo030,&
this.ole_photo029,&
this.ole_photo028,&
this.ole_photo021,&
this.ole_photo026,&
this.ole_photo022,&
this.ole_photo027,&
this.ole_photo031,&
this.ole_photo032,&
this.ole_photo033,&
this.ole_photo034,&
this.ole_photo035,&
this.ole_photo036,&
this.ole_photo037,&
this.ole_photo038,&
this.ole_photo039,&
this.ole_photo040}
end on

on w_diagnos_maj_trillaud2.destroy
destroy(this.cb_suivant)
destroy(this.em_d20)
destroy(this.em_d19)
destroy(this.em_d18)
destroy(this.em_d17)
destroy(this.em_d16)
destroy(this.em_d11)
destroy(this.em_d12)
destroy(this.em_d13)
destroy(this.em_d14)
destroy(this.em_d15)
destroy(this.em_d10)
destroy(this.em_d9)
destroy(this.em_d8)
destroy(this.em_d7)
destroy(this.em_d6)
destroy(this.em_d1)
destroy(this.em_d2)
destroy(this.em_d3)
destroy(this.em_d4)
destroy(this.em_d5)
destroy(this.cb_precedent)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.ole_photo023)
destroy(this.ole_photo024)
destroy(this.ole_photo025)
destroy(this.ole_photo030)
destroy(this.ole_photo029)
destroy(this.ole_photo028)
destroy(this.ole_photo021)
destroy(this.ole_photo026)
destroy(this.ole_photo022)
destroy(this.ole_photo027)
destroy(this.ole_photo031)
destroy(this.ole_photo032)
destroy(this.ole_photo033)
destroy(this.ole_photo034)
destroy(this.ole_photo035)
destroy(this.ole_photo036)
destroy(this.ole_photo037)
destroy(this.ole_photo038)
destroy(this.ole_photo039)
destroy(this.ole_photo040)
end on

type cb_suivant from commandbutton within w_diagnos_maj_trillaud2
integer x = 1856
integer y = 1712
integer width = 338
integer height = 96
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Suivant"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		if ui_v2020 then
			OpenWithParm( w_diagnos_maj_trillaud3, var_code_local, w_mdi_2020)
		else	
			OpenSheetWithParm(w_diagnos_maj_trillaud3,var_code_local,w_mdi,1,Original!)
		end if
		Close(w_diagnos_maj_trillaud2)
	end if
else
	if ui_v2020 then
		OpenWithParm( w_diagnos_maj_trillaud3, var_code_local, w_mdi_2020)
	else	
		OpenSheetWithParm(w_diagnos_maj_trillaud3,var_code_local,w_mdi,1,Original!)
	end if
	close(w_diagnos_maj_trillaud2)
end if

end event

type em_d20 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 3173
integer y = 1600
integer width = 274
integer height = 76
integer taborder = 200
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d19 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 2464
integer y = 1600
integer width = 274
integer height = 76
integer taborder = 190
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d18 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 1755
integer y = 1600
integer width = 274
integer height = 76
integer taborder = 180
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d17 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 1047
integer y = 1600
integer width = 274
integer height = 76
integer taborder = 170
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d16 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 338
integer y = 1600
integer width = 274
integer height = 76
integer taborder = 160
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d11 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 338
integer y = 1180
integer width = 274
integer height = 76
integer taborder = 110
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d12 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 1047
integer y = 1180
integer width = 274
integer height = 76
integer taborder = 120
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d13 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 1755
integer y = 1180
integer width = 274
integer height = 76
integer taborder = 130
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d14 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 2464
integer y = 1180
integer width = 274
integer height = 76
integer taborder = 140
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d15 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 3173
integer y = 1180
integer width = 274
integer height = 76
integer taborder = 150
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d10 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 3173
integer y = 760
integer width = 274
integer height = 76
integer taborder = 100
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d9 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 2464
integer y = 760
integer width = 274
integer height = 76
integer taborder = 90
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d8 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 1755
integer y = 760
integer width = 274
integer height = 76
integer taborder = 80
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d7 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 1047
integer y = 760
integer width = 274
integer height = 76
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d6 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 338
integer y = 760
integer width = 274
integer height = 76
integer taborder = 60
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d1 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 338
integer y = 340
integer width = 274
integer height = 76
integer taborder = 10
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d2 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 1047
integer y = 340
integer width = 274
integer height = 76
integer taborder = 20
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d3 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 1755
integer y = 340
integer width = 274
integer height = 76
integer taborder = 30
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d4 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 2464
integer y = 340
integer width = 274
integer height = 76
integer taborder = 40
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type em_d5 from editmask within w_diagnos_maj_trillaud2
event modified pbm_enmodified
integer x = 3173
integer y = 340
integer width = 274
integer height = 76
integer taborder = 50
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
string displaydata = ""
end type

event modified;modif = true
end event

type cb_precedent from commandbutton within w_diagnos_maj_trillaud2
event clicked pbm_bnclicked
integer x = 1477
integer y = 1712
integer width = 338
integer height = 96
integer taborder = 210
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Précédent"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		if ui_v2020 then
			OpenWithParm( w_diagnos_maj_trillaud1, var_code_local, w_mdi_2020)
		else	
			OpenSheetWithParm(w_diagnos_maj_trillaud1,var_code_local,w_mdi,1,Original!)
		end if
		Close(w_diagnos_maj_trillaud2)
	end if
else
	if ui_v2020 then
		OpenWithParm( w_diagnos_maj_trillaud1, var_code_local, w_mdi_2020)
	else	
		OpenSheetWithParm(w_diagnos_maj_trillaud1,var_code_local,w_mdi,1,Original!)
	end if
	close(w_diagnos_maj_trillaud2)
end if
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_trillaud2
integer x = 2601
integer y = 1712
integer width = 338
integer height = 96
integer taborder = 230
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;save()

end event

type cb_annuler from commandbutton within w_diagnos_maj_trillaud2
integer x = 2226
integer y = 1712
integer width = 338
integer height = 96
integer taborder = 220
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

event clicked;init()
end event

type cb_fermer from commandbutton within w_diagnos_maj_trillaud2
integer x = 2971
integer y = 1712
integer width = 338
integer height = 96
integer taborder = 240
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

type ole_photo023 from gearbox within w_diagnos_maj_trillaud2
integer x = 1440
integer y = 20
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_trillaud2
integer x = 2149
integer y = 20
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo025 from gearbox within w_diagnos_maj_trillaud2
integer x = 2857
integer y = 20
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_trillaud2
integer x = 2857
integer y = 440
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_trillaud2
integer x = 2149
integer y = 440
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_trillaud2
integer x = 1440
integer y = 440
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_trillaud2
integer x = 23
integer y = 20
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_trillaud2
integer x = 23
integer y = 440
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_trillaud2
integer x = 731
integer y = 20
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo027 from gearbox within w_diagnos_maj_trillaud2
integer x = 731
integer y = 440
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type ole_photo031 from gearbox within w_diagnos_maj_trillaud2
integer x = 23
integer y = 860
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_trillaud2
integer x = 731
integer y = 860
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_trillaud2
integer x = 1440
integer y = 860
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type ole_photo034 from gearbox within w_diagnos_maj_trillaud2
integer x = 2149
integer y = 860
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type ole_photo035 from gearbox within w_diagnos_maj_trillaud2
integer x = 2857
integer y = 860
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo036 from gearbox within w_diagnos_maj_trillaud2
integer x = 23
integer y = 1280
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

type ole_photo037 from gearbox within w_diagnos_maj_trillaud2
integer x = 731
integer y = 1280
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo037.destroy
call gearbox::destroy
end on

type ole_photo038 from gearbox within w_diagnos_maj_trillaud2
integer x = 1440
integer y = 1280
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo038.destroy
call gearbox::destroy
end on

type ole_photo039 from gearbox within w_diagnos_maj_trillaud2
integer x = 2149
integer y = 1280
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo039.destroy
call gearbox::destroy
end on

type ole_photo040 from gearbox within w_diagnos_maj_trillaud2
integer x = 2857
integer y = 1280
integer width = 576
integer height = 380
boolean vignette = true
end type

on ole_photo040.destroy
call gearbox::destroy
end on

