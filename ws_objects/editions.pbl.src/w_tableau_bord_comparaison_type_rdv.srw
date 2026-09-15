$PBExportHeader$w_tableau_bord_comparaison_type_rdv.srw
forward
global type w_tableau_bord_comparaison_type_rdv from w_liste_patients
end type
type em_annee_min from editmask within w_tableau_bord_comparaison_type_rdv
end type
type em_annee_max from editmask within w_tableau_bord_comparaison_type_rdv
end type
type cb_exporter from uo_picturebutton_390x120 within w_tableau_bord_comparaison_type_rdv
end type
type rb_une_annee from radiobutton within w_tableau_bord_comparaison_type_rdv
end type
type rb_plusieurs_annees from radiobutton within w_tableau_bord_comparaison_type_rdv
end type
type st_a from statictext within w_tableau_bord_comparaison_type_rdv
end type
type st_de from statictext within w_tableau_bord_comparaison_type_rdv
end type
type gb_3 from groupbox within w_tableau_bord_comparaison_type_rdv
end type
end forward

global type w_tableau_bord_comparaison_type_rdv from w_liste_patients
string title = "Tableau de Bord : Evolution des types de rendez-vous"
em_annee_min em_annee_min
em_annee_max em_annee_max
cb_exporter cb_exporter
rb_une_annee rb_une_annee
rb_plusieurs_annees rb_plusieurs_annees
st_a st_a
st_de st_de
gb_3 gb_3
end type
global w_tableau_bord_comparaison_type_rdv w_tableau_bord_comparaison_type_rdv

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max
long annee_min, annee_max

