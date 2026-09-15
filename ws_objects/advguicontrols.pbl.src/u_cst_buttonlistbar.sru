$PBExportHeader$u_cst_buttonlistbar.sru
forward
global type u_cst_buttonlistbar from u_cst_canvas
end type
type uo_standardscroll from u_cst_standardscroll within u_cst_buttonlistbar
end type
type uo_scrolldown from u_cst_buttonlistbarscroll within u_cst_buttonlistbar
end type
type uo_scrollup from u_cst_buttonlistbarscroll within u_cst_buttonlistbar
end type
type st_pbus_buttonlistbarlabel from statictext within u_cst_buttonlistbar
end type
end forward

global type u_cst_buttonlistbar from u_cst_canvas
integer width = 608
integer height = 596
event resize pbm_size
event mouseenter ( )
event mousemove pbm_mousemove
event lbuttonup pbm_lbuttonup
event type long selectionchanging ( long oldindex,  long newindex )
event selectionchanged ( long oldindex,  long newindex )
event timer pbm_timer
uo_standardscroll uo_standardscroll
uo_scrolldown uo_scrolldown
uo_scrollup uo_scrollup
st_pbus_buttonlistbarlabel st_pbus_buttonlistbarlabel
end type
global u_cst_buttonlistbar u_cst_buttonlistbar

type prototypes
SUBROUTINE WinSleep(long dwMilliseconds) Library "kernel32.dll" ALIAS FOR "Sleep"
end prototypes

type variables
PUBLIC:
CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)
CONSTANT Long WINDOWS8_BLUE = 1
CONSTANT Long WINDOWS8_OLIVE = 2
CONSTANT Long WINDOWS8_SILVER = 3

CONSTANT Long LINK = 1
CONSTANT Long LABEL = 2
CONSTANT Long LINE = 3
CONSTANT Long OBJECT = 4

CONSTANT Long SMALL = 16
CONSTANT Long MEDIUM = 24
CONSTANT Long LARGE = 32
CONSTANT Long XLARGE = 48

CONSTANT Long BUTTON = 1
CONSTANT Long LIST = 2
CONSTANT Long VS2013 = 3
CONSTANT Long GRADIENTLIST = 4
CONSTANT Long SOLIDLIST = 5

CONSTANT Long VERTICAL = 1
CONSTANT Long HORIZONTAL = 2

Boolean StandardScrollbar = FALSE

String FontName = "Segoe UI"
Int FontSize = 9

Long il_speed = 10

Long il_index
Long il_selected
Long il_nextindex = 0
String is_images[]
Boolean ib_boldselected
Boolean ib_dirty
Boolean ib_rtl = FALSE

String is_CurrentTheme = ""
n_cst_pbui_theme inv_color_theme

Long il_CurrentSize = MEDIUM
Long il_CurrentStyle = BUTTON

Buttons ist_buttons[]
Buttons ist_hiddenbuttons[]

n_cst_buttonlistbar_painter in_gradient
n_cst_ui_imagelist inv_imagelist

Long il_y = 0

Boolean ib_windows8

LongPtr il_imagelistsmall
LongPtr il_imagelistmedium
LongPtr il_imagelistlarge
LongPtr il_imagelistxlarge

LongPtr il_imagelist



Long il_CurrentOrientation

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0



Constant Integer WM_GETFONT = 49

window	iw_parent

Boolean ib_scrollingup
Boolean ib_scrollingdown
n_uspb_scroll_timer iuo_scrolltimer

long il_lastheight
Boolean ib_scrollneedsupdating
end variables

forward prototypes
public function long of_getcolor (string as_color)
public function integer of_reorganize (long al_y)
public function integer of_scrolldown ()
public function integer of_scrollup ()
public function integer of_settheme (string as_color)
public function integer of_addimage (string as_image)
public function integer of_setsize (integer ai_size)
public function integer of_updatepoints ()
public function integer of_indexfrompoint (long xpos, long ypos)
public function integer of_mouseover (long al_index)
public function integer of_mouseleave ()
public function integer of_setenabled (long al_index, boolean ab_enabled)
public function integer of_setenabled (string as_text, boolean ab_enabled)
public function string of_gettext (long al_index)
public function integer of_selectbutton (string as_text)
public function integer of_setscrollspeed (long al_speed)
public function integer of_additem (string as_text, string as_image, any aa_data)
public function any of_getdata (integer ai_index)
public function window of_getparentwindow ()
public function long of_additem (string as_text, string as_image)
public function integer of_settext (string as_item, string as_text)
public function integer of_gettextwidth (string as_text)
public function integer of_setstyle (long al_style)
public function integer of_updatepointsbutton ()
public function integer of_updatepointslist ()
public function integer of_reset ()
public function integer of_getdrawheight ()
public function integer of_removeitem (string as_text)
public function integer of_scrollup (boolean ab_autoscroll)
public function integer of_scrolldown (boolean ab_autoscroll)
public function integer of_selectbutton (long al_index)
public function integer of_removeitem (long al_index)
public function integer of_settext (long al_index, string as_text)
public function integer of_getarrayposition (long al_index)
public function long of_settheme (long al_color)
public function integer of_righttoleft (boolean ab_switch)
public function string of_classname ()
public function integer of_updatepointssolidlist ()
public function integer of_updatepointsgradientlist ()
public function integer of_setfontname (string as_fontname)
public function integer of_setfontsize (integer ai_fontsize)
public function integer of_setvisible (long al_index, boolean ab_visible)
public function integer of_setvisible (string as_text, boolean ab_visible)
private function integer of_insertitem (buttons ast_button)
public function integer of_updatestandardscroll (long al_height)
public function integer of_getdrawheight (integer ai_max)
public function integer of_setstandardscrollbar (boolean ab_switch)
end prototypes

event resize;uo_scrollup.Width = Width
uo_scrolldown.Width = Width
uo_scrolldown.Y = Height - uo_scrolldown.height

IF StandardScrollbar THEN
	IF il_lastheight < UnitsToPixels(NewHeight, YUnitsToPixels!) AND il_y < 0 THEN
		il_y = il_y + (UnitsToPixels(NewHeight, YUnitsToPixels!) - il_lastheight)
		IF il_y > 0 THEN
			il_y = 0
			uo_standardscroll.of_SetPosition(0)
		END IF
	END IF
END IF

of_Reorganize(il_y)

IF StandardScrollbar THEN
	IF ib_RTL THEN
		uo_standardscroll.Move(PixelsToUnits(1,XPixelsToUnits!), PixelsToUnits(1,YPixelsToUnits!))
	ELSE
		uo_standardscroll.Move(NewWidth - uo_standardscroll.Width - PixelsToUnits(1,XPixelsToUnits!), PixelsToUnits(1,YPixelsToUnits!))
	END IF
	uo_standardscroll.Resize(uo_standardscroll.Width, NewHeight - PixelsToUnits(2,YPixelsToUnits!) )
	
	IF of_GetDrawheight() <= UnitsToPixels(NewHeight, YUnitsToPixels!) THEN
		uo_standardscroll.Hide()
	ELSE
		ib_scrollneedsupdating = TRUE
		of_UpdateStandardScroll(NewHeight)
	END IF

	IF SizeType <> 99 THEN
		IF uo_standardscroll.Visible THEN
			uo_standardscroll.Position = ((Abs(il_y)) / of_GetDrawHeight()) * uo_standardscroll.MaxPosition
		END IF
	END IF
END IF

il_lastheight = UnitsToPixels(NewHeight, YUnitsToPixels!)
end event

event mouseenter();SetRedraw(TRUE)
end event

event mousemove;Long ll_index

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
		
else

	ll_index = of_IndexFromPoint(xpos, ypos)
	IF il_index <> ll_index THEN
		of_MouseOver(ll_index)
		
	END IF

end if
end event

event lbuttonup;IF il_index > 0 THEN
	of_SelectButton(ist_buttons[il_index].al_index)
END IF
end event

event type long selectionchanging(long oldindex, long newindex);//Return 0 to cancel change
RETURN 1
end event

event timer;IF ib_scrollingup THEN
	of_ScrollUp(FALSE)
END IF

