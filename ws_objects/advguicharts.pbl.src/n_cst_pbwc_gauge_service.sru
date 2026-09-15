$PBExportHeader$n_cst_pbwc_gauge_service.sru
forward
global type n_cst_pbwc_gauge_service from nonvisualobject
end type
end forward

global type n_cst_pbwc_gauge_service from nonvisualobject autoinstantiate
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
oleobject ioo //link to activeX object that displays the graph
webbrowser iwb
string is_cr = "\n" //javascript carriage return
string is_pbcr = "~r~n" //powerbuilder carriage return
string is_gaugejs_path
n_cst_pbwc_string inv_string
// Base64, without headers
CONSTANT Ulong CRYPT_STRING_BASE64 = 1

string is_print_bitmap_file_name[]
long il_printing_id

string is_last_command
uov_gauge_js iuo_gauge//pointer to registered control

boolean ib_use_webview_control
end variables

forward prototypes
public subroutine of_init_document ()
public function string of_get_temp_folder ()
public function string of_get_empty_gauge_html ()
public function string of_get_url_from_file (string as_filename)
public subroutine of_register_ole_object (oleobject aoo)
public function integer of_register_gauge_control (uov_gauge_js auo_gauge)
public function integer of_create_gauge ()
public subroutine of_init_gauge ()
public function integer of_refresh_gauge ()
public subroutine of_init_donut ()
public subroutine of_init_zones ()
public subroutine of_init_new ()
public function string of_get_gauge_opt (boolean ab_init)
public function string of_dec_to_string (decimal adc)
public function string of_get_text_options ()
public subroutine of_reset_static_zones ()
public function string of_get_zone_opt (boolean ab_init)
public function string of_get_new_opt (boolean ab_init)
public function string of_get_donut_opt (boolean ab_init)
public function integer of_saveas_html (string as_filename)
public subroutine of_register_wb_object (webbrowser awb)
end prototypes

public subroutine of_init_document ();// -----------------------------------------------------------------------------
// SCRIPT:    of_init_document
//
// PURPOSE:    creates a pbwc_gauge.htm File in the temp directory 
//					and navigates to it, to initialise the document object 
//					in the javascript code
//
// ARGUMENTS: 
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2019	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_tempdir,ls_html
integer li_FileNum 
ls_tempdir =  of_get_temp_folder ( )
IF fileexists(ls_tempdir+"\pbwc_gauge.htm") = FALSE or FileLength(ls_tempdir+"\pbwc_gauge.htm") <>1166  THEN  
	li_FileNum = FileOpen(ls_tempdir+"\pbwc_gauge.htm",  LineMode!, Write!, LockWrite!, replace!)
	//'	 <script src="'+is_gaugejs_path+'gauge.js"></script>'+is_pbcr+&
	ls_html = &
'<!doctype html>'+is_pbcr+&
'  <html>'+is_pbcr+&
'    <head>'+is_pbcr+&
'      <meta charset="utf-8">'+is_pbcr+&
'      <title>PB gauge.js</title>'  +is_pbcr+&   
'    </head>'+is_pbcr+&
'    <body  oncontextmenu="return false;"  style="margin: 0;padding:0">'+is_pbcr+&
'	 <script src="gauge.js"></script>'+is_pbcr+&
'     <script language="JavaScript"> document.addEventListener("contextmenu", function(e){ e.preventDefault(); }, false); </script>'+is_pbcr+&
'     <script language="JavaScript"> document.body.addEventListener("keydown", function(event) {  if (event.ctrlKey && "cvxspwuaz".indexOf(event.key) !== -1) {    event.preventDefault()  }});</script>'+is_pbcr+&
'     <script language="JavaScript"> document.body.addEventListener("keydown", function(event) {  if (event.ctrlKey && "cvxspwuaz".indexOf(event.key) !== -1) {    event.preventDefault()  }});</script>'+is_pbcr+&
'     <script language="JavaScript"> document.onkeydown = function(e) {  if (e.keyCode === 116) { return false; } if (e.keyCode === 8) { return false; } };</script>'+is_pbcr+&
'      <div style="width: 100%; height: 100%">'+is_pbcr+&
'       <canvas id="myGauge"></canvas>'+is_pbcr+&
'       <div id="value-textfield" ></div>'+is_pbcr+&
'       <div id="unit-textfield" ></div>'+is_pbcr+&
'      <div id="title-textfield"></div>'+is_pbcr+&
'      </div>	'+is_pbcr+&
'	</body>'+is_pbcr+&
'</html>'

	FileWrite(li_FileNum, ls_html)
	fileclose(li_FileNum)
END IF

IF ib_use_webview_control THEN
	iwb.navigate(ls_tempdir+"\pbwc_gauge.htm")
ELSE
	ioo.navigate(ls_tempdir+"\pbwc_gauge.htm")
END IF


end subroutine

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

public function string of_get_empty_gauge_html ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_empty_gauge_html
//
// PURPOSE:    Returns the html code to initialise the gauge.js
//					canvas and to include references to all the gauge js 
//					source files.
//
// ARGUMENTS: 
//
// RETURN:		String - HTML code to initialise the document object
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2019	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return
ls_return = &
'      <script src="'+is_gaugejs_path+'gauge.js"></script>'+is_cr+&
''+is_cr+&
'      <div style="width:100%; height: 100%">'+is_cr+&
'        <canvas id="myGauge"></canvas>'+is_cr+&
'      </div>'

return ls_return
end function

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

public subroutine of_register_ole_object (oleobject aoo);// -----------------------------------------------------------------------------
// SCRIPT:     of_register_ole_object
//
// PURPOSE:    Used to register ole internal object that will display the gauge
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

