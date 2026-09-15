$PBExportHeader$w_acquisitions_multiples_script_wifi.srw
forward
global type w_acquisitions_multiples_script_wifi from w_acquisitions_multiples_script
end type
type st_acquisitionwifi2 from statictext within w_acquisitions_multiples_script_wifi
end type
type st_acquisitionwifi1 from statictext within w_acquisitions_multiples_script_wifi
end type
type uo_previsu_visible from gearbox within w_acquisitions_multiples_script_wifi
end type
type pb_1 from uo_picturebutton_390x120 within w_acquisitions_multiples_script_wifi
end type
type gb_1 from groupbox within w_acquisitions_multiples_script_wifi
end type
end forward

global type w_acquisitions_multiples_script_wifi from w_acquisitions_multiples_script
integer width = 2341
long backcolor = 16777215
st_acquisitionwifi2 st_acquisitionwifi2
st_acquisitionwifi1 st_acquisitionwifi1
uo_previsu_visible uo_previsu_visible
pb_1 pb_1
gb_1 gb_1
end type
global w_acquisitions_multiples_script_wifi w_acquisitions_multiples_script_wifi

type variables


string v_dir_acquis_wifi


long nb_photos_a_acquerir
long photo_courante

boolean acquisition_en_cours = false

string tab_cadres[]
string tab_fichiers[], tab_fichiers_vierge[]
integer tab_operations[]

end variables

forward prototypes
public subroutine initialisation ()
end prototypes

public subroutine initialisation ();

// vérif présence clef HASP
h.chp()

// charge la ddlb des scripts
ddlb_script.charger()

// init resize
//uo_resize.taille(this)

// init du rep courant
//pb_rafraichir_fichiers_rep_courant.TRIGGEREVENT(clicked!)

// init GUI
//maj_titre_fenetre()

string vn,vp
double vnd

select nom, prenom, numero_dossier INTO :vn,:vp, :vnd FROM patient WHERE code = :var_code_local ;

if isnull(vn) then
	vn = ""
end if
if isnull(vp) then
	vp = ""
end if

if Photo_Light then
	this.title = "Acquisition Photo-Light : " + vn + " " + vp +" - N° "+ string(vnd)
else
	if DENTALEYEPAD then
		this.title = "Acquisition Dentaleyepad : " + vn + " " + vp +" - N° "+ string(vnd)
	else
		this.title = "Acquisition Wi-Fi : " + vn + " " + vp +" - N° "+ string(vnd)
	end if
end if



this.backcolor = couleur_fond_fenetre

// Utile pour la mémo de l'image
ole_previsu.var_num_dossier = var_code_local

end subroutine

on w_acquisitions_multiples_script_wifi.create
int iCurrent
call super::create
this.st_acquisitionwifi2=create st_acquisitionwifi2
this.st_acquisitionwifi1=create st_acquisitionwifi1
this.uo_previsu_visible=create uo_previsu_visible
this.pb_1=create pb_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_acquisitionwifi2
this.Control[iCurrent+2]=this.st_acquisitionwifi1
this.Control[iCurrent+3]=this.uo_previsu_visible
this.Control[iCurrent+4]=this.pb_1
this.Control[iCurrent+5]=this.gb_1
end on

on w_acquisitions_multiples_script_wifi.destroy
call super::destroy
destroy(this.st_acquisitionwifi2)
destroy(this.st_acquisitionwifi1)
destroy(this.uo_previsu_visible)
destroy(this.pb_1)
destroy(this.gb_1)
end on

event open;call super::open;
boolean v_definir = false
boolean v_suite = true
string v_repertoire

gb_1.backcolor = couleur_fond_fenetre
	

// Mise en place du timer qui va scruter les images dans le dossier ...
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


if v_suite then
	sle_rep_courant.text = v_dir_acquis_wifi
	
	// Pour tester s'il y a des fichiers dans le dossier ... avant de travailler ...
	lb_fichiers_rep_courant.reset() 
	lb_fichiers_rep_courant.dirlist(v_dir_acquis_wifi + "*.*", 1 + 32) 
	long combien
	string ajout_s = ""
	
	combien = lb_fichiers_rep_courant.TotalItems()
	
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
	
else
	close(this)
end if




end event

