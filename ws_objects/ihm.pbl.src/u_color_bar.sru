$PBExportHeader$u_color_bar.sru
$PBExportComments$Palette de couleur - pour Commentaires Clinique et Types de RDV
forward
global type u_color_bar from userobject
end type
type p_autre from picture within u_color_bar
end type
type rc_background from rectangle within u_color_bar
end type
type rc_5 from rectangle within u_color_bar
end type
type rc_6 from rectangle within u_color_bar
end type
type rc_7 from rectangle within u_color_bar
end type
type rc_8 from rectangle within u_color_bar
end type
type rc_10 from rectangle within u_color_bar
end type
type rc_11 from rectangle within u_color_bar
end type
type rc_12 from rectangle within u_color_bar
end type
type rc_13 from rectangle within u_color_bar
end type
type rc_14 from rectangle within u_color_bar
end type
type rc_15 from rectangle within u_color_bar
end type
type rc_1 from rectangle within u_color_bar
end type
type rc_2 from rectangle within u_color_bar
end type
type rc_3 from rectangle within u_color_bar
end type
type rc_20 from rectangle within u_color_bar
end type
type rc_9 from rectangle within u_color_bar
end type
type rc_4 from rectangle within u_color_bar
end type
type rc_foreground from rectangle within u_color_bar
end type
type rc_16 from rectangle within u_color_bar
end type
type rc_17 from rectangle within u_color_bar
end type
type rc_18 from rectangle within u_color_bar
end type
type rc_19 from rectangle within u_color_bar
end type
type rc_21 from rectangle within u_color_bar
end type
end forward

global type u_color_bar from userobject
integer width = 750
integer height = 212
long backcolor = 15780518
long tabtextcolor = 33554432
event ue_lbuttondown pbm_lbuttondown
p_autre p_autre
rc_background rc_background
rc_5 rc_5
rc_6 rc_6
rc_7 rc_7
rc_8 rc_8
rc_10 rc_10
rc_11 rc_11
rc_12 rc_12
rc_13 rc_13
rc_14 rc_14
rc_15 rc_15
rc_1 rc_1
rc_2 rc_2
rc_3 rc_3
rc_20 rc_20
rc_9 rc_9
rc_4 rc_4
rc_foreground rc_foreground
rc_16 rc_16
rc_17 rc_17
rc_18 rc_18
rc_19 rc_19
rc_21 rc_21
end type
global u_color_bar u_color_bar

forward prototypes
public subroutine uf_set_background (long al_rgb_parm)
public subroutine uf_set_foreground (long al_rgb_parm)
public subroutine uf_get_colors (ref string as_foreground, ref string as_background)
public function long uf_get_rgb (integer ai_xloc, integer ai_yloc)
end prototypes

public subroutine uf_set_background (long al_rgb_parm);//Set the backgroound back to a particular color

If rc_background.fillcolor <> al_rgb_parm Then
	rc_background.fillcolor = al_rgb_parm
End if
end subroutine

public subroutine uf_set_foreground (long al_rgb_parm);//set the forground box to a particular color (passed)

If rc_foreground.fillcolor <> al_rgb_parm Then
	rc_foreground.fillcolor = al_rgb_parm
End If
end subroutine

public subroutine uf_get_colors (ref string as_foreground, ref string as_background);as_foreground =  String(rc_foreground.fillcolor)
as_background =  String(rc_background.fillcolor)
end subroutine

public function long uf_get_rgb (integer ai_xloc, integer ai_yloc);//get the color of the color box selected

int li_ind
rectangle rect [21] 
rect [1] = rc_1
rect [2] = rc_2
rect [3] = rc_3
rect [4] = rc_4
rect [5] = rc_5
rect [6] = rc_6
rect [7] = rc_7
rect [8] = rc_8
rect [9] = rc_9
rect [10] = rc_10
rect [11] = rc_11
rect [12] = rc_12
rect [13] = rc_13
rect [14] = rc_14
rect [15] = rc_15
rect [16] = rc_16
rect [17] = rc_17
rect [18] = rc_18
rect [19] = rc_19
rect [20] = rc_20
rect [21] = rc_21

if ai_xloc > p_autre.x and ai_xloc < (p_autre.x + p_autre.width) and ai_yloc > p_autre.y and ai_yloc < (p_autre.y + p_autre.height) then 
	// bouton autre ?
	long couleur_choisie
	if appel_palette(couleur_choisie) then
		return couleur_choisie 
	end if

else
	
	For li_ind = 1 to 21
		If ai_xloc > rect[li_ind].x and ai_xloc < (rect[li_ind].x + rect[li_ind].width) and ai_yloc > rect[li_ind].y and ai_yloc < (rect[li_ind].y + rect[li_ind].height) then 
			return rect[li_ind].fillcolor
		End if
	Next
end if

return -1
end function

