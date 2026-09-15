$PBExportHeader$uo_infos_systeme.sru
forward
global type uo_infos_systeme from nonvisualobject
end type
type str_ipaddrrow from structure within uo_infos_systeme
end type
type str_ipaddrtable from structure within uo_infos_systeme
end type
type str_ipnetrow from structure within uo_infos_systeme
end type
type str_ipnettable from structure within uo_infos_systeme
end type
type str_ipnettable1 from structure within uo_infos_systeme
end type
type str_mac from structure within uo_infos_systeme
end type
type ip_addr_string from structure within uo_infos_systeme
end type
type mib_ipaddrrow from structure within uo_infos_systeme
end type
type mib_ipaddrtable from structure within uo_infos_systeme
end type
type str_wsadata from structure within uo_infos_systeme
end type
end forward

type str_ipaddrtable from structure
	long		numentries
	str_ipaddrrow		table[6]
end type

type str_ipnetrow from structure
	long		index
	long		physaddrlen
	character		bphysaddr[8]
	long		addr
	long		iptype
end type

type str_ipnettable from structure
	long		numentries
	str_ipnetrow		table[255]
end type

type str_ipnettable1 from structure
	long		numentries
	long		asd
end type

type str_mac from structure
	character		mac[8]
end type

type ip_addr_string from structure
	unsignedlong		lNext
	string		IpAddress
	string		IpMask
	unsignedlong		Context
end type

type mib_ipaddrrow from structure
	long		dwaddr
	long		dwindex
	long		dwmask
	long		dwBCastAddr
	long		dwReasmSize
	integer		unused1
	integer		unused2
end type

type mib_ipaddrtable from structure
	long		dwNumEntries
	MIB_IPADDRROW		table[5]
end type

type str_wsadata from structure
	unsignedinteger		version
	unsignedinteger		highversion
	character		description[257]
	character		systemstatus[129]
	unsignedinteger		maxsockets
	unsignedinteger		maxupddg
	string		vendorinfo
end type

global type uo_infos_systeme from nonvisualobject
end type
global uo_infos_systeme uo_infos_systeme

type prototypes

FUNCTION long GetIpAddrTable( &
	ref str_ipaddrtable llll, &
	ref long addr_len, &
	boolean ip_sort) LIBRARY "iphlpapi.dll" alias for "GetIpAddrTable;Ansi"
	
FUNCTION LONG inet_addr( ref string cp ) LIBRARY "ws2_32.dll" alias for "inet_addr;Ansi"

FUNCTION LONG GetIpNetTable( &
	ref str_ipnettable llll, &
	ref long addr_len, &
	boolean ip_sort) LIBRARY "iphlpapi.dll" alias for "GetIpNetTable;Ansi"
	
FUNCTION LONG DeleteIpNetEntry( ref str_ipnetrow ip) LIBRARY "iphlpapi.dll" alias for "DeleteIpNetEntry;Ansi"
	
FUNCTION LONG FlushIpNetTable(long ip) LIBRARY "iphlpapi.dll"

FUNCTION LONG SendARP( long ip, long ipsur, ref str_mac str, ref long len) LIBRARY "iphlpapi.dll" alias for "SendARP;Ansi"

	
// Pour adresse IP	
PUBLIC FUNCTION Long GetIpAddrTable (REF mib_ipaddrtable pIPAdrTable, REF ulong pdwSize,boolean Sort)LIBRARY "IPHlpApi.dll" alias for "GetIpAddrTable;Ansi"
SUBROUTINE CopyMemory ( ref char d[4], REF long hSource, long b ) LIBRARY "kernel32.dll" ALIAS FOR "RtlMoveMemory;Ansi"

// POur le ComputerName
Function boolean GetComputerNameA (ref string lpBuffer, ref ulong nSize) Library "kernel32.dll" ALIAS FOR "GetComputerNameA;Ansi"

// Pour le UserName de session
Function Long GetUserNameA (ref String lpBuffer , ref Long nSize) Library "advapi32.dll" Alias For "GetUserNameA;Ansi"

