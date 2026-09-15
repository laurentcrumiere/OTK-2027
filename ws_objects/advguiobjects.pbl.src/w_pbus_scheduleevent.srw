$PBExportHeader$w_pbus_scheduleevent.srw
forward
global type w_pbus_scheduleevent from w_pbus_spa_captionless
end type
type uo_colorpicker from u_cst_powerschedulecolorpicker within w_pbus_scheduleevent
end type
type p_coloricon from picture within w_pbus_scheduleevent
end type
type p_2 from picture within w_pbus_scheduleevent
end type
type st_placeholder from statictext within w_pbus_scheduleevent
end type
type p_1 from picture within w_pbus_scheduleevent
end type
type ddlb_endtime from dropdownlistbox within w_pbus_scheduleevent
end type
type ddlb_starttime from dropdownlistbox within w_pbus_scheduleevent
end type
type cbx_allday from checkbox within w_pbus_scheduleevent
end type
type dp_enddate from datepicker within w_pbus_scheduleevent
end type
type dp_startdate from datepicker within w_pbus_scheduleevent
end type
type sle_title from singlelineedit within w_pbus_scheduleevent
end type
type rte_description from richtextedit within w_pbus_scheduleevent
end type
type cb_save from u_cst_commandbutton within w_pbus_scheduleevent
end type
type cb_delete from u_cst_commandbutton within w_pbus_scheduleevent
end type
type st_eventdetails from statictext within w_pbus_scheduleevent
end type
type p_location from picture within w_pbus_scheduleevent
end type
type sle_location from singlelineedit within w_pbus_scheduleevent
end type
type ln_1 from line within w_pbus_scheduleevent
end type
type ln_2 from line within w_pbus_scheduleevent
end type
type ln_3 from line within w_pbus_scheduleevent
end type
type ln_eventdetails from line within w_pbus_scheduleevent
end type
type st_locationplaceholder from statictext within w_pbus_scheduleevent
end type
type p_3 from picture within w_pbus_scheduleevent
end type
type cbx_private from checkbox within w_pbus_scheduleevent
end type
type st_descriptionplaceholder from statictext within w_pbus_scheduleevent
end type
type p_4 from picture within w_pbus_scheduleevent
end type
type sle_guests from singlelineedit within w_pbus_scheduleevent
end type
type st_guestsplaceholder from statictext within w_pbus_scheduleevent
end type
type ddlb_status from dropdownlistbox within w_pbus_scheduleevent
end type
type cbx_meeting from checkbox within w_pbus_scheduleevent
end type
end forward

global type w_pbus_scheduleevent from w_pbus_spa_captionless
integer width = 2126
integer height = 2304
windowtype windowtype = response!
uo_colorpicker uo_colorpicker
p_coloricon p_coloricon
p_2 p_2
st_placeholder st_placeholder
p_1 p_1
ddlb_endtime ddlb_endtime
ddlb_starttime ddlb_starttime
cbx_allday cbx_allday
dp_enddate dp_enddate
dp_startdate dp_startdate
sle_title sle_title
rte_description rte_description
cb_save cb_save
cb_delete cb_delete
st_eventdetails st_eventdetails
p_location p_location
sle_location sle_location
ln_1 ln_1
ln_2 ln_2
ln_3 ln_3
ln_eventdetails ln_eventdetails
st_locationplaceholder st_locationplaceholder
p_3 p_3
cbx_private cbx_private
st_descriptionplaceholder st_descriptionplaceholder
p_4 p_4
sle_guests sle_guests
st_guestsplaceholder st_guestsplaceholder
ddlb_status ddlb_status
cbx_meeting cbx_meeting
end type
global w_pbus_scheduleevent w_pbus_scheduleevent

type variables
str_scheduleeventedit ist_event

Int il_rightmargin = 80

n_cst_pbus_resize inv_resize

n_uspb_resourcemanager inv_resourcemanager

CONSTANT Int Busy = 1
CONSTANT Int Free = 2
CONSTANT Int Tentative = 3
CONSTANT Int Away = 4
end variables

