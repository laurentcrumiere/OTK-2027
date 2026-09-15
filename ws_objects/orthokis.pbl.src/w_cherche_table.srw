$PBExportHeader$w_cherche_table.srw
forward
global type w_cherche_table from window
end type
type cbx_inactifs from checkbox within w_cherche_table
end type
type p_fond from picture within w_cherche_table
end type
type cb_continuer from uo_picturebutton_390x120 within w_cherche_table
end type
type cb_annuler from uo_picturebutton_390x120 within w_cherche_table
end type
type cb_rechercher from uo_picturebutton_390x120 within w_cherche_table
end type
type dw_liste from datawindow within w_cherche_table
end type
type em_nom from editmask within w_cherche_table
end type
type gb_1 from groupbox within w_cherche_table
end type
end forward

global type w_cherche_table from window
integer x = 87
integer y = 160
integer width = 2587
integer height = 1552
boolean titlebar = true
string title = "Recherche d~'une Fiche"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 16777215
boolean center = true
cbx_inactifs cbx_inactifs
p_fond p_fond
cb_continuer cb_continuer
cb_annuler cb_annuler
cb_rechercher cb_rechercher
dw_liste dw_liste
em_nom em_nom
gb_1 gb_1
end type
global w_cherche_table w_cherche_table

type variables
string sel,sel1

end variables

forward prototypes
public subroutine continuer ()
end prototypes

public subroutine continuer ();if dw_liste.rowcount() > 0 then
	// On renvoit le code sélectionné
	var_suite = true
	closeWithReturn(w_cherche_table,dw_liste.getitemstring(dw_liste.getrow(),"code"))
else
	beep(1)
end if

end subroutine

event open;// ATTENTION ! 
// La même fenêtre va servir à plusieurs tables ... 
// On passe la Dw de liste en paramètre .. c'est tout 


dw_liste.dataobject = Message.stringParm

if left(dw_liste.dataobject,10) = "dw_corresp" or left(dw_liste.dataobject,11) = "dw_mutuelle" or left(dw_liste.dataobject,9) = "dw_caisse"   or left(dw_liste.dataobject,8) = "dw_soins"  &
 or left(dw_liste.dataobject,11) = "dw_type_rdv" 	then
	cbx_inactifs.visible = true
	
	// on désactive la colonne actif pour qu'on ne puisse pas la cliquer (ça sert à rien)
	dw_liste.Object.actif.TabSequence = 0
	dw_liste.Object.ordre_trie.TabSequence = 0
end if

colore_tous_objets_window(this, couleur_fond_fenetre)

var_suite = false 

dw_liste.settransobject(SQLCA)

em_nom.setfocus()

placer_image_fond(this, p_fond, image_fond_fenetre)

end event

on w_cherche_table.create
this.cbx_inactifs=create cbx_inactifs
this.p_fond=create p_fond
this.cb_continuer=create cb_continuer
this.cb_annuler=create cb_annuler
this.cb_rechercher=create cb_rechercher
this.dw_liste=create dw_liste
this.em_nom=create em_nom
this.gb_1=create gb_1
this.Control[]={this.cbx_inactifs,&
this.p_fond,&
this.cb_continuer,&
this.cb_annuler,&
this.cb_rechercher,&
this.dw_liste,&
this.em_nom,&
this.gb_1}
end on

on w_cherche_table.destroy
destroy(this.cbx_inactifs)
destroy(this.p_fond)
destroy(this.cb_continuer)
destroy(this.cb_annuler)
destroy(this.cb_rechercher)
destroy(this.dw_liste)
destroy(this.em_nom)
destroy(this.gb_1)
end on

type cbx_inactifs from checkbox within w_cherche_table
boolean visible = false
integer x = 1833
integer y = 48
integer width = 599
integer height = 92
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 33554432
long backcolor = 553648127
string text = "Avec Inactifs"
end type

type p_fond from picture within w_cherche_table
boolean visible = false
integer x = 425
integer y = 1188
integer width = 567
integer height = 200
boolean focusrectangle = false
end type

type cb_continuer from uo_picturebutton_390x120 within w_cherche_table
integer x = 1737
integer y = 1276
integer width = 512
integer height = 152
integer taborder = 110
boolean enabled = false
string text = "&Continuer"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;continuer()
end event

type cb_annuler from uo_picturebutton_390x120 within w_cherche_table
integer x = 1184
integer y = 1276
integer width = 512
integer height = 152
integer taborder = 110
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;var_suite = false
close(parent)
end event

type cb_rechercher from uo_picturebutton_390x120 within w_cherche_table
integer x = 1778
integer y = 164
integer width = 581
integer height = 152
integer taborder = 30
string text = "&Rechercher"
boolean default = true
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;string nom_recherche
string v_filtre

nom_recherche = trim(em_nom.text)+'%'
dw_liste.retrieve(nom_recherche)

if cbx_inactifs.visible then
	if cbx_inactifs.checked then
		v_filtre = ""
	else
		v_filtre = "actif = 1"
	end if

	dw_liste.Setfilter(v_filtre)
	dw_liste.Filter()
end if

if dw_liste.rowcount() > 0 then
	if dw_liste.rowcount() = 1 then
		continuer()
	else
		cb_continuer.enabled ( true)
	end if
else
	cb_continuer.enabled ( false)
end if



end event

type dw_liste from datawindow within w_cherche_table
string tag = "brush"
integer x = 41
integer y = 340
integer width = 2491
integer height = 896
integer taborder = 90
string dataobject = "dw_caisse_liste"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;This.SetRow(row)
continuer()
end event

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.SetRow(row)
End If

end event

event rowfocuschanged;If currentrow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
	This.SetRow(currentrow)
End if

end event

type em_nom from editmask within w_cherche_table
integer x = 73
integer y = 128
integer width = 1454
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
end type

type gb_1 from groupbox within w_cherche_table
integer x = 37
integer y = 48
integer width = 1600
integer height = 248
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 16777215
string text = "Nom recherché"
end type

