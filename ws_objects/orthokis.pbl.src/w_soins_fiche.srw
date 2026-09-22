$PBExportHeader$w_soins_fiche.srw
forward
global type w_soins_fiche from w_param_fiche
end type
type dw_codes_soins_specialites from datawindow within w_soins_fiche
end type
type pb_maj_tarifs from uo_picturebutton_390x120 within w_soins_fiche
end type
type cb_augmentation_pourcentage from uo_picturebutton_390x120 within w_soins_fiche
end type
end forward

global type w_soins_fiche from w_param_fiche
integer width = 3625
integer height = 2048
string title = "Fiche Soin"
dw_codes_soins_specialites dw_codes_soins_specialites
pb_maj_tarifs pb_maj_tarifs
cb_augmentation_pourcentage cb_augmentation_pourcentage
end type
global w_soins_fiche w_soins_fiche

type variables



boolean ajout

double total_a_l_ouverture

boolean b_avertissement_exo_deja_fait  = false


// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0

end variables

forward prototypes
public subroutine actu_decompo ()
end prototypes

public subroutine actu_decompo ();if dw_fiche.rowcount() > 0 then

	long row 
	
	row =  dw_fiche.getrow()
	
	if (dw_fiche.getitemstring(row, "lettre") = "TO" or dw_fiche.getitemstring(row, "lettre") = "ORT") and (dw_fiche.getitemnumber(row, "nb_lettre") = 20 or dw_fiche.getitemnumber(row, "nb_lettre") = 200 or dw_fiche.getitemnumber(row, "nb_lettre") = 180 or dw_fiche.getitemnumber(row, "nb_lettre") = 10) then
		
		dw_fiche.object.code_soins_decomposition.visible = true
		
		if dw_fiche.getitemnumber(row, "nb_lettre") = 20 then
			dw_fiche.object.code_soins_decomposition.checkbox.text = "Décomposition en 4 parties"
		else
			dw_fiche.object.code_soins_decomposition.checkbox.text = "Décomposition en 2 parties"
		end if
	else
		dw_fiche.object.code_soins_decomposition.visible = false
	end if
		

end if
end subroutine

on w_soins_fiche.create
int iCurrent
call super::create
this.dw_codes_soins_specialites=create dw_codes_soins_specialites
this.pb_maj_tarifs=create pb_maj_tarifs
this.cb_augmentation_pourcentage=create cb_augmentation_pourcentage
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_codes_soins_specialites
this.Control[iCurrent+2]=this.pb_maj_tarifs
this.Control[iCurrent+3]=this.cb_augmentation_pourcentage
end on

on w_soins_fiche.destroy
call super::destroy
destroy(this.dw_codes_soins_specialites)
destroy(this.pb_maj_tarifs)
destroy(this.cb_augmentation_pourcentage)
end on

event open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//
code = message.stringparm



uo_1.taille(this)

dw_fiche.settransobject(SQLCA)
dw_codes_soins_specialites.settransobject(sqlca)

// Modification du terme "Dépassement"
dw_fiche.modify("libelle_depassement.text = '"+libelle_depassement+" :'")


// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[30]
	Case 'C'
		// Consultation 
		cb_enregistrer.enabled = false
end choose

if Belgique then
	
	// Coefficient pondération
	dw_fiche.object.coefficient_p.visible = 1
	dw_fiche.object.t_coefficient_p.visible = 1
	
	// renouvt masqué
	dw_fiche.object.renouvt.visible = false
	dw_fiche.object.renouvt_t.visible = false

	// date_accord  masqué
	dw_fiche.object.date_dem.visible = false
	dw_fiche.object.date_dem_t.visible = false
	
	// Avertissement Couleur 
	dw_fiche.object.t_barre_clinique.visible = true
	
	
	
	// Pseudocodes
	dw_fiche.object.gb_pseudocode.visible = true
	dw_fiche.object.pseudocode.visible = true
//	dw_fiche.object.categorie_pseudocode.visible = true
//	dw_fiche.object.t_categorie_pseudocode.visible = true
	
	// Pas de gestion de couleurs dans la barre d'avancement belge : les couleurs sont fixes sauf pour si la barre est avec une durée
	// => Faut laisser ça actif 
