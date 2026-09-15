$PBExportHeader$w_selection_photos.srw
forward
global type w_selection_photos from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_selection_photos
end type
type lb_photos from listbox within w_selection_photos
end type
type ole_previsu from gearbox within w_selection_photos
end type
type rb_chrono from radiobutton within w_selection_photos
end type
type rb_chrono_inverse from radiobutton within w_selection_photos
end type
type gb_1 from groupbox within w_selection_photos
end type
type gb_tri from groupbox within w_selection_photos
end type
end forward

global type w_selection_photos from w_fenetre_arakis
integer width = 3666
integer height = 2244
string title = ""
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_fermer pb_fermer
lb_photos lb_photos
ole_previsu ole_previsu
rb_chrono rb_chrono
rb_chrono_inverse rb_chrono_inverse
gb_1 gb_1
gb_tri gb_tri
end type
global w_selection_photos w_selection_photos

type variables

// Patient courant
double var_code_local
string v_nom, v_prenom
double v_numero_dossier


// liste des fichiers photos correspondant à la List Box
string liste_fichiers[]


// nombre de fichiers trouvés
long nombre_fichiers_trouves


// Passé en paramètres
str_patient v_patient


end variables

forward prototypes
public function integer remplir_liste (character v_ordre)
end prototypes

public function integer remplir_liste (character v_ordre);// remplissage de la liste selon l'ordre voulu
// v_ordre = "C" pour chronologique "I" pour inversé
// Renvoie le nombre de fichiers trouvés

long nb_photos 
integer n
string description_a_charger, nbr_du_nom
string nom_cadre, v_nom_fichier, v_nom_fichier_complet, rep_photos_patient
date v_date_acquis
string v_lib_date

nombre_fichiers_trouves = 0


 DECLARE cur_images CURSOR FOR  
  SELECT isnull("type_image"."libelle",'?'),   
		isnull("temps_traitement"."libelle",'?'),   
		"images_infos"."nom_fichier"  , "images_infos"."date_acquis" 
 FROM {oj "temps_traitement" RIGHT OUTER JOIN "images_infos" ON "temps_traitement"."id" = "images_infos"."temps_traitement"}, 
 {oj "type_image" RIGHT OUTER JOIN "images_infos" ON "type_image"."id" = "images_infos"."type_image"}  
 where "images_infos"."code" = :var_code_local   
 ORDER BY  "images_infos"."date_acquis" , "temps_traitement"."ordre_trie" , "type_image"."ordre_trie" , "images_infos"."nom_fichier";


 DECLARE cur_images_inverse CURSOR FOR  
  SELECT isnull("type_image"."libelle",'?'),   
		isnull("temps_traitement"."libelle",'?'),   
		"images_infos"."nom_fichier"  , "images_infos"."date_acquis" 
 FROM {oj "temps_traitement" RIGHT OUTER JOIN "images_infos" ON "temps_traitement"."id" = "images_infos"."temps_traitement"}, 
 {oj "type_image" RIGHT OUTER JOIN "images_infos" ON "type_image"."id" = "images_infos"."type_image"}  
 where "images_infos"."code" = :var_code_local   
 ORDER BY  "images_infos"."date_acquis" desc, "temps_traitement"."ordre_trie", "type_image"."ordre_trie" , "images_infos"."nom_fichier";

string v_lib_type, v_lib_temps

nombre_fichiers_trouves = 0

lb_photos.reset()


// ancienne imagerie
rep_photos_patient =  fxg_get_rep_photos( ) + string(var_code_local) + win_delimiter

if v_ordre = "C" then
	open cur_images ;
	Fetch cur_images into :v_lib_type, :v_lib_temps, :v_nom_fichier, :v_date_acquis ;
else
	open cur_images_inverse ;
	Fetch cur_images_inverse into :v_lib_type, :v_lib_temps, :v_nom_fichier, :v_date_acquis ;
end if


