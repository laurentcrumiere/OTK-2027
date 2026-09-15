$PBExportHeader$w_liste_fournisseur_hitparade.srw
forward
global type w_liste_fournisseur_hitparade from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_liste_fournisseur_hitparade
end type
type cb_autre from uo_picturebutton_390x120 within w_liste_fournisseur_hitparade
end type
type cb_ecran from uo_picturebutton_390x120 within w_liste_fournisseur_hitparade
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_fournisseur_hitparade
end type
type st_3 from statictext within w_liste_fournisseur_hitparade
end type
type st_2 from statictext within w_liste_fournisseur_hitparade
end type
type cb_lien_word from commandbutton within w_liste_fournisseur_hitparade
end type
type dw_liste from u_basedw within w_liste_fournisseur_hitparade
end type
type uo_size from resize_fenetre within w_liste_fournisseur_hitparade
end type
type dw_prati from datawindow within w_liste_fournisseur_hitparade
end type
type rb_un from radiobutton within w_liste_fournisseur_hitparade
end type
type rb_tous from radiobutton within w_liste_fournisseur_hitparade
end type
type em_nb from editmask within w_liste_fournisseur_hitparade
end type
type dw_1 from datawindow within w_liste_fournisseur_hitparade
end type
type em_date_min from uo_date_calendrier within w_liste_fournisseur_hitparade
end type
type em_date_max from uo_date_calendrier within w_liste_fournisseur_hitparade
end type
type pb_exporter from uo_picturebutton_390x120 within w_liste_fournisseur_hitparade
end type
type gb_1 from groupbox within w_liste_fournisseur_hitparade
end type
type gb_4 from gb_1 within w_liste_fournisseur_hitparade
end type
end forward

global type w_liste_fournisseur_hitparade from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3657
integer height = 1904
string title = "Hit Parade des Fournisseurs"
windowtype windowtype = child!
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_ecran cb_ecran
cb_fermer cb_fermer
st_3 st_3
st_2 st_2
cb_lien_word cb_lien_word
dw_liste dw_liste
uo_size uo_size
dw_prati dw_prati
rb_un rb_un
rb_tous rb_tous
em_nb em_nb
dw_1 dw_1
em_date_min em_date_min
em_date_max em_date_max
pb_exporter pb_exporter
gb_1 gb_1
gb_4 gb_4
end type
global w_liste_fournisseur_hitparade w_liste_fournisseur_hitparade

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
date date_min2,date_max2
string titre

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
	
	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)
	
	titre = titre + " - du "+ em_date_min.text + " au "+ em_date_max.text
	dw_liste.modify("titre.text = '"+titre+"'")
	
	// idem pour n-1
	date_min2 = date(year(date_min) -1, month(date_min), day(date_min))
	date_max2 = date(year(date_max) -1, month(date_max), day(date_max))
	
	open(w_patience)
	dw_liste.retrieve(pra_min,pra_max,date_min,date_max, date_min2, date_max2)
	close(w_patience)

end if

end subroutine

on w_liste_fournisseur_hitparade.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_ecran=create cb_ecran
this.cb_fermer=create cb_fermer
this.st_3=create st_3
this.st_2=create st_2
this.cb_lien_word=create cb_lien_word
this.dw_liste=create dw_liste
this.uo_size=create uo_size
this.dw_prati=create dw_prati
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.em_nb=create em_nb
this.dw_1=create dw_1
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.pb_exporter=create pb_exporter
this.gb_1=create gb_1
this.gb_4=create gb_4
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_autre
this.Control[iCurrent+3]=this.cb_ecran
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.cb_lien_word
this.Control[iCurrent+8]=this.dw_liste
this.Control[iCurrent+9]=this.uo_size
this.Control[iCurrent+10]=this.dw_prati
this.Control[iCurrent+11]=this.rb_un
this.Control[iCurrent+12]=this.rb_tous
this.Control[iCurrent+13]=this.em_nb
this.Control[iCurrent+14]=this.dw_1
this.Control[iCurrent+15]=this.em_date_min
this.Control[iCurrent+16]=this.em_date_max
this.Control[iCurrent+17]=this.pb_exporter
this.Control[iCurrent+18]=this.gb_1
this.Control[iCurrent+19]=this.gb_4
end on

