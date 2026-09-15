$PBExportHeader$n_cst_powerschedulehelper.sru
forward
global type n_cst_powerschedulehelper from nonvisualobject
end type
end forward

global type n_cst_powerschedulehelper from nonvisualobject autoinstantiate
end type

type variables
CONSTANT Int Sunday = 1
CONSTANT Int Monday = 2
CONSTANT Int Tuesday = 3
CONSTANT Int Wednesday = 4
CONSTANT Int Thursday = 5
CONSTANT Int Friday = 6
CONSTANT Int Saturday = 7

n_uspb_resourcemanager inv_resourcemanager
end variables

forward prototypes
public function point of_getmonthcell (date a_startdate, date a_enddate, date a_currentdate)
public function string of_getdayname (integer ai_day)
public function date of_lastdayofthemonth (date ad_date)
public function datetime of_relativedatetime (datetime adtm_start, long al_offset)
public function long of_secondsafter (datetime adt_start, datetime adt_end)
public function s_rect of_newrect (integer a_x, integer a_y, integer a_width, integer a_height)
public function integer of_getdaycellfrompoint (point lp_cell)
public function date of_getdatefromcell (date a_startdate, point a_cell)
public function point of_getdaycellfromcords (integer a_x, integer a_y, integer a_colwidth, integer a_rowheight)
public function str_scheduledimensions of_getgriddimensions (date a_startdate, u_cst_powerschedule_core a_powerschedule)
public function integer of_booltoint (boolean ab_value)
public function long of_millisecsafter (time atm_start, time atm_end)
public function boolean of_isfulleventinnonworkinghours (u_cst_powerschedule_scheduleview luo_schedule, scheduleevent i_event)
public function datetime of_getbestschedulestart (u_cst_powerschedule_scheduleview luo_schedule, scheduleevent i_event)
public function datetime of_getbestscheduleend (u_cst_powerschedule_scheduleview luo_schedule, scheduleevent i_event)
public function date of_getfirstworkingday (u_cst_powerschedule_scheduleview luo_schedule)
public function int of_getworkingdaysbetweendates (u_cst_powerschedule_scheduleview luo_schedule, date ldt_start, date ldt_end)
public function date of_getlastworkingday (u_cst_powerschedule_scheduleview luo_schedule)
public function integer of_getworkingdayposition (u_cst_powerschedule_scheduleview luo_schedule, date ldt_start)
public function long of_minutessafter (datetime adt_start, datetime adt_end)
public function date of_getclosestworkingdate (u_cst_powerschedule_scheduleview luo_schedule, date adt_date)
public function double of_geteventworkinghours (u_cst_powerschedule_scheduleview luo_schedule, datetime ldt_start, datetime ldt_end)
public function double of_geteventworkinghours (u_cst_powerschedule_scheduleview luo_schedule, datetime ldt_start, datetime ldt_end, boolean ab_nearestminute)
end prototypes

public function point of_getmonthcell (date a_startdate, date a_enddate, date a_currentdate);//px = col
//py = row

Point lp_cell
Int li_daysafterstart

IF a_currentdate < a_startdate THEN a_currentdate = a_startdate
IF a_currentdate > a_enddate THEN a_currentdate = a_enddate

li_daysafterstart = DaysAfter(a_startdate, a_currentdate) + 1

lp_cell.px = Mod(li_daysafterstart, 7)

IF lp_cell.px = 0 THEN
	lp_cell.px = 7
	lp_cell.py = (li_daysafterstart / 7)
ELSE
	lp_cell.py = (li_daysafterstart / 7) + 1
END IF

IF lp_cell.px <= 0 THEN
	lp_cell.px = 1
END IF

IF lp_cell.py <= 0 THEN
	lp_cell.py = 1
END IF

RETURN lp_cell
end function

public function string of_getdayname (integer ai_day);CHOOSE CASE ai_day
	CASE Sunday
		RETURN inv_resourcemanager.of_GetString("LBL_Sunday")
	CASE Monday
		RETURN inv_resourcemanager.of_GetString("LBL_Monday")
	CASE Tuesday
		RETURN inv_resourcemanager.of_GetString("LBL_Tuesday")
	CASE Wednesday
		RETURN inv_resourcemanager.of_GetString("LBL_Wednesday")
	CASE Thursday
		RETURN inv_resourcemanager.of_GetString("LBL_Thursday")
	CASE Friday
		RETURN inv_resourcemanager.of_GetString("LBL_Friday")
	CASE Saturday
		RETURN inv_resourcemanager.of_GetString("LBL_Saturday")
