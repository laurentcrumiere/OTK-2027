$PBExportHeader$w_prati.srw
forward
global type w_prati from window
end type
type cb_syncho_tea from uo_picturebutton_390x120 within w_prati
end type
type dw_liste_pour_tea from u_basedw within w_prati
end type
type cb_ehealth from uo_picturebutton_780x120 within w_prati
end type
type cbx_avec_les_inactifs from checkbox within w_prati
end type
type p_fond from picture within w_prati
end type
type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_prati
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_prati
end type
type cb_annuler from uo_picturebutton_390x120 within w_prati
end type
type cb_supprimer from uo_picturebutton_390x120 within w_prati
end type
type cb_analyse from uo_picturebutton_780x120 within w_prati
end type
type cb_modifier from uo_picturebutton_390x120 within w_prati
end type
type cb_recalcul from uo_picturebutton_390x120 within w_prati
end type
type cb_ajouter from uo_picturebutton_390x120 within w_prati
end type
type cb_defaut from uo_picturebutton_780x120 within w_prati
end type
type cb_fermer from uo_picturebutton_390x120 within w_prati
end type
type dw_liste from u_basedw within w_prati
end type
type uo_1 from resize_fenetre within w_prati
end type
type gb_filtre from groupbox within w_prati
end type
end forward

global type w_prati from window
integer x = 32
integer y = 176
integer width = 4306
integer height = 1868
boolean titlebar = true
string title = "Table des Praticiens"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = child!
long backcolor = 16777215
cb_syncho_tea cb_syncho_tea
dw_liste_pour_tea dw_liste_pour_tea
cb_ehealth cb_ehealth
cbx_avec_les_inactifs cbx_avec_les_inactifs
p_fond p_fond
pb_raz_ordre_trie pb_raz_ordre_trie
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_supprimer cb_supprimer
cb_analyse cb_analyse
cb_modifier cb_modifier
cb_recalcul cb_recalcul
cb_ajouter cb_ajouter
cb_defaut cb_defaut
cb_fermer cb_fermer
dw_liste dw_liste
uo_1 uo_1
gb_filtre gb_filtre
end type
global w_prati w_prati

type variables

end variables

forward prototypes
public subroutine verification_suppression_pour_tea ()
end prototypes

public subroutine verification_suppression_pour_tea ();// Principe : parcours de dw_liste_pour_tea (chargée à l'ouverture de la fenetre et jamais modifiéé) pour tester la présence en base de données
// Si plus en base ... on supprime 

long lig, tot, cpt
string v_code_praticien
integer v_actif

tot = dw_liste_pour_tea.rowcount()

for lig = 1 to tot 
	v_code_praticien = dw_liste_pour_tea.getitemstring(lig, "code")
	
	select isnull(count(*),0), min(actif)  into :cpt, :v_actif from prati where code = :v_code_praticien ;
	
	if cpt = 0 then
		// il a été supprimé 
		fxg_lancer_commande_dsapi("practitioner/delete/" + v_code_praticien, "",  "PR", "G" , 0)
	else
		
		if dw_liste_pour_tea.getitemNumber(lig, "actif") <> v_actif then
			// il a été activé ou désactivé 
			fxg_lancer_commande_dsapi("practitioner/update/" + v_code_praticien, "",  "PR", "G" , 0)
		end if
	end if
	
next

// mise à jour de la liste de référence
dw_liste_pour_tea.retrieve()





end subroutine

event open;If Not Multi then
	cb_ajouter.enabled = false
end if
dw_liste.settransobject(SQLCA)
dw_liste.retrieve()


if TEA then
	// servira, à la fermeture de la fenêtre à vérifier si praticien toujours présent en BD ou s'il doit être supprimé de Téa
	dw_liste_pour_tea.settransobject(SQLCA)
	dw_liste_pour_tea.retrieve()
	cb_syncho_tea.visible = true
end if


uo_1.taille(this)

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


//// VERSION DE DEMO .. PAS D'AJOUT NI NE MODIF 
//if demo then
//		cb_ajouter.enabled = false
//		cb_supprimer.enabled = false
//		cb_enregistrer.enabled = false
//end if


// Calcul des totaux de patients à chaque entrée comme ça !!!

open(w_patience)
// Mise à jour de prati
UPDATE prati SET nombre = (SELECT Count(*) FROM patient WHERE Patient.code_praticien = prati.code) ;
COMMIT ;
close(w_patience)

// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if


// cb_eHealth
cb_eHealth.visible = BELGIQUE


end event

