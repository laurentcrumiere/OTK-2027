$PBExportHeader$uov_pbwc_wv_gauge.sru
forward
global type uov_pbwc_wv_gauge from uov_pbwc_wv
end type
end forward

global type uov_pbwc_wv_gauge from uov_pbwc_wv
boolean border = false
event ue_pbwc_gauge ( )
event clickedongraph ( string as_label,  string as_value,  string as_series )
event doubleclickedongraph ( string as_label,  string as_value,  string as_series )
event displayed ( )
end type
global uov_pbwc_wv_gauge uov_pbwc_wv_gauge

type variables

end variables

on uov_pbwc_wv_gauge.create
call super::create
end on

on uov_pbwc_wv_gauge.destroy
call super::destroy
end on

event titletextchanged;call super::titletextchanged;// -----------------------------------------------------------------------------
// SCRIPT:     event handler
//
// PURPOSE:    triggers event coming for graph user interaction
//
// ARGUMENTS: string : XML code for event
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
//search for action tag
n_cst_pbwc_string lnv_string
string ls_action, ls_label, ls_value, ls_series
ls_action = lnv_string.of_getxml_value(titletext,"action")
CHOOSE CASE ls_action

	CASE "displayed"
		this.event displayed()
END CHOOSE

end event

