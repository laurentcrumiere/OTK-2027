$PBExportHeader$n_cst_ribbongroup.sru
forward
global type n_cst_ribbongroup from nonvisualobject
end type
type size from structure within n_cst_ribbongroup
end type
type inv_win32 from n_cst_win32 within n_cst_ribbongroup
end type
end forward

type size from structure
	long		cx
	long		cy
end type

global type n_cst_ribbongroup from nonvisualobject
inv_win32 inv_win32
end type
global n_cst_ribbongroup n_cst_ribbongroup

type prototypes

end prototypes

type variables
integer width = 910
integer height = 416
integer x = 0
integer y = 0
long backcolor = 67108864

String #FontFamily = 'Segoe UI'
Long   #FontSize = 10
Long   #FontColor = 0

Boolean #Bold = FALSE
Boolean #Italic
Boolean #UnderLine
Boolean #StrikeOut

String #Text = 'None'

Boolean #VGradientFill = FALSE
Boolean #HGradientFill = FALSE
Long #Gradient1 = 0
Long #Gradient2 = 0

Long #bordercolor = 8421504

Boolean #ThemeAware = FALSE

Long #Style = 0

CONSTANT Long BLUE = RGB(203,220,249)
CONSTANT Long SILVER = RGB(232,232,240)
CONSTANT Long OLIVE = RGB(234,234,207)
CONSTANT Long CLASSIC = RGB(242,243,246)

CONSTANT Long NORMAL = 0
CONSTANT Long HEADER = 1

CONSTANT Long SMALL = 0
CONSTANT Long LARGE = 1
CONSTANT Long SMALLCOLLECTION = 2
CONSTANT Long LARGECOLLECTION = 3

Long il_selected
Long il_index
Long il_pressedIndex
Boolean ib_dirty
Boolean ib_mousecaptured
Boolean ib_MouseDown
Boolean ib_mouseleave
u_cst_ribbonpanel iuo_parent
ribbonitem items[]

PROTECTED:



PRIVATE:

boolean ib_rtl
long il_ID
n_cst_pbus_tooltip inv_tooltip
n_cst_ribbongroup_painter in_gradient

Long il_imagecount
LongPtr il_imagelist
Long il_CurrentTheme

CONSTANT Long ILD_TRANSPARENT = 1
CONSTANT Long LVM_GETIMAGELIST = 4098
CONSTANT Long LVSIL_NORMAL = 0

Window iw_parent

CONSTANT integer SCROLLBAR         = 0
CONSTANT integer BACKGROUND        = 1
CONSTANT integer ACTIVECAPTION     = 2
CONSTANT integer INACTIVECAPTION   = 3
CONSTANT integer MENU              = 4
CONSTANT integer WINDOW            = 5
CONSTANT integer WINDOWFRAME       = 6
CONSTANT integer MENUTEXT          = 7
CONSTANT integer WINDOWTEXT        = 8
CONSTANT integer CAPTIONTEXT       = 9
CONSTANT integer ACTIVEBORDER      = 10
CONSTANT integer INACTIVEBORDER    = 11
CONSTANT integer APPWORKSPACE      = 12
CONSTANT integer HIGHLIGHT         = 13
CONSTANT integer HIGHLIGHTTEXT     = 14
CONSTANT integer BTNFACE           = 15
CONSTANT integer BTNSHADOW         = 16
CONSTANT integer GRAYTEXT          = 17
CONSTANT integer BTNTEXT           = 18
CONSTANT integer INACTIVECAPTIONTEXT = 19
CONSTANT integer BTNHIGHLIGHT      = 20
CONSTANT integer COLOR_3DDKSHADOW        = 21
CONSTANT integer COLOR_3DLIGHT           = 22
CONSTANT integer INFOTEXT          = 23
CONSTANT integer INFOBK            = 24
CONSTANT integer HOTLIGHT          = 26
CONSTANT integer GRADIENTACTIVECAPTION = 27
CONSTANT integer GRADIENTINACTIVECAPTION = 28
CONSTANT integer MENUHILIGHT       = 29
CONSTANT integer MENUBAR           = 30
CONSTANT integer DESKTOP           = BACKGROUND
CONSTANT integer COLOR_3DFACE            = BTNFACE
CONSTANT integer COLOR_3DSHADOW          = BTNSHADOW
CONSTANT integer COLOR_3DHIGHLIGHT       = BTNHIGHLIGHT
CONSTANT integer COLOR_3DHILIGHT         = BTNHIGHLIGHT
CONSTANT integer BTNHILIGHT        = BTNHIGHLIGHT

