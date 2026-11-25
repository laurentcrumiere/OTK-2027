$PBExportHeader$u_cst_powersidemenu.sru
forward
global type u_cst_powersidemenu from u_cst_canvas
end type
type st_pbus_powersidemenulabel from statictext within u_cst_powersidemenu
end type
type uo_vscroll from u_cst_standardscroll within u_cst_powersidemenu
end type
type uo_hscroll from u_cst_standardscroll within u_cst_powersidemenu
end type
type sle_pbus_sidemenu_focuscontrol from singlelineedit within u_cst_powersidemenu
end type
end forward

global type u_cst_powersidemenu from u_cst_canvas
integer width = 1467
integer height = 1952
event resize pbm_size
event mousemove pbm_mousemove
event mouseenter ( )
event lbuttonup pbm_lbuttonup
event ue_postconstructor ( )
st_pbus_powersidemenulabel st_pbus_powersidemenulabel
uo_vscroll uo_vscroll
uo_hscroll uo_hscroll
sle_pbus_sidemenu_focuscontrol sle_pbus_sidemenu_focuscontrol
end type
global u_cst_powersidemenu u_cst_powersidemenu

type variables
PUBLIC:
String MenuName
String Theme = "WINDOWS10_BLUE"
Boolean DisplayBorder = TRUE
String FontName = "Segoe UI"
Int FontSize = 9
Boolean HighlightSelectedMenu = FALSE
Boolean RTL = FALSE
Menu MenuId

CONSTANT Long SMALL = 16
CONSTANT Long MEDIUM = 24
CONSTANT Long LARGE = 32
CONSTANT Long XLARGE = 48

PRIVATE:

Long il_yscroll
Long il_totalheight
Long il_xscroll
Long il_totalwidth
Long il_index
Long il_selected
Long il_CurrentSize = SMALL
Boolean ib_dirty
Boolean ib_windows8
Integer ii_focuscandidate
Boolean il_focusfrommouse
Long il_lastxpos
Long il_lastypos
Boolean ib_cangetfocus

n_cst_pbui_theme inv_color_theme
str_pbus_menuitem menuItems[]
n_cst_powersidemenu_painter inv_painter
n_cst_ui_imagelist inv_imagelist

String is_images[]

LongPtr il_imagelistsmall
LongPtr il_imagelistmedium
LongPtr il_imagelistlarge
LongPtr il_imagelistxlarge
LongPtr il_imagelist
end variables

forward prototypes
public function integer of_settheme (string as_theme)
public function integer of_setmenu (menu am_menu)
private function integer of_updatepoints ()
private function integer of_parsemenu ()
private function str_pbus_menuitemchild of_parsemenuchildren (menu am_parent, integer al_level)
private function unsignedlong of_getcolor (string as_color)
private function integer of_indexfrompoint (long xpos, long ypos)
private function integer of_mouseleave ()
private function integer of_mouseover (long al_index)
public function integer of_addimage (string as_image)
public function integer of_setsize (integer ai_size)
private function string of_removeampersand (string as_text)
private function string of_getmenuname (menu a_menu)
private function str_pbus_menuitem of_buildmenuitem (menu a_menu, integer a_level, ref str_pbus_menuitem l_menuitems[])
public function integer of_collapseall ()
public function integer of_expandall ()
private function integer of_removefocusring ()
private function integer of_movefocusring (boolean ab_down)
private function integer of_menuselected (integer al_index)
public function integer of_getfocuseditem ()
private function integer of_scrolltofocuseditem ()
public function integer of_scrollup ()
private function integer of_scroll ()
public function integer of_scrolldown ()
public function integer of_setfontname (string as_fontname)
public function integer of_setfontsize (integer ai_fontsize)
end prototypes

event resize;IF NewWidth <= 0 THEN RETURN

Long ll_width
Long ll_height
Boolean lb_showhscroll, lb_showvscroll

ll_width = NewWidth
ll_height = NewHeight

IF PixelsToUnits(il_totalwidth, XPixelsToUnits!) > ll_width THEN
	lb_showhscroll = TRUE
ELSE
	il_xscroll = 0
	uo_hscroll.Hide()
END IF

IF PixelsToUnits(il_totalheight, YPixelsToUnits!) > ll_height THEN
	lb_showvscroll = TRUE
ELSE
	il_yscroll = 0
	uo_vscroll.Hide()
END IF

IF lb_showhscroll THEN
	ll_height -= uo_hscroll.Height
END IF

IF lb_showvscroll THEN
	ll_width -= uo_vscroll.Width
END IF

uo_hscroll.Move(0, NewHeight - uo_hscroll.Height - ScaleDPI(8))
uo_hscroll.Resize(ll_width, uo_hscroll.Height)

