$PBExportHeader$uo_lien_word.sru
forward
global type uo_lien_word from nonvisualobject
end type
type pourhistocourrier from structure within uo_lien_word
end type
end forward

type pourhistocourrier from structure
	double		numpatient
	string		typedoc
	string		libelle
	long		numcourrier
	string		chemin_courrier
end type

global type uo_lien_word from nonvisualobject
end type
global uo_lien_word uo_lien_word

type prototypes



end prototypes

type variables
// la var indispensable !
oleobject wrd	// pour connexion Word

// le nom du fichier d'export :
// le lien word passe par un export des données de la base orthokis vers un fichie .txt
// puis sous word on se connect à c .txt pour récup les données
constant	string nom_source = "export.dat"

// nom du fichier photo vide
// permet d'éliminer les msg d'erreur en cas d'enregistrement photo vide
constant string fichier_photo_vide = "Vide.bmp"

// macro à exécuter,
// afin d'optimiser la rapidité d'éxécution on limite les appel inter-processus
// (càd les appels de fonctions word à travers pbuilder)
constant string macro_LienWORD = "LienORTHOkis.main_module.LienWORD"
constant string macro_CLoseDocGene = "LienORTHOkis.main_module.CloseDocGenere"
constant string macro_Sauvegarde = "LienORTHOkis.main_module.Sauvegarde_Individelle"

// si des paramétres sont nécessaires d'un processus à l'autre (de pwo vers word )
// on passe par la base de registre (permet de contourner le pb rencontré (bug ?) à
// l'utilisation de la commande WORD application.run)

constant string param_inter_proc = "HKEY_LOCAL_MACHINE\SOFTWARE\Arakis\Power ORTHOkis"
constant string var1 = "var1"				// N° du service
constant string var2 = "var2"				
constant string var3 = "var3"
constant string var4 = "var4"
constant string var5 = "var5"
constant string var6 = "var6"
constant string var7 = "var7"
constant string var8 = "var8"
constant string var9 = "var9"
constant string var10 = "var10"				// Vaudra 1 pour ticket de RDV, 0 sinon (idem pour FS2014)
constant string var11 = "var11"				// Contiendra le nom de l'imprimante pour le ticket de rdv, mais pas que
constant string var12 = "var12"				// Contiendra le nom de du fichier pour la mise en premier plan

constant string var13 = "var13"				// Contiendra le code du patient
constant string var14 = "var14"				// Contiendra le code de l'utilisateur
constant string var15 = "var15"				// Contiendra O ou N pour savoir s'il faut mettre à jour ou pas les images 2013
constant string var16 = "var16"				// Copie_PDF O/N .. pour savoir si on mémorise le fichier généré en PDF dans le dossier du patient et publication portail patient
constant string var17 = "var17"				// Copie_PDF_correspondant O/N .. pour savoir si on mémorise le fichier généré en PDF dans le dossier du patient et publication dans le portail correspondant
constant string var18 = "var18"				// Contiendra le nombre de signatures détectées dans le document (
constant string var19 = "var19"				// Catégorie du document : exploité en cas de signature en ligne du document (enchainée)


// pour la construction des fichiers d'exports
constant	string	ltab = "~t"

// pour la création de nouveau courrier
// PRINCIPE : ds le rep dinstal de pwo, on a un fichier word vierge
// dont l'extention est camouflé -> nouvelle extention .mwo (pour Modèle Word Orthokis)
// il suffit donc de copier coller ce fichier ds le rep courrie et chnager son extension
constant string	modele_de_doc_vierge = "Initdoc_vierge.mwo"

// nom de sauvegarde du fichier générer par word une fois le mailmerge réaliser
// utile pour dispatcher le dit courrier en autant de courrier différent ds les rep photos des patients
constant	string	prefixe_courrier_generer_temp = "tempgen_"

// noms des champs supplémentaires pour courrier appel_honoraires
constant string appel_honoraires_export = "~t&
montant_a_regler_euros~t&
montant_a_regler_francs~t&
date_echeance~t&
nom_du_soin~t&
numero_du_soin"

// noms des champs supplémentaires pour courrier relance
constant string relance_export = "~t&
somme_due_euro~t&
somme_due_francs~t&
date_derniere_echeance_impayee~t&
date_prochain_rdv"

// noms des champs supplémentaires pour courrier report_rdv
constant string report_rdv_export = "~t&
date_rdv_manque"

// noms des champs supplémentaires pour courrier renouvellement
constant string renouvellement_export = "~t&
date_demande_soin~t&
nb_lettres_soin~t&
montant_soin~t&
libelle_soin~t&
numero_soin"

// noms des champs supplémentaires pour courrier de rdv manqué
constant string rdv_manque_export = "~t&
rdv_manque_date~t&
rdv_manque_type~t&
rdv_manque_duree"


// noms des champs supplémentaires pour ticket de rdv
constant string ticket_rdv_export = "~t&
ticket_rdv1~t&
ticket_rdv2~t&
ticket_rdv3~t&
ticket_rdv4~t&
ticket_rdv5~t&
ticket_rdv6~t&
ticket_commentaire_rdv1~t&
somme_due_date_rdv"

// noms des champs supplémentaires pour ERNOULT
constant string ernoult_export = "~t&
JFE_RESUM_DIAG_P1~t&
JFE_EXAM_FONC_P1~t&
JFE_RESUM_PLT_P1~t&
JFE_RESUM_CEPHAL_P1~t&
JFE_RESUM_DIAG_P2~t&
JFE_EXAM_FONC_P2~t&
JFE_RESUM_PLT_P2~t&
JFE_RESUM_CEPHAL_P2~t&
JFE_RESUM_DIAG_P3~t&
JFE_EXAM_FONC_P3~t&
JFE_RESUM_PLT_P3~t&
JFE_RESUM_CEPHAL_P3~t&
JFE_RESUM_DIAG_P4~t&
JFE_EXAM_FONC_P4~t&
JFE_RESUM_PLT_P4~t&
JFE_RESUM_CEPHAL_P4"

// noms des champs supplémentaires pour BALASTRE
constant string balastre_export = "~t&
BALA_TEMPS_DE_TRAITEMENT~t&
BALA_OCCLUSION_MOLAIRE~t&
BALA_OCCLUSION_CANINE~t&
BALA_DENTS_SAGESSE~t&
BALA_COOPERATION~t&
BALA_HYGIENE_BUCCO~t&
BALA_DEGLUTITION"



end variables

forward prototypes
public function string string_tabulation (string lstr)
public function string generer_photos_pour_patient (long lnum_patient, string lchemin_photos)
public function integer make_new_doc (string chemin_complet_courrier)
public function string get_word_version ()
public function string generer_champs_photos (string str_rep_photos)
public function long read_ligne (readonly integer int_num_file, ref boolean b_autres_lignes, ref string str_return)
public function string generer_nom_fichier_export (string nom_fichier)
public function integer quit_word ()
public function integer write_param_inter_proc (string lvar1, string lvar2, string lvar3, string lvar4, string lvar5, string lvar6)
public function boolean get_sauvegarder_courrier ()
public function integer close_courrier (string nom_courrier)
public function integer open_courrier (string chemin_complet, boolean visible)
private function integer lancer_une_macro (string nom_macro)
public function string get_courrier (integer ltype_courrier)
public function integer lien_word (integer service, ref string chemin_courrier, ref string nom_courrier, integer num_courrier, ref pourhistocourrier phc[])
public function integer traiter_export_txt (integer type_courrier, string nom_fichier)
public function integer traiter_export_txt (integer lservice, string nom_fichier[], ref datawindow ldw, string chemin_fichier[], long ltab_patients[])
public function integer open_connection_word ()
public function integer close_connection_word ()
public function integer traiter_avec_word (integer lservice, string nom_fichier[], ref datawindow ldw, string chemin_fichier[], boolean patient_courant)
public function integer traiter_avec_word (integer lservice, string chemin_fichier, string nom_fichier, boolean patient_courant)
public function integer traiter_avec_word (integer lservice, string nom_fichier, ref datawindow ldw, string chemin_fichier, boolean patient_courant)
public function integer traiter_avec_word (integer lservice, string nom_fichier[], ref datawindow ldw, string chemin_fichier[])
public function integer witch_lettre (string lnom_fichier, string lchemin_fichier)
public function integer word_en_avant_plan (integer numero_variable)
public subroutine mettre_word_en_avant_plan (integer numero_variable)
public subroutine ferme_document_genere ()
public subroutine ajout_champs_ernoult (double v_code_cherche, ref string tab_elem_recup[], string lstr_espacement)
public subroutine ajout_champs_balastre (double v_code_cherche, ref string tab_elem_recup[], string lstr_espacement)
public function integer word_en_avant_plan_2016 ()
public subroutine ajout_champs_erasme (double v_code_cherche, ref string tab_elem_recup[], string lstr_espacement)
public function string nom_des_dents (string champ)
end prototypes

public function string string_tabulation (string lstr);// fx qui return une string avec autant de tabulations enchainées
// que la string passée en param qui comporte aussi d'autres caractères
// -> utilisé pour l'édition des courrier (permet d'avoir 1 ligne avec que des
// 	valeurs vides
// return une chaine vide si pb ou pas de tabulation ds string en param

integer	i
long		len_string
string	return_string = ""


// recup de la longeur de la string en param
len_string = len(lstr)

if len_string >= 1 then
// si il y a au moins un caractère
	for i = 1 to len_string
	// pour chacun des caractères
		// si c une tabulation -> on en rajoute une à "return_string"
		if mid(lstr, i, 1) = "~t" then return_string += "~t"
	next
	
end if

return return_string
end function

public function string generer_photos_pour_patient (long lnum_patient, string lchemin_photos);// fx qui selon le num patient passé en param construit la ligne
// des chemins photos séparé par des tabulations
// si le chemin photo n'est pas valide = string vide

string	nom_fichier
string	return_str = ""
date v_date_image
string nom_fichier_sans_chemin

// On récupère les x image_courantes et la date_courant inscrite dans ORTHOKIS.INI
// On les mets en début de liste
string photo_courante , Date_Image_Courante
integer cpt_courante
string commentaire_image_courante

for cpt_courante = 1 to nb_photos_courantes
	
	photo_courante = ProfileString(dir_ini+inifile_orthokis,"PHOTOS","Photo_Courante" + string(cpt_courante) ,"")
	Date_Image_Courante = ProfileString(dir_ini+inifile_orthokis,"PHOTOS","Date_Image_Courante" + string(cpt_courante) , "")
	Commentaire_Image_Courante = ProfileString(dir_ini+inifile_orthokis,"PHOTOS","commentaire_image_courante" + string(cpt_courante) , "")

	nom_fichier = photo_courante
	
	// Vérifie que la photo soit bien du patient !!!
	string dossier_du_patient
	dossier_du_patient = lchemin_photos + string(lnum_patient) + win_delimiter
	
	if fxg_FileExists(nom_fichier) and gfx_extraire_path_fichier(nom_fichier) = dossier_du_patient then
		// si la photo existe
		// on rajoute a la string de retour une tabulation
		// puis la string formatée
		return_str += ltab + '""' + fxg_dir_2_format_dir(nom_fichier) + '""'
	else
		// la photo n'existe pas pour ce patient
		// on rajoute a la string de retour une tabulation
		// puis une string formatée pointant sur le fichier vide.jpg
		return_str += ltab + '""' + fxg_dir_2_format_dir(dir_ini + fichier_photo_vide) + '""'
	end if
	
	// ajout de la date_courante et du commentaire
	return_str += ltab +  Date_Image_Courante + ltab +  Commentaire_Image_Courante 
	
next
//-----------------------------------------------------------------------------------------------------

if fxg_FileExists(lchemin_photos) and not imagerie_2013 then
	// si le chemin photo est valide (on se fou de savoir si ok 
	// pour présence pwophoto puisqu'ici on ne s'en sert pas !)

	// déclaration d'un curseur pour les photos ARAKIS
	declare	param_photos_arakis cursor for
	select	nom_fichier
	from 		param_photos
	where		type_photo = '1';

	// déclaration d'un curseur pour les photos cliniques
	declare	param_photos cursor for
	select	nom_fichier
	from 		param_photos
	where		type_photo = '2';

	
	// On va faire 2 passe ... une pour les photos admini, l'autre pour les photos cliniques
	integer cpt_boucle 
	for cpt_boucle = 1 to 2
	
	
	if cpt_boucle = 1 then 
		// ouverture du curseur
		OPEN param_photos_arakis ;
		// on lit la première ligne
		FETCH param_photos_arakis INTO :nom_fichier_sans_chemin ;
	else
		// ouverture du curseur
		OPEN param_photos ;
		// on lit la première ligne
		FETCH param_photos INTO :nom_fichier_sans_chemin ;
	end if
	
	
	do while SQLCA.sqlcode = 0
	// faire tant que pas fin du curseur
		// construction chemin fichier complet
		
		nom_fichier = lchemin_photos + string(lnum_patient) + win_delimiter + nom_fichier_sans_chemin
		
		if fxg_FileExists(nom_fichier) then
		// si la photo existe
			// on rajoute a la string de retour une tabulation
			// puis la string formatée
			return_str += ltab + '""' + fxg_dir_2_format_dir(nom_fichier) + '""'
			
			SetNull(v_date_image)
			
			// Recherche de la date de l'image
			select  min(date_acquis) into :v_date_image from  images_infos 
			where code = :lnum_patient and nom_fichier = :nom_fichier_sans_chemin ;
			
			if not isnull(v_date_image) then
				return_str += ltab + string(v_date_image) 
			else
				// pour la date de l'image, on ajoute une chaine vide
				return_str += ltab + '""' 
			end if
			
			
		else
			// la photo n'existe pas pour ce patient
			// on rajoute a la string de retour une tabulation
			// puis une string formatée pointant sur le fichier vide.jpg
			return_str += ltab + '""' + fxg_dir_2_format_dir(dir_ini + fichier_photo_vide) + '""'
			
			// pour la date de l'image, on ajoute une chaine vide
			return_str += ltab + '""' 
			
		end if
		
		if cpt_boucle = 1 then
			// on lit la ligne suivante
			FETCH param_photos_arakis INTO :nom_fichier_sans_chemin ;
		else
			// on lit la ligne suivante
			FETCH param_photos INTO :nom_fichier_sans_chemin ;
		end if
	loop
	
	
	if cpt_boucle = 1 then
		// fermeture du curseur
		CLOSE param_photos_arakis ;
	else
		// fermeture du curseur
		CLOSE param_photos ;
	end if
	
next
end if

return return_str
end function

public function integer make_new_doc (string chemin_complet_courrier);// fx qui va créer un nouveau courrier type
// dont le chemin complet est passé en param 
// renvoie	1 si ok
//				0 si fichier existe dèjà
//				-1 si pb

int	return_val = 1


if fxg_FileExists(chemin_complet_courrier) then
// si le fichier exsite déjà
	return_val = 0
else
// le courrier n'existe pas encore
	// on le crée -> on le copie du rep d'installation tout en le renomant
	// avec la bonne extention
	if FileCopy(dir_ini + modele_de_doc_vierge, chemin_complet_courrier, true) = 0 then
	// un pb durant la copie
		return_val = -1
	end if
end if

return return_val
end function

public function string get_word_version ();// fx qui renvoie le numéro de version de word
string v
v = wrd.Application.Version
string b
b = v
//return wrd.Application.Version
return v
end function

public function string generer_champs_photos (string str_rep_photos);// fx qui renvoie une string composée de tout les noms des champs photos de la table param_photos
// séparés par des tabulations (à noter : une tabulation commance la string)

string	nom_cadre
string	return_str = ""
integer cpt_boucle
integer cpt_courante

string nom_champ_date

if fxg_FileExists(str_rep_photos) then

	// en Début de la liste des phtoos 

	 // On ajoute  nb_photos_courantes x 3 champs .. Image_courante, Date_image_courante, Commentaire_image_courante pour imprimer la photos en cours !
	
	for cpt_courante = 1 to nb_photos_courantes
		return_str += ltab + "photo_courante"+ string(cpt_courante)
		return_str += ltab + "date_image_courante"+ string(cpt_courante)
		return_str += ltab + "commentaire_image_courante"+ string(cpt_courante)
	next

	// On ajoute les cadres pour pour l'imagerie AVANT 2013
	if not imagerie_2013 then
		// uniquement si rep photo existe ...
		// déclaration d'un curseur pour les photos ARAKIS
		declare	param_photos_arakis cursor for
		select	nom_cadre
		from 		param_photos
		where		type_photo = '1';
		
		// déclaration d'un curseur pour les photos Cliniques
		declare	param_photos_clinique cursor for
		select	nom_cadre
		from 		param_photos
		where		type_photo = '2';
	
	
		for cpt_boucle = 1 to 2 
			
			if cpt_boucle = 1 then 
				// ouverture du curseur
				OPEN param_photos_arakis ;
				// on lit la première ligne
				FETCH param_photos_arakis INTO :nom_cadre ;
			else
				// ouverture du curseur
				OPEN param_photos_clinique ;
				// on lit la première ligne
				FETCH param_photos_clinique INTO :nom_cadre ;
			end if 
			
			
			do while SQLCA.sqlcode = 0
			// faire tant que pas fin du curseur
				// on rajoute a la string de retour une tabulation puis la valeur lue
				return_str += ltab + nom_cadre
				
				// On ajoute le champ date qui va correspondre au cadre
				nom_champ_date = gfx_tout_remplacer(nom_cadre , "ole_photo","date_image")
				return_str += ltab + nom_champ_date
				
				if cpt_boucle = 1 then
					// on lit la ligne suivante
					FETCH param_photos_arakis INTO :nom_cadre ;
				else
					// on lit la ligne suivante
					FETCH param_photos_clinique INTO :nom_cadre ;
				end if
			loop
			
			
			if cpt_boucle = 1 then
				// fermeture du curseur
				CLOSE param_photos_arakis ;
			else
				// fermeture du curseur
				CLOSE param_photos_clinique ;
			end if
			
			//***********************************************************************************
			
		next
		
	end if
end if

return return_str

end function

public function long read_ligne (readonly integer int_num_file, ref boolean b_autres_lignes, ref string str_return);// fx qui lit un fichier text en mode line
// le fichier est ouvert précédement (on passe ici seulement l'ID)
// return une ligne complète en prenant comme convention
// "²²" comme fin de ligne
// return chaine vide si fin de fichier

string	lstr
boolean	lb_une_ligne = false


// init string à renvoyer
str_return = ""

if not b_autres_lignes then
// si on est sur la première ligne
	// le carac de fin de ligne est forcément bon
	FileRead(int_num_file, str_return)
	
	// on enlève le dernier champ et la tabulation qui le précède
	str_return = left(str_return, len(str_return) -len("	fin_de_ligne"))
else
	DO while not lb_une_ligne
	// faire tant que pas une ligne complète
		if FileRead(int_num_file, lstr) <> -100 then
		// si on est pas encore en fin de fichier
			// on rajoute la string récup à la string de return
			str_return += lstr
			
			if right(LSTR, 2) = "²²" then
			// si on trouve notre caractère de fin à la fin de la ligne précédement lue
				// on enlève ce qui est de trop : ~t²²
				str_return = left(str_return, len(str_return) -len("	²²"))
				// on indique au booléen qu'il faut sortir de la boucle
				lb_une_ligne = true
			end if
		else
		// on est en fin de fichier : comme si une fin de ligne			
			// maj du booleen
			lb_une_ligne = true
			
		end if
	loop
	
end if

return len(str_return)

end function

public function string generer_nom_fichier_export (string nom_fichier);// fx qui construit le nom du fichier d'export final selon la nomenclature suivante
// nom_du_fichier sans L .doc + "_" + nom_du_fichier_source (soit export.txt)
// ex : 	pour un fichier de nom "mon_document.doc" passé en param
//			on a en sortie "mon_document_export.txt"

string	ltempstr

nom_fichier = trim(nom_fichier)

// pour recup que le nom du fichier, dans le nom du dossier qui peut être devabt
//nom_fichier = gfx_extraire_nom_fichier( nom_fichier )


// Test si .doc ou .dox
if right(nom_fichier, 4) = "docx" then
	// .docx 
	ltempstr = left(nom_fichier, len(nom_fichier) - 5) + "_" + nom_source
else
	// .doc 
	ltempstr = left(nom_fichier, len(nom_fichier) - 4) + "_" + nom_source
end if

return ltempstr


end function

public function integer quit_word ();// fx qui qui quitte (ferme) WORD puis se déconnnecte
// proprement du serveur OLE automation
// pas de gestion d'erreur


//quit WORD
wrd.application.quit()

// appelle d'une autre fonction de l'uo_lien_word
close_connection_word()

Trace("Fermeture de Word")

//messagebox("TRACE", "Kill Word")
// pour forcer la suppression de Word
//run ("taskkill /f /im winword.exe")

// pas de gestion d'erreur
return 1
end function

public function integer write_param_inter_proc (string lvar1, string lvar2, string lvar3, string lvar4, string lvar5, string lvar6);// fx qui place ds le registre window des param à destination de word
// permet la comunication inter-processus (de pwo à word)
// return si OK, -1 si pb


