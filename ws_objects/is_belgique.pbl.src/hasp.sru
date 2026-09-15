$PBExportHeader$hasp.sru
forward
global type hasp from nonvisualobject
end type
end forward

global type hasp from nonvisualobject
end type
global hasp hasp

type prototypes
//de la dll HASP
FUNCTION int hasp(int Service, int SeedCode, int LptNum, int Pass1, int Pass2, ref long p1, ref long  p2, ref long p3, ref long p4 ) LIBRARY "haspvb32.dll"
FUNCTION int WriteHaspBlock(long Service, ref char Buffer[500], long DataLength) LIBRARY "haspvb32.dll" alias for "WriteHaspBlock;Ansi"
FUNCTION int ReadHaspBlock(long Service, ref char Buffer[500], long DataLength) LIBRARY "haspvb32.dll" alias for "ReadHaspBlock;Ansi"
FUNCTION int SetEncDecBlock(ref char Buffer[4096], long DataLength) LIBRARY "haspvb32.dll" alias for "SetEncDecBlock;Ansi"
FUNCTION int GetEncDecBlock(ref char Buffer[4096], long DataLength) LIBRARY "haspvb32.dll" alias for "GetEncDecBlock;Ansi"

//window API
SUBROUTINE Sleep(ulong milli) LIBRARY "Kernel32.dll"
end prototypes

type variables
//afin de stocker les valeurs à passer en param ou à récup por la fonction hasp()
//par convention on écrit le code d'erreur tjrs ds VWrd[3]
//afin de récup l'erreur ds l'event close de l'application
long	VWrd[10]

//les password
//constant long	Ph = 12481
//constant long	Ph1 = 32584
constant	int	NbrBoucle = 5

constant	int	seuil = 958
end variables

forward prototypes
public function long ahapi ()
public subroutine an362n36 (readonly string slocal, ref integer ilocal[])
public function long b2d (ref boolean tabb[], integer exp)
public function integer b36an1d2b36n (character charb36an)
public function unsignedinteger cd (date dlocal, boolean brelatif)
public function boolean chak (string sa)
public subroutine cp ()
public function integer cp (string slocal)
public function string cwh (string slocale)
public function long d2b (long plong, ref boolean tabb[], integer exp, boolean xyz)
public function character d2b361dan (integer ilocal)
public function integer dcd (unsignedinteger ilocal, ref date dlocale)
public function string dcwh (string slocale)
public function boolean gbcd ()
public function long ghid ()
public subroutine grv ()
public subroutine ifk ()
public function boolean leoe (string slocale)
public function string rak ()
public function string rak (integer lparam)
public function string rb (long l1, long l2)
public function long rns ()
public function long rns (string slocale)
public function boolean tm1o (integer qo)
public function integer wak (string sk)
public subroutine ww (long l1, long l2)
public subroutine wb (string slocale, long l1, long l2)
public subroutine fs4net ()
public subroutine logout ()
public function boolean is4net ()
public subroutine login ()
public function long rwnochp (long l1)
public function long rw (long l1)
public subroutine cls ()
public function integer gah ()
public subroutine chp ()
public function long b362dd (readonly integer ilocal[], integer d1, integer d2, integer d3, integer d4)
public function boolean tm1o (integer qso, integer qo)
public function integer cp2014 (string mot)
public function long rnp ()
public function boolean options_41_50 (integer numero_option)
public function integer b36to10 (string v_key)
public function boolean checkoption (integer option)
public function string decimal_to_binaire_string (integer v_valeur)
public function boolean options_51_60 (integer numero_option)
public function boolean options_61_70 (integer numero_option)
end prototypes

public function long ahapi ();//AboutHaspAPI		(cf p147)
// return le numméro de version de l'api HASP

long	l1,l2,l3,l4

if not NO_HASP then
	chp()	//vérif présence hasp
	
	hasp(5,0,VWrd[5],12481,32584,l1,l2,l3,l4)

	return l4
else
	return 0
end if
end function

public subroutine an362n36 (readonly string slocal, ref integer ilocal[]);//AlphaNum36ToNum36
//param slocal -> c le num authenticité récup de la base
//param ilocal -> c le tableau d'int retourné qui 
//						constitue le num série en base36 Numérique

char	CLocal[15]
int	j
int	Valeur


CLocal = slocal

for j = 1 to UpperBound(CLocal)
	ilocal[j] = b36an1d2b36n(CLocal[j])
next

end subroutine

public function long b2d (ref boolean tabb[], integer exp);//BinaryToDecimal

int	indice
long	tot


//if exp <= 0 or exp > 40 then return -1	//pour éviter les erreurs
if exp <= 0 then return -1

for indice = exp to 1 step -1
	if tabb[indice] then tot = tot + 2^(exp - indice)
next

return tot

end function

public function integer b36an1d2b36n (character charb36an);//Base36AlphaNum1DigitToBase36Num

int	Valb36N
int	Valeur


Valeur = Asc(Charb36AN)
if Valeur < 58 then
	Valb36N = Valeur -22
else
	Valb36N = Valeur -97
end if

return Valb36N

end function

public function unsignedinteger cd (date dlocal, boolean brelatif);//CodageDate
//fonction qui code une date donnée selon la codification indiquée ds doc technique
//param brelatif indique si on code date passée en param (brelatif = false)
//ou date passée en param + 30 jours(brelatif = true)
//return -1 si pb

boolean	BTab[]
boolean	BTemp[]


//pour éviter des pbs avec la date sytème de l'ordi
if year(dlocal) - 2000 < 0 then return -1

//on traite le MOI
if brelatif then d2B(month(relativedate(dlocal,30)),BTemp,4,true)	//on le binarise
if not brelatif then d2B(month(dlocal),BTemp,4,true)					//on le binarise
BTab[10] = BTemp[1]					//on place ds l'odre définit ds la nomenclature
BTab[3] = BTemp[2]					//on place ds l'odre définit ds la nomenclature
BTab[9] = BTemp[3]					//on place ds l'odre définit ds la nomenclature
BTab[5] = BTemp[4]					//on place ds l'odre définit ds la nomenclature

//on traite le JOUR
if brelatif then d2B(day(relativedate(dlocal,30)),BTemp,5,true)	//on le binarise
if not brelatif then d2B(day(dlocal),BTemp,5,true)						//on le binarise
BTab[16] = BTemp[1]					//on place ds l'odre définit ds la nomenclature
BTab[7] = BTemp[2]					//on place ds l'odre définit ds la nomenclature
BTab[13] = BTemp[3]					//on place ds l'odre définit ds la nomenclature
BTab[2] = BTemp[4]					//on place ds l'odre définit ds la nomenclature
BTab[12] = BTemp[5]					//on place ds l'odre définit ds la nomenclature

