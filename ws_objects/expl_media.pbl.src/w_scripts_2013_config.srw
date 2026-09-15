$PBExportHeader$w_scripts_2013_config.srw
forward
global type w_scripts_2013_config from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_scripts_2013_config
end type
type dw_lignes from datawindow within w_scripts_2013_config
end type
type uo_1 from resize_fenetre within w_scripts_2013_config
end type
type dw_liste from datawindow within w_scripts_2013_config
end type
type pb_ajouter_script from uo_picturebutton_390x120 within w_scripts_2013_config
end type
type pb_supprimer_script from uo_picturebutton_390x120 within w_scripts_2013_config
end type
type pb_ajouter_ligne from uo_picturebutton_390x120 within w_scripts_2013_config
end type
type pb_supprimer_ligne from uo_picturebutton_390x120 within w_scripts_2013_config
end type
type pb_bas from uo_picturebutton_transparent within w_scripts_2013_config
end type
type pb_precedent from uo_picturebutton_transparent within w_scripts_2013_config
end type
type pb_dupliquer from uo_picturebutton_390x120 within w_scripts_2013_config
end type
end forward

global type w_scripts_2013_config from w_fenetre_arakis
integer width = 4370
integer height = 2284
string title = "Configuration des scripts d~'acquisition"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_fermer pb_fermer
dw_lignes dw_lignes
uo_1 uo_1
dw_liste dw_liste
pb_ajouter_script pb_ajouter_script
pb_supprimer_script pb_supprimer_script
pb_ajouter_ligne pb_ajouter_ligne
pb_supprimer_ligne pb_supprimer_ligne
pb_bas pb_bas
pb_precedent pb_precedent
pb_dupliquer pb_dupliquer
end type
global w_scripts_2013_config w_scripts_2013_config

type variables


long v_id_type_image_courante 
end variables

forward prototypes
public subroutine enregistrement ()
end prototypes

public subroutine enregistrement ();
dw_liste.accepttext()
dw_lignes.accepttext()

// on renumero les tris de lignes, au cas ou !!
long lig, tot

tot = dw_lignes.rowcount()
for lig = 1 to tot
	dw_lignes.setitem(lig, "ordre_trie", lig * 10)
next

if  dw_lignes.update() = 1 and dw_liste.update() = 1 then
	commit ;
else
	rollback ;
end if
end subroutine

on w_scripts_2013_config.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_lignes=create dw_lignes
this.uo_1=create uo_1
this.dw_liste=create dw_liste
this.pb_ajouter_script=create pb_ajouter_script
this.pb_supprimer_script=create pb_supprimer_script
this.pb_ajouter_ligne=create pb_ajouter_ligne
this.pb_supprimer_ligne=create pb_supprimer_ligne
this.pb_bas=create pb_bas
this.pb_precedent=create pb_precedent
this.pb_dupliquer=create pb_dupliquer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_lignes
this.Control[iCurrent+3]=this.uo_1
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.pb_ajouter_script
this.Control[iCurrent+6]=this.pb_supprimer_script
this.Control[iCurrent+7]=this.pb_ajouter_ligne
this.Control[iCurrent+8]=this.pb_supprimer_ligne
this.Control[iCurrent+9]=this.pb_bas
this.Control[iCurrent+10]=this.pb_precedent
this.Control[iCurrent+11]=this.pb_dupliquer
end on

on w_scripts_2013_config.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_lignes)
destroy(this.uo_1)
destroy(this.dw_liste)
destroy(this.pb_ajouter_script)
destroy(this.pb_supprimer_script)
destroy(this.pb_ajouter_ligne)
destroy(this.pb_supprimer_ligne)
destroy(this.pb_bas)
destroy(this.pb_precedent)
destroy(this.pb_dupliquer)
end on

event open;call super::open;

uo_1.taille(this) 		// uniquement pour les couleurs

dw_liste.settransobject(sqlca)
dw_lignes.settransobject(sqlca)


dw_liste.retrieve()

if dw_liste.rowcount() > 1 then
	dw_liste.selectRow(1, true)
end if

centrer(this)
end event

event resize;call super::resize;uo_1.retaille(this) 		// uniquement pour les couleurs

