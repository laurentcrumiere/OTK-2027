$PBExportHeader$w_diagnos_maj_videau4.srw
$PBExportComments$gearbox~r~npage suplémentaire du 28/06/2001
forward
global type w_diagnos_maj_videau4 from window
end type
type em_4 from editmask within w_diagnos_maj_videau4
end type
type em_3 from editmask within w_diagnos_maj_videau4
end type
type em_2 from editmask within w_diagnos_maj_videau4
end type
type em_1 from editmask within w_diagnos_maj_videau4
end type
type ole_photo025 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo022 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo019 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo016 from gearbox within w_diagnos_maj_videau4
end type
type cb_imprimer from commandbutton within w_diagnos_maj_videau4
end type
type cb_fermer from commandbutton within w_diagnos_maj_videau4
end type
type cb_annuler from commandbutton within w_diagnos_maj_videau4
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_videau4
end type
type cb_precedent from commandbutton within w_diagnos_maj_videau4
end type
type ole_photo017 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo020 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo023 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo026 from gearbox within w_diagnos_maj_videau4
end type
type em_5 from editmask within w_diagnos_maj_videau4
end type
type em_6 from editmask within w_diagnos_maj_videau4
end type
type em_7 from editmask within w_diagnos_maj_videau4
end type
type em_8 from editmask within w_diagnos_maj_videau4
end type
type ole_photo018 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo028 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo029 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo030 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo021 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo024 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo027 from gearbox within w_diagnos_maj_videau4
end type
type em_9 from editmask within w_diagnos_maj_videau4
end type
type em_10 from editmask within w_diagnos_maj_videau4
end type
type em_11 from editmask within w_diagnos_maj_videau4
end type
type em_12 from editmask within w_diagnos_maj_videau4
end type
type ole_photo031 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo032 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo033 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo034 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo035 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo036 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo037 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo038 from gearbox within w_diagnos_maj_videau4
end type
type ole_photo039 from gearbox within w_diagnos_maj_videau4
end type
type em_13 from editmask within w_diagnos_maj_videau4
end type
type em_14 from editmask within w_diagnos_maj_videau4
end type
type em_15 from editmask within w_diagnos_maj_videau4
end type
type em_16 from editmask within w_diagnos_maj_videau4
end type
type em_17 from editmask within w_diagnos_maj_videau4
end type
type em_18 from editmask within w_diagnos_maj_videau4
end type
type em_19 from editmask within w_diagnos_maj_videau4
end type
type em_20 from editmask within w_diagnos_maj_videau4
end type
type em_21 from editmask within w_diagnos_maj_videau4
end type
type em_22 from editmask within w_diagnos_maj_videau4
end type
type em_23 from editmask within w_diagnos_maj_videau4
end type
type em_24 from editmask within w_diagnos_maj_videau4
end type
type r_1 from rectangle within w_diagnos_maj_videau4
end type
end forward

global type w_diagnos_maj_videau4 from window
integer width = 3671
integer height = 2312
boolean titlebar = true
boolean controlmenu = true
boolean resizable = true
long backcolor = 12632256
em_4 em_4
em_3 em_3
em_2 em_2
em_1 em_1
ole_photo025 ole_photo025
ole_photo022 ole_photo022
ole_photo019 ole_photo019
ole_photo016 ole_photo016
cb_imprimer cb_imprimer
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_precedent cb_precedent
ole_photo017 ole_photo017
ole_photo020 ole_photo020
ole_photo023 ole_photo023
ole_photo026 ole_photo026
em_5 em_5
em_6 em_6
em_7 em_7
em_8 em_8
ole_photo018 ole_photo018
ole_photo028 ole_photo028
ole_photo029 ole_photo029
ole_photo030 ole_photo030
ole_photo021 ole_photo021
ole_photo024 ole_photo024
ole_photo027 ole_photo027
em_9 em_9
em_10 em_10
em_11 em_11
em_12 em_12
ole_photo031 ole_photo031
ole_photo032 ole_photo032
ole_photo033 ole_photo033
ole_photo034 ole_photo034
ole_photo035 ole_photo035
ole_photo036 ole_photo036
ole_photo037 ole_photo037
ole_photo038 ole_photo038
ole_photo039 ole_photo039
em_13 em_13
em_14 em_14
em_15 em_15
em_16 em_16
em_17 em_17
em_18 em_18
em_19 em_19
em_20 em_20
em_21 em_21
em_22 em_22
em_23 em_23
em_24 em_24
r_1 r_1
end type
global w_diagnos_maj_videau4 w_diagnos_maj_videau4

