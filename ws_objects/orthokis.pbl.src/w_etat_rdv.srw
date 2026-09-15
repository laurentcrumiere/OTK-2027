$PBExportHeader$w_etat_rdv.srw
forward
global type w_etat_rdv from w_param
end type
type dw_edition from datawindow within w_etat_rdv
end type
type uo_color from u_color_bar within w_etat_rdv
end type
type cb_imprimer from uo_picturebutton_390x120 within w_etat_rdv
end type
end forward

global type w_etat_rdv from w_param
integer width = 5371
integer height = 3020
string title = "Table des Etats des Rendez-vous"
dw_edition dw_edition
uo_color uo_color
cb_imprimer cb_imprimer
end type
global w_etat_rdv w_etat_rdv

type variables
double max
	

end variables

on w_etat_rdv.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.uo_color=create uo_color
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.uo_color
this.Control[iCurrent+3]=this.cb_imprimer
end on

on w_etat_rdv.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.uo_color)
destroy(this.cb_imprimer)
end on

event open;
uo_1.taille(this)
dw_liste.settransobject(SQLCA)
integer i_borne

// Si module BORNE SALLE D'ATTENTE on affiche ou pas un boutons
if BORNE then
	i_borne = 1
else
	i_borne = 0
end if

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if


dw_edition.settransobject(SQLCA)


// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[33]
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

verification_ordre_par_defaut = true
v_nom_table_a_verifier = "etat_rdv"


dw_liste.retrieve(i_borne)



end event

type p_fond from w_param`p_fond within w_etat_rdv
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_etat_rdv
boolean visible = true
integer x = 55
integer y = 2684
integer width = 613
integer height = 152
end type

type cb_annuler from w_param`cb_annuler within w_etat_rdv
integer x = 3634
integer y = 2684
integer width = 521
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_etat_rdv
integer x = 4165
integer y = 2684
integer width = 521
integer height = 152
end type

event cb_enregistrer::clicked;


//// Mise à jour des zones pour comptatilité avec MyOrthokis
//long lig
//for lig = 1 to dw_liste.rowcount()
//	dw_liste.setItem(lig, "texte_commentaire_auto_html", dw_liste.getitemString(lig, "texte_brut"))
//next
//

dw_liste.accepttext()
if dw_liste.update() = 1 then
	commit ;
	if not enregistrement_automatique then
		// si tout va bien on retrieve pour remetre l'ordre entre autre
		cb_annuler.TriggerEvent(Clicked!)
	end if
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if


end event

type cb_fermer from w_param`cb_fermer within w_etat_rdv
integer x = 4695
integer y = 2684
integer width = 521
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_etat_rdv
integer x = 1207
integer y = 2684
integer width = 521
integer height = 152
end type

event cb_supprimer::clicked;string code
long ligne

dw_liste.accepttext()

// Interdiction de supprimer les états de rendez-vous à 'N'
if dw_liste.rowcount() > 0 then
	ligne = dw_liste.GetRow() 
	code = dw_liste.GetItemString(ligne,"code")
	
	IF code = 'N'  THEN
		MessageBox("ATTENTION","Vous ne pouvez pas supprimer cet état de rendez-vous !~n~n(code réservé)")
	ELSE	
		son(7)
		dw_liste.deleterow(ligne)
	end if
END IF	


end event

type cb_ajouter from w_param`cb_ajouter within w_etat_rdv
integer x = 677
integer y = 2684
integer width = 521
integer height = 152
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
	
dw_liste.SetItem(dw_liste.RowCount(),"code",string(max))
max = max + 1

dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_etat_rdv
integer x = 119
integer width = 4297
integer height = 2580
string dataobject = "dw_etat_rdv_liste"
boolean hscrollbar = false
boolean livescroll = false
end type

event dw_liste::buttonclicked;call super::buttonclicked;string	ls_Object
string	ls_win
long couleur_choisie
string v_message

ls_Object = String(dwo.name)


choose case ls_object
	case "b_accueil_borne" 
		// Message d'accueil sur la borne
		if row > 0 then
			
			openwithparm(w_etat_rdv_message_borne, this.getItemString(row, "code"))
	
		end if
	
	case "b_texte_commentaire_automatique" 
		// Message commentaire automatique
		if row > 0 then
			
			openwithparm(w_etat_rdv_texte_commentaire_automatique, this.getItemString(row, "code"))
	
		end if
end choose

 
end event

event dw_liste::itemchanged;call super::itemchanged;If row > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
else
	This.uf_ColSort()
End If


if getcolumn() = 10 then
	// Traçabilité de la colonne Eliminé de l'agenda
	setitem(row, "user_modif_elimine_agenda", utilisateur_code )
	setitem(row, "date_modif_elimine_agenda", now() )
end if

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event dw_liste::rbuttondown;if row > 0 then
	
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)	
	m_btdroit_etat_rdv newmenu
	newmenu = create m_btdroit_etat_rdv
	newmenu.popmenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY())

end if


end event

event dw_liste::clicked;
//
end event

type uo_1 from w_param`uo_1 within w_etat_rdv
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_etat_rdv
integer x = 3035
integer y = 2736
integer width = 535
end type

type gb_filtre from w_param`gb_filtre within w_etat_rdv
integer x = 3003
integer y = 2676
integer width = 622
end type

type dw_edition from datawindow within w_etat_rdv
boolean visible = false
integer x = 151
integer y = 612
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_etat_rdv_liste_edition"
boolean livescroll = true
end type

type uo_color from u_color_bar within w_etat_rdv
string tag = "no resize "
integer x = 2267
integer y = 2644
integer width = 727
integer height = 224
integer taborder = 50
boolean bringtotop = true
boolean border = true
long backcolor = 79741120
borderstyle borderstyle = styleraised!
end type

event rbuttondown;call super::rbuttondown;// Couleur de fond

	string	ls_rc 
	long ll_color
	int li_xloc,li_yloc
	string ls_f_color, ls_b_color
	li_xloc = PointerX( )
	li_yloc = PointerY( )
	ll_color = uo_color.uf_get_rgb(li_xloc, li_yloc)
	uo_color.uf_set_background(ll_color)
	uo_color.uf_get_colors(ls_f_color, ls_b_color)
	
	dw_liste.setitem(dw_liste.getrow(),"couleur_fond",double(ls_b_color))
	dw_liste.accepttext()

end event

event ue_lbuttondown;call super::ue_lbuttondown;this.setfocus()


string	ls_rc 
long ll_color
int li_xloc,li_yloc
string ls_f_color, ls_b_color
li_xloc = PointerX( )
li_yloc = Pointery( )
ll_color = uo_color.uf_get_rgb(li_xloc,li_yloc)
uo_color.uf_set_foreground(ll_color)
uo_color.uf_get_colors(ls_f_color, ls_b_color)

dw_liste.setitem(dw_liste.getrow(),"couleur",double(ls_f_color))
dw_liste.accepttext()
end event

on uo_color.destroy
call u_color_bar::destroy
end on

type cb_imprimer from uo_picturebutton_390x120 within w_etat_rdv
integer x = 1737
integer y = 2684
integer width = 521
integer height = 152
integer taborder = 60
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_edition.retrieve()
	dw_edition.print()
end if
end event