uo_vscroll.Move(NewWidth - uo_vscroll.Width - PixelsToUnits(1, XPixelsToUnits!), PixelsToUnits(1, XPixelsToUnits!))
uo_vscroll.Resize(uo_vscroll.Width, ll_height - PixelsToUnits(2, XPixelsToUnits!))

IF lb_showhscroll THEN
	uo_hscroll.of_SetSliderSize( ((UnitsToPixels(ll_width, XUnitsToPixels!)) / il_totalwidth) * UnitsToPixels(ll_width, XUnitsToPixels!), ScaleDPI(10))
	uo_hscroll.of_SetMaxPosition(UnitsToPixels(ll_width, XUnitsToPixels!))
	uo_hscroll.Show()
END IF

IF lb_showvscroll THEN
	uo_vscroll.of_SetSliderSize( (UnitsToPixels(NewHeight, YUnitsToPixels!) / il_totalheight) * UnitsToPixels(NewHeight, YUnitsToPixels!), ScaleDPI(10))
	uo_vscroll.of_SetMaxPosition(UnitsToPixels(ll_height, YUnitsToPixels!))
	uo_vscroll.Show()
END IF

IF SizeType <> 99 THEN
	IF uo_hscroll.Visible THEN
		uo_hscroll.Position = (Abs(il_xscroll) / il_totalwidth) * uo_hscroll.MaxPosition
		uo_hscroll.Trigger Event Moved(uo_hscroll.Position)
	END IF
	
	IF uo_vscroll.Visible AND il_totalheight > 0 THEN
		uo_vscroll.Position = (Abs(il_yscroll) / il_totalheight) * uo_vscroll.MaxPosition
		uo_vscroll.Trigger Event Moved(uo_vscroll.Position)
	END IF
END IF
end event

event mousemove;Long ll_index

il_lastxpos = xpos
il_lastypos = ypos

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

event mouseenter();SetRedraw(TRUE)
end event

event lbuttonup;IF il_index > 0 THEN
	of_MenuSelected(il_index)
	of_Removefocusring()
	ii_focuscandidate = il_index
END IF

il_focusfrommouse = TRUE
sle_pbus_sidemenu_focuscontrol.SetFocus()
end event

event ue_postconstructor();ib_cangetfocus = TRUE
end event

public function integer of_settheme (string as_theme);
IF IsValid(inv_color_theme) THEN DESTROY inv_color_theme
inv_color_theme = CREATE USING "n_cst_pbui_theme_" + as_theme
Theme = as_theme

ib_windows8 = Left(Lower(as_theme), 7) = 'windows' OR Left(Lower(as_theme), 12) = 'powerbuilder'

uo_hscroll.of_SetSliderColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1'))
uo_vscroll.of_SetSliderColor(inv_color_theme.of_GetColor(inv_color_theme.SPA, 'BACKGROUND1'))

ib_dirty = TRUE
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_setmenu (menu am_menu);menuid = am_menu
of_ParseMenu()
of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

private function integer of_updatepoints ();Long ll_index, ll_count, ll_x, ll_y, ll_textwidth, ll_textheight
Long ll_itemheight, ll_maxwidth, ll_itemwidth, ll_controlwidth
LongPtr ll_dc
point lp_empty[]
Point lp_textsize
n_uspb_text_helper lnv_texthelper
Integer il_lastlevel
Integer il_levelgap
Integer il_parentlevel
Boolean ib_parentexpanded
Boolean ib_starthiding, lb_previouswasspearator

ll_count = UpperBound(menuItems)
il_lastlevel = 1
ll_y = il_yscroll + 1
ll_x = il_xscroll + 1
ll_itemheight = ScaleDPI(il_CurrentSize + 12)
il_levelgap = ScaleDPI(il_CurrentSize)

ll_dc = inv_win32.GetDC(Handle(st_pbus_powersidemenulabel))
lnv_texthelper.of_SetHDC(ll_dc)

//Preprocess our item collection
FOR ll_index = 1 TO ll_count	
	//Set the item to visible by default and reset the cords to nothing
	menuItems[ll_index].Visible = TRUE
	menuItems[ll_index].Cords = lp_empty
	
	//If we're hiding items, look here to see if children need to be hidden or if we need to lift this flag
	IF ib_starthiding THEN
		//The level is the same or less than the original hidden level, this means that the children items have all been processed
		IF menuItems[ll_index].Level <= il_parentlevel THEN
			ib_starthiding = FALSE
		ELSE
			//There are more children under the collapsed menu item, hide the child and continue
			menuItems[ll_index].Visible = FALSE
			CONTINUE
		END IF
	END IF
	
	//Check if the menu has children and that it's in a collapsed state.
	//If so, we need to hide all it's children and grandchildren, and so on
	IF menuItems[ll_index].HasChildren AND NOT menuItems[ll_index].IsExpanded THEN
		il_parentlevel = menuItems[ll_index].Level
		ib_starthiding = TRUE
	END IF
