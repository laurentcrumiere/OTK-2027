$PBExportHeader$w_dental_monitoring_config.srw
forward
global type w_dental_monitoring_config from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_dental_monitoring_config
end type
type st_3 from statictext within w_dental_monitoring_config
end type
type sle_url from singlelineedit within w_dental_monitoring_config
end type
type cb_annuler from uo_picturebutton_390x120 within w_dental_monitoring_config
end type
type cb_1 from uo_picturebutton_390x120 within w_dental_monitoring_config
end type
type uo_dm from lien_dental_monitoring within w_dental_monitoring_config
end type
type dw_liste from datawindow within w_dental_monitoring_config
end type
type uo_1 from resize_fenetre within w_dental_monitoring_config
end type
type st_2 from statictext within w_dental_monitoring_config
end type
type sle_url_api from singlelineedit within w_dental_monitoring_config
end type
type cb_2 from uo_picturebutton_390x120 within w_dental_monitoring_config
end type
type dw_liste2 from datawindow within w_dental_monitoring_config
end type
type cb_code_praticien from uo_picturebutton_390x120 within w_dental_monitoring_config
end type
type cb_ajouter from uo_picturebutton_390x120 within w_dental_monitoring_config
end type
type cb_supprimer from uo_picturebutton_390x120 within w_dental_monitoring_config
end type
type gb_options from groupbox within w_dental_monitoring_config
end type
type cbx_verifier_presence from checkbox within w_dental_monitoring_config
end type
end forward

global type w_dental_monitoring_config from w_fenetre_arakis
integer width = 5307
integer height = 2648
string title = "Configuration de Dental Monitoring"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_fermer pb_fermer
st_3 st_3
sle_url sle_url
cb_annuler cb_annuler
cb_1 cb_1
uo_dm uo_dm
dw_liste dw_liste
uo_1 uo_1
st_2 st_2
sle_url_api sle_url_api
cb_2 cb_2
dw_liste2 dw_liste2
cb_code_praticien cb_code_praticien
cb_ajouter cb_ajouter
cb_supprimer cb_supprimer
gb_options gb_options
cbx_verifier_presence cbx_verifier_presence
end type
global w_dental_monitoring_config w_dental_monitoring_config

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();
sle_url.text = uo_dm.get_url()
sle_url_api.text = uo_dm.get_url_api()

// Remplissage de la liste
declare cur cursor for select code, nom, prenom from prati where actif = 1 order by nom, prenom, code ; 

string v_code, v_nom, v_prenom
integer lig, nb_compte, cpt_compte
string v_code_praticien

open cur ;
fetch cur  into :v_code, :v_nom, :v_prenom ;

do while sqlca.sqlcode = 0 
	
	// plusieurs lignes possibles par praticien
	nb_compte = uo_dm.get_nb_compte(v_code)
	
	for cpt_compte = 1 to nb_compte
		dw_liste.insertrow(9999)
		lig = dw_liste.rowcount()
		dw_liste.setitem(lig, "prati_code", v_code)
		dw_liste.setitem(lig, "prati_nom", v_nom)
		dw_liste.setitem(lig, "prati_prenom", v_prenom)
		dw_liste.setitem(lig, "numero_lu", cpt_compte)
	
		dw_liste.setitem(lig, "code_dm", uo_dm.get_code_praticien_dm(v_code, cpt_compte))
		dw_liste.setitem(lig, "libelle", uo_dm.get_libelle_praticien_dm(v_code, cpt_compte))
		dw_liste.setitem(lig, "cle_api", uo_dm.get_cle_api(v_code,cpt_compte))
		dw_liste.setitem(lig, "code_cabinet", uo_dm.get_code_cabinet(v_code, cpt_compte))
	next
	
	fetch cur  into :v_code, :v_nom, :v_prenom ;
loop

close cur ;

// pour reordonner !!!
dw_liste.sort()
dw_liste.groupcalc()


if version_ce_logiciel >= "36.90" then 
	gb_options.visible = true
	cbx_verifier_presence.visible = true
	if uo_dm.get_verification_presence() = "O" then 
		cbx_verifier_presence.checked = true
	else
		cbx_verifier_presence.checked = false
	end if
	gb_options.backcolor = couleur_fond_datawindow
end if
end subroutine

on w_dental_monitoring_config.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.st_3=create st_3
this.sle_url=create sle_url
this.cb_annuler=create cb_annuler
this.cb_1=create cb_1
this.uo_dm=create uo_dm
this.dw_liste=create dw_liste
this.uo_1=create uo_1
this.st_2=create st_2
this.sle_url_api=create sle_url_api
this.cb_2=create cb_2
this.dw_liste2=create dw_liste2
this.cb_code_praticien=create cb_code_praticien
this.cb_ajouter=create cb_ajouter
this.cb_supprimer=create cb_supprimer
this.gb_options=create gb_options
this.cbx_verifier_presence=create cbx_verifier_presence
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.sle_url
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_1
this.Control[iCurrent+6]=this.uo_dm
this.Control[iCurrent+7]=this.dw_liste
this.Control[iCurrent+8]=this.uo_1
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.sle_url_api
this.Control[iCurrent+11]=this.cb_2
this.Control[iCurrent+12]=this.dw_liste2
this.Control[iCurrent+13]=this.cb_code_praticien
this.Control[iCurrent+14]=this.cb_ajouter
this.Control[iCurrent+15]=this.cb_supprimer
this.Control[iCurrent+16]=this.gb_options
this.Control[iCurrent+17]=this.cbx_verifier_presence
end on