type variables
double var_code_local 
string page
boolean modif
uo_fx_pages_cliniques f
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();f.lirepage(em_1,page,3310,10)
f.lirepage(em_2,page,3320,10)
f.lirepage(em_3,page,3330,10)
f.lirepage(em_4,page,3340,10)
f.lirepage(em_5,page,3350,10)
f.lirepage(em_6,page,3360,10)
f.lirepage(em_7,page,3370,10)
f.lirepage(em_8,page,3380,10)
f.lirepage(em_9,page,3390,10)
f.lirepage(em_10,page,3400,10)
f.lirepage(em_11,page,3410,10)
f.lirepage(em_12,page,3420,10)
f.lirepage(em_13,page,3430,10)
f.lirepage(em_14,page,3440,10)
f.lirepage(em_15,page,3450,10)
f.lirepage(em_16,page,3460,10)
f.lirepage(em_17,page,3470,10)
f.lirepage(em_18,page,3480,10)
f.lirepage(em_19,page,3490,10)
f.lirepage(em_20,page,3500,10)
f.lirepage(em_21,page,3510,10)
f.lirepage(em_22,page,3520,10)
f.lirepage(em_23,page,3530,10)
f.lirepage(em_24,page,3540,10)


modif = false
cb_fermer.setfocus()
end subroutine

event open;

var_code_local = message.doubleparm


string vn,vm,vp 
date vd
integer an, vmois
double nd

select nom,prenom,moulage,date_naissance, numero_dossier INTO :vn,:vp,:vm,:vd, :nd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if
if isnull(vd) then
	vd = today()
end if

if (month(today()) < month( vd )) then
	an = year(today()) - year( vd ) - 1
ELSE
	an = year(today()) - year( vd )
END IF	

if (month(today()) < month( vd )) then
	vmois = month(today()) - month( vd ) +12
ELSE
	vmois = month(today()) - month( vd )
END IF

this.title = "Page N°4 : "+vn+" " +vp+" - N° dossier : "+string(var_code_local)+ " - Age : " + string(an) + " ans " + string(vmois) + " mois " + " (Moulage : "+vm+")"


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

if len(page) < 4000 then
	page = page + space(4000 - len(page))
end if

init()

end event

on w_diagnos_maj_videau4.create
this.em_4=create em_4
this.em_3=create em_3
this.em_2=create em_2
this.em_1=create em_1
this.ole_photo025=create ole_photo025
this.ole_photo022=create ole_photo022
this.ole_photo019=create ole_photo019
this.ole_photo016=create ole_photo016
this.cb_imprimer=create cb_imprimer
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_precedent=create cb_precedent
this.ole_photo017=create ole_photo017
this.ole_photo020=create ole_photo020
this.ole_photo023=create ole_photo023
this.ole_photo026=create ole_photo026
this.em_5=create em_5
this.em_6=create em_6
this.em_7=create em_7
this.em_8=create em_8
this.ole_photo018=create ole_photo018
this.ole_photo028=create ole_photo028
this.ole_photo029=create ole_photo029
this.ole_photo030=create ole_photo030
this.ole_photo021=create ole_photo021
this.ole_photo024=create ole_photo024
this.ole_photo027=create ole_photo027
this.em_9=create em_9
this.em_10=create em_10
this.em_11=create em_11
this.em_12=create em_12
this.ole_photo031=create ole_photo031
this.ole_photo032=create ole_photo032
this.ole_photo033=create ole_photo033
this.ole_photo034=create ole_photo034
this.ole_photo035=create ole_photo035
this.ole_photo036=create ole_photo036
this.ole_photo037=create ole_photo037
this.ole_photo038=create ole_photo038
this.ole_photo039=create ole_photo039
this.em_13=create em_13
this.em_14=create em_14
this.em_15=create em_15
this.em_16=create em_16
this.em_17=create em_17
this.em_18=create em_18
this.em_19=create em_19
this.em_20=create em_20
this.em_21=create em_21
this.em_22=create em_22
this.em_23=create em_23
this.em_24=create em_24
this.r_1=create r_1
this.Control[]={this.em_4,&
this.em_3,&
this.em_2,&
this.em_1,&
this.ole_photo025,&
this.ole_photo022,&
this.ole_photo019,&
this.ole_photo016,&
this.cb_imprimer,&
this.cb_fermer,&
this.cb_annuler,&
this.cb_enregistrer,&
this.cb_precedent,&
this.ole_photo017,&
this.ole_photo020,&
this.ole_photo023,&
this.ole_photo026,&
this.em_5,&
this.em_6,&
this.em_7,&
this.em_8,&
this.ole_photo018,&
this.ole_photo028,&
this.ole_photo029,&
this.ole_photo030,&
this.ole_photo021,&
this.ole_photo024,&
this.ole_photo027,&
this.em_9,&
this.em_10,&
this.em_11,&
this.em_12,&
this.ole_photo031,&
this.ole_photo032,&
this.ole_photo033,&
this.ole_photo034,&
this.ole_photo035,&
this.ole_photo036,&
this.ole_photo037,&
this.ole_photo038,&
this.ole_photo039,&
this.em_13,&
this.em_14,&
this.em_15,&
this.em_16,&
this.em_17,&
this.em_18,&
this.em_19,&
this.em_20,&
this.em_21,&
this.em_22,&
this.em_23,&
this.em_24,&
this.r_1}
end on

