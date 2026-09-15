$PBExportHeader$w_acquisitions_multiples_twain.srw
forward
global type w_acquisitions_multiples_twain from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_780x120 within w_acquisitions_multiples_twain
end type
type lb_1 from listbox within w_acquisitions_multiples_twain
end type
type st_1 from statictext within w_acquisitions_multiples_twain
end type
type ddlb_debut from dropdownlistbox within w_acquisitions_multiples_twain
end type
type ole_gearbox from gearbox within w_acquisitions_multiples_twain
end type
type pb_autre from uo_picturebutton_780x120 within w_acquisitions_multiples_twain
end type
type dw_temps_traitement_cherche from datawindow within w_acquisitions_multiples_twain
end type
type st_type_image from statictext within w_acquisitions_multiples_twain
end type
type dw_type_image from datawindow within w_acquisitions_multiples_twain
end type
type cb_matos from picturebutton within w_acquisitions_multiples_twain
end type
type cb_rafale from picturebutton within w_acquisitions_multiples_twain
end type
end forward

global type w_acquisitions_multiples_twain from w_fenetre_arakis
integer x = 101
integer y = 200
integer width = 2030
integer height = 924
string title = "Acquisitions TWAIN"
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_fermer cb_fermer
lb_1 lb_1
st_1 st_1
ddlb_debut ddlb_debut
ole_gearbox ole_gearbox
pb_autre pb_autre
dw_temps_traitement_cherche dw_temps_traitement_cherche
st_type_image st_type_image
dw_type_image dw_type_image
cb_matos cb_matos
cb_rafale cb_rafale
end type
global w_acquisitions_multiples_twain w_acquisitions_multiples_twain

type variables
double	var_code_local
//boolean	modif
int		num_depart
//string	true_nom_fichier
string	CheminDossier
string	Chemin_temp
string	a_copier[]
string	num_photo[]
security_attributes sa



str_patient v_patient
end variables

forward prototypes
public function integer temp_vers_photo ()
public subroutine init_titre ()
public subroutine initialisation ()
end prototypes

public function integer temp_vers_photo ();string	s						//pour stockage provisoire du "ddlb_debut.text"
long		max_elem				//nbr max d'élém du tableau "a_copier"
double	valeur_retour		//valeur retournée par la fenètre "w_question_remplacement" (1=oui,2=non,3=oui pour tous)
long		i						//compteur de boucle
string	description			//stock la description du cadre photo
boolean	lb_operation_annulee
string	lstr_tab_photo_non_ecrasee[]
int		j
string	lstr_msg


//crée si besoin le rep "num_patient" ds rep "photos" d'ORTHOkis
if not fxg_FileExists(chemindossier) then CreateDirectoryA(chemindossier,sa)

//recup le nbr max d'élém du tableau "a_copier"
max_elem = upperbound(a_copier[])

//initialisation de "valeur_retour" à 1
valeur_retour = 1

//boucle sur chacun des fichiers
for i = 1 to max_elem
	//pose question ecrasement fichier uniquement si besoin, cad valeur_retour <> 3
	if valeur_retour <> 3 and fxg_FileExists(chemindossier + a_copier[i]) then
		description = profilestring(dir_photos + inifile_photo,&
								section,	"ole_nom_photo" + num_photo[i],"")
		openwithparm(w_question_remplacement,description)
		//on récup la valeur retourné par la fenètre "w_question_remplacement" (1=oui,2=non,3=oui pour tous)
		valeur_retour = message.doubleparm
	end if

choose case valeur_retour
	case 1,3
	//copie du fichier
		FileCopy(chemin_temp + a_copier[i], chemindossier + a_copier[i], false)
	case 2
	// l'utilisateur n'a pas souhaiter écraser la photo déjà présente sur ce cadre
		lb_operation_annulee = true
		j++
		lstr_tab_photo_non_ecrasee[j] = description
end choose
next

//utile pour effacer les fichiers sauvegarder d'office par l'interface
gfx_suppr_rep(lb_1, chemin_temp)

// corp du msg à afficher
lstr_msg = "Opération terminée avec succés !"

if lb_operation_annulee then
// au moins une des photos n'a pas été acquis par choix de l'utilisateur
	
	lstr_msg += "~n~nCependant, afin de ne pas écraser les fichiers déjà présents, ~nvous avez annulé l'acquisition pour les cadres suivants : ~n"
	
	for j = 1 to upperbound(lstr_tab_photo_non_ecrasee)
		lstr_msg += "~n    * " + lstr_tab_photo_non_ecrasee[j]
	next
