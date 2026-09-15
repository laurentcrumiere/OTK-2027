$PBExportHeader$w_liste_patients_mon_orthodontiste.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_mon_orthodontiste from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_mon_orthodontiste
end type
type st_3 from statictext within w_liste_patients_mon_orthodontiste
end type
type st_2 from statictext within w_liste_patients_mon_orthodontiste
end type
type uo_edition from uo_edition_rtf within w_liste_patients_mon_orthodontiste
end type
type em_date_min from uo_date_calendrier within w_liste_patients_mon_orthodontiste
end type
type em_date_max from uo_date_calendrier within w_liste_patients_mon_orthodontiste
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_mon_orthodontiste
end type
type rb_tous_dos from radiobutton within w_liste_patients_mon_orthodontiste
end type
type rb_un_dos from radiobutton within w_liste_patients_mon_orthodontiste
end type
type dw_dossier from datawindow within w_liste_patients_mon_orthodontiste
end type
type gb_dos from groupbox within w_liste_patients_mon_orthodontiste
end type
end forward

global type w_liste_patients_mon_orthodontiste from w_liste_patients
string title = "Liste des Patients ~"Mon Orthodontiste~""
st_1 st_1
st_3 st_3
st_2 st_2
uo_edition uo_edition
em_date_min em_date_min
em_date_max em_date_max
uo_filtre_email uo_filtre_email
rb_tous_dos rb_tous_dos
rb_un_dos rb_un_dos
dw_dossier dw_dossier
gb_dos gb_dos
end type
global w_liste_patients_mon_orthodontiste w_liste_patients_mon_orthodontiste

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit,np
double code_min,code_max
long delai_min, delai_max
long delai_1, delai_2, delai_3, delai_4
date date_min, date_max
long lig, tot
string v_dos_min, v_dos_max, v_nom_dossier

date_min = date(em_date_min.text)
date_max = date(em_date_max.text)

if date_max < date_min then
	Messagebox("ATTENTION","Erreur dans la saisie des dates de la période.")
else
	if not prepa_faite then
		//prepa_faite = true
		if rb_tous.checked then
			pra_min="      "
			pra_max="ZZZZZZ"
			tit = "Pour tous les Praticiens"
		else
			pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
			pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
			SELECT nom INTO :np FROM prati WHERE code = :pra_min ;
			Tit = "Pour le Dr "+np
		end if
	
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		if rb_tous_dos.checked then
			v_dos_min="  "
			v_dos_max="ZZZZZ"
			tit = tit + " - Tous les dossiers "
		else
			v_dos_min =dw_dossier.getitemstring(dw_dossier.getrow(),"code")
			v_dos_max = v_dos_min
			select nom into :v_nom_dossier from dossier where code = :v_dos_min ;
			tit = tit + " - Dossiers : " + v_nom_dossier
		end if
		
		

		tit = tit +" entre le "+em_date_min.text+" et le "+em_date_max.text
		dw_liste.Modify("sous_titre.text = '"+tit+"'")
		tit = 'Liste des Patients "'+ libelle_application + '"'
		dw_liste.Modify("t_1.text = '"+tit+"'")
		
		open(w_patience)
		dw_liste.retrieve(code_min,code_max,pra_min,pra_max, date_min, date_max, v_dos_min, v_dos_max )
		
		
		close(w_patience)
	
		//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
		//em_nb.visible = true
	
	end if
end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

em_min.text = string(min)

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

dw_dossier.settransobject(sqlca)
dw_dossier.retrieve()
end event

on w_liste_patients_mon_orthodontiste.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_3=create st_3
this.st_2=create st_2
this.uo_edition=create uo_edition
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.uo_filtre_email=create uo_filtre_email
this.rb_tous_dos=create rb_tous_dos
this.rb_un_dos=create rb_un_dos
this.dw_dossier=create dw_dossier
this.gb_dos=create gb_dos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_3
this.Control[iCurrent+3]=this.st_2
this.Control[iCurrent+4]=this.uo_edition
this.Control[iCurrent+5]=this.em_date_min
this.Control[iCurrent+6]=this.em_date_max
this.Control[iCurrent+7]=this.uo_filtre_email
this.Control[iCurrent+8]=this.rb_tous_dos
this.Control[iCurrent+9]=this.rb_un_dos
this.Control[iCurrent+10]=this.dw_dossier
this.Control[iCurrent+11]=this.gb_dos
end on

