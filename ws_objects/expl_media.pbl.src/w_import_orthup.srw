$PBExportHeader$w_import_orthup.srw
forward
global type w_import_orthup from window
end type
type ddlb_cadre_depart from dropdownlistbox within w_import_orthup
end type
type st_etape from statictext within w_import_orthup
end type
type cbx_img_6 from checkbox within w_import_orthup
end type
type cbx_img_5 from checkbox within w_import_orthup
end type
type cbx_img_4 from checkbox within w_import_orthup
end type
type cbx_img_3 from checkbox within w_import_orthup
end type
type cbx_img_2 from checkbox within w_import_orthup
end type
type cbx_img_1 from checkbox within w_import_orthup
end type
type uo_img_6 from gearbox within w_import_orthup
end type
type uo_img_5 from gearbox within w_import_orthup
end type
type uo_img_4 from gearbox within w_import_orthup
end type
type uo_img_3 from gearbox within w_import_orthup
end type
type uo_img_2 from gearbox within w_import_orthup
end type
type uo_img_1 from gearbox within w_import_orthup
end type
type cb_acquis from uo_picturebutton_390x120 within w_import_orthup
end type
type cb_annuler from uo_picturebutton_390x120_fermer within w_import_orthup
end type
type ole_acquis from gearbox within w_import_orthup
end type
type lb_acquerir from listbox within w_import_orthup
end type
type dw_temps from datawindow within w_import_orthup
end type
end forward

global type w_import_orthup from window
integer width = 2537
integer height = 1756
boolean titlebar = true
string title = "Importation de Moulages Dental Design"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
boolean center = true
ddlb_cadre_depart ddlb_cadre_depart
st_etape st_etape
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
global w_import_orthup w_import_orthup

type variables
private double patient_code
private string rep_acquis 

// cadre départ
private int cadre_depart = 1
private constant string PERSIST_CLEF_CADRE_DEPART = "cadre_depart"

// moulages
private  string nom_fichier_moulage_1 = "RIGHT_0.jpg"
private  string nom_fichier_moulage_2 = "FRONT_0.jpg"
private  string nom_fichier_moulage_3 = "LEFT_0.jpg"
private  string nom_fichier_moulage_4 = "MANDI_0.jpg"
private  string nom_fichier_moulage_5 = "MAXI_0.jpg"
private  string nom_fichier_moulage_6 = "BACK_0.jpg"

// acquerir oui/non
private boolean moulage_acquerir[]
private constant string PERSIST_SECTION = "ORTHUP"
private constant string PERSIST_CLEF_ACQUIS_MOULAGE = "acquis_moulage_"
private constant string PERSIST_VAL_TRUE = "1"
private constant string PERSIST_VAL_FALSE = "2"


private string nom_examen
private string dossier_echange_orthup
private string nom_complet_fichier_mandibule, nom_complet_fichier_maxillaire

string tab_item[]

end variables

forward prototypes
public subroutine make_path_fichier_import (ref string str_fichier_import)
public function boolean moulage_acquerir_persist_get (integer num_ordre)
public function boolean moulage_acquerir_persist_set (integer num_ordre, boolean acquerir)
public function singlelineedit sle_rep_acquis_generer (string rep_import)
public function listbox lb_noms_fichiers_generer (boolean tab_acquerir[], listbox lb)
public function boolean init (long num_patient)
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

public function boolean init (long num_patient);// fx d'init de la fenetre avec param externes

var_suite = true



if isnull(num_patient) then 
	var_suite = false
	Messagebox("ATTENTION", "Erreur N°1 dans l'initialisation")
