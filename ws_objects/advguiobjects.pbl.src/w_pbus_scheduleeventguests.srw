$PBExportHeader$w_pbus_scheduleeventguests.srw
forward
global type w_pbus_scheduleeventguests from w_pbus_spa_captionless
end type
type uo_search from u_cst_powersearchdropdown within w_pbus_scheduleeventguests
end type
type dw_1 from datawindow within w_pbus_scheduleeventguests
end type
type st_addguest from statictext within w_pbus_scheduleeventguests
end type
type cb_save from u_cst_commandbutton within w_pbus_scheduleeventguests
end type
type st_noguests from statictext within w_pbus_scheduleeventguests
end type
end forward

global type w_pbus_scheduleeventguests from w_pbus_spa_captionless
integer width = 1545
integer height = 1252
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
uo_search uo_search
dw_1 dw_1
st_addguest st_addguest
cb_save cb_save
st_noguests st_noguests
end type
global w_pbus_scheduleeventguests w_pbus_scheduleeventguests

type variables
str_scheduleeventedit ist_event
Datastore ids_searchdata

n_uspb_resourcemanager inv_resourcemanager
end variables

forward prototypes
public function string of_getdisplayname (scheduleeventguest a_guest)
end prototypes

public function string of_getdisplayname (scheduleeventguest a_guest);String ls_data
Boolean lb_bracketemail

IF Len(Trim(a_guest.Name)) > 0 THEN
	ls_data = a_guest.Name
END IF

IF Len(Trim(a_guest.Email)) > 0 THEN
	IF Len(Trim(ls_data)) > 0 THEN
		ls_data = ls_data + " <"
		lb_bracketemail = TRUE
	END IF
	
	ls_data = ls_data + a_guest.Email
	
	IF lb_bracketemail THEN
		ls_data = ls_data + ">"
	END IF
END IF

RETURN ls_data
end function

on w_pbus_scheduleeventguests.create
int iCurrent
call super::create
this.uo_search=create uo_search
this.dw_1=create dw_1
this.st_addguest=create st_addguest
this.cb_save=create cb_save
this.st_noguests=create st_noguests
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_search
this.Control[iCurrent+2]=this.dw_1
this.Control[iCurrent+3]=this.st_addguest
this.Control[iCurrent+4]=this.cb_save
this.Control[iCurrent+5]=this.st_noguests
end on

on w_pbus_scheduleeventguests.destroy
call super::destroy
destroy(this.uo_search)
destroy(this.dw_1)
destroy(this.st_addguest)
destroy(this.cb_save)
destroy(this.st_noguests)
end on

event open;call super::open;Long ll_index, ll_count, ll_row

ist_event = Message.PowerObjectParm

of_SetTheme(ist_event.theme)
uo_search.of_SetTheme(ist_event.theme)
of_UseCustomColors(RGB(255,255,255), 0)

cb_save.Text = inv_resourcemanager.of_GetString("btn_save")
st_addguest.Text = inv_resourcemanager.of_GetString("LBL_PowerSchedule_AddGuests")
st_noguests.Text = inv_resourcemanager.of_GetString("LBL_PowerSchedule_NoGuestsAdded")

ids_searchdata = CREATE Datastore
ids_searchdata.DataObject = 'd_scheduleeventguest'

ll_count = UpperBound(ist_event.availableguests)

FOR ll_index = 1 TO ll_count
	ll_row = ids_searchdata.InsertRow(0)
	
	ids_searchdata.SetItem(ll_row, "displayname", of_GetDisplayName(ist_event.availableguests[ll_index]))
	ids_searchdata.SetItem(ll_row, "guestname", ist_event.availableguests[ll_index].Name)
	ids_searchdata.SetItem(ll_row, "guestemail", ist_event.availableguests[ll_index].email)
	ids_searchdata.SetItem(ll_row, "resourceid", ist_event.availableguests[ll_index].resourceid)
NEXT

uo_search.of_SetDatasource(ids_searchdata, 1)

ll_count = UpperBound(ist_event.eventobject.guests)

FOR ll_index = 1 TO ll_count
	ll_row = dw_1.InsertRow(0)
	
	dw_1.SetItem(ll_row, "displayname", of_GetDisplayName(ist_event.eventobject.guests[ll_index]))
	dw_1.SetItem(ll_row, "guestname", ist_event.eventobject.guests[ll_index].Name)
	dw_1.SetItem(ll_row, "guestemail", ist_event.eventobject.guests[ll_index].Email)
	dw_1.SetItem(ll_row, "resourceid", ist_event.eventobject.guests[ll_index].resourceid)
