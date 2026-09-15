$PBExportHeader$uo_lien_sidexis.sru
forward
global type uo_lien_sidexis from uo_lien_radio_avec_pwo_en_bd_patient
end type
type info_patient from structure within uo_lien_sidexis
end type
end forward

type info_patient from structure
	string		nom
	string		prenom
	date		date_naiss
	string		sexe
	string		nom_prati
	long		ident_odrade
end type

global type uo_lien_sidexis from uo_lien_radio_avec_pwo_en_bd_patient
end type
global uo_lien_sidexis uo_lien_sidexis

type variables
private constant int maxcarac_nom = 32
private constant int maxcarac_prenom = 32
private constant int maxcarac_sexe = 1	// M = masculin ; F = féminin ; autres = inconu
private constant int maxcarac_num_dossier = 20
private constant int maxcarac_nom_prati = 12

private constant string sdx_sortant = "sidexis.sdx"
private constant string sdx_entrant = "orthokis.sdx"

end variables

forward prototypes
private function string time2string (time t)
private function string date2string (date d)
private function integer charger_info_tab (string token, ref string stab[], readonly info_patient str_info)
private function integer ecrire_ligne_sdx (readonly string stab[])
private function string make_path_sdx_sortant ()
public subroutine ajout_et_selection_patient (long num_patient)
private function integer charger_fichier_entrant (ref blob bl)
private function integer lire_ligne_sdx (readonly blob bl, ref string tab_infos[], long carac_a_lire)
private function string make_path_sdx_entrant ()
public function string get_path_fichier_a_importer ()
private function integer recup_info_patient (ref info_patient ip, long num_patient)
public function integer ajout_et_selection_radio (long num_patient)
public function string deduire_rep_installation ()
end prototypes

private function string time2string (time t);// fx pour formater avec un certain formalisme une heure passée en param
// return string vide si pb

return String( t, "hh:mm:ss")
end function

private function string date2string (date d);// fx pour formater avec un certain formalisme une date passée en param
// return string vide si pb

return String( d, "dd.mm.yyyy")
end function

private function integer charger_info_tab (string token, ref string stab[], readonly info_patient str_info);// fx qui charge dans un tab les infos necessaires concernant un patient
// par requete SQL suivant le num patient (identifiant_odrade) passé en param
// return 1 si ok,
//		-1 si pb 

string	stab_local[]
int		returnval = -1
boolean unpb
long	lgtab, l

str_info.nom = ansi-ascii(str_info.nom, ANSIASCII)
str_info.prenom = ansi-ascii(str_info.prenom, ANSIASCII)

choose case upper( token )
// selon TOKEN
	case "N"
		stab_local[1] = "N"
		stab_local[2] = mid( righttrim( str_info.nom ), 1, maxcarac_nom )
		stab_local[3] = mid( righttrim( str_info.prenom ), 1, maxcarac_prenom )
		stab_local[4] = date2string( str_info.date_naiss )
		stab_local[5] = mid( string( str_info.ident_odrade ), 1, maxcarac_num_dossier )
		stab_local[6] = mid( trim( str_info.sexe ), 1, maxcarac_sexe )
		stab_local[7] = mid( righttrim( str_info.nom_prati ), 1, maxcarac_nom_prati )
		stab_local[8] = ""
		stab_local[9] = ""
	case "A"
		stab_local[1] = "A"
		stab_local[2] = mid( righttrim( str_info.nom ), 1, maxcarac_nom )
		stab_local[3] = mid( righttrim( str_info.prenom ), 1, maxcarac_prenom )
		stab_local[4] = date2string( str_info.date_naiss )
		stab_local[5] = mid( string( str_info.ident_odrade ), 1, maxcarac_num_dossier )
		stab_local[6] = get_nom_ordinateur()
		stab_local[7] = date2string( Today() )
		stab_local[8] = time2string( Now() )
		stab_local[9] = ""
		stab_local[10] = ""
		stab_local[11] = ""
	case "A2"
		stab_local[1] = "A"
		stab_local[2] = mid( righttrim( str_info.nom ), 1, maxcarac_nom )
		stab_local[3] = mid( righttrim( str_info.prenom ), 1, maxcarac_prenom )
		stab_local[4] = date2string( str_info.date_naiss )
		stab_local[5] = mid( string( str_info.ident_odrade ), 1, maxcarac_num_dossier )
		stab_local[6] = get_nom_ordinateur()
		stab_local[7] = date2string( Today() )
		stab_local[8] = time2string( Now() )
		stab_local[9] = ""
		stab_local[10] = ""
		stab_local[11] = "0"
	case else
		unpb = true
		messagebox("ERREUR ...", "Token non pris en compte. ~n~nOpération annulée.", StopSign!)
