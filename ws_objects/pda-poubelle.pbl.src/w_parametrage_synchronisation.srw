$PBExportHeader$w_parametrage_synchronisation.srw
forward
global type w_parametrage_synchronisation from w_fenetre_arakis
end type
type st_3 from st_transparent within w_parametrage_synchronisation
end type
type rb_rdv_groupe from radiobutton within w_parametrage_synchronisation
end type
type rb_rdv_detail from radiobutton within w_parametrage_synchronisation
end type
type sle_periode_interdite_commentaire from singlelineedit within w_parametrage_synchronisation
end type
type cbx_groupe_corps_duree from checkbox within w_parametrage_synchronisation
end type
type cbx_groupe_corps_heure from checkbox within w_parametrage_synchronisation
end type
type cbx_groupe_corps_type_rdv from checkbox within w_parametrage_synchronisation
end type
type cbx_groupe_corps_fauteuil from checkbox within w_parametrage_synchronisation
end type
type cbx_groupe_corps_nom_prenom from checkbox within w_parametrage_synchronisation
end type
type sle_groupe_emplacement_libelle from singlelineedit within w_parametrage_synchronisation
end type
type sle_groupe_objet_libelle from singlelineedit within w_parametrage_synchronisation
end type
type st_1 from st_transparent within w_parametrage_synchronisation
end type
type cbx_corps_type_rdv from checkbox within w_parametrage_synchronisation
end type
type cbx_corps_fauteuil from checkbox within w_parametrage_synchronisation
end type
type cbx_corps_nom_prenom from checkbox within w_parametrage_synchronisation
end type
type sle_emplacement_libelle from singlelineedit within w_parametrage_synchronisation
end type
type rb_emplacement_libelle from radiobutton within w_parametrage_synchronisation
end type
type rb_emplacement_type_rdv from radiobutton within w_parametrage_synchronisation
end type
type rb_emplacement_fauteuil from radiobutton within w_parametrage_synchronisation
end type
type rb_emplacement_nom_prenom from radiobutton within w_parametrage_synchronisation
end type
type rb_objet_type_rdv from radiobutton within w_parametrage_synchronisation
end type
type rb_objet_fauteuil from radiobutton within w_parametrage_synchronisation
end type
type sle_objet_libelle from singlelineedit within w_parametrage_synchronisation
end type
type rb_objet_libelle from radiobutton within w_parametrage_synchronisation
end type
type rb_objet_nom_prenom from radiobutton within w_parametrage_synchronisation
end type
type pb_annuler from uo_picturebutton_390x120 within w_parametrage_synchronisation
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_parametrage_synchronisation
end type
type em_semaines from editmask within w_parametrage_synchronisation
end type
type dw_prati from datawindow within w_parametrage_synchronisation
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_parametrage_synchronisation
end type
type gb_objet from groupbox within w_parametrage_synchronisation
end type
type gb_1 from groupbox within w_parametrage_synchronisation
end type
type gb_2 from groupbox within w_parametrage_synchronisation
end type
type gb_3 from groupbox within w_parametrage_synchronisation
end type
type gb_5 from groupbox within w_parametrage_synchronisation
end type
type gb_6 from groupbox within w_parametrage_synchronisation
end type
type gb_7 from groupbox within w_parametrage_synchronisation
end type
type gb_4 from groupbox within w_parametrage_synchronisation
end type
type gb_9 from groupbox within w_parametrage_synchronisation
end type
type gb_8 from groupbox within w_parametrage_synchronisation
end type
type st_2 from st_transparent within w_parametrage_synchronisation
end type
type gb_10 from groupbox within w_parametrage_synchronisation
end type
type gb_11 from groupbox within w_parametrage_synchronisation
end type
type gb_12 from groupbox within w_parametrage_synchronisation
end type
end forward

