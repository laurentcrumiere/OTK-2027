$PBExportHeader$w_import_orthoconcept.srw
forward
global type w_import_orthoconcept from window
end type
type st_etape from statictext within w_import_orthoconcept
end type
type cbx_effacer from checkbox within w_import_orthoconcept
end type
type ddlb_cadre_depart from dropdownlistbox within w_import_orthoconcept
end type
type st_cadre from statictext within w_import_orthoconcept
end type
type cbx_img_6 from checkbox within w_import_orthoconcept
end type
type cbx_img_5 from checkbox within w_import_orthoconcept
end type
type cbx_img_4 from checkbox within w_import_orthoconcept
end type
type cbx_img_3 from checkbox within w_import_orthoconcept
end type
type cbx_img_2 from checkbox within w_import_orthoconcept
end type
type cbx_img_1 from checkbox within w_import_orthoconcept
end type
type uo_img_6 from gearbox within w_import_orthoconcept
end type
type uo_img_5 from gearbox within w_import_orthoconcept
end type
type uo_img_4 from gearbox within w_import_orthoconcept
end type
type uo_img_3 from gearbox within w_import_orthoconcept
end type
type uo_img_2 from gearbox within w_import_orthoconcept
end type
type uo_img_1 from gearbox within w_import_orthoconcept
end type
type cb_acquis from uo_picturebutton_390x120 within w_import_orthoconcept
end type
type cb_annuler from uo_picturebutton_390x120_fermer within w_import_orthoconcept
end type
type ole_acquis from gearbox within w_import_orthoconcept
end type
type lb_acquerir from listbox within w_import_orthoconcept
end type
type dw_temps from datawindow within w_import_orthoconcept
end type
end forward

global type w_import_orthoconcept from window
integer width = 2473
integer height = 1756
boolean titlebar = true
string title = "Importation de Moulages"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 15780518
st_etape st_etape
cbx_effacer cbx_effacer
ddlb_cadre_depart ddlb_cadre_depart
st_cadre st_cadre
cbx_img_6 cbx_img_6
cbx_img_5 cbx_img_5
cbx_img_4 cbx_img_4
cbx_img_3 cbx_img_3
cbx_img_2 cbx_img_2
cbx_img_1 cbx_img_1
uo_img_6 uo_img_6
uo_img_5 uo_img_5
uo_img_4 uo_img_4
uo_img_3 uo_img_3
uo_img_2 uo_img_2
uo_img_1 uo_img_1
cb_acquis cb_acquis
cb_annuler cb_annuler
ole_acquis ole_acquis
lb_acquerir lb_acquerir
dw_temps dw_temps
end type
global w_import_orthoconcept w_import_orthoconcept

type variables
private double patient_code
private double v_indentifiant_odrade
private string rep_acquis 

// cadre départ
private int cadre_depart = 1
private constant string PERSIST_CLEF_CADRE_DEPART = "cadre_depart"

// moulages
private  string nom_fichier_moulage_1 = "_1.jpg"
private  string nom_fichier_moulage_2 = "_2.jpg"
private  string nom_fichier_moulage_3 = "_3.jpg"
private  string nom_fichier_moulage_4 = "_4.jpg"
private  string nom_fichier_moulage_5 = "_5.jpg"
private  string nom_fichier_moulage_6 = "_6.jpg"

// acquerir oui/non
private boolean moulage_acquerir[]
private constant string PERSIST_SECTION = "lien_orthoconcept"
private constant string PERSIST_CLEF_ACQUIS_MOULAGE = "acquis_moulage_"
private constant string PERSIST_VAL_TRUE = "1"
private constant string PERSIST_VAL_FALSE = "2"
private constant string PERSIST_CLEF_EFFACER_FICHIERS = "Effacer_fichiers"

end variables

forward prototypes
public subroutine make_path_fichier_import (ref string str_fichier_import)
public function boolean moulage_acquerir_persist_get (integer num_ordre)
public function boolean moulage_acquerir_persist_set (integer num_ordre, boolean acquerir)
public function singlelineedit sle_rep_acquis_generer (string rep_import)
public function listbox lb_noms_fichiers_generer (boolean tab_acquerir[], listbox lb)
public subroutine init (long num_patient)
end prototypes

public subroutine make_path_fichier_import (ref string str_fichier_import);
end subroutine

