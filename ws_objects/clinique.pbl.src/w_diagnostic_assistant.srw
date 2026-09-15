$PBExportHeader$w_diagnostic_assistant.srw
forward
global type w_diagnostic_assistant from w_fenetre_arakis
end type
type dw_diag1 from datawindow within w_diagnostic_assistant
end type
type rb_1 from radiobutton within w_diagnostic_assistant
end type
type rb_2 from radiobutton within w_diagnostic_assistant
end type
type rb_3 from radiobutton within w_diagnostic_assistant
end type
type cb_annuler from uo_picturebutton_390x120 within w_diagnostic_assistant
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_diagnostic_assistant
end type
type cb_fermer from uo_picturebutton_390x120 within w_diagnostic_assistant
end type
type dw_diag_liste1 from datawindow within w_diagnostic_assistant
end type
type uo_1 from resize_fenetre within w_diagnostic_assistant
end type
type st_temps from statictext within w_diagnostic_assistant
end type
type dw_liste_images_un_patient from datawindow within w_diagnostic_assistant
end type
type dw_diag_liste2 from datawindow within w_diagnostic_assistant
end type
type rb_4 from radiobutton within w_diagnostic_assistant
end type
type dw_diag2 from datawindow within w_diagnostic_assistant
end type
type dw_diag3 from datawindow within w_diagnostic_assistant
end type
type dw_diag4 from datawindow within w_diagnostic_assistant
end type
type st_etat_images from statictext within w_diagnostic_assistant
end type
type pb_suivant from uo_picturebutton_transparent within w_diagnostic_assistant
end type
type pb_precedent from uo_picturebutton_transparent within w_diagnostic_assistant
end type
type tab_1 from tab within w_diagnostic_assistant
end type
type tabpage_plan from userobject within tab_1
end type
type p_histo from picture within tabpage_plan
end type
type cb_historique from uo_picturebutton_390x120 within tabpage_plan
end type
type cb_enregistrer_historique from uo_picturebutton_780x120 within tabpage_plan
end type
type dw_plan from datawindow within tabpage_plan
end type
type tabpage_plan from userobject within tab_1
p_histo p_histo
cb_historique cb_historique
cb_enregistrer_historique cb_enregistrer_historique
dw_plan dw_plan
end type
type tabpage_dep from userobject within tab_1
end type
type dw_dep from datawindow within tabpage_dep
end type
type tabpage_dep from userobject within tab_1
dw_dep dw_dep
end type
type tab_1 from tab within w_diagnostic_assistant
tabpage_plan tabpage_plan
tabpage_dep tabpage_dep
end type
type gb_choix from groupbox within w_diagnostic_assistant
end type
type gb_temps from groupbox within w_diagnostic_assistant
end type
type dw_temps from datawindow within w_diagnostic_assistant
end type
type pb_aide from uo_bouton_aide within w_diagnostic_assistant
end type
type dw_liste_plan from datawindow within w_diagnostic_assistant
end type
type uo_icones from uo_icones_alertes_patient within w_diagnostic_assistant
end type
type pb_moulage from picturebutton within w_diagnostic_assistant
end type
type cb_rafraichir_imagerie from picturebutton within w_diagnostic_assistant
end type
end forward

global type w_diagnostic_assistant from w_fenetre_arakis
string tag = "NORMAL"
integer width = 5618
integer height = 3364
boolean titlebar = false
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean border = false
windowtype windowtype = child!
dw_diag1 dw_diag1
rb_1 rb_1
rb_2 rb_2
rb_3 rb_3
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
dw_diag_liste1 dw_diag_liste1
uo_1 uo_1
st_temps st_temps
dw_liste_images_un_patient dw_liste_images_un_patient
dw_diag_liste2 dw_diag_liste2
rb_4 rb_4
dw_diag2 dw_diag2
dw_diag3 dw_diag3
dw_diag4 dw_diag4
st_etat_images st_etat_images
pb_suivant pb_suivant
pb_precedent pb_precedent
tab_1 tab_1
gb_choix gb_choix
gb_temps gb_temps
dw_temps dw_temps
pb_aide pb_aide
dw_liste_plan dw_liste_plan
uo_icones uo_icones
pb_moulage pb_moulage
cb_rafraichir_imagerie cb_rafraichir_imagerie
end type
global w_diagnostic_assistant w_diagnostic_assistant

type variables


double var_code_local
string var_nom_local

// Cadre images
gearbox gb_cadre_1, gb_cadre_2

constant long largeur_images = 500
constant long hauteur_images = 500

string diag_courant = "S"

integer page_courante = 1

integer nb_images_trouvees
integer nb_images_affichables 
integer nb_images_maxi = 0
gearbox_speciale_diag tab_gb[]

double v_temps_initial

integer resize_automatique = 0



end variables

forward prototypes
public subroutine diag_courant (string v_diag)
public subroutine charger_images (double v_temps_traitement)
public subroutine affiche_page (integer v_page)
public subroutine maj_dep (string v_zone, string v_valeur)
public subroutine init_icone_histo ()
public subroutine remplir_dep ()
end prototypes

public subroutine diag_courant (string v_diag);
// mise à jour des éléments concernant

// tout en invisible
diag_courant = v_diag
dw_diag_liste1.visible = true
dw_diag_liste1.visible = true
dw_diag1.y = dw_diag3.y
dw_diag2.y = dw_diag3.y

//if enregistrement_automatique and cb_enregistrer.enabled then
//	cb_enregistrer.triggerevent(clicked!)
//end if

choose case v_diag
	case "D"
		dw_diag_liste1.title = "Diagnostics Dentaires Prédéfinis"
		dw_diag_liste2.title = "Diagnostics Alvéolaires Prédéfinis"
		dw_diag1.visible = true
		dw_diag2.visible = true
		dw_diag3.visible = false
		dw_diag4.visible = false
		tab_1.visible = false
		dw_diag_liste1.visible = true
		dw_diag_liste2.visible = true
		dw_diag_liste1.SetFilter("type_diag = 'D'")
		dw_diag_liste2.SetFilter("type_diag = 'A'")


case "S"
		dw_diag_liste1.title = "Diagnostics Squelettiques Prédéfinis"
		dw_diag_liste2.title = "Diagnostics Fonctionnels Prédéfinis"
		dw_diag1.visible = false
		dw_diag2.visible = false
		dw_diag3.visible = true
		dw_diag4.visible = true
		tab_1.visible = false
		dw_diag_liste1.visible = true
		dw_diag_liste2.visible = true
		dw_diag_liste1.SetFilter("type_diag = 'S'")
		dw_diag_liste2.SetFilter("type_diag = 'F'")

	case "E"
		// éléments de la DEP
		dw_diag1.visible = false
		dw_diag2.visible = false
		dw_diag3.visible = false
		dw_diag4.visible = false
		tab_1.visible = true
		dw_diag_liste1.visible = false
		dw_diag_liste2.visible = false

