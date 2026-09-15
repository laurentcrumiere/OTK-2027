$PBExportHeader$uov_imageeditor_arakis.sru
forward
global type uov_imageeditor_arakis from u_cst_imageeditor
end type
type dw_tri from datawindow within uov_imageeditor_arakis
end type
type uo_image_imprimer from uo_image within uov_imageeditor_arakis
end type
end forward

global type uov_imageeditor_arakis from u_cst_imageeditor
dw_tri dw_tri
uo_image_imprimer uo_image_imprimer
end type
global uov_imageeditor_arakis uov_imageeditor_arakis

type variables
// Orthokis
String s_NextPicture = "Image Suivante"
String s_PrecPicture = "Image Précédente"

String s_Rotation_droite_x = "Rotation 1 degré"
String s_Rotation_gauche_x = "Rotation -1 degré"
String s_Redimensionner = "Redimensionner"
String s_Imprimer = "Imprimer"

// N° de la ligne de dw_tri, dans la fenetre mere , si explorateur 2013 ; servira à la circulation des images
long l_numero_ligne_dw_tri_2013, l_numero_ligne_max

// images suivante/precedente
public constant int i_img_direction_precedente = 1
public constant int i_img_direction_suivante = 2

// Patient 
double db_var_code_local
string s_Patient_nom, s_Patient_prenom


// 1er fichier chargé (uniquement le nom du fichier, sans le chemin)
string s_fichier_initial

// nom complet du fichier en cours dans l'éditeur
string s_nom_fichier_local

// Fenetre conteneur
w_editeur_2022 w_fenetre_conteneur

// Infos pièces jointes mises à jour (pour éviter de le faire plusieurs fois si plusieurs save
boolean b_infos_pieces_jointes_mises_a_jour = false


end variables

forward prototypes
public function integer of_updateui ()
public subroutine of_maj_titre_fenetre ()
public function boolean of_image_circuler (integer direction)
public function integer of_savefile (string as_filename)
public function clsid of_getclsid_arakis (long al_format)
public subroutine of_init_patient (double code_patient, string nom_fichier, window fenetre_mere)
public subroutine of_rotate_x (integer degre)
public subroutine of_imprimer ()
end prototypes

public function integer of_updateui ();Int li_savegroup
Int li_effectsgroup

message l_message

l_message = CREATE Message
l_message.Handle = Message.Handle
l_message.Number = Message.Number
l_message.WordParm = Message.WordParm
l_message.LongParm = Message.LongParm
l_message.DoubleParm = Message.DoubleParm
l_message.StringParm = Message.StringParm
l_message.PowerObjectParm = Message.PowerObjectParm
l_message.Processed = Message.Processed
l_message.ReturnValue = Message.ReturnValue

uo_actions.of_Reset()
uo_tools.of_Reset()
uo_brightness.of_Reset()
uo_cropactions.of_Reset()
uo_zoom.of_Reset()


uo_actions.of_AddItem(LoadFromFileText, "lc_acquisition_image.png")
uo_actions.of_AddItem(CopyText,  "lc_copy.png")
uo_actions.of_AddItem(PasteFromClipboardText, "lc_paste.png")

li_savegroup = uo_actions.of_AddGroup(SaveText, "ACTIONS_enregistrer.png")

// En commentaire pour l'instant car bug 
//uo_actions.of_AddItem(inv_resourcemanager.of_GetString(PrintText), PrintImage)
uo_actions.of_AddItem(s_Imprimer, "ACTIONS_imprimer.png")


uo_actions.of_DisplayText(li_savegroup, FALSE)
uo_actions.of_AssignItemToGroup(li_savegroup,uo_actions.of_AddItem(SaveText, "ACTIONS_enregistrer.png"))
uo_actions.of_AssignItemToGroup(li_savegroup,uo_actions.of_AddItem(SaveAsText, "ACTIONS_enregistrer.png"))
uo_actions.of_AddSeparator()
uo_actions.of_AddItem(UndoText, UndoImage)
uo_actions.of_AddItem(RedoText, RedoImage)
uo_actions.of_AddSeparator()

