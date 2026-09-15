$PBExportHeader$u_scintilla.sru
forward
global type u_scintilla from userobject
end type
type scnotification from structure within u_scintilla
end type
end forward

type scnotification from structure
	longptr		hwndfrom
	longptr		idfrom
	unsignedlong		code
	longptr		position
	long		ch
	long		modifiers
	long		modificationtype
	longptr		text
	longptr		length
	longptr		linesadded
	long		message
	longptr		wparam
	longptr		lparam
	longptr		line
	long		foldlevelnow
	long		foldlevelprev
	long		margin
	long		listtype
	long		x
	long		y
	long		token
	longptr		annotationlinesadded
	long		updated
	long		listcompletionmethod
	long		charactersource
end type

global type u_scintilla from userobject
integer width = 1335
integer height = 924
boolean border = true
userobjects objecttype = externalvisual!
long backcolor = 67108864
string classname = "Scintilla"
string libraryname = "Scintilla.dll"
borderstyle borderstyle = stylelowered!
event editchanged pbm_enchange
event getfocus pbm_ensetfocus
event losefocus pbm_enkillfocus
event ue_setlanguagecolors ( )
event wm_char pbm_char
event wm_notify pbm_notify
event resize pbm_size
event scn_autoccancelled ( )
event scn_autocchardeleted ( )
event scn_autoccompleted ( long startposition,  string selectedtext,  character ch,  long listcompletionmethod )
event scn_autocselection ( long startposition,  string selectedtext,  character ch,  long listcompletionmethod )
event scn_calltipclick ( longptr position )
event scn_charadded ( character ch )
event scn_doubleclick ( longptr position,  longptr line )
event scn_dwellend ( longptr position,  long xpos,  long ypos )
event scn_dwellstart ( longptr position,  long xpos,  long ypos )
event scn_focusin ( )
event scn_focusout ( )
event scn_hotspotclick ( longptr position,  long modifiers )
event scn_hotspotdoubleclick ( longptr position,  long modifiers )
event scn_hotspotreleaseclick ( longptr position,  long modifiers )
event scn_indicatorclick ( longptr position,  long modifiers )
event scn_indicatorrelease ( longptr position,  long modifiers )
event scn_macrorecord ( long msg,  longptr wparam,  longptr lparam )
event scn_marginclick ( long modifiers,  longptr position,  long margin )
event scn_marginrightclick ( long modifiers,  longptr position,  long margin )
event scn_modified ( scnotification scn )
event scn_modifyattemptro ( )
event scn_needshown ( longptr position,  longptr length )
event scn_painted ( )
event scn_savepoint ( boolean reached )
event scn_styleneeded ( long linestart,  longptr position )
event scn_updateui ( )
event scn_userlistselection ( unsignedlong listtype,  string selectedtext,  long startposition,  character ch,  long listcompletionmethod )
event scn_zoom ( )
end type
global u_scintilla u_scintilla

type prototypes
// Scintilla Functions

Function long SciSend ( &
	longptr hSciWnd, &
	ulong iMessage, &
	longptr wParam, &
	longptr lParam &
	) Library "Scintilla.dll" Alias For "Scintilla_DirectFunction"

Function long SciSend ( &
	longptr hSciWnd, &
	ulong iMessage, &
	longptr wParam, &
	Ref blob lParam &
	) Library "Scintilla.dll" Alias For "Scintilla_DirectFunction"

Function long SciSend ( &
	longptr hSciWnd, &
	ulong iMessage, &
	blob wParam, &
	Ref blob lParam &
	) Library "Scintilla.dll" Alias For "Scintilla_DirectFunction"

Function long SciSend ( &
	longptr hSciWnd, &
	ulong iMessage, &
	longptr wParam, &
	Ref string lParam &
	) Library "Scintilla.dll" Alias For "Scintilla_DirectFunction;Ansi"

Function long SciSend ( &
	longptr hSciWnd, &
	ulong iMessage, &
	string wParam, &
	Ref string lParam &
	) Library "Scintilla.dll" Alias For "Scintilla_DirectFunction;Ansi"

Function longptr CreateLexer ( &
	string lexerName &
	) Library "Lexilla.dll" Alias For "CreateLexer;Ansi"

// Windows Functions

Subroutine CopyNotification ( &
	Ref scNotification Destination, &
	longptr Source, &
	ulong Length &
	) Library  "kernel32.dll" Alias For "RtlMoveMemory"

Subroutine CopyMemory ( &
	Ref blob Destination, &
	longptr Source, &
	ulong Length &
	) Library "kernel32.dll" Alias For "RtlMoveMemory"

	Function long GetSysColor ( &
	long nIndex &
	) Library "user32.dll"

Function boolean OpenClipboard ( &
	longptr hWndNewOwner &
	) Library "user32.dll"

Function boolean EmptyClipboard ( &
	) Library "user32.dll"

Function boolean CloseClipboard ( &
	) Library "user32.dll"

Function boolean IsTextUnicode ( &
	blob lpv, &
	long iSize, &
	ref long lpiResult &
	) Library "advapi32.dll"

end prototypes

type variables
Private:

Longptr ip_hSciWnd
Environment ie_env

Boolean ib_usepopup = True
Boolean ib_bold
Boolean ib_italic
Long il_foldforecolor   = -1
Long il_foldbackcolor   = -1
Long il_FindScrollLines = 3
String is_commentchar1  = "//"
String is_commentchar2  = "/*"

// Colors
Long il_MarginBackColor = RGB(192,192,192)	// Margin Background		of_SetMarginBackColor
Long il_MarginTextColor = RGB(0,0,128)			// Margin Text				of_SetMarginTextColor
Long il_BackColor       = RGB(255,255,255)	// Text Background		of_SetBackColor
Long il_ForeColor       = 0						// Text Color				of_SetTextColor
Long il_SelectColor     = RGB(166,202,240)	// Text Select				of_SetSelectColor
Long il_CaretLineColor  = RGB(250,250,250)	// Caret Line Color		of_SetCaretLineColor
Long il_CaretColor      = 0						// Caret Color				of_SetCaretColor

// Find/Replace options
Boolean ib_MatchCase
Boolean ib_WholeWord
Boolean ib_WordStart
Boolean ib_RegEx
Boolean ib_Backwards
Boolean ib_IgnoreComment

Public:

Encoding #Encoding = EncodingAnsi!
Boolean #IndentGuides
Boolean #ReadOnly
Boolean #ShowNumbers
Boolean #WordWrap
Long #TextSize = 9
Long #TabWidth = 3
String #FontName = "Fixedsys"

// JSON Text Coloring
Constant Long SCE_JSON_NUMBER = 1
Constant Long SCE_JSON_STRING = 2
Constant Long SCE_JSON_STRINGEOL = 3
Constant Long SCE_JSON_PROPERTYNAME = 4
Constant Long SCE_JSON_ESCAPESEQUENCE = 5
Constant Long SCE_JSON_LINECOMMENT = 6
Constant Long SCE_JSON_BLOCKCOMMENT = 7
Constant Long SCE_JSON_OPERATOR = 8
Constant Long SCE_JSON_URI = 9
Constant Long SCE_JSON_COMPACTIRI = 10
Constant Long SCE_JSON_KEYWORD = 11
Constant Long SCE_JSON_LDKEYWORD = 12
Constant Long SCE_JSON_ERROR = 13

// PowerBuilder Text Coloring
Constant Long SCE_C_COMMENT = 1
Constant Long SCE_C_COMMENTLINE = 2
Constant Long SCE_C_COMMENTDOC = 3
Constant Long SCE_C_NUMBER = 4
Constant Long SCE_C_WORD = 5
Constant Long SCE_C_STRING = 6
Constant Long SCE_C_CHARACTER = 7
Constant Long SCE_C_WORD2 = 16

// Powershell Text Coloring
Constant Long SCE_POWERSHELL_COMMENT = 1
Constant Long SCE_POWERSHELL_STRING = 2
Constant Long SCE_POWERSHELL_CHARACTER = 3
Constant Long SCE_POWERSHELL_NUMBER = 4
Constant Long SCE_POWERSHELL_VARIABLE = 5
Constant Long SCE_POWERSHELL_OPERATOR = 6
Constant Long SCE_POWERSHELL_IDENTIFIER = 7
Constant Long SCE_POWERSHELL_KEYWORD = 8
Constant Long SCE_POWERSHELL_CMDLET = 9
Constant Long SCE_POWERSHELL_ALIAS = 10
Constant Long SCE_POWERSHELL_FUNCTION = 11

// SQL Text Coloring
Constant Long SCE_SQL_COMMENT = 1
Constant Long SCE_SQL_COMMENTLINE = 2
Constant Long SCE_SQL_COMMENTDOC = 3
Constant Long SCE_SQL_NUMBER = 4
Constant Long SCE_SQL_WORD = 5
Constant Long SCE_SQL_STRING = 6
Constant Long SCE_SQL_CHARACTER = 7
Constant Long SCE_SQL_WORD2 = 16

// XML Text Coloring
Constant Long SCE_H_TAG = 1
Constant Long SCE_H_TAGUNKNOWN = 2
Constant Long SCE_H_ATTRIBUTE = 3
Constant Long SCE_H_ATTRIBUTEUNKNOWN = 4
Constant Long SCE_H_NUMBER = 5
Constant Long SCE_H_DOUBLESTRING = 6
Constant Long SCE_H_SINGLESTRING = 7
Constant Long SCE_H_COMMENT = 9
Constant Long SCE_H_ENTITY = 10
Constant Long SCE_H_TAGEND = 11
Constant Long SCE_H_XMLSTART = 12
Constant Long SCE_H_XMLEND = 13
Constant Long SCE_H_CDATA = 17
Constant Long SCE_H_SGML_DEFAULT = 21

// Other Constants
Constant Long MAX_PATH = 260
Constant Long MARKER_NUM = 1
Constant Long MARKER_MASK = 2
Constant Long MARGIN_SCRIPT_FOLD_INDEX = 2
Constant Long SCLEX_NULL = 1

