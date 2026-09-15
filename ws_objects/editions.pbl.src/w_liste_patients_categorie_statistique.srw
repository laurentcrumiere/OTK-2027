$PBExportHeader$w_liste_patients_categorie_statistique.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_categorie_statistique from w_liste_patients
end type
type st_3 from statictext within w_liste_patients_categorie_statistique
end type
type st_2 from statictext within w_liste_patients_categorie_statistique
end type
type st_periode from statictext within w_liste_patients_categorie_statistique
end type
type st_4 from statictext within w_liste_patients_categorie_statistique
end type
type st_nom from statictext within w_liste_patients_categorie_statistique
end type
type em_date_min from uo_date_calendrier within w_liste_patients_categorie_statistique
end type
type em_date_max from uo_date_calendrier within w_liste_patients_categorie_statistique
end type
type dw_categorie from datawindow within w_liste_patients_categorie_statistique
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_categorie_statistique
end type
type cbx_dates from checkbox within w_liste_patients_categorie_statistique
end type
type gb_date from groupbox within w_liste_patients_categorie_statistique
end type
end forward

global type w_liste_patients_categorie_statistique from w_liste_patients
string title = "Liste des Patients d~'une Catégorie Statistique"
st_3 st_3
st_2 st_2
st_periode st_periode
st_4 st_4
st_nom st_nom
em_date_min em_date_min
em_date_max em_date_max
dw_categorie dw_categorie
uo_filtre_email uo_filtre_email
cbx_dates cbx_dates
gb_date gb_date
end type
global w_liste_patients_categorie_statistique w_liste_patients_categorie_statistique

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max, v_categorie
Date da_min,da_max
double code_min,code_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)
	
	da_min = date(em_date_min.text)
	da_max = date(em_date_max.text)

	open(w_patience)
	
	v_categorie = dw_categorie.gettext()
	string avec_date
	
	if cbx_dates.checked then 
		avec_date = 'N'
	else
		avec_date = 'O'
	end if
	
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,da_min,da_max,v_categorie, avec_date)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if

end subroutine

on w_liste_patients_categorie_statistique.create
int iCurrent
call super::create
this.st_3=create st_3
this.st_2=create st_2
this.st_periode=create st_periode
this.st_4=create st_4
this.st_nom=create st_nom
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.dw_categorie=create dw_categorie
this.uo_filtre_email=create uo_filtre_email
this.cbx_dates=create cbx_dates
this.gb_date=create gb_date
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_3
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_periode
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_nom
this.Control[iCurrent+6]=this.em_date_min
this.Control[iCurrent+7]=this.em_date_max
this.Control[iCurrent+8]=this.dw_categorie
this.Control[iCurrent+9]=this.uo_filtre_email
this.Control[iCurrent+10]=this.cbx_dates
this.Control[iCurrent+11]=this.gb_date
end on

on w_liste_patients_categorie_statistique.destroy
call super::destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_periode)
destroy(this.st_4)
destroy(this.st_nom)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.dw_categorie)
destroy(this.uo_filtre_email)
destroy(this.cbx_dates)
destroy(this.gb_date)
end on

event open;call super::open;em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today()) 


dw_categorie.SetTransobject(sqlca)
dw_categorie.retrieve()

if dw_categorie.rowcount() = 0 then
	dw_categorie.Insertrow(0)
end if


dw_categorie.SetItem(1, "libelle", "%")
uo_filtre_email.dw_liste = dw_liste

uo_filtre_email.em_statut_mere = em_nb

gb_date.backcolor = couleur_fond_fenetre
cbx_dates.backcolor = couleur_fond_fenetre
end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_categorie_statistique
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_categorie_statistique
integer x = 2235
integer taborder = 80
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_categorie_statistique
integer x = 1765
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_categorie_statistique
integer x = 2706
integer taborder = 90
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_categorie_statistique
integer x = 553
integer taborder = 100
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_categorie_statistique
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_categorie_statistique
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_categorie_statistique
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_categorie_statistique
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_categorie_statistique
end type

type em_max from w_liste_patients`em_max within w_liste_patients_categorie_statistique
end type

type em_min from w_liste_patients`em_min within w_liste_patients_categorie_statistique
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_categorie_statistique
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_categorie_statistique
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_categorie_statistique
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_categorie_statistique
end type

type st_min from w_liste_patients`st_min within w_liste_patients_categorie_statistique
end type

type st_max from w_liste_patients`st_max within w_liste_patients_categorie_statistique
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_categorie_statistique
string dataobject = "dw_liste_patients_categorie_statistique"
end type

type st_3 from statictext within w_liste_patients_categorie_statistique
integer x = 475
integer y = 1132
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

type st_2 from statictext within w_liste_patients_categorie_statistique
integer x = 1317
integer y = 1132
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

type st_periode from statictext within w_liste_patients_categorie_statistique
integer x = 347
integer y = 1008
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Période :"
end type

type st_4 from statictext within w_liste_patients_categorie_statistique
integer x = 343
integer y = 828
integer width = 370
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Catégorie :"
end type

type st_nom from statictext within w_liste_patients_categorie_statistique
integer x = 709
integer y = 936
integer width = 2025
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

type em_date_min from uo_date_calendrier within w_liste_patients_categorie_statistique
integer x = 832
integer y = 1124
integer taborder = 100
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_categorie_statistique
integer x = 1586
integer y = 1124
integer taborder = 110
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type dw_categorie from datawindow within w_liste_patients_categorie_statistique
string tag = "no resize all brush"
integer x = 827
integer y = 828
integer width = 855
integer height = 72
integer taborder = 100
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_clinique_categorie_statistique"
boolean border = false
boolean livescroll = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_categorie_statistique
string tag = "no resize all"
integer x = 1024
integer y = 1852
integer taborder = 190
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type cbx_dates from checkbox within w_liste_patients_categorie_statistique
string tag = "no resize all"
integer x = 859
integer y = 1384
integer width = 1010
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Ne pas tenir compte des dates"
boolean lefttext = true
end type

type gb_date from groupbox within w_liste_patients_categorie_statistique
integer x = 795
integer y = 1296
integer width = 1157
integer height = 236
integer taborder = 80
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
end type

