$PBExportHeader$w_acquisitions_multiples_script_wifi_2013.srw
forward
global type w_acquisitions_multiples_script_wifi_2013 from w_acquisitions_multiples_script_2013
end type
type gb_1 from groupbox within w_acquisitions_multiples_script_wifi_2013
end type
type pb_lancer from uo_picturebutton_390x120 within w_acquisitions_multiples_script_wifi_2013
end type
type uo_previsu_visible from gearbox within w_acquisitions_multiples_script_wifi_2013
end type
type st_acquisitionwifi2 from statictext within w_acquisitions_multiples_script_wifi_2013
end type
type st_acquisitionwifi1 from statictext within w_acquisitions_multiples_script_wifi_2013
end type
type st_acquisitionwifi3 from statictext within w_acquisitions_multiples_script_wifi_2013
end type
type lb_acquis from listbox within w_acquisitions_multiples_script_wifi_2013
end type
end forward

global type w_acquisitions_multiples_script_wifi_2013 from w_acquisitions_multiples_script_2013
integer width = 2290
integer height = 1732
long backcolor = 16777215
gb_1 gb_1
pb_lancer pb_lancer
uo_previsu_visible uo_previsu_visible
st_acquisitionwifi2 st_acquisitionwifi2
st_acquisitionwifi1 st_acquisitionwifi1
st_acquisitionwifi3 st_acquisitionwifi3
lb_acquis lb_acquis
end type
global w_acquisitions_multiples_script_wifi_2013 w_acquisitions_multiples_script_wifi_2013

type variables
string v_dir_acquis_wifi


integer nb_photos_a_acquerir
long photo_courante

long v_script, v_etape 

boolean acquistion_apres_assistant = false
end variables

on w_acquisitions_multiples_script_wifi_2013.create
int iCurrent
call super::create
this.gb_1=create gb_1
this.pb_lancer=create pb_lancer
this.uo_previsu_visible=create uo_previsu_visible
this.st_acquisitionwifi2=create st_acquisitionwifi2
this.st_acquisitionwifi1=create st_acquisitionwifi1
this.st_acquisitionwifi3=create st_acquisitionwifi3
this.lb_acquis=create lb_acquis
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_1
this.Control[iCurrent+2]=this.pb_lancer
this.Control[iCurrent+3]=this.uo_previsu_visible
this.Control[iCurrent+4]=this.st_acquisitionwifi2
this.Control[iCurrent+5]=this.st_acquisitionwifi1
this.Control[iCurrent+6]=this.st_acquisitionwifi3
this.Control[iCurrent+7]=this.lb_acquis
end on

on w_acquisitions_multiples_script_wifi_2013.destroy
call super::destroy
destroy(this.gb_1)
destroy(this.pb_lancer)
destroy(this.uo_previsu_visible)
destroy(this.st_acquisitionwifi2)
destroy(this.st_acquisitionwifi1)
destroy(this.st_acquisitionwifi3)
destroy(this.lb_acquis)
end on

event open;
// En entrée on reçoit une structure (en instance) avec
// - le code du patient
// - qui appelle :  M = le menu (possibilité de boucler sur le patient), E = l'explorateur

v_patient =  message.PowerObjectparm

var_code_local = v_patient.code

dw_script.settransobject(sqlca)

dw_scripts.settransobject(sqlca)
dw_scripts.retrieve()

dw_temps.settransobject(sqlca)
dw_temps.retrieve()


gb_1.backcolor = couleur_fond_fenetre
	

// Mise en place du timer qui va scruter les images dans le dossier ...
v_dir_acquis_wifi = trim(profilestring(dir_ini+inifile_orthokis,"photos","dir_acquis_wifi",""))

sle_rep_courant.text = v_dir_acquis_wifi


// init resize
uo_resize.taille(this)

//placer_image_fond(this, p_fond, image_fond_fenetre)

// init GUI

if Photo_Light then
	this.title = "Acquistions multiples d'images Photo-Light"
else
	if DENTALEYEPAD then
		this.title = "Acquistions multiples d'images Dentaleyepad"
	else
		maj_titre_fenetre()
	end if
end if

	


this.backcolor = couleur_fond_fenetre

// Utile pour la mémo de l'image
ole_previsu.var_num_dossier = var_code_local

