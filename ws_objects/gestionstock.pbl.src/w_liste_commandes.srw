$PBExportHeader$w_liste_commandes.srw
forward
global type w_liste_commandes from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_liste_commandes
end type
type cb_autre from uo_picturebutton_390x120 within w_liste_commandes
end type
type cb_ecran from uo_picturebutton_390x120 within w_liste_commandes
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_commandes
end type
type st_3 from statictext within w_liste_commandes
end type
type st_2 from statictext within w_liste_commandes
end type
type dw_liste from u_basedw within w_liste_commandes
end type
type uo_size from resize_fenetre within w_liste_commandes
end type
type dw_prati from datawindow within w_liste_commandes
end type
type rb_un from radiobutton within w_liste_commandes
end type
type rb_tous from radiobutton within w_liste_commandes
end type
type em_nb from editmask within w_liste_commandes
end type
type dw_1 from datawindow within w_liste_commandes
end type
type em_date_min from uo_date_calendrier within w_liste_commandes
end type
type em_date_max from uo_date_calendrier within w_liste_commandes
end type
type rb_tous_fournisseurs from radiobutton within w_liste_commandes
end type
type rb_un_fournisseur from radiobutton within w_liste_commandes
end type
type dw_fournisseur from datawindow within w_liste_commandes
end type
type rb_toutes_qualites from radiobutton within w_liste_commandes
end type
type rb_une_qualite from radiobutton within w_liste_commandes
end type
type ddlb_qualite from dropdownlistbox within w_liste_commandes
end type
type rb_tous_delais from radiobutton within w_liste_commandes
end type
type rb_un_delai from radiobutton within w_liste_commandes
end type
type ddlb_delais from dropdownlistbox within w_liste_commandes
end type
type rb_toutes_reactivites from radiobutton within w_liste_commandes
end type
type rb_une_reactivite from radiobutton within w_liste_commandes
end type
type ddlb_reactivite from dropdownlistbox within w_liste_commandes
end type
type pb_exporter from uo_picturebutton_390x120 within w_liste_commandes
end type
type gb_1 from groupbox within w_liste_commandes
end type
type gb_4 from gb_1 within w_liste_commandes
end type
type gb_2 from groupbox within w_liste_commandes
end type
type gb_3 from gb_1 within w_liste_commandes
end type
type gb_5 from gb_1 within w_liste_commandes
end type
type gb_6 from gb_1 within w_liste_commandes
end type
end forward

global type w_liste_commandes from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 3657
integer height = 1904
string title = "Liste des Commandes"
windowtype windowtype = child!
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_ecran cb_ecran
cb_fermer cb_fermer
st_3 st_3
st_2 st_2
dw_liste dw_liste
uo_size uo_size
dw_prati dw_prati
rb_un rb_un
rb_tous rb_tous
em_nb em_nb
dw_1 dw_1
em_date_min em_date_min
em_date_max em_date_max
rb_tous_fournisseurs rb_tous_fournisseurs
rb_un_fournisseur rb_un_fournisseur
dw_fournisseur dw_fournisseur
rb_toutes_qualites rb_toutes_qualites
rb_une_qualite rb_une_qualite
ddlb_qualite ddlb_qualite
rb_tous_delais rb_tous_delais
rb_un_delai rb_un_delai
ddlb_delais ddlb_delais
rb_toutes_reactivites rb_toutes_reactivites
rb_une_reactivite rb_une_reactivite
ddlb_reactivite ddlb_reactivite
pb_exporter pb_exporter
gb_1 gb_1
gb_4 gb_4
gb_2 gb_2
gb_3 gb_3
gb_5 gb_5
gb_6 gb_6
end type
global w_liste_commandes w_liste_commandes