//	dw_fiche.object.couleur_barre_avancement.visible = false
//	dw_fiche.object.couleur_fond_barre_avancement.visible = false
//	dw_fiche.object.r_1.visible = false
//	dw_fiche.object.r_2.visible = false
//	dw_fiche.object.r_3.visible = false
//	dw_fiche.object.r_fond.visible = false
//	dw_fiche.object.t_total.visible = false
//	dw_fiche.object.t_passe.visible = false
	
	
else
	// Elements interventions inami
	dw_fiche.object.gb_inami.visible = false
	dw_fiche.object.inami_avec_t.visible = false
	dw_fiche.object.inami_sans_t.visible = false
	dw_fiche.object.inter_inami_avec.visible = false
	dw_fiche.object.inter_inami_sans.visible = false
	
	if not Luxembourg then
		// Que 2 décimales pour la valeur de la lettres
		dw_fiche.Modify ("valeur.EditMask.mask = '#####0.00'")
	end if
	
end if


if trim(code) = "" then
	// Ajout
	ajout = true
	dw_fiche.retrieve(" ")
	dw_fiche.insertrow(0)
	
	
	double max
			// recherche de la valeur maxi
	max = get_max_code_datawindow(w_soins.dw_liste, "code") + 1


	dw_fiche.SetItem(dw_fiche.RowCount(),"code",string(max))
	
	// Couleurs par defaut :
	dw_fiche.SetItem(dw_fiche.RowCount(),"couleur_barre_avancement",couleur_verte)
	dw_fiche.SetItem(dw_fiche.RowCount(),"couleur_fond_barre_avancement",134217730)
	
	
	dw_fiche.ScrollToRow(dw_fiche.rowcount())
	dw_fiche.SetFocus()
else
	// Modif
	ajout = false
	string clause
	dw_fiche.Modify("Code.Edit.DisplayOnly = Yes")
	dw_fiche.retrieve(code)
end if

this.backcolor = couleur_fond_fenetre


if belgique or suisse or luxembourg then
	// On masque la nature du soins
	dw_fiche.object.nature.visible = false
	dw_fiche.object.nature_t.visible = false
	
	// pas d'exo
	dw_fiche.object.exo_defaut.visible = false
	dw_fiche.object.t_exo_defaut.visible = false
	
	// pas de modificateurs
	dw_fiche.object.modificateurs_defaut.visible = false
	dw_fiche.object.t_modificateurs_defaut.visible = false
	
	// Pas de remboursement exceptionnel
	dw_fiche.object.remboursement_exceptionnel_defaut.visible = false

	if luxembourg then
		pb_maj_tarifs.visible = true
		// Mémo du prix à l'ouverture pour le proposer à la mise à jour des tarifs
		total_a_l_ouverture = dw_fiche.getItemNumber(1, "total")
		
		if SERIAL = "87826" then
			// Spécial BIVER
			cb_augmentation_pourcentage.visible =  true
		end if
	end if
	
end if



// Si multi spécialités, on aggrandit la fenêtre pour caser la dw dessous
if MULTISPECIALITES then

	this.height = this.height + dw_codes_soins_specialites.height + 50
	dw_codes_soins_specialites.retrieve(code)
	cb_fermer.y = cb_fermer.y + dw_codes_soins_specialites.height + 50
	cb_enregistrer.y = cb_fermer.y
	cb_annuler.y = cb_fermer.y
	cb_imprimer.y = cb_fermer.y
	if not ajout then
		// pour l'ajout, on enregistrera d'abord pour la rendre visible
		dw_codes_soins_specialites.visible = true
	end if
	
	dw_codes_soins_specialites.y = dw_fiche.y + dw_fiche.height + 50
	
end if

//centrer(this)
	
	

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if




end event

event resize;

//
end event

event timer;call super::timer;
Timer(0)
fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)

end event

