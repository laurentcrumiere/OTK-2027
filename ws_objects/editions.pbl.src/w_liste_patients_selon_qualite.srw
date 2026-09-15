$PBExportHeader$w_liste_patients_selon_qualite.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_selon_qualite from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_selon_qualite
end type
type st_2 from statictext within w_liste_patients_selon_qualite
end type
type st_3 from statictext within w_liste_patients_selon_qualite
end type
type rb_un_dos from radiobutton within w_liste_patients_selon_qualite
end type
type rb_tous_qual from radiobutton within w_liste_patients_selon_qualite
end type
type dw_qualite from datawindow within w_liste_patients_selon_qualite
end type
type em_date_min from uo_date_calendrier within w_liste_patients_selon_qualite
end type
type em_date_max from uo_date_calendrier within w_liste_patients_selon_qualite
end type
type rb_tous_motifs from radiobutton within w_liste_patients_selon_qualite
end type
type rb_un_motif from radiobutton within w_liste_patients_selon_qualite
end type
type dw_motif from datawindow within w_liste_patients_selon_qualite
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_selon_qualite
end type
type gb_motif from groupbox within w_liste_patients_selon_qualite
end type
type gb_dos from groupbox within w_liste_patients_selon_qualite
end type
end forward

global type w_liste_patients_selon_qualite from w_liste_patients
string title = "Liste des Patients - Qualité du Traitement"
st_1 st_1
st_2 st_2
st_3 st_3
rb_un_dos rb_un_dos
rb_tous_qual rb_tous_qual
dw_qualite dw_qualite
em_date_min em_date_min
em_date_max em_date_max
rb_tous_motifs rb_tous_motifs
rb_un_motif rb_un_motif
dw_motif dw_motif
uo_filtre_email uo_filtre_email
gb_motif gb_motif
gb_dos gb_dos
end type
global w_liste_patients_selon_qualite w_liste_patients_selon_qualite

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,titre,p
double qual_min,qual_max
double motif_min,motif_max
double code_min,code_max
date date_min,date_max

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		titre = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=pra_min
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		titre = "Pour le Dr "+trim(p)
	end if

	if rb_tous_qual.checked then
		qual_min= 0
		qual_max= 9999999999999999
		titre = titre + " - Toutes les Qualités"
	else
		qual_min = dw_qualite.getitemnumber(dw_qualite.getrow(),"code")
		qual_max = qual_min
		SELECT nom INTO :p FROM qualite_traitement WHERE code = :qual_min ;
		titre = titre + " - Qualité : "+trim(p)
	end if

	if rb_tous_motifs.checked then
		motif_min= 0
		motif_max= 9999999999999999
		titre = titre + " - Tous les Motifs"
	else
		motif_min = dw_motif.getitemnumber(dw_motif.getrow(),"code")
		motif_max = motif_min
		SELECT nom INTO :p FROM motif_fin_traitement WHERE code = :motif_min ;
		titre = titre + " - Motif : "+trim(p)
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	titre = titre + " - Fin de Traitement entre le "+em_date_min.text+" et le "+em_date_max.text
	
			
	open(w_patience)
	
	dw_liste.Modify("sous_titre.text = '"+titre+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,qual_min,qual_max, motif_min, motif_max)
	
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true


end if

end subroutine

event open;call super::open;em_date_min.setDate(date(year(today()),1,1))
em_date_max.setDate(today())

dw_qualite.settransobject(SQLCA)
dw_qualite.retrieve() 

dw_motif.settransobject(SQLCA)
dw_motif.retrieve() 

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb


end event

on w_liste_patients_selon_qualite.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.rb_un_dos=create rb_un_dos
this.rb_tous_qual=create rb_tous_qual
this.dw_qualite=create dw_qualite
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.rb_tous_motifs=create rb_tous_motifs
this.rb_un_motif=create rb_un_motif
this.dw_motif=create dw_motif
this.uo_filtre_email=create uo_filtre_email
this.gb_motif=create gb_motif
this.gb_dos=create gb_dos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.rb_un_dos
this.Control[iCurrent+5]=this.rb_tous_qual
this.Control[iCurrent+6]=this.dw_qualite
this.Control[iCurrent+7]=this.em_date_min
this.Control[iCurrent+8]=this.em_date_max
this.Control[iCurrent+9]=this.rb_tous_motifs
this.Control[iCurrent+10]=this.rb_un_motif
this.Control[iCurrent+11]=this.dw_motif
this.Control[iCurrent+12]=this.uo_filtre_email
this.Control[iCurrent+13]=this.gb_motif
this.Control[iCurrent+14]=this.gb_dos
end on

