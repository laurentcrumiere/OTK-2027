$PBExportHeader$w_liste_patients_type_rdv.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_type_rdv from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_type_rdv
end type
type st_2 from statictext within w_liste_patients_type_rdv
end type
type st_3 from statictext within w_liste_patients_type_rdv
end type
type dw_type_rdv from datawindow within w_liste_patients_type_rdv
end type
type st_4 from statictext within w_liste_patients_type_rdv
end type
type st_22 from statictext within w_liste_patients_type_rdv
end type
type cbx_next from checkbox within w_liste_patients_type_rdv
end type
type cbx_next_2 from checkbox within w_liste_patients_type_rdv
end type
type st_5 from statictext within w_liste_patients_type_rdv
end type
type em_date_min from uo_date_calendrier within w_liste_patients_type_rdv
end type
type em_date_max from uo_date_calendrier within w_liste_patients_type_rdv
end type
type dw_utilisateur from datawindow within w_liste_patients_type_rdv
end type
type rb_un_utilisateur from radiobutton within w_liste_patients_type_rdv
end type
type rb_tous_utilisateurs from radiobutton within w_liste_patients_type_rdv
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_type_rdv
end type
type gb_filtres from groupbox within w_liste_patients_type_rdv
end type
type gb_2 from groupbox within w_liste_patients_type_rdv
end type
end forward

global type w_liste_patients_type_rdv from w_liste_patients
string title = "Liste des Rendez-vous d~'un Type de Rendez-vous"
st_1 st_1
st_2 st_2
st_3 st_3
dw_type_rdv dw_type_rdv
st_4 st_4
st_22 st_22
cbx_next cbx_next
cbx_next_2 cbx_next_2
st_5 st_5
em_date_min em_date_min
em_date_max em_date_max
dw_utilisateur dw_utilisateur
rb_un_utilisateur rb_un_utilisateur
rb_tous_utilisateurs rb_tous_utilisateurs
uo_filtre_email uo_filtre_email
gb_filtres gb_filtres
gb_2 gb_2
end type
global w_liste_patients_type_rdv w_liste_patients_type_rdv

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,typ,tit,p
double code_min,code_max
date date_min,date_max
string user_min, user_max
string filtre


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



	if rb_tous_utilisateurs.checked then
		user_min=""
		user_max="ZZZZZZ"
		tit = tit + " - Pour tous les Utilisateurs"
	else
		user_min=dw_utilisateur.gettext()
		user_max=dw_utilisateur.gettext()
		SELECT nom INTO :p FROM utilisateurs WHERE code = :user_min ;
		tit = tit + " - Pour "+p
	end if
	
	
	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	filtre = ""

	// Application des filtres
	if cbx_next.checked then
		if cbx_next_2.checked then
			filtre = "next = 0 and next_2 = 0"
		else
			filtre = "next = 0"
		end if
	else
		if cbx_next_2.checked then
			filtre = "next_2 = 0"
		else
			filtre = ""
		end if
	end if
	
	dw_liste.setfilter(filtre)
	uo_filtre_email.filtre_initial = filtre
	dw_liste.filter()
	

	
	
	
	tit = tit + " Entre le "+em_date_min.text+" et le "+em_date_max.text

	typ=dw_type_rdv.getitemstring(dw_type_rdv.getrow(),"code")

	open(w_patience)
	dw_liste.Modify("titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,typ, user_min, user_max )
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
//	em_nb.visible = true


end if

end subroutine

event open;call super::open;em_date_min.setDate(today())
em_date_max.setDate(date(year(today()),12,31))

dw_type_rdv.settransobject(SQLCA)
dw_type_rdv.retrieve() 

// on prend les négatifs éventuels
em_min.text = string(min)

dw_utilisateur.settransobject(SQLCA)
dw_utilisateur.retrieve() 


uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

end event

on w_liste_patients_type_rdv.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.dw_type_rdv=create dw_type_rdv
this.st_4=create st_4
this.st_22=create st_22
this.cbx_next=create cbx_next
this.cbx_next_2=create cbx_next_2
this.st_5=create st_5
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.dw_utilisateur=create dw_utilisateur
this.rb_un_utilisateur=create rb_un_utilisateur
this.rb_tous_utilisateurs=create rb_tous_utilisateurs
this.uo_filtre_email=create uo_filtre_email
this.gb_filtres=create gb_filtres
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.dw_type_rdv
this.Control[iCurrent+5]=this.st_4
this.Control[iCurrent+6]=this.st_22
this.Control[iCurrent+7]=this.cbx_next
this.Control[iCurrent+8]=this.cbx_next_2
this.Control[iCurrent+9]=this.st_5
this.Control[iCurrent+10]=this.em_date_min
this.Control[iCurrent+11]=this.em_date_max
this.Control[iCurrent+12]=this.dw_utilisateur
this.Control[iCurrent+13]=this.rb_un_utilisateur
this.Control[iCurrent+14]=this.rb_tous_utilisateurs
this.Control[iCurrent+15]=this.uo_filtre_email
this.Control[iCurrent+16]=this.gb_filtres
this.Control[iCurrent+17]=this.gb_2
end on

on w_liste_patients_type_rdv.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.dw_type_rdv)
destroy(this.st_4)
destroy(this.st_22)
destroy(this.cbx_next)
destroy(this.cbx_next_2)
destroy(this.st_5)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.dw_utilisateur)
destroy(this.rb_un_utilisateur)
destroy(this.rb_tous_utilisateurs)
destroy(this.uo_filtre_email)
destroy(this.gb_filtres)
destroy(this.gb_2)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_type_rdv
integer y = 568
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_type_rdv
integer x = 2290
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_type_rdv
integer x = 1829
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_type_rdv
integer x = 2752
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_type_rdv
integer x = 581
integer taborder = 130
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_type_rdv
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_type_rdv
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_type_rdv
integer y = 228
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_type_rdv
integer y = 132
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_type_rdv
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_patients_type_rdv
integer y = 444
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_type_rdv
integer y = 444
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_type_rdv
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_type_rdv
integer y = 52
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_type_rdv
integer y = 208
integer taborder = 90
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_type_rdv
end type

