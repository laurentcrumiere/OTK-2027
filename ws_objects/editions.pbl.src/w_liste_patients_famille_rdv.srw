$PBExportHeader$w_liste_patients_famille_rdv.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_famille_rdv from w_liste_patients
end type
type st_1 from u_cst_statictext within w_liste_patients_famille_rdv
end type
type st_2 from u_cst_statictext within w_liste_patients_famille_rdv
end type
type st_3 from u_cst_statictext within w_liste_patients_famille_rdv
end type
type st_4 from u_cst_statictext within w_liste_patients_famille_rdv
end type
type em_date_min from uo_date_calendrier within w_liste_patients_famille_rdv
end type
type em_date_max from uo_date_calendrier within w_liste_patients_famille_rdv
end type
type rb_un_utilisateur from radiobutton within w_liste_patients_famille_rdv
end type
type rb_tous_utilisateurs from radiobutton within w_liste_patients_famille_rdv
end type
type gb_2 from groupbox within w_liste_patients_famille_rdv
end type
type dw_utilisateur from datawindow within w_liste_patients_famille_rdv
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_famille_rdv
end type
type dw_famille_rdv from datawindow within w_liste_patients_famille_rdv
end type
end forward

global type w_liste_patients_famille_rdv from w_liste_patients
string title = "Liste des Rendez-vous d~'une Famille de Rendez-vous"
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
em_date_min em_date_min
em_date_max em_date_max
rb_un_utilisateur rb_un_utilisateur
rb_tous_utilisateurs rb_tous_utilisateurs
gb_2 gb_2
dw_utilisateur dw_utilisateur
uo_filtre_email uo_filtre_email
dw_famille_rdv dw_famille_rdv
end type
global w_liste_patients_famille_rdv w_liste_patients_famille_rdv

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit,p
double code_min,code_max
date date_min,date_max
double fam
string user_min, user_max


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

	tit = tit + " Entre le "+em_date_min.text+" et le "+em_date_max.text

	fam=dw_famille_rdv.getitemnumber(dw_famille_rdv.getrow(),"code")

	open(w_patience)
	dw_liste.Modify("titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,fam,user_min, user_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Rendez-vous"
	//em_nb.visible = true


end if

end subroutine

event open;call super::open;em_date_min.setDate(today())
em_date_max.setDate(date(year(today()),12,31))

dw_famille_rdv.settransobject(SQLCA)
dw_famille_rdv.retrieve() 

dw_utilisateur.settransobject(SQLCA)
dw_utilisateur.retrieve() 

// on prend les négatifs éventuels
em_min.text = string(min)

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

if dw_famille_rdv.rowcount()  = 0 then
	Messagebox("ATTENTION","Vous devez d'abord définir des familles de rendez-vous pour accéder à cette fonction.")
	close(this)
end if



end event

on w_liste_patients_famille_rdv.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.rb_un_utilisateur=create rb_un_utilisateur
this.rb_tous_utilisateurs=create rb_tous_utilisateurs
this.gb_2=create gb_2
this.dw_utilisateur=create dw_utilisateur
this.uo_filtre_email=create uo_filtre_email
this.dw_famille_rdv=create dw_famille_rdv
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.em_date_min
this.Control[iCurrent+6]=this.em_date_max
this.Control[iCurrent+7]=this.rb_un_utilisateur
this.Control[iCurrent+8]=this.rb_tous_utilisateurs
this.Control[iCurrent+9]=this.gb_2
this.Control[iCurrent+10]=this.dw_utilisateur
this.Control[iCurrent+11]=this.uo_filtre_email
this.Control[iCurrent+12]=this.dw_famille_rdv
end on

on w_liste_patients_famille_rdv.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.rb_un_utilisateur)
destroy(this.rb_tous_utilisateurs)
destroy(this.gb_2)
destroy(this.dw_utilisateur)
destroy(this.uo_filtre_email)
destroy(this.dw_famille_rdv)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_famille_rdv
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_famille_rdv
integer x = 2281
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_famille_rdv
integer x = 1806
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_famille_rdv
integer x = 2757
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_famille_rdv
integer x = 585
integer taborder = 130
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_famille_rdv
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_famille_rdv
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_famille_rdv
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_famille_rdv
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_famille_rdv
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_patients_famille_rdv
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_famille_rdv
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_famille_rdv
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_famille_rdv
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_famille_rdv
integer taborder = 90
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_famille_rdv
end type

type st_min from w_liste_patients`st_min within w_liste_patients_famille_rdv
end type

type st_max from w_liste_patients`st_max within w_liste_patients_famille_rdv
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_famille_rdv
integer y = 0
integer taborder = 80
string dataobject = "dw_liste_patients_famille_rdv_edition"
end type

type st_1 from u_cst_statictext within w_liste_patients_famille_rdv
string tag = "a masquer"
integer x = 347
integer y = 800
integer width = 901
boolean bringtotop = true
integer weight = 700
boolean underline = true
long backcolor = 15780518
boolean enabled = false
string text = "Date de rendez-vous :"
boolean #transparent = true
end type

type st_2 from u_cst_statictext within w_liste_patients_famille_rdv
string tag = "a masquer"
integer x = 1317
integer y = 908
integer width = 247
integer height = 72
boolean bringtotop = true
integer weight = 700
long backcolor = 15780518
boolean enabled = false
string text = "Et le"
alignment alignment = center!
end type

type st_3 from u_cst_statictext within w_liste_patients_famille_rdv
string tag = "a masquer"
integer x = 475
integer y = 908
integer width = 256
integer height = 72
boolean bringtotop = true
integer weight = 700
long backcolor = 15780518
boolean enabled = false
string text = "Entre le "
boolean #transparent = true
end type

type st_4 from u_cst_statictext within w_liste_patients_famille_rdv
string tag = "a masquer"
integer x = 347
integer y = 1072
integer width = 731
integer height = 72
boolean bringtotop = true
integer weight = 700
boolean underline = true
long backcolor = 15780518
boolean enabled = false
string text = "Famille de rendez-vous :"
alignment alignment = center!
boolean #transparent = true
end type

type em_date_min from uo_date_calendrier within w_liste_patients_famille_rdv
integer x = 864
integer y = 888
integer taborder = 120
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_famille_rdv
integer x = 1673
integer y = 888
integer taborder = 130
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_un_utilisateur from radiobutton within w_liste_patients_famille_rdv
integer x = 448
integer y = 1604
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

type rb_tous_utilisateurs from radiobutton within w_liste_patients_famille_rdv
integer x = 448
integer y = 1500
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

type gb_2 from groupbox within w_liste_patients_famille_rdv
integer x = 366
integer y = 1424
integer width = 2121
integer height = 304
integer taborder = 70
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

type dw_utilisateur from datawindow within w_liste_patients_famille_rdv
string tag = "no resizeall"
boolean visible = false
integer x = 1079
integer y = 1604
integer width = 1198
integer height = 76
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_utilisateur_suivi_clinique"
boolean border = false
boolean livescroll = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_famille_rdv
string tag = "no resize all"
integer x = 1061
integer y = 1856
integer taborder = 130
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type dw_famille_rdv from datawindow within w_liste_patients_famille_rdv
string tag = "position brush"
integer x = 1134
integer y = 1072
integer width = 1170
integer height = 76
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_famille_rdv"
boolean border = false
boolean livescroll = true
end type