case "4"
		// 4 Diag à la fois
		dw_diag1.y = dw_diag_liste1.y
		dw_diag2.y = dw_diag_liste1.y
		dw_diag1.visible = true
		dw_diag2.visible = true
		dw_diag3.visible = true
		dw_diag4.visible = true
		tab_1.visible = false
		dw_diag_liste1.visible = false
		dw_diag_liste2.visible = false
end choose

// liste des choix ...
dw_diag_liste1.Filter()
dw_diag_liste2.Filter()

end subroutine

public subroutine charger_images (double v_temps_traitement);

//temps_traitement_id


// On ne prend que les images du temps

dw_liste_images_un_patient.SetFilter ("temps_traitement_id = "+string(v_temps_traitement))
dw_liste_images_un_patient.Filter()

nb_images_trouvees = dw_liste_images_un_patient.rowcount()

integer cpt
string v_fichier_image, nom_cadre


for cpt = 1 to nb_images_trouvees
	if cpt > nb_images_maxi then
		openuserobject(tab_gb[cpt], "gearbox_speciale_diag")
		tab_gb[cpt].width = largeur_images
		tab_gb[cpt].height = hauteur_images
		tab_gb[cpt].cadre_1 = gb_cadre_1
		tab_gb[cpt].cadre_2 = gb_cadre_2
	end if


	v_fichier_image = dw_liste_images_un_patient.getItemString(cpt, "nom_fichier")
	if v_fichier_image <> "" then
		nom_cadre = get_nom_cadre_image(v_fichier_image)
	end if

	if nom_cadre <> "" then
		tab_gb[cpt].classname = nom_cadre
		tab_gb[cpt].nom_cadre_explorateur_v12 = tab_gb[cpt].classname
		tab_gb[cpt].var_num_dossier_v12 = var_code_local
		tab_gb[cpt].vignette = true
		tab_gb[cpt].init_gearbox()
	end if
next


nb_images_maxi = max(nb_images_maxi, nb_images_trouvees)

affiche_page(page_courante)

end subroutine

public subroutine affiche_page (integer v_page);

// Affiche les images du haut pour la page v_page

// On ne prend que les images du temps
integer numero_image = 0
integer cpt, debut, fin

nb_images_affichables = int (  (this.width - (gb_cadre_1.x +  gb_cadre_1.width)) / (largeur_images + 50) )

debut =  (v_page - 1) *  nb_images_affichables  + 1
fin = min ( v_page  *  nb_images_affichables , nb_images_trouvees)

for cpt = 1 to nb_images_maxi
	tab_gb[cpt].visible = false
next


// on n'affiche que la page demandée
for cpt =  debut  to fin
	numero_image = numero_image + 1
	tab_gb[cpt].x = gb_cadre_1.x +  gb_cadre_1.width  + 50 + (numero_image - 1) * (largeur_images + 50)
	tab_gb[cpt].y = 20
	tab_gb[cpt].visible = true
next


st_etat_images.text = "Page " + string(page_courante) + "  (" +  string( debut)  + " - " + string( fin ) + " / "+ string(nb_images_trouvees)  + ")"


end subroutine

public subroutine maj_dep (string v_zone, string v_valeur);
//messagebox("v_zone",v_zone)


if isnull(v_valeur) then v_zone = ""

if len(trim(v_valeur)) > 0 then
	tab_1.tabpage_dep.dw_dep.setItem(1, v_zone, v_valeur)
end if
end subroutine

public subroutine init_icone_histo ();//protected fx pour affichage icone historique des traitements si qqch en histo
//retourne tjrs 1

long nbr_histo	//pour totaliser le nbr de traitement en historique


select count(*) into :nbr_histo from historique_traitement where code = :var_code_local;

if nbr_histo > 0 then
	tab_1.tabpage_plan.p_histo.visible = true
	tab_1.tabpage_plan.cb_historique.enabled = true
else
	tab_1.tabpage_plan.p_histo.visible = false
	tab_1.tabpage_plan.cb_historique.enabled = false
end if

return
end subroutine

public subroutine remplir_dep ();
// Traitement des cases de la DEP ... 

integer cpt_boucle
long lig, tot
datawindow diag_liste_courant

string v_code_courant

string basal_max_pro , basal_max_retro , basal_mand_pro , basal_mand_retro , basal_max_endo 
string basal_max_exo , basal_mand_endo , basal_mand_exo , hypodivergence , hyperdivergence 
string alveo_max_pro , alveo_max_retro , alveo_mand_pro , alveo_mand_retro , alveo_max_endo  
string alveo_max_exo , alveo_mand_endo , alveo_mand_exo , supraclusion , infraclusion , mol_cl1  
string mol_cl2 , mol_cl3 , can_cl1 , can_cl2 , can_cl3 , molaire , canine , dento_max , dento_dent 
string agenesie , surnum , malposition , occl_dte , occl_gche , occl_ant , facteur , commentaire_html

dw_diag_liste1.SetFilter("type_diag = 'D'")
dw_diag_liste2.SetFilter("type_diag = 'A'")

