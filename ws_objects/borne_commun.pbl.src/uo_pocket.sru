$PBExportHeader$uo_pocket.sru
forward
global type uo_pocket from userobject
end type
type st_1 from statictext within uo_pocket
end type
end forward

global type uo_pocket from userobject
integer width = 1184
integer height = 476
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event init ( )
st_1 st_1
end type
global uo_pocket uo_pocket

type variables


string repertoire_pocket

CONSTANT integer MAXIMIZED = 3
CONSTANT integer MINIMIZED = 2
CONSTANT integer NORMAL = 1
CONSTANT boolean WAIT = TRUE
CONSTANT boolean NOWAIT = FALSE


CONSTANT string fichier_param_pocket = 'param.properties'


double var_code_local

// tableau mis à jour par get_message
string resultats[2,10000]				// contiendra les résultats lus - on limite à 10000 sms analysés par jour
integer nb_resultats = 0

end variables

forward prototypes
public function string get_repertoire_pocket ()
public function integer get_erreur_fichier_log (string v_fichier, string v_texte_erreur)
public function integer get_message (string mode, string argument, boolean avec_message)
public function string get_numero_compte ()
public subroutine set_numero_compte (string v_compte)
public subroutine set_repertoire_pocket (string v_repertoire)
public function string get_id_new_message ()
public function integer send_message (string v_numero, string v_message)
public function string conversion_utf8 (string v_chaine)
public function integer get_erreur_fichier_txt (string v_fichier, ref string v_num_erreur, ref string v_texte_erreur)
public subroutine set_host (string v_host)
public function string get_host ()
public function boolean is_dentalsms ()
public subroutine get_liste_codes (ref datawindow dw_code)
public function integer update_planning (string v_fichier_sms, boolean b_avec_message_confirmation)
end prototypes

public function string get_repertoire_pocket ();// variable d'instance mise à jour par le constructeur
return repertoire_pocket
end function

public function integer get_erreur_fichier_log (string v_fichier, string v_texte_erreur);
// Interprétation d'un fichier .log  et remonter de l'erreur trouvée si ...
// 1 = erreur trouvée
// 0 sinon 

// Le fichier ne contient qu'un ligne avec le message


integer numfile

v_texte_erreur = ""

numfile = FileOpen(v_fichier, LineMode!, Read!)

if numfile > 0 then
	FileRead(numfile, v_texte_erreur)
	FileClose(numfile)
else
	return 0
end if

return 1
end function

public function integer get_message (string mode, string argument, boolean avec_message);// Interroge le status des messages 
// Si mode = "D" => pour 1 jour, argument est une date sous la forme "AAAA-MM-JJ"
// Si mode = "M" => pour 1 message donné ... argment est le code interne du message

// retourne 
// - un chiffre positif correspondant au N° d'erreur lu (101 à 105)
// - 0 si bien passé avec des résultats reçus 
// - -1 si problème
//
// La fonction affiche ses messages d'erreurs si avec_message à TRUE

integer v_retour
string commande, param
string fichier_retour
integer num_fichier_retour

if upper(mode) = "D" then
	param = "day"
else
	param = "msg"
end if

open(w_patience)
 

commande = repertoire_pocket + 'getmessage.exe "' + param + '" "' + argument +'"'

// Pour lancement exe java
OleObject wsh
integer li_rc

wsh = CREATE OleObject
li_rc = wsh.ConnectToNewObject( "WScript.Shell" )
li_rc = wsh.Run( commande , MINIMIZED, WAIT)
//li_rc = wsh.Run( "notepad.exe" , MINIMIZED, WAIT)

string v_num_erreur, v_message_erreur
integer v_get

// Analyse du code retour
choose case li_rc
case 0 
	// Exécution bien passé, faut analyser le fichier résultat

	fichier_retour = repertoire_pocket + "getmessage.txt"
				
	v_get = get_erreur_fichier_txt (fichier_retour, v_num_erreur, v_message_erreur ) 
	
	if v_get = 1 then
		
		// Analyse des codes retour
		if avec_message then Messagebox("ATTENTION","Une erreur N°" + v_num_erreur + " s'est produite lors de l'exécution de la commande '"+commande+"' :~n~n" + v_message_erreur)
		v_retour = integer(v_num_erreur)
	else 
		if v_get = 2 then
			// l'exécution a renvoyé des résultats => sont placés dans le tableau resultats par la fonction get_erreur_fichier_txt
			v_retour = 0
		else
			if avec_message then Messagebox("ATTENTION","Une erreur N°0 s'est produite lors de l'exécution de la commande '"+commande+"'.~n~nImpossible de décripter le message d'erreur renvoyé.")
			v_retour = -1
		end if
	end if


