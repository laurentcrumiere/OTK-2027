$PBExportHeader$uo_lien_vixwin.sru
forward
global type uo_lien_vixwin from uo_lien_radio_avec_pwo_en_bd_patient
end type
end forward

global type uo_lien_vixwin from uo_lien_radio_avec_pwo_en_bd_patient
end type
global uo_lien_vixwin uo_lien_vixwin

type variables
constant string inifile_vixwin				= "VixWin.ini"
constant string inifile_vixwin_section	= "System"
constant string inifile_vixwin_key		= "Database"

constant string reg_vixwin_key			= "HKEY_CURRENT_USER\Software\Gendex\VixWin32\Database"
constant string reg_vixwin_valuename	= "Dbmode"

//constant string vixwin_exe						= "VixWin.exe"
//constant string vixwin_default_path			= "C:\vixwin\"
//constant string vixwin_default_rep_radio	= "arakis"

//constant string	INI_section	= "Lien_vixwin"
//constant string	INI_key_rep	= "rep_radio"
//constant string	INI_key_exe	= "chemin_exe"

constant int		vix_pilote		= 0
constant int		vix_autonome	= 1
end variables

forward prototypes
public function integer param_soft (integer int_mode)
public function integer run_vixwin (double dbl_code)
end prototypes

public function integer param_soft (integer int_mode);// fx qui param Vixwin pour être utilisé en mode piloté ou autonome
// pour la bd administrative patient
// return 1 si OK
// 		-1 si non

int		returnvalue = -1
string	lstr_path


// recup du chemin éventuellement déjà param
lstr_path = deduire_rep_installation()

if lstr_path <> "" then
// si bien param
	if SetProfileString(lstr_path + inifile_vixwin, inifile_vixwin_section, inifile_vixwin_key, string(int_mode)) = 1 then
	// si la sauvegarde de ce rep ds orthokis.ini = OK
		if RegistrySet ( reg_vixwin_key, reg_vixwin_valuename, ReguLong!, long(int_mode) ) = 1 then
		// si sauvegarde ds regedit = OK -> maj val retour
			// maj valeur de retour
			returnvalue = 1
//		else
//			messagebox("ATTENTION ...", "Impossible de sauvegarder dans le registre ~nle mode de fonctionnement de " + programme_radio + ".", Exclamation!)
		end if
//	else
//		messagebox("ATTENTION ...", "Impossible de sauvegarder dans le fichier de configuration ~nle mode de fonctionnement de " + programme_radio + ".", Exclamation!)
	end if
end if

return returnvalue
end function

public function integer run_vixwin (double dbl_code);// fx qui ouvre le module de manipulation radio de VixWin sur le bon patient
// return 1 si ok
//		-1 si pb

string	patient_nom, patient_prenom
long	iden_odrade
int		returnval = -1
string	lstr_rep_radio, lstr_ligne_cmd
boolean	lb_msg_erreur, lb_ok
string		lstr_name, lstr_surname, lstr_code, lstr_path_radio_patient
long		llg_hdl_channel


// recup chemin de l'exe
lstr_ligne_cmd = get_programme_exe_path()

if lstr_ligne_cmd <> "" then
// si un path pour l'exe de défini ...

	// recup du rep radio
	lstr_rep_radio = get_rep_radio()
	
	if lstr_rep_radio <> "" then
	// si un path pour rep radios de défini ...
		
