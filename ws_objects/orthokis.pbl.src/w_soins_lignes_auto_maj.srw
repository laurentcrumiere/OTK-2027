$PBExportHeader$w_soins_lignes_auto_maj.srw
forward
global type w_soins_lignes_auto_maj from w_soins_maj
end type
type gb_decalage from groupbox within w_soins_lignes_auto_maj
end type
type rb_jour from radiobutton within w_soins_lignes_auto_maj
end type
type rb_mois from radiobutton within w_soins_lignes_auto_maj
end type
type em_decalage from editmask within w_soins_lignes_auto_maj
end type
type st_echeance_auto_acompte from statictext within w_soins_lignes_auto_maj
end type
type em_echeance_auto_acompte from editmask within w_soins_lignes_auto_maj
end type
type st_echeance_auto_periodicite from statictext within w_soins_lignes_auto_maj
end type
type pb_echeance_auto_generer from uo_picturebutton_250x120 within w_soins_lignes_auto_maj
end type
type em_echeance_auto_date_depart from editmask within w_soins_lignes_auto_maj
end type
type st_echeance_auto_date_depart from statictext within w_soins_lignes_auto_maj
end type
type st_echeance_auto_mensualites from statictext within w_soins_lignes_auto_maj
end type
type em_echeance_auto_mensualites from editmask within w_soins_lignes_auto_maj
end type
type ddlb_echeance_auto_periodicite from dropdownlistbox within w_soins_lignes_auto_maj
end type
type sle_association from singlelineedit within w_soins_lignes_auto_maj
end type
type st_association from statictext within w_soins_lignes_auto_maj
end type
type pb_calculatrice from uo_picturebutton_390x120 within w_soins_lignes_auto_maj
end type
type st_modificateurs from statictext within w_soins_lignes_auto_maj
end type
type sle_modificateurs from singlelineedit within w_soins_lignes_auto_maj
end type
type gb_echeance_auto from groupbox within w_soins_lignes_auto_maj
end type
end forward

global type w_soins_lignes_auto_maj from w_soins_maj
string tag = "soins_auto"
integer width = 4297
integer height = 2624
string title = "Gestion des Soins Automatiques"
windowtype windowtype = main!
windowstate windowstate = normal!
long backcolor = 16777215
gb_decalage gb_decalage
rb_jour rb_jour
rb_mois rb_mois
em_decalage em_decalage
st_echeance_auto_acompte st_echeance_auto_acompte
em_echeance_auto_acompte em_echeance_auto_acompte
st_echeance_auto_periodicite st_echeance_auto_periodicite
pb_echeance_auto_generer pb_echeance_auto_generer
em_echeance_auto_date_depart em_echeance_auto_date_depart
st_echeance_auto_date_depart st_echeance_auto_date_depart
st_echeance_auto_mensualites st_echeance_auto_mensualites
em_echeance_auto_mensualites em_echeance_auto_mensualites
ddlb_echeance_auto_periodicite ddlb_echeance_auto_periodicite
sle_association sle_association
st_association st_association
pb_calculatrice pb_calculatrice
st_modificateurs st_modificateurs
sle_modificateurs sle_modificateurs
gb_echeance_auto gb_echeance_auto
end type
global w_soins_lignes_auto_maj w_soins_lignes_auto_maj

type variables

end variables

forward prototypes
public subroutine calcul_decalage_soin ()
public subroutine echeance_auto_visible (boolean v_visible)
public subroutine actualiser_liste_codes ()
end prototypes

public subroutine calcul_decalage_soin ();// On calcul le décalage de la date de demande
// En absolu par rapport au 01/01/1900
// En tenant compte des boutons Jour / Mois

if rb_jour.checked then
	// Décalage en jour
	em_decalage.text = string(daysafter(date(1900,1,1),date(em_date_dem.text)))
else
	// Calcul en mois
	em_decalage.text = string((year(date(em_date_dem.text)) - 1900) * 12 + month(date(em_date_dem.text)) - 1)
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
	// En standard depuis 2017
	if serial = "87589"	then 
		// pour pas perturber Van Steenberghe ... à l'origine en spécifiaue pour lui
		em_echeance_auto_acompte.text = em_total.text
	else
		em_echeance_auto_acompte.text = "0"
	end if
	// 1 mensualités
	em_echeance_auto_mensualites.text = '1'
end if

end subroutine

public subroutine actualiser_liste_codes ();// Actualisation de la liste des soins en fonction de ceratins critères

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
	
	// on les prend tous
	insert into temp_code_soins ("code", "nom", "ordre_trie", "couleur_fond")
	values ( :v_code_lu, :nom_soin, :v_ordre_trie , :v_couleur_fond) ;
	
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

event open;
string tit
var_code_local = var_soins_auto
SELECT nom INTO :tit FROM titres_soins_auto WHERE code = :var_code_local  ;

this.title = "Soins Automatiques : "+tit

SELECT "prati"."sc","prati"."pxcons","prati"."radio" 
INTO :prix_scp,:prix_cons,:prix_radio 
FROM prati ;

dw_detail.settransobject(SQLCA)
dw_impression.SettransObject(SQLCA)
dw_soins.settransobject(SQLCA)
dw_soins.retrieve(var_code_local)
dw_montant.settransobject(SQLCA)
dw_edition.settransobject(SQLCA)
dw_nom.SetTransObject(SQLCA)

// Modification du terme "Dépassement"
dw_soins.modify("hn_t.text = '"+libelle_depassement+"'")
dw_impression.modify("hn_t.text = '"+libelle_depassement+"'")
st_hn.text = libelle_depassement


this.backcolor = couleur_fond_fenetre

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

gb_echeance_auto.BackColor = couleur_fond_fenetre
ddlb_echeance_auto_periodicite.Selectitem(1)

actualiser_liste_codes()

	
// Autorisation à modifier le montant d'un soin
string ls_autor
select autor_modif_tarif_soin into :ls_autor from utilisateurs where code = :utilisateur_code ;
if ls_autor = "N" then
	// on empeche la modification des zone dépassement et total
	em_hn.displayonly = true
	em_total.displayonly = true
end if

uo_size.taille(this)


end event

