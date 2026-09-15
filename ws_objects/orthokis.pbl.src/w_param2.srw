$PBExportHeader$w_param2.srw
forward
global type w_param2 from w_fenetre_arakis
end type
type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_param2
end type
type cb_annuler from uo_picturebutton_390x120 within w_param2
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_param2
end type
type cb_ajouter from uo_picturebutton_390x120 within w_param2
end type
type cb_modifier from uo_picturebutton_390x120 within w_param2
end type
type cb_supprimer from uo_picturebutton_390x120 within w_param2
end type
type cb_1 from uo_picturebutton_390x120 within w_param2
end type
type cb_chercher from uo_picturebutton_390x120 within w_param2
end type
type cb_exporter from uo_picturebutton_390x120 within w_param2
end type
type cb_fermer from uo_picturebutton_390x120 within w_param2
end type
type dw_liste from u_basedw within w_param2
end type
type uo_1 from resize_fenetre within w_param2
end type
type dw_liste_edition from datawindow within w_param2
end type
type cbx_avec_les_inactifs from u_cst_togglebutton within w_param2
end type
type gb_filtre from groupbox within w_param2
end type
end forward

global type w_param2 from w_fenetre_arakis
integer x = 18
integer y = 224
integer width = 4247
integer height = 2296
string title = "Fichier des Dentistes Traitants"
windowtype windowtype = child!
pb_raz_ordre_trie pb_raz_ordre_trie
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_ajouter cb_ajouter
cb_modifier cb_modifier
cb_supprimer cb_supprimer
cb_1 cb_1
cb_chercher cb_chercher
cb_exporter cb_exporter
cb_fermer cb_fermer
dw_liste dw_liste
uo_1 uo_1
dw_liste_edition dw_liste_edition
cbx_avec_les_inactifs cbx_avec_les_inactifs
gb_filtre gb_filtre
end type
global w_param2 w_param2

type variables
window w_fille
string var_fille


w_adresse_fiche w_af
w_corres_fiche w_cf
w_mutuelle_fiche w_mf
w_caisse_fiche w_cf2
w_soins_fiche w_s
w_plan_ttt_fiche w_pttt

w_utilisateur_fiche w_uf
w_utilisateur_fiche w_uf_v10



boolean verification_ordre_par_defaut = false
string v_nom_table_a_verifier = ""


n_cst_PowerFilter iu_PowerFilter
end variables

forward prototypes
public subroutine ouvrir_fille (string v_argument)
end prototypes

public subroutine ouvrir_fille (string v_argument);	choose case var_fille
		case "w_adresse_fiche"
			w_adresse_fiche lw_adresse_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_adresse_fiche, v_argument)	
		case "w_caisse_fiche"
			w_caisse_fiche lw_caisse_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_caisse_fiche, v_argument)	
		case "w_corres_fiche"
			w_corres_fiche lw_corres_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_corres_fiche, v_argument)	
		case "w_diagnostic_fiche"
			w_diagnostic_fiche lw_diagnostic_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_diagnostic_fiche, v_argument)	
		case "w_ecole_fiche"
			w_ecole_fiche lw_ecole_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_ecole_fiche, v_argument)	
		case "w_mutuelle_fiche"
			w_mutuelle_fiche lw_mutuelle_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_mutuelle_fiche, v_argument)	
		case "w_plan_ttt_fiche"
			w_plan_ttt_fiche lw_plan_ttt_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_plan_ttt_fiche, v_argument)	
		case "w_soins_fiche"
			w_soins_fiche lw_soins_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_soins_fiche, v_argument)	
		case "w_taches_defaut_fiche"
			w_taches_defaut_fiche lw_taches_defaut_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_taches_defaut_fiche, v_argument)	
		case "w_type_rdv_fiche"
			w_type_rdv_fiche lw_types_rdv_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_types_rdv_fiche, v_argument)	
		case "w_utilisateur_fiche"
			w_utilisateur_fiche lw_utilisateur_fiche
			guo_fenetre_modale.wf_ouvrir_param_string(lw_utilisateur_fiche, v_argument)	
		case else
			OpenWithParm(W_fille,v_argument,var_fille)
	end choose
	

