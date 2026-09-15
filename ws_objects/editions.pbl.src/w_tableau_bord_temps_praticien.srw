$PBExportHeader$w_tableau_bord_temps_praticien.srw
forward
global type w_tableau_bord_temps_praticien from w_liste_patients
end type
type rb_une_annee from radiobutton within w_tableau_bord_temps_praticien
end type
type rb_plusieurs_annees from radiobutton within w_tableau_bord_temps_praticien
end type
type em_annee_min from editmask within w_tableau_bord_temps_praticien
end type
type em_annee_max from editmask within w_tableau_bord_temps_praticien
end type
type st_de from statictext within w_tableau_bord_temps_praticien
end type
type st_a from statictext within w_tableau_bord_temps_praticien
end type
type cb_exporter from uo_picturebutton_390x120 within w_tableau_bord_temps_praticien
end type
type gb_2 from groupbox within w_tableau_bord_temps_praticien
end type
end forward

global type w_tableau_bord_temps_praticien from w_liste_patients
string title = "Tableau de Bord : Temps passé par praticien"
rb_une_annee rb_une_annee
rb_plusieurs_annees rb_plusieurs_annees
em_annee_min em_annee_min
em_annee_max em_annee_max
st_de st_de
st_a st_a
cb_exporter cb_exporter
gb_2 gb_2
end type
global w_tableau_bord_temps_praticien w_tableau_bord_temps_praticien

forward prototypes
public subroutine prepa ()
public function long heures_travaillees (integer mois1, integer annee1, integer mois2, integer annee2, string v_code_praticien)
end prototypes

public subroutine prepa ();string pra_min,pra_max
double code_min,code_max
long annee_min, annee_max

integer mois1, annee1, mois2, annee2
double  v_calcul, v_valeur

long boucle_min, boucle_max, boucle
long colonne 

boolean v_suite
boolean prems = true

if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)
	
	annee_min = long(em_annee_min.text)
	annee_max = long(em_annee_max.text)
	
	
	
	// On efface les titres de colonnes au cas ou re calcul
	for  boucle = 1 to 12
		dw_liste.modify("valeur"+string(boucle)+"_t.text = ''")
	next
	
	v_suite = true
	
	if rb_une_annee.checked then
		// travail sur le détail d'une année
		dw_liste.modify('t_titre.text = "ANALYSE DES TEMPS PASSES SUR L'+"'"+' ANNEE '+string(annee_min)+'"')
		annee1 = annee_min
		annee2 = annee_min
		boucle_min = 1 
		boucle_max = 12
	else
		// travail sur plusieurs annees
		dw_liste.modify('t_titre.text = "ANALYSE DES TEMPS PASSES DE '+string(annee_min)+" à " +string(annee_max) + '"')
		boucle_min = annee_min
		boucle_max = annee_max
		
		// On vérifie la limite de 12 années étudiées
		if annee_max - annee_min >= 12 then
			Messagebox("ATTENTION","Ce tableau de bord ne peut être demandé que pour 12 années au maximum et non "+string(annee_max - annee_min + 1)+".~n~nSi besoin, vous devez procéder en plusieurs fois.")
			v_suite = false
			prepa_faite = false
		end if
		
	end if
		
	if v_suite then
		
		open(w_patience)
		dw_liste.visible = true
		dw_liste.reset()
		
		string v_code_praticien, v_nom_praticien 
		DECLARE cur_pat CURSOR FOR SELECT code, nom from prati where actif = 1 and code between :pra_min and :pra_max 
		order by ordre_trie, nom  ; 
		
		
		open cur_pat ;
		fetch cur_pat into :v_code_praticien, :v_nom_praticien ;
		
		do while SQLCA.sqlcode = 0
		
		
			yield()
				
			// Création de la ligne de calcul
			
			dw_liste.insertrow(9999)
			v_calcul = dw_liste.rowcount()
			dw_liste.scrolltorow(v_calcul)
				
			dw_liste.setitem(v_calcul, "totaliser", "O")
			dw_liste.setitem(v_calcul, "total", 0)
			dw_liste.setitem(v_calcul, "ordre", v_calcul * 10)
			dw_liste.setitem(v_calcul, "groupe", "")
			dw_liste.setitem(v_calcul, "libelle", v_nom_praticien)
			dw_liste.setitem(v_calcul, "unite", "Heures Travaillées")
			dw_liste.setitem(v_calcul, "tooltips", "Se base sur les rendez-vous de l'agenda (praticien et durée).")
		

			 
			colonne = 1
			for  boucle = boucle_min to boucle_max
				
				if rb_une_annee.checked then 
					mois1 = boucle
					mois2 = boucle 
				else
					mois1 = 1
					mois2 = 12
					annee1 = boucle
					annee2 = boucle 
				end if
				
				
				// Calcul du temps passé
				v_valeur = heures_travaillees (mois1, annee1, mois2, annee2, v_code_praticien )
				
				
				if prems then	
					// Mise à jour des noms des colonnes !!
					if rb_une_annee.checked then
						string a
						dw_liste.modify("valeur"+string(colonne)+"_t.text = '"+left(mois[boucle], 4)+"'")
					else
						dw_liste.modify("valeur"+string(colonne)+"_t.text = '"+string(boucle)+"'")
					end if
				end if

				 
				dw_liste.setitem(v_calcul, "valeur"+string(colonne), v_valeur)
				if dw_liste.getitemString(v_calcul, "totaliser") =  "O" then
					dw_liste.setitem(v_calcul, "total", dw_liste.getitemnumber(v_calcul, "total") + v_valeur)
				end if

				colonne = colonne + 1
			next		
		
			fetch cur_pat into :v_code_praticien, :v_nom_praticien ;
			
			prems = false
			yield()
		loop 
		
		close cur_pat ;
		
	
		dw_liste.sort()
		dw_liste.groupcalc()
		
		cb_exporter.visible = true
		st_de.visible = false
		st_a.visible = false
		
		close(w_patience)

	end if
	
