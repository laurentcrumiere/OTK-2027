$PBExportHeader$w_param_courriers_word.srw
forward
global type w_param_courriers_word from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_param_courriers_word
end type
type cb_annuler from uo_picturebutton_390x120 within w_param_courriers_word
end type
type cb_rechercher from uo_picturebutton_390x120 within w_param_courriers_word
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_param_courriers_word
end type
type dw_1 from datawindow within w_param_courriers_word
end type
end forward

global type w_param_courriers_word from w_fenetre_arakis
integer width = 2843
integer height = 2008
string title = "Courriers Word pour publipostage"
windowtype windowtype = response!
long backcolor = 15780518
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_rechercher cb_rechercher
cb_enregistrer cb_enregistrer
dw_1 dw_1
end type
global w_param_courriers_word w_param_courriers_word

on w_param_courriers_word.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_rechercher=create cb_rechercher
this.cb_enregistrer=create cb_enregistrer
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_rechercher
this.Control[iCurrent+4]=this.cb_enregistrer
this.Control[iCurrent+5]=this.dw_1
end on

on w_param_courriers_word.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_rechercher)
destroy(this.cb_enregistrer)
destroy(this.dw_1)
end on

event open;dw_1.settransobject(SQLCA)
dw_1.retrieve()

backcolor = couleur_fond_fenetre
colore_datawindow(dw_1)
centrer(this)

end event

type p_fond from w_fenetre_arakis`p_fond within w_param_courriers_word
end type

type cb_fermer from uo_picturebutton_390x120 within w_param_courriers_word
integer x = 2030
integer y = 1684
integer width = 535
integer taborder = 50
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;cb_enregistrer.triggerevent(clicked!)
close(parent)
end event

type cb_annuler from uo_picturebutton_390x120 within w_param_courriers_word
integer x = 923
integer y = 1684
integer width = 535
integer taborder = 50
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_1.retrieve()
end event

type cb_rechercher from uo_picturebutton_390x120 within w_param_courriers_word
integer x = 370
integer y = 1684
integer width = 535
integer taborder = 50
string text = "&Rechercher"
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;
string chemin, fichier 

// recup du rep courrier qui va etre le rep par defaut
string chemim_rep_courrier


chemim_rep_courrier = dir_courriers

// .docx par défaut
if not getfileopenname("Sélection d'un fichier d'entête Word ", chemin, fichier, "docx", "Fichiers Word  (*.docx), *.docx, Fichiers Word 97 (*.doc), *.doc", chemim_rep_courrier) = 1 then return


// Le courrier doit faire partie des documents paratagé du serveur !!
if upper(left(chemin, len(chemim_rep_courrier))) = upper(chemim_rep_courrier) then 

	// On va stocker dans la table le chemin du fichier en relatif par rapport au chemin de courriers !
	string v1, v2
	fichier = right (chemin, len(chemin) - len(chemim_rep_courrier) ) 
	
	dw_1.SetItem(dw_1.GetRow(), "nom_courrier", fichier)



else
	
	Messagebox("ATTENTION !","Le courrier doit se trouver dans le dossier des courriers ("+chemim_rep_courrier+") ou dans un de ses sous dossiers.~n~nLe choix de ce fichier n'est donc pas autorisé.")

end if



//string	recup_str
//long		num_ligne
//
//
//// recup du num de ligne
//num_ligne = dw_1.GetRow()
//
//if num_ligne >= 1 then
//// si une ligne est bien sélect ( <=> pas de pb)
//	if open(w_selectionner_1_fichier) = 1 then
//		
//	// si ouverture de la fenètre de recherche s'est bien passé
//		// récup du closewithreturn de la win de recherche
//		recup_str = Message.StringParm
//		
//		if recup_str <> "" then
//		// si on a pas annulé la fenêtre de recherche
//			if dw_1.SetItem(num_ligne, "nom_courrier", recup_str) <> 1 then
//			// si un pb est rencontré -> msg
//				messagebox("ERREUR", "Un problème est survenu. ~n~nOpération annulée !", StopSign!)
//			end if
//		end if
//	else
//	// pb ds l'ouverture d'une fenêtre de recherche -> msg erreur
//		messagebox("ERREUR", "Un problème est survenu dans l'ouverture ~nde la fenêtre de recherche. ~n~nOpération annulée !", StopSign!)
//	end if
//end if
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_param_courriers_word
integer x = 1477
integer y = 1684
integer width = 535
integer taborder = 50
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;if dw_1.AcceptText() = 1 then
// s'il y a acception de la modif -> on save
	dw_1.update()
	commit ;
end if
end event

type dw_1 from datawindow within w_param_courriers_word
string tag = "brush"
integer x = 27
integer y = 24
integer width = 2770
integer height = 1588
integer taborder = 10
string title = "none"
string dataobject = "dw_param_courriers_word"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

