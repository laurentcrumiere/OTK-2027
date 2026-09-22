$PBExportHeader$w_type_rdv.srw
forward
global type w_type_rdv from w_param2
end type
type cb_sms from uo_picturebutton_390x120 within w_type_rdv
end type
type dw_liste_pour_tea from datawindow within w_type_rdv
end type
type cb_syncho_tea from uo_picturebutton_390x120 within w_type_rdv
end type
end forward

global type w_type_rdv from w_param2
string title = "Table des Types de Rendez-vous"
cb_sms cb_sms
dw_liste_pour_tea dw_liste_pour_tea
cb_syncho_tea cb_syncho_tea
end type
global w_type_rdv w_type_rdv

type variables


boolean dental_sms

// servira à savoir, dans le close, si on doit mettre à jour les lignes dans TEA
boolean b_modification = false

// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0

end variables

forward prototypes
public subroutine verification_ajout_suppression_pour_tea ()
end prototypes

public subroutine verification_ajout_suppression_pour_tea ();// Principe : parcours de dw_liste_pour_tea (chargée à l'ouverture de la fenetre et jamais modifiéé) pour tester la présence en base de données
// Si plus en base ... on supprime ... 

// on parcours enuite la base de données ... si en Base et pas dans la liste ... on ajoute


open(w_patience)

long lig, tot, cpt, lig2
string v_code, ls_filter, ls_expression
long tot_pour_tea

//// pour appliquer les bons filtres
//ls_filter = dw_liste.Object.DataWindow.Table.Filter
//
//dw_liste_pour_tea.setfilter(ls_filter)
//dw_liste_pour_tea.filter()

// Parcours de la liste avant pour détecter les suppresssion ...
tot_pour_tea = dw_liste_pour_tea.rowcount()
tot = dw_liste.rowcount()


for lig = 1 to tot_pour_tea 
	v_code = trim(dw_liste_pour_tea.getitemstring(lig, "code"))

	select count(*) into :cpt from type_rdv where trim(code) = :v_code ;
	
	if cpt = 0 then
		// il a été supprimé en base de données
		fxg_lancer_commande_dsapi("appointment-type/delete/" + v_code, "",  "TR", "G", 0 )
	end if
	
next

// Parcours de la liste actuelle pour appliquer les modificiations  ...
// on ne peut pas détecter les lignes modifiées car le update en base de données a déjà eu lieu
if b_modification then 
	
	for lig = 1 to tot 
		v_code = trim(dw_liste.getitemstring(lig, "code"))
		lig2 = dw_liste_pour_tea.find('trim(code) = "' +  v_code + '" ', 0 , tot_pour_tea)
		if lig2 > 0 then
			// le code était bien dans la liste pour Téa .. sinon, il sera crée après
			fxg_lancer_commande_dsapi("appointment-type/update/" + v_code, "",  "TR", "G", 0 )
		end if
	next
end if

// Parcours de la base de données ...

declare cur_type_rdv cursor for select trim(code) from type_rdv order by code ;

open cur_type_rdv ;
fetch cur_type_rdv into :v_code ;

do while sqlca.sqlcode = 0 
	
	if trim(v_code) = "13" or trim(v_code) = "58" then 
		integer a
		a = 1
	end if
	ls_expression = 'trim(code) = "' +  v_code + '"'
	
	lig = dw_liste_pour_tea.find(ls_expression , 0 , tot_pour_tea)
	
	if lig = 0 then 
		// le type est en base mais pas dans la liste => ajout
		fxg_lancer_commande_dsapi("appointment-type/create/" + v_code, "",  "TR", "G", 0 )
	end if		

	fetch cur_type_rdv into :v_code ;
	
loop

close cur_type_rdv ;

close(w_patience)


end subroutine

on w_type_rdv.create
int iCurrent
call super::create
this.cb_sms=create cb_sms
this.dw_liste_pour_tea=create dw_liste_pour_tea
this.cb_syncho_tea=create cb_syncho_tea
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_sms
this.Control[iCurrent+2]=this.dw_liste_pour_tea
this.Control[iCurrent+3]=this.cb_syncho_tea
end on

on w_type_rdv.destroy
call super::destroy
destroy(this.cb_sms)
destroy(this.dw_liste_pour_tea)
destroy(this.cb_syncho_tea)
end on

