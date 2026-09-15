$PBExportHeader$w_liste_historique_appels.srw
forward
global type w_liste_historique_appels from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_historique_appels
end type
type cb_imprimer from uo_picturebutton_390x120 within w_liste_historique_appels
end type
type cb_autre from uo_picturebutton_390x120 within w_liste_historique_appels
end type
type cb_ecran from uo_picturebutton_390x120 within w_liste_historique_appels
end type
type uo_1 from resize_fenetre within w_liste_historique_appels
end type
type em_nb from editmask within w_liste_historique_appels
end type
type st_1 from statictext within w_liste_historique_appels
end type
type em_min from editmask within w_liste_historique_appels
end type
type st_2 from statictext within w_liste_historique_appels
end type
type em_max from editmask within w_liste_historique_appels
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_historique_appels
end type
type rb_tous from radiobutton within w_liste_historique_appels
end type
type rb_un from radiobutton within w_liste_historique_appels
end type
type sle_patient from singlelineedit within w_liste_historique_appels
end type
type cbx_filtre from u_cst_togglebutton within w_liste_historique_appels
end type
type gb_4 from groupbox within w_liste_historique_appels
end type
type gb_1 from groupbox within w_liste_historique_appels
end type
type dw_liste from u_basedw within w_liste_historique_appels
end type
end forward

global type w_liste_historique_appels from w_fenetre_arakis
integer x = 27
integer y = 200
integer width = 4242
integer height = 2296
string title = "Historique des Appels Entrants"
windowtype windowtype = child!
long backcolor = 15780518
cb_fermer cb_fermer
cb_imprimer cb_imprimer
cb_autre cb_autre
cb_ecran cb_ecran
uo_1 uo_1
em_nb em_nb
st_1 st_1
em_min em_min
st_2 st_2
em_max em_max
cb_exporter cb_exporter
rb_tous rb_tous
rb_un rb_un
sle_patient sle_patient
cbx_filtre cbx_filtre
gb_4 gb_4
gb_1 gb_1
dw_liste dw_liste
end type
global w_liste_historique_appels w_liste_historique_appels

type variables
boolean prepa_faite
double nb_dossier,increment,var_code_local





n_cst_PowerFilter iu_PowerFilter


end variables

forward prototypes
public subroutine prepa ()
public subroutine ajout_filtre (ref string filtre, string tel)
end prototypes

public subroutine prepa ();string tit1

datetime da_min,da_max

if not prepa_faite then
	//prepa_faite = true

	
	da_min = datetime(date(left(em_min.text,10)),time(right(em_min.text,5)))
	da_max = datetime(date(left(em_max.text,10)),time(right(em_max.text,5)))

	tit1 = "Du "+em_min.text+" au "+em_max.text
	
	double max_row
	SELECT count(*) INTO :max_row FROM historique_editions ;

	increment = integer(max_row / 10)

	open(w_patience)
	
	dw_liste.object.Titre1.text = tit1

	dw_liste.retrieve(da_min, da_max )
	
	string v_filtre = ""

	if rb_un.checked then
		// filtre sur les N° de téléphone du patient
		string t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19 

		  
		  SELECT trim(isnull("patient"."teldom_parent1",'')),   
				trim(isnull("patient"."teltra_parent1",'')),    
				 trim(isnull("patient"."teldom_parent2",'')),    
				 trim(isnull("patient"."teltra_parent2",'')),    
				trim(isnull( "patient"."teldom_payeur",'')),    
				trim(isnull( "patient"."teltra_payeur",'')),    
				trim(isnull( "patient"."portable",'')),    
				trim(isnull( "patient"."portable_patient",'')),    
				trim(isnull( "patient"."teldom2_parent1",'')),    
				 trim(isnull("patient"."teltra2_parent1",'')),    
				trim(isnull( "patient"."portable2_parent1", '')),   
				trim(isnull( "patient"."teldom2_parent2", '')),   
			  trim(isnull(  "patient"."teltra2_parent2", '')),   
			  trim(isnull(  "patient"."portable1_parent2", '')),   
				trim(isnull( "patient"."portable2_parent2",'')),    
			  trim(isnull( "patient"."teldom2_payeur",'')),    
			  trim(isnull( "patient"."teltra2_payeur",'')),    
			 trim(isnull(  "patient"."portable1_payeur", '')),   
			  trim(isnull("patient"."portable2_payeur", '')) 
		 INTO :t1,  				:t2,   				:t3,   				:t4,   				:t5,   				:t6,   				:t7,   				:t8,   
				:t9,   				:t10,   				:t11,   				:t12,   				:t13,   				:t14,   				:t15,   
				:t16,   				:t17,   				:t18,   				:t19  
		 FROM "patient"  
		WHERE "patient"."code" = :var_code_local   ;
	
	
		// contruction du filtre
		ajout_filtre (v_filtre, t1)
		ajout_filtre (v_filtre, t2)
		ajout_filtre (v_filtre, t3)
		ajout_filtre (v_filtre, t4)
		ajout_filtre (v_filtre, t5)
		ajout_filtre (v_filtre, t6)
		ajout_filtre (v_filtre, t7)
		ajout_filtre (v_filtre, t8)
		ajout_filtre (v_filtre, t9)
		ajout_filtre (v_filtre, t10)
		ajout_filtre (v_filtre, t11)
		ajout_filtre (v_filtre, t12)
		ajout_filtre (v_filtre, t13)
		ajout_filtre (v_filtre, t14)
		ajout_filtre (v_filtre, t15)
		ajout_filtre (v_filtre, t16)
		ajout_filtre (v_filtre, t17)
		ajout_filtre (v_filtre, t18)
		ajout_filtre (v_filtre, t19)
		
		if v_filtre = "" then
			Messagebox ("ATTENTION", "Ce patient n'a pas de numéro de téléphone dans son dossier.~n~nTous les appels sont listés.")
		end if
	
	

	end if
	
	// application du filtre, plein ou vide
	dw_liste.setfilter(v_filtre)
	dw_liste.filter()
	close(w_patience)

	cbx_filtre.visible = true
	
	//em_nb.text = string(dw_liste.rowcount())+" Appels"
	//em_nb.visible = true
