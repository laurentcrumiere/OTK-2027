$PBExportHeader$n_cst_powertoast.sru
forward
global type n_cst_powertoast from n_uspb_base
end type
end forward

shared variables
Long sl_nextmessageid
Long sl_toastcount
Long sl_lasty
end variables

global type n_cst_powertoast from n_uspb_base autoinstantiate
end type

type prototypes
FUNCTION Long SetWindowPos (LongPtr hWnd, LongPtr m, Long nleft, Long ntop, Long nwidth, Long nheight, Long flags) Library "USER32.dll"
end prototypes

type variables
CONSTANT Integer OPEN_CALLBACK = 1
CONSTANT Integer CLICK_CALLBACK = 2
CONSTANT Integer CLOSE_CALLBACK = 3

CONSTANT Integer FADE_ANIMATION = 1
CONSTANT Integer SLIDELEFT_ANIMATION = 2
CONSTANT Integer SLIDEUP_ANIMATION = 3

PRIVATE:

Window iw_parent

Long il_animation
Long il_duration
Boolean ib_anchortoparent
Boolean ib_closeonclick

Window iw_opencallback
UserObject iuo_opencallback
String is_opencallback

Window iw_clickcallback
UserObject iuo_clickcallback
String is_clickcallback

Window iw_closecallback
UserObject iuo_closecallback
String is_closecallback

n_cst_pbus_lic iu_lic


end variables

forward prototypes
public function integer of_alert (string as_image, string as_message, string as_color)
public function integer of_alert (string as_image, string as_message, string as_color, integer ai_animation)
public function integer of_toast (string as_title, string as_message, blob ab_image)
public function integer of_toast (string as_title, string as_message, string as_image)
public function integer of_toast (string as_title, string as_message)
public function integer of_toast (string as_title, string as_message, blob ab_image, integer ai_animation)
public function integer of_toast (string as_title, string as_message, string as_image, integer ai_animation)
public function integer of_toast (string as_title, string as_message, integer ai_animation)
public function integer of_registercallback (integer ai_callback, window aw_window, string as_event)
public function integer of_registercallback (integer ai_callback, userobject auo_object, string as_event)
public function integer of_settoastduration (long al_duration)
public function integer of_decreasetoastcount ()
public function integer of_gettoastcount ()
public function integer of_setlasty (long al_y)
public function long of_getlasty ()
public function integer of_settoastanimation (integer ai_animation)
public function integer of_setparentwindow (window aw_parent)
public function integer of_register (window aw_window)
public function integer of_anchortoparent (boolean ab_switch)
public function integer of_setcloseonclick (boolean ab_switch)
end prototypes

public function integer of_alert (string as_image, string as_message, string as_color);RETURN of_alert(as_image, as_message, as_color, il_animation)
end function

public function integer of_alert (string as_image, string as_message, string as_color, integer ai_animation);str_pbus_toast l_toast
w_pbus_toast lw_pbus_toast
w_pbus_toast_child lw_pbus_toast_child
Dragobject ldo
Window lw
graphicobject lpo_current

IF NOT iu_lic.of_Registered() AND NOT iu_lic.of_FreeVersion("n_cst_powertoast") AND &
   iu_lic.of_Key() = "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

lpo_current = GetFocus()

if isvalid(lpo_current) then
	CHOOSE CASE lpo_current.typeof()
		CASE checkbox!,commandbutton!,picturebutton!,datawindow!,dropdownlistbox!,dropdownpicturelistbox!,graph!,groupbox!,&
		hscrollbar!,listbox!,picturelistbox!,listview!,multilineedit!,editmask!,omcontrol!, omcustomcontrol!,datepicker!,hprogressbar!,htrackbar!,&
		inkedit!, inkpicture!, monthcalendar!, picturehyperlink!, statichyperlink!, vprogressbar!, vtrackbar!, &
		olecustomcontrol!,omembeddedcontrol!,olecontrol!,picture!,radiobutton!,richtextedit!,singlelineedit!,statictext!,tab!,treeview!,userobject!,vscrollbar!
			ldo = lpo_current
		CASE window!
			lw = lpo_current
	END CHOOSE