//if RegistrySet(param_inter_proc, var1, RegString!, lvar1 ) <> 1 then return -1
//if RegistrySet(param_inter_proc, var2, RegString!, lvar2 ) <> 1 then return -1
//if RegistrySet(param_inter_proc, var3, RegString!, lvar3 ) <> 1 then return -1
//if RegistrySet(param_inter_proc, var4, RegString!, lvar4 ) <> 1 then return -1
//if RegistrySet(param_inter_proc, var5, RegString!, lvar5 ) <> 1 then return -1
//if RegistrySet(param_inter_proc, var6, RegString!, lvar6 ) <> 1 then return -1

if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var1,lvar1) <> 1 then return -1
if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var2,lvar2) <> 1 then return -1
if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var3,lvar3) <> 1 then return -1
if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var4,lvar4) <> 1 then return -1
if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var5,lvar5) <> 1 then return -1
if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var6,lvar6) <> 1 then return -1

return 1
end function

public function boolean get_sauvegarder_courrier ();// fx qui renvoie un boolean à 
// Vrai si on doit sauvegarder les courrier ds rep photo
// Faux si non

constant string	v_oui = "O"

boolean	impr_courrier = false
string		on_imprime


select sauver_courrier_imprime into :on_imprime from param ;

if SQLCA.SQLCode = 0 then
// si valeur bien récup
	if on_imprime = v_oui then
	// si on doit imprimer
		impr_courrier = true
	end if
end if

return impr_courrier

end function

public function integer close_courrier (string nom_courrier);// fx qui ferme un courrier word SANS LE SAUVEGARDER
// identifié par son nom passé en param
// return 1 si OK, -1 si pb


// on ferme le doc sans le sauvegarder
wrd.Application.Documents(nom_courrier).Close (False)

// pas de gestion d'erreur
return 1
end function

public function integer open_courrier (string chemin_complet, boolean visible);// fx qu iouvre un document sous WORD
// pas de gestion d'erreur (return tjrs 1)


// on ouvre le doc
wrd.Application.Documents.Open(chemin_complet)

// on rend word visible ... selon param ...
if visible then wrd.Application.Visible = True

// pas de gestion d'erreur
return 1
end function

private function integer lancer_une_macro (string nom_macro);// fx qui permet de lancer une macro
// return 1 si ok

int	returnval = -1

if open_connection_word() = 1 then
	//messagebox("trace","MAcro : "+nom_macro)
	wrd.Application.Run (nom_macro)
	returnval = 1
end if

return returnval
end function

public function string get_courrier (integer ltype_courrier);// fx qui return le nom du courrier selon le type passé en param
// renvoie une chaine vide si courrier pas trouvé

boolean	trouve = false
string	lstr_nom_courrier
int		ltype


DECLARE courriers_types CURSOR FOR  
SELECT 	"nom_courrier", "type_courrier"
FROM 		"courriers" ;

// ouverture du curseur
OPEN courriers_types ;

do
	// on lit 1 ligne
	FETCH courriers_types INTO :lstr_nom_courrier, :ltype ;
	
	if not isnull(ltype) then
	// si on a pu récup qqch
		if ltype = ltype_courrier then
		// si on a trouvé le type du courrier -> on l'indique
			trouve = true
		end if
	end if
	
// on boucle tant que pas fin de curseur ET type pas trouvé
loop while SQLCA.sqlcode = 0 AND not trouve

// fermeture du curseur
CLOSE courriers_types ;

// si on a pas trouvé -> on return une erreur
if not trouve then lstr_nom_courrier = ""

return lstr_nom_courrier

end function

public function integer lien_word (integer service, ref string chemin_courrier, ref string nom_courrier, integer num_courrier, ref pourhistocourrier phc[]);// fx qui agit suivant le service passé en paramètre
// 	1) ouvre une connection OLE avec word
// 	2) charge le fichier passé en param par son chemin complet
//	3) referme la connection OLE (sans refermer word)
// renvoie 1 si ok, -1 si pb 

string		chemin_fichier_log_email
long		nbrelem_tab_elem, k
integer 	llg_versionword
ulong		index = 1
int			returnval = -1
string		fichier_save
boolean	unpb, sauvegarder_courrier
boolean	pas_imprime
string		lrep_photos, rep_phot_patient
string		chemin_courrier_htm
string		libelle_pr_histo
int 		id_cpt, cpt_pj
integer 	v_id_categorie

uo_smtp					smtp
uo_email_compte		cpt_email
uo_email_email 		email
string nom_patient, prenom_patient
boolean log_email_a_afficher = false
boolean ok_envoi, avec_pj
str_email_frm_output		frm_output

boolean docu_gene_ferme = false
double val_retour

boolean question_mise_en_historique  	// pour ne poser la question qu'une fois

string memo_automatique, v_code_interne_historique_editions


// pour des traces de debug
string v_valeur_var7, v_valeur_var8, v_valeur_var9

question_mise_en_historique = false

// Pour la vérification de la mémorisation du courrier dans le dossier du patient
integer nb_boucles_courrier_save	= 5	// pour les tentaives de sauvegardes de courriers
integer cpt_boucles_courrier_save
string v_nom, v_prenom
double v_numero_dossier 
string fichier_pdf

// pour envoi d'email en PJ ou pas
boolean email_html = false

// Depuis 2016 on peut dire de ne pas mémoriser certains courriers
boolean courrier_memorisable = true
string fichier_a_supprimer_apres_femeture = ""
string string_nulle, v_memorisation, v_publication, v_publication_correspondant
double v_id_courrier

setnull(string_nulle)
sauvegarder_courrier = get_sauvegarder_courrier()
nbrelem_tab_elem = upperbound(phc)


//Messagebox("TRACE","nbrelem_tab_elem : "+ string( nbrelem_tab_elem))
//Messagebox("TRACE","nom_courrier : "+nom_courrier )
//Messagebox("TRACE","phc[k].chemin_courrier : "+ phc[k].chemin_courrier)


Trace("============= Début de lien_word =================")

Trace("Service : " + string(service) )
Trace("chemin_courrier : " + chemin_courrier) 
Trace("nom_courrier : " + nom_courrier) 
Trace("num_courrier : " + string(num_courrier)) 

// Est ce un courrier mémorisable ?
v_id_courrier = get_id_document(chemin_courrier + nom_courrier )

select isnull(memorisation,'O'), isnull(copie_pdf, 'N') , isnull(copie_pdf_correspondant, 'N') , id_categorie
into :v_memorisation, :v_publication, :v_publication_correspondant, :v_id_categorie
from "courriers_word" 
where id = :v_id_courrier ;

if v_memorisation <> "O" and v_memorisation <> "N" then
	// pour être sur
	v_memorisation = "O"
end if 


//Messagebox("TRACE","v_id_courrier : "+ string(v_id_courrier))

// Chargement des options

// memo_automatique : est ce qu'on sauvegarde le fichier ou est ce qu'on pose la question ?
if nbrelem_tab_elem > 1  then
	// Dans le cadre de publipostage, on ne peut pas faire de mémo automatique !!!
	memo_automatique = "N"
else
	memo_automatique = profilestring(dir_ini+inifile_orthokis,"WORD","memo_automatique","O")
end if

// Est ce qu'on enregistre physiquement le fichier ?
if v_memorisation = "O" or service = Service_EnregistrerSousPDF then
	courrier_memorisable = true
else
	courrier_memorisable = false
	sauvegarder_courrier = false
	//memo_automatique = "N"
end if

//Messagebox("TRACE","v_memorisation : "+ v_memorisation)
//Messagebox("TRACE","courrier_memorisable : "+ string(courrier_memorisable))
//Messagebox("TRACE","memo_automatique : "+ string(memo_automatique))
//Messagebox("TRACE","memo_automatique : "+ string(sauvegarder_courrier))

// remise à zéro du Handle Word ... Word le remettra pour mise au premier plan
Setprofilestring(dir_ini+inifile_orthokis,"communication","handle_word","0")

// Application qui écoute word pour le mettre au 1er plan ... 
//run(dir_ini + "word_premier_plan.exe")

// si publipostage et email
int id_file_log_email
if  nbrelem_tab_elem >= 1 and (service = Service_MajEtEmail or service = Service_MajVisualiseEtEmail) then
	// ouverture d'un fichier log 
	chemin_fichier_log_email = DIR_INI + "email.log"
	id_file_log_email = fileopen(chemin_fichier_log_email, LineMode! , Write!, LockWrite!, Replace!)
	filewriteEx(id_file_log_email, '')
	filewriteEx(id_file_log_email, "*******************************************************")
	filewriteEx(id_file_log_email, "Publipostage en date du : " + string(today())+" à "+string(now()))
	filewriteEx(id_file_log_email, "Généré pour le courrier : " + nom_courrier)
	filewriteEx(id_file_log_email, "Liste des patients pour lesquels les Emails n'ont pas été envoyé pour cause d'adresse du destinataire non indiquée.")
	filewriteEx(id_file_log_email, "*******************************************************")
	filewriteEx(id_file_log_email, '')
end if

fichier_save = DIR_INI + prefixe_courrier_generer_temp + nom_courrier


Trace("Fin des initialisations")


if service <> Service_EditerCourrier then
	// si pour un service d'impression seulement
	if FileExists( fichier_save ) then 
		if not FileDelete(fichier_save) then 
			// Message supprimé depuis la version 2009 - 15.00L
			unpb = true
			messagebox("ERREUR ...", "Impossible de supprimer le fichier de sauvegarde intermédiaire. Opération annulée.", StopSign!)
		end if
	end if
end if

// rep photo nécessaire
// verif de sa présence ...
lrep_photos = fxg_get_rep_photos()
if not fxg_fileexists( lrep_photos ) then
	unpb = true
	messagebox("ATTENTION !", "Le répertoire photos d'Orthokis est inexistant ou mal configuré ~nor il est nécessaire à l'opération en cours, opération annulée ! ~n~nVeuillez vérifier vos paramètres et/ou votre réseau." )
