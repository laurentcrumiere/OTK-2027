$PBExportHeader$u_cst_ribboncontainer.sru
forward
global type u_cst_ribboncontainer from userobject
end type
type uo_ribbon from u_cst_ribbon within u_cst_ribboncontainer
end type
type uo_shadow from u_cst_canvas within u_cst_ribboncontainer
end type
type uo_quickaccess from u_cst_toolbarstrip within u_cst_ribboncontainer
end type
type inv_pbusexternal from n_cst_pbusexternal within u_cst_ribboncontainer
end type
type inv_win32 from n_cst_win32 within u_cst_ribboncontainer
end type
end forward

global type u_cst_ribboncontainer from userobject
integer width = 1024
integer height = 500
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
event lbuttondown pbm_lbuttondown
event ue_programtabclicked ( )
event ue_mousewheel ( long wparam,  long lparam )
event type long ribbontabclosing ( long index )
event ribbontabclosed ( long index )
event ue_ribbontabclicked ( long newindex )
event wm_mousewheel pbm_custom74
uo_ribbon uo_ribbon
uo_shadow uo_shadow
uo_quickaccess uo_quickaccess
inv_pbusexternal inv_pbusexternal
inv_win32 inv_win32
end type
global u_cst_ribboncontainer u_cst_ribboncontainer

type prototypes

end prototypes

type variables
Boolean ib_docked
Boolean ib_expanded
Boolean ib_captured
Boolean ib_rtl
Boolean ib_office365
Boolean ib_office365_2
Boolean ib_darktheme

n_cst_ribbontiming inv_timer
Long il_dockheight = 510 //430
CONSTANT Long il_collapsedheight = 88
Long il_qaheight
Boolean ib_shadowhidden

w_ribbonwindow iw_parent

Menu im_quickaccessitems[]

Long il_quickaccessposition = 0
CONSTANT Long TOP = 0
CONSTANT Long BOTTOM = 1

n_cst_base_painter inv_painter

Long il_selectedtaboverride

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
public function long of_getheight ()
public function integer of_undock ()
public function integer of_dock ()
public function u_cst_ribbon of_getribbon ()
public function integer of_tabclicked ()
public function integer of_hide ()
public function integer of_postconstructor ()
public function integer of_tabsdoubleclicked (integer al_index)
public function integer of_setparent (window aw_parent)
public function integer of_settheme (string as_color)
public function integer of_gety ()
public function integer of_clearquickaccess ()
public function integer of_displayquickaccess (long al_quickaccessposition)
public function integer of_displayprogramorb (string as_image)
public function integer of_collapse ()
public function w_ribbonwindow of_getparent ()
public function long of_getbackcolor (long al_backcolor)
public function integer of_righttoleft (boolean ab_switch)
public function integer of_clickquickaccess (long al_index)
public function integer of_drawquickaccesshotkeys (longptr hdc)
public function integer of_drawquickaccesshotkeys (u_cst_toolbarstrip auo_qa, longptr hdc)
public function integer of_buildquickaccess (menu am_menu)
public function integer of_hideshadow ()
end prototypes

event resize;Int li_shadowheight

IF IsValid(iw_parent) THEN
	IF iw_parent.HideRibbonShadow OR ib_office365_2 THEN
		li_shadowheight = 0
	ELSE
		li_shadowheight = PixelsToUnits(inv_win32.ScaleDPI(Handle(THIS), 6), YPixelsToUnits!)
	END IF
END IF

IF ib_docked THEN
	IF ib_office365_2 THEN
		uo_ribbon.Resize(NewWidth, NewHeight - li_shadowheight - il_qaheight - 10)
	ELSE
		uo_ribbon.Resize(NewWidth, NewHeight - li_shadowheight - il_qaheight)
	END IF
ELSE
	uo_ribbon.Width = NewWidth
END IF
uo_quickaccess.Width = NewWidth

uo_shadow.Resize(NewWidth, li_shadowheight)

IF il_quickaccessposition = BOTTOM THEN
	IF ib_docked OR ib_expanded THEN
		uo_quickaccess.Y = Height - uo_quickaccess.Height - PixelsToUnits(inv_win32.ScaleDPI(Handle(THIS), 2), YPixelsToUnits!)
	ELSE
		uo_quickaccess.Y = Height - uo_quickaccess.Height
	END IF
