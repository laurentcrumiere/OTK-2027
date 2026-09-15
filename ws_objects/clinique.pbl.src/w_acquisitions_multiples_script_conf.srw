$PBExportHeader$w_acquisitions_multiples_script_conf.srw
forward
global type w_acquisitions_multiples_script_conf from w_fenetre_arakis
end type
type uo_resize from resize_fenetre within w_acquisitions_multiples_script_conf
end type
type st_5 from statictext within w_acquisitions_multiples_script_conf
end type
type st_4 from statictext within w_acquisitions_multiples_script_conf
end type
type st_libelle_script from statictext within w_acquisitions_multiples_script_conf
end type
type pb_annuler from uo_picturebutton_390x120 within w_acquisitions_multiples_script_conf
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_acquisitions_multiples_script_conf
end type
type pb_fermer from uo_picturebutton_390x120 within w_acquisitions_multiples_script_conf
end type
type st_2 from statictext within w_acquisitions_multiples_script_conf
end type
type st_3 from statictext within w_acquisitions_multiples_script_conf
end type
type lb_ordre_acquis from listbox within w_acquisitions_multiples_script_conf
end type
type plb_cadres_images from uo_expl_media_cadres_images_lb within w_acquisitions_multiples_script_conf
end type
type st_1 from statictext within w_acquisitions_multiples_script_conf
end type
type st_6 from statictext within w_acquisitions_multiples_script_conf
end type
type dw_operations from datawindow within w_acquisitions_multiples_script_conf
end type
type cbx_effacer from checkbox within w_acquisitions_multiples_script_conf
end type
type gb_1 from groupbox within w_acquisitions_multiples_script_conf
end type
end forward

global type w_acquisitions_multiples_script_conf from w_fenetre_arakis
integer width = 3602
integer height = 1864
string title = "Configuration d~'un Script d~'acquisition"
windowtype windowtype = response!
long backcolor = 15780518
uo_resize uo_resize
st_5 st_5
st_4 st_4
st_libelle_script st_libelle_script
pb_annuler pb_annuler
pb_enregistrer pb_enregistrer
pb_fermer pb_fermer
st_2 st_2
st_3 st_3
lb_ordre_acquis lb_ordre_acquis
plb_cadres_images plb_cadres_images
st_1 st_1
st_6 st_6
dw_operations dw_operations
cbx_effacer cbx_effacer
gb_1 gb_1
end type
global w_acquisitions_multiples_script_conf w_acquisitions_multiples_script_conf

type variables
private uo_acquis_script_cadres_imgs scripts_cadres_imgs
private long id_script_courant
private boolean modifier = false
end variables

forward prototypes
private function boolean load_ds_into_lb (readonly datastore ds, ref listbox lb, string nom_colonne)
public subroutine sauvegarder ()
public function boolean unload_lb_into_tab (listbox lb, ref string tab[])
end prototypes

private function boolean load_ds_into_lb (readonly datastore ds, ref listbox lb, string nom_colonne);// charge une colonne d'un DS ds une LB
// renvoie true si pas de pb

boolean val_retour = false

dw_operations.reset()

if isnull(lb) then return val_retour
if isnull(ds) then return val_retour

// si rien ds le DS --> algo terminé !
long nbr_rows
nbr_rows = ds.rowcount()
if not nbr_rows > 0 then return TRUE

lb.reset()
string nom_elem
long ligne
for ligne = 1 to nbr_rows
	nom_elem = ds.getitemstring(ligne, nom_colonne)
	if not len(nom_elem) > 0 then 
		lb.reset()
		return val_retour
	end if
	lb.additem(string(nom_elem))
	
	// pour les opérations
	dw_operations.insertrow(99999)
	dw_operations.setitem(ligne, "operation", ds.getitemnumber(ligne, "operation"))
next
val_retour = true


// Mise à jour de la check box

string supprime
select supprime_apres into :supprime  from acquis_script where id = :id_script_courant ;
if 	supprime = 'O' then
	cbx_effacer.checked  = true
else
	cbx_effacer.checked  = false
end if

commit ;



return val_retour
end function

public subroutine sauvegarder ();// sauvegarde la conf du script

boolean erreur = false

string elems[]

if unload_lb_into_tab(lb_ordre_acquis, elems) then
	if scripts_cadres_imgs.remplacer_collection(elems, id_script_courant) then
		// mise à jour des opérations dans le datastore qui est no OK 
		integer cpt
		for cpt = 1 to dw_operations.rowcount()
			scripts_cadres_imgs.setitem(cpt,"operation",dw_operations.getitemnumber(cpt, "operation"))
		next 
		erreur = not scripts_cadres_imgs.enregistrer()
	end if
