$PBExportHeader$uo_wait_and_smile.sru
forward
global type uo_wait_and_smile from userobject
end type
type st_1 from statictext within uo_wait_and_smile
end type
end forward

global type uo_wait_and_smile from userobject
integer width = 1184
integer height = 476
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event init ( )
st_1 st_1
end type
global uo_wait_and_smile uo_wait_and_smile

type variables


CONSTANT string fichier_config_neotess = 'Neotess.ini'
// Retour XML
constant string nom_fichier_recu = "neotess.xml"

string adresse_serveur 


end variables

forward prototypes
public function string get_adresse_serveur ()
public subroutine set_adresse_serveur (string adresse)
public function string get_adulte_titre ()
public subroutine set_adulte_titre (string titre)
public subroutine set_adulte_message (string adulte_message)
public subroutine set_enfant_message (string enfant_message)
public function string get_adulte_message ()
public function string get_enfant_message ()
public function boolean envoi_commande (string v_commande)
public function boolean vider_base_de_donnees ()
public function boolean creer_base_de_donnees ()
public function boolean voir_les_patients_en_attente (integer id_room)
public function date get_date_dernier_vidage ()
public subroutine set_date_dernier_vidage (date v_date_dernier_vidage)
public function string get_premiere_lettre_nom ()
public subroutine set_premiere_lettre_nom (string premiere_lettre_nom)
public subroutine set_messages_types (string messages_types)
public function string get_messages_types ()
public subroutine appeler_patient (double codepatientcourant)
public function string get_salle_diffusion ()
public subroutine set_salle_diffusion (string salle)
end prototypes

public function string get_adresse_serveur ();string v_retour

// renvoie l'adresse IP du serveur Neotess
v_retour = ProfileString(dir_photos + fichier_config_neotess, "serveur", "adresse", "http://192.168.1.1/")

return v_retour
end function

public subroutine set_adresse_serveur (string adresse);

// màj l'adresse IP du serveur Neotess
SetProfileString(dir_photos + fichier_config_neotess, "serveur", "adresse", adresse)


end subroutine

public function string get_adulte_titre ();string v_retour

// renvoie l'adresse IP du serveur Neotess
v_retour = ProfileString(dir_photos + fichier_config_neotess, "messages", "adulte_titre", "O")

return v_retour
end function

public subroutine set_adulte_titre (string titre);
// màj le titre
SetProfileString(dir_photos + fichier_config_neotess, "messages", "adulte_titre", titre)

end subroutine

public subroutine set_adulte_message (string adulte_message);// màj le titre
SetProfileString(dir_photos + fichier_config_neotess, "messages", "adulte_message", adulte_message)
end subroutine

public subroutine set_enfant_message (string enfant_message);// màj le titre
SetProfileString(dir_photos + fichier_config_neotess, "messages", "enfant_message", enfant_message)
end subroutine

public function string get_adulte_message ();string v_retour

// renvoie l'adresse IP du serveur Neotess
v_retour = ProfileString(dir_photos + fichier_config_neotess, "messages", "adulte_message", "1")

return v_retour
end function

public function string get_enfant_message ();string v_retour

// renvoie l'adresse IP du serveur Neotess
v_retour = ProfileString(dir_photos + fichier_config_neotess, "messages", "enfant_message", "1")

return v_retour
end function

public function boolean envoi_commande (string v_commande);//  EXECUTION D'UNE COMMANDE SIMPLE PAR NEOTESS AVEC GESTION DES ERREURS


// Accées internet
Inet iinet_base
string url_wb, url_myo
integer li_rc
n_inetresult in_irdata
integer v_fichier_retour
string v_ligne
long v_pos1, v_pos2
string v_code_erreur

boolean retour

// on n'utise pas Wait and Smile en mode autonome
if not utilisation_distante then
		
	GetContextService("Internet", iinet_base)
	in_irdata = CREATE n_inetresult
	
	// effacement du fichier du dernier appel
	FileDelete(dir_ini + nom_fichier_recu)
	
	// Lancement du webservice qui va bien
	url_wb = get_adresse_serveur()  + "Neotess/widgets2/Starter-FileAttenteOrtholeader/" +  v_commande
	
	li_rc = iinet_base.GetURL(url_wb, in_irdata)
	
	if li_rc = 1 then
		
		in_irdata.of_WriteFile(dir_ini + nom_fichier_recu, in_irdata.iblob_data)
		
	end if
	
	if not FileExists(dir_ini + nom_fichier_recu) then
		
		Messagebox("ATTENTION","Erreur de communication avec le serveur Neotess.~n~nMerci de contacter l'administrateur du réseau.~n~nCauses probables : ~n- l'URL du serveur est mal indiquée dans les Paramètres Généraux~n- les services Apache sont arrétés")
		retour = false
		
	else
		retour = true
	end if
