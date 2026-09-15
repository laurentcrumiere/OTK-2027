$PBExportHeader$w_sms_config.srw
forward
global type w_sms_config from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_sms_config
end type
type st_1 from statictext within w_sms_config
end type
type sle_rep_pocket from singlelineedit within w_sms_config
end type
type st_2 from statictext within w_sms_config
end type
type sle_compte_pocket from singlelineedit within w_sms_config
end type
type pb_verif from uo_picturebutton_390x120 within w_sms_config
end type
type uo_poc from uo_pocket within w_sms_config
end type
type pb_repertoire from picturebutton within w_sms_config
end type
type st_3 from statictext within w_sms_config
end type
type sle_host from singlelineedit within w_sms_config
end type
end forward

global type w_sms_config from w_fenetre_arakis
integer width = 3447
integer height = 1248
string title = "Configuration des Envois de SMS"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_fermer pb_fermer
st_1 st_1
sle_rep_pocket sle_rep_pocket
st_2 st_2
sle_compte_pocket sle_compte_pocket
pb_verif pb_verif
uo_poc uo_poc
pb_repertoire pb_repertoire
st_3 st_3
sle_host sle_host
end type
global w_sms_config w_sms_config

forward prototypes
public function boolean verif_repertoire (string v_repertoire)
end prototypes

public function boolean verif_repertoire (string v_repertoire);
boolean v_retour
string v_fichier 

v_retour = true
if left(v_repertoire, 2) <> "\\" then
	if Messagebox("ATTENTION","Le répertoire des Outils pour SMS n'est pas sous la forme '\\Serveur\nom1\'.~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 2 then
		v_retour = false
	end if
end if

if v_retour then
	// Vérification de la présence du fichier de config
	v_fichier = v_repertoire + uo_pocket.fichier_param_pocket
	if not FileExists(v_fichier) then 
		MessageBox("ATTENTION","Le dossier '"+ v_repertoire + "' ne contient pas le fichier de configuration attendu ('"+uo_pocket.fichier_param_pocket+"').~n~nVeuillez corriger avant de poursuivre.")
		v_retour = false
	else
		// Vérification de la présence des exe
		v_fichier = v_repertoire + uo_pocket.fichier_param_pocket
		if not FileExists(v_repertoire + "getmessage.exe") or  not FileExists(v_repertoire + "sendmessage.exe")   or not FileExists(v_repertoire + "updateplanning.exe") then 
			MessageBox("ATTENTION","Il manque au moins un fichier programme dans le dossier '"+ v_repertoire + "'.~n~nVeuillez corriger avant de poursuivre.")
			v_retour = false
		end if
	end if
end if

if v_retour then
	pb_verif.enabled ( true )
	sle_compte_pocket.enabled = true
	sle_host.enabled = true
	
	// Mémorisation du répertoire en base
	uo_poc.set_repertoire_pocket(v_repertoire)
	
	// n° de compte
	sle_compte_pocket.text = uo_poc.get_numero_compte()
	
	// host
	sle_host.text = uo_poc.get_host()
	
else
	pb_verif.enabled ( false )
	sle_compte_pocket.enabled = false
	sle_host.enabled = false
end if



return v_retour

end function

on w_sms_config.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.st_1=create st_1
this.sle_rep_pocket=create sle_rep_pocket
this.st_2=create st_2
this.sle_compte_pocket=create sle_compte_pocket
this.pb_verif=create pb_verif
this.uo_poc=create uo_poc
this.pb_repertoire=create pb_repertoire
this.st_3=create st_3
this.sle_host=create sle_host
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.sle_rep_pocket
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.sle_compte_pocket
this.Control[iCurrent+6]=this.pb_verif
this.Control[iCurrent+7]=this.uo_poc
this.Control[iCurrent+8]=this.pb_repertoire
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.sle_host
end on

on w_sms_config.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.st_1)
destroy(this.sle_rep_pocket)
destroy(this.st_2)
destroy(this.sle_compte_pocket)
destroy(this.pb_verif)
destroy(this.uo_poc)
destroy(this.pb_repertoire)
destroy(this.st_3)
destroy(this.sle_host)
end on

event open;call super::open;

// Lecture des datas ...
string v_repertoire 
v_repertoire = uo_poc.get_repertoire_pocket()

