$PBExportHeader$u_cst_powerdockpanel.sru
forward
global type u_cst_powerdockpanel from userobject
end type
type uo_panelheader from u_cst_powerdockpanelheader within u_cst_powerdockpanel
end type
type uo_paneltoolbarstrip from u_cst_powerdockpaneltoolbar within u_cst_powerdockpanel
end type
type st_1 from statictext within u_cst_powerdockpanel
end type
type uo_paneltabcontrol from u_cst_tabcontrol within u_cst_powerdockpanel
end type
type inv_win32 from n_cst_win32 within u_cst_powerdockpanel
end type
end forward

global type u_cst_powerdockpanel from userobject
integer width = 846
integer height = 460
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
uo_panelheader uo_panelheader
uo_paneltoolbarstrip uo_paneltoolbarstrip
st_1 st_1
uo_paneltabcontrol uo_paneltabcontrol
inv_win32 inv_win32
end type
global u_cst_powerdockpanel u_cst_powerdockpanel

type prototypes

end prototypes

type variables
Boolean #Docked

Long #Orientation

CONSTANT LONG TOP = 1
CONSTANT LONG BOTTOM = 2
CONSTANT LONG LEFT = 3
CONSTANT LONG RIGHT = 4

Boolean ib_headerclicked

Long ll_width = 800
Long ll_height = 500

powerdockitems str_items[]

u_cst_powerdock iuo_parent
n_cst_powerdocktiming inv_timer

Long il_clickedx, il_clickedy

String is_entered

// Hover or Click mode
boolean ib_hover_mode = TRUE

boolean ib_rtl

// Timer intervals
dec{2}	idec_delay = 1.0, idec_show = 0.1, idec_hide = 0.75
end variables

forward prototypes
public function integer of_dock ()
public function integer of_undock ()
public function integer of_additem (ref userobject uo_object, string as_text, string as_image)
public function integer of_hide ()
public function integer of_expand ()
public function integer of_removeitem (userobject uo_object)
public function userobject of_currentobject ()
public function long of_getitemcount ()
public function string of_getimage (userobject uo_object)
public function string of_gettext (userobject uo_object)
public function integer of_autohide ()
public function integer of_setfocus (integer al_index)
public function integer of_closeitem (userobject uo_object)
public function integer of_collapse ()
public function integer of_setfocus (userobject uo_object)
public function integer of_expand (boolean ab_pinned)
public function integer of_additem (ref window uo_object, string as_text, string as_image)
public function string of_gettext (window uo_object)
public function string of_getimage (window uo_object)
public function integer of_removeitem (window uo_object)
public function integer of_setfocus (window uo_object)
public function integer of_closeitem (window uo_object)
public function long of_settext (window uo_object, string as_text)
public function long of_settext (userobject uo_object, string as_text)
public function window of_currentwindow ()
public function boolean of_candockpanelclose ()
public function integer of_additem (ref userobject uo_object, string as_text, string as_image, boolean ab_canclose)
public function long of_getheight ()
public function long of_getwidth ()
public function integer of_setfontname (string as_font)
public function boolean of_isdocked ()
public function boolean of_ishovering ()
public subroutine of_sethovermode (boolean ab_hover_mode)
public function integer of_settheme (string as_color)
public function integer of_setparent (u_cst_powerdock auo_parent)
public function integer of_displayborder (boolean ab_switch)
public function integer of_setfontcolor (long al_color)
public function integer of_righttoleft (boolean ab_switch)
public function integer of_closeitem (userobject uo_object, boolean ab_validate)
end prototypes

event resize;Long ll_x, ll_y

//SetRedraw(FALSE)

CHOOSE CASE #Orientation
	CASE LEFT 
		uo_paneltoolbarstrip.Height = Height
	CASE RIGHT
		uo_paneltoolbarstrip.Height = Height
		uo_paneltoolbarstrip.X = Width - uo_paneltoolbarstrip.Width
	CASE TOP
		uo_paneltoolbarstrip.Width = Width
	CASE BOTTOM
		uo_paneltoolbarstrip.Width = Width
		uo_paneltoolbarstrip.Y = Height - uo_paneltoolbarstrip.Height
