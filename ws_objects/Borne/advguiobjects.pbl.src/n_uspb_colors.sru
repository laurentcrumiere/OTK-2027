$PBExportHeader$n_uspb_colors.sru
forward
global type n_uspb_colors from nonvisualobject
end type
end forward

global type n_uspb_colors from nonvisualobject autoinstantiate
end type

type prototypes
FUNCTION Long MulDiv (Long nNumber, Long nNumerator, Long nDenominator ) Library "kernel32.dll"
end prototypes

type variables

end variables

forward prototypes
public function unsignedlong of_getcolor (string as_color, ref integer ai_red, ref integer ai_green, ref integer ai_blue)
public function integer of_splitrgb (long al_color, ref integer red, ref integer green, ref integer blue)
public function unsignedlong of_getcolor (string as_color)
public function ulong of_lightencolor (long al_scale, unsignedlong al_color)
public function ulong of_darkencolor (integer al_scale, unsignedlong al_color)
end prototypes

public function unsignedlong of_getcolor (string as_color, ref integer ai_red, ref integer ai_green, ref integer ai_blue);n_cst_pbus_string lnv_string

as_color = Upper(as_color)

as_color = lnv_string.of_GlobalReplace(as_color, "_DARK", "")
as_color = lnv_string.of_GlobalReplace(as_color, "_LIGHT", "")

CHOOSE CASE as_color
	CASE "DARKGRAY", "DARKGREY"
		ai_red = 131
		ai_green = 131
		ai_blue = 131
	CASE "LIGHTGRAY", "LIGHTGREY"
		ai_red = 205
		ai_green = 205
		ai_blue = 205
	CASE "GRAY", "GREY"
		ai_red = 164
		ai_green = 164
		ai_blue = 164
	CASE "PINK"
		ai_red = 244
		ai_green = 114
		ai_blue = 208
	CASE "DEEPBLUE"
		ai_red = 51
		ai_green = 103
		ai_blue = 214
	CASE "PURPLE"
		ai_red = 100
		ai_green = 89
		ai_blue = 223
	CASE "GREEN"
		ai_red = 11
		ai_green = 128
		ai_blue = 67
	CASE "ORANGE"
		ai_red = 250
		ai_green = 104
		ai_blue = 0
	CASE "RED"
		ai_red = 229
		ai_green = 20
		ai_blue = 0
	CASE "RUSTYRED"
		ai_red = 218
		ai_green = 44
		ai_blue = 67
	CASE "OLIVE"
		ai_red = 109
		ai_green = 137
		ai_blue = 60
	CASE "SILVER"
		ai_red = 131
		ai_green = 137
		ai_blue = 151
	CASE "BLACK"
		ai_red = 60
		ai_green = 60
		ai_blue = 60
	CASE "CLASSIC"
		ai_red = 128
		ai_green = 128
		ai_blue = 128
	CASE "AMBER"
		ai_red = 240
		ai_green = 163
		ai_blue = 10
	CASE "COBALT"
		ai_red = 0
		ai_green = 80
		ai_blue = 239
	CASE "CRIMSON"
		ai_red = 162
		ai_green = 0
		ai_blue = 37
	CASE "EMERALD"
		ai_red = 0
		ai_green = 138
		ai_blue = 0
	CASE "INDIGO"
		ai_red = 106
		ai_green = 0
		ai_blue = 225
	CASE "MAGENTA"
		ai_red = 216
		ai_green = 0
		ai_blue = 115
	CASE "MAUVE"
		ai_red = 118
		ai_green = 96
		ai_blue = 138
	CASE "TEAL"
		ai_red = 0
		ai_green = 171
		ai_blue = 169
	CASE "VIOLET"
		ai_red = 170
		ai_green = 0
		ai_blue = 225
	CASE "WHITE"
		ai_red = 255
		ai_green = 255
		ai_blue = 255
	CASE ELSE //BLUE
		ai_red = 37
		ai_green = 160
		ai_blue = 218
END CHOOSE

RETURN RGB(ai_red, ai_green, ai_blue)
end function

public function integer of_splitrgb (long al_color, ref integer red, ref integer green, ref integer blue);Red = Mod (al_Color, 256)


al_Color /= 256
Green	= Mod (al_Color, 256)

Blue = al_Color / 256

RETURN 1
end function

public function unsignedlong of_getcolor (string as_color);Integer li_red, li_green, li_blue

RETURN of_GetColor(as_color, li_red, li_green, li_blue)
end function

public function ulong of_lightencolor (long al_scale, unsignedlong al_color);Integer	li_Red, li_Green, li_Blue, li_RedNew, li_GreenNew, li_BlueNew

li_Blue = al_Color / 65536
li_Green = ( al_Color - li_Blue * 65536 ) / 256
li_Red = al_Color - ( li_Green * 256 ) - ( li_Blue * 65536 )

li_RedNew = MulDiv( 255 - li_Red, al_Scale, 255 ) + li_Red
li_GreenNew = MulDiv( 255 - li_Green, al_Scale, 255 ) + li_Green
li_BlueNew = MulDiv( 255 - li_Blue, al_Scale, 255 ) + li_Blue

Return Rgb( li_RedNew, li_GreenNew, li_BlueNew )
end function

public function ulong of_darkencolor (integer al_scale, unsignedlong al_color);Integer	li_Red, li_Green, li_Blue, li_RedNew, li_GreenNew, li_BlueNew

li_Blue = al_Color / 65536
li_Green = ( al_Color - li_Blue * 65536 ) / 256
li_Red = al_Color - ( li_Green * 256 ) - ( li_Blue * 65536 )

li_RedNew = MulDiv( li_Red, 255 - al_Scale, 255 )
li_GreenNew = MulDiv( li_Green, 255 - al_Scale, 255 )
li_BlueNew = MulDiv( li_Blue, 255 - al_Scale, 255 )

Return Rgb( li_RedNew, li_GreenNew, li_BlueNew )
end function

on n_uspb_colors.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_uspb_colors.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

