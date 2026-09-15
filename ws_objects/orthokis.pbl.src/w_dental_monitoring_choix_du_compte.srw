$PBExportHeader$w_dental_monitoring_choix_du_compte.srw
forward
global type w_dental_monitoring_choix_du_compte from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_dental_monitoring_choix_du_compte
end type
type lb_libelle from listbox within w_dental_monitoring_choix_du_compte
end type
end forward

global type w_dental_monitoring_choix_du_compte from w_fenetre_arakis
integer width = 1303
integer height = 1064
string title = "Choix du Cabinet Dental Monitoring"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
lb_libelle lb_libelle
end type
global w_dental_monitoring_choix_du_compte w_dental_monitoring_choix_du_compte

type variables


string v_code_praticien

lien_dental_monitoring v_lien_dental_monitoring
end variables

on w_dental_monitoring_choix_du_compte.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.lb_libelle=create lb_libelle
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.lb_libelle
end on

on w_dental_monitoring_choix_du_compte.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.lb_libelle)
end on

event open;call super::open;integer cpt, tot
string v_libelle

v_code_praticien = message.stringparm

v_lien_dental_monitoring = create lien_dental_monitoring

v_lien_dental_monitoring.visible = false

tot = v_lien_dental_monitoring.get_nb_compte(v_code_praticien)

for cpt = 1 to tot
	
	v_libelle = v_lien_dental_monitoring.get_libelle_praticien_dm(v_code_praticien, cpt)
	
	lb_libelle.additem(v_libelle)
	
next

lb_libelle.selectitem(1)

end event

type p_fond from w_fenetre_arakis`p_fond within w_dental_monitoring_choix_du_compte
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_dental_monitoring_choix_du_compte
integer x = 325
integer y = 724
integer width = 649
integer taborder = 10
boolean bringtotop = true
string text = "&Continuer"
end type

event clicked;



closewithreturn(parent, lb_libelle.SelectedIndex()    )
end event

type lb_libelle from listbox within w_dental_monitoring_choix_du_compte
integer x = 46
integer y = 24
integer width = 1202
integer height = 604
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean vscrollbar = true
boolean sorted = false
borderstyle borderstyle = stylelowered!
end type

