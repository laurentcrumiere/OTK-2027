$PBExportHeader$w_exporter_trace.srw
forward
global type w_exporter_trace from window
end type
type st_etape from statictext within w_exporter_trace
end type
type dw_temps_traitement_cherche from datawindow within w_exporter_trace
end type
type cb_exporter from uo_picturebutton_390x120 within w_exporter_trace
end type
type cb_annuler from uo_picturebutton_390x120 within w_exporter_trace
end type
type st_sel2 from statictext within w_exporter_trace
end type
type ddlb_emplacement_mesures from dropdownlistbox within w_exporter_trace
end type
type cbx_mesures from checkbox within w_exporter_trace
end type
type cbx_trace from checkbox within w_exporter_trace
end type
type st_patience from statictext within w_exporter_trace
end type
type p_sablier from picture within w_exporter_trace
end type
type ole_image from gearbox within w_exporter_trace
end type
type st_sel from statictext within w_exporter_trace
end type
type ddlb_emplacement_trace from dropdownlistbox within w_exporter_trace
end type
end forward

global type w_exporter_trace from window
integer x = 50
integer y = 400
integer width = 1819
integer height = 1460
boolean titlebar = true
string title = "Exportation du tracé ou des mesures"
windowtype windowtype = response!
long backcolor = 15780518
st_etape st_etape
dw_temps_traitement_cherche dw_temps_traitement_cherche
cb_exporter cb_exporter
cb_annuler cb_annuler
st_sel2 st_sel2
ddlb_emplacement_mesures ddlb_emplacement_mesures
cbx_mesures cbx_mesures
cbx_trace cbx_trace
st_patience st_patience
p_sablier p_sablier
ole_image ole_image
st_sel st_sel
ddlb_emplacement_trace ddlb_emplacement_trace
end type
global w_exporter_trace w_exporter_trace

type variables
// Code du patient traité 
double  var_code_local   // Code PWO

// paramètres
param_lien_odrade p
end variables

forward prototypes
public subroutine exporter ()
end prototypes

public subroutine exporter ();//n_bitmap in_bitmap
//n_runandwait in_runandwait
//
//this.hide()
//st_patience.visible = true
//p_sablier.visible = true
//this.height = 650
//this.y = w_main_odrade.tableau.y +w_main_odrade.tableau.height + 10
//
//cbx_trace.visible = false
//cbx_mesures.visible = false
//cb_exporter.visible = false
//cb_annuler.visible = false
//ddlb_emplacement_mesures.visible = false
//ddlb_emplacement_trace.visible = false
//st_sel.visible = false
//st_sel2.visible = false
//
//this.backcolor = rgb(255,255,255)
//
//this.show()
//
//sleep(10)
//
////Principe : 
////On exporte un fichier .BMP dans un rep temporaire .. on l'acquiert ensuite
//
//String is_tempdir
//is_tempdir = in_bitmap.of_GetTempPath()
//
//String ls_fname
//Blob lblb_screen
//
//
//// Fichier temporaire
//ls_fname = is_tempdir + "control.bmp"
//
//
//integer num_pour_save
//string num_fichier, true_nom_fichier, vers_dossier_photo, chemindossier
//
//// on fait 2 boucle pour tracé et mesures
//integer cpt 
//boolean ok_export
//boolean ok_cpt1, ok_cpt2
//string libelle_export
//
//ok_cpt1 = false
//ok_cpt2 = false
//
//for cpt = 1 to 2
//	
//	ok_export = false
//	
//	if cpt = 1 then
//		// tracé ?
//		if cbx_trace.checked then
//			this.x = 0
//			lblb_screen = in_bitmap.of_ControlCapture(w_main_odrade.p_1)
//			libelle_export = "tracé"
//			ok_export = true
//			num_pour_save = ddlb_emplacement_trace.FindItem(ddlb_emplacement_trace.text,0)
//		end if
//	else
//		if cbx_mesures.checked then
//			//this.x = w_main_odrade.p_1.x
//			lblb_screen = in_bitmap.of_ControlCapture(w_main_odrade.tableau)
//			libelle_export = "tableau de mesures"
//			num_pour_save = ddlb_emplacement_mesures.FindItem(ddlb_emplacement_mesures.text,0)
//			ok_export = true
//		end if
//	end if
//	
//	if ok_export then
//
//		in_bitmap.of_WriteBlob(ls_fname, lblb_screen)
//		
//		ole_image.charger_image(ls_fname)
//		
//		
//		
//		// Construction du fichier de destination
//		// donne le "xxx" de depart des ole_photo"xxx"
//		
//		// on retrouve le futur nom qu'il va avoir ds notre rep photo(cf. pwophotos.ini)
//		num_fichier = num_nom_photo(num_pour_save)
//		true_nom_fichier = profilestring(dir_photos + inifile_photo, section, "ole_photo" + num_fichier,"")
//			
//		vers_dossier_photo = dir_photos + string(var_code_local)
//		//if not fxg_FileExists(vers_dossier_photo) then CreateDirectoryA(vers_dossier_photo,sa)
//		
//		
//		// path complet du fichier ds notre rep photo
//		vers_dossier_photo = vers_dossier_photo + "\"+true_nom_fichier
//		
//		
//		if ole_image.acquis_fichier_photo(ls_fname,vers_dossier_photo ) <> 1 then 
//			messagebox("Attention !","Une erreur est survenue dans votre script d'exportation du "+libelle_export)
//		else
//			
//			if p.mode = 0 then // mode manuel
//				if cpt= 1 then
//					ok_cpt1 = true
//				else
//					ok_cpt2 = true
//				end if
//			end if
//		end if
//	end if
//next 
//
//FileDelete(ls_fname)
//
//
//if ok_cpt1 or ok_cpt2 then
//	if ok_cpt1 and ok_cpt2 then
//		
//		Messagebox("ATTENTION !","Les exportations du tableau de mesures et du tracé ont été réalisées avec succès !")
//	else
//		Messagebox("ATTENTION !","L'exportation du "+libelle_export+" a été réalisée avec succès !")
//	end if
//end if
//
//
//close(w_patience)
//
//
//if p.mode = 0 then
//	close(this)
//end if
//
//
//
//
end subroutine

