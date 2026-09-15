$PBExportHeader$w_categorie_courriers_word_favoris.srw
$PBExportComments$Héritée de param
forward
global type w_categorie_courriers_word_favoris from w_param
end type
type dw_edition from datawindow within w_categorie_courriers_word_favoris
end type
type cb_imprimer from uo_picturebutton_390x120 within w_categorie_courriers_word_favoris
end type
end forward

global type w_categorie_courriers_word_favoris from w_param
string title = "Table des Catégories de Documents"
dw_edition dw_edition
cb_imprimer cb_imprimer
end type
global w_categorie_courriers_word_favoris w_categorie_courriers_word_favoris

type variables
double max


string v_type_commentaire		// Passé en paramètre ... C pour clienique , A pour administratif
end variables

forward prototypes
public subroutine filtrer ()
end prototypes

public subroutine filtrer ();// Filtre la datawindow pour

// les actifs


// sélection ou pas des inactifs ..
if cbx_avec_les_inactifs.checked then
	dw_liste.setfilter("")
else
	dw_liste.setfilter("actif = 1  ")
end if


dw_liste.filter()
end subroutine

on w_categorie_courriers_word_favoris.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_imprimer=create cb_imprimer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_imprimer
end on

on w_categorie_courriers_word_favoris.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_imprimer)
end on

event open;call super::open;

dw_edition.settransobject(SQLCA)
	
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



filtrer()




end event

type p_fond from w_param`p_fond within w_categorie_courriers_word_favoris
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_categorie_courriers_word_favoris
boolean visible = true
integer x = 59
integer y = 1992
end type

event pb_raz_ordre_trie::clicked;constant string col_name_ordre_trie = "ordre"
constant int ordre_par_defaut = 100

long nbr_row
nbr_row = dw_liste.rowcount()
long row
for row = 1 to nbr_row
	dw_liste.setItem(row, col_name_ordre_trie, ordre_par_defaut)
next
end event

type cb_annuler from w_param`cb_annuler within w_categorie_courriers_word_favoris
integer x = 2624
integer y = 1992
end type

type cb_enregistrer from w_param`cb_enregistrer within w_categorie_courriers_word_favoris
integer x = 3145
integer y = 1992
end type

type cb_fermer from w_param`cb_fermer within w_categorie_courriers_word_favoris
integer x = 3666
integer y = 1992
end type

type cb_supprimer from w_param`cb_supprimer within w_categorie_courriers_word_favoris
integer x = 1097
integer y = 1992
end type

type cb_ajouter from w_param`cb_ajouter within w_categorie_courriers_word_favoris
integer x = 631
integer y = 1992
end type

event cb_ajouter::clicked;
dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn("categorie")
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_categorie_courriers_word_favoris
integer x = 1042
integer y = 32
integer width = 2117
integer height = 1908
string dataobject = "dw_categorie_courrier_word_favoris_liste"
end type

type uo_1 from w_param`uo_1 within w_categorie_courriers_word_favoris
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_categorie_courriers_word_favoris
integer x = 1961
end type

event cbx_avec_les_inactifs::clicked;

filtrer()
end event

type gb_filtre from w_param`gb_filtre within w_categorie_courriers_word_favoris
integer x = 1847
end type

type dw_edition from datawindow within w_categorie_courriers_word_favoris
boolean visible = false
integer x = 151
integer y = 612
integer width = 494
integer height = 360
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_categorie_liste_edition"
boolean livescroll = true
end type

type cb_imprimer from uo_picturebutton_390x120 within w_categorie_courriers_word_favoris
boolean visible = false
integer x = 187
integer y = 1112
integer taborder = 50
boolean bringtotop = true
string text = "&Imprimer"
end type

event clicked;call super::clicked;dw_edition.retrieve()
dw_edition.print()
end event

