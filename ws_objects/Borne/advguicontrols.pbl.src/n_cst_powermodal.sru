$PBExportHeader$n_cst_powermodal.sru
forward
global type n_cst_powermodal from n_uspb_base
end type
end forward

shared variables
window iw_stack[]
end variables

global type n_cst_powermodal from n_uspb_base autoinstantiate
end type

type prototypes
FUNCTION Long SetWindowPos (LongPtr hWnd, LongPtr m, Long nleft, Long ntop, Long nwidth, Long nheight, Long flags) Library "USER32.dll"
end prototypes

type variables
Window iw_parent
CONSTANT Integer SM_CYCAPTION = 4
CONSTANT Integer SM_CXBORDER = 5
CONSTANT Integer SM_CYBORDER = 6
CONSTANT Integer SM_CXSIZEFRAME = 32
CONSTANT Integer SM_CYSIZEFRAME = 33

n_cst_pbus_lic iu_lic

String is_return
Long il_return
Double id_return
PowerObject iuo_return
end variables

forward prototypes
private function window of_getparentwindow ()
public function integer of_register (window a_window)
public function integer closemodal ()
public function integer openmodal (ref window aw_window)
public function integer openmodal (ref window aw_window, string as_parm)
public function integer openmodal (ref window aw_window, string as_parm, boolean ab_displayclose)
public function integer openmodal (ref window aw_window, boolean ab_displayclose)
public function integer openmodal (ref window aw_window, long as_parm, boolean ab_displayclose)
public function integer openmodal (ref window aw_window, double as_parm, boolean ab_displayclose)
public function integer openmodal (ref window aw_window, powerobject as_parm, boolean ab_displayclose)
public function integer closemodal (string a_return)
public function integer closemodal (powerobject a_return)
public function integer closemodal (long a_return)
public function integer closemodal (double a_return)
public function window of_pop ()
public function integer of_push (ref window aw_window)
public function integer of_process ()
end prototypes

private function window of_getparentwindow ();PowerObject	lpo_parent
Window lw_window

// loop thru parents until a window is found
lpo_parent = GetFocus()

IF IsValid(lpo_parent) THEN

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

public function integer closemodal ();Window lw_window

lw_window = of_Pop()

IF IsValid(lw_window) THEN
	Close(lw_window)
END IF

RETURN 1
end function

public function integer openmodal (ref window aw_window);RETURN OpenModal(aw_window, '', TRUE)
end function

public function integer openmodal (ref window aw_window, string as_parm);RETURN OpenModal(aw_window, as_parm, TRUE)
end function

public function integer openmodal (ref window aw_window, string as_parm, boolean ab_displayclose);str_powermessage l_powermessage
Long ll_return, ll_yadjust, ll_xadjust
n_cst_win32 inv_win32
window aw_owner
n_cst_pbus_numerical lnv_numerical
ULong ll_currstyle

IF NOT iu_lic.of_Registered() OR &
   iu_lic.of_Key() <> "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

IF NOT IsValid(iw_parent) THEN
	//Attempt to get a parent
	iw_parent = of_GetParentWindow()
END IF

aw_owner = of_GetParentWindow()

