$PBExportHeader$n_cst_pbusexternal.sru
forward
global type n_cst_pbusexternal from nonvisualobject
end type
end forward

global type n_cst_pbusexternal from nonvisualobject
end type
global n_cst_pbusexternal n_cst_pbusexternal

type prototypes
FUNCTION Long AddButtons(LongPtr h, int count, LongPtr img[], string txt[], long flags[]) LIBRARY "PBUSExternal.DLL" ALIAS FOR "PBUSAddButtons"
FUNCTION Long UpdateButton(LongPtr h, uint id, LongPtr img, string txt, long flags) LIBRARY "PBUSExternal.DLL" ALIAS FOR "PBUSUpdateButton"
FUNCTION Long SetProgress(LongPtr h, int state, int progress, int maxprogress) LIBRARY "PBUSExternal.DLL" ALIAS FOR "PBUSSetProgress"
FUNCTION Long SetOverlayImage(LongPtr h, LongPtr icon, string description) LIBRARY "PBUSExternal.DLL" ALIAS FOR "PBUSSetOverlayImage"
FUNCTION Long SetThumbnailTooltip(LongPtr h, string tooltip) LIBRARY "PBUSExternal.DLL" ALIAS FOR "PBUSSetThumbnailTooltip"
FUNCTION LongPtr GetEncoderStructRef (ref long quality) Library "PBUSExternal.DLL" ALIAS FOR "PBUSGetEncoderStructRef"
Function ulong MakeARGB (int a, int r, int g, int b) Library "PBUSExternal.DLL" ALIAS FOR "PBUSMakeARGB"
Function Long InstallMouseHook (LongPtr hWnd) Library "PBUSExternal.DLL" ALIAS FOR "PBUSInstallMouseHook"
Function boolean RemoveMouseHook () Library "PBUSExternal.DLL" ALIAS FOR "PBUSRemoveMouseHook"
Function double DiceCoefficient (string str1, string str2) Library "PBUSExternal.DLL" ALIAS FOR "PBUSDiceCoefficient"
Function LongPtr InstallHook (LongPtr hWnd) Library "PBUSExternal.DLL" ALIAS FOR "PBUSInstallHook"
Function boolean RemoveHook () Library "PBUSExternal.DLL" ALIAS FOR "PBUSRemoveHook"
FUNCTION ulong SetWndProc (LongPtr hwnd) Library "PBUSExternal.DLL" ALIAS FOR "PBUSSetWndProc"

FUNCTION Long AddButtons64(LongPtr h, int count, LongPtr img[], string txt[], long flags[]) LIBRARY "PBUSExternal64.DLL" ALIAS FOR "PBUSAddButtons"
FUNCTION Long UpdateButton64(LongPtr h, uint id, LongPtr img, string txt, long flags) LIBRARY "PBUSExternal64.DLL" ALIAS FOR "PBUSUpdateButton"
FUNCTION Long SetProgress64(LongPtr h, int state, int progress, int maxprogress) LIBRARY "PBUSExternal64.DLL" ALIAS FOR "PBUSSetProgress"
FUNCTION Long SetOverlayImage64(LongPtr h, LongPtr icon, string description) LIBRARY "PBUSExternal64.DLL" ALIAS FOR "PBUSSetOverlayImage"
FUNCTION Long SetThumbnailTooltip64(LongPtr h, string tooltip) LIBRARY "PBUSExternal64.DLL" ALIAS FOR "PBUSSetThumbnailTooltip"
FUNCTION LongPtr GetEncoderStructRef64(ref long quality) Library "PBUSExternal64.DLL" ALIAS FOR "PBUSGetEncoderStructRef"
Function ulong MakeARGB64(int a, int r, int g, int b) Library "PBUSExternal64.DLL" ALIAS FOR "PBUSMakeARGB"
Function Long InstallMouseHook64(LongPtr hWnd) Library "PBUSExternal64.DLL" ALIAS FOR "PBUSInstallMouseHook"
Function boolean RemoveMouseHook64() Library "PBUSExternal64.DLL" ALIAS FOR "PBUSRemoveMouseHook"
Function double DiceCoefficient64(string str1, string str2) Library "PBUSExternal64.DLL" ALIAS FOR "PBUSDiceCoefficient"
Function LongPtr InstallHook64(LongPtr hWnd) Library "PBUSExternal64.DLL" ALIAS FOR "PBUSInstallHook"
Function boolean RemoveHook64() Library "PBUSExternal64.DLL" ALIAS FOR "PBUSRemoveHook"
FUNCTION ulong SetWndProc64(LongPtr hwnd) Library "PBUSExternal64.DLL" ALIAS FOR "PBUSSetWndProc"
end prototypes