end if

sl_toastcount += 1

sl_nextmessageid += 1
l_toast.MessageId = sl_nextmessageid
l_toast.title = ""
l_toast.message = as_message
l_toast.image = as_image
l_toast.toastcount = sl_toastcount
l_toast.duration = il_duration
l_toast.w_opencallback = iw_opencallback
l_toast.uo_opencallback = iuo_opencallback
l_toast.opencallback = is_opencallback
l_toast.w_clickcallback = iw_clickcallback
l_toast.uo_clickcallback = iuo_clickcallback
l_toast.clickcallback = is_clickcallback
l_toast.w_closecallback = iw_closecallback
l_toast.uo_closecallback = iuo_closecallback
l_toast.closecallback = is_closecallback
l_toast.nv_toast = THIS
l_toast.lasty = sl_lasty
l_toast.animation = ai_animation
l_toast.focusobject = ldo
l_toast.color = as_color
l_toast.anchortoparent = ib_anchortoparent
l_toast.closeonclick = ib_closeonclick

IF IsValid(iw_parent) THEN
	l_toast.ParentWindow = iw_parent
	
	IF sl_toastcount = 1 AND NOT ib_anchortoparent THEN
		SetWindowPos(Handle(iw_parent),-1, 0, 0, 0, 0, 3)
		SetWindowPos(Handle(iw_parent),-2, 0, 0, 0, 0, 3)
	END IF
	
	IF ib_anchortoparent THEN
		OpenWithParm(lw_pbus_toast_child, l_toast, iw_parent)
	ELSE
		OpenWithParm(lw_pbus_toast, l_toast, iw_parent)
	END IF
ELSE
	IF ib_anchortoparent THEN
		OpenWithParm(lw_pbus_toast_child, l_toast)
	ELSE
		OpenWithParm(lw_pbus_toast, l_toast)
	END IF
END IF

IF IsValid(ldo) THEN
	ldo.SetFocus()
ELSE
	IF IsValid(lw) THEN
		lw.SetFocus()
	END IF
END IF

RETURN sl_nextmessageid
end function

public function integer of_toast (string as_title, string as_message, blob ab_image);RETURN of_Toast(as_title, as_message, ab_image, il_animation)
end function

public function integer of_toast (string as_title, string as_message, string as_image);RETURN of_Toast(as_title, as_message, as_image, il_animation)
end function

public function integer of_toast (string as_title, string as_message);RETURN of_Toast(as_title, as_message, "")
end function

public function integer of_toast (string as_title, string as_message, blob ab_image, integer ai_animation);str_pbus_toast l_toast
w_pbus_toast lw_pbus_toast
w_pbus_toast_child lw_pbus_toast_child
Dragobject ldo
Window lw
graphicobject lpo_current

IF NOT iu_lic.of_Registered() AND NOT iu_lic.of_FreeVersion("n_cst_powertoast") AND &
   iu_lic.of_Key() = "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

lpo_current = GetFocus()

if isvalid(lpo_current) then
	CHOOSE CASE lpo_current.typeof()
		CASE checkbox!,commandbutton!,picturebutton!,datawindow!,dropdownlistbox!,dropdownpicturelistbox!,graph!,groupbox!,&
		hscrollbar!,listbox!,picturelistbox!,listview!,multilineedit!,editmask!,omcontrol!, omcustomcontrol!,datepicker!,hprogressbar!,htrackbar!,&
		inkedit!, inkpicture!, monthcalendar!, picturehyperlink!, statichyperlink!, vprogressbar!, vtrackbar!, &
		olecustomcontrol!,omembeddedcontrol!,olecontrol!,picture!,radiobutton!,richtextedit!,singlelineedit!,statictext!,tab!,treeview!,userobject!,vscrollbar!
			ldo = lpo_current
		CASE window!
			lw = lpo_current
	END CHOOSE
