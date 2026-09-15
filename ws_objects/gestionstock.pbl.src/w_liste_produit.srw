$PBExportHeader$w_liste_produit.srw
forward
global type w_liste_produit from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_produit
end type
type cb_imprimer from uo_picturebutton_390x120 within w_liste_produit
end type
type cb_autre from uo_picturebutton_390x120 within w_liste_produit
end type
type cb_ecran from uo_picturebutton_390x120 within w_liste_produit
end type
type dw_gestion from datawindow within w_liste_produit
end type
type dw_type from datawindow within w_liste_produit
end type
type dw_categorie from datawindow within w_liste_produit
end type
type rb_un_produit from radiobutton within w_liste_produit
end type
type rb_un_categorie from radiobutton within w_liste_produit
end type
type rb_tous_produits from radiobutton within w_liste_produit
end type
type rb_2 from radiobutton within w_liste_produit
end type
type rb_tous_gestion from radiobutton within w_liste_produit
end type
type cb_lien_word from commandbutton within w_liste_produit
end type
type dw_liste from u_basedw within w_liste_produit
end type
type uo_size from resize_fenetre within w_liste_produit
end type
type dw_prati from datawindow within w_liste_produit
end type
type rb_un from radiobutton within w_liste_produit
end type
type rb_tous from radiobutton within w_liste_produit
end type
type em_nb from editmask within w_liste_produit
end type
type dw_1 from datawindow within w_liste_produit
end type
type pb_exporter from uo_picturebutton_390x120 within w_liste_produit
end type
type cbx_avec_les_inactifs from checkbox within w_liste_produit
end type
type gb_1 from groupbox within w_liste_produit
end type
type gb_2 from groupbox within w_liste_produit
end type
type gb_3 from groupbox within w_liste_produit
end type
type gb_filtre from groupbox within w_liste_produit
end type
end forward

global type w_liste_produit from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 4306
integer height = 2268
string title = "Liste des produits en stock"
windowtype windowtype = child!
cb_fermer cb_fermer
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_ecran cb_ecran
dw_gestion dw_gestion
dw_type dw_type
dw_categorie dw_categorie
rb_un_produit rb_un_produit
rb_un_categorie rb_un_categorie
rb_tous_produits rb_tous_produits
rb_2 rb_2
rb_tous_gestion rb_tous_gestion
cb_lien_word cb_lien_word
dw_liste dw_liste
uo_size uo_size
dw_prati dw_prati
rb_un rb_un
rb_tous rb_tous
em_nb em_nb
dw_1 dw_1
pb_exporter pb_exporter
cbx_avec_les_inactifs cbx_avec_les_inactifs
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_filtre gb_filtre
end type
global w_liste_produit w_liste_produit

type variables
boolean prepa_faite
double increment	
double nb_dossier
string code_type_produit, code_categorie_produit 
datawindowchild idw_type

end variables

forward prototypes
public subroutine traitement_word (integer tab_type[], ref datawindow ldatawin)
public subroutine prepa ()
end prototypes

public subroutine traitement_word (integer tab_type[], ref datawindow ldatawin);uo_lien_word	luo
string			lcourrier[]
string			lchemin[]
int				i = 0
boolean			un_pb = false
string			rep_courrier


if ldatawin.AcceptText() = 1 then
// si pas de pb pour valider la dernière modif
// éventuelle de l'utilisateur -> on poursuit

	// on alloue la mémoire
	luo = create uo_lien_word
	
	// recup du chemin courrier
	rep_courrier = fxg_get_rep_courriers()
	
	do 
		// maj var de boucle
		i++
		// on retrouve le nom du fichier de ce type de courrier (cf var globales)
		lcourrier[i] = luo.get_courrier(tab_type[i])
		// récup du chemin du courrier
		// -> pour l'instant obligation d'être ds racine rep courrier
		lchemin[i] = rep_courrier
		// si l'un des nom est vide -> on l'indique
		if lcourrier[i] = "" then un_pb = true
		
	// on boucle tant qu'il y a des types de courrier différents
	// ET que pas d'erreur rencotrée
	loop while i < upperbound(tab_type) AND not un_pb
	
	if not un_pb then
	// si on a bien retrouvé tous les courriers pour ce type de lettre
		// on lance le traitement par word
		if luo.traiter_avec_word(Service_MajEtImprime, lcourrier, ldatawin, lchemin) = -1 then
		// un pb est rencontré
			messagebox("Erreur","Un problème est survenu durant l'opération,~n impossible de poursuivre !", StopSign!)
		end if
	else
	// pas de courrier trouvé -> msg d'erreur
		messagebox("ATTENTION", "Il faut avant tout indiquer un/des fichier(s) au format ~nMicrosoft WORD pour ce(s) courrier(s). ~n~nImpossible de poursuivre !", Exclamation!)
	end if
	
	// libération mémoire
	destroy luo