//		select	identifiant_odrade, nom, prenom
//		into	:iden_odrade, :patient_nom, :patient_prenom
//		from	patient
//		where	patient.code = :dbl_code ;

		// Depuis la version 2009, le code remplace l'identifiant Odrade
		select	code, nom, prenom
		into	:iden_odrade, :patient_nom, :patient_prenom
		from	patient
		where	patient.code = :dbl_code ;

		if SQLCA.SQLCode = 0 then
		// si pas de pb
			// mise en conformité des val récup
			if isnull( iden_odrade ) then iden_odrade = 0
			if isnull( patient_nom ) then patient_nom = ""
			if isnull( patient_prenom ) then patient_prenom = ""
			
			// on passe en mode piloté
			if param_soft(vix_pilote) = 1 then
				
				if run(lstr_ligne_cmd, Maximized!) = 1 then
				// si exe bien lancé
					sleep(3000)
					
					// init var
					lstr_name		= upper(left(patient_nom, 30)) + space(31 - len(left(patient_nom, 30)))	
					lstr_surname	= upper(left(patient_prenom, 30)) + space(31 - len(left(patient_prenom, 30)))
					lstr_code		= upper("PWOVIX") + space(1)
					
					lstr_path_radio_patient	= lstr_rep_radio + string(iden_odrade)
					lstr_path_radio_patient	= upper(left(lstr_path_radio_patient, 255) + space(256 - len(left(lstr_path_radio_patient, 255)))) + "M"
					
					// ouverture du lien
					llg_hdl_channel = OpenChannel("VIXWIN", "BASIC")
					
					if llg_hdl_channel > 0 then
					// si un handle de récup
						if SetRemote("CONFIGURE", lstr_path_radio_patient, llg_hdl_channel) = 1 then
						// si la conf du rep radio = OK
							if SetRemote("PATIENTS",  lstr_surname + lstr_name + lstr_code, llg_hdl_channel) = 1 then
							// si pas de pb
							sleep(3000)
	//							string	dfg
	//// ça fait planter vixwin	dfg = lstr_surname + lstr_name + lstr_code + "02" + space( 1 ) + "0" + space( 32 ) + space( 257 ) + space( 2 ) + space( 9 )  + space( 201 ) + space( 7 ) + space( 2 ) + space( 2 ) + space( 2 ) + space( 7 ) + space( 7 ) + space( 9 ) + space( 5 ) + space( 7 ) + space( 9 ) + space( 51 ) + space( 21 ) + space( 21 ) + space( 21 ) + space( 21 ) + space( 21 ) + space( 21 )
	////							dfg = lstr_surname + lstr_name + lstr_code + "02" + space( 1 ) + "0" + space( 257 ) + space( 2 ) + space( 9 )  + space( 201 ) + space( 7 ) + space( 2 ) + space( 2 ) + space( 2 ) + space( 7 ) + space( 7 ) + space( 9 ) + space( 5 ) + space( 7 ) + space( 9 ) + space( 51 ) + space( 21 ) + space( 21 ) + space( 21 ) + space( 21 ) + space( 21 ) + space( 21 )
	//							
	//							dfg = char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0) + char(0)
	//
	////							if SetRemote("VIEW_IMAGE", dfg, llg_hdl_channel) <> 1 then messagebox( "test", "ça marche pas")
	//							if SetRemote("QUERY_FIELDS", dfg, llg_hdl_channel) <> 1 then messagebox( "test", "ça marche pas")
								
								lb_ok = true
								returnval = 1
							end if
						end if
						
						if not lb_ok then messagebox("ATTENTION ...", "Impossible d'initialiser VixWin. ~n~nOpération annulée.", StopSign!)
						
						// il faut fermer le lien
						CloseChannel(llg_hdl_channel)
					else
					// pas de connect avec le serveur dde
						messagebox("ATTENTION ...", "Impossible de se connecter à un serveur DDE. ~n~nOpération annulée.", StopSign!)
					end if
					
				end if
				
//				// on revient en mode classic -> si pb, juste un msg
//				if param_soft(vix_autonome) <> 1 then messagebox("ATTENTION ...", "VixWIn ne peut pas revenir en mode automome.", Exclamation!)
				
			else
			// on a pas pu passer en mode piloté -> msg d'erreur
				messagebox("ATTENTION ...", "Impossible de poursuivre ! ~n~nVixWin ne peut pas passer en mode piloté." , StopSign!)
			end if
		else
			messagebox("ERREUR ...", "Impossible de récupérer les informations du patient. ~n~nOpération annulée.", StopSign!)
		end if
	else
	// pb ds récup du rep radio -> maj bool de msg d'erreur
		lb_msg_erreur = true
	end if
	
else
// pas config ou  impossible à récupérer -> maj bool de msg d'erreur
	lb_msg_erreur = true
end if

if lb_msg_erreur then
// si besoin d'un msg d'erreur
	messagebox("ATTENTION ...", "Impossible de poursuivre ! ~n~nConfiguration du lien non effectuée, ~nou répertoire photo d'orthokis non indiqué, ~nou problème de réseaux.", StopSign!)
end if

return returnval
end function

on uo_lien_vixwin.create
call super::create
end on

on uo_lien_vixwin.destroy
call super::destroy
end on

event constructor;call super::constructor;init( radio_vixwin )
end event

