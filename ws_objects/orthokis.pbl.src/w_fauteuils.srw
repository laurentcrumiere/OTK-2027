$PBExportHeader$w_fauteuils.srw
forward
global type w_fauteuils from w_param
end type
end forward

global type w_fauteuils from w_param
string title = "Table des Fauteuils"
end type
global w_fauteuils w_fauteuils

type variables
// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0

end variables

on w_fauteuils.create
int iCurrent
call super::create
end on

on w_fauteuils.destroy
call super::destroy
end on

event timer;call super::timer;if version_ce_logiciel >= "36.90" then
	Timer(0)
	fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)
end if

end event

type p_fond from w_param`p_fond within w_fauteuils
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_fauteuils
end type

type cb_annuler from w_param`cb_annuler within w_fauteuils
end type

type cb_enregistrer from w_param`cb_enregistrer within w_fauteuils
end type

type cb_fermer from w_param`cb_fermer within w_fauteuils
end type

type cb_supprimer from w_param`cb_supprimer within w_fauteuils
boolean visible = false
end type

type cb_ajouter from w_param`cb_ajouter within w_fauteuils
boolean visible = false
end type

type dw_liste from w_param`dw_liste within w_fauteuils
string tag = "no resize all centrer brush"
integer x = 503
integer width = 3026
string dataobject = "dw_fauteuil"
end type

event dw_liste::rbuttondown;
// Choix de la couleur

//Declaration des variables locales
//--------------------------
long couleur_choisie

// Les positions seront utilisées dans le timer de la fenêtre	
ii_palette_x = xpos
ii_palette_y = ypos

Timer(0.05)	// pour déclencher le repositionnement de la palette


//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	if couleur_choisie=couleur_jour_interdit then
		messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur des jours interdits.")
	else
		this.setitem(row,"couleur",couleur_choisie)
		// On bouge le focus pour appliquer la couleur dans la zone
		this.setcolumn(1)
		this.setcolumn(2)
		this.accepttext()
		if enregistrement_automatique and cb_enregistrer.enabled then
			cb_enregistrer.triggerevent(clicked!)
		end if
	end if
end if
end event

type uo_1 from w_param`uo_1 within w_fauteuils
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_fauteuils
boolean visible = false
end type

type gb_filtre from w_param`gb_filtre within w_fauteuils
boolean visible = false
end type

