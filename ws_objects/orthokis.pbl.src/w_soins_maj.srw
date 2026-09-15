$PBExportHeader$w_soins_maj.srw
forward
global type w_soins_maj from w_fenetre_arakis
end type
type cb_autre from uo_picturebutton_390x120 within w_soins_maj
end type
type cb_fermer from uo_picturebutton_390x120 within w_soins_maj
end type
type cb_modifier from uo_picturebutton_390x120 within w_soins_maj
end type
type cb_supprimer from uo_picturebutton_390x120 within w_soins_maj
end type
type cb_bis from uo_picturebutton_390x120 within w_soins_maj
end type
type cb_ajouter from uo_picturebutton_390x120 within w_soins_maj
end type
type cb_imprimer from uo_picturebutton_390x120 within w_soins_maj
end type
type cb_imprimer_euro from commandbutton within w_soins_maj
end type
type cb_dep from commandbutton within w_soins_maj
end type
type uo_size from resize_fenetre within w_soins_maj
end type
type rte_1 from richtextedit within w_soins_maj
end type
type cb_enregistrer_impr from commandbutton within w_soins_maj
end type
type cb_annuler_impr from commandbutton within w_soins_maj
end type
type dw_verso from datawindow within w_soins_maj
end type
type dw_recto from datawindow within w_soins_maj
end type
type cb_annuler_auto from commandbutton within w_soins_maj
end type
type dw_nom from datawindow within w_soins_maj
end type
type cb_trait from commandbutton within w_soins_maj
end type
type dw_auto from datawindow within w_soins_maj
end type
type st_auto1 from statictext within w_soins_maj
end type
type st_auto2 from statictext within w_soins_maj
end type
type em_deb from editmask within w_soins_maj
end type
type cb_ajouter_auto from commandbutton within w_soins_maj
end type
type cb_auto from commandbutton within w_soins_maj
end type
type dw_detail from datawindow within w_soins_maj
end type
type ddlb_type_soins from dropdownlistbox within w_soins_maj
end type
type st_total from statictext within w_soins_maj
end type
type st_tp from statictext within w_soins_maj
end type
type st_hn from statictext within w_soins_maj
end type
type st_num from statictext within w_soins_maj
end type
type st_accord from statictext within w_soins_maj
end type
type st_demande from statictext within w_soins_maj
end type
type st_soin from statictext within w_soins_maj
end type
type dw_edition from datawindow within w_soins_maj
end type
type dw_montant from datawindow within w_soins_maj
end type
type em_total from editmask within w_soins_maj
end type
type em_tp from editmask within w_soins_maj
end type
type em_hn from editmask within w_soins_maj
end type
type em_scp_acc from editmask within w_soins_maj
end type
type em_date_acc from editmask within w_soins_maj
end type
type em_scp_dem from editmask within w_soins_maj
end type
type em_date_dem from editmask within w_soins_maj
end type
type dw_impression from datawindow within w_soins_maj
end type
type dw_soins from datawindow within w_soins_maj
end type
type em_num from editmask within w_soins_maj
end type
type infos_tp from statictext within w_soins_maj
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_soins_maj
end type
type cb_annuler from uo_picturebutton_390x120 within w_soins_maj
end type
type cb_enregistrer_montant from uo_picturebutton_390x120 within w_soins_maj
end type
type cb_ajouter_montant from uo_picturebutton_250x120 within w_soins_maj
end type
type cb_supprimer_montant from uo_picturebutton_250x120 within w_soins_maj
end type
end forward

global type w_soins_maj from w_fenetre_arakis
string tag = "soins"
integer x = 9
integer y = 180
integer width = 3694
integer height = 1956
windowtype windowtype = child!
windowstate windowstate = maximized!
long backcolor = 15780518
cb_autre cb_autre
cb_fermer cb_fermer
cb_modifier cb_modifier
cb_supprimer cb_supprimer
cb_bis cb_bis
cb_ajouter cb_ajouter
cb_imprimer cb_imprimer
cb_imprimer_euro cb_imprimer_euro
cb_dep cb_dep
uo_size uo_size
rte_1 rte_1
cb_enregistrer_impr cb_enregistrer_impr
cb_annuler_impr cb_annuler_impr
dw_verso dw_verso
dw_recto dw_recto
cb_annuler_auto cb_annuler_auto
dw_nom dw_nom
cb_trait cb_trait
dw_auto dw_auto
st_auto1 st_auto1
st_auto2 st_auto2
em_deb em_deb
cb_ajouter_auto cb_ajouter_auto
cb_auto cb_auto
dw_detail dw_detail
ddlb_type_soins ddlb_type_soins
st_total st_total
st_tp st_tp
st_hn st_hn
st_num st_num
st_accord st_accord
st_demande st_demande
st_soin st_soin
dw_edition dw_edition
dw_montant dw_montant
em_total em_total
em_tp em_tp
em_hn em_hn
em_scp_acc em_scp_acc
em_date_acc em_date_acc
em_scp_dem em_scp_dem
em_date_dem em_date_dem
dw_impression dw_impression
dw_soins dw_soins
em_num em_num
infos_tp infos_tp
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_enregistrer_montant cb_enregistrer_montant
cb_ajouter_montant cb_ajouter_montant
cb_supprimer_montant cb_supprimer_montant
end type
global w_soins_maj w_soins_maj

type variables
decimal {2} prix_scp,prix_cons,prix_radio
char action
double cle_manip,var_code_local,hn_def,tp_def
string type_soin,ancien_soin,var_nom_local
boolean premiere
decimal {2} nb_lettre, depasse 
decimal {6} valeur

m_orthosoins newmenu
boolean soin_saisi_ccam = false


boolean soin_a_zero
end variables

forward prototypes
public subroutine maj_total ()
public subroutine verif_montant ()
public subroutine reset_saisie ()
public subroutine maj_dep ()
public subroutine ajlig (boolean visi)
public subroutine imprimer_soins (date date_debut, character monnaie)
end prototypes

public subroutine maj_total ();//// reccherche des valeurs dans la table code_soin
string code
string date_dem , renouvt,tp

code = dw_nom.getItemString(dw_nom.getRow(),"code")

SELECT code INTO :type_soin FROM code_soins WHERE code = :code;
  SELECT  "code_soins"."date_dem",   
         "code_soins"."tp"  ,
			"code_soins"."nb_lettre",
			"code_soins"."depasse",
			"code_soins"."valeur"
    INTO  :date_dem,   
         :tp  ,
			:nb_lettre,
			:depasse,
			:valeur
    FROM "code_soins"  
   WHERE "code_soins"."code" = :code   ;



// Mise à jour de la zone TOTAL
if dec(em_scp_dem.text) > 0 then 
	//if dec(em_hn.text) > 0 then
		em_total.text = string(round(valeur * dec(em_scp_dem.text) + dec(em_hn.text),2))
	//else
	//	em_total.text = string(round(valeur * dec(em_scp_dem.text),2))
	//end if
else
	em_total.text = string(round(dec(em_hn.text),2))
end if

// On tient compte du TP de la manière suivante :
//		   partie secu x %TP > valeur totale ... on prend cette valeur là pour réévaluer le reste .... (idée de FOURQUET)
//
// Calcul provisoire du total en tenant compte de la zone TP
decimal {2} total_tp
total_tp = round(valeur * dec(em_scp_dem.text) * dec(em_tp.text) / 100 ,2)
if total_tp > dec(em_total.text) then
	em_total.text = string(total_tp)
end if

// Actes gratuits ?
if (dec(em_total.text) > 0 and not soin_a_zero) or (  dec(em_total.text) >= 0 and soin_a_zero   )  then
	cb_enregistrer.enabled = true
	cb_enregistrer.default = true
else
	cb_enregistrer.enabled = false
end if

end subroutine

public subroutine verif_montant ();integer i
decimal {2} tot

Dw_montant.accepttext()

tot = 0
FOR i=1 TO dw_montant.rowcount()
	tot = tot + dw_montant.getitemdecimal(i,"montant")
NEXT

if tot = dec(em_total.text) then
	cb_enregistrer_montant.enabled = true
	cb_enregistrer_montant.default = true
else
	cb_enregistrer_montant.enabled = false
end if
end subroutine

public subroutine reset_saisie ();em_date_acc.text = ""
em_date_dem.text = ""
em_hn.text = ""
em_tp.text = ""
em_total.text = ""
em_scp_dem.text = ""
em_scp_acc.text = ""
em_num.text = ""
em_total.text = ""
end subroutine

public subroutine maj_dep ();// Met à jour la zone DEP déplacement en fonction des valeurs saisies :
//   Lettres , Total, TP

string hn_prov 				// Variable temporaire de calcul du dépassement

if dec(em_scp_dem.text) > 0 then 
	// C'est un soin avec Entente
	hn_prov = string ( dec(em_total.text) - round(valeur * dec(em_scp_dem.text),2))
else
	// Il n'y pas pas de demande d'entente
	hn_prov = em_total.text
end if


if double(hn_prov) < 0 and not belgique and not soin_saisi_ccam then
	// Impossible
	Messagebox("ATTENTION","Vous ne pouvez pas saisir un tel montant ("+libelle_depassement+" négatif) !")
	em_hn.setfocus()
else
	// OK
	em_hn.text = hn_prov
end if

// Actes gratuits ?
if dec(em_total.text) > 0 and not soin_a_zero or (dec(em_total.text) >= 0 and soin_a_zero) then
	cb_enregistrer.enabled = true
	cb_enregistrer.default = true
else
	cb_enregistrer.enabled = false
end if

end subroutine

