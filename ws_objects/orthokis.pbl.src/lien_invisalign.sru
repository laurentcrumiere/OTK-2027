$PBExportHeader$lien_invisalign.sru
forward
global type lien_invisalign from userobject
end type
type shl_login from statichyperlink within lien_invisalign
end type
type shl_connect from statichyperlink within lien_invisalign
end type
type pb_lancer from picturebutton within lien_invisalign
end type
end forward

global type lien_invisalign from userobject
integer width = 128
integer height = 112
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
shl_login shl_login
shl_connect shl_connect
pb_lancer pb_lancer
end type
global lien_invisalign lien_invisalign

type prototypes

end prototypes

type variables

// Contient les infos du patient
//datawindow dw_patient


string v_nom_local, v_prenom_local
date v_date_naissance_local
double v_numero_dossier_local
double v_code_local


string v_login, v_password, v_serveur
string v_id_invisalign

string v_code_praticien_local



string url_connect, url_login
end variables

forward prototypes
public subroutine init (double v_code_patient)
public function string get_login ()
public function string get_password ()
public function string get_serveur ()
public subroutine set_login (string login)
public subroutine set_serveur (string serveur)
public subroutine set_password (string password)
public subroutine init_praticien (string v_code_praticien)
end prototypes

public subroutine init (double v_code_patient);// récupération des infos de connexions au serveur Align



// Recherche des infos du patient

select nom, prenom, date_naissance , isnull(id_invisalign,''), code_praticien
into :v_nom_local, :v_prenom_local, :v_date_naissance_local, :v_id_invisalign, :v_code_praticien_local 
from patient
where code = :v_code_patient ;


// dans pwophoto.ini

 v_login = get_login()
 v_password = get_password()
 v_serveur = get_serveur()
 
url_connect = v_serveur+"login.action?username="+v_login+"&password="+v_password
shl_connect.url = url_connect



// met en place le code du patient concerné !!
v_code_local = v_code_patient



// Nouvelle commande depuis 09/2017
url_login =  v_serveur+"auth/patient/patientFile.action?patientId="+trim(v_id_invisalign)
shl_login.url = url_login


end subroutine

public function string get_login ();return profilestring(dir_photos+inifile_photo,"invisalign","login_" + v_code_praticien_local ,"") 
end function

public function string get_password ();return profilestring(dir_photos+inifile_photo,"invisalign","password_" + v_code_praticien_local,"") 
end function

public function string get_serveur ();return profilestring(dir_photos+inifile_photo,"invisalign","serveur_"+v_code_praticien_local,"") 
end function

public subroutine set_login (string login);Setprofilestring(dir_photos+inifile_photo,"invisalign","login_" + v_code_praticien_local,login) 
end subroutine

public subroutine set_serveur (string serveur);SetprofileString(dir_photos+inifile_photo,"invisalign","serveur_" + v_code_praticien_local, serveur) 
end subroutine

public subroutine set_password (string password);Setprofilestring(dir_photos+inifile_photo,"invisalign","password_" + v_code_praticien_local,password) 
end subroutine

public subroutine init_praticien (string v_code_praticien);// Code praticien 

v_code_praticien_local = v_code_praticien

// dans pwophoto.ini

 v_login = get_login()
 v_password = get_password()
 v_serveur = get_serveur()
 
url_connect = v_serveur+"login.action?username="+v_login+"&password="+v_password
shl_connect.url = url_connect


//// Récupération des infos de liaisons au Net
//service_internet = create Inet 
//GetContextService("Internet", service_internet)

end subroutine

on lien_invisalign.create
this.shl_login=create shl_login
this.shl_connect=create shl_connect
this.pb_lancer=create pb_lancer
this.Control[]={this.shl_login,&
this.shl_connect,&
this.pb_lancer}
end on

on lien_invisalign.destroy
destroy(this.shl_login)
destroy(this.shl_connect)
destroy(this.pb_lancer)
end on

type shl_login from statichyperlink within lien_invisalign
integer x = 1038
integer y = 160
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "Login"
boolean focusrectangle = false
end type

type shl_connect from statichyperlink within lien_invisalign
integer x = 1038
integer y = 76
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "Login"
boolean focusrectangle = false
end type

type pb_lancer from picturebutton within lien_invisalign
integer width = 128
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "Lc_icone_invisalign.png"
alignment htextalign = left!
string powertiptext = "Lance le portail Invisalign sur le patient courant"
end type

event rbuttondown;	//run('cmd /C start "Invisalign" "' + shl_connect.url +'"')
	openurl ( shl_connect.url)
	

end event

event clicked;if len(trim(v_id_invisalign)) = 0 then
	Messagebox("ATTENTION","Le patient "+v_nom_local+" "+v_prenom_local+" n'a pas d'identifiant pour Invisalign.")
else
	// link !

//	run('cmd /C start "Invisalign" "' + shl_login.url +'"')
	openurl ( shl_login.url )
end if

end event