end if

if erreur then 
	messagebox("ERREUR ...", "Sauvegarde de la configuration du script impossible.", StopSign!)
else
	modifier = false
	
	// mise à jour de la table acquis_script
	string supprime 
	if cbx_effacer.checked then 
		supprime = 'O'
	else
		supprime = 'N' 
	end if
	update acquis_script set supprime_apres = :supprime where id = :id_script_courant ;
	commit ;


end if
end subroutine

public function boolean unload_lb_into_tab (listbox lb, ref string tab[]);// permet de décharger le contenu d'une listbox ds un tab en ref
// renvoie TRUE si opération réussit

boolean val_retour = false

if isnull(lb) then return  val_retour
// on traite uniquement un tab dynamique vierge
if not upperbound(tab) = 0 then return val_retour

long nbr_item
nbr_item = lb.TotalItems()
if nbr_item = 0 then 
	// aucun element ds la lb = maj val retour
	val_retour = true
else
	long ligne
	string item_text
	for ligne = 1 to nbr_item
		item_text = lb.text(ligne)
		if not len(item_text) > 0 then return val_retour
		tab[ligne] = item_text
	next
	val_retour = true
end if

return val_retour
end function

on w_acquisitions_multiples_script_conf.create
int iCurrent
call super::create
this.uo_resize=create uo_resize
this.st_5=create st_5
this.st_4=create st_4
this.st_libelle_script=create st_libelle_script
this.pb_annuler=create pb_annuler
this.pb_enregistrer=create pb_enregistrer
this.pb_fermer=create pb_fermer
this.st_2=create st_2
this.st_3=create st_3
this.lb_ordre_acquis=create lb_ordre_acquis
this.plb_cadres_images=create plb_cadres_images
this.st_1=create st_1
this.st_6=create st_6
this.dw_operations=create dw_operations
this.cbx_effacer=create cbx_effacer
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_resize
this.Control[iCurrent+2]=this.st_5
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.st_libelle_script
this.Control[iCurrent+5]=this.pb_annuler
this.Control[iCurrent+6]=this.pb_enregistrer
this.Control[iCurrent+7]=this.pb_fermer
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.st_3
this.Control[iCurrent+10]=this.lb_ordre_acquis
this.Control[iCurrent+11]=this.plb_cadres_images
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.st_6
this.Control[iCurrent+14]=this.dw_operations
this.Control[iCurrent+15]=this.cbx_effacer
this.Control[iCurrent+16]=this.gb_1
end on

on w_acquisitions_multiples_script_conf.destroy
call super::destroy
destroy(this.uo_resize)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_libelle_script)
destroy(this.pb_annuler)
destroy(this.pb_enregistrer)
destroy(this.pb_fermer)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.lb_ordre_acquis)
destroy(this.plb_cadres_images)
destroy(this.st_1)
destroy(this.st_6)
destroy(this.dw_operations)
destroy(this.cbx_effacer)
destroy(this.gb_1)
end on

event open;call super::open;// recup ID script courant
id_script_courant = message.doubleparm

// recup du libelle du script courant
uo_acquis_script scripts
scripts = create uo_acquis_script 
scripts.charger()
string libelle
libelle = scripts.get_libelle(id_script_courant)
if isnull(libelle) then libelle = ""
if not len(libelle) > 0 then 
	messagebox("ERREUR ...", "L'initialisation de la fenêtre de configuration a échouée.", StopSign!)
	triggerevent(close!)
end if
st_libelle_script.text = libelle
destroy scripts

// on charge l'ordre d'acquisition actuellement param
scripts_cadres_imgs = create uo_acquis_script_cadres_imgs
scripts_cadres_imgs.charger(id_script_courant)
if not load_ds_into_lb(scripts_cadres_imgs, lb_ordre_acquis, scripts_cadres_imgs.col_name_libelle_cadre)  then 
	messagebox("ERREUR ...", "Impossible de charger l'ordre d'acquisition du script.", StopSign!)
	triggerevent(close!)
end if


this.backcolor = couleur_fond_fenetre


// charge la liste des cadres images
plb_cadres_images.init(false)

// init resize
uo_resize.taille(this)

// maj GUI
centrer(this)
end event

event close;call super::close;if modifier then
	if messagebox("ATTENTION ...", "Voulez-vous sauvegarder les modifications ?", Question!, YesNo!) = 1 then
		sauvegarder()
	end if
