$PBExportHeader$w_patient_emploi_du_temp.srw
forward
global type w_patient_emploi_du_temp from w_fenetre_arakis
end type
type tab_1 from tab within w_patient_emploi_du_temp
end type
type tabpage_1 from userobject within tab_1
end type
type uo_1 from uo_agenda_patient within tabpage_1
end type
type tabpage_1 from userobject within tab_1
uo_1 uo_1
end type
type tabpage_2 from userobject within tab_1
end type
type uo_2 from uo_agenda_patient within tabpage_2
end type
type tabpage_2 from userobject within tab_1
uo_2 uo_2
end type
type tab_1 from tab within w_patient_emploi_du_temp
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_patient_emploi_du_temp
end type
type uo_resize from resize_fenetre within w_patient_emploi_du_temp
end type
end forward

global type w_patient_emploi_du_temp from w_fenetre_arakis
integer width = 4219
integer height = 2472
string title = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
tab_1 tab_1
pb_1 pb_1
uo_resize uo_resize
end type
global w_patient_emploi_du_temp w_patient_emploi_du_temp

on w_patient_emploi_du_temp.create
int iCurrent
call super::create
this.tab_1=create tab_1
this.pb_1=create pb_1
this.uo_resize=create uo_resize
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.tab_1
this.Control[iCurrent+2]=this.pb_1
this.Control[iCurrent+3]=this.uo_resize
end on

on w_patient_emploi_du_temp.destroy
call super::destroy
destroy(this.tab_1)
destroy(this.pb_1)
destroy(this.uo_resize)
end on

event open;call super::open;centrer_selon_w_mdi_2020(this)


uo_resize.taille(this)

colore_tous_objets_tab(tab_1, couleur_fond_datawindow)

// Mise à jour du titre de la fenêtre

string titre
select nom + ' ' + isnull(prenom,'') + ' ('+string(numero_dossier)+')'   into :titre from patient where code = :var_code ; 

this.title = "Emploi du Temps de "+ titre


//// pour agrandir la fenêtre au max
//this.x = w_mdi_2020.WorkspaceX () + w_mdi_2020.WorkspaceWidth() * 0.05
//this.y = w_mdi_2020.WorkspaceY ()+ w_mdi_2020.WorkspaceHeight() * 0.05
//this.width =  w_mdi_2020.WorkspaceWidth() * 0.9
//this.height =  w_mdi_2020.WorkspaceHeight() * 0.9
//	

end event

event resize;call super::resize;

uo_resize.retaille(this)

//tab_1.width = this.width - 50
//
//tab_1.tabpage_1.uo_1.width = tab_1.tabpage_1.width - 30
//tab_1.tabpage_1.uo_1.height = tab_1.tabpage_1.height - 30
//
//tab_1.tabpage_2.uo_2.width = tab_1.tabpage_2.width - 30
//tab_1.tabpage_1.uo_2.height = tab_1.tabpage_2.height - 30
//tab_1.tabpage_1.uo_2.height = tab_1.tabpage_2.height - 30
//
//tab_1.tabpage_1.uo_1.parametrage()
//tab_1.tabpage_1.uo_1.affiche_rdv()
//
//
//tab_1.tabpage_2.uo_2.parametrage()
//tab_1.tabpage_2.uo_2.affiche_rdv()


// semaine A

tab_1.tabpage_1.uo_1.cb_ajouter.y= 1550  * uo_resize.ratio
tab_1.tabpage_1.uo_1.cb_effacer.y= tab_1.tabpage_1.uo_1.cb_ajouter.y
tab_1.tabpage_1.uo_1.cb_sauver.y= tab_1.tabpage_1.uo_1.cb_ajouter.y

tab_1.tabpage_1.uo_1.st_date_reference.y= tab_1.tabpage_1.uo_1.cb_ajouter.y + 40
tab_1.tabpage_1.uo_1.em_date_reference.y= tab_1.tabpage_1.uo_1.cb_ajouter.y + 24