public subroutine ajlig (boolean visi);cb_ajouter.visible = not(visi)
cb_supprimer.visible = not(visi)
cb_modifier.visible = not(visi)
cb_bis.visible = not(visi)

cb_ajouter_auto.visible = false
cb_annuler_auto.visible = false
st_auto1.visible = false
st_auto2.visible = false
dw_auto.visible = false
em_deb.visible = false

// Les boutons "autre" et "auto" sont non actif pour les soins automatisés
// On ne doit pas les rendre visible dans cette fenêtre là !
if cb_autre.enabled then
	cb_autre.visible = not(visi)
end if
if cb_auto.enabled then
	cb_auto.visible = not(visi)
	cb_trait.visible = not(visi)
	cb_dep.visible = not(visi)
end if

cb_fermer.visible = not(visi)
cb_imprimer.visible = not(visi)

cb_ajouter_montant.visible = false
cb_supprimer_montant.visible = false
cb_enregistrer_montant.visible = false

cb_annuler.visible = visi
cb_enregistrer.visible = visi
//em_date_acc.visible = visi
em_date_dem.visible = visi
em_hn.visible = visi
//em_scp_acc.visible = visi
em_num.visible = visi
em_scp_dem.visible = visi
em_total.visible = visi
em_tp.visible = visi
//ddlb_type_soins.visible = visi
dw_nom.visible = visi

em_date_dem.enabled = visi
em_hn.enabled = visi
//em_date_acc.enabled = visi
em_num.enabled = visi
//em_scp_acc.enabled = visi
em_tp.enabled = visi
em_total.enabled = visi
em_scp_dem.enabled = visi
//ddlb_type_soins.enabled = visi
dw_nom.enabled = visi

dw_soins.visible = not(visi)
dw_detail.visible = not(visi)
dw_impression.visible = not(visi)

cb_enregistrer_impr.visible = not(visi)
cb_annuler_impr.visible = not(visi)

st_accord.visible = false
em_date_acc.visible = false
em_scp_acc.visible = false

st_demande.visible = visi
st_hn.visible = visi
st_num.visible = visi
st_soin.visible = visi
st_total.visible = visi
st_tp.visible = visi

//if visi then
//	ddlb_type_soins.selectitem("Semestre",1)
//end if
end subroutine

public subroutine imprimer_soins (date date_debut, character monnaie);// IMPRESSION DES SOINS DU PATIENT A PARTIR D'UNE DATE DONNEE
// Appelée par :
//  - Bouton IMPRIMER avec '01/01/1900' en argument
//  - Menu accessible avec le bouton droit sur les soins avec la date de demande du soin en cours

// - La variable monnaie doit être 'E' ou 'F' : monnaie d'impression


string entete, baspage,cade,cadbp
double cpt

if dw_soins.rowcount() = 0 then
	son(5)
	MessageBox("ATTENTION !","Aucun soin n'a été saisi !")
else
	
	dw_edition.retrieve(var_code_local,date_debut,monnaie)
	
	if this.tag = "soins" then
		entete = dw_edition.GetItemString(dw_edition.GetRow(),"prati_entete")
		baspage = dw_edition.GetItemString(dw_edition.GetRow(),"prati_bas_page")
		rte_1.insertdocument(entete, False, FileTypeRichText!)
		rte_1.SelectTextAll ()
		entete = rte_1.SelectedText( )
		
		rte_1.insertdocument(baspage, False, FileTypeRichText!)
		rte_1.SelectTextAll ()
		baspage = rte_1.SelectedText( )
	
		for cpt = 1 to dw_edition.rowcount()
			dw_edition.SetItem(cpt,"prati_entete",entete)
			dw_edition.SetItem(cpt,"prati_bas_page",baspage)
		next
		
		
		// Cadrage de l'entête et du bas de page
		// (Le visible ou non visible est fait automatiquement dans la Dw)
	
		SELECT "edition_entete_cadrage", "edition_baspage_cadrage" INTO :cade, :cadbp 
		FROM "param" ;
		
		dw_edition.Modify("prati_entete.alignment = '"+cade+"'")
		dw_edition.Modify("prati_bas_page.alignment = '"+cadbp+"'")
	end if
	
	dw_edition.print()
	
	if dw_soins.tag = "soins" then
		ajout_histo_editions(var_code_local,"DOSSOI",today(),"")
	end if
end if
end subroutine

event open; 
open(w_patience)


date date_tt

var_code_local = var_code
var_nom_local = var_nom


// recherche des valeurs par défaut
SELECT "patient"."debut_traitement"  , "hn","tp"
    INTO :date_tt , :hn_def,:tp_def
    FROM "patient"  
   WHERE "patient"."code" = :var_code_local   ;

// On met à jour la zone INFOS TP
if not isnull(hn_def) THEN
	infos_tp.text = "Dép : "+string(hn_def,"0.00")
end if
if not isnull(tp_def) then
	infos_tp.text = infos_tp.text + "      TP : "+string(tp_def,"0.00")+" %"
end if


// autorisation ou non des soins à zéro
string v_auto

if Belgique then
	soin_a_zero = true 
else
	select soins_gratuits into :v_auto from utilisateurs where code = :utilisateur_code ;
	if v_auto = 'O' then
		soin_a_zero = true
	else
		soin_a_zero = false
	end if
end if




w_patience.Wf_SetValue(30)


// Ajout du nom du praticien dans le titre de la fenêtre
// recherche des valeurs par défaut
string prati_nom

SELECT "prati"."sc","prati"."pxcons","prati"."radio" , "prati"."nom"
INTO :prix_scp,:prix_cons,:prix_radio ,  :prati_nom 
FROM "prati", "patient" 
WHERE "patient"."code" = :var_code_local and "patient"."code_praticien" = "prati"."code" ;

this.title = "Gestion des Soins pour le Dr " +prati_nom +" : "+var_nom_local+" ("+string(var_code_local)+")" +var_cmu+ " - Date début de traitement : " + string(date_tt,'dd/mm/yyyy')


w_patience.Wf_SetValue(50)


dw_montant.settransobject(SQLCA)
dw_detail.settransobject(SQLCA)
dw_edition.settransobject(SQLCA)
dw_soins.settransobject(SQLCA)
dw_auto.settransobject(SQLCA)
dw_nom.settransobject(SQLCA)
dw_impression.settransobject(SQLCA)

dw_verso.settransobject(SQLCA)
dw_recto.settransobject(SQLCA)


// Modification du terme "Dépassement"
dw_soins.modify("hn_t.text = '"+libelle_depassement+"'")
dw_edition.modify("hn_t.text = '"+libelle_depassement+"'")
st_hn.text = libelle_depassement


//ddlb_type_soins.selectitem("Semestre",1)

// On masque la colonne qui sert à TELEVITALE dans les règlement
dw_soins.modify("fse.visible = 0")
dw_soins.retrieve(var_code_local)

// pour la belgique ... on masque la colonne facture (utilisée différemment)
if Belgique then
	dw_soins.modify("t_facture.visible = 0")
	dw_soins.modify("facture.visible = 0")
end if

w_patience.Wf_SetValue(80)

// Le positionnement se fait désormais dans l'évement SHOW
//// On se met sur le soin le plus proche en date
//integer l
//// On recherche ici en marche arrière
//l = dw_soins.Find("date_demande <= today()",9999,1)
//if l > 0 then
//	dw_soins.Scrolltorow(l)
//else
//	dw_soins.Scrolltorow(9999)
//end if
//dw_soins.setfocus()
//


//h.chp()	//vérif la présence de la clef HASP

// on crée un menu pour le bouton droit 
newmenu = CREATE m_orthosoins


// Gestion des droits d'accès sur le menu ... pas de décalage en consultation
if droits_acces[11] =  'C' then
	newmenu.m_soins.m_decalage.enabled = false
	newmenu.m_soins.m_decalage2.enabled = false
	newmenu.m_soins.m_decalage3.enabled = false
	newmenu.m_soins.m_decalagepartiel.enabled = false
	newmenu.m_soins.m_decalagepartiel2.enabled = false
	newmenu.m_soins.m_decalagepartiel3.enabled = false
end if

// Pas d'impression de feuilles si pas d'impression Sécu
if droits_acces[21] = 'N'  then
	newmenu.m_soins.m_imprimerrecto.enabled = false
	newmenu.m_soins.m_imprimerverso.enabled = false
	newmenu.m_soins.m_imprimerrectoverso.enabled = false
end if

uo_size.taille(this)


// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[11]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled ( false)
		cb_modifier.enabled ( false)
		cb_supprimer.enabled ( false)
		cb_bis.enabled ( false)
		cb_auto.enabled = false
		cb_enregistrer_impr.enabled =false
	Case 'M'
		// Modification 
//		cb_ajouter.enabled = false
//		cb_auto.enabled = false
		cb_supprimer.enabled ( false)
end choose

// Vérouillage du bouton Traitement
//-----------------------------------------

if droits_acces[10] = 'N' then
	cb_trait.enabled = false
end if

close(w_patience)


end event