END CHOOSE
end function

public function date of_lastdayofthemonth (date ad_date);int li_retdays, li_month, li_year
Date ld_newdate

li_month = Month(ad_date)
li_year = year(ad_date)

IF li_month < 12 THEN
   li_month ++
ELSE
   li_month = 1
   li_year ++
END IF

ld_newdate = date(li_year,li_month,1)

RETURN RelativeDate(ld_newdate, -1)


end function

public function datetime of_relativedatetime (datetime adtm_start, long al_offset);datetime ldt_null
date ld_sdate
time lt_stime
long ll_date_adjust
long ll_time_adjust, ll_time_test

//Check parameters
If IsNull(adtm_start) or IsNull(al_offset) Then
	SetNull(ldt_null)
	Return ldt_null
End If

//Initialize date and time portion
ld_sdate = date(adtm_start)
lt_stime = time(adtm_start)

//Find out how many days are contained
//Note: 86400 is # of seconds in a day
ll_date_adjust = al_offset /  86400
ll_time_adjust = mod(al_offset, 86400)

//Adjust date portion
ld_sdate = RelativeDate(ld_sdate, ll_date_adjust)

//Adjust time portion
//	Allow for time adjustments periods crossing over days
//	Check for time rolling forwards a day
If ll_time_adjust > 0 then
	ll_time_test = SecondsAfter(lt_stime,time('23:59:59'))
	If ll_time_test < ll_time_adjust Then
		ld_sdate = RelativeDate(ld_sdate,1)
		ll_time_adjust = ll_time_adjust - ll_time_test -1
		lt_stime = time('00:00:00')
	End If
	lt_stime = RelativeTime(lt_stime, ll_time_adjust)
//Check for time rolling backwards a day
ElseIf  ll_time_adjust < 0 then
	ll_time_test = SecondsAfter(lt_stime,time('00:00:00'))
	If   ll_time_test > ll_time_adjust Then
		ld_sdate = RelativeDate(ld_sdate,-1)
		ll_time_adjust = ll_time_adjust - ll_time_test +1
		lt_stime = time('23:59:59')
	End If
	lt_stime = RelativeTime(lt_stime, ll_time_adjust)
End If

return(datetime(ld_sdate,lt_stime))
end function

public function long of_secondsafter (datetime adt_start, datetime adt_end);constant long lc_hours_in_day = 24, lc_minutes_in_hour = 60, lc_seconds_in_minute = 60

date ld_start, ld_end
time lt_start, lt_end

long ll_days, ll_seconds, ll_result

ld_start = date( adt_start )
lt_start = time( adt_start )

ld_end = date( adt_end )
lt_end = time( adt_end )

ll_days = DaysAfter( ld_start, ld_end )

ll_seconds = SecondsAfter ( lt_start, lt_end )

//This is the number of days multiplied by the number of seconds in a day
ll_result = ll_days * lc_hours_in_day * lc_minutes_in_hour * lc_seconds_in_minute
// Add the seconds from the time difference
ll_result += ll_seconds


return ll_result
end function

public function s_rect of_newrect (integer a_x, integer a_y, integer a_width, integer a_height);s_rect l_rect

l_rect.Left = a_x
l_rect.Right = a_x + a_width
l_rect.Top = a_y
l_rect.Bottom = a_y + a_height

RETURN l_rect
end function

public function integer of_getdaycellfrompoint (point lp_cell);//lp_cell - row 1 col2
//lp_cell - row 4 col5

Int li_daycell

li_daycell = ((lp_cell.py - 1) * 7) + lp_cell.px

RETURN li_daycell

end function

public function date of_getdatefromcell (date a_startdate, point a_cell);Integer li_cell

li_cell = of_GetDayCellFromPoint(a_cell) - 1

RETURN RelativeDate(a_startdate, li_cell)
end function

public function point of_getdaycellfromcords (integer a_x, integer a_y, integer a_colwidth, integer a_rowheight);Point p_cell

p_cell.px = (a_x/ a_colwidth) + 1
p_cell.py = (a_y / a_rowheight) + 1


RETURN p_cell
end function

