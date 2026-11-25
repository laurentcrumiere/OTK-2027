$PBExportHeader$u_cst_powerschedule.sru
forward
global type u_cst_powerschedule from userobject
end type
type uo_scheduleview from u_cst_powerschedule_scheduleview within u_cst_powerschedule
end type
type st_pbus_powerschedulelabel from statictext within u_cst_powerschedule
end type
type sle_scheduletitleedit from singlelineedit within u_cst_powerschedule
end type
type uo_schedule from u_cst_powerschedule_core within u_cst_powerschedule
end type
end forward

global type u_cst_powerschedule from userobject
integer width = 2981
integer height = 1332
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event type integer eventadded ( ref scheduleevent a_event )
event type integer eventchanging ( integer flag,  scheduleevent a_event_original,  ref scheduleevent a_event_new )
event eventchanged ( scheduleevent a_event )
event eventdeleted ( scheduleevent a_event )
event daterangechanged ( date startdate,  date enddate )
event type integer eventdeleting ( scheduleevent a_event )
event rightclick ( unsignedlong flags,  integer xpos,  integer ypos,  scheduleevent a_event )
event rightclickselection ( unsignedlong flags,  integer xpos,  integer ypos,  datetime selectedstarttime,  datetime selectedendtime,  boolean alldayevent,  long resourceid )
event eventselected ( scheduleevent a_event )
event cellrangeselected ( datetime startdatetime,  datetime enddatetime,  boolean alldayevent )
event doubleclick ( unsignedlong flags,  integer xpos,  integer ypos,  scheduleevent a_event )
uo_scheduleview uo_scheduleview
st_pbus_powerschedulelabel st_pbus_powerschedulelabel
sle_scheduletitleedit sle_scheduletitleedit
uo_schedule uo_schedule
end type
global u_cst_powerschedule u_cst_powerschedule

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
CONSTANT Int ScheduleView = 5

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

CONSTANT Int Appointment = 1
CONSTANT Int Meeting = 2
CONSTANT Int Task = 3

Int DefaultEventType = Appointment

CONSTANT Int Busy = 1
CONSTANT Int Free = 2
CONSTANT Int Tentative = 3
CONSTANT Int Away = 4

Boolean WorkSunday = TRUE
Boolean WorkMonday = TRUE
Boolean WorkTuesday = TRUE
Boolean WorkWednesday = TRUE
Boolean WorkThursday = TRUE
Boolean WorkFriday = TRUE
Boolean WorkSaturday = TRUE
Time WorkStartTime = Time(0,0,0)
Time WorkEndTime = Time(23,59,59)

PRIVATE:

u_cst_powerschedulecalendar iuo_calendar
Transaction i_sqlca
n_cst_powerschedulehelper inv_helper

Long il_resourceid
String is_resourcename

Int PreviousDefaultView
end variables

forward prototypes
public function integer of_loadevents (scheduleevent a_events[])
public function integer of_scrolltohour (integer ai_hour)
public function integer of_setavailableguests (scheduleeventguest a_availableguests[])
public function integer of_setcurrentdate (date ad_currentdate)
public function integer of_setdefaultview (integer ai_view)
public function integer of_settheme (string as_theme)
public function integer of_getloadedevents (ref scheduleevent a_events[])
public function integer of_settimeformat24hour (boolean ab_value)
public function integer of_seteventcornerradius (integer ai_value)
public function integer of_setdisplaycurrenttimeindicator (boolean ab_value)
public function integer of_setstartofweek (integer ai_value)
public function integer of_setstartofworkweek (integer ai_value)
public function integer of_setnumberofdaysinworkweek (integer ai_value)
public function integer of_setminappointmentincrement (integer ai_value)
public function integer of_setfontname (string as_value)
public function integer of_setdaytextfontsize (integer ai_value)
public function integer of_setdaynumberfontsize (integer ai_value)
public function integer of_settextsize (integer ai_value)
public function integer of_settimesize (integer ai_value)
public function integer of_setbackgroundcolor (unsignedlong al_value)
public function integer of_setnottitledefault (string as_value)
public function integer of_newevent ()
public function integer of_newevent (datetime ad_startdate)
public function integer of_getdaterange (ref date ad_start, ref date ad_end)
public function integer of_setpowerschedulecalendar (u_cst_powerschedulecalendar auo_calendar)
public function integer of_settransactionobject (transaction a_sqlca)
private function integer of_retrieveevents (date startdate, date enddate, long resourceid)
public function integer of_setresourceid (long ai_resourceid)
public function integer of_setworktime (boolean ab_sunday, boolean ab_monday, boolean ab_tuesday, boolean ab_wednesday, boolean ab_thursday, boolean ab_friday, boolean ab_saturday, time at_starttime, time at_endtime)
public function integer of_setusecustomui (boolean ab_value)
public function integer of_setoutlinecurrentday (boolean ab_value)
public function integer of_setcirclecurrentday (boolean ab_value)
public function integer of_settextcolor (unsignedlong al_value)
public function integer of_setisreadonly (boolean ab_value)
public function integer of_print ()
public function integer of_setdisplaylocationinevent (boolean ab_value)
public function integer of_setdisplaydescriptioninevent (boolean ab_value)
public function scheduleevent of_getevent (long eventid)
public function scheduleevent of_getselectedevent ()
public function integer of_setcreateneweventonclick (boolean ab_value)
public function integer of_setcreateneweventonmousedrag (boolean ab_value)
public function integer of_newevent (datetime ad_startdate, datetime ad_enddate, boolean ab_alldayevent, integer ai_eventtype)
public function integer of_clearselection ()
public function integer of_addevent (scheduleevent a_event)
public function integer of_deleteevent (long eventid)
public function integer of_updateevent (scheduleevent a_event)
public function integer of_setmincellselectionincrement (integer ai_value)
public function integer of_getselection (ref datetime startdatetime, ref datetime enddatetime, ref boolean alldayevent)
public function integer of_settimerowheight (integer ai_value)
public function integer of_setresource (long ai_resourceid, string as_name)
public function u_cst_powerschedule_scheduleview of_scheduleview ()
public function integer of_loadadditionalevents (long al_resourceid, string as_resourcename, scheduleevent a_events[])
public function integer of_loadadditionalevents (long al_resourceid, string as_resourcename)
public function integer of_removeadditionalevents (long al_resourceid)
public function integer of_displayscheduleview (boolean ab_value)
public function integer of_hidetime (boolean ab_switch)
end prototypes

event resize;uo_schedule.Resize(newwidth, newheight)
uo_scheduleview.Resize(newwidth, newheight)
end event

event type integer eventadded(ref scheduleevent a_event);//Return 1 to continue processing
RETURN 1
end event

event type integer eventchanging(integer flag, scheduleevent a_event_original, ref scheduleevent a_event_new);//Return 1 to continue processing
RETURN 1
end event

