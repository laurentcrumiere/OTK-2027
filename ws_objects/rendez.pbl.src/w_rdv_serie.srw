$PBExportHeader$w_rdv_serie.srw
forward
global type w_rdv_serie from w_param
end type
type cb_modifier from uo_picturebutton_390x120 within w_rdv_serie
end type
type cb_dupliquer from uo_picturebutton_390x120 within w_rdv_serie
end type
end forward

global type w_rdv_serie from w_param
string title = "Définition des Séries de Rendez-vous"
cb_modifier cb_modifier
cb_dupliquer cb_dupliquer
end type
global w_rdv_serie w_rdv_serie

on w_rdv_serie.create
int iCurrent
call super::create
this.cb_modifier=create cb_modifier
this.cb_dupliquer=create cb_dupliquer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_modifier
this.Control[iCurrent+2]=this.cb_dupliquer
end on

on w_rdv_serie.destroy
call super::destroy
destroy(this.cb_modifier)
destroy(this.cb_dupliquer)
end on

type p_fond from w_param`p_fond within w_rdv_serie
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_rdv_serie
integer x = 160
integer y = 2000
integer height = 152
end type

type cb_annuler from w_param`cb_annuler within w_rdv_serie
integer x = 2766
integer y = 2000
integer width = 411
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_rdv_serie
integer x = 3200
integer y = 2000
integer width = 411
integer height = 152
end type

type cb_fermer from w_param`cb_fermer within w_rdv_serie
integer x = 3634
integer y = 2000
integer width = 411
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_rdv_serie
integer x = 1175
integer y = 2000
integer width = 411
integer height = 152
integer taborder = 40
end type

type cb_ajouter from w_param`cb_ajouter within w_rdv_serie
integer x = 741
integer y = 2000
integer width = 411
integer height = 152
integer taborder = 30
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_rdv_serie
integer x = 206
integer width = 3918
integer height = 1940
string dataobject = "dw_rdv_serie_liste"
end type

event dw_liste::doubleclicked;call super::doubleclicked;//Appel du bouton modifier
if ROW > 0 then
	cb_modifier.TriggerEvent(Clicked!)
end if
end event

type uo_1 from w_param`uo_1 within w_rdv_serie
integer taborder = 20
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_rdv_serie
boolean visible = false
integer x = 229
integer y = 1776
end type

type gb_filtre from w_param`gb_filtre within w_rdv_serie
boolean visible = false
integer x = 114
integer y = 1704
end type

type cb_modifier from uo_picturebutton_390x120 within w_rdv_serie
integer x = 1609
integer y = 2000
integer width = 411
integer height = 152
integer taborder = 60
boolean bringtotop = true
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;//Declaration des variables globales
//---------------------------
double v_rdv_serie

if dw_liste.rowcount() > 0 then
	
	//Recup du code de la serie dans la datawindows
	//--------------------------------------------
	v_rdv_serie=dw_liste.getitemnumber(dw_liste.getrow(),"code")
	
	if enregistrement_automatique and cb_enregistrer.enabled then
		cb_enregistrer.triggerevent(clicked!)
	end if
	
	if isnull(v_rdv_serie) then
		// on vient de créer la semaine et de l'enregistrer
		string v_lib
		v_lib = dw_liste.getitemString(dw_liste.getrow(),"libelle")
		
		select max(code) into :v_rdv_serie from "rdv_serie" where libelle = :v_lib ;
	end if
	
	if not isnull(v_rdv_serie) then 
		//Ouvre la fenetre de MAJ de la série avec le code de la série choisi comme parametre
		//---------------------------------------------------------------------------
		str_param_string param_passe  
		param_passe.param = string(v_rdv_serie)
		w_mdi_2020.uo_powerdock.of_openDocument(w_rdv_serie_detail, param_passe, "Série de Rendez-vouss", m_orthokis_2020.m_tables.m_tables_rendezvous.toolbarItemName)
	end if
end if
end event

type cb_dupliquer from uo_picturebutton_390x120 within w_rdv_serie
integer x = 2043
integer y = 2000
integer width = 411
integer height = 152
integer taborder = 60
boolean bringtotop = true
string text = "&Dupliquer"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	
	dw_liste.accepttext()
	if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
		MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVous devez les enregistrer avant de poursuivre.")
	else
	
		double code_serie_depart, code_serie_arrivee
		string nom_serie_depart,nom_serie_arrivee
		
		nom_serie_depart = dw_liste.getitemstring(dw_liste.getrow(),"libelle")
		code_serie_depart = dw_liste.getitemnumber(dw_liste.getrow(),"code")
	
		nom_serie_arrivee = left("Copie de "+nom_serie_depart,40)
	
		if MessageBox("DEMANDE DE CONFIRMATION","Vous allez dupliquer la série '"+ nom_serie_depart+"' vers la série '"+nom_serie_arrivee+"'~n~nConfirmez-vous ?",question!,YesNo!,2) = 1 then
			// Ok pour la duplication
		
			// Récupération du code du soin d'arrivée ..
			SELECT max(code) INTO :code_serie_arrivee FROM "rdv_serie" ;
			
			if isnull(code_serie_arrivee)  then
				// Théoriquement impossible mais ...
				code_serie_arrivee = 1
			else
				code_serie_arrivee = code_serie_arrivee + 1
			end if
		
			// Ajout du titre ....
			
			INSERT INTO "rdv_serie" ("code","libelle","commentaire", "ordre_trie")
			VALUES (:code_serie_arrivee, :nom_serie_arrivee, ' ', 100) ;
			
			if sqlca.sqlcode = 0 then
			
				// Ajout de la serie  ...
				
			  INSERT INTO "rdv_serie_detail"  
        				 ( "code_serie",      "type_rdv",     "type_delai",     "nb_delai",     "unite_delai", "ordre" )  
			  SELECT :code_serie_arrivee,  "type_rdv",     "type_delai",     "nb_delai",     "unite_delai", "ordre"  
				 FROM "rdv_serie_detail"  
				WHERE "rdv_serie_detail"."code_serie" = :code_serie_depart    ;

				if sqlca.sqlcode = 0 then
					
							// Duplication complète
							Commit ;
							dw_liste.retrieve()
							MessageBox("DUPLICATION","La duplication a réussie.")
					else
							MessageBox("ERREUR DANS L'AJOUT DES RENDEZ-VOUS",sqlca.sqlerrtext)
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

