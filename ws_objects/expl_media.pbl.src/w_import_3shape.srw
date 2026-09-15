$PBExportHeader$w_import_3shape.srw
forward
global type w_import_3shape from window
end type
type st_1 from statictext within w_import_3shape
end type
type dw_categorie from datawindow within w_import_3shape
end type
type ddlb_cadre_depart from dropdownlistbox within w_import_3shape
end type
type cbx_maxillaire from checkbox within w_import_3shape
end type
type cbx_mandibule from checkbox within w_import_3shape
end type
type st_etape from statictext within w_import_3shape
end type
type cbx_img_6 from checkbox within w_import_3shape
end type
type cbx_img_5 from checkbox within w_import_3shape
end type
type cbx_img_4 from checkbox within w_import_3shape
end type
type cbx_img_3 from checkbox within w_import_3shape
end type
type cbx_img_2 from checkbox within w_import_3shape
end type
type cbx_img_1 from checkbox within w_import_3shape
end type
type uo_img_6 from gearbox within w_import_3shape
end type
type uo_img_5 from gearbox within w_import_3shape
end type
type uo_img_4 from gearbox within w_import_3shape
end type
type uo_img_3 from gearbox within w_import_3shape
end type
type uo_img_2 from gearbox within w_import_3shape
end type
type uo_img_1 from gearbox within w_import_3shape
end type
type cb_acquis from uo_picturebutton_390x120 within w_import_3shape
end type
type cb_annuler from uo_picturebutton_390x120_fermer within w_import_3shape
end type
type ole_acquis from gearbox within w_import_3shape
end type
type lb_acquerir from listbox within w_import_3shape
end type
type dw_temps from datawindow within w_import_3shape
end type
type gb_1 from groupbox within w_import_3shape
end type
end forward

global type w_import_3shape from window
integer width = 2537
integer height = 2324
boolean titlebar = true
string title = "Importation de Moulages 3Shape"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
boolean center = true
st_1 st_1
dw_categorie dw_categorie
ddlb_cadre_depart ddlb_cadre_depart
cbx_maxillaire cbx_maxillaire
cbx_mandibule cbx_mandibule
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
gb_1 gb_1
end type
global w_import_3shape w_import_3shape

type variables
private double patient_code
private string rep_acquis 

// cadre départ
private int cadre_depart = 1
private constant string PERSIST_CLEF_CADRE_DEPART = "cadre_depart"

// moulages
private  string nom_fichier_moulage_1 = "256x256_RightView.jpg"
private  string nom_fichier_moulage_2 = "256x256_FrontView.jpg"
private  string nom_fichier_moulage_3 = "256x256_LeftView.jpg"
private  string nom_fichier_moulage_4 = "256x256_LowerJaw.jpg"
private  string nom_fichier_moulage_5 = "256x256_UpperJaw.jpg"
private  string nom_fichier_moulage_6 = "256x256_RearView.jpg"

// acquerir oui/non
private boolean moulage_acquerir[]
private constant string PERSIST_SECTION = "3Shape"
private constant string PERSIST_CLEF_ACQUIS_MOULAGE = "acquis_moulage_"
private constant string PERSIST_VAL_TRUE = "1"
private constant string PERSIST_VAL_FALSE = "2"


