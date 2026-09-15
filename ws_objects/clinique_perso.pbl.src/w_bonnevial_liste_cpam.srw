$PBExportHeader$w_bonnevial_liste_cpam.srw
forward
global type w_bonnevial_liste_cpam from window
end type
type dw_patients from datawindow within w_bonnevial_liste_cpam
end type
type uo_1 from resize_fenetre within w_bonnevial_liste_cpam
end type
type cb_autre from uo_picturebutton_390x120 within w_bonnevial_liste_cpam
end type
type cb_exporter from uo_picturebutton_390x120 within w_bonnevial_liste_cpam
end type
type cb_imprimer from uo_picturebutton_390x120 within w_bonnevial_liste_cpam
end type
type cb_lancer from uo_picturebutton_390x120 within w_bonnevial_liste_cpam
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_bonnevial_liste_cpam
end type
type st_couleur2 from statictext within w_bonnevial_liste_cpam
end type
type st_3 from statictext within w_bonnevial_liste_cpam
end type
type cbx_avec_cc from checkbox within w_bonnevial_liste_cpam
end type
type dw_liste from datawindow within w_bonnevial_liste_cpam
end type
end forward

global type w_bonnevial_liste_cpam from window
integer width = 4727
integer height = 2444
windowtype windowtype = child!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
dw_patients dw_patients
uo_1 uo_1
cb_autre cb_autre
cb_exporter cb_exporter
cb_imprimer cb_imprimer
cb_lancer cb_lancer
cb_fermer cb_fermer
st_couleur2 st_couleur2
st_3 st_3
cbx_avec_cc cbx_avec_cc
dw_liste dw_liste
end type
global w_bonnevial_liste_cpam w_bonnevial_liste_cpam

on w_bonnevial_liste_cpam.create
this.dw_patients=create dw_patients
this.uo_1=create uo_1
this.cb_autre=create cb_autre
this.cb_exporter=create cb_exporter
this.cb_imprimer=create cb_imprimer
this.cb_lancer=create cb_lancer
this.cb_fermer=create cb_fermer
this.st_couleur2=create st_couleur2
this.st_3=create st_3
this.cbx_avec_cc=create cbx_avec_cc
this.dw_liste=create dw_liste
this.Control[]={this.dw_patients,&
this.uo_1,&
this.cb_autre,&
this.cb_exporter,&
this.cb_imprimer,&
this.cb_lancer,&
this.cb_fermer,&
this.st_couleur2,&
this.st_3,&
this.cbx_avec_cc,&
this.dw_liste}
end on

on w_bonnevial_liste_cpam.destroy
destroy(this.dw_patients)
destroy(this.uo_1)
destroy(this.cb_autre)
destroy(this.cb_exporter)
destroy(this.cb_imprimer)
destroy(this.cb_lancer)
destroy(this.cb_fermer)
destroy(this.st_couleur2)
destroy(this.st_3)
destroy(this.cbx_avec_cc)
destroy(this.dw_liste)
end on

event open;

//double var_code_local
//string var_nom_local
//date var_date_naissance
//decimal {2} v_total


//date v_dat, v_date_exe, v_date_fs
//string v_libelle, v_etat, v_fs
//long lig
//boolean prems

//var_code_local = message.doublep//arm


dw_patients.settransobject(sqlca)

uo_1.taille(this)

end event

event resize;uo_1.retaille(this)
end event

type dw_patients from datawindow within w_bonnevial_liste_cpam
boolean visible = false
integer x = 3223
integer y = 1240
integer width = 686
integer height = 400
integer taborder = 20
string title = "none"
string dataobject = "dw_bonnevial_liste_code"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type uo_1 from resize_fenetre within w_bonnevial_liste_cpam
boolean visible = false
integer x = 4480
integer y = 1524
integer taborder = 20
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cb_autre from uo_picturebutton_390x120 within w_bonnevial_liste_cpam
integer x = 2601
integer y = 2212
integer width = 549
integer height = 156
integer taborder = 50
string text = "Autre"
string iconname = "ACTIONS_autre.png"
end type

event clicked;call super::clicked;dw_liste.visible = false
cb_imprimer.enabled ( false)
cb_exporter.enabled ( false )
end event

type cb_exporter from uo_picturebutton_390x120 within w_bonnevial_liste_cpam
integer x = 1957
integer y = 2212
integer width = 549
integer height = 156
integer taborder = 40
boolean enabled = false
string text = "Exporter"
string iconname = "ACTIONS_exporter.png"
end type

