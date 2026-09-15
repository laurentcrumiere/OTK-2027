$PBExportHeader$w_commentaires_predefinis.srw
forward
global type w_commentaires_predefinis from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_commentaires_predefinis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_commentaires_predefinis
end type
type cb_supprimer from uo_picturebutton_390x120 within w_commentaires_predefinis
end type
type cb_annuler from uo_picturebutton_390x120 within w_commentaires_predefinis
end type
type cb_ajouter from uo_picturebutton_390x120 within w_commentaires_predefinis
end type
type cb_imprimer from commandbutton within w_commentaires_predefinis
end type
type dw_liste from u_basedw within w_commentaires_predefinis
end type
type uo_1 from resize_fenetre within w_commentaires_predefinis
end type
type dw_categorie from datawindow within w_commentaires_predefinis
end type
type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_commentaires_predefinis
end type
type uo_color from u_color_bar within w_commentaires_predefinis
end type
type cbx_avec_les_inactifs from checkbox within w_commentaires_predefinis
end type
type gb_filtre from groupbox within w_commentaires_predefinis
end type
type gb_categorie from groupbox within w_commentaires_predefinis
end type
end forward

global type w_commentaires_predefinis from w_fenetre_arakis
integer width = 4247
integer height = 2296
string title = "Table des Commentaires Cliniques Prédéfinis"
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_supprimer cb_supprimer
cb_annuler cb_annuler
cb_ajouter cb_ajouter
cb_imprimer cb_imprimer
dw_liste dw_liste
uo_1 uo_1
dw_categorie dw_categorie
pb_raz_ordre_trie pb_raz_ordre_trie
uo_color uo_color
cbx_avec_les_inactifs cbx_avec_les_inactifs
gb_filtre gb_filtre
gb_categorie gb_categorie
end type
global w_commentaires_predefinis w_commentaires_predefinis

type variables
str_twostring struct

string v_type_commentaire		// Passé en paramètre ... C pour clienique , A pour administratif
end variables

forward prototypes
public subroutine filtrer ()
end prototypes

public subroutine filtrer ();// sélection ou pas des inactifs ..
if cbx_avec_les_inactifs.checked then
	dw_liste.setfilter("")
else
	dw_liste.setfilter("actif = 1 ")
end if

end subroutine

on w_commentaires_predefinis.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_supprimer=create cb_supprimer
this.cb_annuler=create cb_annuler
this.cb_ajouter=create cb_ajouter
this.cb_imprimer=create cb_imprimer
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.dw_categorie=create dw_categorie
this.pb_raz_ordre_trie=create pb_raz_ordre_trie
this.uo_color=create uo_color
this.cbx_avec_les_inactifs=create cbx_avec_les_inactifs
this.gb_filtre=create gb_filtre
this.gb_categorie=create gb_categorie
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_supprimer
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_ajouter
this.Control[iCurrent+6]=this.cb_imprimer
this.Control[iCurrent+7]=this.dw_liste
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.dw_categorie
this.Control[iCurrent+10]=this.pb_raz_ordre_trie
this.Control[iCurrent+11]=this.uo_color
this.Control[iCurrent+12]=this.cbx_avec_les_inactifs
this.Control[iCurrent+13]=this.gb_filtre
this.Control[iCurrent+14]=this.gb_categorie
end on

on w_commentaires_predefinis.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_supprimer)
destroy(this.cb_annuler)
destroy(this.cb_ajouter)
destroy(this.cb_imprimer)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.dw_categorie)
destroy(this.pb_raz_ordre_trie)
destroy(this.uo_color)
destroy(this.cbx_avec_les_inactifs)
destroy(this.gb_filtre)
destroy(this.gb_categorie)
end on

event open;call super::open;if UI_V2020 then
	str_param_string param
	param = message.PowerObjectParm
	v_type_commentaire = param.param
else
	v_type_commentaire = message.stringparm
end if


string v_droit

dw_liste.settransobject(sqlca)
dw_categorie.settransobject(sqlca)


// Depuis v2024 on désactive l'enregitrement automatique car sinon ça peut mouliner 
enregistrement_automatique = false

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

dw_categorie.retrieve()
dw_categorie.setfilter("type_com = '"+ v_type_commentaire + "'")
dw_categorie.filter()