on w_soins_maj.create
int iCurrent
call super::create
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.cb_modifier=create cb_modifier
this.cb_supprimer=create cb_supprimer
this.cb_bis=create cb_bis
this.cb_ajouter=create cb_ajouter
this.cb_imprimer=create cb_imprimer
this.cb_imprimer_euro=create cb_imprimer_euro
this.cb_dep=create cb_dep
this.uo_size=create uo_size
this.rte_1=create rte_1
this.cb_enregistrer_impr=create cb_enregistrer_impr
this.cb_annuler_impr=create cb_annuler_impr
this.dw_verso=create dw_verso
this.dw_recto=create dw_recto
this.cb_annuler_auto=create cb_annuler_auto
this.dw_nom=create dw_nom
this.cb_trait=create cb_trait
this.dw_auto=create dw_auto
this.st_auto1=create st_auto1
this.st_auto2=create st_auto2
this.em_deb=create em_deb
this.cb_ajouter_auto=create cb_ajouter_auto
this.cb_auto=create cb_auto
this.dw_detail=create dw_detail
this.ddlb_type_soins=create ddlb_type_soins
this.st_total=create st_total
this.st_tp=create st_tp
this.st_hn=create st_hn
this.st_num=create st_num
this.st_accord=create st_accord
this.st_demande=create st_demande
this.st_soin=create st_soin
this.dw_edition=create dw_edition
this.dw_montant=create dw_montant
this.em_total=create em_total
this.em_tp=create em_tp
this.em_hn=create em_hn
this.em_scp_acc=create em_scp_acc
this.em_date_acc=create em_date_acc
this.em_scp_dem=create em_scp_dem
this.em_date_dem=create em_date_dem
this.dw_impression=create dw_impression
this.dw_soins=create dw_soins
this.em_num=create em_num
this.infos_tp=create infos_tp
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_enregistrer_montant=create cb_enregistrer_montant
this.cb_ajouter_montant=create cb_ajouter_montant
this.cb_supprimer_montant=create cb_supprimer_montant
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_autre
this.Control[iCurrent+2]=this.cb_fermer
this.Control[iCurrent+3]=this.cb_modifier
this.Control[iCurrent+4]=this.cb_supprimer
this.Control[iCurrent+5]=this.cb_bis
this.Control[iCurrent+6]=this.cb_ajouter
this.Control[iCurrent+7]=this.cb_imprimer
this.Control[iCurrent+8]=this.cb_imprimer_euro
this.Control[iCurrent+9]=this.cb_dep
this.Control[iCurrent+10]=this.uo_size
this.Control[iCurrent+11]=this.rte_1
this.Control[iCurrent+12]=this.cb_enregistrer_impr
this.Control[iCurrent+13]=this.cb_annuler_impr
this.Control[iCurrent+14]=this.dw_verso
this.Control[iCurrent+15]=this.dw_recto
this.Control[iCurrent+16]=this.cb_annuler_auto
this.Control[iCurrent+17]=this.dw_nom
this.Control[iCurrent+18]=this.cb_trait
this.Control[iCurrent+19]=this.dw_auto
this.Control[iCurrent+20]=this.st_auto1
this.Control[iCurrent+21]=this.st_auto2
this.Control[iCurrent+22]=this.em_deb
this.Control[iCurrent+23]=this.cb_ajouter_auto
this.Control[iCurrent+24]=this.cb_auto
this.Control[iCurrent+25]=this.dw_detail
this.Control[iCurrent+26]=this.ddlb_type_soins
this.Control[iCurrent+27]=this.st_total
this.Control[iCurrent+28]=this.st_tp
this.Control[iCurrent+29]=this.st_hn
this.Control[iCurrent+30]=this.st_num
this.Control[iCurrent+31]=this.st_accord
this.Control[iCurrent+32]=this.st_demande
this.Control[iCurrent+33]=this.st_soin
this.Control[iCurrent+34]=this.dw_edition
this.Control[iCurrent+35]=this.dw_montant
this.Control[iCurrent+36]=this.em_total
this.Control[iCurrent+37]=this.em_tp
this.Control[iCurrent+38]=this.em_hn
this.Control[iCurrent+39]=this.em_scp_acc
this.Control[iCurrent+40]=this.em_date_acc
this.Control[iCurrent+41]=this.em_scp_dem
this.Control[iCurrent+42]=this.em_date_dem
this.Control[iCurrent+43]=this.dw_impression
this.Control[iCurrent+44]=this.dw_soins
this.Control[iCurrent+45]=this.em_num
this.Control[iCurrent+46]=this.infos_tp
this.Control[iCurrent+47]=this.cb_enregistrer
this.Control[iCurrent+48]=this.cb_annuler
this.Control[iCurrent+49]=this.cb_enregistrer_montant
this.Control[iCurrent+50]=this.cb_ajouter_montant
this.Control[iCurrent+51]=this.cb_supprimer_montant
end on

on w_soins_maj.destroy
call super::destroy
destroy(this.cb_autre)
destroy(this.cb_fermer)
destroy(this.cb_modifier)
destroy(this.cb_supprimer)
destroy(this.cb_bis)
destroy(this.cb_ajouter)
destroy(this.cb_imprimer)
destroy(this.cb_imprimer_euro)
destroy(this.cb_dep)
destroy(this.uo_size)
destroy(this.rte_1)
destroy(this.cb_enregistrer_impr)
destroy(this.cb_annuler_impr)
destroy(this.dw_verso)
destroy(this.dw_recto)
destroy(this.cb_annuler_auto)
destroy(this.dw_nom)
destroy(this.cb_trait)
destroy(this.dw_auto)
destroy(this.st_auto1)
destroy(this.st_auto2)
destroy(this.em_deb)
destroy(this.cb_ajouter_auto)
destroy(this.cb_auto)
destroy(this.dw_detail)
destroy(this.ddlb_type_soins)
destroy(this.st_total)
destroy(this.st_tp)
destroy(this.st_hn)
destroy(this.st_num)
destroy(this.st_accord)
destroy(this.st_demande)
destroy(this.st_soin)
destroy(this.dw_edition)
destroy(this.dw_montant)
destroy(this.em_total)
destroy(this.em_tp)
destroy(this.em_hn)
destroy(this.em_scp_acc)
destroy(this.em_date_acc)
destroy(this.em_scp_dem)
destroy(this.em_date_dem)
destroy(this.dw_impression)
destroy(this.dw_soins)
destroy(this.em_num)
destroy(this.infos_tp)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer_montant)
destroy(this.cb_ajouter_montant)
destroy(this.cb_supprimer_montant)
end on

event resize;uo_size.retaille(this)

end event

event show;// On se met sur le soin le plus proche en date
integer l

// On recherche ici en marche arrière
// On se positionne sur le dernier soin car Il faut bouger sinon ....
dw_soins.Scrolltorow(9999)

l = dw_soins.Find("date_demande <= today()",9999,1)

if l > 0 then
	dw_soins.Scrolltorow(l)
else
	dw_soins.Scrolltorow(9999)
end if
dw_soins.setfocus()

end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_maj
end type

type cb_autre from uo_picturebutton_390x120 within w_soins_maj
integer x = 2789
integer y = 1704
integer taborder = 230
string text = "A&utre"
end type

event clicked;call super::clicked;date date_tt

var_suite = false
open(w_cherche)
if var_suite then
	var_code_local = var_code
	var_nom_local = var_nom
	
  SELECT "patient"."debut_traitement"  
    INTO :date_tt  
    FROM "patient"  
   WHERE "patient"."code" = :var_code_local   ;
	
// Ajout du nom du praticien dans le titre de la fenêtre
	string prati_nom
  SELECT "prati"."nom"  
    INTO :prati_nom  
    FROM "patient",   
         "prati"  
   WHERE ( "prati"."code" = "patient"."code_praticien" ) and  
         ( ( "patient"."code" = :var_code_local )     )   ;


	parent.title = "Gestion des Soins pour le Dr " +prati_nom +" : "+var_nom_local+" ("+string(var_code_local)+")" + var_cmu+" - Date début de traitement : " + string(date_tt,'dd/mm/yyyy')
	

//	parent.title = "Gestion des Soins : "+var_nom_local+" ("+string(var_code_local)+")" + " - Date début de traitement : " + string(date_tt,'dd/mm/yyyy')	
	
	dw_soins.retrieve(var_code_local)

	// On se met sur le soin le plus proche en date
	integer l
	
	// On recherche ici en marche arrière
	l = dw_soins.Find("date_demande <= today()",9999,1)
	if l > 0 then
		dw_soins.Scrolltorow(l)
	else
		dw_soins.Scrolltorow(9999)
	end if
	dw_soins.setfocus()
	SELECT "prati"."sc","prati"."pxcons","prati"."radio" INTO :prix_scp,:prix_cons,:prix_radio FROM prati,patient WHERE "patient"."code" = :var_code_local and "patient"."code_praticien" = "prati"."code" ;
	SELECT "hn","tp" INTO :hn_def,:tp_def FROM patient WHERE "patient"."code" = :var_code_local ;
	// On met à jour la zone INFOS TP
	if not isnull(hn_def) THEN
		infos_tp.text = "Dép : "+string(hn_def,"0.00")
	end if
	if not isnull(tp_def) then
		infos_tp.text = infos_tp.text + "      TP : "+string(tp_def,"0.00")+" %"
	end if
end if
end event

type cb_fermer from uo_picturebutton_390x120 within w_soins_maj
integer x = 3250
integer y = 1704
integer taborder = 240
string text = "&Fermer"
boolean default = true
end type

event clicked;call super::clicked;DESTROY newmenu
close(parent)

end event

type cb_modifier from uo_picturebutton_390x120 within w_soins_maj
integer x = 1271
integer y = 1704
integer taborder = 230
string text = "&Modifier"
end type

type cb_supprimer from uo_picturebutton_390x120 within w_soins_maj
integer x = 855
integer y = 1704
integer taborder = 230
string text = "&Supprimer"
end type

event clicked;call super::clicked;if dw_soins.rowcount() = 0 then
	son(5)
	MessageBox("ATTENTION !","Aucun soin n'a été saisi !")
