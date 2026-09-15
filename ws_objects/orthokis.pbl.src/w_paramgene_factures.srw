$PBExportHeader$w_paramgene_factures.srw
forward
global type w_paramgene_factures from w_fenetre_arakis
end type
type cb_sel_entete from uo_picturebutton_780x120 within w_paramgene_factures
end type
type cb_sel_baspage from uo_picturebutton_780x120 within w_paramgene_factures
end type
type cb_maj_entete from uo_picturebutton_780x120 within w_paramgene_factures
end type
type cb_maj_bas from uo_picturebutton_780x120 within w_paramgene_factures
end type
type cb_fermer from uo_picturebutton_390x120 within w_paramgene_factures
end type
type cb_annuler from uo_picturebutton_390x120 within w_paramgene_factures
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_paramgene_factures
end type
type dw_fiche from datawindow within w_paramgene_factures
end type
end forward

global type w_paramgene_factures from w_fenetre_arakis
integer x = 18
integer y = 176
integer width = 3593
integer height = 2048
string title = "Paramètrages Factures (Note d~'Honoraires)"
windowtype windowtype = response!
long backcolor = 15780518
cb_sel_entete cb_sel_entete
cb_sel_baspage cb_sel_baspage
cb_maj_entete cb_maj_entete
cb_maj_bas cb_maj_bas
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
dw_fiche dw_fiche
end type
global w_paramgene_factures w_paramgene_factures

type variables
constant	integer		entete = 1
constant	integer		baspage = 2
end variables

forward prototypes
public subroutine maj_fichier (integer int_type)
end prototypes

public subroutine maj_fichier (integer int_type);// procédure qui maj ou crée (si celui-ci pas encore indiqué) le fichier d'entête ou bas page
// c selon le type (cf les constantes de la fenetre)

string		lstr_nom_champ
string		lstr_nom_fichier
string		lstr_titre
STRUCT_RTE mes
string		lstr_path_fichier
boolean	lb_suite


choose case int_type
	case entete
		lstr_nom_champ	= "nom_entete_facture"
		lstr_nom_fichier	= "entete_facture.rtf"
		lstr_titre			= "Mise à jour de l'entête"
		
	case baspage
		lstr_nom_champ	= "nom_baspage_facture"
		lstr_nom_fichier	= "baspage_facture.rtf"
		lstr_titre			= "Mise à jour du bas de page"
		
	case else
		return
		
end choose
	
	

lstr_path_fichier = dw_fiche.getitemstring(1,lstr_nom_champ)
if isnull(lstr_path_fichier) OR lstr_path_fichier = "" then 
// pas de fichier de config
	lstr_path_fichier = fxg_get_rep_courriers ()
	if lstr_path_fichier <> "" then
	// un rep courrier est bien config
		// on crée le path complet du fichier
		lstr_path_fichier = lstr_path_fichier + lstr_nom_fichier
		// Mise à jour du champ courrier de la fiche
		dw_fiche.setitem(dw_fiche.getrow(),lstr_nom_champ,lstr_path_fichier)
		
		lb_suite = true
	else
	// pas de rep courrier de vonfig
		messagebox("ATTENTION","Configurez tout d'abord un répertoire courrier valide.", Exclamation!)
	end if
else
// un path est indiqué
	lb_suite = true
end if

if lb_suite then
	mes.nom_dw = "dw_lettre_type"
	mes.chemin = lstr_path_fichier
	mes.nom_menu =  "entete"
	
	mes.titre = lstr_titre
	openwithParm(w_rte,mes)
end if
end subroutine

event open;call super::open;dw_fiche.settransobject(sqlca)
dw_fiche.retrieve()

centrer_selon_w_mdi_2020(this)

colore_datawindow(dw_fiche)



end event

on w_paramgene_factures.create
int iCurrent
call super::create
this.cb_sel_entete=create cb_sel_entete
this.cb_sel_baspage=create cb_sel_baspage
this.cb_maj_entete=create cb_maj_entete
this.cb_maj_bas=create cb_maj_bas
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.dw_fiche=create dw_fiche
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_sel_entete
this.Control[iCurrent+2]=this.cb_sel_baspage
this.Control[iCurrent+3]=this.cb_maj_entete
this.Control[iCurrent+4]=this.cb_maj_bas
this.Control[iCurrent+5]=this.cb_fermer
this.Control[iCurrent+6]=this.cb_annuler
this.Control[iCurrent+7]=this.cb_enregistrer
this.Control[iCurrent+8]=this.dw_fiche
end on

