$PBExportHeader$n_runandwait.sru
$PBExportComments$Functions to allow waiting for executed program to finish
forward
global type n_runandwait from nonvisualobject
end type
type process_information from structure within n_runandwait
end type
type startupinfo from structure within n_runandwait
end type
end forward

type process_information from structure
	long		hprocess
	long		hthread
	long		dwprocessid
	long		dwthreadid
end type

type startupinfo from structure
	long		cb
	string		lpreserved
	string		lpdesktop
	string		lptitle
	long		dwx
	long		dwy
	long		dwxsize
	long		dwysize
	long		dwxcountchars
	long		dwycountchars
	long		dwfillattribute
	long		dwflags
	long		wshowwindow
	long		cbreserved2
	long		lpreserved2
	long		hstdinput
	long		hstdoutput
	long		hstderror
end type

global type n_runandwait from nonvisualobject autoinstantiate
end type

type prototypes
Function Boolean CreateProcess ( &
	String lpApplicationName, &
	String lpCommandLine, &
	long lpProcessAttributes, &
	long lpThreadAttributes, &
	Boolean bInheritHandles, &
	long dwCreationFlags, &
	long lpEnvironment, &
	String lpCurrentDirectory, &
	STARTUPINFO lpStartupInfo, &
	Ref PROCESS_INFORMATION lpProcessInformation &
	) Library "kernel32.dll" Alias For "CreateProcessA;Ansi"
	
Function long WaitForSingleObject ( &
	long hHandle, &
	long dwMilliseconds &
	) Library "kernel32.dll"

Function Boolean CloseHandle ( &
	long hObject &
	) Library "kernel32.dll"

Function Boolean GetExitCodeProcess ( &
	long hProcess, &
	Ref long lpExitCode &
	) Library "kernel32.dll"

Function Boolean TerminateProcess ( &
	long hProcess, &
	long uExitCode &
	) Library "kernel32.dll"

Function Long ExpandEnvironmentStrings ( &
	String lpSrc, &
	Ref String lpDst, &
	Long nSize &
	) Library "kernel32.dll" Alias For "ExpandEnvironmentStringsA;Ansi"

end prototypes

type variables
Boolean ib_terminate
long il_millsecs

CONSTANT long INFINITE			= -1
CONSTANT long WAIT_ABANDONED	= 128
CONSTANT long WAIT_COMPLETE	= 0
CONSTANT long WAIT_OBJECT_0	= 0
CONSTANT long WAIT_TIMEOUT	= 258

CONSTANT long SW_HIDE			= 0
CONSTANT long SW_SHOWNORMAL	= 1
CONSTANT long SW_NORMAL		= 1
CONSTANT long SW_SHOWMINIMIZED	= 2
CONSTANT long SW_SHOWMAXIMIZED	= 3
CONSTANT long SW_MAXIMIZE		= 3
CONSTANT long SW_SHOWNOACTIVATE	= 4
CONSTANT long SW_SHOW		= 5
CONSTANT long SW_MINIMIZE		= 6
CONSTANT long SW_SHOWMINNOACTIVE	= 7
CONSTANT long SW_SHOWNA		= 8
CONSTANT long SW_RESTORE		= 9
CONSTANT long SW_SHOWDEFAULT	= 10
CONSTANT long SW_FORCEMINIMIZE	= 11
CONSTANT long SW_MAX			= 11

CONSTANT long STARTF_USESHOWWINDOW	= 1
CONSTANT long STARTF_USESIZE			= 2
CONSTANT long STARTF_USEPOSITION		= 4
CONSTANT long STARTF_USECOUNTCHARS		= 8
CONSTANT long STARTF_USEFILLATTRIBUTE	= 16
CONSTANT long STARTF_RUNFULLSCREEN		= 32
CONSTANT long STARTF_FORCEONFEEDBACK	= 64
CONSTANT long STARTF_FORCEOFFFEEDBACK	= 128
CONSTANT long STARTF_USESTDHANDLES		= 256
CONSTANT long STARTF_USEHOTKEY		= 512