end if

sl_toastcount += 1

sl_nextmessageid += 1
l_toast.MessageId = sl_nextmessageid
l_toast.title = as_title
l_toast.message = as_message
l_toast.image = "blob"
l_toast.blobimage = ab_image
l_toast.toastcount = sl_toastcount
l_toast.duration = il_duration
l_toast.w_opencallback = iw_opencallback
l_toast.uo_opencallback = iuo_opencallback
l_toast.opencallback = is_opencallback
l_toast.w_clickcallback = iw_clickcallback
l_toast.uo_clickcallback = iuo_clickcallback
l_toast.clickcallback = is_clickcallback
l_toast.w_closecallback = iw_closecallback
l_toast.uo_closecallback = iuo_closecallback
l_toast.closecallback = is_closecallback
l_toast.nv_toast = THIS
l_toast.lasty = sl_lasty
l_toast.animation = ai_animation
l_toast.focusobject = ldo
l_toast.anchortoparent = ib_anchortoparent
l_toast.closeonclick = ib_closeonclick

IF IsValid(iw_parent) THEN
	l_toast.ParentWindow = iw_parent
	
	IF sl_toastcount = 1 AND NOT ib_anchortoparent THEN
		SetWindowPos(Handle(iw_parent),-1, 0, 0, 0, 0, 3)
		SetWindowPos(Handle(iw_parent),-2, 0, 0, 0, 0, 3)
	END IF
	
	IF ib_anchortoparent THEN
		OpenWithParm(lw_pbus_toast_child, l_toast, iw_parent)
	ELSE
		OpenWithParm(lw_pbus_toast, l_toast, iw_parent)
	END IF
ELSE
	IF ib_anchortoparent THEN
		OpenWithParm(lw_pbus_toast_child, l_toast)
	ELSE
		OpenWithParm(lw_pbus_toast, l_toast)
	END IF
END IF

IF IsValid(ldo) THEN
	ldo.SetFocus()
ELSE
	IF IsValid(lw) THEN
		lw.SetFocus()
	END IF
END IF

RETURN sl_nextmessageid
end function

public function integer of_toast (string as_title, string as_message, string as_image, integer ai_animation);str_pbus_toast l_toast
w_pbus_toast lw_pbus_toast
w_pbus_toast_child lw_pbus_toast_child
Dragobject ldo
Window lw
graphicobject lpo_current

IF NOT iu_lic.of_Registered() AND NOT iu_lic.of_FreeVersion("n_cst_powertoast") AND &
   iu_lic.of_Key() = "38017E06-84A2-4B73-9CE5-87C0BD9A39A8" THEN
	RETURN 0
END IF

lpo_current = GetFocus()

if isvalid(lpo_current) then
	CHOOSE CASE lpo_current.typeof()
		CASE checkbox!,commandbutton!,picturebutton!,datawindow!,dropdownlistbox!,dropdownpicturelistbox!,graph!,groupbox!,&
		hscrollbar!,listbox!,picturelistbox!,listview!,multilineedit!,editmask!,omcontrol!, omcustomcontrol!,datepicker!,hprogressbar!,htrackbar!,&
		inkedit!, inkpicture!, monthcalendar!, picturehyperlink!, statichyperlink!, vprogressbar!, vtrackbar!, &
		olecustomcontrol!,omembeddedcontrol!,olecontrol!,picture!,radiobutton!,richtextedit!,singlelineedit!,statictext!,tab!,treeview!,userobject!,vscrollbar!
			ldo = lpo_current
		CASE window!
			lw = lpo_current
	END CHOOSE
end if

sl_toastcount += 1

