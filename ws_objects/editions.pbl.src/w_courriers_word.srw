$PBExportHeader$w_courriers_word.srw
forward
global type w_courriers_word from w_fenetre_arakis
end type
type gb_transferts from groupbox within w_courriers_word
end type
type gb_cabinet from groupbox within w_courriers_word
end type
type pb_email from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_previ_email from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_imprimer from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_previ_imp from uo_picturebutton_780x120 within w_courriers_word
end type
type cb_param from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_editer from uo_picturebutton_780x120 within w_courriers_word
end type
type cb_supprimer_elem from uo_picturebutton_780x120 within w_courriers_word
end type
type cb_renommer_elem from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_ajouter_courrier from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_ajouter_categ from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_courriers_word
end type
type tv_courriers from treeview within w_courriers_word
end type
type gb_2 from groupbox within w_courriers_word
end type
type lb_files from listbox within w_courriers_word
end type
type lb_rep from listbox within w_courriers_word
end type
type dw_favoris from datawindow within w_courriers_word
end type
type pb_favoris from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_ajouter_favoris from uo_picturebutton_250x120 within w_courriers_word
end type
type pb_supprimer_favoris from uo_picturebutton_250x120 within w_courriers_word
end type
type pb_annuler_favoris from uo_picturebutton_250x120 within w_courriers_word
end type
type pb_enregistrer_favoris from uo_picturebutton_250x120 within w_courriers_word
end type
type cbx_eclater from checkbox within w_courriers_word
end type
type tv_cabinet from treeview within w_courriers_word
end type
type pb_ajouter_categ_cabinet from uo_picturebutton_780x120 within w_courriers_word
end type
type cb_renommer_elem_cabinet from uo_picturebutton_780x120 within w_courriers_word
end type
type cb_supprimer_elem_cabinet from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_copie_cabinet from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_copie_local from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_vider_copier from uo_picturebutton_780x120 within w_courriers_word
end type
type tv_powerpoint from treeview within w_courriers_word
end type
type rb_word from radiobutton within w_courriers_word
end type
type rb_powerpoint from radiobutton within w_courriers_word
end type
type pb_signature_numerique from uo_picturebutton_780x120 within w_courriers_word
end type
type pb_aide from uo_bouton_aide within w_courriers_word
end type
type dw_1 from datawindow within w_courriers_word
end type
type pb_rafraichir from picturebutton within w_courriers_word
end type
type pb_signature_en_ligne from uo_picturebutton_780x120 within w_courriers_word
end type
type cb_dupliquer_favoris from uo_picturebutton_250x120 within w_courriers_word
end type
type cb_convertir from uo_picturebutton_780x120 within w_courriers_word
end type
type dw_param_publipostage from datawindow within w_courriers_word
end type
type gb_eclate from groupbox within w_courriers_word
end type
type gb_1 from groupbox within w_courriers_word
end type
type gb_type_gestion from groupbox within w_courriers_word
end type
type uo_powerpoint from uo_lien_powerpoint within w_courriers_word
end type
type uo_word from uo_lien_word within w_courriers_word
end type
end forward

global type w_courriers_word from w_fenetre_arakis
integer width = 4421
integer height = 2500
string title = "Courriers Word et Présentations PowerPoint"
windowtype windowtype = child!
long backcolor = 15780518
gb_transferts gb_transferts
gb_cabinet gb_cabinet
pb_email pb_email
pb_previ_email pb_previ_email
pb_imprimer pb_imprimer
pb_previ_imp pb_previ_imp
cb_param cb_param
pb_editer pb_editer
cb_supprimer_elem cb_supprimer_elem
cb_renommer_elem cb_renommer_elem
pb_ajouter_courrier pb_ajouter_courrier
pb_ajouter_categ pb_ajouter_categ
pb_fermer pb_fermer
tv_courriers tv_courriers
gb_2 gb_2
lb_files lb_files
lb_rep lb_rep
dw_favoris dw_favoris
pb_favoris pb_favoris
pb_ajouter_favoris pb_ajouter_favoris
pb_supprimer_favoris pb_supprimer_favoris
pb_annuler_favoris pb_annuler_favoris
pb_enregistrer_favoris pb_enregistrer_favoris
cbx_eclater cbx_eclater
tv_cabinet tv_cabinet
pb_ajouter_categ_cabinet pb_ajouter_categ_cabinet
cb_renommer_elem_cabinet cb_renommer_elem_cabinet
cb_supprimer_elem_cabinet cb_supprimer_elem_cabinet
pb_copie_cabinet pb_copie_cabinet
pb_copie_local pb_copie_local
pb_vider_copier pb_vider_copier
tv_powerpoint tv_powerpoint
rb_word rb_word
rb_powerpoint rb_powerpoint
pb_signature_numerique pb_signature_numerique
pb_aide pb_aide
dw_1 dw_1
pb_rafraichir pb_rafraichir
pb_signature_en_ligne pb_signature_en_ligne
cb_dupliquer_favoris cb_dupliquer_favoris
cb_convertir cb_convertir
dw_param_publipostage dw_param_publipostage
gb_eclate gb_eclate
gb_1 gb_1
gb_type_gestion gb_type_gestion
uo_powerpoint uo_powerpoint
uo_word uo_word
end type
global w_courriers_word w_courriers_word

type variables
string 	lrep_courriers		// on y récup le rep courrier

string	nom_fichier					// pour le drag and drop d'un fichier
string	ancien_chemin_fichier	// pour le drag and drop d'un fichier
string	nouveau_chemin_fichier	// pour le drag and drop d'un fichier


double largeur_tree_view, hauteur_tree_view

double handle_principal	// pour l'arbre en usage normal
double handle_principal_cabinet // pour l'arbre spécial synchrnosiation qui s'appelle TV_CABINET

integer nb_tentatives_autorisees	// pour détection de l'ouverture de Word
string chemin_categorie_selectionnee

string chemin_categorie_selectionnee_cabinet

// Pour la synchronisation des fichiers
string v_dir_courriers_reseau

boolean maj_word_autorisee 


// pour savoir ce qu'on gère
string type_gestion // W : pour courriers Word, P : pour Powerpoint

string v_double_clic


m_courriers_word m_menu

// Pour gérer l'un ou l'autre des molues de signature => 1 seule variable local pour gérer les droits
boolean b_signature_numerique_dentalsign
end variables

forward prototypes
public function string get_chemin_fichier (readonly treeviewitem ltvi)
public function integer blanc_tv (ref treeview l_tv)
public function string get_nom_fichier (readonly treeviewitem ltvi)
public function boolean une_categorie (readonly treeviewitem ltvi)
public function integer load_files (string l_rep)
public function boolean le_rep_courrier (readonly treeviewitem ltvi)
public subroutine msg_erreur (integer type_erreur)
public subroutine routine_word (integer num_service, boolean patient_courant)
public function string get_nom_fichier_2007 (readonly treeviewitem ltvi)
public function integer load_sousrep (string sous_rep, ref uo_listbox lb_rep_2011)
public function integer load_sousrep (string v_rep_courriers)
public function integer load_sousrep_2011 (string rep_depart, string label_rep_depart, long handle_sousrep, ref treeview v_arbre, boolean usage_normal)
public function integer load_tv_2011 (ref treeview v_arbre, string v_dir_courriers, boolean usage_normal)
public function integer check_element (boolean usage_normal)
public function integer del_element (boolean usage_normal)
public function integer rename_element (boolean usage_normal)
public function integer add_categ (boolean usage_normal)
public function integer add_courrier (boolean usage_normal)
public function integer find_and_highlight (string item_name, ref treeview tv_param)
public subroutine word_ou_powerpoint (string mode_office)
public subroutine maj_focus (treeview tv, long newhandle)
public function double ajouter_document (string v_document_complet)
public function integer duplicate_element (boolean usage_normal)
public subroutine signature_en_ligne (boolean patient_courant, boolean favoris, boolean questionnaire, string dossier_courrier, string nom_courrier)
end prototypes

public function string get_chemin_fichier (readonly treeviewitem ltvi);// fx qui return le chemin complet et le nom du fichier l'élément passé en param

string lchemin


lchemin = gfx_extraire_path_fichier(string(ltvi.data))

return lchemin
end function

public function integer blanc_tv (ref treeview l_tv);// fx qui vierge le treeview passé en param

long		hndl


// on reset le treeview
DO UNTIL l_tv.FindItem(RootTreeItem!, 0) = -1
		l_tv.DeleteItem(hndl)
LOOP

// pas de gestion d'erreur
return 1
end function

public function string get_nom_fichier (readonly treeviewitem ltvi);// fx qui renvoie le nom du fichier
// à partir de l'élément passé en param

string	lnom

lnom = ltvi.data		// Contient le nom complet avec le chemin

lnom = gfx_extraire_nom_fichier(lnom)

return lnom
end function

public function boolean une_categorie (readonly treeviewitem ltvi);// fx qui return true si l'élément passé en param est une catégoie
// pour simplification : on regarde seulement l'icone employé

if ltvi.pictureindex = 2 then return true

return false
end function

public function integer load_files (string l_rep);// fx qui récup les divers fichiers présents ds le rep donné en param
// return le nbr de fichiers trouvés
// -1 si pb


lb_files.reset()
// ne sont recherchés que les fichiers :
//		* en accés complet (NON en lecture seul)
// 	* les .doc ou les .docx

if type_gestion = "W" then 
	lb_files.DirList(l_rep + FichiersWord, 32)
else
	lb_files.DirList(l_rep + FichiersPowerPoint, 32)
end if


// pas de gestion d'erreur
return lb_files.TotalItems()
end function

public function boolean le_rep_courrier (readonly treeviewitem ltvi);// fx qui return true si l'élément passé en param est le rep racine : càd le rep courrier
// pour simplification : on regarde seulement l'icone employé

if ltvi.pictureindex = 3 then return true

return false
end function

public subroutine msg_erreur (integer type_erreur);// fx qui envoie à l'utilisateur
// le msg d'erreur dont le type est passé en param


choose case type_erreur
	case 1
		messagebox("ATTENTION","Un problème est survenu durant l'exécution, ~nImpossible de poursuivre !",Exclamation!)
	case else
		messagebox("ATTENTION","Un problème est survenu durant l'exécution, ~nImpossible de poursuivre !",Exclamation!)
end choose
end subroutine

public subroutine routine_word (integer num_service, boolean patient_courant);// procédure qui prépare pwo puis lance le service word approprié

TreeViewItem		ltvi_Item
long				save_num_patient
string				propoNom

// Gestion du patient courant
if patient_courant and (isnull(VAR_CODE ) OR var_code = 0) then
	messagebox("ATTENTION", "Pas de patient courant : opération annulée", Exclamation!)
	return
end if

// on vérouille les boutons de ctrl
pb_editer.enabled ( false )
pb_previ_imp.enabled ( false )
pb_imprimer.enabled ( false )
pb_signature_numerique.enabled ( false )
pb_signature_en_ligne.enabled ( false )
pb_previ_email.enabled ( false )
pb_email.enabled ( false )

open(w_patience)
if tv_courriers.GetItem(tv_courriers.FindItem(CurrentTreeItem!, 0), ltvi_Item) = 1 then
	// on a bien récup l'élément
	propoNom = get_nom_fichier(ltvi_Item)

	if uo_word.traiter_avec_word(num_service, get_chemin_fichier(ltvi_Item), propoNom, patient_courant) <> 1 then
	// si pb sur le job WORD : msg d'erreur
		messagebox("ERREUR","Un problème est survenu durant l'exécution, ~nImpossible de poursuivre !",StopSign!)
	end if
end if
close(w_patience)

// on replace les boutons de ctrl
pb_editer.enabled ( true )
pb_previ_imp.enabled ( true )
pb_imprimer.enabled ( true )
pb_signature_numerique.enabled ( b_signature_numerique_dentalsign )
pb_signature_en_ligne.enabled ( mon_orthodontiste or TEA )
pb_previ_email.enabled ( true )
pb_email.enabled ( true )



	
end subroutine

public function string get_nom_fichier_2007 (readonly treeviewitem ltvi);// fx qui renvoie le nom du fichier
// à partir de l'élément passé en param

string	lnom


if type_gestion = "W" then
	lnom = ltvi.label + ExtentionWord2007
else
	lnom = ltvi.label + ExtentionPowerPoint2007
end if

return lnom
end function

public function integer load_sousrep (string sous_rep, ref uo_listbox lb_rep_2011);// fx qui récup les divers sous-rep d'un Sous Rep passé en argument
// return le nbr de sous-rep trouvés (ATTENTION : il y en a tjrs au moins 1 : [..]
// -1 si pb


int		nbr_tot
int 	ret
boolean retb

if sous_rep = "" then return -1		// si pas de rep courrier de défini

ret = lb_rep_2011.reset()
retb = lb_rep_2011.DirList(sous_rep + win_AllFiles, 16+32768)	// on recherche les rep seulement

return lb_rep_2011.TotalItems()
end function

public function integer load_sousrep (string v_rep_courriers);// fx qui récup les divers sous-rep du rep courrier s'il y en a !
// return le nbr de sous-rep trouvés (ATTENTION : il y en a tjrs au moins 1 : [..]
// -1 si pb


int		nbr_tot


if v_rep_courriers = "" then return -1		// si pas de rep courrier de défini

lb_rep.reset()
lb_rep.DirList(v_rep_courriers + win_AllFiles, 16+32768)	// on recherche les rep seulement

return lb_rep.TotalItems()
end function

public function integer load_sousrep_2011 (string rep_depart, string label_rep_depart, long handle_sousrep, ref treeview v_arbre, boolean usage_normal);// fx qui intialise le treeview
// en chargeant la structure de rep du rep courrier
// et en filtrant sur les fichiers .doc ou docx

// s'appuie sur load_sousrep_2011 qui travaille en recursif !!!!

TreeViewItem	ltvi_Item		// un noeud à insérer
int				nbr_rep			// le nbr de rep trouvés ds le rep photo
int				nbr_files		// le nbr de fichier trouvés ds le rep cherché
int				i,j				// cpt de boucles (pour les sous rep et les fichiers)
string			lsousrep			// récup un sous rep
string		chemincomplet		// chemin complet d'un sous-rep ou d'un fichier
long			handlesousrep		// pour récup le handle d'un élément du trreview
long			handlerepracine	// pour récup le handle du rep racine (rep courrier)

uo_listbox lb_rep_2011
OpenUserObject(lb_rep_2011, 100, 100) 
lb_rep_2011.visible = false

string v_ext, v_path, v_nom_document, v_nom_cherche
integer cpt, v_couleur, v_cpt_doc

// on recherche les sous rep du rep courrier

// Ajout du noeud qui correspond au Sous Rep
lsousrep = label_rep_depart
chemincomplet = rep_depart
	
// on charge les params d'un noeud répertoire
ltvi_Item.label = lsousrep
ltvi_Item.data = chemincomplet


if handle_sousrep = 0 then 
	// C'est le 1er
	ltvi_Item.pictureindex = 3
	ltvi_Item.selectedpictureindex = 3
else
	ltvi_Item.pictureindex = 2
	ltvi_Item.selectedpictureindex = 2
end if
		
// on insére le sous_rep
handlerepracine = v_arbre.InsertItemLast(handle_sousrep, ltvi_Item)

if handle_sousrep = 0 then 
	// On mémorise de handle du 1er neoud ... en principe 1 mais .... 
	if usage_normal then
		handle_principal = handlerepracine
	else
		handle_principal_cabinet = handlerepracine
	end if
end if

// Recherche des fichiers ..............
// on retrouve les fichiers présents ds le rep traité
nbr_files = load_files (chemincomplet)