NEXT

FOR ll_index = 1 TO ll_count	
	IF NOT menuItems[ll_index].Visible THEN CONTINUE
	
	ll_x = il_xscroll + 1 + (il_levelgap * (menuItems[ll_index].Level - 1))
	
	il_lastlevel = menuItems[ll_index].Level
	
	IF HighlightSelectedMenu THEN
		menuItems[ll_index].Textcolor = of_GetColor('ITEMTEXT')
	ELSE
		IF menuItems[ll_index].Selected AND menuItems[ll_index].MouseOver = FALSE THEN
			menuItems[ll_index].TextColor = of_GetColor('TEXTSELECTED')
		ELSEIF menuItems[ll_index].MouseOver = TRUE THEN
			menuItems[ll_index].TextColor = of_GetColor('ITEMTEXTHOVER')
		ELSE
			menuItems[ll_index].TextColor = of_GetColor('ITEMTEXT')
		END IF
	END IF
	
	IF il_index = ll_index THEN
		IF il_selected = ll_index THEN
			menuItems[ll_index].Selected = TRUE
			menuItems[ll_index].MouseOver = TRUE
			menuItems[ll_index].Backcolor = of_GetColor('HOVERSELECTED2')
		ELSE
			menuItems[ll_index].Selected = FALSE
			menuItems[ll_index].MouseOver = TRUE
			menuItems[ll_index].Backcolor = of_GetColor('HOVER2')
		END IF
	ELSE
		IF il_selected = ll_index THEN
			menuItems[ll_index].MouseOver = FALSE
			menuItems[ll_index].Selected = TRUE
			menuItems[ll_index].Backcolor = of_GetColor('SELECTED2')
			menuItems[ll_index].Textcolor = of_GetColor('TEXTSELECTED')
		ELSE
			menuItems[ll_index].MouseOver = FALSE
			menuItems[ll_index].Selected = FALSE
			menuItems[ll_index].Backcolor = of_GetColor('BACKGROUND2')
		END IF
	END IF
	
	
	IF menuItems[ll_index].IsSeparator THEN
		lb_previouswasspearator = TRUE
		menuItems[ll_index].Cords[1].px = ll_x
		menuItems[ll_index].Cords[1].py = ll_y
		menuItems[ll_index].Cords[2].px = ll_x
		menuItems[ll_index].Cords[2].py = ll_y + ScaleDPI(20)
		ll_y = ll_y + ScaleDPI(20) //Line height
	ELSE
		lp_textsize = lnv_texthelper.of_GetTextSize (ll_dc, menuItems[ll_index].Text, FontName, FontSize, lnv_texthelper.ALIGN_LEFT, ScaleDPI(il_CurrentSize), FALSE, FALSE, FALSE)
		
		menuItems[ll_index].TextHeight = lp_textsize.py
		ll_itemwidth = lp_textsize.px + 8
		
		IF Len(Trim(menuItems[ll_index].Image)) > 0 THEN
			ll_itemwidth += ScaleDPI(il_CurrentSize) + ScaleDPI(10) //Room for the image plus padding
		END IF
		
		//IF menuItems[ll_index].HasChildren THEN
			ll_itemwidth += ScaleDPI(il_CurrentSize) + ScaleDPI(15) //room for an expanding gliph
		//END IF
		
		menuItems[ll_index].Cords[1].px = ll_x
		menuItems[ll_index].Cords[1].py = ll_y
		menuItems[ll_index].Cords[2].px = ll_x + ll_itemwidth
		menuItems[ll_index].Cords[2].py = ll_y
		menuItems[ll_index].Cords[3].px = ll_x + ll_itemwidth
		menuItems[ll_index].Cords[3].py = ll_y + ll_itemheight
		menuItems[ll_index].Cords[4].px = ll_x
		menuItems[ll_index].Cords[4].py = ll_y + ll_itemheight
		
		ll_y = ll_y + ll_itemheight
	
		//TO DO, track the actual width and use that
		IF ll_maxwidth < ((ll_x + Abs(il_xscroll)) + ll_itemwidth) THEN
			ll_maxwidth = ((ll_x + Abs(il_xscroll)) + ll_itemwidth)
		END IF
	END IF
NEXT

il_totalheight = ll_y + Abs(il_yscroll) + UnitsToPixels(uo_hscroll.Height, YUnitsToPixels!)
il_totalwidth = ll_maxwidth + UnitsToPixels(uo_vscroll.Width, YUnitsToPixels!)

inv_win32.ReleaseDC (Handle(st_pbus_powersidemenulabel), ll_dc)

ib_dirty = FALSE

Trigger Event Resize(99, Width, Height)

RETURN 1
end function

private function integer of_parsemenu ();IF NOT IsValid(menuid) THEN RETURN 0

Integer li_index, li_count
str_pbus_menuitem l_menuItems[]

