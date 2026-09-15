$PBExportHeader$u_cst_shortcutitem.sru
forward
global type u_cst_shortcutitem from u_cst_canvas
end type
end forward

global type u_cst_shortcutitem from u_cst_canvas
boolean visible = false
integer width = 581
integer height = 108
string pointer = "HyperLink!"
event clicked pbm_lbuttonup
event mousewithin pbm_mousemove
event mouseenter ( )
event resize pbm_size
end type
global u_cst_shortcutitem u_cst_shortcutitem

type prototypes

end prototypes

type variables
Public:

	CONSTANT 	Long 		ILD_TRANSPARENT = 1
	CONSTANT 	Long 		LVM_GETIMAGELIST = 4098
	CONSTANT 	Long 		LVSIL_NORMAL = 0

	CONSTANT	integer	SUCCESS	= 1
	CONSTANT	integer	FAILURE		= -1
	CONSTANT	integer	NO_ACTION	= 0
	
	Boolean 							ib_selected
	Boolean 							ib_used
	Boolean 							ib_DisplayCloseButton = FALSE
	Boolean 							ib_Enabled = TRUE

	Long 								il_imageindex
	Long 								il_id
	Long 								il_BorderColor
	Long 								il_dc

	String 							is_image
	String 							is_smallimage
	String 							is_text

	LongPtr 							il_imagelistsmall
	LongPtr								il_imagelistlarge

	n_cst_ui_imagelist 			inv_imagelist
	n_cst_shortcutbar_painter	inv_gradient

	u_cst_shortcutbar 				iuo_parent

	DragObject 						iuo_object


// for color adjustment
coloradjustment mystructure1

end variables

forward prototypes
public function integer of_setparent (u_cst_shortcutbar auo_parent)
public function integer of_settext (string as_text)
public function string of_gettext ()
public function integer of_position (long al_x, long al_y, long al_width, long al_height)
public function string of_getimage ()
public function integer of_setimage (string as_image)
public function integer of_drawtext ()
public function integer of_drawpattern ()
public function integer of_setsize (long al_size)
public function boolean of_enabled (boolean ab_enabled)
public function integer of_drawclosebutton (long al_color)
public function string of_getsmallimage ()
public function integer of_setsmallimage (string as_image)
public function integer of_setimages (string as_image, string as_smallimage)
public function integer of_drawimage (unsignedlong ahdc)
public function integer of_drawdisabled (longptr ahdc)
end prototypes

event clicked;IF iuo_parent.ib_rtl THEN
	IF xpos > 0 AND xpos < 30 AND ypos < THIS.Height - 65 AND ib_displayclosebutton THEN
		iuo_parent.of_HideItem(is_text)
	ELSE
		iuo_parent.of_SetSelected(THIS)
	END IF
ELSE
	IF xpos > THIS.Width - 120 AND ypos < THIS.Height - 65 AND ib_displayclosebutton THEN
		iuo_parent.of_HideItem(is_text)
	ELSE
		iuo_parent.of_SetSelected(THIS)
	END IF
END IF
end event

event mousewithin;

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()

end if

IF ib_mousecaptured AND ib_DisplayCloseButton THEN
	SetRedraw(TRUE)
END IF
end event

event mouseenter();SetRedraw(TRUE)
end event

public function integer of_setparent (u_cst_shortcutbar auo_parent);iuo_parent = auo_parent

RETURN 1
end function

public function integer of_settext (string as_text);
is_Text = as_text


RETURN 1
end function

public function string of_gettext ();RETURN is_text
end function

public function integer of_position (long al_x, long al_y, long al_width, long al_height);iuo_object.Move(al_x, al_y)
iuo_object.Resize(al_width, al_height)

RETURN 1
end function

public function string of_getimage ();RETURN is_image//p_1.PictureName
end function

public function integer of_setimage (string as_image);is_image = as_image

