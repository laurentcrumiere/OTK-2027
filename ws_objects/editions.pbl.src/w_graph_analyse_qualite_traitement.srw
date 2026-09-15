$PBExportHeader$w_graph_analyse_qualite_traitement.srw
$PBExportComments$Héritée de liste_patients
forward
global type w_graph_analyse_qualite_traitement from w_graph_dossiers_praticiens
end type
type em_date_min from editmask within w_graph_analyse_qualite_traitement
end type
type st_11 from statictext within w_graph_analyse_qualite_traitement
end type
type em_date_max from editmask within w_graph_analyse_qualite_traitement
end type
type st_111 from statictext within w_graph_analyse_qualite_traitement
end type
type st_3 from statictext within w_graph_analyse_qualite_traitement
end type
type rb_tous_motifs from radiobutton within w_graph_analyse_qualite_traitement
end type
type rb_un_motif from radiobutton within w_graph_analyse_qualite_traitement
end type
type dw_motif from datawindow within w_graph_analyse_qualite_traitement
end type
type gb_motif from groupbox within w_graph_analyse_qualite_traitement
end type
end forward

global type w_graph_analyse_qualite_traitement from w_graph_dossiers_praticiens
string title = "Analyse de la Qualité de Traitement"
em_date_min em_date_min
st_11 st_11
em_date_max em_date_max
st_111 st_111
st_3 st_3
rb_tous_motifs rb_tous_motifs
rb_un_motif rb_un_motif
dw_motif dw_motif
gb_motif gb_motif
end type
global w_graph_analyse_qualite_traitement w_graph_analyse_qualite_traitement

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max,pra_nom
double code_min,code_max
date date_min,date_max
long motif1, motif2


//if not prepa_faite then
//	prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)


	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)


	if rb_tous_motifs.checked  then
		motif1 = 0
		motif2 = 999999999
	else
		motif1 = long(dw_motif.gettext())
		motif2 = motif1
	end if
	
	
	open(w_patience)
	
	integer a
	a = 1
	
	// Table temporaire
	string commande 
	commande = "create global temporary table temp1 (code_praticien char(6), code_qualite double, nombre integer ) ;"
	execute immediate :commande ;
	
	
	// On remplit la table avec croisement table délai et praticien 
	declare remplir_curtemp1 cursor for select prati.code, qualite_traitement.code 
	from prati, qualite_traitement 
	where qualite_traitement.actif = 1 and prati.actif = 1 and 	prati.code between :pra_min and :pra_max ;
	
	string v_prati_code, v_prati_code_prec
	double v_qualite_code
	long v_total
	
	open remplir_curtemp1 ; 
	fetch remplir_curtemp1 into :v_prati_code , :v_qualite_code ;
	
	do while sqlca.sqlcode = 0
			insert into temp1 values ( :v_prati_code, :v_qualite_code , 0) ;
			fetch remplir_curtemp1 into :v_prati_code , :v_qualite_code ;
	loop
	close remplir_curtemp1;
	
	
//	select count(*) into :v_total from temp1 ;
//	Messagebox("trace temp1",v_total)
	
	// On va parcourir temp1 dans un certain ordre
	declare parcourir_curtemp1 cursor for select code_praticien, code_qualite 
	from temp1 order by code_praticien, code_qualite ;
	
	open parcourir_curtemp1 ;
	fetch parcourir_curtemp1 into :v_prati_code , :v_qualite_code ;
	
	
	do while sqlca.sqlcode = 0
			
			
			 select count(*) into :v_total from patient  where   "patient"."code" between :code_min and :code_max and "patient"."code_praticien" =:v_prati_code 
			  and "patient"."fin_traitement" between :date_min and :date_max and  "patient"."motif_fin_traitement" between :motif1 and :motif2  
			  and  :v_qualite_code = "patient"."qualite_traitement" ;
			
			update temp1 set nombre = nombre + :v_total where code_praticien =  :v_prati_code and code_qualite = :v_qualite_code   ;
			
			
			fetch parcourir_curtemp1 into :v_prati_code , :v_qualite_code ;

	loop
	close parcourir_curtemp1 ;

	
	
	
	