for cpt_boucle = 1 to 2
	
	if cpt_boucle = 1 then
		diag_liste_courant = dw_diag_liste1
	else
		diag_liste_courant = dw_diag_liste2
	end if
	
	tot = diag_liste_courant.rowcount()
	
	for lig = 1 to tot
		
		if diag_liste_courant.getItemString(lig, "selection") = "O" then
			
			v_code_courant = diag_liste_courant.getItemString(lig, "code")
			
			select "basal_max_pro" , "basal_max_retro" , "basal_mand_pro" , "basal_mand_retro" , "basal_max_endo" ,
			"basal_max_exo" , "basal_mand_endo" , "basal_mand_exo" , "hypodivergence" , "hyperdivergence" ,
			"alveo_max_pro" , "alveo_max_retro" , "alveo_mand_pro" , "alveo_mand_retro" , "alveo_max_endo" , 
			"alveo_max_exo" , "alveo_mand_endo" , "alveo_mand_exo" , "supraclusion" , "infraclusion" , "mol_cl1" , 
			"mol_cl2" , "mol_cl3" , "can_cl1" , "can_cl2" , "can_cl3" , "molaire" , "canine" , "dento_max" , "dento_dent" ,
			"agenesie" , "surnum" , "malposition" , "occl_dte" , "occl_gche" , "occl_ant" , "facteur", "commentaire_html" 
			
			into :basal_max_pro , :basal_max_retro , :basal_mand_pro , :basal_mand_retro , :basal_max_endo, 
			:basal_max_exo , :basal_mand_endo , :basal_mand_exo , :hypodivergence , :hyperdivergence ,
			:alveo_max_pro , :alveo_max_retro , :alveo_mand_pro , :alveo_mand_retro , :alveo_max_endo  , 
			:alveo_max_exo , :alveo_mand_endo , :alveo_mand_exo , :supraclusion , :infraclusion , :mol_cl1  ,
			:mol_cl2 , :mol_cl3 , :can_cl1 , :can_cl2 , :can_cl3 , :molaire , :canine , :dento_max , :dento_dent ,
			 :agenesie , :surnum , :malposition , :occl_dte , :occl_gche , :occl_ant , :facteur , :commentaire_html
			 
			 from diagnostic where code = :v_code_courant ;
			
			 
			 // traitement de chaque zone 
			maj_dep("basal_max_pro" , basal_max_pro)
			maj_dep("basal_max_retro" , basal_max_retro)
			maj_dep("basal_mand_pro" ,basal_mand_pro)
			maj_dep("basal_mand_retro", basal_mand_retro) 
			maj_dep("basal_max_endo" , basal_max_endo)
			maj_dep("basal_max_exo" , basal_max_exo)
			maj_dep("basal_mand_endo" , basal_mand_endo)
			maj_dep("basal_mand_exo" , basal_mand_exo)
			maj_dep("hypodivergence" , hypodivergence)
			maj_dep("hyperdivergence" ,hyperdivergence)
			maj_dep("alveo_max_pro" , alveo_max_pro)
			maj_dep("alveo_max_retro" , alveo_max_retro)
			maj_dep("alveo_mand_pro" , alveo_mand_pro)
			maj_dep("alveo_mand_retro" , alveo_mand_retro)
			maj_dep("alveo_max_endo" , alveo_max_endo)
			maj_dep("alveo_max_exo" , alveo_max_exo)
			maj_dep("alveo_mand_endo" , alveo_mand_endo)
			maj_dep("alveo_mand_exo" , alveo_mand_exo)
			maj_dep("supraclusion" , supraclusion)
			maj_dep("infraclusion" , infraclusion)
			maj_dep("mol_cl1" , mol_cl1)
			maj_dep("mol_cl2" , mol_cl2)
			maj_dep("mol_cl3" , mol_cl3)
			maj_dep("can_cl1" , can_cl1)
			maj_dep("can_cl2" , can_cl2)
			maj_dep("can_cl3" , can_cl3)
			maj_dep("molaire" , molaire)
			maj_dep("canine" , canine)
			maj_dep("dento_max" , dento_max)
			maj_dep("dento_dent" ,dento_dent)
			maj_dep("agenesie" , agenesie)
			maj_dep("surnum" , surnum)
			maj_dep("malposition" , malposition)
			maj_dep("occl_dte" , occl_dte)
			maj_dep("occl_gche" , occl_gche)
			maj_dep("occl_ant" , occl_ant)
			maj_dep("facteur" ,facteur)
			maj_dep("patient_commentaire_html",commentaire_html)
			maj_dep("commentaire",string_to_rtf(commentaire_html, couleur_noire, couleur_blanche))
			
		end if		
	next
		
	
next



// on remet les filtres commes ils étaient
choose case diag_courant
	case "D"
		dw_diag_liste1.SetFilter("type_diag = 'D'")
		dw_diag_liste2.SetFilter("type_diag = 'A'")
	case "S"
		dw_diag_liste1.SetFilter("type_diag = 'S'")
		dw_diag_liste2.SetFilter("type_diag = 'F'")
end choose



tab_1.tabpage_dep.dw_dep.accepttext()

end subroutine

on w_diagnostic_assistant.create
int iCurrent
call super::create
this.dw_diag1=create dw_diag1
this.rb_1=create rb_1
this.rb_2=create rb_2
this.rb_3=create rb_3
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.dw_diag_liste1=create dw_diag_liste1
this.uo_1=create uo_1
this.st_temps=create st_temps
this.dw_liste_images_un_patient=create dw_liste_images_un_patient
this.dw_diag_liste2=create dw_diag_liste2
this.rb_4=create rb_4
this.dw_diag2=create dw_diag2
this.dw_diag3=create dw_diag3
this.dw_diag4=create dw_diag4
this.st_etat_images=create st_etat_images
this.pb_suivant=create pb_suivant
this.pb_precedent=create pb_precedent
this.tab_1=create tab_1
this.gb_choix=create gb_choix
this.gb_temps=create gb_temps
this.dw_temps=create dw_temps
this.pb_aide=create pb_aide
this.dw_liste_plan=create dw_liste_plan
this.uo_icones=create uo_icones
this.pb_moulage=create pb_moulage
this.cb_rafraichir_imagerie=create cb_rafraichir_imagerie
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_diag1
this.Control[iCurrent+2]=this.rb_1
this.Control[iCurrent+3]=this.rb_2
this.Control[iCurrent+4]=this.rb_3
this.Control[iCurrent+5]=this.cb_annuler
this.Control[iCurrent+6]=this.cb_enregistrer
this.Control[iCurrent+7]=this.cb_fermer
this.Control[iCurrent+8]=this.dw_diag_liste1
this.Control[iCurrent+9]=this.uo_1
this.Control[iCurrent+10]=this.st_temps
this.Control[iCurrent+11]=this.dw_liste_images_un_patient
this.Control[iCurrent+12]=this.dw_diag_liste2
this.Control[iCurrent+13]=this.rb_4
this.Control[iCurrent+14]=this.dw_diag2
this.Control[iCurrent+15]=this.dw_diag3
this.Control[iCurrent+16]=this.dw_diag4
this.Control[iCurrent+17]=this.st_etat_images
this.Control[iCurrent+18]=this.pb_suivant
this.Control[iCurrent+19]=this.pb_precedent
this.Control[iCurrent+20]=this.tab_1
this.Control[iCurrent+21]=this.gb_choix
this.Control[iCurrent+22]=this.gb_temps
this.Control[iCurrent+23]=this.dw_temps
this.Control[iCurrent+24]=this.pb_aide
this.Control[iCurrent+25]=this.dw_liste_plan
this.Control[iCurrent+26]=this.uo_icones
this.Control[iCurrent+27]=this.pb_moulage
this.Control[iCurrent+28]=this.cb_rafraichir_imagerie
end on

on w_diagnostic_assistant.destroy
call super::destroy
destroy(this.dw_diag1)
destroy(this.rb_1)
destroy(this.rb_2)
destroy(this.rb_3)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.dw_diag_liste1)
destroy(this.uo_1)
destroy(this.st_temps)
destroy(this.dw_liste_images_un_patient)
destroy(this.dw_diag_liste2)
destroy(this.rb_4)
destroy(this.dw_diag2)
destroy(this.dw_diag3)
destroy(this.dw_diag4)
destroy(this.st_etat_images)
destroy(this.pb_suivant)
destroy(this.pb_precedent)
destroy(this.tab_1)
destroy(this.gb_choix)
destroy(this.gb_temps)
destroy(this.dw_temps)
destroy(this.pb_aide)
destroy(this.dw_liste_plan)
destroy(this.uo_icones)
destroy(this.pb_moulage)
destroy(this.cb_rafraichir_imagerie)
end on

event open;call super::open;
String lstr_nom, lstr_prenom, lstr_date_naissance
double v_nd
date v_date_naissance 

var_code_local = Message.DoubleParm


open(w_patience)