CONSTANT long CREATE_DEFAULT_ERROR_MODE	= 67108864
CONSTANT long CREATE_FORCEDOS		= 8192
CONSTANT long CREATE_NEW_CONSOLE		= 16
CONSTANT long CREATE_NEW_PROCESS_GROUP	= 512
CONSTANT long CREATE_NO_WINDOW		= 134217728
CONSTANT long CREATE_SEPARATE_WOW_VDM	= 2048
CONSTANT long CREATE_SHARED_WOW_VDM	= 4096
CONSTANT long CREATE_SUSPENDED		= 4
CONSTANT long CREATE_UNICODE_ENVIRONMENT	= 1024
CONSTANT long DEBUG_PROCESS			= 1
CONSTANT long DEBUG_ONLY_THIS_PROCESS	= 2
CONSTANT long DETACHED_PROCESS		= 8

CONSTANT long HIGH_PRIORITY_CLASS		= 128
CONSTANT long IDLE_PRIORITY_CLASS		= 64
CONSTANT long NORMAL_PRIORITY_CLASS		= 32
CONSTANT long REALTIME_PRIORITY_CLASS	= 256

end variables

forward prototypes
public subroutine of_set_options (boolean ab_terminate, decimal adec_seconds)
private function long of_run (string as_exefullpath, long ai_showwindow)
public function long of_run (string as_exepath, windowstate a_windowstate)
public function long of_run (string as_exepath, trigevent a_windowstate)
public function string of_shellexecute (string as_filename, string as_shellverb)
end prototypes

public subroutine of_set_options (boolean ab_terminate, decimal adec_seconds);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_set_options
//
// PURPOSE:    This function sets a timeout period so that it can stop
//             waiting after so many seconds.  It also sets an option
//					to terminate the process if it is still running after
//					the timeout period expires.
//
// ARGUMENTS:  ab_terminate	- Terminate if still running
//             adec_seconds	- Timeout period in seconds
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

ib_terminate = ab_terminate
il_millsecs = adec_seconds * 1000

end subroutine

private function long of_run (string as_exefullpath, long ai_showwindow);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_Run
//
// PURPOSE:    This function starts the process and waits for it to
//             finish.  If a timeout period has been set, it
//					optionally can terminate the process.
//
// ARGUMENTS:  as_exefullpath	- Path of program to execute
//             ai_showwindow	- Show window option
//
// RETURN:		Return code of the program or:
//					-1  = Create Process failed
//					258 = Process terminated after timeout
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

STARTUPINFO lstr_si
PROCESS_INFORMATION lstr_pi
long ll_null, ll_CreationFlags, ll_ExitCode, ll_msecs
String ls_null

// initialize arguments
SetNull(ll_null)
SetNull(ls_null)
lstr_si.cb = 72
lstr_si.dwFlags = STARTF_USESHOWWINDOW
lstr_si.wShowWindow = ai_showwindow
ll_CreationFlags = CREATE_NEW_CONSOLE + NORMAL_PRIORITY_CLASS

// create process/thread and execute the passed program
If CreateProcess(ls_null, as_exefullpath, ll_null, &
			ll_null, False, ll_CreationFlags, ll_null, &
			ls_null, lstr_si, lstr_pi) Then
	// wait for the process to complete
	If il_millsecs > 0 Then
		// wait until process ends or timeout period expires
		ll_ExitCode = WaitForSingleObject(lstr_pi.hProcess, il_millsecs)
		// terminate process if not finished
		If ib_terminate And ll_ExitCode = WAIT_TIMEOUT Then
			TerminateProcess(lstr_pi.hProcess, -1)
			ll_ExitCode = WAIT_TIMEOUT
		Else
			// check for exit code
			GetExitCodeProcess(lstr_pi.hProcess, ll_ExitCode)
		End If
	Else
		// wait until process ends
		WaitForSingleObject(lstr_pi.hProcess, INFINITE)
		// check for exit code
		GetExitCodeProcess(lstr_pi.hProcess, ll_ExitCode)
	End If
	// close process and thread handles
	CloseHandle(lstr_pi.hProcess)
	CloseHandle(lstr_pi.hThread)
Else
	// return failure
	ll_ExitCode = -1
End If

Return ll_ExitCode

end function

public function long of_run (string as_exepath, windowstate a_windowstate);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_Run
//
// PURPOSE:    This function takes the Normal!, Maximized and
//					Minimized! enumerated values and passes the
//             corresponding value to the form of the function
//					that actually does the processing.
//
// ARGUMENTS:  as_exepath		- Path of program to execute
//             a_windowstate	- Show window option
//
// RETURN:		Return code from processing
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

long ll_rtn

