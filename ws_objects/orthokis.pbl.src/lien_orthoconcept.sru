$PBExportHeader$lien_orthoconcept.sru
forward
global type lien_orthoconcept from userobject
end type
type cb_fiche_labo from commandbutton within lien_orthoconcept
end type
type shl_fiche_labo from statichyperlink within lien_orthoconcept
end type
type cb_importer from commandbutton within lien_orthoconcept
end type
type cb_modifier from commandbutton within lien_orthoconcept
end type
type p_1 from picture within lien_orthoconcept
end type
end forward

global type lien_orthoconcept from userobject
integer width = 928
integer height = 200
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cb_fiche_labo cb_fiche_labo
shl_fiche_labo shl_fiche_labo
cb_importer cb_importer
cb_modifier cb_modifier
p_1 p_1
end type
global lien_orthoconcept lien_orthoconcept

type prototypes

end prototypes

type variables

// Contient les infos du patient
double var_code_local



end variables

forward prototypes
public subroutine gestion_orthoconcept (integer action)
end prototypes

public subroutine gestion_orthoconcept (integer action);// Paramètre :
//-------------------
//    1 = fiche labo
//    2 = voir les examens


// Paramètres à passer :
//Détail des paramètres à transmettre :
//-	Intitulé du cabinet (nom de la licence),
//-	Code postal,
//-	ID du docteur,											code_pratcien
//-	Nom du docteur,										nom praticien
//-	ID du patient, 											code interne Orthokis
//-	Nom du patient,
//-	Prénom du patient,
//-	Sexe du patient,
//-	Date de naissance du patient.
//

// recherche des éléments qui vont bien 
string v_nom_licence, v_code_postal
string v_prati_code, v_prati_nom, v_patient_nom, v_patient_prenom, v_patient_sexe
date v_patient_date_naissance 
 
// table param
select nom_licence, code_postal into :v_nom_licence, :v_code_postal from param where cle = 1 ;


do while isnull(v_code_postal) or len(trim(v_code_postal)) = 0 
	v_code_postal = inputbox("Code Postal non renseigné","Vous devez indiquer le Code Postal du Cabinet : ")
loop

// Table patient et praticien 

select prati.code, prati.nom, patient.nom, patient.prenom, patient.sexe, patient.date_naissance 
into :v_prati_code, :v_prati_nom, :v_patient_nom, :v_patient_prenom, :v_patient_sexe, :v_patient_date_naissance
from patient, prati 
where prati.code = patient.code_praticien and patient.code = :var_code_local ;

if isnull(v_patient_prenom) then v_patient_prenom = ''
if isnull(v_patient_sexe) then v_patient_sexe = ''
if isnull(v_patient_date_naissance) then v_patient_date_naissance = date("1900-01-01")


// Lancement du soft avec les param qui vont bien !!!
string parametres
string v_separateur = '" "'
parametres = '"'+v_nom_licence+v_separateur+v_code_postal + v_separateur + v_prati_code &
+ v_separateur + v_prati_nom + v_separateur +  string(var_code_local)+ v_separateur + v_patient_nom &
+ v_separateur + v_patient_prenom + v_separateur + v_patient_sexe + v_separateur + string(v_patient_date_naissance,'dd/mm/yyyy')+'"'

choose case action 
	case 1
//	// Lancement de la fiche labo
//	string fiche_labo_path, fiche_labo_exe
//	fiche_labo_path = ''			// La clef reprend tout .. path + exe
//	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Ortho-Concept","path",fiche_labo_exe)
//	if run(fiche_labo_path + fiche_labo_exe +" "+parametres ) <> 1 then
//		MessageBox("ATTENTION !","Impossible de lancer la Fiche Labo Ortho-Concept !~n~nVeuillez vérifier son installation.")
//	end if
	
	string url_string 
	// Depuis la version 14.03d ... lancement d'un lien hypertext
	url_string = "http://www.modelviewer3d.com/fichelabo.asp?"
	url_string = url_string  + "IDPatient=" + string(var_code_local)
	url_string = url_string  + "&NomPatient="+v_patient_nom 
	url_string = url_string  + "&PrenomPatient="+v_patient_prenom
	url_string = url_string  + "&DateNaissance="+string(v_patient_date_naissance,'dd/mm/yyyy')
	url_string = url_string  + "&NumClient="+v_code_postal
	url_string = url_string  + "&Cabinet="+v_nom_licence
	url_string = url_string  + "&Sexe="+v_patient_sexe
	
	