public function integer of_register_gauge_control (uov_gauge_js auo_gauge);// -----------------------------------------------------------------------------
// SCRIPT:     of_register_gauge_control
//
// PURPOSE:    Register the gauge control to the service
//
// ARGUMENTS: 
//
// RETURN:		1
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// -----------------------------------------------------------------------------
iuo_gauge = auo_gauge
ib_use_webview_control = iuo_gauge.ib_use_webview_control
return 1
end function

public function integer of_create_gauge ();// -----------------------------------------------------------------------------
// SCRIPT:     of_create_gauge
//
// PURPOSE:    Generates javascript to create a new gauge and sends it to the browser
//
// ARGUMENTS: 
//
// RETURN:		integer 1
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_command

CHOOSE CASE iuo_gauge.is_gauge_type
	CASE "gauge"
				ls_command += of_get_gauge_opt(true)
	CASE "zone"
		ls_command += of_get_zone_opt(true)
	CASE "donut"
		ls_command += of_get_donut_opt(true)
	CASE "new"
		ls_command += of_get_new_opt(true)
END CHOOSE


ls_command += "var target = document.getElementById('myGauge'); // your canvas element"+ is_pbcr


CHOOSE CASE iuo_gauge.is_gauge_type
	CASE "gauge", "zone","new"
		ls_command +='var gauge = new Gauge(target).setOptions(opts); // create  gauge!'+ is_pbcr
	CASE "donut"
		ls_command += ' var gauge = new Donut(target).setOptions(opts); // create  gauge!'+ is_pbcr
END CHOOSE


ls_command += "gauge.maxValue = "+string(iuo_gauge.maxValue)+"; // set max gauge value"+ is_pbcr
ls_command += "gauge.setMinValue("+string(iuo_gauge.minValue)+");  // set min value"+ is_pbcr
ls_command += ' gauge.animationSpeed ='+string(iuo_gauge.animationSpeed)+'; '+ is_pbcr
ls_command += ' gauge.set('+string(iuo_gauge.Value)+'); // set actual value'+ is_pbcr
ls_command += ' gauge.setTextField(document.getElementById("value-textfield"));'+ is_pbcr

ls_command +=of_get_text_options()

//gauge layout
ls_command +='   var main = document.getElementById("myGauge");'+ is_pbcr
ls_command +='        var render = main.getContext("2d");'+ is_pbcr
ls_command +='        main.style.left = "'+string(iuo_gauge.gauge_left)+'px";'+ is_pbcr
ls_command +='        main.style.top = "'+string(iuo_gauge.gauge_top)+'px";'+ is_pbcr
 ls_command +='       main.style.position = "absolute";'+ is_pbcr
 
 ls_command +=" document.body.style.background = '"+iuo_gauge.gauge_background_color+"';"+ is_pbcr
 ls_command +=" document.documentElement.style.overflow = 'hidden';" + is_pbcr   // firefox, chrome
 ls_command +='document.body.scroll = "no";'+ is_pbcr

is_last_command = ls_command


IF ib_use_webview_control = FALSE THEN
	ioo.document.ParentWindow.ExecScript(ls_command)
ELSE
	string ls_result, ls_error
	iwb.EvaluateJavascriptSync(ls_command, ls_Result, ls_Error)
//	iwb.EvaluateJavascriptaSync(ls_command)
END IF





return 1
end function

public subroutine of_init_gauge ();// -----------------------------------------------------------------------------
// SCRIPT:     of_init_gauge
//
// PURPOSE:    Initiliase data for gauge type gauge
//
// ARGUMENTS: 
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
of_reset_static_zones()
iuo_gauge.is_gauge_type ='gauge'
iuo_gauge.angle =19
iuo_gauge.lineWidth =47
iuo_gauge.pointer_Length =71
iuo_gauge.pointer_StrokeWidth =35
iuo_gauge.colorStart ='rgba(0,132,198,0.70)'
iuo_gauge.colorStop ='rgba(0,132,198,0.50)'
iuo_gauge.strokeColor ='rgba(0,15,31,0.15)'
iuo_gauge.color ='#000000'
iuo_gauge.generateGradient =false
iuo_gauge.staticLabels_Font ='10px sans-serif'
iuo_gauge.staticLabels_Labels ='[0,  3000]'
iuo_gauge.staticLabels_color ='#000000'
iuo_gauge.fractionDigit=0
iuo_gauge.maxValue =3000
iuo_gauge.minValue =0
iuo_gauge.animationSpeed =10
iuo_gauge.Value =2500
iuo_gauge.radiusScale =0
iuo_gauge.limitMax =false
iuo_gauge.limitMin =false
iuo_gauge.HighDpiSupport =false
iuo_gauge.lines =12
iuo_gauge.Labels =''
iuo_gauge.size=0
iuo_gauge.value_text_top =106
iuo_gauge.value_text_width =131
iuo_gauge.value_text_left =-43
iuo_gauge.value_text_align ='right'
iuo_gauge.value_text_font_family ='Segoe UI'
iuo_gauge.value_text_font_color ='Grey'
iuo_gauge.value_text_font_weight ='bold'
iuo_gauge.value_text_font_size='18px'
iuo_gauge.unit_text_top=112
iuo_gauge.unit_text_width=220
iuo_gauge.unit_text_left=-4
iuo_gauge.unit_text_align='center'
iuo_gauge.unit_text_font_size='10px'
iuo_gauge.unit_text_font_weight='bold'
iuo_gauge.unit_text_font_color='Grey'
iuo_gauge.unit_text_font_family='Segoe UI'
iuo_gauge.unit_text='Unit'
iuo_gauge.title_text_top=128
iuo_gauge.title_text_width=178
iuo_gauge.title_text_left=1
iuo_gauge.title_text_align='center'
iuo_gauge.title_text_font_size='22px'
iuo_gauge.title_text_font_weight='bold'
iuo_gauge.title_text_font_color='DarkGrey'
iuo_gauge.title_text_font_family='Segoe UI'
iuo_gauge.title_text='Title'
iuo_gauge.gauge_top=0
iuo_gauge.gauge_left=-26
iuo_gauge.gauge_height=117
iuo_gauge.gauge_background_color='White'
iuo_gauge.width=864
iuo_gauge.height=624

