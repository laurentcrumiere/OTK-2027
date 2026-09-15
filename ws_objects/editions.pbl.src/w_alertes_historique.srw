$PBExportHeader$w_alertes_historique.srw
forward
global type w_alertes_historique from w_fenetre_arakis
end type
type rb_1 from radiobutton within w_alertes_historique
end type
type dw_user from datawindow within w_alertes_historique
end type
type rb_tous_users from radiobutton within w_alertes_historique
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_alertes_historique
end type
type cb_imprimer from uo_picturebutton_390x120 within w_alertes_historique
end type
type cb_autre from uo_picturebutton_390x120 within w_alertes_historique
end type
type cb_ecran from uo_picturebutton_390x120 within w_alertes_historique
end type
type uo_1 from resize_fenetre within w_alertes_historique
end type
type st_2 from statictext within w_alertes_historique
end type
type st_1 from statictext within w_alertes_historique
end type
type em_max from editmask within w_alertes_historique
end type
type em_min from editmask within w_alertes_historique
end type
type rb_tous_codes from radiobutton within w_alertes_historique
end type
type rb_un_code from radiobutton within w_alertes_historique
end type
type dw_type_alerte from datawindow within w_alertes_historique
end type
type sle_pat from singlelineedit within w_alertes_historique
end type
type rb_tous_pat from radiobutton within w_alertes_historique
end type
type rb_un_pat from radiobutton within w_alertes_historique
end type
type dw_prati from datawindow within w_alertes_historique
end type
type rb_un from radiobutton within w_alertes_historique
end type
type rb_tous from radiobutton within w_alertes_historique
end type
type em_nb from editmask within w_alertes_historique
end type
type gb_4 from groupbox within w_alertes_historique
end type
type gb_3 from groupbox within w_alertes_historique
end type
type gb_2 from groupbox within w_alertes_historique
end type
type gb_1 from groupbox within w_alertes_historique
end type
type dw_liste from u_basedw within w_alertes_historique
end type
type cbx_filtre from u_cst_togglebutton within w_alertes_historique
end type
type gb_5 from groupbox within w_alertes_historique
end type
end forward

global type w_alertes_historique from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 4215
integer height = 2272
string title = "Historique des Alertes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = child!
long backcolor = 15780518
rb_1 rb_1
dw_user dw_user
rb_tous_users rb_tous_users
cb_fermer cb_fermer
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_ecran cb_ecran
uo_1 uo_1
st_2 st_2
st_1 st_1
em_max em_max
em_min em_min
rb_tous_codes rb_tous_codes
rb_un_code rb_un_code
dw_type_alerte dw_type_alerte
sle_pat sle_pat
rb_tous_pat rb_tous_pat
rb_un_pat rb_un_pat
dw_prati dw_prati
rb_un rb_un
rb_tous rb_tous
em_nb em_nb
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
dw_liste dw_liste
cbx_filtre cbx_filtre
gb_5 gb_5
end type
global w_alertes_historique w_alertes_historique

type variables
boolean prepa_faite
double nb_dossier,increment,var_code_local, var_numero_dossier_local




n_cst_PowerFilter iu_PowerFilter
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
double typ_min,typ_max
string tit1,tit2,n, user_min, user_max
double code_min,code_max
datetime da_min,da_max

//if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit1 = "Analyse pour tous les praticiens - "
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	  SELECT "nom"  INTO :n FROM "prati"  
   	WHERE ( "prati"."code" = :pra_min ) ;
		tit1 = "Analyse pour le Dr : "+n+" - "
	end if
	if rb_tous_pat.checked then
		code_min = -99999999
		code_max = 999999999
		tit1 = tit1+"Pour tous les patients"
	else
		code_min = var_numero_dossier_local
		code_max = var_numero_dossier_local
		tit1 = tit1+"Pour le patient : "+sle_pat.text
	end if
	if rb_tous_codes.checked then
		typ_min=0
		typ_max=99999999999
		tit2 = "Pour tous les types d'édition/action - "
	else
		typ_min=dw_type_alerte.getitemnumber(dw_type_alerte.getrow(),"code")
		typ_max=dw_type_alerte.getitemnumber(dw_type_alerte.getrow(),"code")

	  	SELECT "nom"  INTO :n FROM "alertes"   	WHERE ( "code" = :typ_min ) ;

		tit2 = "Pour l'alerte : "+n+" - "
	end if


	if rb_tous_users.checked then
		user_min="      "
		user_max="ZZZZZZ"
		tit2 = tit2  + "Pour tous utilisateurs - "
	else
		user_min=dw_user.getitemstring(dw_user.getrow(),"code")
		user_max= user_min
	  SELECT "nom"  INTO :n FROM "utilisateurs"      	WHERE ( "code" = :user_min ) ;

		tit2 = tit2 +  "Pour : "+n+" - "
	end if



	da_min = datetime(date(left(em_min.text,10)),time(right(em_min.text,5)))
	da_max = datetime(date(left(em_max.text,10)),time(right(em_max.text,5)))

	tit2 = tit2 +"Du "+em_min.text+" au "+em_max.text
	
	double max_row
	SELECT count(*) INTO :max_row FROM historique_editions ;

	increment = integer(max_row / 10)

	open(w_patience)
	dw_liste.object.Titre1.text = tit1
	dw_liste.object.Titre2.text = tit2

	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,typ_min,typ_max,da_min,da_max, user_min, user_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Editions/Actions"
	//em_nb.visible = true
