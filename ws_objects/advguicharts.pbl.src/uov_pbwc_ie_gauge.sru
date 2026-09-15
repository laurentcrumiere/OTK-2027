$PBExportHeader$uov_pbwc_ie_gauge.sru
forward
global type uov_pbwc_ie_gauge from uov_pbwc_ie
end type
end forward

global type uov_pbwc_ie_gauge from uov_pbwc_ie
event ue_pbwc_gauge ( )
event doubleclickedongraph ( string as_label,  string as_value,  string as_series )
event displayed ( )
end type
global uov_pbwc_ie_gauge uov_pbwc_ie_gauge

type variables

end variables

on uov_pbwc_ie_gauge.create
call super::create
end on

on uov_pbwc_ie_gauge.destroy
call super::destroy
end on

event titlechange;call super::titlechange;// -----------------------------------------------------------------------------
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
ls_action = lnv_string.of_getxml_value(text,"action")
CHOOSE CASE ls_action

	CASE "displayed"
		this.event displayed()
END CHOOSE

end event

