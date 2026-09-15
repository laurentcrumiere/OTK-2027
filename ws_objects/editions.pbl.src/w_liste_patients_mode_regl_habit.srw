$PBExportHeader$w_liste_patients_mode_regl_habit.srw
forward
global type w_liste_patients_mode_regl_habit from w_liste_patients
end type
type rb_mode_tous from radiobutton within w_liste_patients_mode_regl_habit
end type
type rb_mode_un from radiobutton within w_liste_patients_mode_regl_habit
end type
type rb_banque_toutes from radiobutton within w_liste_patients_mode_regl_habit
end type
type rb_banque_une from radiobutton within w_liste_patients_mode_regl_habit
end type
type dw_type_regl from datawindow within w_liste_patients_mode_regl_habit
end type
type dw_banque from datawindow within w_liste_patients_mode_regl_habit
end type
type uo_filtre_email from uo_filtre_emails within w_liste_patients_mode_regl_habit
end type
type cbx_alerte from checkbox within w_liste_patients_mode_regl_habit
end type
type em_date_alerte from uo_date_calendrier within w_liste_patients_mode_regl_habit
end type
type gb_mode from gb_1 within w_liste_patients_mode_regl_habit
end type
type gb_banque from gb_1 within w_liste_patients_mode_regl_habit
end type
end forward

global type w_liste_patients_mode_regl_habit from w_liste_patients
integer width = 3648
string title = "Liste des Patients selon leur Mode de Règlement habituel"
rb_mode_tous rb_mode_tous
rb_mode_un rb_mode_un
rb_banque_toutes rb_banque_toutes
rb_banque_une rb_banque_une
dw_type_regl dw_type_regl
dw_banque dw_banque
uo_filtre_email uo_filtre_email
cbx_alerte cbx_alerte
em_date_alerte em_date_alerte
gb_mode gb_mode
gb_banque gb_banque
end type
global w_liste_patients_mode_regl_habit w_liste_patients_mode_regl_habit

type variables
string sel
end variables

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max, titre
string clausew,clauseo
double code_min,code_max

string v_mode_min, v_mode_max
string v_banque_min, v_banque_max

date v_date_alerte

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		titre = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		titre = "Pour le Dr "+dw_prati.getitemstring(dw_prati.getrow(),"nom")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)
	
	if rb_mode_un.checked then 
		v_mode_min = dw_type_regl.gettext()
		v_mode_max = v_mode_min
		string lib_mode
		select isnull(nom,'') into :lib_mode from mode_reglement where code = :v_mode_min ;
		titre = titre + " - Mode : " + lib_mode
		
	else
		v_mode_min = ""
		v_mode_max = "Z"
	end if
	
	if rb_banque_une.checked then 
		v_banque_min = dw_banque.gettext()
		v_banque_max = v_banque_min
		titre = titre + " - Banque : " + dw_banque.GetItemString(dw_banque.getrow(), "ident")
	else
		v_banque_min = ""
		v_banque_max = "Z"
	end if
	
	if cbx_alerte.checked then
		dw_liste.object.alerte_echeance.visible = 1
	else
		dw_liste.object.alerte_echeance.visible = 0
	end if
	
	v_date_alerte = date(em_date_alerte.text)

	open(w_patience)
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max, v_mode_min, v_mode_max, v_banque_min, v_banque_max, v_date_alerte)
	dw_liste.Modify('sous_titre.text = "'+ titre +'"')
	close(w_patience)
	
	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
end if

end subroutine

on w_liste_patients_mode_regl_habit.create
int iCurrent
call super::create
this.rb_mode_tous=create rb_mode_tous
this.rb_mode_un=create rb_mode_un
this.rb_banque_toutes=create rb_banque_toutes
this.rb_banque_une=create rb_banque_une
this.dw_type_regl=create dw_type_regl
this.dw_banque=create dw_banque
this.uo_filtre_email=create uo_filtre_email
this.cbx_alerte=create cbx_alerte
this.em_date_alerte=create em_date_alerte
this.gb_mode=create gb_mode
this.gb_banque=create gb_banque
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_mode_tous
this.Control[iCurrent+2]=this.rb_mode_un
this.Control[iCurrent+3]=this.rb_banque_toutes
this.Control[iCurrent+4]=this.rb_banque_une
this.Control[iCurrent+5]=this.dw_type_regl
this.Control[iCurrent+6]=this.dw_banque
this.Control[iCurrent+7]=this.uo_filtre_email
this.Control[iCurrent+8]=this.cbx_alerte
this.Control[iCurrent+9]=this.em_date_alerte
this.Control[iCurrent+10]=this.gb_mode
this.Control[iCurrent+11]=this.gb_banque
end on

