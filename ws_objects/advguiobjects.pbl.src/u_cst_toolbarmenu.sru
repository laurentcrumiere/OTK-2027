$PBExportHeader$u_cst_toolbarmenu.sru
forward
global type u_cst_toolbarmenu from u_cst_buttonlistbar
end type
end forward

global type u_cst_toolbarmenu from u_cst_buttonlistbar
boolean visible = false
boolean ib_boldselected = true
long il_currentsize = 16
long il_currentstyle = 2
event losefocus pbm_killfocus
event lbuttondown pbm_lbuttondown
event keydown pbm_keydown
end type
global u_cst_toolbarmenu u_cst_toolbarmenu

type variables
u_cst_toolbarstrip iToolbar
long il_GroupItem

Boolean ib_mousein
end variables

forward prototypes
public function integer of_settoolbar (u_cst_toolbarstrip atoolbar)
public function integer of_setgroupitem (long al_groupitem)
public function integer of_capture ()
public function long of_getcolor (string as_color)
end prototypes

event lbuttondown;IF NOT ib_mousein THEN
	inv_win32.ReleaseCapture()
	iToolbar.Post of_CloseDropMenu()
END IF
end event

event keydown;inv_win32.ReleaseCapture()
	iToolbar.Post of_CloseDropMenu()
end event

public function integer of_settoolbar (u_cst_toolbarstrip atoolbar);iToolbar = aToolbar

RETURN 1
end function

public function integer of_setgroupitem (long al_groupitem);il_GroupItem = al_groupitem

RETURN 1
end function

public function integer of_capture ();inv_win32.SetCapture(Handle(THIS))

RETURN 1
end function

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


RETURN inv_color_theme.of_GetColor(inv_color_theme.ToolbarMenu, as_color)
end function

on u_cst_toolbarmenu.create
call super::create
end on

on u_cst_toolbarmenu.destroy
call super::destroy
end on

event selectionchanged;call super::selectionchanged;Long ll_item

ll_item = Long(of_GetData(newIndex))

iToolbar.of_SetGroupItem(il_GroupItem, ll_item)
iToolbar.Event ue_ButtonClicked(of_GetText(newIndex))

inv_win32.ReleaseCapture()

iToolbar.Post of_CloseDropMenu()
end event

event mousemove;Long ll_index

if NOT of_ismousecaptured() then 
	
	of_capturemouse()
	
	this.event mouseenter()
		
else
	
	if xpos < 0 or ypos < 0 or xpos > width or ypos > height then
		
		ib_mousein = FALSE
		
		of_MouseOver(0)
	ELSE
		ib_mousein = TRUE
		
		ll_index = of_IndexFromPoint(xpos, ypos)
		IF il_index <> ll_index THEN
			of_MouseOver(ll_index)
		END IF
	
	end if

end if
end event

event mouseenter;call super::mouseenter;ib_mousein = TRUE
end event

type uo_scrolldown from u_cst_buttonlistbar`uo_scrolldown within u_cst_toolbarmenu
end type

type uo_scrollup from u_cst_buttonlistbar`uo_scrollup within u_cst_toolbarmenu
end type

type st_pbus_buttonlistbarlabel from u_cst_buttonlistbar`st_pbus_buttonlistbarlabel within u_cst_toolbarmenu
end type