IF ib_scrollingdown THEN
	of_ScrollDown(FALSE)
END IF
end event

public function long of_getcolor (string as_color);IF il_CurrentStyle = VS2013 THEN
	CHOOSE CASE Upper(as_color)
		CASE 'HOVERSELECTED1', 'HOVERSELECTED2'	
			RETURN RGB(155,167, 183)//RGB(91, 113, 153)
		CASE 'HOVER1', 'HOVER2'
			RETURN RGB(155,167, 183)//RGB(91, 113, 153)
		CASE 'SELECTED1', 'SELECTED2'
			RETURN RGB(70,90,125)//RGB(255, 242, 157)
		CASE "BACKGROUND1", "BACKGROUND2"
			RETURN RGB(54, 78, 111)
		CASE "BORDER", "ITEMBORDER"
			RETURN RGB(41, 57, 85)
		CASE 'TEXTSELECTED', 'ITEMTEXT'
			RETURN RGB(255,255,255)
	END CHOOSE
END IF

IF NOT IsValid(inv_color_theme) THEN
	RETURN 0
END IF

IF Pos(Upper(is_CurrentTheme), "WINDOWS", 1) = 0 THEN
	IF il_CurrentStyle = GRADIENTLIST THEN
		RETURN inv_color_theme.of_GetColor(inv_color_theme.ShortcutBar, as_color)
	END IF
END IF


RETURN inv_color_theme.of_GetColor(inv_color_theme.ButtonListbar, as_color)
end function

public function integer of_reorganize (long al_y);Long ll_index, ll_count, ll_y

il_y = al_y
ll_y = al_y

IF il_y >= 0 THEN
	il_y = 0
	uo_standardscroll.of_SetPosition(0)
END IF

IF NOT StandardScrollbar THEN

	IF ll_y > Height THEN
		uo_scrolldown.Show()
	ELSE
		uo_scrolldown.Hide()	
	END IF
	
	IF il_y < 0 THEN
		uo_scrollup.Show()
	ELSE
		uo_scrollup.Hide()
	END IF
END IF

ib_dirty = TRUE
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_scrolldown ();ib_scrollingup = FALSE
ib_scrollingdown = TRUE

iuo_scrolltimer.Start(.1)

RETURN 1

//RETURN of_ScrollDown(FALSE)
end function

public function integer of_scrollup ();ib_scrollingup = TRUE
ib_scrollingdown = FALSE

iuo_scrolltimer.Start(.1)

RETURN 1

//RETURN of_ScrollUp(FALSE)
end function

public function integer of_settheme (string as_color);
IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_color
is_CurrentTheme = as_color
ib_dirty = TRUE

ib_windows8 = Left(Lower(as_color), 7) = 'windows' OR Left(Lower(as_color), 12) = 'powerbuilder'

uo_standardscroll.of_SetSliderColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1'))

SetRedraw(TRUE)
RETURN 1
end function

public function integer of_addimage (string as_image);Long ll_item

IF Len(Trim(as_image)) = 0 THEN
	RETURN 0
END IF

message l_message

l_message = CREATE Message
l_message.Handle = Message.Handle
l_message.Number = Message.Number
l_message.WordParm = Message.WordParm
l_message.LongParm = Message.LongParm
l_message.DoubleParm = Message.DoubleParm
l_message.StringParm = Message.StringParm
l_message.PowerObjectParm = Message.PowerObjectParm
l_message.Processed = Message.Processed
l_message.ReturnValue = Message.ReturnValue

ll_item = UpperBound(is_images) + 1

is_images[ll_item] = as_image

Long ll_index
	
ll_index = inv_imagelist.of_AddImage(as_image)

il_imagelistsmall = inv_imagelist.of_GetSmallHandle()
il_imagelistmedium = inv_imagelist.of_GetMediumHandle()
il_imagelistlarge = inv_imagelist.of_GetLargeHandle()
il_imagelistxlarge = inv_imagelist.of_GetXLargeHandle()

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


Message.Handle = l_message.Handle
Message.Number = l_message.Number
Message.WordParm = l_message.WordParm
Message.LongParm = l_message.LongParm
Message.DoubleParm = l_message.DoubleParm
Message.StringParm = l_message.StringParm
Message.PowerObjectParm = l_message.PowerObjectParm
Message.Processed = l_message.Processed
Message.ReturnValue = l_message.ReturnValue


RETURN ll_index

end function

public function integer of_setsize (integer ai_size);il_CurrentSize = ai_size

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

ib_scrollneedsupdating = TRUE
il_y = 0
ib_dirty = TRUE
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_updatepoints ();CHOOSE CASE il_CurrentStyle
	CASE BUTTON
		RETURN of_UpdatePointsButton()
	CASE LIST, VS2013
		RETURN of_UpdatePointsList()
	CASE GRADIENTLIST
		RETURN of_UpdatePointsGradientList()
	CASE SOLIDLIST
		RETURN of_UpdatePointsSOLIDList()
END CHOOSE

RETURN 0
end function