end subroutine

public function integer of_refresh_gauge ();// -----------------------------------------------------------------------------
// SCRIPT:     of_refresh_gauge
//
// PURPOSE:    Refreshes the gauge control display (call this after modifying attributes)
//
// ARGUMENTS: 
//
// RETURN:		1
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// -----------------------------------------------------------------------------
string ls_command

CHOOSE CASE iuo_gauge.is_gauge_type
	CASE "gauge"
				ls_command += of_get_gauge_opt(true)
	CASE "zone"
		ls_command += of_get_zone_opt(true)
	CASE "donut"
		ls_command += of_get_donut_opt(true)
	CASE "new"
		ls_command += of_get_new_opt(true)
END CHOOSE


ls_command += "gauge.maxValue = "+string(iuo_gauge.maxValue)+"; // set max gauge value"+ is_pbcr
ls_command += "gauge.setMinValue("+string(iuo_gauge.minValue)+");  // set min value"+ is_pbcr
ls_command += ' gauge.animationSpeed ='+string(iuo_gauge.animationSpeed)+'; '+ is_pbcr
ls_command += ' gauge.set('+string(iuo_gauge.Value)+'); // set actual value'+ is_pbcr


//value text
ls_command +=of_get_text_options()
ls_command +='gauge.setOptions(opts);'+ is_pbcr
 ls_command +=' gauge.ctx.clearRect(0, 0, gauge.ctx.canvas.width, gauge.ctx.canvas.height);'
ls_command +='gauge.render();'+ is_pbcr

//gauge layout
ls_command +='   var main = document.getElementById("myGauge");'+ is_pbcr
ls_command +='        var render = main.getContext("2d");'+ is_pbcr
ls_command +='        main.style.left = "'+string(iuo_gauge.gauge_left)+'px";'+ is_pbcr
ls_command +='        main.style.top = "'+string(iuo_gauge.gauge_top)+'px";'+ is_pbcr
ls_command +='       main.style.position = "absolute";'+ is_pbcr
ls_command +=" document.body.style.background = '"+iuo_gauge.gauge_background_color+"';"


IF ib_use_webview_control = FALSE THEN
	ioo.document.ParentWindow.ExecScript(ls_command)
ELSE
	string ls_result, ls_error
//	iwb.EvaluateJavascriptSync(ls_command, ls_Result, ls_Error)
	iwb.EvaluateJavascriptaSync(ls_command)
END IF

return 1
end function

public subroutine of_init_donut ();// -----------------------------------------------------------------------------
// SCRIPT:     of_init_donut
//
// PURPOSE:    Initiliase data for donut type gauge
//
// ARGUMENTS: 
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
of_reset_static_zones()
iuo_gauge.is_gauge_type ='donut'
iuo_gauge.angle =22
iuo_gauge.lineWidth =10
iuo_gauge.pointer_Length =90
iuo_gauge.pointer_StrokeWidth =35
iuo_gauge.colorStart ='#2DA3DC'
iuo_gauge.colorStop ='#C0C0DB'
iuo_gauge.strokeColor ='#EEEEEE'
iuo_gauge.color ='#000000'
iuo_gauge.generateGradient =false
iuo_gauge.staticLabels_Font ='10px sans-serif'
iuo_gauge.staticLabels_Labels ='[0,  100]'
iuo_gauge.staticLabels_color ='#000000'
iuo_gauge.fractionDigit=0
iuo_gauge.maxValue =100
iuo_gauge.minValue =0
iuo_gauge.animationSpeed =32
iuo_gauge.Value =60
iuo_gauge.radiusScale =0
iuo_gauge.limitMax =false
iuo_gauge.limitMin =false
iuo_gauge.HighDpiSupport =false
iuo_gauge.lines =12
iuo_gauge.Labels =''
iuo_gauge.size=0
iuo_gauge.value_text_top =34
iuo_gauge.value_text_width =150
iuo_gauge.value_text_left =7
iuo_gauge.value_text_align ='center'
iuo_gauge.value_text_font_family ='Segoe UI'
iuo_gauge.value_text_font_color ='LightGrey'
iuo_gauge.value_text_font_weight ='bold'
iuo_gauge.value_text_font_size='70px'
iuo_gauge.unit_text_top=120
iuo_gauge.unit_text_width=160
iuo_gauge.unit_text_left=0
iuo_gauge.unit_text_align='center'
iuo_gauge.unit_text_font_size='10px'
iuo_gauge.unit_text_font_weight='bold'
iuo_gauge.unit_text_font_color='Grey'
iuo_gauge.unit_text_font_family='Segoe UI'
iuo_gauge.unit_text='Unit'
iuo_gauge.title_text_top=133
iuo_gauge.title_text_width=160
iuo_gauge.title_text_left=1
iuo_gauge.title_text_align='center'
iuo_gauge.title_text_font_size='22px'
iuo_gauge.title_text_font_weight='bold'
iuo_gauge.title_text_font_color='DarkGrey'
iuo_gauge.title_text_font_family='Segoe UI'
iuo_gauge.title_text='Title'
iuo_gauge.gauge_top=10
iuo_gauge.gauge_left=-70
iuo_gauge.gauge_height=151
iuo_gauge.gauge_background_color='White'
iuo_gauge.width=754
iuo_gauge.height=648

