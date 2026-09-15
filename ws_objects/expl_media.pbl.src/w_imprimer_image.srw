$PBExportHeader$w_imprimer_image.srw
forward
global type w_imprimer_image from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_imprimer_image
end type
type cb_imprimer from uo_picturebutton_390x120 within w_imprimer_image
end type
type dw_image_portrait from datawindow within w_imprimer_image
end type
type dw_image_paysage from datawindow within w_imprimer_image
end type
type rb_portrait from radiobutton within w_imprimer_image
end type
type rb_paysage from radiobutton within w_imprimer_image
end type
type cbx_nom from checkbox within w_imprimer_image
end type
type cbx_numero_dossier from checkbox within w_imprimer_image
end type
type cbx_date_naissance from checkbox within w_imprimer_image
end type
type cb_param from uo_picturebutton_390x120 within w_imprimer_image
end type
type cbx_date_image from checkbox within w_imprimer_image
end type
type cbx_praticien from checkbox within w_imprimer_image
end type
type cbx_adresse from checkbox within w_imprimer_image
end type
type gb_orientation from groupbox within w_imprimer_image
end type
type gb_titre from groupbox within w_imprimer_image
end type
type gb_baspage from groupbox within w_imprimer_image
end type
end forward

global type w_imprimer_image from w_fenetre_arakis
integer width = 4873
integer height = 3344
string title = "Imprimer Image"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_imprimer cb_imprimer
dw_image_portrait dw_image_portrait
dw_image_paysage dw_image_paysage
rb_portrait rb_portrait
rb_paysage rb_paysage
cbx_nom cbx_nom
cbx_numero_dossier cbx_numero_dossier
cbx_date_naissance cbx_date_naissance
cb_param cb_param
cbx_date_image cbx_date_image
cbx_praticien cbx_praticien
cbx_adresse cbx_adresse
gb_orientation gb_orientation
gb_titre gb_titre
gb_baspage gb_baspage
end type
global w_imprimer_image w_imprimer_image

type variables



double var_code_local

string titre, baspage

long v_numero_dossier
string v_nom, v_prenom
string v_titre, v_sexe, v_baspage, v_nom_praticien, v_prenom_praticien
string v_adresse1_praticien, v_adresse2_praticien, v_code_postal_praticien, v_ville_praticien
date v_date_naissance, v_date_image

end variables

forward prototypes
public subroutine affiche_image ()
public subroutine maj_titre ()
end prototypes

public subroutine affiche_image ();
if rb_portrait.checked then 
	dw_image_portrait.visible = true
	dw_image_paysage.visible = false
else
	dw_image_paysage.visible = true
	dw_image_portrait.visible = false
end if
end subroutine

public subroutine maj_titre ();

select isnull(patient.nom, '') , isnull(patient.prenom, ''),  numero_dossier , date_naissance, sexe,  isnull(prati.nom, '') , isnull(prati.prenom, ''),
isnull(adresse1, ''), isnull(adresse2,''), isnull(code_postal, ''), isnull(ville, '') 
into :v_nom, :v_prenom, :v_numero_dossier, :v_date_naissance, :v_sexe, :v_nom_praticien, :v_prenom_praticien ,
 :v_adresse1_praticien, :v_adresse2_praticien, :v_code_postal_praticien, :v_ville_praticien
from patient , prati 
where patient.code_praticien = prati.code and patient.code = :var_code_local ;


v_titre = ""
v_baspage = ""

if cbx_nom.checked then
	v_titre = v_nom + " " + v_prenom 
end if
if cbx_numero_dossier.checked then
	v_titre = v_titre +" ("+ string(v_numero_dossier) + ")"
end if
if cbx_date_naissance.checked then
	if v_sexe = "F" then
		v_titre = v_titre + " - Née le "
	else
		v_titre = v_titre + " - Né le "
	end if	
	v_titre = v_titre + string(v_date_naissance)
end if

if cbx_date_image.checked then
	v_titre = v_titre + " - Date image : " + string(v_date_image)
end if

if cbx_praticien.checked then 
	v_baspage = "Dr " + trim(v_nom_praticien) + " " + trim(v_prenom_praticien) 
end if

if cbx_adresse.checked then 
	v_baspage = v_baspage + " - " + v_adresse1_praticien + " " + v_adresse2_praticien + " - " + v_code_postal_praticien + " " + v_ville_praticien
