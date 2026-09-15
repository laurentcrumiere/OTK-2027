$PBExportHeader$w_lienword.srw
forward
global type w_lienword from window
end type
type st_1 from statictext within w_lienword
end type
type dw_export from datawindow within w_lienword
end type
end forward

global type w_lienword from window
integer width = 2190
integer height = 972
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
dw_export dw_export
end type
global w_lienword w_lienword

type variables
String nom_source = "export.dat"
int return_code = 0
end variables

forward prototypes
public function integer gf_parse_plus (string as_string, ref string as_array[], ref integer ai_count, string as_delimiter)
public function integer checkprocess ()
end prototypes

public function integer gf_parse_plus (string as_string, ref string as_array[], ref integer ai_count, string as_delimiter);// Returns  0 = success
//     1 = error
//
// as_string  Source string containing values delimited by as_delimiter
// as_array[]  Destination array, passed by value
// ai_count   Returns count of items in array
// as_delimiter delimiter value

int   li_pos   // position of commas
int   li_len   // string parsing
int   li_start   // string parsing
string  ls_item   // single item parsed from string

if Len ( as_string ) < 1 then
 ai_count = 0
 return 1
end if

// parse out items and insert into array

li_pos  = 1
li_start = 1
ai_count = 0

DO WHILE li_pos > 0

 li_pos = Pos ( as_string, as_delimiter, li_start )

 if li_pos = 0 then
  ls_item = Mid ( as_string, li_start )
 else
  ls_item = Mid ( as_string, li_start, li_pos - li_start )
 end if

 ls_item = Trim ( ls_item )

 if Len ( ls_item ) > 0 then
  ai_count++
  as_array[ai_count] = ls_item
 end if

 li_start = li_pos + 1

LOOP

return 0 
end function

public function integer checkprocess ();Constant Long PROCESS_VM_READ = 16
Constant Long PROCESS_QUERY_INFORMATION = 1024

Long ll_size
Long ll_index
Long ll_index1
Long ll_index2
Long ll_hprocess
Long ll_modulebytes
Long ll_processbytes
Long ll_modulecount
Long ll_processcount

String ls_modulename

ULong ll_modules[]
ULong ll_processes[]


// Initialize Process array.
For ll_index1 = 1024 To 1 Step -1
	ll_processes[ll_index1] = 0
Next

// Initialize Module array.
For ll_index2 = 1024 To 1 Step -1
	ll_modules[ll_index2] = 0
Next

// Size of each array (i.e. 1024 x 4 bytes).
ll_size = 4096

// Get the Processes.
If EnumProcesses(ll_processes[], ll_size, ll_processbytes) > 0 Then
	// Determine the number of Processes.
	ll_processcount = (ll_processbytes / 4)
	// Loop through Processes.
	For ll_index1 = 1 To ll_processcount
		// Get the access rights to read and query Process.
		ll_hprocess = OpenProcess(PROCESS_QUERY_INFORMATION+PROCESS_VM_READ, 0, ll_processes[ll_index1])
		// Ensure we have the handle to a process.
		If ll_hprocess > 0 Then
			// Get the Moudles for a specified Process.
			If EnumProcessModules(ll_hprocess, ll_modules[], ll_size, ll_modulebytes) <> 0 Then
				// Determine the number of Modules.
				ll_modulecount = (ll_modulebytes / 4)

				// I could have continued to loop through all of these modules for each process,
				// But I'm interested in the 1st Module of each process, (i.e. the process itself).
				// This is a great way to determine if a process is currently running and running
				// in a specific location.


				For ll_index2 = 1 To 1 // To list all modules use ll_modules[ll_index2]
					// Reset module name.
					ls_modulename = Space(256)

					// Get the Module filename.
					If GetModuleFileNameEx(ll_hprocess, ll_modules[ll_index2], ls_modulename, Len(ls_modulename)) > 0 Then

//						// To check for a specific process, look in the module name that is returned.
//						If Pos(Upper(ls_modulename), 'C:\WINNT\SYSTEM32\NOTEPAD.EXE') > 0 Then
							// Add the Module filename to the ListBox.
							// In this demo I'm listing all top level processes.						
							If Pos( Upper(ls_modulename),'WINWORD') > 0 Then
								return 1
							End If
