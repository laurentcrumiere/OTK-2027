$PBExportHeader$w_liste_patient_sterilisation.srw
forward
global type w_liste_patient_sterilisation from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_liste_patient_sterilisation
end type
type cb_autre from uo_picturebutton_390x120 within w_liste_patient_sterilisation
end type
type cb_ecran from uo_picturebutton_390x120 within w_liste_patient_sterilisation
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_patient_sterilisation
end type
type st_3 from statictext within w_liste_patient_sterilisation
end type
type st_2 from statictext within w_liste_patient_sterilisation
end type
type dw_liste from u_basedw within w_liste_patient_sterilisation
end type
type uo_size from resize_fenetre within w_liste_patient_sterilisation
end type
type em_nb from editmask within w_liste_patient_sterilisation
end type
type dw_1 from datawindow within w_liste_patient_sterilisation
end type
type em_date_saisie_min from uo_date_calendrier within w_liste_patient_sterilisation
end type
type em_date_saisie_max from uo_date_calendrier within w_liste_patient_sterilisation
end type
type st_min from statictext within w_liste_patient_sterilisation
end type
type em_min from editmask within w_liste_patient_sterilisation
end type
type st_max from statictext within w_liste_patient_sterilisation
end type
type em_max from editmask within w_liste_patient_sterilisation
end type
type st_1 from statictext within w_liste_patient_sterilisation
end type
type em_date_ste_min from uo_date_calendrier within w_liste_patient_sterilisation
end type
type st_4 from statictext within w_liste_patient_sterilisation
end type
type em_date_ste_max from uo_date_calendrier within w_liste_patient_sterilisation
end type
type st_5 from statictext within w_liste_patient_sterilisation
end type
type sle_code_ste_min from singlelineedit within w_liste_patient_sterilisation
end type
type st_6 from statictext within w_liste_patient_sterilisation
end type
type sle_code_ste_max from singlelineedit within w_liste_patient_sterilisation
end type
type rb_un from radiobutton within w_liste_patient_sterilisation
end type
type rb_tous from radiobutton within w_liste_patient_sterilisation
end type
type dw_prati from datawindow within w_liste_patient_sterilisation
end type
type pb_exporter from uo_picturebutton_390x120 within w_liste_patient_sterilisation
end type
type gb_1 from groupbox within w_liste_patient_sterilisation
end type
type gb_4 from gb_1 within w_liste_patient_sterilisation
end type
type gb_2 from groupbox within w_liste_patient_sterilisation
end type
type gb_3 from groupbox within w_liste_patient_sterilisation
end type
end forward

global type w_liste_patient_sterilisation from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3657
integer height = 1904
string title = "Traçabilité - Recherche de Stérilisation"
windowtype windowtype = child!
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_ecran cb_ecran
cb_fermer cb_fermer
st_3 st_3
st_2 st_2
dw_liste dw_liste
uo_size uo_size
em_nb em_nb
dw_1 dw_1
em_date_saisie_min em_date_saisie_min
em_date_saisie_max em_date_saisie_max
st_min st_min
em_min em_min
st_max st_max
em_max em_max
st_1 st_1
em_date_ste_min em_date_ste_min
st_4 st_4
em_date_ste_max em_date_ste_max
st_5 st_5
sle_code_ste_min sle_code_ste_min
st_6 st_6
sle_code_ste_max sle_code_ste_max
rb_un rb_un
rb_tous rb_tous
dw_prati dw_prati
pb_exporter pb_exporter
gb_1 gb_1
gb_4 gb_4
gb_2 gb_2
gb_3 gb_3
end type
global w_liste_patient_sterilisation w_liste_patient_sterilisation

type variables
boolean prepa_faite
double increment	
double nb_dossier
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
date date_min,date_max
date date_ste_min,date_ste_max
string titre
double code_min, code_max
string code_ste_min, code_ste_max



if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		titre = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		Titre = 'Pour le praticien "'+pra_min+'"'
	end if
	
	code_min = double(em_min.text )
	code_max = double(em_max.text)
	
	date_min = date(em_date_saisie_min.text)
	date_max = date(em_date_saisie_max.text)

	date_ste_min = date(em_date_ste_min.text)
	date_ste_max = date(em_date_ste_max.text)
	
	code_ste_min = sle_code_ste_min.text
	code_ste_max = sle_code_ste_max.text
	
	
	titre = titre + " - Dossier N°"+ em_min.text + " au "+ em_max.text 
	titre = titre + " - Saisie du "+ string(date_min) + " au "+ string(date_max) + char(13)+char(10)+"Stérilisation du "+ string(date_ste_min) + " au "+ string(date_ste_max )
	titre = titre + " - Code  Stérilisation "+ code_ste_min + " à "+ code_ste_max 

	dw_liste.modify("titre.text = '"+titre+"'")
	
	
	open(w_patience)
	dw_liste.retrieve(pra_min,pra_max,code_min, code_max,date_min,date_max, date_ste_min, date_ste_max, code_ste_min, code_ste_max)
	close(w_patience)

end if

end subroutine

