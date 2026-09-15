$PBExportHeader$w_graph_analyse_temps_passes_tranche_js.srw
forward
global type w_graph_analyse_temps_passes_tranche_js from w_graph_dossiers_praticiens_js
end type
type em_date_min from editmask within w_graph_analyse_temps_passes_tranche_js
end type
type st_11 from statictext within w_graph_analyse_temps_passes_tranche_js
end type
type em_date_max from editmask within w_graph_analyse_temps_passes_tranche_js
end type
type st_111 from statictext within w_graph_analyse_temps_passes_tranche_js
end type
type st_3 from statictext within w_graph_analyse_temps_passes_tranche_js
end type
type st_4 from statictext within w_graph_analyse_temps_passes_tranche_js
end type
type dw_etat1 from datawindow within w_graph_analyse_temps_passes_tranche_js
end type
type dw_etat2 from datawindow within w_graph_analyse_temps_passes_tranche_js
end type
type rb_etat1 from radiobutton within w_graph_analyse_temps_passes_tranche_js
end type
type rb_rdv1 from radiobutton within w_graph_analyse_temps_passes_tranche_js
end type
type rb_rdv2 from radiobutton within w_graph_analyse_temps_passes_tranche_js
end type
type rb_etat2 from radiobutton within w_graph_analyse_temps_passes_tranche_js
end type
type gb_2 from groupbox within w_graph_analyse_temps_passes_tranche_js
end type
type gb_3 from groupbox within w_graph_analyse_temps_passes_tranche_js
end type
end forward

global type w_graph_analyse_temps_passes_tranche_js from w_graph_dossiers_praticiens_js
em_date_min em_date_min
st_11 st_11
em_date_max em_date_max
st_111 st_111
st_3 st_3
st_4 st_4
dw_etat1 dw_etat1
dw_etat2 dw_etat2
rb_etat1 rb_etat1
rb_rdv1 rb_rdv1
rb_rdv2 rb_rdv2
rb_etat2 rb_etat2
gb_2 gb_2
gb_3 gb_3
end type
global w_graph_analyse_temps_passes_tranche_js w_graph_analyse_temps_passes_tranche_js

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();
string pra_min,pra_max,typ,titre1,titre2,titre3,titre4,p,e1,e2
double code_min,code_max
date date_min,date_max
string etat1, etat2




// 4 cas de figures
// 1 - Etat1 -> Etat2 	
// 2 - Etat1 -> Heure RDV : ponctualité patient
// 3 - Heure RDV -> Etat2 : ponctualié cabinet
// 4 - Heure RDV -> Heure RDV : Crétin !!!

integer cas_figure 

if rb_etat1.checked and rb_etat2.checked then
	cas_figure = 1
else
	if rb_etat1.checked and rb_rdv2.checked then
		cas_figure = 2
	else
		if rb_etat2.checked and rb_rdv1.checked then
			cas_figure = 3
		else
			cas_figure = 4		// c'est un faux cas en fait !!!
		end if
	end if
end if



if cas_figure = 4 then
	Messagebox("ATTENTION","Vous ne pouvez pas choisir l'Heure du Rendez-vous comme Etape 1 ET comme Etape 2")
