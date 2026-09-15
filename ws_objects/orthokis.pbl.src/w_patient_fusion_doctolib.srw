$PBExportHeader$w_patient_fusion_doctolib.srw
forward
global type w_patient_fusion_doctolib from w_fenetre_arakis
end type
type pb_annuler from uo_picturebutton_390x120_fermer within w_patient_fusion_doctolib
end type
type dw_liste from datawindow within w_patient_fusion_doctolib
end type
type cb_creer from uo_picturebutton_780x120 within w_patient_fusion_doctolib
end type
type cb_rattacher from uo_picturebutton_780x120 within w_patient_fusion_doctolib
end type
type dw_patient_doctolib from datawindow within w_patient_fusion_doctolib
end type
end forward

global type w_patient_fusion_doctolib from w_fenetre_arakis
integer width = 4521
integer height = 2508
string title = "Validation d~'un patient Doctolib"
windowtype windowtype = response!
long backcolor = 15780518
pb_annuler pb_annuler
dw_liste dw_liste
cb_creer cb_creer
cb_rattacher cb_rattacher
dw_patient_doctolib dw_patient_doctolib
end type
global w_patient_fusion_doctolib w_patient_fusion_doctolib

type variables
double var_code_local

string v_pays	// pour les formats de téléphone
end variables

forward prototypes
public subroutine ajouter_patient_liste (double v_code_patient, integer v_qualite)
end prototypes

public subroutine ajouter_patient_liste (double v_code_patient, integer v_qualite);

// Est ce que le patient n'y est pas déjà 

long lig

lig = dw_liste.Find("code = " + string(v_code_patient) , 0, dw_liste.rowcount())

if lig = 0 then

	// ajoute les éléments du patient dans la liste
	
	string v_nom, v_prenom, v_sexe, v_teldom_parent1, v_portable, v_email, v_email_patient, v_adresse1, v_adresse2, v_codep, v_ville
	date v_date_naissance, v_debut_traitement
	string v_type_dossier
	
	select patient.nom, prenom, date_naissance,  sexe, teldom_parent1, portable, email, email_patient,  adr1_parent1, adr2_parent1, 
	codep_parent1, ville_parent1, debut_traitement, dossier.nom
	
	into  :v_nom, :v_prenom, :v_date_naissance,  :v_sexe, :v_teldom_parent1, :v_portable, :v_email, :v_email_patient,  :v_adresse1, :v_adresse2,
	:v_codep, :v_ville, :v_debut_traitement, :v_type_dossier 
	
	from patient , dossier 
	where patient.code = :v_code_patient  and  dossier.code = patient.type_dossier ;
	
	if sqlca.sqlcode = 0 then
		
		dw_liste.insertrow(0)
		lig = dw_liste.rowcount()
		
		dw_liste.setitem(lig, "code", v_code_patient)
		dw_liste.setitem(lig, "qualite", v_qualite)
		dw_liste.setitem(lig, "nom", v_nom)
		dw_liste.setitem(lig, "prenom", v_prenom)
		dw_liste.setitem(lig, "date_naissance", v_date_naissance)
		dw_liste.setitem(lig, "sexe", v_sexe)
		dw_liste.setitem(lig, "teldom_parent1", v_teldom_parent1)
		dw_liste.setitem(lig, "portable", v_portable)
		dw_liste.setitem(lig, "email_patient", v_email_patient)
		dw_liste.setitem(lig, "email", v_email)
		dw_liste.setitem(lig, "adresse1", v_adresse1)
		dw_liste.setitem(lig, "adresse2", v_adresse2)
		dw_liste.setitem(lig, "codep", v_codep)
		dw_liste.setitem(lig, "ville", v_ville)
		dw_liste.setitem(lig, "debut_traitement", v_debut_traitement)
		dw_liste.setitem(lig, "type_dossier", v_type_dossier)
		
		
		
		
	end if
end if
	
	

end subroutine

on w_patient_fusion_doctolib.create
int iCurrent
call super::create
this.pb_annuler=create pb_annuler
this.dw_liste=create dw_liste
this.cb_creer=create cb_creer
this.cb_rattacher=create cb_rattacher
this.dw_patient_doctolib=create dw_patient_doctolib
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_annuler
this.Control[iCurrent+2]=this.dw_liste
this.Control[iCurrent+3]=this.cb_creer
this.Control[iCurrent+4]=this.cb_rattacher
this.Control[iCurrent+5]=this.dw_patient_doctolib
end on

