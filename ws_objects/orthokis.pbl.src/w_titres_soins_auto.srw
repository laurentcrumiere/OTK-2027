$PBExportHeader$w_titres_soins_auto.srw
forward
global type w_titres_soins_auto from w_param
end type
type cb_lignes from uo_picturebutton_390x120 within w_titres_soins_auto
end type
type cb_dupliquer from uo_picturebutton_390x120 within w_titres_soins_auto
end type
type uo_filtre from u_cst_togglebutton within w_titres_soins_auto
end type
end forward

global type w_titres_soins_auto from w_param
integer width = 3854
integer height = 2300
string title = "Table des Soins Automatiques"
windowtype windowtype = main!
cb_lignes cb_lignes
cb_dupliquer cb_dupliquer
uo_filtre uo_filtre
end type
global w_titres_soins_auto w_titres_soins_auto

type variables
double vcle
long ligne_courante // utile pour le lien avec la fenêtre des lignes
n_cst_PowerFilter iu_PowerFilter

// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0

end variables

on w_titres_soins_auto.create
int iCurrent
call super::create
this.cb_lignes=create cb_lignes
this.cb_dupliquer=create cb_dupliquer
this.uo_filtre=create uo_filtre
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_lignes
this.Control[iCurrent+2]=this.cb_dupliquer
this.Control[iCurrent+3]=this.uo_filtre
end on

on w_titres_soins_auto.destroy
call super::destroy
destroy(this.cb_lignes)
destroy(this.cb_dupliquer)
destroy(this.uo_filtre)
end on

event open;call super::open;//
////*************************************************************
//
//// pour libération de la V2025, supprimer tout le code entre //**// car dans le script ancestor
//uo_1.taille(this)
//
//dw_liste.dataobject = "dw_titres_soins_auto_liste"
//
//colore_datawindow(dw_liste)
//
//dw_liste.settransobject(SQLCA)
//dw_liste.retrieve()
//
//// pour éliminer de base les inactifs .. mais que pour les tables concernées
//if cbx_avec_les_inactifs.visible  then
//	dw_liste.setfilter("actif = 1")
//	dw_liste.filter()
//end if
//
//
////**************************************************************************
//

select max(code) INTO :vcle from titres_soins_auto ;

if isnull(vcle) then
	vcle = 0
end if


uo_filtre.backcolor = this.backcolor

dw_liste.setfilter("actif = 1")
dw_liste.filter()

end event

event timer;call super::timer;if version_ce_logiciel >= "36.90" then
	Timer(0)
	fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)
end if

end event

type p_fond from w_param`p_fond within w_titres_soins_auto
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_titres_soins_auto
boolean visible = true
integer x = 14
integer y = 1864
integer height = 144
end type

type cb_annuler from w_param`cb_annuler within w_titres_soins_auto
integer x = 2528
integer y = 2016
integer width = 425
integer height = 144
end type

type cb_enregistrer from w_param`cb_enregistrer within w_titres_soins_auto
integer x = 2953
integer y = 2016
integer width = 425
integer height = 144
end type

type cb_fermer from w_param`cb_fermer within w_titres_soins_auto
integer x = 3378
integer y = 2016
integer width = 425
integer height = 144
end type

type cb_supprimer from w_param`cb_supprimer within w_titres_soins_auto
integer x = 439
integer y = 2012
integer width = 425
integer height = 144
end type

event cb_supprimer::clicked;

// On force la suppression des lignes 
if dw_liste.rowcount() > 0 then
	if Messagebox("ATTENTION !","Soin : "+dw_liste.getitemstring(dw_liste.getrow(),"nom")+"~n~nVous allez supprimer défiintivement cet ensemble de lignes de soins ?~n~nConfirmez-vous ?",question!,yesno!,2) = 1 then
		long v_code
		v_code = dw_liste.getitemnumber(dw_liste.getrow(),"code")
	
		delete from ligne_soins_auto where code = :v_code ;
		commit ;
		if sqlca.sqlcode <> 0 then
			Messagebox("ERREUR","Problème dans la suppression des lignes de soins (échéances).~n~n"+sqlca.sqlerrtext)
		else
			delete from soins_auto where code = :v_code ;
			commit ;
			
			if sqlca.sqlcode <> 0 then
				Messagebox("ERREUR","Problème dans la suppression des lignes de soins.~n~n"+sqlca.sqlerrtext)
			else
				dw_liste.deleterow(dw_liste.getrow())
				commit ;
			end if
		end if
	end if
end if
end event

type cb_ajouter from w_param`cb_ajouter within w_titres_soins_auto
integer x = 14
integer y = 2012
integer width = 425
integer height = 144
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn(1)
dw_liste.SetFocus()