// Scintilla.h Constants
Constant Long INVALID_POSITION = -1
Constant Long SCI_START = 2000
Constant Long SCI_OPTIONAL_START = 3000
Constant Long SCI_LEXER_START = 4000
Constant Long SCI_ADDTEXT = 2001
Constant Long SCI_ADDSTYLEDTEXT = 2002
Constant Long SCI_INSERTTEXT = 2003
Constant Long SCI_CHANGEINSERTION = 2672
Constant Long SCI_CLEARALL = 2004
Constant Long SCI_DELETERANGE = 2645
Constant Long SCI_CLEARDOCUMENTSTYLE = 2005
Constant Long SCI_GETLENGTH = 2006
Constant Long SCI_GETCHARAT = 2007
Constant Long SCI_GETCURRENTPOS = 2008
Constant Long SCI_GETANCHOR = 2009
Constant Long SCI_GETSTYLEAT = 2010
Constant Long SCI_GETSTYLEINDEXAT = 2038
Constant Long SCI_REDO = 2011
Constant Long SCI_SETUNDOCOLLECTION = 2012
Constant Long SCI_SELECTALL = 2013
Constant Long SCI_SETSAVEPOINT = 2014
Constant Long SCI_GETSTYLEDTEXT = 2015
Constant Long SCI_CANREDO = 2016
Constant Long SCI_MARKERLINEFROMHANDLE = 2017
Constant Long SCI_MARKERDELETEHANDLE = 2018
Constant Long SCI_MARKERHANDLEFROMLINE = 2732
Constant Long SCI_MARKERNUMBERFROMLINE = 2733
Constant Long SCI_GETUNDOCOLLECTION = 2019
Constant Long SCWS_INVISIBLE = 0
Constant Long SCWS_VISIBLEALWAYS = 1
Constant Long SCWS_VISIBLEAFTERINDENT = 2
Constant Long SCWS_VISIBLEONLYININDENT = 3
Constant Long SCI_GETVIEWWS = 2020
Constant Long SCI_SETVIEWWS = 2021
Constant Long SCTD_LONGARROW = 0
Constant Long SCTD_STRIKEOUT = 1
Constant Long SCI_GETTABDRAWMODE = 2698
Constant Long SCI_SETTABDRAWMODE = 2699
Constant Long SCI_POSITIONFROMPOINT = 2022
Constant Long SCI_POSITIONFROMPOINTCLOSE = 2023
Constant Long SCI_GOTOLINE = 2024
Constant Long SCI_GOTOPOS = 2025
Constant Long SCI_SETANCHOR = 2026
Constant Long SCI_GETCURLINE = 2027
Constant Long SCI_GETENDSTYLED = 2028
Constant Long SC_EOL_CRLF = 0
Constant Long SC_EOL_CR = 1
Constant Long SC_EOL_LF = 2
Constant Long SCI_CONVERTEOLS = 2029
Constant Long SCI_GETEOLMODE = 2030
Constant Long SCI_SETEOLMODE = 2031
Constant Long SCI_STARTSTYLING = 2032
Constant Long SCI_SETSTYLING = 2033
Constant Long SCI_GETBUFFEREDDRAW = 2034
Constant Long SCI_SETBUFFEREDDRAW = 2035
Constant Long SCI_SETTABWIDTH = 2036
Constant Long SCI_GETTABWIDTH = 2121
Constant Long SCI_SETTABMINIMUMWIDTH = 2724
Constant Long SCI_GETTABMINIMUMWIDTH = 2725
Constant Long SCI_CLEARTABSTOPS = 2675
Constant Long SCI_ADDTABSTOP = 2676
Constant Long SCI_GETNEXTTABSTOP = 2677
Constant Long SC_CP_UTF8 = 65001
Constant Long SCI_SETCODEPAGE = 2037
Constant Long SCI_SETFONTLOCALE = 2760
Constant Long SCI_GETFONTLOCALE = 2761
Constant Long SC_IME_WINDOWED = 0
Constant Long SC_IME_INLINE = 1
Constant Long SCI_GETIMEINTERACTION = 2678
Constant Long SCI_SETIMEINTERACTION = 2679
Constant Long SC_ALPHA_TRANSPARENT = 0
Constant Long SC_ALPHA_OPAQUE = 255
Constant Long SC_ALPHA_NOALPHA = 256
Constant Long SC_CURSORNORMAL = -1
Constant Long SC_CURSORARROW = 2
Constant Long SC_CURSORWAIT = 4
Constant Long SC_CURSORREVERSEARROW = 7
Constant Long MARKER_MAX = 31
Constant Long SC_MARK_CIRCLE = 0
Constant Long SC_MARK_ROUNDRECT = 1
Constant Long SC_MARK_ARROW = 2
Constant Long SC_MARK_SMALLRECT = 3
Constant Long SC_MARK_SHORTARROW = 4
Constant Long SC_MARK_EMPTY = 5
Constant Long SC_MARK_ARROWDOWN = 6
Constant Long SC_MARK_MINUS = 7
Constant Long SC_MARK_PLUS = 8
Constant Long SC_MARK_VLINE = 9
Constant Long SC_MARK_LCORNER = 10
Constant Long SC_MARK_TCORNER = 11
Constant Long SC_MARK_BOXPLUS = 12
Constant Long SC_MARK_BOXPLUSCONNECTED = 13
Constant Long SC_MARK_BOXMINUS = 14
Constant Long SC_MARK_BOXMINUSCONNECTED = 15
Constant Long SC_MARK_LCORNERCURVE = 16
Constant Long SC_MARK_TCORNERCURVE = 17
Constant Long SC_MARK_CIRCLEPLUS = 18
Constant Long SC_MARK_CIRCLEPLUSCONNECTED = 19
Constant Long SC_MARK_CIRCLEMINUS = 20
Constant Long SC_MARK_CIRCLEMINUSCONNECTED = 21
Constant Long SC_MARK_BACKGROUND = 22
Constant Long SC_MARK_DOTDOTDOT = 23
Constant Long SC_MARK_ARROWS = 24
Constant Long SC_MARK_PIXMAP = 25
Constant Long SC_MARK_FULLRECT = 26
Constant Long SC_MARK_LEFTRECT = 27
Constant Long SC_MARK_AVAILABLE = 28
Constant Long SC_MARK_UNDERLINE = 29
Constant Long SC_MARK_RGBAIMAGE = 30
Constant Long SC_MARK_BOOKMARK = 31
Constant Long SC_MARK_VERTICALBOOKMARK = 32
Constant Long SC_MARK_BAR = 33
Constant Long SC_MARK_CHARACTER = 10000
Constant Long SC_MARKNUM_HISTORY_REVERTED_TO_ORIGIN = 21
Constant Long SC_MARKNUM_HISTORY_SAVED = 22
Constant Long SC_MARKNUM_HISTORY_MODIFIED = 23
Constant Long SC_MARKNUM_HISTORY_REVERTED_TO_MODIFIED = 24
Constant Long SC_MARKNUM_FOLDEREND = 25
Constant Long SC_MARKNUM_FOLDEROPENMID = 26
Constant Long SC_MARKNUM_FOLDERMIDTAIL = 27
Constant Long SC_MARKNUM_FOLDERTAIL = 28
Constant Long SC_MARKNUM_FOLDERSUB = 29
Constant Long SC_MARKNUM_FOLDER = 30
Constant Long SC_MARKNUM_FOLDEROPEN = 31
Constant Long SC_MASK_FOLDERS = 4261412864 // 0xFE000000
Constant Long SCI_MARKERDEFINE = 2040
Constant Long SCI_MARKERSETFORE = 2041
Constant Long SCI_MARKERSETBACK = 2042
Constant Long SCI_MARKERSETBACKSELECTED = 2292
Constant Long SCI_MARKERSETFORETRANSLUCENT = 2294
Constant Long SCI_MARKERSETBACKTRANSLUCENT = 2295
Constant Long SCI_MARKERSETBACKSELECTEDTRANSLUCENT = 2296
Constant Long SCI_MARKERSETSTROKEWIDTH = 2297
Constant Long SCI_MARKERENABLEHIGHLIGHT = 2293
Constant Long SCI_MARKERADD = 2043
Constant Long SCI_MARKERDELETE = 2044
Constant Long SCI_MARKERDELETEALL = 2045
Constant Long SCI_MARKERGET = 2046
Constant Long SCI_MARKERNEXT = 2047
Constant Long SCI_MARKERPREVIOUS = 2048
Constant Long SCI_MARKERDEFINEPIXMAP = 2049
Constant Long SCI_MARKERADDSET = 2466
Constant Long SCI_MARKERSETALPHA = 2476
Constant Long SCI_MARKERGETLAYER = 2734
Constant Long SCI_MARKERSETLAYER = 2735
Constant Long SC_MAX_MARGIN = 4
Constant Long SC_MARGIN_SYMBOL = 0
Constant Long SC_MARGIN_NUMBER = 1
Constant Long SC_MARGIN_BACK = 2
Constant Long SC_MARGIN_FORE = 3
Constant Long SC_MARGIN_TEXT = 4
Constant Long SC_MARGIN_RTEXT = 5
Constant Long SC_MARGIN_COLOUR = 6
Constant Long SCI_SETMARGINTYPEN = 2240
Constant Long SCI_GETMARGINTYPEN = 2241
Constant Long SCI_SETMARGINWIDTHN = 2242
Constant Long SCI_GETMARGINWIDTHN = 2243
Constant Long SCI_SETMARGINMASKN = 2244
Constant Long SCI_GETMARGINMASKN = 2245
Constant Long SCI_SETMARGINSENSITIVEN = 2246
Constant Long SCI_GETMARGINSENSITIVEN = 2247
Constant Long SCI_SETMARGINCURSORN = 2248
Constant Long SCI_GETMARGINCURSORN = 2249
Constant Long SCI_SETMARGINBACKN = 2250
Constant Long SCI_GETMARGINBACKN = 2251
Constant Long SCI_SETMARGINS = 2252
Constant Long SCI_GETMARGINS = 2253
Constant Long STYLE_DEFAULT = 32
Constant Long STYLE_LINENUMBER = 33
Constant Long STYLE_BRACELIGHT = 34
Constant Long STYLE_BRACEBAD = 35
Constant Long STYLE_CONTROLCHAR = 36
Constant Long STYLE_INDENTGUIDE = 37
Constant Long STYLE_CALLTIP = 38
Constant Long STYLE_FOLDDISPLAYTEXT = 39
Constant Long STYLE_LASTPREDEFINED = 39
Constant Long STYLE_MAX = 255
Constant Long SC_CHARSET_ANSI = 0
Constant Long SC_CHARSET_DEFAULT = 1
Constant Long SC_CHARSET_BALTIC = 186
Constant Long SC_CHARSET_CHINESEBIG5 = 136
Constant Long SC_CHARSET_EASTEUROPE = 238
Constant Long SC_CHARSET_GB2312 = 134
Constant Long SC_CHARSET_GREEK = 161
Constant Long SC_CHARSET_HANGUL = 129
Constant Long SC_CHARSET_MAC = 77
Constant Long SC_CHARSET_OEM = 255
Constant Long SC_CHARSET_RUSSIAN = 204
Constant Long SC_CHARSET_OEM866 = 866
Constant Long SC_CHARSET_CYRILLIC = 1251
Constant Long SC_CHARSET_SHIFTJIS = 128
Constant Long SC_CHARSET_SYMBOL = 2
Constant Long SC_CHARSET_TURKISH = 162
Constant Long SC_CHARSET_JOHAB = 130
Constant Long SC_CHARSET_HEBREW = 177
Constant Long SC_CHARSET_ARABIC = 178
Constant Long SC_CHARSET_VIETNAMESE = 163
Constant Long SC_CHARSET_THAI = 222
Constant Long SC_CHARSET_8859_15 = 1000
Constant Long SCI_STYLECLEARALL = 2050
Constant Long SCI_STYLESETFORE = 2051
Constant Long SCI_STYLESETBACK = 2052
Constant Long SCI_STYLESETBOLD = 2053
Constant Long SCI_STYLESETITALIC = 2054
Constant Long SCI_STYLESETSIZE = 2055
Constant Long SCI_STYLESETFONT = 2056
Constant Long SCI_STYLESETEOLFILLED = 2057
Constant Long SCI_STYLERESETDEFAULT = 2058
Constant Long SCI_STYLESETUNDERLINE = 2059
Constant Long SC_CASE_MIXED = 0
Constant Long SC_CASE_UPPER = 1
Constant Long SC_CASE_LOWER = 2
Constant Long SC_CASE_CAMEL = 3
Constant Long SCI_STYLEGETFORE = 2481
Constant Long SCI_STYLEGETBACK = 2482
Constant Long SCI_STYLEGETBOLD = 2483
Constant Long SCI_STYLEGETITALIC = 2484
Constant Long SCI_STYLEGETSIZE = 2485
Constant Long SCI_STYLEGETFONT = 2486
Constant Long SCI_STYLEGETEOLFILLED = 2487
Constant Long SCI_STYLEGETUNDERLINE = 2488
Constant Long SCI_STYLEGETCASE = 2489
Constant Long SCI_STYLEGETCHARACTERSET = 2490
Constant Long SCI_STYLEGETVISIBLE = 2491
Constant Long SCI_STYLEGETCHANGEABLE = 2492
Constant Long SCI_STYLEGETHOTSPOT = 2493
Constant Long SCI_STYLESETCASE = 2060
Constant Long SC_FONT_SIZE_MULTIPLIER = 100
Constant Long SCI_STYLESETSIZEFRACTIONAL = 2061
Constant Long SCI_STYLEGETSIZEFRACTIONAL = 2062
Constant Long SC_WEIGHT_NORMAL = 400
Constant Long SC_WEIGHT_SEMIBOLD = 600
Constant Long SC_WEIGHT_BOLD = 700
Constant Long SCI_STYLESETWEIGHT = 2063
Constant Long SCI_STYLEGETWEIGHT = 2064
Constant Long SCI_STYLESETCHARACTERSET = 2066
Constant Long SCI_STYLESETHOTSPOT = 2409
Constant Long SCI_STYLESETCHECKMONOSPACED = 2254
Constant Long SCI_STYLEGETCHECKMONOSPACED = 2255
Constant Long SCI_STYLESETINVISIBLEREPRESENTATION = 2256
Constant Long SCI_STYLEGETINVISIBLEREPRESENTATION = 2257
Constant Long SC_ELEMENT_LIST = 0
Constant Long SC_ELEMENT_LIST_BACK = 1
Constant Long SC_ELEMENT_LIST_SELECTED = 2
Constant Long SC_ELEMENT_LIST_SELECTED_BACK = 3
Constant Long SC_ELEMENT_SELECTION_TEXT = 10
Constant Long SC_ELEMENT_SELECTION_BACK = 11
Constant Long SC_ELEMENT_SELECTION_ADDITIONAL_TEXT = 12
Constant Long SC_ELEMENT_SELECTION_ADDITIONAL_BACK = 13
Constant Long SC_ELEMENT_SELECTION_SECONDARY_TEXT = 14
Constant Long SC_ELEMENT_SELECTION_SECONDARY_BACK = 15
Constant Long SC_ELEMENT_SELECTION_INACTIVE_TEXT = 16
Constant Long SC_ELEMENT_SELECTION_INACTIVE_BACK = 17
Constant Long SC_ELEMENT_CARET = 40
Constant Long SC_ELEMENT_CARET_ADDITIONAL = 41
Constant Long SC_ELEMENT_CARET_LINE_BACK = 50
Constant Long SC_ELEMENT_WHITE_SPACE = 60
Constant Long SC_ELEMENT_WHITE_SPACE_BACK = 61
Constant Long SC_ELEMENT_HOT_SPOT_ACTIVE = 70
Constant Long SC_ELEMENT_HOT_SPOT_ACTIVE_BACK = 71
Constant Long SC_ELEMENT_FOLD_LINE = 80
Constant Long SC_ELEMENT_HIDDEN_LINE = 81
Constant Long SCI_SETELEMENTCOLOUR = 2753
Constant Long SCI_GETELEMENTCOLOUR = 2754
Constant Long SCI_RESETELEMENTCOLOUR = 2755
Constant Long SCI_GETELEMENTISSET = 2756
Constant Long SCI_GETELEMENTALLOWSTRANSLUCENT = 2757
Constant Long SCI_GETELEMENTBASECOLOUR = 2758
Constant Long SCI_SETSELFORE = 2067
Constant Long SCI_SETSELBACK = 2068
Constant Long SCI_GETSELALPHA = 2477
Constant Long SCI_SETSELALPHA = 2478
Constant Long SCI_GETSELEOLFILLED = 2479
Constant Long SCI_SETSELEOLFILLED = 2480
Constant Long SC_LAYER_BASE = 0
Constant Long SC_LAYER_UNDER_TEXT = 1
Constant Long SC_LAYER_OVER_TEXT = 2
Constant Long SCI_GETSELECTIONLAYER = 2762
Constant Long SCI_SETSELECTIONLAYER = 2763
Constant Long SCI_GETCARETLINELAYER = 2764
Constant Long SCI_SETCARETLINELAYER = 2765
Constant Long SCI_GETCARETLINEHIGHLIGHTSUBLINE = 2773
Constant Long SCI_SETCARETLINEHIGHLIGHTSUBLINE = 2774
Constant Long SCI_SETCARETFORE = 2069
Constant Long SCI_ASSIGNCMDKEY = 2070
Constant Long SCI_CLEARCMDKEY = 2071
Constant Long SCI_CLEARALLCMDKEYS = 2072
Constant Long SCI_SETSTYLINGEX = 2073
Constant Long SCI_STYLESETVISIBLE = 2074
Constant Long SCI_GETCARETPERIOD = 2075
Constant Long SCI_SETCARETPERIOD = 2076
Constant Long SCI_SETWORDCHARS = 2077
Constant Long SCI_GETWORDCHARS = 2646
Constant Long SCI_SETCHARACTERCATEGORYOPTIMIZATION = 2720
Constant Long SCI_GETCHARACTERCATEGORYOPTIMIZATION = 2721
Constant Long SCI_BEGINUNDOACTION = 2078
Constant Long SCI_ENDUNDOACTION = 2079
Constant Long INDIC_PLAIN = 0
Constant Long INDIC_SQUIGGLE = 1
Constant Long INDIC_TT = 2
Constant Long INDIC_DIAGONAL = 3
Constant Long INDIC_STRIKE = 4
Constant Long INDIC_HIDDEN = 5
Constant Long INDIC_BOX = 6
Constant Long INDIC_ROUNDBOX = 7
Constant Long INDIC_STRAIGHTBOX = 8
Constant Long INDIC_DASH = 9
Constant Long INDIC_DOTS = 10
Constant Long INDIC_SQUIGGLELOW = 11
Constant Long INDIC_DOTBOX = 12
Constant Long INDIC_SQUIGGLEPIXMAP = 13
Constant Long INDIC_COMPOSITIONTHICK = 14
Constant Long INDIC_COMPOSITIONTHIN = 15
Constant Long INDIC_FULLBOX = 16
Constant Long INDIC_TEXTFORE = 17
Constant Long INDIC_POINT = 18
Constant Long INDIC_POINTCHARACTER = 19
Constant Long INDIC_GRADIENT = 20
Constant Long INDIC_GRADIENTCENTRE = 21
Constant Long INDIC_POINT_TOP = 22
Constant Long INDIC_CONTAINER = 8
Constant Long INDIC_IME = 32
Constant Long INDIC_IME_MAX = 35
Constant Long INDIC_MAX = 35
Constant Long INDICATOR_CONTAINER = 8
Constant Long INDICATOR_IME = 32
Constant Long INDICATOR_IME_MAX = 35
Constant Long INDICATOR_HISTORY_REVERTED_TO_ORIGIN_INSERTION = 36
Constant Long INDICATOR_HISTORY_REVERTED_TO_ORIGIN_DELETION = 37
Constant Long INDICATOR_HISTORY_SAVED_INSERTION = 38
Constant Long INDICATOR_HISTORY_SAVED_DELETION = 39
Constant Long INDICATOR_HISTORY_MODIFIED_INSERTION = 40
Constant Long INDICATOR_HISTORY_MODIFIED_DELETION = 41
Constant Long INDICATOR_HISTORY_REVERTED_TO_MODIFIED_INSERTION = 42
Constant Long INDICATOR_HISTORY_REVERTED_TO_MODIFIED_DELETION = 43
Constant Long INDICATOR_MAX = 43
Constant Long SCI_INDICSETSTYLE = 2080
Constant Long SCI_INDICGETSTYLE = 2081
Constant Long SCI_INDICSETFORE = 2082
Constant Long SCI_INDICGETFORE = 2083
Constant Long SCI_INDICSETUNDER = 2510
Constant Long SCI_INDICGETUNDER = 2511
Constant Long SCI_INDICSETHOVERSTYLE = 2680
Constant Long SCI_INDICGETHOVERSTYLE = 2681
Constant Long SCI_INDICSETHOVERFORE = 2682
Constant Long SCI_INDICGETHOVERFORE = 2683
Constant Long SC_INDICVALUEBIT = 16777216 // 0x1000000
Constant Long SC_INDICVALUEMASK = 16777215 // 0xFFFFFF
Constant Long SC_INDICFLAG_NONE = 0
Constant Long SC_INDICFLAG_VALUEFORE = 1
Constant Long SCI_INDICSETFLAGS = 2684
Constant Long SCI_INDICGETFLAGS = 2685
Constant Long SCI_INDICSETSTROKEWIDTH = 2751
Constant Long SCI_INDICGETSTROKEWIDTH = 2752
Constant Long SCI_SETWHITESPACEFORE = 2084
Constant Long SCI_SETWHITESPACEBACK = 2085
Constant Long SCI_SETWHITESPACESIZE = 2086
Constant Long SCI_GETWHITESPACESIZE = 2087
Constant Long SCI_SETLINESTATE = 2092
Constant Long SCI_GETLINESTATE = 2093
Constant Long SCI_GETMAXLINESTATE = 2094
Constant Long SCI_GETCARETLINEVISIBLE = 2095
Constant Long SCI_SETCARETLINEVISIBLE = 2096
Constant Long SCI_GETCARETLINEBACK = 2097
Constant Long SCI_SETCARETLINEBACK = 2098
Constant Long SCI_GETCARETLINEFRAME = 2704
Constant Long SCI_SETCARETLINEFRAME = 2705
Constant Long SCI_STYLESETCHANGEABLE = 2099
Constant Long SCI_AUTOCSHOW = 2100
Constant Long SCI_AUTOCCANCEL = 2101
Constant Long SCI_AUTOCACTIVE = 2102
Constant Long SCI_AUTOCPOSSTART = 2103
Constant Long SCI_AUTOCCOMPLETE = 2104
Constant Long SCI_AUTOCSTOPS = 2105
Constant Long SCI_AUTOCSETSEPARATOR = 2106
Constant Long SCI_AUTOCGETSEPARATOR = 2107
Constant Long SCI_AUTOCSELECT = 2108
Constant Long SCI_AUTOCSETCANCELATSTART = 2110
Constant Long SCI_AUTOCGETCANCELATSTART = 2111
Constant Long SCI_AUTOCSETFILLUPS = 2112
Constant Long SCI_AUTOCSETCHOOSESINGLE = 2113
Constant Long SCI_AUTOCGETCHOOSESINGLE = 2114
Constant Long SCI_AUTOCSETIGNORECASE = 2115
Constant Long SCI_AUTOCGETIGNORECASE = 2116
Constant Long SCI_USERLISTSHOW = 2117
Constant Long SCI_AUTOCSETAUTOHIDE = 2118
Constant Long SCI_AUTOCGETAUTOHIDE = 2119
Constant Long SC_AUTOCOMPLETE_NORMAL = 0
Constant Long SC_AUTOCOMPLETE_FIXED_SIZE = 1
Constant Long SCI_AUTOCSETOPTIONS = 2638
Constant Long SCI_AUTOCGETOPTIONS = 2639
Constant Long SCI_AUTOCSETDROPRESTOFWORD = 2270
Constant Long SCI_AUTOCGETDROPRESTOFWORD = 2271
Constant Long SCI_REGISTERIMAGE = 2405
Constant Long SCI_CLEARREGISTEREDIMAGES = 2408
Constant Long SCI_AUTOCGETTYPESEPARATOR = 2285
Constant Long SCI_AUTOCSETTYPESEPARATOR = 2286
Constant Long SCI_AUTOCSETMAXWIDTH = 2208
Constant Long SCI_AUTOCGETMAXWIDTH = 2209
Constant Long SCI_AUTOCSETMAXHEIGHT = 2210
Constant Long SCI_AUTOCGETMAXHEIGHT = 2211
Constant Long SCI_SETINDENT = 2122
Constant Long SCI_GETINDENT = 2123
Constant Long SCI_SETUSETABS = 2124
Constant Long SCI_GETUSETABS = 2125
Constant Long SCI_SETLINEINDENTATION = 2126
Constant Long SCI_GETLINEINDENTATION = 2127
Constant Long SCI_GETLINEINDENTPOSITION = 2128
Constant Long SCI_GETCOLUMN = 2129
Constant Long SCI_COUNTCHARACTERS = 2633
Constant Long SCI_COUNTCODEUNITS = 2715
Constant Long SCI_SETHSCROLLBAR = 2130
Constant Long SCI_GETHSCROLLBAR = 2131
Constant Long SC_IV_NONE = 0
Constant Long SC_IV_REAL = 1
Constant Long SC_IV_LOOKFORWARD = 2
Constant Long SC_IV_LOOKBOTH = 3
Constant Long SCI_SETINDENTATIONGUIDES = 2132
Constant Long SCI_GETINDENTATIONGUIDES = 2133
Constant Long SCI_SETHIGHLIGHTGUIDE = 2134
Constant Long SCI_GETHIGHLIGHTGUIDE = 2135
Constant Long SCI_GETLINEENDPOSITION = 2136
Constant Long SCI_GETCODEPAGE = 2137
Constant Long SCI_GETCARETFORE = 2138
Constant Long SCI_GETREADONLY = 2140
Constant Long SCI_SETCURRENTPOS = 2141
Constant Long SCI_SETSELECTIONSTART = 2142
Constant Long SCI_GETSELECTIONSTART = 2143
Constant Long SCI_SETSELECTIONEND = 2144
Constant Long SCI_GETSELECTIONEND = 2145
Constant Long SCI_SETEMPTYSELECTION = 2556
Constant Long SCI_SETPRINTMAGNIFICATION = 2146
Constant Long SCI_GETPRINTMAGNIFICATION = 2147
Constant Long SC_PRINT_NORMAL = 0
Constant Long SC_PRINT_INVERTLIGHT = 1
Constant Long SC_PRINT_BLACKONWHITE = 2
Constant Long SC_PRINT_COLOURONWHITE = 3
Constant Long SC_PRINT_COLOURONWHITEDEFAULTBG = 4
Constant Long SC_PRINT_SCREENCOLOURS = 5
Constant Long SCI_SETPRINTCOLOURMODE = 2148
Constant Long SCI_GETPRINTCOLOURMODE = 2149
Constant Long SCFIND_NONE = 0 // 0x0
Constant Long SCFIND_WHOLEWORD = 2 // 0x2
Constant Long SCFIND_MATCHCASE = 4 // 0x4
Constant Long SCFIND_WORDSTART = 1048576 // 0x00100000
Constant Long SCFIND_REGEXP = 2097152 // 0x00200000
Constant Long SCFIND_POSIX = 4194304 // 0x00400000
Constant Long SCFIND_CXX11REGEX = 8388608 // 0x00800000
Constant Long SCI_FINDTEXT = 2150
Constant Long SCI_FINDTEXTFULL = 2196
Constant Long SCI_FORMATRANGE = 2151
Constant Long SCI_FORMATRANGEFULL = 2777
Constant Long SC_CHANGE_HISTORY_DISABLED = 0
Constant Long SC_CHANGE_HISTORY_ENABLED = 1
Constant Long SC_CHANGE_HISTORY_MARKERS = 2
Constant Long SC_CHANGE_HISTORY_INDICATORS = 4
Constant Long SCI_SETCHANGEHISTORY = 2780
Constant Long SCI_GETCHANGEHISTORY = 2781
Constant Long SCI_GETFIRSTVISIBLELINE = 2152
Constant Long SCI_GETLINE = 2153
Constant Long SCI_GETLINECOUNT = 2154
Constant Long SCI_ALLOCATELINES = 2089
Constant Long SCI_SETMARGINLEFT = 2155
Constant Long SCI_GETMARGINLEFT = 2156
Constant Long SCI_SETMARGINRIGHT = 2157
Constant Long SCI_GETMARGINRIGHT = 2158
Constant Long SCI_GETMODIFY = 2159
Constant Long SCI_SETSEL = 2160
Constant Long SCI_GETSELTEXT = 2161
Constant Long SCI_GETTEXTRANGE = 2162
Constant Long SCI_GETTEXTRANGEFULL = 2039
Constant Long SCI_HIDESELECTION = 2163
Constant Long SCI_GETSELECTIONHIDDEN = 2088
Constant Long SCI_POINTXFROMPOSITION = 2164
Constant Long SCI_POINTYFROMPOSITION = 2165
Constant Long SCI_LINEFROMPOSITION = 2166
Constant Long SCI_POSITIONFROMLINE = 2167
Constant Long SCI_LINESCROLL = 2168
Constant Long SCI_SCROLLCARET = 2169
Constant Long SCI_SCROLLRANGE = 2569
Constant Long SCI_REPLACESEL = 2170
Constant Long SCI_SETREADONLY = 2171
Constant Long SCI_NULL = 2172
Constant Long SCI_CANPASTE = 2173
Constant Long SCI_CANUNDO = 2174
Constant Long SCI_EMPTYUNDOBUFFER = 2175
Constant Long SCI_UNDO = 2176
Constant Long SCI_CUT = 2177
Constant Long SCI_COPY = 2178
Constant Long SCI_PASTE = 2179
Constant Long SCI_CLEAR = 2180
Constant Long SCI_SETTEXT = 2181
Constant Long SCI_GETTEXT = 2182
Constant Long SCI_GETTEXTLENGTH = 2183
Constant Long SCI_GETDIRECTFUNCTION = 2184
Constant Long SCI_GETDIRECTSTATUSFUNCTION = 2772
Constant Long SCI_GETDIRECTPOINTER = 2185
Constant Long SCI_SETOVERTYPE = 2186
Constant Long SCI_GETOVERTYPE = 2187
Constant Long SCI_SETCARETWIDTH = 2188
Constant Long SCI_GETCARETWIDTH = 2189
Constant Long SCI_SETTARGETSTART = 2190
Constant Long SCI_GETTARGETSTART = 2191
Constant Long SCI_SETTARGETSTARTVIRTUALSPACE = 2728
Constant Long SCI_GETTARGETSTARTVIRTUALSPACE = 2729
Constant Long SCI_SETTARGETEND = 2192
Constant Long SCI_GETTARGETEND = 2193
Constant Long SCI_SETTARGETENDVIRTUALSPACE = 2730
Constant Long SCI_GETTARGETENDVIRTUALSPACE = 2731
Constant Long SCI_SETTARGETRANGE = 2686
Constant Long SCI_GETTARGETTEXT = 2687
Constant Long SCI_TARGETFROMSELECTION = 2287
Constant Long SCI_TARGETWHOLEDOCUMENT = 2690
Constant Long SCI_REPLACETARGET = 2194
Constant Long SCI_REPLACETARGETRE = 2195
Constant Long SCI_SEARCHINTARGET = 2197
Constant Long SCI_SETSEARCHFLAGS = 2198
Constant Long SCI_GETSEARCHFLAGS = 2199
Constant Long SCI_CALLTIPSHOW = 2200
Constant Long SCI_CALLTIPCANCEL = 2201
Constant Long SCI_CALLTIPACTIVE = 2202
Constant Long SCI_CALLTIPPOSSTART = 2203
Constant Long SCI_CALLTIPSETPOSSTART = 2214
Constant Long SCI_CALLTIPSETHLT = 2204
Constant Long SCI_CALLTIPSETBACK = 2205
Constant Long SCI_CALLTIPSETFORE = 2206
Constant Long SCI_CALLTIPSETFOREHLT = 2207
Constant Long SCI_CALLTIPUSESTYLE = 2212
Constant Long SCI_CALLTIPSETPOSITION = 2213
Constant Long SCI_VISIBLEFROMDOCLINE = 2220
Constant Long SCI_DOCLINEFROMVISIBLE = 2221
Constant Long SCI_WRAPCOUNT = 2235
Constant Long SC_FOLDLEVELNONE = 0 // 0x0
Constant Long SC_FOLDLEVELBASE = 1024 // 0x400
Constant Long SC_FOLDLEVELWHITEFLAG = 4096 // 0x1000
Constant Long SC_FOLDLEVELHEADERFLAG = 8192 // 0x2000
Constant Long SC_FOLDLEVELNUMBERMASK = 4095 // 0x0FFF
Constant Long SCI_SETFOLDLEVEL = 2222
Constant Long SCI_GETFOLDLEVEL = 2223
Constant Long SCI_GETLASTCHILD = 2224
Constant Long SCI_GETFOLDPARENT = 2225
Constant Long SCI_SHOWLINES = 2226
Constant Long SCI_HIDELINES = 2227
Constant Long SCI_GETLINEVISIBLE = 2228
Constant Long SCI_GETALLLINESVISIBLE = 2236
Constant Long SCI_SETFOLDEXPANDED = 2229
Constant Long SCI_GETFOLDEXPANDED = 2230
Constant Long SCI_TOGGLEFOLD = 2231
Constant Long SCI_TOGGLEFOLDSHOWTEXT = 2700
Constant Long SC_FOLDDISPLAYTEXT_HIDDEN = 0
Constant Long SC_FOLDDISPLAYTEXT_STANDARD = 1
Constant Long SC_FOLDDISPLAYTEXT_BOXED = 2
Constant Long SCI_FOLDDISPLAYTEXTSETSTYLE = 2701
Constant Long SCI_FOLDDISPLAYTEXTGETSTYLE = 2707
Constant Long SCI_SETDEFAULTFOLDDISPLAYTEXT = 2722
Constant Long SCI_GETDEFAULTFOLDDISPLAYTEXT = 2723
Constant Long SC_FOLDACTION_CONTRACT = 0
Constant Long SC_FOLDACTION_EXPAND = 1
Constant Long SC_FOLDACTION_TOGGLE = 2
Constant Long SC_FOLDACTION_CONTRACT_EVERY_LEVEL = 4
Constant Long SCI_FOLDLINE = 2237
Constant Long SCI_FOLDCHILDREN = 2238
Constant Long SCI_EXPANDCHILDREN = 2239
Constant Long SCI_FOLDALL = 2662
Constant Long SCI_ENSUREVISIBLE = 2232
Constant Long SC_AUTOMATICFOLD_NONE = 0 // 0x0000
Constant Long SC_AUTOMATICFOLD_SHOW = 1 // 0x0001
Constant Long SC_AUTOMATICFOLD_CLICK = 2 // 0x0002
Constant Long SC_AUTOMATICFOLD_CHANGE = 4 // 0x0004
Constant Long SCI_SETAUTOMATICFOLD = 2663
Constant Long SCI_GETAUTOMATICFOLD = 2664
Constant Long SC_FOLDFLAG_NONE = 0 // 0x0000
Constant Long SC_FOLDFLAG_LINEBEFORE_EXPANDED = 2 // 0x0002
Constant Long SC_FOLDFLAG_LINEBEFORE_CONTRACTED = 4 // 0x0004
Constant Long SC_FOLDFLAG_LINEAFTER_EXPANDED = 8 // 0x0008
Constant Long SC_FOLDFLAG_LINEAFTER_CONTRACTED = 16 // 0x0010
Constant Long SC_FOLDFLAG_LEVELNUMBERS = 64 // 0x0040
Constant Long SC_FOLDFLAG_LINESTATE = 128 // 0x0080
Constant Long SCI_SETFOLDFLAGS = 2233
Constant Long SCI_ENSUREVISIBLEENFORCEPOLICY = 2234
Constant Long SCI_SETTABINDENTS = 2260
Constant Long SCI_GETTABINDENTS = 2261
Constant Long SCI_SETBACKSPACEUNINDENTS = 2262
Constant Long SCI_GETBACKSPACEUNINDENTS = 2263
Constant Long SC_TIME_FOREVER = 10000000
Constant Long SCI_SETMOUSEDWELLTIME = 2264
Constant Long SCI_GETMOUSEDWELLTIME = 2265
Constant Long SCI_WORDSTARTPOSITION = 2266
Constant Long SCI_WORDENDPOSITION = 2267
Constant Long SCI_ISRANGEWORD = 2691
Constant Long SC_IDLESTYLING_NONE = 0
Constant Long SC_IDLESTYLING_TOVISIBLE = 1
Constant Long SC_IDLESTYLING_AFTERVISIBLE = 2
Constant Long SC_IDLESTYLING_ALL = 3
Constant Long SCI_SETIDLESTYLING = 2692
Constant Long SCI_GETIDLESTYLING = 2693
Constant Long SC_WRAP_NONE = 0
Constant Long SC_WRAP_WORD = 1
Constant Long SC_WRAP_CHAR = 2
Constant Long SC_WRAP_WHITESPACE = 3
Constant Long SCI_SETWRAPMODE = 2268
Constant Long SCI_GETWRAPMODE = 2269
Constant Long SC_WRAPVISUALFLAG_NONE = 0 // 0x0000
Constant Long SC_WRAPVISUALFLAG_END = 1 // 0x0001
Constant Long SC_WRAPVISUALFLAG_START = 2 // 0x0002
Constant Long SC_WRAPVISUALFLAG_MARGIN = 4 // 0x0004
Constant Long SCI_SETWRAPVISUALFLAGS = 2460
Constant Long SCI_GETWRAPVISUALFLAGS = 2461
Constant Long SC_WRAPVISUALFLAGLOC_DEFAULT = 0 // 0x0000
Constant Long SC_WRAPVISUALFLAGLOC_END_BY_TEXT = 1 // 0x0001
Constant Long SC_WRAPVISUALFLAGLOC_START_BY_TEXT = 2 // 0x0002
Constant Long SCI_SETWRAPVISUALFLAGSLOCATION = 2462
Constant Long SCI_GETWRAPVISUALFLAGSLOCATION = 2463
Constant Long SCI_SETWRAPSTARTINDENT = 2464
Constant Long SCI_GETWRAPSTARTINDENT = 2465
Constant Long SC_WRAPINDENT_FIXED = 0
Constant Long SC_WRAPINDENT_SAME = 1
Constant Long SC_WRAPINDENT_INDENT = 2
Constant Long SC_WRAPINDENT_DEEPINDENT = 3
Constant Long SCI_SETWRAPINDENTMODE = 2472
Constant Long SCI_GETWRAPINDENTMODE = 2473
Constant Long SC_CACHE_NONE = 0
Constant Long SC_CACHE_CARET = 1
Constant Long SC_CACHE_PAGE = 2
Constant Long SC_CACHE_DOCUMENT = 3
Constant Long SCI_SETLAYOUTCACHE = 2272
Constant Long SCI_GETLAYOUTCACHE = 2273
Constant Long SCI_SETSCROLLWIDTH = 2274
Constant Long SCI_GETSCROLLWIDTH = 2275
Constant Long SCI_SETSCROLLWIDTHTRACKING = 2516
Constant Long SCI_GETSCROLLWIDTHTRACKING = 2517
Constant Long SCI_TEXTWIDTH = 2276
Constant Long SCI_SETENDATLASTLINE = 2277
Constant Long SCI_GETENDATLASTLINE = 2278
Constant Long SCI_TEXTHEIGHT = 2279
Constant Long SCI_SETVSCROLLBAR = 2280
Constant Long SCI_GETVSCROLLBAR = 2281
Constant Long SCI_APPENDTEXT = 2282
Constant Long SC_PHASES_ONE = 0
Constant Long SC_PHASES_TWO = 1
Constant Long SC_PHASES_MULTIPLE = 2
Constant Long SCI_GETPHASESDRAW = 2673
Constant Long SCI_SETPHASESDRAW = 2674
Constant Long SC_EFF_QUALITY_MASK = 15 // 0xF
Constant Long SC_EFF_QUALITY_DEFAULT = 0
Constant Long SC_EFF_QUALITY_NON_ANTIALIASED = 1
Constant Long SC_EFF_QUALITY_ANTIALIASED = 2
Constant Long SC_EFF_QUALITY_LCD_OPTIMIZED = 3
Constant Long SCI_SETFONTQUALITY = 2611
Constant Long SCI_GETFONTQUALITY = 2612
Constant Long SCI_SETFIRSTVISIBLELINE = 2613
Constant Long SC_MULTIPASTE_ONCE = 0
Constant Long SC_MULTIPASTE_EACH = 1
Constant Long SCI_SETMULTIPASTE = 2614
Constant Long SCI_GETMULTIPASTE = 2615
Constant Long SCI_GETTAG = 2616
Constant Long SCI_LINESJOIN = 2288
Constant Long SCI_LINESSPLIT = 2289
Constant Long SCI_SETFOLDMARGINCOLOUR = 2290
Constant Long SCI_SETFOLDMARGINHICOLOUR = 2291
Constant Long SC_ACCESSIBILITY_DISABLED = 0
Constant Long SC_ACCESSIBILITY_ENABLED = 1
Constant Long SCI_SETACCESSIBILITY = 2702
Constant Long SCI_GETACCESSIBILITY = 2703
Constant Long SCI_LINEDOWN = 2300
Constant Long SCI_LINEDOWNEXTEND = 2301
Constant Long SCI_LINEUP = 2302
Constant Long SCI_LINEUPEXTEND = 2303
Constant Long SCI_CHARLEFT = 2304
Constant Long SCI_CHARLEFTEXTEND = 2305
Constant Long SCI_CHARRIGHT = 2306
Constant Long SCI_CHARRIGHTEXTEND = 2307
Constant Long SCI_WORDLEFT = 2308
Constant Long SCI_WORDLEFTEXTEND = 2309
Constant Long SCI_WORDRIGHT = 2310
Constant Long SCI_WORDRIGHTEXTEND = 2311
Constant Long SCI_HOME = 2312
Constant Long SCI_HOMEEXTEND = 2313
Constant Long SCI_LINEEND = 2314
Constant Long SCI_LINEENDEXTEND = 2315
Constant Long SCI_DOCUMENTSTART = 2316
Constant Long SCI_DOCUMENTSTARTEXTEND = 2317
Constant Long SCI_DOCUMENTEND = 2318
Constant Long SCI_DOCUMENTENDEXTEND = 2319
Constant Long SCI_PAGEUP = 2320
Constant Long SCI_PAGEUPEXTEND = 2321
Constant Long SCI_PAGEDOWN = 2322
Constant Long SCI_PAGEDOWNEXTEND = 2323
Constant Long SCI_EDITTOGGLEOVERTYPE = 2324
Constant Long SCI_CANCEL = 2325
Constant Long SCI_DELETEBACK = 2326
Constant Long SCI_TAB = 2327
Constant Long SCI_BACKTAB = 2328
Constant Long SCI_NEWLINE = 2329
Constant Long SCI_FORMFEED = 2330
Constant Long SCI_VCHOME = 2331
Constant Long SCI_VCHOMEEXTEND = 2332
Constant Long SCI_ZOOMIN = 2333
Constant Long SCI_ZOOMOUT = 2334
Constant Long SCI_DELWORDLEFT = 2335
Constant Long SCI_DELWORDRIGHT = 2336
Constant Long SCI_DELWORDRIGHTEND = 2518
Constant Long SCI_LINECUT = 2337
Constant Long SCI_LINEDELETE = 2338
Constant Long SCI_LINETRANSPOSE = 2339
Constant Long SCI_LINEREVERSE = 2354
Constant Long SCI_LINEDUPLICATE = 2404
Constant Long SCI_LOWERCASE = 2340
Constant Long SCI_UPPERCASE = 2341
Constant Long SCI_LINESCROLLDOWN = 2342
Constant Long SCI_LINESCROLLUP = 2343
Constant Long SCI_DELETEBACKNOTLINE = 2344
Constant Long SCI_HOMEDISPLAY = 2345
Constant Long SCI_HOMEDISPLAYEXTEND = 2346
Constant Long SCI_LINEENDDISPLAY = 2347
Constant Long SCI_LINEENDDISPLAYEXTEND = 2348
Constant Long SCI_HOMEWRAP = 2349
Constant Long SCI_HOMEWRAPEXTEND = 2450
Constant Long SCI_LINEENDWRAP = 2451
Constant Long SCI_LINEENDWRAPEXTEND = 2452
Constant Long SCI_VCHOMEWRAP = 2453
Constant Long SCI_VCHOMEWRAPEXTEND = 2454
Constant Long SCI_LINECOPY = 2455
Constant Long SCI_MOVECARETINSIDEVIEW = 2401
Constant Long SCI_LINELENGTH = 2350
Constant Long SCI_BRACEHIGHLIGHT = 2351
Constant Long SCI_BRACEHIGHLIGHTINDICATOR = 2498
Constant Long SCI_BRACEBADLIGHT = 2352
Constant Long SCI_BRACEBADLIGHTINDICATOR = 2499
Constant Long SCI_BRACEMATCH = 2353
Constant Long SCI_BRACEMATCHNEXT = 2369
Constant Long SCI_GETVIEWEOL = 2355
Constant Long SCI_SETVIEWEOL = 2356
Constant Long SCI_GETDOCPOINTER = 2357
Constant Long SCI_SETDOCPOINTER = 2358
Constant Long SCI_SETMODEVENTMASK = 2359
Constant Long EDGE_NONE = 0
Constant Long EDGE_LINE = 1
Constant Long EDGE_BACKGROUND = 2
Constant Long EDGE_MULTILINE = 3
Constant Long SCI_GETEDGECOLUMN = 2360
Constant Long SCI_SETEDGECOLUMN = 2361
Constant Long SCI_GETEDGEMODE = 2362
Constant Long SCI_SETEDGEMODE = 2363
Constant Long SCI_GETEDGECOLOUR = 2364
Constant Long SCI_SETEDGECOLOUR = 2365
Constant Long SCI_MULTIEDGEADDLINE = 2694
Constant Long SCI_MULTIEDGECLEARALL = 2695
Constant Long SCI_GETMULTIEDGECOLUMN = 2749
Constant Long SCI_SEARCHANCHOR = 2366
Constant Long SCI_SEARCHNEXT = 2367
Constant Long SCI_SEARCHPREV = 2368
Constant Long SCI_LINESONSCREEN = 2370
Constant Long SC_POPUP_NEVER = 0
Constant Long SC_POPUP_ALL = 1
Constant Long SC_POPUP_TEXT = 2
Constant Long SCI_USEPOPUP = 2371
Constant Long SCI_SELECTIONISRECTANGLE = 2372
Constant Long SCI_SETZOOM = 2373
Constant Long SCI_GETZOOM = 2374
Constant Long SC_DOCUMENTOPTION_DEFAULT = 0
Constant Long SC_DOCUMENTOPTION_STYLES_NONE = 1 // 0x1
Constant Long SC_DOCUMENTOPTION_TEXT_LARGE = 256 // 0x100
Constant Long SCI_CREATEDOCUMENT = 2375
Constant Long SCI_ADDREFDOCUMENT = 2376
Constant Long SCI_RELEASEDOCUMENT = 2377
Constant Long SCI_GETDOCUMENTOPTIONS = 2379
Constant Long SCI_GETMODEVENTMASK = 2378
Constant Long SCI_SETCOMMANDEVENTS = 2717
Constant Long SCI_GETCOMMANDEVENTS = 2718
Constant Long SCI_SETFOCUS = 2380
Constant Long SCI_GETFOCUS = 2381
Constant Long SC_STATUS_OK = 0
Constant Long SC_STATUS_FAILURE = 1
Constant Long SC_STATUS_BADALLOC = 2
Constant Long SC_STATUS_WARN_START = 1000
Constant Long SC_STATUS_WARN_REGEX = 1001
Constant Long SCI_SETSTATUS = 2382
Constant Long SCI_GETSTATUS = 2383
Constant Long SCI_SETMOUSEDOWNCAPTURES = 2384
Constant Long SCI_GETMOUSEDOWNCAPTURES = 2385
Constant Long SCI_SETMOUSEWHEELCAPTURES = 2696
Constant Long SCI_GETMOUSEWHEELCAPTURES = 2697
Constant Long SCI_SETCURSOR = 2386
Constant Long SCI_GETCURSOR = 2387
Constant Long SCI_SETCONTROLCHARSYMBOL = 2388
Constant Long SCI_GETCONTROLCHARSYMBOL = 2389
Constant Long SCI_WORDPARTLEFT = 2390
Constant Long SCI_WORDPARTLEFTEXTEND = 2391
Constant Long SCI_WORDPARTRIGHT = 2392
Constant Long SCI_WORDPARTRIGHTEXTEND = 2393
Constant Long VISIBLE_SLOP = 1 // 0x01
Constant Long VISIBLE_STRICT = 4 // 0x04
Constant Long SCI_SETVISIBLEPOLICY = 2394
Constant Long SCI_DELLINELEFT = 2395
Constant Long SCI_DELLINERIGHT = 2396
Constant Long SCI_SETXOFFSET = 2397
Constant Long SCI_GETXOFFSET = 2398
Constant Long SCI_CHOOSECARETX = 2399
Constant Long SCI_GRABFOCUS = 2400
Constant Long CARET_SLOP = 1 // 0x01
Constant Long CARET_STRICT = 4 // 0x04
Constant Long CARET_JUMPS = 16 // 0x10
Constant Long CARET_EVEN = 8 // 0x08
Constant Long SCI_SETXCARETPOLICY = 2402
Constant Long SCI_SETYCARETPOLICY = 2403
Constant Long SCI_SETPRINTWRAPMODE = 2406
Constant Long SCI_GETPRINTWRAPMODE = 2407
Constant Long SCI_SETHOTSPOTACTIVEFORE = 2410
Constant Long SCI_GETHOTSPOTACTIVEFORE = 2494
Constant Long SCI_SETHOTSPOTACTIVEBACK = 2411
Constant Long SCI_GETHOTSPOTACTIVEBACK = 2495
Constant Long SCI_SETHOTSPOTACTIVEUNDERLINE = 2412
Constant Long SCI_GETHOTSPOTACTIVEUNDERLINE = 2496
Constant Long SCI_SETHOTSPOTSINGLELINE = 2421
Constant Long SCI_GETHOTSPOTSINGLELINE = 2497
Constant Long SCI_PARADOWN = 2413
Constant Long SCI_PARADOWNEXTEND = 2414
Constant Long SCI_PARAUP = 2415
Constant Long SCI_PARAUPEXTEND = 2416
Constant Long SCI_POSITIONBEFORE = 2417
Constant Long SCI_POSITIONAFTER = 2418
Constant Long SCI_POSITIONRELATIVE = 2670
Constant Long SCI_POSITIONRELATIVECODEUNITS = 2716
Constant Long SCI_COPYRANGE = 2419
Constant Long SCI_COPYTEXT = 2420
Constant Long SC_SEL_STREAM = 0
Constant Long SC_SEL_RECTANGLE = 1
Constant Long SC_SEL_LINES = 2
Constant Long SC_SEL_THIN = 3
Constant Long SCI_SETSELECTIONMODE = 2422
Constant Long SCI_GETSELECTIONMODE = 2423
Constant Long SCI_GETMOVEEXTENDSSELECTION = 2706
Constant Long SCI_GETLINESELSTARTPOSITION = 2424
Constant Long SCI_GETLINESELENDPOSITION = 2425
Constant Long SCI_LINEDOWNRECTEXTEND = 2426
Constant Long SCI_LINEUPRECTEXTEND = 2427
Constant Long SCI_CHARLEFTRECTEXTEND = 2428
Constant Long SCI_CHARRIGHTRECTEXTEND = 2429
Constant Long SCI_HOMERECTEXTEND = 2430
Constant Long SCI_VCHOMERECTEXTEND = 2431
Constant Long SCI_LINEENDRECTEXTEND = 2432
Constant Long SCI_PAGEUPRECTEXTEND = 2433
Constant Long SCI_PAGEDOWNRECTEXTEND = 2434
Constant Long SCI_STUTTEREDPAGEUP = 2435
Constant Long SCI_STUTTEREDPAGEUPEXTEND = 2436
Constant Long SCI_STUTTEREDPAGEDOWN = 2437
Constant Long SCI_STUTTEREDPAGEDOWNEXTEND = 2438
Constant Long SCI_WORDLEFTEND = 2439
Constant Long SCI_WORDLEFTENDEXTEND = 2440
Constant Long SCI_WORDRIGHTEND = 2441
Constant Long SCI_WORDRIGHTENDEXTEND = 2442
Constant Long SCI_SETWHITESPACECHARS = 2443
Constant Long SCI_GETWHITESPACECHARS = 2647
Constant Long SCI_SETPUNCTUATIONCHARS = 2648
Constant Long SCI_GETPUNCTUATIONCHARS = 2649
Constant Long SCI_SETCHARSDEFAULT = 2444
Constant Long SCI_AUTOCGETCURRENT = 2445
Constant Long SCI_AUTOCGETCURRENTTEXT = 2610
Constant Long SC_CASEINSENSITIVEBEHAVIOUR_RESPECTCASE = 0
Constant Long SC_CASEINSENSITIVEBEHAVIOUR_IGNORECASE = 1
Constant Long SCI_AUTOCSETCASEINSENSITIVEBEHAVIOUR = 2634
Constant Long SCI_AUTOCGETCASEINSENSITIVEBEHAVIOUR = 2635
Constant Long SC_MULTIAUTOC_ONCE = 0
Constant Long SC_MULTIAUTOC_EACH = 1
Constant Long SCI_AUTOCSETMULTI = 2636
Constant Long SCI_AUTOCGETMULTI = 2637
Constant Long SC_ORDER_PRESORTED = 0
Constant Long SC_ORDER_PERFORMSORT = 1
Constant Long SC_ORDER_CUSTOM = 2
Constant Long SCI_AUTOCSETORDER = 2660
Constant Long SCI_AUTOCGETORDER = 2661
Constant Long SCI_ALLOCATE = 2446
Constant Long SCI_TARGETASUTF8 = 2447
Constant Long SCI_SETLENGTHFORENCODE = 2448
Constant Long SCI_ENCODEDFROMUTF8 = 2449
Constant Long SCI_FINDCOLUMN = 2456
Constant Long SC_CARETSTICKY_OFF = 0
Constant Long SC_CARETSTICKY_ON = 1
Constant Long SC_CARETSTICKY_WHITESPACE = 2
Constant Long SCI_GETCARETSTICKY = 2457
Constant Long SCI_SETCARETSTICKY = 2458
Constant Long SCI_TOGGLECARETSTICKY = 2459
Constant Long SCI_SETPASTECONVERTENDINGS = 2467
Constant Long SCI_GETPASTECONVERTENDINGS = 2468
Constant Long SCI_REPLACERECTANGULAR = 2771
Constant Long SCI_SELECTIONDUPLICATE = 2469
Constant Long SCI_SETCARETLINEBACKALPHA = 2470
Constant Long SCI_GETCARETLINEBACKALPHA = 2471
Constant Long CARETSTYLE_INVISIBLE = 0
Constant Long CARETSTYLE_LINE = 1
Constant Long CARETSTYLE_BLOCK = 2
Constant Long CARETSTYLE_OVERSTRIKE_BAR = 0
Constant Long CARETSTYLE_OVERSTRIKE_BLOCK = 16 // 0x10
Constant Long CARETSTYLE_INS_MASK = 15 // 0xF
Constant Long CARETSTYLE_BLOCK_AFTER = 256 // 0x100
Constant Long SCI_SETCARETSTYLE = 2512
Constant Long SCI_GETCARETSTYLE = 2513
Constant Long SCI_SETINDICATORCURRENT = 2500
Constant Long SCI_GETINDICATORCURRENT = 2501
Constant Long SCI_SETINDICATORVALUE = 2502
Constant Long SCI_GETINDICATORVALUE = 2503
Constant Long SCI_INDICATORFILLRANGE = 2504
Constant Long SCI_INDICATORCLEARRANGE = 2505
Constant Long SCI_INDICATORALLONFOR = 2506
Constant Long SCI_INDICATORVALUEAT = 2507
Constant Long SCI_INDICATORSTART = 2508
Constant Long SCI_INDICATOREND = 2509
Constant Long SCI_SETPOSITIONCACHE = 2514
Constant Long SCI_GETPOSITIONCACHE = 2515
Constant Long SCI_SETLAYOUTTHREADS = 2775
Constant Long SCI_GETLAYOUTTHREADS = 2776
Constant Long SCI_COPYALLOWLINE = 2519
Constant Long SCI_GETCHARACTERPOINTER = 2520
Constant Long SCI_GETRANGEPOINTER = 2643
Constant Long SCI_GETGAPPOSITION = 2644
Constant Long SCI_INDICSETALPHA = 2523
Constant Long SCI_INDICGETALPHA = 2524
Constant Long SCI_INDICSETOUTLINEALPHA = 2558
Constant Long SCI_INDICGETOUTLINEALPHA = 2559
Constant Long SCI_SETEXTRAASCENT = 2525
Constant Long SCI_GETEXTRAASCENT = 2526
Constant Long SCI_SETEXTRADESCENT = 2527
Constant Long SCI_GETEXTRADESCENT = 2528
Constant Long SCI_MARKERSYMBOLDEFINED = 2529
Constant Long SCI_MARGINSETTEXT = 2530
Constant Long SCI_MARGINGETTEXT = 2531
Constant Long SCI_MARGINSETSTYLE = 2532
Constant Long SCI_MARGINGETSTYLE = 2533
Constant Long SCI_MARGINSETSTYLES = 2534
Constant Long SCI_MARGINGETSTYLES = 2535
Constant Long SCI_MARGINTEXTCLEARALL = 2536
Constant Long SCI_MARGINSETSTYLEOFFSET = 2537
Constant Long SCI_MARGINGETSTYLEOFFSET = 2538
Constant Long SC_MARGINOPTION_NONE = 0
Constant Long SC_MARGINOPTION_SUBLINESELECT = 1
Constant Long SCI_SETMARGINOPTIONS = 2539
Constant Long SCI_GETMARGINOPTIONS = 2557
Constant Long SCI_ANNOTATIONSETTEXT = 2540
Constant Long SCI_ANNOTATIONGETTEXT = 2541
Constant Long SCI_ANNOTATIONSETSTYLE = 2542
Constant Long SCI_ANNOTATIONGETSTYLE = 2543
Constant Long SCI_ANNOTATIONSETSTYLES = 2544
Constant Long SCI_ANNOTATIONGETSTYLES = 2545
Constant Long SCI_ANNOTATIONGETLINES = 2546
Constant Long SCI_ANNOTATIONCLEARALL = 2547
Constant Long ANNOTATION_HIDDEN = 0
Constant Long ANNOTATION_STANDARD = 1
Constant Long ANNOTATION_BOXED = 2
Constant Long ANNOTATION_INDENTED = 3
Constant Long SCI_ANNOTATIONSETVISIBLE = 2548
Constant Long SCI_ANNOTATIONGETVISIBLE = 2549
Constant Long SCI_ANNOTATIONSETSTYLEOFFSET = 2550
Constant Long SCI_ANNOTATIONGETSTYLEOFFSET = 2551
Constant Long SCI_RELEASEALLEXTENDEDSTYLES = 2552
Constant Long SCI_ALLOCATEEXTENDEDSTYLES = 2553
Constant Long UNDO_NONE = 0
Constant Long UNDO_MAY_COALESCE = 1
Constant Long SCI_ADDUNDOACTION = 2560
Constant Long SCI_CHARPOSITIONFROMPOINT = 2561
Constant Long SCI_CHARPOSITIONFROMPOINTCLOSE = 2562
Constant Long SCI_SETMOUSESELECTIONRECTANGULARSWITCH = 2668
Constant Long SCI_GETMOUSESELECTIONRECTANGULARSWITCH = 2669
Constant Long SCI_SETMULTIPLESELECTION = 2563
Constant Long SCI_GETMULTIPLESELECTION = 2564
Constant Long SCI_SETADDITIONALSELECTIONTYPING = 2565
Constant Long SCI_GETADDITIONALSELECTIONTYPING = 2566
Constant Long SCI_SETADDITIONALCARETSBLINK = 2567
Constant Long SCI_GETADDITIONALCARETSBLINK = 2568
Constant Long SCI_SETADDITIONALCARETSVISIBLE = 2608
Constant Long SCI_GETADDITIONALCARETSVISIBLE = 2609
Constant Long SCI_GETSELECTIONS = 2570
Constant Long SCI_GETSELECTIONEMPTY = 2650
Constant Long SCI_CLEARSELECTIONS = 2571
Constant Long SCI_SETSELECTION = 2572
Constant Long SCI_ADDSELECTION = 2573
Constant Long SCI_DROPSELECTIONN = 2671
Constant Long SCI_SETMAINSELECTION = 2574
Constant Long SCI_GETMAINSELECTION = 2575
Constant Long SCI_SETSELECTIONNCARET = 2576
Constant Long SCI_GETSELECTIONNCARET = 2577
Constant Long SCI_SETSELECTIONNANCHOR = 2578
Constant Long SCI_GETSELECTIONNANCHOR = 2579
Constant Long SCI_SETSELECTIONNCARETVIRTUALSPACE = 2580
Constant Long SCI_GETSELECTIONNCARETVIRTUALSPACE = 2581
Constant Long SCI_SETSELECTIONNANCHORVIRTUALSPACE = 2582
Constant Long SCI_GETSELECTIONNANCHORVIRTUALSPACE = 2583
Constant Long SCI_SETSELECTIONNSTART = 2584
Constant Long SCI_GETSELECTIONNSTART = 2585
Constant Long SCI_GETSELECTIONNSTARTVIRTUALSPACE = 2726
Constant Long SCI_SETSELECTIONNEND = 2586
Constant Long SCI_GETSELECTIONNENDVIRTUALSPACE = 2727
Constant Long SCI_GETSELECTIONNEND = 2587
Constant Long SCI_SETRECTANGULARSELECTIONCARET = 2588
Constant Long SCI_GETRECTANGULARSELECTIONCARET = 2589
Constant Long SCI_SETRECTANGULARSELECTIONANCHOR = 2590
Constant Long SCI_GETRECTANGULARSELECTIONANCHOR = 2591
Constant Long SCI_SETRECTANGULARSELECTIONCARETVIRTUALSPACE = 2592
Constant Long SCI_GETRECTANGULARSELECTIONCARETVIRTUALSPACE = 2593
Constant Long SCI_SETRECTANGULARSELECTIONANCHORVIRTUALSPACE = 2594
Constant Long SCI_GETRECTANGULARSELECTIONANCHORVIRTUALSPACE = 2595
Constant Long SCVS_NONE = 0
Constant Long SCVS_RECTANGULARSELECTION = 1
Constant Long SCVS_USERACCESSIBLE = 2
Constant Long SCVS_NOWRAPLINESTART = 4
Constant Long SCI_SETVIRTUALSPACEOPTIONS = 2596
Constant Long SCI_GETVIRTUALSPACEOPTIONS = 2597
Constant Long SCI_SETRECTANGULARSELECTIONMODIFIER = 2598
Constant Long SCI_GETRECTANGULARSELECTIONMODIFIER = 2599
Constant Long SCI_SETADDITIONALSELFORE = 2600
Constant Long SCI_SETADDITIONALSELBACK = 2601
Constant Long SCI_SETADDITIONALSELALPHA = 2602
Constant Long SCI_GETADDITIONALSELALPHA = 2603
Constant Long SCI_SETADDITIONALCARETFORE = 2604
Constant Long SCI_GETADDITIONALCARETFORE = 2605
Constant Long SCI_ROTATESELECTION = 2606
Constant Long SCI_SWAPMAINANCHORCARET = 2607
Constant Long SCI_MULTIPLESELECTADDNEXT = 2688
Constant Long SCI_MULTIPLESELECTADDEACH = 2689
Constant Long SCI_CHANGELEXERSTATE = 2617
Constant Long SCI_CONTRACTEDFOLDNEXT = 2618
Constant Long SCI_VERTICALCENTRECARET = 2619
Constant Long SCI_MOVESELECTEDLINESUP = 2620
Constant Long SCI_MOVESELECTEDLINESDOWN = 2621
Constant Long SCI_SETIDENTIFIER = 2622
Constant Long SCI_GETIDENTIFIER = 2623
Constant Long SCI_RGBAIMAGESETWIDTH = 2624
Constant Long SCI_RGBAIMAGESETHEIGHT = 2625
Constant Long SCI_RGBAIMAGESETSCALE = 2651
Constant Long SCI_MARKERDEFINERGBAIMAGE = 2626
Constant Long SCI_REGISTERRGBAIMAGE = 2627
Constant Long SCI_SCROLLTOSTART = 2628
Constant Long SCI_SCROLLTOEND = 2629
Constant Long SC_TECHNOLOGY_DEFAULT = 0
Constant Long SC_TECHNOLOGY_DIRECTWRITE = 1
Constant Long SC_TECHNOLOGY_DIRECTWRITERETAIN = 2
Constant Long SC_TECHNOLOGY_DIRECTWRITEDC = 3
Constant Long SCI_SETTECHNOLOGY = 2630
Constant Long SCI_GETTECHNOLOGY = 2631
Constant Long SCI_CREATELOADER = 2632
Constant Long SCI_FINDINDICATORSHOW = 2640
Constant Long SCI_FINDINDICATORFLASH = 2641
Constant Long SCI_FINDINDICATORHIDE = 2642
Constant Long SCI_VCHOMEDISPLAY = 2652
Constant Long SCI_VCHOMEDISPLAYEXTEND = 2653
Constant Long SCI_GETCARETLINEVISIBLEALWAYS = 2654
Constant Long SCI_SETCARETLINEVISIBLEALWAYS = 2655
Constant Long SC_LINE_END_TYPE_DEFAULT = 0
Constant Long SC_LINE_END_TYPE_UNICODE = 1
Constant Long SCI_SETLINEENDTYPESALLOWED = 2656
Constant Long SCI_GETLINEENDTYPESALLOWED = 2657
Constant Long SCI_GETLINEENDTYPESACTIVE = 2658
Constant Long SCI_SETREPRESENTATION = 2665
Constant Long SCI_GETREPRESENTATION = 2666
Constant Long SCI_CLEARREPRESENTATION = 2667
Constant Long SCI_CLEARALLREPRESENTATIONS = 2770
Constant Long SC_REPRESENTATION_PLAIN = 0
Constant Long SC_REPRESENTATION_BLOB = 1
Constant Long SC_REPRESENTATION_COLOUR = 16 // 0x10
Constant Long SCI_SETREPRESENTATIONAPPEARANCE = 2766
Constant Long SCI_GETREPRESENTATIONAPPEARANCE = 2767
Constant Long SCI_SETREPRESENTATIONCOLOUR = 2768
Constant Long SCI_GETREPRESENTATIONCOLOUR = 2769
Constant Long SCI_EOLANNOTATIONSETTEXT = 2740
Constant Long SCI_EOLANNOTATIONGETTEXT = 2741
Constant Long SCI_EOLANNOTATIONSETSTYLE = 2742
Constant Long SCI_EOLANNOTATIONGETSTYLE = 2743
Constant Long SCI_EOLANNOTATIONCLEARALL = 2744
Constant Long EOLANNOTATION_HIDDEN = 0 // 0x0
Constant Long EOLANNOTATION_STANDARD = 1 // 0x1
Constant Long EOLANNOTATION_BOXED = 2 // 0x2
Constant Long EOLANNOTATION_STADIUM = 256 // 0x100
Constant Long EOLANNOTATION_FLAT_CIRCLE = 257 // 0x101
Constant Long EOLANNOTATION_ANGLE_CIRCLE = 258 // 0x102
Constant Long EOLANNOTATION_CIRCLE_FLAT = 272 //0x110
Constant Long EOLANNOTATION_FLATS = 273 // 0x111
Constant Long EOLANNOTATION_ANGLE_FLAT = 274 // 0x112
Constant Long EOLANNOTATION_CIRCLE_ANGLE = 288 // 0x120
Constant Long EOLANNOTATION_FLAT_ANGLE = 289 // 0x121
Constant Long EOLANNOTATION_ANGLES = 290 // 0x122
Constant Long SCI_EOLANNOTATIONSETVISIBLE = 2745
Constant Long SCI_EOLANNOTATIONGETVISIBLE = 2746
Constant Long SCI_EOLANNOTATIONSETSTYLEOFFSET = 2747
Constant Long SCI_EOLANNOTATIONGETSTYLEOFFSET = 2748
Constant Long SC_SUPPORTS_LINE_DRAWS_FINAL = 0
Constant Long SC_SUPPORTS_PIXEL_DIVISIONS = 1
Constant Long SC_SUPPORTS_FRACTIONAL_STROKE_WIDTH = 2
Constant Long SC_SUPPORTS_TRANSLUCENT_STROKE = 3
Constant Long SC_SUPPORTS_PIXEL_MODIFICATION = 4
Constant Long SC_SUPPORTS_THREAD_SAFE_MEASURE_WIDTHS = 5
Constant Long SCI_SUPPORTSFEATURE = 2750
Constant Long SC_LINECHARACTERINDEX_NONE = 0
Constant Long SC_LINECHARACTERINDEX_UTF32 = 1
Constant Long SC_LINECHARACTERINDEX_UTF16 = 2
Constant Long SCI_GETLINECHARACTERINDEX = 2710
Constant Long SCI_ALLOCATELINECHARACTERINDEX = 2711
Constant Long SCI_RELEASELINECHARACTERINDEX = 2712
Constant Long SCI_LINEFROMINDEXPOSITION = 2713
Constant Long SCI_INDEXPOSITIONFROMLINE = 2714
Constant Long SCI_STARTRECORD = 3001
Constant Long SCI_STOPRECORD = 3002
Constant Long SCI_GETLEXER = 4002
Constant Long SCI_COLOURISE = 4003
Constant Long SCI_SETPROPERTY = 4004
Constant Long KEYWORDSET_MAX = 8
Constant Long SCI_SETKEYWORDS = 4005
Constant Long SCI_GETPROPERTY = 4008
Constant Long SCI_GETPROPERTYEXPANDED = 4009
Constant Long SCI_GETPROPERTYINT = 4010
Constant Long SCI_GETLEXERLANGUAGE = 4012
Constant Long SCI_PRIVATELEXERCALL = 4013
Constant Long SCI_PROPERTYNAMES = 4014
Constant Long SC_TYPE_BOOLEAN = 0
Constant Long SC_TYPE_INTEGER = 1
Constant Long SC_TYPE_STRING = 2
Constant Long SCI_PROPERTYTYPE = 4015
Constant Long SCI_DESCRIBEPROPERTY = 4016
Constant Long SCI_DESCRIBEKEYWORDSETS = 4017
Constant Long SCI_GETLINEENDTYPESSUPPORTED = 4018
Constant Long SCI_ALLOCATESUBSTYLES = 4020
Constant Long SCI_GETSUBSTYLESSTART = 4021
Constant Long SCI_GETSUBSTYLESLENGTH = 4022
Constant Long SCI_GETSTYLEFROMSUBSTYLE = 4027
Constant Long SCI_GETPRIMARYSTYLEFROMSTYLE = 4028
Constant Long SCI_FREESUBSTYLES = 4023
Constant Long SCI_SETIDENTIFIERS = 4024
Constant Long SCI_DISTANCETOSECONDARYSTYLES = 4025
Constant Long SCI_GETSUBSTYLEBASES = 4026
Constant Long SCI_GETNAMEDSTYLES = 4029
Constant Long SCI_NAMEOFSTYLE = 4030
Constant Long SCI_TAGSOFSTYLE = 4031
Constant Long SCI_DESCRIPTIONOFSTYLE = 4032
Constant Long SCI_SETILEXER = 4033
Constant Long SC_MOD_NONE = 0 // 0x0
Constant Long SC_MOD_INSERTTEXT = 1 // 0x1
Constant Long SC_MOD_DELETETEXT = 2 // 0x2
Constant Long SC_MOD_CHANGESTYLE = 4 // 0x4
Constant Long SC_MOD_CHANGEFOLD = 8 // 0x8
Constant Long SC_PERFORMED_USER = 16 // 0x10
Constant Long SC_PERFORMED_UNDO = 32 // 0x20
Constant Long SC_PERFORMED_REDO = 64 // 0x40
Constant Long SC_MULTISTEPUNDOREDO = 128 // 0x80
Constant Long SC_LASTSTEPINUNDOREDO = 256 // 0x100
Constant Long SC_MOD_CHANGEMARKER = 512 // 0x200
Constant Long SC_MOD_BEFOREINSERT = 1024 // 0x400
Constant Long SC_MOD_BEFOREDELETE = 2048 // 0x800
Constant Long SC_MULTILINEUNDOREDO = 4096 // 0x1000
Constant Long SC_STARTACTION = 8192 // 0x2000
Constant Long SC_MOD_CHANGEINDICATOR = 16384 // 0x4000
Constant Long SC_MOD_CHANGELINESTATE = 32768 // 0x8000
Constant Long SC_MOD_CHANGEMARGIN = 65536 // 0x10000
Constant Long SC_MOD_CHANGEANNOTATION = 131072 // 0x20000
Constant Long SC_MOD_CONTAINER = 262144 // 0x40000
Constant Long SC_MOD_LEXERSTATE = 524288 // 0x80000
Constant Long SC_MOD_INSERTCHECK = 1048576 // 0x100000
Constant Long SC_MOD_CHANGETABSTOPS = 2097152 // 0x200000
Constant Long SC_MOD_CHANGEEOLANNOTATION = 4194304 // 0x400000
Constant Long SC_MODEVENTMASKALL = 1048575 // 0x7FFFFF
Constant Long SC_UPDATE_NONE = 0 // 0x0
Constant Long SC_UPDATE_CONTENT = 1 // 0x1
Constant Long SC_UPDATE_SELECTION = 2 // 0x2
Constant Long SC_UPDATE_V_SCROLL = 4 // 0x4
Constant Long SC_UPDATE_H_SCROLL = 8 // 0x8
Constant Long SCEN_CHANGE = 768
Constant Long SCEN_SETFOCUS = 512
Constant Long SCEN_KILLFOCUS = 256
Constant Long SCK_DOWN = 300
Constant Long SCK_UP = 301
Constant Long SCK_LEFT = 302
Constant Long SCK_RIGHT = 303
Constant Long SCK_HOME = 304
Constant Long SCK_END = 305
Constant Long SCK_PRIOR = 306
Constant Long SCK_NEXT = 307
Constant Long SCK_DELETE = 308
Constant Long SCK_INSERT = 309
Constant Long SCK_ESCAPE = 7
Constant Long SCK_BACK = 8
Constant Long SCK_TAB = 9
Constant Long SCK_RETURN = 13
Constant Long SCK_ADD = 310
Constant Long SCK_SUBTRACT = 311
Constant Long SCK_DIVIDE = 312
Constant Long SCK_WIN = 313
Constant Long SCK_RWIN = 314
Constant Long SCK_MENU = 315
Constant Long SCMOD_NORM = 0
Constant Long SCMOD_SHIFT = 1
Constant Long SCMOD_CTRL = 2
Constant Long SCMOD_ALT = 4
Constant Long SCMOD_SUPER = 8
Constant Long SCMOD_META = 16
Constant Long SC_AC_FILLUP = 1
Constant Long SC_AC_DOUBLECLICK = 2
Constant Long SC_AC_TAB = 3
Constant Long SC_AC_NEWLINE = 4
Constant Long SC_AC_COMMAND = 5
Constant Long SC_CHARACTERSOURCE_DIRECT_INPUT = 0
Constant Long SC_CHARACTERSOURCE_TENTATIVE_INPUT = 1
Constant Long SC_CHARACTERSOURCE_IME_RESULT = 2
Constant Long SCN_STYLENEEDED = 2000
Constant Long SCN_CHARADDED = 2001
Constant Long SCN_SAVEPOINTREACHED = 2002
Constant Long SCN_SAVEPOINTLEFT = 2003
Constant Long SCN_MODIFYATTEMPTRO = 2004
Constant Long SCN_KEY = 2005
Constant Long SCN_DOUBLECLICK = 2006
Constant Long SCN_UPDATEUI = 2007
Constant Long SCN_MODIFIED = 2008
Constant Long SCN_MACRORECORD = 2009
Constant Long SCN_MARGINCLICK = 2010
Constant Long SCN_NEEDSHOWN = 2011
Constant Long SCN_PAINTED = 2013
Constant Long SCN_USERLISTSELECTION = 2014
Constant Long SCN_URIDROPPED = 2015
Constant Long SCN_DWELLSTART = 2016
Constant Long SCN_DWELLEND = 2017
Constant Long SCN_ZOOM = 2018
Constant Long SCN_HOTSPOTCLICK = 2019
Constant Long SCN_HOTSPOTDOUBLECLICK = 2020
Constant Long SCN_CALLTIPCLICK = 2021
Constant Long SCN_AUTOCSELECTION = 2022
Constant Long SCN_INDICATORCLICK = 2023
Constant Long SCN_INDICATORRELEASE = 2024
Constant Long SCN_AUTOCCANCELLED = 2025
Constant Long SCN_AUTOCCHARDELETED = 2026
Constant Long SCN_HOTSPOTRELEASECLICK = 2027
Constant Long SCN_FOCUSIN = 2028
Constant Long SCN_FOCUSOUT = 2029
Constant Long SCN_AUTOCCOMPLETED = 2030
Constant Long SCN_MARGINRIGHTCLICK = 2031
Constant Long SCN_AUTOCSELECTIONCHANGE = 2032
Constant Long SC_BIDIRECTIONAL_DISABLED = 0
Constant Long SC_BIDIRECTIONAL_L2R = 1
Constant Long SC_BIDIRECTIONAL_R2L = 2
Constant Long SCI_GETBIDIRECTIONAL = 2708
Constant Long SCI_SETBIDIRECTIONAL = 2709