if nbr_files > 0 then
	// il y a au moins un fichier trouvé

		
		for j = 1 to nbr_files
			// en se basant sur la listbox lb_files
			// on charge ds le treeview les fichiers trouvés
			
			// on charge les params d'un noeud fichier

			// Contiendra le chemin + le nom de fichier complet du document ... avec son extention DOC ou DOCX
			string a
			ltvi_Item.data = chemincomplet + lb_files.text(j)
			a =  chemincomplet + lb_files.text(j)
			v_nom_document =  gfx_fichier_sans_extension(lb_files.text(j))
			v_ext = gfx_extraire_extension_fichier(ltvi_Item.data)
			v_path = right(chemincomplet, len(chemincomplet) - len(dir_courriers))
			
			if v_nom_document = 'Bilan Dentaire' then
				string aa
				aa = "hh"
			end if
			
			
			select isnull(count(*),0) into :v_cpt_doc from  "courriers_word" 
			where  "nom_document" = :v_nom_document and 	"extension" = :v_ext 	and  "dossier" =  :v_path and "base" = :nom_base  ;
			
			if v_cpt_doc = 0 then 
				v_couleur = 1
				// si courrier n'existe pas ... Mémorisation en base de données !!!!!!
				insert into "courriers_word"  (  "nom_document", "extension", "memorisation", "copie_pdf" , "dossier" , "type_docu", "base", "couleur", "copie_pdf_correspondant")
				values ( :v_nom_document, :v_ext, 'O', 'N', :v_path, :type_gestion , :nom_base, :v_couleur, 'N' ) ;
				if sqlca.sqlcode = 0 then
					commit ;	
				else
					MessageBox("ATTENTION","Erreur dans l'ajout du document '"+v_nom_document + "." + v_ext + "' en base de données.~n~n" + sqlca.sqlerrtext )
					rollback ;
				end if
			else
				select top 1 isnull(nom_document,''), isnull(couleur,1)  into :v_nom_cherche , :v_couleur from  "courriers_word" 
				where  "nom_document" = :v_nom_document and 	"extension" = :v_ext 
				and  "dossier" =  :v_path and "base" = :nom_base  ;

			end if
			
			if type_gestion = "W" then
				if right(lb_files.text(j), len(ExtentionWord) ) = ExtentionWord then
					ltvi_Item.label = left(lb_files.text(j), len(lb_files.text(j)) - len(ExtentionWord)) //on enlève le ".doc"
				else
					ltvi_Item.label = left(lb_files.text(j), len(lb_files.text(j)) - len(ExtentionWord2007)) //on enlève le ".docx"
				end if
				ltvi_Item.pictureindex = v_couleur
				ltvi_Item.selectedpictureindex = v_couleur
			else
				// powerpoint
				if right(lb_files.text(j), len(ExtentionWord) ) = ExtentionPowerPoint then
					ltvi_Item.label = left(lb_files.text(j), len(lb_files.text(j)) - len(ExtentionPowerPoint)) //on enlève le ".ppt"
				else
					ltvi_Item.label = left(lb_files.text(j), len(lb_files.text(j)) - len(ExtentionPowerPoint2007)) //on enlève le ".pptx"
				end if
				ltvi_Item.pictureindex = v_couleur
				ltvi_Item.selectedpictureindex = v_couleur
			end if
			


			// et on insere ce nouveau noeud fichier au treeview
			v_arbre.InsertItemLast(handlerepracine, ltvi_Item)
			
			
			
			
			
		next
	end if

// Recherche des sous répertoires
nbr_rep = load_sousrep(rep_depart, lb_rep_2011)

// On place le n
//boucle sur les sous rep pour retrouver
//		* leur nom
// 	* les fichiers qui s'y trouvent
for i = 1 to nbr_rep
			// ds une listbox, les nom de rep apparaissent sous la forme de [nom_rep]
		// on enlève donc les [ ]
		lsousrep = mid(lb_rep_2011.Text(i), 2, len(lb_rep_2011.Text(i)) -2)
		chemincomplet = rep_depart + lsousrep + win_Delimiter
		if lsousrep <> ".." then
			load_sousrep_2011(chemincomplet, lsousrep, handlerepracine, v_arbre, usage_normal)
		end if
next


// pas de gestion d'erreur
return 1
end function

public function integer load_tv_2011 (ref treeview v_arbre, string v_dir_courriers, boolean usage_normal);// fx qui intialise le treeview
// en chargeant la structure de rep du rep courrier
// et en filtrant sur les fichiers .doc ou docx

// s'appuie sur load_sousrep_2011 qui travaille en recursif !!!!

// V_arbre permet de charger un treview passé en pram
// v_dir_courriers permet de charger soit les courriers locaux, soit les courriers réseaux

TreeViewItem	ltvi_Item		// un noeud à insérer
int				nbr_rep			// le nbr de rep trouvés ds le rep photo
int				nbr_files		// le nbr de fichier trouvés ds le rep cherché
int				i,j				// cpt de boucles (pour les sous rep et les fichiers)
string			lsousrep			// récup un sous rep
string		chemincomplet		// chemin complet d'un sous-rep ou d'un fichier
long			handlesousrep		// pour récup le handle d'un élément du trreview
long			handlerepracine	// pour récup le handle du rep racine (rep courrier)


// on recherche les sous rep du rep courrier
nbr_rep = load_sousrep(v_dir_courriers)

if nbr_rep < 1 then
	// si un pb rencontrer ds la recherche des sous rep (rep courrier : pas 1 rep valide)
	messagebox("ATTENTION", "Une erreur est survenue. ~nIl est probable que votre répertoire courrier soit ~nmal indiqué OU inaccessible. ~n~nImpossible de poursuivre !", Exclamation!)
	var_suite = false
	//Close(this)
	
else
	// le rep courrier indiqué est 1 rep valide

	// passe en mode traitement
	SetPointer(HourGlass!)
	v_arbre.SetRedraw(False)

	// on reset le treeview
	Blanc_Tv(v_arbre)
	
	if type_gestion = "W" then 
		load_sousrep_2011( v_dir_courriers, "Courriers types", 0, v_arbre, usage_normal)
	else
		load_sousrep_2011( v_dir_courriers, "Présentations types", 0, v_arbre, usage_normal)
	end if
		
	// repasse en mode utilisation

	if cbx_eclater.checked then
		v_arbre.ExpandAll(handle_principal)
	else
		v_arbre.ExpandItem(handle_principal)
	end if
	v_arbre.SetFirstVisible(handle_principal)
	v_arbre.SelectItem(handle_principal)
	v_arbre.SetRedraw(true)
	SetPointer(Arrow!)
	
end if

// pas de gestion d'erreur
return 1
end function

public function integer check_element (boolean usage_normal);// fx qui vérifie si le courier passé en param (chemin complet)
// est tjrs présent
// return 1 si ok, -1 sinon

TreeViewItem	ltvi_Item

if type_gestion = "W" then

	// on récup l'élément courant
	if tv_courriers.GetItem(tv_courriers.FindItem(CurrentTreeItem!, 0), ltvi_Item) = -1 then return -1
	
	// On teste le .doc et le .docx .... 
	if not fxg_FileExists(get_chemin_fichier(ltvi_Item) + get_nom_fichier(ltvi_Item)) and not fxg_FileExists(get_chemin_fichier(ltvi_Item) + get_nom_fichier_2007(ltvi_Item))  then
		// le fichier est introuvable
		messagebox("ATTENTION","L'élément sélectionné n'est plus présent, ~nl'arborescence présentée va se rafraîchir. ~n~n Renouvelez ensuite votre opération.",Exclamation!)
		if usage_normal then 
			load_tv_2011(tv_courriers , dir_courriers, usage_normal)
		else
			load_tv_2011(tv_cabinet , v_dir_courriers_reseau, usage_normal)
		end if
		return -1
	else
		// le fichier est bien présent
		return 1
	end if
else
	// on récup l'élément courant
	if tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_Item) = -1 then return -1
	
	// On teste le .doc et le .docx .... 
	if not fxg_FileExists(get_chemin_fichier(ltvi_Item) + get_nom_fichier(ltvi_Item)) and not fxg_FileExists(get_chemin_fichier(ltvi_Item) + get_nom_fichier_2007(ltvi_Item))  then
		// le fichier est introuvable
		messagebox("ATTENTION","L'élément sélectionné n'est plus présent, ~nl'arborescence présentée va se rafraîchir. ~n~n Renouvelez ensuite votre opération.",Exclamation!)
		load_tv_2011(tv_powerpoint , dir_courriers, usage_normal)
		return -1
	else
		// le fichier est bien présent
		return 1
	end if
	
end if
end function

public function integer del_element (boolean usage_normal);// fx qui va supprimer l'élément sélectionné

TreeViewItem	ltvi_Source
string			chemin_et_nom_fichier
int				nbr_files
double 		v_id_supp

string v_nom_document, v_extension, v_dossier

integer retour

if type_gestion = "W" then 
	if usage_normal then 
		retour = tv_courriers.GetItem(tv_courriers.FindItem(CurrentTreeItem!, 0), ltvi_Source)
	else
		retour = tv_cabinet.GetItem(tv_cabinet.FindItem(CurrentTreeItem!, 0), ltvi_Source)
	end if
else
		retour = tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_Source)
end if

if retour = -1 then
// si il y a un pb lors de la récup de l'élément sélectionné
	msg_erreur(1)
