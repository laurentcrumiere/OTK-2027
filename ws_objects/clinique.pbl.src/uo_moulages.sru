$PBExportHeader$uo_moulages.sru
forward
global type uo_moulages from userobject
end type
type pb_moulage from picturebutton within uo_moulages
end type
end forward

global type uo_moulages from userobject
integer width = 123
integer height = 112
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_moulage pb_moulage
end type
global uo_moulages uo_moulages

type variables
double var_code_local
string var_nom_fichier_moulage
string var_rep_photos_patient
boolean plusieurs_moulages 

string type_objet 	// sera initialisé par l'appel - M pour moulage, V pour vidéo

string v_nature, v_code_courrier
end variables

forward prototypes
public function boolean init (double v_code_local, string v_type_objet)
end prototypes

public function boolean init (double v_code_local, string v_type_objet);long v_cpt = 0
plusieurs_moulages = false

boolean code_retour

// sera initialisé par l'appel - M pour moulage, V pour vidéo
type_objet = v_type_objet

// Y a-t-il un moulage ?
var_code_local = v_code_local

if type_objet = "M" then 
	v_nature = 'D' 
	v_code_courrier = 'DOCMOU' 
	pb_moulage.picturename = "lc_moulage.png"
	pb_moulage.PowerTipText = "Ouverture du moulage le plus récent / Ouverture d'un moulage choisi dans la liste des moulages du patient"
	// Combien de moulages à des dates #
	
	//	select distinct count(*) into :v_cpt from historique_editions where nature = :v_nature and code_courrier = :v_code_courrier	and code = :var_code_local group by date_document   ;
  
else
	v_nature = 'D' 
	v_code_courrier = 'DOCVID' 
	pb_moulage.picturename = "lc_film.gif"
	pb_moulage.PowerTipText = "Ouverture de la vidéo la plus récente / Ouverture d'une vidéo choisie dans la liste des vidéos du patient"
	// Combien de vidéos
	select  count(*) into :v_cpt from historique_editions where nature = :v_nature and code_courrier = :v_code_courrier
	and code = :var_code_local   ;
	 
end if
	
// Combien de lignes concernées ...
date v_date_document 

if type_objet = "M" then
	// On compte les moulages à des dates distinctes
	Declare cur_lig cursor for select date_document  from historique_editions where nature = :v_nature and code_courrier = :v_code_courrier and code = :var_code_local  group by date_document  ;
	
	open cur_lig ;
	v_cpt = 0
	fetch cur_lig into :v_date_document ;
	
	do while sqlca.sqlcode = 0 
		v_cpt = v_cpt + 1
		fetch cur_lig into :v_date_document ;
	loop
	
	close cur_lig ;
else
	// On compte les vidéos simplement
	select count(*)  into :v_cpt from historique_editions where nature = :v_nature and code_courrier = :v_code_courrier
	and code = :var_code_local  ;
end if

if v_cpt > 0 then
	
	// initialisation du nom du fichier le plus récent !
	select top 1 isnull(nom_courrier,'') into :var_nom_fichier_moulage  
	from historique_editions where nature = :v_nature and code_courrier = :v_code_courrier
	and code = :var_code_local order by date_document desc  ;

	if v_cpt > 1 then 
		plusieurs_moulages = true
	end if
	
	var_rep_photos_patient = fxg_get_rep_photos() +string( var_code_local ) + win_delimiter 

	code_retour =  true

else
	code_retour = false
end if


return code_retour
end function

on uo_moulages.create
this.pb_moulage=create pb_moulage
this.Control[]={this.pb_moulage}
end on

on uo_moulages.destroy
destroy(this.pb_moulage)
end on

type pb_moulage from picturebutton within uo_moulages
integer width = 123
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_moulage.png"
alignment htextalign = left!
string powertiptext = "Ouverture du moulage le plus récent / Ouverture d~'un moulage choisi dans la liste des moulages du patient"
long backcolor = 553648127
end type

event clicked;// ouvre le moulage le plus récent
string rep_photo, chemin_complet

chemin_complet = var_rep_photos_patient + var_nom_fichier_moulage


fxg_ouvrir_fichier_shell(chemin_complet)

end event

event rbuttondown;if plusieurs_moulages then
	
	// choix du moulage à ouvrir .. revoyé par la fenêtre
	string v_fichier_a_ouvrir
	
	Param_Win[1] = type_objet // exploité dans w_choix_moulages
	openWithParm(	w_choix_moulages, var_code_local)
	v_fichier_a_ouvrir = message.StringParm
	
	if v_fichier_a_ouvrir <> "" then
		// ouverture du fichier
		string chemin_complet
	
		chemin_complet = var_rep_photos_patient + v_fichier_a_ouvrir
			
		fxg_ouvrir_fichier_shell(chemin_complet)
	end if
	
else
	// 1 seul moulage
	this.triggerevent(clicked!)
end if

end event

