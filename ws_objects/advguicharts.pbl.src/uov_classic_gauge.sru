$PBExportHeader$uov_classic_gauge.sru
$PBExportComments$Chart.js datawindow control
forward
global type uov_classic_gauge from uov_gauge_js
end type
end forward

global type uov_classic_gauge from uov_gauge_js
string is_gauge_type ='gauge'
decimal angle =19
decimal lineWidth =47
decimal pointer_Length =71
Decimal pointer_StrokeWidth =35
String colorStart ='rgba(0,132,198,0.70)'
String colorStop ='rgba(0,132,198,0.50)'
String strokeColor ='rgba(0,15,31,0.15)'
String color ='#000000'
Boolean generateGradient =false
String staticLabels_Font ='10px sans-serif'
String staticLabels_Labels ='[0,  3000]'
String staticLabels_color ='#000000'
integer fractionDigit=0
Real maxValue =3000
Real minValue =0
Integer animationSpeed =10
Real Value =2500
decimal radiusScale =0
boolean limitMax =false
boolean limitMin =false
boolean HighDpiSupport =false
integer lines =12
String Labels =''
long size=0
long value_text_top =106
long value_text_width =131
long value_text_left =-43
String value_text_align ='right'
String value_text_font_family ='Segoe UI'
String value_text_font_color ='Grey'
String value_text_font_weight ='bold'
String value_text_font_size='18px'
long unit_text_top=112
long unit_text_width=220
long unit_text_left=-4
String unit_text_align='center'
String unit_text_font_size='10px'
String unit_text_font_weight='bold'
String unit_text_font_color='Grey'
String unit_text_font_family='Segoe UI'
String unit_text='Unit'
long title_text_top=128
long title_text_width=178
long title_text_left=1
String title_text_align='center'
String title_text_font_size='22px'
String title_text_font_weight='bold'
String title_text_font_color='DarkGrey'
String title_text_font_family='Segoe UI'
String title_text='Title'
long gauge_top=0
long gauge_left=-26
long gauge_height=117
String gauge_background_color='White'
integer width=864
integer height=624

end type
global uov_classic_gauge uov_classic_gauge

on uov_classic_gauge.create
call super::create
end on

on uov_classic_gauge.destroy
call super::destroy
end on

type dw_default_image from uov_gauge_js`dw_default_image within uov_classic_gauge
string dataobject = "d_pbwc_classic_gauge_image"
end type

type ole_gauge from uov_gauge_js`ole_gauge within uov_classic_gauge
end type