global type w_parametrage_synchronisation from w_fenetre_arakis
integer width = 4302
integer height = 2564
string title = "Paramètres de Synchronisation"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
long backcolor = 15780518
st_3 st_3
rb_rdv_groupe rb_rdv_groupe
rb_rdv_detail rb_rdv_detail
sle_periode_interdite_commentaire sle_periode_interdite_commentaire
cbx_groupe_corps_duree cbx_groupe_corps_duree
cbx_groupe_corps_heure cbx_groupe_corps_heure
cbx_groupe_corps_type_rdv cbx_groupe_corps_type_rdv
cbx_groupe_corps_fauteuil cbx_groupe_corps_fauteuil
cbx_groupe_corps_nom_prenom cbx_groupe_corps_nom_prenom
sle_groupe_emplacement_libelle sle_groupe_emplacement_libelle
sle_groupe_objet_libelle sle_groupe_objet_libelle
st_1 st_1
cbx_corps_type_rdv cbx_corps_type_rdv
cbx_corps_fauteuil cbx_corps_fauteuil
cbx_corps_nom_prenom cbx_corps_nom_prenom
sle_emplacement_libelle sle_emplacement_libelle
rb_emplacement_libelle rb_emplacement_libelle
rb_emplacement_type_rdv rb_emplacement_type_rdv
rb_emplacement_fauteuil rb_emplacement_fauteuil
rb_emplacement_nom_prenom rb_emplacement_nom_prenom
rb_objet_type_rdv rb_objet_type_rdv
rb_objet_fauteuil rb_objet_fauteuil
sle_objet_libelle sle_objet_libelle
rb_objet_libelle rb_objet_libelle
rb_objet_nom_prenom rb_objet_nom_prenom
pb_annuler pb_annuler
pb_enregistrer pb_enregistrer
em_semaines em_semaines
dw_prati dw_prati
pb_1 pb_1
gb_objet gb_objet
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
gb_5 gb_5
gb_6 gb_6
gb_7 gb_7
gb_4 gb_4
gb_9 gb_9
gb_8 gb_8
st_2 st_2
gb_10 gb_10
gb_11 gb_11
gb_12 gb_12
end type
global w_parametrage_synchronisation w_parametrage_synchronisation

forward prototypes
public function character get_rdv_objet ()
end prototypes

public function character get_rdv_objet ();
char retour

//pb_annuler


return retour


end function