private string nom_examen
private string dossier_patient_3shape
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
		
		// le dossier OrthoData est confif en base de données car plusieurs scanners possibles
		lien_3shape u_lien_3shape 
		integer v_code_scanner
		
		u_lien_3shape = create lien_3shape
		v_code_scanner = u_lien_3shape.quel_scanner_utiliser()
		select isnull(repertoire_orthodata, 'C:\ProgramData\3Shape\OrthoData\') 
		into :dossier_patient_3shape 
		from scanners_3shape 
		where code = :v_code_scanner ;
		
		// Dossier complet
		dossier_patient_3shape =  trim(dossier_patient_3shape) + string(patient_code)+ win_delimiter
		
		
		if not DirectoryExists(dossier_patient_3shape) then
			Messagebox("ATTENTION", "Ce patient n'a pas de dossier dans les données de 3Shape !")
			var_suite = false
		else
			// en récupère les sous dossier .. pas les fichiers
			lb_acquerir.DirList(dossier_patient_3shape , 16 + 32768)
			integer cpt, nb_files

			nb_files = lb_acquerir.TotalItems()
			for cpt = 1 to nb_files
				tab_item[cpt] = lb_acquerir.text(cpt)
				// On vire les crochets !!!
				tab_item[cpt] = mid (tab_item[cpt], 2, len(tab_item[cpt]) - 2) 
			next
	
			
			if  nb_files = 2 then 
				// Le premier de la liste est forcément "[..]"
				// 1 seul examen => on y va direct
				nom_examen = tab_item[2]
			else
				// 	Choix de l'examen ..
				
				open(w_import_3shape_choix)
				nom_examen = Message.StringParm
				
				
			end if
			
			// On utilse un répertoire TEMP à l'intérieur du dossier d'installation d'Orthokis
			rep_acquis = dossier_patient_3shape + nom_examen + win_delimiter
			
		
			// Y a il des modele de moulage
			nom_complet_fichier_mandibule = dossier_patient_3shape + nom_examen + win_delimiter + "Mandibular.dcm"
			if FileExists(nom_complet_fichier_mandibule) then
				cbx_mandibule.enabled = true
				cbx_mandibule.checked = true
			else
				cbx_mandibule.enabled = false
			end if
			nom_complet_fichier_maxillaire = dossier_patient_3shape + nom_examen + win_delimiter + "Maxillary.dcm"
			if FileExists(nom_complet_fichier_maxillaire) then
				cbx_maxillaire.enabled = true
				cbx_maxillaire.checked = true
			else
				cbx_maxillaire.enabled = false
			end if
				

			// Si il y a la VRAIE image en vignette, on la prend
			if FileExists(rep_acquis + "images" + win_delimiter + "FrontView.jpg") then
				nom_fichier_moulage_1 = "RightView.jpg"
				nom_fichier_moulage_2 = "FrontView.jpg"
				nom_fichier_moulage_3 = "LeftView.jpg"
				nom_fichier_moulage_4 = "LowerJaw.jpg"
				nom_fichier_moulage_5 = "UpperJaw.jpg"
				nom_fichier_moulage_6 = "RearView.jpg"
			else
				// Si on est en PNG et non en JPG
				if FileExists(rep_acquis + "images" + win_delimiter + "FrontView.png") then
					nom_fichier_moulage_1 = "RightView.png"
					nom_fichier_moulage_2 = "FrontView.png"
					nom_fichier_moulage_3 = "LeftView.png"
					nom_fichier_moulage_4 = "LowerJaw.png"
					nom_fichier_moulage_5 = "UpperJaw.png"
					nom_fichier_moulage_6 = "RearView.png"
				else				
					if FileExists(rep_acquis + "images" + win_delimiter + "256x256_FrontView.png") then
						nom_fichier_moulage_1 = "256x256_RightView.png"
						nom_fichier_moulage_2 = "256x256_FrontView.png"
						nom_fichier_moulage_3 = "256x256_LeftView.png"
						nom_fichier_moulage_4 = "256x256_LowerJaw.png"
						nom_fichier_moulage_5 = "256x256_UpperJaw.png"
						nom_fichier_moulage_6 = "256x256_RearView.png"
					end if
				end if
			end if





			uo_img_1.charger_image(rep_acquis + "images" + win_delimiter + nom_fichier_moulage_1 )
			uo_img_2.charger_image(rep_acquis + "images" + win_delimiter + nom_fichier_moulage_2 )
			uo_img_3.charger_image(rep_acquis + "images" + win_delimiter + nom_fichier_moulage_3 )
			uo_img_4.charger_image(rep_acquis + "images" + win_delimiter + nom_fichier_moulage_4 )
			uo_img_5.charger_image(rep_acquis + "images" + win_delimiter + nom_fichier_moulage_5 )
			uo_img_6.charger_image(rep_acquis + "images" + win_delimiter + nom_fichier_moulage_6 )
		

		end if
	end if
end if


return var_suite

end function

on w_import_3shape.create
this.st_1=create st_1
this.dw_categorie=create dw_categorie
this.ddlb_cadre_depart=create ddlb_cadre_depart
this.cbx_maxillaire=create cbx_maxillaire
this.cbx_mandibule=create cbx_mandibule
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
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.dw_categorie,&
this.ddlb_cadre_depart,&
this.cbx_maxillaire,&
this.cbx_mandibule,&
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
this.dw_temps,&
this.gb_1}
end on