public function str_scheduledimensions of_getgriddimensions (date a_startdate, u_cst_powerschedule_core a_powerschedule);Date ld_firstday, ld_lastday
Integer li_daynumber, ll_gridrows, li_daysinmonth
Long ll_width, ll_height
str_scheduledimensions lstr_return
CONSTANT Int daysInWeek = 7
CONSTANT INT MonthDayNameHeight = 20

ld_firstday = Date(Year(a_startdate), Month(a_startdate), 1)
ld_lastday = of_LastDayOfTheMonth(ld_firstDay)

li_daynumber = DayNumber(ld_firstday)

IF a_powerschedule.Sunday <> a_powerschedule.StartOfWeek THEN
	li_daynumber = li_daynumber - a_powerschedule.StartOfWeek

	IF li_daynumber < 0 THEN
		li_daynumber = daysInWeek + li_daynumber
	END IF
	
	li_daynumber++
END IF

ll_gridrows = (li_daynumber + Day(ld_lastday) - 1) / daysInWeek

IF Mod((li_daynumber + Day(ld_lastday) - 1), daysInWeek) <> 0 THEN
	 ll_gridrows++
END IF

ld_firstday = RelativeDate(ld_firstday, (li_daynumber - 1) * -1)
li_daysinmonth = DaysAfter(ld_firstday, ld_lastday) + 1
ld_lastday = RelativeDate(ld_lastday, (ll_gridrows * 7) - li_daysinmonth)
li_daysinmonth = (ll_gridrows * 7)

//Get the width and height of our canvas
ll_width = UnitsToPixels(a_powerschedule.of_WorkSpaceWidth(), XUnitsToPixels!)
ll_height = UnitsToPixels(a_powerschedule.of_WorkSpaceHeight(), YUnitsToPixels!)

lstr_return.StartDate = ld_firstday
lstr_return.EndDate = ld_lastday
lstr_return.RowHeight = (ll_height - a_powerschedule.ScaleDPI(MonthDayNameHeight)) / ll_gridrows
lstr_return.ColumnWidth  = ll_width / daysInWeek
lstr_return.DaysInMonth = li_daysinmonth
lstr_return.GridRows = ll_gridrows

RETURN lstr_return
end function

public function integer of_booltoint (boolean ab_value);IF ab_value THEN RETURN 1
RETURN 0
end function

public function long of_millisecsafter (time atm_start, time atm_end);Long ll_start, ll_end
Long ll_temp

//Check parameters
If IsNull(atm_start) or IsNull(atm_end) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

ll_start = Long (String (atm_start,"fff"))
ll_temp = Second(atm_start) * 1000
ll_start = ll_start + ll_temp
ll_temp = Minute(atm_start) * 60000
ll_start = ll_start + ll_temp
ll_temp = hour(atm_start) *  3600000
ll_start = ll_start + ll_temp

ll_end = Long (String (atm_end,"fff"))
ll_temp = Second(atm_end) * 1000
ll_end = ll_end + ll_temp
ll_temp = minute(atm_end) * 60000
ll_end = ll_end + ll_temp
ll_temp = hour(atm_end) * 3600000
ll_end = ll_end + ll_temp

return ll_end - ll_start
end function

public function boolean of_isfulleventinnonworkinghours (u_cst_powerschedule_scheduleview luo_schedule, scheduleevent i_event);Long ll_index, ll_count
Date ldt_workingdate
DateTime ldt_end
Boolean lb_validevent

IF Date(i_event.StartDateTime) < luo_schedule.id_StartDate THEN
	ldt_workingdate = luo_schedule.id_StartDate
ELSE
	ldt_workingdate = Date(i_event.StartDateTime)
END IF

ldt_end = i_event.EndDateTime

IF i_event.AllDayEvent THEN
	ldt_end = DateTime(Date(i_event.EndDateTime), Time(23,59,59))
END IF

ll_count = DaysAfter(ldt_workingdate, Date(i_event.EndDateTime)) + 1

lb_validevent = FALSE