END CHOOSE

IF #Docked THEN
	ll_width = Width
	ll_height = Height
	CHOOSE CASE #Orientation
		CASE LEFT
			uo_paneltabcontrol.Move(0,uo_panelheader.Height)
			uo_panelheader.X = 0
		CASE RIGHT, BOTTOM
			uo_paneltabcontrol.Move(0,uo_panelheader.Height)
		CASE TOP			
			uo_paneltabcontrol.Move(0,0)
			uo_panelheader.Y = Height - uo_panelheader.Height
	END CHOOSE
	
	uo_paneltabcontrol.Resize(Width, Height - uo_panelheader.Height)
	uo_panelheader.Width = Width
ELSE
	
	CHOOSE CASE #Orientation
		CASE LEFT
			uo_paneltabcontrol.Move(uo_paneltoolbarstrip.Width,uo_panelheader.Height)
			uo_paneltabcontrol.Resize(Width - uo_paneltoolbarstrip.Width, Height - uo_panelheader.Height)
			uo_panelheader.Width = Width - uo_paneltoolbarstrip.Width
			uo_panelheader.X = uo_paneltoolbarstrip.Width
		CASE RIGHT
			uo_paneltabcontrol.Move(0,uo_panelheader.Height)
			uo_paneltabcontrol.Resize(Width - uo_paneltoolbarstrip.Width, Height - uo_panelheader.Height)
			uo_panelheader.Width = Width - uo_paneltoolbarstrip.Width
		CASE TOP
			uo_paneltabcontrol.Move(0,uo_paneltoolbarstrip.Height)
			uo_paneltabcontrol.Resize(Width, Height - uo_paneltoolbarstrip.Height - uo_panelheader.Height)
			uo_panelheader.Y = Height - uo_panelheader.Height
			uo_panelheader.Width = Width
		CASE BOTTOM
			uo_paneltabcontrol.Move(0,uo_panelheader.Height)
			uo_paneltabcontrol.Resize(Width, Height - uo_paneltoolbarstrip.Height - uo_panelheader.Height)
			uo_panelheader.Width = Width

	END CHOOSE

END IF

//SetRedraw(TRUE)
//IF IsValid(iuo_parent) THEN iuo_parent.POST SetRedraw(TRUE)
end event

public function integer of_dock ();#Docked = TRUE
of_Expand(TRUE)
uo_paneltoolbarstrip.Hide()

IF uo_paneltabcontrol.of_GetTabCount() > 1 THEN
	uo_paneltabcontrol.of_ShowTabs()
	uo_paneltabcontrol.of_ShowArrows()
ELSE
	uo_paneltabcontrol.of_HideArrows()
END IF

THIS.TriggerEvent("Resize")

//iuo_parent.iw_parent.POST SetFocus()

