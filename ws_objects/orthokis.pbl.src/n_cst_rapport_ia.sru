$PBExportHeader$n_cst_rapport_ia.sru
$PBExportComments$Lecture du compte rendu IA (JSON) et chargement dans d_rapport_ia
forward
global type n_cst_rapport_ia from nonvisualobject
end type
end forward

global type n_cst_rapport_ia from nonvisualobject autoinstantiate
end type

type variables
Private:
	JsonParser	ijp_parser
	string		is_lasterror
end variables

forward prototypes
public function string of_get_lasterror ()
public function string of_lire_fichier (string as_fichier)
public function integer of_charger (string as_json, datawindow adw_cible)
public function integer of_charger_fichier (string as_fichier, datawindow adw_cible)
private function long of_find (long al_parent, string as_key)
private function string of_get_texte (long al_parent, string as_key)
private function long of_get_bool (long al_parent, string as_key)
private function string of_to_texte (long al_item)
private function string of_valeur_simple (long al_item)
end prototypes

public function string of_get_lasterror ();
return is_lasterror
end function

public function string of_lire_fichier (string as_fichier);
// Lit tout le fichier (UTF-8) et renvoie son contenu ; "" en cas d'erreur
integer	li_file
string	ls_json

is_lasterror = ""
if not FileExists(as_fichier) then
	is_lasterror = "Fichier introuvable : " + as_fichier
	return ""
end if

li_file = FileOpen(as_fichier, StreamMode!, Read!, LockWrite!, Replace!, EncodingUTF8!)
if li_file < 0 then
	is_lasterror = "Impossible d'ouvrir le fichier : " + as_fichier
	return ""
end if

if FileReadEx(li_file, ls_json) < 0 then
	is_lasterror = "Erreur de lecture du fichier : " + as_fichier
	ls_json = ""
end if
FileClose(li_file)

return ls_json
end function

public function integer of_charger (string as_json, datawindow adw_cible);
// Charge les champs de "fields" et la liste "uncertainties" dans une ligne de adw_cible
// Retour : 1 = OK, -1 = erreur (voir of_get_lasterror)
string	ls_err
long		ll_root, ll_fields, ll_dep, ll_grp, ll_mac, ll_obj, ll_row
integer	i, j
string	ls_grp[2] = {"anomaliesBasales", "anomaliesAlveolaires"}
string	ls_grpcol[2] = {"ab", "aa"}
string	ls_mac[2] = {"maxillaire", "mandibulaire"}
string	ls_maccol[2] = {"max", "man"}
string	ls_prefixe

is_lasterror = ""
ls_err = ijp_parser.LoadString(as_json)
if Len(ls_err) > 0 then
	is_lasterror = "JSON invalide : " + ls_err
	return -1
end if

ll_root = ijp_parser.GetRootItem()
ll_fields = of_find(ll_root, "fields")
if ll_fields <= 0 then
	is_lasterror = "Le groupe ~"fields~" est absent du JSON."
	return -1
end if

adw_cible.SetRedraw(false)
adw_cible.Reset()
ll_row = adw_cible.InsertRow(0)

// --- fields : valeurs simples
adw_cible.SetItem(ll_row, "motifconsultation",   of_get_texte(ll_fields, "motifConsultation"))
adw_cible.SetItem(ll_row, "allergies",           of_get_texte(ll_fields, "allergies"))
adw_cible.SetItem(ll_row, "commentaireclinique", of_get_texte(ll_fields, "commentaireClinique"))
adw_cible.SetItem(ll_row, "prochaincomclinique", of_get_texte(ll_fields, "prochainCommentaireClinique"))
adw_cible.SetItem(ll_row, "diagsquelettique",    of_get_texte(ll_fields, "diagnosticSquelettique"))
adw_cible.SetItem(ll_row, "diagdentaire",        of_get_texte(ll_fields, "diagnosticDentaire"))
adw_cible.SetItem(ll_row, "diagfonctionnel",     of_get_texte(ll_fields, "diagnosticFonctionnel"))
adw_cible.SetItem(ll_row, "diagalveolaire",      of_get_texte(ll_fields, "diagnosticAlveolaire"))
adw_cible.SetItem(ll_row, "plantraitement",      of_get_texte(ll_fields, "planTraitement"))
adw_cible.SetItem(ll_row, "objectiftraitement",  of_get_texte(ll_fields, "objectifTraitement"))
adw_cible.SetItem(ll_row, "remarques",           of_get_texte(ll_fields, "remarques"))