FOR ll_index = 1 TO ll_count
	
	IF (DayNumber(ldt_workingDate) = 1 AND luo_schedule.WorkSunday) OR &
	   (DayNumber(ldt_workingDate) = 2 AND luo_schedule.WorkMonday) OR &
	   (DayNumber(ldt_workingDate) = 3 AND luo_schedule.WorkTuesday) OR &		
	   (DayNumber(ldt_workingDate) = 4 AND luo_schedule.WorkWednesday) OR &
	   (DayNumber(ldt_workingDate) = 5 AND luo_schedule.WorkThursday) OR &
	   (DayNumber(ldt_workingDate) = 6 AND luo_schedule.WorkFriday) OR &
	   (DayNumber(ldt_workingDate) = 7 AND luo_schedule.WorkSaturday) &		
		 THEN
		 
		 IF DateTime(ldt_workingdate, luo_schedule.WorkStartTime) < ldt_end AND &
		     DateTime(ldt_workingdate, luo_schedule.WorkEndTime) > i_event.StartDateTime THEN
			 lb_validevent = TRUE
		END IF

	END IF
	
	ldt_workingdate = RelativeDate(ldt_workingdate, ll_index)
NEXT

RETURN NOT lb_validevent
end function

public function datetime of_getbestschedulestart (u_cst_powerschedule_scheduleview luo_schedule, scheduleevent i_event);Long ll_index, ll_count
Date ldt_workingdate
Boolean lb_validevent

IF Date(i_event.StartDateTime) < luo_schedule.id_StartDate THEN
	ldt_workingdate = luo_schedule.id_StartDate
ELSE
	ldt_workingdate = Date(i_event.StartDateTime)
END IF

ll_count = DaysAfter(ldt_workingdate, Date(i_event.EndDateTime)) + 1

lb_validevent = FALSE

FOR ll_index = 1 TO ll_count
	
	IF (DayNumber(ldt_workingDate) = 1 AND luo_schedule.WorkSunday) OR &
	   (DayNumber(ldt_workingDate) = 2 AND luo_schedule.WorkMonday) OR &
	   (DayNumber(ldt_workingDate) = 3 AND luo_schedule.WorkTuesday) OR &		
	   (DayNumber(ldt_workingDate) = 4 AND luo_schedule.WorkWednesday) OR &
	   (DayNumber(ldt_workingDate) = 5 AND luo_schedule.WorkThursday) OR &
	   (DayNumber(ldt_workingDate) = 6 AND luo_schedule.WorkFriday) OR &
	   (DayNumber(ldt_workingDate) = 7 AND luo_schedule.WorkSaturday) &		
		 THEN
		 
		 IF  i_event.StartDateTime < DateTime(ldt_workingdate, luo_schedule.WorkStartTime) THEN
			 RETURN DateTime(ldt_workingdate, luo_schedule.WorkStartTime)
		ELSE
			RETURN i_event.StartDateTime
		END IF

	END IF
	
	ldt_workingdate = RelativeDate(ldt_workingdate, ll_index)
NEXT

RETURN i_event.StartDateTime
end function

public function datetime of_getbestscheduleend (u_cst_powerschedule_scheduleview luo_schedule, scheduleevent i_event);Long ll_index, ll_count
Date ldt_workingdate
DateTime ldt_end
Boolean lb_validevent

ldt_end = i_event.EndDateTime

IF i_event.AllDayEvent THEN
	ldt_end = DateTime(Date(i_event.EndDateTime), Time(23,59,59))
END IF

IF Date(ldt_end) > RelativeDate(luo_schedule.id_StartDate, luo_schedule.of_GetDayCount() - 1) THEN
	ldt_workingdate = RelativeDate(luo_schedule.id_StartDate, luo_schedule.of_GetDayCount() - 1)
ELSE
	ldt_workingdate = Date(ldt_end)
END IF

ll_count = DaysAfter(Date(ldt_end), ldt_workingdate) + 1

lb_validevent = FALSE

FOR ll_index = ll_count TO 1 STEP -1
	
	IF (DayNumber(ldt_workingDate) = 1 AND luo_schedule.WorkSunday) OR &
	   (DayNumber(ldt_workingDate) = 2 AND luo_schedule.WorkMonday) OR &
	   (DayNumber(ldt_workingDate) = 3 AND luo_schedule.WorkTuesday) OR &		
	   (DayNumber(ldt_workingDate) = 4 AND luo_schedule.WorkWednesday) OR &
	   (DayNumber(ldt_workingDate) = 5 AND luo_schedule.WorkThursday) OR &
	   (DayNumber(ldt_workingDate) = 6 AND luo_schedule.WorkFriday) OR &
	   (DayNumber(ldt_workingDate) = 7 AND luo_schedule.WorkSaturday) &		
		 THEN
		 
		 IF  ldt_end > DateTime(ldt_workingdate, luo_schedule.WorkEndTime) THEN
			 RETURN DateTime(ldt_workingdate, luo_schedule.WorkEndTime)
		ELSE
			 RETURN ldt_end
		END IF

	END IF
	
	ldt_workingdate = RelativeDate(ldt_workingdate, (ll_index * -1))
