$PBExportHeader$w_url_parametrage.srw
forward
global type w_url_parametrage from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_url_parametrage
end type
type st_1 from statictext within w_url_parametrage
end type
type ole_previsu from gearbox within w_url_parametrage
end type
type sle_url from singlelineedit within w_url_parametrage
end type
type cb_2 from uo_picturebutton_780x120 within w_url_parametrage
end type
type st_2 from statictext within w_url_parametrage
end type
type sle_icone_url from singlelineedit within w_url_parametrage
end type
type pb_choix_rep_courant from picturebutton within w_url_parametrage
end type
end forward

global type w_url_parametrage from w_fenetre_arakis
integer width = 4041
integer height = 1056
string title = "Paramétrage du lien personnalisé"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
st_1 st_1
ole_previsu ole_previsu
sle_url sle_url
cb_2 cb_2
st_2 st_2
sle_icone_url sle_icone_url
pb_choix_rep_courant pb_choix_rep_courant
end type
global w_url_parametrage w_url_parametrage

type variables
double var_code_local
string s_url, s_icone_url, s_icone_url_path_complet

string s_biblio_icones_url
string s_numero_url

end variables

on w_url_parametrage.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.st_1=create st_1
this.ole_previsu=create ole_previsu
this.sle_url=create sle_url
this.cb_2=create cb_2
this.st_2=create st_2
this.sle_icone_url=create sle_icone_url
this.pb_choix_rep_courant=create pb_choix_rep_courant
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.ole_previsu
this.Control[iCurrent+4]=this.sle_url
this.Control[iCurrent+5]=this.cb_2
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.sle_icone_url
this.Control[iCurrent+8]=this.pb_choix_rep_courant
end on

on w_url_parametrage.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.st_1)
destroy(this.ole_previsu)
destroy(this.sle_url)
destroy(this.cb_2)
destroy(this.st_2)
destroy(this.sle_icone_url)
destroy(this.pb_choix_rep_courant)
end on

event open;call super::open;

// recherche de l'icone et de l'url en base de données
var_code_local = message.DoubleParm

// Numero de l'url
s_numero_url = param_win[1]

choose case s_numero_url
	case "1" 
		select trim(isnull(url1, '')), trim(isnull(icone_url1, '')) into :s_url, :s_icone_url  
		from patient 
		where code = :var_code_local ;
	case "2"
		select trim(isnull(url2, '')), trim(isnull(icone_url2, '')) into :s_url, :s_icone_url  
		from patient 
		where code = :var_code_local ;
end choose

title = title + " N°" + s_numero_url

sle_url.text = s_url


if s_icone_url <> "" then 
	// Le fichier image est dans le dossier photo du patient
	s_icone_url_path_complet = dir_photos + string(var_code_local) + win_delimiter + s_icone_url
	if fileExists(s_icone_url_path_complet) then
		ole_previsu.charger_image(s_icone_url_path_complet)
	else
		s_icone_url = ""
		ole_previsu.rendre_vierge_que_image()
	end if
end if

sle_icone_url.text = s_icone_url

//Bibliothèque des icines
// On copie le fichier aussi dans une bibliothèque dir_photos\icones_url .. pour présenter par défaut
s_biblio_icones_url = dir_photos + "icones_url\"




end event