public function integer of_indexfrompoint (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
long lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

ll_count = UPPERBOUND(ist_buttons)
FOR ll_index = 1 to ll_count
	//skip if disabled
	IF NOT ist_buttons[ll_index].ab_enabled THEN CONTINUE
	lul_rgn = inv_win32.CreatePolygonRgn(ist_buttons[ll_index].ast_point, UPPERBOUND(ist_buttons[ll_index].ast_point), 1)
	IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
		inv_win32.DeleteObject(lul_rgn)
		RETURN ll_index
	ELSE
		inv_win32.DeleteObject(lul_rgn)
	END IF
NEXT

RETURN -1
end function

public function integer of_mouseover (long al_index);IF il_index > 0 THEN
	IF il_selected = il_index THEN
		ist_buttons[il_index].ab_mouseover = FALSE
		ist_buttons[il_index].ab_selected = TRUE
		ist_buttons[il_index].al_backcolor1 = of_GetColor('SELECTED1')
		IF il_CurrentStyle = SOLIDLIST THEN
			ist_buttons[il_index].al_backcolor1 = of_GetColor('SELECTED2')
		END IF
		
		ist_buttons[il_index].al_backcolor2 = of_GetColor('SELECTED2')
	ELSE
		ist_buttons[il_index].ab_mouseover = FALSE
		ist_buttons[il_index].ab_selected = FALSE
		ist_buttons[il_index].al_backcolor1 = of_GetColor('BACKGROUND1')
		IF il_CurrentStyle = SOLIDLIST THEN
	 		ist_buttons[il_index].al_backcolor1 = of_GetColor('BACKGROUND2')
		END IF
		
		ist_buttons[il_index].al_backcolor2 = of_GetColor('BACKGROUND2')

	END IF

	
	IF ist_buttons[il_index].ab_selected THEN
		ist_buttons[il_index].al_textcolor = of_GetColor('TEXTSELECTED')
	ELSE
		ist_buttons[il_index].al_textcolor = of_GetColor('ITEMTEXT')
	END IF
END IF

IF al_index > 0 THEN
	IF il_selected = al_index THEN
		ist_buttons[al_index].ab_mouseover = TRUE
		ist_buttons[al_index].ab_selected = TRUE
		ist_buttons[al_index].al_backcolor1 = of_GetColor('HOVERSELECTED1')
		IF il_CurrentStyle = SOLIDLIST THEN
			ist_buttons[al_index].al_backcolor1 = of_GetColor('HOVERSELECTED2')
		END IF
		
		ist_buttons[al_index].al_backcolor2 = of_GetColor('HOVERSELECTED2')
		
	ELSE
		ist_buttons[al_index].ab_mouseover = TRUE
		ist_buttons[al_index].ab_selected = FALSE
		ist_buttons[al_index].al_backcolor1 = of_GetColor('HOVER1')
		IF il_CurrentStyle = SOLIDLIST THEN
			ist_buttons[al_index].al_backcolor1 = of_GetColor('HOVER2')
		END IF
		
		ist_buttons[al_index].al_backcolor2 = of_GetColor('HOVER2')

	END IF

	IF ist_buttons[al_index].ab_selected AND ist_buttons[al_index].ab_mouseover = FALSE THEN
		ist_buttons[al_index].al_textcolor = of_GetColor('TEXTSELECTED')
	ELSEIF ist_buttons[al_index].ab_mouseover = TRUE THEN
		ist_buttons[al_index].al_textcolor = of_GetColor('ITEMTEXTHOVER')
	ELSE
		ist_buttons[al_index].al_textcolor = of_GetColor('ITEMTEXT')
	END IF
END IF	

il_index = al_index

ib_dirty = FALSE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_mouseleave ();IF il_index > 0 THEN
	IF il_selected = il_index THEN
		
		ist_buttons[il_index].ab_mouseover = FALSE
		ist_buttons[il_index].al_backcolor1 = of_GetColor('SELECTED1')
		
		IF il_currentstyle = SOLIDLIST THEN
			ist_buttons[il_index].al_backcolor1 = of_GetColor('SELECTED2')
		END IF
		ist_buttons[il_index].al_backcolor2 = of_GetColor('SELECTED2')
	ELSE
		ist_buttons[il_index].ab_selected = FALSE
		ist_buttons[il_index].ab_mouseover = FALSE
		ist_buttons[il_index].al_backcolor1 = of_GetColor('BACKGROUND1')
		
		IF il_currentstyle = SOLIDLIST THEN
			ist_buttons[il_index].al_backcolor1 = of_GetColor('BACKGROUND2')
		END IF
		ist_buttons[il_index].al_backcolor2 = of_GetColor('BACKGROUND2')
	END IF
	
	IF ist_buttons[il_index].ab_selected THEN
		ist_buttons[il_index].al_textcolor = of_GetColor('TEXTSELECTED')
	ELSE
		ist_buttons[il_index].al_textcolor = of_GetColor('ITEMTEXT')
	END IF
END IF

il_index = 0

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setenabled (long al_index, boolean ab_enabled);Long ll_index, ll_count
Boolean lb_found

ll_count = UpperBound(ist_buttons)

IF al_index < 1 THEN RETURN 0

FOR ll_index = 1 TO ll_count
	IF ist_buttons[ll_index].al_index = al_index THEN
		ist_buttons[ll_index].ab_enabled = ab_enabled
		lb_found = TRUE
		EXIT
	END IF
NEXT

IF NOT lb_found THEN
	ll_count = UpperBound(ist_hiddenbuttons)
	
	FOR ll_index = 1 TO ll_count
		IF ist_hiddenbuttons[ll_index].al_index = al_index THEN
			ist_hiddenbuttons[ll_index].ab_enabled = ab_enabled
			EXIT
		END IF
	NEXT
END IF

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_setenabled (string as_text, boolean ab_enabled);Long ll_index, ll_count

ll_count = UpperBound(ist_buttons)

FOR ll_index = 1 TO ll_count
	IF Lower(ist_buttons[ll_index].as_text) = Lower(as_text) THEN
		RETURN of_SetEnabled(ist_buttons[ll_index].al_index, ab_enabled)
	END IF
NEXT

//Search hidden collection
ll_count = UpperBound(ist_hiddenbuttons)

FOR ll_index = 1 TO ll_count
	IF Lower(ist_hiddenbuttons[ll_index].as_text) = Lower(as_text) THEN
		RETURN of_SetEnabled(ist_hiddenbuttons[ll_index].al_index, ab_enabled)
	END IF
NEXT

RETURN 0
end function

public function string of_gettext (long al_index);RETURN ist_buttons[of_GetArrayPosition(al_index)].as_text
end function

public function integer of_selectbutton (string as_text);Long ll_index, ll_count

ll_count = UpperBound(ist_buttons)

FOR ll_index = 1 TO ll_count
	IF Lower(ist_buttons[ll_index].as_text) = Lower(as_text) THEN
		RETURN of_SelectButton(ll_index)
	END IF
NEXT

RETURN 0
end function

public function integer of_setscrollspeed (long al_speed);il_speed = al_speed
RETURN 1
end function

public function integer of_additem (string as_text, string as_image, any aa_data);//////////////////////////////////////////////////////////////////////////////////////////
//
// Description : Overloaded of_AddItem to accommodate the DATA parameter w/c mimics the 
//					  DATA property of a Treeviewitem or ListviewItem. This will hold the information
//					  on which object or data to be opened or how to be opened from by the 
//               parent window/object
//
//////////////////////////////////////////////////////////////////////////////////////////
Integer	i_retval
Integer ll_index

i_retval = this.of_additem( as_text, as_image )

ll_index = of_Getarrayposition(i_retval)

ist_buttons[ll_index].ia_data = aa_data

RETURN i_retval
end function

public function any of_getdata (integer ai_index);//////////////////////////////////////////////////////////////////////////////////////////
//
// Description : Obtains the property DATA(Any) per item link of this UO 
//
//////////////////////////////////////////////////////////////////////////////////////////
any a_null

SetNull(a_null)

IF ai_index <= 0 THEN RETURN a_null

RETURN ist_buttons[of_GetArrayPosition(ai_index)].ia_data
end function

public function window of_getparentwindow ();PowerObject	po_parent
window		w_parent

IF IsValid(iw_parent) THEN RETURN iw_parent

po_parent = GetParent()

do while IsValid (po_parent) and po_parent.TypeOf() <> window! 
	po_parent = po_parent.GetParent()
loop

IF IsValid(po_parent) THEN
	w_parent = po_parent
ELSE
	SetNull(w_parent)
END IF

iw_parent = w_parent

RETURN w_parent
end function

public function long of_additem (string as_text, string as_image);Long ll_item

ll_item = UpperBound(ist_buttons) + 1
il_nextindex++

ist_buttons[ll_item].as_text = as_text
IF Len(Trim(as_image)) > 0 THEN
	ist_buttons[ll_item].al_image = of_AddImage(as_image)
END IF
ist_buttons[ll_item].ab_enabled = TRUE
ist_buttons[ll_item].al_index = il_nextindex
ist_buttons[ll_item].ab_invalid = FALSE

ist_buttons[ll_item].ast_point[1].px = 0
ist_buttons[ll_item].ast_point[1].py = 0
ist_buttons[ll_item].ast_point[2].px = 0
ist_buttons[ll_item].ast_point[2].py = 0
ist_buttons[ll_item].ast_point[3].px = 0
ist_buttons[ll_item].ast_point[3].py = 0
ist_buttons[ll_item].ast_point[4].px = 0
ist_buttons[ll_item].ast_point[4].py = 0

ib_scrollneedsupdating = TRUE

of_Reorganize(il_y)

SetRedraw(TRUE)

RETURN il_nextindex
end function

public function integer of_settext (string as_item, string as_text);Long ll_index, ll_count

ll_count = UpperBound(ist_buttons)

FOR ll_index = 1 TO ll_count
	IF ist_buttons[ll_index].as_text = as_text THEN
		RETURN of_SetText(ist_buttons[ll_index].al_index, as_text)
	END IF
NEXT

//Search hidden buttons
ll_count = UpperBound(ist_hiddenbuttons)

FOR ll_index = 1 TO ll_count
	IF ist_hiddenbuttons[ll_index].as_text = as_text THEN
		RETURN of_SetText(ist_hiddenbuttons[ll_index].al_index, as_text)
	END IF
NEXT

RETURN 0
end function

public function integer of_gettextwidth (string as_text);LongPtr lul_Handle, lul_hDC, lul_hFont
SIZE lstr_size

lul_Handle = Handle(st_pbus_buttonlistbarlabel)
lul_hDC = inv_win32.GetDC(lul_Handle)
// get handle to the font used by statictext
lul_hFont = Send(lul_Handle, WM_GETFONT, 0, 0)
// Select it into the device context
inv_win32.SelectObject(lul_hDC, lul_hFont)

inv_win32.GetTextExtentPoint32(lul_hDC, as_text, Len(as_text), lstr_Size)
inv_win32.ReleaseDC(lul_Handle, lul_hDC)

RETURN lstr_Size.cx + ScaleDPI(4)
 
end function

public function integer of_setstyle (long al_style);il_currentstyle = al_style

il_y = 0
uo_standardscroll.of_SetPosition(0)
ib_scrollneedsupdating = TRUE
ib_dirty = true

SetRedraw(TRUE)

RETURN 1

end function

public function integer of_updatepointsbutton ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth
Long ll_width, ll_height
LongPtr ll_dc
point lp_empty[]
n_uspb_text_helper lnv_texthelper
Integer li_newHeight
Integer li_multipassindex, li_multipasscount
		
ll_count = UpperBound(ist_buttons)

li_multipasscount = 1
IF StandardScrollbar THEN li_multipasscount = 2

FOR li_multipassindex = 1 TO li_multipasscount
	IF il_CurrentOrientation = VERTICAL THEN
		ll_y = il_y +  ScaleDPI(10)
		ll_x = ScaleDPI(10)
		ll_width = UnitsToPixels(Width, XUnitsToPixels!)
		ll_height = ScaleDPI( il_CurrentSize)
	ELSE
		ll_y = ScaleDPI( 10)
		ll_x = ScaleDPI(10)
		ll_width = ScaleDPI(il_CurrentSize)
		ll_height = UnitsToPixels(Height, YUnitsToPixels!)
	END IF
	
	ll_dc = inv_win32.GetDC(Handle(st_pbus_buttonlistbarlabel))
	
	lnv_texthelper.of_SetHDC(ll_dc)
	
	IF li_multipassindex > 1 THEN
		IF NOT uo_standardscroll.Visible THEN EXIT
		
		IF ib_rtl THEN
			ll_x = ll_x + UnitsToPixels(uo_standardscroll.Width, XUnitsToPixels!) - ScaleDPI(5)
			ll_width = ll_width  + ScaleDPI(5)
		ELSE
			ll_width = ll_width - UnitsToPixels(uo_standardscroll.Width, XUnitsToPixels!) + ScaleDPI(5)
		END IF
	END IF
	
	FOR ll_index = 1 TO ll_count
		IF ist_buttons[ll_index].ab_Invalid THEN
			CONTINUE
		END IF
		
		ist_buttons[ll_index].ast_point = lp_empty
		
		IF il_index = ll_index THEN
			IF il_selected = ll_index THEN
				ist_buttons[ll_index].ab_selected = TRUE
				ist_buttons[ll_index].ab_mouseover = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVERSELECTED1')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVERSELECTED2')
			ELSE
				ist_buttons[ll_index].ab_selected = FALSE
				ist_buttons[ll_index].ab_mouseover = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVER1')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVER2')
			END IF
		ELSE
			IF il_selected = ll_index THEN
				ist_buttons[ll_index].ab_mouseover = FALSE
				ist_buttons[ll_index].ab_selected = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('SELECTED1')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('SELECTED2')
			ELSE
				ist_buttons[ll_index].ab_mouseover = FALSE
				ist_buttons[ll_index].ab_selected = FALSE
				ist_buttons[ll_index].al_backcolor1 = 0
				ist_buttons[ll_index].al_backcolor2 = 0
			END IF
		END IF
		
		IF ist_buttons[ll_index].ab_selected THEN
			ist_buttons[ll_index].al_textcolor = of_GetColor('TEXTSELECTED')
		ELSE
			ist_buttons[ll_index].al_textcolor = of_GetColor('ITEMTEXT')
		END IF
		
		
		IF il_CurrentOrientation = VERTICAL THEN
	
			li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, ist_buttons[ll_index].as_text, FontName, FontSize, lnv_texthelper.ALIGN_CENTER, ll_width - ll_x - ll_x, FALSE, FALSE, TRUE)
			ll_height = ScaleDPI( il_CurrentSize) + li_newHeight + ScaleDPI(2)
			
			ist_buttons[ll_index].al_textheight = li_newHeight
			
			ist_buttons[ll_index].ast_point[1].px = ll_x
			ist_buttons[ll_index].ast_point[1].py = ll_y
			ist_buttons[ll_index].ast_point[2].px = ll_width - ll_x
			ist_buttons[ll_index].ast_point[2].py = ll_y
			ist_buttons[ll_index].ast_point[3].px = ll_width - ll_x
			ist_buttons[ll_index].ast_point[3].py = ll_y + ll_height + ScaleDPI(10)
			ist_buttons[ll_index].ast_point[4].px = ll_x
			ist_buttons[ll_index].ast_point[4].py = ll_y + ll_height + ScaleDPI(10)
			
			ll_y = ll_y + ll_height + ScaleDPI(12)
		ELSE
			
			ll_textwidth = of_GetTextWidth(ist_buttons[ll_index].as_text)
			
			IF ScaleDPI(il_CurrentSize) > ll_textwidth THEN
				ll_width = ScaleDPI(il_CurrentSize)
			ELSE
				ll_width = ll_textwidth
			END IF
			
			ist_buttons[ll_index].ast_point[1].px = ll_x
			ist_buttons[ll_index].ast_point[1].py = ll_y
			ist_buttons[ll_index].ast_point[2].px = ll_width + ll_x
			ist_buttons[ll_index].ast_point[2].py = ll_y
			ist_buttons[ll_index].ast_point[3].px = ll_width + ll_x
			ist_buttons[ll_index].ast_point[3].py = ll_height - ll_y
			ist_buttons[ll_index].ast_point[4].px = ll_x
			ist_buttons[ll_index].ast_point[4].py = ll_height - ll_y
			
			ll_x = ll_x + ll_width + ScaleDPI(12)
		END IF
	
	NEXT
	
	inv_win32.ReleaseDC (Handle(st_pbus_buttonlistbarlabel), ll_dc)
	
	IF StandardScrollbar THEN
		IF PixelsToUnits(ll_y + Abs(il_y), YPixelsToUnits!) >= Height THEN
			of_UpdateStandardScroll(Height)
			uo_standardscroll.Show()
		ELSE
			uo_standardscroll.Hide()
		END IF
	ELSE
		IF PixelsToUnits(ll_y, YPixelsToUnits!) >= Height THEN
			uo_scrolldown.Show()
		ELSE
			uo_scrolldown.Hide()
		END IF
	END IF