else
	

	
	if not prepa_faite then
		
	//	prepa_faite = true
		
		titre1 = "Analyse des Temps Passés  du "+string( em_date_min.text )+" au "+string( em_date_max.text )
	
		
		if rb_tous.checked then
			pra_min="      "
			pra_max="ZZZZZZ"
			titre2 = "Pour tous les praticiens"
		else
			pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
			pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
			SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
			titre2 = "Pour le Dr "+p
		end if
	
		code_min = double(em_min.text)
		code_max = double(em_max.text)
	
		etat1 = dw_etat1.gettext()
		etat2 = dw_etat2.gettext()
	
		select nom into :e1 from etat_rdv where code = :etat1 ;
		select nom into :e2 from etat_rdv where code = :etat2 ;
		
		date_min =  date(em_date_min.text)
		date_max = date(em_date_max.text)
	
	
		
		if cas_figure = 1 then
			titre3 = 'Passage de l'+"'"+'état '+ e1 +' à l'+"'"+'état '+ e2
			titre4 = 'Passage de '+ e1 +' à '+ e2 
		else
			if cas_figure = 2 then
				titre3 = 'Calcul entre l'+"'"+'état '+ e1 +" et l'Heure du Rendez-vous"
				titre4 = 'Calcul entre '+ e1 +" et l'Heure du Rendez-vous"
			else
				titre3 = "Calcul entre l'Heure du rendez-vous et l'"+"'"+'état '+ e2 
				titre4 = "Calcul entre l'Heure du Rendez-vous et "+ e2
			end if

		end if
	
		open(w_patience)
	
		
		
		// Calcul pour chaque type de rdv ...
		long cpt, tot
		string v_type, v_type_prec
		
		datetime v_temps_etat1, v_temps_etat2
	
		double v_code_interne
		long v_temps_rdv
		time v_arrivee
		datetime v_rdv
		
		tot = dw_liste.rowcount()
		
		// Curseur pour parcourir les rdv et faire les calcul, type par type
	
		DECLARE cur_rdv CURSOR FOR 
		SELECT rdv.code_interne , rdv."type", "rdv"."rdv", "rdv"."arrivee"  
		from rdv, patient , etat_rdv
			where cast (rdv.rdv as date)  between :date_min and :date_max 
			and 	rdv.code_praticien between :pra_min and :pra_max 
					and patient.numero_dossier between :code_min and :code_max and
					rdv.code = patient.code and rdv.absent = etat_rdv.code and etat_rdv.elimine_agenda <> 'O' 
				order by rdv."type" ASC ;

//		long v_totrdv
//		SELECT count(*) into :v_totrdv from rdv , patient 
//			where cast (rdv.rdv as date)  between :date_min and :date_max 
//			and 	rdv.code_praticien between :pra_min and :pra_max 
//					and patient.numero_dossier between :code_min and :code_max  and
//					rdv.code = patient.code;