integer boucle_courante
date premier_janvier_annee_courante
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

	annee_min = long(em_annee_min.text)
	annee_max = long(em_annee_max.text)
	
	dw_liste.modify("t_total.visible = 0")
	
	// On efface les titres de colonnes au cas ou re calcul
	for  boucle = 1 to 12
		dw_liste.modify("valeur"+string(boucle)+"_t.text = ''")
	next
	
	
	v_suite = true
	

	
	// On vérifie la limite de 12 années étudiées
	if annee_max - annee_min >= 12 then
		Messagebox("ATTENTION","Ce tableau de bord ne peut être demandé que pour 12 années au maximum et non "+string(annee_max - annee_min + 1)+".~n~nSi besoin, vous devez procéder en plusieurs fois.")
		v_suite = false
		prepa_faite = false
	end if
		
		
	if v_suite then
		
		open(w_patience)
		dw_liste.visible = true
		dw_liste.reset()
		
		declare cur_type_rdv cursor for select code , nom from type_rdv where actif = 1 order by ordre_trie, nom  ;
		string v_code_type_rdv , v_nom_type_rdv 
		
		
		colonne = 0
		
		if rb_une_annee.checked then
			// travail sur le détail d'une année
			dw_liste.modify('t_titre.text = "EVOLUTION DES TYPES DE RENDEZ-VOUS DE L'+"'"+' ANNEE '+string(annee_min)+'"')
			boucle_min = 1 
			boucle_max = 12
		else
			// travail sur plusieurs annees
			dw_liste.modify('t_titre.text = "EVOLUTION DES TYPES DE RENDEZ-VOUS DE '+string(annee_min)+" à " +string(annee_max) + '"')
			boucle_min = annee_min 
			boucle_max = annee_max
		end if

		for  boucle = boucle_min to boucle_max
			// Mise à jour des noms des colonnes !!
			colonne = colonne + 1
			if rb_une_annee.checked then
				string a
				dw_liste.modify("valeur"+string(colonne)+"_t.text = '"+left(mois[boucle], 4)+"'")
			else
				dw_liste.modify("valeur"+string(colonne)+"_t.text = '"+string(boucle)+"'")
			end if
		next
	
	
		colonne = 0
		for boucle_courante = boucle_min to boucle_max
			
			colonne = colonne + 1
			
			w_patience.wf_setvalue( 100 / (boucle_min - boucle_min + 1)	)
			yield ()


		
			//dw_liste.modify("valeur"+string(colonne)+"_t.text = '"+string(annee_courante)+"'")

			
	
			// pour tout les types de rendez-vous  ....
			
			open cur_type_rdv ;
			fetch cur_type_rdv into :v_code_type_rdv, :v_nom_type_rdv ;
			
			do while sqlca.sqlcode = 0 
			
				if colonne = 1 then
				// Création de la ligne de calcul
					
					dw_liste.insertrow(9999)
					v_calcul = dw_liste.rowcount()
					dw_liste.scrolltorow(v_calcul)
						
					dw_liste.setitem(v_calcul, "totaliser", "N")
					dw_liste.setitem(v_calcul, "ordre", colonne * 10)
					dw_liste.setitem(v_calcul, "groupe", "")
					dw_liste.setitem(v_calcul, "libelle", v_nom_type_rdv)
					dw_liste.setitem(v_calcul, "unite", "Nombre de rendez-vous")
					dw_liste.setitem(v_calcul, "tooltips", "Se base sur le type de rendez-vous du rendez-vous.")
				else
					if pos(v_nom_type_rdv, "'") > 0 then
						// il y a une ' on met des " 
						v_calcul  = dw_liste.Find('libelle = "'+v_nom_type_rdv+'"', 0, 9999)
					else
						v_calcul  = dw_liste.Find("libelle = '"+v_nom_type_rdv+"'", 0, 9999)
					end if
				end if
				
				if rb_une_annee.checked then 
					select isnull(count(*),0) into :v_valeur from rdv 
					where "type" = :v_code_type_rdv and code_praticien between :pra_min and :pra_max and year(rdv) = :annee_min and month(rdv) = :boucle_courante ;
				else
					select isnull(count(*),0) into :v_valeur from rdv 
					where "type" = :v_code_type_rdv and code_praticien between :pra_min and :pra_max and year(rdv) = :boucle_courante ;
				end if
				
				dw_liste.setitem(v_calcul, "valeur"+string(colonne), v_valeur)
		
				
				fetch cur_type_rdv into :v_code_type_rdv, :v_nom_type_rdv ;
			
			loop
		
			close cur_type_rdv ;
		next
		
		
		if rb_une_annee.checked then 
		end if

		
		
				
		dw_liste.sort()
		dw_liste.groupcalc()
		
		cb_exporter.visible = true
			
		close(w_patience)

	end if
	
end if

end subroutine

on w_tableau_bord_comparaison_type_rdv.create
int iCurrent
call super::create
this.em_annee_min=create em_annee_min
this.em_annee_max=create em_annee_max
this.cb_exporter=create cb_exporter
this.rb_une_annee=create rb_une_annee
this.rb_plusieurs_annees=create rb_plusieurs_annees
this.st_a=create st_a
this.st_de=create st_de
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_annee_min
this.Control[iCurrent+2]=this.em_annee_max
this.Control[iCurrent+3]=this.cb_exporter
this.Control[iCurrent+4]=this.rb_une_annee
this.Control[iCurrent+5]=this.rb_plusieurs_annees
this.Control[iCurrent+6]=this.st_a
this.Control[iCurrent+7]=this.st_de
this.Control[iCurrent+8]=this.gb_3
end on

on w_tableau_bord_comparaison_type_rdv.destroy
call super::destroy
destroy(this.em_annee_min)
destroy(this.em_annee_max)
destroy(this.cb_exporter)
destroy(this.rb_une_annee)
destroy(this.rb_plusieurs_annees)
destroy(this.st_a)
destroy(this.st_de)
destroy(this.gb_3)
end on

event open;call super::open;



em_annee_min.text  = string(year(today()) - 5)
em_annee_max.text  = string(year(today()) + 1)
end event