else
	if MessageBox("ATTENTION !","La suppression de ce soin sera définitive !~n~nConfirmez-vous ?",Question!,yesNo!,2) = 1 then

		double lig_soin 
		lig_soin = dw_soins.getrow()
		
		if lig_soin < 1 then
			lig_soin = 1
		end if
			
		cle_manip = dw_soins.getitemnumber(lig_soin,"cle")
		integer cpt_reg

		// Vérification de règlements saisis
		SELECT count(*) INTO :cpt_reg FROM paye WHERE code = :var_code_local and cle = :cle_manip ;

		if cpt_reg > 0 then 
			son(5)
			MessageBox("ATTENTION !","La suppression est impossible !~n~n(Des règlements ont été saisis)")
		else

			son(7)

		  DELETE FROM "ligne_soins"  
   		WHERE ( code = :var_code_local ) AND  
      		   ( cle = :cle_manip )   ;

		  DELETE FROM "soins"  
   		WHERE ( code = :var_code_local ) AND  
      		   ( cle = :cle_manip )   ;

			COMMIT ;

			dw_soins.retrieve(var_code_local)
			
			if lig_soin > dw_soins.rowcount() then
				lig_soin = dw_soins.rowcount()
			end if
			// On se met sur le soin suivant sinon on reset
			if dw_soins.rowcount() > 0 then
				dw_soins.Scrolltorow(lig_soin)
				dw_soins.SetRow(lig_soin)
				dw_soins.setfocus()
			else
				dw_detail.reset()
			end if

		end if
	end if
end if
end event

type cb_bis from uo_picturebutton_390x120 within w_soins_maj
integer x = 439
integer y = 1704
integer taborder = 230
string text = "&Bis"
end type

event clicked;call super::clicked;// Répète la ligne de soins sur laquelle est le curseur en la décalant de la durée du soin

if dw_soins.rowcount() = 0 then
	son(5)
	MessageBox("ATTENTION !","Aucun soin n'a été saisi !")
else
		double lig_soin , cle_soin
		
		lig_soin = dw_soins.getrow()
		
		if lig_soin < 1 Then
			lig_soin = 1
		end if
		
		date demande, execution,accord
		double scp_demande, hn, total, tp, cle_max, scp_accord
		integer numero, duree
		string s_type_soin
		
		cle_soin = dw_soins.getitemnumber(lig_soin,"cle")

		demande = dw_soins.getitemdate(lig_soin,"date_demande")
		accord  = dw_soins.getitemdate(lig_soin,"date_accord")
		hn = dw_soins.getitemnumber(lig_soin,"hn")
		total = dw_soins.getitemnumber(lig_soin,"total")
		scp_demande = dw_soins.getitemnumber(lig_soin,"scp_demande")
		scp_accord = dw_soins.getitemnumber(lig_soin,"scp_accord")
		tp = dw_soins.getitemnumber(lig_soin,"tp")
		numero = dw_soins.getitemnumber(lig_soin,"numero")
		s_type_soin = dw_soins.getitemstring(lig_soin,"code_soins_code")
		
		execution  = dw_impression.getitemdate(1,"date_exe")

	  SELECT "code_soins"."duree"  
		 INTO :duree
		 FROM "code_soins"  
		WHERE "code_soins"."code" = :s_type_soin   ;
	
	
	
	
		// Ajout du soins pour le patient
	
		// Decalage des dates
		demande = ajout_x_mois(demande, duree)
		execution = ajout_x_mois(execution, duree)
	
	
		select max(cle) into :cle_max from "soins" where code = :var_code_local ;
		cle_max = cle_max + 1
		numero = numero + 1
		
		
		  INSERT INTO "soins"  
         ( "cle", 
			"code",   
           "type",   
           "numero",   
           "date_demande",   
           "scp_demande",   
           "date_accord",   
           "scp_accord",   
           "hn",   
           "total",   
           "tp",   
           "date_cara",   
           "date_impr",   
           "date_donne",   
           "date_rapport",   
           "comment",   
           "date_exe" )  
  VALUES ( :cle_max,   
           :var_code_local,   
           :s_type_soin,   
           :numero,   
           :demande,   
           :scp_demande,   
           null,   
           :scp_accord,   
           :hn,   
           :total,   
           :tp,   
           null,   
           null,   
           null,   
           null,   
           null,   
           :execution )  ;


		// Ajout des lignes de soins
		  INSERT INTO "ligne_soins"  
         ( "cle",   
           "code",   
           "date",   
           "montant",   
           "tp",   
           "origine_tp" )  
     SELECT :cle_max,   
            "ligne_soins"."code",   
            dateadd (month, :duree, "ligne_soins"."date") ,   
            "ligne_soins"."montant",   
            "ligne_soins"."tp",   
            "ligne_soins"."origine_tp"  
       FROM "ligne_soins" 
		 WHERE code = :var_code_local and cle = :cle_soin ;
		
		
		commit ;
		
			dw_soins.reset()
			dw_soins.retrieve(var_code_local)
			
			lig_soin = dw_soins.rowcount()

			// On se met sur le soin qu'on vient d'ajouter (en principe le dernier ?)
			if dw_soins.rowcount() > 0 then
				dw_soins.Scrolltorow(lig_soin)
				dw_soins.SetRow(lig_soin)
				dw_soins.SelectRow(0,False)
				dw_soins.SelectRow(lig_soin,True)
				dw_soins.setfocus()
			End If
			

end if

end event

type cb_ajouter from uo_picturebutton_390x120 within w_soins_maj
integer x = 23
integer y = 1704
integer taborder = 230
string text = "&Ajouter"
end type

event clicked;call super::clicked;// AJOUT D'UNE LIGNE DE SOINS
//--------------------------------------


// Recherche du 1er soin par défaut

long v_min
string v_code_defaut

select min(ordre_trie) into :v_min from code_soins where actif = 1 ;

if not isnull(v_min) then
	
	select min(code) into :v_code_defaut from code_soins where actif = 1 and ordre_trie = :v_min ;
	
	premiere = true
	action = "A"
	
	
	ajlig(true)
	
	reset_saisie()
	
	
	
	dw_nom.retrieve(v_code_defaut)
	dw_nom.SetFocus()
else
	Messagebox("ATTENTION !","Vous n'avez pas de Type de Soins actif !~n~nVeuillez en saisir !")
end if
end event

type cb_imprimer from uo_picturebutton_390x120 within w_soins_maj
integer x = 1687
integer y = 1704
integer taborder = 220
string text = "&Imprimer"
end type

event clicked;call super::clicked;imprimer_soins (date('1900-01-01'),'E')
end event

type cb_imprimer_euro from commandbutton within w_soins_maj
boolean visible = false
integer x = 2139
integer y = 1600
integer width = 247
integer height = 80
integer taborder = 200
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "&Imprimer"
end type

event clicked;// INUTILE
// NE SERT QUE POUR DES PROBLEMES D'HERITAGE 
end event

type cb_dep from commandbutton within w_soins_maj
integer x = 1888
integer y = 1680
integer width = 343
integer height = 108
integer taborder = 380
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&DEP"
end type

event clicked;OpenWithParm(w_diag,var_code_local)
end event

type uo_size from resize_fenetre within w_soins_maj
boolean visible = false
integer x = 2747
integer y = 488
integer taborder = 310
end type

on uo_size.destroy
call resize_fenetre::destroy
end on

type rte_1 from richtextedit within w_soins_maj
boolean visible = false
integer x = 2327
integer y = 948
integer width = 494
integer height = 360
integer taborder = 220
long init_backcolor = 16777215
boolean init_wordwrap = true
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_headerfooter = true
end type

on rte_1.create
HeaderFooter=true
InputFieldsVisible=true
WordWrap=true
BackColor=16777215
InputFieldBackColor=16777215
end on

type cb_enregistrer_impr from commandbutton within w_soins_maj
integer x = 2848
integer y = 1576
integer width = 343
integer height = 88
integer taborder = 230
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Enregistrer"
end type

event clicked;dw_impression.AcceptText ()

IF dw_impression.update() = 1 THEN
	COMMIT ;
ELSE
	ROLLBACK ;
END IF	


end event

type cb_annuler_impr from commandbutton within w_soins_maj
integer x = 2464
integer y = 1576
integer width = 343
integer height = 88
integer taborder = 240
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Annuler"
end type

event clicked;if dw_soins.rowcount() > 0 then
	dw_impression.retrieve(dw_soins.getitemnumber(dw_soins.getrow(),"cle"),var_code_local)
end if
end event

type dw_verso from datawindow within w_soins_maj
boolean visible = false
integer x = 1147
integer y = 1036
integer width = 494
integer height = 360
integer taborder = 270
boolean bringtotop = true
string dataobject = "dw_renouvellement_verso_2_nvelle"
boolean livescroll = true
end type

type dw_recto from datawindow within w_soins_maj
event printend pbm_dwnprintend
boolean visible = false
integer x = 306
integer y = 536
integer width = 494
integer height = 360
integer taborder = 300
boolean bringtotop = true
string dataobject = "dw_renouvellement_recto_nvelle"
boolean livescroll = true
end type

event printend;print_ok = true
end event

type cb_annuler_auto from commandbutton within w_soins_maj
event clicked pbm_bnclicked
boolean visible = false
integer x = 1138
integer y = 1632
integer width = 384
integer height = 108
integer taborder = 340
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "A&nnuler"
end type

on clicked;ajlig(false)
end on

type dw_nom from datawindow within w_soins_maj
boolean visible = false
integer x = 18
integer y = 216
integer width = 1317
integer height = 88
integer taborder = 320
string dataobject = "dw_type_soins"
boolean border = false
boolean livescroll = true
end type

