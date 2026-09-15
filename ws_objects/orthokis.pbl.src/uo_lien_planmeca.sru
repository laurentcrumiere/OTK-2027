$PBExportHeader$uo_lien_planmeca.sru
forward
global type uo_lien_planmeca from nonvisualobject
end type
end forward

global type uo_lien_planmeca from nonvisualobject
end type
global uo_lien_planmeca uo_lien_planmeca

type prototypes

Function ulong DxStart() library "PmBridge.dll"
Function ulong DxExit() library "PmBridge.dll"

Function ulong DxInsertPatient (string PatientId, string PatientFamilyName, string PatientFirstName,string PatientBirthDate, string Doctor)  library "PmBridge.dll" alias for "DxInsertPatient;Ansi"
Function ulong DxUpdatePatient (string PatientId, string PatientFamilyName, string PatientFirstName,string PatientBirthDate, string Doctor)  library "PmBridge.dll" alias for "DxUpdatePatient;Ansi"
Function ulong DxDeletePatient (string PatientId)   library "PmBridge.dll" alias for "DxDeletePatient;Ansi"
Function ulong DxSelectPatient (string PatientId, ref integer NbImages)   library "PmBridge.dll" alias for "DxSelectPatient;Ansi"


// pour romexis
Function ulong DxUpdatePatient_ex (string PatientId, string PatientFamilyName, string PatientFirstName,string PatientBirthDate, string Doctor, char Sex)  library "PmBridge.dll" alias for "DxUpdatePatient_ex;Ansi"
Function ulong DxInsertPatient_ex (string PatientId, string PatientFamilyName, string PatientFirstName,string PatientBirthDate, string Doctor, char Sex)  library "PmBridge.dll" alias for "DxInsertPatient_ex;Ansi"

Function ulong DxSelectImage() library "PmBridge.dll"

Function ulong DxInquireImage (integer index, ref long ArrayImage[20], integer ArrayToothMask[])   library "PmBridge.dll"

Function ulong DxGetImage (integer index, integer ConvertToBit, integer Enhance, integer FileFormat,  string FileName )   library "PmBridge.dll" alias for "DxGetImage;Ansi"

Function ulong DxSetWindowPlacement (ulong Mode)   library "PmBridge.dll" alias for "DxSetWindowPlacement;Ansi"


FUNCTION ulong GetCurrentDirectoryA(ulong BufferLen, ref string currentdir) LIBRARY "Kernel32.dll" alias for "GetCurrentDirectoryA;Ansi"
FUNCTION boolean SetCurrentDirectoryA(ref string cdir) LIBRARY "kernel32.dll" alias for "SetCurrentDirectoryA;Ansi"

end prototypes

type variables
string dir_origine	// répertoire d'origine

// Vaudra D si lien sur le N° de dossier d'Orthokis
// Vaudra I si lien sur le code interne d'Orthokis
char v_code_lien_radio
end variables

forward prototypes
public function integer connexion_dimaxis ()
public subroutine fermer_dimaxis ()
end prototypes

public function integer connexion_dimaxis ();string dir_planmeca = ''
ulong l_buf, err
integer erreur_retour	

string dir_pmbridge

// Initialisation du répertoire d'origine
l_buf = 100
dir_origine = space(l_buf)
GetCurrentDirectoryA(l_buf, dir_origine)


// Attention, depuis le 4/5/2009 on recherche si ROMEXIS ou DIMAXIS ?
// => MISE A JOUR DE LA VARIABLE GLOBALE logiciel_planmeca

RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Planmeca\romexis","pmbridge",dir_pmbridge)

logiciel_planmeca = "?"


if len(trim(dir_pmbridge)) > 0 then
	// C'est Romexis qui est installé

	erreur_retour = 0 // pas d'erreur

	// Recherche du répertoire d'installation de ROMEXIS
	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\dimaxis.exe","path",dir_planmeca)
	
	dir_pmbridge = dir_pmbridge + '\'

	// On verifie l'existence de la dll PmBridge
	if fileexists(dir_pmbridge+"pmbridge.dll") then
	
		// Le répertoire de la DLL devient devient courrant
		SetCurrentDirectoryA(dir_pmbridge)


		err = DxStart()
		
		if err <> 0 then
			MessageBox("ATTENTION !","Erreur N°"+string(err)+" en lancement de la base ROMEXIS.")
			erreur_retour = -1
		end if
		
		logiciel_planmeca = "R"
		
	else
		MessageBox("ATTENTION !","Impossible de localiser la bibliothèque PmBridge.dll !~n~nLien Impossible !")
		erreur_retour = -2
	end if


else

	// Recherche du répertoire d'installation de planmeca
	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\dimaxis.exe","path",dir_planmeca)

	erreur_retour = 0 // pas d'erreur
	
	if not isnull(dir_planmeca) and dir_planmeca <> "" then
	
		dir_pmbridge = dir_planmeca+"\Program\"
		
		
		// On verifie l'existence de la dll PmBridge
		if fileexists(dir_pmbridge+"pmbridge.dll") then
		
			// Le répertoire de PlanMeca devient courrant
			SetCurrentDirectoryA(dir_pmbridge)
			
			err = DxStart()
			
			if err <> 0 then
				MessageBox("ATTENTION !","Erreur N°"+string(err)+" en lancement de la base DIMAXIS.")
				erreur_retour = -1
			end if
			
			logiciel_planmeca = "D"
		else
			MessageBox("ATTENTION !","Impossible de localiser la bibliothèque PmBridge.dll !~n~nLien Impossible !")
			erreur_retour = -2
		end if
	else
			MessageBox("ATTENTION !","Le logiciel Dimaxis n'est pas installé sur votre micro-ordinateur !~n~nLien Impossible !")
			erreur_retour = -3
	end if
end if

return erreur_retour
end function

public subroutine fermer_dimaxis ();Dxexit()
end subroutine

on uo_lien_planmeca.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_lien_planmeca.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;

// pour savoir quel code on utilise dans DIMAXIS

select min(code_lien_radio) into :v_code_lien_radio from param ;


end event

