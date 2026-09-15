$PBExportHeader$w_explorateur_fichiers.srw
forward
global type w_explorateur_fichiers from w_fenetre_arakis
end type
type st_2 from statictext within w_explorateur_fichiers
end type
type pb_rafraichir_fichiers_rep_courant from uo_picturebutton_390x120 within w_explorateur_fichiers
end type
type st_100 from statictext within w_explorateur_fichiers
end type
type sle_rep_courant from uo_rep_acquis_courant_gui within w_explorateur_fichiers
end type
type cb_fermer from uo_picturebutton_780x120 within w_explorateur_fichiers
end type
type cb_start from uo_picturebutton_780x120 within w_explorateur_fichiers
end type
type ole_previsu from gearbox within w_explorateur_fichiers
end type
type st_3 from statictext within w_explorateur_fichiers
end type
type lb_temp from listbox within w_explorateur_fichiers
end type
type lb_files from listbox within w_explorateur_fichiers
end type
type lb_dir from listbox within w_explorateur_fichiers
end type
type tv_1 from treeview within w_explorateur_fichiers
end type
type pb_choix_rep_courant from picturebutton within w_explorateur_fichiers
end type
type pb_explorer from picturebutton within w_explorateur_fichiers
end type
type gb_1 from groupbox within w_explorateur_fichiers
end type
end forward

global type w_explorateur_fichiers from w_fenetre_arakis
integer width = 3744
integer height = 1960
string title = "Rafale clinique à partir de fichier"
windowtype windowtype = response!
long backcolor = 15780518
st_2 st_2
pb_rafraichir_fichiers_rep_courant pb_rafraichir_fichiers_rep_courant
st_100 st_100
sle_rep_courant sle_rep_courant
cb_fermer cb_fermer
cb_start cb_start
ole_previsu ole_previsu
st_3 st_3
lb_temp lb_temp
lb_files lb_files
lb_dir lb_dir
tv_1 tv_1
pb_choix_rep_courant pb_choix_rep_courant
pb_explorer pb_explorer
gb_1 gb_1
end type
global w_explorateur_fichiers w_explorateur_fichiers

type variables
String	ls_CurPath	//lecteur courrant
long		handle_lecteurs	//stock le handle le plus haut lors de la création des lecteurs
string	ls_Delimeter, ls_AllFiles	//lié à windows (cf open de la window)
long		il_rootitem

long		il_row
string	ls_SubDirectory[]	//pour créer une nouvelle branche
double	var_code_local
boolean	modif
int		num_depart
int		ordre_fichiers_selec[ ]
boolean	une_fois_deja[ ]
boolean	selection_tv1_une_fois
string	path_fichier_image


// pour le Drag and Drop avec l'OS 
nca_DragDrop	inca_DragDrop

end variables

forward prototypes
public function integer fx_get_drv_type (string as_drive)
public function integer init_treeview ()
public function long add_node (string as_path, string as_filename, long parent_node)
public function integer add_lecteurs (long parent_node)
end prototypes

public function integer fx_get_drv_type (string as_drive);// Determine la description d'un lecteur
string	lecteur

lecteur = as_drive + ":\"

Choose Case GetDriveTypeA(lecteur)
		Case 2	//pour un lecteur de Disque amovible
			Return 1

		Case 3	//pour un DisqueDur
			Return 2

		Case 5	//pour un cd-rom
			Return 3

		Case 4	//pour un lecteur réseaux
			Return 4
			
		case 6	//pour un lecteur en RAM
			return 0
			
		Case 0	//si lecteur pas reconnu
			Return 0
			
		Case Else
			Return 0
End Choose

end function

public function integer init_treeview ();
// PLUS UTILISEEE
//tv_1.SetRedraw(False)	//bloc l'affichage de l'arbre pour faire les modifs
//
////creer le premier noeud --> "Poste de Travail"
//il_RootItem = tv_1.InsertItemFirst(0, "Poste de Travail", 7)
//		
////creer les lecteurs au dessous et expand l'arbre
//add_lecteurs(il_RootItem)
//tv_1.ExpandItem(il_RootItem)
//
//tv_1.SetRedraw(True)		//met a jour l'affichage de l'arbre avec les modifs ci-dessus
return 1
//
end function

public function long add_node (string as_path, string as_filename, long parent_node);Long				num_NewItem, lg
//string			nom_fichier
//TreeViewItem	nod_Item
//integer			nbr_tot	//pour connaitre le nbr total de fichiers dans la "lb_files"
//
//lg = len(as_FileName)
//nom_fichier = mid(as_FileName,2,lg - 2)
//
//if nom_fichier = ".." then
//	return -1
//else
//	//recherche si besoin d'un petit [+] à coté du nom du rep
//	lb_temp.reset()
//	lb_temp.DirList(as_path + nom_fichier + "\*.*", 16+32768)
//	nbr_tot = lb_temp.TotalItems()
//	if nbr_tot > 1 then
//		nod_Item.Children	= true
//	else
//		nod_Item.Children	= false
//	end if
//	
//	nod_Item.PictureIndex = 5	//met une icone de fichier fermé
//	nod_Item.Label = nom_fichier
//	num_NewItem = tv_1.InsertItemLast(parent_node, nod_Item)
//end if
//
Return num_NewItem

