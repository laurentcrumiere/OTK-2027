$PBExportHeader$uo_lien_radio_avec_pwo_en_bd_patient.sru
forward
global type uo_lien_radio_avec_pwo_en_bd_patient from nonvisualobject
end type
end forward

global type uo_lien_radio_avec_pwo_en_bd_patient from nonvisualobject
end type
global uo_lien_radio_avec_pwo_en_bd_patient uo_lien_radio_avec_pwo_en_bd_patient

type variables

protected constant string	INI_section	= "Lien"
protected constant string	INI_key_rep	= "rep_radio"
protected constant string	INI_key_exe	= "chemin_exe"

protected constant string programme_default_rep_radio	= "arakis"

protected  string 	programme_exe
protected  string 	programme_default_path
protected  string 	programme_radio

protected int ANSIASCII = 0
protected int ASCIIANSI = 1
end variables

forward prototypes
public function string get_rep_radio ()
public function integer set_rep_radio (string str_rep)
public function string find_programme_exe_path ()
public function string get_programme_exe_path ()
public function string deduire_rep_installation ()
public subroutine open_module (double dbl_num_patient, string str_info_patient)
public function string get_nom_soft_radio ()
public function string get_programme_exe_file ()
public function integer set_programme_exe_path (string str_path_exe)
public function string get_programme_default_path ()
public subroutine init (integer quel_soft)
public function string find_rep_radio ()
public function string ansi-ascii (string texte, integer convertmode)
end prototypes

public function string get_rep_radio ();// fx qui récup le rep radio de config
// path sauvegardé ds fichier pwo_photo.ini
// return une string avec le rep radio
//			une string vide si pb ou rep non config

string	lstr_rephoto, lstr_rep


// recup rep photo
lstr_rephoto = fxg_get_rep_photos()

if lstr_rephoto <> "" then
// si rep photo existe
	// on essaye de récup le rep radio
	lstr_rep = ProfileString(lstr_rephoto + inifile_photo, INI_section, INI_key_rep, "")
	
	// histoire de ...
	if isnull(lstr_rep) then lstr_rep = ""
	
end if

return lstr_rep
end function

public function integer set_rep_radio (string str_rep);// fx qui save le chemin du rep radio ds notre pwo_photo.ini
// path à sauvegarder ds fichier pwo_photo.ini
// et crèe le rep s'il n'existe pas
// return 1 si Ok
//			-1 si pb

int		returnval = -1
boolean	lb_rep_ok
string	lstr_rephoto


if str_rep <> "" then
	// si qqch d'inscrit
	if fxg_fileexists (str_rep) then
	// si le path existe déjà -> maj booléen
		lb_rep_ok = true
		
	else
	// path n'existe pas encore
		if messagebox("Créer répertoire ?", "Souhaitez-vous créer le répertoire de chemin ~n~n'" + str_rep + "' ", Question!, YesNo!) = 1 then
		// si l'utilisateur veut bien le créer
			// si création = ok -> maj du booléen
			if gfx_creer_rep(str_rep) = 1 then lb_rep_ok = true
		end if
		
	end if
else
// rien d'inscrit -> pas une erreur, un choix ! -> maj boolean

	lb_rep_ok = true
end if

if lb_rep_ok then
// si ok pour enregistrer
	// recup rep photo
	lstr_rephoto = fxg_get_rep_photos()
	
	if lstr_rephoto <> "" then
		// si rep photo existe et est valide
		if SetProfileString(lstr_rephoto + inifile_photo, INI_section, INI_key_rep, str_rep) = 1 then
		// si la sauvegarde de ce rep ds pwo_photo.ini = OK
			// maj valeur de retour
			returnval = 1
		end if
	end if
end if

return returnval
end function

public function string find_programme_exe_path ();// fx qui recherche le chemin de l'executable du prog de radiologie
// si .exe su prog présent ds chemin par défaut (cf constante "programme_default_path") -> msg utilisateur demandant si ok
// sinon : ouverture fenêtre de recherche
// return string vide si pb
//			string avec path complet si OK

string	lstr_chemin_exe_complet
boolean	lb_suite
string	ficname, ficpath, repertoire
integer	lgname, lgpath


// init du path complet
lstr_chemin_exe_complet = programme_default_path + programme_exe

if FileExists(lstr_chemin_exe_complet) then
// si le fichier existe ds le chemin d'installation par défaut
	if messagebox("Chemin d'accès à " + programme_radio, "Le fichier exécutable de " + programme_radio + " est présent dans le ~nrépertoire '" + programme_default_path + "'. ~n~nCela vous convient-il ? ", Question!, YesNo! ) = 1 then
	// si on veux changer ce chemin -> maj booléen
		lb_suite = true
	end if
