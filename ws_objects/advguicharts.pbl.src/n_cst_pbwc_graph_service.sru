$PBExportHeader$n_cst_pbwc_graph_service.sru
forward
global type n_cst_pbwc_graph_service from nonvisualobject
end type
end forward

global type n_cst_pbwc_graph_service from nonvisualobject autoinstantiate
end type

type prototypes
FUNCTION boolean CryptBinaryToString ( &
    Blob pbBinary, &
    ulong cbBinary, &
    ulong dwFlags, &
    Ref string pszString, &
    Ref ulong pcchString ) &
LIBRARY "crypt32.dll" ALIAS FOR "CryptBinaryToStringA;Ansi"

FUNCTION boolean CryptStringToBinary ( &
    string pszString, &
    ulong cchString, &
    ulong dwFlags, &
    Ref blob pbBinary, &
    Ref ulong pcbBinary, &
    Ref ulong pdwSkip, &
    Ref ulong pdwFlags ) &
LIBRARY "crypt32.dll" ALIAS FOR "CryptStringToBinaryA;Ansi"
end prototypes

type variables
uov_chart_js_datawindow iuo_chart_js_datawindow //link to the userobject that contains the graph
oleobject ioo //link to activeX object that displays the graph
webbrowser iwb
string is_cr = "\n" //javascript carriage return
string is_pbcr = "~r~n" //powerbuilder carriage return
string is_chartjs_path
n_cst_pbwc_string inv_string
dec ii_chartjs_version = 4.5// 01/01/2026	FFasolin	Added support for char.js 4.5
string is_empty_page_file_name
boolean ib_display_version=false
boolean ib_refresh_init_document = true

//graph definition data are stored into datastores to make it easier to manipulate
n_cst_pbwc_datastore ids_source_code_container //used to load graph definition, contains all datastore data in its data attribute.1 row per datastore.
n_cst_pbwc_datastore ids_graph_configuration_properties //animations, layout, legend, title, tooltip, 1 row for the whole graph
n_cst_pbwc_datastore ids_charts_properties //datasource definition, chart type , configuration options, 1 row per chart in the graph
n_cst_pbwc_datastore ids_datasets_properties //dataset definition for all defined charts (dataset colors...), n rows per chart
n_cst_pbwc_datastore ids_chart_config_options //configuration options for all defined charts in the graph, 1 row per chart
n_cst_pbwc_datastore ids_chart_axes // configuration of axes for the graph, n row per graph  (axe type,tick configuration, scale title configuration...)

//datastores used to manipulate data from chart data source, and used to build data related source code.
n_cst_pbwc_datastore ids_chart_datasource[] //data containers for each chart obtained from datasource definition, 1 datasource per chart in the graph
n_cst_pbwc_datastore ids_datasource_labels
n_cst_pbwc_datastore ids_datasource_datasets

string is_source_comment
Boolean ib_sample_data_retrieved[]//to remember if a retrieved has been issued on sample data

integer li_chart_index_max = 1
integer li_axes_index_max =1

// Base64, without headers
CONSTANT Ulong CRYPT_STRING_BASE64 = 1

//datastore used for printing
n_cst_pbwc_datastore ids_print
string is_print_bitmap_file_name[]
long il_printing_id

string is_last_command

boolean ib_use_webview_control

string is_default_value='0'
string is_default_fonts
string is_default_fontcolor

end variables

forward prototypes
public function integer of_dw_replace_pb_graph (datawindow adw, string as_report_name)
public function integer of_dw_add_ie_graph (datawindow adw, string as_dw_object_name, long al_x, long al_y, long al_w, long al_h, string as_band)
public function integer of_add_picture_graph (datawindow adw, string as_dw_object_name, long al_x, long al_y, long al_w, long al_h, string as_band)
public function string of_get_temp_folder ()
public function string of_file_to_code (string as_file)
public subroutine of_register_ole_object (oleobject aoo)
public function string of_get_empty_graph_html ()
public subroutine of_init_html ()
public function string of_get_url_from_file (string as_filename)
public subroutine of_init_document ()
public function string of_check_required ()
public function integer of_save (string as_object_name, string as_pbl)
public function boolean of_has_been_modified ()
public function integer of_display_graph ()
public subroutine of_init_dataset ()
public function string of_get_label_code ()
public function string of_load_property_data (n_cst_pbwc_datastore ads_property_data, string as_property_data)
public function integer of_set_datasource (integer ai_chart_index)
public function integer of_save (string as_gr_object_name, string as_pbl_name, string as_comment)
public subroutine of_add_properties_data (n_cst_pbwc_datastore ads_property_datastore, string as_source_name, string as_comment)
public function string describe (string as_describe)
public function integer of_get_index (string as_source, string as_array_name)
public function string of_get_property_value (n_cst_pbwc_datastore ads, string as_search, string as_column)
public function string modify (string as_modify, string as_value)
public subroutine of_set_property_value (n_cst_pbwc_datastore ads, string as_search, string as_column, string as_value)
public function integer of_add_chart ()
public function integer of_set_chart_type (integer ai_chart_index, string as_chart_type)
public function integer of_delete_chart (integer ai_chart_index)
public function integer of_add_dataset (integer ai_chart_index)
public function integer of_delete_dataset (integer ai_chart_index, integer ai_dataset_index)
public function integer of_add_axis ()
public function integer of_delete_axis (integer ai_axes_index)
public subroutine of_set_max_properties ()
public function integer of_retrieve_chart_sample_data (integer ia_chart_datasource_index, boolean ab_keep_retained_data)
public function string of_check_required (integer ai_chart_index)
public function string of_build_labels_list ()
public function string of_build_dataset_list ()
public function string of_get_dataset_configuration (integer ai_chart_index, integer ai_dataset_index)
public function string of_get_property_code (string as_value, string as_javascript_name, string as_string_before_value, string as_string_after_value, boolean ab_array)
public function string of_get_global_configuration_code ()
public function string of_get_options ()
public function string of_get_global_property_code (string as_value, string as_javascript_name, string as_string_before_value, string as_string_after_value, boolean ab_array)
public function string of_build_scales ()
public function string of_build_options ()
public function blob of_get_png_binary ()
public function integer of_saveas_png (string as_filename)
public function integer of_settransobject (transaction atr)
public function string of_set_dw_object (datastore ads, string as_dw_object_name, string as_pbl)
public function string of_open (string as_object_name, string as_pbl)
public function integer of_print (dragobject ado)
public function string of_export_for_printing (dragobject ado)
public function string of_get_last_command ()
public subroutine of_register_chart_js_datawindow (uov_chart_js_datawindow auo)
public function integer of_saveas_html (string as_filename)
public subroutine of_register_wb_object (webbrowser awb)
public function string of_get_global_configuration_code45 ()
public function string of_get_hover ()
public function string of_get_default_font ()
public function string of_build_scales_45 ()
public function integer of_add_to_section (ref string as_source_code, string as_section_name, string as_code)
public function integer of_replace_section (ref string as_source_code, string as_section_name, string as_code)
public function string of_get_last_section_name (string as_full_section_name)
public function integer of_replace_tagged_text (ref string as_source, string as_opening_tag, string as_ending_tag, string as_code)
end prototypes

public function integer of_dw_replace_pb_graph (datawindow adw, string as_report_name);// -----------------------------------------------------------------------------
// SCRIPT:     of_dw_replace_pb_graph
//
// PURPOSE:    Adds a pbwc graph control in replacement of a graph report control
//
// ARGUMENTS:  adw	- reference to datawindow control containing 
// 					datawindow object in which the pbwc graph will be created
//					as_report_name : Name of the existing pb graph report (new graph control name will be the same with pbwc_ prefix)
//
// RETURN:		1 = Success, -1= failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_x, ll_y, ll_w, ll_h
string ls_band
int li_ret

ll_x = long(adw.describe(as_report_name+".x"))
ll_y = long(adw.describe(as_report_name+".y"))
ll_h = long(adw.describe(as_report_name+".height"))
ll_w = long(adw.describe(as_report_name+".width"))
ls_band = adw.describe(as_report_name+".band")
IF ll_h= 0 and ll_w=0 THEN return -1

li_ret = of_dw_add_ie_graph(adw, "pbwc_"+as_report_name, ll_x, ll_y, ll_w,ll_h, ls_band)
IF li_ret > 0 THEN
	adw.modify(as_report_name+".visible=0")
END IF

return li_ret


end function

public function integer of_dw_add_ie_graph (datawindow adw, string as_dw_object_name, long al_x, long al_y, long al_w, long al_h, string as_band);// -----------------------------------------------------------------------------
// SCRIPT:     of_dw_add_ie_graph
//
// PURPOSE:    Creates a report object with ie ole control as a replacement for graph object in a dw
//
// ARGUMENTS:  adw	- reference to datawindow control containing 
// 					datawindow object in which the pbwc graph will be created
//					as_dw_object_name - Name of dw object that will be created
//					al_x, al_y, al_w, al_h : x, y, w, h of control
//					as_band = Band name in wich control will display
//
// RETURN:		1 = Success, -1= failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_modify,ls_err
ls_modify = 'report(band='+as_band+' dataobject="d_pbwc_explorer" x="'+string(al_x)+'" y="'+string(al_y)+'" height="'+string(al_h)+'" width="'+string(al_w)+'" border="0"'
ls_modify += ' tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0"  '
ls_modify += 'height.autosize=yes criteria="" trail_footer = yes  name='+as_dw_object_name+' visible="1"  slideup=directlyabove )'
ls_err = adw.modify('CREATE ' + ls_modify)
IF ls_err <> "" THEN return -1
return 1



end function

public function integer of_add_picture_graph (datawindow adw, string as_dw_object_name, long al_x, long al_y, long al_w, long al_h, string as_band);// -----------------------------------------------------------------------------
// SCRIPT:     of_dw_add_picture_graph
//
// PURPOSE:    Creates a picture object as a replaceement for graph object in a dw
//
// ARGUMENTS:  adw	- reference to datawindow control containing 
// 					datawindow object in which the pbwc graph will be created
//					as_dw_object_name - Name of dw object that will be created
//					al_x, al_y, al_w, al_h : x, y, w, h of control
//					as_band = Band name in wich control will display
//
// RETURN:		1 = Success, -1= failure
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_modify,ls_err
ls_modify = 'bitmap(band='+as_band+' filename="" x="'+string(al_x)+'" y="'+string(al_y)+'" height="'+string(al_h)+'" width="'+string(al_w)+'" border="0" '
ls_modify += 'tooltip.backcolor="134217752" tooltip.delay.initial="0" tooltip.delay.visible="32000" tooltip.enabled="0" tooltip.hasclosebutton="0" tooltip.icon="0" tooltip.isbubble="0" tooltip.maxwidth="0" tooltip.textcolor="134217751" tooltip.transparency="0"'
ls_modify += '  name='+as_dw_object_name+' visible="1" transparency="0" )'

ls_err = adw.modify('CREATE ' + ls_modify)
IF ls_err <> "" THEN return -1
return 1



end function

public function string of_get_temp_folder ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_temp_folder
//
// PURPOSE:    
//
// ARGUMENTS: 
//
// RETURN:		String - workstation temp folder path
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
ContextKeyword lcxk_base
string ls_temp[], ls_temp_folder
this.GetContextService("Keyword", lcxk_base)
lcxk_base.getContextKeywords("TEMP", ls_temp)
ls_temp_folder =  ls_temp[1]
 ls_temp_folder=mid(ls_temp_folder,1,len(ls_temp_folder) -4) + "pbwc"
 IF directoryexists(ls_temp_folder) = false THEN createdirectory(ls_temp_folder)
 IF directoryexists(ls_temp_folder) = false THEN ls_temp_folder =  ls_temp[1]
  
return ls_temp_folder
end function

public function string of_file_to_code (string as_file);// -----------------------------------------------------------------------------
// SCRIPT:     of_file_to_code
//
// PURPOSE:    Translates a text file into powerbuilder code 
//
// ARGUMENTS:  string	- filename to translate

//
// RETURN:		string - PowerBuilder code
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
integer li_FileNum
string ls_file,ls_return

li_FileNum = FileOpen(as_file,   TextMode!)
IF li_FileNum < 0 THEN return ""
 FileReadEx(li_FileNum, ls_file)
 fileclose(li_FileNum)
 
 return ls_return

end function

public subroutine of_register_ole_object (oleobject aoo);// -----------------------------------------------------------------------------
// SCRIPT:     of_register_ole_object
//
// PURPOSE:    Used to register ole internal object that will display the graph
//
// ARGUMENTS: oleobject : the ole_xxx.object
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
ioo=aoo
end subroutine

public function string of_get_empty_graph_html ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_empty_graph_html
//
// PURPOSE:    Returns the html code to initialise the chart.js
//					canvas and to include references to all the chart js 
//					source files.
//
// ARGUMENTS: 
//
// RETURN:		String - HTML code to initialise the document object
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return
ls_return = &
'      <script src="'+is_chartjs_path+'chart.js"></script>'+is_cr+&
'	 <script src="'+is_chartjs_path+'chartjs-plugin-datalabels.js"></script>'+is_cr+&
''+is_cr+&
'      <div style="width:100%; height: 100%">'+is_cr+&
'        <canvas id="myChart"></canvas>'+is_cr+&
'      </div>'

return ls_return
end function

public subroutine of_init_html ();// -----------------------------------------------------------------------------
// SCRIPT:     of_init_html
//
// PURPOSE:    Initializes javascript graph object with empty graph
//					object
//
// ARGUMENTS: 
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_html, ls_result, ls_error
ls_html = of_get_empty_graph_html()
string ls_command
ls_command = "document.body.innerHTML =  '"+ls_html+"'"
IF ib_use_webview_control = FALSE THEN
	ioo.document.ParentWindow.ExecScript(ls_command)
ELSE
	iwb.EvaluateJavascriptaSync(ls_command)
END IF
 
end subroutine

