$PBExportHeader$w_liste_patients_date_validite.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_date_validite from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_date_validite
end type
type st_2 from statictext within w_liste_patients_date_validite
end type
type st_3 from statictext within w_liste_patients_date_validite
end type
type rb_un_dos from radiobutton within w_liste_patients_date_validite
end type
type rb_tous_dos from radiobutton within w_liste_patients_date_validite
end type
type gb_dos from groupbox within w_liste_patients_date_validite
end type
type dw_dossier from datawindow within w_liste_patients_date_validite
end type
type em_date_min from uo_date_calendrier within w_liste_patients_date_validite
end type
type em_date_max from uo_date_calendrier within w_liste_patients_date_validite
end type
type rb_cmu_tous from radiobutton within w_liste_patients_date_validite
end type
type rb_cmu_sauf from radiobutton within w_liste_patients_date_validite
end type
type rb_cmu_que from radiobutton within w_liste_patients_date_validite
end type
type dw_mise_en_evidence from datawindow within w_liste_patients_date_validite
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_date_validite
end type
type gb_cmu from gb_1 within w_liste_patients_date_validite
end type
end forward

global type w_liste_patients_date_validite from w_liste_patients
string title = "Liste des Patients - Date de Validité"
st_1 st_1
st_2 st_2
st_3 st_3
rb_un_dos rb_un_dos
rb_tous_dos rb_tous_dos
gb_dos gb_dos
dw_dossier dw_dossier
em_date_min em_date_min
em_date_max em_date_max
rb_cmu_tous rb_cmu_tous
rb_cmu_sauf rb_cmu_sauf
rb_cmu_que rb_cmu_que
dw_mise_en_evidence dw_mise_en_evidence
uo_filtre_email uo_filtre_email
gb_cmu gb_cmu
end type
global w_liste_patients_date_validite w_liste_patients_date_validite

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,titre,p,dos_min,dos_max
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
		titre = "Pour le Dr "+p
	end if

	if rb_tous_dos.checked then
		dos_min="      "
		dos_max="ZZZZZZ"
		titre = titre + " - Tous les Types de dossier"
	else
		dos_min=dw_dossier.getitemstring(dw_dossier.getrow(),"code")
		dos_max=dos_min
		SELECT nom INTO :p FROM dossier WHERE code = :dos_min ;
		titre = titre + " - Dossiers : "+p
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	titre = titre + " - Entre le "+em_date_min.text+" et le "+em_date_max.text
	
	string filtre
	

	if not rb_cmu_tous.checked then
		string v_code_mise_en_evidence, v_nom_mise_en_evidence
		v_code_mise_en_evidence = dw_mise_en_evidence.gettext()
		
		select isnull(nom,'') into :v_nom_mise_en_evidence from mise_en_evidence where code = :v_code_mise_en_evidence ;
		
		IF rb_cmu_que.checked THEN
			filtre =  "patient.mise_en_evidence = '" + dw_mise_en_evidence.gettext()+  "' " 
			titre = titre + ' - ' + v_nom_mise_en_evidence
		ELSE
			IF rb_cmu_sauf.checked THEN
				filtre = "patient.mise_en_evidence <> '" + dw_mise_en_evidence.gettext()+  "' or isNull(mise_en_evidence)  " 
				titre = titre + ' - Sauf : ' + v_nom_mise_en_evidence
			end if
		END IF
	end if
	
	dw_liste.Setfilter(filtre)
	dw_liste.filter()
	uo_filtre_email.filtre_initial = filtre
	
		
	open(w_patience)
	dw_liste.Modify("sous_titre.text = '"+titre+"'")
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


if not france then
	gb_cmu.text = "Choix des patients"
end if



dw_mise_en_evidence.settransobject(sqlca)
dw_mise_en_evidence.retrieve()

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb




end event

