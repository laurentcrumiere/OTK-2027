$PBExportHeader$w_diagnos_maj_.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_ from window
end type
type pb_suivant from picturebutton within w_diagnos_maj_
end type
type pb_precedant from picturebutton within w_diagnos_maj_
end type
type cb_imprimer from commandbutton within w_diagnos_maj_
end type
type cb_sauver from commandbutton within w_diagnos_maj_
end type
type cb_annuler from commandbutton within w_diagnos_maj_
end type
type cb_fermer from commandbutton within w_diagnos_maj_
end type
end forward

global type w_diagnos_maj_ from window
string tag = "4000"
integer width = 3552
integer height = 1944
boolean titlebar = true
string title = "Page Clinique N°"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
pb_suivant pb_suivant
pb_precedant pb_precedant
cb_imprimer cb_imprimer
cb_sauver cb_sauver
cb_annuler cb_annuler
cb_fermer cb_fermer
end type
global w_diagnos_maj_ w_diagnos_maj_

type variables
uo_fx_pages_cliniques	f

double 	var_code_local 
string	page_buffer[2]
long		buffer_lg
boolean	deja_1_fois

integer secondes_attente
end variables

forward prototypes
public function integer init_buffer ()
public subroutine load_ctrls ()
public function string make_title ()
public subroutine open_another_page (picturebutton pb)
public function integer save_buffer ()
public subroutine unload_ctrls ()
public function integer sauvegarder (boolean avec_msg)
public subroutine show_date ()
end prototypes

public function integer init_buffer ();// fx qui recup les données de la base ds les buffers (table diagnos, champ page) : cmd SQL


// récup des données
SELECT	perso
INTO		:page_buffer[1]
FROM		diagnos
WHERE		code = :var_code_local ;

if isnull(page_buffer[1]) then
// si première récup pour ce patient (jamais init)
	// on rempli de blanc
	page_buffer[1] = space(buffer_lg)
end if

if len(page_buffer[1]) < buffer_lg then 
// si un changement de longeur de page est détecter
	// on complète en rajoutant des blancs
	page_buffer[1] = page_buffer[1] + space(buffer_lg - len(page_buffer[1]))
end if

// init du second buffer
page_buffer[2] = page_buffer[1]

// pas de gestion d'erreur
return 1

end function

public subroutine load_ctrls ();// fx qui charge les données du buffer primaire (page_buffer[1]) vers les ctrls

end subroutine

public function string make_title ();// fx qui renvoie le titre de la fenêtre

string	lstr_nom, lstr_prenom
date 		ld_date_naissance
integer	li_an, li_mois


// recup des infos ds BD
select	nom, prenom, date_naissance
INTO		:lstr_nom, :lstr_prenom, :ld_date_naissance
FROM		patient
WHERE 	code = :var_code_local ;

// pour éviter les bloquage si des val NULL
if isnull(lstr_nom) then lstr_nom = ""
if isnull(lstr_prenom) then lstr_prenom = ""
if isnull(ld_date_naissance) then ld_date_naissance = Today()

// calcule de son age : les années
if (month(today()) < month( ld_date_naissance )) then
	li_an = year(today()) - year( ld_date_naissance ) - 1
ELSE
	li_an = year(today()) - year( ld_date_naissance )
END IF	

// calcule de son age : les mois
if (month(today()) < month( ld_date_naissance )) then
	li_mois = month(today()) - month( ld_date_naissance ) +12
ELSE
	li_mois = month(today()) - month( ld_date_naissance )
END IF

return this.title + " : " + lstr_nom + " " + lstr_prenom +" - N° dossier : "+string(var_code_local) + " - Age : " + string(li_an) + " ans " + string(li_mois) + " mois "
end function

public subroutine open_another_page (picturebutton pb);//// fx qui lance la sauvegarde des données, ouvre une autre page clinique et ferme celle-ci
//
//
//// on lance la procédure de sauvegarde des données
//sauvegarder( true )
//
//if pb.tag <> "" then
//	w_diagnos_maj_		W_fille
//	
//	// on ouvre l'autre page clinique
//	OpenSheetWithParm( W_fille, var_code_local, "w_diagnos_maj_" + pb.tag, w_mdi, 0, Original!)
//	
//	// on ferme celle-ci
//	Close(this)
//end if
//
end subroutine

public function integer save_buffer ();//// fx qui sauvegarde les données du buffers secondaire (page_buffer[2]) vers la BD
//
integer	return_val = -1
//
//
//// on tante de save les données ds la base
//UPDATE	diagnos
//SET		perso = :page_buffer[2]
//WHERE		code = :var_code_local ;
//
//if SQLCA.Sqlcode <> 0 then
//// un pb survient
//	rollback ;
//	// alerte utilisateur
//	son(4)
//	Messagebox("ERREUR ...","Sauvegarde des données impossible !~n~n" + SQLCA.SqlErrText, StopSign!)
//	
//else
//// no pb pendant maj BD
//	COMMIT ;
//	// à l'arrivé les 2 buffers doivent être identiques
//	page_buffer[1] = page_buffer[2]
//	// maj val retour
//	return_val = 1
//end if
//
return return_val
//
end function

