$PBExportHeader$u_cst_xplistbaritem.sru
forward
global type u_cst_xplistbaritem from u_cst_canvas
end type
type st_1 from statictext within u_cst_xplistbaritem
end type
end forward

global type u_cst_xplistbaritem from u_cst_canvas
integer height = 68
string pointer = "HyperLink!"
event mouseenter ( )
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event resize pbm_size
event lbuttondown pbm_lbuttondown
st_1 st_1
end type
global u_cst_xplistbaritem u_cst_xplistbaritem

type prototypes

end prototypes

type variables
n_cst_xplistbar_painter in_Gradient
n_cst_ui_imagelist inv_imagelist
u_cst_xplistbargroup iuo_parent
DragObject iuo_object

Boolean ib_used
Boolean ib_selected
Boolean ib_lbuttondown

String is_text
String is_image

LongPtr il_imagelistsmall
Long il_style
Long il_image

Long il_height = 64

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

Long	il_link_idx
end variables

forward prototypes
public function integer of_setparent (u_cst_xplistbargroup auo_parent)
public function integer of_settext (string as_text)
public function integer of_setimage (string as_image)
public function integer of_drawline ()
public function String of_gettext ()
public function integer of_gettextsize (string as_text)
end prototypes

event mouseenter();SetRedraw(TRUE)
end event

event mousemove;IF il_style = iuo_parent.iuo_parent.Link THEN
	if NOT of_ismousecaptured() then 
		
		of_capturemouse()
		
		this.event mouseenter()
			
	end if
END IF
end event

event lbuttonup;Long	l_link_idx

IF NOT ib_lbuttondown THEN RETURN

ib_lbuttondown = FALSE

// check if style is link then assign the link index;
// otherwise set it to 0
IF this.il_style = iuo_parent.iuo_parent.LINK THEN
	l_link_idx = il_link_idx
ELSE
	l_link_idx = 0
END IF

Long ll_return
ll_return = iuo_parent.iuo_parent.Trigger Event SelectionChanging(iuo_parent.of_GetText(),  is_text)

IF IsNull(ll_return) OR ll_return <> 1 THEN ll_return = 0

IF ll_return = 0 THEN

	iuo_parent.iuo_parent.Trigger Dynamic Event itemselected ( iuo_parent.of_GetText(),  is_text, l_link_idx)

	IF IsValid(THIS) THEN
		IF IsValid(iuo_parent) THEN
			IF IsValid(iuo_parent.iuo_parent) THEN
				iuo_parent.iuo_parent.Trigger Event SelectionChanged(iuo_parent.of_GetText(),  is_text)
			END IF
		END IF
	END IF
END IF

IF IsValid(THIS) THEN
	of_releasemouse()
	this.event post mouseleave()
END IF
end event

event lbuttondown;ib_lbuttondown = TRUE
end event

public function integer of_setparent (u_cst_xplistbargroup auo_parent);iuo_parent = auo_parent
	
RETURN 1
end function

public function integer of_settext (string as_text);is_text = as_text

RETURN 1
end function

public function integer of_setimage (string as_image);is_image = as_image

IF Len(Trim(is_image)) > 0 THEN

	il_image = inv_imagelist.of_AddImage(as_image)
	il_imagelistsmall = inv_imagelist.of_GetSmallHandle()

END IF

RETURN 1
end function

public function integer of_drawline ();Long ll_x1, ll_x2, ll_y1, ll_y2

ll_x1 = 50
ll_y1 = Height / 2 + 5
ll_x2 = Width - 40
ll_y2 = ll_y1

in_Gradient.of_DrawLine(ll_x1, ll_y1, ll_x2, ll_y2, iuo_parent.iuo_parent.of_GetColor('LINE'))

RETURN 1

end function

public function String of_gettext ();RETURN is_text
end function

public function integer of_gettextsize (string as_text);LongPtr lul_Handle, lul_hDC, lul_hFont
SIZE lstr_size
long ll_x
n_uspb_text_helper lnv_texthelper
Integer li_newHeight