end if

if not lb_suite then
// si on doit lancer la fenêtre de recherche de fichier
	if GetFileOpenName("Recherche de '" + programme_exe + "'", lstr_chemin_exe_complet, ficname, "EXE", "Fichiers Exécutable (*.exe), *.exe") <> 1 then
	// si un pb ou on annule -> réinit de lstr_chemin_exe_complet
		lstr_chemin_exe_complet = ""
	end if
end if

return lstr_chemin_exe_complet

end function

public function string get_programme_exe_path ();// fx qui permet de retrouver le path complet du .exe de l'application de radiologie
// cette donnée est sauvegardée ds orthokis.ini
// return le path complet du .exe si ok
//			chaine vide si pb ou rien d'indiquer

string	lstr_rephoto, lstr_exe_path


// si rep photo existe -> on récup path complet de .exe
lstr_exe_path = ProfileString(DIR_INI + inifile_orthokis, INI_section, INI_key_exe, "")

// pour être sur
if isnull(lstr_exe_path) then lstr_exe_path = ""

return lstr_exe_path
end function

public function string deduire_rep_installation ();// fx qui déduit le rep d'install du soft de radio
// à partir du path de l'exe sauegardé ds orthokis.ini
// return le path si ok ou
//			chaine vide si encore rien de param

string	lstr_exepath


// recup path de l'exe ds orthokis.ini
lstr_exepath = get_programme_exe_path()

if lstr_exepath <> "" then
// si qqch de récup
	lstr_exepath = left(lstr_exepath, len(lstr_exepath) - len(programme_exe))
end if

return lstr_exepath
end function

public subroutine open_module (double dbl_num_patient, string str_info_patient);// procédure qui ouvre le module de manipulation radio

string	lstr_rep_radio
string	lstr_ligne_cmd
boolean	lb_msg_erreur


// recup chemin du .exe du soft de radio
lstr_ligne_cmd = get_programme_exe_path()

if lstr_ligne_cmd <> "" then
// si un path pour l'exe de défini ...

	// recup du rep radio
	lstr_rep_radio = get_rep_radio()
	
	if lstr_rep_radio <> "" then
	// si un path pour rep radios de défini ...
		// on complète la ligne de cmd
		lstr_ligne_cmd += ' -P"' + lstr_rep_radio + string(dbl_num_patient) + '" -N"' + left(str_info_patient, 80) + '"'
		
		if run(lstr_ligne_cmd, Maximized!) <> 1 then
		// si pb lors du lancement ligne de cmd -> msg d'erreur
			messagebox("ATTENTION ...", "Impossible de lancer le module " + get_nom_soft_radio() + ". ~n~nVeuillez contacter ARAKIS.", StopSign!)
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
	messagebox("ATTENTION ...", "Impossible de poursuivre ! ~n~nConfiguration du lien non effectuée, ~nou répertoire photo d'Orthokis non indiqué, ~nou problème de réseau.", StopSign!)
end if

end subroutine

public function string get_nom_soft_radio ();// fx qui return la nom du soft de radio
// à savoir la var "programme_radio"

return programme_radio
end function

public function string get_programme_exe_file ();return programme_exe
end function

public function integer set_programme_exe_path (string str_path_exe);// fx qui save le chemin du .exe ds notre fichier pwophotos.ini
// à sauvegarder ds le fichier orthokis.ini
// return 1 si Ok
//			-1 si pb

int		returnval = -1
boolean	lb_rep_ok
string	lstr_rephoto


if str_path_exe <> "" then
// si qqch d'inscrit
	if fxg_fileexists (str_path_exe) then
	// si l'exe existe bel et bien à ce path -> maj boolean
		lb_rep_ok = true
	end if
else
// rien d'inscrit -> pas une erreur, un choix ! -> maj boolean
	lb_rep_ok = true
end if

if lb_rep_ok then
// si on doit sauvegarder
	if SetProfileString(DIR_INI + inifile_orthokis, INI_section, INI_key_exe, str_path_exe) = 1 then
	// si la sauvegarde de ce rep ds orthokis.ini = OK
		// maj valeur de retour
		returnval = 1
	end if
end if

return returnval
end function

public function string get_programme_default_path ();// return la constante 
return programme_default_path
end function

public subroutine init (integer quel_soft);// fx qui init les var local concernant tel ou tel soft de radio