event type integer eventdeleting(scheduleevent a_event);//Return 1 to continue deleting
RETURN 1
end event

public function integer of_loadevents (scheduleevent a_events[]);uo_scheduleview.of_LoadEvents(a_events)
RETURN uo_schedule.of_LoadEvents(a_events)
end function

public function integer of_scrolltohour (integer ai_hour);RETURN uo_schedule.of_ScrollToHour(ai_hour)
end function

public function integer of_setavailableguests (scheduleeventguest a_availableguests[]);uo_scheduleview.of_SetAvailableGuests(a_availableguests)
RETURN uo_schedule.of_SetAvailableGuests(a_availableguests)
end function

public function integer of_setcurrentdate (date ad_currentdate);Integer li_return

CurrentDate = ad_currentdate
uo_scheduleview.of_SetCurrentDate(ad_currentdate)
li_return = uo_schedule.of_SetCurrentDate(ad_currentdate)

IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()

RETURN li_return
end function

public function integer of_setdefaultview (integer ai_view);Integer li_return
scheduleevent l_events[]

IF ai_view <> ScheduleView THEN
	PreviousDefaultView = DefaultView
END IF

DefaultView = ai_view

IF DefaultView = ScheduleView THEN

	uo_scheduleview.Show()
	
	uo_schedule.of_GetLoadedEvents(l_events)
	uo_scheduleview.of_LoadEvents(l_events)
	
	uo_schedule.Hide()
ELSE
	uo_schedule.Show()
	
	uo_scheduleview.of_GetLoadedEvents(l_events)
	uo_schedule.of_LoadEvents(l_events)
	
	uo_scheduleview.Hide()
END IF

uo_scheduleview.of_SetDefaultView(ai_view)
li_return = uo_schedule.of_SetDefaultView(ai_view)

IF IsValid(iuo_calendar) THEN iuo_calendar.of_Refresh()

RETURN li_return
end function

public function integer of_settheme (string as_theme);uo_scheduleview.of_SetTheme(as_theme)
RETURN uo_schedule.of_SetTheme(as_theme)
end function

public function integer of_getloadedevents (ref scheduleevent a_events[]);uo_scheduleview.of_GetLoadedEvents(a_events)
RETURN uo_schedule.of_GetLoadedEvents(a_events)
end function

public function integer of_settimeformat24hour (boolean ab_value);TimeFormat24Hour = ab_value

uo_scheduleview.TimeFormat24Hour = ab_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.TimeFormat24Hour = ab_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_seteventcornerradius (integer ai_value);EventCornerRadius = ai_value

uo_scheduleview.EventCornerRadius = ai_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.EventCornerRadius = ai_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setdisplaycurrenttimeindicator (boolean ab_value);DisplayCurrentTimeIndicator = ab_value

uo_scheduleview.DisplayCurrentTimeIndicator = ab_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.DisplayCurrentTimeIndicator = ab_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setstartofweek (integer ai_value);IF ai_value < SUNDAY OR ai_value > SATURDAY THEN RETURN -1

StartOfWeek = ai_value

uo_scheduleview.StartOfWeek = ai_value
uo_scheduleview.of_SetCurrentDate(uo_schedule.CurrentDate)

uo_schedule.StartOfWeek = ai_value
uo_schedule.of_SetCurrentDate(uo_schedule.CurrentDate)

IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()

RETURN 1
end function

public function integer of_setstartofworkweek (integer ai_value);IF ai_value < SUNDAY OR ai_value > SATURDAY THEN RETURN -1

StartOfWorkWeek = ai_value

uo_scheduleview.StartOfWorkWeek = ai_value
uo_scheduleview.of_SetCurrentDate(uo_schedule.CurrentDate)

uo_schedule.StartOfWorkWeek = ai_value
uo_schedule.of_SetCurrentDate(uo_schedule.CurrentDate)

RETURN 1
end function

public function integer of_setnumberofdaysinworkweek (integer ai_value);IF ai_value < 1 OR ai_value > 7 THEN RETURN -1

NumberOfDaysInWorkWeek = ai_value

uo_scheduleview.NumberOfDaysInWorkWeek = ai_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.NumberOfDaysInWorkWeek = ai_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setminappointmentincrement (integer ai_value);MinAppointmentIncrement = ai_value

uo_scheduleview.of_SetMinAppointmentIncrement(ai_value)
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.of_SetMinAppointmentIncrement(ai_value)
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontname (string as_value);FontName = as_value

uo_scheduleview.FontName = as_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.FontName = as_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setdaytextfontsize (integer ai_value);DayTextFontSize = ai_value

uo_scheduleview.DayTextFontSize = ai_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.DayTextFontSize = ai_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setdaynumberfontsize (integer ai_value);DayNumberFontSize = ai_value

uo_scheduleview.DayNumberFontSize = ai_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.DayNumberFontSize = ai_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settextsize (integer ai_value);TextSize = ai_value

uo_scheduleview.TextSize = ai_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.TextSize = ai_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settimesize (integer ai_value);TimeSize = ai_value

uo_scheduleview.TimeSize = ai_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.TimeSize = ai_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setbackgroundcolor (unsignedlong al_value);BackgroundColor = al_value

uo_scheduleview.BackgroundColor = al_value
uo_scheduleview.uo_vscroll.BackColor = al_value
uo_scheduleview.uo_hscroll.BackColor = al_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.BackgroundColor = al_value
uo_schedule.uo_scroll.BackColor = al_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setnottitledefault (string as_value);NoTitle = as_value

uo_scheduleview.NoTitle = as_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.NoTitle = as_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_newevent ();DateTime ld_now
Integer li_minute
n_cst_powerschedulehelper lnv_helper

ld_now = DateTime(Today(), Now())

li_minute = Minute(Time(ld_now))

IF Mod(li_minute, MinAppointmentIncrement) <> 0 THEN 
	ld_now = lnv_helper.of_RelativeDateTime(ld_now, MinAppointmentIncrement * 60)
	li_minute = Mod(Minute(Time(ld_now)), MinAppointmentIncrement)
	
	ld_now = lnv_helper.of_RelativeDateTime(ld_now, (li_minute * -1) * 60)
END IF

RETURN of_NewEvent(ld_now)
end function

public function integer of_newevent (datetime ad_startdate);RETURN uo_schedule.of_CreateNewEvent(ad_startdate)
end function

public function integer of_getdaterange (ref date ad_start, ref date ad_end);RETURN uo_schedule.of_GetDateRange(ad_start, ad_end)
end function

public function integer of_setpowerschedulecalendar (u_cst_powerschedulecalendar auo_calendar);iuo_calendar = auo_calendar

RETURN 1
end function

public function integer of_settransactionobject (transaction a_sqlca);i_sqlca = a_sqlca
RETURN 1
end function

