$PBExportHeader$w_graph_soins_suivis_js.srw
forward
global type w_graph_soins_suivis_js from w_graph_dossiers_praticiens_js
end type
type em_date_min from editmask within w_graph_soins_suivis_js
end type
type st_11 from statictext within w_graph_soins_suivis_js
end type
type em_date_max from editmask within w_graph_soins_suivis_js
end type
type st_111 from statictext within w_graph_soins_suivis_js
end type
type st_3 from statictext within w_graph_soins_suivis_js
end type
type rb_une_valeur_mois from radiobutton within w_graph_soins_suivis_js
end type
type rb_une_valeur_quinzaine from radiobutton within w_graph_soins_suivis_js
end type
type dw_tableau_moyennes from datawindow within w_graph_soins_suivis_js
end type
type gb_valeurs from groupbox within w_graph_soins_suivis_js
end type
end forward

global type w_graph_soins_suivis_js from w_graph_dossiers_praticiens_js
em_date_min em_date_min
st_11 st_11
em_date_max em_date_max
st_111 st_111
st_3 st_3
rb_une_valeur_mois rb_une_valeur_mois
rb_une_valeur_quinzaine rb_une_valeur_quinzaine
dw_tableau_moyennes dw_tableau_moyennes
gb_valeurs gb_valeurs
end type
global w_graph_soins_suivis_js w_graph_soins_suivis_js

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,pra_nom
double code_min,code_max
date date_min,date_max
string s_date_string

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


	date_min = date("01/"+em_date_min.text)
	date_max = date("28/"+em_date_max.text)

	open(w_patience)
	
	double v_code_soins_suivis
	integer v_numero_min, v_numero_max
	string v_code_soins
	integer cpt_detail, tot_detail, v_ordre_trie
	
	DECLARE cur_suivis CURSOR FOR SELECT code, ordre_trie FROM soins_suivis WHERE actif = 1 order by ordre_trie ;
	
	DECLARE cur_detail CURSOR FOR SELECT code_soins, numero_min, numero_max FROM soins_suivis_detail WHERE code_soins_suivis =  :v_code_soins_suivis ;
	
	
	
	
	delete from soins_suivis_statistiques ;
	
	if sqlca.sqlcode <> 0 then
		Messagebox("ATTENTION","Problème dans la mise en place de la table temporaire !")
	else
		date date_courante
		
		// Boucle pour toutes les date
		date_courante = date_min 
		
		do while date_courante <= date_max
			
			
			
			// pour pour tous les soins suivis ...
			open cur_suivis ;
			
			fetch cur_suivis into :v_code_soins_suivis, :v_ordre_trie  ;
			
			do while sqlca.sqlcode = 0
				
				
				tot_detail = 0
			
				// boucle pour le détail 
				open cur_detail ;
				
				fetch cur_detail into :v_code_soins, :v_numero_min, :v_numero_max ;
	
				do while sqlca.sqlcode = 0
					
					
					select isnull(count(*),0) into :cpt_detail  FROM "soins",  "patient",   "code_soins"  
					WHERE  ("patient"."code" = "soins"."code" ) and   ( "code_soins"."code" = "soins"."type" ) and  
						( "patient"."code_praticien" between :pra_min and :pra_max ) AND   "code_soins"."duree" > 0 AND  
						( :date_courante between "soins"."date_demande" and dateadd(day,"code_soins"."duree" * 30, "soins"."date_demande")) 
						and "soins"."type" = :v_code_soins and isnull("soins"."numero",0) between :v_numero_min and :v_numero_max;
				
					tot_detail = tot_detail + cpt_detail
					
					
					fetch cur_detail into :v_code_soins, :v_numero_min, :v_numero_max ;
					
				loop
				
		
				close cur_detail ;
			
				// Mémorisation dans la statistiques
				s_date_string = string(date_courante, "dd-mm-yyyy")

				insert into soins_suivis_statistiques (code_soins_suivis, "date", nombre, ordre_trie, "date_string")
				values (:v_code_soins_suivis, :date_courante, :tot_detail, :v_ordre_trie , :s_date_string) ;
			
				fetch cur_suivis into :v_code_soins_suivis, :v_ordre_trie ;
				
			loop
				
			
			close cur_suivis ;
			
		
			if rb_une_valeur_mois.checked then
				
				date_courante = date("01/"+right(string(relativedate(date_courante,32)),7))
				
			else
				
				if day(date_courante) = 1 then
					date_courante = relativedate(date_courante,14)
				else
					date_courante = date("01/"+right(string(relativedate(date_courante,20)),7))
				end if
				
				
			end if
			
		loop
		
		
		
