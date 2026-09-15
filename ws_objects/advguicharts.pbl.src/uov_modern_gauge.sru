$PBExportHeader$uov_modern_gauge.sru
$PBExportComments$Chart.js datawindow control
forward
global type uov_modern_gauge from uov_gauge_js
end type
end forward

global type uov_modern_gauge from uov_gauge_js
string is_gauge_type ='new'
decimal angle =10
decimal lineWidth =20
decimal pointer_Length =60
Decimal pointer_StrokeWidth =50
String colorStart ='#2DA3DC'
String colorStop ='#C0C0DB'
String strokeColor ='#EEEEEE'
String color ='#000000'
Boolean generateGradient =false
String staticLabels_Font ='10px sans-serif'
String staticLabels_Labels ='[0,500,1000,1500,2000,2500,3000,3500]'
String staticLabels_color ='#000000'
integer fractionDigit=0
Real maxValue =3500
Real minValue =0
Integer animationSpeed =32
Real Value =2122
decimal radiusScale =90
boolean limitMax =false
boolean limitMin =false
boolean HighDpiSupport =false
integer lines =12
String Labels =''
long size=0
	String StaticZonescolor_list='rgb(255,0,0)|rgb(200,100,0)|rgb(150,150,0)|rgb(100,200,0)|rgb(0,255,0)|rgb(80,255,80)|rgb(130,130,130)'
	String StaticZonesmin_list='0|500|1000|1500|2000|2500|3000'
	String StaticZonesmax_list='500|1000|1500|2000|2500|3000|3500'
	String StaticZonesHeight_list='1.2|1.1|1|0.9|0.8|0.7|0.6'
long value_text_top =101
long value_text_width =70
long value_text_left =0
String value_text_align ='right'
String value_text_font_family ='Segoe UI'
String value_text_font_color ='Grey'
String value_text_font_weight ='bold'
String value_text_font_size='12px'
long unit_text_top=103
long unit_text_width=50
long unit_text_left=72
String unit_text_align='left'
String unit_text_font_size='10px'
String unit_text_font_weight='bold'
String unit_text_font_color='Grey'
String unit_text_font_family='Segoe UI'
String unit_text='Unit'
long title_text_top=118
long title_text_width=150
long title_text_left=1
String title_text_align='center'
String title_text_font_size='22px'
String title_text_font_weight='bold'
String title_text_font_color='DarkGrey'
String title_text_font_family='Segoe UI'
String title_text='Title'
long gauge_top=0
long gauge_left=-21
long gauge_height=105
String gauge_background_color='White'
integer width=795
integer height=580


end type
global uov_modern_gauge uov_modern_gauge

on uov_modern_gauge.create
call super::create
end on

on uov_modern_gauge.destroy
call super::destroy
end on

type dw_default_image from uov_gauge_js`dw_default_image within uov_modern_gauge
string dataobject = "d_pbwc_modern_gauge_image"
end type

type ole_gauge from uov_gauge_js`ole_gauge within uov_modern_gauge
end type