vcle = vcle + 1
dw_liste.setitem(dw_liste.getrow(),"code",vcle)
end event

type dw_liste from w_param`dw_liste within w_titres_soins_auto
event ue_leftbuttonup pbm_dwnlbuttonup
integer x = 645
integer y = 48
integer width = 2720
integer height = 1848
string dataobject = "dw_titres_soins_auto_liste"
end type

event dw_liste::ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event dw_liste::doubleclicked;if row > 0 then
	
	if enregistrement_automatique and cb_enregistrer.enabled then
		cb_enregistrer.triggerevent(clicked!)
	end if
	
	cb_lignes.triggerevent("clicked")
end  if

end event

event dw_liste::resize;call super::resize;iu_PowerFilter.event ue_positionbuttons()
end event

event dw_liste::constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)
iu_PowerFilter.of_SetLanguage( 1 )
end event

event dw_liste::rbuttondown;call super::rbuttondown;// Couleur de fond	
if row > 0 then 
	long couleur_choisie
	
	couleur_choisie = getitemNumber(row, "couleur_fond")
	zerol(couleur_choisie)

	// Les positions seront utilisées dans le timer de la fenêtre	
	ii_palette_x = xpos
	ii_palette_y = ypos
	
	Timer(0.05)

	//Appel de la fenetre couleur et au retour, met la couleur de fond
	//--------------------------------------------------
	if appel_palette(couleur_choisie) then
		this.setitem(row,"couleur_fond",couleur_choisie)
		// On bouge le focus pour appliquer la couleur dans la zone
		this.accepttext()
		if enregistrement_automatique and cb_enregistrer.enabled then
			cb_enregistrer.triggerevent(clicked!)
		end if
	end if
end if



return 1
end event

type uo_1 from w_param`uo_1 within w_titres_soins_auto
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_titres_soins_auto
boolean visible = false
integer x = 59
integer y = 1224
end type