//end if

end subroutine

event open;call super::open;
dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_prati.retrieve()
dw_type_alerte.settransobject(SQLCA)
dw_type_alerte.retrieve()
dw_user.settransobject(SQLCA)
dw_user.retrieve()

em_min.text = string(today())
em_max.text = string(datetime(today(),time('23:59')))


if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
end if

uo_1.taille(this)
cbx_filtre.backcolor = this.backcolor


end event

on w_alertes_historique.create
int iCurrent
call super::create
this.rb_1=create rb_1
this.dw_user=create dw_user
this.rb_tous_users=create rb_tous_users
this.cb_fermer=create cb_fermer
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_ecran=create cb_ecran
this.uo_1=create uo_1
this.st_2=create st_2
this.st_1=create st_1
this.em_max=create em_max
this.em_min=create em_min
this.rb_tous_codes=create rb_tous_codes
this.rb_un_code=create rb_un_code
this.dw_type_alerte=create dw_type_alerte
this.sle_pat=create sle_pat
this.rb_tous_pat=create rb_tous_pat
this.rb_un_pat=create rb_un_pat
this.dw_prati=create dw_prati
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.em_nb=create em_nb
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.dw_liste=create dw_liste
this.cbx_filtre=create cbx_filtre
this.gb_5=create gb_5
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_1
this.Control[iCurrent+2]=this.dw_user
this.Control[iCurrent+3]=this.rb_tous_users
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.cb_imprimer
this.Control[iCurrent+6]=this.cb_autre
this.Control[iCurrent+7]=this.cb_ecran
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.st_1
this.Control[iCurrent+11]=this.em_max
this.Control[iCurrent+12]=this.em_min
this.Control[iCurrent+13]=this.rb_tous_codes
this.Control[iCurrent+14]=this.rb_un_code
this.Control[iCurrent+15]=this.dw_type_alerte
this.Control[iCurrent+16]=this.sle_pat
this.Control[iCurrent+17]=this.rb_tous_pat
this.Control[iCurrent+18]=this.rb_un_pat
this.Control[iCurrent+19]=this.dw_prati
this.Control[iCurrent+20]=this.rb_un
this.Control[iCurrent+21]=this.rb_tous
this.Control[iCurrent+22]=this.em_nb
this.Control[iCurrent+23]=this.gb_4
this.Control[iCurrent+24]=this.gb_3
this.Control[iCurrent+25]=this.gb_2
this.Control[iCurrent+26]=this.gb_1
this.Control[iCurrent+27]=this.dw_liste
this.Control[iCurrent+28]=this.cbx_filtre
this.Control[iCurrent+29]=this.gb_5
end on

on w_alertes_historique.destroy
call super::destroy
destroy(this.rb_1)
destroy(this.dw_user)
destroy(this.rb_tous_users)
destroy(this.cb_fermer)
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_ecran)
destroy(this.uo_1)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.em_max)
destroy(this.em_min)
destroy(this.rb_tous_codes)
destroy(this.rb_un_code)
destroy(this.dw_type_alerte)
destroy(this.sle_pat)
destroy(this.rb_tous_pat)
destroy(this.rb_un_pat)
destroy(this.dw_prati)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.em_nb)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.dw_liste)
destroy(this.cbx_filtre)
destroy(this.gb_5)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_alertes_historique
end type

type rb_1 from radiobutton within w_alertes_historique
integer x = 375
integer y = 1416
integer width = 617
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un utilisateur"
end type

event clicked;dw_user.visible = true
end event

type dw_user from datawindow within w_alertes_historique
string tag = "no resizeall"
boolean visible = false
integer x = 1111
integer y = 1416
integer width = 1193
integer height = 76
integer taborder = 30
string title = "none"
string dataobject = "dw_cherche_utilisateur"
boolean border = false
boolean livescroll = true
end type

type rb_tous_users from radiobutton within w_alertes_historique
integer x = 375
integer y = 1320
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les utilisateurs"
boolean checked = true
end type

event clicked;dw_user.visible = false
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_alertes_historique
integer x = 2697
integer y = 1996
integer width = 475
integer taborder = 90
end type

event clicked;fermer_fenetre(parent)
end event

type cb_imprimer from uo_picturebutton_390x120 within w_alertes_historique
integer x = 2199
integer y = 1996
integer width = 475
integer taborder = 80
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()


end event

type cb_autre from uo_picturebutton_390x120 within w_alertes_historique
integer x = 1701
integer y = 1996
integer width = 475
integer taborder = 80
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false
em_nb.visible = false
cb_ecran.enabled (true)
cb_imprimer.enabled ( false)
this.enabled ( false)
dw_liste.visible = false
cbx_filtre.visible = false
end event