private function integer of_retrieveevents (date startdate, date enddate, long resourceid);IF IsValid(i_sqlca) THEN
	Datastore lds_events, lds_eventguests
	Long ll_index, ll_count, ll_innerindex, ll_innercount
	scheduleevent l_events[]
	scheduleevent l_event, l_empty
	scheduleeventguest l_evenguest
	
	lds_events = CREATE Datastore
	lds_eventguests = CREATE Datastore
	
	lds_events.Dataobject = "d_pbus_scheduleevent"
	lds_eventguests.Dataobject = "d_pbus_scheduleeventguests"
	
	lds_events.SetTransObject(i_sqlca)
	lds_eventguests.SetTransObject(i_sqlca)
	
	ll_count = lds_events.Retrieve(startdate, enddate, resourceid)
	
	FOR ll_index = 1 TO ll_count
		l_event = l_empty
		 
		l_event.eventid = lds_events.GetItemNumber(ll_index, "eventid")
		l_event.resourceid = lds_events.GetItemNumber(ll_index, "resourceid")
		l_event.alldayevent = (lds_events.GetItemNumber(ll_index, "alldayevent") = 1)
		l_event.startdatetime = lds_events.GetItemDateTime(ll_index, "startdatetime")
		l_event.enddatetime = lds_events.GetItemDateTime(ll_index, "enddatetime")
		l_event.title = lds_events.GetItemString(ll_index, "title")
		l_event.description = lds_events.GetItemString(ll_index, "description")
		l_event.location = lds_events.GetItemString(ll_index, "location")
		l_event.color = lds_events.GetItemNumber(ll_index, "color")
		l_event.textcolor = RGB(255,255,255)
		l_event.status = lds_events.GetItemNumber(ll_index, "status")
		l_event.isprivate = (lds_events.GetItemNumber(ll_index, "isprivate") = 1)
		l_event.isreadonly = (lds_events.GetItemNumber(ll_index, "isreadonly") = 1)
		l_event.ismeeting = (lds_events.GetItemNumber(ll_index, "ismeeting") = 1)
		l_event.isrecurring = (lds_events.GetItemNumber(ll_index, "isrecurring") = 1)
		l_event.eventtype = lds_events.GetItemNumber(ll_index, "eventtype")
		
		ll_innercount = lds_eventguests.Retrieve(l_event.eventid)
		
		FOR ll_innerindex = 1 TO ll_innercount
			l_evenguest.eventguestid = lds_eventguests.GetItemNumber(ll_innerindex, "eventguestid")
			l_evenguest.resourceid = lds_eventguests.GetItemNumber(ll_innerindex, "resourceid")
			l_evenguest.name = lds_eventguests.GetItemString(ll_innerindex, "guestname")
			l_evenguest.email = lds_eventguests.GetItemString(ll_innerindex, "guestemail")
			l_event.guests[ll_innerindex] = l_evenguest
		NEXT
		
		l_events[ll_index] = l_event
	NEXT
	
	uo_scheduleview.of_LoadEvents(l_events)
	uo_schedule.of_LoadEvents(l_events)
	
	DESTROY lds_events
	DESTROY lds_eventguests
END IF

RETURN ll_count
end function

public function integer of_setresourceid (long ai_resourceid);Date startdate, enddate

il_resourceid = ai_resourceid
uo_scheduleview.il_resourceid = il_resourceid
uo_schedule.il_resourceid = il_resourceid

of_GetDateRange(startdate, enddate)
of_RetrieveEvents(startdate, enddate, il_resourceid)

RETURN 1
end function

public function integer of_setworktime (boolean ab_sunday, boolean ab_monday, boolean ab_tuesday, boolean ab_wednesday, boolean ab_thursday, boolean ab_friday, boolean ab_saturday, time at_starttime, time at_endtime);WorkSunday = ab_sunday
WorkMonday = ab_monday
WorkTuesday = ab_tuesday
WorkWednesday = ab_wednesday
WorkThursday = ab_thursday
WorkFriday = ab_friday
WorkSaturday = ab_saturday
WorkStartTime = at_starttime
WorkEndTime = at_endtime

uo_scheduleview.WorkSunday = WorkSunday
uo_scheduleview.WorkMonday = WorkMonday
uo_scheduleview.WorkTuesday = WorkTuesday
uo_scheduleview.WorkWednesday = WorkWednesday
uo_scheduleview.WorkThursday = WorkThursday
uo_scheduleview.WorkFriday = WorkFriday
uo_scheduleview.WorkSaturday = WorkSaturday
uo_scheduleview.WorkStartTime = WorkStartTime
uo_scheduleview.WorkEndTime = WorkEndTime

uo_schedule.WorkSunday = WorkSunday
uo_schedule.WorkMonday = WorkMonday
uo_schedule.WorkTuesday = WorkTuesday
uo_schedule.WorkWednesday = WorkWednesday
uo_schedule.WorkThursday = WorkThursday
uo_schedule.WorkFriday = WorkFriday
uo_schedule.WorkSaturday = WorkSaturday
uo_schedule.WorkStartTime = WorkStartTime
uo_schedule.WorkEndTime = WorkEndTime

uo_schedule.SetRedraw(TRUE)

IF DefaultView = ScheduleView THEN
	scheduleevent l_events[]
	uo_schedule.of_GetLoadedEvents(l_events)
	uo_scheduleview.of_LoadEvents(l_events)
	uo_scheduleview.SetRedraw(TRUE)
END IF

RETURN 1

end function

public function integer of_setusecustomui (boolean ab_value);UseCustomUI = ab_value
uo_scheduleview.UseCustomUI = ab_value
uo_schedule.UseCustomUI = ab_value
RETURN 1
end function

public function integer of_setoutlinecurrentday (boolean ab_value);OutlineCurrentDay = ab_value
uo_schedule.OutlineCurrentDay = ab_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setcirclecurrentday (boolean ab_value);CircleCurrentDay = ab_value
uo_schedule.CircleCurrentDay = ab_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_settextcolor (unsignedlong al_value);TextColor = al_value

uo_scheduleview.TextColor = al_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.TextColor = al_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setisreadonly (boolean ab_value);IsReadOnly = ab_value
uo_scheduleview.IsReadOnly = ab_value
uo_schedule.IsReadOnly = ab_value
RETURN 1
end function

public function integer of_print ();IF uo_scheduleview.Visible THEN
	RETURN uo_scheduleview.of_Print()
ELSE
	RETURN uo_schedule.of_Print()
END IF
end function

public function integer of_setdisplaylocationinevent (boolean ab_value);DisplayLocationInEvent = ab_value

uo_scheduleview.DisplayLocationInEvent = ab_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.DisplayLocationInEvent = ab_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setdisplaydescriptioninevent (boolean ab_value);DisplayDescriptionInEvent = ab_value
uo_schedule.DisplayDescriptionInEvent = ab_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function scheduleevent of_getevent (long eventid);IF uo_schedule.Visible THEN
	RETURN uo_schedule.of_getevent(EventId)
