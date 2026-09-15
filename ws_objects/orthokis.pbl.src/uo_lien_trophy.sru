$PBExportHeader$uo_lien_trophy.sru
forward
global type uo_lien_trophy from uo_lien_radio_avec_pwo_en_bd_patient
end type
end forward

global type uo_lien_trophy from uo_lien_radio_avec_pwo_en_bd_patient
end type
global uo_lien_trophy uo_lien_trophy

forward prototypes
public function integer recup_info_patient (long code_patient, ref string tab_info[])
public function integer ouvrir_trophy (long code_patient)
end prototypes

public function integer recup_info_patient (long code_patient, ref string tab_info[]);// fx qui recup par un select ds la base les infos du patient et les stock ds la structure passée en param par ref
// return 1 si ok
//		-1 si pb

int		returnval = -1
long	patient_identifiant_odrade
string	nom, prenom, date_naiss_str
date	date_naiss


//select	identifiant_odrade, nom, prenom, date_naissance
//into	:patient_identifiant_odrade, :nom, :prenom, :date_naiss
//from	patient
//where	patient.code = :code_patient ;

// Depuis la version 2009 le code remplace l'identifiant Odrade
select	code, nom, prenom, date_naissance
into	:patient_identifiant_odrade, :nom, :prenom, :date_naiss
from	patient
where	patient.code = :code_patient ;

if SQLCA.SQLCode = 0 then
// si pas de pb
	// mise en conformité des val récup
	if isnull( patient_identifiant_odrade ) then patient_identifiant_odrade = 0
	if isnull( nom ) then nom = ""
	if isnull( prenom ) then prenom = ""
	if isnull( date_naiss ) then
		date_naiss_str = ""
	elseif string(date_naiss, "dd/mm/yyyy") = "01/01/1900" then
		date_naiss_str = ""
	else
		date_naiss_str = string(date_naiss, "dd/mm/yyyy" )
	end if
	
	// stockage ds le tab de string
	tab_info[1] = string( patient_identifiant_odrade )
	tab_info[2] = trim( nom + space( 1 ) + prenom )
	tab_info[3] = date_naiss_str
	
	// maj val de retour
	returnval = 1
else
// erreur de récupération de données
	messagebox("ERREUR ...", "Impossible de récupérer les informations du patient. ~n~nOpération annulée.", StopSign!)
end if

return returnval

end function

public function integer ouvrir_trophy (long code_patient);// fx qui ouvre trophy et l'init sur le bon patient
// return 1 si ok
//		-1 si pb

string	tab_info[]
int		returnval = -1


setpointer(HourGlass!)

if recup_info_patient( code_patient, tab_info ) = 1 then
	open_module( long( tab_info[1] ), tab_info[2] + " - Date naissance : " + tab_info[3])
	returnval = 1
end if

setpointer(Arrow!)

return returnval
end function

on uo_lien_trophy.create
call super::create
end on

on uo_lien_trophy.destroy
call super::destroy
end on

event constructor;call super::constructor;init( radio_trophy )
end event

