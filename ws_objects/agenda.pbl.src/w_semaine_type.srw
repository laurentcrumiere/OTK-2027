$PBExportHeader$w_semaine_type.srw
forward
global type w_semaine_type from w_param
end type
type cb_modifier from uo_picturebutton_390x120 within w_semaine_type
end type
type cb_dupliquer from uo_picturebutton_390x120 within w_semaine_type
end type
end forward

global type w_semaine_type from w_param
string title = "Définition des Semaines Types"
cb_modifier cb_modifier
cb_dupliquer cb_dupliquer
end type
global w_semaine_type w_semaine_type

type variables


// pour positionnement de la palette de couleur
integer ii_palette_x = 0
integer ii_palette_y = 0
end variables

on w_semaine_type.create
int iCurrent
call super::create
this.cb_modifier=create cb_modifier
this.cb_dupliquer=create cb_dupliquer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_modifier
this.Control[iCurrent+2]=this.cb_dupliquer
end on

on w_semaine_type.destroy
call super::destroy
destroy(this.cb_modifier)
destroy(this.cb_dupliquer)
end on

event open;call super::open;

// Script à supprimer EN TOTALITE à la mise en prod de la V2027 car le script ancestor est OK

dw_liste.settransobject(SQLCA)
dw_liste.retrieve()

// pour éliminer de base les inactifs .. mais que pour les tables concernées
if cbx_avec_les_inactifs.visible  then
	dw_liste.setfilter("actif = 1")
	dw_liste.filter()
end if

end event

event timer;call super::timer;Timer(0)
fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)



end event

type p_fond from w_param`p_fond within w_semaine_type
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_semaine_type
integer x = 119
integer y = 1052
end type

type cb_annuler from w_param`cb_annuler within w_semaine_type
integer x = 2734
integer y = 1992
integer width = 457
integer height = 152
end type

type cb_enregistrer from w_param`cb_enregistrer within w_semaine_type
integer x = 3200
integer y = 1992
integer width = 457
integer height = 152
end type

type cb_fermer from w_param`cb_fermer within w_semaine_type
integer x = 3666
integer y = 1992
integer width = 457
integer height = 152
end type

type cb_supprimer from w_param`cb_supprimer within w_semaine_type
integer x = 535
integer y = 1992
integer height = 152
integer taborder = 40
end type

type cb_ajouter from w_param`cb_ajouter within w_semaine_type
integer x = 78
integer y = 1992
integer height = 152
integer taborder = 30
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn("nom_semaine")
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_semaine_type
integer x = 0
integer width = 4219
integer height = 1904
string dataobject = "dw_liste_semaine"
end type

event dw_liste::doubleclicked;call super::doubleclicked;//Appel du bouton modifier
if ROW > 0 then
	cb_modifier.TriggerEvent(Clicked!)
end if
end event

event dw_liste::rbuttondown;//Declaration des variables locales
//--------------------------
long couleur_choisie

choose case getcolumnName()
	case "couleur"
		
		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = xpos
		ii_palette_y = ypos
		
		Timer(0.05)	// pour déclencher le repositionnement de la palette
		
		//Appel de la fenetre couleur et au retour, met la couleur de fond
		//--------------------------------------------------
		if appel_palette(couleur_choisie) then
				this.setitem(row,"couleur",couleur_choisie)
				// On bouge le focus pour appliquer la couleur dans la zone
				this.setcolumn(1)
				this.setcolumn("couleur")
				this.accepttext()
				if enregistrement_automatique and cb_enregistrer.enabled then
					cb_enregistrer.triggerevent(clicked!)
				end if
		end if
	case "couleur_post_it"
			//Appel de la fenetre couleur et au retour, met la couleur de fond
		//--------------------------------------------------
		
		// Les positions seront utilisées dans le timer de la fenêtre	
		ii_palette_x = xpos
		ii_palette_y = ypos
		
		Timer(0.05)	// pour déclencher le repositionnement de la palette
			
		
		if appel_palette(couleur_choisie) then
			
			this.setitem(row,"couleur_post_it",couleur_choisie)
			// On bouge le focus pour appliquer la couleur dans la zone
			this.setcolumn(1)
			this.setcolumn("couleur_post_it")
			this.accepttext()
			if enregistrement_automatique and cb_enregistrer.enabled then
				cb_enregistrer.triggerevent(clicked!)
			end if
		end if
end choose
end event

type uo_1 from w_param`uo_1 within w_semaine_type
integer taborder = 20
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_semaine_type
integer x = 2048
integer y = 2040
end type

type gb_filtre from w_param`gb_filtre within w_semaine_type
integer x = 1934
integer y = 1976
end type

