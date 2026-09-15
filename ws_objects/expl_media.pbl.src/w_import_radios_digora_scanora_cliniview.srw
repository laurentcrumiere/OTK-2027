$PBExportHeader$w_import_radios_digora_scanora_cliniview.srw
forward
global type w_import_radios_digora_scanora_cliniview from w_import_radios
end type
type st_digora_newest from statictext within w_import_radios_digora_scanora_cliniview
end type
type st_acquis_digora from statictext within w_import_radios_digora_scanora_cliniview
end type
type gb_digora from groupbox within w_import_radios_digora_scanora_cliniview
end type
end forward

global type w_import_radios_digora_scanora_cliniview from w_import_radios
integer width = 2971
integer height = 2032
st_digora_newest st_digora_newest
st_acquis_digora st_acquis_digora
gb_digora gb_digora
end type
global w_import_radios_digora_scanora_cliniview w_import_radios_digora_scanora_cliniview

type variables

// ---- pour savoir Scanora ou Digora
string type_lien 	// Vaudra "S" ou "D" ... mis à jour par la fonction ini()
string nom_logiciel  // pour scanora ou cliniview

// ------------- Pour Digora
private		constant	int		iint_decalage = 7
private		constant	string	istr_nom_fichier_temp = "digora_temp.jpg"

private		string		itabstr_patient_info_digora[]
private		boolean	ib_pb_de_connection
private		string		istr_path_export_temp

private		uo_lien_digora_scanora_cliniview		uo_digora_scanora_cliniview


// ---------- Pour Sanora
private		string 	tab_fichiers_images[]
private		date	 	tab_date_images[]

end variables

forward prototypes
public subroutine make_path_fichier_import (ref string str_fichier_import)
public subroutine previsu_radio (integer int_index)
public subroutine traiter_patient_trouve ()
public function integer previsu_radio_digora ()
public function integer previsu_radio_scanora_cliniview (integer index_tableau)
public function long recup_num_radio ()
end prototypes

public subroutine make_path_fichier_import (ref string str_fichier_import);//	if previsu_radio_digora() = 1 then
//	// si la prévi = OK
//		str_fichier_import = istr_path_export_temp
//	else
//		str_fichier_import = ""
//	end if

// si la prévi = OK

if fileExists(istr_path_export_temp) then
	str_fichier_import = istr_path_export_temp
else
	str_fichier_import = ""
end if

end subroutine

public subroutine previsu_radio (integer int_index);if type_lien = "D" then
	if previsu_radio_digora() = -1 then
		// si un pb lors de la prévisu
		messagebox("ATTENTION ...", "Previsualisation impossible.", Exclamation!)
	end if
else
	if previsu_radio_scanora_cliniview(int_index) = -1 then
		// si un pb lors de la prévisu
		messagebox("ATTENTION ...", "Previsualisation impossible.", Exclamation!)
	end if
end if

end subroutine

public subroutine traiter_patient_trouve ();// procédure à lancer lorsque le patient est trouvé ds base digora(r)
// si le patient est trouvé 
// -> le tableau de string est chargé des infos récup sous digora

long	i = 1
long	nbr_radio
string	lstr_radio_num, lstr_radio_date


// recup nbr de radio pour ce patient -> des pairs, donc *2
nbr_radio = long(itabstr_patient_info_digora[7]) *2

if long(itabstr_patient_info_digora[7]) > 0 then
// si au moins 1 radio -> on doit remplir la listBox
	do
		// rajoute un élément à la list-box
		// pour la récup des info -> tjrs par paire
		lb_radios.AddItem("Radio numéro " + itabstr_patient_info_digora[iint_decalage + i] + itabstr_patient_info_digora[iint_decalage + i + 1])
		
		// maj cpt de boucle (tjrs par paire)
		i += 2
	loop while i <= nbr_radio
	
end if

if lb_radios.TotalItems() > 0 then
// s'il y a des radios ds la liste
	// on maj date dernière acquisition
	st_digora_newest.text = itabstr_patient_info_digora[6]
else
// pas de radio -> pas de date de dernière acquis
	st_digora_newest.text = ""
end if

end subroutine

public function integer previsu_radio_digora ();// fx qui exporte une radio de digora et la prévisualise
// ds le cadre de previsu
// reurn 1 si ok
//		-1 si pb

int		val_retour = -1
int		lint_num_radio

// Digora
lint_num_radio = recup_num_radio()

