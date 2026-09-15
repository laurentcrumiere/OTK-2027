$PBExportHeader$w_graph_age_praticiens.srw
forward
global type w_graph_age_praticiens from w_graph_dossiers_praticiens
end type
type rb_tous_dos from radiobutton within w_graph_age_praticiens
end type
type rb_un_dos from radiobutton within w_graph_age_praticiens
end type
type dw_dossier from datawindow within w_graph_age_praticiens
end type
type gb_dos from groupbox within w_graph_age_praticiens
end type
end forward

global type w_graph_age_praticiens from w_graph_dossiers_praticiens
string title = "Analyse selon l~'Age "
rb_tous_dos rb_tous_dos
rb_un_dos rb_un_dos
dw_dossier dw_dossier
gb_dos gb_dos
end type
global w_graph_age_praticiens w_graph_age_praticiens

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,pra_nom
double code_min,code_max
string dos_min, dos_max

//if not prepa_faite then
//	prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)


	if rb_tous_dos.checked then
		dos_min="  "
		dos_max="ZZ"
	else
		dos_min =dw_dossier.getitemstring(dw_dossier.getrow(),"code")
		dos_max = dos_min
	end if

	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,dos_min, dos_max)
	dw_tableau.retrieve(code_min,code_max,pra_min,pra_max,dos_min, dos_max)
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true

//end if

end subroutine

on w_graph_age_praticiens.create
int iCurrent
call super::create
this.rb_tous_dos=create rb_tous_dos
this.rb_un_dos=create rb_un_dos
this.dw_dossier=create dw_dossier
this.gb_dos=create gb_dos
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_tous_dos
this.Control[iCurrent+2]=this.rb_un_dos
this.Control[iCurrent+3]=this.dw_dossier
this.Control[iCurrent+4]=this.gb_dos
end on

on w_graph_age_praticiens.destroy
call super::destroy
destroy(this.rb_tous_dos)
destroy(this.rb_un_dos)
destroy(this.dw_dossier)
destroy(this.gb_dos)
end on

event open;call super::open;dw_dossier.settransobject(sqlca)
dw_dossier.retrieve()
end event

type p_fond from w_graph_dossiers_praticiens`p_fond within w_graph_age_praticiens
end type

type cb_imprimer from w_graph_dossiers_praticiens`cb_imprimer within w_graph_age_praticiens
integer x = 2725
end type

type cb_autre from w_graph_dossiers_praticiens`cb_autre within w_graph_age_praticiens
integer x = 2235
end type

event cb_autre::clicked;call super::clicked;

st_2.visible = false


end event

type cb_fermer from w_graph_dossiers_praticiens`cb_fermer within w_graph_age_praticiens
end type

type cb_ecran from w_graph_dossiers_praticiens`cb_ecran within w_graph_age_praticiens
integer x = 768
string iconname = "Custom073_2!"
end type

type cb_lien_word from w_graph_dossiers_praticiens`cb_lien_word within w_graph_age_praticiens
end type

type uo_size from w_graph_dossiers_praticiens`uo_size within w_graph_age_praticiens
end type

type rb_un from w_graph_dossiers_praticiens`rb_un within w_graph_age_praticiens
end type

type rb_tous from w_graph_dossiers_praticiens`rb_tous within w_graph_age_praticiens
end type

type em_nb from w_graph_dossiers_praticiens`em_nb within w_graph_age_praticiens
end type

type em_max from w_graph_dossiers_praticiens`em_max within w_graph_age_praticiens
end type

type em_min from w_graph_dossiers_praticiens`em_min within w_graph_age_praticiens
end type

type dw_1 from w_graph_dossiers_praticiens`dw_1 within w_graph_age_praticiens
end type

type gb_1 from w_graph_dossiers_praticiens`gb_1 within w_graph_age_praticiens
end type

type dw_prati from w_graph_dossiers_praticiens`dw_prati within w_graph_age_praticiens
end type

type cbx_filtre from w_graph_dossiers_praticiens`cbx_filtre within w_graph_age_praticiens
end type

type st_min from w_graph_dossiers_praticiens`st_min within w_graph_age_praticiens
end type

type st_max from w_graph_dossiers_praticiens`st_max within w_graph_age_praticiens
end type

type dw_liste from w_graph_dossiers_praticiens`dw_liste within w_graph_age_praticiens
string dataobject = "dw_graph_ages_praticiens"
end type

type em_date1 from w_graph_dossiers_praticiens`em_date1 within w_graph_age_praticiens
boolean visible = false
end type

type st_2 from w_graph_dossiers_praticiens`st_2 within w_graph_age_praticiens
boolean visible = false
end type

type dw_tableau from w_graph_dossiers_praticiens`dw_tableau within w_graph_age_praticiens
string dataobject = "dw_tableau_ages"
end type

type cb_tableau from w_graph_dossiers_praticiens`cb_tableau within w_graph_age_praticiens
integer x = 1257
end type

type cb_exporter from w_graph_dossiers_praticiens`cb_exporter within w_graph_age_praticiens
integer x = 1746
end type

type rb_tous_dos from radiobutton within w_graph_age_praticiens
integer x = 480
integer y = 1028
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
end type

event clicked;dw_dossier.visible = false
end event

type rb_un_dos from radiobutton within w_graph_age_praticiens
integer x = 480
integer y = 1124
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
boolean checked = true
end type

event clicked;dw_dossier.visible = true
end event

type dw_dossier from datawindow within w_graph_age_praticiens
string tag = "position"
integer x = 1239
integer y = 1124
integer width = 942
integer height = 80
integer taborder = 70
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type gb_dos from groupbox within w_graph_age_praticiens
integer x = 315
integer y = 936
integer width = 2121
integer height = 304
integer taborder = 41
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