type p_fond from w_fenetre_arakis`p_fond within w_url_parametrage
end type

type cb_annuler from uo_picturebutton_390x120 within w_url_parametrage
integer x = 265
integer y = 732
integer width = 960
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;

close(parent)
end event

type st_1 from statictext within w_url_parametrage
integer x = 50
integer y = 60
integer width = 206
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Lien :"
alignment alignment = right!
boolean focusrectangle = false
end type

type ole_previsu from gearbox within w_url_parametrage
boolean visible = true
integer x = 2597
integer y = 200
integer width = 590
integer height = 464
integer taborder = 10
boolean bringtotop = true
integer mode_ocx = 1
end type

on ole_previsu.destroy
call gearbox::destroy
end on

type sle_url from singlelineedit within w_url_parametrage
integer x = 334
integer y = 48
integer width = 3584
integer height = 112
integer taborder = 10
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

type cb_2 from uo_picturebutton_780x120 within w_url_parametrage
integer x = 1317
integer y = 732
integer width = 960
integer taborder = 30
boolean bringtotop = true
string text = "Enregistrer et Fermer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;
// Mémorisation des infos en BD et mise en place du fichier image

s_url = trim(sle_url.text )
s_icone_url = trim(sle_icone_url.text )

string S_NOM_FICHIER_ICONE_URL

// le nom du fichier pour stocket les URL est différents
choose case s_numero_url
	case "1"
		S_NOM_FICHIER_ICONE_URL = NOM_FICHIER_ICONE_URL1
	case "2"
		S_NOM_FICHIER_ICONE_URL = NOM_FICHIER_ICONE_URL2
end choose

if s_icone_url <> S_NOM_FICHIER_ICONE_URL and s_icone_url <> "" then
	// C'est un nouveau fichier qu'il faut copier dans le dossier image du patient
	
	// Fichier de destination 
	string s_dossier_patient
	s_dossier_patient = dir_photos + string(var_code_local) + win_delimiter 
	s_icone_url_path_complet = s_dossier_patient + S_NOM_FICHIER_ICONE_URL
	
	// Si le dossier photos du patient n'est pas encore créé
	if not directoryExists(s_dossier_patient) then
		CreateDirectory(s_dossier_patient)
	end if
	
	// Copie du fichier ...
	If FileCopy (s_icone_url, s_icone_url_path_complet, true ) = 1 then
		// La copie est OK ... 
		s_icone_url = S_NOM_FICHIER_ICONE_URL
		
		// On copie le fichier aussi dans une bibliothèque dir_photos\icones_url .. pour présenter par défaut
		if not directoryExists(s_biblio_icones_url) then
			// on ne crée la directory qu'au 1er cas ... comme ça on sait que si le dossier existe c'est qu'il y a quelque chose dedans
			CreateDirectory(s_biblio_icones_url)
		end if
		string s_fichier_destination

		s_fichier_destination = s_biblio_icones_url + gfx_extraire_nom_fichier (trim(sle_icone_url.text ))
		
		FileCopy (trim(sle_icone_url.text ) , s_fichier_destination, true )
		
		
	else
		Messagebox("ATTENTION", "Impossible de mémoriser l'image du bouton !")
		s_icone_url = ""
	end if
	
end if

// En base de données on ne stock que le nom du fichier ... NOM_FICHIER_ICONE_URLx

choose case s_numero_url
	case "1"
		update patient set url1 = :s_url, icone_url1 = :s_icone_url
		where code = :var_code_local ;
	case "2"
		update patient set url2 = :s_url, icone_url2 = :s_icone_url
		where code = :var_code_local ;
end choose

if sqlca.sqlcode = 0 then
	commit ;
else
	messagebox("ATTENTION","Erreur dans la mémorisation des informations !~n~n" + sqlca.sqlerrtext )
	rollback ;
	
end if

close(parent)

end event

type st_2 from statictext within w_url_parametrage
integer y = 340
integer width = 261
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Image :"
alignment alignment = right!
boolean focusrectangle = false
end type

type sle_icone_url from singlelineedit within w_url_parametrage
integer x = 334
integer y = 320
integer width = 1851
integer height = 112
integer taborder = 20
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

type pb_choix_rep_courant from picturebutton within w_url_parametrage
integer x = 2245
integer y = 288
integer width = 183
integer height = 164
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
long backcolor = 553648127
end type

event clicked;string ficname,ficpath,ficpath_init


if directoryExists(s_biblio_icones_url) then
	// Biblio des icones déjà consititées
	ficpath_init = s_biblio_icones_url
else
	// pour mettre quelque chose par défaut !
	ficpath_init = dir_photos
end if

if GetFileOpenName("Fichiers Images",ficname,ficpath,"jpg","Fichiers Images (*.jpg),*.jpg", ficpath_init) = 1 then
	sle_icone_url.text = ficname
	ole_previsu.charger_image(ficname)
end if
end event

