$PBExportHeader$maj_70_60.sra
$PBExportComments$Generated SDI Application Object
forward
global type maj_70_60 from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables


string passe

boolean ok_mdp
end variables

global type maj_70_60 from application
string appname = "maj_70_60"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 21.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = true
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 2
long richtexteditx64type = 3
long richtexteditversion = 1
string richtexteditkey = ""
string appicon = "C:\power\V2023-Evolution\large_transmission.ico"
string appruntimeversion = "25.0.0.3726"
boolean manualsession = false
boolean unsupportedapierror = false
integer highdpimode = 0
end type
global maj_70_60 maj_70_60

type prototypes
// These are Window's SDK Functions

// fonction pour faire une pause dans le prg (delai : en milliseconde)
// ne pas utiliser la fonction sleep PB car soucis avec TV et pas même unité
SUBROUTINE Sleep(ulong delai) library "kernel32.dll"

// This function returns the RGB value of the default window color
FUNCTION long GetSysColor (int color) LIBRARY "user.exe"

//   This function "flashes" a given window once. Flashing a window means
//   changing the appearance of its caption bar as if the window were changing
//   from inactive to active status, or vice versa.
FUNCTION boolean FlashWindow (int hWnd, boolean bInvert) LIBRARY "user.exe"

//   This function scans global memory and returns the number of bytes
//   currently available. wFlags should be passed as 0.
FUNCTION long GetFreeSpace (int wFlags) LIBRARY "kernel.exe"

//   This function retrieves a handle to the menu of the specified window.
FUNCTION int GetMenu (int hWnd) LIBRARY "user.exe"

//   This function determines the number of items in the menu identified
//   by the hMenu parameter.
FUNCTION uint GetMenuItemCount (int hMenu) LIBRARY "user.exe"

//   This function determines whether or not a window has been maximized.
FUNCTION boolean IsZoomed (int hWnd) LIBRARY "user32.dll"

//   This function Determines whether the specified window is minimized (iconic).
FUNCTION boolean IsIconic (int hWnd) LIBRARY "user.exe"

// This function creates a system timer event
FUNCTION int SetTimer (int hWnd, int nIDEvent, uint wElapse, long lpTimerFunc) LIBRARY "user.exe"

// This function kills a timer event
FUNCTION boolean KillTimer (int hWnd, int nIDEvent) LIBRARY "user.exe"

// This function checks to see if an application is currently running
//Function uint GetModuleHandle(string ModuleName) Library "kernel.exe" alias for "GetModuleHandle;Ansi"
Function ULong GetModuleHandle( String lpModuleName) Library "kernel32.dll" Alias For "GetModuleHandleW"