type variables
boolean prepa_faite
double increment	
double nb_dossier
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
string fou_min,fou_max
date date_min,date_max
string v_nom_fournisseur
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
	
	
	if rb_tous_fournisseurs.checked then
		fou_min="      "
		fou_max="ZZZZZZ"
		titre = titre + " - Pour tous les fournisseurs"
	else
		fou_min=dw_fournisseur.getitemstring(dw_fournisseur.getrow(),"code")
		fou_max=dw_fournisseur.getitemstring(dw_fournisseur.getrow(),"code")
		select fournisseur.nom into :v_nom_fournisseur from fournisseur where code = :fou_min ;
		Titre = titre + ' - Pour le fournisseur "'+v_nom_fournisseur+'"'
	end if
	
	titre = titre + " - du "+ em_date_min.text + " au "+ em_date_max.text
	dw_liste.modify("titre.text = '"+titre+"'")

	
	open(w_patience)
	dw_liste.retrieve(pra_min,pra_max,date_min,date_max, fou_min, fou_max)
	
	
	// Application des filtres en fonction des choix
	string filtre = ""
	string valeur_qualite, valeur_delai , valeur_reactivite
	
	if rb_une_qualite.checked then
		valeur_qualite = string(ddlb_qualite.FindItem(ddlb_qualite.text, 0 ) - 1)
		filtre = "commande_controle_qualite = '"+string(valeur_qualite)+"'"
	end if
	if rb_un_delai.checked then
		valeur_delai = string(ddlb_delais.FindItem(ddlb_delais.text, 0 ) - 1)
		if len(trim(filtre)) > 0 then
			filtre = filtre + " and "
		end if
		filtre = "commande_controle_delais = '"+string(valeur_delai)+"'"
	end if
	if rb_une_reactivite.checked then
		valeur_reactivite = string(ddlb_reactivite.FindItem(ddlb_reactivite.text, 0 ) - 1)
		if len(trim(filtre)) > 0 then
			filtre = filtre + " and "
		end if
		filtre = "commande_controle_reactivite = '"+string(valeur_reactivite)+"'"
	end if
	
	dw_liste.setfilter(filtre)
	dw_liste.filter()
	
	close(w_patience)

end if

end subroutine

on w_liste_commandes.create
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
this.dw_prati=create dw_prati
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.em_nb=create em_nb
this.dw_1=create dw_1
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.rb_tous_fournisseurs=create rb_tous_fournisseurs
this.rb_un_fournisseur=create rb_un_fournisseur
this.dw_fournisseur=create dw_fournisseur
this.rb_toutes_qualites=create rb_toutes_qualites
this.rb_une_qualite=create rb_une_qualite
this.ddlb_qualite=create ddlb_qualite
this.rb_tous_delais=create rb_tous_delais
this.rb_un_delai=create rb_un_delai
this.ddlb_delais=create ddlb_delais
this.rb_toutes_reactivites=create rb_toutes_reactivites
this.rb_une_reactivite=create rb_une_reactivite
this.ddlb_reactivite=create ddlb_reactivite
this.pb_exporter=create pb_exporter
this.gb_1=create gb_1
this.gb_4=create gb_4
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_5=create gb_5
this.gb_6=create gb_6
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_autre
this.Control[iCurrent+3]=this.cb_ecran
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.dw_liste
this.Control[iCurrent+8]=this.uo_size
this.Control[iCurrent+9]=this.dw_prati
this.Control[iCurrent+10]=this.rb_un
this.Control[iCurrent+11]=this.rb_tous
this.Control[iCurrent+12]=this.em_nb
this.Control[iCurrent+13]=this.dw_1
this.Control[iCurrent+14]=this.em_date_min
this.Control[iCurrent+15]=this.em_date_max
this.Control[iCurrent+16]=this.rb_tous_fournisseurs
this.Control[iCurrent+17]=this.rb_un_fournisseur
this.Control[iCurrent+18]=this.dw_fournisseur
this.Control[iCurrent+19]=this.rb_toutes_qualites
this.Control[iCurrent+20]=this.rb_une_qualite
this.Control[iCurrent+21]=this.ddlb_qualite
this.Control[iCurrent+22]=this.rb_tous_delais
this.Control[iCurrent+23]=this.rb_un_delai
this.Control[iCurrent+24]=this.ddlb_delais
this.Control[iCurrent+25]=this.rb_toutes_reactivites
this.Control[iCurrent+26]=this.rb_une_reactivite
this.Control[iCurrent+27]=this.ddlb_reactivite
this.Control[iCurrent+28]=this.pb_exporter
this.Control[iCurrent+29]=this.gb_1
this.Control[iCurrent+30]=this.gb_4
this.Control[iCurrent+31]=this.gb_2
this.Control[iCurrent+32]=this.gb_3
this.Control[iCurrent+33]=this.gb_5
this.Control[iCurrent+34]=this.gb_6
end on