else
// l'élément a bien était récup
	if le_rep_courrier(ltvi_Source) then
	// si c le rep racine : càd le rep courrier -> on ne peut pas l'effacer
		messagebox("Information", "L'élément sélectionné est la représentation ~ndu répertoire principal de stockage. ~n~nOn ne peut pas le supprimer !")
	else
	// c pas le rep courrier
		if une_categorie(ltvi_Source) then
		// si c une catégorie
			// on vérif si le sous rep (càd la catégorie) est vide de tout fichier)
			lb_files.reset()
			if lb_files.DirList(ltvi_Source.data + win_AllFiles, 32) then
			// si le chemin était valide -> on vérif si des fichiers !
				if lb_files.TotalItems() > 0 then
				// il y a au moins un fichier trouvé
					messagebox("Information", "L'élément sélectionné est un Dossier. ~n~nPour le supprimer il ne doit y rester aucun document !")
				else
				// aucun fichiers présent ds la catégorie -> on peut la suprimer
					if fxg_FileExists(ltvi_Source.data) then
					// si le rep existe bien --> on le supprime
						// petite astuce afin de libérer le rep qu'on veut supprimer
						// sinon impossible déxécuter le RemoveDirectoryA
						lb_files.DirList("c:\" + win_AllFiles, 32)
						if RemoveDirectoryA(ltvi_Source.data) = 0 then
						// un pb est rencontré lors de la suppression -> msg
							messagebox("ERREUR", "Erreur lors de la suppression du Dossier.", StopSign!)
						end if
					end if
				end if
			end if
		else
		// c un fichier word
			if messagebox("QUESTION", "Souhaitez-vous vraiment supprimer cet élément, ~nl'opération est irrémédiable.", Question!, YesNo!, 2) = 1 then
			// si l'utilisateur est d'accord -> on tnete de supprimer le fichier
				//chemin_et_nom_fichier = ltvi_Source.data + ltvi_Source.label + ExtentionWord
				chemin_et_nom_fichier = ltvi_Source.data 
				if len(trim(chemin_et_nom_fichier)) > 0 then
					// si le fichier existe bien --> on le suprrime
					if DeleteFileA(chemin_et_nom_fichier) = 0 then
						messagebox("ERREUR", "Erreur lors de la suppression du fichier.~n~n"+chemin_et_nom_fichier, StopSign!)
					else
						// le fichier a été supprimé ... on le supprime de la base de données ... 
						
						v_id_supp = get_id_document  (chemin_et_nom_fichier)
						
						delete from courriers_word where id = :v_id_supp ;

						commit ;
					end if
				end if
			end if
		end if
	end if
	
	if type_gestion = "W" then
		if usage_normal then
			// on rafraichi l'arbre
			load_tv_2011(tv_courriers, dir_courriers, usage_normal)
		else
			load_tv_2011(tv_cabinet, v_dir_courriers_reseau, usage_normal)
		end if 
	else
			load_tv_2011(tv_powerpoint, dir_courriers, usage_normal)
	end if
				
end if

// pas de gestion d'erreur
return 1
end function

public function integer rename_element (boolean usage_normal);// fx qui va renommer l'élément sélectionné

TreeViewItem	ltvi_a_renommer
string			chemin_et_nom_fichier
int				nbr_files
string			lstr_new_nom, lstr_ancien_nom
string			lstr_ancien_path, lstr_nouveau_path

double 		v_id_modif
string 		v_nom_document , v_extension , 	v_dossier
long retour

if type_gestion = "W" then 
	if usage_normal then
		retour = tv_courriers.GetItem(tv_courriers.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
	else
		retour = tv_cabinet.GetItem(tv_cabinet.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
	end if
else
	retour = tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
end if

if retour = -1 then
// si il y a un pb lors de la récup de l'élément sélectionné
	msg_erreur(1)
else
	
	// l'élément a bien était récup
	if le_rep_courrier(ltvi_a_renommer) then
		// si c le rep racine : càd le rep courrier -> on ne peut pas l'effacer
		messagebox("Information", "L'élément sélectionné est la représentation ~ndu répertoire courrier. ~n~nOn ne peut pas le renommer !")
	else
		// c pas le rep courrier
		lstr_ancien_nom =  ltvi_a_renommer.label
		lstr_ancien_path = ltvi_a_renommer.data
		if une_categorie(ltvi_a_renommer) then
			// si c une catégorie (sous-rep)
			// on demande de rentrer le nouveau libellé
			lstr_new_nom = trim(inputboxWithPropo("Renommer ...", "Entrez le nouveau libellé de l'élément '" + ltvi_a_renommer.label + "' :" , lstr_ancien_nom ,  true ))
			if lstr_new_nom <> "" and lstr_ancien_path <> lstr_nouveau_path then
				// si l'utilisateur a bien entrer une valeur (s'il n'a pas annuler)
				lstr_nouveau_path = left(lstr_ancien_path, len(lstr_ancien_path) - len(ltvi_a_renommer.label) - len(win_delimiter)) + lstr_new_nom + win_delimiter
				
				if MoveFileA(lstr_ancien_path, lstr_nouveau_path) = 0 then msg_erreur(1)

			end if
		else
			// c un fichier
			// on modifie les proprités depuis 2016

				// recup de l'id pour 
				v_id_modif = get_id_document(lstr_ancien_path)

				
				if v_id_modif = 0 then
					// pas référencement en base de données => on crée
					v_id_modif = ajouter_document(lstr_ancien_path)
				end if
				
				openWithParm(w_courriers_word_proprietes, v_id_modif)
	
				string v_new_dossier, v_new_nom, v_new_ext  
				select isnull(dossier, ''), isnull(nom_document, '') , isnull(extension, '') 
				into :v_new_dossier, :v_new_nom, :v_new_ext 
				from courriers_word where id = :v_id_modif ;
				
				lstr_nouveau_path = dir_courriers + v_new_dossier + v_new_nom + '.' + v_new_ext 
		
//			lstr_ancien_path = ltvi_a_renommer.data
//			if type_gestion = "W" then 
//				if right(lstr_ancien_path, 4) = ExtentionWord then 
//					// C'était un fichier .doc
//					lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionWord
//				else
//					// C'était un fichier .docx
//					lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionWord2007
//				end if
//			else
//				if right(lstr_ancien_path, 4) = ExtentionPowerPoint then 
//					// C'était un fichier .ppt
//					lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionPowerPoint
//				else
//					// C'était un fichier .pptx
//					lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionPowerPoint2007
//				end if
//			end if
			
			// si un pb pendant renomage --> msg erreur
			if lstr_ancien_path <> lstr_nouveau_path then
				if MoveFileA(lstr_ancien_path, lstr_nouveau_path) = 0 then msg_erreur(1)
			end if
			
		end if
	end if
	
	if type_gestion = "W" then 
		if usage_normal then
			// on rafraichi l'arbre
			load_tv_2011(tv_courriers, dir_courriers, usage_normal)
		else
			// on rafraichi l'arbre Cabinet
			load_tv_2011(tv_cabinet, v_dir_courriers_reseau, usage_normal)
		end if
	else
			load_tv_2011(tv_powerpoint, dir_courriers, usage_normal)
	end if
				
end if

// pas de gestion d'erreur
return 1

















//// fx qui va renommer l'élément sélectionné
//
//TreeViewItem	ltvi_a_renommer
//string			chemin_et_nom_fichier
//int				nbr_files
//string			lstr_new_nom, lstr_ancien_nom
//string			lstr_ancien_path, lstr_nouveau_path
//
//long retour
//
//if type_gestion = "W" then 
//	if usage_normal then
//		retour = tv_courriers.GetItem(tv_courriers.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
//	else
//		retour = tv_cabinet.GetItem(tv_cabinet.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
//	end if
//else
//	retour = tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
//end if
//
//if retour = -1 then
//// si il y a un pb lors de la récup de l'élément sélectionné
//	msg_erreur(1)
//else
//// l'élément a bien était récup
//	if le_rep_courrier(ltvi_a_renommer) then
//	// si c le rep racine : càd le rep courrier -> on ne peut pas l'effacer
//		messagebox("Information", "L'élément sélectionné est la représentation ~ndu répertoire courrier. ~n~nOn ne peut pas le renommer !")
//	else
//		// c pas le rep courrier
//		// on demande de rentrer le nouveau libellé
//		lstr_ancien_nom =  ltvi_a_renommer.label
//		lstr_new_nom = inputboxWithPropo("Renommer ...", "Entrez le nouveau libellé de l'élément '" + ltvi_a_renommer.label + "' :" , lstr_ancien_nom ,  true )
//		if lstr_new_nom <> "" then
//			// si l'utilisateur a bien entrer une valeur (s'il n'a pas annuler)
//			if une_categorie(ltvi_a_renommer) then
//				// si c une catégorie (sous-rep)
//				lstr_ancien_path = ltvi_a_renommer.data
//				lstr_nouveau_path = left(lstr_ancien_path, len(lstr_ancien_path) - len(ltvi_a_renommer.label) - len(win_delimiter)) + lstr_new_nom + win_delimiter
//				
//			else
//			// c un fichier
//			
//				lstr_ancien_path = ltvi_a_renommer.data
//				if type_gestion = "W" then 
//					if right(lstr_ancien_path, 4) = ExtentionWord then 
//						// C'était un fichier .doc
//						lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionWord
//					else
//						// C'était un fichier .docx
//						lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionWord2007
//					end if
//				else
//					if right(lstr_ancien_path, 4) = ExtentionPowerPoint then 
//						// C'était un fichier .ppt
//						lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionPowerPoint
//					else
//						// C'était un fichier .pptx
//						lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionPowerPoint2007
//					end if
//				end if
//			end if
//			
//			// si un pb pendant renomage --> msg erreur
//			if MoveFileA(lstr_ancien_path, lstr_nouveau_path) = 0 then msg_erreur(1)
//			
//		end if
//	end if
//	
//	if type_gestion = "W" then 
//		if usage_normal then
//			// on rafraichi l'arbre
//			load_tv_2011(tv_courriers, dir_courriers, usage_normal)
//		else
//			// on rafraichi l'arbre Cabinet
//			load_tv_2011(tv_cabinet, v_dir_courriers_reseau, usage_normal)
//		end if
//	else
//			load_tv_2011(tv_powerpoint, dir_courriers, usage_normal)
//	end if
//				
//end if
//
//// pas de gestion d'erreur
//return 1
end function

public function integer add_categ (boolean usage_normal);// fx qui rajoute une catégorie au treeview

security_attributes	sa		//pour compatibilité winNT lors de création de directory
string		lstr_newcateg
string		lstr_chemincateg


// demande le nom de la new catégorie
lstr_newcateg = inputboxWithPropo("Nouveau Dossier ...", "Entrez le nom du dossier à créer :" , "", true)

if lstr_newcateg <> "" then
	// si l'utilisateur a bien entrer une valeur (s'il n'a pas annulé)
	// construction du chemin complet de la catégrie
	// chemin_categorie_selectionnee est mise à jour par l'event selectionchanged du tree view
	// (ou chemin_categorie_selectionnee_cabinet selon l'usage !!!!)
	
	lstr_newcateg = trim(lstr_newcateg)
	
	if usage_normal then
		lstr_chemincateg = chemin_categorie_selectionnee + lstr_newcateg + win_Delimiter
	else
		lstr_chemincateg = chemin_categorie_selectionnee_cabinet + lstr_newcateg + win_Delimiter
	end if
	
	if fxg_FileExists(lstr_chemincateg) then
	// si la catégorie existe dèjà : msg d'erreur
		messagebox("ERREUR", "Impossible de poursuivre, ce dossier existe déjà !", StopSign!)
	else
		// la catégorie n'existe pas encore
		// on la crée
		CreateDirectoryA(lstr_chemincateg,sa)
		if usage_normal then
			// on rafraichie l'arborescence
			load_tv_2011(tv_courriers, dir_courriers, usage_normal)
			load_tv_2011(tv_powerpoint, dir_courriers, usage_normal)
		else
			// on rafraichie l'arborescence
			load_tv_2011(tv_cabinet, v_dir_courriers_reseau, usage_normal)
		end if
			
	end if
end if

// pas de gestion d'erreur
return 1
end function

public function integer add_courrier (boolean usage_normal);// fx qui rajoute un courrier ds la categ sélectionnée

string			lstr_newcourrier
string			lstr_chemincourrier
TreeViewItem	ltvi_Source
boolean v_suite = true
integer v_retour
string v_extension_sans_point, v_path

// demande le nom du nouveau courrier
if 	type_gestion = "W" then
	lstr_newcourrier = inputboxWithPropo("Nouveau Courrier ...", "Entrez le nom du document à créer :" , "", true)
else
	lstr_newcourrier = inputboxWithPropo("Nouvelle Présentation ...", "Entrez le nom de la présentation à créer :", "", true )
end if

if lstr_newcourrier <> "" then
	
// si l'utilisateur a bien entrer une valeur (s'il n'a pas annulé)

	if 	type_gestion = "W" then
		if tv_courriers.GetItem(tv_courriers.FindItem(CurrentTreeItem!, 0), ltvi_Source) = -1 then
			// si il y a un pb lors de la récup de l'élément sélectionné
			msg_erreur(1)
			v_suite = false
		end if
	else
		if tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_Source) = -1 then
			// si il y a un pb lors de la récup de l'élément sélectionné
			msg_erreur(1)
			v_suite = false
		end if
	end if
	
	if v_suite then
		// l'élément a bien était récup
		// on instancie l'objet uo_lien_word
	
		if not fxg_FileExists(ltvi_Source.data) then
			// si le chemin indiqué n'existe pas -> msg d'erreur et on stop l'opération
			messagebox("ERREUR", "Impossible de poursuivre,~nle dossier sélectionné semble ne plus exister !", Exclamation!)
		else
			// le rep/sousrep existe bien -> on continue
			// construction du chemin complet du nouveau courrier
			
			if type_gestion = "W" then
				lstr_chemincourrier = ltvi_Source.data + lstr_newcourrier + ExtentionWord
				v_retour = uo_word.make_new_doc(lstr_chemincourrier)
				v_extension_sans_point = right(ExtentionWord, len(ExtentionWord) - 1) 
			else
				lstr_chemincourrier = ltvi_Source.data + lstr_newcourrier + ExtentionPowerpoint
				v_retour = uo_powerpoint.make_new_document(lstr_chemincourrier)
				v_extension_sans_point = right(ExtentionPowerpoint, len(ExtentionPowerpoint) - 1) 
			end if
			
			// on crée le nouveau doc
			choose case v_retour
				case 0
					// si un pb survient pendant la création du nouveau doc
					messagebox("ERREUR", "Impossible de poursuivre, ~nun courrier portant le même nom existe déjà !", StopSign!)
				case -1
					// une erreur quelconque est survenue
					messagebox("ERREUR", "Impossible de poursuivre, ~nune erreur est survenue durant l'opération. ", StopSign!)
				case 1 
					// L'ajout s'est bien passé => inscription en base de données
					v_path = ltvi_Source.data
					v_path = gfx_extraire_path_fichier_en_relatif(v_path, dir_courriers)
					
					ajouter_document (lstr_chemincourrier)
//					insert into courriers_word ( "nom_document", "extension", "memorisation", "copie_pdf", "dossier" , "type_docu", "base")
//					values ( :lstr_newcourrier , :v_extension_sans_point, 'O', 'N', :v_path, :type_gestion, :base) ;
//					commit ;
			end choose
		end if


		if type_gestion = "W" then 
			// dans tout les cas on rafraichie le treeview
			load_tv_2011(tv_courriers, dir_courriers, usage_normal)
		else
			// dans tout les cas on rafraichie le treeview
			load_tv_2011(tv_powerpoint, dir_courriers, usage_normal)

		end if
	end if
end if

// pas de gestion d'erreur
return 1
end function

public function integer find_and_highlight (string item_name, ref treeview tv_param);// fx qui retrouve l'item dont le nom est passé en param
// une fois trouvé -> on le "met en surbrillance
// return	1 si ok
//				0 si pas d'item de ce nom
//				-1 si pb

int				return_val = 1
boolean			item_trouve
treeviewitem	ltvitem
long				i
long				root_item_hdle
long				categ_item_hdle
long				item_hdle


// on récup le item racine
root_item_hdle = tv_param.FindItem(RootTreeItem!, 0)

if root_item_hdle <> -1 then
// s'il y a bien un noeud racine
	// on récup le handle du premier fils
	item_hdle = tv_param.FindItem(ChildTreeItem!, root_item_hdle)
	
	if item_hdle <> -1 then
	// il y a au moins un fils
		if tv_param.GetItem(item_hdle, ltvitem) <> 1 then
		// on ne peut le récup -> un pb
			return_val = -1
		else
		// l'item est récup
			do until item_trouve
			// tant qu'on a pas trouvé
				if ltvitem.label = item_name then
				// si c l'élément recherché
					item_trouve = true
				else
				// c pas l'élem recherché
					if une_categorie(ltvitem) then
					// si l'item sélectionné est une catégorie
						categ_item_hdle = item_hdle
						
						// on récup le handle de son premier fils
						item_hdle = tv_param.FindItem(ChildTreeItem!, root_item_hdle)
					end if
				end if
			loop
			
			if item_trouve then
			// si on a trouvé l'item -> on le met en surbrillance
				
			end if
		end if
	else
	// pas de fils trouvé -> on ne peut donc pas trouver l'item recherché
		return_val = 0
	end if
else
// pas de noeud racine -> pas normale
	return_val = -1
end if	

return return_val
end function

public subroutine word_ou_powerpoint (string mode_office);

// Modification de l'interface selon le mode Word ou powerPoint


if mode_office = 'P'  then
	
	// PowerPoint 
	tv_powerpoint.visible = true
	tv_courriers.visible = false
	type_gestion = "P"
	pb_previ_email.enabled ( false )
	pb_email.enabled ( false )
	cb_param.enabled ( false )
	pb_favoris.enabled ( false )
	pb_imprimer.text = "Diaporama"
	// on raffraichit car sinon on a un carré !!
	pb_imprimer.enabled ( pb_imprimer.enabled )
	pb_signature_numerique.enabled ( false )	
	pb_signature_en_ligne.enabled ( false )	
	
	
	if dw_favoris.visible then
		// Les favoris Word étaient activés => on vire
		pb_favoris.triggerevent(clicked!)
	end if

	
else
	
	// Word 
	tv_powerpoint.visible = false
	tv_courriers.visible = true
	type_gestion = "W"
	pb_previ_email.enabled ( true )
	pb_email.enabled ( true )
	cb_param.enabled ( true )
	pb_favoris.enabled ( true )
	pb_imprimer.text = "Impression Directe"
	// on raffraichit car sinon on a un carré !!
	pb_imprimer.enabled ( pb_imprimer.enabled )
	pb_signature_numerique.enabled (b_signature_numerique_dentalsign	)
	pb_signature_en_ligne.enabled (mon_orthodontiste or TEA	)

end if
end subroutine

public subroutine maj_focus (treeview tv, long newhandle);TreeViewItem		ltvi_Source

//Messagebox("handle de maj focus", string(newhandle))


if tv.GetItem(newhandle, ltvi_Source) = -1 then
	// si il y a un pb lors de la récup de l'élément sélectionné
	msg_erreur(1)
	return
end if

tv.SelectItem ( newhandle )

if le_rep_courrier(ltvi_Source) then
	// si c le rep courrier qui est sélectionné
	pb_ajouter_courrier.enabled  (maj_word_autorisee)
	cb_supprimer_elem.enabled ( false )
	cb_renommer_elem.enabled ( false )
	pb_editer.enabled ( false )
	pb_previ_imp.enabled ( false )
	pb_imprimer.enabled ( false )
	pb_signature_numerique.enabled ( false )
	pb_signature_en_ligne.enabled (false	)
	pb_previ_email.enabled ( false )
	pb_email.enabled ( false )
	pb_copie_cabinet.enabled ( false )
	
	// Categorie
	pb_ajouter_categ.enabled  (maj_word_autorisee)
	chemin_categorie_selectionnee = ltvi_Source.data
	
	// favoris
	pb_ajouter_favoris.enabled ( false )
	
elseif une_categorie(ltvi_Source) then 
	// si c une catégorie
	pb_ajouter_courrier.enabled ( maj_word_autorisee)
	cb_supprimer_elem.enabled ( maj_word_autorisee)
	cb_renommer_elem.enabled ( maj_word_autorisee)
	pb_editer.enabled ( false )
	pb_previ_imp.enabled ( false )
	pb_imprimer.enabled ( false )
	pb_signature_numerique.enabled ( false )
	pb_signature_en_ligne.enabled (false	)
	pb_previ_email.enabled ( false )
	pb_email.enabled ( false )
	pb_copie_cabinet.enabled ( false )

	// Categorie
	pb_ajouter_categ.enabled ( maj_word_autorisee)
	chemin_categorie_selectionnee = ltvi_Source.data
	
	// favoris
	pb_ajouter_favoris.enabled ( false )

else
	// c un fichier
	pb_ajouter_courrier.enabled ( false )
	cb_supprimer_elem.enabled ( maj_word_autorisee)
	cb_renommer_elem.enabled ( maj_word_autorisee)
	pb_editer.enabled (maj_word_autorisee)
	pb_previ_imp.enabled ( true )
	pb_imprimer.enabled ( true )
	if type_gestion = "W" then
		pb_signature_numerique.enabled ( b_signature_numerique_dentalsign )
		pb_signature_en_ligne.enabled (mon_orthodontiste or TEA	)
		pb_previ_email.enabled ( true )
		pb_email.enabled ( true )
	else
		// pas d'envoi mail avec PPT
		pb_signature_numerique.enabled ( false )
		pb_signature_en_ligne.enabled (false	)
		pb_previ_email.enabled ( false )
		pb_email.enabled ( false )
	end if

	pb_copie_cabinet.enabled ( true )

	// Categorie
	pb_ajouter_categ.enabled ( false )
	chemin_categorie_selectionnee = ''
	
	// favoris
	pb_ajouter_favoris.enabled ( true )

end if
end subroutine

public function double ajouter_document (string v_document_complet);		
// ajoute un document en base de données 

// renvoie l'id du document en base si OK, -1 si pas ok

string v_nom_document, v_extension, v_dossier
double v_id_new

v_nom_document = gfx_fichier_sans_extension(v_document_complet)
v_dossier = gfx_extraire_path_fichier_en_relatif(v_document_complet, dir_courriers)
v_extension = gfx_extraire_extension_fichier(v_document_complet)


insert into courriers_word ( "nom_document", "extension", "memorisation", "copie_pdf", "dossier" , "type_docu", "base", "couleur", "copie_pdf_correspondant")
values ( :v_nom_document , :v_extension, 'O', 'N', :v_dossier, :type_gestion, :nom_base, 1, 'N') ;

if sqlca.sqlcode = 0 then
	commit ;
	// enregistrement OK
	
	select id into :v_id_new from courriers_word where nom_document = :v_nom_document and extension = :v_extension and 
	dossier = :v_dossier and base = :nom_base ;
	
	return v_id_new
else
	rollback ;
	Messagebox("ATTENTION", "Erreur dans le référencement du document en base de données.~n~n" + sqlca.sqlerrText )
	return -1 
end if
end function

public function integer duplicate_element (boolean usage_normal);// fx qui va renommer l'élément sélectionné

TreeViewItem	ltvi_a_renommer
string			chemin_et_nom_fichier
int				nbr_files
string			lstr_new_nom, lstr_ancien_nom
string			lstr_ancien_path, lstr_nouveau_path

double 		v_id_modif
string 		v_nom_document , v_extension , 	v_dossier
long retour

if type_gestion = "W" then 
	if usage_normal then
		retour = tv_courriers.GetItem(tv_courriers.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
	else
		retour = tv_cabinet.GetItem(tv_cabinet.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
	end if
else
	retour = tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
end if

if retour = -1 then
// si il y a un pb lors de la récup de l'élément sélectionné
	msg_erreur(1)
else
	
	// l'élément a bien était récup
	if le_rep_courrier(ltvi_a_renommer) then
		// si c le rep racine : càd le rep courrier -> on ne peut pas l'effacer
		messagebox("Information", "L'élément sélectionné est la représentation ~ndu répertoire courrier. ~n~nOn ne peut pas le dupliquer !")
	else
		// c pas le rep courrier
		lstr_ancien_nom =  ltvi_a_renommer.label
		lstr_ancien_path = ltvi_a_renommer.data
		if une_categorie(ltvi_a_renommer) then
			// si c une catégorie (sous-rep)
			// on demande de rentrer le nouveau libellé
			messagebox("Information", "L'élément sélectionné est un dossier. ~n~nOn ne peut pas le dupliquer !")
		else
			// c un fichier .. duplication effective

				// recup de l'id pour 
				v_id_modif = get_id_document(lstr_ancien_path)

				if v_id_modif = 0 then
					// pas référencement en base de données => on crée
					v_id_modif = ajouter_document(lstr_ancien_path)
				end if
				
				string v_nouveau_nom 
				string v_que_path, v_que_extension
				
				v_que_path = gfx_extraire_path_fichier(lstr_ancien_path)
				v_que_extension = "." + gfx_extraire_extension_fichier(lstr_ancien_path)
				v_nouveau_nom = lstr_ancien_nom + " (Copie)"

				// Copy du fichier
				if FileCopy(v_que_path + lstr_ancien_nom + v_que_extension, v_que_path + v_nouveau_nom + v_que_extension, false) = 1 then
					// modif en base
					insert into courriers_word ( nom_document, extension, memorisation, copie_pdf, dossier, type_docu, base, couleur, copie_pdf_correspondant)
					(select :v_nouveau_nom, extension, memorisation, copie_pdf, dossier, type_docu, base, couleur, copie_pdf_correspondant from courriers_word 
					where id = :v_id_modif) ;
					if sqlca.sqlcode = 0 then
						select max(id) into : v_id_modif from courriers_word ;
						commit ;
						Messagebox("INFORMATION","La duplication a réussi.~n~nVous allez accéder aux propriétés du document pour le renommer.") 
						openWithParm(w_courriers_word_proprietes, v_id_modif)
						
						// Le nouveau nom ... devient l'ancien du coup
						lstr_ancien_nom = v_nouveau_nom
						
						// Récupération du nouveau nom final
						select nom_document into :v_nouveau_nom  from courriers_word where id = :v_id_modif ;  
						
						// On renomme le fichier physique 
						if MoveFileA(v_que_path + lstr_ancien_nom + v_que_extension,  v_que_path + v_nouveau_nom + v_que_extension) = 0 then msg_erreur(1)

					else
						Messagebox("ATTENTION", "Erreur dans la duplication du document !~n~n(Inscription en base de données)")
						rollback ;
					end if
				else
					Messagebox("ATTENTION", "Erreur dans la duplication du document !~n~n(Copie du fichier)")
				end if
				
		end if
	end if
	
	if type_gestion = "W" then 
		if usage_normal then
			// on rafraichi l'arbre
			load_tv_2011(tv_courriers, dir_courriers, usage_normal)
		else
			// on rafraichi l'arbre Cabinet
			load_tv_2011(tv_cabinet, v_dir_courriers_reseau, usage_normal)
		end if
	else
		load_tv_2011(tv_powerpoint, dir_courriers, usage_normal)
	end if
				
end if

// pas de gestion d'erreur
return 1

















//// fx qui va renommer l'élément sélectionné
//
//TreeViewItem	ltvi_a_renommer
//string			chemin_et_nom_fichier
//int				nbr_files
//string			lstr_new_nom, lstr_ancien_nom
//string			lstr_ancien_path, lstr_nouveau_path
//
//long retour
//
//if type_gestion = "W" then 
//	if usage_normal then
//		retour = tv_courriers.GetItem(tv_courriers.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
//	else
//		retour = tv_cabinet.GetItem(tv_cabinet.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
//	end if
//else
//	retour = tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_a_renommer)
//end if
//
//if retour = -1 then
//// si il y a un pb lors de la récup de l'élément sélectionné
//	msg_erreur(1)
//else
//// l'élément a bien était récup
//	if le_rep_courrier(ltvi_a_renommer) then
//	// si c le rep racine : càd le rep courrier -> on ne peut pas l'effacer
//		messagebox("Information", "L'élément sélectionné est la représentation ~ndu répertoire courrier. ~n~nOn ne peut pas le renommer !")
//	else
//		// c pas le rep courrier
//		// on demande de rentrer le nouveau libellé
//		lstr_ancien_nom =  ltvi_a_renommer.label
//		lstr_new_nom = inputboxWithPropo("Renommer ...", "Entrez le nouveau libellé de l'élément '" + ltvi_a_renommer.label + "' :" , lstr_ancien_nom ,  true )
//		if lstr_new_nom <> "" then
//			// si l'utilisateur a bien entrer une valeur (s'il n'a pas annuler)
//			if une_categorie(ltvi_a_renommer) then
//				// si c une catégorie (sous-rep)
//				lstr_ancien_path = ltvi_a_renommer.data
//				lstr_nouveau_path = left(lstr_ancien_path, len(lstr_ancien_path) - len(ltvi_a_renommer.label) - len(win_delimiter)) + lstr_new_nom + win_delimiter
//				
//			else
//			// c un fichier
//			
//				lstr_ancien_path = ltvi_a_renommer.data
//				if type_gestion = "W" then 
//					if right(lstr_ancien_path, 4) = ExtentionWord then 
//						// C'était un fichier .doc
//						lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionWord
//					else
//						// C'était un fichier .docx
//						lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionWord2007
//					end if
//				else
//					if right(lstr_ancien_path, 4) = ExtentionPowerPoint then 
//						// C'était un fichier .ppt
//						lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionPowerPoint
//					else
//						// C'était un fichier .pptx
//						lstr_nouveau_path = gfx_extraire_path_fichier(ltvi_a_renommer.data) + lstr_new_nom + ExtentionPowerPoint2007
//					end if
//				end if
//			end if
//			
//			// si un pb pendant renomage --> msg erreur
//			if MoveFileA(lstr_ancien_path, lstr_nouveau_path) = 0 then msg_erreur(1)
//			
//		end if
//	end if
//	
//	if type_gestion = "W" then 
//		if usage_normal then
//			// on rafraichi l'arbre
//			load_tv_2011(tv_courriers, dir_courriers, usage_normal)
//		else
//			// on rafraichi l'arbre Cabinet
//			load_tv_2011(tv_cabinet, v_dir_courriers_reseau, usage_normal)
//		end if
//	else
//			load_tv_2011(tv_powerpoint, dir_courriers, usage_normal)
//	end if
//				
//end if
//
//// pas de gestion d'erreur
//return 1
end function

public subroutine signature_en_ligne (boolean patient_courant, boolean favoris, boolean questionnaire, string dossier_courrier, string nom_courrier);string v_nom_fichier_genere
integer v_id_catégorie

if type_gestion = "W" then
	
	open(w_patience)
	
	Trace("- Début de Signature en ligne")
	
	if questionnaire then
		// Questionnaire numérique ou fichier Word de l'historique du patient, le fichier Word est déjà généré ... on e copie juste dans le dossier Ortho pour utilisation
		// FileCopy(dossier_courrier + nom_courrier, dir_ini + nom_courrier)
		Trace("- Questionaire")
		uo_word.traiter_avec_word(Service_SigneEnLigne_Direct, dossier_courrier, nom_courrier, patient_courant) 
		// Sert à compter le nombre de signature => Var 18
		v_nom_fichier_genere = dossier_courrier + nom_courrier
		
	else
		// Cas normal
		if favoris then
			Trace("- Courrier favori : " + dossier_courrier +  nom_courrier )
			uo_word.traiter_avec_word(Service_MajEtSauve, dossier_courrier, nom_courrier, patient_courant) 
		else
			Trace("- Courrier patient courant : " + string(patient_courant))
			routine_word( Service_MajEtSauve, patient_courant)
		end if
		
		//RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Arakis\Power ORTHOkis", "var6", RegString!, v_nom_fichier_genere  )
		v_nom_fichier_genere = Profilestring(dir_ini+inifile_orthokis,"Macros","var6" , "") 	
	end if
	
	close(w_patience)
	
	
	if FileExists(v_nom_fichier_genere) then
		// le fichier a bien été généré

			
		Trace("- Fichier Généré : " + v_nom_fichier_genere )

		// On récupère le nombre de signature si > 0, on continue
		integer v_nb_signatures
		string v_nb_signatures_string, var_code_local_string, v_code_intene
		double var_code_local
		
		v_nb_signatures_string = Profilestring(dir_ini+inifile_orthokis,"Macros","var18" , "0") 	
		v_nb_signatures = integer(v_nb_signatures_string)
	
		Trace("- Nombre signatures trouvées : " + string(v_nb_signatures) )
		if v_nb_signatures > 0 then
			
			if v_nb_signatures > 2 then
				Messagebox("ATTENTION !","Vous ne pouvez pas demander plus de 2 signatures en ligne, or ce document en comporte " + string(v_nb_signatures)+".")
			else

				open (w_patience)
				// On va générer le PDF
				
				string fichier_pdf
				string v_statut_signature
				string v_path, v_nom_fichier_avec_extention, v_nom_fichier_sans_extention, v_nouveau_fichier_pdf
	
				boolean v_suite

				// Code du patient !
	
				if patient_courant then
					var_code_local = var_code
				else
					var_code_local_string = Profilestring(dir_ini+inifile_orthokis,"Macros","var13" , "") 	
					var_code_local  = double(var_code_local_string)
				end if
	
				// fichier Word !
	
				v_path = dir_photos + string(var_code_local)+"\"
				v_nom_fichier_avec_extention = gfx_extraire_nom_fichier(v_nom_fichier_genere)
				v_nom_fichier_sans_extention = gfx_fichier_sans_extension(v_nom_fichier_avec_extention)
	
				// Conversion en PDF !!!
				fichier_pdf = fxg_get_nom_fic_document_orthokis_pdf()
				
				// La catégorie du fichier d'origine a est noté en VAR18 par la génération d'avant => on la récupère
				v_id_catégorie = integer(Profilestring(dir_ini+inifile_orthokis,"Macros","var19" , ""))
				
				// On vire le précédent si ...
				FileDelete(fichier_pdf)
	
				fxg_conversion_word_to_pdf(v_nom_fichier_genere, fichier_pdf )

				
				close (w_patience)
	
				If FileExists(fichier_pdf) then
					
					// La converion a réussie
					// Copie du fichier dans le dossier du patient
					v_nouveau_fichier_pdf = v_path + v_nom_fichier_sans_extention  + ".pdf"
					Trace("- Fichier généré à copier vers : " + v_nouveau_fichier_pdf )
				
					if FileCopy(fichier_pdf , v_nouveau_fichier_pdf, true) <> 1 then
						Messagebox("ATTENTION", "Une erreur s'est produite dans le recopie du fichier : " + fichier_pdf + "~n~nvers le fichier : "+ v_nouveau_fichier_pdf)
					else
						if v_nb_signatures = 1 then
							v_statut_signature = "A1"
						else
							v_statut_signature = "A3"
						end if
						// la copie est OK, on génère la liste en historique

						string v_libelle 
						// on vire le début du libellé qui pollue
						v_libelle = gfx_extraire_nom_fichier( v_nouveau_fichier_pdf )
						v_libelle = right(v_nouveau_fichier_pdf, len(v_libelle) - 22)
			

//						v_code_intene = fxg_enregcourrierhisto (var_code_local , 'WORPDF' , today() , v_nom_fichier_avec_extention  ,v_nouveau_fichier_pdf , 'E', "O" , "N", v_statut_signature, v_id_catégorie)
						v_code_intene = fxg_enregcourrierhisto (var_code_local , 'WORPDF' , today() , v_libelle  ,v_nouveau_fichier_pdf , 'E', "O" , "N", v_statut_signature, v_id_catégorie)
						
						param_win[1] = v_statut_signature
						param_win[2] = gfx_extraire_nom_fichier(v_nouveau_fichier_pdf)
						param_win[3] = v_code_intene
						OpenWithParm(w_signature_en_ligne, var_code_local )
						
					end if
					
					FileDelete(fichier_pdf)

					
				else
					Messagebox("ATTENTION","La conversion du document en PDF a échoué.")
				end if
			end if
		else
			Messagebox("ATTENTION !","Le document a bien été généré mais ne contient pas de signature !")
		end if
			
	end if
	tv_courriers.SetFocus()
end if
end subroutine

on w_courriers_word.create
int iCurrent
call super::create
this.gb_transferts=create gb_transferts
this.gb_cabinet=create gb_cabinet
this.pb_email=create pb_email
this.pb_previ_email=create pb_previ_email
this.pb_imprimer=create pb_imprimer
this.pb_previ_imp=create pb_previ_imp
this.cb_param=create cb_param
this.pb_editer=create pb_editer
this.cb_supprimer_elem=create cb_supprimer_elem
this.cb_renommer_elem=create cb_renommer_elem
this.pb_ajouter_courrier=create pb_ajouter_courrier
this.pb_ajouter_categ=create pb_ajouter_categ
this.pb_fermer=create pb_fermer
this.tv_courriers=create tv_courriers
this.gb_2=create gb_2
this.lb_files=create lb_files
this.lb_rep=create lb_rep
this.dw_favoris=create dw_favoris
this.pb_favoris=create pb_favoris
this.pb_ajouter_favoris=create pb_ajouter_favoris
this.pb_supprimer_favoris=create pb_supprimer_favoris
this.pb_annuler_favoris=create pb_annuler_favoris
this.pb_enregistrer_favoris=create pb_enregistrer_favoris
this.cbx_eclater=create cbx_eclater
this.tv_cabinet=create tv_cabinet
this.pb_ajouter_categ_cabinet=create pb_ajouter_categ_cabinet
this.cb_renommer_elem_cabinet=create cb_renommer_elem_cabinet
this.cb_supprimer_elem_cabinet=create cb_supprimer_elem_cabinet
this.pb_copie_cabinet=create pb_copie_cabinet
this.pb_copie_local=create pb_copie_local
this.pb_vider_copier=create pb_vider_copier
this.tv_powerpoint=create tv_powerpoint
this.rb_word=create rb_word
this.rb_powerpoint=create rb_powerpoint
this.pb_signature_numerique=create pb_signature_numerique
this.pb_aide=create pb_aide
this.dw_1=create dw_1
this.pb_rafraichir=create pb_rafraichir
this.pb_signature_en_ligne=create pb_signature_en_ligne
this.cb_dupliquer_favoris=create cb_dupliquer_favoris
this.cb_convertir=create cb_convertir
this.dw_param_publipostage=create dw_param_publipostage
this.gb_eclate=create gb_eclate
this.gb_1=create gb_1
this.gb_type_gestion=create gb_type_gestion
this.uo_powerpoint=create uo_powerpoint
this.uo_word=create uo_word
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.gb_transferts
this.Control[iCurrent+2]=this.gb_cabinet
this.Control[iCurrent+3]=this.pb_email
this.Control[iCurrent+4]=this.pb_previ_email
this.Control[iCurrent+5]=this.pb_imprimer
this.Control[iCurrent+6]=this.pb_previ_imp
this.Control[iCurrent+7]=this.cb_param
this.Control[iCurrent+8]=this.pb_editer
this.Control[iCurrent+9]=this.cb_supprimer_elem
this.Control[iCurrent+10]=this.cb_renommer_elem
this.Control[iCurrent+11]=this.pb_ajouter_courrier
this.Control[iCurrent+12]=this.pb_ajouter_categ
this.Control[iCurrent+13]=this.pb_fermer
this.Control[iCurrent+14]=this.tv_courriers
this.Control[iCurrent+15]=this.gb_2
this.Control[iCurrent+16]=this.lb_files
this.Control[iCurrent+17]=this.lb_rep
this.Control[iCurrent+18]=this.dw_favoris
this.Control[iCurrent+19]=this.pb_favoris
this.Control[iCurrent+20]=this.pb_ajouter_favoris
this.Control[iCurrent+21]=this.pb_supprimer_favoris
this.Control[iCurrent+22]=this.pb_annuler_favoris
this.Control[iCurrent+23]=this.pb_enregistrer_favoris
this.Control[iCurrent+24]=this.cbx_eclater
this.Control[iCurrent+25]=this.tv_cabinet
this.Control[iCurrent+26]=this.pb_ajouter_categ_cabinet
this.Control[iCurrent+27]=this.cb_renommer_elem_cabinet
this.Control[iCurrent+28]=this.cb_supprimer_elem_cabinet
this.Control[iCurrent+29]=this.pb_copie_cabinet
this.Control[iCurrent+30]=this.pb_copie_local
this.Control[iCurrent+31]=this.pb_vider_copier
this.Control[iCurrent+32]=this.tv_powerpoint
this.Control[iCurrent+33]=this.rb_word
this.Control[iCurrent+34]=this.rb_powerpoint
this.Control[iCurrent+35]=this.pb_signature_numerique
this.Control[iCurrent+36]=this.pb_aide
this.Control[iCurrent+37]=this.dw_1
this.Control[iCurrent+38]=this.pb_rafraichir
this.Control[iCurrent+39]=this.pb_signature_en_ligne
this.Control[iCurrent+40]=this.cb_dupliquer_favoris
this.Control[iCurrent+41]=this.cb_convertir
this.Control[iCurrent+42]=this.dw_param_publipostage
this.Control[iCurrent+43]=this.gb_eclate
this.Control[iCurrent+44]=this.gb_1
this.Control[iCurrent+45]=this.gb_type_gestion
end on

on w_courriers_word.destroy
call super::destroy
destroy(this.gb_transferts)
destroy(this.gb_cabinet)
destroy(this.pb_email)
destroy(this.pb_previ_email)
destroy(this.pb_imprimer)
destroy(this.pb_previ_imp)
destroy(this.cb_param)
destroy(this.pb_editer)
destroy(this.cb_supprimer_elem)
destroy(this.cb_renommer_elem)
destroy(this.pb_ajouter_courrier)
destroy(this.pb_ajouter_categ)
destroy(this.pb_fermer)
destroy(this.tv_courriers)
destroy(this.gb_2)
destroy(this.lb_files)
destroy(this.lb_rep)
destroy(this.dw_favoris)
destroy(this.pb_favoris)
destroy(this.pb_ajouter_favoris)
destroy(this.pb_supprimer_favoris)
destroy(this.pb_annuler_favoris)
destroy(this.pb_enregistrer_favoris)
destroy(this.cbx_eclater)
destroy(this.tv_cabinet)
destroy(this.pb_ajouter_categ_cabinet)
destroy(this.cb_renommer_elem_cabinet)
destroy(this.cb_supprimer_elem_cabinet)
destroy(this.pb_copie_cabinet)
destroy(this.pb_copie_local)
destroy(this.pb_vider_copier)
destroy(this.tv_powerpoint)
destroy(this.rb_word)
destroy(this.rb_powerpoint)
destroy(this.pb_signature_numerique)
destroy(this.pb_aide)
destroy(this.dw_1)
destroy(this.pb_rafraichir)
destroy(this.pb_signature_en_ligne)
destroy(this.cb_dupliquer_favoris)
destroy(this.cb_convertir)
destroy(this.dw_param_publipostage)
destroy(this.gb_eclate)
destroy(this.gb_1)
destroy(this.gb_type_gestion)
destroy(this.uo_powerpoint)
destroy(this.uo_word)
end on

event open;call super::open;

// Recherche si l'utilisateur est autorisé ou non à modifier les modèls de courrier Word et signification du double clic
string v_maj

// v_double_clic est en instance car utiliser sur le double clic du tree view

select maj_word , double_clic_word 
into :v_maj , :v_double_clic
from utilisateurs where code = :utilisateur_code ;

if v_maj = 'O' then 
	maj_word_autorisee = true
else
	maj_word_autorisee = false
end if

// En réplication on n'autorise pas PowerPoint 
if UTILISATION_DISTANTE then
	rb_powerpoint.enabled = false 
end if

// Pour gérer l'un ou l'autre des molues de signature => 1 seule variable local pour gérer les droits

if SIGNATURE_NUMERIQUE or SIGNATURE_DENTALSIGN then
	b_signature_numerique_dentalsign = true
else
	b_signature_numerique_dentalsign = false
end if

m_menu = CREATE m_courriers_word 


// Chargement des options
If  profilestring(dir_ini+inifile_orthokis,"WORD","arbre_eclate","N") = 'O' then
	cbx_eclater.checked = true
else
	cbx_eclater.checked = false
end if

// Va nous servir à voir si les load de treeview sont OK ou pas

var_suite = true

type_gestion = "P"
// on charge l'arborescence du répertoire courrier courant avant de donner la main
load_tv_2011(tv_powerpoint, dir_courriers, true)

if var_suite then
	type_gestion = "W"
	// on charge l'arborescence du répertoire courrier courant avant de donner la main
	load_tv_2011(tv_courriers, dir_courriers, true)
	
	if var_suite then
		colore_tous_objets_window(this, couleur_fond_fenetre)
		
		// pour les courriers favoris du user ...
		dw_favoris.settransobject(sqlca)
		dw_favoris.retrieve(utilisateur_code)
		
		
		// utile pour la synchronisation des courriers
		v_dir_courriers_reseau =  profilestring(dir_ini + inifile_orthokis,"courriers","dir","")
		
		
		if not maj_word_autorisee then 
			pb_ajouter_categ.enabled	( false )
			pb_ajouter_courrier.enabled ( false ) 
			cb_supprimer_elem.enabled ( false ) 
			cb_renommer_elem.enabled ( false )
			pb_editer.enabled ( false )
			cb_param.enabled ( false )
		
		end if
		
		
		// Par défaut on travaill en Word
		type_gestion = "W"
	else
		close(this)
	end if
else
	close(this)
end if


end event

event resize;call super::resize;//tv_courriers.height = newheight - (y_pas *3)
//tv_courriers.width  = newwidth - gb_1.width - (x_pas *3)
//
//gb_1.x = tv_courriers.x + tv_courriers.width + x_pas
//pb_ajouter_categ.x =  tv_courriers.x + tv_courriers.width + (x_pas *3)
//pb_ajouter_courrier.x =  pb_ajouter_categ.x
//cb_renommer_elem.x =  pb_ajouter_categ.x
//cb_supprimer_elem.x =  pb_ajouter_categ.x
//
//gb_2.x = gb_1.x
//pb_editer.x =  pb_ajouter_categ.x
//pb_previ_imp.x =  pb_ajouter_categ.x
//pb_imprimer.x =  pb_ajouter_categ.x
//pb_email.x =  pb_ajouter_categ.x
//pb_previ_email.x =  pb_ajouter_categ.x
//
////pb_aide.x = pb_ajouter_categ.x
////pb_fermer.x = pb_aide.x + pb_aide.width + (x_pas *2)
////pb_fermer.x = pb_aide.x +  412
//pb_rafraichir.x =  pb_ajouter_categ.x
//cb_param.x =  pb_ajouter_categ.x


tv_courriers.height = newheight - (y_pas *3)
tv_courriers.width  = newwidth - gb_1.width - (x_pas *3)

tv_powerpoint.height = tv_courriers.height
tv_powerpoint.width  = tv_courriers.width

gb_1.x = newwidth - gb_1.width - 2 * x_pas
pb_ajouter_categ.x = gb_1.x+ (x_pas * 1.7 )
pb_ajouter_courrier.x =  pb_ajouter_categ.x
cb_renommer_elem.x =  pb_ajouter_categ.x
cb_supprimer_elem.x =  pb_ajouter_categ.x

gb_2.x = gb_1.x
pb_editer.x =  pb_ajouter_categ.x
pb_previ_imp.x =  pb_ajouter_categ.x
pb_imprimer.x =  pb_ajouter_categ.x
pb_signature_numerique.x = pb_ajouter_categ.x
pb_signature_en_ligne.x = pb_ajouter_categ.x
pb_email.x =  pb_ajouter_categ.x
pb_previ_email.x =  pb_ajouter_categ.x

gb_eclate.x = gb_1.x
cbx_eclater.x = gb_1.x + 50

gb_type_gestion.x = gb_1.x
rb_word.x = gb_type_gestion.x + 70
rb_powerpoint.x = gb_type_gestion.x + 375

//pb_aide.x = pb_ajouter_categ.x
//pb_fermer.x = pb_aide.x + pb_aide.width + (x_pas *2)
//pb_fermer.x = pb_aide.x +  412
cb_param.x =  pb_ajouter_categ.x
pb_favoris.x =  pb_ajouter_categ.x
cb_convertir.x =  pb_ajouter_categ.x
pb_fermer.x =  pb_ajouter_categ.x + (pb_ajouter_categ.width / 2) - (pb_fermer.width / 2)

pb_rafraichir.x =  pb_favoris.x + 297
pb_aide.x = pb_favoris.x + 315

// Prositionnement des trucs meme invisible ... 
dw_favoris.y = this.height - 1100
pb_ajouter_favoris.y = dw_favoris.y
pb_supprimer_favoris.y = pb_ajouter_favoris.y + 200
cb_dupliquer_favoris.y = pb_supprimer_favoris.y + 200
pb_annuler_favoris.y = cb_dupliquer_favoris.y + 200
pb_enregistrer_favoris.y = pb_annuler_favoris.y + 200



end event

event close;call super::close;SetCurrentDirectoryA( dir_ini )


// Sauvegarde des options
If  cbx_eclater.checked then
	Setprofilestring(dir_ini+inifile_orthokis,"WORD","arbre_eclate","O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"WORD","arbre_eclate","N")
end if

end event

event timer;call super::timer;


// servira à détecter les ouvertures des fenetres Word


integer retour_word_en_avant_plan

retour_word_en_avant_plan = uo_word.word_en_avant_plan(12)

nb_tentatives_autorisees = nb_tentatives_autorisees - 1

//on a trouvé la fenetre ou pas trouvé au bout de n tentatives
if retour_word_en_avant_plan > 0 or nb_tentatives_autorisees <= 0 then
	timer(0) // on stoppe le timer
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_courriers_word
end type

type gb_transferts from groupbox within w_courriers_word
string tag = "no resize"
boolean visible = false
integer x = 1509
integer y = 388
integer width = 864
integer height = 672
integer taborder = 30
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Transferts"
end type

type gb_cabinet from groupbox within w_courriers_word
string tag = "no resize"
boolean visible = false
integer x = 2098
integer y = 1024
integer width = 864
integer height = 672
integer taborder = 20
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Gestion des éléments CABINET"
end type

type pb_email from uo_picturebutton_780x120 within w_courriers_word
integer x = 3520
integer y = 892
integer height = 136
integer taborder = 90
string text = "Envoi Email Direct"
string tiptext = "Fusionne le document avec un patient et l~'envoie par email"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;if type_gestion = "W" then
	routine_word(Service_MajEtEmail, false)
	tv_courriers.SetFocus()
end if
end event

event rbuttondown;call super::rbuttondown;routine_word(Service_MajEtEmail, true)
tv_courriers.SetFocus()
end event

type pb_previ_email from uo_picturebutton_780x120 within w_courriers_word
integer x = 3520
integer y = 736
integer height = 136
integer taborder = 100
string text = "Aperçu puis Email"
string tiptext = "Fusionne le document avec un patient en vue de l~'envoi par email"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;if type_gestion = "W" then
	routine_word(Service_MajVisualiseEtEmail,false)
	tv_courriers.SetFocus()
end if
end event

event rbuttondown;call super::rbuttondown;routine_word(Service_MajVisualiseEtEmail,true)
tv_courriers.SetFocus()
end event

type pb_imprimer from uo_picturebutton_780x120 within w_courriers_word
integer x = 3520
integer y = 268
integer height = 136
integer taborder = 90
string text = "Impression Directe"
string tiptext = "Fusionne le document avec un patient et l~'imprime directement "
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;if type_gestion = "W" then 
	
	// Word
	routine_word(Service_MajEtImprime,false)
	tv_courriers.SetFocus()
else
	// Lancement direct du powerpoint
	
	
	// powerpoint
	string v_nom_fichier
	String v_dossier
	TreeViewItem		ltvi_Item
	
	if tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_Item) = 1 then
	
		// on a bien récup l'élément
		v_nom_fichier = get_chemin_fichier(ltvi_Item) + get_nom_fichier(ltvi_Item)	
		
		open(w_cherche)
		
		if var_suite then
			
			// On écrit le passage de paramètres à Powerpoint
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","CodDef", string(var_code))
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","DosDef", string(var_numero_dossier))
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","NomDef", var_nom)
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","Utilisateur", utilisateur_code)
			
			// Par sécurité ... quoiqu'on fasse dans Power Point .. on crée le dossier des phoos
			v_dossier = dir_photos + string(var_code)
		
			// si fichier photo du patient n'existe pas encore
			if not fxg_FileExists(v_dossier) then CreateDirectory(v_dossier)

			uo_powerpoint.routine_powerpoint(3, v_nom_fichier, var_code )
			
			
		end if
	end if

end if 
end event

event rbuttondown;call super::rbuttondown;if type_gestion = "W" then
	routine_word(Service_MajEtImprime,true)
	tv_courriers.SetFocus()
	
else
	
		
	
	// powerpoint
	string v_nom_fichier
	String v_dossier
	TreeViewItem		ltvi_Item
	
	if tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_Item) = 1 then
	
		// on a bien récup l'élément
		v_nom_fichier = get_chemin_fichier(ltvi_Item) + get_nom_fichier(ltvi_Item)	
		
		if var_code <> 0 and not	 isnull(var_code) then
			// On écrit le passage de paramètres à Powerpoint
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","CodDef", string(var_code))
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","DosDef", string(var_numero_dossier))
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","NomDef", var_nom)
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","Utilisateur", utilisateur_code)
			
			// Par sécurité ... quoiqu'on fasse dans Power Point .. on crée le dossier des phoos
			v_dossier = dir_photos + string(var_code)
		
			// si fichier photo du patient n'existe pas encore
			if not fxg_FileExists(v_dossier) then CreateDirectory(v_dossier)

			uo_powerpoint.routine_powerpoint(3,v_nom_fichier, var_code )
			
			
		end if
	end if

end if 
end event

type pb_previ_imp from uo_picturebutton_780x120 within w_courriers_word
integer x = 3520
integer y = 112
integer height = 136
integer taborder = 80
string text = "Aperçu Impression"
string tiptext = "Fusionne le document avec un patient puis le présente à l~'écran dans Word"
string iconname = "ACTIONS_word_apercu.png"
end type

event clicked;call super::clicked;if type_gestion = "W" then 
	// Word
	routine_word(Service_MajEtVisualise,false)
	tv_courriers.SetFocus()
	
	// Uniquement pour les APERCU AVANT IMPRESSION EN MODE ENREGISTREMENT AUTOMATIQUE
	String memo_automatique 
	memo_automatique = profilestring(dir_ini+inifile_orthokis,"WORD","memo_automatique","O")
	if memo_automatique = "O" then
		// On met word en avant plan ...
		//uo_word.mettre_word_en_avant_plan(6)	
		uo_word.word_en_avant_plan_2016()	
	end if
	
else
	// powerpoint
	string v_nom_fichier
	String v_dossier
	TreeViewItem		ltvi_Item
	
	if tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_Item) = 1 then
	
		// on a bien récup l'élément
		v_nom_fichier = get_chemin_fichier(ltvi_Item) + get_nom_fichier(ltvi_Item)	
		
		open(w_cherche)
		
		if var_suite then
			
			// On écrit le passage de paramètres à Powerpoint
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","CodDef", string(var_code))
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","DosDef", string(var_numero_dossier))
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","NomDef", var_nom)
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","Utilisateur", utilisateur_code)
			
			// Par sécurité ... quoiqu'on fasse dans Power Point .. on crée le dossier des phoos
			v_dossier = dir_photos + string(var_code)
		
			// si fichier photo du patient n'existe pas encore
			if not fxg_FileExists(v_dossier) then CreateDirectory(v_dossier)

			uo_powerpoint.routine_powerpoint(2,v_nom_fichier, var_code )
			
			
		end if

	end if

	
	
	
	
end if


end event

event rbuttondown;call super::rbuttondown;
if type_gestion = "W" then 
	
	// Word
	routine_word(Service_MajEtVisualise,true)
	tv_courriers.SetFocus()

	// Uniquement pour les APERCU AVANT IMPRESSION EN MODE ENREGISTREMENT AUTOMATIQUE
	String memo_automatique 
	memo_automatique = profilestring(dir_ini+inifile_orthokis,"WORD","memo_automatique","O")
	if memo_automatique = "O" then
		// On met word en avant plan ...
		//uo_word.mettre_word_en_avant_plan(6)	
		uo_word.word_en_avant_plan_2016()	
	end if
	
else
	// POwerpoint
	
	if var_code <> 0 and not isnull(var_code) then
		string v_nom_fichier
		String v_dossier
		TreeViewItem		ltvi_Item
		
		if tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_Item) = 1 then
		
			// on a bien récup l'élément
			v_nom_fichier = get_chemin_fichier(ltvi_Item) + get_nom_fichier(ltvi_Item)	
			
			// On écrit le passage de paramètres à Powerpoint
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","CodDef", string(var_code))
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","DosDef", string(var_numero_dossier))
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","NomDef", var_nom)
			Setprofilestring(dir_ini+inifile_orthokis,"Macros","Utilisateur", utilisateur_code)
			
			// Par sécurité ... quoiqu'on fasse dans Power Point .. on crée le dossier des phoos
			v_dossier = dir_photos + string(var_code)
		
			// si fichier photo du patient n'existe pas encore
			if not fxg_FileExists(v_dossier) then CreateDirectory(v_dossier)

			uo_powerpoint.routine_powerpoint(2,v_nom_fichier, var_code )
			
			
			
		end if
	end if
end if
end event

type cb_param from uo_picturebutton_780x120 within w_courriers_word
integer x = 3520
integer y = 1100
integer width = 777
integer height = 136
integer taborder = 80
string text = "Param. Publipostage"
string tiptext = "Paramétrage des courriers utilisés par les fonctions de publipostage"
string iconname = "preferences_16.png"
end type

event clicked;call super::clicked;open(w_param_courriers_word)
tv_courriers.SetFocus()
end event

type pb_editer from uo_picturebutton_780x120 within w_courriers_word
string tag = "Invisible mais utile pour le menu et enabled ou pas"
boolean visible = false
integer x = 2446
integer y = 68
integer height = 136
integer taborder = 70
string text = "Modifier Modèle"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;
if type_gestion = "W" then 
	// Word
	routine_word(Service_EditerCourrier,false)

	// attente de l'ouverture du courrier Word dans le Timer !!
	nb_tentatives_autorisees = 4
	timer(1)
	
else
	// Powerpoint
	string v_nom_fichier
	TreeViewItem		ltvi_Item

	if tv_powerpoint.GetItem(tv_powerpoint.FindItem(CurrentTreeItem!, 0), ltvi_Item) = 1 then
		
		// on a bien récup l'élément
		v_nom_fichier = get_chemin_fichier(ltvi_Item) + get_nom_fichier(ltvi_Item)	
		uo_powerpoint.routine_powerpoint(1,v_nom_fichier, var_code  )
	
		// La fenêtre porte le nom du document
		uo_powerpoint.powerpoint_en_avant_plan(v_nom_fichier)
			
	end if
	
end if

end event

type cb_supprimer_elem from uo_picturebutton_780x120 within w_courriers_word
string tag = "Invisible mais utile pour le menu et enabled ou pas"
boolean visible = false
integer x = 2464
integer y = 676
integer height = 136
integer taborder = 60
string text = "Supprimer l~'Elément"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;
del_element(true)

if type_gestion = "W" then
	tv_courriers.SetFocus()
else
	tv_powerpoint.SetFocus()
end if
end event

type cb_renommer_elem from uo_picturebutton_780x120 within w_courriers_word
string tag = "Invisible mais utile pour le menu et enabled ou pas"
boolean visible = false
integer x = 2473
integer y = 544
integer height = 136
integer taborder = 50
string text = "Renommer l~'Elément"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;rename_element(true)
tv_courriers.SetFocus()
end event

type pb_ajouter_courrier from uo_picturebutton_780x120 within w_courriers_word
string tag = "Invisible mais utile pour le menu et enabled ou pas"
boolean visible = false
integer x = 2491
integer y = 412
integer height = 136
integer taborder = 60
string text = "Ajouter un Elément"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;add_courrier(true)
tv_courriers.SetFocus()
end event

type pb_ajouter_categ from uo_picturebutton_780x120 within w_courriers_word
string tag = "Invisible mais utile pour le menu et enabled ou pas"
boolean visible = false
integer x = 2473
integer y = 280
integer height = 136
integer taborder = 90
string text = "Ajouter un Dossier"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;add_categ(true)
tv_courriers.SetFocus()
end event

type pb_fermer from uo_picturebutton_390x120_fermer within w_courriers_word
integer x = 3707
integer y = 1692
integer height = 136
integer taborder = 80
fontcharset fontcharset = ansi!
end type

event clicked;fermer_fenetre(parent)
end event

type tv_courriers from treeview within w_courriers_word
integer x = 9
integer width = 3383
integer height = 2336
integer taborder = 10
string dragicon = "OleGenReg!"
boolean dragauto = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
boolean disabledragdrop = false
string picturename[] = {"Ico_courriers_word.bmp","ACTIONS_word_categorie.png","ACTIONS_word_rep_courriers.png","Ico_courriers_word_rouge.bmp","Ico_courriers_word_vert.bmp","Ico_courriers_word_jaune.bmp","Ico_courriers_word_bleu.bmp"}
integer picturewidth = 16
integer pictureheight = 16
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event begindrag;TreeViewItem		ltvi_Source


if this.GetItem(handle, ltvi_Source) = -1 then
	// si il y a un pb lors de la récup de l'élément source
	This.Drag(Cancel!)
	return
end if

if une_categorie(ltvi_Source) then 
	// c une catégorie et on stop tout !!
	This.Drag(Cancel!)
	return
end if

if check_element(true) = -1 then
	// l'élément sélectionner n'est plus présent ds le rep
	// il a sans doute était déplacé par qqn d'autre sur un autre poste
	This.Drag(Cancel!)
	return
end if

// on sauvegarde ds une var d'instance le chemin complet du fichier source
ancien_chemin_fichier = get_chemin_fichier(ltvi_Source)
nom_fichier 			 = get_nom_fichier(ltvi_Source)
if not FileExists(ancien_chemin_fichier + win_delimiter + nom_fichier) then
	nom_fichier 	= get_nom_fichier_2007(ltvi_Source)
end if

end event

event dragdrop;Integer				li_Pending
Long					ll_NewItem
TreeViewItem		ltvi_Target	//, ltvi_Source, ltvi_Parent, ltvi_New


If this.GetItem(handle, ltvi_Target) = -1 Then
	// si il y a un pb lors de la récup de l'élément cible
	This.Drag(Cancel!)
	return
end if

if get_chemin_fichier(ltvi_Target) = ancien_chemin_fichier then
	// si le chemin de destination du fichier est le même
	// que le chemin source
	// le drag and drop est inutile
	This.Drag(Cancel!)
	return
end if

// vérification auprés de l'utilisateur
If MessageBox("Changement de Dossier", &
	"Etes-vous sur de vouloir déplacer le fichier '" + nom_fichier + " ~nde '" + ancien_chemin_fichier + "'~nà  '" + string(ltvi_Target.data) + "' ?", Question!, YesNo!) = 2 Then
		// si on souhaite pas continuer
		This.Drag(Cancel!)
else
	// on souhaite continuer
	// on change de rep le fichier
	if MoveFileA(ancien_chemin_fichier + nom_fichier, string(ltvi_Target.data) + nom_fichier) = 0 then
		// un pb est survenu -> impossible de changer de catégorie
		// on stop le processus de drag & drop
			This.Drag(Cancel!)
			messagebox("ATTENTION", "Le courrier n'a pas pu être déplacé, ~nil est possible que le courrier soit utilisé par un autre ~nutilisateur ou qu'un courrier de même nom ~nexiste déjà dans le dossier cible.",Exclamation!)
	else
		// Modification en base de données !!!
		double v_id_deplace
		string nouveau_dossier
		
		v_id_deplace = get_id_document  (ancien_chemin_fichier + nom_fichier)
		nouveau_dossier = gfx_extraire_path_fichier_en_relatif(string(ltvi_Target.data) + nom_fichier, dir_courriers)
		
		// modification du dossier .... 
		update courriers_word set dossier = :nouveau_dossier where id = :v_id_deplace ;
		commit ;
		
	end if	
end if

// on rafraichi le treeview (que tout ce soit bien passé ou pas)
load_tv_2011(tv_courriers, dir_courriers, true)
this.setfocus()	// on reste sur le treeview
end event

event dragwithin;TreeViewItem		ltvi_Over


If this.GetItem(handle, ltvi_Over) = -1 Then
	// un pb pour récup l'élément
	this.SetDropHighlight(0)
	Return
else
	// tout va bien
	if get_chemin_fichier(ltvi_Over) = ancien_chemin_fichier then
		// l'élément qu'on "survole" est de la même catégorie
		
		// on indique qu'on ne peut donc pas y déplacer l'élément sélectionné
		// en ne mettant pas en surbrillance l'élément "survolé"
		this.SetDropHighlight(0)
	else
		// l'élément "survolé" est d'une catégorie différente
		this.SetDropHighlight(handle)
	end if
End If

end event

event selectionchanged;//Messagebox("handle changed", string(newhandle))

maj_focus(this, newhandle)

end event

event doubleclicked;TreeViewItem		ltvi_Source
long itemHandle
// Récupération du Handle d

itemHandle = this.GetItemAtPointer ()

if itemHandle = -1 then
	// si il y a un pb lors de la récup de l'élément source
	This.Drag(Cancel!)
	return
end if

if this.GetItem(itemHandle, ltvi_Source) = -1 then
	// si il y a un pb lors de la récup de l'élément source
	This.Drag(Cancel!)
	return
end if

if une_categorie(ltvi_Source) then 
	// c une catégorie et on stop tout !!
	This.Drag(Cancel!)
	return
end if


if maj_word_autorisee then
	
	if v_double_clic = "A" then 
		// Aperçu impression
		pb_previ_imp.triggerevent(clicked!)
	else
		// Ouverture du courrier en modification
		pb_editer.triggerevent(clicked!)
	end if
end if
end event

event rightclicked;
if handle > 0 then 
	maj_focus(this, handle)
	
	// On enabled ou pas les item en fonction des boutons !!!
	
	m_menu.m_ajouterundossier.enabled = pb_ajouter_categ.enabled
	m_menu.m_ajouterundocument.enabled = pb_ajouter_courrier.enabled
	m_menu.m_modifier_element.enabled = cb_renommer_elem.enabled
	m_menu.m_supprimer_element.enabled = cb_supprimer_elem.enabled
	m_menu.m_supprimer_element.enabled = cb_supprimer_elem.enabled
	
	// On ne peut pas dupliquer un dossier
	m_menu.m_dupliquerlélément.enabled	= not m_menu.m_ajouterundossier.enabled
	
	m_menu.m_modifier_modele.enabled = pb_editer.enabled
	
	m_menu.popmenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY())

