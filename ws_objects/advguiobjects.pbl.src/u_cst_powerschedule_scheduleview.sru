$PBExportHeader$u_cst_powerschedule_scheduleview.sru
forward
global type u_cst_powerschedule_scheduleview from u_cst_canvas
end type
type uo_vscroll from u_cst_powerschedulescroll within u_cst_powerschedule_scheduleview
end type
type uo_hscroll from u_cst_powerschedulescroll within u_cst_powerschedule_scheduleview
end type
type paintstruct from structure within u_cst_powerschedule_scheduleview
end type
end forward

type paintstruct from structure
	LongPtr		hdc
	boolean		ferase
	rect		rcpaint
	boolean		frestore
	boolean		fincupdate
	character		rgbreserved[32]
end type

global type u_cst_powerschedule_scheduleview from u_cst_canvas
integer width = 3566
integer height = 2180
event resize pbm_size
event mousemove pbm_mousemove
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event type integer eventchanging ( integer flag,  scheduleevent a_event_original,  ref scheduleevent a_event_new )
event eventchanged ( scheduleevent a_event )
event type long eventadded ( ref scheduleevent a_event )
event lbuttondblclk pbm_lbuttondblclk
event eventdeleted ( scheduleevent a_event )
event daterangechanged ( date startdate,  date enddate )
event type integer eventdeleting ( scheduleevent a_event )
event rightclick ( unsignedlong flags,  integer xpos,  integer ypos,  scheduleevent a_event )
event rbuttonup pbm_rbuttonup
event rightclickselection ( unsignedlong flags,  integer xpos,  integer ypos,  datetime selectedstarttime,  datetime selectedendtime,  boolean alldayevent,  long resourceid )
event eventselected ( scheduleevent a_event )
event cellrangeselected ( datetime startdatetime,  datetime enddatetime,  boolean alldayevent )
event doubleclick ( unsignedlong flags,  integer xpos,  integer ypos,  scheduleevent a_event )
event ue_scroll ( )
uo_vscroll uo_vscroll
uo_hscroll uo_hscroll
end type
global u_cst_powerschedule_scheduleview u_cst_powerschedule_scheduleview

type prototypes
FUNCTION ULong BeginPaint(LongPtr hwnd, Ref PAINTSTRUCT lpPaint) Library "user32.dll" Alias For "BeginPaint;Ansi" 
FUNCTION Boolean EndPaint(LongPtr hwnd, PAINTSTRUCT lpPaint) Library "user32.dll" Alias For "EndPaint;Ansi" 

FUNCTION uint GetDoubleClickTime() Library "user32.dll"

end prototypes

type variables
PUBLIC:
Boolean UseCustomUI = FALSE
Boolean OutlineCurrentDay = TRUE
Boolean CircleCurrentDay = TRUE
Boolean TimeFormat24Hour = FALSE
String Theme = "WINDOWS10_BLUE"
Integer EventCornerRadius = 0
Boolean DisplayCurrentTimeIndicator = TRUE
Boolean IsReadOnly = FALSE
Boolean DisplayLocationInEvent = TRUE
Boolean DisplayDescriptionInEvent = FALSE
Boolean CreateNewEventOnClick = TRUE
Boolean CreateNewEventOnMouseDrag = TRUE
Boolean OnlyShowWorkingHours = FALSE
Boolean RenderDefaultResource = TRUE
Boolean DrawDiagnotics = FALSE
Boolean HideTime = FALSE
Boolean AllowResourceMoving = TRUE

String PrivateEvent_Image = "powerschedule_privateevent.png"
String RecurringEvent_Image = "powerschedule_recurringevent.png"
String MeetingEvent_Image = "powerschedule_meetingevent.png"

CONSTANT Int Day = 1
CONSTANT Int Week = 2
CONSTANT Int WorkWeek = 3
CONSTANT Int Month = 4

Int DefaultView = Week

CONSTANT Int Sunday = 1
CONSTANT Int Monday = 2
CONSTANT Int Tuesday = 3
CONSTANT Int Wednesday = 4
CONSTANT Int Thursday = 5
CONSTANT Int Friday = 6
CONSTANT Int Saturday = 7

Int StartOfWeek = Sunday
Int StartOfWorkWeek = Monday
Int NumberOfDaysInWorkWeek = 5
Int MinAppointmentIncrement = 15
Int MinCellSelectionsIncrement = 30

String FontName = "Segoe UI"
Int DayTextFontSize = 12
Int DayNumberFontSize = 18
Int TextSize = 8
Int TimeSize = 8

ULong BackgroundColor = RGB(255,255,255)
ULong TextColor = RGB(112, 117, 122)

Date CurrentDate

String NoTitle = "LBL_PowerSchedule_NoTitle"
String AM = "LBL_PowerSchedule_AM"
String PM = "LBL_PowerSchedule_PM"

CONSTANT Int Busy = 1
CONSTANT Int Free = 2
CONSTANT Int Tentative = 3
CONSTANT Int Away = 4

LongPtr iul_textfont

CONSTANT Int Appointment = 1
CONSTANT Int Meeting = 2
CONSTANT Int Task = 3

Int DefaultEventType = Appointment


n_cst_pbui_theme inv_color_theme

str_schedulemappedevents s_loadedevents[]
str_schedulemappedevents s_otherloadedevents[]
n_uspb_hashtable in_loadedresources

scheduleeventguest s_availableguests[]

LongPtr iul_daytextfont, iul_daynumberfont, iul_timefont
LongPtr iul_textfontbold, iul_daytextfontbold, iul_daynumberfontbold
LongPtr iul_smallfont

LongPtr iul_hBitmap
GdiplusStartupInput  istr_input
GdiplusStartupOutput istr_output
LongPtr iul_GdiToken

CONSTANT LONG ALIGN_LEFT = 0
CONSTANT LONG ALIGN_CENTER = 1
CONSTANT LONG ALIGN_RIGHT = 2
LONG DT_RTLREADING = 2//131072

CONSTANT LONG DT_NOCLIP = 256
CONSTANT LONG DT_VTOP = 0
CONSTANT LONG DT_VBOTTOM = 8
CONSTANT LONG DT_VCENTER = 4
CONSTANT LONG DT_HCENTER = 1
CONSTANT LONG DT_HRIGHT = 2
CONSTANT LONG DT_WORD_ELLIPSIS = 262144
CONSTANT LONG DT_CALCRECT = 1024
CONSTANT LONG DT_WORDBREAK = 16

CONSTANT INT DefaultHeaderHeight = 30
CONSTANT INT TimeWidth = 60
CONSTANT INT DefaultFullDayHeight = 24
CONSTANT INT MonthEventHeight = 22
CONSTANT INT MonthDayNameHeight = 20

Int ResourceColumnWidth = 200
Int TimeRowHeight = 48
Int TimeColumnWidth = 200
Int OriginalTimeRowHeight = 48

Long FullDayHeight = 24
Long HeaderHeight = 84

Long il_yscroll = 0
Long il_xscroll = 0
Long il_totalheight = 0
Date id_StartDate

Boolean ib_eventmoving
Boolean ib_eventresizing
Boolean ib_eventresizingclicked
Boolean ib_eventresizestart
Boolean ib_isselecting
Int ii_resizebordersize = 6
Int ii_eventleftmargin = 10

Long il_lastxpos, il_lastypos
Long il_clickxoffset, il_clickyoffset
Long il_clickxpos, il_clickypos
Long il_lbuttonxpos, il_selectionx
Long il_clickresourcey

DateTime idt_selectedtime, idt_selectedendtime
str_schedulemappedevents istr_movingevent
str_schedulemappedevents istr_selectedevent
str_schedulemappedevents istr_mouseoverevent
str_schedulemappedevents istr_resizingevent
str_schedulemappedevents istr_newevent
str_schedulemappedevents istr_selectedcell
scheduleevent i_newevent
scheduleevent i_movingevent
str_scheduleeventmore istr_morelinks[]

n_cst_powerschedulehelper inv_helper

Point ip_monthmovingstart, ip_monthmovingnew
Int ii_movingrelativedays

Boolean ib_eventsloaded
Boolean ib_cancelmonthlbuttonup
n_uspb_resourcemanager inv_resourcemanager

//Print Settings
Long il_printwidth, il_printheight
Boolean ib_printing
Boolean ib_printworkinghoursonly
String is_printtitle

Long il_resourceid
String is_resourcename

//Working hours
Boolean WorkSunday = TRUE
Boolean WorkMonday = TRUE
Boolean WorkTuesday = TRUE
Boolean WorkWednesday = TRUE
Boolean WorkThursday = TRUE
Boolean WorkFriday = TRUE
Boolean WorkSaturday = TRUE
Time WorkStartTime = Time(0,0,0)
Time WorkEndTime = Time(23,59,59)

Date id_workingdates[]

n_cst_ui_imagelist inv_imagelist
Long il_privateimage, il_recurringimage, il_meetingimage
LongPtr il_imagelistsmall
CONSTANT Integer ILD_IMAGE = 32

CONSTANT Integer EVENT_DOUBLE_CLICKED = 1
CONSTANT Integer EVENT_MOVED = 2
CONSTANT Integer EVENT_RESIZED = 3
CONSTANT Integer EVENT_UPDATED = 4

SingleLineEdit sle_scheduletitleedit

string eventexecution
Time it_lbuttonuptime

n_cst_powerschedule_titleedittimer inv_titleedittimer
end variables

forward prototypes
private function integer of_drawgrid (longptr aul_graphics, longptr aul_hdc)
private function integer of_drawbackground (longptr hdc)
public function integer of_setcurrentdate (date ad_currentdate)
private function integer of_drawtext (longptr hdc, longptr al_font, string as_text, long al_align, long al_valign, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color)
private function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue)
public function integer of_loadevents (scheduleevent a_events[])
private function integer of_eventindexof (str_schedulemappedevents a_events[], str_schedulemappedevents a_event)
private function integer of_gethourrangerectangle (datetime a_start, datetime a_end, ref s_rect a_rect)
public function integer of_getloadedevents (ref scheduleevent a_events[])
public function integer of_releasemouse ()
public function integer of_capturemouse ()
private function integer of_getdaywidth ()
public function integer of_getdaycount ()
private function integer of_drawwrappedtext (longptr hdc, longptr al_font, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color)
public function datetime of_findclosestdatetime (long al_x, long al_y)
public function unsignedlong of_getcolor (string as_color)
private function integer of_sortevents (ref scheduleevent a_events[])
private function integer of_newevent ()
public function integer of_settheme (string as_theme)
private function unsignedlong of_getthemecolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue)
private function integer of_drawcurrenttimeindicator (longptr aul_graphics, longptr hdc, unsignedlong al_color)
public function integer of_setavailableguests (scheduleeventguest a_availableguests[])
public function longptr of_createfont (longptr hdc, string as_fontname, integer ai_fontsize, boolean ab_bold)
public function integer of_createnewevent (datetime ad_startdate)
public function integer of_print ()
private function integer of_drawmovingevent (longptr hdc, longptr aul_graphics)
private function integer of_drawnewevent (longptr hdc, longptr aul_graphics)
public function integer of_drawfulldayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean ab_startsbeforeweek, boolean ab_endsafterweek)
public function integer of_drawfulldayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean ab_startsbeforeweek, boolean ab_endsafterweek, boolean ab_selected)
public function boolean of_eventisselected (str_schedulemappedevents a_event)
public function integer of_deleteevent (str_schedulemappedevents astr_event)
public function integer of_drawselectshadow (longptr aul_graphics, long a_x, long a_y, long a_width, long a_height)
public function boolean of_eventismouseover (str_schedulemappedevents a_event)
public function integer of_changecursor (long al_x, long al_y)
public function integer of_draweventstatus (longptr hdc, scheduleevent a_event, unsignedlong a_eventcolor, long a_x, long a_y, long a_width, long a_height)
public function boolean of_cursorovermonthresizehandle (long al_x, long al_y, ref boolean ab_left)
public function scheduleevent of_getevent (long eventid)
public function scheduleevent of_getselectedevent ()
private function integer of_drawselectionfullday (longptr hdc, longptr aul_graphics)
public function integer of_createnewevent (datetime ad_startdate, datetime ad_enddate, boolean ab_alldayevent, integer ai_eventtype)
public function integer of_clearselection ()
public function integer of_addevent (scheduleevent a_event)
public function integer of_deleteevent (long eventid)
public function integer of_updateevent (scheduleevent a_event)
public function integer of_editevent (str_schedulemappedevents lstr_event, integer flag)
public function integer of_getselection (ref datetime startdatetime, ref datetime enddatetime, ref boolean alldayevent)
public function integer of_setminappointmentincrement (integer ai_value)
public function integer of_seticonimages (string as_privateimage, string as_recurringimage, string as_meetingimage)
private function string of_geteventtitle (scheduleevent a_event)
public function integer of_finishtitleedit ()
public function integer of_showtitleeditor ()
public function integer of_updateselectionmonth (long al_x, long al_y)
public function integer of_getdaterange (ref date ad_start, ref date ad_end)
public function integer of_gettotalhours ()
public function integer of_gettotalworkinghours ()
public function integer of_setdefaultview (integer ai_view)
private function integer of_drawfulldayevents (longptr hdc, longptr aul_graphics)
public function integer of_displayworkinghoursonly (boolean ab_switch)
private function integer of_destroyevents (long ai_resourceid)
public function integer of_loadevents (long ai_resourceid, scheduleevent a_events[])
public function integer of_loadmappedevents (long ai_resourceid, ref str_schedulemappedevents a_events[])
private function integer of_updateeventcords ()
public function integer of_loadadditionalevents (long ai_resourceid, string ai_resourcename, scheduleevent a_events[])
public function integer of_removeadditionalevents (long ai_resourceid)
public function integer of_setresource (long ai_resourceid, string as_resourcename)
public function integer of_addresource (long ai_resourceid, string ai_resourcename)
public function integer of_bulkloadadditionalevents (scheduleevent a_events[])
private function str_schedulemappedevents of_geteventforpos (long xpos, long ypos)
public function integer of_renderdefaultresource (boolean ab_value)
public function integer of_drawdiagnostics (longptr ahdc, longptr agrahpics)
public function integer of_settimecolumnwidth (integer ai_value)
public function integer of_scrolltodate (date a_date)
private function time of_findclosesttime (long al_x)
public function long of_getresourceidfrompos (long al_y)
public function long of_getresourceyfromid (long al_resourceid)
public function integer of_loadworkingdates ()
public function integer of_updateselection (long al_startx, long al_endx)
public function integer of_getloadedresources (ref str_scheduleeventresources a_resources[])
public function long of_workspaceheight ()
public function long of_workspacewidth ()
public function integer of_scrolltodatetime (datetime a_date)
public function integer of_addresourcegroup (long ai_resourceid, string ai_resourcename)
public function integer of_removealladditionalresources ()
public function long of_getxcordfromdate (datetime a_date)
public function datetime of_getfirstvisibledatetime ()
public function long of_getfirstvisibleresourceid ()
public function integer of_scrolltoresourceid (long al_resourceid)
public function long of_getresourceidfrompos (long al_y, boolean ab_includeresourcegroup)
public function integer of_hidetime (boolean ab_switch, boolean ab_redraw)
public function integer of_changeeventcollection (scheduleevent a_event, ref str_schedulemappedevents a_fromeventcollection[], ref str_schedulemappedevents a_toeventcollection[])
public function integer of_allowmovingbetweenresources (boolean ab_value)
end prototypes

event resize;IF NewWidth <= 0 THEN RETURN

Int TotalHours
Long ll_scrollwidth
Long ll_scrollheight
Boolean lb_showhscroll, lb_showvscroll

ll_scrollwidth = NewWidth - PixelsToUnits(ResourceColumnWidth, XPixelsToUnits!)
ll_scrollheight = NewHeight - PixelsToUnits(HeaderHeight, YPixelsToUnits!)

IF OnlyShowWorkingHours THEN
	TotalHours = of_GetTotalWorkingHours()
ELSE
	TotalHours = of_GetTotalHours()
END IF

IF (TimeColumnWidth * TotalHours) > UnitsToPixels(NewWidth, XUnitsToPixels!)  THEN
	lb_showhscroll = TRUE
ELSE
	il_xscroll = 0
	uo_hscroll.Hide()
END IF

IF PixelsToUnits(il_totalheight - ScaleDPI(DefaultFullDayHeight), YPixelsToUnits!) > ll_scrollheight THEN
	lb_showvscroll = TRUE
ELSE
	il_yscroll = 0
	uo_vscroll.Hide()
END IF

IF lb_showhscroll THEN
	ll_scrollheight -= uo_hscroll.Height
END IF

IF lb_showvscroll THEN
	ll_scrollwidth -= uo_vscroll.Width
END IF

uo_hscroll.Move(PixelsToUnits(ResourceColumnWidth, XPixelsToUnits!), NewHeight - uo_hscroll.Height - ScaleDPI(8))
uo_hscroll.Resize(ll_scrollwidth, uo_hscroll.Height)

uo_vscroll.Move(NewWidth - uo_vscroll.Width, PixelsToUnits(HeaderHeight, YPixelsToUnits!))
uo_vscroll.Resize(uo_vscroll.Width, ll_scrollheight)

IF lb_showhscroll THEN
	uo_hscroll.of_SetSliderSize( ((UnitsToPixels(ll_scrollwidth, XUnitsToPixels!)) / (TimeColumnWidth * TotalHours)) * (UnitsToPixels(ll_scrollwidth, XUnitsToPixels!)), ScaleDPI(10))
	uo_hscroll.of_SetMaxPosition(UnitsToPixels(ll_scrollwidth, XUnitsToPixels!))
	uo_hscroll.Show()
END IF

IF lb_showvscroll THEN
	uo_vscroll.of_SetSliderSize( ((UnitsToPixels(NewHeight, YUnitsToPixels!) - HeaderHeight) / il_totalheight) * (UnitsToPixels(NewHeight, YUnitsToPixels!) - HeaderHeight), ScaleDPI(10))
	uo_vscroll.of_SetMaxPosition(UnitsToPixels(ll_scrollheight, YUnitsToPixels!))
	uo_vscroll.Show()
END IF

IF SizeType <> 99 THEN
	IF uo_hscroll.Visible THEN
		uo_hscroll.Position = (Abs(il_xscroll) / ((TimeColumnWidth * TotalHours))) * uo_hscroll.MaxPosition
		uo_hscroll.Trigger Event Moved(uo_hscroll.Position)
	END IF
	
	IF uo_vscroll.Visible AND il_totalheight > 0 THEN
		uo_vscroll.Position = (Abs(il_yscroll) / il_totalheight) * uo_vscroll.MaxPosition
		uo_vscroll.Trigger Event Moved(uo_vscroll.Position)
	END IF
END IF
end event

event mousemove;IF IsReadOnly THEN RETURN

Long ll_height, ll_delta, ll_width, ll_scrollwidth, li_eventslotwidth, li_totalhours
Boolean lb_alldayevent
s_rect l_eventrect
Long li_y, li_x, ll_daywidth
Time lt_newtime
DateTime ldt_newstart, ldt_newend, lt_newdatetime
Date ld_basedate
Long ll_durationseconds, ll_newday
Long ll_x, ll_y
str_schedulemappedevents lstr_selectedevent
Double li_eventslotheight, li_linecount

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

IF ll_x <= ResourceColumnWidth THEN RETURN

of_ChangeCursor(ll_x, ll_y)

