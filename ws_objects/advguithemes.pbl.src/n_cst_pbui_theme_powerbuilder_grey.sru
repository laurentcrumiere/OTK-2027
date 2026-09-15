$PBExportHeader$n_cst_pbui_theme_powerbuilder_grey.sru
forward
global type n_cst_pbui_theme_powerbuilder_grey from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_powerbuilder_grey from n_cst_pbui_theme
end type
global n_cst_pbui_theme_powerbuilder_grey n_cst_pbui_theme_powerbuilder_grey

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);Long ll_color

as_object = Upper(as_object)

CHOOSE CASE Upper(as_color)
	CASE "GROUPTEXT"
		ll_color = RGB(30,57,91)
	CASE "BUTTONBORDER"
		ll_color = RGB(131,137,151)
	CASE "TILE"
		ll_color = RGB(131,137,151)
	CASE "BORDER"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(171,184,201)
			CASE ShortcutBar, XPHeader
				ll_color = RGB(214,212,212)
			CASE PowerDockPanel
				ll_color = RGB(131,137,151)
			CASE PBUSButton
				ll_color = RGB(179,179,179)
			CASE ToggleButton
				ll_color = RGB(131,137,151)
			CASE ELSE
				ll_color = RGB(214,212,212)
		END CHOOSE
	CASE "ITEMBORDER"
		CHOOSE CASE as_object
			CASE ButtonListBar
				ll_color = RGB(214,212,212)
			CASE Toolbar
				ll_color = RGB(234,234,234)
			CASE ELSE
				ll_color =  RGB(214,212,212)
		END CHOOSE
	CASE "ITEMTOGGLED1"
		ll_color = RGB(131,137,151)
	CASE "ITEMTOGGLED2"
		ll_color = RGB(131,137,151)
	CASE "HOVER1"
		CHOOSE CASE as_object
			CASE ShortcutBar
				ll_color = RGB(234,234,234)
			CASE TabControl
				ll_color = RGB(221,221,223)
			CASE RibbonPanel, RibbonMenuList
				ll_color = RGB(131,137,151)
			CASE PBUSButton, Toolbar
				ll_color = RGB(217,217,217)
			CASE ELSE
				ll_color = RGB(234,234,234)
		END CHOOSE
	CASE "HOVER2"
		CHOOSE CASE as_object
			CASE ShortcutBar
				ll_color = RGB(234,234,234)
			CASE TabControl
				ll_color = RGB(221,221,223)
			CASE RibbonPanel, RibbonMenuList
				ll_color = RGB(131,137,151)
			CASE PBUSButton, Toolbar
				ll_color = RGB(217,217,217)
			CASE ELSE
				ll_color = RGB(234,234,234)
		END CHOOSE
	CASE "HEADER1"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = RGB(131,137,151)
		END CHOOSE
	CASE "HEADER2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = RGB(131,137,151)
		END CHOOSE
	CASE "FOOTER1"
		ll_color = RGB(255,255,255)
	CASE "FOOTER2"
		ll_color = RGB(255,255,255)
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1"
		CHOOSE CASE as_object
			CASE ToggleButton
				ll_color = RGB(131,137,151)
			CASE RibbonStatusBar
				ll_color = RGB(131,137,151)
			CASE SPA
				ll_color = RGB(161,167,170)
			CASE TabControl
				ll_color = RGB(239,239,242)
			CASE PBUSMessage
				ll_color = RGB(105,102,101)
			CASE PBUSButton
				ll_color = RGB(204,204,204)
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
		
	CASE "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE ToggleButton
				ll_color = RGB(131,137,151)
			CASE TabControl
				ll_color = RGB(239,239,242)
			CASE PBUSButton
				ll_color = RGB(204,204,204)
			CASE PBUSMessage
				ll_color = RGB(105,102,101)
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "BACKGROUND3" //Solid state for toolbar
		CHOOSE CASE as_object
			CASE PowerCalc
				ll_color = RGB(201,201,218)
			CASE ELSE
				ll_color = RGB(239,239,242)
		END CHOOSE
	CASE "BACKGROUND4" //Quick Access Toolbar in Ribbon
		ll_color = RGB(239,239,242)
	CASE "HOVERSELECTED1"
		CHOOSE CASE as_object
			CASE ShortcutBar
				ll_color = RGB(214,212,212)
			CASE PBUSButton, Toolbar
				ll_color = RGB(204,204,204)
			CASE ELSE
				ll_color = RGB(214,212,212)
		END CHOOSE
	CASE "HOVERSELECTED2"
		CHOOSE CASE as_object
			CASE ShortcutBar
				ll_color = RGB(214,212,212)
			CASE PBUSButton, Toolbar
				ll_color = RGB(204,204,204)
			CASE ELSE
				ll_color = RGB(214,212,212)
		END CHOOSE
	CASE "SELECTED1"
		CHOOSE CASE as_object
			CASE RibbonTab
				ll_color = RGB(255,255,255)
			CASE ShortcutBar
				ll_color = RGB(214,212,212)
			CASE TabControl, ButtonListBar
				ll_color = RGB(131,137,151)
			CASE PBUSButton, Toolbar
				ll_color = RGB(191,191,191)
			CASE ELSE
				ll_color = RGB(214,212,212)
		END CHOOSE
	CASE "SELECTED2"
		CHOOSE CASE as_object
			CASE RibbonTab
				ll_color = RGB(255,255,255)
			CASE ShortcutBar
				ll_color = RGB(214,212,212)
			CASE TabControl, ButtonListBar
				ll_color = RGB(131,137,151)
			CASE PBUSButton, Toolbar
				ll_color = RGB(191,191,191)
			CASE ELSE
				ll_color = RGB(214,212,212)
		END CHOOSE
	CASE "ITEMTEXTHOVER"
		ll_color = 0
	CASE "ITEMTEXT"
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(63,61,61)
			CASE ELSE
				ll_color = 0
		END CHOOSE
	CASE 'ITEMTEXTSELECTED'
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(126,124,124)
			CASE ELSE
				ll_color = 0
		END CHOOSE
	CASE "TEXTDISABLED"
		ll_color = RGB(100,100,100)
	CASE 'SCROLLBAR'
		CHOOSE CASE as_object
			CASE RibbonPanel
				ll_color = RGB(182,207,242)
			CASE ELSE
				ll_color = RGB(169,199,240)
		END CHOOSE
	CASE 'SCROLLBARSELECTED'
		ll_color = RGB(255,238,194)
	CASE 'SCROLLBARBORDER'
		ll_color = RGB(127,157,185)
	CASE 'SCROLLBARSELECTEDBORDER'
		ll_color = RGB(0,0,128)
	CASE "SEPARATOR"
		ll_color = RGB(106,140,203)
	CASE "CAP"
		ll_color = RGB(59,97,156)
	//PowerMenu Components
	CASE "PROGRAMTABBORDER"
		ll_color = RGB(131,137,151)
	CASE "PROGRAMTABHOVERBORDER"
		ll_color = RGB(131,137,151)
	CASE "PROGRAMTABHOVER"
		ll_color = RGB(131,137,151)
	CASE "PROGRAMTABBACKCOLOR1"
		ll_color = RGB(89,95,109)
	CASE "PROGRAMTABBACKCOLOR2"
		ll_color = RGB(89,95,109)
	//XPListBar Components
	CASE "SPECIALCIRCLEBORDER"
		ll_color = 15193293
	CASE "SPECIALCIRCLEFILL"
		ll_color = 9925999
	CASE "CIRCLEBORDER"
		ll_color = 13483967
	CASE "CIRCLEFILL"
		ll_color = 16777215
	CASE "SPECIALARROW"
		ll_color = 15132390
	CASE "GROUPBORDER"
		ll_color = RGB(131,137,151)
	CASE "SPECIALGROUPBORDER"
		ll_color = RGB(112,111,145)
	CASE "HEADERSPECIAL1"
		ll_color = RGB(89,95,109)
	CASE "HEADERSPECIAL2"
		ll_color = RGB(89,95,109)
	CASE 'HEADERSPECIALTEXT'
		ll_color = RGB(255,255,255)
	
	CASE "HEADERSPECIALTEXTSELECTED"
		ll_color = RGB(196,200,212)
	CASE 'LINE'
		ll_color = RGB(131,137,151)
	CASE "ITEMBACK1"
		ll_color = RGB(255,255,255)
	CASE "ITEMBACK2"
		ll_color = RGB(255,255,255)
	//Outlook Shortcutbar
	CASE "SPLITBAR1"
		ll_color = RGB(255,255,255)
	CASE "SPLITBAR2"
		ll_color = RGB(255,255,255)
	CASE "HEADERTEXT"
		ll_color = RGB(255,255,255)
	CASE "TEXTSELECTED"
		CHOOSE CASE as_object
			CASE RibbonTab
				ll_color = 0
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "BACKCOLOR2"
		ll_color = RGB(193,210,238)
END CHOOSE

RETURN ll_color

end function

on n_cst_pbui_theme_powerbuilder_grey.create
call super::create
end on

on n_cst_pbui_theme_powerbuilder_grey.destroy
call super::destroy
end on

