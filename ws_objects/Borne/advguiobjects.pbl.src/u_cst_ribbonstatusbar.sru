$PBExportHeader$u_cst_ribbonstatusbar.sru
forward
global type u_cst_ribbonstatusbar from userobject
end type
type uo_loadingcircle from u_cst_loadingcircle within u_cst_ribbonstatusbar
end type
type st_status1 from statictext within u_cst_ribbonstatusbar
end type
type st_paneltext from statictext within u_cst_ribbonstatusbar
end type
end forward

global type u_cst_ribbonstatusbar from userobject
integer width = 2341
integer height = 88
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
uo_loadingcircle uo_loadingcircle
st_status1 st_status1
st_paneltext st_paneltext
end type
global u_cst_ribbonstatusbar u_cst_ribbonstatusbar

type variables
String is_CurrentTheme = "BLUE"
n_cst_pbui_theme inv_color_theme

String is_status
string is_stack[]

CONSTANT LONG PANEL1 = 1
CONSTANT LONG PANEL2 = 2
CONSTANT LONG PANEL3 = 3
CONSTANT LONG PANEL4 = 4
CONSTANT LONG PANEL5 = 5
CONSTANT LONG PANEL6 = 6

String is_panel1
String is_panel2
String is_panel3
String is_panel4
String is_panel5
String is_panel6

private boolean ib_loading
public boolean ib_rtl
end variables

forward prototypes
public function integer of_settheme (string as_theme)
public function integer of_setstatus (string as_status)
public function integer of_statuspush (string as_status)
public function integer of_statuspop ()
public function integer of_gettextsize (string as_text)
public function integer of_setpaneltext (string as_text, long al_panel)
public function integer of_displayloadingcircle (boolean ab_switch)
public function integer of_setrtl ()
end prototypes

event resize;Long ll_width

ll_width = NewWidth

IF ll_width = 0 THEN
	ll_width = Width
END IF

IF ib_RTL THEN
	st_paneltext.X = 0
	uo_loadingcircle.X = ll_width - uo_loadingcircle.Width - 35
	IF ib_loading THEN
		st_status1.Width = ll_width - uo_loadingcircle.X
	ELSE
		st_status1.Width = ll_width - 35
	END IF
ELSE
	st_status1.Width = ll_width - st_status1.X
	st_paneltext.X = ll_width - st_paneltext.Width - 23
END IF
end event

public function integer of_settheme (string as_theme);Long ll_index
ribbonitem empty[]

IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme
is_currenttheme = as_theme

THIS.BackColor = inv_color_theme.of_GetColor(inv_color_theme.RibbonStatusBar, "BACKGROUND1")
st_status1.BackColor = THIS.BackColor
st_paneltext.BackColor = THIS.BackColor
uo_loadingcircle.BackColor = THIS.BackColor

st_status1.TextColor = inv_color_theme.of_GetColor(inv_color_theme.RibbonStatusBar, "HEADERTEXT")
st_paneltext.TextColor = st_status1.TextColor

RETURN 1
end function

public function integer of_setstatus (string as_status);Long ll_count

ll_count = UpperBound(is_stack)

IF ll_count = 0 THEN
	st_status1.Text = as_status
ELSE
	st_status1.Text = is_stack[ll_count]
END IF

is_status = as_status

RETURN 1
end function

public function integer of_statuspush (string as_status);Long ll_index

ll_index = UpperBound(is_stack) + 1

is_stack[ll_index] = as_status
st_status1.Text = as_status

RETURN 1
end function

public function integer of_statuspop ();Long ll_index, ll_count
String ls_newstack[]

ll_count = UpperBound(is_stack) - 1

FOR ll_index = 1 TO ll_count
	ls_newstack[ll_index] = is_stack[ll_index]
NEXT

is_stack = ls_newstack

ll_count = UpperBound(is_stack)

IF ll_count = 0 THEN
	st_status1.Text = is_status
ELSE
	st_status1.Text = is_stack[ll_count]
END IF

RETURN UpperBound(is_stack)
end function

public function integer of_gettextsize (string as_text);LongPtr lul_Handle, lul_hDC, lul_hFont, ll_height, ll_width
SIZE lstr_size
long ll_x
Integer li_newWidth
n_cst_win32 lnv_win32
n_uspb_text_helper lnv_texthelper

lnv_win32 = CREATE n_cst_win32

lul_Handle = Handle(THIS)
lul_hDC = lnv_win32.GetDC(lul_Handle)

lnv_texthelper.of_SetHdc(lul_hDC)