end if
// titre
dw_image_paysage.setitem(1, "titre",  v_titre)
dw_image_portrait.setitem(1, "titre",  v_titre)

// Bas de page
dw_image_paysage.setitem(1, "baspage",  v_baspage)
dw_image_portrait.setitem(1, "baspage",  v_baspage)



end subroutine

on w_imprimer_image.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_imprimer=create cb_imprimer
this.dw_image_portrait=create dw_image_portrait
this.dw_image_paysage=create dw_image_paysage
this.rb_portrait=create rb_portrait
this.rb_paysage=create rb_paysage
this.cbx_nom=create cbx_nom
this.cbx_numero_dossier=create cbx_numero_dossier
this.cbx_date_naissance=create cbx_date_naissance
this.cb_param=create cb_param
this.cbx_date_image=create cbx_date_image
this.cbx_praticien=create cbx_praticien
this.cbx_adresse=create cbx_adresse
this.gb_orientation=create gb_orientation
this.gb_titre=create gb_titre
this.gb_baspage=create gb_baspage
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.dw_image_portrait
this.Control[iCurrent+4]=this.dw_image_paysage
this.Control[iCurrent+5]=this.rb_portrait
this.Control[iCurrent+6]=this.rb_paysage
this.Control[iCurrent+7]=this.cbx_nom
this.Control[iCurrent+8]=this.cbx_numero_dossier
this.Control[iCurrent+9]=this.cbx_date_naissance
this.Control[iCurrent+10]=this.cb_param
this.Control[iCurrent+11]=this.cbx_date_image
this.Control[iCurrent+12]=this.cbx_praticien
this.Control[iCurrent+13]=this.cbx_adresse
this.Control[iCurrent+14]=this.gb_orientation
this.Control[iCurrent+15]=this.gb_titre
this.Control[iCurrent+16]=this.gb_baspage
end on

on w_imprimer_image.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_imprimer)
destroy(this.dw_image_portrait)
destroy(this.dw_image_paysage)
destroy(this.rb_portrait)
destroy(this.rb_paysage)
destroy(this.cbx_nom)
destroy(this.cbx_numero_dossier)
destroy(this.cbx_date_naissance)
destroy(this.cb_param)
destroy(this.cbx_date_image)
destroy(this.cbx_praticien)
destroy(this.cbx_adresse)
destroy(this.gb_orientation)
destroy(this.gb_titre)
destroy(this.gb_baspage)
end on

event open;call super::open;
// Image à imprimer !
//OpenUserObject(image_locale, 0, 0)
uo_image image_locale
image_locale = create uo_image
image_locale  = message.PowerObjectParm

var_code_local = image_locale.var_code_local

//select isnull(nom, '') , isnull(prenom, ''),  numero_dossier , date_naissance, sexe
//into :v_nom, :v_prenom, :v_numero_dossier, :v_date_naissance, :v_sexe
//from patient
//where code = :var_code_local ;

v_date_image = image_locale.date_image

dw_image_portrait.insertrow(0)
dw_image_portrait.setitem(1, "fichier_image",  image_locale.nom_fichier_complet)


dw_image_paysage.insertrow(0)
dw_image_paysage.setitem(1, "fichier_image",  image_locale.nom_fichier_complet)

double dd
dd =  image_locale.height_original
dd = image_locale.width_original 


// pour déduire si on doit être en paysage ou portrait par défaut
if image_locale.height_original * 1.2  < image_locale.width_original then
	rb_portrait.checked = false
	rb_paysage.checked = true
else
	rb_portrait.checked = true
	rb_paysage.checked = false
end if

// Récuparation des paramètres du titre
if profilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_nom", "O") = "O" then
	cbx_nom.checked = true
else
	cbx_nom.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_numero_dossier", "O") = "O" then
	cbx_numero_dossier.checked = true
else
	cbx_numero_dossier.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_date_naissance", "O") = "O" then
	cbx_date_naissance.checked = true
else
	cbx_date_naissance.checked = false
end if

if profilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_date_image", "N") = "O" then
	cbx_date_image.checked = true
else
	cbx_date_image.checked = false
end if


if version_ce_logiciel < "36.90" then 
	gb_baspage.visible = false
	cbx_praticien.visible = false
	cbx_adresse.visible = false