if  dw_categorie.rowcount() > 0 then
	open(w_patience)
	dw_liste.retrieve(double(dw_categorie.gettext()))

	// Verrouillage selon les droits d'accès
	//-------------------------------------------
	
	choose case v_type_commentaire
		case "C"
			this.title = "Table des Commentaires Cliniques Prédéfinis"
			v_droit = droits_acces[31]
		case "A" 
			this.title = "Table des Commentaires Administratifs Prédéfinis"
			v_droit = droits_acces[32]
	end choose

	choose case v_droit 
		Case 'C'
			// Consultation 
			cb_ajouter.enabled = false
			cb_supprimer.enabled = false
			cb_enregistrer.enabled = false
		Case 'M'
			// Modification 
			//	cb_ajouter.enabled = false
			cb_supprimer.enabled = false
	end choose
	uo_1.taille(this)
	
	colore_tous_objets_window(this, couleur_fond_fenetre)

	
	filtrer()
	
	// On doit mettre un filtre sur la datawindow du haut en dropdow
	DataWindowChild dw_fille
	dw_categorie.GetChild("categorie", dw_fille) 

	dw_fille.setfilter("type_com = '"+ v_type_commentaire + "'")
	dw_fille.filter()
	close(w_patience)



else
	MessageBox("Attention","Vous devez entrer des Categories de Commentaires Prédéfinis avant de saisir des Commentaires Prédéfinis")
	close(this)
end if


end event

event resize;uo_1.retaille(this)


// largeur maximale la colonne commentaire

dw_liste.Object.commentaire.Width = string(dw_liste.width - long(dw_liste.Object.commentaire.x) - 100)

// repositionnement 
cbx_avec_les_inactifs.x = gb_filtre.x + 55
cbx_avec_les_inactifs.y = gb_filtre.y + 55

dw_categorie.x = gb_categorie.x + 55
dw_categorie.y = gb_categorie.y + 65


end event

event close;call super::close;
if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if



end event