end subroutine

event open;call super::open;var_fille = "w_af"
dw_liste.settransobject(SQLCA)
dw_liste.retrieve('%')
dw_liste_edition.settransobject(SQLCA)

uo_1.taille(this)

if enregistrement_automatique then 
	cb_annuler.visible = false
	cb_enregistrer.visible = false
	
end if

cbx_avec_les_inactifs.backcolor = this.backcolor

// pour éliminer de base les inactifs .. mais que pour les tables concernées ..
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if

end event

on w_param2.create
int iCurrent
call super::create
this.pb_raz_ordre_trie=create pb_raz_ordre_trie
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_ajouter=create cb_ajouter
this.cb_modifier=create cb_modifier
this.cb_supprimer=create cb_supprimer
this.cb_1=create cb_1
this.cb_chercher=create cb_chercher
this.cb_exporter=create cb_exporter
this.cb_fermer=create cb_fermer
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.dw_liste_edition=create dw_liste_edition
this.cbx_avec_les_inactifs=create cbx_avec_les_inactifs
this.gb_filtre=create gb_filtre
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_raz_ordre_trie
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_enregistrer
this.Control[iCurrent+4]=this.cb_ajouter
this.Control[iCurrent+5]=this.cb_modifier
this.Control[iCurrent+6]=this.cb_supprimer
this.Control[iCurrent+7]=this.cb_1
this.Control[iCurrent+8]=this.cb_chercher
this.Control[iCurrent+9]=this.cb_exporter
this.Control[iCurrent+10]=this.cb_fermer
this.Control[iCurrent+11]=this.dw_liste
this.Control[iCurrent+12]=this.uo_1
this.Control[iCurrent+13]=this.dw_liste_edition
this.Control[iCurrent+14]=this.cbx_avec_les_inactifs
this.Control[iCurrent+15]=this.gb_filtre
end on

on w_param2.destroy
call super::destroy
destroy(this.pb_raz_ordre_trie)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_ajouter)
destroy(this.cb_modifier)
destroy(this.cb_supprimer)
destroy(this.cb_1)
destroy(this.cb_chercher)
destroy(this.cb_exporter)
destroy(this.cb_fermer)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.dw_liste_edition)
destroy(this.cbx_avec_les_inactifs)
destroy(this.gb_filtre)
end on

event resize;uo_1.retaille(this)

// repositionnement 
//cbx_avec_les_inactifs.x = gb_filtre.x + 55
//cbx_avec_les_inactifs.y = gb_filtre.y + 55
//


// pour qu'il se resize mais ... pas trop 
cbx_avec_les_inactifs.height = min(cbx_avec_les_inactifs.height, cb_enregistrer.height)
end event

event close;call super::close;if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_param2
end type

type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_param2
boolean visible = false
integer x = 942
integer y = 1852
integer width = 626
integer height = 124
integer taborder = 21
string text = "&Trier par défaut"
boolean ellipsis = false
string iconname = "ACTIONS_trier.png"
end type

