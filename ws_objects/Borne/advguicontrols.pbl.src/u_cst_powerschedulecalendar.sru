$PBExportHeader$u_cst_powerschedulecalendar.sru
forward
global type u_cst_powerschedulecalendar from monthcalendar
end type
end forward

global type u_cst_powerschedulecalendar from monthcalendar
integer width = 1006
integer height = 760
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long titletextcolor = 134217742
long trailingtextcolor = 134217745
long monthbackcolor = 1073741824
long titlebackcolor = 134217741
integer maxselectcount = 31
integer scrollrate = 1
boolean todaycircle = true
event dateupdated ( date a_date )
end type
global u_cst_powerschedulecalendar u_cst_powerschedulecalendar

type variables
u_cst_powerschedule iuo_schedule
Boolean ib_updatedate = TRUE
end variables

forward prototypes
public function integer of_setpowerschedule (u_cst_powerschedule auo_powerschedule)
public function integer of_refresh ()
private function integer of_refresh (boolean ab_forcedatechange)
public function integer of_setselectedrange (date ad_start, date ad_end)
public function integer of_setupdateflag (boolean ab_switch)
end prototypes

public function integer of_setpowerschedule (u_cst_powerschedule auo_powerschedule);iuo_schedule = auo_powerschedule
iuo_schedule.of_SetPowerScheduleCalendar(THIS)

POST of_Refresh(TRUE)


RETURN 1
end function

public function integer of_refresh ();RETURN of_Refresh(FALSE)
end function

private function integer of_refresh (boolean ab_forcedatechange);IF NOT IsValid(iuo_schedule) THEN RETURN 0

Date ld_start, ld_end
Date ld_selected
Int ld_NumberOfDays

THIS.GetSelectedDate ( ld_selected )
iuo_schedule.of_GetDateRange(ld_start, ld_end)

IF (Year(ld_start) * 10) + Month(ld_start) <> (Year(ld_selected) * 10) + Month(ld_selected) THEN
	ld_NumberOfDays = DaysAfter(ld_start, ld_end)
	ld_start = ld_selected
	ld_end = RelativeDate(ld_selected, ld_NumberOfDays)
END IF

ib_updatedate = ab_forcedatechange

of_SetSelectedRange(ld_start, ld_end)

CHOOSE CASE iuo_schedule.StartOfWeek
	CASE iuo_schedule.Sunday
		FirstDayOfWeek = Sunday!
	CASE iuo_schedule.Monday
		FirstDayOfWeek = Monday!
	CASE iuo_schedule.Tuesday
		FirstDayOfWeek = Tuesday!
	CASE iuo_schedule.Wednesday
		FirstDayOfWeek = Wednesday!
	CASE iuo_schedule.Thursday
		FirstDayOfWeek = Thursday!
	CASE iuo_schedule.Friday
		FirstDayOfWeek = Friday!
	CASE iuo_schedule.Saturday
		FirstDayOfWeek = Saturday!
END CHOOSE

THIS.ClearBoldDates()

ScheduleEvent lstr_events[]
Long ll_index, ll_count
Long ll_dayindex, ll_daycount

iuo_schedule.of_GetLoadedEvents(lstr_events)
ll_count = UpperBound(lstr_events)

FOR ll_index = 1 TO ll_count
	SetBoldDate (Date(lstr_events[ll_index].StartDateTime), TRUE)
	
	ll_dayindex = 0
	
	IF Date(lstr_events[ll_index].EndDateTime) > Date(lstr_events[ll_index].StartDateTime) THEN
		DO WHILE TRUE
			ll_dayindex++
			
			SetBoldDate (RelativeDate(Date(lstr_events[ll_index].StartDateTime), ll_dayindex), TRUE)
			
			IF Date(lstr_events[ll_index].EndDateTime) = RelativeDate(Date(lstr_events[ll_index].StartDateTime), ll_dayindex) THEN
				EXIT
			END IF
		LOOP
	END IF
NEXT

RETURN 1
end function

public function integer of_setselectedrange (date ad_start, date ad_end);IF iuo_schedule.DefaultView <> iuo_schedule.MONTH THEN
	THIS.SetSelectedRange(ad_start, ad_end)
ELSE
	THIS.SetSelectedRange(ad_start, ad_start)
END IF

POST of_SetUpdateFlag(TRUE)

RETURN 1
end function

public function integer of_setupdateflag (boolean ab_switch);ib_updatedate = ab_switch
RETURN 1
end function

on u_cst_powerschedulecalendar.create
end on

on u_cst_powerschedulecalendar.destroy
end on

event constructor;CONSTANT Int MCM_SETCALENDARBORDER = 4126

Send(Handle(THIS), MCM_SETCALENDARBORDER, 1, 0)

end event

event datechanged;IF NOT IsValid(iuo_schedule) THEN RETURN
IF NOT ib_updatedate THEN RETURN

Date ld_selected

iuo_schedule.SetRedraw(FALSE)

THIS.GetSelectedDate ( ld_selected )

POST EVENT dateupdated(ld_selected)

iuo_schedule.of_SetCurrentDate(Date(ld_selected))

iuo_schedule.POST SetRedraw(TRUE)
end event

