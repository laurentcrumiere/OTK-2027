$PBExportHeader$lien_myray.sru
forward
global type lien_myray from userobject
end type
type cb_utiliser from commandbutton within lien_myray
end type
type p_1 from picture within lien_myray
end type
end forward

global type lien_myray from userobject
integer width = 937
integer height = 200
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_utiliser cb_utiliser
p_1 p_1
end type
global lien_myray lien_myray

type prototypes

end prototypes

type variables



string v_nom, v_prenom, v_id, v_praticien, date_naissance_myray, v_sexe
double v_code_local, v_numero_dossier 
date v_date_naissance



string v_rep_radio, v_exe

// Mode VDDS ou non pour MyRay
boolean mode_vdds = false
string nom_lien_vdds

// Nouveau lien Neowise .. on le detectera en fonction de l'exe qu'on a configuré pour le lien
boolean NEOWISE = false


end variables

forward prototypes
public subroutine gestion_planmeca (integer action)
public subroutine message_erreur_dimaxis (integer code_erreur)
public function string get_rep_radio ()
public function string get_programme_exe_path ()
public function integer set_programme_exe_path (string v_prog_exe)
public function integer set_rep_radio (string v_rep)
public subroutine init (double v_code)
end prototypes

public subroutine gestion_planmeca (integer action);
end subroutine

public subroutine message_erreur_dimaxis (integer code_erreur);
end subroutine

public function string get_rep_radio ();v_rep_radio = profilestring(dir_photos+"pwophotos.ini","myray","rep_radio","") 
return v_rep_radio
end function

public function string get_programme_exe_path ();v_exe = profilestring(dir_ini+inifile_orthokis,"myray","exe","") 

if upper(gfx_extraire_nom_fichier(v_exe)) = "BRIDGE-WIN.EXE" then
	NEOWISE = true 
	cb_utiliser.width = 878
	cb_utiliser.x = 27
	cb_utiliser.text = "Utiliser Patient Neowise"
end if

return v_exe
end function

public function integer set_programme_exe_path (string v_prog_exe);integer result 
v_exe = v_prog_exe
result = Setprofilestring(dir_ini+inifile_orthokis,"myray","exe",v_exe) 
return result
end function

public function integer set_rep_radio (string v_rep);integer result 
v_rep_radio = v_rep
result = Setprofilestring(dir_photos+"pwophotos.ini","myray","rep_radio",v_rep_radio) 
return result
end function

public subroutine init (double v_code);// intialisation des variables locales

date v_date_nais

v_code_local = v_code
v_id = string(v_code)

get_rep_radio()
get_programme_exe_path()


select patient.nom, patient.prenom, isnull(patient.sexe, 'M'), trim(isnull(prati.nom,'') + ' '+ isnull(prati.prenom,'')) , isnull(date_naissance, cast(getdate() as date)), numero_dossier 
into :v_nom, :v_prenom, :v_sexe, :v_praticien , :v_date_naissance, :v_numero_dossier 
from patient, prati
where patient.code_praticien = prati.code and patient.code = :v_code ;

date_naissance_myray = string(day(v_date_naissance))+","+string(month(v_date_naissance))+","+string(year(v_date_naissance))


// Mode VDDS ou non ??

string ini_vdds = "C:\Windows\VDDS_MMI.INI"
string v_name
integer i = 1
mode_vdds = false
nom_lien_vdds = ""
if FileExists(ini_vdds) then
	do while i <= 10 and  not mode_vdds
		v_name = trim( profilestring(ini_vdds, "BVS", "NAME" + string(i), "") )
		if upper(v_name) = "IRYS" then
			mode_vdds = true
			nom_lien_vdds = v_name
			cb_utiliser.width = 878
			cb_utiliser.x = 27
			cb_utiliser.text = "Utiliser Patient Irys"
		end if
		i = i + 1
	loop 
end if


end subroutine

on lien_myray.create
this.cb_utiliser=create cb_utiliser
this.p_1=create p_1
this.Control[]={this.cb_utiliser,&
this.p_1}
end on

on lien_myray.destroy
destroy(this.cb_utiliser)
destroy(this.p_1)
end on

type cb_utiliser from commandbutton within lien_myray
integer x = 210
integer y = 100
integer width = 475
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Utiliser Patient"
end type

event clicked;// Mode classique ou mode VDDS ???

if not mode_vdds then

	string cde
	
	Trace("lancement LIEN MYRAY en mode non VDDS")
	
	if NEOWISE then
		// La commande rest du type : "C:\Program Files\Cefla\Neowise\diagnostic-viewer\bridge\bridge-win.exe" /patid 123456 /name "JOHN PAUL" /surname "DE VILLE" /dateb 16,03,1974 /SEX M /operator "Dr. Gregory House"
		cde = '"' + v_exe +'" /patid '+v_id+' /name "' + v_prenom + '" /surname "'  + v_nom + '" /sex ' + v_sexe + ' /dateb ' + date_naissance_myray +' /operator "' + v_praticien  + '"'
		Trace( "- lien NEOWISE : " + cde )
	else
		// C'est NNT la passerelle
		cde = v_exe + " /OPENPATIENT /patid "+v_id+" /name "+v_nom+" /surname "+v_prenom +" /sex "+v_sexe+" /dateb "+date_naissance_myray +" /operator "+v_praticien+" /DIR "+v_rep_radio+v_id
		Trace( "- lien NNT : " + cde )
end if
	
	// Pour le lien NNT, écriture du code patient dans Orthokis.ini ...
	SetProfileString (dir_ini+inifile_orthokis,"myray","code_patient", string(v_id) ) 
	
	
	run(cde)
	
else
	Trace("lancement LIEN MYRAY en mode VDDS => Acquisition.exe")
	// 	mode VDDS => Acquisition.exe
	uo_lien_radios lien_radios
	lien_radios = create uo_lien_radios
	if lien_radios.init(5) = 1 then
		lien_radios.prepa_fichier_ini_vdds("Creer", nom_lien_vdds)
		lien_radios.lancer_lien( v_code_local )
	end if

end if
end event

type p_1 from picture within lien_myray
integer x = 183
integer width = 521
integer height = 128
string picturename = "lc_logo_myray.png"
boolean focusrectangle = false
end type

