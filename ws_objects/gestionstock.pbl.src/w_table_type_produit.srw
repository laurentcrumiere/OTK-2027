$PBExportHeader$w_table_type_produit.srw
forward
global type w_table_type_produit from w_fenetre_arakis
end type
type cb_modifier from uo_picturebutton_390x120 within w_table_type_produit
end type
type cb_fermer from uo_picturebutton_390x120 within w_table_type_produit
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_table_type_produit
end type
type cb_supprimer from uo_picturebutton_390x120 within w_table_type_produit
end type
type cb_annuler from uo_picturebutton_390x120 within w_table_type_produit
end type
type cb_ajouter from uo_picturebutton_390x120 within w_table_type_produit
end type
type cb_imprimer from commandbutton within w_table_type_produit
end type
type dw_liste from u_basedw within w_table_type_produit
end type
type uo_1 from resize_fenetre within w_table_type_produit
end type
type dw_categorie from datawindow within w_table_type_produit
end type
type st_1 from statictext within w_table_type_produit
end type
type cbx_avec_les_inactifs from checkbox within w_table_type_produit
end type
type gb_filtre from groupbox within w_table_type_produit
end type
end forward

global type w_table_type_produit from w_fenetre_arakis
integer width = 4247
integer height = 2296
string title = "Table des Types de Produits"
cb_modifier cb_modifier
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_supprimer cb_supprimer
cb_annuler cb_annuler
cb_ajouter cb_ajouter
cb_imprimer cb_imprimer
dw_liste dw_liste
uo_1 uo_1
dw_categorie dw_categorie
st_1 st_1
cbx_avec_les_inactifs cbx_avec_les_inactifs
gb_filtre gb_filtre
end type
global w_table_type_produit w_table_type_produit

type variables
str_twostring struct
end variables

on w_table_type_produit.create
int iCurrent
call super::create
this.cb_modifier=create cb_modifier
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_supprimer=create cb_supprimer
this.cb_annuler=create cb_annuler
this.cb_ajouter=create cb_ajouter
this.cb_imprimer=create cb_imprimer
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.dw_categorie=create dw_categorie
this.st_1=create st_1
this.cbx_avec_les_inactifs=create cbx_avec_les_inactifs
this.gb_filtre=create gb_filtre
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_modifier
this.Control[iCurrent+2]=this.cb_fermer
this.Control[iCurrent+3]=this.cb_enregistrer
this.Control[iCurrent+4]=this.cb_supprimer
this.Control[iCurrent+5]=this.cb_annuler
this.Control[iCurrent+6]=this.cb_ajouter
this.Control[iCurrent+7]=this.cb_imprimer
this.Control[iCurrent+8]=this.dw_liste
this.Control[iCurrent+9]=this.uo_1
this.Control[iCurrent+10]=this.dw_categorie
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.cbx_avec_les_inactifs
this.Control[iCurrent+13]=this.gb_filtre
end on

on w_table_type_produit.destroy
call super::destroy
destroy(this.cb_modifier)
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_supprimer)
destroy(this.cb_annuler)
destroy(this.cb_ajouter)
destroy(this.cb_imprimer)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.dw_categorie)
destroy(this.st_1)
destroy(this.cbx_avec_les_inactifs)
destroy(this.gb_filtre)
end on

event open;call super::open;dw_liste.settransobject(sqlca)
dw_categorie.settransobject(sqlca)

// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if


if dw_categorie.retrieve() > 0 then
	dw_liste.retrieve(dw_categorie.getitemstring(dw_categorie.getrow(),"code"))

	// Verrouillage selon les droits d'accès
	//-------------------------------------------
	
	choose case droits_acces[70]
		Case 'C'
			// Consultation 
			cb_ajouter.enabled = false
			cb_supprimer.enabled = false
			cb_enregistrer.enabled = false
		Case 'M'
			// Modification 
			//		cb_ajouter.enabled = false
			cb_supprimer.enabled = false
	end choose
	uo_1.taille(this)
else
	uo_1.taille(this)
	MessageBox("Attention","Vous devez saisir des Categories de produit avant de saisir des Types de produit")
	close(this)
end if


end event

event resize;uo_1.retaille(this)

