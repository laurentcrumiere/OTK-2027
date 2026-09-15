$PBExportHeader$w_import_photos_myray.srw
forward
global type w_import_photos_myray from window
end type
type lb_fichiers from listbox within w_import_photos_myray
end type
type cb_acquis from uo_picturebutton_780x120 within w_import_photos_myray
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_import_photos_myray
end type
type ole_photo from gearbox within w_import_photos_myray
end type
type dw_radios from u_basedw within w_import_photos_myray
end type
type st_3 from statictext within w_import_photos_myray
end type
type st_2 from statictext within w_import_photos_myray
end type
type st_1 from statictext within w_import_photos_myray
end type
type st_pwo_naissance from statictext within w_import_photos_myray
end type
type st_pwo_num_dossier from statictext within w_import_photos_myray
end type
type st_pwo_patient from statictext within w_import_photos_myray
end type
type gb_pwo from groupbox within w_import_photos_myray
end type
end forward

global type w_import_photos_myray from window
integer width = 2990
integer height = 1768
boolean titlebar = true
string title = "Lien MyRay(R) : Acquisition d~'une radio"
windowtype windowtype = response!
long backcolor = 16777215
lb_fichiers lb_fichiers
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
global w_import_photos_myray w_import_photos_myray

type variables
long					var_code_local
double 				var_numero_dossier_local
string					var_nom_radio_export

string				istr_nom_patient
string				istr_prenom_patient


lien_myray	uo_myray

// Image temporaire
string image_temporaire


// Ole passé en paramètre
struct_acquis_photo	lstruct_acquis


string libelle_logiciel


string v_rep_radios_patient

end variables

forward prototypes
public subroutine recherche_infos_patient_pwo ()
public subroutine previsualisation (integer ligne)
end prototypes

public subroutine recherche_infos_patient_pwo ();//// fx qui récup les infos du patients ds la base de pwo
//// et les affiche ds les bonnes zones
//
//string	lstr_pwo_date_naissance
//date		ldate_pwo_date_naissance
//
//
//// recup ds base
//select	nom, prenom, date_naissance, numero_dossier
//into		:istr_nom_patient, :istr_prenom_patient, :ldate_pwo_date_naissance, :var_numero_dossier_local
//from			patient
//where		code = :var_code_local ;
//
//// si valleurs récup = NULL
//if isnull(istr_nom_patient) then istr_nom_patient = ""
//if isnull(istr_prenom_patient) then istr_prenom_patient = ""
//if isnull(ldate_pwo_date_naissance) then
//	lstr_pwo_date_naissance = " ../../...."
//else
//// la date est bien init -> transfo en string
//	lstr_pwo_date_naissance = string(ldate_pwo_date_naissance)
//end if
//
//// affiche ds les bonnes zones
//st_pwo_patient.text		= istr_nom_patient + space(1) + istr_prenom_patient
//st_pwo_num_dossier.text	= string(var_numero_dossier_local)
//st_pwo_naissance.text	= lstr_pwo_date_naissance
end subroutine

public subroutine previsualisation (integer ligne);//Prévisualisation de l'image sélectionné dans la Dw
string v_fichier_radio

// l'image lue est en tiff
//affiche la photo fraichement acquise
ole_photo.rendre_vierge()


v_fichier_radio = v_rep_radios_patient + dw_radios.getitemstring(ligne,"nom")
ole_photo.charger_image( v_fichier_radio)



//affiche la photo fraichement acquise
//ole_photo.rendre_vierge()
///ole_photo.charger_image( image_temporaire)
end subroutine

