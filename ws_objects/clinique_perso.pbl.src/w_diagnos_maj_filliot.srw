$PBExportHeader$w_diagnos_maj_filliot.srw
$PBExportComments$gearbox_filliot
forward
global type w_diagnos_maj_filliot from window
end type
type cb_1 from commandbutton within w_diagnos_maj_filliot
end type
type pb_1 from picturebutton within w_diagnos_maj_filliot
end type
type sle_cmd_ligne from singlelineedit within w_diagnos_maj_filliot
end type
type cb_config_prg_externe from commandbutton within w_diagnos_maj_filliot
end type
type cb_prg_externe from commandbutton within w_diagnos_maj_filliot
end type
type cb_page4 from commandbutton within w_diagnos_maj_filliot
end type
type cb_page3 from commandbutton within w_diagnos_maj_filliot
end type
type cb_page2 from commandbutton within w_diagnos_maj_filliot
end type
type cb_autre from commandbutton within w_diagnos_maj_filliot
end type
type cb_page1 from commandbutton within w_diagnos_maj_filliot
end type
type cb_fermer from commandbutton within w_diagnos_maj_filliot
end type
end forward

global type w_diagnos_maj_filliot from window
integer x = 425
integer y = 832
integer width = 2391
integer height = 972
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = child!
long backcolor = 12632256
cb_1 cb_1
pb_1 pb_1
sle_cmd_ligne sle_cmd_ligne
cb_config_prg_externe cb_config_prg_externe
cb_prg_externe cb_prg_externe
cb_page4 cb_page4
cb_page3 cb_page3
cb_page2 cb_page2
cb_autre cb_autre
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_filliot w_diagnos_maj_filliot

type variables
CONSTANT integer	w_height_normal = 520
CONSTANT integer	w_height_config = 972

double var_code_local 
string var_nom_local
window w_me

end variables

forward prototypes
public subroutine init_win ()
public function integer reset_presentation ()
end prototypes

public subroutine init_win ();var_code_local = var_code
var_nom_local = var_nom

w_me.title = "Pages Cliniques : "+var_nom_local+" ("+string(var_code_local)+")"

double tot
string vide

vide = space(2000)

tot = 0
SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

if not (tot > 0) then
	INSERT INTO "dba"."diagnos"	( "code", "perso" ) VALUES ( :var_code_local, :vide )  ;
	IF	Sqlca.Sqlcode = 0 then
		commit ;
	else
		rollback ;
		close(w_me)
	end if
end if

end subroutine

public function integer reset_presentation ();SetProfileString(DIR_INI + "orthokis.ini", utilisateur_nom, "HG", "" )
SetProfileString(DIR_INI + "orthokis.ini", utilisateur_nom, "HD", "" )
SetProfileString(DIR_INI + "orthokis.ini", utilisateur_nom, "BG", "" )
SetProfileString(DIR_INI + "orthokis.ini", utilisateur_nom, "BD", "" )
return 1

end function

event open;w_me = this
this.height = w_height_normal
init_win()
mep_win_mdi(this,1)
end event

on w_diagnos_maj_filliot.create
this.cb_1=create cb_1
this.pb_1=create pb_1
this.sle_cmd_ligne=create sle_cmd_ligne
this.cb_config_prg_externe=create cb_config_prg_externe
this.cb_prg_externe=create cb_prg_externe
this.cb_page4=create cb_page4
this.cb_page3=create cb_page3
this.cb_page2=create cb_page2
this.cb_autre=create cb_autre
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_1,&
this.pb_1,&
this.sle_cmd_ligne,&
this.cb_config_prg_externe,&
this.cb_prg_externe,&
this.cb_page4,&
this.cb_page3,&
this.cb_page2,&
this.cb_autre,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_filliot.destroy
destroy(this.cb_1)
destroy(this.pb_1)
destroy(this.sle_cmd_ligne)
destroy(this.cb_config_prg_externe)
destroy(this.cb_prg_externe)
destroy(this.cb_page4)
destroy(this.cb_page3)
destroy(this.cb_page2)
destroy(this.cb_autre)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