//on traite l'ANNEE
if brelatif then d2B(year(relativedate(dlocal,30)) -2000,BTemp,6,true)	//on le binarise
if not brelatif then d2B(year(dlocal) -2000,BTemp,6,true)					//on le binarise
BTab[4] = BTemp[1]					//on place ds l'odre définit ds la nomenclature
BTab[6] = BTemp[2]					//on place ds l'odre définit ds la nomenclature
BTab[15] = BTemp[3]					//on place ds l'odre définit ds la nomenclature
BTab[14] = BTemp[4]					//on place ds l'odre définit ds la nomenclature
BTab[8] = BTemp[5]					//on place ds l'odre définit ds la nomenclature
BTab[11] = BTemp[6]					//on place ds l'odre définit ds la nomenclature

//bc -> Bit de Codage
BTab[1] = brelatif

return B2D(BTab,16)
end function

public function boolean chak (string sa);//CheckHaspAuthenticityKey
//return FALSE si pas bon
//       TRUE si OK

string	slocale
long		lll
int		TILocal[]

if not NO_HASP then

	chp()
	an362n36(rb(35,1) + rb(24,1),TILocal)
	lll = b362dd(TILocal,1,2,3,4)
	if rns(sa) <> (lll +rw(19)) then return false
	
end if

return true
end function

public subroutine cp ();//CheckParity des 15 premiers caractères

long 		Total
int		ilocal
string	slocale, clef
int		TI[]


clef = rak()

// pour les 15 premiers caractères
an362n36(left(clef,15),TI)				//récup num authenticité en base36 numérique

for ilocal =1 to UpperBound(TI)
	if ilocal <> 5 then Total = Total + long(TI[ilocal])
next


if TI[5] <> mod(Total,36) then
	// si bit de parité pas bon
	// effectif tout de suite -> msg d'erreur !
	SignalError(2002,"Num Authenticité pas Valide")
end if

if len(clef) > 15 then
	cp2014(mid(clef, 16, 5))
end if

if len(clef) > 20 then
	cp2014(mid(clef, 21, 5))
end if





end subroutine

public function integer cp (string slocal);//CheckParity -> version qui test une string passée en param
//renvoie 1 si parité OK
//        0 sinon

//CheckParity

long 		Total
int		ilocal
string	slocale
int		TI[]
integer v_retour


an362n36(slocal,TI)				//récup num authenticité en base36 numérique

for ilocal =1 to UpperBound(TI)
	if ilocal <> 5 then Total = Total + long(TI[ilocal])
next

//effectif tout de suite -> la partie PWO de la clef HASP est effacée !
if TI[5] <> mod(Total,36) then 
	v_retour= 0
else
	// pour compatibilité avec version précédente, si on ne passe qu'un bout de la clef, on teste pas la suite
	if len(slocal) = 15 then
		v_retour = 1 
	else
		// check OK, on teste le 4 eme et le 5 eme groupe
		if cp2014(mid (slocal, 16, 5)) = 1 then
			if len (slocal) > 20 then
				if cp2014(mid (slocal, 21, 5)) = 1 then
					v_retour = 1
				else
					v_retour = 0
				end if
			else
				v_retour = 1
			end if
		else
			v_retour = 0
		end if
	end if
end if

return v_retour

end function

public function string cwh (string slocale);//CryptWithHasp
//ATTENTION : pour tromper on utilise le service HASP qui Decrypt pour crypter !!
//   ça marche trés bien à condition de faire l'inverse également pour Decrypter
//return une string qui est le cryptage de la string passée en param

constant char 		NoVal = 'x'
constant ulong		l_delay = 2000
constant int		NbrMax = 30		//bride la fonction à une chaine de 30 caracs
constant int		LgStr = 15		//dont seul les 15 premiers sont intéressant

long		l1,l2,l4
char		EDB[4096]	//EncodeDecodeBuffer
char		TCLocal[]
string	str
int		JCpt,iCpt


chp()	//vérif présence hasp

//init des vars
VWrd[3] = 0	// pour être sur !
VWrd[4] = 0	// pour être sur !
iCpt = 1

do
	if VWrd[3] = -6 then Sleep(l_delay)	//gère l'attente pour port // en utilisation
	if VWrd[3] = -1 then		//afin de palier au pb de "TimeOut"
		VWrd[4]++
		Sleep(l_delay)
	end if
	if VWrd[3] = -5 then		//afin de palier au pb de "TimeOut"
		VWrd[4]++
		Sleep(l_delay)
	end if
	
	//initialisation des vars
	l2 = LgStr		// l2 = Buffer size
	VWrd[3] = 0		// pour être sur !
	
	//charge le tableau de char EDB
	for JCpt = 1 to LgStr
		EDB[JCpt] = mid(slocale, JCpt, 1)
	next
	
	// Setting a block in memory, which includes data
	// from EncodeDecodeBuffer according to the size
	// specified in p2
	SetEncDecBlock(EDB, l2)
	
	// After SetEncDecBlock() has been called,
	// the call to the hasp() function can be made
	// Service DECODE_DATA = 61
	if is4net( ) then
		hasp(89, 0, VWrd[5], 12481,32584, l1, l2, VWrd[3], l4)
		// on fait suivre par un service LastStatus pour savoir si tout va bien
		cls( )
	else
		hasp(61, 0, VWrd[5], 12481,32584, l1, l2, VWrd[3], l4)
	end if
loop while (VWrd[3] = -6) OR ((VWrd[3] = -1) AND (VWrd[4] <= NbrBoucle)) OR ((VWrd[3] = -5) AND (VWrd[4] <= NbrBoucle))

if VWrd[3] <> 0 then SignalError(2005,"Pb HASP")	//on gére un pb éventuel

l2 = LgStr // on ré-init l2 (Buffer size)

GetEncDecBlock(EDB, l2)

For Jcpt = 1 to LgStr
	if asc(EDB[JCpt]) <> 0 then
		str = str + EDB[JCpt]
	else
		TCLocal[iCpt] = d2b361DAN(JCpt)
		iCpt++
	end if
next

if len(str) = LgStr then return str	//pas de NULL ds le cryptage = pas la peine de faire plus !

str = str + space(LgStr -len(str))	//on complete pour que la string est une longueur = "LgStr"

FOR Jcpt = 1 to upperbound(TCLocal)	//on rajoute les indications de position en b36
	str = str + TCLocal[Jcpt]
next

return str

end function

public function long d2b (long plong, ref boolean tabb[], integer exp, boolean xyz);//DecimalToBinary
//param xyz -> si = true  on binarise normalement
//					si = false on binarise en inversant la valeur pour un coef impaire
//return -1 si pb
//return 0

