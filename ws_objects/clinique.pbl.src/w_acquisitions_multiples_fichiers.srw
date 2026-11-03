$PBExportHeader$w_acquisitions_multiples_fichiers.srw
forward
global type w_acquisitions_multiples_fichiers from w_explorateur_fichiers
end type
type st_1 from statictext within w_acquisitions_multiples_fichiers
end type
type ddlb_debut from dropdownlistbox within w_acquisitions_multiples_fichiers
end type
type cbx_effacer from checkbox within w_acquisitions_multiples_fichiers
end type
type uo_1 from resize_fenetre within w_acquisitions_multiples_fichiers
end type
type pb_supprimer from uo_picturebutton_780x120 within w_acquisitions_multiples_fichiers
end type
type dw_temps_traitement_cherche from datawindow within w_acquisitions_multiples_fichiers
end type
type lb_acquis from listbox within w_acquisitions_multiples_fichiers
end type
type st_4 from statictext within w_acquisitions_multiples_fichiers
end type
type gb_2 from groupbox within w_acquisitions_multiples_fichiers
end type
type dw_liste_acquisitions from datawindow within w_acquisitions_multiples_fichiers
end type
type st_payeur from statictext within w_acquisitions_multiples_fichiers
end type
type st_clic_droit from statictext within w_acquisitions_multiples_fichiers
end type
end forward

global type w_acquisitions_multiples_fichiers from w_explorateur_fichiers
integer width = 4526
integer height = 2164
string title = "Acquistions multiples d~'images à partir de fichiers"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
long backcolor = 16777215
st_1 st_1
ddlb_debut ddlb_debut
cbx_effacer cbx_effacer
uo_1 uo_1
pb_supprimer pb_supprimer
dw_temps_traitement_cherche dw_temps_traitement_cherche
lb_acquis lb_acquis
st_4 st_4
gb_2 gb_2
dw_liste_acquisitions dw_liste_acquisitions
st_payeur st_payeur
st_clic_droit st_clic_droit
end type
global w_acquisitions_multiples_fichiers w_acquisitions_multiples_fichiers

type variables


str_patient v_patient

string v_memo_rep_acquisition_courant
end variables

forward prototypes
public function integer detectercadrepardefaut (string pathrepphoto)
public subroutine initialisation ()
public subroutine selectionne_et_previsualise (long lig)
end prototypes

public function integer detectercadrepardefaut (string pathrepphoto);// fx qui tente de détecter le premier cadre de libre pour acquisistion
// ex : si cadre 1 , 2 , 3 , 6 et 7 de pris --> l'algo proposera le cadre 4

int	i , nbrTotCadre
boolean	trouve
int	valRetour = 1


if pathRepPhoto <> "" then
// si rep photo bien récup
	nbrTotCadre  = integer ( profilestring ( pathRepPhoto + inifile_photo , section , "nbr_photos", "" ) )
	
	do while not trouve and i < nbrTotCadre
		i++
		if not FileExists ( profilestring ( pathRepPhoto + inifile_photo , section , "ole_photo" +  num_nom_photo( i ) , "" ) ) then trouve = true
	loop
	
	if trouve then valretour =  i
else
// impossible de récup le path photo --> msg d'erreur
	messagebox ( "ERREUR" , "Votre répertoire photo doit être mal indiqué, ~nveuillez y remédier pour le bon fonctionnement de l'acquisition.")
end if

return valRetour

end function

public subroutine initialisation ();string vn,vp
double vnd

select nom, prenom, numero_dossier INTO :vn,:vp, :vnd FROM patient WHERE code = :var_code_local ;

if isnull(vn) then
	vn = ""
end if
if isnull(vp) then
	vp = ""
end if

this.title = "Acquisition Multiples Fichiers : " + vn + " " + vp +" - N° dossier : "+ string(vnd)

//h.chp()	//vérif la présence de la clef HASP

//lb_acquis.reset()

dw_liste_acquisitions.reset()

