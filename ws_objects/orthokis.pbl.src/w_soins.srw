$PBExportHeader$w_soins.srw
forward
global type w_soins from w_param2
end type
type pb_maj_internet from uo_picturebutton_780x120 within w_soins
end type
end forward

global type w_soins from w_param2
string title = "Table des Types de Soins"
pb_maj_internet pb_maj_internet
end type
global w_soins w_soins

type variables
// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0



end variables

event open;var_fille = "w_soins_fiche"
dw_liste.settransobject(SQLCA)
dw_liste.retrieve('%')
dw_liste_edition.settransobject(SQLCA)
uo_1.taille(this)

// Modification du terme "Dépassement"
dw_liste_edition.modify("libelle_depassement.text = '"+libelle_depassement+"'")


// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[31]
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


this.backcolor = couleur_fond_fenetre

// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
	cbx_avec_les_inactifs.backcolor = couleur_fond_fenetre
end if

// Mise à jour internet
if Belgique then
	pb_maj_internet.visible = true
end if

if enregistrement_automatique then 
	cb_annuler.visible = false
	cb_enregistrer.visible = false
	
end if


end event

on w_soins.create
int iCurrent
call super::create
this.pb_maj_internet=create pb_maj_internet
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_maj_internet
end on

on w_soins.destroy
call super::destroy
destroy(this.pb_maj_internet)
end on

event timer;call super::timer;if version_ce_logiciel >= "36.90" then
	Timer(0)
	fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)
end if

end event

type p_fond from w_param2`p_fond within w_soins
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_soins
boolean visible = true
integer x = 923
integer y = 1856
integer height = 148
end type

type cb_annuler from w_param2`cb_annuler within w_soins
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_soins
end type

type cb_ajouter from w_param2`cb_ajouter within w_soins
integer x = 18
end type

type cb_modifier from w_param2`cb_modifier within w_soins
integer x = 471
end type

type cb_supprimer from w_param2`cb_supprimer within w_soins
integer x = 18
end type

event cb_supprimer::clicked;if dw_liste.rowcount() > 0 then
	// On a pas le droit de supprimer le soins 'S' car utilisé par défaut dans la Gestion des Soins
	if dw_liste.getitemstring(dw_liste.getrow(),"code") = 'S' then
		MessageBox("ATTENTION !","Vous n'avez pas le droit de supprimer le code 'S' car il est utilisé par défaut par le logiciel")
	else
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
end if
end event

type cb_1 from w_param2`cb_1 within w_soins
integer x = 471
end type

type cb_chercher from w_param2`cb_chercher within w_soins
integer x = 923
end type

type cb_exporter from w_param2`cb_exporter within w_soins
integer x = 1376
end type

type cb_fermer from w_param2`cb_fermer within w_soins
end type

type dw_liste from w_param2`dw_liste within w_soins
string tag = "no resize centrer brush"
integer x = 334
integer y = 12
integer width = 3593
integer height = 1796
string dataobject = "dw_soins_liste"
end type

event dw_liste::rbuttondown;call super::rbuttondown;if row > 0 and droits_acces[31] <> "C" and version_ce_logiciel >= "36.90"  then
	// Les positions seront utilisées dans le timer de la fenêtre	
	ii_palette_x = xpos
	ii_palette_y = ypos
	
	long  couleur_choisie
	
	Timer(0.05)
	
	//Appel de la fenetre couleur et au retour, met la couleur de fond
	//--------------------------------------------------
	if appel_palette(couleur_choisie) then
		this.setitem(row,"couleur_fond",couleur_choisie)
		// On bouge le focus pour appliquer la couleur dans la zone
		this.accepttext()
		if enregistrement_automatique and cb_enregistrer.enabled then
			cb_enregistrer.triggerevent(clicked!)
		end if
	end if
end if
end event

type uo_1 from w_param2`uo_1 within w_soins
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_soins
string dataobject = "dw_soins_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_soins
integer x = 1979
integer y = 2028
integer width = 599
end type

type gb_filtre from w_param2`gb_filtre within w_soins
integer x = 2007
end type

type pb_maj_internet from uo_picturebutton_780x120 within w_soins
boolean visible = false
integer x = 1554
integer y = 1856
integer width = 777
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "Mise à Jour Internet"
string iconname = "Custom042_2!"
end type

event clicked;call super::clicked;

// mot de passe administrateur
ok_mdp = false

guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)

if ok_mdp then

	guo_fenetre_modale.wf_ouvrir(w_soins_maj_internet)
	
	//open(w_soins_maj_internet)
	
	// Actualisation de la liste
	dw_liste.retrieve('%') ;
end if
end event