IF KeyDown(KeyLeftButton!) AND (IsValid(istr_movingevent) OR IsValid(istr_newevent) OR ib_isselecting)THEN
	
	IF il_clickxpos > 0 THEN
		IF Abs(il_clickxpos - ll_x) < ScaleDPI(35) THEN
			RETURN
		ELSE
			il_clickxpos = 0
			il_clickypos = 0
		END IF
	END IF 
	
	istr_selectedevent = lstr_selectedevent
	
	IF IsValid(istr_movingevent) THEN
		IF istr_movingevent.eventobject.IsReadOnly THEN RETURN 0
		
		IF NOT istr_movingevent.eventobject.AllDayEvent THEN
			IF NOT ib_eventresizingclicked THEN
				ib_eventmoving = TRUE
				istr_movingevent.ismoving = TRUE
			ELSE
				ib_eventresizing = TRUE
			END IF
		END IF
		
		lb_alldayevent = istr_movingevent.DisplayAsAllDayEvent
		l_eventrect = istr_movingevent.rectregion
	END IF
	
	IF IsValid(istr_newevent) THEN
		lb_alldayevent = istr_newevent.eventobject.AllDayEvent
		l_eventrect = istr_newevent.rectregion
	END IF
	
	IF IsValid(istr_selectedcell) AND ib_isselecting THEN
		lb_alldayevent = istr_selectedcell.eventobject.AllDayEvent
	END IF
	
	ll_height = UnitsToPixels(Height, YUnitsToPixels!)
	
	IF uo_vscroll.Visible THEN
		ll_scrollwidth = uo_vscroll.Width + 16
	END IF
	
	ll_width = UnitsToPixels(Width - ll_scrollwidth, XUnitsToPixels!)
	
	ll_delta = il_lastxpos
	
	il_lastxpos = UnitsToPixels(xpos, XUnitsToPixels!)
	il_lastypos = UnitsToPixels(ypos, YUnitsToPixels!)
	
	IF ll_delta > 0 THEN
		ll_delta = il_lastxpos - ll_delta
	END IF
	
	//HANDLE SCROLL
	IF 	OnlyShowWorkingHours THEN
		li_totalhours = of_GetTotalWorkingHours()
	ELSE
		li_totalhours = of_GetTotalHours()
	END IF

	IF il_lastxpos < ResourceColumnWidth AND ll_delta < 0 THEN
		//scroll left
		il_xscroll -= (ll_delta * ScaleDPI(6))
		
		IF il_xscroll >= 0 THEN
			il_xscroll = 0
		END IF
		
		//FIX THIS
		uo_hscroll.Position = (Abs(il_xscroll) / (li_totalhours * TimeColumnWidth)) * uo_hscroll.MaxPosition
		uo_hscroll.SetRedraw(TRUE)
	ELSE
		IF il_lastxpos > ll_width AND ll_delta > 0 THEN
			//scroll right
			il_xscroll -= (ll_delta * ScaleDPI(6))
			
			IF il_xscroll < (ll_width  - ResourceColumnWidth) - ((li_totalhours * TimeColumnWidth)) THEN
				il_xscroll = (ll_width  - ResourceColumnWidth) - ((li_totalhours * TimeColumnWidth))
			END IF
			
			uo_hscroll.Position = (Abs(il_xscroll) / (li_totalhours * TimeColumnWidth)) * uo_hscroll.MaxPosition
			uo_hscroll.SetRedraw(TRUE)
		END IF
	END IF

	
	IF KeyDown(KeyLeftButton!) AND ib_isselecting AND NOT CreateNewEventOnMouseDrag THEN
		il_selectionx = ll_x
		
		IF il_selectionx > il_lbuttonxpos THEN
			il_selectionx += TimeColumnWidth / (60 / Min(MinAppointmentIncrement, MinCellSelectionsIncrement))

		END IF
		
		of_UpdateSelection(Min(il_selectionx, il_lbuttonxpos), Max(il_selectionx, il_lbuttonxpos))
		RETURN
	END IF
	
	//RESIZE EVENT CODE
	IF IsValid(istr_movingevent) AND ib_eventresizing THEN
		IF NOT istr_movingevent.eventobject.IsReadonly AND NOT lb_alldayevent THEN
			IF ib_eventresizestart THEN
				ldt_newstart = of_FindClosestDateTime(il_lastxpos, il_lastypos)				
				ldt_newend = istr_movingevent.eventobject.EndDateTime
				
				IF MinAppointmentIncrement >  inv_helper.of_SecondsAfter(ldt_newstart, ldt_newend) / 60 THEN
					RETURN
				END IF
			ELSE
				ldt_newend = of_FindClosestDateTime(il_lastxpos, il_lastypos)
				ldt_newstart = istr_movingevent.eventobject.StartDateTime
				
				IF MinAppointmentIncrement >  inv_helper.of_SecondsAfter(ldt_newstart, ldt_newend) / 60 THEN
					RETURN
				END IF
			END IF
			
			istr_movingevent.eventobject.StartDateTime = ldt_newstart
			istr_movingevent.eventobject.EndDateTime = ldt_newend
			
			IF OnlyShowWorkingHours THEN
				//If the end time after the move is the start time of the next day, we need to make the end time the end time of the previous day
				IF Time(ldt_newend) = WorkStartTime THEN
					istr_movingevent.eventobject.EndDateTime = DateTime(inv_Helper.of_GetClosestWorkingDate(THIS, RelativeDate(Date(ldt_newend), -1)), WorkEndTime)
				END IF
			END IF
			
			of_UpdateEventCords()
		END IF
	END IF
	
	//MOVING EVENT MOVE
	IF IsValid(istr_movingevent) AND NOT lb_alldayevent AND ib_eventmoving THEN
		IF NOT istr_movingevent.eventobject.IsReadonly THEN
			
			ll_durationseconds = inv_helper.of_SecondsAfter(istr_movingevent.eventobject.StartDateTime, istr_movingevent.eventobject.EndDateTime)
			
			ldt_newstart = of_FindClosestDateTime(ll_x - il_clickxoffset, li_y)
			
			IF Date(ldt_newstart) = ld_basedate THEN RETURN
			
			ldt_newend = inv_helper.of_RelativeDatetime(ldt_newstart, ll_durationseconds)
			
			istr_movingevent.eventobject.StartDateTime = ldt_newstart
			istr_movingevent.eventobject.EndDateTime = ldt_newend
			
			IF AllowResourceMoving THEN
				Long resourceId 
				resourceId = of_GetResourceIdFromPos(il_lastypos)
				
				IF resourceId > 0 THEN
					
					IF resourceId <> il_resourceid AND istr_movingevent.eventobject.ResourceId = il_resourceid THEN
						//New resource id is not the main resource and the event is for the main resource
						//Move this event to the additonal event collection
						of_ChangeEventCollection(istr_movingevent.eventobject, s_loadedevents, s_otherloadedevents)
					ELSE
						IF resourceId = il_resourceid AND istr_movingevent.eventobject.ResourceId <> il_resourceid THEN
							//The new resource id is the main resourece and the event is for an additional resource
							//Move this event to the main resource event collection
							of_ChangeEventCollection(istr_movingevent.eventobject, s_otherloadedevents, s_loadedevents)
						END IF
					END IF
					
					istr_movingevent.eventobject.ResourceId = resourceId
				END IF
			END IF
			
			of_UpdateEventCords()
		END IF
	END IF 
	
	
	//NEW EVENT MOVE
	IF IsValid(istr_newevent) THEN
		lt_newdatetime = of_FindClosestDateTime(ll_x, il_lastypos)

		IF istr_newevent.eventobject.StartDateTime < lt_newdatetime THEN
			ldt_newstart = istr_newevent.eventobject.StartDateTime
			ldt_newend = lt_newdatetime
		ELSEIF istr_newevent.eventobject.StartDateTime > lt_newdatetime THEN
			ldt_newstart = lt_newdatetime
			ldt_newend = istr_newevent.eventobject.EndDateTime
		ELSEIF istr_newevent.eventobject.StartDateTime = lt_newdatetime THEN
			//Give a minimum event duration of the min appointment increment
			ldt_newstart = istr_newevent.eventobject.StartDateTime
			ldt_newend = inv_helper.of_RelativeDateTime(ldt_newstart, MinAppointmentIncrement * 60)
		END IF
		
		IF OnlyShowWorkingHours THEN
			//If the end time after the move is the start time of the next day, we need to make the end time the end time of the previous day
			IF Time(ldt_newend) = WorkStartTime THEN
				ldt_newend = DateTime(inv_Helper.of_GetClosestWorkingDate(THIS, RelativeDate(Date(ldt_newend), -1)), WorkEndTime)
			END IF
		END IF
		
		i_newevent = istr_newevent.eventobject
		i_newevent.StartDateTime = ldt_newstart
		i_newevent.EndDateTime = ldt_newend

	END IF
	
	SetRedraw(TRUE)
END IF
end event

event lbuttondown;inv_titleedittimer.Stop()
IF IsReadOnly THEN RETURN

Long ll_index, ll_count
Long ll_x, ll_y
Double li_eventslotwidth
str_schedulemappedevents lstr_eventforpos
str_schedulemappedevents lstr_movingevent
str_schedulemappedevents lstr_newevent
str_schedulemappedevents lstr_selectedevent
scheduleevent l_newevent
scheduleevent l_movingevent

istr_movingevent = lstr_movingevent
istr_newevent = lstr_newevent
i_newevent = l_newevent
i_movingevent = l_movingevent

IF IsValid(istr_selectedcell) THEN DESTROY istr_selectedcell

SetFocus(THIS)

il_clickxpos = xpos

ll_y = UnitsToPixels(ypos, YUnitsToPixels!)
ll_x = UnitsToPixels(xpos, XUnitsToPixels!)


IF ll_y < HeaderHeight THEN RETURN
IF ll_x < ResourceColumnWidth THEN	 RETURN
	
of_ChangeCursor(ll_x, ll_y)

IF OnlyShowWorkingHours THEN
	of_LoadWorkingDates()
END IF

istr_movingevent = of_GetEventForPos(xpos,ypos)

IF IsValid(istr_movingevent) THEN
	IF NOT istr_movingevent.eventobject.AllDayEvent THEN
		IF ll_x - istr_movingevent.rectregion.Left <= ii_resizebordersize OR &
			 istr_movingevent.rectregion.Right - ll_x <= ii_resizebordersize THEN
			ib_eventresizingclicked = TRUE
			
			ib_eventresizestart =  (ll_x < istr_movingevent.rectregion.Left + ((istr_movingevent.rectregion.Right - istr_movingevent.rectregion.Left) / 2))
		END IF
		 
	    il_clickxoffset = ll_x - istr_movingevent.rectregion.Left
		 
		i_movingevent = istr_movingevent.eventobject
		of_CaptureMouse()
	END IF
ELSE

	Integer li_min
	Long ll_clickedresourceid
	
	ll_clickedresourceid = of_GetResourceIdFromPos(ll_y)
	
	IF ll_clickedresourceid = -1 THEN RETURN
	
	il_clickresourcey = of_GetResourceYFromId(ll_clickedresourceid)
	
	IF il_clickresourcey = -1 THEN RETURN
	
	li_min = MinAppointmentIncrement
	
	//For drag selection, we will artificially set the min minutes to 30
	IF NOT CreateNewEventOnMouseDrag THEN
		MinAppointmentIncrement = Max(MinCellSelectionsIncrement, MinAppointmentIncrement)
	END IF
		
	lstr_newevent = CREATE str_schedulemappedevents
	lstr_newevent.eventwidth = of_GetDayWidth()
	lstr_newevent.eventobject.StartDateTime = of_FindClosestDatetime(ll_x, ll_y)
	
	li_eventslotwidth = Double(TimeColumnWidth) / (60.0 / Double(MinAppointmentIncrement))
	il_clickxoffset = ll_x - (Long((ll_x) / li_eventslotwidth) * li_eventslotwidth)

	il_lbuttonxpos =  ll_x	
	il_selectionx = il_lbuttonxpos
	
	lstr_newevent.eventobject.EndDateTime = inv_helper.of_RelativeDateTime(lstr_newevent.eventobject.StartDateTime, MinAppointmentIncrement * 60)
	
	of_CaptureMouse()
	
	MinAppointmentIncrement = li_min

	lstr_newevent.eventobject.Color = of_GetColor("peacock")
	lstr_newevent.eventobject.TextColor = RGB(255,255,255)
	lstr_newevent.eventobject.resourceid = ll_clickedresourceid
	
	IF NOT CreateNewEventOnMouseDrag THEN
		IF IsValid(istr_selectedcell) THEN DESTROY istr_selectedcell
		
		istr_selectedcell = lstr_newevent
		ib_isselecting = TRUE
		idt_selectedtime = lstr_newevent.eventobject.StartDateTime
		idt_selectedendtime = lstr_newevent.eventobject.EndDateTime
	ELSE
		istr_newevent = lstr_newevent
	END IF
END IF


end event

event lbuttonup;IF IsReadOnly THEN RETURN

Long ll_daycount, ll_daywidth, ll_containerwidth
Long ll_scrollwidth, ll_newday
Long ll_xpos, ll_ypos
str_schedulemappedevents lstr_empty
scheduleevent l_events[]
str_scheduleeventedit lstr_edit
DateTime ldt_min, ldt_end

IF ib_isselecting THEN
	POST SetRedraw(TRUE)
	IF IsValid(istr_selectedcell) THEN
		
		ldt_end = istr_selectedcell.eventobject.EndDateTime
		
		IF OnlyShowWorkingHours THEN
			//If the end time after the move is the start time of the next day, we need to make the end time the end time of the previous day
			IF Time(ldt_end) = WorkStartTime THEN
				ldt_end = DateTime(inv_Helper.of_GetClosestWorkingDate(THIS, RelativeDate(Date(ldt_end), -1)), WorkEndTime)
			END IF
		END IF
	
		TRIGGER EVENT CellRangeSelected(istr_selectedcell.eventobject.StartDateTime, ldt_end, istr_selectedcell.eventobject.AllDayEvent)
	END IF
END IF

ib_eventresizingclicked = FALSE
ib_isselecting = FALSE

IF IsValid(istr_newevent) THEN
	
	IF i_newevent.StartDateTime = ldt_min THEN
		
		IF CreateNewEventOnClick THEN
			il_lastxpos = UnitsToPixels(xpos, XUnitsToPixels!)
			il_lastypos = UnitsToPixels(ypos, YUnitsToPixels!)
			istr_newevent.eventobject.StartDateTime = of_FindClosestDateTime(il_lastxpos, il_lastypos)
			istr_newevent.eventobject.EndDateTime = inv_helper.of_RelativeDateTime(istr_newevent.eventobject.StartDateTime, 3600)
			i_newevent = istr_newevent.eventobject
			
			POST of_NewEvent()
		ELSE
			of_ReleaseMouse()
			DESTROY istr_newevent
		END IF
		
		SetRedraw(TRUE)
		RETURN
	END IF
	
	of_NewEvent()
END IF

//Select event
IF IsValid(istr_movingevent) AND NOT ib_eventmoving AND NOT ib_eventresizing THEN
	
	IF istr_selectedevent = istr_movingevent AND NOT istr_movingevent.eventobject.IsReadOnly THEN
		Double lui_doubleclicktime

		//We need to edit the title on a timer to make sure we're not actually double clicking. If DoubleClick is triggered, we'll stop the timer.
		lui_doubleclicktime = GetDoubleClickTime() 
		inv_titleedittimer.Start(lui_doubleclicktime / 1000.00)
	ELSE
	
		istr_selectedevent = istr_movingevent
		SetRedraw(TRUE)
		TRIGGER EVENT EventSelected(istr_selectedevent.eventobject)
	END IF
ELSE
	istr_selectedevent = lstr_empty
END IF

IF IsValid(istr_movingevent) AND ib_eventresizing THEN
	IF Event EventChanging(EVENT_MOVED, i_movingevent, istr_movingevent.eventobject) > 0 THEN
		Event EventChanged(istr_movingevent.eventobject)
	ELSE
		istr_movingevent.eventobject.StartDateTime = i_movingevent.StartDatetime
		istr_movingevent.eventobject.EndDateTime = i_movingevent.EndDatetime
		
		IF AllowResourceMoving THEN
			istr_movingevent.eventobject.ResourceId = i_movingevent.ResourceId
		END IF
		
		of_UpdateEventCords()
		SetRedraw(TRUE)
	END IF
END IF

IF IsValid(istr_movingevent) AND ib_eventmoving THEN
	istr_movingevent.ismoving = FALSE

	IF Event EventChanging(EVENT_MOVED, i_movingevent, istr_movingevent.eventobject) > 0 THEN
		Event EventChanged(istr_movingevent.eventobject)
	ELSE
		istr_movingevent.eventobject.StartDateTime = i_movingevent.StartDatetime
		istr_movingevent.eventobject.EndDateTime = i_movingevent.EndDatetime
		
		of_UpdateEventCords()
		SetRedraw(TRUE)
	END IF
END IF

of_ReleaseMouse()

ib_eventmoving = FALSE
ib_eventresizing = FALSE
end event

event type integer eventchanging(integer flag, scheduleevent a_event_original, ref scheduleevent a_event_new);//Return 1 to continue processing
RETURN 1
end event

event type long eventadded(ref scheduleevent a_event);//Return 1 to continue processing
RETURN 1
end event

event lbuttondblclk;inv_titleedittimer.Stop()

str_schedulemappedevents lstr_event

lstr_event = of_GetEventForPos(xpos,ypos)

IF IsValid(lstr_event) THEN
	IF UseCustomUI THEN
		Post Event DoubleClick(flags, xpos, ypos, lstr_event.eventobject)
		str_schedulemappedevents lstr_empty
		istr_selectedevent = lstr_empty
		istr_movingevent = lstr_empty
	ELSE
		Trigger Event DoubleClick(flags, xpos, ypos, lstr_event.eventobject)
		of_EditEvent(lstr_event, EVENT_DOUBLE_CLICKED)
	END IF
ELSE
	ScheduleEvent l_event
	l_event.EventId = -1
	l_event.ResourceId = of_GetResourceIdFromPos(UnitsToPixels(ypos, YUnitsToPixels!))
	Trigger Event DoubleClick(flags, xpos, ypos, l_event)
END IF




end event

event type integer eventdeleting(scheduleevent a_event);//Return 1 to continue
RETURN 1
end event

event rbuttonup;IF IsReadOnly THEN RETURN

IF IsValid(istr_selectedevent) THEN
	EVENT RightClick(flags, xpos, ypos, istr_selectedevent.eventobject)
ELSEIF IsValid(istr_selectedcell) THEN
	
	DateTime ldt_clickeddate, EndDateTime
	Long ll_x, ll_y
	
	ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
	ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

	ldt_clickeddate = of_FindClosestDatetime(ll_x, ll_y)

	IF ldt_clickeddate >= istr_selectedcell.eventobject.StartDateTime AND ldt_clickeddate <= istr_selectedcell.eventobject.EndDateTime THEN
		
		EndDateTime = istr_selectedcell.eventobject.EndDateTime
		IF OnlyShowWorkingHours THEN
			//If the end time after the move is the start time of the next day, we need to make the end time the end time of the previous day
			IF Time(EndDateTime) = WorkStartTime THEN
				EndDateTime = DateTime(inv_Helper.of_GetClosestWorkingDate(THIS, RelativeDate(Date(EndDateTime), -1)), WorkEndTime)
			END IF
		END IF
		
		EVENT RightClickSelection(flags, xpos, ypos, istr_selectedcell.eventobject.StartDateTime,  EndDateTime, istr_selectedcell.eventobject.AllDayEvent, istr_selectedcell.eventobject.resourceid)
	END IF
	
END IF
end event

event ue_scroll();IF IsValid(sle_scheduletitleedit) THEN
	IF sle_scheduletitleedit.Visible THEN
		THIS.SetFocus()
	END IF
END IF
end event

private function integer of_drawgrid (longptr aul_graphics, longptr aul_hdc);LongPtr lul_pen, lul_pendaysep, ull_DayBrushColor, lul_CurrentDayPen
LongPtr ull_BackBrushColor
ULong lul_pencolor, lul_dayseppencolor, lul_daycolor, lul_shadebrush
Long ll_width, ll_height, ll_daywidth
Long ll_index, ll_daycount
String ls_ampm
Long ll_time
Int li_red, li_green, li_blue
Long ll_scrollheight
RECT rc_fullshade
RECT rc
Integer li_workendtimehour
n_uspb_text_helper lnv_texthelper

