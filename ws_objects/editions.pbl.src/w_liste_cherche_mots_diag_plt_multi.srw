$PBExportHeader$w_liste_cherche_mots_diag_plt_multi.srw
forward
global type w_liste_cherche_mots_diag_plt_multi from w_liste_patients
end type
type st_6 from statictext within w_liste_cherche_mots_diag_plt_multi
end type
type st_7 from statictext within w_liste_cherche_mots_diag_plt_multi
end type
type st_3 from statictext within w_liste_cherche_mots_diag_plt_multi
end type
type st_2 from statictext within w_liste_cherche_mots_diag_plt_multi
end type
type mle_traitement_effectue from multilineedit within w_liste_cherche_mots_diag_plt_multi
end type
type mle_plan_traitement from multilineedit within w_liste_cherche_mots_diag_plt_multi
end type
type uo_filtre_email from uo_filtre_emails within w_liste_cherche_mots_diag_plt_multi
end type
type st_1 from statictext within w_liste_cherche_mots_diag_plt_multi
end type
type mle_diag_alveolaire from multilineedit within w_liste_cherche_mots_diag_plt_multi
end type
type st_4 from statictext within w_liste_cherche_mots_diag_plt_multi
end type
type mle_diag_dentaire from multilineedit within w_liste_cherche_mots_diag_plt_multi
end type
type mle_plan_complement from multilineedit within w_liste_cherche_mots_diag_plt_multi
end type
type mle_diag_fonctionnel from multilineedit within w_liste_cherche_mots_diag_plt_multi
end type
type st_5 from statictext within w_liste_cherche_mots_diag_plt_multi
end type
type st_8 from statictext within w_liste_cherche_mots_diag_plt_multi
end type
end forward

global type w_liste_cherche_mots_diag_plt_multi from w_liste_patients
integer width = 4306
integer height = 2268
string title = "Liste des patients selon Diagnostic / Plan de Traitement"
st_6 st_6
st_7 st_7
st_3 st_3
st_2 st_2
mle_traitement_effectue mle_traitement_effectue
mle_plan_traitement mle_plan_traitement
uo_filtre_email uo_filtre_email
st_1 st_1
mle_diag_alveolaire mle_diag_alveolaire
st_4 st_4
mle_diag_dentaire mle_diag_dentaire
mle_plan_complement mle_plan_complement
mle_diag_fonctionnel mle_diag_fonctionnel
st_5 st_5
st_8 st_8
end type
global w_liste_cherche_mots_diag_plt_multi w_liste_cherche_mots_diag_plt_multi

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max

string v_traitement_effectue, v_diag_alveolaire, v_diag_dentaire
string v_plan_traitement, v_plan_complement, v_diag_fonctionnel, v_titre

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

	
	
	v_traitement_effectue = mle_traitement_effectue.text
	v_diag_alveolaire = mle_diag_alveolaire.text
	v_diag_dentaire = mle_diag_dentaire.text
	v_plan_traitement = mle_plan_traitement.text
	v_plan_complement = mle_plan_complement.text
	v_diag_fonctionnel = mle_diag_fonctionnel.text


	//lance la recherche
	open(w_patience)
	
	// Sécurisation 
	update patient set traitement_effectue_html = '' where traitement_effectue_html is null ;
	update patient set diag_alveolaire_html = '' where diag_alveolaire_html is null ;
	update patient set diag_dentaire_html = '' where diag_dentaire_html is null ;
	update patient set diag_fonctionnel_html = '' where diag_fonctionnel_html is null ;
	update patient set plan_traitement_html = '' where plan_traitement_html is null ;
	update patient set plan_complement_html = '' where plan_complement_html is null ;
	commit ;

	v_titre =  "Squel. = "+v_traitement_effectue+" - Alvéo. = "+v_diag_alveolaire+" - Dent. = "+v_diag_dentaire+" - Fonct. = "+v_diag_fonctionnel + " - Plan TT = "+v_plan_traitement+" - Compl. = "+v_plan_complement
	
	dw_liste.modify("titre_t.text = '"+ v_titre + "'" )
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,v_traitement_effectue, v_diag_alveolaire, v_diag_dentaire,v_plan_traitement, v_plan_complement, v_diag_fonctionnel)

	close(w_patience)
	
	
	
	//maj IU
	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
end if

end subroutine

on w_liste_cherche_mots_diag_plt_multi.create
int iCurrent
call super::create
this.st_6=create st_6
this.st_7=create st_7
this.st_3=create st_3
this.st_2=create st_2
this.mle_traitement_effectue=create mle_traitement_effectue
this.mle_plan_traitement=create mle_plan_traitement
this.uo_filtre_email=create uo_filtre_email
this.st_1=create st_1
this.mle_diag_alveolaire=create mle_diag_alveolaire
this.st_4=create st_4
this.mle_diag_dentaire=create mle_diag_dentaire
this.mle_plan_complement=create mle_plan_complement
this.mle_diag_fonctionnel=create mle_diag_fonctionnel
this.st_5=create st_5
this.st_8=create st_8
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_6
this.Control[iCurrent+2]=this.st_7
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_2
this.Control[iCurrent+5]=this.mle_traitement_effectue
this.Control[iCurrent+6]=this.mle_plan_traitement
this.Control[iCurrent+7]=this.uo_filtre_email
this.Control[iCurrent+8]=this.st_1
this.Control[iCurrent+9]=this.mle_diag_alveolaire
this.Control[iCurrent+10]=this.st_4
this.Control[iCurrent+11]=this.mle_diag_dentaire
this.Control[iCurrent+12]=this.mle_plan_complement
this.Control[iCurrent+13]=this.mle_diag_fonctionnel
this.Control[iCurrent+14]=this.st_5
this.Control[iCurrent+15]=this.st_8
end on