on w_patient_fusion_doctolib.destroy
call super::destroy
destroy(this.pb_annuler)
destroy(this.dw_liste)
destroy(this.cb_creer)
destroy(this.cb_rattacher)
destroy(this.dw_patient_doctolib)
end on

event open;call super::open;// Récupération du code du patient à fussionner , passé en pram
var_code_local = message.doubleParm

if Doctolib then
	this.title = "Validation d'un patient Doctolib"
else
	this.title = "Validation d'un patient ayant pris un rendez-vous en ligne"
end if

centrer(this)


dw_patient_doctolib.settransobject(sqlca)
dw_patient_doctolib.retrieve(var_code_local)

backcolor = couleur_fond_fenetre
Colore_datawindow(dw_patient_doctolib)

if dw_patient_doctolib.rowcount() = 0 then
	Messagebox("ATTENTION","Erreur dans la récupération du dossier provisoire du patient dans Orthokis !~n~nOpération Annulée !")
	close (this)
	
else


	string  v_nom_docto, v_prenom_docto, v_portable_docto, v_teldom_parent1_docto
	date v_date_naissance_docto
	double v_code_trouve

	select isnull(nom, '') , isnull(prenom,'') , isnull(portable,'') , isnull(teldom_parent1, ''), date_naissance  
	into :v_nom_docto, :v_prenom_docto, :v_portable_docto, :v_teldom_parent1_docto, :v_date_naissance_docto
	from patient 
	where code = :var_code_local ;

//	select nom , prenom , portable , teldom_parent1, date_naissance  
//	into :v_nom_docto, :v_prenom_docto, :v_portable_docto, :v_teldom_parent1_docto, :v_date_naissance_docto
//	from patient 
//	where code = :var_code_local ;



	// Construction de la liste ...

	// meme nom + prenom + date naissance
	declare c1 cursor for select code from patient where nom = :v_nom_docto and prenom = :v_prenom_docto and date_naissance = :v_date_naissance_docto and code > 0 
		order by nom, prenom, date_naissance ;
	

	// meme nom + prenom + soundex
	declare c2 cursor for select code from patient where nom = :v_nom_docto and prenom = :v_prenom_docto  and code > 0 
	order by nom, prenom, date_naissance ;

	declare c3 cursor for select code from patient where (( soundex(nom) = soundex(:v_nom_docto) and  prenom = :v_prenom_docto and date_naissance = :v_date_naissance_docto) or  
	( soundex(prenom) = soundex(:v_prenom_docto) and  nom = :v_nom_docto and date_naissance = :v_date_naissance_docto) ) and code > 0
	order by nom, prenom, date_naissance ;


	declare c4 cursor for select code from patient where  nom = :v_nom_docto and date_naissance = :v_date_naissance_docto and code > 0
	order by nom, prenom, date_naissance ;

	
	// meme nom + prenom + soundex
	declare c5 cursor for select code from patient where (( soundex(nom) = soundex(:v_nom_docto) and soundex(prenom) = soundex(:v_prenom_docto) ) and 
	(teldom_parent1 = :v_teldom_parent1_docto  or portable = :v_portable_docto or portable = :v_teldom_parent1_docto  or teldom_parent1 = :v_teldom_parent1_docto) ) and code > 0 
	order by nom, prenom, date_naissance ;

	
	integer nb_curseurs , cpt, v_qualite

	 nb_curseurs = 5
	
	for cpt = 1 to nb_curseurs
		
		choose case cpt
			case 1
				open c1 ;
				fetch c1 into :v_code_trouve ;
				v_qualite = 1
			case 2
				open c2 ;
				fetch c2 into :v_code_trouve ;
				v_qualite = 2
			case 3
				open c3 ;
				fetch c3 into :v_code_trouve ;
				v_qualite = 2
			case 4
				open c4 ;
				fetch c4 into :v_code_trouve ;
				v_qualite = 3
			case 5
				open c5 ;
				fetch c5 into :v_code_trouve ;
				v_qualite = 4
		end choose
		
		
		do while sqlca.sqlcode = 0 
			
			ajouter_patient_liste (v_code_trouve, v_qualite)
			
			choose case cpt
				case 1
					fetch c1 into :v_code_trouve ;
				case 2
					fetch c2 into :v_code_trouve ;
				case 3
					fetch c3 into :v_code_trouve ;
				case 4
					fetch c4 into :v_code_trouve ;
				case 5
					fetch c5 into :v_code_trouve ;
				end choose
		
		loop
		
		
				
	
	
		choose case cpt
			case 1
				close c1 ;
			case 2
				close c2 ;
			case 3
				close c3 ;
			case 4
				close c4 ;
			case 5
				close c5 ;
		end choose
		
	next
	
	
	if dw_liste.rowcount() = 0 then 
		// Aucun dossier qui ressemble => rattachement impossible
		cb_rattacher.enabled (false)
		if Doctolib then
			MessageBox("ATTENTION", "Rendez-vous Doctolib pour un patient non validé par Orthokis !~n~nAucun dossier existant ne semble correspondre à ce client.~n~nLa fenêtre suivante va vous permettre de le créer !")
		else
			MessageBox("ATTENTION", "Rendez-vous pris en ligne pour un patient non validé par Orthokis !~n~nAucun dossier existant ne semble correspondre à ce client.~n~nLa fenêtre suivante va vous permettre de le créer !")
		end if
	else
		if Doctolib then
			MessageBox("ATTENTION", "Rendez-vous Doctolib pour un patient non validé par Orthokis !~n~nLa fenêtre suivante va vous permettre de le créer ou de le fusionner avec un dossier existant !")
		else
			MessageBox("ATTENTION", "Rendez-vous pris en ligne pour un patient non validé par Orthokis !~n~nLa fenêtre suivante va vous permettre de le créer ou de le fusionner avec un dossier existant !")
		end if

	end if