end choose

if not unpb then
// si pas de pb on poursui --> vérif cohérence tab de string (suppr des NULL)
	lgtab  = upperbound ( stab_local )
	for l = 1 to lgtab
		if isnull( stab_local[ l ] ) then stab_local[ l ] = ""
	next
	
	// le tab local devient le tab passer en ref = MAJ valretour
	stab = stab_local
	returnval = 1
end if

return returnval
end function

private function integer ecrire_ligne_sdx (readonly string stab[]);// fx qui écrit ds le .sdx la ligne concernant le stab passé en param
// return 1 si ok
//		-1 sinon

int		returnval = -1
string	pathFichier
int		fileNumber
uint		position2insert
long	lgtab, l, nbrCarac
blob{1}	bnull
blob		b


pathFichier = make_path_sdx_sortant()

trace(". Fichier Sortant : " +pathFichier )
if pathFichier <> "" then
// si ok --> on continu
	// nbr de carac suivant le tab
	lgtab  = upperbound ( stab )
	for l = 1 to lgtab
		nbrCarac += lenA( stab[ l ] )		// depuis pb10 --> utiliser lenA(x) pour du ANSI (à la place de len(x)
	next
	// nbr de NULL pour séparer chaque élément (le +2 c pour l'inscription du nbr de carac de ligne et le carac NULL de séparation )
	nbrCarac += 2 + lgtab
	// pour le retour chariot composé des codes ASCII 13 puis 10 enchainés
	nbrCarac += 2
	
	// on  init la longueur du blob déclaré dynamiquement
	b = blob(space(nbrCarac),EncodingANSI!)
	
	// premier élem --> détermine le nbr total de byte sur la meme ligne
//	position2insert = BlobEdit( b, 1, blob(charA(nbrCarac),EncodingANSI!),EncodingANSI!)
	position2insert = BlobEdit( b, 1, blob(string(char(nbrCarac)),EncodingANSI!),EncodingANSI!) // depuis pb10 --> utiliser string(char(x)) pour du ANSI (à la place de char(x))
	position2insert = BlobEdit( b, position2insert, bnull,EncodingANSI!)
	
	// les autres élem --> concernant les informations du tab de string
	for l = 1 to lgtab
		position2insert = BlobEdit( b, position2insert, blob(stab[l], EncodingANSI!),EncodingANSI!)
		position2insert = BlobEdit( b, position2insert, bnull,EncodingANSI!)
	next
	
	// retour chariot
//	position2insert = BlobEdit( b, position2insert, blob(charA(13),EncodingANSI!),EncodingANSI!)
//	position2insert = BlobEdit( b, position2insert, blob(charA(10),EncodingANSI!),EncodingANSI!)
	position2insert = BlobEdit( b, position2insert, blob(string(char(13)),EncodingANSI!),EncodingANSI!)
	position2insert = BlobEdit( b, position2insert, blob(string(char(10)),EncodingANSI!),EncodingANSI!)
	
	// insertion ds fichier .sdx
	fileNumber = FileOpen( pathFichier, StreamMode!, Write! , LockReadWrite!)
		if FileWriteEx( fileNumber, b) >= 0 then returnval = 1
	FileClose( fileNumber )
	
else
	messagebox("ERREUR ...", "Impossible de déterminer l'emplacement du fichier '" + sdx_sortant + "'.~nVérifier les configurations du lien. ~n~nOpération annulée.", StopSign!)
end if

return returnval
end function

private function string make_path_sdx_sortant ();// fx qui retour ne le path complet du fichier sdx sortant
// return chaine vide si pb