IF Len(Trim(as_image)) > 0 THEN

	Long ll_index
	
	ll_index = inv_imagelist.of_AddImage(as_image)

	il_imagelistsmall = inv_imagelist.of_GetSmallHandle()
	il_imagelistlarge = inv_imagelist.of_GetMediumHandle()
	
	il_imageindex = ll_index
	
	RETURN ll_index

END IF

RETURN 0
end function

public function integer of_drawtext ();Long ll_color

Long ll_align, ll_x, ll_width

IF iuo_parent.ib_rtl THEN
	ll_x = 0
	ll_align = inv_Gradient.DT_RTLREADING
	IF iuo_parent.il_CurrentSize = iuo_parent.SMALL THEN
		ll_width = Width - 130
	ELSE
		ll_width = Width - 160
	END IF
ELSE
	ll_align = inv_Gradient.ALIGN_LEFT
	ll_width = Width - 120
	IF iuo_parent.il_CurrentSize = iuo_parent.SMALL THEN
		ll_x = 130
	ELSE
		ll_x = 160
	END IF
END IF

IF ib_selected OR ib_mousecaptured THEN
	ll_color = iuo_parent.of_GetColor('ITEMTEXTSELECTED')
ELSE
	ll_color = iuo_parent.of_GetColor('ITEMTEXT')
END IF

IF iuo_parent.il_CurrentSize = iuo_parent.SMALL THEN
	inv_Gradient.of_DrawText(THIS, is_text, ll_color, iuo_parent.is_fontname, iuo_parent.il_fontsize, TRUE, ll_align, ll_x, 0, ll_width, Height,iuo_parent.of_ShadowText()) 
ELSE
	inv_Gradient.of_DrawText(THIS, is_text, ll_color, iuo_parent.is_fontname, iuo_parent.il_fontsize, TRUE, ll_align, ll_x, 0, ll_width, Height,iuo_parent.of_ShadowText()) 
END IF

RETURN 1
end function

public function integer of_drawpattern ();//CHOOSE CASE iuo_parent.of_GetPattern()
//	CASE iuo_parent.NOPATTERN
//		//
//	CASE iuo_parent.SOLIDCIRCLE
//		in_Gradient.of_DrawPattern(THIS, 'l',iuo_parent.of_GetColor('BACKCOLOR1'),'wingdings', 12, Width, Height)
//	CASE iuo_parent.HOLLOWCIRCLE
//		in_Gradient.of_DrawPattern(THIS, 'm',iuo_parent.of_GetColor('BACKCOLOR1'),'wingdings', 12, Width, Height)
//	CASE iuo_parent.SOLIDSQUARE
//		in_Gradient.of_DrawPattern(THIS, 'n',iuo_parent.of_GetColor('BACKCOLOR1'),'wingdings', 12, Width, Height)
//	CASE iuo_parent.HOLLOWSQUARE
//		in_Gradient.of_DrawPattern(THIS, 'o',iuo_parent.of_GetColor('BACKCOLOR1'),'wingdings', 12, Width, Height)
//	CASE iuo_parent.STAR
//		in_Gradient.of_DrawPattern(THIS, 'i',iuo_parent.of_GetColor('BACKCOLOR1'),'wingdings', 12, Width, Height)
//	CASE iuo_parent.WAVE
//		in_Gradient.of_DrawPattern(THIS, '°',iuo_parent.of_GetColor('BACKCOLOR1'),'terminal', 12, Width, Height)
//	CASE iuo_parent.BAR
//		in_Gradient.of_DrawPattern(THIS, 'º',iuo_parent.of_GetColor('BACKCOLOR1'),'terminal', 12, Width, Height)
//	CASE iuo_parent.DIAMOND
//		in_Gradient.of_DrawPattern(THIS, '³',iuo_parent.of_GetColor('BACKCOLOR1'),'wingdings 2', 12, Width, Height)
//END CHOOSE
//		

RETURN 1
end function

public function integer of_setsize (long al_size);CHOOSE CASE al_size
	CASE iuo_parent.SMALL
		THIS.Height = 122
	CASE iuo_parent.LARGE
		THIS.Height = 134