on w_soins_lignes_auto_maj.create
int iCurrent
call super::create
this.gb_decalage=create gb_decalage
this.rb_jour=create rb_jour
this.rb_mois=create rb_mois
this.em_decalage=create em_decalage
this.st_echeance_auto_acompte=create st_echeance_auto_acompte
this.em_echeance_auto_acompte=create em_echeance_auto_acompte
this.st_echeance_auto_periodicite=create st_echeance_auto_periodicite
this.pb_echeance_auto_generer=create pb_echeance_auto_generer
this.em_echeance_auto_date_depart=create em_echeance_auto_date_depart
this.st_echeance_auto_date_depart=create st_echeance_auto_date_depart
this.st_echeance_auto_mensualites=create st_echeance_auto_mensualites
this.em_echeance_auto_mensualites=create em_echeance_auto_mensualites
this.ddlb_echeance_auto_periodicite=create ddlb_echeance_auto_periodicite
this.sle_association=create sle_association
this.st_association=create st_association
this.pb_calculatrice=create pb_calculatrice
this.st_modificateurs=create st_modificateurs
this.sle_modificateurs=create sle_modificateurs
this.gb_echeance_auto=create gb_echeance_auto
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_decalage
this.Control[iCurrent+2]=this.rb_jour
this.Control[iCurrent+3]=this.rb_mois
this.Control[iCurrent+4]=this.em_decalage
this.Control[iCurrent+5]=this.st_echeance_auto_acompte
this.Control[iCurrent+6]=this.em_echeance_auto_acompte
this.Control[iCurrent+7]=this.st_echeance_auto_periodicite
this.Control[iCurrent+8]=this.pb_echeance_auto_generer
this.Control[iCurrent+9]=this.em_echeance_auto_date_depart
this.Control[iCurrent+10]=this.st_echeance_auto_date_depart
this.Control[iCurrent+11]=this.st_echeance_auto_mensualites
this.Control[iCurrent+12]=this.em_echeance_auto_mensualites
this.Control[iCurrent+13]=this.ddlb_echeance_auto_periodicite
this.Control[iCurrent+14]=this.sle_association
this.Control[iCurrent+15]=this.st_association
this.Control[iCurrent+16]=this.pb_calculatrice
this.Control[iCurrent+17]=this.st_modificateurs
this.Control[iCurrent+18]=this.sle_modificateurs
this.Control[iCurrent+19]=this.gb_echeance_auto
end on

on w_soins_lignes_auto_maj.destroy
call super::destroy
destroy(this.gb_decalage)
destroy(this.rb_jour)
destroy(this.rb_mois)
destroy(this.em_decalage)
destroy(this.st_echeance_auto_acompte)
destroy(this.em_echeance_auto_acompte)
destroy(this.st_echeance_auto_periodicite)
destroy(this.pb_echeance_auto_generer)
destroy(this.em_echeance_auto_date_depart)
destroy(this.st_echeance_auto_date_depart)
destroy(this.st_echeance_auto_mensualites)
destroy(this.em_echeance_auto_mensualites)
destroy(this.ddlb_echeance_auto_periodicite)
destroy(this.sle_association)
destroy(this.st_association)
destroy(this.pb_calculatrice)
destroy(this.st_modificateurs)
destroy(this.sle_modificateurs)
destroy(this.gb_echeance_auto)
end on

type p_fond from w_soins_maj`p_fond within w_soins_lignes_auto_maj
integer x = 1024
end type

type cb_autre from w_soins_maj`cb_autre within w_soins_lignes_auto_maj
integer x = 2848
integer y = 2300
string iconname = "ACTIONS_autre.png"
end type

event cb_autre::clicked;string tit

var_suite = false
open(w_cherche_titres_soins_automatiques)

if var_suite then
	var_code_local = var_soins_auto
	SELECT nom INTO :tit FROM titres_soins_auto WHERE code = :var_code_local  ;
	
	parent.title = "Soins Automatiques : "+tit

	dw_soins.retrieve(var_code_local)
end if
end event

type cb_fermer from w_soins_maj`cb_fermer within w_soins_lignes_auto_maj
integer x = 3310
integer y = 2300
string iconname = "ACTIONS_fermer.png"
end type

event cb_fermer::clicked;// Pour qu'il mette à jour le Nombre de ligne dans la liste des titres

if isvalid(w_titres_soins_auto) then 
	w_titres_soins_auto.dw_liste.retrieve()
	w_titres_soins_auto.dw_liste.scrolltorow(w_titres_soins_auto.ligne_courante)
end if

fermer_fenetre(parent)

end event

type cb_modifier from w_soins_maj`cb_modifier within w_soins_lignes_auto_maj
integer x = 1330
integer y = 2300
integer taborder = 160
string iconname = "ACTIONS_modifier.png"
end type

event cb_modifier::clicked;string lib
integer v_actif


if dw_soins.rowcount() = 0 then
	son(5)
	MessageBox("ATTENTION !","Aucun soin n'a été saisi !")
else

	cle_manip = dw_soins.getitemnumber(dw_soins.getrow(),"cle")
	integer cpt_reg

	// Vérification de règlements saisis
//	SELECT count(*) INTO :cpt_reg FROM paye WHERE code = :var_code_local and cle = :cle_manip ;

	action = "M"

	reset_saisie()

	dw_montant.retrieve(var_code_local,cle_manip)


	em_date_dem.text = string(dw_soins.getitemdate(dw_soins.getrow(),"date_demande"),"dd/mm/yyyy")
	em_hn.text = string(dw_soins.getitemnumber(dw_soins.getrow(),"hn"))
	em_date_acc.text = string(dw_soins.getitemdate(dw_soins.getrow(),"date_accord"),"dd/mm/yyyy")
	em_scp_dem.text = string(dw_soins.getitemnumber(dw_soins.getrow(),"scp_demande"))
	em_scp_acc.text = string(dw_soins.getitemnumber(dw_soins.getrow(),"scp_accord"))
	em_tp.text = string(dw_soins.getitemnumber(dw_soins.getrow(),"tp"))
	em_num.text = string(dw_soins.getitemnumber(dw_soins.getrow(),"numero"))

	type_soin = dw_soins.getitemstring(dw_soins.getrow(),"code_soins_code")

	// mise à jour de la dw de la liste des soins
	dw_nom.setitem(1, "code", type_soin)
	dw_nom.SetFocus()

	em_decalage.text = string(dw_soins.getitemnumber(dw_soins.getrow(),"soins_auto_nombre_decalage"))
	if dw_soins.getitemstring(dw_soins.getrow(),"soins_auto_mode_decalage") = 'J' then
		rb_jour.checked = true
		rb_mois.checked = false
	else
		rb_mois.checked = true
		rb_jour.checked = false
	end if
	

  SELECT "code_soins"."nom"  , "actif"
    INTO :lib  , :v_actif
    FROM "code_soins"  
   WHERE "code_soins"."code" = :type_soin   ;
	
	if v_actif = 1 then

		ajlig(true)
		gb_decalage.visible = true
		rb_mois.visible = true 
		rb_jour.visible = true
		st_association.visible = false
		sle_association.visible = false
		sle_modificateurs.visible = false
		em_decalage.visible = true
		
		if dw_soins.getitemstring(dw_soins.getrow(),"code_soins_nature") = 'C' then
			st_association.visible = true
			sle_association.text = dw_soins.getitemstring(dw_soins.getrow(),"soins_auto_code_association")
			sle_association.visible = true
			
			st_modificateurs.visible = true
			sle_modificateurs.visible = true
			sle_modificateurs.text = dw_soins.getitemstring(dw_soins.getrow(),"soins_auto_modificateurs")

		else
			st_association.visible = false
			sle_association.text = ""
			st_association.visible = false
			
			st_modificateurs.visible = false
			sle_modificateurs.visible = false
			sle_modificateurs.text = ""
		end if

	
		dw_nom.setfocus()
		maj_total()
		cb_enregistrer.enabled ( TRUE)
	else
		Messagebox("ATTENTION !","Ce type de soin n'est plus actif !")
		
	end if