end if

end subroutine

public function long heures_travaillees (integer mois1, integer annee1, integer mois2, integer annee2, string v_code_praticien);

long v_mois, v_annee, i
long  indice_depart, indice_arrive
date v_date_jour

datetime v_rdv
integer v_duree
time v_heure_rdv, v_minuit

long  v_heures_travaillees = 0
long v_minutes_travaillees, v_minutes_travaillees_totales
v_mois = mois1 
v_annee = annee1


 
constant long indice_maxi_tab = 44640
// 31 jours à 1440 minutes 
integer minutes_journee[44640]			// Vaudra 0 si pas travaillée, 1 si travaillé


// Curseur pour les rendez-vous honorés du jour d'un praticien 
DECLARE  cur_rdv CURSOR FOR SELECT rdv, duree from rdv, etat_rdv where month(cast (rdv.rdv as date) ) = :v_mois and year(date(rdv)) = :v_annee   
and code_praticien = :v_code_praticien and etat_rdv.elimine_agenda = 'N' and rdv.absent = etat_rdv.code ;

v_minutes_travaillees_totales = 0
v_minuit = time ('00:00:00')

// Pour toute la période, on traite mois / mois
do while  v_annee * 100 + v_mois <= annee2 * 100 + mois2 
	

	for i = 1 to indice_maxi_tab
		minutes_journee[i] = 0
	next
	
	open cur_rdv ;
	
	fetch cur_rdv into :v_rdv, :v_duree ;
	
	do while sqlca.sqlcode = 0
		
		v_heure_rdv = time(v_rdv) 
		
		indice_depart = ((day(date(v_rdv)) -1) * 1440) + secondsafter(v_minuit, v_heure_rdv) / 60
		indice_arrive = indice_depart + v_duree - 1
		
		
		for i = indice_depart to indice_arrive
			minutes_journee[i] = 1
		next
		
		fetch cur_rdv into :v_rdv, :v_duree ;
		
	loop
	
	close cur_rdv ;
	
	// On a traité tous les rdv, on peut comptes les munites travaillées
	v_minutes_travaillees = 0
	for i = 1 to indice_maxi_tab
		if minutes_journee[i] = 1 then
			v_minutes_travaillees = v_minutes_travaillees + 1
		end if
	next
	