IF IsValid(iw_parent) THEN
	IF NOT IsValid(w_pbus_modal) THEN
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
			iw_parent.Dynamic of_PauseResize(TRUE)
		END IF
		
		Open(w_pbus_modal, iw_parent)
		
		inv_win32 = CREATE n_cst_win32
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") < 1 THEN
			ll_yadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYSIZEFRAME), YPixelsToUnits!)
			ll_xadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CXSIZEFRAME), XPixelsToUnits!)
		END IF
		
		DESTROY(inv_win32)
		w_pbus_modal.iw_owner = aw_owner
		w_pbus_modal.inv_parent = THIS
		
		SetWindowPos(Handle(w_pbus_modal), 0, UnitsToPixels(iw_parent.X + ll_xadjust, XUnitsToPixels!), &
										 UnitsToPixels( iw_parent.Y, YUnitsToPixels!), &
										 UnitsToPixels(iw_parent.Width - (ll_xadjust *2), XUnitsToPixels!), &
										 UnitsToPixels( iw_parent.Height - ll_yadjust, YUnitsToPixels!), 0)
										 
		w_pbus_modal.Show()
		
		is_return = ""
		il_return = 0
		id_return = 0
		PowerObject luo_empty
		iuo_return = luo_empty
		str_powermodal lstr_powermodal
		
		ll_return = w_pbus_modal.of_Open(aw_window, as_parm, ab_displayclose, THIS, REF lstr_powermodal)
		
		//Returned response comes from a response window
		IF lstr_powermodal.ResponseReturn THEN
			is_return = lstr_powermodal.sreturn
			il_return = lstr_powermodal.lreturn
			id_return = lstr_powermodal.dreturn
			iuo_return = lstr_powermodal.poreturn
		END IF
		
		Close(w_pbus_modal)
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
			iw_parent.Dynamic of_PauseResize(FALSE)
		END IF
		
		Message.LongParm = il_return
		Message.DoubleParm = id_return
		Message.StringParm = is_return
		Message.PowerObjectParm = iuo_return
	
		RETURN ll_return
	ELSE
		RETURN -1
	END IF
ELSE
	RETURN 0
END IF
end function

public function integer openmodal (ref window aw_window, boolean ab_displayclose);RETURN OpenModal(aw_window, "", ab_displayclose)
end function

public function integer openmodal (ref window aw_window, long as_parm, boolean ab_displayclose);str_powermessage l_powermessage
Long ll_return, ll_yadjust, ll_xadjust
n_cst_win32 inv_win32
n_cst_pbus_numerical lnv_numerical
ULong ll_currstyle

IF NOT iu_lic.of_Registered() OR &
   iu_lic.of_Key() <> "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

IF NOT IsValid(iw_parent) THEN
	//Attempt to get a parent
	iw_parent = of_GetParentWindow()
END IF

IF IsValid(iw_parent) THEN
	IF NOT IsValid(w_pbus_modal) THEN
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
			iw_parent.Dynamic of_PauseResize(TRUE)
		END IF
		
		Open(w_pbus_modal, iw_parent)
		
		inv_win32 = CREATE n_cst_win32
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") < 1 THEN
			ll_yadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYSIZEFRAME), YPixelsToUnits!)
			ll_xadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CXSIZEFRAME), XPixelsToUnits!)
		END IF
		
		DESTROY(inv_win32)
		
		w_pbus_modal.inv_parent = THIS
		
		SetWindowPos(Handle(w_pbus_modal), 0, UnitsToPixels(iw_parent.X + ll_xadjust, XUnitsToPixels!), &
										 UnitsToPixels( iw_parent.Y, YUnitsToPixels!), &
										 UnitsToPixels(iw_parent.Width - (ll_xadjust *2), XUnitsToPixels!), &
										 UnitsToPixels( iw_parent.Height - ll_yadjust, YUnitsToPixels!), 0)
		
		w_pbus_modal.Show()
		
		is_return = ""
		il_return = 0
		id_return = 0
		PowerObject luo_empty
		iuo_return = luo_empty
		str_powermodal lstr_powermodal
		
		ll_return = w_pbus_modal.of_Open(aw_window, as_parm, ab_displayclose, THIS, REF lstr_powermodal)
		
		//Returned response comes from a response window
		IF lstr_powermodal.ResponseReturn THEN
			is_return = lstr_powermodal.sreturn
			il_return = lstr_powermodal.lreturn
			id_return = lstr_powermodal.dreturn
			iuo_return = lstr_powermodal.poreturn
		END IF
		
		Close(w_pbus_modal)
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
			iw_parent.Dynamic of_PauseResize(FALSE)
		END IF
		
		Message.LongParm = il_return
		Message.DoubleParm = id_return
		Message.StringParm = is_return
		Message.PowerObjectParm = iuo_return
	
		RETURN ll_return
	ELSE
		RETURN -1
	END IF