// repositionnement 
cbx_avec_les_inactifs.x = gb_filtre.x + 55
cbx_avec_les_inactifs.y = gb_filtre.y + 55
end event

type p_fond from w_fenetre_arakis`p_fond within w_table_type_produit
end type

type cb_modifier from uo_picturebutton_390x120 within w_table_type_produit
integer x = 1106
integer y = 2008
integer width = 448
integer taborder = 70
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;string code_categorie_retour
struct.code = dw_liste.getitemstring(dw_liste.getrow(),"code")
struct.message = dw_categorie.getitemstring(dw_categorie.getrow(),"code")
OpenWithParm(w_type_produit_fiche,struct)
code_categorie_retour = message.stringparm
dw_categorie.Setitem(dw_categorie.getrow(),"code",code_categorie_retour)
dw_liste.retrieve(code_categorie_retour)


end event

type cb_fermer from uo_picturebutton_390x120 within w_table_type_produit
integer x = 3269
integer y = 2008
integer width = 448
integer taborder = 40
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()
if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		fermer_fenetre(parent)
	end if
else
	fermer_fenetre(parent)
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_table_type_produit
integer x = 2816
integer y = 2008
integer width = 448
integer taborder = 40
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()
if dw_liste.update() = 1 then
	commit ;
else
	Rollback ;
end if
end event

type cb_supprimer from uo_picturebutton_390x120 within w_table_type_produit
integer x = 654
integer y = 2008
integer width = 448
integer taborder = 40
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;double compteur
string temp

temp = dw_liste.getitemstring(dw_liste.getrow(),"code")

select count(*) 
into :compteur
from "produit" 
where "code_type_produit" = :temp;

if compteur > 0 then
	MessageBox("Attention","Des éléments de la base de données sont en relation avec cette catégorie de produit !~n~nVous ne pouvez donc pas l'effacer")
else
	if dw_liste.rowcount() > 0 then
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_table_type_produit
integer x = 2363
integer y = 2008
integer width = 448
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
dw_liste.retrieve(dw_categorie.getitemstring(dw_categorie.getrow(),"code"))

end event

type cb_ajouter from uo_picturebutton_390x120 within w_table_type_produit
integer x = 192
integer y = 2008
integer width = 457
integer height = 152
integer taborder = 30
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;string code_categorie_retour
struct.code = "      "
struct.message = dw_categorie.getitemstring(dw_categorie.getrow(),"code")
OpenWithParm(w_type_produit_fiche,struct)
code_categorie_retour = message.stringparm
dw_categorie.Setitem(dw_categorie.getrow(),"code",code_categorie_retour)
dw_liste.retrieve(code_categorie_retour)
end event

type cb_imprimer from commandbutton within w_table_type_produit
boolean visible = false
integer x = 2199
integer y = 1728
integer width = 402
integer height = 112
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

type dw_liste from u_basedw within w_table_type_produit
string tag = "no resize brush "
integer x = 1010
integer y = 184
integer width = 1961
integer height = 1784
integer taborder = 20
string dataobject = "dw_type_produit_liste"
boolean hscrollbar = false
end type

event doubleclicked;call super::doubleclicked;cb_modifier.triggerevent(clicked!)
end event

type uo_1 from resize_fenetre within w_table_type_produit
boolean visible = false
integer x = 2414
integer y = 340
integer taborder = 20
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_categorie from datawindow within w_table_type_produit
string tag = "no resizeall brush "
integer x = 1655
integer y = 60
integer width = 869
integer height = 80
integer taborder = 10
string title = "none"
string dataobject = "dw_select_categorie"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_categorie.accepttext()
dw_liste.retrieve(dw_categorie.getitemstring(dw_categorie.getrow(),"code"))

end event

type st_1 from statictext within w_table_type_produit
integer x = 965
integer y = 72
integer width = 631
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Catégorie Produit"
alignment alignment = right!
boolean focusrectangle = false
end type

type cbx_avec_les_inactifs from checkbox within w_table_type_produit
string tag = "no resize all"
integer x = 1669
integer y = 2056
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

type gb_filtre from groupbox within w_table_type_produit
string tag = "no resize all"
integer x = 1573
integer y = 1984
integer width = 773
integer height = 168
integer taborder = 60
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