/*constant long couleur_sky  = 15780518
constant long couleur_rouge  = 255
constant long couleur_rouge_fonce = 3810198
constant long couleur_noire  = 0
constant long couleur_blanche  = 16777215
constant long couleur_verte		= 4259584
constant long couleur_orange = 33023
constant long couleur_jaune = 65535
constant long couleur_gris_fonce = 8421504
constant long couleur_bleue = 16711680 
constant long couleur_jaune_clair =12320767
constant long couleur_vert_fonce = 32768
constant long couleur_vert_clair = 11140819

*/

end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_fusion_doctolib
end type

type pb_annuler from uo_picturebutton_390x120_fermer within w_patient_fusion_doctolib
integer x = 2848
integer y = 2184
integer width = 910
integer height = 152
integer taborder = 90
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;
// Pas de modif du patient
CloseWithReturn(Parent, 0)
end event

type dw_liste from datawindow within w_patient_fusion_doctolib
integer x = 23
integer y = 568
integer width = 4443
integer height = 1580
integer taborder = 10
boolean titlebar = true
string title = "Patients similaires dans Orthokis"
string dataobject = "dw_patient_liste_fusion_doctolib"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;//
//If CurrentRow > 0 Then
//	This.SelectRow(0,False)
//	This.SelectRow(CurrentRow,True)
//	This.SeTRow(CurrentRow)
//	
//End If
//
end event

event clicked;
If Row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(Row,True)
	This.SeTRow(Row)
	
End If

end event

type cb_creer from uo_picturebutton_780x120 within w_patient_fusion_doctolib
integer x = 1883
integer y = 2184
integer width = 910
integer height = 152
integer taborder = 110
boolean bringtotop = true
fontcharset fontcharset = ansi!
string text = "Créer le Patient"
string tiptext = "Crée le patient dans Orthokis"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;

