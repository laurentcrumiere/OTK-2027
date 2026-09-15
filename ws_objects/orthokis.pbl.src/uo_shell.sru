$PBExportHeader$uo_shell.sru
forward
global type uo_shell from nonvisualobject
end type
end forward

global type uo_shell from nonvisualobject
end type
global uo_shell uo_shell

type variables
constant int win_type_active_et_affiche = 1
end variables

forward prototypes
public function integer run (string cmd)
end prototypes

public function integer run (string cmd);// c'est l'équivalent de l'exécuter du menu démarrer de window
// avec prise en cpt des var d'environement (on peut donc "exec" des fichiers ...)
// renvoie le code d'erreur du prog passé en param par cmd (donc voir doc spécif du prog)
// -10 si fichier "cmd" passé en param n'existe pas ou = null

int val_retour = -10

if isnull(cmd) then return val_retour
if not fileexists(cmd) then return val_retour

OLEObject	shell
shell = CREATE OLEObject
shell.connecttoNEWobject("WScript.Shell")

OLEObject	fso
fso = CREATE OLEObject
fso.connecttoNEWobject("Scripting.FileSystemObject")

//OLEObject	fichier
//fichier = CREATE OLEObject
//fichier = fso.getfile(cmd)
//val_retour = shell.run(fichier.ShortPath, this.win_type_active_et_affiche,true)
//destroy fichier
val_retour = shell.run(cmd, this.win_type_active_et_affiche,true)

fso.disconnectobject()
destroy fso
shell.disconnectobject()
destroy shell

return val_retour
end function

on uo_shell.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_shell.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