end if
end event

type cb_supprimer from w_soins_maj`cb_supprimer within w_soins_lignes_auto_maj
integer x = 914
integer y = 2300
integer taborder = 150
string iconname = "ACTIONS_supprimer.png"
end type

event cb_supprimer::clicked;if dw_soins.rowcount() = 0 then
	son(5)
	MessageBox("ATTENTION !","Aucun soin n'a été saisi !")
else
	if MessageBox("ATTENTION !","La suppression de ce soin sera définitive !~n~nConfirmez-vous ?",Question!,yesNo!,2) = 1 then

		cle_manip = dw_soins.getitemnumber(dw_soins.getrow(),"cle")
		
		integer v_duree
		date var_date_dem_supprime
		string cde
			
		v_duree = dw_soins.getItemNumber(dw_soins.getrow(), "code_soins_duree")
		var_date_dem_supprime = dw_soins.getItemDate(dw_soins.getrow(), "date_demande")
		zeroi(v_duree)
		if v_duree > 0 then 
			
			if MessageBox("ATTENTION !", "Vous venez de supprimer un soin durant " +  string(v_duree)+ " mois.~n~nSouhaitez-vous avancer d'autant les soins suivants ?", Question!,yesNo!,2) = 2 then
				v_duree = 0
			end if
		end if

	

		  DELETE FROM "ligne_soins_auto"  		WHERE ( code = :var_code_local ) AND    ( cle = :cle_manip )   ;

		  DELETE FROM "soins_auto"  		WHERE code = :var_code_local AND  cle = :cle_manip    ;
		 
		 commit ;
		  
		 	if v_duree > 0 then
				// Délage des soins suivants ... 
				cde = 'UPDATE ligne_soins_auto,soins_auto,code_soins SET "date" = dateadd (month, ' +   string(- v_duree)   +', "date") WHERE "soins_auto"."type" = "code_soins"."code"  and "code_soins"."duree" > 0  and "soins_auto"."code" = "ligne_soins_auto"."code" and "soins_auto"."cle" = "ligne_soins_auto"."cle" and "soins_auto"."code" = '+string(var_code_local) + ' and "date_demande" >= '+"'"+string(var_date_dem_supprime,'yyyy-mm-dd') +"'"
				EXECUTE IMMEDIATE :cde ;
				if sqlca.sqlcode <> 0 then
					messagebox("Problème dans l'actualisation 1",sqlca.sqlerrtext)
					rollback ;
				else

					// Décalage des soins suivants ... 
					cde = 'UPDATE soins_auto,code_soins SET "date_demande" = dateadd (month, ' +   string(- v_duree)   +', "date_demande")    WHERE "soins_auto"."type" = "code_soins"."code"  and "code_soins"."duree" > 0  and "soins_auto"."code" = '+string(var_code_local) + ' and "date_demande" >= '+"'"+string(var_date_dem_supprime,'yyyy-mm-dd') +"'"
					EXECUTE IMMEDIATE :cde ;
					if sqlca.sqlcode <> 0 then
						messagebox("Problème dans l'actualisation 2",sqlca.sqlerrtext)
						rollback ;
					else
						commit ;
					end if
				end if
				
			end if


			dw_soins.retrieve(var_code_local)
			// On se met sur le dernier soin sinon on reset
			if dw_soins.rowcount() > 0 then
				dw_soins.Scrolltorow(9999)
				dw_soins.setfocus()
			else
				dw_detail.reset()
			end if
	end if
end if
end event

type cb_bis from w_soins_maj`cb_bis within w_soins_lignes_auto_maj
integer x = 498
integer y = 2300
string iconname = "lc_copy.png"
end type

event cb_bis::clicked;// Répète la ligne de soins sur laquelle est le curseur en la décalant de la durée du soin

if dw_soins.rowcount() = 0 then
	son(5)
	MessageBox("ATTENTION !","Aucun soin n'a été saisi !")