case -1
	// erreur dans l'éxécution ... lire le fichier .LOG
	fichier_retour = repertoire_pocket + "error_gm.log"
	v_get = get_erreur_fichier_log (fichier_retour, v_message_erreur)
	if v_get = 1 then
		if avec_message then Messagebox("ATTENTION","Une erreur N°-1 s'est produite lors de l'exécution de la commande '"+commande+"' :~n~n" + v_message_erreur)
	else
		if avec_message then Messagebox("ATTENTION","Une erreur N°-1 s'est produite lors de l'exécution de la commande '"+commande+"'.~n~nImpossible de décripter le message d'erreur renvoyé.")
	end if
	v_retour = -1
	
case 1
	// erreur dans l'écriture du fichier de sortie
	if avec_message then Messagebox("ATTENTION","Une erreur N°1 s'est produite lors de l'exécution de la commande '"+commande+"'.")
	v_retour = -1
end choose

destroy wsh

close(w_patience)

return v_retour
end function

public function string get_numero_compte ();string v_retour

// renvoie le numéro du compte configuré dans le fichier param
v_retour = ProfileString(repertoire_pocket + fichier_param_pocket, "ARAKIS", "account", "")

return v_retour
end function

public subroutine set_numero_compte (string v_compte);// mémorise le numéro du compte configuré dans le fichier param

string v_fichier_param

v_fichier_param = repertoire_pocket + fichier_param_pocket


SetProfileString(v_fichier_param, "arakis", "account", v_compte)

// on utilse pas SetProfileString car elle verrouille le fichier ...
//// Lecture / écriture
//
//string v_fichier_param, v_fichier_copie
//integer num_fichier_param, num_fichier_copie
//string ligne_lue
//
//v_fichier_param = repertoire_pocket + fichier_param_pocket
//v_fichier_copie = v_fichier_param+"2"
//
//
//// Copie du fichier original
//FileCopy(v_fichier_param, v_fichier_copie)
//
//num_fichier_copie = FileOpen(v_fichier_param, LineMode!, Write!, LockReadWrite!, Replace!)
//num_fichier_param = FileOpen(v_fichier_copie, LineMode!, Read!)
//
//// Recopie 
//
//do while FileRead(num_fichier_param, ligne_lue) > 0 
//	if left(ligne_lue, 7) = 'account' then
//		FileWrite(num_fichier_copie, "account="+v_compte)
//	else
//		FileWrite(num_fichier_copie, ligne_lue)
//	end if
//loop
//
//
//FileClose(num_fichier_param)
//FileClose(num_fichier_copie)
//
//FileCopy(v_fichier_copie, v_fichier_param)
//
//
//
end subroutine

public subroutine set_repertoire_pocket (string v_repertoire);


repertoire_pocket = v_repertoire

update param set chemin_pocket = :v_repertoire ;

if sqlca.sqlcode = 0 then 
	commit ;
else
	rollback ;
	Messagebox("ATTENTION","Une erreur s'est produite durant la mémorisation du répertoire.")
end if

end subroutine

public function string get_id_new_message ();// Renvoie une string qui servira d'ID unique à Pocket pour les messages autres que rdv

return string(today(),'yyyymmdd')+string(now(),"hhmmssffffff")	
end function

public function integer send_message (string v_numero, string v_message);
// Envoi d'un SMS à un numéro
// renvoie 1 si OK
// renvoie 0 sinon

integer v_retour
integer numfile, numfile2
string v_id_message

v_retour = 1

v_id_message = "L" + get_id_new_message()

// On élimines les " du message ... remplacés par des '
v_message = gfx_tout_remplacer(v_message, '"', "'") 

// Génération du fichier msg.txt qui va être envoyée
FileDelete(repertoire_pocket + "msg.txt")
//FileDelete(repertoire_pocket + "msgU.txt")