// titre ...
// recup des infos ds BD
select	nom, prenom, numero_dossier, date_naissance
INTO		:lstr_nom, :lstr_prenom, :v_nd, :v_date_naissance 
FROM		patient WHERE 	code = :VAR_CODE ;


lstr_date_naissance = string(v_date_naissance , "dd/mm/yyyy")

// pour éviter les bloquage si des val NULL
if isnull(lstr_nom) then lstr_nom = ""
if isnull(lstr_prenom) then lstr_prenom = ""
if isnull(lstr_date_naissance) then lstr_date_naissance = ""

var_nom_local =  trim(lstr_nom + space(1) + lstr_prenom) 

// construction barre de titre
this.title = "Assistant Diagnostic pour " + var_nom_local +"  ( "+ string(v_nd) + " ) - Age : " + calcul_age ( lstr_date_naissance )


dw_diag1.settransobject(sqlca)
dw_diag1.retrieve(var_code_local)
dw_diag2.settransobject(sqlca)
dw_diag2.retrieve(var_code_local)
dw_diag3.settransobject(sqlca)
dw_diag3.retrieve(var_code_local)
dw_diag4.settransobject(sqlca)
dw_diag4.retrieve(var_code_local)

dw_diag_liste1.settransobject(sqlca)
dw_diag_liste1.retrieve()
dw_diag_liste2.settransobject(sqlca)
dw_diag_liste2.retrieve()

tab_1.tabpage_dep.dw_dep.settransobject(sqlca)
tab_1.tabpage_dep.dw_dep.retrieve(var_code_local)

tab_1.tabpage_plan.dw_plan.settransobject(sqlca)
tab_1.tabpage_plan.dw_plan.retrieve(var_code_local)

dw_liste_images_un_patient.settransobject(sqlca)
dw_liste_images_un_patient.retrieve(var_code_local)

long lig, tot
// pas de sélection
tot = dw_diag_liste1.rowcount()
for lig = 1 to tot
	dw_diag_liste1.SetItem(lig, "Selection", "N")
next
tot = dw_diag_liste2.rowcount()
for lig = 1 to tot
	dw_diag_liste2.SetItem(lig, "Selection", "N")
next


dw_temps.settransobject(sqlca)
dw_temps.retrieve()

// photos par défaut
uo_choix_image_2013 choix_image_2013


choix_image_2013 = create uo_choix_image_2013
string v_fichier_image, nom_cadre
v_fichier_image = choix_image_2013.trouver_image ("cadre_1_diagnostic", var_code_local)
if v_fichier_image <> "" then
	nom_cadre = get_nom_cadre_image(v_fichier_image)
end if

openuserobject(gb_cadre_1, "gearbox")

	
if nom_cadre <> "" then
	gb_cadre_1.classname = nom_cadre
	gb_cadre_1.nom_cadre_explorateur_v12 = gb_cadre_1.classname
	gb_cadre_1.var_num_dossier_v12 = var_code_local
	gb_cadre_1.vignette = false
	gb_cadre_1.init_gearbox()
end if
	


v_fichier_image = choix_image_2013.trouver_image ("cadre_2_diagnostic", var_code_local)
if v_fichier_image <> "" then
	nom_cadre = get_nom_cadre_image(v_fichier_image)
end if

openuserobject(gb_cadre_2, "gearbox")


if nom_cadre <> "" then
	gb_cadre_2.classname = nom_cadre
	gb_cadre_2.nom_cadre_explorateur_v12 = gb_cadre_2.classname
	gb_cadre_2.var_num_dossier_v12 = var_code_local
	gb_cadre_2.vignette = false
	gb_cadre_2.init_gearbox()
end if

gb_choix.backcolor = couleur_fond_fenetre
tab_1.backcolor = couleur_fond_fenetre
tab_1.tabpage_plan.backcolor = couleur_fond_fenetre
tab_1.tabpage_dep.backcolor = couleur_fond_fenetre
rb_1.backcolor = couleur_fond_fenetre
rb_2.backcolor = couleur_fond_fenetre
rb_3.backcolor = couleur_fond_fenetre
rb_4.backcolor = couleur_fond_fenetre



diag_courant("D")


v_temps_initial = proposition_temps_traitement(var_code_local)
if dw_temps.rowcount() > 0 then
	dw_temps.setitem(1, "id", v_temps_initial)
end if

//if enregistrement_automatique then
//	cb_annuler.visible = false
//	cb_enregistrer.visible = false
//end if

// Historique de traitement
init_icone_histo()

// Icones du patient en bas à gauche
uo_icones.maj(var_code_local, this,  parentWindow())
uo_icones.uo_confid.verif_alertes(var_code_local, 'CC')
	

// Moulages numériques ?
// Y a-t-il un moulage 
string v_fichier_moulage
select Top 1 isnull(nom_courrier,'') into :v_fichier_moulage  from historique_editions where nature = 'D' and code_courrier = 'DOCMOU' and code = :var_code_local order by date_document desc  ;

if v_fichier_moulage <> "" then
	pb_moulage.tag = v_fichier_moulage
	pb_moulage.visible = true
end if

uo_1.taille(this)

// Pour éléments spéciaux France
If not FRANCE then
	tab_1.tabpage_plan.dw_plan.object.plan_imprime.visible = 0
	tab_1.tabpage_dep.visible = false
	rb_3.text = "Traitement"
end if


close(w_patience)

end event

