$PBExportHeader$w_tableau_bord_comprartif_dates.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_tableau_bord_comprartif_dates from w_tableau_bord_activite_mensu_rdv
end type
type rb_patient from radiobutton within w_tableau_bord_comprartif_dates
end type
type rb_enfant from radiobutton within w_tableau_bord_comprartif_dates
end type
type rb_adulte from radiobutton within w_tableau_bord_comprartif_dates
end type
type rb_cmu_tous from radiobutton within w_tableau_bord_comprartif_dates
end type
type gb_patients from gb_1 within w_tableau_bord_comprartif_dates
end type
type rb_cmu_que from radiobutton within w_tableau_bord_comprartif_dates
end type
type gb_cmu from gb_1 within w_tableau_bord_comprartif_dates
end type
type dw_mise_en_evidence from datawindow within w_tableau_bord_comprartif_dates
end type
end forward

global type w_tableau_bord_comprartif_dates from w_tableau_bord_activite_mensu_rdv
string title = "Tableau de Bord - Comparatif 1ers Contacts / 1ères Visites / Débuts Traitement"
rb_patient rb_patient
rb_enfant rb_enfant
rb_adulte rb_adulte
rb_cmu_tous rb_cmu_tous
gb_patients gb_patients
rb_cmu_que rb_cmu_que
gb_cmu gb_cmu
dw_mise_en_evidence dw_mise_en_evidence
end type
global w_tableau_bord_comprartif_dates w_tableau_bord_comprartif_dates

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max
long v_mois, annee1, annee2
string v_adulte_min, v_adulte_max
string v_evidence_min, v_evidence_max

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
	
	v_mois = integer(dw_mois.gettext())
	
	annee1 = long(em_annee1.text)
	annee2 = long(em_annee2.text)

	open(w_patience)

	// pour actualiser les VRAIES date de premire visite
	maj_date_premiere_visite()

	if rb_patient.checked then 
		v_adulte_min = 'N'
		v_adulte_max = 'O'
	else
		if rb_adulte.checked then 
			v_adulte_min = 'O'
			v_adulte_max = 'O'
		else
			v_adulte_min = 'N'
			v_adulte_max = 'N'
		end if
	end if
	
	if rb_cmu_tous.checked then 
		v_evidence_min = ""
		v_evidence_max = "ZZZZZ"
	else
		v_evidence_min = dw_mise_en_evidence.gettext()
		v_evidence_max = v_evidence_min
	end if
	
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max, v_mois, annee1, annee2, v_adulte_min, v_adulte_max, v_evidence_min, v_evidence_max)

	close(w_patience)


end if

end subroutine

on w_tableau_bord_comprartif_dates.create
int iCurrent
call super::create
this.rb_patient=create rb_patient
this.rb_enfant=create rb_enfant
this.rb_adulte=create rb_adulte
this.rb_cmu_tous=create rb_cmu_tous
this.gb_patients=create gb_patients
this.rb_cmu_que=create rb_cmu_que
this.gb_cmu=create gb_cmu
this.dw_mise_en_evidence=create dw_mise_en_evidence
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_patient
this.Control[iCurrent+2]=this.rb_enfant
this.Control[iCurrent+3]=this.rb_adulte
this.Control[iCurrent+4]=this.rb_cmu_tous
this.Control[iCurrent+5]=this.gb_patients
this.Control[iCurrent+6]=this.rb_cmu_que
this.Control[iCurrent+7]=this.gb_cmu
this.Control[iCurrent+8]=this.dw_mise_en_evidence
end on

on w_tableau_bord_comprartif_dates.destroy
call super::destroy
destroy(this.rb_patient)
destroy(this.rb_enfant)
destroy(this.rb_adulte)
destroy(this.rb_cmu_tous)
destroy(this.gb_patients)
destroy(this.rb_cmu_que)
destroy(this.gb_cmu)
destroy(this.dw_mise_en_evidence)
end on

event open;call super::open;

dw_mise_en_evidence.settransobject(sqlca)
dw_mise_en_evidence.retrieve()


end event

type p_fond from w_tableau_bord_activite_mensu_rdv`p_fond within w_tableau_bord_comprartif_dates
end type

type cb_imprimer from w_tableau_bord_activite_mensu_rdv`cb_imprimer within w_tableau_bord_comprartif_dates
end type

type cb_autre from w_tableau_bord_activite_mensu_rdv`cb_autre within w_tableau_bord_comprartif_dates
end type

type cb_fermer from w_tableau_bord_activite_mensu_rdv`cb_fermer within w_tableau_bord_comprartif_dates
end type

