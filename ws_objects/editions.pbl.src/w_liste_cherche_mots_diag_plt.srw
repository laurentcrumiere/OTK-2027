$PBExportHeader$w_liste_cherche_mots_diag_plt.srw
forward
global type w_liste_cherche_mots_diag_plt from w_liste_patients
end type
type st_6 from statictext within w_liste_cherche_mots_diag_plt
end type
type st_7 from statictext within w_liste_cherche_mots_diag_plt
end type
type st_3 from statictext within w_liste_cherche_mots_diag_plt
end type
type st_2 from statictext within w_liste_cherche_mots_diag_plt
end type
type sle_diag from multilineedit within w_liste_cherche_mots_diag_plt
end type
type sle_plt from multilineedit within w_liste_cherche_mots_diag_plt
end type
type uo_filtre_email from uo_filtre_emails within w_liste_cherche_mots_diag_plt
end type
end forward

global type w_liste_cherche_mots_diag_plt from w_liste_patients
string title = "Liste des patients selon Diagnostic / Plan de Traitement"
st_6 st_6
st_7 st_7
st_3 st_3
st_2 st_2
sle_diag sle_diag
sle_plt sle_plt
uo_filtre_email uo_filtre_email
end type
global w_liste_cherche_mots_diag_plt w_liste_cherche_mots_diag_plt

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,var_diag,var_plt
double code_min,code_max

if not prepa_faite then
	//prepa_faite = true
	//récupère les données
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if
	code_min = double(em_min.text)
	code_max = double(em_max.text)
	var_diag = sle_diag.text
	var_plt = sle_plt.text
	
	//lance la recherche
	open(w_patience)
	
	dw_liste.modify("titre_t.text = 'Diagnostic = "+var_diag+" - Plan de Traitement = "+var_plt+"'")
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,var_diag,var_plt)
	close(w_patience)
	
	
	
	//maj IU
	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
end if

end subroutine

on w_liste_cherche_mots_diag_plt.create
int iCurrent
call super::create
this.st_6=create st_6
this.st_7=create st_7
this.st_3=create st_3
this.st_2=create st_2
this.sle_diag=create sle_diag
this.sle_plt=create sle_plt
this.uo_filtre_email=create uo_filtre_email
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_6
this.Control[iCurrent+2]=this.st_7
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.sle_diag
this.Control[iCurrent+6]=this.sle_plt
this.Control[iCurrent+7]=this.uo_filtre_email
end on

on w_liste_cherche_mots_diag_plt.destroy
call super::destroy
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.sle_diag)
destroy(this.sle_plt)
destroy(this.uo_filtre_email)
end on

event open;call super::open;uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb
end event

type p_fond from w_liste_patients`p_fond within w_liste_cherche_mots_diag_plt
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_cherche_mots_diag_plt
integer x = 2199
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_cherche_mots_diag_plt
integer x = 1728
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_cherche_mots_diag_plt
integer x = 2670
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_cherche_mots_diag_plt
integer x = 517
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_cherche_mots_diag_plt
end type

type uo_size from w_liste_patients`uo_size within w_liste_cherche_mots_diag_plt
end type

type rb_un from w_liste_patients`rb_un within w_liste_cherche_mots_diag_plt
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_cherche_mots_diag_plt
end type

type em_nb from w_liste_patients`em_nb within w_liste_cherche_mots_diag_plt
end type

type em_max from w_liste_patients`em_max within w_liste_cherche_mots_diag_plt
end type

type em_min from w_liste_patients`em_min within w_liste_cherche_mots_diag_plt
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_cherche_mots_diag_plt
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_cherche_mots_diag_plt
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_cherche_mots_diag_plt
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_cherche_mots_diag_plt
end type

type st_min from w_liste_patients`st_min within w_liste_cherche_mots_diag_plt
end type

type st_max from w_liste_patients`st_max within w_liste_cherche_mots_diag_plt
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_cherche_mots_diag_plt
string dataobject = "dw_liste_cherche_mots_diag_plt"
end type

type st_6 from statictext within w_liste_cherche_mots_diag_plt
integer x = 471
integer y = 1728
integer width = 1659
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type st_7 from statictext within w_liste_cherche_mots_diag_plt
integer x = 471
integer y = 1240
integer width = 1659
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
end type

type st_3 from statictext within w_liste_cherche_mots_diag_plt
integer x = 347
integer y = 820
integer width = 512
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Zone Diagnostic :"
end type

type st_2 from statictext within w_liste_cherche_mots_diag_plt
integer x = 347
integer y = 1320
integer width = 768
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Zone Plan de Traitement :"
end type

type sle_diag from multilineedit within w_liste_cherche_mots_diag_plt
integer x = 471
integer y = 904
integer width = 2597
integer height = 320
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "%"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type sle_plt from multilineedit within w_liste_cherche_mots_diag_plt
integer x = 471
integer y = 1388
integer width = 2597
integer height = 320
integer taborder = 90
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "%"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type uo_filtre_email from uo_filtre_emails within w_liste_cherche_mots_diag_plt
string tag = "no resize all"
integer x = 987
integer y = 1852
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

