$PBExportHeader$w_soins_reg_maj_echeances.srw
forward
global type w_soins_reg_maj_echeances from w_fenetre_arakis
end type
type dw_montant from datawindow within w_soins_reg_maj_echeances
end type
type dw_montant_soins_prevus from datawindow within w_soins_reg_maj_echeances
end type
type cb_ajouter_montant from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
end type
type cb_supprimer_montant from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
end type
type cb_annuler_montant from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
end type
type cb_enregistrer_montant from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
end type
type pb_calculatrice from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
end type
type pb_echeance_auto_generer from uo_picturebutton_250x120 within w_soins_reg_maj_echeances
end type
type st_echeance_auto_date_depart from statictext within w_soins_reg_maj_echeances
end type
type em_echeance_auto_date_depart from editmask within w_soins_reg_maj_echeances
end type
type st_echeance_auto_mensualites from statictext within w_soins_reg_maj_echeances
end type
type em_echeance_auto_mensualites from editmask within w_soins_reg_maj_echeances
end type
type st_echeance_auto_periodicite from statictext within w_soins_reg_maj_echeances
end type
type ddlb_echeance_auto_periodicite from dropdownlistbox within w_soins_reg_maj_echeances
end type
type st_echeance_auto_acompte from statictext within w_soins_reg_maj_echeances
end type
type em_echeance_auto_acompte from editmask within w_soins_reg_maj_echeances
end type
type ddlb_soins from dropdownlistbox within w_soins_reg_maj_echeances
end type
type em_num from editmask within w_soins_reg_maj_echeances
end type
type em_date_dem from editmask within w_soins_reg_maj_echeances
end type
type em_scp_dem from editmask within w_soins_reg_maj_echeances
end type
type em_hn from editmask within w_soins_reg_maj_echeances
end type
type em_tp from editmask within w_soins_reg_maj_echeances
end type
type em_total from editmask within w_soins_reg_maj_echeances
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
end type
type cb_annuler from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
end type
type st_soin from statictext within w_soins_reg_maj_echeances
end type
type st_num from statictext within w_soins_reg_maj_echeances
end type
type st_demande from statictext within w_soins_reg_maj_echeances
end type
type st_hn from statictext within w_soins_reg_maj_echeances
end type
type st_tp from statictext within w_soins_reg_maj_echeances
end type
type st_total from statictext within w_soins_reg_maj_echeances
end type
type dw_nom from datawindow within w_soins_reg_maj_echeances
end type
type st_date_impr from statictext within w_soins_reg_maj_echeances
end type
type em_date_impr from editmask within w_soins_reg_maj_echeances
end type
type em_date_acc from editmask within w_soins_reg_maj_echeances
end type
type em_scp_acc from editmask within w_soins_reg_maj_echeances
end type
type gb_echeance_auto from groupbox within w_soins_reg_maj_echeances
end type
type rb_patient from radiobutton within w_soins_reg_maj_echeances
end type
type rb_caisse from radiobutton within w_soins_reg_maj_echeances
end type
type rb_mutuelle from radiobutton within w_soins_reg_maj_echeances
end type
type sle_association from singlelineedit within w_soins_reg_maj_echeances
end type
type st_association from statictext within w_soins_reg_maj_echeances
end type
type cbx_remb_excep from checkbox within w_soins_reg_maj_echeances
end type
type st_dent from statictext within w_soins_reg_maj_echeances
end type
type sle_dent from singlelineedit within w_soins_reg_maj_echeances
end type
type st_exo from statictext within w_soins_reg_maj_echeances
end type
type ddlb_exo from dropdownlistbox within w_soins_reg_maj_echeances
end type
type cbx_pseudocodes from checkbox within w_soins_reg_maj_echeances
end type
type pb_schema from picturebutton within w_soins_reg_maj_echeances
end type
type st_modificateurs from statictext within w_soins_reg_maj_echeances
end type
type sle_modificateurs from singlelineedit within w_soins_reg_maj_echeances
end type
end forward

global type w_soins_reg_maj_echeances from w_fenetre_arakis
integer width = 3899
integer height = 2268
string title = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
dw_montant dw_montant
dw_montant_soins_prevus dw_montant_soins_prevus
cb_ajouter_montant cb_ajouter_montant
cb_supprimer_montant cb_supprimer_montant
cb_annuler_montant cb_annuler_montant
cb_enregistrer_montant cb_enregistrer_montant
pb_calculatrice pb_calculatrice
pb_echeance_auto_generer pb_echeance_auto_generer
st_echeance_auto_date_depart st_echeance_auto_date_depart
em_echeance_auto_date_depart em_echeance_auto_date_depart
st_echeance_auto_mensualites st_echeance_auto_mensualites
em_echeance_auto_mensualites em_echeance_auto_mensualites
st_echeance_auto_periodicite st_echeance_auto_periodicite
ddlb_echeance_auto_periodicite ddlb_echeance_auto_periodicite
st_echeance_auto_acompte st_echeance_auto_acompte
em_echeance_auto_acompte em_echeance_auto_acompte
ddlb_soins ddlb_soins
em_num em_num
em_date_dem em_date_dem
em_scp_dem em_scp_dem
em_hn em_hn
em_tp em_tp
em_total em_total
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
st_soin st_soin
st_num st_num
st_demande st_demande
st_hn st_hn
st_tp st_tp
st_total st_total
dw_nom dw_nom
st_date_impr st_date_impr
em_date_impr em_date_impr
em_date_acc em_date_acc
em_scp_acc em_scp_acc
gb_echeance_auto gb_echeance_auto
rb_patient rb_patient
rb_caisse rb_caisse
rb_mutuelle rb_mutuelle
sle_association sle_association
st_association st_association
cbx_remb_excep cbx_remb_excep
st_dent st_dent
sle_dent sle_dent
st_exo st_exo
ddlb_exo ddlb_exo
cbx_pseudocodes cbx_pseudocodes
pb_schema pb_schema
st_modificateurs st_modificateurs
sle_modificateurs sle_modificateurs
end type
global w_soins_reg_maj_echeances w_soins_reg_maj_echeances

type variables
decimal {2} prix_scp,prix_cons,prix_radio
char action
double cle_manip,var_code_local,hn_def,tp_def, var_numero_dossier_local
string type_soin,ancien_soin,var_nom_local
boolean premiere
decimal {2} nb_lettre, depasse
decimal {6} valeur

decimal {2} d_total_a_ouverture

boolean soin_saisi_ccam = false

integer var_code_devis_local 	// devis courant - sélectionné


string v_code_praticien_fs		// servira aussi à la fenêtre w_soins_reg_televitale appelée

// pour position la liste des soins ...
string chaine_saisie_liste_soins = ""

// Fenetre appelante !!
w_soins_reg_maj w_soins_reg_maj_parent

// Dw de la fenetre appelante
datawindow dw_soins, dw_soins_prevus


// pour le cadre de remboursement
//string cadre_facture = ''

// menu clic droit des soins et reglements
m_orthosoins newmenu
//
// pour impression FS ou DEP intégrée
//boolean impression_integre = false

// Module : vaudra P, S ou R
string type_gestion



// Pour savoir si on peut modifier un soin ... sera utile pour le double clic sur les échéances ... si le soin est transféré ou pas
boolean modif_ok


// Pour la belgique
// Liste des soins nécessitant l'ajout d'un pseudo code 

string tab_code_soins_tarif_maxi[], tab_pseudo_code_tarif_maxi[], tab_pseudo_libelle_tarif_maxi[]
decimal{2} tab_pseudo_montant_tarif_maxi[]

end variables

forward prototypes
public subroutine verif_montant (datawindow dw)
public subroutine maj_total ()
public subroutine reset_saisie ()
public subroutine maj_dep ()
public subroutine echeance_auto_visible (boolean v_visible)
public subroutine insertion_soins (double cle_soin_ajoute)
public subroutine maj_liste_nom_des_soins (string v_soins)
public subroutine actualiser_liste_codes_soins ()
public subroutine automatisme_tp (long row, datawindow dwo, string column, string data)
end prototypes

public subroutine verif_montant (datawindow dw);
// dw est la dw à vérifier : pour les soins et pour les soins prevus

integer i
decimal {2} tot

dw.accepttext()

tot = 0
FOR i=1 TO dw.rowcount()
	tot = tot + dw.getitemdecimal(i,"montant")
NEXT

if tot = dec(em_total.text) then
	cb_enregistrer_montant.enabled ( true)
	cb_enregistrer_montant.default ( true)
else
	cb_enregistrer_montant.enabled ( false)
end if
end subroutine

public subroutine maj_total ();// Mise à jour de la zone TOTAL

decimal {2} v_scp, v_hn, v_tp, v_total

v_scp = dec(em_scp_dem.text)
v_hn = dec(em_hn.text)
v_tp = dec(em_tp.text)
v_total = dec(em_total.text)
zero (v_scp)
zero (v_hn)
zerodb(v_tp)


if v_scp > 0 then 
	double t
	t = round(valeur * v_scp + v_hn,2)
	em_total.text = string(t, "0.00")
else
	em_total.text = string(round(v_hn,2))
end if

// On tient compte du TP de la manière suivante :
//		   partie secu x %TP > valeur totale ... on prend cette valeur là pour réévaluer le reste .... (idée de FOURQUET)
//
// Calcul provisoire du total en tenant compte de la zone TP
//decimal {2} total_tp
//total_tp = round(valeur * v_scp * v_tp / 100 ,2)
//
//v_total =  dec(em_total.text)
//
//if total_tp > v_total then
//	em_total.text = string(total_tp)
//end if
//

// autorisation ou non des soins à zéro
boolean soin_a_zero
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

v_total = dec(em_total.text)

//On accepte les soins à zéro pour la belgique (seulement pour l'instant V12.04b)
if (v_total > 0 and not soin_a_zero) or (v_total >= 0 and soin_a_zero) then
	 cb_enregistrer.enabled ( true)
	cb_enregistrer.default ( true)
else
	cb_enregistrer.enabled ( false)
end if

end subroutine

public subroutine reset_saisie ();//em_date_acc.text = ""
em_date_dem.text = ""
em_hn.text = ""
em_tp.text = ""
em_total.text = ""
em_scp_dem.text = ""
//em_scp_acc.text = ""
em_num.text = ""
em_total.text = ""

sle_association.text = ""
sle_dent.text = ""
sle_modificateurs.text = ""
cbx_remb_excep.checked = false
end subroutine

public subroutine maj_dep ();// Met à jour la zone DEP déplacement en fonction des valeurs saisies :
//   Lettres , Total, TP

string hn_prov 				// Variable temporaire de calcul du dépassement

string a

a = em_scp_dem.text

decimal {2} ld_scp_dem, ld_total, ld_hn_prov

ld_scp_dem = dec(em_scp_dem.text)
ld_total = dec(em_total.text)

//if ld_scp_dem > 0 then 
//	// C'est un soin avec Entente
//	hn_prov = string ( ld_total - round(valeur * ld_scp_dem, 2 ) )
//else
//	// Il n'y pas pas de demande d'entente
//	hn_prov = em_total.text
//end if
//
//ld_hn_prov = dec(hn_prov)

ld_hn_prov = dec(em_hn.text)

if ld_hn_prov < 0 and not belgique and not luxembourg and not (france and soin_saisi_ccam ) then
	// Impossible
	Messagebox("ATTENTION","Vous ne pouvez pas saisir un tel montant ("+libelle_depassement+" négatif) !")
	em_hn.setfocus()
else
	// Si le total est > au tarif de base, on calcule de HN
	if ld_total > round(ld_scp_dem * valeur, 2) then
		em_hn.text = string ( ld_total - round(ld_scp_dem * valeur, 2) ) 
	end if
end if



// autorisation ou non des soins à zéro
boolean soin_a_zero
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

//On accepte les soins à zéro pour la belgique (seulement pour l'instant V12.04b)
if (ld_total > 0 and not soin_a_zero) or (ld_total >= 0 and soin_a_zero) then
	 cb_enregistrer.enabled ( true)
	cb_enregistrer.default ( true)
else
	cb_enregistrer.enabled ( false)
end if


end subroutine

