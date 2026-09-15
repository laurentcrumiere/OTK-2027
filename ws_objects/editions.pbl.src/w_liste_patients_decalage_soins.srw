$PBExportHeader$w_liste_patients_decalage_soins.srw
forward
global type w_liste_patients_decalage_soins from w_liste_patients
end type
type rb_un_dos from radiobutton within w_liste_patients_decalage_soins
end type
type rb_tous_dos from radiobutton within w_liste_patients_decalage_soins
end type
type dw_dossier from datawindow within w_liste_patients_decalage_soins
end type
type dw_soins from datawindow within w_liste_patients_decalage_soins
end type
type st_12 from statictext within w_liste_patients_decalage_soins
end type
type st_2 from statictext within w_liste_patients_decalage_soins
end type
type em_date from uo_date_calendrier within w_liste_patients_decalage_soins
end type
type rb_tous_soins from radiobutton within w_liste_patients_decalage_soins
end type
type rb_un_soin from radiobutton within w_liste_patients_decalage_soins
end type
type dw_soins2 from datawindow within w_liste_patients_decalage_soins
end type
type cb_lancer from uo_picturebutton_250x120 within w_liste_patients_decalage_soins
end type
type rb_toutes_alertes from radiobutton within w_liste_patients_decalage_soins
end type
type rb_une_alerte from radiobutton within w_liste_patients_decalage_soins
end type
type dw_alertes from datawindow within w_liste_patients_decalage_soins
end type
type em_date_alerte_min from uo_date_calendrier within w_liste_patients_decalage_soins
end type
type em_date_alerte_max from uo_date_calendrier within w_liste_patients_decalage_soins
end type
type st_alerte1 from statictext within w_liste_patients_decalage_soins
end type
type st_alerte2 from statictext within w_liste_patients_decalage_soins
end type
type gb_dos from groupbox within w_liste_patients_decalage_soins
end type
type gb_2 from groupbox within w_liste_patients_decalage_soins
end type
type gb_3 from groupbox within w_liste_patients_decalage_soins
end type
end forward

global type w_liste_patients_decalage_soins from w_liste_patients
string title = "Décalage de soins"
rb_un_dos rb_un_dos
rb_tous_dos rb_tous_dos
dw_dossier dw_dossier
dw_soins dw_soins
st_12 st_12
st_2 st_2
em_date em_date
rb_tous_soins rb_tous_soins
rb_un_soin rb_un_soin
dw_soins2 dw_soins2
cb_lancer cb_lancer
rb_toutes_alertes rb_toutes_alertes
rb_une_alerte rb_une_alerte
dw_alertes dw_alertes
em_date_alerte_min em_date_alerte_min
em_date_alerte_max em_date_alerte_max
st_alerte1 st_alerte1
st_alerte2 st_alerte2
gb_dos gb_dos
gb_2 gb_2
gb_3 gb_3
end type
global w_liste_patients_decalage_soins w_liste_patients_decalage_soins

forward prototypes
public subroutine prepa ()
end prototypes