li_count = UpperBound(menuid.Item)

FOR li_index = 1 TO li_count
	IF NOT menuid.Item[li_index].Visible THEN CONTINUE
	
	of_BuildMenuItem(menuid.Item[li_index], 0, l_menuItems)
NEXT

menuItems = l_menuItems

RETURN UpperBound(menuItems)
end function

private function str_pbus_menuitemchild of_parsemenuchildren (menu am_parent, integer al_level);Integer li_index, li_count
str_pbus_menuitem l_menuItems[]
str_pbus_menuitemchild l_menuItemReturn
Boolean lb_previouswasseparator

li_count = UpperBound(am_parent.Item)

FOR li_index = 1 TO li_count
	IF NOT am_parent.Item[li_index].Visible THEN CONTINUE
	
	IF am_parent.Item[li_index].Text = "-" THEN
		IF lb_previouswasseparator THEN CONTINUE
		lb_previouswasseparator = TRUE
	ELSE
		lb_previouswasseparator = FALSE
	END IF
	
	of_BuildMenuItem(am_parent.Item[li_index], al_level, l_menuItems)
NEXT

l_menuItemReturn.Items = l_menuItems

RETURN l_menuItemReturn
end function

private function unsignedlong of_getcolor (string as_color);IF HighlightSelectedMenu THEN
	RETURN inv_color_theme.of_GetColor(inv_color_theme.Buttonlistbar, as_color)
ELSE
	RETURN inv_color_theme.of_GetColor(inv_color_theme.RibbonPanel, as_color)
END IF
end function

private function integer of_indexfrompoint (long xpos, long ypos);//find out if a tab was clicked
long ll_count, ll_index
ulong lul_rgn
long lix, liy
Point p_row[]

lix = UnitsToPixels(xpos, XUnitsToPixels!)
liy = UnitsToPixels(ypos, YUnitsToPixels!)

p_row[1].px = 0
p_row[2].px = UnitsToPixels(Width, XUnitsToPixels!)
p_row[3].px = UnitsToPixels(Width, XUnitsToPixels!)
p_row[4].px = 0

ll_count = UpperBound(menuItems)
FOR ll_index = 1 to ll_count
	//skip if disabled or hidden
	IF NOT menuItems[ll_index].Enabled THEN CONTINUE
	IF NOT menuItems[ll_index].Visible THEN CONTINUE
	IF menuItems[ll_index].IsSeparator THEN CONTINUE
	
	p_row[1].py = menuItems[ll_index].Cords[1].py
	p_row[2].py = menuItems[ll_index].Cords[2].py
	p_row[3].py = menuItems[ll_index].Cords[3].py
	p_row[4].py = menuItems[ll_index].Cords[4].py
	
	lul_rgn = inv_win32.CreatePolygonRgn(p_row, UpperBound(p_row), 1)
	IF inv_win32.PtInRegion(lul_rgn, lix, liy) <> 0 THEN
		inv_win32.DeleteObject(lul_rgn)
		RETURN ll_index
	ELSE
		inv_win32.DeleteObject(lul_rgn)
	END IF
NEXT

RETURN -1
end function

private function integer of_mouseleave ();IF il_index > 0 THEN
	IF il_selected = il_index THEN
		menuItems[il_index].MouseOver = FALSE
		menuItems[il_index].Backcolor = of_GetColor('SELECTED2')
	ELSE
		menuItems[il_index].Selected = FALSE
		menuItems[il_index].MouseOver = FALSE
		menuItems[il_index].Backcolor = of_GetColor('BACKGROUND2')
	END IF
	
	IF menuItems[il_index].Selected THEN
		menuItems[il_index].Textcolor = of_GetColor('TEXTSELECTED')
	ELSE
		menuItems[il_index].Textcolor = of_GetColor('ITEMTEXT')
	END IF
END IF

il_index = 0

SetRedraw(TRUE)

RETURN 1
end function

private function integer of_mouseover (long al_index);//IF il_index > 0 THEN
//	menuItems[il_index].MouseOver = FALSE
//	menuItems[il_index].BackColor = of_GetColor('BACKGROUND2')
//	menuItems[il_index].TextColor = of_GetColor('ITEMTEXT')
//END IF

//IF al_index > 0 THEN
//	menuItems[al_index].MouseOver = TRUE
//	menuItems[al_index].BackColor = of_GetColor('HOVER2')
	
//	IF menuItems[al_index].Selected AND menuItems[al_index].MouseOver = FALSE THEN
//		menuItems[al_index].TextColor = of_GetColor('TEXTSELECTED')
//	ELSEIF menuItems[al_index].MouseOver = TRUE THEN
//		menuItems[al_index].TextColor = of_GetColor('ITEMTEXTHOVER')
//	ELSE
//		menuItems[al_index].TextColor = of_GetColor('ITEMTEXT')
//	END IF
//END IF	

