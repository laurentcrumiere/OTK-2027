$PBExportHeader$n_cst_pbui_theme_silver.sru
forward
global type n_cst_pbui_theme_silver from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_silver from n_cst_pbui_theme
end type
global n_cst_pbui_theme_silver n_cst_pbui_theme_silver

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);Long ll_color

as_object = Upper(as_object)

CHOOSE CASE Upper(as_color)
	CASE "GROUPTEXT"
		ll_color = RGB(30,57,91)
	CASE "BUTTONBORDER"
		ll_color = RGB(112,111,145)
	CASE "TILE"
		ll_color = RGB(131,137,151)
	CASE "BORDER"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(171,184,201)
			CASE ELSE
				ll_color = RGB(112,111,145)
		END CHOOSE
	CASE "ITEMBORDER"
		CHOOSE CASE as_object
			CASE ButtonListBar
				ll_color = RGB(112,111,145)
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
				ll_color = RGB(243,244,250)
			CASE XPListbar
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = RGB(168,167,191)
		END CHOOSE
	CASE "HEADER2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(243,244,250)
			CASE XPListbar
				ll_color = RGB(214,215,224)
			CASE ELSE
				ll_color = RGB(112,111,145)
		END CHOOSE
	CASE "FOOTER1"
		ll_color = RGB(243,244,250)
	CASE "FOOTER2"
		ll_color = RGB(243,244,250)
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ButtonListBar, XPListbar
				ll_color = RGB(196,200,212)	
			CASE RibbonStatusBar,PBUSMessage
				ll_color = RGB(131,137,151)
			CASE SPA
				ll_color = RGB(161,167,170)
			CASE ELSE
				ll_color = RGB(243,244,250)
		END CHOOSE
	CASE "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ButtonListBar, XPListBar
				ll_color = RGB(177,179,200)
			CASE RibbonPanel
				ll_color = RGB(201,201,218)
			CASE ELSE
				ll_color = RGB(153,151,181)
		END CHOOSE
	CASE "BACKGROUND3"
		ll_color = RGB(201,201,218)
	CASE "BACKGROUND4"
		ll_color = RGB(232,232,240)
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
				ll_color = RGB(243,244,250)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,241,198)
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
				ll_color = RGB(201,201,218)
			CASE ELSE
				ll_color = RGB(192,192,211)
		END CHOOSE
	CASE 'SCROLLBARSELECTED'
		ll_color = RGB(255,238,194)
	CASE 'SCROLLBARBORDER'
		ll_color = RGB(165,172,178)
	CASE 'SCROLLBARSELECTEDBORDER'
		ll_color = RGB(75,75,111)
	CASE "SEPARATOR"
		ll_color = RGB(110,109,143)
	CASE "CAP"
		ll_color = RGB(112,111,145)
	CASE "PROGRAMTABBORDER"
		ll_color = RGB(112,111,145)
	CASE "PROGRAMTABHOVERBORDER"
		ll_color = RGB(112,111,145)
	CASE "PROGRAMTABHOVER"
		ll_color = RGB(177,179,200)
	CASE "PROGRAMTABBACKCOLOR1"
		ll_color = RGB(243,244,250)
	CASE "PROGRAMTABBACKCOLOR2"
		ll_color = RGB(177,179,200)
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
		ll_color = RGB(255,255,255)
	CASE "HEADERSPECIAL1"
		ll_color = RGB(112,111,145)
	CASE "HEADERSPECIAL2"
		ll_color = 13088436
	CASE 'HEADERSPECIALTEXT'
		ll_color = RGB(255,255,255)
	CASE "HEADERSPECIALTEXTSELECTED"
		ll_color = RGB(196,200,212)
	CASE 'LINE'
		ll_color = RGB(196,200,212)
	CASE "ITEMBACK1"
		ll_color = RGB(240,241,245)
	CASE "ITEMBACK2"
		ll_color = RGB(240,241,245)
	//Outlook Shortcutbar
	CASE "SPLITBAR1"
		ll_color = RGB(168,167,191)
	CASE "SPLITBAR2"
		ll_color = RGB(119,118,151)
	CASE "HEADERTEXT"
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(63,61,61)
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "BACKCOLOR2"
		ll_color = RGB(193,210,238)
END CHOOSE

RETURN ll_color
end function

on n_cst_pbui_theme_silver.create
call super::create
end on

on n_cst_pbui_theme_silver.destroy
call super::destroy
end on

