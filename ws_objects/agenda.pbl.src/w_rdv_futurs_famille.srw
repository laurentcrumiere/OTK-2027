$PBExportHeader$w_rdv_futurs_famille.srw
forward
global type w_rdv_futurs_famille from w_fenetre_arakis
end type
type pb_1 from uo_picturebutton_390x120_fermer within w_rdv_futurs_famille
end type
type pb_imprimer from uo_picturebutton_390x120 within w_rdv_futurs_famille
end type
type tab_1 from tab within w_rdv_futurs_famille
end type
type tabpage_1 from userobject within tab_1
end type
type dw_liste from u_basedw within tabpage_1
end type
type cbx_duree from checkbox within tabpage_1
end type
type gb_impression from groupbox within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_liste dw_liste
cbx_duree cbx_duree
gb_impression gb_impression
end type
type tabpage_2 from userobject within tab_1
end type
type dw_liste2 from u_basedw within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_liste2 dw_liste2
end type
type tab_1 from tab within w_rdv_futurs_famille
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type pb_2 from uo_picturebutton_390x120 within w_rdv_futurs_famille
end type
type dw_courriers from u_basedw within w_rdv_futurs_famille
end type
end forward

global type w_rdv_futurs_famille from w_fenetre_arakis
integer width = 3602
integer height = 2040
string title = "Prochains Rendez-vous et Règlements d~'une Famille"
boolean center = true
pb_1 pb_1
pb_imprimer pb_imprimer
tab_1 tab_1
pb_2 pb_2
dw_courriers dw_courriers
end type
global w_rdv_futurs_famille w_rdv_futurs_famille

type variables


double var_code_local
char tabpage_actif = "V"			// V pour rdv, G pour reglements
end variables

on w_rdv_futurs_famille.create
int iCurrent
call super::create
this.pb_1=create pb_1
this.pb_imprimer=create pb_imprimer
this.tab_1=create tab_1
this.pb_2=create pb_2
this.dw_courriers=create dw_courriers
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_1
this.Control[iCurrent+2]=this.pb_imprimer
this.Control[iCurrent+3]=this.tab_1
this.Control[iCurrent+4]=this.pb_2
this.Control[iCurrent+5]=this.dw_courriers
end on

on w_rdv_futurs_famille.destroy
call super::destroy
destroy(this.pb_1)
destroy(this.pb_imprimer)
destroy(this.tab_1)
destroy(this.pb_2)
destroy(this.dw_courriers)
end on

event open;call super::open;
// Passage du code patient en paramèetre
var_code_local = message.doubleparm

tab_1.tabpage_1.dw_liste.settransobject(sqlca)
tab_1.tabpage_1.dw_liste.retrieve(var_code_local)


tab_1.tabpage_2.dw_liste2.settransobject(sqlca)
tab_1.tabpage_2.dw_liste2.retrieve(var_code_local)

dw_courriers.settransobject(sqlca)

//colore_datawindow(tab_1.tabpage_1.dw_liste)
//colore_datawindow(tab_1.tabpage_2.dw_liste2)


// Remplissage des prochains reglements :

long lig, tot
decimal {2} v_mont
date v_datet
double v_code

tot = tab_1.tabpage_2.dw_liste2.rowcount()

for lig = 1 to tot
	
	v_code = tab_1.tabpage_2.dw_liste2.GetItemNumber(lig, "code")
	
	proc_reglt(v_code, v_datet, v_mont, 'P')
	
	tab_1.tabpage_2.dw_liste2.setItem(lig, "date_proc_reglt", v_datet)
	tab_1.tabpage_2.dw_liste2.setItem(lig, "mont_proc_reglt", v_mont)
	
	proc_reglt(v_code, v_datet, v_mont, 'T')
	
	tab_1.tabpage_2.dw_liste2.setItem(lig, "date_proc_reglt_tp", v_datet)
	tab_1.tabpage_2.dw_liste2.setItem(lig, "mont_proc_reglt_tp", string(v_mont, "0.00"))
	
	
next



// Valeur par défaut 
if profilestring(dir_ini+inifile_orthokis,"rendez-vous","prochain_rendez-vous_duree_visible","O") = "O" then
	tab_1.tabpage_1.cbx_duree.checked  = true
