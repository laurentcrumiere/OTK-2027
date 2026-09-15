$PBExportHeader$jsonparser_empty.sru
$PBExportComments$Emptyclass for compatibility with Webview2
forward
global type jsonparser_empty from userobject
end type
end forward

global type jsonparser_empty from userobject
integer width = 503
integer height = 864
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
end type
global jsonparser_empty jsonparser_empty

forward prototypes
public function string loadstring (string jsondata)
public function long getrootitem ()
public function string getitemstring (long parentitemhandle, string key)
end prototypes

public function string loadstring (string jsondata);return ''
end function

public function long getrootitem ();return 0
end function

public function string getitemstring (long parentitemhandle, string key);return ""
end function

on jsonparser_empty.create
end on

on jsonparser_empty.destroy
end on

