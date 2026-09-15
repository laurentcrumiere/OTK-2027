$PBExportHeader$w_config_imageries.srw
forward
global type w_config_imageries from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_config_imageries
end type
type pb_2 from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_3 from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_4 from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_5 from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_6 from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_2013a from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_2013e from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_2013b from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_2013c from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_2013d from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_2013f from uo_picturebutton_780x120 within w_config_imageries
end type
type pb_1 from uo_picturebutton_780x120 within w_config_imageries
end type
end forward

global type w_config_imageries from w_fenetre_arakis
integer width = 914
integer height = 1788
string title = "Paramètres Imagerie"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
boolean center = true
pb_fermer pb_fermer
pb_2 pb_2
pb_3 pb_3
pb_4 pb_4
pb_5 pb_5
pb_6 pb_6
pb_2013a pb_2013a
pb_2013e pb_2013e
pb_2013b pb_2013b
pb_2013c pb_2013c
pb_2013d pb_2013d
pb_2013f pb_2013f
pb_1 pb_1
end type
global w_config_imageries w_config_imageries

on w_config_imageries.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.pb_2=create pb_2
this.pb_3=create pb_3
this.pb_4=create pb_4
this.pb_5=create pb_5
this.pb_6=create pb_6
this.pb_2013a=create pb_2013a
this.pb_2013e=create pb_2013e
this.pb_2013b=create pb_2013b
this.pb_2013c=create pb_2013c
this.pb_2013d=create pb_2013d
this.pb_2013f=create pb_2013f
this.pb_1=create pb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.pb_2
this.Control[iCurrent+3]=this.pb_3
this.Control[iCurrent+4]=this.pb_4
this.Control[iCurrent+5]=this.pb_5
this.Control[iCurrent+6]=this.pb_6
this.Control[iCurrent+7]=this.pb_2013a
this.Control[iCurrent+8]=this.pb_2013e
this.Control[iCurrent+9]=this.pb_2013b
this.Control[iCurrent+10]=this.pb_2013c
this.Control[iCurrent+11]=this.pb_2013d
this.Control[iCurrent+12]=this.pb_2013f
this.Control[iCurrent+13]=this.pb_1
end on

on w_config_imageries.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.pb_2)
destroy(this.pb_3)
destroy(this.pb_4)
destroy(this.pb_5)
destroy(this.pb_6)
destroy(this.pb_2013a)
destroy(this.pb_2013e)
destroy(this.pb_2013b)
destroy(this.pb_2013c)
destroy(this.pb_2013d)
destroy(this.pb_2013f)
destroy(this.pb_1)
end on

event open;call super::open;



if imagerie_2013 then
	
	if serial <> "87001" then
		// toujours visible pour nous ... pour formation
		pb_1.visible = false
	end if
	pb_2.visible = false
	pb_3.visible = false
	pb_4.visible = false
	pb_5.visible = false
	pb_6.visible = false

else

	pb_2013a.visible = false
	pb_2013b.visible = false
	pb_2013c.visible = false
	pb_2013d.visible = false
	pb_2013e.visible = false
	pb_2013f.visible = false
	
	
end if



end event

type p_fond from w_fenetre_arakis`p_fond within w_config_imageries
integer x = 873
integer y = 956
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_config_imageries
integer x = 242
integer y = 1464
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type pb_2 from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 56
integer width = 777
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Paramètres Avancés"
end type

event clicked;call super::clicked;//open(w_expl_media_param)
end event

type pb_3 from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 252
integer width = 777
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Groupes"
end type

event clicked;call super::clicked;open(w_expl_media_groupes)
end event

type pb_4 from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 448
integer width = 777
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "Définition des Mots Clefs"
end type

event clicked;call super::clicked;open( w_expl_media_mots_clefs )
end event

type pb_5 from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 648
integer width = 777
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "Affectation des Mots Clefs"
end type

event clicked;call super::clicked;open( w_expl_media_affectation)
end event

type pb_6 from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 852
integer width = 777
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "Filtres"
end type

event clicked;call super::clicked;open( w_expl_media_filtres )
end event

type pb_2013a from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 56
integer width = 777
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "Types d~'Images"
end type

event clicked;call super::clicked;open(w_types_images)
end event

type pb_2013e from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 852
integer width = 777
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = " Mots Clefs"
end type

event clicked;call super::clicked;open( w_expl_media_mots_clefs )
end event

type pb_2013b from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 252
integer width = 777
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "Etapes de Traitement"
end type

event clicked;call super::clicked;open(w_temps_traitement)
end event

type pb_2013c from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 448
integer width = 777
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "Scripts Acquisition"
end type

event clicked;call super::clicked;open(w_scripts_2013_config)
end event

type pb_2013d from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 648
integer width = 777
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "Groupes"
end type

event clicked;call super::clicked;open(w_expl_media_groupes)
end event

type pb_2013f from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 1056
integer width = 777
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Paramètres Avancés"
end type

event clicked;call super::clicked;open(w_expl_media_param_2013)
end event

type pb_1 from uo_picturebutton_780x120 within w_config_imageries
integer x = 59
integer y = 1260
integer width = 777
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "Migration Imagerie 2013"
end type

event clicked;call super::clicked;



if Messagebox("ATTENTION","Vous allez accéder à l'assistant de migration de l'imagerie pour profiter des dernières nouveautés de la version 2013.~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

	
	// Demande de mot de passe administrateur ... trop risqué !!
	
	ok_mdp = false
	
	guo_fenetre_modale.wf_ouvrir(w_mot_passe_administrateur)
	
	if ok_mdp then	
	
		open(w_migration_imagerie_2013)
	end if
		
end if

end event