ELSE
	
	//uo_shadow.Y = il_dockheight + il_qaheight - PixelsToUnits(7, YPixelsToUnits!)
END IF

IF ib_office365 OR ib_office365_2 THEN
	uo_shadow.Y = uo_ribbon.Y + uo_ribbon.Height - PixelsToUnits(inv_win32.ScaleDPI(Handle(THIS), 1), YPixelsToUnits!)
ELSE
	uo_shadow.Y = uo_ribbon.Y + uo_ribbon.Height - PixelsToUnits(inv_win32.ScaleDPI(Handle(THIS), 5), YPixelsToUnits!)
END IF
end event

event lbuttondown;IF NOT ib_docked AND ib_expanded THEN
	POINT lp
	ulong ll
	ulong lul
	
	lul = Handle(this)
	
	inv_win32.GetCursorPos(lp)
	inv_win32.Screentoclient(lul, lp)
	
	IF lp.px < 0 OR lp.px > UnitsToPixels(this.width, XUnitsToPixels!) OR &
		lp.py < UnitsToPixels(uo_ribbon.Y + THIS.Y, YUnitsToPixels!) OR lp.py > UnitsToPixels(this.height, YUnitsToPixels!) THEN
		
		of_UnDock()
	END IF
	
	inv_win32.ReleaseCapture()
	ib_captured = FALSE
END IF
end event

event ue_mousewheel(long wparam, long lparam);Long ll_start, ll_current, ll_total
		
IF uo_ribbon.ib_displayprogramtab THEN
	ll_start = 2
ELSE
	ll_start = 1
END IF

ll_current = uo_ribbon.of_GetSelectedTab()
ll_total = uo_ribbon.of_GetTabCount()

u_cst_ribbonpanel luo_panel
luo_panel = uo_ribbon.of_GetObject(ll_current)
luo_panel.of_ReleaseMouse()
luo_panel.of_MouseOver(0)

If (IntHigh(wparam) > 0) Then
	//Select tab to the left
	IF ll_current > ll_start THEN
		uo_ribbon.of_SelectTab(ll_current - 1)
	END IF
Else
	//Select tab to the right
	IF ll_current < ll_total THEN
		uo_ribbon.of_SelectTab(ll_current + 1)
	END IF
End If

iw_parent.SetFocus()
end event

event type long ribbontabclosing(long index);RETURN iw_parent.Event RibbonTabClosing(index)
end event

event ribbontabclosed(long index);iw_parent.EVENT RibbonTabClosed(index)
end event

event ue_ribbontabclicked(long newindex);string ls_menuclassname
u_cst_ribbonpanel panel

IF newindex < 1 THEN
	IF iw_parent.Advanced THEN
		n_ribbonwindow_advanced lnvo
		lnvo = iw_parent.of_GetNVO()
		lnvo.title_rbuttondown()
	END IF
	
ELSE

	panel = uo_ribbon.of_GetObject(newindex)
	
	il_selectedtaboverride = newindex
	
	IF IsValid(panel) THEN
		iw_parent.Event RibbonTabClicked(uo_ribbon.of_GetText(newindex), panel.Tag)
	END IF
END IF
end event

public function long of_getheight ();IF ib_docked THEN
	RETURN Height
END IF

RETURN Height + 8
end function

public function integer of_undock ();inv_timer.Stop()

boolean ib_wasdocked

ib_wasdocked = ib_docked

ib_docked = FALSE
ib_expanded = FALSE
uo_ribbon.il_selected = 0
uo_ribbon.il_index = 0
uo_ribbon.ib_dirty = TRUE
uo_ribbon.POST SetRedraw(TRUE)

inv_win32.ReleaseCapture()
ib_captured = FALSE

THIS.Height = il_collapsedheight + il_qaheight  - 4//+ 4

IF IsValid(iw_parent) THEN iw_parent.TriggerEvent("resize")
IF IsValid(iw_parent) and ib_wasdocked THEN iw_parent.TriggerEvent("ribbonundocked")

RETURN 1
end function

public function integer of_dock ();inv_timer.Stop()

ib_docked = TRUE
ib_expanded = TRUE
uo_ribbon.ib_dirty = TRUE
uo_ribbon.POST SetRedraw(TRUE)

inv_win32.ReleaseCapture()
ib_captured = FALSE