forward prototypes
public function integer of_toggleallday (boolean ab_switch)
public function integer of_loadtimevalues (dropdownlistbox ddlb, integer increment, boolean timeformat24hour)
public function integer of_displayplaceholder ()
public function integer of_setresize (boolean ab_switch)
public function integer of_displaydescplaceholder ()
public function string of_getguests ()
public function boolean of_validate ()
public function integer of_loadcolors (unsignedlong al_selected)
public function integer of_setreadonly (boolean ab_readonly)
public function string of_getrtftext (string as_source)
end prototypes

public function integer of_toggleallday (boolean ab_switch);SetRedraw(FALSE)

ddlb_endtime.Visible = NOT ab_switch
ddlb_starttime.Visible = NOT ab_switch

IF ab_switch THEN
	ln_1.BeginX = 1006
	ln_1.EndX = 1006
	
	ln_2.BeginX = 1006 - 32
	ln_2.EndX = 1006
	
	ln_3.BeginX = 1006 - 32
	ln_3.EndX = 1006
ELSE
	ln_1.BeginX = 1554
	ln_1.EndX = 1554
	
	ln_2.BeginX = 1522
	ln_2.EndX = 1554
	
	ln_3.BeginX = 1522
	ln_3.EndX = 1554
END IF

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_loadtimevalues (dropdownlistbox ddlb, integer increment, boolean timeformat24hour);Long ll_index, ll_count
Time lt_item
String ls_timeformat

IF ist_event.TimeFormat24Hour THEN
	ls_timeformat = "hh:mm"
ELSE
	ls_timeformat = "hh:mm AM/PM"
END IF

ll_count = 24 * (60 / increment)

FOR ll_index = 1 TO ll_count
	
	ddlb.AddItem(String(lt_item, ls_timeformat))
	
	lt_item = RelativeTime(lt_item, increment * 60)
	
NEXT

RETURN 1
end function

public function integer of_displayplaceholder ();IF Len(Trim(sle_title.Text)) = 0 THEN
	st_placeholder.Show()
ELSE
	st_placeholder.Hide()
END IF

RETURN 1
end function

public function integer of_setresize (boolean ab_switch);integer	li_rc

// Check arguments
if IsNull (ab_switch) then
	return -1
end if

if ab_Switch then
	if IsNull(inv_resize) Or not IsValid (inv_resize) then
		inv_resize = create n_cst_pbus_resize
		inv_resize.of_SetOrigSize (this.WorkSpaceWidth(), this.WorkSpaceHeight())
		inv_resize.of_SetMinSize (this.WorkSpaceWidth(), this.WorkSpaceHeight())
		li_rc = 1
	end if
else
	if IsValid (inv_resize) then
		destroy inv_resize
		li_rc = 1
	end if
end If

return li_rc
end function

public function integer of_displaydescplaceholder ();IF Len(Trim(rte_description.CopyRTF(FALSE, Detail!))) = 0 THEN
	st_descriptionplaceholder.Show()
ELSE
	st_descriptionplaceholder.Hide()
END IF

RETURN 1

end function

public function string of_getguests ();Long ll_index, ll_count
String ls_return

ll_count = UpperBound(ist_event.eventobject.Guests)

FOR ll_index = 1 TO ll_count
	IF Len(Trim(ist_event.eventobject.Guests[ll_index].Name)) > 0 THEN
		ls_return = ls_return + ist_event.eventobject.Guests[ll_index].Name
	ELSE
		ls_return = ls_return + ist_event.eventobject.Guests[ll_index].Email
	END IF
	
	IF ll_index < ll_count THEN	
		ls_return = ls_return + ", "
	END IF 
NEXT

RETURN ls_return
end function

public function boolean of_validate ();Time lt_basetime
DateTime ldt_start, ldt_end

IF cbx_allday.checked THEN
	ldt_start = DateTime(Date(dp_startdate.Value), lt_basetime)
	ldt_end = DateTime(Date(dp_enddate.Value), lt_basetime)
	
	IF ldt_end < ldt_start THEN
		MessageBox(inv_resourcemanager.of_GetString("VAL_PowerSchedule_ErrorTitle"), inv_resourcemanager.of_GetString("VAL_PowerSchedule_DateRange"))
		RETURN FALSE
	END IF
	