//PB System Colors
CONSTANT Long PBACTIVE_BORDER = 134217738
CONSTANT Long PBACTIVE_TITLE_BAR = 134217730
CONSTANT Long PBACTIVE_TITLE_BAR_TEXT = 134217737
CONSTANT Long PBAPPLICATION_WORKSPACE = 268435456
CONSTANT Long PBBUTTON_DARK_SHADOW = 134217749
CONSTANT Long PBBUTTON_FACE = 67108864
CONSTANT Long PBBUTTON_HIGHLIGHT = 134217748
CONSTANT Long PBBUTTON_LIGHT_SHADOW = 134217750
CONSTANT Long PBBUTTON_SHADOW = 134217744
CONSTANT Long PBBUTTON_TEXT = 134217746
CONSTANT Long PBDESKTOP = 134217729
CONSTANT Long PBDISABLED_TEXT = 134217745
CONSTANT Long PBHIGHLIGHT = 134217741
CONSTANT Long PBHIGHLIGHT_TEXT = 134217742
CONSTANT Long PBINACTIVE_BORDER = 134217739
CONSTANT Long PBINACTIVE_TITLE_BAR = 134217731
CONSTANT Long PBINACTIVE_TITLE_BAR_TEXT = 134217747
CONSTANT Long PBLINK = 134217856
CONSTANT Long PBLINK_HOVER = 134217857
CONSTANT Long PBLINK_ACTIVE = 134217858
CONSTANT Long PBLINK_VISITED = 134217859
CONSTANT Long PBMENU_BAR = 134217732
CONSTANT Long PBMENU_TEXT = 134217735
CONSTANT Long PBSCROLLBAR = 134217728
//CONSTANT Long PBSCROLL_BAR = SCROLLBAR
CONSTANT Long PBTRANSPARENT = 536870912
CONSTANT Long PBTOOLTIP = 134217752
CONSTANT Long PBTOOLTIP_TEXT = 134217751
CONSTANT Long PBWINDOW_BACKGROUND = 1073741824
CONSTANT Long PBWINDOW_FRAME = 134217734
CONSTANT Long PBWINDOW_TEXT = 33554432
end variables

forward prototypes
public function integer of_fontname (string as_font)
public function integer of_fontsize (long al_size)
public function integer of_backcolor (long al_color)
public function long of_getthemecolor (string as_color)
public function integer of_settheme (long al_color)
public function long of_getcurrenttheme ()
public function integer of_updatepoints ()
public function long of_parsetoarray (string as_source, string as_delimiter, ref string as_array[])
public function long of_indexfrompoint (long xpos, long ypos)
public function integer of_capturemouse ()
public function boolean of_ismousecaptured ()
public function integer of_releasemouse ()
public function integer of_mouseover (long al_index)
private function long of_getxposition ()
private function long of_getyposition ()
public function integer of_fontcolor (long al_color)
public function integer of_text (string as_text)
private function string of_getmenuname (menu a_menu)
private function string of_gettiptext (menu a_menu)
private function string of_removeampersand (string as_text)
public function long of_getcolor ()
public function integer of_copyitems (ref ribbonitem a_items[])
public function integer of_additem (integer ai_type, menu a_menu, string as_font, long al_color)
public function point of_gettextsize (string as_text, boolean ab_wrap, string as_font)
public function integer of_righttoleft (boolean ab_switch)
public function integer of_updatepointsright ()
public function string of_getalttag (string as_text)
public function menu of_getalttagmenu (string as_tag)
public function integer of_calculatewidth ()
end prototypes

public function integer of_fontname (string as_font);#FontFamily = as_font

RETURN 1
end function

public function integer of_fontsize (long al_size);#FontSize = al_size


RETURN 1
end function

public function integer of_backcolor (long al_color);Backcolor = al_color


RETURN 1
end function

public function long of_getthemecolor (string as_color);
RETURN iuo_parent.inv_color_theme.of_GetColor(iuo_parent.inv_color_theme.RibbonPanel, as_color)
end function

