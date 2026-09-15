$PBExportHeader$lien_digora_scanora_cliniview.sru
forward
global type lien_digora_scanora_cliniview from userobject
end type
type cb_lancer_scanora_cliniview from commandbutton within lien_digora_scanora_cliniview
end type
type st_titre from statictext within lien_digora_scanora_cliniview
end type
type cb_supprimer from commandbutton within lien_digora_scanora_cliniview
end type
type cb_modifier from commandbutton within lien_digora_scanora_cliniview
end type
type cb_ajouter from commandbutton within lien_digora_scanora_cliniview
end type
end forward

global type lien_digora_scanora_cliniview from userobject
integer width = 974
integer height = 188
boolean border = true
long backcolor = 16777215
string text = "none"
borderstyle borderstyle = stylelowered!
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_lancer_scanora_cliniview cb_lancer_scanora_cliniview
st_titre st_titre
cb_supprimer cb_supprimer
cb_modifier cb_modifier
cb_ajouter cb_ajouter
end type
global lien_digora_scanora_cliniview lien_digora_scanora_cliniview

type variables

// ---- pour savoir Scanora ou Digora ou Cliniview
string type_lien 	// Vaudra "S" ou "D" ou "C" ... mis à jour par la fonction ini()
string nom_logiciel 


// --------------------------- pour lien digora

private constant string msg_erreur_digora = "Un problème est survenu durant l'opération. ~n~nImpossible de poursuivre."

private constant	int ajouter = 1
private constant	int modifier = 2
private constant	int supprimer = 3
private constant	int lancer = 4

uo_lien_digora_scanora_cliniview		uo_digora_scanora_cliniview	

// Initialisée en amont
datawindow			dw_fiche_ad		// Fiche administrative partie 1
datawindow			dw_fiche_ad_2		// Fiche administrative partie 2

// infos récup ds pwo pour digora
private string	istr_code_patient
private string	istr_nom_prenom
private string	istr_naissance
private string	istr_sexe
private string	istr_docteur

double var_code_local

// ------------------------------------ Pour lien Scanora ou Cliniview
private string Dossier_Scanora_cliniview_ini

// Mode VDDS ou non pour Cliniview ou DTX
boolean mode_vdds = false
string nom_lien_vdds


end variables

forward prototypes
public subroutine digora (integer int_num_action)
public function integer recup_info_patient_pwo ()
public subroutine init ()
end prototypes

public subroutine digora (integer int_num_action);// fx principale du lien digora pour gestion fiche ad
// sous digora le numéro du patient = identifiant odrade sous pwo
// -> il est donc invariant, et c sur lui qu'on se base pour toute opération


if uo_digora_scanora_cliniview.open_connection_digora() = 1 then
// connecion OLE = OK
	
	// recup des infos ds fiche ad
	recup_info_patient_pwo()
	
	choose case int_num_action
	// selon action demandée
		
		case ajouter
			if uo_digora_scanora_cliniview.creer_fiche_patient(istr_code_patient, istr_nom_prenom) = 1 then
			// si création nouvelle fiche patient sous DIGORA (R) = OK
				if uo_digora_scanora_cliniview.ajouter_info_patient(istr_code_patient, istr_naissance, istr_sexe, istr_docteur) = 1 then
				// si ajout des autres infos = OK -> msg
					// depuis 2012, plus de message car patient ouvert dans Digora
					//messagebox("INFORMATION ...", "Opération réussie, patient créé sous DIGORA (R).")
				end if
			end if
			
		case  modifier
			if uo_digora_scanora_cliniview.modifier_patient(istr_code_patient, istr_nom_prenom) = 1 then
			// si modification sous DIGORA (R) du nom du patient = OK
				if uo_digora_scanora_cliniview.ajouter_info_patient(istr_code_patient, istr_naissance, istr_sexe, istr_docteur) = 1 then
				// si ajout des autres infos = OK -> msg
					// depuis 2012, plus de message car patient ouvert dans Digora
					//messagebox("INFORMATION ...", "Opération réussie, patient modifié sous DIGORA (R).")
				end if
			end if
			
		case else
		// SUPRESSION
			if messagebox("CONFIRMATION ...", "Orthokis va tenter de supprimer ce dossier sous DIGORA (R). ~nLes radios de ce patient vont également être supprimer.~n~nSouhaitez-vous continuer ?", Question!, YesNo! ) = 1 then
			// si l'utilisateur souhaite continuer
				if uo_digora_scanora_cliniview.supprimer_patient(istr_code_patient) = 1 then
				// si suppression = OK -> msg
					messagebox("INFORMATION ...", "Opération réussie, patient supprimé sous DIGORA (R).")
				end if
			end if
			
	end choose
end if

end subroutine

public function integer recup_info_patient_pwo ();// procédure qui récup les infos du patient sous pwo
// et les formatte pour digora

string	lstr_code_prati
string	nom, prenom

date v_date_naissance

// recup du code interne
var_code_local = dw_fiche_ad.getitemnumber(dw_fiche_ad.getrow(), "code")
istr_code_patient = string(var_code_local)

if isnull(istr_code_patient) then istr_code_patient = ""

