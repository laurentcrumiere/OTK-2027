$PBExportHeader$lien_rayscan.sru
forward
global type lien_rayscan from userobject
end type
type cb_modifier from commandbutton within lien_rayscan
end type
type cb_smart from commandbutton within lien_rayscan
end type
type cb_utiliser from commandbutton within lien_rayscan
end type
type p_1 from picture within lien_rayscan
end type
end forward

global type lien_rayscan from userobject
integer width = 937
integer height = 200
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_modifier cb_modifier
cb_smart cb_smart
cb_utiliser cb_utiliser
p_1 p_1
end type
global lien_rayscan lien_rayscan

type prototypes

end prototypes

type variables

// Pour les infos du patient
double var_code_local




string url_rayscan
constant string nom_fichier_recu = "rayscan.tmp"


double v_code
string v_nom 
string v_prenom 
date v_date_naissance  
string v_sexe
string v_libelle_sexe

string commande_ajout 
string commande_modif
string commande_suppr

string commande_complete

// Accées internet
Inet iinet_base

// Retour XML
n_inetresult in_irdata

end variables

forward prototypes
public function string get_url_serveur ()
public subroutine set_url_serveur (string url)
public subroutine init_variables ()
public function string get_exe ()
public subroutine set_exe (string v_prog_exe)
end prototypes

public function string get_url_serveur ();return profilestring(dir_photos+inifile_photo,"rayscan","url_serveur","https://localhost:9090/WebAdapter.asmx/") 
end function

public subroutine set_url_serveur (string url);Setprofilestring(dir_photos+inifile_photo,"rayscan","url_serveur", url) 
end subroutine

public subroutine init_variables ();
// initialisation des variables

	
select isnull(nom,''), isnull(prenom,''), date_naissance, isnull(sexe , 'M') 
into :v_nom, :v_prenom  , :v_date_naissance  , :v_sexe  
from patient
where code = :var_code_local ;
	
	
v_code = var_code_local

if isnull(v_date_naissance) then 
	v_date_naissance = date("1900-01-01")
end if
if v_sexe = "M" then
	v_libelle_sexe = "male"
else
	v_libelle_sexe = "female"
end if

string v_code_ajout

v_code_ajout =  string( v_code)
if SERIAL = "87499" then
	// Spécial Objectif sourire pour être sur uniciter % autres softs
	v_code_ajout = "PWO" + v_code_ajout
end if

commande_ajout = "InsertPatient?id=" + v_code_ajout +"&name="+trim(v_prenom) + " " + v_nom + "&birthday=" + string(v_date_naissance, "yyyy-mm-dd") + "&sex=" + v_libelle_sexe
commande_modif = "EditPatient?id=" + string( v_code) +"&name="+trim(v_prenom) + " " + v_nom + "&birthday=" + string(v_date_naissance, "yyyy-mm-dd") + "&sex=" + v_libelle_sexe
commande_suppr = "DeletePatient?id=" + string( v_code) 

end subroutine

public function string get_exe ();
return profilestring(dir_ini+inifile_orthokis,"rayscan","exe","") 
end function

public subroutine set_exe (string v_prog_exe);Setprofilestring(dir_ini+inifile_orthokis,"Rayscan","exe",v_prog_exe) 

end subroutine

on lien_rayscan.create
this.cb_modifier=create cb_modifier
this.cb_smart=create cb_smart
this.cb_utiliser=create cb_utiliser
this.p_1=create p_1
this.Control[]={this.cb_modifier,&
this.cb_smart,&
this.cb_utiliser,&
this.p_1}
end on

on lien_rayscan.destroy
destroy(this.cb_modifier)
destroy(this.cb_smart)
destroy(this.cb_utiliser)
destroy(this.p_1)
end on

event constructor;this.GetContextService("Internet", iinet_base)
in_irdata = CREATE n_inetresult

url_rayscan = get_url_serveur()
end event

type cb_modifier from commandbutton within lien_rayscan
integer x = 279
integer y = 92
integer width = 297
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Modifier"
end type

event clicked;integer li_rc

init_variables()

commande_complete =  url_rayscan + commande_modif

li_rc = iinet_base.GetURL(commande_complete, in_irdata)

if li_rc = 1 then
	
	in_irdata.of_WriteFile("c:\power\ortho\" + nom_fichier_recu, in_irdata.iblob_data)
	
	MessageBox("INFORMATION","Modification effectuée.")
	
end if
end event

type cb_smart from commandbutton within lien_rayscan
integer x = 581
integer y = 92
integer width = 338
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "SmartDent"
end type

event clicked;integer li_rc


string v_exe


v_exe = get_exe()

init_variables()


commande_complete =  v_exe +' "' + string(var_code_local) + '" "' + v_nom + '"'  

run(commande_complete)

end event

type cb_utiliser from commandbutton within lien_rayscan
integer x = 5
integer y = 92
integer width = 270
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Ajouter"
end type

event clicked;
integer li_rc

init_variables()

commande_complete =  url_rayscan + commande_ajout

li_rc = iinet_base.GetURL(commande_complete, in_irdata)

if li_rc = 1 then
	
	in_irdata.of_WriteFile("c:\power\ortho\" + nom_fichier_recu, in_irdata.iblob_data)

	MessageBox("INFORMATION","Ajout effectué.")
	
end if
end event

type p_1 from picture within lien_rayscan
integer x = 27
integer width = 869
integer height = 80
string picturename = "lc_logo_rayscan.png"
boolean focusrectangle = false
end type