ELSE
	RETURN uo_scheduleview.of_getevent(EventId)
END IF
end function

public function scheduleevent of_getselectedevent ();IF uo_scheduleview.Visible THEN
	RETURN uo_scheduleview.of_GetSelectedEvent()
ELSE
	RETURN uo_schedule.of_GetSelectedEvent()
END IF
end function

public function integer of_setcreateneweventonclick (boolean ab_value);CreateNewEventOnClick = ab_value
uo_scheduleview.CreateNewEventOnClick = CreateNewEventOnClick
uo_schedule.CreateNewEventOnClick = CreateNewEventOnClick
RETURN 1
end function

public function integer of_setcreateneweventonmousedrag (boolean ab_value);CreateNewEventOnMouseDrag = ab_value
uo_scheduleview.CreateNewEventOnMouseDrag = CreateNewEventOnMouseDrag
uo_schedule.CreateNewEventOnMouseDrag = CreateNewEventOnMouseDrag
RETURN 1
end function

public function integer of_newevent (datetime ad_startdate, datetime ad_enddate, boolean ab_alldayevent, integer ai_eventtype);RETURN uo_schedule.of_CreateNewEvent(ad_startdate, ad_enddate, ab_alldayevent, ai_eventtype)
end function

public function integer of_clearselection ();uo_scheduleview.of_ClearSelection()
RETURN uo_schedule.of_ClearSelection()
end function

public function integer of_addevent (scheduleevent a_event);IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()

IF uo_schedule.Visible THEN
	RETURN uo_schedule.of_AddEvent(a_event)
ELSE
	RETURN uo_scheduleview.of_AddEvent(a_event)
END IF
end function

public function integer of_deleteevent (long eventid);IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()

IF uo_schedule.Visible THEN
	RETURN uo_schedule.of_DeleteEvent(eventid)
ELSE
	RETURN uo_scheduleview.of_DeleteEvent(eventid)
END IF
end function

public function integer of_updateevent (scheduleevent a_event);IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()

IF uo_schedule.Visible THEN
	RETURN uo_schedule.of_UpdateEvent(a_event)
ELSE
	RETURN uo_scheduleview.of_UpdateEvent(a_event)
END IF
end function

public function integer of_setmincellselectionincrement (integer ai_value);MinCellSelectionsIncrement = ai_value

uo_scheduleview.MinCellSelectionsIncrement = ai_value
uo_scheduleview.SetRedraw(TRUE)

uo_schedule.MinCellSelectionsIncrement = ai_value
uo_schedule.SetRedraw(TRUE)
RETURN 1
end function

public function integer of_getselection (ref datetime startdatetime, ref datetime enddatetime, ref boolean alldayevent);IF uo_scheduleview.Visible THEN
	RETURN uo_scheduleview.of_GetSelection(startdatetime, enddatetime, alldayevent)
ELSE
	RETURN uo_schedule.of_GetSelection(startdatetime, enddatetime, alldayevent)
END IF
end function

public function integer of_settimerowheight (integer ai_value);RETURN uo_schedule.of_SetTimeRowHeight(ai_value)

end function

public function integer of_setresource (long ai_resourceid, string as_name);is_resourcename = as_name
uo_schedule.is_resourcename = as_name

uo_scheduleview.of_SetResource(ai_resourceid, as_name)
of_SetResourceId(ai_resourceid)

RETURN 1
end function

public function u_cst_powerschedule_scheduleview of_scheduleview ();RETURN uo_scheduleview
end function

public function integer of_loadadditionalevents (long al_resourceid, string as_resourcename, scheduleevent a_events[]);RETURN uo_scheduleview.of_LoadAdditionalEvents(al_resourceid, as_resourcename, a_events)
end function

public function integer of_loadadditionalevents (long al_resourceid, string as_resourcename);IF IsValid(i_sqlca) THEN
	Datastore lds_events, lds_eventguests
	Date startdate, enddate
	Long ll_index, ll_count, ll_innerindex, ll_innercount
	scheduleevent l_events[]
	scheduleevent l_event, l_empty
	scheduleeventguest l_evenguest
	
	lds_events = CREATE Datastore
	lds_eventguests = CREATE Datastore
	
	lds_events.Dataobject = "d_pbus_scheduleevent"
	lds_eventguests.Dataobject = "d_pbus_scheduleeventguests"
	
	lds_events.SetTransObject(i_sqlca)
	lds_eventguests.SetTransObject(i_sqlca)
	
	uo_scheduleview.of_GetDateRange(startdate, enddate)
	ll_count = lds_events.Retrieve(startdate, enddate, al_resourceid)
	
	FOR ll_index = 1 TO ll_count
		l_event = l_empty
		 
		l_event.eventid = lds_events.GetItemNumber(ll_index, "eventid")
		l_event.resourceid = lds_events.GetItemNumber(ll_index, "resourceid")
		l_event.alldayevent = (lds_events.GetItemNumber(ll_index, "alldayevent") = 1)
		l_event.startdatetime = lds_events.GetItemDateTime(ll_index, "startdatetime")
		l_event.enddatetime = lds_events.GetItemDateTime(ll_index, "enddatetime")
		l_event.title = lds_events.GetItemString(ll_index, "title")
		l_event.description = lds_events.GetItemString(ll_index, "description")
		l_event.location = lds_events.GetItemString(ll_index, "location")
		l_event.color = lds_events.GetItemNumber(ll_index, "color")
		l_event.textcolor = RGB(255,255,255)
		l_event.status = lds_events.GetItemNumber(ll_index, "status")
		l_event.isprivate = (lds_events.GetItemNumber(ll_index, "isprivate") = 1)
		l_event.isreadonly = (lds_events.GetItemNumber(ll_index, "isreadonly") = 1)
		l_event.ismeeting = (lds_events.GetItemNumber(ll_index, "ismeeting") = 1)
		l_event.isrecurring = (lds_events.GetItemNumber(ll_index, "isrecurring") = 1)
		l_event.eventtype = lds_events.GetItemNumber(ll_index, "eventtype")
		
		ll_innercount = lds_eventguests.Retrieve(l_event.eventid)
		
		FOR ll_innerindex = 1 TO ll_innercount
			l_evenguest.eventguestid = lds_eventguests.GetItemNumber(ll_innerindex, "eventguestid")
			l_evenguest.resourceid = lds_eventguests.GetItemNumber(ll_innerindex, "resourceid")
			l_evenguest.name = lds_eventguests.GetItemString(ll_innerindex, "guestname")
			l_evenguest.email = lds_eventguests.GetItemString(ll_innerindex, "guestemail")
			l_event.guests[ll_innerindex] = l_evenguest
		NEXT
		
		l_events[ll_index] = l_event
	NEXT
	
	of_LoadAdditionalEvents(al_resourceid, as_resourcename, l_events)
	
	DESTROY lds_events
	DESTROY lds_eventguests
