$PBExportHeader$u_cst_powerschedule_core.sru
forward
global type u_cst_powerschedule_core from u_cst_canvas
end type
type uo_scroll from u_cst_powerschedulescroll within u_cst_powerschedule_core
end type
type paintstruct from structure within u_cst_powerschedule_core
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

global type u_cst_powerschedule_core from u_cst_canvas
integer width = 3566
integer height = 2184
event resize pbm_size
event mousemove pbm_mousemove
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event type integer eventchanging ( integer flag,  scheduleevent a_event_original,  ref scheduleevent a_event_new )
event eventchanged ( scheduleevent a_event )
event type long eventadded ( ref scheduleevent a_event )
event lbuttondblclk pbm_lbuttondblclk
event eventdeleted ( scheduleevent a_event )
event type long lbuttondblclkmonth ( unsignedlong flags,  integer xpos,  integer ypos )
event type long lbuttondownmonth ( unsignedlong flags,  integer xpos,  integer ypos )
event type long lbuttonupmonth ( unsignedlong flags,  integer xpos,  integer ypos )
event type long mousemovemonth ( unsignedlong flags,  integer xpos,  integer ypos )
event daterangechanged ( date startdate,  date enddate )
event type integer eventdeleting ( scheduleevent a_event )
event rightclick ( unsignedlong flags,  integer xpos,  integer ypos,  scheduleevent a_event )
event rbuttonup pbm_rbuttonup
event type long rbuttondownmonth ( unsignedlong flags,  integer xpos,  integer ypos )
event rightclickselection ( unsignedlong flags,  integer xpos,  integer ypos,  datetime selectedstarttime,  datetime selectedendtime,  boolean alldayevent )
event eventselected ( scheduleevent a_event )
event cellrangeselected ( datetime startdatetime,  datetime enddatetime,  boolean alldayevent )
event doubleclick ( unsignedlong flags,  integer xpos,  integer ypos,  scheduleevent a_event )
event ue_scroll ( )
event type long rbuttonupmonth ( unsignedlong flags,  integer xpos,  integer ypos )
uo_scroll uo_scroll
end type
global u_cst_powerschedule_core u_cst_powerschedule_core

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
Boolean HideTime = FALSE

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
str_scheduledaysevents s_mappedevents[]

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

CONSTANT INT DefaultHeaderHeight = 84
CONSTANT INT DefaultTimeWidth = 60
INT TimeWidth = 60
CONSTANT INT DefaultFullDayHeight = 24
CONSTANT INT MonthEventHeight = 22
CONSTANT INT MonthDayNameHeight = 20

Int TimeRowHeight = 48
Int OriginalTimeRowHeight = 48

Long FullDayHeight = 24
Long HeaderHeight = 84

Long il_yscroll = 0
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
Int il_printwidth, il_printheight
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
public function integer of_setdefaultview (integer ai_view)
public function integer of_loadevents (scheduleevent a_events[])
public function integer of_scrolltohour (integer ai_hour)
private function integer of_eventindexof (str_schedulemappedevents a_events[], str_schedulemappedevents a_event)
private function integer of_gethourrangerectangle (datetime a_start, datetime a_end, ref s_rect a_rect)
private function integer of_destroyevents ()
private function integer of_calculateeventconflicts (ref str_schedulemappedevents a_daysevents[], integer a_minutes, ref str_schedulelayout applayouts[])
public function integer of_getloadedevents (ref scheduleevent a_events[])
private function time of_findclosesttime (long al_y)
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
private function integer of_drawmonthgrid (longptr aul_graphics, longptr aul_hdc)
public function integer of_drawmonthmorelink (longptr hdc, string a_text, long a_x, long a_y, long a_width, long a_height)
public function longptr of_createfont (longptr hdc, string as_fontname, integer ai_fontsize, boolean ab_bold)
public function integer of_drawmonthmovingevent (longptr hdc)
public function integer of_createnewevent (datetime ad_startdate)
public function integer of_workspacewidth ()
public function integer of_workspaceheight ()
public function integer of_print ()
private function integer of_drawevents (longptr hdc, longptr iul_graphics)
private function integer of_drawdaysevents (longptr hdc, longptr aul_graphics, str_schedulemappedevents mappedevents[], integer al_daywidth, integer al_dayx)
private function integer of_drawdayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean a_selected)
private function integer of_drawdayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height)
private function integer of_drawmovingevent (longptr hdc, longptr aul_graphics)
private function integer of_drawnewevent (longptr hdc, longptr aul_graphics)
private function integer of_drawfulldayevents (longptr hdc, longptr aul_graphics, integer al_daywidth)
public function integer of_drawfulldayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean ab_startsbeforeweek, boolean ab_endsafterweek)
public function integer of_drawfulldayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean ab_startsbeforeweek, boolean ab_endsafterweek, boolean ab_selected)
public function boolean of_eventisselected (str_schedulemappedevents a_event)
public function integer of_deleteevent (str_schedulemappedevents astr_event)
public function integer of_drawmonthnewevent (longptr hdc, longptr aul_graphics)
public function integer of_drawselectshadow (longptr aul_graphics, long a_x, long a_y, long a_width, long a_height)
public function integer of_drawmonthfulldayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean ab_selected)
public function integer of_drawmonthdayevent (longptr aul_graphics, longptr hdc, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean ab_selected, boolean ab_highlighted)
public function boolean of_eventismouseover (str_schedulemappedevents a_event)
public function integer of_changecursor (long al_x, long al_y)
public function integer of_draweventstatus (longptr hdc, scheduleevent a_event, unsignedlong a_eventcolor, long a_x, long a_y, long a_width, long a_height)
public function integer of_changecursormonth (long al_x, long al_y)
public function boolean of_cursorovermonthresizehandle (long al_x, long al_y, ref boolean ab_left)
public function scheduleevent of_getevent (long eventid)
public function scheduleevent of_getselectedevent ()
public function integer of_updateselection (long al_x, long al_y)
private function integer of_drawselection (longptr hdc, longptr aul_graphics)
private function integer of_drawselectionfullday (longptr hdc, longptr aul_graphics)
public function integer of_createnewevent (datetime ad_startdate, datetime ad_enddate, boolean ab_alldayevent, integer ai_eventtype)
public function integer of_clearselection ()
public function integer of_addevent (scheduleevent a_event)
public function integer of_deleteevent (long eventid)
public function integer of_updateevent (scheduleevent a_event)
public function integer of_editevent (str_schedulemappedevents lstr_event, integer flag)
public function integer of_getselection (ref datetime startdatetime, ref datetime enddatetime, ref boolean alldayevent)
public function integer of_settimerowheight (integer ai_value)
public function integer of_setminappointmentincrement (integer ai_value)
public function integer of_seticonimages (string as_privateimage, string as_recurringimage, string as_meetingimage)
private function string of_geteventtitle (scheduleevent a_event)
public function integer of_finishtitleedit ()
public function integer of_showtitleeditor ()
public function integer of_updateselectionmonth (long al_x, long al_y)
private function integer of_drawselectionmonth (longptr hdc, longptr aul_graphics)
public function integer of_getdaterange (ref date ad_start, ref date ad_end)
public function integer of_hidetime (boolean ab_switch, boolean ab_redraw)
end prototypes

event resize;uo_scroll.Move(NewWidth - uo_scroll.Width - 8, PixelsToUnits(HeaderHeight, YPixelsToUnits!))
uo_scroll.Resize(uo_scroll.Width, NewHeight - PixelsToUnits(HeaderHeight, YPixelsToUnits!))

IF (TimeRowHeight * 24) > (UnitsToPixels(NewHeight, YUnitsToPixels!) - HeaderHeight) THEN
	uo_scroll.of_SetSliderSize( ((UnitsToPixels(NewHeight, YUnitsToPixels!) - HeaderHeight) / (TimeRowHeight * 24)) * (UnitsToPixels(NewHeight, YUnitsToPixels!) - HeaderHeight), ScaleDPI(10))
	uo_scroll.of_SetMaxPosition(UnitsToPixels(NewHeight, YUnitsToPixels!) - HeaderHeight)
	
	IF DefaultView <> MONTH THEN
		uo_scroll.Show()
	END IF
ELSE
	il_yscroll = 0
	uo_scroll.Hide()
END IF

IF SizeType <> 99 THEN
	IF uo_scroll.Visible THEN
		uo_scroll.Position = (Abs(il_yscroll) / ((TimeRowHeight * 24))) * uo_scroll.MaxPosition
		uo_scroll.Trigger Event Moved(uo_scroll.Position)
	END IF
END IF
end event

event mousemove;IF IsReadOnly THEN RETURN
IF DefaultView = MONTH THEN RETURN EVENT MouseMoveMonth(flags, xpos, ypos)

Long ll_height, ll_delta, ll_width, ll_scrollwidth
Boolean lb_alldayevent
s_rect l_eventrect
Long li_eventslotheight, li_y, li_x, ll_daywidth
Time lt_newtime
DateTime ldt_newstart, ldt_newend, lt_newdatetime
Long ll_durationseconds, ll_newday
Long ll_x, ll_y
str_schedulemappedevents lstr_selectedevent

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

of_ChangeCursor(ll_x, ll_y)

IF KeyDown(KeyLeftButton!) AND (IsValid(istr_movingevent) OR IsValid(istr_newevent) OR ib_isselecting)THEN
	
	IF il_clickxpos > 0 AND il_clickypos > 0 THEN
		IF Abs(il_clickxpos - xpos) < ScaleDPI(35) AND Abs(il_clickypos - ypos) < ScaleDPI(35) THEN
			RETURN
		ELSE
			il_clickxpos = 0
			il_clickypos = 0
		END IF
	END IF 
	
	istr_selectedevent = lstr_selectedevent
	
	IF IsValid(istr_movingevent) THEN
		IF istr_movingevent.eventobject.IsReadOnly THEN RETURN 0
		
		IF NOT ib_eventresizingclicked THEN
			ib_eventmoving = TRUE
			istr_movingevent.ismoving = TRUE
		ELSE
			ib_eventresizing = TRUE
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
	
	IF uo_scroll.Visible THEN
		ll_scrollwidth = uo_scroll.Width + 16
	END IF
	
	ll_width = UnitsToPixels(Width - ll_scrollwidth, XUnitsToPixels!)
	
	ll_delta = il_lastypos
	
	il_lastxpos = UnitsToPixels(xpos, XUnitsToPixels!)
	il_lastypos = UnitsToPixels(ypos, YUnitsToPixels!)
	
	IF il_lastxpos > ll_width - ScaleDPI(10) THEN
		il_lastxpos = ll_width - ScaleDPI(10)
	END IF
	IF il_lastypos < 0 THEN
		il_lastypos = 0
	END IF
	IF il_lastxpos < TimeWidth THEN
		il_lastxpos = TimeWidth
	END IF
	
	IF ll_delta > 0 THEN
		ll_delta = il_lastypos - ll_delta
	END IF
	
	//HANDLE SCROLL
	IF NOT lb_alldayevent THEN
		IF il_lastypos < HeaderHeight AND ll_delta < 0 THEN
			//scroll up
			il_yscroll -= (ll_delta * 6)
			
			IF il_yscroll >= 0 THEN
				il_yscroll = 0
			END IF
						
			uo_scroll.Position = (Abs(il_yscroll) / ((TimeRowHeight * 24))) * uo_scroll.MaxPosition
			uo_scroll.SetRedraw(TRUE)
		ELSE
			IF il_lastypos > ll_height AND ll_delta > 0 THEN
				//scroll down
				il_yscroll -= (ll_delta * 6)
				
				IF il_yscroll < (ll_height  - HeaderHeight) - ((TimeRowHeight * 24)) THEN
					il_yscroll = (ll_height  - HeaderHeight) - ((TimeRowHeight * 24))
				END IF
				
				uo_scroll.Position = (Abs(il_yscroll) / ((TimeRowHeight * 24))) * uo_scroll.MaxPosition
				uo_scroll.SetRedraw(TRUE)
			END IF
		END IF
	END IF
	
	IF KeyDown(KeyLeftButton!) AND ib_isselecting AND NOT CreateNewEventOnMouseDrag THEN
		of_UpdateSelection(il_lastxpos, il_lastypos)
		RETURN
	END IF
	
	//RESIZE EVENT CODE
	IF IsValid(istr_movingevent) AND ib_eventresizing THEN
		IF NOT istr_movingevent.eventobject.IsReadonly THEN
			DateTime ldt_newtime
			
			IF lb_alldayevent THEN
				
				IF ib_eventresizestart THEN
					ldt_newstart = of_FindClosestDateTime(il_lastxpos, il_lastypos)
					
					IF istr_movingevent.DisplayAsAllDayEvent THEN
						ldt_newstart = DateTime(Date(ldt_newstart), Time(i_movingevent.StartDateTime)) //Keep original time
					END IF
					
					ldt_newend = istr_movingevent.eventobject.EndDateTime
					IF Date(ldt_newstart) > Date(ldt_newend) THEN
						ldt_newstart = ldt_newend
					END IF
				ELSE
					ldt_newend = of_FindClosestDateTime(il_lastxpos, il_lastypos)
					
					IF istr_movingevent.DisplayAsAllDayEvent THEN
						ldt_newend = DateTime(Date(ldt_newend), Time(i_movingevent.EndDateTime)) //Keep original time
					END IF
					
					ldt_newstart = istr_movingevent.eventobject.StartDateTime
					IF Date(ldt_newend) < Date(ldt_newstart) THEN
						ldt_newend = ldt_newstart
					END IF
				END IF
				
				istr_movingevent.eventobject.StartDateTime = ldt_newstart
				istr_movingevent.eventobject.EndDateTime = ldt_newend
				
			ELSE
				ldt_newtime = of_FindClosestDateTime(l_eventrect.Left + ScaleDPI(10), il_lastypos)
				
				IF ib_eventresizestart THEN
					IF SecondsAfter(Time(ldt_newtime), Time(istr_movingevent.eventobject.EndDateTime)) >= MinAppointmentIncrement * 60 THEN
						istr_movingevent.eventobject.StartDateTime = ldt_newtime
					END IF
				ELSE
					IF SecondsAfter(Time(istr_movingevent.eventobject.StartDateTime), Time(ldt_newtime)) >= MinAppointmentIncrement * 60 THEN
						istr_movingevent.eventobject.EndDateTime = ldt_newtime
					END IF
				END IF
			END IF
		END IF
	END IF
	
	//MOVING EVENT MOVE
	IF IsValid(istr_movingevent) AND NOT lb_alldayevent AND ib_eventmoving THEN
		IF NOT istr_movingevent.eventobject.IsReadonly THEN
			li_eventslotheight = TimeRowHeight / (60 / MinAppointmentIncrement)
			li_y = il_lastypos - il_clickyoffset
			ll_daywidth = of_GetDayWidth()
			li_x = (Integer((il_lastxpos - TimeWidth) / ll_daywidth) * ll_daywidth) + TimeWidth
			
			ll_durationseconds = inv_helper.of_SecondsAfter(istr_movingevent.eventobject.StartDateTime, istr_movingevent.eventobject.EndDateTime)
			ll_newday = Integer((li_x - TimeWidth) / ll_daywidth)
			lt_newtime = of_FindClosestTime(li_y)
			
			ldt_newstart = DateTime(RelativeDate(id_StartDate, ll_newday), lt_newtime)
			
			IF ldt_newstart > DateTime(RelativeDate(id_StartDate, ll_newday), Time(23, 60 - MinAppointmentIncrement, 0)) THEN
				ldt_newstart = DateTime(RelativeDate(id_StartDate, ll_newday), Time(23, 60 - MinAppointmentIncrement, 0))
			END IF
			
			ldt_newend = inv_helper.of_RelativeDatetime(ldt_newstart, ll_durationseconds)
			
			istr_movingevent.eventobject.StartDateTime = ldt_newstart
			istr_movingevent.eventobject.EndDateTime = ldt_newend
		END IF
	END IF 
	
	
	//NEW EVENT MOVE
	IF IsValid(istr_newevent) THEN
		IF lb_alldayevent THEN
						
			ldt_newend = of_FindClosestDateTime(il_lastxpos, il_lastypos)
			
			ldt_newstart = istr_newevent.eventobject.StartDateTime
			
			IF Date(istr_newevent.eventobject.StartDateTime) < Date(ldt_newend) THEN
				ldt_newend = DateTime(Date(ldt_newend))
			ELSEIF Date(istr_newevent.eventobject.StartDateTime) > Date(ldt_newend) THEN
				ldt_newstart = DateTime(Date(ldt_newend))
				ldt_newend = istr_newevent.eventobject.StartDateTime
			ELSEIF Date(istr_newevent.eventobject.StartDateTime) = Date(ldt_newend) THEN
				ldt_newend = istr_newevent.eventobject.StartDateTime
			END IF
			
		ELSE				
			li_eventslotheight = TimeRowHeight / (60 / MinAppointmentIncrement)
			li_y = Long((il_lastypos + il_clickyoffset) / li_eventslotheight) * li_eventslotheight
		
			lt_newdatetime = of_FindClosestDateTime(il_lastxpos, li_y)
		
			IF Time(istr_newevent.eventobject.StartDateTime) < Time(lt_newdatetime) THEN
				ldt_newstart = DateTime(Date(lt_newdatetime), Time(istr_newevent.eventobject.StartDateTime ))
				ldt_newend = DateTime(Date(ldt_newstart), Time(lt_newdatetime))
			ELSEIF Time(istr_newevent.eventobject.StartDateTime) > Time(lt_newdatetime) THEN
				ldt_newstart = DateTime(Date(lt_newdatetime), Time(lt_newdatetime))
				ldt_newend = DateTime(Date(lt_newdatetime), Time(istr_newevent.eventobject.EndDateTime ))
			ELSEIF Time(istr_newevent.eventobject.StartDateTime) = Time(lt_newdatetime) THEN
				//Give a minimum event duration of the min appointment increment
				ldt_newstart = DateTime(Date(lt_newdatetime), Time(istr_newevent.eventobject.StartDateTime ))
				ldt_newend = inv_helper.of_RelativeDateTime(ldt_newstart, MinAppointmentIncrement * 60)
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
IF DefaultView = MONTH THEN RETURN EVENT LButtonDownMonth(flags, xpos, ypos)

