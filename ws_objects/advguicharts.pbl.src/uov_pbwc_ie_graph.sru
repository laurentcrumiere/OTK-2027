$PBExportHeader$uov_pbwc_ie_graph.sru
forward
global type uov_pbwc_ie_graph from uov_pbwc_ie
end type
end forward

global type uov_pbwc_ie_graph from uov_pbwc_ie
event ue_pbwc_graph ( )
event clickedongraph ( string as_label,  string as_value,  string as_series )
event doubleclickedongraph ( string as_label,  string as_value,  string as_series )
event displayed ( )
end type
global uov_pbwc_ie_graph uov_pbwc_ie_graph

type variables
time ldt_last_click
end variables

event clickedongraph(string as_label, string as_value, string as_series);// -----------------------------------------------------------------------------
// SCRIPT:     clickedongraph
//
// PURPOSE:    Trigers when the user clicked on data area. 
//					Use this event for coding Drilldown features.
//					triggers doubleclicked event if doubleclicked on data.
//
// ARGUMENTS:	string  clicked data label
//						string  clicked data value
//						string  clicked data series
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_seconds
ll_seconds = secondsafter(ldt_last_click,now())
if ll_seconds < 2 THEN 
	this.event doubleclickedongraph(as_label,as_value,as_series)
END IF
ldt_last_click = now()
end event

on uov_pbwc_ie_graph.create
call super::create
end on

on uov_pbwc_ie_graph.destroy
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
	CASE "clicked"
		ls_label = lnv_string.of_getxml_value(text,"label")
		ls_value = lnv_string.of_getxml_value(text,"value")
		ls_series = lnv_string.of_getxml_value(text,"series")
		this.event clickedongraph(ls_label,ls_value,ls_series)
	CASE "doubleclicked"
		ls_label = lnv_string.of_getxml_value(text,"label")
		ls_value = lnv_string.of_getxml_value(text,"value")
		ls_series = lnv_string.of_getxml_value(text,"series")
		this.event doubleclickedongraph(ls_label,ls_value,ls_series)
	CASE "displayed"
		this.event displayed()
END CHOOSE

end event

event constructor;call super::constructor;ldt_last_click = now()
end event

