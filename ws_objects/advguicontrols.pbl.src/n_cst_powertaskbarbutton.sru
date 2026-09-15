$PBExportHeader$n_cst_powertaskbarbutton.sru
forward
global type n_cst_powertaskbarbutton from nonvisualobject
end type
type taskbar_button from structure within n_cst_powertaskbarbutton
end type
type inv_pbusexternal from n_cst_pbusexternal within n_cst_powertaskbarbutton
end type
end forward

type taskbar_button from structure
	string		buttontext
	string		buttonimage
	boolean		enabled
	boolean		hidden
	boolean		dismissonclick
	boolean		nobackground
	boolean		nointeractive
end type

global type n_cst_powertaskbarbutton from nonvisualobject autoinstantiate
inv_pbusexternal inv_pbusexternal
end type

type prototypes
Function LongPtr ImageList_GetIcon( LongPtr himl, long i, ulong flags) Library "comctl32.dll"

Function ulong RegisterWindowMessage(String lpString) library "user32.dll" ALIAS FOR "RegisterWindowMessageA;ANSI"
function long ChangeWindowMessageFilter(UINT  message, long dwFlag) library "user32.dll" 
end prototypes

type variables
CONSTANT Long THBN_CLICKED = 6144

Long TASKBAR_BUTTON1 = Long(8181, 6144)
Long TASKBAR_BUTTON2 = Long(8182, 6144)
Long TASKBAR_BUTTON3 = Long(8183, 6144)
Long TASKBAR_BUTTON4 = Long(8184, 6144)
Long TASKBAR_BUTTON5 = Long(8185, 6144)
Long TASKBAR_BUTTON6 = Long(8186, 6144)
Long TASKBAR_BUTTON7 = Long(8187, 6144)

CONSTANT Int TBPF_NOPROGRESS = 0
CONSTANT Int TBPF_INDETERMINATE = 1
CONSTANT Int TBPF_NORMAL = 2
CONSTANT Int TBPF_ERROR = 4
CONSTANT Int TBPF_PAUSED = 8

LongPtr TaskbarButtonCreated

PRIVATE:
Window iw_window

LongPtr il_imagelistsmall
LongPtr il_imagelistmedium
LongPtr il_imagelistlarge
LongPtr il_imagelistxlarge

n_cst_ui_imagelist inv_imagelist

Taskbar_Button i_buttons[]

CONSTANT Int THBF_ENABLED	= 0
CONSTANT Int THBF_DISABLED	= 1
CONSTANT Int THBF_DISMISSONCLICK	= 2
CONSTANT Int THBF_NOBACKGROUND	= 4
CONSTANT Int THBF_HIDDEN	= 8
CONSTANT Int THBF_NONINTERACTIVE	= 16

Boolean ib_buttonscreated
end variables

forward prototypes
public function integer of_register (window aw_window)
public function integer of_addbutton (string as_image, string as_text)
public function integer of_createbuttons ()
public function integer of_setprogress (integer state, integer progress, integer maxprogress)
public function integer of_setprogress (integer state)
public function integer of_setoverlayicon (string as_icon, string as_alt_text)
public function integer of_clearoverlayicon ()
public function integer of_addbutton (string as_image, string as_text, boolean ab_enabled, boolean ab_dismissonclick, boolean ab_nobackground, boolean ab_hidden, boolean ab_nointeractive)
public function integer of_register (window aw_window)
public function integer of_addbutton (string as_image, string as_text)
public function integer of_createbuttons ()
public function integer of_setprogress (integer state, integer progress, integer maxprogress)
public function integer of_setprogress (integer state)
public function integer of_setoverlayicon (string as_icon, string as_alt_text)
public function integer of_clearoverlayicon ()
public function integer of_addbutton (string as_image, string as_text, boolean ab_enabled, boolean ab_dismissonclick, boolean ab_nobackground, boolean ab_hidden, boolean ab_nointeractive)
public function integer of_updatebutton (integer ai_buttonindex, string as_image, string as_text, boolean ab_enabled, boolean ab_dismissonclick, boolean ab_nobackground, boolean ab_hidden, boolean ab_nointeractive)
public function integer of_settooltiptext (string as_tiptext)
end prototypes

public function integer of_register (window aw_window);CONSTANT Int MSGFLT_ADD = 1
CONSTANT Int WM_COMMAND = 273