public function string of_get_url_from_file (string as_filename);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_url_from_file
//
// PURPOSE:    Converts a dos full file name into a javascript url.
//
// ARGUMENTS: string as_filename : file name with path to be converted
//
// RETURN:		String - url of dos file
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
inv_string.of_refglobalreplace(as_filename,"\","/")
return "file:///" + as_filename

end function

public subroutine of_init_document ();// -----------------------------------------------------------------------------
// SCRIPT:    of_init_document
//
// PURPOSE:    creates a pbwc_graph.htm File in the temp directory 
//					and navigates to it, to initialise the document object 
//					in the javascript code
//
// ARGUMENTS: 
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// 01/01/2026	FFasolin	Added support for char.js 4.5
// ------------------------------------------------------------------------------
string ls_tempdir,ls_html
integer li_FileNum
ls_tempdir =  of_get_temp_folder ( )

//==============forces chartjs 2 for IE Browser=======================
IF ib_use_webview_control = FALSE THEN
	 ii_chartjs_version = 2
END IF

IF ii_chartjs_version = 2 THEN
	is_empty_page_file_name = "pbwc_graph.htm"
ELSE
	is_empty_page_file_name = "pbwc_graph45.htm"
END IF

//===================CHARTJS 2.0==================================================
IF ii_chartjs_version =2  and ( fileexists(ls_tempdir+"\"+is_empty_page_file_name) = FALSE or FileLength(ls_tempdir+"\"+is_empty_page_file_name) <>1228 or ib_display_version = TRUE or ib_refresh_init_document = true)    THEN
	li_FileNum = FileOpen(ls_tempdir+"\"+is_empty_page_file_name,  LineMode!, Write!, LockWrite!, replace!)
	//'	 <script src="'+is_chartjs_path+'chart.bundle.js"></script>'+is_pbcr+&
//'	 <script src="'+is_chartjs_path+'chartjs-plugin-datalabels.js"></script>'+is_pbcr+&
	ls_html = &
'<!doctype html>'+is_pbcr+&
'  <html>'+is_pbcr+&
'    <head>'+is_pbcr+&
'      <meta charset="utf-8">'+is_pbcr+&
'      <title>PB chart.js</title>'  +is_pbcr+&   
'    </head>'+is_pbcr+&
'    <body  oncontextmenu="return false"; style="  margin: 0; padding: 0;  width: 100vw;  height: 100vh; overflow: hidden; /* Prevents scrollbars */">'+is_pbcr+&
'	 <script src="chart.bundle.js"></script>'+is_pbcr+&
'	 <script src="chartjs-plugin-datalabels.js"></script>'+is_pbcr+&
'     <script language="JavaScript"> document.addEventListener("contextmenu", function(e){ e.preventDefault(); }, false); </script>'+is_pbcr+&
'     <script language="JavaScript"> document.body.addEventListener("keydown", function(event) {  if (event.ctrlKey && "cvxspwuaz".indexOf(event.key) !== -1) {    event.preventDefault()  }});</script>'+is_pbcr+&
'     <script language="JavaScript"> document.body.addEventListener("keydown", function(event) {  if (event.ctrlKey && "cvxspwuaz".indexOf(event.key) !== -1) {    event.preventDefault()  }});</script>'+is_pbcr+&
'     <script language="JavaScript"> document.onkeydown = function(e) {  if (e.keyCode === 116) { return false; } if (e.keyCode === 8) { return false; } };</script>'+is_pbcr
IF ib_display_version then ls_html += string(ii_chartjs_version)
ls_html += &
'      <div  class="chart-container" style="position: relative; height:100%; width:100%">'+is_pbcr+&
'       <canvas id="myChart"></canvas>'+is_pbcr+&
'      </div>	'+is_pbcr+&
'	</body>'+is_pbcr+&
'</html>'
	FileWrite(li_FileNum, ls_html)
	fileclose(li_FileNum)
END IF

//===================CHARTJS 4.5==================================================
IF ib_use_webview_control and  ii_chartjs_version >=3 and ( fileexists(ls_tempdir+"\"+is_empty_page_file_name) = FALSE or FileLength(ls_tempdir+"\"+is_empty_page_file_name) <>1349 or ib_display_version = TRUE or ib_refresh_init_document = true)   THEN
	li_FileNum = FileOpen(ls_tempdir+"\"+is_empty_page_file_name,  LineMode!, Write!, LockWrite!, replace!)

	string ls_width, ls_height
	long ll_width, ll_height
	ll_width = UnitsToPixels ( iwb.width, XUnitsToPixels! )
	ll_height = UnitsToPixels ( iwb.height, yUnitsToPixels! )
	ll_width = mod(ll_width,2) + ll_width
	ll_height = mod(ll_height,2) + ll_height
	ls_width = string(ll_width -30)
	ls_height = string(ll_height -30 )
	
	
	ls_html = &
'<!doctype html>'+is_pbcr+&
'  <html>'+is_pbcr+&
'    <head>'+is_pbcr+&
'      <meta charset="utf-8">'+is_pbcr+&
'      <title>PB chart.js</title>'  +is_pbcr+&   
'    </head>'+is_pbcr+&
'    <body  oncontextmenu="return false"; style="  margin: 0; padding: 0;  width: 100vw;  height: 100vh; overflow: hidden; /* Prevents scrollbars */">'+is_pbcr+&
'	 <script src="luxon.min.js"></script>'+is_pbcr+&
'	 <script src="chart.umd.js"></script>'+is_pbcr+&
'	 <script src="chartjs-adapter-luxon.js"></script>'+is_pbcr+&
'	 <script src="chartjs-plug-in-datalabels.js"></script>'+is_pbcr+&
'	 <!--plugins-->'+is_pbcr+&
'     <script language="JavaScript"> document.addEventListener("contextmenu", function(e){ e.preventDefault(); }, false); </script>'+is_pbcr+&
'     <script language="JavaScript"> document.body.addEventListener("keydown", function(event) {  if (event.ctrlKey && "cvxspwuaz".indexOf(event.key) !== -1) {    event.preventDefault()  }});</script>'+is_pbcr+&
'     <script language="JavaScript"> document.body.addEventListener("keydown", function(event) {  if (event.ctrlKey && "cvxspwuaz".indexOf(event.key) !== -1) {    event.preventDefault()  }});</script>'+is_pbcr+&
'     <script language="JavaScript"> document.onkeydown = function(e) {  if (e.keyCode === 116) { return false; } if (e.keyCode === 8) { return false; } };</script>'+is_pbcr
IF ib_display_version then ls_html += string(ii_chartjs_version)

//ls_html +='      <div class="chart-container" style="position: relative;  width:'+ls_width+'px ;height:'+ls_height+'px; ">'+is_pbcr
ls_html +='      <div class="chart-container" style="position: relative;  width:100% ;height:100%; ">'+is_pbcr

ls_html +='       <canvas id="myChart_canvas"  " ></canvas>'+is_pbcr+&
'      </div>	'+is_pbcr+&
'	</body>'+is_pbcr+&
'</html>'


//'     <div class="chart-container" style="position: relative; height:97vh; width:100vw;background-color: blue ">'+is_pbcr+&
//'     <div class="chart-container" style="position: relative;  width:'+ls_width+'px ;height:'+ls_height+'px; ">'+is_pbcr+&


	FileWrite(li_FileNum, ls_html)
	fileclose(li_FileNum)
END IF



IF ib_use_webview_control THEN
	iwb.navigate(ls_tempdir+"\"+is_empty_page_file_name)
ELSE
	ioo.navigate(ls_tempdir+"\"+is_empty_page_file_name)
END IF
end subroutine

public function string of_check_required ();// -----------------------------------------------------------------------------
// SCRIPT:     of_check_required
//
// PURPOSE:    Check that mandatory fields where filled
//
// ARGUMENTS: 
//
// RETURN:		String - error text, "" if ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
int ii
string ls_return

FOR ii = 1 to li_chart_index_max
	ls_return = this.of_check_required(ii)
	IF ls_return <> "" THEN return ls_return
NEXT
return ""
end function

public function integer of_save (string as_object_name, string as_pbl);return of_save(as_object_name,as_pbl,"")

end function

public function boolean of_has_been_modified ();// -----------------------------------------------------------------------------
// SCRIPT:     of_has_been_modified
//
// PURPOSE:    Check if graph definition data have been modified
//
// ARGUMENTS: 
//
// RETURN:		boolean - TRUE if any data have been modified
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
int li_graph_configuration_properties,li_charts_properties, li_datasets_properties, li_chart_config_options, li_chart_axes

li_graph_configuration_properties= ids_graph_configuration_properties.modifiedcount() +  ids_graph_configuration_properties.deletedcount() 
li_charts_properties= ids_charts_properties.modifiedcount() +  ids_charts_properties.deletedcount() 
li_datasets_properties= ids_datasets_properties.modifiedcount() +  ids_datasets_properties.deletedcount() 
li_chart_config_options= ids_chart_config_options.modifiedcount() +  ids_chart_config_options.deletedcount() 
li_chart_axes= ids_chart_axes.modifiedcount() +  ids_chart_axes.deletedcount() 
 
 IF li_graph_configuration_properties + li_charts_properties + li_datasets_properties + li_chart_config_options + li_chart_axes >0 THEN
	 return TRUE
END IF

return False
end function

public function integer of_display_graph ();// -----------------------------------------------------------------------------
// SCRIPT:     of_display_graph
//
// PURPOSE:    Displays the graph 
//
// ARGUMENTS: 
//
// RETURN:		integer 1 ok , -1 not ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// 01/01/2026	FFasolin	Added support for char.js 4.5
// ------------------------------------------------------------------------------
string ls_command
string ls_type, ls_graph_type
string ls_return, ls_chart_type
string ls_data, ls_labels,ls_dataset_list, ls_scales, ls_argument_value,ls_argument_values
string ls_options, ls_argument_number
int li_argument_number,ii
//CHECK if required field for chart 1 are ok
ls_return= of_check_required(1)
IF ls_return <> "" THEN return -1

//=====================================================================
// CHARTJS V2.X (IE compatible)
//=====================================================================

IF ii_chartjs_version < 3 THEN

	//global configuration
	ls_command += of_get_global_configuration_code()
	
	//creates the chart object
	ls_command += &
	'    var myContext = document.getElementById("myChart");'+is_pbcr+&
	'    var myChartConfig = {'+is_pbcr
	//generates type
	IF li_chart_index_max = 1 THEN
		ls_type = describe("chart(1).chart_type")
	ELSE
		//multi chart type is always 'bar'
		ls_type = 'bar'
	END IF

	
	ls_chart_type = "type:'" +ls_type+"',"+is_pbcr
	ls_command += ls_chart_type
	ls_command += "data:{"+is_pbcr
	//builds the labels array
	//labels are always based on first chart declaration
	ls_labels =  "labels:[" +of_build_labels_list()+"],//labels"
	ls_command += ls_labels+is_pbcr
	//building datasets
	ls_command += "datasets:["
	ls_dataset_list =  of_build_dataset_list()
	ls_command += ls_dataset_list
	ls_command +="]"+is_pbcr
	//closing data
	ls_command +="},//data"+is_pbcr
	
	ls_scales = of_build_scales()
	ls_options = of_build_options()
	ls_options+= ls_scales
	IF ls_options <> "" THEN ls_options = "options:{responsive: true, maintainAspectRatio: false,"+is_PBCR + ls_options+is_PBCR+"},//options"
	ls_command += ls_options
	//closing myChartConfig
	ls_command +=+is_PBCR+"}//myChartConfig"+is_pbcr
	
END IF

//=========================================================================
// CHARTJS V4.x (New Web  browsers)
//=========================================================================

IF ii_chartjs_version >= 3 THEN
	

	
	//register label plugin
	ls_command += &
	'	Chart.register(ChartDataLabels);'+is_pbcr

	//default settings
	ls_command += of_get_global_configuration_code45()	+is_pbcr
	
	//instanciating graph
	ls_command += '    var myContext = document.getElementById("myChart_canvas");'+is_pbcr+&
	'    var myChartConfig = {'+is_pbcr
	//generates type
	IF li_chart_index_max = 1 THEN
		ls_type = describe("chart(1).chart_type")
	ELSE
		//multi chart type is always 'bar'
		ls_type = 'bar'
	END IF
	
	ls_graph_type = ls_type
	IF ls_type = 'horizontalBar' THEN ls_type = 'bar' //Chart js 4.5
	
	ls_chart_type = "type:'" +ls_type+"',"+is_pbcr
	ls_command += ls_chart_type



	//==============================================================================
	// opening Data
	//==============================================================================
//	ls_chart_type = "type:'" +ls_type+"',"+is_pbcr
//	ls_data += ls_chart_type
	ls_data += "data:{"+is_pbcr
	//builds the labels array
	//labels are always based on first chart declaration
	ls_labels =  "labels:[" +of_build_labels_list()+"],"
	ls_data += ls_labels+is_pbcr
	//--------------------------------------------------------------------------------------------------------------------------------------------
	//building datasets
	//--------------------------------------------------------------------------------------------------------------------------------------------
	ls_data += "datasets:["
	ls_data +=  of_build_dataset_list()
	ls_data += ls_dataset_list
	ls_data +="]"+is_pbcr
	//closing data
	ls_data +="},//data"+is_pbcr
	
	ls_command += ls_data
	
	//getting default fonts values
	 of_get_default_font()
	
	
	//==============================================================================
	//opening options
	//==============================================================================
	ls_command +="options:{responsive: true, maintainAspectRatio: false,"+is_pbcr
	IF ls_graph_type = 'horizontalBar' THEN ls_command += "indexAxis: 'y', // This makes the bars horizontal!"+is_pbcr
		//----------------------------------------------------------------------------------------------------------------------------
		// onClick
		//-----------------------------------------------------------------------------------------------------------------------------
		ls_command += "onClick: (event, elements, chart) => {"+is_pbcr 
         ls_command += " if (elements.length > 0) {"+is_pbcr 
         ls_command += " const firstElement = elements[0];"+is_pbcr 
         ls_command += "  const datasetIndex = firstElement.datasetIndex;"+is_pbcr 
         ls_command += "const dataIndex = firstElement.index;"+is_pbcr 
         ls_command += "// Get the value and label from your data object"+is_pbcr 
         ls_command += "const value = chart.data.datasets[datasetIndex].data[dataIndex];"+is_pbcr 
         ls_command += "const label = chart.data.labels[dataIndex];"+is_pbcr 
		ls_command += "const seriesLabel = chart.data.datasets[datasetIndex].label;"+is_pbcr 
		ls_command += "document.title = '<action>clicked</action>'+'<label>'+ label+'</label><series>'+seriesLabel+'</series><value>'+value+'</value>';"+is_pbcr 
		ls_command += "}"+is_pbcr 
         ls_command += "},"+is_pbcr 
	
		//-----------------------------------------------------------------
		//lines
		//-----------------------------------------------------------------
		ls_command += of_get_property_code(describe("chart_options.showlines"),"showLine","","",false)
		ls_command += of_get_property_code(describe("chart_options.spanGaps"),"spanGaps","","",false)
		
		
		
		
		
		//-----------------------------------------------------------------
		//donut, pie
		//-----------------------------------------------------------------
		ls_options += of_get_property_code(describe("chart_options.cutoutPercentage"),"cutout","","",false)
		ls_options += of_get_property_code(describe("chart_options.rotation"),"rotation","","",false)
		ls_options += of_get_property_code(describe("chart_options.circumference"),"circumference","","",false)
		


////Polar Area (to be moved to scales)
//ls_options += of_get_property_code(describe("chart_options.startAngle"),"startAngle","","",false)


	
	
		//--------------------------------------------------------------------------------------------------------------------------------------------
		// interaction
		//--------------------------------------------------------------------------------------------------------------------------------------------
		string ls_interaction
		ls_interaction+=of_get_property_code(describe("global_configuration.interactions_mode"),"mode","'","'",FALSE)
		ls_interaction+=of_get_property_code(describe("global_configuration.interactions_intersect"),"intersect","","",FALSE)
		ls_interaction+=of_get_property_code(describe("global_configuration.interactions_axis"),"index","'","'",FALSE)
		//old tooltips now moved to interaction
		ls_interaction+=of_get_property_code(describe("global_configuration.tooltip_mode"),"mode","'","'",FALSE)
		ls_interaction+=of_get_property_code(describe("global_configuration.tooltip_intersect"),"intersect","","",FALSE)
		IF ls_interaction <> "" THEN
			ls_interaction = "interaction:{"+is_pbcr+ ls_interaction + "},//interaction"+is_pbcr
		END IF
		
		
		IF ls_interaction <> "" THEN
			ls_options +=  ls_interaction 
		END IF		
		
		//--------------------------------------------------------------------------------------------------------------------------------------------
		// transitions
		//--------------------------------------------------------------------------------------------------------------------------------------------
		string ls_transitions
		
		   	//active
			string ls_transitions_active
				//transistion_active_animation
				string ls_transistions_active_animation
					ls_transistions_active_animation+=of_get_property_code(describe("global_configuration.interactions_animationduration"),"Duration","","",FALSE)
					IF ls_transistions_active_animation <> "" THEN
						ls_transistions_active_animation = "animation:{"+is_pbcr+ ls_transistions_active_animation + "},//transitions.active.animation"+is_pbcr
					END IF
					
					
				ls_transitions_active += ls_transistions_active_animation
				IF ls_transitions_active <> "" THEN
						ls_transitions_active = "active:{"+is_pbcr+ ls_transitions_active + "},//transitions.active"+is_pbcr
				END IF
				
				
				ls_transitions += ls_transitions_active
				IF ls_transitions <> "" THEN
						ls_transitions = "transitions:{"+is_pbcr+ ls_transitions + "},//transitions"+is_pbcr
				END IF
					
					
		IF ls_transitions <> "" THEN
			ls_options +=  ls_transitions 
		END IF		
		
		//--------------------------------------------------------------------------------------------------------------------------------------------
		//animation
		//--------------------------------------------------------------------------------------------------------------------------------------------
		string ls_animation
		
		string ls_animation_duration, ls_animation_duration_value
		ls_animation_duration_value = describe("global_configuration.animation_duration")
		
		ls_animation_duration = of_get_property_code(describe("global_configuration.animation_duration"),"duration","","",FALSE)
		
		IF ls_animation_duration_value = '0'  THEN 
			ls_animation = "animation:false,//disable animation "+is_pbcr
			//ls_animation += "onComplete: function(animation) {document.title='<action>displayed</action>';},"+is_pbcr
			
		ELSE
		
			ls_animation +=" responsive: true,"+is_pbcr
			//ls_animation +="devicePixelRatio: window.devicePixelRatio < 1 ? 1 : Math.round(window.devicePixelRatio),"
			ls_animation +=" maintainAspectRatio: false, // Essential for percentage-based divs"+is_pbcr
			IF ls_animation_duration<> '' THEN	ls_animation += ls_animation_duration+" // set to  0 ms to disable "+is_pbcr
			
			ls_animation +=of_get_property_code(describe("global_configuration.animation_easing"),"easing","'","'",FALSE)
			
			//donut, pie, polar
			ls_animation += of_get_property_code(describe("chart_options.animation_animateRotate"),"animateRotate","","",false)
			ls_animation += of_get_property_code(describe("chart_options.animation_animateScale"),"animateScale","","",false)
			//ls_animation += "onComplete: function(animation) {document.title='<action>displayed</action>';},"+is_pbcr
	
		END IF
		
		IF ls_animation <> "" THEN
			ls_options += "animation:{"+is_pbcr+ ls_animation + "},//animation"+is_pbcr
		END IF		
		

		
		//--------------------------------------------------------------------------------------------------------------------------------------------
		//layout
		//--------------------------------------------------------------------------------------------------------------------------------------------
		string ls_layout
			//Padding
			string ls_padding
			ls_padding+=of_get_property_code(describe("global_configuration.layout_padding_left"),"left","'","'",FALSE)
			ls_padding+=of_get_property_code(describe("global_configuration.layout_padding_left"),"right","'","'",FALSE)
			ls_padding+=of_get_property_code(describe("global_configuration.layout_padding_left"),"top","'","'",FALSE)
			ls_padding+=of_get_property_code(describe("global_configuration.layout_padding_left"),"bottom","'","'",FALSE)
			
	
			IF ls_padding <> "" THEN
				ls_layout = "padding:{"+is_pbcr+ ls_padding + "},//layout.padding"+is_pbcr
			END IF
			
			IF ls_layout <> "" THEN
				ls_layout = "layout:{"+is_pbcr+ ls_layout + "},//layout"+is_pbcr
			END IF
		
		IF ls_layout <> "" THEN
			ls_options +=  ls_layout 
		END IF		
		
	
		//--------------------------------------------------------------------------------------------------------------------------------------------
		//SCALES
		//--------------------------------------------------------------------------------------------------------------------------------------------
		ls_scales = of_build_scales_45()
		ls_options += ls_scales
		
	//=================================================================================
	// Plugins
	//=================================================================================
	string ls_plugins
	
		//------------------------------------------------------------------------
		//plugins filler
		//------------------------------------------------------------------------
		string ls_filler
		ls_filler+= of_get_property_code(describe("chart_options.plugins_filler_propagate"),"propagate","","",false)
		IF ls_filler <> "" THEN 
			ls_filler="filler:{"+ls_filler+"},"
		END IF
		ls_options += ls_filler
	
		//---------------------------------------------------------------------------------------------------------------------------------------------------
		//legend
		//---------------------------------------------------------------------------------------------------------------------------------------------------
		string ls_legend
		
		ls_legend+=of_get_property_code(describe("global_configuration.legend_display"),"display","","",FALSE)
		ls_legend+=of_get_property_code(describe("global_configuration.legend_position"),"position","'","'",FALSE)
		ls_legend+=of_get_property_code(describe("global_configuration.legend_fullWidth"),"fullWidth","","",FALSE)
		ls_legend+=of_get_property_code(describe("global_configuration.legend_reverse"),"reverse","","",FALSE)
		
			//---------------------------------------------------------------
			// legend.labels
			//---------------------------------------------------------------
			string ls_legend_labels
			ls_legend_labels+=of_get_property_code(describe("global_configuration.legend_labels_boxWidth"),"boxWidth","","",FALSE)
			ls_legend_labels+=of_get_property_code(describe("global_configuration.legend_labels_usePointStyle"),"usePointStyle","","",FALSE)
			ls_legend_labels+=of_get_property_code(describe("global_configuration.legend_labels_padding"),"boxWpaddingidth","","",FALSE)
			IF of_get_property_code(describe("global_configuration.legend_labels_fontColor"),"color","'","'",FALSE)="" then ls_legend_labels+=is_default_fontcolor
			ls_legend_labels+=of_get_property_code(describe("global_configuration.legend_labels_fontColor"),"color","'","'",FALSE)
				//legend.labels.font
				string ls_legend_labels_font
				ls_legend_labels_font+=of_get_property_code(describe("global_configuration.legend_labels_fontSize"),"size","","",FALSE)
				ls_legend_labels_font+=of_get_property_code(describe("global_configuration.legend_labels_fontStyle"),"style","'","'",FALSE)
				ls_legend_labels_font+=of_get_property_code(describe("global_configuration.legend_labels_fontFamily"),"family","'","'",FALSE)
				IF ls_legend_labels_font <> "" THEN
					ls_legend_labels_font = "font:{"+is_pbcr+ ls_legend_labels_font + "},//lengend.labels.font"+is_pbcr
				else
					ls_legend_labels_font = is_default_fonts+ "//lengend.labels.font"+is_pbcr
				END IF
				ls_legend_labels+=ls_legend_labels_font
				
			IF ls_legend_labels <> "" THEN
				ls_legend_labels = "labels:{"+is_pbcr+ ls_legend_labels + "},//lengend.labels"+is_pbcr
			END IF
			ls_legend+=ls_legend_labels
		
		
		IF ls_legend <> "" THEN
			ls_legend = "legend:{"+is_pbcr+ ls_legend + "},//legend"+is_pbcr
		END IF
		ls_plugins +=ls_legend

	//---------------------------------------------------------------------------------------------------------
	//   title
	//---------------------------------------------------------------------------------------------------------
	string ls_title
	ls_title+=of_get_property_code(describe("global_configuration.title_display"),"display","","",FALSE)
	ls_title+=of_get_property_code(describe("global_configuration.title_position"),"position","'","'",FALSE)
	ls_title+=of_get_property_code(describe("global_configuration.title_fontColor"),"color","'","'",FALSE)
	IF of_get_property_code(describe("global_configuration.title_fontColor"),"color","'","'",FALSE)="" then ls_title+=is_default_fontcolor
	
	string ls_title_value
	ls_title_value = describe("global_configuration.title_text")
	//try to evaluate title if it contains an expression
	IF pos(ls_title_value,"PBExpression(") = 1 THEN
		ls_title_value = mid(trim(ls_title),14)
		ls_title_value =mid(ls_title, 1, len(ls_title) -1)
		IF upperbound(ids_chart_datasource) > 0 THEN
			ls_title_value = ids_chart_datasource[1].describe("evaluate('"+ls_title_value+"',0)")
			IF ls_title_value = '!' THEN ls_title_value = describe("global_configuration.title_text")
		END IF
	END IF
	IF ls_title_value <> '' THEN ls_title_value =  "text:'"+ ls_title_value + "',"+is_pbcr
	ls_title+= ls_title_value
	//title.font
	string ls_title_font
	ls_title_font+=of_get_property_code(describe("global_configuration.title_fontSize"),"size","","",FALSE)
	ls_title_font+=of_get_property_code(describe("global_configuration.title_fontFamily"),"family","'","'",FALSE)
	ls_title_font+=of_get_property_code(describe("global_configuration.title_fontStyle"),"style","'","'",FALSE)
	ls_title_font+=of_get_property_code(describe("global_configuration.title_lineHeight"),"lineHeight","","",FALSE)
	IF ls_title_font <> "" THEN
		ls_title_font = "font:{"+is_pbcr+ ls_title_font + "},//title.font"+is_pbcr
	else
		ls_title_font = is_default_fonts+ "//title.font"+is_pbcr
	END IF
	ls_title+=ls_title_font
	
	//title.padding
	string ls_title_padding
	ls_title_padding+=of_get_property_code(describe("global_configuration.title_padding"),"top","","",FALSE)
	ls_title_padding+=of_get_property_code(describe("global_configuration.title_padding"),"bottom","","",FALSE)
	IF ls_title_padding <> "" THEN
		ls_title_padding = "padding:{"+is_pbcr+ ls_title_font + "},//title.padding"+is_pbcr
	END IF
	ls_title+=ls_title_padding
	
	IF ls_title <> "" THEN
		ls_title = "title:{"+is_pbcr+ ls_title + "},//title"+is_pbcr
	END IF
	ls_plugins +=ls_title
	

	//------------------------------------------------------------------------------------------------------
	// Datalabels
	//------------------------------------------------------------------------------------------------------
	string ls_datalabels
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_align"),"align","'","'",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_anchor"),"anchor","'","'",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_backgroundColor"),"backgroundColor","'","'",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_borderColor"),"borderColor","'","'",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_borderRadius"),"borderRadius","","",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_borderWidth"),"borderWidth","","",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_color"),"color","'","'",FALSE)
	IF of_get_property_code(describe("global_configuration.datalabels_color"),"color","'","'",FALSE)="" then ls_datalabels+=is_default_fontcolor
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_display"),"display","","",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_offset"),"offset","","",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_opacity"),"opacity","","",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_rotation"),"rotation","","",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_text_align"),"textAlign","'","'",FALSE)
	ls_datalabels+=of_get_property_code(describe("global_configuration.datalabels_formatter"),"formatter","","",FALSE)

		//datalabels.font
		string ls_datalabels_font
		ls_datalabels_font+=of_get_property_code(describe("global_configuration.datalabels_font_family"),"family","'","'",FALSE)
		ls_datalabels_font+=of_get_property_code(describe("global_configuration.datalabels_font_size"),"size","","",FALSE)
		ls_datalabels_font+=of_get_property_code(describe("global_configuration.datalabels_font_style"),"style","'","'",FALSE)
		ls_datalabels_font+=of_get_property_code(describe("global_configuration.datalabels_font_weight"),"weight","'","'",FALSE)
		ls_datalabels_font+=of_get_property_code(describe("global_configuration.datalabels_font_lineHeight"),"lineHeight","'","'",FALSE)
		IF ls_datalabels_font <> "" THEN
			ls_datalabels_font = "font:{"+is_pbcr+ ls_datalabels_font + "},//datalabels.font"+is_pbcr
		else
			ls_legend_labels_font = is_default_fonts + "//datalabels.font"+is_pbcr
		END IF
		ls_datalabels+=ls_datalabels_font
	
		//datalabels.padding
		string ls_datalabels_padding
		ls_datalabels_padding+=of_get_property_code(describe("global_configuration.datalabels_padding_top"),"top","","",FALSE)
		ls_datalabels_padding+=of_get_property_code(describe("global_configuration.datalabels_padding_right"),"right","","",FALSE)
		ls_datalabels_padding+=of_get_property_code(describe("global_configuration.datalabels_padding_bottom"),"bottom","","",FALSE)
		ls_datalabels_padding+=of_get_property_code(describe("global_configuration.datalabels_padding_left"),"left","","",FALSE)
		IF ls_datalabels_padding <> "" THEN
			ls_datalabels_padding = "padding:{"+is_pbcr+ ls_datalabels_padding + "},//datalabels.padding"+is_pbcr
		END IF
		ls_datalabels+=ls_datalabels_padding

	IF ls_datalabels <> "" THEN
		ls_datalabels = "datalabels:{"+is_pbcr+ ls_datalabels + "},//datalabels"+is_pbcr
	END IF
	ls_plugins +=ls_datalabels


	//-------------------------------------------------------------------------------------------------------
	//tooptip
	//-------------------------------------------------------------------------------------------------------
	string ls_tooltip
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_enabled"),"enabled","","",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_position"),"position","'","'",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_backgroundColor"),"backgroundColor","'","'",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_titleFontColor"),"titleColor","'","'",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_titleSpacing"),"titleSpacing","","",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_titlemarginbotton"),"titleMarginBottom","","",FALSE)	
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_bodySpacing"),"bodySpacing","","",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_bodyFontColor"),"bodyColor","'","'",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_footerFontColor"),"footerColor","'","'",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_footerSpacing"),"footerSpacing","","",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_footerMarginTop"),"footerTopMargin","","",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_caretPadding"),"caretPadding","","",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_cornerRadius"),"cornerRadius","","",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_multiKeyBackground"),"multiKeyBackground","'","'",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_displayColors"),"displayColors","","",FALSE)
	ls_tooltip+=of_get_property_code(describe("global_configuration.tooltip_borderColor"),"borderColor","'","'",FALSE)
	

	//tooltip callbacks
	string ls_tooltip_callbacks
	ls_tooltip_callbacks += of_get_property_code(describe("chart_options.tooltip_callbacks"),"callbacks","","",false)
	ls_tooltip_callbacks = inv_string.of_globalreplace(ls_tooltip_callbacks,"callbacks:","")
	IF ls_tooltip_callbacks <> "" THEN
		ls_tooltip_callbacks = "callbacks:{"+is_pbcr+ ls_tooltip_callbacks + "},//tooltip.callback"+is_pbcr
	END IF
	ls_tooltip+=ls_tooltip_callbacks
	
	
	//tooltip.title_font
	string ls_tooltip_titlefont
	ls_tooltip_titlefont+=of_get_property_code(describe("global_configuration.tooltip_titleFontFamily"),"family","'","'",FALSE)
	ls_tooltip_titlefont+=of_get_property_code(describe("global_configuration.tooltip_titleFontSize"),"fontSize","","",FALSE)
	ls_tooltip_titlefont+=of_get_property_code(describe("global_configuration.tooltip_titleFontStyle"),"weight","'","'",FALSE)
	IF ls_tooltip_titlefont <> "" THEN
		ls_tooltip_titlefont = "titleFont:{"+is_pbcr+ ls_tooltip_titlefont + "},//tootip.titleFont"+is_pbcr
	END IF
	ls_tooltip+=ls_tooltip_titlefont

	//tooltip.bodyFont
	string ls_tooltip_bodyfont
	ls_tooltip_bodyfont+=of_get_property_code(describe("global_configuration.tooltip_bodyFontFamily"),"family","'","'",FALSE)
	ls_tooltip_bodyfont+=of_get_property_code(describe("global_configuration.tooltip_bodyFontSize"),"size","","",FALSE)
	ls_tooltip_bodyfont+=of_get_property_code(describe("global_configuration.tooltip_bodyFontStyle"),"style","'","'",FALSE)
	IF ls_tooltip_titlefont <> "" THEN
		ls_tooltip_bodyfont = "bodyFont:{"+is_pbcr+ ls_tooltip_bodyfont + "},//tootip.bodyFont"+is_pbcr
	END IF
	ls_tooltip+=ls_tooltip_bodyfont
	
	//tooltip.footerFont
	string ls_tooltip_footerfont
	ls_tooltip_footerfont+=of_get_property_code(describe("global_configuration.tooltip_bodyFontFamily"),"family","'","'",FALSE)
	ls_tooltip_footerfont+=of_get_property_code(describe("global_configuration.tooltip_bodyFontSize"),"size","","",FALSE)
	ls_tooltip_footerfont+=of_get_property_code(describe("global_configuration.tooltip_bodyFontStyle"),"style","'","'",FALSE)
	IF ls_tooltip_footerfont <> "" THEN
		ls_tooltip_footerfont = "footerFont:{"+is_pbcr+ ls_tooltip_footerfont + "},//tootip.footerFont"+is_pbcr
	END IF
	ls_tooltip+=ls_tooltip_footerfont
	
	//tooltip.padding
	string ls_tooltip_padding
	ls_tooltip_padding+=of_get_property_code(describe("global_configuration.tooltip_xPadding"),"left","","",FALSE)
	ls_tooltip_padding+=of_get_property_code(describe("global_configuration.tooltip_xPadding"),"right","","",FALSE)
	ls_tooltip_padding+=of_get_property_code(describe("global_configuration.tooltip_yPadding"),"top","","",FALSE)
	ls_tooltip_padding+=of_get_property_code(describe("global_configuration.tooltip_yPadding"),"bottom","","",FALSE)
	IF ls_tooltip_padding <> "" THEN
		ls_tooltip_padding = "padding:{"+is_pbcr+ ls_tooltip_padding + "},//tootip.padding"+is_pbcr
	END IF
	ls_tooltip+=ls_tooltip_padding

	IF ls_tooltip <> "" THEN
		ls_tooltip = "tooltip:{"+is_pbcr+ ls_tooltip + "},//tooltip"+is_pbcr
	END IF
	ls_plugins +=ls_tooltip

		//generating plugins
		IF ls_plugins <> "" THEN
			ls_plugins = "plugins:{"+is_pbcr+ ls_plugins + "},//plugins"+is_pbcr
		END IF
	
		ls_options += ls_plugins
		
	//closing options
	ls_options = ls_options +"},//options"+is_pbcr
	ls_command +=ls_options

	//closing myChartConfig
	ls_command +="}//myChartConfig"+is_pbcr

