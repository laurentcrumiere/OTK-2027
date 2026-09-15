$PBExportHeader$uov_donut_gauge.sru
$PBExportComments$Chart.js datawindow control
forward
global type uov_donut_gauge from uov_gauge_js
end type
end forward

global type uov_donut_gauge from uov_gauge_js
string is_gauge_type ='donut'
decimal angle =22
decimal lineWidth =10
decimal pointer_Length =90
Decimal pointer_StrokeWidth =35
String colorStart ='#2DA3DC'
String colorStop ='#C0C0DB'
String strokeColor ='#EEEEEE'
String color ='#000000'
Boolean generateGradient =false
String staticLabels_Font ='10px sans-serif'
String staticLabels_Labels ='[0,  100]'
String staticLabels_color ='#000000'
integer fractionDigit=0
Real maxValue =100
Real minValue =0
Integer animationSpeed =32
Real Value =60
decimal radiusScale =0
boolean limitMax =false
boolean limitMin =false
boolean HighDpiSupport =false
integer lines =12
String Labels =''
long size=0
long value_text_top =34
long value_text_width =150
long value_text_left =7
String value_text_align ='center'
String value_text_font_family ='Segoe UI'
String value_text_font_color ='LightGrey'
String value_text_font_weight ='bold'
String value_text_font_size='70px'
long unit_text_top=120
long unit_text_width=160
long unit_text_left=0
String unit_text_align='center'
String unit_text_font_size='10px'
String unit_text_font_weight='bold'
String unit_text_font_color='Grey'
String unit_text_font_family='Segoe UI'
String unit_text='Unit'
long title_text_top=133
long title_text_width=160
long title_text_left=1
String title_text_align='center'
String title_text_font_size='22px'
String title_text_font_weight='bold'
String title_text_font_color='DarkGrey'
String title_text_font_family='Segoe UI'
String title_text='Title'
long gauge_top=10
long gauge_left=-70
long gauge_height=151
String gauge_background_color='White'
integer width=754
integer height=648

end type
global uov_donut_gauge uov_donut_gauge

on uov_donut_gauge.create
call super::create
end on

on uov_donut_gauge.destroy
call super::destroy
end on

type dw_default_image from uov_gauge_js`dw_default_image within uov_donut_gauge
integer x = 91
integer width = 731
string dataobject = "d_pbwc_donut_gauge_image"
end type

type ole_gauge from uov_gauge_js`ole_gauge within uov_donut_gauge
end type