Long ll_index, ll_count
Long ll_x, ll_y, li_eventslotheight
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

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

of_ChangeCursor(ll_x, ll_y)

il_clickxpos = xpos
il_clickypos = ypos

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	
	IF ll_x > s_loadedevents[ll_index].rectregion.Left AND ll_y >  s_loadedevents[ll_index].rectregion.Top AND &
	    ll_x <  s_loadedevents[ll_index].rectregion.Right AND ll_y <  s_loadedevents[ll_index].rectregion.Bottom THEN
		 
		 IF ll_y < HeaderHeight AND NOT s_loadedevents[ll_index].DisplayAsAllDayEvent THEN CONTINUE

		 istr_movingevent =  s_loadedevents[ll_index]
		 
		 il_clickxoffset = ll_x - s_loadedevents[ll_index].rectregion.Left
		 il_clickyoffset = ll_y - s_loadedevents[ll_index].rectregion.Top
	END IF
NEXT

IF IsValid(istr_movingevent) THEN
	
	IF  istr_movingevent.DisplayAsAllDayEvent THEN
		IF ll_x - istr_movingevent.rectregion.Left <= ii_resizebordersize OR &
			 istr_movingevent.rectregion.Right - ll_x <= ii_resizebordersize THEN
			ib_eventresizingclicked = TRUE
			
			ib_eventresizestart =  (ll_x < istr_movingevent.rectregion.Left + ((istr_movingevent.rectregion.Right - istr_movingevent.rectregion.Left) / 2))
		END IF
	ELSE
		IF ll_y - istr_movingevent.rectregion.Top <= ii_resizebordersize OR &
			 istr_movingevent.rectregion.Bottom - ll_y <= ii_resizebordersize THEN
			ib_eventresizingclicked = TRUE
			
			ib_eventresizestart =  (ll_y < istr_movingevent.rectregion.Top + ((istr_movingevent.rectregion.Bottom - istr_movingevent.rectregion.Top) / 2))
		END IF
	END IF
	
	i_movingevent = istr_movingevent.eventobject
	of_CaptureMouse()
ELSE
	IF ll_x > TimeWidth THEN	
		
		Integer li_min
		
		li_min = MinAppointmentIncrement
		
		//For drag selection, we will artificially set the min minutes to 30
		IF NOT CreateNewEventOnMouseDrag THEN
			MinAppointmentIncrement = Max(MinCellSelectionsIncrement, MinAppointmentIncrement)
		END IF
			
		lstr_newevent = CREATE str_schedulemappedevents
		lstr_newevent.eventwidth = of_GetDayWidth()
		lstr_newevent.eventobject.StartDateTime = of_FindClosestDatetime(ll_x, ll_y)
		
		li_eventslotheight = TimeRowHeight / (60 / MinAppointmentIncrement)
		il_clickyoffset = ll_y - (Long((ll_y) / li_eventslotheight) * li_eventslotheight)
		
		IF ll_y > HeaderHeight THEN
			//day event
			il_lastypos = ll_y
			lstr_newevent.eventobject.AllDayEvent = FALSE
			lstr_newevent.eventobject.EndDateTime = inv_helper.of_RelativeDateTime(lstr_newevent.eventobject.StartDateTime, MinAppointmentIncrement * 60)
			of_CaptureMouse()
		ELSE
			//full day event
			lstr_newevent.eventobject.AllDayEvent = TRUE
			lstr_newevent.eventobject.StartDateTime = DateTime(Date(lstr_newevent.eventobject.StartDateTime))
			lstr_newevent.eventobject.EndDateTime = lstr_newevent.eventobject.StartDateTime
			of_CaptureMouse()
		END IF
		
		MinAppointmentIncrement = li_min
	
		lstr_newevent.eventobject.Color = of_GetColor("peacock")
		lstr_newevent.eventobject.TextColor = RGB(255,255,255)
		
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
END IF


end event

event lbuttonup;IF IsReadOnly THEN RETURN
IF DefaultView = MONTH THEN RETURN EVENT LButtonUpMonth(flags, xpos, ypos)

Long ll_daycount, ll_daywidth, ll_containerwidth
Long ll_scrollwidth, ll_newday
Long ll_xpos, ll_ypos
str_schedulemappedevents lstr_empty
scheduleevent l_events[]
str_scheduleeventedit lstr_edit
DateTime ldt_min

IF ib_isselecting THEN
	POST SetRedraw(TRUE)
	IF IsValid(istr_selectedcell) THEN
		TRIGGER EVENT CellRangeSelected(istr_selectedcell.eventobject.StartDateTime, istr_selectedcell.eventobject.EndDateTime, istr_selectedcell.eventobject.AllDayEvent)
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
	
	IF istr_movingevent.eventobject.EndDateTime <= istr_movingevent.eventobject.StartDateTime THEN
		istr_movingevent.eventobject.EndDateTime = inv_helper.of_RelativeDateTime(istr_movingevent.eventobject.StartDateTime, Max(MinAppointmentIncrement, 30) * 60) //Add 30 minutes
	END IF
	
	IF Event EventChanging(EVENT_RESIZED, i_movingevent, istr_movingevent.eventobject) > 0 THEN
		Event EventChanged(istr_movingevent.eventobject)
	ELSE
		istr_movingevent.eventobject.StartDateTime = i_movingevent.StartDatetime
		istr_movingevent.eventobject.EndDateTime = i_movingevent.EndDatetime
	END IF
	
	of_GetLoadedEvents(l_events)
	of_LoadEvents(l_events)
	
END IF

IF IsValid(istr_movingevent) AND ib_eventmoving THEN
	istr_movingevent.ismoving = FALSE

	//Get new start and end date time
	DateTime ldt_newstart, ldt_newend
	Time lt_newtime
	Long ll_durationseconds, ll_durationdays
	
	IF uo_scroll.Visible THEN
		ll_scrollwidth = uo_scroll.Width + 16
	END IF
	
	ll_xpos = il_lastxpos
	ll_ypos = il_lastypos - il_clickyoffset
	ll_containerwidth = UnitsToPixels(Width - ll_scrollwidth, XUnitsToPixels!)
	
	CHOOSE CASE DefaultView
		CASE WEEK
			ll_daycount = 7
		CASE WORKWEEK
			ll_daycount = NumberOfDaysInWorkWeek
		CASE DAY
			ll_daycount = 1
	END CHOOSE
	
	ll_daywidth = of_GetDayWidth()
	
	ll_newday = Integer((ll_xpos - TimeWidth) / ll_daywidth)
	
	IF istr_movingevent.DisplayAsAllDayEvent THEN
		ll_durationdays = DaysAfter(Date(istr_movingevent.eventobject.StartDateTime), Date(istr_movingevent.eventobject.EndDateTime))
		
		ldt_newstart = DateTime(RelativeDate(id_StartDate, ll_newday), Time(istr_movingevent.eventobject.StartDateTime))
		ldt_newend = DateTime(RelativeDate(Date(ldt_newstart), ll_durationdays), Time(istr_movingevent.eventobject.EndDateTime))
	ELSE
		ll_durationseconds = inv_helper.of_SecondsAfter(istr_movingevent.eventobject.StartDateTime, istr_movingevent.eventobject.EndDateTime)
		
		lt_newtime = of_FindClosestTime(ll_ypos)
		
		ldt_newstart = DateTime(RelativeDate(id_StartDate, ll_newday), lt_newtime)
		
		IF ldt_newstart > DateTime(RelativeDate(id_StartDate, ll_newday), Time(23, 60 - MinAppointmentIncrement, 0)) THEN
			ldt_newstart = DateTime(RelativeDate(id_StartDate, ll_newday), Time(23, 60 - MinAppointmentIncrement, 0))
		END IF
		
		ldt_newend = inv_helper.of_RelativeDatetime(ldt_newstart, ll_durationseconds)
	END IF
	
	ScheduleEvent lstr_new
	lstr_new = istr_movingevent.eventobject
	lstr_new.StartDateTime = ldt_newstart
	lstr_new.EndDateTime = ldt_newend
	
	IF Event EventChanging(EVENT_MOVED, i_movingevent, lstr_new) > 0 THEN
		istr_movingevent.eventobject = lstr_new
		Event EventChanged(istr_movingevent.eventobject)
	ELSE
		istr_movingevent.eventobject.StartDateTime = i_movingevent.StartDatetime
		istr_movingevent.eventobject.EndDateTime = i_movingevent.EndDatetime
	END IF
	
	of_GetLoadedEvents(l_events)
	of_LoadEvents(l_events)
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
IF DefaultView = MONTH THEN RETURN EVENT LButtonDblClkMonth(flags, xpos, ypos)

Long ll_index, ll_count
Long ll_x, ll_y
str_schedulemappedevents lstr_event

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

IF ll_y < ScaleDPI(DefaultHeaderHeight) THEN RETURN 0

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	
	IF ll_x > s_loadedevents[ll_index].rectregion.Left AND ll_y >  s_loadedevents[ll_index].rectregion.Top AND &
	    ll_x <  s_loadedevents[ll_index].rectregion.Right AND ll_y <  s_loadedevents[ll_index].rectregion.Bottom THEN
		 
		 IF ll_y < HeaderHeight AND NOT s_loadedevents[ll_index].DisplayAsAllDayEvent THEN CONTINUE

		 lstr_event =  s_loadedevents[ll_index]
	END IF

NEXT

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
	Trigger Event DoubleClick(flags, xpos, ypos, l_event)
END IF




end event

event type long lbuttondblclkmonth(unsignedlong flags, integer xpos, integer ypos);Long ll_index, ll_count, ll_innerindex, ll_innercount
Long ll_x, ll_y
str_schedulemappedevents lstr_event

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	IF ll_x > s_loadedevents[ll_index].rectregion.Left AND ll_y >  s_loadedevents[ll_index].rectregion.Top AND &
	    ll_x <  s_loadedevents[ll_index].rectregion.Right AND ll_y <  s_loadedevents[ll_index].rectregion.Bottom THEN 
	 	lstr_event =  s_loadedevents[ll_index]
	END IF
	
	IF NOT ISValid(lstr_event) THEN
		ll_innercount = UpperBound(s_loadedevents[ll_index].rectregions)
		
		FOR ll_innerindex = 1 TO ll_innercount
			IF ll_x > s_loadedevents[ll_index].rectregions[ll_innerindex].Left AND ll_y >  s_loadedevents[ll_index].rectregions[ll_innerindex].Top AND &
				 ll_x <  s_loadedevents[ll_index].rectregions[ll_innerindex].Right AND ll_y <  s_loadedevents[ll_index].rectregions[ll_innerindex].Bottom THEN 
				lstr_event =  s_loadedevents[ll_index]
			END IF
		NEXT
	END IF
	
NEXT

IF IsValid(lstr_event) THEN
	
	
	IF UseCustomUI THEN
		Post Event DoubleClick(flags, xpos, ypos, lstr_event.eventobject)
	ELSE
		Trigger Event DoubleClick(flags, xpos, ypos, lstr_event.eventobject)
		of_EditEvent(lstr_event, EVENT_DOUBLE_CLICKED)
	END IF
END IF

RETURN 1


end event

event type long lbuttondownmonth(unsignedlong flags, integer xpos, integer ypos);Long ll_index, ll_count, ll_innerindex, ll_innercount, ll_rowheight, ll_colwidth
Long ll_x, ll_y, li_eventslotheight
str_schedulemappedevents lstr_movingevent
str_schedulemappedevents lstr_newevent
str_scheduledimensions lstr_grid
scheduleevent l_newevent
Boolean lb_start

istr_movingevent = lstr_movingevent
istr_newevent = lstr_newevent
i_newevent = l_newevent

IF IsValid(istr_selectedcell) THEN DESTROY istr_selectedcell

SetFocus(THIS)

ib_cancelmonthlbuttonup = FALSE
ib_eventresizingclicked = FALSE

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

of_ChangeCursorMonth(ll_x, ll_y)

IF ll_y <= ScaleDPI(MonthDayNameHeight) THEN RETURN 0

il_clickxpos = xpos
il_clickypos = ypos

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	IF ll_x > s_loadedevents[ll_index].rectregion.Left AND ll_y >  s_loadedevents[ll_index].rectregion.Top AND &
		 ll_x <  s_loadedevents[ll_index].rectregion.Right AND ll_y <  s_loadedevents[ll_index].rectregion.Bottom THEN 

		 istr_movingevent =  s_loadedevents[ll_index]
		 il_clickxoffset = ll_x - s_loadedevents[ll_index].rectregion.Left
		 il_clickyoffset = ll_y - s_loadedevents[ll_index].rectregion.Top
	END IF
	
	IF NOT IsValid(istr_movingevent) THEN
		ll_innercount = UpperBound(s_loadedevents[ll_index].rectregions)
		
		FOR ll_innerindex = 1 TO ll_innercount
			IF ll_x > s_loadedevents[ll_index].rectregions[ll_innerindex].Left AND ll_y >  s_loadedevents[ll_index].rectregions[ll_innerindex].Top AND &
				 ll_x <  s_loadedevents[ll_index].rectregions[ll_innerindex].Right AND ll_y <  s_loadedevents[ll_index].rectregions[ll_innerindex].Bottom THEN 

				 istr_movingevent =  s_loadedevents[ll_index]
				 il_clickxoffset = ll_x - s_loadedevents[ll_index].rectregion.Left
				 il_clickyoffset = ll_y - s_loadedevents[ll_index].rectregion.Top
			END IF
		NEXT
	END IF
NEXT

IF IsValid(istr_movingevent) THEN
	
	IF  istr_movingevent.DisplayAsAllDayEvent THEN
		IF of_CursorOverMonthResizeHandle(ll_x, ll_y, lb_start) THEN
			ib_eventresizingclicked = TRUE
			
			ib_eventresizestart =  lb_start
		END IF
	END IF
		
	
	i_movingevent = istr_movingevent.eventobject
	lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)

	ll_rowheight = lstr_grid.RowHeight
	ll_colwidth = lstr_grid.ColumnWidth
			
	ip_monthmovingstart = inv_helper.of_GetDayCellFromCords(ll_x, ll_y, ll_colwidth, ll_rowheight)
	
	of_CaptureMouse()

END IF
end event

event type long lbuttonupmonth(unsignedlong flags, integer xpos, integer ypos);Long ll_index, ll_count, ll_innerindex, ll_innercount
Long ll_x, ll_y, ll_gridrows, ll_width, ll_height, ll_colwidth, ll_rowheight
Int li_daynumber, li_eventx, li_eventy
Date ld_firstday, ld_lastday
DateTime ldt_newstart, ldt_newend
str_scheduleeventmore lstr_event
str_scheduledimensions lstr_grid
str_schedulemappedevents lstr_empty
Boolean lb_morefound, lb_eventfound
Integer li_flag
Point lp_cell
scheduleevent l_events[]
CONSTANT Int daysInWeek = 7
Int HeaderAdjust
Int DayNumberHeight

HeaderAdjust = ScaleDPI(10)
DayNumberHeight = ScaleDPI(28)

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

IF ib_isselecting THEN
	POST SetRedraw(TRUE)
	IF IsValid(istr_selectedcell) THEN
		TRIGGER EVENT CellRangeSelected(istr_selectedcell.eventobject.StartDateTime, istr_selectedcell.eventobject.EndDateTime, istr_selectedcell.eventobject.AllDayEvent)
	END IF
	
	of_ReleaseMouse()
	ib_eventmoving = FALSE
	ib_isselecting = FALSE
	
	RETURN 2
END IF

//Select event
IF IsValid(istr_movingevent) AND NOT ib_eventmoving THEN
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

IF IsValid(istr_movingevent) AND (ib_eventmoving OR ib_eventresizing) THEN
	IF ib_eventmoving THEN
		li_flag = EVENT_MOVED
		ldt_newstart = DateTime(RelativeDate(Date(istr_movingevent.eventobject.StartDateTime), ii_movingrelativedays), Time(istr_movingevent.eventobject.StartDateTime))
		ldt_newend = DateTime(RelativeDate(Date(istr_movingevent.eventobject.EndDateTime), ii_movingrelativedays), Time(istr_movingevent.eventobject.EndDateTime))
	END IF
	
	IF ib_eventresizing THEN	
		li_flag = EVENT_RESIZED
		IF ib_eventresizestart THEN
			ldt_newstart = DateTime(RelativeDate(Date(istr_movingevent.eventobject.EndDateTime), ii_movingrelativedays), Time(istr_movingevent.eventobject.StartDateTime))
			ldt_newend = istr_movingevent.eventobject.EndDateTime
		ELSE
			ldt_newstart = istr_movingevent.eventobject.StartDateTime
			ldt_newend = DateTime(RelativeDate(Date(istr_movingevent.eventobject.StartDateTime), ii_movingrelativedays), Time(istr_movingevent.eventobject.EndDateTime))
		END IF
		
		IF ldt_newend <= ldt_newstart THEN
			ldt_newend = inv_helper.of_RelativeDateTime(ldt_newstart, Max(MinAppointmentIncrement, 30) * 60) //Add 30 minutes
		END IF
		
	END IF
	
	ScheduleEvent lstr_new
	lstr_new = istr_movingevent.eventobject
	lstr_new.StartDateTime = ldt_newstart
	lstr_new.EndDateTime = ldt_newend
	
	IF Event EventChanging(li_flag, istr_movingevent.eventobject, lstr_new) > 0 THEN
		istr_movingevent.eventobject = lstr_new
		Event EventChanged(istr_movingevent.eventobject)
	END IF
	
	of_GetLoadedEvents(l_events)
	of_LoadEvents(l_events)
	
	of_ReleaseMouse()
	ib_eventmoving = FALSE
	ib_eventresizing = FALSE
	
	RETURN 1
END IF

//Handle More Link Click
ll_count = UpperBound(istr_morelinks)

FOR ll_index = 1 TO ll_count
	IF ll_x > istr_morelinks[ll_index].rectregion.Left AND ll_y >  istr_morelinks[ll_index].rectregion.Top AND &
	    ll_x <  istr_morelinks[ll_index].rectregion.Right AND ll_y <  istr_morelinks[ll_index].rectregion.Bottom THEN 
	 	lstr_event =  istr_morelinks[ll_index]
		lb_morefound = TRUE
	END IF
