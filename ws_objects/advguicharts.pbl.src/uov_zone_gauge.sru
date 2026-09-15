$PBExportHeader$uov_zone_gauge.sru
$PBExportComments$Chart.js datawindow control
forward
global type uov_zone_gauge from uov_gauge_js
end type
end forward

global type uov_zone_gauge from uov_gauge_js
string is_gauge_type ='zone'
decimal angle =-25
decimal lineWidth =20
decimal pointer_Length =60
Decimal pointer_StrokeWidth =50
String colorStart ='#2DA3DC'
String colorStop ='#C0C0DB'
String strokeColor ='#EEEEEE'
String color ='#000000'
Boolean generateGradient =false
String staticLabels_Font ='10px sans-serif'
String staticLabels_Labels ='[200,  500,2100,2500,3000]'
String staticLabels_color ='#000000'
integer fractionDigit=0
Real maxValue =3000
Real minValue =0
Integer animationSpeed =32
Real Value =1500
decimal radiusScale =90
boolean limitMax =false
boolean limitMin =false
boolean HighDpiSupport =false
integer lines =12
String Labels =''
long size=0
	String StaticZonescolor_list='#F03E3E|#FFDD00|#30B32D|#FFDD00|#F03E3E'
	String StaticZonesmin_list='4|200|500|2100|2500'
	String StaticZonesmax_list='200|500|2100|2500|3000'
	String StaticZonesHeight_list='||||'
long value_text_top =120
long value_text_width =220
long value_text_left =-24
String value_text_align ='center'
String value_text_font_family ='Segoe UI'
String value_text_font_color ='Grey'
String value_text_font_weight ='bold'
String value_text_font_size='18px'
long unit_text_top=140
long unit_text_width=176
long unit_text_left=0
String unit_text_align='center'
String unit_text_font_size='10px'
String unit_text_font_weight='bold'
String unit_text_font_color='Grey'
String unit_text_font_family='Segoe UI'
String unit_text='Unit'
long title_text_top=154
long title_text_width=168
long title_text_left=1
String title_text_align='center'
String title_text_font_size='22px'
String title_text_font_weight='bold'
String title_text_font_color='DarkGrey'
String title_text_font_family='Segoe UI'
String title_text='Title'
long gauge_top=0
long gauge_left=-69
long gauge_height=150
String gauge_background_color='White'
integer width=782
integer height=716

end type
global uov_zone_gauge uov_zone_gauge

on uov_zone_gauge.create
call super::create
end on

on uov_zone_gauge.destroy
call super::destroy
end on

type dw_default_image from uov_gauge_js`dw_default_image within uov_zone_gauge
integer x = 59
integer width = 795
string dataobject = "d_pbwc_zone_gauge_image"
end type

type ole_gauge from uov_gauge_js`ole_gauge within uov_zone_gauge
end type