public subroutine echeance_auto_visible (boolean v_visible);// Génération d'échéances automatique
gb_echeance_auto.visible = v_visible
pb_echeance_auto_generer.visible = v_visible
em_echeance_auto_date_depart.visible = v_visible
st_echeance_auto_date_depart.visible = v_visible
em_echeance_auto_mensualites.visible = v_visible
st_echeance_auto_mensualites.visible = v_visible
em_echeance_auto_acompte.visible = v_visible
st_echeance_auto_acompte.visible = v_visible
st_echeance_auto_periodicite.visible = v_visible
ddlb_echeance_auto_periodicite.visible = v_visible
pb_calculatrice.visible = v_visible
if v_visible then
	// par défaut la date du soin
	em_echeance_auto_date_depart.text = em_date_dem.text
	// le montant du soins
	em_echeance_auto_acompte.text = "0"
	// 1 mensualités
	em_echeance_auto_mensualites.text = '1'
end if

if v_visible then 
	rb_patient.visible = v_visible
	rb_caisse.visible = v_visible
	rb_mutuelle.visible = v_visible
end if
end subroutine

public subroutine insertion_soins (double cle_soin_ajoute);// Test si le soin ajouté peut impliquer un décalage des soins suivants
// Si oui ... question et décalage ...
//-------------------------------------------------------------------------------

date v_date_ajout
string v_type_ajout
integer v_duree_ajout, v_cpt_ajout, v_ligne_ajout

 
if type_gestion = 'S' or type_gestion = 'R' then 
	
	
	// Recherche des infos sur le soin ajouté
	select "soins"."date_demande" , "soins"."type", "code_soins"."duree" 
	into :v_date_ajout, :v_type_ajout, :v_duree_ajout
	from soins, code_soins 
	where "soins"."type" = "code_soins"."code" and soins.code = :var_code_local and soins.cle = :cle_soin_ajoute ;
	
	if v_duree_ajout > 0 and France then
		// le soin ajouté à une durée => on va peut être devoir décaler la suite
		
		// Est ce qu'il y a des soins suivants qui ont des durées => décalables ?
		select isnull(count(*),0) into :v_cpt_ajout 
		from soins , code_soins
		where "soins"."type" = "code_soins"."code" and soins.code = :var_code_local and soins.cle <> :cle_soin_ajoute and soins.date_demande >= :v_date_ajout and code_soins.duree > 0 ;
		
		if v_cpt_ajout > 0 then 
			
			if Messagebox("ATENTION !","Voulez-vous décaler automatiquement les soins suivants ?",Question!, Yesno!, 2) = 1 then
				
				// On va décaler les soins suivants ...
				
				dw_soins.retrieve(var_code_local)
				v_ligne_ajout = dw_soins.find("date_demande >= date('"+ string(v_date_ajout)+"') and cle <> "+string(cle_soin_ajoute),1,99999)
									
				if v_ligne_ajout > 0 then
				
					// pour identifier la fenêtre dans le menu
					
					dw_soins.ScrollToRow(v_ligne_ajout)
					dw_soins.SetRow(v_ligne_ajout)
					type_menu = 'S'
					dw_click = dw_soins
					newmenu = create m_orthosoins
					newmenu.decalage_partiel( 'T' , false, cle_soin_ajoute )
						
				end if
			end if
		end if
	end if
end if
end subroutine

public subroutine maj_liste_nom_des_soins (string v_soins);
	
// datawindow
dw_nom.setitem(1, "code", v_soins)
dw_nom.SetFocus()


end subroutine

public subroutine actualiser_liste_codes_soins ();// Actualisation de la liste des soins en fonction de ceratins critères

string v_pour_qui, nom_soin, v_code_lu, v_adulte
integer v_ordre_trie
string v_pseudocode
double v_couleur_fond

// On passe les datas dans une table temporaire spéciale pour cette fonction
string s_commande


SELECT adulte into :v_adulte from patient where code = :var_code_local ;

s_commande = 'CREATE LOCAL TEMPORARY TABLE "temp_code_soins" ("code" char(20) NOT NULL DEFAULT NULL, "nom" char(200) DEFAULT NULL,  "ordre_trie" integer DEFAULT NULL, "couleur_fond" double DEFAULT NULL, PRIMARY KEY ("code")) ON COMMIT PRESERVE ROWS  ;'
execute immediate :s_commande ;


// Si pas le 1er usage on nettoie 
Delete from temp_code_soins ;

declare cur CURSOR for select trim(nom), pour_qui, code, ordre_trie, isnull(pseudocode, 'N'), couleur_fond from code_soins where actif = 1 
order by ordre_trie, nom, code ;

open cur ; 
fetch cur into :nom_soin, :v_pour_qui, :v_code_lu, :v_ordre_trie, :v_pseudocode, :v_couleur_fond  ;

do while sqlca.sqlcode = 0 
	
	if v_pour_qui = "D" or (v_pour_qui = 'E' and v_adulte = "N") or  (v_pour_qui = 'A' and v_adulte = "O") then
		if belgique then
			if cbx_pseudocodes.checked then
				insert into temp_code_soins ("code", "nom", "ordre_trie", "couleur_fond")
				values ( :v_code_lu, :nom_soin, :v_ordre_trie, :v_couleur_fond ) ;
			else
				if not cbx_pseudocodes.checked and v_pseudocode = "N"  then
					insert into temp_code_soins ("code", "nom", "ordre_trie", "couleur_fond")
					values ( :v_code_lu, :nom_soin, :v_ordre_trie, :v_couleur_fond ) ;
				end if
			end if
		else 
			// Pas belgique
				insert into temp_code_soins ("code", "nom", "ordre_trie", "couleur_fond")
				values ( :v_code_lu, :nom_soin, :v_ordre_trie , :v_couleur_fond) ;
		end if
	end if
	
fetch cur into :nom_soin, :v_pour_qui, :v_code_lu, :v_ordre_trie, :v_pseudocode, :v_couleur_fond  ;
	
loop

close cur ;

// Saisies suggérées
if profilestring(dir_ini+inifile_orthokis,"recherche","desactiver_saisies_suggerees","N") = "O" then
	dw_nom.Object.code.dddw.AllowEdit = 'No'
end if
	
	
DataWindowChild fille

if dw_nom.GetChild( "code", fille) <> -1 then
	fille.settransobject(sqlca)
	fille.Reset()
	fille.Retrieve()
else
	Messagebox("ATTENTION", "Erreur dans l'actualisation de la liste des types de soins.")
end if





dw_nom.retrieve()
end subroutine

public subroutine automatisme_tp (long row, datawindow dwo, string column, string data);

// Selon la valeur de TP, on modifie la valeur par défaut de origine tp
// la valeur n'est pas encore modifiée => On teste la valeur inverse !!!!
//
// selon ce qu'on modifie, la valeur doit être tester à l'inverse


if column = "tp" then
	if data = "O" then
		if dwo.GetItemString(row,"Origine_TP") <> "C" and dwo.GetItemString(row,"Origine_TP") <> "M"  then
			dwo.SetItem(row,"Origine_TP", "C")
			
			
			if FRANCE and dwo.rowcount() = 1 then
				// On calcule le montant rembousable par la caisse 
				string v_lettre, v_nature
				decimal{2} v_nb_lettre
				integer v_pourcent, v_duree
				double v_valeur
				date v_date_demande, v_date_echeance
				select upper(lettre), nb_lettre, valeur, isnull(duree,0), nature 
				into :v_lettre, :v_nb_lettre, :v_valeur, :v_duree, :v_nature
				from code_soins where code = :type_soin ;

				v_pourcent = 0
				
				if v_nature = "N" then
					// Actes NGAP
					choose case v_lettre
						case "FDO", "FDA"
							v_pourcent = 100
						case "TO", "ORT"
							if  nb_lettre >= 50 or nb_lettre = 45 then
								v_pourcent = 100
							else
								if today() < date("2027-01-01") then
									v_pourcent = 60
								else
									v_pourcent = 50
								end if

							end if
						case "C", "CS", "CD", "CSD", "Z"
								if today() < date("2027-01-01") then
									v_pourcent = 60
								else
									v_pourcent = 50
								end if

					end choose
				else
					v_pourcent = 100
				end if
				
				// On modifie le montant ...
				dwo.SetItem(row,"montant", (v_valeur * v_nb_lettre * v_pourcent) / 100 )
				
				if v_duree > 0 then
					// On décale l'écheance TP à la fin du soin
					v_date_demande = date(em_date_dem.text)
					v_date_echeance = ajout_x_mois(v_date_demande, v_duree)
					dwo.SetItem(row,"date", v_date_echeance)
				end if
				
				if  (v_valeur * v_nb_lettre * v_pourcent) / 100  < dec(em_total.text) then
					// On ajoute une ligne
					cb_ajouter_montant.postevent(clicked!)
				end if

				
			end if	

			
			
		end if
	else
		dwo.SetItem(row,"Origine_TP", " ")
	end if
else
	if column = "origine_tp" then 
		if dwo.GetItemString(row,"TP") = "O" then
			if data <> "C" and data <> "M"  then
				dwo.SetItem(row,"Origine_TP", "C")
			end if
		else
			dwo.SetItem(row,"Origine_TP", " ")
		end if
	end if
end if
end subroutine

on w_soins_reg_maj_echeances.create
int iCurrent
call super::create
this.dw_montant=create dw_montant
this.dw_montant_soins_prevus=create dw_montant_soins_prevus
this.cb_ajouter_montant=create cb_ajouter_montant
this.cb_supprimer_montant=create cb_supprimer_montant
this.cb_annuler_montant=create cb_annuler_montant
this.cb_enregistrer_montant=create cb_enregistrer_montant
this.pb_calculatrice=create pb_calculatrice
this.pb_echeance_auto_generer=create pb_echeance_auto_generer
this.st_echeance_auto_date_depart=create st_echeance_auto_date_depart
this.em_echeance_auto_date_depart=create em_echeance_auto_date_depart
this.st_echeance_auto_mensualites=create st_echeance_auto_mensualites
this.em_echeance_auto_mensualites=create em_echeance_auto_mensualites
this.st_echeance_auto_periodicite=create st_echeance_auto_periodicite
this.ddlb_echeance_auto_periodicite=create ddlb_echeance_auto_periodicite
this.st_echeance_auto_acompte=create st_echeance_auto_acompte
this.em_echeance_auto_acompte=create em_echeance_auto_acompte
this.ddlb_soins=create ddlb_soins
this.em_num=create em_num
this.em_date_dem=create em_date_dem
this.em_scp_dem=create em_scp_dem
this.em_hn=create em_hn
this.em_tp=create em_tp
this.em_total=create em_total
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.st_soin=create st_soin
this.st_num=create st_num
this.st_demande=create st_demande
this.st_hn=create st_hn
this.st_tp=create st_tp
this.st_total=create st_total
this.dw_nom=create dw_nom
this.st_date_impr=create st_date_impr
this.em_date_impr=create em_date_impr
this.em_date_acc=create em_date_acc
this.em_scp_acc=create em_scp_acc
this.gb_echeance_auto=create gb_echeance_auto
this.rb_patient=create rb_patient
this.rb_caisse=create rb_caisse
this.rb_mutuelle=create rb_mutuelle
this.sle_association=create sle_association
this.st_association=create st_association
this.cbx_remb_excep=create cbx_remb_excep
this.st_dent=create st_dent
this.sle_dent=create sle_dent
this.st_exo=create st_exo
this.ddlb_exo=create ddlb_exo
this.cbx_pseudocodes=create cbx_pseudocodes
this.pb_schema=create pb_schema
this.st_modificateurs=create st_modificateurs
this.sle_modificateurs=create sle_modificateurs
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_montant
this.Control[iCurrent+2]=this.dw_montant_soins_prevus
this.Control[iCurrent+3]=this.cb_ajouter_montant
this.Control[iCurrent+4]=this.cb_supprimer_montant
this.Control[iCurrent+5]=this.cb_annuler_montant
this.Control[iCurrent+6]=this.cb_enregistrer_montant
this.Control[iCurrent+7]=this.pb_calculatrice
this.Control[iCurrent+8]=this.pb_echeance_auto_generer
this.Control[iCurrent+9]=this.st_echeance_auto_date_depart
this.Control[iCurrent+10]=this.em_echeance_auto_date_depart
this.Control[iCurrent+11]=this.st_echeance_auto_mensualites
this.Control[iCurrent+12]=this.em_echeance_auto_mensualites
this.Control[iCurrent+13]=this.st_echeance_auto_periodicite
this.Control[iCurrent+14]=this.ddlb_echeance_auto_periodicite
this.Control[iCurrent+15]=this.st_echeance_auto_acompte
this.Control[iCurrent+16]=this.em_echeance_auto_acompte
this.Control[iCurrent+17]=this.ddlb_soins
this.Control[iCurrent+18]=this.em_num
this.Control[iCurrent+19]=this.em_date_dem
this.Control[iCurrent+20]=this.em_scp_dem
this.Control[iCurrent+21]=this.em_hn
this.Control[iCurrent+22]=this.em_tp
this.Control[iCurrent+23]=this.em_total
this.Control[iCurrent+24]=this.cb_enregistrer
this.Control[iCurrent+25]=this.cb_annuler
this.Control[iCurrent+26]=this.st_soin
this.Control[iCurrent+27]=this.st_num
this.Control[iCurrent+28]=this.st_demande
this.Control[iCurrent+29]=this.st_hn
this.Control[iCurrent+30]=this.st_tp
this.Control[iCurrent+31]=this.st_total
this.Control[iCurrent+32]=this.dw_nom
this.Control[iCurrent+33]=this.st_date_impr
this.Control[iCurrent+34]=this.em_date_impr
this.Control[iCurrent+35]=this.em_date_acc
this.Control[iCurrent+36]=this.em_scp_acc
this.Control[iCurrent+37]=this.gb_echeance_auto
this.Control[iCurrent+38]=this.rb_patient
this.Control[iCurrent+39]=this.rb_caisse
this.Control[iCurrent+40]=this.rb_mutuelle
this.Control[iCurrent+41]=this.sle_association
this.Control[iCurrent+42]=this.st_association
this.Control[iCurrent+43]=this.cbx_remb_excep
this.Control[iCurrent+44]=this.st_dent
this.Control[iCurrent+45]=this.sle_dent
this.Control[iCurrent+46]=this.st_exo
this.Control[iCurrent+47]=this.ddlb_exo
this.Control[iCurrent+48]=this.cbx_pseudocodes
this.Control[iCurrent+49]=this.pb_schema
this.Control[iCurrent+50]=this.st_modificateurs
this.Control[iCurrent+51]=this.sle_modificateurs
end on