// pour recupérer adresse IP
function int WSAStartup (uint UIVerionrequested, ref str_wsadata lpWSAdata)   library "wsock32.DLL" alias for "WSAStartup;ansi"
function int WSACleanup() library "wsock32.DLL"
function int WSAGetLastError() library "wsock32.DLL"
function int gethostname(ref string name, int namelen)      library "wsock32.DLL"  alias for "gethostname;Ansi"
function string GetHost(string lpszhost,ref blob lpszaddress)      library "pbws32.dll" alias for "GetHost;Ansi"

end prototypes

type variables

end variables

forward prototypes
public function string of_getmac (string as_ip)
public function string of_long2hex (long al_number, integer ai_digit)
public function string of_get_my_ip ()
public subroutine nf_get_ip (ref string as_ip_address[])
public function string nf_parse_ip (long al_buf)
public function string of_get_my_computername ()
public function string of_get_username ()
public function string of_get_numero_clef_hasp ()
end prototypes

public function string of_getmac (string as_ip);/////////////////////////////////////////////
// Create by Sandy                         //
// 27 August 2007                          //
/////////////////////////////////////////////
str_ipnettable lstr_table 
str_mac 			lstr_mac
long 				ll_buffer 
boolean 			lb_type
long 				ll_len
long 				ll_type, ll_inetaddr, ll_row
string 			ls_ip, ls_mac

ls_ip = as_ip

ll_inetaddr = inet_addr(ls_ip)
lb_type = false
ll_type = GetIpNetTable(lstr_table, ll_buffer, lb_type) 
ll_type = GetIpNetTable(lstr_table, ll_buffer, lb_type)

lstr_table.numentries = min(lstr_table.numentries,  upperbound(lstr_table.table))

if ll_type=0 then 
	for ll_row = 1 to lstr_table.numentries
		if lstr_table.table[ll_row].addr = ll_inetaddr then
			ll_type = DeleteIpNetEntry(lstr_table.table[ll_row])
		end if
	next
end if

ll_len  = 8
ll_type = SendARP(ll_inetaddr, 0, lstr_mac, ll_len)

if ll_type <> 0 then return '(Cannot Resolved MAC)'

for ll_row =1 to 6
	ls_mac += this.of_long2hex( long( string(ascA(lstr_mac.mac[ll_row]))) , 2) + '-'
next

Return left(ls_mac,len(ls_mac)-1)

end function

public function string of_long2hex (long al_number, integer ai_digit);long ll_temp0, ll_temp1
char lc_ret

IF ai_digit > 0 THEN
   ll_temp0 = abs(al_number / (16 ^ (ai_digit - 1)))
   ll_temp1 = ll_temp0 * (16 ^ (ai_digit - 1))
   IF ll_temp0 > 9 THEN
      lc_ret = charA(ll_temp0 + 55)
   ELSE
      lc_ret = charA(ll_temp0 + 48)
   END IF
   RETURN lc_ret + &
          of_long2hex(al_number - ll_temp1 , ai_digit - 1)
END IF
RETURN ""
end function

public function string of_get_my_ip ();////
////
//string my_ip
//string	ls_ip_addr[]
//
//nf_get_ip(ls_ip_addr)
//
//if Upperbound(ls_ip_addr) > 0 then
//	my_ip = ls_ip_addr[Upperbound(ls_ip_addr)]
//end if
//
//return my_ip

// nouvelle version du 30.10.2013
String ls_ip, ls_host
Blob{4} lb_host
Integer li_version, li_rc
str_wsadata lstr_wsadata

ls_host = Space(128)
li_version = 257

If WSAStartup(li_version, lstr_wsadata) = 0 Then
   If GetHostName(ls_host, Len(ls_host)) < 0 Then
      li_rc = WSAGetLastError()
   Else
      GetHost(ls_host, lb_host)
      ls_ip = String(Asc(String(BlobMid(lb_host, 1, 1),Encodingansi!))) + "."
      ls_ip += String(Asc(String(BlobMid(lb_host, 2, 1),Encodingansi!))) + "."
      ls_ip += String(Asc(String(BlobMid(lb_host, 3, 1),Encodingansi!))) + "."
      ls_ip += String(Asc(String(BlobMid(lb_host, 4, 1),Encodingansi!)))
      li_rc = 0
   End If