IF il_index > 0 THEN
	IF il_selected = il_index THEN
		menuItems[il_index].MouseOver = FALSE
		menuItems[il_index].Selected = TRUE
		menuItems[il_index].Backcolor = of_GetColor('SELECTED2')
	ELSE
		menuItems[il_index].MouseOver = FALSE
		menuItems[il_index].Selected = FALSE
		menuItems[il_index].Backcolor = of_GetColor('BACKGROUND2')
	END IF

	IF menuItems[il_index].Selected THEN
		menuItems[il_index].TextColor = of_GetColor('TEXTSELECTED')
	ELSE
		menuItems[il_index].TextColor = of_GetColor('ITEMTEXT')
	END IF
END IF

IF al_index > 0 THEN
	IF il_selected = al_index THEN
		menuItems[al_index].MouseOver = TRUE
		menuItems[al_index].Selected = TRUE
		menuItems[al_index].Backcolor = of_GetColor('HOVERSELECTED2')
	ELSE
		menuItems[al_index].MouseOver = TRUE
		menuItems[al_index].Selected = FALSE
		menuItems[al_index].Backcolor = of_GetColor('HOVER2')
	END IF

	IF menuItems[al_index].Selected AND menuItems[al_index].MouseOver = FALSE THEN
		menuItems[al_index].TextColor = of_GetColor('TEXTSELECTED')
	ELSEIF menuItems[al_index].MouseOver = TRUE THEN
		menuItems[al_index].TextColor = of_GetColor('ITEMTEXTHOVER')
	ELSE
		menuItems[al_index].TextColor = of_GetColor('ITEMTEXT')
	END IF
END IF	

il_index = al_index

ib_dirty = FALSE
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

il_yscroll = 0
il_xscroll = 0
ib_dirty = TRUE
SetRedraw(TRUE)

RETURN 1
end function

private function string of_removeampersand (string as_text);Long ll_pos 

ll_pos = Pos(as_text, "&", 1)

IF ll_pos > 0 THEN
	RETURN Replace(as_text, ll_pos, 1, "")
ELSE
	RETURN as_text
END IF
end function

private function string of_getmenuname (menu a_menu);Long ll_pos

ll_pos = Pos(a_menu.Text, "~t", 1)

IF ll_pos > 0 THEN
	RETURN of_RemoveAmpersand(Trim(Left(a_menu.Text, ll_pos - 1)))
ELSE
	RETURN of_RemoveAmpersand(Trim(a_menu.Text))
END IF
end function

private function str_pbus_menuitem of_buildmenuitem (menu a_menu, integer a_level, ref str_pbus_menuitem l_menuitems[]);str_pbus_menuitem l_menuitem
str_pbus_menuitemchild l_menuItemChildren
Point l_empty[]
Integer li_childcount, li_childindex

l_menuItem.Text = of_GetMenuName(a_menu)
	
	IF Len(Trim( a_menu.MenuImage)) > 0 THEN
		l_menuItem.Image = a_menu.MenuImage
	ELSE
		l_menuItem.Image = a_menu.ToolbarItemName
	END IF
	
	IF Len(Trim(l_menuItem.Image)) > 0 THEN
		l_menuItem.ImageIndex = of_AddImage(l_menuItem.Image)
	END IF
	
	IF a_menu.Text = "-" THEN 
		l_menuitem.IsSeparator = TRUE
	END IF
	
	l_menuItem.Menu = a_menu
	l_menuItem.Enabled = a_menu.Enabled
	l_menuItem.Cords = l_empty
	l_menuItem.Level = a_level + 1
	l_menuItem.haschildren = UpperBound(a_menu.Item) > 0
	l_menuItem.IsExpanded = FALSE
	l_menuItem.Index = UpperBound(l_menuItems) + 1
	l_menuItems[l_menuItem.Index] = l_menuItem
	
	IF l_menuItem.haschildren THEN
		l_menuItemChildren = of_ParseMenuChildren(a_menu, l_menuItem.Level)
		
		li_childcount = UpperBound(l_menuItemChildren.Items)
		
		FOR li_childindex = 1 TO li_childcount
			l_menuItems[UpperBound(l_menuItems) + 1] = l_menuItemChildren.Items[li_childindex]
		NEXT
	END IF

RETURN l_menuitem
end function

public function integer of_collapseall ();Integer li_index, li_count

li_count = UpperBound(menuItems)

FOR li_index = 1 TO li_count
	menuItems[li_index].IsExpanded = FALSE
NEXT

il_yscroll = 0
of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

public function integer of_expandall ();Integer li_index, li_count

li_count = UpperBound(menuItems)

FOR li_index = 1 TO li_count
	menuItems[li_index].IsExpanded = TRUE
NEXT

il_yscroll = 0
of_UpdatePoints()
SetRedraw(TRUE)