NEXT

RETURN 1
end function

public function integer of_updatepointslist ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item
Long ll_width, ll_height
LongPtr ll_dc
point lp_empty[]
n_uspb_text_helper lnv_texthelper
Integer li_newHeight
Integer li_multipassindex, li_multipasscount

ll_count = UpperBound(ist_buttons)

li_multipasscount = 1
IF StandardScrollbar THEN li_multipasscount = 2

FOR li_multipassindex = 1 TO li_multipasscount
	ll_y = il_y + ScaleDPI(10)
	ll_x = inv_win32.ScaleX(Handle(THIS), 10)
	ll_width = UnitsToPixels(Width, XUnitsToPixels!)
	ll_height = inv_win32.ScaleY(Handle(THIS), il_CurrentSize)
	
	ll_dc = inv_win32.GetDC(Handle(st_pbus_buttonlistbarlabel))
	lnv_texthelper.of_SetHDC(ll_dc)

	IF li_multipassindex > 1 THEN
		IF NOT uo_standardscroll.Visible THEN EXIT
		
		IF ib_rtl THEN
			ll_x = ll_x + UnitsToPixels(uo_standardscroll.Width, XUnitsToPixels!) - ScaleDPI(5)
			ll_width = ll_width  + ScaleDPI(5)
		ELSE
			ll_width = ll_width - UnitsToPixels(uo_standardscroll.Width, XUnitsToPixels!) + ScaleDPI(5)
		END IF
	END IF
	
	FOR ll_index = 1 TO ll_count
		IF ist_buttons[ll_index].ab_Invalid THEN
			CONTINUE
		END IF
		
		ll_item++
		ist_buttons[ll_index].ast_point = lp_empty
		
		ist_buttons[ll_index].al_textcolor = of_GetColor('ITEMTEXT')
		
		IF il_index = ll_index THEN
			IF il_selected = ll_index THEN
				ist_buttons[ll_index].ab_selected = TRUE
				ist_buttons[ll_index].ab_mouseover = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVERSELECTED1')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVERSELECTED2')
			ELSE
				ist_buttons[ll_index].ab_selected = FALSE
				ist_buttons[ll_index].ab_mouseover = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVER1')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVER2')
			END IF
		ELSE
			IF il_selected = ll_index THEN
				ist_buttons[ll_index].ab_mouseover = FALSE
				ist_buttons[ll_index].ab_selected = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('SELECTED1')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('SELECTED2')
				ist_buttons[ll_index].al_textcolor = of_GetColor('TEXTSELECTED')
			ELSE
				ist_buttons[ll_index].ab_mouseover = FALSE
				ist_buttons[ll_index].ab_selected = FALSE
				ist_buttons[ll_index].al_backcolor1 = 0
				ist_buttons[ll_index].al_backcolor2 = 0
			END IF
		END IF
		
		li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, ist_buttons[ll_index].as_text, FontName, FontSize, lnv_texthelper.ALIGN_LEFT, ll_width - ll_x - ll_x - il_CurrentSize - 8, FALSE, FALSE, TRUE)
		
		IF li_newHeight > inv_win32.ScaleY(Handle(THIS), il_CurrentSize) THEN
			ll_height = li_newHeight + inv_win32.ScaleY(Handle(THIS), 4)
		ELSE
			ll_height = inv_win32.ScaleY(Handle(THIS), il_CurrentSize + 4)
		END IF
		
		ist_buttons[ll_index].al_textheight = li_newHeight
		ist_buttons[ll_index].al_textwidth = ll_width - ll_x - ll_x - inv_win32.ScaleX(Handle(THIS), il_CurrentSize - 8)
		
		ist_buttons[ll_index].ast_point[1].px = ll_x
		ist_buttons[ll_index].ast_point[1].py = ll_y
		ist_buttons[ll_index].ast_point[2].px = ll_width - ll_x
		ist_buttons[ll_index].ast_point[2].py = ll_y
		ist_buttons[ll_index].ast_point[3].px = ll_width - ll_x
		ist_buttons[ll_index].ast_point[3].py = ll_y + ll_height
		ist_buttons[ll_index].ast_point[4].px = ll_x
		ist_buttons[ll_index].ast_point[4].py = ll_y + ll_height
		
		ll_y = ll_y + ll_height + inv_win32.ScaleY(Handle(THIS), 2)
	
	NEXT
	
	inv_win32.ReleaseDC (Handle(st_pbus_buttonlistbarlabel), ll_dc)
	
	IF StandardScrollbar THEN
		IF PixelsToUnits(ll_y + Abs(il_y), YPixelsToUnits!) >= Height THEN
			of_UpdateStandardScroll(Height)
			uo_standardscroll.Show()
		ELSE
			uo_standardscroll.Hide()
		END IF
	ELSE
		IF PixelsToUnits(ll_y, YPixelsToUnits!) >= Height THEN
			uo_scrolldown.Show()
		ELSE
			uo_scrolldown.Hide()
		END IF
	END IF