string	s

s = deduire_rep_installation()
if s <> "" then
	s += sdx_sortant
end if

Trace (". Fichier sdx sortant : " + s )

return s
end function

public subroutine ajout_et_selection_patient (long num_patient);// fx qui ajoute le patient à la base sidexis et le sélectionne pour qu'il arrive en avant plan

info_patient	tab_infos
string		infos[], infos2[]
boolean	unpb
string		path_prog


trace("- Lien SIDEXIS : ouverture du patient " + string(num_patient))


if recup_info_patient( tab_infos, num_patient ) <> 1 then unpb = true

if not unpb then
	if charger_info_tab( "N", infos, tab_infos ) = 1 then
		if ecrire_ligne_sdx( infos ) <> 1 then unpb = true
	end if
end if

if not unpb then
	if charger_info_tab( "A", infos2, tab_infos ) = 1 then
		if ecrire_ligne_sdx( infos2 ) <> 1 then unpb = true
	end if
end if

if not unpb then
	path_prog = get_programme_exe_path()
	trace(". Prog Sidexis.exe : " + path_prog )

	if path_prog <> "" then
		run( path_prog )
	else
		messagebox("ERREUR ...", "Impossible de récupérer le chemin du ~nprogramme '" + get_nom_soft_radio() + "'. ~nVérifiez sa configuration. ~n~nOpération annulée.", StopSign!)
	end if
end if

end subroutine

private function integer charger_fichier_entrant (ref blob bl);// fx qui carge le fichier sdx entrant ds un blob passer par ref
// return 1 si ok
//		-1 si pb

string	pathFichier
int		fileNumber, nbr_carac
int		returnval = -1
blob	b


pathFichier = make_path_sdx_entrant()

Trace(". Fichier entrant : "+pathFichier)

if pathFichier  <> "" then
	fileNumber = FileOpen( pathFichier, StreamMode! , read!, LockReadWrite!, Append!, EncodingANSI!   )	// modif pour pb10
	if fileNumber >0 then
		nbr_carac = FileRead( fileNumber, b )
		if nbr_carac > 0 then
			bl = b
			returnval = 1
		elseif nbr_carac = -100 then
			messagebox( "INFORMATION ...", "Le fichier sdx entrant '" + sdx_entrant + "' est vide. ~n~nAucune radio à importer, ~nfin de l'opération.")
		else
			messagebox("ERREUR ...", "Impossible de lire le fichier '" + sdx_entrant + "'.~n~nOpération annulée.", StopSign!)
		end if
		
		FileClose( fileNumber )
	else
		messagebox("ERREUR ...", "Impossible d'ouvrir le fichier '" + sdx_entrant + "'.~n~nOpération annulée.", StopSign!)
	end if
else
	messagebox("ERREUR ...", "Impossible de déterminer l'emplacement du fichier '" + sdx_entrant + "'.~nVérifier les configurations du lien. ~n~nOpération annulée.", StopSign!)
end if

return returnval

end function

private function integer lire_ligne_sdx (readonly blob bl, ref string tab_infos[], long carac_a_lire);// fx qui lit une ligne ds le blob passer en readonly
// return la position du prochain byte à lire ds blob + renvoie les infos de la ligne lue classées ds le tab de string passer en ref
// return  0 si fin du blob (<=> fin du fichier)
// return -1 si pb

blob		brecup
int			fileNumber
int			ascii
int			tab_index = 1
long		nbr_carac
int			returnval = -1
boolean	fin_de_ligne
string		tab_info_local[]


nbr_carac = lenA( bl ) // car en AINSI	// modif pour pb10