li_workendtimehour = Hour(WorkEndTime)

IF WorkEndTime = Time(23,59,59) THEN li_workendtimehour = 24

ls_ampm = " " + inv_resourcemanager.of_GetString(AM)

IF uo_hscroll.Visible THEN
	ll_scrollheight = uo_hscroll.Height + 16
END IF

ll_width = UnitsToPixels(of_WorkspaceWidth(), XUnitsToPixels!)
ll_height = UnitsToPixels(of_WorkspaceHeight() - ll_scrollheight, YUnitsToPixels!)

lul_pencolor = inv_win32.PBUSMakeARGB (255, 218, 220, 224)
lul_dayseppencolor = inv_win32.PBUSMakeARGB (255, 198, 200, 204)

of_GetThemeColor(li_red, li_green, li_blue)
lul_daycolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)

lul_shadebrush = inv_win32.CreateSolidBrush(RGB(245,245,245))
ull_BackBrushColor = inv_win32.CreateSolidBrush(BackgroundColor)

inv_win32.GdipCreatePen1(lul_pencolor,1, 2, lul_Pen)
inv_win32.GdipCreatePen1(lul_dayseppencolor,2, 2, lul_pendaysep)
inv_win32.GdipCreatePen1(lul_daycolor,1, 2, lul_CurrentDayPen)
inv_win32.GdipCreateSolidFill(lul_daycolor, ull_DayBrushColor)

ll_daycount = of_GetDayCount()
ll_daywidth = of_GetDayWidth()

///This zone is scrollable

Date ldt_workingDate
String ls_time
Int li_totalhours, li_totalworkinghours, li_total
Int li_hour, li_daycounter
Int ll_x, li_nonworkinghours
Int li_DayNumber

IF 	OnlyShowWorkingHours THEN
	li_totalhours = of_GetTotalWorkingHours()
	li_hour = Hour(WorkStartTime)
	li_totalworkinghours = Hour(WorkEndTime) - li_hour
ELSE
	li_totalhours = of_GetTotalHours()
	li_hour = 0
	li_totalworkinghours = 24
END IF

//Draw Resource Header Rectangle
rc.Right = ResourceColumnWidth
rc.Bottom = ll_height

inv_win32.FillRect(aul_hdc, rc, ull_BackBrushColor)

//Draw non-working hour shade
IF NOT OnlyShowWorkingHours THEN
	FOR ll_index = 1 TO li_totalhours
		ll_x = (ResourceColumnWidth + il_xscroll) + (TimeColumnWidth * (ll_index - li_nonworkinghours))
		
		IF li_hour > 23 THEN
			li_hour = 0
			li_daycounter += 1
		END IF
		
		IF ll_x < 0 OR (ll_x - TimeColumnWidth - TimeColumnWidth) > ll_width THEN
			li_hour += 1
			CONTINUE
		END IF
		
		IF NOT WorkSunday OR NOT WorkMonday OR &
			 NOT WorkTuesday OR NOT WorkWednesday OR &
			 NOT WorkThursday OR NOT WorkFriday OR &
			 NOT WorkSaturday OR WorkStartTime <> Time(0,0,0) OR WorkEndTime <> Time(23,59,59) THEN
			 
			li_DayNumber = DayNumber(RelativeDate(id_StartDate, li_daycounter))
			 
			IF (li_DayNumber = 1 AND NOT WorkSunday) OR &
				(li_DayNumber = 2 AND NOT WorkMonday) OR &
				(li_DayNumber = 3 AND NOT WorkTuesday) OR &		
				(li_DayNumber = 4 AND NOT WorkWednesday) OR &
				(li_DayNumber = 5 AND NOT WorkThursday) OR &
				(li_DayNumber = 6 AND NOT WorkFriday) OR &
				(li_DayNumber = 7 AND NOT WorkSaturday) OR &
				 li_hour < Hour(WorkStartTime) OR li_hour >= li_workendtimehour THEN
				rc_fullshade.Left =  ((ResourceColumnWidth + il_xscroll) + TimeColumnWidth * ll_index)
				rc_fullshade.Right = rc_fullshade.Left - TimeColumnWidth + 1
				rc_fullshade.Top =  HeaderHeight
				rc_fullshade.Bottom = ll_height
				inv_win32.FillRect(aul_hdc, rc_fullshade, lul_shadebrush)
			END IF
		END IF
		
		li_hour += 1
	NEXT
END IF

//Start drawing resource separators
String ls_keys[]
Long ll_count, ll_prevy
str_scheduleeventresources lstr_resource

in_loadedresources.GetKeys(ls_keys)
ll_count = UpperBound(ls_keys)
ll_prevy =  HeaderHeight

FOR ll_index = 1 TO ll_count
	IF NOT RenderDefaultResource AND ls_keys[ll_index] = string(il_resourceid) THEN CONTINUE
	
	lstr_resource = in_loadedresources.Get(ls_keys[ll_index])
	
	inv_win32.GdipDrawLine (aul_graphics, lul_pen, 0, ll_prevy + Max(ScaleDPI(DefaultFullDayHeight), lstr_resource.ResourceHeight) + il_yscroll, ll_width,  ll_prevy + Max(ScaleDPI(DefaultFullDayHeight), lstr_resource.ResourceHeight) + il_yscroll)
							
	IF lstr_resource.ResourceGroup THEN
		rc_fullshade.Left =  0
		rc_fullshade.Right = ll_width
		rc_fullshade.Top =  ll_prevy + il_yscroll + 1
		rc_fullshade.Bottom = rc_fullshade.Top + ScaleDPI(DefaultFullDayHeight) - 1
		inv_win32.FillRect(aul_hdc, rc_fullshade, lul_shadebrush)
	END IF
							
	ll_prevy = ll_prevy + Max(ScaleDPI(DefaultFullDayHeight), lstr_resource.ResourceHeight)
NEXT
//End

IF 	OnlyShowWorkingHours THEN
	li_hour = Hour(WorkStartTime)
ELSE
	li_hour = 0
END IF

//Draw regular daily events
IF NOT ib_printing THEN
	of_DrawSelectionFullDay(aul_hdc, aul_graphics)
END IF

Boolean lb_dayseparator

//Draw hour line separators
FOR ll_index = 1 TO li_totalhours
	
	IF 	OnlyShowWorkingHours THEN
		IF li_hour = (li_workendtimehour - 1) THEN
			lb_dayseparator = TRUE
		END IF
		IF li_hour = li_workendtimehour THEN
			li_hour = Hour(WorkStartTime)
		END IF
	ELSE
		IF li_hour = 23 THEN
			lb_dayseparator = TRUE
		END IF
		IF li_hour > 23 THEN
			li_hour = 0
		END IF		
	END IF
	
	ll_x  = ((ResourceColumnWidth + il_xscroll) + TimeColumnWidth * (ll_index))
	
     IF ll_x < 0 OR ll_x > ll_width THEN
		li_hour += 1
		CONTINUE
	END IF
	
	inv_win32.GdipDrawLine (aul_graphics, lul_pen, ll_x, HeaderHeight / 2, ll_x, ll_height)
	
	IF lb_dayseparator THEN		
		inv_win32.GdipDrawLine (aul_graphics, lul_pendaysep, ll_x, HeaderHeight / 2, ll_x, ll_height)
		lb_dayseparator = FALSE
	END IF
	
	li_hour += 1
NEXT


//Draw full day events
of_DrawFullDayEvents(aul_hdc, aul_graphics)

//Draw new or moving events. They are drawn here to they show up on top of other events.
//of_DrawMovingEvent(aul_hdc, aul_graphics)
of_DrawNewEvent(aul_hdc, aul_graphics)


//Draw Header Rectangle
rc.Right = ll_width
rc.Bottom = HeaderHeight
inv_win32.FillRect(aul_hdc, rc, ull_BackBrushColor)


//Header Separator line
inv_win32.GdipDrawLine (aul_graphics, lul_pen, 0, HeaderHeight, ll_width, HeaderHeight)

//Resource Separator line
inv_win32.GdipDrawLine (aul_graphics, lul_pen, ResourceColumnWidth, HeaderHeight, ResourceColumnWidth , ll_height)

//Footer Separator line
inv_win32.GdipDrawLine (aul_graphics, lul_pen, ResourceColumnWidth, ll_height, ll_width, ll_height)

li_daycounter = 0

IF 	OnlyShowWorkingHours THEN
	li_hour =  Hour(WorkStartTime)
ELSE
	li_hour = 0
END IF

Boolean lb_truncatetime

lb_truncatetime = 	TimeColumnWidth < (lnv_texthelper.of_GetTextWidth (aul_hdc, "12 AM", FontName, TimeSize, ALIGN_LEFT, HeaderHeight / 2, FALSE, FALSE, FALSE) + 2)

//Time Column Labels
FOR ll_index = 1 TO li_totalhours
	
	ll_x = (ResourceColumnWidth + il_xscroll) + (TimeColumnWidth * (ll_index - li_nonworkinghours))
	
	IF 	OnlyShowWorkingHours THEN
		IF li_hour >= li_workendtimehour THEN
			li_hour = Hour(WorkStartTime)
			li_daycounter += 1
		END IF
	ELSE
		IF li_hour > 23 THEN
			li_hour = 0
			li_daycounter += 1
		END IF		
	END IF
	
	IF OnlyShowWorkingHours THEN
		DO WHILE TRUE
			li_DayNumber = DayNumber(RelativeDate(id_StartDate, li_daycounter))
			
			IF (li_DayNumber = 1 AND NOT WorkSunday) OR &
				(li_DayNumber = 2 AND NOT WorkMonday) OR &
				(li_DayNumber = 3 AND NOT WorkTuesday) OR &		
				(li_DayNumber = 4 AND NOT WorkWednesday) OR &
				(li_DayNumber = 5 AND NOT WorkThursday) OR &
				(li_DayNumber = 6 AND NOT WorkFriday) OR &
				(li_DayNumber = 7 AND NOT WorkSaturday)  THEN
				
				li_daycounter += 1
				li_hour = Hour(WorkStartTime)
			ELSE
				EXIT
			END IF
			
			IF li_daycounter > ll_daycount THEN
				EXIT
			END IF
			
		LOOP
	END IF	
	
     IF ll_x < 0 OR (ll_x - TimeColumnWidth - TimeColumnWidth) > ll_width THEN
		li_hour += 1
		CONTINUE
	END IF

	IF (li_hour = 0 AND NOT OnlyShowWorkingHours) OR (li_hour = Hour(WorkStartTime) AND OnlyShowWorkingHours) THEN
		of_DrawText(aul_hdc, iul_daytextfontbold, String(RelativeDate(id_StartDate, li_daycounter)), ALIGN_LEFT, DT_VCENTER, &
							(ResourceColumnWidth + il_xscroll) + (TimeColumnWidth * ((ll_index - li_nonworkinghours) - 1)) + ScaleDPI(8), &
							0 , &
							(TimeColumnWidth * li_totalworkinghours), &
							HeaderHeight / 2, TextColor)
		//Draw Day name
		of_DrawText(aul_hdc, iul_textfontbold, inv_helper.of_GetDayName(DayNumber(RelativeDate(id_StartDate, li_daycounter)))  , ALIGN_LEFT, DT_VCENTER, &
						(ResourceColumnWidth + il_xscroll) + (TimeColumnWidth * ((ll_index - li_nonworkinghours) - 1)) + ScaleDPI(8), &
							HeaderHeight / 4 , &
							(TimeColumnWidth * li_totalworkinghours), &
							HeaderHeight / 2, TextColor)
	END IF
	
	IF NOT HideTime THEN
		IF TimeFormat24Hour THEN
			ls_ampm = ":00"
			ll_time = li_hour
		ELSE
			
			IF li_hour >= 12 THEN
				ls_ampm = " " + inv_resourcemanager.of_GetString(PM)
			ELSE
				ls_ampm = " " + inv_resourcemanager.of_GetString(AM)
			END IF
		
			ll_time = li_hour
		
			IF li_hour > 12 THEN
				ll_time = li_hour - 12
			END IF
			
			IF li_hour = 0 THEN
				ll_time = 12
			END IF
		END IF
		
		IF lb_truncatetime THEN
			IF TimeFormat24Hour THEN
				ls_ampm = ""
			ELSE
				ls_ampm = Mid(ls_ampm, 2, 1)
			END IF		
		END IF
	
		
		of_DrawText(aul_hdc, iul_timefont, String(ll_time) + ls_ampm, ALIGN_LEFT, DT_VCENTER, &
								 (ResourceColumnWidth + il_xscroll) + (TimeColumnWidth * ((ll_index - li_nonworkinghours) - 1)) + ScaleDPI(8), &
								HeaderHeight / 2 , &
								TimeColumnWidth - ScaleDPI(10), &
								HeaderHeight / 2, TextColor)
	END IF
	
	li_hour += 1
NEXT




//Draw Resource Header Rectangle
rc.Right = ResourceColumnWidth
rc.Bottom = ll_height

inv_win32.FillRect(aul_hdc, rc, ull_BackBrushColor)

//Need name and line printed for each resource

//Start printing resource names
in_loadedresources.GetKeys(ls_keys)
ll_count = UpperBound(ls_keys)
ll_prevy =  HeaderHeight

inv_win32.GdipDrawLine (aul_graphics, lul_pen, 0, ll_prevy, ResourceColumnWidth,  ll_prevy)

FOR ll_index = 1 TO ll_count
	IF NOT RenderDefaultResource AND ls_keys[ll_index] = string(il_resourceid) THEN CONTINUE
	
	lstr_resource = in_loadedresources.Get(ls_keys[ll_index])
	
	inv_win32.GdipDrawLine (aul_graphics, lul_pen, 0, ll_prevy + Max(ScaleDPI(DefaultFullDayHeight), lstr_resource.ResourceHeight) + il_yscroll, ResourceColumnWidth,  ll_prevy + Max(ScaleDPI(DefaultFullDayHeight), lstr_resource.ResourceHeight) + il_yscroll)

	IF lstr_resource.ResourceGroup THEN
		rc_fullshade.Left =  0
		rc_fullshade.Right = ResourceColumnWidth
		rc_fullshade.Top =  ll_prevy + 1 + il_yscroll
		rc_fullshade.Bottom = rc_fullshade.Top + ScaleDPI(DefaultFullDayHeight) - 1
		inv_win32.FillRect(aul_hdc, rc_fullshade, lul_shadebrush)
	END IF

	//Draw Main Resource Name
	of_DrawText(aul_hdc, iul_textfontbold, lstr_resource.ResourceName, ALIGN_LEFT, DT_VCENTER, &
							ScaleDPI(4), &
							ll_prevy + ScaleDPI(2) + il_yscroll, &
							ResourceColumnWidth - ScaleDPI(4), &
							Max(ScaleDPI(DefaultFullDayHeight), lstr_resource.ResourceHeight) - ScaleDPI(4), TextColor)
							
	
							
	ll_prevy = ll_prevy + Max(ScaleDPI(DefaultFullDayHeight), lstr_resource.ResourceHeight)
NEXT
//End

//Draw corder Grid Header Rectangle
rc.Right = ResourceColumnWidth
rc.Bottom = HeaderHeight

inv_win32.FillRect(aul_hdc, rc, ull_BackBrushColor)


//Draw hscroll cover Rectangle

IF uo_hscroll.Visible THEN
	rc.Right = ll_width
	rc.Top = ll_height 
	rc.Bottom = ll_height +  UnitsToPixels(ll_scrollheight, YUnitsToPixels!)
	inv_win32.FillRect(aul_hdc, rc, ull_BackBrushColor)
END IF

of_DrawDiagnostics(aul_hdc, aul_graphics)


//Clean Up
inv_win32.DeleteObject(lul_shadebrush)
inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeletePen(lul_pendaysep)
inv_win32.GdipDeletePen(lul_CurrentDayPen)
inv_win32.GdipDeleteBrush(ull_DayBrushColor)
inv_win32.DeleteObject(ull_BackBrushColor)

RETURN 1
end function

private function integer of_drawbackground (longptr hdc);LongPtr ull_BackBrushColor
RECT rc

IF NOT ib_printing THEN
	// determine control size
	GetClientRect(Handle(THIS), rc)
ELSE
	rc.Left = 0
	rc.Right = 0
	rc.Right = UnitsToPixels(of_WorkspaceWidth(), XUnitsToPixels!)
	rc.Bottom = UnitsToPixels(of_WorkspaceHeight(), YUnitsToPixels!) + ScaleDPI(20)
END IF

// create a brush
ull_BackBrushColor = CreateSolidBrush(BackgroundColor)
// fill the background
FillRect(hdc, rc, ull_BackBrushColor)

DeleteObject(ull_BackBrushColor)

RETURN 1
end function

public function integer of_setcurrentdate (date ad_currentdate);Date ld_enddate, ld_firstday
Int li_startday
CurrentDate = ad_currentdate

li_startday = Day(CurrentDate)

id_StartDate = CurrentDate
ld_enddate = RelativeDate(id_StartDate, of_GetDayCount())

CHOOSE CASE DefaultView
	CASE WEEK
		IF DayNumber(CurrentDate) < StartOfWeek THEN
			li_startday -= 7
		END IF
		li_startday = li_startday - (DayNumber(CurrentDate) - StartOfWeek)
		id_StartDate = RelativeDate(CurrentDate, li_startday - Day(CurrentDate))
		ld_firstday = id_StartDate
	CASE WORKWEEK
		IF DayNumber(CurrentDate) < StartOfWeek THEN
			li_startday -= 7
		END IF
		li_startday = li_startday - (DayNumber(CurrentDate) - StartOfWorkWeek) 
		id_StartDate = RelativeDate(CurrentDate, li_startday - Day(CurrentDate))
		ld_firstday = id_StartDate
	CASE DAY
		ld_firstday = id_StartDate
	CASE MONTH
		str_scheduledimensions lstr_grid
		//lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)
		
		ld_firstday = lstr_grid.StartDate
		ld_enddate = lstr_grid.EndDate
		
END CHOOSE

ib_eventsloaded = FALSE
Trigger Event DateRangeChanged(ld_firstday, ld_enddate)

//Developer may have called of_LoadEvents in the DateRangeChanged event
//If so, we don't want to call it again. If not, we can attempt to load what we already have.
IF NOT ib_eventsloaded THEN
	of_UpdateEventCords()
END IF

SetRedraw(TRUE)
RETURN 1
end function

private function integer of_drawtext (longptr hdc, longptr al_font, string as_text, long al_align, long al_valign, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color);ULong	 ll_parm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback
CONSTANT LONG DT_SINGLELINE = 32
LongPtr hRPen
n_cst_pbus_numerical lnv_numerical

IF Len(Trim(as_text)) = 0 THEN
	RETURN 0
END IF

inv_win32.SelectObject(hdc, al_font)

ll_parm = lnv_numerical.of_BitWiseOr(al_align, DT_SINGLELINE)
ll_parm = lnv_numerical.of_BitWiseOr(ll_parm, al_valign)
ll_parm = lnv_numerical.of_BitWiseOr(ll_parm, DT_WORD_ELLIPSIS)

inv_win32.SetBkMode(hdc, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width
l_Rect.Bottom = al_y + al_height

inv_win32.SetTextColor(hdc, al_color)

inv_win32.Drawtext(hdc, as_text, LEN(as_text), l_Rect, ll_parm)

RETURN 1
end function

private function unsignedlong of_getcolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue);n_uspb_colors lnv_colors
RETURN lnv_colors.of_GetColor(Theme, ai_red, ai_green, ai_blue)
end function

public function integer of_loadevents (scheduleevent a_events[]);RETURN of_LoadEvents(il_resourceid, a_events)
end function

private function integer of_eventindexof (str_schedulemappedevents a_events[], str_schedulemappedevents a_event);Long ll_index, ll_count

