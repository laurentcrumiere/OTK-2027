$PBExportHeader$w_liste_corres_categorie.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_corres_categorie from w_liste_patients
end type
type dw_categorie from datawindow within w_liste_corres_categorie
end type
type st_2 from statictext within w_liste_corres_categorie
end type
end forward

global type w_liste_corres_categorie from w_liste_patients
string title = "Liste des Correspondants d~'une Catégorie"
dw_categorie dw_categorie
st_2 st_2
end type
global w_liste_corres_categorie w_liste_corres_categorie

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string catego

if not prepa_faite then
	//prepa_faite = true

	catego = dw_categorie.getitemstring(dw_categorie.getrow(),"code")
	open(w_patience)
	dw_liste.retrieve(catego)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

event open;call super::open;
dw_prati.visible = false

dw_categorie.settransobject(SQLCA)
dw_categorie.retrieve() 
end event

on w_liste_corres_categorie.create
int iCurrent
call super::create
this.dw_categorie=create dw_categorie
this.st_2=create st_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_categorie
this.Control[iCurrent+2]=this.st_2
end on

on w_liste_corres_categorie.destroy
call super::destroy
destroy(this.dw_categorie)
destroy(this.st_2)
end on

type p_fond from w_liste_patients`p_fond within w_liste_corres_categorie
integer x = 846
integer y = 460
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_corres_categorie
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_corres_categorie
end type

event cb_autre::clicked;call super::clicked;

st_min.visible = false
st_max.visible = false
em_min.visible = false
em_max.visible = false



end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_corres_categorie
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_corres_categorie
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_corres_categorie
end type

type uo_size from w_liste_patients`uo_size within w_liste_corres_categorie
end type

type rb_un from w_liste_patients`rb_un within w_liste_corres_categorie
boolean visible = false
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_corres_categorie
boolean visible = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_corres_categorie
end type

type em_max from w_liste_patients`em_max within w_liste_corres_categorie
boolean visible = false
end type

type em_min from w_liste_patients`em_min within w_liste_corres_categorie
boolean visible = false
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_corres_categorie
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_corres_categorie
boolean visible = false
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_corres_categorie
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_corres_categorie
end type

type st_min from w_liste_patients`st_min within w_liste_corres_categorie
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_liste_corres_categorie
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_corres_categorie
string dataobject = "dw_liste_corres_categorie"
end type

event dw_liste::rbuttondown;

//

end event

event dw_liste::doubleclicked;

//
end event

type dw_categorie from datawindow within w_liste_corres_categorie
string tag = "no resizeall"
integer x = 1006
integer y = 864
integer width = 1842
integer height = 72
integer taborder = 60
string dataobject = "dw_cherche_categorie"
boolean border = false
end type

type st_2 from statictext within w_liste_corres_categorie
integer x = 635
integer y = 864
integer width = 347
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Catégorie :"
end type