// recup des infos 
select isnull(nom, ''), isnull(prenom, '') , date_naissance, sexe , code_praticien 
into :nom, :prenom, :v_date_naissance , :istr_sexe, :lstr_code_prati
from patient
where code = :var_code_local ;
istr_nom_prenom	= trim( nom + space(1) + prenom )

// recup date naissance -> yyyymmdd
istr_naissance		= string(v_date_naissance, "yyyymmdd")
if isnull(istr_naissance) then istr_naissance = ""
if istr_naissance = "19000101" then istr_naissance = ""

// recup masculin/féminin
if isnull(istr_sexe) then istr_sexe = "0"
choose case istr_sexe
	case "M"
		istr_sexe = "1"
	case "F"
		istr_sexe = "2"
end choose

// recup du praticien
if not isnull(lstr_code_prati) then
	// si on a bien récup un code
	select nom into :istr_docteur from prati where code = :lstr_code_prati ;
	if isnull(istr_docteur) then istr_docteur = ""
end if

// pas de gestion d'erreur
return 1
end function

public subroutine init ();
string ini_vdds 
string v_name
integer i 

uo_digora_scanora_cliniview = create uo_lien_digora_scanora_cliniview

type_lien = uo_digora_scanora_cliniview.digora_ou_scanora_ou_cliniview() 

choose case type_lien 
	case "D" 
		st_titre.text = "Lien DIGORA"
		cb_ajouter.visible = true
		cb_modifier.visible = true
		cb_supprimer.visible = true
		cb_lancer_scanora_cliniview.visible = false
		nom_logiciel = "DIGORA"
	case "S" 
		st_titre.text = "Lien SCANORA"
		cb_ajouter.visible = false
		cb_modifier.visible = false
		cb_supprimer.visible = false
		cb_lancer_scanora_cliniview.visible = true
		cb_lancer_scanora_cliniview.text = "Lancer SCANORA"
		nom_logiciel = "SCANORA"
	case "C" 
		st_titre.text = "Lien Instrumentarium"
		cb_ajouter.visible = false
		cb_modifier.visible = false
		cb_supprimer.visible = false
		cb_lancer_scanora_cliniview.visible = true
		cb_lancer_scanora_cliniview.text = "Lancer CliniView"
		nom_logiciel = "CliniView"
		
		// Est ce que VDDS est installé avec Cliniview
		ini_vdds = "C:\Windows\VDDS_MMI.INI"
		i = 1
		mode_vdds = false
		nom_lien_vdds = ""
		if FileExists(ini_vdds) then
			do while i <= 10 and  not mode_vdds
				v_name = trim( profilestring(ini_vdds, "BVS", "NAME" + string(i), "") )
				if upper(v_name) = "CLINIVIEWVDDS" then
					mode_vdds = true
					nom_lien_vdds = v_name
				end if
				i = i + 1
			loop 
		end if
		
	case "X" 
		st_titre.text = "Lien DTX"
		cb_ajouter.visible = false
		cb_modifier.visible = false
		cb_supprimer.visible = false
		cb_lancer_scanora_cliniview.visible = true
		cb_lancer_scanora_cliniview.text = "Lancer DTX"
		nom_logiciel = "DTX"
		
		// Est ce que VDDS est installé avec DTX
		ini_vdds = "C:\Windows\VDDS_MMI.INI"
		i = 1
		mode_vdds = false
		nom_lien_vdds = ""
		if FileExists(ini_vdds) then
			do while i <= 10 and  not mode_vdds
				v_name = trim( profilestring(ini_vdds, "BVS", "NAME" + string(i), "") )
				if upper(v_name) = "DTX_STUDIO" then
					mode_vdds = true
					nom_lien_vdds = v_name
				end if
				i = i + 1
			loop 
		end if
		
		if not Mode_VDDS then
			// depuis 33.00f on ne met plus de message d'erreur ... on désactive le bouton
			// MessageBox("ATTENTION", "Erreur dans la configuration VDDS de DTX !")*
			cb_lancer_scanora_cliniview.enabled = false
		end if
		
end choose

// Histoire de finir l'initialisation du UO 
uo_digora_scanora_cliniview.nom_logiciel = nom_logiciel
end subroutine

on lien_digora_scanora_cliniview.create
this.cb_lancer_scanora_cliniview=create cb_lancer_scanora_cliniview
this.st_titre=create st_titre
this.cb_supprimer=create cb_supprimer
this.cb_modifier=create cb_modifier
this.cb_ajouter=create cb_ajouter
this.Control[]={this.cb_lancer_scanora_cliniview,&
this.st_titre,&
this.cb_supprimer,&
this.cb_modifier,&
this.cb_ajouter}
end on

on lien_digora_scanora_cliniview.destroy
destroy(this.cb_lancer_scanora_cliniview)
destroy(this.st_titre)
destroy(this.cb_supprimer)
destroy(this.cb_modifier)
destroy(this.cb_ajouter)
end on

event constructor;// allocation mem pour obj uo_digora_scanora_cliniview
uo_digora_scanora_cliniview = create uo_lien_digora_scanora_cliniview