//		DECLARE cur_rdv CURSOR FOR 
//		SELECT rdv.code_interne , rdv."type" from rdv , historique_etat_rdv as historique_etat_rdv1, historique_etat_rdv as historique_etat_rdv2 
//			where cast (rdv.rdv as date)  between :date_min and :date_max 
//			and 	code_praticien between :pra_min and :pra_max 
//					and code between :code_min and :code_max
//					and rdv.code_interne = historique_etat_rdv1.code_interne and historique_etat_rdv1.etat = :etat1
//					and rdv.code_interne = historique_etat_rdv2.code_interne and historique_etat_rdv2.etat = :etat2
//				order by rdv."type" ASC ;
//		
//		DECLARE cur_rdv2 CURSOR FOR 
//		SELECT rdv.code_interne , rdv."type" from rdv , historique_etat_rdv as historique_etat_rdv1, historique_etat_rdv as historique_etat_rdv2 
//			where cast (rdv.rdv as date)  between :date_min and :date_max 
//			and 	code_praticien between :pra_min and :pra_max 
//					and code between :code_min and :code_max
//					and rdv.code_interne = historique_etat_rdv1.code_interne and historique_etat_rdv1.etat = :etat1
//				order by rdv."type" ASC ;
//
//	DECLARE cur_rdv3 CURSOR FOR 
//		SELECT rdv.code_interne , rdv."type" from rdv , historique_etat_rdv as historique_etat_rdv1, historique_etat_rdv as historique_etat_rdv2 
//			where cast (rdv.rdv as date)  between :date_min and :date_max 
//			and 	code_praticien between :pra_min and :pra_max 
//					and code between :code_min and :code_max
//					and rdv.code_interne = historique_etat_rdv2.code_interne and historique_etat_rdv2.etat = :etat2
//				order by rdv."type" ASC ;
	
		
		// pour le stockage des valeurs
	
		// Table temporaire
		string commande 
		string s_libelle_tranche
		
		commande = "create global temporary table temp1 (tranche integer, libelle_tranche char(10),  nombre integer ) ;"
		execute immediate :commande ;
		
		for cpt = 1 to 14
			if cpt = 1 then
				s_libelle_tranche = "0"
			else
				if cpt = 14 then
					s_libelle_tranche = ">= 60"
				else
					s_libelle_tranche = "< " + string(5 * (cpt - 1))
				end if
			end if
			insert into temp1 values ( :cpt, :s_libelle_tranche, 0) ;
		next
	
		
		open cur_rdv ;
		fetch cur_rdv into :v_code_interne, :v_type , :v_rdv, :v_arrivee;
		
		long v_cpt_rdv = 1
		boolean a_calculer 
		
		do while sqlca.sqlcode = 0
						
			
			// On exclut certains RDV qui fausseraient les stats
			if cas_figure = 3 and time(v_rdv) < v_arrivee then
				// On teste la ponctualité du cabinet ... on vire les patients arrivés en retard
				a_calculer = false
			else
				a_calculer = true
			end if
			
			if a_calculer then
				setnull(v_temps_etat1)
				setnull(v_temps_etat2)
				
				if cas_figure = 1 or cas_figure = 2 then
					// temps etat1
					select min(date_modif) into :v_temps_etat1 from historique_etat_rdv where etat = :etat1 and round(code_interne,0) = :v_code_interne ;
				end if
				
				if cas_figure = 1 or cas_figure = 3 then
					// temps etat2
					select min(date_modif) into :v_temps_etat2  from historique_etat_rdv where etat = :etat2 and round(code_interne,0) = :v_code_interne ;
				end if
				
				if cas_figure = 2 then
					// temps etat2
					select min(rdv) into :v_temps_etat2  from rdv where round(code_interne,0) = :v_code_interne ;
				end if
				
				if cas_figure = 3 then
					// temps etat1
					select min(rdv) into :v_temps_etat1  from rdv where round(code_interne,0) = :v_code_interne ;
				end if
					
					
				if not isnull(v_temps_etat1) and not isnull(v_temps_etat1) then
					v_temps_rdv = secondsafter(time(v_temps_etat1), time(v_temps_etat2))
	
				
					// Détermination de la tranche dans laquelle on se trouve
														
					integer minutes, v_tranche
					
					minutes = round(v_temps_rdv / 60 , 0)
					
					if minutes = 0 then 
						v_tranche = 1
					else
						v_tranche = min ( int ((max(0, minutes) / 5)   )  + 2 , 14)
					end if
					
				
					//			messagebox("trace","Code interne : "+string(v_code_interne)+"~ntps Etat1 : "+string(v_temps_etat1)+"~nEtat2 : "+string(v_temps_etat2)+"~n~nTranche : "+string(v_tranche))		
					//em_nb.text = string(v_code_interne) + " - " + string(v_cpt_rdv) + "/ " +string(v_totrdv)
					//yield()
		
					v_cpt_rdv = v_cpt_rdv + 1
					
					update temp1 set nombre = nombre + 1 where tranche = :v_tranche ;
					
				end if
					
				end if
	
				fetch cur_rdv into :v_code_interne, :v_type , :v_rdv, :v_arrivee ;
		
			
			loop

			close cur_rdv ;

		
	
		
		// Mise en place de la liste sans calcul
		uo_chart.retrieve("")
		//dw_liste.retrieve()
		dw_tableau.retrieve()
	
		dw_tableau.modify('t_titre1.text = "'+ titre1+'"')
		dw_tableau.modify('t_titre2.text = "'+ titre2+'"')
		dw_tableau.modify('t_titre3.text = "'+ titre3+'"')
	
		dw_liste.object.gr_1.title = titre1 + " - "+ titre2 + "~n"+titre4
		//+ " - "+titre3
		
		
		close(w_patience)
		
		cb_exporter.enabled = true
		
		// Table temporaire
		commande = "drop table temp1 ;"
		execute immediate :commande ;
		
	
	end if
end if

end subroutine