on w_dental_monitoring_config.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.st_3)
destroy(this.sle_url)
destroy(this.cb_annuler)
destroy(this.cb_1)
destroy(this.uo_dm)
destroy(this.dw_liste)
destroy(this.uo_1)
destroy(this.st_2)
destroy(this.sle_url_api)
destroy(this.cb_2)
destroy(this.dw_liste2)
destroy(this.cb_code_praticien)
destroy(this.cb_ajouter)
destroy(this.cb_supprimer)
destroy(this.gb_options)
destroy(this.cbx_verifier_presence)
end on

event open;call super::open;uo_1.taille(this)

init()


end event

type p_fond from w_fenetre_arakis`p_fond within w_dental_monitoring_config
integer x = 27
integer y = 1112
end type

type pb_fermer from uo_picturebutton_390x120 within w_dental_monitoring_config
integer x = 4055
integer y = 2344
integer width = 503
integer taborder = 60
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;close(parent)

end event

type st_3 from statictext within w_dental_monitoring_config
integer x = 50
integer y = 60
integer width = 965
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Url du portail Dental Monitoring :"
end type

type sle_url from singlelineedit within w_dental_monitoring_config
integer x = 1019
integer y = 40
integer width = 2482
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type cb_annuler from uo_picturebutton_390x120 within w_dental_monitoring_config
integer x = 2912
integer y = 2344
integer width = 503
integer taborder = 70
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;init()
end event

type cb_1 from uo_picturebutton_390x120 within w_dental_monitoring_config
integer x = 3483
integer y = 2344
integer width = 503
integer taborder = 30
boolean bringtotop = true
string text = "Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

uo_dm.set_url(sle_url.text)
uo_dm.set_url_api(sle_url_api.text)
 
 dw_liste.accepttext()
// mise à jour des infos de chaque praticien
integer i, v_numero_compte
string v_code_praticien, v_code_praticien_suivant
for i = 1 to dw_liste.rowcount()
	v_code_praticien = dw_liste.getitemstring(i, "prati_code")
	
	// Nombre de compte pour le praticien 
	
	v_numero_compte = dw_liste.getitemNumber(i, "numero")
	uo_dm.set_libelle_praticien_dm( string_non_nulle(dw_liste.getitemstring(i, "libelle" )) , v_code_praticien, v_numero_compte)
	uo_dm.set_code_praticien_dm( string_non_nulle(dw_liste.getitemstring(i, "code_dm" )) , v_code_praticien, v_numero_compte)
	uo_dm.set_cle_api(string_non_nulle(dw_liste.getitemstring(i, "cle_api" )) , v_code_praticien, v_numero_compte)
	uo_dm.set_code_cabinet(string_non_nulle(dw_liste.getitemstring(i, "code_cabinet" )) , v_code_praticien, v_numero_compte)
	
	if i <  dw_liste.rowcount() then
		if v_code_praticien <> dw_liste.getitemstring(i + 1, "prati_code") then
			uo_dm.set_nb_compte(v_code_praticien, v_numero_compte)
		end if
	else
		if i =  dw_liste.rowcount() then
			// c'est le dernier
			uo_dm.set_nb_compte(v_code_praticien, v_numero_compte)
		end if
	end if
next



if cbx_verifier_presence.checked then 
	uo_dm.set_verification_presence("O") 
else
	uo_dm.set_verification_presence("N") 
end if
end event

type uo_dm from lien_dental_monitoring within w_dental_monitoring_config
event destroy ( )
boolean visible = false
integer x = 3840
integer y = 1284
integer taborder = 80
boolean bringtotop = true
end type

on uo_dm.destroy
call lien_dental_monitoring::destroy
end on

type dw_liste from datawindow within w_dental_monitoring_config
string tag = "brush"
integer x = 96
integer y = 336
integer width = 5088
integer height = 1108
integer taborder = 40
boolean bringtotop = true
boolean titlebar = true
string title = "Praticiens Orthokis"
string dataobject = "dw_dental_monitoring_param_praticiens"
boolean vscrollbar = true
boolean border = false
end type

type uo_1 from resize_fenetre within w_dental_monitoring_config
string tag = "uniquement pour les couleur"
boolean visible = false
integer x = 2766
integer y = 256
integer taborder = 50
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type st_2 from statictext within w_dental_monitoring_config
integer x = 50
integer y = 200
integer width = 965
integer height = 84
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Url de l~'API Dental Monitoring :"
end type

type sle_url_api from singlelineedit within w_dental_monitoring_config
integer x = 1019
integer y = 184
integer width = 2482
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type cb_2 from uo_picturebutton_390x120 within w_dental_monitoring_config
integer x = 599
integer y = 2344
integer width = 805
integer taborder = 80
boolean bringtotop = true
string text = "Association Patients"
string iconname = "preferences_16.png"
end type

event clicked;call super::clicked;open(w_dental_monitoring_association_patients)
end event

type dw_liste2 from datawindow within w_dental_monitoring_config
string tag = "brush"
integer x = 105
integer y = 1652
integer width = 4206
integer height = 624
integer taborder = 50
boolean bringtotop = true
boolean titlebar = true
string title = "Praticiens Dental Monitoring"
string dataobject = "dw_dental_monitoring_liste_praticiens"
boolean vscrollbar = true
boolean border = false
end type

type cb_code_praticien from uo_picturebutton_390x120 within w_dental_monitoring_config
integer x = 4361
integer y = 1908
integer width = 832
integer taborder = 90
boolean bringtotop = true
string text = "Recherche Codes DM"
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;// Liste des praticiens chez DM

string v_code_praticien

if dw_liste.rowcount() > 0 then
	
	v_code_praticien = dw_liste.getitemstring(dw_liste.getrow(), "prati_code")

	if fxg_demande_droits_modules(v_code_praticien , LIBELLE_MODULE_DENTAL_MONITORING) = 1 then
		
		open(w_patience)
		
		if dw_liste.getrow() > 0 then
			uo_dm.get_liste_des_praticiens(dw_liste2, v_code_praticien )
		end if
		
		if dw_liste2.rowcount() = 0 then
			Messagebox("ATTENTION","Aucun praticien n'a été trouvé dans Dental Monitoring !")
		end if
		
		close(w_patience)
	else
		Messagebox("ATTENTION","Ce praticien n'a pas l'autorisation pour utiliser Dental Monitoring !")
	end if
	
end if
end event

type cb_ajouter from uo_picturebutton_390x120 within w_dental_monitoring_config
integer x = 1714
integer y = 1480
integer width = 503
integer height = 152
integer taborder = 610
boolean bringtotop = true
string text = "&Ajouter"
string tiptext = "Ajout d~'un soin / soin prévu"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;

// Ajout d'une ligne à la fin du groupe du praticien ... 


string v_code_praticien 
long lig, tot, derniere_ligne, dernier_numero, lig_ajoutee


v_code_praticien = dw_liste.getitemstring(dw_liste.getrow(), "prati_code")

// recherche de la dernière ligne du praticien

tot = dw_liste.rowcount()

for lig = 1 to tot 
	if v_code_praticien = dw_liste.getitemstring(lig, "prati_code") then
		derniere_ligne = lig
		dernier_numero = dw_liste.getitemNumber(lig, "numero")
	end if
next

// insertion de la ligne 
lig_ajoutee = dw_liste.insertrow(derniere_ligne + 1)
dw_liste.scrolltorow(lig_ajoutee)

if lig_ajoutee > 0 then
	dw_liste.setitem(lig_ajoutee, "prati_code", dw_liste.getitemstring(derniere_ligne, "prati_code"))
	dw_liste.setitem(lig_ajoutee, "prati_nom", dw_liste.getitemstring(derniere_ligne, "prati_nom"))
	dw_liste.setitem(lig_ajoutee, "prati_prenom", dw_liste.getitemstring(derniere_ligne, "prati_prenom"))
	dw_liste.setitem(lig, "numero_lu", dernier_numero + 1 )
end if

end event

type cb_supprimer from uo_picturebutton_390x120 within w_dental_monitoring_config
integer x = 2601
integer y = 1472
integer width = 503
integer height = 152
integer taborder = 620
boolean bringtotop = true
string text = "&Supprimer"
string tiptext = "Suppression du ou des soins"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;long lig

if dw_liste.getrow() > 0 then
	lig = dw_liste.getrow()
	if dw_liste.getitemnumber(lig, "numero") = 1 then
		Messagebox("ATTENTION", "Vous n'avez pas le droit de supprimer le compte N°1")
	else
		if Messagebox("ATTENTION", "Confirmez-vous la suppression du compte N°" + string(dw_liste.getitemnumber(lig, "numero")) +" ?", Question!, YesNo!, 2) = 1 then
			dw_liste.deleterow(lig)
		end if
	end if
end if

end event

type gb_options from groupbox within w_dental_monitoring_config
integer x = 3643
integer width = 1403
integer height = 308
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Options"
end type

type cbx_verifier_presence from checkbox within w_dental_monitoring_config
integer x = 3735
integer y = 112
integer width = 1147
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Vérifier présence à l~'ouverture du dossier"
end type

