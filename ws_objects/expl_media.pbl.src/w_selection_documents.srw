$PBExportHeader$w_selection_documents.srw
forward
global type w_selection_documents from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_selection_documents
end type
type lb_photos from listbox within w_selection_documents
end type
type rb_chrono from radiobutton within w_selection_documents
end type
type rb_chrono_inverse from radiobutton within w_selection_documents
end type
type gb_tri from groupbox within w_selection_documents
end type
end forward

global type w_selection_documents from w_fenetre_arakis
integer width = 2286
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
rb_chrono rb_chrono
rb_chrono_inverse rb_chrono_inverse
gb_tri gb_tri
end type
global w_selection_documents w_selection_documents

type variables

// Patient courant
double var_code_local
string v_nom, v_prenom
double v_numero_dossier


// liste des fichiers  correspondant à la List Box
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

string v_libelle, v_nom_fichier, v_nom_fichier_complet, rep_photos_patient
date v_date_document
string v_lib_date


// ancienne imagerie
rep_photos_patient =  fxg_get_rep_photos( ) + string(var_code_local) + win_delimiter

lb_photos.reset()
	
 DECLARE cur_documents CURSOR FOR  
  SELECT isnull("libelle",'?'),    nom_courrier , date_document
 FROM historique_editions
 where "code" = :var_code_local   and isnull(nom_courrier, '') <> '' and nature <> 'A' 
 ORDER BY date_document, date_modif   ;
 
 	
 DECLARE cur_documents_inverse CURSOR FOR  
  SELECT isnull("libelle",'?'),    nom_courrier , date_document
 FROM historique_editions
 where "code" = :var_code_local   and isnull(nom_courrier, '') <> '' and nature <> 'A' 
 ORDER BY date_document desc, date_modif desc  ;

string v_lib_type, v_lib_temps

nombre_fichiers_trouves = 0

if v_ordre = "C" then
	open cur_documents ;
	Fetch cur_documents into  :v_libelle, :v_nom_fichier, :v_date_document ;
else
	open cur_documents_inverse ;
	Fetch cur_documents_inverse into  :v_libelle, :v_nom_fichier, :v_date_document ;
end if


do while sqlca.sqlcode = 0

	v_nom_fichier_complet = rep_photos_patient + v_nom_fichier
	
	if fileExists(v_nom_fichier_complet) then
		nombre_fichiers_trouves = nombre_fichiers_trouves + 1
	
		liste_fichiers[nombre_fichiers_trouves] = v_nom_fichier_complet
		
		lb_photos.AddItem(v_libelle + " - " + v_lib_temps + " ("+ string(v_date_document) + ")" )
		
	end if
	
	if v_ordre = "C" then
		Fetch cur_documents into  :v_libelle, :v_nom_fichier, :v_date_document ;
	else
		Fetch cur_documents_inverse into  :v_libelle, :v_nom_fichier, :v_date_document ;
	end if
loop

if v_ordre = "C" then 
	close cur_documents ;
else
	close cur_documents_inverse ;
end if


return nombre_fichiers_trouves 
end function

on w_selection_documents.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.lb_photos=create lb_photos
this.rb_chrono=create rb_chrono
this.rb_chrono_inverse=create rb_chrono_inverse
this.gb_tri=create gb_tri
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.lb_photos
this.Control[iCurrent+3]=this.rb_chrono
this.Control[iCurrent+4]=this.rb_chrono_inverse
this.Control[iCurrent+5]=this.gb_tri
end on

on w_selection_documents.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.lb_photos)
destroy(this.rb_chrono)
destroy(this.rb_chrono_inverse)
destroy(this.gb_tri)
end on

event open;call super::open;// Récupération du patient

v_patient = Message.PowerObjectParm

var_code_local = v_patient.code

// Titre de la fenêtre
select isnull(nom,''), isnull(prenom,''), numero_dossier into :v_nom, :v_prenom, :v_numero_dossier
from patient 
where code = :var_code_local ;

this.title = "Sélection de documents pour "+v_nom+" "+v_prenom+" ("+string(v_numero_dossier)+")"


colore_tous_objets_window(this, couleur_fond_fenetre)



if profilestring(dir_ini+inifile_orthokis, "admini" , "email_selection_documents", "C") = "C" then 
	rb_chrono.checked = true
	nombre_fichiers_trouves = remplir_liste("C")
else
	rb_chrono_inverse.checked = true
	nombre_fichiers_trouves = remplir_liste("I")
end if


// Récupération des images disponibles pour le patient ....

string v_libelle, v_nom_fichier, v_nom_fichier_complet, rep_photos_patient
date v_date_document
string v_lib_date



integer cpt_a_copier = 0





// Si les fichiers sont déjà passés en pramaètre (déà eu une première sélection) on les coche

long cpt , cpt_pj
boolean b_trouve

cpt_pj = 0
for cpt = 1 to nombre_fichiers_trouves
	// parcours de la list box ...
	// Si existe .. on sélection
	cpt_pj = 1
	b_trouve = false
	do while cpt_pj <=  upperbound(v_patient.fichiers_documents_en_pj[]) and not b_trouve
		if v_patient.fichiers_documents_en_pj[cpt_pj] =  liste_fichiers[cpt] then
			b_trouve = true
		end if
		cpt_pj = cpt_pj + 1
	loop 
	
	if b_trouve then
		 lb_photos.SetState(cpt, true)
	end if

next
	

end event

type p_fond from w_fenetre_arakis`p_fond within w_selection_documents
integer x = 1088
integer y = 1816
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_selection_documents
integer x = 1500
integer y = 1912
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
v_patient.fichiers_documents_en_pj = tab_nul

cpt_pj = 0
for cpt = 1 to nombre_fichiers_trouves
	// parcours de la list box ...
	// Si sélectionné .. inscrit dans la structure en retour
	
	if lb_photos.state(cpt) = 1 then
		cpt_pj = cpt_pj + 1
		v_patient.fichiers_documents_en_pj[cpt_pj] =  liste_fichiers[cpt]
	end if
next

if rb_chrono.checked then 
	Setprofilestring(dir_ini+inifile_orthokis, "admini" , "email_selection_documents", "C")
else
	Setprofilestring(dir_ini+inifile_orthokis, "admini" , "email_selection_documents", "I")
end if

closeWithReturn(parent, v_patient)
end event

type lb_photos from listbox within w_selection_documents
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

type rb_chrono from radiobutton within w_selection_documents
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

type rb_chrono_inverse from radiobutton within w_selection_documents
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

type gb_tri from groupbox within w_selection_documents
integer x = 37
integer y = 1876
integer width = 1298
integer height = 232
integer taborder = 60
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