end if
end event

type gb_2 from groupbox within w_courriers_word
string tag = "no resize"
integer x = 3474
integer y = 28
integer width = 864
integer height = 1048
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Document sélectionné"
end type

type lb_files from listbox within w_courriers_word
boolean visible = false
integer x = 1970
integer y = 1676
integer width = 411
integer height = 120
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

type lb_rep from listbox within w_courriers_word
boolean visible = false
integer x = 1509
integer y = 1464
integer width = 411
integer height = 120
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

type dw_favoris from datawindow within w_courriers_word
string tag = "brush"
boolean visible = false
integer x = 14
integer y = 1312
integer width = 2898
integer height = 936
integer taborder = 110
boolean bringtotop = true
string title = "none"
string dataobject = "dw_courriers_word_favoris"
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event dberror;db_erreur(dw_favoris,sqldbcode,sqlerrtext)
return 1
end event

type pb_favoris from uo_picturebutton_780x120 within w_courriers_word
integer x = 3520
integer y = 1244
integer width = 777
integer height = 136
integer taborder = 90
boolean bringtotop = true
string text = "Favoris"
string tiptext = "Paramétrage des couriers favoris de l~'utilisateur connecté"
string iconname = "ACTIONS_word_favoris.png"
end type

event clicked;call super::clicked;


