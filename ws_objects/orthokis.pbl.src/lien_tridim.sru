$PBExportHeader$lien_tridim.sru
forward
global type lien_tridim from userobject
end type
type cb_ajouter from picturebutton within lien_tridim
end type
end forward

global type lien_tridim from userobject
integer width = 128
integer height = 112
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_ajouter cb_ajouter
end type
global lien_tridim lien_tridim

type prototypes

end prototypes

type variables

// Contient les infos du patient
datawindow dw_patient

constant string tridim_cle_base_registre = "HKEY_LOCAL_MACHINE\SOFTWARE\Dentasia\TriDim"
constant string tridim_valeur_base_registre = "SHAREDDIR"


OleObject TridimObject
OleObject DelaireObject

constant string tridim_serveur_ole = "TriDim.TriDimOLE"
constant string delaire_serveur_ole = "Delaire.OLEServer"


string Delaire_ou_Tridim			// Vaudra D ou T ou "" selon le logiciel installé
string libelle_logiciel

end variables

forward prototypes
public function integer connection_tridim ()
public function integer close_connection_tridim ()
public subroutine activer_tridim ()
public function integer ouvrir_patient_tridim (double v_code, string module)
end prototypes

public function integer connection_tridim ();

// fx qui connecte la var oleoject passée en référence au serveur automation
// return 1 si ok,
// et -1 si pb de connection server
// appel d'une fx générale

int val_retour

Delaire_ou_Tridim = ""

// On teste d'abord sui OK avec DELAIRE ELEMENTS et ensuite avec TRIDIM
val_retour = gfx_open_connection_ole(DelaireObject, delaire_serveur_ole)

If val_retour = -1 then
	val_retour = gfx_open_connection_ole(TridimObject, tridim_serveur_ole)

	If val_retour = -1 then
		MessageBox("ERREUR","Impossible d'utiliser le logiciel Delaire (ou TriDim).~n~nVeuillez vérifier son installation !",StopSign!)
	else
		Delaire_ou_Tridim = "T"
		libelle_logiciel = "Tridim"
	end if
else
	Delaire_ou_Tridim = "D"
	libelle_logiciel = "Delaire"
end if


return val_retour
end function

public function integer close_connection_tridim ();// fx qui se déconnecte proprement du serveur OLE automation
// SANS QUITTER TRIDIM
// appel d'une fx générale

int	returnval = -1

if Delaire_ou_Tridim = "T" then
	returnval = gfx_close_connection_ole(TridimObject)
else
	returnval = gfx_close_connection_ole(DelaireObject)
end if

return returnval
end function

public subroutine activer_tridim ();

if delaire_ou_tridim = "T" then
	TridimObject.activate()
else
	DelaireObject.Maximize()
	DelaireObject.activate()
end if
end subroutine

public function integer ouvrir_patient_tridim (double v_code, string module);

// ouvre un patient dans triDim, selon son nom et son prenom
// Si pas trouvé, il propose de le créer

// module : uniquement pour Delaire : A pour Administratif, I pour Images/Analyses

// renvoie 1 si le patient a bien était ouvert, -1 sinon

integer val_retour = -1
boolean v_suite


// récup des infos du patient
string v_nom, v_prenom, v_sexe
date v_date_naissance
double v_numero_dossier

select nom, prenom, numero_dossier, sexe, date_naissance 
into  :v_nom, :v_prenom, :v_numero_dossier, :v_sexe, :v_date_naissance
from patient 
where code = :v_code ;

if isnull(v_date_naissance) then

	MessageBox("ATTENTION","Le patient "+'"'+v_nom+' '+v_prenom+'"'+" n'a pas de Date de Naissance.~n~nVous devez en saisir une avant de lancer " +libelle_logiciel + ".")

else
	
	if connection_tridim() = 1 then

		if Delaire_ou_Tridim = "T" then
			// logiciel Tridim
			// ouverture du patient par son nom 
			if TridimObject.OpenPatientByName(v_Nom, v_prenom) then
		
				val_retour = 1
				v_suite = false
			else
				v_suite = true
			end if
		else
			// logiciel Delaire
			if module = "A" then
				if DelaireObject.ShowDossierPatientByNumExt(string(v_code)) then
					val_retour = 1
					v_suite = false
				else
					v_suite = true
				end if
			else
				if DelaireObject.ShowAnalysesPatientByNumExt(string(v_code)) then
					val_retour = 1
					v_suite = false
				else
					v_suite = true
				end if
			end if
		end if

else
	v_suite = false
end if
		
	if v_suite then
		
		if Delaire_ou_Tridim = "D" then
			DelaireObject.minimize()
		end if 
		
		if MessageBox("ATTENTION","Le patient "+'"'+v_nom+' '+v_prenom+'"'+" n'existe pas dans "+ libelle_logiciel + ".~n~nVoulez-vous le créer ?",Question!,Yesno!,2) = 1 then
			boolean est_male
			if v_sexe = 'M' then
				est_male = true
			else
				est_male = false
			end if
			if connection_tridim() = 1 then
				if Delaire_ou_Tridim = "T" then
					TridimObject.CreerPatient(v_nom, v_prenom, string(v_numero_dossier), est_male , string(v_date_naissance), "Caucasienne","") 
				else
					// pour passage et recup de paramètre
					param_win[1] = ""
					param_win[2] = ""
					// pour demander éléments complémentaires
					open(w_delaire_type_patient)
					
					DelaireObject.CreatePatientEx(v_nom, v_prenom, string(v_date_naissance, "mm/dd/yyyy"), param_win[1], param_win[2], string(v_numero_dossier), string(v_code), v_sexe , "","") 
					if module = "A" then
						DelaireObject.ShowDossierPatientByNumExt(string(v_code))
					else
						DelaireObject.ShowAnalysesPatientByNumExt(string(v_code))
					end if
				end if
				val_retour = 1
			end if
		end if
	end if
end if

//close_connection_tridim()
return val_retour

end function

on lien_tridim.create
this.cb_ajouter=create cb_ajouter
this.Control[]={this.cb_ajouter}
end on

on lien_tridim.destroy
destroy(this.cb_ajouter)
end on

type cb_ajouter from picturebutton within lien_tridim
integer width = 128
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_icone_delaire.png"
alignment htextalign = left!
end type

event clicked;
if dw_patient.rowcount() > 0 then

	// récup des infos de la dw
	double v_code
	
	v_code = dw_patient.getitemNumber(1,"code")


	if ouvrir_patient_TriDim(v_code, "A") = 1 then
	
		activer_tridim()
		
	end if
	
end if
end event

