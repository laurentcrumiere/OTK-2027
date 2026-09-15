$PBExportHeader$w_tableau_bord_activite_mensu_rdv.srw
forward
global type w_tableau_bord_activite_mensu_rdv from w_liste_patients
end type
type st_1 from statictext within w_tableau_bord_activite_mensu_rdv
end type
type st_2 from statictext within w_tableau_bord_activite_mensu_rdv
end type
type em_annee1 from editmask within w_tableau_bord_activite_mensu_rdv
end type
type em_annee2 from editmask within w_tableau_bord_activite_mensu_rdv
end type
type st_3 from statictext within w_tableau_bord_activite_mensu_rdv
end type
type cb_exporter from uo_picturebutton_390x120 within w_tableau_bord_activite_mensu_rdv
end type
type dw_mois from datawindow within w_tableau_bord_activite_mensu_rdv
end type
end forward

global type w_tableau_bord_activite_mensu_rdv from w_liste_patients
string title = "Tableau de Bord - Activité Mensuelle - Analyse des Types de Rendez-vous"
st_1 st_1
st_2 st_2
em_annee1 em_annee1
em_annee2 em_annee2
st_3 st_3
cb_exporter cb_exporter
dw_mois dw_mois
end type
global w_tableau_bord_activite_mensu_rdv w_tableau_bord_activite_mensu_rdv

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max
long l_mois, annee1, annee2

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
	
	l_mois = integer(dw_mois.gettext())
	
	annee1 = long(em_annee1.text)
	annee2 = long(em_annee2.text)

	
	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max, l_mois, annee1, annee2)
	close(w_patience)


end if

end subroutine

on w_tableau_bord_activite_mensu_rdv.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.em_annee1=create em_annee1
this.em_annee2=create em_annee2
this.st_3=create st_3
this.cb_exporter=create cb_exporter
this.dw_mois=create dw_mois
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.em_annee1
this.Control[iCurrent+4]=this.em_annee2
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.cb_exporter
this.Control[iCurrent+7]=this.dw_mois
end on

on w_tableau_bord_activite_mensu_rdv.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.em_annee1)
destroy(this.em_annee2)
destroy(this.st_3)
destroy(this.cb_exporter)
destroy(this.dw_mois)
end on

event open;call super::open;

dw_mois.settransobject(sqlca)
dw_mois.retrieve()
dw_mois.scrolltorow(month(today()))

double v_max,v_min
SELECT max(numero_dossier),min(numero_dossier) INTO :v_max,:v_min FROM patient where code > 0 ;


em_min.text =  string(v_min)
em_max.text = string(v_max)


em_annee1.text = string(year(today()) - 1)
em_annee2.text = string(year(today() ))



end event

type p_fond from w_liste_patients`p_fond within w_tableau_bord_activite_mensu_rdv
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_tableau_bord_activite_mensu_rdv
integer x = 1760
end type

type cb_autre from w_liste_patients`cb_autre within w_tableau_bord_activite_mensu_rdv
integer x = 1280
end type

event cb_autre::clicked;call super::clicked;cb_exporter.enabled ( false)
end event

type cb_fermer from w_liste_patients`cb_fermer within w_tableau_bord_activite_mensu_rdv
integer x = 2720
end type

type cb_ecran from w_liste_patients`cb_ecran within w_tableau_bord_activite_mensu_rdv
end type

event cb_ecran::clicked;call super::clicked;

cb_exporter.enabled ( true )
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_tableau_bord_activite_mensu_rdv
end type

type uo_size from w_liste_patients`uo_size within w_tableau_bord_activite_mensu_rdv
end type

type rb_un from w_liste_patients`rb_un within w_tableau_bord_activite_mensu_rdv
end type

type rb_tous from w_liste_patients`rb_tous within w_tableau_bord_activite_mensu_rdv
end type

type em_nb from w_liste_patients`em_nb within w_tableau_bord_activite_mensu_rdv
end type

type em_max from w_liste_patients`em_max within w_tableau_bord_activite_mensu_rdv
end type

type em_min from w_liste_patients`em_min within w_tableau_bord_activite_mensu_rdv
end type

type dw_1 from w_liste_patients`dw_1 within w_tableau_bord_activite_mensu_rdv
end type

type gb_1 from w_liste_patients`gb_1 within w_tableau_bord_activite_mensu_rdv
end type

type dw_prati from w_liste_patients`dw_prati within w_tableau_bord_activite_mensu_rdv
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_tableau_bord_activite_mensu_rdv
end type

type st_min from w_liste_patients`st_min within w_tableau_bord_activite_mensu_rdv
end type

type st_max from w_liste_patients`st_max within w_tableau_bord_activite_mensu_rdv
end type

type dw_liste from w_liste_patients`dw_liste within w_tableau_bord_activite_mensu_rdv
string dataobject = "dw_tableau_bord_mensu_rdv"
end type

event dw_liste::clicked;//
end event

event dw_liste::rbuttondown;//
end event

event dw_liste::doubleclicked;

//
end event

type st_1 from statictext within w_tableau_bord_activite_mensu_rdv
integer x = 306
integer y = 964
integer width = 549
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Analyse du mois :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_tableau_bord_activite_mensu_rdv
integer x = 288
integer y = 1252
integer width = 699
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Comparer les années :"
boolean focusrectangle = false
end type

type em_annee1 from editmask within w_tableau_bord_activite_mensu_rdv
integer x = 992
integer y = 1224
integer width = 329
integer height = 112
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

type em_annee2 from editmask within w_tableau_bord_activite_mensu_rdv
integer x = 1490
integer y = 1224
integer width = 329
integer height = 112
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

type st_3 from statictext within w_tableau_bord_activite_mensu_rdv
integer x = 1349
integer y = 1248
integer width = 128
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "et"
boolean focusrectangle = false
end type

type cb_exporter from uo_picturebutton_390x120 within w_tableau_bord_activite_mensu_rdv
integer x = 2240
integer y = 1868
integer width = 457
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "E&xporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;

dw_liste.saveas()


end event

type dw_mois from datawindow within w_tableau_bord_activite_mensu_rdv
string tag = "no resizeall brush"
integer x = 841
integer y = 956
integer width = 846
integer height = 80
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_mois_cherche"
boolean border = false
boolean livescroll = true
end type

