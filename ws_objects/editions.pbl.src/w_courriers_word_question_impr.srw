$PBExportHeader$w_courriers_word_question_impr.srw
forward
global type w_courriers_word_question_impr from w_fenetre_arakis
end type
type pb_non from uo_picturebutton_780x120 within w_courriers_word_question_impr
end type
type pb_oui from uo_picturebutton_780x120 within w_courriers_word_question_impr
end type
type st_libelle from statictext within w_courriers_word_question_impr
end type
end forward

global type w_courriers_word_question_impr from w_fenetre_arakis
integer width = 1742
integer height = 768
string title = "Mise en historique"
windowtype windowtype = response!
long backcolor = 15780518
pb_non pb_non
pb_oui pb_oui
st_libelle st_libelle
end type
global w_courriers_word_question_impr w_courriers_word_question_impr

type variables
string nom_fichier_ouvert_sous_word


constant string param_inter_proc = "HKEY_LOCAL_MACHINE\SOFTWARE\Arakis\Power ORTHOkis"

uo_lien_word uo_word 	// pour utiliser les fonctions

integer nb_tentatives_autorisees

long retour_word_en_avant_plan
end variables

on w_courriers_word_question_impr.create
int iCurrent
call super::create
this.pb_non=create pb_non
this.pb_oui=create pb_oui
this.st_libelle=create st_libelle
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_non
this.Control[iCurrent+2]=this.pb_oui
this.Control[iCurrent+3]=this.st_libelle
end on

on w_courriers_word_question_impr.destroy
call super::destroy
destroy(this.pb_non)
destroy(this.pb_oui)
destroy(this.st_libelle)
end on

event open;call super::open;string libelle_message 

centrer(this)

libelle_message = message.stringparm

st_libelle.text = libelle_message

nb_tentatives_autorisees = 4

uo_word = create uo_lien_word  

timer(1)
end event

event timer;

retour_word_en_avant_plan = 	uo_word.word_en_avant_plan_2016()	


nb_tentatives_autorisees = nb_tentatives_autorisees - 1

//on a trouvé la fenetre ou pas trouvé au bout de n tentatives
if retour_word_en_avant_plan > 0 or nb_tentatives_autorisees <= 0 then
	timer(0) // on stoppe le timer
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_courriers_word_question_impr
end type

type pb_non from uo_picturebutton_780x120 within w_courriers_word_question_impr
integer x = 878
integer y = 480
integer taborder = 20
string text = "NON"
end type

event clicked;call super::clicked;closewithreturn(parent, 2)
end event

type pb_oui from uo_picturebutton_780x120 within w_courriers_word_question_impr
integer x = 73
integer y = 480
integer width = 777
integer height = 152
integer taborder = 10
string text = "OUI"
boolean default = true
end type

event clicked;call super::clicked;closewithreturn(parent, 1)
end event

type st_libelle from statictext within w_courriers_word_question_impr
integer x = 242
integer y = 52
integer width = 1184
integer height = 344
integer textsize = -14
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Souhaitez-vous enregistrer le document WORD dans le dossier du patient ?"
alignment alignment = center!
end type