NEXT

IF lb_morefound THEN
	str_scheduleeventmorelist lstr_morelist
	
	lstr_morelist.EventDate = lstr_event.EventDate
	lstr_morelist.s_loadedevents = s_loadedevents
	lstr_morelist.theme = Theme
	lstr_morelist.parentschedule = THIS
	
	OpenWithParm(w_pbus_schedulemorelist, lstr_morelist)
ELSE
	
	//Handle new event
	ll_count = UpperBound(s_loadedevents)

	FOR ll_index = 1 TO ll_count
		IF ll_x > s_loadedevents[ll_index].rectregion.Left AND ll_y >  s_loadedevents[ll_index].rectregion.Top AND &
			 ll_x <  s_loadedevents[ll_index].rectregion.Right AND ll_y <  s_loadedevents[ll_index].rectregion.Bottom THEN 
			lb_eventfound = TRUE
		END IF
		
		IF NOT lb_eventfound THEN
			ll_innercount = UpperBound(s_loadedevents[ll_index].rectregions)
			
			FOR ll_innerindex = 1 TO ll_innercount
				IF ll_x > s_loadedevents[ll_index].rectregions[ll_innerindex].Left AND ll_y >  s_loadedevents[ll_index].rectregions[ll_innerindex].Top AND &
					 ll_x <  s_loadedevents[ll_index].rectregions[ll_innerindex].Right AND ll_y <  s_loadedevents[ll_index].rectregions[ll_innerindex].Bottom THEN 
					lb_eventfound = TRUE
				END IF
			NEXT
		END IF
		
	NEXT
	
	IF NOT lb_eventfound AND NOT ib_cancelmonthlbuttonup THEN
		IF ll_y > ScaleDPI(MonthDayNameHeight) AND CreateNewEventOnClick THEN //Y should be in a cell and not on a day name label
			//Calculate the number of rows needed in the current Month
			lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)

			ld_firstday = lstr_grid.StartDate
			ld_lastday = lstr_grid.EndDate
			ll_rowheight = lstr_grid.RowHeight
			ll_colwidth = lstr_grid.ColumnWidth
			ll_gridrows = lstr_grid.GridRows
			
			//Get the width and height of our canvas
			ll_width = UnitsToPixels(Width, XUnitsToPixels!)
			ll_height = UnitsToPixels(Height, YUnitsToPixels!)
	
			lp_cell = inv_helper.of_getdaycellfromcords(ll_x, ll_y - ScaleDPI(MonthDayNameHeight), ll_colwidth, ll_rowheight)
			
			li_eventx = (lp_cell.px - 1) * ll_colwidth
			li_eventy = ((lp_cell.py - 1) * ll_rowheight) + HeaderAdjust + DayNumberHeight + ScaleDPI(MonthDayNameHeight)
			
			istr_newevent = CREATE str_schedulemappedevents
			istr_newevent.eventobject.StartDateTime = DateTime(inv_helper.of_GetDateFromCell(ld_firstday, lp_cell))
			
			//full day event
			istr_newevent.eventobject.AllDayEvent = TRUE
			istr_newevent.eventobject.EndDateTime = istr_newevent.eventobject.StartDateTime
			
			istr_newevent.eventobject.Color = of_GetColor("peacock")
			istr_newevent.eventobject.TextColor = RGB(255,255,255)
			istr_newevent.rectregion = inv_helper.of_NewRect(li_eventx, li_eventy, ll_colwidth, ScaleDPI(MonthEventHeight))

			i_newevent = istr_newevent.eventobject
			
			POST of_NewEvent()
			SetRedraw(TRUE)
		END IF
	END IF
		
END IF

of_ReleaseMouse()
ib_eventmoving = FALSE

RETURN 1


end event

event type long mousemovemonth(unsignedlong flags, integer xpos, integer ypos);Long ll_rowheight, ll_colwidth, ll_index, ll_count
str_scheduledimensions lstr_grid
Date ld_startdate, ld_enddate, ld_movingdate
Long li_y, li_x

li_x = UnitsToPixels(xpos, XUnitsToPixels!)
li_y = UnitsToPixels(ypos, YUnitsToPixels!)

of_ChangeCursorMonth(li_x, li_y)

IF KeyDown(KeyLeftButton!) AND ib_isselecting AND NOT CreateNewEventOnMouseDrag THEN
	of_UpdateSelectionMonth(li_x, li_y)
	RETURN 1
END IF

IF KeyDown(KeyLeftButton!) AND IsValid(istr_movingevent) THEN
	
	IF istr_movingevent.eventobject.IsReadOnly THEN RETURN 0
	
	IF xpos < 0 OR ypos < 0 THEN RETURN 1
	
	IF il_clickxpos > 0 AND il_clickypos > 0 THEN
		IF Abs(il_clickxpos - xpos) < ScaleDPI(35) AND Abs(il_clickypos - ypos) < ScaleDPI(35) THEN
			RETURN 1
		ELSE
			il_clickxpos = 0
			il_clickypos = 0
		END IF
	END IF 
	
	IF ib_eventresizingclicked THEN
		ib_eventresizing = TRUE
	END IF

	ib_eventmoving = TRUE
	istr_movingevent.ismoving = TRUE
	
	lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)

	ll_rowheight = lstr_grid.RowHeight
	ll_colwidth = lstr_grid.ColumnWidth
	
	IF ib_eventresizing THEN
		Point lp_cell
		
		lp_cell  = inv_helper.of_GetDayCellFromCords(li_x, li_y, ll_colwidth, ll_rowheight)
		
		IF ib_eventresizestart THEN
			ld_movingdate = inv_helper.of_GetDateFromCell(lstr_grid.StartDate, lp_cell)
		
			IF ld_movingdate <= Date(istr_movingevent.eventobject.EndDateTime) THEN
				ii_movingrelativedays = DaysAfter(Date(istr_movingevent.eventobject.EndDateTime), ld_movingdate)		
			END IF
			
		ELSE
			ld_movingdate = inv_helper.of_GetDateFromCell(lstr_grid.StartDate, lp_cell)
		
			IF ld_movingdate >= Date(istr_movingevent.eventobject.StartDateTime) THEN
				ii_movingrelativedays = DaysAfter(Date(istr_movingevent.eventobject.StartDateTime), ld_movingdate)		
			END IF
		END IF

		
	ELSE
		ip_monthmovingnew = inv_helper.of_GetDayCellFromCords(li_x, li_y, ll_colwidth, ll_rowheight)
	
		ld_startdate = inv_helper.of_GetDateFromCell(lstr_grid.StartDate, ip_monthmovingstart)
		ld_movingdate = inv_helper.of_GetDateFromCell(lstr_grid.StartDate, ip_monthmovingnew)
	
		ii_movingrelativedays = DaysAfter(ld_startdate, ld_movingdate)			
	END IF
	
	SetRedraw(TRUE)
ELSE
	IF NOT of_ismousecaptured() THEN
		SUPER::of_capturemouse()
	END IF
	
	str_schedulemappedevents lstr_empty
	istr_mouseoverevent = lstr_empty
	
	ll_count = UpperBound(s_loadedevents)

	FOR ll_index = 1 TO ll_count
		
		IF li_x > s_loadedevents[ll_index].rectregion.Left AND li_y >  s_loadedevents[ll_index].rectregion.Top AND &
			 li_x <  s_loadedevents[ll_index].rectregion.Right AND li_y <  s_loadedevents[ll_index].rectregion.Bottom THEN
			 
			istr_mouseoverevent = s_loadedevents[ll_index]

			EXIT
		END IF
	NEXT
	
	
	//Start the cell selection process here.
	IF KeyDown(KeyLeftButton!) AND NOT CreateNewEventOnMouseDrag AND NOT ib_isselecting THEN
		
		IF il_clickxpos > 0 AND il_clickypos > 0 THEN
			IF Abs(il_clickxpos - xpos) < ScaleDPI(35) AND Abs(il_clickypos - ypos) < ScaleDPI(35) THEN
				RETURN 1
			ELSE
				il_clickxpos = 0
				il_clickypos = 0
			END IF
		END IF 
		
		IF IsValid(istr_selectedcell) THEN DESTROY istr_selectedcell
		
		str_schedulemappedevents lstr_newevent
		
		lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)

		lp_cell = inv_helper.of_GetDayCellFromCords(li_x,li_y,lstr_grid.ColumnWidth,lstr_grid.RowHeight)
			
		lstr_newevent = CREATE str_schedulemappedevents
		lstr_newevent.eventwidth = of_GetDayWidth()
		lstr_newevent.eventobject.StartDateTime = DateTime(inv_helper.of_GetDateFromCell(Date(lstr_grid.StartDate), lp_cell))
		
		lstr_newevent.eventobject.AllDayEvent = TRUE
		lstr_newevent.eventobject.EndDateTime = lstr_newevent.eventobject.StartDateTime
		of_CaptureMouse()

		istr_selectedcell = lstr_newevent
		ib_isselecting = TRUE
		idt_selectedtime = lstr_newevent.eventobject.StartDateTime
		idt_selectedendtime = lstr_newevent.eventobject.EndDateTime
	END IF
	
	
	SetRedraw(TRUE)
END IF

RETURN 1
end event

event type integer eventdeleting(scheduleevent a_event);//Return 1 to continue
RETURN 1
end event

event rbuttonup;IF IsReadOnly THEN RETURN
IF DefaultView = MONTH THEN RETURN EVENT RButtonUpMonth(flags, xpos, ypos)

IF IsValid(istr_selectedevent) THEN
	EVENT RightClick(flags, xpos, ypos, istr_selectedevent.eventobject)
ELSEIF IsValid(istr_selectedcell) THEN
	
	DateTime ldt_clickeddate
	Long ll_x, ll_y
	
	ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
	ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

	ldt_clickeddate = of_FindClosestDatetime(ll_x, ll_y)
	
	IF ll_y < HeaderHeight THEN
		//Right clicking in all day area
		IF Date(ldt_clickeddate) >= Date(istr_selectedcell.eventobject.StartDateTime) AND Date(ldt_clickeddate) <= Date(istr_selectedcell.eventobject.EndDateTime) THEN
			EVENT RightClickSelection(flags, xpos, ypos, istr_selectedcell.eventobject.StartDateTime, istr_selectedcell.eventobject.EndDateTime, istr_selectedcell.eventobject.AllDayEvent)
		END IF
	ELSE
		IF ldt_clickeddate >= istr_selectedcell.eventobject.StartDateTime AND ldt_clickeddate <= istr_selectedcell.eventobject.EndDateTime THEN
			EVENT RightClickSelection(flags, xpos, ypos, istr_selectedcell.eventobject.StartDateTime, istr_selectedcell.eventobject.EndDateTime, istr_selectedcell.eventobject.AllDayEvent)
		END IF
	END IF
	
END IF
end event

event type long rbuttondownmonth(unsignedlong flags, integer xpos, integer ypos);Long ll_index, ll_count, ll_innerindex, ll_innercount
Long ll_x, ll_y
str_schedulemappedevents lstr_selectedevent

istr_selectedevent = lstr_selectedevent

SetFocus(THIS)

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

IF ll_y <= ScaleDPI(MonthDayNameHeight) THEN RETURN 0

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	IF ll_x > s_loadedevents[ll_index].rectregion.Left AND ll_y >  s_loadedevents[ll_index].rectregion.Top AND &
		 ll_x <  s_loadedevents[ll_index].rectregion.Right AND ll_y <  s_loadedevents[ll_index].rectregion.Bottom THEN 

		 lstr_selectedevent =  s_loadedevents[ll_index]
	END IF
	
	IF NOT IsValid(lstr_selectedevent) THEN
		ll_innercount = UpperBound(s_loadedevents[ll_index].rectregions)
		
		FOR ll_innerindex = 1 TO ll_innercount
			IF ll_x > s_loadedevents[ll_index].rectregions[ll_innerindex].Left AND ll_y >  s_loadedevents[ll_index].rectregions[ll_innerindex].Top AND &
				 ll_x <  s_loadedevents[ll_index].rectregions[ll_innerindex].Right AND ll_y <  s_loadedevents[ll_index].rectregions[ll_innerindex].Bottom THEN 

				 lstr_selectedevent =  s_loadedevents[ll_index]
			END IF
		NEXT
	END IF
NEXT

IF IsValid(lstr_selectedevent) THEN
	istr_selectedevent = lstr_selectedevent
ELSE
	IF NOT CreateNewEventOnMouseDrag THEN
		str_scheduledimensions lstr_grid
		Point lp_cell
		Date ldt_clickeddate
		
		lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)
		lp_cell  = inv_helper.of_GetDayCellFromCords(ll_x, ll_y, lstr_grid.ColumnWidth, lstr_grid.RowHeight)
		
		ldt_clickeddate = inv_helper.of_GetDateFromCell(lstr_grid.StartDate, lp_cell)
		
		IF IsValid(istr_selectedcell) THEN
			IF ldt_clickeddate < Date(istr_selectedcell.eventobject.StartDateTime) OR ldt_clickeddate > Date(istr_selectedcell.eventobject.EndDateTime) THEN
				DESTROY istr_selectedcell
			END IF
		END IF
		
		IF NOT IsValid(istr_selectedcell) THEN
			istr_selectedcell = CREATE str_schedulemappedevents
			
			istr_selectedcell.eventobject.StartDateTime = DateTime(ldt_clickeddate)
			istr_selectedcell.eventobject.EndDateTime = DateTime(ldt_clickeddate)

			istr_selectedcell.eventobject.AllDayEvent =  TRUE
		END IF
	END IF	
END IF

SetRedraw(TRUE)
end event

event ue_scroll();IF IsValid(sle_scheduletitleedit) THEN
	IF sle_scheduletitleedit.Visible THEN
		THIS.SetFocus()
	END IF
END IF
end event

event type long rbuttonupmonth(unsignedlong flags, integer xpos, integer ypos);IF IsValid(istr_selectedevent) THEN
	EVENT RightClick(flags, xpos, ypos, istr_selectedevent.eventobject)
ELSEIF IsValid(istr_selectedcell) THEN
	
	DateTime ldt_clickeddate
	Long ll_x, ll_y
	
	ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
	ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

		str_scheduledimensions lstr_grid
		Point lp_cell
		
		lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)
		lp_cell  = inv_helper.of_GetDayCellFromCords(ll_x, ll_y, lstr_grid.ColumnWidth, lstr_grid.RowHeight)
		
		ldt_clickeddate = DateTime(inv_helper.of_GetDateFromCell(lstr_grid.StartDate, lp_cell))
		
	IF ldt_clickeddate >= istr_selectedcell.eventobject.StartDateTime AND ldt_clickeddate <= istr_selectedcell.eventobject.EndDateTime THEN
		EVENT RightClickSelection(flags, xpos, ypos, istr_selectedcell.eventobject.StartDateTime, istr_selectedcell.eventobject.EndDateTime, istr_selectedcell.eventobject.AllDayEvent)
	END IF
	
	
END IF

RETURN 1
end event

private function integer of_drawgrid (longptr aul_graphics, longptr aul_hdc);LongPtr lul_pen, ull_DayBrushColor, lul_CurrentDayPen
ULong lul_pencolor, lul_daycolor
Long ll_width, ll_height, ll_daywidth
Long ll_index, ll_daycount
String ls_ampm
Long ll_time
Int li_red, li_green, li_blue
Long ll_scrollwidth

ls_ampm = " " + inv_resourcemanager.of_GetString(AM)

IF uo_scroll.Visible THEN
	ll_scrollwidth = uo_scroll.Width + 16
END IF

ll_width = UnitsToPixels(of_WorkspaceWidth() - ll_scrollwidth, XUnitsToPixels!)
ll_height = UnitsToPixels(of_WorkspaceHeight(), YUnitsToPixels!)

lul_pencolor = inv_win32.PBUSMakeARGB (255, 218, 220, 224)

of_GetThemeColor(li_red, li_green, li_blue)
lul_daycolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)

inv_win32.GdipCreatePen1(lul_pencolor,1, 2, lul_Pen)
inv_win32.GdipCreatePen1(lul_daycolor,1, 2, lul_CurrentDayPen)
inv_win32.GdipCreateSolidFill(lul_daycolor, ull_DayBrushColor)

ll_daycount = of_GetDayCount()
ll_daywidth = of_GetDayWidth()