event resize;	
if resize_automatique = 1 then
	
	uo_1.retaille(this)
	
	
	double coef_largeur_cadre
	integer mode_largeur
	
	// selon la largeur de la fenêtre
	if this.width > 6000 then
		mode_largeur = 1 	// très large
	else
		mode_largeur = 2		// moins large
	end if
	
	if mode_largeur = 1 then
		coef_largeur_cadre = 2.5
	else
		coef_largeur_cadre = 3.3
	end if
	
	
	// Pour les cadres
	
	gb_cadre_1.x = 10
	gb_cadre_1.y = 10
	gb_cadre_1.width = this.width / coef_largeur_cadre
	//gb_cadre_1.height = this.height / 2.15
	//gb_cadre_1.height = this.height / 2.20
	if this.tag = "MDI" then
		gb_cadre_1.height = (this.height - 350) / 2
	else
		gb_cadre_1.height = (this.height - 450) / 2
	end if
	gb_cadre_1.visible = true
	
	gb_cadre_2.x = 10
	gb_cadre_2.y = gb_cadre_1.height + 40
	gb_cadre_2.width = gb_cadre_1.width
	gb_cadre_2.height = gb_cadre_1.height
	gb_cadre_2.visible = true
	
	//cb_fermer.y =  this.height - cb_fermer.height - 50
	if this.tag = "MDI" then
		cb_fermer.y =  this.height - cb_fermer.height - 50
	else
		cb_fermer.y =  this.height - cb_fermer.height - 250
	end if
	cb_enregistrer.y = cb_fermer.y
	cb_annuler.y =  cb_fermer.y
	pb_aide.y =  cb_fermer.y
	
	cb_fermer.x = this.width - cb_fermer.width - 100
	cb_enregistrer.x = cb_fermer.x - cb_enregistrer.width - 100
	cb_annuler.x = cb_enregistrer.x - cb_annuler.width - 100
	pb_aide.x = cb_annuler.x - pb_aide.width - 100
	
	dw_diag1.x = gb_cadre_1.width + 50
	dw_diag1.y = cb_fermer.y - dw_diag1.height - 10	
	dw_diag3.x = dw_diag1.x
	dw_diag3.y = dw_diag1.y
	
	dw_diag1.width =   max ( this.width / 3.5 , dw_diag_liste1.width)
	dw_diag2.width =  dw_diag1.width
	dw_diag3.width =  dw_diag1.width
	dw_diag4.width =  dw_diag1.width
	
	dw_diag2.x = dw_diag1.x + dw_diag1.width + 50
	dw_diag2.y = dw_diag1.y
	dw_diag4.x = dw_diag2.x
	dw_diag4.y = dw_diag2.y
	
	
	dw_diag2.object.patient_diag_alveolaire_html.width = dw_diag1.width - 50 
	dw_diag1.object.patient_diag_dentaire_html.width = dw_diag1.width - 50 
	dw_diag4.object.patient_diag_fonctionnel_html.width = dw_diag1.width - 50 
	dw_diag3.object.patient_traitement_effectue_html.width = dw_diag1.width - 50 
	
	
	gb_choix.x =  dw_diag1.x
	rb_1.x = gb_choix.x + 60
	rb_2.x = rb_1.x + rb_1.width + 25
	rb_3.x = rb_2.x + rb_2.width + 25
	rb_4.x = rb_3.x + rb_3.width + 25
	
	gb_choix.y = 580
	rb_1.y = gb_choix.y  + 65
	rb_2.y = rb_1.y  
	rb_3.y = rb_1.y  
	rb_4.y = rb_1.y  
	
	st_etat_images.x = gb_choix.x + 800
	st_etat_images.y = gb_choix.y - 45
	pb_precedent.x = st_etat_images.x + st_etat_images.width + 50 
	pb_suivant.x = pb_precedent.x + pb_precedent.width + 30
	pb_precedent.y = st_etat_images.y -20
	pb_suivant.y = st_etat_images.y - 20
	
	gb_temps.y = gb_choix.y 
	gb_temps.x = gb_choix.x  + gb_choix.width + 30
	
	
	dw_temps.x = gb_temps.x + 50
	dw_temps.y = rb_1.y
	dw_temps.SetPosition(ToTop!)
	
	dw_diag_liste1.x = dw_diag1.x
	dw_diag_liste1.y = dw_temps.y + 100
	dw_diag_liste1.height = dw_diag1.y - dw_diag_liste1.y - 30
	
	dw_diag_liste2.x = dw_diag2.x
	dw_diag_liste2.y = dw_diag_liste1.y
	dw_diag_liste2.height = dw_diag_liste1.height
	
	
	tab_1.x = dw_diag_liste1.x
	tab_1.y =  dw_diag_liste1.y
	
	
	
	// Icone du bas de l'écran
	uo_icones.x = 10
	uo_icones.y = gb_cadre_2.y + gb_cadre_2.height
	
	pb_moulage.x = uo_icones.x  + uo_icones.width + 30
	pb_moulage.y = uo_icones.y + 76
	
	
	cb_rafraichir_imagerie.x = dw_temps.x + dw_temps.width + 100
	cb_rafraichir_imagerie.y = gb_temps.y
	
	// pour charger les images
	dw_temps.triggerevent(itemchanged!)
	
end if
	


end event