iuo_parent.Event PanelPinned(#Orientation)

RETURN 1
end function

public function integer of_undock ();IF #Docked THEN
	#Docked = FALSE
	of_collapse()
END IF

uo_paneltoolbarstrip.Show()
uo_paneltabcontrol.of_HideTabs()
iuo_parent.TriggerEvent("Resize")

//iuo_parent.iw_parent.POST SetFocus()

iuo_parent.Event PanelUnPinned(#Orientation)

RETURN 1
end function

public function integer of_additem (ref userobject uo_object, string as_text, string as_image);RETURN of_AddItem(uo_object,as_text,as_image,TRUE)
end function

public function integer of_hide ();POINT lp
ulong ll
ulong lul

IF of_GetItemCount() <= 0 THEN
	RETURN 0
END IF

lul = Handle(this)

inv_win32.GetCursorPos(lp)
inv_win32.Screentoclient(lul, lp)

IF lp.px < 0 OR lp.px > UnitsToPixels(this.width, XUnitsToPixels!) OR &
	lp.py < 0 OR lp.py > UnitsToPixels(this.height, YUnitsToPixels!) THEN
	
	IF inv_timer.Interval = idec_show THEN
		inv_timer.Stop()
		inv_timer.Start(idec_hide)
		RETURN 0
	END IF
	of_AutoHide()
	
	//iuo_parent.iw_parent.POST SetFocus()
ELSE
	IF inv_timer.Interval = idec_hide THEN
		inv_timer.Stop()
		inv_timer.Start(idec_show)
		RETURN 0
	END IF
END IF

RETURN 1
end function

public function integer of_expand ();RETURN of_Expand(FALSE)
end function

public function integer of_removeitem (userobject uo_object);Long ll_index, ll_count, ll_newcount
powerdockitems str_newitems[]

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].ado_object = uo_object THEN
		uo_paneltabcontrol.of_RemoveTab(uo_object)
		uo_paneltoolbarstrip.of_RemoveItem(str_items[ll_index].as_text)
	ELSE
		ll_newcount++
		str_newitems[ll_newcount] = str_items[ll_index]
	END IF
NEXT

IF uo_paneltabcontrol.of_GetTabCount() > 0 THEN
	uo_paneltabcontrol.of_SelectTab(1)
END IF

IF uo_paneltabcontrol.of_GetTabCount() = 1 THEN
	uo_paneltabcontrol.of_HideTabs()
END IF

str_items = str_newitems

iuo_parent.TriggerEvent("Resize")

RETURN 1
end function

public function userobject of_currentobject ();RETURN uo_paneltabcontrol.of_GetObject(uo_paneltabcontrol.of_GetSelectedTab())
end function

public function long of_getitemcount ();RETURN uo_paneltabcontrol.of_GetTabCount()
end function

public function string of_getimage (userobject uo_object);Long ll_index, ll_count

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].ado_object = uo_object THEN
		RETURN str_items[ll_index].as_image
	END IF
NEXT

RETURN ""
end function

public function string of_gettext (userobject uo_object);Long ll_index, ll_count

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].ado_object = uo_object THEN
		RETURN str_items[ll_index].as_text
	END IF
NEXT


RETURN ""
end function

public function integer of_autohide ();Long ll_tb_height, ll_tb_width

inv_timer.Stop()

iuo_parent.SetRedraw(FALSE)

ll_tb_height = uo_paneltoolbarstrip.Height
ll_tb_width = uo_paneltoolbarstrip.Width

ll_width = Width - ll_tb_width
ll_height = Height - ll_tb_height

CHOOSE CASE #Orientation
	CASE LEFT
		Width = uo_paneltoolbarstrip.Width
	CASE RIGHT
		Width = uo_paneltoolbarstrip.Width
	CASE TOP, BOTTOM
		Height = uo_paneltoolbarstrip.Height
END CHOOSE

iuo_parent.TriggerEvent("Resize")

RETURN 1
end function

public function integer of_setfocus (integer al_index);RETURN uo_paneltabcontrol.of_SelectTab(al_index)
end function

public function integer of_closeitem (userobject uo_object);RETURN of_CloseItem(uo_object, TRUE)
end function

public function integer of_collapse ();ll_width = Width
ll_height = Height

CHOOSE CASE #Orientation
	CASE LEFT
		Width = uo_paneltoolbarstrip.Width
	CASE RIGHT
		X = iuo_parent.Width - uo_paneltoolbarstrip.Width
		Width = uo_paneltoolbarstrip.Width
	CASE TOP
		Height = uo_paneltoolbarstrip.Height
	CASE BOTTOM
		Y = iuo_parent.Height - uo_paneltoolbarstrip.Height
		Height = uo_paneltoolbarstrip.Height
END CHOOSE

BringToTop = TRUE

IF IsValid(iuo_parent.MDI_1) THEN
	iuo_parent.TriggerEvent("Resize")
END IF

RETURN 1
end function

public function integer of_setfocus (userobject uo_object);RETURN uo_paneltabcontrol.of_SelectTab(uo_object)
end function

public function integer of_expand (boolean ab_pinned);Long ll_tb_height, ll_tb_width

