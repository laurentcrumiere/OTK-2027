$PBExportHeader$w_sms_alertes_depart_arrivee.srw
forward
global type w_sms_alertes_depart_arrivee from window
end type
type st_1 from statictext within w_sms_alertes_depart_arrivee
end type
type dw_maj_histo from datawindow within w_sms_alertes_depart_arrivee
end type
type dw_liste from datawindow within w_sms_alertes_depart_arrivee
end type
end forward

global type w_sms_alertes_depart_arrivee from window
boolean visible = false
integer width = 2057
integer height = 1240
boolean titlebar = true
string title = "Envoi de SMS à une liste de patients"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_maj_histo dw_maj_histo
dw_liste dw_liste
end type
global w_sms_alertes_depart_arrivee w_sms_alertes_depart_arrivee

type variables



end variables

on w_sms_alertes_depart_arrivee.create
this.st_1=create st_1
this.dw_maj_histo=create dw_maj_histo
this.dw_liste=create dw_liste
this.Control[]={this.st_1,&
this.dw_maj_histo,&
this.dw_liste}
end on

on w_sms_alertes_depart_arrivee.destroy
destroy(this.st_1)
destroy(this.dw_maj_histo)
destroy(this.dw_liste)
end on

event open;//
// Gestion des alertes par SMS sur les arrivées / départs de patient ...
// pour simplifier , on considère qu'on ne peut pas à la fois arriver et partir avec le même état ... on privilégie l'arrivée


// pour les fonctions d'envois
uo_pocket uo_poc


string v_etat
st_rdv2 st_rdv
double v_code // code interne du patient
datetime v_rdv
boolean b_afficher_message_confirmation


st_rdv = message.PowerObjectParm


v_code = st_rdv.code_patient
v_etat = st_rdv.etat 
v_rdv = st_rdv.rdv
b_afficher_message_confirmation = st_rdv.afficher_message_confirmation


// Est ce une une arrivée ou un départ 
string s_arrivee, s_depart
string s_arrivee_p1_parent1,  s_arrivee_p2_parent1,  s_arrivee_p1_parent2,  s_arrivee_p2_parent2 
string s_depart_p1_parent1,  s_depart_p2_parent1,  s_depart_p1_parent2,  s_depart_p2_parent2 
string s_numero_p1_parent1, s_numero_p2_parent1, s_numero_p1_parent2, s_numero_p2_parent2
double db_code_message_arrivee, db_code_message_depart

string v_nom, v_prenom, v_parent, v_prati_nom, v_prati_code, v_titre_patient
string v_type_rdv_code, v_type_rdv_nom
date v_date_naissance

string numeros_sms[], nature_numero[]
integer nb_sms = 0
integer cpt_sms
long lig2
string v_code_message, v_id_unique_message, v_id_new_message
string v_fichier_texte

select isnull(salle_attente, 'N'), isnull(depart_cabinet, 'N') into :s_arrivee, :s_depart from "etat_rdv" where code = :v_etat ; 



if s_arrivee = "O" then 
	// Le patient souhaite t il etre averti ??
	select isnull(sms_arrivee_p1_parent1, 'N') , isnull(sms_arrivee_p2_parent1, 'N') , isnull(sms_arrivee_p1_parent2, 'N') , isnull(sms_arrivee_p2_parent2 , 'N') ,
	trim(isnull(portable,'')), 	trim(isnull(portable2_parent1,'')), 	trim(isnull(portable1_parent2,'')), 	trim(isnull(portable2_parent2,''))
	into :s_arrivee_p1_parent1,  :s_arrivee_p2_parent1,  :s_arrivee_p1_parent2,  :s_arrivee_p2_parent2,
		:s_numero_p1_parent1, :s_numero_p2_parent1, :s_numero_p1_parent2, :s_numero_p2_parent2
	
	from "patient" where code = :v_code ; 
	
	
	if s_arrivee_p1_parent1 = "O" or s_arrivee_p2_parent1 = "O" or s_arrivee_p1_parent2 = "O" or s_arrivee_p2_parent2 = "O" then 
		// Il faut envoyer un message d'arrivée
		
		select top 1 isnull( sms_message_arrivee_patient , 0) 
		into :db_code_message_arrivee 
		from "param" ;
		
		if db_code_message_arrivee = 0 then
			messagebox("ATTENTION","Les parents de ce patient souhaitent recevoir un SMS son arrivée au cabinet or aucun message n'est configuré !~n~nMerci de le configurer (Paramètres Généraux) et d'envoyer un message manuellement !")
		else
			
			if s_arrivee_p1_parent1 = "O" and s_numero_p1_parent1 <> "" then 
				nb_sms = nb_sms + 1 
				numeros_sms[nb_sms] = s_numero_p1_parent1
				nature_numero[nb_sms] = 'P11'
			end if
			if s_arrivee_p2_parent1 = "O" and s_numero_p2_parent1 <> "" then 
				nb_sms = nb_sms + 1 
				numeros_sms[nb_sms] = s_numero_p2_parent1
				nature_numero[nb_sms] = 'P12'
			end if
			if s_arrivee_p1_parent2 = "O" and s_numero_p1_parent2 <> "" then 
				nb_sms = nb_sms + 1 
				numeros_sms[nb_sms] = s_numero_p1_parent2
				nature_numero[nb_sms] = 'P21'
			end if
			if s_arrivee_p2_parent2 = "O" and s_numero_p2_parent2 <> "" then 
				nb_sms = nb_sms + 1 
				numeros_sms[nb_sms] = s_numero_p2_parent2
				nature_numero[nb_sms] = 'P22'
			end if
			v_code_message = string(db_code_message_arrivee)
		end if
		
	end if