on w_diagnos_maj_videau4.destroy
destroy(this.em_4)
destroy(this.em_3)
destroy(this.em_2)
destroy(this.em_1)
destroy(this.ole_photo025)
destroy(this.ole_photo022)
destroy(this.ole_photo019)
destroy(this.ole_photo016)
destroy(this.cb_imprimer)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_precedent)
destroy(this.ole_photo017)
destroy(this.ole_photo020)
destroy(this.ole_photo023)
destroy(this.ole_photo026)
destroy(this.em_5)
destroy(this.em_6)
destroy(this.em_7)
destroy(this.em_8)
destroy(this.ole_photo018)
destroy(this.ole_photo028)
destroy(this.ole_photo029)
destroy(this.ole_photo030)
destroy(this.ole_photo021)
destroy(this.ole_photo024)
destroy(this.ole_photo027)
destroy(this.em_9)
destroy(this.em_10)
destroy(this.em_11)
destroy(this.em_12)
destroy(this.ole_photo031)
destroy(this.ole_photo032)
destroy(this.ole_photo033)
destroy(this.ole_photo034)
destroy(this.ole_photo035)
destroy(this.ole_photo036)
destroy(this.ole_photo037)
destroy(this.ole_photo038)
destroy(this.ole_photo039)
destroy(this.em_13)
destroy(this.em_14)
destroy(this.em_15)
destroy(this.em_16)
destroy(this.em_17)
destroy(this.em_18)
destroy(this.em_19)
destroy(this.em_20)
destroy(this.em_21)
destroy(this.em_22)
destroy(this.em_23)
destroy(this.em_24)
destroy(this.r_1)
end on

type em_4 from editmask within w_diagnos_maj_videau4
integer x = 110
integer y = 1940
integer width = 402
integer height = 80
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_3 from editmask within w_diagnos_maj_videau4
integer x = 110
integer y = 1432
integer width = 402
integer height = 80
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_2 from editmask within w_diagnos_maj_videau4
integer x = 110
integer y = 924
integer width = 402
integer height = 80
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_1 from editmask within w_diagnos_maj_videau4
integer x = 110
integer y = 416
integer width = 402
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type ole_photo025 from gearbox within w_diagnos_maj_videau4
integer x = 32
integer y = 1536
integer width = 576
integer height = 432
boolean vignette = true
end type

on ole_photo025.destroy
call gearbox::destroy
end on

type ole_photo022 from gearbox within w_diagnos_maj_videau4
integer x = 32
integer y = 1028
integer width = 576
integer height = 432
boolean vignette = true
end type

on ole_photo022.destroy
call gearbox::destroy
end on

type ole_photo019 from gearbox within w_diagnos_maj_videau4
integer x = 32
integer y = 520
integer width = 576
integer height = 432
boolean vignette = true
end type

on ole_photo019.destroy
call gearbox::destroy
end on

type ole_photo016 from gearbox within w_diagnos_maj_videau4
integer x = 32
integer y = 12
integer width = 576
integer height = 432
boolean vignette = true
end type

