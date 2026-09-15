$PBExportHeader$w_ememoire_luxembourg_contestation.srw
forward
global type w_ememoire_luxembourg_contestation from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_ememoire_luxembourg_contestation
end type
type dw_liste from datawindow within w_ememoire_luxembourg_contestation
end type
type mle_texte_contestation from multilineedit within w_ememoire_luxembourg_contestation
end type
type st_1 from statictext within w_ememoire_luxembourg_contestation
end type
type cb_contestation from uo_picturebutton_390x120 within w_ememoire_luxembourg_contestation
end type
type st_2 from statictext within w_ememoire_luxembourg_contestation
end type
type ddlb_code_contestation from dropdownlistbox within w_ememoire_luxembourg_contestation
end type
end forward

global type w_ememoire_luxembourg_contestation from w_fenetre_arakis
integer width = 3744
integer height = 2132
string title = "Contestation"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
dw_liste dw_liste
mle_texte_contestation mle_texte_contestation
st_1 st_1
cb_contestation cb_contestation
st_2 st_2
ddlb_code_contestation ddlb_code_contestation
end type
global w_ememoire_luxembourg_contestation w_ememoire_luxembourg_contestation

type variables


double v_numero_memoire, v_cle
string v_reponse_simulation, v_identifiant_facturier
end variables

on w_ememoire_luxembourg_contestation.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.dw_liste=create dw_liste
this.mle_texte_contestation=create mle_texte_contestation
this.st_1=create st_1
this.cb_contestation=create cb_contestation
this.st_2=create st_2
this.ddlb_code_contestation=create ddlb_code_contestation
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.dw_liste
this.Control[iCurrent+3]=this.mle_texte_contestation
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.cb_contestation
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.ddlb_code_contestation
end on

on w_ememoire_luxembourg_contestation.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.dw_liste)
destroy(this.mle_texte_contestation)
destroy(this.st_1)
destroy(this.cb_contestation)
destroy(this.st_2)
destroy(this.ddlb_code_contestation)
end on

event open;call super::open;
// passage de paramètres par variables globales
v_numero_memoire = double(param_win[1])
v_cle = double(param_win[2])
v_reponse_simulation = param_win[3]
v_identifiant_facturier = param_win[4]

dw_liste.settransobject(sqlca)
dw_liste.retrieve(v_numero_memoire, v_cle)

ddlb_code_contestation.selectitem(1)

if dw_liste.rowcount() = 0 then 
	Messagebox("ATTENTION", "Erreur dans la récuparation de la liste des anomalies !")
	return 
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_ememoire_luxembourg_contestation
integer x = 475
integer y = 1384
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_ememoire_luxembourg_contestation
integer x = 2053
integer y = 1800
integer width = 649
integer taborder = 10
boolean bringtotop = true
boolean default = true
end type

type dw_liste from datawindow within w_ememoire_luxembourg_contestation
integer x = 37
integer y = 20
integer width = 3639
integer height = 1032
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_ememoire_luxembourg_anomalie"
boolean vscrollbar = true
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If
end event

event retrieveend;If rowcount > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(1,True)
End If
end event

type mle_texte_contestation from multilineedit within w_ememoire_luxembourg_contestation
integer x = 1006
integer y = 1252
integer width = 2656
integer height = 436
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_ememoire_luxembourg_contestation
integer x = 32
integer y = 1240
integer width = 965
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Justification de la contestation : "
boolean focusrectangle = false
end type

type cb_contestation from uo_picturebutton_390x120 within w_ememoire_luxembourg_contestation
integer x = 1106
integer y = 1792
integer width = 649
integer taborder = 30
boolean bringtotop = true
string text = "Contester"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;
if len(trim(mle_texte_contestation.text)) = 0 then 
	
	MessageBox("ATTENTION", "Vous devez indiquer une justification de la contestation !")