// 2022 : Navigation
uo_actions.of_AddItem(s_PrecPicture, "Fleche-G.png")
uo_actions.of_AddItem(s_NextPicture, "Fleche-D.png")
uo_actions.of_AddSeparator()


uo_tools.of_AddItem(RotateLeftText, RotateLeftImage)
uo_tools.of_AddItem(RotateRightText, RotateRightImage)
uo_tools.of_AddItem(FlipHorizontalText, FlipHorizontalImage)
uo_tools.of_AddItem(FlipVerticalText, FlipVerticalImage)

uo_actions.of_AddSeparator()

// En commentaire pour l'instant car bug 
//uo_tools.of_AddItem(s_Redimensionner, "imageeditor_resize.png")
uo_tools.of_AddItem(CropText, CropImage)

// 2023 : rotation & degré
uo_tools.of_AddItem(s_Rotation_gauche_x, "imageeditor_rotateleft_x.png")
uo_tools.of_AddItem(s_Rotation_droite_x, "imageeditor_rotateright_x.png")

li_effectsgroup = uo_tools.of_AddGroup(EffectsText, EffectsImage)
uo_tools.of_DisplayText(li_effectsgroup, FALSE)
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(BlackAndWhiteText, BlackAndWhiteImage))
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(BrightnessText, BrightnessImage))
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(ContrastText, ContrastImage))
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(GreyScaleText, GreyScaleImage))
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(InvertColorsText, InvertColorsImage))
uo_tools.of_AssignItemToGroup(li_effectsgroup, uo_tools.of_AddItem(SepiaText, SepiaImage))


uo_tools.Width = uo_tools.Width - (24 * 6)

uo_cropactions.of_AddItem(AcceptText, AcceptImage)
uo_cropactions.of_AddItem(CancelText, CancelImage)


uo_brightness.of_AddObject("", htb_brightness)
uo_brightness.of_AddItem(AcceptText, AcceptImage)
uo_brightness.of_AddItem(CancelText, CancelImage)

uo_zoom.of_AddObject(AutoFitText, uo_autofit)
uo_zoom.of_AddItem(ZoomOutText, ZoomOutImage)
uo_zoom.of_AddObject("", htb_zoom)
uo_zoom.of_AddItem(ZoomInText, ZoomInImage)
uo_zoom.of_AddObject("", st_zoom)


	
Message.Handle = l_message.Handle
Message.Number = l_message.Number
Message.WordParm = l_message.WordParm
Message.LongParm = l_message.LongParm
Message.DoubleParm = l_message.DoubleParm
Message.StringParm = l_message.StringParm
Message.PowerObjectParm = l_message.PowerObjectParm
Message.Processed = l_message.Processed
Message.ReturnValue = l_message.ReturnValue


RETURN 1
end function

public subroutine of_maj_titre_fenetre ();// on rajoute la description  à la barre de titre
	
string v_fichier
date date_image
long  code_type_image, code_temps_traitement

string libelle_type_image, libelle_temps_traitement

v_fichier = gfx_extraire_nom_fichier (s_nom_fichier_local)

select type_image, temps_traitement, date_acquis into  :code_type_image, :code_temps_traitement , :date_image
from images_infos where code = :db_var_code_local and nom_fichier = :v_fichier ;
	

if code_type_image > 0 then
	select isnull(libelle,'') into  :libelle_type_image from type_image where id = :code_type_image ;
else
	libelle_type_image = ""
end if

if code_temps_traitement > 0 then
	select isnull(libelle,'') into  :libelle_temps_traitement from temps_traitement where id = :code_temps_traitement ;
else
	libelle_temps_traitement = ""
end if

w_fenetre_conteneur.title = libelle_type_image + " - "+ libelle_temps_traitement + " - "+string(date_image)


w_fenetre_conteneur.title = w_fenetre_conteneur.title + " - " + s_Patient_nom + " "+ s_Patient_prenom

date v_date_naissance
select date_naissance into :v_date_naissance from patient where code = :db_var_code_local ;