event open;var_fille = "w_af"


dw_liste.settransobject(SQLCA)
dw_liste.retrieve('%')
dw_liste_edition.settransobject(SQLCA)

if TEA then
	dw_liste_pour_tea.settransobject(SQLCA)
	dw_liste_pour_tea.retrieve('%')
	cb_syncho_tea.visible = true
end if

uo_1.taille(this)

if enregistrement_automatique then 
	cb_annuler.visible = false
	cb_enregistrer.visible = false
	
end if

cbx_avec_les_inactifs.backcolor = couleur_fond_fenetre

// pour éliminer de base les inactifs .. mais que pour les tables concernées ..
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if




var_fille = "w_type_rdv_fiche"

// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[33]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
		cb_enregistrer.enabled = false
		cb_modifier.enabled = false
		cb_chercher.enabled = false
	Case 'M'
		// Modification 
//		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
end choose

verification_ordre_par_defaut = true
v_nom_table_a_verifier = "type_rdv"

if OPERATEUR_SMS = 2 then 
	dental_sms = true
else
	dental_sms = false
end if


if dental_sms then 
	cb_sms.visible = true
else
	cb_sms.visible = false
end if
end event

event close;call super::close;


if TEA then
	verification_ajout_suppression_pour_tea()
end if
end event

event timer;call super::timer;Timer(0)
fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)

end event

type p_fond from w_param2`p_fond within w_type_rdv
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_type_rdv
boolean visible = true
integer y = 1856
integer height = 148
end type

type cb_annuler from w_param2`cb_annuler within w_type_rdv
end type

event cb_annuler::clicked;call super::clicked;if TEA then
	dw_liste_pour_tea.retrieve('%')
end if


end event

type cb_enregistrer from w_param2`cb_enregistrer within w_type_rdv
end type

event cb_enregistrer::clicked;
boolean ok_enregistre = true

dw_liste.accepttext()

if dw_liste.modifiedcount() > 0 then
	// Y a eu des modifis => a la fermeture on mettra à jour TEA
	b_modification = true
end if



long lig, tot
integer v_duree, v_fauteuil
string v_nom, v_libelle_erreur, v_code
boolean nom_nul, duree_nulle, fauteuil_nul


tot = dw_liste.rowcount()

for lig = 1 to tot
	v_libelle_erreur = ""
	v_code = string_non_nulle(dw_liste.getitemstring(lig, "code"))
	v_nom = string_non_nulle(dw_liste.getitemstring(lig, "nom"))
	v_duree = dw_liste.getitemnumber(lig, "duree")
	zeroi(v_duree)
	v_fauteuil = dw_liste.getitemnumber(lig, "fauteuil")
	zeroi(v_fauteuil)
	
	nom_nul = false
	duree_nulle = false
	fauteuil_nul = false
	
	if v_nom = "" then 
		v_libelle_erreur = "~n- un nom"
		nom_nul = true
		ok_enregistre = false
		dw_liste.SetItem(lig, "nom", "*** " + v_code + " ***" )
	end if
	if v_duree = 0 then 
		v_libelle_erreur = v_libelle_erreur + "~n- une durée > 0"
		duree_nulle = true
		ok_enregistre = false
		dw_liste.SetItem(lig, "duree", 1 )
	end if
	if v_fauteuil = 0 then 
		v_libelle_erreur = v_libelle_erreur + "~n- un numéo de fauteuil > 0"
		fauteuil_nul = true
		ok_enregistre = false
		dw_liste.SetItem(lig, "fauteuil", 1 )
	end if
	
	if nom_nul or duree_nulle or fauteuil_nul then
		Messagebox("ATTENTION", "Impossible d'enregistrer !~n~nVous devez indiquer ~n" + v_libelle_erreur + "~n~npour le type de rendez-vous de code : " + dw_liste.getitemstring(lig, "code")+"~n~n(des valeurs par défaut ont été appliquées)")
		
	end if
	
next
		

if ok_enregistre then
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
	
	
	
	
	if DOCTOLIB then
		// Mise à jour de la pile Doctolib
				
		insert into pile_doctolib ("type", "action", "origine") 
		values ('POST', 'config', 'Orthokis' ) ;
	
		if sqlca.sqlcode <> 0 then 
			messagebox("ATTENTION !", "Erreur dans la mise à jour de la Pile Doctolib !~n~n" + sqlca.sqlerrtext) 
			rollback ;
		else
			commit ;
		end if
	
	end if
end if
			

end event

type cb_ajouter from w_param2`cb_ajouter within w_type_rdv
end type

