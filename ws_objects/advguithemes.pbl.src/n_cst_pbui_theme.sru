$PBExportHeader$n_cst_pbui_theme.sru
forward
global type n_cst_pbui_theme from nonvisualobject
end type
end forward

global type n_cst_pbui_theme from nonvisualobject
end type
global n_cst_pbui_theme n_cst_pbui_theme

type prototypes
FUNCTION Long MulDiv (Long nNumber, Long nNumerator, Long nDenominator ) Library "kernel32.dll"
end prototypes

type variables
CONSTANT String ButtonListBar = "BUTTONLISTBAR"
CONSTANT String RibbonMenuList = "RIBBONMENULIST"
CONSTANT String ToolbarMenu = "TOOLBARMENU"
CONSTANT String Toolbar = "TOOLBAR"
CONSTANT String ToolbarSolid = "TOOLBARSOLID"
CONSTANT String TabControl = "TABCONTROL"
CONSTANT String RibbonTab = "RIBBONTAB"
CONSTANT String RibbonPanel = "RIBBONPANEL"
CONSTANT String RibbonStatusBar = "RIBBONSTATUSBAR"
CONSTANT String XPHeader = "XPHEADER"
CONSTANT String PowerDockPanel = "POWERDOCKPANEL"
CONSTANT String GroupBox = "GROUPBOX"
CONSTANT String XPListbar = "XPLISTBAR"
CONSTANT String ShortcutBar = "SHORTCUTBAR"
CONSTANT String Tiles = "TILES"
CONSTANT String ToggleButton = "TOGGLEBUTTON"
CONSTANT String PowerCalc = "POWERCALC"
CONSTANT String PBUSMessage = "POWERMESSAGE"
CONSTANT String PBUSButton = "PBUSBUTTON"
CONSTANT String SPA = "SPA"

n_cst_pbus_lic iu_lic

ULong AccentBaseColor, AccentColor80, AccentColor60, AccentColor40, AccentColor20, AccentColor120, HighlightColor, IdealForegroundColor, IdealBackgroundColor
end variables

forward prototypes
public function long of_getcolor (string as_object, string as_color)
public function ulong of_darkencolor (long al_scale, unsignedlong al_color)
public function unsignedlong of_lightencolor (long al_scale, unsignedlong al_color)
end prototypes

public function long of_getcolor (string as_object, string as_color);RETURN 1
end function

public function ulong of_darkencolor (long al_scale, unsignedlong al_color);Integer	li_Red, li_Green, li_Blue, li_RedNew, li_GreenNew, li_BlueNew

li_Blue = al_Color / 65536
li_Green = ( al_Color - li_Blue * 65536 ) / 256
li_Red = al_Color - ( li_Green * 256 ) - ( li_Blue * 65536 )

li_RedNew = MulDiv( li_Red, 255 - al_Scale, 255 )
li_GreenNew = MulDiv( li_Green, 255 - al_Scale, 255 )
li_BlueNew = MulDiv( li_Blue, 255 - al_Scale, 255 )

Return Rgb( li_RedNew, li_GreenNew, li_BlueNew )
end function

public function unsignedlong of_lightencolor (long al_scale, unsignedlong al_color);Integer	li_Red, li_Green, li_Blue, li_RedNew, li_GreenNew, li_BlueNew

li_Blue = al_Color / 65536
li_Green = ( al_Color - li_Blue * 65536 ) / 256
li_Red = al_Color - ( li_Green * 256 ) - ( li_Blue * 65536 )

li_RedNew = MulDiv( 255 - li_Red, al_Scale, 255 ) + li_Red
li_GreenNew = MulDiv( 255 - li_Green, al_Scale, 255 ) + li_Green
li_BlueNew = MulDiv( 255 - li_Blue, al_Scale, 255 ) + li_Blue

Return Rgb( li_RedNew, li_GreenNew, li_BlueNew )
end function

on n_cst_pbui_theme.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_pbui_theme.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