///This zone is scrollable
IF WorkStartTime <> Time(0,0,0) OR WorkEndTime <> Time(23,59,59) OR &
	(NOT WorkSunday OR NOT WorkMonday OR NOT WorkTuesday OR NOT WorkWednesday OR NOT WorkThursday OR NOT WorkFriday OR NOT WorkSaturday) THEN
	
	Int li_daynumber
	LongPtr lul_shadebrush
	RECT rc_fullshade
	RECT rc_topshade
	RECT rc_bottomshade
	
	lul_shadebrush = inv_win32.CreateSolidBrush(RGB(245,245,245))
	
	//Shade the non-worktime areas
	FOR ll_index = 1 TO ll_daycount
		
		li_daynumber = DayNumber(RelativeDate(id_StartDate, ll_index - 1 ))
		
		rc_fullshade.Left = TimeWidth + ((ll_index - 1) * ll_daywidth)
		rc_fullshade.Right = rc_fullshade.Left + ll_daywidth
		rc_fullshade.Top = HeaderHeight + il_yscroll
		rc_fullshade.Bottom = HeaderHeight + (TimeRowHeight * 24) + il_yscroll
		
		rc_topshade.Left = TimeWidth + ((ll_index - 1) * ll_daywidth)
		rc_topshade.Right = rc_fullshade.Left + ll_daywidth
		rc_topshade.Top = 0
		rc_topshade.Bottom = HeaderHeight + (TimeRowHeight * hour(WorkStartTime)) + il_yscroll
		
		rc_bottomshade.Left = TimeWidth + ((ll_index - 1) * ll_daywidth)
		rc_bottomshade.Right = rc_fullshade.Left + ll_daywidth
		rc_bottomshade.Top = HeaderHeight + (TimeRowHeight * (hour(WorkEndTime))) + il_yscroll
		rc_bottomshade.Bottom = HeaderHeight + (TimeRowHeight * 24) + il_yscroll
		
		CHOOSE CASE li_daynumber
			CASE 1 //Sunday
				IF WorkSunday THEN
					inv_win32.FillRect(aul_hdc, rc_topshade, lul_shadebrush)
					inv_win32.FillRect(aul_hdc, rc_bottomshade, lul_shadebrush)
				ELSE
					inv_win32.FillRect(aul_hdc, rc_fullshade, lul_shadebrush)
				END IF
			CASE 2 //Monday
				IF WorkMonday THEN
					inv_win32.FillRect(aul_hdc, rc_topshade, lul_shadebrush)
					inv_win32.FillRect(aul_hdc, rc_bottomshade, lul_shadebrush)
				ELSE
					inv_win32.FillRect(aul_hdc, rc_fullshade, lul_shadebrush)
				END IF
			CASE 3 //Tuesday
				IF WorkTuesday THEN
					inv_win32.FillRect(aul_hdc, rc_topshade, lul_shadebrush)
					inv_win32.FillRect(aul_hdc, rc_bottomshade, lul_shadebrush)
				ELSE
					inv_win32.FillRect(aul_hdc, rc_fullshade, lul_shadebrush)
				END IF
			CASE 4 //Wednesday
				IF WorkWednesday THEN
					inv_win32.FillRect(aul_hdc, rc_topshade, lul_shadebrush)
					inv_win32.FillRect(aul_hdc, rc_bottomshade, lul_shadebrush)
				ELSE
					inv_win32.FillRect(aul_hdc, rc_fullshade, lul_shadebrush)
				END IF
			CASE 5 //Thursday
				IF WorkThursday THEN
					inv_win32.FillRect(aul_hdc, rc_topshade, lul_shadebrush)
					inv_win32.FillRect(aul_hdc, rc_bottomshade, lul_shadebrush)
				ELSE
					inv_win32.FillRect(aul_hdc, rc_fullshade, lul_shadebrush)
				END IF
			CASE 6 //Friday
				IF WorkFriday THEN
					inv_win32.FillRect(aul_hdc, rc_topshade, lul_shadebrush)
					inv_win32.FillRect(aul_hdc, rc_bottomshade, lul_shadebrush)
				ELSE
					inv_win32.FillRect(aul_hdc, rc_fullshade, lul_shadebrush)
				END IF
			CASE 7 //Saturday
				IF WorkSaturday THEN
					inv_win32.FillRect(aul_hdc, rc_topshade, lul_shadebrush)
					inv_win32.FillRect(aul_hdc, rc_bottomshade, lul_shadebrush)
				ELSE
					inv_win32.FillRect(aul_hdc, rc_fullshade, lul_shadebrush)
				END IF
		END CHOOSE
		
	NEXT
	
	inv_win32.DeleteObject(lul_shadebrush)
	
END IF

String ls_time

//Time Row Lines
FOR ll_index = 1 TO 23
	inv_win32.GdipDrawLine (aul_graphics, lul_pen, TimeWidth - ScaleDPI(8), HeaderHeight + (TimeRowHeight * ll_index) + il_yscroll, ll_width, HeaderHeight + (TimeRowHeight * ll_index) + il_yscroll)
	
	IF TimeFormat24Hour THEN
		ls_ampm = ":00"
		ll_time = ll_index
	ELSE
		
		IF ll_index >= 12 THEN
			ls_ampm = " " + inv_resourcemanager.of_GetString(PM)
		END IF
	
		ll_time = ll_index
	
		IF ll_index > 12 THEN
			ll_time = ll_index - 12
		END IF
	END IF
	
	of_DrawText(aul_hdc, iul_timefont, String(ll_time) + ls_ampm, DT_HRIGHT, DT_VCENTER, 0,  HeaderHeight + (TimeRowHeight * ll_index) - ScaleDPI(20)  + il_yscroll , TimeWidth - ScaleDPI(10), ScaleDPI(40), TextColor)
	
NEXT

//Draw regular daily events
IF NOT ib_printing THEN
	of_DrawSelection(aul_hdc, aul_graphics)
END IF
of_DrawEvents(aul_hdc, aul_graphics)
of_DrawMovingEvent(aul_hdc, aul_graphics)
of_DrawNewEvent(aul_hdc, aul_graphics)


///The following zone is NOT scrollable

//Draw Header Rectangle
LongPtr ull_BackBrushColor
RECT rc

rc.Right = ll_width
rc.Bottom = HeaderHeight

ull_BackBrushColor = inv_win32.CreateSolidBrush(BackgroundColor)
inv_win32.FillRect(aul_hdc, rc, ull_BackBrushColor)
inv_win32.DeleteObject(ull_BackBrushColor)


//Header line
inv_win32.GdipDrawLine (aul_graphics, lul_pen, TimeWidth - 8, HeaderHeight, ll_width, HeaderHeight)

//Time Line
inv_win32.GdipDrawLine (aul_graphics, lul_pen, TimeWidth, HeaderHeight - FullDayHeight, TimeWidth, (HeaderHeight - FullDayHeight) + (TimeRowHeight * 24))

of_DrawSelectionFullDay(aul_hdc, aul_graphics)

//Day Column Lines
ULong DayColor

FOR ll_index = 1 TO ll_daycount
	
	IF ll_index < ll_daycount THEN
		inv_win32.GdipDrawLine (aul_graphics, lul_pen, TimeWidth + (ll_index * ll_daywidth), HeaderHeight - FullDayHeight, TimeWidth + (ll_index * ll_daywidth), (HeaderHeight - FullDayHeight) + (TimeRowHeight * 24))
	END IF
	
	//Draw Number name
	of_DrawText(aul_hdc, iul_daytextfont, inv_helper.of_GetDayName(DayNumber(RelativeDate(id_StartDate, ll_index - 1 )))  , DT_HCENTER, DT_VCENTER, &
						TimeWidth + ((ll_index - 1) * ll_daywidth), &
						0 , &
						ll_daywidth, &
						(ScaleDPI(DefaultHeaderHeight) / 2), &
						TextColor)
	
	DayColor = TextColor
	
	//Current day circle
	IF RelativeDate(id_StartDate, ll_index - 1 ) =  Today() THEN
		IF NOT ib_printing AND CircleCurrentDay THEN
			inv_win32.GdipFillEllipseI(aul_graphics, ull_DayBrushColor,&
													(TimeWidth + ((ll_index - 1) * ll_daywidth)) + (ll_daywidth / 2) - ScaleDPI(40 / 2), &
													 (ScaleDPI(DefaultHeaderHeight) / 2) - ScaleDPI(10), &
													 ScaleDPI(40), ScaleDPI(40))
			DayColor = RGB(255,255,255)
		END IF
		
		IF NOT ib_printing AND OutlineCurrentDay THEN
			LongPtr lul_path
			inv_win32.GdipCreatePath(0, lul_path)
			inv_win32.GdipAddPathRectangleI(lul_path,(TimeWidth + ((ll_index - 1) * ll_daywidth)),0,ll_daywidth,ll_height - 1)
			inv_win32.GdipDrawPath(aul_graphics, lul_CurrentDayPen, lul_path);
			inv_win32.GdipDeletePath(lul_path)
		END IF
	END IF 
	
	//Draw Number day
	of_DrawText(aul_hdc, iul_daynumberfont, String(Day(RelativeDate(id_StartDate, ll_index - 1 ))), DT_HCENTER, DT_VTOP, &
						TimeWidth + ((ll_index - 1) * ll_daywidth), &
						(ScaleDPI(DefaultHeaderHeight) / 2) - ScaleDPI(8), &
						ll_daywidth, &
						(ScaleDPI(DefaultHeaderHeight) / 2), &
						DayColor)		
						
	IF NOT ib_printing AND DisplayCurrentTimeIndicator THEN
		of_DrawCurrentTimeIndicator(aul_graphics, aul_hdc, lul_daycolor)
	END IF
NEXT

//Draw full day events
of_DrawFullDayEvents(aul_hdc, aul_graphics, ll_daywidth)

//Clean Up
inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeletePen(lul_CurrentDayPen)
inv_win32.GdipDeleteBrush(ull_DayBrushColor)

RETURN 1
end function

private function integer of_drawbackground (longptr hdc);LongPtr ull_BackBrushColor
RECT rc
// determine control size
GetClientRect(Handle(THIS), rc)

IF ib_printing THEN
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
		lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)
		
		ld_firstday = lstr_grid.StartDate
		ld_enddate = lstr_grid.EndDate
		
END CHOOSE

ib_eventsloaded = FALSE
Trigger Event DateRangeChanged(ld_firstday, ld_enddate)

//Developer may have called of_LoadEvents in the DateRangeChanged event
//If so, we don't want to call it again. If not, we can attempt to load what we already have.
IF NOT ib_eventsloaded THEN
	scheduleevent l_events[]
	THIS.of_GetLoadedEvents(l_events)
	
	THIS.of_LoadEvents(l_events)
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

public function integer of_setdefaultview (integer ai_view);IF ai_view >= 1 AND ai_view <= 4 THEN
	DefaultView = ai_view
	
	IF DefaultView = MONTH THEN
		uo_scroll.Hide()
	ELSE
		uo_scroll.Show()
	END IF
	
	RETURN of_SetCurrentDate(CurrentDate)
END IF

RETURN -1

end function

public function integer of_loadevents (scheduleevent a_events[]);Long ll_index, ll_innerindex, ll_count, ll_innercount
Int li_numdays, li_eventcount, li_eventorder, li_endhour, li_endminute
Int il_counts[]
Int il_maxfulldayeventcount = 1
Date id_workingdate
str_schedulemappedevents lstr_empty[]

SetRedraw(FALSE)

IF IsValid(sle_scheduletitleedit) THEN
	sle_scheduletitleedit.Hide()
END IF

ib_eventsloaded = TRUE

li_numdays = of_GetDayCount()

//Preload count array. This array tracks the number of all day events per day. We need the max count to adjust our all day row height
il_counts[li_numdays] = 0

//Cleanup any already created mapped events
of_DestroyEvents()

of_SortEvents(a_events)
ll_count = UpperBound(a_events)

s_loadedevents = lstr_empty

FOR ll_innerindex = 1 TO li_numdays
	s_mappedevents[ll_innerindex] = CREATE str_scheduledaysevents
NEXT

//Loop through all the events and look for all day events
FOR ll_index = 1 TO ll_count
	s_loadedevents[ll_index] = CREATE str_schedulemappedevents
	s_loadedevents[ll_index].eventobject = a_events[ll_index]

	IF s_loadedevents[ll_index].eventobject.AllDayEvent OR (NOT s_loadedevents[ll_index].eventobject.AllDayEvent AND  Date(inv_helper.of_RelativeDateTime(s_loadedevents[ll_index].eventobject.EndDateTime, -60)) > Date(s_loadedevents[ll_index].eventobject.StartDateTime)) THEN
		s_loadedevents[ll_index].DisplayAsAllDayEvent = TRUE
		
		FOR ll_innerindex = 1 TO li_numdays
			id_workingdate = RelativeDate(id_StartDate, ll_innerindex - 1)
			
			//If an all day event falls withing one of the days of the week, track the count
			IF id_workingdate >= Date(s_loadedevents[ll_index].eventobject.StartDateTime) AND &
				 id_workingdate <= Date(s_loadedevents[ll_index].eventobject.EndDateTime) THEN
				 il_counts[ll_innerindex] += 1
			END IF
		NEXT
	ELSE
		
		FOR ll_innerindex = 1 TO li_numdays
			id_workingdate = RelativeDate(id_StartDate, ll_innerindex - 1)
			
			IF Date(id_workingdate) = Date(s_loadedevents[ll_index].eventobject.StartDateTime) THEN
				s_mappedevents[ll_innerindex].mappedevents[UpperBound(s_mappedevents[ll_innerindex].mappedevents) + 1] = s_loadedevents[ll_index]
				EXIT
			END IF
		NEXT
		END IF
NEXT

//Get the max all day event count
FOR ll_index = 1 TO li_numdays
	il_maxfulldayeventcount = Max(il_maxfulldayeventcount, il_counts[ll_index])
NEXT

//Set the new full day and header height
FullDayHeight = ScaleDPI(DefaultFullDayHeight) * il_maxfulldayeventcount
HeaderHeight = ScaleDPI(DefaultHeaderHeight) + FullDayHeight

Event Resize(99, THIS.Width, THIS.Height)

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_scrolltohour (integer ai_hour);Int il_delta
Long ll_height

ll_height = UnitsToPixels(of_WorkspaceHeight(), YUnitsToPixels!)

il_yscroll = ((TimeRowHeight * ai_hour) * -1) + ScaleDPI(10)

IF il_yscroll >= 0 THEN
	il_yscroll = 0
END IF

IF il_yscroll < (ll_height  - HeaderHeight) - ((TimeRowHeight * 24)) THEN
	il_yscroll = (ll_height  - HeaderHeight) - ((TimeRowHeight * 24))
END IF

IF TimeRowHeight > 0 THEN
	uo_scroll.Position = (Abs(il_yscroll) / ((TimeRowHeight * 24))) * uo_scroll.MaxPosition
END IF

SetRedraw(TRUE)
uo_scroll.SetRedraw(TRUE)

RETURN 1
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

private function integer of_destroyevents ();Long ll_index, ll_innerindex, ll_count, ll_innercount
//Cleanup any already created mapped events

ll_count = UpperBound(s_mappedevents)

FOR ll_index = 1 TO ll_count
	IF NOT IsValid(s_mappedevents[ll_index]) THEN CONTINUE
	
	ll_innercount = UpperBound(s_mappedevents[ll_index].mappedevents)
	
	FOR ll_innerindex = 1 TO ll_innercount
		IF IsValid(s_mappedevents[ll_index]) THEN
			IF IsValid(s_mappedevents[ll_index].mappedevents[ll_innercount]) THEN
				DESTROY s_mappedevents[ll_index].mappedevents[ll_innercount]
			END IF
		END IF
	NEXT
	
	DESTROY s_mappedevents[ll_index]
NEXT

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	IF NOT IsValid(s_loadedevents[ll_index]) THEN CONTINUE
	DESTROY s_loadedevents[ll_index]
NEXT
	
RETURN 1
end function

private function integer of_calculateeventconflicts (ref str_schedulemappedevents a_daysevents[], integer a_minutes, ref str_schedulelayout applayouts[]);Long ll_index, ll_count, ll_segmentindex
Long ll_innerindex, ll_innercount, ll_segmentcount
Int li_segmentsize
str_schedulelayout lstr_emptylayout
s_rect lstr_emptyrect

li_segmentsize = (60 / a_minutes)

appLayouts[li_segmentsize * 25] = lstr_emptylayout

ll_count = UpperBound(a_daysevents)

FOR ll_index = 1 TO ll_count
	IF NOT IsValid(a_daysevents[ll_index]) THEN CONTINUE
	a_daysevents[ll_index].overlapcount = 1
	a_daysevents[ll_index].xposition = 0
NEXT

FOR ll_index = 1 TO ll_count
	IF NOT IsValid(a_daysevents[ll_index]) THEN CONTINUE
	IF a_daysevents[ll_index].IsMoving THEN CONTINUE
	
	int il_firstSegment, il_lastsegment
	int il_endhour, li_endminute
	
	il_endhour = Hour(Time(a_daysevents[ll_index].eventobject.EndDateTime))
	li_endminute = Minute(Time(a_daysevents[ll_index].eventobject.EndDateTime))
	il_firstSegment = Hour(Time(a_daysevents[ll_index].eventobject.StartDateTime)) * li_segmentsize + (Minute(Time(a_daysevents[ll_index].eventobject.StartDateTime)) / MinAppointmentIncrement) + 1
	
	IF il_endhour = 0 AND li_endminute = 0 THEN
		il_lastsegment = 24 * li_segmentsize
	ELSE
		il_lastsegment = il_endhour * li_segmentsize + (Minute(Time(a_daysevents[ll_index].eventobject.EndDateTime)) / MinAppointmentIncrement) + 1
	END IF
	
	IF il_firstSegment = il_lastsegment THEN
		IF il_lastsegment < (24 * li_segmentsize) THEN
			il_lastsegment += 1
		ELSE
			il_firstSegment -= 1
		END IF
	END IF
	
	IF il_firstSegment > il_lastsegment THEN
		il_lastsegment += il_firstSegment
	END IF
	

	ll_segmentcount = (il_lastsegment - 1)
	FOR ll_segmentindex = il_firstSegment TO ll_segmentcount

		IF ll_segmentindex > UpperBound(appLayouts) THEN CONTINUE
		IF ll_segmentindex <= 0 THEN CONTINUE

		IF NOT IsValid(appLayouts[ll_segmentindex]) THEN
			str_schedulemappedevents lstr_event
			appLayouts[ll_segmentindex] = CREATE str_schedulelayout
			appLayouts[ll_segmentindex].events[20] = lstr_event
		END IF

		appLayouts[ll_segmentindex].events[appLayouts[ll_segmentindex].Count + 1] = a_daysevents[ll_index]
		appLayouts[ll_segmentindex].Count++

		ll_innercount = UpperBound(appLayouts[ll_segmentindex].events)
		
		FOR ll_innerindex = 1 TO ll_innercount
			IF IsValid(appLayouts[ll_segmentindex].events[ll_innerindex]) THEN
				IF appLayouts[ll_segmentindex].events[ll_innerindex].overlapcount < appLayouts[ll_segmentindex].Count THEN
					appLayouts[ll_segmentindex].events[ll_innerindex].overlapcount = appLayouts[ll_segmentindex].Count
				END IF
			END IF
		NEXT
	NEXT
NEXT

RETURN UpperBound(appLayouts)
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

private function time of_findclosesttime (long al_y);Long li_eventslotheight
Integer li_minute
Time lt_basetime

IF il_yscroll < 0 THEN
	al_y = al_y - il_yscroll
END IF

al_y = al_y - HeaderHeight

IF al_y < 0 THEN
	al_y = 0
END IF

li_eventslotheight = TimeRowHeight / (60 / MinAppointmentIncrement)

RETURN RelativeTime(lt_basetime, (Long(al_y / li_eventslotheight) * MinAppointmentIncrement * 60))
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

IF uo_scroll.Visible THEN
	ll_scrollwidth = uo_scroll.Width + 16