public function integer of_settheme (long al_color);il_CurrentTheme = al_color

RETURN 1
end function

public function long of_getcurrenttheme ();RETURN il_currenttheme
end function

public function integer of_updatepoints ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_smallcount, ll_nextx
Long ll_width, ll_height, ll_max, ll_groupx, ll_groupy, ll_yoffset
LongPtr ll_dc
point lp_empty[]
Point p

IF ib_rtl THEN
	RETURN of_UpdatePointsRight()
END IF

ll_groupx = UnitsToPixels(X, XUnitsToPixels!)
ll_groupy = UnitsToPixels(Y, YUnitsToPixels!)

ll_count = UpperBound(items)
ll_nextx = inv_win32.ScaleX(Handle(iuo_parent), 8)

ll_yoffset = inv_win32.ScaleY(Handle(iuo_parent), 8)

FOR ll_index = 1 TO ll_count
	
	items[ll_index].ast_point = lp_empty
	
	items[ll_index].al_textcolor = of_GetThemeColor('ITEMTEXT')
     items[ll_index].al_selectedtextcolor = of_GetThemeColor('TEXTSELECTED')
	items[ll_index].al_selectedcolor1 = of_GetThemeColor('HOVERSELECTED1')
	items[ll_index].al_selectedcolor2 = of_GetThemeColor('HOVERSELECTED2')
	items[ll_index].al_mouseovercolor1 = of_GetThemeColor('HOVER1')
	items[ll_index].al_mouseovercolor2 = of_GetThemeColor('HOVER2')
	
	CHOOSE CASE items[ll_index].ai_type
		CASE SMALL, SMALLCOLLECTION
			p = of_GetTextSize(items[ll_index].as_text, FALSE, items[ll_index].as_font)
			
			IF ll_smallcount = 3 THEN
				ll_smallcount = 0
			END IF
			
			IF ll_smallcount = 0 THEN
				ll_x = ll_nextX
			END IF
			
			ll_y = ll_yoffset + (ll_smallcount * inv_win32.ScaleY(Handle(iuo_parent), 23))
			
			IF Len(Trim(items[ll_index].as_text)) = 0 THEN
				ll_width = inv_win32.ScaleX(Handle(iuo_parent), 21)
			ELSE
				ll_width = inv_win32.ScaleX(Handle(iuo_parent), 21) + p.px //21 holds image width and padding around the image
			END IF
			
			ll_height = inv_win32.ScaleY(Handle(iuo_parent), 24)
			
			IF items[ll_index].ai_type = SMALLCOLLECTION THEN
				ll_width = ll_width + inv_win32.ScaleX(Handle(iuo_parent), 8) //More room for arrow
			END IF
			
			IF ll_x + ll_width + inv_win32.ScaleX(Handle(iuo_parent), 6) > ll_nextx THEN
				ll_nextx = ll_x + ll_width + inv_win32.ScaleX(Handle(iuo_parent), 4) //store the next x position
			END IF
			
			ll_smallcount = ll_smallcount + 1
			
		CASE LARGE, LARGECOLLECTION
			p = of_GetTextSize(items[ll_index].as_text, TRUE, items[ll_index].as_font)
			
			ll_smallcount = 0
			
			//set minimum width
			IF p.PX > inv_win32.ScaleX(Handle(iuo_parent), 32) THEN
				ll_width = p.PX
			ELSE
				ll_width = inv_win32.ScaleX(Handle(iuo_parent), 32)
			END IF
			
			ll_y = ll_yoffset
			ll_x = ll_nextx
			ll_width = ll_width + inv_win32.ScaleX(Handle(iuo_parent), 5)
			ll_height = UnitsToPixels(Height, YUnitsToPixels!) - ll_y - inv_win32.ScaleY(Handle(iuo_parent), 18)
			
			//store the next x position
			ll_nextx = ll_x + ll_width + inv_win32.ScaleX(Handle(iuo_parent), 2)
			
	END CHOOSE
	
	items[ll_index].al_textwidth = p.PX
	
	items[ll_index].ast_point[1].px = ll_x + ll_groupx
	items[ll_index].ast_point[1].py = ll_y + ll_groupy
	items[ll_index].ast_point[2].px = ll_x + ll_width + ll_groupx
	items[ll_index].ast_point[2].py = ll_y + ll_groupy
	items[ll_index].ast_point[3].px = ll_x + ll_width + ll_groupx
	items[ll_index].ast_point[3].py = ll_y + ll_height + ll_groupy
	items[ll_index].ast_point[4].px = ll_x + ll_groupx
	items[ll_index].ast_point[4].py = ll_y + ll_height + ll_groupy

	IF items[ll_index].ast_point[2].px - ll_groupx > ll_max THEN
		ll_max = items[ll_index].ast_point[2].px - ll_groupx
	END IF