IF NOT ab_pinned THEN
	ll_tb_height = uo_paneltoolbarstrip.Height
	ll_tb_width = uo_paneltoolbarstrip.Width
END IF	

CHOOSE CASE #Orientation
	CASE LEFT
		Width = ll_width + ll_tb_width
	CASE RIGHT
		X = iuo_parent.Width - ll_width - ll_tb_width
		Width = ll_width + ll_tb_width
	CASE TOP
		Height = ll_height + ll_tb_height
	CASE BOTTOM
		Y = iuo_parent.Height - ll_height - ll_tb_height
		Height = ll_height + ll_tb_height
END CHOOSE

BringToTop = TRUE

IF IsValid(iuo_parent.MDI_1) THEN
	iuo_parent.TriggerEvent("Resize")
END IF

IF NOT ab_pinned THEN
	iuo_parent.Event PanelExpanded(#Orientation)
END IF

RETURN 1
end function

public function integer of_additem (ref window uo_object, string as_text, string as_image);Long ll_image
Long ll_tab
powerdockitems str_item

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_paneltabcontrol.of_AddImage(as_image)
END IF

ll_tab = uo_paneltabcontrol.of_OpenTab(uo_object, as_text, ll_image)
uo_paneltabcontrol.of_SelectTab(ll_tab)

str_item.as_text = as_text
str_item.as_image = as_image
str_item.aw_window = uo_object
str_items[UpperBound(str_items) + 1] = str_item

uo_paneltoolbarstrip.of_AddItem(as_text, as_image)

uo_paneltoolbarstrip.of_DisplayText(TRUE)

IF uo_paneltabcontrol.of_GetTabCount() > 1 AND &
   #Docked THEN
	
	uo_paneltabcontrol.of_ShowTabs()
	uo_paneltabcontrol.of_ShowArrows()
END IF

RETURN ll_tab
end function

public function string of_gettext (window uo_object);Long ll_index, ll_count

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].aw_window = uo_object THEN
		RETURN str_items[ll_index].as_text
	END IF
NEXT


RETURN ""
end function

public function string of_getimage (window uo_object);Long ll_index, ll_count

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].aw_window = uo_object THEN
		RETURN str_items[ll_index].as_image
	END IF
NEXT

RETURN ""
end function

public function integer of_removeitem (window uo_object);Long ll_index, ll_count, ll_newcount
powerdockitems str_newitems[]

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].aw_window = uo_object THEN
		uo_paneltabcontrol.of_RemoveTab(uo_object)
		uo_paneltoolbarstrip.of_RemoveItem(str_items[ll_index].as_text)
	ELSE
		ll_newcount++
		str_newitems[ll_newcount] = str_items[ll_index]
	END IF
NEXT

IF uo_paneltabcontrol.of_GetTabCount() > 0 THEN
	uo_paneltabcontrol.of_SelectTab(1)
END IF

IF uo_paneltabcontrol.of_GetTabCount() = 1 THEN
	uo_paneltabcontrol.of_HideTabs()
END IF

str_items = str_newitems

iuo_parent.TriggerEvent("Resize")

RETURN 1
end function

public function integer of_setfocus (window uo_object);RETURN uo_paneltabcontrol.of_SelectTab(uo_object)
end function

public function integer of_closeitem (window uo_object);Long ll_index, ll_count, ll_newcount
Boolean lb_found
powerdockitems str_newitems[]

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].aw_window = uo_object THEN
		lb_found = TRUE
		uo_paneltabcontrol.of_CloseTab(uo_object)
		uo_paneltoolbarstrip.of_RemoveItem(str_items[ll_index].as_text)
	ELSE
		ll_newcount++
		str_newitems[ll_newcount] = str_items[ll_index]
	END IF
NEXT

