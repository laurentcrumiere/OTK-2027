$PBExportHeader$w_correspondants_sans_patient_actif.srw
forward
global type w_correspondants_sans_patient_actif from w_fenetre_arakis
end type
type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
end type
type cb_annuler from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
end type
type cb_1 from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
end type
type cb_exporter from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
end type
type cb_fermer from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
end type
type dw_liste from u_basedw within w_correspondants_sans_patient_actif
end type
type uo_1 from resize_fenetre within w_correspondants_sans_patient_actif
end type
type cbx_avec_les_inactifs from u_cst_togglebutton within w_correspondants_sans_patient_actif
end type
end forward

global type w_correspondants_sans_patient_actif from w_fenetre_arakis
integer x = 18
integer y = 224
integer width = 4247
integer height = 2296
string title = "Liste des Correspondants sans Patient Actif"
windowtype windowtype = child!
long backcolor = 15780518
boolean center = true
pb_raz_ordre_trie pb_raz_ordre_trie
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_1 cb_1
cb_exporter cb_exporter
cb_fermer cb_fermer
dw_liste dw_liste
uo_1 uo_1
cbx_avec_les_inactifs cbx_avec_les_inactifs
end type
global w_correspondants_sans_patient_actif w_correspondants_sans_patient_actif

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

string v_filtre

n_cst_PowerFilter iu_PowerFilter

double increment 
end variables

event open;call super::open;colore_tous_objets_window(this, couleur_fond_fenetre)
uo_1.taille(this)

open(w_patience)

long max_row 
SELECT count(*) INTO :max_row  from correspondants ;

increment = integer(max_row / 10)



dw_liste.settransobject(SQLCA)
dw_liste.retrieve('%')

//
//if enregistrement_automatique then 
//	cb_annuler.visible = false
//	cb_enregistrer.visible = false
//	
//end if

cbx_avec_les_inactifs.backcolor = this.backcolor

v_filtre = "nb_cor + nb_den + nb_aut + nb_aut2+ nb_aut3 + nb_aut4 = 0"
// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter(v_filtre + " and actif = 1")
end if
dw_liste.filter()


close(w_patience)


end event

on w_correspondants_sans_patient_actif.create
int iCurrent
call super::create
this.pb_raz_ordre_trie=create pb_raz_ordre_trie
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_1=create cb_1
this.cb_exporter=create cb_exporter
this.cb_fermer=create cb_fermer
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.cbx_avec_les_inactifs=create cbx_avec_les_inactifs
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_raz_ordre_trie
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_enregistrer
this.Control[iCurrent+4]=this.cb_1
this.Control[iCurrent+5]=this.cb_exporter
this.Control[iCurrent+6]=this.cb_fermer
this.Control[iCurrent+7]=this.dw_liste
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.cbx_avec_les_inactifs
end on

on w_correspondants_sans_patient_actif.destroy
call super::destroy
destroy(this.pb_raz_ordre_trie)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_1)
destroy(this.cb_exporter)
destroy(this.cb_fermer)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.cbx_avec_les_inactifs)
end on

event resize;call super::resize;uo_1.retaille(this)


end event

event close;call super::close;if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_correspondants_sans_patient_actif
end type

type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
boolean visible = false
integer x = 942
integer y = 1856
integer width = 626
integer taborder = 21
string text = "&Trier par défaut"
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

type cb_annuler from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
integer x = 2441
integer y = 1992
integer width = 453
integer taborder = 21
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
dw_liste.retrieve('%') ;
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
integer x = 2949
integer y = 1992
integer width = 453
integer taborder = 21
string text = "&Enregistrer"
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

type cb_1 from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
integer x = 443
integer y = 1992
integer width = 453
integer taborder = 30
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_liste.print()
end if
end event

type cb_exporter from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
integer x = 951
integer y = 1992
integer width = 453
integer taborder = 30
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type cb_fermer from uo_picturebutton_390x120 within w_correspondants_sans_patient_actif
integer x = 3456
integer y = 1992
integer width = 453
integer taborder = 30
string text = "&Fermer"
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

type dw_liste from u_basedw within w_correspondants_sans_patient_actif
event ue_leftbuttonup pbm_dwnlbuttonup
string tag = "no resize brush centrer"
integer x = 210
integer y = 32
integer width = 3689
integer height = 1912
integer taborder = 20
string dataobject = "dw_corresp_liste_sans_patient_actif"
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event itemchanged;call super::itemchanged;//
//
//if enregistrement_automatique and cb_enregistrer.enabled then
//	cb_enregistrer.triggerevent(clicked!)
//end if
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

event retrieverow;call super::retrieverow;maj_patience(row,increment)
end event

type uo_1 from resize_fenetre within w_correspondants_sans_patient_actif
boolean visible = false
integer x = 411
integer y = 452
integer taborder = 11
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cbx_avec_les_inactifs from u_cst_togglebutton within w_correspondants_sans_patient_actif
event destroy ( )
integer x = 1669
integer y = 1992
integer width = 571
integer height = 96
integer taborder = 50
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