on ole_photo016.destroy
call gearbox::destroy
end on

type cb_imprimer from commandbutton within w_diagnos_maj_videau4
integer x = 1838
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 250
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

type cb_fermer from commandbutton within w_diagnos_maj_videau4
integer x = 3246
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 290
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

type cb_annuler from commandbutton within w_diagnos_maj_videau4
integer x = 2542
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 270
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;init()
end on

type cb_enregistrer from commandbutton within w_diagnos_maj_videau4
integer x = 2894
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 280
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
boolean default = true
end type

event clicked;f.ecrirepage(em_1,page,3310,10)
f.ecrirepage(em_2,page,3320,10)
f.ecrirepage(em_3,page,3330,10)
f.ecrirepage(em_4,page,3340,10)
f.ecrirepage(em_5,page,3350,10)
f.ecrirepage(em_6,page,3360,10)
f.ecrirepage(em_7,page,3370,10)
f.ecrirepage(em_8,page,3380,10)
f.ecrirepage(em_9,page,3390,10)
f.ecrirepage(em_10,page,3400,10)
f.ecrirepage(em_11,page,3410,10)
f.ecrirepage(em_12,page,3420,10)
f.ecrirepage(em_13,page,3430,10)
f.ecrirepage(em_14,page,3440,10)
f.ecrirepage(em_15,page,3450,10)
f.ecrirepage(em_16,page,3460,10)
f.ecrirepage(em_17,page,3470,10)
f.ecrirepage(em_18,page,3480,10)
f.ecrirepage(em_19,page,3490,10)
f.ecrirepage(em_20,page,3500,10)
f.ecrirepage(em_21,page,3510,10)
f.ecrirepage(em_22,page,3520,10)
f.ecrirepage(em_23,page,3530,10)
f.ecrirepage(em_24,page,3540,10)

UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;
COMMIT ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
else
	modif = false
	
	COMMIT ;
end if

end event

type cb_precedent from commandbutton within w_diagnos_maj_videau4
integer x = 2190
integer y = 2096
integer width = 338
integer height = 96
integer taborder = 260
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Précédent"
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		OpenWithParm(w_diagnos_maj_videau3,var_code_local)
		Close(parent)
	end if
else
	OpenWithParm(w_diagnos_maj_videau3,var_code_local)
	close(parent)
end if
end event

type ole_photo017 from gearbox within w_diagnos_maj_videau4
integer x = 622
integer y = 12
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo017.destroy
call gearbox::destroy
end on

type ole_photo020 from gearbox within w_diagnos_maj_videau4
integer x = 622
integer y = 520
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo020.destroy
call gearbox::destroy
end on

type ole_photo023 from gearbox within w_diagnos_maj_videau4
integer x = 622
integer y = 1028
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo023.destroy
call gearbox::destroy
end on

type ole_photo026 from gearbox within w_diagnos_maj_videau4
integer x = 622
integer y = 1536
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo026.destroy
call gearbox::destroy
end on

type em_5 from editmask within w_diagnos_maj_videau4
integer x = 699
integer y = 416
integer width = 402
integer height = 80
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_6 from editmask within w_diagnos_maj_videau4
integer x = 699
integer y = 924
integer width = 402
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_7 from editmask within w_diagnos_maj_videau4
integer x = 699
integer y = 1432
integer width = 402
integer height = 80
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_8 from editmask within w_diagnos_maj_videau4
integer x = 699
integer y = 1940
integer width = 402
integer height = 80
integer taborder = 110
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type ole_photo018 from gearbox within w_diagnos_maj_videau4
integer x = 1211
integer y = 12
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo018.destroy
call gearbox::destroy
end on

type ole_photo028 from gearbox within w_diagnos_maj_videau4
integer x = 1874
integer y = 12
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo028.destroy
call gearbox::destroy
end on

type ole_photo029 from gearbox within w_diagnos_maj_videau4
integer x = 2464
integer y = 12
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo029.destroy
call gearbox::destroy
end on

type ole_photo030 from gearbox within w_diagnos_maj_videau4
integer x = 3054
integer y = 12
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo030.destroy
call gearbox::destroy
end on

type ole_photo021 from gearbox within w_diagnos_maj_videau4
integer x = 1211
integer y = 520
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo021.destroy
call gearbox::destroy
end on