IF iuo_parent.iuo_parent.Line = il_style THEN
	il_height = 64
	Height = 64
	RETURN 1
END IF

IF is_image = '' THEN
	ll_x = 60
ELSE
	ll_x = 160
END IF

lul_Handle = Handle(st_1)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_texthelper.of_SetHdc(lul_hDC)

li_newHeight = PixelsToUnits(lnv_texthelper.of_gettextheight (lul_hDC,as_text,  iuo_parent.iuo_parent.is_fontname, iuo_parent.iuo_parent.il_fontsize, lnv_texthelper.ALIGN_LEFT, UnitsToPixels(Width - 60, XUnitsToPixels!) , FALSE, FALSE, TRUE), XPixelsToUnits!)

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

li_newHeight += 3

IF iuo_parent.BottomPadding > 0 THEN
	li_newHeight += iuo_parent.BottomPadding
END IF

il_height = li_newHeight
Height = li_newHeight + 4

RETURN 1
end function

event mouseleave();SetRedraw(TRUE)
end event

on u_cst_xplistbaritem.create
int iCurrent
call super::create
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
end on

on u_cst_xplistbaritem.destroy
call super::destroy
destroy(this.st_1)
end on

event onpaint;call super::onpaint;Long ll_color, ll_selcolor, ll_x, ll_imgx, ll_align, ll_width, ll_back1, ll_back2
int ll_parm
Boolean lb_underline, lb_rtl

