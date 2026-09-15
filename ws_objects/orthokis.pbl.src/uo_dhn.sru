$PBExportHeader$uo_dhn.sru
forward
global type uo_dhn from userobject
end type
type p_status from picture within uo_dhn
end type
end forward

global type uo_dhn from userobject
integer width = 219
integer height = 200
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_status p_status
end type
global uo_dhn uo_dhn

type variables


double var_code_local
string status
string v_nom_prg = "eSanteLuxembourg"
string v_nom_prg_complet, v_nom_retours_complet
string v_secu_patient

string v_nom_patient, v_prenom_patient, v_telephone, v_citizen_id

window v_fenetre_parent
end variables

forward prototypes
public subroutine imprimer ()
public function integer verif_erreur ()
public subroutine mettre_a_jour ()
public subroutine creer ()
public subroutine check ()
public subroutine maj_infos_patient ()
public subroutine init (double v_code, window v_window_parent)
end prototypes

public subroutine imprimer ();
// Impression du patient
string fic_ini
integer num_fic_ini

fic_ini = dir_ini + "patient.ini"

num_fic_ini = fileOpen(fic_ini, LineMode!, Write!, LockWrite!, Replace!)
FileWrite(num_fic_ini, "  ")
FileClose(num_fic_ini)	

maj_infos_patient()

SetProfileString( fic_ini , "Patient", "matricule", v_secu_patient)

open(w_patience)
runwait( v_nom_prg_complet +" patient print", 0) 
close(w_patience)

// Juste pour afficher message si besoin
if verif_erreur() = 1 then
	MessageBox("INFORMATION","La fiche eSanté du patient a été imprimée !")
end if
	


end subroutine

public function integer verif_erreur ();// analyse des retours
// renvoie 1 si pas d'erreur, 0 sinon

integer v_nb_erreurs, v_cpt_erreur
string v_codeErreur, v_lib_code_erreurs, v_lib_erreurs
string v_missing_Params = ""
string v_incorrect_Params = ""
string v_lu
integer cpt
boolean fin
v_codeErreur = ProfileString(v_nom_retours_complet, "retour" , "codeErreur", "")

choose case v_codeErreur 
	case "0"
		return 1
	case "1"  
		v_lib_code_erreurs = ProfileString(dir_ini + v_nom_prg +".ini", "retour" , "code" , "")
		v_lib_erreurs = ProfileString(dir_ini + v_nom_prg +".ini", "retour" , "libelleErreur" , "")
		
		fin = false 
		cpt = 1
		do while not fin
			v_lu = ProfileString(dir_ini + v_nom_prg +".ini", "missingParams" , string(cpt) , "")
			if v_lu = "" then
				fin = true
			else
				if v_missing_Params = "" then
					v_missing_Params = "~n~nMissing Params : "
				end if
				v_missing_Params = v_missing_Params + "~n- " +  v_lu
				cpt  = cpt + 1
			end if
		loop
		
		fin = false 
		cpt = 1
		do while not fin
			v_lu = ProfileString(dir_ini + v_nom_prg +".ini", "incorrectParams" , string(cpt) , "")
			if v_lu = "" then
				fin = true
			else
				if v_incorrect_Params = "" then
					v_incorrect_Params = "~n~nIncorrect Params : "
				end if
				v_incorrect_Params = v_incorrect_Params + "~n- " +  v_lu
				cpt  = cpt + 1
			end if
		loop
		
		
		Messagebox("ATTENTION !", "Erreur : " + v_lib_code_erreurs + "~n~n" +  v_lib_erreurs + v_missing_Params + v_incorrect_Params)
		return 0
	case "2"
		v_nb_erreurs = ProfileInt(v_nom_retours_complet, "retour" , "nb_erreurs", 0)
	
		if v_nb_erreurs > 0 then 
			if v_nb_erreurs = 1 then
				v_lib_erreurs = "1 erreur a été détecté : ~n"
			else
				v_lib_erreurs = string(v_nb_erreurs) + " erreurs ont été détectées : ~n"
			end if
			
			for v_cpt_erreur = 1 to v_nb_erreurs
				v_lib_erreurs = v_lib_erreurs + "~n- " + ProfileString(dir_ini + v_nom_prg +".ini", "retour" , "erreur_" + string(v_cpt_erreur), "")
			next
			
			Messagebox("ATTENTION !", v_lib_erreurs)
			return 0
		end if
end choose

return 0
end function

public subroutine mettre_a_jour ();
// Impression du patient
string fic_ini
integer num_fic_ini

fic_ini = dir_ini + "patient.ini"

num_fic_ini = fileOpen(fic_ini, LineMode!, Write!, LockWrite!, Replace!)
FileWrite(num_fic_ini, "  ")
FileClose(num_fic_ini)	

maj_infos_patient()

