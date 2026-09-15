$PBExportHeader$w_etiquettes.srw
forward
global type w_etiquettes from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_etiquettes
end type
type dw_etiquettes from datawindow within w_etiquettes
end type
type pb_imprimer from uo_picturebutton_390x120 within w_etiquettes
end type
type st_3 from statictext within w_etiquettes
end type
type st_4 from statictext within w_etiquettes
end type
type st_7 from statictext within w_etiquettes
end type
type em_hauteur from editmask within w_etiquettes
end type
type pb_perso from uo_picturebutton_390x120 within w_etiquettes
end type
type em_nb_largeur from editmask within w_etiquettes
end type
type st_8 from statictext within w_etiquettes
end type
type em_largeur from editmask within w_etiquettes
end type
type st_9 from statictext within w_etiquettes
end type
type em_nb_hauteur from editmask within w_etiquettes
end type
type st_10 from statictext within w_etiquettes
end type
type em_marge_haute from editmask within w_etiquettes
end type
type st_11 from statictext within w_etiquettes
end type
type em_marge_basse from editmask within w_etiquettes
end type
type st_12 from statictext within w_etiquettes
end type
type st_1 from statictext within w_etiquettes
end type
type em_marge_gauche from editmask within w_etiquettes
end type
type em_marge_droite from editmask within w_etiquettes
end type
type ddlb_liste from dropdownlistbox within w_etiquettes
end type
type st_2 from statictext within w_etiquettes
end type
type em_espace_colonne from editmask within w_etiquettes
end type
type st_13 from statictext within w_etiquettes
end type
type em_espace_ligne from editmask within w_etiquettes
end type
type st_6 from statictext within w_etiquettes
end type
type sle_shape from singlelineedit within w_etiquettes
end type
type st_unite from statictext within w_etiquettes
end type
type pb_test from uo_picturebutton_390x120 within w_etiquettes
end type
type cb_appliquer from uo_picturebutton_390x120 within w_etiquettes
end type
type st_ex from statictext within w_etiquettes
end type
type em_nb_ex from editmask within w_etiquettes
end type
end forward

global type w_etiquettes from w_fenetre_arakis
integer width = 3803
integer height = 2592
string title = "Impression d~'Etiquettes"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_fermer pb_fermer
dw_etiquettes dw_etiquettes
pb_imprimer pb_imprimer
st_3 st_3
st_4 st_4
st_7 st_7
em_hauteur em_hauteur
pb_perso pb_perso
em_nb_largeur em_nb_largeur
st_8 st_8
em_largeur em_largeur
st_9 st_9
em_nb_hauteur em_nb_hauteur
st_10 st_10
em_marge_haute em_marge_haute
st_11 st_11
em_marge_basse em_marge_basse
st_12 st_12
st_1 st_1
em_marge_gauche em_marge_gauche
em_marge_droite em_marge_droite
ddlb_liste ddlb_liste
st_2 st_2
em_espace_colonne em_espace_colonne
st_13 st_13
em_espace_ligne em_espace_ligne
st_6 st_6
sle_shape sle_shape
st_unite st_unite
pb_test pb_test
cb_appliquer cb_appliquer
st_ex st_ex
em_nb_ex em_nb_ex
end type
global w_etiquettes w_etiquettes

type variables


// liste des adresses
datastore dw_liste

end variables

forward prototypes
public subroutine preview ()
end prototypes

public subroutine preview ();dw_etiquettes.visible = false
dw_etiquettes.reset()



// Application des formats d'étiquettes ...

dw_etiquettes.Object.DataWindow.Label.height = integer(em_hauteur.text)
dw_etiquettes.Object.DataWindow.Label.width = integer(em_largeur.text)

dw_etiquettes.Object.DataWindow.Label.columns = integer(em_nb_largeur.text)
dw_etiquettes.Object.DataWindow.Label.rows = integer(em_nb_hauteur.text)


dw_etiquettes.Object.DataWindow.Print.Margin.Top	= integer(em_marge_haute.text)
dw_etiquettes.Object.DataWindow.Print.Margin.Bottom	= integer(em_marge_basse.text)
dw_etiquettes.Object.DataWindow.Print.Margin.Left	= integer(em_marge_gauche.text)
dw_etiquettes.Object.DataWindow.Print.Margin.Right	= integer(em_marge_droite.text)