on w_liste_patient_sterilisation.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_ecran=create cb_ecran
this.cb_fermer=create cb_fermer
this.st_3=create st_3
this.st_2=create st_2
this.dw_liste=create dw_liste
this.uo_size=create uo_size
this.em_nb=create em_nb
this.dw_1=create dw_1
this.em_date_saisie_min=create em_date_saisie_min
this.em_date_saisie_max=create em_date_saisie_max
this.st_min=create st_min
this.em_min=create em_min
this.st_max=create st_max
this.em_max=create em_max
this.st_1=create st_1
this.em_date_ste_min=create em_date_ste_min
this.st_4=create st_4
this.em_date_ste_max=create em_date_ste_max
this.st_5=create st_5
this.sle_code_ste_min=create sle_code_ste_min
this.st_6=create st_6
this.sle_code_ste_max=create sle_code_ste_max
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.dw_prati=create dw_prati
this.pb_exporter=create pb_exporter
this.gb_1=create gb_1
this.gb_4=create gb_4
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_autre
this.Control[iCurrent+3]=this.cb_ecran
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.dw_liste
this.Control[iCurrent+8]=this.uo_size
this.Control[iCurrent+9]=this.em_nb
this.Control[iCurrent+10]=this.dw_1
this.Control[iCurrent+11]=this.em_date_saisie_min
this.Control[iCurrent+12]=this.em_date_saisie_max
this.Control[iCurrent+13]=this.st_min
this.Control[iCurrent+14]=this.em_min
this.Control[iCurrent+15]=this.st_max
this.Control[iCurrent+16]=this.em_max
this.Control[iCurrent+17]=this.st_1
this.Control[iCurrent+18]=this.em_date_ste_min
this.Control[iCurrent+19]=this.st_4
this.Control[iCurrent+20]=this.em_date_ste_max
this.Control[iCurrent+21]=this.st_5
this.Control[iCurrent+22]=this.sle_code_ste_min
this.Control[iCurrent+23]=this.st_6
this.Control[iCurrent+24]=this.sle_code_ste_max
this.Control[iCurrent+25]=this.rb_un
this.Control[iCurrent+26]=this.rb_tous
this.Control[iCurrent+27]=this.dw_prati
this.Control[iCurrent+28]=this.pb_exporter
this.Control[iCurrent+29]=this.gb_1
this.Control[iCurrent+30]=this.gb_4
this.Control[iCurrent+31]=this.gb_2
this.Control[iCurrent+32]=this.gb_3
end on

on w_liste_patient_sterilisation.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_ecran)
destroy(this.cb_fermer)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_liste)
destroy(this.uo_size)
destroy(this.em_nb)
destroy(this.dw_1)
destroy(this.em_date_saisie_min)
destroy(this.em_date_saisie_max)
destroy(this.st_min)
destroy(this.em_min)
destroy(this.st_max)
destroy(this.em_max)
destroy(this.st_1)
destroy(this.em_date_ste_min)
destroy(this.st_4)
destroy(this.em_date_ste_max)
destroy(this.st_5)
destroy(this.sle_code_ste_min)
destroy(this.st_6)
destroy(this.sle_code_ste_max)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.dw_prati)
destroy(this.pb_exporter)
destroy(this.gb_1)
destroy(this.gb_4)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;double max,max_row, min

open(w_patience)

SELECT min(numero_dossier), max(numero_dossier) INTO :min, :max 
FROM patient WHERE numero_dossier < 100000000 ;

em_max.text = string(max)

  
  SELECT count(*)  
    INTO :max_row  
    FROM "sterilisation"  ;

increment = integer(max_row / 10)


dw_prati.settransobject(SQLCA)
dw_prati.retrieve()

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if


dw_liste.settransobject(SQLCA)

em_date_saisie_min.SetDate(date(year(today()),1,1))
em_date_saisie_max.SetDate(today())

em_date_ste_min.SetDate(date(year(today()),1,1))
em_date_ste_max.SetDate(today())

uo_size.taille(this)
prepa_faite = false
close(w_patience)

end event

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_liste_patient_sterilisation
integer y = 680
end type

type cb_imprimer from uo_picturebutton_390x120 within w_liste_patient_sterilisation
integer x = 1335
integer y = 1636
integer width = 443
integer taborder = 190
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_liste_patient_sterilisation
integer x = 2267
integer y = 1636
integer width = 443
integer taborder = 200
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false
this.enabled ( false)
cb_imprimer.enabled ( false)
cb_ecran.enabled ( true)
dw_liste.visible = false
em_nb.visible = false
pb_exporter.enabled ( false )
end event

type cb_ecran from uo_picturebutton_390x120 within w_liste_patient_sterilisation
integer x = 859
integer y = 1636
integer width = 443
integer taborder = 160
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;prepa()
this.enabled ( false)
cb_imprimer.enabled ( true)
cb_autre.enabled ( true)
dw_liste.visible = true
pb_exporter.enabled ( true )
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_patient_sterilisation
integer x = 2743
integer y = 1636
integer width = 443
integer taborder = 140
end type

