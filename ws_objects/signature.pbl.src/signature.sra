$PBExportHeader$signature.sra
$PBExportComments$Generated Application Object
forward
global type signature from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables


// Pour passage de pramètre Word


constant string param_inter_proc = "HKEY_LOCAL_MACHINE\SOFTWARE\Arakis\Power ORTHOkis"
constant string var1 = "var1"
constant string var2 = "var2"
constant string var3 = "var3"
constant string var4 = "var4"
constant string var5 = "var5"
constant string var6 = "var6"
constant string var7 = "var7"
constant string var8 = "var8"
constant string var9 = "var9"
constant string var10 = "var10"				// Vaudra 1 pour ticket de RDV, 0 sinon
constant string var11 = "var11"				// Contiendra le nom de l'imprimante pour le ticket de rdv
constant string var12 = "var12"				// Contiendra le nom de du fichier pour la mise en premier plan
constant string var13 = "var13"				// Contiendra le code du patient
constant string var14 = "var14"				// Contiendra le code du user
constant string var16 = "var16"				// Contiendra la publication pour le patient
constant string var17 = "var17"				// Contiendra la publication pour le correspondant



string dir_ini							// Dossier d'installation d'Orthokis

constant string	win_Delimiter = "\"

string utilisateur_code

// pour la trace
Integer Fichier_trace
boolean trace

end variables

global type signature from application
string appname = "signature"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 19.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = true
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "signature.ico"
string appruntimeversion = "25.0.0.3683"
boolean manualsession = false
boolean unsupportedapierror = false
boolean ultrafast = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
long webview2distribution = 0
boolean webview2checkx86 = false
boolean webview2checkx64 = false
string webview2url = "https://developer.microsoft.com/en-us/microsoft-edge/webview2/"
integer highdpimode = 0
end type
global signature signature

type prototypes
FUNCTION boolean GetComputerNameA(ref string cname, ref long nbuf) LIBRARY "Kernel32.dll" alias for "GetComputerNameA;Ansi"	// return true si  ok

end prototypes

type variables

end variables

on signature.create
appname="signature"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on signature.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;// Programme pour stocker le fichier PDF à la suite d'une signature numérique
//
// - Copie du fichier PDF dans le dossier du patient
// - Ajout d'un enregistrement dans l'historique des dossiers d'un patient
//
// Par sécurité, ne fonctionne qu'avec l'argument "signature" passé en paramètre par orthokis (pour éviter des double clic dessus)
//

string commande_en_parametre
string inifile_orthokis

commande_en_parametre = trim(upper(CommandParm()))

if commande_en_parametre = "SIGNATURE"  then
	// C'est good !!
	
	
	// Lecture de la base de registre pour savoir ...
	
	// On va chercher le répertoire d'installation d'ORTHOkis
	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)

	if dir_ini = '' or isnull(dir_ini) then
		dir_ini = "c`\powe\ortho\"
	else
		// Il faut prendre le premier chemin, avant le ";"
		if pos(dir_ini,";") > 0 then
			dir_ini = left(dir_ini, pos(dir_ini,";") - 1)
		end if
		dir_ini = dir_ini + "\"
	end if

	inifile_orthokis = "Orthokis.ini"

	
	// Connection à la base de données ...
	
	//Prépa transaction pour la base ORTHOKIS
	SQLCA.DBMS 			= "ODBC"
	SQLCA.database 	= "Orthokis"
	SQLCA.userid 		= "dba"
	SQLCA.dbpass 		= "SQL"
	SQLCA.autocommit 	= false
	SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"

	// Source de données sélectionnée cabinet ou locale ?
	
	// On regarde comment on s'est connecté la dernière fois !
	if profilestring(dir_ini+inifile_orthokis,"replication","connexion_distante","N")  = "O" then
		// Locale
		SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis_local'"
	else
		SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis'"
	end if

	CONNECT;	//connection

	//************************ Connection à la base ************************//
	
	If SQLCA.sqlcode <> 0 Then
		//erreur de connection
		Choose Case SQLCA.sqlcode 	//laquelle ?
			case 999
				messagebox("Connection Impossible !","Veuillez vérifier votre configuration ODBC")
			case -80
				messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier que votre serveur de base de données Orthokis fonctionne")
			case -83
				messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier votre cablage réseau")
			case else
				messageBox("Impossible de se connecter à la base de données. Erreur n° " +string(SQLCA.sqldbcode) ,"Veuillez vérifier votre configuration ODBC ou votre cablage réseau")
		end choose
		
		Messagebox("ATTENTION","Le document n'a pas pu être mémorisé dans le dossier du patient !")
	else
		// On est connecté !!!
		
	
		// Var8 : contient le nom du fichier .doc (ou docx) qui est à l'origine du document => on nommera le PDF de la même manière
		// var13 : contient le code du patient pour lequel le courrier est fait
		// var14 : contient le code du user
		
		double var_code_local
		string var_code_local_string, var_fichier_word_complet, var_fichier_word_sans, var_fichier_pdf_complet
		string var_fichier_temporaire_pdf
		string var_utilisateur_code
		string v_publication, v_publication_c
		string v_modele_nom_document, v_modele_dossier, dir_courriers, v_modele_nom_document_sans_extension
		integer v_id_categorie
		string  dir_photos_patient
		// pour les traces
		trace = true
		
		if TRACE then
			// Ouverture d'un fichier TRACE
			Fichier_Trace = FileOpen(dir_ini + "\Trace_Signature.txt", LineMode! , Write!, LockWrite! , Replace!, EncodingANSI! )
		end if

		trace(" === Début Signature ===")

		// Recup du code patient
		var_code_local_string = Profilestring(dir_ini+inifile_orthokis,"Macros",var13 , "" )
		
		trace("Code patient : " + var_code_local_string )
		
		
		var_code_local = double(var_code_local_string)
		
		// recup du docu Word
		var_fichier_word_complet = Profilestring(dir_ini+inifile_orthokis,"Macros",var8 , "" )
		var_fichier_word_complet = trim(var_fichier_word_complet)

		// Recup user Orthokis
		//RegistryGet(param_inter_proc, var14, RegString!, var_utilisateur_code ) 
		utilisateur_code = Profilestring(dir_ini+inifile_orthokis,"Macros",var14 , "" )	// Utile pour fxg_enregcourriershisto
		
		// Recup publication ou pas Patient