on w_exporter_trace.create
this.st_etape=create st_etape
this.dw_temps_traitement_cherche=create dw_temps_traitement_cherche
this.cb_exporter=create cb_exporter
this.cb_annuler=create cb_annuler
this.st_sel2=create st_sel2
this.ddlb_emplacement_mesures=create ddlb_emplacement_mesures
this.cbx_mesures=create cbx_mesures
this.cbx_trace=create cbx_trace
this.st_patience=create st_patience
this.p_sablier=create p_sablier
this.ole_image=create ole_image
this.st_sel=create st_sel
this.ddlb_emplacement_trace=create ddlb_emplacement_trace
this.Control[]={this.st_etape,&
this.dw_temps_traitement_cherche,&
this.cb_exporter,&
this.cb_annuler,&
this.st_sel2,&
this.ddlb_emplacement_mesures,&
this.cbx_mesures,&
this.cbx_trace,&
this.st_patience,&
this.p_sablier,&
this.ole_image,&
this.st_sel,&
this.ddlb_emplacement_trace}
end on

on w_exporter_trace.destroy
destroy(this.st_etape)
destroy(this.dw_temps_traitement_cherche)
destroy(this.cb_exporter)
destroy(this.cb_annuler)
destroy(this.st_sel2)
destroy(this.ddlb_emplacement_mesures)
destroy(this.cbx_mesures)
destroy(this.cbx_trace)
destroy(this.st_patience)
destroy(this.p_sablier)
destroy(this.ole_image)
destroy(this.st_sel)
destroy(this.ddlb_emplacement_trace)
end on

event open;centrer(this)

this.backcolor = couleur_fond_fenetre
colore_tous_objets_window(this, couleur_fond_fenetre)

// Si imagerie 2013 ... Pas de demande cadre
if imagerie_2013 then
	ddlb_emplacement_mesures.visible = false
	ddlb_emplacement_trace.visible = false
	st_sel.visible = false
	st_sel2.visible = false

	dw_temps_traitement_cherche.visible = true
	dw_temps_traitement_cherche.settransobject(sqlca)
	dw_temps_traitement_cherche.retrieve()
	st_etape.visible = true

end if


p = Message.PowerObjectParm

var_code_local = p.code_patient
//charge la ddlb avec les noms du fichiers pwophoto.INI
LoadDdlbPhoto ( ddlb_emplacement_trace , string ( var_code_local ) )

integer cpt, tot

tot = ddlb_emplacement_trace.totalitems() 

for cpt = 1 to tot
	ddlb_emplacement_mesures.additem(ddlb_emplacement_trace.Text ( cpt))
next

// Positionnement sur le cadre N+1
    ddlb_emplacement_mesures.selectitem( ddlb_emplacement_mesures.findItem(ddlb_emplacement_trace.Text, 0) + 1 )

if p.mode = 1 then
	// mode automatique
	
	// On fait le tracé => on positionne ce qu'il faut
	
	// TRACE
	cbx_trace.checked = true