end subroutine

public subroutine of_init_zones ();// -----------------------------------------------------------------------------
// SCRIPT:     of_init_zones
//
// PURPOSE:    Initiliase data for zones type gauge
//
// ARGUMENTS: 
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
of_reset_static_zones()
iuo_gauge.is_gauge_type ='zone'
iuo_gauge.angle =-25
iuo_gauge.lineWidth =20
iuo_gauge.pointer_Length =60
iuo_gauge.pointer_StrokeWidth =50
iuo_gauge.colorStart ='#2DA3DC'
iuo_gauge.colorStop ='#C0C0DB'
iuo_gauge.strokeColor ='#EEEEEE'
iuo_gauge.color ='#000000'
iuo_gauge.generateGradient =false
iuo_gauge.staticLabels_Font ='10px sans-serif'
iuo_gauge.staticLabels_Labels ='[200,  500,2100,2500,3000]'
iuo_gauge.staticLabels_color ='#000000'
iuo_gauge.fractionDigit=0
iuo_gauge.maxValue =3000
iuo_gauge.minValue =0
iuo_gauge.animationSpeed =32
iuo_gauge.Value =1500
iuo_gauge.radiusScale =90
iuo_gauge.limitMax =false
iuo_gauge.limitMin =false
iuo_gauge.HighDpiSupport =false
iuo_gauge.lines =12
iuo_gauge.Labels =''
iuo_gauge.size=0
iuo_gauge.StaticZonescolor[1]='#F03E3E'
iuo_gauge.StaticZonesMin[1]='4'
iuo_gauge.StaticZonesMax[1]='200'
iuo_gauge.StaticZonesHeight[1]=''
iuo_gauge.StaticZonescolor[2]='#FFDD00'
iuo_gauge.StaticZonesMin[2]='200'
iuo_gauge.StaticZonesMax[2]='500'
iuo_gauge.StaticZonesHeight[2]=''
iuo_gauge.StaticZonescolor[3]='#30B32D'
iuo_gauge.StaticZonesMin[3]='500'
iuo_gauge.StaticZonesMax[3]='2100'
iuo_gauge.StaticZonesHeight[3]=''
iuo_gauge.StaticZonescolor[4]='#FFDD00'
iuo_gauge.StaticZonesMin[4]='2100'
iuo_gauge.StaticZonesMax[4]='2500'
iuo_gauge.StaticZonesHeight[4]=''
iuo_gauge.StaticZonescolor[5]='#F03E3E'
iuo_gauge.StaticZonesMin[5]='2500'
iuo_gauge.StaticZonesMax[5]='3000'
iuo_gauge.StaticZonesHeight[5]=''
iuo_gauge.value_text_top =120
iuo_gauge.value_text_width =220
iuo_gauge.value_text_left =-24
iuo_gauge.value_text_align ='center'
iuo_gauge.value_text_font_family ='Segoe UI'
iuo_gauge.value_text_font_color ='Grey'
iuo_gauge.value_text_font_weight ='bold'
iuo_gauge.value_text_font_size='18px'
iuo_gauge.unit_text_top=140
iuo_gauge.unit_text_width=176
iuo_gauge.unit_text_left=0
iuo_gauge.unit_text_align='center'
iuo_gauge.unit_text_font_size='10px'
iuo_gauge.unit_text_font_weight='bold'
iuo_gauge.unit_text_font_color='Grey'
iuo_gauge.unit_text_font_family='Segoe UI'
iuo_gauge.unit_text='Unit'
iuo_gauge.title_text_top=154
iuo_gauge.title_text_width=168
iuo_gauge.title_text_left=1
iuo_gauge.title_text_align='center'
iuo_gauge.title_text_font_size='22px'
iuo_gauge.title_text_font_weight='bold'
iuo_gauge.title_text_font_color='DarkGrey'
iuo_gauge.title_text_font_family='Segoe UI'
iuo_gauge.title_text='Title'
iuo_gauge.gauge_top=0
iuo_gauge.gauge_left=-69
iuo_gauge.gauge_height=150
iuo_gauge.gauge_background_color='White'
iuo_gauge.width=782
iuo_gauge.height=716
end subroutine