on w_liste_patients_date_validite.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.rb_un_dos=create rb_un_dos
this.rb_tous_dos=create rb_tous_dos
this.gb_dos=create gb_dos
this.dw_dossier=create dw_dossier
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.rb_cmu_tous=create rb_cmu_tous
this.rb_cmu_sauf=create rb_cmu_sauf
this.rb_cmu_que=create rb_cmu_que
this.dw_mise_en_evidence=create dw_mise_en_evidence
this.uo_filtre_email=create uo_filtre_email
this.gb_cmu=create gb_cmu
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.rb_un_dos
this.Control[iCurrent+5]=this.rb_tous_dos
this.Control[iCurrent+6]=this.gb_dos
this.Control[iCurrent+7]=this.dw_dossier
this.Control[iCurrent+8]=this.em_date_min
this.Control[iCurrent+9]=this.em_date_max
this.Control[iCurrent+10]=this.rb_cmu_tous
this.Control[iCurrent+11]=this.rb_cmu_sauf
this.Control[iCurrent+12]=this.rb_cmu_que
this.Control[iCurrent+13]=this.dw_mise_en_evidence
this.Control[iCurrent+14]=this.uo_filtre_email
this.Control[iCurrent+15]=this.gb_cmu
end on

on w_liste_patients_date_validite.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.rb_un_dos)
destroy(this.rb_tous_dos)
destroy(this.gb_dos)
destroy(this.dw_dossier)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.rb_cmu_tous)
destroy(this.rb_cmu_sauf)
destroy(this.rb_cmu_que)
destroy(this.dw_mise_en_evidence)
destroy(this.uo_filtre_email)
destroy(this.gb_cmu)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_date_validite
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_date_validite
integer x = 2199
integer taborder = 100
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_date_validite
integer x = 1728
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_date_validite
integer x = 2670
integer taborder = 110
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_date_validite
integer x = 517
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_date_validite
integer x = 3141
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_date_validite
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_date_validite
integer x = 485
integer y = 216
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_date_validite
integer x = 485
integer y = 120
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_date_validite
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_date_validite
integer y = 368
end type

type em_min from w_liste_patients`em_min within w_liste_patients_date_validite
integer y = 368
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_date_validite
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_date_validite
integer x = 320
integer y = 40
integer taborder = 0
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_date_validite
integer x = 1243
integer y = 200
integer taborder = 80
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_date_validite
end type

type st_min from w_liste_patients`st_min within w_liste_patients_date_validite
integer y = 380
end type

type st_max from w_liste_patients`st_max within w_liste_patients_date_validite
integer y = 380
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_date_validite
integer y = 4
integer taborder = 70
string dataobject = "dw_liste_patients_date_validite_edition"
end type

type st_1 from statictext within w_liste_patients_date_validite
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
string text = "Date de validité :"
end type

type st_2 from statictext within w_liste_patients_date_validite
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
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_liste_patients_date_validite
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

type rb_un_dos from radiobutton within w_liste_patients_date_validite
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

type rb_tous_dos from radiobutton within w_liste_patients_date_validite
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

type gb_dos from groupbox within w_liste_patients_date_validite
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

type dw_dossier from datawindow within w_liste_patients_date_validite
string tag = "no resize all"
boolean visible = false
integer x = 1243
integer y = 1052
integer width = 951
integer height = 80
integer taborder = 50
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type em_date_min from uo_date_calendrier within w_liste_patients_date_validite
event destroy ( )
integer x = 754
integer y = 692
integer taborder = 100
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_date_validite
event destroy ( )
integer x = 1563
integer y = 692
integer taborder = 110
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_cmu_tous from radiobutton within w_liste_patients_date_validite
integer x = 402
integer y = 1332
integer width = 402
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
string text = "Tous"
boolean checked = true
end type

event clicked;dw_mise_en_evidence.visible = false
end event

type rb_cmu_sauf from radiobutton within w_liste_patients_date_validite
integer x = 402
integer y = 1568
integer width = 279
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
string text = "Sauf"
end type

event clicked;dw_mise_en_evidence.visible = true
dw_mise_en_evidence.y = this.y
end event

type rb_cmu_que from radiobutton within w_liste_patients_date_validite
integer x = 402
integer y = 1444
integer width = 274
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
string text = "Que"
end type

event clicked;
dw_mise_en_evidence.visible = true
dw_mise_en_evidence.y = this.y
end event

type dw_mise_en_evidence from datawindow within w_liste_patients_date_validite
string tag = "no resize all"
boolean visible = false
integer x = 809
integer y = 1444
integer width = 928
integer height = 72
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_mise_en_evidence"
boolean border = false
boolean livescroll = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_date_validite
string tag = "no resize all"
integer x = 987
integer y = 1852
integer taborder = 180
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type gb_cmu from gb_1 within w_liste_patients_date_validite
integer y = 1232
integer height = 492
integer taborder = 80
string text = "Choix des patients C2S / MGEN ..."
end type