event timer;string v_dir_acquis_wifi_local
string v_sous_dossier

v_dir_acquis_wifi_local = v_dir_acquis_wifi


if Photo_Light then
	// Pour Photolight, les photos sont dans un sous dossier ... On va donc chercher le dernir sous dossier 
	lb_fichiers_rep_courant.dirlist(trim(sle_rep_courant.text) + "*.*", 16) 
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
	
	// y a encore des photos à acquerir
	
	lb_fichiers_rep_courant.reset() 
	lb_fichiers_rep_courant.dirlist(v_dir_acquis_wifi_local + "*.*", 1 + 32) 


	// filtre sur les fichiers recup ( en suppr en partant de la fin les fichiers indésirables (cf entete fonction))
	integer nbr_elem
	nbr_elem = lb_fichiers_rep_courant.TotalItems()
	
	// Y a des fichiers
	
	if nbr_elem > 0 then
		// Timer
		lb_fichiers_rep_courant.SelectItem(1)
		
		tab_fichiers = tab_fichiers_vierge
		
		// initialise tab_fichiers avec la liste des fichiers contenu dans le dossier
		get_tab_fichiers_rep_acquis(lb_fichiers_rep_courant, tab_fichiers)
		
		if upperbound(tab_fichiers) > 0 then
			// principe oui mais ...
			uo_previsu_visible.charger_image(tab_fichiers[1]) 
		end if
			
		// acquisition par l'intermédiaire d'une gearbox
		ole_previsu.importer_multiples_script(var_code_local , tab_cadres, tab_fichiers,tab_operations, true, false , photo_courante ) 
		
		photo_courante = photo_courante + nbr_elem
		
	end if	
	if photo_light then
		// On remet la bonne valeur
		sle_rep_courant.text = v_dir_acquis_wifi
	end if
else
	if photo_light then
		// On remet la bonne valeur
		sle_rep_courant.text = v_dir_acquis_wifi
	end if
	// acquisition complète
	close(this)
end if


end event

type p_fond from w_acquisitions_multiples_script`p_fond within w_acquisitions_multiples_script_wifi
end type

type sle_rep_courant from w_acquisitions_multiples_script`sle_rep_courant within w_acquisitions_multiples_script_wifi
end type

type ole_previsu from w_acquisitions_multiples_script`ole_previsu within w_acquisitions_multiples_script_wifi
end type

type pb_configurer from w_acquisitions_multiples_script`pb_configurer within w_acquisitions_multiples_script_wifi
end type

type st_2 from w_acquisitions_multiples_script`st_2 within w_acquisitions_multiples_script_wifi
boolean visible = false
end type

type pb_renommer from w_acquisitions_multiples_script`pb_renommer within w_acquisitions_multiples_script_wifi
end type

type pb_annuler from w_acquisitions_multiples_script`pb_annuler within w_acquisitions_multiples_script_wifi
end type

type pb_dupliquer from w_acquisitions_multiples_script`pb_dupliquer within w_acquisitions_multiples_script_wifi
end type

type pb_script_enregistrer from w_acquisitions_multiples_script`pb_script_enregistrer within w_acquisitions_multiples_script_wifi
end type

type pb_script_ajouter from w_acquisitions_multiples_script`pb_script_ajouter within w_acquisitions_multiples_script_wifi
end type

type pb_script_supprimer from w_acquisitions_multiples_script`pb_script_supprimer within w_acquisitions_multiples_script_wifi
end type

type pb_fermer from w_acquisitions_multiples_script`pb_fermer within w_acquisitions_multiples_script_wifi
boolean visible = false
integer x = 2437
end type