on w_liste_commandes.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_ecran)
destroy(this.cb_fermer)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.dw_liste)
destroy(this.uo_size)
destroy(this.dw_prati)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.em_nb)
destroy(this.dw_1)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.rb_tous_fournisseurs)
destroy(this.rb_un_fournisseur)
destroy(this.dw_fournisseur)
destroy(this.rb_toutes_qualites)
destroy(this.rb_une_qualite)
destroy(this.ddlb_qualite)
destroy(this.rb_tous_delais)
destroy(this.rb_un_delai)
destroy(this.ddlb_delais)
destroy(this.rb_toutes_reactivites)
destroy(this.rb_une_reactivite)
destroy(this.ddlb_reactivite)
destroy(this.pb_exporter)
destroy(this.gb_1)
destroy(this.gb_4)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_5)
destroy(this.gb_6)
end on

event open;call super::open;double max,max_row
open(w_patience)

dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_fournisseur.settransobject(SQLCA)

dw_prati.retrieve()
dw_fournisseur.retrieve()


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

type p_fond from w_fenetre_arakis`p_fond within w_liste_commandes
integer y = 844
end type

type cb_imprimer from uo_picturebutton_390x120 within w_liste_commandes
integer x = 1344
integer y = 1636
integer width = 448
integer taborder = 110
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_liste_commandes
integer x = 2290
integer y = 1636
integer width = 448
integer taborder = 110
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

type cb_ecran from uo_picturebutton_390x120 within w_liste_commandes
integer x = 859
integer y = 1636
integer width = 448
integer taborder = 60
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

type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_commandes
integer x = 2775
integer y = 1636
integer width = 448
integer taborder = 50
end type

event clicked;fermer_fenetre(parent)
end event

type st_3 from statictext within w_liste_commandes
integer x = 503
integer y = 864
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

type st_2 from statictext within w_liste_commandes
integer x = 1303
integer y = 864
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

type dw_liste from u_basedw within w_liste_commandes
boolean visible = false
integer y = 8
integer width = 3621
integer height = 1620
integer taborder = 30
string dataobject = "dw_impr_liste_commandes"
end type

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
end if
end event

type uo_size from resize_fenetre within w_liste_commandes
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 30
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type dw_prati from datawindow within w_liste_commandes
string tag = "no resizeall brush"
integer x = 1198
integer y = 216
integer width = 873
integer height = 80
integer taborder = 60
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type rb_un from radiobutton within w_liste_commandes
integer x = 448
integer y = 212
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

type rb_tous from radiobutton within w_liste_commandes
integer x = 448
integer y = 116
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

type em_nb from editmask within w_liste_commandes
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

type dw_1 from datawindow within w_liste_commandes
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

type em_date_min from uo_date_calendrier within w_liste_commandes
integer x = 832
integer y = 856
integer taborder = 250
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_commandes
integer x = 1664
integer y = 856
integer taborder = 260
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_tous_fournisseurs from radiobutton within w_liste_commandes
integer x = 448
integer y = 484
integer width = 763
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tous les fournisseurs"
boolean checked = true
end type

event clicked;dw_fournisseur.visible = false

end event

type rb_un_fournisseur from radiobutton within w_liste_commandes
integer x = 448
integer y = 572
integer width = 727
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Un fournisseur"
end type

event clicked;dw_fournisseur.visible = true

end event

type dw_fournisseur from datawindow within w_liste_commandes
string tag = "no resizeall brush"
boolean visible = false
integer x = 1198
integer y = 568
integer width = 658
integer height = 76
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_fournisseur_affich_ddlb"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type rb_toutes_qualites from radiobutton within w_liste_commandes
integer x = 105
integer y = 1196
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Toutes"
boolean checked = true
end type

event clicked;ddlb_qualite.visible = false
end event

type rb_une_qualite from radiobutton within w_liste_commandes
integer x = 105
integer y = 1320
integer width = 251
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Une"
end type

event clicked;ddlb_qualite.visible = true
end event

type ddlb_qualite from dropdownlistbox within w_liste_commandes
boolean visible = false
integer x = 366
integer y = 1320
integer width = 731
integer height = 456
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {" (0)","Très Insuffisant (1)","Insuffisant (2)","Passable (3)","Satisfaisant (4)","Très Satisfaisant (5)"}
borderstyle borderstyle = stylelowered!
end type

type rb_tous_delais from radiobutton within w_liste_commandes
integer x = 1285
integer y = 1196
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tous"
boolean checked = true
end type

event clicked;

ddlb_delais.visible = false
end event

type rb_un_delai from radiobutton within w_liste_commandes
integer x = 1285
integer y = 1320
integer width = 215
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Un"
end type

event clicked;

ddlb_delais.visible = true
end event

type ddlb_delais from dropdownlistbox within w_liste_commandes
boolean visible = false
integer x = 1518
integer y = 1320
integer width = 731
integer height = 456
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {" (0)","Très Insuffisant (1)","Insuffisant (2)","Passable (3)","Satisfaisant (4)","Très Satisfaisant (5)"}
borderstyle borderstyle = stylelowered!
end type

type rb_toutes_reactivites from radiobutton within w_liste_commandes
integer x = 2423
integer y = 1196
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Toutes"
boolean checked = true
end type

event clicked;

ddlb_reactivite.visible = false
end event

type rb_une_reactivite from radiobutton within w_liste_commandes
integer x = 2423
integer y = 1320
integer width = 251
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Une"
end type

event clicked;

ddlb_reactivite.visible = true
end event

type ddlb_reactivite from dropdownlistbox within w_liste_commandes
boolean visible = false
integer x = 2688
integer y = 1320
integer width = 731
integer height = 456
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
string item[] = {" (0)","Très Insuffisant (1)","Insuffisant (2)","Passable (3)","Satisfaisant (4)","Très Satisfaisant (5)"}
borderstyle borderstyle = stylelowered!
end type

type pb_exporter from uo_picturebutton_390x120 within w_liste_commandes
integer x = 1829
integer y = 1636
integer width = 425
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string text = "E&xporter"
boolean default = true
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type gb_1 from groupbox within w_liste_commandes
integer x = 283
integer y = 36
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

type gb_4 from gb_1 within w_liste_commandes
integer y = 724
integer height = 332
integer taborder = 70
string text = "Dates de commande"
end type

type gb_2 from groupbox within w_liste_commandes
integer x = 288
integer y = 392
integer width = 2121
integer height = 304
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Choix du fournisseur"
end type

type gb_3 from gb_1 within w_liste_commandes
integer x = 59
integer y = 1096
integer width = 1102
integer height = 388
integer taborder = 80
string text = "Qualité"
end type

type gb_5 from gb_1 within w_liste_commandes
integer x = 1216
integer y = 1096
integer width = 1102
integer height = 388
integer taborder = 90
string text = "Délais"
end type

type gb_6 from gb_1 within w_liste_commandes
integer x = 2373
integer y = 1096
integer width = 1102
integer height = 388
integer taborder = 100
string text = "Réactivité"
end type