long	Coef
int	j
long	llocal


if exp <= 1 then return -1

llocal = plong
Coef = 2^(exp -1)

for j = 1 to exp
	if LLocal >= Coef then
		TabB[j] = true
		LLocal = mod(LLocal,Coef)
	else
		TabB[j] = false
	end if
	if not xyz then
		if Mod(j,2) = 0 then TabB[j] = not TabB[j]
	end if
	Coef = Coef / 2
next

return 0

end function

public function character d2b361dan (integer ilocal);//DecimalToBase361DigitAlphaNum
//param ilocal entre 0 et 35
//return un char vide si pb

int	Val36
char	clocal

if (ILocal < 0) OR (Ilocal >35) then return ""	//ILocal n'a pas les bonnes valeurs

if Ilocal > 25 then
	Val36 = Ilocal +22
else
	Val36 = Ilocal +97
end if

CLocal = char(Val36)

return Clocal
end function

public function integer dcd (unsignedinteger ilocal, ref date dlocale);//DeCodeDate
//param dlocale -> afin de renvoyer la date décodée
//param ilocale -> c la date D (cf document sur sécurité) -> D1 = D + C2
//return -1 si pb
//return 0 si date d'init
//return 1 si date d'init + 30

boolean	TabBLocal[]
boolean	TabBTmp[]
long		LLocal, rLocal
string	Slocal
int		itmp

if (ilocal > 55535) OR (d2b(iLocal, TabBLocal, 16, true) = -1) then return -1

//on retrouve la date par recomposition binaire
//on traite par le MOI
TabBTmp[1] = TabBLocal[10]					//on charge le tab tmp de boolean
TabBTmp[2] = TabBLocal[3]					//on charge le tab tmp de boolean
TabBTmp[3] = TabBLocal[9]					//on charge le tab tmp de boolean
TabBTmp[4] = TabBLocal[5]					//on charge le tab tmp de boolean
Slocal = "-" + string(b2d(TabBTmp, 4)) + "-"		//transfo base10 (decimale donc) + on charge ds TabChar

//on traite par le JOUR
TabBTmp[1] = TabBLocal[16]					//on charge le tab tmp de boolean
TabBTmp[2] = TabBLocal[7]					//on charge le tab tmp de boolean
TabBTmp[3] = TabBLocal[13]					//on charge le tab tmp de boolean
TabBTmp[4] = TabBLocal[2]					//on charge le tab tmp de boolean
TabBTmp[5] = TabBLocal[12]					//on charge le tab tmp de boolean
Slocal = string(b2d(TabBTmp, 5)) + Slocal	//transfo base10 (decimale donc) + on charge ds TabChar

//on traite par l'ANNEE
TabBTmp[1] = TabBLocal[4]					//on charge le tab tmp de boolean
TabBTmp[2] = TabBLocal[6]					//on charge le tab tmp de boolean
TabBTmp[3] = TabBLocal[15]					//on charge le tab tmp de boolean
TabBTmp[4] = TabBLocal[14]					//on charge le tab tmp de boolean
TabBTmp[5] = TabBLocal[8]					//on charge le tab tmp de boolean
TabBTmp[6] = TabBLocal[11]					//on charge le tab tmp de boolean
Slocal = Slocal + string(2000 + b2d(TabBTmp, 6))	//transfo base10 (decimale donc) + on charge ds TabChar

Dlocale = Date(Slocal)

if isnull(Dlocale) or Dlocale = 1900-01-01 then return -1	//si un pb sur la création de la date

if TabBLocal[1] then return 1	//bc -> Bit de Codage
return 0								//bc -> Bit de Codage

end function

public function string dcwh (string slocale);//DeCryptWithHasp
//return une string qui est le DEcryptage de la string passée en param
//ATTENTION : pour brouiller les pistes : on utilise ici la fonction de Cryptage
//				pour Décrypter !!
//return 1 string lisible 

constant char 		NoVal = 'x'
constant ulong		l_delay = 2000
constant int		NbrMax = 30		//bride la fonction à une chaine de 30 caracs
constant int		LgStr = 15		//dont seul les 15 premiers sont intéressant

long		l1,l2,l4
char		EDB[4096]	//EncodeDecodeBuffer
string	str
int		JCpt,iCpt


chp()	//vérif présence hasp

//init des vars
VWrd[3] = 0	// pour être sur !
VWrd[4] = 0	// pour être sur !

do
	if VWrd[3] = -6 then Sleep(l_delay)	//gère l'attente pour port // en utilisation
	if VWrd[3] = -1 then		//afin de palier au pb de "TimeOut"
		VWrd[4]++
		Sleep(l_delay)
	end if
	if VWrd[3] = -5 then		//afin de palier au pb de "TimeOut"
		VWrd[4]++
		Sleep(l_delay)
	end if
	
	//init des Variables
	iCpt = 1
	l2 = LgStr		// l2 = Buffer size
	VWrd[3] = 0		// pour être sur !

	if len(slocale) >15 then	//initialisation du tableau EDB -> on charge les valeur NULL ou il faut
		for jCpt = LgStr +1 to len(sLocale)
			EDB[b36an1d2b36n(mid(slocale,jCPt,1))] = NoVal	//on met un NULL ds le tableau EDB à l'emplacement indiqué
		next
	end if

	for JCpt = 1 to LgStr	//poursuit le chargement du tableau EDB
		if EDB[JCpt] = NoVal then 	//on remplace no val par un char NULL
			EDB[JCpt] = char(0)
		else		//c un char lisible -> on l'insère
			EDB[JCpt] = mid(slocale, iCpt, 1)
			iCpt++
		end if
	next
	
	// Setting a block in memory, which includes data
	// from EncodeDecodeBuffer according to the size
	// specified in p2
	SetEncDecBlock(EDB, l2)
	
	// After SetEncDecBlock() has been called,
	// the call to the hasp() function can be made
	// Service ENCODE_DATA = 60
	if is4net( ) then
		hasp(88, 0, VWrd[5], 12481,32584, l1, l2, VWrd[3], l4)
		// haspstatus pour voir si communication = OK
		cls( )
	else
		hasp(60, 0, VWrd[5], 12481,32584, l1, l2, VWrd[3], l4)
	end if

loop while (VWrd[3] = -6) OR ((VWrd[3] = -1) AND (VWrd[4] <= NbrBoucle)) OR ((VWrd[3] = -5) AND (VWrd[4] <= NbrBoucle))

if VWrd[3] <> 0 then SignalError(2005,"Pb HASP")	//on gére un pb éventuel

l2 = LgStr // on ré-init l2 (Buffer size)

GetEncDecBlock(EDB, l2)

For JCpt = 1 to LgStr
	str = str + EDB[JCpt]
next

