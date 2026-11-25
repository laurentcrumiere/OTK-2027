$PBExportHeader$w_pbus_scheduleevent_hidetime.srw
forward
global type w_pbus_scheduleevent_hidetime from w_pbus_scheduleevent
end type
end forward

global type w_pbus_scheduleevent_hidetime from w_pbus_scheduleevent
integer height = 1892
end type
global w_pbus_scheduleevent_hidetime w_pbus_scheduleevent_hidetime

forward prototypes
public function integer of_toggleallday (boolean ab_switch)
end prototypes

public function integer of_toggleallday (boolean ab_switch);RETURN 0
end function

on w_pbus_scheduleevent_hidetime.create
call super::create
end on

on w_pbus_scheduleevent_hidetime.destroy
call super::destroy
end on

type uo_spa_controls from w_pbus_scheduleevent`uo_spa_controls within w_pbus_scheduleevent_hidetime
end type

type uo_colorpicker from w_pbus_scheduleevent`uo_colorpicker within w_pbus_scheduleevent_hidetime
integer y = 1556
end type

type p_coloricon from w_pbus_scheduleevent`p_coloricon within w_pbus_scheduleevent_hidetime
integer y = 1552
end type

type p_2 from w_pbus_scheduleevent`p_2 within w_pbus_scheduleevent_hidetime
integer y = 932
end type

type st_placeholder from w_pbus_scheduleevent`st_placeholder within w_pbus_scheduleevent_hidetime
end type

type p_1 from w_pbus_scheduleevent`p_1 within w_pbus_scheduleevent_hidetime
boolean visible = false
end type

type ddlb_endtime from w_pbus_scheduleevent`ddlb_endtime within w_pbus_scheduleevent_hidetime
boolean visible = false
end type

type ddlb_starttime from w_pbus_scheduleevent`ddlb_starttime within w_pbus_scheduleevent_hidetime
boolean visible = false
end type

type cbx_allday from w_pbus_scheduleevent`cbx_allday within w_pbus_scheduleevent_hidetime
boolean visible = false
end type

type dp_enddate from w_pbus_scheduleevent`dp_enddate within w_pbus_scheduleevent_hidetime
boolean visible = false
end type

type dp_startdate from w_pbus_scheduleevent`dp_startdate within w_pbus_scheduleevent_hidetime
boolean visible = false
end type

type sle_title from w_pbus_scheduleevent`sle_title within w_pbus_scheduleevent_hidetime
end type

type rte_description from w_pbus_scheduleevent`rte_description within w_pbus_scheduleevent_hidetime
integer y = 944
end type

type cb_save from w_pbus_scheduleevent`cb_save within w_pbus_scheduleevent_hidetime
integer y = 1716
end type

type cb_delete from w_pbus_scheduleevent`cb_delete within w_pbus_scheduleevent_hidetime
integer y = 1716
end type

type st_eventdetails from w_pbus_scheduleevent`st_eventdetails within w_pbus_scheduleevent_hidetime
integer y = 332
end type

type p_location from w_pbus_scheduleevent`p_location within w_pbus_scheduleevent_hidetime
integer y = 468
end type

type sle_location from w_pbus_scheduleevent`sle_location within w_pbus_scheduleevent_hidetime
integer y = 468
end type

type ln_1 from w_pbus_scheduleevent`ln_1 within w_pbus_scheduleevent_hidetime
boolean visible = false
end type

type ln_2 from w_pbus_scheduleevent`ln_2 within w_pbus_scheduleevent_hidetime
boolean visible = false
end type

type ln_3 from w_pbus_scheduleevent`ln_3 within w_pbus_scheduleevent_hidetime
boolean visible = false
end type

type ln_eventdetails from w_pbus_scheduleevent`ln_eventdetails within w_pbus_scheduleevent_hidetime
integer beginy = 380
integer endy = 380
end type

type st_locationplaceholder from w_pbus_scheduleevent`st_locationplaceholder within w_pbus_scheduleevent_hidetime
integer y = 484
end type

type p_3 from w_pbus_scheduleevent`p_3 within w_pbus_scheduleevent_hidetime
integer y = 620
end type

type cbx_private from w_pbus_scheduleevent`cbx_private within w_pbus_scheduleevent_hidetime
integer y = 628
end type

type st_descriptionplaceholder from w_pbus_scheduleevent`st_descriptionplaceholder within w_pbus_scheduleevent_hidetime
integer y = 952
end type

type p_4 from w_pbus_scheduleevent`p_4 within w_pbus_scheduleevent_hidetime
integer y = 772
end type

type sle_guests from w_pbus_scheduleevent`sle_guests within w_pbus_scheduleevent_hidetime
integer y = 776
end type

type st_guestsplaceholder from w_pbus_scheduleevent`st_guestsplaceholder within w_pbus_scheduleevent_hidetime
integer y = 792
end type

type ddlb_status from w_pbus_scheduleevent`ddlb_status within w_pbus_scheduleevent_hidetime
integer y = 624
end type

type cbx_meeting from w_pbus_scheduleevent`cbx_meeting within w_pbus_scheduleevent_hidetime
integer y = 628
end type