dw_etiquettes.Object.DataWindow.Label.columns.spacing = integer(em_espace_colonne.text)
dw_etiquettes.Object.DataWindow.Label.rows.spacing = integer(em_espace_ligne.text)

dw_liste.RowsCopy( 1, dw_liste.rowcount() , Primary! , dw_etiquettes, 1, Primary!) 

//string a
//a = dw_etiquettes.Object.DataWindow.Label.shape

//Messagebox("shape", dw_etiquettes.Object.DataWindow.Label.shape)

//dw_etiquettes.Modify("DataWindow.Label.shape='Rectangle'")
//.Object.DataWindow.Label.shape = "rectangle"
//sle_shape.text 

dw_etiquettes.visible = true
end subroutine

on w_etiquettes.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_etiquettes=create dw_etiquettes
this.pb_imprimer=create pb_imprimer
this.st_3=create st_3
this.st_4=create st_4
this.st_7=create st_7
this.em_hauteur=create em_hauteur
this.pb_perso=create pb_perso
this.em_nb_largeur=create em_nb_largeur
this.st_8=create st_8
this.em_largeur=create em_largeur
this.st_9=create st_9
this.em_nb_hauteur=create em_nb_hauteur
this.st_10=create st_10
this.em_marge_haute=create em_marge_haute
this.st_11=create st_11
this.em_marge_basse=create em_marge_basse
this.st_12=create st_12
this.st_1=create st_1
this.em_marge_gauche=create em_marge_gauche
this.em_marge_droite=create em_marge_droite
this.ddlb_liste=create ddlb_liste
this.st_2=create st_2
this.em_espace_colonne=create em_espace_colonne
this.st_13=create st_13
this.em_espace_ligne=create em_espace_ligne
this.st_6=create st_6
this.sle_shape=create sle_shape
this.st_unite=create st_unite
this.pb_test=create pb_test
this.cb_appliquer=create cb_appliquer
this.st_ex=create st_ex
this.em_nb_ex=create em_nb_ex
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_etiquettes
this.Control[iCurrent+3]=this.pb_imprimer
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_7
this.Control[iCurrent+7]=this.em_hauteur
this.Control[iCurrent+8]=this.pb_perso
this.Control[iCurrent+9]=this.em_nb_largeur
this.Control[iCurrent+10]=this.st_8
this.Control[iCurrent+11]=this.em_largeur
this.Control[iCurrent+12]=this.st_9
this.Control[iCurrent+13]=this.em_nb_hauteur
this.Control[iCurrent+14]=this.st_10
this.Control[iCurrent+15]=this.em_marge_haute
this.Control[iCurrent+16]=this.st_11
this.Control[iCurrent+17]=this.em_marge_basse
this.Control[iCurrent+18]=this.st_12
this.Control[iCurrent+19]=this.st_1
this.Control[iCurrent+20]=this.em_marge_gauche
this.Control[iCurrent+21]=this.em_marge_droite
this.Control[iCurrent+22]=this.ddlb_liste
this.Control[iCurrent+23]=this.st_2
this.Control[iCurrent+24]=this.em_espace_colonne
this.Control[iCurrent+25]=this.st_13
this.Control[iCurrent+26]=this.em_espace_ligne
this.Control[iCurrent+27]=this.st_6
this.Control[iCurrent+28]=this.sle_shape
this.Control[iCurrent+29]=this.st_unite
this.Control[iCurrent+30]=this.pb_test
this.Control[iCurrent+31]=this.cb_appliquer
this.Control[iCurrent+32]=this.st_ex
this.Control[iCurrent+33]=this.em_nb_ex
end on

on w_etiquettes.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_etiquettes)
destroy(this.pb_imprimer)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_7)
destroy(this.em_hauteur)
destroy(this.pb_perso)
destroy(this.em_nb_largeur)
destroy(this.st_8)
destroy(this.em_largeur)
destroy(this.st_9)
destroy(this.em_nb_hauteur)
destroy(this.st_10)
destroy(this.em_marge_haute)
destroy(this.st_11)
destroy(this.em_marge_basse)
destroy(this.st_12)
destroy(this.st_1)
destroy(this.em_marge_gauche)
destroy(this.em_marge_droite)
destroy(this.ddlb_liste)
destroy(this.st_2)
destroy(this.em_espace_colonne)
destroy(this.st_13)
destroy(this.em_espace_ligne)
destroy(this.st_6)
destroy(this.sle_shape)
destroy(this.st_unite)
destroy(this.pb_test)
destroy(this.cb_appliquer)
destroy(this.st_ex)
destroy(this.em_nb_ex)
end on

