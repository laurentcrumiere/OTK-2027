$PBExportHeader$w_param.srw
$PBExportComments$Fenêtre de base à la gestion des fichier paramêtres :
forward
global type w_param from w_fenetre_arakis
end type
type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_param
end type
type cb_annuler from uo_picturebutton_390x120 within w_param
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_param
end type
type cb_fermer from uo_picturebutton_390x120 within w_param
end type
type cb_supprimer from uo_picturebutton_390x120 within w_param
end type
type cb_ajouter from uo_picturebutton_390x120 within w_param
end type
type dw_liste from u_basedw within w_param
end type
type uo_1 from resize_fenetre within w_param
end type
type cbx_avec_les_inactifs from checkbox within w_param
end type
type gb_filtre from groupbox within w_param
end type
end forward

global type w_param from w_fenetre_arakis
integer x = 32
integer y = 176
integer width = 4247
integer height = 2296
string title = "Fichier Paramètres"
windowtype windowtype = child!
long backcolor = 15780518
pb_raz_ordre_trie pb_raz_ordre_trie
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
cb_supprimer cb_supprimer
cb_ajouter cb_ajouter
dw_liste dw_liste
uo_1 uo_1
cbx_avec_les_inactifs cbx_avec_les_inactifs
gb_filtre gb_filtre
end type
global w_param w_param

type variables


double valeur_max

boolean verification_ordre_par_defaut = false
string v_nom_table_a_verifier = ""
end variables

event open;call super::open;uo_1.taille(this)
dw_liste.settransobject(SQLCA)
dw_liste.retrieve()

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if

if not UI_V2020 then
	placer_image_fond(this, p_fond, image_fond_fenetre)
	colore_tous_objets_window(this, couleur_fond_fenetre)
end if



// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if

end event

on w_param.create
int iCurrent
call super::create
this.pb_raz_ordre_trie=create pb_raz_ordre_trie
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.cb_supprimer=create cb_supprimer
this.cb_ajouter=create cb_ajouter
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.cbx_avec_les_inactifs=create cbx_avec_les_inactifs
this.gb_filtre=create gb_filtre
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_raz_ordre_trie
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_enregistrer
this.Control[iCurrent+4]=this.cb_fermer
this.Control[iCurrent+5]=this.cb_supprimer
this.Control[iCurrent+6]=this.cb_ajouter
this.Control[iCurrent+7]=this.dw_liste
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.cbx_avec_les_inactifs
this.Control[iCurrent+10]=this.gb_filtre
end on

on w_param.destroy
call super::destroy
destroy(this.pb_raz_ordre_trie)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.cb_supprimer)
destroy(this.cb_ajouter)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.cbx_avec_les_inactifs)
destroy(this.gb_filtre)
end on

event resize;uo_1.retaille(this)

// repositionnement 
cbx_avec_les_inactifs.x = gb_filtre.x + 55
cbx_avec_les_inactifs.y = gb_filtre.y + 55
end event

event close;

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if


//if UI_v2020 then
//	// Faut en plus fermer le Dock
//	w_mdi_2020.uo_powerDock.of_closedocument (this)
//end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_param
end type

type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_param
boolean visible = false
integer x = 1065
integer y = 2032
integer width = 562
integer height = 132
integer taborder = 40
string text = "&Trier par défaut"
string iconname = "Sort!"
end type

event clicked;call super::clicked;
if MessageBox("ATTENTION","Vous allez réinitialiser les ordres de tri à 100 pour tous les éléments.~n~nSi vous confirmez, vous devrez ensuite définir une élément par défaut en lui donnant '1' comme ordre de tri.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	constant string col_name_ordre_trie = "ordre_trie"
	constant int ordre_par_defaut = 100
	
	long nbr_row
	nbr_row = dw_liste.rowcount()
	long row
	for row = 1 to nbr_row
		dw_liste.setItem(row, col_name_ordre_trie, ordre_par_defaut)
	next
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_param
integer x = 2491
integer y = 2028
integer width = 517
integer height = 132
integer taborder = 50
string text = "A&nnuler"
string iconname = "Regenerate5!"
end type

event clicked;call super::clicked;rollback ;
dw_liste.retrieve() ;
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_param
integer x = 3017
integer y = 2028
integer width = 517
integer height = 132
integer taborder = 60
string text = "&Enregistrer"
boolean default = true
string iconname = "Save!"
end type

event clicked;call super::clicked;dw_liste.accepttext()
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

type cb_fermer from uo_picturebutton_390x120 within w_param
integer x = 3543
integer y = 2028
integer width = 517
integer height = 132
integer taborder = 70
string text = "&Fermer"
string iconname = "Close!"
end type

event clicked;call super::clicked;dw_liste.accepttext()

boolean faut_fermer = false

if enregistrement_automatique and cb_enregistrer.enabled then
	 faut_fermer = true
else
	if (dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0) and cb_enregistrer.enabled Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur la table !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			 faut_fermer = true
		end if
	else
		 faut_fermer = true
	end if
end if

if faut_fermer then
	
	if verification_ordre_par_defaut then 
		long v_cpt
		string cde
		
		DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
		cde = "select count(*) from " + v_nom_table_a_verifier + " where ordre_trie = (select min(ordre_trie) from " + v_nom_table_a_verifier +" where actif = 1) ;"
		PREPARE SQLSA FROM :cde ;
		OPEN DYNAMIC my_cursor  ;
		FETCH my_cursor INTO :v_cpt ;
		CLOSE my_cursor ;
				
		if v_cpt <> 1 then
			Messagebox("ATTENTION","Cette table nécessite d'avoir un élément 'Par défaut', avec une valeur d'ordre de tri unique.~n~nMerci de corriger !")
		else
			
			close(parent)
		end if
	else

		close(parent)
	end if
end if


end event

type cb_supprimer from uo_picturebutton_390x120 within w_param
integer x = 599
integer y = 2032
integer width = 457
integer height = 132
integer taborder = 30
string text = "&Supprimer"
string iconname = "DeleteRow!"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	son(7)
	dw_liste.deleterow(dw_liste.getrow())
end if
end event

type cb_ajouter from uo_picturebutton_390x120 within w_param
integer x = 133
integer y = 2032
integer width = 457
integer height = 132
integer taborder = 20
string text = "&Ajouter"
string iconname = "Insert!"
end type

event clicked;call super::clicked;
// recherche de la valeur maxi
valeur_max = get_max_code_datawindow(dw_liste, "code") + 1

dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.SetItem(dw_liste.RowCount(),"code",string(valeur_max))
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from u_basedw within w_param
string tag = "no resize centrer brush"
integer x = 773
integer y = 20
integer width = 2368
integer height = 1932
integer taborder = 10
string dataobject = "dw_dossier_liste"
end type

event itemchanged;If row > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
else
	This.uf_ColSort()
End If



if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event clicked;If row > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	This.setrow(row)
else
	This.uf_ColSort()
End If

end event

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1
end event

type uo_1 from resize_fenetre within w_param
boolean visible = false
integer x = 1765
integer y = 352
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cbx_avec_les_inactifs from checkbox within w_param
string tag = "no resize all"
integer x = 1737
integer y = 2060
integer width = 558
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
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

type gb_filtre from groupbox within w_param
string tag = "no resize"
integer x = 1673
integer y = 1988
integer width = 773
integer height = 168
integer taborder = 50
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