public function boolean moulage_acquerir_persist_get (integer num_ordre);// recup ds orthokis.ini si le moulage indiqué a été acquis la dernière fois
// param num_ordre = l'identifiant du moulage
// renvoie true si et seulement si opt présente ds orthokis.ini et si à OUI, false ds les autres cas (rien ds .ini OU pas acquis last time)

boolean val_retour = false

if not num_ordre > 0 then return val_retour

string val_recup
if fxg_ini_local_lire(PERSIST_SECTION, PERSIST_CLEF_ACQUIS_MOULAGE + string(num_ordre), val_recup) = 1 then 
	if val_recup = PERSIST_VAL_TRUE then val_retour = true
else
	val_retour = true
end if

return val_retour
end function

public function boolean moulage_acquerir_persist_set (integer num_ordre, boolean acquerir);// sauvegarde ds orthokis.ini si le moulage indiqué vient d'être acqueri
// param num_ordre = l'identifiant du moulage
// param acquerir = true/false selon acqueri ou non
// renvoie true si bien sauvegarder

boolean val_retour = false

if not num_ordre > 0 then return val_retour
if isnull(acquerir) then return val_retour

string etat
if acquerir then 
	etat = PERSIST_VAL_TRUE
else
	etat = PERSIST_VAL_FALSE
end if
if fxg_ini_local_sauvegarder(PERSIST_SECTION, PERSIST_CLEF_ACQUIS_MOULAGE + string(num_ordre), etat) = 1 then val_retour = true

return val_retour
end function

public function singlelineedit sle_rep_acquis_generer (string rep_import);// genere une sle contenant le rep acquis
// param rep_import = le rep d'acquis

singlelineedit	sle_rep_acquis
sle_rep_acquis = create singlelineedit

if not len(rep_import) > 0 then return sle_rep_acquis
sle_rep_acquis.text = rep_import

return sle_rep_acquis
end function

public function listbox lb_noms_fichiers_generer (boolean tab_acquerir[], listbox lb);// génère la listbox des nom de fichiers à acquerir
// la liste est chargé selon coche des cbx du GUI
// renvoie une liste vide si pb 

if isnull(lb) then return lb
if not upperbound(tab_acquerir) > 0 then return lb

lb.reset()
lb.sorted = false

if tab_acquerir[1] then lb.AddItem(nom_fichier_moulage_1)
if tab_acquerir[2] then lb.AddItem(nom_fichier_moulage_2)
if tab_acquerir[3] then lb.AddItem(nom_fichier_moulage_3)
if tab_acquerir[4] then lb.AddItem(nom_fichier_moulage_4)
if tab_acquerir[5] then lb.AddItem(nom_fichier_moulage_5)
if tab_acquerir[6] then lb.AddItem(nom_fichier_moulage_6)

return lb
end function

public subroutine init (long num_patient);// fx d'init de la fenetre avec param externes

if isnull(num_patient) then return
if num_patient = 0 then return

// maj var metier
patient_code = num_patient

// récupération de l'identifiant Odrade du patient
//SELECT identifiant_odrade into :v_indentifiant_odrade from patient where code = :patient_code ;

// On utilse un répertoire TEMP à l'intérieur du dossier d'installation d'Orthokis
rep_acquis = dir_ini+"temp\"

string viewver_exe, viewer_path
RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Ortho-Concept\ModelViewer","path",viewver_exe)
//RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Ortho-Concept\ModelViewer","directory",viewer_path)
	
// On doit lancer le soft dans son répertoire d'installation sinon ça merde
//SetCurrentDirectoryA ( viewer_path )