if not isnull(v_date_naissance) then
	w_fenetre_conteneur.title = w_fenetre_conteneur.title +  " - ("+ calcul_age_a_une_date(v_date_naissance,date_image) + ")"
end if

end subroutine

public function boolean of_image_circuler (integer direction);// passe d'une image à une autre
// param direction : cf les constantes d'instances "img_direction_"
// renvoie true si ok

boolean val_retour = false

if not direction > 0 then return val_retour

if not imagerie_2013  then return val_retour

// maj de la position courante ds le tab_nom_cadre[]
choose case direction
	case i_img_direction_precedente
		if l_numero_ligne_dw_tri_2013 > 1 then
			l_numero_ligne_dw_tri_2013 = l_numero_ligne_dw_tri_2013 - 1
		end if
	case i_img_direction_suivante
		if l_numero_ligne_dw_tri_2013 < l_numero_ligne_max then
			l_numero_ligne_dw_tri_2013 = l_numero_ligne_dw_tri_2013 + 1
		end if
		
	case else
		return val_retour
end choose

s_nom_fichier_local = dir_photos + string(db_var_code_local) + win_delimiter + dw_tri.getitemString(l_numero_ligne_dw_tri_2013, "nom_fichier")
of_loadfromfile (s_nom_fichier_local )

val_retour = true

of_maj_titre_fenetre()

return val_retour
end function

public function integer of_savefile (string as_filename);
ULong ll_null 
clsid l_clsid

is_fullname = as_filename

IF Len(Trim(is_fullname)) = 0 THEN
	RETURN of_SaveAsFile()
END IF


SetNull(ll_null)

CHOOSE CASE Upper(Right(is_fullname, 3))
	CASE "PNG"
		l_clsid = of_getclsid_arakis(PNG2)
	CASE "JPG"
		l_clsid = of_getclsid_arakis(JPG2)
	CASE "BMP"
		l_clsid = of_getclsid_arakis(BMP2)
	CASE "GIF"
		l_clsid = of_getclsid_arakis(GIF2)
END CHOOSE

int li_return

li_return = inv_win32.GdipSaveImageToFile(hBitMap, is_fullname, l_clsid, ll_null) 

// On refait la vignette
faire_vignette(s_nom_fichier_local, construire_nom_fichier_vignette(s_nom_fichier_local) , db_var_code_local)

// Mse à jour des infos de prièces jointes si besoin
if not b_infos_pieces_jointes_mises_a_jour then
	fxg_modification_pieces_jointes(db_var_code_local, gfx_extraire_nom_fichier(s_nom_fichier_local), "Fichier modifié le " + string(today()))
	b_infos_pieces_jointes_mises_a_jour = true
end if

Event SaveComplete(is_fullname, li_return)

RETURN li_return




end function

public function clsid of_getclsid_arakis (long al_format);String ls_encoding
ULong ll_encodercount, ll_encodersize
clsid a_classid
String ls_type
Long ll_index, ll_count
ULong ll_encoding

CHOOSE CASE al_format
	CASE PNG2
		ls_encoding = "image/png"
		ll_encoding = 1434252294
	CASE BMP2
		ls_encoding = "image/bmp"
		ll_encoding = 1434252288
	CASE JPG2
		ls_encoding = "image/jpeg"
		ll_encoding = 1434252289
	CASE GIF2
		ls_encoding = "image/gif"
		ll_encoding = 1434252290
END CHOOSE

a_classid.Data1 = ll_encoding
a_classid.Data2 = 6660
a_classid.Data3 = 4563
a_classid.Data4[1] = 154
a_classid.Data4[2] = 115
a_classid.Data4[3] = 0
a_classid.Data4[4] = 0
a_classid.Data4[5] = 248
a_classid.Data4[6] = 30
a_classid.Data4[7] = 243
a_classid.Data4[8] = 46

RETURN a_classid

end function

public subroutine of_init_patient (double code_patient, string nom_fichier, window fenetre_mere);long lig, tot

db_var_code_local = code_patient
s_fichier_initial = nom_fichier
w_fenetre_conteneur = fenetre_mere


select isnull(nom,''), isnull(prenom, '') into :s_patient_nom, :s_patient_prenom from patient where code = :db_var_code_local ;


