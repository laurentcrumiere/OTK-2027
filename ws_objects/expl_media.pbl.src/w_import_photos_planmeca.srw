$PBExportHeader$w_import_photos_planmeca.srw
forward
global type w_import_photos_planmeca from window
end type
type cbx_filtres from checkbox within w_import_photos_planmeca
end type
type cb_acquis from uo_picturebutton_780x120 within w_import_photos_planmeca
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_import_photos_planmeca
end type
type ole_photo from gearbox within w_import_photos_planmeca
end type
type dw_radios from u_basedw within w_import_photos_planmeca
end type
type st_3 from statictext within w_import_photos_planmeca
end type
type st_2 from statictext within w_import_photos_planmeca
end type
type st_1 from statictext within w_import_photos_planmeca
end type
type st_pwo_naissance from statictext within w_import_photos_planmeca
end type
type st_pwo_num_dossier from statictext within w_import_photos_planmeca
end type
type st_pwo_patient from statictext within w_import_photos_planmeca
end type
type gb_pwo from groupbox within w_import_photos_planmeca
end type
end forward

global type w_import_photos_planmeca from window
integer width = 2990
integer height = 1768
boolean titlebar = true
string title = "Lien Planmeca (R) : Acquisition d~'une radio"
windowtype windowtype = response!
long backcolor = 15780518
cbx_filtres cbx_filtres
cb_acquis cb_acquis
pb_1 pb_1
ole_photo ole_photo
dw_radios dw_radios
st_3 st_3
st_2 st_2
st_1 st_1
st_pwo_naissance st_pwo_naissance
st_pwo_num_dossier st_pwo_num_dossier
st_pwo_patient st_pwo_patient
gb_pwo gb_pwo
end type
global w_import_photos_planmeca w_import_photos_planmeca

type variables
//
//constant	integer	iint_decalage = 7
//
long					var_code_local
double 				var_numero_dossier_local
string					var_nom_radio_export

//string				itabstr_patient_info_digora[]
string				istr_nom_patient
string				istr_prenom_patient


//uo_lien_digora		uo_digora
uo_lien_planmeca	uo_planmeca

// Image temporaire
string image_temporaire


// Ole passé en paramètre
struct_acquis_photo	lstruct_acquis


string libelle_logiciel
end variables

forward prototypes
public subroutine recherche_infos_patient_pwo ()
public subroutine previsualisation (integer index)
end prototypes

public subroutine recherche_infos_patient_pwo ();// fx qui récup les infos du patients ds la base de pwo
// et les affiche ds les bonnes zones

string	lstr_pwo_date_naissance
date		ldate_pwo_date_naissance


// recup ds base
select	nom, prenom, date_naissance, numero_dossier
into		:istr_nom_patient, :istr_prenom_patient, :ldate_pwo_date_naissance, :var_numero_dossier_local
from			patient
where		code = :var_code_local ;

// si valleurs récup = NULL
if isnull(istr_nom_patient) then istr_nom_patient = ""
if isnull(istr_prenom_patient) then istr_prenom_patient = ""
if isnull(ldate_pwo_date_naissance) then
	lstr_pwo_date_naissance = " ../../...."
else
// la date est bien init -> transfo en string
	lstr_pwo_date_naissance = string(ldate_pwo_date_naissance)
end if

// affiche ds les bonnes zones
st_pwo_patient.text		= istr_nom_patient + space(1) + istr_prenom_patient
st_pwo_num_dossier.text	= string(var_numero_dossier_local)
st_pwo_naissance.text	= lstr_pwo_date_naissance
end subroutine

public subroutine previsualisation (integer index);//Prévisualisation de l'image sélectionné dans la Dw
integer avec_filtres = 0

if cbx_filtres.checked then 
	avec_filtres = 1
else
	avec_filtres = 0
end if

// On supprime le fichier temporaire pour être sur 
FileDelete(image_temporaire)

