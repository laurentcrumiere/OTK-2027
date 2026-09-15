$PBExportHeader$n_cst_pbui_theme_blue_flat.sru
forward
global type n_cst_pbui_theme_blue_flat from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_blue_flat from n_cst_pbui_theme
end type
global n_cst_pbui_theme_blue_flat n_cst_pbui_theme_blue_flat

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
				ll_color = RGB(89,135,214)
			CASE PBUSButton
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = RGB(108,138,181)
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
	CASE "HEADER1",  "HEADER2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(247,251,255)
			CASE ELSE
				ll_color = RGB(89,135,214)
		END CHOOSE
	CASE "FOOTER1", "FOOTER2"
		ll_color = RGB(226,235,249)
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1", "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE RibbonStatusBar, SPA, PBUSButton, ToggleButton, PBUSMessage
				ll_color = RGB(89,135,214)
			CASE ELSE
				ll_color = RGB(182,207,242)
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
	CASE "HOVERSELECTED1", "HOVERSELECTED2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(254,145,78)
			CASE ELSE
				ll_color = of_DarkenColor(40, of_GetColor(as_object, "SELECTED1"))
		END CHOOSE
	CASE "SELECTED1", "SELECTED2"
		CHOOSE CASE as_object
			CASE RibbonTab
				ll_color = RGB(182,207,242)
			CASE Spa
				ll_color = of_DarkenColor(40, of_GetColor(SPA, "BACKGROUND1"))
			CASE ELSE
				ll_color = RGB(89,135,214)
		END CHOOSE
	CASE "ITEMTEXT"
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(33,93,198)
			CASE PBUSButton, ToggleButton
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = 0
		END CHOOSE
	CASE "TEXTSELECTED",'ITEMTEXTSELECTED'
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(66,142,255)
			CASE RibbonTab
				ll_color = 0
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE  "ITEMTEXTHOVER", 'TEXTHOVER'
		CHOOSE CASE as_object
			CASE XPListbar
				ll_color = RGB(66,142,255)
			CASE RibbonTab
				ll_color = 0
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE 'TEXTLIGHT'
		ll_color = 0
	CASE "TEXTDISABLED"
		ll_color = RGB(100,100,100)
	CASE 'SCROLLBAR'
		CHOOSE CASE as_object
			CASE RibbonPanel
				ll_color = RGB(98,157,239)
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
				//ll_color = RGB(33,93,198)
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE
	CASE "BACKCOLOR2"
		ll_color = RGB(193,210,238)
END CHOOSE

RETURN ll_color

end function

on n_cst_pbui_theme_blue_flat.create
call super::create
end on

on n_cst_pbui_theme_blue_flat.destroy
call super::destroy
end on