//
//// This function Used with GetModuleHandle will tell how many times an
//// Application is running
//Function uint GetModuleUsage(Uint ModuleHandle) Library "Kernel.exe"
//
//
//// This external function declaration enables us to use the Windows
//// function sndPlaySound (from the MMSYSTEM.DLL) in the frame.
//// This function plays a WAV file.
//
//FUNCTION integer sndPlaySound (string lpszSoundName, integer uFlags) &
//	   LIBRARY "MMSYSTEM.dll" alias for "sndPlaySound;Ansi"
//
//FUNCTION integer sndPlaySoundA (string lpszSoundName, integer uFlags) &
//	   LIBRARY "WINMM.dll" alias for "sndPlaySoundA;Ansi"
//
//FUNCTION boolean GetComputerNameA(ref string cname, ref long nbuf) LIBRARY "Kernel32.dll" alias for "GetComputerNameA;Ansi"	// return true si  ok
//
//// Fonction de messages pour le lancement de TELEVITALE
//FUNCTION uint RegisterWindowMessageA(String as_msg) LIBRARY "User32.dll" alias for "RegisterWindowMessageA;Ansi"
//FUNCTION long SendMessageA (long hWnd, ulong MsgID, ulong Param1, long Param2) library"user32.dll" alias for "SendMessageA;Ansi"
//FUNCTION long PostMessageA (long hWnd, ulong MsgID, ulong Param1, long Param2) library"user32.dll" alias for "PostMessageA;Ansi"
//
//// Fonction pour changer de Directory Courrant
//// If the function succeeds, the return value is nonzero.
//FUNCTION boolean SetCurrentDirectoryA (Ref string cdir) LIBRARY "kernel32.dll" alias for "SetCurrentDirectoryA;Ansi"
//
//// fonction pour faire une pause dans le prg (delai : en milliseconde)
////SUBROUTINE Sleep(ulong delai) library "kernel32.dll"
//
//
//// Fonction pour créer un Directory (return 0 si pb)
//FUNCTION long CreateDirectoryA(ref string lpPathName, &
//ref Security_Attributes IpSecurityAttributes) LIBRARY "kernel32.dll" alias for "CreateDirectoryA;Ansi"
//
//// Fonction pour effacer un fichier (return 0 si un pb)
//Function Long DeleteFileA (String lpFileName) LIBRARY "kernel32.dll" alias for "DeleteFileA;Ansi"
//
//// pour supr un rep, ATTENTION = il doit être vide (return 0 si pb)
//Function Long RemoveDirectoryA (String lpPathName) LIBRARY "kernel32.dll" alias for "RemoveDirectoryA;Ansi"
//
//// fx qui transfo un path en path msdos (return 0 si pb ou le nbr de carac de la string lpszShortPath)
//function ulong GetShortPathNameA (	ref string lpszLongPath, &
//												ref string lpszShortPath, &
//												ulong cchBuffer ) LIBRARY "kernel32.dll" alias for "GetShortPathNameA;Ansi"
//
//// Fonction pour copier un fichier (si FailIfExists est true et si fichier existe déjà = erreur)
//// return 0 si pb
//Function Long CopyFileA (String lpExistingFileName, String lpNewFileName, &
//									Long FailIfExists) LIBRARY "kernel32.dll" alias for "CopyFileA;Ansi"
//									
//// Fonction pour renomer un fichier ou un rep (si return 0 alors un pb !)
//Function long MoveFileA (String lpExistingFileName, String lpNewFileName) &
//									LIBRARY "kernel32.dll" alias for "MoveFileA;Ansi"
//
////pour savoir de quel nature est un lecteur
//Function long GetDriveTypeA (String nDrive) LIBRARY "kernel32.dll" alias for "GetDriveTypeA;Ansi"
//
////pour mettre des attributs
//// FILE_ATTRIBUTE_READONLY = &H1
//// FILE_ATTRIBUTE_HIDDEN = &H2
////FILE_ATTRIBUTE_SYSTEM = &H4
////FILE_ATTRIBUTE_DIRECTORY = &H10
////FILE_ATTRIBUTE_ARCHIVE = &H20
////FILE_ATTRIBUTE_NORMAL = &H80
////FILE_ATTRIBUTE_TEMPORARY = &H100
////FILE_ATTRIBUTE_COMPRESSED = &H800
//// renvoi 0 si pb !!
//Function Long SetFileAttributesA (String lpFileName, Long dwFileAttributes) LIBRARY "kernel32.dll" alias for "SetFileAttributesA;Ansi"
//
////pour recup les attributs d'un fichier ou rep
//Function Long GetFileAttributesA (String lpFileName) LIBRARY "kernel32.dll" alias for "GetFileAttributesA;Ansi"
//
//// pur recup le rep temp
//Function Long GetTempPath(Long nBufferLength, String lpBuffer) Library "kernel32.dll" alias for "GetTempPathA;Ansi"
//
//// pour récup le rep d'installation de windows
//// return > 0 si ok (càd le nbr de carac récup)
//Function  long GetWindowsDirectoryA( ref String lpBuffer, ref Long nSize)  LIBRARY "Kernel32.dll" alias for "GetWindowsDirectoryA;Ansi"
//
//// Pour excuter une application en mode MODAL
//// --> renvoie : 0 when the specified command has well terminated
//// --> param style :
//// 0 Hidden 
//// 1 Normal 
//// 2 Minimised 
//// 3 Maximised 
//// 4 Shown but not as active window 
//// 7 Shown Minimised but not as active window 
//FUNCTION uint RunWait(string command, uint style) LIBRARY "runwait.dll" alias for "RunWait;Ansi" 
//
//// Pour les handles
//Function ulong GetDC(ulong hwnd) library "user32.dll"
//
//// Déplacement d'un point
//FUNCTION boolean MoveToEx(ulong hwnd,long wx, long wy,ref point_type prepos2) LIBRARY "Gdi32.dll" alias for "MoveToEx;Ansi"
//
//// Tracer une droite du curseur à un point
//FUNCTION boolean LineTo(ulong hwnd,long wx, long wy) LIBRARY "Gdi32.dll"
//
//// Tracer courbe de bezier
//Function Long PolyBezier (Long hdc , ref point_type lppt[1000] , long cPoints ) LIBRARY "Gdi32.dll" alias for "PolyBezier;Ansi"
//
//// Tracer un arc de cercle
//Function Long Arc  (Long hdc, Long nLeftRect, Long nTopRect , Long nRightRect , Long nBottomRect, Long nXStartArc , Long nYStartArc, Long nXEndArc , Long nYEndArc ) Library "gdi32.dll" 
//
//// Selection d'un object
//Function uLong SelectObject (ulong hdc , uLong hObject ) LIBRARY "Gdi32.dll"
//
//// Pour le style de tracé
//Function uLong CreatePen (Long fnPenStyle , Long nWidth , Long CrColor ) Library "gdi32.dll" 
//
//// Pour le ouvrir avec des GearBox
//subroutine CopyMemory ( ref ulong hDest, long b ) library "kernel32.dll"
//
////pour "ouvrir avec ..." de la gearbox
//subroutine ZeroMemory ( ref startupinfo hDest, ulong b ) library "kernel32.dll" alias for "ZeroMemory;Ansi"
//subroutine ZeroMemory ( ref PROCESS_INFORMATION hDest, ulong b ) library "kernel32.dll" alias for "ZeroMemory;Ansi"
//Function long CreateProcess(	ref string lpApplicationName, &
//											ref string lpCommandLine, &
//											ref security_attributes lpProcessAttributes, &
//											ref security_attributes lpThreadAttributes, &
//											long bInheritHandles, &
//											ulong dwCreationFlags, &
//											ref string lpEnvironment, &
//											ref string lpCurrentDirectory, &
//											ref STARTUPINFO lpStartupInfo, &
//											ref PROCESS_INFORMATION  lpProcessInformation) Library "kernel32.dll" alias for "CreateProcess;Ansi"
//Function ulong WaitForSingleObject( ulong hHandle, ulong dwMilliseconds) Library "kernel32.dll"
//Function long CloseHandle(ulong hObject) Library "kernel32.dll"
//Function ulong CreateJobObject(	ref security_attributes lpJobAttributes, &
//											ref string lpName ) Library "kernel32.dll" alias for "CreateJobObject;Ansi"
//
//Function ulong GetLastError () library "kernel32.dll"
//
//// recup le handle d'une fenetre par son titre (si on indique un lpClassName à NULL )
//// return > 0 si ok
//function ulong FindWindowA ( ref string lpClassName, ref string lpWindowName ) LIBRARY "user32.dll" alias for "FindWindowA;Ansi"
//
//// pour afficher une fenêtre en fonction de son Handle
//function int SetForegroundWindow (ulong hwnd) LIBRARY "user32.dll" 
//function int SetActiveWindow (ulong hwnd) LIBRARY "user32.dll" 
////ALIAS FOR "SetForegroundWindowA;Ansi"
//
//
//// permet de fermer la fenêtre dont le handle est passé en param (ne fonctionne pas avec les fenetres filles)
//// return true si ok
//function boolean DestroyWindow( ulong hWnd ) LIBRARY "user32.dll"	//boolean
//
//// ecrire du texte sur un controle visuel
//FUNCTION boolean TextOutA(ulong hwnd,long wx, long wy,ref string s, long slenght) LIBRARY "Gdi32.dll" alias for "TextOutA;Ansi"
//
//
//
//// Gestion de affichage d'une fentre processus
////Constante Valeur Définition 
//// 0 Cache la fenêtre et en active une autre. 
//// 3 Agrandit la fenêtre. 
//// 6 Réduit la fenêtre et active la prochaine (dans l'ordre des tâches windows). 
//// 9 Active et affiche la fenêtre à sa taille et position initiales. 
//// 5 Active et affiche la fenêtre. 
//// 3 Active et agrandit la fenêtre. 
//// 2 Active et réduit la fenêtre. 
//// 8 Identique à SW_SHOW sauf que la fenêtre n'est pas activée. 
//Function Long ShowWindow( Long  hwnd , Long nCmdShow )  Library "user32.dll" Alias For "ShowWindow" 
//
//
//Function Long BringWindowToTop  (Long hwnd ) Library "user32.dll" 
//Function Long SetWindowPos   (Long hwnd, Long hWndInsertAfter, int  X,  int  Y,  int  cx,  int  cy,  UINT uFlags  ) Library "user32.dll" 
//
//// pour les transparences des objets
//Function ulong SetCapture(ulong hWnd) Library "USER32.DLL"
//Function BOOLEAN ReleaseCapture() Library "USER32.DLL"
//FUNCTION long GetWindowLong (ulong hWnd, int nIndex)    LIBRARY "USER32.DLL"  ALIAS FOR "GetWindowLongA"
//FUNCTION long SetWindowLong (ulong hWnd, int nIndex, long dwNewLong)    LIBRARY "USER32.DLL" ALIAS FOR "SetWindowLongA"
//FUNCTION long SetLayeredWindowAttributes  (long hWnd, Long crKey , char /*Byte*/ bAlpha , Long dwFlags)    LIBRARY "USER32.DLL" 
//
//// Pour la gestion des imprimantes
//FUNCTION boolean SetDefaultPrinter(string PrinterName)  LIBRARY "WinSpool.drv" ALIAS FOR SetDefaultPrinterA 
//FUNCTION boolean GetDefaultPrinter(ref string PrinterName, long taille)  LIBRARY "WinSpool.drv" ALIAS FOR SetDefaultPrinterA 
//
//
//// Pour exécution sous Shell
//Function long ShellExecute(long hwnd, string lpOperation , string lpFile , string lpParameters , string lpDirectory , long nShowCmd) Library "shell32.dll" Alias for "ShellExecuteA" 
//
//
//
//// Pour les recherches de date de fichier
//
//function long FindFirstFile ( string FileName, ref s_WIN32_FIND_DATA FindFileData ) Library "kernel32.dll" Alias for "FindFirstFileA;Ansi"
//function integer FindNextFile ( ulong FindFile, ref s_WIN32_FIND_DATA FindFileData ) Library "kernel32.dll" Alias for "FindNextFileA;Ansi"
//function integer FindClose( ulong FindFile ) Library "kernel32.dll"
//function long SearchPath ( ref string Path, ref string FileName,  ref string Extension, ulong BufferLength, 	ref string Buffer, ref integer FilePart ) &
//	Library  "kernel32.dll" Alias for "SearchPathA;Ansi"
//
//Function long FileTimeToSystemTime  (ref s_filetime LpFileTime, ref s_systemtime lpSystemTime ) Library "kernel32.dll" 
//Function long SystemTimeToTzSpecificLocalTime  (ref s_systemtime lpSystemTime, ref s_systemtime OpSystemTime ) Library "kernel32.dll" 
//Function long SystemTimeToFileTime  (ref s_systemtime lpSystemTime, ref s_filetime LpFileTime ) Library "kernel32.dll" 
//
//Function long FileTimeToLocalFileTime  (ref s_filetime LpFileTime, ref s_filetime lpSystemTime ) Library "kernel32.dll" 
//
//FUNCTION long HtmlHelp(long hwnd, string pszFile, long uCommand, long dwData)  LIBRARY "hhctrl.ocx"  ALIAS FOR "HtmlHelpA"
//
//// Pour savoir (entre aurtes) si plusieur écrans utilisés
//// Faut passer 80 en param pour nombre de moniteurs
//FUNCTION integer GetSystemMetrics(integer nIndex) LIBRARY "User32.dll" 
////alias for "GetSystemMetricsA;Ansi"
//
//
//// pour simuler la frappe de touche !! Notamment le printscreen
//SUBROUTINE keybd_event(int bVk, int bScan, int dwFlags, int dwExtraInfo) LIBRARY "user32.dll" 
//
//// recherche de processus actif
//Function ulong CreateToolhelp32Snapshot ( ulong dwFlags, ulong th32ProcessID ) Library "kernel32.dll"
//Function boolean Process32First ( ulong hSnapShot, REF str_ProcessEntry32 lppe ) Library "kernel32.dll" Alias For "Process32FirstW"
//Function boolean Process32Next ( ulong hSnapShot, REF str_ProcessEntry32 lppe ) Library "kernel32.dll" Alias For "Process32NextW"
//
//// Pour CC Vitale
//Function ulong SetParent ( ulong hWndChild, ulong hWndNewParent ) Library "User32.dll"