type st_3 from statictext within w_liste_patient_sterilisation
integer x = 503
integer y = 700
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_patient_sterilisation
integer x = 1339
integer y = 700
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_liste from u_basedw within w_liste_patient_sterilisation
boolean visible = false
integer y = 8
integer width = 3621
integer height = 1620
integer taborder = 20
string dataobject = "dw_impr_liste_patient_sterilisation"
end type

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
end if
end event

type uo_size from resize_fenetre within w_liste_patient_sterilisation
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 100
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type em_nb from editmask within w_liste_patient_sterilisation
boolean visible = false
integer x = 55
integer y = 1660
integer width = 722
integer height = 100
integer taborder = 110
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXX"
end type

type dw_1 from datawindow within w_liste_patient_sterilisation
boolean visible = false
integer y = 260
integer width = 325
integer height = 668
integer taborder = 130
string dataobject = "dw_impr_liste_produit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event retrieverow;maj_patience(row,increment)
end event

type em_date_saisie_min from uo_date_calendrier within w_liste_patient_sterilisation
integer x = 832
integer y = 692
integer taborder = 40
boolean bringtotop = true
end type

on em_date_saisie_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_saisie_max from uo_date_calendrier within w_liste_patient_sterilisation
integer x = 1664
integer y = 692
integer taborder = 50
boolean bringtotop = true
end type

on em_date_saisie_max.destroy
call uo_date_calendrier::destroy
end on

type st_min from statictext within w_liste_patient_sterilisation
integer x = 334
integer y = 440
integer width = 389
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Du Dossier N°"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_min from editmask within w_liste_patient_sterilisation
integer x = 773
integer y = 428
integer width = 498
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type st_max from statictext within w_liste_patient_sterilisation
integer x = 1321
integer y = 440
integer width = 402
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Au Dossier N°"
alignment alignment = right!
boolean focusrectangle = false
end type

type em_max from editmask within w_liste_patient_sterilisation
integer x = 1797
integer y = 428
integer width = 498
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
boolean spin = true
string displaydata = ""
double increment = 1
end type

type st_1 from statictext within w_liste_patient_sterilisation
integer x = 503
integer y = 992
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type em_date_ste_min from uo_date_calendrier within w_liste_patient_sterilisation
integer x = 832
integer y = 984
integer taborder = 60
boolean bringtotop = true
end type

on em_date_ste_min.destroy
call uo_date_calendrier::destroy
end on

type st_4 from statictext within w_liste_patient_sterilisation
integer x = 1339
integer y = 992
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type em_date_ste_max from uo_date_calendrier within w_liste_patient_sterilisation
integer x = 1664
integer y = 984
integer taborder = 70
boolean bringtotop = true
end type

on em_date_ste_max.destroy
call uo_date_calendrier::destroy
end on

type st_5 from statictext within w_liste_patient_sterilisation
integer x = 517
integer y = 1316
integer width = 151
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Du"
boolean focusrectangle = false
end type

type sle_code_ste_min from singlelineedit within w_liste_patient_sterilisation
integer x = 731
integer y = 1300
integer width = 1477
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_liste_patient_sterilisation
integer x = 517
integer y = 1416
integer width = 151
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Au"
boolean focusrectangle = false
end type

type sle_code_ste_max from singlelineedit within w_liste_patient_sterilisation
integer x = 731
integer y = 1412
integer width = 1477
integer height = 92
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "ZZZZZZZZZZ"
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type rb_un from radiobutton within w_liste_patient_sterilisation
integer x = 453
integer y = 240
integer width = 622
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Un praticien"
end type

event clicked;rb_tous.checked = false
dw_prati.visible = true
end event

type rb_tous from radiobutton within w_liste_patient_sterilisation
integer x = 453
integer y = 144
integer width = 695
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tous les praticiens"
boolean checked = true
end type

event clicked;rb_un.checked = false
dw_prati.visible = false
end event

type dw_prati from datawindow within w_liste_patient_sterilisation
string tag = "position brush"
boolean visible = false
integer x = 1362
integer y = 240
integer width = 859
integer height = 72
integer taborder = 70
boolean bringtotop = true
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type pb_exporter from uo_picturebutton_390x120 within w_liste_patient_sterilisation
integer x = 1810
integer y = 1636
integer width = 425
integer taborder = 200
boolean bringtotop = true
boolean enabled = false
string text = "E&xporter"
boolean default = true
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type gb_1 from groupbox within w_liste_patient_sterilisation
integer x = 283
integer y = 880
integer width = 2121
integer height = 252
integer taborder = 150
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Dates de Stérilisation"
end type

type gb_4 from gb_1 within w_liste_patient_sterilisation
integer y = 592
integer taborder = 180
string text = "Dates de Saisie"
end type

type gb_2 from groupbox within w_liste_patient_sterilisation
integer x = 283
integer y = 1180
integer width = 2121
integer height = 404
integer taborder = 170
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Codes de Stérilisation"
end type

type gb_3 from groupbox within w_liste_patient_sterilisation
integer x = 288
integer y = 64
integer width = 2121
integer height = 304
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Choix du praticien"
end type