public subroutine prepa ();string pra_min,pra_max		// Praticiens
string dos_min, dos_max	// Types de dossiers
date date_reference			// date de réference
string soin							// Type de soin cherché
double code_min,code_max	// N° Dossiers
string libelle_soin				// Libelle du soin
string v_filtre
long lig, tot


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

	if rb_tous_dos.checked then
		dos_min="  "
		dos_max="ZZ"
	else
		dos_min = dw_dossier.getitemstring(dw_dossier.getrow(),"code")
		dos_max = dos_min
	end if


	date_reference = date(em_date.text)
	
	open(w_patience)
	
	dw_liste.setfilter ( "")
	dw_liste.filter()
	dw_liste.retrieve(code_min,code_max,pra_min,pra_max,dos_min,dos_max,date_reference)
	
	v_filtre = ""
	
	if rb_un_soin.checked then
		// on applique un filtre sur le soin
		
		soin = dw_soins2.getitemstring(dw_soins.getrow(),"code")
	
		SELECT "code_soins"."nom"      INTO :libelle_soin      FROM "code_soins"     
		WHERE "code_soins"."code" = :soin   ;
	
		v_filtre =  "nom_soin = '" + libelle_soin +  "'"
		dw_liste.setfilter(v_filtre)
	end if
	
	if v_filtre <> "" then 
		dw_liste.filter()
	end if

	if rb_une_alerte.checked then
		
		double v_code_patient, v_code_alerte
		integer v_cpt
		date v_date_alerte_min, v_date_alerte_max
		
		v_date_alerte_min = date(em_date_alerte_min.text)
		v_date_alerte_max = date(em_date_alerte_max.text)
		
		v_code_alerte = dw_alertes.getitemNumber(dw_alertes.getrow(),"code")
		
		// on fait un passage pour éliminer les patients qui n'ont pas l'alerte
		tot = dw_liste.rowcount()
		for lig = tot to 1 step -1
			
			v_code_patient = dw_liste.GetItemNumber(lig, "code")
			
			select isnull(count(*), 0) into :v_cpt from patient_alertes where code_patient = :v_code_patient and code_alerte = :v_code_alerte 
			and "date" between :v_date_alerte_min and :v_date_alerte_max and realisee <> 'O' ;
			
			if v_cpt = 0 then
				dw_liste.deleterow(lig)
			end if
			
		next
		
		
	end if

	
	close(w_patience)

	//em_nb.text = string(dw_liste.rowcount())+" Dossiers"
	//em_nb.visible = true
	
	if dw_liste.rowcount() > 0 then 
		cb_lancer.enabled ( true )
	end if

end if

end subroutine

event open;call super::open;string v_code_soins, v_code_dossier

// TRAITEMENT par défaut
dw_dossier.settransobject(SQLCA)
dw_dossier.retrieve()
select top 1 isnull(code,'') into :v_code_dossier from dossier where nom like '%traitement%' and actif = 1 ;
dw_dossier.setitem(1, "code", v_code_dossier)


// COVID par défaut
dw_soins.settransobject(SQLCA)
dw_soins.retrieve()  
select top 1 isnull(code,'') into :v_code_soins from code_soins where nom like '%covid%' and actif = 1 ;
dw_soins.setitem(1, "code", v_code_soins)




// SEMESTRE par défaut
dw_soins2.settransobject(SQLCA)
dw_soins2.retrieve()  
select top 1 isnull(code,'') into :v_code_soins from code_soins where nom like '%SEMESTRE%' and actif = 1 ;
dw_soins2.setitem(1, "code", v_code_soins)


dw_alertes.settransobject(SQLCA)
dw_alertes.retrieve()  



em_date.setDate(date(2020, 3, 17))


em_date_alerte_min.setDate(date(2020, 3, 17))
em_date_alerte_max.setDate(today())

// Est ce qu'il y a un oin covid ?
//string v_covid
//select isnull(code, '') into :v_covid where left(nom, 5) = 'COVID' ;


end event

on w_liste_patients_decalage_soins.create
int iCurrent
call super::create
this.rb_un_dos=create rb_un_dos
this.rb_tous_dos=create rb_tous_dos
this.dw_dossier=create dw_dossier
this.dw_soins=create dw_soins
this.st_12=create st_12
this.st_2=create st_2
this.em_date=create em_date
this.rb_tous_soins=create rb_tous_soins
this.rb_un_soin=create rb_un_soin
this.dw_soins2=create dw_soins2
this.cb_lancer=create cb_lancer
this.rb_toutes_alertes=create rb_toutes_alertes
this.rb_une_alerte=create rb_une_alerte
this.dw_alertes=create dw_alertes
this.em_date_alerte_min=create em_date_alerte_min
this.em_date_alerte_max=create em_date_alerte_max
this.st_alerte1=create st_alerte1
this.st_alerte2=create st_alerte2
this.gb_dos=create gb_dos
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_un_dos
this.Control[iCurrent+2]=this.rb_tous_dos
this.Control[iCurrent+3]=this.dw_dossier
this.Control[iCurrent+4]=this.dw_soins
this.Control[iCurrent+5]=this.st_12
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.em_date
this.Control[iCurrent+8]=this.rb_tous_soins
this.Control[iCurrent+9]=this.rb_un_soin
this.Control[iCurrent+10]=this.dw_soins2
this.Control[iCurrent+11]=this.cb_lancer
this.Control[iCurrent+12]=this.rb_toutes_alertes
this.Control[iCurrent+13]=this.rb_une_alerte
this.Control[iCurrent+14]=this.dw_alertes
this.Control[iCurrent+15]=this.em_date_alerte_min
this.Control[iCurrent+16]=this.em_date_alerte_max
this.Control[iCurrent+17]=this.st_alerte1
this.Control[iCurrent+18]=this.st_alerte2
this.Control[iCurrent+19]=this.gb_dos
this.Control[iCurrent+20]=this.gb_2
this.Control[iCurrent+21]=this.gb_3
end on