end if

messagebox("INFORMATION", lstr_msg)


return 1
end function

public subroutine init_titre ();string vn,vp
double vnd

select nom, prenom, numero_dossier INTO :vn,:vp, :vnd FROM patient WHERE code = :var_code_local ;

if isnull(vn) then
	vn = ""
end if
if isnull(vp) then
	vp = ""
end if


this.title = "Acquisitions Twain : " + trim(vn) + " " + trim(vp) +" - N°"+ string(vnd)

end subroutine

public subroutine initialisation ();// construction path du rep photo du patient
//chemindossier = dir_photos + string(var_code_local) + win_delimiter

// construction path du rep temp
chemin_temp = info_registre.rep_temp + "Tmp_" + string(var_code_local) //+ win_delimiter

//initialise le titre de la window avec nom, prenom patient
init_titre()

//h.chp()	//vérif la présence de la clef HASP

//va dans le PwoPhoto.ini pour charger correctement la ddlb
LoadDdlbPhoto ( ddlb_debut , string ( var_code_local ) )


end subroutine

on w_acquisitions_multiples_twain.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.lb_1=create lb_1
this.st_1=create st_1
this.ddlb_debut=create ddlb_debut
this.ole_gearbox=create ole_gearbox
this.pb_autre=create pb_autre
this.dw_temps_traitement_cherche=create dw_temps_traitement_cherche
this.st_type_image=create st_type_image
this.dw_type_image=create dw_type_image
this.cb_matos=create cb_matos
this.cb_rafale=create cb_rafale
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.lb_1
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.ddlb_debut
this.Control[iCurrent+5]=this.ole_gearbox
this.Control[iCurrent+6]=this.pb_autre
this.Control[iCurrent+7]=this.dw_temps_traitement_cherche
this.Control[iCurrent+8]=this.st_type_image
this.Control[iCurrent+9]=this.dw_type_image
this.Control[iCurrent+10]=this.cb_matos
this.Control[iCurrent+11]=this.cb_rafale
end on

on w_acquisitions_multiples_twain.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.lb_1)
destroy(this.st_1)
destroy(this.ddlb_debut)
destroy(this.ole_gearbox)
destroy(this.pb_autre)
destroy(this.dw_temps_traitement_cherche)
destroy(this.st_type_image)
destroy(this.dw_type_image)
destroy(this.cb_matos)
destroy(this.cb_rafale)
end on

event open;call super::open;

// En entrée on reçoit une structure (en instance) avec
// - le code du patient
// - qui appelle :  M = le menu (possibilité de boucler sur le patient), E = l'explorateur pour acquisition fichiers, S = L'explorateur pour acquisition script

v_patient =  message.PowerObjectparm

var_code_local = v_patient.code

if v_patient.appelant = 'E' or  v_patient.appelant = 'S'  then
	pb_autre.visible = false
	if  v_patient.appelant = 'S'   then
		this.title = "Acquisitions TWAIN avec script"
	end if
end if



if imagerie_2013 then
	//st_1.text = "Etape de traitement :"
	ddlb_debut.visible = false
	st_1.visible = false
	
	dw_temps_traitement_cherche.SetTransobject(sqlca)
	dw_temps_traitement_cherche.retrieve()
	
	dw_type_image.SetTransobject(sqlca)
	dw_type_image.retrieve()

	if dw_type_image.rowcount() = 0 then
		Messagebox("ATTENTION","Vous devez d'abord définir des types d'images avant de faire des acquisitions (menu 'Outils, 'Paramètres imagerie').")
		close (this)
		return
	end if
	
//	dw_type_image.visible = true
//	st_type_image.visible = true
//	dw_temps_traitement_cherche.visible = true
	
	// temps de traitement par défaut
	long v_temps_defaut
	v_temps_defaut = proposition_temps_traitement(var_code_local)
	if dw_temps_traitement_cherche.rowcount() > 0 then
		dw_temps_traitement_cherche.setItem(1, "id", v_temps_defaut)
	else
		Messagebox("ATTENTION","Vous devez d'abord définir des étapes des traitement avant de faire des acquisitions (menu 'Outils, 'Paramètres imagerie'.")
		close (this)
		return
	end if
	
	cb_fermer.y = 356
	pb_autre.y = cb_fermer.y
	cb_matos.y = 32
	cb_rafale.y = cb_matos.y 
	this.height = 700