if lint_num_radio <> -1 then
// si un index est bien récup
	
	if uo_digora_scanora_cliniview.exporter_radio(lint_num_radio , string(idbl_identifiant_odr) , istr_path_export_temp) = 1 then
	// si export radio sous un nom temporaire ds rep instal de pwo = OK
		// on la charge dans ole_previ
		ole_previ.charger_image(istr_path_export_temp)
		
		// maj var de retour
		val_retour = 1
	end if
else
	// pb ou aucune ligne sélect -> msg
	messagebox("INFORMATION ...","Aucune radio de sélectionnée dans la liste. ~n~nIl est  impératif d'en sélectionner une.")
end if
return val_retour
end function

public function integer previsu_radio_scanora_cliniview (integer index_tableau);// fx qui exporte une radio de digora et la prévisualise
// ds le cadre de previsu
// reurn 1 si ok
//		-1 si pb

int		val_retour = -1
 
if index_tableau > 0 and index_tableau <= UpperBound(tab_fichiers_images)  then

	// Scanora
	ole_previ.charger_image(tab_fichiers_images[index_tableau])	
	ole_previ.em_date_acquis.text = string(tab_date_images[index_tableau])
	
	// maj var de retour
	val_retour = 1
else
	// pb ou aucune ligne sélect -> msg
	messagebox("INFORMATION ...","Aucune radio de sélectionnée dans la liste. ~n~nIl est  impératif d'en sélectionner une.")
end if

return val_retour
end function

public function long recup_num_radio ();// fx qui return le num de la radio correspondant à la ligne sélect ds list-box
// si pb, ou aucune ligne de sélectionnées ds list-box -> return -1

long	lint_recupindex
long	lint_returnval = -1


lint_recupindex = lb_radios.SelectedIndex()

if lint_recupindex <> -1 then
// si pas d'erreur OU bien un item de sélect
	// prepa index du tableau
	lint_recupindex = lint_recupindex + iint_decalage + (lint_recupindex -1)
	lint_returnval = long(itabstr_patient_info_digora[lint_recupindex])
end if

return lint_returnval
end function

on w_import_radios_digora_scanora_cliniview.create
int iCurrent
call super::create
this.st_digora_newest=create st_digora_newest
this.st_acquis_digora=create st_acquis_digora
this.gb_digora=create gb_digora
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_digora_newest
this.Control[iCurrent+2]=this.st_acquis_digora
this.Control[iCurrent+3]=this.gb_digora
end on

on w_import_radios_digora_scanora_cliniview.destroy
call super::destroy
destroy(this.st_digora_newest)
destroy(this.st_acquis_digora)
destroy(this.gb_digora)
end on

event close;call super::close;if not ib_pb_de_connection then
// si pas de pb de connection à l'obj digora -> digora est donc ouvert
	if type_lien = "D" then
		if messagebox("Question ...", "Voulez-vous fermer le logiciel DIGORA ?", Question!, YesNo!) = 1 then
		// si l'utilisateur souhaite refermer le logiciel DIGORA par la même occas
			uo_digora_scanora_cliniview.fermer_digora()
		end if
	else
//		if messagebox("Question ...", "Voulez-vous fermer le logiciel SCANORA ?", Question!, YesNo!) = 1 then
//		// si l'utilisateur souhaite refermer le logiciel SCANORA par la même occas
//			uo_digora.fermer_scanora()
//		end if
	end if
end if

// vide la mémoire
destroy uo_digora_scanora_cliniview
end event

event open;call super::open;
// instanciation obj digora (var d'instance)
uo_digora_scanora_cliniview = create uo_lien_digora_scanora_cliniview

type_lien = uo_digora_scanora_cliniview.digora_ou_scanora_ou_cliniview()

if type_lien =  "D" then
		// DIGORA
		nom_logiciel = "DIGORA"
		this.title = "Importation de radios " + nom_logiciel

		if uo_digora_scanora_cliniview.open_connection_digora() = 1 then
			
			this.title = "Importation de radios DIGORA"
			// la connecion OLE à DIGORA s'est bien passée
			if uo_digora_scanora_cliniview.recup_info_patient(itabstr_patient_info_digora , string(idbl_identifiant_odr)) = 1 then
			// si info récup -> maj fenêtre
				traiter_patient_trouve()
				
				// contruct chemin d'export temporaire -> dossier d'install de pwo (pour la prévisualisation)
				istr_path_export_temp = DIR_INI + istr_nom_fichier_temp
			else
			// impossible de retrouver le patient sous digora
				close(this)
			end if
			
		else 
		// impossible de se connecter à l'obj OLE digora
			// maj d'un booléen pour enpécher l'exécution d'un script ds le close event
			ib_pb_de_connection = true
			// on referme la fenêtre
			close(this)
		end if