else
	// ... puis de son acces en ecriture (copie d'un fichier puis verif de sa présence)
	string fichier_temporaire
	fichier_temporaire = fxg_generer_fichier_temporaire()
	FileCopy (dir_ini + fichier_temporaire, lrep_photos + "\" + fichier_temporaire, true ) 
	if FileExists(lrep_photos + "\" + fichier_temporaire) then						
		// ça a marché => on l'efface et on ne dit rien 
		FileDelete (lrep_photos + "\" + fichier_temporaire)	
	else
		unpb = true
		messagebox("ATTENTION !", "Les droits d'accès en écriture au répertoire photos d'Orthokis semblent insuffisants,~nor ils sont nécessaires à l'opération en cours, opération annulée ! ~n~nVeuillez vérifier vos paramètres et/ou votre réseau." )
	end if
end if

if not unpb then
	// on écrit  les valeurs dans le .ini qui ne changeront pas

	// N° du Service
	if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var1,string(service)) <> 1 then return -1	
	// Dossier contenant le document Word
	if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var2,chemin_courrier) <> 1 then return -1	
	// Nom du document Word
	if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var3,nom_courrier) <> 1 then return -1
	// Nom du fichier de destintation
	if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var4,DIR_INI + generer_nom_fichier_export(nom_courrier)) <> 1 then return -1
	// Fichier photo vide
	if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var5,DIR_INI + fichier_photo_vide) <> 1 then return -1
	// Var6 est mis à jour ensuite => on le réécrit par sécurité
	if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var6,fichier_save) <> 1 then return -1

	// Catgégorie du courrier ... sera exploité en cas se signature du document une fois généré
	// On ne le fait que pour les services qui génèrent le document ... pour les autres, il faut écrire var19 AVANT de lancer lien_Word
	if Service <> Service_SigneEnLigne_Direct   and Service <> Service_EnregistrerSousPDF   then
		if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var19,string(v_id_categorie)) <> 1 then return -1
	end if
	
	
	
	
	if service = Service_MajEtSigne then

		// On supprime le fichier temporaire d'une précédente signature
		string v_fichier_pdf_temporaire
		v_fichier_pdf_temporaire = dir_ini + "signature_tmp"
		if FileExists(v_fichier_pdf_temporaire) then
			FileDelete(v_fichier_pdf_temporaire)
		end if
	end if
	
	// Depuis 2013, on se sert aussi de ces paramètres pour les images 2013
	
	if service > Service_EditerCourrier then
		// Code du patient (on prend le premier de la liste ... servira uniquement pour la signature numérique du document)
		if service <> Service_EnregistrerSousPDF and service <> Service_Imprime then
			if service = service_SigneEnLigne_Direct then
				// on est forcément sur le patient courant .. sans initialisation avec les Traiter_export
				if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var13, string(var_code )) <> 1 then return -1
			else
				if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var13, string(phc[1].numpatient) ) <> 1 then return -1
			end if
		else
			// pour PDF, var13 sert au répertoire d'installation d'Orthokis (pour générer le PDF)
			// Pour Imprime, on n'en a pas besoin ... mais on fait quand même car pas besoin du code patient
			//if RegistrySet(param_inter_proc, var13, RegString!, dir_ini ) <> 1 then return -1
			if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var13, dir_ini) <> 1 then return -1
		end if
		// if RegistrySet(param_inter_proc, var14, RegString!, utilisateur_code ) <> 1 then return -1
		if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var14, utilisateur_code) <> 1 then return -1
	end if
	
	// Par défaut on ne souhaite pas mettre à jour les images 2013 ... on mettra à "O" plus loin ...
	//if RegistrySet(param_inter_proc, var15, RegString!, "N" ) <> 1 then return -1
	if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var15, "N") <> 1 then return -1
	// Copie PDF ... publication portail patient
	//if RegistrySet(param_inter_proc, var16, RegString!, v_publication) <> 1 then return -1
	if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var16, v_publication) <> 1 then return -1
	// Copie PDF ... publication portail correspondant
	//if RegistrySet(param_inter_proc, var17, RegString!, v_publication_correspondant) <> 1 then return -1
	if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var17, v_publication_correspondant) <> 1 then return -1
	
	//end if
	
	Trace("Avant Connection Word")

	if open_connection_word() = 1 then
	// si connection OLE = OK
		// test sur num version pour détection compatiblité
		string v
		// renvoie une chaine de type "14.0"
		v = get_word_version()
		
		// la conversion donnera 0 si on a la "," comme symbole de décimale ...
		//llg_versionword = integer(v)
		
		// depuis 2016 on ne teste plus le symbole !!
		llg_versionword = integer(left(v,2))

		
		if service = Service_EnregistrerSousPDF and llg_versionword < 12 then
			Messagebox("ATTENTION","Il n'est pas possible de générer un courrier en PDF avec votre version de de Word.~n~nVous devez posséder une version 2007 ou supérieure.")
		else
		
		
			choose case llg_versionword
				case is >= 9
					
					
					if imagerie_2013 and nbrelem_tab_elem = 1 and service > 1 then
						// on est sur un document unitaire => travaille sur l'imagerie_2013
						//if RegistrySet(param_inter_proc, var15, RegString!, "O" ) <> 1 then return -1
						if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var15,"O") <> 1 then return -1
					end if
					
					Trace("Lancement de la Macro LienWord")

					// lance la macro qui va bien
					wrd.Application.Run (macro_LienWORD)
					
					Trace("Fin de la Macro LienWord")
					
					if service = Service_EditerCourrier or  service =  Service_Imprime or  service =  Service_SigneEnLigne_Direct then
						// si service d'édition  : maj val de retour 
						// Si impression simple d'un docu existant : on sort direct
						
						returnval = 1
					else
						
						Trace("Choose Case Service : " + string(service))

						// les services d'impression
						choose case service
							case Service_MajEtVisualise // si on souhaite previ
								
								if memo_automatique = "O" then
									val_retour = 1
									// On mettra en avant plan plus tard 
									// Et meme En dehors ... dans la fenetre w_courrier_word pour être sur que tout soit fini !!
									// on mettra Word en avant plan après mais un force aussi ici pour certains cas - 2014
									if profilestring(dir_ini+inifile_orthokis,"WORD","forcer_word_premier_plan","N") = "O" then 
										//mettre_word_en_avant_plan(12)
										fxg_premier_plan("winword")
									end if
								else
									if courrier_memorisable then
										openwithparm(w_courriers_word_question_impr, "Souhaitez-vous enregistrer le document dans le dossier du patient ?")
										val_retour = message.DoubleParm
									else
										// on mémorise pas
										val_retour = 2 
									end if
								end if
								
								if val_retour = 2 then
									// si l'utilisateur n'a pas imprimé le courrier généré
									pas_imprime = true
									// maj val retour
									returnval = 1
								end if
							case Service_MajVisualiseEtEmail
									if memo_automatique = "O" then
										val_retour = 1
										// on mettra Word en avant plan après mais un force aussi ici pour certains cas - 2014
										if profilestring(dir_ini+inifile_orthokis,"WORD","forcer_word_premier_plan","N") = "O" then 
											//mettre_word_en_avant_plan(12)
											fxg_premier_plan("winword")

										end if
									else
										openwithparm(w_courriers_word_question_impr, "Confirmez-vous l'envoi de cet email ?")
										val_retour = Message.DoubleParm
									end if
								if val_retour = 2 then
									// si l'utilisateur n'a pas imprimé le courrier généré
									pas_imprime = true
									// maj val retour
									returnval = 1
								end if
	
						end choose
						
						if not pas_imprime then
							// si le courier a été imprimé
							// récup du bon libéllé du document
							for k=1 to nbrelem_tab_elem
								
								if isvalid(w_patience) then
									w_patience.avancement("Avancement : " + string(k) + " / " +string(nbrelem_tab_elem))
								end if
								
								yield() 	// Pour mise à jour de la fenêtre de patience
								
								// pour chacun des patients
								//phc[k].libelle = nom_courrier
								if phc[k].numCourrier = num_courrier then 
								// ... pour le courrier en cours uniquement
									if nom_courrier <> "" then	// if phc[k].libelle <> "" then 
									// si on doit l'imprimer
									
										if  service = Service_MajEtEmail or service = Service_MajVisualiseEtEmail then
											// C'est un traitement de mail
											trace("")
											trace("- Service_MajEtEmail ou Service_MajVisualiseEtEmail - " + string(k)+"/"+string(nbrelem_tab_elem))
											trace("- Nom_Courrier : " + nom_courrier )
											phc[k].libelle = nom_courrier


											// compte du praticien ou du user
											id_cpt = compte_email_a_utiliser(utilisateur_code, phc[k].numpatient)
											
											if OUTIL_ENVOI_EMAIL = "O" then
												// init cpt mail et affection au mail manager
												cpt_email = create uo_email_compte
												cpt_email.charger(id_cpt)
												email_manager.set_compte(cpt_email)
											else
												smtp = create uo_smtp
												smtp.charger_compte(id_cpt)
											end if
	
											
											
											// recherche de l'adresse email du patient sur le premier elem uniquement
											if k = 1 then
												if OUTIL_ENVOI_EMAIL = "O" then	
													email_manager.propos_objet = cpt_email.email_objet_defaut
												else
													 email_manager.propos_objet = smtp.email_objet_defaut
												end if
												if nbrelem_tab_elem = 1 then 
													// init pour mode unitaire
													email_manager.mode_choix_adr_courant = email_manager.mode_choix_adr_unitaire
												elseif nbrelem_tab_elem > 1 then
													// init pour publipostage
													email_manager.mode_choix_adr_courant = email_manager.mode_choix_adr_publipostage
													email_manager.type_desti_courant = 0
												end if 
											end if
											
											str_patient v_patient
	
											// Génératon du fichier rtf pour passage en paramètre
											string is_FileName, fichier_texte , fichier_texte_avec_adresses , 	fichier_texte_patient  
											integer num_fichier_texte, num_fichier_texte_avec_adresses
										
											is_FileName = dir_ini + "texte_email_tmp.rtf"
											num_fichier_texte = FileOpen( is_FileName, StreamMode! , Write! , LockWrite! , replace!)
											
											
											if OUTIL_ENVOI_EMAIL = "O" then
												FileWrite(num_fichier_texte, cpt_email.texte_brut_defaut)
											else
												FileWrite(num_fichier_texte, smtp.texte_brut_defaut)
											end if
											FileClose(num_fichier_texte)
	
	
	
											if nbrelem_tab_elem = 1 then
												// Envoi unitaire : on utilie une fenêtre détaillée
												// on passe en param le texte par defaut pour envoi en piece jointe ....
												
												if OUTIL_ENVOI_EMAIL = "O" then
													param_win[1] = cpt_email.texte_brut_defaut
												else
													param_win[1] = smtp.texte_brut_defaut
												end if
												
												v_patient.code = phc[k].numpatient
												v_patient.appelant = 'W'	//  Document Word en PJ
	
												
												openwithparm(w_email_choix_adr_pat, v_patient)
												frm_output = message.PowerObjectParm 
												
												if OUTIL_ENVOI_EMAIL = "O" then
													cpt_email.texte_brut_defaut = param_win[1]
												else
													smtp.texte_brut_defaut = param_win[1]
												end if
											else
												// Utilisation de la fenêtre avec x boutons sans possibilité de choix multiples ...
												v_patient.code = phc[k].numpatient
												v_patient.appelant = 'E'	// Email classique
												
												openwithparm(w_email_choix_adr_pat_mailing, phc[k].numpatient)
												frm_output = message.PowerObjectParm 
												
											end if
											
											
										
											// On met le document en avant plan si on est en mémo automatique et en visualisation avant
											if service = Service_MajVisualiseEtEmail and memo_automatique = "O" then
												fxg_premier_plan("winword")
												//mettre_word_en_avant_plan(6)
											end if
			
											
											
											if isnull(frm_output.a_adrs[1]) then frm_output.a_adrs[1] = ''
											// on poursuit si et seulement si on a une adr de destinataire
											if frm_output.a_adrs[1] = '' then
												// si en publipostage ET pas d'adr --> on renseigne un fichier LOG
												if  nbrelem_tab_elem > 1 then
													select isnull(nom, ''), isnull(prenom, '') into :nom_patient, :prenom_patient from patient where code =  :phc[k].numpatient ;
													filewriteex(id_file_log_email, trim(nom_patient + ' ' +prenom_patient) + "  -  (N° interne : " + string(phc[k].numpatient) + ")")
													log_email_a_afficher = true	// maj boolean indiquant que des emails n'ont pas étés envoyés à causes de l'adr du desti manquante
												end if
											else
												
												Trace("- Création et envoi du mail")
												
												// creation et envoie email
												email = create uo_email_email
												
												if OUTIL_ENVOI_EMAIL = "N" then
													email.smtp_email = smtp
												end if

												
												email.set_patient( phc[k].numPatient)
												
												if OUTIL_ENVOI_EMAIL = "O" then
													email.add_destinataire_a(frm_output.a_adrs[1], false)
													email.set_from(cpt_email.my_alias,cpt_email.my_adr)
													if frm_output.cc then 
														email.set_cc(cpt_email.my_alias, cpt_email.my_adr)
													end if
													if frm_output.cci then 
														email.set_cci(cpt_email.my_alias, cpt_email.my_adr)
													end if
												else
													email.add_destinataire_a(frm_output.a_adrs[1], false)
													if frm_output.cc then 
														email.set_cc(cpt_email.my_alias, cpt_email.my_adr)
													end if
												end if
												
												
												if k = 1 then email_manager.propos_objet = frm_output.objet // si sur premier element (pour publipostage) = recup de l'objet du mail du frm
												email.set_sujet(email_manager.propos_objet)
												
												// génération du fichier HTML --> corps de l'email
												// rep photo patient --> création si nécessaire
												rep_phot_patient = lrep_photos + string( phc[k].numPatient )
												if not fxg_fileexists( rep_phot_patient ) then gfx_creer_rep( rep_phot_patient )
												
												
												// conversion intermédiaire de word du .doc général en .htm ciblé sur ce patient
												//if RegistrySet(param_inter_proc, var7, RegString!, string(index) ) <> 1 then return -1 		// N° du document à généré
												if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var7,string(index)) <> 1 then return -1
												
												if profilestring(dir_ini+inifile_orthokis,"WORD","envoi_en_piece_jointe","N") = "O" then 
													Trace("- Envoi Word en PJ")
													email_html = false
												else
													Trace("- Envoi Word dans corps du Mail en HTML")
													email_html = true
												end if 
	
												if email_html then 
													// On envoie le fichier DOC convertit en HTML en tant que CORPS de l'email
													chemin_courrier_htm = replace(phc[k].chemin_courrier, len(phc[k].chemin_courrier) -2,3,"htm")
													//if RegistrySet(param_inter_proc, var8, RegString!, chemin_courrier_htm ) <> 1 then return -1
													if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var8,chemin_courrier_htm ) <> 1 then return -1
												else
													// On envoie le fichier DOC ou en PDF en tant que Pièce jointe !!!
													chemin_courrier_htm = phc[k].chemin_courrier 
													//if RegistrySet(param_inter_proc, var8, RegString!, chemin_courrier_htm) <> 1 then return -1
													if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var8,chemin_courrier_htm ) <> 1 then return -1
													// On modifie le service pour que Word gère l'enregistrement comme un fichier .DOC (sans convertion HTML)
													//if RegistrySet(param_inter_proc, var1, RegString!, string(service - 3) ) <> 1 then return -1
													if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var1,string(service - 3) ) <> 1 then return -1
												end if
																
																
												// Passage des paramètres à Word
												//if RegistrySet(param_inter_proc, var9, RegString!, string(nbrelem_tab_elem)  ) <> 1 then return -1	 // Nombre total de courrier 
												if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var9,  string(nbrelem_tab_elem)  ) <> 1 then return -1
		
		
												// Mémorisation de l'email dans le dossier du patient
												cpt_boucles_courrier_save = 1 
												
												
												// Var6 est mis à jour ensuite => on le réécrit par sécurité
												// Contient le nom du document principal - utile en cas de publipostage !!!
												//if RegistrySet(param_inter_proc, var6, RegString!, fichier_save ) <> 1 then return -1
												if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var6,  fichier_save ) <> 1 then return -1
		
												// Ajout de tests pour savoir si le courrier à réellement été mémorisé ou pas car Word
												// On fait 5 tentatives de mélorisation du courrier
												do while not FileExists(chemin_courrier_htm) and cpt_boucles_courrier_save <= nb_boucles_courrier_save
													// mémorisaton du courrier dans le dossier du patient 
													Trace("Lancement 1 de la Macro " + macro_Sauvegarde + " Fichier : " + chemin_courrier_htm + " - Boucle : " + string(cpt_boucles_courrier_save) + "/" + string(nb_boucles_courrier_save))
													lancer_une_macro( macro_Sauvegarde )
													cpt_boucles_courrier_save = 	cpt_boucles_courrier_save + 1
													sleep(1000)
												loop
												
												// On réinscrit la bonne valeur dans la REG
												//if RegistrySet(param_inter_proc, var1, RegString!, string(service) ) <> 1 then return -1
												if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var1,  string(service) ) <> 1 then return -1
	
												if FileExists(chemin_courrier_htm) then 
												
													Trace("Le fichier existe : " +chemin_courrier_htm )
													// on passe à Word le nom du fichier qu'il vient d'enregister pour qu'il puisse le fermer ensuit
													//RegistrySet(param_inter_proc, var6, RegString!, chemin_courrier_htm )
													SetProfilestring(dir_ini+inifile_orthokis,"Macros",var6,  chemin_courrier_htm ) 
	
													if email_html then
														// Mail normal
														email.set_body_html(chemin_courrier_htm)
													else
														// En pièce jointe
																												
														fichier_texte = dir_ini + "texte_email_tmp.html"
														fichier_texte_avec_adresses = dir_ini + "texte_email_adresses_tmp.text"
														fichier_texte_patient = dir_photos + string(phc[k].numPatient) + win_delimiter + left(gfx_extraire_nom_fichier(chemin_courrier_htm), 20) + " - Texte email.html"
		
														email.set_body_html(fichier_texte)

														long v_sleep
														if frm_output.pdf then
															// il faut envoyer le fichier en PDF 
															Trace("Envoi du fichier en PDF")
															// Faut d'abord le convertir !!!
															// pour éviter soucis ... on ferme la connexion Word en cours 
															if memo_automatique = "N" and (service = Service_MajVisualiseEtEmail or service = Service_MajEtEmail) then
																quit_word()

																v_sleep = long(profilestring(dir_ini+inifile_orthokis,"Macros","attente2","0"))
																sleep(v_sleep) // pour laisser le temps à Word de se fermer !!!
															end if
															
															Trace("Demande de conversion en PDF")
															
															uo_lien_word uo_word
															uo_word = create uo_lien_word
															uo_word.traiter_avec_word(Service_EnregistrerSousPDF, gfx_extraire_path_fichier(chemin_courrier_htm), gfx_extraire_nom_fichier(chemin_courrier_htm) , false) 

															Trace("Ajout du fichier PDF en PJ")
															fichier_pdf = fxg_get_nom_fic_document_orthokis_pdf()
															email.add_fichier_joint(fichier_pdf)
														else
															// Quitte Word
															if memo_automatique = "N" and (service = Service_MajVisualiseEtEmail or service = Service_MajEtEmail) then
																quit_word()
																v_sleep = long(profilestring(dir_ini+inifile_orthokis,"Macros","attente2","0"))
																sleep(v_sleep) // pour laisser le temps à Word de se fermer !!!
															end if

															
															
															Trace("Ajout du fichier DOC en PJ")
															// On envoie le fichier DOC en tant que Pièce jointe !!!
															email.add_fichier_joint(chemin_courrier_htm)
														end if
													end if
													
													avec_pj = false
		
													// traitement des fichiers supplémentaires en PF
													// Y a t il un fichier en PJ
													if upperbound(frm_output.pj[]) = 1 then
														if FileExists(frm_output.pj[1]) then
															email.add_fichier_joint(frm_output.pj[1])
															avec_pj = true
														end if
													end if
													
													// On ajoute les éventuelles PJ supplémentares ... 
													for cpt_pj = 1 to upperbound(frm_output.pj_supplementaires[])
														email.add_fichier_joint(frm_output.pj_supplementaires[cpt_pj])
														avec_pj = true
													next
													
													// Envoi effectif du mail
													if OUTIL_ENVOI_EMAIL = "O" then 
														ok_envoi = email_manager.envoyer_email(email.get_email()) 
													else
														ok_envoi = email.envoi_mail_smtp()
													end if

													if ok_envoi then
														
														Trace("Envoi effecfif de l'email")
														
														if email_html then
															// enreg physique du mail ds rep photo patient + ligne d'histo
															string v_extension
															// l'extension peut être DOC ou DOCX !!!
															v_extension = gfx_extraire_extension_fichier(phc[k].libelle)
															
															phc[k].libelle = left(phc[k].libelle, len(phc[k].libelle) - len(v_extension)) + "eml"
															phc[k].typeDoc = "EMAIL"
															if sauvegarder_courrier then
																phc[k].chemin_courrier = left ( phc[k].chemin_courrier, len(phc[k].chemin_courrier) - len(v_extension) ) + "eml"
																email.get_email().saveEml(phc[k].chemin_courrier)
																
																if not courrier_memorisable then 
																	// on va supprimer le fichier car on ne veut pas le mémoriser !!
																	fichier_a_supprimer_apres_femeture = chemin_courrier_htm
																	// On le supprimera réellement à la fin, une fois fermé dans Word !!!!
																end if
																
																// enreg ligne d'histo si et seulement si .eml bien créé
																if FileExists(chemin_courrier_htm) and courrier_memorisable then 
																	fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , phc[k].libelle, phc[k].chemin_courrier , 'E', 'N', 'N', '', v_id_categorie)
																	if utilisation_distante then
																		// Mémo du fichier en vue du retour au cabinet
																		fxg_ajout_acquis_distante ( phc[k].numPatient ,  phc[k].chemin_courrier ) 
																	end if
																else
																	// pas d'enreg physique du courrier => simple enreg ligne histo
																	if courrier_memorisable then 
																		setnull( phc[k].chemin_courrier )
																	end if
																	fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , phc[k].libelle, phc[k].chemin_courrier , 'E', 'N', 'N', '', v_id_categorie)
																end if
			
															else
																// pas d'enreg physique du courrier => simple enreg ligne histo
																setnull( phc[k].chemin_courrier )
																fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , phc[k].libelle, phc[k].chemin_courrier , 'E', 'N', 'N', '', v_id_categorie)
															end if
															
														else
															
															Trace("Envoi du document en tant que Pièce Jointe")

															
															// Envoi du document en tant que Pièce Jointe
															//------------------------------------------------
															
							
															// enregistrement pphysique du .doc
															cpt_boucles_courrier_save = 1
												
															// Ajout de tests pour savoir si le courrier à réellement été mémorisé ou pas car Word
															// On fait 5 tentatives de mélorisation du courrier
															
															do while not FileExists(phc[k].chemin_courrier) and cpt_boucles_courrier_save <= nb_boucles_courrier_save
																// mémorisaton du courrier dans le dossier du patient 
																Trace("Lancement 2 de la Macro " + macro_Sauvegarde + " Fichier : " + phc[k].chemin_courrier + " - Boucle : " + string(cpt_boucles_courrier_save) + "/" + string(nb_boucles_courrier_save))
																lancer_une_macro( macro_Sauvegarde )
																cpt_boucles_courrier_save = 	cpt_boucles_courrier_save + 1
																sleep(1000)
															loop
															
															if FileExists(phc[k].chemin_courrier) then 
																
																// on passe à Word le nom du fichier qu'il vient d'enregister pour qu'il puisse le fermer ensuit
																//RegistrySet(param_inter_proc, var6, RegString!, phc[k].chemin_courrier )
																SetProfilestring(dir_ini+inifile_orthokis,"Macros",var6,phc[k].chemin_courrier) 
				
																if courrier_memorisable then 
																	// Le courrier a pu être correctement mémorisé
																	// enreg ligne d'histo si et seulement si .doc bien créé
																	fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , phc[k].libelle, phc[k].chemin_courrier , 'E', v_publication, v_publication_correspondant, '', v_id_categorie)
																	if utilisation_distante then
																		// Mémo du fichier en vue du retour au cabinet
																		fxg_ajout_acquis_distante ( phc[k].numPatient ,  phc[k].chemin_courrier ) 
																	end if
																else
																	// on va supprimer le fichier car on ne veut pas le mémoriser !!
																	fichier_a_supprimer_apres_femeture = chemin_courrier_htm
																	// On le supprimera réellement à la fin, une fois fermé dans Word !!!!
																	fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , phc[k].libelle, string_nulle , 'E', 'N', 'N', '', v_id_categorie)
																end if

																// On génère un fichier texte contenant la liste des destinataires ... meme nom que le fichier en PJ avec .dest comme extension
																email.generer_fichier_adresses(fichier_texte_avec_adresses, fichier_texte_patient, frm_output)
																
																// Mémorisation des fichiers Texte de PJ et Destinataires
																FileCopy(fichier_texte, fichier_texte_patient)
																																
															else
																
																Select isnull(trim(nom),''), isnull(trim(prenom),''), numero_dossier 
																into :v_nom, :v_prenom, :v_numero_dossier 
																from patient
																where code = : phc[k].numPatient ;
																
																Messagebox("ATTENTION !","Un problème est survenu lors de la mémorisation du courrier dans le dossier du patient (malgré 5 tentatives).~n~nCe courrier ne sera pas placé en historique !~n~nPatient : "+v_nom+ " "+v_prenom+" ("+string(v_numero_dossier)+")~nLibellé du courrier : "+phc[k].libelle)
															end if
															
											
															// Type email avec un .DOC en PJ
															phc[k].typeDoc = "EMAIPJ"
															
															string libelle_sup = ""
															if frm_output.pdf then 
																libelle_sup = " - Format PDF"
															end if
																
															// Mémorisation du texte d'accompagnement et des destinataires !!
															if avec_pj then
																v_code_interne_historique_editions = fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , "PJ : " + phc[k].libelle + libelle_sup, fichier_texte_patient  , 'E', 'N', 'N', '', v_id_categorie)
																fxg_memorisation_pieces_jointes( phc[k].numPatient, v_code_interne_historique_editions,  email.fichiers_joints , false)
															else
																fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , "PJ : " + phc[k].libelle + libelle_sup, fichier_texte_patient  , 'E', 'N', 'N', '', v_id_categorie)
															end if
															
																													
														end if
														
														// on ferme le courrier généré
														if memo_automatique <> "O" or (service = service_majetemail or service = Service_MajVisualiseEtEmail)  then
															trace("Fermeture 1 du document généré")
															// Var6 contient le nom du fichier à fermer
															ferme_document_genere()
															trace("Fin Fermeture 1 du document généré")
															docu_gene_ferme = true
														end if
										
													else
														// pb ds l'envoie de l'email 
														// si en publipostage --> fichier log 
														if  nbrelem_tab_elem > 1 then
															select isnull(nom, ''), isnull(prenom, '') into :nom_patient, :prenom_patient from patient where code =  :phc[k].numpatient ;
															filewriteex(id_file_log_email, trim(nom_patient + ' ' +prenom_patient) + "  -  (N° interne : " + string(phc[k].numpatient) + ")")
															log_email_a_afficher = true	// maj boolean indiquant que des emails n'ont pas étés envoyés à causes de l'adr du desti manquante
														else
															// en mode unitaire = msg d'erreur
															messagebox("ERREUR ...", "Impossible d'envoyer l'Email, opération annulée.~n~n(Rapport dans le fichier "+dir_ini + "email_last_error.xml", StopSign!)
														end if
													end if
												end if
												destroy email
												
												if email_html then // pour les envois en PJ, le chemin_courrier_htm désigne le fichier sauvegardé dans le dossier du patient
													// suppr du fichier temporaire .htm et son rep eventuel contenant les images
													DeleteFileA(chemin_courrier_htm)
													gfx_suppr_rep_bis(replace(phc[k].chemin_courrier, len(phc[k].chemin_courrier) -3,4,"_fichiers"))
												end if
											end if
											destroy cpt_email
										elseif service = Service_MajEtVisualise or service = Service_MajEtImprime or service = Service_MajEtSigne or service = Service_MajEtSauve or service = Service_MajEtSauveEnteteDoc or service = Service_MajEtSauveEnteteRtf or service = Service_MajEtFacture  then
											
											// C'est un traitement de courrier Word
											
											// Si c'est un ticket de rendez-vous, on ne demande pas le nom du courrier
											// On le sait car la fonction "traiter_avec_word" inscrit dans la base de registre
											// Idem pour fs2014 .. on utilise le meme mécanisme, idem pour attestation belge en Word
											// Pareil pour spécifique Erasme
											string EstCeTicket
											
											//RegistryGet(param_inter_proc, var10, RegString!, EstCeTicket ) 
											EstCeTicket = profilestring(dir_ini+inifile_orthokis,"Macros",var10,"")
											
											if EstCeTicket = "1" then
												sauvegarder_courrier = true
											else
												//if k = 1 then
												if not question_mise_en_historique then
													if memo_automatique <> "O" then
														if NOT PLANIFICATION_EN_COURS then
															libelle_pr_histo = inputBoxWithPropo ( "Historique courrier ..." , "Libellé du courrier dans l'historique du patient : " , gfx_fichier_sans_extension(nom_courrier), false )
														else
															libelle_pr_histo = gfx_fichier_sans_extension(nom_courrier)
														end if
														if isnull(libelle_pr_histo) then libelle_pr_histo = ''
														if libelle_pr_histo = '' then libelle_pr_histo = nom_courrier
													else
														libelle_pr_histo = nom_courrier
													end if
													question_mise_en_historique = true
												end if
												phc[k].libelle = libelle_pr_histo
											end if
											
											// s'il est configuré de sauvegarder le courrier
											if sauvegarder_courrier then
												// rep photo patient --> création si nécessaire
												rep_phot_patient = lrep_photos + string( phc[k].numPatient )
												if not fxg_fileexists( rep_phot_patient ) then gfx_creer_rep( rep_phot_patient )
												// sauvegarde .doc général en .doc ciblé sur ce patient
												
												v_valeur_var7 =  string(index)
												v_valeur_var8 = phc[k].chemin_courrier 
												v_valeur_var9 = string(nbrelem_tab_elem)
												
																								
//												Messagebox("TRACE","k : "+ string(k))
//												Messagebox("TRACE","v_valeur_var8 : "+ v_valeur_var8)

												
//												// On remet Var6 est mis à jour ensuite => on le réécrit par sécurité
//												if RegistrySet(param_inter_proc, var6, RegString!, fichier_save ) <> 1 then return -1
//	
//												// Passage des paramètres à Word
//												if RegistrySet(param_inter_proc, var7, RegString!, v_valeur_var7 ) <> 1 then return -1	// N° du courrier
//												if RegistrySet(param_inter_proc, var8, RegString!, v_valeur_var8 ) <> 1 then return -1	// Chemin du courrier
//												if RegistrySet(param_inter_proc, var9, RegString!, v_valeur_var9  ) <> 1 then return -1	 // Nombre total de courrier 
												
												
												if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var6,fichier_save) <> 1 then return -1
												if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var7,v_valeur_var7) <> 1 then return -1
												if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var8,v_valeur_var8) <> 1 then return -1
												if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var9,v_valeur_var9) <> 1 then return -1

												
												
												
												// Car particulier de la génération des Entete
												if service = Service_MajEtSauveEnteteDoc or service = Service_MajEtSauveEnteteRtf then
													// Praticien du patient 
													string v_code_prati
													double v_code_patient 
													v_code_patient = phc[k].numPatient
													select code_praticien into :v_code_prati from patient where code = :v_code_patient  ;
													if service = Service_MajEtSauveEnteteDoc then
														// Sauvegarde en DOC
														phc[k].chemin_courrier = dir_courriers + "Entete_" + string(v_code_prati) + ".doc" 
													else
														// sauvegarde en RTF
														phc[k].chemin_courrier = dir_courriers + "Entete_" + string(v_code_prati) + ".rtf" 
													end if
													//if RegistrySet(param_inter_proc, var8, RegString!, phc[k].chemin_courrier)	 <> 1 then return -1	// Chemin du courrier
													if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var8,phc[k].chemin_courrier ) <> 1 then return -1
												end if
												
																					
												cpt_boucles_courrier_save = 1
												
												// Ajout de tests pour savoir si le courrier à réellement été mémorisé ou pas car Word
												// On fait 5 tentatives de mélorisation du courrier
												do while not FileExists(phc[k].chemin_courrier) and cpt_boucles_courrier_save <= nb_boucles_courrier_save
													// mémorisaton du courrier dans le dossier du patient 
													lancer_une_macro( macro_Sauvegarde )
													cpt_boucles_courrier_save = 	cpt_boucles_courrier_save + 1
													sleep(1000)
												loop
												