type variables
Integer ProcessBitness
end variables

forward prototypes
public FUNCTION Long PBUSAddButtons(LongPtr h, int count, LongPtr img[], string txt[], long flags[])
public FUNCTION Long PBUSUpdateButton(LongPtr h, uint id, LongPtr img, string txt, long flags)
public FUNCTION Long PBUSSetProgress(LongPtr h, int state, int progress, int maxprogress)
public FUNCTION Long PBUSSetOverlayImage(LongPtr h, LongPtr icon, string description)
public FUNCTION Long PBUSSetThumbnailTooltip(LongPtr h, string tooltip)
public FUNCTION LongPtr PBUSGetEncoderStructRef (ref long quality)
public Function ulong PBUSMakeARGB (int a, int r, int g, int b)
public Function Long PBUSInstallMouseHook (LongPtr hWnd)
public Function boolean PBUSRemoveMouseHook ()
public Function double PBUSDiceCoefficient (string str1, string str2)
public Function LongPtr PBUSInstallHook (LongPtr hWnd)
public Function boolean PBUSRemoveHook ()
public FUNCTION ulong PBUSSetWndProc (LongPtr hwnd)
end prototypes

public FUNCTION Long PBUSAddButtons(LongPtr h, int count, LongPtr img[], string txt[], long flags[]);If ProcessBitness = 64 Then
	RETURN AddButtons64(h, count, img[], txt[], flags[])
ELSE
	RETURN AddButtons(h, count, img[], txt[], flags[])
END IF
end function

public FUNCTION Long PBUSUpdateButton(LongPtr h, uint id, LongPtr img, string txt, long flags);If ProcessBitness = 64 Then
	RETURN UpdateButton64(h, id, img, txt, flags)
ELSE
	RETURN UpdateButton(h, id, img, txt, flags)
END IF
end function

public FUNCTION Long PBUSSetProgress(LongPtr h, int state, int progress, int maxprogress);If ProcessBitness = 64 Then
	RETURN SetProgress64(h, state, progress, maxprogress)
ELSE
	RETURN SetProgress(h, state, progress, maxprogress)
END IF
end function

public FUNCTION Long PBUSSetOverlayImage(LongPtr h, LongPtr icon, string description);If ProcessBitness = 64 Then
	RETURN SetOverlayImage64(h, icon, description)
ELSE
	RETURN SetOverlayImage(h, icon, description)
END IF
end function

public FUNCTION Long PBUSSetThumbnailTooltip(LongPtr h, string tooltip);If ProcessBitness = 64 Then
	RETURN SetThumbnailTooltip64(h, tooltip)
ELSE
	RETURN SetThumbnailTooltip(h, tooltip)
END IF
end function

public FUNCTION LongPtr PBUSGetEncoderStructRef (ref long quality);If ProcessBitness = 64 Then
	RETURN GetEncoderStructRef64(quality)
ELSE
	RETURN GetEncoderStructRef(quality)
END IF
end function

public Function ulong PBUSMakeARGB (int a, int r, int g, int b);If ProcessBitness = 64 Then
	RETURN MakeARGB64(a, r, g, b)
ELSE
	RETURN MakeARGB(a, r, g, b)
END IF
end function

public Function Long PBUSInstallMouseHook (LongPtr hWnd);If ProcessBitness = 64 Then
	RETURN InstallMouseHook64(hWnd)
ELSE
	RETURN InstallMouseHook(hwnd)
END IF
end function

public Function boolean PBUSRemoveMouseHook ();If ProcessBitness = 64 Then
	RETURN RemoveMouseHook64()
ELSE
	RETURN RemoveMouseHook()
END IF
end function

public Function double PBUSDiceCoefficient (string str1, string str2);If ProcessBitness = 64 Then
	RETURN DiceCoefficient64(str1, str2)
ELSE
	RETURN DiceCoefficient(str1, str2)
END IF
end function

public Function LongPtr PBUSInstallHook (LongPtr hWnd);If ProcessBitness = 64 Then
	RETURN InstallHook64(hWnd)
ELSE
	RETURN InstallHook(hWnd)
END IF
end function

public Function boolean PBUSRemoveHook ();If ProcessBitness = 64 Then
	RETURN RemoveHook64()
ELSE
	RETURN RemoveHook()
END IF
end function

public FUNCTION ulong PBUSSetWndProc (LongPtr hwnd);If ProcessBitness = 64 Then
	RETURN SetWndProc64(hwnd)
ELSE
	RETURN SetWndProc(hwnd)
END IF
end function

on n_cst_pbusexternal.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pbusexternal.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;Environment le_env

GetEnvironment(le_env)
ProcessBitness = le_env.ProcessBitness
end event

