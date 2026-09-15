$PBExportHeader$n_cst_pbui_theme_windows10_black.sru
forward
global type n_cst_pbui_theme_windows10_black from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_windows10_black from n_cst_pbui_theme
end type
global n_cst_pbui_theme_windows10_black n_cst_pbui_theme_windows10_black

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);Long ll_color

as_object = Upper(as_object)

CHOOSE CASE Upper(as_color)
	CASE "GROUPTEXT"
		ll_color = RGB(30,57,91)
	CASE "TILE"
		ll_color = RGB(75,75,75)
	CASE "BORDER"
		CHOOSE CASE as_object
			CASE ShortcutBar
				ll_color = 0
			CASE PBUSButton
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = RGB(82,82,82)
		END CHOOSE
	CASE "ITEMBORDER"
		CHOOSE CASE as_object
			CASE Toolbar, Shortcutbar,ButtonListBar
				ll_color = of_DarkenColor(40, of_GetColor(as_object, "BACKGROUND1"))
			CASE ELSE
				ll_color =  RGB(238, 200, 88)
		END CHOOSE
	CASE "HOVER1", "ITEMTOGGLED1"
		CHOOSE CASE as_object
			CASE PBUSButton
				ll_color = of_LightenColor(40, RGB(60,60,60))
			CASE RibbonPanel, RibbonTab, Toolbar, Shortcutbar,ButtonListBar, ToolbarMenu
				ll_color = RGB(120,120,120)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,245,204)
		END CHOOSE
	CASE "HOVER2", "ITEMTOGGLED2"
		CHOOSE CASE as_object
			CASE PBUSButton
				ll_color = of_LightenColor(40, RGB(60,60,60))
			CASE RibbonPanel, RibbonTab,Toolbar, Shortcutbar,ButtonListBar, ToolbarMenu
				ll_color = RGB(120,120,120)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,208,145)
		END CHOOSE
	CASE "HEADER1"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(243,244,250)
			CASE XPListBar
				ll_color = RGB(100,100,100)
			CASE ELSE
				ll_color = RGB(100,100,100)
		END CHOOSE
	CASE "HEADER2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(243,244,250)
			CASE XPListBar
				ll_color = RGB(100,100,100)
			CASE ELSE
				ll_color = RGB(75,75,75)
		END CHOOSE
	CASE "FOOTER1"
		ll_color = RGB(243,244,250)
	CASE "FOOTER2"
		ll_color = RGB(243,244,250)
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1"
		CHOOSE CASE as_object
			CASE RibbonPanel, RibbonTab
				ll_color = RGB(207,207,207)
			CASE XPListBar, ButtonListbar
				ll_color = RGB(137,137,137)
			CASE RibbonStatusBar, SPA
				ll_color = RGB(90,90,90)
			CASE TabControl
				ll_color = RGB(150,150,150)
			CASE PBUSMessage
				ll_color = RGB(65,64,61)
			CASE PBUSButton
				ll_color = RGB(60,60,60)
			CASE ToggleButton
				ll_color = RGB(100,100,100)
			CASE ELSE
				ll_color = RGB(150,150,150)
		END CHOOSE
	CASE "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE RibbonPanel, RibbonTab
				ll_color = RGB(207,207,207)
			CASE TabControl
				ll_color = RGB(150,150,150)
			CASE PBUSMessage
				ll_color = RGB(65,64,61)
			CASE PBUSButton
				ll_color = RGB(60,60,60)
			CASE ToggleButton
				ll_color = RGB(100,100,100)
			CASE ELSE
				ll_color = RGB(150,150,150)
		END CHOOSE
	CASE "BACKGROUND3" //Solid state for toolbar
		ll_color = RGB(120,120,120)
	CASE "BACKGROUND4" //Quick Access Toolbar in Ribbon
		CHOOSE CASE as_object
			CASE ToggleButton
				ll_color = RGB(150,150,150)
			CASE ELSE
				ll_color = RGB(139,139,139)
		END CHOOSE
	CASE "HOVERSELECTED1"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(254,145,78)
			CASE RibbonPanel, RibbonTab
				ll_color = RGB(140,140,140)
			CASE Toolbar, ShortcutBar,ButtonListBar, ToolbarMenu
				ll_color = of_DarkenColor(60, of_GetColor(as_object, "BACKGROUND1"))
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(232,127,8)
		END CHOOSE
	CASE "HOVERSELECTED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,211,142)
			CASE RibbonPanel, RibbonTab
				ll_color = RGB(140,140,140)
			CASE Toolbar, ShortcutBar,ButtonListBar, ToolbarMenu
				ll_color = of_DarkenColor(60, of_GetColor(as_object, "BACKGROUND1"))
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(247,219,124)
		END CHOOSE
	CASE "SELECTED1"
		CHOOSE CASE as_object
			CASE TabControl, RibbonTab
				ll_color = RGB(255,255,255)
			CASE PBUSButton
				ll_color = RGB(255,255,255)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE Toolbar, ShortcutBar,ButtonListBar, ToolbarMenu
				ll_color = of_DarkenColor(60, of_GetColor(as_object, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,208,145)
		END CHOOSE
	CASE "SELECTED2"
		CHOOSE CASE as_object
			CASE TabControl
				ll_color = RGB(255,255,255)
			CASE RibbonTab
				ll_color = RGB(207,207,207)
			CASE PBUSButton
				ll_color = RGB(255,255,255)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE Toolbar, ShortcutBar,ButtonListBar, ToolbarMenu
				ll_color = of_DarkenColor(60, of_GetColor(as_object, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,241,198)
		END CHOOSE
	CASE "ITEMTEXTHOVER"
		CHOOSE CASE as_object
			CASE ToolbarMenu
				ll_color = 0
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "ITEMTEXT"
		CHOOSE CASE as_object
			CASE ToggleButton
				ll_color = RGB(255,255,255)
			CASE PBUSButton
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = 0
		END CHOOSE
	CASE "TEXTSELECTED"
		CHOOSE CASE as_object
			CASE RibbonPanel
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = 0
		END CHOOSE
	CASE "ITEMTEXTSELECTED"
		CHOOSE CASE as_object
			CASE RibbonPanel, RibbonTab
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = 0
		END CHOOSE
	CASE "TEXTDISABLED"
		ll_color = RGB(192,192,192)
	CASE 'SCROLLBAR'
		ll_color = RGB(92,92,92)
	CASE 'SCROLLBARSELECTED'
		ll_color = RGB(255,238,194)
	CASE 'SCROLLBARBORDER'
		ll_color = RGB(48,48,48)
	CASE 'SCROLLBARSELECTEDBORDER'
		ll_color = RGB(48,48,48)
	CASE "SEPARATOR"
		ll_color = RGB(48,48,48)
	CASE "CAP"
		ll_color = RGB(48,48,48)
	//PowerMenu Components
	CASE "PROGRAMTABBORDER"
		ll_color = RGB(75,75,75)
	CASE "PROGRAMTABHOVERBORDER"
		ll_color = RGB(82,82,82)
	CASE "PROGRAMTABHOVER"
		ll_color = RGB(163,163,163)
	CASE "PROGRAMTABBACKCOLOR1"
		ll_color = RGB(200,200,200)
	CASE "PROGRAMTABBACKCOLOR2"
		ll_color = RGB(100,100,100)
	//XPListBar Components
	CASE "SPECIALCIRCLEBORDER"
		ll_color = RGB(128,128,128)
	CASE "SPECIALCIRCLEFILL"
		ll_color = RGB(128,128,128)
	CASE "CIRCLEBORDER"
		ll_color = RGB(128,128,128)
	CASE "CIRCLEFILL"
		ll_color = 16777215
	CASE "SPECIALARROW"
		ll_color = RGB(255,255,255)
	CASE "GROUPBORDER"
		ll_color = RGB(212,208,200)
	CASE "HEADERSPECIAL1"
		ll_color = RGB(128,128,128)
	CASE "HEADERSPECIAL2"
		ll_color = RGB(212,208,200)
	CASE 'HEADERSPECIALTEXT'
		ll_color = RGB(255,255,255)
	CASE "HEADERSPECIALTEXTSELECTED"
		ll_color = RGB(255,255,255)
	CASE 'LINE'
		ll_color = RGB(212,208,200)
	CASE 'ITEMBACK1'
		ll_color = RGB(255,255,255)
	CASE 'ITEMBACK2'
		ll_color = RGB(255,255,255)
	//Outlook Shortcutbar
	CASE "SPLITBAR1"
		ll_color = RGB(85,85,85)
	CASE "SPLITBAR2"
		ll_color = RGB(60,60,60)
	CASE "HEADERTEXT"
		ll_color = RGB(255,255,255)
	CASE "BACKCOLOR2"
		ll_color = RGB(193,210,238)
END CHOOSE

RETURN ll_color

end function

on n_cst_pbui_theme_windows10_black.create
call super::create
end on

on n_cst_pbui_theme_windows10_black.destroy
call super::destroy
end on

