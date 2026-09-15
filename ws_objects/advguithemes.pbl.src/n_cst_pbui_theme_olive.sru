$PBExportHeader$n_cst_pbui_theme_olive.sru
forward
global type n_cst_pbui_theme_olive from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_olive from n_cst_pbui_theme
end type
global n_cst_pbui_theme_olive n_cst_pbui_theme_olive

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);Long ll_color

as_object = Upper(as_object)

CHOOSE CASE Upper(as_color)
	CASE "GROUPTEXT"
		ll_color = RGB(30,57,91)
	CASE "BUTTONBORDER"
		ll_color = RGB(99,122,68)
	CASE "TILE"
		ll_color = RGB(109,137,60)
	CASE "BORDER"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(171,184,201)
			CASE ELSE
				ll_color = RGB(99,122,68)
		END CHOOSE
	CASE "ITEMBORDER"
		CHOOSE CASE as_object
			CASE ButtonListBar
				ll_color = RGB(99,122,68)
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
	CASE "HEADER1"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(244,247,222)
			CASE XPListbar
				ll_color = RGB(255,252,236)
			CASE ELSE
				ll_color = RGB(175,192,130)
		END CHOOSE
	CASE "HEADER2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(244,247,222)
			CASE XPListbar
				ll_color = RGB(224,231,184)
			CASE ELSE
				ll_color = RGB(99,122,68)
		END CHOOSE
	CASE "FOOTER1"
		ll_color = RGB(244,247,222)
	CASE "FOOTER2"
		ll_color = RGB(244,247,222)
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ButtonListBar, XPListBar
				ll_color = RGB(204,217,173)
			CASE RibbonStatusBar, PBUSMessage
				ll_color = RGB(109,137,60)
			CASE SPA
				ll_color = RGB(126,150,82)
			CASE ELSE
				ll_color = RGB(244,247,222)
		END CHOOSE
	CASE "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ButtonListBar, XPListBar
				ll_color = RGB(165,189,132)
			CASE RibbonPanel
				ll_color = RGB(213,222,183)
			CASE ELSE
				ll_color = RGB(183,198,145)
		END CHOOSE
	CASE "BACKGROUND3"
		ll_color = RGB(213,222,183)
	CASE "BACKGROUND4"
		CHOOSE CASE as_object
			CASE ToggleButton
				ll_color = RGB(239,239,242)
			CASE ELSE
				ll_color = RGB(234,234,207)
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
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(247,219,124)
		END CHOOSE
	CASE "SELECTED1"
		CHOOSE CASE as_object
			CASE ButtonListBar, Shortcutbar
				ll_color = RGB(251,230,148)
			CASE TabControl, RibbonTab
				ll_color = RGB(255,255,255)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,208,145)
		END CHOOSE
	CASE "SELECTED2"
		CHOOSE CASE as_object
			CASE ButtonListBar, Shortcutbar
				ll_color = RGB(238,150,21)
			CASE TabControl
				ll_color = RGB(255,255,255)
			CASE RibbonTab
				ll_color = RGB(244,247,222)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,241,198)
		END CHOOSE
	CASE "ITEMTEXT", "ITEMTEXTHOVER"
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(86,102,45)
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
				ll_color = RGB(213,222,183)
			CASE ELSE
				ll_color = RGB(197,212,159)
		END CHOOSE
	CASE 'SCROLLBARSELECTED'
		ll_color = RGB(255,238,194)
	CASE 'SCROLLBARBORDER'
		ll_color = RGB(164,185,127)
	CASE 'SCROLLBARSELECTEDBORDER'
		ll_color = RGB(63,93,56)
	CASE "SEPARATOR"
		ll_color = RGB(96,128,88)
	CASE "CAP"
		ll_color = RGB(99,122,68)
	CASE "PROGRAMTABBORDER"
		ll_color = RGB(99,122,68)
	CASE "PROGRAMTABHOVERBORDER"
		ll_color = RGB(99,122,68)
	CASE "PROGRAMTABHOVER"
		ll_color = RGB(165,189,132)
	CASE "PROGRAMTABBACKCOLOR1"
		ll_color = RGB(244,247,222)
	CASE "PROGRAMTABBACKCOLOR2"
		ll_color = RGB(165,189,132)
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
		ll_color = RGB(255,255,255)
	CASE "HEADERSPECIAL1"
		ll_color = 4230263
	CASE "HEADERSPECIAL2"
		ll_color = 6793366
	CASE 'HEADERSPECIALTEXT'
		ll_color = RGB(255,255,255)
	CASE "HEADERSPECIALTEXTSELECTED"
		ll_color = RGB(204,217,173)
	CASE 'LINE'
		ll_color = RGB(204,217,173)
	CASE "ITEMBACK1"
		ll_color = RGB(246,246,236)
	CASE "ITEMBACK2"
		ll_color = RGB(246,246,236)
	//Outlook Shortcutbar
	CASE "SPLITBAR1"
		ll_color = RGB(120,142,111)
	CASE "SPLITBAR2"
		ll_color = RGB(73,91,67)
	CASE "HEADERTEXT"
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(86,102,45)
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "BACKCOLOR2"
		ll_color = RGB(193,210,238)
END CHOOSE


RETURN ll_color
end function

on n_cst_pbui_theme_olive.create
call super::create
end on

on n_cst_pbui_theme_olive.destroy
call super::destroy
end on