type p_fond from w_fenetre_arakis`p_fond within w_commentaires_predefinis
end type

type cb_fermer from uo_picturebutton_390x120 within w_commentaires_predefinis
integer x = 3762
integer y = 1984
integer width = 439
integer height = 152
integer taborder = 40
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()

if enregistrement_automatique and cb_enregistrer.enabled then
	fermer_fenetre(parent)
else
	
	if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			fermer_fenetre(parent)
		end if
	else
		fermer_fenetre(parent)
	end if
end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_commentaires_predefinis
integer x = 3323
integer y = 1984
integer width = 439
integer height = 152
integer taborder = 40
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()


// Mise à jour des commentaires HTML pour compatibilité MyOrthokis
// On met le texte brut
long lig, tot
tot = dw_liste.rowcount()
for lig = 1 to tot
	dw_liste.setItem(lig, "commentaire_html", dw_liste.getitemString(lig, "texte_brut"))
next



if dw_liste.update() = 1 then
	commit ;
else
	Rollback ;
end if
end event

type cb_supprimer from uo_picturebutton_390x120 within w_commentaires_predefinis
integer x = 1006
integer y = 1984
integer width = 439
integer height = 152
integer taborder = 40
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	son(7)
	dw_liste.deleterow(dw_liste.getrow())
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_commentaires_predefinis
integer x = 2885
integer y = 1984
integer width = 439
integer height = 152
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_liste.retrieve(double(dw_categorie.gettext()))

end event

type cb_ajouter from uo_picturebutton_390x120 within w_commentaires_predefinis
integer x = 558
integer y = 1984
integer width = 448
integer height = 152
integer taborder = 30
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;

dw_liste.insertRow(9999999)
dw_liste.scrollToRow(dw_liste.rowcount())
dw_liste.Setitem(dw_liste.rowcount(),"id_categorie",double(dw_categorie.getText()))


string ls_f_color, ls_b_color
// Récupère les couleurs de fond et de texte de la palette
uo_color.uf_get_colors(ls_f_color, ls_b_color)
dw_liste.setitem(dw_liste.Rowcount(),"coul_texte",double(ls_f_color))
dw_liste.setitem(dw_liste.Rowcount(),"coul_fond",double(ls_b_color))


dw_liste.SetRow(dw_liste.rowcount())
dw_liste.SetColumn("commentaire")
police_rtf_par_defaut(dw_liste)
dw_liste.setFocus()
end event

type cb_imprimer from commandbutton within w_commentaires_predefinis
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

type dw_liste from u_basedw within w_commentaires_predefinis
string tag = "brush "
integer x = 73
integer y = 228
integer width = 4078
integer height = 1680
integer taborder = 20
string dataobject = "dw_commentaires_predefinis_liste"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
boolean hscrollbar = false
end type

event itemchanged;call super::itemchanged;

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if


end event

event itemfocuschanged;call super::itemfocuschanged;
//if getcolumnName() = "commentaire"   then
//	// Police des zones rtf
//	police_rtf_par_defaut(this)
//end if
//


end event

event rbuttondown;string ls_object

ls_Object = String(dwo.name)

if Profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","menu_rtf","A") = "C" and  (ls_Object = "commentaire") then
	
	fxg_afficher_barre_rtf()
	
end if
end event

type uo_1 from resize_fenetre within w_commentaires_predefinis
boolean visible = false
integer x = 2414
integer y = 340
integer taborder = 20
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_categorie from datawindow within w_commentaires_predefinis
string tag = "no resizeall brush "
integer x = 1088
integer y = 108
integer width = 1303
integer height = 80
integer taborder = 10
string title = "none"
string dataobject = "dw_categorie_commentaire_cherche"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;dw_categorie.accepttext()

// Y a t il eu des modifs 
if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
	if enregistrement_automatique then
		cb_enregistrer.triggerEvent(clicked!)
	else
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous les enregistrer ?",Question!,YesNo!, 1) = 1 Then
			cb_enregistrer.triggerEvent(clicked!)
		end if
	end if
end if


dw_liste.retrieve(double(dw_categorie.gettext()))

end event

type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_commentaires_predefinis
integer x = 5
integer y = 1984
integer width = 553
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "&Trier par défaut"
string iconname = "ACTIONS_trier.png"
end type

event clicked;call super::clicked;constant string col_name_ordre_trie = "ordre"
constant int ordre_par_defaut = 100

long nbr_row
nbr_row = dw_liste.rowcount()
long row
for row = 1 to nbr_row
	dw_liste.setItem(row, col_name_ordre_trie, ordre_par_defaut)
next
end event

type uo_color from u_color_bar within w_commentaires_predefinis
string tag = "no resize"
integer x = 1445
integer y = 1948
integer width = 709
integer height = 228
integer taborder = 80
boolean bringtotop = true
boolean border = true
long backcolor = 79741120
borderstyle borderstyle = styleraised!
end type

event rbuttondown;call super::rbuttondown;this.setfocus()

//Right_button_click(user defined) script for uo_color
//inherited from u_color_bar

string	ls_rc 
long ll_color
int li_xloc,li_yloc
string ls_f_color, ls_b_color
li_xloc = PointerX( )
li_yloc = PointerY( )
ll_color = uo_color.uf_get_rgb(li_xloc, li_yloc)
uo_color.uf_set_background(ll_color)
uo_color.uf_get_colors(ls_f_color, ls_b_color)


dw_liste.setitem(dw_liste.getrow(),"coul_fond",double(ls_b_color))
dw_liste.accepttext()

	



end event

event ue_lbuttondown;call super::ue_lbuttondown;this.setfocus()



// Couleur de texte
string	ls_rc 
long ll_color
int li_xloc, li_yloc
string ls_f_color, ls_b_color
li_xloc = PointerX( )
li_yloc = PointerY( )
ll_color = uo_color.uf_get_rgb(li_xloc, li_yloc)
uo_color.uf_set_foreground(ll_color)
uo_color.uf_get_colors(ls_f_color, ls_b_color)


//dw_liste.setitem(dw_liste.getrow(),"coul_texte",double(ls_f_color))
//dw_liste.accepttext()

//// Couleur dans le richtext
dw_liste.SetRichTextColor (  double(ls_f_color) )
dw_liste.accepttext()
dw_liste.setfocus()





end event

on uo_color.destroy
call u_color_bar::destroy
end on

type cbx_avec_les_inactifs from checkbox within w_commentaires_predefinis
string tag = "no resize all"
integer x = 2295
integer y = 2020
integer width = 539
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
filtrer()
end event

type gb_filtre from groupbox within w_commentaires_predefinis
string tag = "no resize"
integer x = 2176
integer y = 1968
integer width = 686
integer height = 168
integer taborder = 70
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

type gb_categorie from groupbox within w_commentaires_predefinis
string tag = "no resize"
integer x = 1038
integer y = 24
integer width = 1449
integer height = 192
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Catégorie Commentaire"
borderstyle borderstyle = styleraised!
end type