return str

end function

public function boolean gbcd ();//GenerateBitCodageDate
//on tire au hazard Brelatif

boolean	Brelatif


Randomize(0)
if Rand(2) = 2 then Brelatif = true

return Brelatif
end function

public function long ghid ();//GetHaspID
//return le numéro unique ID du HASP connecté


ulong	l_delay = 2000
long	l1,l2,l4,TmpCalc

//init var
VWrd[4] = 0	// pour être sur !


do
	if VWrd[3] = -6 then Sleep(l_delay)	//gère l'attente pour port // en utilisation
	if VWrd[3] = -1 then		//afin de palier au pb de "TimeOut"
		VWrd[4]++
		Sleep(l_delay)
	end if
	if VWrd[3] = -5 then		//afin de palier au pb de "TimeOut"
		VWrd[4]++
		Sleep(l_delay)
	end if
	
	if is4net( ) then
		hasp(46,0,VWrd[5],12481,32584,l1,l2,VWrd[3],l4 )
		cls( )
	else
		hasp(6,0,VWrd[5],12481,32584,l1,l2,VWrd[3],l4 )
	end if
	
loop while (VWrd[3] = -6) OR ((VWrd[3] = -1) AND (VWrd[4] <= NbrBoucle)) OR ((VWrd[3] = -5) AND (VWrd[4] <= NbrBoucle))

if VWrd[3] <> 0 then
	SignalError(2005,"Pb HASP")	//on gére un pb éventuel
else
	if l1 < 0 then l1 = l1 + 65536
	if l2 < 0 then	l2 = l2 + 65536
   TmpCalc = l2
   TmpCalc = TmpCalc * 65536
   TmpCalc = TmpCalc + l1
end if

return TmpCalc
end function

public subroutine grv ();// GenerateRandomValues
// le tableau VWrd[] est rempli aléatoirement

int	ivar

Randomize(0)
For ivar = 1 to UpperBound(VWrd)
	choose case ivar
		case 1,5,10
			VWrd[ivar] = Rand(150)
		case 2,8
			VWrd[ivar] = Rand(889)
		case 6
			VWrd[ivar] = 0
		case else
			VWrd[ivar] = Rand(32767)
	end choose
next

end subroutine

public subroutine ifk ();//InitFinalKey
//pour initinialiser une clef lorsque un num final a été rentré
//utile pour un poste client sur lequel on a pas rentrer 
//le num authenticité final


				//h.ww(30, 3218)				//on init w30 du HASP
				
h.ww(51,0)					// on initialise FAS à 0
h.ww(28, h.rw(19))		// on met en w28 D1 = 0 + NumCabinet
//SignalError(2011,"IFK")	// on part en erreur
end subroutine

public function boolean leoe (string slocale);//LoadExternalOptionEvaluation
//param SLocale --> un num d'authenticité valide
// return TRUE si Num Authenticité d'évaluation

int	TIN[]
boolean	BB[]
int j,opts


if cp(slocale) <> 1 then return false

an362n36(slocale,TIN)	//transfo en b36 numérique le num authenticité

ww(34,b362dd(TIN,0,0,10,13))	//choppe la série N°2 des options en w34

return tm1o(2)
end function

public function string rak ();//********** OBSOLETE **********//
// utiliser de préférence -> rak(int lparam)
// en passant 1 comme paramètre on obtient le même effet que cette fx


//ReadAuthenticityKey

string s

select trim(clef_logiciel_2013) into :s from param;

// Depuis la version 2014 la clef est en clair dans la base de données
//s = DCWH(s)

return s
end function

public function string rak (integer lparam);// ReadAuthenticityKey
// si lparam = 0 -> on renvoie directement ce qu'on a lu ds la base
// si lparam = 1 -> on décode avec la fx DCWH


string s


select trim(clef_logiciel_2013) into :s from param;

// pré traitement
if isnull(s) then s = ""
s = trim(s)	// on vire les espaces éventuels

// Depuis la version 2014 la clef est en clair dans la base de données
//if lparam = 1 then s = DCWH(s)

return s
end function

public function string rb (long l1, long l2);//ReadBlock

char		HMB[500]		//HaspMemoBuffer
long		l4
ulong		l_delay = 2000
string	slocale


chp()	//vérif présence hasp

//init var
VWrd[3] = 0	// pour être sur !
VWrd[4] = 0	// pour être sur !

do
	if VWrd[3] = -6 then Sleep(l_delay)	//gère l'attente pour port // en utilisation
	if VWrd[3] = -1 then		//afin de palier au pb de "TimeOut"
		VWrd[4]++
		Sleep(l_delay)
	end if
	if VWrd[3] = -5 then		//afin de palier au pb de "TimeOut"
		VWrd[4]++
		Sleep(l_delay)
	end if
	
	if is4net( ) then
		hasp (52, 0, VWrd[5], 12481,32584, l1, l2, VWrd[3], l4)
		cls( )
	else
		hasp (50, 0, VWrd[5], 12481,32584, l1, l2, VWrd[3], l4)
	end if
	
loop while (VWrd[3] = -6) OR ((VWrd[3] = -1) AND (VWrd[4] <= NbrBoucle)) OR ((VWrd[3] = -5) AND (VWrd[4] <= NbrBoucle))

if VWrd[3] <> 0 then SignalError(2005,"Pb HASP")	//on gére un pb éventuel

ReadHaspBlock( 50, HMB, l2)

slocale = trim(string(HMB))

return slocale

end function

public function long rns ();//RecupNumSérie
//à parir de la base
//return le num série
//       ou 0 si num authenticité non valide


return rns(left(rak(),15))

end function

public function long rns (string slocale);//RecupNumSérie
//return le num série
//       ou 0 si num authenticité non valide

int	TabINum[]
long	lll


if cp(slocale) <> 1 then return 0	//vérif si num authenticité valide

an362n36( slocale, TabINum)
lll = b362dd(TabINum,6,12,14,11)
return lll

end function

public function boolean tm1o (integer qo);//TakeMe1 Option
//param QO pour QuelOption
//renvoie TRUE si on a l'option
//        FALSE si non

int opts
boolean	BB[]


if qo = 0 then return false

if d2b(rw(34),BB,10,false) = -1 then return false
opts = upperbound(BB) -(qo -1)
return bb[opts]

end function

public function integer wak (string sk);//WriteAuthenticityKey
//return 1 si OK (=pas de pb avec SQL)
//return -1 sinon

string	sl

// Depuis la version 2014 la clef est en clair dans la base de données
//sl = CWH(trim(sk))	//on crypt la clef avant de l'écrire ds la base

sl = sk

update param set clef_logiciel_2013 = :sl ;

IF sqlca.SQLNRows > 0 THEN
	COMMIT;
	return 1