//												MessageBox("TRACE", "Après sauve courrier ")
//												MessageBox("TRACE", "phc[k].chemin_courrier : " + phc[k].chemin_courrier)
//												Messagebox("TRACE","v_memorisation : "+ v_memorisation)
//												Messagebox("TRACE","courrier_memorisable : "+ string(courrier_memorisable))
//												Messagebox("TRACE","memo_automatique : "+ string(memo_automatique))

												if FileExists(phc[k].chemin_courrier) then 
//													MessageBox("TRACE", "Il existe ")
													
													// on passe à Word le nom du fichier qu'il vient d'enregister pour qu'il puisse le fermer ensuite
													//RegistrySet(param_inter_proc, var6, RegString!, phc[k].chemin_courrier )
													SetProfilestring(dir_ini+inifile_orthokis,"Macros",var6,phc[k].chemin_courrier ) 
													
													if courrier_memorisable  then 
														// Le courrier a pu être correctement mémorisé
														// enreg ligne d'histo si et seulement si .doc bien créé
														fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , phc[k].libelle, phc[k].chemin_courrier , 'E', v_publication, v_publication_correspondant, '', v_id_categorie)
														
														if utilisation_distante then
															// Mémo du fichier en vue du retour au cabinet
															fxg_ajout_acquis_distante (phc[k].numPatient ,  phc[k].chemin_courrier ) 
														end if
													else
														// on va supprimer le fichier car on ne veut pas le mémoriser !!
														fichier_a_supprimer_apres_femeture = chemin_courrier_htm
														// On le supprimera réellement à la fin, une fois fermé dans Word !!!!
														fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , phc[k].libelle, string_nulle , 'E', 'N', 'N', '', v_id_categorie)
													end if

		
													
													// on ferme le courrier généré
													if memo_automatique <> "O" or (	service = Service_majetimprime) or (service = service_majetemail)  or (service = service_majetSigne)  or (service = service_majetSauve)  or service = Service_MajEtSauveEnteteDoc or service = Service_MajEtSauveEnteteRtf or service = Service_MajEtFacture  then
														//lancer_une_macro( macro_CLoseDocGene )
														trace("Fermeture 2 du document généré")
														ferme_document_genere()
														trace("Fin Fermeture 2 du document généré")
														docu_gene_ferme = true
													end if
													
												else
													
													Select isnull(trim(nom),''), isnull(trim(prenom),''), numero_dossier 
													into :v_nom, :v_prenom, :v_numero_dossier 
													from patient
													where code = : phc[k].numPatient ;
													
													Messagebox("ATTENTION !","Un problème est survenu lors de la mémorisation du courrier dans le dossier du patient (malgré 5 tentatives).~n~nCe courrier ne sera pas placé en historique !~n~nPatient : "+v_nom+ " "+v_prenom+" ("+string(v_numero_dossier)+")~nLibellé du courrier : "+phc[k].libelle)
												end if
											else
												// le courrier ne doit pas être sauvegardé mais on enreg tout de meme une ligne ds histo
												// enreg ds histo
												setnull( phc[k].chemin_courrier )
												fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , phc[k].libelle, phc[k].chemin_courrier , 'E', 'N' ,'N', '', v_id_categorie)
											end if
										end if 
									end if
									// maj val d'index
									index ++
								end if
							next
							// si publipostage et traitement d'e-mails
							if  nbrelem_tab_elem > 1 and (service = Service_MajEtEmail or service = Service_MajVisualiseEtEmail) then
								// fermeture du fichier log pour email 
								fileclose(id_file_log_email)
								// si des erreurs = on l'affiche
								if log_email_a_afficher then run('notepad.exe "' + chemin_fichier_log_email + '"')
							end if
							// maj va retour pour les courriers imprimés
							returnval = 1
						end if
						
						// on ferme le courrier généré 
						if (memo_automatique <> "O" and not docu_gene_ferme) or (nbrelem_tab_elem > 1) 	then
							//Messagebox("TRACE - FERMETURE DU COURRIER WORD","Valeur de mémo_automatique : "+memo_automatique)
							// pour fermeture du fichier général
							//if RegistrySet(param_inter_proc, var6, RegString!, fichier_save ) <> 1 then return -1
							if SetProfilestring(dir_ini+inifile_orthokis,"Macros",var6,fichier_save ) <> 1 then return -1
							//lancer_une_macro( macro_CLoseDocGene )
							trace("Fermeture 3 du document généré")
							// depuis 28.00p on ne le fais plus car blocage si on ne mémorise pas les docus .. ?? (FABING)
							//ferme_document_genere()
							trace("Fin Fermeture 3 du document généré")
						end if
					end if
					
					if not courrier_memorisable then 
						// on supprime le fichier car on ne veut pas le mémoriser !!
						FileDelete(fichier_a_supprimer_apres_femeture)  
					end if
					
/*
LA POUR PUBLICATION
*/					
				case 0
					// on a pas les bons formats de param régionaux -> msg
					messagebox("ERREUR ...", "Les paramètres régionaux de votre ordinateur ne sont pas configurés correctement pour ORTHOkis. ~n~nVeuillez y remédier en mettant un point à la place de la virgule dans les Options Régionales et Linguistiques de votre Ordinateur (Panneau de Configuration de votre Ordinateur).~n~nRappel : Ce lien Microsoft WORD fonctionne avec Word 2007 et suivants.", StopSign!)
				case else
					// WORD trop ancien = pas compatible
					messagebox("INFORMATION ...", "Ce lien Word fonctionne avec Microsoft Word 2007 et suivants.")
			end choose
		end if		// test de la version de Word pour Saveas PDF
		// ferme la connection OLE 
		//if memo_automatique <> "O" then
		 if service = Service_MajEtSauveEnteteDoc or service = Service_MajEtSauveEnteteRtf  then
			trace("Avant quitter Word")

			quit_word()
			trace("Après quitter Word")
		else
			trace("Avant close connection Word")
			close_connection_word()
			trace("Après close connection Word")
		end if
		//end if
	end if
else 
	// Impossible d'ouvrir Word 
	messagebox("ERREUR ...", "Impossible de lancer Microsoft WORD. Veuillez vous assurer que ce logiciel est correctement installé sur cet ordinateur.", StopSign!)
end if

Trace("============= Fin de lien_word =================")


return returnval

end function

public function integer traiter_export_txt (integer type_courrier, string nom_fichier);// fx qui génère le fichier d'export final pour l'édition d'un courrier
// quel qu'il soit -> tjrs le même traitement :
// 2 lignes identiques -> une pour le nom des champs, et l'autre pour simuler
// une ligne de valeur pour que la connection au fichier d'export puisse se faire
// sous word
// return	1 si OK,
//				-1 si pb

integer		return_val = -1
boolean		lb_autres_ligne = false

Datastore	dw_export
long			tab_liste_dossier[]
integer		id_fichier_out
string		nom_fichier_out
integer		id_fichier_in
string		lstr
integer		result
integer		i
string		lstr_espacement = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
string		lstr_rep_photos


// recup du rep photos
lstr_rep_photos = fxg_get_rep_photos()

// affectation au tableau d'un num de patient
// -> la datawin a besoin d'un tab d'elem par convention
tab_liste_dossier[1] = 0

// définition du datastore d'export de données
dw_export = CREATE DataStore
dw_export.DataObject = "dw_export_lienword"
dw_export.SetTransObject(SQLCA)

// on retrieve les données
dw_export.retrieve(tab_liste_dossier)


// on les exporte ds un fichier d'export que l'on place ds
// le rep d'installation de l'application
dw_export.SaveAs( dir_ini + nom_source, Text!, true)

// on libère la mémoire
DESTROY dw_export

// ouverture du fichier d'import initial
id_fichier_in = fileopen(dir_ini + nom_source, LineMode!, read!, LockReadWrite!)

if read_ligne(id_fichier_in, lb_autres_ligne, lstr) > 0 then
// si on a pu récup la ligne des noms de champs du fichier intermédiaire
	// --> génération du fichier d'export final :
	// on traite le nom de fichier passé en param en supriment le ".doc"
	// et rajoutant "_" + nom_source
	nom_fichier_out = generer_nom_fichier_export(nom_fichier)
	id_fichier_out = fileopen(dir_ini + nom_fichier_out, LineMode!, write!, LockReadWrite!, Replace! )
	
	choose case type_courrier
		// selon le type de document passé en param
		// --> on construit la ligne à insérer 2 fois
			case lettre_appel_honoraires
			lstr = lstr + ltab + lstr_espacement + appel_honoraires_export
		
		case lettre_relance_1, lettre_relance_2, lettre_relance_3
			lstr = lstr + ltab + lstr_espacement + relance_export
			
		case lettre_report_rdv
			lstr = lstr + ltab + lstr_espacement + report_rdv_export
			
		case lettre_renouvellement
			lstr = lstr + ltab + lstr_espacement + renouvellement_export
			
		case lettre_rdv_manque
			lstr = lstr + ltab + lstr_espacement + rdv_manque_export

		case lettre_ticket_rdv
			lstr = lstr + ltab + lstr_espacement + ticket_rdv_export
			
			
	end choose
	
	choose case serial 
		case "87033" 
			// Macros spéciales pour Ernoult
			lstr = lstr + ltab + lstr_espacement + ernoult_export
		case  "87613" 
			// Macros spéciales pour balastre
			lstr = lstr + ltab + lstr_espacement + balastre_export
		case  "87669" 
			// Macros spéciales pour Erasme
			lstr = lstr + ltab + lstr_espacement + "~tpatient_code_erasme"
	end choose

	
	// on rajoute les champs photos
	lstr = lstr + ltab + lstr_espacement + generer_champs_photos(lstr_rep_photos)
	
	if FileWrite(id_fichier_out, lstr) >= 1 then
	// si on a pu écrire la première ligne
		// on tranfo "lstr" en string de tabulation pour
		// simuler un enregistrement
		lstr = string_tabulation(lstr)
		if lstr <> "" then
		// si pas de pb
			if FileWrite(id_fichier_out, lstr) >= 1 then
			// si on a pu écrire la 2nd ligne --> maj valeur à retourner
				return_val = 1
			end if
		end if
	end if
	
	// fermeture du fichier d'export final
	return_val = FileClose(id_fichier_out)
	
end if

// fermeture du fichier d'export initial
return_val = FileClose(id_fichier_in)

return return_val

end function

public function integer traiter_export_txt (integer lservice, string nom_fichier[], ref datawindow ldw, string chemin_fichier[], long ltab_patients[]);// fx qui récup le fichier d'export et le complète
// suivant le type de doc à imprimer
// return 1 si ok, -1 si pb

integer		return_val = -1
boolean	on_sort = false
boolean	sortie_de_boucle = false
boolean	generer_photo = false
boolean	generer_entete = false
boolean	lb_other_ligne = false

string	date_time
int		type_courrier, loops
string	lstr, lstr2
long		j, nbrelem, nbrelem_tab_elem, k
long		phcNbr = 1
integer	id_fichier_in
integer	id_fichier_out[]
string	nom_fichier_out[]
boolean	au_moins_1_ligne[]
long		lnum_row_patient
double	num_lettre
string	lstr_ligne1	= ""
string	lrep_photos
string	tab_elem_recup[], tableau_vide[]
string	lstr_photo
string	lstr_espacement = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
pourHistoCourrier	phc[]

string v_imprim_specif

// init des vars
lrep_photos 			= fxg_get_rep_photos() 			// recup du rep photos

if lrep_photos = "" then 
	messagebox("ERREUR ...", "Le dossier Photos est invalide, veuillez y remédier. ~n~nOpération annulée.", StopSign!)
	return return_val
end if
nbrelem_tab_elem 	= upperbound(ltab_patients)		// recup nbr d'élèm de ltab_patients passé en param
nbrelem 				= UpperBound(nom_fichier)		// récup nbr de fichier de d'export finaux (passé en param)
type_courrier 			= witch_lettre(nom_fichier[1], chemin_fichier[1])		// recup du type de courrier
date_time 				= string( today(), "yyyy-mm-dd hh-mm-ss - " )	// pour la sauvegarde des fichiers (lien hypertexte ds histio courriers)

// ouverture du fichier d'import initial (appelé aussi export intermédiaire)
id_fichier_in = fileopen(dir_ini + nom_source, lineMode!, read!, LockReadWrite!)

for j=1 to nbrelem
	// on traite le nom de fichier passé en param en suprimant le ".doc"
	// et rajoutant "_" + nom_source
	nom_fichier_out[j] = generer_nom_fichier_export(nom_fichier[j])
	
	// ouverture d'un fichier d'export final
	id_fichier_out[j] = fileopen(dir_ini + nom_fichier_out[j], LineMode!, write!, LockReadWrite!, Replace! )
	
	// init du tableau de bool pour savoir si impression utile
	au_moins_1_ligne[j] = false
next

// pour dire que, par défaut, on ne travaille pas sur le ticket de rdv
//RegistrySet(param_inter_proc, var10, RegString!, '0' )			// pour dire que c'est PAS un ticket
SetProfilestring(dir_ini+inifile_orthokis,"Macros",var10, '0')  

// pour les formats de rdv
string v_format_rdv
select top 1 format_rdv_courrier into :v_format_rdv from param ;


// Depuis 2016, on peut rediriger vers une imprimante spécifique .... var11 contiendra l'imprimante ... ou rien si imprimante Windows par défaut
double v_id_courrier 
string v_nom_poste
string v_imprimante, v_imprimante_par_defaut

if nbrelem > 0 then 
	v_nom_poste = fxg_get_infos_sybase('MachineName')

	v_id_courrier = get_id_document( chemin_fichier[1] + nom_fichier[1])
	select  imprimante, imprimante_par_defaut into  :v_imprimante, :v_imprimante_par_defaut
	from courriers_word_imprimantes where id_courrier = :v_id_courrier and nom_poste = :v_nom_poste ;
	
	if v_imprimante_par_defaut = "N" then 
		//RegistrySet(param_inter_proc, var11, RegString!, v_imprimante )			// pour l'imprimante à utiliser !
		SetProfilestring(dir_ini+inifile_orthokis,"Macros",var11, v_imprimante)  
	else
		// RegistrySet(param_inter_proc, var11, RegString!, "" )			// pas d'imprimante spécifique
		SetProfilestring(dir_ini+inifile_orthokis,"Macros",var11, "")  
	end if
else
	// RegistrySet(param_inter_proc, var11, RegString!, "" )			// pas d'imprimante spécifique
	SetProfilestring(dir_ini+inifile_orthokis,"Macros",var11, "")  
end if


// Il y a demande de signature numérique
if lservice = Service_MajEtSigne then
	// On utilise la même clef que le ticket => pour rediriger vers une autre imprimante
	//RegistrySet(param_inter_proc, var10, RegString!, '1' )			// pour dire que c'est un ticket
	SetProfilestring(dir_ini+inifile_orthokis,"Macros",var10, '1')  
	// Imprimante spécifique Signature Numérique
	v_imprim_specif = profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","signature_numerique","SIGNificant Client")
	v_imprim_specif = v_imprim_specif +" on "+ w_mdi_2020.imprimantes.getport( v_imprim_specif )

	//RegistrySet(param_inter_proc, var11, RegString!, v_imprim_specif )			// pour l'imprimante à utiliser !
	SetProfilestring(dir_ini+inifile_orthokis,"Macros",var11, v_imprim_specif)  
end if

// Il y a demande de Facture en PDF => On reroute l'impression
if  lservice = Service_MajEtFacture and (profilestring(dir_ini+inifile_orthokis,"admini","facture_pdf","N") = "O" or  Profilestring(dir_ini+inifile_orthokis,"admini","envoi_email_direct","N") = "O" )  then 
	// On utilise la même clef que le ticket => pour rediriger vers une autre imprimante
	//RegistrySet(param_inter_proc, var10, RegString!, '1' )			// pour dire que c'est un ticket
	SetProfilestring(dir_ini+inifile_orthokis,"Macros",var10, '1')  
	
	// On place la facture dans un fichier temporaire .. on le récupèrera ENSUITE
							
	if verif_bullzip_printer(fxg_get_nom_fic_document_orthokis_pdf(), true) then
		// Imprimante spécifique PDF ..
		v_imprim_specif = "Bullzip PDF Printer"
		v_imprim_specif = v_imprim_specif +" on "+ w_mdi_2020.imprimantes.getport( v_imprim_specif )
		//	RegistrySet(param_inter_proc, var11, RegString!, v_imprim_specif )			// pour l'imprimante à utiliser !
		SetProfilestring(dir_ini+inifile_orthokis,"Macros",var11, v_imprim_specif)  
	end if
end if


// on boucle sur fichier d'export intermédiaire jusqu'à ce qu'on rencontre
// une erreur ou qu'il y est une ligne vide indiquant la fin du fichier à lire
DO while read_ligne(id_fichier_in, lb_other_ligne, lstr) > 0 AND not on_sort
	
	Yield()  	// pour mise à jour de la fenêtre patience

	
	if not lb_other_ligne then
	// si on est sur la première ligne : donc celle des noms de champs
		for j=1 to nbrelem
			// pour chacun des fichiers de sortie
			if not generer_entete then
				// si pas enore généré -> pour optimisation en cas de plusieurs courriers
				choose case type_courrier
				// selon type du fichier -> pour rajouter champs spéciaux si nécessaire
					case lettre_appel_honoraires
						lstr_ligne1 = ltab + lstr_espacement + appel_honoraires_export
						
					case lettre_relance_1, lettre_relance_2, lettre_relance_3
						lstr_ligne1 = ltab + lstr_espacement + relance_export
						
					case lettre_report_rdv
						lstr_ligne1 = ltab + lstr_espacement + report_rdv_export
						
					case lettre_renouvellement
						lstr_ligne1 = ltab + lstr_espacement + renouvellement_export
						
					case lettre_rdv_manque
						lstr_ligne1 = ltab + lstr_espacement + rdv_manque_export
						
					case lettre_ticket_rdv
						lstr_ligne1 = ltab + lstr_espacement + ticket_rdv_export
				end choose
				
				choose case serial 
					case "87033" 
						// Macros spéciales pour Ernoult
						lstr_ligne1 = lstr_ligne1 +ltab + lstr_espacement + ernoult_export
					case  "87613" 
						// Macros spéciales pour balastre
						lstr_ligne1 = lstr_ligne1 +ltab + lstr_espacement + balastre_export
					case "87669" 
						// Macros spéciales pour Erasme
						lstr_ligne1 = lstr_ligne1 +ltab + lstr_espacement +  "~tpatient_code_erasme"
				end choose
		
				
				// construction ligne complète à écrire
				// ligne lue ds fichier d'export intermédiaire + champs spéciaux du doc + photos
				lstr = lstr + lstr_ligne1 + ltab + lstr_espacement + generer_champs_photos(lrep_photos)
				
				// maj var
				generer_entete = true
			end if
			
			// on l'inscrit ds fichier d'export final avec les champs à rajouter
			if FileWrite(id_fichier_out[j], lstr) = -1 then
			// un pb est survenu -> on sort de la boucle
				on_sort = true
			end if
			
			
		next
		
		// maj des var pour la suite
		lb_other_ligne = true	// indique que ligne d'entête OK
		k++							// maj du cpt : on va être sur la première ligne de données
		
		else

		// pour les autres lignes du fichier d'export intermédiaire
		if not isnull(ldw) then
		// si la datawin passée en param n'est pas null -> c un courrier de publipostage
		// il peut y avoir des champs spéciaux à récup
			
			// maj des booléens
			sortie_de_boucle	= false	// pour la sortie de boucle
			generer_photo		= true	// pour optimisation
			

				// on essaye de récup le numéro de la première ligne de la datawindow qui se
				// raporte au patient dont on traite la ligne
				// optimisation : -> on utilise l'ordre de trie (on cherche tjrs à partir de i -1)
				
				string  v_code_cherche_str
				double v_code_cherche
				long pos1, pos2
				long nb_lignes , cpt_lignes
				
				pos1 = pos(lstr, "~t")
				pos2 = pos(lstr, "~t", pos1 + 1)
