$PBExportHeader$w_acquisitions_multiples_fichiers_wifi.srw
forward
global type w_acquisitions_multiples_fichiers_wifi from w_acquisitions_multiples_fichiers
end type
type st_wifi1 from statictext within w_acquisitions_multiples_fichiers_wifi
end type
type st_wifi2 from statictext within w_acquisitions_multiples_fichiers_wifi
end type
type uo_previsu_visible from gearbox within w_acquisitions_multiples_fichiers_wifi
end type
type pb_lancer from uo_picturebutton_390x120 within w_acquisitions_multiples_fichiers_wifi
end type
end forward

global type w_acquisitions_multiples_fichiers_wifi from w_acquisitions_multiples_fichiers
integer width = 1911
integer height = 1636
string title = "Acquistions multiples d~'images Wi-Fi"
st_wifi1 st_wifi1
st_wifi2 st_wifi2
uo_previsu_visible uo_previsu_visible
pb_lancer pb_lancer
end type
global w_acquisitions_multiples_fichiers_wifi w_acquisitions_multiples_fichiers_wifi

type variables


string v_dir_acquis_wifi
end variables

forward prototypes
public subroutine initialisation ()
end prototypes

public subroutine initialisation ();string vn,vp
double vnd

select nom, prenom, numero_dossier INTO :vn,:vp, :vnd FROM patient WHERE code = :var_code_local ;

if isnull(vn) then
	vn = ""
end if
if isnull(vp) then
	vp = ""
end if

this.title = "Acquisition Wi-Fi : " + vn + " " + vp +" - N° "+ string(vnd)

//h.chp()	//vérif la présence de la clef HASP

lb_acquis.reset()

//charge la ddlb avec les noms du fichiers pwophoto.INI
LoadDdlbPhoto ( ddlb_debut , string ( var_code_local ) )

// Utile pour la mémo de l'image
ole_previsu.var_num_dossier = var_code_local


end subroutine

on w_acquisitions_multiples_fichiers_wifi.create
int iCurrent
call super::create
this.st_wifi1=create st_wifi1
this.st_wifi2=create st_wifi2
this.uo_previsu_visible=create uo_previsu_visible
this.pb_lancer=create pb_lancer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_wifi1
this.Control[iCurrent+2]=this.st_wifi2
this.Control[iCurrent+3]=this.uo_previsu_visible
this.Control[iCurrent+4]=this.pb_lancer
end on

on w_acquisitions_multiples_fichiers_wifi.destroy
call super::destroy
destroy(this.st_wifi1)
destroy(this.st_wifi2)
destroy(this.uo_previsu_visible)
destroy(this.pb_lancer)
end on

event open;call super::open;

if isvalid(this) then
	boolean v_definir = false
	boolean v_suite = true
	string v_repertoire
	
	if Photo_Light then
		this.title = "Acquistions multiples d'images Photo-Light"
	else
		if DENTALEYEPAD then
			this.title = "Acquistions multiples d'images Dentaleyepad"
		end if
	end if
	
	v_dir_acquis_wifi = trim(profilestring(dir_ini+inifile_orthokis,"photos","dir_acquis_wifi",""))
	
	
	if len(v_dir_acquis_wifi) = 0 then
		if MessageBox("ATTENTION","Vous devez d'abord définir le répertoire d'acquisition Wi-Fi.~n~nVoulez-vous le définir maintenant ?",Question!, YesNo!, 2) = 1 then
			v_definir = true
		else
			v_suite = false
		end if
	else
		
		if not DirectoryExists(v_dir_acquis_wifi) then
			if MessageBox("ATTENTION","Le répertoire d'acquisition Wi-Fi actuel n'existe pas.~n~nVoulez-vous le redéfinir maintenant ?",Question!, YesNo!, 2) = 1 then
				v_definir = true
			else
				v_suite = false
			end if
		end if
	end if
	
	if v_definir and v_suite then
		v_repertoire = getCurrentDirectory()
		v_dir_acquis_wifi = get_repertoire("Sélectionnez le dossier d'acquisition des photos Wi-Fi ...",v_repertoire)	
		
		if not DirectoryExists(v_dir_acquis_wifi) then
			v_suite = false
		else
			// Mémo du nouveau chemin
			Setprofilestring(dir_ini+inifile_orthokis,"photos","dir_acquis_wifi", v_dir_acquis_wifi )
	
		end if
	end if
	
	sle_rep_courant.text = v_dir_acquis_wifi
	
	
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
					
	end if
	
	if not v_suite then
		close(this)
	end if
	