// On exporte l'image en fichier temp
uo_planmeca.DxGetImage (index, 1 , avec_filtres , 1, image_temporaire ) 

//affiche la photo fraichement acquise
ole_photo.rendre_vierge()

if fileExists(image_temporaire) then
	ole_photo.charger_image( image_temporaire)
else
	Messagebox("ATTENTION","Une erreur s'est produite dans l'exportation de la radio depuis "+libelle_logiciel+".")
end if
end subroutine

on w_import_photos_planmeca.create
this.cbx_filtres=create cbx_filtres
this.cb_acquis=create cb_acquis
this.pb_1=create pb_1
this.ole_photo=create ole_photo
this.dw_radios=create dw_radios
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_pwo_naissance=create st_pwo_naissance
this.st_pwo_num_dossier=create st_pwo_num_dossier
this.st_pwo_patient=create st_pwo_patient
this.gb_pwo=create gb_pwo
this.Control[]={this.cbx_filtres,&
this.cb_acquis,&
this.pb_1,&
this.ole_photo,&
this.dw_radios,&
this.st_3,&
this.st_2,&
this.st_1,&
this.st_pwo_naissance,&
this.st_pwo_num_dossier,&
this.st_pwo_patient,&
this.gb_pwo}
end on

on w_import_photos_planmeca.destroy
destroy(this.cbx_filtres)
destroy(this.cb_acquis)
destroy(this.pb_1)
destroy(this.ole_photo)
destroy(this.dw_radios)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_pwo_naissance)
destroy(this.st_pwo_num_dossier)
destroy(this.st_pwo_patient)
destroy(this.gb_pwo)
end on

event open;


// Lieu de stockage de l'image temporaire
image_temporaire = dir_ini + 'image_plamenca_tmp.jpg'


// instanciation obj planmeca (var d'instance)
uo_planmeca = create uo_lien_planmeca


// recup struct passé en param à l'ouverture de la fenêtre
lstruct_acquis = message.PowerObjectParm


// recup les infos de la struct ds des var locales
var_code_local 		= lstruct_acquis.num_dossier_patient
var_nom_radio_export	= lstruct_acquis.ole_photo_name

// recherche des infos patients de rappel sous pwo
recherche_infos_patient_pwo()

// Case à cocher des filtres
if profilestring(dir_ini+inifile_orthokis,"PLANMECA","acquerir_filtres","N") = "O" then
	cbx_filtres.checked = true
else
	cbx_filtres.checked = false
end if


if uo_planmeca.connexion_dimaxis() = 0  then
	
	
	if logiciel_planmeca = "R" then 
		libelle_logiciel = "Romexis"
	else
		libelle_logiciel = "Dimaxis"
	end if
	
	
	
	string id
	integer nb_images
	
	IF HOPITAL_ERASME then
		// Lien spécifique sur le code de l'hopital
		select identifiant_erasme into :id from erasme_patient where code_patient = :var_code_local ;
	else
		if uo_planmeca.v_code_lien_radio = "I" then
			id = string(var_code_local)
		else
			id = string(var_numero_dossier_local)
		end if
	end if
		
	// Selection du patient courant 
	uo_planmeca.DxSelectPatient(id,nb_images)
	
	if nb_images > 0 then
	
	
		// On rempli la DW de la liste des radios ...
		
		long ArrayImage[20]
		integer ArrayToothMask[33]
		integer num_radio
		date date_radio
		time time_radio
		string time_str
		
		if nb_images = 1 then
			dw_radios.title = string(nb_images)+" radio dans la liste"
		else
			dw_radios.title = string(nb_images)+" radios dans la liste"
		end if

		for num_radio = 0 to nb_images - 1
		
			uo_planmeca.DxInquireImage (num_radio, ArrayImage,ArrayToothMask)
		
			dw_radios.insertrow(0)
			
			date_radio = date(left(string(ArrayImage[5]),4)+"-"+mid(string(ArrayImage[5]),5,2)+"-"+right(string(ArrayImage[5]),2))
			
			if len(string(ArrayImage[6])) = 5 then
				// Heure sur 1 seul chiffre => aujout d'un zéro devant
				time_str = "0" + string(ArrayImage[6])
			else
				time_str = string(ArrayImage[6])
			end if
			time_radio =  time(left(time_str,2)+":"+mid(time_str,3,2))
			dw_radios.setitem(dw_radios.rowcount(),"index", num_radio)
			dw_radios.setitem(dw_radios.rowcount(),"date", datetime(date_radio, time_radio))
			

			choose case ArrayImage[2]
				case 0
					dw_radios.setitem(dw_radios.rowcount(),"type", "Panoramique")
				case 1
					dw_radios.setitem(dw_radios.rowcount(),"type", "Céphalométrique")
				case 2
					dw_radios.setitem(dw_radios.rowcount(),"type", "Intraorale")
				case else
					dw_radios.setitem(dw_radios.rowcount(),"type", "Autre")
			end choose
					
		next
		
		// On trie la dw et on se positionne sur la première radio
		dw_radios.sort()
		previsualisation(dw_radios.getitemnumber(1,"index"))	
		dw_radios.SelectRow(1,True)
		dw_radios.setrow(1)
		
		centrer(this)
		
		
	else
		close(w_patience)
		MessageBox("ATTENTION !","Ce patient n'a pas de radio dans "+ libelle_logiciel+" (ou celui-ci n'est pas disponible) !")
		cb_acquis.enabled = false
		centrer(this)
	end if
