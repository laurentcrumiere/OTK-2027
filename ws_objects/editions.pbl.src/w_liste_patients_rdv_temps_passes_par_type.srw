$PBExportHeader$w_liste_patients_rdv_temps_passes_par_type.srw
forward
global type w_liste_patients_rdv_temps_passes_par_type from w_liste_patients
end type
type st_1 from statictext within w_liste_patients_rdv_temps_passes_par_type
end type
type st_2 from statictext within w_liste_patients_rdv_temps_passes_par_type
end type
type st_3 from statictext within w_liste_patients_rdv_temps_passes_par_type
end type
type st_4 from statictext within w_liste_patients_rdv_temps_passes_par_type
end type
type st_5 from statictext within w_liste_patients_rdv_temps_passes_par_type
end type
type st_6 from statictext within w_liste_patients_rdv_temps_passes_par_type
end type
type dw_etat1 from datawindow within w_liste_patients_rdv_temps_passes_par_type
end type
type dw_etat2 from datawindow within w_liste_patients_rdv_temps_passes_par_type
end type
type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_rdv_temps_passes_par_type
end type
type em_date_min from uo_date_calendrier within w_liste_patients_rdv_temps_passes_par_type
end type
type em_date_max from uo_date_calendrier within w_liste_patients_rdv_temps_passes_par_type
end type
type rb_un_utilisateur from radiobutton within w_liste_patients_rdv_temps_passes_par_type
end type
type rb_tous_utilisateurs from radiobutton within w_liste_patients_rdv_temps_passes_par_type
end type
type dw_utilisateur from datawindow within w_liste_patients_rdv_temps_passes_par_type
end type
type gb_2 from groupbox within w_liste_patients_rdv_temps_passes_par_type
end type
end forward

global type w_liste_patients_rdv_temps_passes_par_type from w_liste_patients
string title = "Analyse des Temps Passés par Type"
st_1 st_1
st_2 st_2
st_3 st_3
st_4 st_4
st_5 st_5
st_6 st_6
dw_etat1 dw_etat1
dw_etat2 dw_etat2
cb_exporter cb_exporter
em_date_min em_date_min
em_date_max em_date_max
rb_un_utilisateur rb_un_utilisateur
rb_tous_utilisateurs rb_tous_utilisateurs
dw_utilisateur dw_utilisateur
gb_2 gb_2
end type
global w_liste_patients_rdv_temps_passes_par_type w_liste_patients_rdv_temps_passes_par_type

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();
string pra_min,pra_max,typ,tit,p
double code_min,code_max
date date_min,date_max
string etat1, etat2
string user_min, user_max


if not prepa_faite then
	//prepa_faite = true
	if rb_tous.checked then
		pra_min="      "
		pra_max="ZZZZZZ"
		tit = "Pour tous les praticiens"
	else
		pra_min=dw_prati.getitemstring(dw_prati.getrow(),"code")
		pra_max=dw_prati.getitemstring(dw_prati.getrow(),"code")
		SELECT nom INTO :p FROM prati WHERE code = :pra_min ;
		tit = "Pour le Dr "+p
	end if

	
	if rb_tous_utilisateurs.checked then
		user_min=""
		user_max="ZZZZZZ"
		tit = tit + " - Pour tous les Utilisateurs"
	else
		user_min=dw_utilisateur.gettext()
		user_max=dw_utilisateur.gettext()
		SELECT nom INTO :p FROM utilisateurs WHERE code = :user_min ;
		tit = tit + " - Pour "+p
	end if

	code_min = double(em_min.text)
	code_max = double(em_max.text)

	etat1 = dw_etat1.gettext()
	etat2 = dw_etat2.gettext()

	date_min = date(em_date_min.text)
	date_max = date(em_date_max.text)

	open(w_patience)

	
	// Champ qui serve à stocker des data dans la datawindow
	update table_vide set v1 = '' , v2 = '', v3 = '' , v4 = '' ;
	commit ;


	dw_liste.object.titre_2.text = tit
	// Mise en place de la liste sans calcul
	dw_liste.retrieve(date_min, date_max,pra_min,pra_max, etat1, etat2)
	
	// Calcul pour chaque type de rdv ...
	long cpt, tot
	string v_type, v_type_prec
	
	double v_nombre
	double  v_mini, v_maxi, v_temps_total, v_temps_rdv, v_temps_total_global
	datetime v_temps_etat1, v_temps_etat2

	double v_code_interne
	
	tot = dw_liste.rowcount()
	
	// pour voir les mises à jour, au cas ou ce soit long
	dw_liste.visible = true
	
	
	// Curseur pour parcourir les rdv et faire les calcul, type par type