ELSE
	ldt_start = DateTime(Date(dp_startdate.Value), Time(ddlb_starttime.Text))
	ldt_end = DateTime(Date(dp_enddate.Value), Time(ddlb_endtime.Text))
	
	IF ldt_end <= ldt_start THEN
		MessageBox(inv_resourcemanager.of_GetString("VAL_PowerSchedule_ErrorTitle"), inv_resourcemanager.of_GetString("VAL_PowerSchedule_DateRange"))
		RETURN FALSE
	END IF
END IF



RETURN TRUE
end function

public function integer of_loadcolors (unsignedlong al_selected);uo_colorpicker.of_AddColor("tomato", inv_win32.PBUSMakeARGB (255, 213, 0, 0), RGB (213, 0, 0))
uo_colorpicker.of_AddColor("tangerine", inv_win32.PBUSMakeARGB (255, 244, 81, 30), RGB (244, 81, 30))
uo_colorpicker.of_AddColor("sage", inv_win32.PBUSMakeARGB (255, 52,182,121), RGB (52,182,121))
uo_colorpicker.of_AddColor("peacock", inv_win32.PBUSMakeARGB (255, 3,155,229), RGB (3,155,229))
uo_colorpicker.of_AddColor("lavender", inv_win32.PBUSMakeARGB (255, 121,134,203), RGB (121,134,203))
uo_colorpicker.of_AddColor("graphite", inv_win32.PBUSMakeARGB (255, 97,97,97), RGB (97,97,97))
uo_colorpicker.of_AddColor("flamingo", inv_win32.PBUSMakeARGB (255, 230,124,115), RGB (230,124,115))
uo_colorpicker.of_AddColor("banana", inv_win32.PBUSMakeARGB (255, 246,191,38), RGB (246,191,38))
uo_colorpicker.of_AddColor("basil", inv_win32.PBUSMakeARGB (255, 111,128,67), RGB (111,128,67))
uo_colorpicker.of_AddColor("blueberry", inv_win32.PBUSMakeARGB (255, 63,81,181), RGB (63,81,181))
uo_colorpicker.of_AddColor("grape", inv_win32.PBUSMakeARGB (255, 142,36,170), RGB (142,36,170))

uo_colorpicker.of_SelectColor(al_selected)

RETURN 1
end function

public function integer of_setreadonly (boolean ab_readonly);IF NOT ab_readonly THEN RETURN 2

//BTN_Close

//ddlb_endtime.Enabled = FALSE
//ddlb_starttime.Enabled = FALSE
//cbx_allday.Enabled = FALSE
//dp_enddate.Enabled = FALSE
//dp_startdate.Enabled = FALSE
//sle_title.Enabled = FALSE
//st_placeholder.Visible = FALSE
//rte_description.Enabled = FALSE
//cb_delete.Visible = FALSE
//st_eventdetails.Visible = FALSE
//sle_location.Enabled = FALSE
//st_locationplaceholder.Visible = FALSE
//cbx_private.Enabled = FALSE
//cbx_meeting.Enabled = FALSE
//st_descriptionplaceholder.Visible = FALSE
//sle_guests.Enabled = FALSE
//st_guestsplaceholder.Visible = FALSE
//ddlb_status.Enabled = FALSE
//uo_colorpicker.enabled = FALSE

cb_save.Enabled = FALSE
cb_delete.Enabled = FALSE

RETURN 1
end function

public function string of_getrtftext (string as_source);n_cst_pbus_string lnv_string