IF lb_found THEN
	IF uo_paneltabcontrol.of_GetTabCount() > 0 THEN
		uo_paneltabcontrol.of_SelectTab(1)
	END IF
	
	IF uo_paneltabcontrol.of_GetTabCount() = 1 THEN
		uo_paneltabcontrol.of_HideTabs()
	END IF
	
	IF THIS.of_GetItemCount() = 0 THEN
		THIS.#Docked = FALSE
		THIS.inv_timer.Stop()
		THIS.of_Undock()
		
		IF #Orientation = TOP OR #Orientation = BOTTOM THEN
			THIS.Height = 0
		ELSE
			THIS.Width = 0
		END IF
	
	END IF
	
	str_items = str_newitems
	
	iuo_parent.TriggerEvent("Resize")
END IF

RETURN 1
end function

public function long of_settext (window uo_object, string as_text);Long ll_index, ll_count

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].aw_window = uo_object THEN
		 uo_paneltoolbarstrip.of_SetText(str_items[ll_index].as_text, as_text)
		 uo_paneltabcontrol.of_SetText(uo_object, as_text)
		 
		 IF uo_paneltabcontrol.of_GetText(uo_paneltabcontrol.of_GetSelectedTab()) = as_text THEN
			uo_panelheader.of_SetText(as_text, uo_panelheader.LEFT)
		 END IF
		 
		 str_items[ll_index].as_text = as_text
	END IF
NEXT

RETURN 0
end function

public function long of_settext (userobject uo_object, string as_text);Long ll_index, ll_count

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].ado_object = uo_object THEN
		 uo_paneltoolbarstrip.of_SetText(str_items[ll_index].as_text, as_text)
		 uo_paneltabcontrol.of_SetText(uo_object, as_text)
		 
		 IF uo_paneltabcontrol.of_GetText(uo_paneltabcontrol.of_GetSelectedTab()) = as_text THEN
			uo_panelheader.of_SetText(as_text, uo_panelheader.LEFT)
		 END IF
		 
		 str_items[ll_index].as_text = as_text
	END IF
NEXT

RETURN 0
end function

public function window of_currentwindow ();RETURN uo_paneltabcontrol.of_GetWindow(uo_paneltabcontrol.of_GetSelectedTab())
end function

public function boolean of_candockpanelclose ();RETURN uo_paneltabcontrol.of_CanClose(uo_paneltabcontrol.of_GetSelectedTab())
end function

public function integer of_additem (ref userobject uo_object, string as_text, string as_image, boolean ab_canclose);Long ll_image
Long ll_tab
powerdockitems str_item

str_item.as_text = as_text
str_item.as_image = as_image
str_item.ado_object = uo_object
str_items[UpperBound(str_items) + 1] = str_item

IF Len(Trim(as_image)) > 0 THEN
	ll_image = uo_paneltabcontrol.of_AddImage(as_image)
END IF

ll_tab = uo_paneltabcontrol.of_OpenTab(uo_object, as_text, ll_image)
uo_paneltabcontrol.of_CanClose(ll_tab, ab_canclose)
uo_paneltabcontrol.of_SelectTab(ll_tab)

Long ll_left, ll_right
ll_left = uo_paneltoolbarstrip.of_AddItem(as_text, as_image)

IF #Orientation = TOP OR #Orientation = BOTTOM THEN
	ll_right = uo_paneltoolbarstrip.of_AddItem(as_text, as_image, uo_paneltoolbarstrip.Right)
	
	IF ib_rtl THEN
		uo_paneltoolbarstrip.of_SetVisible(ll_left, FALSE, uo_paneltoolbarstrip.LEFT)
		uo_paneltoolbarstrip.of_SetVisible(ll_right, TRUE, uo_paneltoolbarstrip.RIGHT)
	ELSE
		uo_paneltoolbarstrip.of_SetVisible(ll_left, TRUE, uo_paneltoolbarstrip.LEFT)
		uo_paneltoolbarstrip.of_SetVisible(ll_right, FALSE, uo_paneltoolbarstrip.RIGHT)
	END IF
END IF

uo_paneltoolbarstrip.of_DisplayText(TRUE)

IF uo_paneltabcontrol.of_GetTabCount() > 1 AND &
   #Docked THEN
	
	uo_paneltabcontrol.of_ShowTabs()
	uo_paneltabcontrol.of_ShowArrows()
END IF

RETURN ll_tab
end function

