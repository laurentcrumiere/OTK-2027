$PBExportHeader$w_paramgene_stock.srw
forward
global type w_paramgene_stock from w_fenetre_arakis
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_paramgene_stock
end type
type cb_annuler from uo_picturebutton_390x120 within w_paramgene_stock
end type
type cb_fermer from uo_picturebutton_390x120 within w_paramgene_stock
end type
type dw_fiche from datawindow within w_paramgene_stock
end type
type ddlb_imprimante_code_barre from uo_liste_imprimantes within w_paramgene_stock
end type
type st_1 from statictext within w_paramgene_stock
end type
type gb_1 from groupbox within w_paramgene_stock
end type
end forward

global type w_paramgene_stock from w_fenetre_arakis
integer x = 18
integer y = 176
integer width = 3246
integer height = 2504
string title = "Paramètrages Stock"
windowtype windowtype = response!
long backcolor = 15780518
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
dw_fiche dw_fiche
ddlb_imprimante_code_barre ddlb_imprimante_code_barre
st_1 st_1
gb_1 gb_1
end type
global w_paramgene_stock w_paramgene_stock

forward prototypes
public subroutine get_infos ()
end prototypes

public subroutine get_infos ();dw_fiche.retrieve()

if ddlb_imprimante_code_barre.setImprimanteCourante( get_Imprimante_Code_Barre() )   <= 0 then
	// l'imprimante n'est pas / plus dans la liste => imprimante par défaut
	ddlb_imprimante_code_barre.setImprimanteCourante(ddlb_imprimante_code_barre.getimprimanteDefaut())
end if

end subroutine

event open;dw_fiche.settransobject(sqlca)

colore_datawindow(dw_fiche)

gb_1.backcolor = couleur_fond_datawindow

this.backcolor = couleur_fond_fenetre

centrer(this)

get_infos()






end event

on w_paramgene_stock.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.dw_fiche=create dw_fiche
this.ddlb_imprimante_code_barre=create ddlb_imprimante_code_barre
this.st_1=create st_1
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.dw_fiche
this.Control[iCurrent+5]=this.ddlb_imprimante_code_barre
this.Control[iCurrent+6]=this.st_1
this.Control[iCurrent+7]=this.gb_1
end on

on w_paramgene_stock.destroy
call super::destroy
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
destroy(this.dw_fiche)
destroy(this.ddlb_imprimante_code_barre)
destroy(this.st_1)
destroy(this.gb_1)
end on

type p_fond from w_fenetre_arakis`p_fond within w_paramgene_stock
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_paramgene_stock
integer x = 1339
integer y = 2204
integer width = 558
integer taborder = 60
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

if dw_fiche.update() = 1   then
	commit ;
else
	Rollback ;
end if


//Initialisation de la var globale multistock
if dw_fiche.getitemstring(1,"multistock") = "N" then
	multistock = false
else
	multistock = true
end if


// Mémorisation dans le .INI
Setprofilestring(dir_ini+"orthokis.ini","IMPRIMANTES","code_barre",ddlb_imprimante_code_barre.text)



end event

type cb_annuler from uo_picturebutton_390x120 within w_paramgene_stock
integer x = 750
integer y = 2204
integer width = 558
integer taborder = 50
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;


dw_fiche.retrieve()



end event

type cb_fermer from uo_picturebutton_390x120 within w_paramgene_stock
integer x = 1929
integer y = 2204
integer width = 558
integer taborder = 50
string text = "&Fermer"
boolean default = true
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

if dw_fiche.modifiedcount() > 0  then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type dw_fiche from datawindow within w_paramgene_stock
string tag = "brush"
integer x = 32
integer y = 28
integer width = 3109
integer height = 1692
integer taborder = 10
string title = "none"
string dataobject = "dw_paramgene_stock"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type ddlb_imprimante_code_barre from uo_liste_imprimantes within w_paramgene_stock
integer x = 878
integer y = 1876
integer taborder = 100
boolean bringtotop = true
end type

type st_1 from statictext within w_paramgene_stock
integer x = 101
integer y = 1884
integer width = 722
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Imprimante Code Barre :"
end type

type gb_1 from groupbox within w_paramgene_stock
integer x = 41
integer y = 1772
integer width = 3104
integer height = 272
integer taborder = 110
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
string text = "Paramètres Locaux"
end type