else
	ROLLBACK;
	return -1
END IF

end function

public subroutine ww (long l1, long l2);//WriteWord		(p155)

long	l4
ulong	l_delay = 2000 

if not NO_HASP then

	chp()	//vérif présence hasp
	
	//init var
	VWrd[3] = 0	// pour être sur !
	VWrd[4] = 0	// pour être sur !
	
	do
		if VWrd[3] = -6 then Sleep(l_delay)	//gère l'attente pour port // en utilisation
		if VWrd[3] = -1 then		//afin de palier au pb de "TimeOut"
			VWrd[4]++
			Sleep(l_delay)
		end if
		if VWrd[3] = -5 then		//afin de palier au pb de "TimeOut"
			VWrd[4]++
			Sleep(l_delay)
		end if
		
		if is4net( ) then
			hasp(45,0,VWrd[5],12481,32584,l1,l2,VWrd[3],l4)
			cls( )
		else
			hasp(4,0,VWrd[5],12481,32584,l1,l2,VWrd[3],l4)
		end if
	loop while (VWrd[3] = -6) OR ((VWrd[3] = -1) AND (VWrd[4] <= NbrBoucle)) OR ((VWrd[3] = -5) AND (VWrd[4] <= NbrBoucle))
	
	if VWrd[3] <> 0 then SignalError(2005,"Pb HASP")	//on gére un pb éventuel
	
end if

end subroutine

public subroutine wb (string slocale, long l1, long l2);//WriteBlock

char	HMB[500]		//HaspMemoBuffer
long	l4
ulong	l_delay = 2000 


chp()	//vérif présence hasp

//init var
HMB =  slocale
VWrd[3] = 0	// pour être sur !
VWrd[4] = 0	// pour être sur !

do
	if VWrd[3] = -6 then Sleep(l_delay)	//gère l'attente pour port // en utilisation
	if VWrd[3] = -1 then		//afin de palier au pb de "TimeOut"
		VWrd[4]++
		Sleep(l_delay)
	end if
	if VWrd[3] = -5 then		//afin de palier au pb de "TimeOut"
		VWrd[4]++
		Sleep(l_delay)
	end if
	
	WriteHaspBlock( 51, HMB, l2)
	
	if is4net( ) then
		hasp (53, 0, VWrd[5], 12481,32584, l1, l2, VWrd[3], l4)
		cls( )
	else
		hasp (51, 0, VWrd[5], 12481,32584, l1, l2, VWrd[3], l4)
	end if
	
loop while (VWrd[3] = -6) OR ((VWrd[3] = -1) AND (VWrd[4] <= NbrBoucle)) OR ((VWrd[3] = -5) AND (VWrd[4] <= NbrBoucle))

if VWrd[3] <> 0 then SignalError(2005,"Pb HASP")	//on gére un pb éventuel

end subroutine

public subroutine fs4net ();// fx FinSingleton pour le hasp4net

long	lTemp

if not NO_HASP then


	if h.is4net( ) then
	// si on est avec un hasp4NET --> on désactive le singleton
		do 
			lTemp = rand( 32767 )
		loop while lTemp = 1
		
		h.ww( 31, lTemp ) 
	end if
	
end if
end subroutine

public subroutine logout ();// fx de logout pour hasp4net

long	l1, l2, l3, l4

if not NO_HASP then

	fs4net( )
	
	if is4net( ) then
		hasp(43,0,VWrd[5],12481,32584,l1,l2,l3,l4)
		cls( )
	end if

end if


end subroutine

public function boolean is4net ();// fx is4net
// return true si on souahite utilser pwo avec du 4net

if NO_HASP then
	return true
else
	if profilestring( dir_ini + inifile_orthokis, "hasp", "4net", "") = "1" then 
		return true
	else
		return false
	end if
end if
end function

public subroutine login ();// fx de login pour hasp4net - prise d'un jeton

long	l1, l2, l3, l4

if not NO_HASP then

	
	if is4net( ) then
		hasp(42,0,VWrd[5],12481,32584,l1,l2,l3,l4)
		cls( )
	end if

end if




end subroutine

public function long rwnochp (long l1);//ReadWordNoChp
//return -1 si pb
//			0 si OK

long	l2,l4
ulong	l_delay = 2000 

if not NO_HASP then
	//init var
	VWrd[3] = 0	//remise à zéro
	VWrd[4] = 0	//remise à zéro
	
	do
		if VWrd[3] = -6 then Sleep(l_delay)	//gère l'attente pour port // en utilisation
		if VWrd[3] = -1 then		//afin de palier au pb de "TimeOut"
			VWrd[4]++
			Sleep(l_delay)
		end if
		if VWrd[3] = -5 then		//afin de palier au pb de "TimeOut"
			VWrd[4]++
			Sleep(l_delay)
		end if
		
		if is4net( ) then
			hasp (44, 0,VWrd[5],12481,32584,l1,l2,VWrd[3],l4)
			cls( )
		else
			hasp (3,0,VWrd[5],12481,32584,l1,l2,VWrd[3],l4)
		end if
		
	loop while (VWrd[3] = -6) OR ((VWrd[3] = -1) AND (VWrd[4] <= NbrBoucle)) OR ((VWrd[3] = -5) AND (VWrd[4] <= NbrBoucle))
	
	if VWrd[3] <> 0 then SignalError(2005,"Pb HASP")	//on gére un pb éventuel
	
	return l2
else
	return 0
end if

end function

public function long rw (long l1);//ReadWord	(cf p154)
//return -1 si pb
//			0 si OK


if not NO_HASP then
	chp()	//vérif présence hasp

	return rwnochp( l1)
else
	return 0
end if

end function

public subroutine cls ();// fx CheckLastStatus
// fx qui vérif la réussite du dernier appel à une routine HASP4NET
// si un pb --> on part en erreur et on sort du programme

long	l1, l2, l3, l4
string	titre = "ERREUR - hasp4net"

if not NO_HASP then

	if is4net( ) then
		hasp(40, 0, VWrd[5], 12481,32584, l1, l2, l3, l4)
		if l1 <> 0 then
		// si un pb
			choose case l1
				case 4 
					messagebox( titre, 'Pas de "Licence Manager" trouvé sur le réseau.', StopSign! )
				case 15
					messagebox( titre, 'Aucun "Licence Manager" actif trouvé.', StopSign! )
				case 129
					messagebox( titre, 'Aucune clef HASP NET de branchée, ~nveuillez en brancher une et relancer ORTHOkis(R).', StopSign! )
				case 133
					messagebox( "ATTENTION", "Le nombre maximum possible de postes est atteint. ~n~nImpossible d'ouvrir une autre connection.", Exclamation! )
				case else
					messagebox( titre, "Net status code : " + string( l1 ) + "~nSystem error code : " + string( l2 ) + "~nNet warning code : " + string( l3 ) + "~n~nORTHOkis(R) va se fermer, veuillez en avertir ARAKIS.", StopSign! )
			end choose
			
			SignalError(2011, titre )
					
		end if
	end if
