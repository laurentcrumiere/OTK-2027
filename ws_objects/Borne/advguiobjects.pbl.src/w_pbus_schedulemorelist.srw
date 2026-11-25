$PBExportHeader$w_pbus_schedulemorelist.srw
forward
global type w_pbus_schedulemorelist from w_pbus_spa_captionless
end type
type st_dayname from statictext within w_pbus_schedulemorelist
end type
type st_daynumber from statictext within w_pbus_schedulemorelist
end type
type uo_1 from u_cst_canvas within w_pbus_schedulemorelist
end type
end forward

global type w_pbus_schedulemorelist from w_pbus_spa_captionless
integer width = 1001
integer height = 1232
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
st_dayname st_dayname
st_daynumber st_daynumber
uo_1 uo_1
end type
global w_pbus_schedulemorelist w_pbus_schedulemorelist

type variables
str_scheduleeventmorelist istr_morelist
n_cst_powerschedulehelper inv_helper
str_schedulemappedevents istr_events[]

Integer EventCornerRadius = 8

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


str_schedulemappedevents istr_selectedevent
str_schedulemappedevents istr_mouseoverevent
end variables

forward prototypes
public function integer of_loadevents ()
end prototypes

public function integer of_loadevents ();Int li_index, li_count, li_daycount
Int li_height
str_schedulemappedevents lstr_empty[]

istr_events = lstr_empty

li_count = UpperBound(istr_morelist.s_loadedevents)

FOR li_index = 1 TO li_count
	IF IsValid(istr_morelist.s_loadedevents[li_index]) THEN
		IF Date(istr_morelist.s_loadedevents[li_index].eventobject.StartDateTime) = istr_morelist.EventDate OR &
			 (Date(istr_morelist.s_loadedevents[li_index].eventobject.StartDateTime) <= istr_morelist.EventDate AND Date(istr_morelist.s_loadedevents[li_index].eventobject.EndDateTime) >= istr_morelist.EventDate) THEN
			istr_events[UpperBound(istr_events) + 1] = istr_morelist.s_loadedevents[li_index]
		END IF
	END IF
NEXT

li_daycount = UpperBound(istr_events)

li_height = uo_1.ScaleDPI((li_daycount * 24))
li_height = PixelsToUnits(li_height, YPixelsToUnits!)

uo_1.Height = li_height

THIS.Height = uo_1.Y + li_height

RETURN 1
end function

on w_pbus_schedulemorelist.create
int iCurrent
call super::create
this.st_dayname=create st_dayname
this.st_daynumber=create st_daynumber
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_dayname
this.Control[iCurrent+2]=this.st_daynumber
this.Control[iCurrent+3]=this.uo_1
end on

on w_pbus_schedulemorelist.destroy
call super::destroy
destroy(this.st_dayname)
destroy(this.st_daynumber)
destroy(this.uo_1)
end on

event open;call super::open;istr_morelist = Message.PowerObjectParm

of_SetTheme(istr_morelist.theme)
of_UseCustomColors(RGB(255,255,255), 0)

of_LoadEvents()

st_dayname.Text = inv_helper.of_GetDayName(DayNumber(Date(istr_morelist.EventDate)))
st_daynumber.Text = String(Day(Date(istr_morelist.EventDate)))

end event

event key;call super::key;IF key = KeyEscape! THEN
	Close(THIS)
END IF
end event