on w_import_photos_myray.create
this.lb_fichiers=create lb_fichiers
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
this.Control[]={this.lb_fichiers,&
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

on w_import_photos_myray.destroy
destroy(this.lb_fichiers)
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

event open;//
//


backcolor = couleur_fond_fenetre


// Lieu de stockage de l'image temporaire
image_temporaire = dir_ini + 'image_myray_tmp.jpg'


// instanciation obj myray (var d'instance)
uo_myray = create lien_myray


// recup struct passé en param à l'ouverture de la fenêtre
lstruct_acquis = message.PowerObjectParm


// recup les infos de la struct ds des var locales
var_code_local 		= lstruct_acquis.num_dossier_patient
var_nom_radio_export	= lstruct_acquis.ole_photo_name

// Initialisation
uo_myray.init(var_code_local)

// Mise à jour des éléments de la fenetre
st_pwo_patient.text = uo_myray.v_nom+" "+uo_myray.v_prenom
st_pwo_num_dossier.text = string(uo_myray.v_numero_dossier)
st_pwo_naissance.text = string(uo_myray.v_date_naissance)


// pour récupérer les images du patient ...


// Si le logiciel pour faire le lien est NNTBridge 
if upper(gfx_extraire_nom_fichier(uo_myray.v_exe)) = "NNTBRIDGE.EXE" then
	// Pour logiciel NNT
	v_rep_radios_patient = uo_myray.v_rep_radio + uo_myray.v_id+ "\document\"
else
	// pour logiciel RayMage
	v_rep_radios_patient = uo_myray.v_rep_radio + uo_myray.v_id+ "\"
end if

lb_fichiers.dirlist(v_rep_radios_patient + "*.tif" , 0)

// travail sur la list pour alimenter les enregistrements manquant de images_infos 
long tot, i
tot = lb_fichiers.totalitems()

string v_fichier_radio
datetime v_date_fichier_radio

// remplissage de la dw
for i = 1 to tot
	v_fichier_radio = v_rep_radios_patient + lb_fichiers.Text(i)
	v_date_fichier_radio = fxg_get_file_date(v_fichier_radio)

				
	dw_radios.insertrow(0)
	dw_radios.setitem(dw_radios.rowcount(),"nom",  lb_fichiers.Text(i))
	dw_radios.setitem(dw_radios.rowcount(),"date", v_date_fichier_radio)
	
next


if tot > 0 then
	if tot = 1 then
		dw_radios.title = string(tot)+" radio dans la liste"
	else
		dw_radios.title = string(tot)+" radios dans la liste"
	end if
	

		
	// On trie la dw et on se positionne sur la première radio
	dw_radios.sort()
	previsualisation(1)	
	dw_radios.SelectRow(1,True)
	dw_radios.setrow(1)
	
	centrer(this)
	
	
else
	close(w_patience)
	MessageBox("ATTENTION !","Ce patient n'a pas de radio dans MyRay (ou celui-ci n'est pas disponible) !")
	cb_acquis.enabled = false
	centrer(this)
end if



end event

type lb_fichiers from listbox within w_import_photos_myray
boolean visible = false
integer x = 603
integer y = 920
integer width = 480
integer height = 400
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
borderstyle borderstyle = stylelowered!
end type

type cb_acquis from uo_picturebutton_780x120 within w_import_photos_myray
integer x = 1417
integer y = 1448
integer width = 827
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



// il faut sauvegarder l'image prévisualier dans "image_temporaire" en jpeg
ole_photo.image_sauver(image_temporaire)

// on la rechage histoire de ...
ole_photo.charger_image( image_temporaire)


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
			// si utilisateur a pas annulé 
 			// On recopie l'image du temporaire vers le bon endroit du patient

			//ole_photo.acquis_fichier_photo(image_temporaire,lstr_chemin_radio, ole_photo)
			ole_photo.acquis_fichier_photo(image_temporaire,lstr_chemin_radio)
			
			// On va surcharger la date de la radio car pas forcémenent la date du jour
			date v_date_radio
			v_date_radio = date(dw_radios.getItemDateTime(dw_radios.getrow(),"date"))
			ole_photo.image_info_persist_set(var_code_local, lstr_chemin_radio, v_date_radio)
			
			MessageBox("INFORMATION","L'acquisition a été réalisée !")
	
		end if
		
		
		// fermeture fenêtre
		close(parent)
		
	end if	
	

end event

type pb_1 from uo_picturebutton_390x120_fermer within w_import_photos_myray
integer x = 2286
integer y = 1448
integer width = 462
integer height = 152
integer taborder = 40
end type

type ole_photo from gearbox within w_import_photos_myray
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

type dw_radios from u_basedw within w_import_photos_myray
integer x = 27
integer y = 480
integer width = 1262
integer height = 1128
integer taborder = 30
boolean titlebar = true
string dataobject = "dw_myray_import_photos"
end type

event clicked;call super::clicked;if row > 0 then
	previsualisation(row)
end if
end event

type st_3 from statictext within w_import_photos_myray
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

type st_2 from statictext within w_import_photos_myray
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

type st_1 from statictext within w_import_photos_myray
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

type st_pwo_naissance from statictext within w_import_photos_myray
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

type st_pwo_num_dossier from statictext within w_import_photos_myray
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

type st_pwo_patient from statictext within w_import_photos_myray
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

type gb_pwo from groupbox within w_import_photos_myray
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