NEXT
RETURN 1
end function

public function integer of_reset ();Buttons l_buttons[], l_hiddenbuttons[]
String ls[]
Any a_data[]

il_y = 0
uo_standardscroll.of_SetPosition(0)
ist_buttons = l_buttons
ist_hiddenbuttons = l_hiddenbuttons

il_index = 0
il_selected = 0
il_nextindex = 0
ib_mousecaptured = FALSE
is_images = ls
ib_scrollneedsupdating = TRUE

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_getdrawheight ();RETURN of_GetDrawHeight(0)
end function

public function integer of_removeitem (string as_text);Long ll_index, ll_count

ll_count = UpperBound(ist_buttons)

FOR ll_index = 1 TO ll_count
	IF Lower(ist_buttons[ll_index].as_text) = Lower(as_text) THEN
		RETURN of_RemoveItem(ist_buttons[ll_index].al_index)
	END IF
NEXT

RETURN 0
end function

public function integer of_scrollup (boolean ab_autoscroll);Long ll_index, ll_count
Long ll_increment

IF StandardScrollbar THEN RETURN 0

ll_count = UpperBound(ist_buttons)

IF ab_autoscroll THEN
	ll_increment = 50
ELSE
	ll_increment = il_speed
END IF

il_y = il_y + ll_increment

FOR ll_index = 1 TO ll_count
	ist_buttons[ll_index].ast_point[1].py = ist_buttons[ll_index].ast_point[1].py + ll_increment
	ist_buttons[ll_index].ast_point[2].py = ist_buttons[ll_index].ast_point[2].py + ll_increment
	ist_buttons[ll_index].ast_point[3].py = ist_buttons[ll_index].ast_point[3].py + ll_increment
	ist_buttons[ll_index].ast_point[4].py = ist_buttons[ll_index].ast_point[4].py + ll_increment
NEXT

IF ist_buttons[1].ast_point[1].py < 0 THEN
	uo_scrollup.Show()
ELSE
	uo_scrollup.Hide()
	il_y = 0
	of_Reorganize(il_y)
END IF

IF PixelsToUnits(ist_buttons[ll_count].ast_point[4].py, YPixelsToUnits!) > Height THEN
	uo_scrolldown.Show()
ELSE
	uo_scrolldown.Hide()
	iuo_scrolltimer.Stop()
	ib_scrollingup = FALSE
END IF

ib_dirty = FALSE
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_scrolldown (boolean ab_autoscroll);Long ll_index, ll_count
Long ll_increment

IF StandardScrollbar THEN RETURN 0

ll_count = UpperBound(ist_buttons)

IF	ab_autoscroll THEN
	ll_increment = 50
ELSE
	ll_increment = il_speed
END IF

il_y = il_y - ll_increment

FOR ll_index = 1 TO ll_count
	ist_buttons[ll_index].ast_point[1].py = ist_buttons[ll_index].ast_point[1].py - ll_increment
	ist_buttons[ll_index].ast_point[2].py = ist_buttons[ll_index].ast_point[2].py - ll_increment
	ist_buttons[ll_index].ast_point[3].py = ist_buttons[ll_index].ast_point[3].py - ll_increment
	ist_buttons[ll_index].ast_point[4].py = ist_buttons[ll_index].ast_point[4].py - ll_increment
NEXT

IF ist_buttons[1].ast_point[1].py < 10 THEN
	uo_scrollup.Show()
ELSE
	uo_scrollup.Hide()
	il_y = 0
	of_Reorganize(il_y)
END IF

IF PixelsToUnits(ist_buttons[ll_count].ast_point[4].py, YPixelsToUnits!) > Height THEN
	uo_scrolldown.Show()
ELSE
	uo_scrolldown.Hide()
	iuo_scrolltimer.Stop()
	ib_scrollingdown = FALSE
END IF

ib_dirty = FALSE
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_selectbutton (long al_index);Long ll_old, ll_index, ll_count
Long ll_array_selected
Long ll_current_index

ll_array_selected = of_GetArrayPosition(al_index)

IF al_index <= 0 THEN RETURN 0
IF NOT ist_buttons[ll_array_selected].ab_Enabled THEN RETURN 0

IF il_selected > 0 AND il_selected <= UpperBound(ist_buttons) THEN
	ll_current_index = ist_buttons[il_selected].al_index
END IF

IF Event SelectionChanging(ll_current_index, al_index) = 1 THEN
	ll_old = il_selected
	il_selected = ll_array_selected
	
	IF il_selected <> ll_old THEN
		ist_buttons[ll_array_selected].ab_mouseover = FALSE
		ist_buttons[ll_array_selected].ab_selected = TRUE
		ist_buttons[ll_array_selected].al_backcolor1 = of_GetColor('SELECTED1')
		IF il_currentstyle = SOLIDLIST THEN
			ist_buttons[ll_array_selected].al_backcolor1 = of_GetColor('SELECTED2')
		END IF
		
		ist_buttons[ll_array_selected].al_backcolor2 = of_GetColor('SELECTED2')

		ist_buttons[ll_array_selected].al_textcolor = of_GetColor('TEXTSELECTED')
	END IF
	
	IF ll_old > 0 AND ll_old <> il_selected THEN
		ist_buttons[ll_old].ab_mouseover = FALSE
		ist_buttons[ll_old].ab_selected = FALSE
		ist_buttons[ll_old].al_backcolor1 = of_GetColor('BACKGROUND1')
		IF il_currentstyle = SOLIDLIST THEN
	 		ist_buttons[ll_old].al_backcolor1 = of_GetColor('BACKGROUND2')
		END IF
		
		ist_buttons[ll_old].al_backcolor2 = of_GetColor('BACKGROUND2')

		ist_buttons[ll_old].al_textcolor = of_GetColor('ITEMTEXT')
	END IF

	SetRedraw(TRUE)
	
	IF ll_old > 0 THEN
		ll_old = ist_buttons[ll_old].al_index
	END IF
	
	EVENT SelectionChanged(ll_old, ist_buttons[il_selected].al_index)
	