else
	// "S" or "C"		// Scanora ou Cliniview
	
	if type_lien = "S" then
		nom_logiciel = "SCANORA"
	else
		nom_logiciel = "CliniView"
	end if
	
	this.title = "Importation de radios " + nom_logiciel
	// On masque le cadre en haut à gauche
	gb_digora.visible = false
	st_acquis_digora.visible = false
	st_digora_newest.visible = false

	string dossier_scanora_ini
	
	if uo_digora_scanora_cliniview.open_connection_scanora_cliniview() = 1 then
		
		// Les infos seront dans scanora_export.ini
		string v_fichier_scanora_cliniview_ini, v_fichier_image
		integer retour
		
		v_fichier_scanora_cliniview_ini = dir_ini + "\" + nom_logiciel + "_export.ini"
		
		uo_digora_scanora_cliniview.SetOutputFormat("INI")
		
		if uo_digora_scanora_cliniview.GetSinglePatient( v_fichier_scanora_cliniview_ini, string(idbl_identifiant_odr),"","",true, "JPG", 1) = 0 then
			
			// faut lire le fichier ini pour retrouver les infos .. les radios sont dans le sous dossier Exported_Images
			// On a 1 patient => les datas sont dans [patient_0]
			
			long nb_images
			long cpt_images
			
			string v_numero_radio, v_date_radio_scanora
			date v_date_radio
			
			nb_images = long(ProfileString(v_fichier_scanora_cliniview_ini,"patient_0","number_of_images","0"))
			
			for cpt_images = 1 to nb_images
				
				v_fichier_image = ProfileString(v_fichier_scanora_cliniview_ini,"patient_0/image_"+string(cpt_images -1),"file_name","")
				v_numero_radio = ProfileString(v_fichier_scanora_cliniview_ini,"patient_0/image_"+string(cpt_images -1),"image_id","")
				v_date_radio_scanora = trim(ProfileString(v_fichier_scanora_cliniview_ini,"patient_0/image_"+string(cpt_images -1),"date_of_image",""))
				v_date_radio = date(v_date_radio_scanora)
				
				lb_radios.AddItem("Radio numéro " + v_numero_radio + " du " +string(v_date_radio, "dd/mm/yyyy"))
				tab_fichiers_images[cpt_images] = dir_ini + "\Exported_Images\" + v_fichier_image
				tab_date_images[cpt_images] = v_date_radio
				
			next
			
			if nb_images > 0 then
				lb_radios.SelectItem ( 1 )
				previsu_radio_scanora_cliniview (1)
				
			end if
		end if
	end if

end if



 


end event

type cb_acquis from w_import_radios`cb_acquis within w_import_radios_digora_scanora_cliniview
integer x = 1614
integer y = 1660
integer width = 517
end type

type cb_fermer from w_import_radios`cb_fermer within w_import_radios_digora_scanora_cliniview
integer x = 2135
integer y = 1660
integer width = 517
end type

type ole_previ from w_import_radios`ole_previ within w_import_radios_digora_scanora_cliniview
integer y = 312
integer width = 1481
integer height = 1148
long backcolor = 1090519039
end type

type lb_radios from w_import_radios`lb_radios within w_import_radios_digora_scanora_cliniview
integer height = 1312
end type

type st_pwo_patient from w_import_radios`st_pwo_patient within w_import_radios_digora_scanora_cliniview
end type

type st_pwo_num_dossier from w_import_radios`st_pwo_num_dossier within w_import_radios_digora_scanora_cliniview
end type

type st_pwo_naissance from w_import_radios`st_pwo_naissance within w_import_radios_digora_scanora_cliniview
end type

type st_1 from w_import_radios`st_1 within w_import_radios_digora_scanora_cliniview
end type

type st_2 from w_import_radios`st_2 within w_import_radios_digora_scanora_cliniview
end type

type st_3 from w_import_radios`st_3 within w_import_radios_digora_scanora_cliniview
end type

type gb_pwo from w_import_radios`gb_pwo within w_import_radios_digora_scanora_cliniview
string text = "Informations ORTHOkis"
end type

type st_digora_newest from statictext within w_import_radios_digora_scanora_cliniview
integer x = 2030
integer y = 120
integer width = 439
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_acquis_digora from statictext within w_import_radios_digora_scanora_cliniview
integer x = 1536
integer y = 120
integer width = 494
integer height = 72
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Dernière Acquisition :"
boolean focusrectangle = false
end type

type gb_digora from groupbox within w_import_radios_digora_scanora_cliniview
integer x = 1426
integer y = 48
integer width = 1097
integer height = 216
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informations DIGORA"
end type