// --- fields : listes (une ligne de texte par élément)
adw_cible.SetItem(ll_row, "prochainrdv", of_get_texte(ll_fields, "prochainRendezVous"))
adw_cible.SetItem(ll_row, "actes",       of_get_texte(ll_fields, "actes"))

// --- fields.dep
ll_dep = of_find(ll_fields, "dep")
if ll_dep > 0 then
	for i = 1 to 2
		ll_grp = of_find(ll_dep, ls_grp[i])
		for j = 1 to 2
			ls_prefixe = "dep_" + ls_grpcol[i] + "_" + ls_maccol[j] + "_"
			ll_mac = 0
			if ll_grp > 0 then ll_mac = of_find(ll_grp, ls_mac[j])
			if ll_mac > 0 then
				adw_cible.SetItem(ll_row, ls_prefixe + "sagittal",    of_get_texte(ll_mac, "sensSagittal"))
				adw_cible.SetItem(ll_row, ls_prefixe + "transversal", of_get_texte(ll_mac, "sensTransversal"))
				adw_cible.SetItem(ll_row, ls_prefixe + "vertical",    of_get_texte(ll_mac, "sensVertical"))
			end if
		next
	next

	ll_obj = of_find(ll_dep, "classeDentaireMolaire")
	if ll_obj > 0 then
		adw_cible.SetItem(ll_row, "dep_cl_molaire",      of_get_texte(ll_obj, "classe"))
		adw_cible.SetItem(ll_row, "dep_cl_molaire_prec", of_get_texte(ll_obj, "precision"))
	end if
	ll_obj = of_find(ll_dep, "classeDentaireCanine")
	if ll_obj > 0 then
		adw_cible.SetItem(ll_row, "dep_cl_canine",      of_get_texte(ll_obj, "classe"))
		adw_cible.SetItem(ll_row, "dep_cl_canine_prec", of_get_texte(ll_obj, "precision"))
	end if

	adw_cible.SetItem(ll_row, "dep_ddm", of_get_bool(ll_dep, "dysharmonieDentoMaxillaire"))
	adw_cible.SetItem(ll_row, "dep_ddd", of_get_bool(ll_dep, "dysharmonieDentoDentaire"))

	ll_obj = of_find(ll_dep, "occlusionInversee")
	if ll_obj > 0 then
		adw_cible.SetItem(ll_row, "dep_occl_inv_droite",     of_get_bool(ll_obj, "droite"))
		adw_cible.SetItem(ll_row, "dep_occl_inv_gauche",     of_get_bool(ll_obj, "gauche"))
		adw_cible.SetItem(ll_row, "dep_occl_inv_anterieure", of_get_bool(ll_obj, "anterieure"))
	end if

	adw_cible.SetItem(ll_row, "dep_dents_incluses", of_get_texte(ll_dep, "dentsInclusesOuSurnumeraires"))
	adw_cible.SetItem(ll_row, "dep_malpositions",   of_get_texte(ll_dep, "malpositions"))
	adw_cible.SetItem(ll_row, "dep_agenesie",       of_get_texte(ll_dep, "agenesie"))
	adw_cible.SetItem(ll_row, "dep_facteur_fonct",  of_get_texte(ll_dep, "facteurFonctionnel"))
end if

// --- uncertainties (à la racine du JSON)
adw_cible.SetItem(ll_row, "incertitudes", of_get_texte(ll_root, "uncertainties"))