//	DECLARE cur_rdv CURSOR FOR SELECT code_interne  from rdv 
//		where cast (rdv.rdv as date)  between :date_min and :date_max 
//		and 	code_praticien between :pra_min and :pra_max 
//				and code between :code_min and :code_max
//				and rdv."type" = :v_type 
//				and rdv.code_interne in (select code_interne from historique_etat_rdv where rdv.code_interne = historique_etat_rdv.code_interne and etat = :etat1)
//				and rdv.code_interne in (select code_interne from historique_etat_rdv where rdv.code_interne = historique_etat_rdv.code_interne and etat = :etat2) ;
//

	
//	DECLARE cur_rdv CURSOR FOR 
//	SELECT rdv.code_interne  from rdv , historique_etat_rdv as historique_etat_rdv1, historique_etat_rdv as historique_etat_rdv2 
//		where cast (rdv.rdv as date)  between :date_min and :date_max 
//		and 	code_praticien between :pra_min and :pra_max 
//				and code between :code_min and :code_max
//				and rdv."type" = :v_type 
//				and rdv.code_interne = historique_etat_rdv1.code_interne and historique_etat_rdv1.etat = :etat1
//				and rdv.code_interne = historique_etat_rdv2.code_interne and historique_etat_rdv2.etat = :etat2 ;

	
	DECLARE cur_rdv CURSOR FOR 
	SELECT rdv.code_interne , rdv."type" from rdv , historique_etat_rdv as historique_etat_rdv1, historique_etat_rdv as historique_etat_rdv2 
		where cast (rdv.rdv as date)  between :date_min and :date_max 
		and 	code_praticien between :pra_min and :pra_max 
				and code between :code_min and :code_max
				and rdv.code_interne = historique_etat_rdv1.code_interne and historique_etat_rdv1.etat = :etat1
				and rdv.code_interne = historique_etat_rdv2.code_interne and historique_etat_rdv2.etat = :etat2
				and isnull(user_suivi_clinique,'') between :user_min and :user_max 
				group by rdv.code_interne , rdv."type" 
				order by rdv."type" ASC  ;



	v_nombre = 0
	v_mini = 999999
	v_maxi = 0
	v_temps_total = 0
	v_temps_total_global = 0

	open cur_rdv ;
	fetch cur_rdv into :v_code_interne, :v_type ;
	
	do while sqlca.sqlcode = 0
	
			
			v_nombre = v_nombre + 1
			
			// temps etat1
			select min(date_modif) into :v_temps_etat1 from historique_etat_rdv where etat = :etat1 and round(code_interne,0) = :v_code_interne ;
			
			// temps etat2
			select min(date_modif) into :v_temps_etat2  from historique_etat_rdv where etat = :etat2 and round(code_interne,0) = :v_code_interne ;
			
			
			if date(v_temps_etat1) = date(v_temps_etat2) then 
				// On ne tient ainsi pas compte des conneries : etas du RDV mis à jour plusieurs jours après !!!
				v_temps_rdv = round (secondsafter(time(v_temps_etat1), time(v_temps_etat2)) / 60,0) 
				v_temps_total = v_temps_total + v_temps_rdv
			
				v_mini = min(v_mini, v_temps_rdv)
				v_maxi = max(v_maxi, v_temps_rdv)

			end if
			
			v_type_prec = v_type
			
			fetch cur_rdv into :v_code_interne, :v_type ;
			

			if v_type_prec <> v_type or sqlca.sqlcode <> 0 then
	
				cpt = dw_liste.find("type_rdv_code = '"+v_type_prec+"'",0,999999)
				
				if cpt > 0 then
					
					dw_liste.scrolltorow(cpt)
					dw_liste.setitem(cpt,"nombre",string(v_nombre))
					dw_liste.setitem(cpt,"mini",string(v_mini  , '0' ))
					dw_liste.setitem(cpt,"maxi",string(v_maxi , '0'))
					if v_nombre > 0 then
						dw_liste.setitem(cpt,"moyenne",string(v_temps_total / (v_nombre),'0.00'))
					else
						dw_liste.setitem(cpt,"moyenne",'0.00')
					end if	
					
					v_temps_total_global = v_temps_total_global + v_temps_total
					yield()
					
					// RAZ des compteurs v_type = dw_liste.getitemstring(cpt,"type_rdv_code")
					v_nombre = 0
					v_mini = 9999999
					v_maxi = 0
					v_temps_total = 0
				end if
			end if
	

		
		loop
		close cur_rdv ;

		// Mise à jour du temps total en bas du doc :
		
		dw_liste.object.duree_totale_t.text = "Durée totale : "+string(duree_en_heure_minute(v_temps_total_global))