type pb_acquerir from w_acquisitions_multiples_script`pb_acquerir within w_acquisitions_multiples_script_wifi
integer x = 1248
integer y = 1628
string text = "A&cquérir"
boolean default = true
end type

event pb_acquerir::clicked;
if acquisition_en_cours then
	close(parent)
else
	
	acquisition_en_cours = true
	
	// Efface les éléments du haut
	st_1.visible = false
	ddlb_script.visible = false
	pb_script_ajouter.visible = false
	pb_script_supprimer.visible = false
	pb_renommer.visible = false
	pb_configurer.visible = false
	pb_annuler.visible = false
	pb_explorer.visible = false
	pb_script_enregistrer.visible = false
	
	// Affiche message patienter
	st_acquisitionwifi1.visible = true
	st_acquisitionwifi2.visible = true
	
	pb_1.visible = false
	
	
	this.text = "&Annuler"
	
	
	boolean suppression = false
	boolean v_suite = true
	
	uo_acquis_script scripts
	
	scripts = create uo_acquis_script
	
	scripts.charger()
	
	// Récupère la liste des cadres et des opérations
	if not scripts.get_tab_cadres_images(ddlb_script.get_element_courant(), tab_cadres, tab_operations, suppression) then 
		messagebox("ERREUR ...", "Récupération de la configuration du script impossible ~nAcquisition annulée.",StopSign!)
		close(parent)
	else
	
		nb_photos_a_acquerir = upperbound(tab_cadres)
		photo_courante = 1
		
		if nb_photos_a_acquerir > 0 then
			
			// déduction rep photos patient (avec création si necessaire)
			string rep_photos_patient
			rep_photos_patient = dir_photos + string(var_code_local) 
			if not fxg_FileExists(rep_photos_patient) then
				if not gfx_creer_rep( rep_photos_patient) = 1 then 
					messagebox("ERREUR ...", "Impossible de créer un dossier photo pour le patient ! ~n~nOpération d'acquisition annulée.", StopSign!)
					v_suite = false
				end if
			end if
		
			if v_suite then
				// Lance le timer
				timer(1)
			end if
		else
			messagebox("ERREUR ...", "Aucune image à acquérir dans ce script~nAcquisition annulée.",StopSign!)
			close(parent)
		end if
	end if
end if

end event

type pb_rafraichir_fichiers_rep_courant from w_acquisitions_multiples_script`pb_rafraichir_fichiers_rep_courant within w_acquisitions_multiples_script_wifi
boolean visible = false
end type

type lb_fichiers_rep_courant from w_acquisitions_multiples_script`lb_fichiers_rep_courant within w_acquisitions_multiples_script_wifi
boolean visible = false
end type

type st_4 from w_acquisitions_multiples_script`st_4 within w_acquisitions_multiples_script_wifi
integer x = 78
end type

type st_1 from w_acquisitions_multiples_script`st_1 within w_acquisitions_multiples_script_wifi
end type

type ddlb_script from w_acquisitions_multiples_script`ddlb_script within w_acquisitions_multiples_script_wifi
end type

type uo_resize from w_acquisitions_multiples_script`uo_resize within w_acquisitions_multiples_script_wifi
end type

type pb_autre from w_acquisitions_multiples_script`pb_autre within w_acquisitions_multiples_script_wifi
boolean visible = false
integer x = 1989
integer y = 1628
end type

type pb_supprimer from w_acquisitions_multiples_script`pb_supprimer within w_acquisitions_multiples_script_wifi
boolean visible = false
end type

type pb_choix_rep_courant from w_acquisitions_multiples_script`pb_choix_rep_courant within w_acquisitions_multiples_script_wifi
boolean visible = false
end type

type pb_explorer from w_acquisitions_multiples_script`pb_explorer within w_acquisitions_multiples_script_wifi
boolean visible = false
end type

type st_acquisitionwifi2 from statictext within w_acquisitions_multiples_script_wifi
boolean visible = false
integer x = 485
integer y = 276
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

type st_acquisitionwifi1 from statictext within w_acquisitions_multiples_script_wifi
boolean visible = false
integer x = 485
integer y = 176
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

type uo_previsu_visible from gearbox within w_acquisitions_multiples_script_wifi
integer x = 791
integer y = 816
integer width = 914
integer height = 736
integer taborder = 40
boolean bringtotop = true
end type

on uo_previsu_visible.destroy
call gearbox::destroy
end on

type pb_1 from uo_picturebutton_390x120 within w_acquisitions_multiples_script_wifi
integer x = 763
integer y = 1628
integer width = 411
integer taborder = 100
boolean bringtotop = true
string text = "&Annuler"
end type

event clicked;call super::clicked;

close(parent)
end event

type gb_1 from groupbox within w_acquisitions_multiples_script_wifi
integer x = 727
integer y = 728
integer width = 1029
integer height = 872
integer taborder = 50
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