on w_soins_reg_maj_echeances.destroy
call super::destroy
destroy(this.dw_montant)
destroy(this.dw_montant_soins_prevus)
destroy(this.cb_ajouter_montant)
destroy(this.cb_supprimer_montant)
destroy(this.cb_annuler_montant)
destroy(this.cb_enregistrer_montant)
destroy(this.pb_calculatrice)
destroy(this.pb_echeance_auto_generer)
destroy(this.st_echeance_auto_date_depart)
destroy(this.em_echeance_auto_date_depart)
destroy(this.st_echeance_auto_mensualites)
destroy(this.em_echeance_auto_mensualites)
destroy(this.st_echeance_auto_periodicite)
destroy(this.ddlb_echeance_auto_periodicite)
destroy(this.st_echeance_auto_acompte)
destroy(this.em_echeance_auto_acompte)
destroy(this.ddlb_soins)
destroy(this.em_num)
destroy(this.em_date_dem)
destroy(this.em_scp_dem)
destroy(this.em_hn)
destroy(this.em_tp)
destroy(this.em_total)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.st_soin)
destroy(this.st_num)
destroy(this.st_demande)
destroy(this.st_hn)
destroy(this.st_tp)
destroy(this.st_total)
destroy(this.dw_nom)
destroy(this.st_date_impr)
destroy(this.em_date_impr)
destroy(this.em_date_acc)
destroy(this.em_scp_acc)
destroy(this.gb_echeance_auto)
destroy(this.rb_patient)
destroy(this.rb_caisse)
destroy(this.rb_mutuelle)
destroy(this.sle_association)
destroy(this.st_association)
destroy(this.cbx_remb_excep)
destroy(this.st_dent)
destroy(this.sle_dent)
destroy(this.st_exo)
destroy(this.ddlb_exo)
destroy(this.cbx_pseudocodes)
destroy(this.pb_schema)
destroy(this.st_modificateurs)
destroy(this.sle_modificateurs)
end on

event open;call super::open;
string v_code_defaut
// string v_code_lu
//integer v_ordre_trie
//string v_adulte, nom_son, v_pour_qui, nom_soin
boolean v_suite
long lig_soin, cpt_reg

string lib
integer v_actif

Try  
	
	trace("============ DEBUT OPEN SOINS / REGLEMENTS - MAJ ECHEANCES ============ ")
	
	v_suite = true
	
	if Belgique then
		cbx_pseudocodes.visible = true
		// Info mémorisée à la sortie de la fenetre
		if profilestring(dir_ini+inifile_orthokis,"admini","pseudocodes_actifs","N") = "O" then 
			cbx_pseudocodes.checked = true
		else
			cbx_pseudocodes.checked = false
		end if
	else
		cbx_pseudocodes.visible = false
	end if
	
	modif_ok = true 

	w_soins_reg_maj_parent = message.PowerObjectParm
	
	// datawindows parentes
	dw_soins = w_soins_reg_maj_parent.dw_soins
	dw_soins_prevus = w_soins_reg_maj_parent.dw_soins_prevus

	// Variables parentes
	var_code_local = w_soins_reg_maj_parent.var_code_local
	type_gestion = w_soins_reg_maj_parent.type_gestion
	action  = w_soins_reg_maj_parent.action
	var_code_devis_local = w_soins_reg_maj_parent.var_code_devis_local
	
	// Constitution de la liste des soins

	
	

		
		// Utilisation de la dw
		dw_nom.settransobject(sqlca)
		
		actualiser_liste_codes_soins()
		

		
	colore_datawindow(dw_montant_soins_prevus)
	colore_datawindow(dw_montant)

	dw_montant_soins_prevus.settransobject(sqlca)
	dw_montant.settransobject(sqlca)


	if w_soins_reg_maj_parent.v_mode_reglement = "R" then 
		// Ajustement des dw d'échéances pour les prélèvements
		integer v_delta
		v_delta = 270
		dw_montant.width = 1381 + v_delta
		dw_montant.modify("l_1.x2 = 1573")
		dw_montant.modify("l_2.x2 = 1573")
		dw_montant.modify("l_3.x2 = 1573")
		dw_montant.modify("t_titre.x = 310")
		dw_montant.modify("nb_echeances.x = 955")
		dw_montant.modify("non_prelevement.visible = 1")
		dw_montant.modify("t_non_prelevement.visible = 1")
		
		
		dw_montant_soins_prevus.width = 1381 + v_delta
		dw_montant_soins_prevus.modify("l_1.x2 = 1573")
		dw_montant_soins_prevus.modify("l_2.x2 = 1573")
		dw_montant_soins_prevus.modify("l_3.x2 = 1573")
		dw_montant_soins_prevus.modify("t_titre.x = 310")
		dw_montant_soins_prevus.modify("nb_echeances.x = 955")
		dw_montant_soins_prevus.modify("non_prelevement.visible = 1")
		dw_montant_soins_prevus.modify("t_non_prelevement.visible = 1")
		
		
	end if
	
	// Modification du terme "Dépassement"
	st_hn.text = libelle_depassement

	if belgique then
		st_demande.text = "Date"
	end if
	
	gb_echeance_auto.BackColor = couleur_fond_fenetre
	
	ddlb_echeance_auto_periodicite.Selectitem(1)
	
	if type_gestion = 'P' then
		
		
		st_date_impr.visible = true
		em_date_impr.visible = true
	
		if France then
			st_exo.visible = true
			ddlb_exo.visible = true
		end if
		st_dent.visible = true
		sle_dent.visible = true
		pb_schema.visible = true

end if
	
	
	
	choose case action
			
		case "A"
			// Ajout d'un soin ou d'un soin prévisionnel
			
			this.title = "Ajout d'un Soin"
			
			if type_gestion = "P" then 
				this.title = this.title + " Prévisionnel"
			end if
			
			select top 1 code into :v_code_defaut from code_soins where actif = 1  order by  ordre_trie  ;
			
			// recherche des valeurs par défaut
			SELECT "hn","tp"
			 INTO :hn_def,:tp_def
			 FROM "patient"  
			 WHERE "patient"."code" = :var_code_local   ;
	
			v_suite = true
			
			if w_soins_reg_maj_parent.tab_1.tabpage_soins_prevus.dw_devis.rowcount() = 0 and type_gestion = "P" then
				// On est dans les soins prévisionnels et pas de devis saisi
				// On en crée un
				Insert Into devis ("code", "code_devis", "date", "libelle") values (:var_code_local, 1, cast(getdate() as date), 'Devis N°1') ;
				if sqlca.sqlcode = 0 then
					commit ;
					var_code_devis_local = 1
					// on raffraichit le devis créée
					w_soins_reg_maj_parent.tab_1.tabpage_soins_prevus.dw_devis.retrieve(var_code_local)
		
				else
					rollback ;
					Messagebox("ATTENTION","Une erreur s'est produite dans la création du devis.~n~n"+sqlca.sqlerrtext )
					v_suite = false
				end if
			end if
			
			if v_suite	then
					
				reset_saisie()

				maj_liste_nom_des_soins(v_code_defaut)
			
				premiere = true
				ancien_soin = "!"
			else
				close(this)
			end if	
			
		case "M"
			// Modification d'un soin ou d'un soin prévisionnel
			
			this.title = "Modification d'un Soin"
			
		if type_gestion = 'P' then
		
			// soins prévisionnels
			this.title = this.title + " Prévisionnel"
			

		if dw_soins_prevus.rowcount() = 0 then
			son(5)
			MessageBox("ATTENTION !","Aucun soin prévu n'a été saisi !")
		else
			lig_soin = dw_soins_prevus.getrow()
			
			// Vérification si transféré ?
			if dw_soins_prevus.getitemstring(lig_soin,"soins_prevus_transfert") = 'O' then
				son(5)
				MessageBox("ATTENTION !","Modification impossible car ce soin a déjà été transféré !")
				modif_ok = false
				
			else
				if lig_soin < 1 Then
					lig_soin = 1
				end if
				cle_manip = dw_soins_prevus.getitemnumber(lig_soin,"cle")
			

			
				reset_saisie()
			
				dw_montant_soins_prevus.retrieve(var_code_local,cle_manip)
			
				em_date_dem.text = string(dw_soins_prevus.getitemdate(lig_soin,"date_demande"),"dd/mm/yyyy")
				em_date_acc.text = string(dw_soins_prevus.getitemdate(lig_soin,"soins_prevus_date_accord"),"dd/mm/yyyy")	//"date_accord"
				em_hn.text = string(dw_soins_prevus.getitemnumber(lig_soin,"hn"))
				em_scp_dem.text = string(dw_soins_prevus.getitemnumber(lig_soin,"scp_demande"))
				em_scp_acc.text = string(dw_soins_prevus.getitemnumber(lig_soin,"soins_prevus_scp_accord"))	//"scp_accord"
				em_tp.text = string(dw_soins_prevus.getitemnumber(lig_soin,"tp"))
				em_num.text = string(dw_soins_prevus.getitemnumber(lig_soin,"numero"))
				em_date_impr.text =  string(dw_soins_prevus.getitemdate(lig_soin,"date_impr"),"dd/mm/yyyy")	//"date impression de DEP"
				type_soin = dw_soins_prevus.getitemstring(lig_soin,"code_soins_code")
				sle_association.text = dw_soins_prevus.getitemString(lig_soin,"code_association")
				if FRANCE and fxg_get_version_ccvitale() >= "4.40" then 
					sle_modificateurs.text = dw_soins_prevus.getitemString(lig_soin,"modificateurs")
				else
					sle_modificateurs.text = ""
				end if
				
				ancien_soin = type_soin
				
				if dw_soins_prevus.getitemstring(lig_soin,"code_soins_nature") = 'C' then
					soin_saisi_ccam = true
				else
					soin_saisi_ccam = false
				end if
								
					
				if soin_saisi_ccam then
					st_association.visible = true
					sle_association.visible = true
					
					cbx_remb_excep.visible = true

				end if

				
				if france then
					if dw_soins_prevus.getitemString(lig_soin,"remboursement_exceptionnel") = "O" then
						cbx_remb_excep.checked = true
					else
						cbx_remb_excep.checked = false
					end if
				end if
				
				sle_dent.text = dw_soins_prevus.getitemString(lig_soin,"dent")
				
				if France then
					choose case dw_soins_prevus.getitemString(lig_soin,"exo")
						case "0"
							ddlb_exo.selectitem(1)
						case "3"
							ddlb_exo.selectitem(2)
						case "6"
							ddlb_exo.selectitem(3)
						case "7"
							ddlb_exo.selectitem(4)
						case "C"
							ddlb_exo.selectitem(5)
					end choose
				end if
						
				


			  SELECT trim("code_soins"."nom")  ,"actif", "valeur"
				 INTO :lib  , :v_actif, :valeur
				 FROM "code_soins"  
				WHERE "code_soins"."code" = :type_soin   ;
			
				if v_actif = 1 then
	
					maj_liste_nom_des_soins(type_soin)
					
					maj_total()
					cb_enregistrer.enabled ( TRUE )
					
					ddlb_soins.setfocus()
					
				else
					messagebox("ATTENTION !","Ce type de soin n'est plus actif !")
					modif_ok = false
				end if
			end if
		end if	
	else
		
		// soins "normaux"
		
		if dw_soins.rowcount() = 0 then
			son(5)
			MessageBox("ATTENTION !","Aucun soin n'a été saisi !")
			modif_ok = false
		else
			
			
				lig_soin = dw_soins.getrow()
				
				if lig_soin < 1 Then
					lig_soin = 1
				end if
				
				v_suite = true
		
				if droits_acces[84] = 'N' then
					if  dw_soins.getitemstring(lig_soin , "soins_fse_edite") = "V"  or dw_soins.getitemstring(lig_soin , "soins_fse_edite") = "M"  then
						v_suite = false
						MessageBox("ATTENTION !", "Vous n'êtes pas autorisé à modifier une ligne de soin ayant fait l'objet d'une Feuille de Soin.") 
	
					end if
				end if
				
				if v_suite then 
					cle_manip = dw_soins.getitemnumber(lig_soin,"cle")
				
					// Vérification de règlements saisis
					SELECT count(*) INTO :cpt_reg FROM paye WHERE code = :var_code_local and cle = :cle_manip ;
				
					action = "M"
				
					if dw_soins.getitemnumber(lig_soin,"numero_facture") > 0 then
						if Belgique then
							MessageBox("ATTENTION !","Ce soin a fait l'objet d'une Attestation !")
						else
							MessageBox("ATTENTION !","Ce soin a fait l'objet d'une Facture !")
						end if
					end if
			
					
					reset_saisie()
				
					dw_montant.retrieve(var_code_local,cle_manip)
				
					em_date_dem.text = string(dw_soins.getitemdate(lig_soin,"date_demande"),"dd/mm/yyyy")
					em_hn.text = string(dw_soins.getitemnumber(lig_soin,"hn"))
					em_date_acc.text = string(dw_soins.getitemdate(lig_soin,"date_accord"),"dd/mm/yyyy")
					em_scp_dem.text = string(dw_soins.getitemnumber(lig_soin,"scp_demande"))
					em_scp_acc.text = string(dw_soins.getitemnumber(lig_soin,"scp_accord"))
					em_tp.text = string(dw_soins.getitemnumber(lig_soin,"tp"))
					em_num.text = string(dw_soins.getitemnumber(lig_soin,"numero"))
					type_soin = dw_soins.getitemstring(lig_soin,"code_soins_code")
					if FRANCE and fxg_get_version_ccvitale() > "4.40" then
						sle_modificateurs.text =  w_soins_reg_maj_parent.tab_1.tabpage_soins.dw_impression.getitemString(1,"modificateurs") 
					else
						sle_modificateurs.text = ""
					end if
					ancien_soin = type_soin
					
					// Le code association peut être mise à jour dans la DW de l'onglet 
					sle_association.text = w_soins_reg_maj_parent.tab_1.tabpage_soins.dw_impression.getitemString(1,"soins_code_association")
		
			
				  SELECT trim("code_soins"."nom")  ,"actif", "valeur"
					 INTO :lib  , :v_actif, :valeur
					 FROM "code_soins"  
					WHERE "code_soins"."code" = :type_soin   ;
				
					if v_actif = 1 then
						maj_liste_nom_des_soins(type_soin)
						
						maj_total()
						
						cb_enregistrer.enabled ( true )
						
						ddlb_soins.setfocus()
		
					else
						messagebox("ATTENTION !","Ce type de soin n'est plus actif !")
						modif_ok = false
					end if
				end if
		end if
	end if
	

