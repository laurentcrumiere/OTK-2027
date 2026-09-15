$PBExportHeader$w_acquisition_coller_2013.srw
forward
global type w_acquisition_coller_2013 from w_fenetre_arakis
end type
type dw_detail from datawindow within w_acquisition_coller_2013
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_acquisition_coller_2013
end type
type ole_phototra from gearbox within w_acquisition_coller_2013
end type
type pb_annuler from uo_picturebutton_390x120_fermer within w_acquisition_coller_2013
end type
type dw_liste_commentaire from datawindow within w_acquisition_coller_2013
end type
end forward

global type w_acquisition_coller_2013 from w_fenetre_arakis
integer width = 2080
integer height = 2368
string title = "Acquisition d~'une image du Presse-Papier"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
dw_detail dw_detail
pb_fermer pb_fermer
ole_phototra ole_phototra
pb_annuler pb_annuler
dw_liste_commentaire dw_liste_commentaire
end type
global w_acquisition_coller_2013 w_acquisition_coller_2013

type variables


double var_code_local
end variables

event open;call super::open;
var_code_local = message.DoubleParm 

string v_nom_cadre_libre
long v_type_image, v_temps_traitement
date v_last_date


v_nom_cadre_libre = get_nom_prochain_cadre_image(var_code_local)


colore_datawindow(dw_detail)

// Mets la photo d'une image cliquée (droit ou gauche) dans la gearbox de travail
ole_phototra.nom_cadre_ole = v_nom_cadre_libre
ole_phototra.var_num_dossier =	var_code_local

// passage en paramètre à la GearBox
ole_phototra.utiliser_code_en_parametre = true
message.doubleparm = var_code_local
ole_phototra.init_gearbox()

// Pour etre sur que pas modifié dans le init
ole_phototra.em_date_acquis.visible = false
ole_phototra.cbx_selection.visible = false
ole_phototra.avec_case_selection = false


// Récupération de l'image du presse papier
ole_phototra.coller()

string v_nom_fichier_acquis
string nom_fichier_seul

v_nom_fichier_acquis = ole_phototra.fichier_photo

// test pour savoir si l'acquisition a eu lieu


if FileExists(v_nom_fichier_acquis) then
	// Si oui, on reste pour compléter , sinon, on quitte DE SUITE
	nom_fichier_seul = gfx_extraire_nom_fichier(v_nom_fichier_acquis)
	dw_detail.settransobject(sqlca)
	
	// Recherche temps de traitement par défaut avant l'acquisition en cours
	v_temps_traitement = proposition_temps_traitement(var_code_local)

	update images_infos set temps_traitement = :v_temps_traitement where code = :var_code_local and nom_fichier = :nom_fichier_seul ;
	commit ;
	dw_detail.retrieve(var_code_local, nom_fichier_seul)
	
	centrer(this)
	
else
	close(this)
end if


end event

on w_acquisition_coller_2013.create
int iCurrent
call super::create
this.dw_detail=create dw_detail
this.pb_fermer=create pb_fermer
this.ole_phototra=create ole_phototra
this.pb_annuler=create pb_annuler
this.dw_liste_commentaire=create dw_liste_commentaire
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_detail
this.Control[iCurrent+2]=this.pb_fermer
this.Control[iCurrent+3]=this.ole_phototra
this.Control[iCurrent+4]=this.pb_annuler
this.Control[iCurrent+5]=this.dw_liste_commentaire
end on

on w_acquisition_coller_2013.destroy
call super::destroy
destroy(this.dw_detail)
destroy(this.pb_fermer)
destroy(this.ole_phototra)
destroy(this.pb_annuler)
destroy(this.dw_liste_commentaire)
end on

type p_fond from w_fenetre_arakis`p_fond within w_acquisition_coller_2013
end type

type dw_detail from datawindow within w_acquisition_coller_2013
string tag = "brush"
integer x = 23
integer y = 880
integer width = 2043
integer height = 1036
integer taborder = 10
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

type pb_fermer from uo_picturebutton_390x120_fermer within w_acquisition_coller_2013
integer x = 1006
integer y = 1968
integer width = 626
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;dw_detail.accepttext()


if dw_detail.update() = 1 then
	commit ;
else
	rollback ;
end if

close(parent)
end event

type ole_phototra from gearbox within w_acquisition_coller_2013
boolean visible = true
integer x = 439
integer width = 1189
integer height = 844
integer taborder = 10
boolean bringtotop = true
end type

event mousedown;// on déconnecte le menu clic droit !!!


end event

on ole_phototra.destroy
call gearbox::destroy
end on

type pb_annuler from uo_picturebutton_390x120_fermer within w_acquisition_coller_2013
integer x = 261
integer y = 1968
integer width = 626
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;
// L'image a déjà été créée ... faut la supprimer ....


ole_phototra.image_supprimer(ole_phototra.var_num_dossier, ole_phototra.fichier_photo)

close(parent)
end event

type dw_liste_commentaire from datawindow within w_acquisition_coller_2013
string tag = "brush"
boolean visible = false
integer x = 325
integer y = 132
integer width = 1349
integer height = 1036
integer taborder = 30
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

event rbuttondown;	dw_liste_commentaire.visible = false

end event

