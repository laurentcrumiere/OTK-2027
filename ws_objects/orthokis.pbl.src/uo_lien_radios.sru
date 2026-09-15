$PBExportHeader$uo_lien_radios.sru
forward
global type uo_lien_radios from userobject
end type
end forward

global type uo_lien_radios from userobject
integer width = 855
integer height = 524
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type
global uo_lien_radios uo_lien_radios

type variables



string nom_exe_lien_radios,  nom_ini_lien_radios 


integer numero_type_lien 			//	vaudra 1 pour carestream
string libelle_type_lien

end variables

forward prototypes
public function integer init (integer v_type_lien)
public subroutine prepa_fichier_ini_carestream (string v_action)
public subroutine lancer_lien (double v_code_patient)
public subroutine prepa_fichier_ini_owandy (string v_action)
public subroutine prepa_fichier_ini_vatech (string v_action)
public subroutine prepa_fichier_ini_vdds (string v_action, string v_nom_lien_vdds)
end prototypes

public function integer init (integer v_type_lien);

choose case v_type_lien
	case 1 
		libelle_type_lien = "CARESTREAM"
		
	case 2 
		libelle_type_lien = "OWANDY"


	case 3 
		libelle_type_lien = "VATECH"
		
	case 4 
		// pour les moulages
		libelle_type_lien = "CARESTREAM3D"
		
	case 5 
		libelle_type_lien = "VDDS"
		
end choose


trace ("Type de lien radio : " + libelle_type_lien)

nom_exe_lien_radios = dir_ini + "acquisition.exe"
nom_ini_lien_radios = dir_ini +  "acquisition_lien.ini"


if not fileExists (nom_exe_lien_radios ) then
	MessageBox("ATTENTION","Impossible de localiser l'utilitaire d'acquisition (" + nom_exe_lien_radios + ").~n~nOpération annulée.")
	return 0
else
	return 1
end if
end function

public subroutine prepa_fichier_ini_carestream (string v_action);// Ecriture ce qu'il faut

integer numero_fichier_ini

numero_fichier_ini = FileOpen(nom_ini_lien_radios, LineMode! , Write!, LockWrite!, Replace!)
FileWrite(numero_fichier_ini, "[CARESTREAM]")
FileWrite(numero_fichier_ini, "Mode=Light")
FileWrite(numero_fichier_ini, "PathExe=" + profilestring(dir_ini+inifile_orthokis,"lien","chemin_exe","")  )
FileWrite(numero_fichier_ini, "PathDatas=" + profilestring(dir_photos + inifile_photo,"Lien","rep_radio","")  )
FileWrite(numero_fichier_ini, "Action=" + v_action)
FileClose(numero_fichier_ini)

end subroutine

public subroutine lancer_lien (double v_code_patient);
boolean v_suite = true

if libelle_type_lien = "VATETCH" then
	string v_sexe 
	select isnull(sexe, '') into :v_sexe from patient where code = :v_code_patient ;
	if v_sexe = "" then
		v_suite = false
	end if
end if
	
if v_suite then
	string v_param, v_fichier_image
	
	// photos administrative du patient
	uo_choix_image_2013 choix_image_2013
	choix_image_2013 = create uo_choix_image_2013
	v_fichier_image = choix_image_2013.trouver_image ("identite_administrative", v_code_patient)


	v_param = " ORTHOKIS#OUI#" + dir_photos + "#" + string(v_code_patient) + "#" + v_fichier_image +  "#" + libelle_type_lien+ "#" + nom_ini_lien_radios + "#"
	
	
	
	// Lancement
	
	if libelle_type_lien = "CARESTREAM3D" then
		// Faut ajouter le user ORTHOKIS
		v_param = v_param + utilisateur_code
		runwait (nom_exe_lien_radios + v_param  , 1 )
	else
		run (nom_exe_lien_radios + v_param  )
	end if
	
	trace("Commande exécutée : " + nom_exe_lien_radios + v_param)
	
	//runwait (nom_exe_lien_radios + v_param  , 1 )

end if
end subroutine

public subroutine prepa_fichier_ini_owandy (string v_action);// Ecriture ce qu'il faut

integer numero_fichier_ini

numero_fichier_ini = FileOpen(nom_ini_lien_radios, LineMode! , Write!, LockWrite!, Replace!)
FileWrite(numero_fichier_ini, "[OWANDY]")
FileWrite(numero_fichier_ini, "Mode=Light")
FileWrite(numero_fichier_ini, "PathExe=" + ProfileString(dir_ini + inifile_orthokis, "Liens_Radios_2015", "exe", "") )
FileWrite(numero_fichier_ini, "Action=" + v_action)
FileClose(numero_fichier_ini)

end subroutine

public subroutine prepa_fichier_ini_vatech (string v_action);// Ecriture ce qu'il faut

integer numero_fichier_ini

numero_fichier_ini = FileOpen(nom_ini_lien_radios, LineMode! , Write!, LockWrite!, Replace!)
FileWrite(numero_fichier_ini, "[VATECH]")
FileWrite(numero_fichier_ini, "Mode=Light")
FileWrite(numero_fichier_ini, "PathExe=" + ProfileString(dir_ini + inifile_orthokis, "Liens_Radios_2015", "exe", "") )
FileWrite(numero_fichier_ini, "Action=" + v_action)
FileClose(numero_fichier_ini)

end subroutine

public subroutine prepa_fichier_ini_vdds (string v_action, string v_nom_lien_vdds);// Ecriture ce qu'il faut

integer numero_fichier_ini


trace("Commande VDDS :     Nom du lien : " +   v_nom_lien_vdds     +" Action : " + v_action )

numero_fichier_ini = FileOpen(nom_ini_lien_radios, LineMode! , Write!, LockWrite!, Replace!)
FileWrite(numero_fichier_ini, "[VDDS]")
FileWrite(numero_fichier_ini, "Action=" + v_action)
FileWrite(numero_fichier_ini, "Lien=" + v_nom_lien_vdds)
FileClose(numero_fichier_ini)

end subroutine

on uo_lien_radios.create
end on

on uo_lien_radios.destroy
end on