//				v_code_cherche = ltab_patients[k]
//				lnum_row_patient = ldw.find("code = " + string(ltab_patients[k]), k, ldw.RowCount())
				
//				le code du patient est le 3ème champ de la ligne ... l'export n'est pas forcément dans l'orde de la liste !!!
				v_code_cherche_str = mid(lstr, pos1 + 1, pos2 - pos1 - 1)
				v_code_cherche = dec(v_code_cherche_str)
				nb_lignes = ldw.RowCount()
				lnum_row_patient = ldw.find("code = " + v_code_cherche_str, 1,nb_lignes )
				
				// on reset la tableau à cause des zones variables en spécifiques
				tab_elem_recup = tableau_vide 

				if lnum_row_patient >= 1 then
				// si on a bien trouvé une ligne,
				// comme on ne peut lancer cette fontion uniquement avec les lignes groupées
				// --> c forcément la bonne ligne
					choose case type_courrier
					// selon le type de document passé en param :
					// * on récup les données calculées ds la datawindow passée en ref
					// * on complète la string récup du fichier d'export intermédiaire par les valeurs récup de la datawin
					
						case lettre_appel_honoraires
							num_lettre 			= 1
							tab_elem_recup[1] = lstr_espacement
							if mod(ldw.getitemnumber(lnum_row_patient,"csomme_patient"), 1) = 0 then	// somme due euro
								tab_elem_recup[2] = string(ldw.getitemnumber(lnum_row_patient,"csomme_patient"))		// montant rond
							else
								tab_elem_recup[2] = string(ldw.getitemnumber(lnum_row_patient,"csomme_patient"), "0.00")	// montant avec décimale
							end if
							
							if isnull(tab_elem_recup[2]) then tab_elem_recup[2] = ""
							
							if mod(Round (dec(tab_elem_recup[2]) * taux_euro,2) , 1) = 0 then    // somme due francs
								tab_elem_recup[3]	= string(Round (dec(tab_elem_recup[2]) * taux_euro,2))	// montant rond
							else
								tab_elem_recup[3]	= string(Round (dec(tab_elem_recup[2]) * taux_euro,2), "0.00")	// montant avec décimale
							end if
							
							
							
							if isnull(tab_elem_recup[3]) then tab_elem_recup[3] = ""
							tab_elem_recup[4] = string(date(ldw.getitemdatetime(lnum_row_patient,"cdate_patient"))) // date échéance
							if isnull(tab_elem_recup[4]) then tab_elem_recup[4] = ""
							tab_elem_recup[5] = ldw.getitemString(lnum_row_patient,"code_soins_nom") // nom du soin -> en principe inutile (car en groupé) mais ... si un soin ça marche !!
							if isnull(tab_elem_recup[5]) then tab_elem_recup[5] = ""
							tab_elem_recup[6] = string(ldw.getitemNumber(lnum_row_patient,"soins_numero")) // num du soin -> en principe inutile (car en groupé) mais ... si un soin ça marche !!
							if isnull(tab_elem_recup[6]) then tab_elem_recup[6] = ""
							
//							phc[phcNbr].numCourrier = num_lettre
							phc[phcNbr].typeDoc = "APPHON"
							phc[phcNbr].libelle = "Somme due :   " + tab_elem_recup[2] + " "+symbole_euro+" au " + tab_elem_recup[4]
							
						case lettre_relance_1, lettre_relance_2, lettre_relance_3
							num_lettre 			= ldw.getitemnumber(lnum_row_patient, "lettre_relance")
							tab_elem_recup[1] = lstr_espacement

							if mod(ldw.getitemnumber(lnum_row_patient, "total_montant"),1) = 0 then 	// somme due euro
								tab_elem_recup[2]	= string(ldw.getitemnumber(lnum_row_patient, "total_montant"))		// somme rond
							else
								tab_elem_recup[2]	= string(ldw.getitemnumber(lnum_row_patient, "total_montant"), "0.00")		// somme avec décimales
							end if

							
							if isnull(tab_elem_recup[2]) then tab_elem_recup[2] = ""
							
							if mod(Round (dec(tab_elem_recup[2]) * taux_euro,2), 1) = 0 then // somme due francs
								tab_elem_recup[3]	= string(Round (dec(tab_elem_recup[2]) * taux_euro,2))	// somme montant rond
							else
								tab_elem_recup[3]	= string(Round (dec(tab_elem_recup[2]) * taux_euro,2), "0.00")	// somme avec décimale
							end if
							
							
							
							if isnull(tab_elem_recup[3]) then tab_elem_recup[3] = ""
							tab_elem_recup[4]	= string(ldw.getitemdate(lnum_row_patient,"cdate_soin"))	// date échéance impayée
							if isnull(tab_elem_recup[4]) then tab_elem_recup[4] = ""
//							tab_elem_recup[5]	= string(date(ldw.getitemdatetime(lnum_row_patient,"prochain_rdv"))) // date futur rdv
							tab_elem_recup[5]	= jour_et_mois_francais(string(date(ldw.getitemdatetime(lnum_row_patient,"cprochain_rdv")) , v_format_rdv)) // date futur rdv	
							if isnull(tab_elem_recup[5]) then tab_elem_recup[5] = ""
							
//							phc[phcNbr].numCourrier = num_lettre
							phc[phcNbr].typeDoc = "LETRE" + string(num_lettre)
							phc[phcNbr].libelle = "Somme due :   " + tab_elem_recup[2] + " "+symbole_euro
							
						case lettre_report_rdv
							num_lettre 			= 1
							tab_elem_recup[1] = lstr_espacement
							tab_elem_recup[2] = jour_et_mois_francais(string(ldw.getitemdatetime(lnum_row_patient,"rdv_rdv") , v_format_rdv)) // date du rdv reporté
							if isnull(tab_elem_recup[2]) then tab_elem_recup[2] = ""
							
//							phc[phcNbr].numCourrier = num_lettre
							phc[phcNbr].typeDoc = "REPRDV"
							phc[phcNbr].libelle = "Rdv du  " + mid(tab_elem_recup[2] , 1 , 10 ) + " à " + mid(tab_elem_recup[2] , 12 , 16)
							
						case lettre_renouvellement
							num_lettre 			= 1
							tab_elem_recup[1] = lstr_espacement
							tab_elem_recup[2] = string(ldw.getitemdate(lnum_row_patient,"soins_date_demande"))
							if isnull(tab_elem_recup[2]) then tab_elem_recup[2] = ""
							tab_elem_recup[3] = string(ldw.getitemnumber(lnum_row_patient,"soins_scp_demande")) // nombre de lettres
							if isnull(tab_elem_recup[3]) then tab_elem_recup[3] = ""
							
							tab_elem_recup[4] = string(ldw.getitemnumber(lnum_row_patient,"soins_total")) // tarif du soin
							if isnull(tab_elem_recup[4]) then tab_elem_recup[4] = ""
							tab_elem_recup[5] = string(ldw.getitemstring(lnum_row_patient,"code_soins_nom")) // libellé du soin
							if isnull(tab_elem_recup[5]) then tab_elem_recup[5] = ""
							tab_elem_recup[6] = string(ldw.getitemnumber(lnum_row_patient,"soins_numero")) // numero du soin
							if isnull(tab_elem_recup[6]) then tab_elem_recup[6] = ""
							
//							phc[phcNbr].numCourrier = num_lettre
							phc[phcNbr].typeDoc = "RENOUV"
							phc[phcNbr].libelle = "Lettre de Renouvellement"
							
						case lettre_rdv_manque
							num_lettre 			= 1
							tab_elem_recup[1] = lstr_espacement
							//tab_elem_recup[2] = string(ldw.getitemdatetime(lnum_row_patient,"rdv_rdv")) // date du rdv manqué
							tab_elem_recup[2] = jour_et_mois_francais(string(ldw.getitemdatetime(lnum_row_patient,"rdv_rdv") ,v_format_rdv)) // date du rdv manqué
							if isnull(tab_elem_recup[2]) then tab_elem_recup[2] = ""
							tab_elem_recup[3] = jour_et_mois_francais(string(ldw.getitemstring(lnum_row_patient,"rdv_type")))  // type du rdv manqué
							if isnull(tab_elem_recup[3]) then tab_elem_recup[3] = ""
							tab_elem_recup[4] = jour_et_mois_francais(string(ldw.getitemnumber(lnum_row_patient,"rdv_duree"))) // duree du rdv manqué
							if isnull(tab_elem_recup[4]) then tab_elem_recup[4] = ""
							
//							phc[phcNbr].numCourrier = num_lettre
							phc[phcNbr].typeDoc = "ABSENT"
							phc[phcNbr].libelle = "Rdv du " +mid(tab_elem_recup[2] , 1 , 10 ) + " à " + mid(tab_elem_recup[2] , 12 , 16)
							
						case lettre_ticket_rdv
							num_lettre 			= 1
							tab_elem_recup[1] = lstr_espacement
							tab_elem_recup[2] = ldw.getitemString(lnum_row_patient,"date_rdv") // RDV N°1
							if isnull(tab_elem_recup[2]) then tab_elem_recup[2] = ""
							tab_elem_recup[3] = ldw.getitemString(lnum_row_patient,"date_rdv2")  // RDV N°2
							if isnull(tab_elem_recup[3]) then tab_elem_recup[3] = ""
							tab_elem_recup[4] = ldw.getitemString(lnum_row_patient,"date_rdv3") // RDV N°3
							if isnull(tab_elem_recup[4]) then tab_elem_recup[4] = ""
							tab_elem_recup[5] = ldw.getitemString(lnum_row_patient,"date_rdv4") // RDV N°4
							if isnull(tab_elem_recup[5]) then tab_elem_recup[5] = ""
							tab_elem_recup[6] = ldw.getitemString(lnum_row_patient,"date_rdv5") // RDV N°5
							if isnull(tab_elem_recup[6]) then tab_elem_recup[6] = ""
							tab_elem_recup[7] = ldw.getitemString(lnum_row_patient,"date_rdv6") // RDV N°6
							if isnull(tab_elem_recup[7]) then tab_elem_recup[7] = ""
							tab_elem_recup[8] = ldw.getitemString(lnum_row_patient,"rdv_commentaire") // Commentaire du RDV N°1
							if isnull(tab_elem_recup[8]) then tab_elem_recup[8] = ""
							constant string crlf = char(13) + char(10)
							//constant string crlf = char(10)
							tab_elem_recup[8] = gfx_tout_remplacer(tab_elem_recup[8], crlf, crlf_parse)

							if mod(dec(ldw.getitemString(lnum_row_patient,"somme_due_date_rdv") ), 1) = 0 then
								tab_elem_recup[9] = string(dec(ldw.getitemString(lnum_row_patient,"somme_due_date_rdv"))) 				// Somme due à la date du rdv .. en string
							else
								tab_elem_recup[9] = string(dec(ldw.getitemString(lnum_row_patient,"somme_due_date_rdv")),"0.00") 				// Somme due à la date du rdv .. en string
							end if
							
							if isnull(tab_elem_recup[9]) then tab_elem_recup[9] = ""
													
							phc[phcNbr].numCourrier = num_lettre
							phc[phcNbr].typeDoc = "TICKET"
							phc[phcNbr].libelle = "Rdv du  " +tab_elem_recup[2]
							//mid(tab_elem_recup[2] , 1 , 10 ) + " à " + mid(tab_elem_recup[2] , 12 , 16)
							
							// pour le ticket de rdv ... !!!
							//RegistrySet(param_inter_proc, var10, RegString!, '1' )			// pour dire que c'est un ticket
							SetProfilestring(dir_ini+inifile_orthokis,"Macros",var10,'1')  
						
							// Imprimante spécifique Ticket de RDV ???
							v_imprim_specif = ''
							if profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","rdv_active","N")  = 'O' then
								// recherche de l'imprimante spécifique pour le ticket de rdv
								v_imprim_specif = profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","ticket_rdv","") 
								//uo_liste_imprimantes  imprim		// Pour utiliser la fonction de recherche de port
								//imprim = CREATE uo_liste_imprimantes 
								v_imprim_specif = v_imprim_specif +" on "+ w_mdi_2020.imprimantes.getport( v_imprim_specif )
							end if
							//RegistrySet(param_inter_proc, var11, RegString!, v_imprim_specif )			// pour l'imprimante à utiliser !
							SetProfilestring(dir_ini+inifile_orthokis,"Macros",var11,v_imprim_specif) 
							
						
						case else
							num_lettre 			= 1
							tab_elem_recup[1] 	= lstr_espacement
							
//							phc[phcNbr].numCourrier = num_lettre
							
							choose case type_courrier
								case  lettre_patient_anni
									phc[phcNbr].typeDoc = "ANNIVE"
									phc[phcNbr].libelle = "Lettre Anniversaire"
								case lettre_patient_recontacter
									phc[phcNbr].typeDoc = "ARECON"
									phc[phcNbr].libelle = "Patient à Recontacter"
								case lettre_patient_x_ans
									phc[phcNbr].typeDoc = "PATXAN"
									phc[phcNbr].libelle = "Patient qui va avoir x ans"
								case lettre_patients_sans_rdv
									phc[phcNbr].typeDoc = "PASRDV"
									phc[phcNbr].libelle = "Demande de prise de RDV"
								case lettre_surveillance
									phc[phcNbr].typeDoc = "VISSUR"
									phc[phcNbr].libelle = "Visite de Surveillance"
							end choose
					end choose
					
					choose case serial
						case "87033" 
						// Spécial ernoult
							ajout_champs_ernoult(v_code_cherche, tab_elem_recup, lstr_espacement)
						// Spécial balastre
						case "87613" 
							ajout_champs_balastre(v_code_cherche, tab_elem_recup, lstr_espacement)
						case "87669" 
							// Spécial Erasme
							ajout_champs_erasme(v_code_cherche, tab_elem_recup, lstr_espacement)
					end choose
					
					
					// rajout d'info commune à la structure d'enreg en histo
					phc[phcNbr].numCourrier = num_lettre
					
					if num_lettre <> 0 then
					// si le numéro de la lettre <> 0 (rappel : si num lettre = 0 : on ne doit pas l'imprimer)
						// on isole le str pour traitement
						lstr2  = lstr
						
						for j=1 to upperbound(tab_elem_recup)
						// pour chacun des élem récup
							
//							if isnull(tab_elem_recup[j]) then
//							// si la val est null -> transfo en chaine vide
//								tab_elem_recup[j] = ""
//							end if
//							
//							// pour l'histo : afin d'éviter les pbs
//							if isnull(phc[phcNbr].libelle) then phc[phcNbr].libelle = ""
							
							// on rajoute les champs spéciaux
							lstr2 += ltab + tab_elem_recup[j]
						next
						
						if generer_photo then
						// uniquement lors de la première itération sur la boucle
						// 1 seul exécution pour un patient donné
						
							// -> génération des champs photos
							//lstr_photo = generer_photos_pour_patient(ltab_patients[k], lrep_photos)
							lstr_photo = generer_photos_pour_patient(v_code_cherche, lrep_photos)
							
							if lstr_photo <> "" then
							// si des photos sont config
								if upperbound(tab_elem_recup) >= 2 then
								// si publipostage a des champs spéciaux
									lstr_photo = ltab + lstr_espacement + lstr_photo
								end if
							end if
							
							// maj bool
							generer_photo = false
						end if
						
						// on rajoute les champs photos
						lstr2 += lstr_photo
						
						// on insére "lstr" ds le bon fichier
						if FileWrite(id_fichier_out[num_lettre], lstr2) = -1 then
						// un pb est survenu -> on sort de la boucle
							on_sort = true
						else
						// no pb --> garde une trace pour l'enreg en histo futur
//							phc[phcNbr].numPatient = ltab_patients[k]
							phc[phcNbr].numPatient = v_code_cherche
							phc[phcNbr].chemin_courrier = lrep_photos + string( phc[phcNbr].numPatient ) + win_delimiter + date_time + nom_fichier[num_lettre]
							phcNbr++
						end if
						
						// on indique qu'une ligne est écrite
						au_moins_1_ligne[num_lettre] = true
						
					end if
					
				else
				// impossible de trouver le patient traité : pas normale -> on part en erreur
					on_sort = true
				end if
				
//				// si l'élèm suivant du ltab_patients est différents de l'élèm actuel
//				// -> on doit sortir
//				if k +1 <= nbrelem_tab_elem then
//				// si prochain élèm existe
//					// si prochain élèm <> de élèm courant -> on peut sortir de la boucle
//					if ltab_patients[k +1] <> ltab_patients[k] then sortie_de_boucle = true
//					
//					// ds tout les cas on avance : maj du cpt
//					k++
//				else
//				// il n'y a pas de prochain élém -> fin du traitement, on sort de la boucle
//					sortie_de_boucle = true
//				end if
//			loop
			
		else
			// la datawin pasée en param est null -> courrier individuel
		
			choose case serial
				case "87033" 
					// Spécial ernoult
					ajout_champs_ernoult(ltab_patients[1], tab_elem_recup, lstr_espacement)
									
					for j=1 to upperbound(tab_elem_recup)
					// pour chacun des élem récup
									
						// on rajoute les champs spéciaux
						lstr = lstr + ltab + tab_elem_recup[j]
					next
					
				case "87613" 
					// Spécial balastre
					ajout_champs_balastre(ltab_patients[1], tab_elem_recup, lstr_espacement)
									
					for j=1 to upperbound(tab_elem_recup)
					// pour chacun des élem récup
									
						// on rajoute les champs spéciaux
						lstr = lstr + ltab + tab_elem_recup[j]
					next
				case  "87669" 
					// Macros spéciales pour Erasme
					ajout_champs_erasme(ltab_patients[1], tab_elem_recup, lstr_espacement)
									
					for j=1 to upperbound(tab_elem_recup)
					// pour chacun des élem récup
									
						// on rajoute les champs spéciaux
						lstr = lstr + ltab + tab_elem_recup[j]
					next
			end choose
				
			// on insère les champs photos
			lstr = lstr + ltab + lstr_espacement + generer_photos_pour_patient(ltab_patients[1], lrep_photos)
			
			// on insére "lstr" ds le bon fichier
			if FileWrite(id_fichier_out[1], lstr) = -1 then
				// un pb est survenu -> on sort de la boucle
				on_sort = true
			else
				// no pb --> garde une trace pour l'enreg en histo futur
				phc[1].numPatient = ltab_patients[1]
				phc[1].typeDoc = "WORD"
				phc[1].libelle = nom_fichier[1]
				phc[1].numCourrier = 1
				phc[1].chemin_courrier = lrep_photos + string( phc[1].numPatient ) + win_delimiter + date_time + nom_fichier[1]
			end if
	
//			// si on a pas annulé, on indique qu'une ligne est écrite
//			if phc[1].libelle <> "" then au_moins_1_ligne[1] = true
			au_moins_1_ligne[1] = true
			
		end if
	end if
loop

// fermeture du fichier source export.txt
FileClose(id_fichier_in)


// Cas particulier de la feuille de soins pour rediriger l'imprimante
if  type_courrier = lettre_fs2014 then
	
	// On utilise le même mécanisme que le ticket de rendez-vous mais pas le meme fichier doc
	
	// pour le ticket de rdv ... !!!
	//RegistrySet(param_inter_proc, var10, RegString!, '1' )			// pour dire que c'est un ticket
	SetProfilestring(dir_ini+inifile_orthokis,"Macros",var10,'1') 
	
	// Imprimante spécifique FS ???
	v_imprim_specif = ''
	if profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","feuilles_soins_active","N")  = 'O' then
		// recherche de l'imprimante spécifique pour les feuilles de soins
		v_imprim_specif = profileString(dir_ini+inifile_orthokis,"IMPRIMANTES","feuilles_soins","") 
		v_imprim_specif = v_imprim_specif +" on "+ w_mdi_2020.imprimantes.getport( v_imprim_specif )
	end if
	//RegistrySet(param_inter_proc, var11, RegString!, v_imprim_specif )			// pour l'imprimante à utiliser !
	SetProfilestring(dir_ini+inifile_orthokis,"Macros",var11,v_imprim_specif) 
	
end if

for j=1 to nbrelem
// pour chacun des fichiers de sortie
	// fermeture du fichier
	FileClose(id_fichier_out[j])
	
	// impression du fichier
	if (not on_sort) AND au_moins_1_ligne[j] then
	// si pas d'erreur rencontrée jusque là ET si le fichier à au moins 1 ligne de données
		if lien_word(lservice, chemin_fichier[j], nom_fichier[j], j, phc ) <> 1 then
		// si un pb lors du traitement des macros word (impression + enreg histo + enreg courrier ds rep patient)
			messagebox("ATTENTION", "Impossible de poursuivre !~n~nL'opération a été annulée à la demande de l'utilisateur ou d'un problème technique !", StopSign!)
			on_sort = true
		end if
		