end prototypes

type variables



end variables

on maj_70_60.create
appname="maj_70_60"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on maj_70_60.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;//*-----------------------------------------------------------------*/
//*    open:  Application Open Script
//*          1) Instantiate connection service
//*           2) Populate SQLCA and Connect to the database
//*           3) Open main window
//*-----------------------------------------------------------------*/
n_maj_70_60_connectservice lnv_connectserv
string s_deja_executee


lnv_connectserv = Create using "n_maj_70_60_connectservice"

If lnv_connectserv.of_ConnectDB ( ) = 0 Then
	/*  Open Main window  */
	double v_version
	
	select top 1 version_base into :v_version from param ;
	
	if v_version < 2023 then 
		Messagebox("ATTENTION", "Pour réaliser cette mise à jour de vos soins vous devez être en version 2023 d'Orthokis.~n~nCe n'est pas le cas !~n~nVeuillez contacter notre hotline au (33) 4 75 78 50 70.")
	
	else
		select top 1 isnull(maj_70_60, 'N') into :s_deja_executee  from agenda ;
		
		if s_deja_executee = 'N' or s_deja_executee = '' then

			ok_mdp = false
			open(w_mot_passe_administrateur) 
			if ok_mdp then
				Open ( w_main )
			end if
		else
		
			Messagebox("ATTENTION","Vous avez déjà effectuée cette mise à jour !~n~nVous ne pouvez pas la faire une 2ème fois !") 

		end if
	end if
end if

Destroy lnv_connectserv
end event

event close;//*-----------------------------------------------------------------*/
//*    close:  Application Close Script
//            1) Instantiate connection service
//            2) Disconnect from the database
//*-----------------------------------------------------------------*/
n_maj_70_60_connectservice lnv_connectserv

lnv_connectserv = Create using "n_maj_70_60_connectservice"

lnv_connectserv.of_DisconnectDB ( )

Destroy lnv_connectserv
end event