type p_fond from w_liste_patients`p_fond within w_tableau_bord_comparaison_type_rdv
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_tableau_bord_comparaison_type_rdv
end type

type cb_autre from w_liste_patients`cb_autre within w_tableau_bord_comparaison_type_rdv
end type

event cb_autre::clicked;call super::clicked;
cb_exporter.enabled ( false)


end event

type cb_fermer from w_liste_patients`cb_fermer within w_tableau_bord_comparaison_type_rdv
integer x = 2665
end type

type cb_ecran from w_liste_patients`cb_ecran within w_tableau_bord_comparaison_type_rdv
end type

event cb_ecran::clicked;prepa()

if dw_liste.visible then
	
	this.enabled = false
	cb_imprimer.enabled ( true)
	cb_exporter.enabled ( true)
	cb_autre.enabled ( true)
	cb_lien_word.enabled ( true)
	this.default ( false)
	cb_exporter.default ( true)
	
	//composant_visible_selon_tag(parent , "a masquer", false)
end if
end event

type cb_lien_word from w_liste_patients`cb_lien_word within w_tableau_bord_comparaison_type_rdv
end type

type uo_size from w_liste_patients`uo_size within w_tableau_bord_comparaison_type_rdv
end type

type rb_un from w_liste_patients`rb_un within w_tableau_bord_comparaison_type_rdv
end type

type rb_tous from w_liste_patients`rb_tous within w_tableau_bord_comparaison_type_rdv
end type

type em_nb from w_liste_patients`em_nb within w_tableau_bord_comparaison_type_rdv
end type

type em_max from w_liste_patients`em_max within w_tableau_bord_comparaison_type_rdv
string tag = ""
boolean visible = false
end type

type em_min from w_liste_patients`em_min within w_tableau_bord_comparaison_type_rdv
string tag = ""
boolean visible = false
end type

type dw_1 from w_liste_patients`dw_1 within w_tableau_bord_comparaison_type_rdv
end type

type gb_1 from w_liste_patients`gb_1 within w_tableau_bord_comparaison_type_rdv
end type

type dw_prati from w_liste_patients`dw_prati within w_tableau_bord_comparaison_type_rdv
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_tableau_bord_comparaison_type_rdv
end type

type st_min from w_liste_patients`st_min within w_tableau_bord_comparaison_type_rdv
boolean visible = false
end type

type st_max from w_liste_patients`st_max within w_tableau_bord_comparaison_type_rdv
boolean visible = false
end type

type dw_liste from w_liste_patients`dw_liste within w_tableau_bord_comparaison_type_rdv
integer x = 5
integer y = 4
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
		
		w_graph.dw_graph.setitem(col, "libelle",  dw_liste.describe("valeur"+string(col)+"_t.text"))
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

type em_annee_min from editmask within w_tableau_bord_comparaison_type_rdv
integer x = 1705
integer y = 1136
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

type em_annee_max from editmask within w_tableau_bord_comparaison_type_rdv
boolean visible = false
integer x = 1710
integer y = 1276
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

type cb_exporter from uo_picturebutton_390x120 within w_tableau_bord_comparaison_type_rdv
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

type rb_une_annee from radiobutton within w_tableau_bord_comparaison_type_rdv
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

type rb_plusieurs_annees from radiobutton within w_tableau_bord_comparaison_type_rdv
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

type st_a from statictext within w_tableau_bord_comparaison_type_rdv
boolean visible = false
integer x = 1605
integer y = 1288
integer width = 96
integer height = 72
boolean bringtotop = true
integer textsize = -10
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "A"
boolean focusrectangle = false
end type

type st_de from statictext within w_tableau_bord_comparaison_type_rdv
boolean visible = false
integer x = 1605
integer y = 1160
integer width = 96
integer height = 72
boolean bringtotop = true
integer textsize = -10
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "De"
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_tableau_bord_comparaison_type_rdv
integer x = 325
integer y = 1044
integer width = 2085
integer height = 400
integer taborder = 40
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

