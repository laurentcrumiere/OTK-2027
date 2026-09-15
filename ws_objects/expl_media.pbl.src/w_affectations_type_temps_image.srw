$PBExportHeader$w_affectations_type_temps_image.srw
forward
global type w_affectations_type_temps_image from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_affectations_type_temps_image
end type
type cb_annuler from uo_picturebutton_390x120 within w_affectations_type_temps_image
end type
type dw_detail from datawindow within w_affectations_type_temps_image
end type
type ole_phototra from gearbox within w_affectations_type_temps_image
end type
type dw_liste_commentaire from datawindow within w_affectations_type_temps_image
end type
end forward

global type w_affectations_type_temps_image from w_fenetre_arakis
integer width = 4119
integer height = 1800
string title = "Type d~'image / Etape de traitement"
windowtype windowtype = response!
long backcolor = 15780518
cb_fermer cb_fermer
cb_annuler cb_annuler
dw_detail dw_detail
ole_phototra ole_phototra
dw_liste_commentaire dw_liste_commentaire
end type
global w_affectations_type_temps_image w_affectations_type_temps_image

type variables




uo_image uo_image_cliquee // passée en paramètre

string var_nom_fichier_seul
double var_code_local
end variables

on w_affectations_type_temps_image.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.dw_detail=create dw_detail
this.ole_phototra=create ole_phototra
this.dw_liste_commentaire=create dw_liste_commentaire
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.dw_detail
this.Control[iCurrent+4]=this.ole_phototra
this.Control[iCurrent+5]=this.dw_liste_commentaire
end on

on w_affectations_type_temps_image.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.dw_detail)
destroy(this.ole_phototra)
destroy(this.dw_liste_commentaire)
end on

event open;call super::open;
// Recup de l'image cliquée 
uo_image_cliquee = message.PowerObjectParm

// Bidouille pour ne pas avoir une ligne en haut de la photo
ole_phototra.em_date_acquis.visible = false
ole_phototra.cbx_selection.visible = false
ole_phototra.avec_case_selection = false
ole_phototra.triggerevent(resize!)
ole_phototra.ole_image.move(0,0)
ole_phototra.charger_image(uo_image_cliquee.nom_fichier_complet )
ole_phototra.height = ole_phototra.height - 50


// Mise à jour des variable d'instance
var_code_local = uo_image_cliquee.var_code_local
var_nom_fichier_seul = uo_image_cliquee.nom_fichier_seul


colore_datawindow(dw_detail)


//retrieve de la datawindow
dw_detail.settransobject(SQLCA)
dw_detail.retrieve(var_code_local, var_nom_fichier_seul)

if dw_detail.rowcount() > 0 then
	string v_com
	v_com = dw_detail.getItemString(1, "commentaires_html")
	if isnull(v_com) then
		v_com = ""
	end if 
	if len(trim(v_com)) = 0 then
		police_rtf_par_defaut(dw_detail)
	end if
end if


//centrer la fenêtre
centrer(this)





end event

type p_fond from w_fenetre_arakis`p_fond within w_affectations_type_temps_image
end type

type cb_fermer from uo_picturebutton_390x120 within w_affectations_type_temps_image
integer x = 3063
integer y = 1428
integer width = 590
integer taborder = 40
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_detail.accepttext()

if dw_detail.update() = 1 then

	if dw_detail.rowcount() > 0 then
		

		// mise à jour des éléments de l'image appelé pour mise à jour du symbole au retour
		uo_image_cliquee.code_type_image = dw_detail.getItemNumber(dw_detail.getrow(),"type_image")
		uo_image_cliquee.code_temps_traitement	 = dw_detail.getItemNumber(dw_detail.getrow(),"temps_traitement")
		
		uo_image_cliquee.date_image = dw_detail.getItemDate(dw_detail.getrow(),"date_acquis")
		uo_image_cliquee.em_date.text = string(uo_image_cliquee.date_image)
		uo_image_cliquee.commentaire_image_html = dw_detail.getItemString(dw_detail.getrow(),"commentaires_html")
		uo_image_cliquee.p_image.PowerTipText =  dw_detail.getItemString(dw_detail.getrow(),"commentaires_html")
	end if
	commit ;
else
	rollback ;
end if

Close(parent)


end event

type cb_annuler from uo_picturebutton_390x120 within w_affectations_type_temps_image
integer x = 2455
integer y = 1428
integer width = 590
integer taborder = 20
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_detail.retrieve(var_code_local, var_nom_fichier_seul)

end event

type dw_detail from datawindow within w_affectations_type_temps_image
string tag = "brush"
integer x = 2034
integer y = 276
integer width = 2016
integer height = 1008
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_affectations_type_temps_image"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;
string nom
String nom_colonne;

nom_colonne = dw_detail.getColumnName();

// Si le curseur est dans le champ "Plan de traitement"
// Alors on affiche la datawindow pour pouvoir choisir un nouveau plan de ttt
// Sinon on affiche la datawindow pour pouvoir choisir un nouveau diagnostic
//       si le curseur est dans le champ "Diagnostic"

IF nom_colonne = "commentaires_html" THEN
	dw_liste_commentaire.SetTransObject(SQLCA)
	dw_liste_commentaire.Retrieve()
	dw_liste_commentaire.visible = TRUE
	return 1
END IF
end event

type ole_phototra from gearbox within w_affectations_type_temps_image
boolean visible = true
integer x = 27
integer y = 24
integer width = 1970
integer height = 1616
integer taborder = 10
boolean bringtotop = true
end type

on ole_phototra.destroy
call gearbox::destroy
end on

event click;
// pour désactiver le clic sur l'image qui ouvre l'éditeur
end event

event clicked;

// pour désactiver le clic sur l'image qui ouvre l'éditeur
end event

type dw_liste_commentaire from datawindow within w_affectations_type_temps_image
string tag = "brush"
boolean visible = false
integer x = 2459
integer y = 52
integer width = 1349
integer height = 1036
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_commentaire_image_liste"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event rbuttondown;	dw_liste_commentaire.visible = false

end event

event doubleclicked;dw_detail.accepttext()

if this.rowcount() > 0 then

	string texte, texte_deja, texte_selectionne, texte_final

	// On travaille uniquement sur les textes bruts depuis 18.02a car ça pose trop de pb (orthosmile !!)

	texte = this.GetItemString(this.GetRow(),"texte_html")
		
	texte_deja = dw_detail.GetItemString(1,"commentaires_html")

	texte_selectionne = dw_detail.SelectedText()
	
	if  IsNull(texte_deja) then
		 texte_deja = ""
	end if
	
	IF texte_deja = texte_selectionne or len(trim(texte_deja)) = 0 THEN
		texte_final =  texte
	ELSE	
		texte_final = texte_deja  + texte
	END IF
	
	
	dw_detail.SetItem(1,"commentaires_html",texte_final)
	
	
end if
this.visible = FALSE
end event