end if

initialisation()


// centrage de la sheet
//centrer_sheet(this,w_mdi)
end event

event close;call super::close;SetCurrentDirectoryA( dir_ini )
end event

type p_fond from w_fenetre_arakis`p_fond within w_acquisitions_multiples_twain
end type

type cb_fermer from uo_picturebutton_780x120 within w_acquisitions_multiples_twain
integer x = 942
integer y = 628
integer width = 590
integer taborder = 40
string text = "&Fermer"
boolean default = true
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)
end event

type lb_1 from listbox within w_acquisitions_multiples_twain
boolean visible = false
integer x = 805
integer y = 208
integer width = 480
integer height = 400
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_acquisitions_multiples_twain
integer x = 27
integer y = 32
integer width = 1289
integer height = 72
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Cadre de départ pour l~'importation :"
end type

type ddlb_debut from dropdownlistbox within w_acquisitions_multiples_twain
integer x = 27
integer y = 104
integer width = 1947
integer height = 688
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

type ole_gearbox from gearbox within w_acquisitions_multiples_twain
integer x = 219
integer y = 48
integer width = 549
integer height = 424
end type

on ole_gearbox.destroy
call gearbox::destroy
end on

type pb_autre from uo_picturebutton_780x120 within w_acquisitions_multiples_twain
integer x = 283
integer y = 628
integer width = 590
integer taborder = 70
boolean bringtotop = true
string text = "A&utre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;
guo_fenetre_modale.wf_ouvrir(w_cherche)

if var_suite then
	var_code_local = var_code
	initialisation()
end if


end event

type dw_temps_traitement_cherche from datawindow within w_acquisitions_multiples_twain
string tag = "no resize all"
boolean visible = false
integer x = 32
integer y = 112
integer width = 1125
integer height = 72
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_temps_traitement_cherche"
boolean border = false
boolean livescroll = true
end type

type st_type_image from statictext within w_acquisitions_multiples_twain
boolean visible = false
integer x = 27
integer y = 216
integer width = 987
integer height = 72
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Type d~'image :"
end type

type dw_type_image from datawindow within w_acquisitions_multiples_twain
string tag = "no resize all"
boolean visible = false
integer x = 32
integer y = 300
integer width = 1298
integer height = 84
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_type_image_cherche"
boolean border = false
boolean livescroll = true
end type

type cb_matos from picturebutton within w_acquisitions_multiples_twain
integer x = 411
integer y = 328
integer width = 329
integer height = 272
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_scanner_source.png"
alignment htextalign = left!
string powertiptext = "Paramétrage de la source TWAIN"
end type

event clicked;ole_gearbox.selec_source_twain( )
end event

type cb_rafale from picturebutton within w_acquisitions_multiples_twain
integer x = 1070
integer y = 328
integer width = 329
integer height = 272
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_scanner_multiples.png"
alignment htextalign = left!
string powertiptext = "Acquisition TWAIN de un ou plusieurs documents"
end type

event clicked;//string	chemin_acquis


//on désactive les boutons....
this.enabled = false
cb_fermer.enabled = false
cb_matos.enabled = false
ddlb_debut.enabled = false


chemin_temp = dir_ini + "temp\"

//crée un fichier temp ds rep "TEMP" de window
//if not fxg_FileExists(chemin_temp) then CreateDirectoryA(chemin_temp,sa)



long 	v_temps_traitement , v_type_image

if imagerie_2013 then
	v_temps_traitement = dw_temps_traitement_cherche.GetItemNumber(1, "id")
	v_type_image = dw_type_image.GetItemNumber(1, "id")
end if


// onb lance le scrip d'acquisition
ole_gearbox.importer_multiples_images_twain(lb_1, ddlb_debut, chemin_temp, var_code_local, v_temps_traitement, v_type_image, v_patient.appelant)

if v_patient.appelant = "E" or  v_patient.appelant = "S" then
	close (parent)
else
	
	//on réactive les boutons....
	ddlb_debut.enabled = true 
	cb_matos.enabled = true 
	cb_fermer.enabled ( true )
	this.enabled = true
end if

end event