else
	if s_depart = "O" then
		// Idem arrivéee
		// Le patient souhaite t il etre averti ??
		select isnull(sms_depart_p1_parent1, 'N') , isnull(sms_depart_p2_parent1, 'N') , isnull(sms_depart_p1_parent2, 'N') , isnull(sms_depart_p2_parent2 , 'N') ,
		trim(isnull(portable,'')), 	trim(isnull(portable2_parent1,'')), 	trim(isnull(portable1_parent2,'')), 	trim(isnull(portable2_parent2,''))
		into :s_depart_p1_parent1,  :s_depart_p2_parent1,  :s_depart_p1_parent2,  :s_depart_p2_parent2,
			:s_numero_p1_parent1, :s_numero_p2_parent1, :s_numero_p1_parent2, :s_numero_p2_parent2
		
		from "patient" where code = :v_code ; 
		
		
		if s_depart_p1_parent1 = "O" or s_depart_p2_parent1 = "O" or s_depart_p1_parent2 = "O" or s_depart_p2_parent2 = "O" then 
			// Il faut envoyer un message d'arrivée
			
			select top 1 isnull( sms_message_depart_patient , 0) 
			into :db_code_message_depart 
			from "param" ;
			
			if db_code_message_depart = 0 then
				if b_afficher_message_confirmation then
					messagebox("ATTENTION","Les parents de ce patient souhaitent recevoir un SMS son départ du cabinet or aucun message n'est configuré !~n~nMerci de le configurer (Paramètres Généraux) et d'envoyer un message manuellement !")
				end if
			else
				
				if s_depart_p1_parent1 = "O" and s_numero_p1_parent1 <> "" then 
					nb_sms = nb_sms + 1 
					numeros_sms[nb_sms] = s_numero_p1_parent1
					nature_numero[nb_sms] = 'P11'
				end if
				if s_depart_p2_parent1 = "O" and s_numero_p2_parent1 <> "" then 
					nb_sms = nb_sms + 1 
					numeros_sms[nb_sms] = s_numero_p2_parent1
					nature_numero[nb_sms] = 'P12'
				end if
				if s_depart_p1_parent2 = "O" and s_numero_p1_parent2 <> "" then 
					nb_sms = nb_sms + 1 
					numeros_sms[nb_sms] = s_numero_p1_parent2
					nature_numero[nb_sms] = 'P21'
				end if
				if s_depart_p2_parent2 = "O" and s_numero_p2_parent2 <> "" then 
					nb_sms = nb_sms + 1 
					numeros_sms[nb_sms] = s_numero_p2_parent2
					nature_numero[nb_sms] = 'P22'
				end if
				v_code_message = string(db_code_message_depart)
			end if
			
		end if		
	end if
end if