on w_parametrage_synchronisation.create
int iCurrent
call super::create
this.st_3=create st_3
this.rb_rdv_groupe=create rb_rdv_groupe
this.rb_rdv_detail=create rb_rdv_detail
this.sle_periode_interdite_commentaire=create sle_periode_interdite_commentaire
this.cbx_groupe_corps_duree=create cbx_groupe_corps_duree
this.cbx_groupe_corps_heure=create cbx_groupe_corps_heure
this.cbx_groupe_corps_type_rdv=create cbx_groupe_corps_type_rdv
this.cbx_groupe_corps_fauteuil=create cbx_groupe_corps_fauteuil
this.cbx_groupe_corps_nom_prenom=create cbx_groupe_corps_nom_prenom
this.sle_groupe_emplacement_libelle=create sle_groupe_emplacement_libelle
this.sle_groupe_objet_libelle=create sle_groupe_objet_libelle
this.st_1=create st_1
this.cbx_corps_type_rdv=create cbx_corps_type_rdv
this.cbx_corps_fauteuil=create cbx_corps_fauteuil
this.cbx_corps_nom_prenom=create cbx_corps_nom_prenom
this.sle_emplacement_libelle=create sle_emplacement_libelle
this.rb_emplacement_libelle=create rb_emplacement_libelle
this.rb_emplacement_type_rdv=create rb_emplacement_type_rdv
this.rb_emplacement_fauteuil=create rb_emplacement_fauteuil
this.rb_emplacement_nom_prenom=create rb_emplacement_nom_prenom
this.rb_objet_type_rdv=create rb_objet_type_rdv
this.rb_objet_fauteuil=create rb_objet_fauteuil
this.sle_objet_libelle=create sle_objet_libelle
this.rb_objet_libelle=create rb_objet_libelle
this.rb_objet_nom_prenom=create rb_objet_nom_prenom
this.pb_annuler=create pb_annuler
this.pb_enregistrer=create pb_enregistrer
this.em_semaines=create em_semaines
this.dw_prati=create dw_prati
this.pb_1=create pb_1
this.gb_objet=create gb_objet
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.gb_5=create gb_5
this.gb_6=create gb_6
this.gb_7=create gb_7
this.gb_4=create gb_4
this.gb_9=create gb_9
this.gb_8=create gb_8
this.st_2=create st_2
this.gb_10=create gb_10
this.gb_11=create gb_11
this.gb_12=create gb_12
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.rb_rdv_groupe
this.Control[iCurrent+3]=this.rb_rdv_detail
this.Control[iCurrent+4]=this.sle_periode_interdite_commentaire
this.Control[iCurrent+5]=this.cbx_groupe_corps_duree
this.Control[iCurrent+6]=this.cbx_groupe_corps_heure
this.Control[iCurrent+7]=this.cbx_groupe_corps_type_rdv
this.Control[iCurrent+8]=this.cbx_groupe_corps_fauteuil
this.Control[iCurrent+9]=this.cbx_groupe_corps_nom_prenom
this.Control[iCurrent+10]=this.sle_groupe_emplacement_libelle
this.Control[iCurrent+11]=this.sle_groupe_objet_libelle
this.Control[iCurrent+12]=this.st_1
this.Control[iCurrent+13]=this.cbx_corps_type_rdv
this.Control[iCurrent+14]=this.cbx_corps_fauteuil
this.Control[iCurrent+15]=this.cbx_corps_nom_prenom
this.Control[iCurrent+16]=this.sle_emplacement_libelle
this.Control[iCurrent+17]=this.rb_emplacement_libelle
this.Control[iCurrent+18]=this.rb_emplacement_type_rdv
this.Control[iCurrent+19]=this.rb_emplacement_fauteuil
this.Control[iCurrent+20]=this.rb_emplacement_nom_prenom
this.Control[iCurrent+21]=this.rb_objet_type_rdv
this.Control[iCurrent+22]=this.rb_objet_fauteuil
this.Control[iCurrent+23]=this.sle_objet_libelle
this.Control[iCurrent+24]=this.rb_objet_libelle
this.Control[iCurrent+25]=this.rb_objet_nom_prenom
this.Control[iCurrent+26]=this.pb_annuler
this.Control[iCurrent+27]=this.pb_enregistrer
this.Control[iCurrent+28]=this.em_semaines
this.Control[iCurrent+29]=this.dw_prati
this.Control[iCurrent+30]=this.pb_1
this.Control[iCurrent+31]=this.gb_objet
this.Control[iCurrent+32]=this.gb_1
this.Control[iCurrent+33]=this.gb_2
this.Control[iCurrent+34]=this.gb_3
this.Control[iCurrent+35]=this.gb_5
this.Control[iCurrent+36]=this.gb_6
this.Control[iCurrent+37]=this.gb_7
this.Control[iCurrent+38]=this.gb_4
this.Control[iCurrent+39]=this.gb_9
this.Control[iCurrent+40]=this.gb_8
this.Control[iCurrent+41]=this.st_2
this.Control[iCurrent+42]=this.gb_10
this.Control[iCurrent+43]=this.gb_11
this.Control[iCurrent+44]=this.gb_12
end on