else
	if num_patient = 0 then 
		var_suite = false
		Messagebox("ATTENTION", "Erreur N°2 dans l'initialisation")
	else

		// maj var metier
		patient_code = num_patient
		
		// Y a t il plusieurs examens pour le ce dossier 
		

		// Dossier complet
		dossier_echange_orthup = profilestring(dir_ini+inifile_orthokis,"ORTHUP", "path_echanges", "\\serveur\power\Orthup\") + string(num_patient) + win_delimiter
		
		
		if not DirectoryExists(dossier_echange_orthup) then
			Messagebox("ATTENTION", "Impossible de localiser le dossier de données de Dental Design !~n~n" + dossier_echange_orthup)
			var_suite = false
		else
			
			uo_img_1.charger_image(dossier_echange_orthup + nom_fichier_moulage_1 )
			uo_img_2.charger_image(dossier_echange_orthup + nom_fichier_moulage_2 )
			uo_img_3.charger_image(dossier_echange_orthup + nom_fichier_moulage_3 )
			uo_img_4.charger_image(dossier_echange_orthup + nom_fichier_moulage_4 )
			uo_img_5.charger_image(dossier_echange_orthup + nom_fichier_moulage_5 )
			uo_img_6.charger_image(dossier_echange_orthup + nom_fichier_moulage_6 )
		

		end if
	end if
end if


return var_suite

end function

on w_import_orthup.create
this.ddlb_cadre_depart=create ddlb_cadre_depart
this.st_etape=create st_etape
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
this.Control[]={this.ddlb_cadre_depart,&
this.st_etape,&
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

on w_import_orthup.destroy
destroy(this.ddlb_cadre_depart)
destroy(this.st_etape)
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

event open;
if not imagerie_2013 then
	
	MessageBox("ATTENTION","Cette fonction n'est pas compatible avec votre imagerie.~n~nVeuillez contacter ARAKIS pour migrer en nouvelle imagerie.")
	close(this)
	
else
	
	patient_code = Message.DoubleParm

	open(w_patience)
	
	this.backcolor = couleur_fond_fenetre
	
	// Le N° de dossier patient est passé en paramètre
	if init(patient_code) then
	
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
		
		
		// metier => GUI
		// les cbx enabled true/false
		cbx_img_1.checked = moulage_acquerir[1]
		cbx_img_2.checked = moulage_acquerir[2]
		cbx_img_3.checked = moulage_acquerir[3]
		cbx_img_4.checked = moulage_acquerir[4]
		cbx_img_5.checked = moulage_acquerir[5]
		cbx_img_6.checked = moulage_acquerir[6]
		
		dw_temps.setTransobject(sqlca)
		dw_temps.retrieve()
		st_etape.visible = true
		dw_temps.visible = true
		
		
		close(w_patience)
	else
		close (this)
	end if
	
end if
end event

type ddlb_cadre_depart from dropdownlistbox within w_import_orthup
string tag = "uniquement pour compatibilité acquisition"
boolean visible = false
integer x = 1591
integer y = 540
integer width = 969
integer height = 364
integer taborder = 20
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

type st_etape from statictext within w_import_orthup
boolean visible = false
integer x = 178
integer y = 36
integer width = 622
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Etape de traitement :"
end type

type cbx_img_6 from checkbox within w_import_orthup
integer x = 1701
integer y = 792
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Arrière"
end type

type cbx_img_5 from checkbox within w_import_orthup
integer x = 933
integer y = 792
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Maxillaire"
end type

type cbx_img_4 from checkbox within w_import_orthup
integer x = 165
integer y = 792
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Mandibule"
end type

type cbx_img_3 from checkbox within w_import_orthup
integer x = 1701
integer y = 216
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Gauche"
end type

type cbx_img_2 from checkbox within w_import_orthup
integer x = 933
integer y = 216
integer width = 485
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Face"
end type

type cbx_img_1 from checkbox within w_import_orthup
integer x = 165
integer y = 216
integer width = 402
integer height = 96
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Droite"
end type

type uo_img_6 from gearbox within w_import_orthup
boolean visible = true
integer x = 1701
integer y = 888
integer width = 658
integer height = 448
integer taborder = 50
integer mode_ocx = 1
end type

on uo_img_6.destroy
call gearbox::destroy
end on

type uo_img_5 from gearbox within w_import_orthup
boolean visible = true
integer x = 933
integer y = 888
integer width = 658
integer height = 448
integer taborder = 40
integer mode_ocx = 1
end type

on uo_img_5.destroy
call gearbox::destroy
end on

type uo_img_4 from gearbox within w_import_orthup
boolean visible = true
integer x = 165
integer y = 888
integer width = 658
integer height = 448
integer taborder = 30
integer mode_ocx = 1
end type

on uo_img_4.destroy
call gearbox::destroy
end on

type uo_img_3 from gearbox within w_import_orthup
boolean visible = true
integer x = 1701
integer y = 312
integer width = 658
integer height = 448
integer taborder = 50
integer mode_ocx = 1
end type

on uo_img_3.destroy
call gearbox::destroy
end on

type uo_img_2 from gearbox within w_import_orthup
boolean visible = true
integer x = 933
integer y = 312
integer width = 658
integer height = 448
integer taborder = 40
integer mode_ocx = 1
end type

on uo_img_2.destroy
call gearbox::destroy
end on

type uo_img_1 from gearbox within w_import_orthup
boolean visible = true
integer x = 165
integer y = 312
integer width = 658
integer height = 448
integer taborder = 30
integer mode_ocx = 1
end type

on uo_img_1.destroy
call gearbox::destroy
end on

type cb_acquis from uo_picturebutton_390x120 within w_import_orthup
integer x = 1093
integer y = 1432
integer width = 631
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

integer elem

// metier --> acquisition
open(w_patience)

string dossier_arrivee, fichier_arrivee
dossier_arrivee = fxg_get_rep_photos( ) + string(patient_code)

var_suite = true

// Test de l'existence du dossier de destination
if not DirectoryExists( dossier_arrivee ) then
	// faut le créér
	if gfx_creer_rep( dossier_arrivee ) <> 1 then 
		MessageBox("ERREUR DANS LA CREATION DU DOSSIER DE DESTINATION","Impossible de créer le dossier : "+dossier_arrivee)
		var_suite = false
	end if
end if

rep_acquis = profilestring(dir_ini+inifile_orthokis,"ORTHUP", "path_echanges", "\\serveur\power\Orthup\") + string(patient_code) + win_delimiter


if var_suite then
	double v_temps_traitement
	if dw_temps.rowcount() > 0 then
		v_temps_traitement = dw_temps.GetItemNumber(1, "id")
	end if
	
	if cbx_img_1.checked then
		// image de droite 
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_1)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis  , patient_code,false, false, v_temps_traitement, 44)
		FileDelete(rep_acquis + nom_fichier_moulage_1)
	end if
	
	if cbx_img_2.checked then
		// image de face 
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_2)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis  , patient_code,false, false, v_temps_traitement, 42)
		FileDelete(rep_acquis + nom_fichier_moulage_2)
	end if
	
	if cbx_img_3.checked then
		// image de gauche
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_3)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis  , patient_code,false, false, v_temps_traitement, 43)
		FileDelete(rep_acquis + nom_fichier_moulage_3)
	end if
	
	if cbx_img_4.checked then
		// image de mandibule
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_4)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis   , patient_code,false, false, v_temps_traitement, 41)
		FileDelete(rep_acquis + nom_fichier_moulage_4)
	end if
	
	if cbx_img_5.checked then
		// image de maxillaire 
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_5)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis , patient_code,false, false, v_temps_traitement, 40)
		FileDelete(rep_acquis + nom_fichier_moulage_5)
	end if
	
	if cbx_img_6.checked then
		// image de lingual
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_6)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis   , patient_code,false, false, v_temps_traitement, 45)
		FileDelete(rep_acquis + nom_fichier_moulage_6)
	end if
	
	
	
	messagebox("ATTENTION","L'acquisition est terminée !")
		
	
	close(w_patience)
end if

// metier => persistence
// moulage_acquerir
for elem = 1 to 6
	moulage_acquerir_persist_set(elem, moulage_acquerir[elem])	
next


// fermeture du GUI
close(parent)

end event

type cb_annuler from uo_picturebutton_390x120_fermer within w_import_orthup
integer x = 1728
integer y = 1432
integer width = 631
integer height = 152
integer taborder = 30
string text = "A&nnuler"
string iconname = "ACTIONS_abandonner.png"
end type

type ole_acquis from gearbox within w_import_orthup
integer x = 773
integer y = 1756
integer width = 549
integer height = 384
integer taborder = 20
integer mode_ocx = 1
end type

on ole_acquis.destroy
call gearbox::destroy
end on

type lb_acquerir from listbox within w_import_orthup
boolean visible = false
integer x = 265
integer y = 1896
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

type dw_temps from datawindow within w_import_orthup
string tag = "no resize all"
boolean visible = false
integer x = 178
integer y = 112
integer width = 1129
integer height = 72
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_temps_traitement_cherche"
boolean border = false
boolean livescroll = true
end type