If Messagebox("ATTENTION", "Vous allez créer un nouveau dossier pour ce patient !~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	double v_nouveau_dossier, min, max
	integer propo_auto
	
		
	//retrouve les numéro de dossier patient min et max ds base
	SELECT min(numero_dossier),max(numero_dossier) INTO :min,:max 
	FROM "dba"."patient" WHERE   -100000000 < numero_dossier and numero_dossier < 100000000;
	
	//mode rapide (par bouton droit souris ds agenda graph)
	select num_patient_auto_rapide into :propo_auto from param ;

	choose case propo_auto
		case 1
			v_nouveau_dossier = max + 1
		case 2
			v_nouveau_dossier = min - 1
	end choose
	
	
	// Création de la fiche patient (qui aura un code > 0 
	if ajout_nouveau_patient(v_nouveau_dossier) = 1  then 
		double var_code_nouveau
		
		string vnom, vprenom, vsexe, vid_soft2
		date vdate_naissance
		string vteldom_parent1, vportable, vemail, vadr1_parent1, vcodep_parent1, vville_parent1
		
		select code into :var_code_nouveau from patient where numero_dossier = :v_nouveau_dossier ; 
		
		
		// Mise à jour des infos de Doctolib dans la fiche vierge
		select nom, prenom, isnull(sexe,'F'), date_naissance, teldom_parent1, portable, email, adr1_parent1, codep_parent1, ville_parent1 , id_soft2
		into :vnom, :vprenom, :vsexe, :vdate_naissance, :vteldom_parent1, :vportable, :vemail, :vadr1_parent1, :vcodep_parent1, :vville_parent1, :vid_soft2
		from patient 
		where code = :var_code_local ;
		
		if doctolib then
			update patient set nom = :vnom, prenom = :vprenom, sexe = :vsexe, date_naissance = :vdate_naissance, teldom_parent1 = :vteldom_parent1, 
			portable = :vportable, email = :vemail, adr1_parent1 = :vadr1_parent1, codep_parent1 = :vcodep_parent1, ville_parent1 = :vville_parent1 ,
			id_soft2 = :vid_soft2
			where code = :var_code_nouveau ;
		else
			// Prise de rdv dans Mon Ortho => le téléphone est un portable mais est mis dans teldom_parent1 et plein d'autres choses ne sont pas gérées
			update patient set nom = :vnom, prenom = :vprenom, sexe = :vsexe, date_naissance = :vdate_naissance, portable = :vteldom_parent1, email = :vemail
			where code = :var_code_nouveau ;

			// Bonus pour les adultes ..
			if age_calcul_des_annees_date(vdate_naissance) >= 18 then
				update patient set nom_parent1 = :vnom + ' ' + :vprenom, adulte = 'O' , portable_patient = :vteldom_parent1 
				where code = :var_code_nouveau ;			
			end if
		end if
			
		if sqlca.sqlcode = 0 then
			update rdv set code = :var_code_nouveau where code = :var_code_local ;
			
			if sqlca.sqlcode = 0 then
				
				// Mise à jour des commentaires cliniques : au cas où il y ait eu une génération automatique avant
				update coment set code = :var_code_nouveau where code = :var_code_local ;

				if sqlca.sqlcode = 0 then
				
					delete from patient where code = :var_code_local ;
					
					if sqlca.sqlcode = 0 then
						commit ;
						
						// On renvoie C pour création pour poser ou pas la question ouverture du dossier ensuite !
						param_win[1] = "C"
						
						// On posera la question à la sortie 
						// Messagebox("INFORMATION !","Création de dossier effectuée avec succès !")  
						
						
						if Doctolib then 
							// Mise à jour de la pile Doctolib
							
							insert into pile_doctolib ("type", "action", "origine", "Orthokis_id", "Doctolib_id") 
							values ('POST', 'merge', 'Orthokis', :var_code_nouveau , :vid_soft2 ) ;
							
							if sqlca.sqlcode <> 0 then 
								messagebox("ATTENTION !", "Erreur dans la mise à jour de la Pile Doctolib !~n~n" + sqlca.sqlerrtext) 
								rollback ;
							else
								commit ;
							end if
						end if
						
						CloseWithReturn(Parent, var_code_nouveau)
					else
						messagebox("ATTENTION !", "Erreur dans la suppression du dossier patient temporaire !~n~n" + sqlca.sqlerrtext) 
						rollback ;
					end if
				else
					messagebox("ATTENTION !", "Erreur dans la réaffectation des commentaires cliniques !~n~n" + sqlca.sqlerrtext) 
					rollback ;
				end if
			else
				messagebox("ATTENTION !", "Erreur dans la réaffectation des rendez-vous !~n~n" + sqlca.sqlerrtext) 
				rollback ;
			end if
		else	
			messagebox("ATTENTION !", "Erreur dans la mise à jour du nouveau dossier patient !~n~n" + sqlca.sqlerrtext) 
			rollback ;
		end if
	end if
			
	
end if
end event

type cb_rattacher from uo_picturebutton_780x120 within w_patient_fusion_doctolib
integer x = 919
integer y = 2184
integer width = 910
integer height = 152
integer taborder = 120
boolean bringtotop = true
string text = "Rattacher le Patient (RDV)"
string tiptext = "Rattache le patient Doctolib au patient sélectionné"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;

If Messagebox("ATTENTION", "Vous allez rattacher ce patient / rdv à " + dw_liste.getitemstring(dw_liste.getrow(), "nom")  + " " + dw_liste.getitemstring(dw_liste.getrow(), "prenom") +  ".~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	double var_code_nouveau, v_code_interne_rdv
	double tab_code_interne_rdv_doctolib[]
	integer cpt
	
	string v_valeur, v_valeur2, v_valeur3
	date v_valeur_date
	
	// On rattache les rdv à un patient existant d'Orthokis ...
	
	var_code_nouveau = dw_liste.getitemNumber(dw_liste.getrow(), "code") 
	
	if TEA then
		// Mémorisation des code_interne des rdv Doctolib pour les envoyer ensuite à Téa si tout est OK
		declare cur_rdv cursor for select ceiling(code_interne) from rdv where code = :var_code_local ;
		
		open cur_rdv ;
		fetch cur_rdv into :v_code_interne_rdv ; 
		cpt = 0
		do while sqlca.sqlcode = 0
			cpt = cpt + 1
			tab_code_interne_rdv_doctolib[cpt] = v_code_interne_rdv
			fetch cur_rdv into :v_code_interne_rdv ; 
		loop
		close cur_rdv;
	
	end if
	
	// Mise à jour des rdv pour le nouveau patient
	update rdv set code = :var_code_nouveau where code = :var_code_local ;
	
	if sqlca.sqlcode = 0 then
		
		// Mise à jour des commentaires cliniques : au cas où il y ait eu une génération automatique avant
		update coment set code = :var_code_nouveau where code = :var_code_local ;
		
		if sqlca.sqlcode = 0 then
			string vid_soft2
				
			select id_soft2 into :vid_soft2 from patient 	where code = :var_code_local ;
			
			delete from patient where code = :var_code_local ;
			
			if sqlca.sqlcode = 0 then
				commit ;
				Messagebox("INFORMATION !","Rattachement effectué avec succès !")
				
				if TEA then 
					// Envoi des rendez-vous de Doctolib à Téa
					for cpt = 1 to upperbound(tab_code_interne_rdv_doctolib)
						fxg_lancer_commande_dsapi("appointment/create/" + string(tab_code_interne_rdv_doctolib[cpt]) , "", "R", "G", var_code_nouveau  )
					next 
				end if
				
				// On renvoie F pour fusion pour poser ou pas la question ouverture du dossier ensuite !
				param_win[1] = "F"
				
				// On va mettre à jour les informations de Doctolib dans Orthokis si pertinentes
				if dw_patient_doctolib.rowcount() = 1 then
					v_valeur =  dw_patient_doctolib.getItemString( 1, "nom") + " " + dw_patient_doctolib.getItemString( 1, "prenom")
					if v_valeur <> '' then 
						// Mise à jour du nom du parent1 si nul ou vierge 
						update patient set nom_parent1 = :v_valeur where (nom_parent1 is null or trim(nom_parent1) = '') and  code = :var_code_nouveau ;
					end if
					
					v_valeur =  dw_patient_doctolib.getItemString( 1, "email")
					if v_valeur <> '' then 
						// Mise à jour de l'email si nul ou vierge 
						update patient set email = :v_valeur where (email is null or trim(email) = '') and  code = :var_code_nouveau ;
					end if
				
					v_valeur =  dw_patient_doctolib.getItemString( 1, "teldom_parent1")
					if v_valeur <> '' then 
						// Mise à jour de teldom_parent1 si nul ou vierge 
						update patient set teldom_parent1 = :v_valeur where (teldom_parent1 is null or trim(teldom_parent1) = '') and  code = :var_code_nouveau ;
					end if
					
					v_valeur =  dw_patient_doctolib.getItemString( 1, "portable")
					if v_valeur <> '' then 
						// Mise à jour de portable si nul ou vierge 
						update patient set portable = :v_valeur where (portable is null or trim(portable) = '') and  code = :var_code_nouveau ;
					end if
					
					v_valeur =  dw_patient_doctolib.getItemString( 1, "sexe")
					if v_valeur <> '' then 
						// Mise à jour de portable si nul ou vierge 
						update patient set sexe = :v_valeur where (sexe is null or trim(sexe) = '') and  code = :var_code_nouveau ;
					end if
					
					v_valeur_date =  dw_patient_doctolib.getItemDate( 1, "date_naissance")
					if not isnull(v_valeur_date) then 
						// Mise à jour de portable si nul ou vierge 
						update patient set date_naissance = :v_valeur_date where date_naissance is null  and  code = :var_code_nouveau ;
					end if
					
					v_valeur =  dw_patient_doctolib.getItemString( 1, "adr1_parent1")
					v_valeur2 =  dw_patient_doctolib.getItemString( 1, "codep_parent1")
					v_valeur3 =  dw_patient_doctolib.getItemString( 1, "ville_parent1")
					if v_valeur <> '' and v_valeur2 <> "" and v_valeur3 <> "" then 
						// Mise à jour de l'adresse si nul ou vierge en se basant sur adr1 - on met à jour les 3 avec meme condition pour assurer la cohérence !
						update patient set codep_parent1 = :v_valeur2 where (adr1_parent1 is null or trim(adr1_parent1) = '') and  code = :var_code_nouveau ;
						update patient set ville_parent1 = :v_valeur3 where (adr1_parent1 is null or trim(adr1_parent1) = '') and  code = :var_code_nouveau ;
						update patient set adr1_parent1 = :v_valeur where (adr1_parent1 is null or trim(adr1_parent1) = '') and  code = :var_code_nouveau ;
					end if
				
				end if
				
				if Doctolib then 
					// Mise à jour de la pile Doctolib
					
					insert into pile_doctolib ("type", "action", "origine", "Orthokis_id", "Doctolib_id") 
					values ('POST', 'merge', 'Orthokis', :var_code_nouveau , :vid_soft2 ) ;
						
					if sqlca.sqlcode <> 0 then 
						messagebox("ATTENTION !", "Erreur dans la mise à jour de la Pile Doctolib !~n~n" + sqlca.sqlerrtext) 
						rollback ;
					else
						 commit ;
					end if
				end if
		
				CloseWithReturn(Parent, var_code_nouveau)
			else
				messagebox("ATTENTION !", "Erreur dans la suppression du dossier patient temporaire !~n~n" + sqlca.sqlerrtext) 
				rollback ;
			end if
		else
			messagebox("ATTENTION !", "Erreur dans la réaffectation des commentaires cliniques !~n~n" + sqlca.sqlerrtext) 
			rollback ;
		end if
else
		messagebox("ATTENTION !", "Erreur dans la réaffectation des rendez-vous !~n~n" + sqlca.sqlerrtext) 
		rollback ;
	end if
	
end if
end event

type dw_patient_doctolib from datawindow within w_patient_fusion_doctolib
string tag = "brush"
integer x = 23
integer y = 20
integer width = 4443
integer height = 532
integer taborder = 10
boolean bringtotop = true
boolean titlebar = true
string title = "Patient Doctolib à valider"
string dataobject = "dw_patient_fusion_doctolib"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;
if rowcount > 0 then

	v_pays = this.getitemstring(1, "pays_parent1")
	
	if isnull(v_pays) then
		v_pays = "F"
	end if

	formater_zone_pays(v_pays, 'T', this, "portable")
	formater_zone_pays(v_pays, 'T', this, "teldom_parent1")

	formater_zone_pays(v_pays, 'T', dw_liste, "portable")
	formater_zone_pays(v_pays, 'T', dw_liste, "teldom_parent1")

end if

end event