type p_fond from w_param_fiche`p_fond within w_soins_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_soins_fiche
integer x = 3026
integer y = 1732
integer width = 526
end type

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_soins_fiche
integer x = 2491
integer y = 1732
integer width = 526
end type

event cb_enregistrer::clicked;string	lstr_lettre, lstr_nom, lstr_code
long		lstr_nbrcarac
long		i = 1
int		lint_carac
boolean	lb_pas_alpha

integer v_nb_lettre
string v_lettre


// Pour ne pas avoir une lettre NULLE ou avec des espaces
dw_fiche.SetItem(1, "lettre",trim(dw_fiche.GetItemString(1, "lettre")))

if isnull(dw_fiche.GetItemString(1, "lettre")) then
	dw_fiche.SetItem(1, "lettre","")
end if

dw_fiche.accepttext()

v_lettre = dw_fiche.GetItemString(1, "lettre")
v_nb_lettre = dw_fiche.GetItemNumber(1, "nb_lettre")

if CCVITALE and (v_nb_lettre = 45 or v_nb_lettre >=60 ) and (v_lettre = 'TO' or v_lettre = 'ORT') and not b_avertissement_exo_deja_fait and dw_fiche.GetItemString(1, "exo_defaut") <> "3" then
	if Messagebox("ATTENTION !", "Au vu de la règlementation, ce soin devrait avoir un code d'éxonération 3 (Soins particuliers exonérés) !~n~nVoulez-vous le corriger ?", Question!, YesNo!, 1) = 1 then 
		 dw_fiche.SetItem(1, "exo_defaut", "3")
	end if
	b_avertissement_exo_deja_fait = true
else
	b_avertissement_exo_deja_fait = false
end if

// Pour être sur de ne pas mettre de remboursement exceptionnel sur un soin NGAP
if dw_fiche.GetItemString(1, "nature") = "N" then
	dw_fiche.SetItem(1, "remboursement_exceptionnel_defaut","N")
end if


if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

// récup string du champ "lettre" de la dw
lstr_nom = trim(dw_fiche.GetItemString(1, "nom"))
lstr_code = dw_fiche.GetItemString(1, "code")

if isnull(lstr_nom) OR len(lstr_nom) = 0 or isnull(lstr_code) OR len(lstr_code) = 0 then
// si chaine vide -> msg d'erreur	
	messagebox("ERREUR", "Il est impératif d'indiquer un NOM et/ou un CODE à ce type de soin.", StopSign!)
else
	// récup string du champ "lettre" de la dw
	lstr_lettre = dw_fiche.GetItemString(1, "lettre")
	
	// nbr de carac de la string récup
	lstr_nbrcarac = len(lstr_lettre)
	
	if lstr_nbrcarac > 0 then
	// si au moins 1 carac
	
		// TEST POUR SAVOIR SI IL Y A DES LETTRES DANS LA ZONE - PAS POUR LA BELGIQUE, LA SUISSE, LE  LUXEMBOURG
		// Ni pour les actes CCAM !!!
		
		if not belgique and not luxembourg and not suisse and dw_fiche.GetItemString(1, "nature") <> 'C' then
			do while not lb_pas_alpha AND i <= lstr_nbrcarac
			// pour chacun des carac tant que le msg d'attention n'est pas apparue
				// on récup val ASCII
				lint_carac = asc(mid(lstr_lettre, i, 1))
				
				if ((lint_carac < 65) OR (lint_carac > 122)) then
				// c pas un carac -> maj bool
					lb_pas_alpha = true
				else
					if ((lint_carac > 90) AND (lint_carac < 97)) then
					// c pas un carac -> maj bool
						lb_pas_alpha = true
					end if
				end if
				
				if lb_pas_alpha then
				// si c pas un carac alpha
					messagebox("ATTENTION ...", "La zone 'Lettre' ne comporte pas que des lettres.", Exclamation!)
				end if
				
				// maj cpt de boucle
				i++
				
			loop
		end if
	end if
end if

if ajout then
	ajout = false
	
	// ajout des autorisations par défaut !!
	INSERT INTO code_soins_specialites (code_soins, code_specialites, autorise)
	(select :lstr_code , specialites.code, 'O' from specialites ) ;
	
	if sqlca.sqlcode <> 0 then
		Messagebox("ERREUR EN AJOUT D'AUTORISATION",sqlca.sqlerrtext)
	end if
	commit ;
	

	if MULTISPECIALITES then
		dw_fiche.Modify("Code.Edit.DisplayOnly = Yes")
		dw_codes_soins_specialites.retrieve(lstr_code)
		dw_codes_soins_specialites.visible = true
	end if
end if
	
dw_codes_soins_specialites.update()

end event

type cb_annuler from w_param_fiche`cb_annuler within w_soins_fiche
integer x = 1957
integer y = 1732
integer width = 526
end type

type cb_imprimer from w_param_fiche`cb_imprimer within w_soins_fiche
integer x = 1422
integer y = 1732
integer width = 526
end type

type uo_1 from w_param_fiche`uo_1 within w_soins_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_soins_fiche
string tag = "no resizeall brush"
integer x = 133
integer width = 3255
integer height = 1652
string dataobject = "dw_soins_fiche"
end type

event dw_fiche::itemchanged;

// pour valider les modifs en cours
this.accepttext()

actu_decompo()

// Mise à jour automatique des champs DEPASSE et TOTAL selon ...


//si control pas une "column" on ne prend pas en compte
if dwo.type = "column" then

	//sélection suivant le nom de la "column" de la data window que l'on quitte
	choose case dwo.name
		
		case "total"	// On quitte total => Mise à jour de dépassement
			setitem(row,"depasse",   getItemNumber(row, "total") - getItemNumber(row, "nb_lettre") * getItemNumber(row, "valeur"))
			
		case "depasse", "nb_lettre", "valeur"	// On quitte depasse, nb_lettre, valeur => Mise à jour de total
			setitem(row,"total",   getItemNumber(row, "depasse") + getItemNumber(row, "nb_lettre") * getItemNumber(row, "valeur"))
			
	end choose
