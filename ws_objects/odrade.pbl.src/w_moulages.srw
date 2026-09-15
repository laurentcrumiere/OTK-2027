$PBExportHeader$w_moulages.srw
forward
global type w_moulages from w_fenetre_arakis
end type
type cb_exporter from uo_picturebutton_390x120 within w_moulages
end type
type ddlb_gauche from dropdownlistbox within w_moulages
end type
type ddlb_droite from dropdownlistbox within w_moulages
end type
type ddlb_arriere from dropdownlistbox within w_moulages
end type
type ddlb_face from dropdownlistbox within w_moulages
end type
type ddlb_dessus from dropdownlistbox within w_moulages
end type
type cbx_gauche from checkbox within w_moulages
end type
type cbx_droite from checkbox within w_moulages
end type
type cbx_arriere from checkbox within w_moulages
end type
type cbx_face from checkbox within w_moulages
end type
type cbx_dessus from checkbox within w_moulages
end type
type st_4 from statictext within w_moulages
end type
type st_3 from statictext within w_moulages
end type
type st_2 from statictext within w_moulages
end type
type st_1 from statictext within w_moulages
end type
type st_droite from statictext within w_moulages
end type
type ole_arriere from gearbox within w_moulages
end type
type ole_dessus from gearbox within w_moulages
end type
type ole_droite from gearbox within w_moulages
end type
type ole_face from gearbox within w_moulages
end type
type uo_resize from resize_fenetre within w_moulages
end type
type ddlb_liste from dropdownlistbox within w_moulages
end type
type ole_gauche from gearbox within w_moulages
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_moulages
end type
type gb_1 from groupbox within w_moulages
end type
end forward

global type w_moulages from w_fenetre_arakis
integer width = 3291
integer height = 2200
string title = "Travail sur les Moulages d~'Odrade"
windowtype windowtype = response!
windowstate windowstate = maximized!
long backcolor = 15780518
cb_exporter cb_exporter
ddlb_gauche ddlb_gauche
ddlb_droite ddlb_droite
ddlb_arriere ddlb_arriere
ddlb_face ddlb_face
ddlb_dessus ddlb_dessus
cbx_gauche cbx_gauche
cbx_droite cbx_droite
cbx_arriere cbx_arriere
cbx_face cbx_face
cbx_dessus cbx_dessus
st_4 st_4
st_3 st_3
st_2 st_2
st_1 st_1
st_droite st_droite
ole_arriere ole_arriere
ole_dessus ole_dessus
ole_droite ole_droite
ole_face ole_face
uo_resize uo_resize
ddlb_liste ddlb_liste
ole_gauche ole_gauche
cb_fermer cb_fermer
gb_1 gb_1
end type
global w_moulages w_moulages

type variables


// pour trasmission de param aux fenetres filles
param_lien_odrade p


double var_code_local
double identifiant_odrade_local


// pour conserver les intitulés venant de Odrade
string tableau_intitules[]
end variables

forward prototypes
public subroutine exporter_moulage (gearbox ole_gear, dropdownlistbox ddlb_destination, string libelle)
public subroutine charger_moulages (integer indice)
public function string epure_libelle (string libelle)
end prototypes

public subroutine exporter_moulage (gearbox ole_gear, dropdownlistbox ddlb_destination, string libelle);security_attributes sa		//pour compatibilité winNT lors de création de directory
string vers_dossier_photo	//le rep photo\num_patient
string key						//le nom de la photo donnée par "pwophoto.INI"

vers_dossier_photo = dir_photos + string(var_code_local)

integer num_pour_save 
string num_fichier
string true_nom_fichier


string fichier_a_exporter

fichier_a_exporter = ole_gear.ole_image.object.loadimage 

// donne le "xxx" de depart des ole_photo"xxx"
num_pour_save = ddlb_destination.FindItem(ddlb_destination.text,0)


// on retrouve le futur nom qu'il va avoir ds notre rep photo(cf. pwophotos.ini)
num_fichier = num_nom_photo(num_pour_save)
true_nom_fichier = profilestring(dir_photos + inifile_photo, section, "ole_photo" + num_fichier,"")

if not fxg_FileExists(vers_dossier_photo) then CreateDirectoryA(vers_dossier_photo,sa)

vers_dossier_photo = vers_dossier_photo + win_delimiter + true_nom_fichier