on w_prati.create
this.cb_syncho_tea=create cb_syncho_tea
this.dw_liste_pour_tea=create dw_liste_pour_tea
this.cb_ehealth=create cb_ehealth
this.cbx_avec_les_inactifs=create cbx_avec_les_inactifs
this.p_fond=create p_fond
this.pb_raz_ordre_trie=create pb_raz_ordre_trie
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_supprimer=create cb_supprimer
this.cb_analyse=create cb_analyse
this.cb_modifier=create cb_modifier
this.cb_recalcul=create cb_recalcul
this.cb_ajouter=create cb_ajouter
this.cb_defaut=create cb_defaut
this.cb_fermer=create cb_fermer
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.gb_filtre=create gb_filtre
this.Control[]={this.cb_syncho_tea,&
this.dw_liste_pour_tea,&
this.cb_ehealth,&
this.cbx_avec_les_inactifs,&
this.p_fond,&
this.pb_raz_ordre_trie,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_supprimer,&
this.cb_analyse,&
this.cb_modifier,&
this.cb_recalcul,&
this.cb_ajouter,&
this.cb_defaut,&
this.cb_fermer,&
this.dw_liste,&
this.uo_1,&
this.gb_filtre}
end on

on w_prati.destroy
destroy(this.cb_syncho_tea)
destroy(this.dw_liste_pour_tea)
destroy(this.cb_ehealth)
destroy(this.cbx_avec_les_inactifs)
destroy(this.p_fond)
destroy(this.pb_raz_ordre_trie)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_supprimer)
destroy(this.cb_analyse)
destroy(this.cb_modifier)
destroy(this.cb_recalcul)
destroy(this.cb_ajouter)
destroy(this.cb_defaut)
destroy(this.cb_fermer)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.gb_filtre)
end on

event resize;uo_1.retaille(this)

// repositionnement 
cbx_avec_les_inactifs.x = gb_filtre.x + 55
cbx_avec_les_inactifs.y = gb_filtre.y + 55


end event

event activate;if (dw_liste.rowcount() > 0) and (dw_liste.GetSelectedRow(0) = 0)Then
	dw_liste.SelectRow(0,False)
	dw_liste.SelectRow(1,True) 
End If
end event

event close;if TEA then 
	verification_suppression_pour_tea()
end if

end event

type cb_syncho_tea from uo_picturebutton_390x120 within w_prati
boolean visible = false
integer x = 3159
integer y = 1512
integer width = 448
integer height = 148
integer taborder = 41
boolean bringtotop = true
string text = "Sync. Téa"
string iconname = "ACTIONS_stock_generer_selon_index.png"
end type

event clicked;call super::clicked;if messagebox("CONFIRMATION", "Vous allez synchroniser tous vos praticiens avec Téa.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	if fxg_lancer_commande_dsapi("practitioner/sync" , "",  "TR", "G", 0 ) then
		Messagebox("INFORMATION", "Synchronisation lancée avec succès !")
	end if	
end if

end event

type dw_liste_pour_tea from u_basedw within w_prati
boolean visible = false
integer x = 64
integer y = 836
integer width = 1143
integer height = 488
integer taborder = 21
string dataobject = "dw_prati_liste"
end type

type cb_ehealth from uo_picturebutton_780x120 within w_prati
boolean visible = false
integer x = 2866
integer y = 1352
integer width = 430
integer taborder = 51
boolean bringtotop = true
string text = "eHealth"
string tiptext = "Gestion eHealth / Génération d~'envois d~'eFactures fictifs (si reprise ou x cabinet pour 1 praticien)"
end type

event clicked;call super::clicked;// Administration de eHeath

datawindow dw_null
fxg_ehealth ("C", 0, dw_null )

end event

event rbuttondown;call super::rbuttondown;

// Fonctionnalité spécifique à la efactutation pour ajouter des envois , en cas de transfert, afin de suivre la numération


ok_mdp = false
guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)	

if ok_mdp then
	
	open(w_efacturation_belgique_ajout_envoi)
	
end if
	
end event

type cbx_avec_les_inactifs from checkbox within w_prati
string tag = "no resize all"
integer x = 1545
integer y = 1504
integer width = 558
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Avec les inactifs"
borderstyle borderstyle = styleraised!
end type

event clicked;
// sélection ou pas des inactifs ..
if this.checked then
	dw_liste.setfilter("")
else
	dw_liste.setfilter("actif = 1")
end if

dw_liste.filter()

end event

type p_fond from picture within w_prati
string tag = "fond"
boolean visible = false
integer x = 617
integer y = 808
integer width = 293
integer height = 152
boolean enabled = false
boolean focusrectangle = false
end type

type pb_raz_ordre_trie from uo_picturebutton_390x120 within w_prati
integer x = 2162
integer y = 1352
integer width = 576
integer taborder = 41
string text = "&Trier par défaut"
string iconname = "ACTIONS_trier.png"
end type

event clicked;call super::clicked;constant string col_name_ordre_trie = "ordre_trie"
constant int ordre_par_defaut = 100

long nbr_row
nbr_row = dw_liste.rowcount()
long row
for row = 1 to nbr_row
	dw_liste.setItem(row, col_name_ordre_trie, ordre_par_defaut)
next
end event