END CHOOSE

RETURN 1
end function

public function boolean of_enabled (boolean ab_enabled);ib_enabled = ab_enabled

Return ib_enabled
end function

public function integer of_drawclosebutton (long al_color);Boolean lb_rtl

IF IsValid(iuo_parent) THEN
	lb_rtl = iuo_parent.ib_rtl
END IF

IF lb_rtl THEN
	inv_Gradient.of_DrawText(THIS, 'r', al_color, 'Marlett', 10, TRUE, inv_Gradient.ALIGN_LEFT, 10, 20, Width - 120, 64,FALSE) 
ELSE
	inv_Gradient.of_DrawText(THIS, 'r', al_color, 'Marlett', 10, TRUE, inv_Gradient.ALIGN_LEFT, Width - 80, 20, Width - 120, 64,FALSE) 
END IF

RETURN 1
end function

public function string of_getsmallimage ();
/*********************************************************
 *
 * Object			: u_cst_shortcutitem
 *
 * Method		: of_GetSmallImage
 *
 * Arguments	: None
 *
 * Returns		: The Small Image (if defined) otherwise the normal image
 *
 * Description	: Returns the small image (if defined)
 *
 * ---------------------------------------------------------------------------------------
 * DATE		NAME		DESCRIPTION
 * ---------------------------------------------------------------------------------------
 *	06/04/16	TBECK	Initial version
 *******************************************************/

string		ls_image

IF Trim( is_smallimage ) = "" THEN
	ls_image		= is_image
ELSE
	ls_image		= is_smallimage
END IF

RETURN ls_image
end function

public function integer of_setsmallimage (string as_image);
/*********************************************************
 *
 * Object			: u_cst_shortcutitem
 *
 * Method		: of_SetSmallImage
 *
 * Arguments	: as_image			The small image name
 *
 * Returns		: integer				Image Index Handle
 *
 * Description	: Add the small image to the list
 *
 * ---------------------------------------------------------------------------------------
 * DATE		NAME		DESCRIPTION
 * ---------------------------------------------------------------------------------------
 *	06/04/16	TBECK	Initial version
 *******************************************************/

Long ll_index

is_smallimage = as_image

IF Len(Trim(as_image)) > 0 THEN

	
	ll_index = inv_imagelist.of_AddImage(as_image)

	RETURN ll_index

END IF

RETURN NO_ACTION
end function

public function integer of_setimages (string as_image, string as_smallimage);
/*********************************************************
 *
 * Object			: u_cst_shortcutitem
 *
 * Method		: of_SetImages
 *
 * Arguments	: as_image			The image name
 *					  as_smallimage	The small image name
 *
 * Returns		: integer				Image Index Handle
 *
 * Description	: Add the small and large image to the list
 *
 * ---------------------------------------------------------------------------------------
 * DATE		NAME		DESCRIPTION
 * ---------------------------------------------------------------------------------------
 *	06/04/16	TBECK	Initial version
 *******************************************************/

integer		li_image
integer		li_smallimage

li_image			= this.of_SetImage( as_image )
li_smallimage	= this.of_SetSmallImage( as_smallImage )

RETURN li_image
end function

public function integer of_drawimage (unsignedlong ahdc);Long ll_x

IF iuo_parent.ib_rtl THEN
	ll_x = Width - 30 - PixelsToUnits(iuo_parent.il_CurrentSize, XPixelsToUnits!)
ELSE
	ll_x = 30
END IF


IF iuo_parent.il_CurrentSize = iuo_parent.SMALL THEN
	inv_win32.ImageList_Draw(il_imagelistsmall, il_imageindex - 1, ahdc, UnitsToPixels(ll_x, XUnitsToPixels!), UnitsToPixels(30, YUnitsToPixels!), ILD_TRANSPARENT )
ELSE // PICTURE SIZE IS 24
	inv_win32.ImageList_Draw(il_imagelistlarge, il_imageindex - 1, ahdc, UnitsToPixels(ll_x, XUnitsToPixels!), UnitsToPixels(20, YUnitsToPixels!), ILD_TRANSPARENT )