end if

end subroutine

public function integer gah ();//GetAHasp

ulong		l_delay = 2000 
long		l1,l2,l3,l4

if not NO_HASP then
	//init var
	VWrd[4] = 0	// pour être sur !
	
	if not is4net( ) then
	// si pas du hasp 4net
		// on lance un IsHasp
		do
			if VWrd[3] = -6 then Sleep(l_delay)	//gère l'attente pour port // en utilisation
			if VWrd[3] = -1 then		//afin de palier au pb de "TimeOut"
				VWrd[4]++
				Sleep(l_delay)
			end if
			if VWrd[3] = -5 then		//afin de palier au pb de "TimeOut"
				VWrd[4]++
				Sleep(l_delay)
			end if
			
			hasp(1,0,0,0,0,l1,l2,VWrd[3],l4)
			
		loop while (VWrd[3] = -6) OR ((VWrd[3] = -1) AND (VWrd[4] <= NbrBoucle)) OR ((VWrd[3] = -5) AND (VWrd[4] <= NbrBoucle))
		
		if VWrd[3] <> 0 then SignalError(2005,"Pb HASP")	//on gére un pb éventuel
		
		if l1 = 0 then
			SignalError(2001,"Pas présent")
		else
			// suivi d'un HaspStatus pour chopper le num de port 
			hasp(5,0,0,12481,32584,l1,l2,VWrd[5],l4)
		end if
	else
		// on est en hasp4net
		// pas de notion de num de port pour une utilisation en 4net --> on y met donc le numéro de prog protégé
		VWrd[5] = 2
		
		//open(w_patience)
			// login du hasp4net
			// depuis V2018 ... on ne fait plus de prise de jeton sur la clef réseau		
			login( )
		//close(w_patience)
	end if
	
	//suivi d'une récupération de son ID
	VWrd[4] = 0	// pour être sur !
	do
		if VWrd[3] = -6 then Sleep(l_delay)	//gère l'attente pour port // en utilisation
		if VWrd[3] = -1 then		//afin de palier au pb de "TimeOut"
			VWrd[4]++
			Sleep(l_delay)
		end if
		if VWrd[3] = -5 then		//afin de palier au pb de "TimeOut"
			VWrd[4]++
			Sleep(l_delay)
		end if
		
		if is4net( ) then
			hasp(46,0,VWrd[5],12481,32584,l1,l2,VWrd[3],l4 )
			// statuscode pour pb de communication éventuel
			cls( ) 
		else
			hasp(6,0,VWrd[5],12481,32584,l1,l2,VWrd[3],l4 )
		end if
		
	loop while (VWrd[3] = -6) OR ((VWrd[3] = -1) AND (VWrd[4] <= NbrBoucle)) OR ((VWrd[3] = -5) AND (VWrd[4] <= NbrBoucle))
	
	if VWrd[3] <> 0 then
		SignalError(2005,"Pb HASP")	//on gére un pb éventuel
	else
		if l1 < 0 then l1 = l1 + 65536
		if l2 < 0 then	l2 = l2 + 65536
		VWrd[1] = l2
		VWrd[1] = VWrd[1] * 65536
		VWrd[1] = VWrd[1] + l1
	end if
	
	//on relance une vérif sur le port capturé et le HASP qui y est connecté
	chp()
end if

//return tjrs 1
return 1
end function

public subroutine chp ();//CheckHaspPresence		(cf p146)
// 0 si pas de clef HASP connectée
// 1 si clef HASP connectée


ulong		l_delay = 2000
long		l1,l2,l4

if not NO_HASP then
	
	if not is4net( ) then	
		//init var
		VWrd[4] = 0	// pour être sur !
		
		//vérif présence clef HASP sur le port indiqué
		do
			if VWrd[3] = -6 then Sleep(l_delay)	//gère l'attente pour port // en utilisation
			if VWrd[3] = -1 then		//afin de palier au pb de "TimeOut"
				VWrd[4]++
				Sleep(l_delay)
			end if
			if VWrd[3] = -5 then		//afin de palier au pb de "TimeOut"
				VWrd[4]++
				Sleep(l_delay)
			end if
			
			hasp(1,0,VWrd[5],0,0,l1,l2,VWrd[3],l4)
		loop while (VWrd[3] = -6) OR ((VWrd[3] = -1) AND (VWrd[4] <= NbrBoucle)) OR ((VWrd[3] = -5) AND (VWrd[4] <= NbrBoucle))
		
		if VWrd[3] <> 0 then
			// si un pb
			SignalError(2005,"Pb HASP")
		else
			// pas de pb
			if l1 = 0 then SignalError(2001,"Pas présent")	// MAIS pas de clef connecté
			
			//vérif si le HASP connecté est le même que celui en début de cession
			if (l1 = 0) OR (GHID() <> VWrd[1]) then SignalError(2001,"Pas présent")
		end if
	else
		// on est en 4net : on vérifie la présence de la clef en lisant un word quelconque
		rwnochp( 31 )
	end if
end if
end subroutine

public function long b362dd (readonly integer ilocal[], integer d1, integer d2, integer d3, integer d4);//Base36To4DecimalDigits
//param ILocal[] -> tableau des 15 valeurs du num d'authenticité
//           		  en base 36 Numérique
//param d1 -> indique lequel des digits il faut prendre
//param d2 -> indique lequel des digits il faut prendre
//param d3 -> indique lequel des digits il faut prendre
//param d4 -> indique lequel des digits il faut prendre

//return les 4 digits dans 1 long

int Valb36[]
long ValD = 0
int j

if d1 <> 0 then Valb36[4] = integer(ilocal[d1])
if d2 <> 0 then Valb36[3] = integer(ilocal[d2])
if d3 <> 0 then Valb36[2] = integer(ilocal[d3])
if d4 <> 0 then Valb36[1] = integer(ilocal[d4])


for j = UpperBound(Valb36) to 1 step -1
	ValD = ValD + (Valb36[j] * (36^(j -1)))
next

return ValD

end function

public function boolean tm1o (integer qso, integer qo);//TakeMe1Option
//param QSO pour QuelleSéried'Option
//param QO pour QuelOption
//renvoie TRUE si on a l'option
//        FALSE si non

int	TIN[]
boolean	BB[]
int j,opts


if qso = 0 or qo = 0 then return false

an362n36(left(rak(), 15),TIN)

