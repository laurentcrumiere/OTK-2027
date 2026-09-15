$PBExportHeader$uo_raccourci_histo_editions.sru
forward
global type uo_raccourci_histo_editions from picturebutton
end type
end forward

global type uo_raccourci_histo_editions from picturebutton
integer width = 183
integer height = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_fiche_admini5.png"
string disabledname = "lc_fiche_admini5.png"
alignment htextalign = left!
string powertiptext = "Ouvre l~'historique des Editions / Documents - Fond Orange = Edition importante - Fond Rouge = Document important."
long backcolor = 553648127
end type
global uo_raccourci_histo_editions uo_raccourci_histo_editions

type variables
string var_nom_local
double var_code_local
w_mdi_patient fenetre_parente 
end variables

forward prototypes
public subroutine ouvrir_partie (string v_partie)
public subroutine init (double v_code_patient, string v_nom_patient, window v_fenetre_parente)
end prototypes

public subroutine ouvrir_partie (string v_partie);
// Désactivation pour pas qu'on clique encore dessus
this.enabled = false

// Protection des variables globales ....

string var_nom_sauve
double var_code_sauve

var_nom_sauve = var_nom
var_code_sauve = var_code

var_code = var_code_local
var_nom = var_nom_local

if not isnull(VAR_CODE) and var_code <> 0 then
 
		
	if not isvalid (fenetre_parente) then
		fenetre_parente = m_orthokis_2020.ouvrir_mdi(16)
	else
		m_orthokis_2020.ouvrir_mdi(16)
	end if
	
	if isvalid (fenetre_parente.w16) then 
	
		// Selon le clic on ouvre telle ou telle partie
		choose case v_partie
			case 'E' // Editions
				fenetre_parente.w16.tab_1.selecttab(1)
			case 'D' // Documents
				fenetre_parente.w16.tab_1.selecttab(3)
		end choose
		
		// il faut sélectionner l'icone de la base
		fenetre_parente.uo_barre_mdi_patient.uo_liste_bouton.of_selectbutton  (2)
	else
		Messagebox("ATTENTION","Impossible d'ouvrir la fenêtre demandée. ~n~nVeuillez réessayer, utiliser un autre bouton ou fermer puis rouvrir le dossier.")
	end if

end if

var_nom = var_nom_sauve
var_code = var_code_sauve

// ré Activation 
this.enabled = true


end subroutine

public subroutine init (double v_code_patient, string v_nom_patient, window v_fenetre_parente);
// Variables locales récup de la fenêtre appelante
var_code_local = v_code_patient
var_nom_local = v_nom_patient

if mdi_patient then
	fenetre_parente = v_fenetre_parente
end if

// Détection si documents ou editions importante
long v_nb 
select isnull(count(*),0) into :v_nb from historique_editions where code = :var_code_local and nature = 'D' and a_lire = 'O' ;

if v_nb > 0 then
	// Document à Lire
	PictureName = 'lc_fiche_admini5d.png' 
	DisabledName = 'lc_fiche_admini5d.png'
else
	select isnull(count(*),0) into :v_nb from historique_editions where code = :var_code_local and nature = 'E' and a_lire = 'O' ;
	
	if v_nb > 0 then
		// Edition à Lire
		PictureName = 'lc_fiche_admini5e.png' 
		DisabledName = 'lc_fiche_admini5e.png'
	else
		// image normale sur fond blanc
		PictureName = 'lc_fiche_admini5.png' 
		DisabledName = 'lc_fiche_admini5.png'
	end if
end if
	
end subroutine

on uo_raccourci_histo_editions.create
end on

on uo_raccourci_histo_editions.destroy
end on

event clicked;
if not SALLE_ATTENTE_INDEPENDANTE then

	open(w_patience)
	
	ouvrir_partie("E")
	
	close(w_patience)

end if
end event

event rbuttondown;if not SALLE_ATTENTE_INDEPENDANTE then

	open(w_patience)
	
	ouvrir_partie("D")
	
	close(w_patience)

end if
end event