// Pas de commit, c'est une table temporaire !!!		
		commit ;
		
		
			// Bidouille pour mise en place d'un ordre de tri aphabétique et non numérique pour utilisation dans graphique ou tableau
			
			boolean fini = false
			char v_ordre_trie_lettre = 'A'
			long v_min
			
			do while not fini
				
				select isnull(min(ordre_trie),-25000) into :v_min from soins_suivis_statistiques where  ordre_trie_lettre is null ; 
				
				if v_min > -25000 then
					update soins_suivis_statistiques set ordre_trie_lettre = :v_ordre_trie_lettre where ordre_trie = :v_min ;
					v_ordre_trie_lettre = char ( asc(v_ordre_trie_lettre) + 1)	// On avance d'une lettre
				else
					fini = true
				end if
				
			loop
			
		uo_chart.retrieve("")
		//dw_liste.retrieve()
		dw_tableau.retrieve()
		
		if serial = "87441" then
			// Spécifique pour Vigie du Cayla
//			dw_tableau_moyennes.SetTransObject(sqlca)
	//		dw_tableau_moyennes.retrieve()
		end if
	
		//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
		//em_nb.visible = true
	end if
	
	close(w_patience)
end if

end subroutine

on w_graph_soins_suivis_js.create
int iCurrent
call super::create
this.em_date_min=create em_date_min
this.st_11=create st_11
this.em_date_max=create em_date_max
this.st_111=create st_111
this.st_3=create st_3
this.rb_une_valeur_mois=create rb_une_valeur_mois
this.rb_une_valeur_quinzaine=create rb_une_valeur_quinzaine
this.dw_tableau_moyennes=create dw_tableau_moyennes
this.gb_valeurs=create gb_valeurs
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date_min
this.Control[iCurrent+2]=this.st_11
this.Control[iCurrent+3]=this.em_date_max
this.Control[iCurrent+4]=this.st_111
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.rb_une_valeur_mois
this.Control[iCurrent+7]=this.rb_une_valeur_quinzaine
this.Control[iCurrent+8]=this.dw_tableau_moyennes
this.Control[iCurrent+9]=this.gb_valeurs
end on

on w_graph_soins_suivis_js.destroy
call super::destroy
destroy(this.em_date_min)
destroy(this.st_11)
destroy(this.em_date_max)
destroy(this.st_111)
destroy(this.st_3)
destroy(this.rb_une_valeur_mois)
destroy(this.rb_une_valeur_quinzaine)
destroy(this.dw_tableau_moyennes)
destroy(this.gb_valeurs)
end on

event open;call super::open;em_date_min.text = "01/"+string(year(today()))
em_date_max.text = right(string(today()),7)
end event

type p_fond from w_graph_dossiers_praticiens_js`p_fond within w_graph_soins_suivis_js
end type

type cb_imprimer from w_graph_dossiers_praticiens_js`cb_imprimer within w_graph_soins_suivis_js
end type

type cb_autre from w_graph_dossiers_praticiens_js`cb_autre within w_graph_soins_suivis_js
end type

type cb_fermer from w_graph_dossiers_praticiens_js`cb_fermer within w_graph_soins_suivis_js
end type

type cb_ecran from w_graph_dossiers_praticiens_js`cb_ecran within w_graph_soins_suivis_js
end type

type cb_lien_word from w_graph_dossiers_praticiens_js`cb_lien_word within w_graph_soins_suivis_js
end type