END IF

RETURN ll_count
end function

public function integer of_removeadditionalevents (long al_resourceid);RETURN uo_scheduleview.of_RemoveAdditionalEvents(al_resourceid)
end function

public function integer of_displayscheduleview (boolean ab_value);IF ab_value THEN
	of_SetDefaultView(ScheduleView)
ELSE
	of_SetDefaultView(PreviousDefaultView)
END IF

RETURN 1
end function

public function integer of_hidetime (boolean ab_switch);uo_schedule.of_HideTime(ab_switch, uo_schedule.Visible)
uo_scheduleview.of_HideTime(ab_switch, uo_scheduleview.Visible)

RETURN 1
end function

on u_cst_powerschedule.create
this.uo_scheduleview=create uo_scheduleview
this.st_pbus_powerschedulelabel=create st_pbus_powerschedulelabel
this.sle_scheduletitleedit=create sle_scheduletitleedit
this.uo_schedule=create uo_schedule
this.Control[]={this.uo_scheduleview,&
this.st_pbus_powerschedulelabel,&
this.sle_scheduletitleedit,&
this.uo_schedule}
end on

on u_cst_powerschedule.destroy
destroy(this.uo_scheduleview)
destroy(this.st_pbus_powerschedulelabel)
destroy(this.sle_scheduletitleedit)
destroy(this.uo_schedule)
end on

event constructor;uo_schedule.sle_scheduletitleedit = sle_scheduletitleedit

uo_schedule.UseCustomUI = UseCustomUI
uo_schedule.OutlineCurrentDay = OutlineCurrentDay
uo_schedule.CircleCurrentDay = CircleCurrentDay
uo_schedule.TimeFormat24Hour = TimeFormat24Hour
uo_schedule.Theme = Theme
uo_schedule.EventCornerRadius = EventCornerRadius
uo_schedule.DisplayCurrentTimeIndicator = DisplayCurrentTimeIndicator
uo_schedule.IsReadOnly = IsReadOnly
uo_schedule.DisplayLocationInEvent = DisplayLocationInEvent
uo_schedule.DisplayDescriptionInEvent = DisplayDescriptionInEvent
uo_schedule.CreateNewEventOnClick = CreateNewEventOnClick
uo_schedule.CreateNewEventOnMouseDrag = CreateNewEventOnMouseDrag

//Icon images
uo_schedule.of_SetIconImages(PrivateEvent_Image, RecurringEvent_Image, MeetingEvent_Image)

uo_schedule.DefaultView = DefaultView

uo_schedule.StartOfWeek = StartOfWeek
uo_schedule.StartOfWorkWeek = StartOfWorkWeek
uo_schedule.NumberOfDaysInWorkWeek = NumberOfDaysInWorkWeek
uo_schedule.MinAppointmentIncrement = MinAppointmentIncrement

uo_schedule.FontName = FontName
uo_schedule.DayTextFontSize = DayTextFontSize
uo_schedule.DayNumberFontSize = DayNumberFontSize
uo_schedule.TextSize = TextSize
uo_schedule.TimeSize = TimeSize

uo_schedule.BackgroundColor = BackgroundColor
uo_schedule.TextColor = TextColor

uo_schedule.CurrentDate = CurrentDate

uo_schedule.NoTitle = NoTitle

uo_schedule.DefaultEventType = DefaultEventType

uo_schedule.WorkSunday = WorkSunday
uo_schedule.WorkMonday = WorkMonday
uo_schedule.WorkTuesday = WorkTuesday
uo_schedule.WorkWednesday = WorkWednesday
uo_schedule.WorkThursday = WorkThursday
uo_schedule.WorkFriday = WorkFriday
uo_schedule.WorkSaturday = WorkSaturday
uo_schedule.WorkStartTime = WorkStartTime
uo_schedule.WorkEndTime = WorkEndTime

IF HideTime THEN
	uo_schedule.of_HideTime(TRUE, FALSE)
	uo_scheduleview.of_HideTime(TRUE, FALSE)
END IF

uo_schedule.Resize(THIS.Width, THIS.Height)

//ScheduleView
uo_scheduleview.sle_scheduletitleedit = sle_scheduletitleedit

uo_scheduleview.UseCustomUI = UseCustomUI
uo_scheduleview.OutlineCurrentDay = OutlineCurrentDay
uo_scheduleview.CircleCurrentDay = CircleCurrentDay
uo_scheduleview.TimeFormat24Hour = TimeFormat24Hour
uo_scheduleview.Theme = Theme
uo_scheduleview.EventCornerRadius = EventCornerRadius
uo_scheduleview.DisplayCurrentTimeIndicator = DisplayCurrentTimeIndicator
uo_scheduleview.IsReadOnly = IsReadOnly
uo_scheduleview.DisplayLocationInEvent = DisplayLocationInEvent
uo_scheduleview.DisplayDescriptionInEvent = DisplayDescriptionInEvent
uo_scheduleview.CreateNewEventOnClick = CreateNewEventOnClick
uo_scheduleview.CreateNewEventOnMouseDrag = CreateNewEventOnMouseDrag

//Icon images
uo_scheduleview.of_SetIconImages(PrivateEvent_Image, RecurringEvent_Image, MeetingEvent_Image)

uo_scheduleview.DefaultView = DefaultView

uo_scheduleview.StartOfWeek = StartOfWeek
uo_scheduleview.StartOfWorkWeek = StartOfWorkWeek
uo_scheduleview.NumberOfDaysInWorkWeek = NumberOfDaysInWorkWeek
uo_scheduleview.MinAppointmentIncrement = MinAppointmentIncrement

uo_scheduleview.FontName = FontName
uo_scheduleview.DayTextFontSize = DayTextFontSize
uo_scheduleview.DayNumberFontSize = DayNumberFontSize
uo_scheduleview.TextSize = TextSize
uo_scheduleview.TimeSize = TimeSize

uo_scheduleview.BackgroundColor = BackgroundColor
uo_scheduleview.TextColor = TextColor

uo_scheduleview.CurrentDate = CurrentDate

uo_scheduleview.NoTitle = NoTitle

uo_scheduleview.DefaultEventType = DefaultEventType

uo_scheduleview.WorkSunday = WorkSunday
uo_scheduleview.WorkMonday = WorkMonday
uo_scheduleview.WorkTuesday = WorkTuesday
uo_scheduleview.WorkWednesday = WorkWednesday
uo_scheduleview.WorkThursday = WorkThursday
uo_scheduleview.WorkFriday = WorkFriday
uo_scheduleview.WorkSaturday = WorkSaturday
uo_scheduleview.WorkStartTime = WorkStartTime
uo_scheduleview.WorkEndTime = WorkEndTime