RETURN 1
end function

private function integer of_removefocusring ();Integer li_index, li_count

li_count = UpperBound(menuItems)

FOR li_index = 1 TO li_count
	menuItems[li_index].Focused = FALSE
NEXT

ii_focuscandidate = 0
il_focusfrommouse = FALSE

SetRedraw(TRUE)

RETURN 1
end function

private function integer of_movefocusring (boolean ab_down);Integer li_index, li_count
Integer li_innerindex, li_innercount
Boolean ab_found

li_count = UpperBound(menuItems)

IF ii_focuscandidate > 0 THEN
	li_index = ii_focuscandidate
	of_RemoveFocusRing()
	menuItems[li_index].Focused = TRUE
ELSE
	FOR li_index = 1 TO li_count
		IF menuItems[li_index].Focused THEN
			ab_found = TRUE
			
			IF ab_down THEN
				IF li_index < li_count THEN
					//Find Next Visible
					FOR li_innerindex = li_index TO li_count
						IF li_innerindex > li_index THEN
							IF NOT menuItems[li_innerindex].Enabled THEN CONTINUE
							IF NOT menuItems[li_innerindex].Visible THEN CONTINUE
							IF menuItems[li_innerindex].IsSeparator THEN CONTINUE
			
							menuItems[li_index].Focused = FALSE
							menuItems[li_innerindex].Focused = TRUE
							EXIT
						END IF
					NEXT
					
					EXIT
				END IF
			ELSE
				IF li_index > 1 THEN
					//Find Previous Visible
					FOR li_innerindex = li_index TO 1 Step -1
						IF li_innerindex < li_index THEN
							IF NOT menuItems[li_innerindex].Enabled THEN CONTINUE
							IF NOT menuItems[li_innerindex].Visible THEN CONTINUE
							IF menuItems[li_innerindex].IsSeparator THEN CONTINUE
							
							menuItems[li_index].Focused = FALSE
							menuItems[li_innerindex].Focused = TRUE
							EXIT
						END IF
					NEXT
					
					EXIT
				END IF
			END IF
		END IF
	NEXT
	
	//IF nothing was found then just set the first item to focused
	IF NOT ab_found THEN
		IF li_count > 0 THEN
			menuItems[1].Focused = TRUE
		END IF
	END IF
END IF

of_ScrollToFocusedItem()

ii_focuscandidate = 0

SetRedraw(TRUE)

RETURN 1
end function

private function integer of_menuselected (integer al_index);		
IF menuItems[al_index].HasChildren THEN
	menuItems[al_index].IsExpanded = NOT menuItems[al_index].IsExpanded
	
	of_UpdatePoints()
	
	Integer li_firsty
	
	IF UpperBound(menuitems) > 0 THEN
		IF UpperBound(menuitems[1].Cords) > 0 THEN
			li_firsty = menuitems[1].Cords[1].py
		END IF
	END IF
	
	IF il_totalheight < UnitsToPixels(Height, YUnitsToPixels!) AND li_firsty < 0  THEN
		il_yscroll = 0
		of_UpdatePoints()
	ELSE
		IF il_totalheight - Abs(il_yscroll) < UnitsToPixels(Height, YUnitsToPixels!) AND li_firsty < 0  THEN
			il_yscroll += (UnitsToPixels(Height, YUnitsToPixels!) - (il_totalheight - Abs(il_yscroll)))
			of_UpdatePoints()
		END IF
	END IF
	
	IF il_totalheight > 0 THEN
		uo_vscroll.of_SetPosition((Abs(il_yscroll) / il_totalheight) * uo_vscroll.MaxPosition)
	END IF
	
	Trigger Event Resize(99, Width, Height)
	
	SetRedraw(TRUE)

ELSE
	IF HighlightSelectedMenu THEN
		Long ll_old
		
		ll_old = il_selected
		il_selected = al_index
		
		IF il_selected <> ll_old THEN
			menuItems[il_selected].MouseOver = FALSE
			menuItems[il_selected].Selected = TRUE
			menuItems[il_selected].Backcolor = of_GetColor('SELECTED2')
			menuItems[il_selected].Textcolor = of_GetColor('TEXTSELECTED')
		END IF
		
		IF ll_old > 0 AND ll_old <> il_selected THEN
			menuItems[ll_old].MouseOver = FALSE
			menuItems[ll_old].Selected = FALSE
			menuItems[ll_old].Backcolor = of_GetColor('BACKGROUND2')
			menuItems[ll_old].Textcolor = of_GetColor('ITEMTEXT')
		END IF
		
			SetRedraw(TRUE)
	END IF
END IF

menuItems[al_index].Menu.PostEvent(Clicked!)
	
	RETURN 1
end function

public function integer of_getfocuseditem ();Integer li_index, li_count

li_count = UpperBound(menuItems)