if nbr_carac >= 1 then
// le blob passer en readonly n'est pas vide
	if carac_a_lire <= nbr_carac then
		// si besoin d'init la var passée en param
		
		do
			// lecture d'un carac
			brecup = BlobMid( bl, carac_a_lire, 1)
			ascii = asc(string(brecup, EncodingANSI!))	// modif pour pb10
			if ascii = 0 then
				tab_index ++
			else
				tab_info_local[ tab_index ] += string( brecup, EncodingANSI! )	// modif pour pb10
			end if
			carac_a_lire ++
		// tant que blob passé en readonly non vide ET qu'on ne tombe pas sur un cariage return (13)
		loop while carac_a_lire < nbr_carac and ( ascii <> 13 )
		
		if carac_a_lire <= nbr_carac then
			if ascii = 13 then
				// on recup le prochain carac
				brecup = BlobMid( bl, carac_a_lire, 1)
				ascii = asc(string(brecup, EncodingANSI!))	// modif pour pb10
				if ascii = 10 then
				// si bien une fin de ligne : on le sait si après cariage return (13) on a un fin de ligne (10)
					tab_infos = tab_info_local
					fin_de_ligne = true
				end if
			end if
		end if
		
		if not fin_de_ligne OR tab_index = 1 then
			messagebox( "ERREUR ...", "Le fichier sdx entrant '" + sdx_entrant + "' est incorrect. ~n~nOpération Annulée.", StopSign!)
		else
			returnval = carac_a_lire
		end if

	else
	// on a dépassé le nbr de carac du blob --> fin du fichier, plus rien à lire
		messagebox( "ATTTENTION ...", "Fin du fichier sdx entrant '" + sdx_entrant + "' aucune radio à importer de détectée. ~n~nFin de l'opération.", Exclamation!)
		returnval = 0
	end if
end if

return returnval
end function

private function string make_path_sdx_entrant ();// fx qui retour ne le path complet du fichier sdx entrant
// return chaine vide si pb

string	s


s = deduire_rep_installation()
if s <> "" then
	s += sdx_entrant
end if

Trace (". Fichier sdx entrant : " + s )
return s
end function

public function string get_path_fichier_a_importer ();// fx qui trouve le nom et déduit le path complet du fichier à importer
// renvoie le path complet si ok
// chaine vide si pb

string		returnstr
blob		b_fichier
string		info_recup[]
long		index_carac = 1
boolean	unpb, un_autre_ordi, debut_process
string		token
string		num_invariant, num_invariant_precedant
string		nom_fichier_radio
int			fileNumber, cpt, tot

	
if charger_fichier_entrant( b_fichier ) = 1 then
	
	trace(" . Fichier chargé : ~n" + string (b_fichier, EncodingANSI!) + "~n======================================================")
	
	trace(". Avant la boucle : " )
	trace(". Token : " + token)
	Trace(". num_invariant_precedant : " + string(num_invariant_precedant) + " - num_invariant : " + string(num_invariant) )
	Trace(". autre ordi : " + string(un_autre_ordi))
	trace(". Index carac : " + string( index_carac) )
	trace("-----------------------------------------") 
	
