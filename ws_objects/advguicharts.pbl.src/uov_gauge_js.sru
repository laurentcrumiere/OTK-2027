$PBExportHeader$uov_gauge_js.sru
$PBExportComments$Chart.js datawindow control
forward
global type uov_gauge_js from userobject
end type
type wb_gauge from uov_pbwc_wv_gauge within uov_gauge_js
end type
type dw_default_image from datawindow within uov_gauge_js
end type
type ole_gauge from uov_pbwc_ie_gauge within uov_gauge_js
end type
end forward

global type uov_gauge_js from userobject
integer width = 910
integer height = 556
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event ue_size pbm_size
event ue_init ( )
event data_loaded ( datastore datastore_datasource,  integer datasource_index )
event displayed ( )
event type string javascript_preview ( string as_code )
event clicked ( )
wb_gauge wb_gauge
dw_default_image dw_default_image
ole_gauge ole_gauge
end type
global uov_gauge_js uov_gauge_js

type variables
n_cst_pbwc_gauge_service inv_gauge_srv
string gaugeobject
string is_gauge_type

long size=200//size of gauge in pixels default is 200

//gauge opts attributes
decimal angle=-22 // The span of the gauge arc
decimal lineWidth=10// The line thickness
decimal pointer_Length=90// Relative to gauge radius
Decimal pointer_StrokeWidth=35// The thickness
String colorStart='#2DA3DC' // Colors
String colorStop= '#C0C0DB' // just experiment with them
String strokeColor= '#EEEEEE' // to see which ones work best for you
String color="#000000"// Fill color
Boolean generateGradient=true
String staticLabels_Font="10px sans-serif"// Specifies font
String staticLabels_Labels= "[0,  3000]"// Print labels at these values
String staticLabels_color  // Optional: Label text color
integer fractionDigit=0 // Optional: Numerical precision. 0=round off
Real maxValue=100 // set max gauge value
Real minValue=0// set min value
Integer animationSpeed=32
Real Value=50// set actual value
decimal radiusScale
String StaticZonescolor[]
String StaticZonesmin[]
String StaticZonesmax[]
String StaticZonesHeight[]

String StaticZonescolor_list
String StaticZonesmin_list
String StaticZonesmax_list
String StaticZonesHeight_list


boolean limitMax=false,limitMin,HighDpiSupport=True
integer lines=12// The number of lines to draw
string Labels

//value_textfield
long value_text_top,value_text_width,value_text_left,value_text_right

string value_text_align, value_text_font_family,value_text_font_color,value_text_font_weight
string value_text_font_size

//unit_textfiled
string unit_text
long unit_text_top,unit_text_width,unit_text_left
string unit_text_align, unit_text_font_family,unit_text_font_color,unit_text_font_weight
string unit_text_font_size

//Title_textfiled
string Title_text
long Title_text_top,Title_text_width,Title_text_left
string Title_text_align, Title_text_font_family,Title_text_font_color,Title_text_font_weight
string Title_text_font_size

//gauge layout
long gauge_top,gauge_left,gauge_height
string gauge_background_color
//web browser mode
boolean ib_use_webview_control
end variables

forward prototypes
public function integer print ()
public function string getpngfilename ()
public subroutine of_set_value (real ar_value)
public subroutine of_refresh_display ()
public subroutine of_set_arrays ()
end prototypes

event ue_size;IF ib_use_webview_control THEN
	wb_gauge.resize(this.width, this.height)
	ole_gauge.hide()
ELSE
	ole_gauge.resize(this.width, this.height)
	wb_gauge.hide()
END IF


end event

event ue_init();IF ib_use_webview_control = FALSE THEN
	ole_gauge.object.width = unitstopixels(ole_gauge.width, xunitstopixels!)
	ole_gauge.object.height = unitstopixels(ole_gauge.height, yunitstopixels!)
END IF

inv_gauge_srv.of_create_gauge()




end event

event type string javascript_preview(string as_code);return as_code
end event

public function integer print ();
return 0
//return inv_graph_srv.of_print(this)

end function

public function string getpngfilename ();return ""
//return inv_graph_srv.of_export_for_printing(this)
end function

public subroutine of_set_value (real ar_value);// -----------------------------------------------------------------------------
// SCRIPT:     of_set_value
//
// PURPOSE:    Set the value of the gauge and moves the pointer
//
// ARGUMENTS: 
//
// RETURN:		String - workstation temp folder path
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_command
this.value = ar_value
ls_command += ' gauge.set('+string(ar_value)+'); '+ this.inv_gauge_srv.is_pbcr