end function

public function integer add_lecteurs (long parent_node);//Integer			lec_Items	//nbr total de lecteurs sur cet ordi
//Integer			lec_Index	//pour boucle sur les lecteurs
//integer			nbr_tot		//nbr total de fichiers dans la "lb_temp"
//TreeViewItem	nod_Item
//string			lec
//
//
//lb_dir.DirList("*.*",16384)	//met les différents lecteur dans une liste temporaire
//lec_Items = lb_dir.TotalItems()
//for lec_Index = 1 to lec_Items
//	//recherche si besoin d'un [+] à coté du nom du rep
//	lb_temp.reset()
//	lec = mid(lb_dir.text(lec_Index),3,1)
//	lb_temp.DirList(lec + ":\*.*", 16+32768)
//	nbr_tot = lb_temp.TotalItems()
//	if nbr_tot > 1 then
//		nod_Item.Children	= true
//	else
//		nod_Item.Children	= false
//	end if
//	//met l'icone suivant type de lecteur
//	nod_Item.PictureIndex = fx_get_drv_type(lec)
//	nod_Item.Label = lec + ":"
//	handle_lecteurs = tv_1.InsertItemLast(parent_node, nod_Item)
//next
//lb_dir.Reset()
//lb_temp.reset()
Return 1
//
end function

on w_explorateur_fichiers.create
int iCurrent
call super::create
this.st_2=create st_2
this.pb_rafraichir_fichiers_rep_courant=create pb_rafraichir_fichiers_rep_courant
this.st_100=create st_100
this.sle_rep_courant=create sle_rep_courant
this.cb_fermer=create cb_fermer
this.cb_start=create cb_start
this.ole_previsu=create ole_previsu
this.st_3=create st_3
this.lb_temp=create lb_temp
this.lb_files=create lb_files
this.lb_dir=create lb_dir
this.tv_1=create tv_1
this.pb_choix_rep_courant=create pb_choix_rep_courant
this.pb_explorer=create pb_explorer
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.pb_rafraichir_fichiers_rep_courant
this.Control[iCurrent+3]=this.st_100
this.Control[iCurrent+4]=this.sle_rep_courant
this.Control[iCurrent+5]=this.cb_fermer
this.Control[iCurrent+6]=this.cb_start
this.Control[iCurrent+7]=this.ole_previsu
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.lb_temp
this.Control[iCurrent+10]=this.lb_files
this.Control[iCurrent+11]=this.lb_dir
this.Control[iCurrent+12]=this.tv_1
this.Control[iCurrent+13]=this.pb_choix_rep_courant
this.Control[iCurrent+14]=this.pb_explorer
this.Control[iCurrent+15]=this.gb_1
end on

on w_explorateur_fichiers.destroy
call super::destroy
destroy(this.st_2)
destroy(this.pb_rafraichir_fichiers_rep_courant)
destroy(this.st_100)
destroy(this.sle_rep_courant)
destroy(this.cb_fermer)
destroy(this.cb_start)
destroy(this.ole_previsu)
destroy(this.st_3)
destroy(this.lb_temp)
destroy(this.lb_files)
destroy(this.lb_dir)
destroy(this.tv_1)
destroy(this.pb_choix_rep_courant)
destroy(this.pb_explorer)
destroy(this.gb_1)
end on

event open;ls_Delimeter = win_Delimiter	//Set directory delimeter based for window
ls_AllFiles  = win_AllFiles	//permet de spécifier les fichier recherchés

// init du GUI
pb_rafraichir_fichiers_rep_courant.TRIGGEREVENT(clicked!)

// On ne se sert plus du treeview depuis longtemps !!!!
//Init_treeview()

//c'est plus joli !
centrer(this)


lb_files.backcolor = couleur_fond_fenetre
//st_2.backcolor = couleur_fond_fenetre
//st_100.backcolor = couleur_fond_fenetre
//st_100.backcolor = couleur_fond_fenetre


end event

event close;SetCurrentDirectoryA( dir_ini )
end event