long v_temps_defaut
v_temps_defaut = proposition_temps_traitement(var_code_local)
if dw_temps.rowcount() > 0 then
	dw_temps.setItem(1, "id", v_temps_defaut)
	if dw_scripts.rowcount() = 0 then
		Messagebox("ATTENTION","Vous devez d'abord définir un script avant de faire des acquisitions (menu 'Outils', 'Paramètres imagerie').")
		close (this)
	else
		
		
		// Pour tester s'il y a des fichiers dans le dossier ... avant de travailler ...
		lb_acquis.reset() 
		lb_acquis.dirlist(v_dir_acquis_wifi + "*.*", 1 + 32) 
		long combien
		string ajout_s = ""
		
		combien = lb_acquis.TotalItems()
		
		if combien > 0 then
			integer v_reponse
			
			if combien > 1 then ajout_s = 's'
				
			
			v_reponse =  MessageBox("ATTENTION","Le dossier d'acquisition Wi-Fi contient déjà " + string(combien) + " fichier" + ajout_s + ".~n~nSouhaitez-vous poursuivre ?~n~nSinon, nous allons ouvrir l'explorateur Windows dans le dossier.", Question!, YesNoCancel!, 2) 
			
			choose case v_reponse
				case 1
					// rien à faire , on poursuit
					// centrage de la sheet
					//centrer_sheet(this,w_mdi)		

				case 2 
					// Explorer 
					String v_commande
					v_commande = "Explorer.exe /n," + v_dir_acquis_wifi
					run(v_commande)
					close(this)
				case 3
					// on sort
					close(this)
				end choose
						
		else
	
			// centrage de la sheet
			//centrer_sheet(this,w_mdi)		

	
		end if
		
	end if
else
	Messagebox("ATTENTION","Vous devez d'abord définir des étapes des traitement avant de faire des acquisitions (menu 'Outils', 'Paramètres imagerie').")
	close (this)
end if







end event

event timer;string v_dir_acquis_wifi_local
string v_sous_dossier

v_dir_acquis_wifi_local = v_dir_acquis_wifi


if Photo_Light and not acquistion_apres_assistant then
	// Pour Photolight, les photos sont dans un sous dossier ... On va donc chercher le dernir sous dossier 
	lb_fichiers_rep_courant.dirlist(v_dir_acquis_wifi + "*.*", 16) 
	if lb_fichiers_rep_courant.TotalItems() > 0 then 
		// Les sous-dossiers sont sous la forme [101PH_01] ... faut virer les []
		v_sous_dossier = mid(lb_fichiers_rep_courant.text(lb_fichiers_rep_courant.TotalItems()) , 2, len(lb_fichiers_rep_courant.text(lb_fichiers_rep_courant.TotalItems())) -2)
		v_sous_dossier = v_sous_dossier + win_delimiter
		v_dir_acquis_wifi_local = v_dir_acquis_wifi + v_sous_dossier
		// la fonction get_tab_fichiers_rep_acquis se base sur la sle => faut la mettre à jour avant
		sle_rep_courant.text = v_dir_acquis_wifi_local
	end if
end if



if photo_courante <= nb_photos_a_acquerir then

	string v_fichier_image, tab_fichiers[]
	integer index_tab_fichier
	
	// Scrutation du répertoire pour acquérir l'image ...
	
	// on liste tous les fichiers ds le rep 
	lb_acquis.reset() 
	lb_acquis.dirlist(v_dir_acquis_wifi_local + "*.*", 1 + 32) 
	
	
	// filtre sur les fichiers recup ( en suppr en partant de la fin les fichiers indésirables (cf entete fonction))
	integer nbr_elem
	long elem
	
	
	nbr_elem = lb_acquis.TotalItems()
	if nbr_elem > 0 then
			for elem = 1 to nbr_elem
				// en se basant sur les extensions des fichiers
				choose case upper(right(lb_acquis.text(elem),3))
					case "TIF", "JPG", "BMP", "PNG", "PEG"		// PEG pour JPEG ... !!
						// on ne fait rien
					case else
						lb_acquis.DeleteItem(elem)
					end choose
			next
	end if
	
	if lb_acquis.TotalItems() > 0 then
	
		// Prévisualisation de la 1ère image
		v_fichier_image = v_dir_acquis_wifi_local + lb_acquis.text(1)
		uo_previsu_visible.charger_image(v_fichier_image) 
		yield()
		
		lb_acquis.Selectitem(1)
		get_tab_fichiers_rep_acquis(lb_acquis, tab_fichiers)
	
	end if
	
	if upperBound(tab_fichiers) > 0 then
		
		st_acquisitionwifi3.text = "Progression : "+string(photo_courante) + " / "+string(nb_photos_a_acquerir)
		
		ole_previsu.importer_multiples_script_2013 (var_code_local , v_script ,v_etape , tab_fichiers, dw_script, photo_courante)
		
		for index_tab_fichier = 1 to upperBound(tab_fichiers) 
			// Pas de gestion d'erreur car possible qu'elle soit supprimée dans le script avant
			FileDelete(tab_fichiers[index_tab_fichier])
		next
		// On avance dans les photos à acquérir
		photo_courante = photo_courante + upperBound(tab_fichiers)

		st_acquisitionwifi3.text = "Progression : "+string(photo_courante) + " / "+string(nb_photos_a_acquerir)

	end if
else
	// acquisition complète
	close(this)
end if


end event

type p_fond from w_acquisitions_multiples_script_2013`p_fond within w_acquisitions_multiples_script_wifi_2013
end type

type sle_rep_courant from w_acquisitions_multiples_script_2013`sle_rep_courant within w_acquisitions_multiples_script_wifi_2013
end type