//		if lien_word(lservice, chemin_fichier[j], nom_fichier[j]) = -1 then
//		// si un pb lors de l'impression -> on l'indique
//			on_sort = true
//		else
//		// no pb --> enreg ds histo des patients ...
//			nbrelem_tab_elem = upperbound(phc)
//			for k=1 to nbrelem_tab_elem
//				if phc[k].numCourrier = j then 
//				// ... pour ce courrier uniquement
//					// et si on doit l'imprimer (cf si phc[1].libelle <> "" )
//					if phc[1].libelle <> "" then 
//						fxg_enregcourrierhisto ( phc[k].numPatient , phc[k].typeDoc , today() , phc[k].libelle, phc[k].chemin_courrier, 'E' , 'N')
//					end if
//				end if
//			next
//		end if
	end if
next

if on_sort then
// si on a rencontré un pb
	return -1
else
// tout va bien
	return 1
end if

end function

public function integer open_connection_word ();// fx qui connecte la var oleoject passée en référence au serveur automation WORD
// return 1 si ok,
// et -1 si pb de connection server
// appel d'une fx générale

int val_retour
val_retour = gfx_open_connection_ole(wrd, "word.application")

If val_retour = -1 then
	MessageBox("ERREUR","Impossible d'utiliser Microsoft WORD.~n~nVeuillez vérifier son installation !",StopSign!)
end if

return val_retour

end function

public function integer close_connection_word ();// fx qui se déconnecte proprement du serveur OLE automation
// SANS QUITTER WORD
// appel d'une fx générale

int	returnval = -1


returnval = gfx_close_connection_ole(wrd)

sleep( long( profilestring(dir_ini+inifile_orthokis,"Macros","attente","2000") )  )

return returnval
end function

public function integer traiter_avec_word (integer lservice, string nom_fichier[], ref datawindow ldw, string chemin_fichier[], boolean patient_courant);// fx qui exporte les données "classics" du dataobject
// "dw_export_lienword" ds un fichier export.txt
// puis passe le relais à la fx "traiter_export_txt" qui
// va compléter ce fichier selon le type de fichiers
// le fichier ainsi générer servira de source aux macros word
// return	1 si OK,
//				0 si pas de row ds la datawin passé en param
//				-1 si pb

integer		return_val = -1

Datastore	dw_export
long			i, NbrRowsDataWin
long			tab_liste_dossier[]	// le tableau des num de dossier à retriever

string 		v_fichier
string 		v_fichier_pdf_temporaire
string 		v_nom_des_dents_extraites

if lservice <= 0 then
	return -1
end if

string v_pays 

Trace( "==== Entrée dans traiter_avec_word ==== ")
Trace( "    Service : " + string(lservice))


// faut fusionner des données


if not isnull(ldw) then
	
	// Depuis la version 2011, le fichiers de publipostages peuvent se trouver dans ses sous répertoires
	// On redécoupe donc les tableaux pour n'avoir 
	// dans nom_fichier, que les nom de fichier .DOC
	// dans chemin_fichier, que les répertoires ...
	
	for i = 1 to UpperBound(nom_fichier) 
		v_fichier = trim(nom_fichier[i])
		nom_fichier[i] = gfx_extraire_nom_fichier(v_fichier)
		chemin_fichier[i] = chemin_fichier[i] + left( v_fichier, len(v_fichier) - len(nom_fichier[i]) )
	next

	
	// si la datawin est valide -> on est avec les courriers de publipostage
	// récup du nbr total de rows ds la datawin passée en param
	NbrRowsDataWin = ldw.RowCount()
	
	choose case NbrRowsDataWin
		case 0
			// pas de rows --> maj val de retour
			return_val = 0
			
		case is >= 1
			// au moins une valeur !
			for i = 1 to NbrRowsDataWin
			// récupération de chacun des numéros de dossier des patients de la datawin
				tab_liste_dossier[i] = long(ldw.getitemnumber(i, "code"))
			next
			
			// pour les courriers de publipostage : tjrs OK à ce stade
			var_suite = true
	
	end choose
	
else
	//datawin = null -> courrier simple
	// utilisation du patient courant ?
	if patient_courant then 
		tab_liste_dossier[1] = var_code
		var_suite = true
	else
		// recherche du patient
		var_suite = false
		if open(w_cherche) = 1 then
			// si on annule pas l'opération - on récup le num patient sélec
			if var_suite then tab_liste_dossier[1] = var_code
		end if
	end if
end if