end event

type p_fond from w_fenetre_arakis`p_fond within w_scripts_2013_config
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_scripts_2013_config
integer x = 1824
integer y = 1980
integer width = 558
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

event clicked;// Enregistrement automatique 
enregistrement()


close(parent)


end event

type dw_lignes from datawindow within w_scripts_2013_config
string tag = "brush"
integer x = 2057
integer y = 20
integer width = 2290
integer height = 1684
integer taborder = 30
boolean bringtotop = true
boolean titlebar = true
string title = "Liste des images à acquérir"
string dataobject = "dw_scripts_2013_lignes_liste"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	// On envoie cette fonction pour les libellés de colonne qui ne sonts pas mis en entête
		
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)

End If

end event

event retrieveend;if rowcount > 0 then
	dw_lignes.ScrollToRow(1)
	dw_lignes.SelectRow(0, false)
	dw_lignes.SelectRow(1,True)
	dw_lignes.setrow(1)
end if

end event

type uo_1 from resize_fenetre within w_scripts_2013_config
boolean visible = false
integer x = 215
integer y = 1424
integer taborder = 30
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_liste from datawindow within w_scripts_2013_config
string tag = "brush no resize"
integer x = 5
integer y = 20
integer width = 2030
integer height = 1684
integer taborder = 20
boolean bringtotop = true
boolean titlebar = true
string title = "Liste des scripts"
string dataobject = "dw_scripts_2013_liste"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrieveend;if rowcount() > 0 then

	dw_lignes.retrieve( getItemNumber( 1, "id") )
	
end if
end event

event rowfocuschanged;

if currentrow > 0 then

	// Enregistrement automatique 
	enregistrement()

	dw_lignes.retrieve(getItemNumber( currentrow, "id"))
	
end if
end event

event clicked;If row > 0 Then
	// On envoie cette fonction pour les libellés de colonne qui ne sonts pas mis en entête
		
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)

End If

end event

type pb_ajouter_script from uo_picturebutton_390x120 within w_scripts_2013_config
integer x = 174
integer y = 1756
integer width = 558
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;
enregistrement()

dw_liste.insertrow(0)
dw_liste.scrolltorow(dw_liste.rowcount())
dw_liste.setcolumn(1)
dw_liste.setfocus()
end event

type pb_supprimer_script from uo_picturebutton_390x120 within w_scripts_2013_config
integer x = 745
integer y = 1756
integer width = 558
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;enregistrement()

if dw_liste.rowcount() > 0 then
	if messagebox("ATTENTION !",'Etes-vous sûr de supprimer le script "' + dw_liste.getitemString(dw_liste.getrow(), "libelle")+ '" ?',Question!,Yesno!,2) = 1 then
		
		// Suppression des lignes
		integer lig, tot
		tot = dw_lignes.rowcount()
		for lig = tot to 1 step -1
			dw_lignes.deleterow(lig)
		next
		
		dw_liste.deleterow(dw_liste.getrow())
		
		enregistrement()
		
	end if
end if
end event

type pb_ajouter_ligne from uo_picturebutton_390x120 within w_scripts_2013_config
integer x = 2418
integer y = 1756
integer width = 558
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;

enregistrement()

double id_script, id_type
long lig


id_script = dw_liste.getitemNumber(dw_liste.getrow() , "id")

if isnull (id_script ) then 
	messagebox("trace","nul")
end if

dw_lignes.insertrow(0)
lig = dw_lignes.rowcount()
dw_lignes.setitem(lig, "id", id_script)
dw_lignes.setitem(lig, "ordre_trie", lig * 10)


// recherche du type_image par defaut

select top 1 id into :id_type from "type_image" where actif = 1 order by ordre_trie asc, libelle asc ;
dw_lignes.setitem(lig, "type_image", id_type)

end event

type pb_supprimer_ligne from uo_picturebutton_390x120 within w_scripts_2013_config
integer x = 2990
integer y = 1756
integer width = 558
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;

enregistrement()

if dw_liste.rowcount() > 0 then
	if messagebox("ATTENTION !","Etes vous sûr de supprimer la ligne ?",Question!,Yesno!,2) = 1 then
		dw_lignes.deleterow(dw_lignes.getrow())
		enregistrement()
	end if
end if
end event

type pb_bas from uo_picturebutton_transparent within w_scripts_2013_config
integer x = 3758
integer y = 1756
integer taborder = 150
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-B.png"
string powertiptext = "Place l~'image après la suivante"
end type

event clicked;call super::clicked;

// La ligne doit descendre => on lui ajoute 15 à son ordre pour qu'elle s'intercale
// ensuite, enregistrement() recaculera les ordre !!
long ligne_courante

if dw_lignes.rowcount() > 0 then
	ligne_courante = dw_lignes.getrow()
	if ligne_courante < dw_lignes.rowcount() then
		dw_lignes.SetItem ( ligne_courante , "ordre_trie", dw_lignes.GetItemNumber ( ligne_courante , "ordre_trie") + 15)
		dw_lignes.sort()
		enregistrement()
		
		// On se repositionne
		dw_lignes.ScrollToRow(ligne_courante + 1)
		dw_lignes.SelectRow(0, false)
		dw_lignes.SelectRow(ligne_courante + 1,True)
		dw_lignes.setrow(ligne_courante + 1)
		
		
	end if
end if


end event

type pb_precedent from uo_picturebutton_transparent within w_scripts_2013_config
integer x = 3566
integer y = 1756
integer taborder = 160
boolean bringtotop = true
boolean originalsize = false
string picturename = "Fleche-H.png"
string powertiptext = "Place l~'image avant la précédente"
end type

event clicked;call super::clicked;

// La ligne doit remonter => on lui enlève 15 à son ordre pour qu'elle s'intercale
// ensuite, enregistrement() recaculera les ordre !!

long ligne_courante


if dw_lignes.rowcount() > 0 then

	ligne_courante = dw_lignes.getrow()

	if dw_lignes.getrow() > 1 then

		dw_lignes.SetItem ( ligne_courante , "ordre_trie", dw_lignes.GetItemNumber ( ligne_courante , "ordre_trie") - 15)
		dw_lignes.sort()
		enregistrement()
		
		// On se repositionne
		dw_lignes.ScrollToRow(ligne_courante - 1)
		dw_lignes.SelectRow(0, false)
		dw_lignes.SelectRow(ligne_courante - 1,True)
		dw_lignes.setrow(ligne_courante - 1)
		
	end if
end if


end event

type pb_dupliquer from uo_picturebutton_390x120 within w_scripts_2013_config
integer x = 1317
integer y = 1756
integer width = 558
integer height = 152
integer taborder = 50
boolean bringtotop = true
string text = "Dupliquer"
string iconname = "lc_copy.png"
end type

event clicked;call super::clicked;

long v_id_depart, v_lig_depart
long v_id_arrivee, v_lig_arrivee
string v_libelle_depart

v_lig_depart = dw_liste.getrow()
v_id_depart = dw_liste.getitemnumber(v_lig_depart, "id")
v_libelle_depart = dw_liste.getitemString(v_lig_depart, "libelle")

dw_liste.insertrow(0)
v_lig_arrivee = dw_liste.rowcount()
dw_liste.scrolltorow(v_lig_arrivee)
dw_liste.SetItem(v_lig_arrivee, "libelle",left("Copie de "+ v_libelle_depart, 40))
dw_liste.setcolumn(1)
dw_liste.setfocus()
dw_liste.SelectRow(0,False)
dw_liste.SelectRow(v_lig_arrivee,True)


enregistrement()

v_id_arrivee =  dw_liste.getitemnumber(v_lig_arrivee, "id")

insert into acquis_script_cadres_imgs ("id", "ordre_trie", "libelle_cadre_img", "type_image", "operation" )
(select :v_id_arrivee, "ordre_trie", "libelle_cadre_img", "type_image", "operation" from acquis_script_cadres_imgs where "id" = :v_id_depart ) ;

if sqlca.sqlcode = 0 then 
	commit ;
else
	rollback ;
	Messagebox("ATTENTION","Erreur dans la duplication du script !")
end if


dw_lignes.retrieve( v_id_arrivee )


end event