if FileExists(vers_dossier_photo) then
	if messagebox("Attention ...", "Une image est déjà présente sur ce cadre. ~nPar conséquent l'acquisition entraînera la perte de cette image ! ~n~n Confirmez-vous ?", Exclamation!, OKCancel!) = 1 then
		//if ole_gear.acquis_fichier_photo(fichier_a_exporter,vers_dossier_photo ) <> 1 then goto erreur
		if ole_gear.importer_une_image(fichier_a_exporter,vers_dossier_photo ) <> 1 then goto erreur
	end if
else
//if ole_previsu.acquis_fichier_photo(path_fichier_image,vers_dossier_photo,ole_previsu) <> 1 then goto erreur
//	if ole_gear.acquis_fichier_photo(fichier_a_exporter,vers_dossier_photo ) <> 1 then goto erreur
	if ole_gear.importer_une_image(fichier_a_exporter,vers_dossier_photo ) <> 1 then goto erreur
end if

goto Fin
Erreur:
	messagebox("Attention !","Une erreur est survenue dans l'acquisition du moulage "+libelle)
Fin:
	//on sort directement après l'acquisition

return
end subroutine

public subroutine charger_moulages (integer indice);

// Charge les 5 images .. selon un intitules !!!




string nom_fichier_image, fichier_complet
integer numero_image


string intitule, intitule_odrade

intitule_odrade = conversion_char(ddlb_liste.text,"P")
intitule = epure_libelle(ddlb_liste.text)


// Cursor de parcours des radios

Declare cur_images Cursor for SELEct radios.nom_fichier , sous_groupe_image from radios , moulages 
where moulages.code_patient = :identifiant_odrade_local and moulages.intitule = :intitule_odrade and moulages.code_patient = radios.code_patient and 
moulages.groupe = radios.groupe and moulages.sous_groupe = radios.sous_groupe 
using t_odrade ;

open cur_images ;


fetch cur_images into :nom_fichier_image, :numero_image ;

do while t_odrade.sqlcode = 0 
	
//	messagebox("trace",string(numero_image)+"   ->   "+nom_fichier_image)
	
	// construction du nom complet de l'image
	fichier_complet= p.dossier_radio +"\"+string(identifiant_odrade_local)+"\radios\"+nom_fichier_image

	
	choose case numero_image
		case 1
			ole_dessus.charger_image(fichier_complet)
		case 2
			ole_face.charger_image(fichier_complet)
		case 3
			ole_arriere.charger_image(fichier_complet)
		case 4
			ole_droite.charger_image(fichier_complet)
		case 5
			ole_gauche.charger_image(fichier_complet)
	end choose
	
	fetch cur_images into :nom_fichier_image, :numero_image ;
	
loop 

close cur_images ;



	
// Lecture de la base de données pour les choix d'export par défaut


integer face,dessus, gauche, droite, arriere
string cadre_face,cadre_dessus, cadre_gauche, cadre_droite, cadre_arriere


// par_defaut, on sera sur le premier cadre
ddlb_dessus.selectitem(1)
cadre_face = ddlb_dessus.text
cadre_dessus = ddlb_dessus.text
cadre_gauche = ddlb_dessus.text
cadre_droite = ddlb_dessus.text
cadre_arriere = ddlb_dessus.text



select face,dessus, gauche, droite, arriere, cadre_face,cadre_dessus, cadre_gauche, cadre_droite, cadre_arriere
into :face,:dessus, :gauche, :droite, :arriere, :cadre_face,:cadre_dessus, :cadre_gauche, :cadre_droite, :cadre_arriere
from export_moulages 
where intitule = :intitule ;

if face = 1 then
	cbx_face.checked = true
else
	cbx_face.checked = false
end if

if dessus = 1 then
	cbx_dessus.checked = true
else
	cbx_dessus.checked = false
end if

if arriere = 1 then
	cbx_arriere.checked = true
else
	cbx_arriere.checked = false
end if

if gauche = 1 then
	cbx_gauche.checked = true
else
	cbx_gauche.checked = false
end if

if droite = 1 then
	cbx_droite.checked = true
else
	cbx_droite.checked = false
end if



ddlb_face.selectitem(cadre_face,0)
ddlb_dessus.selectitem(cadre_dessus,0)
ddlb_arriere.selectitem(cadre_arriere,0)
ddlb_gauche.selectitem(cadre_gauche,0)
ddlb_droite.selectitem(cadre_droite,0)





return
end subroutine