END IF


//replacing retrieaval argument references

FOR ii = 1 to upperbound(ids_chart_datasource)
	li_argument_number=0
	ls_argument_values = ids_chart_datasource[ii].is_argument_values
	ls_argument_value = inv_string.of_gettoken(ls_argument_values,',')

	DO WHILE ls_argument_value <> ""
		li_argument_number++
		IF upperbound(ids_chart_datasource) > 1 THEN 
			ls_argument_number=string(li_argument_number)+"["+string(ii)+"]"
		ELSE
			ls_argument_number=string(li_argument_number)
		END IF
		ls_command = inv_string.of_globalreplace(ls_command, "{retrieval_argument_"+ls_argument_number+"}",ls_argument_value)
		ls_argument_value = inv_string.of_gettoken(ls_argument_values,',')
	LOOP
NEXT







ls_command+= 'if (myChart) { myChart.destroy();  }'+is_pbcr 

//ls_command+= 'if (myChart) {myChart.update(); alert("updated"); }'+is_pbcr 
//
//ls_command += "var canvas = document.getElementById('myChart_canvas');"+is_pbcr 
//ls_command += " canvas.width = '97vw';  canvas.height = '97vh'; "+is_pbcr 
//
ls_command += '  var myChart = new Chart(myContext, myChartConfig);'+is_pbcr 
//
////forces chart size in order to make animations work
//ls_command += " myChart.canvas.parentNode.style.height = '95vh';"+is_pbcr 
//ls_command += " myChart.canvas.parentNode.style.width = '95vw';"+is_pbcr 
//



IF ii_chartjs_version >= 3 THEN

	//--------------------------------------------------------------------------------------------
	// Double click for 4.5
	//--------------------------------------------------------------------------------------------
	ls_command += "var canvas = document.getElementById('myChart_canvas');"+is_pbcr 
	ls_command += "canvas.addEventListener('dblclick', (event) => {"+is_pbcr 
	ls_command += "  // Use getElementsAtEventForMode to find elements at the clicked coordinates"+is_pbcr 
	ls_command += "  const activeElements = myChart.getElementsAtEventForMode("+is_pbcr 
	ls_command += "    event,"+is_pbcr 
	ls_command += "    'nearest',"+is_pbcr 
	ls_command += "    { intersect: true },"+is_pbcr 
	ls_command += "    false"+is_pbcr 
	ls_command += "  );"+is_pbcr 
	ls_command += "  if (activeElements.length > 0) {"+is_pbcr 
	ls_command += "    // Grab the first element (the closest one to the double-click)"+is_pbcr 
	ls_command += "    const element = activeElements[0];"+is_pbcr 
	ls_command += "    // Series / Dataset Index"+is_pbcr 
	ls_command += "    const datasetIndex = element.datasetIndex;"+is_pbcr 
	ls_command += "    // Data Index (the specific point or bar in the series)"+is_pbcr 
	ls_command += "    const dataIndex = element.index;"+is_pbcr 
	ls_command += "    // Get the exact label and value"+is_pbcr 
	 ls_command += "const label = myChart.data.labels[dataIndex];"+is_pbcr 
	ls_command += "    const seriesLabel = myChart.data.datasets[datasetIndex].label;"+is_pbcr 
	ls_command += "    const clickedValue = myChart.data.datasets[datasetIndex].data[dataIndex];"+is_pbcr 
	ls_command+= "	document.title = '<action>doubleclicked</action>'+'<label>'+ label+'</label><series>'+seriesLabel+'</series><value>'+clickedValue+'</value>';"+is_pbcr 
	ls_command += "  }"+is_pbcr 
	ls_command += "});"+is_pbcr 

ELSE

	//click & doubleclick events
	
	ls_command+= "function doubleClick(e){"+is_pbcr 
	ls_command+= "	var activePoints = myChart.getElementsAtEvent(e);"+is_pbcr 
	ls_command+= "	if (activePoints.length < 1) { return;}"+is_pbcr 
	ls_command+= "	var selectedIndex = activePoints[0]._index;"+is_pbcr 
	ls_command+= "	let element = myChart.getElementAtEvent(event);"+is_pbcr 
	ls_command+= "	if (element.length > 0) {"+is_pbcr 
	ls_command+= "  var dataset = element[0]._datasetIndex;"+is_pbcr 
	ls_command+= "  var series = this.data.datasets[dataset].label;"+is_pbcr 
	ls_command+= "	var label =  myChart.data.labels[element[0]._index];"+is_pbcr 
	ls_command+= "	var value = myChart.data.datasets[element[0]._datasetIndex].data[element[0]._index];"+is_pbcr 
	ls_command+= "	document.title = '<action>doubleclicked</action>'+'<label>'+ label+'</label><series>'+series+'</series><value>'+value+'</value>';"+is_pbcr 
	ls_command+= "	}"+is_pbcr 
	ls_command+= "}"+is_pbcr 
	
	ls_command+= "function singleClick(e){"+is_pbcr 
	ls_command+= "	var activePoints = myChart.getElementsAtEvent(e);"+is_pbcr 
	ls_command+= "	if (activePoints.length < 1) { return;}"+is_pbcr 
	ls_command+= "	var selectedIndex = activePoints[0]._index;"+is_pbcr 
	ls_command+= "	let element = myChart.getElementAtEvent(event);"+is_pbcr 
	ls_command+= "	if (element.length > 0) {"+is_pbcr 
	ls_command+= "  var dataset = element[0]._datasetIndex;"+is_pbcr 
	ls_command+= "  var series = this.data.datasets[dataset].label;"+is_pbcr 
	ls_command+= "	var label =  myChart.data.labels[element[0]._index];"+is_pbcr 
	ls_command+= "	var value = myChart.data.datasets[element[0]._datasetIndex].data[element[0]._index];"+is_pbcr 
	ls_command+= "	document.title = '<action>clicked</action>'+'<label>'+ label+'</label><series>'+series+'</series><value>'+value+'</value>';"+is_pbcr 
	ls_command+= "	};"+is_pbcr 
	ls_command+= "};"+is_pbcr 
	
	//adding click/double click support for Webview2
	IF ib_use_webview_control = TRUE THEN
	
		ls_command+= "myContext.onclick = event => {"+is_pbcr 
		ls_command+= "  singleClick(event);"+is_pbcr 
		ls_command+= "};"+is_pbcr 
		
		ls_command+= "myContext.ondblclick = event => {"+is_pbcr 
		ls_command+= "  doubleClick(event);"+is_pbcr 
		ls_command+= "};"+is_pbcr 
	
	END IF
END IF


IF isvalid(iuo_chart_js_datawindow) then
	ls_return = iuo_chart_js_datawindow.event javascript_preview(ls_command)
	IF len(ls_return) > 0 THEN ls_command = ls_return
END IF

is_last_command = ls_command
iuo_chart_js_datawindow.is_last_action = "displayed"
IF ib_use_webview_control = FALSE THEN
	ioo.document.ParentWindow.ExecScript(ls_command)
	
	iuo_chart_js_datawindow.triggerevent("displayed")
	
ELSE
	string ls_result, ls_error
	//iwb.EvaluateJavascriptSync(ls_command, ls_Result, ls_Error)
	iwb.EvaluateJavascriptaSync(ls_command)	
END IF
iuo_chart_js_datawindow.triggerevent("graph_displayed")
return 1

end function

public subroutine of_init_dataset ();////inits value list in dataset description
//long ll_nb_labels,ii
//ll_nb_labels = ids_label_list.rowcount()
//FOR ii = 1 to ll_nb_labels
//	ids_label_list.setitem(ii,"value","0")
//NEXT
//
end subroutine

public function string of_get_label_code ();long ll_nb_labels,ii
string ls_return
ll_nb_labels = ids_datasource_labels.rowcount()
ls_return = '        labels: ['
FOR ii  = 1 to ll_nb_labels
	IF ii > 1 THEN ls_return += ","
	ls_return+= '"'+ids_datasource_labels.getitemstring(ii,"label")+'"'
NEXT
ls_return +="]"+is_pbcr
return ls_return


end function

public function string of_load_property_data (n_cst_pbwc_datastore ads_property_data, string as_property_data);// -----------------------------------------------------------------------------
// SCRIPT:     of_load_property_data
//
// PURPOSE:    Loads data into a prperty datastore
//
// ARGUMENTS: n_cst_pbwc_datastore ads_property_data : Datastore to load
//						String as_property_data : Data to load (formated for import string function)
//
// RETURN:		String - error text, "" if ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
ads_property_data.reset()
ads_property_data.importstring(as_property_data)
IF ads_property_data.rowcount() < 1 THEN return  ads_property_data.dataobject + " could not be loaded. Unable to load chart definitions."
ads_property_data.resetupdate()


end function

public function integer of_set_datasource (integer ai_chart_index);// -----------------------------------------------------------------------------
// SCRIPT:     of_set_datasource
//
// PURPOSE:    Sets the source data datawindow object  for a specific
//					chart index
//
// ARGUMENTS: 
//
// RETURN:		integer : -1 not ok, 1 ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
//sets transobject for source data and initialize object
string ls_dataobject, ls_library

//creates the datasource datastore

int ii
IF upperbound(ids_chart_datasource) < ai_chart_index THEN
	 ids_chart_datasource[ai_chart_index] = CREATE n_cst_pbwc_datastore
ELSE
	FOR ii = 1 to ai_chart_index 
		IF not(isvalid(ids_chart_datasource[ii])) THEN
		 	ids_chart_datasource[ii] = CREATE n_cst_pbwc_datastore
		END IF
	NEXT
END IF


//load the datawindow object specified for the chart
ls_dataobject = this.describe("chart("+string(ai_chart_index)+").dw_object")
ls_library = this.describe("chart("+string(ai_chart_index)+").dw_pbl")
// ids_chart_datasource[ai_chart_index].dataobject = ls_dataobject
 this.of_set_dw_object( ids_chart_datasource[ai_chart_index],ls_dataobject,ls_library)
 //if not loaded (acess from the graph painter, loads the source code from the pbl
 
 
 //sets the transobject, default to SQLCA
 ids_chart_datasource[ai_chart_index].settransobject(sqlca)

return 1
end function

public function integer of_save (string as_gr_object_name, string as_pbl_name, string as_comment);//saves object in target pbl
string dwsyntax,dwsyntax_data, ErrorBuffer,ls_data
integer rtncode
long ll_row

//resets the source code containter datastore
ids_source_code_container.reset()

//adds the data from the the properties datastores
of_add_properties_data(ids_graph_configuration_properties ,ids_graph_configuration_properties.dataobject,as_comment)
of_add_properties_data(ids_charts_properties ,ids_charts_properties.dataobject,as_comment)
of_add_properties_data(ids_datasets_properties ,ids_datasets_properties.dataobject,as_comment)
of_add_properties_data(ids_chart_config_options ,ids_chart_config_options.dataobject,as_comment)
of_add_properties_data(ids_chart_axes ,ids_chart_axes.dataobject,as_comment)


//gets source syntax to be saved
dwsyntax = ids_source_code_container.Object.DataWindow.Syntax
dwsyntax_data = ids_source_code_container.object.DataWindow.Syntax.Data

//saves source syntax
rtncode = LibraryImport(as_pbl_name, as_gr_object_name, ImportDataWindow!, dwsyntax + "~r~n"+dwsyntax_data , ErrorBuffer,  as_comment)
IF rtncode =-1 THEN
	Messagebox("Save", "Save of object failed+~r~n"+ErrorBuffer, stopsign!)
	return -1
END IF

//IF object saved, resets update status of properties datastore
ids_graph_configuration_properties.resetupdate()
ids_charts_properties.resetupdate()
ids_datasets_properties.resetupdate()
ids_chart_config_options.resetupdate()
ids_chart_axes.resetupdate()




return 1
end function

public subroutine of_add_properties_data (n_cst_pbwc_datastore ads_property_datastore, string as_source_name, string as_comment);// -----------------------------------------------------------------------------
// SCRIPT:     of_add_properties_data
//
// PURPOSE:    Adds the source data from a property datastore to the 
//					source code container datastore
//
// ARGUMENTS: n_cst_pbwc_datastore : Property datastore
//					string : Name of the properties (name of the datastore)
//					string : comment
//
// RETURN:		String - workstation temp folder path
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_row
string ls_data

ll_row = ids_source_code_container.insertrow(0)
ls_data = ads_property_datastore.of_get_data()
ids_source_code_container.setitem(ll_row,"source_name",as_source_name)
ids_source_code_container.setitem(ll_row,"source_data",ls_data)
ids_source_code_container.setitem(ll_row,"source_comment",as_comment)
end subroutine

public function string describe (string as_describe);// -----------------------------------------------------------------------------
// SCRIPT:     Describe
//
// PURPOSE:    returns the value of a graph property
//
// ARGUMENTS: ls_describe
//					syntax is : 	global_configuration.property_name
//									chart(chart_index).property_name
//									chart_options(chart_index).property_name
//									chart(chart_index).dataset(dataset_index).property_name
//									axes(axes_index).property_name
//
// RETURN:		String - value of the property
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return,ls_search, ls_property_name
n_cst_pbwc_datastore lds_search
as_describe = trim(lower(as_describe))

//getting the good datastore and the search columns if needed

IF pos(as_describe,"global_configuration")=1 THEN
	lds_search = ids_graph_configuration_properties
ELSEIF pos(as_describe,"dataset(")>0 THEN
	lds_search = ids_datasets_properties
	ls_search = "chart_index="+string(of_get_index(as_describe,"chart"))
	ls_search += ";dataset_index="+string(of_get_index(as_describe,"dataset"))
ELSEIF pos(as_describe,"chart(")>0 THEN
	lds_search = ids_charts_properties
	ls_search = "chart_index="+string(of_get_index(as_describe,"chart"))
ELSEIF pos(as_describe,"chart_options")>0 THEN
	lds_search = ids_chart_config_options
ELSEIF pos(as_describe,"axes(")=1 THEN
	lds_search = ids_chart_axes
	ls_search = "axes_index="+string(of_get_index(as_describe,"axes"))
END IF
//gets the property name 
ls_property_name = inv_string.of_gettoken(as_describe,".")
DO WHILE as_describe <> ""
	ls_property_name = inv_string.of_gettoken(as_describe,".")
LOOP


return of_get_property_value(lds_search,ls_search,ls_property_name)


end function

public function integer of_get_index (string as_source, string as_array_name);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_index
//
// PURPOSE:    Returns the index specified in a string with an array name
//					chart(1) ==> returns 1
//
// ARGUMENTS: string : source
//					 string : array name : chart for example
//
// RETURN:		integer : index specified for array name in source string
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
int li_pos_start,li_pos_end, li_return
string ls_index
li_pos_start = pos(as_source,as_array_name+"(")
IF li_pos_start =  0 THEN return 0
li_pos_start = li_pos_start + len(as_array_name+"(")
li_pos_end = pos(as_source,")",li_pos_start)
IF li_pos_end = 0 THEN return 0
ls_index = mid(as_source,li_pos_start,li_pos_end - li_pos_start)
li_return = integer(ls_index)

return li_return
end function

public function string of_get_property_value (n_cst_pbwc_datastore ads, string as_search, string as_column);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_property_value
//
// PURPOSE:    returns the value of a property as a string
//
// ARGUMENTS: n_cst_pbwc_datastore : datastore to search in
//					string : search criteria to find the right datastore row
//					string : property_name (column name in the datastore)
//
// RETURN:		property value, "" if null
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_criteria1,ls_criteria2
string ls_column1, ls_column2
integer li_search_index1, li_search_index2, li_current_index1, li_current_index2
long ll_nb_rows,ii,ll_row
dwbuffer ldwbuffer
string ls_return

IF as_search = "" THEN
	ldwbuffer = primary!
	ll_row = 1
	IF ads.rowcount() < 1 THEN 
		Messagebox("Graph error","no data available for property " + as_column)
		return ""
	end if
ELSE
	//searching for the good row (can be in primary! or filtered buffer)
	ls_criteria1 = inv_string.of_gettoken(as_search,";")
	ls_criteria2 = inv_string.of_gettoken(as_search,";")
	ls_column1 = inv_string.of_gettoken(ls_criteria1,"=")
	li_search_index1 =  integer(ls_criteria1)
	ls_column2 = inv_string.of_gettoken(ls_criteria2,"=")
	li_search_index2 = integer(ls_criteria2)
	IF ads.of_column_exists(ls_column1) = FALSE THEN
		Messagebox("Graph error","Error accessing property " + ls_column1)
		return ""
	END IF
	IF ls_column2 <> "" THEN
		IF ads.of_column_exists(ls_column2) = FALSE THEN
			Messagebox("Graph error","Error accessing property " + ls_column2)
			return ""
		END IF
	END IF
	
	//starts by searching in primary
	ll_nb_rows = ads.rowcount()
	FOR ii = 1 to ll_nb_rows
		li_current_index1 = ads.getitemnumber(ii,ls_column1)
		IF li_current_index1 = li_search_index1 THEN
			IF ls_column2 = "" THEN
				ll_row = ii
			ELSE
				li_current_index2 = ads.getitemnumber(ii,ls_column2)
				IF li_current_index2 = li_search_index2 THEN
					ll_row = ii
				END IF
			END IF
			IF ll_row > 0 THEN
				ldwbuffer = primary!
				exit
			END IF
		END IF
	NEXT
	//if not found in primary, search in filtered
	IF ll_row = 0 THEN
		ll_nb_rows = ads.filteredcount()
		FOR ii = 1 to ll_nb_rows
			li_current_index1 = ads.getitemnumber(ii,ls_column1, filter!, false)
			IF li_current_index1 = li_search_index1 THEN
				IF ls_column2 = "" THEN
					ll_row = ii
				ELSE
					li_current_index2 = ads.getitemnumber(ii,ls_column2, filter!, false)
					IF li_current_index2 = li_search_index2 THEN
						ll_row = ii
					END IF
				END IF
				IF ll_row > 0 THEN
					ldwbuffer = filter!
					exit
				END IF
			END IF
		NEXT
	END IF
END IF

IF ll_row = 0 THEN return ""
IF ads.of_column_exists(as_column) = FALSE THEN 
	Messagebox("graph error","Property "+ as_column + " does not exist")
	return ""
