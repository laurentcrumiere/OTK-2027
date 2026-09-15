$PBExportHeader$uo_lien_perso.sru
forward
global type uo_lien_perso from userobject
end type
type pb_1 from picturebutton within uo_lien_perso
end type
end forward

global type uo_lien_perso from userobject
integer width = 160
integer height = 144
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_1 pb_1
end type
global uo_lien_perso uo_lien_perso

type variables

double var_code_local
string s_url, s_icone_url
string s_numero_url
end variables

forward prototypes
public subroutine init (double v_code_local, string numero_url)
end prototypes

public subroutine init (double v_code_local, string numero_url);// recherche de l'icone et de l'url en base de données
var_code_local = v_code_local
s_numero_url = numero_url

choose case s_numero_url
	case "1"
		select trim(isnull(url1, '')), trim(isnull(icone_url1, '')) into :s_url, :s_icone_url  
		from patient 
		where code = :var_code_local ;
	case "2"
		select trim(isnull(url2, '')), trim(isnull(icone_url2, '')) into :s_url, :s_icone_url  
		from patient 
		where code = :var_code_local ;
end choose


if s_url <> "" then
	pb_1.text = ""
	pb_1.PowerTipText = s_url
	
	if s_icone_url <> "" then
		pb_1.picturename = dir_photos + string(var_code_local) + win_delimiter + s_icone_url
	else
		pb_1.backcolor = couleur_verte
		pb_1.picturename = ""
	end if
else
	pb_1.text = "?"
	pb_1.backcolor = couleur_jaune
	pb_1.picturename = ""
	pb_1.PowerTipText = "Lien personnalisé non défini !"
end if


end subroutine

on uo_lien_perso.create
this.pb_1=create pb_1
this.Control[]={this.pb_1}
end on

on uo_lien_perso.destroy
destroy(this.pb_1)
end on

event constructor;pb_1.height = this.height
pb_1.width = this.width
end event

type pb_1 from picturebutton within uo_lien_perso
integer width = 151
integer height = 136
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "?"
boolean flatstyle = true
long backcolor = 65535
end type

event clicked;if s_url = "" then
	Messagebox("ATTENTION","Vous n'avez pas encore défini de lien pour ce patient.~n~nSi vous souhaitez le faire, veuillez cliquer avec le bouton droit de la souris.")
else
	//run('cmd /C start "Lien Personnalié" "' + s_url +'"')
	openurl ( s_url )	
end if
end event

event rbuttondown;
// Paramétrage
param_win[1] = s_numero_url
OpenWithParm(w_url_parametrage, var_code_local)

// Actualisation des infos
init(var_code_local, s_numero_url)
end event