ll_count = UpperBound(a_events)

FOR ll_index = 1 TO ll_count
	IF a_events[ll_index] = a_event THEN
		RETURN ll_index
	END IF
NEXT

RETURN -1
end function

private function integer of_gethourrangerectangle (datetime a_start, datetime a_end, ref s_rect a_rect);Int startY
Int endY
Int li_eventslotheight
Int endHour

IF Date(a_start) = Date(a_end) THEN
	IF SecondsAfter(Time(a_start), Time(a_end)) < (15 * 60) THEN
		a_end = inv_helper.of_RelativeDateTime(a_start, 15 * 60)
	END IF
END IF

li_eventslotheight = TimeRowHeight / (60 / MinAppointmentIncrement)

endHour = Hour(Time(a_end))

IF Date(a_end) > Date(a_start) THEN
	a_end = DateTime(Date(a_start), Time(23,59,59))
	endHour = Hour(Time(a_end))
END IF

startY = (Hour(Time(a_start)) * li_eventslotheight * (60 / MinAppointmentIncrement)) + (Long(Minute(Time(a_start)) * li_eventslotheight) / MinAppointmentIncrement);
endY = (endHour * li_eventslotheight * (60 / MinAppointmentIncrement)) + (Long(Minute(Time(a_end)) * li_eventslotheight) / MinAppointmentIncrement);

a_rect.Top = startY + il_yscroll + HeaderHeight;

a_rect.Bottom = Max(1, endY - startY);

RETURN 1
end function

public function integer of_getloadedevents (ref scheduleevent a_events[]);Long ll_index, ll_count

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	IF IsValid( s_loadedevents[ll_index]) THEN
		a_events[ll_index]  = s_loadedevents[ll_index].eventobject
	END IF
NEXT

RETURN 1
end function

public function integer of_releasemouse ();if NOT of_ismousecaptured() then return -1

inv_win32.ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

public function integer of_capturemouse ();//if of_ismousecaptured() then Return -1

inv_win32.SetCapture(Handle(THIS))

of_TrackMouseEvent(TME_Leave, Handle(THIS), 0)

ib_mousecaptured = TRUE

return 1
end function

private function integer of_getdaywidth ();Long ll_scrollwidth, ll_containerwidth, ll_daycount

IF uo_hscroll.Visible THEN
	ll_scrollwidth = uo_hscroll.Width + 16
END IF

ll_containerwidth = UnitsToPixels(of_WorkspaceWidth() - ll_scrollwidth, XUnitsToPixels!)

ll_daycount = of_GetDayCount()

RETURN (ll_containerwidth - ScaleDPI(TimeWidth)) / ll_daycount
end function

public function integer of_getdaycount ();Integer ll_daycount

CHOOSE CASE DefaultView
	CASE WEEK
		ll_daycount = 7
	CASE WORKWEEK
		ll_daycount = NumberOfDaysInWorkWeek
	CASE DAY
		ll_daycount = 1
	CASE MONTH
		ll_daycount = Day(inv_helper.of_LastDayOfTheMonth(id_StartDate))
END CHOOSE

RETURN ll_daycount
end function

private function integer of_drawwrappedtext (longptr hdc, longptr al_font, string as_text, integer al_x, integer al_y, integer al_width, integer al_height, unsignedlong al_color);ULong	 ll_parm
GRADIENT_RECT l_Gradient[1]
RECT l_Rect, l_Rectback
CONSTANT LONG DT_SINGLELINE = 32
LongPtr hRPen
n_cst_pbus_numerical lnv_numerical

IF Len(Trim(as_text)) = 0 THEN
	RETURN 0
END IF

inv_win32.SelectObject(hdc, al_font)

ll_parm = DT_WORDBREAK

inv_win32.SetBkMode(hdc, 1)

/*-------------------------------------------------------------------
	Normal text
-------------------------------------------------------------------*/
// Position
l_Rect.Left = al_x
l_Rect.Top = al_y
l_Rect.Right = al_x + al_width
l_Rect.Bottom = al_y + al_height

inv_win32.SetTextColor(hdc, al_color)

inv_win32.Drawtext(hdc, as_text, LEN(as_text), l_Rect, ll_parm)

RETURN 1
end function

public function datetime of_findclosestdatetime (long al_x, long al_y);DateTime ld_closestdate, ldt_start, ldt_end
Time lt_newtime
Long ll_newday
Integer li_hoursinday, li_index

lt_newtime = of_FindClosestTime(al_x)

al_x = al_x - il_xscroll - ResourceColumnWidth

IF OnlyShowWorkingHours THEN	
	ldt_start = DateTime(Today(), WorkStartTime)
	ldt_end = DateTime(Today(), WorkEndTime)

	li_hoursinday = (inv_helper.of_secondsAfter(ldt_start, ldt_end)) / 60 / 60
	
	li_index = (al_x / (TimeColumnWidth * li_hoursinday)) + 1
	
	IF li_index > 0 AND li_index <= UpperBound(id_workingdates) THEN
		ld_closestdate = DateTime(id_workingdates[li_index], lt_newtime)
	END IF
ELSE
	li_hoursinday = 24	
	ll_newday = al_x / (TimeColumnWidth * li_hoursinday)
	ld_closestdate = DateTime(RelativeDate(id_StartDate, ll_newday), lt_newtime)
END IF

RETURN ld_closestdate

end function

public function unsignedlong of_getcolor (string as_color);n_uspb_colors lnv_colors

CHOOSE CASE Lower(as_color)
	CASE "tomato"
		RETURN RGB(213, 0, 0)
	CASE "tangerine"
		RETURN RGB(244, 81, 30)
	CASE "sage"
		RETURN RGB(52,182,121)
	CASE "peacock"
		RETURN RGB(3,155,229)
	CASE "lavender"
		RETURN RGB(121,134,203)
	CASE "graphite"
		RETURN RGB(97,97,97)
	CASE "flamingo"
		RETURN RGB(230,124,115)
	CASE "banana"
		RETURN RGB(246,191,38)
	CASE "basil"
		RETURN RGB(111,128,67)
	CASE "blueberry"
		RETURN RGB(63,81,181)
	CASE "grape"
		RETURN RGB(142,36,170)
	CASE ELSE
		RETURN lnv_colors.of_GetColor(as_color)
END CHOOSE 
		
end function

private function integer of_sortevents (ref scheduleevent a_events[]);scheduleevent l_sortedevents[]
Long ll_index, ll_count, ll_row
Datastore lds_events

ll_count = UpperBound(a_events)

IF ll_count = 0 THEN RETURN -1

lds_events = CREATE Datastore
lds_events.Dataobject = "d_scheduleeventsort"

FOR ll_index = 1 TO ll_count
	ll_row = lds_events.InsertRow(0)
	lds_events.SetItem(ll_row, "startdate", a_events[ll_index].StartDateTime)
	lds_events.SetItem(ll_row, "enddate", a_events[ll_index].EndDateTime)
	lds_events.SetItem(ll_row, "eventindex", ll_index)
NEXT

lds_events.Sort()

FOR ll_index = 1 TO ll_count
	l_sortedevents[ll_index] = a_events[lds_events.GetItemNumber(ll_index, "eventindex")]
NEXT

DESTROY lds_events

a_events = l_sortedevents

RETURN 1
end function

private function integer of_newevent ();scheduleevent l_events[]
str_scheduleeventedit lstr_edit

IF IsValid(istr_newevent) AND UseCustomUI THEN	
	IF Event EventAdded(i_newevent) = 1 THEN
		IF i_newevent.resourceid = il_resourceid THEN
			s_loadedevents[UpperBound(s_loadedevents) + 1] = CREATE str_schedulemappedevents
			s_loadedevents[UpperBound(s_loadedevents)].eventobject = i_newevent
		ELSE
			s_otherloadedevents[UpperBound(s_otherloadedevents) + 1] = CREATE str_schedulemappedevents
			s_otherloadedevents[UpperBound(s_otherloadedevents)].eventobject = i_newevent
		END IF
		
		of_UpdateEventCords()
	END IF
	
	DESTROY istr_newevent
	of_ClearSelection()
	
	RETURN 1
END IF

IF IsValid(istr_newevent) THEN	
	
	IF Second(Time(i_newevent.EndDateTime)) = 59 THEN
		i_newevent.EndDateTime = inv_helper.of_RelativeDateTime(i_newevent.EndDateTime, 1)
	END IF
	
	lstr_edit.eventobject = i_newevent
	lstr_edit.increment = MinAppointmentIncrement
	lstr_edit.TimeFormat24Hour = TimeFormat24Hour
	lstr_edit.Theme = Theme
	lstr_edit.eventobject.Status = Busy
	lstr_edit.NewEvent = TRUE
	lstr_edit.AvailableGuests = s_availableguests
	
	IF i_newevent.EventType = 0 THEN
		lstr_edit.EventType = DefaultEventType
	ELSE
		lstr_edit.EventType = i_newevent.EventType
	END IF
	
	IF NOT HideTime THEN
		OpenWithParm(w_pbus_scheduleevent, lstr_edit)
	ELSE
		OpenWithParm(w_pbus_scheduleevent_hidetime, lstr_edit)
	END IF
	
	IF IsValid(Message.PowerObjectParm) THEN
		lstr_edit = Message.PowerObjectParm
		
		i_newevent = lstr_edit.eventobject
		
		IF i_newevent.ResourceId <= 0 THEN
			i_newevent.ResourceId = il_resourceid
		END IF
		
		i_newevent.TextColor = RGB(255,255,255)
		
		IF NOT lstr_edit.DeleteEvent THEN
			IF Event EventAdded(i_newevent) = 1 THEN
				IF i_newevent.resourceid = il_resourceid THEN
					s_loadedevents[UpperBound(s_loadedevents) + 1] = CREATE str_schedulemappedevents
					s_loadedevents[UpperBound(s_loadedevents)].eventobject = i_newevent
				ELSE
					s_otherloadedevents[UpperBound(s_otherloadedevents) + 1] = CREATE str_schedulemappedevents
					s_otherloadedevents[UpperBound(s_otherloadedevents)].eventobject = i_newevent
				END IF
				
				of_UpdateEventCords()
			END IF
		END IF
	END IF
	
	DESTROY istr_newevent
	
	of_ClearSelection()
	
END IF

RETURN 1
end function

public function integer of_settheme (string as_theme);

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme
Theme = as_theme

uo_hscroll.of_SetSliderColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1'))
uo_vscroll.of_SetSliderColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1'))

SetRedraw(TRUE)
RETURN 1
end function

private function unsignedlong of_getthemecolor (ref integer ai_red, ref integer ai_green, ref integer ai_blue);n_uspb_colors lnv_colors
ULong lul_color

IF NOT IsValid(inv_color_theme) THEN RETURN 0

lul_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')

RETURN lnv_colors.of_SplitRGB(lul_color, ai_red, ai_green, ai_blue)
end function

private function integer of_drawcurrenttimeindicator (longptr aul_graphics, longptr hdc, unsignedlong al_color);Long ll_daywidth
Integer ll_daycount, ll_daycolumn, ll_x, ll_y
Date ld_lastday, ld_today
Time lt_now
s_rect ls_rect
LongPtr lul_Pen, ull_DayBrushColor

ll_daycount = of_GetDayCount()
ld_lastday = RelativeDate(id_StartDate, ll_daycount)

ld_today = Today()

IF ld_today < id_StartDate OR ld_today > ld_lastday THEN RETURN 0

ll_daywidth = of_GetDayWidth()
ll_daycolumn = DaysAfter(id_startdate, ld_today)
lt_now = Now()

ll_x = ScaleDPI(TimeWidth) + (ll_daycolumn * ll_daywidth)

of_GetHourRangeRectangle(DateTime(ld_today, lt_now),  DateTime(ld_today, lt_now), ls_rect)

ll_y = ls_rect.Top

IF ll_y < HeaderHeight THEN RETURN 0

inv_win32.GdipCreatePen1(al_color,2, 2, lul_Pen)
inv_win32.GdipCreateSolidFill(al_color, ull_DayBrushColor)

inv_win32.GdipDrawLine(aul_graphics, lul_pen, ll_x, ll_y, ll_x + ll_daywidth, ll_y)

inv_win32.GdipFillEllipseI(aul_graphics, ull_DayBrushColor,&
												ll_x - ScaleDPI(6), &
												 ll_y - ScaleDPI(6), &
												 ScaleDPI(12), ScaleDPI(12))

inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeleteBrush(ull_DayBrushColor)

RETURN 1
end function

public function integer of_setavailableguests (scheduleeventguest a_availableguests[]);s_availableguests = a_availableguests

RETURN 1
end function

public function longptr of_createfont (longptr hdc, string as_fontname, integer ai_fontsize, boolean ab_bold);LogFont lstr_Lf
uLong lul_Font
Long ll_fontweight
ULong dpi

dpi = inv_win32.GetDpiForWindow(Handle(THIS))

IF dpi = 0 THEN
	dpi = inv_win32.GetDeviceCaps(hdc, inv_win32.LOGPIXELSY)
END IF


ll_fontweight = 400

IF ab_bold THEN
	ll_fontweight = 600
END IF

lstr_Lf.lffacename = as_fontname
lstr_Lf.lfweight = ll_fontweight
lstr_Lf.lfheight = -1 * ( inv_win32.MulDiv(ai_fontsize, dpi, 72) )
lstr_Lf.lfPitchAndFamily = '1'
lstr_Lf.lfClipPrecision = Char(2)
lstr_Lf.lfOutPrecision = Char(1)
lstr_Lf.lfQuality = Char(1)
lstr_Lf.lfCharset = Char(1)

RETURN inv_win32.CreateFontIndirect( lstr_Lf )
end function

public function integer of_createnewevent (datetime ad_startdate);IF IsValid(istr_newevent) THEN
	DESTROY istr_newevent
END IF

istr_newevent = CREATE str_schedulemappedevents

istr_newevent.eventobject.StartDateTime = ad_startdate
istr_newevent.eventobject.EndDateTime = inv_helper.of_RelativeDateTime(istr_newevent.eventobject.StartDateTime, 3600)
istr_newevent.eventobject.TextColor = RGB(255,255,255)
i_newevent = istr_newevent.eventobject

POST of_NewEvent()
POST of_ClearSelection()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_print ();str_scheduleprint lstr_print
lstr_print.theme = Theme
lstr_print.powerscheduleview = THIS

OpenWithParm(w_pbus_scheduleprint, lstr_print)
RETURN 1
end function

private function integer of_drawmovingevent (longptr hdc, longptr aul_graphics);IF NOT ib_eventmoving OR NOT IsValid(istr_movingevent) THEN RETURN 0

Long li_x, li_y, li_width, li_height, li_eventslotwidth
Long ll_startx, ll_endx
Long li_minutes, li_workingdaysbetween, li_eventhours, li_hoursinworkday
DateTime lt_eventstart, lt_eventend
Date id_FirstVisibleDay

li_x = istr_movingevent.schedulerectregion.left + il_xscroll
li_width = istr_movingevent.schedulerectregion.right - istr_movingevent.schedulerectregion.left
li_y = istr_movingevent.schedulerectregion.top + il_yscroll
li_height = ScaleDPI(DefaultFullDayHeight)

of_DrawFullDayEvent(hdc, aul_graphics, istr_movingevent.eventobject, li_x, li_y, li_width, ScaleDPI(DefaultFullDayHeight), FALSE, FALSE)

RETURN 1
end function

private function integer of_drawnewevent (longptr hdc, longptr aul_graphics);IF NOT IsValid(istr_newevent) THEN RETURN 0
IF NOT CreateNewEventOnMouseDrag THEN RETURN 0

Long li_x, li_y, li_width, li_height, li_eventslotwidth
Long ll_startx, ll_endx
Long li_minutes, li_workingdaysbetween, li_hoursinworkday
Double ld_eventhours
DateTime lt_eventstart, lt_eventend
Date id_FirstVisibleDay

IF NOT OnlyShowWorkingHours THEN
		
	lt_eventstart =  i_newevent.StartDateTime
	IF Date(lt_eventstart) < id_StartDate THEN
		lt_eventstart = DateTime(id_StartDate)
	END IF
	
	li_minutes = (inv_helper.of_SecondsAfter(DateTime(id_StartDate), lt_eventstart) / 60)
	
	li_x = (Double(Double(TimeColumnWidth) / 60.0) * Double(li_minutes)) + ResourceColumnWidth
	
	li_minutes = inv_helper.of_SecondsAfter(lt_eventstart, i_newevent.EndDateTime) / 60
	
	li_width = (Double(Double(TimeColumnWidth) / 60.0) * Double(li_minutes))
ELSE
	li_hoursinworkday = inv_helper.of_SecondsAfter(DateTime(id_StartDate,WorkStartTime ), DateTime(id_StartDate,WorkEndTime)) / 60 / 60
	
	lt_eventstart =  i_newevent.StartDateTime
	ld_eventhours = inv_helper.of_GetEventWorkingHours(THIS, i_newevent.StartDateTime, i_newevent.EndDateTime)
	id_FirstVisibleDay = inv_helper.of_GetFirstWorkingDay(THIS)
	li_workingdaysbetween = inv_helper.of_GetWorkingDaysBetweenDates(THIS, id_FirstVisibleDay, Date(lt_eventstart))
	
	li_minutes = ((li_workingdaysbetween * li_hoursinworkday) * 60) +  (inv_helper.of_SecondsAfter(DateTime(Date(lt_eventstart), WorkStartTime), lt_eventstart) / 60)
	li_x = (Double(Double(TimeColumnWidth) / 60.0) * Double(li_minutes)) + ResourceColumnWidth
	
	li_minutes = ld_eventhours * 60
	
	li_width = (Double(Double(TimeColumnWidth) / 60.0) * Double(li_minutes))
	
END IF


li_x = li_x + il_xscroll
li_y = il_clickresourcey + il_yscroll + HeaderHeight

of_DrawFullDayEvent(hdc, aul_graphics, i_newevent, li_x, li_y + 1, li_width, ScaleDPI(DefaultFullDayHeight), FALSE, FALSE)


RETURN 1
end function

public function integer of_drawfulldayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean ab_startsbeforeweek, boolean ab_endsafterweek);RETURN of_DrawFullDayEvent(hdc, aul_graphics, a_event, a_x, a_y, a_width, a_height, ab_startsbeforeweek, ab_endsafterweek, FALSE)
end function

public function integer of_drawfulldayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean ab_startsbeforeweek, boolean ab_endsafterweek, boolean ab_selected);LongPtr ull_BackBrushColor, hRPen
String ls_color
ULong ll_textcolor, ll_eventcolor
String ls_starttext, ls_startampm, ls_endtext, ls_endampm
Integer li_starthour, li_endhour, li_endtextwidth, li_starttextwidth, li_titlespace, li_titlewidth
n_uspb_colors lnv_colors
n_uspb_text_helper lnv_texthelper
Integer STATUS_WIDTH
Integer li_rightadjust
Boolean lb_pastevent
Integer li_imageparam

STATUS_WIDTH = ScaleDPI(8)
li_rightadjust = ScaleDPI(22)

ll_eventcolor = a_event.Color
ll_textcolor = a_event.TextColor

IF ll_eventcolor = 0 THEN
	ls_color = "peacock"
	ll_eventcolor = of_getcolor(ls_color)
END IF

//Past event
IF a_event.EndDateTime < DateTime(Today(), Now()) THEN
	ll_eventcolor = lnv_colors.of_LightenColor(180, ll_eventcolor)
	IF ll_textcolor = RGB(255,255,255) THEN
		ll_textcolor =  RGB(124,151,164)
	ELSE
		ll_textcolor =  lnv_colors.of_LightenColor(90, ll_textcolor)
	END IF
	lb_pastevent = TRUE
END IF

// create a brush
hRPen = inv_win32.CreatePen(0,1,RGB(255,255,255))
ull_BackBrushColor = CreateSolidBrush(ll_eventcolor)