FOR li_index = 1 TO li_count
	IF menuItems[li_index].Focused THEN RETURN li_index
NEXT

RETURN 0
end function

private function integer of_scrolltofocuseditem ();Integer li_index, li_count
Integer li_controlheight

li_controlheight = UnitsToPixels(Height - uo_hscroll.Height, YUnitsToPixels!)
li_count = UpperBound(menuItems)

FOR li_index = 1 TO li_count
	IF menuItems[li_index].Focused THEN
		
		//Check if item is in view
		//If item is not in view, scroll to that item
		IF menuItems[li_index].Cords[4].py > li_controlheight THEN
			il_yscroll -= ((menuItems[li_index].Cords[1].py - li_controlheight) + (il_currentsize * 3))
			of_Scroll()
			
			//Scroll Up
			//of_ScrollUp()
		ELSEIF menuItems[li_index].Cords[1].py < 0 THEN
			il_yscroll += Abs(menuItems[li_index].Cords[1].py)
			of_Scroll()
			//Scroll Down
			//of_ScrollDown()
		END IF
		
		EXIT
		
	END IF
NEXT

RETURN 1
end function

public function integer of_scrollup ();il_yscroll = il_yscroll - (il_CurrentSize * 3)

of_Scroll()

RETURN 1
end function

private function integer of_scroll ();Long ll_height, ll_index

ll_height = UnitsToPixels(Height, YUnitsToPixels!)

IF Abs(il_yscroll) + UnitsToPixels(Height - uo_hscroll.Height, YUnitsToPixels!) >= il_totalheight THEN
	il_yscroll = UnitsToPixels(Height, YUnitsToPixels!) - il_totalheight// - ScaleDPI(10)
END IF

IF il_yscroll > 0 THEN
	il_yscroll = 0
END IF

IF il_yscroll < ll_height - il_totalheight THEN
	il_yscroll = ll_height - il_totalheight
END IF

IF il_totalheight > 0 THEN
	uo_vscroll.of_SetPosition((Abs(il_yscroll) / il_totalheight) * uo_vscroll.MaxPosition)
END IF

of_UpdatePoints()

IF ib_mousecaptured THEN
	ll_index = of_IndexFromPoint(il_lastxpos, il_lastypos)
	IF il_index <> ll_index THEN
		RETURN of_MouseOver(ll_index) //This method will do a SetRedraw call
	END IF
END IF

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_scrolldown ();il_yscroll = il_yscroll + (il_CurrentSize * 3)

of_Scroll()

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

on u_cst_powersidemenu.create
int iCurrent
call super::create
this.st_pbus_powersidemenulabel=create st_pbus_powersidemenulabel
this.uo_vscroll=create uo_vscroll
this.uo_hscroll=create uo_hscroll
this.sle_pbus_sidemenu_focuscontrol=create sle_pbus_sidemenu_focuscontrol
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_pbus_powersidemenulabel
this.Control[iCurrent+2]=this.uo_vscroll
this.Control[iCurrent+3]=this.uo_hscroll
this.Control[iCurrent+4]=this.sle_pbus_sidemenu_focuscontrol
end on

on u_cst_powersidemenu.destroy
call super::destroy
destroy(this.st_pbus_powersidemenulabel)
destroy(this.uo_vscroll)
destroy(this.uo_hscroll)
destroy(this.sle_pbus_sidemenu_focuscontrol)
end on

event constructor;call super::constructor;IF Len(Trim(Theme)) = 0 THEN
	n_cst_ui_imagelist lnv_theme
	of_SetTheme(lnv_theme.of_GetGlobalTheme())
ELSE
	of_SetTheme(Theme)
END IF

IF Len(Trim(MenuName)) > 0 THEN
	menuid = CREATE USING MenuName
	of_SetMenu(menuid)
END IF

POST EVENT ue_PostConstructor()
end event

event onpaint;call super::onpaint;inv_painter.of_SetDeviceContext(THIS)
inv_painter.of_SetHDC(hdc)

//Paint background
inv_painter.of_XPGradient (of_GetColor("BACKGROUND1"), of_GetColor("BACKGROUND2"), THIS,DisplayBorder,of_GetColor("BORDER"), TRUE)

IF ib_dirty THEN
	of_UpdatePoints()
END IF

Integer li_controlwidth
li_controlwidth = Width
IF uo_vscroll.Visible THEN
	li_controlwidth -= uo_vscroll.Width
END IF

Ulong ll_focusringcolor

ll_focusringcolor = inv_color_theme.of_GetColor(inv_color_theme.SPA, "HOVER1")

inv_painter.of_DrawMenuItems (THIS, menuItems, of_GetColor("ITEMBORDER"), il_imagelist, FALSE, il_CurrentSize, UnitsToPixels(Height, YUnitsToPixels!), RTL, ib_windows8, FontName, FontSize, li_controlwidth, ll_focusringcolor)


