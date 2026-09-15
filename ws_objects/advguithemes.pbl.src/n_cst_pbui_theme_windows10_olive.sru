$PBExportHeader$n_cst_pbui_theme_windows10_olive.sru
forward
global type n_cst_pbui_theme_windows10_olive from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_windows10_olive from n_cst_pbui_theme
end type
global n_cst_pbui_theme_windows10_olive n_cst_pbui_theme_windows10_olive

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);Long ll_color

as_object = Upper(as_object)

CHOOSE CASE Upper(as_color)
	CASE "GROUPTEXT"
		ll_color = RGB(30,57,91)
	CASE "BUTTONBORDER"
		ll_color = RGB(109,137,60)
	CASE "TILE"
		ll_color = RGB(109,137,60)
	CASE "BORDER"
		CHOOSE CASE as_object
			CASE ToggleButton
				ll_color = RGB(109,137,60)
			CASE RibbonMenuList
				ll_color = RGB(171,184,201)
			CASE ShortcutBar, XPHeader
				ll_color = RGB(214,212,212)
			CASE PowerDockPanel
				ll_color = RGB(109,137,60)
			CASE PBUSButton
				ll_color = RGB(255,255,255)
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
		ll_color = RGB(109,137,60)
	CASE "ITEMTOGGLED2"
		ll_color = RGB(109,137,60)
	CASE "HOVER1"
		CHOOSE CASE as_object
			CASE ShortcutBar
				ll_color = RGB(234,234,234)
			CASE TabControl
				ll_color = RGB(221,221,223)
			CASE RibbonPanel, RibbonMenuList
				ll_color = RGB(109,137,60)
			CASE Toolbar
				ll_color = RGB(213,222,183)
			CASE PBUSButton
				ll_color = of_DarkenColor(40, RGB(109,137,60))
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
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
				ll_color = RGB(109,137,60)
			CASE Toolbar
				ll_color = RGB(213,222,183)
			CASE PBUSButton
				ll_color = of_DarkenColor(40,RGB(109,137,60))
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(234,234,234)
		END CHOOSE
	CASE "HEADER1"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = RGB(109,137,60)
		END CHOOSE
	CASE "HEADER2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = RGB(109,137,60)
		END CHOOSE
	CASE "FOOTER1"
		ll_color = RGB(255,255,255)
	CASE "FOOTER2"
		ll_color = RGB(255,255,255)
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1"
		CHOOSE CASE as_object
			CASE ToggleButton
				ll_color = RGB(109,137,60)
			CASE RibbonStatusBar
				ll_color = RGB(109,137,60)
			CASE TabControl
				ll_color = RGB(239,239,242)
			CASE PBUSMessage
				ll_color = RGB(66,119,0)
			CASE PBUSButton
				ll_color = RGB(109,137,60)
			CASE SPA
				ll_color = RGB(126,150,82)
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
		
	CASE "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE ToggleButton
				ll_color = RGB(109,137,60)
			CASE TabControl
				ll_color = RGB(239,239,242)
			CASE PBUSMessage
				ll_color = RGB(66,119,0)
			CASE PBUSButton
				ll_color = RGB(109,137,60)
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "BACKGROUND3" //Solid state for toolbar
		CHOOSE CASE as_object
			CASE PowerCalc
				ll_color = RGB(213,222,183)
			CASE ELSE
				ll_color = RGB(239,239,242)
		END CHOOSE
	CASE "BACKGROUND4" //Quick Access Toolbar in Ribbon
		ll_color = RGB(239,239,242)
	CASE "HOVERSELECTED1"
		CHOOSE CASE as_object
			CASE ShortcutBar
				ll_color = RGB(214,212,212)
			CASE RibbonPanel
				ll_color = RGB(136,164,87)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(214,212,212)
		END CHOOSE
	CASE "HOVERSELECTED2"
		CHOOSE CASE as_object
			CASE ShortcutBar
				ll_color = RGB(214,212,212)
			CASE RibbonPanel
				ll_color = RGB(136,164,87)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
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
				ll_color = RGB(109,137,60)
			CASE PBUSButton
				ll_color = RGB(255,255,255)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
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
				ll_color = RGB(109,137,60)
			CASE PBUSButton
				ll_color = RGB(255,255,255)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(214,212,212)
		END CHOOSE
	CASE "ITEMTEXTHOVER"
		CHOOSE CASE as_object
			CASE ButtonListBar, ToolbarMenu
				ll_color = 0
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "ITEMTEXT"
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(86,102,45)
			CASE PBUSButton
				ll_color = RGB(255,255,255)
			CASE RibbonTab, RibbonPanel
				ll_color = RGB(72,70,68)
			CASE ELSE
				ll_color = 0
		END CHOOSE
	CASE 'ITEMTEXTSELECTED'
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(114,146,29)
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
		ll_color = RGB(109,137,60)
	CASE "PROGRAMTABHOVERBORDER"
		ll_color = RGB(109,137,60)
	CASE "PROGRAMTABHOVER"
		ll_color = RGB(109,137,60)
	CASE "PROGRAMTABBACKCOLOR1"
		ll_color = RGB(67,95,18)
	CASE "PROGRAMTABBACKCOLOR2"
		ll_color = RGB(67,95,18)
	//XPListBar Components
	CASE "SPECIALCIRCLEBORDER"
		ll_color = 10342335
	CASE "SPECIALCIRCLEFILL"
		ll_color = 5284994
	CASE "CIRCLEBORDER"
		ll_color = 12506570
	CASE "CIRCLEFILL"
		ll_color = 16777215
	CASE "SPECIALARROW"
		ll_color = 12506570
	CASE "GROUPBORDER"
		ll_color = RGB(109,137,60)
	CASE "SPECIALGROUPBORDER"
		ll_color = 4230263
	CASE "HEADERSPECIAL1"
		ll_color = RGB(67,95,18)
	CASE "HEADERSPECIAL2"
		ll_color = RGB(67,95,18)
	CASE 'HEADERSPECIALTEXT'
		ll_color = RGB(255,255,255)
	
	CASE "HEADERSPECIALTEXTSELECTED"
		ll_color = RGB(204,217,173)
	CASE 'LINE'
		ll_color = RGB(109,137,60)
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

on n_cst_pbui_theme_windows10_olive.create
call super::create
end on

on n_cst_pbui_theme_windows10_olive.destroy
call super::destroy
end on