end variables

forward prototypes
public function long of_sendeditor (unsignedlong imessage)
public function long of_sendeditor (unsignedlong imessage, boolean wparam)
public function long of_sendeditor (unsignedlong imessage, longptr wparam)
public function long of_sendeditor (unsignedlong imessage, longptr wparam, longptr lparam)
public function long of_sendeditor (unsignedlong imessage, longptr wparam, ref string lparam)
public function long of_sendeditor (unsignedlong imessage, string wparam, string lparam)
public subroutine of_setencoding (encoding aencoding)
public subroutine of_setfont (string as_font)
public subroutine of_setfontsize (long al_size)
public subroutine of_settext (string as_text)
public subroutine of_setwordwrap (boolean ab_wordwrap)
public subroutine of_setscrollwidthtracking (boolean ab_scrollwidth)
public subroutine of_showindentguides (boolean ab_show)
public function long of_getselectedlength ()
public subroutine of_indentselected ()
public subroutine of_selecttext (long al_start, long al_length)
public subroutine of_unindentselected ()
public subroutine of_gotoprevtab ()
public function string of_stringptr (longptr textptr, charset textcharset)
public subroutine of_setreadonly (boolean ab_readonly)
public subroutine of_showlinenumbers (boolean ab_show)
public subroutine of_settabwidth (long al_width)
public subroutine of_set_nolanguage ()
public subroutine of_setmarginbackcolor (long al_color)
public subroutine of_setmargintextcolor (long al_color)
public function long of_color (string as_colorname)
public subroutine of_setfoldbackcolor (long al_color)
public subroutine of_setfoldforecolor (long al_color)
public subroutine of_setbackcolor (long al_color)
public subroutine of_settextcolor (long al_color)
public subroutine of_setstylefore (long al_style, long al_color)
public subroutine of_setstyleback (long al_style, long al_color)
public subroutine of_setselectcolor (long al_color)
public subroutine of_setcaretcolor (long al_color)
public subroutine of_setcaretlinecolor (long al_color)
public function string of_getlanguage ()
public function long of_sendeditorlen (unsignedlong imessage, ref string as_parm2)
public subroutine of_addtext (string as_text)
public subroutine of_appendtext (ref string as_text)
public function boolean of_autocactive ()
public subroutine of_autoccancel ()
public subroutine of_autoccomplete ()
public function long of_autocposstart ()
public subroutine of_autocsetautohide (boolean ab_option)
public subroutine of_autocsetfillups (string as_list)
public subroutine of_autocsetignorecase (boolean ab_ignorecase)
public subroutine of_autocsetmaxheight (long al_rowcount)
public subroutine of_autocsetmaxwidth (long al_charcount)
public subroutine of_autocsetorder (long al_order)
public subroutine of_autocsetseparator (character ac_separator)
public subroutine of_autocsettypeseparator (character ac_separator)
public subroutine of_autocshow (long al_entered, ref string as_list)
public subroutine of_autocstops (string as_list)
public function boolean of_cancopy ()
public function boolean of_canpaste ()
public function boolean of_canredo ()
public function boolean of_canundo ()
public subroutine of_changecase (textcase a_case)
public function string of_getselectedtext ()
public subroutine of_replaceselectedtext (ref string as_text)
public subroutine of_clear ()
public subroutine of_cleardocumentstyle ()
public subroutine of_clearregisteredimages ()
public subroutine of_commentselected ()
public subroutine of_converteols (long al_eolmode)
public subroutine of_copy ()
public subroutine of_cut ()
public subroutine of_delete ()
public subroutine of_deleteline (long al_line)
public subroutine of_emptyclipboard ()
public subroutine of_enablefolding ()
public function boolean of_find (ref string as_findstring)
public function boolean of_iscommented (long al_pos)
public subroutine of_gotopos (long al_pos)
public function long of_getcurrentcolumn ()
public function long of_getcurrentline ()
public function long of_getcurrentpos ()
public subroutine of_setfirstvisibleline (long al_line)
public function long of_findall (ref string as_findstring)
public function long of_markeradd (long al_index, long al_line)
public function long of_markeradd (long al_type, long al_line, long al_color)
public function long of_geteolmode ()
public function string of_getkeywords (long al_keyset, string as_language)
public function long of_getlinecount ()
public function long of_getlinefrompos (long al_caretpos)
public function string of_getlinetextfrompos (long al_caretpos)
public function long of_getposfromline (long al_line)
public function boolean of_getreadonly ()
public function long of_getstyleat (long al_pos)
public subroutine of_getstylecharset (long al_style, ref long al_charsetnbr, ref string as_charsetdesc)
public function long of_getsyscolor (long al_index)
public function long of_gettabwidth ()
public function string of_gettext ()
public function long of_gettextheight (long al_line)
public function long of_gettextlength ()
public function long of_gettextwidth (long al_stylenumber, ref string as_text)
public function long of_getviewws ()
public function long of_getwhitespace ()
public function long of_getwrapmode ()
public function long of_getwrapvisualflags ()
public function long of_getzoomlevel ()
public subroutine of_gotoline (long al_line)
public subroutine of_inserttext (ref string as_text)
public function boolean of_ismodified ()
public function boolean of_isovertype ()
public subroutine of_lefttrimselected ()
public subroutine of_macrorecording (boolean ab_record)
public function boolean of_markeractive (long al_linenumber)
public subroutine of_markercolor (long al_index, long al_forecolor, long al_backcolor)
public subroutine of_markerdefine (long al_index, long al_type, long al_color)
public subroutine of_markerdelete (long al_index, long al_linenumber)
public subroutine of_markerdelete (long al_linenumber)
public subroutine of_markerdeleteall ()
public function long of_markernext (long al_linenumber)
public function long of_markerprev (long al_linenumber)
public subroutine of_paste ()
public subroutine of_print (boolean ab_showdialog)
public subroutine of_redo ()
public subroutine of_registerimage (long al_index, ref string as_xpmdata)
public subroutine of_registerrgbaimage (long al_index, ref blob ablb_pixels, long al_width, long al_height)
public function long of_replaceall (ref string as_findstring, ref string as_replacestring)
public subroutine of_righttrimselected ()
public subroutine of_selectall ()
public subroutine of_setcaretlineback (boolean ab_visible)
public subroutine of_setcharacterset (long al_charset)
public subroutine of_setstylecharset (long al_style, long al_charset)
public subroutine of_setdwelltime (long al_dwelldelay)
public subroutine of_setedgecolor (long al_color)
public subroutine of_setedgecolumn (long al_column)
public subroutine of_setedgemode (long al_mode)
public subroutine of_seteolmode (long al_eolmode)
public subroutine of_setfindoptions (boolean ab_matchcase, boolean ab_wholeword, boolean ab_wordstart, boolean ab_regex, boolean ab_backwards, boolean ab_ignorecomment)
public subroutine of_setfontbold (boolean ab_bold)
public subroutine of_setfontitalic (boolean ab_italic)
public subroutine of_setkeywords (long al_wordset, ref string as_keywords)
public subroutine of_setmarginwidth (long al_margin, long al_width)
public subroutine of_setnotmodified ()
public subroutine of_setovertype (boolean ab_overtype)
public subroutine of_setproperty (string as_keyword, string as_value)
public subroutine of_setseparator (character ac_separator)
public subroutine of_setstylebold (long al_style, boolean ab_option)
public subroutine of_setstyleeolfilled (long al_style, boolean ab_option)
public subroutine of_setstylefont (long al_style, string as_font)
public subroutine of_setstyleitalic (long al_style, boolean ab_option)
public subroutine of_setstylesize (long al_style, long al_size)
public subroutine of_setstyleunderline (long al_style, boolean ab_option)
public subroutine of_setusepopup (boolean ab_usepopup)
public subroutine of_setviewws (long al_wsmode)
public subroutine of_setwhitespaceback (boolean ab_option, long al_color)
public subroutine of_setwhitespacefore (boolean ab_option, long al_color)
public subroutine of_setwrapmode (long al_wrapmode)
public subroutine of_setwrapvisualflags (long al_wrapvisualflags)
public subroutine of_showeol (boolean ab_show)
public subroutine of_showwhitespace (boolean ab_show)
public function boolean of_sortarray (ref string as_array[], string as_order)
public subroutine of_sortselected (string as_order)
public function long of_split (string as_text, string as_sep, ref string as_array[])
public subroutine of_uncommentselected ()
public subroutine of_undo ()
public subroutine of_userlistshow (long al_listtype, ref string as_list)
public subroutine of_wordcap ()
public subroutine of_zoomin ()
public subroutine of_zoomlevel (long al_level)
public subroutine of_zoomout ()
public function boolean of_setlanguage (string as_language)
public function boolean of_set_json ()
public function boolean of_set_powerbuilder ()
public function boolean of_set_powershell ()
public function boolean of_set_sql ()
public function boolean of_set_xml ()
public function encoding of_getencoding (readonly blob ablb_contents)
public function blob of_getcontents ()
public function long of_sendeditor (unsignedlong imessage, longptr wparam, ref blob lparam)
end prototypes