//charge la ddlb avec les noms du fichiers pwophoto.INI
LoadDdlbPhoto ( ddlb_debut , string ( var_code_local ) )

// Utile pour la mémo de l'image
ole_previsu.var_num_dossier = var_code_local


end subroutine

public subroutine selectionne_et_previsualise (long lig);
if lig > 0 and lig <= dw_liste_acquisitions.rowcount() then
	dw_liste_acquisitions.SelectRow(0,False)
	dw_liste_acquisitions.SelectRow(lig,True)
	dw_liste_acquisitions.setrow(lig)
	
	// Prévisualisation
	ole_previsu.visible = true
	ole_previsu.charger_image( dw_liste_acquisitions.GetItemString(lig, "chemin") +  dw_liste_acquisitions.GetItemString(lig, "nom_fichier") )
end if
end subroutine

on w_acquisitions_multiples_fichiers.create
int iCurrent
call super::create
this.st_1=create st_1
this.ddlb_debut=create ddlb_debut
this.cbx_effacer=create cbx_effacer
this.uo_1=create uo_1
this.pb_supprimer=create pb_supprimer
this.dw_temps_traitement_cherche=create dw_temps_traitement_cherche
this.lb_acquis=create lb_acquis
this.st_4=create st_4
this.gb_2=create gb_2
this.dw_liste_acquisitions=create dw_liste_acquisitions
this.st_payeur=create st_payeur
this.st_clic_droit=create st_clic_droit
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.ddlb_debut
this.Control[iCurrent+3]=this.cbx_effacer
this.Control[iCurrent+4]=this.uo_1
this.Control[iCurrent+5]=this.pb_supprimer
this.Control[iCurrent+6]=this.dw_temps_traitement_cherche
this.Control[iCurrent+7]=this.lb_acquis
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.gb_2
this.Control[iCurrent+10]=this.dw_liste_acquisitions
this.Control[iCurrent+11]=this.st_payeur
this.Control[iCurrent+12]=this.st_clic_droit
end on

on w_acquisitions_multiples_fichiers.destroy
call super::destroy
destroy(this.st_1)
destroy(this.ddlb_debut)
destroy(this.cbx_effacer)
destroy(this.uo_1)
destroy(this.pb_supprimer)
destroy(this.dw_temps_traitement_cherche)
destroy(this.lb_acquis)
destroy(this.st_4)
destroy(this.gb_2)
destroy(this.dw_liste_acquisitions)
destroy(this.st_payeur)
destroy(this.st_clic_droit)
end on

event open;call super::open;

// En entrée on reçoit une structure (en instance) avec
// - le code du patient
// - qui appelle :  M = le menu (possibilité de boucler sur le patient), E = l'explorateur, T = une acquisition TWAIN

v_patient =  message.PowerObjectparm

var_code_local = v_patient.code



centrer(this)
this.backcolor = couleur_fond_fenetre

//lb_acquis.backcolor = couleur_fond_datawindow
uo_1.taille(this)

initialisation()