END IF

ls_return = ads.of_getitem_string(ll_row,as_column,ldwbuffer)
IF isnull(ls_return) THEN ls_return = ""

return ls_return

end function

public function string modify (string as_modify, string as_value);// -----------------------------------------------------------------------------
// SCRIPT:     Modify
//
// PURPOSE:    modifies the value of a graph property
//
// ARGUMENTS: string as_modify
//					syntax is : 	global_configuration.property_name
//									chart(chart_index).property_name
//									chart_options(chart_index).property_name
//									chart(chart_index).dataset(dataset_index).property_name
//									axes(axes_index).property_name
//					string as_value
//
// RETURN:		string error, "" if ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return,ls_search, ls_property_name
n_cst_pbwc_datastore lds_search
as_modify = trim(lower(as_modify))

//getting the good datastore and the search columns if needed

IF pos(as_modify,"global_configuration")=1 THEN
	lds_search = ids_graph_configuration_properties
ELSEIF pos(as_modify,"dataset(")>0 THEN
	lds_search = ids_datasets_properties
	ls_search = "chart_index="+string(of_get_index(as_modify,"chart"))
	ls_search += ";dataset_index="+string(of_get_index(as_modify,"dataset"))
ELSEIF pos(as_modify,"chart(")>0 THEN
	lds_search = ids_charts_properties
	ls_search = "chart_index="+string(of_get_index(as_modify,"chart"))
ELSEIF pos(as_modify,"chart_options(")>0 THEN
	lds_search = ids_chart_config_options
	ls_search = "chart_index="+string(of_get_index(as_modify,"chart_options"))
ELSEIF pos(as_modify,"axes")=1 THEN
	lds_search = ids_chart_axes
	ls_search = "axes_index="+string(of_get_index(as_modify,"axes"))
END IF
//gets the property name 
ls_property_name = inv_string.of_gettoken(as_modify,".")
DO WHILE as_modify <> ""
	ls_property_name = inv_string.of_gettoken(as_modify,".")
LOOP


of_set_property_value(lds_search,ls_search,ls_property_name,as_value)


return ls_return
end function

public subroutine of_set_property_value (n_cst_pbwc_datastore ads, string as_search, string as_column, string as_value);// -----------------------------------------------------------------------------
// SCRIPT:     of_set_property_value
//
// PURPOSE:    sets the value of a property as a string
//
// ARGUMENTS: n_cst_pbwc_datastore : datastore to search in
//					string : search criteria to find the right datastore row
//					string : property_name (column name in the datastore)
//					string : value 
//
// RETURN:		property value, "" if null
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_criteria1,ls_criteria2
string ls_column1, ls_column2
integer li_search_index1, li_search_index2, li_current_index1, li_current_index2
long ll_nb_rows,ii,ll_row
dwbuffer ldwbuffer
string ls_return

IF as_search = "" THEN
	ldwbuffer = primary!
	ll_row = 1
	IF ads.rowcount() < 1 THEN 
		Messagebox("Graph error","no data available for property " + as_column)
		return 
	end if
ELSE
	//searching for the good row (can be in primary! or filtered buffer)
	ls_criteria1 = inv_string.of_gettoken(as_search,";")
	ls_criteria2 = inv_string.of_gettoken(as_search,";")
	ls_column1 = inv_string.of_gettoken(ls_criteria1,"=")
	li_search_index1 =  integer(ls_criteria1)
	ls_column2 = inv_string.of_gettoken(ls_criteria2,"=")
	li_search_index2 = integer(ls_criteria2)
	IF ads.of_column_exists(ls_column1) = FALSE THEN
		Messagebox("Graph error","Error accessing property " + ls_column1)
		return 
	END IF
	IF ls_column2 <> "" THEN
		IF ads.of_column_exists(ls_column2) = FALSE THEN
			Messagebox("Graph error","Error accessing property " + ls_column2)
			return 
		END IF
	END IF
	
	//starts by searching in primary
	ll_nb_rows = ads.rowcount()
	FOR ii = 1 to ll_nb_rows
		li_current_index1 = ads.getitemnumber(ii,ls_column1)
		IF li_current_index1 = li_search_index1 THEN
			IF ls_column2 = "" THEN
				ll_row = ii
			ELSE
				li_current_index2 = ads.getitemnumber(ii,ls_column2)
				IF li_current_index2 = li_search_index2 THEN
					ll_row = ii
				END IF
			END IF
			IF ll_row > 0 THEN
				ldwbuffer = primary!
				exit
			END IF
		END IF
	NEXT
	//if not found in primary, search in filtered
	IF ll_row = 0 THEN
		ll_nb_rows = ads.filteredcount()
		FOR ii = 1 to ll_nb_rows
			li_current_index1 = ads.getitemnumber(ii,ls_column1, filter!, false)
			IF li_current_index1 = li_search_index1 THEN
				IF ls_column2 = "" THEN
					ll_row = ii
				ELSE
					li_current_index2 = ads.getitemnumber(ii,ls_column2, filter!, false)
					IF li_current_index2 = li_search_index2 THEN
						ll_row = ii
					END IF
				END IF
				IF ll_row > 0 THEN
					ldwbuffer = filter!
					exit
				END IF
			END IF
		NEXT
	END IF
END IF

IF ll_row = 0 THEN return 
IF ads.of_column_exists(as_column) = FALSE THEN 
	Messagebox("graph error","Property "+ as_column + " does not exist")
	return 
END IF
//avoir changing modifiedcount for some columns
boolean lb_reset_update
IF as_column = "current_dataset" THEN
	IF ads.modifiedcount() +  ads.deletedcount()  = 0 THEN lb_reset_update = TRUE
END IF

 ads.of_setitem_string(ll_row,as_column,as_value,ldwbuffer)
 
 //reset status for some columns
IF lb_reset_update THEN ads.resetupdate()




end subroutine

public function integer of_add_chart ();// -----------------------------------------------------------------------------
// SCRIPT:     of_add_chart
//
// PURPOSE:    Adds a chart to the graph
//
// ARGUMENTS: 
//
// RETURN:		integer : inserted chart index if ok, -1 if not ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------

long ll_row

li_chart_index_max ++
ll_row=ids_charts_properties.insertrow(0)
ids_charts_properties.setitem(ll_row,"chart_index",li_chart_index_max)
ids_charts_properties.setitem(ll_row,"dataset_count",1)
ids_charts_properties.setitem(ll_row,"current_dataset",1)

ll_row=ids_datasets_properties.insertrow(0)
ids_datasets_properties.setitem(ll_row,"chart_index",li_chart_index_max)
ids_datasets_properties.setitem(ll_row,"dataset_index",1)
ids_datasets_properties.setitem(ll_row,"label", "dataset 1 of chart " +string(li_chart_index_max))

of_set_datasource(li_chart_index_max)

return li_chart_index_max
end function

public function integer of_set_chart_type (integer ai_chart_index, string as_chart_type);// -----------------------------------------------------------------------------
// SCRIPT:     of_set_chart_type
//
// PURPOSE:    sets the chart type of a chart (cascade on depending data)
//
// ARGUMENTS: integer : chart index
//
// RETURN:		1 ok, -1 not ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------

this.modify("chart("+string(ai_chart_index)+").chart_type",as_chart_type)
this.modify("chart_options("+string(ai_chart_index)+").chart_type",as_chart_type)

int li_nb_datasets,ii
li_nb_datasets = integer(this.describe("chart("+string(ai_chart_index)+").dataset_count"))
FOR ii  = 1 TO li_nb_datasets
	this.modify("chart("+string(ai_chart_index)+").dataset("+string(ii)+").chart_type",as_chart_type)
NEXT

return 1
end function

public function integer of_delete_chart (integer ai_chart_index);// -----------------------------------------------------------------------------
// SCRIPT:     of_delete_chart
//
// PURPOSE:    Deletes a chart and all dependant data
//					can't delete chart n° 1
//
// ARGUMENTS: integer : chart_index
//
// RETURN:		1 ok , -1 not ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_nb_rows,ii
integer li_chart_index
IF ai_chart_index > li_chart_index_max or ai_chart_index = 1 THEN return -1

//datasets
ids_datasets_properties.setfilter("chart_index="+string(ai_chart_index))
ids_datasets_properties.filter()
ll_nb_rows = ids_datasets_properties.rowcount()
ids_datasets_properties.rowsdiscard(1,ll_nb_rows,primary!)
ids_datasets_properties.setfilter("")
ids_datasets_properties.filter()
ll_nb_rows = ids_datasets_properties.rowcount()
FOR ii = 1 to ll_nb_rows
	li_chart_index = ids_datasets_properties.getitemnumber(ii,"chart_index")
	IF li_chart_index > ai_chart_index THEN  ids_datasets_properties.setitem(ii,"chart_index",li_chart_index -1)
NEXT

//chart
ids_charts_properties.setfilter("chart_index="+string(ai_chart_index))
ids_charts_properties.filter()
ll_nb_rows = ids_charts_properties.rowcount()
ids_charts_properties.rowsdiscard(1,ll_nb_rows,primary!)
ids_charts_properties.setfilter("")
ids_charts_properties.filter()
ll_nb_rows = ids_charts_properties.rowcount()
FOR ii = 1 to ll_nb_rows
	li_chart_index = ids_charts_properties.getitemnumber(ii,"chart_index")
	IF li_chart_index > ai_chart_index THEN  ids_charts_properties.setitem(ii,"chart_index",li_chart_index -1)
NEXT

li_chart_index_max --

//re-number other charts

return 1
end function

public function integer of_add_dataset (integer ai_chart_index);// -----------------------------------------------------------------------------
// SCRIPT:     of_add_dataset
//
// PURPOSE:    Adds a dataset to a chart
//
// ARGUMENTS: 
//
// RETURN:		integer : inserted dataset index if ok, -1 if not ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------

long ll_row
string ls_chart_type
int li_dataset_count

IF ai_chart_index > li_chart_index_max THEN return -1

ll_row = ids_datasets_properties.insertrow(0)
ids_datasets_properties.setitem(ll_row,"chart_index", ai_chart_index)

ls_chart_type = this.describe("chart("+string(ai_chart_index)+").chart_type")
li_dataset_count = integer(this.describe("chart("+string(ai_chart_index)+").dataset_count"))

li_dataset_count++

ids_datasets_properties.setitem(ll_row,"chart_type", ls_chart_type)
ids_datasets_properties.setitem(ll_row,"dataset_index", li_dataset_count)
ids_datasets_properties.setitem(ll_row,"label", "dataset "+string(li_dataset_count) + " of chart " +string(ai_chart_index))

this.modify("chart("+string(ai_chart_index)+").dataset_count",string( li_dataset_count))
this.modify("chart("+string(ai_chart_index)+").current_dataset",string( li_dataset_count))


return li_dataset_count
end function

public function integer of_delete_dataset (integer ai_chart_index, integer ai_dataset_index);// -----------------------------------------------------------------------------
// SCRIPT:     of_delete_dataset
//
// PURPOSE:    Deletes a dataset 
//					can't delete dataset n° 1
//
// ARGUMENTS: integer : chart_index
//						integer:dataset_index
//
// RETURN:		1 ok , -1 not ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_nb_rows,ii,li_dataset_count
integer li_chart_index, li_dataset_index
IF ai_chart_index > li_chart_index_max  THEN return -1
li_dataset_count = integer(this.describe("chart("+string(ai_chart_index)+").dataset_count"))
IF ai_dataset_index > li_dataset_count or li_dataset_count = 1 THEN return -1

//datasets
ids_datasets_properties.setfilter("chart_index="+string(ai_chart_index) + " and dataset_index="+string(ai_dataset_index) )
ids_datasets_properties.filter()
IF ids_datasets_properties.rowcount() <> 1 THEN return -1
ids_datasets_properties.rowsdiscard(1,1,primary!)
ids_datasets_properties.setfilter("chart_index="+string(ai_chart_index)  )
ids_datasets_properties.filter()

ll_nb_rows = ids_datasets_properties.rowcount()

FOR ii = 1 to ll_nb_rows
	li_dataset_index = ids_datasets_properties.getitemnumber(ii,"dataset_index")
	IF li_dataset_index > ai_dataset_index THEN  ids_datasets_properties.setitem(ii,"chart_index",li_chart_index -1)
NEXT

this.modify("chart("+string(ai_chart_index)+").dataset_count",string(li_dataset_count -1))
this.modify("chart("+string(ai_chart_index)+").current_dataset",string(ai_dataset_index))

ids_datasets_properties.setfilter("" )
ids_datasets_properties.filter()


return 1
end function

public function integer of_add_axis ();// -----------------------------------------------------------------------------
// SCRIPT:     of_add_axis
//
// PURPOSE:    Adds an axis
//
// ARGUMENTS: 
//
// RETURN:		integer : inserted axis index if ok, -1 if not ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_row

li_axes_index_max++
ll_row=ids_chart_axes.insertrow(0)
ids_chart_axes.setitem(ll_row,"axes_index",li_axes_index_max)
return li_axes_index_max
end function

public function integer of_delete_axis (integer ai_axes_index);// -----------------------------------------------------------------------------
// SCRIPT:     of_delete_axis
//
// PURPOSE:    Deletes an axis 
//					can't delete axis n° 1
//
// ARGUMENTS: integer : axes_index
//
// RETURN:		1 ok , -1 not ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_nb_rows,ii
int li_axes_index 
IF ai_axes_index > li_axes_index_max or ai_axes_index = 1 THEN return -1


ids_chart_axes.setfilter("axes_index="+string(ai_axes_index))
ids_chart_axes.filter()
ll_nb_rows = ids_chart_axes.rowcount()
ids_chart_axes.rowsdiscard(1,ll_nb_rows,primary!)
ids_chart_axes.setfilter("")
ids_chart_axes.filter()
ll_nb_rows = ids_chart_axes.rowcount()
FOR ii = 1 to ll_nb_rows
	li_axes_index = ids_chart_axes.getitemnumber(ii,"axes_index")
	IF li_axes_index > ai_axes_index THEN  ids_chart_axes.setitem(ii,"axes_index",li_axes_index -1)
NEXT

li_axes_index_max --

return 1
end function

public subroutine of_set_max_properties ();// -----------------------------------------------------------------------------
// SCRIPT:     of_set_max_properties
//
// PURPOSE:    Set max counters from datastore content
//
// ARGUMENTS: 
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
li_axes_index_max = integer(ids_chart_axes.describe("Evaluate('max(axes_index)',0)"))
li_chart_index_max =  integer(ids_charts_properties.describe("Evaluate('max(chart_index)',0)"))
end subroutine

public function integer of_retrieve_chart_sample_data (integer ia_chart_datasource_index, boolean ab_keep_retained_data);
// -----------------------------------------------------------------------------
// SCRIPT:     of_retrieve_data
//
// PURPOSE:    Retrieves data for a chart
//
// ARGUMENTS: integer : chart index
//					  boolean : keep retrained data (do not issue a retrieve if datawindow already has data)
//
// RETURN:		integer : result of the retrieve, negative if there is an error,-5 if no arguments provided
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
//avoid system errors
IF upperbound(ids_chart_datasource) < ia_chart_datasource_index THEN return -2
IF not isvalid(ids_chart_datasource[ia_chart_datasource_index]) THEN return -3
IF li_chart_index_max < ia_chart_datasource_index THEN return - 4

string ls_syntax
ls_syntax = ids_chart_datasource[ia_chart_datasource_index].describe("DataWindow.Syntax")
IF ls_syntax = "" or ls_syntax = "?" THEN
	Messagebox("Chart.js datawindow","Datawindow object " + ids_chart_datasource[ia_chart_datasource_index].dataobject + " not found")
	return -6
END IF

// Check if there are data and if retrieve is not needed
long ll_nb_rows
ll_nb_rows = ids_chart_datasource[ia_chart_datasource_index].rowcount()
IF ab_keep_retained_data AND ll_nb_rows>0 THEN return ll_nb_rows
//resets the chart data datastore
ids_chart_datasource[ia_chart_datasource_index].reset()
ib_sample_data_retrieved[ia_chart_datasource_index] = FALSE
//check if arguments are needed and provided
string ls_arguments_definition,ls_arguments_list
ls_arguments_definition = ids_chart_datasource[ia_chart_datasource_index].describe("Datawindow.table.arguments")
ls_arguments_list = this.describe("chart("+string(ia_chart_datasource_index)+").dw_retrieval_arguments")
IF ls_arguments_definition <> "?" THEN 
	IF ls_arguments_list="" THEN return -5
END IF

//retrieves the data
long ll_ret
ll_ret = ids_chart_datasource[ia_chart_datasource_index].of_retrieve_from_argument_value_list(ls_arguments_list)
IF  ll_ret>=0 THEN	
	ib_sample_data_retrieved[ia_chart_datasource_index] = TRUE
END IF

return ll_ret
end function

public function string of_check_required (integer ai_chart_index);// -----------------------------------------------------------------------------
// SCRIPT:     of_check_required
//
// PURPOSE:    Check that mandatory fields where filled
//
// ARGUMENTS: integer : chart index
//
// RETURN:		String - error text, "" if ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
int ii
 ii = ai_chart_index
	
IF	this.describe("chart("+string(ii)+").dw_pbl")="" THEN return "Please specify the source datawindow pbl for chart " +string(ii)
IF	this.describe("chart("+string(ii)+").dw_object")="" THEN return "Please specify the source datawindow object name for chart " +string(ii)
IF	this.describe("chart("+string(ii)+").label_column")="" THEN return "Please specify the label column name for chart "+string(ii)+", it can be a column or a computed field pbl."

string ls_arguments
ls_arguments = ids_chart_datasource[ii].describe("Datawindow.table.arguments")
IF ls_arguments <> "?" and ls_arguments <> "" THEN 
	IF	this.describe("chart("+string(ii)+").dw_retrieval_arguments")="" THEN  return "Please specify retrieval arguments values for the data source for chart "+string(ii)
END IF

IF	this.describe("chart("+string(ii)+").value_column")="" THEN return  "Please specify the data column for chart number "+string(ii)

//check datasets
int jj
int li_nb_datasets
li_nb_datasets= integer(describe("chart("+string(ii)+").dataset_count"))
FOR jj = 1 to li_nb_datasets
	IF	this.describe("chart("+string(ii)+").dataset("+string(jj)+").label")="" THEN return "Please specify the label for dataset " +string(jj) + " of chart "+ string(ii)
NEXT


return ""
end function

public function string of_build_labels_list ();// -----------------------------------------------------------------------------
// SCRIPT:     of_build_labels_list
//
// PURPOSE:    Build the list of labels from source datawindows
//
// ARGUMENTS: 
//
// RETURN:		String - list of labels
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
ids_datasource_labels.reset()
int ii
long jj, ll_nb_rows,ll_row
string ls_label_column ,ls_label_value,ls_label_index_column,ls_label_list, ls_color_index_column
int li_label_index, li_color_index

FOR ii = 1 to li_chart_index_max
	ls_label_column = describe("chart("+string(ii)+").label_column")
	ls_label_index_column = describe("chart("+string(ii)+").label_index_column")
	ls_color_index_column = describe("chart("+string(ii)+").color_index_column")
	ll_nb_rows = ids_chart_datasource[ii].rowcount()
	FOR jj=1 to ll_nb_rows
		ls_label_value=  ids_chart_datasource[ii].of_getitem_string(jj,ls_label_column)
		ls_label_value = inv_string.of_globalreplace(ls_label_value,"'","~~'")
		ll_row = ids_datasource_labels.find("label='"+ls_label_value+"'",0,9999999)
		IF ll_row = 0 THEN
			ll_row = ids_datasource_labels.insertrow(0)
			ids_datasource_labels.setitem(ll_row,"label",ls_label_value)
			IF ls_label_index_column<> "" THEN
				li_label_index= integer(ids_chart_datasource[ii].of_getitem_string(jj,ls_label_index_column))
				IF li_label_index = 0 THEN  li_label_index=ll_row
			ELSE
				li_label_index=ll_row
			END IF
			ids_datasource_labels.setitem(ll_row,"label_index",li_label_index)
			string ls_color
			IF ls_color_index_column<> "" THEN
				ls_color = ids_chart_datasource[ii].of_getitem_string(jj,ls_color_index_column)
				li_color_index= integer(ls_color)
				IF li_color_index > 0 THEN  ls_color = string(li_color_index)
			ELSE
				ls_color = string(ll_row)
			END IF
			ids_datasource_labels.setitem(ll_row,"color",ls_color)
			
			
		END IF
	NEXT
	ids_datasource_labels.sort()
NEXT

ll_nb_rows = ids_datasource_labels.rowcount()
FOR ii = 1 to ll_nb_rows
	IF ii > 1 THEN ls_label_list +=","
	ls_label_list += '"'+ inv_string.of_globalreplace(ids_datasource_labels.of_getitem_string(ii,"label"),"~~","")+'"'
NEXT


return ls_label_list
end function

public function string of_build_dataset_list ();// -----------------------------------------------------------------------------
// SCRIPT:     of_build_dataset_list
//
// PURPOSE:    Builds the dataset list for a graph
//
// ARGUMENTS: 
//
// RETURN:		String - dataset list
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// 01/01/2024	FFasolin	Added support for null values
// 01/01/2026	FFasolin	Added support for char.js 4.5
// ------------------------------------------------------------------------------
string ls_return, ls_dataset_column, ls_dataset_index_column, ls_dataset_label,ls_value_column,ls_value,ls_label_column, ls_label
string ls_label_separator_before, ls_label_separator_after,  ls_dataset_separator_before, ls_dataset_separator_after
string ls_chart_type,ls_type
int li_dataset_index
int ii,jj, li_nb_datasets, li_dataset_count,kk
long ll_row, ll_nb_rows
string ls_check_required

is_default_value = describe("chart_options.default_value")
IF isnull(is_default_value) or is_default_value = '' THEN  is_default_value='0'