event editchanged;// editchanged

end event

event getfocus;// getfocus

end event

event losefocus;// losefocus

Long caretPos
String ls_tab = "~t"

If KeyDown(KeyTab!) Then
	If of_GetSelectedLength() > 0 Then
		If KeyDown(KeyShift!) Then
			// unindent selected lines
			of_UnindentSelected()
		Else
			// indent selected lines
			of_IndentSelected()
		End If
	Else
		If KeyDown(KeyShift!) Then
			// move caret back by tab width
			of_GotoPrevTab()
		Else
			// insert a tab and move caret ahead one
			caretPos = of_SendEditor(SCI_GETCURRENTPOS)
			of_SendEditor(SCI_INSERTTEXT, caretPos, ls_tab)
			of_SendEditor(SCI_GOTOPOS, caretPos + 1)
		End If
	End If
	this.SetFocus()
End If

end event

event ue_setlanguagecolors();// Set text colors other than the default

end event

event wm_char;// Windows wm_char event
Character TAB = "~t"

// discard extra TAB characters
If key = TAB Then
	Return 1
End If

Return 0

end event

event wm_notify;scNotification scn
String ls_text
Char lc_char
Long ll_startPos, ll_lineNumber

// copy structure to local
If ie_env.ProcessBitness = 32 Then
	CopyNotification(scn, lparam, 100)
Else
	CopyNotification(scn, lparam, 160)
End If

// process notification messages
Choose Case scn.code
	Case SCN_AUTOCCANCELLED
		this.Event scn_autoccancelled()
	Case SCN_AUTOCCHARDELETED
		this.Event scn_autocchardeleted()
	Case SCN_AUTOCCOMPLETED
		ls_text = of_StringPtr(scn.text, CharsetAnsi!)
		lc_char = Char(scn.ch)
		this.Event scn_autoccompleted(scn.position, ls_text, lc_char, scn.listCompletionMethod)
	Case SCN_AUTOCSELECTION
		ls_text = of_StringPtr(scn.text, CharsetAnsi!)
		lc_char = Char(scn.ch)
		this.Event scn_autocselection(scn.position, ls_text, lc_char, scn.listCompletionMethod)
	Case SCN_CALLTIPCLICK
		this.Event scn_calltipclick(scn.position)
	Case SCN_CHARADDED
		lc_char = Char(scn.ch)
		this.Event scn_charadded(lc_char)
	Case SCN_DOUBLECLICK
		this.Event scn_doubleclick(scn.position, scn.line)
	Case SCN_DWELLSTART
		this.Event scn_dwellstart(scn.position, scn.x, scn.y)
	Case SCN_DWELLEND
		this.Event scn_dwellend(scn.position, scn.x, scn.y)
	Case SCN_FOCUSIN
		this.Event scn_focusin()
	Case SCN_FOCUSOUT
		this.Event scn_focusout()
	Case SCN_HOTSPOTCLICK
		this.Event scn_hotspotclick(scn.position, scn.modifiers)
	Case SCN_HOTSPOTDOUBLECLICK
		this.Event scn_hotspotdoubleclick(scn.position, scn.modifiers)
	Case SCN_HOTSPOTRELEASECLICK
		this.Event scn_hotspotreleaseclick(scn.position, scn.modifiers)
	Case SCN_INDICATORCLICK
		this.Event scn_indicatorclick(scn.position, scn.modifiers)
	Case SCN_INDICATORRELEASE
		this.Event scn_indicatorrelease(scn.position, scn.modifiers)
	Case SCN_MACRORECORD
		this.Event scn_macrorecord(scn.message, scn.wparam, scn.lparam)
	Case SCN_MARGINCLICK
		this.Event scn_marginclick(scn.modifiers, scn.position, scn.margin)
	Case SCN_MARGINRIGHTCLICK
		this.Event scn_marginrightclick(scn.modifiers, scn.position, scn.margin)
	Case SCN_MODIFIED
		this.Event scn_modified(scn)
	Case SCN_MODIFYATTEMPTRO
		this.Event scn_modifyattemptro()
	Case SCN_NEEDSHOWN
		this.Event scn_needshown(scn.position, scn.length)
	Case SCN_PAINTED
		this.Event scn_painted()
	Case SCN_SAVEPOINTREACHED
		this.Event scn_savepoint(True)
	Case SCN_SAVEPOINTLEFT
		this.Event scn_savepoint(False)
	Case SCN_STYLENEEDED
		ll_startPos = of_SendEditor(SCI_GETENDSTYLED)
		ll_lineNumber = of_SendEditor(SCI_LINEFROMPOSITION, ll_startPos)
		ll_startPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_lineNumber)
		this.Event scn_styleneeded(ll_startPos, scn.position)
	Case SCN_UPDATEUI
		this.Event scn_updateui()
	Case SCN_USERLISTSELECTION
		ls_text = of_StringPtr(scn.text, CharsetAnsi!)
		lc_char = Char(scn.ch)
		this.Event scn_userlistselection(scn.listType, ls_text, scn.position, lc_char, scn.listCompletionMethod)
	Case SCN_ZOOM
		this.Event scn_zoom()
End Choose

Return 0

end event

event scn_autoccancelled();// autocompletion list cancelled

end event

event scn_autocchardeleted();// character deleted while autocompletion list was active

end event

event scn_autoccompleted(long startposition, string selectedtext, character ch, long listcompletionmethod);// autocompletion text has been inserted

end event

event scn_autocselection(long startposition, string selectedtext, character ch, long listcompletionmethod);// autocompletion list item selected

end event

event scn_calltipclick(longptr position);// call tip clicked on

end event

event scn_charadded(character ch);// user typed a regular character

end event

event scn_doubleclick(longptr position, longptr line);// user double clicked

end event

event scn_dwellend(longptr position, long xpos, long ypos);// mouse dwell end

end event

event scn_dwellstart(longptr position, long xpos, long ypos);// mouse dwell start

end event

event scn_focusin();// focus received

end event

event scn_focusout();// focus lost

end event

event scn_hotspotclick(longptr position, long modifiers);// hot spot clicked

end event

event scn_hotspotdoubleclick(longptr position, long modifiers);// hot spot double clicked

end event

event scn_hotspotreleaseclick(longptr position, long modifiers);// hot spot release clicked

end event

event scn_indicatorclick(longptr position, long modifiers);// indicator clicked

end event

event scn_indicatorrelease(longptr position, long modifiers);// indicator released

end event

event scn_macrorecord(long msg, longptr wparam, longptr lparam);// macro recordable event occurred

end event

event scn_marginclick(long modifiers, longptr position, long margin);// A margin set as sensitive was left clicked

Long ll_line

ll_line = of_SendEditor(SCI_LINEFROMPOSITION, position, 0)

choose case margin
	case MARGIN_SCRIPT_FOLD_INDEX
		// toggle folding on the line
		of_SendEditor(SCI_TOGGLEFOLD, ll_line, 0)
end choose

end event

event scn_marginrightclick(long modifiers, longptr position, long margin);// A margin set as sensitive was right clicked

end event

event scn_modified(scnotification scn);// This notification is sent when the text or styling of the
// document changes or is about to change. 

end event

event scn_modifyattemptro();// user attempted to change text while in readonly mode

end event

event scn_needshown(longptr position, longptr length);// a currently invisible range should be made visible

end event

event scn_painted();// painting has just been done

end event

event scn_savepoint(boolean reached);// savepoint reached or left

end event

event scn_styleneeded(long linestart, longptr position);// styling is needed

end event

event scn_updateui();// update user interface

end event

event scn_userlistselection(unsignedlong listtype, string selectedtext, long startposition, character ch, long listcompletionmethod);// user list selection

end event

event scn_zoom();// the zoom level changed

end event

public function long of_sendeditor (unsignedlong imessage);// -----------------------------------------------------------------------------
// SCRIPT:     of_SendEditor
//
// PURPOSE:    This function sends a message to the control
//
// ARGUMENTS:  iMessage	- Message number
//
// RETURN:		Value returned from message
// -----------------------------------------------------------------------------

Return SciSend(ip_hSciWnd, iMessage, 0, 0)

end function

public function long of_sendeditor (unsignedlong imessage, boolean wparam);// -----------------------------------------------------------------------------
// SCRIPT:     of_SendEditor
//
// PURPOSE:    This function sends a message to the control
//
// ARGUMENTS:  iMessage	- Message number
//					wParam	- Message argument #1
//
// RETURN:		Value returned from message
// -----------------------------------------------------------------------------

If wParam Then
	Return SciSend(ip_hSciWnd, iMessage, 1, 0)
Else
	Return SciSend(ip_hSciWnd, iMessage, 0, 0)
End If

end function

public function long of_sendeditor (unsignedlong imessage, longptr wparam);// -----------------------------------------------------------------------------
// SCRIPT:     of_SendEditor
//
// PURPOSE:    This function sends a message to the control
//
// ARGUMENTS:  iMessage	- Message number
//					wParam	- Message argument #1
//
// RETURN:		Value returned from message
// -----------------------------------------------------------------------------

Return SciSend(ip_hSciWnd, iMessage, wParam, 0)

end function

public function long of_sendeditor (unsignedlong imessage, longptr wparam, longptr lparam);// -----------------------------------------------------------------------------
// SCRIPT:     of_SendEditor
//
// PURPOSE:    This function sends a message to the control
//
// ARGUMENTS:  iMessage	- Message number
//					wParam	- Message argument #1
//					lParam	- Message argument #2
//
// RETURN:		Value returned from message
// -----------------------------------------------------------------------------

Return SciSend(ip_hSciWnd, iMessage, wParam, lParam)

end function

public function long of_sendeditor (unsignedlong imessage, longptr wparam, ref string lparam);// -----------------------------------------------------------------------------
// SCRIPT:     of_SendEditor
//
// PURPOSE:    This function sends a message to the control
//
// ARGUMENTS:  iMessage	- Message number
//					wParam	- Message argument #1
//					lParam	- Message argument #2
//
// RETURN:		Value returned from message
// -----------------------------------------------------------------------------

Return SciSend(ip_hSciWnd, iMessage, wParam, lParam)

end function

public function long of_sendeditor (unsignedlong imessage, string wparam, string lparam);// -----------------------------------------------------------------------------
// SCRIPT:     of_SendEditor
//
// PURPOSE:    This function sends a message to the control
//
// ARGUMENTS:  iMessage	- Message number
//					wParam	- Message argument #1
//					lParam	- Message argument #2
//
// RETURN:		Value returned from message
// -----------------------------------------------------------------------------

Blob lblob_parm1, lblob_parm2

If #Encoding = EncodingAnsi! Then
	Return SciSend(ip_hSciWnd, iMessage, wParam, lParam)
Else
	lblob_parm1 = Blob(wParam, EncodingUTF8!)
	lblob_parm2 = Blob(lParam, EncodingUTF8!)
	Return SciSend(ip_hSciWnd, iMessage, lblob_parm1, lblob_parm2)
End If

end function

public subroutine of_setencoding (encoding aencoding);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetEncoding
//
// PURPOSE:    This function will set the text encoding style and set the
//					Unicode codepage on or off as appropriate.
//
// ARGUMENTS:  aEncoding	EncodingAnsi!
//									EncodingUTF8!
//									EncodingUTF16BE!
//									EncodingUTF16LE!
//
// RETURN:		None
// -----------------------------------------------------------------------------

// save the encoding style
#Encoding = aEncoding

end subroutine

public subroutine of_setfont (string as_font);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetFont
//
// PURPOSE:    This function will change the text font
//
// ARGUMENTS:  as_font	- The name of the font
//
// RETURN:		None
// -----------------------------------------------------------------------------

#FontName = as_font

of_SendEditor(SCI_STYLESETFONT, STYLE_DEFAULT, as_font)

end subroutine

public subroutine of_setfontsize (long al_size);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetFontSize
//
// PURPOSE:    This function will change the font size
//
// ARGUMENTS:  al_size	- The font size
//
// RETURN:		None
// -----------------------------------------------------------------------------

#TextSize = al_size

of_SendEditor(SCI_STYLESETSIZE, STYLE_DEFAULT, al_size)

end subroutine

public subroutine of_settext (string as_text);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetText
//
// PURPOSE:    This function will import text into the control
//
// ARGUMENTS:  as_text - The text to be imported
//
// RETURN:		None
// -----------------------------------------------------------------------------

Blob lblb_source
Long ll_length

lblb_source = Blob(as_text, EncodingUTF8!)
ll_length = Len(lblb_source)

of_SendEditor(SCI_TARGETWHOLEDOCUMENT)

of_SendEditor(SCI_REPLACETARGET, ll_length, lblb_source)

end subroutine

public subroutine of_setwordwrap (boolean ab_wordwrap);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetWordWrap
//
// PURPOSE:    This function will toggle word wrap on/off
//
// ARGUMENTS:  ab_wordwrap	- True=word wrap on, False=word wrap off
//
// RETURN:		None
// -----------------------------------------------------------------------------

#WordWrap = ab_wordwrap

If #WordWrap Then
	of_SendEditor(SCI_SETWRAPMODE, SC_WRAP_WORD)
Else
	of_SendEditor(SCI_SETWRAPMODE, SC_WRAP_NONE)
End If

end subroutine

public subroutine of_setscrollwidthtracking (boolean ab_scrollwidth);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetScrollWidthTracking
//
// PURPOSE:    This function will toggle scroll width tracking on/off
//
// ARGUMENTS:  ab_scrollwidth	- True=On, False=Off
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETSCROLLWIDTHTRACKING, ab_scrollwidth)

end subroutine

public subroutine of_showindentguides (boolean ab_show);// -----------------------------------------------------------------------------
// SCRIPT:     of_ShowIndentGuides
//
// PURPOSE:    This function will toggle indent guides on/off
//
// ARGUMENTS:  ab_show	- True=Show guides, False=Do not show them
//
// RETURN:		None
// -----------------------------------------------------------------------------

#IndentGuides = ab_show

If #IndentGuides Then
	of_SendEditor(SCI_SETINDENTATIONGUIDES, 1)
Else
	of_SendEditor(SCI_SETINDENTATIONGUIDES, 0)
End If

end subroutine

public function long of_getselectedlength ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetSelectedLength
//
// PURPOSE:    This function returns the length of the selected text
//
// RETURN:		The length
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETSELECTIONEND) - of_SendEditor(SCI_GETSELECTIONSTART)

end function

public subroutine of_indentselected ();// -----------------------------------------------------------------------------
// SCRIPT:     of_IndentSelected
//
// PURPOSE:    This function adds tab characters to selected lines.
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long caretPos, ll_start, ll_end, ll_line
Long ll_selstart, ll_selend, ll_length
String ls_tab = "~t"

// get first selected line
ll_selstart = of_SendEditor(SCI_GETSELECTIONSTART)
ll_start    = of_SendEditor(SCI_LINEFROMPOSITION, ll_selstart)

// get last selected line
ll_selend = of_SendEditor(SCI_GETSELECTIONEND)
ll_end    = of_SendEditor(SCI_LINEFROMPOSITION, ll_selend)

ll_length = ll_selend - ll_selstart

// if end of selection is start of the line, end on prior line
If ll_selend = of_SendEditor(SCI_POSITIONFROMLINE, ll_end) Then
	ll_end = ll_end - 1
	ll_length = ll_length - 1
End If

of_SendEditor(SCI_BEGINUNDOACTION)

// insert comment characters
For ll_line = ll_start To ll_end
	caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_line)
	of_SendEditor(SCI_INSERTTEXT, caretPos, ls_tab)
	ll_length = ll_length + 1
Next

of_SendEditor(SCI_ENDUNDOACTION)

// reselect the text
of_SelectText(ll_selstart, ll_length)

end subroutine

public subroutine of_selecttext (long al_start, long al_length);// -----------------------------------------------------------------------------
// SCRIPT:     of_SelectText
//
// PURPOSE:    This function will select text within a range
//
// ARGUMENTS:  al_start		- The starting position
//					al_length	- The length of the selected text
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETSELECTIONSTART, al_start)

of_SendEditor(SCI_SETSELECTIONEND, al_start + al_length)

end subroutine

public subroutine of_unindentselected ();// -----------------------------------------------------------------------------
// SCRIPT:     of_UnindentSelected
//
// PURPOSE:    This function removes tab characters to selected lines.
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long caretPos, ll_start, ll_end, ll_line, ll_len
Long ll_selstart, ll_selend, ll_length
String ls_tab = "~t", ls_text, ls_replace

// get first selected line
ll_selstart = of_SendEditor(SCI_GETSELECTIONSTART)
ll_start    = of_SendEditor(SCI_LINEFROMPOSITION, ll_selstart)

// get last selected line
ll_selend = of_SendEditor(SCI_GETSELECTIONEND)
ll_end    = of_SendEditor(SCI_LINEFROMPOSITION, ll_selend)

ll_length = ll_selend - ll_selstart

// if end of selection is start of the line, end on prior line
If ll_selend = of_SendEditor(SCI_POSITIONFROMLINE, ll_end) Then
	ll_end = ll_end - 1
	ll_length = ll_length - 1
End If

of_SendEditor(SCI_BEGINUNDOACTION)

// remove comment characters
For ll_line = ll_start To ll_end
	ll_len = of_SendEditor(SCI_LINELENGTH, ll_line)
	// get line text
	ls_text = Space(ll_len)
	of_SendEditor(SCI_GETLINE, ll_line, ls_text)
	If Left(ls_text, 1) = ls_tab Then
		caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_line)
		of_SendEditor(SCI_SETTARGETSTART, caretPos)
		of_SendEditor(SCI_SETTARGETEND,   caretPos + 1)
		of_SendEditor(SCI_REPLACETARGET, 0, ls_replace)
		ll_length = ll_length - 1
	End If
Next

of_SendEditor(SCI_ENDUNDOACTION)

// reselect the text
of_SelectText(ll_selstart, ll_length)

end subroutine

public subroutine of_gotoprevtab ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GotoPrevTab
//
// PURPOSE:    This function will move the caret to the previous tab location.
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long caretPos, ll_line, ll_column, ll_tabwidth
Long ll_newcol, ll_newpos

caretPos  = of_SendEditor(SCI_GETCURRENTPOS)

ll_line   = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

ll_column = of_SendEditor(SCI_GETCOLUMN, caretPos)

ll_tabwidth = of_SendEditor(SCI_GETTABWIDTH)

ll_newcol = Long((ll_column / ll_tabwidth) + .5) * ll_tabwidth

ll_newpos = of_SendEditor(SCI_FINDCOLUMN, ll_line, ll_newcol - ll_tabwidth)

of_SendEditor(SCI_GOTOPOS, ll_newpos)

end subroutine

public function string of_stringptr (longptr textptr, charset textcharset);// -----------------------------------------------------------------------------
// SCRIPT:     of_StringPtr
//
// PURPOSE:    This function returns a string from an memory address.
//
// ARGUMENTS:  textptr		- Pointer to a string
//					textcharset	- CharsetAnsi! or CharsetUnicode!
//
// RETURN:		None
// -----------------------------------------------------------------------------

Blob lblob_text
String ls_text

choose case textcharset
	case CharsetAnsi!
		lblob_text = Blob(Space(MAX_PATH), EncodingAnsi!)
		CopyMemory(lblob_text, textptr, MAX_PATH)
		ls_text = String(lblob_text, EncodingAnsi!)
	case else
		ls_text = String(lblob_text, "address")
end choose

Return ls_text

end function

public subroutine of_setreadonly (boolean ab_readonly);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetReadOnly
//
// PURPOSE:    This function will toggle read only on/off
//
// ARGUMENTS:  ab_readonly	- True=Read Only, False=Not Read Only
//
// RETURN:		None
// -----------------------------------------------------------------------------

#ReadOnly = ab_readonly

If #ReadOnly Then
	of_SendEditor(SCI_SETREADONLY, 1)
Else
	of_SendEditor(SCI_SETREADONLY, 0)
End If

end subroutine

public subroutine of_showlinenumbers (boolean ab_show);// -----------------------------------------------------------------------------
// SCRIPT:     of_ShowLineNumbers
//
// PURPOSE:    This function will toggle line numbers on/off
//
// ARGUMENTS:  ab_show	- True=Show line numbers, False=Do not show them
//
// RETURN:		None
// -----------------------------------------------------------------------------

#ShowNumbers = ab_show

If #ShowNumbers Then
	of_SendEditor(SCI_SETMARGINWIDTHN, 0, 55)
Else
	of_SendEditor(SCI_SETMARGINWIDTHN, 0, 0)
End If

end subroutine

public subroutine of_settabwidth (long al_width);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetTabWidth
//
// PURPOSE:    This function will change the tab spacing
//
// ARGUMENTS:  al_width	- The number of characters the tab represents
//
// RETURN:		None
// -----------------------------------------------------------------------------