//
//		//uniquement pour le visuel de formation
//		for cpt = 1 to 	dw_liste.rowcount()
//			
//				dw_liste.scrolltorow(cpt)
//
//				v_type = dw_liste.getitemstring(cpt, "type_rdv_code")
//		
//				
//				integer v_duree
//				v_nombre = rand ( 426 )
//				
//				select duree into :v_duree from type_rdv where code = :v_type ;
//
//				v_mini = max ( v_duree * 0.75 , rand (v_duree) )  
//				v_maxi = max (v_duree * 1.23 , rand (v_mini * 2)  )
//				
//				if v_nombre < 200 then
//					v_temps_total = (v_mini + v_maxi ) / 1.86  * v_nombre
//				else
//					v_temps_total = (v_mini + v_maxi ) / 2.22  *  v_nombre
//				end if
//				
//				
//				dw_liste.setitem(cpt,"nombre",string(v_nombre))
//				dw_liste.setitem(cpt,"mini",string(v_mini , '0'  ) ) 
//				dw_liste.setitem(cpt,"maxi",string(v_maxi , '0' ) ) 
//				if v_nombre > 0 then
//					dw_liste.setitem(cpt,"moyenne",string(v_temps_total / (v_nombre),'0.00'))
//				else
//					dw_liste.setitem(cpt,"moyenne",'0.00')
//				end if	
//				
//				
//				yield()
//messagebox("trace",string(cpt)+"/"+string(dw_liste.rowcount()))
//
//	next
	
	dw_liste.scrolltorow(1)
	
	
	
	close(w_patience)
	
	cb_exporter.enabled ( true )


end if

end subroutine

event open;call super::open;em_date_max.SetDate(today())
em_date_min.setdate(date(year(today()),1,1))

dw_etat1.settransobject(sqlca)
dw_etat2.settransobject(sqlca)

dw_etat1.retrieve()
dw_etat2.retrieve()

dw_utilisateur.settransobject(sqlca)
dw_utilisateur.retrieve()


end event

on w_liste_patients_rdv_temps_passes_par_type.create
int iCurrent
call super::create
this.st_1=create st_1
this.st_2=create st_2
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_6=create st_6
this.dw_etat1=create dw_etat1
this.dw_etat2=create dw_etat2
this.cb_exporter=create cb_exporter
this.em_date_min=create em_date_min
this.em_date_max=create em_date_max
this.rb_un_utilisateur=create rb_un_utilisateur
this.rb_tous_utilisateurs=create rb_tous_utilisateurs
this.dw_utilisateur=create dw_utilisateur
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.st_2
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.st_6
this.Control[iCurrent+7]=this.dw_etat1
this.Control[iCurrent+8]=this.dw_etat2
this.Control[iCurrent+9]=this.cb_exporter
this.Control[iCurrent+10]=this.em_date_min
this.Control[iCurrent+11]=this.em_date_max
this.Control[iCurrent+12]=this.rb_un_utilisateur
this.Control[iCurrent+13]=this.rb_tous_utilisateurs
this.Control[iCurrent+14]=this.dw_utilisateur
this.Control[iCurrent+15]=this.gb_2
end on

on w_liste_patients_rdv_temps_passes_par_type.destroy
call super::destroy
destroy(this.st_1)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_6)
destroy(this.dw_etat1)
destroy(this.dw_etat2)
destroy(this.cb_exporter)
destroy(this.em_date_min)
destroy(this.em_date_max)
destroy(this.rb_un_utilisateur)
destroy(this.rb_tous_utilisateurs)
destroy(this.dw_utilisateur)
destroy(this.gb_2)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_rdv_temps_passes_par_type
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_rdv_temps_passes_par_type
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_rdv_temps_passes_par_type
end type

event cb_autre::clicked;call super::clicked;

	cb_exporter.enabled ( false)

end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_rdv_temps_passes_par_type
integer x = 2665
integer taborder = 120
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_rdv_temps_passes_par_type
integer taborder = 130
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_rdv_temps_passes_par_type
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_rdv_temps_passes_par_type
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_rdv_temps_passes_par_type
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_rdv_temps_passes_par_type
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_rdv_temps_passes_par_type
integer taborder = 70
end type