//scans all charts
FOR ii = 1 to li_chart_index_max
	IF ii > 1 THEN
		ls_check_required = of_check_required(ii)
		IF ls_check_required <> "" THEN continue
		ls_return +=","
	END IF
	
	ids_datasource_datasets.reset()
	li_dataset_count = integer(describe("chart("+string(ii)+").dataset_count"))
	ls_dataset_column = describe("chart("+string(ii)+").dataset_column")
	ls_dataset_index_column = describe("chart("+string(ii)+").dataset_index_column")
	ls_value_column = describe("chart("+string(ii)+").value_column")
	ls_label_column = describe("chart("+string(ii)+").label_column")
	ls_chart_type = describe("chart("+string(ii)+").chart_type")
	ls_type = ls_chart_type
	
	IF ii_chartjs_version >=3 THEN
		IF ls_chart_type = 'horizontalBar' THEN ls_chart_type = 'bar' //Chart js 4.5
	END IF
		
	ids_chart_datasource[ii].of_get_data_separator(ls_label_column,ls_label_separator_before, ls_label_separator_after)
	ids_chart_datasource[ii].of_get_data_separator(ls_dataset_column,ls_dataset_separator_before, ls_dataset_separator_after)

	ids_chart_datasource[ii].is_default_value = is_default_value
	
	
	//if dataset column defined (multidataset graph) else mono dataset graph
	IF ls_dataset_column=""  THEN
		ls_dataset_label = describe("chart("+string(ii)+").dataset(1).label")
		ll_row = ids_datasource_datasets.insertrow(0)
		ids_datasource_datasets.setitem(ll_row,"dataset_label",ls_dataset_label)
		ids_datasource_datasets.setitem(ll_row,"dataset_index",1)
	ELSE
		//populates dataset label list
		ll_nb_rows =ids_chart_datasource[ii].rowcount()
		IF ll_nb_rows = 0 THEN 
			ll_row = ids_datasource_datasets.insertrow(0)
			ids_datasource_datasets.setitem(ll_row,"dataset_label"," ")
			ids_datasource_datasets.setitem(ll_row,"dataset_index",1)
		END IF
			
		FOR jj = 1 to ll_nb_rows
			ls_dataset_label = ids_chart_datasource[ii].of_getitem_string(jj,ls_dataset_column)
			ls_dataset_label = inv_string.of_globalreplace(ls_dataset_label,"'","")
			ll_row = ids_datasource_datasets.find("dataset_label='"+ls_dataset_label+"'",0,9999999)
			IF ll_row = 0  THEN 
				ll_row = ids_datasource_datasets.insertrow(0)
				ids_datasource_datasets.setitem(ll_row,"dataset_label",ls_dataset_label)
				IF ls_dataset_index_column <> "" THEN
					li_dataset_index = integer(ids_chart_datasource[ii].of_getitem_string(jj,ls_dataset_index_column))
					IF li_dataset_index = 0 THEN li_dataset_index = ll_row
				ELSE
					li_dataset_index = ll_row
				END IF
				ids_datasource_datasets.setitem(ll_row,"dataset_index",li_dataset_index)
			END IF
		NEXT
	END IF
	//getting the data values
	long ll_nb_datasets, ll_nb_data
	int li_pos_coma
	string ls_dataset_data
	string ls_find,ls_sum
	ll_nb_datasets = ids_datasource_datasets.rowcount()
	FOR jj = 1 to ll_nb_datasets
		ls_dataset_data = ""
		ls_dataset_label = ids_datasource_datasets.getitemstring(jj,"dataset_label")
		li_dataset_index =  ids_datasource_datasets.getitemnumber(jj,"dataset_index")
		ll_nb_data = ids_datasource_labels.rowcount()
		
		//reset data values
		FOR kk =1 to  ll_nb_data
			ids_datasource_labels.setitem(kk,"value",is_default_value)
		NEXT
		//reset all values in label datastore for the dataset. New version now sums all data
		
			FOR kk =1 to  ll_nb_data
			//search for value
			ls_label = ids_datasource_labels.of_getitem_string(kk,"label")
			IF ls_dataset_column <> "" THEN
				ls_find = ls_dataset_column+"="+ls_dataset_separator_before+ls_dataset_label+ls_dataset_separator_after+" and "+ls_label_column+"="+ls_label_separator_before+ls_label+ls_label_separator_after
				ll_row =  ids_chart_datasource[ii].find(ls_find,0,99999999)
				//IF ll_row <= 0 THEN 		ids_datasource_labels.setitem(kk,"value",'')
				DO WHILE ll_row >0 
					ls_value = ids_chart_datasource[ii].of_getitem_value(ll_row,ls_value_column)
					If isnull(ls_value) or ls_value = '' THEN ls_value = is_default_value
					
					//if value numeric, then sum values, else get value asis
					IF pos(ls_value,'{') = 0 THEN
				
						ls_sum = ids_datasource_labels.of_getitem_value(kk,"value")
						IF isnull(ls_sum)  or ls_sum = '' THEN ls_sum = '0'
						IF pos(string(1.1),",") >0 THEN 
								li_pos_coma = pos(ls_value,".")
								IF li_pos_coma > 0 THEN ls_value = replace(ls_value,li_pos_coma,1,",")
								li_pos_coma = pos(ls_sum,".")
								IF li_pos_coma > 0 THEN ls_sum = replace(ls_sum,li_pos_coma,1,",")
						END IF
						If ls_value <> 'null' THEN		ls_value = string(double(ls_sum) + double(ls_value))
					end if
					//set value in label datastore
					ids_datasource_labels.setitem(kk,"value",ls_value)
			
					ll_row =  ids_chart_datasource[ii].find(ls_find,ll_row +1,99999999)
				LOOP
			ELSE
				ls_find =ls_label_column+"="+ls_label_separator_before+ls_label+ls_label_separator_after
				ll_row =  ids_chart_datasource[ii].find(ls_find,0,99999999)
				//IF ll_row <= 0 THEN 		ids_datasource_labels.setitem(kk,"value",'')
				DO WHILE ll_row >0 
					ls_value = ids_chart_datasource[ii].of_getitem_value(ll_row,ls_value_column)
					If isnull(ls_value)  or ls_value = '' THEN ls_value = is_default_value
					//if value numeric, then sum values, else get value asis
					IF pos(ls_value,'{') = 0 THEN
						
						ls_sum = ids_datasource_labels.of_getitem_value(kk,"value")
						IF isnull(ls_sum)  or ls_value = '' or ls_sum = 'null' THEN ls_sum = '0'
						IF pos(string(1.1),",") >0 THEN 
								li_pos_coma = pos(ls_value,".")
								IF li_pos_coma > 0 THEN ls_value = replace(ls_value,li_pos_coma,1,",")
								li_pos_coma = pos(ls_sum,".")
								IF li_pos_coma > 0 THEN ls_sum = replace(ls_sum,li_pos_coma,1,",")
						END IF
						if ls_value <> 'null' THEN
							ls_value = string( double(ls_value))
							ls_value = string(double(ls_sum) + double(ls_value))
						END IF
					end if
					//set value in label datastore
					ids_datasource_labels.setitem(kk,"value",ls_value)
					
					ll_row =  ids_chart_datasource[ii].find(ls_find,ll_row +1,99999999)
				LOOP
			END IF
		
		
	
//		FOR kk =1 to  ll_nb_data
//			//search for value
//			ls_label = ids_datasource_labels.of_getitem_string(kk,"label")
//			IF ls_dataset_column <> "" THEN
//				ls_find = ls_dataset_column+"="+ls_dataset_separator_before+ls_dataset_label+ls_dataset_separator_after+" and "+ls_label_column+"="+ls_label_separator_before+ls_label+ls_label_separator_after
//				ll_row =  ids_chart_datasource[ii].find(ls_find,0,99999999)
//			ELSE
//				ll_row =  ids_chart_datasource[ii].find(ls_label_column+"="+ls_label_separator_before+ls_label+ls_label_separator_after,0,99999999)
//			END IF
//			IF ll_row <= 0 THEN 
//				ids_datasource_labels.setitem(kk,"value",'')
//			ELSE
//				ls_value = ids_chart_datasource[ii].of_getitem_string(ll_row,ls_value_column)
//				//set value in label datastore
//				ids_datasource_labels.setitem(kk,"value",ls_value)
//			END IF
		NEXT
			
	
		IF jj > 1 THEN ls_return +=","
		ls_return +="{"+is_pbcr
		ls_return += "label:"+"'"+ls_dataset_label+"'"+","+is_pbcr
		ls_return += "type:"+"'"+ls_chart_type+"'"+","+is_pbcr
		ls_return += "data:["+is_pbcr
		//generates data list
		ll_nb_data = ids_datasource_labels.rowcount()
		FOR kk =1 to  ll_nb_data
			ls_value = ids_datasource_labels.of_getitem_string(kk,"value")
			IF pos(ls_value,'{') = 0 THEN
				IF pos(string(1.1),",") >0 THEN 
						li_pos_coma = pos(ls_value,",")
						IF li_pos_coma > 0 THEN ls_value = replace(ls_value,li_pos_coma,1,".")
						li_pos_coma = pos(ls_sum,",")
						IF li_pos_coma > 0 THEN ls_sum = replace(ls_sum,li_pos_coma,1,".")
				END IF
			END IF

			IF kk > 1 THEN ls_dataset_data+=","+is_pbcr
			ls_dataset_data+= ls_value
		NEXT	
		ls_return += ls_dataset_data	+is_pbcr
		ls_return += "],"+is_pbcr
		//adding dataset configuration specifications (colors...)
		string ls_dataset_config
		ls_dataset_config = of_get_dataset_configuration(ii,li_dataset_index)
		
		//re-ordering color arrays
		string ls_color_index_column
		ls_color_index_column = describe("chart("+string(ii)+").color_index_column")
		IF len(ls_color_index_column) >0 THEN
			string ls_color_index, ls_background_color_def, ls_background_color_new
			integer li_color_index, li_pos_backgroundColor, li_pos_end
			li_pos_backgroundColor = pos(ls_dataset_config, 'backgroundColor: [')
			IF li_pos_backgroundColor > 0 THEN
				li_pos_end =  pos(ls_dataset_config,']',li_pos_backgroundColor +19)
				ls_background_color_def = mid(ls_dataset_config,li_pos_backgroundColor +19, li_pos_end - li_pos_backgroundColor -19 -1 )
				FOR kk =1 to  ll_nb_data
					ls_color_index= ids_datasource_labels.of_getitem_string(kk,"color")
					li_color_index = integer(ls_color_index)
					IF kk = 1 THEN ls_background_color_new = "'"
					IF kk > 1 THEN ls_background_color_new+= ",'"
					//get the color index and get the color from the generated array
					IF li_color_index > 0 THEN
						ls_background_color_new += inv_string.of_gettokken_number(ls_background_color_def,"','",li_color_index) +"'"
					ELSE
						//get the color from the database and replace the generated array
						ls_background_color_new +=ls_color_index +"'"
					END IF
				NEXT			
			END IF
			ls_dataset_config = mid(ls_dataset_config,1,li_pos_backgroundColor +17) + ls_background_color_new + mid(ls_dataset_config,li_pos_end) 
		END IF
		
		
		ls_return += ls_dataset_config
		ls_return += "}"+is_pbcr
		

		
	NEXT


NEXT



return ls_return
end function

public function string of_get_dataset_configuration (integer ai_chart_index, integer ai_dataset_index);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_dataset_configuration
//
// PURPOSE:    Build the dataset configuration string 
//
// ARGUMENTS: integer : chart index
//					integer : dataset index
//
// RETURN:		String - workstation temp folder path
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------

//avoid system error
int li_dataset_count
string ls_properties
string ls_return
li_dataset_count = integer(describe("chart("+string(ai_chart_index)+").dataset_count"))
IF ai_dataset_index > li_dataset_count THEN return ""

string ls_chart_type,ls_dataset_column
ls_chart_type = describe("chart("+string(ai_chart_index)+").chart_type")

ls_dataset_column = describe("chart("+string(ai_chart_index)+").dataset_column")



CHOOSE CASE ls_chart_type
	CASE "line","scatter"
	IF ls_dataset_column = "" THEN	ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"label"),"label","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"xAxisID"),"xAxisID","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"yAxisID"),"yAxisID","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"stack"),"stack","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"backgroundcolor"),"backgroundColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"backgroundcolor_multi"),"backgroundColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderColor"),"borderColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderColor_multi"),"borderColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderWidth"),"borderWidth","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderDash"),"borderDash","","",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderDashOffset"),"borderDashOffset","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderCapStyle"),"borderCapStyle","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderJoinStyle"),"borderJoinStyle","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"cubicInterpolationMode"),"cubicInterpolationMode","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"fill"),"fill","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"lineTension"),"lineTension","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBackgroundColor"),"pointBackgroundColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBackgroundColor_multi"),"pointBackgroundColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBorderColor"),"pointBorderColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBorderColor_multi"),"pointBorderColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBorderWidth"),"pointBorderWidth","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBorderWidth_multi"),"pointBorderWidth","","",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointRadius"),"pointRadius","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointRadius_multi"),"pointRadius","","",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointStyle"),"pointStyle","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointStyle_multi"),"pointStyle","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointHitRadius"),"pointHitRadius","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointHitRadius_multi"),"pointHitRadius","","",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBackgroundColor"),"pointHoverBackgroundColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBackgroundColor_multi"),"pointHoverBackgroundColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderColor"),"pointHoverBorderColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderColor_multi"),"pointHoverBorderColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderWidth"),"pointHoverBorderWidth","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderWidth_multi"),"pointHoverBorderWidth","","",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverRadius"),"pointHoverRadius","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverRadius_multi"),"pointHoverRadius","","",true)		
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"showLine"),"showLine","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"spanGaps"),"spanGaps","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"steppedLine"),"steppedLine","","",false)

	CASE "bar",'horizontalBar'
		IF ls_dataset_column = "" THEN	ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"label"),"label","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"xAxisID"),"xAxisID","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"yAxisID"),"yAxisID","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"backgroundcolor"),"backgroundColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"backgroundcolor_multi"),"backgroundColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderColor"),"borderColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderColor_multi"),"borderColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderWidth"),"borderWidth","","",false)
		
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBackgroundColor"),"hoverBackgroundColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBackgroundColor_multi"),"hoverBackgroundColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderColor"),"hoverBorderColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderColor_multi"),"hoverBorderColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderWidth"),"hoverBorderWidth","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderWidth_multi"),"hoverBorderWidth","","",true)
		
		//chartjs 4.5
		IF ii_chartjs_version > 3 THEN
			ls_properties += of_get_property_code(describe("chart_options.barPercentage"),"barPercentage","","",false)
			ls_properties += of_get_property_code(describe("chart_options.categoryPercentage"),"categoryPercentage","","",false)
			ls_properties += of_get_property_code(describe("chart_options.barThickness"),"barThickness","","",false)
			ls_properties += of_get_property_code(describe("chart_options.maxBarThickness"),"maxBarThickness","","",false)
		END IF
		
		
		
	CASE "radar"
		IF ls_dataset_column = "" THEN	ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"label"),"label","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"backgroundcolor"),"backgroundColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"backgroundcolor_multi"),"backgroundColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderColor"),"borderColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderColor_multi"),"borderColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderWidth"),"borderWidth","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderDash"),"borderDash","","",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderDashOffset"),"borderDashOffset","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderCapStyle"),"borderCapStyle","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderJoinStyle"),"borderJoinStyle","'","'",false)				
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"fill"),"fill","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"lineTension"),"lineTension","","",false)		
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBackgroundColor"),"pointBackgroundColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBackgroundColor_multi"),"pointBackgroundColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBorderColor"),"pointBorderColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBorderColor_multi"),"pointBorderColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBorderWidth"),"pointBorderWidth","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointBorderWidth_multi"),"pointBorderWidth","","",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointRadius"),"pointRadius","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointRadius_multi"),"pointRadius","","",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointStyle"),"pointStyle","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointStyle_multi"),"pointStyle","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointHitRadius"),"pointHitRadius","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointHitRadius_multi"),"pointHitRadius","","",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBackgroundColor"),"pointHoverBackgroundColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBackgroundColor_multi"),"pointHoverBackgroundColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderColor"),"pointHoverBorderColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderColor_multi"),"pointHoverBorderColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderWidth"),"pointHoverBorderWidth","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderWidth_multi"),"pointHoverBorderWidth","","",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverRadius"),"pointHoverRadius","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverRadius_multi"),"pointHoverRadius","","",true)
		
	CASE "doughnut","pie","polarArea"
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"backgroundcolor_multi"),"backgroundColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderColor_multi"),"borderColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderWidth"),"borderWidth","","",true)		
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBackgroundColor_multi"),"hoverBackgroundColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderColor_multi"),"hoverBorderColor","'","'",true)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderWidth_multi"),"hoverBorderWidth","","",true)		
		
	CASE "bubble"
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"backgroundcolor"),"backgroundColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderColor"),"borderColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderWidth"),"borderWidth","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBackgroundColor"),"hoverBackgroundColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderColor"),"hoverBorderColor","'","'",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverBorderWidth"),"hoverBorderWidth","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"HoverRadius"),"pointHoverRadius","","",false)
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointHitRadius"),"hitRadius","","",false)		
		IF ls_dataset_column = "" THEN	ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"label"),"label","'","'",false)				
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointStyle"),"pointStyle","'","'",false)		
		ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"pointRadius"),"radius","","",false)

END CHOOSE
	

ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"borderSkipped"),"borderSkipped","'","'",false)

ls_properties +=of_get_property_code(describe("chart("+string(ai_chart_index)+").dataset("+string(ai_dataset_index)+")."+"datalabels"),"datalabels","","",false)


return ls_properties


end function

public function string of_get_property_code (string as_value, string as_javascript_name, string as_string_before_value, string as_string_after_value, boolean ab_array);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_property_code
//
// PURPOSE:    Returns the javascript code to declare a property
//					as_javascript_name: as_string_before_value as_value as_string_after_value,
//
// ARGUMENTS: string : value of the property
//					string : Javascript name (case sensitive!)
//					string : characters befor value
//					string caracters afater value
//					boolean : property is an array
//
// RETURN:		"" if no value specified, source code if found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string  ls_return
IF as_value = "" THEN return ""
IF ab_array THEN
	as_value = inv_string.of_globalreplace(as_value,";",as_string_after_value+","+as_string_before_value)
	as_value = "["+as_string_before_value + as_value + as_string_after_value+"]"
ELSE
		as_value = as_string_before_value + as_value + as_string_after_value
END IF

ls_return = as_javascript_name  + ": "+as_value+","+is_pbcr

return ls_return
end function

public function string of_get_global_configuration_code ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_global_configuration_code
//
// PURPOSE:    Return the code for global confiruation specified parameters
//
// ARGUMENTS: 
//
// RETURN:		String - source code
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return


ls_return+=of_get_global_property_code(describe("global_configuration.devicePixelRatio"),"Chart.defaults.global.devicePixelRatio","","",FALSE)
//================ interactions =======================
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_mode"),"Chart.defaults.global.hover.mode","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_intersect"),"Chart.defaults.global.hover.intersect","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_axis"),"Chart.defaults.global.hover.axis","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_animationduration"),"Chart.defaults.global.hover.animationDuration","","",FALSE)
//default font setting
ls_return+=of_get_global_property_code(describe("global_configuration.defaultfontcolor"),"Chart.defaults.global.defaultFontColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.defaultFontFamily"),"Chart.defaults.global.defaultFontFamily","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.defaultFontSize"),"Chart.defaults.global.defaultFontSize","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.defaultFontStyle"),"Chart.defaults.global.defaultFontStyle","'","'",FALSE)
//animations
ls_return+=of_get_global_property_code(describe("global_configuration.animation_duration"),"Chart.defaults.global.animation.duration","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.animation_easing"),"Chart.defaults.global.animation.easing","'","'",FALSE)
//layout
ls_return+=of_get_global_property_code(describe("global_configuration.layout_padding_left"),"Chart.defaults.global.animation.layout.left","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.layout_padding_right"),"Chart.defaults.global.animation.layout.right","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.layout_padding_top"),"Chart.defaults.global.animation.layout.top","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.layout_padding_bottom"),"Chart.defaults.global.animation.layout.bottom","","",FALSE)
//legend
ls_return+=of_get_global_property_code(describe("global_configuration.legend_display"),"Chart.defaults.global.legend.display","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.legend_position"),"Chart.defaults.global.legend.position","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.legend_fullWidth"),"Chart.defaults.global.legend.fullWidth","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.legend_reverse"),"Chart.defaults.global.legend.reverse","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.legend_labels_boxWidth"),"Chart.defaults.global.legend.labels.boxWidth","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.legend_labels_fontSize"),"Chart.defaults.global.legend.labels.fontSize","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.legend_labels_fontStyle"),"Chart.defaults.global.legend.labels.fontStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.legend_labels_fontColor"),"Chart.defaults.global.legend.labels.fontColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.legend_labels_fontFamily"),"Chart.defaults.global.legend.labels.fontFamily","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.legend_labels_padding"),"Chart.defaults.global.legend.labels.boxWpaddingidth","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.legend_labels_usePointStyle"),"Chart.defaults.global.legend.labels.usePointStyle","","",FALSE)
//=============== title ======================
ls_return+=of_get_global_property_code(describe("global_configuration.title_display"),"Chart.defaults.global.title.display","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.title_position"),"Chart.defaults.global.title.position","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.title_fontSize"),"Chart.defaults.global.title.fontSize","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.title_fontFamily"),"Chart.defaults.global.title.fontFamily","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.title_fontColor"),"Chart.defaults.global.title.fontColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.title_fontStyle"),"Chart.defaults.global.title.fontStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.title_padding"),"Chart.defaults.global.title.padding","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.title_lineHeight"),"Chart.defaults.global.title.lineHeight","","",FALSE)

string ls_title
ls_title = describe("global_configuration.title_text")
//try to evaluate title if it contains an expression
IF pos(ls_title,"PBExpression(") = 1 THEN
	ls_title = mid(trim(ls_title),14)
	ls_title =mid(ls_title, 1, len(ls_title) -1)
	IF upperbound(ids_chart_datasource) > 0 THEN
		ls_title = ids_chart_datasource[1].describe("evaluate('"+ls_title+"',0)")
		IF ls_title = '!' THEN ls_title = describe("global_configuration.title_text")
	END IF
END IF
//DisplayExpression

ls_return+=of_get_global_property_code(ls_title,"Chart.defaults.global.title.text","'","'",FALSE)