event getfocus;string code
string date_dem , tp
integer v_duree

code = this.getItemString(this.getRow(),"code")
SELECT code INTO :ancien_soin FROM code_soins WHERE code = :code;

  SELECT "code_soins"."duree",   
         "code_soins"."date_dem",   
         "code_soins"."tp"  
    INTO :v_duree,   
         :date_dem,   
         :tp  
    FROM "code_soins"  
   WHERE "code_soins"."code" = :code   ;

IF premiere THEN
	premiere = FALSE
	ancien_soin = "!"
ELSE	
	IF v_duree > 0 THEN
		em_num.visible = true
	ELSE
		em_num.visible = false
	END IF
	
	em_scp_dem.visible = true
//	IF date_dem = 'O' THEN
//		em_date_acc.visible = true
//		em_scp_acc.visible = true
//	ELSE
//		em_date_acc.visible = false
//		em_scp_acc.visible = false
//	END IF
	
	IF tp = 'O' THEN
		em_tp.visible = true 
	ELSE
		em_tp.visible = false		
	END IF	
END IF	
cb_enregistrer.enabled ( false)
cb_annuler.enabled ( false)





end event

event losefocus;string code
integer mn
string date_dem , tp
integer v_duree
string v_nature_soin

code = this.getItemString(this.getRow(),"code")


SELECT code INTO :type_soin FROM code_soins WHERE code = :code;
  SELECT "code_soins"."renouvt",   
         "code_soins"."date_dem",   
         "code_soins"."tp"  ,
			"code_soins"."nb_lettre",
			"code_soins"."depasse",
			"code_soins"."valeur",
			"code_soins"."nature"
    INTO :v_duree,   
         :date_dem,   
         :tp  ,
			:nb_lettre,
			:depasse,
			:valeur,
			:v_nature_soin
    FROM "code_soins"  
   WHERE "code_soins"."code" = :code   ;

cb_enregistrer.enabled ( TRUE)

if v_nature_soin = 'C' then
	soin_saisi_ccam = true
else
	soin_saisi_ccam = false
end if
	

IF type_soin <> ancien_soin THEN
	reset_saisie ()
	IF v_duree > 0 THEN
		em_num.visible = true
		
		select max(numero) INTO :mn from soins where code = :var_code_local and type = :code ;
		if isnull(mn) then
			mn = 0
		end if
		mn = mn + 1
		if mn >= 10 then
			mn = 0
		end if
		em_num.text = string(mn)	
	ELSE
		em_num.visible = false
	END IF
	
	em_date_dem.visible = true
	em_date_dem.text = string(today())
	IF date_dem = 'O' THEN
		em_date_acc.visible = true
		em_scp_dem.visible = true
		em_scp_acc.visible = true
	ELSE
		em_date_acc.visible = false
		em_scp_dem.visible = false
		em_scp_acc.visible = false
	END IF
	
	IF tp = 'O' THEN
		em_tp.visible = true 
	ELSE
		em_tp.visible = false		
	END IF	
	
		
	IF IsNull(nb_lettre) THEN
		//rien
	ELSE
		em_scp_dem.text = string(nb_lettre)
	END IF	
	em_hn.text = string(depasse)
END IF



cb_annuler.enabled ( true)
maj_total()
end event

type cb_trait from commandbutton within w_soins_maj
event clicked pbm_bnclicked
integer x = 1998
integer y = 1728
integer width = 343
integer height = 108
integer taborder = 180
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Trait."
end type

event clicked;OpenWithParm(w_diag,var_code_local)
end event

type dw_auto from datawindow within w_soins_maj
boolean visible = false
integer x = 1307
integer y = 1092
integer width = 1161
integer height = 88
integer taborder = 260
string dataobject = "dw_cherche_titre_soin_auto"
boolean border = false
boolean livescroll = true
end type

type st_auto1 from statictext within w_soins_maj
boolean visible = false
integer x = 704
integer y = 1248
integer width = 590
integer height = 72
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "Date de Référence :"
end type

type st_auto2 from statictext within w_soins_maj
boolean visible = false
integer x = 297
integer y = 1092
integer width = 997
integer height = 72
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "Soins automatiques à incorporer :"
end type

type em_deb from editmask within w_soins_maj
boolean visible = false
integer x = 1312
integer y = 1228
integer width = 434
integer height = 100
integer taborder = 210
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type cb_ajouter_auto from commandbutton within w_soins_maj
boolean visible = false
integer x = 1582
integer y = 1624
integer width = 384
integer height = 108
integer taborder = 330
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Ajouter Auto"
end type

event clicked;if Messagebox("ATTENTION","Confirmez-vous l'ajout de soins automatiques ?",Question!,Yesno!,2) = 1 then

	open(w_patience)

	// Recherche de la clé_max déjà saisie 
	//------------------------------------------
	
	double cle_max

	cle_max = 0
	SELECT Max(cle) INTO :cle_max FROM "soins" WHERE code = :var_code_local ;

		if isnull(cle_max) then
			cle_max = 1
		else
			cle_max = cle_max + 1
		end if

	// Recherche du numero_max de semestre déjà saisit
	// -------------------------------------------------------------

	Integer numero_max
	numero_max = 0
	
		SELECT Max(numero) INTO :numero_max FROM "soins", "code_soins" 
		WHERE "soins"."code" = :var_code_local AND "soins"."type" = "code_soins"."code" and "code_soins"."nom" like '%semestre%' ;

		if isnull(numero_max) then
			numero_max = 0
		end if	
		
	double v_cle_soins,v_cle_soins_auto,V_numero,delta,v_tp,v_soins_auto
	integer v_nombre_decalage, nb
	string v_type,v_tp2,v_origine
	char v_mode_decalage
	decimal {2} v_scp_demande,v_scp_accord,v_hn,v_total,v_montant
	date v_date_demande,v_date_accord,prem_date
	string commande
	
	v_soins_auto = dw_auto.getitemnumber(dw_auto.getrow(),"code")
	
	// Curseur sur les soins (tous les soins du modèle)
	DECLARE Cur_soins CURSOR FOR  
	  SELECT "cle","type","numero","date_demande","scp_demande","date_accord","scp_accord","hn",  
        "total", "tp" ,  "mode_decalage", "nombre_decalage"
    FROM "soins_auto" WHERE code = :v_soins_auto order by "date_demande" ;


	// Curseur sur les lignes de soins (du soin en cours)
	DECLARE Cur_lsoins CURSOR FOR  
	  SELECT "cle", "date", "montant", "tp", "origine_tp", "mode_decalage", "nombre_decalage" 
	    FROM "ligne_soins_auto" WHERE code = :v_soins_auto and cle = :v_cle_soins_auto ;


	OPEN cur_soins ;

	FETCH cur_soins INTO :v_cle_soins_auto,:v_type,:v_numero,:v_date_demande,
				:v_scp_demande,:v_date_accord,:v_scp_accord,:v_hn,   
   			    :v_total,:v_tp, :v_mode_decalage, :v_nombre_decalage ;

	// Recherche de l'écart de jours pour les dates ...
	prem_date = date(em_deb.text)
	
	// Boucle sur les lignes de soins 
	//-----------------------------------
	Do while SQLCA.sqlcode = 0 

		v_cle_soins = v_cle_soins + cle_max 

		// On poursuit la numérotation des semestres .. si le soin en est un ...
		nb = 0
		SELECT count(*) INTO :nb FROM "code_soins" 
		WHERE "code_soins"."code" = :v_type and "code_soins"."nom" like '%semestre%' ;

		IF nb > 0 THEN
			v_numero += numero_max
		else
			// On n'est plus sur un semestre => On regarde si c'est une contention
			nb = 0
			SELECT count(*) INTO :nb FROM "code_soins" 
			WHERE "code_soins"."code" = :v_type and "code_soins"."nom" like '%contention%' ;
			IF nb > 0 THEN
				// C'est une contention ....
				numero_max = 0
			else
				// C'est ni un semestre, ni une contention => On laisse béton
			end if
		END IF
		
		
		integer v_duree
		date v_date_temp
		date date_execution
		
		// Recherche si le CODE DE SOIN est soumis à entente
		SELECT "duree" INTO :v_duree FROM "code_soins"  WHERE code = :v_type ;
		

		// Selon le mode de décalage, par jour ou par mois
		if v_mode_decalage = 'J' then

			v_date_temp = relativedate(prem_date, v_nombre_decalage)
			if v_duree > 0 then
				date_execution = ajout_x_mois(v_date_temp,v_duree )
			else
				date_execution = v_date_temp
			end if

			
			// Décalage par jour
			INSERT INTO "soins"  
				( "cle",    "code",   "type",    "numero",   "date_demande",   "scp_demande",   
				  "date_accord",   "scp_accord",   "hn",    "total",   "tp" , "date_exe")  
			VALUES ( :v_cle_soins,   :var_code_local,  :v_type,   :v_numero,   
				  :v_date_temp ,   :v_scp_demande,   null ,   :v_scp_accord,   
				  :v_hn,  :v_total,   :v_tp , :date_execution)  ;
		else

			v_date_temp = ajout_x_mois(prem_date, v_nombre_decalage)
			
			if v_duree > 0 then
				date_execution = ajout_x_mois(v_date_temp,v_duree )
			else
				date_execution = v_date_temp
			end if

			// Décalage par mois
			INSERT INTO "soins"  ( "cle", "code", "type",    "numero",   "date_demande",   "scp_demande",   
				 "date_accord",   "scp_accord",   "hn",    "total",   "tp" ,"date_exe")  
				VALUES ( :v_cle_soins,   :var_code_local,  	:v_type,   :v_numero,  
				  :v_date_temp ,   :v_scp_demande,   null,   :v_scp_accord,   :v_hn,  :v_total,   :v_tp , :date_execution)  ;
		end if
		
		if sqlca.sqlcode <> 0 then
			MessageBox("ATTENTION !", "Erreur en ajout de soins !~n~n"+sqlca.sqlerrText)
		else
							  
			  // Récupération de la date calculée
			  SELECT "date_demande"  into :v_date_demande FROM "soins" WHERE "code" = :var_code_local and "cle" = :v_cle_soins ;
	
			// Boucle sur les lignes de soins du soin en cours
			//-------------------------------------------------------
	
			OPEN cur_lsoins ;
		
			FETCH cur_lsoins INTO :v_cle_soins_auto,:v_date_temp,:v_montant,:v_tp2, :v_origine, :v_mode_decalage, :v_nombre_decalage ;
			
			Do while SQLCA.sqlcode = 0 
		
				// Selon le mode de décalage, par jour ou par mois
				if v_mode_decalage = 'J' then
					// Décalage par jour
					INSERT INTO "ligne_soins"  
						( "cle",    "code",    "date",    "montant",    "tp","origine_tp")  
					VALUES ( :v_cle_soins,   :var_code_local,  dateadd (day, :v_nombre_decalage, :v_date_demande),   :v_montant,   :v_tp2, :v_origine) ;
				else
					INSERT INTO "ligne_soins"  
						( "cle",    "code",    "date",    "montant",    "tp","origine_tp")  
					VALUES ( :v_cle_soins,   :var_code_local,  dateadd (month, :v_nombre_decalage, :v_date_demande),   :v_montant,   :v_tp2, :v_origine) ;
				end if
		
				if sqlca.sqlcode <> 0 then
					MessageBox("ATTENTION !", "Erreur en ajout lignes de soins !~n~n"+sqlca.sqlerrText)
				end if

				FETCH cur_lsoins INTO :v_cle_soins_auto,:v_date_temp,:v_montant,:v_tp2, :v_origine, :v_mode_decalage, :v_nombre_decalage ;
		
			LOOP
		
			close cur_lsoins ; // Fin de la boucle sur les lignes
		
		end if // Fin du test de l'erreur de l'ajout sur les soins
		
		
		
		// On passe au soin suivant

		FETCH cur_soins INTO :v_cle_soins_auto,:v_type,:v_numero,:v_date_demande,
					:v_scp_demande,:v_date_accord,:v_scp_accord,:v_hn,   
					 :v_total,:v_tp, :v_mode_decalage, :v_nombre_decalage ;

	LOOP

	close cur_soins ;  // Fin de la boucle sur les soins