end if

end subroutine

public subroutine ajout_filtre (ref string filtre, string tel);// Ajoute un numero dans le filtre

if tel <> "" then 
	if filtre <> "" then
		filtre = filtre + " or " 
	end if
	
	filtre = filtre + "trim(numero) = '" + tel + "'"
end if

end subroutine

event open;call super::open;
dw_liste.settransobject(SQLCA)
em_min.text = string(today())
em_max.text = string(datetime(today(),now()))

uo_1.taille(this)

cbx_filtre.backcolor = this.backcolor
end event

on w_liste_historique_appels.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cb_imprimer=create cb_imprimer
this.cb_autre=create cb_autre
this.cb_ecran=create cb_ecran
this.uo_1=create uo_1
this.em_nb=create em_nb
this.st_1=create st_1
this.em_min=create em_min
this.st_2=create st_2
this.em_max=create em_max
this.cb_exporter=create cb_exporter
this.rb_tous=create rb_tous
this.rb_un=create rb_un
this.sle_patient=create sle_patient
this.cbx_filtre=create cbx_filtre
this.gb_4=create gb_4
this.gb_1=create gb_1
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cb_imprimer
this.Control[iCurrent+3]=this.cb_autre
this.Control[iCurrent+4]=this.cb_ecran
this.Control[iCurrent+5]=this.uo_1
this.Control[iCurrent+6]=this.em_nb
this.Control[iCurrent+7]=this.st_1
this.Control[iCurrent+8]=this.em_min
this.Control[iCurrent+9]=this.st_2
this.Control[iCurrent+10]=this.em_max
this.Control[iCurrent+11]=this.cb_exporter
this.Control[iCurrent+12]=this.rb_tous
this.Control[iCurrent+13]=this.rb_un
this.Control[iCurrent+14]=this.sle_patient
this.Control[iCurrent+15]=this.cbx_filtre
this.Control[iCurrent+16]=this.gb_4
this.Control[iCurrent+17]=this.gb_1
this.Control[iCurrent+18]=this.dw_liste
end on

on w_liste_historique_appels.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cb_imprimer)
destroy(this.cb_autre)
destroy(this.cb_ecran)
destroy(this.uo_1)
destroy(this.em_nb)
destroy(this.st_1)
destroy(this.em_min)
destroy(this.st_2)
destroy(this.em_max)
destroy(this.cb_exporter)
destroy(this.rb_tous)
destroy(this.rb_un)
destroy(this.sle_patient)
destroy(this.cbx_filtre)
destroy(this.gb_4)
destroy(this.gb_1)
destroy(this.dw_liste)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_liste_historique_appels
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_historique_appels
integer x = 2866
integer y = 1996
integer width = 494
integer height = 152
integer taborder = 90
end type

event clicked;fermer_fenetre(parent)
end event

type cb_imprimer from uo_picturebutton_390x120 within w_liste_historique_appels
integer x = 1330
integer y = 1996
integer width = 494
integer height = 152
integer taborder = 80
boolean enabled = false
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()


end event