else
	tab_1.tabpage_1.cbx_duree.checked  = false
end if




end event

event close;call super::close;
// Mémorisation de l'option d'affichage

if tab_1.tabpage_1.cbx_duree.checked  then
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","prochain_rendez-vous_duree_visible","O") 
else
	setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","prochain_rendez-vous_duree_visible","N") 
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_rdv_futurs_famille
end type

type pb_1 from uo_picturebutton_390x120_fermer within w_rdv_futurs_famille
integer x = 1998
integer y = 1744
integer width = 503
integer height = 152
integer taborder = 10
boolean bringtotop = true
boolean default = true
end type

type pb_imprimer from uo_picturebutton_390x120 within w_rdv_futurs_famille
integer x = 882
integer y = 1744
integer width = 503
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;

if tabpage_actif = "V" then
	// rendez-vous
	if not tab_1.tabpage_1.cbx_duree.checked then 
		tab_1.tabpage_1.dw_liste.object.duree.visible = 0
		tab_1.tabpage_1.dw_liste.object.duree_t.visible = 1
	end if
	tab_1.tabpage_1.dw_liste.print()
	if not tab_1.tabpage_1.cbx_duree.checked then 
		tab_1.tabpage_1.dw_liste.object.duree.visible = 1
		tab_1.tabpage_1.dw_liste.object.duree_t.visible = 1
	end if
else
	// Règlements
	tab_1.tabpage_2.dw_liste2.print()
end if
end event

type tab_1 from tab within w_rdv_futurs_famille
event create ( )
event destroy ( )
integer x = 14
integer width = 3515
integer height = 1704
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
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

event clicked;
if isnull(index) then return 0
if not index > 0 then return 0
if this.Control[index].enabled then
	choose case index
		case 1
			tabpage_actif = "V"	
		case 2 
			tabpage_actif = "G"	
	end choose
end if

end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 3479
integer height = 1576
string text = "Prochains Rendez-vous"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_liste dw_liste
cbx_duree cbx_duree
gb_impression gb_impression
end type

on tabpage_1.create
this.dw_liste=create dw_liste
this.cbx_duree=create cbx_duree
this.gb_impression=create gb_impression
this.Control[]={this.dw_liste,&
this.cbx_duree,&
this.gb_impression}
end on

on tabpage_1.destroy
destroy(this.dw_liste)
destroy(this.cbx_duree)
destroy(this.gb_impression)
end on

type dw_liste from u_basedw within tabpage_1
string tag = "brush"
integer x = 137
integer y = 12
integer width = 3223
integer height = 1372
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_rdv_futurs_famille"
borderstyle borderstyle = stylebox!
end type

event doubleclicked;call super::doubleclicked;

// double clic, comme dans la salle d'attente !!

if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
	var_nom 				= this.getitemstring(row,"nom")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
	
	close(w_rdv_futurs_famille)
end if

end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	openmenupatient_rdv_fratrie(this, w_rdv_futurs_famille)
end if
end event

type cbx_duree from checkbox within tabpage_1
integer x = 219
integer y = 1468
integer width = 443
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Afficher durée"
boolean checked = true
end type

type gb_impression from groupbox within tabpage_1
integer x = 137
integer y = 1396
integer width = 901
integer height = 160
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "A l~'impression (ou email)"
end type

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 3479
integer height = 1576
long backcolor = 16777215
string text = "Prochains Règlements"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_liste2 dw_liste2
end type

on tabpage_2.create
this.dw_liste2=create dw_liste2
this.Control[]={this.dw_liste2}
end on

on tabpage_2.destroy
destroy(this.dw_liste2)
end on

type dw_liste2 from u_basedw within tabpage_2
string tag = "brush"
integer x = 32
integer y = 12
integer width = 3424
integer height = 1512
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_reglements_futurs_famille"
borderstyle borderstyle = stylebox!
end type

event doubleclicked;call super::doubleclicked;

// double clic, comme dans la salle d'attente !!

if row > 0 then

	var_code 				= 	this.getitemnumber(row,"code")
	var_numero_dossier 	= 	this.getitemnumber(row,"numero_dossier")
	var_nom 				= this.getitemstring(row,"nom")
	var_nomp 				= ""
	var_pay 					= ""
	var_moul 				= ""

	ouverture_salle_attente()
	
	close(w_rdv_futurs_famille)