// Affiche ou masque la gestion des favoris

if dw_favoris.visible then
	// Ils etaient visibles => On masque
	dw_favoris.visible = false
	pb_ajouter_favoris.visible = false
	pb_supprimer_favoris.visible = false
	cb_dupliquer_favoris.visible = false
	pb_annuler_favoris.visible = false
	pb_enregistrer_favoris.visible = false
	tv_courriers.height = parent.height - (y_pas *3)
else
	// Pas visible => on les met visible
	dw_favoris.visible = true
	dw_favoris.bringtotop = true
	pb_ajouter_favoris.visible = true
	pb_supprimer_favoris.visible = true
	pb_annuler_favoris.visible = true
	cb_dupliquer_favoris.visible = true
	pb_enregistrer_favoris.visible = true
	tv_courriers.height = dw_favoris.y - tv_courriers.y - 30
end if
end event

type pb_ajouter_favoris from uo_picturebutton_250x120 within w_courriers_word
boolean visible = false
integer x = 2930
integer y = 1388
integer width = 503
integer height = 128
integer taborder = 90
boolean bringtotop = true
string text = "Ajouter"
string tiptext = "Ajoute un courrier Word favori pour l~'utilisateur"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;
// Ajout du favori ...

TreeViewItem ltvi_Item
string v_nom_fichier, v_chemin_fichier
long lig
double id_courrier
integer v_id_categorie


