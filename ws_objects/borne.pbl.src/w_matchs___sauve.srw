$PBExportHeader$w_matchs___sauve.srw
$PBExportComments$Héritée de param
forward
global type w_matchs___sauve from w_param
end type
type dw_edition from datawindow within w_matchs___sauve
end type
type cb_2 from uo_picturebutton_390x120 within w_matchs___sauve
end type
end forward

global type w_matchs___sauve from w_param
integer width = 4219
integer height = 2272
string title = "Table des Types de dossiers"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
dw_edition dw_edition
cb_2 cb_2
end type
global w_matchs___sauve w_matchs___sauve

type variables
double max
	

end variables

on w_matchs___sauve.create
int iCurrent
call super::create
this.dw_edition=create dw_edition
this.cb_2=create cb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_edition
this.Control[iCurrent+2]=this.cb_2
end on

on w_matchs___sauve.destroy
call super::destroy
destroy(this.dw_edition)
destroy(this.cb_2)
end on

event open;//uo_1.taille(this)
dw_liste.settransobject(SQLCA)
dw_edition.settransobject(sqlca)
dw_liste.retrieve()

enregistrement_automatique = false

//if enregistrement_automatique then
//	cb_annuler.visible = false
//	cb_enregistrer.visible = false
//end if
//
//placer_image_fond(this, p_fond, image_fond_fenetre)

//colore_tous_objets_window(this, couleur_fond_fenetre)


// pour éliminer de base les inactifs .. mais que pour les tables concernées
//if cbx_avec_les_inactifs.visible  then
//	dw_liste.setfilter("actif = 1")
//	dw_liste.filter()
//end if




end event

type p_fond from w_param`p_fond within w_matchs___sauve
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_matchs___sauve
integer x = 37
integer y = 2020
end type

type cb_annuler from w_param`cb_annuler within w_matchs___sauve
integer x = 2981
integer y = 2020
end type

type cb_enregistrer from w_param`cb_enregistrer within w_matchs___sauve
integer x = 3387
integer y = 2020
end type

type cb_fermer from w_param`cb_fermer within w_matchs___sauve
integer x = 3794
integer y = 2020
end type

type cb_supprimer from w_param`cb_supprimer within w_matchs___sauve
integer x = 974
integer y = 2020
integer taborder = 40
end type

event cb_supprimer::clicked;string code
long ligne

if dw_liste.rowcount() > 0 then
	ligne = dw_liste.GetRow() 
	code = dw_liste.GetItemString(ligne,"code")
	
	IF code = 'A' OR code = 'R' THEN
		MessageBox("ATTENTION","Vous ne pouvez pas supprimer ce type de dossier !")
	ELSE	
		son(7)
		dw_liste.deleterow(ligne)
	end if
END IF	
end event

type cb_ajouter from w_param`cb_ajouter within w_matchs___sauve
integer x = 558
integer y = 2020
integer taborder = 30
boolean originalsize = false
end type

event cb_ajouter::clicked;long lig

dw_liste.InsertRow(0)
lig = dw_liste.rowcount()

dw_liste.SetItem(lig, "date", today())
dw_liste.SetItem(lig, "equipe1", ProfileString (dir_ini+"orthokis.ini","Borne","st_equip1_texte","RC Lens"))
dw_liste.SetItem(lig, "fanion1",  ProfileString (dir_ini+"orthokis.ini","Borne","image_fanion",""))

dw_liste.Setcolumn("equipe2")
dw_liste.SetFocus()

end event

type dw_liste from w_param`dw_liste within w_matchs___sauve
integer x = 14
integer y = 40
integer width = 4187
string dataobject = "dw_matchs_liste"
end type

event dw_liste::clicked;call super::clicked;If Row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(Row,True)
End If

end event

event dw_liste::buttonclicked;call super::buttonclicked;

string ficname,ficpath

string	ls_Object

ls_Object = String(dwo.name)


choose case ls_object
	case "b_1" 

		if GetFileOpenName("Fichiers Image JPG",ficname,ficpath,"JPG","Fichiers Images (*.jpg),*.Jpg") = 1 then
			SetItem(row, "fanion1", ficname)
		end if
		
	case "b_2" 

		if GetFileOpenName("Fichiers Image JPG",ficname,ficpath,"JPG","Fichiers Images (*.jpg),*.Jpg") = 1 then
			SetItem(row, "fanion2", ficname)
		end if
	end choose	
		
		
end event

type uo_1 from w_param`uo_1 within w_matchs___sauve
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_matchs___sauve
integer x = 2062
integer width = 718
string text = "Avec les matchs passés"
end type

event cbx_avec_les_inactifs::clicked;
// sélection ou pas des matchs anciens ..
if this.checked then
	dw_liste.setfilter("")
else
	dw_liste.setfilter("date >= today()")
end if

dw_liste.filter()

end event

type gb_filtre from w_param`gb_filtre within w_matchs___sauve
integer x = 1915
integer y = 2004
integer width = 1015
end type

type dw_edition from datawindow within w_matchs___sauve
boolean visible = false
integer x = 329
integer y = 596
integer width = 411
integer height = 432
integer taborder = 21
boolean bringtotop = true
string title = "none"
string dataobject = "dw_matchs_liste"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type cb_2 from uo_picturebutton_390x120 within w_matchs___sauve
integer x = 1390
integer y = 2020
integer taborder = 31
boolean bringtotop = true
string text = "&Imprimer"
boolean originalsize = false
string picturename = ""
string disabledname = ""
string powertiptext = "Imprime la liste"
end type

event clicked;call super::clicked;if Messagebox("Demande de confirmation","Confirmez-vous l'impression de la liste ?",Question!, YesNo!, 2) = 1 then 
	dw_edition.retrieve()
	dw_edition.print()
end if
end event

