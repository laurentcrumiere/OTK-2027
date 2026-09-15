$PBExportHeader$n_winsock.sru
$PBExportComments$Winsock functions~r~nOn utilise le codage en 64
forward
global type n_winsock from nonvisualobject
end type
end forward

global type n_winsock from nonvisualobject native "winsock.pbx"
public function  unsignedlong of_accept(unsignedlong aul_socket)
public function  boolean of_cleanup()
public function  boolean of_close(ref unsignedlong aul_socket)
public function  unsignedlong of_connect(string as_hostname, unsignedinteger aui_port)
public function  string of_gethostname()
public function  boolean of_getipaddress(string as_hostname, ref string as_ipaddress[])
public function  long of_getlasterrornum()
public function  string of_getlasterror()
public function  string of_geterrortext(long al_errornum)
public function  string of_getpeername(unsignedlong aul_socket)
public function  boolean of_getpublicipaddress(ref string as_ipaddress)
public function  string of_getuserid()
public function  long of_getmaxmsgsize()
public function  long of_getrecvbufsize()
public function  long of_getsendbufsize()
public function  unsignedlong of_listen(unsignedinteger aui_port)
public function  unsignedlong of_listen(unsignedinteger aui_port, long al_handle, integer ai_custevent)
public function  long of_recv(unsignedlong aul_socket, ref blob ablb_data)
public function  long of_recv(unsignedlong aul_socket, ref string as_data)
public function  boolean of_send(unsignedlong aul_socket, blob ablb_data, long al_datalen)
public function  boolean of_send(unsignedlong aul_socket, string as_data)
public function  long of_recvfrom(unsignedinteger aui_port, ref blob ablb_data, ref string as_ipaddress, ref unsignedinteger aui_remoteport)
public function  long of_recvfrom(unsignedinteger aui_port, ref string as_data, ref string as_ipaddress, ref unsignedinteger aui_remoteport)
public function  boolean of_sendto(string ipaddress, unsignedinteger aui_port, blob ablb_data, long al_datalen)
public function  boolean of_sendto(string ipaddress, unsignedinteger aui_port, string as_data)
public function  boolean of_setblockingmode(unsignedlong aul_socket, boolean ab_blocking)
public subroutine  of_setipversion(integer ai_version)
public subroutine  of_setlasterror(long al_errornum)
public subroutine  of_setrecvtimeout(unsignedlong aul_milliseconds)
public subroutine  of_setsendtimeout(unsignedlong aul_milliseconds)
public subroutine  of_setunicode(boolean ab_unicode)
public function  boolean of_shutdown(unsignedlong aul_socket, long al_how)
public function  boolean of_startup()
end type
global n_winsock n_winsock

on n_winsock.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_winsock.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