else
	// utilisation distante
	retour = true
end if
return retour
end function

public function boolean vider_base_de_donnees ();return envoi_commande("create-db.jsp?reset=true")
end function

public function boolean creer_base_de_donnees ();return envoi_commande("create-db.jsp")
end function

public function boolean voir_les_patients_en_attente (integer id_room);return envoi_commande("getCalls.jsp?idRoom=" + string(id_Room))
end function

public function date get_date_dernier_vidage ();date v_retour

// renvoie la date du derier vidage de la base de données
v_retour = date( ProfileString(dir_photos + fichier_config_neotess, "serveur", "date_dernier_vidage", "01/01/1900"))

return v_retour
end function

public subroutine set_date_dernier_vidage (date v_date_dernier_vidage);
// renvoie la date du derier vidage de la base de données
SetProfileString(dir_photos + fichier_config_neotess, "serveur", "date_dernier_vidage", string(v_date_dernier_vidage))

end subroutine

public function string get_premiere_lettre_nom ();string v_retour

// renvoie l'adresse IP du serveur Neotess
v_retour = ProfileString(dir_photos + fichier_config_neotess, "messages", "premiere_lettre_nom", "N")

return v_retour
end function

public subroutine set_premiere_lettre_nom (string premiere_lettre_nom);// màj le titre
SetProfileString(dir_photos + fichier_config_neotess, "messages", "premiere_lettre_nom", premiere_lettre_nom)
end subroutine

public subroutine set_messages_types (string messages_types);// màj le titre
SetProfileString(dir_photos + fichier_config_neotess, "messages", "types", messages_types)
end subroutine

public function string get_messages_types ();string v_retour

// renvoie l'adresse IP du serveur Neotess
v_retour = ProfileString(dir_photos + fichier_config_neotess, "messages", "types", "O")

return v_retour
end function

public subroutine appeler_patient (double codepatientcourant);// Envoi du message à Neotess


// pas d'appel en mode autonome