iw_window = aw_window

TaskbarButtonCreated = RegisterWindowMessage("TaskbarButtonCreated");
ChangeWindowMessageFilter(TaskbarButtonCreated, MSGFLT_ADD)
ChangeWindowMessageFilter(WM_COMMAND, MSGFLT_ADD)

RETURN 1
end function

public function integer of_addbutton (string as_image, string as_text);RETURN of_AddButton(as_image, as_text, TRUE, TRUE, FALSE, FALSE, FALSE)
end function

public function integer of_createbuttons ();IF NOT IsValid(iw_window) THEN RETURN -3

Long ll_index, ll_count
String ls_text[]
LongPtr li_image[]
Long ll_flags[]
Long ll_return
Long ll_imageindex
n_cst_win32 lnv_win32
n_cst_pbus_numerical lnv_numerical

lnv_win32 = CREATE n_cst_win32

ll_count = UpperBound(i_buttons)

FOR ll_index = 1 TO ll_count
	ll_imageindex = inv_imagelist.of_AddImage(i_buttons[ll_index].buttonimage)
	li_image[ll_index] = ImageList_GetIcon( inv_imagelist.of_GetSmallHandle(), ll_imageindex - 1, 0)
	
	ls_text[ll_index] = i_buttons[ll_index].buttontext
	
	IF  NOT i_buttons[ll_index].enabled THEN
		ll_flags[ll_index] = THBF_DISABLED
	END IF
	
	IF i_buttons[ll_index].dismissonclick THEN 
		ll_flags[ll_index] = lnv_numerical.of_BitwiseOr(ll_flags[ll_index], THBF_DISMISSONCLICK)
	END IF

	IF i_buttons[ll_index].nobackground THEN 
		ll_flags[ll_index] = lnv_numerical.of_BitwiseOr(ll_flags[ll_index], THBF_NOBACKGROUND)
	END IF
	
	IF i_buttons[ll_index].hidden THEN 
		ll_flags[ll_index] = lnv_numerical.of_BitwiseOr(ll_flags[ll_index], THBF_HIDDEN)
	END IF
	
	IF i_buttons[ll_index].nointeractive THEN 
		ll_flags[ll_index] = lnv_numerical.of_BitwiseOr(ll_flags[ll_index], THBF_NONINTERACTIVE)
	END IF
	
NEXT

ib_buttonscreated = TRUE
ll_return = inv_pbusexternal.PBUSAddButtons(Handle(iw_window), ll_count, li_image, ls_text, ll_flags)

FOR ll_index = 1 TO ll_count
	lnv_win32.DestroyIcon(li_image[ll_index])
NEXT

DESTROY lnv_win32

RETURN ll_return

end function

public function integer of_setprogress (integer state, integer progress, integer maxprogress);IF NOT IsValid(iw_window) THEN RETURN -3

inv_pbusexternal.PBUSSetProgress(Handle(iw_window), state, progress, maxprogress)

RETURN 1
end function

public function integer of_setprogress (integer state);IF NOT IsValid(iw_window) THEN RETURN -3

inv_pbusexternal.PBUSSetProgress(Handle(iw_window), state, 0, 0)

RETURN 1
end function

public function integer of_setoverlayicon (string as_icon, string as_alt_text);IF NOT IsValid(iw_window) THEN RETURN -3

LongPtr hicon, hinst
Long ll_imageindex
n_cst_win32 lnv_win32
CONSTANT Long IMAGE_ICON	= 1

lnv_win32 = CREATE n_cst_win32

SetNull(hinst)

ll_imageindex = inv_imagelist.of_AddImage(as_icon)

hIcon = ImageList_GetIcon( inv_imagelist.of_GetSmallHandle(), ll_imageindex - 1, 0)

IF hIcon = 0 THEN
	hIcon = lnv_win32.LoadImage(hinst, as_icon, IMAGE_ICON, 16, 16, 16) //LR_LOADFROMFILE
END IF

inv_pbusexternal.PBUSSetOverlayImage(handle(iw_window), hIcon, as_alt_text)

lnv_win32.DestroyIcon(hIcon)

DESTROY lnv_win32

RETURN 1
end function

public function integer of_clearoverlayicon ();IF NOT IsValid(iw_window) THEN RETURN -3

LongPtr hicon