//Datalabels
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_align"),"Chart.defaults.global.plugins.datalabels.align","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_anchor"),"Chart.defaults.global.plugins.datalabels.anchor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_backgroundColor"),"Chart.defaults.global.plugins.datalabels.backgroundColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_borderColor"),"Chart.defaults.global.plugins.datalabels.borderColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_borderRadius"),"Chart.defaults.global.plugins.datalabels.borderRadius","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_borderWidth"),"Chart.defaults.global.plugins.datalabels.borderWidth","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_color"),"Chart.defaults.global.plugins.datalabels.color","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_display"),"Chart.defaults.global.plugins.datalabels.display","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_font_family"),"Chart.defaults.global.plugins.datalabels.font.family","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_font_size"),"Chart.defaults.global.plugins.datalabels.font.size","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_font_style"),"Chart.defaults.global.plugins.datalabels.font.style","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_font_weight"),"Chart.defaults.global.plugins.datalabels.font.weight","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_font_lineHeight"),"Chart.defaults.global.plugins.datalabels.font.lineHeight","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_offset"),"Chart.defaults.global.plugins.datalabels.offset","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_opacity"),"Chart.defaults.global.plugins.datalabels.opacity","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_padding_top"),"Chart.defaults.global.plugins.datalabels.padding.top","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_padding_right"),"Chart.defaults.global.plugins.datalabels.padding.right","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_padding_bottom"),"Chart.defaults.global.plugins.datalabels.padding.bottom","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_padding_left"),"Chart.defaults.global.plugins.datalabels.padding.left","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_rotation"),"Chart.defaults.global.plugins.datalabels.rotation","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_text_align"),"Chart.defaults.global.plugins.datalabels.textAlign","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.datalabels_formatter"),"Chart.defaults.global.plugins.datalabels.formatter","","",FALSE)

//tooptip
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_enabled"),"Chart.defaults.global.tooltips.enabled","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_mode"),"Chart.defaults.global.tooltips.mode","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_intersect"),"Chart.defaults.global.tooltips.intersect","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_position"),"Chart.defaults.global.tooltips.position","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_backgroundColor"),"Chart.defaults.global.tooltips.backgroundColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_titleFontFamily"),"Chart.defaults.global.tooltips.titleFontFamily","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_titleFontSize"),"Chart.defaults.global.tooltips.titleFontSize","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_titleFontStyle"),"Chart.defaults.global.tooltips.titleFontStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_titleFontColor"),"Chart.defaults.global.tooltips.titleFontColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_titleSpacing"),"Chart.defaults.global.tooltips.titleSpacing","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_titlemarginbotton"),"Chart.defaults.global.tooltips.titleMarginBottom","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_bodyFontFamily"),"Chart.defaults.global.tooltips.bodyFontFamily","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_bodyFontSize"),"Chart.defaults.global.tooltips.bodyFontSize","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_bodyFontStyle"),"Chart.defaults.global.tooltips.bodyFontStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_bodyFontColor"),"Chart.defaults.global.tooltips.bodyFontColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_bodySpacing"),"Chart.defaults.global.tooltips.bodySpacing","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_footerFontFamily"),"Chart.defaults.global.tooltips.footerFontFamily","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_footerFontSize"),"Chart.defaults.global.tooltips.footerFontSize","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_footerFontStyle"),"Chart.defaults.global.tooltips.footerFontStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_footerFontColor"),"Chart.defaults.global.tooltips.footerFontColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_footerSpacing"),"Chart.defaults.global.tooltips.footerSpacing","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_footerMarginTop"),"Chart.defaults.global.tooltips.footerMarginTop","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_xPadding"),"Chart.defaults.global.tooltips.xPadding","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_yPadding"),"Chart.defaults.global.tooltips.yPadding","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_caretPadding"),"Chart.defaults.global.tooltips.caretPadding","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_cornerRadius"),"Chart.defaults.global.tooltips.cornerRadius","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_multiKeyBackground"),"Chart.defaults.global.tooltips.multiKeyBackground","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_displayColors"),"Chart.defaults.global.tooltips.displayColors","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.tooltip_borderColor"),"Chart.defaults.global.tooltips.borderColor","'","'",FALSE)

//point configuration
ls_return+=of_get_global_property_code(describe("global_configuration.point_radius"),"Chart.defaults.global.elements.point.radius","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_pointStyle"),"Chart.defaults.global.elements.point.pointStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_backgroundColor"),"Chart.defaults.global.elements.point.backgroundColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_borderWidth"),"Chart.defaults.global.elements.point.borderWidth","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_borderColor"),"Chart.defaults.global.elements.point.borderColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_hitRadius"),"Chart.defaults.global.elements.point.hitRadius","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_hoverRadius"),"Chart.defaults.global.elements.point.hoverRadius","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_hoverBorderWidth"),"Chart.defaults.global.elements.point.hoverBorderWidth","","",FALSE)

//line configuration
ls_return+=of_get_global_property_code(describe("global_configuration.line_tension"),"Chart.defaults.global.elements.line.tension","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_backgroundColor"),"Chart.defaults.global.elements.line.backgroundColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_borderWidth"),"Chart.defaults.global.elements.line.borderWidth","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_borderCapStyle"),"Chart.defaults.global.elements.line.borderCapStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_borderDash"),"Chart.defaults.global.elements.line.borderDash","","",TRUE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_borderDashOffset"),"Chart.defaults.global.elements.line.borderDashOffset","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_borderJoinStyle"),"Chart.defaults.global.elements.line.borderJoinStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_capBezierPoints"),"Chart.defaults.global.elements.line.capBezierPoints","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_fill"),"Chart.defaults.global.elements.line.fill","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_stepped"),"Chart.defaults.global.elements.line.stepped","","",FALSE)

//rectangle configuration
ls_return+=of_get_global_property_code(describe("global_configuration.rectangle_backgroundColor"),"Chart.defaults.global.elements.rectangle.backgroundColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.rectangle_borderWidth"),"Chart.defaults.global.elements.rectangle.borderWidth","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.rectangle_borderColor"),"Chart.defaults.global.elements.rectangle.borderColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.rectangle_borderSkipped"),"Chart.defaults.global.elements.rectangle.borderSkipped","'","'",FALSE)

//arc configuration
ls_return+=of_get_global_property_code(describe("global_configuration.arc_backgroundColor"),"Chart.defaults.global.elements.arc.backgroundColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.arc_borderColor"),"Chart.defaults.global.elements.arc.borderColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.arc_borderWidth"),"Chart.defaults.global.elements.arc.borderWidth","","",FALSE)

return ls_return
end function

public function string of_get_options ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_option
//
// PURPOSE:    Return the code for the chart global options specified parameters
//
// ARGUMENTS: 
//
// RETURN:		String - source code
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return


//=============== title ======================
string ls_title
ls_title += of_get_property_code(describe("global_configuration.title.display"),"Chart.Default.global.title.display","","",FALSE)
ls_title += of_get_property_code(describe("global_configuration.title.text"),"Chart.Default.global.title.text","","",FALSE)



return ls_return
end function

public function string of_get_global_property_code (string as_value, string as_javascript_name, string as_string_before_value, string as_string_after_value, boolean ab_array);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_global_property_code
//
// PURPOSE:    Returns the javascript code to declare a global property
//					as_javascript_name = as_string_before_value as_value as_string_after_value ;
//
// ARGUMENTS: string : value of the property
//					string : Javascript name (case sensitive!)
//					string : characters befor value
//					string caracters afater value
//					boolean : property is an array
//
// RETURN:		String - "" of no value, source code if balue found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string  ls_return
IF as_value = "" THEN return ""
IF ab_array THEN
	as_value = inv_string.of_globalreplace(as_value,";",as_string_after_value+","+as_string_before_value)
	as_value = "["+as_string_before_value + as_value + as_string_after_value+"]"
ELSE
		as_value = as_string_before_value + as_value + as_string_after_value
END IF

ls_return = as_javascript_name  + "= "+as_value+";"+is_pbcr

return ls_return
end function

public function string of_build_scales ();// -----------------------------------------------------------------------------
// SCRIPT:     of_build_scales
//
// PURPOSE:    Build the scales json source code
//
// ARGUMENTS: 
//
// RETURN:		String - scales source code
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
//01/01/2026 FFasolin added javascript comments
// ------------------------------------------------------------------------------
string ls_xaxes, ls_yaxes,ls_axis,ls_axis_type, ls_scales, ls_scaleLabel, ls_angleLines, ls_point_label
string ls_gridlines, ls_ticks,ls_time,ls_display_format, ls_type, ls_title_padding,ls_minor_ticks,ls_major_ticks
int ii

FOR ii = 1 to li_axes_index_max

	ls_type = describe("axes("+string(ii)+").xyaxes")
	ls_axis="";	ls_gridlines="";	ls_ticks ="";	ls_time="";	ls_display_format = "";	ls_angleLines = "";ls_point_label = ""; ls_title_padding=""; ls_scaleLabel=""
	ls_minor_ticks='';	ls_major_ticks=''
	IF ls_type <> "" THEN
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").display"),"display","","",false)
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").weight"),"weight","","",false)
		ls_axis_type=describe("axes("+string(ii)+").axes_type")
		ls_axis += of_get_property_code(ls_axis_type,"type","'","'",false)
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").position"),"position","'","'",false)
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").offset"),"offset","","",false)
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").id"),"id","'","'",false)
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").stacked"),"stacked","","",false)
		//grid lines
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_display"),"display","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_color"),"color","'","'",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_borderDash"),"borderDash","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_borderDashOffset"),"borderDashOffset","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_lineWidth"),"lineWidth","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_drawBorder"),"drawBorder","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_drawOnChartArea"),"drawOnChartArea","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_drawTicks"),"drawTicks","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_tickMarkLength"),"tickMarkLength","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_zeroLineWidth"),"zeroLineWidth","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_zeroLineColor"),"zeroLineColor","'","'",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_zeroLineBorderDash"),"zeroLineBorderDash","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_zeroLineBorderDashOffset"),"zeroLineBorderDashOffset","","",false)
		ls_gridlines+=of_get_property_code(describe("axes("+string(ii)+").gridline_offsetGridLines"),"offsetGridLines","","",false)
		IF ls_gridlines <> "" THEN ls_gridlines="gridLines: {"+ls_gridlines+"},//gridLines"+is_pbcr 
		ls_axis += ls_gridlines
		
		//scale label
		ls_scaleLabel +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_display"),"display","","",false)			
		ls_scaleLabel +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_labelString"),"labelString","'","'",false)		
		ls_scaleLabel +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_lineHeight"),"lineHeight","'","'",false)		
		ls_scaleLabel +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_fontColor"),"fontColor","'","'",false)		
		ls_scaleLabel +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_fontFamily"),"fontFamily","'","'",false)		
		ls_scaleLabel +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_fontSize"),"fontSize","","",false)		
		ls_scaleLabel +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_fontStyle"),"fontStyle","'","'",false)		
		ls_title_padding +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_padding_top"),"top","","",false)	
		ls_title_padding +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_padding_bottom"),"bottom","","",false)
		IF ls_title_padding <> "" THEN ls_title_padding="padding: {"+ls_title_padding+"},//title.padding"+is_pbcr 
		ls_scaleLabel += ls_title_padding
		IF ls_scaleLabel <> "" THEN ls_scaleLabel="scaleLabel: {"+ls_scaleLabel+"},//scalesLabel"+is_pbcr 

		ls_axis += ls_scaleLabel
		
		//ticks
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_autoskip"),"autoSkip","","",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_autoSkipPadding"),"autoSkipPadding","","",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_labelOffset"),"labelOffset","","",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_maxRotation"),"maxRotation","","",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_minRotation"),"minRotation","","",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_mirror"),"mirror","","",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_padding"),"padding","","",false)
		CHOOSE CASE ls_axis_type
			CASE "category"
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").category_labels"),"labels","'","'",true)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").category_min"),"min","'","'",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").category_max"),"max","'","'",false)
			CASE "linear"
				//cartesian
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_beginAtZero"),"beginAtZero","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_min"),"min","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_max"),"max","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_maxTicksLimit"),"maxTicksLimit","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_stepSize"),"stepSize","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_suggestedMax"),"suggestedMax","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_suggestedMin"),"suggestedMin","","",false)		
				//radial
				//angleline
				ls_angleLines+=of_get_property_code(describe("axes("+string(ii)+").radial_anglelines_display"),"display","","",false)
				ls_angleLines+=of_get_property_code(describe("axes("+string(ii)+").radial_anglelines_color"),"color","'","'",false)
				ls_angleLines+=of_get_property_code(describe("axes("+string(ii)+").radial_anglelines_lineWidth"),"lineWidth","","",false)
				IF ls_angleLines <> "" THEN ls_angleLines="angleLines: {"+ls_angleLines+"},//angle_lines"+is_pbcr 
				ls_axis+= ls_angleLines
				//labelpoint
				ls_point_label +=of_get_property_code(describe("axes("+string(ii)+").pointlabel_fontcolor"),"fontColor","'","'",false)
				ls_point_label +=of_get_property_code(describe("axes("+string(ii)+").pointlabel_fontFamily"),"fontFamily","'","'",false)
				ls_point_label +=of_get_property_code(describe("axes("+string(ii)+").pointlabel_fontSize"),"fontSize","","",false)
				ls_point_label +=of_get_property_code(describe("axes("+string(ii)+").pointlabel_fontStyle"),"fontStyle","'","'",false)
				IF ls_point_label <> "" THEN ls_point_label="ls_point_label: {"+ls_point_label+"},//pointLabel"+is_pbcr 
				ls_axis+= ls_point_label
				//ticks
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_backdropColor"),"backdropColor","'","'",false)	
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_backdropPaddingX"),"backdropPaddingX","","",false)		
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_backdropPaddingY"),"backdropPaddingY","","",false)		
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_beginAtZero"),"beginAtZero","","",false)		
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_min"),"min","","",false)		
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_max"),"max","","",false)		
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_maxTicksLimit"),"maxTicksLimit","","",false)		
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_stepSize"),"stepSize","","",false)		
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_suggestedMax"),"suggestedMax","","",false)		
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_suggestedMin"),"suggestedMin","","",false)		
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_showLabelBackdrop"),"showLabelBackdrop","","",false)		
				
			CASE "logarithmic"
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").log_min"),"min","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").log_max"),"max","","",false)
			CASE "time"
				ls_axis += of_get_property_code(describe("axes("+string(ii)+").time_distribution"),"distribution","'","'",false)
				ls_axis += of_get_property_code(describe("axes("+string(ii)+").time_bounds"),"bounds","'","'",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").time_source"),"source","","",false)		
				ls_display_format+= of_get_property_code(describe("axes("+string(ii)+").time_df_millisecond"),"millisecond","'","'",false)
				ls_display_format+= of_get_property_code(describe("axes("+string(ii)+").time_df_second"),"second","'","'",false)
				ls_display_format+= of_get_property_code(describe("axes("+string(ii)+").time_df_minute"),"minute","'","'",false)
				ls_display_format+= of_get_property_code(describe("axes("+string(ii)+").time_df_hour"),"hour","'","'",false)
				ls_display_format+= of_get_property_code(describe("axes("+string(ii)+").time_df_day"),"day","'","'",false)
				ls_display_format+= of_get_property_code(describe("axes("+string(ii)+").time_df_week"),"week","'","'",false)
				ls_display_format+= of_get_property_code(describe("axes("+string(ii)+").time_df_month"),"month","'","'",false)
				ls_display_format+= of_get_property_code(describe("axes("+string(ii)+").time_df_quarter"),"quarter","'","'",false)
				ls_display_format+= of_get_property_code(describe("axes("+string(ii)+").time_df_year"),"year","'","'",false)
				IF ls_display_format <> "" THEN ls_display_format="displayFormats: {"+ls_display_format+"},//time.displayFormats"+is_pbcr 
				ls_time+=ls_display_format
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_isoWeekday"),"isoWeekday","","",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_max"),"max","","",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_min"),"min","","",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_parser"),"parser","","",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_round"),"round","'","'",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_tooltipFormat"),"tooltipFormat","'","'",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_unit"),"unit","'","'",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_stepSize"),"stepSize","'","'",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_minUnit"),"minUnit","'","'",false)
				IF ls_time <> "" THEN ls_time="time: {"+ls_time+"},//time"+is_pbcr 
				//IF ls_axis <> "" THEN ls_axis += ","
				ls_axis+= ls_time
				
		END CHOOSE
		
		
		
		
		//tick configuration
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_display"),"display","","",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_fontcolor"),"fontColor","'","'",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_fontfamily"),"fontFamily","'","'",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_fontsize"),"fontSize","'","'",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_fontstyle"),"fontStyle","'","'",false)
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_reverse"),"reverse","","",false)
		ls_minor_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontcolor"),"fontColor","'","'",false)
		ls_minor_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontfamily"),"fontFamily","'","'",false)
		ls_minor_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontsize"),"fontSize","","",false)
		ls_minor_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontstyle"),"fontStyle","'","'",false)
		ls_major_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_major_fontcolor"),"fontColor","'","'",false)
		ls_major_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_major_fontfamily"),"fontFamily","'","'",false)
		ls_major_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_major_fontsize"),"fontSize","'","'",false)
		ls_major_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_major_fontstyle"),"fontStyle","'","'",false)
		
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_callback"),"callback","","",false)
		
		IF ls_minor_ticks <> "" THEN ls_ticks="minor: {"+ls_minor_ticks+"},//minor"+is_pbcr 
		IF ls_major_ticks <> "" THEN ls_ticks="major: {"+ls_major_ticks+"},//major"+is_pbcr 
		
		IF ls_ticks <> "" THEN ls_ticks="ticks: {"+ls_ticks+"},//ticks"+is_pbcr 

		ls_axis+= ls_ticks
		
		CHOOSE CASE ls_type
			CASE "xAxes"
				ls_xaxes += "{"+ls_axis+"},"+is_pbcr 
			CASE "yAxes"
				ls_yaxes += "{"+ls_axis+"},"+is_pbcr 
		END CHOOSE
	END IF
	
NEXT


IF ls_xaxes<> "" THEN ls_xaxes="xAxes:["+is_PBCR+ls_xaxes+is_PBCR+"]//xAxes"+is_PBCR
IF ls_yaxes<> "" THEN ls_yaxes="yAxes:["+is_PBCR+ls_yaxes+is_PBCR+"]//Yaxes"+is_PBCR

ls_scales = ls_xaxes
IF ls_xaxes<> "" and ls_yaxes<> "" THEN ls_scales +=","
ls_scales += ls_yaxes
IF ls_scales<> "" THEN ls_scales="scales:{"+is_PBCR+ls_scales+is_PBCR+"},//scales"+is_PBCR
return ls_scales
end function

public function string of_build_options ();// -----------------------------------------------------------------------------
// SCRIPT:     of_build_options
//
// PURPOSE:    Build the options json source code
//
// ARGUMENTS: integer : chart index
//
// RETURN:		String - options source code
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_options, ls_animate, ls_propagate

IF ib_use_webview_control = FALSE THEN
	//click event
	ls_options += "onClick:function(e){"+is_pbcr 
	ls_options += "var activePoints = myChart.getElementsAtEvent(e);"+is_pbcr 
	ls_options +="if (activePoints.length < 1) { return;}"+is_pbcr 
	ls_options += "var selectedIndex = activePoints[0]._index;"+is_pbcr 
	ls_options += "let element = this.getElementAtEvent(event);"+is_pbcr 
	ls_options += "if (element.length > 0) {"+is_pbcr 
	ls_options+= "  var dataset = element[0]._datasetIndex;"+is_pbcr 
	ls_options+= "  var series = this.data.datasets[dataset].label;"+is_pbcr 
	ls_options += "var label =  this.data.labels[element[0]._index];"+is_pbcr 
	ls_options += "var value = this.data.datasets[element[0]._datasetIndex].data[element[0]._index];"+is_pbcr 
	ls_options += "document.title = '<action>clicked</action>'+'<label>'+ label+'</label><series>'+series+'</series><value>'+value+'</value>';;"+is_pbcr 
	ls_options += "}"+is_pbcr 
	ls_options += "},"+is_pbcr 
END IF
//lines
ls_options += of_get_property_code(describe("chart_options.showlines"),"showLines","","",false)
ls_options += of_get_property_code(describe("chart_options.spanGaps"),"spanGaps","","",false)

//bar
ls_options += of_get_property_code(describe("chart_options.barPercentage"),"barPercentage","","",false)
ls_options += of_get_property_code(describe("chart_options.categoryPercentage"),"categoryPercentage","","",false)
ls_options += of_get_property_code(describe("chart_options.barThickness"),"barThickness","","",false)
ls_options += of_get_property_code(describe("chart_options.maxBarThickness"),"maxBarThickness","","",false)
//donut, pie
ls_options += of_get_property_code(describe("chart_options.cutoutPercentage"),"cutoutPercentage","","",false)
ls_options += of_get_property_code(describe("chart_options.rotation"),"rotation","","",false)
ls_options += of_get_property_code(describe("chart_options.circumference"),"circumference","","",false)
//donut, pie, polar
ls_animate += of_get_property_code(describe("chart_options.animation_animateRotate"),"animateRotate","","",false)
ls_animate += of_get_property_code(describe("chart_options.animation_animateScale"),"animateScale","","",false)
//ls_animate += "onComplete: function(animation) {document.title='<action>displayed</action>';}"
IF ls_animate <> "" THEN ls_animate="animation: {"+ls_animate+"},//options.animations"+is_pbcr 
ls_options += ls_animate


//Polar Area
ls_options += of_get_property_code(describe("chart_options.startAngle"),"startAngle","","",false)
//all area
ls_propagate+= of_get_property_code(describe("chart_options.plugins_filler_propagate"),"propagate","","",false)
IF ls_propagate <> "" THEN ls_propagate="plugins: {filler:{"+ls_propagate+"}}"
ls_options += ls_propagate

//tooltip callbacks
string ls_tooltip_callback
ls_tooltip_callback += of_get_property_code(describe("chart_options.tooltip_callbacks"),"callbacks","","",false)
IF ls_tooltip_callback <> "" THEN
	ls_tooltip_callback = inv_string.of_globalreplace(ls_tooltip_callback,"callbacks:","")
	ls_tooltip_callback = "tooltips: { callbacks: {"+ls_tooltip_callback+"}"+"},//options.tooltips"+is_pbcr 
	ls_options+=ls_tooltip_callback
END IF

return ls_options
end function

public function blob of_get_png_binary ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_png_binary
//
// PURPOSE:    Returns the binary of a png image representing the graph
//
// ARGUMENTS: 
//
// RETURN:		blob
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_script, ls_png
Blob lblob_data
ULong lul_len, lul_buflen, lul_skip, lul_pflags
Boolean lb_rtn
int li_ret
string ls_js,ls_Type
long ll_RootObject

