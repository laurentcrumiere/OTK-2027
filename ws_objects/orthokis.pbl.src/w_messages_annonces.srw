$PBExportHeader$w_messages_annonces.srw
forward
global type w_messages_annonces from w_param
end type
type dw_edition from datawindow within w_messages_annonces
end type
type cb_imprimer from uo_picturebutton_390x120 within w_messages_annonces
end type
type st_1 from statictext within w_messages_annonces
end type
type st_2 from statictext within w_messages_annonces
end type
type st_3 from statictext within w_messages_annonces
end type
type st_4 from statictext within w_messages_annonces
end type
type gb_aide from groupbox within w_messages_annonces
end type
end forward

global type w_messages_annonces from w_param
integer width = 3378
integer height = 2320
string title = "Table des Messages d~'Annonces en Salle d~'Attente"
dw_edition dw_edition
cb_imprimer cb_imprimer
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
gb_aide gb_aide
end type
global w_messages_annonces w_messages_annonces

type variables
double max
end variables

on w_messages_annonces.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.gb_aide=create gb_aide
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.st_1
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.gb_aide
end on

on w_messages_annonces.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_imprimer)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.gb_aide)
end on

event open;call super::open;dw_edition.settransobject(SQLCA)
	
//SELECT MAX(CONVERT(double,code))
//INTO :max
// FROM "categories"  
//WHERE ( "categories"."code" not between 'a' AND 'z' ) AND  
//		( "categories"."code" not between 'A' AND 'Z' )    ;
//

SELECT MAX(cast(code as float))
INTO :max
 FROM "categories"  
WHERE ( "categories"."code" not between 'a' AND 'z' ) AND  
		( "categories"."code" not between 'A' AND 'Z' )    ;


// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[32]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
		cb_enregistrer.enabled = false
	Case 'M'
		// Modification 
//		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
end choose

colore_tous_objets_window(this, couleur_fond_fenetre)


end event

type p_fond from w_param`p_fond within w_messages_annonces
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_messages_annonces
boolean visible = true
integer x = 1394
integer width = 539
end type

type cb_annuler from w_param`cb_annuler within w_messages_annonces
integer x = 1938
integer y = 2032
integer width = 457
end type

type cb_enregistrer from w_param`cb_enregistrer within w_messages_annonces
integer x = 2400
integer y = 2032
integer width = 457
end type

type cb_fermer from w_param`cb_fermer within w_messages_annonces
integer x = 2862
integer y = 2032
integer width = 457
end type

type cb_supprimer from w_param`cb_supprimer within w_messages_annonces
integer x = 471
end type

type cb_ajouter from w_param`cb_ajouter within w_messages_annonces
integer x = 9
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
	

IF IsNull(max) THEN
	max = 1
ELSE	
	max = max + 1
END IF	
dw_liste.SetItem(dw_liste.RowCount(),"code",string(max))

dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_messages_annonces
integer x = 123
integer y = 40
integer width = 3045
integer height = 1636
string dataobject = "dw_messages_annonces"
end type

type uo_1 from w_param`uo_1 within w_messages_annonces
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_messages_annonces
boolean visible = false
end type

type gb_filtre from w_param`gb_filtre within w_messages_annonces
boolean visible = false
end type

type dw_edition from datawindow within w_messages_annonces
boolean visible = false
integer x = 151
integer y = 612
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_messages_annonces"
boolean livescroll = true
end type

type cb_imprimer from uo_picturebutton_390x120 within w_messages_annonces
integer x = 933
integer y = 2032
integer width = 457
integer height = 132
integer taborder = 50
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_edition.retrieve()
dw_edition.print()
end event

type st_1 from statictext within w_messages_annonces
integer x = 165
integer y = 1792
integer width = 910
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
string text = "{prénom} : Prénom de l~'enfant"
boolean focusrectangle = false
end type

type st_2 from statictext within w_messages_annonces
integer x = 165
integer y = 1860
integer width = 910
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
string text = "{nom} : Nom de l~'enfant"
boolean focusrectangle = false
end type

type st_3 from statictext within w_messages_annonces
integer x = 1102
integer y = 1792
integer width = 910
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
string text = "{titre} : Titre de l~'enfant"
boolean focusrectangle = false
end type

type st_4 from statictext within w_messages_annonces
integer x = 1102
integer y = 1860
integer width = 1806
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
string text = "{nom_praticien} : Nom du praticien qui a rendez-vous avec l~'Enfant"
boolean focusrectangle = false
end type

type gb_aide from groupbox within w_messages_annonces
integer x = 128
integer y = 1724
integer width = 3045
integer height = 252
integer taborder = 21
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
boolean italic = true
long textcolor = 33554432
long backcolor = 134217731
string text = "Aide : Champs Paramétrés Possibles"
borderstyle borderstyle = styleraised!
end type