end if

end event

event rbuttondown;if row > 0 then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
	openmenupatient_rdv_fratrie(this, w_rdv_futurs_famille)
end if
end event

type pb_2 from uo_picturebutton_390x120 within w_rdv_futurs_famille
integer x = 1440
integer y = 1744
integer width = 503
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Env. Email"
string iconname = "lc_envoi_message.png"
end type

event clicked;call super::clicked;// impression en PDF
string rep_phot_patient, v_fichier_destination,v_fichier_destination_complet
string v_code_edition
long ligtot
integer l_rc


rep_phot_patient = dir_photos + string( var_code_local )
if not fileexists( rep_phot_patient ) then gfx_creer_rep( rep_phot_patient )

datawindow dw_liste

if tabpage_actif = "V" then
	// rendez-vous
	if not tab_1.tabpage_1.cbx_duree.checked then 
		tab_1.tabpage_1.dw_liste.object.duree.visible = 0
		tab_1.tabpage_1.dw_liste.object.duree_t.visible = 0
	end if
	v_fichier_destination =  string(today(), "yyyy-mm-dd")+" "+string(now(), "hh-mm-ss")+ " - RDV Famille.pdf"
	dw_liste = tab_1.tabpage_1.dw_liste
	v_code_edition = "RDVFAM"
else
	// Règlements
	v_fichier_destination =  string(today(), "yyyy-mm-dd")+" "+string(now(), "hh-mm-ss")+ " - Prochains Règlements Famille.pdf"
	dw_liste = tab_1.tabpage_2.dw_liste2
	v_code_edition = "PRRFAM"
end if

v_fichier_destination_complet = rep_phot_patient + win_delimiter + v_fichier_destination
//if verif_bullzip_printer(v_fichier_destination_complet, false) then
//	dw_liste.modify("Datawindow.printer = 'Bullzip PDF Printer'" ) 
//end if
//
//dw_liste.print()

l_rc = dw_liste.saveas(v_fichier_destination_complet, PDF!, false)


if not fileExists(v_fichier_destination_complet) then
	Messagebox("ATTENTION", "Impossible de générer le fichier : " + v_fichier_destination_complet)
else
	
	//// pour laisser le temps de générer le fichier
	//integer v_secondes_attente = 5
	//integer v_cpt_secondes_attente = 0
	//do while not FileExists(v_fichier_destination_complet) and v_cpt_secondes_attente <= v_secondes_attente
	//	v_cpt_secondes_attente = 	v_cpt_secondes_attente + 1
	//	sleep(1000)
	//loop
	
	integer categorie_nulle
	setnull(categorie_nulle)
	fxg_enregcourrierhisto ( var_code_local, v_code_edition , today() ,"Pour envoi par email" , v_fichier_destination_complet , 'E', 'N' , 'N', "", categorie_nulle)
	
	dw_courriers.retrieve(var_code_local, "E")
	dw_courriers.setfilter("historique_editions_nom_courrier = '" + v_fichier_destination + "'" )
	dw_courriers.filter()
	ligtot = dw_courriers.rowcount()
	if  ligtot > 0 then
		dw_courriers.SetItem(1, "Selection", 'O')					
		m_btdroit_historique		Menu
		Menu = CREATE m_btdroit_historique
		Menu.dw_locale = dw_courriers
		Menu.var_code_local = var_code_local
		
		Menu.m_envoyerparemailpiècejointe.TriggerEvent(clicked!)
		
	end if
end if

if tabpage_actif = "V" then
	if not tab_1.tabpage_1.cbx_duree.checked then 
		tab_1.tabpage_1.dw_liste.object.duree.visible = 1
		tab_1.tabpage_1.dw_liste.object.duree_t.visible = 1
	end if
end if

end event

type dw_courriers from u_basedw within w_rdv_futurs_famille
string tag = "pour envoyer des factures par email"
boolean visible = false
integer x = 1614
integer y = 80
integer width = 837
integer height = 428
integer taborder = 30
boolean bringtotop = true
string dataobject = "dw_patient_fiche5"
end type