uo_scheduleview.Resize(THIS.Width, THIS.Height)
end event

type uo_scheduleview from u_cst_powerschedule_scheduleview within u_cst_powerschedule
boolean visible = false
integer taborder = 20
end type

on uo_scheduleview.destroy
call u_cst_powerschedule_scheduleview::destroy
end on

event doubleclick;call super::doubleclick;PARENT.Trigger Event DoubleClick(flags, xpos, ypos, a_event)
end event

event eventadded;call super::eventadded;Integer li_return

li_return = PARENT.Trigger Event EventAdded(a_event)

IF li_return = 1 THEN
	IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()
END IF

IF li_return = 1 AND IsValid(i_sqlca) AND NOT UseCustomUI THEN
	Datastore lds_events, lds_eventguests
	Long ll_index, ll_count, ll_row
	scheduleevent l_events[]
	scheduleevent l_event
	scheduleeventguest l_evenguest
	
	lds_events = CREATE Datastore
	lds_eventguests = CREATE Datastore
	
	lds_events.Dataobject = "d_pbus_scheduleeventedit"
	lds_eventguests.Dataobject = "d_pbus_scheduleeventguests"
	
	lds_events.SetTransObject(i_sqlca)
	lds_eventguests.SetTransObject(i_sqlca)
	
	ll_row = lds_events.InsertRow(0)
	
	lds_events.SetItem(ll_row, "alldayevent", inv_helper.of_BoolToInt(a_event.alldayevent))
	lds_events.SetItem(ll_row, "startdatetime", a_event.startdatetime)
	lds_events.SetItem(ll_row, "enddatetime", a_event.enddatetime)
	lds_events.SetItem(ll_row, "title", a_event.title)
	lds_events.SetItem(ll_row, "description", a_event.description)
	lds_events.SetItem(ll_row, "location", a_event.location)
	lds_events.SetItem(ll_row, "color", a_event.color)
	lds_events.SetItem(ll_row, "status", a_event.status)
	lds_events.SetItem(ll_row, "isprivate", inv_helper.of_BoolToInt(a_event.isprivate))
	lds_events.SetItem(ll_row, "ismeeting", inv_helper.of_BoolToInt(a_event.ismeeting))
	lds_events.SetItem(ll_row, "isrecurring", inv_helper.of_BoolToInt(a_event.isrecurring))
	lds_events.SetItem(ll_row, "isreadonly", inv_helper.of_BoolToInt(a_event.isreadonly))
	lds_events.SetItem(ll_row, "eventtype", a_event.eventtype)
	lds_events.SetItem(ll_row, "resourceid", a_event.resourceid)
	
	lds_events.Update()
	
	a_event.eventid = lds_events.GetItemNumber(ll_row, "eventid")
		
	ll_count = UpperBound(a_event.guests)
		
	FOR ll_index = 1 TO ll_count
		ll_row = lds_eventguests.InsertRow(0)
		
		lds_eventguests.SetItem(ll_row, "eventid", a_event.eventid)
		lds_eventguests.SetItem(ll_row, "resourceid", a_event.guests[ll_index].resourceid)
		lds_eventguests.SetItem(ll_row, "guestname", a_event.guests[ll_index].name)
		lds_eventguests.SetItem(ll_row, "guestemail", a_event.guests[ll_index].email)
	
		lds_eventguests.Update()
		a_event.guests[ll_index].eventguestid = lds_eventguests.GetItemNumber(ll_row, "eventguestid")
		
		lds_eventguests.Reset()
	NEXT
	
	DESTROY lds_events
	DESTROY lds_eventguests
END IF

RETURN li_return
end event

event eventchanged;call super::eventchanged;IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()

PARENT.Trigger Event EventChanged(a_event)

IF IsValid(i_sqlca)  AND NOT UseCustomUI THEN
	Datastore lds_events, lds_eventguests
	Long ll_index, ll_count, ll_row
	scheduleevent l_events[]
	scheduleevent l_event
	scheduleeventguest l_evenguest
	
	lds_events = CREATE Datastore
	lds_eventguests = CREATE Datastore
	
	lds_events.Dataobject = "d_pbus_scheduleeventedit"
	lds_eventguests.Dataobject = "d_pbus_scheduleeventguests"
	
	lds_events.SetTransObject(i_sqlca)
	lds_eventguests.SetTransObject(i_sqlca)
	
	ll_row = lds_events.Retrieve(a_event.eventid)
	
	lds_events.SetItem(ll_row, "alldayevent", inv_helper.of_BoolToInt(a_event.alldayevent))
	lds_events.SetItem(ll_row, "startdatetime", a_event.startdatetime)
	lds_events.SetItem(ll_row, "enddatetime", a_event.enddatetime)
	lds_events.SetItem(ll_row, "title", a_event.title)
	lds_events.SetItem(ll_row, "description", a_event.description)
	lds_events.SetItem(ll_row, "location", a_event.location)
	lds_events.SetItem(ll_row, "color", a_event.color)
	lds_events.SetItem(ll_row, "status", a_event.status)
	lds_events.SetItem(ll_row, "isprivate", inv_helper.of_BoolToInt(a_event.isprivate))
	lds_events.SetItem(ll_row, "ismeeting", inv_helper.of_BoolToInt(a_event.ismeeting))
	lds_events.SetItem(ll_row, "isrecurring", inv_helper.of_BoolToInt(a_event.isrecurring))
	lds_events.SetItem(ll_row, "eventtype", a_event.eventtype)
	
	IF THIS.AllowResourceMoving THEN
		lds_events.SetItem(ll_row, "resourceid", a_event.resourceid)
	END IF
	
	lds_events.Update()
	
	ll_count = lds_eventguests.Retrieve(a_event.eventid)
	
	IF ll_count > 0 THEN
		FOR ll_index = 1 TO ll_count
			lds_eventguests.DeleteRow(1)
		NEXT
		
		lds_eventguests.Update()
	END IF
	
	ll_count = UpperBound(a_event.guests)
		
	FOR ll_index = 1 TO ll_count
		ll_row = lds_eventguests.InsertRow(0)
		
		lds_eventguests.SetItem(ll_row, "eventid", a_event.eventid)
		lds_eventguests.SetItem(ll_row, "resourceid", a_event.guests[ll_index].resourceid)
		lds_eventguests.SetItem(ll_row, "guestname", a_event.guests[ll_index].name)
		lds_eventguests.SetItem(ll_row, "guestemail", a_event.guests[ll_index].email)
	
		lds_eventguests.Update()
		a_event.guests[ll_index].eventguestid = lds_eventguests.GetItemNumber(ll_row, "eventguestid")
		
		lds_eventguests.Reset()
	NEXT
	
	DESTROY lds_events
	DESTROY lds_eventguests