Height = il_dockheight + il_qaheight 

IF IsValid(iw_parent) THEN iw_parent.TriggerEvent("resize")
IF IsValid(iw_parent) THEN iw_parent.TriggerEvent("ribbondocked")

RETURN 1
end function

public function u_cst_ribbon of_getribbon ();RETURN uo_ribbon
end function

public function integer of_tabclicked ();

RETURN 1
end function

public function integer of_hide ();
POINT lp
ulong ll
ulong lul

lul = Handle(this)

inv_win32.GetCursorPos(lp)
inv_win32.Screentoclient(lul, lp)

IF lp.px < 0 OR lp.px > UnitsToPixels(this.width, XUnitsToPixels!) OR &
	lp.py < 0 OR lp.py > UnitsToPixels(this.height, YUnitsToPixels!) THEN

	inv_win32.SetCapture(lul)
	ib_captured = TRUE
ELSE
	IF ib_captured THEN
		ib_captured = FALSE
		inv_win32.ReleaseCapture()
	END IF
END IF

RETURN 1
end function

public function integer of_postconstructor ();uo_quickaccess.of_QuickAccessMode(uo_ribbon.il_backcolor)

SetRedraw(TRUE)

RETURN 1
end function

public function integer of_tabsdoubleclicked (integer al_index);IF al_index < 1 AND iw_parent.Advanced THEN
		n_ribbonwindow_advanced lnvo
		lnvo = iw_parent.of_GetNVO()
		lnvo.title_doubleclicked()
ELSE

	IF ib_docked THEN
		of_Undock()
	ELSE
	
		IF al_index <= 0 THEN al_index = il_selectedtaboverride
		IF al_index <= 0 THEN al_index = 1
	
		of_Dock()
		
		IF uo_ribbon.ib_displayprogramtab AND al_index = 1 THEN
			IF uo_ribbon.of_GetSelectedTab() <= 1 THEN
				uo_ribbon.of_SelectTab(2)
			ELSE
				uo_ribbon.of_SelectTab(uo_ribbon.of_GetSelectedTab())
			END IF
		ELSE
			uo_ribbon.of_SelectTab(al_index)
		END IF
	END IF
END IF

RETURN 1
end function

public function integer of_setparent (window aw_parent);iw_parent = aw_parent

RETURN 1
end function

public function integer of_settheme (string as_color);uo_ribbon.of_SetTheme(as_color)

IF Pos(Lower(as_color), "_dark", 1) > 0 OR Pos(Lower(as_color), "_black", 1) > 0 THEN
	ib_darktheme = TRUE
ELSE
	ib_darktheme = FALSE
END IF

uo_Shadow.SetRedraw(TRUE)

RETURN 1
end function

public function integer of_gety ();RETURN Y + uo_ribbon.Y
end function

public function integer of_clearquickaccess ();Menu lm_quickaccessitems[]
im_quickaccessitems = lm_quickaccessitems[]
RETURN 1
end function

public function integer of_displayquickaccess (long al_quickaccessposition);il_quickaccessposition = al_quickaccessposition

IF UpperBound(im_quickaccessitems) > 0 THEN
	uo_quickaccess.Visible = TRUE
	il_qaheight = 88
	
	IF al_quickaccessposition = TOP THEN
		uo_quickaccess.Y = 0
		uo_ribbon.Y = il_qaheight
	ELSE
		uo_quickaccess.Y = uo_ribbon.Height
		uo_ribbon.Y = 0
	END IF
ELSE
	uo_quickaccess.Visible = FALSE
	uo_ribbon.Y = 0
	il_qaheight = 0
END IF

IF ib_docked THEN
	THIS.Height = il_dockheight + il_qaheight
ELSE
	THIS.Height = il_collapsedheight + il_qaheight
END IF

RETURN 1
end function

public function integer of_displayprogramorb (string as_image);of_DisplayQuickAccess(TOP)
//uo_quickaccess.X = uo_orb.X + uo_orb.Width + 8
uo_ribbon.ib_displayprogramorb = TRUE
//uo_orb.of_SetImage(as_image)
//uo_orb.Show()
RETURN 1
end function

public function integer of_collapse ();IF NOT ib_docked AND ib_expanded THEN
	of_UnDock()
	inv_win32.ReleaseCapture()
	ib_captured = FALSE