on w_parametrage_synchronisation.destroy
call super::destroy
destroy(this.st_3)
destroy(this.rb_rdv_groupe)
destroy(this.rb_rdv_detail)
destroy(this.sle_periode_interdite_commentaire)
destroy(this.cbx_groupe_corps_duree)
destroy(this.cbx_groupe_corps_heure)
destroy(this.cbx_groupe_corps_type_rdv)
destroy(this.cbx_groupe_corps_fauteuil)
destroy(this.cbx_groupe_corps_nom_prenom)
destroy(this.sle_groupe_emplacement_libelle)
destroy(this.sle_groupe_objet_libelle)
destroy(this.st_1)
destroy(this.cbx_corps_type_rdv)
destroy(this.cbx_corps_fauteuil)
destroy(this.cbx_corps_nom_prenom)
destroy(this.sle_emplacement_libelle)
destroy(this.rb_emplacement_libelle)
destroy(this.rb_emplacement_type_rdv)
destroy(this.rb_emplacement_fauteuil)
destroy(this.rb_emplacement_nom_prenom)
destroy(this.rb_objet_type_rdv)
destroy(this.rb_objet_fauteuil)
destroy(this.sle_objet_libelle)
destroy(this.rb_objet_libelle)
destroy(this.rb_objet_nom_prenom)
destroy(this.pb_annuler)
destroy(this.pb_enregistrer)
destroy(this.em_semaines)
destroy(this.dw_prati)
destroy(this.pb_1)
destroy(this.gb_objet)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.gb_5)
destroy(this.gb_6)
destroy(this.gb_7)
destroy(this.gb_4)
destroy(this.gb_9)
destroy(this.gb_8)
destroy(this.st_2)
destroy(this.gb_10)
destroy(this.gb_11)
destroy(this.gb_12)
end on

event open;call super::open;
dw_prati.settransobject(sqlca)
dw_prati.retrieve()


//Placer_image_fond(this, p_image, "fond_outlook.jpg")

colore_tous_objets_window(this, couleur_fond_fenetre)

centrer(this)


// initialisation
pb_annuler.triggerevent(clicked!)



end event

