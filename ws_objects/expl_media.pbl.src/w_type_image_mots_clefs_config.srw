$PBExportHeader$w_type_image_mots_clefs_config.srw
forward
global type w_type_image_mots_clefs_config from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_type_image_mots_clefs_config
end type
type dw_type_image_detail from datawindow within w_type_image_mots_clefs_config
end type
type dw_mots_clefs from datawindow within w_type_image_mots_clefs_config
end type
type uo_1 from resize_fenetre within w_type_image_mots_clefs_config
end type
type dw_type_image_liste from datawindow within w_type_image_mots_clefs_config
end type
end forward

global type w_type_image_mots_clefs_config from w_fenetre_arakis
integer width = 4270
integer height = 2244
string title = "Configuration des associations de mots clefs"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_fermer pb_fermer
dw_type_image_detail dw_type_image_detail
dw_mots_clefs dw_mots_clefs
uo_1 uo_1
dw_type_image_liste dw_type_image_liste
end type
global w_type_image_mots_clefs_config w_type_image_mots_clefs_config

type variables


long v_id_type_image_courante 
end variables

forward prototypes
public subroutine enregistrement ()
public subroutine charge_detail (long v_type_image)
end prototypes

public subroutine enregistrement ();


dw_type_image_detail.accepttext()


// Enregistrement automatique 
if dw_type_image_detail.update() = 1 then 
	commit ;
else
	rollback ;
end if
end subroutine

public subroutine charge_detail (long v_type_image);

// Charge les mots de la l'association en paramètre
// - dans la dw détail
// - dans l'arbre des mots clefs en cochant les cases


// Retrieve de la dw
dw_type_image_detail.retrieve (v_type_image) 

// Coche des mots clefs 
long lig, tot, ligmot
long v_code_mot



// On RAZ les mots
tot = dw_mots_clefs.rowcount()

for lig = 1 to tot
	dw_mots_clefs.SetItem ( lig , "selection", "N")
next


tot = dw_type_image_detail.rowcount()

for lig = 1 to tot
	
	v_code_mot = dw_type_image_detail.getItemNumber(lig, "id_mots_clefs")
	
	// recheche dans la table des mots clefs 
	ligmot = dw_mots_clefs.Find("id = "+string(v_code_mot) , 0 , 9999)
	
	if ligmot > 0 then
		dw_mots_clefs.SetItem ( ligmot , "selection", "O")
	end if
		
	
next


end subroutine

on w_type_image_mots_clefs_config.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_type_image_detail=create dw_type_image_detail
this.dw_mots_clefs=create dw_mots_clefs
this.uo_1=create uo_1
this.dw_type_image_liste=create dw_type_image_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_type_image_detail
this.Control[iCurrent+3]=this.dw_mots_clefs
this.Control[iCurrent+4]=this.uo_1
this.Control[iCurrent+5]=this.dw_type_image_liste
end on

on w_type_image_mots_clefs_config.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_type_image_detail)
destroy(this.dw_mots_clefs)
destroy(this.uo_1)
destroy(this.dw_type_image_liste)
end on

event open;call super::open;

uo_1.taille(this) 		// uniquement pour les couleurs

dw_type_image_liste.settransobject(sqlca)
dw_mots_clefs.settransobject(sqlca)
dw_type_image_detail.settransobject(sqlca)

dw_mots_clefs.retrieve()

dw_type_image_liste.retrieve()

if dw_type_image_liste.rowcount() > 1 then
	dw_type_image_liste.selectRow(1, true)
end if

centrer(this)
end event

event resize;call super::resize;uo_1.retaille(this) 		// uniquement pour les couleurs

end event

type p_fond from w_fenetre_arakis`p_fond within w_type_image_mots_clefs_config
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_type_image_mots_clefs_config
integer x = 3182
integer y = 1984
integer taborder = 10
boolean bringtotop = true
end type

event clicked;


// Enregistrement automatique 
enregistrement()


close(parent)


end event

type dw_type_image_detail from datawindow within w_type_image_mots_clefs_config
string tag = "brush no resize"
integer x = 576
integer y = 1168
integer width = 1385
integer height = 960
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "Mots clefs"
string dataobject = "dw_type_image_mots_clefs"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_mots_clefs from datawindow within w_type_image_mots_clefs_config
event maj_modif ( )
string tag = "brush"
integer x = 2688
integer y = 8
integer width = 1358
integer height = 1928
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Sélection des mots clefs"
string dataobject = "dw_expl_media_mots_clefs_affectation_2013"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event maj_modif();

if dw_type_image_liste.rowcount() > 0 then
	// Y a une une modif dans la table => mise à jour des mots clefs
	// On regarde s'il n'y est pas dans la liste et on l'ajoute ou on le supprime selon !!!
	
	long v_code_mot
	boolean v_trouve
	long lig, tot
	
	this.accepttext()
	
	v_code_mot = GetItemNumber(getrow(), "id")
	
	lig = dw_type_image_detail.Find("id_mots_clefs  = "+string(v_code_mot) , 0 , 9999 )
	
	if lig > 0 then 
		v_trouve = true
	else
		v_trouve = false
	end if
	
	if GetItemString(getrow() , "selection") = "O" then
		if not v_trouve then
			// On l'ajoute
			dw_type_image_detail.insertrow(9999)
			tot = dw_type_image_detail.rowcount()
			dw_type_image_detail.SetItem(tot, "id_type_image", v_id_type_image_courante)
			dw_type_image_detail.SetItem(tot, "id_mots_clefs", v_code_mot)
			dw_type_image_detail.SetItem(tot, "description", this.getitemstring( getrow(), "description") )
		end if
	else	
		if v_trouve then
			// on le supprime
			dw_type_image_detail.deleterow(lig)
		end if
		
	end if	
	
	Enregistrement()
	
	
end if
		
end event

event itemchanged;

// Les valeurs de la dw ne sont pas encore eà jour 
// Elle le seront à la fin de l'event
// => on poste un autre event pour etre sur que la valeur sera à jour au moment du test

post event maj_modif()


end event

type uo_1 from resize_fenetre within w_type_image_mots_clefs_config
boolean visible = false
integer x = 215
integer y = 1424
integer taborder = 30
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_type_image_liste from datawindow within w_type_image_mots_clefs_config
string tag = "brush no resize"
integer x = 27
integer y = 20
integer width = 2569
integer height = 1092
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "Types d~'images actifs"
string dataobject = "dw_types_images_liste"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;if dw_type_image_liste.rowcount() > 0 then

	v_id_type_image_courante = dw_type_image_liste.getItemNumber( 1, "id")
	charge_detail( v_id_type_image_courante )
	
end if
end event

event rowfocuschanged;

if dw_type_image_liste.rowcount() > 0 then

	v_id_type_image_courante = dw_type_image_liste.getItemNumber( currentrow, "id")
	charge_detail(v_id_type_image_courante)
	
end if
end event

event clicked;If row > 0 Then
	// On envoie cette fonction pour les libellés de colonne qui ne sonts pas mis en entête
		
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)

End If

end event