public function string epure_libelle (string libelle);
//	Epure un libelle complet de moulage (vire le (x))
	
	string libelle_epure
	integer pos
	
	// on ne prend que ce qui est avant la chaine "(groupe)" et la suite
	//v_par = "("+string(groupe)+")"
	pos = pos(libelle, "(" )
	
	libelle_epure = trim(left(libelle,pos - 1))+" "+ trim(  mid (libelle , pos + 3 ) )
	
	
	return libelle_epure

end function

on w_moulages.create
int iCurrent
call super::create
this.cb_exporter=create cb_exporter
this.ddlb_gauche=create ddlb_gauche
this.ddlb_droite=create ddlb_droite
this.ddlb_arriere=create ddlb_arriere
this.ddlb_face=create ddlb_face
this.ddlb_dessus=create ddlb_dessus
this.cbx_gauche=create cbx_gauche
this.cbx_droite=create cbx_droite
this.cbx_arriere=create cbx_arriere
this.cbx_face=create cbx_face
this.cbx_dessus=create cbx_dessus
this.st_4=create st_4
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.st_droite=create st_droite
this.ole_arriere=create ole_arriere
this.ole_dessus=create ole_dessus
this.ole_droite=create ole_droite
this.ole_face=create ole_face
this.uo_resize=create uo_resize
this.ddlb_liste=create ddlb_liste
this.ole_gauche=create ole_gauche
this.cb_fermer=create cb_fermer
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_exporter
this.Control[iCurrent+2]=this.ddlb_gauche
this.Control[iCurrent+3]=this.ddlb_droite
this.Control[iCurrent+4]=this.ddlb_arriere
this.Control[iCurrent+5]=this.ddlb_face
this.Control[iCurrent+6]=this.ddlb_dessus
this.Control[iCurrent+7]=this.cbx_gauche
this.Control[iCurrent+8]=this.cbx_droite
this.Control[iCurrent+9]=this.cbx_arriere
this.Control[iCurrent+10]=this.cbx_face
this.Control[iCurrent+11]=this.cbx_dessus
this.Control[iCurrent+12]=this.st_4
this.Control[iCurrent+13]=this.st_3
this.Control[iCurrent+14]=this.st_2
this.Control[iCurrent+15]=this.st_1
this.Control[iCurrent+16]=this.st_droite
this.Control[iCurrent+17]=this.ole_arriere
this.Control[iCurrent+18]=this.ole_dessus
this.Control[iCurrent+19]=this.ole_droite
this.Control[iCurrent+20]=this.ole_face
this.Control[iCurrent+21]=this.uo_resize
this.Control[iCurrent+22]=this.ddlb_liste
this.Control[iCurrent+23]=this.ole_gauche
this.Control[iCurrent+24]=this.cb_fermer
this.Control[iCurrent+25]=this.gb_1
end on

on w_moulages.destroy
call super::destroy
destroy(this.cb_exporter)
destroy(this.ddlb_gauche)
destroy(this.ddlb_droite)
destroy(this.ddlb_arriere)
destroy(this.ddlb_face)
destroy(this.ddlb_dessus)
destroy(this.cbx_gauche)
destroy(this.cbx_droite)
destroy(this.cbx_arriere)
destroy(this.cbx_face)
destroy(this.cbx_dessus)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.st_droite)
destroy(this.ole_arriere)
destroy(this.ole_dessus)
destroy(this.ole_droite)
destroy(this.ole_face)
destroy(this.uo_resize)
destroy(this.ddlb_liste)
destroy(this.ole_gauche)
destroy(this.cb_fermer)
destroy(this.gb_1)
end on

event open;call super::open;
// passage de paramètre ... 
p = Message.PowerObjectParm


var_code_local 			= 	p.code_patient
identifiant_odrade_local 	= 	p.identifiant_odrade


uo_resize.taille(this)

// On construit la liste des moulages !!


Declare Cur_Moulage CURSOR for Select moulages.intitule, moulages.groupe from moulages where moulages.groupe > 0 and moulages.sous_groupe > 0 and 
(select count(*) from radios where moulages.code_patient = :identifiant_odrade_local and moulages.groupe = radios.groupe and moulages.sous_groupe = radios.sous_groupe ) > 0 
and moulages.code_patient = :identifiant_odrade_local 
group by intitule ,  moulages.groupe ,  moulages.date_moulage 
order by moulages.date_moulage 
using t_odrade ;



open Cur_Moulage ;

string libelle ;
integer groupe
long pos
string v_par
integer cpt

cpt = 1