on w_liste_patients_decalage_soins.destroy
call super::destroy
destroy(this.rb_un_dos)
destroy(this.rb_tous_dos)
destroy(this.dw_dossier)
destroy(this.dw_soins)
destroy(this.st_12)
destroy(this.st_2)
destroy(this.em_date)
destroy(this.rb_tous_soins)
destroy(this.rb_un_soin)
destroy(this.dw_soins2)
destroy(this.cb_lancer)
destroy(this.rb_toutes_alertes)
destroy(this.rb_une_alerte)
destroy(this.dw_alertes)
destroy(this.em_date_alerte_min)
destroy(this.em_date_alerte_max)
destroy(this.st_alerte1)
destroy(this.st_alerte2)
destroy(this.gb_dos)
destroy(this.gb_2)
destroy(this.gb_3)
end on

type p_fond from w_liste_patients`p_fond within w_liste_patients_decalage_soins
end type

type cb_imprimer from w_liste_patients`cb_imprimer within w_liste_patients_decalage_soins
integer taborder = 80
end type

type cb_autre from w_liste_patients`cb_autre within w_liste_patients_decalage_soins
fontcharset fontcharset = ansi!
end type

event cb_autre::clicked;call super::clicked;

cb_lancer.enabled ( false )
end event

type cb_fermer from w_liste_patients`cb_fermer within w_liste_patients_decalage_soins
integer x = 2665
integer taborder = 90
end type

type cb_ecran from w_liste_patients`cb_ecran within w_liste_patients_decalage_soins
integer taborder = 100
end type

type cb_lien_word from w_liste_patients`cb_lien_word within w_liste_patients_decalage_soins
end type

type uo_size from w_liste_patients`uo_size within w_liste_patients_decalage_soins
end type

type rb_un from w_liste_patients`rb_un within w_liste_patients_decalage_soins
integer y = 204
end type

type rb_tous from w_liste_patients`rb_tous within w_liste_patients_decalage_soins
integer y = 108
end type

type em_nb from w_liste_patients`em_nb within w_liste_patients_decalage_soins
end type

type em_max from w_liste_patients`em_max within w_liste_patients_decalage_soins
integer y = 376
end type

type em_min from w_liste_patients`em_min within w_liste_patients_decalage_soins
integer y = 376
end type

type dw_1 from w_liste_patients`dw_1 within w_liste_patients_decalage_soins
end type

type gb_1 from w_liste_patients`gb_1 within w_liste_patients_decalage_soins
integer y = 28
end type

type dw_prati from w_liste_patients`dw_prati within w_liste_patients_decalage_soins
boolean visible = true
integer y = 204
end type

type cbx_filtre from w_liste_patients`cbx_filtre within w_liste_patients_decalage_soins
end type

type st_min from w_liste_patients`st_min within w_liste_patients_decalage_soins
integer y = 388
end type

type st_max from w_liste_patients`st_max within w_liste_patients_decalage_soins
integer y = 388
end type