//ls_script = "var pngBin = myChart.toDataURL('image/png').replace(/^data:image\/(png|jpg);base64,/, '');"
IF ii_chartjs_version < 3 THEN
	ls_script = "var pngBin = document.getElementById('myChart').toDataURL('image/png').replace(/^data:image\/(png|jpg);base64,/, '');"
ELSE
	ls_script = "var pngBin = document.getElementById('myChart_canvas').toDataURL('image/png').replace(/^data:image\/(png|jpg);base64,/, '');"
END IF 

IF ib_use_webview_control = FALSE THEN
	ioo.document.ParentWindow.ExecScript(ls_script)
	ls_png = ioo.document.parentwindow.pngBin
ELSE
	string ls_result, ls_error
	iwb.EvaluateJavascriptSync(ls_script, ls_Result, ls_Error)
	ls_JS = "function getPNG(){return (pngBin);} getPNG();"
	li_ret = iwb.EvaluateJavascriptSync(ls_JS, ls_png, ls_Error)

	If li_ret = 1 Then
	 JsonParser lnv_JsonParser
	 lnv_JsonParser = Create JsonParser
	 lnv_JsonParser.LoadString(ls_png)
	 ll_RootObject = lnv_JsonParser.GetRootItem()
	 ls_Type = lnv_JsonParser.GetItemString(ll_RootObject, "type")
	 ls_png = lnv_JsonParser.GetItemString(ll_RootObject, "value")
	End If

If IsValid(lnv_JsonParser) Then Destroy (lnv_JsonParser)



END IF




lul_len = Len(ls_png)
lul_buflen = lul_len
lblob_data = Blob(Space(lul_len))

lb_rtn = CryptStringToBinary(ls_png, lul_len, CRYPT_STRING_BASE64, lblob_data,lul_buflen, lul_skip, lul_pflags)

return lblob_data




end function

public function integer of_saveas_png (string as_filename);// -----------------------------------------------------------------------------
// SCRIPT:     of_saveas_png
//
// PURPOSE:    Saves the graph as a png file
//
// ARGUMENTS: string : png file name
//
// RETURN:		integer 1 ok, -1 not ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
blob lblob 
int li_FileNum
long ll_ret
lblob = of_get_png_binary()

li_FileNum = FileOpen( as_filename, StreamMode!, Write!, Shared!, Replace!)
if li_filenum > 0 then
	ll_ret = FileWriteex(li_FileNum,lblob)
	fileclose(li_filenum)
	return 1
end if
return -1
				
end function

public function integer of_settransobject (transaction atr);int ii, li_nb_ds, li_ret
li_nb_ds = upperbound(ids_chart_datasource)
FOR ii = 1 to li_nb_ds
	li_ret =  ids_chart_datasource[ii].settransobject(atr)
NEXT
return 1
end function

public function string of_set_dw_object (datastore ads, string as_dw_object_name, string as_pbl);//sets the dataobject of a datastore
// if not able to load from target pbl list, tries to load it from pbl
string ls_syntax,ls_error
ads.dataobject = as_dw_object_name
ls_syntax = ads.describe("DataWindow.Syntax")
IF ls_syntax = "" or ls_syntax = "?" THEN 
	ls_syntax = libraryexport(as_pbl,as_dw_object_name,ExportDataWindow!)
	ads.create(ls_syntax,ls_error)
	IF ls_error <> "" THEN return ls_error
END IF
IF ls_error <> "" THEN
	Messagebox("PowerCharts","Unable to find datawindow object " +as_dw_object_name + " in "+ as_pbl)
end if
return ls_error
end function

public function string of_open (string as_object_name, string as_pbl);// -----------------------------------------------------------------------------
// SCRIPT:     of_open
//
// PURPOSE:    loads all graph definition data
//
// ARGUMENTS: string as_object_name : gr_xxx library entry name
//						for a graph
//                       string : pbl name (when called by painter)
//
// RETURN:		String - error text, "" if ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------

string ls_syntax,ls_source_name,ls_source_data,ls_comment,ls_return
long ii, ll_nb_rows
int li_chart_index
string ls_errors
//loads the source code into the datastore
//ids_source_code_container.dataobject = as_object_name
ls_errors = this.of_set_dw_object(ids_source_code_container,as_object_name,as_pbl)


//Checks that it has loaded
ls_syntax = ids_source_code_container.describe("DataWindow.Syntax")
IF ls_syntax = "" or ls_syntax = "?" THEN
	Messagebox("Chart.js datawindow","Datawindow object " + ids_source_code_container.dataobject + " not found")
	return as_object_name + " no longer exists."
END IF

ll_nb_rows = ids_source_code_container.rowcount()
IF ll_nb_rows = 0 THEN return as_object_name + " could not be loaded."


li_chart_index_max = 1
li_axes_index_max = 1


//reads all ds source data
FOR ii = 1 to ll_nb_rows
	ls_source_name = 	ids_source_code_container.getitemstring(ii,"source_name")
	ls_source_data = ids_source_code_container.getitemstring(ii,"source_data")
	CHOOSE CASE ls_source_name
		CASE "d_pbwc_graph_configuration"
			is_source_comment = ids_source_code_container.getitemstring(ii,"source_comment")
			ls_return= of_load_property_data(ids_graph_configuration_properties,ls_source_data) 
			IF ls_return <> "" THEN return ls_return
		CASE "d_pbwc_charts_properties"
			ls_return= of_load_property_data(ids_charts_properties,ls_source_data) 
			ids_charts_properties.sort()
			IF ls_return <> "" THEN return ls_return
		CASE "d_pbwc_datasets_properties"
			ls_return= of_load_property_data(ids_datasets_properties,ls_source_data) 
			IF ls_return <> "" THEN return ls_return
		CASE "d_pbwc_options"
			ls_return= of_load_property_data(ids_chart_config_options,ls_source_data) 
			IF ls_return <> "" THEN return ls_return
		CASE "d_pbwc_axes_properties"
			ls_return= of_load_property_data(ids_chart_axes,ls_source_data) 
			IF ls_return <> "" THEN return ls_return
			
	END CHOOSE
NEXT

//loads datasources datawindows
ll_nb_rows = ids_charts_properties.rowcount()
FOR ii = 1 to ll_nb_rows
	li_chart_index = ids_charts_properties.getitemnumber(ii,"chart_index")
	of_set_datasource(li_chart_index)
NEXT

//sets max properties instance variables
of_set_max_properties()



return ""

end function

public function integer of_print (dragobject ado);// -----------------------------------------------------------------------------
// SCRIPT:     of_print
//
// PURPOSE:    prints the chart using a datastore and a generated png file
//
// ARGUMENTS: chart jas datawindow control
//
// RETURN:		integer 1 : ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_png_file
ls_png_file = of_export_for_printing(ado)
ids_print.setitem(1,"bitmap_file_name",ls_png_file)
ids_print.object.bitmap_file_name.width = ado.width
ids_print.object.bitmap_file_name.height = ado.height
ids_print.print()
return 1
end function

public function string of_export_for_printing (dragobject ado);// -----------------------------------------------------------------------------
// SCRIPT:     of_export_for_printing
//
// PURPOSE:    Export chart to png file with with auto generated name
//					exports to tmp dir.
//
// ARGUMENTS: 
//
// RETURN:		string : full file name of png generated file
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_path, ls_file, ls_return
ls_path = of_get_temp_folder()
il_printing_id++
ls_file = ls_path + "\"+ado.classname() + "_"+string(il_printing_id)+".png"
filedelete(ls_file)
of_saveas_png(ls_file)
IF fileexists(ls_file) THEN 
	ls_return = ls_file
	is_print_bitmap_file_name[upperbound(is_print_bitmap_file_name) +1] = ls_file
END IF
return ls_return
end function

public function string of_get_last_command ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_last_command
//
// PURPOSE:    Returns the last javascript code sent to the browser.
//					Can be used to send the graph to a Website.
//
// ARGUMENTS: 
//
// RETURN:		String - "" javescript code
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
return "<script>"+is_pbcr +is_last_command+is_pbcr+ "</script>"
end function

public subroutine of_register_chart_js_datawindow (uov_chart_js_datawindow auo);// -----------------------------------------------------------------------------
// SCRIPT:     of_register_chart_js_datawindow
//
// PURPOSE:    Used to register chart js datawindow for callbacks
//
// ARGUMENTS: chartjsdatawindow
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
iuo_chart_js_datawindow=auo
ib_use_webview_control = iuo_chart_js_datawindow.ib_use_webview_control
end subroutine

public function integer of_saveas_html (string as_filename);// -----------------------------------------------------------------------------
// SCRIPT:     of_saveas_html
//
// PURPOSE:    Saves the graph as a html file
//
// ARGUMENTS: string : html file name
//
// RETURN:		integer 1 ok, -1 not ok
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2023	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_html,ls_tempdir,ls_filename,ls_main_html,ls_chart_bundle_js,ls_chartjs_plugin_datalabels_js
int li_FileNum
long ll_ret

IF ii_chartjs_version <3 THEN

	//gets the empty HTML template in temp dir
	ls_tempdir =  of_get_temp_folder ( )
	ls_filename=ls_tempdir+"\pbwc_graph.htm"
	li_FileNum = FileOpen(ls_filename,  textMode!, read!)
	IF li_FileNum < 0 THEN return -1
	ll_ret = Filereadex(li_FileNum, ls_main_html)
	fileclose(li_FileNum)
	IF  ll_ret< 0 THEN return -1
	ls_main_html= inv_string.of_globalreplace(ls_main_html,'<meta charset="utf-8">','<meta name="http-equiv" content="Content-type: text/html; charset=ISO-88591"/>')
	//setting graph generated code
	ls_main_html= inv_string.of_globalreplace(ls_main_html,'</BODY>','</BODY>~r~n<SCRIPT>'+is_last_command+'~r~n</SCRIPT>')
	
	
	
	
	//gets the chart.bundle.js in temp dir
	ls_filename=ls_tempdir+"\chart.bundle.js"
	li_FileNum = FileOpen(ls_filename,  textMode!, read!)
	IF li_FileNum < 0 THEN return -1
	ll_ret = Filereadex(li_FileNum, ls_chart_bundle_js)
	fileclose(li_FileNum)
	IF ll_ret < 0 THEN return -1
	ls_main_html = inv_string.of_globalreplace(ls_main_html,'<script src="chart.bundle.js">','<script>~r~n'+ls_chart_bundle_js+'~r~n')
	
	//gets the chartjs-plugin-datalabels.js in temp dir
	ls_filename=ls_tempdir+"\chartjs-plugin-datalabels.js"
	li_FileNum = FileOpen(ls_filename,  textMode!, read!)
	IF li_FileNum < 0 THEN return -1
	ll_ret = Filereadex(li_FileNum, ls_chartjs_plugin_datalabels_js)
	fileclose(li_FileNum)
	IF ll_ret < 0 THEN return -1
	ls_main_html = inv_string.of_globalreplace(ls_main_html,'<script src="chartjs-plugin-datalabels.js">','<script>~r~n'+ls_chartjs_plugin_datalabels_js+'~r~n')
	
	
	li_FileNum = FileOpen( as_filename, textMode!, Write!, Shared!, Replace!)
	if li_filenum > 0 then
		ll_ret = FileWriteex(li_FileNum,ls_main_html)
		fileclose(li_filenum)
		IF li_FileNum < 0 THEN return -1
		return 1
	end if
	
	
ELSE
	//chart.js v4.5
	
	//gets the empty HTML template in temp dir
	ls_tempdir =  of_get_temp_folder ( )
	ls_filename=ls_tempdir+"\pbwc_graph45.htm"
	li_FileNum = FileOpen(ls_filename,  textMode!, read!)
	IF li_FileNum < 0 THEN return -1
	ll_ret = Filereadex(li_FileNum, ls_main_html)
	fileclose(li_FileNum)
	IF  ll_ret< 0 THEN return -1
	ls_main_html= inv_string.of_globalreplace(ls_main_html,'<meta charset="utf-8">','<meta name="http-equiv" content="Content-type: text/html; charset=ISO-88591"/>')
	//setting graph generated code
	ls_main_html= inv_string.of_globalreplace(ls_main_html,'</BODY>','</BODY>~r~n<SCRIPT>'+is_last_command+'~r~n</SCRIPT>')
	
	
	
	
	//gets the luxon.min.js in temp dir
	string ls_luxon_min_js
	ls_filename=ls_tempdir+"\luxon.min.js"
	li_FileNum = FileOpen(ls_filename,  textMode!, read!)
	IF li_FileNum < 0 THEN return -1
	ll_ret = Filereadex(li_FileNum, ls_luxon_min_js)
	fileclose(li_FileNum)
	IF ll_ret < 0 THEN return -1
	ls_main_html = inv_string.of_globalreplace(ls_main_html,'<script src="luxon.min.js">','<script>~r~n'+ls_luxon_min_js+'~r~n')
	
	//gets the luxon.min.js in temp dir
	string ls_chart_umd_js
	ls_filename=ls_tempdir+"\chart.umd.js"
	li_FileNum = FileOpen(ls_filename,  textMode!, read!)
	IF li_FileNum < 0 THEN return -1
	ll_ret = Filereadex(li_FileNum, ls_chart_umd_js)
	fileclose(li_FileNum)
	IF ll_ret < 0 THEN return -1
	ls_main_html = inv_string.of_globalreplace(ls_main_html,'<script src="chart.umd.js">','<script>~r~n'+ls_chart_umd_js+'~r~n')
	
	//gets the chartjs-adapter-luxon.js in temp dir
	string ls_chartjs_adapter_luxon_js
	ls_filename=ls_tempdir+"\chart.umd.js"
	li_FileNum = FileOpen(ls_filename,  textMode!, read!)
	IF li_FileNum < 0 THEN return -1
	ll_ret = Filereadex(li_FileNum, ls_chartjs_adapter_luxon_js)
	fileclose(li_FileNum)
	IF ll_ret < 0 THEN return -1
	ls_main_html = inv_string.of_globalreplace(ls_main_html,'<script src="chartjs-adapter-luxon.js">','<script>~r~n'+ls_chartjs_adapter_luxon_js+'~r~n')
	
	//gets the chartjs-plugin-datalabels.js in temp dir
	string chartjs_plug_in_datalabels_js
	ls_filename=ls_tempdir+"\chartjs-plug-in-datalabels.js"
	li_FileNum = FileOpen(ls_filename,  textMode!, read!)
	IF li_FileNum < 0 THEN return -1
	ll_ret = Filereadex(li_FileNum, chartjs_plug_in_datalabels_js)
	fileclose(li_FileNum)
	IF ll_ret < 0 THEN return -1
	ls_main_html = inv_string.of_globalreplace(ls_main_html,'<script src="chartjs-plug-in-datalabels.js">','<script>~r~n'+chartjs_plug_in_datalabels_js+'~r~n')
	
	
	li_FileNum = FileOpen( as_filename, textMode!, Write!, Shared!, Replace!)
	if li_filenum > 0 then
		ll_ret = FileWriteex(li_FileNum,ls_main_html)
		fileclose(li_filenum)
		IF li_FileNum < 0 THEN return -1
		return 1
	end if
	
END IF
return -1
				
end function

public subroutine of_register_wb_object (webbrowser awb);// -----------------------------------------------------------------------------
// SCRIPT:     of_register_wb_object
//
// PURPOSE:    Used to register webbrowser internal object that will display the graph
//
// ARGUMENTS: webbrowser : the webbrowsercontrol
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
iwb=awb
end subroutine

public function string of_get_global_configuration_code45 ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_global_configuration_code45
//
// PURPOSE:    Return the code for global confiruation specified parameters
//
// ARGUMENTS: 
//
// RETURN:		String - source code
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2026	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return



ls_return+=of_get_global_property_code(describe("global_configuration.devicePixelRatio"),"Chart.defaults.devicePixelRatio","","",FALSE)
//================ interactions =======================
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_mode"),"Chart.defaults.hover.mode","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_intersect"),"Chart.defaults.hover.intersect","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_axis"),"Chart.defaults.hover.axis","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_animationduration"),"Chart.defaults.hover.animationDuration","","",FALSE)
//default font setting
ls_return+=of_get_global_property_code(describe("global_configuration.defaultfontcolor"),"Chart.defaults.Color","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.defaultFontFamily"),"Chart.defaults.FontFamily","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.defaultFontSize"),"Chart.defaults.FontSize","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.defaultFontStyle"),"Chart.defaults.FontStyle","'","'",FALSE)

//point configuration
ls_return+=of_get_global_property_code(describe("global_configuration.point_radius"),"Chart.defaults.elements.point.radius","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_pointStyle"),"Chart.defaults.elements.point.pointStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_backgroundColor"),"Chart.defaults.elements.point.backgroundColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_borderWidth"),"Chart.defaults.elements.point.borderWidth","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_borderColor"),"Chart.defaults.elements.point.borderColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_hitRadius"),"Chart.defaults.elements.point.hitRadius","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_hoverRadius"),"Chart.defaults.elements.point.hoverRadius","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.point_hoverBorderWidth"),"Chart.defaults.elements.point.hoverBorderWidth","","",FALSE)

//line configuration
ls_return+=of_get_global_property_code(describe("global_configuration.line_tension"),"Chart.defaults.elements.line.tension","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_backgroundColor"),"Chart.defaults.elements.line.backgroundColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_borderWidth"),"Chart.defaults.elements.line.borderWidth","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_borderCapStyle"),"Chart.defaults.elements.line.borderCapStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_borderDash"),"Chart.defaults.elements.line.borderDash","","",TRUE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_borderDashOffset"),"Chart.defaults.elements.line.borderDashOffset","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_borderJoinStyle"),"Chart.defaults.elements.line.borderJoinStyle","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_capBezierPoints"),"Chart.defaults.elements.line.capBezierPoints","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_fill"),"Chart.defaults.elements.line.fill","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.line_stepped"),"Chart.defaults.elements.line.stepped","","",FALSE)

//rectangle configuration
ls_return+=of_get_global_property_code(describe("global_configuration.rectangle_backgroundColor"),"Chart.defaults.elements.bar.backgroundColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.rectangle_borderWidth"),"Chart.defaults.elements.bar.borderWidth","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.rectangle_borderColor"),"Chart.defaults.elements.bar.borderColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.rectangle_borderSkipped"),"Chart.defaults.elements.bar.borderSkipped","'","'",FALSE)

//arc configuration
ls_return+=of_get_global_property_code(describe("global_configuration.arc_backgroundColor"),"Chart.defaults.elements.arc.backgroundColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.arc_borderColor"),"Chart.defaults.elements.arc.borderColor","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.arc_borderWidth"),"Chart.defaults.elements.arc.borderWidth","","",FALSE)

return ls_return
end function

public function string of_get_hover ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_hover
//
// PURPOSE:    Return the code for global confiruation specified parameters for hover
//
// ARGUMENTS: 
//
// RETURN:		String - source code
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return

//================ interactions =======================
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_mode"),"mode","'","'",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_intersect"),"intersect","","",FALSE)
ls_return+=of_get_global_property_code(describe("global_configuration.interactions_axis"),"axis","'","'",FALSE)

return ls_return
end function

public function string of_get_default_font ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_default_font
//
// PURPOSE:    Return the code for global confiruation specified parameters for default font
//
// ARGUMENTS: 
//
// RETURN:		String - source code
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2026	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return

//default font setting
is_default_fontcolor+=of_get_property_code(describe("global_configuration.defaultfontcolor"),"color","'","'",FALSE)
is_default_fonts+= 'font:{'
is_default_fonts+=of_get_property_code(describe("global_configuration.defaultFontFamily"),"family","'","'",FALSE)
is_default_fonts+=of_get_property_code(describe("global_configuration.defaultFontSize"),"size","","",FALSE)
is_default_fonts+=of_get_property_code(describe("global_configuration.defaultFontStyle"),"style","'","'",FALSE)
is_default_fonts+= '},'

return ls_return


end function

public function string of_build_scales_45 ();// -----------------------------------------------------------------------------
// SCRIPT:     of_build_scales
//
// PURPOSE:    Build the scales json source code
//
// ARGUMENTS: 
//
// RETURN:		String - scales source code
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2026	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_axis,ls_axis_type, ls_scales
string  ls_type,ls_id,ls_chart_type
int ii

ls_chart_type = describe("chart(1).chart_type")
IF ls_chart_type = "" THEN ls_chart_type = "bar"

FOR ii = 1 to li_axes_index_max

	
	ls_type = describe("axes("+string(ii)+").xyaxes")
	ls_axis="";	
	IF ls_type <> "" THEN
		ls_id = describe("axes("+string(ii)+").id")
		IF ls_id = "" THEN
			
			CHOOSE CASE ls_chart_type
				Case "radar","polarArea"
					ls_id = 'r'
			CASE ELSE
				IF ls_type = "xAxes" THEN ls_id = 'x'
				IF ls_type = "yAxes" THEN ls_id = 'y'
			END CHOOSE
		
		end if
		ls_axis += ls_id
		ls_axis += ":{"+is_PBCR
		
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").display"),"display","","",false)
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").weight"),"weight","","",false)
		ls_axis += of_get_property_code(ls_axis_type,"type","'","'",false)
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").position"),"position","'","'",false)
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").offset"),"offset","","",false)
		ls_axis += of_get_property_code(describe("axes("+string(ii)+").stacked"),"stacked","","",false)
		//--------------------------------------------------------------------------------------------------------------
		// Grid
		//--------------------------------------------------------------------------------------------------------------
		string ls_grid
		ls_grid = ""
		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_display"),"display","","",false)
		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_color"),"color","'","'",false)
		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_lineWidth"),"lineWidth","","",false)
		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_drawBorder"),"drawBorder","","",false)
		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_drawOnChartArea"),"drawOnChartArea","","",false)
		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_drawTicks"),"drawTicks","","",false)
		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_tickMarkLength"),"tickMarkLength","","",false)