event close;integer	i

for i=1 to 4
	tab_present[i] = ""
next

end event

type cb_1 from commandbutton within w_diagnos_maj_filliot
integer x = 1632
integer y = 744
integer width = 402
integer height = 112
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "En&registrer"
end type

event clicked;parent.height = w_height_normal

if sle_cmd_ligne.text = "" then
	messagebox("ATTENTION !!!", "Aucun logiciel sélectionné, la commande Logiciel Externe ne fonctionnera pas !")
end if
SetProfileString(DIR_INI + "orthokis.ini", utilisateur_nom, "cmd_prg_extern", sle_cmd_ligne.text )

end event

type pb_1 from picturebutton within w_diagnos_maj_filliot
integer x = 2149
integer y = 592
integer width = 114
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "..."
boolean originalsize = true
vtextalign vtextalign = vcenter!
end type

event clicked;string fich_name,fich_path

if GetFileOpenName("Fichiers EXE",fich_path,fich_name,"exe","Fichiers exécutables (*.exe),*.exe") = 1 then
//	sle_nom_prg_retouche.text = fich_name
	sle_cmd_ligne.text = fich_path
end if

end event

type sle_cmd_ligne from singlelineedit within w_diagnos_maj_filliot
integer x = 23
integer y = 592
integer width = 2011
integer height = 92
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type cb_config_prg_externe from commandbutton within w_diagnos_maj_filliot
integer x = 873
integer y = 308
integer width = 329
integer height = 72
integer taborder = 70
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Configuration"
end type

event clicked;string	prg_cmd

prg_cmd = profilestring(DIR_INI + "orthokis.ini", utilisateur_nom, "cmd_prg_extern","rien")
if prg_cmd <> "rien" then
	sle_cmd_ligne.text = prg_cmd
end if
parent.height = w_height_config

end event

type cb_prg_externe from commandbutton within w_diagnos_maj_filliot
integer x = 23
integer y = 288
integer width = 1198
integer height = 108
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Logiciel &Externe"
end type

event clicked;string	prg_cmd

prg_cmd = profilestring(DIR_INI + "orthokis.ini", utilisateur_nom, "cmd_prg_extern","rien")
if prg_cmd = "rien" or prg_cmd = "" then
	messagebox("INFORMATION UTILISATEUR", "Vous devez configurer ce bouton de commande avant de l'utiliser !")
else
	run(prg_cmd,Maximized!)
end if

end event

type cb_page4 from commandbutton within w_diagnos_maj_filliot
integer x = 23
integer y = 156
integer width = 1198
integer height = 108
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Présentation pour Patient"
end type

event clicked;OpenSheetWithParm(w_diagnos_maj_filliot4,var_code_local,w_mdi,1,Original!)

end event

type cb_page3 from commandbutton within w_diagnos_maj_filliot
integer x = 837
integer y = 24
integer width = 384
integer height = 108
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &3"
end type

event clicked;OpenSheetWithParm(w_diagnos_maj_filliot3,var_code_local,w_mdi,1,Original!)
end event

type cb_page2 from commandbutton within w_diagnos_maj_filliot
integer x = 430
integer y = 24
integer width = 384
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &2"
end type

event clicked;OpenSheetWithParm(w_diagnos_maj_filliot2,var_code_local,w_mdi,1,Original!)

end event

type cb_autre from commandbutton within w_diagnos_maj_filliot
integer x = 1554
integer y = 24
integer width = 384
integer height = 108
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&utre"
end type

event clicked;reset_presentation()
var_suite = false
open(w_cherche)

if var_suite then
	init_win()
end if

end event

type cb_page1 from commandbutton within w_diagnos_maj_filliot
integer x = 23
integer y = 24
integer width = 384
integer height = 108
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Page &1"
end type

event clicked;OpenSheetWithParm(w_diagnos_maj_filliot1,var_code_local,w_mdi,1,Original!)
end event

type cb_fermer from commandbutton within w_diagnos_maj_filliot
integer x = 1957
integer y = 24
integer width = 384
integer height = 108
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;reset_presentation()
Close(parent)

end event