IF Left(as_source, 7) <> "{\rtf1\"  THEN
	as_source = lnv_string.of_GlobalReplace(as_source, "\", "\\")
	as_source = lnv_string.of_GlobalReplace(as_source, "{", "\{")
	as_source = lnv_string.of_GlobalReplace(as_source, "}", "\}")
	as_source = "{\rtf1\ansi\ansicpg1252\deff0\nouicompat\deflang1033{\fonttbl{\f0\fnil\fcharset0 Segoe UI;}}\viewkind4\uc1\pard\sa200\sl276\slmult1\f0\fs20" + as_source + "}"
END IF

RETURN as_source
end function

on w_pbus_scheduleevent.create
int iCurrent
call super::create
this.uo_colorpicker=create uo_colorpicker
this.p_coloricon=create p_coloricon
this.p_2=create p_2
this.st_placeholder=create st_placeholder
this.p_1=create p_1
this.ddlb_endtime=create ddlb_endtime
this.ddlb_starttime=create ddlb_starttime
this.cbx_allday=create cbx_allday
this.dp_enddate=create dp_enddate
this.dp_startdate=create dp_startdate
this.sle_title=create sle_title
this.rte_description=create rte_description
this.cb_save=create cb_save
this.cb_delete=create cb_delete
this.st_eventdetails=create st_eventdetails
this.p_location=create p_location
this.sle_location=create sle_location
this.ln_1=create ln_1
this.ln_2=create ln_2
this.ln_3=create ln_3
this.ln_eventdetails=create ln_eventdetails
this.st_locationplaceholder=create st_locationplaceholder
this.p_3=create p_3
this.cbx_private=create cbx_private
this.st_descriptionplaceholder=create st_descriptionplaceholder
this.p_4=create p_4
this.sle_guests=create sle_guests
this.st_guestsplaceholder=create st_guestsplaceholder
this.ddlb_status=create ddlb_status
this.cbx_meeting=create cbx_meeting
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_colorpicker
this.Control[iCurrent+2]=this.p_coloricon
this.Control[iCurrent+3]=this.p_2
this.Control[iCurrent+4]=this.st_placeholder
this.Control[iCurrent+5]=this.p_1
this.Control[iCurrent+6]=this.ddlb_endtime
this.Control[iCurrent+7]=this.ddlb_starttime
this.Control[iCurrent+8]=this.cbx_allday
this.Control[iCurrent+9]=this.dp_enddate
this.Control[iCurrent+10]=this.dp_startdate
this.Control[iCurrent+11]=this.sle_title
this.Control[iCurrent+12]=this.rte_description
this.Control[iCurrent+13]=this.cb_save
this.Control[iCurrent+14]=this.cb_delete
this.Control[iCurrent+15]=this.st_eventdetails
this.Control[iCurrent+16]=this.p_location
this.Control[iCurrent+17]=this.sle_location
this.Control[iCurrent+18]=this.ln_1
this.Control[iCurrent+19]=this.ln_2
this.Control[iCurrent+20]=this.ln_3
this.Control[iCurrent+21]=this.ln_eventdetails
this.Control[iCurrent+22]=this.st_locationplaceholder
this.Control[iCurrent+23]=this.p_3
this.Control[iCurrent+24]=this.cbx_private
this.Control[iCurrent+25]=this.st_descriptionplaceholder
this.Control[iCurrent+26]=this.p_4
this.Control[iCurrent+27]=this.sle_guests
this.Control[iCurrent+28]=this.st_guestsplaceholder
this.Control[iCurrent+29]=this.ddlb_status
this.Control[iCurrent+30]=this.cbx_meeting
end on

on w_pbus_scheduleevent.destroy
call super::destroy
destroy(this.uo_colorpicker)
destroy(this.p_coloricon)
destroy(this.p_2)
destroy(this.st_placeholder)
destroy(this.p_1)
destroy(this.ddlb_endtime)
destroy(this.ddlb_starttime)
destroy(this.cbx_allday)
destroy(this.dp_enddate)
destroy(this.dp_startdate)
destroy(this.sle_title)
destroy(this.rte_description)
destroy(this.cb_save)
destroy(this.cb_delete)
destroy(this.st_eventdetails)
destroy(this.p_location)
destroy(this.sle_location)
destroy(this.ln_1)
destroy(this.ln_2)
destroy(this.ln_3)
destroy(this.ln_eventdetails)
destroy(this.st_locationplaceholder)
destroy(this.p_3)
destroy(this.cbx_private)
destroy(this.st_descriptionplaceholder)
destroy(this.p_4)
destroy(this.sle_guests)
destroy(this.st_guestsplaceholder)
destroy(this.ddlb_status)
destroy(this.cbx_meeting)
end on

event open;call super::open;ist_event = Message.PowerObjectParm

of_SetTheme(ist_event.theme)
of_UseCustomColors(RGB(255,255,255), 0)

of_SetResize(TRUE)
inv_resize.of_Register(sle_title, inv_resize.SCALERIGHT)
inv_resize.of_Register(sle_location, inv_resize.SCALERIGHT)
inv_resize.of_Register(sle_guests, inv_resize.SCALERIGHT)
inv_resize.of_Register(ln_eventdetails, inv_resize.SCALERIGHT)
inv_resize.of_Register(rte_description, inv_resize.SCALERIGHTBOTTOM)
inv_resize.of_Register(uo_colorpicker, inv_resize.FIXEDBOTTOM)
inv_resize.of_Register(p_coloricon, inv_resize.FIXEDBOTTOM)
inv_resize.of_Register(cb_delete, inv_resize.FIXEDBOTTOM)
inv_resize.of_Register(cb_save, inv_resize.FIXEDRIGHTBOTTOM)

of_SetReadOnly(ist_event.IsReadOnly OR ist_event.eventobject.IsReadOnly)

IF ist_event.IsReadOnly THEN
	cb_save.Text = inv_resourcemanager.of_GetString("btn_close")
	cb_save.IconName = ""
ELSE
	cb_save.Text = inv_resourcemanager.of_GetString("btn_save")
END IF

cb_delete.TipText = inv_resourcemanager.of_GetString("BTN_PowerSchedule_DeleteEvent")
st_descriptionplaceholder.Text = inv_resourcemanager.of_GetString("LBL_PowerSchedule_AddDescription")
st_guestsplaceholder.Text = inv_resourcemanager.of_GetString("LBL_PowerSchedule_AddGuests")
cbx_private.Text = inv_resourcemanager.of_GetString("CBX_PowerSchedule_Private")
cbx_meeting.Text = inv_resourcemanager.of_GetString("CBX_PowerSchedule_Meeting")
st_locationplaceholder.Text = inv_resourcemanager.of_GetString("LBL_PowerSchedule_AddLocation")
st_eventdetails.Text = inv_resourcemanager.of_GetString("LBL_PowerSchedule_EventDetails")
cbx_allday.Text = inv_resourcemanager.of_GetString("CBX_PowerSchedule_AllDay")
st_placeholder.Text = inv_resourcemanager.of_GetString("LBL_PowerSchedule_AddTitle")

of_LoadColors(ist_event.eventobject.Color)

cbx_allday.checked = ist_event.eventobject.AllDayEvent
of_ToggleAllDay(ist_event.eventobject.AllDayEvent)

dp_startdate.Value = ist_event.eventobject.StartDateTime
dp_enddate.Value = ist_event.eventobject.EndDateTime

sle_title.Text = ist_event.eventobject.Title

IF Len(Trim(sle_title.Text)) > 0 THEN
	st_placeholder.Hide()
END IF

of_LoadTimeValues(ddlb_starttime, ist_event.increment, ist_event.TimeFormat24Hour)
of_LoadTimeValues(ddlb_endtime, ist_event.increment, ist_event.TimeFormat24Hour)

String ls_timeformat

IF ist_event.TimeFormat24Hour THEN
	ls_timeformat = "hh:mm"
ELSE
	ls_timeformat = "hh:mm am/pm"
END IF

ddlb_starttime.Text = String(Time(ist_event.eventobject.StartDateTime), ls_timeformat)
ddlb_endtime.Text = String(Time(ist_event.eventobject.EndDateTime), ls_timeformat)

sle_Location.Text = ist_event.eventobject.Location

IF Len(Trim(sle_Location.Text)) > 0 THEN
	st_locationplaceholder.Hide()
END IF

ddlb_status.AddItem(inv_resourcemanager.of_GetString("VAL_PowerSchedule_Away"))
ddlb_status.AddItem(inv_resourcemanager.of_GetString("VAL_PowerSchedule_Busy"))
ddlb_status.AddItem(inv_resourcemanager.of_GetString("VAL_PowerSchedule_Free"))
ddlb_status.AddItem(inv_resourcemanager.of_GetString("VAL_PowerSchedule_Tentative"))

CHOOSE CASE ist_event.eventobject.Status
	CASE Busy
		ddlb_status.Text = inv_resourcemanager.of_GetString("VAL_PowerSchedule_Busy")
	CASE Free
		ddlb_status.Text = inv_resourcemanager.of_GetString("VAL_PowerSchedule_Free")
	CASE Tentative
		ddlb_status.Text = inv_resourcemanager.of_GetString("VAL_PowerSchedule_Tentative")
	CASE Away
		ddlb_status.Text = inv_resourcemanager.of_GetString("VAL_PowerSchedule_Away")
END CHOOSE
	

cbx_private.Checked = ist_event.eventobject.IsPrivate
cbx_meeting.Checked = ist_event.eventobject.IsMeeting
sle_guests.Text = of_GetGuests()

IF Len(Trim(sle_guests.Text)) > 0 THEN
	st_guestsplaceholder.Hide()
END IF

IF Len(Trim(ist_event.eventobject.Description)) > 0 THEN
	st_descriptionplaceholder.Hide()
END IF

rte_description.PasteRTF(of_GetRTFText(ist_event.eventobject.Description))

sle_title.SetFocus()

POST Show()
end event

event resize;call super::resize;IF IsValid(inv_resize) THEN
	inv_resize.Trigger Event pfc_resize(sizetype, newwidth, newheight)
END IF
end event

event close;call super::close;of_SetResize(FALSE)
end event

type uo_spa_controls from w_pbus_spa_captionless`uo_spa_controls within w_pbus_scheduleevent
end type

type uo_colorpicker from u_cst_powerschedulecolorpicker within w_pbus_scheduleevent
integer x = 251
integer y = 1964
integer width = 1778
integer height = 100
integer taborder = 40
end type

on uo_colorpicker.destroy
call u_cst_powerschedulecolorpicker::destroy
end on

event colorselected;call super::colorselected;ist_event.eventobject.Color = al_color
end event

type p_coloricon from picture within w_pbus_scheduleevent
integer x = 73
integer y = 1960
integer width = 110
integer height = 96
boolean originalsize = true
string picturename = "powerschedule_color.png"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type p_2 from picture within w_pbus_scheduleevent
integer x = 73
integer y = 1340
integer width = 110
integer height = 96
boolean originalsize = true
string picturename = "powerschedule_note.png"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type st_placeholder from statictext within w_pbus_scheduleevent
integer x = 274
integer y = 160
integer width = 389
integer height = 100
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 8421504
long backcolor = 16777215
string text = "Add Title"
boolean focusrectangle = false
end type

event clicked;sle_title.SetFocus()
end event

type p_1 from picture within w_pbus_scheduleevent
integer x = 73
integer y = 312
integer width = 110
integer height = 96
boolean originalsize = true
string picturename = "powerschedule_calendar.png"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type ddlb_endtime from dropdownlistbox within w_pbus_scheduleevent
integer x = 1006
integer y = 468
integer width = 466
integer height = 576
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_starttime from dropdownlistbox within w_pbus_scheduleevent
integer x = 1006
integer y = 316
integer width = 466
integer height = 576
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cbx_allday from checkbox within w_pbus_scheduleevent
integer x = 251
integer y = 600
integer width = 571
integer height = 104
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 16777215
string text = "All Day"
end type

event clicked;of_ToggleAllDay(THIS.Checked)
end event

type dp_enddate from datepicker within w_pbus_scheduleevent
integer x = 251
integer y = 468
integer width = 686
integer height = 100
integer taborder = 20
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2024-02-05"), Time("07:59:41.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type dp_startdate from datepicker within w_pbus_scheduleevent
integer x = 251
integer y = 316
integer width = 686
integer height = 100
integer taborder = 20
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2024-02-05"), Time("07:59:41.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
integer calendarfontweight = 400
boolean todaysection = true
boolean todaycircle = true
end type

type sle_title from singlelineedit within w_pbus_scheduleevent
event keydown pbm_keydown
event keyup pbm_keyup
integer x = 251
integer y = 152
integer width = 1778
integer height = 120
integer taborder = 10
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event keyup;of_DisplayPlaceholder()
end event

event modified;of_DisplayPlaceholder()
end event

type rte_description from richtextedit within w_pbus_scheduleevent
event keyup pbm_keyup
integer x = 251
integer y = 1352
integer width = 1778
integer height = 548
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long init_inputfieldbackcolor = 12632256
boolean init_popmenu = true
end type

event getfocus;st_descriptionplaceholder.Hide()
end event

event losefocus;of_DisplayDescPlaceHolder()
end event

type cb_save from u_cst_commandbutton within w_pbus_scheduleevent
integer x = 1719
integer y = 2124
integer width = 315
integer taborder = 50
boolean bringtotop = true
string text = "Save"
string iconname = "powerschedule_save.png"
integer cornerradius = 3
end type

event clicked;call super::clicked;Time lt_basetime

IF ist_event.IsReadOnly THEN
	Close(PARENT)
	RETURN
END IF

IF NOT of_Validate() THEN RETURN 0

ist_event.eventobject.Title = sle_title.Text

IF cbx_allday.checked THEN
	ist_event.eventobject.StartDateTime = DateTime(Date(dp_startdate.Value), lt_basetime)
	ist_event.eventobject.EndDateTime = DateTime(Date(dp_enddate.Value), lt_basetime)
ELSE
	ist_event.eventobject.StartDateTime = DateTime(Date(dp_startdate.Value), Time(ddlb_starttime.Text))
	ist_event.eventobject.EndDateTime = DateTime(Date(dp_enddate.Value), Time(ddlb_endtime.Text))
END IF

ist_event.eventobject.AllDayEvent = cbx_allday.checked

ist_event.eventobject.Description = rte_description.CopyRTF(FALSE, Detail!)

ist_event.eventobject.Location = sle_Location.Text
ist_event.eventobject.IsPrivate = cbx_private.Checked
ist_event.eventobject.IsMeeting = cbx_meeting.Checked

CHOOSE CASE ddlb_status.Text
	CASE inv_resourcemanager.of_GetString("VAL_PowerSchedule_Busy")
		ist_event.eventobject.Status = Busy
	CASE inv_resourcemanager.of_GetString("VAL_PowerSchedule_Free")
		ist_event.eventobject.Status = Free
	CASE inv_resourcemanager.of_GetString("VAL_PowerSchedule_Tentative")
		ist_event.eventobject.Status = Tentative
	CASE inv_resourcemanager.of_GetString("VAL_PowerSchedule_Away")
		ist_event.eventobject.Status = Away
END CHOOSE

ist_event.eventobject.EventType = ist_event.EventType

CloseWithReturn(PARENT, ist_event)
end event

type cb_delete from u_cst_commandbutton within w_pbus_scheduleevent
integer x = 87
integer y = 2124
integer width = 169
integer height = 128
integer taborder = 60
boolean bringtotop = true
string text = ""
string tiptext = "Delete Event"
string iconname = "powerschedule_delete.png"
integer cornerradius = 3
integer imagesize = 24
integer imagemargin = 4
end type

event clicked;call super::clicked;
IF NOT ist_event.NewEvent THEN
	
	IF MessageBox(inv_resourcemanager.of_GetString("VAL_PowerSchedule_ConfirmDeleteTitle"), inv_resourcemanager.of_GetString("VAL_PowerSchedule_ConfirmDelete"), Question!, YesNo!) = 1 THEN
		ist_event.deleteevent = TRUE
	
		CloseWithReturn(PARENT, ist_event)
	END IF
ELSE
	Close(PARENT)
END IF
end event

type st_eventdetails from statictext within w_pbus_scheduleevent
integer x = 224
integer y = 740
integer width = 457
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 8421504
long backcolor = 16777215
string text = " Event Details"
boolean focusrectangle = false
end type

type p_location from picture within w_pbus_scheduleevent
integer x = 73
integer y = 876
integer width = 110
integer height = 96
boolean bringtotop = true
boolean originalsize = true
string picturename = "powerschedule_location.png"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type sle_location from singlelineedit within w_pbus_scheduleevent
event keydown pbm_keydown
event keyup pbm_keyup
integer x = 251
integer y = 876
integer width = 1778
integer height = 100
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

event keyup;IF Len(Trim(THIS.Text)) = 0 THEN
	st_locationplaceholder.Show()
ELSE
	st_locationplaceholder.Hide()
END IF

RETURN 1
end event

event modified;IF Len(Trim(THIS.Text)) = 0 THEN
	st_locationplaceholder.Show()
ELSE
	st_locationplaceholder.Hide()
END IF

RETURN 1
end event

type ln_1 from line within w_pbus_scheduleevent
long linecolor = 33554432
integer linethickness = 4
integer beginx = 1554
integer beginy = 368
integer endx = 1554
integer endy = 520
end type

type ln_2 from line within w_pbus_scheduleevent
long linecolor = 33554432
integer linethickness = 4
integer beginx = 1522
integer beginy = 368
integer endx = 1554
integer endy = 368
end type

type ln_3 from line within w_pbus_scheduleevent
long linecolor = 33554432
integer linethickness = 4
integer beginx = 1522
integer beginy = 516
integer endx = 1554
integer endy = 516
end type

type ln_eventdetails from line within w_pbus_scheduleevent
long linecolor = 8421504
integer linethickness = 4
integer beginx = 73
integer beginy = 788
integer endx = 2030
integer endy = 788
end type

type st_locationplaceholder from statictext within w_pbus_scheduleevent
integer x = 279
integer y = 892
integer width = 530
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 8421504
long backcolor = 16777215
string text = "Add Location"
boolean focusrectangle = false
end type

event clicked;sle_location.SetFocus()
end event

type p_3 from picture within w_pbus_scheduleevent
integer x = 73
integer y = 1028
integer width = 110
integer height = 96
boolean bringtotop = true
boolean originalsize = true
string picturename = "powerschedule_private.png"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type cbx_private from checkbox within w_pbus_scheduleevent
integer x = 763
integer y = 1036
integer width = 274
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 16777215
string text = "Private"
end type

type st_descriptionplaceholder from statictext within w_pbus_scheduleevent
integer x = 279
integer y = 1360
integer width = 526
integer height = 96
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 8421504
long backcolor = 16777215
string text = "Add Description"
boolean focusrectangle = false
end type

event clicked;rte_description.SetFocus()
end event

type p_4 from picture within w_pbus_scheduleevent
integer x = 73
integer y = 1180
integer width = 110
integer height = 96
boolean bringtotop = true
boolean originalsize = true
string picturename = "powerschedule_user.png"
boolean focusrectangle = false
boolean map3dcolors = true
end type

type sle_guests from singlelineedit within w_pbus_scheduleevent
event keydown pbm_keydown
event keyup pbm_keyup
integer x = 251
integer y = 1184
integer width = 1778
integer height = 100
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string pointer = "HyperLink!"
long textcolor = 33554432
boolean displayonly = true
borderstyle borderstyle = stylelowered!
end type

event keyup;IF Len(Trim(THIS.Text)) = 0 THEN
	st_guestsplaceholder.Show()
ELSE
	st_guestsplaceholder.Hide()
END IF

RETURN 1
end event

event modified;IF Len(Trim(THIS.Text)) = 0 THEN
	st_guestsplaceholder.Show()
ELSE
	st_guestsplaceholder.Hide()
END IF

RETURN 1
end event

event getfocus;//Display Guests List
st_guestsplaceholder.SetFocus()
OpenWithParm(w_pbus_scheduleeventguests, ist_event)

IF IsValid(Message.PowerObjectParm) THEN
	ist_event = Message.PowerObjectParm
	THIS.Text = of_GetGuests()
	IF Len(Trim(THIS.Text)) > 0 THEN
		st_guestsplaceholder.Hide()
	ELSE
		st_guestsplaceholder.Show()
	END IF
END IF
end event

type st_guestsplaceholder from statictext within w_pbus_scheduleevent
integer x = 279
integer y = 1200
integer width = 530
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
string pointer = "HyperLink!"
long textcolor = 8421504
long backcolor = 16777215
string text = "Add Guests"
boolean focusrectangle = false
end type

event clicked;sle_guests.SetFocus()
end event

type ddlb_status from dropdownlistbox within w_pbus_scheduleevent
integer x = 265
integer y = 1032
integer width = 416
integer height = 424
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type cbx_meeting from checkbox within w_pbus_scheduleevent
integer x = 1074
integer y = 1036
integer width = 315
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
long backcolor = 16777215
string text = "Meeting"
end type