END IF

RETURN 1
end function

public function w_ribbonwindow of_getparent ();RETURN iw_parent
end function

public function long of_getbackcolor (long al_backcolor);long ll_ret

CHOOSE CASE al_backcolor
	CASE PBACTIVE_BORDER
		ll_ret = inv_win32.GetSysColor(ACTIVEBORDER)
	CASE PBACTIVE_TITLE_BAR
		ll_ret = inv_win32.GetSysColor(ACTIVECAPTION)
	CASE PBACTIVE_TITLE_BAR_TEXT
	CASE PBAPPLICATION_WORKSPACE
		ll_ret = inv_win32.GetSysColor(APPWORKSPACE)
	CASE PBBUTTON_DARK_SHADOW
	CASE PBBUTTON_FACE
		ll_ret = inv_win32.GetSysColor(BTNFACE)
	CASE PBBUTTON_HIGHLIGHT
		ll_ret = inv_win32.GetSysColor(BTNHILIGHT)
	CASE PBBUTTON_LIGHT_SHADOW
	CASE PBBUTTON_SHADOW
		ll_ret = inv_win32.GetSysColor(BTNSHADOW)
	CASE PBBUTTON_TEXT
		ll_ret = inv_win32.GetSysColor(BTNTEXT)
	CASE PBDESKTOP
		ll_ret = inv_win32.GetSysColor(DESKTOP)
	CASE PBDISABLED_TEXT
		ll_ret = inv_win32.GetSysColor(INACTIVECAPTIONTEXT)
	CASE PBHIGHLIGHT
		ll_ret = inv_win32.GetSysColor(HIGHLIGHT)
	CASE PBHIGHLIGHT_TEXT
		ll_ret = inv_win32.GetSysColor(HIGHLIGHTTEXT)
	CASE PBINACTIVE_BORDER
		ll_ret = inv_win32.GetSysColor(INACTIVEBORDER)
	CASE PBINACTIVE_TITLE_BAR
		ll_ret = inv_win32.GetSysColor(INACTIVECAPTION)
	CASE PBINACTIVE_TITLE_BAR_TEXT
		ll_ret = inv_win32.GetSysColor(INACTIVECAPTIONTEXT)
	CASE PBLINK
	CASE PBLINK_HOVER
	CASE PBLINK_ACTIVE
	CASE PBLINK_VISITED
	CASE PBMENU_BAR
		ll_ret = inv_win32.GetSysColor(MENU)
	CASE PBMENU_TEXT
		ll_ret = inv_win32.GetSysColor(MENUTEXT)
	CASE PBSCROLLBAR
		ll_ret = inv_win32.GetSysColor(SCROLLBAR)
	CASE PBTRANSPARENT
		ll_ret = PBTRANSPARENT
	CASE PBTOOLTIP
		ll_ret = inv_win32.GetSysColor(INFOBK)
	CASE PBTOOLTIP_TEXT
		ll_ret = inv_win32.GetSysColor(INFOTEXT)
	CASE PBWINDOW_BACKGROUND
		ll_ret = inv_win32.GetSysColor(WINDOW)
	CASE PBWINDOW_FRAME
		ll_ret = inv_win32.GetSysColor(WINDOWFRAME)
	CASE PBWINDOW_TEXT
		ll_ret = inv_win32.GetSysColor(WINDOWTEXT)
	CASE ELSE
		ll_ret = al_backcolor
END CHOOSE

RETURN ll_ret
end function

public function integer of_righttoleft (boolean ab_switch);uo_ribbon.of_RightToLeft(ab_switch)
//uo_quickaccess.of_RightToLeft(ab_switch)

Long ll_index, ll_count

ll_count = UpperBound(uo_quickaccess.ToolbarItemsLeft)

FOR ll_index = 1 TO ll_count
	IF ab_switch THEN
		uo_quickaccess.ToolbarItemsLeft[ll_index].Position = uo_quickaccess.RIGHT
	ELSE
		uo_quickaccess.ToolbarItemsLeft[ll_index].Position = uo_quickaccess.LEFT
	END IF
NEXT

IF ab_switch THEN
	uo_ribbon.of_TriggerEventAll("ue_righttoleft", 0, 0)
ELSE
	uo_ribbon.of_TriggerEventAll("ue_leftotright", 0, 0)
END IF