public subroutine of_init_new ();// -----------------------------------------------------------------------------
// SCRIPT:     of_init_new
//
// PURPOSE:    Initiliase data for new type gauge
//
// ARGUMENTS: 
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
of_reset_static_zones()
iuo_gauge.is_gauge_type ='new'
iuo_gauge.angle =10
iuo_gauge.lineWidth =20
iuo_gauge.pointer_Length =60
iuo_gauge.pointer_StrokeWidth =50
iuo_gauge.colorStart ='#2DA3DC'
iuo_gauge.colorStop ='#C0C0DB'
iuo_gauge.strokeColor ='#EEEEEE'
iuo_gauge.color ='#000000'
iuo_gauge.generateGradient =false
iuo_gauge.staticLabels_Font ='10px sans-serif'
iuo_gauge.staticLabels_Labels ='[0,500,1000,1500,2000,2500,3000,3500]'
iuo_gauge.staticLabels_color ='#000000'
iuo_gauge.fractionDigit=0
iuo_gauge.maxValue =3500
iuo_gauge.minValue =0
iuo_gauge.animationSpeed =32
iuo_gauge.Value =2122
iuo_gauge.radiusScale =90
iuo_gauge.limitMax =false
iuo_gauge.limitMin =false
iuo_gauge.HighDpiSupport =false
iuo_gauge.lines =12
iuo_gauge.Labels =''
iuo_gauge.size=0
iuo_gauge.StaticZonescolor[1]='rgb(255,0,0)'
iuo_gauge.StaticZonesMin[1]='0'
iuo_gauge.StaticZonesMax[1]='500'
iuo_gauge.StaticZonesHeight[1]='1.2'
iuo_gauge.StaticZonescolor[2]='rgb(200,100,0)'
iuo_gauge.StaticZonesMin[2]='500'
iuo_gauge.StaticZonesMax[2]='1000'
iuo_gauge.StaticZonesHeight[2]='1.1'
iuo_gauge.StaticZonescolor[3]='rgb(150,150,0)'
iuo_gauge.StaticZonesMin[3]='1000'
iuo_gauge.StaticZonesMax[3]='1500'
iuo_gauge.StaticZonesHeight[3]='1'
iuo_gauge.StaticZonescolor[4]='rgb(100,200,0)'
iuo_gauge.StaticZonesMin[4]='1500'
iuo_gauge.StaticZonesMax[4]='2000'
iuo_gauge.StaticZonesHeight[4]='0.9'
iuo_gauge.StaticZonescolor[5]='rgb(0,255,0)'
iuo_gauge.StaticZonesMin[5]='2000'
iuo_gauge.StaticZonesMax[5]='2500'
iuo_gauge.StaticZonesHeight[5]='0.8'
iuo_gauge.StaticZonescolor[6]='rgb(80,255,80)'
iuo_gauge.StaticZonesMin[6]='2500'
iuo_gauge.StaticZonesMax[6]='3000'
iuo_gauge.StaticZonesHeight[6]='0.7'
iuo_gauge.StaticZonescolor[7]='rgb(130,130,130)'
iuo_gauge.StaticZonesMin[7]='3000'
iuo_gauge.StaticZonesMax[7]='3500'
iuo_gauge.StaticZonesHeight[7]='0.6'
iuo_gauge.value_text_top =101
iuo_gauge.value_text_width =70
iuo_gauge.value_text_left =0
iuo_gauge.value_text_align ='right'
iuo_gauge.value_text_font_family ='Segoe UI'
iuo_gauge.value_text_font_color ='Grey'
iuo_gauge.value_text_font_weight ='bold'
iuo_gauge.value_text_font_size='12px'
iuo_gauge.unit_text_top=103
iuo_gauge.unit_text_width=50
iuo_gauge.unit_text_left=72
iuo_gauge.unit_text_align='left'
iuo_gauge.unit_text_font_size='10px'
iuo_gauge.unit_text_font_weight='bold'
iuo_gauge.unit_text_font_color='Grey'
iuo_gauge.unit_text_font_family='Segoe UI'
iuo_gauge.unit_text='Unit'
iuo_gauge.title_text_top=118
iuo_gauge.title_text_width=150
iuo_gauge.title_text_left=1
iuo_gauge.title_text_align='center'
iuo_gauge.title_text_font_size='22px'
iuo_gauge.title_text_font_weight='bold'
iuo_gauge.title_text_font_color='DarkGrey'
iuo_gauge.title_text_font_family='Segoe UI'
iuo_gauge.title_text='Title'
iuo_gauge.gauge_top=0
iuo_gauge.gauge_left=-21
iuo_gauge.gauge_height=105
iuo_gauge.gauge_background_color='White'
iuo_gauge.width=795
iuo_gauge.height=580


end subroutine

public function string of_get_gauge_opt (boolean ab_init);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_gauge_opt
//
// PURPOSE:    generate command to set opts in javascript gauge type gauge object
//
// ARGUMENTS: ab_init 
//
// RETURN:		string
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_command

ls_command += "var opts = {" + is_pbcr
ls_command += "  angle:"+of_dec_to_string(iuo_gauge.angle/100)+", // The span of the gauge arc"+ is_pbcr
ls_command += "  lineWidth: "+of_dec_to_string(iuo_gauge.lineWidth/100)+", // The line thickness"+ is_pbcr
ls_command += "  pointer: {"+ is_pbcr
ls_command += "    length: "+of_dec_to_string(iuo_gauge.pointer_length/100)+", // Relative to gauge radius"+ is_pbcr
ls_command += "    strokeWidth:"+of_dec_to_string(iuo_gauge.pointer_StrokeWidth/1000)+", // The thickness"+ is_pbcr
ls_command += "    color: '"+iuo_gauge.color+"' // Fill color"+ is_pbcr
ls_command += "  },"+ is_pbcr
ls_command += "  colorStart: '"+iuo_gauge.colorStart+"',   // Colors"+ is_pbcr
ls_command += "  colorStop: '"+iuo_gauge.colorStop+"',    // just experiment with them"+ is_pbcr
ls_command += "  strokeColor: '"+iuo_gauge.strokeColor+"',   // to see which ones work best for you"+ is_pbcr
ls_command +="staticLabels: {"+ is_pbcr
ls_command +='  font: "'+iuo_gauge.staticLabels_Font+'",  // Specifies font'+ is_pbcr
ls_command +="  labels: "+iuo_gauge.staticLabels_Labels+",  // Print labels at these values"+ is_pbcr
ls_command +="  color: '"+iuo_gauge.staticLabels_color+"'," // Optional: Label text color'+ is_pbcr
ls_command +="  fractionDigits: "+of_dec_to_string(iuo_gauge.fractionDigit)+"  // Optional: Numerical precision. 0=round off."+ is_pbcr
ls_command +="},"+ is_pbcr
ls_command += "};"+ is_pbcr