type gb_filtre from w_param`gb_filtre within w_titres_soins_auto
boolean visible = false
integer x = 174
integer y = 1276
end type

type cb_lignes from uo_picturebutton_390x120 within w_titres_soins_auto
integer x = 1289
integer y = 2012
integer width = 425
integer taborder = 50
boolean bringtotop = true
string text = "&Lignes"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;if dw_liste.rowcount() > 0 then
	
	dw_liste.accepttext()
	if dw_liste.modifiedcount() > 0 or dw_liste.deletedcount()>0 Then
		MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVous devez les enregistrer avant de poursuivre.")
	else
		
		ligne_courante = dw_liste.getrow()
		var_soins_auto = dw_liste.getitemnumber(ligne_courante,"code")
		w_soins_lignes_auto_maj w1
		string tit
		SELECT nom INTO :tit FROM titres_soins_auto WHERE code = :var_soins_auto  ;
			
		w_mdi_2020.uo_powerdock.of_openDocument(w1, "Soins Automatiques : "+tit, m_orthokis_2020.m_tables.m_tables_soins_diag.toolbarItemName)

	end if
end if

end event

type cb_dupliquer from uo_picturebutton_390x120 within w_titres_soins_auto
integer x = 864
integer y = 2012
integer width = 425
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
	
		double code_soin_depart, code_soin_arrivee,couleur_depart
		string nom_soin_depart,nom_soin_arrivee
		
		nom_soin_depart = dw_liste.getitemstring(dw_liste.getrow(),"nom")
		code_soin_depart = dw_liste.getitemnumber(dw_liste.getrow(),"code")
		couleur_depart= dw_liste.getitemnumber(dw_liste.getrow(),"couleur_fond")

		nom_soin_arrivee = left("Copie de "+nom_soin_depart,40)
	
		if MessageBox("DEMANDE DE CONFIRMATION","Vous allez dupliquer les lignes du soin automatique '"+ nom_soin_depart+"' vers le soin '"+nom_soin_arrivee+"'~n~nConfirmez-vous ?",question!,YesNo!,2) = 1 then
			// Ok pour la duplication
		
			// Récupération du code du soin d'arrivée ..
			SELECT max(code) INTO :code_soin_arrivee FROM "titres_soins_auto" ;
			
			if isnull(code_soin_arrivee)  then
				// Théoriquement impossible mais ...
				code_soin_arrivee = 1
			else
				code_soin_arrivee = code_soin_arrivee + 1
			end if
		
			// Ajout du titre ....

			INSERT INTO "titres_soins_auto" ("code","nom", "actif","ordre_trie", "couleur_fond")
			VALUES (:code_soin_arrivee, :nom_soin_arrivee, 1, 100, :couleur_depart) ;
			
			if sqlca.sqlcode = 0 then
			
				// Ajout des soins ...
				
				  INSERT INTO "soins_auto"  
							 ( "cle",      "code",     "type",     "numero",     "date_demande",     "scp_demande",      "date_accord",     "scp_accord",   
								"hn",       "total",        "tp",     "date_cara", "nombre_decalage","mode_decalage"  )  
				  SELECT "soins_auto"."cle",   
							:code_soin_arrivee,   
							"soins_auto"."type",   
							"soins_auto"."numero",   
							"soins_auto"."date_demande",   
							"soins_auto"."scp_demande",   
							"soins_auto"."date_accord",   
							"soins_auto"."scp_accord",   
							"soins_auto"."hn",   
							"soins_auto"."total",   
							"soins_auto"."tp",   
							"soins_auto"."date_cara"  , 
							"nombre_decalage",
							"mode_decalage" 
					 FROM "soins_auto"  
					WHERE "soins_auto"."code" = :code_soin_depart    ;				
				

				if sqlca.sqlcode = 0 then
			
					// Ajout des lignes ....
					
					  INSERT INTO "ligne_soins_auto"  
							( "cle",   "code",    "date",   "montant",    "tp",   "origine_tp", "nombre_decalage","mode_decalage", "non_prelevement" )  
						  SELECT "ligne_soins_auto"."cle",   
									:code_soin_arrivee,      
									 "ligne_soins_auto"."date",      
									 "ligne_soins_auto"."montant",   
									"ligne_soins_auto"."tp",     
									"ligne_soins_auto"."origine_tp"  , 
									"ligne_soins_auto". "nombre_decalage", 
									"ligne_soins_auto"."mode_decalage", 
									"ligne_soins_auto"."non_prelevement" 
						FROM "ligne_soins_auto"  WHERE "ligne_soins_auto"."code" = :code_soin_depart   ;
						
	
	
						if sqlca.sqlcode = 0 then
					
							// Duplication complète
							Commit ;
							dw_liste.retrieve()
							MessageBox("DUPLICATION","La duplication a réussi.")
						else
							MessageBox("ERREUR DANS L'AJOUT DES LIGNES",sqlca.sqlerrtext)
							rollback ;
						end if
					else
							MessageBox("ERREUR DANS L'AJOUT DES SOINS",sqlca.sqlerrtext)
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

type uo_filtre from u_cst_togglebutton within w_titres_soins_auto
event destroy ( )
integer x = 1838
integer y = 2012
integer width = 599
integer height = 96
integer taborder = 50
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on uo_filtre.destroy
call u_cst_togglebutton::destroy
end on

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()



end event

