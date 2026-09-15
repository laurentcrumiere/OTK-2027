$PBExportHeader$u_color_bar_petite.sru
forward
global type u_color_bar_petite from UserObject
end type
type rc_background from rectangle within u_color_bar_petite
end type
type rc_1 from rectangle within u_color_bar_petite
end type
type rc_2 from rectangle within u_color_bar_petite
end type
type rc_23 from rectangle within u_color_bar_petite
end type
type rc_foreground from rectangle within u_color_bar_petite
end type
end forward

global type u_color_bar_petite from UserObject
int Width=572
int Height=97
long BackColor=78682240
long PictureMaskColor=25166016
long TabTextColor=33554432
long TabBackColor=67108864
event ue_lbuttondown pbm_lbuttondown
rc_background rc_background
rc_1 rc_1
rc_2 rc_2
rc_23 rc_23
rc_foreground rc_foreground
end type
global u_color_bar_petite u_color_bar_petite

forward prototypes
public subroutine uf_get_colors (ref string as_foreground, ref string as_background)
public function long uf_get_rgb (integer ai_xloc)
public subroutine uf_set_background (long al_rgb_parm)
public subroutine uf_set_foreground (long al_rgb_parm)
end prototypes

public subroutine uf_get_colors (ref string as_foreground, ref string as_background);as_foreground =  String(rc_foreground.fillcolor)
as_background =  String(rc_background.fillcolor)
end subroutine

public function long uf_get_rgb (integer ai_xloc);//get the color of the color box selected

int li_ind
rectangle rect [3] 
rect [1] = rc_1
rect [2] = rc_2
rect [3] = rc_23

For li_ind = 1 to 3
	If ai_xloc > rect[li_ind].x and ai_xloc < (rect[li_ind].x + rect[li_ind].width) then 
		return rect[li_ind].fillcolor
	End if
Next

return -1
end function

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

on u_color_bar_petite.create
this.rc_background=create rc_background
this.rc_1=create rc_1
this.rc_2=create rc_2
this.rc_23=create rc_23
this.rc_foreground=create rc_foreground
this.Control[]={ this.rc_background,&
this.rc_1,&
this.rc_2,&
this.rc_23,&
this.rc_foreground}
end on

on u_color_bar_petite.destroy
destroy(this.rc_background)
destroy(this.rc_1)
destroy(this.rc_2)
destroy(this.rc_23)
destroy(this.rc_foreground)
end on

type rc_background from rectangle within u_color_bar_petite
int X=42
int Y=5
int Width=234
int Height=85
boolean Visible=false
boolean Enabled=false
int LineThickness=5
long FillColor=16777215
end type

type rc_1 from rectangle within u_color_bar_petite
int X=375
int Y=21
int Width=74
int Height=61
boolean Enabled=false
int LineThickness=5
long FillColor=16777215
end type

type rc_2 from rectangle within u_color_bar_petite
event left_button_clicked pbm_lbuttondown
event right_button_clicked pbm_rbuttondown
int X=458
int Y=21
int Width=74
int Height=61
boolean Enabled=false
int LineThickness=5
long FillColor=255
end type

type rc_23 from rectangle within u_color_bar_petite
int X=293
int Y=21
int Width=74
int Height=61
boolean Enabled=false
int LineThickness=5
end type

type rc_foreground from rectangle within u_color_bar_petite
int X=46
int Y=17
int Width=197
int Height=65
boolean Enabled=false
int LineThickness=5
long FillColor=16777215
end type

