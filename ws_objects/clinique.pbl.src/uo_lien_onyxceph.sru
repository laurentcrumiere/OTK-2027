$PBExportHeader$uo_lien_onyxceph.sru
forward
global type uo_lien_onyxceph from userobject
end type
type pb_1 from picturebutton within uo_lien_onyxceph
end type
end forward

global type uo_lien_onyxceph from userobject
integer width = 128
integer height = 120
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_1 pb_1
end type
global uo_lien_onyxceph uo_lien_onyxceph

type variables

double var_code_local
string fichier_exe_onyx  = "OnyxCeph.exe"
string fichier_onyx_complet
end variables

forward prototypes
public subroutine init (double v_code_local)
end prototypes

public subroutine init (double v_code_local);var_code_local = v_code_local

string dir_onyx

RegistryGet(" HKEY_LOCAL_MACHINE\SOFTWARE\Image Instruments\OnyxCeph\Install","path",dir_onyx)

if dir_onyx = "" then 
	dir_onyx = "C:\Program Files (x86)\Image Instruments\Onyx3Client\"
	
	 if FileExists( dir_onyx + fichier_exe_onyx ) then 
		fichier_onyx_complet = dir_onyx + fichier_exe_onyx
	else
		dir_onyx = "C:\Program Files\Image Instruments\Onyx3Client\"
		
		 if FileExists( dir_onyx + fichier_exe_onyx ) then 
			fichier_onyx_complet = dir_onyx + fichier_exe_onyx
		else
			fichier_onyx_complet = ""
		end if		
	end if
else
	fichier_onyx_complet = dir_onyx + fichier_exe_onyx
end if

end subroutine

on uo_lien_onyxceph.create
this.pb_1=create pb_1
this.Control[]={this.pb_1}
end on

on uo_lien_onyxceph.destroy
destroy(this.pb_1)
end on

event constructor;pb_1.height = this.height
pb_1.width = this.width
end event

type pb_1 from picturebutton within uo_lien_onyxceph
integer width = 123
integer height = 112
integer taborder = 10
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_onyxceph.png"
long backcolor = 16776960
end type

event clicked;
// Recherche des éléments à passer en paramètre
double v_code
string v_nom, v_prenom, v_sexe
date v_date_naissance

string v_commande 

if fileExists(fichier_onyx_complet) then
	select isnull(nom, '') , isnull (prenom, ''), isnull(sexe, 'M'), isnull(date_naissance, cast(getdate() as date)), code
	into :v_nom, :v_prenom,:v_sexe, :v_date_naissance, :v_code
	from patient where code = :var_code_local ;
	
	v_commande = '-PatId="' + string(v_code) + '" -Firstname="' + v_prenom + '" -Lastname="' + v_nom + '" -Birthday="' + string(v_date_naissance, 'yyyymmdd')+ '" -Sex="' + v_sexe + '"'
	
	run(fichier_onyx_complet + " " + v_commande)
else
	Messagebox("ATTENTION","Impossible de localiser le programe OnyxCeph sur ce poste !")
end if
end event