END IF	

RETURN 1
end function

public function integer of_drawdisabled (longptr ahdc);// Created by Serge Samson on Nov 06, 2006
Integer	li_counter

// we need to apply this twice to have a nicer fade effect
FOR li_counter = 0 to 2
	
	inv_win32.GetColorAdjustment (ahdc , mystructure1)

	// There is several potential 
	mystructure1.caBrightness 		= +100	//+60	// +80	// +100
	mystructure1.caColorfulness 	= -10		//-40 // -30		// -10
	mystructure1.caContrast 		= -34		//-10 // -14		// - 34
	
	IF inv_win32.GetStretchBltMode(ahdc) <> 4 THEN
		inv_win32.SetStretchBltMode (ahdc, 4)
	ELSE
		inv_win32.SetStretchBltMode (ahdc, 3)
	END IF
	
	inv_win32.SetColorAdjustment (ahdc , mystructure1)
		
	inv_win32.StretchBlt (ahdc,1, 1, UnitsToPixels(THIS.Width, XUnitsToPixels!) - 2, THIS.Height, ahdc, 1,1,UnitsToPixels(THIS.Width, XUnitsToPixels!) - 2, THIS.Height, 13369376)
Next

Return 1
end function

event mouseleave;SetRedraw(TRUE)
end event

on u_cst_shortcutitem.create
call super::create
end on

on u_cst_shortcutitem.destroy
call super::destroy
end on

event constructor;call super::constructor;THIS.Height = 122
end event

event onpaint;call super::onpaint;inv_Gradient.of_SetHDC(hdc)

IF ib_selected THEN
	IF ib_mousecaptured THEN
		inv_Gradient.of_VerticalGradient (iuo_parent.of_GetColor("HOVERSELECTED1"), iuo_parent.of_GetColor("HOVERSELECTED2"), THIS,TRUE,iuo_parent.of_GetColor("BORDER"), iuo_parent.of_GetStyle())
	ELSE
		inv_Gradient.of_VerticalGradient (iuo_parent.of_GetColor("SELECTED1"), iuo_parent.of_GetColor("SELECTED2"), THIS,TRUE,iuo_parent.of_GetColor("BORDER"), iuo_parent.of_GetStyle())
	END IF 
ELSE
	IF ib_mousecaptured THEN
		inv_Gradient.of_VerticalGradient (iuo_parent.of_GetColor("HOVER1"), iuo_parent.of_GetColor("HOVER2"), THIS,TRUE,iuo_parent.of_GetColor("BORDER"), iuo_parent.of_GetStyle())
	ELSE
		inv_Gradient.of_VerticalGradient (iuo_parent.of_GetColor("BACKGROUND1"), iuo_parent.of_GetColor("BACKGROUND2"), THIS,TRUE,iuo_parent.of_GetColor("BORDER"), iuo_parent.of_GetStyle())
		of_DrawPattern()
	END IF

END IF

of_DrawImage(hdc)
of_DrawText()

IF ib_enabled = FALSE THEN 
	of_DrawDisabled(hdc)
ELSE
	IF ib_mousecaptured AND ib_DisplayCloseButton THEN
		
		IF iuo_parent.ib_rtl THEN
			IF (PointerX() >= 0 AND PointerX() <= 30) AND PointerY() < THIS.Height - 65 THEN
				of_DrawCloseButton(iuo_parent.of_GetColor("BORDER"))
			ELSE
				of_DrawCloseButton(iuo_parent.of_GetColor("SELECTED2"))
			END IF
		ELSE
			IF PointerX() > THIS.Width - 120 AND PointerY() < THIS.Height - 65 THEN
				of_DrawCloseButton(iuo_parent.of_GetColor("BORDER"))
			ELSE
				of_DrawCloseButton(iuo_parent.of_GetColor("SELECTED2"))
			END IF
		END IF
	END IF
END IF


RETURN 0

end event