end event

event destructor;destroy uo_digora_scanora_cliniview

end event

type cb_lancer_scanora_cliniview from commandbutton within lien_digora_scanora_cliniview
integer x = 210
integer y = 68
integer width = 494
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Lancer Scanora"
end type

event clicked;double v_code_local
v_code_local = dw_fiche_ad.getitemnumber(dw_fiche_ad.getrow(), "code")



if (type_lien = "C" and mode_vdds) or DTX then
	// Mode VDDS de Cliniview ou DTX => Acquisition.exe
	uo_lien_radios lien_radios
	lien_radios = create uo_lien_radios
	if lien_radios.init(5) = 1 then
		lien_radios.prepa_fichier_ini_vdds("Creer", nom_lien_vdds)
		lien_radios.lancer_lien( v_code_local )
	end if
		
else
	if uo_digora_scanora_cliniview.open_connection_scanora_cliniview() = 1 then
	
		// ou doit on mette le .ini 
		Dossier_Scanora_cliniview_ini = uo_digora_scanora_cliniview.get_dossier_scanora_cliniview_ini()
		
		if Dossier_Scanora_cliniview_ini <> '-1' then 	// Message d'erreur géré dans la fonction
			
			
			string fichier_scanora_cliniview_ini 
			string v_praticien, v_correspondant 
			
			fichier_scanora_cliniview_ini = Dossier_Scanora_cliniview_ini + "\"+ nom_logiciel + ".ini"
			
			// Ecriture des éléments du patient à l'intérieur du fichier.ini !!!
			
			v_code_local = dw_fiche_ad.getitemnumber(dw_fiche_ad.getrow(), "code")
			
			// Recherche du patricien et du correspondant
			select correspondants.nom, prati.nom into :v_correspondant, :v_praticien  from correspondants, prati, patient 
			where patient.code = :v_code_local and patient.code_praticien = prati.code and patient.code_correspondant = correspondants.code ;
			
			// Utilisation de l'interface 
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","USE_PRACTICE_MANAGEMENT", "1")
			
			// code du patient (identifiant unique) 
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","PATID", string(v_code_local))
			
			// Restd des champs 
			
			// Nom
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","PATLNAME",  string_non_nulle(trim(dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "nom"))))
			// Initiales
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","PATMNAME", "")
			// PréNom
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","PATFNAME",  string_non_nulle(trim(dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "prenom"))))
			// Socsec
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","PATSOCSEC",  "0")
	
			// GENDER ?
			if dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "sexe") = "M" then
				istr_sexe = "male"
			else
				istr_sexe = "female"
			end if
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","PATGENDER",  istr_sexe)
			
			
			// PATDB
			istr_naissance		= string(dw_fiche_ad.getitemdate(dw_fiche_ad.getrow(), "date_naissance"), "yyyymmdd")
			if isnull(istr_naissance) then istr_naissance = ""
			if istr_naissance = "1900-01-01" then istr_naissance = ""
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","PATBD",  istr_naissance)
			
			
			// PROVIDER1 => nom du praticien
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","PROVIDER1",  string_non_nulle (v_praticien))
			// PROVIDER2
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","PROVIDER2",  string_non_nulle (v_correspondant))
			// ADDRESSE1
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","ADDRESS1",  string_non_nulle(trim(dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "adr1_parent1"))))
			// ADDRESSE2
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","ADDRESS2",  string_non_nulle(trim(dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "adr2_parent1"))))
			// CITY
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","CITY",   string_non_nulle(trim(dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "ville_parent1"))))
			// STATE
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","STATE",   "")
			// ZIP
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","ZIP",   string_non_nulle(trim(dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "codep_parent1"))))
	
			// HOMEPHONE 
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","HOMEPHONE",   string_non_nulle(trim(dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "teldom_parent1"))))
			// WORKPHONE
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","WORKPHONE",  string_non_nulle(trim(dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "teltra_parent1"))))
			// EMAIL1
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","EMAIL1",   string_non_nulle(trim(dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "email"))))
			// EMAIL2
			setprofilestring(fichier_scanora_cliniview_ini,"PracticeManagementInterface","EMAIL2",   string_non_nulle(trim(dw_fiche_ad.getitemstring(dw_fiche_ad.getrow(), "email_patient"))))
	
	
			
			// Lancement du soft
			uo_digora_scanora_cliniview.lancer_scanora_cliniview()
			
	
		end if
	end if
end if

end event

type st_titre from statictext within lien_digora_scanora_cliniview
integer x = 41
integer width = 832
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 16777215
string text = "Lien  DIGORA"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type cb_supprimer from commandbutton within lien_digora_scanora_cliniview
integer x = 645
integer y = 72
integer width = 311
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Supprimer"
end type

event clicked;digora(supprimer)
end event

type cb_modifier from commandbutton within lien_digora_scanora_cliniview
integer x = 325
integer y = 72
integer width = 311
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Lancer"
end type

event clicked;digora(modifier)
end event

type cb_ajouter from commandbutton within lien_digora_scanora_cliniview
integer x = 5
integer y = 72
integer width = 311
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;digora(ajouter)
end event