type cb_modifier from uo_picturebutton_390x120 within w_semaine_type
integer x = 992
integer y = 1992
integer width = 457
integer height = 152
integer taborder = 60
boolean bringtotop = true
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;//Declaration des variables globales
//---------------------------
double semaine_type

if dw_liste.rowcount() > 0 then
	
	//Recup du code de la semaine type dans la datawindows
	//--------------------------------------------
	semaine_type=dw_liste.getitemnumber(dw_liste.getrow(),"code")
	
	if enregistrement_automatique and cb_enregistrer.enabled then
		cb_enregistrer.triggerevent(clicked!)
	end if
	
	if isnull(semaine_type) then
		// on vient de créer la semaine et de l'enregistrer
		string v_lib
		v_lib = dw_liste.getitemString(dw_liste.getrow(),"nom_semaine")
		
		select max(code) into :semaine_type from "semaine_type" where nom_semaine = :v_lib ;
	end if
	
	if not isnull(semaine_type) then 
		
		// Y a t i l des familles de rdv ?
		long v_cpt = 0
		select isnull(count(*),0) into :v_cpt from famille_rdv where  actif = 1 ; 
		
		if v_cpt = 0 then
			MessageBox("ATTENTION ","Vous devez d'abord définir des familles de rendez-vous avant de définir des semaines types !")
		else

			
			//Ouvre la fenetre w_agenda_semaine_type, avec le code de la semaine choisi comme parametre
			//---------------------------------------------------------------------------
			str_param_string param_passe  
			param_passe.param = string(semaine_type)
			w_mdi_2020.uo_powerdock.of_openDocument(w_agenda_semaine_type, param_passe, "Semaine Type", m_orthokis_2020.m_patients.m_agendagraphique.toolbarItemName)
		end if
	end if
end if
end event

type cb_dupliquer from uo_picturebutton_390x120 within w_semaine_type
integer x = 1449
integer y = 1992
integer width = 457
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
	
		double code_semaine_depart, code_semaine_arrivee
		string nom_semaine_depart,nom_semaine_arrivee
		
		nom_semaine_depart = dw_liste.getitemstring(dw_liste.getrow(),"nom_semaine")
		code_semaine_depart = dw_liste.getitemnumber(dw_liste.getrow(),"code")
	
		nom_semaine_arrivee = left("Copie de "+nom_semaine_depart,40)
	
		if MessageBox("DEMANDE DE CONFIRMATION","Vous allez dupliquer la semaine type '"+ nom_semaine_depart+"' vers la semaine type '"+nom_semaine_arrivee+"'~n~nConfirmez-vous ?",question!,YesNo!,2) = 1 then
			// Ok pour la duplication
		
			// Récupération du code du soin d'arrivée ..
			SELECT max(code) INTO :code_semaine_arrivee FROM "semaine_type" ;
			
			if isnull(code_semaine_arrivee)  then
				// Théoriquement impossible mais ...
				code_semaine_arrivee = 1
			else
				code_semaine_arrivee = code_semaine_arrivee + 1
			end if
		
			// Ajout du titre ....
			double v_couleur 
		  SELECT couleur into :v_couleur 	 FROM "semaine_type"  WHERE "semaine_type"."code" = :code_semaine_depart    ;

		if isnull(v_couleur) then 
			v_couleur = couleur_blanche
		end if
		
		
		INSERT INTO "semaine_type" ("code","nom_semaine","commentaire",  "actif", "ordre_trie", "couleur" )
			VALUES (:code_semaine_arrivee, :nom_semaine_arrivee, ' ' ,  1 , 100, :v_couleur  ) ;
			
			if sqlca.sqlcode = 0 then
			
				// Ajout de la semaine  ...
				
			  INSERT INTO "rdv_semaine_type"  
        				 ( "numero_semaine",      "debut_rdv",     "fin_rdv",     "famille_rdv",     "numero_fauteuil",     "jour_semaine" )  
			  SELECT :code_semaine_arrivee,  "debut_rdv",	"fin_rdv",     "famille_rdv",     "numero_fauteuil",     "jour_semaine" 
				 FROM "rdv_semaine_type"  
				WHERE "rdv_semaine_type"."numero_semaine" = :code_semaine_depart    ;

				if sqlca.sqlcode = 0 then
					
							// Duplication complète
							Commit ;
							dw_liste.retrieve()
							MessageBox("DUPLICATION","La duplication a réussie.")
					else
							MessageBox("ERREUR DANS L'AJOUT DES SEMAINES TYPES",sqlca.sqlerrtext)
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

