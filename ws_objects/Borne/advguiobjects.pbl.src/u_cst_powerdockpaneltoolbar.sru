$PBExportHeader$u_cst_powerdockpaneltoolbar.sru
forward
global type u_cst_powerdockpaneltoolbar from u_cst_toolbarstrip
end type
end forward

global type u_cst_powerdockpaneltoolbar from u_cst_toolbarstrip
end type
global u_cst_powerdockpaneltoolbar u_cst_powerdockpaneltoolbar

type variables
u_cst_powerdock iuo_parent
u_cst_powerdockpanel iuo_panel
end variables

forward prototypes
public function long of_getcolor (string as_color)
public function integer of_paint (longptr hdc)
public function integer of_paintvs2013 (longptr hdc)
end prototypes

public function long of_getcolor (string as_color);IF iuo_parent.il_CurrentStyle = iuo_parent.VS2013 THEN
	CHOOSE CASE as_color
		CASE "BACKGROUND3"
			RETURN RGB(41, 57, 85)
	END CHOOSE
END IF

RETURN inv_color_theme.of_GetColor(inv_color_theme.Toolbar, as_color)

end function

public function integer of_paint (longptr hdc);Long ll_color1, ll_color2

//BCW - 2.0.0
IF ib_solidbackground THEN
	IF ib_quickaccessmode THEN
		ll_color1 = of_GetColor("BACKGROUND4")
		ll_color2 = of_GetColor("BACKGROUND4")
	ELSE
		ll_color1 = of_GetColor("BACKGROUND3")
		ll_color2 = of_GetColor("BACKGROUND3")
	END IF
ELSE
	ll_color1 = of_GetColor("BACKGROUND1")
	ll_color2 = of_GetColor("BACKGROUND2")
END IF

in_Gradient.of_SetHDC(hdc)

boolean lb_Horizontal

IF il_CurrentOrientation = HORIZONTAL THEN
	lb_Horizontal = TRUE
ELSE
	lb_Horizontal = FALSE
END IF
	
CHOOSE CASE il_CurrentStyle
	CASE XP
		in_Gradient.of_XPGradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)
	CASE VISTAEMBOSSED
		in_Gradient.of_Vista1Gradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)
	CASE VISTAORIGINAL
		in_Gradient.of_Vista2Gradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)
	CASE VISTAGLASS
		in_Gradient.of_Vista3Gradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)	
	CASE CUSTOM
		in_Gradient.of_CustomGradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)	
END CHOOSE
//BCW - 2.0.0

//of_VerticalGradient (of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND2"), THIS,ib_displayborder,of_GetColor("BORDER"), il_CurrentStyle)

IF ib_raisedborder THEN
	in_Gradient.of_DrawLine(Width - 3,0,Width - 3, Height, of_GetColor("CAP"))
	in_Gradient.of_DrawLine(0,Height - 3,Width, Height - 3, of_GetColor("CAP"))
END IF

LongPtr il_imagelist
CHOOSE CASE il_CurrentSize
	CASE SMALL
		il_imagelist = il_imagelistsmall
	CASE MEDIUM
		il_imagelist = il_imagelistmedium
	CASE LARGE
		il_imagelist = il_imagelistlarge
	CASE XLARGE
		il_imagelist = il_imagelistxlarge
END CHOOSE

in_Gradient.of_DrawButtons(THIS, ToolbarItemsLeft, FontName, FontSize, FontColor, il_ImageList, il_CurrentOrientation, il_ChevronIndex, TextUnderImage, ib_quickaccessmode, ib_fontcoloroverride)

of_DrawEval(hdc)

RETURN 1
end function

public function integer of_paintvs2013 (longptr hdc);Long ll_color1, ll_color2

ll_color1 = of_GetColor("BACKGROUND3")
ll_color2 = of_GetColor("BACKGROUND3")

in_Gradient.of_SetHDC(hdc)

boolean lb_Horizontal

IF il_CurrentOrientation = HORIZONTAL THEN
	lb_Horizontal = TRUE
ELSE
	lb_Horizontal = FALSE
END IF
	
in_Gradient.of_XPGradient(ll_color1, ll_color2, THIS,ib_displayborder,of_GetColor("BORDER"), lb_Horizontal)

LongPtr il_imagelist
CHOOSE CASE il_CurrentSize
	CASE SMALL
		il_imagelist = il_imagelistsmall
	CASE MEDIUM
		il_imagelist = il_imagelistmedium
	CASE LARGE
		il_imagelist = il_imagelistlarge
	CASE XLARGE
		il_imagelist = il_imagelistxlarge
END CHOOSE

string ls_panelposition

CHOOSE CASE iuo_panel.#Orientation
	CASE iuo_panel.TOP
		ls_panelposition = "TOP"
	CASE iuo_panel.BOTTOM
		ls_panelposition = "BOTTOM"
	CASE iuo_panel.LEFT
		ls_panelposition = "LEFT"
	CASE iuo_panel.RIGHT
		ls_panelposition = "RIGHT"
END CHOOSE

in_Gradient.of_DrawVS2013Buttons(THIS, ToolbarItemsLeft, FontName, FontSize, FontColor, il_ImageList, il_CurrentOrientation, il_ChevronIndex, TextUnderImage, ib_quickaccessmode, ib_fontcoloroverride,ls_panelposition)

of_DrawEval(hdc)

RETURN 1
end function

on u_cst_powerdockpaneltoolbar.create
call super::create
end on

on u_cst_powerdockpaneltoolbar.destroy
call super::destroy
end on

event onpaint;IF IsValid(iuo_parent) THEN
	IF iuo_parent.il_CurrentStyle = iuo_parent.VS2013 THEN
		RETURN of_PaintVS2013(hdc)
	END IF
END IF

RETURN of_Paint(hdc)
end event

event constructor;call super::constructor;ib_fontcoloroverride = FALSE
end event

type uo_toolbarchevron from u_cst_toolbarstrip`uo_toolbarchevron within u_cst_powerdockpaneltoolbar
end type

type st_pbus_toolbar from u_cst_toolbarstrip`st_pbus_toolbar within u_cst_powerdockpaneltoolbar
end type