type st_min from w_liste_patients`st_min within w_liste_patients_type_rdv
integer y = 456
end type

type st_max from w_liste_patients`st_max within w_liste_patients_type_rdv
integer y = 456
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_type_rdv
integer x = 9
integer y = 20
integer taborder = 80
string dataobject = "dw_liste_patients_type_rdv_edition"
end type

type st_1 from statictext within w_liste_patients_type_rdv
string tag = "a masquer"
integer x = 347
integer y = 608
integer width = 901
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 15780518
string text = "Date de rendez-vous :"
end type

type st_2 from statictext within w_liste_patients_type_rdv
string tag = "a masquer"
integer x = 1422
integer y = 716
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_liste_patients_type_rdv
string tag = "a masquer"
integer x = 475
integer y = 716
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Entre le "
end type

type dw_type_rdv from datawindow within w_liste_patients_type_rdv
string tag = "position brush"
integer x = 1042
integer y = 864
integer width = 987
integer height = 72
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_type_rdv"
boolean border = false
boolean livescroll = true
end type

type st_4 from statictext within w_liste_patients_type_rdv
string tag = "a masquer"
integer x = 347
integer y = 880
integer width = 658
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean underline = true
long backcolor = 15780518
string text = "Type de rendez-vous :"
alignment alignment = center!
end type

type st_22 from statictext within w_liste_patients_type_rdv
string tag = "a masquer"
integer x = 338
integer y = 1180
integer width = 2437
integer height = 68
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Exemple : Elimine les patients de la liste qui ont un rendez-vous programmé à partir d~'aujourd~'hui"
end type

type cbx_next from checkbox within w_liste_patients_type_rdv
string tag = "a masquer"
integer x = 338
integer y = 1104
integer width = 2139
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Eliminer les patients ayant un prochain rendez-vous (dans le futur)"
boolean lefttext = true
end type

type cbx_next_2 from checkbox within w_liste_patients_type_rdv
string tag = "a masquer"
integer x = 338
integer y = 1284
integer width = 2139
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Eliminer les patients ayant eu un rendez-vous après (dans le passé)"
boolean lefttext = true
end type

type st_5 from statictext within w_liste_patients_type_rdv
string tag = "a masquer"
integer x = 338
integer y = 1360
integer width = 2386
integer height = 76
boolean bringtotop = true
integer textsize = -9
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Exemple : Elimine les patients qui ont eu par la suite un rendez-vous mais avant aujourd~'hui"
end type

type em_date_min from uo_date_calendrier within w_liste_patients_type_rdv
integer x = 905
integer y = 708
integer taborder = 220
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_type_rdv
integer x = 1719
integer y = 708
integer taborder = 230
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type dw_utilisateur from datawindow within w_liste_patients_type_rdv
string tag = "no resizeall"
boolean visible = false
integer x = 1129
integer y = 1696
integer width = 1198
integer height = 80
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_utilisateur_suivi_clinique"
boolean border = false
boolean livescroll = true
end type

type rb_un_utilisateur from radiobutton within w_liste_patients_type_rdv
integer x = 343
integer y = 1696
integer width = 485
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un utilisateur"
end type

event clicked;
dw_utilisateur.visible = true 


end event

type rb_tous_utilisateurs from radiobutton within w_liste_patients_type_rdv
integer x = 343
integer y = 1592
integer width = 709
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Toutes les utilisateurs"
boolean checked = true
end type

event clicked;dw_utilisateur.visible = false 


end event

type uo_filtre_email from uo_filtre_emails within w_liste_patients_type_rdv
string tag = "no resize all"
integer x = 1042
integer y = 1852
integer taborder = 130
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type gb_filtres from groupbox within w_liste_patients_type_rdv
integer x = 256
integer y = 1004
integer width = 2752
integer height = 476
integer taborder = 70
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Filtres si analyse des rendez-vous passés"
end type

type gb_2 from groupbox within w_liste_patients_type_rdv
integer x = 261
integer y = 1516
integer width = 2121
integer height = 304
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Suivi Clinique"
end type

