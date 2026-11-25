$PBExportHeader$u_cst_loadingcircle.sru
forward
global type u_cst_loadingcircle from u_cst_canvas
end type
end forward

global type u_cst_loadingcircle from u_cst_canvas
integer width = 91
integer height = 88
event resize pbm_size
end type
global u_cst_loadingcircle u_cst_loadingcircle

type prototypes
SUBROUTINE WinSleep(long dwMilliseconds) Library "kernel32.dll" ALIAS FOR "Sleep"

end prototypes

type variables
GdiplusStartupInput  lstr_input
GdiplusStartupOutput lstr_output
LongPtr lul_GdiToken, lul_Graphic
long ll_gdirtn
// Constants =========================================================
private constant double NumberOfDegreesInCircle = 360
private constant double NumberOfDegreesInHalfCircle = 180
private constant int DefaultInnerCircleRadius = 8
private constant int DefaultOuterCircleRadius = 10
private constant int DefaultNumberOfSpoke = 10
private constant int DefaultSpokeThickness = 4
private constant ULong DefaultColor = RGB(62,127,231)
private  double DefaultColorTimerInterval = .05

private constant int MacOSXInnerCircleRadius = 5
private constant int MacOSXOuterCircleRadius = 11
private constant int MacOSXNumberOfSpoke = 12
private constant int MacOSXSpokeThickness = 2
private  double MacOSXTimerInterval = .08

private constant int FireFoxInnerCircleRadius = 6
private constant int FireFoxOuterCircleRadius = 7
private constant int FireFoxNumberOfSpoke = 9
private constant int FireFoxSpokeThickness = 4
private  double FireFoxTimerInterval = .08

private constant int IE7InnerCircleRadius = 8
private constant int IE7OuterCircleRadius = 9
private constant int IE7NumberOfSpoke = 36
private constant int IE7SpokeThickness = 4
private  double IE7TimerInterval = .02

public constant int MacOSX = 1
public constant int Firefox = 2
public constant int IE = 3
public constant int Custom = 4
		

// Attributes ========================================================
private n_cst_loadingcircle_timer m_Timer
private boolean m_IsTimerActive
private int m_ProgressValue
private PointF m_CenterPoint
private ULong m_Color
private Long m_colorblue
private Long m_colorred
private Long m_colorgreen
private ULong m_Colors[]
private double m_Angles[]
private int m_StylePreset = IE

// Properties ========================================================

public ULong Color
public double OuterCircleRadius
public double InnerCircleRadius
public int NumberSpoke
public int SpokeThickness
public double RotationSpeed

private boolean ib_started

Public ULong BackColor1
Public ULong BackColor2
end variables

forward prototypes
public function integer of_tick ()
public function integer of_stop ()
public function integer of_tick ()
public function integer of_stop ()
public function integer of_start ()
public function integer of_setcolor (unsignedlong al_color)
private function unsignedlong of_darken (unsignedlong al_color, integer ai_percent)
private function integer of_generatecolorspallet ()
public function pointf of_getcontrolcenterpoint ()
public function integer of_getspokesangles ()
public function pointf of_getcoordinate (pointf str_circlecenter, double ai_radius, double ad_angle)
public function integer of_setcircleappearance (integer ai_numberspoke, integer ai_spokethickness, integer ai_innercircleradius, integer ai_outercircleradius, decimal ad_rotationspeed)
public function integer of_setstyle (long al_style)
public function integer of_setcolor (unsignedlong al_color, boolean ab_redraw)
end prototypes

event resize;of_GetControlCenterPoint()
end event

public function integer of_tick ();m_ProgressValue++
m_ProgressValue = Mod(m_ProgressValue,NumberSpoke)
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_stop ();m_timer.Stop()
ib_started = false
of_GenerateColorsPallet()
SetRedraw(TRUE)
RETURN 1
end function

public function integer of_start ();ib_started = true
of_GenerateColorsPallet()
m_timer.Start(RotationSpeed)
RETURN 1
end function

public function integer of_setcolor (unsignedlong al_color);RETURN of_SetColor(al_color, TRUE)
end function

private function unsignedlong of_darken (unsignedlong al_color, integer ai_percent);RETURN inv_pbusexternal.PBUSMakeARGB(ai_percent, Min(m_colorRed, 255), Min(m_colorGreen, 255), Min(m_colorBlue, 255));
end function

private function integer of_generatecolorspallet ();int bytIncrement
int intCursor
Long empty[]
bytIncrement = 255 / NumberSpoke

int PERCENTAGE_OF_DARKEN = 0;

m_colors = empty

FOR intCursor = 1 TO numberSpoke
	 IF ib_started THEN
		  IF intCursor = 0 OR intCursor < NumberSpoke - NumberSpoke THEN
				m_colors[intCursor] = m_Color;
			ELSE
				PERCENTAGE_OF_DARKEN += bytIncrement;

				if (PERCENTAGE_OF_DARKEN > 255) THEN
					 PERCENTAGE_OF_DARKEN = 255
				END IF

				m_colors[intCursor] = of_Darken(m_Color, PERCENTAGE_OF_DARKEN);
			END IF
	ELSE
		  m_colors[intCursor] = of_Darken(m_Color, 255);
	END IF
NEXT

RETURN 1
end function

public function pointf of_getcontrolcenterpoint ();m_CenterPoint.px = UnitsToPixels(Width, XUnitsToPixels!) / 2
m_CenterPoint.py = UnitsToPixels(Height, YUnitsToPixels!) / 2 - 1

RETURN m_CenterPoint
end function

public function integer of_getspokesangles ();double dblAngle
int shtCounter
double empty[]