public subroutine unload_ctrls ();// fx qui dé-charge les données des ctrls vers le buffer secondaire (page_buffer[2])

end subroutine

public function integer sauvegarder (boolean avec_msg);//// fx qui lance le script de sauvegarde
//
int			returnval = -1
//boolean	on_stoppe = false
//
//
//// récup des données
//init_buffer()
//unload_ctrls()
//
//if page_buffer[2] <> page_buffer[1] then
//// si les 2 buffers sont différents -> des modifs
//	if avec_msg then
//		if MessageBox("ATTENTION","Modifications apportées ! ~n~nVoulez-vous les enregistrer ? ",Question!,YesNo!) = 2 then on_stoppe = true
//	end if
//	if not on_stoppe then
//	// si l'utilisateur souhaite enregistrer les modifs
//		// sauvegarde le buffer secondaire ds la BD
//		if save_buffer() = 1 then returnval = 1
//	else
//		returnval = 1
//	end if
//end if
//
//// pas de gestion d'erreur
return returnval
end function

public subroutine show_date ();
end subroutine

on w_diagnos_maj_.create
this.pb_suivant=create pb_suivant
this.pb_precedant=create pb_precedant
this.cb_imprimer=create cb_imprimer
this.cb_sauver=create cb_sauver
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.Control[]={this.pb_suivant,&
this.pb_precedant,&
this.cb_imprimer,&
this.cb_sauver,&
this.cb_annuler,&
this.cb_fermer}
end on

on w_diagnos_maj_.destroy
destroy(this.pb_suivant)
destroy(this.pb_precedant)
destroy(this.cb_imprimer)
destroy(this.cb_sauver)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
end on

event open;// recup le num patient
var_code_local = message.doubleparm

// init la longueur du buffer de page
buffer_lg = long(this.tag)

// construction titre fenêtre
this.title = make_title()

// recup les données de la base ds les buffers
init_buffer()

// charge les données du buffer primaire vers les différents ctrs de la window
load_ctrls()

// pour éviter le premier coup abusif (pour l'init de la page)
sauvegarder(false)
load_ctrls()

// affiche ou non les anciennes date des img (cf var gal date_img_show et save ds pwophotos.ini)
show_date()

// on se place sur le bouton par défaut -> confort utilisateur
cb_fermer.setfocus()

// place la window ds la mdi -> confort utilisateur
//mep_win_mdi(this,1)

end event

event close;// procédure de fermeture
sauvegarder( true )
end event

event deactivate;//w_mdi.setmicrohelp('')
end event

event show;


clinique_affichee = true



secondes_attente = 3
timer(1)
end event

event timer;

secondes_attente = secondes_attente - 1

if secondes_attente = 1 then
	copie_ecran_fenetre_clipboard()
end if

if secondes_attente = 0 then
	close(this)
end if
end event

type pb_suivant from picturebutton within w_diagnos_maj_
integer x = 3346
integer y = 1656
integer width = 137
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ar_left.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;open_another_page(this)
end event

type pb_precedant from picturebutton within w_diagnos_maj_
integer x = 3182
integer y = 1656
integer width = 137
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "ar_right.bmp"
vtextalign vtextalign = vcenter!
end type

event clicked;open_another_page(this)
end event

type cb_imprimer from commandbutton within w_diagnos_maj_
integer x = 1426
integer y = 1656
integer width = 411
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Imprimer"
end type

event clicked;long Job

Job = PrintOpen()
	parent.Print(job, 0, 0)
PrintClose(Job)

end event

type cb_sauver from commandbutton within w_diagnos_maj_
integer x = 2304
integer y = 1656
integer width = 411
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Enregistrer"
end type

event clicked;// sauvegarde des données
sauvegarder( false )

// on se place sur le bouton par défaut -> confort utilisateur
cb_fermer.setfocus()

end event

type cb_annuler from commandbutton within w_diagnos_maj_
integer x = 1865
integer y = 1656
integer width = 411
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Annuler"
end type

event clicked;// charge les données du buffer primaire vers les différents ctrs de la window
load_ctrls()

end event

event rbuttondown;//// le bouton droit permet de recharger les données + photos = on réouvre la fenetre
//w_diagnos_maj_		W_fille
//OpenSheetWithParm( W_fille, var_code_local, parent.classname(), w_mdi, 0, Original!)
//Close(parent)
//
end event

type cb_fermer from commandbutton within w_diagnos_maj_
integer x = 2743
integer y = 1656
integer width = 411
integer height = 120
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

event clicked;Close(parent)

end event