else
		double lig_soin , cle_soin
		
		lig_soin = dw_soins.getrow()
		
		if lig_soin < 1 Then
			lig_soin = 1
		end if
		
		date demande, execution
		double scp_demande, hn, total, tp, cle_max
		double numero
		integer duree
		string v_type_soin, v_association, v_modificateurs
		string mode_decalage
		integer nombre_decalage
		
		cle_soin = dw_soins.getitemnumber(lig_soin,"cle")

		demande = dw_soins.getitemdate(lig_soin,"date_demande")
		hn = dw_soins.getitemnumber(lig_soin,"hn")
		total = dw_soins.getitemnumber(lig_soin,"total")
		scp_demande = dw_soins.getitemnumber(lig_soin,"scp_demande")
		tp = dw_soins.getitemnumber(lig_soin,"tp")
		numero = dw_soins.getitemnumber(lig_soin,"numero")
		v_type_soin = dw_soins.getitemstring(lig_soin,"code_soins_code")
		nombre_decalage = dw_soins.getitemnumber(lig_soin,"soins_auto_nombre_decalage")
		mode_decalage = dw_soins.getitemstring(lig_soin,"soins_auto_mode_decalage")
		

		v_association = dw_soins.getitemstring(lig_soin,"soins_auto_code_association")
		v_modificateurs = dw_soins.getitemstring(lig_soin,"soins_auto_modificateurs")

		
	  SELECT "code_soins"."duree"  
		 INTO :duree
		 FROM "code_soins"  
		WHERE "code_soins"."code" = :v_type_soin   ;
	

		// Decalage des dates
		demande = ajout_x_mois(demande, duree)
		execution = ajout_x_mois(execution, duree)

			
		// On recalcul le décalage .... en fonction du mode
		if mode_decalage = 'J' then
			 nombre_decalage = daysafter(date(1900,1,1),demande)
		else
			// Décalage en mois 
			nombre_decalage = nombre_decalage + duree
		end if
		

	
		// Ajout du soins pour le patient
	
		select max(cle) into :cle_max from "soins_auto" where code = :var_code_local ;
		cle_max = cle_max + 1
		numero = numero + 1
		

		 INSERT INTO "soins_auto"  
      ( "cle", 			"code",              "type",              "numero",              "date_demande",              "scp_demande",              "date_accord",              "scp_accord",              "hn",   
        "total",              "tp",              "date_cara",			"mode_decalage",			 "nombre_decalage" , "code_association" , "modificateurs")  
		 VALUES ( :cle_max,              :var_code_local,              :v_type_soin,              :numero,              :demande,              :scp_demande,              null,              null,              :hn,   
        :total,              :tp,              null,              :mode_decalage,		    :nombre_decalage, :v_association, :v_modificateurs)  ;	
			

		
		if sqlca.sqlcode <> 0 then 
			messagebox("ATTENTION", "Erreur dans l'ajout de la ligne de soin !~n~n" + sqlca.sqlerrtext) 
			rollback ;
		else
			// Ajout des lignes de soins_auto
			  INSERT INTO "ligne_soins_auto"  
	         ( "cle",              "code",              "date",              "montant",              "tp",              "origine_tp",			  "mode_decalage",			  "nombre_decalage")  
	     SELECT :cle_max,               "ligne_soins_auto"."code",               dateadd (month, :duree,"ligne_soins_auto"."date") ,               "ligne_soins_auto"."montant",   
	            "ligne_soins_auto"."tp",               "ligne_soins_auto"."origine_tp"  ,            "ligne_soins_auto"."mode_decalage" ,             "ligne_soins_auto"."nombre_decalage"  
	       FROM "ligne_soins_auto" 
			 WHERE code = :var_code_local and cle = :cle_soin ;
			
			commit;
		end if
		
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

type cb_ajouter from w_soins_maj`cb_ajouter within w_soins_lignes_auto_maj
integer x = 82
integer y = 2300
integer taborder = 140
string iconname = "ACTIONS_ajouter.png"
end type

event cb_ajouter::clicked;call super::clicked;gb_decalage.visible = true
rb_mois.visible = true 
rb_jour.visible = true
em_decalage.visible = true

st_association.visible = false
sle_association.visible = false


st_modificateurs.visible = false
sle_modificateurs.visible = false


end event

type cb_imprimer from w_soins_maj`cb_imprimer within w_soins_lignes_auto_maj
integer x = 1746
integer y = 2300
integer taborder = 170
string iconname = "ACTIONS_imprimer.png"
end type

event cb_imprimer::clicked;if dw_soins.rowcount() = 0 then
	son(5)
	MessageBox("ATTENTION !","Aucun soin n'a été saisi !")
else
	
	dw_edition.retrieve(var_code_local)
	print_ok = false
	dw_edition.print()
end if
end event

type cb_imprimer_euro from w_soins_maj`cb_imprimer_euro within w_soins_lignes_auto_maj
integer x = 2249
integer y = 1588
end type

type cb_dep from w_soins_maj`cb_dep within w_soins_lignes_auto_maj
boolean visible = false
integer x = 2089
boolean enabled = false
end type

type uo_size from w_soins_maj`uo_size within w_soins_lignes_auto_maj
integer x = 2949
integer taborder = 120
end type

type rte_1 from w_soins_maj`rte_1 within w_soins_lignes_auto_maj
integer x = 3401
integer y = 1676
end type

type cb_enregistrer_impr from w_soins_maj`cb_enregistrer_impr within w_soins_lignes_auto_maj
boolean visible = false
integer x = 3049
end type

type cb_annuler_impr from w_soins_maj`cb_annuler_impr within w_soins_lignes_auto_maj
boolean visible = false
integer x = 2665
end type

type dw_verso from w_soins_maj`dw_verso within w_soins_lignes_auto_maj
integer x = 1166
integer y = 452
end type

type dw_recto from w_soins_maj`dw_recto within w_soins_lignes_auto_maj
integer x = 73
integer y = 1272
end type

type cb_annuler_auto from w_soins_maj`cb_annuler_auto within w_soins_lignes_auto_maj
integer x = 1170
integer y = 1624
integer width = 567
integer taborder = 330
end type

event cb_annuler_auto::clicked;call super::clicked;dw_impression.visible = FALSE
cb_annuler_impr.visible = FALSE
cb_enregistrer_impr.visible = FALSE
end event

type dw_nom from w_soins_maj`dw_nom within w_soins_lignes_auto_maj
string tag = "no resizeall"
integer x = 59
integer y = 224
integer width = 1490
integer height = 84
integer taborder = 310
end type

event dw_nom::losefocus;string code
integer mn
string date_dem , renouvt,tp
integer v_duree
string v_code_association, v_nature, v_modificateurs

code = this.getItemString(this.getRow(),"code")


SELECT code INTO :type_soin FROM code_soins WHERE code = :code;


  SELECT "code_soins"."duree",           "code_soins"."date_dem",            "code_soins"."tp"  ,			"code_soins"."nb_lettre",			"code_soins"."depasse",
		"code_soins"."valeur"    , "code_association" , "nature", "modificateurs_defaut"
INTO :v_duree,            :date_dem,            :tp  ,			:nb_lettre,			:depasse,			:valeur    , :v_code_association, :v_nature, :v_modificateurs
FROM "code_soins"  
WHERE "code_soins"."code" = :code   ;

cb_enregistrer.enabled ( TRUE)

IF type_soin <> ancien_soin THEN
	reset_saisie ()
	IF v_duree > 0 THEN
		em_num.visible = true
		
		select max(numero) INTO :mn from soins_auto where code = :var_code_local and type = :code ;
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
	em_date_dem.text = '01/01/1900'
	IF date_dem = 'O' THEN
//		em_date_acc.visible = true
		em_scp_dem.visible = true
//		em_scp_acc.visible = true
	ELSE
//		em_date_acc.visible = false
		em_scp_dem.visible = false