type uo_spa_controls from w_pbus_spa_captionless`uo_spa_controls within w_pbus_schedulemorelist
end type

type st_dayname from statictext within w_pbus_schedulemorelist
event lbuttondown pbm_lbuttondown
integer y = 32
integer width = 974
integer height = 104
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 8421504
long backcolor = 16777215
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

event lbuttondown;PARENT.Event lbuttondown(flags, PointerX(), PointerY())
end event

type st_daynumber from statictext within w_pbus_schedulemorelist
event lbuttondown pbm_lbuttondown
integer y = 140
integer width = 974
integer height = 104
boolean bringtotop = true
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 8421504
long backcolor = 16777215
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

event lbuttondown;PARENT.Event lbuttondown(flags, PointerX(), PointerY())
end event

type uo_1 from u_cst_canvas within w_pbus_schedulemorelist
event doubleclick pbm_lbuttondblclk
event lbuttondown pbm_lbuttondown
event lbuttonup pbm_lbuttonup
event mousemove pbm_mousemove
integer y = 260
integer width = 974
integer height = 864
integer taborder = 50
boolean bringtotop = true
end type

event doubleclick;Long ll_index
Long ll_y

ll_y = UnitsToPixels(ypos, YUnitsToPixels!)

ll_index = (ll_y / ScaleDPI(22)) + 1

IF ll_index < 1 OR ll_index > UpperBound(istr_events) THEN RETURN

istr_morelist.parentschedule.POST Event DoubleClick(flags, xpos, ypos, istr_events[ll_index].eventobject)
istr_morelist.parentschedule.POST of_EditEvent(istr_events[ll_index], 1)
Close(PARENT)

RETURN 1

end event

event lbuttondown;str_schedulemappedevents lst_empty

SetFocus(THIS)

istr_selectedevent = lst_empty

SetRedraw(TRUE)
end event

event lbuttonup;Long ll_index, ll_count, ll_y, ll_height

ll_count = UpperBound(istr_events)

ll_y = UnitsToPixels(ypos, YUnitsToPixels!)
ll_height = UnitsToPixels(Height, YUnitsToPixels!)

ll_index = ((ll_height / ScaleDPI(22)) * (ll_y / ll_height)) + 1

IF ll_index > 0 AND ll_index <= ll_count THEN
	 istr_selectedevent =  istr_events[ll_index]		 
	 SetRedraw(TRUE)
END IF

end event

event mousemove;Long ll_index, ll_count, ll_y, ll_height

IF NOT of_ismousecaptured() THEN
	of_capturemouse()
END IF

str_schedulemappedevents lstr_empty
istr_mouseoverevent = lstr_empty

ll_count = UpperBound(istr_events)
ll_y = UnitsToPixels(ypos, YUnitsToPixels!)
ll_height = UnitsToPixels(Height, YUnitsToPixels!)

ll_index = ((ll_height / ScaleDPI(22)) * (ll_y / ll_height)) + 1

IF ll_index > 0 AND ll_index <= ll_count THEN
	 istr_mouseoverevent =  istr_events[ll_index]		 
	 SetRedraw(TRUE)
END IF

end event

on uo_1.destroy
call u_cst_canvas::destroy
end on

event onpaint;call super::onpaint;LongPtr ull_BackBrushColor
Long ll_width
Integer li_index, li_count, li_multipass
LongPtr lul_Graphic
Boolean ll_selected, ll_mouseover

istr_morelist.parentschedule.iul_textfont = istr_morelist.parentschedule.of_CreateFont(hdc, istr_morelist.parentschedule.FontName, istr_morelist.parentschedule.TextSize, FALSE)

istr_input.GdiplusVersion = 1
inv_win32.GdiplusStartup(iul_GdiToken, istr_input, istr_output)	

//Setup
inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
inv_win32.GdipSetSmoothingMode(lul_Graphic, 5)

//DRAW BACKGROUND
RECT rc
// determine control size
GetClientRect(Handle(THIS), rc)
// create a brush
ull_BackBrushColor = CreateSolidBrush(RGB(255,255,255)) //White background

// fill the background
FillRect(hdc, rc, ull_BackBrushColor)

DeleteObject(ull_BackBrushColor)

ll_width = UnitsToPixels(Width, XUnitsToPixels!)

li_count = UpperBound(istr_events)

FOR li_multipass = 1 TO 2
FOR li_index = 1 TO li_count
	ll_selected = FALSE
	ll_mouseover = FALSE
	
	IF IsValid(istr_selectedevent) THEN
		IF istr_events[li_index] = istr_selectedevent THEN ll_selected = TRUE
	END IF
	
	IF ll_selected AND li_multipass = 1 THEN CONTINUE
	IF NOT ll_selected AND li_multipass = 2 THEN CONTINUE

	IF IsValid(istr_mouseoverevent) THEN
		IF istr_events[li_index] = istr_mouseoverevent THEN ll_mouseover = TRUE
	END IF
	
	IF Date(istr_events[li_index].eventobject.StartDateTime) = Date(istr_events[li_index].eventobject.EndDateTime) AND &
	    istr_events[li_index].eventobject.AllDayEvent = FALSE THEN
		istr_morelist.parentschedule.of_DrawMonthDayEvent (lul_Graphic, hdc, istr_events[li_index].eventobject, ScaleDPI(4), ScaleDPI(2 + ((li_index - 1) * 22)), ScaleDPI(ll_width - 6), ScaleDPI(22), ll_selected, ll_mouseover)
	ELSE
		istr_morelist.parentschedule.of_DrawMonthFullDayEvent (hdc, lul_Graphic, istr_events[li_index].eventobject, ScaleDPI(4), ScaleDPI(2 + ((li_index - 1) * 22)), ScaleDPI(ll_width - 4), ScaleDPI(22), ll_selected)
	END IF
NEXT
NEXT

//Cleanup
inv_win32.GdipDeleteGraphics(lul_Graphic)
inv_win32.GdiplusShutdown(iul_GdiToken)
inv_win32.DeleteObject(istr_morelist.parentschedule.iul_textfont)

RETURN 1
end event

event mouseleave;call super::mouseleave;IF IsValid(istr_mouseoverevent) THEN
	str_schedulemappedevents lstr_empty
	istr_mouseoverevent = lstr_empty
	SetRedraw(TRUE)
END IF
end event

event wm_keyup;call super::wm_keyup;str_schedulemappedevents lstr_empty
Long ll_index, ll_count
str_schedulemappedevents lstr_events[]
	
IF wparam = 46 THEN //DELETE
	IF IsValid(istr_selectedevent) THEN
		IF NOT istr_selectedevent.eventobject.IsReadOnly THEN
			istr_morelist.parentschedule.of_DeleteEvent(istr_selectedevent)
			
			istr_selectedevent = lstr_empty
			
			istr_morelist.s_loadedevents = istr_morelist.parentschedule.s_loadedevents
			
			of_LoadEvents()
			SetRedraw(TRUE)
		END IF
	END IF
END IF

IF wparam = 27 THEN //Escape
	Close(PARENT)
END IF
end event