type cb_enregistrer from uo_picturebutton_390x120 within w_prati
integer x = 2661
integer y = 1512
integer width = 494
integer taborder = 31
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()

if dw_liste.update() = 1 then
	commit ;
	
	if TEA then
		verification_suppression_pour_tea()
	end if
	
	// si tout va bien on retrieve pour remetre l'ordre entre autre
	cb_annuler.TriggerEvent(Clicked!)
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_prati
integer x = 2162
integer y = 1512
integer width = 494
integer taborder = 31
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
dw_liste.retrieve();
parent.TriggerEvent( activate!)
end event

type cb_supprimer from uo_picturebutton_390x120 within w_prati
integer x = 969
integer y = 1352
integer width = 462
integer taborder = 31
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	son(7)
	dw_liste.deleterow(dw_liste.getrow())
end if
end event

type cb_analyse from uo_picturebutton_780x120 within w_prati
integer x = 503
integer y = 1512
integer width = 928
integer taborder = 31
string text = "Analyse / Type Dossiers"
string iconname = "ACTIONS_analyser.png"
end type

event clicked;call super::clicked;open(w_analyse_prati_dossiers)
end event

type cb_modifier from uo_picturebutton_390x120 within w_prati
integer x = 503
integer y = 1352
integer width = 462
integer taborder = 31
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;// Passage de paramètres entre windows

W_prati_fiche lw_prati_fiche

if isvalid(guo_fenetre_modale) then
	guo_fenetre_modale.wf_ouvrir_param_string(lw_prati_fiche, dw_liste.getitemstring(dw_liste.getrow(),"code"))
else
	OpenWithParm(W_prati_fiche,dw_liste.getitemstring(dw_liste.getrow(),"code"))
end if


dw_liste.retrieve()
parent.TriggerEvent( activate!)

end event

type cb_recalcul from uo_picturebutton_390x120 within w_prati
integer x = 23
integer y = 1512
integer width = 471
integer taborder = 31
string text = "&Recalculer"
string iconname = "ACTIONS_recalculer.png"
end type

event clicked;call super::clicked;open(w_patience)

// Mise à jour de prati
UPDATE prati SET nombre = (SELECT Count(*) FROM patient WHERE Patient.code_praticien = prati.code and patient.code > 0) ;
COMMIT ;

close(w_patience)
dw_liste.retrieve()
parent.TriggerEvent( activate!)
end event

type cb_ajouter from uo_picturebutton_390x120 within w_prati
integer x = 23
integer y = 1352
integer width = 471
integer height = 152
integer taborder = 50
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;// Passage de paramètres entre windows
//OpenSheetWithParm(W_prati_fiche,"      ",w_mdi,0,layered!)
//OpenWithParm(W_prati_fiche,"      ")

W_prati_fiche lw_prati_fiche
guo_fenetre_modale.wf_ouvrir_param_string(lw_prati_fiche, "      ")


dw_liste.retrieve()
if TEA then 
	dw_liste_pour_tea.retrieve()
end if

parent.TriggerEvent( activate!)

end event

type cb_defaut from uo_picturebutton_780x120 within w_prati
integer x = 3424
integer y = 1352
integer width = 681
integer taborder = 31
string text = "Praticien par Défaut"
string iconname = "ACTIONS_praticiens.png"
end type

event clicked;call super::clicked;int	nbr_row, i


if dw_liste.GetRow() > 0 then
	//récup le nombre total de row
	nbr_row = dw_liste.rowCount()
	for i = 1 to nbr_row
		//remise à 0 de la colonne "défaut" pour tout les praticiens
		dw_liste.SetItem(i,"prati_defaut",0)
	next
	//le prati sélectionné --> devient prati par défaut
	dw_liste.SetItem(dw_liste.GetRow(),"prati_defaut",1)
end if

end event

type cb_fermer from uo_picturebutton_390x120 within w_prati
integer x = 3611
integer y = 1512
integer width = 494
integer taborder = 21
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_liste.accepttext()

if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		fermer_fenetre(parent)
	end if
else
	fermer_fenetre(parent)
end if
end event

type dw_liste from u_basedw within w_prati
string tag = "no resize centrer brush"
integer x = 242
integer y = 24
integer width = 3863
integer height = 1296
integer taborder = 10
string dataobject = "dw_prati_liste"
end type

event doubleclicked;call super::doubleclicked;
cb_modifier.postevent(clicked!)
end event

event clicked;call super::clicked;

If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event dberror;db_erreur(dw_liste,sqldbcode,sqlerrtext)
return 1
end event

type uo_1 from resize_fenetre within w_prati
boolean visible = false
integer x = 91
integer y = 492
integer taborder = 11
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type gb_filtre from groupbox within w_prati
string tag = "no resize all"
integer x = 1499
integer y = 1432
integer width = 622
integer height = 192
integer taborder = 70
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Filtre"
borderstyle borderstyle = styleraised!
end type