if v_repertoire = '' then
	Messagebox("ATTENTION", "Le répertoire des Outils pour SMS n'est pas encore renseigné. Vous allez pouvoir le faire.")
	pb_repertoire.triggerevent(clicked!)
else
	sle_rep_pocket.text = v_repertoire
	verif_repertoire(v_repertoire)
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_sms_config
end type

type pb_fermer from uo_picturebutton_390x120 within w_sms_config
integer x = 1307
integer y = 928
integer width = 471
integer taborder = 70
string text = "&Fermer"
boolean default = true
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)

end event

type st_1 from statictext within w_sms_config
integer x = 59
integer y = 76
integer width = 846
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Répertoire Outils pour SMS :"
end type

type sle_rep_pocket from singlelineedit within w_sms_config
integer x = 59
integer y = 184
integer width = 3310
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

event losefocus;
// Si on a débloqué avec le clic droit, on peut éditer

verif_repertoire(this.text) 
end event

type st_2 from statictext within w_sms_config
integer x = 59
integer y = 604
integer width = 1984
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "N° de compte  (à ne modifier que sous le contrôle d~'un Technicien) :"
end type

type sle_compte_pocket from singlelineedit within w_sms_config
integer x = 59
integer y = 700
integer width = 2057
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type pb_verif from uo_picturebutton_390x120 within w_sms_config
integer x = 2199
integer y = 676
integer width = 750
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "Vérif N° et Adresse"
string iconname = "ACTIONS_verifier_rdv.png"
end type

event clicked;call super::clicked;

// pour tester le compte on fait un getmessage bidon
integer v_retour
boolean v_suite

string v_compte_actuel, v_compte_saisi
string v_host_actuel, v_host_saisi

// on est obligé de le mettre pour tester ...
v_compte_actuel = uo_poc.get_numero_compte()
v_host_actuel = uo_poc.get_host()

v_compte_saisi = trim(sle_compte_pocket.text)
v_host_saisi = trim(sle_host.text)

uo_poc.set_numero_compte(v_compte_saisi) 
uo_poc.set_host(v_host_saisi) 

v_retour = uo_poc.get_message("D", "1966-08-04", false)

if v_retour = -1 then
	Messagebox("ATTENTION","Une erreur anormale s'est produite pendant la vérification du numéro de compte.~n~nProblème de configuration.")
	v_suite = false
else
	if v_retour = 0 then
		// Y a des résultats ... en principe pas possible mais ...
		v_suite = true
	else
		if v_retour = 101 then
			Messagebox("ATTENTION","Le numéro de compte que vous avez indiqué n'est pas valide.~n~nVeuillez contacter ARAKIS.")	
			v_suite = false
		else
			v_suite = true
		end if
	end if
end if
		
if v_suite then 
	Messagebox("ATTENTION","Le numéro indiqué est correct.~n~nIl vient d'être mémorisé.")
	if uo_poc.is_dentalsms() then
		OPERATEUR_SMS = 2
	end if
	close(parent)
else
	// on remet l'ancien dans le fichier au cas ou
	uo_poc.set_numero_compte(v_compte_actuel)
	uo_poc.set_host(v_host_actuel)
end if


end event

type uo_poc from uo_pocket within w_sms_config
boolean visible = false
integer x = 233
integer y = 1076
integer taborder = 40
boolean bringtotop = true
end type

on uo_poc.destroy
call uo_pocket::destroy
end on

type pb_repertoire from picturebutton within w_sms_config
integer x = 3200
integer y = 32
integer width = 169
integer height = 144
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;

string file_name,file_path,col_name

string v_repertoire
v_repertoire = sle_rep_pocket.text

v_repertoire = get_repertoire("Sélectionnez le dossier des Outils pour Envois de SMS ...",v_repertoire)

sle_rep_pocket.text = v_repertoire

verif_repertoire(v_repertoire) 


end event

event rbuttondown;sle_rep_pocket.enabled = true
end event

type st_3 from statictext within w_sms_config
integer x = 59
integer y = 352
integer width = 2784
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Adresse (à ne modifier que sous le contrôle d~'un Technicien) :"
end type

type sle_host from singlelineedit within w_sms_config
integer x = 59
integer y = 424
integer width = 3310
integer height = 112
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