end if
	

end event

event timer;call super::timer;
// acquisition Wifi


string v_fichier_image, v_sous_dossier
boolean suppression
long v_temps_traitement

string v_dir_acquis_wifi_local

//open(w_patience)

// pour éviter sortie en cours de route
cb_fermer.enabled ( false )


v_dir_acquis_wifi_local = v_dir_acquis_wifi


// on liste tous les fichiers ds le rep 
lb_acquis.reset() 

// Scrutation du répertoire pour acquérir l'image ...
if Photo_Light then
	// Pour Photolight, les photos sont dans un sous dossier ... On va donc chercher le dernir sous dossier 
	lb_acquis.dirlist(trim(sle_rep_courant.text) + "*.*", 16) 
	if lb_acquis.TotalItems() > 0 then 
		// Les sous-dossiers sont sous la forme [101PH_01] ... faut virer les []
		v_sous_dossier = mid(lb_acquis.text(lb_acquis.TotalItems()) , 2, len(lb_acquis.text(lb_acquis.TotalItems())) -2)
		v_sous_dossier = v_sous_dossier + win_delimiter
		v_dir_acquis_wifi_local = v_dir_acquis_wifi + v_sous_dossier
	end if
end if

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



// On charge en prévisu la 1ere image
nbr_elem = lb_acquis.TotalItems()
if nbr_elem > 0 then 
	
	v_fichier_image = v_dir_acquis_wifi_local + lb_acquis.text(1)
	uo_previsu_visible.charger_image(v_fichier_image) 
	yield()
	
	// avec suppression des fichiers ou pas
	suppression = true
	
	long v_temps
	

	if imagerie_2013 then
		
		v_temps = dw_temps_traitement_cherche.GetItemnumber(1,"id")
		
		//On passe par un DW car fonction écrite pour l'autre acquisition !!
		nbr_elem = lb_acquis.TotalItems()
		for elem = 1 to nbr_elem
			dw_liste_acquisitions.insertrow(0)
			dw_liste_acquisitions.setitem(elem, "nom_fichier", lb_acquis.text(elem))
			dw_liste_acquisitions.setitem(elem, "chemin", v_dir_acquis_wifi_local)
		next
		
		if dw_temps_traitement_cherche.rowcount() > 0 then
			v_temps_traitement = dw_temps_traitement_cherche.GetItemNumber(1, "id")
		end if

		// acquis a proprement parlé
		ole_previsu.importer_multiples_images_dw(dw_liste_acquisitions, ddlb_debut, sle_rep_courant.text, var_code_local, suppression, false, v_temps_traitement)
	else
		// acquis a proprement parlé
		ole_previsu.importer_multiples_images(lb_acquis, ddlb_debut, sle_rep_courant.text, var_code_local, suppression, false, v_temps_traitement, 0)
	end if
	
	// reset de lb_acquis
	lb_acquis.reset()
	
	//reset de la dw
	dw_liste_acquisitions.reset()
	
	//charge la ddlb avec les noms du fichiers pwophoto.INI
	LoadDdlbPhoto ( ddlb_debut , string ( var_code_local ) )

	
end if

//réactivation du bouton Fermer
cb_fermer.enabled ( true )

//close(w_patience)

end event

type p_fond from w_acquisitions_multiples_fichiers`p_fond within w_acquisitions_multiples_fichiers_wifi
end type

type st_2 from w_acquisitions_multiples_fichiers`st_2 within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
end type

type pb_rafraichir_fichiers_rep_courant from w_acquisitions_multiples_fichiers`pb_rafraichir_fichiers_rep_courant within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
end type

type st_100 from w_acquisitions_multiples_fichiers`st_100 within w_acquisitions_multiples_fichiers_wifi
end type

