$PBExportHeader$w_duplicate_patient.srw
forward
global type w_duplicate_patient from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_duplicate_patient
end type
type cb_ajouter from uo_picturebutton_390x120 within w_duplicate_patient
end type
type em_nom from editmask within w_duplicate_patient
end type
type st_nom from statictext within w_duplicate_patient
end type
type em_dernier from editmask within w_duplicate_patient
end type
type st_5 from statictext within w_duplicate_patient
end type
type em_maxi from editmask within w_duplicate_patient
end type
type em_mini from editmask within w_duplicate_patient
end type
type em_num from editmask within w_duplicate_patient
end type
type st_2 from statictext within w_duplicate_patient
end type
type st_1 from statictext within w_duplicate_patient
end type
type st_mini from statictext within w_duplicate_patient
end type
type uo_parente from uo_lien_parente within w_duplicate_patient
end type
end forward

global type w_duplicate_patient from w_fenetre_arakis
integer x = 681
integer y = 480
integer width = 1573
integer height = 1184
string title = "Duplication d~'un dossier Frère / Soeur"
windowtype windowtype = response!
long backcolor = 15780518
cb_annuler cb_annuler
cb_ajouter cb_ajouter
em_nom em_nom
st_nom st_nom
em_dernier em_dernier
st_5 st_5
em_maxi em_maxi
em_mini em_mini
em_num em_num
st_2 st_2
st_1 st_1
st_mini st_mini
uo_parente uo_parente
end type
global w_duplicate_patient w_duplicate_patient

type variables
string nom

double var_code_local
end variables

event open;
var_code_local = message.DoubleParm

centrer(this)

double min,max
string prenom

var_suite = false

open(w_patience)

// Recherche des N° de dossier
SELECT min(numero_dossier),max(numero_dossier) INTO :min,:max  
FROM patient WHERE numero_dossier < 100000000;

// Recherche des noms prénomls
SELECT nom,prenom INTO :nom, :prenom FROM patient WHERE code = :var_code_local ;
close(w_patience)

em_maxi.text = string(max)
em_mini.text = string(min)
em_dernier.text = string(var_numero_dossier)


// On regarde les paramètres généraux pour savoir ce qu'on doit proposer comme numéro
integer propo_auto
select num_patient_auto_normale into :propo_auto from param ;

//rappel : si 1 => le plus grand +1 ; si 2 => le plus petit -1
choose case propo_auto
	case 1
		em_num.text = string(max +1)
	case 2
		em_num.text = string(min -1)
end choose


formater_zone_nom_prenom_editmask("P", em_nom)

em_nom.text = prenom
var_nom = nom + ' ' + trim(prenom)

backcolor = couleur_fond_fenetre

end event

on w_duplicate_patient.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_ajouter=create cb_ajouter
this.em_nom=create em_nom
this.st_nom=create st_nom
this.em_dernier=create em_dernier
this.st_5=create st_5
this.em_maxi=create em_maxi
this.em_mini=create em_mini
this.em_num=create em_num
this.st_2=create st_2
this.st_1=create st_1
this.st_mini=create st_mini
this.uo_parente=create uo_parente
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_ajouter
this.Control[iCurrent+3]=this.em_nom
this.Control[iCurrent+4]=this.st_nom
this.Control[iCurrent+5]=this.em_dernier
this.Control[iCurrent+6]=this.st_5
this.Control[iCurrent+7]=this.em_maxi
this.Control[iCurrent+8]=this.em_mini
this.Control[iCurrent+9]=this.em_num
this.Control[iCurrent+10]=this.st_2
this.Control[iCurrent+11]=this.st_1
this.Control[iCurrent+12]=this.st_mini
this.Control[iCurrent+13]=this.uo_parente
end on

on w_duplicate_patient.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_ajouter)
destroy(this.em_nom)
destroy(this.st_nom)
destroy(this.em_dernier)
destroy(this.st_5)
destroy(this.em_maxi)
destroy(this.em_mini)
destroy(this.em_num)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_mini)
destroy(this.uo_parente)
end on