END IF

ll_containerwidth = UnitsToPixels(of_WorkspaceWidth() - ll_scrollwidth, XUnitsToPixels!)

ll_daycount = of_GetDayCount()

RETURN (ll_containerwidth - TimeWidth) / ll_daycount
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

public function datetime of_findclosestdatetime (long al_x, long al_y);DateTime ld_closestdate
Time lt_newtime
Long ll_daywidth, ll_newday

ll_daywidth = of_GetDayWidth()

ll_newday = Integer((al_x - TimeWidth) / ll_daywidth)
lt_newtime = of_FindClosestTime(al_y)
ld_closestdate = DateTime(RelativeDate(id_StartDate, ll_newday), lt_newtime)

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
			of_GetLoadedEvents(l_events)
			l_events[UpperBound(l_events) + 1] = i_newevent
			of_LoadEvents(l_events)
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
		i_newevent.ResourceId = il_resourceid
		i_newevent.TextColor = RGB(255,255,255)
		
		IF NOT lstr_edit.DeleteEvent THEN
			IF Event EventAdded(i_newevent) = 1 THEN
				of_GetLoadedEvents(l_events)
				l_events[UpperBound(l_events) + 1] = i_newevent
				of_LoadEvents(l_events)
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

uo_scroll.of_SetSliderColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1'))

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

ll_x = TimeWidth + (ll_daycolumn * ll_daywidth)

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

private function integer of_drawmonthgrid (longptr aul_graphics, longptr aul_hdc);Long ll_gridrows, ll_index, ll_row, ll_col, ll_yadjust, ll_count
Long ll_width, ll_height, ll_rowheight, ll_colwidth
ULong lul_pencolor, lul_daycolor
LongPtr lul_Pen, ull_DayBrushColor, lul_CurrentDayPen
Int li_red, li_green, li_blue
Date ld_firstday, ld_lastday
Int li_daysinmonth
s_rect ls_empty[]
str_scheduleeventmore istr_morelinksempty[]
str_scheduledimensions lstr_grid
CONSTANT Int daysInWeek = 7
Int HeaderAdjust
Int DayNumberHeight

HeaderAdjust = ScaleDPI(10)
DayNumberHeight = ScaleDPI(28)

istr_morelinks = istr_morelinksempty

//Calculate the number of rows needed in the current Month
lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)

ld_firstday = lstr_grid.StartDate
ld_lastday = lstr_grid.EndDate
li_daysinmonth = lstr_grid.DaysInMonth
ll_rowheight = lstr_grid.RowHeight
ll_colwidth = lstr_grid.ColumnWidth
ll_gridrows = lstr_grid.GridRows

//Get the width and height of our canvas
ll_width = UnitsToPixels(of_WorkspaceWidth(), XUnitsToPixels!)
ll_height = UnitsToPixels(of_WorkspaceHeight(), YUnitsToPixels!)

//Create pens and brushes
lul_pencolor = inv_win32.PBUSMakeARGB (255, 218, 220, 224)

of_GetThemeColor(li_red, li_green, li_blue)
lul_daycolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)

inv_win32.GdipCreatePen1(lul_pencolor,1, 2, lul_Pen)
inv_win32.GdipCreatePen1(lul_daycolor,1, 2, lul_CurrentDayPen)
inv_win32.GdipCreateSolidFill(lul_daycolor, ull_DayBrushColor)

//Draw Grid
inv_win32.GdipDrawLine (aul_graphics, lul_pen, 0, 1, ll_width, 1)

IF NOT ib_printing THEN
	of_DrawSelectionMonth(aul_hdc, aul_graphics)
END IF

FOR ll_index = 1 TO ll_gridrows
	inv_win32.GdipDrawLine (aul_graphics, lul_pen, 0, (ll_rowheight * ll_index) + ScaleDPI(MonthDayNameHeight), ll_width, (ll_rowheight * ll_index) + ScaleDPI(MonthDayNameHeight))
NEXT

inv_win32.GdipDrawLine (aul_graphics, lul_pen, 1, 0, 1, ll_height)

Int li_day, li_printadjust
ULong ll_DayColor
String ls_dayname

li_day = StartOfWeek
ll_DayColor = TextColor

IF ib_printing THEN
	li_printadjust = ScaleDPI(5)
END IF

FOR ll_index = 1 TO daysInWeek
	
	//Draw column labels
	ls_dayname = inv_helper.of_GetDayName(li_day)
	
	//Draw dayname
	of_DrawText(aul_hdc, iul_daytextfont, ls_dayname, DT_HCENTER, DT_VTOP, &
						ll_colwidth * (ll_index - 1), &
						ScaleDPI(5) + li_printadjust, &
						ll_colwidth, &
						ScaleDPI(20), &
						ll_DayColor)		
	
	li_day++
	
	IF li_day > daysInWeek THEN
		li_day = 1
	END IF
	
	//Draw column lines
	inv_win32.GdipDrawLine (aul_graphics, lul_pen, ll_colwidth * ll_index, 0, ll_colwidth * ll_index, ll_height)
NEXT

//Draw day numbers
Date ld_day

ld_day = ld_firstday

ll_col = 1
ll_row = 0

FOR ll_index = 1 TO li_daysinmonth
	ll_DayColor = TextColor
	
	//Current day circle
	IF ld_day =  Today() THEN
		IF NOT ib_printing AND CircleCurrentDay THEN
			inv_win32.GdipFillEllipseI(aul_graphics, ull_DayBrushColor,&
												(ll_colwidth * (ll_col - 1)) + (ll_colwidth / 2) - ScaleDPI(30 / 2) , &
												((ll_rowheight * ll_row) + ScaleDPI(10) + ScaleDPI(MonthDayNameHeight)) - ScaleDPI(4), &
												 ScaleDPI(30), ScaleDPI(30))
			ll_DayColor = RGB(255,255,255)
		END IF
		
		IF NOT ib_printing AND OutlineCurrentDay THEN
			LongPtr lul_path
			inv_win32.GdipCreatePath(0, lul_path)
			IF ll_row = 0 THEN
				inv_win32.GdipAddPathRectangleI(lul_path,ll_colwidth * (ll_col - 1),(ll_rowheight * ll_row) + 1,ll_colwidth,ll_rowheight + ScaleDPI(MonthDayNameHeight) - 1)
			ELSE
				inv_win32.GdipAddPathRectangleI(lul_path,ll_colwidth * (ll_col - 1),(ll_rowheight * ll_row) + ScaleDPI(MonthDayNameHeight),ll_colwidth,ll_rowheight)
			END IF
			inv_win32.GdipDrawPath(aul_graphics, lul_CurrentDayPen, lul_path);
			inv_win32.GdipDeletePath(lul_path)
		END IF
		
		
	END IF 
	
	//Draw daynumber
	of_DrawText(aul_hdc, iul_daytextfont, String(Day(ld_day)), DT_HCENTER, DT_VTOP, &
						ll_colwidth * (ll_col - 1), &
						(ll_rowheight * ll_row) + HeaderAdjust + ScaleDPI(MonthDayNameHeight), &
						ll_colwidth, &
						DayNumberHeight, &
						ll_DayColor)
	
	ld_day = RelativeDate(ld_day, 1)
	
	ll_col++
	
	IF ll_col > daysInWeek THEN
		ll_col = 1
		ll_row++
	END IF
	
NEXT


//Draw events
Int li_dayeventcount[]
Int li_slotmatrix[50,10] //Max 50 days, 10 items per day
Int li_freeslot
Int li_maxitemsperday
Int li_innerindex, li_innercount
Int li_index3, li_count3, li_eventwidth
Point lp_startcell, lp_endcell
Int li_startdaycell, li_enddaycell
Int li_x, li_y
Int li_doubleloop
Boolean lb_drawmoving
Date ld_eventstart, ld_eventend

li_maxitemsperday = ((ll_rowheight - HeaderAdjust - DayNumberHeight) / ScaleDPI(MonthEventHeight)) - 1  //subtract 1 so we can display a "more items" link if needed

FOR li_innerindex = 1 TO li_daysinmonth
	li_dayeventcount[li_innerindex] = 0
NEXT

ll_count = UpperBound(s_loadedevents)

//Loop twice, first display events, second, draw a moving event
FOR li_doubleloop = 1 TO 2
FOR ll_index = 1 TO ll_count
	IF NOT IsValid(s_loadedevents[ll_index]) THEN CONTINUE
	IF Date(s_loadedevents[ll_index].eventobject.EndDateTime) < ld_firstday THEN CONTINUE
	IF Date(s_loadedevents[ll_index].eventobject.StartDateTime) > ld_lastday THEN CONTINUE
	IF s_loadedevents[ll_index].eventobject.EndDateTime < s_loadedevents[ll_index].eventobject.StartDateTime THEN CONTINUE
	IF s_loadedevents[ll_index].IsMoving AND NOT lb_drawmoving THEN CONTINUE
	IF NOT s_loadedevents[ll_index].IsMoving AND lb_drawmoving THEN CONTINUE
	
	s_loadedevents[ll_index].rectregions = ls_empty
	
	IF lb_drawmoving THEN 
		IF ib_eventresizing THEN
			IF ib_eventresizestart THEN
				ld_eventstart = RelativeDate(Date(s_loadedevents[ll_index].eventobject.EndDateTime), ii_movingrelativedays)
				ld_eventend = Date(s_loadedevents[ll_index].eventobject.EndDateTime)
			ELSE
				ld_eventstart = Date(s_loadedevents[ll_index].eventobject.StartDateTime)
				ld_eventend = RelativeDate(Date(s_loadedevents[ll_index].eventobject.StartDateTime), ii_movingrelativedays)
			END IF
		ELSE	
			ld_eventstart = RelativeDate(Date(s_loadedevents[ll_index].eventobject.StartDateTime), ii_movingrelativedays)
			ld_eventend = RelativeDate(Date(s_loadedevents[ll_index].eventobject.EndDateTime), ii_movingrelativedays)
		END IF
	ELSE
		ld_eventstart = Date(s_loadedevents[ll_index].eventobject.StartDateTime)
		ld_eventend = Date(s_loadedevents[ll_index].eventobject.EndDateTime)
		
		IF ld_eventend > ld_eventstart AND NOT s_loadedevents[ll_index].eventobject.AllDayEvent THEN
			ld_eventend = Date(inv_helper.of_RelativeDateTime(s_loadedevents[ll_index].eventobject.EndDateTime, -1))
		END IF
		
	END IF
	
	lp_startcell = inv_helper.of_GetMonthCell(ld_firstday, ld_lastday, ld_eventstart)
	lp_endcell = inv_helper.of_GetMonthCell(ld_firstday, ld_lastday, ld_eventend)
	
	li_startdaycell = inv_helper.of_GetDayCellFromPoint(lp_startcell)
	li_enddaycell = inv_helper.of_GetDayCellFromPoint(lp_endcell)

	li_innercount = li_enddaycell - li_startdaycell + 1
	
	li_freeslot = 1
	
	Boolean lb_continue
	ll_row = 1
	lb_continue = TRUE
	
	IF lb_drawmoving THEN 
		ll_row = 1
	ELSE
		//Find an empty spot in our grid.
		DO WHILE lb_continue OR ll_row > li_maxitemsperday
			FOR li_innerindex = li_startdaycell TO li_enddaycell
				IF li_slotmatrix[li_innerindex, ll_row] = 0 THEN
					lb_continue = FALSE
				ELSE
					lb_continue = TRUE
					EXIT
				END IF
			NEXT
			
			IF NOT lb_continue THEN EXIT
			
			ll_row++
		LOOP
		
		IF ll_row <= li_maxitemsperday THEN
			FOR li_innerindex = li_startdaycell TO li_enddaycell
				li_slotmatrix[li_innerindex, ll_row] = 1
			NEXT
		END IF
		
		FOR li_innerindex = li_startdaycell TO li_enddaycell
			li_dayeventcount[li_innerindex] += 1
		NEXT
	END IF
	
	IF ll_row <= li_maxitemsperday THEN
		
		//Draw event on ll_row within li_startdaycell and li_enddaycell OR the event is moving
		IF s_loadedevents[ll_index].eventobject.AllDayEvent OR li_startdaycell <> li_enddaycell OR &
		   (s_loadedevents[ll_index].IsMoving AND lb_drawmoving) THEN

			//Draw a full day event
			IF lp_startcell.py = lp_endcell.py THEN
				li_x = (lp_startcell.px - 1) * ll_colwidth
				li_y = ((lp_startcell.py - 1) * ll_rowheight) + ((ll_row - 1) * ScaleDPI(MonthEventHeight)) + HeaderAdjust + DayNumberHeight + ScaleDPI(MonthDayNameHeight)
				of_DrawMonthFullDayEvent(aul_hdc, aul_graphics, s_loadedevents[ll_index].eventobject, li_x, li_y, (ll_colwidth * li_innercount)  - 10, ScaleDPI(MonthEventHeight), of_EventIsSelected(s_loadedevents[ll_index]))
				
				s_loadedevents[ll_index].rectregion = inv_helper.of_NewRect(li_x, li_y, (ll_colwidth * li_innercount)  - ScaleDPI(10), ScaleDPI(MonthEventHeight))
			ELSE
				//Full day wraps to another week
				li_innercount = lp_endcell.py - lp_startcell.py + 1
				FOR li_innerindex = 1 TO li_innercount
					
					li_x = (lp_startcell.px - 1) * ll_colwidth
					li_y = ((lp_startcell.py - 1) * ll_rowheight) + ((ll_row - 1) * ScaleDPI(MonthEventHeight)) + HeaderAdjust + DayNumberHeight + ScaleDPI(MonthDayNameHeight)
					
					IF li_innerindex < li_innercount THEN
						li_eventwidth = ll_colwidth * ((ScaleDPI(7) - lp_startcell.px + 1))
					ELSE
						li_eventwidth = (lp_endcell.px) * ll_colwidth
					END IF
					
					of_DrawMonthFullDayEvent(aul_hdc, aul_graphics, s_loadedevents[ll_index].eventobject, li_x, li_y, li_eventwidth - ScaleDPI(10), ScaleDPI(MonthEventHeight), of_EventIsSelected(s_loadedevents[ll_index]))
					
					s_loadedevents[ll_index].rectregions[li_innerindex] = inv_helper.of_NewRect(li_x, li_y, li_eventwidth - ScaleDPI(10), ScaleDPI(MonthEventHeight))
					
					lp_startcell.px = 1
					lp_startcell.py += 1
				NEXT
			END IF
			
		ELSE
			//Draw a single day event
			li_x = (lp_startcell.px - 1) * ll_colwidth
			li_y = ((lp_startcell.py - 1) * ll_rowheight) + ((ll_row - 1) * ScaleDPI(MonthEventHeight)) + HeaderAdjust + DayNumberHeight + ScaleDPI(MonthDayNameHeight)
			of_DrawMonthDayEvent(aul_graphics, aul_hdc, s_loadedevents[ll_index].eventobject, li_x, li_y, ll_colwidth - ScaleDPI(10), ScaleDPI(MonthEventHeight), of_EventIsSelected(s_loadedevents[ll_index]), of_EventIsMouseOver(s_loadedevents[ll_index]))
			
			s_loadedevents[ll_index].rectregion = inv_helper.of_NewRect(li_x, li_y, ll_colwidth - ScaleDPI(10), ScaleDPI(MonthEventHeight))
			
		END IF
	END IF
NEXT
lb_drawmoving = TRUE
NEXT

//Draw +# More label
String ls_moreevents
n_cst_pbus_string lnv_string
lp_startcell.px = 1
lp_startcell.py = 1
lp_endcell = inv_helper.of_GetMonthCell(ld_firstday, ld_lastday, ld_lastday)

li_startdaycell = inv_helper.of_GetDayCellFromPoint(lp_startcell)
li_enddaycell = inv_helper.of_GetDayCellFromPoint(lp_endcell)

li_innercount = li_enddaycell - li_startdaycell + 1

FOR li_innerindex = 1 TO li_innercount
	IF li_dayeventcount[li_innerindex] > li_maxitemsperday AND li_dayeventcount[li_innerindex] > 0 THEN
		lp_startcell.px = Mod(li_innerindex, 7)
		
		IF lp_startcell.px = 0 THEN
			lp_startcell.px = 7
			lp_startcell.py = (li_innerindex / 7)
		ELSE
			lp_startcell.py = (li_innerindex / 7) + 1
		END IF
		
		//Draw more items label
		li_x = (lp_startcell.px - 1) * ll_colwidth
		li_y = ((lp_startcell.py - 1) * ll_rowheight) + ll_rowheight - ScaleDPI(MonthEventHeight) + ScaleDPI(MonthDayNameHeight)
		
		ls_moreevents = lnv_string.of_GlobalReplace(inv_resourcemanager.of_GetString("LBL_PowerSchedule_MoreEvents"), "{eventcount}", String(li_dayeventcount[li_innerindex] - li_maxitemsperday))
		
		of_DrawMonthMoreLink(aul_hdc, ls_moreevents, li_x, li_y, ll_colwidth, ScaleDPI(MonthEventHeight))
		
		istr_morelinks[UpperBound(istr_morelinks) + 1].eventdate = inv_helper.of_GetDateFromCell(ld_firstday, lp_startcell)
		istr_morelinks[UpperBound(istr_morelinks)].rectregion = inv_helper.of_NewRect(li_x, li_y, ll_colwidth, ScaleDPI(MonthEventHeight))
	END IF
NEXT

//Draw New Event
of_DrawMonthNewEvent(aul_hdc, aul_graphics)

//Draw Moving Event
of_DrawMonthMovingEvent(aul_hdc)

//Clean Up
inv_win32.GdipDeletePen(lul_Pen)
inv_win32.GdipDeletePen(lul_CurrentDayPen)
inv_win32.GdipDeleteBrush(ull_DayBrushColor)

RETURN 1
end function

public function integer of_drawmonthmorelink (longptr hdc, string a_text, long a_x, long a_y, long a_width, long a_height);ULong ll_textcolor

ll_textcolor = 0
												  
of_DrawText(hdc, iul_textfont, a_text, ALIGN_CENTER, DT_VCENTER, &
				 a_x, &
				 a_y, &
				 a_width, &
				 a_height, &
				ll_textcolor)	

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