type p_fond from w_fenetre_arakis`p_fond within w_parametrage_synchronisation
end type

type st_3 from st_transparent within w_parametrage_synchronisation
integer x = 3461
integer y = 272
integer width = 398
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
string text = "(en semaines) "
end type

type rb_rdv_groupe from radiobutton within w_parametrage_synchronisation
integer x = 1298
integer y = 284
integer width = 658
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217730
string text = "Rendez-vous groupés"
end type

type rb_rdv_detail from radiobutton within w_parametrage_synchronisation
integer x = 233
integer y = 284
integer width = 658
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217730
string text = "Rendez-vous détaillés"
end type

type sle_periode_interdite_commentaire from singlelineedit within w_parametrage_synchronisation
integer x = 2491
integer y = 2032
integer width = 1522
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type cbx_groupe_corps_duree from checkbox within w_parametrage_synchronisation
integer x = 2514
integer y = 1616
integer width = 914
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Durée du Rendez-vous"
end type

type cbx_groupe_corps_heure from checkbox within w_parametrage_synchronisation
integer x = 2514
integer y = 1216
integer width = 914
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Heure du rendez-vous"
end type

type cbx_groupe_corps_type_rdv from checkbox within w_parametrage_synchronisation
integer x = 2514
integer y = 1516
integer width = 914
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Type de Rendez-vous"
end type

type cbx_groupe_corps_fauteuil from checkbox within w_parametrage_synchronisation
integer x = 2514
integer y = 1416
integer width = 914
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Faut. N°x"
end type

type cbx_groupe_corps_nom_prenom from checkbox within w_parametrage_synchronisation
integer x = 2514
integer y = 1316
integer width = 841
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom + Prénom du Patient"
end type

type sle_groupe_emplacement_libelle from singlelineedit within w_parametrage_synchronisation
integer x = 2491
integer y = 920
integer width = 1522
integer height = 100
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type sle_groupe_objet_libelle from singlelineedit within w_parametrage_synchronisation
integer x = 2491
integer y = 624
integer width = 1522
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type st_1 from st_transparent within w_parametrage_synchronisation
integer x = 2382
integer y = 272
integer width = 681
integer height = 72
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Période de scrutation :"
end type

type cbx_corps_type_rdv from checkbox within w_parametrage_synchronisation
integer x = 233
integer y = 2032
integer width = 914
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Type de Rendez-vous"
end type

type cbx_corps_fauteuil from checkbox within w_parametrage_synchronisation
integer x = 233
integer y = 1936
integer width = 914
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Faut. N°x"
end type

type cbx_corps_nom_prenom from checkbox within w_parametrage_synchronisation
integer x = 233
integer y = 1840
integer width = 914
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom + Prénom du Patient"
end type

type sle_emplacement_libelle from singlelineedit within w_parametrage_synchronisation
integer x = 622
integer y = 1544
integer width = 1522
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type rb_emplacement_libelle from radiobutton within w_parametrage_synchronisation
integer x = 233
integer y = 1564
integer width = 361
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Libellé : "
end type

type rb_emplacement_type_rdv from radiobutton within w_parametrage_synchronisation
integer x = 233
integer y = 1456
integer width = 832
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Type du Rendez-vous"
end type

type rb_emplacement_fauteuil from radiobutton within w_parametrage_synchronisation
integer x = 233
integer y = 1348
integer width = 832
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Faut. N°x"
end type

type rb_emplacement_nom_prenom from radiobutton within w_parametrage_synchronisation
integer x = 233
integer y = 1244
integer width = 832
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom + Prénom du Patient"
end type

type rb_objet_type_rdv from radiobutton within w_parametrage_synchronisation
integer x = 233
integer y = 828
integer width = 832
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Type du Rendez-vous"
end type

type rb_objet_fauteuil from radiobutton within w_parametrage_synchronisation
integer x = 233
integer y = 732
integer width = 832
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Faut. N°x"
end type

type sle_objet_libelle from singlelineedit within w_parametrage_synchronisation
integer x = 603
integer y = 920
integer width = 1522
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
end type

type rb_objet_libelle from radiobutton within w_parametrage_synchronisation
integer x = 233
integer y = 932
integer width = 361
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Libellé : "
end type

type rb_objet_nom_prenom from radiobutton within w_parametrage_synchronisation
integer x = 233
integer y = 636
integer width = 869
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Nom + Prénom du Patient"
boolean checked = true
end type

type pb_annuler from uo_picturebutton_390x120 within w_parametrage_synchronisation
integer x = 1467
integer y = 2276
integer width = 411
integer height = 152
integer taborder = 20
string text = "&Annuler"
end type

event clicked;call super::clicked;

long lig
lig = dw_prati.find("code = '"+profilestring(dir_ini+inifile_orthokis,"PDA","praticien", dw_prati.gettext())+"'",0,9999)
dw_prati.scrollToRow(lig)


em_semaines.text = profilestring(dir_ini+inifile_orthokis,"PDA","semaines_scrutation", "8")

if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_detaille", "G") = "G" then
	rb_rdv_groupe.checked = true
else
	rb_rdv_detail.checked = true
end if

rb_objet_nom_prenom.checked = false
rb_objet_fauteuil.checked 	= false
rb_objet_type_rdv.checked	= false
rb_objet_libelle.checked = false

choose case profilestring(dir_ini+inifile_orthokis,"PDA","rdv_objet", "N")
	case "N"
		rb_objet_nom_prenom.checked = true
	case "F"
		rb_objet_fauteuil.checked 	= true
	Case "T"
		rb_objet_type_rdv.checked	= true
	Case "L"
		rb_objet_libelle.checked = true
end choose

sle_objet_libelle.text = profilestring(dir_ini+inifile_orthokis,"PDA","rdv_objet_libelle", "Cabinet")




rb_emplacement_nom_prenom.checked = false
rb_emplacement_fauteuil.checked 	= false
rb_emplacement_type_rdv.checked	= false
rb_emplacement_libelle.checked = false

choose case profilestring(dir_ini+inifile_orthokis,"PDA","rdv_emplacement","N")
	case "N"
		rb_emplacement_nom_prenom.checked = true
	case "F"
		rb_emplacement_fauteuil.checked 	= true
	Case "T"
		rb_emplacement_type_rdv.checked	= true
	Case "L"
		rb_emplacement_libelle.checked = true
end choose

sle_emplacement_libelle.text = profilestring(dir_ini+inifile_orthokis,"PDA","rdv_emplacement_libelle", "")


if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_nom_prenom", "O") = "O" then
	cbx_corps_nom_prenom.checked = true 
else
	cbx_corps_nom_prenom.checked = false 
end if

if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_fauteuil", "O") = "O" then
	cbx_corps_fauteuil.checked = true 
else
	cbx_corps_fauteuil.checked = false 
end if

if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_type_rdv", "O") = "O" then
	cbx_corps_type_rdv.checked = true 
else
	cbx_corps_type_rdv.checked = false 
end if




// Pour les rendez-vous groupes 
//-------------------------------------

sle_groupe_objet_libelle.text = profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_objet_libelle","RDV Patients")
sle_groupe_emplacement_libelle.text = profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_emplacement_libelle","Cabinet")

if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_heure", "O") = "O" then
	cbx_groupe_corps_heure.checked = true
else
	cbx_groupe_corps_heure.checked = true
end if


if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_nom_prenom", "O") = "O" then
	cbx_groupe_corps_nom_prenom.checked = true
else
	cbx_groupe_corps_nom_prenom.checked = true
end if



if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_fauteuil", "O") = "O" then
	cbx_groupe_corps_fauteuil.checked = true
else
	cbx_groupe_corps_fauteuil.checked = true
end if



if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_type_rdv", "O") = "O" then
	cbx_groupe_corps_type_rdv.checked = true
else
	cbx_groupe_corps_type_rdv.checked = true
end if


if profilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_duree", "O") = "O" then
	cbx_groupe_corps_duree.checked = true
else
	cbx_groupe_corps_duree.checked = true
end if




// Pour les périodes interdites
//-------------------------------------

sle_periode_interdite_commentaire.text = profilestring(dir_ini+inifile_orthokis,"PDA","periode_interdite_commentaire","RDV Personnel")








end event

type pb_enregistrer from uo_picturebutton_390x120 within w_parametrage_synchronisation
integer x = 1984
integer y = 2276
integer taborder = 30
string text = "&Enregistrer"
boolean originalsize = false
end type

event clicked;call super::clicked;

// enregistrement des éléments 



setprofilestring(dir_ini+inifile_orthokis,"PDA","praticien", dw_prati.gettext())
setprofilestring(dir_ini+inifile_orthokis,"PDA","semaines_scrutation", em_semaines.text)

if rb_rdv_detail.checked then
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_detaille", "D")
else
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_detaille", "G")
end if

string v_rdv_objet

if rb_objet_nom_prenom.checked then
	v_rdv_objet = "N"
else
	if rb_objet_fauteuil.checked then
		v_rdv_objet = "F"
	else
		if rb_objet_type_rdv.checked then
			v_rdv_objet = "T"
		else
			v_rdv_objet = "L"
		end if
	end if
end if

setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_objet", v_rdv_objet)
setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_objet_libelle", sle_objet_libelle.text)


string v_rdv_emplacement

if rb_emplacement_nom_prenom.checked then
	v_rdv_emplacement = "N"
else
	if rb_emplacement_fauteuil.checked then
		v_rdv_emplacement = "F"
	else
		if rb_emplacement_type_rdv.checked then
			v_rdv_emplacement = "T"
		else
			v_rdv_emplacement = "L"
		end if
	end if
end if

setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_emplacement", v_rdv_emplacement)
setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_emplacement_libelle", sle_emplacement_libelle.text)


if cbx_corps_nom_prenom.checked then
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_nom_prenom", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_nom_prenom", "N")
end if

if cbx_corps_fauteuil.checked then
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_fauteuil", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_fauteuil", "N")
end if

if cbx_corps_type_rdv.checked then
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_type_rdv", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_corps_type_rdv", "N")
end if


// Pour les rendez-vous groupes 
//-------------------------------------

setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_objet_libelle", sle_groupe_objet_libelle.text)
setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_emplacement_libelle", sle_groupe_emplacement_libelle.text)

if cbx_groupe_corps_heure.checked then
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_heure", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_heure", "N")
end if

if cbx_groupe_corps_nom_prenom.checked then
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_nom_prenom", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_nom_prenom", "N")
end if


if cbx_groupe_corps_fauteuil.checked then
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_fauteuil", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_fauteuil", "N")
end if

if cbx_groupe_corps_type_rdv.checked then
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_type_rdv", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_type_rdv", "N")
end if


if cbx_groupe_corps_duree.checked then
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_duree", "O")
else
	setprofilestring(dir_ini+inifile_orthokis,"PDA","rdv_groupe_corps_duree", "N")
end if


			
// Pour les périodes interdites
//------------------------------------

Setprofilestring(dir_ini+inifile_orthokis,"PDA","periode_interdite_commentaire",sle_periode_interdite_commentaire.text)


		
end event

type em_semaines from editmask within w_parametrage_synchronisation
integer x = 3077
integer y = 264
integer width = 238
integer height = 88
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "##0"
boolean spin = true
end type

type dw_prati from datawindow within w_parametrage_synchronisation
string tag = "position"
integer x = 814
integer y = 68
integer width = 873
integer height = 80
integer taborder = 10
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_parametrage_synchronisation
integer x = 2501
integer y = 2276
integer taborder = 10
boolean originalsize = false
end type

type gb_objet from groupbox within w_parametrage_synchronisation
integer x = 155
integer y = 548
integer width = 2057
integer height = 540
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Objet du rendez-vous"
end type

type gb_1 from groupbox within w_parametrage_synchronisation
integer x = 155
integer y = 1140
integer width = 2057
integer height = 540
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Emplacement du rendez-vous"
end type

type gb_2 from groupbox within w_parametrage_synchronisation
integer x = 155
integer y = 1728
integer width = 2057
integer height = 464
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Corps du rendez-vous"
end type

type gb_3 from groupbox within w_parametrage_synchronisation
integer x = 59
integer y = 432
integer width = 2240
integer height = 1820
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 134217730
string text = "Rendez-vous détaillés"
end type

type gb_5 from groupbox within w_parametrage_synchronisation
integer x = 2382
integer y = 532
integer width = 1737
integer height = 264
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Objet du rendez-vous"
end type

type gb_6 from groupbox within w_parametrage_synchronisation
integer x = 2382
integer y = 820
integer width = 1737
integer height = 264
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Emplacement du rendez-vous"
end type

type gb_7 from groupbox within w_parametrage_synchronisation
integer x = 2386
integer y = 1116
integer width = 1737
integer height = 632
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Corps du rendez-vous"
end type

type gb_4 from groupbox within w_parametrage_synchronisation
integer x = 2318
integer y = 432
integer width = 1861
integer height = 1360
integer taborder = 40
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217730
string text = "Rendez-vous groupés"
end type

type gb_9 from groupbox within w_parametrage_synchronisation
integer x = 2391
integer y = 1928
integer width = 1737
integer height = 264
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Commentaire"
end type

type gb_8 from groupbox within w_parametrage_synchronisation
integer x = 2318
integer y = 1816
integer width = 1861
integer height = 428
integer taborder = 50
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217730
string text = "Périodes Interdites Générées"
end type

type st_2 from st_transparent within w_parametrage_synchronisation
integer x = 183
integer y = 68
integer width = 567
integer height = 72
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
string text = "Pour le praticien :"
end type

type gb_10 from groupbox within w_parametrage_synchronisation
integer x = 59
integer y = 196
integer width = 2240
integer height = 212
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 134217730
string text = "Mode de génération des rendez-vous "
end type

type gb_11 from groupbox within w_parametrage_synchronisation
integer x = 59
integer y = 4
integer width = 2240
integer height = 156
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_12 from groupbox within w_parametrage_synchronisation
integer x = 2318
integer y = 204
integer width = 1861
integer height = 156
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
end type