//		em_scp_acc.visible = false
	END IF
	
	IF tp = 'O' THEN
		em_tp.visible = true 
	ELSE
		em_tp.visible = false		
	END IF	
	
	if v_nature = "C" then
		// Acte CCAM
		st_association.visible = true
		sle_association.visible = true
		sle_association.text = v_code_association
		
		st_modificateurs.visible = true
		sle_modificateurs.visible = true
		sle_modificateurs.text = v_code_association

		
	else
		st_association.visible = false
		sle_association.visible = false
		sle_association.text = ""
		
		st_modificateurs.visible = false
		sle_modificateurs.visible = false
		sle_modificateurs.text = ""
		
	end if
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

type cb_trait from w_soins_maj`cb_trait within w_soins_lignes_auto_maj
boolean visible = false
integer x = 2199
integer taborder = 190
boolean enabled = false
end type

type dw_auto from w_soins_maj`dw_auto within w_soins_lignes_auto_maj
integer x = 1509
end type

type st_auto1 from w_soins_maj`st_auto1 within w_soins_lignes_auto_maj
integer x = 905
fontcharset fontcharset = ansi!
end type

type st_auto2 from w_soins_maj`st_auto2 within w_soins_lignes_auto_maj
integer x = 498
fontcharset fontcharset = ansi!
end type

type em_deb from w_soins_maj`em_deb within w_soins_lignes_auto_maj
integer x = 1513
end type

type cb_ajouter_auto from w_soins_maj`cb_ajouter_auto within w_soins_lignes_auto_maj
integer x = 1783
integer width = 567
integer taborder = 320
end type

type cb_auto from w_soins_maj`cb_auto within w_soins_lignes_auto_maj
boolean visible = false
integer x = 1888
integer y = 2308
integer taborder = 180
boolean enabled = false
end type

type dw_detail from w_soins_maj`dw_detail within w_soins_lignes_auto_maj
string tag = "no resize brush centrer"
integer x = 745
integer y = 1064
integer width = 2254
integer height = 1184
integer taborder = 130
string title = "Echéances Financières"
string dataobject = "dw_detail_soin_auto"
end type

event dw_detail::doubleclicked;call super::doubleclicked;// Double clic -> Comme si on cliquait sur "MODIFIER"
if row > 0 then
	long rowsoin
	rowsoin = dw_soins.getrow()
	if rowsoin > 0 then
		dw_soins.SelectRow(0,False)
		dw_soins.SelectRow(rowsoin,True)
		dw_soins.setrow(rowsoin)
		cb_modifier.triggerevent(Clicked!)
		cb_enregistrer.triggerevent(Clicked!)
	end if
end if

end event

type ddlb_type_soins from w_soins_maj`ddlb_type_soins within w_soins_lignes_auto_maj
integer x = 229
integer taborder = 340
end type

event ddlb_type_soins::losefocus;CHOOSE CASE this.text
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

cb_enregistrer.enabled( true)


if type_soin <> ancien_soin then
// Le type de soins est différent du type initial

//	em_scp_dem.visible = true
//	em_scp_acc.visible = true
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
		em_date_dem.text = '01/01/1900'
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
		em_date_dem.text = '01/01/1900'
		em_date_dem.setfocus()
	CASE "S"
		// Semestre
		integer mn
		select max(numero) INTO :mn from soins_auto where code = :var_code_local and type = 'S' ;
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
		em_date_dem.text = '01/01/1900'
		em_num.setfocus()
	CASE "D"
		// Divers
		em_scp_dem.text = "5"
		em_date_dem.text = '01/01/1900'
		em_num.setfocus()
	CASE "C"
		// Contention	
		em_scp_dem.text = "75"
		em_date_dem.text = '01/01/1900'
		em_num.setfocus()
	CASE "H"
		// Hors Nomenclature
		em_date_dem.text = '01/01/1900'
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

type st_total from w_soins_maj`st_total within w_soins_lignes_auto_maj
integer x = 3095
fontcharset fontcharset = ansi!
end type

type st_tp from w_soins_maj`st_tp within w_soins_lignes_auto_maj
integer x = 2784
fontcharset fontcharset = ansi!
end type

type st_hn from w_soins_maj`st_hn within w_soins_lignes_auto_maj
integer x = 2386
fontcharset fontcharset = ansi!
end type

type st_num from w_soins_maj`st_num within w_soins_lignes_auto_maj
integer x = 1627
fontcharset fontcharset = ansi!
end type

type st_accord from w_soins_maj`st_accord within w_soins_lignes_auto_maj
integer x = 1883
fontcharset fontcharset = ansi!
end type

type st_demande from w_soins_maj`st_demande within w_soins_lignes_auto_maj
integer x = 1906
fontcharset fontcharset = ansi!
end type

type st_soin from w_soins_maj`st_soin within w_soins_lignes_auto_maj
integer x = 311
fontcharset fontcharset = ansi!
end type

type dw_edition from w_soins_maj`dw_edition within w_soins_lignes_auto_maj
integer x = 343
integer y = 1252
string dataobject = "dw_soins_auto_edition"
end type

type dw_montant from w_soins_maj`dw_montant within w_soins_lignes_auto_maj
string tag = "no resize brush"
integer x = 402
integer y = 612
integer width = 2199
integer height = 1400
string dataobject = "dw_saisie_montant_soin_auto"
end type

event dw_montant::itemchanged;call super::itemchanged;

// Selon la valeur de TP, on modifie la valeur par défaut de origine tp
// la valeur n'est pas encore modifiée => On teste la valeur inverse !!!!
//
// selon ce qu'on modifie, la valeur doit être tester à l'inverse


if dwo.name = "tp" then
	if data = "O" then
		if this.GetItemString(row,"Origine_TP") <> "C" and this.GetItemString(row,"Origine_TP") <> "M"  then
			this.SetItem(row,"Origine_TP", "C")
			
	
			if FRANCE and this.rowcount() = 1 then
				// On calcule le montant rembousable par la caisse 
				string v_lettre
				decimal{2} v_nb_lettre
				integer v_pourcent, v_duree
				double v_valeur
				date v_date_demande, v_date_echeance
				select upper(lettre), nb_lettre, valeur, isnull(duree,0) 
				into :v_lettre, :v_nb_lettre, :v_valeur, :v_duree
				from code_soins where code = :type_soin ;
				
				if (v_lettre = "TO" or v_lettre = "ORT") and (nb_lettre >= 50 or nb_lettre = 45) then
					v_pourcent = 100
				else
					if today() < date("2027-01-01") then
						v_pourcent = 60
					else
						v_pourcent = 50
					end if
				end if
				
				// On modifie le montant ...
				this.SetItem(row,"montant", (v_valeur * v_nb_lettre * v_pourcent) / 100 )
				
				if v_duree > 0 then
					// On décale l'écheance TP à la fin du soin
					v_date_demande = date(em_date_dem.text)
					v_date_echeance = ajout_x_mois(v_date_demande, v_duree)
					this.SetItem(row,"date", v_date_echeance)
				end if
				
				if  (v_valeur * v_nb_lettre * v_pourcent) / 100  < dec(em_total.text) then
					// On ajoute une ligne
					cb_ajouter_montant.postevent(clicked!)
				end if

				
			end if	
		
			
			
		end if
	else
		this.SetItem(row,"Origine_TP", " ")
	end if