on w_graph_analyse_temps_passes_tranche_js.create
int iCurrent
call super::create
this.em_date_min=create em_date_min
this.st_11=create st_11
this.em_date_max=create em_date_max
this.st_111=create st_111
this.st_3=create st_3
this.st_4=create st_4
this.dw_etat1=create dw_etat1
this.dw_etat2=create dw_etat2
this.rb_etat1=create rb_etat1
this.rb_rdv1=create rb_rdv1
this.rb_rdv2=create rb_rdv2
this.rb_etat2=create rb_etat2
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date_min
this.Control[iCurrent+2]=this.st_11
this.Control[iCurrent+3]=this.em_date_max
this.Control[iCurrent+4]=this.st_111
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.dw_etat1
this.Control[iCurrent+8]=this.dw_etat2
this.Control[iCurrent+9]=this.rb_etat1
this.Control[iCurrent+10]=this.rb_rdv1
this.Control[iCurrent+11]=this.rb_rdv2
this.Control[iCurrent+12]=this.rb_etat2
this.Control[iCurrent+13]=this.gb_2
this.Control[iCurrent+14]=this.gb_3
end on

on w_graph_analyse_temps_passes_tranche_js.destroy
call super::destroy
destroy(this.em_date_min)
destroy(this.st_11)
destroy(this.em_date_max)
destroy(this.st_111)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.dw_etat1)
destroy(this.dw_etat2)
destroy(this.rb_etat1)
destroy(this.rb_rdv1)
destroy(this.rb_rdv2)
destroy(this.rb_etat2)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;em_date_max.text = string(today())
em_date_min.text = string(date(year(today()),1,1))


dw_etat1.settransobject(sqlca)
dw_etat2.settransobject(sqlca)

dw_etat1.retrieve()
dw_etat2.retrieve()



end event

type p_fond from w_graph_dossiers_praticiens_js`p_fond within w_graph_analyse_temps_passes_tranche_js
end type

type cb_imprimer from w_graph_dossiers_praticiens_js`cb_imprimer within w_graph_analyse_temps_passes_tranche_js
end type

type cb_autre from w_graph_dossiers_praticiens_js`cb_autre within w_graph_analyse_temps_passes_tranche_js
end type

type cb_fermer from w_graph_dossiers_praticiens_js`cb_fermer within w_graph_analyse_temps_passes_tranche_js
end type

type cb_ecran from w_graph_dossiers_praticiens_js`cb_ecran within w_graph_analyse_temps_passes_tranche_js
end type

type cb_lien_word from w_graph_dossiers_praticiens_js`cb_lien_word within w_graph_analyse_temps_passes_tranche_js
end type

type uo_size from w_graph_dossiers_praticiens_js`uo_size within w_graph_analyse_temps_passes_tranche_js
end type

type rb_un from w_graph_dossiers_praticiens_js`rb_un within w_graph_analyse_temps_passes_tranche_js
end type

type rb_tous from w_graph_dossiers_praticiens_js`rb_tous within w_graph_analyse_temps_passes_tranche_js
end type

type em_nb from w_graph_dossiers_praticiens_js`em_nb within w_graph_analyse_temps_passes_tranche_js
end type

type em_max from w_graph_dossiers_praticiens_js`em_max within w_graph_analyse_temps_passes_tranche_js
end type

type em_min from w_graph_dossiers_praticiens_js`em_min within w_graph_analyse_temps_passes_tranche_js
end type

type dw_1 from w_graph_dossiers_praticiens_js`dw_1 within w_graph_analyse_temps_passes_tranche_js
end type

type gb_1 from w_graph_dossiers_praticiens_js`gb_1 within w_graph_analyse_temps_passes_tranche_js
end type

type dw_prati from w_graph_dossiers_praticiens_js`dw_prati within w_graph_analyse_temps_passes_tranche_js
end type

type cbx_filtre from w_graph_dossiers_praticiens_js`cbx_filtre within w_graph_analyse_temps_passes_tranche_js
end type

type st_min from w_graph_dossiers_praticiens_js`st_min within w_graph_analyse_temps_passes_tranche_js
end type

type st_max from w_graph_dossiers_praticiens_js`st_max within w_graph_analyse_temps_passes_tranche_js
end type

type dw_liste from w_graph_dossiers_praticiens_js`dw_liste within w_graph_analyse_temps_passes_tranche_js
end type

type em_date1 from w_graph_dossiers_praticiens_js`em_date1 within w_graph_analyse_temps_passes_tranche_js
boolean visible = false
end type