#TabWidth = al_width

of_SendEditor(SCI_SETTABWIDTH, al_width)

end subroutine

public subroutine of_set_nolanguage ();//// -----------------------------------------------------------------------------
//// SCRIPT:     of_Set_NoLanguage
////
//// PURPOSE:    This function will reset the language and colors.
////
//// RETURN:		None
//// -----------------------------------------------------------------------------
//
//this.SetRedraw(False)
//
//// remove existing lexer
//of_SendEditor(SCI_SETILEXER, SCLEX_NULL)
//
//// set background/default text/select color
//of_SetMarginBackColor(GetSysColor(4))
//of_SetMarginTextColor(of_Color("Navy"))
//of_SetFoldBackColor(of_Color("Navy"))
//of_SetFoldForeColor(GetSysColor(4))
//of_SetBackColor(of_Color("White"))
//of_SetTextColor(of_Color("Black"))
//of_SetSelectColor(RGB(166,202,240))
//of_SetCaretColor(of_Color("Black"))
//of_SetCaretLineColor(RGB(232,232,255))
//
//// allow user to override colors
//this.Event ue_SetLanguageColors()
//
//// set the comment characters
//is_commentchar1 = ""
//is_commentchar2 = ""
//
//this.SetRedraw(True)
//
end subroutine

public subroutine of_setmarginbackcolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetMarginBackColor
//
// PURPOSE:    This function will change the margin background color
//
// ARGUMENTS:  al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

il_MarginBackColor = al_color

of_SendEditor(SCI_STYLESETBACK, STYLE_LINENUMBER, il_MarginBackColor)

end subroutine

public subroutine of_setmargintextcolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetMarginTextColor
//
// PURPOSE:    This function will change the margin text color
//
// ARGUMENTS:  al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

il_MarginTextColor = al_color

of_SendEditor(SCI_STYLESETFORE, STYLE_LINENUMBER, il_MarginTextColor)

end subroutine

public function long of_color (string as_colorname);// -----------------------------------------------------------------------------
// SCRIPT:     of_Color
//
// PURPOSE:    This function returns a color code for a named color. It includes
//					all the PowerBuilder, System, and Web colors.
//
// ARGUMENTS:  as_colorname - Name of the color
//
// RETURN:		Color code
// -----------------------------------------------------------------------------

Long ll_color

choose case Upper(as_colorname)
	// PowerBuilder Colors (not defined elsewhere)
	case "MINT"
		ll_color = RGB(192, 220, 192)
	case "SKY"
		ll_color = RGB(166, 202, 240)
	case "CREAM"
		ll_color = RGB(255, 251, 240)
	case "MEDIUM GRAY"
		ll_color = RGB(160, 160, 164)
	// System Colors
	case "COLOR_SCROLLBAR", "SCROLL BAR"
		// Scroll bar gray area.
		ll_color = GetSysColor(0)
	case "COLOR_DESKTOP", "DESKTOP"
		// Desktop.
		ll_color = GetSysColor(1)
	case "COLOR_ACTIVECAPTION", "ACTIVE TITLE BAR"
		// Active window title bar.
		ll_color = GetSysColor(2)
	case "COLOR_INACTIVECAPTION", "INACTIVE TITLE BAR"
		// Inactive window caption.
		ll_color = GetSysColor(3)
	case "COLOR_MENU", "MENU BAR"
		// Menu background.
		ll_color = GetSysColor(4)
	case "COLOR_WINDOW", "WINDOW BACKGROUND"
		// Window background.
		ll_color = GetSysColor(5)
	case "COLOR_WINDOWFRAME", "WINDOW FRAME"
		// Window frame.
		ll_color = GetSysColor(6)
	case "COLOR_MENUTEXT", "MENU TEXT"
		// Text in menus.
		ll_color = GetSysColor(7)
	case "COLOR_WINDOWTEXT", "WINDOW TEXT"
		// Text in windows.
		ll_color = GetSysColor(8)
	case "COLOR_CAPTIONTEXT", "ACTIVE TITLE BAR TEXT"
		// Text in caption, size box, and scroll bar arrow box.
		ll_color = GetSysColor(9)
	case "COLOR_ACTIVEBORDER", "ACTIVE BORDER"
		// Active window border.
		ll_color = GetSysColor(10)
	case "COLOR_INACTIVEBORDER", "INACTIVE BORDER"
		// Inactive window border.
		ll_color = GetSysColor(11)
	case "COLOR_APPWORKSPACE", "APPLICATION WORKSPACE"
		// Background color of multiple document interface (MDI) applications.
		ll_color = GetSysColor(12)
	case "COLOR_HIGHLIGHT", "HIGHLIGHT"
		// Item(s) selected in a control.
		ll_color = GetSysColor(13)
	case "COLOR_HIGHLIGHTTEXT", "HIGHLIGHT TEXT"
		// Text of item(s) selected in a control.
		ll_color = GetSysColor(14)
	case "COLOR_BTNFACE", "COLOR_3DFACE", "BUTTON FACE"
		// Face color for three-dimensional display elements and for dialog box backgrounds.
		ll_color = GetSysColor(15)
	case "COLOR_BTNSHADOW", "COLOR_3DSHADOW", "BUTTON SHADOW"
		// Shadow color for three-dimensional display elements (for edges facing away from the light source).
		ll_color = GetSysColor(16)
	case "COLOR_GRAYTEXT", "DISABLE TEXT"
		// Grayed (disabled) text.
		ll_color = GetSysColor(17)
	case "COLOR_BTNTEXT", "BUTTON TEXT"
		// Text on push buttons.
		ll_color = GetSysColor(18)
	case "COLOR_INACTIVECAPTIONTEXT", "INACTIVE TITLE BAR TEXT"
		// Color of text in an inactive caption.
		ll_color = GetSysColor(19)
	case "COLOR_3DHIGHLIGHT", "BUTTON HIGHLIGHT"
		// Highlight color for three-dimensional display elements (for edges facing the light source.)
		ll_color = GetSysColor(20)
	case "COLOR_3DDKSHADOW", "BUTTON DARK SHADOW"
		// Dark shadow for three-dimensional display elements.
		ll_color = GetSysColor(21)
	case "COLOR_3DLIGHT", "BUTTON LIGHT SHADOW"
		// Light color for three-dimensional display elements (for edges facing the light source.)
		ll_color = GetSysColor(22)
	case "COLOR_INFOTEXT", "TOOLTIP TEXT"
		// Text color for tooltip controls.
		ll_color = GetSysColor(23)
	case "COLOR_INFOBK", "TOOLTIP"
		// Background color for tooltip controls.
		ll_color = GetSysColor(24)
	case "COLOR_HOTLIGHT", "LINK"
		// Color for a hyperlink or hot-tracked item.
		ll_color = GetSysColor(26)
	case "COLOR_GRADIENTACTIVECAPTION"
		// Right side color in the color gradient of an active window's title bar.
		ll_color = GetSysColor(27)
	case "COLOR_GRADIENTINACTIVECAPTION"
		// Right side color in the color gradient of an inactive window's title bar.
		ll_color = GetSysColor(28)
	case "COLOR_MENUHILIGHT"
		// The color used to highlight menu items when the menu appears as a flat menu (see SystemParametersInfo).
		ll_color = GetSysColor(29)
	case "COLOR_MENUBAR"
		// The background color for the menu bar when menus appear as flat menus (see SystemParametersInfo).
		ll_color = GetSysColor(30)
	// Web Color Pinks
	case "PINK"
		ll_color = RGB(255,192,203)
	case "LIGHTPINK"
		ll_color = RGB(255,182,193)
	case "HOTPINK"
		ll_color = RGB(255,105,180)
	case "DEEPPINK"
		ll_color = RGB(255,20,147)
	case "PALEVIOLETRED"
		ll_color = RGB(219,112,147)
	case "MEDIUMVIOLETRED"
		ll_color = RGB(199,21,13)
	// Web Colors Red
	case "LIGHTSALMON"
		ll_color = RGB(255,160,122)
	case "SALMON"
		ll_color = RGB(250,128,114)
	case "DARKSALMON"
		ll_color = RGB(233,150,122)
	case "LIGHTCORAL"
		ll_color = RGB(240,128,128)
	case "INDIANRED"
		ll_color = RGB(205,92,92)
	case "CRIMSON"
		ll_color = RGB(220,20,60)
	case "FIREBRICK"
		ll_color = RGB(178,34,34)
	case "DARKRED"
		ll_color = RGB(139,0,0)
	case "RED"
		ll_color = RGB(255,0,0)
	// Web Color Oranges
	case "ORANGERED"
		ll_color = RGB(255,69,0)
	case "TOMATO"
		ll_color = RGB(255,99,71)
	case "CORAL"
		ll_color = RGB(255,127,80)
	case "DARKORANGE"
		ll_color = RGB(255,140,0)
	case "ORANGE"
		ll_color = RGB(255,165,0)
	// Web Color Yellows
	case "YELLOW"
		ll_color = RGB(255,255,0)
	case "LIGHTYELLOW"
		ll_color = RGB(255,255,224)
	case "LEMONCHIFFON"
		ll_color = RGB(255,250,205)
	case "LIGHTGOLDENRODYELLOW"
		ll_color = RGB(250,250,210)
	case "PAPAYAWHIP"
		ll_color = RGB(255,239,213)
	case "MOCCASIN"
		ll_color = RGB(255,228,181)
	case "PEACHPUFF"
		ll_color = RGB(255,218,185)
	case "PALEGOLDENROD"
		ll_color = RGB(238,232,170)
	case "KHAKI"
		ll_color = RGB(240,230,140)
	case "DARKKHAKI"
		ll_color = RGB(189,183,107)
	case "GOLD"
		ll_color = RGB(255,215,0)
	// Web Color Browns
	case "CORNSILK"
		ll_color = RGB(255,248,220)
	case "BLANCHEDALMOND"
		ll_color = RGB(255,235,205)
	case "BISQUE"
		ll_color = RGB(255,228,196)
	case "NAVAJOWHITE"
		ll_color = RGB(255,222,173)
	case "WHEAT"
		ll_color = RGB(245,222,179)
	case "BURLYWOOD"
		ll_color = RGB(222,184,135)
	case "TAN"
		ll_color = RGB(210,180,140)
	case "ROSYBROWN"
		ll_color = RGB(188,143,143)
	case "SANDYBROWN"
		ll_color = RGB(244,164,96)
	case "GOLDENROD"
		ll_color = RGB(218,165,32)
	case "DARKGOLDENROD"
		ll_color = RGB(184,134,11)
	case "PERU"
		ll_color = RGB(205,133,63)
	case "CHOCOLATE"
		ll_color = RGB(210,105,30)
	case "SADDLEBROWN"
		ll_color = RGB(139,69,19)
	case "SIENNA"
		ll_color = RGB(160,82,45)
	case "BROWN"
		ll_color = RGB(165,42,42)
	case "MAROON"
		ll_color = RGB(128,0,0)
	// Web Color Greens
	case "DARKOLIVEGREEN"
		ll_color = RGB(85,107,47)
	case "OLIVE"
		ll_color = RGB(128,128,0)
	case "OLIVEDRAB"
		ll_color = RGB(107,142,35)
	case "YELLOWGREEN"
		ll_color = RGB(154,205,50)
	case "LIMEGREEN"
		ll_color = RGB(50,205,50)
	case "LIME"
		ll_color = RGB(0,255,0)
	case "LAWNGREEN"
		ll_color = RGB(124,252,0)
	case "CHARTREUSE"
		ll_color = RGB(127,255,0)
	case "GREENYELLOW"
		ll_color = RGB(173,255,47)
	case "SPRINGGREEN"
		ll_color = RGB(0,255,127)
	case "MEDIUMSPRINGGREEN"
		ll_color = RGB(0,250,154)
	case "LIGHTGREEN"
		ll_color = RGB(144,238,144)
	case "PALEGREEN"
		ll_color = RGB(152,251,152)
	case "DARKSEAGREEN"
		ll_color = RGB(143,188,143)
	case "MEDIUMSEAGREEN"
		ll_color = RGB(60,179,113)
	case "SEAGREEN"
		ll_color = RGB(46,139,87)
	case "FORESTGREEN"
		ll_color = RGB(34,139,34)
	case "GREEN"
		ll_color = RGB(0,128,0)
	case "DARKGREEN"
		ll_color = RGB(0,100,0)
	// Web Color Cyans
	case "MEDIUMAQUAMARINE"
		ll_color = RGB(102,205,170)
	case "AQUA"
		ll_color = RGB(0,255,255)
	case "CYAN"
		ll_color = RGB(0,255,255)
	case "LIGHTCYAN"
		ll_color = RGB(224,255,255)
	case "PALETURQUOISE"
		ll_color = RGB(175,238,238)
	case "AQUAMARINE"
		ll_color = RGB(127,255,212)
	case "TURQUOISE"
		ll_color = RGB(64,224,208)
	case "MEDIUMTURQUOISE"
		ll_color = RGB(72,209,204)
	case "DARKTURQUOISE"
		ll_color = RGB(0,206,209)
	case "LIGHTSEAGREEN"
		ll_color = RGB(32,178,170)
	case "CADETBLUE"
		ll_color = RGB(95,158,160)
	case "DARKCYAN"
		ll_color = RGB(0,139,139)
	case "TEAL"
		ll_color = RGB(0,128,128)
	// Web Color Blues
	case "LIGHTSTEELBLUE"
		ll_color = RGB(176,196,222)
	case "POWDERBLUE"
		ll_color = RGB(176,224,230)
	case "LIGHTBLUE"
		ll_color = RGB(173,216,230)
	case "SKYBLUE"
		ll_color = RGB(135,206,235)
	case "LIGHTSKYBLUE"
		ll_color = RGB(135,206,250)
	case "DEEPSKYBLUE"
		ll_color = RGB(0,191,255)
	case "DODGERBLUE"
		ll_color = RGB(30,144,255)
	case "CORNFLOWERBLUE"
		ll_color = RGB(100,149,237)
	case "STEELBLUE"
		ll_color = RGB(70,130,180)
	case "ROYALBLUE"
		ll_color = RGB(65,105,225)
	case "BLUE"
		ll_color = RGB(0,0,255)
	case "MEDIUMBLUE"
		ll_color = RGB(0,0,205)
	case "DARKBLUE"
		ll_color = RGB(0,0,139)
	case "NAVY"
		ll_color = RGB(0,0,128)
	case "MIDNIGHTBLUE"
		ll_color = RGB(25,25,112)
	// Web Color Purples
	case "LAVENDER"
		ll_color = RGB(230,230,250)
	case "THISTLE"
		ll_color = RGB(216,191,216)
	case "PLUM"
		ll_color = RGB(221,160,221)
	case "VIOLET"
		ll_color = RGB(238,130,238)
	case "ORCHID"
		ll_color = RGB(218,112,214)
	case "FUCHSIA"
		ll_color = RGB(255,0,255)
	case "MAGENTA"
		ll_color = RGB(255,0,255)
	case "MEDIUMORCHID"
		ll_color = RGB(186,85,211)
	case "MEDIUMPURPLE"
		ll_color = RGB(147,112,219)
	case "BLUEVIOLET"
		ll_color = RGB(138,43,226)
	case "DARKVIOLET"
		ll_color = RGB(148,0,211)
	case "DARKORCHID"
		ll_color = RGB(153,50,204)
	case "DARKMAGENTA"
		ll_color = RGB(139,0,139)
	case "PURPLE"
		ll_color = RGB(128,0,128)
	case "INDIGO"
		ll_color = RGB(75,0,130)
	case "DARKSLATEBLUE"
		ll_color = RGB(72,61,139)
	case "SLATEBLUE"
		ll_color = RGB(106,90,205)
	case "MEDIUMSLATEBLUE"
		ll_color = RGB(123,104,238)
	// Web Color Whites
	case "WHITE"
		ll_color = RGB(255,255,255)
	case "SNOW"
		ll_color = RGB(255,250,250)
	case "HONEYDEW"
		ll_color = RGB(240,255,240)
	case "MINTCREAM"
		ll_color = RGB(245,255,250)
	case "AZURE"
		ll_color = RGB(240,255,255)
	case "ALICEBLUE"
		ll_color = RGB(240,248,255)
	case "GHOSTWHITE"
		ll_color = RGB(248,248,255)
	case "WHITESMOKE"
		ll_color = RGB(245,245,245)
	case "SEASHELL"
		ll_color = RGB(255,245,238)
	case "BEIGE"
		ll_color = RGB(245,245,220)
	case "OLDLACE"
		ll_color = RGB(253,245,230)
	case "FLORALWHITE"
		ll_color = RGB(255,250,240)
	case "IVORY"
		ll_color = RGB(255,255,240)
	case "ANTIQUEWHITE"
		ll_color = RGB(250,235,215)
	case "LINEN"
		ll_color = RGB(250,240,230)
	case "LAVENDERBLUSH"
		ll_color = RGB(255,240,245)
	case "MISTYROSE"
		ll_color = RGB(255,228,225)
	// Web Color Grays/blacks
	case "GAINSBORO"
		ll_color = RGB(220,220,220)
	case "LIGHTGRAY"
		ll_color = RGB(211,211,211)
	case "SILVER"
		ll_color = RGB(192,192,192)
	case "DARKGRAY"
		ll_color = RGB(169,169,169)
	case "GRAY"
		ll_color = RGB(128,128,128)
	case "DIMGRAY"
		ll_color = RGB(105,105,105)
	case "LIGHTSLATEGRAY"
		ll_color = RGB(119,136,153)
	case "SLATEGRAY"
		ll_color = RGB(112,128,144)
	case "DARKSLATEGRAY"
		ll_color = RGB(47,79,79)
	case "BLACK"
		ll_color = RGB(0,0,0)
	// Default To White
	case else
		ll_color = RGB(255, 255, 255)
end choose

Return ll_color

end function

public subroutine of_setfoldbackcolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetFoldBackColor
//
// PURPOSE:    This function will set the fold marker color variable. The
//					color is actually applied in the of_enablefolding function.
//
// ARGUMENTS:  al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

il_foldbackcolor = al_color

end subroutine

public subroutine of_setfoldforecolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetFoldForeColor
//
// PURPOSE:    This function will set the fold box background color variable.
//					The color is actually applied in the of_enablefolding function.
//
// ARGUMENTS:  al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

il_foldforecolor = al_color

end subroutine

public subroutine of_setbackcolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetBackColor
//
// PURPOSE:    This function will set the background color.
//
// ARGUMENTS:  al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long ll_style

il_BackColor = al_color

For ll_style = 0 To STYLE_DEFAULT
	of_SetStyleBack(ll_style, il_BackColor)
Next

end subroutine

public subroutine of_settextcolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetTextColor
//
// PURPOSE:    This function will set the foreground (text) color.
//
// ARGUMENTS:  al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long ll_style

il_ForeColor = al_color

For ll_style = 0 To STYLE_DEFAULT
	of_SetStyleFore(ll_style, il_ForeColor)
Next

end subroutine

public subroutine of_setstylefore (long al_style, long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetStyleFore
//
// PURPOSE:    This function will change the foreground color of the style.
//
// ARGUMENTS:  al_style	- The number of the style
//             al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_STYLESETFORE, al_style, al_color)

end subroutine

public subroutine of_setstyleback (long al_style, long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetStyleBack
//
// PURPOSE:    This function will change the background color of the style.
//
// ARGUMENTS:  al_style	- The number of the style
//             al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_STYLESETBACK, al_style, al_color)

end subroutine

public subroutine of_setselectcolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetSelectColor
//
// PURPOSE:    This function will change the back color of selected text
//
// ARGUMENTS:  al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

il_SelectColor = al_color

If il_SelectColor > -1 Then
	of_SendEditor(SCI_SETSELBACK, 1, il_SelectColor)
	of_SendEditor(SCI_SETELEMENTCOLOUR, SC_ELEMENT_SELECTION_INACTIVE_BACK, il_SelectColor)
End If

end subroutine

public subroutine of_setcaretcolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetCaretColor
//
// PURPOSE:    This function will set the caret (cursor) color.
//
// ARGUMENTS:  al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

il_CaretColor = al_color

of_SendEditor(SCI_SETCARETFORE, il_CaretColor)

end subroutine

public subroutine of_setcaretlinecolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetCaretLineColor
//
// PURPOSE:    This function will set the caret line (cursor) background color.
//
// ARGUMENTS:  al_color	- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

il_CaretLineColor = al_color

of_SendEditor(SCI_SETCARETLINEBACK, il_CaretLineColor)

end subroutine

public function string of_getlanguage ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetLanguage
//
// PURPOSE:    This function will get the text language
//
// RETURN:		The current text language
// -----------------------------------------------------------------------------

String ls_text

ls_text = Space(MAX_PATH)

of_SendEditor(SCI_GETLEXERLANGUAGE, 0, ls_text)

If IsNull(ls_text) Then
	Return "null"
Else
	Return ls_text
End If

end function

public function long of_sendeditorlen (unsignedlong imessage, ref string as_parm2);// -----------------------------------------------------------------------------
// SCRIPT:     of_SendEditorLen
//
// PURPOSE:    This function sends a message to the control where parm1
//					is the length of the string in parm2.
//
// ARGUMENTS:  iMessage	- Message number
//					as_parm2	- Message argument #2
//
// RETURN:		Value returned from message
// -----------------------------------------------------------------------------

Blob lblob_parm2
Long ll_return, ll_length

If #Encoding = EncodingAnsi! Then
	ll_length = Len(as_parm2)
	Return SciSend(ip_hSciWnd, iMessage, ll_length, as_parm2)
Else
	lblob_parm2 = Blob(as_parm2, EncodingUTF8!)
	ll_length = Len(lblob_parm2)
	// send the string as UTF8 blob
	ll_return = SciSend(ip_hSciWnd, iMessage, ll_length, lblob_parm2)
	// update the argument if the command changed it
	as_parm2 = String(lblob_parm2, EncodingUTF8!)
	Return ll_return
End If

end function

public subroutine of_addtext (string as_text);// -----------------------------------------------------------------------------
// SCRIPT:     of_AddText
//
// PURPOSE:    This function inserts the text at the current position.
//
// ARGUMENTS:  as_text - The text to be inserted
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditorLen(SCI_ADDTEXT, as_text)

end subroutine

public subroutine of_appendtext (ref string as_text);// -----------------------------------------------------------------------------
// SCRIPT:     of_AppendText
//
// PURPOSE:    This function will append the text to the end of the document.
//
// ARGUMENTS:  as_text	- The new text that is appended
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditorLen(SCI_APPENDTEXT, as_text)

end subroutine

public function boolean of_autocactive ();// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCActive
//
// PURPOSE:    This function determines if the autocomplete window is active
//
// RETURN:		True=Active, False=Not active
// -----------------------------------------------------------------------------

If of_SendEditor(SCI_AUTOCACTIVE) = 0 Then
	Return False
Else
	Return True
End If

end function

public subroutine of_autoccancel ();// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCCancel
//
// PURPOSE:    This function cancels the autocomplete window
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_AUTOCCANCEL)

end subroutine

public subroutine of_autoccomplete ();// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCComplete
//
// PURPOSE:    This function completes the autocomplete window
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_AUTOCCOMPLETE)

end subroutine

public function long of_autocposstart ();// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCPosStart
//
// PURPOSE:    This function returns the position when of_AutoCShow was called.
//
// RETURN:		The number of lines contained in the control
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_AUTOCPOSSTART)

end function

public subroutine of_autocsetautohide (boolean ab_option);// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCSetAutohide
//
// PURPOSE:    This function will toggle autocomplete Autohide option.
//
// ARGUMENTS:  ab_option	- True=Autohide on, False=Autohide off
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_option Then
	of_SendEditor(SCI_AUTOCSETAUTOHIDE, 1)
Else
	of_SendEditor(SCI_AUTOCSETAUTOHIDE, 0)
End If

end subroutine

public subroutine of_autocsetfillups (string as_list);// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCSetFillups
//
// PURPOSE:    This function sets the characters that complete selection.
//
// ARGUMENTS:  as_list		- The list of characters
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_AUTOCSETFILLUPS, 0, as_list)

end subroutine

public subroutine of_autocsetignorecase (boolean ab_ignorecase);// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCSetIgnoreCase
//
// PURPOSE:    This function will toggle ignore case for autocomplete
//
// ARGUMENTS:  ab_ignorecase	- True=Ignore Case, False=Do not ignore case
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_ignorecase Then
	of_SendEditor(SCI_AUTOCSETIGNORECASE, 1)
Else
	of_SendEditor(SCI_AUTOCSETIGNORECASE, 0)
End If

end subroutine

public subroutine of_autocsetmaxheight (long al_rowcount);// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCSetMaxHeight
//
// PURPOSE:    This function sets the number of rows displayed. Default is 5.
//
// ARGUMENTS:  al_rowcount	- The number of rows
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_AUTOCSETMAXHEIGHT, al_rowcount)

end subroutine

public subroutine of_autocsetmaxwidth (long al_charcount);// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCSetMaxWidth
//
// PURPOSE:    This function sets the number of characters displayed.
//
// ARGUMENTS:  al_charcount	- The number of characters
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_AUTOCSETMAXWIDTH, al_charcount)

end subroutine

public subroutine of_autocsetorder (long al_order);// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCSetOrder
//
// PURPOSE:    This function sets the sort order of the autocomplete words.
//
// ARGUMENTS:  al_order	- Sort order option. Values are:
//
//									SC_ORDER_PRESORTED (default)
//									SC_ORDER_PERFORMSORT
//									SC_ORDER_CUSTOM
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_AUTOCSETORDER, al_order)

end subroutine

public subroutine of_autocsetseparator (character ac_separator);// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCSetSeparator
//
// PURPOSE:    This function sets the character that separates autocomplete
//					word list used by of_AutoCShow.
//
// ARGUMENTS:  ac_separator	- The separator character
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_AUTOCSETSEPARATOR, Asc(ac_separator), 0)

end subroutine

public subroutine of_autocsettypeseparator (character ac_separator);// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCSetTypeSeparator
//
// PURPOSE:    This function sets the character that separates words from the
//					image index when the word list is passed to of_AutoCShow.
//
// ARGUMENTS:  ac_separator	- The separator character
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_AUTOCSETTYPESEPARATOR, Asc(ac_separator), 0)

end subroutine

public subroutine of_autocshow (long al_entered, ref string as_list);// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCShow
//
// PURPOSE:    This function causes an autocompletion window to appear.
//
// ARGUMENTS:  al_entered	- Number of letters of the word already typed
//					as_list		- The list of words to display
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_AUTOCSHOW, al_entered, as_list)

end subroutine

public subroutine of_autocstops (string as_list);// -----------------------------------------------------------------------------
// SCRIPT:     of_AutoCStops
//
// PURPOSE:    This function sets the characters that closes autocomplete.
//
// ARGUMENTS:  as_list		- The list of characters
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_AUTOCSTOPS, 0, as_list)

end subroutine

public function boolean of_cancopy ();// -----------------------------------------------------------------------------
// SCRIPT:     of_CanCopy
//
// PURPOSE:    This function determines if anything to copy
//
// RETURN:		True=Text to copy, False=No text to copy
// -----------------------------------------------------------------------------

Long ll_length

ll_length = of_SendEditor(SCI_GETSELECTIONEND) - of_SendEditor(SCI_GETSELECTIONSTART)

If ll_length > 0 Then
	Return True
Else
	Return False
End If

end function

public function boolean of_canpaste ();// -----------------------------------------------------------------------------
// SCRIPT:     of_CanPaste
//
// PURPOSE:    This function determines if anything to paste
//
// RETURN:		True=Text to paste, False=No text to paste
// -----------------------------------------------------------------------------

If of_SendEditor(SCI_CANPASTE) = 0 Then
	Return False
Else
	Return True
End If

end function

public function boolean of_canredo ();// -----------------------------------------------------------------------------
// SCRIPT:     of_CanRedo
//
// PURPOSE:    This function determines if anything to redo
//
// RETURN:		True=Changes to redo, False=No changes to redo
// -----------------------------------------------------------------------------

If of_SendEditor(SCI_CANREDO) = 0 Then
	Return False
Else
	Return True
End If

end function

public function boolean of_canundo ();// -----------------------------------------------------------------------------
// SCRIPT:     of_CanUndo
//
// PURPOSE:    This function determines if anything to undo
//
// RETURN:		True=Changes to undo, False=No changes to undo
// -----------------------------------------------------------------------------

If of_SendEditor(SCI_CANUNDO) = 0 Then
	Return False
Else
	Return True
End If

end function

public subroutine of_changecase (textcase a_case);// -----------------------------------------------------------------------------
// SCRIPT:     of_ChangeCase
//
// PURPOSE:    This function will change the case of the selected text
//
// ARGUMENTS:  a_case	- Indicates Upper or Lower case
//
// RETURN:		None
// -----------------------------------------------------------------------------

String ls_value

choose case a_case
	case Lower!
		ls_value = Lower(of_GetSelectedText())
		of_ReplaceSelectedText(ls_value)
	case Upper!
		ls_value = Upper(of_GetSelectedText())
		of_ReplaceSelectedText(ls_value)
end choose

end subroutine

public function string of_getselectedtext ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetSelectedText
//
// PURPOSE:    This function returns the selected text in the control
//
// RETURN:		The selected text
// -----------------------------------------------------------------------------

String ls_text
Long ll_length