ELSE
	RETURN 0
END IF
end function

public function integer openmodal (ref window aw_window, double as_parm, boolean ab_displayclose);str_powermessage l_powermessage
Long ll_return, ll_yadjust, ll_xadjust
n_cst_win32 inv_win32
n_cst_pbus_numerical lnv_numerical
ULong ll_currstyle

IF NOT iu_lic.of_Registered() OR &
   iu_lic.of_Key() <> "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

IF NOT IsValid(iw_parent) THEN
	//Attempt to get a parent
	iw_parent = of_GetParentWindow()
END IF

IF IsValid(iw_parent) THEN
	IF NOT IsValid(w_pbus_modal) THEN
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
			iw_parent.Dynamic of_PauseResize(TRUE)
		END IF
		
		Open(w_pbus_modal, iw_parent)
		
		inv_win32 = CREATE n_cst_win32
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") < 1 THEN
			ll_yadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYSIZEFRAME), YPixelsToUnits!)
			ll_xadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CXSIZEFRAME), XPixelsToUnits!)
		END IF
		
		DESTROY(inv_win32)
		
		w_pbus_modal.inv_parent = THIS
		
		SetWindowPos(Handle(w_pbus_modal), 0, UnitsToPixels(iw_parent.X + ll_xadjust, XUnitsToPixels!), &
										 UnitsToPixels( iw_parent.Y, YUnitsToPixels!), &
										 UnitsToPixels(iw_parent.Width - (ll_xadjust *2), XUnitsToPixels!), &
										 UnitsToPixels( iw_parent.Height - ll_yadjust, YUnitsToPixels!), 0)
		
		w_pbus_modal.Show()
		
		is_return = ""
		il_return = 0
		id_return = 0
		PowerObject luo_empty
		iuo_return = luo_empty
		str_powermodal lstr_powermodal
		
		ll_return = w_pbus_modal.of_Open(aw_window, as_parm, ab_displayclose, THIS, REF lstr_powermodal)
		
		//Returned response comes from a response window
		IF lstr_powermodal.ResponseReturn THEN
			is_return = lstr_powermodal.sreturn
			il_return = lstr_powermodal.lreturn
			id_return = lstr_powermodal.dreturn
			iuo_return = lstr_powermodal.poreturn
		END IF
				
		Close(w_pbus_modal)
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
			iw_parent.Dynamic of_PauseResize(FALSE)
		END IF
		
		Message.LongParm = il_return
		Message.DoubleParm = id_return
		Message.StringParm = is_return
		Message.PowerObjectParm = iuo_return
	
		RETURN ll_return
	ELSE
		RETURN -1
	END IF
ELSE
	RETURN 0
END IF
end function

public function integer openmodal (ref window aw_window, powerobject as_parm, boolean ab_displayclose);str_powermessage l_powermessage
Long ll_return, ll_yadjust, ll_xadjust
n_cst_win32 inv_win32
n_cst_pbus_numerical lnv_numerical
ULong ll_currstyle

IF NOT iu_lic.of_Registered() OR &
   iu_lic.of_Key() <> "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

IF NOT IsValid(iw_parent) THEN
	//Attempt to get a parent
	iw_parent = of_GetParentWindow()
END IF