on w_import_3shape.destroy
destroy(this.st_1)
destroy(this.dw_categorie)
destroy(this.ddlb_cadre_depart)
destroy(this.cbx_maxillaire)
destroy(this.cbx_mandibule)
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
destroy(this.gb_1)
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
		
		
		dw_categorie.settransobject(sqlca)
		dw_categorie.retrieve()
		if dw_categorie.rowcount() = 0 then	
			// ajout uniquement pour pas que ça soit vide
			dw_categorie.insertrow(1)
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
		
		// le cadre de départ pour l'acquis
		LoadDdlbPhoto ( ddlb_cadre_depart , string ( patient_code ) )
		ddlb_cadre_depart.SelectItem(cadre_depart)
			
			
		close(w_patience)
	else
		close (this)
	end if
	
end if
end event

type st_1 from statictext within w_import_3shape
integer x = 974
integer y = 220
integer width = 352
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
string text = "Catégorie :"
boolean focusrectangle = false
end type

type dw_categorie from datawindow within w_import_3shape
integer x = 1330
integer y = 204
integer width = 914
integer height = 88
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_categorie_courrier_word_favoris_cherche"
boolean border = false
boolean livescroll = true
end type

type ddlb_cadre_depart from dropdownlistbox within w_import_3shape
string tag = "uniquement pour compatibilité acquisition"
boolean visible = false
integer x = 1591
integer y = 408
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

type cbx_maxillaire from checkbox within w_import_3shape
integer x = 311
integer y = 316
integer width = 402
integer height = 80
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

type cbx_mandibule from checkbox within w_import_3shape
integer x = 311
integer y = 188
integer width = 402
integer height = 80
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

type st_etape from statictext within w_import_3shape
boolean visible = false
integer x = 178
integer y = 572
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

type cbx_img_6 from checkbox within w_import_3shape
integer x = 1723
integer y = 1372
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
string text = "   Lingual"
end type

type cbx_img_5 from checkbox within w_import_3shape
integer x = 955
integer y = 1372
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

type cbx_img_4 from checkbox within w_import_3shape
integer x = 187
integer y = 1372
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

type cbx_img_3 from checkbox within w_import_3shape
integer x = 1723
integer y = 796
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

type cbx_img_2 from checkbox within w_import_3shape
integer x = 955
integer y = 796
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

type cbx_img_1 from checkbox within w_import_3shape
integer x = 187
integer y = 796
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
string text = "   Droite"
end type

type uo_img_6 from gearbox within w_import_3shape
boolean visible = true
integer x = 1723
integer y = 1468
integer width = 658
integer height = 448
integer taborder = 50
integer mode_ocx = 1
end type

on uo_img_6.destroy
call gearbox::destroy
end on

type uo_img_5 from gearbox within w_import_3shape
boolean visible = true
integer x = 955
integer y = 1468
integer width = 658
integer height = 448
integer taborder = 40
integer mode_ocx = 1
end type

on uo_img_5.destroy
call gearbox::destroy
end on

type uo_img_4 from gearbox within w_import_3shape
boolean visible = true
integer x = 187
integer y = 1468
integer width = 658
integer height = 448
integer taborder = 30
integer mode_ocx = 1
end type

on uo_img_4.destroy
call gearbox::destroy
end on

type uo_img_3 from gearbox within w_import_3shape
boolean visible = true
integer x = 1723
integer y = 892
integer width = 658
integer height = 448
integer taborder = 50
integer mode_ocx = 1
end type

on uo_img_3.destroy
call gearbox::destroy
end on

type uo_img_2 from gearbox within w_import_3shape
boolean visible = true
integer x = 955
integer y = 892
integer width = 658
integer height = 448
integer taborder = 40
integer mode_ocx = 1
end type

on uo_img_2.destroy
call gearbox::destroy
end on

type uo_img_1 from gearbox within w_import_3shape
boolean visible = true
integer x = 187
integer y = 892
integer width = 658
integer height = 448
integer taborder = 30
integer mode_ocx = 1
end type

on uo_img_1.destroy
call gearbox::destroy
end on

type cb_acquis from uo_picturebutton_390x120 within w_import_3shape
integer x = 1115
integer y = 2012
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