type cb_ecran from w_tableau_bord_activite_mensu_rdv`cb_ecran within w_tableau_bord_comprartif_dates
end type

type cb_lien_word from w_tableau_bord_activite_mensu_rdv`cb_lien_word within w_tableau_bord_comprartif_dates
end type

type uo_size from w_tableau_bord_activite_mensu_rdv`uo_size within w_tableau_bord_comprartif_dates
end type

type rb_un from w_tableau_bord_activite_mensu_rdv`rb_un within w_tableau_bord_comprartif_dates
end type

type rb_tous from w_tableau_bord_activite_mensu_rdv`rb_tous within w_tableau_bord_comprartif_dates
end type

type em_nb from w_tableau_bord_activite_mensu_rdv`em_nb within w_tableau_bord_comprartif_dates
end type

type em_max from w_tableau_bord_activite_mensu_rdv`em_max within w_tableau_bord_comprartif_dates
end type

type em_min from w_tableau_bord_activite_mensu_rdv`em_min within w_tableau_bord_comprartif_dates
end type

type dw_1 from w_tableau_bord_activite_mensu_rdv`dw_1 within w_tableau_bord_comprartif_dates
end type

type gb_1 from w_tableau_bord_activite_mensu_rdv`gb_1 within w_tableau_bord_comprartif_dates
end type

type dw_prati from w_tableau_bord_activite_mensu_rdv`dw_prati within w_tableau_bord_comprartif_dates
end type

type cbx_filtre from w_tableau_bord_activite_mensu_rdv`cbx_filtre within w_tableau_bord_comprartif_dates
end type

type st_min from w_tableau_bord_activite_mensu_rdv`st_min within w_tableau_bord_comprartif_dates
end type

type st_max from w_tableau_bord_activite_mensu_rdv`st_max within w_tableau_bord_comprartif_dates
end type

type dw_liste from w_tableau_bord_activite_mensu_rdv`dw_liste within w_tableau_bord_comprartif_dates
integer y = 28
string dataobject = "dw_tableau_bord_comparatif_dates"
end type

type st_1 from w_tableau_bord_activite_mensu_rdv`st_1 within w_tableau_bord_comprartif_dates
boolean visible = false
end type

type st_2 from w_tableau_bord_activite_mensu_rdv`st_2 within w_tableau_bord_comprartif_dates
integer x = 352
integer y = 860
end type

type em_annee1 from w_tableau_bord_activite_mensu_rdv`em_annee1 within w_tableau_bord_comprartif_dates
integer x = 1056
integer y = 832
end type

type em_annee2 from w_tableau_bord_activite_mensu_rdv`em_annee2 within w_tableau_bord_comprartif_dates
integer x = 1554
integer y = 832
end type

type st_3 from w_tableau_bord_activite_mensu_rdv`st_3 within w_tableau_bord_comprartif_dates
integer x = 1413
integer y = 856
end type

type cb_exporter from w_tableau_bord_activite_mensu_rdv`cb_exporter within w_tableau_bord_comprartif_dates
end type

type dw_mois from w_tableau_bord_activite_mensu_rdv`dw_mois within w_tableau_bord_comprartif_dates
boolean visible = false
end type

type rb_patient from radiobutton within w_tableau_bord_comprartif_dates
integer x = 416
integer y = 1184
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

type rb_enfant from radiobutton within w_tableau_bord_comprartif_dates
integer x = 416
integer y = 1308
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
string text = "Enfants"
end type

type rb_adulte from radiobutton within w_tableau_bord_comprartif_dates
integer x = 416
integer y = 1432
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
string text = "Adultes"
end type

type rb_cmu_tous from radiobutton within w_tableau_bord_comprartif_dates
integer x = 1467
integer y = 1200
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

type gb_patients from gb_1 within w_tableau_bord_comprartif_dates
integer y = 1084
integer width = 850
integer height = 472
integer taborder = 70
string text = "Choix des patients"
end type

type rb_cmu_que from radiobutton within w_tableau_bord_comprartif_dates
integer x = 1467
integer y = 1368
integer width = 274
integer height = 80
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

type gb_cmu from gb_1 within w_tableau_bord_comprartif_dates
integer x = 1385
integer y = 1084
integer width = 1819
integer height = 472
integer taborder = 80
string text = "Choix des patients C2S ou autres"
end type

type dw_mise_en_evidence from datawindow within w_tableau_bord_comprartif_dates
string tag = "no resize all"
boolean visible = false
integer x = 1865
integer y = 1380
integer width = 928
integer height = 72
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_mise_en_evidence"
boolean border = false
boolean livescroll = true
end type