END IF

RETURN 1
end function

public function integer of_removeitem (long al_index);Long l_index, l_count, l_newindex
Long l_foundindex
Buttons str_buttons[], str_hiddenbuttons[]
any       a_data[]

l_count = Upperbound( ist_buttons )

IF al_index < 1 THEN RETURN 0

FOR l_index = 1 TO l_count
	IF ist_buttons[l_index].al_index = al_index THEN
		l_foundindex = l_index
	ELSE
        l_newindex++
        
        str_buttons[l_newindex] = ist_buttons[l_index]
    END IF
NEXT

ist_buttons = str_buttons

//Not found but might be in the hidden collection
IF l_foundindex = 0 THEN
	l_count = Upperbound( ist_hiddenbuttons )
	l_newindex = 0
	
	FOR l_index = 1 TO l_count
		IF ist_hiddenbuttons[l_index].al_index <> al_index THEN
	        l_newindex++
	        
	        str_hiddenbuttons[l_newindex] = ist_hiddenbuttons[l_index]
	    END IF
	NEXT
	
	ist_hiddenbuttons = str_hiddenbuttons
END IF

IF il_selected = l_foundindex THEN
	il_selected = 0
END IF

ib_scrollneedsupdating = TRUE

this.of_reorganize( il_y )

RETURN 1
end function

public function integer of_settext (long al_index, string as_text);Long ll_index, ll_count
Boolean lb_found

ll_count = UpperBound(ist_buttons)

IF al_index < 1 THEN RETURN 0

FOR ll_index = 1 TO ll_count
	
	IF ist_buttons[ll_index].al_index = al_index THEN
		ist_buttons[ll_index].as_text = as_text
		lb_found = TRUE
		EXIT
	END IF
NEXT

IF NOT lb_found THEN
	ll_count = UpperBound(ist_hiddenbuttons)
	
	FOR ll_index = 1 TO ll_count
		IF ist_hiddenbuttons[ll_index].al_index = al_index THEN
			ist_hiddenbuttons[ll_index].as_text = as_text
			EXIT
		END IF
	NEXT
END IF

ib_scrollneedsupdating = TRUE
ib_dirty = TRUE

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_getarrayposition (long al_index);Long ll_index, ll_count

ll_count = UpperBound(ist_buttons)

FOR ll_index = 1 TO ll_count
	IF ist_buttons[ll_index].al_index = al_index THEN
		RETURN ll_index
	END IF
NEXT

RETURN 0
end function

public function long of_settheme (long al_color);CHOOSE CASE al_color
	CASE BLUE
		RETURN of_SetTheme('BLUE')
	CASE SILVER
		RETURN of_SetTheme('SILVER')
	CASE OLIVE
		RETURN of_SetTheme('OLIVE')
	CASE CLASSIC
		RETURN of_SetTheme('CLASSIC')
	CASE WINDOWS8_BLUE
		RETURN of_SetTheme('WINDOWS8_BLUE')
	CASE WINDOWS8_OLIVE
		RETURN of_SetTheme('WINDOWS8_OLIVE')
	CASE WINDOWS8_SILVER
		RETURN of_SetTheme('WINDOWS8_SILVER')
	CASE ELSE
		RETURN of_SetTheme('CLASSIC')
END CHOOSE

RETURN 0
end function

public function integer of_righttoleft (boolean ab_switch);ib_rtl = ab_switch
ib_dirty = TRUE

Trigger Event Resize(0, Width, Height)

SetRedraw(TRUE)

RETURN 1
end function

public function string of_classname ();RETURN "u_cst_buttonlistbar2"
end function

public function integer of_updatepointssolidlist ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item
Long ll_width, ll_height
LongPtr ll_dc
point lp_empty[]
n_uspb_text_helper lnv_texthelper
Integer li_newHeight
Integer li_multipassindex, li_multipasscount

ll_count = UpperBound(ist_buttons)

li_multipasscount = 1
IF StandardScrollbar THEN li_multipasscount = 2

FOR li_multipassindex = 1 TO li_multipasscount

	ll_y = il_y + 1
	ll_x = ScaleDPI(1)
	
	IF Width < 160 THEN
		ll_width = UnitsToPixels(978, XUnitsToPixels!)
	ELSE
		ll_width = UnitsToPixels(Width, XUnitsToPixels!)
	END IF
	
	ll_height = ScaleDPI(il_CurrentSize)
	
	ll_dc = inv_win32.GetDC(Handle(st_pbus_buttonlistbarlabel))
	lnv_texthelper.of_SetHDC(ll_dc)

	IF li_multipassindex > 1 THEN
		IF NOT uo_standardscroll.Visible THEN EXIT
		
		IF ib_rtl THEN
			ll_x = ll_x + UnitsToPixels(uo_standardscroll.Width, XUnitsToPixels!) - ScaleDPI(5)
			ll_width = ll_width  + ScaleDPI(5)
		ELSE
			ll_width = ll_width - UnitsToPixels(uo_standardscroll.Width, XUnitsToPixels!) + ScaleDPI(5)
		END IF
	END IF
	
	FOR ll_index = 1 TO ll_count
		IF ist_buttons[ll_index].ab_Invalid THEN
			CONTINUE
		END IF
		
		ll_item++
		ist_buttons[ll_index].ast_point = lp_empty
		
		ist_buttons[ll_index].al_textcolor = of_GetColor('ITEMTEXT')
		
		IF il_index = ll_index THEN
			IF il_selected = ll_index THEN
				ist_buttons[ll_index].ab_selected = TRUE
				ist_buttons[ll_index].ab_mouseover = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVERSELECTED2')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVERSELECTED2')
			ELSE
				ist_buttons[ll_index].ab_selected = FALSE
				ist_buttons[ll_index].ab_mouseover = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVER2')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVER2')
			END IF
		ELSE
			IF il_selected = ll_index THEN
				ist_buttons[ll_index].ab_mouseover = FALSE
				ist_buttons[ll_index].ab_selected = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('SELECTED2')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('SELECTED2')
				ist_buttons[ll_index].al_textcolor = of_GetColor('TEXTSELECTED')
			ELSE
				ist_buttons[ll_index].ab_mouseover = FALSE
				ist_buttons[ll_index].ab_selected = FALSE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('BACKGROUND2')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('BACKGROUND2')
			END IF
		END IF
		
		li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, ist_buttons[ll_index].as_text, FontName, FontSize, lnv_texthelper.ALIGN_LEFT, ll_width - ll_x - ll_x - il_CurrentSize - 36, FALSE, FALSE, TRUE)
		
		IF li_newHeight > ScaleDPI(il_CurrentSize) THEN
			ll_height = li_newHeight + ScaleDPI(12)
		ELSE
			ll_height = ScaleDPI(il_CurrentSize + 12)
		END IF
	
		ist_buttons[ll_index].al_textheight = li_newHeight
		ist_buttons[ll_index].al_textwidth = ll_width - ll_x - ll_x - ScaleDPI(il_CurrentSize - 36)
		
		ist_buttons[ll_index].ast_point[1].px = ll_x
		ist_buttons[ll_index].ast_point[1].py = ll_y
		ist_buttons[ll_index].ast_point[2].px = ll_width //- ll_x
		ist_buttons[ll_index].ast_point[2].py = ll_y
		ist_buttons[ll_index].ast_point[3].px = ll_width// - ll_x
		ist_buttons[ll_index].ast_point[3].py = ll_y + ll_height
		ist_buttons[ll_index].ast_point[4].px = ll_x
		ist_buttons[ll_index].ast_point[4].py = ll_y + ll_height
		
		ll_y = ll_y + ll_height
	
	NEXT
	
	inv_win32.ReleaseDC (Handle(st_pbus_buttonlistbarlabel), ll_dc)
	
	IF StandardScrollbar THEN
		IF PixelsToUnits(ll_y  + Abs(il_y), YPixelsToUnits!) >= Height THEN
			of_UpdateStandardScroll(Height)
			uo_standardscroll.Show()
		ELSE
			uo_standardscroll.Hide()
		END IF
	ELSE
		IF PixelsToUnits(ll_y, YPixelsToUnits!) >= Height THEN
			uo_scrolldown.Show()
		ELSE
			uo_scrolldown.Hide()
		END IF
	END IF