type p_fond from w_fenetre_arakis`p_fond within w_diagnostic_assistant
end type

type dw_diag1 from datawindow within w_diagnostic_assistant
string tag = "brush no resizeall"
integer y = 2036
integer width = 1879
integer height = 956
integer taborder = 20
boolean bringtotop = true
string title = "Diagnostic Dentaire"
string dataobject = "dw_assistant_diagnostic_dentaire"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//if enregistrement_automatique and cb_enregistrer.enabled then
//	cb_enregistrer.triggerevent(clicked!)
//end if
end event

event retrieveend;// pour replacer le point d'insertion à la fin du texte
string texte
texte = GetItemString(GetRow(), 2 )
SelectText ( len(texte) + 1, 0 ) 
Setfocus()

end event

type rb_1 from radiobutton within w_diagnostic_assistant
string tag = "no resize"
integer x = 375
integer y = 1024
integer width = 617
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dentaire / Alvéolaire"
boolean checked = true
end type

event clicked;diag_courant("D")
end event

type rb_2 from radiobutton within w_diagnostic_assistant
string tag = "no resize"
integer x = 1065
integer y = 1024
integer width = 786
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Squelettique / Fonctionnel"
end type

event clicked;diag_courant("S")
end event

type rb_3 from radiobutton within w_diagnostic_assistant
string tag = "no resize"
integer x = 1897
integer y = 1024
integer width = 489
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Eléments DEP"
end type

event clicked;
//cb_enregistrer.triggerevent(clicked!)


diag_courant("E")
end event

type cb_annuler from uo_picturebutton_390x120 within w_diagnostic_assistant
integer x = 4983
integer y = 2812
integer width = 562
integer taborder = 30
boolean bringtotop = true
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;


tab_1.tabpage_dep.dw_dep.retrieve(var_code_local) ;
tab_1.tabpage_plan.dw_plan.retrieve(var_code_local) ;


dw_diag1.retrieve(var_code_local) ;
dw_diag2.retrieve(var_code_local) ;
dw_diag3.retrieve(var_code_local) ;
dw_diag4.retrieve(var_code_local) ;



end event

type cb_enregistrer from uo_picturebutton_390x120 within w_diagnostic_assistant
integer x = 4992
integer y = 2988
integer width = 562
integer taborder = 40
boolean bringtotop = true
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;dw_diag1.accepttext()
dw_diag2.accepttext()
dw_diag3.accepttext()
dw_diag4.accepttext()


tab_1.tabpage_dep.dw_dep.accepttext()
tab_1.tabpage_plan.dw_plan.accepttext()


// Conversion des RTF
tab_1.tabpage_plan.dw_plan.setItem(1, "plan_traitement", string_To_Rtf(tab_1.tabpage_plan.dw_plan.getitemString(1, "patient_plan_traitement_html"), couleur_noire, couleur_blanche))
dw_diag3.setItem(1, "traitement_effectue", string_To_Rtf(dw_diag3.getitemString(1, "patient_traitement_effectue_html"), couleur_noire, couleur_blanche))

remplir_dep() 


if dw_diag1.update() = 1 and  dw_diag2.update() = 1 and  dw_diag3.update() = 1 and  dw_diag4.update() = 1 and  tab_1.tabpage_dep.dw_dep.update() = 1 and  tab_1.tabpage_plan.dw_plan.update() = 1 then
	commit ;
else
//	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+&
//	"Aucune modification ne sera prise en compte !",Exclamation!)
	Rollback ;
end if


end event

type cb_fermer from uo_picturebutton_390x120 within w_diagnostic_assistant
boolean visible = false
integer x = 5006
integer y = 3172
integer width = 562
integer taborder = 50
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_diag1.accepttext()
dw_diag2.accepttext()
dw_diag3.accepttext()
dw_diag4.accepttext()
tab_1.tabpage_dep.dw_dep.accepttext()
tab_1.tabpage_plan.dw_plan.accepttext()

//if enregistrement_automatique and cb_enregistrer.enabled then
//	// placé dans le close
//	//cb_enregistrer.triggerevent(clicked!)
//	
//	close(parent)
//else
	if dw_diag1.modifiedcount() > 0 or dw_diag1.deletedcount()>0 or  dw_diag2.modifiedcount() > 0 or dw_diag2.deletedcount()>0 or dw_diag3.modifiedcount() > 0 or dw_diag3.deletedcount()>0 or &
	dw_diag4.modifiedcount() > 0 or dw_diag4.deletedcount()>0 or tab_1.tabpage_dep.dw_dep.modifiedcount() > 0 or tab_1.tabpage_dep.dw_dep.deletedcount()>0 or tab_1.tabpage_plan.dw_plan.modifiedcount() > 0 or tab_1.tabpage_plan.dw_plan.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			Close(parent)
		end if
	else
		close(parent)
	end if
//end if
end event

type dw_diag_liste1 from datawindow within w_diagnostic_assistant
string tag = "no resize brush"
integer x = 297
integer y = 64
integer width = 1806
integer height = 876
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string dataobject = "dw_diagnostic_choix"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;// Si tout le texte dans la zone "Diagnostic" est sélectionné 
// Alors on remplace tout et on met le diagnostic cliqué
// Sinon si rien sélectionné
//			alors rajouter à la suite le diagnostic
//			sinon si début de texte sélectionné
//					alors on remet la fin du texte + le diagnostic cliqué
//					sinon (fin de texte sélectionné) on remet le début du texte + le diagnostic cliqué

string texte ,  texte_diag , texte_final
string texte_selectionne
string v_zone_diag

integer v_position_point_intersion

choose case diag_courant
	case "S"
		v_zone_diag = "patient_traitement_effectue_html"
		v_position_point_intersion =  dw_diag3.position()
	case "D"
		v_zone_diag  = "patient_diag_dentaire_html"
		v_position_point_intersion =  dw_diag1.position()
end choose

this.accepttext()

if this.rowcount() > 0 then
	
	
	if this.GetItemString(row,"selection") = "N" then		// faut tester l'inverse car valeur pas encore mise à jour

		texte = this.GetItemString(row,"texte_html")
			
		if diag_courant = "D" then 
			dw_diag1.accepttext()
			texte_diag = dw_diag1.GetItemString(dw_diag1.GetRow(), v_zone_diag )
			texte_selectionne = dw_diag1.SelectedText()
		else
			dw_diag3.accepttext()
			texte_diag = dw_diag3.GetItemString(dw_diag3.GetRow(), v_zone_diag )
			texte_selectionne = dw_diag3.SelectedText()
		end if
		
		if  IsNull(texte_diag) then
			 texte_diag = ""
		end if
		
		IF texte_diag = texte_selectionne or len(trim(texte_diag)) = 0 THEN
			// On remplace
			texte_final = texte
		ELSE	
			// On ajoute en tenant compte du point d'insertion (depuis 2019)
			// texte_final = texte_diag  + texte
			texte_final = left(texte_diag,v_position_point_intersion - 1)   + texte + right(texte_diag, len(texte_diag) - v_position_point_intersion + 1) 
END IF
		
		
		if diag_courant = "D" then 
			dw_diag1.SetItem(dw_diag1.GetRow(),v_zone_diag,texte_final)
			// pour replacer le point d'insertion à la fin du texte
			dw_diag1.SelectText ( len(texte_final) + 1, 0 ) 
			dw_diag1.Setfocus()
		else
			dw_diag3.SetItem(dw_diag3.GetRow(),v_zone_diag,texte_final)
			// pour replacer le point d'insertion à la fin du texte
			dw_diag3.SelectText ( len(texte_final) + 1, 0 ) 
			dw_diag3.Setfocus()
		end if
	end if
	
end if


end event

type uo_1 from resize_fenetre within w_diagnostic_assistant
boolean visible = false
integer x = 699
integer y = 2940
integer taborder = 30
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type st_temps from statictext within w_diagnostic_assistant
boolean visible = false
integer x = 3570
integer y = 1624
integer width = 576
integer height = 108
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 15780518
boolean enabled = false
string text = "Etape de traitement :"
boolean focusrectangle = false
end type

type dw_liste_images_un_patient from datawindow within w_diagnostic_assistant
boolean visible = false
integer x = 4206
integer y = 1012
integer width = 859
integer height = 748
integer taborder = 140
boolean bringtotop = true
string title = "none"
string dataobject = "dw_liste_images_un_patient"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_diag_liste2 from datawindow within w_diagnostic_assistant
string tag = "no resize brush"
integer x = 3255
integer y = 144
integer width = 1806
integer height = 876
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string dataobject = "dw_diagnostic_choix"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;// Si tout le texte dans la zone "Diagnostic" est sélectionné 
// Alors on remplace tout et on met le diagnostic cliqué
// Sinon si rien sélectionné
//			alors rajouter à la suite le diagnostic
//			sinon si début de texte sélectionné
//					alors on remet la fin du texte + le diagnostic cliqué
//					sinon (fin de texte sélectionné) on remet le début du texte + le diagnostic cliqué

string texte ,  texte_diag , texte_final
string texte_selectionne
string v_zone_diag
integer v_position_point_intersion

choose case diag_courant
	case "D"
		v_zone_diag = "patient_diag_alveolaire_html"
		v_position_point_intersion =  dw_diag2.position()
	case "S"
		v_zone_diag = "patient_diag_fonctionnel_html"
		v_position_point_intersion =  dw_diag4.position()
end choose

this.accepttext()

if this.rowcount() > 0 then
	
	if this.GetItemString(row,"selection") = "N" then		// faut tester l'inverse car valeur pas encore mise à jour

		texte = this.GetItemString(row,"texte_html")
			
		
		if diag_courant = "D" then 
			dw_diag2.accepttext()
			texte_diag = dw_diag2.GetItemString(dw_diag2.GetRow(), v_zone_diag )
			texte_selectionne = dw_diag2.SelectedText()
		else
			dw_diag4.accepttext()
			texte_diag = dw_diag4.GetItemString(dw_diag4.GetRow(), v_zone_diag )
			texte_selectionne = dw_diag4.SelectedText()
		end if
		
		
		
		if  IsNull(texte_diag) then
			 texte_diag = ""
		end if
		
		IF texte_diag = texte_selectionne or len(trim(texte_diag)) = 0 THEN
			texte_final = texte
		ELSE	
			// On ajoute en tenant compte du point d'insertion (depuis 2019)
			// texte_final = texte_diag  + texte
			texte_final = left(texte_diag,v_position_point_intersion - 1)   + texte + right(texte_diag, len(texte_diag) - v_position_point_intersion + 1) 
		END IF
		
		
		if diag_courant = "D" then 
			dw_diag2.SetItem(dw_diag2.GetRow(),v_zone_diag,texte_final)
			// pour replacer le point d'insertion à la fin du texte
			dw_diag2.SelectText ( len(texte_final) + 1, 0 ) 
			dw_diag2.Setfocus()

		else
			dw_diag4.SetItem(dw_diag4.GetRow(),v_zone_diag,texte_final)
			// pour replacer le point d'insertion à la fin du texte
			dw_diag4.SelectText ( len(texte_final) + 1, 0 ) 
			dw_diag4.Setfocus()
		end if
	end if
	
end if


end event

type rb_4 from radiobutton within w_diagnostic_assistant
string tag = "no resize"
integer x = 2432
integer y = 1024
integer width = 457
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "4 Diagnostics"
end type

event clicked;diag_courant("4")
end event

type dw_diag2 from datawindow within w_diagnostic_assistant
string tag = "brush no resizeall"
integer x = 293
integer y = 596
integer width = 1879
integer height = 956
integer taborder = 30
boolean bringtotop = true
string title = "Diagnostic Alvéolaire"
string dataobject = "dw_assistant_diagnostic_alveolaire"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//if enregistrement_automatique and cb_enregistrer.enabled then
//	cb_enregistrer.triggerevent(clicked!)
//end if
end event

event retrieveend;// pour replacer le point d'insertion à la fin du texte
string texte
texte = GetItemString(GetRow(), 2 )
SelectText ( len(texte) + 1, 0 ) 
Setfocus()

end event

type dw_diag3 from datawindow within w_diagnostic_assistant
string tag = "brush no resizeall"
integer x = 2226
integer y = 2164
integer width = 1879
integer height = 956
integer taborder = 40
boolean bringtotop = true
string title = "Diagnostic Squelettique"
string dataobject = "dw_assistant_diagnostic_squelettique"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//if enregistrement_automatique and cb_enregistrer.enabled then
//	cb_enregistrer.triggerevent(clicked!)
//end if
end event

event retrieveend;// pour replacer le point d'insertion à la fin du texte
string texte
texte = GetItemString(GetRow(), 2 )
SelectText ( len(texte) + 1, 0 ) 
Setfocus()

end event

type dw_diag4 from datawindow within w_diagnostic_assistant
string tag = "brush no resizeall"
integer x = 3429
integer y = 2144
integer width = 1879
integer height = 956
integer taborder = 50
boolean bringtotop = true
string title = "Diagnostic Fonctionnel"
string dataobject = "dw_assistant_diagnostic_fonctionnel"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;//if enregistrement_automatique and cb_enregistrer.enabled then
//	cb_enregistrer.triggerevent(clicked!)
//end if
end event

event retrieveend;// pour replacer le point d'insertion à la fin du texte
string texte
texte = GetItemString(GetRow(), 2 )
SelectText ( len(texte) + 1, 0 ) 
Setfocus()

end event

type st_etat_images from statictext within w_diagnostic_assistant
integer x = 261
integer y = 1340
integer width = 526
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 65535
string text = "none"
alignment alignment = center!
boolean focusrectangle = false
end type

type pb_suivant from uo_picturebutton_transparent within w_diagnostic_assistant
integer x = 1102
integer y = 1448
integer width = 110
integer height = 96
integer taborder = 150
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-D.png"
string powertiptext = "Jour suivant (où vous avez saisi des rendez-vous)"
end type

event clicked;call super::clicked;if page_courante * nb_images_affichables + 1 <=  nb_images_trouvees then
	page_courante = page_courante + 1 
	affiche_page(page_courante)
end if
end event

type pb_precedent from uo_picturebutton_transparent within w_diagnostic_assistant
integer x = 919
integer y = 1496
integer width = 110
integer height = 96
integer taborder = 160
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-G.png"
string powertiptext = "Jour précédent (où vous avez saisi des rendez-vous)"
end type

event clicked;call super::clicked;if page_courante > 1 then
	page_courante = page_courante - 1 
	affiche_page(page_courante)
end if
end event

type tab_1 from tab within w_diagnostic_assistant
event create ( )
event destroy ( )
string tag = "no resize all"
integer x = 640
integer y = 816
integer width = 3456
integer height = 2020
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean fixedwidth = true
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tabpage_plan tabpage_plan
tabpage_dep tabpage_dep
end type

on tab_1.create
this.tabpage_plan=create tabpage_plan
this.tabpage_dep=create tabpage_dep
this.Control[]={this.tabpage_plan,&
this.tabpage_dep}
end on

on tab_1.destroy
destroy(this.tabpage_plan)
destroy(this.tabpage_dep)
end on

type tabpage_plan from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3419
integer height = 1892
long backcolor = 67108864
string text = "Traitement"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_histo p_histo
cb_historique cb_historique
cb_enregistrer_historique cb_enregistrer_historique
dw_plan dw_plan
end type

on tabpage_plan.create
this.p_histo=create p_histo
this.cb_historique=create cb_historique
this.cb_enregistrer_historique=create cb_enregistrer_historique
this.dw_plan=create dw_plan
this.Control[]={this.p_histo,&
this.cb_historique,&
this.cb_enregistrer_historique,&
this.dw_plan}
end on

on tabpage_plan.destroy
destroy(this.p_histo)
destroy(this.cb_historique)
destroy(this.cb_enregistrer_historique)
destroy(this.dw_plan)
end on

type p_histo from picture within tabpage_plan
integer x = 2021
integer y = 1644
integer width = 146
integer height = 128
boolean bringtotop = true
boolean originalsize = true
string picturename = "lc_histo_dossier.png"
boolean border = true
boolean focusrectangle = false
string powertiptext = "Il y a des valeurs en historique"
end type

type cb_historique from uo_picturebutton_390x120 within tabpage_plan
integer x = 1586
integer y = 1636
integer taborder = 70
boolean bringtotop = true
string text = "Historique"
end type

event clicked;call super::clicked;openwithparm(w_historique_traitement_liste,var_code_local)

// pour effacer l'icone si on a supprimé des historique 
init_icone_histo()
end event

type cb_enregistrer_historique from uo_picturebutton_780x120 within tabpage_plan
integer x = 718
integer y = 1636
integer taborder = 60
boolean bringtotop = true
string text = "Enreg. Historique"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

fxg_enregistrement_historique_traitement(var_code_local, tab_1.tabpage_plan.dw_plan, tab_1.tabpage_dep.dw_dep, dw_diag1, dw_diag2, dw_diag3, dw_diag4)



// pour reset icone si on a enregistré l' historique 
init_icone_histo()

end event

type dw_plan from datawindow within tabpage_plan
string tag = "brush no resize"
integer x = 9
integer y = 48
integer width = 3392
integer height = 1544
integer taborder = 180
string title = "none"
string dataobject = "dw_patient_plan"
boolean border = false
boolean livescroll = true
end type

event rbuttondown;string nom
String nom_colonne

nom_colonne = this.getColumnName()

// Si le curseur est dans le champ "Plan de traitement"
// Alors on affiche la datawindow pour pouvoir choisir un nouveau plan de ttt
// Sinon on affiche la datawindow pour pouvoir choisir un nouveau diagnostic
//       si le curseur est dans le champ "Diagnostic"


IF nom_colonne = "patient_plan_traitement_html" or nom_colonne = "plan_complement_html"  THEN
	dw_liste_plan.SetTransObject(SQLCA)
	dw_liste_plan.Retrieve()
	dw_liste_plan.visible = TRUE
END IF


end event

event buttonclicked;string	ls_Object
string	ls_win

ls_Object = String(dwo.name)




choose case ls_Object
		
	case "b_schema"
		if row > 0 then
			param_win[1] = "E"
			openWithParm(w_schema, GetItemString(1, "patient_extraction"))


			// recup de la valeur retournée
			string v_extraction 
			v_extraction = message.StringParm
			if v_extraction <> "-1" then
				SetItem(1, "patient_extraction", v_extraction)
			end if
		end if
		
	case "b_schema_dents_soins"
		if row > 0 then
			param_win[1] = "S"
			openWithParm(w_schema, GetItemString(1, "patient_dents_soins"))

			// recup de la valeur retournée
			string v_dents_soins 
			v_dents_soins = message.StringParm
			if v_dents_soins <> "-1" then
				SetItem(1, "patient_dents_soins", v_dents_soins)
			end if
		end if
		
		
		
end choose
end event

type tabpage_dep from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3419
integer height = 1892
long backcolor = 67108864
string text = "DEP"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_dep dw_dep
end type

on tabpage_dep.create
this.dw_dep=create dw_dep
this.Control[]={this.dw_dep}
end on

on tabpage_dep.destroy
destroy(this.dw_dep)
end on

type dw_dep from datawindow within tabpage_dep
string tag = "brush no resize"
integer x = 27
integer y = 40
integer width = 3369
integer height = 1836
integer taborder = 50
boolean bringtotop = true
string title = "Demande d~'Entente Préalable"
string dataobject = "dw_patient_fiche6"
boolean border = false
end type

type gb_choix from groupbox within w_diagnostic_assistant
string tag = "no resize"
integer x = 315
integer y = 960
integer width = 2578
integer height = 164
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Choix du diagnostic"
end type

type gb_temps from groupbox within w_diagnostic_assistant
string tag = "no resize"
integer x = 2725
integer y = 1224
integer width = 1257
integer height = 164
integer taborder = 150
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Etape de traitement"
end type

type dw_temps from datawindow within w_diagnostic_assistant
string tag = "no resize all"
integer x = 2793
integer y = 1288
integer width = 1125
integer height = 76
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_temps_traitement_cherche"
boolean border = false
boolean livescroll = true
end type

event itemchanged;if dw_temps.rowcount() > 0 then
	this.accepttext()
	charger_images(this.getItemNumber(1, "id"))
end if
end event

type pb_aide from uo_bouton_aide within w_diagnostic_assistant
string tag = "Assistant Diagnostic"
integer x = 5394
integer y = 2532
integer width = 155
integer height = 140
integer taborder = 140
boolean bringtotop = true
end type

on pb_aide.destroy
call uo_bouton_aide::destroy
end on

type dw_liste_plan from datawindow within w_diagnostic_assistant
string tag = "brush"
boolean visible = false
integer x = 3703
integer y = 1156
integer width = 1079
integer height = 896
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_plan_ttt_affichage"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;
//string texte
//
//texte = dw_plan.GetItemString(this.GetRow(),"texte")
//dw_traitement.SetItem(dw_traitement.GetRow(),"plan_traitement",texte)
//
//
//this.visible = FALSE


// Si tout le texte dans la zone "Plan de traitement" est sélectionné 
// Alors on remplace tout et on met le plan de traitement cliqué
// Sinon si rien sélectionné
//			alors rajouter à la suite le plan de traitement
//			sinon si début de texte sélectionné
//					alors on remet la fin du texte + le plan de traitement cliqué
//					sinon (fin de texte sélectionné) on remet le début du texte + le plan de traitement cliqué


string texte ,  texte_plan , texte_final
string texte_selectionne
char c = "~n"
char r = "~r"


if this.rowcount() > 0 then
	
		long colonne_courante
		
		colonne_courante = tab_1.tabpage_plan.dw_plan.GetColumn()
		
		string texte_deja
	
		// On travaille uniquement sur les textes bruts depuis 18.02a car ça pose trop de pb (orthosmile !!)
	
		texte = this.GetItemString(this.GetRow(),"texte_html")
			
		texte_deja = tab_1.tabpage_plan.dw_plan.GetItemString(1, colonne_courante)
	
		texte_selectionne = tab_1.tabpage_plan.dw_plan.SelectedText()
		
		if  IsNull(texte_deja) then
			 texte_deja = ""
		end if
		
		IF texte_deja = texte_selectionne or len(trim(texte_deja)) = 0 THEN
			texte_final =  texte
		ELSE	
			texte_final = texte_deja  + texte
		END IF
		
		tab_1.tabpage_plan.dw_plan.SetItem(1,colonne_courante,texte_final)
	end if
	

this.visible = FALSE
end event

event rbuttondown;this.visible = FALSE
end event

type uo_icones from uo_icones_alertes_patient within w_diagnostic_assistant
event destroy ( )
string tag = "no resize"
integer x = 14
integer y = 3080
integer taborder = 90
boolean bringtotop = true
end type

on uo_icones.destroy
call uo_icones_alertes_patient::destroy
end on

type pb_moulage from picturebutton within w_diagnostic_assistant
boolean visible = false
integer x = 1349
integer y = 3164
integer width = 183
integer height = 160
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_moulage.png"
alignment htextalign = left!
string powertiptext = "Ouverture du moulage numérique"
long backcolor = 553648127
end type

event clicked;string rep_photo, chemin_complet

rep_photo = fxg_get_rep_photos()
chemin_complet = rep_photo + string( var_code_local ) + win_delimiter + this.tag


fxg_ouvrir_fichier_shell(chemin_complet)

end event

type cb_rafraichir_imagerie from picturebutton within w_diagnostic_assistant
integer x = 4951
integer y = 1884
integer width = 174
integer height = 152
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_reload.png"
alignment htextalign = left!
string powertiptext = "Actualisation de l~'imagerie"
long backcolor = 553648127
end type

event clicked;// pour charger les images
dw_liste_images_un_patient.retrieve(var_code_local)
dw_temps.triggerevent(itemchanged!)

	
	
	


end event

