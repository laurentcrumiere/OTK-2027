$PBExportHeader$w_historique_traitement.srw
forward
global type w_historique_traitement from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_historique_traitement
end type
type tab_1 from tab within w_historique_traitement
end type
type tabpage_1 from userobject within tab_1
end type
type dw_historique_traitement from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_historique_traitement dw_historique_traitement
end type
type tabpage_2 from userobject within tab_1
end type
type dw_historique_diagnostic from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_historique_diagnostic dw_historique_diagnostic
end type
type tab_1 from tab within w_historique_traitement
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type dw_1 from datawindow within w_historique_traitement
end type
end forward

global type w_historique_traitement from w_fenetre_arakis
integer width = 3680
integer height = 2200
windowtype windowtype = response!
long backcolor = 15780518
pb_1 pb_1
tab_1 tab_1
dw_1 dw_1
end type
global w_historique_traitement w_historique_traitement

on w_historique_traitement.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.tab_1=create tab_1
this.dw_1=create dw_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.dw_1
end on

on w_historique_traitement.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.tab_1)
destroy(this.dw_1)
end on

event open;call super::open;

//Declarations des variables locales
//---------------------------------------
double var_code_local

if profilestring(dir_ini+inifile_orthokis,"commentaires_cliniques","plans_mutiples","N") = "O" then
	tab_1.tabpage_1.dw_historique_traitement.dataobject = "dw_historique_traitement_bis"
	// agrandissement du coup !!
	tab_1.tabpage_1.dw_historique_traitement.width = 4251 
	tab_1.tabpage_1.dw_historique_traitement.height = 1656 + 100
	tab_1.width = 4425
	tab_1.height = 1856 + 100
	pb_1.x = 2802
	pb_1.y = 1936 + 100
	this.width = 4503
	this.height = 2224 + 200
end if

centrer(this)


//Connexion des datawindows
//---------------------------------
tab_1.tabpage_1.dw_historique_traitement.settransobject(SQLCA)
tab_1.tabpage_2.dw_historique_diagnostic.settransobject(SQLCA)

colore_datawindow(tab_1.tabpage_1.dw_historique_traitement)
colore_datawindow(tab_1.tabpage_2.dw_historique_diagnostic)
tab_1.backcolor = couleur_fond_fenetre
tab_1.tabpage_1.backcolor = couleur_fond_fenetre
tab_1.tabpage_2.backcolor = couleur_fond_fenetre


//this.tab_1.tabpage_1.dw_historique_traitement.sharedata(tab_1.tabpage_2.dw_historique_diagnostic)

//Recup du code du patient
//------------------------------
var_code_local=message.doubleparm

//Recherche de l'histo des patients
//--------------------------------------
this.tab_1.tabpage_1.dw_historique_traitement.retrieve(var_code_local,date_historique)
this.tab_1.tabpage_2.dw_historique_diagnostic.retrieve(var_code_local,date_historique)


dw_1.settransobject(SQLCA)
dw_1.retrieve(var_code_local,date_historique)

//Affichage du titre de la fenetre
//------------------------------------
this.title='Traitement de '+ var_nom + ' archivé le  ' + string(date_historique)

end event

type p_fond from w_fenetre_arakis`p_fond within w_historique_traitement
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_historique_traitement
integer x = 2688
integer y = 1824
integer width = 567
integer height = 152
integer taborder = 20
boolean default = true
end type

type tab_1 from tab within w_historique_traitement
integer x = 37
integer y = 8
integer width = 3433
integer height = 1744
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
boolean fixedwidth = true
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
integer width = 3397
integer height = 1616
long backcolor = 15780518
string text = "Traitement"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_historique_traitement dw_historique_traitement
end type

on tabpage_1.create
this.dw_historique_traitement=create dw_historique_traitement
this.Control[]={this.dw_historique_traitement}
end on

on tabpage_1.destroy
destroy(this.dw_historique_traitement)
end on

type dw_historique_traitement from datawindow within tabpage_1
string tag = "brush"
integer x = 69
integer y = 56
integer width = 3273
integer height = 1508
integer taborder = 20
string title = "dw_historique_traitement"
string dataobject = "dw_historique_traitement"
boolean livescroll = true
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3397
integer height = 1616
long backcolor = 15780518
string text = "Diagnostic"
long tabtextcolor = 33554432
long tabbackcolor = 15780518
long picturemaskcolor = 536870912
dw_historique_diagnostic dw_historique_diagnostic
end type

on tabpage_2.create
this.dw_historique_diagnostic=create dw_historique_diagnostic
this.Control[]={this.dw_historique_diagnostic}
end on

on tabpage_2.destroy
destroy(this.dw_historique_diagnostic)
end on

type dw_historique_diagnostic from datawindow within tabpage_2
string tag = "brush"
integer x = 55
integer y = 136
integer width = 3296
integer height = 1356
integer taborder = 20
string title = "none"
string dataobject = "dw_historique_diagnostic"
boolean livescroll = true
end type

type dw_1 from datawindow within w_historique_traitement
string tag = "uniquemrnt pour la compitaltion"
boolean visible = false
integer x = 1614
integer y = 536
integer width = 1989
integer height = 560
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_historique_traitement_bis"
boolean livescroll = true
end type