type ole_photo024 from gearbox within w_diagnos_maj_videau4
integer x = 1211
integer y = 1028
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo024.destroy
call gearbox::destroy
end on

type ole_photo027 from gearbox within w_diagnos_maj_videau4
integer x = 1211
integer y = 1536
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo027.destroy
call gearbox::destroy
end on

type em_9 from editmask within w_diagnos_maj_videau4
integer x = 1289
integer y = 416
integer width = 402
integer height = 80
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_10 from editmask within w_diagnos_maj_videau4
integer x = 1289
integer y = 924
integer width = 402
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_11 from editmask within w_diagnos_maj_videau4
integer x = 1289
integer y = 1432
integer width = 402
integer height = 80
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_12 from editmask within w_diagnos_maj_videau4
integer x = 1289
integer y = 1940
integer width = 402
integer height = 80
integer taborder = 120
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type ole_photo031 from gearbox within w_diagnos_maj_videau4
integer x = 1874
integer y = 520
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo031.destroy
call gearbox::destroy
end on

type ole_photo032 from gearbox within w_diagnos_maj_videau4
integer x = 2464
integer y = 520
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo032.destroy
call gearbox::destroy
end on

type ole_photo033 from gearbox within w_diagnos_maj_videau4
integer x = 3054
integer y = 520
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo033.destroy
call gearbox::destroy
end on

type ole_photo034 from gearbox within w_diagnos_maj_videau4
integer x = 1874
integer y = 1028
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo034.destroy
call gearbox::destroy
end on

type ole_photo035 from gearbox within w_diagnos_maj_videau4
integer x = 2464
integer y = 1028
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo035.destroy
call gearbox::destroy
end on

type ole_photo036 from gearbox within w_diagnos_maj_videau4
integer x = 3054
integer y = 1028
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo036.destroy
call gearbox::destroy
end on

type ole_photo037 from gearbox within w_diagnos_maj_videau4
integer x = 1874
integer y = 1536
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo037.destroy
call gearbox::destroy
end on

type ole_photo038 from gearbox within w_diagnos_maj_videau4
integer x = 2464
integer y = 1536
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo038.destroy
call gearbox::destroy
end on

type ole_photo039 from gearbox within w_diagnos_maj_videau4
integer x = 3054
integer y = 1536
integer width = 576
integer height = 432
boolean bringtotop = true
boolean vignette = true
end type

on ole_photo039.destroy
call gearbox::destroy
end on

type em_13 from editmask within w_diagnos_maj_videau4
integer x = 1952
integer y = 420
integer width = 402
integer height = 80
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_14 from editmask within w_diagnos_maj_videau4
integer x = 1952
integer y = 928
integer width = 402
integer height = 80
integer taborder = 160
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_15 from editmask within w_diagnos_maj_videau4
integer x = 1952
integer y = 1436
integer width = 402
integer height = 80
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_16 from editmask within w_diagnos_maj_videau4
integer x = 1952
integer y = 1944
integer width = 402
integer height = 80
integer taborder = 220
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_17 from editmask within w_diagnos_maj_videau4
integer x = 2542
integer y = 420
integer width = 402
integer height = 80
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_18 from editmask within w_diagnos_maj_videau4
integer x = 2542
integer y = 928
integer width = 402
integer height = 80
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_19 from editmask within w_diagnos_maj_videau4
integer x = 2542
integer y = 1436
integer width = 402
integer height = 80
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_20 from editmask within w_diagnos_maj_videau4
integer x = 2542
integer y = 1944
integer width = 402
integer height = 80
integer taborder = 230
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_21 from editmask within w_diagnos_maj_videau4
integer x = 3131
integer y = 420
integer width = 402
integer height = 80
integer taborder = 150
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_22 from editmask within w_diagnos_maj_videau4
integer x = 3131
integer y = 928
integer width = 402
integer height = 80
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_23 from editmask within w_diagnos_maj_videau4
integer x = 3131
integer y = 1436
integer width = 402
integer height = 80
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type em_24 from editmask within w_diagnos_maj_videau4
integer x = 3131
integer y = 1944
integer width = 402
integer height = 80
integer taborder = 240
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;modif = true
end event

type r_1 from rectangle within w_diagnos_maj_videau4
long linecolor = 16711680
integer linethickness = 1
long fillcolor = 16711680
integer x = 1806
integer y = 4
integer width = 41
integer height = 2036
end type

