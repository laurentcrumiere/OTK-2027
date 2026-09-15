$PBExportHeader$uo_email_bundle.sru
forward
global type uo_email_bundle from nonvisualobject
end type
end forward

shared variables

end variables

global type uo_email_bundle from nonvisualobject
end type
global uo_email_bundle uo_email_bundle

type variables
constant string unlock_code = "ARAKISFRMAILQ_hUaUqXhO1ZpE"



OLEObject ocx_email_bundle


end variables

forward prototypes
private function boolean init ()
public function long messagecount ()
public subroutine get_email (integer index, ref uo_email_email email)
end prototypes

private function boolean init ();// initialisation de la classe
boolean val_retour = false
//if gfx_open_connection_ole(ocx_email_bundle, "ChilkatMail2.ChilkatMailMan2") = 1 then 
if gfx_open_connection_ole(ocx_email_bundle, "Chilkat_9_5_0.MailMan") = 1 then 
	// indication du code de débridage de l'ocx
	if ocx_email_bundle.UnlockComponent(unlock_code) then val_retour = true
end if



//////////////////////////////////////////////////////////////////////////////////
//
//integer li_rc, li_Status
//oleobject loo_Oauth2
//integer li_Success
//string ls_Url
//integer li_NumMsWaited
//oleobject loo_Json
//oleobject loo_DtExpire
//oleobject loo_Fac
//oleobject loo_Glob
//oleobject loo_Mailman 
//
//loo_Oauth2 = create oleobject
//// Use "Chilkat_9_5_0.OAuth2" for versions of Chilkat < 10.0.0
//li_rc = loo_Oauth2.ConnectToNewObject("Chilkat_9_5_0.OAuth2")
//if li_rc < 0 then
//    destroy loo_Oauth2
//    MessageBox("Error","Connecting to COM object failed")
//    
//end if
//
//
//// This should be the port in the localhost callback URL for your app.  
//// The callback URL would look like "http://localhost:3017/" if the port number is 3017.
//loo_Oauth2.ListenPort = 3017
//
//loo_Oauth2.AuthorizationEndpoint = "https://login.microsoftonline.com/common/oauth2/v2.0/authorize"
//loo_Oauth2.TokenEndpoint = "https://login.microsoftonline.com/common/oauth2/v2.0/token"
//
//// Replace these with actual values.
//loo_Oauth2.ClientId = "f8cdef31-a31e-4b4a-93e4-5f571e91255a"
//// This is your app password:
//loo_Oauth2.ClientSecret = "aneeypvjifoksxdw"
//
//loo_Oauth2.CodeChallenge = 0
//// Provide a SPACE separated list of scopes.
//// See https://developer.microsoft.com/en-us/graph/docs/authorization/permission_scopes 
//
//// Important: To get a refresh token in the final response, you have to ask for "offline_access" scope
//loo_Oauth2.Scope = "openid profile offline_access user.readwrite mail.readwrite mail.send files.readwrite"
//
//// Begin the OAuth2 three-legged flow.  This returns a URL that should be loaded in a browser.
//ls_Url = loo_Oauth2.StartAuth()
//if loo_Oauth2.LastMethodSuccess <> 1 then
//   MessageBox("Error", string(loo_Oauth2.LastErrorText ) )
//    destroy loo_Oauth2
//end if
//
//
/////////////////////////////////////////////


return val_retour

end function

public function long messagecount ();

return long( ocx_email_bundle.MessageCount)
end function

public subroutine get_email (integer index, ref uo_email_email email);
// place un email lun par le budbble dans l'ocx email qui va bien 
email.ocx_email = ocx_email_bundle.getemail(index)

 
end subroutine

on uo_email_bundle.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_email_bundle.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event destructor;destroy ocx_email_bundle
end event

event constructor;init()
end event