end choose

if v_suite then 
	

	// Autorisation à modifier le montant d'un soin
	string ls_autor
	select autor_modif_tarif_soin into :ls_autor from utilisateurs where code = :utilisateur_code ;
	if ls_autor = "N" then
		// on empeche la modification des zone dépassement et total
		em_hn.displayonly = true
		em_total.displayonly = true
	end if
		

	
	if modif_ok then
		if w_soins_reg_maj_parent.modif_echeance_direct then
			// Modif des échéances directement
			cb_enregistrer.triggerevent(clicked!)
		end if
		// pour la gestion des échéances
		d_total_a_ouverture = dec(em_total.text)
	
		trace("============ FIN OPEN SOINS / REGLEMENTS - MAJ ECHEANCES  ============ ")
	else
		trace("============ FIN OPEN SOINS / REGLEMENTS - MAJ ECHEANCES  ============ ")
		close(this)
	end if

else
	trace("============ FIN OPEN SOINS / REGLEMENTS - MAJ ECHEANCES  ============ ")
	close(this)
end if 


Catch (RuntimeError er)
	
	Messagebox("ERREUR INATTENDUE","Une erreur inattendue s'est produite.~nLa fenêtre n'a pas pu s'ouvrir normalement.~n~nNous vous conseillons de fermer puis rouvrir le dossier.~n~nEléments Techniques pour DentalSoft :~n~nClasse : " + er.class +"~nRoutine : "+er.RoutineName + "~nLigne : " + string(er.line) + "~nTexte : "  + er.text )
	
	
End Try



end event

event close;call super::close;
if Belgique then 
	// Mémorisation de l'activation des pseudo codes par défaut
	if cbx_pseudocodes.checked then
		Setprofilestring(dir_ini+inifile_orthokis,"admini","pseudocodes_actifs","O")
	else
		Setprofilestring(dir_ini+inifile_orthokis,"admini","pseudocodes_actifs","N")
	end if
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_reg_maj_echeances
integer x = 535
integer y = 568
end type

type dw_montant from datawindow within w_soins_reg_maj_echeances
string tag = "no resize brush"
boolean visible = false
integer x = 635
integer y = 544
integer width = 1463
integer height = 1324
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_saisie_montant_soin"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;verif_montant(this)
end event

event dberror;db_erreur_lignes_soins(dw_montant,sqldbcode,sqlerrtext)
return 1
end event

event itemchanged;

// Selon la valeur de TP, on modifie la valeur par défaut de origine tp
// la valeur n'est pas encore modifiée => On teste la valeur inverse !!!!

// selon ce qu'on modifie, la valeur doit être tester à l'inverse
//
automatisme_tp ( row, this, dwo.name, data) 
//
//
//if dwo.name = "tp" then
//	if data = "O" then
//		if GetItemString(row,"Origine_TP") <> "C" and GetItemString(row,"Origine_TP") <> "M"  then
//			this.SetItem(row,"Origine_TP", "C")
//		end if
//	else
//		this.SetItem(row,"Origine_TP", " ")
//	end if
//else
//	if dwo.name = "origine_tp" then 
//		if GetItemString(row,"TP") = "O" then
//			if data <> "C" and data <> "M"  then
//				this.SetItem(row,"Origine_TP", "C")
//			end if
//		else
//			this.SetItem(row,"Origine_TP", " ")
//		end if
//	end if
//end if
end event

event itemfocuschanged;verif_montant(this)
end event

event losefocus;verif_montant(this)
end event

type dw_montant_soins_prevus from datawindow within w_soins_reg_maj_echeances
string tag = "no resize brush"
boolean visible = false
integer x = 635
integer y = 544
integer width = 1463
integer height = 1324
integer taborder = 300
boolean bringtotop = true
string dataobject = "dw_saisie_montant_soin_prevu"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;verif_montant(this)
end event

event dberror;db_erreur_lignes_soins(dw_montant_soins_prevus,sqldbcode,sqlerrtext)
return 1
end event

event itemchanged;

// Selon la valeur de TP, on modifie la valeur par défaut de origine tp
// la valeur n'est pas encore modifiée => On teste la valeur inverse !!!!

// selon ce qu'on modifie, la valeur doit être tester à l'inverse

automatisme_tp ( row, this, dwo.name, data) 

end event

event itemfocuschanged;verif_montant(this)
end event

event losefocus;verif_montant(this)
end event

type cb_ajouter_montant from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
boolean visible = false
integer x = 242
integer y = 1944
integer width = 521
integer taborder = 260
boolean bringtotop = true
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;// AJOUT D'UNE NOUVELLE ECHEANCE DE REGLEMENT
//------------------------------------------------------------

integer i
decimal {2} tot

if type_gestion = 'P' then
	// prévus
	
	tot = 0
	FOR i=1 TO dw_montant_soins_prevus.rowcount()
		tot = tot + dw_montant_soins_prevus.getitemdecimal(i,"montant")
	NEXT
	
	if dec(em_total.text) > tot then
		dw_montant_soins_prevus.insertrow(0)
		dw_montant_soins_prevus.setitem(dw_montant_soins_prevus.rowcount(),"code",var_code_local)
		dw_montant_soins_prevus.setitem(dw_montant_soins_prevus.rowcount(),"date",date(em_date_dem.text))
		dw_montant_soins_prevus.setitem(dw_montant_soins_prevus.rowcount(),"montant",dec(em_total.text) - tot)
		dw_montant_soins_prevus.setitem(dw_montant_soins_prevus.rowcount(),"origine_tp"," ")
		dw_montant_soins_prevus.scrolltorow(dw_montant_soins_prevus.rowcount())
		dw_montant_soins_prevus.setcolumn("date")
		dw_montant_soins_prevus.setfocus()
	end if

	
	
else
	// soins
	
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
	
end if
end event

type cb_supprimer_montant from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
boolean visible = false
integer x = 782
integer y = 1944
integer width = 521
integer taborder = 270
boolean bringtotop = true
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;son(7)
if type_gestion = 'P' then
	dw_montant_soins_prevus.deleterow(dw_montant_soins_prevus.getrow())
	verif_montant(dw_montant_soins_prevus)
else
	dw_montant.deleterow(dw_montant.getrow())
	verif_montant(dw_montant)
end if
end event

type cb_annuler_montant from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
boolean visible = false
integer x = 1321
integer y = 1944
integer width = 521
integer taborder = 280
boolean bringtotop = true
string text = "A&nnuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_enregistrer_montant from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
boolean visible = false
integer x = 1861
integer y = 1944
integer width = 521
integer taborder = 290
boolean bringtotop = true
fontcharset fontcharset = ansi!
boolean enabled = false
string text = "Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;// ENREGISTREMENT DE LA SAISIE DES MONTANTS DU SOIN => AJOUT EFFECTIF DU SOIN !!
//-----------------------------------------------------------------------------------------------------------




// COMMUN AUX SOINS ET AU SOINS PREVUS

double cle_max
string var_type
double var_num
integer var_tp,i
date var_date_dem,var_date_acc, var_date_impr
decimal {2} var_scp_dem,var_scp_acc,var_hn,var_tot
date date_impr, date_donne, date_rapport
string comment
string v_remboursement_exceptionnel_defaut, v_exoneration_defaut

string v_nom_soin
integer v_duree
date date_execution
string v_execution_immediate, v_code_association, v_nature, v_lettre, v_remboursement_exceptionnel, v_exoneration, v_dent, v_modificateurs

// pour la gestion des dépassements Belges
boolean trouve_depassement_belgique, alerte_depassement_belgique
decimal{2} var_hn_supp, var_type_supp_montant
string var_type_supp, var_type_supp_libelle, var_libelle_alerte_supp
integer v_cpt
string ls_tp, ls_origine_tp
date ds_date

var_type = type_soin

boolean lb_praticien_conventionne = true // pour la belgique
string ls_convention_secu

// Mise à nulle du N° du soin (pour éviter qu'il affiche Zéro
if dec(em_num.text) = 0 then
	setnull(var_num)
else
	var_num = dec(em_num.text)
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


// Idem pour date impr DEP
if type_gestion = 'P' then
	if len(trim(em_date_impr.text)) = 0 or em_date_impr.text = "00/00/0000" then
		setnull(var_date_impr)
	else
		var_date_impr = date(em_date_impr.text)
	end if
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


v_code_association = trim(sle_association.text)

v_modificateurs = sle_modificateurs.text

	
if type_gestion = "P" then
	
	integer iss
	string t
	t = ddlb_exo.SelectedText()
	iss = ddlb_exo.findItem(ddlb_exo.text, 0)
	choose case ddlb_exo.findItem(ddlb_exo.text, 0)
		case 1
			v_exoneration = "0"
		case 2
			v_exoneration = "3"
		case 3
			v_exoneration = "6"
		case 4
			v_exoneration = "7"
		case 5
			v_exoneration = "C"
	end choose
	
	v_dent = sle_dent.text
	
	if cbx_remb_excep.checked then
		v_remboursement_exceptionnel = "O"
	else
		v_remboursement_exceptionnel = "N"
	end if