// Le viewer recopie les fichiers du serveur pour les mettres dans le dossier Vues en local
runwait(viewver_exe + " "+ string(patient_code),0)

	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Ortho-Concept\ModelViewer","directory",rep_acquis)
	rep_acquis = rep_acquis + "vues\"
	
	//if right(rep_acquis, 1) <> "\" then rep_acquis += "\"
	
	
	//Ces 6 images seront placées sur le disque « c : » (local) dans un répertoire temporaire. 
	//Par exemple : « c:\program files\ortho-concept\ModelViewer\ID_ArakisPatient_1.jpg »
	//
	// metier --> GUI
	// les moulages
	
	// Construction des noms de fichiers des moulages 
	
	nom_fichier_moulage_1 = string(patient_code)+nom_fichier_moulage_1
	nom_fichier_moulage_2 = string(patient_code)+nom_fichier_moulage_2
	nom_fichier_moulage_3 = string(patient_code)+nom_fichier_moulage_3
	nom_fichier_moulage_4 = string(patient_code)+nom_fichier_moulage_4
	nom_fichier_moulage_5 = string(patient_code)+nom_fichier_moulage_5
	nom_fichier_moulage_6 = string(patient_code)+nom_fichier_moulage_6
	
	uo_img_1.charger_image(rep_acquis + nom_fichier_moulage_1 )
	uo_img_2.charger_image(rep_acquis + nom_fichier_moulage_2 )
	uo_img_3.charger_image(rep_acquis + nom_fichier_moulage_3 )
	uo_img_4.charger_image(rep_acquis + nom_fichier_moulage_4 )
	uo_img_5.charger_image(rep_acquis + nom_fichier_moulage_5 )
	uo_img_6.charger_image(rep_acquis + nom_fichier_moulage_6 )

//SetCurrentDirectoryA(dir_ini)



end subroutine

on w_import_orthoconcept.create
this.st_etape=create st_etape
this.cbx_effacer=create cbx_effacer
this.ddlb_cadre_depart=create ddlb_cadre_depart
this.st_cadre=create st_cadre
this.cbx_img_6=create cbx_img_6
this.cbx_img_5=create cbx_img_5
this.cbx_img_4=create cbx_img_4
this.cbx_img_3=create cbx_img_3
this.cbx_img_2=create cbx_img_2
this.cbx_img_1=create cbx_img_1
this.uo_img_6=create uo_img_6
this.uo_img_5=create uo_img_5
this.uo_img_4=create uo_img_4
this.uo_img_3=create uo_img_3
this.uo_img_2=create uo_img_2
this.uo_img_1=create uo_img_1
this.cb_acquis=create cb_acquis
this.cb_annuler=create cb_annuler
this.ole_acquis=create ole_acquis
this.lb_acquerir=create lb_acquerir
this.dw_temps=create dw_temps
this.Control[]={this.st_etape,&
this.cbx_effacer,&
this.ddlb_cadre_depart,&
this.st_cadre,&
this.cbx_img_6,&
this.cbx_img_5,&
this.cbx_img_4,&
this.cbx_img_3,&
this.cbx_img_2,&
this.cbx_img_1,&
this.uo_img_6,&
this.uo_img_5,&
this.uo_img_4,&
this.uo_img_3,&
this.uo_img_2,&
this.uo_img_1,&
this.cb_acquis,&
this.cb_annuler,&
this.ole_acquis,&
this.lb_acquerir,&
this.dw_temps}
end on

on w_import_orthoconcept.destroy
destroy(this.st_etape)
destroy(this.cbx_effacer)
destroy(this.ddlb_cadre_depart)
destroy(this.st_cadre)
destroy(this.cbx_img_6)
destroy(this.cbx_img_5)
destroy(this.cbx_img_4)
destroy(this.cbx_img_3)
destroy(this.cbx_img_2)
destroy(this.cbx_img_1)
destroy(this.uo_img_6)
destroy(this.uo_img_5)
destroy(this.uo_img_4)
destroy(this.uo_img_3)
destroy(this.uo_img_2)
destroy(this.uo_img_1)
destroy(this.cb_acquis)
destroy(this.cb_annuler)
destroy(this.ole_acquis)
destroy(this.lb_acquerir)
destroy(this.dw_temps)
end on

event open;// Le N° de dossier patient est passé en paramètre
init(Message.DoubleParm)

// persistence => metier
// moulage_acquerir
int elem
for elem = 1 to 6
	moulage_acquerir[elem] = moulage_acquerir_persist_get(elem)
next

// cadre départ
string val_recup
if fxg_ini_local_lire(PERSIST_SECTION, PERSIST_CLEF_CADRE_DEPART, val_recup) = 1 then 
	cadre_depart = integer(val_recup)
end if

// effacement des images d'origine oui/non
if fxg_ini_local_lire(PERSIST_SECTION, PERSIST_CLEF_EFFACER_FICHIERS, val_recup) = 1 then 
	if val_recup = 'O' then
		cbx_effacer.checked = true
	else
		cbx_effacer.checked = false
	end if
end if

