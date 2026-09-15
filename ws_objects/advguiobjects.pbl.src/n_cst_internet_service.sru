$PBExportHeader$n_cst_internet_service.sru
forward
global type n_cst_internet_service from internetresult
end type
end forward

global type n_cst_internet_service from internetresult
end type
global n_cst_internet_service n_cst_internet_service

type prototypes
//FUNCTION int Base64Decode ( ref string source, ref string result, int n ) LIBRARY "BASE64.DLL" ALIAS FOR "Base64Decode;ansi"
FUNCTION string Encode ( string source) LIBRARY "Base64.dll" alias for "Encode;Ansi"// ALIAS FOR "Encode;ansi"
end prototypes

type variables
protected:
blob ibl_data
Inet  invo_inet
string is_error
string is_header
int ii_max_error_num = 10
end variables

forward prototypes
public function integer internetdata (blob data)
public function integer of_internet_connect ()
public function string of_get_error ()
public function string of_get_data ()
public function integer of_get_url (string as_url)
public function integer of_fileread (integer a_file, ref blob a_blob)
public function integer of_base64_decode (string as_string)
public function integer of_loadfile (string a_filename, ref blob ablb_data)
public function integer of_post_url_old (string as_url, blob ablb_arguments, integer ai_port)
public function integer of_post_url (string as_url, blob ablb_arguments, string as_headers, integer ai_port)
public function integer of_post_url (string as_url, blob ablb_arguments, string as_header)
public function blob of_get_data_blob ()
end prototypes

public function integer internetdata (blob data);ibl_data = data

Return 1
end function

public function integer of_internet_connect ();integer li_ret = 1

li_ret = GetContextService("Internet", invo_inet)

choose case li_ret
	case 1
		is_error = ''
end choose

return li_ret
end function

public function string of_get_error ();return is_error
end function

public function string of_get_data ();return string(ibl_data, EncodingANSI!)
end function

public function integer of_get_url (string as_url);integer li_ret = 1

li_ret = invo_inet.GetUrl(as_url, this)

choose case li_ret
	case 1
		is_error = ''
	case -1
		is_error = 'General error'
	case -2
		is_error = 'Invalid URL'
	case -4  
		is_error = 'Cannot connect to the Internet'
end choose

return li_ret
end function

public function integer of_fileread (integer a_file, ref blob a_blob);integer li_ret = 1
blob lb_data

do while FileRead(a_file, lb_data) > 0 
	if isNull(a_blob) then 
		a_blob = lb_data
	else
		a_blob = a_blob + lb_data
	end if
loop

if isNull(a_blob) then li_ret = -1

return li_ret



end function

public function integer of_base64_decode (string as_string);integer li_ret = 1
string ls_source, ls_result

//li_ret = base64decode( ls_source, ls_result, len(ls_source))
MessageBox('Encoded', Encode( ls_source ))

return li_ret
end function

public function integer of_loadfile (string a_filename, ref blob ablb_data);integer li_ret = 1, li_file
blob lblb_blob

li_file = FileOpen(a_filename, StreamMode!)
if li_file <> -1 then
	setnull(lblb_blob)
	if of_fileread(li_file, lblb_blob) = 1 then
		FileClose(li_file)
		ablb_data = lblb_blob
	end if
end if

return li_ret
end function

public function integer of_post_url_old (string as_url, blob ablb_arguments, integer ai_port);integer li_ret = 1
Blob    lblb_args
String  ls_headers
String  ls_url
Long    ll_length

ls_url = as_url + "?"
lblb_args = ablb_arguments
ll_length = Len(lblb_args) 
/*
ls_headers = "Content-Type: " + &
		"application/octet-streem" + &		
		"Content-Transfer-Encoding: binary~n" +&
      "Content-Length: " + String( ll_length ) + "~n~n"
*/		
ls_headers = "Content-Type: multipart/form-data, boundary=OLEISMLLRU"
MessageBox('blob', string(lblb_args))
lblb_args = blob('--OLEISMLLRU~r~n' +&
'Content-Disposition: form-data; name="dbid"~r~n' +&
'~r~n' +&
'some_dbid_parameter~r~n' +&
'--OLEISMLLRU~r~n' +&
'Content-Disposition: form-data; name="pass"~r~n' +&
'~r~n' +&
'some_pass_parameter~r~n' +&
'--OLEISMLLRU~r~n' +&
'Content-Disposition: form-data; name="record"~r~n' +&
'~r~n' +&
'record_parameter~r~n' +&
'--OLEISMLLRU~r~n' +&
'Content-Disposition: form-data; name="userfile"; filename="c:\avk\test.zip"~r~n' +&
'Content-Type: image/gif~r~n' +&
'~r~n') +&
lblb_args
//blob('--OLEISMLLRU--')

li_ret = invo_inet.PostURL(ls_url, lblb_args, ls_headers, ai_port, this)

choose case li_ret
	case 1
		is_error = ''
	case -1
		is_error = 'General error'
	case -2
		is_error = 'Invalid URL'
	case -4
		is_error = 'Cannot connect to the Internet'
	case -5
		is_error = 'Unsupported secure (HTTPS) connection attempted'
	case -6
		is_error = 'Internet request failed'
end choose

return li_ret
end function

public function integer of_post_url (string as_url, blob ablb_arguments, string as_headers, integer ai_port);integer li_i, li_ret = 1

for li_i = 1 to ii_max_error_num
	li_ret = invo_inet.PostURL(as_url, ablb_arguments, as_headers, ai_port, this)
	if li_ret = 1 then exit
next

choose case li_ret
	case 1
		is_error = ''
	case -1
		is_error = 'General error'
	case -2
		is_error = 'Invalid URL'
	case -4
		is_error = 'Cannot connect to the Internet'
	case -5
		is_error = 'Unsupported secure (HTTPS) connection attempted'
	case -6
		is_error = 'Internet request failed'
end choose

return li_ret
end function

public function integer of_post_url (string as_url, blob ablb_arguments, string as_header);integer li_ret = 1

li_ret = of_post_url( as_url, ablb_arguments, as_header, 80 )

return li_ret
end function

public function blob of_get_data_blob ();return ibl_data
end function

on n_cst_internet_service.create
call super::create
TriggerEvent( this, "constructor" )
end on

on n_cst_internet_service.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