NEXT

RETURN ldt_end
end function

public function date of_getfirstworkingday (u_cst_powerschedule_scheduleview luo_schedule);Date ldt_workingdate
Double ld_return
Long ll_index, ll_count

ll_count = luo_schedule.of_GetDayCount()
ldt_workingdate = luo_schedule.id_StartDate

FOR ll_index = 1 TO ll_count
	IF (DayNumber(ldt_workingDate) = 1 AND NOT luo_schedule.WorkSunday) OR &
	   (DayNumber(ldt_workingDate) = 2 AND NOT luo_schedule.WorkMonday) OR &
	   (DayNumber(ldt_workingDate) = 3 AND NOT luo_schedule.WorkTuesday) OR &		
	   (DayNumber(ldt_workingDate) = 4 AND NOT luo_schedule.WorkWednesday) OR &
	   (DayNumber(ldt_workingDate) = 5 AND NOT luo_schedule.WorkThursday) OR &
	   (DayNumber(ldt_workingDate) = 6 AND NOT luo_schedule.WorkFriday) OR &
	   (DayNumber(ldt_workingDate) = 7 AND NOT luo_schedule.WorkSaturday) &		
		 THEN
		 
		ldt_workingDate = RelativeDate(ldt_workingDate, 1)
	ELSE
		EXIT
	END IF
NEXT

RETURN ldt_workingdate

end function

public function int of_getworkingdaysbetweendates (u_cst_powerschedule_scheduleview luo_schedule, date ldt_start, date ldt_end);Date ldt_workingdate
Int li_return
Long ll_index, ll_count

li_return = DaysAfter(ldt_start, ldt_end)

ll_count = li_return + 1

ldt_workingdate = ldt_start

FOR ll_index = 1 TO ll_count
	IF (DayNumber(Date(ldt_workingDate)) = 1 AND NOT luo_schedule.WorkSunday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 2 AND NOT luo_schedule.WorkMonday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 3 AND NOT luo_schedule.WorkTuesday) OR &		
	   (DayNumber(Date(ldt_workingDate)) = 4 AND NOT luo_schedule.WorkWednesday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 5 AND NOT luo_schedule.WorkThursday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 6 AND NOT luo_schedule.WorkFriday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 7 AND NOT luo_schedule.WorkSaturday) &		
		 THEN
		 
		 li_return -= 1
	END IF
	
	ldt_workingDate = RelativeDate(ldt_workingDate, 1)
	
NEXT

RETURN li_return
end function

public function date of_getlastworkingday (u_cst_powerschedule_scheduleview luo_schedule);Date ldt_workingdate
Double ld_return
Long ll_index, ll_count

ll_count = luo_schedule.of_GetDayCount()
ldt_workingdate = luo_schedule.id_StartDate

FOR ll_index = 1 TO ll_count
	IF (DayNumber(ldt_workingDate) = 1 AND NOT luo_schedule.WorkSunday) OR &
	   (DayNumber(ldt_workingDate) = 2 AND NOT luo_schedule.WorkMonday) OR &
	   (DayNumber(ldt_workingDate) = 3 AND NOT luo_schedule.WorkTuesday) OR &		
	   (DayNumber(ldt_workingDate) = 4 AND NOT luo_schedule.WorkWednesday) OR &
	   (DayNumber(ldt_workingDate) = 5 AND NOT luo_schedule.WorkThursday) OR &
	   (DayNumber(ldt_workingDate) = 6 AND NOT luo_schedule.WorkFriday) OR &
	   (DayNumber(ldt_workingDate) = 7 AND NOT luo_schedule.WorkSaturday) &		
		 THEN
		 
		ldt_workingDate = RelativeDate(luo_schedule.id_StartDate, ll_index)
	END IF
NEXT

RETURN ldt_workingdate

end function

public function integer of_getworkingdayposition (u_cst_powerschedule_scheduleview luo_schedule, date ldt_start);Date ldt_workingdate
Int li_return
Long ll_index, ll_count

ll_count = DaysAfter(luo_schedule.id_StartDate, ldt_start) + 1
ldt_workingdate = luo_schedule.id_StartDate