public function integer of_drawmonthmovingevent (longptr hdc);IF NOT ib_eventmoving OR NOT IsValid(istr_movingevent) THEN RETURN 0


RETURN 1
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

public function integer of_workspacewidth ();IF ib_printing THEN
	RETURN il_printwidth
ELSE
	RETURN THIS.Width
END IF
end function

public function integer of_workspaceheight ();IF ib_printing THEN
	RETURN il_printheight
ELSE
	RETURN THIS.Height
END IF
end function

public function integer of_print ();str_scheduleprint lstr_print
lstr_print.theme = Theme
lstr_print.powerschedule = THIS

OpenWithParm(w_pbus_scheduleprint, lstr_print)
RETURN 1
end function

private function integer of_drawevents (longptr hdc, longptr iul_graphics);IF UpperBound(s_loadedevents) = 0 THEN RETURN -1

Long ll_index, ll_count
Long ll_daycount, ll_daywidth

ll_daycount = of_GetDayCount()
ll_daywidth = of_GetDayWidth() - ScaleDPI(8)

//Draw regular day events
FOR ll_index = 1 TO ll_daycount
	IF IsValid(s_mappedevents[ll_index])  THEN
		of_DrawDaysEvents(hdc, iul_graphics, s_mappedevents[ll_index].mappedevents, ll_daywidth, ScaleDPI(2) + TimeWidth + ScaleDPI((ll_index - 1) * 8) + ((ll_index -1) * ll_daywidth))
	END IF
NEXT

RETURN 1
end function

private function integer of_drawdaysevents (longptr hdc, longptr aul_graphics, str_schedulemappedevents mappedevents[], integer al_daywidth, integer al_dayx);str_schedulelayout lstr_layouts[]
str_schedulemappedevents lstr_drawnitems[]
str_schedulelayout lstr_layout
Long ll_index, ll_count
Long ll_innerindex, ll_innercount
Integer li_segmentcount
s_rect eventRect, lstr_empty
Int eventWidth
Int lastX
Long ll_eventindex, ll_eventcount
				
li_segmentcount = 60 / MinAppointmentIncrement

of_CalculateEventConflicts(REF mappedevents, MinAppointmentIncrement, REF lstr_layouts)

ll_count = 24 * li_segmentcount

FOR ll_index = 1 TO ll_count
	lstr_layout = lstr_layouts[ll_index]

	IF IsValid(lstr_layout) THEN
		IF lstr_layout.Count <= 0 THEN CONTINUE
		
		ll_innercount = lstr_layout.Count
		
		FOR ll_innerindex = 1 TO ll_innercount
			str_schedulemappedevents l_event
			
			IF NOT IsValid(lstr_layout.events[ll_innerindex]) THEN CONTINUE
			
			l_event = lstr_layout.events[ll_innerindex]
			
			IF of_EventIndexOf(lstr_drawnitems, l_event) < 1 THEN
				eventRect = lstr_empty
				lastX = 0
						eventWidth = al_daywidth / l_event.overlapcount
				ll_eventcount = UpperBound(lstr_layout.events)
				
				FOR ll_eventindex = 1 TO ll_eventcount				
					IF IsValid(lstr_layout.events[ll_eventindex]) THEN
						 IF lastX < lstr_layout.events[ll_eventindex].xposition THEN
							  lastX = lstr_layout.events[ll_eventindex].xposition 
						END IF
					END IF
				NEXT

				IF lastX + ((eventWidth - 5) * 2) > (al_daywidth) THEN
							 lastX = 0
				END IF

						eventRect.Right = eventWidth - ScaleDPI(5);

				IF lastX > 0 THEN
					eventRect.Left = lastX + eventWidth
				END IF
				
				of_GetHourRangeRectangle(l_event.eventobject.StartDateTime,  l_event.eventobject.EndDateTime, eventRect)
				
				l_event.xposition = Max(eventRect.Left, 1)
				l_event.eventwidth = eventWidth
				l_event.rectregion = inv_helper.of_NewRect(eventRect.Left + al_dayx, eventRect.Top, eventRect.Right, eventRect.Bottom)
				
				//Only draw items that are visible
				IF (eventRect.Top > HeaderHeight OR (eventRect.Top + eventRect.Bottom)  > HeaderHeight) AND &
					 eventRect.Top < of_WorkSpaceHeight() THEN
					of_DrawDayEvent(hdc, aul_graphics, l_event.eventobject, eventRect.Left + al_dayx, eventRect.Top, eventRect.Right, eventRect.Bottom, of_EventIsSelected(l_event))
				END IF
				
				lstr_drawnitems[UpperBound(lstr_drawnitems) + 1] = l_event
			END IF
		NEXT
	END IF
NEXT
				
//Cleanup
ll_count = UpperBound(lstr_layouts)
FOR ll_index = 1 TO ll_count
	DESTROY lstr_layouts[ll_index]
NEXT

RETURN 1

end function

private function integer of_drawdayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean a_selected);//DRAW EVENT BASED ON eventRect
LongPtr ull_BackBrushColor, hRPen
String ls_color, ls_startampm, ls_endampm
Int li_titleheight, li_starthour, li_endhour, li_eventslotheight, li_leftmargin, li_15minuteeventslotheight
String ls_secondline, ls_location, ls_description
boolean lb_small, lb_medium
n_uspb_text_helper lnv_texthelper
n_uspb_colors lnv_colors
ULong ll_textcolor, ll_eventcolor
DateTime ld_enddatetime
Boolean lb_pastevent
Integer li_imageparam

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

ls_startampm = " " + inv_resourcemanager.of_GetString(AM)
ls_endampm = " " + inv_resourcemanager.of_GetString(AM)
li_eventslotheight = TimeRowHeight / (60 / Max(MinAppointmentIncrement, 15)) //the min height will be 15 minute increment

li_15minuteeventslotheight = TimeRowHeight / (60 / 15) //Calculate a 15 minute slot height to see if we need to change font sizes

IF a_height <= li_15minuteeventslotheight THEN
	lb_small =  TRUE
END IF

IF a_height = TimeRowHeight / 2 OR a_height = (TimeRowHeight / 2) - 1 THEN
	lb_medium = TRUE
END IF

// create a brush
hRPen = inv_win32.CreatePen(0,1,ll_eventcolor)
ull_BackBrushColor = CreateSolidBrush(ll_eventcolor)

//Fill rectangle
inv_win32.SelectObject(hdc, ull_BackBrushColor)
inv_win32.SelectObject(hdc, hRPen)

IF a_selected THEN
	of_DrawSelectShadow(aul_graphics, a_x, a_y, a_width, a_height)
END IF

inv_win32.RoundRect( hdc, a_x, &
									 a_y + 1, &
									 a_width + a_x, &
									 a_height + a_y - 1, &
									EventCornerRadius, EventCornerRadius)

//Draw status
of_DrawEventStatus(hdc, a_event, ll_eventcolor, a_x, a_y, a_width, a_height)

ld_enddatetime = a_event.EndDateTime

IF Second(Time(ld_enddatetime)) = 59 THEN
	ld_enddatetime = inv_helper.of_RelativeDateTime(ld_enddatetime, 1)
END IF

li_starthour = Hour(Time(a_event.StartDateTime))
li_endhour = Hour(Time(ld_enddatetime))

IF NOT TimeFormat24Hour AND li_starthour >= 12 THEN
	IF li_starthour > 12 THEN
		li_starthour = li_starthour - 12
	END IF
	ls_startampm = " " + inv_resourcemanager.of_GetString(PM)
END IF

IF NOT TimeFormat24Hour AND li_endhour >= 12 THEN
	IF li_endhour > 12 THEN
		li_endhour = li_endhour - 12
	END IF
	ls_endampm = " " + inv_resourcemanager.of_GetString(PM)
END IF

IF TimeFormat24Hour THEN
	ls_startampm = ""
	ls_endampm = ""
END IF

li_leftmargin = ii_eventleftmargin
ls_secondline = ""

IF NOT HideTime THEN
	IF lb_small OR lb_medium THEN
		ls_secondline = String(li_starthour) + ":" + String(Minute(Time(a_event.StartDateTime)), "00") + ls_startampm
	ELSE
		ls_secondline = String(li_starthour) + ":" + String(Minute(Time(a_event.StartDateTime)), "00") + ls_startampm + &
									  " - " + String(li_endhour) + ":" + String(Minute(Time(ld_enddatetime)), "00") + ls_endampm
	END IF
END IF

IF DisplayLocationInEvent THEN
	IF Len(Trim(a_event.Location)) > 0 THEN
		IF lb_medium OR lb_small THEN
			ls_location = " "
		ELSE
			ls_location = "~r~n"
		END IF
		ls_location += a_event.Location
	END IF
END IF

IF lb_medium THEN
	of_DrawText(hdc, iul_textfontbold, of_GetEventTitle(a_event) + " " + ls_secondline + ls_location, ALIGN_LEFT, DT_VTOP, &
			a_x + li_leftmargin, &
			a_y + ScaleDPI(4), &
			a_width - EventCornerRadius - li_leftmargin, &
			a_height, &
			ll_textcolor)	
ELSEIF lb_small THEN
	of_DrawText(hdc, iul_smallfont, of_GetEventTitle(a_event) + " " + ls_secondline + ls_location, ALIGN_LEFT, DT_VTOP, &
			a_x + li_leftmargin , &
			a_y, &
			a_width - EventCornerRadius - li_leftmargin, &
			a_height, &
			ll_textcolor)		
ELSE
	of_DrawText(hdc, iul_textfontbold, of_GetEventTitle(a_event), ALIGN_LEFT, DT_VTOP, &
			a_x + li_leftmargin, &
			a_y + ScaleDPI(4), &
			a_width - EventCornerRadius - li_leftmargin, &
			a_height, &
			ll_textcolor)	

	li_titleheight = ScaleDPI(6) + lnv_texthelper.of_GetTextHeight(hdc, of_GetEventTitle(a_event), FontName, TextSize, ALIGN_LEFT, a_width - EventCornerRadius - li_leftmargin, TRUE, FALSE, FALSE)
	
	of_DrawWrappedText(hdc, iul_textfont, ls_secondline + ls_location, &
			a_x + li_leftmargin, &
			a_y + li_titleheight , &
			a_width - EventCornerRadius - li_leftmargin, &
			a_height - li_titleheight - 1, &
			ll_textcolor)	
END IF


Integer li_rightadjust
li_rightadjust = ScaleDPI(18)
									  
IF lb_pastevent THEN
	li_imageparam = 5 //ILD_TRANSPARENT | ILD_BLEND50
ELSE
	li_imageparam = ILD_IMAGE
END IF

//Draw icons if event height isn't small (15 minute increment)
IF NOT lb_small THEN
	IF a_event.IsPrivate THEN
		
		inv_win32.ImageList_DrawEx(il_imagelistsmall, &
						  il_privateimage, &
						  hdc, &
						  a_x + a_width - li_rightadjust, &
						  a_y + a_height - ScaleDPI(18), &
						  ScaleDPI(16),ScaleDPI(16), &
						  ll_eventcolor, 4294967295, li_imageparam )
		li_rightadjust += ScaleDPI(18)
	END IF
	
	IF a_event.IsRecurring THEN
		inv_win32.ImageList_DrawEx(il_imagelistsmall, &
						  il_recurringimage, &
						  hdc, &
						  a_x + a_width - li_rightadjust, &
						  a_y + a_height - ScaleDPI(18), &
						  ScaleDPI(16),ScaleDPI(16),  &
						  ll_eventcolor, 4294967295, li_imageparam )
		li_rightadjust += ScaleDPI(18)
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
END IF

//cleanup
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(ull_BackBrushColor)

RETURN 1
end function

private function integer of_drawdayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height);RETURN of_DrawDayEvent(hdc, aul_graphics, a_event, a_x, a_y, a_width, a_height, FALSE)
end function

private function integer of_drawmovingevent (longptr hdc, longptr aul_graphics);IF NOT ib_eventmoving OR NOT IsValid(istr_movingevent) THEN RETURN 0

Integer li_x, li_y, li_width, li_height, li_eventslotheight
Long  ll_daywidth
	
ll_daywidth = of_GetDayWidth()
li_x = (Integer((il_lastxpos - TimeWidth) / ll_daywidth) * ll_daywidth) + TimeWidth

IF istr_movingevent.DisplayAsAllDayEvent THEN
	li_width = ((DaysAfter(Date(istr_movingevent.eventobject.StartDateTime), Date(istr_movingevent.eventobject.EndDateTime)) + 1) * ll_daywidth - ScaleDPI(8))
	
	of_DrawFullDayEvent(hdc, aul_graphics, istr_movingevent.eventobject, li_x, HeaderHeight, li_width, ScaleDPI(DefaultFullDayHeight), FALSE, FALSE)
ELSE
	
	li_width = ll_daywidth
	s_rect eventRect
	
	of_GetHourRangeRectangle(istr_movingevent.eventobject.StartDateTime, istr_movingevent.eventobject.EndDateTime, eventRect)
	li_height = eventRect.Bottom
	li_y = eventRect.Top
	of_DrawDayEvent(hdc, aul_graphics, istr_movingevent.eventobject, li_x, li_y, li_width, li_height)
	
END IF

RETURN 1
end function

private function integer of_drawnewevent (longptr hdc, longptr aul_graphics);IF NOT IsValid(istr_newevent) THEN RETURN 0
IF NOT CreateNewEventOnMouseDrag THEN RETURN 0

Long li_x, li_y, li_width, li_height, li_eventslotheight
Long  ll_daywidth
Time lt_newtime
DateTime ldt_newstart, ldt_newend
s_rect eventRect
	
ll_daywidth = of_GetDayWidth()

IF istr_newevent.eventobject.AllDayEvent THEN
	li_x = TimeWidth + ((DaysAfter(id_StartDate, Date(i_newevent.StartDateTime)) ) * ll_daywidth)
	li_width = ((DaysAfter(Date(i_newevent.StartDateTime), Date(i_newevent.EndDateTime)) + 1) * ll_daywidth - ScaleDPI(8))
	
	of_DrawFullDayEvent(hdc, aul_graphics, i_newevent, li_x, HeaderHeight, li_width, ScaleDPI(DefaultFullDayHeight), FALSE, FALSE)
ELSE
	
	li_x =  (DaysAfter(id_StartDate, Date(i_newevent.StartDateTime)) * ll_daywidth) + TimeWidth
	li_width = ll_daywidth
	
	of_GetHourRangeRectangle(i_newevent.StartDateTime, i_newevent.EndDateTime , eventRect)
	
	li_height = eventRect.Bottom
	li_y = eventRect.Top
	
	of_DrawDayEvent(hdc, aul_graphics, i_newevent, li_x, li_y, li_width, li_height)
	
END IF

RETURN 1
end function

private function integer of_drawfulldayevents (longptr hdc, longptr aul_graphics, integer al_daywidth);Long ll_index, ll_innerindex, ll_count, ll_innercount
Int li_numdays, li_eventcount, li_eventorder
Int li_counts[], li_ys[]
Int li_nexty, li_x, li_width
Date id_workingdate
Boolean lb_startsbeforeweek, lb_endsafterweek
Int ll_headerrows
Int ll_headerGrid[10,100]
Int ll_column, ll_row

li_numdays = of_GetDayCount()
ll_headerrows = FullDayHeight / ScaleDPI(DefaultFullDayHeight)

//Preload count array. This array tracks the number of all day events per day. We need the max count to adjust our all day row height
li_counts[li_numdays] = 0
li_ys[li_numdays] = 0

ll_count = UpperBound(s_loadedevents)

//Loop through all the events and look for all day events
FOR ll_index = 1 TO ll_count
	IF s_loadedevents[ll_index].IsMoving THEN CONTINUE
	
	IF s_loadedevents[ll_index].DisplayAsAllDayEvent THEN
		
		IF Date(s_loadedevents[ll_index].eventobject.EndDateTime) < id_StartDate THEN CONTINUE
		IF Date(s_loadedevents[ll_index].eventobject.StartDateTime) >= RelativeDate(id_StartDate, li_numdays) THEN CONTINUE
		
		li_nexty = 0
		
		//Calculate required column
		FOR ll_innerindex = 1 TO li_numdays
			li_counts[ll_innerindex] = 0
			id_workingdate = RelativeDate(id_StartDate, ll_innerindex - 1)
			
			//If an all day event falls withing one of the days of the week, track the count
			IF id_workingdate >= Date(s_loadedevents[ll_index].eventobject.StartDateTime) AND &
			    id_workingdate <= Date(s_loadedevents[ll_index].eventobject.EndDateTime) THEN
				 li_counts[ll_innerindex] = 1
			END IF
		NEXT
		
		Boolean lb_continue
		ll_row = 1
		lb_continue = TRUE
		
		//Find an empty spot in our grid.
		DO UNTIL NOT lb_continue OR ll_row > 100
			FOR ll_innerindex = 1 TO li_numdays
				IF li_counts[ll_innerindex] = 1 THEN
					IF ll_headerGrid[ll_innerindex, ll_row] = 0 THEN
						lb_continue = FALSE
					ELSE
						lb_continue = TRUE
						EXIT
					END IF
				END IF
			NEXT
			
			IF NOT lb_continue THEN EXIT
			
			ll_row++
		LOOP
		
		FOR ll_innerindex = 1 TO li_numdays
			IF li_counts[ll_innerindex] = 1 THEN
				ll_headerGrid[ll_innerindex, ll_row] = 1
			END IF
		NEXT
		
		li_nexty = (ll_row - 1) * ScaleDPI(DefaultFullDayHeight)
		
		IF Date(s_loadedevents[ll_index].eventobject.StartDateTime) < id_StartDate THEN
			li_x = TimeWidth
			lb_startsbeforeweek = TRUE
		ELSE
			li_x = TimeWidth + ((DaysAfter(id_StartDate, Date(s_loadedevents[ll_index].eventobject.StartDateTime)) ) * al_daywidth)
			lb_startsbeforeweek = FALSE
		END IF
		
		li_x += 2
		
		Date ld_startdate, ld_enddate
		
		IF Date(s_loadedevents[ll_index].eventobject.StartDateTime) < id_StartDate THEN
			ld_startdate = id_StartDate
		ELSE
			ld_startdate =  Date(s_loadedevents[ll_index].eventobject.StartDateTime)
		END IF
		
		IF Date(s_loadedevents[ll_index].eventobject.EndDateTime) > RelativeDate(id_StartDate, li_numdays - 1) THEN
			ld_enddate = RelativeDate(id_StartDate, li_numdays - 1)
		ELSE
			ld_enddate =  Date(s_loadedevents[ll_index].eventobject.EndDateTime)
		END IF
		
		li_width = ((DaysAfter(ld_startdate, ld_enddate) + 1) * al_daywidth - ScaleDPI(13))
		
		IF Date(s_loadedevents[ll_index].eventobject.EndDateTime) > RelativeDate(id_StartDate, li_numdays - 1) THEN
			lb_endsafterweek = TRUE
		ELSE
			lb_endsafterweek = FALSE
		END IF
		
		s_loadedevents[ll_index].rectregion = inv_helper.of_NewRect(li_x, li_nexty + ScaleDPI(DefaultHeaderHeight), li_width,  ScaleDPI(DefaultFullDayHeight))
		
		of_DrawFullDayEvent(hdc, aul_graphics, s_loadedevents[ll_index].eventobject, li_x, li_nexty + ScaleDPI(DefaultHeaderHeight), li_width, ScaleDPI(DefaultFullDayHeight), lb_startsbeforeweek, lb_endsafterweek, of_EventIsSelected(s_loadedevents[ll_index]))
	END IF
