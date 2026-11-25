$PBExportHeader$w_resultats.srw
forward
global type w_resultats from window
end type
type cb_1 from commandbutton within w_resultats
end type
type st_2 from statictext within w_resultats
end type
type cb_exporter from commandbutton within w_resultats
end type
type dw_cherche_match from datawindow within w_resultats
end type
type cb_tirage from commandbutton within w_resultats
end type
type em_score2 from editmask within w_resultats
end type
type em_score1 from editmask within w_resultats
end type
type st_match from statictext within w_resultats
end type
type cb_rechercher from commandbutton within w_resultats
end type
type cb_imprimer from commandbutton within w_resultats
end type
type dw_liste from datawindow within w_resultats
end type
type cb_fermer from commandbutton within w_resultats
end type
end forward

global type w_resultats from window
integer width = 4891
integer height = 2712
boolean titlebar = true
string title = "Gestion des résultats"
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_1 cb_1
st_2 st_2
cb_exporter cb_exporter
dw_cherche_match dw_cherche_match
cb_tirage cb_tirage
em_score2 em_score2
em_score1 em_score1
st_match st_match
cb_rechercher cb_rechercher
cb_imprimer cb_imprimer
dw_liste dw_liste
cb_fermer cb_fermer
end type
global w_resultats w_resultats

type variables

patient v_patient
integer temps_attente
end variables

on w_resultats.create
this.cb_1=create cb_1
this.st_2=create st_2
this.cb_exporter=create cb_exporter
this.dw_cherche_match=create dw_cherche_match
this.cb_tirage=create cb_tirage
this.em_score2=create em_score2
this.em_score1=create em_score1
this.st_match=create st_match
this.cb_rechercher=create cb_rechercher
this.cb_imprimer=create cb_imprimer
this.dw_liste=create dw_liste
this.cb_fermer=create cb_fermer
this.Control[]={this.cb_1,&
this.st_2,&
this.cb_exporter,&
this.dw_cherche_match,&
this.cb_tirage,&
this.em_score2,&
this.em_score1,&
this.st_match,&
this.cb_rechercher,&
this.cb_imprimer,&
this.dw_liste,&
this.cb_fermer}
end on

on w_resultats.destroy
destroy(this.cb_1)
destroy(this.st_2)
destroy(this.cb_exporter)
destroy(this.dw_cherche_match)
destroy(this.cb_tirage)
destroy(this.em_score2)
destroy(this.em_score1)
destroy(this.st_match)
destroy(this.cb_rechercher)
destroy(this.cb_imprimer)
destroy(this.dw_liste)
destroy(this.cb_fermer)
end on

event open;dw_liste.settransobject(SQLCA)

dw_cherche_match.settransobject(SQLCA)
dw_cherche_match.retrieve()
end event

type cb_1 from commandbutton within w_resultats
integer x = 3387
integer y = 108
integer width = 827
integer height = 160
integer taborder = 30
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Rechercher Tous"
end type

event clicked;// recherche de tous les pronoistoics du match
date v_date_match

v_date_match = dw_cherche_match.getItemDate(dw_cherche_match.getrow(), "date")

dw_liste.setfilter("")
dw_liste.filter()
dw_liste.retrieve(v_date_match)

end event

type st_2 from statictext within w_resultats
integer x = 192
integer y = 188
integer width = 466
integer height = 88
integer textsize = -12
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 553648127
boolean enabled = false
string text = "Score Final :"
boolean focusrectangle = false
end type

type cb_exporter from commandbutton within w_resultats
integer x = 1079
integer y = 2372
integer width = 571
integer height = 160
integer taborder = 40
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
boolean enabled = false
string text = "&Exporter"
end type

event clicked;dw_liste.saveas()

end event

type dw_cherche_match from datawindow within w_resultats
integer x = 933
integer y = 60
integer width = 544
integer height = 68
integer taborder = 10
string title = "none"
string dataobject = "dw_matchs_cherche"
boolean border = false
boolean livescroll = true
end type

type cb_tirage from commandbutton within w_resultats
integer x = 1719
integer y = 2372
integer width = 1403
integer height = 160
integer taborder = 30
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
boolean enabled = false
string text = "&Tirage Aléatoire du Vainqueur"
end type

event clicked;
// initisalition du générateur aléatoire
integer alea , lig

alea = integer(right(string(now(), "h:mm:ss:ffff"), 4))

Randomize ( alea )

lig = Rand ( dw_liste.rowcount() )

Messagebox("Le vainqueur est ...", dw_liste.GetitemString(lig, "patient_nom") + " " + dw_liste.GetitemString(lig, "patient_prenom") + " (" + string(dw_liste.GetitemNumber(lig, "patient_numero_dossier")) + ")")

end event

type em_score2 from editmask within w_resultats
integer x = 1111
integer y = 192
integer width = 288
integer height = 100
integer taborder = 20
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = styleraised!
string mask = "##"
boolean spin = true
end type

type em_score1 from editmask within w_resultats
integer x = 768
integer y = 192
integer width = 288
integer height = 100
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = styleraised!
string mask = "##"
boolean spin = true
end type

type st_match from statictext within w_resultats
integer x = 192
integer y = 48
integer width = 709
integer height = 84
integer textsize = -12
fontcharset fontcharset = ansi!
string facename = "Eras Demi ITC"
long backcolor = 553648127
boolean enabled = false
string text = "Match à Analyser :"
boolean focusrectangle = false
end type

type cb_rechercher from commandbutton within w_resultats
integer x = 1733
integer y = 108
integer width = 1115
integer height = 160
integer taborder = 50
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string text = "&Rechercher Bons Scores"
end type

event clicked;

// recherche les bons résultats
date v_date_match
integer v_score1, v_score2
v_date_match = dw_cherche_match.getItemDate(dw_cherche_match.getrow(), "date")
v_score1 = integer (em_score1.text)
v_score2 = integer (em_score2.text)

dw_liste.setfilter("score1  = " + string(v_score1) + " and score2  = " + string(v_score2))
dw_liste.filter()
dw_liste.retrieve(v_date_match)



end event

type cb_imprimer from commandbutton within w_resultats
integer x = 439
integer y = 2372
integer width = 571
integer height = 160
integer taborder = 40
integer textsize = -14
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
boolean enabled = false
string text = "&Imprimer"
end type

event clicked;if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_liste.print()
end if
end event

type dw_liste from datawindow within w_resultats
integer x = 78
integer y = 344
integer width = 4727
integer height = 1924
integer taborder = 10
boolean titlebar = true
string title = "Bons pronostics"
string dataobject = "dw_pronostics_liste"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event itemchanged;

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

event retrieveend;

if rowcount > 0 then
	cb_exporter.enabled = true
	cb_tirage.enabled = true
	cb_imprimer.enabled = true
else
	cb_exporter.enabled = false
	cb_tirage.enabled = false
	cb_imprimer.enabled = false
end if 
end event

type cb_fermer from commandbutton within w_resultats
integer x = 3191
integer y = 2372
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

event clicked;
		close(parent)

end event