on w_liste_cherche_mots_diag_plt_multi.destroy
call super::destroy
destroy(this.st_6)
destroy(this.st_7)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.mle_traitement_effectue)
destroy(this.mle_plan_traitement)
destroy(this.uo_filtre_email)
destroy(this.st_1)
destroy(this.mle_diag_alveolaire)
destroy(this.st_4)
destroy(this.mle_diag_dentaire)
destroy(this.mle_plan_complement)
destroy(this.mle_diag_fonctionnel)
destroy(this.st_5)
destroy(this.st_8)
end on

event open;call super::open;uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb
end event

type p_fond from w_liste_patients`p_fond within w_liste_cherche_mots_diag_plt_multi
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_cherche_mots_diag_plt_multi
integer x = 2405
integer y = 1996
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_cherche_mots_diag_plt_multi
integer x = 1920
integer y = 1996
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_cherche_mots_diag_plt_multi
integer x = 2889
integer y = 1996
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_cherche_mots_diag_plt_multi
integer x = 681
integer y = 1996
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_cherche_mots_diag_plt_multi
integer x = 3264
integer y = 1996
end type

type uo_size from w_liste_patients`uo_size within w_liste_cherche_mots_diag_plt_multi
end type

type rb_un from w_liste_patients`rb_un within w_liste_cherche_mots_diag_plt_multi
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_cherche_mots_diag_plt_multi
end type

type em_nb from w_liste_patients`em_nb within w_liste_cherche_mots_diag_plt_multi
integer x = 151
integer y = 2020
end type

type em_max from w_liste_patients`em_max within w_liste_cherche_mots_diag_plt_multi
end type

type em_min from w_liste_patients`em_min within w_liste_cherche_mots_diag_plt_multi
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_cherche_mots_diag_plt_multi
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_cherche_mots_diag_plt_multi
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_cherche_mots_diag_plt_multi
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_cherche_mots_diag_plt_multi
end type

type st_min from w_liste_patients`st_min within w_liste_cherche_mots_diag_plt_multi
end type

type st_max from w_liste_patients`st_max within w_liste_cherche_mots_diag_plt_multi
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_cherche_mots_diag_plt_multi
integer width = 4206
integer height = 1952
string dataobject = "dw_liste_cherche_mots_diag_plt_multi"
end type

type st_6 from statictext within w_liste_cherche_mots_diag_plt_multi
integer x = 347
integer y = 1728
integer width = 3803
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
alignment alignment = center!
end type

type st_7 from statictext within w_liste_cherche_mots_diag_plt_multi
integer x = 347
integer y = 1240
integer width = 3803
integer height = 64
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Vous pouvez utiliser le caractère % comme générique (y compris à la fin)"
alignment alignment = center!
end type

type st_3 from statictext within w_liste_cherche_mots_diag_plt_multi
integer x = 347
integer y = 820
integer width = 741
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Diagnostic Squelettique :"
end type

type st_2 from statictext within w_liste_cherche_mots_diag_plt_multi
integer x = 347
integer y = 1320
integer width = 800
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Plan de Traitement (DEP) :"
end type

type mle_traitement_effectue from multilineedit within w_liste_cherche_mots_diag_plt_multi
integer x = 347
integer y = 904
integer width = 1243
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

type mle_plan_traitement from multilineedit within w_liste_cherche_mots_diag_plt_multi
integer x = 347
integer y = 1396
integer width = 1243
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

type uo_filtre_email from uo_filtre_emails within w_liste_cherche_mots_diag_plt_multi
string tag = "no resize all"
integer x = 1166
integer y = 1980
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type st_1 from statictext within w_liste_cherche_mots_diag_plt_multi
integer x = 1627
integer y = 820
integer width = 741
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Diagnostic Alvéolaire :"
end type

type mle_diag_alveolaire from multilineedit within w_liste_cherche_mots_diag_plt_multi
integer x = 1627
integer y = 904
integer width = 1243
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

type st_4 from statictext within w_liste_cherche_mots_diag_plt_multi
integer x = 2907
integer y = 812
integer width = 741
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Diagnostic Dentaire :"
end type

type mle_diag_dentaire from multilineedit within w_liste_cherche_mots_diag_plt_multi
integer x = 2907
integer y = 904
integer width = 1243
integer height = 320
integer taborder = 100
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

type mle_plan_complement from multilineedit within w_liste_cherche_mots_diag_plt_multi
integer x = 1627
integer y = 1388
integer width = 1243
integer height = 320
integer taborder = 100
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

type mle_diag_fonctionnel from multilineedit within w_liste_cherche_mots_diag_plt_multi
integer x = 2907
integer y = 1388
integer width = 1243
integer height = 320
integer taborder = 110
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

type st_5 from statictext within w_liste_cherche_mots_diag_plt_multi
integer x = 1627
integer y = 1316
integer width = 1051
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Plan de Traitement (Complément) :"
end type

type st_8 from statictext within w_liste_cherche_mots_diag_plt_multi
integer x = 2907
integer y = 1312
integer width = 1051
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Diagnostic Fonctionnel / Autre :"
end type