type p_fond from w_fenetre_arakis`p_fond within w_duplicate_patient
end type

type cb_annuler from uo_picturebutton_390x120 within w_duplicate_patient
integer x = 823
integer y = 868
integer width = 485
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;var_suite = false
close(parent)
end event

type cb_ajouter from uo_picturebutton_390x120 within w_duplicate_patient
integer x = 315
integer y = 868
integer width = 485
integer taborder = 41
string text = "&Ajouter"
boolean default = true
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;double num, v_ancien_code
string var_cp
string nom_p1, adr1_p1, adr2_p1, codep_p1, ville_p1, com_p1,pays_p1
string nom_p2, adr1_p2, adr2_p2, codep_p2, ville_p2, com_p2,pays_p2
string nom_p3, adr1_p3, adr2_p3, codep_p3, ville_p3, com_p3,pays_p3
string teldom_p1, teltra_p1, secu_p1, prof_p1, prof2_p1
string teldom_p2, teltra_p2, secu_p2, prof_p2, prof2_p2
string teldom_p3, teltra_p3, secu_p3, prof_p3, prof2_p3, assure, nom_assure
string code_caisse, code_mutuelle, tp, hn ,  email, portable
string code_praticien, code_correspondant, code_dentiste, code_medecin
string adulte,cmu
date date_naissance_assure
real titre_p1, titre_p2, titre_p3
string v_envoi_sms

string v_portable_patient_sms ,  v_portable_sms ,  v_portable2_parent1_sms
string v_portable1_parent2_sms , v_portable2_parent2_sms ,  v_portable1_payeur_sms , v_portable2_payeur_sms

char v_autor_cloud, v_autor_appli_patient, v_autor_appli_parent11, v_autor_appli_parent12, v_autor_appli_parent21, v_autor_appli_parent22,v_autor_appli_payeur1,  v_autor_appli_payeur2

integer cpt = 0

NUM = double(em_num.text)

if num = 0 or isnull(num) then
	son(5)
	MessageBox("ATTENTION !","Le numéro de dossier peut être positif,~nnégatif, mais pas nul !")

else

	if not (-99999999<=num and num<=99999999) then
		son(5)
		MessageBox("ATTENTION !","Le numéro de dossier doit être compris entre -99999999 et 99999999 !")

	else

	 	IF (trim(nom) + ' ' + em_nom.text) = var_nom  THEN
			MessageBox("ATTENTION !","Le prénom doit être différent !")		
		ELSE	
			
		  SELECT code INTO :var_cp FROM prati ;
		  
		  var_nom = nom + ' ' + em_nom.text
		  
 		 SELECT "patient"."nom_parent1", 
			  	"patient"."adr1_parent1",   
     		   "patient"."adr2_parent1", 
				"patient"."codep_parent1",   
	         "patient"."ville_parent1",   
	         "patient"."teldom_parent1",   
  		      "patient"."teltra_parent1",   
   		     "patient"."com_parent1",   
    		     "patient"."secu_parent1",   
   		     "patient"."nom_parent2",   
    		     "patient"."adr1_parent2",   
    		     "patient"."adr2_parent2",   
   		     "patient"."codep_parent2",   
   			  "patient"."ville_parent2",   
   		     "patient"."teldom_parent2",   
   		     "patient"."teltra_parent2",   
    		     "patient"."com_parent2",   
    		     "patient"."secu_parent2",   
    		     "patient"."nom_payeur",   
 		       "patient"."adr1_payeur",   
  		       "patient"."adr2_payeur",   
  		       "patient"."codep_payeur",   
  		       "patient"."ville_payeur",   
  		       "patient"."teldom_payeur",   
    		      "patient"."teltra_payeur",   
   		      "patient"."com_payeur",   
   		      "patient"."secu_payeur",   
   		      "patient"."code_praticien",   
   		      "patient"."code_correspondant",   
   		      "patient"."code_dentiste",   
   		      "patient"."code_caisse",   
   		      "patient"."code_mutuelle",   
    		      "patient"."prof_parent1",   
   		      "patient"."prof_parent2",  
					"patient"."prof_payeur",   
		         "patient"."hn",   
		         "patient"."tp",   
		         "patient"."titre_parent1",   
		         "patient"."titre_parent2",   
		         "patient"."titre_payeur",   
		         "patient"."prof2_parent1",   
		         "patient"."prof2_parent2",   
      		   "patient"."prof2_payeur",   
					"patient"."email",   
					"patient"."portable" ,   
					"patient"."assure" ,   
					"patient"."nom_assure" ,   
					"patient"."adulte" ,
					"patient"."code_medecin",
					"patient"."mise_en_evidence" ,
					"patient"."date_naissance_assure",
					"patient"."pays_parent1",
					"patient"."pays_parent2",
					"patient"."pays_payeur",
					"patient"."envoi_sms" ,
 					 portable_patient_sms , 
					  portable_sms , 
					  portable2_parent1_sms , 
			  		portable1_parent2_sms , 
			  		portable2_parent2_sms ,  
			  		portable1_payeur_sms ,  
			  		portable2_payeur_sms , 
//					autor_cloud , 
					autor_appli_patient, 
					autor_appli_parent11, 
					autor_appli_parent12, 
					autor_appli_parent21, 
					autor_appli_parent22, 
					autor_appli_payeur1,  
					autor_appli_payeur2
			  INTO :nom_p1,   
				:adr1_p1,   
				:adr2_p1,   
				:codep_p1,   
				:ville_p1,   
				:teldom_p1,   
				:teltra_p1,   
				:com_p1,   
				:secu_p1,   
				:nom_p2,   
				:adr1_p2,   
				:adr2_p2,   
				:codep_p2,   
				:ville_p2,   
				:teldom_p2,   
				:teltra_p2,   
				:com_p2,   
				:secu_p2,   
				:nom_p3,   
				:adr1_p3,   
				:adr2_p3,   
				:codep_p3,   
				:ville_p3,   
				:teldom_p3,   
				:teltra_p3,   
				:com_p3,   
				:secu_p3,   
				:code_praticien,   
				:code_correspondant,   
				:code_dentiste,   
				:code_caisse,   
				:code_mutuelle,   
				:prof_p1,   
				:prof_p2,
			:prof_p3,
				:hn,   
				:tp,   
				:titre_p1,   
				:titre_p2,   
				:titre_p3,   
				:prof2_p1,   
				:prof2_p2,   
				:prof2_p3,
				:email,
				:portable,
				:assure,
				:nom_assure,
				:adulte,
				:code_medecin,
				:cmu,
				:date_naissance_assure,
				:pays_p1,
				:pays_p2,
				:pays_p3,
				:v_envoi_sms,
				:v_portable_patient_sms ,  
				:v_portable_sms ,
				:v_portable2_parent1_sms ,
				:v_portable1_parent2_sms , 
				:v_portable2_parent2_sms ,  
				:v_portable1_payeur_sms ,
				:v_portable2_payeur_sms ,
//				 :v_autor_cloud, 
				 :v_autor_appli_patient, 
				 :v_autor_appli_parent11, 
				 :v_autor_appli_parent12, 
				 :v_autor_appli_parent21, 
				 :v_autor_appli_parent22,
				 :v_autor_appli_payeur1,  
				 :v_autor_appli_payeur2
	
		 FROM "patient"  
		WHERE "patient"."code" = :var_code_local   ;
			  
		  
	if SQLCA.SQLcode <> 0 Then
		Messagebox("Erreur SQL dans la lecture N°" + string(SQLCA.SQLcode ),SQLCA.SQLErrText)
	end if
	
		  
		  
		// TYPE DE DOSSIER 
		  long v_ordre
		  string var_dossier
		SELECT min(ordre_trie) INTO :v_ordre FROM dossier ;
		SELECT min(code)  INTO :var_dossier FROM dossier where ordre_trie = :v_ordre ;

		string v_code_comptable_defaut
		// Ciel compta
		if serial = "87694" or serial = "87641" then
			v_code_comptable_defaut = "411000"
		else
			v_code_comptable_defaut = "411000"
		end if 
		
		string v_duree_traitement_unite
		
		if France then
			v_duree_traitement_unite = "S"
		else
			v_duree_traitement_unite = "M"
		end if
		
		string v_barre_avancement
		
		
		if belgique then
			// mode belgique
			v_barre_avancement = "B"
		else
			// duréee
			v_barre_avancement = "D"
		end if
		  
	// Met la date du jour pour la date de 1er contact en création de fiche	  
  INSERT INTO "patient"           ( "numero_dossier",              "nom",              "nom_parent1",              "adr1_parent1",              "adr2_parent1",              "codep_parent1",   
           "ville_parent1",              "teldom_parent1",              "teltra_parent1",              "com_parent1",              "secu_parent1",              "nom_parent2",   
           "adr1_parent2",              "adr2_parent2",              "codep_parent2",              "ville_parent2",              "teldom_parent2",              "teltra_parent2",   
           "com_parent2",              "secu_parent2",              "nom_payeur",              "adr1_payeur",              "adr2_payeur",              "codep_payeur",   
           "ville_payeur",              "teldom_payeur",              "teltra_payeur",              "com_payeur",              "secu_payeur",              "date_naissance",   
           "debut_traitement",              "date_prem_demande",              "classe",              "type",              "code_praticien",              "type_dossier",   
           "code_correspondant",              "code_dentiste",              "code_caisse",              "code_mutuelle",              "premiere_visite",              "moulage",   
           "remarques",              "relance",              "sexe",              "prof_parent1",              "prof_parent2",              "prof_payeur",              "somme_due",   
           "date_proc_reglt",              "mont_proc_reglt",              "proc_rdv",              "lettre_relance",              "hn",              "tp",              "traitement_effectue",   
           "plan_traitement",              "confidentiel",              "prochain_rdv",              "titre_parent1",              "titre_parent2",              "titre_payeur",   
           "prof2_parent1",              "prof2_parent2",              "prof2_payeur",              "prenom",              "email",              "portable",              "archivage",   
           "date_contact",              "prochain_rdv_nb",              "prochain_rdv_tps",			  "assure",			  "nom_assure",			  "devis_remis",
	      "adulte",			  "code_medecin",			  "mise_en_evidence",			"date_naissance_assure",			"pays_parent1",			"pays_parent2",
			"pays_payeur"   , "envoi_sms"  ,
				 portable_patient_sms ,		  portable_sms , 		  portable2_parent1_sms , 	  		portable1_parent2_sms , 
			  		portable2_parent2_sms ,  	  		portable1_payeur_sms ,  	  		portable2_payeur_sms, duree_traitement_unite, code_comptable, barre_avancement ,
//			   autor_cloud, 
			autor_appli_patient, autor_appli_parent11, autor_appli_parent12, autor_appli_parent21, autor_appli_parent22, autor_appli_payeur1,  autor_appli_payeur2 )  
  VALUES ( :num,              :nom,              :nom_p1,              :adr1_p1,              :adr2_p1,              :codep_p1,   
  		 :ville_p1,              :teldom_p1,              :teltra_p1,              :com_p1,              :secu_p1,              :nom_p2,   
           :adr1_p2,              :adr2_p2,              :codep_p2,              :ville_p2,              :teldom_p2,              :teltra_p2,   
           :com_p2,              :secu_p2,              :nom_p3,              :adr1_p3,              :adr2_p3,              :codep_p3,   
           :ville_p3,              :teldom_p3,              :teltra_p3,              :com_p3,              :secu_p3,              null,   
           null,              null,              '',              '',              :code_praticien,              :var_dossier,   
           :code_correspondant,              :code_dentiste,              :code_caisse,              :code_mutuelle,             null,              null,   
           null,              null,              null,              :prof_p1,              :prof_p2,              :prof_p3,   
           null,              null,              null,              null,              null,              :hn,   
           :tp,              null,              null,              null,              null,              :titre_p1,   
           :titre_p2,              :titre_p3,              :prof2_p1,              :prof2_p2,              :prof2_p3,   
           :em_nom.text,             :email,              :portable,              null,              cast(getdate() as date),   
           null,              null,  :assure,			  :nom_assure,			  'O',			  :adulte,			  :code_medecin,
			  :cmu,				:date_naissance_assure,			:pays_p1,			:pays_p2,			:pays_p3, :v_envoi_sms ,
		  	:v_portable_patient_sms ,  			:v_portable_sms ,			:v_portable2_parent1_sms ,			:v_portable1_parent2_sms , 
			:v_portable2_parent2_sms ,  			:v_portable1_payeur_sms ,			:v_portable2_payeur_sms, :v_duree_traitement_unite, :v_code_comptable_defaut, :v_barre_avancement ,
//			:v_autor_cloud,
			:v_autor_appli_patient, 	 :v_autor_appli_parent11,  :v_autor_appli_parent12,  :v_autor_appli_parent21,  :v_autor_appli_parent22, :v_autor_appli_payeur1,   :v_autor_appli_payeur2
	
            )  ;
 


			if SQLCA.SQLcode = -1 Then
			// Problème dans le INSERT
				CHOOSE CASE SQLCA.SQLdbCode
				CASE -193
				// Problème de clé 
						son(5)
						Messagebox("ATTENTION !","Ce numéro de dossier existe déjà !")
					CASE ELSE
						son(4)
						Messagebox("Erreur SQL dans l'insert",SQLCA.SQLErrText)
					END CHOOSE
				rollback ;
				var_suite = false
			else
				Commit ;
				
				// récupération du code généré par la base de données
				double  v_nouv_code
				select code into :v_nouv_code from patient where numero_dossier = :num ;
				
				// depuis le 23/12/2021 ... soucis dans la mise à jour de autor cloud avec une commande normal ... pour quelle raison ????
				string cde
				v_autor_cloud = 'O'  // 
				cde = "update patient set autor_cloud = '" + v_autor_cloud + "' where code = " + string(v_nouv_code) + " ;"
				EXECUTE IMMEDIATE :cde ;
				if sqlca.sqlcode <> 0 then
					messagebox("Problème dans la mise à jour de autor_cloud",sqlca.sqlerrtext)
					rollback ;
				else
					commit ;
				end if
				
			
				
				v_ancien_code = var_code_local 
				
				
				// Depuis 2020 on crée aussi le dossier photos !!!
				security_attributes sa
				string chemindossier
				chemindossier = dir_photos + string(v_nouv_code) 
				if not fxg_FileExists(chemindossier) then CreateDirectoryA(chemindossier,sa)

				
				
				// Le insert s'est bien passé .. on met les infos du patient courant
				var_suite = true
				var_numero_dossier = num
				var_code = v_nouv_code
				var_nom = nom+" "+em_nom.text
				
				
				// Mise à jour de l'historique des dossiers
				INSERT INTO histo_dossier (code, date_heure, type_dossier) 
				VALUES (:v_nouv_code, getdate(), :var_dossier) ;
				
				// Mémorisation de la création du dossier
				ajout_histo_actions(v_nouv_code,"AJOPAT",today(),"Création par duplication de dossier" )
				
				
				COMMIT ;
				
				// Synchronisation des données pour être sur ... 
				synchroniser_patients(v_ancien_code, v_nouv_code)
				
				if Messagebox("ATTENTION","Voulez-vous reprendre les informations Assuré (Caisse, Mutuelle, N° Sécu) ?", Question!, YesNo!, 2) = 1 then
					synchroniser_patients_assures(v_ancien_code, v_nouv_code)
				end if
				
				// Ajout d'un lien de parenté avec le patient d'orignie - utilisation d'une variable globale pour ...
				param_win[1] = string(v_ancien_code)
				openWithParm(w_patient_lien_parente_duplication, v_nouv_code)
				
				// Si lien de patenté financier, mise à jour des infos de l'ancien vers le nouveay
				select isnull(count(*),0) into :cpt from patient_lien_parente where (code_patient1 = :v_ancien_code and code_patient2 = :v_nouv_code and liaison_financiere = 'O') or
				(code_patient2 = :v_ancien_code and code_patient1 = :v_nouv_code and liaison_financiere = 'O');	
				
				if cpt >= 1 then
					synchroniser_patients_financier(v_ancien_code, v_nouv_code)
				end if

				
				// Examen des liens de parenté
				if uo_parente.is_lien_parente(v_ancien_code) then
					
					// duplication des liens de parentés et affichage de la fenêtre de mise à jour pour les mettre à jour !!!
					
					insert into patient_lien_parente ("code_patient1", "code_patient2", "code_lien_parente")
					(select :v_nouv_code,  "code_patient2", "code_lien_parente" from  patient_lien_parente where "code_patient1" = :v_ancien_code and "code_patient2" <> :v_nouv_code ) ;

					insert into patient_lien_parente ("code_patient1", "code_patient2", "code_lien_parente")
					(select "code_patient1", :v_nouv_code,  "code_lien_parente"  from  patient_lien_parente where "code_patient2" = :v_ancien_code and "code_patient1" <> :v_nouv_code ) ;
					
					commit ;

					MessageBox("ATTENTION !","Ce patient possédait des liens de parenté. Ils ont été dupliqué vers le nouveau patient.~n~nVous allez ouvrir la fenêtre de ces liens de parenté afin de les valider pour le nouveau patient.")
				end if

				OpenWithParm(w_patient_lien_parente, v_nouv_code)

				// On remet à jour les varaibles glocables au cas ou il y ait eu des ajouts dans la fenêtre des liens de parenté
				var_suite = true
				var_numero_dossier = num
				var_code = v_nouv_code
				var_nom = nom+" "+em_nom.text

				// On va synchroniser la fiche de départ histoire de bien alimenter toure
			
			end if
			close(parent)
		end if
	end if		
end if


end event

type em_nom from editmask within w_duplicate_patient
integer x = 169
integer y = 712
integer width = 1298
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string displaydata = "~b"
end type

type st_nom from statictext within w_duplicate_patient
integer x = 165
integer y = 624
integer width = 791
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nouveau Prénom à Saisir :"
end type

type em_dernier from editmask within w_duplicate_patient
integer x = 859
integer y = 284
integer width = 370
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
string displaydata = ""
end type

type st_5 from statictext within w_duplicate_patient
integer x = 165
integer y = 300
integer width = 672
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Dernier N° manipulé :"
end type

type em_maxi from editmask within w_duplicate_patient
integer x = 859
integer y = 172
integer width = 370
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
string displaydata = ""
end type

type em_mini from editmask within w_duplicate_patient
integer x = 859
integer y = 60
integer width = 370
integer height = 96
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217731
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########0"
string displaydata = ""
end type

type em_num from editmask within w_duplicate_patient
integer x = 859
integer y = 480
integer width = 439
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "########"
boolean spin = true
string displaydata = "~r"
double increment = 1
string minmax = "-9999999~~99999999"
end type

type st_2 from statictext within w_duplicate_patient
integer x = 165
integer y = 496
integer width = 667
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° Dossier à Saisir :"
end type

type st_1 from statictext within w_duplicate_patient
integer x = 165
integer y = 188
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° Dossier Maxi :"
end type

type st_mini from statictext within w_duplicate_patient
integer x = 165
integer y = 76
integer width = 549
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "N° Dossier Mini :"
end type

type uo_parente from uo_lien_parente within w_duplicate_patient
boolean visible = false
integer x = 1349
integer y = 376
integer taborder = 10
boolean bringtotop = true
end type

on uo_parente.destroy
call uo_lien_parente::destroy
end on