numfile = FileOpen(repertoire_pocket + "msg.txt", LineMode!, Write!, LockWrite!, Replace!, EncodingANSI! )

if numfile > 0 then
	
	// Remplacement des retours ligne dans le message
	constant string crlf = char(13) + char(10)
	
	v_message = gfx_tout_remplacer(v_message, char(13) + char(10), "\n")
	
	
	FileWrite(numfile, "{")
	FileWrite(numfile, '"message_id":"'  + v_id_message + '",')
	FileWrite(numfile, '"receiver":"' + v_numero + '",')
	FileWrite(numfile, '"message":"' + v_message + '"')
	
	FileWrite(numfile, "}")
	
	FileClose(numfile)
		
	
	
	
	
	// envoi effectif du message 


	
	string commande
	string fichier_retour
	integer num_fichier_retour
	
	
	open(w_patience)
	 
	
	commande = repertoire_pocket + 'sendmessage.exe "msg.txt"'
	
	// Pour lancement exe java
	OleObject wsh
	integer li_rc
	
	wsh = CREATE OleObject
	li_rc = wsh.ConnectToNewObject( "WScript.Shell" )
	li_rc = wsh.Run( commande , MINIMIZED, WAIT)

	string v_num_erreur, v_message_erreur
	integer v_get
	string v_moteur

	// Analyse du code retour
	choose case li_rc
	case 0 
		// Exécution bien passé, faut analyser le fichier résultat
	
		fichier_retour = repertoire_pocket + "sendmessage.txt"
					
		v_get = get_erreur_fichier_txt (fichier_retour, v_num_erreur, v_message_erreur ) 
		
		// Elimination des \ dans le message retour
		v_message_erreur = gfx_tout_remplacer(v_message_erreur, "\", "")
		
		if v_get = 1 then	
			
			// Analyse des codes retour
			Messagebox("ATTENTION","Une erreur N°" + v_num_erreur + " s'est produite lors de l'exécution de la commande '"+commande+"' :~n~n" + v_message_erreur)
			v_retour = 0
		else 
			if v_get = 2 then
				if is_dentalsms() then
					v_moteur = "Dental SMS"
				else
					v_moteur = "Pocket Communication"
				end if
				// l'exécution s'est bien passé
				Messagebox("ATTENTION","Le message a été correctement envoyé à " + v_moteur +".~n~nIl sera envoyé au destinataire rapidement.")
				v_retour = 1
				
				// Envoi OK .. mémo en base de données
				string v_code_praticien
				select isnull(code_praticien, '') into :v_code_praticien from patient where code = :var_code_local ;
				
				insert into historique_sms ("code_patient", "texte_message", "numero_envoi", "id_message_pocket", "date_envoi", "type_sms", "date" , "code_praticien")
				values (:var_code_local, :v_message, :v_numero, :v_id_message, getdate(), 'L' , cast(getdate() as date),  :v_code_praticien) ;
				
				if sqlca.sqlcode = 0 then
					commit ;
				else
					rollback ;
					Messagebox("ATTENTION","Une erreur s'est produite durant la mémorisation du message dans Orthokis. Cela ne remet toutefois pas en cause son acheminement vers le destinataire.")
				end if

else
				Messagebox("ATTENTION","Une erreur N°0 s'est produite lors de l'exécution de la commande '"+commande+"'.~n~nImpossible de décripter le message d'erreur renvoyé.")
				v_retour = 0
			end if
		end if

	
	case -1
		// erreur dans l'éxécution ... lire le fichier .LOG
		fichier_retour = repertoire_pocket + "error_sm.log"
		v_get = get_erreur_fichier_log (fichier_retour, v_message_erreur)
		if v_get = 1 then
			Messagebox("ATTENTION","Une erreur N°-1 s'est produite lors de l'exécution de la commande '"+commande+"' :~n~n" + v_message_erreur)
		else
			Messagebox("ATTENTION","Une erreur N°-1 s'est produite lors de l'exécution de la commande '"+commande+"'.~n~nImpossible de décripter le message d'erreur renvoyé.")
		end if
		v_retour =0
		
	case 1
		// erreur dans l'écriture du fichier de sortie
		Messagebox("ATTENTION","Une erreur N°1 s'est produite lors de l'exécution de la commande '"+commande+"'.")
		v_retour =  0
	end choose
	
	
	close(w_patience)
		

else
	Messagebox("ATTENTION",'Impossible de générer le fichier "msg.txt".'+"~n~nVeuillez vérifier les droits d'accés au dossier "+'"'+repertoire_pocket+"'.")
	v_retour = 0
end if


return v_retour




end function

public function string conversion_utf8 (string v_chaine);

// Revoie la chaine passée en param en rempplaçant les caractères spéciaux pour être conforme à Pocket

v_chaine = gfx_tout_remplacer(v_chaine, "é", "e")
v_chaine = gfx_tout_remplacer(v_chaine, "è", "e")
v_chaine = gfx_tout_remplacer(v_chaine, "ê", "e")

v_chaine = gfx_tout_remplacer(v_chaine, "â", "a")
v_chaine = gfx_tout_remplacer(v_chaine, "à", "a")

v_chaine = gfx_tout_remplacer(v_chaine, "ù", "u")

v_chaine = gfx_tout_remplacer(v_chaine, '"', '\"')
v_chaine = gfx_tout_remplacer(v_chaine, '{', '\{')
v_chaine = gfx_tout_remplacer(v_chaine, '}', '\}')
v_chaine = gfx_tout_remplacer(v_chaine, ':', '\:')

return v_chaine
end function

public function integer get_erreur_fichier_txt (string v_fichier, ref string v_num_erreur, ref string v_texte_erreur);
// Interprétation d'un fichier résultat et remonter de l'erreur trouvée si ...
// 1 = code erreur trouvée
// 2 = résultats trouvés
// 0 sinon 

integer numfile, v_retour
boolean retb

string v_id_cour, v_statut_cour

string v_ligne_lue, v_chaine_cours
long v_pos1, v_pos2, v_pos3, v_pos4
v_texte_erreur = ""

numfile = FileOpen(v_fichier, LineMode!, Read!)

// Type de message d'erreur
// {"type":"error","code":"no_ruleset","message":"Aucun jeu de règle trouvé pour traiter ce fichier."}

if numfile > 0 then
	FileRead(numfile, v_ligne_lue)
	if left(v_ligne_lue,15)  = '{"type":"error"' then
		
		// N° erreur
		v_pos1 = pos(v_ligne_lue, '"code":', 1)
		v_pos2 = v_pos1 + 9
		v_pos3 = pos(v_ligne_lue, '"', v_pos2 + 1)
		
		v_num_erreur = mid(v_ligne_lue, v_pos2 + 1, v_pos2 - v_pos1 - 1)
		
		// Message d'erreur
		v_pos4 = pos(v_ligne_lue, '"', v_pos3 + 14)
		
		v_texte_erreur = mid(v_ligne_lue, v_pos3 + 13, v_pos4 - (v_pos3 + 12) - 1)
		
		v_retour = 1
	else
		// c'est un fichier résultat
		
		// Analyse du fichier pour mettre à jour l'historique !!!
		// couple {"rdv_id", "rdv_"status"}
		
		v_chaine_cours = ""
		nb_resultats = 0
		
		do 
			v_chaine_cours = v_chaine_cours + v_ligne_lue
			v_pos1 = pos(v_chaine_cours, '"rdv_id"', 1)
			v_pos2 = pos(v_chaine_cours, '"', v_pos1 + 10)
			v_pos3 = pos(v_chaine_cours, '"rdv_status"', v_pos2)
			v_pos4 = pos(v_chaine_cours, '"', v_pos3 + 14)
			
			do while v_pos4 > 0  
				// on peut traiter, sinon on poursuit pour concatener et traiater par la suite ...
				v_id_cour = mid(v_chaine_cours, v_pos1 + 10, v_pos2 - (v_pos1 + 10))
				v_statut_cour = mid(v_chaine_cours, v_pos3 + 14, v_pos4 - (v_pos3 + 14)) 
				
				nb_resultats = nb_resultats + 1
				resultats[1, nb_resultats] = v_id_cour
				resultats[2, nb_resultats] = v_statut_cour
				
				// on raccourci la chaine		
				v_chaine_cours = mid(v_chaine_cours, v_pos4)
				
				v_pos1 = 0
				v_pos2 = 0
				v_pos3 = 0
				v_pos4 = 0
				
				
				
				v_pos1 = pos(v_chaine_cours, '"rdv_id"', 1)
				if v_pos1 > 0 then
					v_pos2 = pos(v_chaine_cours, '"', v_pos1 + 10)
					if v_pos2 > 0 then
						v_pos3 = pos(v_chaine_cours, '"rdv_status"', v_pos2)
						if v_pos3 > 0 then
							v_pos4 = pos(v_chaine_cours, '"', v_pos3 + 14)
						end if
					end if
				end if
			loop
			
			
			
		loop while 	FileRead(numfile, v_ligne_lue) > 0
			
		
		
		v_retour = 2
	end if
	
	FileClose(numfile)
	
else
	v_retour = 0
end if

return v_retour

end function

public subroutine set_host (string v_host);// mémorise le numéro du compte configuré dans le fichier param

string v_fichier_param

v_fichier_param = repertoire_pocket + fichier_param_pocket


SetProfileString(v_fichier_param, "arakis", "host", v_host)

// on utilse pas SetProfileString car elle verrouille le fichier ...
//// Lecture / écriture
//
//string v_fichier_param, v_fichier_copie
//integer num_fichier_param, num_fichier_copie
//string ligne_lue
//
//v_fichier_param = repertoire_pocket + fichier_param_pocket
//v_fichier_copie = v_fichier_param+"2"
//
//
//// Copie du fichier original
//FileCopy(v_fichier_param, v_fichier_copie)
//
//num_fichier_copie = FileOpen(v_fichier_param, LineMode!, Write!, LockReadWrite!, Replace!)
//num_fichier_param = FileOpen(v_fichier_copie, LineMode!, Read!)
//
//// Recopie 
//
//do while FileRead(num_fichier_param, ligne_lue) > 0 
//	if left(ligne_lue, 7) = 'account' then
//		FileWrite(num_fichier_copie, "account="+v_compte)
//	else
//		FileWrite(num_fichier_copie, ligne_lue)
//	end if
//loop
//
//
//FileClose(num_fichier_param)
//FileClose(num_fichier_copie)
//
//FileCopy(v_fichier_copie, v_fichier_param)
//
//
//
end subroutine

public function string get_host ();string v_retour

// renvoie le numéro du compte configuré dans le fichier param
v_retour = ProfileString(repertoire_pocket + fichier_param_pocket, "ARAKIS", "host", "http://78.193.46.115:8888/postmobile/courrielsms/index.php")

return v_retour
end function

public function boolean is_dentalsms ();// Renvoi true ou false selon que l'url est celle de Dental SMS

string url 

url = upper(get_host())

if url = upper("https://api-sms.arakis.fr") or url = upper("https://api-sms-dev.arakis.fr") then
	return true
else
	return false
end if

end function

public subroutine get_liste_codes (ref datawindow dw_code);// Génère une table temporaire contenant la liste des codes SMS


integer v_retour
string commande, param
string fichier_retour, fichier_retour2
string ligne_lue, ligne_ecrite, ligne_suivante_lue
integer num_fichier_retour, num_fichier_retour2

if fileExists(repertoire_pocket + 'getmessage.exe') then 

	open(w_patience)
	 
	
	commande = repertoire_pocket + 'getmessage.exe  modeles '
	
	// pour la conversion utf8->Ansi car souci avec la fonction générale en v2024
	uo_lire_eid_belgique uo_eid
	
	uo_eid = create uo_lire_eid_belgique
	
	// Pour lancement exe java
	OleObject wsh
	integer li_rc
	
	wsh = CREATE OleObject
	li_rc = wsh.ConnectToNewObject( "WScript.Shell" )
	
	li_rc = wsh.Run( commande , MINIMIZED, WAIT)
	
	string v_num_erreur, v_message_erreur
	integer v_get, nb_code, cpt, v_code, p1, p2
	string v_nom, v_texte, v_texte2
	blob v_nom_lbl
	
	// On ne gère pas les erreurs
	commande = 'CREATE LOCAL TEMPORARY TABLE "code_sms" ("code" double NOT NULL DEFAULT 0, "nom" char(40) DEFAULT null , "texte" varchar(1000) DEFAULT null , PRIMARY KEY ("code"))  ON COMMIT PRESERVE ROWS  ;'
	execute immediate :commande ;
	
	if sqlca.sqlcode <> 0 then
		Messagebox("ATTENTION !", "Erreur dans la création de la table temporaire :~n~n" + sqlca.sqlerrtext)
	else
			
		
		
		// Exécution bien passé, faut analyser le fichier résultat
		
		fichier_retour = repertoire_pocket + "getmessage.txt"
		fichier_retour2 = repertoire_pocket + "getmessage2.txt"
		
		// Premier passage pour les messages qui peuvent avec les LF ( char(10))
		// On vire les LF et on les remplace par un %%% ... on remettra les LF une fois lu par ProfileString
		
		num_fichier_retour = FileOpen(fichier_retour , linemode!, read!) 
		num_fichier_retour2 = FileOpen(fichier_retour2 , linemode!, write!, lockreadwrite!, replace!) 
		
		do while FileRead(num_fichier_retour, ligne_lue) > 0
			
			if left(ligne_lue,8) = "Texte = " then
				// on est dans une rubrique texte => y a il une suite ou pas .. si non ... ok ... si oui, faut traiter
				if FileRead(num_fichier_retour, ligne_suivante_lue) > 0 then
					if left(ligne_suivante_lue, 1) = "[" then 
						// la ligne suivante est une rubrique => 1 ligne de texte => rien à faire 
						FileWrite (num_fichier_retour2, ligne_lue)
						FileWrite (num_fichier_retour2, ligne_suivante_lue)
					else
						// Faut traiter jusqu'à la rubrique suivante
						ligne_ecrite = ligne_lue + "%%%" + ligne_suivante_lue 
						do while  FileRead(num_fichier_retour, ligne_lue) > 0 and left(ligne_lue, 1) <> "[" 
							ligne_ecrite = ligne_ecrite + "%%%" + ligne_lue  
						loop
						FileWrite (num_fichier_retour2, ligne_ecrite)
						if left(ligne_lue, 1) = "[" then
							FileWrite (num_fichier_retour2, ligne_lue)
						end if
					end if
					
				end if
				
			else
				// on écrit direct
				FileWrite (num_fichier_retour2, ligne_lue)
			end if
			
		loop
		
		FileClose (num_fichier_retour)
		FileClose (num_fichier_retour2)
		
		
		fichier_retour = fichier_retour2
		
		nb_code = ProfileInt(fichier_retour , "textes", "nb", 0 )
		
		
		for cpt = 1 to nb_code
			
			v_code = ProfileInt(fichier_retour , string(cpt), "code", 0 )
			v_nom = ProfileString(fichier_retour , string(cpt), "title", "")
			v_texte = ProfileString(fichier_retour , string(cpt), "texte", "?")
		
			//v_nom_lbl = blob(v_nom, encodingUTF8! )
			//v_nom = String(v_nom_lbl, EncodingANSI!)
		
			//v_nom_lbl = blob(v_nom, EncodingUTF16LE! )
			//v_nom = String(v_nom_lbl, EncodingUTF16LE!)
		
//			v_nom = fxg_utf8_to_ansi (v_nom)
//			v_texte = fxg_utf8_to_ansi (v_texte)

			v_nom = uo_eid.convert_utf8_to_ansi (v_nom)
			
			v_texte = uo_eid.convert_utf8_to_ansi (v_texte)
			
			v_texte2 = gfx_tout_remplacer (v_texte , "%%%",  char(13) + char(10) )
			
			insert into code_sms (code, nom, texte) 
			values (:v_code, :v_nom , :v_texte2) ;
			
			
		next
			
		commit ;
			
		dw_code.settransobject(sqlca)
		dw_code.retrieve()
	
	
		commande = 'DROP TABLE "code_sms" ;'
		execute immediate :commande ;
	
	end if
	
	close(w_patience)

else
	Messagebox("ERREUR","Impossible de récupérer la liste des messages !")
end if
//return v_retour
end subroutine

public function integer update_planning (string v_fichier_sms, boolean b_avec_message_confirmation);
// Envoi d'un SMS à un numéro
// renvoie 1 si OK
// renvoie 0 sinon

integer v_retour
integer numfile, numfile2
string v_id_message

v_retour = 1

string commande
string fichier_retour
integer num_fichier_retour


if not PLANIFICATION_EN_COURS then
	open(w_patience)
end if
 

commande = repertoire_pocket + 'updateplanning.exe "' + trim(v_fichier_sms) + '" "false"'

// Pour lancement exe java
OleObject wsh
integer li_rc

wsh = CREATE OleObject
li_rc = wsh.ConnectToNewObject( "WScript.Shell" )


li_rc = wsh.Run( commande , MINIMIZED, WAIT)

//messagebox("test","test")


string v_num_erreur, v_message_erreur
integer v_get

// Analyse du code retour
choose case li_rc
case 0 
	// Exécution bien passé, faut analyser le fichier résultat

	fichier_retour = repertoire_pocket + "updateplanning.txt"
				
	v_get = get_erreur_fichier_txt (fichier_retour, v_num_erreur, v_message_erreur ) 
	
	// Elimination des \ dans le message retour
	v_message_erreur = gfx_tout_remplacer(v_message_erreur, "\", "")
	
	if v_get = 1 then	
		
		// Analyse des codes retour
		if not PLANIFICATION_EN_COURS then
			Messagebox("ATTENTION","Une erreur N°" + v_num_erreur + " s'est produite lors de l'exécution de la commande '"+commande+"' :~n~n" + v_message_erreur)
		else
			fxg_ajout_journal_planification("SMS", "Une erreur N°" + v_num_erreur + " s'est produite lors de l'exécution de la commande '"+commande )
		end if

		v_retour = 0
	else 
		if v_get = 2 then
			// l'exécution s'est bien passé
			string v_moteur
			if not PLANIFICATION_EN_COURS then
				if is_dentalsms() then
					v_moteur = "Dental SMS"
				else
					v_moteur = "Pocket Communication"
				end if
				if b_avec_message_confirmation then
					Messagebox("ATTENTION","Le fichier a été correctement envoyé à " + v_moteur +".~n~nIl sera traité rapidement.")
				end if
			end if
			v_retour = 1
			
		
		else
			if not PLANIFICATION_EN_COURS then
				Messagebox("ATTENTION","Une erreur N°0 s'est produite lors de l'exécution de la commande '"+commande+"'.~n~nImpossible de décripter le message d'erreur renvoyé.")
			else
				fxg_ajout_journal_planification("SMS", "Une erreur N°0 s'est produite lors de l'exécution de la commande '"+commande )
			end if
			v_retour = 0
		end if
	end if


case -1
	// erreur dans l'éxécution ... lire le fichier .LOG
	fichier_retour = repertoire_pocket + "error_up.log"
	v_get = get_erreur_fichier_log (fichier_retour, v_message_erreur)
	if not PLANIFICATION_EN_COURS then
		if v_get = 1 then
			Messagebox("ATTENTION","Une erreur N°-1 s'est produite lors de l'exécution de la commande '"+commande+"' :~n~n" + v_message_erreur)
		else
			Messagebox("ATTENTION","Une erreur N°-1 s'est produite lors de l'exécution de la commande '"+commande+"'.~n~nImpossible de décripter le message d'erreur renvoyé.")
		end if
	else 
		fxg_ajout_journal_planification("SMS", "Une erreur N°-1 s'est produite lors de l'exécution de la commande '"+commande )
	end if
	v_retour =0
	
case 1
	// erreur dans l'écriture du fichier de sortie
	if not PLANIFICATION_EN_COURS then
		Messagebox("ATTENTION","Une erreur N°1 s'est produite lors de l'exécution de la commande '"+commande)
	else
		fxg_ajout_journal_planification("SMS", "Une erreur N°1 s'est produite lors de l'exécution de la commande '"+commande )
	end if
	v_retour =  0
end choose


if not PLANIFICATION_EN_COURS then
	close(w_patience)
end if

return v_retour




end function

on uo_pocket.create
this.st_1=create st_1
this.Control[]={this.st_1}
end on

on uo_pocket.destroy
destroy(this.st_1)
end on

event constructor;// Lecture de la base pour mise à  jour dossier pocket
select top 1 isnull(chemin_pocket,'') into :repertoire_pocket from param ;


//messagebox("trace constructor", repertoire_pocket)

 

end event

type st_1 from statictext within uo_pocket
integer x = 46
integer y = 56
integer width = 1019
integer height = 324
integer textsize = -24
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fonctions pour Pocket"
boolean focusrectangle = false
end type