IF IsValid(iw_parent) THEN
	IF NOT IsValid(w_pbus_modal) THEN
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
			iw_parent.Dynamic of_PauseResize(TRUE)
		END IF
		
		Open(w_pbus_modal, iw_parent)
		
		inv_win32 = CREATE n_cst_win32
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") < 1 THEN
			ll_yadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CYSIZEFRAME), YPixelsToUnits!)
			ll_xadjust = PixelsToUnits(inv_win32.GetSystemMetrics(SM_CXSIZEFRAME), XPixelsToUnits!)
		END IF
		
		DESTROY(inv_win32)
		
		w_pbus_modal.inv_parent = THIS
		
		SetWindowPos(Handle(w_pbus_modal), 0, UnitsToPixels(iw_parent.X + ll_xadjust, XUnitsToPixels!), &
										 UnitsToPixels( iw_parent.Y, YUnitsToPixels!), &
										 UnitsToPixels(iw_parent.Width - (ll_xadjust *2), XUnitsToPixels!), &
										 UnitsToPixels( iw_parent.Height - ll_yadjust, YUnitsToPixels!), 0)
										 
		w_pbus_modal.Show()
		
		is_return = ""
		il_return = 0
		id_return = 0
		PowerObject luo_empty
		str_powermodal lstr_powermodal
		
		ll_return = w_pbus_modal.of_Open(aw_window, as_parm, ab_displayclose, THIS, REF lstr_powermodal)
		
		//Returned response comes from a response window
		IF lstr_powermodal.ResponseReturn THEN
			is_return = lstr_powermodal.sreturn
			il_return = lstr_powermodal.lreturn
			id_return = lstr_powermodal.dreturn
			iuo_return = lstr_powermodal.poreturn
		END IF
		
		Close(w_pbus_modal)
		
		IF iw_parent.TriggerEvent("pbus_customcaptionwindow") = 1 THEN
			iw_parent.Dynamic of_PauseResize(FALSE)
		END IF
		
		Message.LongParm = il_return
		Message.DoubleParm = id_return
		Message.StringParm = is_return
		Message.PowerObjectParm = iuo_return
	
		RETURN ll_return
	ELSE
		RETURN -1
	END IF
ELSE
	RETURN 0
END IF
end function

public function integer closemodal (string a_return);Window lw_window

lw_window = of_Pop()

IF IsValid(lw_window) THEN
	Close(lw_window)
	is_return = a_return
END IF

RETURN 1
end function

public function integer closemodal (powerobject a_return);Window lw_window

lw_window = of_Pop()

IF IsValid(lw_window) THEN
	Close(lw_window)
	iuo_return = a_return
END IF

RETURN 1
end function

public function integer closemodal (long a_return);Window lw_window

lw_window = of_Pop()

IF IsValid(lw_window) THEN
	Close(lw_window)
	il_return = a_return
END IF

RETURN 1
end function

public function integer closemodal (double a_return);Window lw_window

lw_window = of_Pop()

IF IsValid(lw_window) THEN
	Close(lw_window)
	id_return = a_return
END IF

RETURN 1
end function

public function window of_pop ();
Long ll_index, ll_count
Window lw_newstack[]
Window lw_pop

ll_count = UpperBound(iw_stack)

IF ll_count > 0 THEN
	lw_pop = iw_stack[ll_count]
END IF

ll_count = ll_count - 1

FOR ll_index = 1 TO ll_count
	lw_newstack[ll_index] = iw_stack[ll_index]
NEXT

iw_stack = lw_newstack

ll_count = UpperBound(iw_stack)

RETURN lw_pop
end function

public function integer of_push (ref window aw_window);Long ll_index

ll_index = UpperBound(iw_stack) + 1

iw_stack[ll_index] = aw_window

RETURN 1
end function

public function integer of_process ();message l_message

l_message = CREATE Message
l_message.LongParm = Message.LongParm
l_message.DoubleParm = Message.DoubleParm
l_message.StringParm = Message.StringParm
l_message.PowerObjectParm = Message.PowerObjectParm

Close(w_pbus_modal)

Message.LongParm = l_message.LongParm
Message.DoubleParm = l_message.DoubleParm
Message.StringParm = l_message.StringParm
Message.PowerObjectParm = l_message.PowerObjectParm

DESTROY l_message

RETURN 1
end function

on n_cst_powermodal.create
call super::create
end on

on n_cst_powermodal.destroy
call super::destroy
end on

