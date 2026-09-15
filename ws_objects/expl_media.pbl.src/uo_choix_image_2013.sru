$PBExportHeader$uo_choix_image_2013.sru
forward
global type uo_choix_image_2013 from userobject
end type
type ddlb_temps_traitement from dropdownlistbox within uo_choix_image_2013
end type
type ddlb_type_image from dropdownlistbox within uo_choix_image_2013
end type
end forward

global type uo_choix_image_2013 from userobject
integer width = 1646
integer height = 104
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
ddlb_temps_traitement ddlb_temps_traitement
ddlb_type_image ddlb_type_image
end type
global uo_choix_image_2013 uo_choix_image_2013

type variables


 integer tab_ddlb_image[], tab_ddlb_temps[]
 
 string nom_image
 
 boolean avec_temps_traitement
end variables

forward prototypes
public subroutine initialisation_ddlb_type_image ()
public subroutine initialisation_ddlb_temps_traitement ()
public subroutine sauvegarde ()
public subroutine initialisation (string v_nom_image, boolean v_avec_temps_traitement)
public function string trouver_image (string v_nom_cadre, double v_code_local)
end prototypes

public subroutine initialisation_ddlb_type_image ();
// initialisation d'un DDLB contentant tous les type d'images
// tab_ddlb_image contiendra les valeurs des id



ddlb_type_image.reset()


declare cur cursor for select id, libelle from type_image where actif = 1 order by ordre_trie asc, libelle asc ;

string v_libelle
long v_id
integer i = 0

open cur ;

fetch cur into :v_id, :v_libelle ;

do while sqlca.sqlcode = 0 

	i = i + 1
	tab_ddlb_image[i] = v_id 
	ddlb_type_image.additem(v_libelle) ;

	fetch cur into :v_id, :v_libelle ;

loop

close cur ;



return
end subroutine

public subroutine initialisation_ddlb_temps_traitement ();
// initialisation d'un DDLB contentant tous les temps de traitement
// tab_ddlb_temps contiendra les valeurs des id

// ATTENTION ... les 2 1er éléments sont en dur -1 et -2 ... les 2 premiers item sont "+ récente" et "+ ancienne" 



declare cur cursor for select id, libelle from temps_traitement where actif = 1 order by ordre_trie asc, libelle asc ;

string v_libelle
long v_id
integer i = 2

ddlb_temps_traitement.reset()

ddlb_temps_traitement.additem("La plus récente")
tab_ddlb_temps[1] = -1
ddlb_temps_traitement.additem("La plus ancienne")
tab_ddlb_temps[2] = -2 

open cur ;

fetch cur into :v_id, :v_libelle ;

do while sqlca.sqlcode = 0 

	i = i + 1
	tab_ddlb_temps[i] = v_id 
	ddlb_temps_traitement.additem(v_libelle) ;

	fetch cur into :v_id, :v_libelle ;

loop

close cur ;

return
end subroutine

public subroutine sauvegarde ();
integer v_index

// Types_images
v_index = FindExactement(ddlb_type_image , ddlb_type_image.text)

if v_index > 0 then
	SetprofileString(dir_ini+inifile_orthokis,"explorateur_photos_2013","Type_image_" + nom_image , string(tab_ddlb_image[v_index]))
	
	if avec_temps_traitement then
		// Tempts traitement
		v_index = FindExactement(ddlb_temps_traitement , ddlb_temps_traitement.text)
		SetprofileString(dir_ini+inifile_orthokis,"explorateur_photos_2013","Temps_traitement_" + nom_image , string(tab_ddlb_temps[v_index]))
	end if
end if

end subroutine

public subroutine initialisation (string v_nom_image, boolean v_avec_temps_traitement);

// initialisation complète
// en entrée, le nom de l'image qu'on configure "identite_administrative" par exemple

// on gère 2 clefs dans le fichier orthokis.ini : type_image_nom_image et temps_traitement_nom_image


integer v_index
string v_libelle

 
// variables d'instance
nom_image = v_nom_image
avec_temps_traitement = v_avec_temps_traitement

initialisation_ddlb_type_image()

v_index = profileInt(dir_ini+inifile_orthokis,"explorateur_photos_2013","Type_image_" + v_nom_image ,13)
select libelle into :v_libelle from type_image where id = :v_index ;

v_index = FindExactement ( ddlb_type_image , v_libelle ) 

ddlb_type_image.SelectItem(  v_index ) 

if avec_temps_traitement then
	
	initialisation_ddlb_temps_traitement()
	
	v_index = profileInt(dir_ini+inifile_orthokis,"explorateur_photos_2013","Temps_traitement_" + v_nom_image , -1)
	if v_index < 0 then 
		// + ancienne ou + récente
		ddlb_temps_traitement.SelectItem(  -v_index ) 
	else
		select libelle into :v_libelle from temps_traitement where id = :v_index ;
		v_index = FindExactement ( ddlb_temps_traitement , v_libelle ) 
		ddlb_temps_traitement.SelectItem(  v_index ) 
	end if
else
	ddlb_temps_traitement.visible = false
end if

end subroutine

public function string trouver_image (string v_nom_cadre, double v_code_local);

// Renvoie l'image (nom du fichier seul) qui correspond à ce qui ce qui est configuré , pour le patient donné et le cadre donné

// elle ne fonctionne pas en interface, uniquement pour cette fonction


string v_nom_fichier


long v_type_image, v_temps_traitement

v_type_image = profileInt(dir_ini+inifile_orthokis,"explorateur_photos_2013","Type_image_" + v_nom_cadre ,13)
v_temps_traitement = profileInt(dir_ini+inifile_orthokis,"explorateur_photos_2013","Temps_traitement_" + v_nom_cadre , -1)

if v_temps_traitement > 0 then 
		// recherche classique pour 1 temps et 1 type image
		select isnull(max(nom_fichier),'') into :v_nom_fichier from images_infos where type_image = :v_type_image and temps_traitement = :v_temps_traitement and code = :v_code_local ;
else
	if v_temps_traitement = -1 then 
		// la plus récente ... la commande SQL ne marchera pas en Sybase 5
		select top 1 isnull(nom_fichier, '') into :v_nom_fichier from images_infos where type_image = :v_type_image and code = :v_code_local order by date_acquis desc ;
	else
		// la plus ancienne
		select top 1 isnull(nom_fichier, '') into :v_nom_fichier from images_infos where type_image = :v_type_image and code = :v_code_local order by date_acquis asc ;
	end if
end if


return v_nom_fichier
end function

on uo_choix_image_2013.create
this.ddlb_temps_traitement=create ddlb_temps_traitement
this.ddlb_type_image=create ddlb_type_image
this.Control[]={this.ddlb_temps_traitement,&
this.ddlb_type_image}
end on

on uo_choix_image_2013.destroy
destroy(this.ddlb_temps_traitement)
destroy(this.ddlb_type_image)
end on

event constructor;

this.backcolor = couleur_fond_fenetre
end event

type ddlb_temps_traitement from dropdownlistbox within uo_choix_image_2013
integer x = 823
integer width = 818
integer height = 840
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

type ddlb_type_image from dropdownlistbox within uo_choix_image_2013
integer width = 818
integer height = 840
integer taborder = 10
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

