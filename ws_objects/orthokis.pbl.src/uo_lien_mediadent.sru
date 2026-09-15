$PBExportHeader$uo_lien_mediadent.sru
forward
global type uo_lien_mediadent from uo_lien_radio_avec_pwo_en_bd_patient
end type
end forward

global type uo_lien_mediadent from uo_lien_radio_avec_pwo_en_bd_patient
end type
global uo_lien_mediadent uo_lien_mediadent

type variables
private oleobject				md4
string tab_fichier_mih[]
end variables

forward prototypes
public function integer deconnection_mediadent ()
public function integer minimize_mediadent ()
public function integer set_temps_attente_lancement (string str_tps)
public function string get_tps_attente ()
public function integer recup_all_fichiers_radio (ref string tab_fichier[])
public function integer set_info_patient_to_mediadent (double num_patient_pwo, string path_radio)
public function integer connection_mediadent ()
public function integer export_fichier (string fichier_a_exporter, string fichier_exporte)
end prototypes

public function integer deconnection_mediadent ();
gfx_close_connection_ole(md4)

return 1
end function

public function integer minimize_mediadent ();md4.OleMinimizeApp()
return 1
end function

public function integer set_temps_attente_lancement (string str_tps);// fx qui save le tps d'attente au lancement
// à sauvegarder ds le fichier orthokis.ini
// return 1 si Ok
//			-1 si pb

int		returnval = -1


if str_tps = "" then str_tps = "0"

// si la sauvegarde de ce rep ds orthokis.ini = OK --> maj valeur de retour
if SetProfileString(DIR_INI + inifile_orthokis, INI_section, INI_key_exe, str_tps) = 1 then returnval = 1

return returnval
end function

public function string get_tps_attente ();// fx qui permet de retrouver le tps d'attente lancement de mediadent
// utilisation de la proc get_fichier_exe

return get_programme_exe_path( )
end function

public function integer recup_all_fichiers_radio (ref string tab_fichier[]);// fx qui recup tout les nom de fichier pour un patient donné ..
// et les classe ds un tab passé en ref


integer 	nbrPic 
string		mihFile , stampFile , imageFile
integer		cpt = 1

// init recup liste des pics
nbrPic = md4.oleFindFirstImage( ref mihFile, ref stampFile, ref imageFile)

do while nbrPic > 0
	// on classe le fichier recup ds le tab en param
	tab_fichier[ cpt ] = gfx_extraire_path_fichier( mihFile ) + gfx_extraire_nom_fichier(imageFile)
	tab_fichier_mih[ cpt ] = mihFile
	
	// on recup le fichier suivant
	nbrPic = md4.oleFindNextImage( ref mihFile, ref stampFile, ref imageFile)
	
	cpt++
loop

// clean memoire
md4.oleFindClose()

return 1
end function

public function integer set_info_patient_to_mediadent (double num_patient_pwo, string path_radio);// fx qui va init mediadent avec les bonnes info patient
// return 1 si ok
//		-1 si path passé en param est vide
string	path
string	nom, prenom
string	praticien
date	datenaiss
string	sexe
int		race
double	numOdrade
int			returnval = -1


setpointer(HourGlass!)

if path_radio <> "" then		
	// recup des données ds BD
//	select identifiant_odrade, patient.nom, prenom, date_naissance, sexe, prati.nom
//	into :numOdrade, :nom, :prenom, :datenaiss, :sexe, :praticien
//	from patient, prati
//	where patient.code_praticien = prati.code AND
//	patient.code = :num_patient_pwo ;
//
	
	// depuis la version 2009 le code est invariant et remplace l'identifiant Odrade
	select patient.code, patient.nom, patient.prenom, date_naissance, sexe, prati.nom
	into :numOdrade, :nom, :prenom, :datenaiss, :sexe, :praticien
	from patient, prati
	where patient.code_praticien = prati.code AND
	patient.code = :num_patient_pwo ;
	
	if chu_liege then
		string v_identifiant_chu
		select identifiant_chu into :v_identifiant_chu from chu_patient where code_patient = :num_patient_pwo ;
		path = path_radio + string( v_identifiant_chu )
	else
		path = path_radio + string( numOdrade )
	end if

	// nomenclature -> nom + space(1) prenom (avec des trim pour enlever les espaces)
	nom = trim (nom ) + space( 1 ) + trim( prenom )
	
	// on passe tout ça à médiadent
	md4.oleBeginTransaction()
		if not isnull( path ) then md4.oleLoadPicLib( path )	//"C:\Mediadent\Patients\1011")
		if not isnull( nom ) then md4.OleSetPatientName( nom )
		if not isnull( praticien ) then md4.OleSetPracticionnerName( praticien )
		if not isnull( datenaiss ) then md4.OleSetPatientDateOfBirth( datenaiss )
		if not isnull( sexe ) then md4.OleSetPatientSex( sexe )
	//	if not isnull( race ) then md4.OleSetPatientRace( race )
		if not isnull( datenaiss ) then md4.OleSetPatientBiologicalAge( age_calcul_des_annees_date( datenaiss ) )
	md4.oleEndTransaction()
	
	returnval = 1
end if

setpointer(Arrow!)

return returnval
end function

public function integer connection_mediadent ();// fx pour se connecter par OLE à mediadent
// return 1 si ok ; -1 si pb

int	returnVal = -1


setpointer(HourGlass!)

if gfx_open_connection_ole(md4, "Mediadent.Application") <> 1 then
// si pb de connection à l'obj OLE
	Messagebox("ERREUR","Impossible de se connecter au logiciel MEDIADENT. ~n~nCe dernier n'est peut-être pas installé sur cet ordinateur.", StopSign!)
	DESTROY md4	//vide la mémoire
else
	// on attend un tps définissable ds outils\env poste trav
	sleep( long( this.get_tps_attente( ) ) )
	
	returnVal = 1
end if

setpointer(Arrow!)

return returnVal
end function

public function integer export_fichier (string fichier_a_exporter, string fichier_exporte);// fx qui exporte un fichier de Mediadent en Jpeg


integer 	resultat 
// L'image de destination ne doit pas exister
FileDelete(fichier_exporte)

// Export en Jpeg (0), en qualité maxi (1) ... le dernier paramètre n'est pas utilisé
resultat = md4.oleExportImage( fichier_a_exporter,  fichier_exporte, 0,  1, 0)


return resultat
end function

on uo_lien_mediadent.create
call super::create
end on

on uo_lien_mediadent.destroy
call super::destroy
end on

event constructor;call super::constructor;init( radio_mediadent )
end event