IF ib_use_webview_control = FALSE THEN
	this.inv_gauge_srv.ioo.document.ParentWindow.ExecScript(ls_command)
ELSE
	string ls_result, ls_error
	this.inv_gauge_srv.iwb.EvaluateJavascriptSync(ls_command, ls_Result, ls_Error)
END IF

end subroutine

public subroutine of_refresh_display ();// -----------------------------------------------------------------------------
// SCRIPT:     of_refresh_display
//
// PURPOSE:    Refreshes display. Call this function after modifying gauge attributes
//
// ARGUMENTS: 
//
// RETURN:		String - workstation temp folder path
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
 inv_gauge_srv.of_refresh_gauge()
end subroutine

public subroutine of_set_arrays ();String ls_StaticZonescolor
String ls_StaticZonesmin
String ls_StaticZonesmax
String ls_StaticZonesHeight
int ii
n_cst_pbwc_string lnv_string

ls_StaticZonescolor = lnv_string.of_gettoken(StaticZonescolor_list,"|")
ls_StaticZonesmin = lnv_string.of_gettoken(StaticZonesmin_list,"|")
ls_StaticZonesmax = lnv_string.of_gettoken(StaticZonesmax_list,"|")
ls_StaticZonesHeight = lnv_string.of_gettoken(StaticZonesHeight_list,"|")

DO WHILE ls_StaticZonescolor <> ""
	ii++
	StaticZonescolor[ii]=ls_StaticZonescolor
	StaticZonesmin[ii]=ls_StaticZonesmin
 	StaticZonesmax[ii]=ls_StaticZonesmax
 	StaticZonesHeight[ii]=ls_StaticZonesHeight
	
	ls_StaticZonescolor = lnv_string.of_gettoken(StaticZonescolor_list,"|")
	ls_StaticZonesmin = lnv_string.of_gettoken(StaticZonesmin_list,"|")
	ls_StaticZonesmax = lnv_string.of_gettoken(StaticZonesmax_list,"|")
	ls_StaticZonesHeight = lnv_string.of_gettoken(StaticZonesHeight_list,"|")
LOOP

end subroutine

event constructor;ib_use_webview_control = gnv_pbwc_core_engine.ib_use_webview_control

of_set_arrays()
dw_default_image.hide()
inv_gauge_srv.of_register_gauge_control(this)
dw_default_image.hide()

IF ib_use_webview_control THEN
	wb_gauge.resize(this.width,this.height)
	ole_gauge.hide()
	inv_gauge_srv.of_register_wb_object(wb_gauge)
ELSE
	ole_gauge.resize(this.width,this.height)
	wb_gauge.hide()
	inv_gauge_srv.of_register_ole_object(ole_gauge.object)
END IF
inv_gauge_srv.of_init_document()




end event

on uov_gauge_js.create
this.wb_gauge=create wb_gauge
this.dw_default_image=create dw_default_image
this.ole_gauge=create ole_gauge
this.Control[]={this.wb_gauge,&
this.dw_default_image,&
this.ole_gauge}
end on

on uov_gauge_js.destroy
destroy(this.wb_gauge)
destroy(this.dw_default_image)
destroy(this.ole_gauge)
end on

type wb_gauge from uov_pbwc_wv_gauge within uov_gauge_js
integer width = 82
integer height = 96
end type

event ue_pbwc_gauge;call super::ue_pbwc_gauge;event ue_init()
end event

event displayed;call super::displayed;parent.event displayed()
end event

type dw_default_image from datawindow within uov_gauge_js
integer width = 891
integer height = 528
integer taborder = 20
boolean enabled = false
string title = "none"
string dataobject = "d_pbwc_gauge_default_image"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ole_gauge from uov_pbwc_ie_gauge within uov_gauge_js
integer y = 4
integer width = 32
integer height = 32
integer taborder = 10
boolean border = false
string binarykey = "uov_gauge_js.udo"
end type

event ue_pbwc_gauge;call super::ue_pbwc_gauge;event ue_init()
end event

event displayed;call super::displayed;parent.event displayed()
end event


Start of PowerBuilder Binary Data Section : Do NOT Edit
05uov_gauge_js.bin 
2A00000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000a5cf3bb001da4b3600000003000001800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f00000000a5cf14a001da4b36a5cf3bb001da4b36000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000009c000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
22ffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c000000b9000000d40000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c000000b9000000d40000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
15uov_gauge_js.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