public function long of_getheight ();RETURN ll_height
end function

public function long of_getwidth ();RETURN ll_width
end function

public function integer of_setfontname (string as_font);uo_panelheader.of_SetFontName(as_font)
uo_paneltoolbarstrip.of_SetFontName(as_font)
uo_paneltabcontrol.of_SetFontName(as_font)

RETURN 1
end function

public function boolean of_isdocked ();RETURN #Docked
end function

public function boolean of_ishovering ();
RETURN uo_paneltoolbarstrip.of_ismousecaptured()
end function

public subroutine of_sethovermode (boolean ab_hover_mode);this.ib_hover_mode = ab_hover_mode

end subroutine

public function integer of_settheme (string as_color);uo_paneltoolbarstrip.of_SetTheme(as_color)
uo_paneltabcontrol.of_SetTheme(as_color)
uo_panelheader.of_SetTheme(as_color)

RETURN 1
end function

public function integer of_setparent (u_cst_powerdock auo_parent);iuo_parent = auo_parent

uo_paneltoolbarstrip.iuo_parent = auo_parent
uo_paneltoolbarstrip.iuo_panel = THIS

RETURN 1
end function

public function integer of_displayborder (boolean ab_switch);
uo_paneltoolbarstrip.of_DisplayBorder(ab_switch)

RETURN 1
end function

public function integer of_setfontcolor (long al_color);uo_paneltoolbarstrip.FontColor = al_color
//uo_panelheader.of_SetTextColor(al_color, uo_panelheader.LEFT)
RETURN 1
end function

public function integer of_righttoleft (boolean ab_switch);ib_rtl = ab_switch

uo_paneltabcontrol.of_RightToLeft(ab_switch)
uo_panelheader.of_RightToLeft(ab_switch)

IF #Orientation = TOP OR #Orientation = BOTTOM THEN
	Long ll_index, ll_count
	
	ll_count = UpperBound(uo_paneltoolbarstrip.ToolbarItemsLeft)
	
	FOR ll_index = 1 TO ll_count
		uo_paneltoolbarstrip.of_SetVisible(ll_index, ib_rtl AND uo_paneltoolbarstrip.ToolbarItemsLeft[ll_index].Position = uo_paneltoolbarstrip.Right)
		uo_paneltoolbarstrip.of_SetVisible(ll_index, NOT ib_rtl AND uo_paneltoolbarstrip.ToolbarItemsLeft[ll_index].Position = uo_paneltoolbarstrip.LEFT)
	NEXT
END IF

RETURN 1
end function

public function integer of_closeitem (userobject uo_object, boolean ab_validate);Long ll_index, ll_count, ll_newcount
Boolean lb_found
powerdockitems str_newitems[]

IF ab_validate AND NOT uo_paneltabcontrol.of_CanClose(uo_object) THEN
	RETURN 0
END IF

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].ado_object = uo_object THEN
		lb_found = TRUE
		uo_paneltabcontrol.of_CloseTab(uo_object)
		uo_paneltoolbarstrip.of_RemoveItem(str_items[ll_index].as_text)
	ELSE
		ll_newcount++
		str_newitems[ll_newcount] = str_items[ll_index]
	END IF
NEXT

IF lb_found THEN
	IF uo_paneltabcontrol.of_GetTabCount() > 0 THEN
		uo_paneltabcontrol.of_SelectTab(1)
	END IF
	
	IF uo_paneltabcontrol.of_GetTabCount() = 1 THEN
		uo_paneltabcontrol.of_HideTabs()
	END IF
	
	IF THIS.of_GetItemCount() = 0 THEN
		THIS.#Docked = FALSE
		THIS.inv_timer.Stop()
		THIS.of_Undock()
		
		IF #Orientation = TOP OR #Orientation = BOTTOM THEN
			THIS.Height = 0
		ELSE
			THIS.Width = 0
		END IF
	
	END IF
	
	str_items = str_newitems
	
	iuo_parent.TriggerEvent("Resize")
END IF

RETURN 1
end function