//	ddlb_emplacement_trace.findItem(ddlb_emplacement_trace.Text ( p.numero_cadre_trace),1 )
	ddlb_emplacement_trace.selectitem( p.numero_cadre_trace )
	
	// TABLEAU
	cbx_mesures.checked = true
//	ddlb_emplacement_mesures.findItem(ddlb_emplacement_mesures.Text ( p.numero_cadre_tableau),1 )
	ddlb_emplacement_mesures.selectitem( p.numero_cadre_tableau)
	exporter()
	
	
	
	MessageBox("EXPORTATIONS","Les exportations ont été réalisées !~n~nVous pouvez si vous le souhaitez fermer le lien Odrade !")
	//close(w_main_odrade)
	
	close(this)
	
	
	
end if


end event

type st_etape from statictext within w_exporter_trace
boolean visible = false
integer x = 78
integer y = 904
integer width = 814
integer height = 76
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Etape de traitement :"
boolean focusrectangle = false
end type

type dw_temps_traitement_cherche from datawindow within w_exporter_trace
string tag = "no resize all"
integer x = 78
integer y = 1008
integer width = 1125
integer height = 76
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_temps_traitement_cherche"
boolean border = false
end type

type cb_exporter from uo_picturebutton_390x120 within w_exporter_trace
integer x = 882
integer y = 1172
integer taborder = 20
string text = "&Exporter"
boolean default = true
end type

event clicked;call super::clicked;

param_exporter p_export

if cbx_trace.checked then
	p_export.num_pour_trace = ddlb_emplacement_trace.FindItem(ddlb_emplacement_trace.text,0)
else
	p_export.num_pour_trace = 0
end if

if cbx_mesures.checked then
	p_export.num_pour_tableau = ddlb_emplacement_mesures.FindItem(ddlb_emplacement_mesures.text,0)
else
	p_export.num_pour_tableau = 0
end if


if imagerie_2013 then
	// temps de traitement
	p_export.temps_traitement =  dw_temps_traitement_cherche.GetItemNumber(1, "id")
end if

if p_export.num_pour_tableau + p_export.num_pour_trace <> 0 then
	if p_export.num_pour_tableau = p_export.num_pour_trace then
		Messagebox("ATTENTION","Vous devez sélectionner 2 emplacements différents !")
	else
		closewithreturn(parent,p_export)
	end if
else
	closewithreturn(parent,p_export)
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_exporter_trace
integer x = 448
integer y = 1172
integer width = 411
integer height = 152
integer taborder = 30
string text = "&Annuler"
end type

event clicked;call super::clicked;
param_exporter p

p.num_pour_trace = 0
p.num_pour_tableau = 0

closewithreturn(parent,p)
end event

type st_sel2 from statictext within w_exporter_trace
integer x = 50
integer y = 528
integer width = 1207
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Sélection de l~'emplacement (Mesures) :"
boolean focusrectangle = false
end type

type ddlb_emplacement_mesures from dropdownlistbox within w_exporter_trace
integer x = 37
integer y = 620
integer width = 1746
integer height = 508
integer taborder = 20
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

type cbx_mesures from checkbox within w_exporter_trace
integer x = 46
integer y = 432
integer width = 690
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Exporter les mesures"
boolean checked = true
end type

type cbx_trace from checkbox within w_exporter_trace
integer x = 55
integer y = 40
integer width = 567
integer height = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Exporter le tracé"
boolean automatic = false
boolean checked = true
end type

type st_patience from statictext within w_exporter_trace
boolean visible = false
integer x = 210
integer y = 32
integer width = 1189
integer height = 144
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 255
long backcolor = 553648127
boolean enabled = false
string text = "VEUILLEZ PATIENTER"
boolean focusrectangle = false
end type

type p_sablier from picture within w_exporter_trace
boolean visible = false
integer x = 713
integer y = 212
integer width = 229
integer height = 200
boolean originalsize = true
string picturename = "sablier.gif"
boolean focusrectangle = false
end type

type ole_image from gearbox within w_exporter_trace
integer x = 1883
integer y = 56
integer width = 475
integer height = 468
integer taborder = 20
end type

on ole_image.destroy
call gearbox::destroy
end on

type st_sel from statictext within w_exporter_trace
integer x = 50
integer y = 128
integer width = 1207
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
boolean enabled = false
string text = "Sélection de l~'emplacement (Tracé) :"
boolean focusrectangle = false
end type

type ddlb_emplacement_trace from dropdownlistbox within w_exporter_trace
integer x = 37
integer y = 208
integer width = 1746
integer height = 508
integer taborder = 10
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