li_newWidth = lnv_texthelper.of_gettextwidth (lul_hDC, as_text, "Segoe UI", 9, lnv_texthelper.ALIGN_LEFT, 50, FALSE, FALSE, FALSE)

lnv_win32.ReleaseDC(lul_Handle, lul_hDC)

DESTROY lnv_win32
SetRedraw(TRUE)

RETURN PixelsToUnits(li_newWidth, XPixelsToUnits!)
end function

public function integer of_setpaneltext (string as_text, long al_panel);String ls_text

CHOOSE CASE al_panel
	CASE PANEL1
		is_panel1 = as_text
	CASE PANEL2
		is_panel2 = as_text
	CASE PANEL3
		is_panel3 = as_text
	CASE PANEL4
		is_panel4 = as_text
	CASE PANEL5
		is_panel5 = as_text
	CASE PANEL6
		is_panel6 = as_text
END CHOOSE

string ls_suffix, ls_prefix

IF ib_RTL THEN
	ls_suffix = " | "
ELSE
	ls_prefix = " | "
END IF

IF Len(Trim(is_panel1)) > 0 THEN
	ls_text = ls_prefix + is_Panel1 + ls_suffix
END IF

IF Len(Trim(is_panel2)) > 0 THEN
	ls_text = ls_prefix + is_Panel2 + ls_suffix + ls_text
END IF

IF Len(Trim(is_panel3)) > 0 THEN
	ls_text = ls_prefix + is_Panel3 + ls_suffix + ls_text
END IF

IF Len(Trim(is_panel4)) > 0 THEN
	ls_text = ls_prefix + is_Panel4 + ls_suffix + ls_text
END IF

IF Len(Trim(is_panel5)) > 0 THEN
	ls_text = ls_prefix + is_Panel5 + ls_suffix + ls_text
END IF

IF Len(Trim(is_panel6)) > 0 THEN
	ls_text = ls_prefix + is_Panel6 + ls_suffix + ls_text
END IF

IF ib_RTL THEN
	ls_text = " " + ls_text
ELSE
	ls_text = ls_text + " "
END IF

st_paneltext.width = of_GetTextSize(ls_text)
st_paneltext.Text = ls_text
Event Resize(0,Width,Height)
RETURN 1
end function

public function integer of_displayloadingcircle (boolean ab_switch);IF ib_RTL THEN
	
	IF ab_switch THEN
		uo_loadingcircle.of_Start()
		st_status1.Width = Width - uo_loadingcircle.X
		uo_loadingcircle.Visible = TRUE
	ELSE
		uo_loadingcircle.Visible = FALSE
		st_status1.Width = Width - 35
		uo_loadingcircle.of_Stop()
	END IF
	
ELSE

	IF ab_switch THEN
		uo_loadingcircle.of_Start()
		st_status1.X = uo_loadingcircle.Width + 23
		uo_loadingcircle.Visible = TRUE
	ELSE
		uo_loadingcircle.Visible = FALSE
		st_status1.X = 23
		uo_loadingcircle.of_Stop()
	END IF
END IF

ib_loading = ab_switch

Event Resize(1, Width, Height)

RETURN 1
end function

public function integer of_setrtl ();st_status1.Alignment = Right!
st_paneltext.Alignment = Left!

ib_rtl = TRUE

RETURN 1
end function

on u_cst_ribbonstatusbar.create
this.uo_loadingcircle=create uo_loadingcircle
this.st_status1=create st_status1
this.st_paneltext=create st_paneltext
this.Control[]={this.uo_loadingcircle,&
this.st_status1,&
this.st_paneltext}
end on

on u_cst_ribbonstatusbar.destroy
destroy(this.uo_loadingcircle)
destroy(this.st_status1)
destroy(this.st_paneltext)
end on

event constructor;//IF IsValid(ParentWindow) THEN
//	IF ParentWindow.RightToLeft THEN
//		ib_rtl = TRUE
//	END IF
//END IF

st_paneltext.Width = 0
end event

type uo_loadingcircle from u_cst_loadingcircle within u_cst_ribbonstatusbar
boolean visible = false
integer taborder = 10
end type

on uo_loadingcircle.destroy
call u_cst_loadingcircle::destroy
end on

event constructor;call super::constructor;of_SetStyle(Firefox)
of_SetColor(RGB(255,255,255))
end event

type st_status1 from statictext within u_cst_ribbonstatusbar
integer x = 23
integer y = 12
integer width = 2318
integer height = 60
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 16777215
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_paneltext from statictext within u_cst_ribbonstatusbar
integer x = 2249
integer y = 12
integer width = 82
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Segoe UI"
long textcolor = 16777215
long backcolor = 67108864
boolean focusrectangle = false
end type

