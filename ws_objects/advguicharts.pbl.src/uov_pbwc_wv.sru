$PBExportHeader$uov_pbwc_wv.sru
forward
global type uov_pbwc_wv from webbrowser
end type
end forward

global type uov_pbwc_wv from webbrowser
integer width = 1202
integer height = 820
end type
global uov_pbwc_wv uov_pbwc_wv

type variables
string is_uri
end variables

on uov_pbwc_wv.create
call super::create
end on

on uov_pbwc_wv.destroy
call super::destroy
end on

event navigationerror;if failedurl = "javascript:void(0);" THEN return
end event

event navigationcompleted;
//string ls_command
//disables context menu
//ls_command = "document.oncontextmenu = function() {    return false;}"
//this.object.document.ParentWindow.ExecScript(ls_command)


//triggers ue_filename event (if url is blank.htm, triggers "ue_blank" event)
// page display is made in another thread, after the navigate function
// you must wait the page to be displayed to continue the powerbuilder code
string ls_url,ls_event
ls_url = is_uri
ls_event = gnv_config.of_get_filename_from_uri(ls_url,TRUE)
this.triggerevent("ue_"+ls_event)
end event

event navigationstart;is_uri = uri
end event