if tv_courriers.GetItem(tv_courriers.FindItem(CurrentTreeItem!, 0), ltvi_Item) = 1 then
	
	// on a bien récup l'élément
	v_nom_fichier = get_nom_fichier(ltvi_Item)
	v_chemin_fichier = get_chemin_fichier(ltvi_Item)
	
	if not FileExists(v_chemin_fichier+v_nom_fichier) then
		v_nom_fichier = get_nom_fichier_2007(ltvi_Item)
	end if

	// Recup de l'ID du courrier 
	id_courrier = get_id_document (v_chemin_fichier+v_nom_fichier) 
	select isnull(id_categorie, 4) into :v_id_categorie 
	from "courriers_word" where id =  :id_courrier ; 
	
	if id_courrier > 0 then
		dw_favoris.insertrow(99999)
		lig = dw_favoris.rowcount()
		dw_favoris.setitem(lig,"user", utilisateur_code)
		dw_favoris.setitem(lig,"courriers_word_favoris_id_courrier", id_courrier)
		dw_favoris.setitem(lig,"courriers_word_favoris_categorie", v_id_categorie)
		dw_favoris.setitem(lig,"courriers_word_nom_document", v_nom_fichier)
	else
		Messagebox("ATTENTION","Impossible de récupérer l'identifiant interne de ce courrier.~n~nOpération annulée.")
	end if