if var_suite then 
	
	if lservice = Service_SigneEnLigne_Direct then
		// => Pas de fusion de données
		
		return_val = 1
		
	else
		// fusion des données

		Trace( "Traiter_avec_word - var_suite")
		
		// si on peut poursuivre
		// définition du datastore d'export de données
		dw_export = CREATE DataStore
		dw_export.DataObject = "dw_export_lienword"
		dw_export.SetTransObject(SQLCA)
		
		// on retrieve les données
		dw_export.retrieve(tab_liste_dossier)
	
		Trace( "Traiter_avec_word - tab_liste_dossier[1] = " + string( tab_liste_dossier[1]) )
		
		// parse les retours chariot sur les champs en multi-ligne
		
		// Depuis champs RTF convertis en BRUT, on n'a plus qu'un char(10)
		//constant string crlf = char(13) + char(10)
		constant string crlf = char(10)
	
		string champ
		int index
	
		
		// Mise à jour des champs calculés
			long  tot
			date v_date1
			datetime v_datetime
			decimal v_montant
			double v_code_local
			string v_type
			integer v_duree
	
			tot = dw_export.RowCount	()
			
			// Format des rendez-vous paramétré
			string v_format_rdv_word
			select min(param.format_rdv_courrier) into :v_format_rdv_word from param ;
		
		
		for index = 1 to tot
			
			Yield()  	// pour mise à jour de la fenêtre patience
			
			// pour le champ "patient_patient_motif_relance"
			champ = dw_export.getitemstring(index, "patient_patient_motif_relance")
			if not isnull(champ) then dw_export.setitem(index, "patient_patient_motif_relance", gfx_tout_remplacer(champ, crlf, crlf_parse))
			
			// pour le champ "patient_patient_plan_de_traitement"
			champ = dw_export.getitemstring(index, "patient_patient_plan_de_traitement")
			if not isnull(champ) then dw_export.setitem(index, "patient_patient_plan_de_traitement", gfx_tout_remplacer(champ, crlf, crlf_parse))
			
			// pour le champ "patient_patient_plan_de_traitement"
			champ = dw_export.getitemstring(index, "patient_patient_complement_plan_de_traitement")
			if not isnull(champ) then dw_export.setitem(index, "patient_patient_complement_plan_de_traitement", gfx_tout_remplacer(champ, crlf, crlf_parse))
	
			// pour le champ "patient_patient_diagnostic"
			champ = dw_export.getitemstring(index, "patient_patient_diagnostic")
			if not isnull(champ) then dw_export.setitem(index, "patient_patient_diagnostic", gfx_tout_remplacer(champ, crlf, crlf_parse))
			
			// pour le champ "patient_patient_diagnostic_dentaire"
			champ = dw_export.getitemstring(index, "patient_patient_diagnostic_dentaire")
			if not isnull(champ) then dw_export.setitem(index, "patient_patient_diagnostic_dentaire", gfx_tout_remplacer(champ, crlf, crlf_parse))
			
			// pour le champ "patient_patient_diagnostic_fonctionnel"
			champ = dw_export.getitemstring(index, "patient_patient_diagnostic_fonctionnel")
			if not isnull(champ) then dw_export.setitem(index, "patient_patient_diagnostic_fonctionnel", gfx_tout_remplacer(champ, crlf, crlf_parse))
		
			// pour le champ "patient_patient_diagnostic_alveolaire"
			champ = dw_export.getitemstring(index, "patient_patient_diagnostic_alveolaire")
			if not isnull(champ) then dw_export.setitem(index, "patient_patient_diagnostic_alveolaire", gfx_tout_remplacer(champ, crlf, crlf_parse))
	
			// pour le champ "patient_remarques"
			champ = dw_export.getitemstring(index, "patient_remarques_administratives")
			if not isnull(champ) then dw_export.setitem(index, "patient_remarques_administratives", gfx_tout_remplacer(champ, crlf, crlf_parse))
	
			// pour le champ "patient_remarques_cliniques"
			champ = dw_export.getitemstring(index, "patient_remarques_cliniques")
			if not isnull(champ) then dw_export.setitem(index, "patient_remarques_cliniques", gfx_tout_remplacer(champ, crlf, crlf_parse))
			
			
			// extractions
			select top 1 nom_des_dents_extraites into :v_nom_des_dents_extraites from param ;
			if v_nom_des_dents_extraites = "O" then
				
				// On ajoute une , à la fin car on va toutes les élminer ensuite
				champ = dw_export.getitemstring(index, "patient_patient_extraction") + ','
				dw_export.setitem(index, "patient_patient_extraction", nom_des_dents (champ)	 )
				
				// On ajoute une , à la fin car on va toutes les élminer ensuite
				champ = dw_export.getitemstring(index, "patient_patient_dents_soins") + ','
				dw_export.setitem(index, "patient_patient_dents_soins", nom_des_dents (champ)	 )

			end if
			
			// pour le champ "prati_praticien_entete"
			champ = dw_export.getitemstring(index, "prati_praticien_entete")
			if not isnull(champ) then dw_export.setitem(index, "prati_praticien_entete", gfx_tout_remplacer(champ, crlf, crlf_parse))
			
			// pour le champ "prati_praticien_bas_page"
			champ = dw_export.getitemstring(index, "prati_praticien_bas_page")
			if not isnull(champ) then dw_export.setitem(index, "prati_praticien_bas_page", gfx_tout_remplacer(champ, crlf, crlf_parse))
			
			// pour le champ "param_secu_pour_devis"
			champ = dw_export.getitemstring(index, "param_secu_pour_devis")
			if not isnull(champ) then dw_export.setitem(index, "param_secu_pour_devis", gfx_tout_remplacer(champ, crlf, crlf_parse))
			
			// pour le champ "param_contention_pour_devis"
			champ = dw_export.getitemstring(index, "param_contention_pour_devis")
			if not isnull(champ) then dw_export.setitem(index, "param_contention_pour_devis", gfx_tout_remplacer(champ, crlf, crlf_parse))
			
			// pour le champ "prati_praticien_institution"
			champ = dw_export.getitemstring(index, "prati_praticien_institution")
			if not isnull(champ) then dw_export.setitem(index, "prati_praticien_institution", gfx_tout_remplacer(champ, crlf, crlf_parse))
	
			// pour le champ "prati_praticien_identification_structure"
			champ = dw_export.getitemstring(index, "prati_praticien_identification_structure")
			if not isnull(champ) then dw_export.setitem(index, "prati_praticien_identification_structure", gfx_tout_remplacer(champ, crlf, crlf_parse))
			
			// pour les champ praticiens logos et signature => c'est des fichiers images ...
			champ = dw_export.getitemstring(index, "prati_praticien_logo")
			if not isnull(champ) and fileExists(champ) then 
				dw_export.setitem(index, "prati_praticien_logo",fxg_dir_2_format_dir(champ))
			else
				dw_export.setitem(index, "prati_praticien_logo", fxg_dir_2_format_dir(dir_ini + fichier_photo_vide))
			end if
			champ = dw_export.getitemstring(index, "prati_praticien_logo2")
			if not isnull(champ) and fileExists(champ) then 
				dw_export.setitem(index, "prati_praticien_logo2",fxg_dir_2_format_dir(champ))
			else
				dw_export.setitem(index, "prati_praticien_logo2", fxg_dir_2_format_dir(dir_ini + fichier_photo_vide))
			end if
			champ = dw_export.getitemstring(index, "prati_praticien_logo3")
			if not isnull(champ) and fileExists(champ) then 
				dw_export.setitem(index, "prati_praticien_logo3",fxg_dir_2_format_dir(champ))
			else
				dw_export.setitem(index, "prati_praticien_logo3", fxg_dir_2_format_dir(dir_ini + fichier_photo_vide))
			end if
			
			champ = dw_export.getitemstring(index, "prati_praticien_signature")
			if not isnull(champ) and fileExists(champ) then 
				dw_export.setitem(index, "prati_praticien_signature",fxg_dir_2_format_dir(champ))
			else
				dw_export.setitem(index, "prati_praticien_signature", fxg_dir_2_format_dir(dir_ini + fichier_photo_vide))
			end if
			
			// Champs calculés en live !!!
			
			v_code_local = dw_export.getitemnumber(index, "patient_numero_interne")
			
			// Somme due ...
			// Depuis V2014 .. on ne met plus de somme due négative
			double v_somme_due
			v_somme_due = due(v_code_local, today())
			if v_somme_due < 0 then
				v_somme_due = 0
			end if
			dw_export.SetItem(index, "patient_somme_due_a_ce_jour", v_somme_due )
	
			// Somme due pour la famille = somme due par le patient + les autres !!!
			v_somme_due = v_somme_due +  due_parente(v_code_local, today()) 
			if v_somme_due < 0 then
				v_somme_due = 0
			end if
			dw_export.SetItem(index, "patient_somme_due_famille_a_ce_jour", v_somme_due)
	
			
			// Date du jour ... avec un format paramétrable
			date v_date_jour
			integer v_format_date_jour_word 
			string v_date_jour_word
			select cast(getdate() as date), min(format_date_jour_word) into :v_date_jour, :v_format_date_jour_word from param ;
			
			choose case v_format_date_jour_word
				case 1
					v_date_jour_word = string(v_date_jour)
				case 2
					v_date_jour_word = string(day(v_date_jour))+" "+mois[month(v_date_jour)] + " " + string(year(v_date_jour))
				Case 3
					v_date_jour_word =  jour[daynumber(v_date_jour)] + " " + string(day(v_date_jour))+" "+mois[month(v_date_jour)] + " " + string(year(v_date_jour))
				case else
					v_date_jour_word = string(v_date_jour)
			end choose
			
			dw_export.SetItem(index, "date_du_jour", v_date_jour_word)
	
			
			// Date et montant du prochain reglement
			proc_reglt(v_code_local, v_date, v_montant, "P")
			dw_export.SetItem(index, "patient_date_prochain_reglement", v_date)
			dw_export.SetItem(index, "patient_montant_prochain_reglement", v_montant)
			
			// Elements du prochain rendez-vous ....
			v_datetime = proc_rdv(v_code_local)
			dw_export.SetItem(index, "patient_prochain_rendez_vous", jour_et_mois_francais(string(v_datetime, v_format_rdv_word)))
			select min(duree) into :v_duree from rdv where rdv = :v_datetime and code = :v_code_local ;
			zeroi(v_duree)
			dw_export.SetItem(index, "patient_duree_prochain_rendez_vous", string(v_duree))	// string dans la dw
			v_type = ''
			select min(type_rdv.nom) into :v_type from rdv, type_rdv where rdv."type" = type_rdv.code and rdv = :v_datetime and rdv.code = :v_code_local ;
			dw_export.SetItem(index, "patient_type_prochain_rendez_vous", v_type)		
	
			// format des zones de téléphones ....
			select pays_parent1 into :v_pays from patient where code = :v_code_local ;
			dw_export.SetItem(index, "patient_patient_telephone_portable", formater_zone_pays_datastore(v_pays, 'P', dw_export.GetItemString(index,"patient_patient_telephone_portable")))
			dw_export.SetItem(index, "parent1_telephone_domicile", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"parent1_telephone_domicile")))
			dw_export.SetItem(index, "patient_parent1_telephone_domicile2", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"patient_parent1_telephone_domicile2")))
			dw_export.SetItem(index, "parent1_telephone_travail", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"parent1_telephone_travail")))
			dw_export.SetItem(index, "patient_parent1_telephone_travail2", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"patient_parent1_telephone_travail2")))
			dw_export.SetItem(index, "parent1_telephone_portable", formater_zone_pays_datastore(v_pays, 'P', dw_export.GetItemString(index,"parent1_telephone_portable")))
			dw_export.SetItem(index, "patient_parent1_telephone_portable2", formater_zone_pays_datastore(v_pays, 'P', dw_export.GetItemString(index,"patient_parent1_telephone_portable2")))
	
	
			select pays_parent2 into :v_pays from patient where code = :v_code_local ;
			dw_export.SetItem(index, "parent2_telephone_domicile", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"parent2_telephone_domicile")))
			dw_export.SetItem(index, "patient_parent2_telephone_domicile2", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"patient_parent2_telephone_domicile2")))
			dw_export.SetItem(index, "parent2_telephone_travail", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"parent2_telephone_travail")))
			dw_export.SetItem(index, "patient_parent2_telephone_travail2", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"patient_parent2_telephone_travail2")))
			dw_export.SetItem(index, "patient_parent2_telephone_portable", formater_zone_pays_datastore(v_pays, 'P', dw_export.GetItemString(index,"patient_parent2_telephone_portable")))
			dw_export.SetItem(index, "patient_parent2_telephone_portable2", formater_zone_pays_datastore(v_pays, 'P', dw_export.GetItemString(index,"patient_parent2_telephone_portable2")))
	
			select pays_payeur into :v_pays from patient where code = :v_code_local ;
			dw_export.SetItem(index, "patient_payeur_telephone_domicile", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"patient_payeur_telephone_domicile")))
			dw_export.SetItem(index, "patient_payeur_telephone_domicile2", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"patient_payeur_telephone_domicile2")))
			dw_export.SetItem(index, "patient_payeur_telephone_travail", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"patient_payeur_telephone_travail")))
			dw_export.SetItem(index, "patient_payeur_telephone_travail2", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"patient_payeur_telephone_travail2")))
			dw_export.SetItem(index, "patient_payeur_telephone_portable", formater_zone_pays_datastore(v_pays, 'P', dw_export.GetItemString(index,"patient_payeur_telephone_portable")))
			dw_export.SetItem(index, "patient_payeur_telephone_portable2", formater_zone_pays_datastore(v_pays, 'P', dw_export.GetItemString(index,"patient_payeur_telephone_portable2")))
			
			select pays into :v_pays from correspondants, patient where correspondants.code = patient.code_correspondant and  patient.code = :v_code_local ;
			dw_export.SetItem(index, "correspondant_telephone", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"correspondant_telephone")))
	
			select pays into :v_pays from correspondants, patient where correspondants.code = patient.code_dentiste and  patient.code = :v_code_local ;
			dw_export.SetItem(index, "dentiste_telephone", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"dentiste_telephone")))
	
			select pays into :v_pays from correspondants, patient where correspondants.code = patient.code_medecin and  patient.code = :v_code_local ;
			dw_export.SetItem(index, "autre_dentiste_telephone", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"autre_dentiste_telephone")))
	
			// On ne traite pas cette zone là
			//dw_export.SetItem(index, "prati_praticien_telephone", formater_zone_pays_datastore(v_pays, 'T', dw_export.GetItemString(index,"prati_praticien_telephone")))
			
			// Elements du rendez-vous du jour .... 
			double v_code_interne_rdv_du_jour
			datetime v_rdv_du_jour
			string v_jour
			
			select min(code_interne) into :v_code_interne_rdv_du_jour from rdv, etat_rdv where rdv.code = :v_code_local and 
				cast("rdv"."rdv" as date) = cast(getdate() as date)  and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;
	
			select rdv.rdv, rdv.duree, type_rdv.nom  
			into :v_rdv_du_jour, :v_duree, :v_type 
			from rdv, type_rdv  
			where code_interne = :v_code_interne_rdv_du_jour and "type_rdv"."code" = "rdv"."type" ;
	
			v_jour = jour(daynumber(date(v_rdv_du_jour)))
	
	//
			dw_export.SetItem(index, "patient_rendez_vous_du_jour", jour_et_mois_francais(string(v_rdv_du_jour, v_format_rdv_word)))
			dw_export.SetItem(index, "patient_duree_rendez_vous_du_jour", string(v_duree))	// string dans la dw
			dw_export.SetItem(index, "patient_type_rendez_vous_du_jour", v_type)		
			dw_export.SetItem(index, "patient_jour_rendez_vous_du_jour", v_jour)		
			
			if signature_numerique or MON_ORTHODONTISTE or signature_dentalsign  or TEA then
				v_fichier_pdf_temporaire = dir_ini + "signature_tmp`"
				dw_export.SetItem(index, "signature_numerique_1", chaine_word_signature_numerique1 + v_fichier_pdf_temporaire)		
				dw_export.SetItem(index, "signature_numerique_2", chaine_word_signature_numerique2 + v_fichier_pdf_temporaire)		
				dw_export.SetItem(index, "signature_numerique_3", chaine_word_signature_numerique3 + v_fichier_pdf_temporaire)		
			end if
					
		next
		dw_export.AcceptText()
	
		
		long totlig, totcol, cptlig, cptcol
		string v_chaine
		
	
		totlig = dw_export.rowcount()
		
		//Trace( "Avant Traitement des ''  " + string( totlig) + " Lignes dans dw_export")
		
		totcol = long(dw_export.Object.DataWindow.Column.Count)
		
		//Trace( "Début Traitement des '' " + string(totcol)+ " colonnes")
	
		for cptcol = 1 to totcol
	
			v_type =   dw_export.Describe("#"+string(cptcol) + ".ColType")
			
			if left(v_type,5) = "char(" then
			
				for cptlig = 1 to totlig
					
					// on compte les " .. si impaires ... , on en vire 1
					v_chaine = dw_export.getItemString(cptlig, cptcol) 
					if mod (compter_caractere ( '"' , v_chaine ) , 2) = 1 then
					
						// le nombre de " est impaire => on supprime la 1ère qu'on trouve !!!
						v_chaine = sup_caractere ( '"' , v_chaine)
						dw_export.SetItem(cptlig, cptcol, v_chaine) 
					end if
					
				next
			end if
		next
		
		// Bidouille pour copier tous les fichiers entêtes et bas de page en local, puis modifier le fichier dw_export pour éviter liens externe
		// *******************************************************************************************
		
	
		// recherche des noms de fichiers pour les mettre dans un .INI .. uniquement les actifs depuis 25.00j
		declare cur_prat cursor for select code, chemin_complet_entete, chemin_complet_bas_page, chemin_complet_signature, 
		chemin_complet_logo, chemin_complet_logo2 , chemin_complet_logo3 	
		from prati where actif = 1;
	
		string inifile_entetes = "entetes.ini"
		
		inifile_entetes = dir_ini + inifile_entetes
		if not fileexists(inifile_entetes) then
			integer v_file
			v_file = FileOpen(inifile_entetes, linemode!, Write!)
			 FileWrite(v_file, "")
			 FileClose(v_file)
		end if
	
		string v_code_praticien, v_entete, v_bas_page, v_signature, v_logo, v_logo2, v_logo3
		string v_entete_local, v_bas_page_local, v_signature_local, v_logo_local, v_logo_local2, v_logo_local3
		string v_entete_replic, v_bas_page_replic, v_signature_replic, v_logo_replic, v_logo_replic2, v_logo_replic3
		string	dir_courriers_reseau, v_fichier_relatif
		
		integer res
		
		open cur_prat;
		fetch cur_prat into :v_code_praticien, :v_entete, :v_bas_page, :v_signature, :v_logo, :v_logo2, :v_logo3 ;
		
		do while sqlca.sqlcode = 0
			
			// On remets de simple \
			v_entete = upper(gfx_tout_remplacer(v_entete, '"', ''))
			v_entete = gfx_tout_remplacer(v_entete, "\\", "\")
			
			v_bas_page = upper(gfx_tout_remplacer(v_bas_page, '"', ''))
			v_bas_page = gfx_tout_remplacer(v_bas_page, "\\", "\")
	
			// Les autres fichiers non pas de double \
			v_signature = upper(gfx_tout_remplacer(v_signature, '"', ''))
			v_logo = upper(gfx_tout_remplacer(v_logo, '"', ''))
			v_logo2 = upper(gfx_tout_remplacer(v_logo2, '"', ''))
			v_logo3 = upper(gfx_tout_remplacer(v_logo3, '"', ''))
	
	
			// Si on est en réplication ... on va chercher les fichiers en local SI on peut les localiser !!!!
			if Utilisation_distante then
				// dir_courriers contient le chemin local ou sont stockes les courriers en réplication
				dir_courriers_reseau = profilestring(dir_ini + inifile_orthokis,"courriers","dir","")
				dir_courriers_reseau = upper(dir_courriers_reseau)
	
				// est ce que l'Entete est au même endroit en local
				v_fichier_relatif =  right( v_entete, len(v_entete) - len(dir_courriers_reseau))
				if FileExists(dir_courriers + v_fichier_relatif )  then
					v_entete_replic = dir_courriers + v_fichier_relatif
					v_entete = v_entete_replic
				end if
				
				// est ce que le Bas de Page est au même endroit en local
				v_fichier_relatif =  right( v_bas_page, len(v_bas_page) - len(dir_courriers_reseau))
				if FileExists(dir_courriers + v_fichier_relatif )  then
					v_bas_page_replic = dir_courriers + v_fichier_relatif
					v_bas_page = v_bas_page_replic
				end if
				
				// est ce que le logo est au même endroit en local
				v_fichier_relatif =  right( v_logo, len(v_logo) - len(dir_courriers_reseau))
				if FileExists(dir_courriers + v_fichier_relatif )  then
					v_logo_replic = dir_courriers + v_fichier_relatif
					v_logo = v_logo_replic
				end if
				
				// est ce que le logo2 est au même endroit en local
				v_fichier_relatif =  right( v_logo2, len(v_logo2) - len(dir_courriers_reseau))
				if FileExists(dir_courriers + v_fichier_relatif )  then
					v_logo_replic2 = dir_courriers + v_fichier_relatif
					v_logo2 = v_logo_replic2
				end if
				
				// est ce que le logo3 est au même endroit en local
				v_fichier_relatif =  right( v_logo3, len(v_logo3) - len(dir_courriers_reseau))
				if FileExists(dir_courriers + v_fichier_relatif )  then
					v_logo_replic3 = dir_courriers + v_fichier_relatif
					v_logo3 = v_logo_replic3
				end if
				
				// est ce que la signature est au même endroit en local
				v_fichier_relatif =  right( v_signature, len(v_signature) - len(dir_courriers_reseau))
				if FileExists(dir_courriers + v_fichier_relatif )  then
					v_signature_replic = dir_courriers + v_fichier_relatif
					v_signature = v_signature_replic
				end if
				
			end if
			
	
			
			v_entete_local = dir_ini + gfx_extraire_nom_fichier(v_entete)+ ".tmp"
			v_bas_page_local = dir_ini + gfx_extraire_nom_fichier(v_bas_page)+ ".tmp"
			v_signature_local = dir_ini + gfx_extraire_nom_fichier(v_signature)+ ".tmp"
			v_logo_local = dir_ini + gfx_extraire_nom_fichier(v_logo)+ ".tmp"
			v_logo_local2 = dir_ini + gfx_extraire_nom_fichier(v_logo2)+ ".tmp"
			v_logo_local3 = dir_ini + gfx_extraire_nom_fichier(v_logo3)+ ".tmp"
			
			// Les espaces semblent poser problème !!
			v_entete_local = gfx_tout_remplacer(v_entete_local, ' ', '_')
			v_bas_page_local = gfx_tout_remplacer(v_bas_page_local, ' ', '_')
			v_signature_local = gfx_tout_remplacer(v_signature_local, ' ', '_')
			v_logo_local = gfx_tout_remplacer(v_logo_local, ' ', '_')
			v_logo_local2 = gfx_tout_remplacer(v_logo_local2, ' ', '_')
			v_logo_local3 = gfx_tout_remplacer(v_logo_local3, ' ', '_')
			
			
			// recopie des fichiers 
			res = FileCopy(v_entete, v_entete_local, true)
			res = FileCopy(v_bas_page, v_bas_page_local, true)
			res = FileCopy(v_signature, v_signature_local, true)
			res = FileCopy(v_logo, v_logo_local, true)
			res = FileCopy(v_logo2, v_logo_local2, true)
			res = FileCopy(v_logo3, v_logo_local3, true)
			
			// On remet les \\ pour le stockage
			v_entete_local = gfx_tout_remplacer(v_entete_local, "\", "\\")
			v_bas_page_local = gfx_tout_remplacer(v_bas_page_local, "\", "\\")
			v_signature_local = gfx_tout_remplacer(v_signature_local, "\", "\\")
			v_logo_local = gfx_tout_remplacer(v_logo_local, "\", "\\")
			v_logo_local2 = gfx_tout_remplacer(v_logo_local2, "\", "\\")
			v_logo_local3 = gfx_tout_remplacer(v_logo_local3, "\", "\\")
			
			SetProfileString( inifile_entetes, v_code_praticien,"entete"  , v_entete_local )
			SetProfileString( inifile_entetes, v_code_praticien,"bas_page"  , v_bas_page_local )
			SetProfileString( inifile_entetes, v_code_praticien,"signature"  , v_signature_local )
			SetProfileString( inifile_entetes, v_code_praticien,"logo"  , v_logo_local )
			SetProfileString( inifile_entetes, v_code_praticien,"logo2"  , v_logo_local2 )
			SetProfileString( inifile_entetes, v_code_praticien,"logo3"  , v_logo_local3 )
			
			fetch cur_prat into :v_code_praticien, :v_entete, :v_bas_page, :v_signature, :v_logo, :v_logo2, :v_logo3 ;
		loop
		
		close cur_prat ;
		
	
		// Parcours de la liste et remplacement des chemins !
		long lig
		
		tot = dw_export.rowcount()
		
		for lig = 1 to tot
			
			v_code_praticien = dw_export.GetItemString(lig, "prati_praticien_code")
			
			// Test 18/3/2022
			dw_export.SetItem(lig, "prati_praticien_entete", ProfileString( inifile_entetes, v_code_praticien,"entete", ""))
			dw_export.SetItem(lig, "prati_praticien_bas_page", ProfileString( inifile_entetes, v_code_praticien,"bas_page", ""))
			dw_export.SetItem(lig, "prati_praticien_signature", ProfileString( inifile_entetes, v_code_praticien,"signature", ""))
			dw_export.SetItem(lig, "prati_praticien_logo", ProfileString( inifile_entetes, v_code_praticien,"logo", ""))
			dw_export.SetItem(lig, "prati_praticien_logo2", ProfileString( inifile_entetes, v_code_praticien,"logo2", ""))
			dw_export.SetItem(lig, "prati_praticien_logo3", ProfileString( inifile_entetes, v_code_praticien,"logo3", ""))
			
		next
		
		// pour gerer les entête sous la forme {} dans Word, pour contourner les pb de sécurité
		SetProfileString( inifile_entetes, "COURANT","code_praticien"  , v_code_praticien )
		SetProfileString( inifile_entetes, "COURANT","entete"  , gfx_tout_remplacer(  ProfileString( inifile_entetes, v_code_praticien,"entete", "") , "\\", "\") )
		SetProfileString( inifile_entetes, "COURANT","bas_page"  , gfx_tout_remplacer(  ProfileString( inifile_entetes, v_code_praticien,"bas_page", "") , "\\", "\") )
		SetProfileString( inifile_entetes, "COURANT","signature"  , gfx_tout_remplacer(  ProfileString( inifile_entetes, v_code_praticien,"signature", "") , "\\", "\") )
		SetProfileString( inifile_entetes, "COURANT","logo"  , gfx_tout_remplacer(  ProfileString( inifile_entetes, v_code_praticien,"logo", "") , "\\", "\") )
		SetProfileString( inifile_entetes, "COURANT","logo2"  , gfx_tout_remplacer(  ProfileString( inifile_entetes, v_code_praticien,"logo2", "") , "\\", "\") )
		SetProfileString( inifile_entetes, "COURANT","logo3"  , gfx_tout_remplacer(  ProfileString( inifile_entetes, v_code_praticien,"logo3", "") , "\\", "\") )
	
		
		
		//FileDelete(inifile_entetes)
		
		
		// export des données ds le fichier export.txt que l'on place ds
		// le rep d'installation de l'application
		dw_export.SaveAs( dir_ini +nom_source, Text!, true)
		
	//	dw_export.SaveAs( dir_ini + "A"+nom_source, Text!, true)
	//	
	//	
	//	// On traite les " de manière à les virer ... on les remplaces par des ' car ça fout la merde si impaires
	//	
	//	integer  fichier_entree, fichier_sortie, fichier_lu
	//	string v_ligne
	//	
	//	fichier_entree = FileOpen (dir_ini + "A"+nom_source , LineMode!, Read! )
	//	fichier_sortie = FileOpen (dir_ini + nom_source , LineMode!, Write!, LockWrite!, Replace!   )
	//	
	//	
	//	fichier_lu = FileRead( fichier_entree , v_ligne)
	//	do while fichier_lu > 0 
	//		
	//		v_ligne = gfx_tout_remplacer( v_ligne, '"', "'")
	//		FileWrite( fichier_sortie , v_ligne)
	//		fichier_lu = FileRead( fichier_entree , v_ligne)
	//		
	//	loop
	//	
	//	FileClose(fichier_entree)
	//	FileClose(fichier_sortie)
	//	
		
		// on libère la mémoire
		DESTROY dw_export
		
		if traiter_export_txt(lservice, nom_fichier,ldw, chemin_fichier, tab_liste_dossier) = 1 then
			// le traitement du fichier de sortie initial c bien passé -> maj de la valeur de retour
			return_val = 1
		end if
	end if // fin de la fusion des données
	
else
	// on a annulée l'opération -> c pas un bug, juste un choix !
	return_val = 1
end if

return return_val
end function

public function integer traiter_avec_word (integer lservice, string chemin_fichier, string nom_fichier, boolean patient_courant);// fx qui exporte les données "classics" du dataobject
// "dw_export_lienword" ds un fichier qui servira de source aux macros word
// return 1 si OK, -1 si pb

integer		return_val = -1

pourhistocourrier 	phc[]
datawindow		ldw
Datastore			dw_export
long		tab_liste_dossier[]
int			type_courrier

boolean v_suite

if lservice <= 0 then
	return -1
end if

// récup du type de courrier
type_courrier = witch_lettre(nom_fichier, chemin_fichier)


if lservice = Service_EditerCourrier or  lservice = Service_EnregistrerSousPDF or  lservice = Service_Imprime or  lservice = Service_SigneEnLigne_Direct  then
	// si on cherche à éditer le courrier
	// pas besoin de demander la recherche d'un patient
	v_suite = false
	if  lservice = Service_EditerCourrier then
		// on a besoin des champs pour insérer le champ
		if traiter_export_txt (type_courrier, nom_fichier) = 1 then
			v_suite = true
		end if
	else
		v_suite = true
	end if
	if v_suite then
		// le fichier d'export est pret
		if lien_word(lservice, chemin_fichier, nom_fichier, 1, phc) = 1 then
		// l'édition s'est lancée correctement -> maj de la valeur retournée
			return_val = 1
		else
			messagebox("ATTENTION", "Impossible de poursuivre !~n~nL'opération a été annulée à la demande de l'utilisateur ou d'un problème technique !", StopSign!)
		end if
	end if
else
	// on veut imprimer le courrier
	choose case type_courrier
		// selon type de courrier déduit du nom de fichier en param
		// -> on ouvre la fenètre appropriée
		case lettre_appel_honoraires
			if w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_appelh, "Appels d'Honoraires", image_menu_listes_admini) > 1 then
				return_val = 1
			end if
			
		case lettre_relance_1, lettre_relance_2, lettre_relance_3
			str_param_string param_passe  
			param_passe.param = "2"
			w_liste_patients_relance_reglements v_win
			if w_mdi_2020.uo_powerdock.of_openDocument(v_win, param_passe, "Relances Règlements", image_menu_listes_admini) > 1 then
				return_val = 1
			end if
		case lettre_report_rdv
			if w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_report_rdv, "Reports de RDV", image_menu_listes_rdv) > 1 then
				return_val = 1
			end if
		case lettre_renouvellement
			if w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_renouve_nvlle, "DEP pour une Période", image_menu_listes_admini) > 1 then
				return_val = 1
			end if
		case lettre_rdv_manque
			if w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_absents_rdv, "Patients selon Etat de RDV", image_menu_listes_rdv)  > 1 then
				return_val = 1
			end if
		case lettre_patients_sans_rdv
			if w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_sans_rendez_vous, "Patients sans RDV", image_menu_listes_rdv)  > 1 then
				return_val = 1
			end if
		
		case lettre_patient_anni
			if w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_anni, "Patients qui vont avoir leur anniversaire", image_menu_listes_admini) > 1 then
				return_val = 1
			end if
		case lettre_patient_recontacter
			if w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_date_relance, "Patients à Recontacter", image_menu_listes_admini) > 1 then
				return_val = 1
			end if
		case lettre_patient_x_ans
			if w_mdi_2020.uo_powerdock.of_openDocument(w_liste_patients_x_ans, "Patients qui vont avoir x ans", image_menu_listes_admini) > 1 then
				return_val = 1
			end if
			
		case else
		// si pas de champs spéciaux
			// par convention, on rend null la datawin ds ce cas
			if SetNull(ldw) = 1 then
			// si pas de pb pour mettre à null -> on lance le traitement word
				 return_val = traiter_avec_word(lservice, nom_fichier, ldw, chemin_fichier,patient_courant)
			end if
	end choose
end if

return return_val

end function

public function integer traiter_avec_word (integer lservice, string nom_fichier, ref datawindow ldw, string chemin_fichier, boolean patient_courant);// fx qui permet de passer un seul fichier en param
// on le transfo en tableau de string (avec un seul élément donc)
// et on le passe à la fx de même nom qui accepte un tableau 
// à la place d'une string seule

string	ltab_string_nom[]
string	ltab_string_chemin[]
int		retour


ltab_string_nom[1]		= nom_fichier
ltab_string_chemin[1]	= chemin_fichier

retour = traiter_avec_word(lservice, ltab_string_nom, ldw, ltab_string_chemin,patient_courant)

return retour
end function

public function integer traiter_avec_word (integer lservice, string nom_fichier[], ref datawindow ldw, string chemin_fichier[]);// pour compatibilité ...
return traiter_avec_word(lservice, nom_fichier, ldw, chemin_fichier, false)
end function

public function integer witch_lettre (string lnom_fichier, string lchemin_fichier);// fx qui return le type de courrier selon le nom passé en param
// renvoie	1 si pas trouvé (utiliser la constante "lettre_" des var globales)
//				le code du type (cf les constnates définies ds les var globales)

boolean	trouve = false
string	lstr_nom_courrier
int		ltype

string v_rep_courriers


if lnom_fichier = "" then
	return 1
end if

if lnom_fichier = fxg_nom_fichier_fs2014_doc_ou_docx() or lnom_fichier = nom_fichier_attestation then
	// cas particulier de la Feuille de Soin 2014 gérée en dur 
	// idem pour attestation de soin car on retoute sur la même imprimante
	ltype = lettre_fs2014
else
	
	v_rep_courriers = fxg_get_rep_courriers()
	
	DECLARE courriers_types CURSOR FOR  
	SELECT 	"nom_courrier", "type_courrier"
	FROM 		"courriers" ;
	
	// ouverture du curseur
	OPEN courriers_types ;
	
	do
		// on lit 1 ligne
		FETCH courriers_types INTO :lstr_nom_courrier, :ltype ;
		
		if not isnull(lstr_nom_courrier) then
			// si on a pu récup qqch
			// Depuis v2011, on peut config des sous répertoire pour le publipostage
			// Dans une fonction précédente, chemin_fichier et nom_fichier ont été mis au propre pour bien 
			// spéarer le chemin du fichier des noms de fichier 
			// => On teste donc la concaténation complèete pour être sur 
			if upper(v_rep_courriers + lstr_nom_courrier) = upper(lchemin_fichier + lnom_fichier) then
			// si on a trouvé le fichier -> on l'indique
				trouve = true
			end if
		end if
		
	// on boucle tant que pas fin de curseur ET type pas trouvé
	loop while SQLCA.sqlcode = 0 AND not trouve
	
	// fermeture du curseur
	CLOSE courriers_types ;
	
	
	// si on a pas trouvé -> on return une erreur
	if not trouve then ltype = lettre_
end if

return ltype
end function

public function integer word_en_avant_plan (integer numero_variable);
// Place Word en avant plan
// Renvoie 0 si pas bon



// Attention 
// Pour mettre Word en Avant plan, on a besoin de connaitre le non du fichier qui est en édition
// Si c'est AVANT d'être enregistré, c'est dans VAR12 (fichier temporaire)
// Si c'est APRES enregistrement (mémorisation automatique), c'est dans VAR (fichier finale)

// => on passe 6 ou 12 en paramètre pour savoir la variable à lire
 
string lpClassName
string titre_fenetre_word, titre_fenetre_word_compatibilite
long hdle_word = 0

long v_retour
integer valeur_retour = 0

string clef_dans_base_de_registre
string nom_fichier_word 

clef_dans_base_de_registre = "var" + string(numero_variable)

setnull(lpClassName)

//titre_fenetre_word = nom_fichier_ouvert_sous_word + " - Microsoft Word"

//if TRACE then
//	// Trace Fichier
//	FileWrite(Fichier_trace, "UO_WORD - WORD EN AVANT PLAN - Début")
//end if


// hdle_word = long ( ProfileString ( dir_ini + inifile_orthokis , "communication", "handle_word", "0") )  
//
//if hdle_word > 0 then
//	// Ecrit par Word !!
//	
//		
//		valeur_retour = 1
//		
//		v_retour = ShowWindow( hdle_word ,3)	// puis on passe de suite Word en Maximize (param 3)
//	
//		//Trace( "UO_WORD - WORD EN AVANT PLAN - Retour Show Window : " + string(v_retour) )
//	
//		// Pour être SUR !!!!!!!!!!!!!
//		v_retour = BringWindowToTop( hdle_word )	
//		//v_retour = SetForegroundWindow (hdle_word)
//		
//		
//
//else
	
	
//if RegistryGet(param_inter_proc, var12, RegString!, nom_fichier_word ) = 1 then

if profilestring(dir_ini+inifile_orthokis,"Macros",var12,"")  <> "" then

	// Var12 
	titre_fenetre_word = nom_fichier_word + " - Microsoft Word"
		
	//Trace ("UO_WORD - WORD EN AVANT PLAN - Titre fenetre Word : " + titre_fenetre_word )

	hdle_word = FindWindowA ( lpClassName, titre_fenetre_word) 
	
	//Trace( "UO_WORD - WORD EN AVANT PLAN - Handle fenetre Word : " + string(hdle_word) )

	zerol(hdle_word)
	
	if hdle_word = 0 then 
		// autre tentative avec autre titre

		titre_fenetre_word = nom_fichier_word + " - Word"
		
		hdle_word = FindWindowA ( lpClassName, titre_fenetre_word) 
	
		zerol(hdle_word)
	end if

	if hdle_word = 0 then 
		// autre tentative avec autre titre

		titre_fenetre_word = nom_fichier_word + " - Microsoft Word utilisation nom commerciale"
		
		hdle_word = FindWindowA ( lpClassName, titre_fenetre_word) 
	
		zerol(hdle_word)
	end if

	if hdle_word > 0 then
		
		valeur_retour = 1
		
		v_retour = ShowWindow( hdle_word ,3)	// puis on passe de suite Word en Maximize (param 3)
	
		//Trace( "UO_WORD - WORD EN AVANT PLAN - Retour Show Window : " + string(v_retour) )
	
		// Pour être SUR !!!!!!!!!!!!!
		v_retour = BringWindowToTop( hdle_word )	
		//v_retour = SetForegroundWindow (hdle_word)
		
		
		//Trace("UO_WORD - WORD EN AVANT PLAN - Retour BrinWindowToTop : " + string(v_retour) )
	end if
end if
//end if
//Trace("UO_WORD - WORD EN AVANT PLAN - Fin")


//MessageBox("TRACE","Fenêtre cherchée : " + titre_fenetre_word+"~n~nRésultat : "+string(valeur_retour) )


return valeur_retour
end function

public subroutine mettre_word_en_avant_plan (integer numero_variable);
// On essaie de mettre word en avant plan ... on se donne x tentatives => x secondes
// Pas de gestion des retours


// Numero variable correspond au numero de var (var6 ou var12) contient le fichier à remettre en premier plan


// Boucle pour mettre le courrier en AVANT PLAN
integer nb_tentatives_autorisees = 5
integer retour_word_en_avant_plan

//on a trouvé la fenetre ou pas trouvé au bout de n tentatives
do while word_en_avant_plan(numero_variable) = 0 and  nb_tentatives_autorisees > 0 
	sleep (1000)
	nb_tentatives_autorisees = nb_tentatives_autorisees - 1
loop


////on a trouvé la fenetre ou pas trouvé au bout de n tentatives
//do while word_en_avant_plan_2016() = 0 and  nb_tentatives_autorisees > 0 
//	sleep (1000)
//	nb_tentatives_autorisees = nb_tentatives_autorisees - 1
//loop



return
end subroutine

public subroutine ferme_document_genere ();

//messagebox("trace","Avant le lancement de : " + macro_CLoseDocGene)

// Ferme le document Word qui vient d'être généré
lancer_une_macro( macro_CLoseDocGene )

//messagebox("trace","Après la fermeture")




end subroutine

public subroutine ajout_champs_ernoult (double v_code_cherche, ref string tab_elem_recup[], string lstr_espacement);
constant string crlf = char(10)
constant string crlf2 = char(13)

if serial = "87033" then
	
	// Macros spéciales pour Ernoult
	string v_ernoult1, v_ernoult2, v_ernoult3, v_ernoult4, v_ernoult5, v_ernoult6, v_ernoult7 
	string v_ernoult8, v_ernoult9, v_ernoult10, v_ernoult11,  v_ernoult12, v_ernoult13, v_ernoult14 
	string v_ernoult15, v_ernoult16 
	
	select isnull(BYTE_SUBSTR( perso, 535,500),'') into :v_ernoult1 from diagnos where code =  :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 2035,500),'') into :v_ernoult2 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 1035,500),'') into :v_ernoult3 from diagnos where code = :v_code_cherche ;
//	select isnull(BYTE_SUBSTR( perso, 1535,500),'') into :v_ernoult4 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 10200,1000),'') into :v_ernoult4 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 3069,500),'') into :v_ernoult5 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 4569,500),'') into :v_ernoult6 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 3569,500),'') into :v_ernoult7 from diagnos where code = :v_code_cherche ;
//	select isnull(BYTE_SUBSTR( perso, 4069,500),'') into :v_ernoult8 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 11200,1000),'') into :v_ernoult8 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 5603,500),'') into :v_ernoult9 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 7103,500),'') into :v_ernoult10 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 6103,500),'') into :v_ernoult11 from diagnos where code = :v_code_cherche ;
//	select isnull(BYTE_SUBSTR( perso, 6603,500),'') into :v_ernoult12 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 12200,1000),'') into :v_ernoult12 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 8137,500),'') into :v_ernoult13 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 9637,500),'') into :v_ernoult14 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 8637,500),'') into :v_ernoult15 from diagnos where code = :v_code_cherche ;
//	select isnull(BYTE_SUBSTR( perso, 9137,500),'') into :v_ernoult16 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 13200,1000),'') into :v_ernoult16 from diagnos where code = :v_code_cherche ;
	
	// pour le traitement des retour à la ligne des zones 
	v_ernoult1 = gfx_tout_remplacer(v_ernoult1, crlf, crlf_parse)
	v_ernoult2 = gfx_tout_remplacer(v_ernoult2, crlf, crlf_parse)
	v_ernoult3 = gfx_tout_remplacer(v_ernoult3, crlf, crlf_parse)
	v_ernoult4 = gfx_tout_remplacer(v_ernoult4, crlf, crlf_parse)
	v_ernoult5 = gfx_tout_remplacer(v_ernoult5, crlf, crlf_parse)
	v_ernoult6 = gfx_tout_remplacer(v_ernoult6, crlf, crlf_parse)
	v_ernoult7 = gfx_tout_remplacer(v_ernoult7, crlf, crlf_parse)
	v_ernoult8 = gfx_tout_remplacer(v_ernoult8, crlf, crlf_parse)
	v_ernoult9 = gfx_tout_remplacer(v_ernoult9, crlf, crlf_parse)
	v_ernoult10 = gfx_tout_remplacer(v_ernoult10, crlf, crlf_parse)
	v_ernoult11 = gfx_tout_remplacer(v_ernoult11, crlf, crlf_parse)
	v_ernoult12 = gfx_tout_remplacer(v_ernoult12, crlf, crlf_parse)
	v_ernoult13 = gfx_tout_remplacer(v_ernoult13, crlf, crlf_parse)
	v_ernoult14 = gfx_tout_remplacer(v_ernoult14, crlf, crlf_parse)
	v_ernoult15 = gfx_tout_remplacer(v_ernoult15, crlf, crlf_parse)
	v_ernoult16 = gfx_tout_remplacer(v_ernoult16, crlf, crlf_parse)

	v_ernoult1 = trim(gfx_tout_remplacer(v_ernoult1, crlf2, ""))
	v_ernoult2 = trim(gfx_tout_remplacer(v_ernoult2, crlf2, ""))
	v_ernoult3 = trim(gfx_tout_remplacer(v_ernoult3, crlf2, ""))
	v_ernoult4 = trim(gfx_tout_remplacer(v_ernoult4, crlf2, ""))
	v_ernoult5 = trim(gfx_tout_remplacer(v_ernoult5, crlf2, ""))
	v_ernoult6 = trim(gfx_tout_remplacer(v_ernoult6, crlf2, ""))
	v_ernoult7 = trim(gfx_tout_remplacer(v_ernoult7, crlf2, ""))
	v_ernoult8 = trim(gfx_tout_remplacer(v_ernoult8, crlf2, ""))
	v_ernoult9 = trim(gfx_tout_remplacer(v_ernoult9, crlf2, ""))
	v_ernoult10 = trim(gfx_tout_remplacer(v_ernoult10, crlf2, ""))
	v_ernoult11 = trim(gfx_tout_remplacer(v_ernoult11, crlf2, ""))
	v_ernoult12 = trim(gfx_tout_remplacer(v_ernoult12, crlf2, ""))
	v_ernoult13 = trim(gfx_tout_remplacer(v_ernoult13, crlf2, ""))
	v_ernoult14 = trim(gfx_tout_remplacer(v_ernoult14, crlf2, ""))
	v_ernoult15 = trim(gfx_tout_remplacer(v_ernoult15, crlf2, ""))
	v_ernoult16 = trim(gfx_tout_remplacer(v_ernoult16, crlf2, ""))

	// Suppression des tabulation 
	v_ernoult1 = trim(gfx_tout_remplacer(v_ernoult1, ltab, space(5)))
	v_ernoult2 = trim(gfx_tout_remplacer(v_ernoult2, ltab, space(5)))
	v_ernoult3 = trim(gfx_tout_remplacer(v_ernoult3, ltab, space(5)))
	v_ernoult4 = trim(gfx_tout_remplacer(v_ernoult4, ltab, space(5)))
	v_ernoult5 = trim(gfx_tout_remplacer(v_ernoult5, ltab, space(5)))
	v_ernoult6 = trim(gfx_tout_remplacer(v_ernoult6, ltab, space(5)))
	v_ernoult7 = trim(gfx_tout_remplacer(v_ernoult7, ltab, space(5)))
	v_ernoult8 = trim(gfx_tout_remplacer(v_ernoult8, ltab, space(5)))
	v_ernoult9 = trim(gfx_tout_remplacer(v_ernoult9, ltab, space(5)))
	v_ernoult10 = trim(gfx_tout_remplacer(v_ernoult10, ltab, space(5)))
	v_ernoult11 = trim(gfx_tout_remplacer(v_ernoult11, ltab, space(5)))
	v_ernoult12 = trim(gfx_tout_remplacer(v_ernoult12, ltab, space(5)))
	v_ernoult13 = trim(gfx_tout_remplacer(v_ernoult13, ltab, space(5)))
	v_ernoult14 = trim(gfx_tout_remplacer(v_ernoult14, ltab, space(5)))
	v_ernoult15 = trim(gfx_tout_remplacer(v_ernoult15, ltab, space(5)))
	v_ernoult16 = trim(gfx_tout_remplacer(v_ernoult16, ltab, space(5)))


	integer nb_elem_ernoult 
	nb_elem_ernoult = upperbound(tab_elem_recup)
	tab_elem_recup[nb_elem_ernoult + 1] = lstr_espacement
	tab_elem_recup[nb_elem_ernoult + 2] = v_ernoult1
	tab_elem_recup[nb_elem_ernoult + 3] = v_ernoult2
	tab_elem_recup[nb_elem_ernoult + 4] = v_ernoult3
	tab_elem_recup[nb_elem_ernoult + 5] = v_ernoult4
	tab_elem_recup[nb_elem_ernoult + 6] = v_ernoult5
	tab_elem_recup[nb_elem_ernoult + 7] = v_ernoult6
	tab_elem_recup[nb_elem_ernoult + 8] = v_ernoult7
	tab_elem_recup[nb_elem_ernoult + 9] = v_ernoult8
	tab_elem_recup[nb_elem_ernoult + 10] = v_ernoult9
	tab_elem_recup[nb_elem_ernoult + 11] = v_ernoult10
	tab_elem_recup[nb_elem_ernoult + 12] = v_ernoult11
	tab_elem_recup[nb_elem_ernoult + 13] = v_ernoult12
	tab_elem_recup[nb_elem_ernoult + 14] = v_ernoult13
	tab_elem_recup[nb_elem_ernoult + 15] = v_ernoult14
	tab_elem_recup[nb_elem_ernoult + 16] = v_ernoult15
	tab_elem_recup[nb_elem_ernoult + 17] = v_ernoult16
end if
end subroutine

public subroutine ajout_champs_balastre (double v_code_cherche, ref string tab_elem_recup[], string lstr_espacement);
constant string crlf = char(10)
constant string crlf2 = char(13)

if serial = "87613" then
	
	// Macros spéciales pour balastre
	string v_balastre1, v_balastre2, v_balastre3, v_balastre4, v_balastre5, v_balastre6, v_balastre7 
	
//	select isnull(BYTE_SUBSTR( perso, 8,10),'') into :v_balastre1 from diagnos where code =  :v_code_cherche ;
//	select isnull(BYTE_SUBSTR( perso, 38,10),'') into :v_balastre2 from diagnos where code = :v_code_cherche ;
//	select isnull(BYTE_SUBSTR( perso, 48,10),'') into :v_balastre3 from diagnos where code = :v_code_cherche ;
//	select isnull(BYTE_SUBSTR( perso, 78,25),'') into :v_balastre4 from diagnos where code = :v_code_cherche ;
//	select isnull(BYTE_SUBSTR( perso, 18,20),'') into :v_balastre5 from diagnos where code = :v_code_cherche ;
//	select isnull(BYTE_SUBSTR( perso, 58,20),'') into :v_balastre6 from diagnos where code = :v_code_cherche ;
//	select isnull(BYTE_SUBSTR( perso, 103,25),'') into :v_balastre7 from diagnos where code = :v_code_cherche ;

	select isnull(BYTE_SUBSTR( perso, 817,10),'') into :v_balastre1 from diagnos where code =  :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 827,20),'') into :v_balastre5 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 847,10),'') into :v_balastre2 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 857,10),'') into :v_balastre3 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 867,20),'') into :v_balastre6 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 887,25),'') into :v_balastre4 from diagnos where code = :v_code_cherche ;
	select isnull(BYTE_SUBSTR( perso, 912,25),'') into :v_balastre7 from diagnos where code = :v_code_cherche ;
	
	
	// pour le traitement des retour à la ligne des zones 
	v_balastre1 = gfx_tout_remplacer(v_balastre1, crlf, crlf_parse)
	v_balastre2 = gfx_tout_remplacer(v_balastre2, crlf, crlf_parse)
	v_balastre3 = gfx_tout_remplacer(v_balastre3, crlf, crlf_parse)
	v_balastre4 = gfx_tout_remplacer(v_balastre4, crlf, crlf_parse)
	v_balastre5 = gfx_tout_remplacer(v_balastre5, crlf, crlf_parse)
	v_balastre6 = gfx_tout_remplacer(v_balastre6, crlf, crlf_parse)
	v_balastre7 = gfx_tout_remplacer(v_balastre7, crlf, crlf_parse)

	v_balastre1 = trim(gfx_tout_remplacer(v_balastre1, crlf2, ""))
	v_balastre2 = trim(gfx_tout_remplacer(v_balastre2, crlf2, ""))
	v_balastre3 = trim(gfx_tout_remplacer(v_balastre3, crlf2, ""))
	v_balastre4 = trim(gfx_tout_remplacer(v_balastre4, crlf2, ""))
	v_balastre5 = trim(gfx_tout_remplacer(v_balastre5, crlf2, ""))
	v_balastre6 = trim(gfx_tout_remplacer(v_balastre6, crlf2, ""))
	v_balastre7 = trim(gfx_tout_remplacer(v_balastre7, crlf2, ""))

	// Suppression des tabulation 
	v_balastre1 = trim(gfx_tout_remplacer(v_balastre1, ltab, space(5)))
	v_balastre2 = trim(gfx_tout_remplacer(v_balastre2, ltab, space(5)))
	v_balastre3 = trim(gfx_tout_remplacer(v_balastre3, ltab, space(5)))
	v_balastre4 = trim(gfx_tout_remplacer(v_balastre4, ltab, space(5)))
	v_balastre5 = trim(gfx_tout_remplacer(v_balastre5, ltab, space(5)))
	v_balastre6 = trim(gfx_tout_remplacer(v_balastre6, ltab, space(5)))
	v_balastre7 = trim(gfx_tout_remplacer(v_balastre7, ltab, space(5)))


	integer nb_elem_balastre 
	nb_elem_balastre = upperbound(tab_elem_recup)
	tab_elem_recup[nb_elem_balastre + 1] = lstr_espacement
	tab_elem_recup[nb_elem_balastre + 2] = v_balastre1
	tab_elem_recup[nb_elem_balastre + 3] = v_balastre2
	tab_elem_recup[nb_elem_balastre + 4] = v_balastre3
	tab_elem_recup[nb_elem_balastre + 5] = v_balastre4
	tab_elem_recup[nb_elem_balastre + 6] = v_balastre5
	tab_elem_recup[nb_elem_balastre + 7] = v_balastre6
	tab_elem_recup[nb_elem_balastre + 8] = v_balastre7