// metier => GUI
// les cbx enabled true/false
cbx_img_1.checked = moulage_acquerir[1]
cbx_img_2.checked = moulage_acquerir[2]
cbx_img_3.checked = moulage_acquerir[3]
cbx_img_4.checked = moulage_acquerir[4]
cbx_img_5.checked = moulage_acquerir[5]
cbx_img_6.checked = moulage_acquerir[6]

// le cadre de départ pour l'acquis
LoadDdlbPhoto ( ddlb_cadre_depart , string ( patient_code ) )
ddlb_cadre_depart.SelectItem(cadre_depart)

if imagerie_2013 then 
	dw_temps.setTransobject(sqlca)
	dw_temps.retrieve()
	st_etape.visible = true
	dw_temps.visible = true
else
	st_cadre.visible = true
	ddlb_cadre_depart.visible = true
end if


// presentation GUI
centrer(this)	
end event

type st_etape from statictext within w_import_orthoconcept
boolean visible = false
integer x = 73
integer y = 32
integer width = 576
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Etape de traitement "
end type

type cbx_effacer from checkbox within w_import_orthoconcept
integer x = 105
integer y = 1508
integer width = 1289
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Effacer les fichiers d~'origine après importation"
end type

type ddlb_cadre_depart from dropdownlistbox within w_import_orthoconcept
boolean visible = false
integer x = 82
integer y = 108
integer width = 1829
integer height = 928
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type st_cadre from statictext within w_import_orthoconcept
boolean visible = false
integer x = 73
integer y = 32
integer width = 1207
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Cadre de départ pour l~'importation :"
boolean focusrectangle = false
end type

type cbx_img_6 from checkbox within w_import_orthoconcept
integer x = 1609
integer y = 832
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "   Lingual"
end type

type cbx_img_5 from checkbox within w_import_orthoconcept
integer x = 841
integer y = 832
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Maxillaire"
end type

type cbx_img_4 from checkbox within w_import_orthoconcept
integer x = 73
integer y = 832
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Mandibule"
end type

type cbx_img_3 from checkbox within w_import_orthoconcept
integer x = 1609
integer y = 256
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Gauche"
end type

type cbx_img_2 from checkbox within w_import_orthoconcept
integer x = 841
integer y = 256
integer width = 485
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Face"
end type

type cbx_img_1 from checkbox within w_import_orthoconcept
integer x = 73
integer y = 256
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "   Droite"
end type

type uo_img_6 from gearbox within w_import_orthoconcept
integer x = 1609
integer y = 928
integer width = 658
integer height = 448
integer taborder = 50
integer mode_ocx = 1
end type

on uo_img_6.destroy
call gearbox::destroy
end on

type uo_img_5 from gearbox within w_import_orthoconcept
integer x = 841
integer y = 928
integer width = 658
integer height = 448
integer taborder = 40
integer mode_ocx = 1
end type

on uo_img_5.destroy
call gearbox::destroy
end on

type uo_img_4 from gearbox within w_import_orthoconcept
integer x = 73
integer y = 928
integer width = 658
integer height = 448
integer taborder = 30
integer mode_ocx = 1
end type

on uo_img_4.destroy
call gearbox::destroy
end on

type uo_img_3 from gearbox within w_import_orthoconcept
integer x = 1609
integer y = 352
integer width = 658
integer height = 448
integer taborder = 50
integer mode_ocx = 1
end type

on uo_img_3.destroy
call gearbox::destroy
end on

type uo_img_2 from gearbox within w_import_orthoconcept
integer x = 841
integer y = 352
integer width = 658
integer height = 448
integer taborder = 40
integer mode_ocx = 1
end type

on uo_img_2.destroy
call gearbox::destroy
end on

type uo_img_1 from gearbox within w_import_orthoconcept
integer x = 73
integer y = 352
integer width = 658
integer height = 448
integer taborder = 30
integer mode_ocx = 1
end type

on uo_img_1.destroy
call gearbox::destroy
end on

type cb_acquis from uo_picturebutton_390x120 within w_import_orthoconcept
integer x = 1426
integer y = 1472
integer width = 503
integer height = 152
integer taborder = 40
string text = "&Acquérir"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;// GUI => métier
// moulage_acquerir
moulage_acquerir[1] = cbx_img_1.checked
moulage_acquerir[2] = cbx_img_2.checked
moulage_acquerir[3] = cbx_img_3.checked
moulage_acquerir[4] = cbx_img_4.checked
moulage_acquerir[5] = cbx_img_5.checked
moulage_acquerir[6] = cbx_img_6.checked