// On construit dw_tri qui nous servira ensuite à naviguer
dw_tri.reset()


if isvalid(w_fenetre_conteneur.w_fenetre_explorateur_2013) then 
	// Appel depuis l'explorateur 2013 => on reprend le tris 

	// ouverture depuis l'explorateur 2013
	
	// on recopie le liste déjà triée de la fenêtre mère
	tot = w_fenetre_conteneur.w_fenetre_explorateur_2013.dw_tri.RowCount()
	
	for lig = 1 to tot
		dw_tri.insertrow(0)
		dw_tri.setitem(lig,"nom_fichier", w_fenetre_conteneur.w_fenetre_explorateur_2013.dw_tri.GetItemString(lig, "nom_fichier"))
		dw_tri.setitem(lig,"ordre_temps_traitement", w_fenetre_conteneur.w_fenetre_explorateur_2013.dw_tri.GetItemString(lig, "ordre_temps_traitement"))
		dw_tri.setitem(lig,"ordre_type_image", w_fenetre_conteneur.w_fenetre_explorateur_2013.dw_tri.GetItemString(lig, "ordre_type_image"))
		dw_tri.setitem(lig,"date_acquis", w_fenetre_conteneur.w_fenetre_explorateur_2013.dw_tri.GetItemDate(lig, "date_acquis"))		  
	next

else
	// Appel depuis ?
	// Tri par ordre chrono +  type_image
	
	string v_nom_fichier
	long v_ordre_type_image, v_ordre_temps_traitement
	date v_date_acquis 
	
	DECLARE cur cursor for SELECT nom_fichier , date_acquis,  (select temps_traitement.ordre_trie from temps_traitement where temps_traitement.id = images_infos.temps_traitement) , 
	(select type_image.ordre_trie from type_image where type_image.id = images_infos.type_image) 
	from images_infos 
	Where code = :db_var_code_local order by date_acquis ;
	
	open cur ;
	
	fetch cur into :v_nom_fichier, :v_date_acquis, :v_ordre_temps_traitement, :v_ordre_type_image  ;
	
	do while sqlca.sqlcode = 0
		
		lig = dw_tri.insertrow(0)
		dw_tri.setitem(lig,"nom_fichier", v_nom_fichier)
		dw_tri.setitem(lig,"ordre_temps_traitement", v_ordre_temps_traitement)
		dw_tri.setitem(lig,"ordre_type_image", v_ordre_type_image)
		dw_tri.setitem(lig,"date_acquis", v_date_acquis)
		
		fetch cur into :v_nom_fichier, :v_date_acquis,  :v_ordre_temps_traitement, :v_ordre_type_image  ;
	loop
	
	close cur ;
	
	dw_tri.SetSort ("date_acquis asc, ordre_type_image asc, ordre_temps_traitement asc, nom_fichier asc")
	dw_tri.Sort()

end if


l_numero_ligne_dw_tri_2013 = dw_tri.Find("nom_fichier = '"+ s_fichier_initial +"'", 0, 99999)
l_numero_ligne_max = dw_tri.rowcount()
s_nom_fichier_local = dir_photos + string(db_var_code_local) + win_delimiter + s_fichier_initial

of_maj_titre_fenetre()

end subroutine

public subroutine of_rotate_x (integer degre);// On se sert de la gearBox car pas de fonction dans l'éditeur
w_mdi_2020.uo_gearbox.charger_image( s_nom_fichier_local )
w_mdi_2020.uo_gearbox.traitement_rotation( degre )
w_mdi_2020.uo_gearbox.traitement_sauvegarder( s_nom_fichier_local ) 

of_loadfromfile (s_nom_fichier_local )

// On refait la vignette
faire_vignette(s_nom_fichier_local, construire_nom_fichier_vignette(s_nom_fichier_local) , db_var_code_local)

// Important : on ne pourra pas annuler l'action ! hormis restaurer l'image originale
end subroutine