end if
end subroutine

public function integer word_en_avant_plan_2016 ();
// Place Word en avant plan
// Renvoie 0 si pas bon
// Depuis 2016, on se base sur le Handle de Word que nous donne Word


long hdle_word = 0
long v_retour
integer valeur_retour = 0

hdle_word = long ( ProfileString ( dir_ini + inifile_orthokis , "communication", "handle_word", "0") )  


//messagebox("trace", string(hdle_word))
if hdle_word > 0 then
	
	valeur_retour = 1
	
	v_retour = ShowWindow( hdle_word ,3)	// puis on passe de suite Word en Maximize (param 3)

	// Pour être SUR !!!!!!!!!!!!!
	v_retour = BringWindowToTop( hdle_word )	
	
	
end if

return valeur_retour
end function

public subroutine ajout_champs_erasme (double v_code_cherche, ref string tab_elem_recup[], string lstr_espacement);
if serial = "87669" then
	string v_id_erasme
	select isnull(identifiant_erasme, '') into :v_id_erasme from erasme_patient where code_patient = :v_code_cherche ;

	integer nb_elem_erasme
	nb_elem_erasme = upperbound(tab_elem_recup)
	tab_elem_recup[nb_elem_erasme + 1] = lstr_espacement
	tab_elem_recup[nb_elem_erasme + 2] = v_id_erasme
	
end if
end subroutine

public function string nom_des_dents (string champ);
// remplacement du nom des dents extraites
champ = trim(gfx_tout_remplacer(champ, "11,", "11 (incisive supérieure centrale droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "12,", "12 (incisive supérieure latérale droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "13,", "13 (canine supérieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "14,", "14 (première prémolaire supérieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "15,", "15 (deuxième prémolaire supérieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "16,", "16 (première molaire supérieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "17,", "17 (deuxième molaire supérieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "18,", "18 (troisième molaire supérieure droite)" + crlf_parse))

champ = trim(gfx_tout_remplacer(champ, "21,", "21 (incisive centrale supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "22,", "22 (incisive latérale supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "23,", "23 (canine supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "24,", "24 (première prémolaire supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "25,", "25 (deuxième prémolaire supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "26,", "26 (première molaire supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "27,", "27 (deuxième molaire supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "28,", "28 (troisième molaire supérieure gauche)" + crlf_parse))

champ = trim(gfx_tout_remplacer(champ, "31,", "31 (incisive inférieure centrale gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "32,", "32 (incisive inférieure latérale gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "33,", "33 (canine inférieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "34,", "34 (première prémolaire inférieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "35,", "35 (deuxième prémolaire inférieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "36,", "36 (première molaire inférieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "37,", "37 (deuxième molaire inférieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "38,", "38 (troisième molaire inférieure gauche)" + crlf_parse))

champ = trim(gfx_tout_remplacer(champ, "41,", "41 (incisive centrale inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "42,", "42 (incisive latérale inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "43,", "43 (canine inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "44,", "44 (première prémolaire inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "45,", "45 (deuxième prémolaire inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "46,", "46 (première molaire inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "47,", "47 (deuxième molaire inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "48,", "48 (troisième molaire inférieure droite)" + crlf_parse))

champ = trim(gfx_tout_remplacer(champ, "51,", "51 (incisive temporaire supérieure centrale droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "52,", "52 (incisive temporaire supérieure latérale droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "53,", "53 (canine temporaire supérieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "54,", "54 (première molaire temporaire supérieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "55,", "55 (deuxième molaire temporaire supérieure droite)" + crlf_parse))

champ = trim(gfx_tout_remplacer(champ, "61,", "61 (incisive temporaire centrale supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "62,", "62 (incisive temporaire latérale supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "63,", "63 (canine temporaire supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "64,", "64 (première molaire temporaire supérieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "65,", "65 (deuxième molaire temporaire supérieure gauche)" + crlf_parse))

champ = trim(gfx_tout_remplacer(champ, "71,", "71 (incisive temporaire inférieure centrale gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "72,", "72 (incisive temporaire inférieure latérale gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "73,", "73 (canine temporaire inférieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "74,", "74 (première molaire temporaire inférieure gauche)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "75,", "75 (deuxième molaire temporaire inférieure gauche)" + crlf_parse))

champ = trim(gfx_tout_remplacer(champ, "81,", "81 (incisive temporaire centrale inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "82,", "82 (incisive temporaire latérale inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "83,", "83 (canine temporaire inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "84,", "84 (première molaire temporaire inférieure droite)" + crlf_parse))
champ = trim(gfx_tout_remplacer(champ, "85,", "85 (deuxième molaire temporaire inférieure droite)" + crlf_parse))

return champ 
end function

on uo_lien_word.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_lien_word.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

