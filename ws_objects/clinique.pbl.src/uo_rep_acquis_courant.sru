$PBExportHeader$uo_rep_acquis_courant.sru
forward
global type uo_rep_acquis_courant from nonvisualobject
end type
end forward

global type uo_rep_acquis_courant from nonvisualobject
end type
global uo_rep_acquis_courant uo_rep_acquis_courant

type variables
private constant string persistance_ini_section = "photos"
private constant string persistance_ini_clef = "dir_acquis_courant"

private string rep_acquisition_courant
end variables

forward prototypes
public function string get_rep ()
public subroutine set_rep (string rep)
public function boolean charger ()
public function boolean enregistrer ()
public function boolean is_valide ()
end prototypes

public function string get_rep ();// return le rep d'acquisition courant

return rep_acquisition_courant
end function

public subroutine set_rep (string rep);// maj le rep courant d'aquisition
// en le formattant correctement (avec un "\" en fin)
if isnull(rep) then return
if rep = "" then return
if not directoryexists(rep) then return

if right(rep,1) <> win_delimiter then rep += win_delimiter
rep_acquisition_courant = rep
end subroutine

public function boolean charger ();// gestion de persistance

// charge le rep courant d'acquis en mémoire
// à partir du fichier de conf orthokis.ini

boolean val_retour = false
string rep
if fxg_ini_local_lire(persistance_ini_section, persistance_ini_clef, rep) = 1 then 
	set_rep(rep)
	val_retour = true
end if
return val_retour
end function

public function boolean enregistrer ();// gestion de persistance

// enregistre le rep courant d'acquisition sur le DD
// dans le fichier de conf orthokis.ini
if get_rep() = "" then return true
boolean val_retour = false
if fxg_ini_local_sauvegarder(persistance_ini_section, persistance_ini_clef, get_rep()) = 1 then	val_retour = true
return val_retour
end function

public function boolean is_valide ();// return true si rep courant d'acquis valide
// càd 
// 1) c un rep,
// 2) il existe
// 3) on a un "\" en fin de chemin

string rep
rep = get_rep()
if isnull(rep) then return false
if rep = "" then return false
if not DirectoryExists(rep) then return false
if right(rep,1) <> win_delimiter then return false
return true

end function

on uo_rep_acquis_courant.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_rep_acquis_courant.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;charger()
end event

event destructor;enregistrer()
end event