if var_suite then
	double v_temps_traitement
	if dw_temps.rowcount() > 0 then
		v_temps_traitement = dw_temps.GetItemNumber(1, "id")
	end if
	
	if cbx_img_1.checked then
		// image de droite 
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_1)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis + "images" + win_delimiter , patient_code,false, false, v_temps_traitement, 44)
	end if
	
	if cbx_img_2.checked then
		// image de face 
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_2)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis + "images" + win_delimiter , patient_code,false, false, v_temps_traitement, 42)
	end if
	
	if cbx_img_3.checked then
		// image de gauche
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_3)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis + "images" + win_delimiter , patient_code,false, false, v_temps_traitement, 43)
	end if
	
	if cbx_img_4.checked then
		// image de mandibule
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_4)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis + "images" + win_delimiter , patient_code,false, false, v_temps_traitement, 41)
	end if
	
	if cbx_img_5.checked then
		// image de maxillaire 
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_5)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis + "images" + win_delimiter , patient_code,false, false, v_temps_traitement, 40)
	end if
	
	if cbx_img_6.checked then
		// image de lingual
		lb_acquerir.reset()
		lb_acquerir.AddItem(nom_fichier_moulage_6)
		ole_acquis.importer_multiples_images( lb_acquerir, ddlb_cadre_depart, rep_acquis + "images" + win_delimiter , patient_code,false, false, v_temps_traitement, 45)
	end if
	
	
	// Modeles
	string aleatoire
	integer v_categorie
	aleatoire = string(rand(65000))
	// Catégorie de documents
	if dw_categorie.rowcount() > 0 then
		v_categorie = dw_categorie.getitemnumber(dw_categorie.getrow(), "id")
	end if
	
	if cbx_mandibule.checked then
		fichier_arrivee =  dossier_arrivee + win_delimiter +aleatoire+ gfx_extraire_nom_fichier(nom_complet_fichier_mandibule)
		if FileCopy (nom_complet_fichier_mandibule,fichier_arrivee, false ) = 1 then
			// Copie réussiee
			fxg_enregcourrierhisto(patient_code, 'DOCMOU', date(fxg_get_file_date(nom_complet_fichier_mandibule)), 'Mandibule',  aleatoire + gfx_extraire_nom_fichier(nom_complet_fichier_mandibule) , 'D', "N", "N", "", v_categorie)
//			fxg_enregcourrierhisto(patient_code, 'DOCMOU', today(), 'Mandibule',  aleatoire + gfx_extraire_nom_fichier(nom_complet_fichier_mandibule) , 'D', "N")
		end if
	end if
	if cbx_maxillaire.checked then
		fichier_arrivee =  dossier_arrivee + win_delimiter +aleatoire+ gfx_extraire_nom_fichier(nom_complet_fichier_maxillaire)
		if FileCopy (nom_complet_fichier_maxillaire,fichier_arrivee, false ) = 1 then
			// Copie réussiee
			fxg_enregcourrierhisto(patient_code, 'DOCMOU', date(fxg_get_file_date(nom_complet_fichier_maxillaire)), 'Maxillaire',  aleatoire + gfx_extraire_nom_fichier(nom_complet_fichier_maxillaire) , 'D', "N", "N", "", v_categorie)
//			fxg_enregcourrierhisto(patient_code, 'DOCMOU', today(), 'Maxillaire',  aleatoire + gfx_extraire_nom_fichier(nom_complet_fichier_maxillaire) , 'D', "N")
		end if
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

type cb_annuler from uo_picturebutton_390x120_fermer within w_import_3shape
integer x = 1751
integer y = 2012
integer width = 631
integer height = 152
integer taborder = 30
string text = "A&nnuler"
string iconname = "ACTIONS_abandonner.png"
end type

type ole_acquis from gearbox within w_import_3shape
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

type lb_acquerir from listbox within w_import_3shape
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

type dw_temps from datawindow within w_import_3shape
string tag = "no resize all"
boolean visible = false
integer x = 178
integer y = 648
integer width = 1129
integer height = 72
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_temps_traitement_cherche"
boolean border = false
boolean livescroll = true
end type

type gb_1 from groupbox within w_import_3shape
integer x = 178
integer y = 68
integer width = 2213
integer height = 400
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Modèle"
end type