END IF
end event

event eventchanging;call super::eventchanging;RETURN PARENT.Trigger Event EventChanging(flag, a_event_original, a_event_new)

end event

event eventdeleted;call super::eventdeleted;PARENT.Trigger Event EventDeleted(a_event)

IF IsValid(i_sqlca)  AND NOT UseCustomUI THEN
	Datastore lds_events, lds_eventguests
	Long ll_index, ll_count, ll_row
	scheduleevent l_events[]
	scheduleevent l_event
	scheduleeventguest l_evenguest
	
	lds_events = CREATE Datastore
	lds_eventguests = CREATE Datastore
	
	lds_events.Dataobject = "d_pbus_scheduleeventedit"
	lds_eventguests.Dataobject = "d_pbus_scheduleeventguests"
	
	lds_events.SetTransObject(i_sqlca)
	lds_eventguests.SetTransObject(i_sqlca)
	
	ll_count = lds_eventguests.Retrieve(a_event.eventid)
	
	IF ll_count > 0 THEN
		FOR ll_index = 1 TO ll_count
			lds_eventguests.DeleteRow(1)
		NEXT
		
		lds_eventguests.Update()
	END IF
	
	IF lds_events.Retrieve(a_event.eventid) > 0 THEN
		lds_events.DeleteRow(1)
		lds_events.Update()
	END IF
	
	DESTROY lds_events
	DESTROY lds_eventguests
END IF
end event

event eventdeleting;call super::eventdeleting;Long ll_return

ll_return = PARENT.Trigger Event EventDeleting(a_event)

IF ll_return = 1 THEN
	IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()
END IF

RETURN ll_return
end event

event eventselected;call super::eventselected;PARENT.Trigger Event EventSelected(a_event)
end event

event rightclick;call super::rightclick;PARENT.Trigger Event RightClick(flags, xpos, ypos, a_event)
end event

event rightclickselection;call super::rightclickselection;PARENT.Trigger Event RightClickSelection(flags, xpos, ypos, selectedstarttime, selectedendtime, alldayevent, resourceid)
end event

event daterangechanged;call super::daterangechanged;//PARENT.Trigger Event DateRangeChanged(startdate, enddate)

IF NOT uo_scheduleview.Visible THEN RETURN

str_scheduleeventresources l_resources[]
Long ll_index, ll_count

ll_count = THIS.of_GetLoadedResources(l_resources)

FOR ll_index = 1 TO ll_count
	of_LoadAdditionalEvents(l_resources[ll_index].ResourceId, l_resources[ll_index].ResourceName)
NEXT

end event

event dragdrop;call super::dragdrop;PARENT.TRIGGER EVENT DragDrop(source)
end event

event dragenter;call super::dragenter;PARENT.TRIGGER EVENT DragEnter(source)
end event

event dragleave;call super::dragleave;PARENT.TRIGGER EVENT DragLeave(source)
end event

event dragwithin;call super::dragwithin;PARENT.TRIGGER EVENT DragWithin(source)
end event

event cellrangeselected;call super::cellrangeselected;PARENT.Trigger Event CellRangeSelected(startdatetime, enddatetime, alldayevent)
end event

type st_pbus_powerschedulelabel from statictext within u_cst_powerschedule
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  PowerSchedule"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type sle_scheduletitleedit from singlelineedit within u_cst_powerschedule
event keydown pbm_keydown
boolean visible = false
integer x = 393
integer y = 380
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 33554432
boolean hideselection = false
end type

event keydown;IF key = KeyEnter! THEN
	IF uo_scheduleview.Visible THEN
		uo_scheduleview.POST of_FinishTitleEdit()
		uo_scheduleview.SetFocus()
	ELSE
		uo_schedule.POST of_FinishTitleEdit()
		uo_schedule.SetFocus()
	END IF
END IF

IF Key = KeyEscape! THEN
	THIS.Hide()
	IF uo_scheduleview.Visible THEN
		uo_scheduleview.SetFocus()
	ELSE
		uo_schedule.SetFocus()
	END IF
END IF
end event

event losefocus;IF uo_scheduleview.Visible THEN
	uo_scheduleview.POST of_FinishTitleEdit()
ELSE
	uo_schedule.POST of_FinishTitleEdit()
END IF
end event

type uo_schedule from u_cst_powerschedule_core within u_cst_powerschedule
integer taborder = 20
end type

on uo_schedule.destroy
call u_cst_powerschedule_core::destroy
end on

event eventadded;call super::eventadded;Integer li_return

li_return = PARENT.Trigger Event EventAdded(a_event)

IF li_return = 1 THEN
	IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()
END IF

IF li_return = 1 AND IsValid(i_sqlca) AND NOT UseCustomUI THEN
	Datastore lds_events, lds_eventguests
	Long ll_index, ll_count, ll_row
	scheduleevent l_events[]
	scheduleevent l_event
	scheduleeventguest l_evenguest
	
	lds_events = CREATE Datastore
	lds_eventguests = CREATE Datastore
	
	lds_events.Dataobject = "d_pbus_scheduleeventedit"
	lds_eventguests.Dataobject = "d_pbus_scheduleeventguests"
	
	lds_events.SetTransObject(i_sqlca)
	lds_eventguests.SetTransObject(i_sqlca)
	
	ll_row = lds_events.InsertRow(0)
	
	lds_events.SetItem(ll_row, "alldayevent", inv_helper.of_BoolToInt(a_event.alldayevent))
	lds_events.SetItem(ll_row, "startdatetime", a_event.startdatetime)
	lds_events.SetItem(ll_row, "enddatetime", a_event.enddatetime)
	lds_events.SetItem(ll_row, "title", a_event.title)
	lds_events.SetItem(ll_row, "description", a_event.description)
	lds_events.SetItem(ll_row, "location", a_event.location)
	lds_events.SetItem(ll_row, "color", a_event.color)
	lds_events.SetItem(ll_row, "status", a_event.status)
	lds_events.SetItem(ll_row, "isprivate", inv_helper.of_BoolToInt(a_event.isprivate))
	lds_events.SetItem(ll_row, "ismeeting", inv_helper.of_BoolToInt(a_event.ismeeting))
	lds_events.SetItem(ll_row, "isrecurring", inv_helper.of_BoolToInt(a_event.isrecurring))
	lds_events.SetItem(ll_row, "isreadonly", inv_helper.of_BoolToInt(a_event.isreadonly))
	lds_events.SetItem(ll_row, "eventtype", a_event.eventtype)
	lds_events.SetItem(ll_row, "resourceid", a_event.resourceid)
	
	lds_events.Update()
	
	a_event.eventid = lds_events.GetItemNumber(ll_row, "eventid")
		
	ll_count = UpperBound(a_event.guests)
		
	FOR ll_index = 1 TO ll_count
		ll_row = lds_eventguests.InsertRow(0)
		
		lds_eventguests.SetItem(ll_row, "eventid", a_event.eventid)
		lds_eventguests.SetItem(ll_row, "resourceid", a_event.guests[ll_index].resourceid)
		lds_eventguests.SetItem(ll_row, "guestname", a_event.guests[ll_index].name)
		lds_eventguests.SetItem(ll_row, "guestemail", a_event.guests[ll_index].email)
	
		lds_eventguests.Update()
		a_event.guests[ll_index].eventguestid = lds_eventguests.GetItemNumber(ll_row, "eventguestid")
		
		lds_eventguests.Reset()
	NEXT
	
	DESTROY lds_events
	DESTROY lds_eventguests