do while sqlca.sqlcode = 0

	v_nom_fichier_complet = rep_photos_patient + v_nom_fichier
	
	if fileExists(v_nom_fichier_complet) then
		nombre_fichiers_trouves = nombre_fichiers_trouves + 1
	
		// en principe oui mais ...
		liste_fichiers[nombre_fichiers_trouves] = v_nom_fichier_complet
		
		if  v_lib_type = '?' then
			v_lib_type = gfx_fichier_sans_extension(v_nom_fichier)
		end if
		
		if  v_lib_temps = '?' then
			v_lib_temps = gfx_fichier_sans_extension(v_nom_fichier)
		end if
		
		if isnull(v_date_acquis) then
			v_lib_date = "?"
		else
			v_lib_date = string(v_date_acquis)
		end if
		if v_lib_type <> '?' and v_lib_temps <> '?' then
			lb_photos.AddItem(v_lib_type + " - " + v_lib_temps + " ("+ v_lib_date + ")" )
		end if
		
	end if
	
	if v_ordre = "C" then
		Fetch cur_images into :v_lib_type, :v_lib_temps, :v_nom_fichier, :v_date_acquis ;
	else
		Fetch cur_images_inverse into :v_lib_type, :v_lib_temps, :v_nom_fichier, :v_date_acquis ;
	end if
loop


if v_ordre = "C" then
	close cur_images ;
else
	close cur_images_inverse ;
end if



return nombre_fichiers_trouves	
end function

on w_selection_photos.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.lb_photos=create lb_photos
this.ole_previsu=create ole_previsu
this.rb_chrono=create rb_chrono
this.rb_chrono_inverse=create rb_chrono_inverse
this.gb_1=create gb_1
this.gb_tri=create gb_tri
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.lb_photos
this.Control[iCurrent+3]=this.ole_previsu
this.Control[iCurrent+4]=this.rb_chrono
this.Control[iCurrent+5]=this.rb_chrono_inverse
this.Control[iCurrent+6]=this.gb_1
this.Control[iCurrent+7]=this.gb_tri
end on

on w_selection_photos.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.lb_photos)
destroy(this.ole_previsu)
destroy(this.rb_chrono)
destroy(this.rb_chrono_inverse)
destroy(this.gb_1)
destroy(this.gb_tri)
end on

event open;call super::open;// Récupération du patient

v_patient = Message.PowerObjectParm

var_code_local = v_patient.code

// Titre de la fenêtre
select isnull(nom,''), isnull(prenom,''), numero_dossier into :v_nom, :v_prenom, :v_numero_dossier
from patient 
where code = :var_code_local ;

this.title = "Sélection de photos pour "+v_nom+" "+v_prenom+" ("+string(v_numero_dossier)+")"


colore_tous_objets_window(this, couleur_fond_fenetre)


if profilestring(dir_ini+inifile_orthokis, "admini" , "email_selection_images", "C") = "C" then 
	rb_chrono.checked = true
	nombre_fichiers_trouves = remplir_liste("C")
else
	rb_chrono_inverse.checked = true
	nombre_fichiers_trouves = remplir_liste("I")
end if



// Récupération des images disponibles pour le patient ....

//long nb_photos 
//integer n
//string description_a_charger, nbr_du_nom
//string nom_cadre, v_nom_fichier, v_nom_fichier_complet, 
//date v_date_acquis
//string v_lib_date

//nombre_fichiers_trouves = 0

//string rep_photos_patient


//nombre_fichiers_trouves = remplir_liste("C")




//integer cpt_a_copier = 
	
// DECLARE cur_images CURSOR FOR  
//  SELECT isnull("type_image"."libelle",'?'),   
//		isnull("temps_traitement"."libelle",'?'),   
//		"images_infos"."nom_fichier"  , "images_infos"."date_acquis" 
// FROM {oj "temps_traitement" RIGHT OUTER JOIN "images_infos" ON "temps_traitement"."id" = "images_infos"."temps_traitement"}, 
// {oj "type_image" RIGHT OUTER JOIN "images_infos" ON "type_image"."id" = "images_infos"."type_image"}  
// where "images_infos"."code" = :var_code_local   
// ORDER BY  "temps_traitement"."ordre_trie" , "type_image"."ordre_trie" , "images_infos"."nom_fichier";

//string v_lib_type, v_lib_temps

//open cur_images ;

//nombre_fichiers_trouves = 0
//Fetch cur_images into :v_lib_type, :v_lib_temps, :v_nom_fichier, :v_date_acquis ;


//do while sqlca.sqlcode = 0

//	v_nom_fichier_complet = rep_photos_patient + v_nom_fichier
	
//	if fileExists(v_nom_fichier_complet) then
//		nombre_fichiers_trouves = nombre_fichiers_trouves + 1
	
//		// en principe oui mais ...
//		liste_fichiers[nombre_fichiers_trouves] = v_nom_fichier_complet
		