ls_command +="myGauge.setAttribute('style', 'height:"+string(iuo_gauge.gauge_height)+"px');"+ is_pbcr


		
return ls_command
end function

public function string of_dec_to_string (decimal adc);// -----------------------------------------------------------------------------
// SCRIPT:     of_dec_to_string
//
// PURPOSE:    transform a dec into a string using forcing . as decimal separator
//					so that it is understandable as a value in javascript code
//
// ARGUMENTS: 
//
// RETURN:		string
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_return
int li_pos_coma
ls_return = string(adc)
IF pos(string(1.1),",") >0 THEN 
		li_pos_coma = pos(ls_return,",")
		IF li_pos_coma > 0 THEN ls_return = replace(ls_return,li_pos_coma,1,".")
END IF
return ls_return
end function

public function string of_get_text_options ();// -----------------------------------------------------------------------------
// SCRIPT:     of_get_text_options
//
// PURPOSE:    generate command to set text attributes in javascript 
//
// ARGUMENTS: 
//
// RETURN:		string
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------

string ls_command
//value text
ls_command +='document.getElementById("value-textfield").style["position"]="absolute";'+ is_pbcr
ls_command +='document.getElementById("value-textfield").style["top"]="'+string(iuo_gauge.value_text_top)+'px";'
ls_command +='document.getElementById("value-textfield").style["width"]="'+string(iuo_gauge.value_text_width) +'px";'+ is_pbcr
ls_command +='document.getElementById("value-textfield").style["left"]="'+string(iuo_gauge.value_text_left)+'px";'+ is_pbcr
ls_command +='document.getElementById("value-textfield").style["text-align"]="'+iuo_gauge.value_text_align+'";'+ is_pbcr
ls_command +='document.getElementById("value-textfield").style["font-size"]="'+iuo_gauge.value_text_font_size+'";'+ is_pbcr
ls_command +='document.getElementById("value-textfield").style["font-weight"]="'+iuo_gauge.value_text_font_weight+'";'+ is_pbcr
ls_command +='document.getElementById("value-textfield").style["color"]="'+iuo_gauge.value_text_font_color+'";'+ is_pbcr
ls_command +='document.getElementById("value-textfield").style["font-family"]="'+iuo_gauge.value_text_font_family+'";'+ is_pbcr
//unit text
ls_command +='document.getElementById("unit-textfield").style["position"]="absolute";'+ is_pbcr
ls_command +='document.getElementById("unit-textfield").style["top"]="'+string(iuo_gauge.unit_text_top)+'px";'
ls_command +='document.getElementById("unit-textfield").style["width"]="'+string(iuo_gauge.unit_text_width) +'px";'+ is_pbcr
ls_command +='document.getElementById("unit-textfield").style["left"]="'+string(iuo_gauge.unit_text_left)+'px";'+ is_pbcr
ls_command +='document.getElementById("unit-textfield").style["text-align"]="'+iuo_gauge.unit_text_align+'";'+ is_pbcr
ls_command +='document.getElementById("unit-textfield").style["font-size"]="'+iuo_gauge.unit_text_font_size+'";'+ is_pbcr
ls_command +='document.getElementById("unit-textfield").style["font-weight"]="'+iuo_gauge.unit_text_font_weight+'";'+ is_pbcr
ls_command +='document.getElementById("unit-textfield").style["color"]="'+iuo_gauge.unit_text_font_color+'";'+ is_pbcr
ls_command +='document.getElementById("unit-textfield").style["font-family"]="'+iuo_gauge.unit_text_font_family+'";'+ is_pbcr
ls_command +='document.getElementById("unit-textfield").textContent="'+string(iuo_gauge.unit_text)+'";'+ is_pbcr
//title text
ls_command +='document.getElementById("title-textfield").style["position"]="absolute";'+ is_pbcr
ls_command +='document.getElementById("title-textfield").style["top"]="'+string(iuo_gauge.title_text_top)+'px";'
ls_command +='document.getElementById("title-textfield").style["width"]="'+string(iuo_gauge.title_text_width) +'px";'+ is_pbcr
ls_command +='document.getElementById("title-textfield").style["left"]="'+string(iuo_gauge.title_text_left)+'px";'+ is_pbcr
ls_command +='document.getElementById("title-textfield").style["text-align"]="'+iuo_gauge.title_text_align+'";'+ is_pbcr
ls_command +='document.getElementById("title-textfield").style["font-size"]="'+iuo_gauge.title_text_font_size+'";'+ is_pbcr
ls_command +='document.getElementById("title-textfield").style["font-weight"]="'+iuo_gauge.title_text_font_weight+'";'+ is_pbcr
ls_command +='document.getElementById("title-textfield").style["color"]="'+iuo_gauge.title_text_font_color+'";'+ is_pbcr
ls_command +='document.getElementById("title-textfield").style["font-family"]="'+iuo_gauge.title_text_font_family+'";'+ is_pbcr
ls_command +='document.getElementById("title-textfield").textContent="'+iuo_gauge.title_text+'";'+ is_pbcr

return ls_command
end function