on u_cst_powerdockpanel.create
this.uo_panelheader=create uo_panelheader
this.uo_paneltoolbarstrip=create uo_paneltoolbarstrip
this.st_1=create st_1
this.uo_paneltabcontrol=create uo_paneltabcontrol
this.inv_win32=create inv_win32
this.Control[]={this.uo_panelheader,&
this.uo_paneltoolbarstrip,&
this.st_1,&
this.uo_paneltabcontrol}
end on

on u_cst_powerdockpanel.destroy
destroy(this.uo_panelheader)
destroy(this.uo_paneltoolbarstrip)
destroy(this.st_1)
destroy(this.uo_paneltabcontrol)
destroy(this.inv_win32)
end on

event constructor;st_1.Hide()

inv_timer = CREATE n_cst_powerdocktiming
inv_timer.i_parent = THIS

uo_panelheader.iuo_parent = THIS 

uo_paneltabcontrol.ib_panel = TRUE
uo_paneltabcontrol.of_HideCloseButton()
//uo_paneltabcontrol.of_SetStyle(uo_paneltabcontrol.EXCEL)
uo_paneltoolbarstrip.of_DisplaySolidBackground(TRUE)
uo_paneltoolbarstrip.of_SetFontName("Segoe UI")
uo_paneltoolbarstrip.of_SetFontSize(9)

CHOOSE CASE #Orientation
	CASE LEFT
		uo_paneltoolbarstrip.il_CurrentOrientation = 2
		uo_paneltabcontrol.of_SetTabPosition(uo_paneltabcontrol.BOTTOM)
	CASE RIGHT
		uo_paneltoolbarstrip.il_CurrentOrientation = 2
		uo_paneltabcontrol.of_SetTabPosition(uo_paneltabcontrol.BOTTOM)
	CASE TOP
		uo_paneltoolbarstrip.il_CurrentOrientation = 1
		uo_paneltabcontrol.of_SetTabPosition(uo_paneltabcontrol.TOP)
	CASE BOTTOM
		uo_paneltoolbarstrip.il_CurrentOrientation = 1
		uo_paneltabcontrol.of_SetTabPosition(uo_paneltabcontrol.BOTTOM)
END CHOOSE



IF #Docked THEN
	uo_paneltoolbarstrip.Hide()
ELSE
	uo_paneltabcontrol.of_HideTabs()
END IF

THIS.TriggerEvent("Resize")

uo_paneltoolbarstrip.ib_fontcoloroverride = TRUE

end event

type uo_panelheader from u_cst_powerdockpanelheader within u_cst_powerdockpanel
integer height = 84
integer taborder = 20
boolean bringtotop = true
end type

on uo_panelheader.destroy
call u_cst_powerdockpanelheader::destroy
end on

event clicked;call super::clicked;Boolean lb_dock

IF THIS.of_IsOverX(xpos, ypos) THEN
	of_CloseItem(of_CurrentObject())
	RETURN
END IF

IF NOT THIS.of_IsOverPin(xpos, ypos) THEN
	RETURN
END IF

lb_dock = NOT #Docked

PARENT.iuo_parent.SetRedraw(FALSE)

IF NOT lb_dock THEN
	inv_timer.Stop()
	of_UnDock()
ELSE
	inv_timer.Stop()
	of_Dock()
END IF

PARENT.iuo_parent.TriggerEvent("Resize")
//POST SetFocus(PARENT.iuo_parent.iw_parent)
end event