on w_liste_fournisseur_hitparade.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_ecran)
destroy(this.cb_fermer)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.cb_lien_word)
destroy(this.dw_liste)
destroy(this.uo_size)
destroy(this.dw_prati)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.em_nb)
destroy(this.dw_1)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.pb_exporter)
destroy(this.gb_1)
destroy(this.gb_4)
end on

event open;call super::open;double max,max_row
open(w_patience)

//insertion de "O" ds la table "table_vide"-->column "v1"
UPDATE table_vide SET v1='O' WHERE cle = 1;
commit;

  SELECT count(*)  
    INTO :max_row  
    FROM "historique_es"  ;

increment = integer(max_row / 10)

dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)


dw_prati.retrieve()

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
else
	dw_prati.visible = false
end if

em_date_min.SetDate(date(year(today()),1,1))
em_date_max.SetDate(today())

uo_size.taille(this)
prepa_faite = false
close(w_patience)

end event

event resize;uo_size.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_liste_fournisseur_hitparade
end type

type cb_imprimer from uo_picturebutton_390x120 within w_liste_fournisseur_hitparade
integer x = 1335
integer y = 1636
integer width = 443
integer taborder = 110
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_liste_fournisseur_hitparade
integer x = 2267
integer y = 1636
integer width = 443
integer taborder = 110
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false
this.enabled ( false)
cb_imprimer.enabled( false)
cb_ecran.enabled ( true )
dw_liste.visible = false
em_nb.visible = false
pb_exporter.enabled ( false)

end event

type cb_ecran from uo_picturebutton_390x120 within w_liste_fournisseur_hitparade
integer x = 859
integer y = 1636
integer width = 443
integer taborder = 60
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;prepa()
//this.enabled ( false)
cb_imprimer.enabled ( true)
cb_autre.enabled ( true)
dw_liste.visible = true
pb_exporter.enabled ( true )

end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_fournisseur_hitparade
integer x = 2743
integer y = 1636
integer width = 443
integer taborder = 50
end type

type st_3 from statictext within w_liste_fournisseur_hitparade
integer x = 503
integer y = 780
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

type st_2 from statictext within w_liste_fournisseur_hitparade
integer x = 1339
integer y = 780
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

type cb_lien_word from commandbutton within w_liste_fournisseur_hitparade
boolean visible = false
integer x = 2711
integer y = 1660
integer width = 585
integer height = 128
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Impression WORD"
end type

type dw_liste from u_basedw within w_liste_fournisseur_hitparade
boolean visible = false
integer y = 8
integer width = 3621
integer height = 1620
integer taborder = 30
string dataobject = "dw_impr_liste_fournisseur_hitparade"
end type

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
end if
end event

type uo_size from resize_fenetre within w_liste_fournisseur_hitparade
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 30
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type dw_prati from datawindow within w_liste_fournisseur_hitparade
string tag = "no resizeall brush"
integer x = 1166
integer y = 328
integer width = 869
integer height = 80
integer taborder = 60
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type rb_un from radiobutton within w_liste_fournisseur_hitparade
integer x = 448
integer y = 324
integer width = 622
integer height = 80
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

type rb_tous from radiobutton within w_liste_fournisseur_hitparade
integer x = 448
integer y = 228
integer width = 695
integer height = 80
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

type em_nb from editmask within w_liste_fournisseur_hitparade
boolean visible = false
integer x = 55
integer y = 1660
integer width = 722
integer height = 100
integer taborder = 30
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

type dw_1 from datawindow within w_liste_fournisseur_hitparade
boolean visible = false
integer y = 260
integer width = 325
integer height = 668
integer taborder = 40
string dataobject = "dw_impr_liste_produit"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event retrieverow;maj_patience(row,increment)
end event

type em_date_min from uo_date_calendrier within w_liste_fournisseur_hitparade
integer x = 832
integer y = 772
integer taborder = 250
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_fournisseur_hitparade
integer x = 1664
integer y = 772
integer taborder = 260
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type pb_exporter from uo_picturebutton_390x120 within w_liste_fournisseur_hitparade
integer x = 1810
integer y = 1636
integer width = 425
integer taborder = 110
boolean bringtotop = true
boolean enabled = false
string text = "E&xporter"
boolean default = true
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type gb_1 from groupbox within w_liste_fournisseur_hitparade
integer x = 283
integer y = 148
integer width = 2121
integer height = 304
integer taborder = 50
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

type gb_4 from gb_1 within w_liste_fournisseur_hitparade
integer y = 640
integer height = 332
integer taborder = 70
string text = "Hit Parade des Fournisseurs"
end type