type dw_liste from w_liste_patients`dw_liste within w_liste_patients_decalage_soins
string dataobject = "dw_liste_patients_decalage_soins"
end type

type rb_un_dos from radiobutton within w_liste_patients_decalage_soins
integer x = 448
integer y = 692
integer width = 667
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un type de dossier "
boolean checked = true
end type

event clicked;dw_dossier.visible = true
end event

type rb_tous_dos from radiobutton within w_liste_patients_decalage_soins
integer x = 448
integer y = 596
integer width = 850
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les types de dossier "
end type

event clicked;dw_dossier.visible = false
end event

type dw_dossier from datawindow within w_liste_patients_decalage_soins
string tag = "position"
integer x = 1138
integer y = 692
integer width = 942
integer height = 80
integer taborder = 60
boolean bringtotop = true
string dataobject = "dw_cherche_dossier"
boolean border = false
end type

type dw_soins from datawindow within w_liste_patients_decalage_soins
string tag = "position"
integer x = 937
integer y = 1740
integer width = 1719
integer height = 80
integer taborder = 80
boolean bringtotop = true
string dataobject = "dw_cherche_soins"
boolean border = false
end type

type st_12 from statictext within w_liste_patients_decalage_soins
integer x = 430
integer y = 1748
integer width = 489
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Soin à insérer :"
end type

type st_2 from statictext within w_liste_patients_decalage_soins
integer x = 430
integer y = 1592
integer width = 571
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Date de référence :"
end type

type em_date from uo_date_calendrier within w_liste_patients_decalage_soins
integer x = 1038
integer y = 1584
integer taborder = 190
boolean bringtotop = true
end type

on em_date.destroy
call uo_date_calendrier::destroy
end on

type rb_tous_soins from radiobutton within w_liste_patients_decalage_soins
integer x = 448
integer y = 956
integer width = 850
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les types de soins"
end type

event clicked;dw_soins2.visible = false
end event

type rb_un_soin from radiobutton within w_liste_patients_decalage_soins
integer x = 448
integer y = 1052
integer width = 667
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un type de soins"
boolean checked = true
end type

event clicked;dw_soins2.visible = true
end event

type dw_soins2 from datawindow within w_liste_patients_decalage_soins
string tag = "position"
integer x = 1138
integer y = 1048
integer width = 1719
integer height = 80
integer taborder = 90
boolean bringtotop = true
string dataobject = "dw_cherche_soins"
boolean border = false
end type

type cb_lancer from uo_picturebutton_250x120 within w_liste_patients_decalage_soins
integer x = 2199
integer y = 1868
integer width = 457
integer height = 144
integer taborder = 40
boolean bringtotop = true
boolean enabled = false
string text = "&Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;string v_code_soin_ajout, v_libelle_soin_ajout
integer v_duree_soin_ajout
long tot, lig, v_cpt
date v_date_soin_patient
double v_code_patient, v_total_soint_ajout
string v_cde

v_code_soin_ajout = dw_soins.getitemstring(dw_soins.getrow(),"code")

SELECT "code_soins"."nom" , "duree", "total"     INTO :v_libelle_soin_ajout, :v_duree_soin_ajout , :v_total_soint_ajout     FROM "code_soins"     
WHERE "code_soins"."code" = :v_code_soin_ajout   ;

tot = dw_liste.rowcount() 

if Messagebox("ATTENTION", "Vous aller insérser un soin '"  + v_libelle_soin_ajout  +   " ' et décaler de "  + string (v_duree_soin_ajout) + &
" mois les soins et leurs échéances des " + string (tot) + " dossiers listés.~n~nCette action est ABSOLUMENT IRREMEDIABLE !~n~nConfirmez vous ?", Question!, YesNo!, 2) = 1 then

	open(w_patience) 
	
	// on balaie la liste 
	
	v_cpt = 0
	
	for lig = 1 to tot 
		
			v_date_soin_patient = dw_liste.GetItemDate(lig, "date_soin") 
			v_code_patient = dw_liste.GetItemNumber(lig, "code") 
			
			
			// Si on n'a pas de filtrer sur le type de soin, on peut avoir des soins nul
			if not isnull(v_date_soin_patient) then
				
				v_cpt = v_cpt + 1
				
				// Décalage des échéances
//				v_cde = 'UPDATE ligne_soins,soins,code_soins SET "date" = months("date",'+string(v_duree_soin_ajout)+') WHERE "soins"."type" = "code_soins"."code"  and "code_soins"."duree" > 0  and "soins"."code" = "ligne_soins"."code"  and "soins"."cle" = "ligne_soins"."cle" and "soins"."code" = '+string(v_code_patient) + ' and "date_demande" >= '+"'"+string(v_date_soin_patient,'yyyy-mm-dd') +"'"
				v_cde = 'UPDATE ligne_soins,soins,code_soins SET "date" = dateadd (month, ' + string(v_duree_soin_ajout) + ' , "date") WHERE "soins"."type" = "code_soins"."code"  and "code_soins"."duree" > 0  and "soins"."code" = "ligne_soins"."code"  and "soins"."cle" = "ligne_soins"."cle" and "soins"."code" = '+string(v_code_patient) + ' and "date_demande" >= '+"'"+string(v_date_soin_patient,'yyyy-mm-dd') +"'"
				EXECUTE IMMEDIATE :v_cde ;
				if sqlca.sqlcode <> 0 then
					//messagebox("Problème dans l'actualisation 1",sqlca.sqlerrtext)
				end if
				
				
				// On actualise les Dates d'execution depuis la V10 .. y compris le premier
//				v_cde = 'UPDATE soins,code_soins SET "date_exe" = months("date_exe",'+string(v_duree_soin_ajout)+') WHERE "soins"."type" = "code_soins"."code"  and "code_soins"."duree" > 0 and "soins"."code" = '+string(v_code_patient) + ' and "date_demande" >= '+"'"+string(v_date_soin_patient,'yyyy-mm-dd') +"' and date_exe is not null "
				v_cde = 'UPDATE soins,code_soins SET "date_exe" = dateadd (date_exe, ' + string(v_duree_soin_ajout) + ' , "date") WHERE "soins"."type" = "code_soins"."code"  and "code_soins"."duree" > 0 and "soins"."code" = '+string(v_code_patient) + ' and "date_demande" >= '+"'"+string(v_date_soin_patient,'yyyy-mm-dd') +"' and date_exe is not null "
				EXECUTE IMMEDIATE :v_cde ;
				if sqlca.sqlcode <> 0 then
					//messagebox("Problème dans l'actualisation 3",sqlca.sqlerrtext)
				end if

				// On actualise les dates de demandes des suivants
//				v_cde = 'UPDATE soins,code_soins SET "date_demande" = months("date_demande",'+string(v_duree_soin_ajout)+') WHERE "soins"."type" = "code_soins"."code"  and "code_soins"."duree" > 0 and "soins"."code" = '+string(v_code_patient) + ' and "date_demande" > '+"'"+string(v_date_soin_patient,'yyyy-mm-dd') +"'"
				v_cde = 'UPDATE soins,code_soins SET "date_demande" = dateadd (month, ' + string(v_duree_soin_ajout) + ' , "date_demande") WHERE "soins"."type" = "code_soins"."code"  and "code_soins"."duree" > 0 and "soins"."code" = '+string(v_code_patient) + ' and "date_demande" > '+"'"+string(v_date_soin_patient,'yyyy-mm-dd') +"'"
				EXECUTE IMMEDIATE :v_cde ;
				if sqlca.sqlcode <> 0 then
					//messagebox("Problème dans l'actualisation 2",sqlca.sqlerrtext)
				end if

				// insertion du soin 
				
				long cle_max 
				SELECT Max(cle) INTO :cle_max FROM "soins" WHERE code = :v_code_patient ;
				if isnull(cle_max) then
					cle_max = 1
				else
					cle_max = cle_max + 1
				end if
				
				long numero_max
				SELECT Max(numero) INTO :numero_max FROM "soins" WHERE code = :v_code_patient and "type" = :v_code_soin_ajout ;
				if isnull(numero_max) then
					numero_max = 1
				else
					numero_max = numero_max + 1
				end if

				INSERT INTO "soins"  
				( "cle",    "code",   "type",    "numero",   "date_demande",   "scp_demande",   
				  "hn",    "total",  "date_exe", "user_modif","date_modif")  
				
				(select :cle_max,  :v_code_patient,   :v_code_soin_ajout,  :numero_max,  :v_date_soin_patient, "code_soins"."nb_lettre" ,
				"code_soins"."depasse", "code_soins"."total", dateadd (month, :v_duree_soin_ajout, :v_date_soin_patient), :utilisateur_code, getdate() 
				from code_soins where code = :v_code_soin_ajout)  ;

				if v_total_soint_ajout  > 0 then
					// C'est pas fait pour mais ... a jout d'une échéance patient à la fin du soins
					  INSERT INTO "ligne_soins" 
					      ( "cle",    "code",    "date",     "montant",     "tp",     "origine_tp" )  
							VALUES ( :cle_max,    :v_code_patient,    dateadd (month, :v_duree_soin_ajout, :v_date_soin_patient),     :v_total_soint_ajout,    'N',   '' )  ;
				end if
				
			end if
	
	next 
	
	commit ;

	if rb_une_alerte.checked then
		if Messagebox("ATTENTION","Opération termnée !~n~n" + string(v_cpt) + " dossiers ont été mis à jour !~n~nSouhaitez-vous mettre à jour les alertes de ces patients comme étant réalisées ?", Question!, YesNo!, 1) = 1 then
			// Nouveau balayage pour virer les alertes
			
			date v_date_alerte_min, v_date_alerte_max
			double v_code_alerte
			
			
			v_date_alerte_min = date(em_date_alerte_min.text)
			v_date_alerte_max = date(em_date_alerte_max.text)
			
			v_code_alerte = dw_alertes.getitemNumber(dw_alertes.getrow(),"code")
			
			open(w_patience)
			
			for lig = 1 to tot 
				v_code_patient = dw_liste.GetItemNumber(lig, "code") 
	
	
				update   patient_alertes set realisee = 'O' where code_patient = :v_code_patient and code_alerte = :v_code_alerte 
				and "date" between :v_date_alerte_min and :v_date_alerte_max ;
				
			next 
			commit ;
			
			close(w_patience)
			
		end if
	else
		Messagebox("ATTENTION","Opération termnée !~n~n" + string(v_cpt) + " dossiers ont été mis à jour !")
	end if
	
	close(w_patience)
	
	cb_autre.triggerevent(clicked!)
	
	
end if
end event

type rb_toutes_alertes from radiobutton within w_liste_patients_decalage_soins
integer x = 448
integer y = 1280
integer width = 613
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Toutes les alertes"
boolean checked = true
end type

event clicked;dw_alertes.visible = false

st_alerte1.visible = false
st_alerte2.visible = false
em_date_alerte_min.visible = false
em_date_alerte_max.visible = false
end event

type rb_une_alerte from radiobutton within w_liste_patients_decalage_soins
integer x = 448
integer y = 1380
integer width = 430
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Une alerte"
end type

event clicked;dw_alertes.visible = true

st_alerte1.visible = true
st_alerte2.visible = true
em_date_alerte_min.visible = true
em_date_alerte_max.visible = true
end event

type dw_alertes from datawindow within w_liste_patients_decalage_soins
string tag = "position"
boolean visible = false
integer x = 1138
integer y = 1380
integer width = 1161
integer height = 72
integer taborder = 90
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_alerte"
boolean border = false
boolean livescroll = true
end type

type em_date_alerte_min from uo_date_calendrier within w_liste_patients_decalage_soins
boolean visible = false
integer x = 2953
integer y = 1268
integer taborder = 200
boolean bringtotop = true
end type

on em_date_alerte_min.destroy
call uo_date_calendrier::destroy
end on

type em_date_alerte_max from uo_date_calendrier within w_liste_patients_decalage_soins
boolean visible = false
integer x = 2953
integer y = 1372
integer taborder = 210
boolean bringtotop = true
end type

on em_date_alerte_max.destroy
call uo_date_calendrier::destroy
end on

type st_alerte1 from statictext within w_liste_patients_decalage_soins
boolean visible = false
integer x = 2345
integer y = 1280
integer width = 553
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "A réaliser entre le "
boolean focusrectangle = false
end type

type st_alerte2 from statictext within w_liste_patients_decalage_soins
boolean visible = false
integer x = 2738
integer y = 1384
integer width = 165
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Et le"
boolean focusrectangle = false
end type

type gb_dos from groupbox within w_liste_patients_decalage_soins
integer x = 283
integer y = 504
integer width = 2121
integer height = 304
integer taborder = 31
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du type de dossier "
end type

type gb_2 from groupbox within w_liste_patients_decalage_soins
integer x = 283
integer y = 864
integer width = 3168
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
string text = "Choix des soins en cours"
end type

type gb_3 from groupbox within w_liste_patients_decalage_soins
integer x = 283
integer y = 1188
integer width = 3168
integer height = 304
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
string text = "Sélection sur les Alertes "
end type

