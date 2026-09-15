$PBExportHeader$webbrowser_empty.sru
forward
global type webbrowser_empty from userobject
end type
end forward

global type webbrowser_empty from userobject
integer width = 210
integer height = 112
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event acceleratorkeypressed ( integer kind,  integer virtualkey,  integer lparam )
event addresschange ( string newurl,  boolean isnewpage )
event type long certificateerror ( string errortext,  string requesturl,  string certificateinfo )
event contentloading ( boolean iserrorpage )
event domcontentloaded ( )
event downloadingoperationstatechanged ( integer itemid,  integer operationstate,  string interruptreason,  boolean canresume )
event downloadingstart ( integer itemid,  string filename,  string uri,  string mimetype,  longlong total )
event downloadingstatechanged ( integer itemid,  longlong speed,  longlong received,  longlong total,  integer percent )
event estimatedendtimechanged ( integer itemid,  statusbar estimateendtime )
event evaluatejavascriptfinished ( boolean isfinish,  string result,  string errormessage )
event historychanged ( )
event isdefaultdownloaddialogstatechanged ( boolean isopen )
event navigationcompleted ( boolean issuccess,  integer httpcode,  string weberror )
event navigationerror ( integer errorcode,  string errortext,  string failedurl )
event navigationprogressindex ( integer progressindex )
event navigationstart ( boolean isredirected,  string requestheaders,  string uri )
event navigationstatechanged ( boolean cangoback,  boolean cangoforward )
event pdfprintfinished ( string pdffile,  boolean result,  integer errorcode )
event resourceredirect ( string redirecturl,  string headers )
event titletextchanged ( string titletext )
event webmessagereceived ( string uri,  boolean isjson,  string webmessage )
end type
global webbrowser_empty webbrowser_empty

type variables
boolean contextmenu 
boolean popupwindow 
string defaulturl 
end variables

forward prototypes
public function integer canceldownload (integer itemid)
public function integer  closedefaultdownloaddialog ( )  
public function integer 	   evaluatejavascriptasync ( string script ) 
public function integer 	   evaluatejavascriptsync ( string script )  
public function integer 	   evaluatejavascriptsync ( string script, ref string result )  
public function integer 	   evaluatejavascriptsync ( string script, ref string result, ref string error )  
public function string 	   getsource ( )  
public function integer 	   goback ( )  
public function integer 	   goforward ( )  
public function integer 	   navigate ( string url )  
public function integer 	   navigatetostring ( string html ) 
public function integer 	   opendefaultdownloaddialog ( )  
public function integer 	   pausedownload ( integer itemid ) 
public function integer 	   postjsonwebmessage ( string json )  
public function integer 	   poststringwebmessage ( string webmessage )  
public function integer 	   print ( )  
public function integer 	   printaspdf ( string pdffile ) 
public function integer 	   refresh ( )   
public function integer 	   registerevent ( string eventname ) 
public function integer 	   resumedownload ( integer itemid ) 
public function integer 	   stopnavigation ( )  
public function integer 	   unregisterevent ( string eventname )  
public function integer 	   zoom ( integer zoomlevel )  

end prototypes

event type long certificateerror(string errortext, string requesturl, string certificateinfo);return 0
end event

public function integer canceldownload (integer itemid);return 0
end function

public function integer  closedefaultdownloaddialog ( )  ;return 0
end function

public function integer 	   evaluatejavascriptasync ( string script )  ;return 0
end function

public function integer 	   evaluatejavascriptsync ( string script ) ;return 0
end function

public function integer 	   evaluatejavascriptsync ( string script, ref string result ) ;return 0
end function

public function integer 	   evaluatejavascriptsync ( string script, ref string result, ref string as_error ) ;return 0
end function

public function string 	   getsource ( ) ;return ""
end function

public function integer 	   goback ( )  ;return 0
end function

public function integer 	   goforward ( ) ;return 0
end function

public function integer 	   navigate ( string url ) ;return 0
end function

public function integer 	   navigatetostring ( string html ) ;return 0
end function

public function integer 	   opendefaultdownloaddialog ( )  ;return 0
end function

public function integer 	   pausedownload ( integer itemid )  ;return 0
end function

public function integer 	   postjsonwebmessage ( string json ) ;return 0
end function

public function integer 	   poststringwebmessage ( string webmessage )  ;return 0
end function

public function integer 	   print ( )  ;return 0
end function

public function integer 	   printaspdf ( string pdffile ) ;return 0
end function

public function integer 	   refresh ( ) ;return 0
end function

public function integer 	   registerevent ( string eventname )  ;return 0
end function

public function integer 	   resumedownload ( integer itemid )  ;return 0
end function

public function integer 	   stopnavigation ( )  ;return 0
end function

public function integer 	   unregisterevent ( string eventname )  ;return 0
end function

public function integer 	   zoom ( integer zoomlevel ) ;return 0
end function

on webbrowser_empty.create
end on

on webbrowser_empty.destroy
end on

