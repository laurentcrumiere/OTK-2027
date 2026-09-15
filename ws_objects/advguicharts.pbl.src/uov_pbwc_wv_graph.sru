$PBExportHeader$uov_pbwc_wv_graph.sru
forward
global type uov_pbwc_wv_graph from uov_pbwc_wv
end type
end forward

global type uov_pbwc_wv_graph from uov_pbwc_wv
event ue_pbwc_graph ( )
event clickedongraph ( string as_label,  string as_value,  string as_series )
event doubleclickedongraph ( string as_label,  string as_value,  string as_series )
event displayed ( )
event ue_pbwc_graph45 ( )
end type
global uov_pbwc_wv_graph uov_pbwc_wv_graph

type variables

end variables

on uov_pbwc_wv_graph.create
call super::create
end on

on uov_pbwc_wv_graph.destroy
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
string ls_action, ls_label, ls_value, ls_series, ls_text
ls_text = titletext
ls_action = lnv_string.of_getxml_value(ls_text,"action")
CHOOSE CASE ls_action
	CASE "clicked"
		ls_label = lnv_string.of_getxml_value(ls_text,"label")
		ls_value = lnv_string.of_getxml_value(ls_text,"value")
		ls_series = lnv_string.of_getxml_value(ls_text,"series")
		this.event clickedongraph(ls_label,ls_value,ls_series)
	CASE "doubleclicked"
		ls_label = lnv_string.of_getxml_value(ls_text,"label")
		ls_value = lnv_string.of_getxml_value(ls_text,"value")
		ls_series = lnv_string.of_getxml_value(ls_text,"series")
		this.event doubleclickedongraph(ls_label,ls_value,ls_series)
	CASE "displayed"
		this.event displayed()
END CHOOSE

end event