NEXT

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
IF Date(a_event.EndDateTime) < Today() THEN
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

Integer li_align

IF li_titlewidth > li_titlespace THEN
	li_align = ALIGN_LEFT
ELSE
	li_align = ALIGN_CENTER
END IF

of_DrawText(hdc, iul_textfontbold, of_GetEventTitle(a_event), li_align, DT_VCENTER, &
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
scheduleevent s_newevents[]
scheduleevent lstr_deletedevent

IF Event EventDeleting(astr_event.eventobject) = 1 THEN			
	IF ISValid(astr_event) THEN
		ll_count = UpperBound(s_loadedevents)
		
		lstr_deletedevent = astr_event.eventobject
		
		FOR ll_index = 1 TO ll_count
			IF s_loadedevents[ll_index] = astr_event THEN
				DESTROY s_loadedevents[ll_index]
			ELSE
				ll_newindex++
				s_newevents[ll_newindex] = s_loadedevents[ll_index].eventobject
			END IF
		NEXT
		
		Event EventDeleted(lstr_deletedevent)
		
		of_LoadEvents(s_newevents)
	END IF
END IF

RETURN 1
end function

public function integer of_drawmonthnewevent (longptr hdc, longptr aul_graphics);IF NOT IsValid(istr_newevent) THEN RETURN 0

Integer li_x, li_y, li_width, li_height

li_x = istr_newevent.RectRegion.Left
li_y = istr_newevent.RectRegion.Top
li_width = istr_newevent.RectRegion.Right - istr_newevent.RectRegion.Left
li_height = istr_newevent.RectRegion.Bottom - istr_newevent.RectRegion.Top

of_DrawMonthFullDayEvent(hdc, aul_graphics, istr_newevent.eventobject, li_x, li_y, li_width, li_height, FALSE)

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

public function integer of_drawmonthfulldayevent (longptr hdc, longptr aul_graphics, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean ab_selected);LongPtr ull_BackBrushColor, hRPen
String ls_color, ls_text, ls_startampm
ULong ll_textcolor, ll_eventcolor
Int li_starthour
n_uspb_colors lnv_colors
Boolean lb_pastevent
Integer li_imageparam

ll_eventcolor = a_event.Color
ll_textcolor = a_event.TextColor

IF ll_eventcolor = 0 THEN
	ls_color = "peacock"
	ll_eventcolor = of_getcolor(ls_color)
END IF

//Past event
IF Date(a_event.EndDateTime) < Today() THEN
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
									
IF a_event.AllDayEvent OR HideTime THEN
	ls_text = of_GetEventTitle(a_event)
ELSE
	ls_text = String(Time(a_event.StartDateTime), "hh:mm") + " " + of_GetEventTitle(a_event)
	
	ls_startampm = " " + inv_resourcemanager.of_GetString(AM)
	li_starthour = Hour(Time(a_event.StartDateTime))
	
	IF NOT TimeFormat24Hour AND li_starthour > 12 THEN
		li_starthour = li_starthour - 12
		ls_startampm = " " + inv_resourcemanager.of_GetString(PM)
	END IF
	
	IF TimeFormat24Hour THEN
		ls_startampm = ""
	END IF
	
	ls_text = String(li_starthour) + ":" + String(Minute(Time(a_event.StartDateTime)), "00") + ls_startampm + " " + of_GetEventTitle(a_event)
END IF				  


of_DrawText(hdc, iul_textfont, ls_text, ALIGN_LEFT, DT_VCENTER, &
				 a_x + 8, &
				 a_y, &
				 a_width - ScaleDPI(8), &
				 a_height, &
				ll_textcolor)	

Integer li_rightadjust = 20

IF lb_pastevent THEN
	li_imageparam = 5 //ILD_TRANSPARENT | ILD_BLEND50
ELSE
	li_imageparam = ILD_IMAGE
END IF

//Draw icons
IF a_event.IsPrivate THEN
	
		inv_win32.ImageList_DrawEx(il_imagelistsmall, &
						  il_privateimage, &
						  hdc, &
						  a_x + a_width - li_rightadjust, &
						  a_y + ((a_height - ScaleDPI(16)) / 2), &
						  ScaleDPI(16),ScaleDPI(16), &
						  ll_eventcolor, 4294967295, li_imageparam )
		li_rightadjust += ScaleDPI(18)

END IF

IF a_event.IsRecurring THEN

		inv_win32.ImageList_DrawEx(il_imagelistsmall, &
						  il_recurringimage, &
						  hdc, &
						  a_x + a_width - li_rightadjust, &
						  a_y + ((a_height - ScaleDPI(16)) / 2), &
						  ScaleDPI(16),ScaleDPI(16),  &
						  ll_eventcolor, 4294967295, li_imageparam )
		li_rightadjust += ScaleDPI(18)

END IF

IF a_event.IsMeeting THEN
	inv_win32.ImageList_DrawEx(il_imagelistsmall, &
					  il_meetingimage, &
					  hdc, &
					  a_x + a_width - li_rightadjust, &
					  a_y + ((a_height - ScaleDPI(16)) / 2), &
					  ScaleDPI(16),ScaleDPI(16),  &
					  ll_eventcolor, 4294967295, li_imageparam )
	li_rightadjust += ScaleDPI(18)
END IF

//cleanup
DeleteObject(hRPen)
DeleteObject(ull_BackBrushColor)

RETURN 1
end function

public function integer of_drawmonthdayevent (longptr aul_graphics, longptr hdc, scheduleevent a_event, long a_x, long a_y, long a_width, long a_height, boolean ab_selected, boolean ab_highlighted);LongPtr ull_DayBrushColor, hRPen, ull_BackBrushColor
String ls_color, ls_text, ls_startampm
ULong ll_textcolor, ll_eventcolor
Int li_starthour, li_red, li_green, li_blue
ULong ll_imagebackground
n_uspb_colors lnv_colors


ll_eventcolor = a_event.Color

IF ll_eventcolor = 0 THEN
	ls_color = "peacock"
	ll_eventcolor = of_getcolor(ls_color)
END IF


//Past event
IF Date(a_event.EndDateTime) < Today() THEN
	ll_eventcolor = lnv_colors.of_LightenColor(180, ll_eventcolor)
END IF

lnv_colors.of_SplitRGB(ll_eventcolor, li_red, li_green, li_blue)
ll_eventcolor = inv_win32.PBUSMakeARGB (255, li_red, li_green, li_blue)
ll_textcolor = 0

ll_imagebackground = RGB(255,255,255)

IF ab_selected THEN
	of_DrawSelectShadow(aul_graphics, a_x, a_y, a_width, a_height)
	
	//Fill rectangle
	hRPen = inv_win32.CreatePen(0,1,RGB(255,255,255))
	ull_BackBrushColor = CreateSolidBrush(RGB(255,255,255))
	inv_win32.SelectObject(hdc, ull_BackBrushColor)
	inv_win32.SelectObject(hdc, hRPen)
	
	inv_win32.RoundRect( hdc, a_x, &
										 a_y, &
										 a_x + a_width, &
										 a_y + a_height, &
										EventCornerRadius, EventCornerRadius)
										
	DeleteObject(hRPen)
	DeleteObject(ull_BackBrushColor)
										
END IF

IF ab_highlighted THEN
	//Fill rectangle
	ll_imagebackground = RGB(240,240,240)
	
	hRPen = inv_win32.CreatePen(0,1,RGB(240,240,240))
	ull_BackBrushColor = CreateSolidBrush(RGB(240,240,240))
	inv_win32.SelectObject(hdc, ull_BackBrushColor)
	inv_win32.SelectObject(hdc, hRPen)
	
	inv_win32.RoundRect( hdc, a_x, &
										 a_y, &
										 a_x + a_width, &
										 a_y + a_height, &
										EventCornerRadius, EventCornerRadius)
										
	DeleteObject(hRPen)
	DeleteObject(ull_BackBrushColor)
END IF

inv_win32.GdipCreateSolidFill(ll_eventcolor, ull_DayBrushColor)

inv_win32.GdipFillEllipseI(aul_graphics, ull_DayBrushColor,&
												a_x + ScaleDPI(4), &
												 a_y + ((a_height - ScaleDPI(12)) / 2) - 1, &
												 ScaleDPI(12), ScaleDPI(12))
									
ls_startampm = " " + inv_resourcemanager.of_GetString(AM)
li_starthour = Hour(Time(a_event.StartDateTime))

IF NOT TimeFormat24Hour AND li_starthour >= 12 THEN
	IF li_starthour > 12 THEN
		li_starthour = li_starthour - 12
	END IF
	ls_startampm = " " + inv_resourcemanager.of_GetString(PM)
END IF

IF TimeFormat24Hour THEN
	ls_startampm = ""
END IF

IF NOT HideTime THEN
	ls_text = String(li_starthour) + ":" + String(Minute(Time(a_event.StartDateTime)), "00") + ls_startampm + " " + of_GetEventTitle(a_event)
ELSE
	ls_text = of_GetEventTitle(a_event)
END IF

of_DrawText(hdc, iul_textfont, ls_text, ALIGN_LEFT, DT_VCENTER, &
				 a_x + ScaleDPI(24), &
				 a_y, &
				 a_width - ScaleDPI(24), &
				 a_height, &
				ll_textcolor)	

Integer li_rightadjust
li_rightadjust = ScaleDPI(20)

//Draw icons if event height isn't small (15 minute increment)
IF a_event.IsPrivate THEN
	
		inv_win32.ImageList_DrawEx(il_imagelistsmall, &
						  il_privateimage, &
						  hdc, &
						  a_x + a_width - li_rightadjust, &
						  a_y + ((a_height - ScaleDPI(16)) / 2), &
						  ScaleDPI(16),ScaleDPI(16), &
						  ll_imagebackground, 4294967295, ILD_IMAGE )
		li_rightadjust += ScaleDPI(18)

END IF

IF a_event.IsRecurring THEN

		inv_win32.ImageList_DrawEx(il_imagelistsmall, &
						  il_recurringimage, &
						  hdc, &
						  a_x + a_width - li_rightadjust, &
						  a_y + ((a_height - ScaleDPI(16)) / 2), &
						  ScaleDPI(16),ScaleDPI(16),  &
						  ll_imagebackground, 4294967295, ILD_IMAGE )
		li_rightadjust += ScaleDPI(18)

END IF

IF a_event.IsMeeting THEN
	inv_win32.ImageList_DrawEx(il_imagelistsmall, &
					  il_meetingimage, &
					  hdc, &
					  a_x + a_width - li_rightadjust, &
					  a_y + ((a_height - ScaleDPI(16)) / 2), &
					  ScaleDPI(16),ScaleDPI(16),  &
					  ll_imagebackground, 4294967295, ILD_IMAGE )
	li_rightadjust += ScaleDPI(18)
END IF


//cleanup
inv_win32.GdipDeleteBrush(ull_DayBrushColor)

RETURN 1
end function

public function boolean of_eventismouseover (str_schedulemappedevents a_event);IF NOT IsValid(istr_mouseoverevent) THEN RETURN FALSE
IF istr_mouseoverevent = a_event THEN RETURN TRUE

RETURN FALSE
end function

public function integer of_changecursor (long al_x, long al_y);Long ll_index, ll_count
ll_count = UpperBound(s_loadedevents)

 IF ib_eventresizing AND IsValid(istr_movingevent) THEN
	IF 	istr_movingevent.DisplayAsAllDayEvent THEN
		IF THIS.Pointer <> 'SizeWE!' THEN SetPointer(SizeWE!)
	ELSE
		IF THIS.Pointer <> 'SizeNS!' THEN SetPointer(SizeNS!)
	END IF
	RETURN 3
END IF

FOR ll_index = 1 TO ll_count
	
	IF al_x > s_loadedevents[ll_index].rectregion.Left AND al_y >  s_loadedevents[ll_index].rectregion.Top AND &
	    al_x <  s_loadedevents[ll_index].rectregion.Right AND al_y <  s_loadedevents[ll_index].rectregion.Bottom THEN
		 
		 IF al_y < HeaderHeight AND NOT s_loadedevents[ll_index].DisplayAsAllDayEvent THEN CONTINUE

		 IF NOT s_loadedevents[ll_index].DisplayAsAllDayEvent AND &
		 	 (al_y - s_loadedevents[ll_index].rectregion.Top <= ii_resizebordersize OR &
			 s_loadedevents[ll_index].rectregion.Bottom - al_y <= ii_resizebordersize) THEN
			 
			 IF THIS.Pointer <> 'SizeNS!' THEN SetPointer(SizeNS!)
			RETURN 3
		ELSEIF s_loadedevents[ll_index].DisplayAsAllDayEvent AND &
		 	 (al_x - s_loadedevents[ll_index].rectregion.Left <= ii_resizebordersize OR &
			 s_loadedevents[ll_index].rectregion.Right - al_x <= ii_resizebordersize) THEN
			 
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
									 a_y + ScaleDPI(1), &
									 ScaleDPI(6) + a_x , &
									 a_height + a_y - ScaleDPI(1))
		
		inv_win32.SelectClipRgn(hdc, hRgn)
		
		DO WHILE TRUE
			li_liney = a_y + (li_linecount * 6) + ScaleDPI(2)
			
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
			li_liney = a_y + (li_linecount * 6) + (EventCornerRadius / 2)
			
			IF li_liney > a_y + a_height THEN EXIT
		
			inv_win32.Movetoex(hdc, a_x + ScaleDPI(1), li_liney, lp)
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

public function integer of_changecursormonth (long al_x, long al_y);Long ll_index, ll_regionindex, ll_count, ll_regioncount
Boolean lb_start

ll_count = UpperBound(s_loadedevents)

 IF ib_eventresizing AND IsValid(istr_movingevent) THEN
	IF 	istr_movingevent.DisplayAsAllDayEvent THEN
		IF THIS.Pointer <> 'SizeWE!' THEN SetPointer(SizeWE!)
	END IF
	RETURN 3
END IF

IF of_CursorOverMonthResizeHandle(al_x, al_y, lb_start) THEN
	 IF THIS.Pointer <> 'SizeWE!' THEN SetPointer(SizeWE!)
	RETURN 3
END IF
				
 IF THIS.Pointer <> 'Arrow!' THEN SetPointer(Arrow!)

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

public function integer of_updateselection (long al_x, long al_y);IF DefaultView = MONTH THEN of_UpdateSelectionMonth(al_x, al_y)

DateTime ldt_newend, ldt_newstart, lt_newdatetime
Long li_eventslotheight
Time lt_base

IF IsValid(istr_selectedcell) THEN
	
	IF istr_selectedcell.eventobject.AllDayEvent THEN
					
		lt_newdatetime = DateTime(Date(of_FindClosestDateTime(al_x, al_y)), lt_base)
		
		ldt_newstart = istr_selectedcell.eventobject.StartDateTime
		ldt_newend = istr_selectedcell.eventobject.EndDateTime
		
		IF lt_newdatetime > idt_selectedtime THEN
			ldt_newstart = idt_selectedtime
			ldt_newend = lt_newdatetime
		ELSE
			ldt_newstart = lt_newdatetime
			ldt_newend = idt_selectedendtime
		END IF
		
	ELSE				
		int ll_min
		
		ll_min = MinAppointmentIncrement
		
		MinAppointmentIncrement = Max(MinCellSelectionsIncrement, MinAppointmentIncrement)

		li_eventslotheight = TimeRowHeight / (60 /  MinAppointmentIncrement)
		
		al_y = al_y + (li_eventslotheight / 2)
		
		lt_newdatetime = of_FindClosestDateTime(il_lastxpos, al_y)
	
		IF lt_newdatetime > idt_selectedtime THEN
			ldt_newstart = idt_selectedtime
			ldt_newend = lt_newdatetime
		ELSE
			ldt_newstart = lt_newdatetime
			ldt_newend = idt_selectedendtime
		END IF
	
		MinAppointmentIncrement = ll_min
	
		ldt_newstart = istr_selectedcell.eventobject.StartDateTime
		ldt_newend = istr_selectedcell.eventobject.EndDateTime
		
		IF lt_newdatetime > idt_selectedtime THEN
			ldt_newstart = idt_selectedtime
			ldt_newend = lt_newdatetime
		ELSE
			ldt_newstart = lt_newdatetime
			ldt_newend = idt_selectedendtime
		END IF
	END IF
		
	istr_selectedcell.eventobject.StartDateTime = ldt_newstart
	istr_selectedcell.eventobject.EndDateTime = ldt_newend

	SetRedraw(TRUE)
END IF

RETURN 1
end function

private function integer of_drawselection (longptr hdc, longptr aul_graphics);IF CreateNewEventOnMouseDrag THEN RETURN 0
IF NOT IsValid(istr_selectedcell) THEN RETURN 0