if not NO_HASP then
	choose case qso
		case 1
			ww(34,b362dd(TIN,0,0,2,7))
		case 2
			ww(34,b362dd(TIN,0,0,10,13))
		case 3
			ww(34,b362dd(TIN,0,0,15,4))
		case 4
			ww(34,b362dd(TIN,0,0,9,3))
	end choose
end if

if d2b(rw(34),BB,10,false) = -1 then return false


opts = upperbound(BB) -(qo -1)
return bb[opts]

end function

public function integer cp2014 (string mot);//CheckParity du 4e ou du 5e groupe

// renvoie 1 si OK, 0 sinon

// mot est le 4ème groupe => 5 caractères

char c1, c2, c3, c4, c5
integer ic1, ic2, ic3, ic4, ic5
integer v3

c1 = mid(mot, 1, 1)
c2 = mid(mot, 2, 1)
c3 = mid(mot, 3, 1)
c4 = mid(mot, 4, 1)
c5 = mid(mot, 5, 1)

// passe de b
ic1 = h.b36an1d2b36n(c1)
ic2 = h.b36an1d2b36n(c2)
ic3 = h.b36an1d2b36n(c3)
ic4 = h.b36an1d2b36n(c4)
ic5 = h.b36an1d2b36n(c5)

// Vérification de la parité

v3 = (ic2 + ic1 + 1) * (ic4  + 1) + ic5

if ic3 <> mod(v3, 36) then
	// si bit de parité pas bon
	// effectif tout de suite -> msg d'erreur !
	SignalError(2002,"Num Authenticité pas Valide")
	return 0
else
	return 1
end if

end function

public function long rnp ();//RecupNombrePostes
//à parir de la base
//return le nombre de postes autorisés à se connectés
//       ou 0 si num authenticité non valide


string mot 
long v2

string c2, c4
integer ic2, ic4

mot = mid(rak(), 16, 5)

if cp2014(mot) = 1 then
	
	c2 = mid(mot, 2, 1)
	c4 = mid(mot, 4, 1)
	
	// passe de b
	ic2 = h.b36an1d2b36n(c2)
	ic4 = h.b36an1d2b36n(c4)
	
	// Nombre de postes
	
	v2 = (ic2 * 36 + ic4 ) / 10
	
else
	v2 = 0
end if

return v2

end function

public function boolean options_41_50 (integer numero_option);
// Décodage de la clef !!!!!!!!!!!

// Param :
// v_clef_complete : clef entière stockée dans la base => on ne s'interresser qu'au 4 ème groupe (caractèred e 16 à 20
// valeur décimales de options 


integer  v1, v2, v3

char c1, c2, c3, c4, c5
integer o1, o2, o3, o4, o5, o6, o7, o8, o9, o10
integer ic1, ic2, ic3, ic4, ic5

boolean v_valeur_option

string v_clef_complete

select first clef_logiciel_2013 into :v_clef_complete from param ;


c1 = mid(v_clef_complete, 16, 1)
c2 = mid(v_clef_complete, 17, 1)
c3 = mid(v_clef_complete, 18, 1)
c4 = mid(v_clef_complete, 19, 1)
c5 = mid(v_clef_complete, 20, 1)

// passe de b
ic1 = h.b36an1d2b36n(c1)
ic2 = h.b36an1d2b36n(c2)
ic3 = h.b36an1d2b36n(c3)
ic4 = h.b36an1d2b36n(c4)
ic5 = h.b36an1d2b36n(c5)


//	// Options
	V1 = ic5 * 36 + ic1

boolean tab_options[]

h.d2b(V1, tab_options, 10, true)

// L'option 41 et en tab[10], 42 en tab[9], etc ...

integer v_tab

v_tab = (numero_option  - 31)  - 2 * (numero_option - 41)

v_valeur_option = tab_options[ v_tab ] 


//o1 = boolean_to_integer(tab_options[10])
//o2 = boolean_to_integer(tab_options[9])
//o3 = boolean_to_integer(tab_options[8])
//o4 = boolean_to_integer(tab_options[7])
//o5 = boolean_to_integer(tab_options[6])
//o6 = boolean_to_integer(tab_options[5])
//o7 = boolean_to_integer(tab_options[4])
//o8 = boolean_to_integer(tab_options[3])
//o9 = boolean_to_integer(tab_options[2])
//o10 = boolean_to_integer(tab_options[1])
//
//
//sle_options.text = string(o10)+string(o9)+string(o8)+string(o7)+string(o6)+string(o5)+string(o4)+string(o3)+string(o2)+string(o1)
//	
//end if
//


return v_valeur_option
	

end function

public function integer b36to10 (string v_key);integer res = 0
integer val = 0
integer power = 1
integer i = 1

do while i <= len(v_key)
	val = asc ( mid(v_key, i, 1) )
	
	if val <= 57 then
		val = val - 22 // -48 + 26 parce que les chiffres sont aprés les lettres dans cette base 36
	else 
		val = val - 97
	end if
	
	// Fonction power de sybase :-)
	SELECT Power( 36, len(:v_key) - :i  ) into :power FROM param ;
	
	if power <= 0 then
		power = 1
	end if
	
	val = val * power
	
	res = res + val
	
	i = i + 1
loop

return res;

end function