// cadre départ
cadre_depart = ddlb_cadre_depart.FindItem(ddlb_cadre_depart.text, 1)

// metier --> acquisition
open(w_patience)


if imagerie_2013 then
	
	double v_temps_traitement
	if dw_temps.rowcount() > 0 then
		v_temps_traitement = dw_temps.GetItemNumber(1, "id")
	end if

	if cbx_img_1.checked then
		// image de droite 
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_1)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis, patient_code,false, false, v_temps_traitement, 44)
	end if

	if cbx_img_2.checked then
		// image de face 
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_2)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis, patient_code,false, false, v_temps_traitement, 42)
	end if

	if cbx_img_3.checked then
		// image de gauche
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_3)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis, patient_code,false, false, v_temps_traitement, 43)
	end if

	if cbx_img_4.checked then
		// image de mandibule
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_4)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis, patient_code,false, false, v_temps_traitement, 41)
	end if
	
	if cbx_img_5.checked then
		// image de maxillaire 
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_5)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis, patient_code,false, false, v_temps_traitement, 40)
	end if
	
	if cbx_img_6.checked then
		// image de lingual
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_6)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis, patient_code,false, false, v_temps_traitement, 45)
	end if

	messagebox("ATTENTION","L'acquisition est terminée !")
	
else
	ole_acquis.importer_multiples_images(lb_noms_fichiers_generer(moulage_acquerir, lb_acquerir), ddlb_cadre_depart, rep_acquis, patient_code,false, true, 0, 0)
end if


// Effacement des fichier
integer elem, erreur
string fichiers_effacer[6]

fichiers_effacer[1] = rep_acquis + nom_fichier_moulage_1
fichiers_effacer[2] = rep_acquis + nom_fichier_moulage_2
fichiers_effacer[3] = rep_acquis + nom_fichier_moulage_3
fichiers_effacer[4] = rep_acquis + nom_fichier_moulage_4
fichiers_effacer[5] = rep_acquis + nom_fichier_moulage_5
fichiers_effacer[6] = rep_acquis + nom_fichier_moulage_6



erreur = 0


if cbx_effacer.checked then 
	for elem = 1 to 6
		erreur = erreur + DeleteFileA(	fichiers_effacer[elem] )
	next 
	
	if erreur <> 6 then
		Messagebox("AVERTISSEMENT !","Une erreur est survenue durant la suppression des fichiers.")
	end if
end if 

close(w_patience)

// metier => persistence
// moulage_acquerir
for elem = 1 to 6
	moulage_acquerir_persist_set(elem, moulage_acquerir[elem])	
next


// cadre départ
fxg_ini_local_sauvegarder(PERSIST_SECTION, PERSIST_CLEF_CADRE_DEPART, string(cadre_depart))


// effacer fichiers
// effacement des images d'origine oui/non
if cbx_effacer.checked then
	fxg_ini_local_sauvegarder(PERSIST_SECTION, PERSIST_CLEF_EFFACER_FICHIERS, 'O') 
else
	fxg_ini_local_sauvegarder(PERSIST_SECTION, PERSIST_CLEF_EFFACER_FICHIERS, 'N') 
end if

// fermeture du GUI
close(parent)

end event

type cb_annuler from uo_picturebutton_390x120_fermer within w_import_orthoconcept
integer x = 1938
integer y = 1472
integer width = 503
integer height = 152
integer taborder = 30
string text = "A&nnuler"
string iconname = "ACTIONS_abandonner.png"
end type

type ole_acquis from gearbox within w_import_orthoconcept
integer x = 658
integer y = 1216
integer width = 549
integer height = 384
integer taborder = 20
integer mode_ocx = 1
end type

on ole_acquis.destroy
call gearbox::destroy
end on

type lb_acquerir from listbox within w_import_orthoconcept
boolean visible = false
integer x = 110
integer y = 1184
integer width = 512
integer height = 416
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type dw_temps from datawindow within w_import_orthoconcept
string tag = "no resize all"
boolean visible = false
integer x = 82
integer y = 108
integer width = 1129
integer height = 72
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_temps_traitement_cherche"
boolean border = false
boolean livescroll = true
end type