dblAngle = NumberOfDegreesInCircle / NumberSpoke;
m_Angles = empty

FOR shtCounter = 1 TO NumberSpoke
	IF shtCounter = 1 THEN
		m_Angles[shtCounter] = dblAngle
	ELSE
		m_Angles[shtCounter] = m_Angles[shtCounter - 1] + dblAngle
	END IF

NEXT


RETURN 1
end function

public function pointf of_getcoordinate (pointf str_circlecenter, double ai_radius, double ad_angle);double dblAngle
PointF cord
dblAngle = 3.14159265359 * ad_Angle / NumberOfDegreesInHalfCircle;

cord.px = str_CircleCenter.pX + ai_Radius * Cos(dblAngle)
cord.py = str_CircleCenter.pY + ai_Radius * Sin(dblAngle)

RETURN cord
end function

public function integer of_setcircleappearance (integer ai_numberspoke, integer ai_spokethickness, integer ai_innercircleradius, integer ai_outercircleradius, decimal ad_rotationspeed);NumberSpoke = ai_numberSpoke;
SpokeThickness = ai_spokeThickness;
InnerCircleRadius = ai_innerCircleRadius;
OuterCircleRadius = ai_outerCircleRadius;
RotationSpeed = ad_rotationspeed

RETURN 1
end function

public function integer of_setstyle (long al_style);m_StylePreset = al_style

CHOOSE CASE al_style
	case MacOSX
		of_SetCircleAppearance(MacOSXNumberOfSpoke, &
			 MacOSXSpokeThickness, MacOSXInnerCircleRadius, &
			 MacOSXOuterCircleRadius, MacOSXTimerInterval)
		
  case Firefox
		of_SetCircleAppearance(FireFoxNumberOfSpoke, &
			 FireFoxSpokeThickness, FireFoxInnerCircleRadius, &
			 FireFoxOuterCircleRadius, FireFoxTimerInterval)

  case IE
		of_SetCircleAppearance(IE7NumberOfSpoke, &
			 IE7SpokeThickness, IE7InnerCircleRadius, &
			 IE7OuterCircleRadius, IE7TimerInterval)

  case Custom
		of_SetCircleAppearance(DefaultNumberOfSpoke, &
			 DefaultSpokeThickness, &
			 DefaultInnerCircleRadius, &
			 DefaultOuterCircleRadius, DefaultColorTimerInterval)
END CHOOSE

of_SetColor(DefaultColor)
of_GetSpokesAngles()
of_GetControlCenterPoint()

RETURN 1
end function

public function integer of_setcolor (unsignedlong al_color, boolean ab_redraw);m_Color = al_color;

m_ColorRed = Mod (m_Color, 256)

m_Color /= 256
m_ColorGreen	= Mod (m_Color, 256)

m_ColorBlue = m_Color / 256

of_GenerateColorsPallet()

IF ab_redraw THEN
	SetRedraw(TRUE)
END IF
RETURN 1
end function

on u_cst_loadingcircle.create
call super::create
end on

on u_cst_loadingcircle.destroy
call super::destroy
end on

event constructor;call super::constructor;m_Timer = CREATE n_cst_loadingcircle_timer
m_Timer.iuo_parent = this
of_SetStyle(m_StylePreset)

end event

event destructor;call super::destructor;IF IsValid(m_Timer) THEN m_Timer.Stop()
DESTROY m_Timer

end event

event onpaint;call super::onpaint;LongPtr lul_Pen, ll_backcolor
long ll_rtn
int intPosition, intCounter

lstr_input.GdiplusVersion = 1
ll_gdirtn = inv_win32.GdiplusStartup(lul_GdiToken, lstr_input, lstr_output)

IF NumberSpoke > 0 AND UpperBound(m_Angles) > 0 THEN

	IF NOT of_IsTransparent() THEN
		ULong ull_BackBrushColor
		RECT rc
		GetClientRect(Handle(THIS), rc)
		ull_BackBrushColor = CreateSolidBrush(GetPBColor(THIS.BackColor))
		FillRect(hdc, rc, ull_BackBrushColor)
		DeleteObject(ull_BackBrushColor)
	END IF
	
	IF ll_gdirtn = 0 THEN
	
		inv_win32.GdipCreateFromHDC(hdc, lul_Graphic)
		inv_win32.GdipSetSmoothingMode(lul_Graphic, 2)

		intPosition = m_ProgressValue

		FOR intCounter = 1 TO NumberSpoke
			intPosition = Mod(intPosition,NumberSpoke);
			
			IF (intPosition + 1) >  UpperBound(m_Angles) THEN CONTINUE
			
			PointF one
			PointF two
			
			one = of_GetCoordinate(m_CenterPoint, InnerCircleRadius, m_Angles[intPosition + 1])
			two = of_GetCoordinate(m_CenterPoint, OuterCircleRadius, m_Angles[intPosition + 1])
			
			inv_win32.GdipCreatePen1(m_Colors[intCounter], SpokeThickness, 2, lul_Pen)
			inv_win32.GdipSetPenStartCap(lul_Pen, 2)
			inv_win32.GdipSetPenEndCap(lul_Pen, 2)
			inv_win32.GdipDrawLine(lul_Graphic, lul_Pen, one.px, one.py, two.px, two.py)
			
			inv_win32.GdipDeletePen(lul_Pen)
			
			intPosition++;
			
		NEXT
		
		inv_win32.GdipDeleteGraphics(lul_Graphic)

	END IF
END IF

inv_win32.GdiplusShutdown(lul_GdiToken)

RETURN 1
end event