else
	if profilestring(dir_ini+inifile_orthokis,"photos","baspage_imprimer_praticien", "N") = "O" then
		cbx_praticien.checked = true
	else
		cbx_praticien.checked = false
	end if
	
	if profilestring(dir_ini+inifile_orthokis,"photos","baspage_imprimer_adresse", "N") = "O" then
		cbx_adresse.checked = true
	else
		cbx_adresse.checked = false
	end if
end if
	

maj_titre()

affiche_image()
end event

type p_fond from w_fenetre_arakis`p_fond within w_imprimer_image
end type

type cb_annuler from uo_picturebutton_390x120 within w_imprimer_image
integer x = 3899
integer y = 3100
integer width = 640
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_imprimer from uo_picturebutton_390x120 within w_imprimer_image
integer x = 3730
integer y = 2952
integer width = 494
integer taborder = 20
boolean bringtotop = true
string text = "Impr."
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;
if rb_portrait.checked then
	dw_image_portrait.print()
else
	dw_image_paysage.print()
end if

// Mémorisation des paramètres du titre
if cbx_nom.checked then
	setprofilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_nom", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_nom", "N")
end if

if cbx_numero_dossier.checked then
	setprofilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_numero_dossier", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_numero_dossier", "N")
end if

if cbx_date_naissance.checked then
	setprofilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_date_naissance", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_date_naissance", "N")
end if

if cbx_date_image.checked then
	setprofilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_date_image", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"photos","titre_imprimer_date_image", "N")
end if

if cbx_praticien.checked then 
	Setprofilestring(dir_ini+inifile_orthokis,"photos","baspage_imprimer_praticien", "O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"photos","baspage_imprimer_praticien", "N")
end if

if cbx_adresse.checked then 
	Setprofilestring(dir_ini+inifile_orthokis,"photos","baspage_imprimer_adresse", "O")
else
	Setprofilestring(dir_ini+inifile_orthokis,"photos","baspage_imprimer_adresse", "N")
end if
end event

type dw_image_portrait from datawindow within w_imprimer_image
boolean visible = false
integer x = 32
integer width = 3438
integer height = 3228
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_imprimer_image_portrait"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_image_paysage from datawindow within w_imprimer_image
boolean visible = false
integer x = 32
integer width = 4809
integer height = 2248
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_imprimer_image_paysage"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type rb_portrait from radiobutton within w_imprimer_image
integer x = 3639
integer y = 2348
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Portrait"
boolean checked = true
end type

event clicked;
affiche_image()
end event

type rb_paysage from radiobutton within w_imprimer_image
integer x = 4187
integer y = 2348
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Paysage"
end type

event clicked;affiche_image()
end event

type cbx_nom from checkbox within w_imprimer_image
integer x = 3639
integer y = 2540
integer width = 462
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nom / Prénom"
end type

event clicked;maj_titre()
end event

type cbx_numero_dossier from checkbox within w_imprimer_image
integer x = 3639
integer y = 2620
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "N° Dossier"
end type

event clicked;maj_titre()
end event

type cbx_date_naissance from checkbox within w_imprimer_image
integer x = 4187
integer y = 2616
integer width = 480
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date Naissance"
end type

event clicked;maj_titre()
end event

type cb_param from uo_picturebutton_390x120 within w_imprimer_image
integer x = 4219
integer y = 2948
integer width = 494
integer taborder = 60
boolean bringtotop = true
string text = "&Param"
string tiptext = "Acces au paramatrége des imprimantes"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;printsetup()
end event

type cbx_date_image from checkbox within w_imprimer_image
integer x = 4187
integer y = 2536
integer width = 407
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Date Image"
end type

event clicked;maj_titre()
end event

type cbx_praticien from checkbox within w_imprimer_image
integer x = 3639
integer y = 2820
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Praticien"
end type

event clicked;maj_titre()
end event

type cbx_adresse from checkbox within w_imprimer_image
integer x = 4187
integer y = 2820
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Adresse"
end type

event clicked;maj_titre()
end event

type gb_orientation from groupbox within w_imprimer_image
integer x = 3511
integer y = 2284
integer width = 1285
integer height = 156
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Orientation"
end type

type gb_titre from groupbox within w_imprimer_image
integer x = 3520
integer y = 2460
integer width = 1275
integer height = 252
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Titre"
end type

type gb_baspage from groupbox within w_imprimer_image
integer x = 3520
integer y = 2732
integer width = 1275
integer height = 200
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Bas de page"
end type