else
	// impossible de se connecter à dimaxis -> on referme la fenêtre
	close(this)
end if

end event

event close;

if logiciel_planmeca <> "?" then
	if messagebox("Question ...", "Voulez-vous fermer le logiciel "+libelle_logiciel + " (R) ?", Question!, YesNo!) = 1 then
	// si l'utilisateur souhaite refermer le logiciel DIGORA par la même occas
		uo_planmeca.fermer_dimaxis()
	end if
end if

// vide la mémoire
destroy uo_planmeca
end event

type cbx_filtres from checkbox within w_import_photos_planmeca
integer x = 1723
integer y = 1320
integer width = 837
integer height = 80
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Utiliser les Filtres Planmeca"
end type

event clicked;
// pour relancer une prévisualisation
if dw_radios.rowcount() > 0 then
	previsualisation(dw_radios.getitemnumber(dw_radios.getrow(),"index"))
end if
end event

type cb_acquis from uo_picturebutton_780x120 within w_import_photos_planmeca
integer x = 1417
integer y = 1448
integer width = 805
integer height = 152
integer taborder = 40
string text = "&Acquérir cette Radio"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;security_attributes	sa		//pour compatibilité winNT lors de création de directory
int						lint_num_radio
string					lstr_rep_photo, lstr_rep_photo_patient, lstr_chemin_radio
string					lstr_nom_radio
boolean					lb_ne_pas_acquerir
boolean					lb_sortir


	// recup rep photo
	lstr_rep_photo = fxg_get_rep_photos()
	
	if lstr_rep_photo <> "" then
	// si le rep photo est valide
		// construction chemin rep photo pour ce patient
		lstr_rep_photo_patient = lstr_rep_photo + string(var_code_local) + win_Delimiter
		
		if not fxg_fileexists(lstr_rep_photo_patient) then
		// si le rep photo patient n'existe pas -> on le crée
			CreateDirectoryA(lstr_rep_photo_patient,sa)
		end if
		
		// on recup le nom du fichier ds pwo_photo.ini
		lstr_nom_radio = ProfileString(lstr_rep_photo + inifile_photo, section, var_nom_radio_export, "")
		
		// chemin complet du fichier photo après export
		lstr_chemin_radio = lstr_rep_photo_patient + lstr_nom_radio
		
		if FileExists(lstr_chemin_radio) then
		// si le fichier photo existe déjà -> question utilisateur pour confirmation
			if messagebox("QUESTION ...", "Ce cadre photo accueille déjà une image ~nqui va être effacée. ~n~n Voulez-vous continuer ?", Question!, YesNo!) = 1 then
			// ok pour effacer le fichier existant
				// on passe le file attribute à archive seulement, histoire d'être sur
				SetFileAttributesA(lstr_chemin_radio,FILE_ATTRIBUTE_ARCHIVE)
				
				// on supprime le fichier
				DeleteFileA(lstr_chemin_radio)
				
			else
			// l'utilisateur annule -> maj boolean
				lb_ne_pas_acquerir = true
			end if
		end if
		
		if not lb_ne_pas_acquerir then 
			// si utilisateur a pas annulé -> on lance l'export de Planmeca (R)
 			// On recopie l'image du temporaire vers le bon endroit du patient

			//ole_photo.acquis_fichier_photo(image_temporaire,lstr_chemin_radio, ole_photo)
			ole_photo.acquis_fichier_photo(image_temporaire,lstr_chemin_radio)
			
			// On va surcharger la date de la radio car pas forcémenent la date du jour
			date v_date_radio
			v_date_radio = date(dw_radios.getItemDateTime(dw_radios.getrow(),"date"))
			ole_photo.image_info_persist_set(var_code_local, lstr_chemin_radio, v_date_radio)
			
			MessageBox("INFORMATION","L'acquisition a été réalisée !")
	
		end if
		
		
		// Mémorisation de l'info des filtres dans le INI pour la prochaine fois
		// Case à cocher des filtres
		if cbx_filtres.checked then
			SetProfilestring(dir_ini+inifile_orthokis,"PLANMECA","acquerir_filtres","O")
		else
			SetProfilestring(dir_ini+inifile_orthokis,"PLANMECA","acquerir_filtres","N")
		end if

		
		// fermeture fenêtre
		close(parent)
		
	end if	
	