//	// Uniquement pour visuel de formation
//	open parcourir_curtemp1 ;
//	fetch parcourir_curtemp1 into :v_prati_code , :v_qualite_code ;
//	
//	
//	do while sqlca.sqlcode = 0
//			
//			
//			v_total = rand(45)
//			
//			update temp1 set nombre = nombre + :v_total where code_praticien =  :v_prati_code and code_qualite = :v_qualite_code   ;
//			
//			
//			fetch parcourir_curtemp1 into :v_prati_code , :v_qualite_code ;
//
//	loop
//	close parcourir_curtemp1 ;
//	// fin visuel de formation
	
	
	dw_liste.retrieve()
	dw_tableau.retrieve()
	close(w_patience)

//	em_nb.text = string(dw_liste.rowcount())+" Dossiers"
//	em_nb.visible = true

	// Table temporaire
	commande = "drop table temp1 ;"
	execute immediate :commande ;
	
	
	
//	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,motif1,motif2)
//	dw_tableau.retrieve(code_min,code_max,pra_min,pra_max,date_min,date_max,motif1,motif2)


//end if

end subroutine

on w_graph_analyse_qualite_traitement.create
int iCurrent
call super::create
this.em_date_min=create em_date_min
this.st_11=create st_11
this.em_date_max=create em_date_max
this.st_111=create st_111
this.st_3=create st_3
this.rb_tous_motifs=create rb_tous_motifs
this.rb_un_motif=create rb_un_motif
this.dw_motif=create dw_motif
this.gb_motif=create gb_motif
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.em_date_min
this.Control[iCurrent+2]=this.st_11
this.Control[iCurrent+3]=this.em_date_max
this.Control[iCurrent+4]=this.st_111
this.Control[iCurrent+5]=this.st_3
this.Control[iCurrent+6]=this.rb_tous_motifs
this.Control[iCurrent+7]=this.rb_un_motif
this.Control[iCurrent+8]=this.dw_motif
this.Control[iCurrent+9]=this.gb_motif
end on

on w_graph_analyse_qualite_traitement.destroy
call super::destroy
destroy(this.em_date_min)
destroy(this.st_11)
destroy(this.em_date_max)
destroy(this.st_111)
destroy(this.st_3)
destroy(this.rb_tous_motifs)
destroy(this.rb_un_motif)
destroy(this.dw_motif)
destroy(this.gb_motif)
end on

event open;call super::open;em_date_min.text = string(date(1900,1,1))
em_date_max.text = string(today())

dw_motif.settransobject(sqlca)
dw_motif.retrieve(sqlca)

end event

type p_fond from w_graph_dossiers_praticiens`p_fond within w_graph_analyse_qualite_traitement
end type

type cb_imprimer from w_graph_dossiers_praticiens`cb_imprimer within w_graph_analyse_qualite_traitement
end type

type cb_autre from w_graph_dossiers_praticiens`cb_autre within w_graph_analyse_qualite_traitement
end type

event cb_autre::clicked;call super::clicked;
st_2.visible = false


end event

type cb_fermer from w_graph_dossiers_praticiens`cb_fermer within w_graph_analyse_qualite_traitement
end type

type cb_ecran from w_graph_dossiers_praticiens`cb_ecran within w_graph_analyse_qualite_traitement
end type

type cb_lien_word from w_graph_dossiers_praticiens`cb_lien_word within w_graph_analyse_qualite_traitement
end type

type uo_size from w_graph_dossiers_praticiens`uo_size within w_graph_analyse_qualite_traitement
end type

type rb_un from w_graph_dossiers_praticiens`rb_un within w_graph_analyse_qualite_traitement
end type

type rb_tous from w_graph_dossiers_praticiens`rb_tous within w_graph_analyse_qualite_traitement
end type

type em_nb from w_graph_dossiers_praticiens`em_nb within w_graph_analyse_qualite_traitement
end type

type em_max from w_graph_dossiers_praticiens`em_max within w_graph_analyse_qualite_traitement
end type

type em_min from w_graph_dossiers_praticiens`em_min within w_graph_analyse_qualite_traitement
end type

type dw_1 from w_graph_dossiers_praticiens`dw_1 within w_graph_analyse_qualite_traitement
end type

type gb_1 from w_graph_dossiers_praticiens`gb_1 within w_graph_analyse_qualite_traitement
end type

