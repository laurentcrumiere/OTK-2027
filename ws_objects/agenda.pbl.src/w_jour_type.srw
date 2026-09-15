$PBExportHeader$w_jour_type.srw
forward
global type w_jour_type from w_param
end type
type cb_modifier from uo_picturebutton_390x120 within w_jour_type
end type
type cb_dupliquer from uo_picturebutton_390x120 within w_jour_type
end type
end forward

global type w_jour_type from w_param
string title = "Définition des Journées Types"
cb_modifier cb_modifier
cb_dupliquer cb_dupliquer
end type
global w_jour_type w_jour_type

on w_jour_type.create
int iCurrent
call super::create
this.cb_modifier=create cb_modifier
this.cb_dupliquer=create cb_dupliquer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_modifier
this.Control[iCurrent+2]=this.cb_dupliquer
end on

on w_jour_type.destroy
call super::destroy
destroy(this.cb_modifier)
destroy(this.cb_dupliquer)
end on

type p_fond from w_param`p_fond within w_jour_type
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_jour_type
integer x = 119
integer y = 1052
end type

type cb_annuler from w_param`cb_annuler within w_jour_type
integer x = 2729
integer y = 1992
integer width = 411
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_jour_type
integer x = 3168
integer y = 1992
integer width = 411
integer height = 152
end type

type cb_fermer from w_param`cb_fermer within w_jour_type
integer x = 3607
integer y = 1992
integer width = 411
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_jour_type
integer x = 526
integer y = 1992
integer width = 411
integer height = 152
integer taborder = 40
end type

type cb_ajouter from w_param`cb_ajouter within w_jour_type
integer x = 87
integer y = 1992
integer width = 411
integer height = 152
integer taborder = 30
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_jour_type
integer x = 270
integer width = 3529
integer height = 1904
string dataobject = "dw_liste_jour_type"
end type

event dw_liste::doubleclicked;call super::doubleclicked;//Appel du bouton modifier
if ROW > 0 then
	cb_modifier.TriggerEvent(Clicked!)
end if
end event

type uo_1 from w_param`uo_1 within w_jour_type
integer taborder = 20
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_jour_type
integer x = 2016
integer y = 2040
end type

type gb_filtre from w_param`gb_filtre within w_jour_type
integer x = 1902
integer y = 1976
end type

type cb_modifier from uo_picturebutton_390x120 within w_jour_type
integer x = 965
integer y = 1992
integer width = 411
integer height = 152
integer taborder = 60
boolean bringtotop = true
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;//Declaration des variables globales
//---------------------------
double jour_type

if dw_liste.rowcount() > 0 then
	
	//Recup du code du jour type dans la datawindows
	//--------------------------------------------
	jour_type=dw_liste.getitemnumber(dw_liste.getrow(),"code")
	
	if enregistrement_automatique and cb_enregistrer.enabled then
		cb_enregistrer.triggerevent(clicked!)
	end if
	
	if isnull(jour_type) then
		// on vient de créer la jour et de l'enregistrer
		string v_lib
		v_lib = dw_liste.getitemString(dw_liste.getrow(),"nom_jour")
		
		select max(code) into :jour_type from "jour_type" where nom_jour = :v_lib ;
	end if
	
	if not isnull(jour_type) then 
		//Ouvre la fenetre w_agenda_jour_type, avec le code du jour choisi comme parametre
		//---------------------------------------------------------------------------
		str_param_string param_passe  
		param_passe.param = string(jour_type)
		string nom_jour
			
		//Changement du titre de la fenetre
		//---------------------------
		SELECT	isnull(nom_jour, '')
		INTO		:nom_jour
		FROM	 jour_type
		WHERE	code=:jour_type;

		w_mdi_2020.uo_powerdock.of_openDocument(w_agenda_jour_type, param_passe, "Journée Type : " + nom_jour, m_orthokis_2020.m_patients.m_agendagraphique.toolbarItemName)
	end if
end if
end event

type cb_dupliquer from uo_picturebutton_390x120 within w_jour_type
integer x = 1403
integer y = 1992
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
	
		double code_jour_depart, code_jour_arrivee
		string nom_jour_depart,nom_jour_arrivee
		
		nom_jour_depart = dw_liste.getitemstring(dw_liste.getrow(),"nom_jour")
		code_jour_depart = dw_liste.getitemnumber(dw_liste.getrow(),"code")
	
		nom_jour_arrivee = left("Copie de "+nom_jour_depart,40)
	
		if MessageBox("DEMANDE DE CONFIRMATION","Vous allez dupliquer la journée type '"+ nom_jour_depart+"' vers la journée type '"+nom_jour_arrivee+"'~n~nConfirmez-vous ?",question!,YesNo!,2) = 1 then
			// Ok pour la duplication
		
			// Récupération du code du soin d'arrivée ..
			SELECT max(code) INTO :code_jour_arrivee FROM "jour_type" ;
			
			if isnull(code_jour_arrivee)  then
				// Théoriquement impossible mais ...
				code_jour_arrivee = 1
			else
				code_jour_arrivee = code_jour_arrivee + 1
			end if
		
			// Ajout du titre ....
			
			INSERT INTO "jour_type" ("code","nom_jour","commentaire",  "actif", "ordre_trie" )
			VALUES (:code_jour_arrivee, :nom_jour_arrivee, ' ' ,  1 , 100 ) ;
			
			if sqlca.sqlcode = 0 then
			
				// Ajout du la jour  ...
				
			  INSERT INTO "rdv_jour_type"  
        				 ( "code_jour",      "debut_rdv",     "fin_rdv",     "famille_rdv",     "numero_fauteuil" )  
			  SELECT :code_jour_arrivee,  "debut_rdv",	"fin_rdv",     "famille_rdv",     "numero_fauteuil" 
				 FROM "rdv_jour_type"  
				WHERE "rdv_jour_type"."code_jour" = :code_jour_depart    ;

				if sqlca.sqlcode = 0 then
					
					// Duplication complète
					Commit ;
					dw_liste.retrieve()
					MessageBox("DUPLICATION","La duplication a réussie.")
				else
					MessageBox("ERREUR DANS L'AJOUT DES JOURNEES TYPES",sqlca.sqlerrtext)
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

