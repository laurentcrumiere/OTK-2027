$PBExportHeader$w_matchs.srw
$PBExportComments$Héritée de param
forward
global type w_matchs from window
end type
type cb_enregistrer from commandbutton within w_matchs
end type
type cb_annuler from commandbutton within w_matchs
end type
type cb_imprimer from commandbutton within w_matchs
end type
type cb_supprimer from commandbutton within w_matchs
end type
type cb_ajouter from commandbutton within w_matchs
end type
type dw_liste from datawindow within w_matchs
end type
type cb_fermer from commandbutton within w_matchs
end type
end forward

global type w_matchs from window
integer width = 4891
integer height = 2712
boolean titlebar = true
string title = "Gestion des Matchs"
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_imprimer cb_imprimer
cb_supprimer cb_supprimer
cb_ajouter cb_ajouter
dw_liste dw_liste
cb_fermer cb_fermer
end type
global w_matchs w_matchs

type variables

patient v_patient
integer temps_attente
end variables

on w_matchs.create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.cb_supprimer=create cb_supprimer
this.cb_ajouter=create cb_ajouter
this.dw_liste=create dw_liste
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_enregistrer,&
this.cb_annuler,&
this.cb_imprimer,&
this.cb_supprimer,&
this.cb_ajouter,&
this.dw_liste,&
this.cb_fermer}
end on

on w_matchs.destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.cb_supprimer)
destroy(this.cb_ajouter)
destroy(this.dw_liste)
destroy(this.cb_fermer)
end on

event open;dw_liste.settransobject(SQLCA)
dw_liste.retrieve()

end event

type cb_enregistrer from commandbutton within w_matchs
integer x = 3223
integer y = 2404
integer width = 571
integer height = 160
integer taborder = 50
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Enregistrer"
end type

event clicked;dw_liste.accepttext()
if dw_liste.update() = 1 then
	commit ;
	if not enregistrement_automatique then
		// si tout va bien on retrieve pour remetre l'ordre entre autre
		cb_annuler.TriggerEvent(Clicked!)
	end if
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if


end event

type cb_annuler from commandbutton within w_matchs
integer x = 2469
integer y = 2404
integer width = 571
integer height = 160
integer taborder = 50
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Annuler"
end type

event clicked;rollback ;
dw_liste.retrieve() ;
end event

type cb_imprimer from commandbutton within w_matchs
integer x = 1714
integer y = 2404
integer width = 571
integer height = 160
integer taborder = 40
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Imprimer"
end type

event clicked;if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_liste.print()
end if
end event

type cb_supprimer from commandbutton within w_matchs
integer x = 960
integer y = 2404
integer width = 571
integer height = 160
integer taborder = 40
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Supprimer"
end type

event clicked;string code
long ligne, nb
integer reponse

if dw_liste.rowcount() > 0 then
	ligne = dw_liste.GetRow() 
	
	double v_id_match
	v_id_match = dw_liste.getitemnumber(ligne, "id")
	
	select count(*) into :nb from pronostics where id_match = :v_id_match ;
	
	if nb > 0 then 
		reponse = messagebox("ATTENTION","Vous allez supprimé un match pour lesquels des pronostcs ont été saisis (" + string(nb) + "). Si vous confirmez, ceux-ci seront perdus.~n~nConfirmez-vous ?", Question!, YesNo!, 2)
	else
		reponse = messagebox("ATTENTION","Vous allez supprimé un match .~n~nConfirmez-vous ?", Question!, YesNo!, 2)
	end if
	
	
	if reponse = 1 then
		dw_liste.deleterow(ligne)
	end if
END IF	
end event

type cb_ajouter from commandbutton within w_matchs
integer x = 206
integer y = 2404
integer width = 571
integer height = 160
integer taborder = 30
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Ajouter"
end type

event clicked;long lig

dw_liste.InsertRow(0)
lig = dw_liste.rowcount()

dw_liste.SetItem(lig, "date", today())
dw_liste.SetItem(lig, "equipe1", ProfileString (dir_ini+"orthokis.ini","Borne","st_equip1_texte","RC Lens"))
dw_liste.SetItem(lig, "fanion1",  ProfileString (dir_ini+"orthokis.ini","Borne","image_fanion",""))

dw_liste.Setcolumn("equipe2")
dw_liste.SetFocus()

end event

type dw_liste from datawindow within w_matchs
integer x = 229
integer y = 52
integer width = 4265
integer height = 2308
integer taborder = 10
string title = "none"
string dataobject = "dw_matchs_liste"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event buttonclicked;

string ficname,ficpath

string	ls_Object

ls_Object = String(dwo.name)


choose case ls_object
	case "b_1" 

		if GetFileOpenName("Fichiers Image JPG",ficname,ficpath,"JPG","Fichiers Images (*.jpg),*.Jpg") = 1 then
			SetItem(row, "fanion1", ficname)
		end if
		
	case "b_2" 

		if GetFileOpenName("Fichiers Image JPG",ficname,ficpath,"JPG","Fichiers Images (*.jpg),*.Jpg") = 1 then
			SetItem(row, "fanion2", ficname)
		end if
	end choose	
		
		
end event

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1
end event

type cb_fermer from commandbutton within w_matchs
integer x = 3977
integer y = 2404
integer width = 571
integer height = 160
integer taborder = 20
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Fermer"
end type

event clicked;dw_liste.accepttext()

if enregistrement_automatique and cb_enregistrer.enabled then
	close(parent)
else
	if (dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0) and cb_enregistrer.enabled Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			Close(parent)
		end if
	else
		close(parent)
	end if
end if
end event

