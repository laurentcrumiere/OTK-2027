$PBExportHeader$n_cst_pbui_theme_silver_flat.sru
forward
global type n_cst_pbui_theme_silver_flat from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_silver_flat from n_cst_pbui_theme
end type
global n_cst_pbui_theme_silver_flat n_cst_pbui_theme_silver_flat

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
			CASE PowerDockPanel, GroupBox, XPListBar, ShortcutBar
				ll_color = RGB(161,167,170)
			CASE ELSE
				ll_color = RGB(112,111,145)
		END CHOOSE
	CASE "ITEMBORDER"
		ll_color = of_DarkenColor(40, of_GetColor(as_object, "SELECTED1"))
	CASE "HOVER1", "ITEMTOGGLED1", "HOVER2", "ITEMTOGGLED2"
		CHOOSE CASE as_object
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = of_DarkenColor(20, of_GetColor(as_object, "SELECTED1"))
		END CHOOSE
	CASE "HEADER1", "HEADER2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(243,244,250)
			CASE ELSE
				ll_color = RGB(161,167,170)
		END CHOOSE
	CASE "FOOTER1"
		ll_color = RGB(243,244,250)
	CASE "FOOTER2"
		ll_color = RGB(243,244,250)
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1", "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE SPA, RibbonStatusBar,PBUSMessage
				ll_color = RGB(161,167,170)
			CASE ELSE
				ll_color = RGB(201,201,218)
		END CHOOSE
	CASE "BACKGROUND3"
		ll_color = RGB(201,201,218)
	CASE "BACKGROUND4"
		ll_color = RGB(232,232,240)
	CASE "HOVERSELECTED1",  "HOVERSELECTED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
			CASE ELSE
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "SELECTED1"))
		END CHOOSE
	CASE "SELECTED1", "SELECTED2"
		CHOOSE CASE as_object
			CASE RibbonTab
				ll_color = RGB(201,201,218)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(161,167,170)
		END CHOOSE
	CASE "ITEMTEXT"
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(63,61,61)
			CASE ELSE
				ll_color = 0
		END CHOOSE
	CASE 'ITEMTEXTSELECTED', 'TEXTSELECTED', "ITEMTEXTHOVER"
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(63,61,61)
			CASE RibbonTab
				ll_color = 0
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "TEXTDISABLED"
		ll_color = RGB(100,100,100)
	CASE 'SCROLLBAR'
		CHOOSE CASE as_object
			CASE RibbonPanel
				ll_color = RGB(171,171,209)
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
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "BACKCOLOR2"
		ll_color = RGB(193,210,238)
END CHOOSE

RETURN ll_color
end function

on n_cst_pbui_theme_silver_flat.create
call super::create
end on

on n_cst_pbui_theme_silver_flat.destroy
call super::destroy
end on

