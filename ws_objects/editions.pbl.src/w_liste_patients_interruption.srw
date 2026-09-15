$PBExportHeader$w_liste_patients_interruption.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_interruption from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_interruption
end type
type st_2 from statictext within w_liste_patients_interruption
end type
type st_3 from statictext within w_liste_patients_interruption
end type
type rb_un_dos from radiobutton within w_liste_patients_interruption
end type
type rb_tous_dos from radiobutton within w_liste_patients_interruption
end type
type gb_dos from groupbox within w_liste_patients_interruption
end type
type dw_dossier from datawindow within w_liste_patients_interruption
end type
type em_date_max from uo_date_calendrier within w_liste_patients_interruption
end type
type em_date_min from uo_date_calendrier within w_liste_patients_interruption
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_interruption
end type
end forward

global type w_liste_patients_interruption from w_liste_patients
string title = "Liste des Patients - Date d~'interruption"
st_1 st_1
st_2 st_2
st_3 st_3
rb_un_dos rb_un_dos
rb_tous_dos rb_tous_dos
gb_dos gb_dos
dw_dossier dw_dossier
em_date_max em_date_max
em_date_min em_date_min
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_interruption w_liste_patients_interruption

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit,p,dos_min,dos_max
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
		pra_max=pra_min
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if

	if rb_tous_dos.checked then
		dos_min="      "
		dos_max="ZZZZZZ"
		tit = tit + " - Tous les Types de dossier"
	else
		dos_min=dw_dossier.getitemstring(dw_dossier.getrow(),"code")
		dos_max=dos_min
		SELECT nom INTO :p FROM dossier WHERE code = :dos_min ;
		tit = tit + " - Dossiers : "+p
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	tit = tit + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
	open(w_patience)
	dw_liste.Modify("sous_titre.text = '"+tit+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,dos_min,dos_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true


end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())
dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve() 

// Personnalisation des différents libellés ...
This.Title = "Liste des Patients - Date " + libelle_date_interruption
st_1.text = "Date " + libelle_date_interruption + " :"
dw_liste.object.titre_t.text = "Liste des Patients selon la Date " + libelle_date_interruption
dw_liste.object.dte_interruption_t.text = libelle_date_interruption + " :"
dw_liste.object.debut_traitement_t.text = libelle_debut_traitement

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb


end event

on w_liste_patients_interruption.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.rb_un_dos=create rb_un_dos
this.rb_tous_dos=create rb_tous_dos
this.gb_dos=create gb_dos
this.dw_dossier=create dw_dossier
this.em_date_max=create em_date_max
this.em_date_min=create em_date_min
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.rb_un_dos
this.Control[iCurrent+5]=this.rb_tous_dos
this.Control[iCurrent+6]=this.gb_dos
this.Control[iCurrent+7]=this.dw_dossier
this.Control[iCurrent+8]=this.em_date_max
this.Control[iCurrent+9]=this.em_date_min
this.Control[iCurrent+10]=this.uo_filtre_email
end on

on w_liste_patients_interruption.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.rb_un_dos)
destroy(this.rb_tous_dos)
destroy(this.gb_dos)
destroy(this.dw_dossier)
destroy(this.em_date_max)
destroy(this.em_date_min)
destroy(this.uo_filtre_email)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_interruption
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_interruption
integer x = 2199
integer taborder = 100
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_interruption
integer x = 1728
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_interruption
integer x = 2670
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_interruption
integer x = 517
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_interruption
integer x = 3141
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_interruption
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_interruption
integer x = 485
integer y = 216
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_interruption
integer x = 485
integer y = 120
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_interruption
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_interruption
integer y = 368
end type

type em_min from w_liste_patients`em_min within w_liste_patients_interruption
integer y = 368
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_interruption
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_interruption
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_interruption
integer x = 1243
integer y = 200
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_interruption
end type

type st_min from w_liste_patients`st_min within w_liste_patients_interruption
integer y = 380
end type

type st_max from w_liste_patients`st_max within w_liste_patients_interruption
integer y = 380
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_interruption
integer y = 4
integer taborder = 70
string dataobject = "dw_liste_patients_interruption_edition"
end type

type st_1 from statictext within w_liste_patients_interruption
integer x = 347
integer y = 588
integer width = 878
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date d~'interruption :"
end type

type st_2 from statictext within w_liste_patients_interruption
integer x = 1417
integer y = 712
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

type st_3 from statictext within w_liste_patients_interruption
integer x = 475
integer y = 712
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

type rb_un_dos from radiobutton within w_liste_patients_interruption
integer x = 485
integer y = 1052
integer width = 667
integer height = 80
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

type rb_tous_dos from radiobutton within w_liste_patients_interruption
integer x = 485
integer y = 956
integer width = 850
integer height = 80
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

type gb_dos from groupbox within w_liste_patients_interruption
integer x = 320
integer y = 876
integer width = 2121
integer height = 304
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

type dw_dossier from datawindow within w_liste_patients_interruption
string tag = "no resizeall"
boolean visible = false
integer x = 1243
integer y = 1052
integer width = 951
integer height = 80
integer taborder = 50
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type em_date_max from uo_date_calendrier within w_liste_patients_interruption
integer x = 1687
integer y = 696
integer taborder = 170
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type em_date_min from uo_date_calendrier within w_liste_patients_interruption
integer x = 882
integer y = 696
integer taborder = 180
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type uo_filtre_email from uo_filtre_emails within w_liste_patients_interruption
string tag = "no resize all"
integer x = 987
integer y = 1856
integer taborder = 180
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