if not utilisation_distante then
	
	// string v_adresse_serveur
	string v_adulte, v_nom, v_prenom, v_titre_code, v_titre_nom, v_firstname, v_lastname, v_lieu, v_sexe, v_est_appelle
	string commande , v_salle_diffusion
	
	select isnull(adulte,'N') , isnull(nom,''), isnull(prenom,''), isnull(titre_patient,'') , sexe
	into :v_adulte , :v_nom, :v_prenom, :v_titre_code , :v_sexe
	from patient where code = :CodePatientCourant ;
	
	if v_adulte = "O" then
		if get_adulte_titre() = "O" then
			select isnull(nom, '') into :v_titre_nom  from titre_personnes where code = :v_titre_code ;
		else
			v_titre_nom = ''
		end if	
	else
		v_titre_nom = ''
	end if
	
	// Construction du message
	if get_premiere_lettre_nom() = "O" then
		v_nom = upper(left(v_nom, 1)) + "."
	end if
	
	
	if get_messages_types() = "O" then
		// Messages types
		
		if  (v_adulte = "O" and get_adulte_message() = "1") or (v_adulte = "N" and get_enfant_message() = "1") then
			v_firstname = v_nom 
			v_lastname = v_prenom
		else
			v_lastname = v_nom 
			 v_firstname = v_prenom
		end if
		
		//v_adresse_serveur = get_adresse_serveur()
		
		if v_titre_nom <> "" then 
			v_firstname = v_titre_nom + " " + v_firstname
		end if
		
		// Lieu
		v_lieu = profilestring(dir_ini+inifile_orthokis,"rendez-vous","lieu_wait_and_smile","Salle de Soins")
		
		if v_sexe = "M" then 
			v_est_appelle = "est appelé en"
		else
			if v_sexe = "F" then
				v_est_appelle = "est appelée en"
			else
				v_est_appelle = "est appelé.e en"
			end if
		end if
		
		// Construction de la requete
	
		v_salle_diffusion = get_salle_diffusion() 
		if v_salle_diffusion = "1" or v_salle_diffusion = "2" then 
			commande = "callPatient.jsp?idPatient="+string(CodePatientCourant)+"&firstname=" + v_firstname + "&lastname=" + v_lastname+"&destinationRoom=" + v_lieu + "&idWaitingRoom=" + v_salle_diffusion +"&singleDisplay=false&complement=" + v_est_appelle
			envoi_commande(commande)
		else
			// Envoi sur les 2 Salles
			v_salle_diffusion = "1"
			commande = "callPatient.jsp?idPatient="+string(CodePatientCourant)+"&firstname=" + v_firstname + "&lastname=" + v_lastname+"&destinationRoom=" + v_lieu + "&idWaitingRoom=" + v_salle_diffusion +"&singleDisplay=false&complement=" + v_est_appelle
			envoi_commande(commande)
			v_salle_diffusion = "2"
			commande = "callPatient.jsp?idPatient="+string(CodePatientCourant)+"&firstname=" + v_firstname + "&lastname=" + v_lastname+"&destinationRoom=" + v_lieu + "&idWaitingRoom=" + v_salle_diffusion +"&singleDisplay=false&complement=" + v_est_appelle
			envoi_commande(commande)
		end if
		
	else
		//=================================================================
		// Messages Spécifiques 
		
		// Sélection du message .. la fentre renvoie 0 ou le numero du message
		OpenWithParm(w_wait_and_smile_config_messages_perso, 2)
		
		integer v_numero_message
		v_numero_message = message.doubleParm
		
		if v_numero_message <> 0 then 
			
			// Construction des éléments du message ... 
			string v_debut 
			// on met le début dans v_firstname
			v_debut = Profilestring(dir_photos + fichier_config_neotess, "messages_types", "debut_" + string(v_numero_message), "")
			v_debut = gfx_tout_remplacer (v_debut , "{titre}", v_titre_nom)
			v_debut = gfx_tout_remplacer (v_debut , "{prénom}", v_prenom)
			v_debut = gfx_tout_remplacer (v_debut , "{nom}", v_nom)
			
			v_est_appelle =  Profilestring(dir_photos + fichier_config_neotess, "messages_types", "centre_" + string(v_numero_message), "")
			
			if Profilestring(dir_photos + fichier_config_neotess, "messages_types", "accord_" + string(v_numero_message), "N") = "O" then 
				// doit on accorder ?
				if v_sexe = "M" then
					// rien à faire
				else
					if v_sexe = "F" then
						v_est_appelle = v_est_appelle + "e"
					else
						v_est_appelle =  v_est_appelle + ".e"
					end if
				end if
			end if
			
			v_lieu = Profilestring(dir_photos + fichier_config_neotess, "messages_types", "lieu_" + string(v_numero_message), "")
	
			// Construction de la requete
			v_salle_diffusion =  Profilestring(dir_photos + fichier_config_neotess, "messages_types", "salle_" + string(v_numero_message), "1")
			if v_salle_diffusion = "1" or v_salle_diffusion = "2" then 
				commande = "callPatient.jsp?idPatient="+string(CodePatientCourant)+"&firstname=" + v_debut + "&lastname=" + ""+"&destinationRoom=" + v_lieu + "&idWaitingRoom=" + v_salle_diffusion +"&singleDisplay=false&complement=" + v_est_appelle
				envoi_commande(commande)
			else
				// Envoi sur les 2 Salles
				v_salle_diffusion = "1"
				commande = "callPatient.jsp?idPatient="+string(CodePatientCourant)+"&firstname=" + v_debut + "&lastname=" + ""+"&destinationRoom=" + v_lieu + "&idWaitingRoom=" + v_salle_diffusion +"&singleDisplay=false&complement=" + v_est_appelle
				envoi_commande(commande)
				v_salle_diffusion = "2"
				commande = "callPatient.jsp?idPatient="+string(CodePatientCourant)+"&firstname=" + v_debut + "&lastname=" + ""+"&destinationRoom=" + v_lieu + "&idWaitingRoom=" + v_salle_diffusion +"&singleDisplay=false&complement=" + v_est_appelle
				envoi_commande(commande)
			end if
		end if
		
	end if
	
end if
	

end subroutine

public function string get_salle_diffusion ();string v_retour

// renvoie la salle
v_retour = ProfileString(dir_photos + fichier_config_neotess, "messages", "salle_diffusion", "1")

return v_retour
end function

public subroutine set_salle_diffusion (string salle);

// màj l'adresse IP du serveur Neotess
SetProfileString(dir_photos + fichier_config_neotess, "messages", "salle_diffusion", salle)


end subroutine

on uo_wait_and_smile.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on uo_wait_and_smile.destroy
destroy(this.st_1)
end on

type st_1 from statictext within uo_wait_and_smile
integer x = 27
integer width = 1143
integer height = 456
integer textsize = -24
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fonctions pour Wait and Smile"
boolean focusrectangle = false
end type

