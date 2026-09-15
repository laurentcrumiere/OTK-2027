$PBExportHeader$w_migration_imagerie_2013_cadres.srw
forward
global type w_migration_imagerie_2013_cadres from w_fenetre_arakis
end type
type dw_1 from datawindow within w_migration_imagerie_2013_cadres
end type
type em_nbr_photos_cliniques from editmask within w_migration_imagerie_2013_cadres
end type
type em_nbr_photos_courriers from editmask within w_migration_imagerie_2013_cadres
end type
type pb_fermer from uo_picturebutton_780x120 within w_migration_imagerie_2013_cadres
end type
type pb_appliquer from uo_picturebutton_780x120 within w_migration_imagerie_2013_cadres
end type
type pb_annuler from uo_picturebutton_780x120 within w_migration_imagerie_2013_cadres
end type
end forward

global type w_migration_imagerie_2013_cadres from w_fenetre_arakis
integer width = 3973
integer height = 2260
string title = "Affectation des types d~'image et des étapes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
dw_1 dw_1
em_nbr_photos_cliniques em_nbr_photos_cliniques
em_nbr_photos_courriers em_nbr_photos_courriers
pb_fermer pb_fermer
pb_appliquer pb_appliquer
pb_annuler pb_annuler
end type
global w_migration_imagerie_2013_cadres w_migration_imagerie_2013_cadres

type variables
uo_expl_media_param	uo_param
end variables

event open;call super::open;

uo_param = create uo_expl_media_param


pb_annuler.triggerevent(clicked!)

end event

on w_migration_imagerie_2013_cadres.create
int iCurrent
call super::create
this.dw_1=create dw_1
this.em_nbr_photos_cliniques=create em_nbr_photos_cliniques
this.em_nbr_photos_courriers=create em_nbr_photos_courriers
this.pb_fermer=create pb_fermer
this.pb_appliquer=create pb_appliquer
this.pb_annuler=create pb_annuler
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_1
this.Control[iCurrent+2]=this.em_nbr_photos_cliniques
this.Control[iCurrent+3]=this.em_nbr_photos_courriers
this.Control[iCurrent+4]=this.pb_fermer
this.Control[iCurrent+5]=this.pb_appliquer
this.Control[iCurrent+6]=this.pb_annuler
end on

on w_migration_imagerie_2013_cadres.destroy
call super::destroy
destroy(this.dw_1)
destroy(this.em_nbr_photos_cliniques)
destroy(this.em_nbr_photos_courriers)
destroy(this.pb_fermer)
destroy(this.pb_appliquer)
destroy(this.pb_annuler)
end on

type p_fond from w_fenetre_arakis`p_fond within w_migration_imagerie_2013_cadres
end type

type dw_1 from datawindow within w_migration_imagerie_2013_cadres
string tag = "brush"
integer x = 14
integer y = 8
integer width = 3886
integer height = 1860
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_migration_imagerie_2013_cadres"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
end type

type em_nbr_photos_cliniques from editmask within w_migration_imagerie_2013_cadres
boolean visible = false
integer x = 855
integer y = 1452
integer width = 192
integer height = 96
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "200"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

type em_nbr_photos_courriers from editmask within w_migration_imagerie_2013_cadres
boolean visible = false
integer x = 1239
integer y = 1364
integer width = 192
integer height = 96
integer taborder = 170
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "50"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "###"
end type

type pb_fermer from uo_picturebutton_780x120 within w_migration_imagerie_2013_cadres
integer x = 2039
integer y = 1964
integer width = 777
integer height = 152
integer taborder = 110
boolean bringtotop = true
string text = "&Fermer sans appliquer"
boolean originalsize = false
end type

event clicked;call super::clicked;

close(parent)
end event

type pb_appliquer from uo_picturebutton_780x120 within w_migration_imagerie_2013_cadres
integer x = 1198
integer y = 1964
integer width = 777
integer height = 152
integer taborder = 120
boolean bringtotop = true
string text = "&Appliquer"
boolean originalsize = false
end type

event clicked;call super::clicked;


long lig, tot
string v_nom_fichier
double v_temps, v_type_image
date v_date_limite

open(w_patience)

tot = dw_1.rowcount()

select top 1 isnull(date_imagerie_2013,cast(getdate() as date)) into :v_date_limite from param ; 


if MessageBox("ATTENTION","Vous allez appliquer ces paramétrages à toutes les images acquises avant le "+string(v_date_limite)+".~n~nCette action est irrémédiable.~n~nConfirmez-vous ?", Question!, Yesno! , 2 ) = 1 then
	
	for lig = 1 to tot
		
		v_nom_fichier = dw_1.GetitemString(lig, "nom") + dw_1.GetitemString(lig, "format") 
		
		v_temps = dw_1.GetitemNumber(lig, "temps_traitement")
		
		if not isnull( v_temps ) then
			// temps de traitement non nul ... on applique ...
			update images_infos set temps_traitement = :v_temps where nom_fichier = :v_nom_fichier and date_acquis < :v_date_limite ;
		end if
		
		v_type_image = dw_1.GetitemNumber(lig, "type_image")
		
		if not isnull( v_type_image ) then
			// type d'image non nul ... on applique ...
			update images_infos set type_image = :v_type_image where nom_fichier = :v_nom_fichier and date_acquis < :v_date_limite ;
		end if
		
	next
	
	commit ;
	
	close(w_patience)

	Messagebox("INFORMATION","Opération terminée !")
end if

close(parent)
end event

type pb_annuler from uo_picturebutton_780x120 within w_migration_imagerie_2013_cadres
integer x = 357
integer y = 1964
integer width = 777
integer height = 152
integer taborder = 120
boolean bringtotop = true
string text = "A&nnuler les saisies"
end type

event clicked;call super::clicked;dw_1.reset()


uo_param.photos_ini_charger( dw_1, em_nbr_photos_courriers.text, em_nbr_photos_cliniques.text )

DataWindowChild fille



if dw_1.GetChild("temps_traitement", fille) <> -1 then
	fille.settransobject(sqlca)
	fille.Reset()
	fille.Retrieve()
end if

if dw_1.GetChild("type_image", fille) <> -1 then
	fille.settransobject(sqlca)
	fille.Reset()
	fille.Retrieve()
end if
end event