event clicked;call super::clicked;

dw_liste.saveas()
end event

type cb_imprimer from uo_picturebutton_390x120 within w_bonnevial_liste_cpam
integer x = 1312
integer y = 2212
integer width = 549
integer height = 156
integer taborder = 30
boolean enabled = false
string text = "Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_lancer from uo_picturebutton_390x120 within w_bonnevial_liste_cpam
integer x = 667
integer y = 2212
integer width = 549
integer height = 156
integer taborder = 20
string text = "Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;double v_couleur2
long v_tot, v_cpt

double var_code_local
string var_nom_local
date var_date_naissance
decimal {2} v_total
datetime v_rdv
time v_heure_arrivee

date v_dat, v_date_exe, v_date_fs
string v_libelle, v_etat, v_fs, v_code_praticien, v_fauteuil, v_duree, v_nom_praticien
string v_numero_soin, v_lettre
long v_valeur_lettre, v_scp_demande
long lig
integer li_ecart
boolean prems

v_couleur2 = st_couleur2.backcolor

open(w_patience)
dw_patients.retrieve(v_couleur2)
v_tot = dw_patients.rowcount()
close(w_patience)

//select count(*) into :v_tot from  patient where couleur2 = :v_couleur2 ;

if messagebox("ATTENTION", "Vous allez générer la liste pour " + string(v_tot) + " patients.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	
	open(w_patience)
	
	dw_liste.reset()
	
	// Patients
	//declare cur_pat cursor for select code from patient where couleur2 = :v_couleur2 order by nom, prenom, date_naissance ;
	
	
	// Commentaires cliniques
	declare cur_com cursor for  select dat, com_html from coment where code = :var_code_local order by "dat", "ordre" ;

	// rendez-vous
	declare cur_rdv cursor for select rdv, type_rdv.nom, etat_rdv.nom , string(rdv.arrivee), rdv.code_praticien , string(rdv.fauteuil), string(rdv.duree), prati.nom 
	from rdv, type_rdv, etat_rdv , prati 
	where rdv.code = :var_code_local and rdv."type" = type_rdv.code and rdv.absent = etat_rdv.code and rdv.code_praticien = prati.code order by "rdv" ;


	// Soins
	declare cur_soins cursor for select date_demande, code_soins.nom, soins.total , soins.date_exe, soins.fse_edite, soins.date_fs, isnull(string(soins.numero), ''), isnull(code_soins.lettre, ''), isnull(code_soins.valeur , 0),  isnull(soins.scp_demande , 0)
	from soins, code_soins 
	where soins.code = :var_code_local and soins."type" = code_soins.code and code_soins.duree > 0 order by "date_demande" ;


	
	//open cur_pat ;
	
	//fetch cur_pat into :var_code_local ; 
	
	v_cpt = 0
	
	for v_cpt = 1 to v_tot
		
//		select top 1 nom + ' ' + isnull(prenom, ''), date_naissance 
//		into :var_nom_local, :var_date_naissance
//		from patient
//		where code = :var_code_local ;
		
		var_code_local = dw_patients.getitemNumber(v_cpt, "code")
		var_nom_local =  dw_patients.getitemString(v_cpt, "nom_complet")
		var_date_naissance = dw_patients.getitemDate(v_cpt, "date_naissance")
		
		
		// remplissage de la liste
		
		yield()
		w_patience.avancement(string(v_cpt) + " / " + string(v_tot))
		
		// Commentaires cliniques
		
		if cbx_avec_cc.checked then 
			open cur_com ;
			fetch cur_com into :v_dat, :v_libelle ;
			
			// ligne de titre
			dw_liste.insertrow(0)
			lig = dw_liste.rowcount()
			
			// patient
			dw_liste.setitem(lig, "code", var_code_local)
			dw_liste.setitem(lig, "nom", var_nom_local)
			dw_liste.setitem(lig, "date_naissance", var_date_naissance)
			dw_liste.setitem(lig, "ordre_groupe", 1)
			dw_liste.setitem(lig, "ordre_ligne", 0)
			dw_liste.setitem(lig, "libelle", "Commentaire")
			dw_liste.setitem(lig, "gras", 1)
			
			
			do while sqlca.sqlcode = 0
				dw_liste.insertrow(0)
				lig = dw_liste.rowcount()
				
				// patient
				dw_liste.setitem(lig, "code", var_code_local)
				dw_liste.setitem(lig, "nom", var_nom_local)
				dw_liste.setitem(lig, "date_naissance", var_date_naissance)
				
				dw_liste.setitem(lig, "ordre_groupe", 1)
				dw_liste.setitem(lig, "ordre_ligne", 1)
				dw_liste.setitem(lig, "date_element", v_dat)
				dw_liste.setitem(lig, "libelle", v_libelle)
			
				
				fetch cur_com into :v_dat, :v_libelle ;
			loop
			
			close cur_com ;
		
		end if
		//-------------------------------------------------------------------------------------- rendez-vous 
		
		
		
		open cur_rdv ;
		fetch cur_rdv into :v_rdv, :v_libelle, :v_etat,  :v_heure_arrivee, :v_code_praticien, :v_fauteuil, :v_duree, :v_nom_praticien ;
		
		// ligne de titre
		dw_liste.insertrow(0)
		lig = dw_liste.rowcount()
		
		// patient
		dw_liste.setitem(lig, "code", var_code_local)
		dw_liste.setitem(lig, "nom", var_nom_local)
		dw_liste.setitem(lig, "date_naissance", var_date_naissance)
		dw_liste.setitem(lig, "ordre_groupe", 2)
		dw_liste.setitem(lig, "ordre_ligne", 0)
		dw_liste.setitem(lig, "libelle", "Type de rendez-vous")
		dw_liste.setitem(lig, "montant", "Etat")
		dw_liste.setitem(lig, "date_execution", "Arrivée")
		dw_liste.setitem(lig, "date_fs", "Praticien")
		dw_liste.setitem(lig, "fauteuil", "Fa")
		dw_liste.setitem(lig, "duree", "Dur")
		dw_liste.setitem(lig, "heure_rdv", "Rdv")
		dw_liste.setitem(lig, "gras", 1)
		
		
		do while sqlca.sqlcode = 0
			dw_liste.insertrow(0)
			lig = dw_liste.rowcount()
			
			//messagebox("lig" , string(lig) + " -> " + v_libelle)
			
			// patient
			dw_liste.setitem(lig, "code", var_code_local)
			dw_liste.setitem(lig, "nom", var_nom_local)
			dw_liste.setitem(lig, "date_naissance", var_date_naissance)
			
			dw_liste.setitem(lig, "ordre_groupe", 2)
			dw_liste.setitem(lig, "ordre_ligne", 1)
			dw_liste.setitem(lig, "date_element", date(v_rdv))
			dw_liste.setitem(lig, "libelle", v_libelle)
			dw_liste.setitem(lig, "montant", v_etat)
			dw_liste.setitem(lig, "heure_rdv", string(time(v_rdv), 'hh:mm'))
			dw_liste.setitem(lig, "fauteuil", v_fauteuil)
			dw_liste.setitem(lig, "duree", v_duree)
			li_ecart = round(SecondsAfter(time(v_rdv) , v_heure_arrivee ) / 60,0)
			
			dw_liste.setitem(lig, "date_execution", string(v_heure_arrivee, 'hh:mm') + "   (" + string(li_ecart) + ")") 
			
			choose case v_code_praticien
				case "AD"
					dw_liste.setitem(lig, "date_fs", "BONNEVIAL")
				case else
					dw_liste.setitem(lig, "date_fs", v_nom_praticien)
			end choose

			
			fetch cur_rdv into :v_rdv, :v_libelle, :v_etat , :v_heure_arrivee, :v_code_praticien, :v_fauteuil, :v_duree, :v_nom_praticien  ;
		loop
		
		close cur_rdv ;
		
		// --------------------------------------------  soins avec DEP
		
		
		open cur_soins ;
		fetch cur_soins into :v_dat, :v_libelle, :v_total , :v_date_exe, :v_fs, :v_date_fs, :v_numero_soin, :v_lettre, :v_valeur_lettre, :v_scp_demande ;
		
		// ligne de titre
		dw_liste.insertrow(0)
		lig = dw_liste.rowcount()
		
		// patient
		dw_liste.setitem(lig, "code", var_code_local)
		dw_liste.setitem(lig, "nom", var_nom_local)
		dw_liste.setitem(lig, "date_naissance", var_date_naissance)
		dw_liste.setitem(lig, "ordre_groupe", 3)
		dw_liste.setitem(lig, "ordre_ligne", 0)
		dw_liste.setitem(lig, "libelle", "Type de soins")
		dw_liste.setitem(lig, "montant", "montant")
		dw_liste.setitem(lig, "gras", 1)
		dw_liste.setitem(lig, "montant", "Base Sécu")
		dw_liste.setitem(lig, "date_execution", "Date Execution")
		dw_liste.setitem(lig, "fs", "FS")
		dw_liste.setitem(lig, "date_fs", "Date FS")
		dw_liste.setitem(lig, "fauteuil", "N°")
			
		do while sqlca.sqlcode = 0
			
			//messagebox("lig" , string(lig) + " -> " + v_libelle)
			
			dw_liste.insertrow(0)
			lig = dw_liste.rowcount()
			
			// patient
			dw_liste.setitem(lig, "code", var_code_local)
			dw_liste.setitem(lig, "nom", var_nom_local)
			dw_liste.setitem(lig, "date_naissance", var_date_naissance)
			
			dw_liste.setitem(lig, "ordre_groupe", 3)
			dw_liste.setitem(lig, "ordre_ligne", 1)
			dw_liste.setitem(lig, "date_element", v_dat)
			dw_liste.setitem(lig, "libelle", v_libelle + " ( " + v_lettre + " " + string(v_scp_demande) + " )" )
			dw_liste.setitem(lig, "montant", string(v_scp_demande * v_valeur_lettre,"0.00"))
		 	dw_liste.setitem(lig, "date_execution", string(v_date_exe, "dd/mm/yyyy"))
			dw_liste.setitem(lig, "fs", v_fs)
			dw_liste.setitem(lig, "date_fs", string(v_date_fs, "dd/mm/yyyy"))
			dw_liste.setitem(lig, "fauteuil", string(v_numero_soin))
			fetch cur_soins into :v_dat, :v_libelle, :v_total,  :v_date_exe, :v_fs, :v_date_fs, :v_numero_soin, :v_lettre, :v_valeur_lettre, :v_scp_demande ;
		loop
		
		close cur_soins ;
		

			
		//fetch cur_pat into :var_code_local ; 
	next
	
	//close cur_pat ;
	
	dw_liste.sort()
	dw_liste.groupcalc()
	
	dw_liste.visible = true
	cb_imprimer.enabled = true
	cb_exporter.enabled = true
	close(w_patience)
	
	
	
end if
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_bonnevial_liste_cpam
integer x = 3246
integer y = 2212
integer width = 549
integer height = 156
integer taborder = 20
string text = "Fermer"
end type

event clicked;fermer_fenetre(parent)
end event

type st_couleur2 from statictext within w_bonnevial_liste_cpam
integer x = 1824
integer y = 1016
integer width = 187
integer height = 112
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "?"
alignment alignment = center!
boolean border = true
borderstyle borderstyle = styleraised!
boolean focusrectangle = false
end type

event clicked;	//Declaration des variables locales
	//--------------------------
	long couleur_choisie
	
	couleur_choisie = this.backcolor
	
	//Appel de la fenetre couleur et au retour, met la couleur de fond
	//--------------------------------------------------
	if appel_palette(couleur_choisie) then
		boolean v_suite = false
		
			this.backcolor = couleur_choisie
			this.text = ""

	end if
end event

event rbuttondown;	this.backcolor = couleur_jour_interdit
	this.text = '?'

end event

type st_3 from statictext within w_bonnevial_liste_cpam
integer x = 1394
integer y = 1044
integer width = 375
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Pastille 2 :"
alignment alignment = right!
end type

type cbx_avec_cc from checkbox within w_bonnevial_liste_cpam
integer x = 1435
integer y = 1296
integer width = 1006
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Avec Commentaires Cliniques"
end type

event clicked;string ls_filtre
if checked then 
	ls_filtre = ""
else
	ls_filtre = "ordre_groupe <> 1"
end if

dw_liste.setfilter(ls_filtre)
dw_liste.filter()
dw_liste.groupcalc()
end event

type dw_liste from datawindow within w_bonnevial_liste_cpam
boolean visible = false
integer x = 201
integer y = 48
integer width = 4261
integer height = 2100
integer taborder = 10
string title = "none"
string dataobject = "dw_bonnevial_liste_cpam"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

