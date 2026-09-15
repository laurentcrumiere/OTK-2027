$PBExportHeader$w_liste_patients_x_ans.srw
forward
global type w_liste_patients_x_ans from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_x_ans
end type
type st_2 from statictext within w_liste_patients_x_ans
end type
type st_3 from statictext within w_liste_patients_x_ans
end type
type em_anni from editmask within w_liste_patients_x_ans
end type
type st_5 from statictext within w_liste_patients_x_ans
end type
type rb_un_dos from radiobutton within w_liste_patients_x_ans
end type
type rb_tous_dos from radiobutton within w_liste_patients_x_ans
end type
type gb_dos from groupbox within w_liste_patients_x_ans
end type
type dw_dossier from datawindow within w_liste_patients_x_ans
end type
type uo_edition from uo_edition_rtf within w_liste_patients_x_ans
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_x_ans
end type
type em_date_min from uo_date_calendrier within w_liste_patients_x_ans
end type
type em_date_max from uo_date_calendrier within w_liste_patients_x_ans
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_x_ans
end type
end forward

global type w_liste_patients_x_ans from w_liste_patients
string title = "Liste des Patients qui vont avoir x ans"
st_1 st_1
st_2 st_2
st_3 st_3
em_anni em_anni
st_5 st_5
rb_un_dos rb_un_dos
rb_tous_dos rb_tous_dos
gb_dos gb_dos
dw_dossier dw_dossier
uo_edition uo_edition
cb_lettres cb_lettres
em_date_min em_date_min
em_date_max em_date_max
uo_filtre_email uo_filtre_email
end type
global w_liste_patients_x_ans w_liste_patients_x_ans

type variables

end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,tit,np,dos_min,dos_max,p
double code_min,code_max,anni
date date_min,date_max

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

	anni = double(em_anni.text)
	
	// Les dates min et max correspondent directement aux bornes de date de naissance qu'on attante
	date_min = date(em_date_min.text)
	date_min = ajout_x_annee(date_min, - anni)
	date_max = date(em_date_max.text)
	date_max = ajout_x_annee(date_max, - anni)

	tit = tit +" entre le "+em_date_min.text+" et le "+em_date_max.text
	dw_liste.Modify("sous_titre.text = '"+tit+"'")
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,anni,dos_min,dos_max)
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true

end if

end subroutine

event open;call super::open;em_date_min.setDate(today())
em_date_max.setDate(date(year(today()),12,31))
em_anni.text = "16"

dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve() 

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb



end event

on w_liste_patients_x_ans.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.em_anni=create em_anni
this.st_5=create st_5
this.rb_un_dos=create rb_un_dos
this.rb_tous_dos=create rb_tous_dos
this.gb_dos=create gb_dos
this.dw_dossier=create dw_dossier
this.uo_edition=create uo_edition
this.cb_lettres=create cb_lettres
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.em_anni
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.rb_un_dos
this.Control[iCurrent+7]=this.rb_tous_dos
this.Control[iCurrent+8]=this.gb_dos
this.Control[iCurrent+9]=this.dw_dossier
this.Control[iCurrent+10]=this.uo_edition
this.Control[iCurrent+11]=this.cb_lettres
this.Control[iCurrent+12]=this.em_date_min
this.Control[iCurrent+13]=this.em_date_max
this.Control[iCurrent+14]=this.uo_filtre_email
end on

on w_liste_patients_x_ans.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.em_anni)
destroy(this.st_5)
destroy(this.rb_un_dos)
destroy(this.rb_tous_dos)
destroy(this.gb_dos)
destroy(this.dw_dossier)
destroy(this.uo_edition)
destroy(this.cb_lettres)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.uo_filtre_email)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_x_ans
integer x = 818
integer y = 1052
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_x_ans
integer x = 2089
integer width = 407
integer taborder = 140
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_x_ans
integer x = 1678
integer width = 407
integer taborder = 130
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_x_ans
integer x = 2912
integer width = 407
integer taborder = 150
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_x_ans
integer x = 530
integer width = 407
integer taborder = 160
end type

event cb_ecran::clicked;call super::clicked;cb_lettres.enabled ( true)
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_x_ans
boolean visible = true
integer x = 3323
integer width = 407
end type

event cb_lien_word::clicked;call super::clicked;int	tab_type[1] = {lettre_patient_x_ans}

traitement_word(tab_type, dw_liste)
end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_x_ans
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_x_ans
integer y = 252
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_x_ans
integer y = 156
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_x_ans
integer taborder = 100
end type