on u_color_bar.create
this.p_autre=create p_autre
this.rc_background=create rc_background
this.rc_5=create rc_5
this.rc_6=create rc_6
this.rc_7=create rc_7
this.rc_8=create rc_8
this.rc_10=create rc_10
this.rc_11=create rc_11
this.rc_12=create rc_12
this.rc_13=create rc_13
this.rc_14=create rc_14
this.rc_15=create rc_15
this.rc_1=create rc_1
this.rc_2=create rc_2
this.rc_3=create rc_3
this.rc_20=create rc_20
this.rc_9=create rc_9
this.rc_4=create rc_4
this.rc_foreground=create rc_foreground
this.rc_16=create rc_16
this.rc_17=create rc_17
this.rc_18=create rc_18
this.rc_19=create rc_19
this.rc_21=create rc_21
this.Control[]={this.p_autre,&
this.rc_background,&
this.rc_5,&
this.rc_6,&
this.rc_7,&
this.rc_8,&
this.rc_10,&
this.rc_11,&
this.rc_12,&
this.rc_13,&
this.rc_14,&
this.rc_15,&
this.rc_1,&
this.rc_2,&
this.rc_3,&
this.rc_20,&
this.rc_9,&
this.rc_4,&
this.rc_foreground,&
this.rc_16,&
this.rc_17,&
this.rc_18,&
this.rc_19,&
this.rc_21}
end on

on u_color_bar.destroy
destroy(this.p_autre)
destroy(this.rc_background)
destroy(this.rc_5)
destroy(this.rc_6)
destroy(this.rc_7)
destroy(this.rc_8)
destroy(this.rc_10)
destroy(this.rc_11)
destroy(this.rc_12)
destroy(this.rc_13)
destroy(this.rc_14)
destroy(this.rc_15)
destroy(this.rc_1)
destroy(this.rc_2)
destroy(this.rc_3)
destroy(this.rc_20)
destroy(this.rc_9)
destroy(this.rc_4)
destroy(this.rc_foreground)
destroy(this.rc_16)
destroy(this.rc_17)
destroy(this.rc_18)
destroy(this.rc_19)
destroy(this.rc_21)
end on

type p_autre from picture within u_color_bar
integer x = 640
integer y = 4
integer width = 64
integer height = 196
boolean enabled = false
string picturename = "lc_palette.png"
boolean focusrectangle = false
end type

type rc_background from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 16777215
integer x = 5
integer y = 8
integer width = 114
integer height = 192
end type

type rc_5 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 65535
integer x = 416
integer y = 12
integer width = 69
integer height = 56
end type

type rc_6 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 16711680
integer x = 489
integer y = 12
integer width = 69
integer height = 56
end type

type rc_7 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 16776960
integer x = 562
integer y = 12
integer width = 69
integer height = 56
end type

type rc_8 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 128
integer x = 123
integer y = 76
integer width = 69
integer height = 56
end type

type rc_10 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 32768
integer x = 270
integer y = 76
integer width = 69
integer height = 56
end type

type rc_11 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 32896
integer x = 343
integer y = 76
integer width = 69
integer height = 56
end type

type rc_12 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 8388608
integer x = 416
integer y = 76
integer width = 69
integer height = 56
end type

type rc_13 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 8421376
integer x = 489
integer y = 76
integer width = 69
integer height = 56
end type

type rc_14 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 8421504
integer x = 562
integer y = 76
integer width = 69
integer height = 56
end type

type rc_15 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 12632256
integer x = 123
integer y = 140
integer width = 69
integer height = 56
end type

type rc_1 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 16777215
integer x = 123
integer y = 12
integer width = 69
integer height = 56
end type

type rc_2 from rectangle within u_color_bar
event left_button_clicked pbm_lbuttondown
event right_button_clicked pbm_rbuttondown
integer linethickness = 5
long fillcolor = 255
integer x = 197
integer y = 12
integer width = 69
integer height = 56
end type

type rc_3 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 16711935
integer x = 270
integer y = 12
integer width = 69
integer height = 56
end type

type rc_20 from rectangle within u_color_bar
integer linethickness = 5
integer x = 489
integer y = 140
integer width = 69
integer height = 56
end type

type rc_9 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 8388736
integer x = 197
integer y = 76
integer width = 69
integer height = 56
end type

type rc_4 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 65280
integer x = 343
integer y = 12
integer width = 69
integer height = 56
end type

type rc_foreground from rectangle within u_color_bar
integer linethickness = 5
integer x = 27
integer y = 32
integer width = 73
integer height = 144
end type

type rc_16 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 12639424
integer x = 197
integer y = 140
integer width = 69
integer height = 56
end type

type rc_17 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 15780518
integer x = 270
integer y = 140
integer width = 69
integer height = 56
end type

type rc_18 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 15793151
integer x = 343
integer y = 140
integer width = 69
integer height = 56
end type

type rc_19 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 10789024
integer x = 416
integer y = 140
integer width = 69
integer height = 56
end type

type rc_21 from rectangle within u_color_bar
integer linethickness = 5
long fillcolor = 79741120
integer x = 562
integer y = 140
integer width = 69
integer height = 56
end type