else
// si un pb sur le accepttext -> msg d'erreur
	messagebox("Erreur","Impossible de poursuivre ! ~n~nUne des valeurs que vous venez de rentrer ~nest incorrect !", StopSign!)
end if
end subroutine

public subroutine prepa ();string pra_min,pra_max
integer type_gestion_min, type_gestion_max
double code_min,code_max
string v_pour_catalogue

if rb_tous.checked then
	pra_min="      "
	pra_max="ZZZZZZ"
else
	pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
end if

if rb_tous_gestion.checked then
	type_gestion_min = 1
	type_gestion_max = 2
else
	type_gestion_min = dw_gestion.getitemnumber(dw_gestion.getrow(),"type_gestion")
	type_gestion_max = type_gestion_min
end if

//	if cbx_catalogue.checked then 
//		v_pour_catalogue = '04081966'
//	else
		v_pour_catalogue = 'COMMUN'
//	end if


open(w_patience)
dw_liste.retrieve(type_gestion_min,type_gestion_max,pra_min,pra_max,code_type_produit,code_categorie_produit, v_pour_catalogue)
close(w_patience)

em_nb.text = string(dw_liste.rowcount())+" Produits"
em_nb.visible = true


end subroutine

on w_liste_produit.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_ecran=create cb_ecran
this.dw_gestion=create dw_gestion
this.dw_type=create dw_type
this.dw_categorie=create dw_categorie
this.rb_un_produit=create rb_un_produit
this.rb_un_categorie=create rb_un_categorie
this.rb_tous_produits=create rb_tous_produits
this.rb_2=create rb_2
this.rb_tous_gestion=create rb_tous_gestion
this.cb_lien_word=create cb_lien_word
this.dw_liste=create dw_liste
this.uo_size=create uo_size
this.dw_prati=create dw_prati
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.em_nb=create em_nb
this.dw_1=create dw_1
this.pb_exporter=create pb_exporter
this.cbx_avec_les_inactifs=create cbx_avec_les_inactifs
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_filtre=create gb_filtre
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_autre
this.Control[iCurrent+4]=this.cb_ecran
this.Control[iCurrent+5]=this.dw_gestion
this.Control[iCurrent+6]=this.dw_type
this.Control[iCurrent+7]=this.dw_categorie
this.Control[iCurrent+8]=this.rb_un_produit
this.Control[iCurrent+9]=this.rb_un_categorie
this.Control[iCurrent+10]=this.rb_tous_produits
this.Control[iCurrent+11]=this.rb_2
this.Control[iCurrent+12]=this.rb_tous_gestion
this.Control[iCurrent+13]=this.cb_lien_word
this.Control[iCurrent+14]=this.dw_liste
this.Control[iCurrent+15]=this.uo_size
this.Control[iCurrent+16]=this.dw_prati
this.Control[iCurrent+17]=this.rb_un
this.Control[iCurrent+18]=this.rb_tous
this.Control[iCurrent+19]=this.em_nb
this.Control[iCurrent+20]=this.dw_1
this.Control[iCurrent+21]=this.pb_exporter
this.Control[iCurrent+22]=this.cbx_avec_les_inactifs
this.Control[iCurrent+23]=this.gb_1
this.Control[iCurrent+24]=this.gb_2
this.Control[iCurrent+25]=this.gb_3
this.Control[iCurrent+26]=this.gb_filtre
end on