IF IsValid(iuo_parent) THEN
	IF IsValid(iuo_parent.iuo_parent) THEN
		
		lb_rtl = iuo_parent.iuo_parent.ib_rtl
		in_Gradient.of_SetHDC(hdc)

		IF iuo_parent.iuo_parent.is_CurrentStyle = iuo_parent.iuo_parent.ClassicStyle THEN
			ll_back1 = iuo_parent.iuo_parent.of_GetColor('ITEMBACK1')
			ll_back2 = iuo_parent.iuo_parent.of_GetColor('ITEMBACK2')
			
			CHOOSE CASE il_style
				CASE iuo_parent.iuo_parent.LINK
					ll_color = iuo_parent.iuo_parent.of_GetColor('ITEMTEXT')
					ll_selcolor = iuo_parent.iuo_parent.of_GetColor('ITEMTEXTSELECTED')
					lb_underline = TRUE
				CASE iuo_parent.iuo_parent.LABEL
					ll_color = 0
					ll_selcolor = 0
					lb_underline = FALSE
			END CHOOSE
		ELSE
			ll_back1 = iuo_parent.iuo_parent.of_GetBackColor(iuo_parent.iuo_parent.BackColor)
			ll_back2 = ll_back1
			ll_color = 0
			ll_selcolor = 0
			CHOOSE CASE il_style
				CASE iuo_parent.iuo_parent.LINK
					lb_underline = TRUE
				CASE iuo_parent.iuo_parent.LABEL
					lb_underline = FALSE
			END CHOOSE
		END IF

		IF NOT Enabled THEN
			ll_color = iuo_parent.iuo_parent.of_GetColor('TEXTDISABLED')
		END IF

		in_Gradient.of_HorizontalGradient(ll_back1, ll_back2, THIS, FALSE)
		
		IF iuo_parent.iuo_parent.is_CurrentStyle = iuo_parent.iuo_parent.ClassicStyle THEN
			IF is_image = '' THEN
				ll_x = 60
				ll_imgx = UnitsToPixels(Width - 60, XUnitsToPixels!)
				
				IF lb_rtl THEN
					ll_align = in_Gradient.DT_RTLREADING
					ll_width = PixelsToUnits(ll_imgx - 4, XPixelsToUnits!)
				ELSE
					ll_align = in_Gradient.ALIGN_LEFT
					ll_width = Width - 60
				END IF
			ELSE
				IF lb_rtl THEN
					ll_x = 60
					ll_imgx = UnitsToPixels(Width - 60, XUnitsToPixels!) - 12
										
					IF Enabled THEN
						inv_win32.ImageList_Draw(il_imagelistsmall, il_image - 1, hdc, ll_imgx, UnitsToPixels(2, YUnitsToPixels!), ILD_TRANSPARENT )
					ELSE				
						ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
						inv_win32.ImageList_DrawEx(il_imagelistsmall, &
											  il_image - 1, hdc, ll_imgx, UnitsToPixels(2, YUnitsToPixels!), &
											  16,16, 4294967295, RGB(128,128,128), ll_parm )
					END IF
					
					ll_align = in_Gradient.DT_RTLREADING
					ll_width = PixelsToUnits(ll_imgx - 4, XPixelsToUnits!)
				ELSE
					ll_x = 160
					ll_imgx = UnitsToPixels(60, XUnitsToPixels!)
					
					IF Enabled THEN
						inv_win32.ImageList_Draw(il_imagelistsmall, il_image - 1, hdc, ll_imgx, UnitsToPixels(2, YUnitsToPixels!), ILD_TRANSPARENT )
					ELSE				
						ll_parm = 5 //ILD_TRANSPARENT | ILD_BLEND50
						inv_win32.ImageList_DrawEx(il_imagelistsmall, &
											  il_image - 1, hdc, ll_imgx, UnitsToPixels(2, YUnitsToPixels!), &
											  16,16, 4294967295, RGB(128,128,128), ll_parm )
					END IF
	
					ll_align = in_Gradient.ALIGN_LEFT
					ll_width = Width - 60
				END IF
			END IF
		ELSE
			IF is_image = '' THEN
				ll_x = 20
				ll_imgx = UnitsToPixels(Width - 20, XUnitsToPixels!)
				
				IF lb_rtl THEN
					ll_align = in_Gradient.DT_RTLREADING
					ll_width = PixelsToUnits(ll_imgx - 4, XPixelsToUnits!)
				ELSE
					ll_align = in_Gradient.ALIGN_LEFT
					ll_width = Width - 20
				END IF
			ELSE
				IF lb_rtl THEN
					ll_x = 20
					ll_imgx = UnitsToPixels(Width - 20, XUnitsToPixels!) - 12
					inv_win32.ImageList_Draw(il_imagelistsmall, il_image - 1, hdc, ll_imgx, UnitsToPixels(2, YUnitsToPixels!), ILD_TRANSPARENT )
					ll_align = in_Gradient.DT_RTLREADING
					ll_width = PixelsToUnits(ll_imgx - 4, XPixelsToUnits!)
				ELSE
					ll_x = 120
					ll_imgx = UnitsToPixels(20, XUnitsToPixels!)
					inv_win32.ImageList_Draw(il_imagelistsmall, il_image - 1, hdc, ll_imgx, UnitsToPixels(2, YUnitsToPixels!), ILD_TRANSPARENT )
					ll_align = in_Gradient.ALIGN_LEFT
					ll_width = Width - 20
				END IF
			END IF
		END IF

		IF ib_mousecaptured THEN
			in_Gradient.of_DrawText(THIS, is_text, ll_selcolor, iuo_parent.iuo_parent.is_fontname, iuo_parent.iuo_parent.il_fontsize, FALSE, ll_align, ll_x, 10, ll_width, il_height,FALSE, FALSE, lb_underline, (NOT lb_rtl)) 
		ELSE
			in_Gradient.of_DrawText(THIS, is_text, ll_color, iuo_parent.iuo_parent.is_fontname, iuo_parent.iuo_parent.il_fontsize, FALSE, ll_align, ll_x, 10, ll_width, il_height,FALSE, FALSE, FALSE, (NOT lb_rtl)) 

		END IF
		
		IF il_style = iuo_parent.iuo_parent.LINE THEN
			of_DrawLine()
		END IF
		
	END IF
END IF

RETURN 0
end event

event wm_mousewheel;call super::wm_mousewheel;iuo_parent.iuo_parent.Trigger Event wm_mousewheel(wparam, lparam)
end event

type st_1 from statictext within u_cst_xplistbaritem
boolean visible = false
integer x = 151
integer y = 16
integer width = 411
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
boolean enabled = false
string text = "none"
boolean focusrectangle = false
end type