on w_liste_patients_mon_orthodontiste.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.uo_edition)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.uo_filtre_email)
destroy(this.rb_tous_dos)
destroy(this.rb_un_dos)
destroy(this.dw_dossier)
destroy(this.gb_dos)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_mon_orthodontiste
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_mon_orthodontiste
integer x = 2254
integer width = 416
integer taborder = 150
string text = "Imprimer"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_mon_orthodontiste
integer x = 1783
integer width = 416
integer taborder = 140
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_mon_orthodontiste
integer x = 2725
integer width = 416
integer taborder = 160
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_mon_orthodontiste
integer x = 530
integer width = 416
integer taborder = 170
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_mon_orthodontiste
integer x = 3365
integer width = 416
end type

event cb_lien_word::clicked;call super::clicked;int tab_type[1] = {lettre_patient_anni}

traitement_word(tab_type, dw_liste)
end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_mon_orthodontiste
integer taborder = 40
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_mon_orthodontiste
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_mon_orthodontiste
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_mon_orthodontiste
integer taborder = 100
end type

type em_max from w_liste_patients`em_max within w_liste_patients_mon_orthodontiste
end type

type em_min from w_liste_patients`em_min within w_liste_patients_mon_orthodontiste
integer x = 791
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_mon_orthodontiste
integer taborder = 60
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_mon_orthodontiste
integer taborder = 90
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_mon_orthodontiste
integer taborder = 120
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_mon_orthodontiste
end type

type st_min from w_liste_patients`st_min within w_liste_patients_mon_orthodontiste
end type

type st_max from w_liste_patients`st_max within w_liste_patients_mon_orthodontiste
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_mon_orthodontiste
integer height = 1832
integer taborder = 110
string dataobject = "dw_liste_patients_mon_orthodontiste"
end type

type st_1 from statictext within w_liste_patients_mon_orthodontiste
integer x = 347
integer y = 832
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Dernière connexion :"
end type

type st_3 from statictext within w_liste_patients_mon_orthodontiste
integer x = 475
integer y = 956
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

type st_2 from statictext within w_liste_patients_mon_orthodontiste
integer x = 1317
integer y = 956
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

type uo_edition from uo_edition_rtf within w_liste_patients_mon_orthodontiste
boolean visible = false
integer x = 1408
integer y = 344
integer taborder = 50
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type em_date_min from uo_date_calendrier within w_liste_patients_mon_orthodontiste
integer x = 754
integer y = 936
integer taborder = 90
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_mon_orthodontiste
integer x = 1563
integer y = 936
integer taborder = 100
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type uo_filtre_email from uo_filtre_emails within w_liste_patients_mon_orthodontiste
string tag = "no resize all"
integer x = 1001
integer y = 1848
integer taborder = 110
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type rb_tous_dos from radiobutton within w_liste_patients_mon_orthodontiste
integer x = 489
integer y = 1228
integer width = 850
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les types de dossier "
boolean checked = true
end type

event clicked;dw_dossier.visible = false
end event

type rb_un_dos from radiobutton within w_liste_patients_mon_orthodontiste
integer x = 489
integer y = 1324
integer width = 667
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un type de dossier "
end type

event clicked;dw_dossier.visible = true
end event

type dw_dossier from datawindow within w_liste_patients_mon_orthodontiste
string tag = "no resizeall"
boolean visible = false
integer x = 1198
integer y = 1328
integer width = 946
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type gb_dos from groupbox within w_liste_patients_mon_orthodontiste
integer x = 370
integer y = 1124
integer width = 1888
integer height = 304
integer taborder = 51
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du type de dossier "
end type

