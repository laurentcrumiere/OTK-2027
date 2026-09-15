$PBExportHeader$w_liste_commentaires_images_selon_texte.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_commentaires_images_selon_texte from w_liste_patients
end type
type st_1 from statictext within w_liste_commentaires_images_selon_texte
end type
type st_2 from statictext within w_liste_commentaires_images_selon_texte
end type
type st_3 from statictext within w_liste_commentaires_images_selon_texte
end type
type em_date_min from uo_date_calendrier within w_liste_commentaires_images_selon_texte
end type
type em_date_max from uo_date_calendrier within w_liste_commentaires_images_selon_texte
end type
type sle_commentaire from singlelineedit within w_liste_commentaires_images_selon_texte
end type
type st_7 from statictext within w_liste_commentaires_images_selon_texte
end type
type st_4 from statictext within w_liste_commentaires_images_selon_texte
end type
type uo_filtre_email from uo_filtre_emails within w_liste_commentaires_images_selon_texte
end type
end forward

global type w_liste_commentaires_images_selon_texte from w_liste_patients
string title = "Liste des Commentaires d~'images selon texte"
st_1 st_1
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
sle_commentaire sle_commentaire
st_7 st_7
st_4 st_4
uo_filtre_email uo_filtre_email
end type
global w_liste_commentaires_images_selon_texte w_liste_commentaires_images_selon_texte

type variables
boolean prems_affichage = true
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,typ,tit,p
double code_min,code_max
date date_min,date_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)


	string texte_recherche
	
	texte_recherche = sle_commentaire.text 
	
	tit = tit + " Entre le "+em_date_min.text+" et le "+em_date_max.text +" - Texte : "+ texte_recherche

	open(w_patience)
	dw_liste.Modify("titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max, texte_recherche)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Commentaires"
	//em_nb.visible = true


end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

// On prend tous les patients
SELECT  max(numero_dossier) INTO :max FROM patient  ;

em_max.text = string(max)
uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb
end event

on w_liste_commentaires_images_selon_texte.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.sle_commentaire=create sle_commentaire
this.st_7=create st_7
this.st_4=create st_4
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_date_min
this.Control[iCurrent+5]=this.em_date_max
this.Control[iCurrent+6]=this.sle_commentaire
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.uo_filtre_email
end on

on w_liste_commentaires_images_selon_texte.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.sle_commentaire)
destroy(this.st_7)
destroy(this.st_4)
destroy(this.uo_filtre_email)
end on

event show;call super::show;
if prems_affichage then 
	prems_affichage  = false
	postevent(resize!)
end if
end event

event resize;call super::resize;
if not prems_affichage then 
	
	// on resize au show la première fois
	
	uo_size.retaille(this)
	
	// repositionnement 
	//cbx_filtre.x = gb_filtre.x + 19
	//cbx_filtre.y = gb_filtre.y + 55
	//
	
	// pour qu'il se resize mais ... pas trop 
	cbx_filtre.y = cb_ecran.y
	cbx_filtre.height = min(cbx_filtre.height, cb_ecran.height)	
end if
end event

type p_fond from w_liste_patients`p_fond within w_liste_commentaires_images_selon_texte
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_commentaires_images_selon_texte
integer x = 2249
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_commentaires_images_selon_texte
integer x = 1774
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_commentaires_images_selon_texte
integer x = 2725
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_commentaires_images_selon_texte
integer x = 553
integer taborder = 130
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_commentaires_images_selon_texte
end type

type uo_size from w_liste_patients`uo_size within w_liste_commentaires_images_selon_texte
end type

type rb_un from w_liste_patients`rb_un within w_liste_commentaires_images_selon_texte
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_commentaires_images_selon_texte
end type

type em_nb from w_liste_patients`em_nb within w_liste_commentaires_images_selon_texte
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_commentaires_images_selon_texte
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_commentaires_images_selon_texte
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_commentaires_images_selon_texte
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_commentaires_images_selon_texte
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_commentaires_images_selon_texte
integer taborder = 90
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_commentaires_images_selon_texte
end type

type st_min from w_liste_patients`st_min within w_liste_commentaires_images_selon_texte
end type

type st_max from w_liste_patients`st_max within w_liste_commentaires_images_selon_texte
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_commentaires_images_selon_texte
integer y = 0
integer taborder = 80
string dataobject = "dw_liste_commentaire_images_selon_texte_edition"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
end type

type st_1 from statictext within w_liste_commentaires_images_selon_texte
integer x = 347
integer y = 800
integer width = 1138
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période d~'analyse des images : "
end type

type st_2 from statictext within w_liste_commentaires_images_selon_texte
integer x = 1317
integer y = 908
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_liste_commentaires_images_selon_texte
integer x = 475
integer y = 908
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type em_date_min from uo_date_calendrier within w_liste_commentaires_images_selon_texte
integer x = 905
integer y = 892
integer taborder = 220
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_commentaires_images_selon_texte
integer x = 1719
integer y = 892
integer taborder = 230
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type sle_commentaire from singlelineedit within w_liste_commentaires_images_selon_texte
integer x = 347
integer y = 1192
integer width = 2610
integer height = 92
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "%"
integer limit = 1000
borderstyle borderstyle = stylelowered!
end type

type st_7 from statictext within w_liste_commentaires_images_selon_texte
integer x = 347
integer y = 1312
integer width = 2053
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type st_4 from statictext within w_liste_commentaires_images_selon_texte
integer x = 347
integer y = 1112
integer width = 622
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Texte recherché :"
end type

type uo_filtre_email from uo_filtre_emails within w_liste_commentaires_images_selon_texte
string tag = "no resize all"
integer x = 1029
integer y = 1852
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