on w_liste_produit.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_ecran)
destroy(this.dw_gestion)
destroy(this.dw_type)
destroy(this.dw_categorie)
destroy(this.rb_un_produit)
destroy(this.rb_un_categorie)
destroy(this.rb_tous_produits)
destroy(this.rb_2)
destroy(this.rb_tous_gestion)
destroy(this.cb_lien_word)
destroy(this.dw_liste)
destroy(this.uo_size)
destroy(this.dw_prati)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.em_nb)
destroy(this.dw_1)
destroy(this.pb_exporter)
destroy(this.cbx_avec_les_inactifs)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_filtre)
end on

event open;call super::open;double max,max_row
open(w_patience)

colore_tous_objets_window(this, couleur_fond_fenetre)

//insertion de "O" ds la table "table_vide"-->column "v1"
UPDATE table_vide SET v1='O' WHERE cle = 1;
commit;

  SELECT count(*)  
    INTO :max_row  
    FROM "stock_produit"  ;

increment = integer(max_row / 10)

dw_liste.settransobject(SQLCA)
dw_prati.settransobject(SQLCA)
dw_gestion.settransobject(SQLCA)
dw_type.settransobject(SQLCA)
dw_categorie.settransobject(SQLCA)
dw_prati.retrieve()
dw_gestion.insertrow(0)
dw_gestion.setitem(dw_gestion.Getrow(),"type_gestion",1)
dw_type.getchild("produit_code_type_produit",idw_type)
idw_type.settransobject(sqlca)
idw_type.insertrow(0)
dw_type.insertrow(0)
dw_categorie.insertrow(0)
code_type_produit = '%'
code_categorie_produit = '%'

if not multi then
	rb_tous.checked = false
	rb_tous.enabled = false
	rb_un.checked = true
	dw_prati.visible = true
else
	dw_prati.visible = false
end if

dw_gestion.visible = false
dw_categorie.visible = false
dw_type.visible = false

uo_size.taille(this)
prepa_faite = false
close(w_patience)

end event

event resize;uo_size.retaille(this)

// repositionnement 
cbx_avec_les_inactifs.x = gb_filtre.x + 55
cbx_avec_les_inactifs.y = gb_filtre.y + 55


dw_liste.setfilter("actif = 1")
dw_liste.filter()
end event