type dw_prati from w_graph_dossiers_praticiens`dw_prati within w_graph_analyse_qualite_traitement
end type

type cbx_filtre from w_graph_dossiers_praticiens`cbx_filtre within w_graph_analyse_qualite_traitement
end type

type st_min from w_graph_dossiers_praticiens`st_min within w_graph_analyse_qualite_traitement
end type

type st_max from w_graph_dossiers_praticiens`st_max within w_graph_analyse_qualite_traitement
end type

type dw_liste from w_graph_dossiers_praticiens`dw_liste within w_graph_analyse_qualite_traitement
event creation_graphique pbm_dwngraphcreate
string dataobject = "dw_graph_qualite_traitement"
end type

event dw_liste::creation_graphique;//
//
//// Personnalisation du graph !!!
//
//declare cur_qualite CURSOR FOR SELECT nom, couleur from qualite_traitement ;
//
//string v_nom
//long v_couleur
//
//open cur_qualite ;
//
//fetch cur_qualite into :v_nom, :v_couleur ;
//
//do while sqlca.sqlcode = 0
//	
//	 this.SetSeriesStyle("gr_1", v_nom, LineColor!, v_couleur)
//	 this.SetSeriesStyle("gr_1", v_nom, Foreground!, v_couleur)
//	 this.SetSeriesStyle("gr_1", v_nom, Background!, v_couleur)
//	 
//	 
//	fetch cur_qualite into :v_nom, :v_couleur ;
//	
//loop
//
//
//close cur_qualite ;
//

end event

type em_date1 from w_graph_dossiers_praticiens`em_date1 within w_graph_analyse_qualite_traitement
boolean visible = false
end type

type st_2 from w_graph_dossiers_praticiens`st_2 within w_graph_analyse_qualite_traitement
boolean visible = false
end type

type dw_tableau from w_graph_dossiers_praticiens`dw_tableau within w_graph_analyse_qualite_traitement
string dataobject = "dw_tableau_qualite_traitement"
end type

type cb_tableau from w_graph_dossiers_praticiens`cb_tableau within w_graph_analyse_qualite_traitement
end type

type cb_exporter from w_graph_dossiers_praticiens`cb_exporter within w_graph_analyse_qualite_traitement
end type

type em_date_min from editmask within w_graph_analyse_qualite_traitement
integer x = 805
integer y = 944
integer width = 421
integer height = 96
integer taborder = 50
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

type st_11 from statictext within w_graph_analyse_qualite_traitement
string tag = "a masquer"
integer x = 347
integer y = 832
integer width = 1015
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Dates de fin de traitement réelles :"
end type

type em_date_max from editmask within w_graph_analyse_qualite_traitement
integer x = 1682
integer y = 944
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

type st_111 from statictext within w_graph_analyse_qualite_traitement
string tag = "a masquer"
integer x = 1317
integer y = 956
integer width = 247
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Et le"
alignment alignment = center!
end type

type st_3 from statictext within w_graph_analyse_qualite_traitement
string tag = "a masquer"
integer x = 475
integer y = 956
integer width = 256
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Entre le "
end type

type rb_tous_motifs from radiobutton within w_graph_analyse_qualite_traitement
integer x = 448
integer y = 1272
integer width = 512
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
string text = "Tous les motifs"
boolean checked = true
end type

event clicked;dw_motif.visible = false
end event

type rb_un_motif from radiobutton within w_graph_analyse_qualite_traitement
integer x = 448
integer y = 1376
integer width = 512
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
string text = "Un motif"
end type

event clicked;

dw_motif.visible = true
end event

type dw_motif from datawindow within w_graph_analyse_qualite_traitement
string tag = "no resizeall"
boolean visible = false
integer x = 1051
integer y = 1376
integer width = 1774
integer height = 72
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_motif_fin_traitement_cherche"
boolean border = false
boolean livescroll = true
end type

type gb_motif from groupbox within w_graph_analyse_qualite_traitement
integer x = 283
integer y = 1192
integer width = 2725
integer height = 304
integer taborder = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Motif de Fin de Traitement"
end type

