$PBExportHeader$n_cst_pbui_theme_mauve_light.sru
forward
global type n_cst_pbui_theme_mauve_light from n_cst_pbui_theme
end type
end forward

global type n_cst_pbui_theme_mauve_light from n_cst_pbui_theme
end type
global n_cst_pbui_theme_mauve_light n_cst_pbui_theme_mauve_light

forward prototypes
public function long of_getcolor (string as_object, string as_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);Long ll_color

as_object = Upper(as_object)

IF AccentBaseColor = 0 THEN
	AccentBaseColor = RGB(118,96,138)
	AccentColor80 = of_LightenColor(20, AccentBaseColor)
	AccentColor60 = of_LightenColor(40, AccentBaseColor)
	AccentColor40 = of_LightenColor(60, AccentBaseColor)
	AccentColor20 = of_LightenColor(80, AccentBaseColor)
	AccentColor120 = of_DarkenColor(40, AccentBaseColor)
	HighlightColor = RGB(87,71,102)
	
	IdealForegroundColor = RGB(255,255,255)
END IF

CHOOSE CASE Upper(as_color)
	CASE "GROUPTEXT"
		ll_color = RGB(30,57,91)
	CASE "ITEMTOGGLED1", "ITEMTOGGLED2"
		ll_color = AccentBaseColor
	CASE "HEADER1", "HEADER2"
		CHOOSE CASE as_object
			CASE RibbonMenuList
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = AccentBaseColor
		END CHOOSE
	CASE "FOOTER1", "FOOTER2"
		ll_color = RGB(255,255,255)
	
	CASE "TILE"
		ll_color = AccentBaseColor
	CASE "BORDER", "ITEMBORDER", "GROUPBORDER", "BUTTONBORDER"
		CHOOSE CASE as_object
			CASE PBUSButton
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = AccentColor20
		END CHOOSE
		
	CASE "BACKGROUND1", "BACKGROUNDDISABLED1",  "BACKGROUND2", "BACKGROUNDDISABLED2"
		CHOOSE CASE as_object
			CASE RibbonStatusBar, SPA, PBUSButton, ToggleButton, PBUSMessage
				ll_color = AccentBaseColor
			CASE ELSE
				ll_color = RGB(255,255,255)
		END CHOOSE

	CASE "BACKGROUND3" //Solid state for toolbar
		ll_color = AccentBaseColor
	CASE "BACKGROUND4"
		ll_color = RGB(255,255,255)
		
	CASE "HOVER1", "HOVER2"
		ll_color = AccentColor120
	CASE "HOVERSELECTED1","HOVERSELECTED2"
		ll_color = AccentColor80
	CASE "SELECTED1", "SELECTED2"
		CHOOSE CASE as_object
			CASE RibbonTab
				ll_color = RGB(255,255,255)
			CASE ELSE
				ll_color = AccentBaseColor
		END CHOOSE
	

	CASE "ITEMTEXT"
		CHOOSE CASE as_object
			CASE PBUSButton
				ll_color = IdealForegroundColor
			CASE ELSE
				ll_color = 0
		END CHOOSE

	CASE "ITEMTEXTHOVER", "TEXTSELECTED",'ITEMTEXTSELECTED', 'TEXTHOVER'
		CHOOSE CASE as_object
			CASE XPListBar
				ll_color = HighlightColor
			CASE RibbonTab
				ll_color = 0
			CASE ELSE
				ll_color = IdealForegroundColor
		END CHOOSE
	CASE 'TEXTLIGHT'
		ll_color = IdealForegroundColor
	CASE "HEADERTEXT"
		ll_color = IdealForegroundColor
	CASE "TEXTDISABLED"
		ll_color = RGB(100,100,100)
		
	CASE 'SCROLLBAR'
		ll_color = AccentColor40
	CASE 'SCROLLBARSELECTED'
		ll_color = AccentColor80
	CASE 'SCROLLBARBORDER'
		ll_color = AccentColor60
	CASE 'SCROLLBARSELECTEDBORDER'
		ll_color = AccentBaseColor
	CASE "SEPARATOR"
		ll_color = AccentColor80
	CASE "CAP"
		ll_color = RGB(59,97,156)
	//PowerMenu Components
	CASE "PROGRAMTABBORDER"
		ll_color = AccentColor120
	CASE "PROGRAMTABHOVERBORDER"
		ll_color = AccentColor120
	CASE "PROGRAMTABHOVER"
		ll_color = AccentColor120
	CASE "PROGRAMTABBACKCOLOR1"
		ll_color = AccentColor120
	CASE "PROGRAMTABBACKCOLOR2"
		ll_color = AccentColor120
		
	//XPListBar Components
	CASE "SPECIALCIRCLEBORDER"
		ll_color = AccentBaseColor
	CASE "SPECIALCIRCLEFILL"
		ll_color = AccentColor20
	CASE "CIRCLEBORDER"
		ll_color = AccentColor80
	CASE "CIRCLEFILL"
		ll_color = 16777215
	CASE "SPECIALARROW"
		ll_color = AccentBaseColor
	CASE "SPECIALGROUPBORDER"
		ll_color = AccentColor120
	CASE "HEADERSPECIAL1"
		ll_color = AccentColor120
	CASE "HEADERSPECIAL2"
		ll_color = AccentColor120
	CASE 'HEADERSPECIALTEXT'
		ll_color = RGB(255,255,255)
	
	CASE "HEADERSPECIALTEXTSELECTED"
		ll_color = AccentColor20
	CASE 'LINE'
		ll_color = AccentColor80
	CASE "ITEMBACK1"
		ll_color = RGB(255,255,255)
	CASE "ITEMBACK2"
		ll_color = RGB(255,255,255)
	//Outlook Shortcutbar
	CASE "SPLITBAR1"
		ll_color = AccentColor120
	CASE "SPLITBAR2"
		ll_color = AccentColor120
	CASE "BACKCOLOR2"
		ll_color = RGB(193,210,238)
END CHOOSE

RETURN ll_color

end function

on n_cst_pbui_theme_mauve_light.create
call super::create
end on

on n_cst_pbui_theme_mauve_light.destroy
call super::destroy
end on

