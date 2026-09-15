$PBExportHeader$n_cst_pbui_theme_black_flat.sru
forward
global type n_cst_pbui_theme_black_flat from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_black_flat from n_cst_pbui_theme
end type
global n_cst_pbui_theme_black_flat n_cst_pbui_theme_black_flat

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);Long ll_color

as_object = Upper(as_object)

CHOOSE CASE Upper(as_color)
		CASE "GROUPTEXT"
		ll_color = RGB(30,57,91)
	CASE "TILE"
		ll_color = RGB(50,50,50)
	CASE "BORDER"
		CHOOSE CASE as_object
			CASE ShortcutBar
				ll_color = 0
			CASE ELSE
				ll_color = RGB(82,82,82)
		END CHOOSE
	CASE "ITEMBORDER"
		CHOOSE CASE as_object
			CASE ButtonListBar
				ll_color = RGB(4,56,148)
			CASE ELSE
				ll_color =  RGB(238, 200, 88)
		END CHOOSE
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
			CASE XPListBar
				ll_color = RGB(100,100,100)
			CASE ELSE
				ll_color = RGB(75,75,75)
		END CHOOSE

	CASE "FOOTER1", "FOOTER2"
		ll_color = RGB(243,244,250)
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1", "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE RibbonPanel
				ll_color = RGB(163,163,163)
			CASE TabControl
				ll_color = RGB(100,100,100)
			CASE PowerCalc
				ll_color = RGB(15,15,15)
			CASE ELSE
				ll_color = RGB(75,75,75)
		END CHOOSE
	CASE "BACKGROUND3" //Solid state for toolbar
		ll_color = RGB(120,120,120)
	CASE "BACKGROUND4" //Quick Access Toolbar in Ribbon
		ll_color = RGB(139,139,139)
		
	CASE "HOVERSELECTED1", "HOVERSELECTED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,211,142)
			CASE ELSE
				ll_color = of_DarkenColor(40, of_GetColor(as_object, "SELECTED1"))
		END CHOOSE
	CASE "SELECTED1", "SELECTED2"
		CHOOSE CASE as_object
			CASE ButtonListBar, ShortcutBar
				ll_color = RGB(238,150,21)
			CASE TabControl
				ll_color = RGB(255,255,255)
			CASE RibbonTab
				ll_color = RGB(163,163,163)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(255,241,198)
		END CHOOSE
	CASE "ITEMTEXTHOVER"
		ll_color = 0
	CASE "ITEMTEXT"
		CHOOSE CASE as_object
			CASE XPListbar, RibbonPanel
				ll_color = 0
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "TEXTLIGHT"
		ll_color = RGB(255,255,255)
	CASE "ITEMTEXTSELECTED"
		ll_color = 0
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
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = 0
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "BACKCOLOR2"
		ll_color = RGB(193,210,238)
END CHOOSE

RETURN ll_color

end function

on n_cst_pbui_theme_black_flat.create
call super::create
end on

on n_cst_pbui_theme_black_flat.destroy
call super::destroy
end on

