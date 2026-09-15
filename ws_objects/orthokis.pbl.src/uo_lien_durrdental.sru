$PBExportHeader$uo_lien_durrdental.sru
forward
global type uo_lien_durrdental from uo_lien_radio_avec_pwo_en_bd_patient
end type
end forward

global type uo_lien_durrdental from uo_lien_radio_avec_pwo_en_bd_patient
end type
global uo_lien_durrdental uo_lien_durrdental

forward prototypes
public function integer ouvrir_dbswin (double v_code)
end prototypes

public function integer ouvrir_dbswin (double v_code);// mets en place le fichier TXT et lance dbswin
int		returnval = -1
string v_sexe, v_adr1, v_tel
string	v_nom, v_prenom, date_naiss_str, v_ville, v_titre_nom, v_codep
date	v_date_naiss
double v_identifiant_odrade
integer v_titre
integer FileNum

string v_nom_fichier_import

setpointer(HourGlass!)

// Recherche des infos du patient ... 
//select	code, nom, prenom, date_naissance, sexe, ville_parent1, titre_patient, codep_parent1, adr1_parent1, teldom_parent1 
//into	:v_identifiant_odrade, :v_nom, :v_prenom, :v_date_naiss, :v_sexe, :v_ville, :v_titre, :v_codep, :v_adr1, :v_tel
//from	patient
//where	patient.code = :v_code ;

// depuis la version 2009 le code est invariant !!
select	code, isnull(nom,''), isnull(prenom,''), date_naissance, isnull(sexe,''), isnull(ville_parent1,''), isnull(titre_patient,''), isnull(codep_parent1,''), isnull(adr1_parent1,''), isnull(teldom_parent1,'') 
into	:v_identifiant_odrade, :v_nom, :v_prenom, :v_date_naiss, :v_sexe, :v_ville, :v_titre, :v_codep, :v_adr1, :v_tel
from	patient
where	patient.code = :v_code ;

if "87879" <= SERIAL and SERIAL <= "87881" then
	// Centres de la Mutualité Grand Sud ... on prend ID Visiodent pour le passer à DBSWin
	select isnull(identifiant_ods,0) into :v_identifiant_odrade from patient where patient.code = :v_code ;
	
	// Possibilité de paramétrer le nom de fichier d'import
	v_nom_fichier_import = ProfileString( dir_photos+"PwoPhotos.ini","DurrDental","nom_fichier_import", dir_ini+"durrdental.txt" )

else
	// Fichier nomal 
	v_nom_fichier_import = dir_ini+"durrdental.txt"
end if

// on place le fichier DURRDENTAL.TXT dans le répertoire d'installation de PWO
FileNum =FileOpen(v_nom_fichier_import,streammode!,write!,lockwrite!,replace!)


if SQLCA.SQLCode = 0 then
// si pas de pb
	select nom into :v_titre_nom from titre_personnes where code = :v_titre ;
	
	
	// mise en conformité des val récup
	if isnull( v_nom ) then v_nom = ""
	if isnull( v_prenom ) then v_prenom = ""
	if isnull( v_ville ) then v_ville = ""
	if isnull( v_sexe) then v_sexe = ""
	if isnull( v_titre_nom) then v_titre_nom = ""
	if isnull( v_codep) then v_codep = ""
	
	if isnull( v_date_naiss ) then
		date_naiss_str = ""
	elseif string(v_date_naiss, "dd/mm/yyyy") = "01/01/1900" then
		date_naiss_str = ""
	else
		date_naiss_str = string(v_date_naiss, "dd.mm.yyyy" )
	end if
	
	
	FileWrite(FileNum,v_nom+";"+v_prenom+";"+date_naiss_str+";"+string(v_identifiant_odrade)+";"+v_ville+";"+v_adr1+";"+v_tel+";"+v_titre_nom+";"+v_sexe+";"+v_codep+";")
	
	FileClose(filenum)
	
//	messagebox("stop","stop!")
	
	run(get_programme_exe_path())
	
	returnval = 1
else
// erreur de récupération de données
	messagebox("ERREUR ...", "Impossible de récupérer les informations du patient. ~n~nOpération annulée.", StopSign!)
end if

setpointer(Arrow!)

return returnval
end function

on uo_lien_durrdental.create
call super::create
end on

on uo_lien_durrdental.destroy
call super::destroy
end on

event constructor;call super::constructor;init(radio_durrdental)
end event