fetch Cur_Moulage into :libelle, :groupe ;

do while t_odrade.sqlcode = 0 

//	// mémo des libellé pour raffraichissement des cadres
//	tableau_intitules[cpt] = libelle
//	cpt = cpt + 1
//	
//	// on ne prend que ce qui est avant la chaine "(groupe)" et la suite
//	v_par = "("+string(groupe)+")"
//	pos = pos(libelle, v_par)
//	
//	libelle = trim(left(libelle,pos - 1))+" "+ trim(  mid (libelle , pos + len(v_par)) )
//	
	
	ddlb_liste.additem(conversion_char(libelle,'O'))
	
	fetch Cur_Moulage into :libelle, :groupe ;

loop
close  Cur_Moulage ;


if ddlb_liste.TotalItems() = 0 then
	
	Messagebox("ATTENTION !","Ce patient n'a pas de moulages dans Odrade !")
	close(this)
	
else
	


	// déclenche l'affichage des images
	ddlb_liste.triggerevent(selectionchanged!)

	// Mise en place des libellés dans les listes d'exportations
	
	//charge la ddlb avec les noms du fichiers pwophoto.INI
	LoadDdlbPhoto ( ddlb_dessus , string ( var_code_local ) )
	
	 copier_dropdownlistbox(ddlb_dessus, ddlb_face)
	 copier_dropdownlistbox(ddlb_dessus, ddlb_arriere)
	 copier_dropdownlistbox(ddlb_dessus, ddlb_droite)
	 copier_dropdownlistbox(ddlb_dessus, ddlb_gauche)
	

	// positionnement sur le premier
	ddlb_liste.selectitem(1)
	
	
	ddlb_dessus.selectitem(1)
	ddlb_face.selectitem(1)
	ddlb_arriere.selectitem(1)
	ddlb_droite.selectitem(1)
	ddlb_gauche.selectitem(1)

end if








end event

event resize;uo_resize.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_moulages
end type

type cb_exporter from uo_picturebutton_390x120 within w_moulages
integer x = 1765
integer y = 1940
integer width = 411
integer height = 152
integer taborder = 30
string text = "&Exporter"
end type

event clicked;call super::clicked;


integer face,dessus, gauche, droite, arriere
string cadre_face,cadre_dessus, cadre_gauche, cadre_droite, cadre_arriere

if cbx_dessus.checked then
	exporter_moulage(ole_dessus, ddlb_dessus,"dessus")
	dessus = 1
else
	dessus = 0
end if

if cbx_face.checked then
	exporter_moulage(ole_face, ddlb_face,"face")
	face = 1
else
	face = 0
end if

if cbx_droite.checked then
	exporter_moulage(ole_droite, ddlb_droite,"droite")
	droite = 1
else
	droite = 0
end if

if cbx_gauche.checked then
	exporter_moulage(ole_gauche, ddlb_gauche,"gauche")
	gauche = 1
else
	gauche = 0
end if

if cbx_arriere.checked then
	exporter_moulage(ole_arriere, ddlb_arriere,"arriere")
	arriere = 1
else
	arriere = 0
end if


// Mémorisation dans la base de données des choix fait par l'utilisateur


// y a t il déjà un enregistrement à ce nom ???

integer nb
nb = 0

string v_intitule

v_intitule = epure_libelle(ddlb_liste.text )


cadre_face = ddlb_face.text
cadre_dessus = ddlb_dessus.text
cadre_gauche = ddlb_gauche.text
cadre_droite = ddlb_droite.text
cadre_arriere = ddlb_arriere.text

select count(*) into :nb from export_moulages where intitule = :v_intitule ;

if nb = 0 then
	// insert
	  INSERT INTO "export_moulages"  
         ( "intitule",   
           "face",   
           "cadre_face",   
           "dessus",   
           "cadre_dessus",   
           "droite",   
           "cadre_droite",   
           "gauche",   
           "cadre_gauche",   
           "arriere",   
           "cadre_arriere" )  
  VALUES ( :v_intitule,   
           :face,   
           :cadre_face,   
           :dessus,   
           :cadre_dessus,   
           :droite,   
           :cadre_droite,   
           :gauche,   
           :cadre_gauche,   
           :arriere,   
           :cadre_arriere )  ;
	commit ;