//	do while token <> "M" AND num_invariant_precedant = num_invariant AND not un_autre_ordi AND index_carac > 0
	do while token <> "M" AND not un_autre_ordi AND index_carac > 0
			index_carac = lire_ligne_sdx( b_fichier, info_recup, index_carac )
		
		trace(". Dans la boucle : " )
		trace(". Index carac : " + string( index_carac) )
		
		

		if index_carac > 0 then
			// si on a recup les infos d'une ligne du sdx entrant
			
			if trace then 
				// parcours de info_recup
				tot = upperbound(info_recup)
				trace (" -- info recup --")
				for cpt = 1 to tot
					trace("  " + string(cpt) + " - " + info_recup[ cpt ] )
				next
				trace (" -- fin info recup --")
			end if
			
			// recup du token
			token = info_recup[ 2 ]
			// recup du num_patient invariant
			num_invariant = info_recup[ 6 ]
			
			trace(". Token : " + token)
			Trace(". num_invariant_precedant : " + string(num_invariant_precedant) + " - num_invariant : " + string(num_invariant) )
			
			choose case token
				case "N"	// token de creation de patient
					// maj num invariant precedant
					num_invariant_precedant = num_invariant
					// on passe en début de process vis-à-vis de la succesion des 3 token N - A - M
					debut_process = true
				case "A"	// token de sélection de patient
					// si num invariant dif de celui precedant --> pas normal, maj bool
					if num_invariant_precedant <> num_invariant then unpb = true
					// si à partir d'un autre ordi récupération du nom de l'ordi impossible --> pas normal, maj bool
					if upper( get_nom_ordinateur() ) <> upper( info_recup[ 7 ] ) then un_autre_ordi = true
				case "M"	// token d'indication du fichier exporté
					if num_invariant_precedant <> num_invariant then
					// si num invariant dif de celui precedant --> pas normal, maj bool
						unpb = true
					else
						// recup du nom du fichier
						nom_fichier_radio = info_recup[ 11 ]
						Trace(". nom_fichier_radio : " + nom_fichier_radio) 
					end if
				case else
					// si on est rentré en début de succession des 3 tokens N - A - M, ce serait une erreur d'avoir d'autres tokens ou ligne blanche
					if debut_process then unpb = true
			end choose
			
			if unpb then
				messagebox("ERREUR ...", "Succession invalide des 'Tokens' d'export ~nde radio dans le fichier entrant '" + sdx_entrant + "'. ~n~nImpossible de poursuivre, opération annulée.", StopSign!)
			elseif un_autre_ordi then
				messagebox("ERREUR ...", "Cet import de radio a été demandé à partir d'un autre ordinateur, ou impossiblité de récupérer le nom de cet ordinateur. ~n~nImpossible de poursuivre, opération annulée.", StopSign!)
			end if
		end if
		
		Trace(". autre ordi : " + string(un_autre_ordi))

	loop
	
	Trace(". Fin de la boucle")
	
	if nom_fichier_radio = "" then 
	// si nom fichier pas recup
		if token = "M" then messagebox("ERREUR ...", "Impossible de récupérer le nom du fichier radio à importer. ~n~nOpération annulée.", StopSign!)
	else
		
		
		// on déduit le path complet du dit fichier
		returnstr = deduire_rep_installation()
		
		Trace(". Nom du fichier radio : "+nom_fichier_radio)
		Trace(". Répertoire installation : "+returnstr)
	
		if returnstr <> "" then
			
////			if SERIAL = "87181" or SERIAL = "88036" then 
////				// depuis 34.90f ... on renomme le fichier .TIF pour éviter une conversion dans la Gearbox
////				// pour l'instant, uniquiement pour LEFEBVRE BIZARD 87181
				
////				string v_nom_fichier_seul
////				trace("============ SPECIAL 87181 - LEFEBVRE BIZARD ========== ")
////				if upper(gfx_extraire_extension_fichier(nom_fichier_radio)) = "TIF" then
////					Trace("- Fichier TIF => On renomme")
////					v_nom_fichier_seul = gfx_fichier_sans_extension(nom_fichier_radio)
////					if FileMove(returnstr + v_nom_fichier_seul + ".tif", returnstr + v_nom_fichier_seul + ".jpg") = 1 then
////						nom_fichier_radio =  v_nom_fichier_seul + ".jpg"
////						Trace("- Le fichier d'origine est renomé => " +  nom_fichier_radio )
////					end if
////				else
////					Trace("- Pas Fichier TIF => On ne touche pas")
////				end if
////				trace("============ FIN SPECIAL 87181 - LEFEBVRE BIZARD ========== ")

//			end if
			if trace then 
				// copie du fichier pour expertiser
				string v_fichier_copie 
				v_fichier_copie = dir_ini + nom_fichier_radio
				if FileCopy(returnstr + nom_fichier_radio , v_fichier_copie, true ) = 1 then 
					trace(" - Fichier d'origine copié vers " + v_fichier_copie ) 
				else
					trace(" **** ERREURT DANS LA COPIE DU FICHIER D'ORIGINE : " + returnstr + nom_fichier_radio +  " vers " + v_fichier_copie )
				end if
				
			end if
			
			// Nom de fichier complet
			returnstr += nom_fichier_radio
				
		else
			messagebox("ERREUR ...", "Impossible de déterminer l'emplacement du fichier radio '" + nom_fichier_radio + "'.~nVérifier les configurations du lien. ~n~nOpération annulée.", StopSign!)
		end if
	end if
	
	if len( b_fichier ) <> index_carac then
		// si encore des données ds le blob
		// on écrit le reste du blob ds le fichier sdx entrant
		fileNumber = FileOpen( make_path_sdx_entrant(), StreamMode!, Write! , LockReadWrite!, Replace!)
	
		Trace(". Ecriture du reste du Blob dans : "+sdx_entrant + ".~n~nNb caractères : "+string(index_carac) )

		if FileWrite( fileNumber, BlobMid(b_fichier, index_carac ) ) >= 0 then
			else
				messagebox("ERREUR ...", "Réécriture du fichier entrant '" + sdx_entrant + "' impossible.", StopSign!)
			end if
		FileClose( fileNumber )
	else
	// on a lu le fichier entier : suppression de celui-ci
		if DeleteFileA( make_path_sdx_entrant() ) = 0 then messagebox("ATTENTION ...", "Impossible de supprimer le fichier sdx entrant '" + sdx_entrant + "'.", Exclamation!)
	end if
