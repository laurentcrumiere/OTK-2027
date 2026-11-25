$PBExportHeader$n_cst_powermessage.sru
forward
global type n_cst_powermessage from n_uspb_base
end type
end forward

global type n_cst_powermessage from n_uspb_base autoinstantiate
end type

type prototypes
FUNCTION Long SetWindowPos (LongPtr hWnd, LongPtr m, Long nleft, Long ntop, Long nwidth, Long nheight, Long flags) Library "USER32.dll"
end prototypes

type variables
Window iw_parent
n_cst_pbui_theme inv_color_theme
string is_theme
CONSTANT Integer SM_CYCAPTION = 4
CONSTANT Integer SM_CXBORDER = 5
CONSTANT Integer SM_CYBORDER = 6
CONSTANT Integer SM_CXSIZEFRAME = 32
CONSTANT Integer SM_CYSIZEFRAME = 33

n_cst_pbus_lic iu_lic

Integer MessageTextSize = 11
Integer TitleTextSize = 18

String Button1Text
String Button2Text
String Button3Text

String LinkLabel
String LinkData

n_hashtable in_enumeratortext
end variables

forward prototypes
private function window of_getparentwindow ()
public function integer of_register (window a_window)
public function integer of_settheme (string as_color)
public function integer messagebox (string as_title, string as_message, button a_buttons, integer ai_default)
public function integer messagebox (string as_title, string as_message, button a_buttons)
public function integer messagebox (string as_title, string as_message)
public function integer messagebox (string as_title, string as_message, button a_buttons, integer ai_default, integer ai_timeout)
public function integer of_settitletextsize (integer ai_size)
public function integer of_setmessagetextsize (integer ai_size)
public function integer of_setbuttontext (string as_button1, string as_button2, string as_button3)
public function integer of_setbuttontext (string as_button1, string as_button2)
public function integer of_setbuttontext (string as_button1)
private function string of_buttontostring (button al_buttons)
public function integer of_setadditionaldetails (string as_label, string as_data)
public function integer of_setenumtext (string as_button1text, string as_button2text, string as_button3text, button a_buttons)
public function integer of_setenumtext (string as_button1text, string as_button2text, button a_buttons)
public function integer of_setenumtext (string as_button1text, button a_buttons)
end prototypes

private function window of_getparentwindow ();PowerObject	lpo_parent
Window lw_window

// loop thru parents until a window is found
lpo_parent = GetFocus()
IF  IsValid(lpo_parent) THEN
	Do While lpo_parent.TypeOf() <> Window! and IsValid(lpo_parent)
		lpo_parent = lpo_parent.GetParent()
	Loop
END IF

// set return to the window or null if not found
If IsValid (lpo_parent) Then
	lw_window = lpo_parent
Else
	SetNull(lw_window)
End If

RETURN lw_window
end function

public function integer of_register (window a_window);iw_parent = a_window

RETURN 1
end function

public function integer of_settheme (string as_color);IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_theme = as_color
RETURN 1
end function

public function integer messagebox (string as_title, string as_message, button a_buttons, integer ai_default);RETURN THIS.MessageBox(as_title, as_message, a_buttons, ai_default, 0)
end function

public function integer messagebox (string as_title, string as_message, button a_buttons);RETURN THIS.MessageBox(as_title, as_message, a_buttons, 1)
end function

public function integer messagebox (string as_title, string as_message);RETURN THIS.messagebox(as_title, as_message, Ok!, 1)
end function

public function integer messagebox (string as_title, string as_message, button a_buttons, integer ai_default, integer ai_timeout);str_powermessage l_powermessage
Long ll_return, ll_yadjust, ll_xadjust
n_cst_win32 inv_win32
n_cst_pbus_numerical lnv_numerical
ULong ll_currstyle
String ls_buttontext[]

IF NOT iu_lic.of_Registered() OR &
   iu_lic.of_Key() <> "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

IF NOT IsValid(iw_parent) THEN
	//Attempt to get a parent
	iw_parent = of_GetParentWindow()
END IF