type p_fond from w_fenetre_arakis`p_fond within w_explorateur_fichiers
end type

type st_2 from statictext within w_explorateur_fichiers
integer x = 366
integer y = 544
integer width = 667
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Fichier(s) disponible(s) : "
end type

type pb_rafraichir_fichiers_rep_courant from uo_picturebutton_390x120 within w_explorateur_fichiers
integer x = 475
integer y = 640
integer width = 553
integer taborder = 30
string text = "Rafraîchir"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;path_fichier_image = ""
sle_rep_courant.fichiers_ds_rep_lister(lb_files)
if lb_files.SelectedIndex() > 0 then
	path_fichier_image = sle_rep_courant.text + lb_files.SelectedItem()
	ole_previsu.charger_image(path_fichier_image)
end if
end event

type st_100 from statictext within w_explorateur_fichiers
integer x = 37
integer y = 32
integer width = 914
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Répertoire d~'acquisition :"
end type

type sle_rep_courant from uo_rep_acquis_courant_gui within w_explorateur_fichiers
integer x = 37
integer y = 128
integer width = 1829
integer height = 96
integer taborder = 20
boolean enabled = false
end type

type cb_fermer from uo_picturebutton_780x120 within w_explorateur_fichiers
integer x = 2729
integer y = 1516
integer width = 777
integer height = 152
integer taborder = 50
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;
close(parent)
end event

type cb_start from uo_picturebutton_780x120 within w_explorateur_fichiers
integer x = 2729
integer y = 1348
integer width = 777
integer height = 152
integer taborder = 40
string text = "&Acquérir"
string iconname = "ACTIONS_ajouter.png"
end type

type ole_previsu from gearbox within w_explorateur_fichiers
integer x = 2715
integer y = 480
integer width = 887
integer height = 724
integer taborder = 30
integer mode_ocx = 1
end type

event mousemove;//

end event

on ole_previsu.destroy
call gearbox::destroy
end on

type st_3 from statictext within w_explorateur_fichiers
integer x = 1138
integer y = 396
integer width = 581
integer height = 148
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Fichiers du répertoire courant :"
end type

type lb_temp from listbox within w_explorateur_fichiers
boolean visible = false
integer x = 1499
integer y = 20
integer width = 338
integer height = 208
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type lb_files from listbox within w_explorateur_fichiers
integer x = 1134
integer y = 544
integer width = 699
integer height = 1232
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
borderstyle borderstyle = stylelowered!
end type

type lb_dir from listbox within w_explorateur_fichiers
boolean visible = false
integer x = 1138
integer y = 20
integer width = 297
integer height = 208
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type tv_1 from treeview within w_explorateur_fichiers
string tag = "PLUS UTILISER"
integer x = 73
integer y = 1568
integer width = 1024
integer height = 160
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
boolean linesatroot = true
string picturename[] = {"diskdriv.bmp","harddriv.bmp","cdrom.bmp","netdriv.bmp","folder.ico","foldopen.ico","LibraryOpen_icon_2!"}
long picturemaskcolor = 536870912
long statepicturemaskcolor = 536870912
end type

event selectionchanged;//treeViewItem	tree_Item
//integer			li_Index
//integer			li_Items
//long 				parent_handle
//int 				start_level
//
//
//if newhandle <> il_RootItem then
//	tv_1.SetRedraw(False)	//bloc l'affichage de l'arbre pour faire les modifs
//	tv_1.GetItem ( newhandle, tree_Item)	//isole le noeud de l'arbre à étudier
//	if not tree_Item.ExpandedOnce then
//		
//		//permet de retrouver le chemin et le stock dans "ls_curpath"
//		//ex : ls_curpath = "c:\windows\sytem\"
//		start_level = tree_Item.level
//		ls_curpath = tree_Item.label
//		if	start_level	> 2 then
//			parent_handle = newhandle
//			DO while tree_Item.level > 2
//				parent_handle = tv_1.FindItem ( ParentTreeItem!, parent_handle)
//				tv_1.GetItem ( parent_handle, tree_Item)
//				ls_curpath = tree_Item.label + ls_delimeter + ls_curpath
//			LOOP
//		end if
//		ls_curpath = ls_curpath + ls_delimeter
//		
//		//met à jour les rep dans lb_dir pour le rep courant dans "ls_curpath"
//		lb_dir.reset()
//		lb_dir.DirList(ls_curpath + ls_AllFiles, 16+32768)
//		//met à jour les rep dans lb_files pour le rep courant dans "ls_curpath"
//		lb_files.reset()
//		lb_files.DirList(ls_curpath + ls_AllFiles, 0+1+32)
//		
//		// boucle pour création des noeuds fils
//		li_Items = lb_dir.TotalItems()
//		for li_Index = 1 to li_Items
//			add_node(ls_curpath, lb_dir.Text(li_Index), newhandle)
//		next
//		
//	end if
//	tv_1.SetRedraw(True)		//met a jour l'affichage de l'arbre avec les modifs ci-dessus
//end if
//
end event

type pb_choix_rep_courant from picturebutton within w_explorateur_fichiers
integer x = 1883
integer y = 104
integer width = 183
integer height = 164
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_explorer.png"
string disabledname = "lc_explorer.png"
end type

event clicked;sle_rep_courant.rep_choisir()
pb_rafraichir_fichiers_rep_courant.TRIGGEREVENT(clicked!)
end event

type pb_explorer from picturebutton within w_explorateur_fichiers
integer x = 2085
integer y = 104
integer width = 183
integer height = 164
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
string picturename = "lc_windows.png"
string disabledname = "lc_explorer.png"
string powertiptext = "Lance l~'explorateur Windows pour prévisualiser toutes les images du répertoire"
end type

event clicked;

String v_commande

v_commande = "Explorer.exe /n," + sle_rep_courant.text


run(v_commande)
end event

type gb_1 from groupbox within w_explorateur_fichiers
integer x = 2633
integer y = 384
integer width = 1029
integer height = 880
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Prévisualisation de l~'image"
end type