SetNull(hicon)

inv_pbusexternal.PBUSSetOverlayImage(handle(iw_window), hicon, "")

RETURN 1
end function

public function integer of_addbutton (string as_image, string as_text, boolean ab_enabled, boolean ab_dismissonclick, boolean ab_nobackground, boolean ab_hidden, boolean ab_nointeractive);Long ll_imageindex, ll_index

IF ib_buttonscreated THEN
	RETURN -1
END IF

ll_index = UpperBound(i_buttons) + 1

IF ll_index > 7 THEN
	RETURN -2
END IF

i_buttons[ll_index].buttontext = as_text
i_buttons[ll_index].buttonimage = as_image
i_buttons[ll_index].enabled = ab_enabled
i_buttons[ll_index].dismissonclick = ab_dismissonclick
i_buttons[ll_index].nobackground = ab_nobackground
i_buttons[ll_index].hidden = ab_hidden
i_buttons[ll_index].nointeractive = ab_nointeractive

RETURN ll_index
end function

public function integer of_updatebutton (integer ai_buttonindex, string as_image, string as_text, boolean ab_enabled, boolean ab_dismissonclick, boolean ab_nobackground, boolean ab_hidden, boolean ab_nointeractive);IF NOT IsValid(iw_window) THEN RETURN -3
IF NOT ib_buttonscreated THEN RETURN -2

Long ll_imageindex, ll_index
String ls_text
LongPtr li_image
Long ll_flags
Long ll_return
n_cst_win32 lnv_win32
n_cst_pbus_numerical lnv_numerical

lnv_win32 = CREATE n_cst_win32

ll_index = ai_buttonindex

IF ll_index = 0 OR ll_index > UpperBound(i_buttons) THEN
	RETURN -1
END IF

i_buttons[ll_index].buttontext = as_text
i_buttons[ll_index].buttonimage = as_image
i_buttons[ll_index].enabled = ab_enabled
i_buttons[ll_index].dismissonclick = ab_dismissonclick
i_buttons[ll_index].nobackground = ab_nobackground
i_buttons[ll_index].hidden = ab_hidden
i_buttons[ll_index].nointeractive = ab_nointeractive


ll_imageindex = inv_imagelist.of_AddImage(i_buttons[ll_index].buttonimage)
li_image = ImageList_GetIcon( inv_imagelist.of_GetSmallHandle(), ll_imageindex - 1, 0)
	
ls_text = i_buttons[ll_index].buttontext
	
IF  NOT i_buttons[ll_index].enabled THEN
	ll_flags = THBF_DISABLED
END IF

IF i_buttons[ll_index].dismissonclick THEN 
	ll_flags = lnv_numerical.of_BitwiseOr(ll_flags, THBF_DISMISSONCLICK)
END IF

IF i_buttons[ll_index].nobackground THEN 
	ll_flags = lnv_numerical.of_BitwiseOr(ll_flags, THBF_NOBACKGROUND)
END IF

IF i_buttons[ll_index].hidden THEN 
	ll_flags = lnv_numerical.of_BitwiseOr(ll_flags, THBF_HIDDEN)
END IF

IF i_buttons[ll_index].nointeractive THEN 
	ll_flags = lnv_numerical.of_BitwiseOr(ll_flags, THBF_NONINTERACTIVE)
END IF

ll_return = inv_pbusexternal.PBUSUpdateButton(Handle(iw_window), 8180 + ai_buttonindex, li_image, ls_text, ll_flags)

lnv_win32.DestroyIcon(li_image)

DESTROY lnv_win32

RETURN ll_return

end function

public function integer of_settooltiptext (string as_tiptext);IF NOT IsValid(iw_window) THEN RETURN -3

IF Len(Trim(as_tiptext)) = 0 THEN SetNull(as_tiptext)

RETURN inv_pbusexternal.PBUSSetThumbnailTooltip(Handle(iw_window), as_tiptext)
end function

on n_cst_powertaskbarbutton.create
call super::create
this.inv_pbusexternal=create inv_pbusexternal
TriggerEvent( this, "constructor" )
end on

on n_cst_powertaskbarbutton.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_pbusexternal)
end on

type inv_pbusexternal from n_cst_pbusexternal within n_cst_powertaskbarbutton descriptor "pb_nvo" = "true" 
event create ( )
event destroy ( )
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