end if

return returnstr
end function

private function integer recup_info_patient (ref info_patient ip, long num_patient);// fx qui recup par un select ds la base les infos du patient et les stock ds la structure passée en param par ref
// return 1 si ok
//		-1 si pb

int	returnval = -1


//select	patient.nom, prenom, date_naissance, sexe, prati.nom, identifiant_odrade
//into	:ip.nom, :ip.prenom, :ip.date_naiss, :ip.sexe, :ip.nom_prati, : ip.ident_odrade
//from	patient, prati
//where	patient.code_praticien = prati.code and
//		patient.code = :num_patient ;

// depuis la version 2009, le code remplace l'identifiant Odrade
select	patient.nom, patient.prenom, date_naissance, sexe, prati.nom, patient.code
into	:ip.nom, :ip.prenom, :ip.date_naiss, :ip.sexe, :ip.nom_prati, :ip.ident_odrade
from	patient, prati
where	patient.code_praticien = prati.code and
		patient.code = :num_patient ;

if SQLCA.SQLCode = 0 then
// no pb --> on continu
	returnval = 1
else
// erreur de récupération de données
	messagebox("ERREUR ...", "Impossible de récupérer les informations du patient. ~n~nOpération annulée.", StopSign!)
end if

return returnval

end function

public function integer ajout_et_selection_radio (long num_patient);// fx qui ajoute le patient à la base sidexis et le sélectionne pour qu'il arrive en avant plan
// return 1 si ok
//		-1 si pb

info_patient	tab_infos
string		infos[], infos2[]
boolean	unpb
string		path_prog
int			returnval = -1


if recup_info_patient( tab_infos, num_patient ) <> 1 then unpb = true

if not unpb then
	if charger_info_tab( "N", infos, tab_infos ) = 1 then
		if ecrire_ligne_sdx( infos ) <> 1 then unpb = true
	end if
end if

if not unpb then
	if charger_info_tab( "A2", infos2, tab_infos ) = 1 then
		if ecrire_ligne_sdx( infos2 ) <> 1 then unpb = true
	end if
end if

if not unpb then
	path_prog = get_programme_exe_path()
	if path_prog <> "" then
		run( path_prog )
		returnval = 1
	else
		messagebox("ERREUR ...", "Impossible de récupérer le chemin du ~nprogramme '" + get_nom_soft_radio() + "'. ~nVérifiez sa configuration. ~n~nOpération annulée.", StopSign!)
	end if
end if

return returnval

end function

public function string deduire_rep_installation ();// fx qui déduit le rep d'install du soft de radio
// à partir du path de l'exe sauvegardé ds orthokis.ini
// return le path si ok ou
//			chaine vide si encore rien de param

string	lstr_exepath


// recup path de l'exe ds orthokis.ini
lstr_exepath = get_programme_exe_path()

if lstr_exepath <> "" then
// si qqch de récup
	//lstr_exepath = left(lstr_exepath, len(lstr_exepath) - len(programme_exe))
	lstr_exepath = gfx_extraire_path_fichier(lstr_exepath)
end if

return lstr_exepath
end function

on uo_lien_sidexis.create
call super::create
end on

on uo_lien_sidexis.destroy
call super::destroy
end on

event constructor;call super::constructor;init( radio_sidexis )
end event