//	// pour une trace des calculs
//	if v_code_praticien = "AR" then
//		// Génération d'un fichier trace par mois pour les calculs
//		string v_nom_fichier , v_nom_praticien
//		integer v_numero_fichier 
//		long v_minutes_jour, v_minutes_mois
//		integer v_jour
//		
//		v_nom_fichier = dir_ini + "trace_tps_travaille_"+ trim(v_code_praticien)+"-"+string(v_annee)+"-"+string(v_mois)+".txt"
//		
//		select nom into :v_nom_praticien from prati where code  = :v_code_praticien ;
//		v_numero_fichier = fileOpen(v_nom_fichier , LineMode!, write!, LockReadWrite! , replace!)
//		
//		FileWrite(v_numero_fichier, string(today()) + " - " + string(now()) + " - Praticien : " + v_code_praticien + " - " + v_nom_praticien + " - Mois : " + string(v_mois) + "-" + string(v_annee))
//		FileWrite(v_numero_fichier,"")
//		
//		v_minutes_jour = 0
//		v_minutes_mois = 0
//		for i = 1 to indice_maxi_tab
//			
//			if minutes_journee[i] = 1 then
//				v_minutes_jour = v_minutes_jour + 1
//			end if
//			
//			if mod( i , 1440) = 0 then 
//				// on a finit une journee
//				v_jour = i / 1440
//				FileWrite(v_numero_fichier, string(v_jour) + " : " + string(v_minutes_jour) + " mn soit " + string (v_minutes_jour / 60, "0.00") + " h")
//				v_minutes_mois  = v_minutes_mois + v_minutes_jour
//				v_minutes_jour = 0
//			end if
//		next
//
//		FileWrite(v_numero_fichier,"")
//		FileWrite(v_numero_fichier, "Total : " + string(v_minutes_mois) + " mn soit " + string (v_minutes_mois / 60, "0.00") + " h")
//		
//		fileclose(v_numero_fichier)
//		
//	end if
	
	v_minutes_travaillees_totales = v_minutes_travaillees_totales + v_minutes_travaillees 
				
	v_mois = v_mois + 1
	if v_mois = 13 then
		v_annee = v_annee + 1
		v_mois = 1 
	end if
loop


v_heures_travaillees = v_minutes_travaillees_totales / 60

return v_heures_travaillees
end function

on w_tableau_bord_temps_praticien.create
int iCurrent
call super::create
this.rb_une_annee=create rb_une_annee
this.rb_plusieurs_annees=create rb_plusieurs_annees
this.em_annee_min=create em_annee_min
this.em_annee_max=create em_annee_max
this.st_de=create st_de
this.st_a=create st_a
this.cb_exporter=create cb_exporter
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_une_annee
this.Control[iCurrent+2]=this.rb_plusieurs_annees
this.Control[iCurrent+3]=this.em_annee_min
this.Control[iCurrent+4]=this.em_annee_max
this.Control[iCurrent+5]=this.st_de
this.Control[iCurrent+6]=this.st_a
this.Control[iCurrent+7]=this.cb_exporter
this.Control[iCurrent+8]=this.gb_2
end on

on w_tableau_bord_temps_praticien.destroy
call super::destroy
destroy(this.rb_une_annee)
destroy(this.rb_plusieurs_annees)
destroy(this.em_annee_min)
destroy(this.em_annee_max)
destroy(this.st_de)
destroy(this.st_a)
destroy(this.cb_exporter)
destroy(this.gb_2)
end on

event open;call super::open;

em_min.text = string(min)
em_max.text = '999999999'

em_annee_min.text = string(year(today()))
em_annee_max.text = em_annee_min.text 
end event

type p_fond from w_liste_patients`p_fond within w_tableau_bord_temps_praticien
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_tableau_bord_temps_praticien
end type

type cb_autre from w_liste_patients`cb_autre within w_tableau_bord_temps_praticien
end type

event cb_autre::clicked;call super::clicked;
cb_exporter.enabled ( false)

if rb_plusieurs_annees.checked then
	st_de.visible = true
	st_a.visible = true
end if

em_min.visible = false
em_max.visible = false

st_min.visible = false
st_max.visible = false
end event

type cb_fermer from w_liste_patients`cb_fermer within w_tableau_bord_temps_praticien
integer x = 2665
end type

type cb_ecran from w_liste_patients`cb_ecran within w_tableau_bord_temps_praticien
end type

event cb_ecran::clicked;prepa()

if dw_liste.visible then
	
	this.enabled ( false )
	cb_imprimer.enabled ( true )
	cb_exporter.enabled ( true )
	cb_autre.enabled ( true )
	cb_lien_word.enabled ( true )
	this.default ( false )
	cb_exporter.default ( true)
	
	composant_visible_selon_tag(parent , "a masquer", false)
end if
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_tableau_bord_temps_praticien
end type

type uo_size from w_liste_patients`uo_size within w_tableau_bord_temps_praticien
end type

type rb_un from w_liste_patients`rb_un within w_tableau_bord_temps_praticien
end type

