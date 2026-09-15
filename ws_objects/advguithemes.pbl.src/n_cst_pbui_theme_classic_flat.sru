$PBExportHeader$n_cst_pbui_theme_classic_flat.sru
forward
global type n_cst_pbui_theme_classic_flat from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_classic_flat from n_cst_pbui_theme
end type
global n_cst_pbui_theme_classic_flat n_cst_pbui_theme_classic_flat

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);Long ll_color

as_object = Upper(as_object)

CHOOSE CASE Upper(as_color)
	CASE "GROUPTEXT"
		ll_color = RGB(30,57,91)
	CASE "BUTTONBORDER"
		ll_color = RGB(128,128,128)
	CASE "TILE"
		ll_color = RGB(153,153,153)
	CASE "BORDER"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(171,184,201)
			CASE ELSE
				ll_color = RGB(128,128,128)
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
				ll_color = RGB(245,244,242)
			CASE ELSE
				ll_color = RGB(128,128,128)
		END CHOOSE	
	CASE "FOOTER1"
		ll_color = RGB(245,244,242)
	CASE "FOOTER2"
		ll_color = RGB(245,244,242)
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1", "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE RibbonStatusBar, PBUSMessage, SPA
				ll_color = RGB(128,128,128)
			CASE ELSE
				ll_color = RGB(213,210,202)
		END CHOOSE
	CASE "BACKGROUND3"
		ll_color = RGB(213,210,202)
	CASE "BACKGROUND4"
		ll_color = RGB(242,243,246)
	CASE "HOVERSELECTED1", "HOVERSELECTED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(254,145,78)
			CASE ELSE
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "SELECTED1"))
		END CHOOSE
	CASE "SELECTED1", "SELECTED2"
		CHOOSE CASE as_object
			CASE RibbonTab
				ll_color = RGB(213,210,202)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(128,128,128)
		END CHOOSE
	CASE "ITEMTEXT"
		ll_color = 0
	CASE 'ITEMTEXTSELECTED', 'TEXTSELECTED', "ITEMTEXTHOVER"
		CHOOSE CASE as_object
			CASE XPListbar, RibbonTab
				ll_color = 0
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "TEXTDISABLED"
		ll_color = RGB(100,100,100)
	CASE 'SCROLLBAR'
		CHOOSE CASE as_object
			CASE RibbonPanel
				ll_color = RGB(230,228,223)
			CASE ELSE
				ll_color = RGB(212,208,200)
		END CHOOSE
	CASE 'SCROLLBARSELECTED'
		ll_color = RGB(182,189,210)
	CASE 'SCROLLBARBORDER'
		ll_color = RGB(128,128,128)
	CASE 'SCROLLBARSELECTEDBORDER'
		ll_color = RGB(10,36,106)
   CASE "SEPARATOR"
		ll_color = RGB(166,166,166)
	CASE "CAP"
		ll_color = RGB(128,128,128)
	CASE "PROGRAMTABBORDER"
		ll_color = RGB(128,128,128)
	CASE "PROGRAMTABHOVERBORDER"
		ll_color = RGB(128,128,128)
	CASE "PROGRAMTABHOVER"
		ll_color = RGB(177,179,200)
	CASE "PROGRAMTABBACKCOLOR1"
		ll_color = RGB(245,244,242)
	CASE "PROGRAMTABBACKCOLOR2"
		ll_color = RGB(177,179,200)
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
		ll_color = RGB(212,208,200)
	CASE "SPLITBAR2"
		ll_color = RGB(142,141,140)
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

on n_cst_pbui_theme_classic_flat.create
call super::create
end on

on n_cst_pbui_theme_classic_flat.destroy
call super::destroy
end on

