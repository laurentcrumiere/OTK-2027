$PBExportHeader$w_soins_suivis.srw
forward
global type w_soins_suivis from w_param2
end type
type cb_dupliquer from uo_picturebutton_390x120 within w_soins_suivis
end type
end forward

global type w_soins_suivis from w_param2
string title = "Table des Soins Suivis en Statistique"
cb_dupliquer cb_dupliquer
end type
global w_soins_suivis w_soins_suivis

event open;call super::open;var_fille = "w_soins_suivis_fiche"


// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[31]
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

// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if

end event

on w_soins_suivis.create
int iCurrent
call super::create
this.cb_dupliquer=create cb_dupliquer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_dupliquer
end on

on w_soins_suivis.destroy
call super::destroy
destroy(this.cb_dupliquer)
end on

type p_fond from w_param2`p_fond within w_soins_suivis
end type

type pb_raz_ordre_trie from w_param2`pb_raz_ordre_trie within w_soins_suivis
boolean visible = true
end type

type cb_annuler from w_param2`cb_annuler within w_soins_suivis
end type

type cb_enregistrer from w_param2`cb_enregistrer within w_soins_suivis
end type

event cb_enregistrer::clicked;call super::clicked;

// POur éviter les merdes derrières, on élimine les code nul de la datawindows
// lignes ajoutées ...


long lig, tot
string v_nom
double v_code

tot = dw_liste.rowcount()

for lig = 1 to tot
	
	if isnull(dw_liste.getitemnumber(lig,"code")) then
		// recherche du code généré en BD
		v_nom = dw_liste.getitemstring(lig,"nom")
		select code into :v_code from soins_suivis where nom = :v_nom ;
		dw_liste.setitem(lig,"code",v_code)
	end if
next
end event

type cb_ajouter from w_param2`cb_ajouter within w_soins_suivis
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn("nom")
dw_liste.SetFocus()


end event

type cb_modifier from w_param2`cb_modifier within w_soins_suivis
end type

event cb_modifier::clicked;if dw_liste.getrow() > 0 then
	OpenWithParm(W_fille,dw_liste.getitemNumber(dw_liste.getrow(),"code"),var_fille)
	dw_liste.retrieve('%')
end if

end event

type cb_supprimer from w_param2`cb_supprimer within w_soins_suivis
end type

type cb_1 from w_param2`cb_1 within w_soins_suivis
boolean visible = false
end type

type cb_chercher from w_param2`cb_chercher within w_soins_suivis
end type

type cb_exporter from w_param2`cb_exporter within w_soins_suivis
end type

type cb_fermer from w_param2`cb_fermer within w_soins_suivis
end type

type dw_liste from w_param2`dw_liste within w_soins_suivis
string tag = "no resize centrer brush"
integer x = 901
integer y = 24
integer width = 2277
integer height = 1752
string dataobject = "dw_soins_suivis_liste"
end type

event dw_liste::doubleclicked;if ROW > 0 then
	if isnull(getitemNumber(row,"code")) then // le code est null, c'est pas un ajout => faut faire un retrieve et se repositionner
		string v_nom
		long lig
		v_nom = getitemString(row,"nom")
		dw_liste.retrieve('%')
		// recherche de l'info 
		lig = 	dw_liste.Find("nom = '"+v_nom+"'",0,99999)
		if lig > 0 then
			OpenWithParm(W_fille,getitemNumber(lig,"code"),var_fille)
		else
			Messagebox("ATTENTION","Problème dans la mise à jour des données.~n~nNous vous conseillons de fermer puis de rouvrir cette fenêtre !")
		end if
	else
		OpenWithParm(W_fille,getitemNumber(row,"code"),var_fille)
	end if
	dw_liste.retrieve('%')
end if

end event

type uo_1 from w_param2`uo_1 within w_soins_suivis
end type

type dw_liste_edition from w_param2`dw_liste_edition within w_soins_suivis
string dataobject = "dw_soins_liste_edition"
end type

type cbx_avec_les_inactifs from w_param2`cbx_avec_les_inactifs within w_soins_suivis
integer x = 1989
integer width = 599
end type

type gb_filtre from w_param2`gb_filtre within w_soins_suivis
integer x = 1938
end type

type cb_dupliquer from uo_picturebutton_390x120 within w_soins_suivis
integer x = 485
integer y = 2016
integer width = 448
integer height = 148
integer taborder = 40
boolean bringtotop = true
string text = "Dupliquer"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	
	dw_liste.accepttext()
	if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
		MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVous devez les enregistrer avant de poursuivre.")
	else
		double code_soin_depart, code_soin_arrivee
		string nom_soin_depart,nom_soin_arrivee
		
		nom_soin_depart = dw_liste.getitemstring(dw_liste.getrow(),"nom")
		code_soin_depart = dw_liste.getitemnumber(dw_liste.getrow(),"code")
	
		nom_soin_arrivee = left("Copie de "+nom_soin_depart,40)
	
		if MessageBox("DEMANDE DE CONFIRMATION","Vous allez dupliquer les lignes du soin automatique '"+ nom_soin_depart+"' vers le soin '"+nom_soin_arrivee+"'~n~nConfirmez-vous ?",question!,YesNo!,2) = 1 then
			// Ok pour la duplication
			
			
			// Récupération du code du soin d'arrivée ..
			SELECT max(code) INTO :code_soin_arrivee FROM "soins_suivis" ;
			
			if isnull(code_soin_arrivee)  then
				// Théoriquement impossible mais ...
				code_soin_arrivee = 1
			else
				code_soin_arrivee = code_soin_arrivee + 1
			end if
		
			// Ajout du titre ....
			
			INSERT INTO "soins_suivis" ("code","nom", "actif","ordre_trie")
			VALUES (:code_soin_arrivee, :nom_soin_arrivee, 1, 100) ;
			
			if sqlca.sqlcode = 0 then
				
				  INSERT INTO "soins_suivis_detail"  	 ( "code_soins_suivis",      "code_soins",     "numero_min",     "numero_max" )  
				  SELECT :code_soin_arrivee,    "code_soins",     "numero_min",     "numero_max" 
					 FROM "soins_suivis_detail"  
					WHERE "soins_suivis_detail"."code_soins_suivis" = :code_soin_depart    ;

				if sqlca.sqlcode = 0 then
					commit ;
					dw_liste.retrieve()
					messagebox("INFORMATION","La duplication a été réalisée avec succès")
					
				else
					MessageBox("ERREUR DANS L'AJOUT DES LIGNES",sqlca.sqlerrtext)
					rollback ;
				end if
			else
				MessageBox("ERREUR DANS L'AJOUT DU TITRE",sqlca.sqlerrtext)
				rollback ;
			end if

			
		end if
	end if
end if
end event