public subroutine of_reset_static_zones ();// -----------------------------------------------------------------------------
// SCRIPT:     of_reset_static_zones
//
// PURPOSE:   Reset static zone arrays in gauge control
//
// ARGUMENTS: 
//
// RETURN:		
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// -----------------------------------------------------------------------------
String lStaticZonescolor[]
String lStaticZonesmin[]
String lStaticZonesmax[]
String lStaticZonesHeight[]

iuo_gauge.StaticZonescolor=lStaticZonescolor
iuo_gauge.StaticZonesmin=lStaticZonesmin
iuo_gauge.StaticZonesmax=lStaticZonesmax
iuo_gauge.StaticZonesHeight=lStaticZonesHeight
end subroutine

public function string of_get_zone_opt (boolean ab_init);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_zone_opt
//
// PURPOSE:    generate command to set opts in javascript zone type gauge object
//
// ARGUMENTS: 
//
// RETURN:		string
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_command

ls_command += '    var opts = {'+ is_pbcr
ls_command += "      angle: "+of_dec_to_string(iuo_gauge.angle/100)+","+ is_pbcr
ls_command += "      lineWidth: "+of_dec_to_string(iuo_gauge.lineWidth/100)+", "+ is_pbcr
ls_command += "      radiusScale:"+of_dec_to_string(iuo_gauge.radiusScale/100)+","+ is_pbcr
ls_command += "  pointer: {"+ is_pbcr
ls_command += "    length: "+of_dec_to_string(iuo_gauge.pointer_length/100)+", "+ is_pbcr
ls_command += "    strokeWidth:"+of_dec_to_string(iuo_gauge.pointer_StrokeWidth/1000)+", "+ is_pbcr
ls_command += "    color: '"+iuo_gauge.color+"' // Fill color"+ is_pbcr
ls_command += '  },'
IF ab_init THEN
	ls_command +="staticLabels: {"+ is_pbcr
	ls_command +=' font: "'+iuo_gauge.staticLabels_Font+'",  // Specifies font'+ is_pbcr
	ls_command +="  labels: "+iuo_gauge.staticLabels_Labels+",  // Print labels at these values"+ is_pbcr
	ls_command +="  color:'"+iuo_gauge.staticLabels_color+"',  // Optional: Label text color"+ is_pbcr
	ls_command +="  fractionDigits: "+of_dec_to_string(iuo_gauge.fractionDigit)+"   // Optional: Numerical precision. 0=round off."+ is_pbcr
	ls_command +="},"+ is_pbcr
	ls_command += '      staticZones: [ '+ is_pbcr
	int ii
	for ii=1 to upperbound(iuo_gauge.StaticZonescolor)
		ls_command += '         {strokeStyle: "'+iuo_gauge.StaticZonescolor[ii]+'", min: '+iuo_gauge.StaticZonesMin[ii]+', max: '+iuo_gauge.StaticZonesMax[ii]+'},'+ is_pbcr
	NEXT
	ls_command += '      ], '+ is_pbcr
END IF
ls_command += "   limitMax: '"+string(iuo_gauge.limitmax)+"',"+ is_pbcr
ls_command += "   limitMax: '"+string(iuo_gauge.limitmin)+"',"+ is_pbcr
ls_command += '      highDpiSupport: true '+ is_pbcr
ls_command += '    }; '+ is_pbcr
ls_command +="myGauge.setAttribute('style', 'height:"+string(iuo_gauge.gauge_height)+"px');"+ is_pbcr

return ls_command
end function

public function string of_get_new_opt (boolean ab_init);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_new_opt
//
// PURPOSE:    generate command to set opts in javascript new type gauge object
//
// ARGUMENTS: 
//
// RETURN:		string
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_command

ls_command += '    var bigFont = "14px sans-serif";'+ is_pbcr
ls_command += '      var opts = { '+ is_pbcr
ls_command += "  angle: "+of_dec_to_string(iuo_gauge.angle/100)+", "+ is_pbcr
ls_command += "      radiusScale:"+of_dec_to_string(iuo_gauge.radiusScale/100)+","+ is_pbcr
ls_command += "      lineWidth: "+of_dec_to_string(iuo_gauge.lineWidth/100)+", "+ is_pbcr
ls_command += "  pointer: {"+ is_pbcr
ls_command += "    length: "+of_dec_to_string(iuo_gauge.pointer_length/100)+", "+ is_pbcr
ls_command += "    strokeWidth:"+of_dec_to_string(iuo_gauge.pointer_StrokeWidth/1000)+", "+ is_pbcr
ls_command += "    color: '"+iuo_gauge.color+"' // Fill color"+ is_pbcr
ls_command += '  },'
IF ab_init THEN
	ls_command +="staticLabels: {"+ is_pbcr
	ls_command +=' font: "'+iuo_gauge.staticLabels_Font+'",  // Specifies font'+ is_pbcr
	ls_command +=" labels: "+iuo_gauge.staticLabels_Labels+",  // Print labels at these values"+ is_pbcr
	ls_command +="  color:'"+iuo_gauge.staticLabels_color+"',  // Optional: Label text color"+ is_pbcr
	ls_command +="  fractionDigits: "+of_dec_to_string(iuo_gauge.fractionDigit)+"   // Optional: Numerical precision. 0=round off."+ is_pbcr
	ls_command +="},"+ is_pbcr
	ls_command += '      staticZones: [ '+ is_pbcr
	int ii
	for ii=1 to upperbound(iuo_gauge.StaticZonescolor)
		ls_command += '         {strokeStyle: "'+iuo_gauge.StaticZonescolor[ii]+'", min: '+iuo_gauge.StaticZonesMin[ii]+', max: '+iuo_gauge.StaticZonesMax[ii]+', height: '+iuo_gauge.StaticZonesheight[ii]+'},'+ is_pbcr
	NEXT
	ls_command += '      ], '+ is_pbcr