else
	
	if MessageBox("CONFIRMATION","Confirmez-vous l'envoi de cette contestation ?", Question!, YesNo!, 2) = 1 then 
		
		
		// Génération du fichier XML de contestation
		integer li_fichier_contestation
		string ls_body, v_retour
		string ls_success 
		long lig, tot
		
		string ls_commentaire
		string ls_anomalie_uuid, v_code_contestation
		
		li_fichier_contestation = fileOpen(dir_ini + "contestation.xml", LineMode!,  Write! , LockWrite!, Replace!,  EncodingUtf8!)
		
		FileWrite(li_fichier_contestation, '<contestationSimulationMedecin xmlns="http://www.secu.lu/ciss/cns/pid/v2/contestation">')
		
		w_ememoire_luxembourg_maj.wf_ecrire_valeur_xml(li_fichier_contestation, "identifiantReponseSimulation", v_reponse_simulation )
		FileWrite(li_fichier_contestation,"<contestationAnomalie>")
		
		v_code_contestation = string(ddlb_code_contestation.finditem(ddlb_code_contestation.text,1))
		
		ls_anomalie_uuid = dw_liste.getitemstring(dw_liste.getrow(), "anomalie_uuid" )
		w_ememoire_luxembourg_maj.wf_ecrire_valeur_xml(li_fichier_contestation, "identifiantAnomalie", ls_anomalie_uuid )
		w_ememoire_luxembourg_maj.wf_ecrire_valeur_xml(li_fichier_contestation, "codeContestation", v_code_contestation )					
		w_ememoire_luxembourg_maj.wf_ecrire_valeur_xml(li_fichier_contestation, "contestationTexteLibre", mle_texte_contestation.text )
		
		FileWrite(li_fichier_contestation,"</contestationAnomalie>")
		FileWrite(li_fichier_contestation, "</contestationSimulationMedecin>")
		fileclose(li_fichier_contestation)
		
		
		// lecture du xml	
		li_fichier_contestation = fileOpen(dir_ini + "contestation.xml", TextMode!,  Read! )
		Filereadex(li_fichier_contestation, ls_body )
		fileclose(li_fichier_contestation)
		
		
		
		// Envoi de la commande 
		if  fxg_lancer_commande_econnector("pid/" +  v_identifiant_facturier + "/contest-simulation", "P", ls_body, v_retour)  then
		
				
			// Interprétation des résultats du retour
			long ll_anomalies, ll_anomalie_item, ll_cnt_anomalies, ll_root
			string ls_idMemoireHonoraire, ls_matricule, ls_reponse_contestation_uuid
			string ls_identifiantAnomalie, ls_type,  ls_motif
		
			string ls_anomalies, ls_result, ls_code
				
			integer i_cpt_anomalies, i_cpt_lignes
			long ll_cnt_lignes, ll_lignes, ll_ligneUTARetour_item, ll_ligneUTARetour
			
			string ls_identifiantPrestation
					
					
			JSONParser json
			json = CREATE JSONParser
			 
			ls_result = json.LoadString (v_retour)
			ll_root = json.GetRootItem()
				
				
			
			ls_reponse_contestation_uuid =  string_non_nulle(json.GetItemString(ll_root, "identifiantReponseContestation"))
		
			ll_anomalies = json.GetItemArray(ll_root, "anomalies")
		
			// Anomalies
			ll_cnt_anomalies = json.GetChildCount(ll_anomalies)
		
		if ll_cnt_anomalies = 0 then 
			// la contestation est OK
				
			ls_success = "O"
				
				// Mise à jour du statut du mémoire et de la réponse du CNS
				update ememoire_luxembourg set etat = 'C' where numero_memoire = :v_numero_memoire ; 
		
				if sqlca.sqlcode = 0 then 
					update ememoire_luxembourg_anomalie set reponse_contestation_uuid = :ls_reponse_contestation_uuid 
					where numero_memoire = :v_numero_memoire and cle = :v_cle and anomalie_uuid = :ls_anomalie_uuid  ; 
					
					if sqlca.sqlcode = 0 then 
						commit ;
					
						Messagebox("INFORMATION", "L'anomalie du eMémoire a été contestée !")
					else
						Messagebox("ATTENTION", "Erreur dans la mise à jour de l'anomalie contestée !~n~n" + sqlca.sqlerrtext)
						rollback ;
					end if
									
				else
					Messagebox("ATTENTION", "Erreur dans la mise à jour du statut du eMémoire !~n~n" + sqlca.sqlerrtext)
					rollback ;
				end if
				
			else
				ls_success = "N"
				// Analyse des anomalies générales
				  For i_cpt_anomalies = 1 to ll_cnt_anomalies
						ll_anomalie_item = json.GetChildItem(ll_anomalies, i_cpt_anomalies)    
						
						ls_identifiantAnomalie = json.GetItemString(ll_anomalie_item, "identifiantAnomalie")
						ls_type = json.GetItemString(ll_anomalie_item, "type")
						ls_code = json.GetItemString(ll_anomalie_item, "code")
						ls_motif = json.GetItemString(ll_anomalie_item, "motif")
						
						MessageBox("ATTENTION","ANOMALIE GENERALE N°" + string(i_cpt_anomalies) + "/" + string(ll_cnt_anomalies) + " : ~n~nType : " + ls_type + "~n~nCode : " + ls_code + "~n~nModif : "  + ls_motif )	
				  next 
				  
				  ls_success = "N"
				  
				  
			end if
			
			// Dans les 2 cas ont met à jour les mêmes infos
				// Mise à jour du statut du mémoire et de la réponse du CNS
				update ememoire_luxembourg set etat = 'C'  where numero_memoire = :v_numero_memoire ; 
				
				if sqlca.sqlcode = 0 then 
					commit ;
					//dw_gene.retrieve(v_numero_memoire)
									
				else
					Messagebox("ATTENTION", "Erreur dans la mise à jour du statut du eMémoire !~n~n" + sqlca.sqlerrtext)
					rollback ;
				end if
			end if
		//else
		//	ls_success = "N"
				
		//end if
		
		// Mémorisation du retour
		insert into ememoire_luxembourg_operations ("numero_memoire", "type_operation", "success", "envoi", "retour", date_heure)
		values (:v_numero_memoire, 'C', :ls_success, :ls_body, :v_retour, getdate()) ;
		
		if sqlca.sqlcode = 0 then 
			commit ;
		else
			messagebox("ATTENTION", "Erreur dans la mémorisation de la contestation !~n~n" + sqlca.sqlerrtext)
			rollback ;
		end if
	end if
end if

close(parent)

end event

type st_2 from statictext within w_ememoire_luxembourg_contestation
integer x = 32
integer y = 1128
integer width = 965
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Type de contestation : "
alignment alignment = right!
boolean focusrectangle = false
end type

type ddlb_code_contestation from dropdownlistbox within w_ememoire_luxembourg_contestation
integer x = 1006
integer y = 1108
integer width = 2656
integer height = 400
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
string item[] = {"Interprétation d~'une règle de tarification faite par le moteur de règles","Constatation d~'une erreur de programmation du moteur de règles","Autres"}
borderstyle borderstyle = stylelowered!
end type