IF IsValid(iw_parent) THEN
	
	IF iw_parent.WindowState = Minimized! THEN
		iw_parent.WindowState = Maximized!
	END IF
	
	IF NOT IsValid(inv_color_theme) THEN
		inv_color_theme = CREATE USING "n_cst_pbui_theme_blue"
		is_theme = "BLUE"
	END IF
	
	l_powermessage.Title = as_title
	l_powermessage.Message = as_message
	l_powermessage.ParentWindow = iw_parent
	l_powermessage.Buttons = a_buttons
	l_powermessage.Background = inv_color_theme.of_GetColor(inv_color_theme.PBUSMessage, "BACKGROUND1")
	l_powermessage.Default = ai_default
	l_powermessage.TimeOut = ai_timeout
	l_powermessage.Theme = is_theme
	l_powermessage.MessageTextSize = MessageTextSize
	l_powermessage.TitleTextSize = TitleTextSize
	l_powermessage.LinkLabel = LinkLabel
	l_powermessage.LinkData = LinkData
	
	IF Len(Trim(Button1Text)) > 0 THEN
		l_powermessage.Button1Text = Button1Text
		l_powermessage.Button2Text = Button2Text
		l_powermessage.Button3Text = Button3Text
	
	ELSEIF in_enumeratortext.IndexOf(of_ButtonToString(a_buttons)) > 0 THEN
		ls_buttontext = in_enumeratortext.Get(of_ButtonToString(a_buttons))
		
		l_powermessage.Button1Text = ls_buttontext[1]
		l_powermessage.Button2Text = ls_buttontext[2]
		l_powermessage.Button3Text = ls_buttontext[3]
	ELSE
		l_powermessage.Button1Text = ""
		l_powermessage.Button2Text = ""
		l_powermessage.Button3Text = ""
	END IF

	IF iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
		iw_parent.Dynamic of_PauseResize(TRUE)
	END IF
	
	Open(w_pbus_messagebox, iw_parent)
	
	inv_win32 = CREATE n_cst_win32
	
	IF iw_parent.TriggerEvent("pbus_customcaptionwindow") < 1 THEN
		ll_xadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CXSIZEFRAME), XPixelsToUnits!)
		ll_yadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYSIZEFRAME), YPixelsToUnits!)
	END IF
	
	DESTROY(inv_win32)
	
	SetWindowPos(Handle(w_pbus_messagebox), 0, UnitsToPixels(iw_parent.X + ll_xadjust, XUnitsToPixels!), &
										 UnitsToPixels( iw_parent.Y, YUnitsToPixels!), &
										 UnitsToPixels(iw_parent.Width - (ll_xadjust *2), XUnitsToPixels!), &
										 UnitsToPixels( iw_parent.Height - ll_yadjust, YUnitsToPixels!), 0)
	
	w_pbus_messagebox.of_Resize()
	w_pbus_messagebox.Show()
	
	ll_return = w_pbus_messagebox.of_SetMessage(l_powermessage)
	
	Close(w_pbus_messagebox)
	
	IF iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
		iw_parent.Dynamic of_PauseResize(FALSE)
	END IF
	
	Button1Text = ""
	Button2Text = ""
	Button3Text = ""
	LinkLabel = ""
	LinkData = ""

	RETURN ll_return
ELSE
	RETURN 0
END IF
end function

public function integer of_settitletextsize (integer ai_size);TitleTextSize = ai_size
RETURN 1
end function

public function integer of_setmessagetextsize (integer ai_size);MessageTextSize = ai_size
RETURN 1
end function

public function integer of_setbuttontext (string as_button1, string as_button2, string as_button3);Button1Text = as_button1
Button2Text = as_button2
Button3Text = as_button3

RETURN 1
end function

public function integer of_setbuttontext (string as_button1, string as_button2);RETURN of_SetButtonText(as_button1, as_button2, "")
end function

public function integer of_setbuttontext (string as_button1);RETURN of_SetButtonText(as_button1, "", "")
end function

private function string of_buttontostring (button al_buttons);CHOOSE CASE al_buttons
	CASE OK!
		RETURN "OK!"
	CASE OKCancel!
		RETURN "OKCancel!"
	CASE YesNo!
		RETURN "YesNo!"
	CASE YesNoCancel!
		RETURN "YesNoCancel!"
	CASE RetryCancel!
		RETURN "RetryCancel!"
	CASE AbortRetryIgnore!
		RETURN "AbortRetryIgnore!"
END CHOOSE

RETURN ""
end function

public function integer of_setadditionaldetails (string as_label, string as_data);LinkLabel = as_label
LinkData = as_data

RETURN 1

end function

public function integer of_setenumtext (string as_button1text, string as_button2text, string as_button3text, button a_buttons);String buttontext[]

buttontext[1] = as_button1text
buttontext[2] = as_button2text
buttontext[3] = as_button3text

in_enumeratortext.Put(of_ButtonToString(a_buttons), buttontext)

RETURN 1
end function

public function integer of_setenumtext (string as_button1text, string as_button2text, button a_buttons);RETURN of_SetEnumText(as_button1text, as_button2Text, "", a_buttons)
end function

public function integer of_setenumtext (string as_button1text, button a_buttons);RETURN of_SetEnumText(as_button1text, "", "", a_buttons)
end function

on n_cst_powermessage.create
call super::create
end on

on n_cst_powermessage.destroy
call super::destroy
end on

event constructor;call super::constructor;IF Len(Trim(is_Theme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_Theme)
END IF
end event