end if
destroy scripts_cadres_imgs
end event

event resize;call super::resize;//uo_resize.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_acquisitions_multiples_script_conf
end type

type uo_resize from resize_fenetre within w_acquisitions_multiples_script_conf
boolean visible = false
integer x = 768
integer y = 640
integer taborder = 30
end type

on uo_resize.destroy
call resize_fenetre::destroy
end on

type st_5 from statictext within w_acquisitions_multiples_script_conf
integer x = 1170
integer y = 1376
integer width = 1047
integer height = 136
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Un double-clic (dans la liste ci-dessus) supprime le Cadre Image du Script"
end type

type st_4 from statictext within w_acquisitions_multiples_script_conf
integer x = 73
integer y = 1376
integer width = 1042
integer height = 192
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Un double-clic (dans la liste ci-dessus) rajoute le Cadre Image dans la liste d~'acquisition (ci-contre)"
end type

type st_libelle_script from statictext within w_acquisitions_multiples_script_conf
integer x = 622
integer y = 40
integer width = 1609
integer height = 96
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long textcolor = 255
long backcolor = 15780518
end type

type pb_annuler from uo_picturebutton_390x120 within w_acquisitions_multiples_script_conf
integer x = 1024
integer y = 1568
integer taborder = 40
string text = "&Annuler"
end type

event clicked;call super::clicked;if not load_ds_into_lb(scripts_cadres_imgs, lb_ordre_acquis, scripts_cadres_imgs.col_name_libelle_cadre)  then 
	messagebox("ERREUR ...", "Impossible d'afficher l'ordre d'acquisition initial.", StopSign!)
end if
end event

type pb_enregistrer from uo_picturebutton_390x120 within w_acquisitions_multiples_script_conf
integer x = 1426
integer y = 1568
integer taborder = 30
string text = "&Enregistrer"
end type

event clicked;call super::clicked;sauvegarder()
end event

type pb_fermer from uo_picturebutton_390x120 within w_acquisitions_multiples_script_conf
integer x = 1829
integer y = 1568
integer taborder = 30
string text = "&Fermer"
end type

event clicked;call super::clicked;close(parent)
end event

type st_2 from statictext within w_acquisitions_multiples_script_conf
integer x = 73
integer y = 160
integer width = 1061
integer height = 96
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Cadres images"
end type

type st_3 from statictext within w_acquisitions_multiples_script_conf
integer x = 1170
integer y = 160
integer width = 1061
integer height = 96
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Ordre d~'acquisition"
end type

type lb_ordre_acquis from listbox within w_acquisitions_multiples_script_conf
integer x = 1170
integer y = 256
integer width = 1061
integer height = 1120
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
boolean sorted = false
string item[] = {""}
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;if this.deleteitem(index) > 0 then 
	modifier = true
	dw_operations.deleterow(index)
end if
end event

event selectionchanged;

// on change aussi la sélection de la dw des opérations

dw_operations.selectrow(0, false)
dw_operations.selectrow(index, true)
dw_operations.setrow(index)



end event

type plb_cadres_images from uo_expl_media_cadres_images_lb within w_acquisitions_multiples_script_conf
integer x = 73
integer y = 256
integer width = 1061
integer height = 1120
integer taborder = 10
boolean multiselect = false
end type

event doubleclicked;call super::doubleclicked;if lb_ordre_acquis.additem(this.get_nom_cadre(index)) > 0 then 
	modifier = true
	dw_operations.insertrow(9999)
end if
end event

type st_1 from statictext within w_acquisitions_multiples_script_conf
integer x = 73
integer y = 64
integer width = 549
integer height = 96
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Script à configurer :"
end type

type st_6 from statictext within w_acquisitions_multiples_script_conf
integer x = 2245
integer y = 164
integer width = 1083
integer height = 96
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Opérations à réaliser lors de l~'acquisition"
end type

type dw_operations from datawindow within w_acquisitions_multiples_script_conf
integer x = 2267
integer y = 256
integer width = 1161
integer height = 1120
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_acquis_script_operations"
boolean vscrollbar = true
boolean livescroll = true
end type

event itemchanged;

modifier = true

end event

type cbx_effacer from checkbox within w_acquisitions_multiples_script_conf
integer x = 2309
integer y = 56
integer width = 1216
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Effacer les images en fin d~'acquisition"
end type

type gb_1 from groupbox within w_acquisitions_multiples_script_conf
integer x = 2267
integer width = 1285
integer height = 152
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
end type

