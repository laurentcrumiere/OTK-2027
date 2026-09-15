$PBExportHeader$w_affectations_mots_clefs_gear.srw
forward
global type w_affectations_mots_clefs_gear from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120 within w_affectations_mots_clefs_gear
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_affectations_mots_clefs_gear
end type
type cb_annuler from uo_picturebutton_390x120 within w_affectations_mots_clefs_gear
end type
type dw_1 from datawindow within w_affectations_mots_clefs_gear
end type
type pb_renommer from uo_picturebutton_780x120 within w_affectations_mots_clefs_gear
end type
end forward

global type w_affectations_mots_clefs_gear from w_fenetre_arakis
integer width = 1641
integer height = 2524
string title = "Affectation des mots clefs"
windowtype windowtype = response!
long backcolor = 15780518
cb_fermer cb_fermer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
dw_1 dw_1
pb_renommer pb_renommer
end type
global w_affectations_mots_clefs_gear w_affectations_mots_clefs_gear

type variables
double var_numero_cadre_local
string var_nom_cadre_local

double var_numero_cadre_local_pour_base

// Pour savoir si le cadre a été renommé ou pas ... 1 si renommé.
integer cadre_renomme = 0
end variables

forward prototypes
public subroutine get_infos ()
public subroutine maj_titre ()
end prototypes

public subroutine get_infos ();
// Charge la DW et position les cases qui vont bien

dw_1.retrieve()

long lig, tot, cpt
long v_id


tot = dw_1.rowcount()

for lig = 1 to tot
	
	v_id = dw_1.getItemNumber(lig, "expl_media_mots_clefs_id")

	// Recherche si ce mot_clef est affecté pour le patient
	select isnull(count(*), 0)	into :cpt from expl_media_mots_clefs_cadres_images 
	where id_mot_clef = :v_id and id_cadre_image = :var_numero_cadre_local_pour_base ;
	
	if cpt > 0 then 
		dw_1.SetItem(lig, "selection", "O")
	else
		dw_1.SetItem(lig, "selection", "N")
	end if
next

// Réinitialisation des compteurs de MAJ
dw_1.ResetUpdate ( )




end subroutine

public subroutine maj_titre ();

// Mise à jour du titre de la fenêtre

this.title = "Affectation des mots clefs : "+var_nom_cadre_local



end subroutine

on w_affectations_mots_clefs_gear.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.dw_1=create dw_1
this.pb_renommer=create pb_renommer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.dw_1
this.Control[iCurrent+5]=this.pb_renommer
end on

on w_affectations_mots_clefs_gear.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.dw_1)
destroy(this.pb_renommer)
end on

event open;call super::open;
// Recup du N° du cadre concerné
var_numero_cadre_local = message.DoubleParm


// Recherche du nom du cadre 
var_nom_cadre_local = profilestring(dir_photos + inifile_photo, "ARAKIS", "ole_nom_photo" + string(var_numero_cadre_local , "000"),"")

maj_titre()

// Attention, pour les besoins de l'affectation des mots clefs, on décale de 2 le N° du cadre car
// dans la fenêtre originale d'affecfaftion des mots clefs pn englobe de base les 2 photos adminis
var_numero_cadre_local_pour_base = var_numero_cadre_local + 2


colore_datawindow(dw_1)


//retrieve de la datawindow
dw_1.settransobject(SQLCA)

//centrer la fenêtre
centrer(this)


// Chargement de la DW
get_infos()



end event

event close;call super::close;

CloseWithReturn(this, cadre_renomme)

end event

type p_fond from w_fenetre_arakis`p_fond within w_affectations_mots_clefs_gear
end type

type cb_fermer from uo_picturebutton_390x120 within w_affectations_mots_clefs_gear
integer x = 951
integer y = 2244
integer taborder = 40
string text = "&Fermer"
boolean originalsize = false
end type

event clicked;call super::clicked;

dw_1.accepttext()

if dw_1.modifiedcount() > 0 or dw_1.deletedcount() > 0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		CloseWithReturn(parent, cadre_renomme)
	end if
else
	CloseWithReturn(parent, cadre_renomme)
end if

end event

type cb_enregistrer from uo_picturebutton_390x120 within w_affectations_mots_clefs_gear
integer x = 530
integer y = 2244
integer taborder = 30
string text = "&Enregistrer"
boolean default = true
boolean originalsize = false
end type

event clicked;call super::clicked;
// Parcours de la DW pour MAJ de la base de données

long lig, tot, cpt
long v_id
 

// On efface les mots clefs d'avant en DB
Delete from   expl_media_mots_clefs_cadres_images where id_cadre_image = :var_numero_cadre_local_pour_base ;

dw_1.accepttext()
tot = dw_1.rowcount()

for lig = 1 to tot
	
	if dw_1.GetItemString(lig, "selection") =  "O" then
		v_id = dw_1.getItemNumber(lig, "expl_media_mots_clefs_id")

		// Ajout dans la base 
		insert into  expl_media_mots_clefs_cadres_images (id_mot_clef, id_cadre_image)
		values (:v_id , :var_numero_cadre_local_pour_base) ;
	end if
	
next

// Réinitialisation des compteurs de MAJ
dw_1.ResetUpdate ( )





end event

type cb_annuler from uo_picturebutton_390x120 within w_affectations_mots_clefs_gear
integer x = 110
integer y = 2244
integer taborder = 20
string text = "&Annuler"
boolean originalsize = false
end type

event clicked;call super::clicked;
get_infos()
end event

type dw_1 from datawindow within w_affectations_mots_clefs_gear
string tag = "brush"
integer x = 55
integer y = 24
integer width = 1481
integer height = 2024
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_expl_media_mots_clefs_affectation"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type pb_renommer from uo_picturebutton_780x120 within w_affectations_mots_clefs_gear
integer x = 361
integer y = 2088
integer width = 777
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Renommer Cadre"
end type

event clicked;call super::clicked;

string v_reponse
long cpt = 0

v_reponse = InputBoxWithPropo("Renommage d'un cadre image", "Veuillez indiquer le nouveau libellé du cadre image : ", var_nom_cadre_local , false)
	
if len(v_reponse) > 0 then
	// un nom a été renvoyé
	v_reponse = trim(v_reponse)
	
	
	// mise à jour du .ini et de la base de données !!!
	
	// Vérfication dans la BD si y a pas déjà un cadre de ce nom ...
	select isnull(count(*), 0) into :cpt from expl_media_cadres_images 
	where description = :v_reponse and type_image = 2 and id <> :var_numero_cadre_local_pour_base ;
	
	if cpt = 0 then 
		// On peut mettre à jour
		update expl_media_cadres_images set description = :var_nom_cadre_local 
		where type_image = 2 and id = :var_numero_cadre_local_pour_base ;
	
		if sqlca.sqlcode = 0 then 
			commit ;

			var_nom_cadre_local = v_reponse
			Setprofilestring(dir_photos + inifile_photo, "ARAKIS", "ole_nom_photo" + string(var_numero_cadre_local , "000"),var_nom_cadre_local)

			maj_titre()
			
			cadre_renomme = 1
			
		else
			
			rollback ;
			Messagebox("ATTENTION !","Erreur dans la mise à jour de la base de données.~n~n"+sqlca.sqlerrtext)
			
		end if
		
	else
		
		Messagebox("ATTENTION !","Vous ne pouvez pas indiquer un tel libellé car il est déjà indiqué pour un autre cadre image")
		
	end if
end if

end event