// get the length of the text
ll_length = of_SendEditor(SCI_GETSELECTIONEND) - of_SendEditor(SCI_GETSELECTIONSTART)

ls_text = Space(ll_length)

of_SendEditor(SCI_GETSELTEXT, ll_length, ls_text)

Return ls_text

end function

public subroutine of_replaceselectedtext (ref string as_text);// -----------------------------------------------------------------------------
// SCRIPT:     of_ReplaceSelectedText
//
// PURPOSE:    This function will replace the selected text
//
// ARGUMENTS:  as_text	- The new text that replaces the selected text
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_REPLACESEL, 0, as_text)

end subroutine

public subroutine of_clear ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Clear
//
// PURPOSE:    This function deletes all text from the document
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_CLEARALL)

end subroutine

public subroutine of_cleardocumentstyle ();// -----------------------------------------------------------------------------
// SCRIPT:     of_ClearDocumentStyle
//
// PURPOSE:    This function clears all styling information and resets
//					the folding state.
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_CLEARDOCUMENTSTYLE)

end subroutine

public subroutine of_clearregisteredimages ();// -----------------------------------------------------------------------------
// SCRIPT:     of_ClearRegisteredImages
//
// PURPOSE:    This function clears all registered images.
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_CLEARREGISTEREDIMAGES)

end subroutine

public subroutine of_commentselected ();// -----------------------------------------------------------------------------
// SCRIPT:     of_CommentSelected
//
// PURPOSE:    This function adds comment characters to selected lines.
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long caretPos, ll_start, ll_end, ll_line

// get first selected line
caretPos = of_SendEditor(SCI_GETSELECTIONSTART)
ll_start = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

// get last selected line
caretPos = of_SendEditor(SCI_GETSELECTIONEND)
ll_end   = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

// if end of selection is start of the line, end on prior line
If ll_start = ll_end Then
Else
	If caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_end) Then
		ll_end = ll_end - 1
	End If
End If

of_SendEditor(SCI_BEGINUNDOACTION)

// insert comment characters
For ll_line = ll_start To ll_end
	caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_line)
	of_SendEditor(SCI_INSERTTEXT, caretPos, is_commentchar1)
Next

of_SendEditor(SCI_ENDUNDOACTION)

// position at begining of last line
of_SendEditor(SCI_SETSEL, -1, of_SendEditor(SCI_POSITIONFROMLINE, ll_end))

end subroutine

public subroutine of_converteols (long al_eolmode);// -----------------------------------------------------------------------------
// SCRIPT:     of_ConvertEOLS
//
// PURPOSE:    Converts all EOL characters to be the same.
//
// ARGUMENTS:  al_eolmode	- SC_EOL_CRLF (0), SC_EOL_CR (1), or SC_EOL_LF (2).
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_CONVERTEOLS, al_eolmode)

end subroutine

public subroutine of_copy ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Copy
//
// PURPOSE:    This function copies selected text putting it in clipboard
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_COPY)

end subroutine

public subroutine of_cut ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Cut
//
// PURPOSE:    This function deletes selected text putting it in clipboard
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_CUT)

end subroutine

public subroutine of_delete ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Delete
//
// PURPOSE:    This function deletes selected text without putting in clipboard
//
// RETURN:		None
// -----------------------------------------------------------------------------

String ls_text

of_ReplaceSelectedText(ls_text)

end subroutine

public subroutine of_deleteline (long al_line);// -----------------------------------------------------------------------------
// SCRIPT:     of_DeleteLine
//
// PURPOSE:    This function will delete the specified line
//
// ARGUMENTS:  al_line	- The line to delete in the text
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long ll_line, ll_start, ll_length

ll_line = al_line - 1

// unfold if the line is hidden
of_SendEditor(SCI_ENSUREVISIBLEENFORCEPOLICY, ll_line)

// get starting position
ll_start  = of_SendEditor(SCI_POSITIONFROMLINE, ll_line)

// get length of the line
ll_length = of_SendEditor(SCI_LINELENGTH, ll_line)

// set the target start/end
of_SendEditor(SCI_SETTARGETSTART, ll_start)
of_SendEditor(SCI_SETTARGETEND,   ll_start + ll_length)

// replace current contents with nothing
of_SendEditor(SCI_REPLACETARGET, 0, 0)

end subroutine

public subroutine of_emptyclipboard ();// -----------------------------------------------------------------------------
// SCRIPT:     of_EmptyClipBoard
//
// PURPOSE:    This function clears the contents of the clipboard
//
// RETURN:		None
// -----------------------------------------------------------------------------

If OpenClipboard(0) Then
	EmptyClipboard()
	CloseClipboard()
End If

end subroutine

public subroutine of_enablefolding ();// -----------------------------------------------------------------------------
// SCRIPT:     of_EnableFolding
//
// PURPOSE:    This function turns on folding and sets various options for
//					how it works and looks.
//
// RETURN:		None
// -----------------------------------------------------------------------------

String ls_option

ls_option = '0'
of_SendEditor(SCI_SETPROPERTY, "fold.compact", ls_option)

ls_option = '1'
of_SendEditor(SCI_SETPROPERTY, "fold", ls_option)
of_SendEditor(SCI_SETPROPERTY, "fold.comment", ls_option)
of_SendEditor(SCI_SETPROPERTY, "fold.preprocessor", ls_option)

of_SendEditor(SCI_SETMARGINWIDTHN, MARGIN_SCRIPT_FOLD_INDEX, 20)
of_SendEditor(SCI_SETMARGINTYPEN, MARGIN_SCRIPT_FOLD_INDEX, SC_MARGIN_SYMBOL)
of_SendEditor(SCI_SETMARGINMASKN, MARGIN_SCRIPT_FOLD_INDEX, SC_MASK_FOLDERS)
of_SendEditor(SCI_SETFOLDFLAGS, 16)		// 16 - Draw line below if not expanded
of_SendEditor(SCI_SETMARGINSENSITIVEN, MARGIN_SCRIPT_FOLD_INDEX, 1)

// set marker shapes
of_SendEditor(SCI_MARKERDEFINE, SC_MARKNUM_FOLDER,        SC_MARK_BOXPLUS)
of_SendEditor(SCI_MARKERDEFINE, SC_MARKNUM_FOLDEROPEN,    SC_MARK_BOXMINUS)
of_SendEditor(SCI_MARKERDEFINE, SC_MARKNUM_FOLDEREND,     SC_MARK_BOXPLUSCONNECTED)
of_SendEditor(SCI_MARKERDEFINE, SC_MARKNUM_FOLDEROPENMID, SC_MARK_BOXMINUSCONNECTED)
of_SendEditor(SCI_MARKERDEFINE, SC_MARKNUM_FOLDERMIDTAIL, SC_MARK_TCORNER)
of_SendEditor(SCI_MARKERDEFINE, SC_MARKNUM_FOLDERSUB,     SC_MARK_VLINE)
of_SendEditor(SCI_MARKERDEFINE, SC_MARKNUM_FOLDERTAIL,    SC_MARK_LCORNER)

// set default colors if needed
If il_foldforecolor = -1 Then
	il_foldforecolor = il_BackColor
End If
If il_foldbackcolor = -1 Then
	il_foldbackcolor = il_MarginTextColor
End If

// set marker margin colors
of_SendEditor(SCI_SETFOLDMARGINCOLOUR,   1, il_MarginBackColor)
of_SendEditor(SCI_SETFOLDMARGINHICOLOUR, 1, il_MarginBackColor)

// set marker foreground colors
of_SendEditor(SCI_MARKERSETFORE, SC_MARKNUM_FOLDER,        il_foldforecolor)
of_SendEditor(SCI_MARKERSETFORE, SC_MARKNUM_FOLDEROPEN,    il_foldforecolor)
of_SendEditor(SCI_MARKERSETFORE, SC_MARKNUM_FOLDEREND,     il_foldforecolor)
of_SendEditor(SCI_MARKERSETFORE, SC_MARKNUM_FOLDEROPENMID, il_foldforecolor)
of_SendEditor(SCI_MARKERSETFORE, SC_MARKNUM_FOLDERMIDTAIL, il_foldforecolor)
of_SendEditor(SCI_MARKERSETFORE, SC_MARKNUM_FOLDERSUB,     il_foldforecolor)
of_SendEditor(SCI_MARKERSETFORE, SC_MARKNUM_FOLDERTAIL,    il_foldforecolor)

// set marker background colors
of_SendEditor(SCI_MARKERSETBACK, SC_MARKNUM_FOLDER,        il_foldbackcolor)
of_SendEditor(SCI_MARKERSETBACK, SC_MARKNUM_FOLDEROPEN,    il_foldbackcolor)
of_SendEditor(SCI_MARKERSETBACK, SC_MARKNUM_FOLDEREND,     il_foldbackcolor)
of_SendEditor(SCI_MARKERSETBACK, SC_MARKNUM_FOLDEROPENMID, il_foldbackcolor)
of_SendEditor(SCI_MARKERSETBACK, SC_MARKNUM_FOLDERMIDTAIL, il_foldbackcolor)
of_SendEditor(SCI_MARKERSETBACK, SC_MARKNUM_FOLDERSUB,     il_foldbackcolor)
of_SendEditor(SCI_MARKERSETBACK, SC_MARKNUM_FOLDERTAIL,    il_foldbackcolor)

end subroutine

public function boolean of_find (ref string as_findstring);// -----------------------------------------------------------------------------
// SCRIPT:     of_Find
//
// PURPOSE:    This function finds a string within the text
//
// ARGUMENTS:  as_findstring	- The string to look for
//
// RETURN:		True=String found, False=String not found
// -----------------------------------------------------------------------------

Boolean lb_found
Long ll_flags, ll_selected, ll_pos1, ll_pos2
Long ll_TargetStart, ll_TargetEnd, ll_line

// validate string length
If Len(as_findstring) = 0 Then Return False

// set search flags
ll_flags = 0
If ib_MatchCase Then
	ll_flags += SCFIND_MATCHCASE
End If
If ib_WholeWord Then
	ll_flags += SCFIND_WHOLEWORD
End If
If ib_WordStart Then
	ll_flags += SCFIND_WORDSTART
End If
If ib_RegEx Then
	ll_flags += SCFIND_REGEXP
End If
of_SendEditor(SCI_SETSEARCHFLAGS, ll_flags)

// set the search position
If ib_Backwards Then
	ll_selected = of_SendEditor(SCI_GETSELECTIONEND) - of_SendEditor(SCI_GETSELECTIONSTART)
	ll_pos1 = of_SendEditor(SCI_GETCURRENTPOS) - ll_selected
	ll_pos2 = 0
Else
	ll_pos1 = of_SendEditor(SCI_GETCURRENTPOS)
	ll_pos2 = of_SendEditor(SCI_GETLENGTH)
End If
of_SendEditor(SCI_SETTARGETSTART, ll_pos1)
of_SendEditor(SCI_SETTARGETEND,   ll_pos2)

// search for the string
ll_TargetStart = of_SendEditorLen(SCI_SEARCHINTARGET, as_findstring)
do while ll_TargetStart > -1
	lb_found = True
	If ib_IgnoreComment Then
		If of_IsCommented(ll_TargetStart) Then
			lb_found = False
		End If
	End If
	If lb_found Then Exit
	If ib_Backwards Then
		ll_pos1 = ll_TargetStart
	Else
		ll_pos1 = of_SendEditor(SCI_GETTARGETEND)
	End If
	of_SendEditor(SCI_SETTARGETSTART, ll_pos1)
	of_SendEditor(SCI_SETTARGETEND,   ll_pos2)
	ll_TargetStart = of_SendEditorLen(SCI_SEARCHINTARGET, as_findstring)
loop

If lb_found Then
	// move cursor to position of the found string
	of_GotoPos(ll_TargetStart)
	of_GotoPos(ll_TargetStart + Len(as_findstring) + 2)
	// select the found string
	ll_TargetEnd = of_SendEditor(SCI_GETTARGETEND)
	of_SendEditor(SCI_SETSELECTIONSTART, ll_TargetStart)
	of_SendEditor(SCI_SETSELECTIONEND, ll_TargetEnd)
	// scroll the line
	ll_line = of_GetCurrentLine()
	of_SetFirstVisibleLine(ll_line - il_FindScrollLines)
End If

Return lb_found

end function

public function boolean of_iscommented (long al_pos);// -----------------------------------------------------------------------------
// SCRIPT:     of_IsCommented
//
// PURPOSE:    This function will determine if there are comment characters
//					on the same line as the found text.
//
// ARGUMENTS:  al_position	- Position of the found text.
//
// RETURN:		True=Commented, False=Not Commented
// -----------------------------------------------------------------------------

Char lc_chars[]
Long ll_pos, ll_idx, ll_max, ll_char
String ls_line

// get characters prior to the hit that are on the same line
For ll_pos = al_pos - 1 To 0 Step -1
	ll_char = of_SendEditor(SCI_GETCHARAT, ll_pos)
	If (ll_char < 32) And (ll_char <> 9) Then
		Exit
	End If
	ll_idx = ll_idx + 1
	lc_chars[ll_idx] = Char(ll_char)
Next

// convert backwards array to forward string
ll_max = UpperBound(lc_chars)
For ll_idx = ll_max To 1 Step -1
	ls_line += String(lc_chars[ll_idx])
Next

// look for the comment characters
If is_commentchar1 <> "" Then
	If Pos(ls_line, is_commentchar1) > 0 Then
		Return True
	End If
End If
If is_commentchar2 <> "" Then
	If Pos(ls_line, is_commentchar2) > 0 Then
		Return True
	End If
End If

Return False

end function

public subroutine of_gotopos (long al_pos);// -----------------------------------------------------------------------------
// SCRIPT:     of_GotoPos
//
// PURPOSE:    This function will move the cursor to a specified position
//
// ARGUMENTS:  al_pos	- The position to goto in the text
//
// RETURN:		None
// -----------------------------------------------------------------------------

// move the cursor to the specific position
of_SendEditor(SCI_GOTOPOS, al_pos - 1)

end subroutine

public function long of_getcurrentcolumn ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetCurrentColumn
//
// PURPOSE:    This function returns the column that the caret is on
//
// RETURN:		The column number
// -----------------------------------------------------------------------------

Long caretPos

caretPos = of_SendEditor(SCI_GETCURRENTPOS)

Return of_SendEditor(SCI_GETCOLUMN, caretPos) + 1

end function

public function long of_getcurrentline ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetCurrentLine
//
// PURPOSE:    This function returns the line that the caret is on
//
// RETURN:		The line number
// -----------------------------------------------------------------------------

Long caretPos

caretPos = of_SendEditor(SCI_GETCURRENTPOS)

Return of_SendEditor(SCI_LINEFROMPOSITION, caretPos) + 1

end function

public function long of_getcurrentpos ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetCurrentPos
//
// PURPOSE:    This function returns the current position in the buffer
//
// RETURN:		The current position
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETCURRENTPOS)

end function

public subroutine of_setfirstvisibleline (long al_line);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetFirstVisibleLine
//
// PURPOSE:    This function will set the first visible line.
//
// ARGUMENTS:  al_line	- The line you want to be visible
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETFIRSTVISIBLELINE, al_line)

end subroutine

public function long of_findall (ref string as_findstring);// -----------------------------------------------------------------------------
// SCRIPT:     of_FindAll
//
// PURPOSE:    This function finds all occurrences of a string in the text
//
// ARGUMENTS:  as_findstring	- The string to look for
//
// RETURN:		The number of occurrences found
// -----------------------------------------------------------------------------

Boolean lb_found
Long ll_flags, ll_pos1, ll_pos2, ll_found, ll_hits, ll_line

// validate string length
If Len(as_findstring) = 0 Then Return 0

// set search flags
ll_flags = 0
If ib_MatchCase Then
	ll_flags += SCFIND_MATCHCASE
End If
If ib_WholeWord Then
	ll_flags += SCFIND_WHOLEWORD
End If
If ib_WordStart Then
	ll_flags += SCFIND_WORDSTART
End If
If ib_RegEx Then
	ll_flags += SCFIND_REGEXP
End If
of_SendEditor(SCI_SETSEARCHFLAGS, ll_flags)

// set the search range
ll_pos1 = 0
ll_pos2 = of_SendEditor(SCI_GETLENGTH)
of_SendEditor(SCI_SETTARGETSTART, ll_pos1)
of_SendEditor(SCI_SETTARGETEND,   ll_pos2)

// search for the string
ll_found = of_SendEditorLen(SCI_SEARCHINTARGET, as_findstring)
do while ll_found > -1
	lb_found = True
	If ib_IgnoreComment Then
		If of_IsCommented(ll_found) Then
			lb_found = False
		End If
	End If
	If lb_found Then
		// select the first occurrence, mark all occurrences
		ll_line = of_SendEditor(SCI_LINEFROMPOSITION, ll_found)
		of_MarkerAdd(SC_MARK_CIRCLE, ll_line + 1, of_Color("Red"))
		If ll_hits = 0 Then
			// move cursor to position of the found string
			of_GotoPos(ll_found)
			of_GotoPos(ll_found + Len(as_findstring) + 2)
			// select the found string
			If ib_RegEx Then
				of_SelectText(ll_found, 1)
			Else
				of_SelectText(ll_found, Len(as_findstring))
			End If
		End If
		ll_hits++
	End If
	// move start of search range
	If ib_RegEx Then
		ll_pos1 = ll_found + 1
	Else
		ll_pos1 = ll_found + Len(as_findstring)
	End If
	ll_pos2 = of_SendEditor(SCI_GETLENGTH)
	of_SendEditor(SCI_SETTARGETSTART, ll_pos1)
	of_SendEditor(SCI_SETTARGETEND,   ll_pos2)
	// search for the string again
	ll_found = of_SendEditorLen(SCI_SEARCHINTARGET, as_findstring)
loop

Return ll_hits

end function

public function long of_markeradd (long al_index, long al_line);// -----------------------------------------------------------------------------
// SCRIPT:     of_MarkerAdd
//
// PURPOSE:    This function will add a marker to the current line
//
// ARGUMENTS:  al_index	- The marker index being added ( range 0-31 )
//					al_line	- The line number to be marked
//
// RETURN:		Marker handle
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_MARKERADD, al_line - 1, al_index)

end function

public function long of_markeradd (long al_type, long al_line, long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_MarkerAdd
//
// PURPOSE:    This function will add a marker to the current line
//
// ARGUMENTS:  al_type	- The marker type ( SC_MARK_* )
//					al_line	- The line number to be marked
//					al_color	- The background color
//
// RETURN:		Marker handle
// -----------------------------------------------------------------------------

of_SendEditor(SCI_MARKERDEFINE,  MARKER_NUM, al_type)
of_SendEditor(SCI_MARKERSETBACK, MARKER_NUM, al_color)

Return of_SendEditor(SCI_MARKERADD, al_line - 1, MARKER_NUM)

end function

public function long of_geteolmode ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetEOLMode
//
// PURPOSE:    This function returns the current EOL mode.
//
// RETURN:		EOL Mode: SC_EOL_CRLF (0), SC_EOL_CR (1), or SC_EOL_LF (2).
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETEOLMODE)

end function

public function string of_getkeywords (long al_keyset, string as_language);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetKeywords
//
// PURPOSE:    This function will return a list of language keywords
//
// ARGUMENTS:  ai_keyset	- The keyword set number
//					as_language	- The name of the langauge
//
// RETURN:		Keyword list
// -----------------------------------------------------------------------------

String ls_keywords

choose case Lower(as_language)
	case "sql"
		choose case al_keyset
			case 0	// reserved words
				ls_keywords  = "add all alter and any as asc begin between break "
				ls_keywords += "by call cascade case cast check checkpoint close "
				ls_keywords += "comment commit connect constraint continue "
				ls_keywords += "convert create cross current cursor dbspace "
				ls_keywords += "declare default delete desc distinct do drop "
				ls_keywords += "dynamic else elseif encrypted end endif escape "
				ls_keywords += "exception exec execute exists fetch first for "
				ls_keywords += "foreign from full grant group having holdlock "
				ls_keywords += "identified if in index inner inout insensitive "
				ls_keywords += "insert instead into is isolation join key left "
				ls_keywords += "like lock match membership message mode modify "
				ls_keywords += "natural new no noholdlock not null of off on "
				ls_keywords += "open option or order others out outer "
				ls_keywords += "passthrough precision prepare primary print "
				ls_keywords += "privileges procedure publication raiserror "
				ls_keywords += "readtext reference references release remote rename "
				ls_keywords += "resource restrict return revoke right rollback "
				ls_keywords += "save savepoint scroll select set share some "
				ls_keywords += "sqlcode sqlstate start stop subtransaction "
				ls_keywords += "synchronize syntax_error table temporary then "
				ls_keywords += "to top trigger truncate tsequal union "
				ls_keywords += "unique unknown update user using validate "
				ls_keywords += "values variable varying view when "
				ls_keywords += "where while with work writetext "
			case 1	// datatypes
				ls_keywords  = "binary bit char date datetime decimal double float image "
				ls_keywords += "int integer long money numeric real smalldatetime smallint "
				ls_keywords += "smallmoney text time timestamp tinyint varbinary varchar "
		end choose
	case "pb"
		choose case al_keyset
			case 0	// reserved words
				ls_keywords  = "alias and autoinstantiate call case catch choose "
				ls_keywords += "close commit connect constant continue create cursor "
				ls_keywords += "declare delete describe descriptor destroy disconnect "
				ls_keywords += "do dynamic else elseif end enumerated event execute "
				ls_keywords += "exit external false fetch finally first for forward "
				ls_keywords += "from function global goto halt if immediate indirect "
				ls_keywords += "insert into intrinsic is last library loop namespace "
				ls_keywords += "native next not of on open or parent post prepare prior "
				ls_keywords += "private privateread privatewrite procedure protected "
				ls_keywords += "protectedread protectedwrite prototypes public "
				ls_keywords += "readonly ref return rollback rpcfunc select "
				ls_keywords += "selectblob shared static step subroutine super system "
				ls_keywords += "systemread systemwrite then this throw throws to "
				ls_keywords += "trigger true try type until update updateblob using "
				ls_keywords += "variables while with within "
			case 1	// datatypes
				ls_keywords  = "any blob boolean byte char character date datetime decimal "
				ls_keywords += "dec double integer int longlong long longptr real string "
				ls_keywords += "time unsignedinteger unsignedint uint unsignedlong ulong "
		end choose
	case "ps1"
		choose case al_keyset
			case 0	// Keywords
				ls_keywords  = "begin break catch continue data do dynamicparam else elseif end "
				ls_keywords += "exit filter finally for foreach from function if in local param "
				ls_keywords += "private process return switch throw trap try until where while "
			case 1	// Cmdlets
				ls_keywords  = "add-computer add-content add-history add-member add-pssnapin add-type "
				ls_keywords += "checkpoint-computer clear-content clear-eventlog clear-history clear-item "
				ls_keywords += "clear-itemproperty clear-variable compare-object complete-transaction "
				ls_keywords += "connect-wsman convert-path convertfrom-csv convertfrom-securestring "
				ls_keywords += "convertfrom-stringdata convertto-csv convertto-html convertto-securestring "
				ls_keywords += "convertto-xml copy-item copy-itemproperty debug-process disable-computerrestore "
				ls_keywords += "disable-psbreakpoint disable-pssessionconfiguration disable-wsmancredssp "
				ls_keywords += "disconnect-wsman enable-computerrestore enable-psbreakpoint enable-psremoting "
				ls_keywords += "enable-pssessionconfiguration enable-wsmancredssp enter-pssession exit-pssession "
				ls_keywords += "export-alias export-clixml export-console export-counter export-csv "
				ls_keywords += "export-formatdata export-modulemember export-pssession foreach-object "
				ls_keywords += "format-custom format-list format-table format-wide get-acl get-alias "
				ls_keywords += "get-authenticodesignature get-childitem get-command get-computerrestorepoint "
				ls_keywords += "get-content get-counter get-credential get-culture get-date get-event "
				ls_keywords += "get-eventlog get-eventsubscriber get-executionpolicy get-formatdata get-help "
				ls_keywords += "get-history get-host get-hotfix get-item get-itemproperty get-job get-location "
				ls_keywords += "get-member get-module get-psbreakpoint get-pscallstack get-psdrive "
				ls_keywords += "get-psprovider get-pssession get-pssessionconfiguration get-pssnapin "
				ls_keywords += "get-pfxcertificate get-process get-random get-service get-tracesource "
				ls_keywords += "get-transaction get-uiculture get-unique get-variable get-wsmancredssp "
				ls_keywords += "get-wsmaninstance get-winevent get-wmiobject group-object import-alias "
				ls_keywords += "import-clixml import-counter import-csv import-localizeddata import-module "
				ls_keywords += "import-pssession invoke-command invoke-expression invoke-history invoke-item "
				ls_keywords += "invoke-wsmanaction invoke-wmimethod join-path limit-eventlog measure-command "
				ls_keywords += "measure-object move-item move-itemproperty new-alias new-event new-eventlog "
				ls_keywords += "new-item new-itemproperty new-module new-modulemanifest new-object new-psdrive "
				ls_keywords += "new-pssession new-pssessionoption new-service new-timespan new-variable "
				ls_keywords += "new-wsmaninstance new-wsmansessionoption new-webserviceproxy out-default "
				ls_keywords += "out-file out-gridview out-host out-null out-printer out-string pop-location "
				ls_keywords += "push-location read-host receive-job register-engineevent register-objectevent "
				ls_keywords += "register-pssessionconfiguration register-wmievent remove-computer remove-event "
				ls_keywords += "remove-eventlog remove-item remove-itemproperty remove-job remove-module "
				ls_keywords += "remove-psbreakpoint remove-psdrive remove-pssession remove-pssnapin "
				ls_keywords += "remove-variable remove-wsmaninstance remove-wmiobject rename-item "
				ls_keywords += "rename-itemproperty reset-computermachinepassword resolve-path restart-computer "
				ls_keywords += "restart-service restore-computer resume-service select-object select-string "
				ls_keywords += "select-xml send-mailmessage set-acl set-alias set-authenticodesignature "
				ls_keywords += "set-content set-date set-executionpolicy set-item set-itemproperty set-location "
				ls_keywords += "set-psbreakpoint set-psdebug set-pssessionconfiguration set-service "
				ls_keywords += "set-strictmode set-tracesource set-variable set-wsmaninstance "
				ls_keywords += "set-wsmanquickconfig set-wmiinstance show-eventlog sort-object split-path "
				ls_keywords += "start-job start-process start-service start-sleep start-transaction "
				ls_keywords += "start-transcript stop-computer stop-job stop-process stop-service "
				ls_keywords += "stop-transcript suspend-service tee-object test-computersecurechannel "
				ls_keywords += "test-connection test-modulemanifest test-path test-wsman trace-command "
				ls_keywords += "undo-transaction unregister-event unregister-pssessionconfiguration "
				ls_keywords += "update-formatdata update-list update-typedata use-transaction wait-event "
				ls_keywords += "wait-job wait-process where-object write-debug write-error write-eventlog "
				ls_keywords += "write-host write-output write-progress write-verbose write-warning "
			case 2	// Aliases
				ls_keywords  = "ac asnp cat cd chdir clc clear clhy cli clp cls clv compare "
				ls_keywords += "copy cp cpi cpp cvpa dbp del diff dir ebp echo epal epcsv "
				ls_keywords += "epsn erase etsn exsn fc fl foreach ft fw gal gbp gc gci "
				ls_keywords += "gcm gcs gdr ghy gi gjb gl gm gmo gp gps group gsn gsnp gsv "
				ls_keywords += "gu gv gwmi h history icm iex ihy ii ipal ipcsv ipmo ipsn "
				ls_keywords += "ise iwmi kill lp ls man md measure mi mount move mp mv nal "
				ls_keywords += "ndr ni nmo nsn nv ogv oh popd ps pushd pwd r rbp rcjb rd "
				ls_keywords += "rdr ren ri rjb rm rmdir rmo rni rnp rp rsn rsnp rv rvpa "
				ls_keywords += "rwmi sajb sal saps sasv sbp sc select set si sl sleep sort "
				ls_keywords += "sp spjb spps spsv start sv swmi tee type where wjb write "
			case 3	// Functions
				ls_keywords  = "clear-host disable-psremoting enable-psremoting get-verb help "
				ls_keywords += "importsystemmodules mkdir more prompt psedit tabexpansion "
		end choose
end choose

Return ls_keywords

end function

public function long of_getlinecount ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetLineCount
//
// PURPOSE:    This function returns the number of lines in the control
//
// RETURN:		The number of lines contained in the control
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETLINECOUNT)

end function

public function long of_getlinefrompos (long al_caretpos);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetLineFromPos
//
// PURPOSE:    This function returns the line that the caret is on
//
// RETURN:		The line number
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_LINEFROMPOSITION, al_caretpos) + 1

end function

public function string of_getlinetextfrompos (long al_caretpos);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetLineTextFromPos
//
// PURPOSE:    This function returns text of the line that the caret is on
//
// RETURN:		The line number
// -----------------------------------------------------------------------------

Long ll_line
String ls_line

ll_line = of_SendEditor(SCI_LINEFROMPOSITION, al_caretpos)

ls_line = Space(4096)
of_SendEditor(SCI_GETLINE, ll_line, ls_line)

Return Trim(ls_line)

end function

public function long of_getposfromline (long al_line);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetPosFromLine
//
// PURPOSE:    This function returns the position that the line starts on
//
// RETURN:		The position
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_POSITIONFROMLINE, al_line - 1)