END IF

RETURN li_return
end event

event eventchanging;call super::eventchanging;RETURN PARENT.Trigger Event EventChanging(flag, a_event_original, a_event_new)

end event

event eventchanged;call super::eventchanged;IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()

PARENT.Trigger Event EventChanged(a_event)

IF IsValid(i_sqlca)  AND NOT UseCustomUI THEN
	Datastore lds_events, lds_eventguests
	Long ll_index, ll_count, ll_row
	scheduleevent l_events[]
	scheduleevent l_event
	scheduleeventguest l_evenguest
	
	lds_events = CREATE Datastore
	lds_eventguests = CREATE Datastore
	
	lds_events.Dataobject = "d_pbus_scheduleeventedit"
	lds_eventguests.Dataobject = "d_pbus_scheduleeventguests"
	
	lds_events.SetTransObject(i_sqlca)
	lds_eventguests.SetTransObject(i_sqlca)
	
	ll_row = lds_events.Retrieve(a_event.eventid)
	
	lds_events.SetItem(ll_row, "alldayevent", inv_helper.of_BoolToInt(a_event.alldayevent))
	lds_events.SetItem(ll_row, "startdatetime", a_event.startdatetime)
	lds_events.SetItem(ll_row, "enddatetime", a_event.enddatetime)
	lds_events.SetItem(ll_row, "title", a_event.title)
	lds_events.SetItem(ll_row, "description", a_event.description)
	lds_events.SetItem(ll_row, "location", a_event.location)
	lds_events.SetItem(ll_row, "color", a_event.color)
	lds_events.SetItem(ll_row, "status", a_event.status)
	lds_events.SetItem(ll_row, "isprivate", inv_helper.of_BoolToInt(a_event.isprivate))
	lds_events.SetItem(ll_row, "ismeeting", inv_helper.of_BoolToInt(a_event.ismeeting))
	lds_events.SetItem(ll_row, "isrecurring", inv_helper.of_BoolToInt(a_event.isrecurring))
	lds_events.SetItem(ll_row, "eventtype", a_event.eventtype)
	
	lds_events.Update()
	
	ll_count = lds_eventguests.Retrieve(a_event.eventid)
	
	IF ll_count > 0 THEN
		FOR ll_index = 1 TO ll_count
			lds_eventguests.DeleteRow(1)
		NEXT
		
		lds_eventguests.Update()
	END IF
	
	ll_count = UpperBound(a_event.guests)
		
	FOR ll_index = 1 TO ll_count
		ll_row = lds_eventguests.InsertRow(0)
		
		lds_eventguests.SetItem(ll_row, "eventid", a_event.eventid)
		lds_eventguests.SetItem(ll_row, "resourceid", a_event.guests[ll_index].resourceid)
		lds_eventguests.SetItem(ll_row, "guestname", a_event.guests[ll_index].name)
		lds_eventguests.SetItem(ll_row, "guestemail", a_event.guests[ll_index].email)
	
		lds_eventguests.Update()
		a_event.guests[ll_index].eventguestid = lds_eventguests.GetItemNumber(ll_row, "eventguestid")
		
		lds_eventguests.Reset()
	NEXT
	
	DESTROY lds_events
	DESTROY lds_eventguests
END IF
end event

event eventdeleted;call super::eventdeleted;PARENT.Trigger Event EventDeleted(a_event)

IF IsValid(i_sqlca)  AND NOT UseCustomUI THEN
	Datastore lds_events, lds_eventguests
	Long ll_index, ll_count, ll_row
	scheduleevent l_events[]
	scheduleevent l_event
	scheduleeventguest l_evenguest
	
	lds_events = CREATE Datastore
	lds_eventguests = CREATE Datastore
	
	lds_events.Dataobject = "d_pbus_scheduleeventedit"
	lds_eventguests.Dataobject = "d_pbus_scheduleeventguests"
	
	lds_events.SetTransObject(i_sqlca)
	lds_eventguests.SetTransObject(i_sqlca)
	
	ll_count = lds_eventguests.Retrieve(a_event.eventid)
	
	IF ll_count > 0 THEN
		FOR ll_index = 1 TO ll_count
			lds_eventguests.DeleteRow(1)
		NEXT
		
		lds_eventguests.Update()
	END IF
	
	IF lds_events.Retrieve(a_event.eventid) > 0 THEN
		lds_events.DeleteRow(1)
		lds_events.Update()
	END IF
	
	DESTROY lds_events
	DESTROY lds_eventguests
END IF
end event

event daterangechanged;call super::daterangechanged;PARENT.Trigger Event DateRangeChanged(startdate, enddate)

of_RetrieveEvents(startdate, enddate, il_resourceid)
end event

event eventdeleting;call super::eventdeleting;Long ll_return

ll_return = PARENT.Trigger Event EventDeleting(a_event)

IF ll_return = 1 THEN
	IF IsValid(iuo_calendar) THEN iuo_calendar.POST of_Refresh()
END IF

RETURN ll_return
end event

event rightclick;call super::rightclick;PARENT.Trigger Event RightClick(flags, xpos, ypos, a_event)
end event

event rightclickselection;call super::rightclickselection;PARENT.Trigger Event RightClickSelection(flags, xpos, ypos, selectedstarttime, selectedendtime, alldayevent, il_resourceid)
end event

event cellrangeselected;call super::cellrangeselected;PARENT.Trigger Event CellRangeSelected(startdatetime, enddatetime, alldayevent)
end event

event eventselected;call super::eventselected;PARENT.Trigger Event EventSelected(a_event)
end event

event doubleclick;call super::doubleclick;PARENT.Trigger Event DoubleClick(flags, xpos, ypos, a_event)
end event

event dragdrop;call super::dragdrop;PARENT.TRIGGER EVENT DragDrop(source)
end event

event dragenter;call super::dragenter;PARENT.TRIGGER EVENT DragEnter(source)
end event

event dragleave;call super::dragleave;PARENT.TRIGGER EVENT DragLeave(source)
end event

event dragwithin;call super::dragwithin;PARENT.TRIGGER EVENT DragWithin(source)
end event