type cb_ecran from uo_picturebutton_390x120 within w_alertes_historique
integer x = 1202
integer y = 1996
integer width = 475
integer taborder = 60
string text = "&Ecran"
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;prepa()
//cb_ecran.enabled (false)
cb_imprimer.enabled ( true)
cb_autre.enabled ( true)
dw_liste.visible = true
cbx_filtre.visible = true

end event

type uo_1 from resize_fenetre within w_alertes_historique
boolean visible = false
integer x = 2597
integer y = 144
integer taborder = 11
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type st_2 from statictext within w_alertes_historique
integer x = 1458
integer y = 1716
integer width = 101
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Au"
boolean focusrectangle = false
end type

type st_1 from statictext within w_alertes_historique
integer x = 512
integer y = 1716
integer width = 101
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Du"
boolean focusrectangle = false
end type

type em_max from editmask within w_alertes_historique
integer x = 1582
integer y = 1704
integer width = 640
integer height = 100
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy à hh:mm"
boolean spin = true
string displaydata = "|"
end type

type em_min from editmask within w_alertes_historique
integer x = 631
integer y = 1704
integer width = 640
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy à hh:mm"
boolean spin = true
string displaydata = "~b"
end type

type rb_tous_codes from radiobutton within w_alertes_historique
event clicked pbm_bnclicked
integer x = 361
integer y = 968
integer width = 1417
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Toutes les Alertes"
boolean checked = true
end type

event clicked;dw_type_alerte.visible = false
end event

type rb_un_code from radiobutton within w_alertes_historique
event clicked pbm_bnclicked
integer x = 361
integer y = 1064
integer width = 741
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Une Alerte"
end type

event clicked;dw_type_alerte.visible = true
end event

type dw_type_alerte from datawindow within w_alertes_historique
string tag = "no resizeall"
boolean visible = false
integer x = 1120
integer y = 1064
integer width = 1161
integer height = 80
integer taborder = 20
string dataobject = "dw_cherche_alerte"
boolean border = false
end type

type sle_pat from singlelineedit within w_alertes_historique
boolean visible = false
integer x = 992
integer y = 684
integer width = 1303
integer height = 88
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217731
boolean enabled = false
boolean autohscroll = false
end type

type rb_tous_pat from radiobutton within w_alertes_historique
event clicked pbm_bnclicked
integer x = 361
integer y = 588
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les patients"
boolean checked = true
end type

event clicked;sle_pat.visible = false
end event

type rb_un_pat from radiobutton within w_alertes_historique
event clicked pbm_bnclicked
integer x = 361
integer y = 684
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un patient"
end type

event clicked;var_suite = false

open (w_cherche)

if var_suite then
	sle_pat.text = var_nom
	var_code_local = var_code
	var_numero_dossier_local = var_numero_dossier
	sle_pat.visible = true
else
	this.checked = false
	rb_tous_pat.checked = true
end if
end event

type dw_prati from datawindow within w_alertes_historique
string tag = "no resizeall"
boolean visible = false
integer x = 1216
integer y = 300
integer width = 873
integer height = 80
integer taborder = 10
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type rb_un from radiobutton within w_alertes_historique
integer x = 361
integer y = 288
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

on clicked;rb_tous.checked = false
dw_prati.visible = true
end on

type rb_tous from radiobutton within w_alertes_historique
integer x = 361
integer y = 192
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
boolean checked = true
end type

on clicked;rb_un.checked = false
dw_prati.visible = false
end on

type em_nb from editmask within w_alertes_historique
boolean visible = false
integer x = 55
integer y = 2020
integer width = 905
integer height = 100
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

type gb_4 from groupbox within w_alertes_historique
integer x = 283
integer y = 1632
integer width = 2121
integer height = 196
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Période"
end type

type gb_3 from groupbox within w_alertes_historique
integer x = 283
integer y = 884
integer width = 2121
integer height = 304
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du type d~'Alerte"
end type

type gb_2 from groupbox within w_alertes_historique
integer x = 283
integer y = 508
integer width = 2121
integer height = 304
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du patient"
end type

type gb_1 from groupbox within w_alertes_historique
integer x = 283
integer y = 120
integer width = 2121
integer height = 304
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du praticien"
end type

type dw_liste from u_basedw within w_alertes_historique
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 18
integer y = 12
integer width = 4178
integer height = 1968
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_historique_alertes"
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event retrieverow;maj_patience(row,increment)

end event

event rbuttondown;call super::rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuPatient_Listes(this)
end if
end event

event doubleclicked;call super::doubleclicked;

// double clic, comme dans la salle d'attente !!

if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
	var_nom 				= this.getitemstring(row,"nom")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
end if

end event

event resize;call super::resize;iu_PowerFilter.event ue_positionbuttons()
end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

type cbx_filtre from u_cst_togglebutton within w_alertes_historique
event destroy ( )
boolean visible = false
integer x = 187
integer y = 1996
integer width = 558
integer height = 92
integer taborder = 60
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event constructor;call super::constructor;cbx_filtre.backcolor = parent.backcolor	

end event

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


end event

type gb_5 from groupbox within w_alertes_historique
integer x = 293
integer y = 1236
integer width = 2121
integer height = 304
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix de l~'utilisateur"
end type

