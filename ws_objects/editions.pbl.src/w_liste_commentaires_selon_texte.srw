$PBExportHeader$w_liste_commentaires_selon_texte.srw
forward
global type w_liste_commentaires_selon_texte from w_liste_patients
end type
type uo_filtre_email from uo_filtre_emails within w_liste_commentaires_selon_texte
end type
type st_1 from statictext within w_liste_commentaires_selon_texte
end type
type st_2 from statictext within w_liste_commentaires_selon_texte
end type
type st_3 from statictext within w_liste_commentaires_selon_texte
end type
type em_date_min from uo_date_calendrier within w_liste_commentaires_selon_texte
end type
type em_date_max from uo_date_calendrier within w_liste_commentaires_selon_texte
end type
type st_7 from statictext within w_liste_commentaires_selon_texte
end type
type st_4 from statictext within w_liste_commentaires_selon_texte
end type
type st_5 from statictext within w_liste_commentaires_selon_texte
end type
type st_6 from statictext within w_liste_commentaires_selon_texte
end type
type st_com3 from statictext within w_liste_commentaires_selon_texte
end type
type st_com4 from statictext within w_liste_commentaires_selon_texte
end type
type st_com5 from statictext within w_liste_commentaires_selon_texte
end type
type st_com6 from statictext within w_liste_commentaires_selon_texte
end type
type sle_acte from singlelineedit within w_liste_commentaires_selon_texte
end type
type sle_com3 from singlelineedit within w_liste_commentaires_selon_texte
end type
type sle_com4 from singlelineedit within w_liste_commentaires_selon_texte
end type
type sle_com5 from singlelineedit within w_liste_commentaires_selon_texte
end type
type sle_com6 from singlelineedit within w_liste_commentaires_selon_texte
end type
type sle_commentaire from singlelineedit within w_liste_commentaires_selon_texte
end type
end forward

global type w_liste_commentaires_selon_texte from w_liste_patients
string title = "Liste des Commentaires Cliniques selon texte"
uo_filtre_email uo_filtre_email
st_1 st_1
st_2 st_2
st_3 st_3
em_date_min em_date_min
em_date_max em_date_max
st_7 st_7
st_4 st_4
st_5 st_5
st_6 st_6
st_com3 st_com3
st_com4 st_com4
st_com5 st_com5
st_com6 st_com6
sle_acte sle_acte
sle_com3 sle_com3
sle_com4 sle_com4
sle_com5 sle_com5
sle_com6 sle_com6
sle_commentaire sle_commentaire
end type
global w_liste_commentaires_selon_texte w_liste_commentaires_selon_texte

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


	string texte_recherche, texte2, texte3, texte4, texte5, texte6 
	
	texte_recherche = sle_commentaire.text 
	texte2  = sle_acte.text  
	texte3  = sle_com3.text  
	texte4  = sle_com4.text  
	texte5  = sle_com5.text  
	texte6   = sle_com6.text 
	
	tit = tit + " Entre le "+em_date_min.text+" et le "+em_date_max.text +" - Texte : "+ texte_recherche + ' - '+ texte2 + ' - '+ texte3+ ' - '+  texte4+ ' - '+  texte5+ ' - '+  texte6 

	open(w_patience)
	
	// Attention, si on ne voit pas tout !
	// update coment set acte_prevu_html = '' where acte_prevu_html is null ;
	//update coment set com_html = '' where com_html is null ;
	//update coment set com3_html = '' where com3_html is null ;
	//update coment set com4_html = '' where com4_html is null ;
	//update coment set com5_html = '' where com5_html is null ;
	//update coment set com6_html = '' where com6_html is null ;
	//	
	dw_liste.Modify("titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max, texte_recherche ,  texte2, texte3, texte4, texte5, texte6 )
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

// nom des colonnes spécifiques
string v_com3, v_com4, v_com5, v_com6
select top 1 isnull(nom_colonne_com3, 'Com 3'),  isnull(nom_colonne_com4, 'Com 4'), isnull(nom_colonne_com5, 'Com 5'),isnull(nom_colonne_com6, 'Com 6')
into :v_com3, :v_com4, :v_com5, :v_com6
from param ; 

st_com3.text = v_com3 + ' :' 
st_com4.text = v_com4 + ' :' 
st_com5.text = v_com5 + ' :' 
st_com6.text = v_com6 + ' :' 





end event

on w_liste_commentaires_selon_texte.create
int iCurrent
call super::create
this.uo_filtre_email=create uo_filtre_email
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.st_7=create st_7
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.st_com3=create st_com3
this.st_com4=create st_com4
this.st_com5=create st_com5
this.st_com6=create st_com6
this.sle_acte=create sle_acte
this.sle_com3=create sle_com3
this.sle_com4=create sle_com4
this.sle_com5=create sle_com5
this.sle_com6=create sle_com6
this.sle_commentaire=create sle_commentaire
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_filtre_email
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.em_date_min
this.Control[iCurrent+6]=this.em_date_max
this.Control[iCurrent+7]=this.st_7
this.Control[iCurrent+8]=this.st_4
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.st_6
this.Control[iCurrent+11]=this.st_com3
this.Control[iCurrent+12]=this.st_com4
this.Control[iCurrent+13]=this.st_com5
this.Control[iCurrent+14]=this.st_com6
this.Control[iCurrent+15]=this.sle_acte
this.Control[iCurrent+16]=this.sle_com3
this.Control[iCurrent+17]=this.sle_com4
this.Control[iCurrent+18]=this.sle_com5
this.Control[iCurrent+19]=this.sle_com6
this.Control[iCurrent+20]=this.sle_commentaire
end on

on w_liste_commentaires_selon_texte.destroy
call super::destroy
destroy(this.uo_filtre_email)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.st_7)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.st_com3)
destroy(this.st_com4)
destroy(this.st_com5)
destroy(this.st_com6)
destroy(this.sle_acte)
destroy(this.sle_com3)
destroy(this.sle_com4)
destroy(this.sle_com5)
destroy(this.sle_com6)
destroy(this.sle_commentaire)
end on

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

