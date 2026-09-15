$PBExportHeader$w_acquisition_dental_monitoring.srw
forward
global type w_acquisition_dental_monitoring from w_fenetre_arakis
end type
type st_2 from statictext within w_acquisition_dental_monitoring
end type
type st_100 from statictext within w_acquisition_dental_monitoring
end type
type cb_fermer from uo_picturebutton_780x120 within w_acquisition_dental_monitoring
end type
type cb_start from uo_picturebutton_780x120 within w_acquisition_dental_monitoring
end type
type ole_previsu from gearbox within w_acquisition_dental_monitoring
end type
type dw_liste_acquisitions from datawindow within w_acquisition_dental_monitoring
end type
type dw_temps_traitement_cherche from datawindow within w_acquisition_dental_monitoring
end type
type dw_liste from datawindow within w_acquisition_dental_monitoring
end type
type ddlb_debut from dropdownlistbox within w_acquisition_dental_monitoring
end type
type gb_1 from groupbox within w_acquisition_dental_monitoring
end type
end forward

global type w_acquisition_dental_monitoring from w_fenetre_arakis
integer width = 4585
integer height = 1760
string title = "Acquisition de Scans Dental Monitoring"
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
st_2 st_2
st_100 st_100
cb_fermer cb_fermer
cb_start cb_start
ole_previsu ole_previsu
dw_liste_acquisitions dw_liste_acquisitions
dw_temps_traitement_cherche dw_temps_traitement_cherche
dw_liste dw_liste
ddlb_debut ddlb_debut
gb_1 gb_1
end type
global w_acquisition_dental_monitoring w_acquisition_dental_monitoring

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


lien_dental_monitoring uo_lien_dm
end variables

forward prototypes
public subroutine selectionne_et_previsualise (long lig)
end prototypes

public subroutine selectionne_et_previsualise (long lig);if lig > 0 and lig <= dw_liste_acquisitions.rowcount() then
	dw_liste_acquisitions.SelectRow(0,False)
	dw_liste_acquisitions.SelectRow(lig,True)
	dw_liste_acquisitions.setrow(lig)
	
	// Prévisualisation
	ole_previsu.visible = true
	ole_previsu.charger_image( dw_liste_acquisitions.GetItemString(lig, "chemin") +  dw_liste_acquisitions.GetItemString(lig, "nom_fichier") )
end if
end subroutine

on w_acquisition_dental_monitoring.create
int iCurrent
call super::create
this.st_2=create st_2
this.st_100=create st_100
this.cb_fermer=create cb_fermer
this.cb_start=create cb_start
this.ole_previsu=create ole_previsu
this.dw_liste_acquisitions=create dw_liste_acquisitions
this.dw_temps_traitement_cherche=create dw_temps_traitement_cherche
this.dw_liste=create dw_liste
this.ddlb_debut=create ddlb_debut
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.st_100
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.cb_start
this.Control[iCurrent+5]=this.ole_previsu
this.Control[iCurrent+6]=this.dw_liste_acquisitions
this.Control[iCurrent+7]=this.dw_temps_traitement_cherche
this.Control[iCurrent+8]=this.dw_liste
this.Control[iCurrent+9]=this.ddlb_debut
this.Control[iCurrent+10]=this.gb_1
end on

on w_acquisition_dental_monitoring.destroy
call super::destroy
destroy(this.st_2)
destroy(this.st_100)
destroy(this.cb_fermer)
destroy(this.cb_start)
destroy(this.ole_previsu)
destroy(this.dw_liste_acquisitions)
destroy(this.dw_temps_traitement_cherche)
destroy(this.dw_liste)
destroy(this.ddlb_debut)
destroy(this.gb_1)
end on

event open;

var_code_local =  message.Doubleparm



open(w_patience)

OpenUserObject(uo_lien_dm, 2000, 2000)
uo_lien_dm.visible = false

dw_liste_acquisitions.settransobject(sqlca)

// Mise à jour du titre
string vn,vp
double vnd

select nom, prenom, numero_dossier INTO :vn,:vp, :vnd FROM patient WHERE code = :var_code_local ;

if isnull(vn) then
	vn = ""
end if
if isnull(vp) then
	vp = ""
end if

this.title = "Acquisition de Scans Dental Monitoring : " + vn + " " + vp +" - N° dossier : "+ string(vnd)

uo_lien_dm.init(var_code_local)

//charge la ddlb avec les noms du fichiers pwophoto.INI
LoadDdlbPhoto ( ddlb_debut , string ( var_code_local ) )


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



// recherche des scans du patient
uo_lien_dm.get_liste_des_scans(dw_liste)


// Pour effacer les fichiers temporaires des scans en privisu précédents, si besoin
uo_listbox lb_files

