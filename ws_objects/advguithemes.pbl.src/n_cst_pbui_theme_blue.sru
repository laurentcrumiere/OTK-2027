$PBExportHeader$n_cst_pbui_theme_blue.sru
forward
global type n_cst_pbui_theme_blue from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_blue from n_cst_pbui_theme
end type
global n_cst_pbui_theme_blue n_cst_pbui_theme_blue

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);Long ll_color

as_object = Upper(as_object)

CHOOSE CASE Upper(as_color)
	CASE "GROUPTEXT"
		ll_color = RGB(30,57,91)
	CASE "BUTTONBORDER"
		ll_color = RGB(108,138,181)
	CASE "TILE"
		ll_color = RGB(89,135,214)
	CASE "BORDER"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(171,184,201)
			CASE RibbonTab, RibbonPanel
				ll_color = RGB(139,160,188)
			CASE PowerDockPanel, GroupBox, XPListBar, ShortcutBar
				ll_color = RGB(4,56,148)
			CASE ELSE
				ll_color = RGB(108,138,181)
		END CHOOSE
	CASE "ITEMBORDER"
		CHOOSE CASE as_object
			CASE ButtonListBar
				ll_color = RGB(4,56,148)
			CASE ELSE
				ll_color =  RGB(238, 200, 88)
		END CHOOSE
	CASE "HOVER1", "ITEMTOGGLED1"
		CHOOSE CASE as_object
			CASE ButtonListBar, Shortcutbar
				ll_color = RGB(255,255,220)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,245,204)
		END CHOOSE
	CASE "HOVER2", "ITEMTOGGLED2"
		CHOOSE CASE as_object
			CASE ButtonListBar, Shortcutbar
				ll_color = RGB(247,192,91)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,208,145)
		END CHOOSE
	CASE "HEADER1", "ITEMTOGGLED1"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(247,251,255)
			CASE XPListBar
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = RGB(89,135,214)
		END CHOOSE
	CASE "HEADER2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(228,239,251)
			CASE XPListBar
				ll_color = RGB(199,212,247)
			CASE ELSE
				ll_color = RGB(4,56,148)
		END CHOOSE
	CASE "FOOTER1"
		ll_color = RGB(249,252,255)
	CASE "FOOTER2"
		ll_color = RGB(226,235,249)
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ButtonListBar, XPListBar
				ll_color = RGB(122,161,230)
			CASE ShortcutBar
				ll_color = RGB(203,225,252)
			CASE RibbonStatusBar, PBUSMessage, SPA
				ll_color = RGB(89,135,214)
			CASE ELSE
				ll_color = RGB(221,236,254)
		END CHOOSE
	CASE "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ButtonListBar, XPListBar
				ll_color = RGB(99,117,214)
			CASE RibbonPanel
				ll_color = RGB(182,207,242)
			CASE ShortcutBar
				ll_color = RGB(126,166,225)
			CASE ELSE
				ll_color = RGB(129,169,226)
		END CHOOSE
	CASE "BACKGROUND3" //Solid state for toolbar
		ll_color = RGB(182,207,242)
	CASE "BACKGROUND4" //Quick Access Toolbar in Ribbon
		CHOOSE CASE as_object
			CASE TOGGLEBUTTON
				ll_color = RGB(239,239,242)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(203,220,249)
		END CHOOSE
	CASE "HOVERSELECTED1"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(254,145,78)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(232,127,8)
		END CHOOSE
	CASE "HOVERSELECTED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,211,142)
			CASE ELSE
				ll_color = RGB(247,219,124)
		END CHOOSE
	CASE "SELECTED1"
		CHOOSE CASE as_object
			CASE ButtonListBar, ShortcutBar
				ll_color = RGB(247,219,124)
			CASE TabControl, RibbonTab
				ll_color = RGB(255,255,255)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,208,145)
		END CHOOSE
		
	CASE "SELECTED2"
		CHOOSE CASE as_object
			CASE ButtonListBar, ShortcutBar
				ll_color = RGB(238,150,21)
			CASE TabControl
				ll_color = RGB(255,255,255)
			CASE RibbonTab
				ll_color = RGB(221,236,254)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,241,198)
		END CHOOSE
	CASE "ITEMTEXT", "ITEMTEXTHOVER"
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(33,93,198)
			CASE ELSE
				ll_color = 0
		END CHOOSE
	CASE 'ITEMTEXTSELECTED'
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(66,142,255)
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
		ll_color = RGB(65,106,189)
	CASE "PROGRAMTABHOVERBORDER"
		ll_color = RGB(65,106,189)
	CASE "PROGRAMTABHOVER"
		ll_color = RGB(129,169,226)
	CASE "PROGRAMTABBACKCOLOR1"
		ll_color = RGB(221,236,254)
	CASE "PROGRAMTABBACKCOLOR2"
		ll_color = RGB(129,169,226)
	//XPListBar Components
	CASE "SPECIALCIRCLEBORDER"
		ll_color = 14853494
	CASE "SPECIALCIRCLEFILL"
		ll_color = 12804143
	CASE "CIRCLEBORDER"
		ll_color = 14531765
	CASE "CIRCLEFILL"
		ll_color = 16777215
	CASE "SPECIALARROW"
		ll_color = 16764332
	CASE "GROUPBORDER"
		ll_color = RGB(255,255,255)
	CASE "HEADERSPECIAL1"
		ll_color = 13195552
	CASE "HEADERSPECIAL2"
		ll_color = 13195552
	CASE 'HEADERSPECIALTEXT'
		ll_color = RGB(255,255,255)
	
	CASE "HEADERSPECIALTEXTSELECTED"
		ll_color = RGB(122,161,230)
	CASE 'LINE'
		ll_color = RGB(122,161,230)
	CASE "ITEMBACK1"
		ll_color = RGB(214,223,247)
	CASE "ITEMBACK2"
		ll_color = RGB(214,223,247)
	//Outlook Shortcutbar
	CASE "SPLITBAR1"
		ll_color = RGB(89,135,214)
	CASE "SPLITBAR2"
		ll_color = RGB(0,45,150)
	CASE "HEADERTEXT"
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(33,93,198)
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "BACKCOLOR2"
		ll_color = RGB(193,210,238)
END CHOOSE

RETURN ll_color

end function

on n_cst_pbui_theme_blue.create
call super::create
end on

on n_cst_pbui_theme_blue.destroy
call super::destroy
end on