event clicked;call super::clicked;if MessageBox("ATTENTION","Vous allez réinitialiser les ordres de tri à 100 pour tous les éléments.~n~nSi vous confirmez, vous devrez ensuite définir une élément par défaut en lui donnant '1' comme ordre de tri.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	constant string col_name_ordre_trie = "ordre_trie"
	constant int ordre_par_defaut = 100
	
	long nbr_row
	nbr_row = dw_liste.rowcount()
	long row
	for row = 1 to nbr_row
		dw_liste.setItem(row, col_name_ordre_trie, ordre_par_defaut)
	next
end if
end event

type cb_annuler from uo_picturebutton_390x120 within w_param2
integer x = 2679
integer y = 1992
integer width = 448
integer height = 148
integer taborder = 21
string text = "&Annuler"
boolean ellipsis = false
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
dw_liste.retrieve('%') ;
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_param2
integer x = 3182
integer y = 1992
integer width = 448
integer height = 148
integer taborder = 21
string text = "&Enregistrer"
boolean ellipsis = false
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()
if dw_liste.update() = 1 then
	commit ;
	// si tout va bien on retrieve pour remetre l'ordre entre autre
	if not enregistrement_automatique  then
		cb_annuler.TriggerEvent(Clicked!)
	end if
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if


end event

type cb_ajouter from uo_picturebutton_390x120 within w_param2
integer x = 27
integer y = 1856
integer width = 448
integer height = 148
integer taborder = 30
string text = "&Ajouter"
boolean ellipsis = false
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;// Passage de paramètres entre windows
	//OpenSheetWithParm(W_fille,"      ",var_fille,w_mdi,0,layered!)

	ouvrir_fille("      ")


//	parent.triggerevent(resize!)
	dw_liste.retrieve('%')



end event

type cb_modifier from uo_picturebutton_390x120 within w_param2
integer x = 485
integer y = 1856
integer width = 448
integer height = 148
integer taborder = 30
string text = "&Modifier"
boolean ellipsis = false
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
//	OpenSheetWithParm(W_fille,dw_liste.getitemstring(dw_liste.getrow(),"code"),var_fille,w_mdi,0,layered!)
	
	string v_code 
	v_code = dw_liste.getitemstring(dw_liste.getrow(),"code")
	
	ouvrir_fille(v_code)
	//OpenWithParm(W_fille, v_code, var_fille)
	
	dw_liste.retrieve('%')
	long lig 
	lig = dw_liste.Find("Code = '"+v_code+"'" , 0, dw_liste.rowcount())
	
	if lig > 0 then 
		dw_liste.Scrolltorow(lig)
		dw_liste.Setrow(lig)
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(lig,True)
	end if
end if



end event

type cb_supprimer from uo_picturebutton_390x120 within w_param2
integer x = 27
integer y = 2016
integer width = 448
integer height = 148
integer taborder = 30
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	son(7)
	dw_liste.deleterow(dw_liste.getrow())
end if

if enregistrement_automatique then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

type cb_1 from uo_picturebutton_390x120 within w_param2
integer x = 485
integer y = 2016
integer width = 448
integer height = 148
integer taborder = 30
string text = "&Imprimer"
boolean ellipsis = false
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?", Question!, YesNo!, 2) = 1 then 
	dw_liste_edition.retrieve()
	dw_liste_edition.print()
end if
end event

type cb_chercher from uo_picturebutton_390x120 within w_param2
integer x = 942
integer y = 2016
integer width = 448
integer height = 148
integer taborder = 30
string text = "&Chercher"
boolean ellipsis = false
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
//	OpenSheetWithParm(W_fille,dw_liste.getitemstring(dw_liste.getrow(),"code"),var_fille,w_mdi,0,layered!)
	var_suite = false
	OpenWithParm(W_cherche_table,dw_liste.dataObject)
	if var_suite then
		// On récupère le code renvoyer par la recherche
		//OpenWithParm(W_fille,Message.StringParm,var_fille)
		ouvrir_fille(Message.StringParm)
//		parent.triggerevent(resize!)
		dw_liste.retrieve('%')	
	end if
end if

end event

type cb_exporter from uo_picturebutton_390x120 within w_param2
integer x = 1399
integer y = 2016
integer width = 448
integer height = 148
integer taborder = 30
string text = "&Exporter"
boolean ellipsis = false
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;//dw_liste_edition.retrieve()
dw_liste.saveas()
end event

type cb_fermer from uo_picturebutton_390x120 within w_param2
integer x = 3685
integer y = 1992
integer width = 448
integer height = 148
integer taborder = 30
string text = "&Fermer"
boolean ellipsis = false
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;boolean faut_fermer = false

dw_liste.accepttext()

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.TriggerEvent(Clicked!)
	faut_fermer = true
else
	if (dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0) and cb_enregistrer.enabled Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur la Table !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!,2 ) = 1 Then
			faut_fermer = true
		end if
	else
		faut_fermer = true
	end if