end if

end event

type pb_supprimer_favoris from uo_picturebutton_250x120 within w_courriers_word
boolean visible = false
integer x = 2930
integer y = 1564
integer width = 503
integer height = 128
integer taborder = 100
boolean bringtotop = true
string text = "Supprimer"
string tiptext = "Supprime un courrier Word favori pour l~'utilisateur"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;

if dw_favoris.rowcount() > 0 then
	dw_favoris.deleterow(dw_favoris.getrow())
end if
end event

type pb_annuler_favoris from uo_picturebutton_250x120 within w_courriers_word
boolean visible = false
integer x = 2930
integer y = 1916
integer width = 503
integer height = 128
integer taborder = 110
boolean bringtotop = true
string text = "Annuler"
string tiptext = "Annule les modifications non enregostrées siur les favoris"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;

dw_favoris.retrieve(utilisateur_code)

end event

type pb_enregistrer_favoris from uo_picturebutton_250x120 within w_courriers_word
boolean visible = false
integer x = 2930
integer y = 2092
integer width = 503
integer height = 128
integer taborder = 120
boolean bringtotop = true
string text = "Enregistrer"
string tiptext = "Enregiste la configuration des favoris"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

dw_favoris.accepttext()


if dw_favoris.update() = 1 then
	commit ;
else
	rollback ;
end if

end event

type cbx_eclater from checkbox within w_courriers_word
integer x = 3515
integer y = 2076
integer width = 777
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Eclater l~'arborescence"
end type

event clicked;

if this.checked then
	tv_courriers.ExpandAll(handle_principal)
	tv_powerpoint.ExpandAll(handle_principal)
else
	load_tv_2011(tv_courriers, dir_courriers, true)
	load_tv_2011(tv_powerpoint, dir_courriers, true)
end if

end event