end event

type pb_1 from uo_picturebutton_390x120_fermer within w_import_photos_planmeca
integer x = 2286
integer y = 1448
integer width = 439
integer height = 152
integer taborder = 40
end type

type ole_photo from gearbox within w_import_photos_planmeca
boolean visible = true
integer x = 1399
integer y = 24
integer width = 1518
integer height = 1244
integer taborder = 40
borderstyle borderstyle = styleraised!
integer mode_ocx = 1
end type

event click;//
end event

event mousedown;//
end event

event mousemove;//
end event

on ole_photo.destroy
call gearbox::destroy
end on

type dw_radios from u_basedw within w_import_photos_planmeca
integer x = 27
integer y = 480
integer width = 1262
integer height = 1128
integer taborder = 30
boolean titlebar = true
string dataobject = "dw_planmeca_import_photos"
end type

event clicked;call super::clicked;if row > 0 then
	previsualisation(this.getitemnumber(row,"index"))
end if
end event

type st_3 from statictext within w_import_photos_planmeca
integer x = 110
integer y = 312
integer width = 466
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Date de Naissance :"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_2 from statictext within w_import_photos_planmeca
integer x = 110
integer y = 216
integer width = 466
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Numéro de Dossier :"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_1 from statictext within w_import_photos_planmeca
integer x = 110
integer y = 120
integer width = 192
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 79741120
string text = "Patient :"
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_pwo_naissance from statictext within w_import_photos_planmeca
integer x = 603
integer y = 312
integer width = 631
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_pwo_num_dossier from statictext within w_import_photos_planmeca
integer x = 603
integer y = 216
integer width = 631
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type st_pwo_patient from statictext within w_import_photos_planmeca
integer x = 302
integer y = 120
integer width = 933
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
alignment alignment = center!
boolean border = true
borderstyle borderstyle = stylelowered!
boolean focusrectangle = false
end type

type gb_pwo from groupbox within w_import_photos_planmeca
integer x = 27
integer y = 24
integer width = 1262
integer height = 432
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informations ORTHOkis"
end type