end if

if belgique then 
	// Est ce que le praticien est conventionné 
	select isnull(convention_secu, '1') into :ls_convention_secu 
	from prati, patient 
	where prati.code = patient.code_praticien and patient.code = :var_code_local ;
	
	if ls_convention_secu = "1" or ls_convention_secu = "2" then 
		lb_praticien_conventionne = true
	else
		lb_praticien_conventionne = false
	end if
end if

	

if action = "A" and Belgique and var_hn > 0 and lb_praticien_conventionne then
	// Initialisation des tableau de code avec tarif maxi
	integer index = 0
	
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "305550"
	tab_pseudo_code_tarif_maxi[index]		= "306235"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour empreintes"
	tab_pseudo_montant_tarif_maxi[index] 	= 20
	
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "305572"
	tab_pseudo_code_tarif_maxi[index]		= "305970"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour analyse données"
	tab_pseudo_montant_tarif_maxi[index] 	= 27
	
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "305616"
	tab_pseudo_code_tarif_maxi[index]		= "305992"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour forfait pour traitement régulier"
	tab_pseudo_montant_tarif_maxi[index] 	= 40.50
	
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "305631"
	tab_pseudo_code_tarif_maxi[index]		= "306014"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour forfait appareillage en début de traitement"
	tab_pseudo_montant_tarif_maxi[index] 	= 758
		
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "305653"
	tab_pseudo_code_tarif_maxi[index]		= "306036"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour forfait interruption"
	tab_pseudo_montant_tarif_maxi[index] 	= 40.50
		
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "305675"
	tab_pseudo_code_tarif_maxi[index]		= "306051"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour forfait appareillage supplémentaire"
	tab_pseudo_montant_tarif_maxi[index] 	= 758
	
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "305830"
	tab_pseudo_code_tarif_maxi[index]		= "306073"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour avis orthodontique et rapport"
	tab_pseudo_montant_tarif_maxi[index] 	= 25.5
	
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "305852"
	tab_pseudo_code_tarif_maxi[index]		= "306095"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour contrôle contention"
	tab_pseudo_montant_tarif_maxi[index] 	= 22.5
	
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "305911"
	tab_pseudo_code_tarif_maxi[index]		= "306110"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour analyse céphalométrique"
	tab_pseudo_montant_tarif_maxi[index] 	= 27.5
	
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "304371"
	tab_pseudo_code_tarif_maxi[index]		= "306132"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour obturation 1 face"
	tab_pseudo_montant_tarif_maxi[index] 	= 10

	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "304393"
	tab_pseudo_code_tarif_maxi[index]		= "306154"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour obturation 2 faces"
	tab_pseudo_montant_tarif_maxi[index] 	= 15
	
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "304415"
	tab_pseudo_code_tarif_maxi[index]		= "306176"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour obturation 3 faces"
	tab_pseudo_montant_tarif_maxi[index] 	= 15
	
	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "304430"
	tab_pseudo_code_tarif_maxi[index]		= "306191"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour restauration de cuspide bord incisal"
	tab_pseudo_montant_tarif_maxi[index] 	= 15

	index = index + 1
	tab_code_soins_tarif_maxi[index] 		= "304452"
	tab_pseudo_code_tarif_maxi[index]		= "306213"
	tab_pseudo_libelle_tarif_maxi[index] 	= "Tarifs maximums pour restauration complète de couronne"
	tab_pseudo_montant_tarif_maxi[index] 	= 15
	
end if




CHOOSE CASE Action
	CASE "A"
	// Ajout de soins
		
		if type_gestion = 'P' then
			SELECT Max(cle) INTO :cle_max FROM soins_prevus WHERE code = :var_code_local ;
		else
			SELECT Max(cle) INTO :cle_max FROM soins WHERE code = :var_code_local ;
		end if


		if isnull(cle_max) then
			cle_max = 1
		else
			cle_max = cle_max + 1
		end if

		cle_manip = cle_max

		// Recherche des éléments du soins
		SELECT "duree", trim("nom"), "execution_immediate" , "nature", "lettre", "remboursement_exceptionnel_defaut", "exo_defaut"
		INTO :v_duree, :v_nom_soin, :v_execution_immediate ,  :v_nature, :v_lettre, :v_remboursement_exceptionnel_defaut, :v_exoneration_defaut
		FROM "code_soins"  WHERE code = :var_type ;
		
		trouve_depassement_belgique = false
		
		
		if Belgique and var_hn > 0 and lb_praticien_conventionne  then 
			// est ce que le soin est concerné par l'ajout d'un pseudo code de dépassement avec un tarif maxi
			
			index = 1
			do while index <= upperbound(tab_code_soins_tarif_maxi) and not trouve_depassement_belgique
				if tab_code_soins_tarif_maxi[index] = var_type then 	
					trouve_depassement_belgique = true
					var_type_supp = tab_pseudo_code_tarif_maxi[index]
					var_type_supp_libelle = tab_pseudo_libelle_tarif_maxi[index]
					var_type_supp_montant = tab_pseudo_montant_tarif_maxi[index]
				else
					index = index + 1
				end if
			loop
	
			if trouve_depassement_belgique then 
				// on en met pas de dépassement sur le soin "normal" on le mettre sur un 2ème soin .. le dépassement est limité à un montant maxi
				if var_hn > var_type_supp_montant then
					var_hn_supp = var_type_supp_montant
					alerte_depassement_belgique = true
					var_libelle_alerte_supp = "~n~nVous aviez prévu un dépassement de " + string(var_hn, "0.00") + " €. Or, sur ce soin, vous ne pouvez pas effectuer de dépassement supérieur à  " + string(var_type_supp_montant, "0.00") + " €. Le montant du dépassement a donc été ajusté !"
				else
					var_hn_supp = var_hn
					alerte_depassement_belgique= false
				end if
				var_tot = var_tot - var_hn
				setnull(var_hn)
			end if
				
		end if
		
		
		if type_gestion = "P" then
			
			// soins prévus
			

				INSERT INTO "soins_prevus"  ( "cle", "code", "type",  "numero", "date_demande", "scp_demande",  "hn",   "total", "tp", "date_accord", "scp_accord" ,
			"date_impr","user_modif","date_modif", "code_devis", "code_association", "remboursement_exceptionnel", "exo", "dent", "modificateurs")  
			 VALUES ( :cle_max,   :var_code_local, :var_type,  :var_num,   :var_date_dem,   :var_scp_dem, :var_hn, :var_tot,    :var_tp , :var_date_acc,   :var_scp_acc , 
			 :var_date_impr, :utilisateur_code, getdate(), :var_code_devis_local, :v_code_association, :v_remboursement_exceptionnel, :v_exoneration, :v_dent, :v_modificateurs)  ;


			ajout_histo_actions(var_code_local,"AJOSOP",today(),v_nom_soin +" - " + string(var_date_dem, "dd/mm/yyyy")+" - "+string(var_tot,'0.00'))

			if trouve_depassement_belgique then 
				
				// Correction de l'échéance du soin
				dw_montant_soins_prevus.Setitem(1,"montant" , var_tot)
				
				// Ajout du pseudo code de dépassement
				
				// est ce que le type de soin existe ?
				select isnull(count(*),0) into :v_cpt  from code_soins where code = :var_type_supp ;
				
				if v_cpt = 0 then 
					// ajout du type de soins
					insert into code_soins ("code", "nom", "execution_immediate", "total", "pseudocode", "nb_lettre" , "depasse", "valeur", "lettre", "actif", "ordre_trie")
					values (:var_type_supp, :var_type_supp_libelle, 'O', :var_type_supp_montant, 'O', 0 , 0 , 0, 'HN', 1, 100) ;
				end if
				
				// recherche des infos du soins	supplémetaire
				SELECT "duree", trim("nom"), "execution_immediate" , "nature", "lettre", "remboursement_exceptionnel_defaut", "exo_defaut"
				INTO :v_duree, :v_nom_soin, :v_execution_immediate ,  :v_nature, :v_lettre, :v_remboursement_exceptionnel_defaut, :v_exoneration_defaut
				FROM "code_soins"  WHERE code = :var_type ;
				
				// soins prévus de dépassement
				INSERT INTO "soins_prevus"  ( "cle", "code", "type",  "numero", "date_demande", "scp_demande",  "hn",   "total", "tp", "date_accord", "scp_accord" ,
				"user_modif","date_modif", "code_devis")  
				VALUES ( :cle_max + 1,   :var_code_local, :var_type_supp,  :var_num,   :var_date_dem,   1, :var_hn_supp, :var_hn_supp,    :var_tp , :var_date_acc,   :var_scp_acc , 
				 :utilisateur_code, getdate(), :var_code_devis_local)  ;
				
				if dw_montant_soins_prevus.rowcount() > 0 then 
			
					ds_date = dw_montant_soins_prevus.getitemDate(1,"date" )
					ls_tp = dw_montant_soins_prevus.getitemString(1,"tp" )
					ls_origine_tp = dw_montant_soins_prevus.getitemString(1,"origine_tp" )
				
					// Ajout de la ligne de soins 
					INSERT INTO ligne_soins_prevus ("code", "cle", "date", "montant", "tp", "origine_tp")
					values (:var_code_local, :cle_max + 1, :ds_date, :var_hn_supp, :ls_tp, :ls_origine_tp) ;
				
				end if
				ajout_histo_actions(var_code_local,"AJOSOP",today(),var_type_supp_libelle +" - " + string(var_date_dem, "dd/mm/yyyy")+" - "+string(var_hn_supp,'0.00'))

				Messagebox("REGLEMENTATION du 11/03/2026", "Si vous souhaitez faire un dépassement sur un acte " + var_type + " vous devez obligatoirement le faire en encodant un acte " + var_type_supp + " supplémentaire. Orthokis a donc automatiquement ajouté cet acte !" + var_libelle_alerte_supp )

			end if
			
		else

			// soins 
			
			// ATTENTION ! Depuis 8.10f (CNDA) .. si le soin AJOUTE n'est pas soumis à entente, on met 
			// sa date d'exécution à Date de demande par défaut 
			// depuis la version 10 on le faut aussi pour les autres !!
	
			if v_duree > 0 and v_execution_immediate <> 'O' then
				date_execution = ajout_x_mois(var_date_dem,v_duree )
			else
				date_execution = var_date_dem
			end if
			
			if v_nature = "N" then
				// en NGAP .. pas de code d'association
				v_code_association = ""
			end if
			
			string v_motif
			
			if var_hn > 0 then 
				v_motif = motif_depassement(var_code_local, var_type)
			else
				v_motif = ""
			end if
			
			// Ajout EFFECTIF du soin 
			
			// depuis 2024, les code exo sont gérés dans la table des types de soins

			
			INSERT INTO "soins"  
				( "cle", "code", "type",  "numero", "date_demande",   
				  "scp_demande",  "date_accord",   "scp_accord",   
				  "hn",   "total", "tp","date_exe" , "user_modif", "date_modif", "motif_depassement", "code_association", "exo", "remboursement_exceptionnel", "modificateurs")  
			 VALUES ( :cle_max,   :var_code_local, :var_type,   
				  :var_num,   :var_date_dem,   :var_scp_dem,   
				  :var_date_acc,   :var_scp_acc,    :var_hn,   
				  :var_tot,    :var_tp , : date_execution , :utilisateur_code,getdate(), :v_motif, :v_code_association , :v_exoneration_defaut, :v_remboursement_exceptionnel_defaut, :v_modificateurs)  ;
				
				ajout_histo_actions(var_code_local,"AJOSOI",today(),v_nom_soin +" - " + string(var_date_dem, "dd/mm/yyyy")+" - "+string(var_tot,'0.00'))
			
			
			if trouve_depassement_belgique then 
				
				// Correction de l'échéance du soin
				dw_montant.Setitem(1,"montant" , var_tot)
				
				// Ajout du pseudo code de dépassement
				
				// est ce que le type de soin existe ?
				select isnull(count(*),0) into :v_cpt  from code_soins where code = :var_type_supp ;
				
				if v_cpt = 0 then 
					// ajout du type de soins
					insert into code_soins ("code", "nom", "execution_immediate", "total", "pseudocode", "nb_lettre" , "depasse", "valeur", "lettre", "actif", "ordre_trie")
					values (:var_type_supp, :var_type_supp_libelle, 'O', :var_type_supp_montant, 'O', 0 , 0 , 0, 'HN', 1, 100) ;
				end if
				
				// recherche des infos du soins	supplémetaire
				SELECT "duree", trim("nom"), "execution_immediate" , "nature", "lettre", "remboursement_exceptionnel_defaut", "exo_defaut"
				INTO :v_duree, :v_nom_soin, :v_execution_immediate ,  :v_nature, :v_lettre, :v_remboursement_exceptionnel_defaut, :v_exoneration_defaut
				FROM "code_soins"  WHERE code = :var_type ;
				
				// soins  de dépassement
				INSERT INTO "soins"  ( "cle", "code", "type",  "numero", "date_demande", "scp_demande",  "hn",   "total", "tp", "date_accord", "scp_accord" ,
				"user_modif","date_modif")  
				VALUES ( :cle_max + 1,   :var_code_local, :var_type_supp,  :var_num,   :var_date_dem,   1, :var_hn_supp, :var_hn_supp,    :var_tp , :var_date_acc,   :var_scp_acc , 
				 :utilisateur_code, getdate())  ;
				
				if dw_montant.rowcount() > 0 then 
			
					ds_date = dw_montant.getitemDate(1,"date" )
					ls_tp = dw_montant.getitemString(1,"tp" )
					ls_origine_tp = dw_montant.getitemString(1,"origine_tp" )
				
					// Ajout de la ligne de soins 
					INSERT INTO ligne_soins ("code", "cle", "date", "montant", "tp", "origine_tp")
					values (:var_code_local, :cle_max + 1, :ds_date, :var_hn_supp, :ls_tp, :ls_origine_tp) ;
				
				end if
				ajout_histo_actions(var_code_local,"AJOSOI",today(),var_type_supp_libelle +" - " + string(var_date_dem, "dd/mm/yyyy")+" - "+string(var_hn_supp,'0.00'))

				Messagebox("REGLEMENTATION du 11/03/2026", "Si vous souhaitez faire un dépassement sur un acte " + var_type + " vous devez obligatoirement le faire en encodant un acte " + var_type_supp + " supplémentaire. Orthokis a donc automatiquement ajouté cet acte !" + var_libelle_alerte_supp )

			end if
			
				
		end if

	CASE "M"
		// Modification de soins

		if type_gestion = 'P' then 
			
	
			UPDATE "soins_prevus"  SET
				"type" = :var_type,   
				 "numero" = :var_num,   
				 "date_demande" = :var_date_dem,   
			 "scp_demande"= :var_scp_dem,   
				 "date_accord" = :var_date_acc,   
			 "scp_accord"= :var_scp_acc,   
				"hn" = :var_hn,   
				"total" = :var_tot,   
				"tp" = :var_tp, 
				"code_association" = :v_code_association,
			"date_impr" = :var_date_impr,
			"user_modif" = :utilisateur_code,
			"date_modif" = getdate() ,
			"remboursement_exceptionnel" = :v_remboursement_exceptionnel,
			"exo" =  :v_exoneration,
			"dent" = :v_dent ,
			"modificateurs" = :v_modificateurs
		  WHERE cle = :cle_manip and code = :var_code_local ;
			

				

			  
			  
			SELECT  trim("nom") INTO :v_nom_soin FROM "code_soins"  WHERE code = :var_type ;
	
			ajout_histo_actions(var_code_local,"MODSOP",today(),v_nom_soin +" - " + string(var_date_dem, "dd/mm/yyyy")+" - "+string(var_tot,'0.00'))
				
		else
			
			// soins
			UPDATE "soins"  SET
        		"type" = :var_type,   
				  "numero" = :var_num,   
				  "date_demande" = :var_date_dem,   
				  "scp_demande"= :var_scp_dem,   
				  "scp_accord" = :var_scp_acc,   
				  "hn" = :var_hn,   
				  "total" = :var_tot,   
				  "tp" = :var_tp,
					"code_association" = :v_code_association,
				"user_modif" = :utilisateur_code,
				"date_modif" = getdate() ,
				"remboursement_exceptionnel" = :v_remboursement_exceptionnel,
				"dent" = :v_dent ,
				"modificateurs" = :v_modificateurs

			  WHERE cle = :cle_manip and code = :var_code_local ;
				
			if isnull(var_date_acc) then
				UPDATE "soins"  SET "date_accord" = Null   
				  WHERE cle = :cle_manip and code = :var_code_local ;
			else
				UPDATE "soins"  SET "date_accord" = :var_date_acc      
				  WHERE cle = :cle_manip and code = :var_code_local ;
			end if
			
			SELECT  trim("nom") INTO :v_nom_soin FROM "code_soins"  WHERE code = :var_type ;

	 		ajout_histo_actions(var_code_local,"MODSOI",today(),v_nom_soin+" - " + string(var_date_dem, "dd/mm/yyyy")+ " - "+string(var_tot,'0.00'))

			
		end if