IF ab_selected THEN
	of_DrawSelectShadow(aul_graphics, a_x, a_y, a_width, a_height)
END IF

//Fill rectangle
inv_win32.SelectObject(hdc, ull_BackBrushColor)
inv_win32.SelectObject(hdc, hRPen)

inv_win32.RoundRect( hdc, a_x, &
									 a_y, &
									 a_x + a_width, &
									 a_y + a_height, &
									EventCornerRadius, EventCornerRadius)

of_DrawEventStatus(hdc, a_event, ll_eventcolor, a_x, a_y, a_width, a_height)

IF ab_startsbeforeweek THEN
	ls_starttext = "🡠 " + String(a_event.StartDateTime, "MMM dd")
END IF

IF ab_endsafterweek THEN
	ls_endtext =  String(a_event.EndDateTime, "MMM dd") + " 🡢"
END IF

li_titlespace = a_width - STATUS_WIDTH

li_starttextwidth = lnv_texthelper.of_GetTextWidth(hdc, ls_starttext, FontName, TextSize, ALIGN_LEFT, ScaleDPI(4), FALSE, FALSE, FALSE)
li_endtextwidth = lnv_texthelper.of_GetTextWidth(hdc, ls_endtext, FontName, TextSize, ALIGN_LEFT, ScaleDPI(4), FALSE, FALSE, FALSE)
li_titlewidth = lnv_texthelper.of_GetTextWidth(hdc, of_GetEventTitle(a_event), FontName, TextSize, ALIGN_LEFT, ScaleDPI(4), TRUE, FALSE, FALSE)

li_titlespace -= li_starttextwidth
li_titlespace -= li_endtextwidth

IF a_event.IsPrivate THEN li_titlespace -= ScaleDPI(20)
IF a_event.IsRecurring THEN li_titlespace -= ScaleDPI(20)

of_DrawText(hdc, iul_textfontbold, of_GetEventTitle(a_event), ALIGN_LEFT, DT_VCENTER, &
				 a_x + STATUS_WIDTH + li_starttextwidth, &
				 a_y, &
				 li_titlespace, &
				 a_height, &
				ll_textcolor)	


IF Len(Trim(ls_starttext)) > 0 THEN
	of_DrawText(hdc, iul_textfont, ls_starttext, ALIGN_LEFT, DT_VCENTER, &
				 a_x + STATUS_WIDTH, &
				 a_y, &
				 a_width, &
				 a_height, &
				ll_textcolor)
END IF

IF Len(Trim(ls_endtext)) > 0 THEN
		of_DrawText(hdc, iul_textfont, ls_endtext, ALIGN_RIGHT, DT_VCENTER, &
				 a_x, &
				 a_y, &
				 a_width - 4, &
				 a_height, &
				ll_textcolor)	
END IF

IF lb_pastevent THEN
	li_imageparam = 5 //ILD_TRANSPARENT | ILD_BLEND50
ELSE
	li_imageparam = ILD_IMAGE
END IF

//Draw icons if event height isn't small (15 minute increment)
IF a_event.IsPrivate THEN
	IF a_x + a_width - li_rightadjust - li_endtextwidth > a_x THEN
		inv_win32.ImageList_DrawEx(il_imagelistsmall, &
						  il_privateimage, &
						  hdc, &
						  a_x + a_width - li_rightadjust - li_endtextwidth, &
						  a_y + ((a_height - ScaleDPI(16)) / 2), &
						  ScaleDPI(16),ScaleDPI(16), &
						  ll_eventcolor, 4294967295, li_imageparam )
		li_rightadjust += ScaleDPI(18)
	END IF
END IF

IF a_event.IsRecurring THEN
	IF a_x + a_width - li_rightadjust - li_endtextwidth > a_x THEN
		inv_win32.ImageList_DrawEx(il_imagelistsmall, &
						  il_recurringimage, &
						  hdc, &
						  a_x + a_width - li_rightadjust - li_endtextwidth, &
						  a_y + ((a_height - ScaleDPI(16)) / 2), &
						  ScaleDPI(16),ScaleDPI(16),  &
						  ll_eventcolor, 4294967295, li_imageparam )
		li_rightadjust += ScaleDPI(18)
	END IF
END IF

IF a_event.IsMeeting THEN
	inv_win32.ImageList_DrawEx(il_imagelistsmall, &
					  il_meetingimage, &
					  hdc, &
					  a_x + a_width - li_rightadjust, &
					  a_y + a_height - ScaleDPI(18), &
					  ScaleDPI(16),ScaleDPI(16),  &
					  ll_eventcolor, 4294967295, li_imageparam )
	li_rightadjust += ScaleDPI(18)
END IF



//cleanup
DeleteObject(hRPen)
DeleteObject(ull_BackBrushColor)

RETURN 1
end function

public function boolean of_eventisselected (str_schedulemappedevents a_event);IF NOT IsValid(istr_selectedevent) THEN RETURN FALSE
IF istr_selectedevent = a_event THEN RETURN TRUE

RETURN FALSE
end function

public function integer of_deleteevent (str_schedulemappedevents astr_event);Long ll_index, ll_count, ll_newindex
scheduleevent lstr_deletedevent
str_schedulemappedevents ls_loadedevents[]
str_schedulemappedevents ls_otherloadedevents[]

IF Event EventDeleting(astr_event.eventobject) = 1 THEN			
	IF IsValid(astr_event) THEN
		
		lstr_deletedevent = astr_event.eventobject
		
		ll_count = UpperBound(s_loadedevents)
		
		FOR ll_index = 1 TO ll_count
			IF s_loadedevents[ll_index] = astr_event THEN
				DESTROY s_loadedevents[ll_index]
			ELSE
				ll_newindex++
				ls_loadedevents[ll_newindex] = s_loadedevents[ll_index]
			END IF
		NEXT
		
		s_loadedevents = ls_loadedevents
		
		ll_count = UpperBound(s_otherloadedevents)
		ll_newindex = 0
		
		FOR ll_index = 1 TO ll_count
			IF s_otherloadedevents[ll_index] = astr_event THEN
				DESTROY s_otherloadedevents[ll_index]
			ELSE
				ll_newindex++
				ls_otherloadedevents[ll_newindex] = s_otherloadedevents[ll_index]
			END IF
		NEXT
		
		s_otherloadedevents = ls_otherloadedevents
		
		Event EventDeleted(lstr_deletedevent)

		of_UpdateEventCords()
		
		SetRedraw(TRUE)
	END IF
END IF

RETURN 1
end function

public function integer of_drawselectshadow (longptr aul_graphics, long a_x, long a_y, long a_width, long a_height);LongPtr lul_shadecolor, lul_gradientcolor
LongPtr lul_gradientbrush
s_rect shadeRect
Real radius
LongPtr lul_path, ull_BrushColor

radius = EventCornerRadius

lul_shadecolor = inv_win32.PBUSMakeARGB(128, 255, 255, 255)
lul_gradientcolor = inv_win32.PBUSMakeARGB(255, 92, 92, 92)
shadeRect.Left = a_x - ScaleDPI(4)
shadeRect.Top = a_y - ScaleDPI(2)
shadeRect.Right = a_width + ScaleDPI(8)
shadeRect.Bottom = a_height + ScaleDPI(6)

inv_win32.GdipCreatePath(0, lul_path)

inv_win32.GdipAddPathArcI(lul_path, shadeRect.Left, shadeRect.Top, 2 * radius, 2 * radius, 180, 90)
inv_win32.GdipAddPathLineI(lul_path, shadeRect.Left + radius, shadeRect.Top, shadeRect.Left + shadeRect.Right - radius, shadeRect.Top)
inv_win32.GdipAddPathArcI(lul_path, shadeRect.Left + shadeRect.Right - 2 * radius, shadeRect.Top, 2 * radius, 2 * radius, 270, 90)
inv_win32.GdipAddPathLineI(lul_path, shadeRect.Left + shadeRect.Right, shadeRect.Top + radius, shadeRect.Left + shadeRect.Right, shadeRect.Top + shadeRect.Bottom - radius)
inv_win32.GdipAddPathArcI(lul_path, shadeRect.Left + shadeRect.Right - 2 * radius, shadeRect.Top + shadeRect.Bottom - 2 * radius, 2 * radius, 2 * radius, 0, 90)
inv_win32.GdipAddPathLineI(lul_path, shadeRect.Left + shadeRect.Right - radius, shadeRect.Top + shadeRect.Bottom, shadeRect.Left + radius, shadeRect.Top + shadeRect.Bottom)
inv_win32.GdipAddPathArcI(lul_path, shadeRect.Left, shadeRect.Top + shadeRect.Bottom - 2 * radius, 2 * radius, 2 * radius, 90, 90)
inv_win32.GdipAddPathLineI(lul_path, shadeRect.Left, shadeRect.Top + shadeRect.Bottom - radius, shadeRect.Left, shadeRect.Top + radius)

inv_win32.GdipClosePathFigure(lul_path)

inv_win32.GdipCreatePathGradientFromPath(lul_path,lul_gradientbrush)
inv_win32.GdipSetPathGradientCenterColor(lul_gradientbrush,lul_gradientcolor)
long var = 1
inv_win32.GdipSetPathGradientSurroundColorsWithCount(lul_gradientbrush,lul_shadecolor,var)

int var2 = 4
//REAL blendFactors[] = {0.0, 0.20, 0.7, 1.0};
//REAL blendPos[] = {0.0, 0.2, 0.5, 1.0};
REAL blendFactors[]
REAL blendPos[]

blendFactors[] = {0.0, Real(a_height) / Real(a_height + ScaleDPI(20)), 1.0}
blendPos[] = {0.0,  Real(a_height) / Real(a_height + ScaleDPI(20)), 1.0}


inv_win32.GdipSetLineBlend(lul_gradientbrush, blendFactors, blendPos, var2)

Real xscale, yscale
xscale = Double(shadeRect.Right - ScaleDPI(15)) / Double(shadeRect.Right) //  .92
yscale = Double(shadeRect.Bottom - ScaleDPI(15)) / Double(shadeRect.Bottom) //  .92
inv_win32.GdipSetPathGradientFocusScales(lul_gradientbrush, xscale, yscale);

inv_win32.GdipFillPath(aul_graphics,lul_gradientbrush,lul_path)

inv_win32.GdipDeleteBrush(lul_gradientbrush)
inv_win32.GdipDeletePath(lul_path)

RETURN 1
end function

public function boolean of_eventismouseover (str_schedulemappedevents a_event);IF NOT IsValid(istr_mouseoverevent) THEN RETURN FALSE
IF istr_mouseoverevent = a_event THEN RETURN TRUE

RETURN FALSE
end function

public function integer of_changecursor (long al_x, long al_y);Long ll_index, ll_count

 IF ib_eventresizing AND IsValid(istr_movingevent) THEN
	IF THIS.Pointer <> 'SizeWE!' THEN SetPointer(SizeWE!)
	RETURN 3
END IF

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	
	IF al_x > s_loadedevents[ll_index].rectregion.Left AND al_y >  s_loadedevents[ll_index].rectregion.Top AND &
	    al_x <  s_loadedevents[ll_index].rectregion.Right AND al_y <  s_loadedevents[ll_index].rectregion.Bottom THEN
		 
		 IF s_loadedevents[ll_index].eventobject.AllDayEvent THEN RETURN 1
		 
		 IF al_x - s_loadedevents[ll_index].rectregion.Left <= ii_resizebordersize OR &
			 s_loadedevents[ll_index].rectregion.Right - al_x <= ii_resizebordersize THEN
			 
			 IF THIS.Pointer <> 'SizeWE!' THEN SetPointer(SizeWE!)
			RETURN 3
		END IF
	END IF
NEXT

ll_count = UpperBound(s_otherloadedevents)

FOR ll_index = 1 TO ll_count
	
	IF al_x > s_otherloadedevents[ll_index].rectregion.Left AND al_y >  s_otherloadedevents[ll_index].rectregion.Top AND &
	    al_x <  s_otherloadedevents[ll_index].rectregion.Right AND al_y <  s_otherloadedevents[ll_index].rectregion.Bottom THEN
		 
		 IF s_otherloadedevents[ll_index].eventobject.AllDayEvent THEN RETURN 1
		 
		 IF al_x - s_otherloadedevents[ll_index].rectregion.Left <= ii_resizebordersize OR &
			 s_otherloadedevents[ll_index].rectregion.Right - al_x <= ii_resizebordersize THEN
			 
			 IF THIS.Pointer <> 'SizeWE!' THEN SetPointer(SizeWE!)
			RETURN 3
		END IF
	END IF
NEXT

 IF THIS.Pointer <> 'Arrow!' THEN SetPointer(Arrow!)

RETURN 1
end function

public function integer of_draweventstatus (longptr hdc, scheduleevent a_event, unsignedlong a_eventcolor, long a_x, long a_y, long a_width, long a_height);LongPtr hRgn, ull_StatusBrushColor
Rect statusRect
LongPtr lul_whitepen, lul_eventpen
Integer li_linecount, li_linex, li_liney
Point lp
n_uspb_colors lnv_colors

//Draw status
hRgn = inv_win32.CreateRoundRectRgn( a_x, &
									 a_y + 1, &
									 a_width + a_x, &
									 a_height + a_y , &
									EventCornerRadius, EventCornerRadius)
									
inv_win32.SelectClipRgn(hdc, hRgn)

statusRect.Left = a_x - ScaleDPI(2)
statusRect.Top = a_y - ScaleDPI(2)
statusRect.Right = a_x + ScaleDPI(6)
statusRect.Bottom = a_y + a_height + ScaleDPI(4)

CHOOSE CASE a_event.Status

	CASE Free
		ull_StatusBrushColor = inv_win32.CreateSolidBrush(lnv_colors.of_LightenColor(100, a_eventcolor))
		
		FillRect(hdc, statusRect, ull_StatusBrushColor)		
	CASE Tentative
		lul_whitepen = inv_win32.CreatePen(0, 2, RGB(255,255,255))
		ull_StatusBrushColor = inv_win32.CreateSolidBrush(lnv_colors.of_DarkenColor(120, a_eventcolor))
		
		FillRect(hdc, statusRect, ull_StatusBrushColor)	
		
		lul_eventpen = inv_win32.CreatePen(0, 1, lnv_colors.of_DarkenColor(100, a_eventcolor))
		inv_win32.SelectObject(hdc, lul_whitepen)
		
		inv_win32.DeleteObject(hRgn)
		
		hRgn = inv_win32.CreateRectRgn( a_x, &
									 a_y + 1, &
									 ScaleDPI(6) + a_x , &
									 a_height + a_y - 1)
		
		inv_win32.SelectClipRgn(hdc, hRgn)
		
		DO WHILE TRUE
			li_liney = a_y + (li_linecount * ScaleDPI(6)) + ScaleDPI(2)
			
			IF li_liney > a_y + a_height THEN EXIT
		
			inv_win32.Movetoex(hdc, a_x + ScaleDPI(6), li_liney, lp)
			inv_win32.LineTo(hdc, a_x , li_liney + ScaleDPI(5))
			
			li_linecount++
			
		LOOP
		
		inv_win32.SelectObject(hdc, lul_eventpen)
		inv_win32.Movetoex(hdc, a_x + ScaleDPI(5), a_y, lp)
		inv_win32.LineTo(hdc, a_x + ScaleDPI(5) , a_y + a_height)
		
		inv_win32.Movetoex(hdc, a_x, a_y + EventCornerRadius, lp)
		inv_win32.LineTo(hdc, a_x , a_y + a_height - EventCornerRadius)
		
		inv_win32.DeleteObject(lul_eventpen)
		inv_win32.DeleteObject(lul_whitepen)
	CASE Away
		lul_whitepen = inv_win32.CreatePen(0, 1, RGB(255,255,255))
		ull_StatusBrushColor = inv_win32.CreateSolidBrush(lnv_colors.of_DarkenColor(120, a_eventcolor))
		
		inv_win32.SelectObject(hdc, lul_whitepen)
		
		FillRect(hdc, statusRect, ull_StatusBrushColor)	
		
		DO WHILE TRUE
			li_liney = a_y + (li_linecount * ScaleDPI(6)) + (EventCornerRadius / 2)
			
			IF li_liney > a_y + a_height THEN EXIT
		
			inv_win32.Movetoex(hdc, a_x + 1, li_liney, lp)
			inv_win32.LineTo(hdc, a_x + ScaleDPI(5) , li_liney + ScaleDPI(4))
			
			inv_win32.Movetoex(hdc, a_x + ScaleDPI(4), li_liney, lp)
			inv_win32.LineTo(hdc, a_x  , li_liney + ScaleDPI(4))
			
			li_linecount++
			
		LOOP
		
		inv_win32.DeleteObject(lul_whitepen)
	CASE ELSE //Busy
		ull_StatusBrushColor = inv_win32.CreateSolidBrush(lnv_colors.of_DarkenColor(120, a_eventcolor))
		
		FillRect(hdc, statusRect, ull_StatusBrushColor)		
END CHOOSE

inv_win32.DeleteObject(ull_StatusBrushColor)
inv_win32.SelectClipRgn(hdc, 0)
inv_win32.DeleteObject(hRgn)

RETURN 1
end function

public function boolean of_cursorovermonthresizehandle (long al_x, long al_y, ref boolean ab_left);Long ll_index, ll_regionindex, ll_count, ll_regioncount

ll_count = UpperBound(s_loadedevents)


FOR ll_index = 1 TO ll_count
	ll_regioncount = UpperBound(s_loadedevents[ll_index].rectregions)
	
	IF ll_regioncount > 0 THEN
		IF (al_x > s_loadedevents[ll_index].rectregions[1].Left AND al_y >  s_loadedevents[ll_index].rectregions[1].Top AND &
			 al_x <  s_loadedevents[ll_index].rectregions[1].Right AND al_y <  s_loadedevents[ll_index].rectregions[1].Bottom) THEN
			 
			 IF s_loadedevents[ll_index].DisplayAsAllDayEvent AND &
				 (al_x - s_loadedevents[ll_index].rectregions[1].Left <= ii_resizebordersize) THEN
				 ab_left = TRUE
				RETURN TRUE
			END IF
		END IF
		IF (al_x > s_loadedevents[ll_index].rectregions[ll_regioncount].Left AND al_y >  s_loadedevents[ll_index].rectregions[ll_regioncount].Top AND &
			 al_x <  s_loadedevents[ll_index].rectregions[ll_regioncount].Right AND al_y <  s_loadedevents[ll_index].rectregions[ll_regioncount].Bottom) THEN
			 
			 IF s_loadedevents[ll_index].DisplayAsAllDayEvent AND &
				 (s_loadedevents[ll_index].rectregions[ll_regioncount].Right - al_x <= ii_resizebordersize) THEN
				 ab_left = FALSE
				RETURN TRUE
			END IF
		END IF
	ELSE
		IF al_x > s_loadedevents[ll_index].rectregion.Left AND al_y >  s_loadedevents[ll_index].rectregion.Top AND &
			 al_x <  s_loadedevents[ll_index].rectregion.Right AND al_y <  s_loadedevents[ll_index].rectregion.Bottom THEN
			 
			 IF s_loadedevents[ll_index].DisplayAsAllDayEvent AND &
				 (al_x - s_loadedevents[ll_index].rectregion.Left <= ii_resizebordersize OR &
				 s_loadedevents[ll_index].rectregion.Right - al_x <= ii_resizebordersize) THEN
				 
				 ab_left = (al_x - s_loadedevents[ll_index].rectregion.Left <= ii_resizebordersize)
				 
				RETURN TRUE
			END IF
		END IF
	END IF
NEXT

RETURN FALSE
end function

public function scheduleevent of_getevent (long eventid);Long ll_index, ll_count
scheduleevent lstr_empty

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	IF s_loadedevents[ll_index].eventobject.eventid = eventid THEN
		RETURN s_loadedevents[ll_index].eventobject
	END IF