end function

public function boolean of_getreadonly ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetReadOnly
//
// PURPOSE:    This function will return the state of read only.
//
// RETURN:		True=Read Only, False=Not Read Only
// -----------------------------------------------------------------------------

If of_SendEditor(SCI_GETREADONLY) = 0 Then
	Return False
Else
	Return True
End If

end function

public function long of_getstyleat (long al_pos);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetStyleAt
//
// PURPOSE:    This function returns the style of the given position
//
// RETURN:		The style number
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETSTYLEAT, al_pos)

end function

public subroutine of_getstylecharset (long al_style, ref long al_charsetnbr, ref string as_charsetdesc);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetStyleCharset
//
// PURPOSE:    This function will return the character set of a style 
//
// ARGUMENTS:  al_style			-	The style number
//					al_charsetnbr	-	The character set number
//					as_charsetdesc	-	The character set description
//
// RETURN:		None
// -----------------------------------------------------------------------------

al_charsetnbr = of_SendEditor(SCI_STYLEGETCHARACTERSET, al_style)

choose case al_charsetnbr
	case SC_CHARSET_ANSI
		as_charsetdesc = "ANSI"
	case SC_CHARSET_DEFAULT
		as_charsetdesc = "DEFAULT"
	case SC_CHARSET_BALTIC
		as_charsetdesc = "BALTIC"
	case SC_CHARSET_CHINESEBIG5
		as_charsetdesc = "CHINESEBIG5"
	case SC_CHARSET_EASTEUROPE
		as_charsetdesc = "EASTEUROPE"
	case SC_CHARSET_GB2312
		as_charsetdesc = "GB2312"
	case SC_CHARSET_GREEK
		as_charsetdesc = "GREEK"
	case SC_CHARSET_HANGUL
		as_charsetdesc = "HANGUL"
	case SC_CHARSET_MAC
		as_charsetdesc = "MAC"
	case SC_CHARSET_OEM
		as_charsetdesc = "OEM"
	case SC_CHARSET_RUSSIAN
		as_charsetdesc = "RUSSIAN"
	case SC_CHARSET_SHIFTJIS
		as_charsetdesc = "SHIFTJIS"
	case SC_CHARSET_SYMBOL
		as_charsetdesc = "SYMBOL"
	case SC_CHARSET_TURKISH
		as_charsetdesc = "TURKISH"
	case SC_CHARSET_JOHAB
		as_charsetdesc = "JOHAB"
	case SC_CHARSET_HEBREW
		as_charsetdesc = "HEBREW"
	case SC_CHARSET_ARABIC
		as_charsetdesc = "ARABIC"
	case SC_CHARSET_VIETNAMESE
		as_charsetdesc = "VIETNAMESE"
	case SC_CHARSET_THAI
		as_charsetdesc = "THAI"
	case else
		as_charsetdesc = String(al_charsetnbr)
end choose

end subroutine

public function long of_getsyscolor (long al_index);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetSysColor
//
// PURPOSE:    This function returns the color number for a system color.
//
// ARGUMENTS:	ai_index - The the color index.
//
// These are the argument values:
//
// Object                     Value Object                     Value
// -------------------------- ----- -------------------------- -----
// Scroll Bar                   0   Button Face                 15
// Desktop                      1   Button Shadow               16
// Active Title Bar             2   Disabled Text               17
// Inactive Title Bar           3   Button Text                 18
// Menu Bar                     4   Inactive Title Bar Text     19
// Window Background            5   Button Highlight            20
// Window Frame                 6   Button Dark Shadow          21
// Menu Text                    7   Button Light Shadow         22
// Window Text                  8   Tooltip Text                23
// Active Title Bar Text        9   Tooltip Background          24
// Active Border               10   Hyperlink                   26
// Inactive Border             11   Active Title Bar Gradient   27
// Application Workspace       12   Inactive Title Bar Gradient 28
// Highlight                   13   Flat Menu Highlight         29
// Highlight Text              14   Flat Menu Background        30
//
// RETURN:		Color number.
// -----------------------------------------------------------------------------

Return GetSysColor(al_index)

end function

public function long of_gettabwidth ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetTabWidth
//
// PURPOSE:    This function will return the current tab spacing
//
// RETURN:		Tab width
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETTABWIDTH)

end function

public function string of_gettext ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetText
//
// PURPOSE:    This function returns the text in the control
//
// RETURN:		The text contained in the control
// -----------------------------------------------------------------------------

String ls_text
Long ll_length

// get the length of the text
ll_length = of_SendEditor(SCI_GETTEXTLENGTH) + 1

ls_text = Space(ll_length)

of_SendEditor(SCI_GETTEXT, ll_length, ls_text)

Return ls_text

end function

public function long of_gettextheight (long al_line);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetTextHeight
//
// PURPOSE:    This function will return the pixel height of a line 
//
// ARGUMENTS:  al_line	- The line number
//
// RETURN:		Pixel height
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_TEXTHEIGHT, al_line)

end function

public function long of_gettextlength ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetTextLength
//
// PURPOSE:    This function returns the text length
//
// RETURN:		The length of the text contained in the control
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETTEXTLENGTH)

end function

public function long of_gettextwidth (long al_stylenumber, ref string as_text);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetTextWidth
//
// PURPOSE:    This function will return the pixel width of a string 
//             drawn in the given styleNumber
//
// ARGUMENTS:  al_stylenumber	- The styme number
//             as_text - the string to measure
//
// RETURN:		Width of the string
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_TEXTWIDTH, al_stylenumber, as_text)

end function

public function long of_getviewws ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetViewWs
//
// PURPOSE:    This function returns the current setting of the whitespaces display
//
// RETURN:		SCWS_INVISIBLE, SCWS_VISIBLEALWAYS or SCWS_VISIBLEAFTERINDENT
//	            see of_SetViewWs() for further info
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETVIEWWS)

end function

public function long of_getwhitespace ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetWhiteSpace
//
// PURPOSE:    This function returns the current setting of WhiteSpace
//
// RETURN:		See of_ShowWhiteSpace for values
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETVIEWWS)

end function

public function long of_getwrapmode ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetWrapMode
//
// PURPOSE:    This function returns the current setting of text wrapping
//
// RETURN:		See of_SetWrapMode for values
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETWRAPMODE)

end function

public function long of_getwrapvisualflags ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetWrapVisualFlags
//
// PURPOSE:    This function returns the current setting of the wrapping info
//
// RETURN:		See of_SetWrapVisualFlags for values
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETWRAPVISUALFLAGS)

end function

public function long of_getzoomlevel ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetZoomLevel
//
// PURPOSE:    This function will return the current zoom level.
//
// RETURN:		Zoom Level
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_GETZOOM)

end function

public subroutine of_gotoline (long al_line);// -----------------------------------------------------------------------------
// SCRIPT:     of_GotoLine
//
// PURPOSE:    This function will move the cursor to a specified line
//
// ARGUMENTS:  al_line	- The line to goto in the text
//
// RETURN:		None
// -----------------------------------------------------------------------------

// unfold if the line is hidden
of_SendEditor(SCI_ENSUREVISIBLEENFORCEPOLICY, al_line - 1)

// move the cursor to the specific line number
of_SendEditor(SCI_GOTOLINE, al_line - 1)

end subroutine

public subroutine of_inserttext (ref string as_text);// -----------------------------------------------------------------------------
// SCRIPT:     of_InsertText
//
// PURPOSE:    This function will insert text into the document
//
// ARGUMENTS:  as_text	- The text to be inserted
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_INSERTTEXT, -1, as_text)

end subroutine

public function boolean of_ismodified ();// -----------------------------------------------------------------------------
// SCRIPT:     of_IsModified
//
// PURPOSE:    This function returns whether text has been modified
//
// RETURN:		True=Text modified, False=Text not modified
// -----------------------------------------------------------------------------

If of_SendEditor(SCI_GETMODIFY) <= 0 Then
	Return False
Else
	Return True
End If

end function

public function boolean of_isovertype ();// -----------------------------------------------------------------------------
// SCRIPT:     of_IsOverType
//
// PURPOSE:    This function returns whether overtype is active
//
// RETURN:		True=On, False=Off
// -----------------------------------------------------------------------------

If of_SendEditor(SCI_GETOVERTYPE) = 1 Then
	Return True
Else
	Return False
End If

end function

public subroutine of_lefttrimselected ();// -----------------------------------------------------------------------------
// SCRIPT:     of_LeftTrimSelected
//
// PURPOSE:    This function removes leading spaces from selected lines.
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long caretPos, ll_start, ll_end, ll_line, ll_length
String ls_text, ls_replace

// get first selected line
caretPos = of_SendEditor(SCI_GETSELECTIONSTART)
ll_start = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

// get last selected line
caretPos = of_SendEditor(SCI_GETSELECTIONEND)
ll_end   = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

// if end of selection is start of the line, end on prior line
If ll_start = ll_end Then
Else
	If caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_end) Then
		ll_end = ll_end - 1
	End If
End If

of_SendEditor(SCI_BEGINUNDOACTION)

For ll_line = ll_start To ll_end
	// get line length
	ll_length = of_SendEditor(SCI_LINELENGTH, ll_line)
	// get line text
	ls_text = Space(ll_length)
	of_SendEditor(SCI_GETLINE, ll_line, ls_text)
	// LeftTrim the line
	If Left(ls_text, 1) = " " Then
		ls_replace = LeftTrim(ls_text)
		caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_line)
		of_SendEditor(SCI_SETTARGETSTART, caretPos)
		of_SendEditor(SCI_SETTARGETEND,   caretPos + Len(ls_text))
		of_SendEditor(SCI_REPLACETARGET, -1, ls_replace)
	End If
Next

of_SendEditor(SCI_ENDUNDOACTION)

// position at begining of last line
of_SendEditor(SCI_SETSEL, -1, of_SendEditor(SCI_POSITIONFROMLINE, ll_end))

end subroutine

public subroutine of_macrorecording (boolean ab_record);// -----------------------------------------------------------------------------
// SCRIPT:     of_MacroRecording
//
// PURPOSE:    This function will toggle macro recording mode.
//
// ARGUMENTS:  ab_record	- True=Start Recording, False=Stop Recording
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_record Then
	of_SendEditor(SCI_STARTRECORD, 1)
Else
	of_SendEditor(SCI_STOPRECORD, 0)
End If

end subroutine

public function boolean of_markeractive (long al_linenumber);// -----------------------------------------------------------------------------
// SCRIPT:     of_MarkerActive
//
// PURPOSE:    This function determines a marker is active on the line
//
// ARGUMENTS:  al_linenumber	- The line number to be checked
//
// RETURN:		True=Text to paste, False=No text to paste
// -----------------------------------------------------------------------------

If of_SendEditor(SCI_MARKERGET, al_linenumber - 1, MARKER_NUM) = 0 Then
	Return False
Else
	Return True
End If

end function

public subroutine of_markercolor (long al_index, long al_forecolor, long al_backcolor);// -----------------------------------------------------------------------------
// SCRIPT:     of_MarkerColor
//
// PURPOSE:    This function will update a marker's colors
//
// ARGUMENTS:  al_index			- The marker index being defined ( range 0-31 )
//					al_forecolor	- The foreground color
//					al_backcolor	- The background color
// -----------------------------------------------------------------------------

of_SendEditor(SCI_MARKERSETFORE, al_index, al_forecolor)
of_SendEditor(SCI_MARKERSETBACK, al_index, al_backcolor)

end subroutine

public subroutine of_markerdefine (long al_index, long al_type, long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_MarkerDefine
//
// PURPOSE:    This function will define a marker
//
// ARGUMENTS:  al_index	- The marker index being defined ( range 0-31 )
//					al_type	- The marker type ( SC_MARK_* )
//					al_color	- The background color
// -----------------------------------------------------------------------------

of_SendEditor(SCI_MARKERDEFINE,  al_index, al_type)
of_SendEditor(SCI_MARKERSETBACK, al_index, al_color)

end subroutine

public subroutine of_markerdelete (long al_index, long al_linenumber);// -----------------------------------------------------------------------------
// SCRIPT:     of_MarkerDelete
//
// PURPOSE:    This function will delete a marker from the current line
//
// ARGUMENTS:  al_index			- The marker index being deleted ( range 0-31 )
//					al_linenumber	- The line number to delete the marker from
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_MARKERDELETE, al_linenumber - 1, al_index)

end subroutine

public subroutine of_markerdelete (long al_linenumber);// -----------------------------------------------------------------------------
// SCRIPT:     of_MarkerDelete
//
// PURPOSE:    This function will delete a marker from the current line
//
// ARGUMENTS:  al_linenumber	- The line number to delete the marker from
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_MARKERDELETE, al_linenumber - 1, MARKER_NUM)

end subroutine

public subroutine of_markerdeleteall ();// -----------------------------------------------------------------------------
// SCRIPT:     of_MarkerDeleteAll
//
// PURPOSE:    This function will delete a marker from all lines.
//					If al_marker = -1 Then all marker numbers are deleted.
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_MARKERDELETEALL, MARKER_NUM)

end subroutine

public function long of_markernext (long al_linenumber);// -----------------------------------------------------------------------------
// SCRIPT:     of_MarkerNext
//
// PURPOSE:    This function will find the next marker
//
// ARGUMENTS:  al_linenumber	- The line number to start searching from
//
// RETURN:		The line number or -1 if not found
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_MARKERNEXT, al_linenumber, MARKER_MASK) + 1

end function

public function long of_markerprev (long al_linenumber);// -----------------------------------------------------------------------------
// SCRIPT:     of_MarkerPrev
//
// PURPOSE:    This function will find the previous marker
//
// ARGUMENTS:  al_linenumber	- The line number to start searching from
//
// RETURN:		The line number or -1 if not found
// -----------------------------------------------------------------------------

Return of_SendEditor(SCI_MARKERPREVIOUS, al_linenumber - 2, MARKER_MASK) + 1

end function

public subroutine of_paste ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Paste
//
// PURPOSE:    This function will paste text from the clipboard
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_PASTE)

end subroutine

public subroutine of_print (boolean ab_showdialog);// -----------------------------------------------------------------------------
// SCRIPT:     of_Print
//
// PURPOSE:    This function will print the current control text
//
// ARGUMENTS:  ab_showdialog	- True=Show Printer Dialog
//
// RETURN:		None
// -----------------------------------------------------------------------------

String ls_source, ls_font
Boolean lb_italic
Integer li_size, li_weight
Long ll_job

SetPointer(HourGlass!)

ll_job = PrintOpen("Scintilla Editor", ab_showdialog)
If ll_job > 0 Then
	ls_font = this.#FontName
	li_size = this.#TextSize * -1
	If this.ib_bold Then
		li_weight = 700
	Else
		li_weight = 400
	End If
	lb_italic = this.ib_italic
	PrintDefineFont(ll_job, 1, ls_font, li_size, li_weight, &
							Default!, AnyFont!, lb_italic, False)
	PrintSetFont(ll_job, 1)
	ls_source = this.of_GetText()
	Print(ll_job, ls_source)
	PrintClose(ll_job)
Else
	MessageBox("Print", "Failed to open print job!")
End If

end subroutine

public subroutine of_redo ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Redo
//
// PURPOSE:    This function will redo the previous change
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_REDO)

end subroutine

public subroutine of_registerimage (long al_index, ref string as_xpmdata);// -----------------------------------------------------------------------------
// SCRIPT:     of_RegisterImage
//
// PURPOSE:    This function registers an XPM image to be used by autocomplete.
//
// ARGUMENTS:  al_index		- Index of the image. When the word list is passed
//										to of_AutoCShow, add ?# after each word where #
//										is the image index. This is referred to as type
//										in the documentation.
//
//										Images can be converted here:
//										http://www.office-converter.com/Convert-to-XPM
//
//					as_xpmdata	- The XPM image data
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_REGISTERIMAGE, al_index, as_xpmdata)

end subroutine

public subroutine of_registerrgbaimage (long al_index, ref blob ablb_pixels, long al_width, long al_height);// -----------------------------------------------------------------------------
// SCRIPT:     of_RegisterRGBAImage
//
// PURPOSE:    This function registers an RGBA image to be used by autocomplete.
//
// ARGUMENTS:  al_index		- Index of the image. When the word list is passed
//										to of_AutoCShow, add ?# after each word where #
//										is the image index. This is referred to as type
//										in the documentation.
//					ablb_pixels	- The RGBA image data
//					al_width		- The width of the image
//					al_height	- The height of the image
//
// RETURN:		None
// -----------------------------------------------------------------------------

// set image width/height
of_SendEditor(SCI_RGBAIMAGESETWIDTH, al_width)
of_SendEditor(SCI_RGBAIMAGESETHEIGHT, al_height)

// register the image
of_SendEditor(SCI_REGISTERRGBAIMAGE, al_index, ablb_pixels)

end subroutine

public function long of_replaceall (ref string as_findstring, ref string as_replacestring);// -----------------------------------------------------------------------------
// SCRIPT:     of_ReplaceAll
//
// PURPOSE:    This function replaces all occurrences of a string in the text
//
// ARGUMENTS:  as_findstring		- The string to look for
//					as_replacestring	- The string to replace the find string
//
// RETURN:		The number of occurrences replaced
// -----------------------------------------------------------------------------

Boolean lb_found
Long ll_flags, ll_pos1, ll_pos2
Long ll_found, ll_hits, ll_ReplaceLen

// get search string length
If Len(as_findstring) = 0 Then Return 0

// set search flags
ll_flags = 0
If ib_MatchCase Then
	ll_flags += SCFIND_MATCHCASE
End If
If ib_WholeWord Then
	ll_flags += SCFIND_WHOLEWORD
End If
If ib_WordStart Then
	ll_flags += SCFIND_WORDSTART
End If
If ib_RegEx Then
	ll_flags += SCFIND_REGEXP
End If
of_SendEditor(SCI_SETSEARCHFLAGS, ll_flags)

// set the search range
ll_pos1 = 0
ll_pos2 = of_SendEditor(SCI_GETLENGTH)
of_SendEditor(SCI_SETTARGETSTART, ll_pos1)
of_SendEditor(SCI_SETTARGETEND,   ll_pos2)

// search for the string
ll_found = of_SendEditorLen(SCI_SEARCHINTARGET, as_findstring)
do while ll_found > -1
	lb_found = True
	If ib_IgnoreComment Then
		If of_IsCommented(ll_found) Then
			lb_found = False
		End If
	End If
	If lb_found Then
		ll_hits++
		// replace the occurrence
		If ib_RegEx Then
			ll_ReplaceLen = of_SendEditorLen(SCI_REPLACETARGETRE, as_replacestring)
		Else
			ll_ReplaceLen = of_SendEditorLen(SCI_REPLACETARGET, as_replacestring)
		End If
	End If
	// move start of search range
	ll_pos1 = ll_found + ll_ReplaceLen
	ll_pos2 = of_SendEditor(SCI_GETLENGTH)
	of_SendEditor(SCI_SETTARGETSTART, ll_pos1)
	of_SendEditor(SCI_SETTARGETEND,   ll_pos2)
	// search for the string again
	ll_found = of_SendEditorLen(SCI_SEARCHINTARGET, as_findstring)
loop

Return ll_hits

end function

public subroutine of_righttrimselected ();// -----------------------------------------------------------------------------
// SCRIPT:     of_RightTrimSelected
//
// PURPOSE:    This function removes trailing spaces from selected lines.
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long caretPos, ll_start, ll_end, ll_line, ll_length
String ls_text, ls_replace

// get first selected line
caretPos = of_SendEditor(SCI_GETSELECTIONSTART)
ll_start = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

// get last selected line
caretPos = of_SendEditor(SCI_GETSELECTIONEND)
ll_end   = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

// if end of selection is start of the line, end on prior line
If ll_start = ll_end Then
Else
	If caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_end) Then
		ll_end = ll_end - 1
	End If
End If

of_SendEditor(SCI_BEGINUNDOACTION)

For ll_line = ll_start To ll_end
	// get line length
	ll_length = of_SendEditor(SCI_LINELENGTH, ll_line)
	// get line text
	ls_text = Space(ll_length)
	of_SendEditor(SCI_GETLINE, ll_line, ls_text)
	// remove CR/LF from end of text
	If Right(ls_text, 1) = "~n" Then
		ls_text = Left(ls_text, Len(ls_text) - 1)
	End If
	If Right(ls_text, 1) = "~r" Then
		ls_text = Left(ls_text, Len(ls_text) - 1)
	End If
	// RightTrim the line
	If Right(ls_text, 1) = " " Then
		ls_replace = RightTrim(ls_text)
		caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_line)
		of_SendEditor(SCI_SETTARGETSTART, caretPos)
		of_SendEditor(SCI_SETTARGETEND,   caretPos + Len(ls_text))
		of_SendEditor(SCI_REPLACETARGET, -1, ls_replace)
	End If
Next

of_SendEditor(SCI_ENDUNDOACTION)

// position at begining of last line
of_SendEditor(SCI_SETSEL, -1, of_SendEditor(SCI_POSITIONFROMLINE, ll_end))

end subroutine

public subroutine of_selectall ();// -----------------------------------------------------------------------------
// SCRIPT:     of_SelectAll
//
// PURPOSE:    This function will select all text in the document
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SELECTALL)

end subroutine

public subroutine of_setcaretlineback (boolean ab_visible);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetCaretLineBack
//
// PURPOSE:    This function will set toggle a background color that will
//					automatically show on the line where the caret (cursor) is.
//
// ARGUMENTS:  ab_visible	- True=Visible
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_visible Then
	of_SendEditor(SCI_SETCARETLINEVISIBLE, 1)
	of_SendEditor(SCI_SETCARETLINEBACK, il_CaretLineColor)
Else
	of_SendEditor(SCI_SETCARETLINEVISIBLE, 0)
End If

end subroutine

public subroutine of_setcharacterset (long al_charset);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetCharacterSet
//
// PURPOSE:    This function will set the character set for all styles.
//
// ARGUMENTS:	al_charset	-	The character set
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long ll_style

For ll_style = 0 To STYLE_DEFAULT
	of_SetStyleCharset(ll_style, al_charset)
Next

end subroutine

public subroutine of_setstylecharset (long al_style, long al_charset);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetStyleCharset
//
// PURPOSE:    This function will set the character set for the style.
//
// ARGUMENTS:	al_style		-	The style to update
//					al_charset	-	The character set
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_STYLESETCHARACTERSET, al_style, al_charset)

end subroutine

public subroutine of_setdwelltime (long al_dwelldelay);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetDwellTime
//
// PURPOSE:    This function will set mouse dwell time.
//
// ARGUMENTS:  al_dwelldelay	- Time in milliseconds
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETMOUSEDWELLTIME, al_dwelldelay)

end subroutine

public subroutine of_setedgecolor (long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetEdgeColor
//
// PURPOSE:    This function will set the edge colour. Edge mode is used to
//					indicate lines that exceed a certain number fo characters.
//
// ARGUMENTS:  al_color	- The edge color
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETEDGECOLOUR, al_color)

end subroutine

public subroutine of_setedgecolumn (long al_column);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetEdgeColumn
//
// PURPOSE:    This function will set the edge column. Edge mode is used to
//					indicate lines that exceed a certain number fo characters.
//
// ARGUMENTS:  al_column	- The edge column
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETEDGECOLUMN, al_column)

end subroutine

public subroutine of_setedgemode (long al_mode);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetEdgeMode
//
// PURPOSE:    This function will set the edge mode. Edge mode is used to
//					indicate lines that exceed a certain number fo characters.
//
// ARGUMENTS:  al_mode	- The edge mode
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETEDGEMODE, al_mode)

end subroutine

public subroutine of_seteolmode (long al_eolmode);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetEOLMode
//
// PURPOSE:    Sets the EOL characters used when the Enter key is pressed.
//
// ARGUMENTS:  al_eolmode	- SC_EOL_CRLF (0), SC_EOL_CR (1), or SC_EOL_LF (2).
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETEOLMODE, al_eolmode)

end subroutine

public subroutine of_setfindoptions (boolean ab_matchcase, boolean ab_wholeword, boolean ab_wordstart, boolean ab_regex, boolean ab_backwards, boolean ab_ignorecomment);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetFindOptions
//
// PURPOSE:    This function sets instance variables with Find/Replace options.
//
// ARGUMENTS:  ab_matchcase		- A match only occurs with text that matches the
//											  case of the search string.
//					ab_wholeword		- A match only occurs if the characters before
//											  and after are not word characters.
//					ab_wordstart		- A match only occurs if the character before is
//											  not a word character.
//					ab_regex				- Use Regular Expression search.
//					ab_backwards		- Search from the back of the file to the top.
//					ab_ignorecomment	- Hits within comments are ignored.
// -----------------------------------------------------------------------------

ib_MatchCase		= ab_MatchCase
ib_WholeWord		= ab_WholeWord
ib_WordStart		= ab_WordStart
ib_RegEx				= ab_RegEx
ib_Backwards		= ab_Backwards
ib_IgnoreComment	= ab_IgnoreComment

end subroutine

public subroutine of_setfontbold (boolean ab_bold);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetFontBold
//
// PURPOSE:    This function will toggle font bold on/off
//
// ARGUMENTS:  ab_bold	- True=Bold, False=Not bold
//
// RETURN:		None
// -----------------------------------------------------------------------------

ib_bold = ab_bold

If ab_bold Then
	of_SendEditor(SCI_STYLESETBOLD, STYLE_DEFAULT, 1)
Else
	of_SendEditor(SCI_STYLESETBOLD, STYLE_DEFAULT, 0)
End If

end subroutine

public subroutine of_setfontitalic (boolean ab_italic);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetFontItalic
//
// PURPOSE:    This function will toggle font italic on/off
//
// ARGUMENTS:  ab_italic	- True=Italic, False=Not Italic
//
// RETURN:		None
// -----------------------------------------------------------------------------

ib_italic = ab_italic

If ab_italic Then
	of_SendEditor(SCI_STYLESETITALIC, STYLE_DEFAULT, 1)
Else
	of_SendEditor(SCI_STYLESETITALIC, STYLE_DEFAULT, 0)
End If

end subroutine

public subroutine of_setkeywords (long al_wordset, ref string as_keywords);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetKeyWords
//
// PURPOSE:    This function loads a word list in the given wordset
//
// ARGUMENTS:  al_wordset  - The number of wordset
//										(0 to 9 - usage is lexer-dependant)
//             as_keywords - A list of words. It can be blank, tab, 
//										~n or ~r separated
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETKEYWORDS, al_wordset, as_keywords)

end subroutine

public subroutine of_setmarginwidth (long al_margin, long al_width);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetMarginWidth
//
// PURPOSE:    This function will change the given margin width
//
// ARGUMENTS:  ai_margin	- The margin nulber (0..4)
//             ai_width		- the width in pixels
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETMARGINWIDTHN, al_margin, al_width)

end subroutine

public subroutine of_setnotmodified ();// -----------------------------------------------------------------------------
// SCRIPT:     of_SetNotModified
//
// PURPOSE:    This function will mark the document as unchanged.
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_EMPTYUNDOBUFFER)

of_SendEditor(SCI_SETSAVEPOINT)

end subroutine

public subroutine of_setovertype (boolean ab_overtype);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetOvertype
//
// PURPOSE:    This function will toggle overtype on/off
//
// ARGUMENTS:  ab_overtype	- True=On, False=Off
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_overtype Then
	of_SendEditor(SCI_SETOVERTYPE, 1)
Else
	of_SendEditor(SCI_SETOVERTYPE, 0)
End If

end subroutine

public subroutine of_setproperty (string as_keyword, string as_value);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetProperty
//
// PURPOSE:    This function will set lexer properties
//
// ARGUMENTS:  as_keyword	- The property name
//             as_value		- The value of the property
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_Sendeditor(SCI_SETPROPERTY, as_keyword, as_value)

end subroutine

public subroutine of_setseparator (character ac_separator);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetSeparator
//
// PURPOSE:    This function changes the separator character for the User List
//					and Autocomplete popup list.
//
// ARGUMENTS:  ac_separator	- The character that separates the list.
//
// RETURN:		None
// -----------------------------------------------------------------------------

SciSend(ip_hSciWnd, SCI_AUTOCSETSEPARATOR, Asc(ac_separator), 0)

end subroutine

public subroutine of_setstylebold (long al_style, boolean ab_option);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetStyleBold
//
// PURPOSE:    This function will toggle bold on/off for the style.
//
// ARGUMENTS:  al_style		- The number of the style
// 				ab_option	- True=Bold, False=Not Bold
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_option Then
	of_SendEditor(SCI_STYLESETBOLD, al_style, 1)
Else
	of_SendEditor(SCI_STYLESETBOLD, al_style, 0)
End If

end subroutine

public subroutine of_setstyleeolfilled (long al_style, boolean ab_option);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetStyleEOLFilled
//
// PURPOSE:    This function will toggle EOL Fill on/off for the style.
//
// ARGUMENTS:  al_style		- The number of the style
//             ab_option	- True=Fill to EOL, False=Do not fill to EOL
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_option Then
	of_SendEditor(SCI_STYLESETEOLFILLED, al_style, 1)
Else
	of_SendEditor(SCI_STYLESETEOLFILLED, al_style, 0)
End If

end subroutine

public subroutine of_setstylefont (long al_style, string as_font);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetStyleFont
//
// PURPOSE:    This function sets the font for the style.
//
// ARGUMENTS:  al_style	- The number of the style
// 				as_font	- The font name
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_STYLESETFONT, al_style, as_font)