NEXT

RETURN 1
end function

public function integer of_updatepointsgradientlist ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_item
Long ll_width, ll_height
LongPtr ll_dc
point lp_empty[]
n_uspb_text_helper lnv_texthelper
Integer li_newHeight
Integer li_multipassindex, li_multipasscount

ll_count = UpperBound(ist_buttons)
li_multipasscount = 1
IF StandardScrollbar THEN li_multipasscount = 2

FOR li_multipassindex = 1 TO li_multipasscount
	
	ll_y = il_y + 1
	ll_x = ScaleDPI(1)
	ll_width = UnitsToPixels(Width, XUnitsToPixels!)
	ll_height = ScaleDPI(il_CurrentSize)
	
	ll_dc = inv_win32.GetDC(Handle(st_pbus_buttonlistbarlabel))
	lnv_texthelper.of_SetHDC(ll_dc)
	
	IF li_multipassindex > 1 THEN
		IF NOT uo_standardscroll.Visible THEN EXIT
	
		IF ib_rtl THEN
			ll_x = ll_x + UnitsToPixels(uo_standardscroll.Width, XUnitsToPixels!) - ScaleDPI(5)
			ll_width = ll_width  + ScaleDPI(5)
		ELSE
			ll_width = ll_width - UnitsToPixels(uo_standardscroll.Width, XUnitsToPixels!) + ScaleDPI(5)
		END IF
	END IF
	
	FOR ll_index = 1 TO ll_count
		IF ist_buttons[ll_index].ab_Invalid THEN
			CONTINUE
		END IF

		ll_item++
		ist_buttons[ll_index].ast_point = lp_empty
		
		ist_buttons[ll_index].al_textcolor = of_GetColor('ITEMTEXT')
		
		IF il_index = ll_index THEN
			IF il_selected = ll_index THEN
				ist_buttons[ll_index].ab_selected = TRUE
				ist_buttons[ll_index].ab_mouseover = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVERSELECTED1')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVERSELECTED2')
			ELSE
				ist_buttons[ll_index].ab_selected = FALSE
				ist_buttons[ll_index].ab_mouseover = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('HOVER1')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('HOVER2')
			END IF
		ELSE
			IF il_selected = ll_index THEN
				ist_buttons[ll_index].ab_mouseover = FALSE
				ist_buttons[ll_index].ab_selected = TRUE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('SELECTED1')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('SELECTED2')
				ist_buttons[ll_index].al_textcolor = of_GetColor('TEXTSELECTED')
			ELSE
				ist_buttons[ll_index].ab_mouseover = FALSE
				ist_buttons[ll_index].ab_selected = FALSE
				ist_buttons[ll_index].al_backcolor1 = of_GetColor('BACKGROUND1')
				ist_buttons[ll_index].al_backcolor2 = of_GetColor('BACKGROUND2')
			END IF
		END IF
		
		li_newHeight = lnv_texthelper.of_gettextheight (ll_dc, ist_buttons[ll_index].as_text, FontName, FontSize, lnv_texthelper.ALIGN_LEFT, ll_width - ll_x - ll_x - il_CurrentSize - 12, FALSE, FALSE, TRUE)
		
		IF li_newHeight > ScaleDPI(il_CurrentSize) THEN
			ll_height = li_newHeight + ScaleDPI(12)
		ELSE
			ll_height = ScaleDPI(il_CurrentSize + 12)
		END IF
	
		ist_buttons[ll_index].al_textheight = li_newHeight
		ist_buttons[ll_index].al_textwidth = ll_width - ll_x - ll_x - ScaleDPI(il_CurrentSize - 12)
		
		ist_buttons[ll_index].ast_point[1].px = ll_x
		ist_buttons[ll_index].ast_point[1].py = ll_y
		ist_buttons[ll_index].ast_point[2].px = ll_width //- ll_x
		ist_buttons[ll_index].ast_point[2].py = ll_y
		ist_buttons[ll_index].ast_point[3].px = ll_width// - ll_x
		ist_buttons[ll_index].ast_point[3].py = ll_y + ll_height
		ist_buttons[ll_index].ast_point[4].px = ll_x
		ist_buttons[ll_index].ast_point[4].py = ll_y + ll_height
		
		ll_y = ll_y + ll_height
	
	NEXT

	inv_win32.ReleaseDC (Handle(st_pbus_buttonlistbarlabel), ll_dc)
	
	IF StandardScrollbar THEN
		IF PixelsToUnits(ll_y + Abs(il_y), YPixelsToUnits!) >= Height THEN
			of_UpdateStandardScroll(Height)
			uo_standardscroll.Show()
		ELSE
			uo_standardscroll.Hide()
		END IF
	ELSE
		IF PixelsToUnits(ll_y, YPixelsToUnits!) >= Height THEN
			uo_scrolldown.Show()
		ELSE
			uo_scrolldown.Hide()
		END IF
	END IF
NEXT
RETURN 1
end function

public function integer of_setfontname (string as_fontname);FontName = as_fontname
of_UpdatePoints()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setfontsize (integer ai_fontsize);FontSize = ai_fontsize
of_UpdatePoints()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setvisible (long al_index, boolean ab_visible);Long ll_index, ll_count
Buttons lst_visibleButtons[], lst_hiddenButtons[]

IF NOT ab_visible THEN

	ll_count = UpperBound(ist_buttons)
	
	IF al_index < 1 THEN RETURN 0
	
	FOR ll_index = 1 TO ll_count
		IF ist_buttons[ll_index].al_index = al_index THEN
			ist_hiddenbuttons[UpperBound(ist_hiddenbuttons) + 1] = ist_buttons[ll_index]
		ELSE
			lst_visibleButtons[UpperBound(lst_visibleButtons) + 1] = ist_buttons[ll_index]
		END IF
	NEXT
	
	ist_buttons = lst_visibleButtons
	
ELSE
	ll_count = UpperBound(ist_hiddenbuttons)
	
	IF al_index < 1 THEN RETURN 0
	
	FOR ll_index = 1 TO ll_count
		IF ist_hiddenbuttons[ll_index].al_index = al_index THEN
			//We are re-introducing a previously hidden button. We need to figure out where in the ist_buttonindex to add it
			of_InsertItem(ist_hiddenbuttons[ll_index])
		ELSE
			lst_hiddenButtons[UpperBound(lst_hiddenButtons) + 1] = ist_hiddenbuttons[ll_index]
		END IF
	NEXT
	
	ist_hiddenbuttons = lst_hiddenButtons
END IF

ib_scrollneedsupdating = TRUE
this.of_reorganize( 0 )

RETURN 1
end function

public function integer of_setvisible (string as_text, boolean ab_visible);Long ll_index, ll_count

ll_count = UpperBound(ist_buttons)

FOR ll_index = 1 TO ll_count
	IF Lower(ist_buttons[ll_index].as_text) = Lower(as_text) THEN
		RETURN of_SetVisible(ist_buttons[ll_index].al_index, ab_visible)
	END IF
NEXT

RETURN 0
end function

private function integer of_insertitem (buttons ast_button);Long ll_index, ll_count
buttons lst_newButtons[]
Boolean lb_inserted

ll_count = UpperBound(ist_buttons)

FOR ll_index = 1 TO ll_count
	IF ast_button.al_index < ist_buttons[ll_index].al_index AND NOT lb_inserted THEN
		lst_newButtons[UpperBound(lst_newButtons) + 1] = ast_button
		lb_inserted = TRUE
	END IF
	
	lst_newButtons[UpperBound(lst_newButtons) + 1] = ist_buttons[ll_index]	