NEXT

ll_count = UpperBound(s_otherloadedevents)

FOR ll_index = 1 TO ll_count
	IF s_otherloadedevents[ll_index].eventobject.eventid = eventid THEN
		RETURN s_otherloadedevents[ll_index].eventobject
	END IF
NEXT

lstr_empty.eventid = -1

RETURN lstr_empty
end function

public function scheduleevent of_getselectedevent ();scheduleevent l_event

l_event.eventid = -1

IF IsValid(istr_selectedevent) THEN
	l_event = istr_selectedevent.EventObject
END IF

RETURN l_event
end function

private function integer of_drawselectionfullday (longptr hdc, longptr aul_graphics);IF CreateNewEventOnMouseDrag THEN RETURN 0
IF NOT IsValid(istr_selectedcell) THEN RETURN 0
IF NOT in_loadedresources.KeyExists(String(istr_selectedcell.eventobject.resourceid)) THEN RETURN 0

Long li_x, li_y, li_width, li_height, li_eventslotwidth
Long ll_startx, ll_endx
Time lt_newtime
DateTime ldt_newstart, ldt_newend
s_rect eventRect
	

//DRAW EVENT BASED ON eventRect
LongPtr ull_BackBrushColor, hRPen
ULong ll_color

ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')

// create a brush
hRPen = inv_win32.CreatePen(0,1,ll_color)
ull_BackBrushColor = CreateSolidBrush(ll_color)

//Fill rectangle
inv_win32.SelectObject(hdc, ull_BackBrushColor)
inv_win32.SelectObject(hdc, hRPen)

Integer li_days, li_index, li_lineindex, li_linecount
DateTime ldt_start, ldt_end
LongPtr lul_pen

inv_win32.GdipCreatePen1(inv_win32.PBUSMakeARGB (255, 218, 220, 224),1, 2, lul_Pen)

li_eventslotwidth = TimeColumnWidth / (60 / Max(MinCellSelectionsIncrement, MinAppointmentIncrement))

ldt_start = istr_selectedcell.eventobject.StartDateTime
ldt_end = istr_selectedcell.eventobject.EndDateTime
	
//ll_clickedresourceid
str_scheduleeventresources lstr_scheduleresource
lstr_scheduleresource = in_loadedresources.Get(String(istr_selectedcell.eventobject.resourceid))
	
ll_startx = of_GetXCordFromDate(ldt_start) //Min(il_selectionx + il_xscroll, il_lbuttonxpos + il_xscroll)
ll_endx = of_GetXCordFromDate(ldt_end) //Max(il_selectionx + il_xscroll, il_lbuttonxpos + il_xscroll)

li_x =  ll_startx + il_xscroll
li_width = ll_endx - ll_startx

//li_width += li_eventslotwidth

li_height = lstr_scheduleresource.resourceheight
li_y = il_clickresourcey + HeaderHeight + il_yscroll

inv_win32.RoundRect( hdc, li_x, &
									 li_y + 1, &
									 li_width + li_x, &
									 li_height + li_y - 1, &
									0, 0)

FOR li_lineindex = 1 TO li_linecount
	IF li_x + (li_lineindex * li_eventslotwidth) > li_width + li_x - 1 THEN CONTINUE
	inv_win32.GdipDrawLine (aul_graphics, lul_pen, li_x + (li_lineindex * li_eventslotwidth), li_y,  li_x + (li_lineindex * li_eventslotwidth), li_y + li_height)
NEXT										

//cleanup
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(ull_BackBrushColor)
inv_win32.GdipDeletePen(lul_Pen)

RETURN 1
end function

public function integer of_createnewevent (datetime ad_startdate, datetime ad_enddate, boolean ab_alldayevent, integer ai_eventtype);IF IsValid(istr_newevent) THEN
	DESTROY istr_newevent
END IF

istr_newevent = CREATE str_schedulemappedevents

istr_newevent.eventobject.StartDateTime = ad_startdate
istr_newevent.eventobject.EndDateTime = ad_enddate
istr_newevent.eventobject.AllDayEvent = ab_alldayevent
istr_newevent.eventobject.eventtype = ai_eventtype

IF ai_eventtype = Meeting THEN
	istr_newevent.eventobject.IsMeeting = TRUE
END IF

istr_newevent.eventobject.TextColor = RGB(255,255,255)

i_newevent = istr_newevent.eventobject

POST of_NewEvent()

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_clearselection ();DESTROY istr_selectedcell
ib_isselecting = FALSE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_addevent (scheduleevent a_event);IF a_event.resourceid <= 0 THEN
	 a_event.resourceid = il_resourceid
END IF

IF a_event.resourceid = il_resourceid THEN
	s_loadedevents[UpperBound(s_loadedevents) + 1] = CREATE str_schedulemappedevents
	s_loadedevents[UpperBound(s_loadedevents)].eventobject = a_event
ELSE
	s_otherloadedevents[UpperBound(s_otherloadedevents) + 1] = CREATE str_schedulemappedevents
	s_otherloadedevents[UpperBound(s_otherloadedevents)].eventobject = a_event
END IF

of_UpdateEventCords()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_deleteevent (long eventid);Long ll_index, ll_count
str_schedulemappedevents lstr_deletedevent

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	IF s_loadedevents[ll_index].eventobject.EventId = eventid THEN
		lstr_deletedevent = s_loadedevents[ll_index]
		RETURN of_DeleteEvent(lstr_deletedevent)
	END IF
NEXT

ll_count = UpperBound(s_otherloadedevents)

FOR ll_index = 1 TO ll_count
	IF s_otherloadedevents[ll_index].eventobject.EventId = eventid THEN
		lstr_deletedevent = s_otherloadedevents[ll_index]
		RETURN of_DeleteEvent(lstr_deletedevent)
	END IF
NEXT

RETURN -1
end function

public function integer of_updateevent (scheduleevent a_event);Long ll_index, ll_count, ll_newindex
Boolean lb_found
ScheduleEvent lstr_events[]

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	IF s_loadedevents[ll_index].eventobject.EventId = a_event.eventid THEN
		s_loadedevents[ll_index].eventobject = a_event
		lb_found = TRUE
		EXIT
	END IF
NEXT

IF NOT lb_found THEN
	ll_count = UpperBound(s_otherloadedevents)
	
	FOR ll_index = 1 TO ll_count
		IF s_otherloadedevents[ll_index].eventobject.EventId = a_event.eventid THEN
			s_otherloadedevents[ll_index].eventobject = a_event
			lb_found = TRUE
			EXIT
		END IF
	NEXT
END IF

IF NOT lb_found THEN
	RETURN -1
END IF

of_UpdateEventCords()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_editevent (str_schedulemappedevents lstr_event, integer flag);Long ll_index, ll_count, ll_newindex
Long ll_x, ll_y
scheduleevent s_newevents[]
str_scheduleeventedit lstr_edit
scheduleevent l_events[]
DateTime ld_min

IF IsValid(lstr_event) AND UseCustomUI THEN
	IF Event EventChanging(flag, lstr_event.eventobject, lstr_event.eventobject) = 1 THEN
		Event EventChanged(lstr_event.eventobject)
	ELSE
		IF i_movingevent.StartDatetime <> ld_min THEN
			lstr_event.eventobject.StartDateTime = i_movingevent.StartDatetime
			lstr_event.eventobject.EndDateTime = i_movingevent.EndDatetime
		END IF
	END IF
	
	of_UpdateEventCords()
	SetRedraw(TRUE)
	
	RETURN 1
END IF

IF IsValid(lstr_event) THEN
	lstr_edit.eventobject = lstr_event.eventobject
	lstr_edit.increment = MinAppointmentIncrement
	lstr_edit.TimeFormat24Hour = TimeFormat24Hour
	lstr_edit.Theme = Theme
	lstr_edit.NewEvent = FALSE
	lstr_edit.AvailableGuests = s_availableguests
	lstr_edit.EventType =  lstr_event.eventobject.EventType
	lstr_edit.IsReadOnly = IsReadOnly
	
	IF NOT HideTime THEN
		OpenWithParm(w_pbus_scheduleevent, lstr_edit)
	ELSE
		OpenWithParm(w_pbus_scheduleevent_hidetime, lstr_edit)
	END IF
	
	IF NOT IsReadOnly THEN
		IF IsValid(Message.PowerObjectParm) THEN
			lstr_edit = Message.PowerObjectParm
			
			IF lstr_edit.DeleteEvent THEN
				of_DeleteEvent(lstr_event)
			ELSE
			
				IF Event EventChanging(flag, lstr_event.eventobject, lstr_edit.eventobject) = 1 THEN
					lstr_event.eventobject = lstr_edit.eventobject
					
					Event EventChanged(lstr_event.eventobject)
					
					of_UpdateEventCords()
					SetRedraw(TRUE)
				END IF
			END IF
		ELSE
			of_UpdateEventCords()
			SetRedraw(TRUE)
		END IF
	END IF
END IF

RETURN 1
end function

public function integer of_getselection (ref datetime startdatetime, ref datetime enddatetime, ref boolean alldayevent);IF IsValid(istr_selectedcell) THEN
	
	StartDateTime = istr_selectedcell.eventobject.StartDateTime
	EndDateTime = istr_selectedcell.eventobject.EndDateTime
	alldayevent = istr_selectedcell.eventobject.AllDayEvent
	
	IF OnlyShowWorkingHours THEN
		//If the end time after the move is the start time of the next day, we need to make the end time the end time of the previous day
		IF Time(EndDateTime) = WorkStartTime THEN
			EndDateTime = DateTime(inv_Helper.of_GetClosestWorkingDate(THIS, RelativeDate(Date(EndDateTime), -1)), WorkEndTime)
		END IF
	END IF
	
	RETURN 1
END IF


RETURN -1
end function

public function integer of_setminappointmentincrement (integer ai_value);MinAppointmentIncrement = ai_value

RETURN 1
end function

public function integer of_seticonimages (string as_privateimage, string as_recurringimage, string as_meetingimage);PrivateEvent_Image = as_privateimage
RecurringEvent_Image = as_recurringimage
MeetingEvent_Image = as_meetingimage

il_privateimage = inv_imagelist.of_AddImage(as_privateimage) - 1
il_recurringimage = inv_imagelist.of_AddImage(as_recurringimage) - 1
il_meetingimage = inv_imagelist.of_AddImage(as_meetingimage) - 1

il_imagelistsmall = inv_imagelist.of_GetSmallHandle()

RETURN 1
end function

private function string of_geteventtitle (scheduleevent a_event);IF Len(Trim(a_event.Title)) > 0 THEN
	RETURN a_event.Title
END IF

RETURN inv_resourcemanager.of_GetString(NoTitle)
end function

public function integer of_finishtitleedit ();IF NOT IsValid(sle_scheduletitleedit) THEN RETURN 0
IF NOT sle_scheduletitleedit.Visible THEN RETURN 0

ScheduleEvent l_events[]
ScheduleEvent l_orig, l_new

l_orig = istr_selectedevent.eventobject
l_new = l_orig
l_new.Title = sle_scheduletitleedit.Text

IF Event EventChanging(EVENT_UPDATED, l_orig, l_new) = 1 THEN
	istr_selectedevent.eventobject = l_new
	Event EventChanged(l_new)
END IF

sle_scheduletitleedit.Hide()

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_showtitleeditor ();IF NOT IsValid(istr_selectedevent) THEN RETURN 0

n_uspb_colors lnv_colors
ULong ll_textcolor, ll_eventcolor
Integer li_height, li_titleheight, li_xadjust
LongPtr ll_dc
n_uspb_text_helper lnv_texthelper

of_ReleaseMouse()

ll_eventcolor = istr_selectedevent.eventobject.Color
ll_textcolor = istr_selectedevent.eventobject.TextColor

IF ll_eventcolor = 0 THEN
	ll_eventcolor = of_getcolor("peacock")
END IF

IF istr_selectedevent.eventobject.EndDateTime < DateTime(Today(), Now()) AND istr_selectedevent.eventobject.AllDayEvent = FALSE OR &
    Date(istr_selectedevent.eventobject.EndDateTime) < Today() AND istr_selectedevent.eventobject.AllDayEvent = TRUE THEN
	ll_eventcolor = lnv_colors.of_LightenColor(180, ll_eventcolor)
	IF ll_textcolor = RGB(255,255,255) THEN
		ll_textcolor =  RGB(124,151,164)
	ELSE
		ll_textcolor =  lnv_colors.of_LightenColor(90, ll_textcolor)
	END IF
END IF

sle_scheduletitleedit.BackColor = ll_eventcolor
sle_scheduletitleedit.TextColor = ll_textcolor
sle_scheduletitleedit.TextSize = TextSize * -1
sle_scheduletitleedit.FaceName = FontName
sle_scheduletitleedit.Weight = 600

sle_scheduletitleedit.Text = istr_selectedevent.eventobject.Title

li_height = istr_selectedevent.rectregion.Bottom - istr_selectedevent.rectregion.Top - ScaleDPI(4)


ll_dc = inv_win32.GetDC(Handle(THIS))
li_titleheight = ScaleDPI(6) + lnv_texthelper.of_GetTextHeight(ll_dc, of_GetEventTitle(istr_selectedevent.eventobject), FontName, TextSize, ALIGN_LEFT, ScaleDPI(10), TRUE, FALSE, FALSE)
inv_win32.ReleaseDC (Handle(THIS), ll_dc)

li_height = Max(li_height, li_titleheight)


sle_scheduletitleedit.Move(PixelsToUnits(istr_selectedevent.rectregion.Left + li_xadjust + ii_eventleftmargin - ScaleDPI(2), XPixelsToUnits!), &
                                      PixelsToUnits(istr_selectedevent.rectregion.Top + ScaleDPI(2), YPixelsToUnits!))
sle_scheduletitleedit.Resize(PixelsToUnits(istr_selectedevent.rectregion.Right - (istr_selectedevent.rectregion.Left + ii_eventleftmargin + li_xadjust), XPixelsToUnits!), &
                                        PixelsToUnits(li_height, YPixelsToUnits!))

sle_scheduletitleedit.BringToTop = TRUE
sle_scheduletitleedit.SetFocus()
sle_scheduletitleedit.Show()

RETURN 1
end function

public function integer of_updateselectionmonth (long al_x, long al_y);Date ldt_newend, ldt_newstart
Date ld_newdate
Integer li_eventslotheight
Long ll_rowheight, ll_colwidth
Time lt_base
str_scheduledimensions lstr_grid
Point lp_cell
Int HeaderAdjust
Int DayNumberHeight

HeaderAdjust = ScaleDPI(10)
DayNumberHeight = ScaleDPI(28)

IF IsValid(istr_selectedcell) THEN
	
	//lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)
	ll_rowheight = lstr_grid.RowHeight
	ll_colwidth = lstr_grid.ColumnWidth
	
	lp_cell  = inv_helper.of_GetDayCellFromCords(al_x, al_y - DayNumberHeight + HeaderAdjust, ll_colwidth, ll_rowheight)
		
	ld_newdate = inv_helper.of_GetDateFromCell(lstr_grid.StartDate, lp_cell)
	
	ldt_newstart = Date(istr_selectedcell.eventobject.StartDateTime)
	ldt_newend = Date(istr_selectedcell.eventobject.EndDateTime)
	
	IF ld_newdate > Date(idt_selectedtime) THEN
		ldt_newstart = Date(idt_selectedtime)
		ldt_newend = ld_newdate
	ELSE
		ldt_newstart = ld_newdate
		ldt_newend = Date(idt_selectedendtime)
	END IF
		
	istr_selectedcell.eventobject.StartDateTime = DateTime(ldt_newstart)
	istr_selectedcell.eventobject.EndDateTime = DateTime(ldt_newend)
	
	SetRedraw(TRUE)
END IF

RETURN 1
end function

public function integer of_getdaterange (ref date ad_start, ref date ad_end);ad_start = id_StartDate
ad_end = RelativeDate(ad_start, of_GetDayCount() - 1)

RETURN 1
end function

public function integer of_gettotalhours ();Date ld_start, ld_end

of_GetDateRange(ld_start, ld_end)

RETURN (DaysAfter(ld_start,ld_end) + 1) * 24
end function

public function integer of_gettotalworkinghours ();Int TotalHours
Int li_workinghours, li_workingdays, li_nonworkingdays
Int ll_index, ll_count, li_daynumber
DateTime ldt_start, ldt_end
Date ld_start, ld_end

of_GetDateRange(ld_start, ld_end)

ldt_start = DateTime(Today(), WorkStartTime)
ldt_end = DateTime(Today(), WorkEndTime)

li_workinghours = (inv_helper.of_secondsAfter(ldt_start, ldt_end)) / 60 / 60
li_workingdays = (DaysAfter(ld_start,ld_end) + 1)

FOR ll_index = 1 TO li_workingdays
	li_daynumber = DayNumber(RelativeDate(Date(ld_start), ll_index - 1))
	
	IF (li_DayNumber = 1 AND NOT WorkSunday) OR &
		(li_DayNumber = 2 AND NOT WorkMonday) OR &
		(li_DayNumber = 3 AND NOT WorkTuesday) OR &		
		(li_DayNumber = 4 AND NOT WorkWednesday) OR &
		(li_DayNumber = 5 AND NOT WorkThursday) OR &
		(li_DayNumber = 6 AND NOT WorkFriday) OR &
		(li_DayNumber = 7 AND NOT WorkSaturday)  THEN
			
		li_nonworkingdays += 1
	END IF
NEXT

RETURN (li_workingdays - li_nonworkingdays) * li_workinghours
end function

public function integer of_setdefaultview (integer ai_view);IF ai_view >= 1 AND ai_view <= 4 THEN
	DefaultView = ai_view
	
	RETURN of_SetCurrentDate(CurrentDate)
END IF

RETURN -1

end function

private function integer of_drawfulldayevents (longptr hdc, longptr aul_graphics);Long ll_index, ll_count, ll_innerindex, ll_innercount
Int li_numdays, li_nexty, li_x, li_width, ll_prevy
Boolean lb_startsbeforeweek, lb_endsafterweek
Long ll_workspacewidth
String ls_keys[]
Long ll_resourceid
Long ll_height
str_scheduleeventresources lstr_resource

li_numdays = of_GetDayCount()
ll_workspacewidth = UnitsToPixels(Width, XUnitsToPixels!) //- ResourceColumnWidth
ll_count = UpperBound(s_loadedevents)

IF RenderDefaultResource THEN
	//Loop through all the events and look for all day events
	FOR ll_index = 1 TO ll_count
		//IF s_loadedevents[ll_index].IsMoving THEN CONTINUE
		
		s_loadedevents[ll_index].rectregion = inv_helper.of_NewRect(0,0,0,0)
		
		IF OnlyShowWorkingHours AND inv_helper.of_IsFullEventInNonWorkingHours(THIS, s_loadedevents[ll_index].eventobject) THEN CONTINUE
		IF Date(s_loadedevents[ll_index].eventobject.EndDateTime) < id_StartDate THEN CONTINUE
		IF Date(s_loadedevents[ll_index].eventobject.StartDateTime) >= RelativeDate(id_StartDate, li_numdays) THEN CONTINUE
		
		li_x = s_loadedevents[ll_index].schedulerectregion.left + il_xscroll
		li_width = s_loadedevents[ll_index].schedulerectregion.right - s_loadedevents[ll_index].schedulerectregion.left
		li_nexty = s_loadedevents[ll_index].schedulerectregion.top + il_yscroll
		
		IF li_x + li_width < 0 OR li_x > ll_workspacewidth THEN CONTINUE
	
		s_loadedevents[ll_index].rectregion = inv_helper.of_NewRect(li_x, li_nexty + HeaderHeight, li_width, ScaleDPI(DefaultFullDayHeight))
	
		of_DrawFullDayEvent(hdc, aul_graphics, s_loadedevents[ll_index].eventobject, li_x, li_nexty + HeaderHeight, li_width, ScaleDPI(DefaultFullDayHeight), lb_startsbeforeweek, lb_endsafterweek, of_EventIsSelected(s_loadedevents[ll_index]))
	NEXT