//		RegistryGet(param_inter_proc, var16, RegString!, v_publication ) 
		v_publication = Profilestring(dir_ini+inifile_orthokis,"Macros",var16 , "" )
		
		trace("v_publication patient : " + v_publication )


		// Recup publication ou pas correspondant
		v_publication_c = Profilestring(dir_ini+inifile_orthokis,"Macros",var17 , "" )
		
		trace("v_publication correspondant : " + v_publication_c )
		
		// Recherche de l'extension pour ne garder que le fichier sans extension
		var_fichier_word_sans = left( var_fichier_word_complet, len(var_fichier_word_complet) - len( gfx_extraire_extension_fichier(var_fichier_word_complet)) - 1)
		
		var_fichier_pdf_complet = var_fichier_word_sans + ".pdf"
		

		var_fichier_temporaire_pdf = dir_ini + "signature_tmp.pdf"

		// Copie du fichier 
		if FileCopy(var_fichier_temporaire_pdf, var_fichier_pdf_complet, true) = 1 then

			// Mémorisation en base de données 
			trace("Mémorisation du document : " + var_fichier_pdf_complet )
			
			//v_modele_nom_document = gfx_fichier_sans_extension( Profilestring(dir_ini+inifile_orthokis,"Macros",var3 , "" ))
			
			// depuis 2024 on ne se sert que de var_fichier_word_complet pour déuire le modèle
			dir_photos_patient = profilestring(dir_ini + inifile_orthokis,"photos","dir","") + string(var_code_local) + "\"
			v_modele_nom_document =  mid(var_fichier_word_complet, len(dir_photos_patient) + 23)
			v_modele_nom_document_sans_extension = gfx_fichier_sans_extension( v_modele_nom_document)
			
			v_modele_dossier = Profilestring(dir_ini+inifile_orthokis,"Macros",var2 , "" )
			dir_courriers = trim(profilestring(dir_ini+inifile_orthokis,"courriers","dir",""))
			
			trace("v_modele_nom_document  : " + v_modele_nom_document )
			trace("v_modele_nom_document sans extension : " + v_modele_nom_document_sans_extension )
			trace("v_modele_dossier sans extension : " + v_modele_dossier )
			trace("dir_courriers sans extension : " + dir_courriers )

			
			select top 1 id_categorie into :v_id_categorie
			from courriers_word 
			where nom_document = :v_modele_nom_document_sans_extension and :dir_courriers + trim(isnull(dossier,'')) = :v_modele_dossier and extension in ('DOC', 'DOCX') ;

			trace("v_id_categorie : " + string(v_id_categorie) )

			fxg_enregcourrierhisto (var_code_local , 'SIGNE' , today() ,  v_modele_nom_document  ,var_fichier_pdf_complet , 'E',  v_publication, v_publication_c,  "", v_id_categorie)
					
			
		Else
			Messagebox("ERREUR","Impossible de copier le fichier Signature dans le dossier du Patient.~n~nLe document n'a pas pu être mémorisé dans le dossier du patient !~n~nFichier Source : "+var_fichier_temporaire_pdf+"~nFichier Destination : "+var_fichier_pdf_complet)
		end if
		
		trace(" === Fin Signature ===")
		if TRACE then
			// Fermeture du fichier TRACE
			FileClose( fichier_trace )
		end if

		

		DISCONNECT ;
	end if
else
	// C'est pas good !
	Messagebox("ERREUR","Ce programme ne fonctionne qu'avec Orthokis.")
end if


HALT CLOSE ;
end event