//	// On supprime les apostrophes => met un espace à la place
//	url_string = gfx_tout_remplacer (url_string , "'","%20")
//
//	// Faut virier les espaces et mettres de %20 à la place !!!
//	url_string = gfx_tout_remplacer (url_string , " ","%20")
//	
//	// Conversion des caractères spéciaux : à, é, è, ê, ë, ï
//	url_string = gfx_tout_remplacer (url_string , "à","a")
//	url_string = gfx_tout_remplacer (url_string , "ê","e")
//	url_string = gfx_tout_remplacer (url_string , "é","e")
//	url_string = gfx_tout_remplacer (url_string , "ë","e")
//	url_string = gfx_tout_remplacer (url_string , "è","e")
//	url_string = gfx_tout_remplacer (url_string , "ï","i")
//

	url_string = fxg_string_to_url(url_string)

	shl_fiche_labo.url = url_string
	
case 2
	// Lancement du viewer
	string viewer_path, viewer_exe
	RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Ortho-Concept\ModelViewer","path",viewer_exe)    // La clef reprend tout .. path + exe
	
	
	//RegistryGet("HKEY_LOCAL_MACHINE\SOFTWARE\Ortho-Concept\ModelViewer","directory",viewer_path)
	
	//viewer_path = "C:\Program Files\Ortho-Concept\ModelViewer\"

	// On doit lancer le soft dans son répertoire d'installation sinon ça merde
	//SetCurrentDirectoryA ( viewer_path )
	
	if run(viewer_exe +" "+parametres ) <> 1 then
		MessageBox("ATTENTION !","Impossible de lancer le Viewver Ortho-Concept !~n~nVeuillez vérifier son installation.")
	end if
	
	
	//SetCurrentDirectoryA(dir_ini)
end choose
	
end subroutine

on lien_orthoconcept.create
this.cb_fiche_labo=create cb_fiche_labo
this.shl_fiche_labo=create shl_fiche_labo
this.cb_importer=create cb_importer
this.cb_modifier=create cb_modifier
this.p_1=create p_1
this.Control[]={this.cb_fiche_labo,&
this.shl_fiche_labo,&
this.cb_importer,&
this.cb_modifier,&
this.p_1}
end on

on lien_orthoconcept.destroy
destroy(this.cb_fiche_labo)
destroy(this.shl_fiche_labo)
destroy(this.cb_importer)
destroy(this.cb_modifier)
destroy(this.p_1)
end on

type cb_fiche_labo from commandbutton within lien_orthoconcept
integer y = 108
integer width = 315
integer height = 80
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "F. Labo"
end type

event clicked;
// initialiser le lien URL


gestion_orthoconcept(1)


//run('cmd /C start "Ortho Concept" "' + shl_fiche_labo.url +'"')

openurl ( shl_fiche_labo.url)


// On ne sait pas si l'utilisateur l'a envoyé mais .. on n'a pas le choix ...
integer categorie_nulle
setnull(categorie_nulle)
fxg_enregcourrierhisto ( var_code_local , 'FICTRA' , today() , 'Fiche Labo', '' , 'E', 'N', 'N', '', categorie_nulle)

end event

type shl_fiche_labo from statichyperlink within lien_orthoconcept
integer x = 1038
integer y = 76
integer width = 293
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
string pointer = "HyperLink!"
long textcolor = 134217856
long backcolor = 67108864
string text = "Fiche Labo"
boolean focusrectangle = false
string url = "www;"
end type

type cb_importer from commandbutton within lien_orthoconcept
integer x = 626
integer y = 108
integer width = 293
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Importer"
end type

event clicked;w_import_orthoconcept 	w_acquis
openwithparm(w_acquis, var_code_local)

end event

type cb_modifier from commandbutton within lien_orthoconcept
integer x = 311
integer y = 108
integer width = 315
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Visualiser"
end type

event clicked;gestion_orthoconcept(2)
end event

type p_1 from picture within lien_orthoconcept
integer x = 87
integer width = 731
integer height = 140
string picturename = "lc_orthoconcept.jpg"
boolean focusrectangle = false
end type

