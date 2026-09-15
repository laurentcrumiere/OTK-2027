$PBExportHeader$w_liste_patients_auneau.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_liste_patients_auneau from w_liste_patients
end type
type pb_exporter from uo_picturebutton_390x120 within w_liste_patients_auneau
end type
type rb_un_dos from radiobutton within w_liste_patients_auneau
end type
type rb_tous_dos from radiobutton within w_liste_patients_auneau
end type
type dw_dossier from datawindow within w_liste_patients_auneau
end type
type gb_dos from groupbox within w_liste_patients_auneau
end type
end forward

global type w_liste_patients_auneau from w_liste_patients
string title = "Liste des Patients selon la date d~'accord"
pb_exporter pb_exporter
rb_un_dos rb_un_dos
rb_tous_dos rb_tous_dos
dw_dossier dw_dossier
gb_dos gb_dos
end type
global w_liste_patients_auneau w_liste_patients_auneau

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,soin
double code_min,code_max
string  doss_min, doss_max, v_lib_doss


// pour la mises à jour du soin suivant
double tot_lignes,cpt_lignes
double v_code



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

	string ls_titre

	ls_titre = "Du dossier N°" + string(code_min) + " au dossier N°" + string(code_max)
	
	if rb_tous_dos.checked then
		
		doss_max = "ZZZZZ"
		ls_titre = ls_titre + " - Tous les types de dossier"

	else
		doss_min = 	dw_dossier.getitemstring(dw_prati.getrow(),"code")
		doss_max = doss_min
		select nom into :v_lib_doss from dossier where code = :doss_min ; 
		ls_titre = ls_titre + " - Dossiers : " + v_lib_doss
	end if
	
	dw_liste.object.t_titre.text = ls_titre


	open(w_patience)
	dw_liste.retrieve(code_min ,code_max, doss_min, doss_max)
	

	close(w_patience)

	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	em_nb.visible = true

end if

end subroutine

on w_liste_patients_auneau.create
int iCurrent
call super::create
this.pb_exporter=create pb_exporter
this.rb_un_dos=create rb_un_dos
this.rb_tous_dos=create rb_tous_dos
this.dw_dossier=create dw_dossier
this.gb_dos=create gb_dos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_exporter
this.Control[iCurrent+2]=this.rb_un_dos
this.Control[iCurrent+3]=this.rb_tous_dos
this.Control[iCurrent+4]=this.dw_dossier
this.Control[iCurrent+5]=this.gb_dos
end on

on w_liste_patients_auneau.destroy
call super::destroy
destroy(this.pb_exporter)
destroy(this.rb_un_dos)
destroy(this.rb_tous_dos)
destroy(this.dw_dossier)
destroy(this.gb_dos)
end on

event open;call super::open;

dw_dossier.settransobject(sqlca)
dw_dossier.retrieve()

dw_prati.visible = false


end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_auneau
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_auneau
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_auneau
integer taborder = 130
end type

event cb_autre::clicked;call super::clicked;pb_exporter.enabled = false
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_auneau
integer x = 2665
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_auneau
integer taborder = 140
end type

event cb_ecran::clicked;call super::clicked;pb_exporter.enabled = true
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_auneau
integer x = 3131
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_auneau
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_auneau
boolean visible = false
boolean enabled = false
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_auneau
boolean visible = false
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_auneau
integer taborder = 60
end type

type em_max from w_liste_patients`em_max within w_liste_patients_auneau
integer y = 528
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_auneau
integer y = 528
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_auneau
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_auneau
boolean visible = false
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_auneau
integer taborder = 100
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_auneau
end type

type st_min from w_liste_patients`st_min within w_liste_patients_auneau
integer y = 540
end type

type st_max from w_liste_patients`st_max within w_liste_patients_auneau
integer y = 540
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_auneau
integer taborder = 90
string dataobject = "dw_liste_patients_auneau"
end type

type pb_exporter from uo_picturebutton_390x120 within w_liste_patients_auneau
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

type rb_un_dos from radiobutton within w_liste_patients_auneau
integer x = 480
integer y = 996
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

type rb_tous_dos from radiobutton within w_liste_patients_auneau
integer x = 480
integer y = 900
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

type dw_dossier from datawindow within w_liste_patients_auneau
string tag = "position brush"
boolean visible = false
integer x = 1335
integer y = 1000
integer width = 951
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type gb_dos from groupbox within w_liste_patients_auneau
integer x = 315
integer y = 820
integer width = 2121
integer height = 304
integer taborder = 40
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