RETURN 1
end event

event mouseleave;call super::mouseleave;of_MouseLeave()
end event

event wm_mousewheel;call super::wm_mousewheel;IF NOT uo_vscroll.Visible THEN RETURN 

IF (wParam / 65536) < 0 THEN
	of_ScrollUp()
ELSE
	of_ScrollDown()
END IF

end event

type st_pbus_powersidemenulabel from statictext within u_cst_powersidemenu
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
string text = "  PowerSideMenu"
boolean focusrectangle = false
end type

event constructor;Hide()
end event

type uo_vscroll from u_cst_standardscroll within u_cst_powersidemenu
boolean visible = false
integer x = 1321
integer y = 140
integer width = 46
integer height = 300
integer taborder = 10
end type

on uo_vscroll.destroy
call u_cst_standardscroll::destroy
end on

event moved;Int il_delta
Long ll_height

ll_height = UnitsToPixels(PARENT.Height, YUnitsToPixels!)

IF MaxPosition > 0 THEN
	il_yscroll = (Double(il_totalheight) * (Double(Position) / Double(MaxPosition))) * -1
END IF

IF il_yscroll > 0 THEN
	il_yscroll = 0
END IF

IF il_yscroll < ll_height - il_totalheight THEN
	il_yscroll = ll_height - il_totalheight
END IF

of_UpdatePoints()
PARENT.SetRedraw(TRUE)
end event

event wm_mousewheel;call super::wm_mousewheel;Int il_delta, ll_height
il_delta = (wParam / 65536)

IF NOT uo_vscroll.Visible THEN RETURN 

ll_height = UnitsToPixels(Height, YUnitsToPixels!)

IF il_delta < 0 THEN
	il_yscroll = il_yscroll - (il_CurrentSize * 3)
ELSE
	il_yscroll = il_yscroll + (il_CurrentSize * 3)
END IF

IF Abs(il_yscroll) + UnitsToPixels(Height, YUnitsToPixels!) >= il_totalheight THEN
	il_yscroll = UnitsToPixels(Height, YUnitsToPixels!) - il_totalheight// - ScaleDPI(10)
END IF

IF il_yscroll > 0 THEN
	il_yscroll = 0
END IF

IF il_yscroll < ll_height - il_totalheight THEN
	il_yscroll = ll_height - il_totalheight
END IF

IF il_totalheight > 0 THEN
	uo_vscroll.of_SetPosition((Abs(il_yscroll) / il_totalheight) * uo_vscroll.MaxPosition)
END IF


of_UpdatePoints()
SetRedraw(TRUE)
end event

type uo_hscroll from u_cst_standardscroll within u_cst_powersidemenu
boolean visible = false
integer x = 608
integer y = 1500
integer width = 302
integer height = 56
integer taborder = 30
end type

on uo_hscroll.destroy
call u_cst_standardscroll::destroy
end on

event moved;call super::moved;Int il_delta
Long ll_width
Long ll_totalhours

ll_width = UnitsToPixels(PARENT.Width, XUnitsToPixels!)

IF MaxPosition > 0 THEN
	il_xscroll = (Double(il_totalwidth) * (Double(Position) / Double(MaxPosition))) * -1
END IF

IF il_xscroll > 0 THEN
	il_xscroll = 0
END IF

IF il_xscroll < ll_width - il_totalwidth THEN
	il_xscroll = ll_width - il_totalwidth
END IF

of_UpdatePoints()
PARENT.SetRedraw(TRUE)

//PARENT.TRIGGER EVENT ue_Scroll()
end event

type sle_pbus_sidemenu_focuscontrol from singlelineedit within u_cst_powersidemenu
event keydown pbm_keydown
event setfocus pbm_setfocus
event killfocus pbm_killfocus
integer x = 10002
integer y = 10000
integer width = 5
integer height = 4
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
boolean autohscroll = false
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event keydown;IF Key = KeyEnter! THEN
	Integer li_index
	
	li_index = of_GetFocusedItem()
	
	IF li_index > 0 THEN
		of_MenuSelected(li_index)
	END IF
END IF

IF Key = KeyUpArrow! THEN
	of_MoveFocusRing(FALSE)	
END IF

IF Key = KeyDownArrow! THEN
	of_MoveFocusRing(TRUE)
END IF

IF Key = KeyEscape! THEN
	of_RemoveFocusRing()
END IF
end event

event setfocus;IF NOT KeyDown(KeyTab!) THEN RETURN 

IF UpperBound(menuItems) > 0 AND NOT il_focusfrommouse AND ib_cangetfocus THEN
	menuItems[1].Focused = TRUE
	PARENT.SetRedraw(TRUE)
END IF

il_focusfrommouse = FALSE
end event

event killfocus;of_RemoveFocusRing()
end event