tab_1.tabpage_1.uo_1.width   = 3259  * uo_resize.ratio
tab_1.tabpage_1.uo_1.height  = 1740 * uo_resize.ratio 
tab_1.tabpage_1.uo_1.tab.width= 3246  * uo_resize.ratio
tab_1.tabpage_1.uo_1.tab.height= 1500  * uo_resize.ratio



tab_1.tabpage_1.uo_1.parametrage()
tab_1.tabpage_1.uo_1.affiche_rdv()

tab_1.tabpage_1.uo_1.x = (tab_1.tabpage_1.width - tab_1.tabpage_1.uo_1.width) / 2
tab_1.tabpage_1.uo_1.y =(tab_1.tabpage_1.height - tab_1.tabpage_1.uo_1.height) / 2


// semaine b

tab_1.tabpage_2.uo_2.cb_ajouter.y= 1550  * uo_resize.ratio
tab_1.tabpage_2.uo_2.cb_effacer.y= tab_1.tabpage_2.uo_2.cb_ajouter.y
tab_1.tabpage_2.uo_2.cb_sauver.y= tab_1.tabpage_2.uo_2.cb_ajouter.y

tab_1.tabpage_2.uo_2.st_date_reference.y= tab_1.tabpage_2.uo_2.cb_ajouter.y + 40
tab_1.tabpage_2.uo_2.em_date_reference.y= tab_1.tabpage_2.uo_2.cb_ajouter.y + 24


tab_1.tabpage_2.uo_2.width   = 3259  * uo_resize.ratio
tab_1.tabpage_2.uo_2.height  = 1740 * uo_resize.ratio 
tab_1.tabpage_2.uo_2.tab.width= 3246  * uo_resize.ratio
tab_1.tabpage_2.uo_2.tab.height= 1500  * uo_resize.ratio



tab_1.tabpage_2.uo_2.parametrage()
tab_1.tabpage_2.uo_2.affiche_rdv()

tab_1.tabpage_2.uo_2.x = (tab_1.tabpage_2.width - tab_1.tabpage_2.uo_2.width) / 2
tab_1.tabpage_2.uo_2.y =(tab_1.tabpage_2.height - tab_1.tabpage_2.uo_2.height) / 2
//
end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_emploi_du_temp
end type

type tab_1 from tab within w_patient_emploi_du_temp
integer x = 9
integer width = 4155
integer height = 2076
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 67108864
boolean focusonbuttondown = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4119
integer height = 1948
long backcolor = 15780518
string text = "Semaine A"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_1 uo_1
end type

on tabpage_1.create
this.uo_1=create uo_1
this.Control[]={this.uo_1}
end on

on tabpage_1.destroy
destroy(this.uo_1)
end on

type uo_1 from uo_agenda_patient within tabpage_1
integer x = 18
integer y = 24
integer width = 2843
integer height = 1856
integer taborder = 20
string lettre_semaine = "A"
end type

on uo_1.destroy
call uo_agenda_patient::destroy
end on

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4119
integer height = 1948
long backcolor = 15780518
string text = "Semaine B"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
uo_2 uo_2
end type

on tabpage_2.create
this.uo_2=create uo_2
this.Control[]={this.uo_2}
end on

on tabpage_2.destroy
destroy(this.uo_2)
end on

type uo_2 from uo_agenda_patient within tabpage_2
integer x = 14
integer y = 32
integer width = 3707
integer height = 1796
integer taborder = 20
string lettre_semaine = "B"
end type

on uo_2.destroy
call uo_agenda_patient::destroy
end on

type pb_1 from uo_picturebutton_390x120_fermer within w_patient_emploi_du_temp
integer x = 3429
integer y = 2132
integer width = 512
integer height = 152
integer taborder = 80
boolean bringtotop = true
end type

type uo_resize from resize_fenetre within w_patient_emploi_du_temp
boolean visible = false
integer x = 448
integer y = 1960
integer taborder = 90
boolean bringtotop = true
end type

on uo_resize.destroy
call resize_fenetre::destroy
end on