event show;call super::show;
if prems_affichage then 
	prems_affichage  = false
	postevent(resize!)
end if
end event

type p_fond from w_liste_patients`p_fond within w_liste_commentaires_selon_texte
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_commentaires_selon_texte
integer x = 2222
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_commentaires_selon_texte
integer x = 1755
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_commentaires_selon_texte
integer x = 2688
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_commentaires_selon_texte
integer x = 553
integer taborder = 130
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_commentaires_selon_texte
end type

type uo_size from w_liste_patients`uo_size within w_liste_commentaires_selon_texte
end type

type rb_un from w_liste_patients`rb_un within w_liste_commentaires_selon_texte
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_commentaires_selon_texte
end type

type em_nb from w_liste_patients`em_nb within w_liste_commentaires_selon_texte
integer x = 32
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_commentaires_selon_texte
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_commentaires_selon_texte
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_commentaires_selon_texte
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_commentaires_selon_texte
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_commentaires_selon_texte
integer taborder = 90
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_commentaires_selon_texte
end type

type st_min from w_liste_patients`st_min within w_liste_commentaires_selon_texte
end type

type st_max from w_liste_patients`st_max within w_liste_commentaires_selon_texte
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_commentaires_selon_texte
integer y = 0
integer taborder = 80
string dataobject = "dw_liste_commentaire_selon_texte_edition"
richtexttoolbaractivation richtexttoolbaractivation = richtexttoolbaractivationnever!
end type

type uo_filtre_email from uo_filtre_emails within w_liste_commentaires_selon_texte
string tag = "no resize all"
integer x = 1019
integer y = 1852
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type st_1 from statictext within w_liste_commentaires_selon_texte
integer x = 347
integer y = 800
integer width = 1138
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Période d~'analyse : "
end type

type st_2 from statictext within w_liste_commentaires_selon_texte
integer x = 1422
integer y = 908
integer width = 247
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_liste_commentaires_selon_texte
integer x = 475
integer y = 908
integer width = 256
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type em_date_min from uo_date_calendrier within w_liste_commentaires_selon_texte
integer x = 905
integer y = 892
integer taborder = 220
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_commentaires_selon_texte
integer x = 1719
integer y = 892
integer taborder = 230
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type st_7 from statictext within w_liste_commentaires_selon_texte
integer x = 983
integer y = 1068
integer width = 2135
integer height = 64
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type st_4 from statictext within w_liste_commentaires_selon_texte
integer x = 347
integer y = 1060
integer width = 622
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Textes recherchés :"
end type

type st_5 from statictext within w_liste_commentaires_selon_texte
integer x = 375
integer y = 1156
integer width = 507
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Commentaire :"
end type

type st_6 from statictext within w_liste_commentaires_selon_texte
integer x = 375
integer y = 1268
integer width = 507
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Acte prévu :"
end type

type st_com3 from statictext within w_liste_commentaires_selon_texte
integer x = 375
integer y = 1380
integer width = 507
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Com3"
end type

type st_com4 from statictext within w_liste_commentaires_selon_texte
integer x = 375
integer y = 1492
integer width = 507
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Com4"
end type

type st_com5 from statictext within w_liste_commentaires_selon_texte
integer x = 375
integer y = 1604
integer width = 507
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Com5"
end type

type st_com6 from statictext within w_liste_commentaires_selon_texte
integer x = 375
integer y = 1716
integer width = 507
integer height = 72
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Com6"
end type

type sle_acte from singlelineedit within w_liste_commentaires_selon_texte
integer x = 901
integer y = 1260
integer width = 2610
integer height = 92
integer taborder = 90
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

type sle_com3 from singlelineedit within w_liste_commentaires_selon_texte
integer x = 901
integer y = 1372
integer width = 2610
integer height = 92
integer taborder = 100
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

type sle_com4 from singlelineedit within w_liste_commentaires_selon_texte
integer x = 901
integer y = 1484
integer width = 2610
integer height = 92
integer taborder = 110
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

type sle_com5 from singlelineedit within w_liste_commentaires_selon_texte
integer x = 901
integer y = 1596
integer width = 2610
integer height = 92
integer taborder = 120
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

type sle_com6 from singlelineedit within w_liste_commentaires_selon_texte
integer x = 901
integer y = 1708
integer width = 2610
integer height = 92
integer taborder = 130
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

type sle_commentaire from singlelineedit within w_liste_commentaires_selon_texte
integer x = 901
integer y = 1148
integer width = 2610
integer height = 92
integer taborder = 80
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

