$PBExportHeader$u_cst_tile.sru
forward
global type u_cst_tile from u_cst_canvas
end type
end forward

global type u_cst_tile from u_cst_canvas
boolean visible = false
integer width = 773
integer height = 424
long backcolor = 29392896
string pointer = "HyperLink!"
event resize pbm_size
event clicked pbm_lbuttonclk
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event lbuttondown pbm_lbuttondown
event rbuttonup pbm_rbuttonup
end type
global u_cst_tile u_cst_tile

type variables
Public:

CONSTANT	integer		SUCCESS	= 1
CONSTANT	integer		FAILURE		= -1
CONSTANT	integer		NO_ACTION	= 0

CONSTANT	alignment	ALIGN_LEFT		= Left!
CONSTANT	alignment	ALIGN_CENTER	= Center!
CONSTANT	alignment	ALIGN_RIGHT	= Right!

long il_size

Alignment ia_alignment
String is_title
String is_description
String is_image
Long il_image
LongPtr il_imagelistlarge
String FontName = "Segoe UI"
Long FontSize = 12
Long TextColor = RGB(255,255,255)
Integer il_index

private:
Long il_x
n_cst_ui_imagelist inv_imagelist
n_cst_tile_painter painter
n_cst_tile_timer inv_timer

u_cst_powertiles iuo_parent
long il_origcolor
long il_hovercolor
boolean ib_startglide
Boolean ib_glidedone

Boolean ib_lbuttondown
Boolean ib_rbuttondown

Boolean ib_displaytooltip
n_cst_pbus_tooltip inv_tooltip
long il_ID
end variables

forward prototypes
public function integer of_settext (string as_text, string as_image)
public function integer of_settilecolor (long al_color)
public function string of_gettitle ()
public function integer of_setparent (u_cst_powertiles auo_parent)
public function integer of_setsize (integer al_size, integer al_width)
public function integer of_getsize ()
public function integer of_settext (string as_text, string as_image, alignment ae_alignment)
public function integer of_aligntext (alignment ae_alignment)
public function integer of_paintdescription ()
public function integer of_settext (string as_text, string as_image, string as_description, alignment ae_alignment)
public function integer of_paint (longptr hdc)
public function integer of_setfont (string as_font, integer ai_size, boolean ab_paint)
public function integer of_settiletextcolor (long al_color)
end prototypes

event mousemove;Long ll_index, ll_chevronindex

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	//Darken Color
	SetRedraw(TRUE)
end if
	
	
IF ib_displaytooltip THEN
	IF IsValid(THIS) THEN
		IF il_Id > 0 THEN
			inv_tooltip.of_UpdatetipRect( This, il_ID, &
											0, 0, &
											UnitsToPixels( Integer( Width ), XUnitsToPixels! ), &
											UnitsToPixels( Integer( Height ), YUnitsToPixels! ) )
			
			inv_tooltip.Of_SetTipText( This, il_Id, is_title) 
		END IF
	END IF
ELSE
	inv_tooltip.of_UpdatetipRect(This, il_ID, 0, 0, 0, 0)
END IF
end event

event lbuttonup;IF IsValid(iuo_parent) AND ib_lbuttondown THEN
	iuo_parent.POST EVENT TileClicked(is_title, il_index)
END IF

ib_lbuttondown = FALSE
end event

event lbuttondown;ib_lbuttondown = TRUE
end event

event rbuttonup;IF IsValid(iuo_parent) AND ib_rbuttondown THEN
	iuo_parent.POST EVENT TileRightClicked(is_title, il_index)
END IF

ib_rbuttondown = FALSE
end event

public function integer of_settext (string as_text, string as_image);
RETURN this.of_SetText( as_text, as_image, ALIGN_LEFT )

end function

public function integer of_settilecolor (long al_color);n_cst_theme lnv_theme
il_origcolor = al_color
il_hovercolor = lnv_theme.of_darkencolor(20, il_origcolor)
SetRedraw(TRUE)
RETURN SUCCESS
end function

public function string of_gettitle ();
RETURN is_title
end function

public function integer of_setparent (u_cst_powertiles auo_parent);
iuo_parent = auo_parent

RETURN SUCCESS
end function

public function integer of_setsize (integer al_size, integer al_width);
Width = al_width
il_size = al_size

RETURN SUCCESS
end function

public function integer of_getsize ();
RETURN il_size
end function

public function integer of_settext (string as_text, string as_image, alignment ae_alignment);RETURN of_SetText(as_text, as_image, "", ae_alignment)
end function

public function integer of_aligntext (alignment ae_alignment);ia_alignment = ae_Alignment

RETURN 1
end function

public function integer of_paintdescription ();Long ll_y, ll_width, ll_height

IF ib_mousecaptured AND Len(Trim(is_description)) > 0 THEN
	
	ll_width = UnitsToPixels(Width, XUnitsToPixels!)
	ll_height = UnitsToPixels(Height, YUnitsToPixels!)
	IF il_size = 2 THEN
		il_x = il_x + 48
	ELSE
		il_x = il_x + 24
	END IF
	ll_y = 0
	
	IF il_x >= 0 THEN
		ib_startglide = FALSE
		ib_glidedone = TRUE
		inv_timer.Stop()
		il_x = 10
	END IF

	painter.of_DrawDescription(is_description, il_hovercolor, il_x, ll_width, ll_height)
	painter.of_drawtextblock (THIS, is_description, TextColor, FontName, FontSize, TRUE, &
							il_x, 4, &
							(UnitsToPixels(Width, XUnitsToPixels!) - 10) + il_x, &
							UnitsToPixels(Height, YUnitsToPixels!), &
							1)