OpenUserObject(lb_files, 2000, 2000)
lb_files.visible = false
fxg_supprimer_liste_fichiers(dir_ini,  "scan_dm_*.jpg", lb_files)

// pour les couleurs
this.backcolor = couleur_fond_fenetre
gb_1.backcolor = couleur_fond_fenetre


close(w_patience)

if dw_liste.rowcount() = 0 then
	Messagebox("ATTENTION", "Ce patient n'a pas de scan dans Dental Monitoring !")
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_acquisition_dental_monitoring
integer y = 644
end type

type st_2 from statictext within w_acquisition_dental_monitoring
integer x = 110
integer y = 280
integer width = 498
integer height = 96
integer textsize = -10
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Scans du patient"
end type

type st_100 from statictext within w_acquisition_dental_monitoring
integer x = 37
integer y = 32
integer width = 635
integer height = 88
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Etape de traitement :"
end type

type cb_fermer from uo_picturebutton_780x120 within w_acquisition_dental_monitoring
integer x = 3538
integer y = 1420
integer width = 777
integer height = 152
integer taborder = 50
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;
close(parent)
end event

type cb_start from uo_picturebutton_780x120 within w_acquisition_dental_monitoring
integer x = 3538
integer y = 1252
integer width = 777
integer height = 152
integer taborder = 40
string text = "&Acquérir"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;
integer	i						//for the loop sur les index
integer	nbr_tot				//nombre total de fichiers dans la lb_files

long v_temps_traitement
open(w_patience)

// pour éviter erreur d'utilisation : désactivation du bouton START
this.enabled ( false )
cb_fermer.enabled ( false )

setnull(v_temps_traitement)

if dw_temps_traitement_cherche.rowcount() > 0 then
	v_temps_traitement = dw_temps_traitement_cherche.GetItemNumber(1, "id")
end if

// acquis a proprement parlé
ole_previsu.importer_multiples_images_dw(dw_liste_acquisitions, ddlb_debut, dir_ini , var_code_local, false, true, v_temps_traitement)


close(w_patience)
close(parent)


end event

type ole_previsu from gearbox within w_acquisition_dental_monitoring
integer x = 3525
integer y = 384
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

type dw_liste_acquisitions from datawindow within w_acquisition_dental_monitoring
event drop_files pbm_dropfiles
string tag = "brush"
integer x = 1024
integer y = 268
integer width = 2363
integer height = 1356
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "Fichiers en cours d~'acquisition"
string dataobject = "dw_acquis_liste_fichiers"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

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

type dw_temps_traitement_cherche from datawindow within w_acquisition_dental_monitoring
string tag = "no resize all"
boolean visible = false
integer x = 37
integer y = 116
integer width = 1129
integer height = 72
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_temps_traitement_cherche"
boolean border = false
end type

type dw_liste from datawindow within w_acquisition_dental_monitoring
integer x = 27
integer y = 372
integer width = 658
integer height = 1240
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_dental_monitoring_liste_scan"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;

// Récupération du scan pour le prévisualiser

// On vérifie d'abord si pas déjà dans liste ...

long lig 
string nom_fichier_scan

nom_fichier_scan = "scan_dm_" + string(row) + ".jpg"

lig = dw_liste_acquisitions.find("nom_fichier = '" + nom_fichier_scan + "'", 0, 99999) 

if lig > 0 then 
	
	Messagebox("ATTENTION", "Ce scan est déjà dans la liste des acquisitions !")
	
else
	
	if uo_lien_dm.get_un_scan( row, getitemstring(row, "url") )  then
		
		// on prévisualise
		ole_previsu.visible = ole_previsu.charger_image(dir_ini + nom_fichier_scan)
	
		if ole_previsu.charger_image(dir_ini + nom_fichier_scan) then
			ole_previsu.visible = true
				
	
			
			// Ajout d'une ligne avec le fichier selectionné
			
			string v_nom_seul, v_path_seul
			
			dw_liste_acquisitions.insertrow(99999)
			lig = dw_liste_acquisitions.rowcount()
			
			dw_liste_acquisitions.SetItem(lig, "nom_fichier",  nom_fichier_scan)
			dw_liste_acquisitions.SetItem(lig, "chemin", dir_ini)
	
	
			selectionne_et_previsualise(lig)
	
			
		else
			ole_previsu.visible = false
		end if
	
	
	end if 
end if
end event

type ddlb_debut from dropdownlistbox within w_acquisition_dental_monitoring
boolean visible = false
integer x = 1728
integer y = 620
integer width = 1819
integer height = 1008
integer taborder = 40
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

type gb_1 from groupbox within w_acquisition_dental_monitoring
integer x = 3442
integer y = 288
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