ELSE
	FullDayHeight = 0
END IF

in_loadedresources.GetKeys(ls_keys)
ll_count = UpperBound(ls_keys)
ll_innercount = UpperBound(s_otherloadedevents)
ll_prevy =  FullDayHeight

FOR ll_index = 1 TO ll_count
	ll_resourceid = Long(ls_keys[ll_index])
	
	IF ll_resourceid = il_resourceid THEN CONTINUE	

	lstr_resource = in_loadedresources.Get(ls_keys[ll_index])

	ll_height = lstr_resource.ResourceHeight

	//Loop through all the events and look for all day events
	FOR ll_innerindex = 1 TO ll_innercount
		
		IF s_otherloadedevents[ll_innerindex].eventobject.ResourceId <> ll_resourceid THEN CONTINUE
		
		//IF s_otherloadedevents[ll_innerindex].IsMoving THEN CONTINUE
		
		s_otherloadedevents[ll_innerindex].rectregion = inv_helper.of_NewRect(0,0,0,0)
		
		IF OnlyShowWorkingHours AND inv_helper.of_IsFullEventInNonWorkingHours(THIS, s_otherloadedevents[ll_innerindex].eventobject) THEN CONTINUE
		IF Date(s_otherloadedevents[ll_innerindex].eventobject.EndDateTime) < id_StartDate THEN CONTINUE
		IF Date(s_otherloadedevents[ll_innerindex].eventobject.StartDateTime) >= RelativeDate(id_StartDate, li_numdays) THEN CONTINUE
		
		li_x = s_otherloadedevents[ll_innerindex].schedulerectregion.left + il_xscroll
		li_width = s_otherloadedevents[ll_innerindex].schedulerectregion.right - s_otherloadedevents[ll_innerindex].schedulerectregion.left
		li_nexty = ll_prevy + s_otherloadedevents[ll_innerindex].schedulerectregion.top + il_yscroll
		
		IF li_x + li_width < 0 OR li_x > ll_workspacewidth THEN CONTINUE
	
		s_otherloadedevents[ll_innerindex].rectregion = inv_helper.of_NewRect(li_x, li_nexty + HeaderHeight, li_width, ScaleDPI(DefaultFullDayHeight))	
	
		of_DrawFullDayEvent(hdc, aul_graphics, s_otherloadedevents[ll_innerindex].eventobject, li_x, li_nexty + HeaderHeight, li_width, ScaleDPI(DefaultFullDayHeight), lb_startsbeforeweek, lb_endsafterweek, of_EventIsSelected(s_otherloadedevents[ll_innerindex]))
	NEXT
	
	ll_prevy += ll_height
NEXT

RETURN 1
end function

public function integer of_displayworkinghoursonly (boolean ab_switch);DateTime ldt_firstvisible, ldt_base

ldt_firstvisible = of_GetFirstVisibleDateTime()

OnlyShowWorkingHours = ab_switch

of_UpdateEventCords()

IF ldt_firstvisible > ldt_base THEN
	of_ScrollToDateTime(ldt_firstvisible)
ELSE
	il_xscroll = 0
	il_yscroll = 0
	uo_hscroll.Position = 0
	uo_vscroll.Position = 0

	Event Resize(99, THIS.Width, THIS.Height)
END IF

SetRedraw(TRUE)

RETURN 1
end function

private function integer of_destroyevents (long ai_resourceid);Long ll_index, ll_count

IF ai_resourceid = il_resourceid OR ai_resourceid = -1 THEN
	ll_count = UpperBound(s_loadedevents)
	
	FOR ll_index = 1 TO ll_count
		IF NOT IsValid(s_loadedevents[ll_index]) THEN CONTINUE
		DESTROY s_loadedevents[ll_index]
	NEXT
	
	str_schedulemappedevents lstr_empty[]
	s_loadedevents = lstr_empty
END IF


ll_count = UpperBound(s_otherloadedevents)
	
FOR ll_index = 1 TO ll_count
	IF NOT IsValid(s_otherloadedevents[ll_index]) THEN CONTINUE
	IF s_otherloadedevents[ll_index].eventobject.resourceid = ai_resourceid OR ai_resourceid = -1 THEN
		DESTROY s_otherloadedevents[ll_index]
	END IF	
NEXT

str_schedulemappedevents ls_otherloadedevents[]

FOR ll_index = 1 TO ll_count
	IF NOT IsValid(s_otherloadedevents[ll_index]) THEN CONTINUE
	ls_otherloadedevents[UpperBound(ls_otherloadedevents) + 1] = s_otherloadedevents[ll_index]
NEXT

s_otherloadedevents = ls_otherloadedevents
	
RETURN 1
end function

public function integer of_loadevents (long ai_resourceid, scheduleevent a_events[]);Long ll_index, ll_count
str_scheduleeventresources lstr_resource
DateTime ldt_firstvisible, ldt_base

SetRedraw(FALSE)

ldt_firstvisible = of_GetFirstVisibleDateTime()

IF IsValid(sle_scheduletitleedit) THEN
	sle_scheduletitleedit.Hide()
END IF

ib_eventsloaded = TRUE

//Cleanup any already created mapped events
of_DestroyEvents(ai_resourceid)
of_SortEvents(a_events)

ll_count = UpperBound(a_events)

IF ai_resourceid = il_resourceid THEN
	FOR ll_index = 1 TO ll_count
		s_loadedevents[ll_index] = CREATE str_schedulemappedevents
		s_loadedevents[ll_index].eventobject = a_events[ll_index]
	NEXT

	lstr_resource.ResourceName = is_resourcename	
	in_loadedresources.Put(String(ai_resourceid), lstr_resource) 
ELSE
	Long ll_eventindex
	
	FOR ll_index = 1 TO ll_count
		ll_eventindex = UpperBound(s_otherloadedevents) + 1
		s_otherloadedevents[ll_eventindex] = CREATE str_schedulemappedevents
		s_otherloadedevents[ll_eventindex].eventobject = a_events[ll_index]
	NEXT
END IF

of_UpdateEventCords()

IF ldt_firstvisible > ldt_base THEN
	of_ScrollToDateTime(ldt_firstvisible)
ELSE
	il_xscroll = 0
	il_yscroll = 0
	uo_hscroll.Position = 0
	uo_vscroll.Position = 0
END IF

Event Resize(99, THIS.Width, THIS.Height)

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_loadmappedevents (long ai_resourceid, ref str_schedulemappedevents a_events[]);Long ll_index, ll_innerindex, ll_count, ll_innercount
Int li_numdays
Date id_workingdate
Long li_x, li_width, ll_workspacewidth, ll_row
Int li_nexty
int li_minutes
DateTime lt_eventstart, lt_eventend
Date id_FirstVisibleDay
int li_hoursinworkday, li_workingdaysbetween, li_scheduleheight
Double li_eventhours
s_rect lstr_taken[]

li_numdays = of_GetDayCount()
ll_count = UpperBound(a_events[])

ll_workspacewidth = UnitsToPixels(Width, XUnitsToPixels!) - ResourceColumnWidth

li_hoursinworkday = inv_helper.of_SecondsAfter(DateTime(id_StartDate,WorkStartTime ), DateTime(id_StartDate,WorkEndTime)) / 60 / 60

IF ai_resourceid = il_resourceid AND NOT RenderDefaultResource THEN
	RETURN 0
END IF

//Loop through all the events and look for all day events
FOR ll_index = 1 TO ll_count
	IF a_events[ll_index].eventobject.resourceid <> ai_resourceid THEN CONTINUE
	IF Date(a_events[ll_index].eventobject.EndDateTime) < id_StartDate THEN CONTINUE
	IF Date(a_events[ll_index].eventobject.StartDateTime) >= RelativeDate(id_StartDate, li_numdays) THEN CONTINUE
	
	IF NOT OnlyShowWorkingHours THEN
		
		lt_eventstart =  a_events[ll_index].eventobject.StartDateTime
		IF Date(lt_eventstart) < id_StartDate THEN
			lt_eventstart = DateTime(id_StartDate)
		END IF
		
		li_minutes = (inv_helper.of_SecondsAfter(DateTime(id_StartDate), lt_eventstart) / 60)
		
		li_x = (Double(Double(TimeColumnWidth) / 60.0) * Double(li_minutes)) + ResourceColumnWidth
		
		li_minutes = inv_helper.of_SecondsAfter(lt_eventstart, a_events[ll_index].eventobject.EndDateTime) / 60
		
		li_width = (Double(Double(TimeColumnWidth) / 60.0) * Double(li_minutes))
	ELSE
		
		IF inv_helper.of_IsFullEventInNonWorkingHours(THIS, a_events[ll_index].eventobject) THEN CONTINUE

		lt_eventstart = inv_helper.of_GetBestScheduleStart(THIS, a_events[ll_index].eventobject)
		lt_eventend = inv_helper.of_GetBestScheduleEnd(THIS, a_events[ll_index].eventobject)
		li_eventhours = inv_helper.of_GetEventWorkingHours(THIS, lt_eventstart, lt_eventend, TRUE)
		id_FirstVisibleDay = inv_helper.of_GetFirstWorkingDay(THIS)
		li_workingdaysbetween = inv_helper.of_GetWorkingDaysBetweenDates(THIS, id_FirstVisibleDay, Date(lt_eventstart))
		
		li_minutes = ((li_workingdaysbetween * li_hoursinworkday) * 60) +  (inv_helper.of_SecondsAfter(DateTime(Date(lt_eventstart), WorkStartTime), lt_eventstart) / 60)
		li_x = (Double(Double(TimeColumnWidth) / 60.0) * Double(li_minutes)) + ResourceColumnWidth
		
		li_minutes = li_eventhours * 60.0
		
		li_width = (Double(Double(TimeColumnWidth) / 60.0) * Double(li_minutes))
		
	END IF
	
	boolean lb_available
	ll_row = 0
	ll_innercount = UpperBound(lstr_taken)
	
	DO WHILE  TRUE
		lb_available = TRUE
		
		FOR ll_innerindex = 1 TO ll_innercount
			s_rect taken
			
			taken = lstr_taken[ll_innerindex]
			
			IF li_x < (taken.right) AND (li_x + li_width) > taken.left AND taken.top =  ((ll_row) * (ScaleDPI(DefaultFullDayHeight + 2))) + 1 THEN
				lb_available = FALSE
				EXIT
			END IF
		NEXT
		
		IF lb_available THEN EXIT
		
		ll_row++
	LOOP
	
	li_nexty = ((ll_row) * (ScaleDPI(DefaultFullDayHeight + 2))) + 1
	
	s_rect newTaken
	newTaken.left = li_x
	newTaken.right = li_x + li_width
	newTaken.top = li_nexty
	lstr_taken[ll_innercount + 1] = newTaken
	
	a_events[ll_index].schedulerectregion = inv_helper.of_NewRect(li_x, li_nexty, li_width,  ScaleDPI(DefaultFullDayHeight))
	
	li_scheduleheight = Max(li_scheduleheight, li_nexty + ScaleDPI(DefaultFullDayHeight + 2))
NEXT

RETURN li_scheduleheight + ScaleDPI(6)
end function

private function integer of_updateeventcords ();String ls_keys[]
Integer li_count, li_index
str_scheduleeventresources lstr_resource

il_totalheight = 0

IF OnlyShowWorkingHours THEN
	of_LoadWorkingDates()
END IF

IF in_loadedresources.KeyExists(String(il_resourceid)) THEN
	FullDayHeight = Max(of_LoadMappedEvents(il_resourceid, s_loadedevents), ScaleDPI(DefaultFullDayHeight))

	lstr_resource = in_loadedresources.Get(String(il_resourceid))
	lstr_resource.ResourceHeight = FullDayHeight
	
	il_totalheight += lstr_resource.ResourceHeight
	
	in_loadedresources.Put(String(il_resourceid), lstr_resource)
END IF

in_loadedresources.GetKeys(ls_keys)

li_count = UpperBound(ls_keys)

FOR li_index = 1 TO li_count
	IF Long(ls_keys[li_index]) = il_resourceid THEN CONTINUE
	
	lstr_resource = in_loadedresources.Get(ls_keys[li_index])
	lstr_resource.ResourceHeight = Max(of_LoadMappedEvents(Long(ls_keys[li_index]), s_otherloadedevents), ScaleDPI(DefaultFullDayHeight))
	
	il_totalheight += lstr_resource.ResourceHeight
	
	in_loadedresources.Put(ls_keys[li_index],  lstr_resource)
NEXT

il_totalheight += (ScaleDPI(DefaultFullDayHeight) * 2)

RETURN 1
end function

public function integer of_loadadditionalevents (long ai_resourceid, string ai_resourcename, scheduleevent a_events[]);Long ll_xscroll, ll_scrollpos

str_scheduleeventresources lstr_resource
lstr_resource.ResourceName = ai_resourcename
in_loadedresources.Put(String(ai_resourceid), lstr_resource)

ll_xscroll = il_xscroll
ll_scrollpos = uo_hscroll.Position

of_LoadEvents(ai_resourceid, a_events)

il_xscroll = ll_xscroll
uo_hscroll.Position =ll_scrollpos

Event Resize(99, THIS.Width, THIS.Height)

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_removeadditionalevents (long ai_resourceid);of_DestroyEvents(ai_resourceid)
in_loadedresources.Remove(String(ai_resourceid))
of_UpdateEventCords()

il_xscroll = 0
il_yscroll = 0
uo_hscroll.Position = 0
uo_vscroll.Position = 0

Event Resize(99, THIS.Width, THIS.Height)

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setresource (long ai_resourceid, string as_resourcename);str_scheduleeventresources lstr_resource

of_RemoveAdditionalEvents(il_resourceid)

il_resourceid = ai_resourceid
is_resourcename = as_resourcename
lstr_resource.ResourceName = as_resourcename
in_loadedresources.Put(String(ai_resourceid), lstr_resource)

RETURN 1
end function

public function integer of_addresource (long ai_resourceid, string ai_resourcename);Long ll_xscroll, ll_scrollpos

str_scheduleeventresources lstr_resource
lstr_resource.ResourceName = ai_resourcename
in_loadedresources.Put(String(ai_resourceid), lstr_resource)

of_UpdateEventCords()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_bulkloadadditionalevents (scheduleevent a_events[]);Long ll_index, ll_count
str_scheduleeventresources lstr_resource

of_SortEvents(a_events)

ll_count = UpperBound(a_events)

Long ll_eventindex

FOR ll_index = 1 TO ll_count
	ll_eventindex = UpperBound(s_otherloadedevents) + 1
	s_otherloadedevents[ll_eventindex] = CREATE str_schedulemappedevents
	s_otherloadedevents[ll_eventindex].eventobject = a_events[ll_index]
NEXT

of_UpdateEventCords()

RETURN 1
end function

private function str_schedulemappedevents of_geteventforpos (long xpos, long ypos);Long ll_index, ll_count, ll_innerindex, ll_innercount
Long ll_x, ll_y
Long ll_prevheight
String ls_keys[]
str_schedulemappedevents lstr_event

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

IF ll_y < HeaderHeight THEN RETURN lstr_event

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	
	IF ll_x > s_loadedevents[ll_index].rectregion.Left AND ll_y >  s_loadedevents[ll_index].rectregion.Top AND &
	    ll_x <  s_loadedevents[ll_index].rectregion.Right AND ll_y <  s_loadedevents[ll_index].rectregion.Bottom THEN
		 
	    RETURN  s_loadedevents[ll_index]
		 
	END IF

NEXT

ll_count = UpperBound(s_otherloadedevents)

FOR ll_index = 1 TO ll_count
	
	IF ll_x > s_otherloadedevents[ll_index].rectregion.Left AND ll_y >  s_otherloadedevents[ll_index].rectregion.Top AND &
	    ll_x <  s_otherloadedevents[ll_index].rectregion.Right AND ll_y <  s_otherloadedevents[ll_index].rectregion.Bottom THEN
		 
	    RETURN  s_otherloadedevents[ll_index]
		 
	END IF

NEXT

RETURN lstr_event
end function

public function integer of_renderdefaultresource (boolean ab_value);RenderDefaultResource = ab_value
of_UpdateEventCords()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_drawdiagnostics (longptr ahdc, longptr agrahpics);IF NOT DrawDiagnotics THEN RETURN 0

String ls_diagnostictext

IF IsValid(i_newevent) THEN
	ls_diagnostictext = String(i_newevent.StartDateTime) + " - " + String(i_newevent.EndDateTime)
END IF

//ls_diagnostictext = String(of_FindClosestDateTime( UnitsToPixels(THIS.PointerX(), XUnitsToPixels!), 0))

of_DrawText(ahdc, iul_textfontbold, ls_diagnostictext, ALIGN_LEFT, DT_VTOP, &
							0, &
							0, &
							UnitsToPixels(Width, XUnitsToPixels!), &
							UnitsToPixels(Height, XUnitsToPixels!), 0)

RETURN 1

end function

public function integer of_settimecolumnwidth (integer ai_value);DateTime ldt_firstvisible, ldt_base

ldt_firstvisible = of_GetFirstVisibleDateTime()

TimeColumnWidth = ScaleDPI(ai_value)

Long li_eventslotwidth, li_linecount
li_eventslotwidth = TimeColumnWidth / (60 / Max(MinCellSelectionsIncrement, MinAppointmentIncrement))
IF li_eventslotwidth = 0 THEN li_eventslotwidth = 1

li_linecount = ((il_lastxpos - il_xscroll)  / li_eventslotwidth)
il_selectionx =  (li_linecount * li_eventslotwidth)

IF il_selectionx >= il_lbuttonxpos THEN
	il_selectionx += li_eventslotwidth
END IF

of_UpdateEventCords()

IF ldt_firstvisible > ldt_base THEN
	of_ScrollToDateTime(ldt_firstvisible)
ELSE
	il_xscroll = 0
	il_yscroll = 0
	uo_hscroll.Position = 0
	uo_vscroll.Position = 0
END IF

Event Resize(99, THIS.Width, THIS.Height)

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_scrolltodate (date a_date);Long ll_xcord
DateTime ldt_scrolldate

IF 	OnlyShowWorkingHours THEN
	ldt_scrolldate = DateTime(a_date, WorkStartTime)
ELSE
	ldt_scrolldate = DateTime(a_date)
END IF
	
RETURN of_ScrollToDateTime(ldt_scrolldate)
end function

private function time of_findclosesttime (long al_x);Long li_minute, li_hoursinday, li_totaldays, li_newday
Double li_eventslotheight, ld_x
Time lt_basetime
Long ll_leadingseconds
DateTime ldt_start, ldt_end

IF il_xscroll < 0 THEN
	al_x = al_x - il_xscroll
END IF

al_x = al_x - ResourceColumnWidth

IF al_x < 0 THEN
	al_x = 0
END IF

IF OnlyShowWorkingHours THEN	
	ldt_start = DateTime(Today(), WorkStartTime)
	ldt_end = DateTime(Today(), WorkEndTime)

	li_hoursinday = (inv_helper.of_secondsAfter(ldt_start, ldt_end)) / 60 / 60
	ll_leadingseconds = Hour(WorkStartTime) * 3600 //Leading time is start hour * seconds in an hour
ELSE
	li_hoursinday = 24
	ll_leadingseconds = 0
END IF

IF TimeColumnWidth = 0 THEN TimeColumnWidth = 1

li_newday = Double(al_x) / Double(TimeColumnWidth * li_hoursinday)

ld_x = Double(al_x) - ((li_newday * Double(li_hoursinday)) * TimeColumnWidth)

li_eventslotheight = Double(TimeColumnWidth) / (60.0 / Double(MinAppointmentIncrement))