event open;call super::open;
dw_liste = create datastore
dw_liste = message.PowerObjectParm

Open(w_patience)


// les formats sont dans fichier_formats_etiquettes

if not FileExists(fichier_formats_etiquettes) then
	Messagebox("ERREUR","Impossible de localiser le fichier de format d'étiquettes ("+fichier_formats_etiquettes+").~n~nEssayez de Quitter puis relancer Orthokis.~n~nSi le problème persiste, veuillez contacter ARAKIS.")
else
	integer fichier_ini
	string ligne_lue
	
	fichier_ini = FileOpen(fichier_formats_etiquettes, LineMode!, read!)
	
	// pour lire la 1ère, pour rien
	FileRead(fichier_ini, ligne_lue)

	// Lecture jusqu'au premier groupe
	FileRead(fichier_ini, ligne_lue)
	do while left(ligne_lue,1) <> "[" 
		if len(trim(ligne_lue)) > 0 and left(ligne_lue, 1) <> ";" then
			
			// Faut virer le = à la fin
			ddlb_liste.AddItem( left(ligne_lue, len(ligne_lue) - 1))
		end if
		FileRead(fichier_ini, ligne_lue)
	loop
	
	Fileclose(fichier_ini)
end if



// recherche du label mémorisé la dernière fois
string v_format
v_format = profileString(dir_ini+inifile_orthokis,"ADMINI","Format_Etiquettes","")
ddlb_liste.SelectItem(v_format, 1)
ddlb_liste.TriggerEvent(SelectionChanged!)


// Génération des étiquettes
//preview()


close(w_patience)
end event

event close;call super::close;

// Mémorisation du label pour la prochaine fois
setprofilestring(dir_ini+inifile_orthokis,"ADMINI","Format_Etiquettes",ddlb_liste.text)

end event

