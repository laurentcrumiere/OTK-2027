$PBExportHeader$w_reference_bague.srw
forward
global type w_reference_bague from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_reference_bague
end type
type cb_annuler from uo_picturebutton_390x120 within w_reference_bague
end type
type cb_fermer from uo_picturebutton_390x120 within w_reference_bague
end type
type tab_ref from tab within w_reference_bague
end type
type tabpage_format from userobject within tab_ref
end type
type cb_supprimer from uo_picturebutton_390x120 within tabpage_format
end type
type cb_inserer from uo_picturebutton_390x120 within tabpage_format
end type
type dw_liste from u_basedw within tabpage_format
end type
type tabpage_format from userobject within tab_ref
cb_supprimer cb_supprimer
cb_inserer cb_inserer
dw_liste dw_liste
end type
type tabpage_table from userobject within tab_ref
end type
type cb_supprimer2 from uo_picturebutton_390x120 within tabpage_table
end type
type cb_inserer2 from uo_picturebutton_390x120 within tabpage_table
end type
type dw_liste2 from u_basedw within tabpage_table
end type
type dw_choix from datawindow within tabpage_table
end type
type st_design from statictext within tabpage_table
end type
type tabpage_table from userobject within tab_ref
cb_supprimer2 cb_supprimer2
cb_inserer2 cb_inserer2
dw_liste2 dw_liste2
dw_choix dw_choix
st_design st_design
end type
type tabpage_index from userobject within tab_ref
end type
type cb_supprimer3 from uo_picturebutton_390x120 within tabpage_index
end type
type cb_inserer3 from uo_picturebutton_390x120 within tabpage_index
end type
type dw_liste3 from u_basedw within tabpage_index
end type
type dw_fiche from datawindow within tabpage_index
end type
type tabpage_index from userobject within tab_ref
cb_supprimer3 cb_supprimer3
cb_inserer3 cb_inserer3
dw_liste3 dw_liste3
dw_fiche dw_fiche
end type
type tab_ref from tab within w_reference_bague
tabpage_format tabpage_format
tabpage_table tabpage_table
tabpage_index tabpage_index
end type
end forward

global type w_reference_bague from w_fenetre_arakis
integer width = 2990
integer height = 1836
string title = "Référencement des Bagues"
windowtype windowtype = response!
long backcolor = 553648127
boolean center = true
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
tab_ref tab_ref
end type
global w_reference_bague w_reference_bague

type variables
string code_fournisseur_local
int max1,max2
end variables

on w_reference_bague.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.tab_ref=create tab_ref
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.tab_ref
end on

on w_reference_bague.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.tab_ref)
end on

event open;call super::open;integer rapport_share

code_fournisseur_local = message.stringparm

tab_ref.tabpage_format.dw_liste.settransobject(sqlca)
tab_ref.tabpage_table.dw_liste2.settransobject(sqlca)
tab_ref.tabpage_table.dw_choix.settransobject(sqlca)
tab_ref.tabpage_index.dw_liste3.settransobject(sqlca)

rapport_share = tab_ref.tabpage_index.dw_liste3.ShareData(tab_ref.tabpage_index.dw_fiche)
if rapport_share <> 1 then
	messagebox ("Sharedata error","error sharing data with tab_index_fiche" + string(rapport_share))
end if

tab_ref.tabpage_format.dw_liste.retrieve(code_fournisseur_local)
tab_ref.tabpage_table.dw_choix.insertrow(0)
tab_ref.tabpage_table.dw_choix.setitem(tab_ref.tabpage_table.dw_choix.rowcount(),"reference_bague",3)
tab_ref.tabpage_table.dw_liste2.retrieve(code_fournisseur_local,3)
tab_ref.tabpage_index.dw_liste3.retrieve(code_fournisseur_local)

	SELECT MAX(code)  
   	INTO :max1  
   	FROM "reference_bague" 
		WHERE "code_fournisseur" = :code_fournisseur_local;

if isnull(max1) then
	max1 = 0
end if

	SELECT MAX(code_index)  
   	INTO :max2
   	FROM "index_taille"
		WHERE "code_fournisseur" = :code_fournisseur_local;

if isnull(max2) then
	max2 = 0
end if

Backcolor  = couleur_fond_fenetre

end event