//		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_zeroLineWidth"),"zeroLineWidth","","",false)
//		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_zeroLineColor"),"zeroLineColor","'","'",false)
//		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_zeroLineBorderDash"),"zeroLineBorderDash","","",false)
//		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_zeroLineBorderDashOffset"),"zeroLineBorderDashOffset","","",false)
		ls_grid+=of_get_property_code(describe("axes("+string(ii)+").gridline_offsetGridLines"),"offset","","",false)
		
			// grid.border
			string ls_border
			ls_border = ""
			ls_border+=of_get_property_code(describe("axes("+string(ii)+").gridline_borderDash"),"dash","","",false)
			ls_border+=of_get_property_code(describe("axes("+string(ii)+").gridline_borderDashOffset"),"dashOffset","","",false)
			IF ls_border <> "" THEN ls_border="border: {"+ls_border+"},//scales."+ls_id+".grid.border"+is_PBCR
			ls_grid += ls_border
		
		IF ls_grid <> "" THEN ls_grid="grid: {"+ls_grid+"},//scales."+ls_id+".grid.border"+is_PBCR
		ls_axis += ls_grid
		

		//title
		string ls_title
		ls_title = ""
		ls_title +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_display"),"display","","",false)			
		ls_title +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_labelString"),"text","'","'",false)		
		ls_title +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_lineHeight"),"lineHeight","'","'",false)		
		ls_title +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_fontColor"),"color","'","'",false)	
		IF of_get_property_code(describe("axes("+string(ii)+").scaletitle_fontColor"),"color","'","'",false)	="" then ls_title+=is_default_fontcolor
			//title.font
			string ls_title_font
			ls_title_font =""
			ls_title_font +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_fontFamily"),"family","'","'",false)		
			ls_title_font +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_fontSize"),"size","","",false)		
			ls_title_font +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_fontStyle"),"style","'","'",false)	
			IF ls_title_font <> "" THEN 
				ls_title_font="font: {"+ls_title_font+"},//scales."+ls_id+".title.font"+is_PBCR
			else
				ls_title_font = is_default_fonts + "//scales."+ls_id+".title.font"+is_PBCR
			END IF
			ls_title +=ls_title_font
			//title.padding
			string ls_title_padding
			ls_title_padding = ""
			ls_title_padding +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_padding_top"),"top","","",false)	
			ls_title_padding +=	of_get_property_code(describe("axes("+string(ii)+").scaletitle_padding_bottom"),"bottom","","",false)
			IF ls_title_padding <> "" THEN ls_title_padding="padding: {"+ls_title_padding+"},//scales."+ls_id+".title.padding"+is_PBCR
			ls_title += ls_title_padding
			
		IF ls_title <> "" THEN ls_title="title: {"+ls_title+"},//scales."+ls_id+".title"+is_PBCR
		
		ls_axis += ls_title

		string ls_add_to_axis
		ls_add_to_axis = ""

	//----------------------------------------------------------------------------------
	//ticks
	//----------------------------------------------------------------------------------
	string ls_ticks, ls_tick_color
	ls_tick_color=""
	ls_ticks =""
	ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_autoskip"),"autoSkip","","",false)
	ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_autoSkipPadding"),"autoSkipPadding","","",false)
	ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_labelOffset"),"labelOffset","","",false)
	ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_maxRotation"),"maxRotation","","",false)
	ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_minRotation"),"minRotation","","",false)
	ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_display"),"display","","",false)
	ls_tick_color += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_fontcolor"),"color","'","'",false)
	IF pos(ls_tick_color,'function') > 0 THEN ls_tick_color += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_fontcolor"),"color","","",false)
	IF of_get_property_code(describe("axes("+string(ii)+").tick_configuration_fontcolor"),"color","'","'",false)="" then ls_ticks+=is_default_fontcolor
	ls_ticks += ls_tick_color
	
		//ticks.font
		string ls_ticks_font
		ls_ticks_font =""
		ls_ticks_font += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_fontfamily"),"family","'","'",false)
		ls_ticks_font += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_fontsize"),"size","'","'",false)
		ls_ticks_font += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_fontstyle"),"style","'","'",false)


		IF ls_ticks_font <> "" THEN 
			ls_ticks_font="font: {"+ls_ticks_font+"},//scales."+ls_id+".ticks.font"+is_PBCR
		ELSE
			ls_ticks_font = is_default_fonts + "//scales."+ls_id+".ticks.font"+is_PBCR
		END  IF
		ls_ticks +=ls_ticks_font
		
		ls_add_to_axis+=  of_get_property_code(describe("axes("+string(ii)+").tick_configuration_reverse"),"reverse","","",false)
	
	string ls_mirror
	ls_mirror = of_get_property_code(describe("axes("+string(ii)+").tick_mirror"),"mirror","","",false)
	IF ls_mirror <> "" THEN ls_mirror += "z:1,"+is_PBCR
	ls_ticks += ls_mirror
	ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_padding"),"padding","","",false)



		CHOOSE CASE ls_axis_type
			CASE "category"
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").category_labels"),"callback","","",true)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").category_min"),"min","'","'",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").category_max"),"max","'","'",false)
			CASE "linear"
				//cartesian
				ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").linear_beginAtZero"),"beginAtZero","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_min"),"min","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_max"),"max","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_maxTicksLimit"),"maxTicksLimit","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_stepSize"),"stepSize","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_suggestedMax"),"suggestedMax","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").linear_suggestedMin"),"suggestedMin","","",false)		
				
				
				CHOOSE CASE ls_chart_type
					Case "radar","polarArea"
						//radial
						//angleline
						string ls_angleLines
						ls_angleLines = ""
						
						ls_angleLines+=of_get_property_code(describe("axes("+string(ii)+").radial_anglelines_display"),"display","","",false)
						ls_angleLines+=of_get_property_code(describe("axes("+string(ii)+").radial_anglelines_color"),"color","'","'",false)
						ls_angleLines+=of_get_property_code(describe("axes("+string(ii)+").radial_anglelines_lineWidth"),"lineWidth","","",false)
						IF ls_angleLines <> "" THEN ls_angleLines="angleLines: {"+ls_angleLines+"},//scales."+ls_id+".angleLines"+is_PBCR
						ls_add_to_axis+= ls_angleLines


						//pointLabels
						string ls_pointlabels
						ls_pointlabels = ""
						ls_pointlabels +=of_get_property_code(describe("axes("+string(ii)+").pointlabel_fontcolor"),"color","'","'",false)
						IF of_get_property_code(describe("axes("+string(ii)+").pointlabel_fontcolor"),"color","'","'",false)="" then ls_pointlabels+=is_default_fontcolor
							//pointLabels.font
							string ls_pointlabels_font
							ls_pointlabels_font +=of_get_property_code(describe("axes("+string(ii)+").pointlabel_fontFamily"),"family","'","'",false)
							ls_pointlabels_font +=of_get_property_code(describe("axes("+string(ii)+").pointlabel_fontSize"),"size","","",false)
							ls_pointlabels_font +=of_get_property_code(describe("axes("+string(ii)+").pointlabel_fontStyle"),"style","'","'",false)
							IF ls_pointlabels_font <> "" THEN 
								ls_pointlabels_font="font: {"+ls_pointlabels_font+"},//scales."+ls_id+".pointLabels.font"+is_PBCR
							ELSE
								ls_pointlabels_font = is_default_fonts + "//scales."+ls_id+".pointLabels.font"+is_PBCR
							END IF
							ls_pointlabels += ls_pointlabels_font
							
						IF ls_pointlabels <> "" THEN ls_pointlabels="pointLabels: {"+ls_pointlabels+"},//scales."+ls_id+".pointLabels"+is_PBCR
						ls_add_to_axis+= ls_pointlabels
				
						
						//ticks
						ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_backdropColor"),"backdropColor","'","'",false)	
						//ticks.backdropPadding
							string ls_ticks_backdropPadding
							ls_ticks_backdropPadding += of_get_property_code(describe("axes("+string(ii)+").radial_tick_backdropPaddingX"),"X","","",false)		
							ls_ticks_backdropPadding += of_get_property_code(describe("axes("+string(ii)+").radial_tick_backdropPaddingY"),"Y","","",false)		
							IF ls_ticks_backdropPadding <> "" THEN ls_ticks_backdropPadding="backdropPadding: {"+ls_ticks_backdropPadding+"},//scales."+ls_id+".ticks.packdropPadding"+is_PBCR
							ls_ticks+= ls_ticks_backdropPadding
							
						ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").radial_tick_beginAtZero"),"beginAtZero","","",false)		
						ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").radial_tick_min"),"min","","",false)		
						ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").radial_tick_max"),"max","","",false)		
						ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").radial_tick_maxTicksLimit"),"maxTicksLimit","","",false)		
						ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").radial_tick_stepSize"),"stepSize","","",false)		
						ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").radial_tick_suggestedMax"),"suggestedMax","","",false)		
						ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").radial_tick_suggestedMin"),"suggestedMin","","",false)		
						ls_ticks += of_get_property_code(describe("axes("+string(ii)+").radial_tick_showLabelBackdrop"),"showLabelBackdrop","","",false)		
				END CHOOSE
				
			CASE "logarithmic"
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").log_min"),"min","","",false)
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").log_max"),"max","","",false)
				
				
			CASE "time"
				string ls_scale_type
				ls_scale_type = ""
				ls_scale_type += describe("axes("+string(ii)+").time_distribution")
				IF ls_scale_type <> "" THEN
					ls_scale_type= "type: 'timeseries', "+is_PBCR
				ELSE
					ls_scale_type= "type: 'time', "+is_PBCR
				END IF
				
				string ls_time
				
				
				ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").time_bounds"),"bounds","'","'",false)
				
				ls_ticks += of_get_property_code(describe("axes("+string(ii)+").time_source"),"source","","",false)	
				
				string ls_display_format,ls_format
				string ls_unit
				ls_display_format = ""
				ls_format = ""
				ls_format= of_get_property_code(describe("axes("+string(ii)+").time_df_millisecond"),"millisecond","'","'",false)
				IF ls_format <> "" THEN ls_unit = "millisecond"
				ls_format= of_get_property_code(describe("axes("+string(ii)+").time_df_second"),"second","'","'",false)
				IF ls_format <> "" THEN ls_unit = "second"
				ls_format= of_get_property_code(describe("axes("+string(ii)+").time_df_minute"),"minute","'","'",false)
				IF ls_format <> "" THEN ls_unit = "minute"
				ls_format= of_get_property_code(describe("axes("+string(ii)+").time_df_hour"),"hour","'","'",false)
				IF ls_format <> "" THEN ls_unit = "hour"
				ls_format= of_get_property_code(describe("axes("+string(ii)+").time_df_day"),"day","'","'",false)
				IF ls_format <> "" THEN ls_unit = "day"
				ls_format= of_get_property_code(describe("axes("+string(ii)+").time_df_week"),"week","'","'",false)
				IF ls_format <> "" THEN ls_unit = "week"
				ls_format= of_get_property_code(describe("axes("+string(ii)+").time_df_month"),"month","'","'",false)
				IF ls_format <> "" THEN ls_unit = "month"
				ls_format= of_get_property_code(describe("axes("+string(ii)+").time_df_quarter"),"quarter","'","'",false)
				IF ls_format <> "" THEN ls_unit = "quarter"
				ls_format= of_get_property_code(describe("axes("+string(ii)+").time_df_year"),"year","'","'",false)
				IF ls_format <> "" THEN ls_unit = "year"
				
				
				
				IF ls_format <> "" THEN
					ls_display_format="displayFormats: {"+ls_display_format+"},//scales."+ls_id+".time.displayFormats"+is_PBCR
					ls_time+="unit:"+ls_unit+","+is_PBCR
					ls_time+=ls_display_format
				END IF
				
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_isoWeekday"),"isoWeekday","","",false)
				ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").time_max"),"max","","",false)
				ls_add_to_axis += of_get_property_code(describe("axes("+string(ii)+").time_min"),"min","","",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_parser"),"parser","","",false)
				//ls_time += of_get_property_code(describe("axes("+string(ii)+").time_round"),"round","'","'",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_tooltipFormat"),"tooltipFormat","'","'",false)
				IF ls_unit <> '' THEN ls_time += of_get_property_code(describe("axes("+string(ii)+").time_unit"),"unit","","",false)
				ls_time += of_get_property_code(describe("axes("+string(ii)+").time_stepSize"),"stepSize","'","'",false)
				//ls_time += of_get_property_code(describe("axes("+string(ii)+").time_minUnit"),"minUnit","'","'",false)
				IF ls_time <> "" THEN ls_time="time: {"+ls_time+"},//scales."+ls_id+".time"+is_PBCR
				
				ls_axis+= ls_time
		
		END CHOOSE
		
		
		
		//chart.js 4.5.1 now uses the tick font configuration for minor ticks
//		string ls_minor_ticks
//		ls_minor_ticks = ""
//		IF s_ticks_font <> "" THEN
//			string ls_minor_ticks_font
//			ls_minor_ticks_font = ""
//			ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontcolor"),"color","'","'",false)
//			ls_minor_ticks_font += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontfamily"),"fontFamily","'","'",false)
//			ls_minor_ticks_font += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontsize"),"fontSize","","",false)
//			ls_minor_ticks_font += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontstyle"),"fontStyle","'","'",false)
//			IF ls_minor_ticks_font <> "" THEN ls_minor_ticks_font="font: {"+ls_minor_ticks_font+"},//scales."+ls_id+".ticks.font"+is_PBCR
//			ls_ticks +=ls_ticks_font
//		END IF
		
		
		// ticks.major
		string  ls_major_color,ls_minor_color
		ls_major_color = ""
		ls_minor_color = ""
		
		ls_major_color = describe("axes("+string(ii)+").tick_configuration_major_fontcolor")
		ls_minor_color = describe("axes("+string(ii)+").tick_configuration_minor_fontcolor")
		
		IF ls_major_color <> "" THEN 
			ls_ticks+= "major:{enabled:true, "+"},//scales."+ls_id+".ticks.major"+is_PBCR
			ls_major_color = "color: (context) => {  return (context.tick && context.tick.major) ? '"+ls_major_color+"' : '"+ls_minor_color+"'; },"+"//scales."+ls_id+".ticks.major.font"+is_PBCR
			ls_ticks += ls_major_color
			
			ls_ticks+= "font: (context) => {"+is_PBCR
          	ls_ticks+= "if (context.tick && context.tick.major) {"+is_PBCR
          	ls_ticks+=  " return {"+is_PBCR
          	ls_ticks+= of_get_property_code(describe("axes("+string(ii)+").tick_configuration_major_fontfamily"),"family","'","'",false)
          	ls_ticks+= of_get_property_code(describe("axes("+string(ii)+").tick_configuration_major_fontsize"),"size","'","'",false)
			ls_ticks+= of_get_property_code(describe("axes("+string(ii)+").tick_configuration_major_fontstyle"),"style","'","'",false)
          	ls_ticks+= "  };"+is_PBCR
         	ls_ticks+= " }"+is_PBCR
         	ls_ticks+=  "return {"+is_PBCR
        		ls_ticks+=  of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontfamily"),"family","'","'",false)
            	ls_ticks+= of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontsize"),"size","","",false)
			ls_ticks+=  of_get_property_code(describe("axes("+string(ii)+").tick_configuration_minor_fontstyle"),"style","'","'",false)
         	ls_ticks+= " };"+is_PBCR
      		ls_ticks+= "},//scales."+ls_id+".ticks.font"+is_PBCR
		END IF
		
		ls_ticks += of_get_property_code(describe("axes("+string(ii)+").tick_configuration_callback"),"callback","","",false)

		IF ls_ticks <> "" THEN ls_ticks="ticks: {"+ls_ticks+"},//scales."+ls_id+".ticks"+is_PBCR
		ls_axis+= ls_ticks  
		
		
		
		ls_axis+= ls_add_to_axis  

	END IF
	
	
	IF ls_axis <> "" THEN
		ls_scales+= ls_axis+"},//scales."+ls_id+is_PBCR
	END IF
NEXT


IF ls_scales<> "" THEN ls_scales="scales:{"+is_PBCR+ls_scales+is_PBCR+"},//scales"+is_PBCR
return ls_scales
end function

public function integer of_add_to_section (ref string as_source_code, string as_section_name, string as_code);// -----------------------------------------------------------------------------
// SCRIPT:     of_add_to_section
//
// PURPOSE:    Adds javascript attributes to a section of the generated javascript source code
//
// ARGUMENTS: ref as_source_code : the generated javascript code passed as an argument to the javascript_preview event of the chart datawindow
//					as_section_name : name of the section as it appears as a comment after the closing of the section in the generated source code
//					example : to add paramaters to the font definition of the x scale that is closed by "//scales.x.title.font", pass scales.x.title.font as the section name
//					as_code : parameters you want to add to the section : example: family: 'Arial',
//					Note, if the section has no parameter define the the Powerchart datawindow description, it will not generate the section. Check on the javascript_preview event
//					that the section is generated before using this function
// RETURN:		1 ok, 0 not found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2026	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_pos_end_section
string ls_return
ll_pos_end_section = pos(as_source_code,"},//"+as_section_name)
IF ll_pos_end_section = 0 THEN return 0

ls_return = mid(as_source_code, 1,ll_pos_end_section -1)+is_pbcr+as_code+is_pbcr+mid(as_source_code, ll_pos_end_section)

as_source_code = ls_return


return 1
end function

public function integer of_replace_section (ref string as_source_code, string as_section_name, string as_code);// -----------------------------------------------------------------------------
// SCRIPT:     of_replace_section
//
// PURPOSE:    Raplaces a javascript  section in the generated javascript source code
//
// ARGUMENTS: ref as_source_code : the generated javascript code passed as an argument to the javascript_preview event of the chart datawindow
//					as_section_name : name of the section as it appears as a comment after the closing of the section in the generated source code
//					example : to replace the font definition of the x scale that is closed by "//scales.x.title.font", pass scales.x.title.font as the section name
//					as_code : full section code you want to replace in the section : example: family: 'Arial',
//					Note, if the section has no parameter define the the Powerchart datawindow description, it will not generate the section. Check on the javascript_preview event
//					that the section is generated before using this function
// RETURN:		1 ok, 0 not found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2026	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ll_pos_end_section, ll_pos_start_section,ll_pos_start
string ls_return, ls_section_start_name

ls_section_start_name = of_get_last_section_name(as_section_name)
ll_pos_end_section = pos(as_source_code, "},//"+as_section_name)
IF ll_pos_end_section=0 THEN return 0
ll_pos_start = pos(as_source_code, ls_section_start_name+":")
IF ll_pos_start=0 THEN return 0
//gets the last starting section encountered before the ending comments
DO WHILE ll_pos_start > 0 and ll_pos_start < ll_pos_end_section
	ll_pos_start_section = ll_pos_start
	ll_pos_start = pos(as_source_code, ls_section_start_name+":",ll_pos_start+1)
LOOP

ls_return = mid(as_source_code,1,ll_pos_start_section -1)+as_code+mid(as_source_code,ll_pos_end_section +len("},//") + len(as_section_name))
as_source_code = ls_return

return 1
end function

public function string of_get_last_section_name (string as_full_section_name);//returns the section name from a full section name
//example ; "title.font" will return font
long ll_pos
string ls_return
ls_return = as_full_section_name
ll_pos = pos(as_full_section_name,".",ll_pos+1)
DO WHILE ll_pos>0
	ls_return = mid(as_full_section_name,ll_pos+1)
	ll_pos = pos(as_full_section_name,".",ll_pos+1)
LOOP
return ls_return
end function

public function integer of_replace_tagged_text (ref string as_source, string as_opening_tag, string as_ending_tag, string as_code);// -----------------------------------------------------------------------------
// SCRIPT:     of_replace_tagged_text
//
// PURPOSE:    Raplaces text enclosed into 2 tags
//
// ARGUMENTS: ref as_source : source text
//					as_opening_tag : opening tag : --< for example when in sql code
//					as_ending_tag: closing tag : --> for example when in sql code
//					as_code : code that will replace the tagged enclosed  text
// RETURN:		1 ok, 0 not found
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2026	FFasolin	Initial Coding
// ------------------------------------------------------------------------------

long ll_pos_opening_tag, ll_pos_closing_tag, ll_pos_opening_tag_size
string ls_return


ll_pos_opening_tag = pos(as_source,as_opening_tag)
IF ll_pos_opening_tag=0 THEN return -1
ll_pos_closing_tag = pos(as_source,as_ending_tag, ll_pos_opening_tag+1 )
IF ll_pos_closing_tag<=ll_pos_opening_tag THEN return -1
ll_pos_opening_tag_size  = len(as_opening_tag)
ls_return = mid(as_source,1,ll_pos_opening_tag +ll_pos_opening_tag_size -1 )+"~r~n"+as_code+"~r~n"+mid(as_source,ll_pos_closing_tag)

as_source = ls_return

return 1
end function

on n_cst_pbwc_graph_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pbwc_graph_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;ids_source_code_container  = CREATE n_cst_pbwc_datastore 
ids_graph_configuration_properties = CREATE n_cst_pbwc_datastore 
ids_charts_properties = CREATE n_cst_pbwc_datastore 
ids_datasets_properties  = CREATE n_cst_pbwc_datastore 
ids_chart_config_options  = CREATE n_cst_pbwc_datastore 
ids_chart_axes  = CREATE n_cst_pbwc_datastore 

ids_datasource_labels  = CREATE n_cst_pbwc_datastore 
ids_datasource_datasets  = CREATE n_cst_pbwc_datastore 

ids_source_code_container.dataobject = "d_pbwc_source_container"

ids_graph_configuration_properties.dataobject = "d_pbwc_graph_configuration"
ids_charts_properties.dataobject = "d_pbwc_charts_properties"
ids_datasets_properties.dataobject = "d_pbwc_datasets_properties"
ids_chart_config_options.dataobject = "d_pbwc_options"
ids_chart_axes.dataobject = "d_pbwc_axes_properties"

ids_datasource_labels.dataobject = "d_pbwc_label_list"
ids_datasource_datasets.dataobject = "d_pbwc_dataset_list"

//sets chart.js source code url file path
is_chartjs_path =  of_get_temp_folder ( )+"\"
is_chartjs_path = of_get_url_from_file(is_chartjs_path)

ids_print  = CREATE n_cst_pbwc_datastore 
ids_print.dataobject = "d_pbwc_print_bitmap"
ids_print.insertrow(0)




end event

event destructor;// -----------------------------------------------------------------------------
// SCRIPT:   detructor
//
// PURPOSE:    Deletes all temporary files generated for printing
//
// ARGUMENTS: 
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
long ii, i_size
i_size = upperbound(is_print_bitmap_file_name)
FOR ii = 1 To i_size
	filedelete(is_print_bitmap_file_name[ii])
NEXT
end event