type tv_cabinet from treeview within w_courriers_word
boolean visible = false
integer x = 96
integer y = 696
integer width = 411
integer height = 448
integer taborder = 20
string dragicon = "OleGenReg!"
boolean dragauto = true
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
boolean disabledragdrop = false
string picturename[] = {"Ico_courriers_word.bmp","ACTIONS_word_categorie.png","ACTIONS_word_rep_courriers.png"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event selectionchanged;TreeViewItem		ltvi_Source


if this.GetItem(newhandle, ltvi_Source) = -1 then
	// si il y a un pb lors de la récup de l'élément sélectionné
	msg_erreur(1)
	return
end if

if le_rep_courrier(ltvi_Source) then
	// si c le rep courrier qui est sélectionné
	cb_supprimer_elem_cabinet.enabled ( false )
	cb_renommer_elem_cabinet.enabled ( false )
	pb_copie_local.enabled ( false )
	
	// Categorie
	pb_ajouter_categ_cabinet.enabled = true
	chemin_categorie_selectionnee_cabinet = ltvi_Source.data
	
elseif une_categorie(ltvi_Source) then 
	// si c une catégorie
	cb_supprimer_elem_cabinet.enabled ( true )
	cb_renommer_elem_cabinet.enabled ( true )
	pb_copie_local.enabled ( false )

	// Categorie
	pb_ajouter_categ_cabinet.enabled ( true )
	chemin_categorie_selectionnee_cabinet = ltvi_Source.data
	

else
	// c un fichier
	cb_supprimer_elem_cabinet.enabled ( true )
	cb_renommer_elem_cabinet.enabled ( true )
	pb_copie_local.enabled ( true )
	
	// Categorie
	pb_ajouter_categ_cabinet.enabled ( false )
	chemin_categorie_selectionnee_cabinet = ''
	
end if
end event

event selectionchanging;long		root_item, parent_old_item, parent_new_item


root_item = finditem( RootTreeItem!, 0 )
parent_old_item = finditem( ParentTreeItem!, oldhandle )
parent_new_item = finditem( ParentTreeItem!, newhandle )

if (oldhandle <> newhandle) then
	SetRedraw( false )
	if oldhandle <> root_item then
		if parent_old_item = root_item then
			if parent_new_item <> oldhandle then
				CollapseItem( oldhandle )
			end if
		else
			if parent_old_item <> newhandle AND parent_old_item <> parent_new_item then
				CollapseItem( parent_old_item )
			end if
		end if
	end if
	
	if newhandle <> root_item then
		if parent_new_item = root_item then
			ExpandItem( newhandle )
		else
			if parent_new_item <> oldhandle AND parent_new_item <> parent_old_item then
				ExpandItem( newhandle )
			end if
		end if
	end if
	SetRedraw( true )
end if

end event

type pb_ajouter_categ_cabinet from uo_picturebutton_780x120 within w_courriers_word
boolean visible = false
integer x = 2144
integer y = 1096
integer taborder = 100
boolean bringtotop = true
string text = "Ajouter un Dossier"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;add_categ(false)
tv_courriers.SetFocus()
end event

type cb_renommer_elem_cabinet from uo_picturebutton_780x120 within w_courriers_word
boolean visible = false
integer x = 2158
integer y = 1256
integer taborder = 60
boolean bringtotop = true
string text = "Renommer l~'élément"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;rename_element(false)
tv_cabinet.SetFocus()
end event

type cb_supprimer_elem_cabinet from uo_picturebutton_780x120 within w_courriers_word
boolean visible = false
integer x = 2139
integer y = 1428
integer taborder = 70
boolean bringtotop = true
string text = "Supprimer l~'Elément"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;del_element(false)
tv_cabinet.SetFocus()
end event

type pb_copie_cabinet from uo_picturebutton_780x120 within w_courriers_word
boolean visible = false
integer x = 1559
integer y = 472
integer taborder = 70
boolean bringtotop = true
string text = "Copie -> Cabinet"
end type

event clicked;call super::clicked;

TreeViewItem	ltvi_a_copier


// Copie d'un document Word du portable vers le cabinet 

tv_courriers.GetItem(tv_courriers.FindItem(CurrentTreeItem!, 0), ltvi_a_copier)


boolean ok_copy = true

string nom_fichier_depart
string fichier_depart_complet, fichier_arrivee_complet
string dossier_destination 

nom_fichier_depart = ltvi_a_copier.label
fichier_depart_complet = ltvi_a_copier.data			// peut être .doc ou .docx

dossier_destination = chemin_categorie_selectionnee_cabinet
fichier_arrivee_complet = chemin_categorie_selectionnee_cabinet + gfx_extraire_nom_fichier(fichier_depart_complet)


if Messagebox("ATTENTION",'Vous allez copier le document "'+nom_fichier_depart+'" dans le dossier "'+dossier_destination+"~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then

	if FileExists(fichier_arrivee_complet) then
		if Messagebox("ATTENTION",'Le document "'+fichier_depart_complet+'" existe déjà sur le serveur.~n~nSouhaitez-vous le remplacer ?', Question!, Yesno!, 2) = 2 then
			ok_copy = false
		end if
	end if
	
	if ok_copy then
		if FileCopy(fichier_depart_complet, fichier_arrivee_complet, true) = 1 then
			// dans tout les cas on rafraichie le treeview
			load_tv_2011(tv_cabinet, v_dir_courriers_reseau, false)
		else
			Messagebox("ERREUR","Une erreur est survenue dans la copie du fichier.")
		end if



	end if

end if

 
 






end event

type pb_copie_local from uo_picturebutton_780x120 within w_courriers_word
boolean visible = false
integer x = 1550
integer y = 640
integer taborder = 80
boolean bringtotop = true
string text = "Local <- Copie"
end type

event clicked;call super::clicked;

TreeViewItem	ltvi_a_copier


// Copie d'un document Word du Cabinet vers le Portable

tv_cabinet.GetItem(tv_cabinet.FindItem(CurrentTreeItem!, 0), ltvi_a_copier)


boolean ok_copy = true

string nom_fichier_depart
string fichier_depart_complet, fichier_arrivee_complet
string dossier_destination 

nom_fichier_depart = ltvi_a_copier.label
fichier_depart_complet = ltvi_a_copier.data			// peut être .doc ou .docx

dossier_destination = chemin_categorie_selectionnee
fichier_arrivee_complet = chemin_categorie_selectionnee + gfx_extraire_nom_fichier(fichier_depart_complet)


if Messagebox("ATTENTION",'Vous allez copier le document "'+nom_fichier_depart+'" dans le dossier "'+dossier_destination+"~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then

	if FileExists(fichier_arrivee_complet) then
		if Messagebox("ATTENTION",'Le document "'+fichier_depart_complet+'" existe déjà sur le portable.~n~nSouhaitez-vous le remplacer ?', Question!, Yesno!, 2) = 2 then
			ok_copy = false
		end if
	end if
	
	if ok_copy then
		if FileCopy(fichier_depart_complet, fichier_arrivee_complet, true) = 1 then
			// dans tout les cas on rafraichie le treeview
			load_tv_2011(tv_courriers, dir_courriers, true)
		else
			Messagebox("ERREUR","Une erreur est survenue dans la copie du fichier.")
		end if



	end if

end if

 
 






end event

type pb_vider_copier from uo_picturebutton_780x120 within w_courriers_word
boolean visible = false
integer x = 1559
integer y = 824
integer taborder = 90
boolean bringtotop = true
string text = "Vider <- Tout Copier"
end type

event clicked;call super::clicked;
If messagebox("ATTENTION !","Vous allez remplacer la TOTALITE du contenu de votre dossier COURRIERS du PORTABLE par le contenu du dossier COURRIERS du CABINET.~n~nCette commande est absolument IRREMEDIABLE.~n~nConfirmez-vous ?",Question!, Yesno!, 2) = 1 then

	// En utilisant soit ROBOCOPY soit XCOPY
	
	// on met un flag dans le .INI pour pouvoir changer cela le cas échéant
	// R pour Robocopy
	// X pour Xcopy
	// On peut le modifier avec le clic droit sur ce bouton
	
	string quelle_commande
	
	string v_commande 
	string v_rep_source, v_rep_dest
	
	quelle_commande = ProfileString(dir_ini + inifile_orthokis, "replication","commande_courrier","R")
	
	if quelle_commande = "R" then 
		
		// La commande ROBOCOPY pend en argument des noms de répertoires sans les \ finaux
		v_rep_source = left(v_dir_courriers_reseau, len(v_dir_courriers_reseau) - 1 )
		v_rep_dest = left(dir_courriers, len(dir_courriers) - 1 )
		
		v_commande = 'robocopy "'+v_rep_source+'" "'+v_rep_dest+'" /MIR' 
		runwait(v_commande, 1)
//		run (v_commande)
	else
		
		// avec xcopy ... faut d'abord purger !!
		// => On supprimer carrément le dossier local, puis on le recrée, puis on xcopise !!!
		
		v_commande = 'rmdir /s /q "'+dir_courriers+'"'
		runwait(v_commande, 1)
//		run (v_commande)
		
		CreateDirectory(dir_courriers)
		
		v_commande = 'xcopy "'+v_dir_courriers_reseau+'*.*"  "'+ dir_courriers+'" /d /e /s /c /h /y /r'
		runwait(v_commande, 1)
//		run (v_commande)
	
		
	end if

	load_tv_2011(tv_courriers, dir_courriers, true)
end if


end event

event rbuttondown;call super::rbuttondown;

// pour modfier la commande utilisée dans la purge
// Robocopy ou Xcopy

string v_commande_actuelle

v_commande_actuelle = ProfileString(dir_ini + inifile_orthokis, "replication","commande_courrier","R")

if v_commande_actuelle = "R" then
	If messagebox("ATTENTION","La commande actuelle de synchronisation des dossiers courriers est ROBOCOPY. Voulez-vous utiliser la commande XCOPY ?",Question!, Yesno!, 2) = 1 then
		SetProfileString(dir_ini + inifile_orthokis, "replication","commande_courrier","X")
	end if
else
	If messagebox("ATTENTION","La commande actuelle de synchronisation des dossiers courriers est XCOPY. Voulez-vous utiliser la commande ROBOCOPY ?",Question!, Yesno!, 2) = 1 then
		SetProfileString(dir_ini + inifile_orthokis, "replication","commande_courrier","R")
	end if
end if
end event

type tv_powerpoint from treeview within w_courriers_word
boolean visible = false
integer x = 14
integer y = 12
integer width = 1737
integer height = 2336
integer taborder = 20
string dragicon = "OleGenReg!"
boolean dragauto = true
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
boolean disabledragdrop = false
string picturename[] = {"Ico_pres_powerpoint.bmp","ACTIONS_word_categorie.png","ACTIONS_word_rep_courriers.png","Ico_pres_powerpoint_rouge.bmp","Ico_pres_powerpoint_vert.bmp","Ico_pres_powerpoint_jaune.bmp","Ico_pres_powerpoint_bleu.bmp"}
integer picturewidth = 16
integer pictureheight = 16
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event begindrag;TreeViewItem		ltvi_Source


if this.GetItem(handle, ltvi_Source) = -1 then
	// si il y a un pb lors de la récup de l'élément source
	This.Drag(Cancel!)
	return
end if

if une_categorie(ltvi_Source) then 
	// c une catégorie et on stop tout !!
	This.Drag(Cancel!)
	return
end if

if check_element(true) = -1 then
	// l'élément sélectionner n'est plus présent ds le rep
	// il a sans doute était déplacé par qqn d'autre sur un autre poste
	This.Drag(Cancel!)
	return
end if

// on sauvegarde ds une var d'instance le chemin complet du fichier source
ancien_chemin_fichier = get_chemin_fichier(ltvi_Source)
nom_fichier 			 = get_nom_fichier(ltvi_Source)

// pour savoir si offiche 2007 ou avant
if not FileExists(ancien_chemin_fichier + win_delimiter + nom_fichier) then
	nom_fichier 	= get_nom_fichier_2007(ltvi_Source)
end if

end event

event doubleclicked;TreeViewItem		ltvi_Source
long itemHandle
// Récupération du Handle d

itemHandle = this.GetItemAtPointer ()

if itemHandle = -1 then
	// si il y a un pb lors de la récup de l'élément source
	This.Drag(Cancel!)
	return
end if

if this.GetItem(itemHandle, ltvi_Source) = -1 then
	// si il y a un pb lors de la récup de l'élément source
	This.Drag(Cancel!)
	return
end if

if une_categorie(ltvi_Source) then 
	// c une catégorie et on stop tout !!
	This.Drag(Cancel!)
	return
end if


if maj_word_autorisee then
	// Ouverture du courrier en modification
	pb_editer.triggerevent(clicked!)
end if
end event

event dragdrop;Integer				li_Pending
Long					ll_NewItem
TreeViewItem		ltvi_Target	//, ltvi_Source, ltvi_Parent, ltvi_New



If this.GetItem(handle, ltvi_Target) = -1 Then
	// si il y a un pb lors de la récup de l'élément cible
	This.Drag(Cancel!)
	return
end if

if get_chemin_fichier(ltvi_Target) = ancien_chemin_fichier then
	// si le chemin de destination du fichier est le même
	// que le chemin source
	// le drag and drop est inutile
	This.Drag(Cancel!)
	return
end if

// vérification auprés de l'utilisateur
If MessageBox("Changement de Dossier", &
	"Etes-vous sur de vouloir déplacer le fichier '" + nom_fichier + " ~nde '" + ancien_chemin_fichier + "'~nà  '" + string(ltvi_Target.data) + "' ?", Question!, YesNo!) = 2 Then
		// si on ne souhaite pas continuer
		This.Drag(Cancel!)
else
	// on souhaite continuer
	// on change de rep le fichier
	if MoveFileA(ancien_chemin_fichier + nom_fichier, string(ltvi_Target.data) + nom_fichier) = 0 then
		// un pb est survenu -> impossible de changer de catégorie
		// on stop le processus de drag & drop
			This.Drag(Cancel!)
			messagebox("ATTENTION", "Le document n'a pas pu être déplacé, ~nil est possible que le document soit utilisé par un autre ~nutilisateur ou qu'un document de même nom ~nexiste déjà dans le dossier cible.",Exclamation!)
	end if	
end if

// on rafraichi le treeview (que tout ce soit bien passé ou pas)
load_tv_2011(tv_powerpoint, dir_courriers, true)
this.setfocus()	// on reste sur le treeview
end event

event dragwithin;TreeViewItem		ltvi_Over


If this.GetItem(handle, ltvi_Over) = -1 Then
	// un pb pour récup l'élément
	this.SetDropHighlight(0)
	Return
else
	// tout va bien
	if get_chemin_fichier(ltvi_Over) = ancien_chemin_fichier then
		// l'élément qu'on "survole" est de la même catégorie
		
		// on indique qu'on ne peut donc pas y déplacer l'élément sélectionné
		// en ne mettant pas en surbrillance l'élément "survolé"
		this.SetDropHighlight(0)
	else
		// l'élément "survolé" est d'une catégorie différente
		this.SetDropHighlight(handle)
	end if
End If

end event

event selectionchanged;

maj_focus(this, newhandle)

end event

event rightclicked;maj_focus(this, handle)

// On enabled ou pas les item en fonction des boutons !!!

m_menu.m_ajouterundossier.enabled = pb_ajouter_categ.enabled
m_menu.m_ajouterundocument.enabled = pb_ajouter_courrier.enabled
m_menu.m_modifier_element.enabled = cb_renommer_elem.enabled
m_menu.m_supprimer_element.enabled = cb_supprimer_elem.enabled

m_menu.m_modifier_modele.enabled = pb_editer.enabled

m_menu.popmenu(w_mdi_2020.PointerX(), w_mdi_2020.PointerY())

end event

type rb_word from radiobutton within w_courriers_word
integer x = 3543
integer y = 1924
integer width = 297
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Word"
boolean checked = true
end type

event clicked;


if this.checked then
	word_ou_powerpoint("W")
else
	word_ou_powerpoint("P")
end if
end event

type rb_powerpoint from radiobutton within w_courriers_word
integer x = 3840
integer y = 1924
integer width = 466
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
string text = "Powerpoint"
end type

event clicked;

if this.checked then
	word_ou_powerpoint("P")
	cb_convertir.visible = false
else
	word_ou_powerpoint("W")
	cb_convertir.visible = true
end if
end event

type pb_signature_numerique from uo_picturebutton_780x120 within w_courriers_word
integer x = 3520
integer y = 424
integer height = 136
integer taborder = 100
boolean bringtotop = true
string text = "Signature Numérique"
string tiptext = "Fusionne le document avec un patient puis permet la signature sur tablette dédiée"
string iconname = "ACTIONS_word_signature_locale.png"
end type

event clicked;call super::clicked;if type_gestion = "W" then
	If SIGNATURE_NUMERIQUE then
		routine_word(Service_MajEtSigne,false)
		tv_courriers.SetFocus()
	else
		if SIGNATURE_DENTALSIGN then
			signature_en_ligne(false, false, false, "", "")
		end if
	end if
end if
end event

event rbuttondown;call super::rbuttondown;if type_gestion = "W" then
	routine_word(Service_MajEtSigne,true)
	tv_courriers.SetFocus()
end if
end event

type pb_aide from uo_bouton_aide within w_courriers_word
string tag = "Courriers Word"
integer x = 3840
integer y = 2196
integer taborder = 90
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type dw_1 from datawindow within w_courriers_word
string tag = "UNIQUEMENT POUR QU ELLE SOIT LINKEE POUR ENVOI MEDICAL VIEWER"
boolean visible = false
integer x = 1371
integer y = 1708
integer width = 686
integer height = 400
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_export_lienword"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_rafraichir from picturebutton within w_courriers_word
integer x = 3822
integer y = 1532
integer width = 174
integer height = 152
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Renouvelle l~'affichage en cours / Régénère la Table des courriers en lisant les fichiers"
long backcolor = 553648127
end type

event clicked;if type_gestion = "P" then
	// on charge l'arborescence du répertoire courrier courant avant de donner la main
	load_tv_2011(tv_powerpoint, dir_courriers, true)
else

	// on charge l'arborescence du répertoire courrier courant avant de donner la main
	load_tv_2011(tv_courriers, dir_courriers, true)
end if


end event

event rbuttondown;

// RAZ de la table des courriers Word !!!

if messagebox("ATTENTION","Vous aller effacer les propriétés actuelles des documents et les réinitialiser avec les valeurs par défaut.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	string base_raz
	
	if utilisation_distante then
		base_raz = "Local"
	else
		base_raz = "Cabinet"
	end if
	
	type_gestion = "P"
	delete from courriers_word where type_docu = :type_gestion and base = :base_raz ;
	commit ;
	load_tv_2011(tv_courriers, dir_courriers, true)
	
	type_gestion = "W"
	delete from courriers_word where type_docu = :type_gestion and base = :base_raz ;
	commit ;
	load_tv_2011(tv_courriers, dir_courriers, true)
	
	commit ;
	
	// On force le mode Word
	rb_word.checked = true
	rb_powerpoint.checked = false
	word_ou_powerpoint("W")
end if
end event

type pb_signature_en_ligne from uo_picturebutton_780x120 within w_courriers_word
integer x = 3520
integer y = 580
integer height = 136
integer taborder = 110
boolean bringtotop = true
string text = "Signature En Ligne"
string tiptext = "Fusionne le document avec un patient et envoi le document pour signature en ligne"
string iconname = "lc_signature_16.png"
end type

event clicked;call super::clicked;if type_gestion = "W" then
	signature_en_ligne(false, false, false, "", "")
end if
end event

event rbuttondown;call super::rbuttondown;if type_gestion = "W" then
	signature_en_ligne(true, false, false, "", "")
end if
end event

type cb_dupliquer_favoris from uo_picturebutton_250x120 within w_courriers_word
boolean visible = false
integer x = 2930
integer y = 1740
integer width = 503
integer height = 128
integer taborder = 100
boolean bringtotop = true
string text = "Dupliquer"
string tiptext = "Duplique les courriers favoris de l~'utiliateur courant vers un autre"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;open(w_courriers_word_favoris_duplication)
end event

type cb_convertir from uo_picturebutton_780x120 within w_courriers_word
integer x = 3520
integer y = 1388
integer width = 777
integer height = 136
integer taborder = 90
boolean bringtotop = true
string text = "Convertir en .docx"
string tiptext = "Convertit tous les documents Word du format .doc au format .docx"
string iconname = "ACTIONS_stock_generer_selon_index.png"
end type

event clicked;call super::clicked;// Principe : 
// On parcours l'arbre .. si on trouve un .doc on le convertit en docx + on le renomme en .doc.sav et on modifie la base de données

if messagebox("ATTENTION","Vous allez convertir les courriers Word qui sont en format .doc en format .docx.~n~nAssurez-vous qu'aucun autre utilisateur n'utilise les courriers.~n~nCette opération peut être longue selon le nombre de courriers à convertir (plusieurs minutes).~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	long	ll_ret, ll_handle, ll_cpt_courrier, ll_cpt_conversion
	
	string ls_fichier_a_convertir, ls_fichier_converti, ls_fichier_a_convertir_double_slash, ls_fichier_converti_double_slash, ls_path_fichier_a_convertir
	
	TreeviewItem ltvi_1
	
	double v_id_fichier_converti
	
	oleobject	ole_doc
	ole_doc = create oleobject
	ll_ret = ole_doc.ConnectToNewObject("Word.Application")
	
	if ll_ret  <> 0 then
		MessageBox("ATTENTION", "Impossible de se connecter à Microsoft Word (" + string(ll_Ret) + ") !", Exclamation!)
		destroy ole_doc
	else
		
		open(w_patience)
		string dir_courriers_local
		dir_courriers_local = "C:\Power\Ortho\Lettres Types\"
	
		// Par sécurité, on désactive le timer global
		timer(0, w_mdi_2020)

	
		// Parcours du treeview
		Trace("----- Début de la convertion des doc en docx -----")
		ll_cpt_courrier = 0
		ll_cpt_conversion = 0
		ole_doc.Visible = false 
		
		ll_handle = tv_courriers.Finditem(RootTreeItem! ,0)
		tv_courriers.Expandall(ll_handle)
		DO WHILE ll_handle > 0
			 tv_courriers.Getitem(ll_handle,ltvi_1)
			 
			 if ltvi_1.pictureIndex <> 2 and ltvi_1.pictureIndex <> 3 then
				// c'est un fichier
				 ll_cpt_courrier = ll_cpt_courrier + 1
				 
				 w_patience.avancement (string(ll_cpt_courrier) + " Fichiers examinés.")
				 
				 trace(string(ll_cpt_courrier) + "-> " + ltvi_1.data)
				 
				 if lower(gfx_extraire_extension_fichier(ltvi_1.data)) = "doc" then
					// il faut convertir
					ls_fichier_a_convertir = ltvi_1.data
					ls_path_fichier_a_convertir = gfx_extraire_path_fichier(ls_fichier_a_convertir)
					
					ls_fichier_converti = ls_path_fichier_a_convertir + gfx_fichier_sans_extension (ls_fichier_a_convertir) + ".docx"
					
					ls_fichier_a_convertir_double_slash = gfx_tout_remplacer(ls_fichier_a_convertir, "\", "\\")
					ls_fichier_converti_double_slash = gfx_tout_remplacer(ls_fichier_converti, "\", "\\")
					
					// Convertion proprement dire
					ole_doc.Documents.Open(ls_fichier_a_convertir)
					ole_doc.ActiveDocument.saveas(ls_fichier_converti,16)
					ole_doc.ActiveDocument.Close(false)
					
					// si le fichier converti est présent ... c'est bon !!
					if fileExists(ls_fichier_converti) then
						trace("   -> Conversion réussie")
						ll_cpt_conversion = ll_cpt_conversion + 1
						FileMove (ls_fichier_a_convertir , ls_fichier_a_convertir + ".sav")
						// Mise à jour de la base de données 
						v_id_fichier_converti = get_id_document(ls_fichier_a_convertir)
						
						update courriers_word set extension = 'docx' where id = :v_id_fichier_converti ;
						if sqlca.sqlcode = 0 then
							commit ;
							ls_fichier_converti_double_slash =  '"' + ls_fichier_converti_double_slash + '"' 
							ls_fichier_a_convertir_double_slash =  '"' + ls_fichier_a_convertir_double_slash + '"' 
							// Mise à jour de la table des praticiens si besoin (entete, bas de page, document clinique)
							update prati set chemin_complet_entete = :ls_fichier_converti_double_slash where chemin_complet_entete = :ls_fichier_a_convertir_double_slash  ;
							update prati set chemin_complet_bas_page =  :ls_fichier_converti_double_slash  where chemin_complet_bas_page =  :ls_fichier_a_convertir_double_slash  ; 
							update prati set chemin_document_clinique =  :ls_fichier_converti_double_slash  where chemin_document_clinique =  :ls_fichier_a_convertir_double_slash  ; 
							
							// pas de gestion d'erreur
							commit ;
							
							
						else
							MessageBox("ERREUR","Erreur dans la mise à jour des Courriers Word :~n~n" + sqlca.sqlerrtext)
							rollback ;
						end if
					else
						trace("   -> Conversion échouée")
					end if
								
				end if
					
					
			end if
			
			 ll_handle = tv_courriers.Finditem(NextVisibleTreeItem! , ll_handle)
			 tv_courriers.Expandall(ll_handle)
		LOOP
		
		// Corrections des paramètres de publipostage
		dw_param_publipostage.settransobject(sqlca)
		dw_param_publipostage.retrieve()
		long lig, tot
		string v_nom_courrier
		tot = dw_param_publipostage.rowcount()
		for lig = 1 to tot
			v_nom_courrier = dw_param_publipostage.getitemString(lig, "nom_courrier")
			v_nom_courrier = gfx_tout_remplacer(v_nom_courrier, ".doc", ".docx")
			dw_param_publipostage.setitem(lig, "nom_courrier", v_nom_courrier)
		next
		dw_param_publipostage.update()
		// pas de gestion d'erreur
		commit ;

		pb_rafraichir.triggerevent(clicked!)
		
	
		ole_doc.Quit()
		ole_doc.DisconnectObject()
		
		Trace("----- Fin de la convertion des doc en docx : " + string(ll_cpt_conversion) +  " Fichers convertis  -----")
		
		close(w_patience)
		
		// On résactive le timer global
		timer(60, w_mdi_2020)
		
		Messagebox("INFORMATION","Fin de la conversion.~n~n" + string(ll_cpt_conversion) +  " Fichers convertis.")

		
	end if
end if
end event

type dw_param_publipostage from datawindow within w_courriers_word
string tag = "brush"
boolean visible = false
integer x = 2277
integer y = 1528
integer width = 1111
integer height = 604
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_param_courriers_word"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_eclate from groupbox within w_courriers_word
integer x = 3474
integer y = 2024
integer width = 882
integer height = 144
integer taborder = 90
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 15780518
end type

type gb_1 from groupbox within w_courriers_word
string tag = "no resize"
boolean visible = false
integer x = 2048
integer y = 136
integer width = 864
integer height = 608
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Gestion des éléments"
end type

type gb_type_gestion from groupbox within w_courriers_word
integer x = 3474
integer y = 1872
integer width = 882
integer height = 148
integer taborder = 100
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 15780518
end type

type uo_powerpoint from uo_lien_powerpoint within w_courriers_word descriptor "pb_nvo" = "true" 
end type

on uo_powerpoint.create
call super::create
end on

on uo_powerpoint.destroy
call super::destroy
end on

type uo_word from uo_lien_word within w_courriers_word descriptor "pb_nvo" = "true" 
end type

on uo_word.create
call super::create
end on

on uo_word.destroy
call super::destroy
end on