NEXT

IF NOT lb_inserted THEN
	lst_newButtons[UpperBound(lst_newButtons) + 1] = ast_button
END IF

ist_buttons = lst_newButtons

RETURN 1
end function

public function integer of_updatestandardscroll (long al_height);	long il_maxDrawHeight
	
	al_height = UnitsToPixels(al_height, YUnitsToPixels!)
	
	il_maxDrawHeight = of_GetDrawHeight()
	
	IF il_maxDrawHeight <= 0 THEN RETURN 0
	
	IF ib_scrollneedsupdating THEN
		uo_standardscroll.of_SetSliderSize( (al_height / il_maxDrawHeight) * al_height, ScaleDPI(10))
		uo_standardscroll.of_SetMaxPosition(al_height)
	END IF
	
	ib_scrollneedsupdating = FALSE
	
	RETURN 1
end function

public function integer of_getdrawheight (integer ai_max);IF UpperBound(ist_buttons) = 0 THEN
	RETURN 0
END IF

IF ai_max <= 0 THEN
	RETURN ist_buttons[UpperBound(ist_buttons)].ast_point[4].py + ScaleDPI(10) + Abs(il_y)
END IF
	
ai_max = Min(ai_max, UpperBound(ist_buttons))	

RETURN ist_buttons[ai_max].ast_point[4].py + ScaleDPI(10) + Abs(il_y)
end function

public function integer of_setstandardscrollbar (boolean ab_switch);IF ab_switch THEN
	uo_scrolldown.Hide()
	uo_scrollup.Hide()
END IF

StandardScrollbar = ab_switch

uo_scrolldown.Hide()
uo_scrollup.Hide()
uo_standardscroll.Hide()

Trigger Event Resize(0, Width, Height)

RETURN 1
end function

event mouseleave();of_MouseLeave()
end event

on u_cst_buttonlistbar.create
int iCurrent
call super::create
this.uo_standardscroll=create uo_standardscroll
this.uo_scrolldown=create uo_scrolldown
this.uo_scrollup=create uo_scrollup
this.st_pbus_buttonlistbarlabel=create st_pbus_buttonlistbarlabel
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_standardscroll
this.Control[iCurrent+2]=this.uo_scrolldown
this.Control[iCurrent+3]=this.uo_scrollup
this.Control[iCurrent+4]=this.st_pbus_buttonlistbarlabel
end on

on u_cst_buttonlistbar.destroy
call super::destroy
destroy(this.uo_standardscroll)
destroy(this.uo_scrolldown)
destroy(this.uo_scrollup)
destroy(this.st_pbus_buttonlistbarlabel)
end on

event onpaint;call super::onpaint;in_Gradient.of_SetHDC(hdc)

IF il_currentstyle = SOLIDLIST THEN
	in_Gradient.of_XPGradient (of_GetColor("BACKGROUND2"), of_GetColor("BACKGROUND2"), THIS,FALSE,of_GetColor("BORDER"), TRUE)	
ELSE
	in_Gradient.of_XPGradient (of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND2"), THIS,TRUE,of_GetColor("BORDER"), TRUE)
END IF

IF ib_dirty THEN
	of_UpdatePoints()
	ib_dirty = FALSE
END IF

Long ll_itemborder

IF il_CurrentStyle = GRADIENTLIST THEN
	ll_itemborder = of_GetColor("BORDER")
ELSE
	ll_itemborder = of_GetColor("ITEMBORDER")
END IF

in_Gradient.of_DrawButtons (THIS, ist_buttons, ll_itemborder, il_imagelist, ib_boldselected, il_CurrentSize, UnitsToPixels(Height, YUnitsToPixels!), il_currentstyle, ib_RTL, ib_windows8, FontName, FontSize)

of_DrawEval(hdc)

RETURN 1
end event

event constructor;call super::constructor;Long ll_color1, ll_color2, ll_index

uo_standardscroll.width = PixelsToUnits(ScaleDPI(10), XPixelsToUnits!)

IF Len(Trim(is_CurrentTheme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(is_CurrentTheme)
END IF

iuo_scrolltimer = CREATE n_uspb_scroll_timer
iuo_scrolltimer.of_SetUO(THIS)

IF Height > Width THEN
	il_CurrentOrientation = VERTICAL
ELSE
	il_CurrentOrientation = HORIZONTAL
END IF

TriggerEvent('resize')

of_GetParentWindow()

IF iw_parent.RightToLeft THEN
	of_RightToLeft(TRUE)
END IF
end event

event destructor;call super::destructor;IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
IF IsValid(iuo_scrolltimer) THEN DESTROY iuo_scrolltimer

end event

event wm_mousewheel;call super::wm_mousewheel;Int il_delta
il_delta = (wParam / 65536)

IF uo_standardscroll.Visible THEN
	Integer il_drawheight
	integer il_newY
	
	il_drawheight = of_GetDrawHeight()
	
	IF il_delta < 0 THEN
		il_newY = il_y - UnitsToPixels(50, YUnitsToPixels!)
	ELSE
		il_newY = il_y + UnitsToPixels(50, YUnitsToPixels!)
	END IF
	
	IF Abs(il_newY) + UnitsToPixels(Height, YUnitsToPixels!) >= il_drawheight THEN
		il_newY = UnitsToPixels(Height, YUnitsToPixels!) - il_drawheight// - ScaleDPI(10)
	END IF
	
	IF il_newY > 0 THEN
		il_newY = 0
	END IF
	
	of_Reorganize(il_newY)
	
	IF il_drawheight > 0 THEN
		uo_standardscroll.of_SetPosition((Abs(il_y) / of_GetDrawHeight()) * uo_standardscroll.MaxPosition)
	END IF
	
	RETURN
END IF

IF il_delta < 0 THEN
	IF uo_scrolldown.Visible THEN
		of_Reorganize(il_y - 50)
	END IF
ELSE
	IF uo_scrollup.Visible THEN
		of_Reorganize(il_y + 50)
	END IF
END IF
end event

type uo_standardscroll from u_cst_standardscroll within u_cst_buttonlistbar
integer x = 366
integer y = 240
integer width = 69
integer taborder = 20
end type

on uo_standardscroll.destroy
call u_cst_standardscroll::destroy
end on

event moved;call super::moved;Long ll_y

ll_y = (Double(of_GetDrawHeight()) * (Double(Position + 1) / Double(MaxPosition))) * -1

IF ll_y > 0 OR Position <= 0 THEN
	ll_y = 0
ELSE
//	ll_y = ll_y - ScaleDPI(10)
END IF

of_Reorganize(ll_y)
end event

type uo_scrolldown from u_cst_buttonlistbarscroll within u_cst_buttonlistbar
integer y = 544
integer taborder = 20
end type

on uo_scrolldown.destroy
call u_cst_buttonlistbarscroll::destroy
end on

event constructor;call super::constructor;of_SetParent(PARENT)
of_SetArrow('down')
of_SetStandardScrollbar(StandardScrollbar)
end event

event mouseenter;call super::mouseenter;of_ScrollDown()
end event

event mouseleave;call super::mouseleave;ib_scrollingup = FALSE
ib_scrollingdown = FALSE

iuo_scrolltimer.Stop()

PARENT.SetRedraw(TRUE)
end event

type uo_scrollup from u_cst_buttonlistbarscroll within u_cst_buttonlistbar
integer taborder = 10
end type

event constructor;call super::constructor;of_SetParent(PARENT)
of_SetArrow('up')
end event

on uo_scrollup.destroy
call u_cst_buttonlistbarscroll::destroy
end on

event mouseenter;call super::mouseenter;of_ScrollUp()
end event

event mouseleave;call super::mouseleave;ib_scrollingup = FALSE
ib_scrollingdown = FALSE

iuo_scrolltimer.Stop()

PARENT.SetRedraw(TRUE)
end event

type st_pbus_buttonlistbarlabel from statictext within u_cst_buttonlistbar
integer width = 10002
integer height = 10000
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16777215
long backcolor = 8421376
string text = "  Button Listbar"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

