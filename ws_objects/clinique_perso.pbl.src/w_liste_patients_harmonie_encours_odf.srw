$PBExportHeader$w_liste_patients_harmonie_encours_odf.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_harmonie_encours_odf from w_liste_patients
end type
type st_2 from statictext within w_liste_patients_harmonie_encours_odf
end type
type em_date_min from uo_date_calendrier within w_liste_patients_harmonie_encours_odf
end type
type pb_exporter from uo_picturebutton_390x120 within w_liste_patients_harmonie_encours_odf
end type
end forward

global type w_liste_patients_harmonie_encours_odf from w_liste_patients
string title = "Envours pour Centres Hermonie"
st_2 st_2
em_date_min em_date_min
pb_exporter pb_exporter
end type
global w_liste_patients_harmonie_encours_odf w_liste_patients_harmonie_encours_odf

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,soin
double code_min,code_max
date date_min, date_max


// pour la mises à jour du soin suivant
double tot_lignes,cpt_lignes
double v_code
date v_date_soin_suivant
string v_soin_suivant


if not prepa_faite then
	prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)


	date_min = date(em_date_min.text)



	open(w_patience)
	dw_liste.retrieve(date_min,serial)
	

	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	em_nb.visible = true

end if

end subroutine

event open;call super::open;
em_date_min.setDate(Today())

end event

on w_liste_patients_harmonie_encours_odf.create
int iCurrent
call super::create
this.st_2=create st_2
this.em_date_min=create em_date_min
this.pb_exporter=create pb_exporter
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_2
this.Control[iCurrent+2]=this.em_date_min
this.Control[iCurrent+3]=this.pb_exporter
end on

on w_liste_patients_harmonie_encours_odf.destroy
call super::destroy
destroy(this.st_2)
destroy(this.em_date_min)
destroy(this.pb_exporter)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_harmonie_encours_odf
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_harmonie_encours_odf
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_harmonie_encours_odf
integer taborder = 130
end type

event cb_autre::clicked;call super::clicked;pb_exporter.enabled = false
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_harmonie_encours_odf
integer x = 2665
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_harmonie_encours_odf
integer taborder = 140
end type

event cb_ecran::clicked;call super::clicked;pb_exporter.enabled = true
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_harmonie_encours_odf
integer x = 3131
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_harmonie_encours_odf
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_harmonie_encours_odf
boolean enabled = false
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_harmonie_encours_odf
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_harmonie_encours_odf
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_harmonie_encours_odf
integer y = 528
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_harmonie_encours_odf
integer y = 528
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_harmonie_encours_odf
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_harmonie_encours_odf
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_harmonie_encours_odf
integer taborder = 100
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_harmonie_encours_odf
end type

type st_min from w_liste_patients`st_min within w_liste_patients_harmonie_encours_odf
integer y = 540
end type

type st_max from w_liste_patients`st_max within w_liste_patients_harmonie_encours_odf
integer y = 540
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_harmonie_encours_odf
integer taborder = 90
string dataobject = "dw_liste_patients__harmonie_encours_odf"
end type

event dw_liste::clicked;

//
end event

type st_2 from statictext within w_liste_patients_harmonie_encours_odf
string tag = "a masquer"
integer x = 347
integer y = 792
integer width = 590
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date de Référence  "
alignment alignment = center!
end type

type em_date_min from uo_date_calendrier within w_liste_patients_harmonie_encours_odf
integer x = 942
integer y = 776
integer taborder = 210
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type pb_exporter from uo_picturebutton_390x120 within w_liste_patients_harmonie_encours_odf
integer x = 2199
integer y = 1868
integer width = 457
integer taborder = 70
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
end type

event clicked;call super::clicked;

dw_liste.saveas()
end event