end if

// infos de mise à jour
setitem(row, "type_maj","M")
setitem(row, "user_modif",utilisateur_code)
setitem(row, "date_modif",today())

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event dw_fiche::rbuttondown;call super::rbuttondown;
long couleur_choisie
string	ls_Object
string	ls_win

ls_Object = String(dwo.name)

choose case ls_object
	case "couleur_barre_avancement" 
		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = xpos
		ii_palette_y = ypos
		
		Timer(0.05)


		//Appel de la fenetre couleur et au retour, met la couleur de fond
		//--------------------------------------------------
		if appel_palette(couleur_choisie) then
			this.setitem(row,"couleur_barre_avancement",couleur_choisie)
			// On bouge le focus pour appliquer la couleur dans la zone
			this.accepttext()
			if enregistrement_automatique and cb_enregistrer.enabled then
				cb_enregistrer.triggerevent(clicked!)
			end if
		end if
		
		
	case "couleur_fond_barre_avancement" 

		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = xpos
		ii_palette_y = ypos
		
		Timer(0.05)

		//Appel de la fenetre couleur et au retour, met la couleur de fond
		//--------------------------------------------------
		if appel_palette(couleur_choisie) then
			this.setitem(row,"couleur_fond_barre_avancement",couleur_choisie)
			// On bouge le focus pour appliquer la couleur dans la zone
			this.accepttext()
			if enregistrement_automatique and cb_enregistrer.enabled then
				cb_enregistrer.triggerevent(clicked!)
			end if
		end if
		
	case "couleur_fond" 

		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = xpos
		ii_palette_y = ypos
		
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
end choose	

end event

event dw_fiche::buttonclicked;call super::buttonclicked;
string ls_object
string code_retour
string v_nom_saisi
string s_nulle
double db_nulle

setnull(s_nulle)
setnull(db_nulle)

ls_Object = String(dwo.name)

// envoi d'email
choose case  ls_Object 
	case "b_raz_type_dossier_attendu" 
		this.setitem(1, "code_soins_type_dossier_attendu", s_nulle)
		
	case "b_raz_couleur_fond" 
		this.setitem(1, "couleur_fond", db_nulle)
		

end choose


end event

event dw_fiche::itemfocuschanged;call super::itemfocuschanged;
actu_decompo()
end event

type dw_codes_soins_specialites from datawindow within w_soins_fiche
string tag = "no resizeall"
boolean visible = false
integer x = 498
integer y = 68
integer width = 1678
integer height = 736
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "Autorisations par Spécialité"
string dataobject = "dw_codes_soins_specialites"
boolean hscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type pb_maj_tarifs from uo_picturebutton_390x120 within w_soins_fiche
boolean visible = false
integer x = 32
integer y = 1732
integer width = 686
integer taborder = 60
boolean bringtotop = true
string text = "Mise à jour Tarifs"
string tiptext = "Mise à jour Tarifs"
string iconname = "ACTIONS_recalculer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if

if dw_fiche.modifiedcount() > 0 then 
	Messagebox("ATTENTION", "Vous avez fait des modifications sur la fiche.~n~nVous devez les enregistrer avant de mettre à jour les tarifs.")
else
	
	
	ok_mdp = false
	open(w_mot_passe_administrateur)
	//guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)
	
	if ok_mdp then
		// passage de l'ancien montant 
		//param_win[1] = string(total_a_l_ouverture)
		openWithParm(w_soins_maj_tarifs, dw_fiche.GetItemString(1, "code"))
		cb_annuler.triggerevent(clicked!)
	end if
	
end if
end event

type cb_augmentation_pourcentage from uo_picturebutton_390x120 within w_soins_fiche
boolean visible = false
integer x = 727
integer y = 1732
integer width = 686
integer taborder = 70
boolean bringtotop = true
string text = "Augment. %"
string tiptext = "Augmentation selon %"
string iconname = "ACTIONS_recalculer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if

if dw_fiche.modifiedcount() > 0 then 
	Messagebox("ATTENTION", "Vous avez fait des modifications sur la fiche.~n~nVous devez les enregistrer avant de mettre à jour les tarifs.")
else
	
	
	ok_mdp = false
	open(w_mot_passe_administrateur)
	//guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)
	
	if ok_mdp then
		// passage de l'ancien montant 
		//param_win[1] = string(total_a_l_ouverture)
		openWithParm(w_soins_maj_augmentation, dw_fiche.GetItemString(1, "code"))
		cb_annuler.triggerevent(clicked!)
	end if
	
end if
end event