on w_paramgene_factures.destroy
call super::destroy
destroy(this.cb_sel_entete)
destroy(this.cb_sel_baspage)
destroy(this.cb_maj_entete)
destroy(this.cb_maj_bas)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.dw_fiche)
end on

type p_fond from w_fenetre_arakis`p_fond within w_paramgene_factures
end type

type cb_sel_entete from uo_picturebutton_780x120 within w_paramgene_factures
integer x = 64
integer y = 1552
integer taborder = 20
string text = "Sélection Entête"
end type

event clicked;call super::clicked;string chemin, fichier


if getfileopenname("Sélectionner un fichier",chemin,fichier,"rtf","Fichiers RichText (*.rtf),*.rtf") = 1 then
// le nouveau nom est bon
	// Mise à jour du champ courrier de la fiche
	dw_fiche.setitem(dw_fiche.getrow(),"nom_entete_facture",chemin)
//	if right(fichier, 4) = ".doc" then
//	// si le fichier est un doc word : cf extension
//		// on transfo le chemin complet comme souhaité pour nouveau lien word
//		chemin = fxg_dir_2_format_dir(chemin)
//		// Mise à jour du champ courrier (invisible) du nouveau lien word
//		dw_fiche.setitem(dw_fiche.getrow(),"chemin_complet_entete",chemin)
//	end if
end if

end event

type cb_sel_baspage from uo_picturebutton_780x120 within w_paramgene_factures
integer x = 837
integer y = 1552
integer taborder = 20
string text = "Sélection Bas de Page"
end type

event clicked;call super::clicked;string chemin, fichier


if getfileopenname("Sélectionner un fichier",chemin,fichier,"rtf","Fichiers RichText (*.rtf),*.rtf") = 1 then
// le nouveau nom est bon
	// Mise à jour du champ courrier de la fiche
	dw_fiche.setitem(dw_fiche.getrow(),"nom_baspage_facture",chemin)
//	if right(fichier, 4) = ".doc" then
//	// si le fichier est un doc word : cf extension
//		// on transfo le chemin complet comme souhaité pour nouveau lien word
//		chemin = fxg_dir_2_format_dir(chemin)
//		// Mise à jour du champ courrier (invisible) du nouveau lien word
//		dw_fiche.setitem(dw_fiche.getrow(),"chemin_complet_entete",chemin)
//	end if
end if

end event

type cb_maj_entete from uo_picturebutton_780x120 within w_paramgene_factures
integer x = 64
integer y = 1708
integer taborder = 20
string text = "MàJ Entête"
end type

event clicked;call super::clicked;maj_fichier(entete)
end event

type cb_maj_bas from uo_picturebutton_780x120 within w_paramgene_factures
integer x = 837
integer y = 1708
integer taborder = 20
string text = "MàJ Bas de Page"
end type

event clicked;call super::clicked;maj_fichier(baspage)
end event

type cb_fermer from uo_picturebutton_390x120 within w_paramgene_factures
integer x = 2935
integer y = 1648
integer width = 494
integer taborder = 20
string text = "&Fermer"
boolean default = true
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

if dw_fiche.modifiedcount() > 0  then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!,2 ) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_paramgene_factures
integer x = 1929
integer y = 1648
integer width = 494
integer taborder = 20
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;dw_fiche.retrieve()



end event

type cb_enregistrer from uo_picturebutton_390x120 within w_paramgene_factures
integer x = 2432
integer y = 1648
integer width = 494
integer taborder = 20
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

if dw_fiche.update() = 1   then
	commit ;
else
	Rollback ;
end if



end event

type dw_fiche from datawindow within w_paramgene_factures
string tag = "brush"
integer x = 27
integer y = 32
integer width = 3497
integer height = 1480
integer taborder = 10
string title = "none"
string dataobject = "dw_paramgene_factures"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