type rb_tous from w_liste_patients`rb_tous within w_tableau_bord_temps_praticien
end type

type em_nb from w_liste_patients`em_nb within w_tableau_bord_temps_praticien
end type

type em_max from w_liste_patients`em_max within w_tableau_bord_temps_praticien
boolean visible = false
end type

type em_min from w_liste_patients`em_min within w_tableau_bord_temps_praticien
boolean visible = false
end type

type dw_1 from w_liste_patients`dw_1 within w_tableau_bord_temps_praticien
end type

type gb_1 from w_liste_patients`gb_1 within w_tableau_bord_temps_praticien
end type

type dw_prati from w_liste_patients`dw_prati within w_tableau_bord_temps_praticien
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_tableau_bord_temps_praticien
end type

type st_min from w_liste_patients`st_min within w_tableau_bord_temps_praticien
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_tableau_bord_temps_praticien
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_tableau_bord_temps_praticien
integer y = 32
string dataobject = "dw_tableau_bord_synthese_annuelle"
end type

event dw_liste::doubleclicked;w_graph_tableau_bord_synthese_annee w_graph

w_mdi_2020.uo_powerdock.of_openDocument(w_graph, "Graphique", image_menu_listes_graphiques   )

w_graph.dw_graph.reset()

// on remplit les éléments du graphique
integer col = 1
boolean fin = false

w_graph.title = dw_liste.getitemString(row, "libelle")



// Titre du graph
w_graph.dw_graph.Object.gr_1.Title = w_graph.title
// Titre du bas
w_graph.dw_graph.Object.gr_1.category.label = "Temps"

// Titre du bas
w_graph.dw_graph.Object.gr_1.values.label = dw_liste.getitemString(row, "unite")

do while col <= 12 and not fin
	
	if not isnull(dw_liste.getitemnumber(row, "valeur"+string(col))) then
		w_graph.dw_graph.insertrow(9999)
		w_graph.dw_graph.setitem(col, "valeur",dw_liste.getitemnumber(row, "valeur"+string(col)))
		
		if rb_une_annee.checked then
			w_graph.dw_graph.setitem(col, "libelle",string(col,'00')+" - "+em_annee_min.text)
		else
			w_graph.dw_graph.setitem(col, "libelle",  dw_liste.describe("valeur"+string(col)+"_t.text"))
		end if
	else
		fin = true
	end if
	
	col = col + 1
	
loop


//w_graph_tableau_bord_synthese_annee.dw_graph.//()
end event

event dw_liste::rbuttondown;

//


end event

type rb_une_annee from radiobutton within w_tableau_bord_temps_praticien
integer x = 398
integer y = 1160
integer width = 677
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
string text = "Détail d~'une année"
boolean checked = true
end type

event clicked;

if checked then
	
	st_de.visible = false
	st_a.visible = false
	em_annee_max.visible = false
	
end if
end event

type rb_plusieurs_annees from radiobutton within w_tableau_bord_temps_praticien
integer x = 398
integer y = 1288
integer width = 896
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
string text = "Synthese plusieurs années"
end type

event clicked;

if checked then
	
	st_de.visible = true
	st_a.visible = true
	em_annee_max.visible = true
	
end if
end event

type em_annee_min from editmask within w_tableau_bord_temps_praticien
integer x = 1774
integer y = 1144
integer width = 311
integer height = 100
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "2012"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

type em_annee_max from editmask within w_tableau_bord_temps_praticien
boolean visible = false
integer x = 1774
integer y = 1272
integer width = 311
integer height = 100
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "2012"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "####"
boolean spin = true
end type

type st_de from statictext within w_tableau_bord_temps_praticien
boolean visible = false
integer x = 1605
integer y = 1160
integer width = 133
integer height = 72
boolean bringtotop = true
integer textsize = -10
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "De"
boolean focusrectangle = false
end type

type st_a from statictext within w_tableau_bord_temps_praticien
boolean visible = false
integer x = 1605
integer y = 1288
integer width = 133
integer height = 72
boolean bringtotop = true
integer textsize = -10
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "A"
boolean focusrectangle = false
end type

type cb_exporter from uo_picturebutton_390x120 within w_tableau_bord_temps_praticien
integer x = 2199
integer y = 1868
integer width = 457
integer taborder = 100
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;dw_liste.saveAs()
end event

type gb_2 from groupbox within w_tableau_bord_temps_praticien
integer x = 325
integer y = 1044
integer width = 2085
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Mode de calcul"
end type