if nb_sms > 0 then 
	// Envoi effectif !!

	dw_maj_histo.settransobject(sqlca)
	dw_liste.settransobject(sqlca)
	uo_poc = create uo_pocket
	uo_poc.triggerevent(constructor!)
	
	
	select nom, prenom, date_naissance, nom_parent1
	into :v_nom, :v_prenom, :v_date_naissance, :v_parent 
	from patient where code = :v_code ;
	
	select prati.code, prati.nom , rdv."type", type_rdv.nom
	into :v_prati_code, :v_prati_nom , :v_type_rdv_code, :v_type_rdv_nom
	from "prati", "rdv" , "type_rdv"
	where rdv.code = :v_code and rdv.rdv = :v_rdv and rdv.code_praticien = prati.code and rdv."type" = type_rdv.code ;

	


	select isnull(titre_personnes.nom,'') into :v_titre_patient from "titre_personnes", "patient" 
	where patient.code = :v_code and patient.titre_patient = titre_personnes.code ;
	
	// Génération de la liste

	for cpt_sms = 1 to nb_sms
	
		dw_liste.insertrow(0)
		cpt_sms = dw_liste.rowcount()
		dw_liste.setitem(cpt_sms, "nom_patient", v_nom)
		dw_liste.setitem(cpt_sms, "prenom_patient", v_prenom)
		dw_liste.setitem(cpt_sms, "date_naissance", v_date_naissance)
		dw_liste.setitem(cpt_sms, "nom_parent", v_parent)
		dw_liste.setitem(cpt_sms, "portable", numeros_sms[cpt_sms])
		dw_liste.setitem(cpt_sms, "type_rdv_code", v_type_rdv_code)
		dw_liste.setitem(cpt_sms, "type_rdv_nom", v_type_rdv_nom)
		dw_liste.setitem(cpt_sms, "rdv", v_rdv)
		dw_liste.setitem(cpt_sms, "code_praticien", v_prati_code)
		dw_liste.setitem(cpt_sms, "nom_praticien", v_prati_nom)
		dw_liste.setitem(cpt_sms, "code_message", v_code_message)
		dw_liste.setitem(cpt_sms, "dms_id", string(v_code))
		dw_liste.setitem(cpt_sms, "civilite_patient", v_titre_patient)
//		dw_liste.SetItem(cpt_sms, "cle_rdv", string(v_code_interne_rdv ))
	
	
		// ajout dans l'historique au cas ou envoi automatique !!!
		dw_maj_histo.insertrow(0)
		lig2 = dw_maj_histo.rowcount()
		dw_maj_histo.SetItem(lig2, "code_patient", v_code)
		dw_maj_histo.SetItem(lig2, "numero_envoi", numeros_sms[cpt_sms])
		dw_maj_histo.SetItem(lig2, "type_sms", "T")
		dw_maj_histo.SetItem(lig2, "date_envoi", datetime(today(), now()))
		dw_maj_histo.SetItem(lig2, "code_praticien", v_prati_code)
		dw_maj_histo.SetItem(lig2, "code_message", v_code_message)
	
		v_id_new_message = uo_poc.get_id_new_message()+string(cpt_sms)
	
		v_id_unique_message = v_id_new_message + nature_numero[cpt_sms]
		dw_liste.setitem(cpt_sms, "rdv_id", v_id_unique_message)
		dw_maj_histo.SetItem(lig2, "id_message_pocket", v_id_unique_message)

		
	next	

	// Envoi effetif !
	v_fichier_texte = profilestring(dir_ini+inifile_orthokis,"SMS","Fichier",dir_ini+"envoi_sms.txt")
			
	if dw_liste.saveas(v_fichier_texte,  text!  , true    ) = 1 then
		
		if uo_poc.update_planning(v_fichier_texte, false) = 1 then
			if dw_maj_histo.update() = 1 then
				commit ;
				if nb_sms > 0 and b_afficher_message_confirmation then
					if nb_sms > 1 then 
						Messagebox("INFORMATION",string(nb_sms) + " SMS ont été envoyés pour avertir le(s) parent(s), conformément à votre configuration.")
					else
						Messagebox("INFORMATION",string(nb_sms) + " SMS a été envoyé pour avertir le(s) parent(s), conformément à votre configuration.")
					end if
				end if
			else
				rollback ;
				if b_afficher_message_confirmation then 
					Messagebox("ATTENTION","Une erreur s'est produite dans la mise à jour de l'historique de l'envoi des SMS.")
				end if
			end if	
		else
			if b_afficher_message_confirmation then 
				Messagebox("ATTENTION","Une erreur s'est produite dans l'envoi des SMS.")
			end if
		end if
		
	end if
end if	


close(this)




end event

type st_1 from statictext within w_sms_alertes_depart_arrivee
integer x = 187
integer y = 256
integer width = 1691
integer height = 844
integer textsize = -26
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "COMMUNE AVEC borne_commun.PBL => la mettre à jour AUSSI là-bas"
boolean focusrectangle = false
end type

type dw_maj_histo from datawindow within w_sms_alertes_depart_arrivee
boolean visible = false
integer y = 84
integer width = 4338
integer height = 764
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_sms_maj_histo"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_liste from datawindow within w_sms_alertes_depart_arrivee
boolean visible = false
integer width = 4338
integer height = 764
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_sms"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