type p_fond from w_fenetre_arakis`p_fond within w_liste_produit
integer y = 768
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_produit
integer x = 2706
integer y = 1984
integer width = 425
integer taborder = 100
end type

event clicked;fermer_fenetre(parent)
end event

type cb_imprimer from uo_picturebutton_390x120 within w_liste_produit
integer x = 1349
integer y = 1984
integer width = 425
integer taborder = 90
boolean enabled = false
string text = "&Imprimer"
boolean default = true
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_autre from uo_picturebutton_390x120 within w_liste_produit
integer x = 2254
integer y = 1984
integer width = 425
integer taborder = 80
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false
this.enabled ( false)
cb_imprimer.enabled ( false)
pb_exporter.enabled ( false)
cb_ecran.enabled ( true)
dw_liste.visible = false
em_nb.visible = false
cb_lien_word.enabled = false
end event

type cb_ecran from uo_picturebutton_390x120 within w_liste_produit
integer x = 896
integer y = 1984
integer width = 425
integer taborder = 70
string text = "&Ecran"
boolean default = true
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;prepa()
//this.enabled ( false )
cb_imprimer.enabled ( true )
pb_exporter.enabled ( true )
cb_autre.enabled ( true )
dw_liste.visible = true 
cb_lien_word.enabled = true 
end event

type dw_gestion from datawindow within w_liste_produit
string tag = "no resizeall"
integer x = 1330
integer y = 660
integer width = 859
integer height = 64
integer taborder = 40
string title = "none"
string dataobject = "dw_select_type_gestion"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_type from datawindow within w_liste_produit
string tag = "no resizeall brush"
integer x = 1321
integer y = 1180
integer width = 859
integer height = 164
integer taborder = 60
string title = "none"
string dataobject = "dw_select_produit"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;if dwo.name = 'type_produit_code_categorie_produit' then
	code_categorie_produit = data
	idw_type.retrieve(data)
end if

if dwo.name = "produit_code_type_produit" then
	code_type_produit = data
	prepa_faite = false
end if



end event

type dw_categorie from datawindow within w_liste_produit
string tag = "no resizeall"
integer x = 1321
integer y = 1056
integer width = 864
integer height = 72
integer taborder = 50
string title = "none"
string dataobject = "dw_select_categorie"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;code_categorie_produit = data
prepa_faite = false
end event

type rb_un_produit from radiobutton within w_liste_produit
integer x = 448
integer y = 1148
integer width = 617
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Un type de produit"
end type

event clicked;dw_categorie.visible = false
dw_type.visible = true
code_categorie_produit = '%'
code_type_produit = '%'

prepa_faite = false



end event

type rb_un_categorie from radiobutton within w_liste_produit
integer x = 448
integer y = 1056
integer width = 805
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Une catégorie de produit"
end type

event clicked;dw_categorie.visible = true
dw_type.visible = false
code_categorie_produit = '%'
code_type_produit = '%'
prepa_faite = false

end event

type rb_tous_produits from radiobutton within w_liste_produit
integer x = 448
integer y = 964
integer width = 571
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tous les produits"
boolean checked = true
end type

event clicked;dw_categorie.visible = false
dw_type.visible = false
code_categorie_produit = '%'
code_type_produit = '%'
prepa_faite = false
end event

type rb_2 from radiobutton within w_liste_produit
integer x = 453
integer y = 660
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Un type de gestion"
end type

event clicked;dw_gestion.visible = true
end event

type rb_tous_gestion from radiobutton within w_liste_produit
integer x = 453
integer y = 560
integer width = 809
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Tous les types de gestion"
boolean checked = true
end type

event clicked;dw_gestion.visible = false
end event

type cb_lien_word from commandbutton within w_liste_produit
boolean visible = false
integer x = 3259
integer y = 1544
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

type dw_liste from u_basedw within w_liste_produit
boolean visible = false
integer x = 18
integer y = 8
integer width = 4229
integer height = 1944
integer taborder = 30
string dataobject = "dw_impr_liste_produit"
end type

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	OpenMenuProduit_liste(this)
end if
end event

type uo_size from resize_fenetre within w_liste_produit
boolean visible = false
integer x = 2235
integer y = 580
integer taborder = 30
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type dw_prati from datawindow within w_liste_produit
string tag = "no resizeall brush"
integer x = 1166
integer y = 268
integer width = 864
integer height = 76
integer taborder = 60
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type rb_un from radiobutton within w_liste_produit
integer x = 448
integer y = 264
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

type rb_tous from radiobutton within w_liste_produit
integer x = 448
integer y = 168
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

type em_nb from editmask within w_liste_produit
boolean visible = false
integer x = 64
integer y = 2008
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

type dw_1 from datawindow within w_liste_produit
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

type pb_exporter from uo_picturebutton_390x120 within w_liste_produit
integer x = 1801
integer y = 1984
integer width = 425
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string text = "E&xporter"
boolean default = true
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type cbx_avec_les_inactifs from checkbox within w_liste_produit
string tag = "no resize all"
integer x = 3415
integer y = 2044
integer width = 558
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Avec les inactifs"
borderstyle borderstyle = styleraised!
end type

event clicked;
// sélection ou pas des inactifs ..
if this.checked then
	dw_liste.setfilter("")
else
	dw_liste.setfilter("actif = 1")
end if

dw_liste.filter()

end event

type gb_1 from groupbox within w_liste_produit
integer x = 283
integer y = 88
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

type gb_2 from groupbox within w_liste_produit
integer x = 283
integer y = 484
integer width = 2121
integer height = 304
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Choix du type de gestion"
end type

type gb_3 from groupbox within w_liste_produit
integer x = 283
integer y = 872
integer width = 2117
integer height = 532
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Fitres Produits"
end type

type gb_filtre from groupbox within w_liste_produit
string tag = "no resize all"
integer x = 3301
integer y = 1972
integer width = 773
integer height = 168
integer taborder = 90
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtre"
borderstyle borderstyle = styleraised!
end type