on w_liste_patients_selon_qualite.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.rb_un_dos)
destroy(this.rb_tous_qual)
destroy(this.dw_qualite)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.rb_tous_motifs)
destroy(this.rb_un_motif)
destroy(this.dw_motif)
destroy(this.uo_filtre_email)
destroy(this.gb_motif)
destroy(this.gb_dos)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_selon_qualite
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_selon_qualite
integer x = 2217
integer taborder = 130
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_selon_qualite
integer x = 1737
integer taborder = 150
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_selon_qualite
integer x = 2697
integer taborder = 160
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_selon_qualite
integer x = 507
integer taborder = 50
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_selon_qualite
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_selon_qualite
integer taborder = 40
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_selon_qualite
integer x = 485
integer y = 216
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_selon_qualite
integer x = 485
integer y = 120
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_selon_qualite
integer taborder = 80
end type

type em_max from w_liste_patients`em_max within w_liste_patients_selon_qualite
integer y = 368
end type

type em_min from w_liste_patients`em_min within w_liste_patients_selon_qualite
integer y = 368
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_selon_qualite
integer taborder = 60
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_selon_qualite
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_selon_qualite
integer x = 1243
integer y = 200
integer taborder = 110
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_selon_qualite
end type

type st_min from w_liste_patients`st_min within w_liste_patients_selon_qualite
integer y = 380
end type

type st_max from w_liste_patients`st_max within w_liste_patients_selon_qualite
integer y = 380
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_selon_qualite
integer x = 14
integer y = 20
integer taborder = 90
string dataobject = "dw_liste_patients_selon_qualite_edition"
end type

type st_1 from statictext within w_liste_patients_selon_qualite
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
boolean enabled = false
string text = "Date de fin de traitement :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_liste_patients_selon_qualite
integer x = 1317
integer y = 712
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

type st_3 from statictext within w_liste_patients_selon_qualite
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
boolean enabled = false
string text = "Entre le "
boolean focusrectangle = false
end type

type rb_un_dos from radiobutton within w_liste_patients_selon_qualite
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
string text = "Une qualité"
end type

event clicked;dw_qualite.visible = true
end event

type rb_tous_qual from radiobutton within w_liste_patients_selon_qualite
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
string text = "Toutes les qualités"
boolean checked = true
end type

event clicked;dw_qualite.visible = false
end event

type dw_qualite from datawindow within w_liste_patients_selon_qualite
string tag = "no resizeall"
boolean visible = false
integer x = 1230
integer y = 1052
integer width = 1189
integer height = 80
integer taborder = 70
string dataobject = "dw_qualite_traitement_cherche"
boolean border = false
end type

type em_date_min from uo_date_calendrier within w_liste_patients_selon_qualite
integer x = 754
integer y = 692
integer taborder = 140
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_selon_qualite
integer x = 1563
integer y = 692
integer taborder = 170
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_tous_motifs from radiobutton within w_liste_patients_selon_qualite
integer x = 485
integer y = 1336
integer width = 512
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
string text = "Tous les motifs"
boolean checked = true
end type

event clicked;dw_motif.visible = false
end event

type rb_un_motif from radiobutton within w_liste_patients_selon_qualite
integer x = 485
integer y = 1440
integer width = 512
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
string text = "Un motif"
end type

event clicked;

dw_motif.visible = true
end event

type dw_motif from datawindow within w_liste_patients_selon_qualite
string tag = "no resizeall"
boolean visible = false
integer x = 1093
integer y = 1440
integer width = 1774
integer height = 72
integer taborder = 120
boolean bringtotop = true
string title = "none"
string dataobject = "dw_motif_fin_traitement_cherche"
boolean border = false
boolean livescroll = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_selon_qualite
string tag = "no resize all"
integer x = 987
integer y = 1852
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type gb_motif from groupbox within w_liste_patients_selon_qualite
integer x = 320
integer y = 1256
integer width = 2725
integer height = 304
integer taborder = 100
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Motif de Fin de Traitement"
end type

type gb_dos from groupbox within w_liste_patients_selon_qualite
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
string text = "Choix de la Qualité de Traitement"
end type