IF li_eventslotheight = 0 THEN li_eventslotheight = 1

RETURN RelativeTime(lt_basetime,ll_leadingseconds +  (Long(ld_x / li_eventslotheight) * MinAppointmentIncrement * 60))
end function

public function long of_getresourceidfrompos (long al_y);RETURN of_GetResourceIdFromPos(al_y, FALSE)
end function

public function long of_getresourceyfromid (long al_resourceid);String ls_resourceids[]
Integer li_index, li_count
Long ll_ypos
str_scheduleeventresources lstr_resource

in_loadedresources.GetKeys(ls_resourceids)

li_count = UpperBound(ls_resourceids)

FOR li_index = 1 TO li_count
	lstr_resource = in_loadedresources.Get(ls_resourceids[li_index])
	
	IF NOT RenderDefaultResource AND Long(ls_resourceids[li_index]) = il_resourceid THEN CONTINUE
	
	IF Long(ls_resourceids[li_index]) = al_resourceid THEN
		RETURN ll_ypos
	END IF
	
	ll_ypos += Max(lstr_resource.ResourceHeight, ScaleDPI(DefaultFullDayHeight))

NEXT

RETURN -1

end function

public function integer of_loadworkingdates ();Date ld_workingdates[]
Date ldt_workingdate
Double ld_return
Long ll_index, ll_count

ll_count = of_GetDayCount()
ldt_workingdate = id_StartDate

FOR ll_index = 1 TO ll_count
	IF (DayNumber(ldt_workingDate) = 1 AND WorkSunday) OR &
	   (DayNumber(ldt_workingDate) = 2 AND WorkMonday) OR &
	   (DayNumber(ldt_workingDate) = 3 AND WorkTuesday) OR &		
	   (DayNumber(ldt_workingDate) = 4 AND WorkWednesday) OR &
	   (DayNumber(ldt_workingDate) = 5 AND WorkThursday) OR &
	   (DayNumber(ldt_workingDate) = 6 AND WorkFriday) OR &
	   (DayNumber(ldt_workingDate) = 7 AND WorkSaturday) &		
    THEN
		 
		 ld_workingdates[UpperBound(ld_workingdates) + 1] = ldt_workingdate
	END IF
	
	ldt_workingDate = RelativeDate(ldt_workingDate, 1)
	
NEXT

id_workingdates = ld_workingdates

RETURN 1
end function

public function integer of_updateselection (long al_startx, long al_endx);IF NOT IsValid(istr_selectedcell) THEN RETURN 0
		
istr_selectedcell.eventobject.StartDateTime = of_FindClosestDateTime(al_startx, 1)
istr_selectedcell.eventobject.EndDateTime = of_FindClosestDateTime(al_endx, 1)

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_getloadedresources (ref str_scheduleeventresources a_resources[]);String ls_keys[]
Long ll_index, ll_count
str_scheduleeventresources l_resource

ll_count = in_loadedresources.GetKeys(ls_keys)

FOR ll_index = 1 TO ll_count
	l_resource = in_loadedresources.Get(ls_keys[ll_index])
	
	a_resources[UpperBound(a_resources) + 1].ResourceId = Long(ls_keys[ll_index])
	a_resources[UpperBound(a_resources)].ResourceName = l_resource.ResourceName
NEXT

RETURN UpperBound(a_resources)
end function

public function long of_workspaceheight ();IF ib_printing THEN
	RETURN il_printheight
ELSE
	RETURN THIS.Height
END IF
end function

public function long of_workspacewidth ();IF ib_printing THEN
	RETURN il_printwidth
ELSE
	RETURN THIS.Width
END IF
end function

public function integer of_scrolltodatetime (datetime a_date);Long ll_xcord
Long ll_viewwidth, ll_totalwidth
Integer li_totalhours

ll_xcord = of_GetXCordFromDate(a_date) - ResourceColumnWidth
ll_viewwidth = UnitsToPixels(Width, XUnitsToPixels!) - ResourceColumnWidth

IF 	OnlyShowWorkingHours THEN
	li_totalhours = of_GetTotalWorkingHours()
ELSE
	li_totalhours = of_GetTotalHours()
END IF

ll_totalwidth = (li_totalhours * TimeColumnWidth)

IF ll_xcord < 0 OR ll_xcord > ll_totalwidth THEN RETURN 0

IF ll_totalwidth - ll_xcord < ll_viewwidth THEN
	ll_xcord = ll_totalwidth - ll_viewwidth
END IF

il_xscroll = ll_xcord * -1

IF il_xscroll >= 0 THEN
	il_xscroll = 0
END IF

IF ll_totalwidth > 0 THEN
	uo_hscroll.Position = (Abs(il_xscroll) / ll_totalwidth) * uo_hscroll.MaxPosition
END IF

SetRedraw(TRUE)
uo_hscroll.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_addresourcegroup (long ai_resourceid, string ai_resourcename);Long ll_xscroll, ll_scrollpos

str_scheduleeventresources lstr_resource
lstr_resource.ResourceName = ai_resourcename
lstr_resource.ResourceGroup = TRUE
in_loadedresources.Put(String(ai_resourceid), lstr_resource)

of_UpdateEventCords()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_removealladditionalresources ();Long ll_index, ll_count
String ls_keys[]

ll_count = in_loadedresources.GetKeys(ls_keys)

FOR ll_index = 1 TO ll_count
	of_DestroyEvents(Long(ls_keys[ll_index]))
NEXT

in_loadedresources.Clear()

il_xscroll = 0
il_yscroll = 0
uo_hscroll.Position = 0
uo_vscroll.Position = 0
			
Event Resize(99, THIS.Width, THIS.Height)

SetRedraw(TRUE)

RETURN 1
end function

public function long of_getxcordfromdate (datetime a_date);DateTime lt_eventstart
Date id_FirstVisibleDay
Long li_minutes, li_x, li_width, li_workingdaysbetween, li_hoursinworkday

li_hoursinworkday = inv_helper.of_SecondsAfter(DateTime(id_StartDate,WorkStartTime ), DateTime(id_StartDate,WorkEndTime)) / 60 / 60

IF NOT OnlyShowWorkingHours THEN
		
	lt_eventstart = a_date
	IF Date(lt_eventstart) < id_StartDate THEN
		lt_eventstart = DateTime(id_StartDate)
	END IF
	
	li_minutes = (inv_helper.of_SecondsAfter(DateTime(id_StartDate), lt_eventstart) / 60)
	
	li_x = (Double(Double(TimeColumnWidth) / 60.0) * Double(li_minutes)) + ResourceColumnWidth
	
ELSE
	
	lt_eventstart = a_date
	id_FirstVisibleDay = inv_helper.of_GetFirstWorkingDay(THIS)
	li_workingdaysbetween = inv_helper.of_GetWorkingDaysBetweenDates(THIS, id_FirstVisibleDay, Date(lt_eventstart))
	
	li_minutes = ((li_workingdaysbetween * li_hoursinworkday) * 60) +  (inv_helper.of_SecondsAfter(DateTime(Date(lt_eventstart), WorkStartTime), lt_eventstart) / 60)
	li_x = (Double(Double(TimeColumnWidth) / 60.0) * Double(li_minutes)) + ResourceColumnWidth
	
END IF

RETURN li_x
end function

public function datetime of_getfirstvisibledatetime ();RETURN of_FindClosestDateTime(ResourceColumnWidth + 1, 0)
end function

public function long of_getfirstvisibleresourceid ();RETURN of_GetResourceIdFromPos(HeaderHeight, TRUE)
end function

public function integer of_scrolltoresourceid (long al_resourceid);Long ll_ycord

ll_ycord = of_GetResourceYFromId(al_resourceid)

il_yscroll = ll_ycord * -1

IF il_yscroll >= 0 THEN
	il_yscroll = 0
END IF

IF il_totalheight > 0 THEN
	uo_vscroll.Position = (Abs(il_yscroll) / il_totalheight) * uo_vscroll.MaxPosition
END IF

SetRedraw(TRUE)
uo_vscroll.SetRedraw(TRUE)

RETURN 1
end function

public function long of_getresourceidfrompos (long al_y, boolean ab_includeresourcegroup);String ls_resourceids[]
Integer li_index, li_count
Long ll_ypos, ll_totalheight
str_scheduleeventresources lstr_resource

al_y = al_y - il_yscroll - HeaderHeight

in_loadedresources.GetKeys(ls_resourceids)

li_count = UpperBound(ls_resourceids)

FOR li_index = 1 TO li_count	
	lstr_resource = in_loadedresources.Get(ls_resourceids[li_index])
	
	IF NOT RenderDefaultResource AND Long(ls_resourceids[li_index]) = il_resourceid THEN CONTINUE
	
	ll_totalheight += Max(lstr_resource.ResourceHeight, ScaleDPI(DefaultFullDayHeight))
	
	IF al_y < ll_totalheight THEN
		IF lstr_resource.ResourceGroup AND NOT ab_includeresourcegroup THEN RETURN -1
		RETURN Long(ls_resourceids[li_index])
	END IF
	
NEXT

RETURN -1
end function

public function integer of_hidetime (boolean ab_switch, boolean ab_redraw);HideTime = ab_switch

IF ab_redraw THEN
	SetRedraw(TRUE)
END IF

RETURN 1
end function

public function integer of_changeeventcollection (scheduleevent a_event, ref str_schedulemappedevents a_fromeventcollection[], ref str_schedulemappedevents a_toeventcollection[]);str_schedulemappedevents newFrom[]
str_schedulemappedevents removedEvent
Long ll_index, ll_count

ll_count = UpperBound(a_fromeventcollection)

FOR ll_index = 1 to ll_count
	IF a_fromeventcollection[ll_index].eventobject.eventid <> a_event.eventid THEN
		newFrom[UpperBound(newFrom) + 1] = a_fromeventcollection[ll_index]
	ELSE
		removedEvent = a_fromeventcollection[ll_index]
	END IF
NEXT

a_toeventcollection[UpperBound(a_toeventcollection) + 1] = removedEvent

a_fromeventcollection = newFrom

RETURN 1
end function

public function integer of_allowmovingbetweenresources (boolean ab_value);AllowResourceMoving = ab_value
RETURN 1
end function

on u_cst_powerschedule_scheduleview.create
int iCurrent
call super::create
this.uo_vscroll=create uo_vscroll
this.uo_hscroll=create uo_hscroll
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_vscroll
this.Control[iCurrent+2]=this.uo_hscroll
end on

on u_cst_powerschedule_scheduleview.destroy
call super::destroy
destroy(this.uo_vscroll)
destroy(this.uo_hscroll)
end on

event onpaint;call super::onpaint;LongPtr lul_Graphic

//Create Fonts
iul_textfont = of_CreateFont(hdc, FontName, TextSize, FALSE)
iul_daytextfont = of_CreateFont(hdc, FontName, DayTextFontSize, FALSE)
iul_daynumberfont = of_CreateFont(hdc, FontName, DayNumberFontSize, FALSE)
iul_textfontbold = of_CreateFont(hdc, FontName, TextSize, TRUE)
iul_daytextfontbold = of_CreateFont(hdc, FontName, DayTextFontSize, TRUE)
iul_daynumberfontbold = of_CreateFont(hdc, FontName, DayNumberFontSize, TRUE)
iul_timefont = of_CreateFont(hdc, FontName, TimeSize, FALSE)
iul_smallfont = of_CreateFont(hdc, FontName, 7, FALSE)

//Setup
inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

//Draw Components
of_DrawBackground(hdc)
of_DrawGrid(lul_Graphic, hdc)

IF ib_printing THEN
	//Draw footer
	of_DrawText(hdc, iul_textfont, is_printtitle, ALIGN_LEFT, DT_VTOP, &
	      0,0, &
		 UnitsToPixels(of_WorkSpaceWidth(), XUnitsToPixels!), ScaleDPI(20), &
		 0)
END IF

//Cleanup
inv_win32.DeleteObject(iul_textfont)
inv_win32.DeleteObject(iul_daytextfont)
inv_win32.DeleteObject(iul_daynumberfont)
inv_win32.DeleteObject(iul_textfontbold)
inv_win32.DeleteObject(iul_daytextfontbold)
inv_win32.DeleteObject(iul_daynumberfontbold)
inv_win32.DeleteObject(iul_timefont)
inv_win32.DeleteObject(iul_smallfont)

inv_win32.GdipDeleteGraphics(lul_Graphic)

RETURN 1
end event

event constructor;call super::constructor;istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)	

inv_titleedittimer = CREATE n_cst_powerschedule_titleedittimer 
inv_titleedittimer.iuo_scheduleview = THIS

ResourceColumnWidth = ScaleDPI(200)
TimeRowHeight = ScaleDPI(48)
TimeColumnWidth = ScaleDPI(200)
OriginalTimeRowHeight = ScaleDPI(48)
FullDayHeight = ScaleDPI(24)
HeaderHeight = ScaleDPI(84)
ii_resizebordersize = ScaleDPI(6)
ii_eventleftmargin = ScaleDPI(10)

of_SetCurrentDate(Today())

IF Len(Trim(Theme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(Theme)
END IF

end event

event wm_mousewheel;call super::wm_mousewheel;IF NOT uo_vscroll.Visible THEN RETURN

Int il_delta
Long ll_height

ll_height = UnitsToPixels(Height, YUnitsToPixels!)
il_delta = (wParam / 65536)

IF il_delta < 0 THEN
	il_yscroll -= ScaleDPI(DefaultFullDayHeight) * 2
ELSE
	il_yscroll += ScaleDPI(DefaultFullDayHeight) * 2
END IF

IF il_yscroll >= 0 THEN
	il_yscroll = 0
END IF

IF il_yscroll < (ll_height  - HeaderHeight) - il_totalheight THEN
	il_yscroll = (ll_height  - HeaderHeight) - il_totalheight
END IF

uo_vscroll.Position = (Abs(il_yscroll) / il_totalheight) * uo_vscroll.MaxPosition

IF uo_vscroll.SliderWidth + uo_vscroll.Position > uo_vscroll.MaxPosition THEN
	uo_vscroll.Position = uo_vscroll.MaxPosition - uo_vscroll.SliderWidth
END IF

SetRedraw(TRUE)
uo_vscroll.SetRedraw(TRUE)

TRIGGER EVENT ue_Scroll()
end event

event destructor;call super::destructor;of_DestroyEvents(-1)
DESTROY inv_titleedittimer
inv_win32.GdiplusShutdown(iul_GdiToken)
end event

event wm_keyup;call super::wm_keyup;IF IsReadOnly THEN RETURN

str_schedulemappedevents lstr_empty

IF wparam = 46 THEN //DELETE
	IF IsValid(istr_selectedevent) THEN
		IF NOT istr_selectedevent.eventobject.IsReadonly  THEN
			of_DeleteEvent(istr_selectedevent)
			istr_selectedevent = lstr_empty
		END IF
	END IF
END IF

IF wparam = 27 THEN //Escape
	ib_cancelmonthlbuttonup = TRUE
	
	IF IsValid(istr_selectedevent) THEN
		istr_selectedevent = lstr_empty
		SetRedraw(TRUE)
	END IF
	
	IF IsValid(istr_movingevent) AND ib_eventmoving THEN
		istr_movingevent.ismoving = FALSE
		istr_movingevent.eventobject.StartDateTime = i_movingevent.StartDatetime
		istr_movingevent.eventobject.EndDateTime = i_movingevent.EndDatetime
		
		IF AllowResourceMoving THEN
			
			IF i_movingevent.ResourceId <> il_resourceid AND istr_movingevent.eventobject.ResourceId = il_resourceid THEN
				//The original resource id is the main resource and the event is for an additional resource
				//Move this event back to the other loaded event collection
				of_ChangeEventCollection(istr_movingevent.eventobject, s_loadedevents, s_otherloadedevents)
			ELSE
				IF i_movingevent.ResourceId = il_resourceid AND istr_movingevent.eventobject.ResourceId <> il_resourceid THEN
					//The original resource id is not the main resource and the event is for the main resource
					//Move this event back to the main resource event collection
					of_ChangeEventCollection(istr_movingevent.eventobject, s_otherloadedevents, s_loadedevents)
				END IF
			END IF
			
			istr_movingevent.eventobject.ResourceId = i_movingevent.ResourceId
		END IF
		
		ib_eventmoving = FALSE
		istr_movingevent = lstr_empty
		of_UpdateEventCords()
		SetRedraw(TRUE)
	END IF
	
	IF IsValid(istr_movingevent) AND ib_eventresizing THEN
		istr_movingevent.eventobject.StartDateTime = i_movingevent.StartDatetime
		istr_movingevent.eventobject.EndDateTime = i_movingevent.EndDatetime
		ib_eventresizing = FALSE
		istr_movingevent = lstr_empty
		of_UpdateEventCords()
		SetRedraw(TRUE)
	END IF
	
END IF
end event

event mouseleave;call super::mouseleave;IF IsValid(istr_mouseoverevent) THEN
	str_schedulemappedevents lstr_empty
	istr_mouseoverevent = lstr_empty
	SetRedraw(TRUE)
END IF
end event

event rbuttondown;call super::rbuttondown;IF IsReadOnly THEN RETURN

SetFocus(THIS)

istr_selectedevent = of_GetEventForPos(xpos, ypos)

IF IsValid(istr_selectedevent) THEN
	IF IsValid(istr_selectedcell) THEN DESTROY istr_selectedcell
END IF

SetRedraw(TRUE)
end event

type uo_vscroll from u_cst_powerschedulescroll within u_cst_powerschedule_scheduleview
boolean visible = false
integer x = 3474
integer y = 4
integer width = 82
integer height = 2100
integer taborder = 30
long backcolor = 16777215
string linecolor = "WHITE"
string trackedlinecolor = "WHITE"
string slidershape = "SQUARE"
end type

event moved;call super::moved;Int il_delta
Long ll_height

ll_height = UnitsToPixels(PARENT.Height, YUnitsToPixels!)

IF MaxPosition > 0 THEN
	il_yscroll = (Double(il_totalheight) * (Double(Position) / Double(MaxPosition))) * -1
END IF

IF il_yscroll > 0 THEN
	il_yscroll = 0
END IF

IF il_yscroll < (ll_height  - HeaderHeight) - il_totalheight THEN
	il_yscroll = (ll_height  - HeaderHeight) - il_totalheight
END IF

PARENT.SetRedraw(TRUE)

PARENT.TRIGGER EVENT ue_Scroll()
end event

on uo_vscroll.destroy
call u_cst_powerschedulescroll::destroy
end on

type uo_hscroll from u_cst_powerschedulescroll within u_cst_powerschedule_scheduleview
boolean visible = false
integer x = 9
integer y = 2124
integer width = 3410
integer height = 56
integer taborder = 20
long backcolor = 16777215
string linecolor = "WHITE"
string trackedlinecolor = "WHITE"
string slidershape = "SQUARE"
end type

on uo_hscroll.destroy
call u_cst_powerschedulescroll::destroy
end on

event moved;call super::moved;Int il_delta
Long ll_width
Long ll_totalhours

IF OnlyShowWorkingHours THEN
	ll_totalhours = of_GetTotalWorkingHours()
ELSE
	ll_totalhours = of_GetTotalHours()
END IF

ll_width = UnitsToPixels(PARENT.Width, XUnitsToPixels!)

IF MaxPosition > 0 THEN
	il_xscroll = (Double(TimeColumnWidth * Double(ll_totalhours + 1)) * (Double(Position) / Double(MaxPosition))) * -1
END IF

IF il_xscroll > 0 THEN
	il_xscroll = 0
END IF

IF il_xscroll < (ll_width  - ResourceColumnWidth) - ((TimeColumnWidth * ll_totalhours)) THEN
	il_xscroll = (ll_width  - ResourceColumnWidth) - ((TimeColumnWidth * ll_totalhours))
END IF

PARENT.SetRedraw(TRUE)

PARENT.TRIGGER EVENT ue_Scroll()
end event