//	if Messagebox("ATTENTION","La date de première demande peut être mise à jour automatiquement au "+string(prem_date)+"~n~nSouhaitez-vous cette mise à jour ?",Question!,Yesno!,2) = 1 then
//	  	UPDATE "patient"  
//    	 	SET "date_prem_demande" = :prem_date  
//	  	WHERE code = :var_code_local   ;
//	end if


	// On se sert de v_date pour le passage de paramère ...
	v_date = prem_date
	openWithParm(w_soins_maj_date,var_code_local)

	commit ;
	close(w_patience)
end if

ajlig(false)

dw_soins.retrieve(var_code_local)

// Pour repositionner la ligne
Parent.TriggerEvent(Show!)
end event

type cb_auto from commandbutton within w_soins_maj
integer x = 1829
integer y = 1712
integer width = 343
integer height = 108
integer taborder = 170
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "S&oins Auto."
end type

event clicked;cb_ajouter.visible = false
cb_supprimer.visible = false
cb_modifier.visible = false
cb_autre.visible = false
cb_auto.visible = false
cb_fermer.visible = false
cb_imprimer.visible = false
cb_trait.visible = false
cb_dep.visible = false
cb_bis.visible = false
cb_enregistrer_impr.visible = false
cb_annuler_impr.visible = false

dw_auto.retrieve()

if dw_auto.rowcount() > 0 then
	
	cb_ajouter_auto.visible = true
	cb_annuler_auto.visible = true

	dw_detail.visible = false
	dw_impression.visible = false
	em_deb.visible = true
	st_auto1.visible = true
	st_auto2.visible = true
	dw_auto.visible = true
	
	date d
	SELECT date_prem_demande INTO :d FROM patient WHERE code = :var_code_local ;

	if isnull(d) then
		d = today()
	end if

	em_deb.text = string(d)
	em_deb.setfocus()
else
	MessageBox("ATTENTION","Vous n'avez pas de soins automatiques saisis !")
	cb_ajouter.visible = true	
	cb_supprimer.visible = true	
	cb_modifier.visible = true	
	cb_autre.visible = true	
	cb_auto.visible = true	
	cb_fermer.visible = true	
	cb_imprimer.visible = true	
	cb_trait.visible = true	
	cb_enregistrer_impr.visible = true	
	cb_annuler_impr.visible = true	
end if
end event

type dw_detail from datawindow within w_soins_maj
integer x = 5
integer y = 1072
integer width = 1605
integer height = 640
integer taborder = 120
boolean titlebar = true
string title = "Echéances"
string dataobject = "dw_detail_soin"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_type_soins from dropdownlistbox within w_soins_maj
boolean visible = false
integer x = 27
integer y = 208
integer width = 530
integer height = 512
integer taborder = 350
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
string text = "Type de soins"
boolean sorted = false
boolean vscrollbar = true
string item[] = {"Semestre","Consultation","Radio","Contention","Hors Nomenclature","Divers"}
borderstyle borderstyle = stylelowered!
end type

event getfocus;CHOOSE CASE this.text
	CASE "Consultation"
		ancien_soin = "O"
	CASE "Radio"
		ancien_soin = "R"
	CASE "Semestre"
		ancien_soin = "S"
	CASE "Contention"
		ancien_soin = "C"
	CASE "Divers"
		ancien_soin = "D"
	CASE "Hors Nomenclature"
		ancien_soin = "H"
	CASE ELSE
		messagebox("ATTENTION !","Problème de choix !!!")
		return
END CHOOSE

if premiere then
	premiere = false
	ancien_soin = "!"
else
	CHOOSE CASE ancien_soin
	CASE "O"
		// Consultation
		em_scp_dem.visible = false
		em_scp_acc.visible = false
		em_tp.visible = true
		em_num.visible = false
		em_date_acc.visible = false
		em_hn.visible = true
	CASE "R"
		// Radio
		em_num.visible=false
	CASE "S"
		// Semestre
	CASE "D"
		// Divers
	CASE "C"
		// Contention	
	CASE "H"
		// Hors Nomenclature
		em_date_acc.visible = false
		em_scp_dem.visible = false
		em_scp_acc.visible = false
		em_tp.visible = false
		em_num.visible = false
	END CHOOSE
end if
cb_enregistrer.enabled ( false)
cb_annuler.enabled ( false)





end event

event losefocus;CHOOSE CASE this.text
	CASE "Consultation"
		type_soin = "O"
	CASE "Radio"
		type_soin = "R"
	CASE "Semestre"
		type_soin = "S"
	CASE "Contention"
		type_soin = "C"
	CASE "Divers"
		type_soin = "D"
	CASE "Hors Nomenclature"
		type_soin = "H"
	CASE ELSE
		messagebox("ATTENTION !","Problème de choix !")
		return
END CHOOSE

cb_enregistrer.enabled ( true)


if type_soin <> ancien_soin then
// Le type de soins est différent du type initial

	em_scp_dem.visible = true
	em_scp_acc.visible = true
	em_tp.visible = true
	em_num.visible = true
	em_date_acc.visible = true
	em_hn.visible = true


	reset_saisie()

	em_tp.text = string(tp_def)

	CHOOSE CASE Type_soin
	CASE "O"
		// Consultation
		em_hn.text = string(prix_cons)
		em_date_dem.text = string(today())
		em_scp_dem.visible = false
		em_scp_acc.visible = false
		em_tp.visible = true
		em_num.visible = false
		em_date_acc.visible = false
		em_hn.visible = true
		em_date_dem.setfocus()
	CASE "R"
		// Radio
		em_num.visible=false
		em_scp_dem.text = "27"
		em_date_dem.text = string(today())
		em_date_dem.setfocus()
	CASE "S"
		// Semestre
		integer mn
		select max(numero) INTO :mn from soins where code = :var_code_local and type = 'S' ;
		if isnull(mn) then
			mn = 0
		end if
		mn = mn + 1
		if mn >= 10 then
			mn = 0
		end if
		em_hn.text = string(hn_def)
		em_num.text = string(mn)
		em_scp_dem.text = "90"
		em_date_dem.text = string(today())
		em_num.setfocus()
	CASE "D"
		// Divers
		em_scp_dem.text = "5"
		em_date_dem.text = string(today())
		em_num.setfocus()
	CASE "C"
		// Contention	
		em_scp_dem.text = "75"
		em_date_dem.text = string(today())
		em_num.setfocus()
	CASE "H"
		// Hors Nomenclature
		em_date_dem.text = string(today())
		em_date_dem.setfocus()
		em_date_acc.visible = false
		em_scp_dem.visible = false
		em_scp_acc.visible = false
		em_tp.visible = false
		em_num.visible = false
		em_date_dem.setfocus()
	END CHOOSE
end if


cb_annuler.enabled ( true)
maj_total()
end event