NEXT

ib_dirty = FALSE

THIS.Width = PixelsToUnits(ll_max + inv_win32.ScaleX(Handle(iuo_parent), 7), XPixelsToUnits!)


RETURN 1
end function

public function long of_parsetoarray (string as_source, string as_delimiter, ref string as_array[]);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  of_ParseToArray
//
//	Access:  public
//
//	Arguments:
//	as_Source   The string to parse.
//	as_Delimiter   The delimeter string.
//	as_Array[]   The array to be filled with the parsed strings, passed by reference.
//
//	Returns:  long
//	The number of elements in the array.
//	If as_Source or as_Delimeter is NULL, function returns NULL.
//
//	Description:  Parse a string into array elements using a delimeter string.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	5.0   Initial version
//	5.0.02   Fixed problem when delimiter is last character of string.

//	   Ref array and return code gave incorrect results.
//
//////////////////////////////////////////////////////////////////////////////
//
/*
 * Open Source PowerBuilder Foundation Class Libraries
 *
 * Copyright (c) 2004-2005, All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted in accordance with the GNU Lesser General
 * Public License Version 2.1, February 1999
 *
 * http://www.gnu.org/copyleft/lesser.html
 *
 * ====================================================================
 *
 * This software consists of voluntary contributions made by many
 * individuals and was originally based on software copyright (c) 
 * 1996-2004 Sybase, Inc. http://www.sybase.com.  For more
 * information on the Open Source PowerBuilder Foundation Class
 * Libraries see http://pfc.codexchange.sybase.com
*/
//
//////////////////////////////////////////////////////////////////////////////
long		ll_DelLen, ll_Pos, ll_Count, ll_Start, ll_Length
string 	ls_holder

//Check for NULL
IF IsNull(as_source) or IsNull(as_delimiter) Then
	long ll_null
	SetNull(ll_null)
	Return ll_null
End If

//Check for at leat one entry
If Trim (as_source) = '' Then
	Return 0
End If

//Get the length of the delimeter
ll_DelLen = Len(as_Delimiter)

ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter))

//Only one entry was found
if ll_Pos = 0 then
	as_Array[1] = as_source
	return 1
end if

//More than one entry was found - loop to get all of them
ll_Count = 0
ll_Start = 1
Do While ll_Pos > 0
	
	//Set current entry
	ll_Length = ll_Pos - ll_Start
	ls_holder = Mid (as_source, ll_start, ll_length)

	// Update array and counter
	ll_Count ++
	as_Array[ll_Count] = ls_holder
	
	//Set the new starting position
	ll_Start = ll_Pos + ll_DelLen

	ll_Pos =  Pos(Upper(as_source), Upper(as_Delimiter), ll_Start)
Loop

//Set last entry
ls_holder = Mid (as_source, ll_start, Len (as_source))

// Update array and counter if necessary
if Len (ls_holder) > 0 then
	ll_count++
	as_Array[ll_Count] = ls_holder
end if

//Return the number of entries found
Return ll_Count
end function