Long li_x, li_y, li_width, li_height, li_eventslotheight
Long  ll_daywidth
Time lt_newtime
DateTime ldt_newstart, ldt_newend
s_rect eventRect
	
ll_daywidth = of_GetDayWidth()

IF NOT istr_selectedcell.eventobject.AllDayEvent THEN
	
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

	li_eventslotheight = TimeRowHeight / (60 / Max(MinCellSelectionsIncrement, MinAppointmentIncrement))
	li_days = DaysAfter(Date(istr_selectedcell.eventobject.StartDateTime), Date(istr_selectedcell.eventobject.EndDateTime)) + 1
	
	FOR li_index = 1 TO li_days
	
		IF li_index = 1 THEN
			ldt_start = istr_selectedcell.eventobject.StartDateTime
		ELSE
			ldt_start = DateTime(RelativeDate(Date(istr_selectedcell.eventobject.StartDateTime), (li_index - 1)))
		END IF
		
		IF li_index = li_days THEN
			ldt_end = istr_selectedcell.eventobject.EndDateTime
		ELSE
			ldt_end = DateTime(RelativeDate(Date(istr_selectedcell.eventobject.EndDateTime), (li_index - 1)), Time(23,59,59))
		END IF
			
		li_x =  (DaysAfter(id_StartDate, Date(ldt_start)) * ll_daywidth) + TimeWidth
		li_width = ll_daywidth
		
		of_GetHourRangeRectangle(ldt_start, ldt_end , eventRect)
		
		li_height = eventRect.Bottom
		
		li_linecount = (li_height / li_eventslotheight)
		
		li_height = li_linecount * li_eventslotheight
		
		li_y = eventRect.Top
		
		inv_win32.RoundRect( hdc, li_x, &
											 li_y + 1, &
											 li_width + li_x, &
											 li_height + li_y - 1, &
											0, 0)
		
		
		
		FOR li_lineindex = 1 TO li_linecount
			IF li_y + (li_lineindex * li_eventslotheight) > li_height + li_y - 1 THEN CONTINUE
			inv_win32.GdipDrawLine (aul_graphics, lul_pen, li_x, li_y + (li_lineindex * li_eventslotheight),  li_width + li_x, li_y + (li_lineindex * li_eventslotheight))
		NEXT										
	NEXT

	//cleanup
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(ull_BackBrushColor)
	inv_win32.GdipDeletePen(lul_Pen)
	
END IF

RETURN 1
end function

private function integer of_drawselectionfullday (longptr hdc, longptr aul_graphics);IF CreateNewEventOnMouseDrag THEN RETURN 0
IF NOT IsValid(istr_selectedcell) THEN RETURN 0

Long li_x, li_y, li_width, li_height, li_eventslotheight
Long  ll_daywidth
Time lt_newtime
DateTime ldt_newstart, ldt_newend
s_rect eventRect
LongPtr ull_BackBrushColor, hRPen
ULong ll_color
Integer li_days, li_index, li_lineindex, li_linecount
DateTime ldt_start, ldt_end
LongPtr lul_pen

ll_daywidth = of_GetDayWidth()

IF istr_selectedcell.eventobject.AllDayEvent OR Date(istr_selectedcell.eventobject.StartDateTime) < Date(istr_selectedcell.eventobject.EndDateTime) THEN
	li_x = TimeWidth + ((DaysAfter(id_StartDate, Date(istr_selectedcell.eventobject.StartDateTime)) ) * ll_daywidth)
	li_width = ((DaysAfter(Date(istr_selectedcell.eventobject.StartDateTime), Date(istr_selectedcell.eventobject.EndDateTime)) + 1) * ll_daywidth - ScaleDPI(8))
	
	ll_color = inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1')
	hRPen = inv_win32.CreatePen(0,1,ll_color)
	ull_BackBrushColor = CreateSolidBrush(ll_color)
	
	inv_win32.SelectObject(hdc, ull_BackBrushColor)
	inv_win32.SelectObject(hdc, hRPen)
	
	li_days = DaysAfter(Date(istr_selectedcell.eventobject.StartDateTime), Date(istr_selectedcell.eventobject.EndDateTime)) + 1

	FOR li_index = 1 TO li_days
		IF li_index = 1 THEN
			ldt_start = istr_selectedcell.eventobject.StartDateTime
		ELSE
			ldt_start = DateTime(RelativeDate(Date(istr_selectedcell.eventobject.StartDateTime), (li_index - 1)))
		END IF

		IF li_index = li_days THEN
			ldt_end = istr_selectedcell.eventobject.EndDateTime
		ELSE
			ldt_end = DateTime(RelativeDate(Date(istr_selectedcell.eventobject.EndDateTime), (li_index - 1)), Time(23,59,59))
		END IF

		li_x =  (DaysAfter(id_StartDate, Date(ldt_start)) * ll_daywidth) + TimeWidth
		li_width = ll_daywidth
		li_y = ScaleDPI(DefaultHeaderHeight) - 10
		li_height = HeaderHeight - li_y
		
		inv_win32.RoundRect( hdc, li_x, &
											 li_y + 1, &
											 li_width + li_x, &
											 li_height + li_y - 1, &
											0, 0)
	NEXT
	
	inv_win32.DeleteObject(hRPen)
	inv_win32.DeleteObject(ull_BackBrushColor)

END IF

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

public function integer of_addevent (scheduleevent a_event);ScheduleEvent lstr_events[]

of_GetLoadedEvents(lstr_events)

lstr_events[UpperBound(lstr_events) + 1] = a_event

RETURN of_LoadEvents(lstr_events)
end function

public function integer of_deleteevent (long eventid);Long ll_index, ll_count, ll_newindex
scheduleevent s_newevents[]
str_schedulemappedevents lstr_deletedevent

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	IF s_loadedevents[ll_index].eventobject.EventId = eventid THEN
		lstr_deletedevent = s_loadedevents[ll_index]
		EXIT
	END IF
NEXT

IF IsValid(lstr_deletedevent) THEN
		FOR ll_index = 1 TO ll_count
			IF s_loadedevents[ll_index] = lstr_deletedevent THEN
				DESTROY s_loadedevents[ll_index]
			ELSE
				ll_newindex++
				s_newevents[ll_newindex] = s_loadedevents[ll_index].eventobject
			END IF
		NEXT

		RETURN of_LoadEvents(s_newevents)
END IF

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
	RETURN -1
END IF

of_GetLoadedEvents(lstr_events)
of_LoadEvents(lstr_events)

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
	
	of_GetLoadedEvents(l_events)
	of_LoadEvents(l_events)
	
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
					
					of_GetLoadedEvents(l_events)
					of_LoadEvents(l_events)
				END IF
			END IF
		ELSE
			of_GetLoadedEvents(l_events)
			of_LoadEvents(l_events)
		END IF
	END IF
END IF

RETURN 1
end function

public function integer of_getselection (ref datetime startdatetime, ref datetime enddatetime, ref boolean alldayevent);IF IsValid(istr_selectedcell) THEN
	
	StartDateTime = istr_selectedcell.eventobject.StartDateTime
	EndDateTime = istr_selectedcell.eventobject.EndDateTime
	alldayevent = istr_selectedcell.eventobject.AllDayEvent
	
	RETURN 1
END IF


RETURN -1
end function

public function integer of_settimerowheight (integer ai_value);scheduleevent l_events[]

OriginalTimeRowHeight = ScaleDPI(ai_value)

TimeRowHeight = OriginalTimeRowHeight - Mod(OriginalTimeRowHeight, 60 / MinAppointmentIncrement)

Event Resize(99, THIS.Width, THIS.Height)
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setminappointmentincrement (integer ai_value);MinAppointmentIncrement = ai_value
of_SetTimeRowHeight(OriginalTimeRowHeight)
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

of_GetLoadedEvents(l_events)
of_LoadEvents(l_events)

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

IF DefaultView = Month AND NOT istr_selectedevent.eventobject.AllDayEvent THEN
	li_xadjust = ScaleDPI(24) - ii_eventleftmargin
	ll_eventcolor = RGB(255,255,255)
	ll_textcolor = 0
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
li_titleheight = ScaleDPI(6) + lnv_texthelper.of_GetTextHeight(ll_dc, of_GetEventTitle(istr_selectedevent.eventobject), FontName, TextSize, ALIGN_LEFT, 10, TRUE, FALSE, FALSE)
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
	
	lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)
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

private function integer of_drawselectionmonth (longptr hdc, longptr aul_graphics);IF CreateNewEventOnMouseDrag THEN RETURN 0
IF NOT IsValid(istr_selectedcell) THEN RETURN 0

Long li_x, li_y, li_width, li_height, li_eventslotheight
Long  ll_daywidth, ll_colwidth, ll_rowheight
Time lt_newtime
DateTime ldt_newstart, ldt_newend
s_rect eventRect
Point lp_cell
str_scheduledimensions lstr_grid
Int HeaderAdjust
Int DayNumberHeight

HeaderAdjust = ScaleDPI(10)
DayNumberHeight = ScaleDPI(28)

ll_daywidth = of_GetDayWidth()
	
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

lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)
ll_rowheight = lstr_grid.RowHeight
ll_colwidth = lstr_grid.ColumnWidth

li_days = DaysAfter(Date(istr_selectedcell.eventobject.StartDateTime), Date(istr_selectedcell.eventobject.EndDateTime)) + 1

FOR li_index = 1 TO li_days

	IF li_index = 1 THEN
		ldt_start = istr_selectedcell.eventobject.StartDateTime
	ELSE
		ldt_start = DateTime(RelativeDate(Date(istr_selectedcell.eventobject.StartDateTime), (li_index - 1)))
	END IF
	
	lp_cell = inv_helper.of_GetMonthCell(lstr_grid.StartDate, lstr_grid.EndDate, Date(ldt_start))
	
	li_x = (lp_cell.px - 1) * ll_colwidth
	li_y = ((lp_cell.py - 1) * ll_rowheight) + ScaleDPI(MonthDayNameHeight) + HeaderAdjust + DayNumberHeight
	li_width = ll_colwidth
	li_height = ll_rowheight
	
	inv_win32.RoundRect( hdc, li_x, &
										 li_y + 1, &
										 li_width + li_x, &
										 li_height + li_y - 1 - HeaderAdjust - DayNumberHeight, &
										0, 0)
									
NEXT

//cleanup
inv_win32.DeleteObject(hRPen)
inv_win32.DeleteObject(ull_BackBrushColor)
inv_win32.GdipDeletePen(lul_Pen)

RETURN 1
end function

public function integer of_getdaterange (ref date ad_start, ref date ad_end);IF DefaultView = Month THEN
	str_scheduledimensions lstr_grid
	
	lstr_grid = inv_helper.of_GetGridDimensions(id_StartDate, THIS)
	
	ad_start = lstr_grid.StartDate
	ad_end = lstr_grid.EndDate
	
ELSE
	ad_start = id_StartDate
	ad_end = RelativeDate(ad_start, of_GetDayCount() - 1)
END IF

RETURN 1
end function

public function integer of_hidetime (boolean ab_switch, boolean ab_redraw);IF ab_switch THEN
	TimeWidth = 0
ELSE
	TimeWidth = ScaleDPI(DefaultTimeWidth)
END IF

HideTime = ab_switch

IF ab_redraw THEN
	SetRedraw(TRUE)
END IF

RETURN 1
end function

on u_cst_powerschedule_core.create
int iCurrent
call super::create
this.uo_scroll=create uo_scroll
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_scroll
end on

on u_cst_powerschedule_core.destroy
call super::destroy
destroy(this.uo_scroll)
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

IF DefaultView = MONTH THEN
	of_DrawMonthGrid(lul_Graphic, hdc)
ELSE
	of_DrawGrid(lul_Graphic, hdc)
END IF

IF ib_printing THEN
	//Draw footer
	of_DrawText(hdc, iul_textfont, is_printtitle, ALIGN_LEFT, DT_VTOP, &
	      0,0, &
		 UnitsToPixels(of_WorkSpaceWidth(), XUnitsToPixels!), 20, &
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
inv_titleedittimer.iuo_schedule = THIS

of_SetCurrentDate(Today())
of_SetTimeRowHeight(TimeRowHeight)


FullDayHeight = ScaleDPI(24)
HeaderHeight = ScaleDPI(84)
TimeWidth = ScaleDPI(TimeWidth)

IF Len(Trim(Theme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(Theme)
END IF

end event

event wm_mousewheel;call super::wm_mousewheel;IF DefaultView = Month THEN RETURN 
IF NOT uo_scroll.Visible THEN RETURN

Int il_delta
Long ll_height

ll_height = UnitsToPixels(Height, YUnitsToPixels!)
il_delta = (wParam / 65536)

IF il_delta < 0 THEN
	il_yscroll -= (TimeRowHeight * 2)
ELSE
	il_yscroll += (TimeRowHeight * 2)
END IF

IF il_yscroll >= 0 THEN
	il_yscroll = 0
END IF

IF il_yscroll < (ll_height  - HeaderHeight) - ((TimeRowHeight * 24)) THEN
	il_yscroll = (ll_height  - HeaderHeight) - ((TimeRowHeight * 24))
END IF

uo_scroll.Position = (Abs(il_yscroll) / ((TimeRowHeight * 24))) * uo_scroll.MaxPosition

SetRedraw(TRUE)
uo_scroll.SetRedraw(TRUE)

TRIGGER EVENT ue_Scroll()
end event

event destructor;call super::destructor;of_DestroyEvents()
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
		ib_eventmoving = FALSE
		istr_movingevent = lstr_empty
		SetRedraw(TRUE)
	END IF
	
	IF IsValid(istr_movingevent) AND ib_eventresizing THEN
		istr_movingevent.eventobject.StartDateTime = i_movingevent.StartDatetime
		istr_movingevent.eventobject.EndDateTime = i_movingevent.EndDatetime
		ib_eventresizing = FALSE
		istr_movingevent = lstr_empty
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
IF DefaultView = MONTH THEN RETURN EVENT RButtonDownMonth(flags, xpos, ypos)

Long ll_index, ll_count
Long ll_x, ll_y//, li_eventslotheight
DateTime ldt_clickeddate
Time lt_base

str_schedulemappedevents lstr_selectedevent

istr_selectedevent = lstr_selectedevent

SetFocus(THIS)

ll_x = UnitsToPixels(xpos, XUnitsToPixels!)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

ll_count = UpperBound(s_loadedevents)

FOR ll_index = 1 TO ll_count
	
	IF ll_x > s_loadedevents[ll_index].rectregion.Left AND ll_y >  s_loadedevents[ll_index].rectregion.Top AND &
	    ll_x <  s_loadedevents[ll_index].rectregion.Right AND ll_y <  s_loadedevents[ll_index].rectregion.Bottom THEN
		 
		 IF ll_y < HeaderHeight AND NOT s_loadedevents[ll_index].DisplayAsAllDayEvent THEN CONTINUE

		 lstr_selectedevent =  s_loadedevents[ll_index]
		 
		 il_clickxoffset = ll_x - s_loadedevents[ll_index].rectregion.Left
		 il_clickyoffset = ll_y - s_loadedevents[ll_index].rectregion.Top
	END IF
NEXT

IF IsValid(lstr_selectedevent) THEN
	IF IsValid(istr_selectedcell) THEN DESTROY istr_selectedcell
	istr_selectedevent = lstr_selectedevent
ELSE
	IF NOT CreateNewEventOnMouseDrag THEN
		ldt_clickeddate = of_FindClosestDatetime(ll_x, ll_y)
		
		IF IsValid(istr_selectedcell) THEN
			IF istr_selectedcell.eventobject.AllDayEvent THEN
				IF ll_y > HeaderHeight OR (Date(ldt_clickeddate) < Date(istr_selectedcell.eventobject.StartDateTime) OR Date(ldt_clickeddate) > Date(istr_selectedcell.eventobject.EndDateTime)) THEN
					DESTROY istr_selectedcell
				END IF
			ELSE
				IF ldt_clickeddate < istr_selectedcell.eventobject.StartDateTime OR ldt_clickeddate > istr_selectedcell.eventobject.EndDateTime THEN
					DESTROY istr_selectedcell
				END IF
			END IF
		END IF
		
		IF NOT IsValid(istr_selectedcell) THEN
			istr_selectedcell = CREATE str_schedulemappedevents
			
			IF ll_y < HeaderHeight THEN
				istr_selectedcell.eventobject.AllDayEvent = TRUE
				istr_selectedcell.eventobject.StartDateTime = DateTime(Date(ldt_clickeddate), lt_base)
				istr_selectedcell.eventobject.EndDateTime = istr_selectedcell.eventobject.StartDateTime
			ELSE
				istr_selectedcell.eventobject.StartDateTime = ldt_clickeddate
				istr_selectedcell.eventobject.EndDateTime = inv_helper.of_RelativeDateTime(istr_selectedcell.eventobject.StartDateTime, Max(30, MinAppointmentIncrement) * 60)
			END IF

			istr_selectedcell.eventobject.AllDayEvent =  (ll_y <= HeaderHeight)			
		END IF
	END IF	
END IF

SetRedraw(TRUE)
end event

type uo_scroll from u_cst_powerschedulescroll within u_cst_powerschedule_core
boolean visible = false
integer x = 3438
integer y = 16
integer width = 69
integer height = 1044
integer taborder = 20
long backcolor = 16777215
string linecolor = "WHITE"
string trackedlinecolor = "WHITE"
string slidershape = "SQUARE"
end type

on uo_scroll.destroy
call u_cst_powerschedulescroll::destroy
end on

event moved;call super::moved;Int il_delta
Long ll_height

IF MaxPosition = 0 THEN RETURN;

ll_height = UnitsToPixels(PARENT.Height, YUnitsToPixels!)

il_yscroll = (Double(TimeRowHeight * Double(25)) * (Double(Position) / Double(MaxPosition))) * -1

IF il_yscroll > 0 THEN
	il_yscroll = 0
END IF

IF il_yscroll < (ll_height  - HeaderHeight) - ((TimeRowHeight * 24)) THEN
	il_yscroll = (ll_height  - HeaderHeight) - ((TimeRowHeight * 24))
END IF

PARENT.SetRedraw(TRUE)

PARENT.TRIGGER EVENT ue_Scroll()
end event