event mousewithin;call super::mousewithin;IF PARENT.iuo_parent.ib_allowpanelstomove THEN
	IF KeyDown(KeyLeftButton!) AND ib_headerclicked AND #Docked AND &
		NOT THIS.of_IsOverPin(il_clickedx, il_clickedy) THEN
		IF Abs(il_clickedx - xpos) > 20 OR &
			Abs(il_clickedy - ypos) > 15 THEN
			PARENT.iuo_parent.of_ShowDocker(#Orientation)
		END IF
	END IF
END IF
end event

event lbuttonup;call super::lbuttonup;ib_headerclicked = FALSE
end event

event lbuttondown;call super::lbuttondown;ib_headerclicked = TRUE

il_clickedx = xpos
il_clickedy = ypos
end event

type uo_paneltoolbarstrip from u_cst_powerdockpaneltoolbar within u_cst_powerdockpanel
integer width = 160
integer height = 276
integer taborder = 10
boolean bringtotop = true
end type

on uo_paneltoolbarstrip.destroy
call u_cst_powerdockpaneltoolbar::destroy
end on

event ue_mouseenter;call super::ue_mouseenter;Long ll_index, ll_count

// The user may prefer to expand only when the button is CLICKED, and not on HOVER with delay.
if (NOT ib_hover_mode) then RETURN

is_entered = as_button

Time lt_nowplusone

lt_nowplusone = RelativeTime(Now(), 1)

DO WHILE Now() < lt_nowplusone
	Yield()
LOOP

IF NOT IsValid(THIS) THEN
	RETURN
END IF

IF is_entered <> as_button THEN
	RETURN
END IF

// NOTE: This is the important change.. no accidental flyout panels..
if (NOT of_ishovering()) then RETURN

ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].as_text = as_button THEN
		IF uo_paneltabcontrol.of_GetObject(uo_paneltabcontrol.of_GetSelectedTab()) <> &
		   str_items[ll_index].ado_object THEN
			
			uo_paneltabcontrol.of_SelectTab(str_items[ll_index].ado_object)
		END IF
		
		iuo_parent.EVENT PanelObjectDisplayed(str_items[ll_index].ado_object)
	END IF
NEXT

PARENT.of_Expand()

uo_panelheader.of_SetText(as_button, uo_panelheader.LEFT)


inv_timer.Start(.1)
end event

event constructor;call super::constructor;THIS.of_DisplayBorder(TRUE)
end event

event ue_mouseleave;call super::ue_mouseleave;IF is_entered = as_button THEN
	is_entered = ''
END IF
end event

event ue_buttonclicked;call super::ue_buttonclicked;//Event ue_mouseenter(as_button)

long	ll_count, ll_index

is_entered = as_button

// NOTE: The code below is similar to that in the ue_mouseenter (could probably be refactored into a common function?)
// This change provides immediate response based on a CLICK, and not a pass off to the ue_mouseneter code and related timer.
// This seems to be a better interface for my users.  If this is possible another way then let me know.  I could not find a way to 
// trigger the flyout immediately with a click on a DOCKED panel button.
ll_count = UpperBound(str_items)

FOR ll_index = 1 TO ll_count
	IF str_items[ll_index].as_text = as_button THEN
		IF uo_paneltabcontrol.of_GetObject(uo_paneltabcontrol.of_GetSelectedTab()) <> &
		   str_items[ll_index].ado_object THEN
			
			uo_paneltabcontrol.of_SelectTab(str_items[ll_index].ado_object)
		END IF
		
		iuo_parent.EVENT PanelObjectDisplayed(str_items[ll_index].ado_object)
	END IF
NEXT

PARENT.of_Expand()

uo_panelheader.of_SetText(as_button, uo_panelheader.LEFT)

inv_timer.Start(.1)

end event

type st_1 from statictext within u_cst_powerdockpanel
integer width = 5001
integer height = 5000
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16777215
long backcolor = 8421376
string text = "  PowerDockPanel"
boolean focusrectangle = false
end type

type uo_paneltabcontrol from u_cst_tabcontrol within u_cst_powerdockpanel
integer width = 562
integer height = 276
integer taborder = 20
end type

on uo_paneltabcontrol.destroy
call u_cst_tabcontrol::destroy
end on

event selectionchanging;call super::selectionchanging;uo_panelheader.of_SetText(of_GetText(newindex), uo_panelheader.LEFT)

iuo_parent.EVENT PanelObjectDisplayed(THIS.of_getobject(newindex))
end event

event selectionchanged;call super::selectionchanged;uo_panelheader.SetRedraw(TRUE)
end event

type inv_win32 from n_cst_win32 within u_cst_powerdockpanel descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