END CHOOSE

if SQLCA.SQLcode = -1 Then
	// Problème dans le INSERT ou le UPDATE
		CHOOSE CASE SQLCA.SQLdbCode
		CASE -193
		// Problème de clé 
			Messagebox("ATTENTION !","Ce soin ne peut être temporairement mis à jour !~nRefaites une tentative ou abandonnez l'ajout / modification !")
		CASE ELSE
			Messagebox("Erreur SQL",SQLCA.SQLErrText)
		END CHOOSE
		rollback ;
else
	// Tout est ok ! En mise à jour ou en insertion => on peut ajouter les lignes de soins

	if type_gestion = 'P' then
		// soins prévus
		
		FOR i=1 TO dw_montant_soins_prevus.rowcount()
			dw_montant_soins_prevus.setitem(i,"cle",cle_manip)
		NEXT
			
		if dw_montant_soins_prevus.update() = 1 then
			commit ;
		else
			Rollback ;
		end if

	
	else
		
		// soins
		FOR i=1 TO dw_montant.rowcount()
			dw_montant.setitem(i,"cle",cle_manip)
		NEXT
			
		if dw_montant.update() = 1 then
			commit ;
			
			// Le soin vient d'être ajouté ou mis à jour => Mise à jour ODS
			if APPEL_VISIODENT and not VISIODENT_LIMITE then
				fxg_ods_envoi_soin(var_code_local, cle_manip, false)
			end if
			
			// Le soin vient d'être ajouté ou mis à jour => Mise à jour de TEA
			if TEA then
				string v_id_tea
				v_id_tea = string(var_code_local) + "-" + string(cle_manip)
				if action = "A" then
					// Ajout
					if var_tot > 0 then
						//fxg_lancer_commande_dsapi("payment/create/" + v_id_tea, "",  "S", "G", var_code_local )
						fxg_maj_soins_tea(var_code_local, cle_manip, "C")
					end if
				else
					// modif
					if d_total_a_ouverture = 0 and var_tot > 0 then
						// C'est un soin existant à 0 .. qui devient > 0 .. faut le créér dans Téa
						//fxg_lancer_commande_dsapi("payment/create/" + v_id_tea, "",  "S", "G", var_code_local )
						fxg_maj_soins_tea(var_code_local, cle_manip, "C")
					else
						if d_total_a_ouverture > 0 and var_tot = 0 then
							// C'est un soin existant qui passe à 0 => faut le supprimer de Téa
							//fxg_lancer_commande_dsapi("payment/delete/" + v_id_tea, "",  "S", "G", var_code_local )
							fxg_maj_soins_tea(var_code_local, cle_manip, "D")
						else
							if var_tot > 0 then
								//fxg_lancer_commande_dsapi("payment/update/" + v_id_tea, "",  "S", "G", var_code_local )
								fxg_maj_soins_tea(var_code_local, cle_manip, "U")
							end if
						end if
					end if
				end if

			end if
		else
			Rollback ;
		end if

	
	end if
		
	
	// L'ajout du soin est teminé !!!
	//----------------------------------
	
	// Depuis 2017, on ne pose la question d'insertion que pour les ajouts
	if action = "A" then
		
		// Est ce une insertion de soins ?
		insertion_soins(cle_manip)
		
	end if
	
	
	// Mise à jour des affichages
	
	if type_gestion = 'P' then
		// soins prevus
		
		w_soins_reg_maj_parent.dw_soins_prevus.retrieve(var_code_local, var_code_devis_local)
	
		// On se met sur le soin qu'on vient d'enregister sinon on reset
		if w_soins_reg_maj_parent.dw_soins_prevus.rowcount() > 0 then
			w_soins_reg_maj_parent.dw_soins_prevus.Scrolltorow(w_soins_reg_maj_parent.dw_soins_prevus.Find("cle = "+string(cle_manip),1,99999))
			w_soins_reg_maj_parent.dw_soins_prevus.setfocus()
		else
			w_soins_reg_maj_parent.dw_detail_soins_prevus.reset()
		end if
		
		
	else
		// soins
		w_soins_reg_maj_parent.dw_soins.retrieve(var_code_local)
		
		// On se met sur le soin qu'on vient d'enregister sinon on reset
		if w_soins_reg_maj_parent.dw_soins.rowcount() > 0 then
			integer lig_soin
			lig_soin= w_soins_reg_maj_parent.dw_soins.Find("cle = "+string(cle_manip),1,99999)
			
			// cas de la mise à jour de la première ligne qui fait qu'on doit simuler un mouvement pour mettre à jour les dw du bas
			if lig_soin = 1 then
				w_soins_reg_maj_parent.dw_soins.Scrolltorow(w_soins_reg_maj_parent.dw_soins.rowcount())
			end if
			
			w_soins_reg_maj_parent.dw_soins.Scrolltorow(lig_soin)
			w_soins_reg_maj_parent.dw_soins.SetRow(lig_soin)
			w_soins_reg_maj_parent.dw_soins.setfocus()
		else
			w_soins_reg_maj_parent.dw_detail.reset()
			w_soins_reg_maj_parent.tab_1.tabpage_soins.dw_impression.reset()
		end if

		
	end if

	w_soins_reg_maj_parent.maj_selon_module(type_gestion)

end if

close(parent)

end event

type pb_calculatrice from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2478
integer y = 1500
integer width = 539
integer taborder = 220
boolean bringtotop = true
string text = "Calculatrice"
string iconname = "Compute1.png"
end type

event clicked;call super::clicked;open(w_calc)
end event

type pb_echeance_auto_generer from uo_picturebutton_250x120 within w_soins_reg_maj_echeances
boolean visible = false
integer x = 3035
integer y = 1500
integer width = 539
integer height = 144
integer taborder = 230
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "&Générer"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;
decimal {2} v_acompte, v_mensualite, v_reste, v_total_a_repartir, v_total_a_repartir_p, v_total_a_repartir_m, v_total_a_repartir_c
integer v_nb_mensualites, v_cpt_mensualites
date v_date_depart
char periodicite , ajout_s
integer val_periodicite 
long lig, ligtot, nb_lig
integer v_type_echeance
string v_tp, v_origine_tp
datawindow dw_modif

if type_gestion = 'P' then
	// prévus
	dw_modif = dw_montant_soins_prevus
else
	// soins normaux
	dw_modif = dw_montant
end if


v_acompte = dec(em_echeance_auto_acompte.text)

v_nb_mensualites = integer(em_echeance_auto_mensualites.text)

if rb_patient.checked then
	v_type_echeance = 1
else
	if rb_caisse.checked then 
		v_type_echeance = 2
	else
		v_type_echeance = 3
	end if
end if


// le reste dépend de ce qui a été fait 
if dw_modif.rowcount() = 0 then
	v_total_a_repartir = dec(em_total.text)
else
	// on est en modif .. on prend le montant selons les échéances déjà programmées
	nb_lig = 0
	ligtot = dw_modif.rowcount()
	for lig = 1 to ligtot
		choose case v_type_echeance
			case 1
				if dw_modif.getitemstring( lig, "tp") <> "O" then
					v_total_a_repartir = v_total_a_repartir + dw_modif.getitemnumber(lig, "montant")
					nb_lig = nb_lig + 1
				end if
			case 2
				if dw_modif.getitemstring( lig, "tp") = "O" and  dw_modif.getitemstring( lig, "origine_tp") = "C" then
					v_total_a_repartir = v_total_a_repartir + dw_modif.getitemnumber(lig, "montant")
					nb_lig = nb_lig + 1
				end if
			case 3
				if dw_modif.getitemstring( lig, "tp") = "O" and  dw_modif.getitemstring( lig, "origine_tp") = "M" then
					v_total_a_repartir = v_total_a_repartir + dw_modif.getitemnumber(lig, "montant")
					nb_lig = nb_lig + 1
				end if
		end choose
	next
	// pour éviter erreurs
	if d_total_a_ouverture = dec(em_total.text) then
		v_total_a_repartir = min (dec(em_total.text) , v_total_a_repartir)
	else
		// on a modifié le montant, on prend le mondant modifié
		v_total_a_repartir = dec(em_total.text)
	end if