CHOOSE CASE a_windowstate
	CASE Normal!
		ll_rtn = this.of_Run(as_exepath, SW_SHOWNORMAL)
	CASE Maximized!
		ll_rtn = this.of_Run(as_exepath, SW_SHOWMAXIMIZED)
	CASE Minimized!
		ll_rtn = this.of_Run(as_exepath, SW_SHOWMINIMIZED)
END CHOOSE

Return ll_rtn

end function

public function long of_run (string as_exepath, trigevent a_windowstate);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_Run
//
// PURPOSE:    This function takes the Hide! enumerated value and
//             passes SW_HIDE to the form of the function that
//					actually does the processing.
//
// ARGUMENTS:  as_exepath		- Path of program to execute
//             a_windowstate	- Show window option
//
// RETURN:		Return code from processing
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 07/16/2003	RolandS		Initial Coding
// -----------------------------------------------------------------------------

long ll_rtn

CHOOSE CASE a_windowstate
	CASE Hide!
		// run the passed program
		ll_rtn = this.of_Run(as_exepath, SW_HIDE)
	CASE ELSE
		// valid trigevent but invalid windowstate
		SetNull(ll_rtn)
END CHOOSE

Return ll_rtn

end function

public function string of_shellexecute (string as_filename, string as_shellverb);// -----------------------------------------------------------------------------
// SCRIPT:     n_runandwait.of_ShellExecute
//
// PURPOSE:    This function uses the registry to build a command
//					string to execute the shell verb against a file.
//
// ARGUMENTS:  as_filename		- Full path of file to open
//					as_shellverb	- Shell verb (open, edit, print, etc.)
//
// RETURN:		Command string to pass to of_Run
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 04/22/2004	RolandS		Initial Coding
// -----------------------------------------------------------------------------

String ls_regkey, ls_class, ls_runcmd
String ls_regcmd, ls_regcmdex, ls_subkeys[]
Integer li_rc, li_pos1, li_pos2, li_idx, li_max

// get file extension classname
ls_regkey = "HKEY_CLASSES_ROOT\." + Right(as_filename, 3)
RegistryGet(ls_regkey, "", RegString!, ls_class)
If ls_class = "" Then
	MessageBox(	"ShellExecute Error", &
					"There is no association for the file type!", StopSign!)
	Return ""
End If

// get default shell verb if not given
ls_regkey = "HKEY_CLASSES_ROOT\" + ls_class + "\shell"
If as_shellverb = "" Then
	RegistryGet(ls_regkey, "", RegString!, as_shellverb)
	If as_shellverb = "" Then
		// get list of verb keys
		RegistryKeys(ls_regkey, ls_subkeys)
		li_max = UpperBound(ls_subkeys)
		If li_max = 0 Then
			MessageBox(	"ShellExecute Error", &
							"There is no default verb for the file type!", StopSign!)
			Return ""
		Else
			// default to first one or 'open' if found
			as_shellverb = ls_subkeys[1]
			For li_idx = 1 To li_max
				If Lower(ls_subkeys[li_idx]) = "open" Then
					as_shellverb = ls_subkeys[li_idx]
					Exit
				End If
			Next
		End If
	End If
End If

// get command string for the given shell verb
ls_regkey = ls_regkey + "\" + as_shellverb + "\command"
li_rc = RegistryGet(ls_regkey, "", RegString!, ls_regcmd)
If li_rc = -1 Then
	li_rc = RegistryGet(ls_regkey, "", RegExpandString!, ls_regcmdex)
	If li_rc = 1 Then
		ls_regcmd = Space(500)
		ExpandEnvironmentStrings(ls_regcmdex, ls_regcmd, 500)
	Else
		MessageBox(	"ShellExecute Error", &
						"The verb is invalid for the file type!", StopSign!)
		Return ""
	End If
End If

// add file name to command string
li_pos1 = Pos(ls_regcmd, "%1")
If li_pos1 = 0 Then
	ls_runcmd = ls_regcmd + " ~"" + as_filename + "~""
Else
	li_pos2 = Pos(ls_regcmd, "~"%1~"")
	If li_pos2 = 0 Then
		ls_runcmd = Replace(ls_regcmd, li_pos1, 2, "~"" + as_filename + "~"")
	Else
		ls_runcmd = Replace(ls_regcmd, li_pos1, 2, as_filename)
	End If
End If

Return ls_runcmd

end function

on n_runandwait.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_runandwait.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