type st_total from statictext within w_soins_maj
boolean visible = false
integer x = 2894
integer y = 112
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "Total"
alignment alignment = center!
end type

type st_tp from statictext within w_soins_maj
boolean visible = false
integer x = 2583
integer y = 112
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "TP"
alignment alignment = center!
end type

type st_hn from statictext within w_soins_maj
boolean visible = false
integer x = 2135
integer y = 112
integer width = 402
integer height = 72
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "Dépassement"
alignment alignment = center!
end type

type st_num from statictext within w_soins_maj
boolean visible = false
integer x = 1353
integer y = 116
integer width = 119
integer height = 64
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "N°"
alignment alignment = center!
end type

type st_accord from statictext within w_soins_maj
boolean visible = false
integer x = 1682
integer y = 464
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "Accord"
alignment alignment = center!
end type

type st_demande from statictext within w_soins_maj
boolean visible = false
integer x = 1637
integer y = 112
integer width = 293
integer height = 72
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "Demande"
alignment alignment = center!
end type

type st_soin from statictext within w_soins_maj
boolean visible = false
integer x = 110
integer y = 112
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
string text = "Soin"
alignment alignment = center!
end type

type dw_edition from datawindow within w_soins_maj
boolean visible = false
integer x = 265
integer y = 300
integer width = 494
integer height = 360
integer taborder = 110
string dataobject = "dw_soins_edition"
boolean livescroll = true
end type

event printend;print_ok = false
end event

type dw_montant from datawindow within w_soins_maj
boolean visible = false
integer x = 2103
integer y = 588
integer width = 1431
integer height = 880
integer taborder = 100
string dataobject = "dw_saisie_montant_soin"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event dberror;db_erreur_lignes_soins(dw_montant,sqldbcode,sqlerrtext)
return 1
end event

event clicked;verif_montant()
end event

on losefocus;verif_montant()
end on

event itemfocuschanged;verif_montant()
end event

type em_total from editmask within w_soins_maj
boolean visible = false
integer x = 2857
integer y = 208
integer width = 311
integer height = 96
integer taborder = 90
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "####0.00"
end type

event losefocus;if real(this.text) < 0 then
	this.setfocus()
	son(5)
	Messagebox("ATTENTION","Vous ne pouvez pas saisir un nombre négatif !")
else
	maj_dep()
end if
end event

type em_tp from editmask within w_soins_maj
boolean visible = false
integer x = 2601
integer y = 208
integer width = 183
integer height = 96
integer taborder = 80
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
string displaydata = "~b"
end type

on modified;verif_positif(this)
end on

event losefocus;maj_total()
maj_dep()
verif_positif(this)

end event

type em_hn from editmask within w_soins_maj
boolean visible = false
integer x = 2181
integer y = 208
integer width = 311
integer height = 96
integer taborder = 70
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####.00"
end type

event losefocus;maj_total()


// Pour être sûr de la recherche du CCAM

string v_code 
string v_nature_soin

v_code = dw_nom.getItemString(dw_nom.getRow(),"code")


  SELECT "code_soins"."nature"
    INTO 	:v_nature_soin
    FROM "code_soins"  
   WHERE "code_soins"."code" = :v_code   ;

if v_nature_soin = 'C' then
	soin_saisi_ccam = true
else
	soin_saisi_ccam = false
end if

if not belgique and not soin_saisi_ccam then
	verif_positif(this)
end if


end event

type em_scp_acc from editmask within w_soins_maj
boolean visible = false
integer x = 1888
integer y = 560
integer width = 233
integer height = 96
integer taborder = 60
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###.00"
end type

on losefocus;verif_positif(this)
end on

type em_date_acc from editmask within w_soins_maj
boolean visible = false
integer x = 1545
integer y = 560
integer width = 325
integer height = 96
integer taborder = 50
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_scp_dem from editmask within w_soins_maj
boolean visible = false
integer x = 1829
integer y = 208
integer width = 233
integer height = 96
integer taborder = 40
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "###.00"
string displaydata = ""
end type

on losefocus;verif_positif(this)
if real(this.text) > 0 then
	em_scp_acc.text = this.text
end if
maj_total()
end on

type em_date_dem from editmask within w_soins_maj
boolean visible = false
integer x = 1481
integer y = 208
integer width = 329
integer height = 96
integer taborder = 30
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type dw_impression from datawindow within w_soins_maj
integer x = 1737
integer y = 1060
integer width = 1902
integer height = 640
integer taborder = 280
boolean titlebar = true
string title = "Compléments du soin"
string dataobject = "dw_detail_soin_impression"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;//newmenu.m_soins.popmenu(PointerX(), PointerY())
end event

type dw_soins from datawindow within w_soins_maj
string tag = "soins"
integer y = 8
integer width = 3643
integer height = 1044
integer taborder = 10
boolean titlebar = true
string title = "Lignes de soins"
string dataobject = "dw_soins"
boolean controlmenu = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;if this.rowcount() > 0 and currentrow> 0 then
	dw_detail.retrieve(var_code_local,this.getitemnumber(currentrow,"cle"))
	dw_impression.retrieve(this.getitemnumber(currentrow,"cle"),var_code_local)
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
	This.Setrow(currentrow)
else
	dw_detail.reset()
	dw_impression.reset()
end if

end event

event dberror;db_erreur_soins(dw_soins,sqldbcode,sqlerrtext)
return 1
end event

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

event rbuttondown;integer nb

dw_click = this

If this.getrow() > 0 and row > 0 Then
	
	// Mise à jour des libellés du menu 
	newmenu.m_soins.m_imprimerrecto.text = "Imprimer &Recto Demande Entente Préalable"
	newmenu.m_soins.m_imprimerverso.text = "Imprimer &Verso Demande Entente Préalable"
	newmenu.m_soins.m_imprimerrectoverso.text = "&Imprimer Recto / Verso Demande Entente Préalable"
	
	// pour identifier la fenêtre dans le menu
	w_click_soins = parent
	type_menu = 'S'

	newmenu.m_soins.popmenu(dw_soins.PointerX(), w_mdi_2020.PointerY())
end if


end event

event retrieveend;if rowcount = 1 then
	// spécial ... on simule un changement de ligne pour être sûr qu'il sélectionne la ligne sinon ...
	dw_detail.retrieve(var_code_local,this.getitemnumber(1,"cle"))
	dw_impression.retrieve(this.getitemnumber(1,"cle"),var_code_local)
// S'il n'y a qu'une ligne, on ne met pas le focus pour obliger à cliquer avec le bouton gauche
// sinon, ça plante le bouton droit
//	this.SetRow(1)
//	This.SelectRow(1,True)
else
	if rowcount > 0 then
		dw_detail.retrieve(var_code_local,dw_soins.getitemnumber(rowcount,"cle"))
		dw_impression.retrieve(dw_soins.getitemnumber(rowcount,"cle"),var_code_local)
	else
		dw_detail.reset()
		dw_impression.reset()
	end if
end if



end event

event doubleclicked;// Double clic -> Comme si on cliquait sur "MODIFIER"

if droits_acces[11] = "T" or  droits_acces[11] = "M"  then
	cb_modifier.triggerevent(Clicked!)
end if

end event

type em_num from editmask within w_soins_maj
boolean visible = false
integer x = 1371
integer y = 208
integer width = 91
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
string mask = "##"
end type

on losefocus;verif_positif(this)
end on

type infos_tp from statictext within w_soins_maj
integer x = 59
integer y = 1244
integer width = 933
integer height = 76
integer textsize = -10
string facename = "Arial"
long backcolor = 553648127
alignment alignment = center!
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_soins_maj
boolean visible = false
integer x = 1563
integer y = 1488
integer width = 411
integer height = 152
integer taborder = 220
boolean bringtotop = true
boolean enabled = false
string text = "&Enregistrer"
end type

event clicked;call super::clicked;// 	ENREGISTREMENT DU SOIN
//----------------------------------

decimal {2} reste,secu,tp
double taux_tp

em_date_dem.enabled = false
em_hn.enabled = false
em_date_acc.enabled = false
em_num.enabled = false
em_scp_acc.enabled = false
em_tp.enabled = false
em_total.enabled = false
em_scp_dem.enabled = false
//ddlb_type_soins.enabled = false
dw_nom.enabled = false

cb_ajouter_montant.visible = true
cb_enregistrer_montant.visible = true
cb_supprimer_montant.visible = true


// Depuis la version 8.10g .. .on laisse l'utilisateur gérer ça
//dw_montant.Modify("origine.visible = 0")
//dw_montant.modify("origine_tp.visible = 0")

CHOOSE CASE Action
	CASE "A"
	// Ajout de soin
	
		// taux de tiers payant
		taux_tp = dec(em_tp.text)
		secu = 0
		if dec(em_scp_dem.text) > 0 then 
			secu = round(valeur * dec(em_scp_dem.text),2)
		ELSE
			secu = round(dec(em_hn.text),2)
		end if		

		if taux_tp > 0 then
		// Ajout du montant du tiers payant
			dw_montant.insertrow(0)
			dw_montant.setitem(dw_montant.rowcount(),"code",var_code_local)
//			dw_montant.setitem(dw_montant.rowcount(),"date",date(em_date_dem.text))
			IF em_date_dem.text = '00/00/0000' THEN
				em_date_dem.text = string(Today())
			END IF
			
			// On place le règlement à la fin du soin => recherche de la duree
			string v_type_soin
			integer v_duree
			v_type_soin = dw_nom.gettext()
			select duree into :v_duree from code_soins where code = :v_type_soin ;
			
			