type uo_size from w_graph_dossiers_praticiens_js`uo_size within w_graph_soins_suivis_js
end type

type rb_un from w_graph_dossiers_praticiens_js`rb_un within w_graph_soins_suivis_js
end type

type rb_tous from w_graph_dossiers_praticiens_js`rb_tous within w_graph_soins_suivis_js
end type

type em_nb from w_graph_dossiers_praticiens_js`em_nb within w_graph_soins_suivis_js
end type

type em_max from w_graph_dossiers_praticiens_js`em_max within w_graph_soins_suivis_js
end type

type em_min from w_graph_dossiers_praticiens_js`em_min within w_graph_soins_suivis_js
end type

type dw_1 from w_graph_dossiers_praticiens_js`dw_1 within w_graph_soins_suivis_js
end type

type gb_1 from w_graph_dossiers_praticiens_js`gb_1 within w_graph_soins_suivis_js
end type

type dw_prati from w_graph_dossiers_praticiens_js`dw_prati within w_graph_soins_suivis_js
end type

type cbx_filtre from w_graph_dossiers_praticiens_js`cbx_filtre within w_graph_soins_suivis_js
end type

type st_min from w_graph_dossiers_praticiens_js`st_min within w_graph_soins_suivis_js
end type

type st_max from w_graph_dossiers_praticiens_js`st_max within w_graph_soins_suivis_js
end type

type dw_liste from w_graph_dossiers_praticiens_js`dw_liste within w_graph_soins_suivis_js
end type

type em_date1 from w_graph_dossiers_praticiens_js`em_date1 within w_graph_soins_suivis_js
boolean visible = false
end type

type st_2 from w_graph_dossiers_praticiens_js`st_2 within w_graph_soins_suivis_js
boolean visible = false
end type

type dw_tableau from w_graph_dossiers_praticiens_js`dw_tableau within w_graph_soins_suivis_js
string dataobject = "dw_tableau_soins_suivis"
end type

type cb_tableau from w_graph_dossiers_praticiens_js`cb_tableau within w_graph_soins_suivis_js
end type

type cb_exporter from w_graph_dossiers_praticiens_js`cb_exporter within w_graph_soins_suivis_js
end type

type uo_chart from w_graph_dossiers_praticiens_js`uo_chart within w_graph_soins_suivis_js
string graphobject = "gr_graph_soins_suivis_js"
end type

type st_type_graphique from w_graph_dossiers_praticiens_js`st_type_graphique within w_graph_soins_suivis_js
end type

type ddlb_type_graphique from w_graph_dossiers_praticiens_js`ddlb_type_graphique within w_graph_soins_suivis_js
end type

type em_date_min from editmask within w_graph_soins_suivis_js
integer x = 805
integer y = 1024
integer width = 421
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_11 from statictext within w_graph_soins_suivis_js
integer x = 347
integer y = 912
integer width = 992
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Période à analyser (mois / année)"
end type

type em_date_max from editmask within w_graph_soins_suivis_js
integer x = 1682
integer y = 1024
integer width = 421
integer height = 96
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_111 from statictext within w_graph_soins_suivis_js
integer x = 1317
integer y = 1036
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et "
alignment alignment = center!
end type

type st_3 from statictext within w_graph_soins_suivis_js
integer x = 475
integer y = 1036
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre "
end type

type rb_une_valeur_mois from radiobutton within w_graph_soins_suivis_js
integer x = 425
integer y = 1428
integer width = 736
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
string text = "Une valeur par mois"
boolean checked = true
end type

type rb_une_valeur_quinzaine from radiobutton within w_graph_soins_suivis_js
integer x = 425
integer y = 1524
integer width = 818
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
string text = "Une valeur par quinzaine"
end type

type dw_tableau_moyennes from datawindow within w_graph_soins_suivis_js
boolean visible = false
integer x = 2382
integer y = 1160
integer width = 686
integer height = 400
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_tableau_soins_suivis_moyennes"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

type gb_valeurs from groupbox within w_graph_soins_suivis_js
integer x = 283
integer y = 1344
integer width = 2121
integer height = 304
integer taborder = 70
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Fréquence de calcul"
end type

