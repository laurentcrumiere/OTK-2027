$PBExportHeader$w_types_images.srw
forward
global type w_types_images from w_param
end type
type pb_config from uo_picturebutton_390x120 within w_types_images
end type
end forward

global type w_types_images from w_param
integer width = 3771
integer height = 2288
string title = "Définition des Types d~'Image"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_config pb_config
end type
global w_types_images w_types_images

on w_types_images.create
int iCurrent
call super::create
this.pb_config=create pb_config
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_config
end on

on w_types_images.destroy
call super::destroy
destroy(this.pb_config)
end on

type p_fond from w_param`p_fond within w_types_images
integer x = 864
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_types_images
integer x = 160
integer y = 1052
end type

type cb_annuler from w_param`cb_annuler within w_types_images
integer x = 2235
integer y = 1992
integer width = 480
end type

type cb_enregistrer from w_param`cb_enregistrer within w_types_images
integer x = 2715
integer y = 1992
integer width = 480
end type

type cb_fermer from w_param`cb_fermer within w_types_images
integer x = 3195
integer y = 1992
integer width = 480
end type

type cb_supprimer from w_param`cb_supprimer within w_types_images
boolean visible = false
integer x = 553
integer y = 1992
integer width = 430
integer taborder = 40
end type

event cb_supprimer::clicked;if MessageBox("ATTENTION !","Supprimer un type d'images peut être préjudiciable à la gestion future de vos images.~n~nSi vous ne souhaitez pas utiliser ce type, nous vous conseillons plutôt de le désactiver.~n~nVoulez-vous tout de même le supprimer ?",Question!,Yesno!, 2) = 1 then

	if dw_liste.rowcount() > 0 then
		son(7)
		dw_liste.deleterow(dw_liste.getrow())
	end if
	
end if
end event

type cb_ajouter from w_param`cb_ajouter within w_types_images
integer x = 73
integer y = 1992
integer width = 480
integer taborder = 30
end type

event cb_ajouter::clicked;dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.Setcolumn("Libelle")

// on ne prend pas que le rowcount() à cause des possibles inactifs
long inac 
select isnull(count(*),0) into :inac  from type_image where actif = 0 ;

dw_liste.SetItem(dw_liste.rowcount(), "code_courrier", "CC"+string(dw_liste.rowcount() + inac ))
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_types_images
integer x = 73
integer width = 3611
integer height = 1904
string dataobject = "dw_types_images"
end type

event dw_liste::doubleclicked;call super::doubleclicked;//Appel du bouton modifier
if ROW > 0 then
	pb_config.TriggerEvent(Clicked!)
end if
end event

event dw_liste::itemchanged;call super::itemchanged;

// recherche si images déjà affectée à ce type d'image

long v_id, v_tot

if row > 0 then 
	v_id = getitemNumber(row, "type_image_id")
	select isnull(count(*), 0) into :v_tot from images_infos where type_image = :v_id ;
	if v_tot > 0 then 
		Messagebox("ATTENTION", "Ce type d'image a déjà été affecté à une ou plusieurs images. La modification a tout de même été réalisée.")
	end if
end if

end event

type uo_1 from w_param`uo_1 within w_types_images
integer x = 1806
integer taborder = 20
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_types_images
integer x = 1586
integer y = 2040
end type

type gb_filtre from w_param`gb_filtre within w_types_images
integer x = 1463
integer y = 1976
end type

type pb_config from uo_picturebutton_390x120 within w_types_images
integer x = 983
integer y = 1992
integer width = 480
integer height = 132
integer taborder = 60
boolean bringtotop = true
string text = "&Config MC"
end type

event clicked;call super::clicked;dw_liste.accepttext()

if enregistrement_automatique and cb_enregistrer.enabled then
	cb_enregistrer.triggerevent(clicked!)
end if


open(w_type_image_mots_clefs_config)
end event

