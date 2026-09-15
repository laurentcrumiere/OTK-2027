$PBExportHeader$uo_date_calendrier.sru
forward
global type uo_date_calendrier from userobject
end type
type em_date from editmask within uo_date_calendrier
end type
type dp_date from datepicker within uo_date_calendrier
end type
end forward

global type uo_date_calendrier from userobject
string tag = "no resizeall"
integer width = 443
integer height = 92
long backcolor = 67108864
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
em_date em_date
dp_date dp_date
end type
global uo_date_calendrier uo_date_calendrier

forward prototypes
public function date getthedate ()
public subroutine setdate (date vdate)
end prototypes

public function date getthedate ();
date vdate
time vtime

// ne renvoe QUE la date
//dp_date.getValue( vdate , vtime )

vdate = date(em_date.text)

return vdate
end function

public subroutine setdate (date vdate);
// pour mettre une date
dp_date.setValue( vdate , now() )
em_date.text = string(vdate )
this.text = em_date.text 
end subroutine

on uo_date_calendrier.create
this.em_date=create em_date
this.dp_date=create dp_date
this.Control[]={this.em_date,&
this.dp_date}
end on

on uo_date_calendrier.destroy
destroy(this.em_date)
destroy(this.dp_date)
end on

type em_date from editmask within uo_date_calendrier
integer x = 14
integer y = 16
integer width = 306
integer height = 72
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean border = false
alignment alignment = center!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

event modified;

// pour mettre une date
dp_date.setValue( date(this.text) , now() )
parent.text = this.text

end event

type dp_date from datepicker within uo_date_calendrier
integer width = 457
integer height = 100
boolean border = true
borderstyle borderstyle = stylelowered!
datetimeformat format = dtfcustom!
string customformat = "ddmmyyyy"
date maxdate = Date("2999-12-31")
date mindate = Date("1800-01-01")
datetime value = DateTime(Date("2025-06-11"), Time("10:43:07.000000"))
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer calendarfontweight = 400
weekday firstdayofweek = monday!
boolean todaysection = true
boolean todaycircle = true
end type

event valuechanged;
em_date.text = string(date(dtm),'dd/mm/yy')
parent.Text = em_date.text 

end event