public function long of_indexfrompoint (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
integer lix, liy

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

ll_count = UPPERBOUND(items)
FOR ll_index = 1 to ll_count
	//skip if disabled
	IF NOT items[ll_index].a_menu.Enabled THEN CONTINUE
	lul_rgn = inv_win32.CreatePolygonRgn(items[ll_index].ast_point, UPPERBOUND(items[ll_index].ast_point), 1)
	IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
		inv_win32.DeleteObject(lul_rgn)
		RETURN ll_index
	ELSE
		inv_win32.DeleteObject(lul_rgn)
	END IF
NEXT

RETURN -1
end function

public function integer of_capturemouse ();

inv_win32.SetCapture(handle(this))

ib_mousecaptured = TRUE

return 1
end function

public function boolean of_ismousecaptured ();RETURN ib_mousecaptured
end function

public function integer of_releasemouse ();
if NOT of_ismousecaptured() then return -1

inv_win32.ReleaseCapture()

ib_mousecaptured = FALSE

Return 1
end function

public function integer of_mouseover (long al_index);IF il_index > 0 THEN
	items[il_index].ab_mouseover = FALSE
	items[il_index].ab_selected = FALSE
END IF

IF al_index > 0 THEN
	IF KeyDown(KeyLeftButton!) THEN
		IF al_index = il_pressedIndex THEN
			items[al_index].ab_mouseover = TRUE
			items[al_index].ab_selected = TRUE
		ELSE
			items[al_index].ab_mouseover = FALSE
			items[al_index].ab_selected = FALSE
		END IF
	ELSE
		IF il_selected = al_index THEN
			items[al_index].ab_mouseover = TRUE
			items[al_index].ab_selected = TRUE
		ELSE
			items[al_index].ab_mouseover = TRUE
			items[al_index].ab_selected = FALSE
		END IF
		
	END IF
END IF

il_index = al_index

ib_dirty = FALSE

RETURN 1
end function

private function long of_getxposition ();return THIS.X + iuo_parent.X
end function

private function long of_getyposition ();return THIS.Y + iuo_parent.Y
end function

public function integer of_fontcolor (long al_color);#FontColor = al_color

RETURN 1
end function

public function integer of_text (string as_text);#Text = as_text

RETURN 1
end function

private function string of_getmenuname (menu a_menu);Long ll_pos

ll_pos = Pos(Lower(a_menu.Tag), "displaytext:false", 1)

IF ll_pos > 0 THEN
	RETURN ""
END IF

ll_pos = Pos(a_menu.Text, "~t", 1)

IF ll_pos > 0 THEN
	RETURN of_RemoveAmpersand(Trim(Left(a_menu.Text, ll_pos - 1)))
ELSE
	RETURN of_RemoveAmpersand(Trim(a_menu.Text))
END IF
end function

private function string of_gettiptext (menu a_menu);String ls_tiptext
Long ll_pos

ls_tiptext = of_RemoveAmpersand(a_menu.Text)
					
ll_pos = Pos(ls_tiptext, "~t", 1)

IF ll_pos > 0 THEN
	ls_tiptext = Replace(ls_tiptext, ll_pos, 1, "  (") + ")"
END IF
					
IF Len(Trim(a_menu.MicroHelp)) > 0 THEN
	ls_tiptext = ls_tiptext + "~r~n~r~n" + a_menu.MicroHelp
END IF

RETURN ls_tiptext
end function

private function string of_removeampersand (string as_text);Long ll_pos 

ll_pos = Pos(as_text, "&", 1)

IF ll_pos > 0 THEN
	RETURN Replace(as_text, ll_pos, 1, "")
ELSE
	RETURN as_text
END IF
end function

public function long of_getcolor ();RETURN iuo_parent.of_GetColor("BACKGROUND2")

end function

public function integer of_copyitems (ref ribbonitem a_items[]);Long ll_index, ll_count

ll_count = UpperBound(items)

FOR ll_index = 1 TO ll_count
	a_items[UpperBound(a_items) + 1] = items[ll_index]
NEXT

RETURN 1
end function

public function integer of_additem (integer ai_type, menu a_menu, string as_font, long al_color);RibbonItem item

item.as_alttag = of_GetAltTag(a_menu.Text)
item.as_text = of_GetMenuName(a_menu)
item.as_image = a_menu.ToolbarItemName
item.ai_type = ai_type
item.a_menu = a_menu
item.as_font = as_font
item.al_textcolor = al_color
item.al_imageindex = iuo_parent.of_AddImage(item.as_image)

items[UpperBound(items) + 1] = item

RETURN 1
end function

public function point of_gettextsize (string as_text, boolean ab_wrap, string as_font);LongPtr lul_Handle, lul_hDC, lul_hFont
Ulong ll_height, ll_width
SIZE lstr_size
long ll_x
string ls_parts[]
Long ll_index, ll_count
n_uspb_text_helper lnv_texthelper
Point lp_size
Integer li_newHeight, li_newWidth

ll_x = 0

lul_Handle = Handle(iuo_parent)
lul_hDC = inv_win32.GetDC(lul_Handle)

lnv_texthelper.of_SetHdc(lul_hDC)

IF ab_wrap THEN
	ll_count = of_ParseToArray(as_text, " ", ls_parts)
	ll_width = 32
	ll_height = 0
	FOR ll_index = 1 TO ll_count
		IF Len(Trim(ls_parts[ll_index])) > 0 THEN
			
			lp_size = lnv_texthelper.of_gettextsize (lul_hDC, ls_parts[ll_index], as_font, #FontSize, lnv_texthelper.ALIGN_LEFT, 50, FALSE, FALSE, FALSE)
			
			IF lp_size.PX > ll_width THEN
				ll_width = lp_size.PX
			END IF
			
			ll_height = ll_height + lp_size.PY
			
		END IF
	NEXT
	
	li_newWidth = ll_width
	li_newHeight = ll_height
	
ELSE
	lp_size = lnv_texthelper.of_gettextsize (lul_hDC,as_text, as_font, #FontSize, lnv_texthelper.ALIGN_LEFT, 50, FALSE, FALSE, FALSE)
	
	li_newWidth = lp_size.PX
	li_newHeight = lp_size.PY
	
END IF

inv_win32.ReleaseDC(lul_Handle, lul_hDC)

Point p

p.PX = li_newWidth + 4
p.PY = li_newHeight + 4

RETURN p
end function

public function integer of_righttoleft (boolean ab_switch);ib_rtl = ab_switch
of_UpdatePoints()
RETURN 1
end function

public function integer of_updatepointsright ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_smallcount, ll_nextx
Long ll_width, ll_height, ll_max, ll_groupx, ll_groupy, ll_yoffset
LongPtr ll_dc
point lp_empty[]
Point p

ll_groupx = UnitsToPixels(X + Width, XUnitsToPixels!)
ll_groupy = UnitsToPixels(Y, YUnitsToPixels!)

ll_count = UpperBound(items)
ll_nextx = ll_groupx - 8

ll_yoffset = 4

FOR ll_index = 1 TO ll_count
	
	items[ll_index].ast_point = lp_empty
	
	items[ll_index].al_textcolor = of_GetThemeColor('ITEMTEXT')
   items[ll_index].al_selectedtextcolor = of_GetThemeColor('TEXTSELECTED')
	items[ll_index].al_selectedcolor1 = of_GetThemeColor('HOVERSELECTED1')
	items[ll_index].al_selectedcolor2 = of_GetThemeColor('HOVERSELECTED2')
	items[ll_index].al_mouseovercolor1 = of_GetThemeColor('HOVER1')
	items[ll_index].al_mouseovercolor2 = of_GetThemeColor('HOVER2')
	
	CHOOSE CASE items[ll_index].ai_type
		CASE SMALL, SMALLCOLLECTION
			p = of_GetTextSize(items[ll_index].as_text, FALSE, items[ll_index].as_font)
			
			IF ll_smallcount = 3 THEN
				ll_smallcount = 0
			END IF
			
			IF ll_smallcount = 0 THEN
				ll_x = ll_nextX
			END IF
			
			ll_y = ll_yoffset + (ll_smallcount * 23)
			
			IF Len(Trim(items[ll_index].as_text)) = 0 THEN
				ll_width = 21
			ELSE
				ll_width = 21 + p.px //21 holds image width and padding around the image
			END IF
			
			ll_height = 20
			
			IF items[ll_index].ai_type = SMALLCOLLECTION THEN
				ll_width = ll_width + 8 //More room for arrow
			END IF
			
			IF ll_x - ll_width - 6 < ll_nextx THEN
				ll_nextx = ll_x - ll_width - 6 //store the next x position
			END IF
			
			ll_smallcount = ll_smallcount + 1
			
		CASE LARGE, LARGECOLLECTION
			p = of_GetTextSize(items[ll_index].as_text, TRUE, items[ll_index].as_font)
			
			ll_smallcount = 0
			
			//set minimum width
			IF p.PX > 32 THEN
				ll_width = p.PX
			ELSE
				ll_width = 32
			END IF
			
			ll_y = ll_yoffset
			ll_x = ll_nextx
			ll_width = ll_width + 5
			ll_height = UnitsToPixels(Height, YUnitsToPixels!) - ll_y - 16
			
			//store the next x position
			ll_nextx = ll_x - ll_width - 2
			
	END CHOOSE
	
	items[ll_index].al_textwidth = p.PX
	
	items[ll_index].ast_point[1].px = ll_x - ll_width
	items[ll_index].ast_point[1].py = ll_y + ll_groupy
	items[ll_index].ast_point[2].px = ll_x
	items[ll_index].ast_point[2].py = ll_y + ll_groupy
	items[ll_index].ast_point[3].px = ll_x
	items[ll_index].ast_point[3].py = ll_y + ll_height + ll_groupy
	items[ll_index].ast_point[4].px = ll_x - ll_width
	items[ll_index].ast_point[4].py = ll_y + ll_height + ll_groupy

NEXT

ib_dirty = FALSE



RETURN 1
end function

public function string of_getalttag (string as_text);Long ll_pos
ll_pos = Pos(as_text, "&", 1)

IF ll_pos = 0 THEN RETURN ""

RETURN Mid(as_text, ll_pos + 1, 1)
end function

public function menu of_getalttagmenu (string as_tag);Long ll_index, ll_count
Menu l_menu

ll_count = UpperBound(items)

FOR ll_index = 1 TO ll_count
	IF Lower(items[ll_index].as_alttag) = Lower(as_tag) THEN
		RETURN items[ll_index].a_menu
	END IF
NEXT

RETURN l_menu
end function

public function integer of_calculatewidth ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_smallcount, ll_nextx
Long ll_width, ll_height, ll_max, ll_groupx, ll_groupy, ll_yoffset
LongPtr ll_dc
Point p

ll_groupx = UnitsToPixels(0, XUnitsToPixels!)
ll_groupy = UnitsToPixels(Y, YUnitsToPixels!)

ll_count = UpperBound(items)
ll_nextx = 8

ll_yoffset = 4

FOR ll_index = 1 TO ll_count
	
	
	CHOOSE CASE items[ll_index].ai_type
		CASE SMALL, SMALLCOLLECTION
			p = of_GetTextSize(items[ll_index].as_text, FALSE, items[ll_index].as_font)
			
			IF ll_smallcount = 3 THEN
				ll_smallcount = 0
			END IF
			
			IF ll_smallcount = 0 THEN
				ll_x = ll_nextX
			END IF
			
			ll_y = ll_yoffset + (ll_smallcount * 22)
			
			IF Len(Trim(items[ll_index].as_text)) = 0 THEN
				ll_width = 21
			ELSE
				ll_width = 21 + p.px //21 holds image width and padding around the image
			END IF
			
			ll_height = 20
			
			IF items[ll_index].ai_type = SMALLCOLLECTION THEN
				ll_width = ll_width + 8 //More room for arrow
			END IF
			
			IF ll_x + ll_width + 6 > ll_nextx THEN
				ll_nextx = ll_x + ll_width + 4 //store the next x position
			END IF
			
			ll_smallcount = ll_smallcount + 1
			
		CASE LARGE, LARGECOLLECTION
			p = of_GetTextSize(items[ll_index].as_text, TRUE, items[ll_index].as_font)
			
			ll_smallcount = 0
			
			//set minimum width
			IF p.PX > 32 THEN
				ll_width = p.PX
			ELSE
				ll_width = 32
			END IF
			
			ll_y = ll_yoffset
			ll_x = ll_nextx
			ll_width = ll_width + 5
			ll_height = UnitsToPixels(Height, YUnitsToPixels!) - ll_y - 16
			
			//store the next x position
			ll_nextx = ll_x + ll_width + 2
			
	END CHOOSE
	
	IF ll_x + ll_width > ll_max THEN
		ll_max = ll_x + ll_width
	END IF

NEXT

ib_dirty = FALSE

THIS.Width = PixelsToUnits(ll_max + 7, XPixelsToUnits!)


RETURN THIS.Width
end function

on n_cst_ribbongroup.create
call super::create
this.inv_win32=create inv_win32
TriggerEvent( this, "constructor" )
end on

on n_cst_ribbongroup.destroy
TriggerEvent( this, "destructor" )
call super::destroy
destroy(this.inv_win32)
end on

type inv_win32 from n_cst_win32 within n_cst_ribbongroup descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