END IF



RETURN 1
end function

public function integer of_settext (string as_text, string as_image, string as_description, alignment ae_alignment);is_title = as_text
is_image = as_image
is_description = as_description
ia_alignment = ae_alignment

IF Len(Trim(as_image)) > 0 THEN
	Long ll_index
	
	ll_index = inv_imagelist.of_AddImage(as_image)
	il_imagelistlarge = inv_imagelist.of_GetXLargeHandle()

	il_image = ll_index - 1

END IF

SetRedraw(TRUE)

RETURN SUCCESS
end function

public function integer of_paint (longptr hdc);Long ll_color, ll_align, ll_textalign, ll_yAdjust
n_uspb_text_helper lnv_texthelper
CONSTANT LONG DT_END_ELLIPSIS = 32768
CONSTANT LONG DT_EDITCONTROL = 8192

IF ib_mousecaptured AND Len(Trim(is_description)) = 0 THEN
	ll_color = il_hovercolor
ELSE
	ll_color = il_origcolor
END IF

CHOOSE CASE ia_alignment
	CASE Left!
		// ll_align = 272// 0
		 ll_textalign = lnv_texthelper.ALIGN_LEFT
		  ll_align = lnv_texthelper.of_BitWiseOr(painter.DT_WORDBREAK,lnv_texthelper.of_BitWiseOr(DT_EDITCONTROL,lnv_texthelper.of_BitWiseOr(ll_textalign, DT_END_ELLIPSIS)))
	CASE Center!
		// ll_align = 17 //276 // painter.DT_HCENTER
		 ll_textalign = lnv_texthelper.ALIGN_CENTER
		 ll_align = lnv_texthelper.of_BitWiseOr(painter.DT_WORDBREAK,lnv_texthelper.of_BitWiseOr(DT_EDITCONTROL,lnv_texthelper.of_BitWiseOr(ll_textalign, DT_END_ELLIPSIS)))
	CASE Right!
		// ll_align = 274 //painter.DT_HRIGHT
		 ll_textalign = lnv_texthelper.ALIGN_RIGHT
		 ll_align = lnv_texthelper.of_BitWiseOr(painter.DT_WORDBREAK,lnv_texthelper.of_BitWiseOr(DT_EDITCONTROL,lnv_texthelper.of_BitWiseOr(ll_textalign, DT_END_ELLIPSIS)))
END CHOOSE

painter.of_drawbackground (ll_color, ll_color, ll_color)

lnv_texthelper.of_SetHDC(hdc)
ll_yAdjust =  5 + lnv_texthelper.of_gettextheight (hdc, is_title, FontName, FontSize, ll_textalign, UnitsToPixels(Width, XUnitsToPixels!) - 20, TRUE, FALSE, TRUE)
ib_displaytooltip = FALSE

IF ll_yAdjust > 46 THEN
	ll_yAdjust = 46
	ib_displaytooltip = TRUE
END IF

painter.of_drawtext (THIS, is_title, TextColor, FontName, FontSize, TRUE, &
                     10, UnitsToPixels(Height, YUnitsToPixels!) - ll_yAdjust, &
							UnitsToPixels(Width, XUnitsToPixels!) - 20, &
							ll_yAdjust, &
							ll_align)

painter.of_DrawImage(il_imagelistlarge,il_image, UnitsToPixels((width / 2), XUnitsToPixels!) - 24, UnitsToPixels(80, YUnitsToPixels!) - 8)


RETURN 1
end function

public function integer of_setfont (string as_font, integer ai_size, boolean ab_paint);FontName = as_font
FontSize = ai_size

IF ab_paint THEN SetRedraw(TRUE)

RETURN 1
end function

public function integer of_settiletextcolor (long al_color);TextColor = al_color
SetRedraw(TRUE)
RETURN SUCCESS
end function

on u_cst_tile.create
call super::create
end on

on u_cst_tile.destroy
call super::destroy
end on

event onpaint;call super::onpaint;Long ll_width, ll_height

painter.of_SetHDC(hdc)
painter.of_setdevicecontext (THIS)

of_Paint(hdc)

IF ib_mousecaptured AND Len(Trim(is_description)) > 0 AND NOT ib_glidedone THEN
	IF NOT ib_startglide THEN 
		ib_startglide = TRUE
		il_x = (UnitsToPixels(Width, XUnitsToPixels!) * -1) + 4
		inv_timer.Start(.04)
	END IF

	of_PaintDescription()
END IF

RETURN 1

end event

event mouseleave;call super::mouseleave;ib_glidedone = FALSE
ib_startglide = FALSE

inv_tooltip.of_UpdatetipRect(This, il_ID, 0, 0, 0, 0)

SetRedraw(TRUE)
end event

event constructor;call super::constructor;inv_timer = CREATE n_cst_tile_timer
inv_timer.iuo_parent = THIS

il_ID = inv_ToolTip.of_AddTool( THIS, "" , inv_ToolTip.TTF_SUBCLASS ) 
end event

event destructor;call super::destructor;DESTROY inv_timer
end event

event rbuttondown;call super::rbuttondown;ib_rbuttondown = TRUE
end event

event wm_mousewheel;call super::wm_mousewheel;iuo_parent.TRIGGER EVENT wm_MouseWheel(wparam, lparam)
end event