public function boolean checkoption (integer option);boolean res = false


		
		String v_key = ""
		
		SELECT first clef_logiciel_2013 into :v_key from param ;

		String opt = ""
		String binary = ""
		String tmp = ""
		String TotalBin = ""
		integer i
		
		// 1 à 10
		opt = mid (v_key, 2, 1)  +  mid ( v_key , 7, 1)
		
		binary = decimal_to_binaire_string(b36to10(opt))
		
		do while len(binary) < 10
			binary = "0" + binary
		loop 
		
		tmp = ""
		
		i = 10
		do while i > 0
			if  mod( i -1 , 2) = 0 then
				tmp = tmp + mid(binary, i, 1)
			else 
				if mid(binary , i , 1) = '1' then
					tmp = tmp + '0';
				else 
					tmp = tmp + '1'
				end if
			end if
			i = i - 1
		loop
		
		binary = tmp
		TotalBin = TotalBin + binary
		
		// 11 à 20
		opt = mid (v_key, 10, 1)  +  mid ( v_key , 13, 1)
		binary = decimal_to_binaire_string(b36to10(opt))
		do while len(binary) < 10
			binary = "0" + binary
		loop 
		
		tmp = ""
		
		i = 10
		do while i > 0
			if  mod( i -1 , 2) = 0 then
				tmp = tmp + mid(binary, i, 1)
			else 
				if mid(binary , i , 1) = '1' then
					tmp = tmp + '0';
				else 
					tmp = tmp + '1'
				end if
			end if
			i = i -1
		loop
		
		binary = tmp
		TotalBin = TotalBin + binary
		
		// 21 à 30
		opt = mid (v_key, 15, 1)  +  mid ( v_key , 4, 1)
		binary = decimal_to_binaire_string(b36to10(opt))
		do while len(binary) < 10
			binary = "0" + binary
		loop 
		
		tmp = ""
		
		i = 10
		do while i > 0
			if  mod( i - 1 , 2) = 0 then
				tmp = tmp + mid(binary, i, 1)
			else 
				if mid(binary , i , 1) = '1' then
					tmp = tmp + '0';
				else 
					tmp = tmp + '1'
				end if
			end if
			i = i -1
		loop
		
		binary = tmp
		TotalBin = TotalBin + binary
		
		// 31 à 40
		opt = mid (v_key, 9, 1)  +  mid ( v_key , 3, 1)
		binary = decimal_to_binaire_string(b36to10(opt))
		do while len(binary) < 10
			binary = "0" + binary
		loop 
		
		tmp = ""
		
		i = 10
		do while i > 0
			if  mod( i - 1 , 2) = 0 then
				tmp = tmp + mid(binary, i, 1)
			else 
				if mid(binary , i , 1) = '1' then
					tmp = tmp + '0';
				else 
					tmp = tmp + '1'
				end if
			end if
			i = i -1
		loop
		
		binary = tmp
		TotalBin = TotalBin + binary
		
		if  len(TotalBin) >= option and mid(TotalBin , option, 1) = '1' then
			res = true
		else
			res = false
		end if
		
		return res;

end function

public function string decimal_to_binaire_string (integer v_valeur);// renvoie la conversion binaire d'un décimal sous la forme d'une string

// 12 => "1100"


string res  = ""
long coef = 1

do while v_valeur > 1  
	if mod(v_valeur , 2 ) = 1 then 
		res = "1" + res 
		v_valeur = (v_valeur - 1) / 2
	else
		res = "0" + res 
		v_valeur = v_valeur / 2
	end if
	
	if v_valeur = 1 then
		res = "1" + res 
	end if
		
	
loop

return res
end function

public function boolean options_51_60 (integer numero_option);
// Décodage de la clef !!!!!!!!!!!

// Param :
// v_clef_complete : clef entière stockée dans la base => on ne s'interresser qu'au 4 ème groupe (caractèred e 16 à 20
// valeur décimales de options 


integer  v1, v2, v3

char c1, c2, c3, c4, c5
integer o1, o2, o3, o4, o5, o6, o7, o8, o9, o10
integer ic1, ic2, ic3, ic4, ic5

boolean v_valeur_option

string v_clef_complete

select first clef_logiciel_2013 into :v_clef_complete from param ;


c1 = mid(v_clef_complete, 21, 1)
c2 = mid(v_clef_complete, 22, 1)
c3 = mid(v_clef_complete, 23, 1)
c4 = mid(v_clef_complete, 24, 1)
c5 = mid(v_clef_complete, 25, 1)

// passe de b
ic1 = h.b36an1d2b36n(c1)
ic2 = h.b36an1d2b36n(c2)
ic3 = h.b36an1d2b36n(c3)
ic4 = h.b36an1d2b36n(c4)
ic5 = h.b36an1d2b36n(c5)


//	// Options
	V1 = ic5 * 36 + ic1

boolean tab_options[]

h.d2b(V1, tab_options, 10, true)

// L'option 51 et en tab[10], 52 en tab[9], etc ...

integer v_tab

v_tab = (numero_option  - 41)  - 2 * (numero_option - 51)

v_valeur_option = tab_options[ v_tab ] 


//o1 = boolean_to_integer(tab_options[10])
//o2 = boolean_to_integer(tab_options[9])
//o3 = boolean_to_integer(tab_options[8])
//o4 = boolean_to_integer(tab_options[7])
//o5 = boolean_to_integer(tab_options[6])
//o6 = boolean_to_integer(tab_options[5])
//o7 = boolean_to_integer(tab_options[4])
//o8 = boolean_to_integer(tab_options[3])
//o9 = boolean_to_integer(tab_options[2])
//o10 = boolean_to_integer(tab_options[1])
//
//
//sle_options.text = string(o10)+string(o9)+string(o8)+string(o7)+string(o6)+string(o5)+string(o4)+string(o3)+string(o2)+string(o1)
//	
//end if
//


return v_valeur_option
	

end function

public function boolean options_61_70 (integer numero_option);
// Décodage de la clef !!!!!!!!!!!

// Param :
// v_clef_complete : clef entière stockée dans la base => on ne s'interresser qu'au 4 ème groupe (caractèred e 16 à 20
// valeur décimales de options 


integer  v1, v2, v3

char c1, c2, c3, c4, c5
integer o1, o2, o3, o4, o5, o6, o7, o8, o9, o10
integer ic1, ic2, ic3, ic4, ic5

boolean v_valeur_option

string v_clef_complete

select first clef_logiciel_2013 into :v_clef_complete from param ;


c1 = mid(v_clef_complete, 21, 1)
c2 = mid(v_clef_complete, 22, 1)
c3 = mid(v_clef_complete, 23, 1)
c4 = mid(v_clef_complete, 24, 1)
c5 = mid(v_clef_complete, 25, 1)

// passe de b
ic1 = h.b36an1d2b36n(c1)
ic2 = h.b36an1d2b36n(c2)
ic3 = h.b36an1d2b36n(c3)
ic4 = h.b36an1d2b36n(c4)
ic5 = h.b36an1d2b36n(c5)


//	// Options
	V1 = ic4 * 36 + ic2

boolean tab_options[]

h.d2b(V1, tab_options, 10, true)

// L'option 61 et en tab[10], 62 en tab[9], etc ...

integer v_tab

v_tab = (numero_option  - 51)  - 2 * (numero_option - 61)

v_valeur_option = tab_options[ v_tab ] 


//o1 = boolean_to_integer(tab_options[10])
//o2 = boolean_to_integer(tab_options[9])
//o3 = boolean_to_integer(tab_options[8])
//o4 = boolean_to_integer(tab_options[7])
//o5 = boolean_to_integer(tab_options[6])
//o6 = boolean_to_integer(tab_options[5])
//o7 = boolean_to_integer(tab_options[4])
//o8 = boolean_to_integer(tab_options[3])
//o9 = boolean_to_integer(tab_options[2])
//o10 = boolean_to_integer(tab_options[1])
//
//
//sle_options.text = string(o10)+string(o9)+string(o8)+string(o7)+string(o6)+string(o5)+string(o4)+string(o3)+string(o2)+string(o1)
//	
//end if
//


return v_valeur_option
	

end function

on hasp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on hasp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