else
	if dwo.name = "origine_tp" then 
		if this.GetItemString(row,"TP") = "O" then
			if data <> "C" and data <> "M"  then
				this.SetItem(row,"Origine_TP", "C")
			end if
		else
			this.SetItem(row,"Origine_TP", " ")
		end if
	end if
end if//
//
//// Selon la valeur de TP, on modifie la valeur par défaut de origine tp
//// la valeur n'est pas encore modifiée => On teste la valeur inverse !!!!
//
//// selon ce qu'on modifie, la valeur doit être tester à l'inverse
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
//
////// Selon la valeur de TP, on modifie la valeur par défaut de origine tp
////// la valeur n'est pas encore modifiée => On teste la valeur inverse !!!!
////if GetItemString(row, "tp") = "O" then
////	if GetItemString(row,"Origine_TP") <> "C" and GetItemString(row,"Origine_TP") <> "M"  then
////		this.SetItem(row,"Origine_TP", "C")
////	end if
////else
////	this.SetItem(row,"Origine_TP", " ")
////end if
end event

type em_total from w_soins_maj`em_total within w_soins_lignes_auto_maj
integer x = 3058
end type

type em_tp from w_soins_maj`em_tp within w_soins_lignes_auto_maj
integer x = 2802
end type

type em_hn from w_soins_maj`em_hn within w_soins_lignes_auto_maj
integer x = 2432
end type

type em_scp_acc from w_soins_maj`em_scp_acc within w_soins_lignes_auto_maj
integer x = 2089
integer width = 224
end type

type em_date_acc from w_soins_maj`em_date_acc within w_soins_lignes_auto_maj
integer x = 1746
end type

type em_scp_dem from w_soins_maj`em_scp_dem within w_soins_lignes_auto_maj
integer x = 1801
integer width = 224
end type

type em_date_dem from w_soins_maj`em_date_dem within w_soins_lignes_auto_maj
integer x = 2034
integer y = 204
end type

event losefocus;// On calcul le décalage de la date de demande
Calcul_decalage_soin()

end event

type dw_impression from w_soins_maj`dw_impression within w_soins_lignes_auto_maj
string tag = "brush"
boolean visible = false
integer x = 507
integer y = 1564
end type

type dw_soins from w_soins_maj`dw_soins within w_soins_lignes_auto_maj
string tag = "no resize brush centrer"
integer x = 178
integer y = 16
integer width = 3927
boolean titlebar = false
string dataobject = "dw_soins_auto"
boolean controlmenu = false
end type

event dw_soins::retrieveend;if this.rowcount() > 0 then
	dw_detail.retrieve(var_code_local,dw_soins.getitemnumber(dw_soins.getrow(),"cle"))
//	dw_impression.retrieve(dw_soins.getitemnumber(dw_soins.getrow(),"cle"),var_code_local)
else
	dw_detail.reset()
//	dw_impression.reset()
end if
end event

event dw_soins::rowfocuschanged;if this.rowcount() > 0 then
	dw_detail.retrieve(var_code_local,dw_soins.getitemnumber(dw_soins.getrow(),"cle"))
//	dw_impression.retrieve(dw_soins.getitemnumber(dw_soins.getrow(),"cle"),var_code_local)
else
	dw_detail.reset()
//	dw_impression.reset()
end if
If currentrow > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(currentrow,True)
End If

end event

event dw_soins::rbuttondown;// Pas de bouton droit dans les soins auto ....

end event

type em_num from w_soins_maj`em_num within w_soins_lignes_auto_maj
integer x = 1600
integer width = 151
alignment alignment = center!
string mask = "##.#"
end type

type infos_tp from w_soins_maj`infos_tp within w_soins_lignes_auto_maj
boolean visible = false
integer x = 261
end type

type cb_enregistrer from w_soins_maj`cb_enregistrer within w_soins_lignes_auto_maj
integer x = 1879
integer y = 2088
integer width = 567
integer taborder = 390
string iconname = "ACTIONS_enregistrer.png"
end type

event cb_enregistrer::clicked;call super::clicked;

// Echeances automatiques
echeance_auto_visible(true)

end event

type cb_annuler from w_soins_maj`cb_annuler within w_soins_lignes_auto_maj
integer x = 727
integer y = 2088
integer width = 567
integer taborder = 380
string iconname = "ACTIONS_abandonner.png"
end type

event cb_annuler::clicked;call super::clicked;dw_impression.visible = FALSE
cb_annuler_impr.visible = FALSE
cb_enregistrer_impr.visible = FALSE

echeance_auto_visible(false)
end event

type cb_enregistrer_montant from w_soins_maj`cb_enregistrer_montant within w_soins_lignes_auto_maj
integer x = 1303
integer y = 2088
integer width = 567
fontcharset fontcharset = ansi!
string iconname = "ACTIONS_enregistrer.png"
end type

event cb_enregistrer_montant::clicked;double cle_max
string var_type, var_association, var_modificateurs
double var_num
integer var_tp,i
date var_date_dem,var_date_acc
decimal {2} var_scp_dem,var_scp_acc,var_hn,var_tot

var_type = type_soin

if double(em_num.text) = 0 then
	setnull(var_num)
else
	var_num = double(em_num.text)
end if



if sle_association.visible then
	var_association = sle_association.text
else
	setnull(var_association)
end if


if sle_modificateurs.visible then
	var_modificateurs = sle_modificateurs.text
else
	setnull(var_modificateurs)
end if

if dec(em_scp_dem.text) = 0 then
	setnull(var_scp_dem)
else
	var_scp_dem = dec(em_scp_dem.text)
end if

if len(trim(em_date_acc.text)) = 0 or em_date_acc.text="00/00/0000" then
	setnull(var_date_acc)
else
	var_date_acc = date(em_date_acc.text)
end if