END IF
ls_command += "   limitMax: '"+string(iuo_gauge.limitmax)+"',"+ is_pbcr
ls_command += "   limitMax: '"+string(iuo_gauge.limitmin)+"',"+ is_pbcr
ls_command += '      highDpiSupport: true '+ is_pbcr
ls_command += '    }; '+ is_pbcr

ls_command +="myGauge.setAttribute('style', 'height:"+string(iuo_gauge.gauge_height)+"px');"+ is_pbcr



return ls_command
end function

public function string of_get_donut_opt (boolean ab_init);// -----------------------------------------------------------------------------
// SCRIPT:     of_get_donut_opt
//
// PURPOSE:    generate command to set opts in javascript donut type gauge object
//
// ARGUMENTS: 
//
// RETURN:		string
//
// DATE        PROG/ID		DESCRIPTION OF CHANGE / REASON
// ----------  --------		-----------------------------------------------------
// 01/01/2018	FFasolin	Initial Coding
// ------------------------------------------------------------------------------
string ls_command

ls_command += 'var opts = {'+ is_pbcr
ls_command += "  lines: "+ of_dec_to_string(iuo_gauge.lines/100)+", "+ is_pbcr
ls_command += "  angle: "+of_dec_to_string(iuo_gauge.angle/100)+", "+ is_pbcr
ls_command += "  lineWidth: "+of_dec_to_string(iuo_gauge.lineWidth/100)+", "+ is_pbcr
ls_command += "   limitMax: '"+string(iuo_gauge.limitmax)+"', // If true, the pointer will not go past the end of the gauge"+ is_pbcr
ls_command +="   colorStart: '"+iuo_gauge.colorStart+"', // Colors"+ is_pbcr
ls_command += "   colorStop: '"+iuo_gauge.colorStop+"', // just experiment with them"+ is_pbcr
ls_command += "   strokeColor: '"+iuo_gauge.strokeColor+"', // to see which ones work best for you"+ is_pbcr
ls_command += "   generateGradient: "+string(iuo_gauge.generateGradient)+","+ is_pbcr
ls_command +="staticLabels: {"+ is_pbcr
ls_command +=' font: "'+iuo_gauge.staticLabels_Font+'",  // Specifies font'+ is_pbcr
ls_command +="  labels: "+iuo_gauge.staticLabels_Labels+",  // Print labels at these values"+ is_pbcr
ls_command +="  color:'"+iuo_gauge.staticLabels_color+"',  // Optional: Label text color"+ is_pbcr
ls_command +="  fractionDigits: "+of_dec_to_string(iuo_gauge.fractionDigit)+"   // Optional: Numerical precision. 0=round off."+ is_pbcr
ls_command +="},"+ is_pbcr
ls_command += ' };'+ is_pbcr
ls_command +="myGauge.setAttribute('style', 'height:"+string(iuo_gauge.gauge_height)+"px');"+ is_pbcr



return ls_command
end function

public function integer of_saveas_html (string as_filename);// SCRIPT:     of_saveas_html
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


//gets the empty HTML template in temp dir
ls_tempdir =  of_get_temp_folder ( )
ls_filename=ls_tempdir+"\pbwc_gauge.htm"
li_FileNum = FileOpen(ls_filename,  textMode!, read!)
IF li_FileNum < 0 THEN return -1
ll_ret = Filereadex(li_FileNum, ls_main_html)
fileclose(li_FileNum)
IF  ll_ret< 0 THEN return -1
//setting graph generated code
ls_main_html= inv_string.of_globalreplace(ls_main_html,'</BODY>','</BODY>~r~n<SCRIPT>'+is_last_command+'~r~n</SCRIPT>')

//gets the chart.bundle.js in temp dir
ls_filename=ls_tempdir+"\gauge.js"
li_FileNum = FileOpen(ls_filename,  textMode!, read!)
IF li_FileNum < 0 THEN return -1
ll_ret = Filereadex(li_FileNum, ls_chart_bundle_js)
fileclose(li_FileNum)
IF ll_ret < 0 THEN return -1
ls_main_html = inv_string.of_globalreplace(ls_main_html,'<script src="gauge.js">','<script>~r~n'+ls_chart_bundle_js+'~r~n')

////gets the chartjs-plugin-datalabels.js in temp dir
//ls_filename=ls_tempdir+"\chartjs-plugin-datalabels.js"
//li_FileNum = FileOpen(ls_filename,  textMode!, read!)
//IF li_FileNum < 0 THEN return -1
//ll_ret = Filereadex(li_FileNum, ls_chartjs_plugin_datalabels_js)
//fileclose(li_FileNum)
//IF ll_ret < 0 THEN return -1
//ls_main_html = inv_string.of_globalreplace(ls_main_html,'<script src="chartjs-plugin-datalabels.js">','<script>~r~n'+ls_chartjs_plugin_datalabels_js+'~r~n')


li_FileNum = FileOpen( as_filename, textMode!, Write!, Shared!, Replace!)
if li_filenum > 0 then
	ll_ret = FileWriteex(li_FileNum,ls_main_html)
	fileclose(li_filenum)
	IF li_FileNum < 0 THEN return -1
	return 1
end if
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

on n_cst_pbwc_gauge_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pbwc_gauge_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;//sets gauge.js source code url file path
is_gaugejs_path =  of_get_temp_folder ( )+"\"
is_gaugejs_path = of_get_url_from_file(is_gaugejs_path)
end event