type p_fond from w_fenetre_arakis`p_fond within w_etiquettes
integer x = 2345
integer y = 1040
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_etiquettes
integer x = 2853
integer y = 2248
integer width = 690
integer height = 152
integer taborder = 20
boolean bringtotop = true
boolean default = true
end type

type dw_etiquettes from datawindow within w_etiquettes
integer x = 37
integer y = 684
integer width = 3666
integer height = 1476
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_etiquettes"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type pb_imprimer from uo_picturebutton_390x120 within w_etiquettes
integer x = 2121
integer y = 2248
integer width = 690
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;If Messagebox("ATTENTION","Confirmez-vous l'impression des Etiquettes ?", Question!, YesNo!, 2) = 1  then
	dw_etiquettes.print()
end if
end event

type st_3 from statictext within w_etiquettes
integer x = 1207
integer y = 412
integer width = 690
integer height = 88
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nb Etiquettes en largeur"
end type

type st_4 from statictext within w_etiquettes
integer x = 1207
integer y = 204
integer width = 320
integer height = 76
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Hauteur"
end type

type st_7 from statictext within w_etiquettes
integer x = 279
integer y = 52
integer width = 590
integer height = 100
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Format d~'étiquettes :"
end type

type em_hauteur from editmask within w_etiquettes
integer x = 1637
integer y = 192
integer width = 357
integer height = 96
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####0"
end type

type pb_perso from uo_picturebutton_390x120 within w_etiquettes
integer x = 169
integer y = 2248
integer width = 690
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "Enreg Perso"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;// mémorisation des valeurs perso

string v_label

v_label = ddlb_liste.text 

SetProfileString(fichier_formats_etiquettes , v_label , "units", "3")

SetProfileString(fichier_formats_etiquettes , v_label , "height", em_hauteur.text)
SetProfileString(fichier_formats_etiquettes , v_label , "width", em_largeur.text)

SetProfileString(fichier_formats_etiquettes , v_label , "rows", em_nb_hauteur.text)
SetProfileString(fichier_formats_etiquettes , v_label , "columns", em_nb_largeur.text )


SetProfileString(fichier_formats_etiquettes , v_label , "top_margin", em_marge_haute.text)
SetProfileString(fichier_formats_etiquettes , v_label , "bottom_margin", em_marge_basse.text)
SetProfileString(fichier_formats_etiquettes , v_label , "left_margin", em_marge_gauche.text)
ProfileString(fichier_formats_etiquettes , v_label , "right_margin", em_marge_droite.text)


SetProfileString(fichier_formats_etiquettes , v_label , "columns.spacing", em_espace_colonne.text)
SetProfileString(fichier_formats_etiquettes , v_label , "rows.spacing", em_espace_ligne.text)


SetProfileString(fichier_formats_etiquettes , v_label , "shape", sle_shape.text)

preview()
end event

type em_nb_largeur from editmask within w_etiquettes
integer x = 1925
integer y = 408
integer width = 261
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#"
boolean spin = true
double increment = 1
string minmax = "1~~9"
end type

type st_8 from statictext within w_etiquettes
integer x = 1207
integer y = 308
integer width = 320
integer height = 80
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Largeur"
end type

type em_largeur from editmask within w_etiquettes
integer x = 1637
integer y = 300
integer width = 357
integer height = 96
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####0"
end type

type st_9 from statictext within w_etiquettes
integer x = 1207
integer y = 520
integer width = 690
integer height = 88
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nb Etiquettes en hauteur"
end type

type em_nb_hauteur from editmask within w_etiquettes
integer x = 1925
integer y = 516
integer width = 261
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#"
boolean spin = true
double increment = 1
string minmax = "1~~9"
end type

type st_10 from statictext within w_etiquettes
integer x = 279
integer y = 196
integer width = 402
integer height = 88
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Marge haute"
end type

type em_marge_haute from editmask within w_etiquettes
integer x = 736
integer y = 192
integer width = 357
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####0"
end type

type st_11 from statictext within w_etiquettes
integer x = 279
integer y = 304
integer width = 402
integer height = 88
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Marge basse"
end type

type em_marge_basse from editmask within w_etiquettes
integer x = 736
integer y = 300
integer width = 357
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####0"
end type

type st_12 from statictext within w_etiquettes
integer x = 279
integer y = 412
integer width = 402
integer height = 88
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Marge gauche"
end type

type st_1 from statictext within w_etiquettes
integer x = 279
integer y = 520
integer width = 402
integer height = 88
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Marge droite"
end type

type em_marge_gauche from editmask within w_etiquettes
integer x = 736
integer y = 408
integer width = 357
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####0"
end type

type em_marge_droite from editmask within w_etiquettes
integer x = 736
integer y = 516
integer width = 357
integer height = 96
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####0"
end type

type ddlb_liste from dropdownlistbox within w_etiquettes
integer x = 1093
integer y = 36
integer width = 1659
integer height = 1088
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean sorted = false
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;

// Mise à jour des éléments correspondant au choix ...


string v_label

v_label = this.text

//ddlb_unite.SelectItem( integer(ProfileString(fichier_formats_etiquettes , v_label , "units", "1")) - 1 )

if ProfileString(fichier_formats_etiquettes , v_label , "units", "1") = "2" then
	st_unite.text = "Unité : 1/1000 pouce"
else
	st_unite.text = "Unité : 1/1000 cm"
end if
	

em_hauteur.text = ProfileString(fichier_formats_etiquettes , v_label , "height", "1")
em_largeur.text = ProfileString(fichier_formats_etiquettes , v_label , "width", "1")

em_nb_hauteur.text = ProfileString(fichier_formats_etiquettes , v_label , "rows", "1")
em_nb_largeur.text = ProfileString(fichier_formats_etiquettes , v_label , "columns", "1")


em_marge_haute.text = ProfileString(fichier_formats_etiquettes , v_label , "top_margin", "1")
em_marge_basse.text = ProfileString(fichier_formats_etiquettes , v_label , "bottom_margin", "1")
em_marge_gauche.text = ProfileString(fichier_formats_etiquettes , v_label , "left_margin", "1")
em_marge_droite.text = ProfileString(fichier_formats_etiquettes , v_label , "right_margin", "1")


em_espace_colonne.text = ProfileString(fichier_formats_etiquettes , v_label , "columns.spacing", "1")
em_espace_ligne.text = ProfileString(fichier_formats_etiquettes , v_label , "rows.spacing", "1")


sle_shape.text = ProfileString(fichier_formats_etiquettes , v_label , "shape", "")


// Si c'est un persoi ou pas .. on libère ou pas ...
if left(v_label, 12) = "Format Perso" then
	em_hauteur.enabled = true
	em_largeur.enabled = true
	em_nb_hauteur.enabled = true
	em_nb_largeur.enabled = true
	em_marge_haute.enabled = true
	em_marge_basse.enabled = true
	em_marge_gauche.enabled = true
	em_marge_droite.enabled = true
	em_espace_colonne.enabled = true
	em_espace_ligne.enabled = true
	sle_shape.enabled = true
	pb_perso.enabled ( true )
else
	em_hauteur.enabled = false
	em_largeur.enabled = false
	em_nb_hauteur.enabled = false
	em_nb_largeur.enabled = false
	em_marge_haute.enabled = false
	em_marge_basse.enabled = false
	em_marge_gauche.enabled = false
	em_marge_droite.enabled = false
	em_espace_colonne.enabled = false
	em_espace_ligne.enabled = false
	sle_shape.enabled = false
	pb_perso.enabled ( false )
end if


preview()


end event

type st_2 from statictext within w_etiquettes
integer x = 2313
integer y = 196
integer width = 439
integer height = 88
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Espace colonne"
end type

type em_espace_colonne from editmask within w_etiquettes
integer x = 2811
integer y = 192
integer width = 357
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####0"
end type

type st_13 from statictext within w_etiquettes
integer x = 2313
integer y = 304
integer width = 439
integer height = 88
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Espace ligne"
end type

type em_espace_ligne from editmask within w_etiquettes
integer x = 2811
integer y = 300
integer width = 357
integer height = 96
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#####0"
end type

type st_6 from statictext within w_etiquettes
boolean visible = false
integer x = 2386
integer y = 576
integer width = 238
integer height = 88
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Shape"
end type

type sle_shape from singlelineedit within w_etiquettes
boolean visible = false
integer x = 2542
integer y = 576
integer width = 882
integer height = 112
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
borderstyle borderstyle = stylelowered!
end type

type st_unite from statictext within w_etiquettes
integer x = 2875
integer y = 56
integer width = 763
integer height = 88
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "unité"
alignment alignment = center!
boolean border = true
end type

type pb_test from uo_picturebutton_390x120 within w_etiquettes
integer x = 1390
integer y = 2248
integer width = 690
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "Imp. Test"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;// pour imprimer une page de test

string v_page_str
long v_page , v_pages_total

if dw_etiquettes.rowcount() > 0 then
	v_page_str = inputboxWithPropo("Impression d'une page de test", "Entrez le numéro de la page à imprimer :" , "1" ,  false )
	
	v_page = long(v_page_str)
	
	
	dw_etiquettes.modify ( 'datawindow.print.preview=yes' )
 	 v_pages_total = long ( dw_etiquettes.describe  ( "evaluate('pagecount()')" ) )
	v_pages_total =   long ( dw_etiquettes.describe   ("evaluate('pagecount()'," + string ( dw_etiquettes.rowcount() ) + ")"))
	
	
	if 0 < v_page  and v_page <= v_pages_total then
	
		// Range
		dw_etiquettes.Object.DataWindow.Print.Page.Range = string(v_page)+"-"+string(v_page)
		dw_etiquettes.print()
		
		// Toutes les pages
		dw_etiquettes.Object.DataWindow.Print.Page.Range = ""
		
	else
		
		MessageBox("ATTENION !","Le numéro de page doit être compris entre 1 et "+ string(v_pages_total ) + ".")
	end if
end if
end event

type cb_appliquer from uo_picturebutton_390x120 within w_etiquettes
integer x = 3150
integer y = 480
integer width = 535
integer taborder = 110
boolean bringtotop = true
string text = "Appliquer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;w_corres.generer_liste_etiquettes(integer(em_nb_ex.text))
dw_liste = w_corres.dw_liste_etiq
preview()

//dw_etiquettes.visible = false
//dw_etiquettes.reset()
//
//dw_liste.RowsCopy( 1, dw_liste.rowcount() , Primary! , dw_etiquettes, 1, Primary!) 
//
end event

type st_ex from statictext within w_etiquettes
integer x = 2313
integer y = 520
integer width = 480
integer height = 88
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nb Exemplaires "
end type

type em_nb_ex from editmask within w_etiquettes
integer x = 2811
integer y = 516
integer width = 261
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "1"
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "1~~9"
end type