choose case quel_soft
	case radio_trophy
		programme_exe				= "Tw.exe"
		programme_default_path	= "C:\TW\"
		programme_radio 			= "TROPHY (KODAK)"
	case radio_mediadent
		programme_exe				= "Mediadent.exe"
		programme_default_path	= "C:\Program Files\Catapult\Mediadent\"
		programme_radio 			= "MEDIADENT"
	case radio_sidexis
		programme_exe				= "Sidexis.exe"
		programme_default_path	= "C:\SIDEXIS\"
		programme_radio 			= "SIDEXIS (SIRONA)"
	case radio_durrdental
		programme_exe				= "Dbswin.exe"
		programme_default_path	= "C:\DBSWIN\BIN\"
		programme_radio 			= "DBSWIN (DURR DENTAL)"
	case radio_vixwin
		programme_exe				= "VixWin.exe"
		programme_default_path	= "C:\vixwin\"
		programme_radio 			= "VIXWIN (GENDEX)"
	case radio_cliniview
		programme_exe				= ""	// inutile
		programme_default_path	= ""	// inutile
		programme_radio 			= "CliniView (INSTRUMENTARIUM)"
end choose
end subroutine

public function string find_rep_radio ();// fx qui propose un rep radio par défaut "arakis" ds 
// rep d'installation du prog de radiologie
// return string vide si impossible de trouver ou de déduire le rep d'installation du soft
//			string avec path complet si OK

string	lstr_chemin_exe_complet
string	lstr_path


// recup du chemin éventuellement déjà param
lstr_path = deduire_rep_installation()

if lstr_path = "" then
// si pas encore param
	if FileExists(programme_default_path + programme_exe) then
	// si le fichier .exe existe ds le chemin d'installation par défaut -> on recup donc ce chemin d'installation
		lstr_path = programme_default_path
	end if
end if

if lstr_path <> "" then
// si maintenant on a bien un rep
	if messagebox("Répertoire Radios ...", "Nous vous proposons le répertoire ~nradios suivant : ~n~n" + lstr_path + programme_default_rep_radio + "~n~nCela vous convient-il ?", Question!, YesNo! ) = 1 then
	// si utilisateur = OK
		lstr_path += programme_default_rep_radio
	else
	// l'utilisateur ne veut pas du rep proposé -> on remet à ""
		lstr_path = ""
	end if
end if

return lstr_path

end function

public function string ansi-ascii (string texte, integer convertmode);// fx de conversion string ASCII --> ANSI ou ANSI --> ASCII

string ASCI
string ANSI
string Src
string Dest

int I
int Pos

ASCI = CharA(132) + CharA(148) + CharA(129) + CharA(225) + CharA(142) + CharA(153) + CharA(154) + CharA(128) + CharA(130) + CharA(131) + CharA(133) + CharA(134) + CharA(135) + CharA(136) + CharA(137) + CharA(138) + CharA(139) + CharA(140) + CharA(143) + CharA(144) + CharA(147) + CharA(150) + CharA(151) + CharA(20) + CharA(145) + CharA(146) + CharA(155) + CharA(156) + CharA(166) + CharA(167) + CharA(171) + CharA(172) + CharA(237) + CharA(241) + CharA(246) + CharA(253) + CharA(21) + CharA(157)
ANSI = CharA(228) + CharA(246) + CharA(252) + CharA(223) + CharA(196) + CharA(214) + CharA(220) + CharA(199) + CharA(233) + CharA(226) + CharA(224) + CharA(229) + CharA(231) + CharA(234) + CharA(235) + CharA(232) + CharA(239) + CharA(238) + CharA(197) + CharA(201) + CharA(244) + CharA(251) + CharA(249) + CharA(182) + CharA(230) + CharA(198) + CharA(162) + CharA(163) + CharA(170) + CharA(186) + CharA(189) + CharA(188) + CharA(216) + CharA(177) + CharA(247) + CharA(178) + CharA(167) + CharA(165)

    If ConvertMode = 0 Then // ANSI2ASCII
        Src = ANSI
        Dest = ASCI
    Else                    // ASCII2ANSI
        Src = ASCI
        Dest = ANSI
    End If
    
	 
    For I = 1 To LenA(Src)
	  pos = 0
        Do
			Pos = posA(Texte, midA(Src, I, 1) , pos + 1)
			if not Pos =  0 then 
				texte = leftA(texte,pos - 1) + midA(Dest, I, 1) + midA(texte,pos+1)
				//Replace(texte, pos,1,mid(Dest, I, 1))
			end if
		Loop while not Pos =  0
    Next

return Texte
end function

on uo_lien_radio_avec_pwo_en_bd_patient.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_lien_radio_avec_pwo_en_bd_patient.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