event cb_ajouter::clicked;// recherche de la valeur maxi
long valeur_max 
boolean v_suite = true

valeur_max = get_max_code_datawindow(dw_liste, "code") + 1


// Avertissement Doctolib
if DOCTOLIB then
	if Messagebox("ATTENTION", "Vous avez une passerelle Doctolib.~n~nSi vous ajoutez un type de rendez-vous dans Orthokis, vous devrez l'ajouter dans la configuration de Doctolib. Confirmez-vous ?", Question!, YesNo!, 2) = 2 then
		v_suite = false
	end if
end if

if v_suite then
	
	dw_liste.InsertRow(0)
	dw_liste.ScrollToRow(dw_liste.rowcount())
	dw_liste.SetItem(dw_liste.RowCount(),"code",string(valeur_max))
	dw_liste.Setcolumn(1)
	dw_liste.SetFocus()
	

end if
end event

type cb_modifier from w_param2`cb_modifier within w_type_rdv
end type

type cb_supprimer from w_param2`cb_supprimer within w_type_rdv
end type

type cb_1 from w_param2`cb_1 within w_type_rdv
end type

type cb_chercher from w_param2`cb_chercher within w_type_rdv
end type

type cb_exporter from w_param2`cb_exporter within w_type_rdv
end type

type cb_fermer from w_param2`cb_fermer within w_type_rdv
end type

type dw_liste from w_param2`dw_liste within w_type_rdv
string tag = "no resize brush centrer"
integer x = 41
integer y = 40
integer width = 4128
string dataobject = "dw_type_rdv"
end type

event dw_liste::rbuttondown;call super::rbuttondown;//Declaration des variables locales
//--------------------------
long couleur_choisie


// Les positions seront utilisées dans le timer de la fenêtre	
ii_palette_x = xpos
ii_palette_y = ypos

Timer(0.05)



//Appel de la fenetre couleur et au retour, met la couleur de fond
//--------------------------------------------------
if appel_palette(couleur_choisie) then
	if couleur_choisie=couleur_jour_interdit then
		messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur des jours interdits.")
	else
		this.setitem(row,"couleur_double",couleur_choisie)
		this.setitem(row,"couleur",string(couleur_choisie))
		// On bouge le focus pour appliquer la couleur dans la zone
		this.setcolumn(1)
		this.setcolumn(6)
		this.accepttext()
		if enregistrement_automatique and cb_enregistrer.enabled then
			cb_enregistrer.triggerevent(clicked!)
		end if
	end if
end if
end event

type uo_1 from w_param2`uo_1 within w_type_rdv
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_type_rdv
string dataobject = "dw_type_rdv_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_type_rdv
integer y = 2036
end type

type gb_filtre from w_param2`gb_filtre within w_type_rdv
end type

type cb_sms from uo_picturebutton_390x120 within w_type_rdv
integer x = 1577
integer y = 1856
integer width = 448
integer height = 148
integer taborder = 40
boolean bringtotop = true
string text = "Alerte SMS"
string iconname = "lc_sms_16.png"
end type

event clicked;call super::clicked;open(w_type_rdv_alerte_sms)
end event

type dw_liste_pour_tea from datawindow within w_type_rdv
boolean visible = false
integer x = 562
integer y = 1220
integer width = 686
integer height = 400
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_type_rdv"
boolean livescroll = true
end type

type cb_syncho_tea from uo_picturebutton_390x120 within w_type_rdv
boolean visible = false
integer x = 2053
integer y = 1856
integer width = 448
integer height = 148
integer taborder = 50
boolean bringtotop = true
string text = "Sync. Téa"
string iconname = "ACTIONS_stock_generer_selon_index.png"
end type

event clicked;call super::clicked;if messagebox("CONFIRMATION", "Vous allez synchroniser tous vos types de rendez-vous avec Téa.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	if fxg_lancer_commande_dsapi("appointment-type/sync" , "",  "TR", "G", 0 ) then 
		Messagebox("INFORMATION", "Synchronisation lancée avec succès !")
	end if
		
end if

end event