FOR ll_index = 1 TO ll_count
	IF (DayNumber(Date(ldt_workingDate)) = 1 AND luo_schedule.WorkSunday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 2 AND luo_schedule.WorkMonday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 3 AND luo_schedule.WorkTuesday) OR &		
	   (DayNumber(Date(ldt_workingDate)) = 4 AND luo_schedule.WorkWednesday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 5 AND luo_schedule.WorkThursday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 6 AND luo_schedule.WorkFriday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 7 AND luo_schedule.WorkSaturday) &		
		 THEN
		li_return += 1
	END IF
	
	IF ldt_workingDate = ldt_start THEN EXIT
	
	ldt_workingDate = RelativeDate(ldt_workingDate, 1)
	
NEXT

RETURN li_return
end function

public function long of_minutessafter (datetime adt_start, datetime adt_end);RETURN of_SecondsAfter(adt_start, adt_end) / 60
end function

public function date of_getclosestworkingdate (u_cst_powerschedule_scheduleview luo_schedule, date adt_date);Long ll_index, ll_count
Date ldt_workingdate
DateTime ldt_end
Boolean lb_validevent

ll_count = DaysAfter(luo_schedule.id_StartDate, adt_date) + 1
ldt_workingdate = Date(adt_date)

FOR ll_index = ll_count TO 1 STEP -1
	
	IF (DayNumber(ldt_workingDate) = 1 AND luo_schedule.WorkSunday) OR &
	   (DayNumber(ldt_workingDate) = 2 AND luo_schedule.WorkMonday) OR &
	   (DayNumber(ldt_workingDate) = 3 AND luo_schedule.WorkTuesday) OR &		
	   (DayNumber(ldt_workingDate) = 4 AND luo_schedule.WorkWednesday) OR &
	   (DayNumber(ldt_workingDate) = 5 AND luo_schedule.WorkThursday) OR &
	   (DayNumber(ldt_workingDate) = 6 AND luo_schedule.WorkFriday) OR &
	   (DayNumber(ldt_workingDate) = 7 AND luo_schedule.WorkSaturday) &		
		 THEN
		 
		RETURN ldt_workingdate

	END IF
	
	ldt_workingdate = RelativeDate(ldt_workingdate, -1)
NEXT

RETURN adt_date
end function

public function double of_geteventworkinghours (u_cst_powerschedule_scheduleview luo_schedule, datetime ldt_start, datetime ldt_end);RETURN of_GetEventWorkingHours(luo_schedule, ldt_start, ldt_end, FALSE)
end function

public function double of_geteventworkinghours (u_cst_powerschedule_scheduleview luo_schedule, datetime ldt_start, datetime ldt_end, boolean ab_nearestminute);DateTime ldt_workingdate
Double ld_return
Long ll_index, ll_count

IF ab_nearestminute THEN
	IF Time(ldt_end) < luo_schedule.WorkStartTime THEN
		ldt_end = DateTime(Date(ldt_end))
	END IF
END IF

ld_return = Double(of_SecondsAfter(ldt_start, ldt_end)) / 60.0 / 60.0

ll_count = ld_return

IF Double(Int(ld_return)) <> ld_return THEN ll_count += 1

ldt_workingdate = ldt_start

FOR ll_index = 1 TO ll_count
	IF Hour(Time(ldt_workingDate)) < Hour(luo_schedule.WorkStartTime) OR Hour(Time(ldt_workingDate)) >= Hour(luo_schedule.WorkEndTime) OR &
	   (DayNumber(Date(ldt_workingDate)) = 1 AND NOT luo_schedule.WorkSunday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 2 AND NOT luo_schedule.WorkMonday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 3 AND NOT luo_schedule.WorkTuesday) OR &		
	   (DayNumber(Date(ldt_workingDate)) = 4 AND NOT luo_schedule.WorkWednesday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 5 AND NOT luo_schedule.WorkThursday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 6 AND NOT luo_schedule.WorkFriday) OR &
	   (DayNumber(Date(ldt_workingDate)) = 7 AND NOT luo_schedule.WorkSaturday) &		
		 THEN
		 
		 ld_return -= 1
	END IF
	
	ldt_workingDate = of_RelativeDateTime(ldt_workingDate, 3600) //Add an hour
	
NEXT

RETURN ld_return
end function

on n_cst_powerschedulehelper.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_powerschedulehelper.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