type em_max from w_liste_patients`em_max within w_liste_patients_x_ans
integer y = 452
string mask = "#########0"
string displaydata = ""
string minmax = "-99999999~~999999999"
end type

type em_min from w_liste_patients`em_min within w_liste_patients_x_ans
integer x = 773
integer y = 452
string displaydata = "Ä"
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_x_ans
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_x_ans
integer y = 76
integer taborder = 80
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_x_ans
integer y = 248
integer taborder = 120
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_x_ans
end type

type st_min from w_liste_patients`st_min within w_liste_patients_x_ans
integer y = 464
end type

type st_max from w_liste_patients`st_max within w_liste_patients_x_ans
integer y = 464
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_x_ans
integer y = 0
integer height = 1852
integer taborder = 110
string dataobject = "dw_liste_patients_x_ans_edition"
end type

type st_1 from statictext within w_liste_patients_x_ans
integer x = 475
integer y = 604
integer width = 439
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Anniversaire"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_patients_x_ans
integer x = 1317
integer y = 740
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Et le"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_3 from statictext within w_liste_patients_x_ans
integer x = 475
integer y = 736
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type em_anni from editmask within w_liste_patients_x_ans
integer x = 923
integer y = 588
integer width = 233
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "####0"
boolean spin = true
double increment = 1
string minmax = "-9999~~99999"
end type

type st_5 from statictext within w_liste_patients_x_ans
integer x = 1198
integer y = 604
integer width = 155
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Ans"
boolean focusrectangle = false
end type

type rb_un_dos from radiobutton within w_liste_patients_x_ans
event clicked pbm_bnclicked
integer x = 453
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

type rb_tous_dos from radiobutton within w_liste_patients_x_ans
event clicked pbm_bnclicked
integer x = 453
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

type gb_dos from groupbox within w_liste_patients_x_ans
integer x = 288
integer y = 876
integer width = 2121
integer height = 304
integer taborder = 70
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

type dw_dossier from datawindow within w_liste_patients_x_ans
string tag = "position"
boolean visible = false
integer x = 1339
integer y = 1040
integer width = 951
integer height = 80
integer taborder = 50
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type uo_edition from uo_edition_rtf within w_liste_patients_x_ans
boolean visible = false
integer x = 1298
integer y = 532
integer taborder = 41
boolean border = false
long backcolor = 1090519039
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_x_ans
integer x = 2501
integer y = 1868
integer width = 407
integer taborder = 150
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;Datastore dw_donnees
string pra_min,pra_max,tit,np
double code_min,code_max,tot,cpt, anni
date date_min,date_max
long nb, i, j, nblig
string code[10],dos_min,dos_max
double code_courant

dw_donnees = CREATE DataStore
dw_donnees.DataObject = "dw_lettre_x_ans"
dw_donnees.SetTransObject(SQLCA)

//prepa_faite = true
if rb_tous.checked then
	pra_min="      "
	pra_max="ZZZZZZ"
else
	pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
	pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
end if

if rb_tous_dos.checked then
	dos_min="      "
	dos_max="ZZZZZZ"
else
	dos_min=dw_dossier.getitemstring(dw_dossier.getrow(),"code")
	dos_max=dos_min
end if

code_min = double(em_min.text)
code_max = double(em_max.text)

//date_min = date(em_date_min.text)
//date_max = date(em_date_max.text)
//date_min2 = relativedate(date_min,-1)


// Les dates min et max correspondent directement aux bornes de date de naissance qu'on attante
date_min = date(em_date_min.text)
date_min = ajout_x_annee(date_min, - anni)
date_max = date(em_date_max.text)
date_max = ajout_x_annee(date_max, - anni)


anni = double(em_anni.text)


// Pour contourner le bug version 2007 ... impression lettre que pour le 1er patient ....
// On parcourt la liste est imprimon lettre par lettre !!!

nblig = dw_liste.rowcount()

for cpt = 1 to nblig
	code_courant = dw_liste.getitemnumber(cpt,"code") 
	dw_donnees.retrieve(code_courant)

nb = dw_donnees.rowcount()

	uo_edition.edition(dw_donnees,"lettre_x_ans", false, "" )
		
	ajout_histo_editions(code_courant,"PATXANS",today(),"Patient qui va avoir x ans")
NEXT	
 


Destroy dw_donnees

end event

type em_date_min from uo_date_calendrier within w_liste_patients_x_ans
integer x = 846
integer y = 724
integer taborder = 240
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_x_ans
integer x = 1623
integer y = 728
integer taborder = 250
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type uo_filtre_email from uo_filtre_emails within w_liste_patients_x_ans
string tag = "no resize all"
integer x = 942
integer y = 1856
integer taborder = 130
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