if len(trim(em_date_dem.text)) = 0 or em_date_dem.text = "00/00/0000" then
	setnull(var_date_dem)
else
	var_date_dem = date(em_date_dem.text)
end if

if dec(em_scp_acc.text) = 0 then
	setnull(var_scp_acc)
else
	var_scp_acc = dec(em_scp_acc.text)
end if

if dec(em_hn.text) = 0 then
	setnull(var_hn)
else
	var_hn = dec(em_hn.text)
end if

var_tot = dec(em_total.text)

if dec(em_tp.text) = 0 then
	setnull(var_tp)
else
	var_tp = integer(em_tp.text)
end if

// Pour mémoriser le décalage ...
double var_nombre_decalage
char var_mode_decalage

if rb_jour.checked then
	var_mode_decalage = 'J'
else
	var_mode_decalage = 'M'
end if

var_nombre_decalage = double(em_decalage.text)

CHOOSE CASE Action
	CASE "A"
	// Ajout de soins
		SELECT Max(cle) INTO :cle_max FROM soins_auto WHERE code = :var_code_local ;

		if isnull(cle_max) then
			cle_max = 1
		else
			cle_max = cle_max + 1
		end if

		cle_manip = cle_max
	

	  INSERT INTO "soins_auto"  
         ( "cle",  "code",  "type",  "numero",  "date_demande",  "scp_demande",   
           "date_accord",  "scp_accord",  "hn",  "total",  "tp", "mode_decalage", "nombre_decalage", "code_association", "modificateurs")  
 		 VALUES ( :cle_max,  :var_code_local,   :var_type,   :var_num,   :var_date_dem,   
           :var_scp_dem,   :var_date_acc,   :var_scp_acc,   :var_hn,   :var_tot,   
           :var_tp , :var_mode_decalage, :var_nombre_decalage , :var_association, :var_modificateurs)  ;


	CASE "M"
	// Modification de soins


		UPDATE "soins_auto"  SET
        		"type" = :var_type,  
			"numero" = :var_num,   
      	     "date_demande" = :var_date_dem,   
      	     "scp_demande"= :var_scp_dem,   
      	     "scp_accord" = :var_scp_acc,   
      	     "hn" = :var_hn,   
      	     "total" = :var_tot,   
      	     "tp" = :var_tp ,
			"code_association" = :var_association,
			"mode_decalage" = :var_mode_decalage,
			"nombre_decalage" = :var_nombre_decalage,
			"modificateurs" = :var_modificateurs
 		  WHERE cle = :cle_manip and code = :var_code_local ;


		if string(var_date_acc) <> "01/01/1900" then
			UPDATE "soins_auto"  SET  "date_accord" = :var_date_acc   
 			  WHERE cle = :cle_manip and code = :var_code_local ;
		end if


END CHOOSE

if SQLCA.SQLcode = -1 Then
// Problème dans le INSERT
		CHOOSE CASE SQLCA.SQLdbCode
		CASE -193
		// Problème de clé 
			Messagebox("ATTENTION !","Ce soin ne peut être temporairement mis à jour !~nRefaites une tentative ou abandonnez l'ajout !")
		CASE ELSE
			Messagebox("Erreur SQL",SQLCA.SQLErrText)
		END CHOOSE
else
	// Tout est ok !
	echeance_auto_visible(false)
	dw_montant.visible = false

	// Mise en place de la cle dans la DataWindow des échéances ...
	// Calcul du nom de décalage (en jour ou en mois)
	
	// Le décalage se calcule par rapport à var_date_dem
	
	date var_date_echeance
	char var_mode_decalage_ligne
	
	
	FOR i=1 TO dw_montant.rowcount()
		var_date_echeance = dw_montant.getitemdate(i,"date")
		var_mode_decalage_ligne = dw_montant.getitemstring(i,"mode_decalage")
		if isnull(var_mode_decalage_ligne) then
			var_mode_decalage_ligne = 'J'
			dw_montant.setitem(i,"mode_decalage",'J')
		end if
		
		if dw_montant.getitemstring(i,"mode_decalage") = 'J' then
			// Décalage en jours 
			dw_montant.setitem(i,"nombre_decalage",daysafter(var_date_dem,var_date_echeance))
		else
			// Décalage en mois
			dw_montant.setitem(i,"nombre_decalage", ( ((year(var_date_echeance) - 1900) * 12 + month(var_date_echeance) ) - ((year(var_date_dem) - 1900) * 12 + month(var_date_dem))) )
		end if
		dw_montant.setitem(i,"cle",cle_manip)
	NEXT
	
	if dw_montant.update() = 1 then
		commit ;
	else
		Rollback ;
	end if

	reset(dw_montant)
	ajlig(false)
	gb_decalage.visible = false 
	dw_impression.visible = FALSE
	cb_annuler_impr.visible = FALSE
	cb_enregistrer_impr.visible = FALSE	
	dw_soins.retrieve(var_code_local)
	st_association.visible = false
	sle_association.visible = false	// On se met sur le dernier soin sinon on reset
	
	st_modificateurs.visible = false
	sle_modificateurs.visible = false	
	
	rb_mois.visible = false
	rb_jour.visible = false
	gb_decalage.visible = false
	
	if dw_soins.rowcount() > 0 then
		dw_soins.Scrolltorow(9999)
		dw_soins.setfocus()
	else
		dw_detail.reset()
	end if


end if


end event

type cb_ajouter_montant from w_soins_maj`cb_ajouter_montant within w_soins_lignes_auto_maj
integer x = 151
integer y = 2060
integer width = 567
integer taborder = 350
end type

type cb_supprimer_montant from w_soins_maj`cb_supprimer_montant within w_soins_lignes_auto_maj
integer x = 151
integer y = 2160
integer width = 567
integer taborder = 360
end type

type gb_decalage from groupbox within w_soins_lignes_auto_maj
boolean visible = false
integer x = 425
integer y = 320
integer width = 1600
integer height = 260
integer taborder = 340
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
end type

type rb_jour from radiobutton within w_soins_lignes_auto_maj
boolean visible = false
integer x = 571
integer y = 368
integer width = 613
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Décalage en jour"
end type

event clicked;// On calcul le décalage de la date de demande
Calcul_decalage_soin()

end event

type rb_mois from radiobutton within w_soins_lignes_auto_maj
boolean visible = false
integer x = 571
integer y = 452
integer width = 558
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Décalage en mois"
boolean checked = true
end type

event clicked;// On calcul le décalage de la date de demande
Calcul_decalage_soin()

end event