//						End If
					End If
				Next
			End If
			// Close the opened handle.
			CloseHandle(ll_hprocess)
		End If
	Next
End If

return 0
end function

event open;

// 10.10.2012 : Link avec Orthokis


// Initalisation des variables globales

dir_ini = "c:\power\ortho\"
taux_euro = 6.55957

symbole_euro = "€"



utilisation_distante = false

trace = false





//--------------------------------------------------------------------------



// On va chercher le VRAI répertoire d'installation de Power ORTHOkis
RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths\Orthokis.exe","path",dir_ini)

if dir_ini = '' or isnull(dir_ini) then
	CloseWithReturn(this, 601)
	return
else
	// Il faut prendre le premier chemin, avant le ";"
	if pos(dir_ini,";") > 0 then
		dir_ini = left(dir_ini, pos(dir_ini,";") - 1)
	end if
	dir_ini = dir_ini + "\"
	
	//on test si fichier de conf "orthokis.ini" est bien présent, sinon message ...
	if not FileExists(dir_ini + "orthokis.ini") then
		CloseWithReturn(this, 601)
		return
	end if
end if

//************************ Lecture des parametres ************************//
String test = "\\Dell-xps-1700\power\ortho\Lettres Types\Administratif patient\'Décharge dossier.doc'4188'PRAT'N"

String delimiter = "'"
String args[]

int nb

String commandline 
commandline = Message.StringParm

//messagebox("TRACE","commandline " + commandline)



//gf_parse_plus (test,args,nb,delimiter)
gf_parse_plus (commandline,args,nb,delimiter)

if nb <> 5 then
	CloseWithReturn(this, 101)
	return
end if

if checkprocess() <> 0 then
	CloseWithReturn(this, 201)
	return
end if




String rep_photos 			
rep_photos = fxg_get_rep_photos()
if not FileExists(rep_photos+'\\'+args[3]) then
	CreateDirectory(rep_photos+'\\'+args[3])
end if

// répertoire courrier
dir_courriers = profilestring(dir_ini + inifile_orthokis,"courriers","dir","")

//************************ Connection à la base ************************//
//Prépa transaction pour la base ORTHOKIS
SQLCA.DBMS 			= "ODBC"
SQLCA.database 	= "Orthokis"
SQLCA.userid 		= "dba"
SQLCA.dbpass 		= "sql"
SQLCA.autocommit 	= false
SQLCA.dbparm	= "Block = 1,ConnectString='DSN=Orthokis;UID=dba;PWD=sql'"

CONNECT;	//connection

If SQLCA.sqlcode <> 0 Then
	return_code = 2
	return	
end if

double version_base 
string im_2013

		SELECT "version_base", "symbole_euro",  "imagerie_2013"  INTO :version_base, :symbole_euro, :im_2013 
		FROM "dba"."param";

if im_2013 = 'O' then
	imagerie_2013 = false
else
	imagerie_2013 = true
end if 
			
		
//messagebox("info",version_base)
//************************ Génération des fichiers dat ************************//

double			tab_liste_dossier[]	// le tableau des num de dossier à retriever

tab_liste_dossier[1] = double(args[3])
utilisateur_code = args[4]