type ole_previsu from w_acquisitions_multiples_script_2013`ole_previsu within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
integer x = 645
end type

type st_2 from w_acquisitions_multiples_script_2013`st_2 within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
end type

type pb_fermer from w_acquisitions_multiples_script_2013`pb_fermer within w_acquisitions_multiples_script_wifi_2013
integer x = 864
integer y = 1428
integer width = 594
end type

type pb_acquerir from w_acquisitions_multiples_script_2013`pb_acquerir within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
end type

type pb_rafraichir_fichiers_rep_courant from w_acquisitions_multiples_script_2013`pb_rafraichir_fichiers_rep_courant within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
end type

type lb_fichiers_rep_courant from w_acquisitions_multiples_script_2013`lb_fichiers_rep_courant within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
end type

type st_1 from w_acquisitions_multiples_script_2013`st_1 within w_acquisitions_multiples_script_wifi_2013
end type

type uo_resize from w_acquisitions_multiples_script_2013`uo_resize within w_acquisitions_multiples_script_wifi_2013
end type

type pb_supprimer from w_acquisitions_multiples_script_2013`pb_supprimer within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
end type

type dw_scripts from w_acquisitions_multiples_script_2013`dw_scripts within w_acquisitions_multiples_script_wifi_2013
end type

type dw_temps from w_acquisitions_multiples_script_2013`dw_temps within w_acquisitions_multiples_script_wifi_2013
end type

type st_4 from w_acquisitions_multiples_script_2013`st_4 within w_acquisitions_multiples_script_wifi_2013
end type

type st_3 from w_acquisitions_multiples_script_2013`st_3 within w_acquisitions_multiples_script_wifi_2013
end type

type dw_script from w_acquisitions_multiples_script_2013`dw_script within w_acquisitions_multiples_script_wifi_2013
end type

type pb_choix_rep_couran from w_acquisitions_multiples_script_2013`pb_choix_rep_couran within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
end type

type pb_assistant from w_acquisitions_multiples_script_2013`pb_assistant within w_acquisitions_multiples_script_wifi_2013
integer x = 864
integer y = 1016
integer width = 594
string text = "&Assistant"
end type

event pb_assistant::clicked;

// Script et temps

v_script = dw_scripts.GetItemnumber(1,"id")
nb_photos_a_acquerir = dw_script.rowcount()

// Passage de plusieurs pamètres à la fenetres .. pour eviter de faire une structure ...

param_win[1] = 	sle_rep_courant.text	// répertoire d'acquisition Wifi
param_win[2] = 	string(v_script)					// script acquisition

open(w_explorateur_acquisition_wifi )

If Messagebox("CONFIRMATION","Confirmez-vous l'acquisition ?", Question!, YesNo!, 1) = 1 then 
	acquistion_apres_assistant = true
	pb_lancer.triggerevent(clicked!)
end if
end event

type pb_explorer from w_acquisitions_multiples_script_2013`pb_explorer within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
end type

type gb_1 from groupbox within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
integer x = 649
integer y = 536
integer width = 1006
integer height = 864
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Image acquise"
end type

type pb_lancer from uo_picturebutton_390x120 within w_acquisitions_multiples_script_wifi_2013
integer x = 864
integer y = 808
integer width = 594
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;st_1.visible = false
st_3.visible = false
dw_temps.visible = false
dw_scripts.visible = false


//ddlb_debut.visible = false
st_acquisitionwifi1.visible = true
st_acquisitionwifi2.visible = true
st_acquisitionwifi3.visible = true

this.visible = false
gb_1.visible = true
uo_previsu_visible.visible = true


photo_courante = 1

// Script et temps
v_script = dw_scripts.GetItemnumber(1,"id")
v_etape = dw_temps.GetItemnumber(1,"id")
dw_script.retrieve(v_script) 
nb_photos_a_acquerir = dw_script.rowcount()

Timer(1)


end event

type uo_previsu_visible from gearbox within w_acquisitions_multiples_script_wifi_2013
event destroy ( )
integer x = 690
integer y = 620
integer width = 914
integer height = 736
integer taborder = 40
boolean bringtotop = true
end type

on uo_previsu_visible.destroy
call gearbox::destroy
end on

type st_acquisitionwifi2 from statictext within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
integer x = 485
integer y = 108
integer width = 1394
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "Cliquez sur Fermer pour interrompre"
alignment alignment = center!
end type

type st_acquisitionwifi1 from statictext within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
integer x = 485
integer y = 8
integer width = 1394
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
string text = "Acquisition d~'images Wi-Fi en cours"
alignment alignment = center!
end type

type st_acquisitionwifi3 from statictext within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
integer x = 485
integer y = 212
integer width = 1394
integer height = 84
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
alignment alignment = center!
end type

type lb_acquis from listbox within w_acquisitions_multiples_script_wifi_2013
boolean visible = false
integer x = 1920
integer y = 900
integer width = 480
integer height = 400
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