end subroutine

public subroutine of_setstyleitalic (long al_style, boolean ab_option);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetStyleItalic
//
// PURPOSE:    This function will toggle italic on/off for the style.
//
// ARGUMENTS:  al_style		- The number of the style
// 				ab_option	- True=Italic, False=Not Italic
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_option Then
	of_SendEditor(SCI_STYLESETITALIC, al_style, 1)
Else
	of_SendEditor(SCI_STYLESETITALIC, al_style, 0)
End If

end subroutine

public subroutine of_setstylesize (long al_style, long al_size);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetStyleSize
//
// PURPOSE:    This function sets the font size for the style.
//
// ARGUMENTS:  al_style	- The number of the style
// 				al_size	- The font size
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_STYLESETSIZE, al_style, al_size)

end subroutine

public subroutine of_setstyleunderline (long al_style, boolean ab_option);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetStyleUnderline
//
// PURPOSE:    This function will toggle underline on/off for the style.
//
// ARGUMENTS:  al_style		- The number of the style
// 				ab_option	- True=Underline, False=Not Underline
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_option Then
	of_SendEditor(SCI_STYLESETUNDERLINE, al_style, 1)
Else
	of_SendEditor(SCI_STYLESETUNDERLINE, al_style, 0)
End If

end subroutine

public subroutine of_setusepopup (boolean ab_usepopup);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetUsePopup
//
// PURPOSE:    This function will toggle standard Popup menu on/off
//
// ARGUMENTS:  ab_usepopup	- True=On, False=Off
//
// RETURN:		None
// -----------------------------------------------------------------------------

ib_usepopup = ab_usepopup

If ab_usepopup Then
	of_SendEditor(SCI_USEPOPUP, SC_POPUP_ALL)
Else
	of_SendEditor(SCI_USEPOPUP, SC_POPUP_NEVER)
End If

end subroutine

public subroutine of_setviewws (long al_wsmode);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetViewWs
//
// PURPOSE:    This function will change the display of the whitespaces
//             of_ShowWhiteSpace can toggle the display
//             of_SetViewWs enables a little finer tuning, it is especially useful to display python code
//
// ARGUMENTS:  al_wsmode - the type of display
//              Possible values :
//						SCWS_INVISIBLE				The normal display mode with white space displayed 
//														as an empty background colour.
//						SCWS_VISIBLEALWAYS  		White space characters are drawn as dots and arrows,
//						SCWS_VISIBLEAFTERINDENT White space used for indentation is displayed normally
//														but after the first visible character, 
//														it is shown as dots and arrows.
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETVIEWWS, al_wsmode)

end subroutine

public subroutine of_setwhitespaceback (boolean ab_option, long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetWhitespaceBack
//
// PURPOSE:    This function will change the background color of the whitespace.
//
// ARGUMENTS:	ab_option	- True=Use the color, False=Do not use the color
//             al_color		- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_option Then
	of_SendEditor(SCI_SETWHITESPACEBACK, 1, al_color)
Else
	of_SendEditor(SCI_SETWHITESPACEBACK, 0, al_color)
End If

end subroutine

public subroutine of_setwhitespacefore (boolean ab_option, long al_color);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetWhitespaceFore
//
// PURPOSE:    This function will change the foreground color of the whitespace.
//
// ARGUMENTS:	ab_option	- True=Use the color, False=Do not use the color
//             al_color		- The color code
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_option Then
	of_SendEditor(SCI_SETWHITESPACEFORE, 1, al_color)
Else
	of_SendEditor(SCI_SETWHITESPACEFORE, 0, al_color)
End If

end subroutine

public subroutine of_setwrapmode (long al_wrapmode);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetWrapMode
//
// PURPOSE:    This function will set the text wrapping mode
//
// ARGUMENTS:  al_wrapmode	- The wrapping mode:
//							SC_WRAP_NONE - wrapping is disabled
//							SC_WRAP_WORD - enable wrapping on word boundaries
//							SC_WRAP_CHAR - enable wrapping between any characters
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETWRAPMODE, al_wrapmode)

end subroutine

public subroutine of_setwrapvisualflags (long al_wrapvisualflags);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetWrapVisualFlags
//
// PURPOSE:    This function will set the text wrapping indicators display mode.
//
// ARGUMENTS:  al_wrapvisualflags	- The display mode:
//						SC_WRAPVISUALFLAG_NONE	- No visual flags
//						SC_WRAPVISUALFLAG_END	- Visual flag at end of subline of
//															a wrapped line
//						SC_WRAPVISUALFLAG_START	- Visual flag at begin of subline of
//								a wrapped line. Subline is indented	by at least 1 to
//								make room for the flag.
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETWRAPVISUALFLAGS, al_wrapvisualflags)

end subroutine

public subroutine of_showeol (boolean ab_show);// -----------------------------------------------------------------------------
// SCRIPT:     of_ShowEOL
//
// PURPOSE:    This function will toggle end-of-line marks on/off
//
// ARGUMENTS:  ab_show	- True=Show EOL marks, False=Do not show them
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_show Then
	of_SendEditor(SCI_SETVIEWEOL, 1)
Else
	of_SendEditor(SCI_SETVIEWEOL, 0)
End If

end subroutine

public subroutine of_showwhitespace (boolean ab_show);// -----------------------------------------------------------------------------
// SCRIPT:     of_ShowWhiteSpace
//
// PURPOSE:    This function will toggle white space on/off
//
// ARGUMENTS:  ab_show	- True=Show white space, False=Do not show them
//
// RETURN:		None
// -----------------------------------------------------------------------------

If ab_show Then
	of_SendEditor(SCI_SETVIEWWS, SCWS_VISIBLEALWAYS)
Else
	of_SendEditor(SCI_SETVIEWWS, SCWS_INVISIBLE)
End If

end subroutine

public function boolean of_sortarray (ref string as_array[], string as_order);// -----------------------------------------------------------------------------
// SCRIPT:     of_SortArray
//
// PURPOSE:    This function sorts the passed array using a DataStore created
//					on-the-fly.
//
//					This is based on code from Real Gagnon:
//					http://www.rgagnon.com/pbdetails/pb-0114.html
//
// ARGUMENTS:  as_array - Array of values to sort
//					as_order - The sort order:
//
//					Order value						Resulting sort order
//					------------------------	---------------------------
//					a, asc, ascending, ai, i	Case-insensitive ascending
//					d, desc, descending, di		Case-insensitive descending
//					as, s								Case-sensitive ascending
//					ds									Case-sensitive descending
//
// RETURN:		True=Success, False=Error
// -----------------------------------------------------------------------------

DataStore lds_sort
String ls_source, ls_error
Long ll_idx, ll_max, ll_len, ll_maxlen
Integer li_rc

// determine maximum length of values
ll_max = UpperBound(as_array)
If ll_max = 0 Then Return False
For ll_idx = 1 To ll_max
	ll_len = Len(as_array[ll_idx])
	If ll_len > ll_maxlen Then
		ll_maxlen = ll_len
	End If
Next

// build DataWindow source code
ls_source = "release 6; datawindow( processing=0 ) " + &
				"table(column=(type=char(" + String(ll_maxlen) + &
				") name=array dbname=~"array~" ) )"

// create DataStore
lds_sort = Create DataStore
li_rc = lds_sort.Create(ls_source, ls_error)
If li_rc = 1 Then
	// put data into DataStore
	lds_sort.Object.array.Current = as_array
	// sort the data
	lds_sort.SetSort("array " + as_order)
	lds_sort.Sort()
	// set array to sorted data
	as_array = lds_sort.Object.array.Current
Else
	Return False
End If

// destroy DataStore
Destroy lds_sort

Return True

end function

public subroutine of_sortselected (string as_order);// -----------------------------------------------------------------------------
// SCRIPT:     of_SortSelected
//
// PURPOSE:    This function sorts the selected lines.
//
// ARGUMENTS:  as_order - The sort order:
//
//					Order value						Resulting sort order
//					------------------------	---------------------------
//					a, asc, ascending, ai, i	Case-insensitive ascending
//					d, desc, descending, di		Case-insensitive descending
//					as, s								Case-sensitive ascending
//					ds									Case-sensitive descending
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long caretPos, ll_start, ll_end, ll_line, ll_length, ll_selected
String ls_text, ls_array[]

// get first selected line
caretPos = of_SendEditor(SCI_GETSELECTIONSTART)
ll_start = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

// get last selected line
caretPos = of_SendEditor(SCI_GETSELECTIONEND)
ll_end   = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

// if end of selection is start of the line, end on prior line
If ll_start = ll_end Then
Else
	If caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_end) Then
		ll_end = ll_end - 1
	End If
End If

// copy text into array
For ll_line = ll_start To ll_end
	// get line length
	ll_length = of_SendEditor(SCI_LINELENGTH, ll_line)
	// get line text
	ls_text = Space(ll_length)
	of_SendEditor(SCI_GETLINE, ll_line, ls_text)
	// put line of text into array
	ll_selected = UpperBound(ls_array) + 1
	ls_array[ll_selected] = ls_text
Next

// sort ascending
of_SortArray(ls_array, as_order)

of_SendEditor(SCI_BEGINUNDOACTION)

// copy sorted array back into control
ll_selected = 0
For ll_line = ll_start To ll_end
	// get line length
	ll_length = of_SendEditor(SCI_LINELENGTH, ll_line)
	ll_selected = ll_selected + 1
	// paste in text
	caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_line)
	of_SendEditor(SCI_SETTARGETSTART, caretPos)
	of_SendEditor(SCI_SETTARGETEND,   caretPos + ll_length)
	of_SendEditor(SCI_REPLACETARGET, -1, ls_array[ll_selected])
Next

of_SendEditor(SCI_ENDUNDOACTION)

// position at begining of last line
of_SendEditor(SCI_SETSEL, -1, of_SendEditor(SCI_POSITIONFROMLINE, ll_end))

end subroutine

public function long of_split (string as_text, string as_sep, ref string as_array[]);// -----------------------------------------------------------------------------
// SCRIPT:     of_Split
//
// PURPOSE:    This function splits a string into an array.
//
// ARGUMENTS:  as_text	- The text to be split
//					as_sep	- The separator characters
//					as_array	- By ref output array
//
//	RETURN:		The number of items in the array
//
// DATE        CHANGED BY	DESCRIPTION OF CHANGE / REASON
// ----------  ----------  -----------------------------------------------------
// 10/19/2016  RolandS		Initial creation
// -----------------------------------------------------------------------------

String ls_empty[], ls_work
Long ll_pos

as_array = ls_empty

If IsNull(as_text) Or as_text = "" Then Return 0

ll_pos = Pos(as_text, as_sep)
DO WHILE ll_pos > 0
	ls_work = Trim(Left(as_text, ll_pos - 1))
	as_text = Trim(Mid(as_text, ll_pos + Len(as_sep)))
	as_array[UpperBound(as_array) + 1] = ls_work
	ll_pos = Pos(as_text, as_sep)
LOOP
If Len(as_text) > 0 Then
	as_array[UpperBound(as_array) + 1] = as_text
End If

Return UpperBound(as_array)

end function

public subroutine of_uncommentselected ();// -----------------------------------------------------------------------------
// SCRIPT:     of_UnCommentSelected
//
// PURPOSE:    This function removes comment characters from selected lines.
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long caretPos, ll_start, ll_end, ll_line, ll_length
String ls_text, ls_replace

// get first selected line
caretPos = of_SendEditor(SCI_GETSELECTIONSTART)
ll_start = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

// get last selected line
caretPos = of_SendEditor(SCI_GETSELECTIONEND)
ll_end   = of_SendEditor(SCI_LINEFROMPOSITION, caretPos)

// if end of selection is start of the line, end on prior line
If ll_start = ll_end Then
Else
	If caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_end) Then
		ll_end = ll_end - 1
	End If
End If

of_SendEditor(SCI_BEGINUNDOACTION)

// remove comment characters
For ll_line = ll_start To ll_end
	// get line length
	ll_length = of_SendEditor(SCI_LINELENGTH, ll_line)
	// get line text
	ls_text = Space(ll_length)
	of_SendEditor(SCI_GETLINE, ll_line, ls_text)
	If Left(ls_text, Len(is_commentchar1)) = is_commentchar1 Then
		caretPos = of_SendEditor(SCI_POSITIONFROMLINE, ll_line)
		of_SendEditor(SCI_SETTARGETSTART, caretPos)
		of_SendEditor(SCI_SETTARGETEND,   caretPos + Len(is_commentchar1))
		of_SendEditor(SCI_REPLACETARGET, 0, ls_replace)
	End If
Next

of_SendEditor(SCI_ENDUNDOACTION)

// position at begining of last line
of_SendEditor(SCI_SETSEL, -1, of_SendEditor(SCI_POSITIONFROMLINE, ll_end))

end subroutine

public subroutine of_undo ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Undo
//
// PURPOSE:    This function will undo the previous change
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_UNDO)

end subroutine

public subroutine of_userlistshow (long al_listtype, ref string as_list);// -----------------------------------------------------------------------------
// SCRIPT:     of_UserListShow
//
// PURPOSE:    This function causes an user list window to appear.
//
// ARGUMENTS:  al_listtype	- Returned to the scn_userlistselection event
//					as_list		- The list of words to display
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_USERLISTSHOW, al_listtype, as_list)

end subroutine

public subroutine of_wordcap ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Wordcap
//
// PURPOSE:    This function will wordcap the selected text
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long ll_idx, ll_max
String ls_value, ls_lines[]

ll_max = of_Split(of_GetSelectedText(), "~r~n", ls_lines)
For ll_idx = 1 To ll_max
	ls_lines[ll_idx] = Wordcap(ls_lines[ll_idx])
	If ll_idx = 1 Then
		ls_value = ls_lines[ll_idx]
	Else
		ls_value = ls_value + "~r~n" + ls_lines[ll_idx]
	End If
Next

of_ReplaceSelectedText(ls_value)

end subroutine

public subroutine of_zoomin ();// -----------------------------------------------------------------------------
// SCRIPT:     of_ZoomIn
//
// PURPOSE:    This function will zoom in the text.
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_ZOOMIN)

end subroutine

public subroutine of_zoomlevel (long al_level);// -----------------------------------------------------------------------------
// SCRIPT:     of_ZoomLevel
//
// PURPOSE:    This function sets the Zoom level.
//
//					Valid range is -10 to +20.
//
// ARGUMENTS:  al_level	- The zoom level
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_SETZOOM, al_level)

end subroutine

public subroutine of_zoomout ();// -----------------------------------------------------------------------------
// SCRIPT:     of_ZoomOut
//
// PURPOSE:    This function will zoom out the text.
//
// RETURN:		None
// -----------------------------------------------------------------------------

of_SendEditor(SCI_ZOOMOUT)

end subroutine

public function boolean of_setlanguage (string as_language);// -----------------------------------------------------------------------------
// SCRIPT:     of_SetLanguage
//
// PURPOSE:    This function will set the text language
//
// ARGUMENTS:  as_language	- The language code
//
// RETURN:		None
// -----------------------------------------------------------------------------

Long ll_Return
Longptr lp_Lexer

// remove existing lexer
of_SendEditor(SCI_SETILEXER, SCLEX_NULL)

// create the lexer
lp_Lexer = CreateLexer(Lower(as_language))
If lp_Lexer > 0 Then
	ll_Return = of_SendEditor(SCI_SETILEXER, 0, lp_Lexer)
	Return True
End If

Return False

end function

public function boolean of_set_json ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Set_JSON
//
// PURPOSE:    This function will set the language, keywords and colors
//					for JSON files.
//
// RETURN:		None
// -----------------------------------------------------------------------------

this.SetRedraw(False)

// set the language
If Not of_SetLanguage("json") Then
	Return False
End If

// set background/default text/select color
of_SetMarginBackColor(GetSysColor(4))
of_SetMarginTextColor(of_Color("Navy"))
of_SetFoldBackColor(of_Color("Navy"))
of_SetFoldForeColor(GetSysColor(4))
of_SetBackColor(of_Color("White"))
of_SetTextColor(of_Color("Black"))
of_SetSelectColor(RGB(166,202,240))
of_SetCaretColor(of_Color("Black"))
of_SetCaretLineColor(RGB(232,232,255))

// set language color
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_NUMBER, of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_STRING, RGB(128,0,255))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_STRINGEOL, RGB(128,0,255))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_PROPERTYNAME, of_Color("Maroon"))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_ESCAPESEQUENCE, of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_LINECOMMENT, of_Color("Green"))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_BLOCKCOMMENT, of_Color("Green"))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_OPERATOR, of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_URI, of_Color("Black"))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_COMPACTIRI, of_Color("Black"))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_KEYWORD, of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_LDKEYWORD, of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_JSON_ERROR, of_Color("Green"))

// allow user to override colors
this.Event ue_SetLanguageColors()

// set the comment characters
is_commentchar1 = ""
is_commentchar2 = ""

// enable folding
of_EnableFolding()

this.SetRedraw(True)

Return True

end function

public function boolean of_set_powerbuilder ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Set_PowerBuilder
//
// PURPOSE:    This function will set the language, keywords and colors
//					for PowerBuilder files.
//
// RETURN:		None
// -----------------------------------------------------------------------------

String ls_keywords, ls_datatypes

this.SetRedraw(False)

// set the language
If Not of_SetLanguage("cppnocase") Then
	Return False
End If

// set background/default text/select color
of_SetMarginBackColor(GetSysColor(4))
of_SetMarginTextColor(of_Color("Navy"))
of_SetFoldBackColor(of_Color("Navy"))
of_SetFoldForeColor(GetSysColor(4))
of_SetBackColor(of_Color("White"))
of_SetTextColor(of_Color("Black"))
of_SetSelectColor(RGB(166,202,240))
of_SetCaretColor(of_Color("Black"))
of_SetCaretLineColor(RGB(232,232,255))

// set language color
of_SendEditor(SCI_STYLESETFORE, SCE_C_COMMENT,		of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_C_COMMENTLINE,	of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_C_COMMENTDOC,	of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_C_NUMBER,		of_Color("Navy"))
of_SendEditor(SCI_STYLESETFORE, SCE_C_WORD,			of_Color("Green"))
of_SendEditor(SCI_STYLESETFORE, SCE_C_STRING,		of_Color("Maroon"))
of_SendEditor(SCI_STYLESETFORE, SCE_C_CHARACTER,	of_Color("Maroon"))
of_SendEditor(SCI_STYLESETFORE, SCE_C_WORD2,			of_Color("Purple"))

// allow user to override colors
this.Event ue_SetLanguageColors()

// set the comment characters
is_commentchar1 = "//"
is_commentchar2 = "/*"

// set the keywords
ls_keywords  = of_GetKeywords(0, "pb")
of_SetKeyWords(0, ls_keywords)
ls_datatypes = of_GetKeywords(1, "pb")
of_SetKeyWords(1, ls_datatypes)

this.SetRedraw(True)

Return True

end function

public function boolean of_set_powershell ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Set_PowerShell
//
// PURPOSE:    This function will set the language, keywords and colors
//					for PowerShell files.
//
// RETURN:		None
// -----------------------------------------------------------------------------

String ls_keywords, ls_datatypes

this.SetRedraw(False)

// set the language
If Not of_SetLanguage("powershell") Then
	Return False
End If

// set background/default text/select color
of_SetMarginBackColor(GetSysColor(4))
of_SetMarginTextColor(of_Color("Navy"))
of_SetFoldBackColor(of_Color("Navy"))
of_SetFoldForeColor(GetSysColor(4))
of_SetBackColor(of_Color("White"))
of_SetTextColor(of_Color("Black"))
of_SetSelectColor(RGB(166,202,240))
of_SetCaretColor(of_Color("Black"))
of_SetCaretLineColor(RGB(232,232,255))

// set language color
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_COMMENT,		of_Color("Green"))
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_STRING,		of_Color("Maroon"))
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_CHARACTER,	of_Color("Maroon"))
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_NUMBER,		of_Color("Red"))
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_VARIABLE,		of_Color("Purple"))
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_OPERATOR,		of_Color("Black"))
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_IDENTIFIER,	of_Color("Black"))
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_KEYWORD,		of_Color("Navy"))
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_CMDLET,		of_Color("Teal"))
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_ALIAS,			of_Color("Teal"))
of_SendEditor(SCI_STYLESETFORE, SCE_POWERSHELL_FUNCTION,		of_Color("Olive"))

// allow user to override colors
this.Event ue_SetLanguageColors()

// set the comment characters
is_commentchar1 = "#"
is_commentchar2 = ""

// set the keywords
ls_keywords  = of_GetKeywords(0, "ps1")
of_SetKeyWords(0, ls_keywords)	// Keywords
ls_datatypes = of_GetKeywords(1, "ps1")
of_SetKeyWords(1, ls_datatypes)	// Cmdlets
ls_datatypes = of_GetKeywords(2, "ps1")
of_SetKeyWords(2, ls_datatypes)	// Aliases
ls_datatypes = of_GetKeywords(3, "ps1")
of_SetKeyWords(3, ls_datatypes)	// Functions

// enable folding
of_EnableFolding()

this.SetRedraw(True)

Return True

end function

public function boolean of_set_sql ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Set_SQL
//
// PURPOSE:    This function will set the language, keywords and colors
//					for SQL files.
//
// RETURN:		None
// -----------------------------------------------------------------------------

String ls_keywords, ls_datatypes

this.SetRedraw(False)

// set the language
If Not of_SetLanguage("sql") Then
	Return False
End If

// set background/default text/select color
of_SetMarginBackColor(GetSysColor(4))
of_SetMarginTextColor(of_Color("Navy"))
of_SetFoldBackColor(of_Color("Navy"))
of_SetFoldForeColor(GetSysColor(4))
of_SetBackColor(of_Color("White"))
of_SetTextColor(of_Color("Black"))
of_SetSelectColor(RGB(166,202,240))
of_SetCaretColor(of_Color("Black"))
of_SetCaretLineColor(RGB(232,232,255))

// set language color
of_SendEditor(SCI_STYLESETFORE, SCE_SQL_COMMENT,		of_Color("Green"))
of_SendEditor(SCI_STYLESETFORE, SCE_SQL_COMMENTLINE,	of_Color("Green"))
of_SendEditor(SCI_STYLESETFORE, SCE_SQL_COMMENTDOC,	of_Color("Green"))
of_SendEditor(SCI_STYLESETFORE, SCE_SQL_NUMBER,			of_Color("Navy"))
of_SendEditor(SCI_STYLESETFORE, SCE_SQL_WORD,			of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_SQL_STRING,			of_Color("Maroon"))
of_SendEditor(SCI_STYLESETFORE, SCE_SQL_CHARACTER,		of_Color("Maroon"))
of_SendEditor(SCI_STYLESETFORE, SCE_SQL_WORD2,			of_Color("Purple"))

// allow user to override colors
this.Event ue_SetLanguageColors()

// set the comment characters
is_commentchar1 = "--"
is_commentchar2 = ""

// set the keywords
ls_keywords  = of_GetKeywords(0, "sql")
of_SetKeyWords(0, ls_keywords)
ls_datatypes = of_GetKeywords(1, "sql")
of_SetKeyWords(1, ls_datatypes)

// enable folding
of_EnableFolding()

this.SetRedraw(True)

Return True

end function

public function boolean of_set_xml ();// -----------------------------------------------------------------------------
// SCRIPT:     of_Set_XML
//
// PURPOSE:    This function will set the language, keywords and colors
//					for XML files.
//
// RETURN:		None
// -----------------------------------------------------------------------------

this.SetRedraw(False)

// set the language
If Not of_SetLanguage("xml") Then
	Return False
End If

// set background/default text/select color
of_SetMarginBackColor(GetSysColor(4))
of_SetMarginTextColor(of_Color("Navy"))
of_SetFoldBackColor(of_Color("Navy"))
of_SetFoldForeColor(GetSysColor(4))
of_SetBackColor(of_Color("White"))
of_SetTextColor(of_Color("Black"))
of_SetSelectColor(RGB(166,202,240))
of_SetCaretColor(of_Color("Black"))
of_SetCaretLineColor(RGB(232,232,255))

// set language color
of_SendEditor(SCI_STYLESETFORE, SCE_H_XMLSTART, of_Color("Red"))
of_SendEditor(SCI_STYLESETFORE, SCE_H_XMLEND, of_Color("Red"))
of_SendEditor(SCI_STYLESETFORE, SCE_H_COMMENT, of_Color("Green"))
of_SendEditor(SCI_STYLESETFORE, SCE_H_NUMBER, of_Color("Red"))
of_SendEditor(SCI_STYLESETFORE, SCE_H_DOUBLESTRING, RGB(128,0,255))
of_SendEditor(SCI_STYLESETFORE, SCE_H_SINGLESTRING, RGB(128,0,255))
of_SendEditor(SCI_STYLESETFORE, SCE_H_TAG, of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_H_TAGEND, of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_H_TAGUNKNOWN, of_Color("Blue"))
of_SendEditor(SCI_STYLESETFORE, SCE_H_ATTRIBUTE, of_Color("Red"))
of_SendEditor(SCI_STYLESETFORE, SCE_H_ATTRIBUTEUNKNOWN, of_Color("Red"))
of_SendEditor(SCI_STYLESETFORE, SCE_H_SGML_DEFAULT, of_Color("Black"))
of_SendEditor(SCI_STYLESETFORE, SCE_H_CDATA, RGB(255,128,0))
of_SendEditor(SCI_STYLESETFORE, SCE_H_ENTITY, of_Color("Black"))

// allow user to override colors
this.Event ue_SetLanguageColors()

// set the comment characters
is_commentchar1 = ""
is_commentchar2 = ""

// enable folding
of_EnableFolding()

this.SetRedraw(True)

Return True

end function

public function encoding of_getencoding (readonly blob ablb_contents);// -----------------------------------------------------------------------------
// SCRIPT:     of_GetEncoding
//
// PURPOSE:    This function determines the encoding of a file.
//
// ARGUMENTS:  ablb_contents	- Contents of the file
//
// RETURN:		Encoding
// -----------------------------------------------------------------------------

Constant Long IS_TEXT_UNICODE_STATISTICS = 2
Byte lby_bom1, lby_bom2, lby_bom3, lby_char
Long ll_bytes, ll_result, ll_index

// get the first three bytes
lby_bom1 = Byte(BlobMid(ablb_contents, 1, 1))
lby_bom2 = Byte(BlobMid(ablb_contents, 2, 1))
lby_bom3 = Byte(BlobMid(ablb_contents, 3, 1))

// check the BOM characters
If lby_bom1 = 255 And lby_bom2 = 254 Then
	Return EncodingUTF16LE!
Else
	If lby_bom1 = 254 And lby_bom2 = 255 Then
		Return EncodingUTF16BE!
	Else
		If lby_bom1 = 239 And lby_bom2 = 187 And lby_bom3 = 191 Then
			Return EncodingUTF8!
		End If
	End If
End If

// check for Unicode without BOM
ll_bytes = Len(ablb_contents)
ll_result = IS_TEXT_UNICODE_STATISTICS
If IsTextUnicode(ablb_contents, ll_bytes, ll_result) Then
	Return EncodingUTF16LE!
End If

// check for UTF-8 without BOM
For ll_index = 1 To ll_bytes
	lby_char = Byte(BlobMid(ablb_contents, ll_index, 1))
	If lby_char > 192 Then
		Return EncodingUTF8!
	End If
Next

Return EncodingAnsi!

end function

public function blob of_getcontents ();// -----------------------------------------------------------------------------
// SCRIPT:     of_GetContents
//
// PURPOSE:    This function returns the text in the control as a blob
//
// RETURN:		The text contained in the control
// -----------------------------------------------------------------------------

Blob lbl_contents
Long ll_length
String ls_contents

// get the length of the text
ll_length = of_SendEditor(SCI_GETTEXTLENGTH)

// allocate the blob
lbl_contents = Blob(Space(ll_length), EncodingAnsi!)

// get the text into the blob
of_SendEditor(SCI_GETTEXT, ll_length, lbl_contents)

Return lbl_contents

end function

public function long of_sendeditor (unsignedlong imessage, longptr wparam, ref blob lparam);// -----------------------------------------------------------------------------
// SCRIPT:     of_SendEditor
//
// PURPOSE:    This function sends a message to the control
//
// ARGUMENTS:  iMessage	- Message number
//					wParam	- Message argument #1
//					lParam	- Message argument #2
//
// RETURN:		Value returned from message
// -----------------------------------------------------------------------------

Return SciSend(ip_hSciWnd, iMessage, wParam, lParam)

end function

on u_scintilla.create
end on

on u_scintilla.destroy
end on

event constructor;Longptr lp_hWindow

GetEnvironment(ie_env)

// Get handle to the editor window
lp_hWindow = Handle(this)
ip_hSciWnd = Send(lp_hWindow, SCI_GETDIRECTPOINTER, 0, 0)

// set properties as defined on the layout panel
of_SetEncoding(#Encoding)
of_SetFont(#FontName)
of_SetFontSize(#TextSize)
of_ShowIndentGuides(#IndentGuides)
of_SetReadOnly(#ReadOnly)
of_ShowLineNumbers(#ShowNumbers)
of_SetWordWrap(#WordWrap)
of_SetTabWidth(#TabWidth)
of_SetScrollWidthTracking(True)

// set text colors
of_Set_NoLanguage()

end event

event rbuttondown;// show custom popup menu

end event