sl_nextmessageid += 1
l_toast.MessageId = sl_nextmessageid
l_toast.title = as_title
l_toast.message = as_message
l_toast.image = as_image
l_toast.toastcount = sl_toastcount
l_toast.duration = il_duration
l_toast.w_opencallback = iw_opencallback
l_toast.uo_opencallback = iuo_opencallback
l_toast.opencallback = is_opencallback
l_toast.w_clickcallback = iw_clickcallback
l_toast.uo_clickcallback = iuo_clickcallback
l_toast.clickcallback = is_clickcallback
l_toast.w_closecallback = iw_closecallback
l_toast.uo_closecallback = iuo_closecallback
l_toast.closecallback = is_closecallback
l_toast.nv_toast = THIS
l_toast.lasty = sl_lasty
l_toast.animation = ai_animation
l_toast.focusobject = ldo
l_toast.anchortoparent = ib_anchortoparent
l_toast.closeonclick = ib_closeonclick

IF IsValid(iw_parent) THEN
	l_toast.ParentWindow = iw_parent
	
	IF sl_toastcount = 1 AND NOT ib_anchortoparent THEN
		SetWindowPos(Handle(iw_parent),-1, 0, 0, 0, 0, 3)
		SetWindowPos(Handle(iw_parent),-2, 0, 0, 0, 0, 3)
	END IF
	
	IF ib_anchortoparent THEN
		OpenWithParm(lw_pbus_toast_child, l_toast, iw_parent)
	ELSE
		OpenWithParm(lw_pbus_toast, l_toast, iw_parent)
	END IF
ELSE
	IF ib_anchortoparent THEN
		OpenWithParm(lw_pbus_toast_child, l_toast)
	ELSE
		OpenWithParm(lw_pbus_toast, l_toast)
	END IF
END IF

IF IsValid(ldo) THEN
	ldo.SetFocus()
ELSE
	IF IsValid(lw) THEN
		lw.SetFocus()
	END IF
END IF

RETURN sl_nextmessageid
end function

public function integer of_toast (string as_title, string as_message, integer ai_animation);RETURN of_Toast(as_title, as_message, "", ai_animation)
end function

public function integer of_registercallback (integer ai_callback, window aw_window, string as_event);CHOOSE CASE ai_callback
	CASE OPEN_CALLBACK
		iw_opencallback = aw_window
		is_opencallback = as_event
	CASE CLICK_CALLBACK
		iw_clickcallback = aw_window
		is_clickcallback = as_event
	CASE CLOSE_CALLBACK
		iw_closecallback = aw_window
		is_closecallback = as_event
END CHOOSE

RETURN 1
end function

public function integer of_registercallback (integer ai_callback, userobject auo_object, string as_event);CHOOSE CASE ai_callback
	CASE OPEN_CALLBACK
		iuo_opencallback = auo_object
		is_opencallback = as_event
	CASE CLICK_CALLBACK
		iuo_clickcallback = auo_object
		is_clickcallback = as_event
	CASE CLOSE_CALLBACK
		iuo_closecallback = auo_object
		is_closecallback = as_event
END CHOOSE

RETURN 1
end function

public function integer of_settoastduration (long al_duration);il_duration = al_duration
RETURN 1
end function

public function integer of_decreasetoastcount ();sl_toastcount -= 1

IF sl_toastcount <= 0 THEN
	sl_toastcount = 0
	sl_lasty = 0
END IF

RETURN 1
end function

public function integer of_gettoastcount ();RETURN sl_toastcount
end function

public function integer of_setlasty (long al_y);sl_lasty = al_y
RETURN 1
end function

public function long of_getlasty ();RETURN sl_lasty
end function

public function integer of_settoastanimation (integer ai_animation);il_animation = ai_animation
RETURN 1
end function

public function integer of_setparentwindow (window aw_parent);iw_parent = aw_parent
RETURN 1
end function

public function integer of_register (window aw_window);RETURN of_SetParentWindow(aw_window)
end function

public function integer of_anchortoparent (boolean ab_switch);ib_anchortoparent = ab_switch

RETURN 1
end function

public function integer of_setcloseonclick (boolean ab_switch);ib_closeonclick = ab_switch
RETURN 1
end function

on n_cst_powertoast.create
call super::create
end on

on n_cst_powertoast.destroy
call super::destroy
end on