//			dw_montant.setitem(dw_montant.rowcount(),"date",ajout_6mois(date(em_date_dem.text)))
			dw_montant.setitem(dw_montant.rowcount(),"date",ajout_x_mois(date(em_date_dem.text),v_duree))
			dw_montant.setitem(dw_montant.rowcount(),"montant",secu * taux_tp/100)
			dw_montant.setitem(dw_montant.rowcount(),"tp",'O')
			dw_montant.setitem(dw_montant.rowcount(),"origine_tp",'C')
// Depuis la version 8.10g .. .on laisse l'utilisateur gérer ça
//			dw_montant.Modify("origine.visible = 1")
//			dw_montant.modify("origine_tp.visible = 1")
		end if

		reste = dec(em_total.text) - secu * taux_tp/100

		if reste > 0 then
			dw_montant.insertrow(0)
			dw_montant.setitem(dw_montant.rowcount(),"code",var_code_local)
			IF em_date_dem.text = '00/00/0000' THEN
				em_date_dem.text = string(Today())
			END IF	
			dw_montant.setitem(dw_montant.rowcount(),"date",date(em_date_dem.text))
			dw_montant.setitem(dw_montant.rowcount(),"montant",reste)
		end if
		dw_montant.scrolltorow(dw_montant.rowcount())
		dw_montant.setfocus()
CASE "M"
	// Modification de soins
		dw_montant.setfocus()
		taux_tp = double(em_tp.text)
// Depuis la version 8.10g .. .on laisse l'utilisateur gérer ça
//		IF taux_tp > 0 THEN
//			dw_montant.Modify("origine.visible = 1")
//			dw_montant.modify("origine_tp.visible = 1")
//		END IF	
		
END CHOOSE

this.visible = false
dw_montant.visible = true
verif_montant()


end event

type cb_annuler from uo_picturebutton_390x120 within w_soins_maj
boolean visible = false
integer x = 1147
integer y = 1488
integer width = 411
integer height = 152
integer taborder = 230
boolean bringtotop = true
string text = "&Annuler"
end type

event clicked;call super::clicked;ajlig(false)
reset(dw_montant)
dw_montant.visible = false


end event

type cb_enregistrer_montant from uo_picturebutton_390x120 within w_soins_maj
boolean visible = false
integer x = 1563
integer y = 1488
integer width = 411
integer height = 152
integer taborder = 370
boolean bringtotop = true
boolean enabled = false
string text = "&Enregistrer"
end type

event clicked;call super::clicked;// ENREGISTREMENT DE LA SAISIE DES MONTANTS DU SOIN
//---------------------------------------------------------------------

double cle_max
string var_type
integer var_num,var_tp,i
date var_date_dem,var_date_acc
decimal {2} var_scp_dem,var_scp_acc,var_hn,var_tot
date date_impr, date_donne, date_rapport
string comment

var_type = type_soin


// Mise à nulle du N° du soin (pour éviter qu'il affiche Zéro
if integer(em_num.text) = 0 then
	setnull(var_num)
else
	var_num = integer(em_num.text)
end if

// Idem pour SCP
if dec(em_scp_dem.text) = 0 then
	setnull(var_scp_dem)
else
	var_scp_dem = dec(em_scp_dem.text)
end if

// Idem pour Date d'accord
if len(trim(em_date_acc.text)) = 0 or em_date_acc.text="00/00/0000" then
	setnull(var_date_acc)
else
	var_date_acc = date(em_date_acc.text)
end if

// Idem pour date de demande
if len(trim(em_date_dem.text)) = 0 or em_date_dem.text = "00/00/0000" then
	setnull(var_date_dem)
else
	var_date_dem = date(em_date_dem.text)
end if

// Idem pour SCP accordés
if dec(em_scp_acc.text) = 0 then
	setnull(var_scp_acc)
else
	var_scp_acc = dec(em_scp_acc.text)
end if

// Idem pour HN
if dec(em_hn.text) = 0 then
	setnull(var_hn)
else
	var_hn = dec(em_hn.text)
end if

var_tot = dec(em_total.text)

// Idem pour TP
if dec(em_tp.text) = 0 then
	setnull(var_tp)
else
	var_tp = integer(em_tp.text)
end if



CHOOSE CASE Action
	CASE "A"
	// Ajout de soins
		SELECT Max(cle) INTO :cle_max FROM soins WHERE code = :var_code_local ;

		if isnull(cle_max) then
			cle_max = 1
		else
			cle_max = cle_max + 1
		end if

		cle_manip = cle_max


		// ATTENTION ! Depuis 8.10f (CNDA) .. si le soin AJOUTE n'est pas soumis à entente, on met 
		// sa date d'exécution à Date de demande par défaut 
		// depuis la version 10 on le faut aussi pour les autres !!

		integer v_duree
		date date_execution
		
		// Recherche si le CODE DE SOIN est soumis à entente
		SELECT "duree" INTO :v_duree FROM "code_soins"  WHERE code = :var_type ;
		
		if v_duree > 0 then
			date_execution = ajout_x_mois(var_date_dem,v_duree )
		else
			date_execution = var_date_dem
		end if
		
		// Ajout EFFECTIF du soin 
	  	INSERT INTO "soins"  
         ( "cle", "code", "type",  "numero", "date_demande",   
           "scp_demande",  "date_accord",   "scp_accord",   
           "hn",   "total", "tp","date_exe" )  
 		 VALUES ( :cle_max,   :var_code_local, :var_type,   
           :var_num,   :var_date_dem,   :var_scp_dem,   
           :var_date_acc,   :var_scp_acc,    :var_hn,   
           :var_tot,    :var_tp , : date_execution )  ;

	CASE "M"
	// Modification de soins

		UPDATE "soins"  SET
        		"type" = :var_type,   
           "numero" = :var_num,   
           "date_demande" = :var_date_dem,   
           "scp_demande"= :var_scp_dem,   
           "scp_accord" = :var_scp_acc,   
           "hn" = :var_hn,   
           "total" = :var_tot,   
           "tp" = :var_tp
 		  WHERE cle = :cle_manip and code = :var_code_local ;
			
		if isnull(var_date_acc) then
			UPDATE "soins"  SET "date_accord" = Null   
			  WHERE cle = :cle_manip and code = :var_code_local ;
		else
			UPDATE "soins"  SET "date_accord" = :var_date_acc      
			  WHERE cle = :cle_manip and code = :var_code_local ;
		end if
END CHOOSE

if SQLCA.SQLcode = -1 Then
// Problème dans le INSERT ou le UPDATE
		CHOOSE CASE SQLCA.SQLdbCode
		CASE -193
		// Problème de clé 
			Messagebox("ATTENTION !","Ce soin ne peut être temporairement mis à jour !~nRefaites une tentative ou abandonnez l'ajout !")
		CASE ELSE
			Messagebox("Erreur SQL",SQLCA.SQLErrText)
		END CHOOSE
else
	// Tout est ok ! En mise à jour ou en insertion => on peut ajouter les lignes de soins
	dw_montant.visible = false

	FOR i=1 TO dw_montant.rowcount()
		dw_montant.setitem(i,"cle",cle_manip)
	NEXT
	
	if dw_montant.update() = 1 then
		commit ;
	else
		Rollback ;
	end if

	reset(dw_montant)
	ajlig(false)
	dw_soins.retrieve(var_code_local)
	
	// On se met sur le soin qu'on vient d'enregister sinon on reset
	if dw_soins.rowcount() > 0 then
		integer lig_soin
		lig_soin= dw_soins.Find("cle = "+string(cle_manip),1,99999)
		
		// cas de la mise à jour de la première ligne qui fait qu'on doit simuler un mouvement pour mettre à jour les dw du bas
		if lig_soin = 1 then
			dw_soins.Scrolltorow(dw_soins.rowcount())
		end if
		
		dw_soins.Scrolltorow(lig_soin)
		dw_soins.SetRow(lig_soin)
		dw_soins.SelectRow(0,False)
		dw_soins.SelectRow(lig_soin,True)
		dw_soins.setfocus()
	else
		dw_detail.reset()
		dw_impression.reset()
	end if


end if


end event

type cb_ajouter_montant from uo_picturebutton_250x120 within w_soins_maj
boolean visible = false
integer x = 731
integer y = 1460
integer width = 411
integer height = 112
integer taborder = 340
boolean bringtotop = true
string text = "&Ajouter"
end type

event clicked;call super::clicked;// AJOUT D'UNE NOUVELLE ECHEANCE DE REGLEMENT
//------------------------------------------------------------

integer i
decimal {2} tot
tot = 0
FOR i=1 TO dw_montant.rowcount()
	tot = tot + dw_montant.getitemdecimal(i,"montant")
NEXT

if dec(em_total.text) > tot then
 	dw_montant.insertrow(0)
	dw_montant.setitem(dw_montant.rowcount(),"code",var_code_local)
	dw_montant.setitem(dw_montant.rowcount(),"date",date(em_date_dem.text))
	dw_montant.setitem(dw_montant.rowcount(),"montant",dec(em_total.text) - tot)
	dw_montant.setitem(dw_montant.rowcount(),"origine_tp"," ")
	dw_montant.scrolltorow(dw_montant.rowcount())
	dw_montant.setcolumn("date")
	dw_montant.setfocus()
end if


end event

type cb_supprimer_montant from uo_picturebutton_250x120 within w_soins_maj
boolean visible = false
integer x = 731
integer y = 1560
integer width = 411
integer height = 112
integer taborder = 350
boolean bringtotop = true
string text = "&Supprimer"
end type

event clicked;call super::clicked;son(7)
dw_montant.deleterow(dw_montant.getrow())
verif_montant()
end event