Else
   li_rc = WSAGetLastError()
End If

WSACleanup()

return ls_ip
end function

public subroutine nf_get_ip (ref string as_ip_address[]);/*================================================================================================
 	<Funzione:>    nf_get_ip
 	<Ritorno:>     (none)
  	<Argomenti:>   ref string as_ip_address[]	
==================================================================================================
Descrizione:	ottiene la lista degli indirizzi ip di un Pc.
==================================================================================================
Autore   :  [LUCA] 07-05-2004  15:46:49	Prima stesura
==================================================================================================
Copyright © 1996-2004 Office Software Solutions. Tutti i diritti riservati
================================================================================================*/
int			i
long			rc
ulong			lul_p = 0

mib_ipaddrtable	ipat

rc = GetIpaddrtable(ipat,lul_p,TRUE)

IF rc = 122 THEN
	
	rc = GetIpaddrtable(ipat,lul_p,TRUE)
	
	FOR i = 1 TO ipat.dwnumentries
		
		as_ip_address[UpperBound(as_ip_address) + 1] = nf_parse_ip(ipat.table[i].dwaddr)
		
	NEXT
	
END IF

end subroutine

public function string nf_parse_ip (long al_buf);/*================================================================================================
	<Funzione:>    nf_parse_ip
	<Ritorno:>     string 0 = OK, -1 = ERRORE
	<Argomenti:>   value long al_buf	
==================================================================================================
Descrizione:	dal buffer passato si concatena l'indirizzo ip
==================================================================================================
Autore   :  [LUCA] 07-05-2004  15:48:03	Prima stesura
==================================================================================================
Copyright © 1996-2004 Office Software Solutions. Tutti i diritti riservati
================================================================================================*/
int			ll_i
Char 			lc_byte[4]
string		ls_str

CopyMemory(lc_byte,al_buf,4)
ls_str = ""

lc_byte[1] = CharA(192)

FOR ll_i = 1 TO 4
	ls_str += String(AscA(lc_byte[ll_i]))
	ls_str += "."
NEXT

ls_str = Mid(ls_str,1,Len(ls_str) -1)

RETURN ls_str
end function

public function string of_get_my_computername ();string ls_temp
ulong lul_value
boolean lb_rc

lul_value = 255
ls_temp = space(255)
lb_rc = GetComputerNameA (ls_temp, lul_value)


return ls_temp

end function

public function string of_get_username ();string ls_temp
long lul_value


lul_value = 255
ls_temp = space(lul_value)


GetUserNameA (ls_temp, lul_value)


return ls_temp

end function

public function string of_get_numero_clef_hasp ();// Renvoie le N° physique de clef HASP
// Ajout de la lettre R si réseau ou L si locale

h = create hasp	//on crée l'objet HASP

string val_retour
long P1, P2, P3, P4, PN
long ClefId = 0

h.GAH()	// init du hasp avec détection hasp M1 ou 4net

if h.is4net( ) then 
	val_retour = "R"
	 h.hasp(46, 300, 9, 12481, 32584, P1, P2, P3, P4);
else
	val_retour = "L"
    h.hasp(6, 300, PN, 12481, 32584, P1, P2, P3, P4);
end if

val_retour = val_retour + string( P1 + 65536*P2)

//            do{
//                if(isNetHasp)
//                    hasp(46, 300, 9, 12481, 32584, &P1, &P2, &P3, &P4);
//                else
//                    hasp(6, 300, PN, 12481, 32584, &P1, &P2, &P3, &P4);
//                ClefId = P1 + 65536*P2;
//            }while(P3 == -6);
//            KeyId = KeyId + IntToStr(ClefId);
//        }
//        catch(...){}
//


return val_retour
end function

on uo_infos_systeme.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_infos_systeme.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