//messagebox("TRACE","utilisateur_code " + utilisateur_code)

	// définition du datastore d'export de données
	dw_export.SetTransObject(SQLCA)
	
	// on retrieve les données
	dw_export.retrieve(tab_liste_dossier)
	
	// parse les retours chariot sur les champs en multi-ligne
	constant string crlf = char(13) + char(10)
	string champ
	int index
	datetime v_datetime
	decimal v_montant
	double v_code_local
	string v_type
	integer v_duree
	string v_fichier_pdf_temporaire
	string v_format_rdv_word
	
	for index = 1 to dw_export.RowCount	()
		// pour le champ "patient_patient_motif_relance"
		champ = dw_export.getitemstring(index, "patient_patient_motif_relance")
		if not isnull(champ) then dw_export.setitem(index, "patient_patient_motif_relance", gfx_tout_remplacer(champ, crlf, crlf_parse))
		// pour le champ "patient_patient_plan_de_traitement"
		champ = dw_export.getitemstring(index, "patient_patient_plan_de_traitement")
		if not isnull(champ) then dw_export.setitem(index, "patient_patient_plan_de_traitement", gfx_tout_remplacer(champ, crlf, crlf_parse))
		// pour le champ "patient_patient_diagnostic"
		champ = dw_export.getitemstring(index, "patient_patient_diagnostic")
		if not isnull(champ) then dw_export.setitem(index, "patient_patient_diagnostic", gfx_tout_remplacer(champ, crlf, crlf_parse))
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

		// Somme due pour la famille
		dw_export.SetItem(index, "patient_somme_due_famille_a_ce_jour", due_parente(v_code_local, today()))

		
		// Date du jour ... avec un format paramétrable
		date v_date_jour
		integer v_format_date_jour_word 
		string v_date_jour_word
		select today(*), min(format_date_jour_word) into :v_date_jour, :v_format_date_jour_word from param ;
		
		//Messagebox("v_date_jour", string(v_date_jour))
		//Messagebox("v_format_date_jour_word", string(v_format_date_jour_word))
		
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

		//Messagebox("v_date_jour_word",v_date_jour_word)
		
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

		
		
		// Elements du rendez-vous du jour .... 
		double v_code_interne_rdv_du_jour
		datetime v_rdv_du_jour
		string v_jour
		
		select min(code_interne) into :v_code_interne_rdv_du_jour from rdv, etat_rdv where rdv.code = :v_code_local and 
		   date("rdv"."rdv") = today(*)  and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' ;

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
		
		if signature_numerique then
			v_fichier_pdf_temporaire = dir_ini + "signature_tmp`"
			dw_export.SetItem(index, "signature_numerique_1", chaine_word_signature_numerique1 + v_fichier_pdf_temporaire)		
			dw_export.SetItem(index, "signature_numerique_2", chaine_word_signature_numerique2 + v_fichier_pdf_temporaire)		
			dw_export.SetItem(index, "signature_numerique_3", chaine_word_signature_numerique3 + v_fichier_pdf_temporaire)		
		end if
				

next
	dw_export.AcceptText()
		
	// export des données ds le fichier export.txt que l'on place ds
	// le rep d'installation de l'application
	dw_export.SaveAs( dir_ini + "export.dat", Text!, true)
	
	// on libère la mémoire
	DESTROY dw_export
	
	DataWindow ldw
	SetNull(ldw)
	uo_lien_word uo_word
	uo_word = create uo_lien_word
	
	String tab_fichier[]
	String tab_chemin[]
	
	tab_fichier[1] = args[2]
	tab_chemin[1] = args[1]
										
	if uo_word.traiter_export_txt(Service_MajEtVisualise,tab_fichier ,ldw, tab_chemin, tab_liste_dossier) <> 1 then
		// le traitement du fichier de sortie initial c mal passé -> maj de la valeur de retour
		CloseWithReturn(this, 102)
		return
	else
		// Traitement OK
		
		if args[5] = 'O' then
			// Faut fermer le courrier généré
			uo_word.ferme_document_genere()
		end if
		
	end if		
	
	destroy uo_word

	CloseWithReturn(this, 0)
	return
end event

on w_lienword.create
this.st_1=create st_1
this.dw_export=create dw_export
this.Control[]={this.st_1,&
this.dw_export}
end on

on w_lienword.destroy
destroy(this.st_1)
destroy(this.dw_export)
end on

type st_1 from statictext within w_lienword
integer x = 736
integer y = 368
integer width = 777
integer height = 104
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Génération du courrier Word"
boolean focusrectangle = false
end type

type dw_export from datawindow within w_lienword
boolean visible = false
integer x = 1184
integer y = 448
integer width = 686
integer height = 400
integer taborder = 10
string title = "none"
string dataobject = "dw_export_lienword"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