ib_rtl = ab_switch

RETURN 1
end function

public function integer of_clickquickaccess (long al_index);Long ll_index, ll_count, ll_totalvalid

ll_count = UpperBound(im_quickaccessitems)

FOR ll_index = 1 TO ll_count
	IF IsValid(im_quickaccessitems[ll_index]) THEN
		ll_totalValid++
	END IF
	
	IF ll_totalvalid = al_index THEN
		im_quickaccessitems[ll_index].PostEvent("Clicked")
		RETURN 1
	END IF
	
NEXT

RETURN 1
end function

public function integer of_drawquickaccesshotkeys (longptr hdc);RETURN of_DrawQuickAccessHotKeys(uo_quickaccess, hdc)
end function

public function integer of_drawquickaccesshotkeys (u_cst_toolbarstrip auo_qa, longptr hdc);Long ll_index, ll_count, ll_start, ll_pointindex, ll_xcorrection, ll_total
String ls_alttag
n_cst_ribbongroup_painter luo_painter
strgroupbox lstrgroupbox

u_cst_ribbonpanel luo_panel
lstrgroupbox.fontfamily = 'Segoe UI'
lstrgroupbox.fontsize = 10

ll_count = UpperBound(auo_qa.ToolbarItemsLeft)

luo_painter.of_SetDeviceContext(THIS)
luo_painter.of_SetHDC(hdc)
luo_painter.istrgroupbox = lstrgroupbox

FOR ll_index = 1 TO ll_count
	
	IF auo_qa.ToolbarItemsLeft[ll_index].Separator THEN CONTINUE
	
	ll_total++

	luo_painter.of_DrawAltBox(hdc, auo_qa.ToolbarItemsLeft[ll_index].paintregion[2].px + ll_xcorrection, auo_qa.ToolbarItemsLeft[ll_index].paintregion[2].py)
	luo_painter.of_DrawTextCenter(String(ll_total), 0, &
		            auo_qa.ToolbarItemsLeft[ll_index].paintregion[2].px + inv_win32.ScaleDPI(Handle(THIS), 2) + ll_xcorrection, &
						auo_qa.ToolbarItemsLeft[ll_index].paintregion[2].py - inv_win32.ScaleDPI(Handle(THIS), 1), &
						auo_qa.ToolbarItemsLeft[ll_index].paintregion[2].px + inv_win32.ScaleDPI(Handle(THIS), 11) + ll_xcorrection, &
						auo_qa.ToolbarItemsLeft[ll_index].paintregion[2].py + inv_win32.ScaleDPI(Handle(THIS), 12))
	
NEXT

RETURN 1
end function

public function integer of_buildquickaccess (menu am_menu);Long ll_index, ll_count
Long ll_item
String ls_image

//Add to quick access toolbar
IF IsValid(am_menu) THEN
	IF Pos(Lower(am_menu.Tag), "quickaccess:true", 1) > 0 THEN
		
		IF am_menu.Text = "-" THEN
			IF ib_rtl THEN
				uo_quickaccess.of_AddSeparator(uo_quickaccess.RIGHT)
			ELSE
				uo_quickaccess.of_AddSeparator()
			END IF
		ELSE
			ls_image = am_menu.toolbaritemname
			
			IF Len(Trim(ls_image)) = 0 THEN
				ls_image = "BorderNone!"
			END IF
			
			IF ib_rtl THEN
				ll_item = uo_quickAccess.of_AddItem(am_menu.Text, am_menu.toolbaritemname, am_menu.MicroHelp, uo_quickAccess.RIGHT)
			ELSE
				ll_item = uo_quickAccess.of_AddItem(am_menu.Text, am_menu.toolbaritemname, am_menu.MicroHelp)
			END IF
			im_quickaccessitems[ll_item] = am_menu
		END IF
		
	END IF
	
	//Recursively add children to quick access toolbar
	ll_count = UpperBound(am_menu.Item)
	
	FOR ll_index = 1 TO ll_count
		of_BuildQuickAccess(am_menu.Item[ll_index])
	NEXT
END IF

RETURN 1
end function

public function integer of_hideshadow ();il_dockheight = il_dockheight - PixelsToUnits(6, YPixelsToUnits!)
IF ib_docked THEN
	of_Dock()
END IF

ib_shadowhidden = TRUE

RETURN 1
end function

