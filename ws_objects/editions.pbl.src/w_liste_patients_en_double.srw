$PBExportHeader$w_liste_patients_en_double.srw
forward
global type w_liste_patients_en_double from w_liste_patients
end type
type uo_edition from uo_edition_rtf within w_liste_patients_en_double
end type
type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_en_double
end type
end forward

global type w_liste_patients_en_double from w_liste_patients
string title = "Liste des Patients saisis en Double"
uo_edition uo_edition
cb_lettres cb_lettres
end type
global w_liste_patients_en_double w_liste_patients_en_double

type variables

end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max
string dos_min, dos_max

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

	
	open(w_patience)
		
	dw_liste.retrieve( pra_min, pra_max, code_min,code_max)
	
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

end if


end subroutine

on w_liste_patients_en_double.create
int iCurrent
call super::create
this.uo_edition=create uo_edition
this.cb_lettres=create cb_lettres
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.uo_edition
this.Control[iCurrent+2]=this.cb_lettres
end on

on w_liste_patients_en_double.destroy
call super::destroy
destroy(this.uo_edition)
destroy(this.cb_lettres)
end on

event open;call super::open;
dw_liste.settransobject(SQLCA)


em_min.text = string(min)
em_max.text = "999999999"

end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_en_double
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_en_double
string text = "Liste"
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_en_double
end type

event cb_autre::clicked;call super::clicked;cb_lettres.enabled = false
cb_lien_word.enabled = false

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_en_double
integer x = 2665
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_en_double
end type

event cb_ecran::clicked;call super::clicked;cb_lettres.enabled = true
cb_lien_word.enabled = true


end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_en_double
integer x = 3131
end type

event cb_lien_word::clicked;int tab_type[1] = {lettre_patients_sans_rdv}

traitement_word(tab_type, dw_liste)
end event

type uo_size from w_liste_patients`uo_size within w_liste_patients_en_double
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_en_double
integer x = 439
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_en_double
integer x = 439
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_en_double
end type

type em_max from w_liste_patients`em_max within w_liste_patients_en_double
end type

type em_min from w_liste_patients`em_min within w_liste_patients_en_double
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_en_double
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_en_double
integer x = 274
integer width = 2272
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_en_double
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_en_double
end type

type st_min from w_liste_patients`st_min within w_liste_patients_en_double
end type

type st_max from w_liste_patients`st_max within w_liste_patients_en_double
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_en_double
integer x = 9
integer y = 20
string dataobject = "dw_liste_patients_saisis_en_double"
end type

type uo_edition from uo_edition_rtf within w_liste_patients_en_double
boolean visible = false
integer x = 1458
integer y = 72
integer taborder = 50
boolean bringtotop = true
end type

on uo_edition.destroy
call uo_edition_rtf::destroy
end on

type cb_lettres from uo_picturebutton_390x120 within w_liste_patients_en_double
boolean visible = false
integer x = 2199
integer y = 1868
integer width = 457
integer taborder = 120
boolean bringtotop = true
boolean enabled = false
string text = "Lettres"
string iconname = "ACTIONS_imprimer.png"
end type