SetProfileString( fic_ini , "Patient", "matricule", v_secu_patient)
SetProfileString( fic_ini , "Patient", "nom", v_nom_patient)
SetProfileString( fic_ini , "Patient", "prenom", v_prenom_patient)
SetProfileString( fic_ini , "Patient", "telephone", v_telephone)
SetProfileString( fic_ini , "Patient", "langue", "french")
SetProfileString( fic_ini , "Patient", "citizen_id", v_citizen_id)
	
	
open(w_patience)
runwait( v_nom_prg_complet +" patient update", 0) 
close(w_patience)

// Juste pour afficher message si besoin
if verif_erreur() = 1 then
	MessageBox("INFORMATION","La fiche eSanté du patient a été mise à jour !")
end if
	
end subroutine

public subroutine creer ();// Impression du patient
string fic_ini
integer num_fic_ini

fic_ini = dir_ini + "patient.ini"

num_fic_ini = fileOpen(fic_ini, LineMode!, Write!, LockWrite!, Replace!)
FileWrite(num_fic_ini, "  ")
FileClose(num_fic_ini)	


maj_infos_patient()

SetProfileString( fic_ini , "Patient", "matricule", v_secu_patient)
SetProfileString( fic_ini , "Patient", "nom", v_nom_patient)
SetProfileString( fic_ini , "Patient", "prenom", v_prenom_patient)
SetProfileString( fic_ini , "Patient", "telephone", v_telephone)
SetProfileString( fic_ini , "Patient", "langue", "french")
SetProfileString( fic_ini , "Patient", "citizen_id", v_citizen_id)
	
	
open(w_patience)
runwait( v_nom_prg_complet +" patient create", 0) 
close(w_patience)

// Juste pour afficher message si besoin
if verif_erreur() = 1 then
	MessageBox("INFORMATION","La fiche eSanté du patient a été créée !")
end if
	
end subroutine

public subroutine check ();
// recherche du status
string fic_ini
integer num_fic_ini

fic_ini = dir_ini + "patient.ini"

num_fic_ini = fileOpen(fic_ini, LineMode!, Write!, LockWrite!, Replace!)
FileWrite(num_fic_ini, "  ")
FileClose(num_fic_ini)	

maj_infos_patient()

SetProfileString( fic_ini , "Patient", "matricule", v_secu_patient)
	
open(w_patience)
runwait( v_nom_prg_complet +" patient check", 0) 
close(w_patience)


if verif_erreur() = 1  then 
	// En fonction du retour on affiche le statut
	status = ProfileString(v_nom_retours_complet , "retour", "activationStatus" , "")
	
	choose case status
		case "ACTIVATED"	// Actived
			p_status.PictureName = "dhn_a.png"
			p_status.PowerTipText = "Activé en eSanté"
		case "NOT_ACTIVATED" // Not Actived
			p_status.PictureName = "dhn_na.png"
			p_status.PowerTipText = "Non Activé en eSanté"
		case "NOT_EXISTING_IN_ESANTE" // Not existing
			p_status.PictureName = "dhn_ne.png"
			p_status.PowerTipText = "N'existe pas en eSanté"
	end choose
	
	Messagebox("Status eSanté du patient", p_status.PowerTipText)
end if
end subroutine

public subroutine maj_infos_patient ();select isnull(secu_patient, '') , isnull(nom, '') , isnull(prenom, '') , isnull(portable_patient,  isnull(portable,  isnull(teldom_parent1, '') )) , trim(isnull(numero_piece_identite, '') )
into :v_secu_patient , :v_nom_patient, :v_prenom_patient, :v_telephone, :v_citizen_id
from patient where code = :var_code_local ;

if left(v_telephone, 2) = "00" then 
	v_telephone = "+" + mid(v_telephone, 3, len(v_telephone) - 2)
end if

// on ne garde que les 4 derniers chiffres
v_citizen_id = right(v_citizen_id, 4)

end subroutine

public subroutine init (double v_code, window v_window_parent);

var_code_local = v_code


v_nom_prg_complet = dir_ini + v_nom_prg +".exe"
v_nom_retours_complet = dir_ini + v_nom_prg +".ini"

v_fenetre_parent = v_window_parent

end subroutine

on uo_dhn.create
this.p_status=create p_status
this.Control[]={this.p_status}
end on

on uo_dhn.destroy
destroy(this.p_status)
end on

type p_status from picture within uo_dhn
integer width = 210
integer height = 188
string picturename = "dhn_a.png"
boolean focusrectangle = false
string powertiptext = "Statut eSanté inconnu"
end type

event clicked;long menuX, menuY

m_dhn newmenu
newmenu = create m_dhn

uo_esante_luxembourg = parent

menuX = v_fenetre_parent.PointerX() 
menuY = v_fenetre_parent.PointerY() 


if v_fenetre_parent.className() = "w_patient_maj" then
	menuY = menuY+ 500
end if

newmenu.popmenu(menuX, menuY)


end event

event rbuttondown;

this.triggerevent(clicked!)
end event