on u_cst_ribboncontainer.create
this.uo_ribbon=create uo_ribbon
this.uo_shadow=create uo_shadow
this.uo_quickaccess=create uo_quickaccess
this.inv_pbusexternal=create inv_pbusexternal
this.inv_win32=create inv_win32
this.Control[]={this.uo_ribbon,&
this.uo_shadow,&
this.uo_quickaccess}
end on

on u_cst_ribboncontainer.destroy
destroy(this.uo_ribbon)
destroy(this.uo_shadow)
destroy(this.uo_quickaccess)
destroy(this.inv_pbusexternal)
destroy(this.inv_win32)
end on

event constructor;//PBUSSetWndProc (Handle(THIS))
SetRedraw(FALSE)

ib_docked = TRUE
uo_ribbon.iuo_parentcontainer = THIS

inv_timer = CREATE n_cst_ribbontiming
inv_timer.i_parent = THIS

POST of_PostConstructor()
end event

type uo_ribbon from u_cst_ribbon within u_cst_ribboncontainer
integer height = 488
integer taborder = 20
boolean bringtotop = true
borderstyle borderstyle = stylelowered!
long fontsize = 10
end type

on uo_ribbon.destroy
call u_cst_ribbon::destroy
end on

event selectionchanging;call super::selectionchanging;IF NOT ib_expanded AND NOT ib_docked THEN
	ib_expanded = TRUE
	
	PARENT.Height = il_dockheight + il_qaheight
	
	PARENT.BringToTop = TRUE
	
	inv_timer.Start(.1)

END IF
end event

event tabclosed;call super::tabclosed;PARENT.EVENT RibbonTabClosed(index)
end event

event tabclosing;call super::tabclosing;RETURN PARENT.Event RibbonTabClosing(index)
end event

type uo_shadow from u_cst_canvas within u_cst_ribboncontainer
integer y = 152
integer taborder = 20
end type

on uo_shadow.destroy
call u_cst_canvas::destroy
end on

event onpaint;call super::onpaint;Long ll_color

ll_color =  uo_ribbon.of_GetColor("BORDER")

inv_painter.of_sethdc (hdc)
inv_painter.of_setdevicecontext (THIS)
inv_painter.of_xpgradient (ll_color, of_GetBackColor(PARENT.BackColor), THIS, FALSE, PARENT.BackColor, TRUE)

RETURN 1
end event

type uo_quickaccess from u_cst_toolbarstrip within u_cst_ribboncontainer
boolean visible = false
integer taborder = 20
end type

on uo_quickaccess.destroy
call u_cst_toolbarstrip::destroy
end on

event ue_buttonclicked;call super::ue_buttonclicked;Long ll_index

ll_index = THIS.of_GetIndex(as_button)

IF ll_index > 0 THEN
	IF im_quickaccessitems[ll_index].Enabled THEN
		im_quickaccessitems[ll_index].PostEvent("Clicked")
	END IF
END IF


end event

event lbuttonup;call super::lbuttonup;IF PARENT.ib_expanded AND NOT PARENT.ib_docked  THEN
	PARENT.of_UnDock()
END IF
end event

event onpaint;call super::onpaint;Long ll_index, ll_count

ll_count = UpperBound(im_quickaccessitems)

FOR ll_index = 1 to ll_count
	IF IsValid(im_quickaccessitems[ll_index]) THEN
		IF of_IsEnabled(ll_index) <> im_quickaccessitems[ll_index].Enabled THEN
			of_SetEnabled(ll_index, im_quickaccessitems[ll_index].Enabled)
		END IF
	END IF
NEXT


IF PARENT.iw_parent.of_AltKeyPressed() AND NOT PARENT.iw_parent.of_AltLetterKeyPressed() THEN
	of_DrawQuickAccessHotKeys(hdc)
END IF

RETURN 1
end event

type inv_pbusexternal from n_cst_pbusexternal within u_cst_ribboncontainer descriptor "pb_nvo" = "true" 
end type

on inv_pbusexternal.create
call super::create
end on

on inv_pbusexternal.destroy
call super::destroy
end on

type inv_win32 from n_cst_win32 within u_cst_ribboncontainer descriptor "pb_nvo" = "true" 
end type

on inv_win32.create
call super::create
end on

on inv_win32.destroy
call super::destroy
end on