type cb_autre from uo_picturebutton_390x120 within w_liste_historique_appels
integer x = 2354
integer y = 1996
integer width = 494
integer height = 152
integer taborder = 80
boolean enabled = false
string text = "&Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;prepa_faite = false
em_nb.visible=false
cb_ecran.enabled (true)
cb_imprimer.enabled ( false)
this.enabled ( false)
dw_liste.visible = false
cbx_filtre.visible = false

end event

type cb_ecran from uo_picturebutton_390x120 within w_liste_historique_appels
integer x = 818
integer y = 1996
integer width = 494
integer height = 152
integer taborder = 60
string text = "&Ecran"
string iconname = "ACTIONS_ecran.png"
end type

event clicked;call super::clicked;prepa()
//cb_ecran.enabled (false)
cb_imprimer.enabled ( true )
cb_exporter.enabled ( true )
cb_autre.enabled ( true )
dw_liste.visible = true

end event

type uo_1 from resize_fenetre within w_liste_historique_appels
boolean visible = false
integer x = 2597
integer y = 144
integer taborder = 11
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type em_nb from editmask within w_liste_historique_appels
boolean visible = false
integer x = 55
integer y = 2020
integer width = 704
integer height = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 12632256
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "XXXXXXXXXXXXXXXXXXXX"
end type

type st_1 from statictext within w_liste_historique_appels
integer x = 800
integer y = 612
integer width = 101
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Du"
boolean focusrectangle = false
end type

type em_min from editmask within w_liste_historique_appels
integer x = 919
integer y = 600
integer width = 640
integer height = 100
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy à hh:mm"
boolean spin = true
string displaydata = "~b"
end type

type st_2 from statictext within w_liste_historique_appels
integer x = 1746
integer y = 612
integer width = 101
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Au"
boolean focusrectangle = false
end type

type em_max from editmask within w_liste_historique_appels
integer x = 1870
integer y = 600
integer width = 640
integer height = 100
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datetimemask!
string mask = "dd/mm/yyyy à hh:mm"
boolean spin = true
string displaydata = "|"
end type

type cb_exporter from uo_picturebutton_390x120 within w_liste_historique_appels
integer x = 1842
integer y = 1996
integer width = 494
integer height = 152
integer taborder = 90
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveas()
end event

type rb_tous from radiobutton within w_liste_historique_appels
integer x = 622
integer y = 1080
integer width = 297
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous"
boolean checked = true
end type

event clicked;
sle_patient.visible = false
end event

type rb_un from radiobutton within w_liste_historique_appels
integer x = 622
integer y = 1208
integer width = 361
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un Patient"
end type

event clicked;
// Selection d'un patient


open(w_cherche)

if var_suite then
	sle_patient.visible = true
	sle_patient.text = var_nom
	var_code_local = var_code
end if
end event

type sle_patient from singlelineedit within w_liste_historique_appels
boolean visible = false
integer x = 1088
integer y = 1192
integer width = 1545
integer height = 112
integer taborder = 41
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type cbx_filtre from u_cst_togglebutton within w_liste_historique_appels
event destroy ( )
boolean visible = false
integer x = 87
integer y = 1996
integer width = 512
integer height = 92
integer taborder = 60
boolean bringtotop = true
string #ontext = "Filtres / Tris activés"
string #offtext = "Filtres / Tris inactivés"
string #tiptext = "Filtres / Tris"
end type

on cbx_filtre.destroy
call u_cst_togglebutton::destroy
end on

event constructor;call super::constructor;cbx_filtre.backcolor = parent.backcolor	

end event

event clicked;call super::clicked;
iu_PowerFilter.checked = NOT iu_PowerFilter.checked
iu_PowerFilter.event ue_clicked()


end event

type gb_4 from groupbox within w_liste_historique_appels
integer x = 571
integer y = 512
integer width = 2121
integer height = 240
integer taborder = 21
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Période"
end type

type gb_1 from groupbox within w_liste_historique_appels
integer x = 571
integer y = 940
integer width = 2121
integer height = 444
integer taborder = 31
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Sélection Patients"
end type

type dw_liste from u_basedw within w_liste_historique_appels
event ue_leftbuttonup pbm_dwnlbuttonup
boolean visible = false
integer x = 14
integer y = 12
integer width = 4178
integer height = 1968
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_liste_historique_appels"
borderstyle borderstyle = stylebox!
end type

event ue_leftbuttonup;iu_PowerFilter.event post ue_buttonclicked(dwo.type,dwo.name)
end event

event retrieverow;maj_patience(row,increment)

end event

event constructor;call super::constructor;iu_PowerFilter = create n_cst_PowerFilter
iu_PowerFilter.of_setdw(this)

end event

event resize;call super::resize;iu_PowerFilter.event ue_positionbuttons()
end event