type em_decalage from editmask within w_soins_lignes_auto_maj
boolean visible = false
integer x = 1193
integer y = 392
integer width = 402
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12632256
boolean enabled = false
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "#########0"
end type

type st_echeance_auto_acompte from statictext within w_soins_lignes_auto_maj
boolean visible = false
integer x = 2651
integer y = 744
integer width = 384
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Acompte"
end type

type em_echeance_auto_acompte from editmask within w_soins_lignes_auto_maj
boolean visible = false
integer x = 3086
integer y = 732
integer width = 402
integer height = 88
integer taborder = 350
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
string mask = "######0.00"
boolean spin = true
end type

type st_echeance_auto_periodicite from statictext within w_soins_lignes_auto_maj
boolean visible = false
integer x = 2651
integer y = 884
integer width = 384
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Périodicité "
end type

type pb_echeance_auto_generer from uo_picturebutton_250x120 within w_soins_lignes_auto_maj
boolean visible = false
integer x = 3191
integer y = 1568
integer width = 539
integer height = 144
integer taborder = 140
boolean bringtotop = true
string text = "&Générer"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;
decimal {2} v_acompte, v_mensualite, v_reste
integer v_nb_mensualites, v_cpt_mensualites
date v_date_depart
char periodicite , ajout_s
integer val_periodicite 

v_acompte = dec(em_echeance_auto_acompte.text)

v_nb_mensualites = integer(em_echeance_auto_mensualites.text)

v_reste = dec(em_total.text) - v_acompte

datawindow dw_modif


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
	
	
	if MessageBox("Demande de confirmation", "Vous allez générer : ~n~nUne première échéance de : "+string(v_acompte)+" €~nPériodicité : "+ string(val_periodicite) + " mois~n" + string(v_nb_mensualites) + " échéance"+ ajout_s + " de " + string(v_mensualite)+ " €~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then
		
		v_date_depart = date(em_echeance_auto_date_depart.text)
		
		// on va géréner ...
		
		// soins normaux
		dw_modif = dw_montant
		
		boolean v_suite = true
		long lig, ligtot
		
		ligtot = dw_modif.rowcount()
		
		if ligtot > 1 then
			
			if Messagebox("Demande de confirmation","Vous allez effacer les " + string(ligtot) + " échéances déjà saisies.~n~nConfirmez-vous ?",Question!,Yesno!,2) = 2 then
				v_suite = false
			end if
			
		end if
		
		if v_suite then
			
			// Effacement des lignes existantes
			for lig = ligtot to 1 step -1
				dw_modif.deleterow(lig)
			next
			
			// Ajout de l'acompte ...
			if v_acompte > 0 then
				dw_modif.insertrow(0)
				ligtot = dw_modif.rowcount() 
				dw_modif.setitem(ligtot,"code",var_code_local)
				dw_modif.setitem(ligtot,"date",v_date_depart)
				dw_modif.setitem(ligtot,"montant", v_acompte)
				dw_modif.setitem(ligtot,"origine_tp"," ")
				// Ajout des mensualités suivantes
				 v_cpt_mensualites = 1
				 v_nb_mensualites  = v_nb_mensualites + 1
			else
				// Ajout des mensualités
				 v_cpt_mensualites =0
			end if

			 
			do while v_cpt_mensualites < v_nb_mensualites and v_reste > 0
				
				dw_modif.insertrow(0)
				ligtot = dw_modif.rowcount() 
				dw_modif.setitem(ligtot,"code",var_code_local)
				dw_modif.setitem(ligtot,"date",ajout_x_mois(v_date_depart, v_cpt_mensualites * val_periodicite) )
				if ligtot = v_nb_mensualites then
					// dernière mensulaité, on met ce qu'il reste
					dw_modif.setitem(ligtot,"montant", v_reste)
				else
					dw_modif.setitem(ligtot,"montant", v_mensualite)
				end if
				dw_modif.setitem(ligtot,"origine_tp"," ")
				
				v_reste = v_reste - v_mensualite
				
				v_cpt_mensualites = v_cpt_mensualites + 1
						
			loop 
			
			
			cb_enregistrer_montant.enabled ( true)
			
		end if



		
		
	end if
	
end if
	
	
end event

type em_echeance_auto_date_depart from editmask within w_soins_lignes_auto_maj
boolean visible = false
integer x = 3081
integer y = 1152
integer width = 425
integer height = 88
integer taborder = 370
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

type st_echeance_auto_date_depart from statictext within w_soins_lignes_auto_maj
boolean visible = false
integer x = 2651
integer y = 1164
integer width = 402
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date de départ"
end type

type st_echeance_auto_mensualites from statictext within w_soins_lignes_auto_maj
boolean visible = false
integer x = 2651
integer y = 1024
integer width = 384
integer height = 68
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nb Périodes"
end type

type em_echeance_auto_mensualites from editmask within w_soins_lignes_auto_maj
boolean visible = false
integer x = 3081
integer y = 1012
integer width = 201
integer height = 88
integer taborder = 360
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

type ddlb_echeance_auto_periodicite from dropdownlistbox within w_soins_lignes_auto_maj
boolean visible = false
integer x = 3086
integer y = 876
integer width = 480
integer height = 400
integer taborder = 130
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

type sle_association from singlelineedit within w_soins_lignes_auto_maj
boolean visible = false
integer x = 3424
integer y = 208
integer width = 183
integer height = 96
integer taborder = 350
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

type st_association from statictext within w_soins_lignes_auto_maj
boolean visible = false
integer x = 3383
integer y = 112
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

type pb_calculatrice from uo_picturebutton_390x120 within w_soins_lignes_auto_maj
boolean visible = false
integer x = 2610
integer y = 1568
integer width = 539
integer taborder = 370
boolean bringtotop = true
string text = "Calculatrice"
string iconname = "ACTIONS_recalculer.png"
end type

event clicked;call super::clicked;open(w_calc)
end event

type st_modificateurs from statictext within w_soins_lignes_auto_maj
boolean visible = false
integer x = 3657
integer y = 112
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Modif."
alignment alignment = center!
end type

type sle_modificateurs from singlelineedit within w_soins_lignes_auto_maj
boolean visible = false
integer x = 3685
integer y = 208
integer width = 210
integer height = 96
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
integer limit = 4
borderstyle borderstyle = stylelowered!
end type

type gb_echeance_auto from groupbox within w_soins_lignes_auto_maj
boolean visible = false
integer x = 2583
integer y = 604
integer width = 1056
integer height = 904
integer taborder = 230
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Echéances automatiques"
end type