type p_fond from w_fenetre_arakis`p_fond within w_reference_bague
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_reference_bague
integer x = 1230
integer y = 1472
integer width = 562
integer height = 152
integer taborder = 150
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrerr.png"
end type

event clicked;call super::clicked;int rapport_update1, rapport_update2,rapport_update3

tab_ref.tabpage_index.dw_fiche.accepttext()

rapport_update1 = tab_ref.tabpage_format.dw_liste.Update()
rapport_update2 = tab_ref.tabpage_table.dw_liste2.Update()
rapport_update3 = tab_ref.tabpage_index.dw_liste3.Update()

if rapport_update1 = 1 and rapport_update2 = 1 and rapport_update3 = 1 then
	commit using sqlca ;
else
	rollback using sqlca ;
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_reference_bague
integer x = 613
integer y = 1472
integer width = 562
integer height = 152
integer taborder = 150
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;tab_ref.tabpage_format.dw_liste.retrieve(code_fournisseur_local)
tab_ref.tabpage_table.dw_choix.insertrow(0)
tab_ref.tabpage_table.dw_choix.setitem(tab_ref.tabpage_table.dw_choix.rowcount(),"reference_bague",3)
tab_ref.tabpage_table.dw_liste2.retrieve(code_fournisseur_local,3)
tab_ref.tabpage_index.dw_liste3.retrieve(code_fournisseur_local)

end event

type cb_fermer from uo_picturebutton_390x120 within w_reference_bague
integer x = 1847
integer y = 1472
integer width = 562
integer height = 152
integer taborder = 140
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)
end event

type tab_ref from tab within w_reference_bague
integer x = 128
integer y = 108
integer width = 2537
integer height = 1324
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_format tabpage_format
tabpage_table tabpage_table
tabpage_index tabpage_index
end type

on tab_ref.create
this.tabpage_format=create tabpage_format
this.tabpage_table=create tabpage_table
this.tabpage_index=create tabpage_index
this.Control[]={this.tabpage_format,&
this.tabpage_table,&
this.tabpage_index}
end on

on tab_ref.destroy
destroy(this.tabpage_format)
destroy(this.tabpage_table)
destroy(this.tabpage_index)
end on

type tabpage_format from userobject within tab_ref
integer x = 18
integer y = 112
integer width = 2501
integer height = 1196
long backcolor = 15780518
string text = "Format Référence"
long tabtextcolor = 33554432
long tabbackcolor = 82042848
long picturemaskcolor = 536870912
cb_supprimer cb_supprimer
cb_inserer cb_inserer
dw_liste dw_liste
end type

on tabpage_format.create
this.cb_supprimer=create cb_supprimer
this.cb_inserer=create cb_inserer
this.dw_liste=create dw_liste
this.Control[]={this.cb_supprimer,&
this.cb_inserer,&
this.dw_liste}
end on

on tabpage_format.destroy
destroy(this.cb_supprimer)
destroy(this.cb_inserer)
destroy(this.dw_liste)
end on

type cb_supprimer from uo_picturebutton_390x120 within tabpage_format
integer x = 1285
integer y = 996
integer width = 562
integer height = 152
integer taborder = 120
string text = "Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;dw_liste.deleterow(dw_liste.getrow())
end event

type cb_inserer from uo_picturebutton_390x120 within tabpage_format
integer x = 613
integer y = 996
integer width = 562
integer height = 152
integer taborder = 110
string text = "Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;dw_liste.insertrow(0)
dw_liste.setitem(dw_liste.rowcount(),"code_fournisseur",code_fournisseur_local)
dw_liste.setitem(dw_liste.rowcount(),"ordre_reference",dw_liste.rowcount())

end event

type dw_liste from u_basedw within tabpage_format
integer x = 443
integer y = 124
integer width = 1563
integer height = 580
integer taborder = 20
string dataobject = "dw_ref_bague"
boolean hscrollbar = false
boolean border = false
end type

type tabpage_table from userobject within tab_ref
integer x = 18
integer y = 112
integer width = 2501
integer height = 1196
long backcolor = 16777215
string text = "Table des Références"
long tabtextcolor = 33554432
long tabbackcolor = 82042848
long picturemaskcolor = 536870912
cb_supprimer2 cb_supprimer2
cb_inserer2 cb_inserer2
dw_liste2 dw_liste2
dw_choix dw_choix
st_design st_design
end type

on tabpage_table.create
this.cb_supprimer2=create cb_supprimer2
this.cb_inserer2=create cb_inserer2
this.dw_liste2=create dw_liste2
this.dw_choix=create dw_choix
this.st_design=create st_design
this.Control[]={this.cb_supprimer2,&
this.cb_inserer2,&
this.dw_liste2,&
this.dw_choix,&
this.st_design}
end on

on tabpage_table.destroy
destroy(this.cb_supprimer2)
destroy(this.cb_inserer2)
destroy(this.dw_liste2)
destroy(this.dw_choix)
destroy(this.st_design)
end on

type cb_supprimer2 from uo_picturebutton_390x120 within tabpage_table
integer x = 1239
integer y = 976
integer width = 562
integer height = 152
integer taborder = 30
string text = "Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;tab_ref.tabpage_table.dw_liste2.deleterow(tab_ref.tabpage_table.dw_liste2.getrow())
end event

type cb_inserer2 from uo_picturebutton_390x120 within tabpage_table
integer x = 613
integer y = 976
integer width = 562
integer height = 152
integer taborder = 20
string text = "Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;max1 = max1 + 1

tab_ref.tabpage_table.dw_liste2.insertrow(0)
tab_ref.tabpage_table.dw_liste2.setitem(tab_ref.tabpage_table.dw_liste2.rowcount(),"code_fournisseur",code_fournisseur_local)
tab_ref.tabpage_table.dw_liste2.setitem(tab_ref.tabpage_table.dw_liste2.rowcount(),"designation_ref",tab_ref.tabpage_table.dw_choix.getitemnumber(tab_ref.tabpage_table.dw_choix.getrow(),"reference_bague"))
tab_ref.tabpage_table.dw_liste2.setitem(tab_ref.tabpage_table.dw_liste2.rowcount(),"code",max1)

end event

type dw_liste2 from u_basedw within tabpage_table
integer x = 320
integer y = 240
integer width = 1659
integer height = 540
integer taborder = 11
string dataobject = "dw_liste_reference"
boolean hscrollbar = false
boolean border = false
end type

type dw_choix from datawindow within tabpage_table
integer x = 1088
integer y = 108
integer width = 809
integer height = 68
integer taborder = 20
string title = "none"
string dataobject = "dw_ref_bague_ddlb"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;tab_ref.tabpage_table.dw_liste2.retrieve(code_fournisseur_local,double(data))
end event

type st_design from statictext within tabpage_table
integer x = 297
integer y = 112
integer width = 754
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Désignation de la référence :"
boolean focusrectangle = false
end type

type tabpage_index from userobject within tab_ref
integer x = 18
integer y = 112
integer width = 2501
integer height = 1196
long backcolor = 16777215
string text = "Index des Tailles"
long tabtextcolor = 33554432
long tabbackcolor = 82042848
long picturemaskcolor = 536870912
cb_supprimer3 cb_supprimer3
cb_inserer3 cb_inserer3
dw_liste3 dw_liste3
dw_fiche dw_fiche
end type

on tabpage_index.create
this.cb_supprimer3=create cb_supprimer3
this.cb_inserer3=create cb_inserer3
this.dw_liste3=create dw_liste3
this.dw_fiche=create dw_fiche
this.Control[]={this.cb_supprimer3,&
this.cb_inserer3,&
this.dw_liste3,&
this.dw_fiche}
end on

on tabpage_index.destroy
destroy(this.cb_supprimer3)
destroy(this.cb_inserer3)
destroy(this.dw_liste3)
destroy(this.dw_fiche)
end on

type cb_supprimer3 from uo_picturebutton_390x120 within tabpage_index
integer x = 1248
integer y = 992
integer width = 562
integer height = 152
integer taborder = 120
string text = "Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;tab_ref.tabpage_index.dw_liste3.deleterow(tab_ref.tabpage_index.dw_liste3.getrow())
end event

type cb_inserer3 from uo_picturebutton_390x120 within tabpage_index
integer x = 622
integer y = 992
integer width = 562
integer height = 152
integer taborder = 110
string text = "Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;max2 = max2 + 1

tab_ref.tabpage_index.dw_liste3.insertrow(0)
tab_ref.tabpage_index.dw_liste3.setitem(tab_ref.tabpage_index.dw_liste3.rowcount(),"code_fournisseur",code_fournisseur_local)
tab_ref.tabpage_index.dw_liste3.setitem(tab_ref.tabpage_index.dw_liste3.rowcount(),"code_index",max2)
tab_ref.tabpage_index.dw_fiche.scrolltorow(tab_ref.tabpage_index.dw_liste3.rowcount())
end event

type dw_liste3 from u_basedw within tabpage_index
integer x = 681
integer y = 68
integer width = 1115
integer taborder = 10
string dataobject = "dw_liste_inedx_taille2"
boolean hscrollbar = false
boolean border = false
end type

event clicked;call super::clicked;if row > 0 then
	tab_ref.tabpage_index.dw_fiche.scrolltorow(row)
end if
end event

type dw_fiche from datawindow within tabpage_index
integer x = 494
integer y = 528
integer width = 1330
integer height = 388
integer taborder = 10
string title = "none"
string dataobject = "dw_index_taille2"
boolean border = false
boolean livescroll = true
end type