end if


v_reste = v_total_a_repartir - v_acompte



if v_nb_mensualites <= 0 or v_acompte < 0  or v_reste<= 0 then 
	Messagebox("ATTENTION","Vous devez rentrer un nombre de périodes > 0 et un acompte >= 0 mais < au montant du soin !")
else
	
	v_mensualite = v_reste / v_nb_mensualites
	periodicite = left(ddlb_echeance_auto_periodicite.text, 1) 
	if periodicite = "M" then
		// Mensuelle
		val_periodicite = 1
	else
		val_periodicite = integer(periodicite)
	end if
	
	if v_nb_mensualites > 1 then 
		ajout_s = "s" 
	else
		ajout_s = "" 
	end if
	
	
	if MessageBox("Demande de confirmation", "Montant à répartir : " + string(v_total_a_repartir)+" €~n~n~nVous allez générer : ~n~nUne première échéance de : "+string(v_acompte)+" €~nPériodicité : "+ string(val_periodicite) + " mois~n" + string(v_nb_mensualites) + " échéance"+ ajout_s + " de " + string(v_mensualite)+ " €~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then
		
		v_date_depart = date(em_echeance_auto_date_depart.text)
		
		// on va générer ...
		
		boolean v_suite = true
		
		ligtot = dw_modif.rowcount()
		
		if ligtot > 1 then
			
			if Messagebox("Demande de confirmation","Vous allez effacer " + string(nb_lig) + " échéances déjà saisies.~n~nConfirmez-vous ?",Question!,Yesno!,2) = 2 then
				v_suite = false
			end if
			
		end if
		
		if v_suite then
			
			// Effacement des lignes existantes
			for lig = ligtot to 1 step -1
				v_tp = dw_modif.getitemstring( lig, "tp" )
				v_origine_tp = dw_modif.getitemstring( lig, "origine_tp" )
				if (v_type_echeance = 1 and v_tp = "N") or (v_type_echeance = 2 and v_tp = "O" and v_origine_tp = "C") or (v_type_echeance = 3 and v_tp = "O" and v_origine_tp = "M") then 
					dw_modif.deleterow(lig)
				end if
			next
			
			// Ajout de l'acompte ...
			if v_acompte > 0 then
				dw_modif.insertrow(0)
				ligtot = dw_modif.rowcount() 
				dw_modif.setitem(ligtot,"code",var_code_local)
				dw_modif.setitem(ligtot,"date",v_date_depart)
				dw_modif.setitem(ligtot,"montant", v_acompte)
				
				choose case v_type_echeance
					case 1
						dw_modif.setitem(ligtot,"tp","N")
						dw_modif.setitem(ligtot,"origine_tp"," ")
					case 2
						dw_modif.setitem(ligtot,"tp","O")
						dw_modif.setitem(ligtot,"origine_tp","C")
					case 3
						dw_modif.setitem(ligtot,"tp","O")
						dw_modif.setitem(ligtot,"origine_tp","M")
				end choose
		

				// Ajout des mensualités suivantes
				 v_cpt_mensualites = 2
				 v_nb_mensualites  = v_nb_mensualites + 1
			else
				// Ajout des mensualités
				 v_cpt_mensualites = 1
			end if

			 
			do while v_cpt_mensualites <= v_nb_mensualites and v_reste > 0
				dw_modif.insertrow(0)
				ligtot = dw_modif.rowcount() 
				dw_modif.setitem(ligtot,"code",var_code_local)
				dw_modif.setitem(ligtot,"date",ajout_x_mois(v_date_depart, (v_cpt_mensualites - 1) * val_periodicite) )
				if v_cpt_mensualites = v_nb_mensualites then
					// dernière mensulaité, on met ce qu'il reste
					dw_modif.setitem(ligtot,"montant", v_reste)
				else
					dw_modif.setitem(ligtot,"montant", v_mensualite)
				end if

				choose case v_type_echeance
					case 1
						dw_modif.setitem(ligtot,"tp","N")
						dw_modif.setitem(ligtot,"origine_tp"," ")
					case 2
						dw_modif.setitem(ligtot,"tp","O")
						dw_modif.setitem(ligtot,"origine_tp","C")
					case 3
						dw_modif.setitem(ligtot,"tp","O")
						dw_modif.setitem(ligtot,"origine_tp","M")
				end choose
		

				v_cpt_mensualites = v_cpt_mensualites + 1
				v_reste = v_reste - v_mensualite
				
				
						
			loop 
			
			
			cb_enregistrer_montant.enabled ( true )
			
		end if



		
		
	end if
	
end if
	
	

end event

type st_echeance_auto_date_depart from statictext within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2501
integer y = 1328
integer width = 402
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Date de départ"
boolean focusrectangle = false
end type

type em_echeance_auto_date_depart from editmask within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2930
integer y = 1316
integer width = 425
integer height = 88
integer taborder = 210
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean dropdowncalendar = true
end type

type st_echeance_auto_mensualites from statictext within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2501
integer y = 1188
integer width = 384
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Nb Périodes"
boolean focusrectangle = false
end type

type em_echeance_auto_mensualites from editmask within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2930
integer y = 1176
integer width = 201
integer height = 88
integer taborder = 200
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
end type

type st_echeance_auto_periodicite from statictext within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2501
integer y = 1048
integer width = 384
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Périodicité "
boolean focusrectangle = false
end type

type ddlb_echeance_auto_periodicite from dropdownlistbox within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2935
integer y = 1040
integer width = 480
integer height = 516
integer taborder = 140
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
string item[] = {"Mensuelle","2 mois","3 mois","4 mois","5 mois","6 mois"}
borderstyle borderstyle = stylelowered!
end type

type st_echeance_auto_acompte from statictext within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2501
integer y = 908
integer width = 384
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Acompte"
boolean focusrectangle = false
end type

type em_echeance_auto_acompte from editmask within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2935
integer y = 896
integer width = 402
integer height = 88
integer taborder = 190
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "######0.00"
end type

type ddlb_soins from dropdownlistbox within w_soins_reg_maj_echeances
event saisie_a_la_volee pbm_keyup
boolean visible = false
integer x = 169
integer y = 112
integer width = 1435
integer height = 1680
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event saisie_a_la_volee;// Pour positionner la liste en fonction de ce qu'on tape ...
integer lig

if Key = KeyDownArrow! or Key = KeyUpArrow! or Key =KeyPageUp! or Key =KeyPageDown! or Key =KeyEnd! or Key =KeyHome! then
	// Navigation avec les flèches ... rien à faire ...

else
	// autres touches
	choose case key
		case KeyA! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "A"
		case KeyB! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "B"
		case KeyC! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "C"
		case KeyD! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "D"
		case KeyE! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "E"
		case KeyF! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "F"
		case KeyG! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "G"
		case KeyH! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "H"
		case KeyI! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "I"
		case KeyJ! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "J"
		case KeyK! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "K"
		case KeyL! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "L"
		case KeyM! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "M"
		case KeyN! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "N"
		case KeyO! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "O"
		case KeyP! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "P"
		case KeyQ! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "Q"
		case KeyR! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "R"
		case KeyS! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "S"
		case KeyT! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "T"
		case KeyU! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "U"
		case KeyV! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "V"
		case KeyW! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "W"
		case KeyX! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "X"
		case KeyY! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "Y"
		case KeyZ! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "Z"
	
		case Key0! , KeyNumpad0! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "0"
		case Key1!  , KeyNumpad1! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "1"
		case Key2!  , KeyNumpad2! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "2"
		case Key3!  , KeyNumpad3! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "3"
		case Key4!  , KeyNumpad4! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "4"
		case Key5!  , KeyNumpad5! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "5"
		case Key6!  , KeyNumpad6! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "6"
		case Key7!  , KeyNumpad7! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "7"
		case Key8!  , KeyNumpad8! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "8"
		case Key9!  , KeyNumpad9! 
			chaine_saisie_liste_soins = chaine_saisie_liste_soins + "9"
	
	
		case KeyEscape!
			// RAZ de la chaine de recherche
			chaine_saisie_liste_soins = ""
			
	end choose
	
	// positionnement dans a liste 
	if len(chaine_saisie_liste_soins) > 0 then
		lig = FindItem(chaine_saisie_liste_soins, 0)
	else
		lig = 1
	end if
	SelectItem(lig)
end if


end event

type em_num from editmask within w_soins_reg_maj_echeances
integer x = 1669
integer y = 112
integer width = 133
integer height = 84
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "##.0"
end type

on losefocus;verif_positif(this)
end on

type em_date_dem from editmask within w_soins_reg_maj_echeances
integer x = 1819
integer y = 112
integer width = 329
integer height = 84
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type em_scp_dem from editmask within w_soins_reg_maj_echeances
integer x = 2167
integer y = 112
integer width = 233
integer height = 84
integer taborder = 50
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "###.00"
string displaydata = ""
end type

event losefocus;verif_positif(this)
//if real(this.text) > 0 then
//	em_scp_acc.text = this.text
//end if
maj_total()
end event

type em_hn from editmask within w_soins_reg_maj_echeances
integer x = 2501
integer y = 112
integer width = 311
integer height = 84
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
string mask = "#####.00"
end type

event losefocus;maj_total()


if not belgique and not luxembourg and not (france and soin_saisi_ccam ) then
	verif_positif(this)
end if


end event

type em_tp from editmask within w_soins_reg_maj_echeances
integer x = 2921
integer y = 112
integer width = 183
integer height = 84
integer taborder = 70
boolean bringtotop = true
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

event losefocus;maj_total()
maj_dep()
verif_positif(this)

end event

on modified;verif_positif(this)
end on

type em_total from editmask within w_soins_reg_maj_echeances
integer x = 3177
integer y = 112
integer width = 311
integer height = 84
integer taborder = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = decimalmask!
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

type cb_enregistrer from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
integer x = 1861
integer y = 1944
integer width = 521
integer taborder = 240
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;// 	ENREGISTREMENT DU SOIN
//----------------------------------

boolean v_suite = true

if Belgique and action = "A"  then
	v_suite = verif_regles_soins_belges(var_code_local, type_soin, date(em_date_dem.text) , true)
else
	v_suite = true
end if


if v_suite then
	// COMMUN AU SOINS ET AUX SOINS PREVUS
	
	if profilestring(dir_ini+inifile_orthokis,"admini","afficher_assistant_echeances","N") = "O" then
		echeance_auto_visible(true)
	end if
	
	
	decimal {2} reste,secu,tp
	double taux_tp
	
	em_date_dem.enabled = false
	em_hn.enabled = false
	//em_date_acc.enabled = false
	em_num.enabled = false
//	em_scp_acc.enabled = false
	em_tp.enabled = false
	em_total.enabled = false
	em_scp_dem.enabled = false
	dw_nom.enabled = false
	
	if type_gestion = 'P' then
		em_date_impr.enabled = false
	end if
	
	sle_association.enabled = false
	cb_ajouter_montant.visible = true
	cb_annuler_montant.visible = true
	cb_enregistrer_montant.visible = true
	cb_supprimer_montant.visible = true
	
	
	datawindow dw_modif
	if type_gestion = 'P' then
		dw_modif = dw_montant_soins_prevus
	else
		dw_modif = dw_montant
	end if
	
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
				dw_modif.insertrow(0)
				dw_modif.setitem(dw_modif.rowcount(),"code",var_code_local)
				IF em_date_dem.text = '00/00/0000' THEN
					em_date_dem.text = string(Today())
				END IF
				
				// On place le règlement à la fin du soin => recherche de la duree
				string v_type_soin
				integer v_duree
				select duree into :v_duree from code_soins where code = :type_soin ;
								
				dw_modif.setitem(dw_modif.rowcount(),"date",ajout_x_mois(date(em_date_dem.text),v_duree))
				dw_modif.setitem(dw_modif.rowcount(),"montant",secu * taux_tp/100)
				dw_modif.setitem(dw_modif.rowcount(),"tp",'O')
				dw_modif.setitem(dw_modif.rowcount(),"origine_tp",'C')
			end if
	
			reste = dec(em_total.text) - secu * taux_tp/100
	
			if reste > 0 then
				dw_modif.insertrow(0)
				dw_modif.setitem(dw_modif.rowcount(),"code",var_code_local)
				IF em_date_dem.text = '00/00/0000' THEN
					em_date_dem.text = string(Today())
				END IF	
				dw_modif.setitem(dw_modif.rowcount(),"date",date(em_date_dem.text))
				dw_modif.setitem(dw_modif.rowcount(),"montant",reste)
			end if
			dw_modif.scrolltorow(dw_modif.rowcount())
			dw_modif.setfocus()
			
			
	CASE "M"
			// Modification de soins
			
			// Si qu'une ligne, mise à jour du montant
			if dw_modif.rowcount() = 1 then
				dw_modif.setitem(dw_modif.rowcount(),"montant",dec(em_total.text))
			end if
			dw_modif.setfocus()
			taux_tp = dec(em_tp.text)
			
	END CHOOSE
	
	this.visible = false
	cb_annuler.visible  = false
	
	dw_modif.visible = true
	verif_montant(dw_modif)
else
	
	cb_annuler.triggerevent(clicked!)
end if



end event

type cb_annuler from uo_picturebutton_390x120 within w_soins_reg_maj_echeances
integer x = 1321
integer y = 1944
integer width = 521
integer taborder = 250
boolean bringtotop = true
string text = "A&nnuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;//echeance_auto_visible(false)
//
//ajlig(false)
//
//
//
//// Reset de la saisie du soin
//premiere = true
//
//
//
//if type_gestion = 'P' then
//	reset(dw_montant_soins_prevus)
//	ddlb_soins.selectitem(1)
//	dw_montant_soins_prevus.visible = false
//else
//	ddlb_soins.selectitem(1)
//	reset(dw_montant)
//	dw_montant.visible = false
//end if
//
//
//maj_selon_module(type_gestion)
//

close(parent)
end event

type st_soin from statictext within w_soins_reg_maj_echeances
integer x = 663
integer y = 12
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Soin"
boolean focusrectangle = false
end type

type st_num from statictext within w_soins_reg_maj_echeances
integer x = 1691
integer y = 16
integer width = 119
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "N°"
boolean focusrectangle = false
end type

type st_demande from statictext within w_soins_reg_maj_echeances
integer x = 1979
integer y = 12
integer width = 302
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Demande"
boolean focusrectangle = false
end type

type st_hn from statictext within w_soins_reg_maj_echeances
integer x = 2455
integer y = 12
integer width = 402
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Dépassement"
boolean focusrectangle = false
end type

type st_tp from statictext within w_soins_reg_maj_echeances
integer x = 2903
integer y = 12
integer width = 206
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "TP"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_total from statictext within w_soins_reg_maj_echeances
integer x = 3214
integer y = 12
integer width = 247
integer height = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Total"
boolean focusrectangle = false
end type

type dw_nom from datawindow within w_soins_reg_maj_echeances
string tag = "no resizeall"
integer x = 137
integer y = 112
integer width = 1495
integer height = 84
integer taborder = 170
boolean bringtotop = true
string dataobject = "dw_type_soins"
boolean border = false
boolean livescroll = true
end type

event getfocus;string code
string date_dem , tp
integer v_duree

if this.getRow() > 0 then
	code = this.getItemString(this.getRow(),"code")
else
	code = this.gettext()
end if

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
	//	em_date_acc.visible = true
//		if not belgique then
//			em_scp_acc.visible = true
//		end if
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
cb_enregistrer.enabled ( false )
//cb_annuler.enabled ( false )

// Selection auto
this.SelectText (1, 100)




end event

event losefocus;string v_code
integer mn
integer v_duree
string date_dem , tp
string v_nature_soin, v_code_association , v_dent, v_exo, v_remboursement_exceptionnel
string v_exo_defaut, v_remboursement_exceptionnel_defaut, v_modificateurs_defaut
if this.getRow() > 0 then
	v_code = this.getItemString(this.getRow(),"code")
else
	v_code = this.gettext()
end if

type_soin = v_code 

	

SELECT "code_soins"."duree",            "code_soins"."date_dem",            "code_soins"."tp"  ,			"code_soins"."nb_lettre",			"code_soins"."depasse",			
"code_soins"."valeur", "code_soins"."duree" , "code_soins"."nature", isnull( "code_association", '') ,  isnull("exo_defaut", '') , isnull("remboursement_exceptionnel_defaut",'N'), "modificateurs_defaut"
	 INTO :v_duree,            :date_dem,            :tp  ,			:nb_lettre,			:depasse,			:valeur,  :v_duree, :v_nature_soin, 
	 :v_code_association ,  :v_exo_defaut, :v_remboursement_exceptionnel_defaut, :v_modificateurs_defaut
	 FROM "code_soins"  
	WHERE "code_soins"."code" = :v_code   ;



if v_nature_soin = 'C' then
	soin_saisi_ccam = true
	st_association.visible = true
	sle_association.visible = true
	sle_association.text = v_code_association
	cbx_remb_excep.visible = true
	if ancien_soin <> v_code then 
		// on remet les valmeurs par défaut si soin <>
		if v_remboursement_exceptionnel_defaut = "O" then
			cbx_remb_excep.checked = true
		end if
	end if
	

	st_modificateurs.visible = true
	sle_modificateurs.visible = true
	if ancien_soin <> v_code then 
		sle_modificateurs.text = v_modificateurs_defaut
	end if

else
	soin_saisi_ccam = false
	st_association.visible = false
	sle_association.visible = false
	sle_association.text = ""
	st_modificateurs.visible = false
	sle_modificateurs.visible = false
	sle_modificateurs.text = ""
	cbx_remb_excep.visible = false
	cbx_remb_excep.checked = false
end if


if v_exo_defaut <> '' then
	// mise à jour ddlb
	choose case v_exo_defaut
		case '0'
			ddlb_exo.SelectItem(1)
		case '3'
			ddlb_exo.SelectItem(2)
		case '6'
			ddlb_exo.SelectItem(3)
		case '7'
			ddlb_exo.SelectItem(4)
		case 'C'
			ddlb_exo.SelectItem(5)
	end choose
end if

zero(depasse)

cb_enregistrer.enabled ( TRUE )

IF type_soin <> ancien_soin  THEN
	
	
	if double(em_total.text) = 0 then 
		reset_saisie ()
		// on remet les valeurs potentiellement déjà présentes
		sle_modificateurs.text = v_modificateurs_defaut
		sle_association.text = v_code_association
		if v_remboursement_exceptionnel_defaut = "O" then
			cbx_remb_excep.checked = true
		end if
	end if
	
	
	IF v_duree > 0 THEN
		em_num.visible = true
		
		if type_gestion = 'P' then
			// select max(numero) INTO :mn from soins_prevus where code = :var_code_local and type = :v_code ;
			// depuis 21.00l on tient compte du N° de devis
			select max(numero) INTO :mn from soins_prevus where code = :var_code_local and type = :v_code and code_devis = :var_code_devis_local ;
		else
			select max(numero) INTO :mn from soins where code = :var_code_local and type = :v_code ;
		end if
		
		
		if isnull(mn) then
			mn = 0
		end if
		mn = mn + 1

		em_num.text = string(mn)	
		
	ELSE
		em_num.visible = false
	END IF
	
	em_date_dem.visible = true
	
	if double(em_total.text) = 0 then 
		em_date_dem.text = string(today())
	end if
	IF date_dem = 'O' THEN
		//em_date_acc.visible = true
		if not belgique then
			em_scp_dem.visible = true
			//em_scp_acc.visible = true
		end if
	ELSE
		//em_date_acc.visible = false
		em_scp_dem.visible = false
		//em_scp_acc.visible = false
	END IF
	
	IF tp = 'O' THEN
		em_tp.visible = true 
		// On met à jour les valeurs par défaut !!!
		em_tp.text = string(tp_def)
	ELSE
		em_tp.visible = false		
	END IF	
	
		
	IF IsNull(nb_lettre) THEN
		//rien
	ELSE
		em_scp_dem.text = string(nb_lettre)
	END IF	
	
	string a
	a = trim(em_hn.text)
	
	// depuis 2020 ; on ne met à jour le hn que si vide ... sinon c'est que modif de la saisie du soin
	if double(trim(em_hn.text)) = 0 then
		if v_duree = 6 and hn_def <> 0 then
		// valeur par défaut de la fiche administrative
			em_hn.text = string(hn_def)
		else
			em_hn.text = string(depasse)
		end if
	end if
	
	
END IF


// RAZ de la chaine de recherche
chaine_saisie_liste_soins = ""

cb_annuler.enabled ( true )
maj_total()

// Actualisation du type de soin
ancien_soin = v_code 
	

end event

type st_date_impr from statictext within w_soins_reg_maj_echeances
boolean visible = false
integer x = 183
integer y = 272
integer width = 549
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "DEP imprimée le "
boolean focusrectangle = false
end type

type em_date_impr from editmask within w_soins_reg_maj_echeances
boolean visible = false
integer x = 695
integer y = 256
integer width = 329
integer height = 96
integer taborder = 110
boolean bringtotop = true
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

type em_date_acc from editmask within w_soins_reg_maj_echeances
boolean visible = false
integer x = 69
integer y = 1488
integer width = 325
integer height = 96
integer taborder = 90
boolean bringtotop = true
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

type em_scp_acc from editmask within w_soins_reg_maj_echeances
boolean visible = false
integer x = 64
integer y = 1364
integer width = 233
integer height = 96
integer taborder = 100
boolean bringtotop = true
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

type gb_echeance_auto from groupbox within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2423
integer y = 624
integer width = 1211
integer height = 1096
integer taborder = 160
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Echéances Financières Automatiques"
end type

type rb_patient from radiobutton within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2469
integer y = 752
integer width = 334
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Patient"
boolean checked = true
end type

type rb_caisse from radiobutton within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2793
integer y = 752
integer width = 338
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "TP Caisse"
end type

type rb_mutuelle from radiobutton within w_soins_reg_maj_echeances
boolean visible = false
integer x = 3163
integer y = 752
integer width = 389
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "TP Mutuelle"
end type

type sle_association from singlelineedit within w_soins_reg_maj_echeances
boolean visible = false
integer x = 3557
integer y = 112
integer width = 183
integer height = 84
integer taborder = 180
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
integer limit = 3
borderstyle borderstyle = stylelowered!
end type

type st_association from statictext within w_soins_reg_maj_echeances
boolean visible = false
integer x = 3515
integer y = 12
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Ass."
alignment alignment = center!
end type

type cbx_remb_excep from checkbox within w_soins_reg_maj_echeances
boolean visible = false
integer x = 1609
integer y = 268
integer width = 823
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Reboursement Exceptionnel"
boolean lefttext = true
end type

type st_dent from statictext within w_soins_reg_maj_echeances
boolean visible = false
integer x = 165
integer y = 416
integer width = 215
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Dents :"
boolean focusrectangle = false
end type

type sle_dent from singlelineedit within w_soins_reg_maj_echeances
boolean visible = false
integer x = 379
integer y = 412
integer width = 1595
integer height = 84
integer taborder = 120
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

type st_exo from statictext within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2226
integer y = 424
integer width = 183
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Exo :"
boolean focusrectangle = false
end type

type ddlb_exo from dropdownlistbox within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2386
integer y = 412
integer width = 1038
integer height = 572
integer taborder = 150
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean sorted = false
string item[] = {"Pas d~'exonération","Soins particuliers exonérés","Régimes spéciaux","Soins dispo. prévention","Exonération CCAM"}
borderstyle borderstyle = stylelowered!
end type

type cbx_pseudocodes from checkbox within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2720
integer y = 1976
integer width = 873
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Activer pseudocodes"
boolean checked = true
end type

event clicked;actualiser_liste_codes_soins ()
end event

type pb_schema from picturebutton within w_soins_reg_maj_echeances
boolean visible = false
integer x = 1993
integer y = 404
integer width = 110
integer height = 100
integer taborder = 130
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_dent.png"
alignment htextalign = left!
string powertiptext = "Saisie des dents par schema dentaire"
end type

event clicked;param_win[1] = "D"
openWithParm(w_schema, sle_dent.text)


// recup de la valeur retournée
string v_extraction 
v_extraction = message.StringParm
if v_extraction <> "-1" then
	sle_dent.text = v_extraction
end if

end event

type st_modificateurs from statictext within w_soins_reg_maj_echeances
boolean visible = false
integer x = 2711
integer y = 272
integer width = 457
integer height = 68
boolean bringtotop = true
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Modificateurs : "
boolean focusrectangle = false
end type

type sle_modificateurs from singlelineedit within w_soins_reg_maj_echeances
boolean visible = false
integer x = 3154
integer y = 264
integer width = 384
integer height = 84
integer taborder = 130
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
integer limit = 5
borderstyle borderstyle = stylelowered!
end type