else
	// update

		  UPDATE  "export_moulages"   set   "intitule" =  :v_intitule,  
            "face" = :face ,    "cadre_face" = :cadre_face,   "dessus" = :dessus,   
           "cadre_dessus" =   :cadre_dessus,    "droite" = :droite ,    "cadre_droite" = :cadre_droite ,
           "gauche" = :gauche,   "cadre_gauche" =  :cadre_gauche,    "arriere" = :arriere,  "cadre_arriere" = :cadre_arriere  
			  where intitule = :v_intitule ;
			  commit ;

	
	
end if

if face + arriere + droite + gauche + dessus = 0 then
	Messagebox("INFORMATION","Vous n'avez cocher aucun moulage à exporter !")
else
	Messagebox("INFORMATION","L'exportation a été réalisée !")
end if
	



end event

type ddlb_gauche from dropdownlistbox within w_moulages
integer x = 87
integer y = 1976
integer width = 1120
integer height = 636
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_droite from dropdownlistbox within w_moulages
integer x = 87
integer y = 1792
integer width = 1120
integer height = 636
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_arriere from dropdownlistbox within w_moulages
integer x = 82
integer y = 1612
integer width = 1120
integer height = 636
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_face from dropdownlistbox within w_moulages
integer x = 87
integer y = 1432
integer width = 1120
integer height = 636
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type ddlb_dessus from dropdownlistbox within w_moulages
integer x = 87
integer y = 1240
integer width = 1120
integer height = 636
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cbx_gauche from checkbox within w_moulages
integer x = 87
integer y = 1900
integer width = 338
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Gauche"
boolean checked = true
end type

type cbx_droite from checkbox within w_moulages
integer x = 87
integer y = 1716
integer width = 338
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Droite"
boolean checked = true
end type

type cbx_arriere from checkbox within w_moulages
integer x = 87
integer y = 1532
integer width = 338
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Arriere"
boolean checked = true
end type

type cbx_face from checkbox within w_moulages
integer x = 87
integer y = 1348
integer width = 338
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Face"
boolean checked = true
end type

type cbx_dessus from checkbox within w_moulages
integer x = 87
integer y = 1164
integer width = 338
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Dessus"
boolean checked = true
end type

type st_4 from statictext within w_moulages
integer x = 2496
integer y = 1792
integer width = 398
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Arrière"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_moulages
integer x = 1463
integer y = 976
integer width = 398
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Face"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_moulages
integer x = 1641
integer y = 1792
integer width = 398
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Dessus"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_moulages
integer x = 2523
integer y = 976
integer width = 398
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Gauche"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_droite from statictext within w_moulages
integer x = 233
integer y = 976
integer width = 398
integer height = 72
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Droite"
alignment alignment = center!
boolean focusrectangle = false
end type

type ole_arriere from gearbox within w_moulages
integer x = 2286
integer y = 1084
integer width = 818
integer height = 668
integer taborder = 10
end type

on ole_arriere.destroy
call gearbox::destroy
end on

type ole_dessus from gearbox within w_moulages
integer x = 1431
integer y = 1088
integer width = 818
integer height = 668
integer taborder = 30
end type

on ole_dessus.destroy
call gearbox::destroy
end on

type ole_droite from gearbox within w_moulages
integer x = 23
integer y = 156
integer width = 1065
integer height = 788
integer taborder = 20
end type

on ole_droite.destroy
call gearbox::destroy
end on

type ole_face from gearbox within w_moulages
integer x = 1106
integer y = 156
integer width = 1065
integer height = 788
integer taborder = 20
end type

on ole_face.destroy
call gearbox::destroy
end on

type uo_resize from resize_fenetre within w_moulages
boolean visible = false
integer x = 1801
integer y = 1664
integer taborder = 20
end type

on uo_resize.destroy
call resize_fenetre::destroy
end on

type ddlb_liste from dropdownlistbox within w_moulages
integer x = 14
integer y = 20
integer width = 1193
integer height = 640
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;

// on passe en param le N° dans la liste .. pour y reférer AUSSI avec le tableau des intitulés
charger_moulages(  this.finditem(this.text,1)  )
end event

type ole_gauche from gearbox within w_moulages
integer x = 2190
integer y = 156
integer width = 1065
integer height = 788
integer taborder = 10
end type

on ole_gauche.destroy
call gearbox::destroy
end on

type cb_fermer from uo_picturebutton_390x120_fermer within w_moulages
integer x = 2222
integer y = 1940
integer taborder = 10
end type

type gb_1 from groupbox within w_moulages
integer x = 32
integer y = 1084
integer width = 1243
integer height = 1004
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Exportation vers Orthokis"
end type

