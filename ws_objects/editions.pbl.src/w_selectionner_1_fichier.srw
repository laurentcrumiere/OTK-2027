$PBExportHeader$w_selectionner_1_fichier.srw
forward
global type w_selectionner_1_fichier from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_selectionner_1_fichier
end type
type cb_ouvrir from uo_picturebutton_390x120 within w_selectionner_1_fichier
end type
type st_2 from statictext within w_selectionner_1_fichier
end type
type st_1 from statictext within w_selectionner_1_fichier
end type
type plb_1 from picturelistbox within w_selectionner_1_fichier
end type
end forward

global type w_selectionner_1_fichier from w_fenetre_arakis
integer width = 1467
integer height = 1704
string title = "Sélectionnez un courrier"
windowtype windowtype = response!
long backcolor = 15780518
cb_annuler cb_annuler
cb_ouvrir cb_ouvrir
st_2 st_2
st_1 st_1
plb_1 plb_1
end type
global w_selectionner_1_fichier w_selectionner_1_fichier

forward prototypes
public function integer load_plb ()
end prototypes

public function integer load_plb ();// fx qui charge la plb

string	lrep_courriers


// recup du rep courrier
lrep_courriers = fxg_get_rep_courriers()

if lrep_courriers <> "" then
// un rep courrier est config
	// ne sont recherchés que les fichiers :
	//		* en accés complet (NON en lecture seul)
	// 	* les .doc
	plb_1.DirList(lrep_courriers + FichiersWord , 32)
else
// pas de rep courrier ou pb -> msg
	messagebox("ATTENTION", "Votre répertoire courrier n'est pas configurer. ~nImpossible de poursuivre.")
end if

return 1
end function

on w_selectionner_1_fichier.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_ouvrir=create cb_ouvrir
this.st_2=create st_2
this.st_1=create st_1
this.plb_1=create plb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_ouvrir
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.plb_1
end on

on w_selectionner_1_fichier.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_ouvrir)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.plb_1)
end on

event open;// chargement de la picture list box
load_plb()

centrer(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_selectionner_1_fichier
end type

type cb_annuler from uo_picturebutton_390x120 within w_selectionner_1_fichier
integer x = 882
integer y = 1440
integer width = 453
integer height = 152
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;// on sort en envoyant une string vide
closewithreturn(parent, "")

end event

type cb_ouvrir from uo_picturebutton_390x120 within w_selectionner_1_fichier
integer x = 407
integer y = 1440
integer width = 453
integer height = 152
integer taborder = 30
boolean enabled = false
string text = "&Ouvrir"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;// on sort en envoyant le nom du fichier sélectionné
closewithreturn(parent, plb_1.SelectedItem())

end event

type st_2 from statictext within w_selectionner_1_fichier
integer x = 27
integer y = 1224
integer width = 1399
integer height = 144
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 553648127
boolean enabled = false
string text = "Afin d~'activer le bouton Ouvrir, sélectionnez un courrier dans la liste ci-dessus."
boolean focusrectangle = false
end type

type st_1 from statictext within w_selectionner_1_fichier
integer x = 27
integer y = 1056
integer width = 1399
integer height = 168
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 553648127
boolean enabled = false
string text = "Vous êtes actuellement positionné dans votre répertoire courrier ..."
boolean focusrectangle = false
end type

type plb_1 from picturelistbox within w_selectionner_1_fichier
integer x = 27
integer y = 24
integer width = 1399
integer height = 1008
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
string item[] = {""}
borderstyle borderstyle = stylelowered!
integer itempictureindex[] = {0}
string picturename[] = {"Ico_courriers_word.bmp"}
long picturemaskcolor = 536870912
end type

event selectionchanged;// on dévérouille le bouton d'ouverture
cb_ouvrir.enabled = true
end event