type sle_rep_courant from w_acquisitions_multiples_fichiers`sle_rep_courant within w_acquisitions_multiples_fichiers_wifi
end type

type cb_fermer from w_acquisitions_multiples_fichiers`cb_fermer within w_acquisitions_multiples_fichiers_wifi
integer x = 631
integer y = 1320
integer width = 622
end type

type cb_start from w_acquisitions_multiples_fichiers`cb_start within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
end type

type ole_previsu from w_acquisitions_multiples_fichiers`ole_previsu within w_acquisitions_multiples_fichiers_wifi
integer x = 498
integer y = 512
end type

type st_3 from w_acquisitions_multiples_fichiers`st_3 within w_acquisitions_multiples_fichiers_wifi
end type

type lb_temp from w_acquisitions_multiples_fichiers`lb_temp within w_acquisitions_multiples_fichiers_wifi
end type

type lb_files from w_acquisitions_multiples_fichiers`lb_files within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
end type

type lb_dir from w_acquisitions_multiples_fichiers`lb_dir within w_acquisitions_multiples_fichiers_wifi
end type

type tv_1 from w_acquisitions_multiples_fichiers`tv_1 within w_acquisitions_multiples_fichiers_wifi
end type

type pb_choix_rep_courant from w_acquisitions_multiples_fichiers`pb_choix_rep_courant within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
end type

type pb_explorer from w_acquisitions_multiples_fichiers`pb_explorer within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
end type

type gb_1 from w_acquisitions_multiples_fichiers`gb_1 within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
integer x = 425
integer y = 432
integer height = 864
string text = "Image acquise"
end type

type st_1 from w_acquisitions_multiples_fichiers`st_1 within w_acquisitions_multiples_fichiers_wifi
end type

type ddlb_debut from w_acquisitions_multiples_fichiers`ddlb_debut within w_acquisitions_multiples_fichiers_wifi
integer width = 1239
integer height = 1452
end type

type cbx_effacer from w_acquisitions_multiples_fichiers`cbx_effacer within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
boolean checked = true
end type

type uo_1 from w_acquisitions_multiples_fichiers`uo_1 within w_acquisitions_multiples_fichiers_wifi
integer x = 1170
end type

type pb_supprimer from w_acquisitions_multiples_fichiers`pb_supprimer within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
end type

type dw_temps_traitement_cherche from w_acquisitions_multiples_fichiers`dw_temps_traitement_cherche within w_acquisitions_multiples_fichiers_wifi
end type

type lb_acquis from w_acquisitions_multiples_fichiers`lb_acquis within w_acquisitions_multiples_fichiers_wifi
end type

type st_4 from w_acquisitions_multiples_fichiers`st_4 within w_acquisitions_multiples_fichiers_wifi
end type

type gb_2 from w_acquisitions_multiples_fichiers`gb_2 within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
end type

type dw_liste_acquisitions from w_acquisitions_multiples_fichiers`dw_liste_acquisitions within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
integer x = 1335
end type

type st_payeur from w_acquisitions_multiples_fichiers`st_payeur within w_acquisitions_multiples_fichiers_wifi
end type

type st_clic_droit from w_acquisitions_multiples_fichiers`st_clic_droit within w_acquisitions_multiples_fichiers_wifi
end type

type st_wifi1 from statictext within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
integer x = 233
integer y = 24
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

type st_wifi2 from statictext within w_acquisitions_multiples_fichiers_wifi
boolean visible = false
integer x = 233
integer y = 124
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

type uo_previsu_visible from gearbox within w_acquisitions_multiples_fichiers_wifi
integer x = 494
integer y = 532
integer width = 914
integer height = 736
integer taborder = 30
boolean bringtotop = true
end type

on uo_previsu_visible.destroy
call gearbox::destroy
end on

type pb_lancer from uo_picturebutton_390x120 within w_acquisitions_multiples_fichiers_wifi
integer x = 631
integer y = 704
integer width = 622
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;st_1.visible = false
dw_temps_traitement_cherche.visible = false
ddlb_debut.visible = false
st_wifi1.visible = true
st_wifi2.visible = true
this.visible = false
gb_1.visible = true
uo_previsu_visible.visible = true

sle_rep_courant.text = v_dir_acquis_wifi
Timer(1)


end event