NEXT

IF dw_1.RowCount() = 0 THEN
	st_noguests.Show()
END IF

end event

event close;call super::close;DESTROY ids_searchdata
end event

type uo_spa_controls from w_pbus_spa_captionless`uo_spa_controls within w_pbus_scheduleeventguests
end type

type uo_search from u_cst_powersearchdropdown within w_pbus_scheduleeventguests
integer x = 32
integer y = 132
integer width = 1472
integer taborder = 30
boolean bringtotop = true
end type

on uo_search.destroy
call u_cst_powersearchdropdown::destroy
end on

event itemselected;call super::itemselected;Long ll_row
String ls_displayname

ll_row = dw_1.Find("DisplayName = '" + ids_searchdata.GetItemString(rownumber, "displayname") + "'", 1, dw_1.RowCount())

IF ll_row = 0 THEN
	ll_row = dw_1.InsertRow(0)
	
	dw_1.SetItem(ll_row, "displayname", ids_searchdata.GetItemString(rownumber, "displayname"))
	dw_1.SetItem(ll_row, "guestname", ids_searchdata.GetItemString(rownumber, "guestname"))
	dw_1.SetItem(ll_row, "guestemail", ids_searchdata.GetItemString(rownumber, "guestemail"))
	dw_1.SetItem(ll_row, "resourceid", ids_searchdata.GetItemNumber(rownumber, "resourceid"))
END IF

uo_search.of_Clear()

IF dw_1.RowCount() = 0 THEN
	st_noguests.Show()
ELSE
	st_noguests.Hide()
END IF
end event

event onenter;call super::onenter;Long ll_row

IF Len(Trim(searchterm)) = 0 THEN RETURN

ll_row = dw_1.InsertRow(0)

IF Pos(searchterm, "@") > 0 AND Pos(searchterm, ".") > 0 THEN
	dw_1.SetItem(ll_row, "displayname", searchterm)
	dw_1.SetItem(ll_row, "guestemail", searchterm)
ELSE
	dw_1.SetItem(ll_row, "displayname", searchterm)
	dw_1.SetItem(ll_row, "guestname", searchterm)
END IF

uo_search.of_Clear()

IF dw_1.RowCount() = 0 THEN
	st_noguests.Show()
ELSE
	st_noguests.Hide()
END IF
end event

type dw_1 from datawindow within w_pbus_scheduleeventguests
integer x = 37
integer y = 284
integer width = 1449
integer height = 776
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "d_scheduleeventguest"
boolean border = false
boolean livescroll = true
end type

event clicked;IF dwo.Name = 't_delete' THEN
	THIS.DeleteRow(Row)
	
	IF dw_1.RowCount() = 0 THEN
		st_noguests.Show()
	ELSE
		st_noguests.Hide()
	END IF
END IF
end event

type st_addguest from statictext within w_pbus_scheduleeventguests
integer x = 41
integer y = 24
integer width = 457
integer height = 88
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 8421504
long backcolor = 16777215
string text = "Add Guests"
boolean focusrectangle = false
end type

type cb_save from u_cst_commandbutton within w_pbus_scheduleeventguests
integer x = 1170
integer y = 1092
integer width = 315
integer taborder = 60
boolean bringtotop = true
string text = "Save"
string iconname = "powerschedule_save.png"
integer cornerradius = 3
end type

event clicked;call super::clicked;Long ll_index, ll_count
scheduleeventguest l_guests[]

ll_count = dw_1.RowCount()

FOR ll_index = 1 TO ll_count
	l_guests[ll_index].Name = dw_1.GetItemString(ll_index, "guestname")
	l_guests[ll_index].Email = dw_1.GetItemString(ll_index, "guestemail")
	l_guests[ll_index].ResourceId = dw_1.GetItemNumber(ll_index, "resourceid")
NEXT

ist_event.eventobject.guests = l_guests

CloseWithReturn(PARENT, ist_event)
end event

type st_noguests from statictext within w_pbus_scheduleeventguests
boolean visible = false
integer x = 82
integer y = 308
integer width = 530
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 8421504
long backcolor = 16777215
string text = "No Guests Added"
boolean focusrectangle = false
end type