on w_liste_patients_mode_regl_habit.destroy
call super::destroy
destroy(this.rb_mode_tous)
destroy(this.rb_mode_un)
destroy(this.rb_banque_toutes)
destroy(this.rb_banque_une)
destroy(this.dw_type_regl)
destroy(this.dw_banque)
destroy(this.uo_filtre_email)
destroy(this.cbx_alerte)
destroy(this.em_date_alerte)
destroy(this.gb_mode)
destroy(this.gb_banque)
end on

event open;call super::open;

dw_type_regl.settransobject(sqlca)
dw_type_regl.retrieve()
dw_banque.settransobject(sqlca)
dw_banque.retrieve()

// Par défaut sur mode prélèvement si on est en France
if France then 

	// Si prelèvement est bien actif 
	integer nb
	select isnull(count(*) ,0) into :nb from mode_reglement where "code" = 'R' and actif = 1 ;
	if nb > 0 then
		dw_type_regl.setitem(1,"code",'R')
	end if
end if

uo_filtre_email.dw_liste = dw_liste
uo_filtre_email.em_statut_mere = em_nb

em_date_alerte.setDate(today())
cbx_alerte.backcolor = backcolor




end event

event resize;call super::resize;

// POur par que la date aille trop à droite
//cbx_alerte.width = 2455
em_date_alerte.x = cbx_alerte.x + cbx_alerte.width + 10
end event

type p_fond from w_liste_patients`p_fond within w_liste_patients_mode_regl_habit
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_mode_regl_habit
integer x = 2217
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_mode_regl_habit
integer x = 1737
end type

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_mode_regl_habit
integer x = 2697
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_mode_regl_habit
integer x = 507
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_mode_regl_habit
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_mode_regl_habit
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_mode_regl_habit
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_mode_regl_habit
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_mode_regl_habit
end type

type em_max from w_liste_patients`em_max within w_liste_patients_mode_regl_habit
end type

type em_min from w_liste_patients`em_min within w_liste_patients_mode_regl_habit
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_mode_regl_habit
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_mode_regl_habit
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_mode_regl_habit
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_mode_regl_habit
end type

type st_min from w_liste_patients`st_min within w_liste_patients_mode_regl_habit
end type

type st_max from w_liste_patients`st_max within w_liste_patients_mode_regl_habit
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_mode_regl_habit
integer x = 14
integer width = 3561
string dataobject = "dw_liste_patients_mode_reglement_habit_edition"
end type

type rb_mode_tous from radiobutton within w_liste_patients_mode_regl_habit
integer x = 288
integer y = 1108
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
end type

event clicked;dw_type_regl.visible = false
end event

type rb_mode_un from radiobutton within w_liste_patients_mode_regl_habit
integer x = 297
integer y = 1236
integer width = 224
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
string text = "Un"
boolean checked = true
end type

event clicked;dw_type_regl.visible = true
end event

type rb_banque_toutes from radiobutton within w_liste_patients_mode_regl_habit
integer x = 1829
integer y = 1096
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
string text = "Toutes"
boolean checked = true
end type

event clicked;dw_banque.visible = false

end event

type rb_banque_une from radiobutton within w_liste_patients_mode_regl_habit
integer x = 1838
integer y = 1252
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
string text = "Une"
end type

event clicked;
dw_banque.visible = true
end event

type dw_type_regl from datawindow within w_liste_patients_mode_regl_habit
string tag = "position brush"
integer x = 549
integer y = 1252
integer width = 873
integer height = 64
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_type_regl_ddlb"
boolean border = false
boolean livescroll = true
end type

type dw_banque from datawindow within w_liste_patients_mode_regl_habit
string tag = "no resizeall"
boolean visible = false
integer x = 2066
integer y = 1260
integer width = 1266
integer height = 76
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_banque"
boolean border = false
boolean livescroll = true
end type

type uo_filtre_email from uo_filtre_emails within w_liste_patients_mode_regl_habit
string tag = "no resize all"
integer x = 987
integer y = 1852
integer taborder = 200
boolean bringtotop = true
end type

on uo_filtre_email.destroy
call uo_filtre_emails::destroy
end on

type cbx_alerte from checkbox within w_liste_patients_mode_regl_habit
string tag = "no resize all"
integer x = 192
integer y = 1552
integer width = 2455
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Mettre une alerte si le patient n~'a plus de règlement prévu (échéance) à partir du "
end type

type em_date_alerte from uo_date_calendrier within w_liste_patients_mode_regl_habit
integer x = 2661
integer y = 1544
integer taborder = 300
boolean bringtotop = true
end type

on em_date_alerte.destroy
call uo_date_calendrier::destroy
end on

type gb_mode from gb_1 within w_liste_patients_mode_regl_habit
integer x = 183
integer y = 992
integer width = 1403
integer height = 412
integer taborder = 60
string text = "Mode de Règlement"
end type

type gb_banque from gb_1 within w_liste_patients_mode_regl_habit
integer x = 1755
integer y = 992
integer width = 1742
integer height = 412
integer taborder = 70
string text = "Banque"
end type

