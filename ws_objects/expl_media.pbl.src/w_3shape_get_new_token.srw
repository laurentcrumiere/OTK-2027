$PBExportHeader$w_3shape_get_new_token.srw
forward
global type w_3shape_get_new_token from window
end type
type cb_4 from uo_picturebutton_390x120 within w_3shape_get_new_token
end type
type cb_3 from uo_picturebutton_390x120_fermer within w_3shape_get_new_token
end type
type uo_3shape from lien_3shape_2026 within w_3shape_get_new_token
end type
type mle_code_autorisation from multilineedit within w_3shape_get_new_token
end type
type mle_url from multilineedit within w_3shape_get_new_token
end type
type wb_1 from webbrowser within w_3shape_get_new_token
end type
end forward

global type w_3shape_get_new_token from window
integer width = 2606
integer height = 2464
boolean titlebar = true
string title = "Demande d~'une nouvelle autorisation"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
cb_3 cb_3
uo_3shape uo_3shape
mle_code_autorisation mle_code_autorisation
mle_url mle_url
wb_1 wb_1
end type
global w_3shape_get_new_token w_3shape_get_new_token

type variables
string is_last_url, is_code_autorisation, is_clef_privee
end variables

on w_3shape_get_new_token.create
this.cb_4=create cb_4
this.cb_3=create cb_3
this.uo_3shape=create uo_3shape
this.mle_code_autorisation=create mle_code_autorisation
this.mle_url=create mle_url
this.wb_1=create wb_1
this.Control[]={this.cb_4,&
this.cb_3,&
this.uo_3shape,&
this.mle_code_autorisation,&
this.mle_url,&
this.wb_1}
end on

on w_3shape_get_new_token.destroy
destroy(this.cb_4)
destroy(this.cb_3)
destroy(this.uo_3shape)
destroy(this.mle_code_autorisation)
destroy(this.mle_url)
destroy(this.wb_1)
end on

event open;if uo_3shape.ii_code_scanner  = 0 then 
	// pas encore initialiser
	uo_3shape.ii_code_scanner = uo_3shape.quel_scanner_utiliser()
	uo_3shape.is_groupe_token = "TOKEN-" + string(uo_3shape.ii_code_scanner) 
end if

if uo_3shape.ii_code_scanner > 0 then

	string ls_code_challenge, ls_code_autorisation
	blob lblb_data, lblb_encrypt
	
	
	is_clef_privee = upper( uo_3shape.wf_generer_clef_privee())
	//Messagebox("Clef Privée", is_clef_privee )
	
	lblb_data = Blob(is_clef_privee , EncodingANSI!)
	
	
	// pour cryptage
	CrypterObject lnv_CrypterObject
	lnv_CrypterObject = Create CrypterObject
	
	lblb_encrypt = lnv_CrypterObject.sha(SHA256!, lblb_data)
	ls_code_challenge = string(lblb_encrypt, EncodingUTF8! )
	//Messagebox("Code Challenge Crypté", ls_code_challenge )
	
	// pour codage en base 64
	CoderObject lnv_CoderObject
	lnv_CoderObject = Create CoderObject
	ls_code_challenge = string(lnv_CoderObject.Base64UrlEncode(lblb_encrypt ) ) 
	
	//Messagebox("Code Challenge base 64", ls_code_challenge )
	
	
	string ls_url_connexion
	
	ls_url_connexion = "https://identity.3shape.com/connect/authorize?client_id=" + lien_3shape_2026.code_client + "&response_type=code&scope=openid+api+profile+api.workflow.init+api.media.read+api.media.download+api.cases.read+api.patients.create+license.read+offline_access&redirect_uri=http://localhost/&code_challenge=" + ls_code_challenge + "&code_challenge_method=S256&response_mode=query"
	
	wb_1.Navigate(ls_url_connexion)
	
	
end if
	
	

end event

type cb_4 from uo_picturebutton_390x120 within w_3shape_get_new_token
integer x = 1230
integer y = 2104
integer width = 585
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Valider"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;// Demande effective du nouveau jeton
string ls_body
ls_body = "code=" + uo_3shape.wf_get_code_autorisation() +  "&client_id=" + uo_3shape.code_client + "&grant_type=authorization_code&redirect_uri=http://localhost/&code_verifier=" + uo_3shape.wf_get_clef_privee()

open(w_patience)
if uo_3shape.lancer_commande_3shape("https://identity.3shape.com/connect/token", ls_body, "POST", true, "J") = 1 then
	
	// Mémo des valeurs reçues
	uo_3shape.wf_set_token()
	
	Messagebox("INFORMATION", "La nouvelle autorisation a été obtenue et mémorisée !")
end if
close(w_patience)

//close(parent)
end event

type cb_3 from uo_picturebutton_390x120_fermer within w_3shape_get_new_token
integer x = 576
integer y = 2104
integer width = 585
integer taborder = 20
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "&Annuler"
end type

type uo_3shape from lien_3shape_2026 within w_3shape_get_new_token
integer x = 2898
integer y = 920
integer width = 558
integer height = 400
integer taborder = 30
end type

on uo_3shape.destroy
call lien_3shape_2026::destroy
end on

type mle_code_autorisation from multilineedit within w_3shape_get_new_token
integer x = 2647
integer y = 464
integer width = 2569
integer height = 88
integer taborder = 20
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "?"
boolean vscrollbar = true
boolean autohscroll = true
borderstyle borderstyle = stylelowered!
end type

type mle_url from multilineedit within w_3shape_get_new_token
integer x = 2647
integer y = 356
integer width = 2569
integer height = 88
integer taborder = 10
integer textsize = -9
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "?"
boolean vscrollbar = true
boolean autohscroll = true
borderstyle borderstyle = stylelowered!
end type

type wb_1 from webbrowser within w_3shape_get_new_token
integer x = 9
integer y = 12
integer width = 2569
integer height = 2016
end type

event addresschange;integer li_pos_code, li_pos_scope


is_last_url = newurl
mle_url.Text = newurl

li_pos_code = pos(is_last_url, "code=", 1)
li_pos_scope = pos(is_last_url, "&scope=", 1)

// Récupération du code sour la forme
// http://localhost/?code=A3F539A07AD2D74D32F1CCDF4639467BAD0267F1276C5B52F288B55EC7F4C055-1&scope=openid%20api%20profile%20api.workflow.init%20api.media.read%20api.media.download%20api.cases.read%20api.patients.create%20license.read%20offline_access&session_state=aVGr9_oXyX6B4I0jmWbbngb4WmcExB7nBlhTZuU2uGw.586112481DC5DEBA4313E040726D581F&iss=https%3A%2F%2Fidentity.3shape.com

is_code_autorisation = mid(is_last_url, li_pos_code + 5, li_pos_scope - li_pos_code - 5)

mle_code_autorisation.text = is_code_autorisation

if is_code_autorisation <> "-1" then 
	// Mémorisation des infos pour la prochaine fois
	uo_3shape.wf_set_cle_privee(is_clef_privee)
	uo_3shape.wf_set_code_autorisation(is_code_autorisation)
end if





end event