//		if  v_lib_type = '?' then
//			v_lib_type = gfx_fichier_sans_extension(v_nom_fichier)
//		end if
		
//		if  v_lib_temps = '?' then
//			v_lib_temps = gfx_fichier_sans_extension(v_nom_fichier)
//		end if
		
//		if isnull(v_date_acquis) then
//			v_lib_date = "?"
//		else
//			v_lib_date = string(v_date_acquis)
//		end if
//		if v_lib_type <> '?' and v_lib_temps <> '?' then
//			lb_photos.AddItem(v_lib_type + " - " + v_lib_temps + " ("+ v_lib_date + ")" )
//		end if
		
//	end if
	
//	Fetch cur_images into :v_lib_type, :v_lib_temps, :v_nom_fichier, :v_date_acquis ;
//loop


//close cur_images ;

// Si les fichiers sont déjà passés en pramètres (déà eu une première sélection) on les coche

long cpt , cpt_pj
boolean b_trouve

cpt_pj = 0
for cpt = 1 to nombre_fichiers_trouves
	// parcours de la list box ...
	// Si existe .. on sélection
	cpt_pj = 1
	b_trouve = false
	do while cpt_pj <=  upperbound(v_patient.fichiers_en_pj[]) and not b_trouve
		if v_patient.fichiers_en_pj[cpt_pj] =  liste_fichiers[cpt] then
			b_trouve = true
		end if
		cpt_pj = cpt_pj + 1
	loop 
	
	if b_trouve then
		 lb_photos.SetState(cpt, true)
	end if

next


gb_1.backcolor = couleur_fond_fenetre


pb_fermer.x = (this.width - pb_fermer.width)  / 2


end event

type p_fond from w_fenetre_arakis`p_fond within w_selection_photos
integer x = 1088
integer y = 1816
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_selection_photos
integer x = 1554
integer y = 1944
integer width = 571
integer height = 152
integer taborder = 10
boolean bringtotop = true
fontcharset fontcharset = ansi!
end type

event clicked;

// Mise à jour de la structure avec les PJ à mettre
long cpt , cpt_pj
string tab_nul[]

// Reset du tableau à renvoyer si plusieurs saisies
v_patient.fichiers_en_pj = tab_nul

cpt_pj = 0
for cpt = 1 to nombre_fichiers_trouves
	// parcours de la list box ...
	// Si sélectionné .. inscrit dans la structure en retour
	
	if lb_photos.state(cpt) = 1 then
		cpt_pj = cpt_pj + 1
		v_patient.fichiers_en_pj[cpt_pj] =  liste_fichiers[cpt]
	end if
next

if rb_chrono.checked then 
	Setprofilestring(dir_ini+inifile_orthokis, "admini" , "email_selection_images", "C")
else
	Setprofilestring(dir_ini+inifile_orthokis, "admini" , "email_selection_images", "I")
end if

closeWithReturn(parent, v_patient)
end event

type lb_photos from listbox within w_selection_photos
integer x = 37
integer y = 8
integer width = 2176
integer height = 1844
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
boolean multiselect = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;

// Prévisualisation
ole_previsu.visible = true
ole_previsu.charger_image(  liste_fichiers[index] )

end event

type ole_previsu from gearbox within w_selection_photos
integer x = 2391
integer y = 540
integer width = 887
integer height = 724
integer taborder = 40
boolean bringtotop = true
integer mode_ocx = 1
end type

event mousemove;//

end event

on ole_previsu.destroy
call gearbox::destroy
end on

type rb_chrono from radiobutton within w_selection_photos
integer x = 105
integer y = 1972
integer width = 457
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Chronologique"
end type

event clicked;if checked then 
	remplir_liste("C")
else
	remplir_liste("I")
end if
end event

type rb_chrono_inverse from radiobutton within w_selection_photos
integer x = 603
integer y = 1980
integer width = 663
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Chronologique inversé"
end type

event clicked;if checked then 
	remplir_liste("I")
else
	remplir_liste("C")
end if
end event

type gb_1 from groupbox within w_selection_photos
integer x = 2309
integer y = 444
integer width = 1029
integer height = 880
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Prévisualisation de l~'image"
end type

type gb_tri from groupbox within w_selection_photos
integer x = 37
integer y = 1876
integer width = 1298
integer height = 232
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Tri"
end type