type st_2 from w_graph_dossiers_praticiens_js`st_2 within w_graph_analyse_temps_passes_tranche_js
boolean visible = false
end type

type dw_tableau from w_graph_dossiers_praticiens_js`dw_tableau within w_graph_analyse_temps_passes_tranche_js
string dataobject = "dw_graph_analyse_temps_passes_tranche_liste"
end type

type cb_tableau from w_graph_dossiers_praticiens_js`cb_tableau within w_graph_analyse_temps_passes_tranche_js
end type

type cb_exporter from w_graph_dossiers_praticiens_js`cb_exporter within w_graph_analyse_temps_passes_tranche_js
end type

type uo_chart from w_graph_dossiers_praticiens_js`uo_chart within w_graph_analyse_temps_passes_tranche_js
string graphobject = "gr_graph_analyse_temps_passes_tranche_js"
end type

type st_type_graphique from w_graph_dossiers_praticiens_js`st_type_graphique within w_graph_analyse_temps_passes_tranche_js
end type

type ddlb_type_graphique from w_graph_dossiers_praticiens_js`ddlb_type_graphique within w_graph_analyse_temps_passes_tranche_js
end type

type em_date_min from editmask within w_graph_analyse_temps_passes_tranche_js
integer x = 805
integer y = 1088
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
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_11 from statictext within w_graph_analyse_temps_passes_tranche_js
integer x = 347
integer y = 976
integer width = 1015
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Dates de rendez-vous :"
end type

type em_date_max from editmask within w_graph_analyse_temps_passes_tranche_js
integer x = 1682
integer y = 1088
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
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_111 from statictext within w_graph_analyse_temps_passes_tranche_js
integer x = 1317
integer y = 1100
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_graph_analyse_temps_passes_tranche_js
integer x = 475
integer y = 1100
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Entre le "
end type

type st_4 from statictext within w_graph_analyse_temps_passes_tranche_js
string tag = "a masquer"
integer x = 366
integer y = 1348
integer width = 626
integer height = 64
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 15780518
string text = "Temps d~'écart entre ;"
end type

type dw_etat1 from datawindow within w_graph_analyse_temps_passes_tranche_js
string tag = "no resizeall brush"
integer x = 640
integer y = 1584
integer width = 987
integer height = 76
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_etat_rdv"
boolean border = false
boolean livescroll = true
end type

type dw_etat2 from datawindow within w_graph_analyse_temps_passes_tranche_js
string tag = "no resizeall brush"
integer x = 2263
integer y = 1584
integer width = 987
integer height = 76
integer taborder = 80
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_etat_rdv"
boolean border = false
boolean livescroll = true
end type

type rb_etat1 from radiobutton within w_graph_analyse_temps_passes_tranche_js
integer x = 334
integer y = 1584
integer width = 293
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
string text = "Etat"
boolean checked = true
end type

event clicked;

if this.checked then 
	dw_etat1.visible = true
end if
end event

type rb_rdv1 from radiobutton within w_graph_analyse_temps_passes_tranche_js
integer x = 334
integer y = 1700
integer width = 718
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
string text = "Heure du rendez-vous"
end type

event clicked;

if this.checked then 
	dw_etat1.visible = false
end if
end event

type rb_rdv2 from radiobutton within w_graph_analyse_temps_passes_tranche_js
integer x = 1952
integer y = 1700
integer width = 718
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
string text = "Heure du rendez-vous"
end type

event clicked;



if this.checked then 
	dw_etat2.visible = false
end if
end event

type rb_etat2 from radiobutton within w_graph_analyse_temps_passes_tranche_js
integer x = 1952
integer y = 1584
integer width = 302
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
string text = "Etat"
boolean checked = true
end type

event clicked;

if this.checked then 
	dw_etat2.visible = true
end if
end event

type gb_2 from groupbox within w_graph_analyse_temps_passes_tranche_js
integer x = 270
integer y = 1492
integer width = 1600
integer height = 368
integer taborder = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Etape 1"
end type

type gb_3 from groupbox within w_graph_analyse_temps_passes_tranche_js
integer x = 1897
integer y = 1492
integer width = 1600
integer height = 368
integer taborder = 90
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Etape 2"
end type