public subroutine of_imprimer ();
uo_image_imprimer.var_code_local  = db_var_code_local
uo_image_imprimer.nom_fichier_complet = s_nom_fichier_local
// pour initilisation hauteur / largeur
uo_image_imprimer.charger_image_libre(uo_image_imprimer.nom_fichier_complet)
openWithParm(w_imprimer_image, uo_image_imprimer)
end subroutine

on uov_imageeditor_arakis.create
int iCurrent
call super::create
this.dw_tri=create dw_tri
this.uo_image_imprimer=create uo_image_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_tri
this.Control[iCurrent+2]=this.uo_image_imprimer
end on

on uov_imageeditor_arakis.destroy
call super::destroy
destroy(this.dw_tri)
destroy(this.uo_image_imprimer)
end on

type htb_brightness from u_cst_imageeditor`htb_brightness within uov_imageeditor_arakis
end type

type htb_zoom from u_cst_imageeditor`htb_zoom within uov_imageeditor_arakis
end type

type st_zoom from u_cst_imageeditor`st_zoom within uov_imageeditor_arakis
end type

type uo_autofit from u_cst_imageeditor`uo_autofit within uov_imageeditor_arakis
end type

type uo_brightness from u_cst_imageeditor`uo_brightness within uov_imageeditor_arakis
end type

type uo_tools from u_cst_imageeditor`uo_tools within uov_imageeditor_arakis
end type

event uo_tools::ue_buttonclicked;call super::ue_buttonclicked;CHOOSE CASE as_button
	CASE s_Rotation_gauche_x
		of_rotate_x(-1)
	CASE s_Rotation_droite_x
		of_rotate_x(1)
END CHOOSE
end event

type uo_actions from u_cst_imageeditor`uo_actions within uov_imageeditor_arakis
end type

event uo_actions::ue_buttonclicked;call super::ue_buttonclicked;

CHOOSE CASE as_button
	CASE UndoText
		of_Undo()
	CASE RedoText
		of_Redo()
	CASE SaveText
		of_SaveFile(is_fullname)
	CASE SaveAsText
		of_SaveAsFile()
	CASE LoadFromFileText
		String ls_fullname, ls_filename
		int   li_fileid
		
		if GetFileOpenName ("Open", ls_fullname, ls_filename, &
			"png", "Image Files  (*.png;*.bmp;*.gif;*.jpg;*.jpeg),*.png;*.bmp;*.gif;*.jpg;*.jpeg, All Files, *.*", &
			"", 8194) < 1 then return
		
		of_LoadFromFile(ls_fullname)
	CASE PasteFromClipboardText
		of_LoadFromClipboard()

	// Spécial Orthokis
	Case s_NextPicture 
		of_image_circuler(i_img_direction_suivante)
	CAse s_PrecPicture 
		of_image_circuler(i_img_direction_precedente)
	CAse s_Imprimer 
		of_imprimer()
		
		
END CHOOSE

end event

type uo_1 from u_cst_imageeditor`uo_1 within uov_imageeditor_arakis
end type

type uo_cropactions from u_cst_imageeditor`uo_cropactions within uov_imageeditor_arakis
end type

type uo_zoom from u_cst_imageeditor`uo_zoom within uov_imageeditor_arakis
end type

type r_bottom from u_cst_imageeditor`r_bottom within uov_imageeditor_arakis
end type

type r_top from u_cst_imageeditor`r_top within uov_imageeditor_arakis
end type

type st_uspb_imageeditor from u_cst_imageeditor`st_uspb_imageeditor within uov_imageeditor_arakis
end type

type dw_tri from datawindow within uov_imageeditor_arakis
boolean visible = false
integer x = 549
integer y = 200
integer width = 2034
integer height = 1856
integer taborder = 30
string title = "none"
string dataobject = "dw_expl_media_tri_date_2013"
boolean hscrollbar = true
boolean vscrollbar = true
boolean hsplitscroll = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_image_imprimer from uo_image within uov_imageeditor_arakis
string tag = "uniquement pour imprimer"
boolean visible = false
integer x = 1294
integer y = 108
integer taborder = 30
boolean bringtotop = true
end type

on uo_image_imprimer.destroy
call uo_image::destroy
end on