adw_cible.ResetUpdate()   // les données viennent d'être chargées : rien n'est "modifié"
adw_cible.SetRedraw(true)
return 1
end function

public function integer of_charger_fichier (string as_fichier, datawindow adw_cible);
string ls_json

ls_json = of_lire_fichier(as_fichier)
if ls_json = "" then
	if is_lasterror = "" then is_lasterror = "Fichier vide : " + as_fichier
	return -1
end if

return of_charger(ls_json, adw_cible)
end function

private function long of_find (long al_parent, string as_key);
// Renvoie le handle de la clé as_key dans l'objet al_parent, 0 si absente
long ll_i, ll_n

if al_parent <= 0 then return 0
if ijp_parser.GetItemType(al_parent) <> JsonObjectItem! then return 0

ll_n = ijp_parser.GetChildCount(al_parent)
for ll_i = 1 to ll_n
	if ijp_parser.GetChildKey(al_parent, ll_i) = as_key then
		return ijp_parser.GetChildItem(al_parent, ll_i)
	end if
next
return 0
end function

private function string of_get_texte (long al_parent, string as_key);
// Valeur texte d'une clé, quelle que soit sa nature (texte, liste, objet...) ; "" si absente ou null
long ll_item

ll_item = of_find(al_parent, as_key)
if ll_item <= 0 then return ""
return of_to_texte(ll_item)
end function

private function long of_get_bool (long al_parent, string as_key);
// 1 si la clé vaut true, 0 sinon (absente, null, false)
long ll_item

ll_item = of_find(al_parent, as_key)
if ll_item <= 0 then return 0
if ijp_parser.GetItemType(ll_item) <> JsonBooleanItem! then return 0
if ijp_parser.GetItemBoolean(ll_item) then return 1
return 0
end function

private function string of_to_texte (long al_item);
// Convertit un élément JSON en texte affichable :
//  - liste : une ligne par élément ("- ...")
//  - objet : "valeur1 - valeur2 ..." (valeurs non vides seulement)
long		ll_i, ll_n, ll_child
string	ls_ret = "", ls_val

choose case ijp_parser.GetItemType(al_item)
	case JsonArrayItem!
		ll_n = ijp_parser.GetChildCount(al_item)
		for ll_i = 1 to ll_n
			ll_child = ijp_parser.GetChildItem(al_item, ll_i)
			ls_val = of_to_texte(ll_child)
			if Trim(ls_val) <> "" then
				if ls_ret <> "" then ls_ret += "~r~n"
				ls_ret += "- " + ls_val
			end if
		next

	case JsonObjectItem!
		ll_n = ijp_parser.GetChildCount(al_item)
		for ll_i = 1 to ll_n
			ll_child = ijp_parser.GetChildItem(al_item, ll_i)
			ls_val = of_to_texte(ll_child)
			if Trim(ls_val) <> "" then
				if ls_ret <> "" then ls_ret += " - "
				ls_ret += ls_val
			end if
		next

	case else
		ls_ret = of_valeur_simple(al_item)
end choose

return ls_ret
end function

private function string of_valeur_simple (long al_item);
// Valeur d'un élément simple (texte, nombre, booléen) ; "" pour null
string ls_ret = ""

choose case ijp_parser.GetItemType(al_item)
	case JsonStringItem!
		ls_ret = ijp_parser.GetItemString(al_item)
		if IsNull(ls_ret) then ls_ret = ""
	case JsonNumberItem!
		ls_ret = String(ijp_parser.GetItemNumber(al_item))
	case JsonBooleanItem!
		if ijp_parser.GetItemBoolean(al_item) then
			ls_ret = "Oui"
		else
			ls_ret = "Non"
		end if
end choose
return ls_ret
end function

on n_cst_rapport_ia.create
call super::create
ijp_parser = create JsonParser
TriggerEvent( this, "constructor" )
end on

on n_cst_rapport_ia.destroy
TriggerEvent( this, "destructor" )
call super::destroy
if IsValid(ijp_parser) then destroy ijp_parser
end on