if v_patient.appelant = 'T' then		// TWAIN

	// redirection du répertoir d'acquisition 
	v_memo_rep_acquisition_courant = sle_rep_courant.rep_courant.get_rep( ) 
	
	
	// Le répertoire d'acquistion est le sous dossier temporaire TEMP
	sle_rep_courant.text = dir_ini + "temp\"
	sle_rep_courant.rep_courant.set_rep( dir_ini + "temp\" ) 
	sle_rep_courant.rep_courant.enregistrer()

	// init du GUI
	pb_rafraichir_fichiers_rep_courant.TRIGGEREVENT(clicked!)
	cbx_effacer.checked = true
	gb_2.visible = false
	cbx_effacer.visible = false
	
	// Sélection de toutes les images
	long cpt, tot, lig
	tot = lb_files.TotalItems() 
	for cpt = 1 to tot
		dw_liste_acquisitions.insertrow(99999)
		lig = dw_liste_acquisitions.rowcount()
		dw_liste_acquisitions.SetItem(lig, "nom_fichier",  lb_files.text(cpt) )
		dw_liste_acquisitions.SetItem(lig, "chemin", sle_rep_courant.text )
	next
	if tot > 0 then
		selectionne_et_previsualise(1)
	end if
end if

// centrage de la sheet
//centrer_sheet(this,w_mdi)

// pour déclencher le drag and drop externe
//inca_DragDrop.BeginDragDrop( lb_acquis )

inca_DragDrop.BeginDragDrop( dw_liste_acquisitions )


DataWindowChild dwc

dw_liste_acquisitions.GetChild( "type_image" , dwc)
dwc.SetTransObject(sqlca)
dwc.retrieve()



if imagerie_2013 then
	st_1.text = "Etape de traitement :"
	//st_1.backcolor = couleur_fond_fenetre
	
	ddlb_debut.visible = false
	dw_temps_traitement_cherche.setTransObject(sqlca)
	dw_temps_traitement_cherche.retrieve()
	
	dw_temps_traitement_cherche.visible = true
	
	// temps de traitement par défaut
	long v_temps_defaut
	v_temps_defaut = proposition_temps_traitement(var_code_local)
	if dw_temps_traitement_cherche.rowcount() > 0 then
		dw_temps_traitement_cherche.setItem(1, "id", v_temps_defaut)
	else
		Messagebox("ATTENTION","Vous devez d'abord définir des étapes de traitement avant de faire des acquisitions (menu 'Outils, 'Paramètres imagerie').")
		close (this)
		return
	end if
end if






end event

event close;call super::close;

if v_patient.appelant = 'T' then		// TWAIN

	// On remet le bon rep d'acquisition
	sle_rep_courant.rep_courant.Set_rep( v_memo_rep_acquisition_courant ) 

end if
end event

type p_fond from w_explorateur_fichiers`p_fond within w_acquisitions_multiples_fichiers
end type

type st_2 from w_explorateur_fichiers`st_2 within w_acquisitions_multiples_fichiers
integer x = 27
integer y = 416
integer width = 370
integer height = 128
end type

type pb_rafraichir_fichiers_rep_courant from w_explorateur_fichiers`pb_rafraichir_fichiers_rep_courant within w_acquisitions_multiples_fichiers
integer x = 434
integer y = 416
integer width = 549
end type

event pb_rafraichir_fichiers_rep_courant::clicked;call super::clicked;//if ole_previsu.visible then path_fichier_image = sle_rep_courant.text + lb_files.SelectedItem()
end event

type st_100 from w_explorateur_fichiers`st_100 within w_acquisitions_multiples_fichiers
integer y = 224
integer height = 64
end type

type sle_rep_courant from w_explorateur_fichiers`sle_rep_courant within w_acquisitions_multiples_fichiers
integer y = 288
end type

type cb_fermer from w_explorateur_fichiers`cb_fermer within w_acquisitions_multiples_fichiers
integer x = 3575
integer y = 1864
end type

type cb_start from w_explorateur_fichiers`cb_start within w_acquisitions_multiples_fichiers
integer x = 3575
integer y = 1512
end type

event cb_start::clicked;
integer	i						//for the loop sur les index
integer	nbr_tot				//nombre total de fichiers dans la lb_files

long v_temps_traitement
open(w_patience)

// pour éviter erreur d'utilisation : désactivation du bouton START
this.enabled ( false )
cb_fermer.enabled ( false )

// avec suppression des fichiers ou pas
boolean suppression
suppression = cbx_effacer.checked

setnull(v_temps_traitement)

if imagerie_2013 then
	if dw_temps_traitement_cherche.rowcount() > 0 then
		v_temps_traitement = dw_temps_traitement_cherche.GetItemNumber(1, "id")
	end if
end if

// acquis a proprement parlé
ole_previsu.importer_multiples_images_dw(dw_liste_acquisitions, ddlb_debut, sle_rep_courant.text, var_code_local, suppression, true, v_temps_traitement)


if v_patient.appelant = 'E' or v_patient.appelant = 'T' then
	// depuis l'explorateur ... on sort de suite pour éviter les clics
	close(w_patience)
	close(parent)
else
	
	ole_previsu.rendre_vierge()
	ole_previsu.ole_image.visible = true
	
	// on fait sauter les sélection de lb_files
	nbr_tot = lb_files.TotalItems()
	For i = 1 To nbr_tot
		if lb_files.state(i) = 1 then lb_files.SetState(i,False)
	next
	
	// reset de la liste des acquisitions
	dw_liste_acquisitions.reset()
	
	//réactivation du bouton acquérir
	this.enabled ( true )
	cb_fermer.enabled ( true )
	
	if suppression then
		// on raffraichit la liste !!
		pb_rafraichir_fichiers_rep_courant.triggerevent(clicked!)
	end if

	close(w_patience)
end if
end event

type ole_previsu from w_explorateur_fichiers`ole_previsu within w_acquisitions_multiples_fichiers
integer x = 3479
integer y = 640
integer width = 914
integer height = 736
end type

type st_3 from w_explorateur_fichiers`st_3 within w_acquisitions_multiples_fichiers
boolean visible = false
integer x = 1902
integer y = 32
end type

type lb_temp from w_explorateur_fichiers`lb_temp within w_acquisitions_multiples_fichiers
integer x = 2523
integer y = 32
integer width = 219
integer height = 160
end type

type lb_files from w_explorateur_fichiers`lb_files within w_acquisitions_multiples_fichiers
integer x = 27
integer y = 576
integer width = 923
integer height = 1332
end type

event lb_files::selectionchanged;call super::selectionchanged;if index > 0 then 
	path_fichier_image = sle_rep_courant.text + this.text(index)
	if ole_previsu.charger_image(path_fichier_image) then
		ole_previsu.visible = true
			

		
		// Ajout d'une ligne avec le fichier selectionné
		
		string v_nom_seul, v_path_seul
		long lig 
		
		dw_liste_acquisitions.insertrow(99999)
		lig = dw_liste_acquisitions.rowcount()
		
		dw_liste_acquisitions.SetItem(lig, "nom_fichier",  this.text(index) )
		dw_liste_acquisitions.SetItem(lig, "chemin", sle_rep_courant.text )


		selectionne_et_previsualise(lig)

		
	else
		ole_previsu.visible = false
	end if
end if


end event

type lb_dir from w_explorateur_fichiers`lb_dir within w_acquisitions_multiples_fichiers
integer x = 2523
integer y = 192
integer width = 219
integer height = 160
end type

type tv_1 from w_explorateur_fichiers`tv_1 within w_acquisitions_multiples_fichiers
boolean visible = false
integer x = 2523
integer y = 352
integer width = 219
integer height = 192
end type

event tv_1::selectionchanged;call super::selectionchanged;//met à jour la lb_acquis
//lb_acquis.reset()

end event

event tv_1::clicked;call super::clicked;//met à jour la lb_acquis
//lb_acquis.reset()

end event

type pb_choix_rep_courant from w_explorateur_fichiers`pb_choix_rep_courant within w_acquisitions_multiples_fichiers
integer x = 1943
integer y = 260
end type

type pb_explorer from w_explorateur_fichiers`pb_explorer within w_acquisitions_multiples_fichiers
integer x = 2139
integer y = 256
end type

type gb_1 from w_explorateur_fichiers`gb_1 within w_acquisitions_multiples_fichiers
integer x = 3406
integer y = 544
integer width = 1061
integer height = 896
end type

type st_1 from statictext within w_acquisitions_multiples_fichiers
integer x = 37
integer y = 32
integer width = 1463
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Cadre de départ pour l~'importation :"
end type

type ddlb_debut from dropdownlistbox within w_acquisitions_multiples_fichiers
integer x = 37
integer y = 96
integer width = 1819
integer height = 1952
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cbx_effacer from checkbox within w_acquisitions_multiples_fichiers
integer x = 174
integer y = 1960
integer width = 1326
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Effacer les images en fin d~'acquisition"
end type

type uo_1 from resize_fenetre within w_acquisitions_multiples_fichiers
boolean visible = false
integer x = 709
integer y = 1300
integer taborder = 40
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type pb_supprimer from uo_picturebutton_780x120 within w_acquisitions_multiples_fichiers
integer x = 3575
integer y = 1688
integer width = 777
integer height = 152
integer taborder = 90
boolean bringtotop = true
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;
string fichier_a_supprimer

fichier_a_supprimer = trim(sle_rep_courant.text) + lb_files.SelectedItem ( )

if messagebox("ATTENTION","Vous allez supprimer DEFINITIVEMENT l'image '"+fichier_a_supprimer+"'.~n~nConfirmez-vous ?", Question!, Yesno!, 2) = 1 then
	// Suppression effective du fichier
	if not fileDelete (fichier_a_supprimer) then 
		MessageBox("ERREUR","Impossible de supprimer le fichier !")
	else
		// faut raffaichir la liste
		//charge la ddlb avec les noms du fichiers pwophoto.INI
		pb_rafraichir_fichiers_rep_courant.TRIGGEREVENT(clicked!)
	end if
	
end if
end event

type dw_temps_traitement_cherche from datawindow within w_acquisitions_multiples_fichiers
string tag = "no resize all"
boolean visible = false
integer x = 37
integer y = 104
integer width = 1129
integer height = 72
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_temps_traitement_cherche"
boolean border = false
end type

type lb_acquis from listbox within w_acquisitions_multiples_fichiers
string tag = "ne sert plus ... uniquement pour héritage"
boolean visible = false
integer x = 677
integer y = 1612
integer width = 480
integer height = 400
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

type st_4 from statictext within w_acquisitions_multiples_fichiers
string tag = "ne sert plus ... uniquement pour héritage"
boolean visible = false
integer x = 2107
integer y = 1948
integer width = 544
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "ne sert plus"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_acquisitions_multiples_fichiers
integer x = 37
integer y = 1912
integer width = 1568
integer height = 144
integer taborder = 60
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
end type

type dw_liste_acquisitions from datawindow within w_acquisitions_multiples_fichiers
event drop_files pbm_dropfiles
string tag = "brush"
integer x = 987
integer y = 516
integer width = 2363
integer height = 1356
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "Fichiers en cours d~'acquisition"
string dataobject = "dw_acquis_liste_fichiers"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event drop_files;

long ligapres , ligavant, lig


ligavant = rowcount()

// Ajout d'une ligne avec le(s) fichier(s) Drad and Dropé
inca_DragDrop.Populate( message.wordparm, this , "nom_fichier" )

string v_nom_seul, v_path_seul


ligapres = rowcount()

for lig  = ligavant + 1 to ligapres
	v_nom_seul = gfx_extraire_nom_fichier (GetItemString(lig, "nom_fichier"))
	v_path_seul = gfx_extraire_path_fichier (GetItemString(lig, "nom_fichier"))

	SetItem(lig, "nom_fichier", v_nom_seul )
	SetItem(lig, "chemin", v_path_seul )
next

selectionne_et_previsualise(lig)

end event

event clicked;If row > 0 Then

	selectionne_et_previsualise(row)

	
End If

end event

event rbuttondown;

if row > 0 then
	
	// on efface la ligne
	this.deleterow(row)
	
	
	if getrow() > 0 then
		

		selectionne_et_previsualise(getrow())
		
	else
		ole_previsu.visible = false
	end if
	

end if
end event

type st_payeur from statictext within w_acquisitions_multiples_fichiers
integer x = 1810
integer y = 1880
integer width = 832
integer height = 120
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez glisser / déposer des fichiers dans liste (depuis Windows)"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_clic_droit from statictext within w_acquisitions_multiples_fichiers
integer x = 1728
integer y = 2000
integer width = 1134
integer height = 68
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Clic Droit pour supprimer un élément de la liste"
boolean focusrectangle = false
end type