type em_max from w_liste_patients`em_max within w_liste_patients_rdv_temps_passes_par_type
integer taborder = 30
end type

type em_min from w_liste_patients`em_min within w_liste_patients_rdv_temps_passes_par_type
integer taborder = 20
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_rdv_temps_passes_par_type
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_rdv_temps_passes_par_type
integer taborder = 10
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_rdv_temps_passes_par_type
integer taborder = 90
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_rdv_temps_passes_par_type
end type

type st_min from w_liste_patients`st_min within w_liste_patients_rdv_temps_passes_par_type
end type

type st_max from w_liste_patients`st_max within w_liste_patients_rdv_temps_passes_par_type
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_rdv_temps_passes_par_type
integer y = 0
integer taborder = 80
string dataobject = "dw_liste_patients_analyse_temps_passes"
end type

event dw_liste::rbuttondown;
//
end event

event dw_liste::doubleclicked;

//
end event

type st_1 from statictext within w_liste_patients_rdv_temps_passes_par_type
integer x = 347
integer y = 800
integer width = 901
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Date de rendez-vous :"
end type

type st_2 from statictext within w_liste_patients_rdv_temps_passes_par_type
integer x = 1317
integer y = 908
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

type st_3 from statictext within w_liste_patients_rdv_temps_passes_par_type
integer x = 475
integer y = 908
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

type st_4 from statictext within w_liste_patients_rdv_temps_passes_par_type
integer x = 347
integer y = 1080
integer width = 608
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
boolean underline = true
long backcolor = 553648127
string text = "Temps de passage :"
end type

type st_5 from statictext within w_liste_patients_rdv_temps_passes_par_type
integer x = 475
integer y = 1212
integer width = 270
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "De l~'état "
end type

type st_6 from statictext within w_liste_patients_rdv_temps_passes_par_type
integer x = 1861
integer y = 1212
integer width = 270
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "A l~'état "
end type

type dw_etat1 from datawindow within w_liste_patients_rdv_temps_passes_par_type
string tag = "no resizeall"
integer x = 763
integer y = 1212
integer width = 987
integer height = 76
integer taborder = 50
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_etat_rdv"
boolean border = false
boolean livescroll = true
end type

type dw_etat2 from datawindow within w_liste_patients_rdv_temps_passes_par_type
string tag = "no resizeall"
integer x = 2149
integer y = 1212
integer width = 987
integer height = 76
integer taborder = 60
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_etat_rdv"
boolean border = false
boolean livescroll = true
end type

type cb_exporter from uo_picturebutton_390x120 within w_liste_patients_rdv_temps_passes_par_type
integer x = 2199
integer y = 1868
integer width = 457
integer taborder = 80
boolean bringtotop = true
boolean enabled = false
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;


dw_liste.saveas()
end event

type em_date_min from uo_date_calendrier within w_liste_patients_rdv_temps_passes_par_type
integer x = 818
integer y = 892
integer taborder = 250
boolean bringtotop = true
end type

on em_date_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_max from uo_date_calendrier within w_liste_patients_rdv_temps_passes_par_type
integer x = 1623
integer y = 892
integer taborder = 260
boolean bringtotop = true
end type

on em_date_max.destroy
call uo_date_calendrier::destroy
end on

type rb_un_utilisateur from radiobutton within w_liste_patients_rdv_temps_passes_par_type
integer x = 448
integer y = 1604
integer width = 485
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
string text = "Un utilisateur"
end type

event clicked;
dw_utilisateur.visible = true 


end event

type rb_tous_utilisateurs from radiobutton within w_liste_patients_rdv_temps_passes_par_type
integer x = 448
integer y = 1500
integer width = 709
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
string text = "Tous les utilisateurs"
boolean checked = true
end type

event clicked;dw_utilisateur.visible = false 


end event

type dw_utilisateur from datawindow within w_liste_patients_rdv_temps_passes_par_type
string tag = "no resizeall"
boolean visible = false
integer x = 1198
integer y = 1608
integer width = 1198
integer height = 80
integer taborder = 70
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_utilisateur_suivi_clinique"
boolean border = false
boolean livescroll = true
end type

type gb_2 from groupbox within w_liste_patients_rdv_temps_passes_par_type
integer x = 366
integer y = 1424
integer width = 2121
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
string text = "Suivi Clinique"
end type