end if



if faut_fermer then
	
	if verification_ordre_par_defaut then 
		long v_cpt
		string cde
		
		DECLARE my_cursor DYNAMIC CURSOR FOR SQLSA ;
		cde = "select count(*) from " + v_nom_table_a_verifier + " where ordre_trie = (select min(ordre_trie) from " + v_nom_table_a_verifier +" where actif = 1) ;"
		PREPARE SQLSA FROM :cde ;
		OPEN DYNAMIC my_cursor  ;
		FETCH my_cursor INTO :v_cpt ;
		CLOSE my_cursor ;
				
		if v_cpt <> 1 then
			Messagebox("ATTENTION","Cette table nécessite d'avoir un élément 'Par défaut', avec une valeur d'ordre de tri unique.~n~nMerci de corriger !")
		else

			fermer_fenetre(parent)
		end if
	else
		fermer_fenetre(parent)
	end if
end if


end event

type dw_liste from u_basedw within w_param2
event ue_leftbuttonup pbm_dwnlbuttonup
string tag = "no resize brush"
integer x = 914
integer y = 32
integer width = 2139
integer height = 1776
integer taborder = 20
string dataobject = "dw_adresse_liste"
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event clicked;call super::clicked;

//If row > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(row,True)
//	
//	
//End If
//

if enregistrement_automatique and cb_enregistrer.enabled then

	if (dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0)  Then
		
		cb_enregistrer.triggerevent(clicked!) 

	end if
end if
end event

event doubleclicked;call super::doubleclicked;if ROW > 0 and cb_modifier.enabled  then
	// On ajoute une tempo sinon le 2ème clique porte sur la fenêtre qu'on ouvre => Etonnant !!!!!!!
	sleep(100)
	cb_modifier.triggerevent(clicked!)
end if

end event

event itemchanged;call super::itemchanged;

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if
end event

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1
end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event resize;call super::resize;iu_PowerFilter.event ue_positionbuttons()
end event

type uo_1 from resize_fenetre within w_param2
boolean visible = false
integer x = 411
integer y = 452
integer taborder = 11
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_liste_edition from datawindow within w_param2
boolean visible = false
integer x = 37
integer y = 624
integer width = 494
integer height = 360
integer taborder = 20
string dataobject = "dw_caisse_liste_edition"
boolean livescroll = true
end type

type cbx_avec_les_inactifs from u_cst_togglebutton within w_param2
event destroy ( )
integer x = 1911
integer y = 2004
integer width = 681
integer height = 96
integer taborder = 40
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_avec_les_inactifs.destroy
call u_cst_togglebutton::destroy
end on

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


// Par défaut, on filtre les actifs
dw_liste.setfilter("actif = 1")
dw_liste.filter()


end event

type gb_filtre from groupbox within w_param2
string tag = "ne sert plus"
boolean visible = false
integer x = 37
integer y = 1164
integer width = 549
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "none"
borderstyle borderstyle = styleraised!
end type

type uo_ribbonstatusbar from w_ribbonwindow`uo_ribbonstatusbar within w_param2
end type

type sle_ribbonwindowfocuscontrol from w_ribbonwindow`sle_ribbonwindowfocuscontrol within w_param2
end type

type uo_ribbonmenu from w_ribbonwindow`uo_ribbonmenu within w_param2
end type

type uo_ribbon from w_ribbonwindow`uo_ribbon within w_param2
end type

