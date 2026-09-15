$PBExportHeader$w_jours_interdits_gen_repet.srw
forward
global type w_jours_interdits_gen_repet from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120 within w_jours_interdits_gen_repet
end type
type cb_generer from uo_picturebutton_390x120 within w_jours_interdits_gen_repet
end type
type cb_supprimer from uo_picturebutton_390x120 within w_jours_interdits_gen_repet
end type
type em_heure2 from editmask within w_jours_interdits_gen_repet
end type
type st_5 from statictext within w_jours_interdits_gen_repet
end type
type st_4 from statictext within w_jours_interdits_gen_repet
end type
type em_heure1 from editmask within w_jours_interdits_gen_repet
end type
type st_3 from statictext within w_jours_interdits_gen_repet
end type
type em_date2 from editmask within w_jours_interdits_gen_repet
end type
type em_date1 from editmask within w_jours_interdits_gen_repet
end type
type st_min from statictext within w_jours_interdits_gen_repet
end type
type em_faut1 from editmask within w_jours_interdits_gen_repet
end type
type em_faut2 from editmask within w_jours_interdits_gen_repet
end type
type st_1 from statictext within w_jours_interdits_gen_repet
end type
type st_2 from statictext within w_jours_interdits_gen_repet
end type
type cbx_samedi from checkbox within w_jours_interdits_gen_repet
end type
type cbx_vendredi from checkbox within w_jours_interdits_gen_repet
end type
type cbx_jeudi from checkbox within w_jours_interdits_gen_repet
end type
type cbx_mercredi from checkbox within w_jours_interdits_gen_repet
end type
type cbx_mardi from checkbox within w_jours_interdits_gen_repet
end type
type cbx_lundi from checkbox within w_jours_interdits_gen_repet
end type
type rb_tous from radiobutton within w_jours_interdits_gen_repet
end type
type rb_un from radiobutton within w_jours_interdits_gen_repet
end type
type dw_prati from datawindow within w_jours_interdits_gen_repet
end type
type uo_1 from resize_fenetre within w_jours_interdits_gen_repet
end type
type sle_commentaire from singlelineedit within w_jours_interdits_gen_repet
end type
type cbx_dimanche from checkbox within w_jours_interdits_gen_repet
end type
type sle_couleur from singlelineedit within w_jours_interdits_gen_repet
end type
type st_couleur from statictext within w_jours_interdits_gen_repet
end type
type rb_toutes_semaines from radiobutton within w_jours_interdits_gen_repet
end type
type rb_une_semaine_sur_deux from radiobutton within w_jours_interdits_gen_repet
end type
type gb_5 from groupbox within w_jours_interdits_gen_repet
end type
type gb_4 from groupbox within w_jours_interdits_gen_repet
end type
type gb_3 from groupbox within w_jours_interdits_gen_repet
end type
type gb_2 from groupbox within w_jours_interdits_gen_repet
end type
type gb_1 from groupbox within w_jours_interdits_gen_repet
end type
type gb_6 from groupbox within w_jours_interdits_gen_repet
end type
type gb_7 from groupbox within w_jours_interdits_gen_repet
end type
end forward

global type w_jours_interdits_gen_repet from w_fenetre_arakis
integer width = 4247
integer height = 2296
string title = "Mise à jour de Jours Interdits par groupe"
cb_1 cb_1
cb_generer cb_generer
cb_supprimer cb_supprimer
em_heure2 em_heure2
st_5 st_5
st_4 st_4
em_heure1 em_heure1
st_3 st_3
em_date2 em_date2
em_date1 em_date1
st_min st_min
em_faut1 em_faut1
em_faut2 em_faut2
st_1 st_1
st_2 st_2
cbx_samedi cbx_samedi
cbx_vendredi cbx_vendredi
cbx_jeudi cbx_jeudi
cbx_mercredi cbx_mercredi
cbx_mardi cbx_mardi
cbx_lundi cbx_lundi
rb_tous rb_tous
rb_un rb_un
dw_prati dw_prati
uo_1 uo_1
sle_commentaire sle_commentaire
cbx_dimanche cbx_dimanche
sle_couleur sle_couleur
st_couleur st_couleur
rb_toutes_semaines rb_toutes_semaines
rb_une_semaine_sur_deux rb_une_semaine_sur_deux
gb_5 gb_5
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
gb_6 gb_6
gb_7 gb_7
end type
global w_jours_interdits_gen_repet w_jours_interdits_gen_repet

type variables
integer jf1,jf2,jf3
// pour repositionnement de la palette de couleur
integer  ii_palette_x = 0
integer ii_palette_y = 0



end variables

on w_jours_interdits_gen_repet.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_generer=create cb_generer
this.cb_supprimer=create cb_supprimer
this.em_heure2=create em_heure2
this.st_5=create st_5
this.st_4=create st_4
this.em_heure1=create em_heure1
this.st_3=create st_3
this.em_date2=create em_date2
this.em_date1=create em_date1
this.st_min=create st_min
this.em_faut1=create em_faut1
this.em_faut2=create em_faut2
this.st_1=create st_1
this.st_2=create st_2
this.cbx_samedi=create cbx_samedi
this.cbx_vendredi=create cbx_vendredi
this.cbx_jeudi=create cbx_jeudi
this.cbx_mercredi=create cbx_mercredi
this.cbx_mardi=create cbx_mardi
this.cbx_lundi=create cbx_lundi
this.rb_tous=create rb_tous
this.rb_un=create rb_un
this.dw_prati=create dw_prati
this.uo_1=create uo_1
this.sle_commentaire=create sle_commentaire
this.cbx_dimanche=create cbx_dimanche
this.sle_couleur=create sle_couleur
this.st_couleur=create st_couleur
this.rb_toutes_semaines=create rb_toutes_semaines
this.rb_une_semaine_sur_deux=create rb_une_semaine_sur_deux
this.gb_5=create gb_5
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_6=create gb_6
this.gb_7=create gb_7
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_generer
this.Control[iCurrent+3]=this.cb_supprimer
this.Control[iCurrent+4]=this.em_heure2
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.st_4
this.Control[iCurrent+7]=this.em_heure1
this.Control[iCurrent+8]=this.st_3
this.Control[iCurrent+9]=this.em_date2
this.Control[iCurrent+10]=this.em_date1
this.Control[iCurrent+11]=this.st_min
this.Control[iCurrent+12]=this.em_faut1
this.Control[iCurrent+13]=this.em_faut2
this.Control[iCurrent+14]=this.st_1
this.Control[iCurrent+15]=this.st_2
this.Control[iCurrent+16]=this.cbx_samedi
this.Control[iCurrent+17]=this.cbx_vendredi
this.Control[iCurrent+18]=this.cbx_jeudi
this.Control[iCurrent+19]=this.cbx_mercredi
this.Control[iCurrent+20]=this.cbx_mardi
this.Control[iCurrent+21]=this.cbx_lundi
this.Control[iCurrent+22]=this.rb_tous
this.Control[iCurrent+23]=this.rb_un
this.Control[iCurrent+24]=this.dw_prati
this.Control[iCurrent+25]=this.uo_1
this.Control[iCurrent+26]=this.sle_commentaire
this.Control[iCurrent+27]=this.cbx_dimanche
this.Control[iCurrent+28]=this.sle_couleur
this.Control[iCurrent+29]=this.st_couleur
this.Control[iCurrent+30]=this.rb_toutes_semaines
this.Control[iCurrent+31]=this.rb_une_semaine_sur_deux
this.Control[iCurrent+32]=this.gb_5
this.Control[iCurrent+33]=this.gb_4
this.Control[iCurrent+34]=this.gb_3
this.Control[iCurrent+35]=this.gb_2
this.Control[iCurrent+36]=this.gb_1
this.Control[iCurrent+37]=this.gb_6
this.Control[iCurrent+38]=this.gb_7
end on

on w_jours_interdits_gen_repet.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_generer)
destroy(this.cb_supprimer)
destroy(this.em_heure2)
destroy(this.st_5)
destroy(this.st_4)
destroy(this.em_heure1)
destroy(this.st_3)
destroy(this.em_date2)
destroy(this.em_date1)
destroy(this.st_min)
destroy(this.em_faut1)
destroy(this.em_faut2)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.cbx_samedi)
destroy(this.cbx_vendredi)
destroy(this.cbx_jeudi)
destroy(this.cbx_mercredi)
destroy(this.cbx_mardi)
destroy(this.cbx_lundi)
destroy(this.rb_tous)
destroy(this.rb_un)
destroy(this.dw_prati)
destroy(this.uo_1)
destroy(this.sle_commentaire)
destroy(this.cbx_dimanche)
destroy(this.sle_couleur)
destroy(this.st_couleur)
destroy(this.rb_toutes_semaines)
destroy(this.rb_une_semaine_sur_deux)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_6)
destroy(this.gb_7)
end on

event open;call super::open;


// mémorisation de la taille des objet
uo_1.taille(this)


// initialisation
dw_prati.settransobject(sqlca)
dw_prati.retrieve()

// Fauteuils
em_faut1.text = '0'
em_faut2.text = '99'


// Heures 
em_heure1.text = '00:00'
em_heure2.text = '23:59'


// Dates
em_date1.text = string(today())
em_date2.text = "31/12/"+string(year(today()))

end event

event resize;uo_1.retaille(this)

end event

event timer;call super::timer;if version_ce_logiciel >= "36.90" then
	Timer(0)
	fxg_set_position_palette_windows(this, ii_palette_x, ii_palette_y)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_jours_interdits_gen_repet
integer x = 800
integer y = 780
end type

type cb_1 from uo_picturebutton_390x120 within w_jours_interdits_gen_repet
integer x = 2743
integer y = 1984
integer width = 475
integer taborder = 82
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;// réactialisaton de la liste des jours_interdits si elle est ouverte

if isvalid(w_jours_interdits) then
	// la fenêtre parente est encore là !!
	w_jours_interdits.dw_liste.retrieve()

end if


fermer_fenetre(parent)
end event

type cb_generer from uo_picturebutton_390x120 within w_jours_interdits_gen_repet
integer x = 846
integer y = 1984
integer width = 475
integer taborder = 82
string text = "&Générer"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;// Génération des jours interdits / répétition

// Vérification qu'un jour a bien été saisi 

if cbx_lundi.checked = false and cbx_mardi.checked = false and     &
 	cbx_mercredi.checked = false and cbx_jeudi.checked = false and &
 	cbx_vendredi.checked = false and cbx_samedi.checked = false and cbx_dimanche.checked = false then &
	
	Messagebox("ATTENTION","Vous n'avez sélectionné aucun jour !")
else
	if date(em_date1.text) > date(em_date2.text) then
		Messagebox("ATTENTION","La date de début est supérieure à la date de fin !")
	else
		if time(em_heure1.text) > time(em_heure2.text) then
			Messagebox("ATTENTION","L'heure de début est supérieure à l'heure de fin !")
		else
			if integer(em_faut1.text) > integer(em_faut2.text) then
				Messagebox("ATTENTION","Le fauteuil de début est supérieur au fauteuil de fin !")
			else
				// Tout est vérifier ... on y va !!

				// praticiens
				string prat_min,prat_max

				// Fauteuils
				integer faut1,faut2
				
				faut1 = integer(em_faut1.text)
				faut2 = integer(em_faut2.text)
				
				
				// Dates
				date date1,date2
				
				date1 = date(em_date1.text)
				date2 = date(em_date2.text)
				
				// heures
				time heure1,heure2
				
				heure1 = time(em_heure1.text)
				heure2 = time(em_heure2.text)
				
				
				// Commentaire
				string v_commentaire
				long v_couleur 
				
				// Compteurs pour savoir combien de jours ont été ajoutés
				double nbj1,nbj2
				
				// jour qu'on ajoute
				datetime jdeb,jfin
				
				// jour courant
				date datecour
				
				// Ajout
				Boolean Ajout
				
				// N° de semaine ...  si on ajoute 1 semaine sur deux, on ajoute les impaires et pas les paires
				integer v_numero_semaine 

				if rb_tous.checked then
					prat_min = '      '
					prat_max = 'ZZZZZZ'
				else
					prat_min = dw_prati.gettext()
					prat_max = prat_min
				end if


				if MessageBox("ATTENTION !","Vous avez demandé une génération de périodes interdites.~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
					
					open(w_patience)
					
					Select count(*) into :nbj1 from "dba"."jours_interdits" ;
			
					datecour = date1
					
					v_numero_semaine = 1
					
					Do While datecour <= date2
						
						jdeb = datetime(datecour,heure1)
						jfin = datetime(datecour,heure2)
						
						// Ajout 
						Ajout = false
						
						// Dimanche
						if daynumber(datecour) = 1 and cbx_dimanche.checked then
							// Ajout
							ajout = true
						end if
						// Lundi
						if daynumber(datecour) = 2 and cbx_lundi.checked then
							// Ajout
							ajout = true
						end if
						// Mardi
						if daynumber(datecour) = 3 and cbx_mardi.checked then
							// Ajout
							ajout = true
						end if
						// Mercredi
						if daynumber(datecour) = 4 and cbx_mercredi.checked then
							// Ajout
							ajout = true
						end if
						// Jeudi
						if daynumber(datecour) = 5 and cbx_jeudi.checked then
							// Ajout
							ajout = true
						end if
						// Vendredi
						if daynumber(datecour) = 6 and cbx_vendredi.checked then
							// Ajout
							ajout = true
						end if
						// Samedi
						if daynumber(datecour) = 7 and cbx_samedi.checked then
							// Ajout
							ajout = true
						end if

						// On ajoute soit toutes les semaines, soit une semaine sur 2 les semaines impaires
						if ajout and (rb_toutes_semaines.checked or (rb_une_semaine_sur_deux.checked and mod(v_numero_semaine, 2) = 1)) then
						
						
							v_commentaire = trim(sle_commentaire.text)
							v_couleur = long(sle_couleur.text)
							zerol(v_couleur)
							
							if v_commentaire = '' then
								setNull(v_commentaire)
							end if
							
							INSERT INTO "dba"."jours_interdits" 
							("date_debut","date_fin","fauteuil_debut","fauteuil_fin","code_praticien","user_modif","date_modif", "commentaire", "couleur")
							SELECT :jdeb, :jfin, :faut1, :faut2, code ,:utilisateur_code, getdate() , :v_commentaire , :v_couleur	
							FROM "dba"."prati"
							WHERE code between :prat_min and :prat_max and actif = 1 ;
												
							commit ;
						end if
						
						if daynumber(datecour) = 1 then
							// on est le dimanche => semaine suivante 
							v_numero_semaine = v_numero_semaine + 1 
						end if
						
						datecour = relativedate(datecour,1)
					
				
					LOOP
				
					
					Select count(*) into :nbj2 from "dba"."jours_interdits" ;
					
					if isnull(nbj1) then
						nbj1 = 0
					end if
					if isnull(nbj2) then
						nbj2 = 0
					end if
						
					close(w_patience)
					
					MessageBox("INFORMATION",string(nbj2 - nbj1) + " périodes ont été ajoutées.")
				
				end if
	
			end if		
		end if
		
	end if
end if
	 
end event

type cb_supprimer from uo_picturebutton_390x120 within w_jours_interdits_gen_repet
integer x = 1344
integer y = 1984
integer width = 475
integer taborder = 82
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;// Génération des jours interdits / répétition

// ATTENTION !
// le principe est de ne supprimer que les jours simple (même date de début et de fin du jour
// interdit) pour éviter les problèmes !!!

// Vérification qu'un jour a bien été saisi 

if cbx_lundi.checked = false and cbx_mardi.checked = false and     &
 	cbx_mercredi.checked = false and cbx_jeudi.checked = false and &
 	cbx_vendredi.checked = false and cbx_samedi.checked = false then &
	
	Messagebox("ATTENTION","Vous n'avez sélectionné aucun jour !")
else
	if date(em_date1.text) > date(em_date2.text) then
		Messagebox("ATTENTION","La date de début est supérieure à la date de fin !")
	else
		if time(em_heure1.text) > time(em_heure2.text) then
			Messagebox("ATTENTION","L'heure de début est supérieure à l'heure de fin !")
		else
			if integer(em_faut1.text) > integer(em_faut2.text) then
				Messagebox("ATTENTION","Le fauteuil de début est supérieur au fauteuil de fin !")
			else
				// Tout est vérifier ... on y va !!

				// praticiens
				string prat_min,prat_max

				// Fauteuils
				integer faut1,faut2
				
				faut1 = integer(em_faut1.text)
				faut2 = integer(em_faut2.text)
				
				
				// Dates
				date date1,date2
				
				date1 = date(em_date1.text)
				date2 = date(em_date2.text)
				
				// heures
				time heure1,heure2
				
				heure1 = time(em_heure1.text)
				heure2 = time(em_heure2.text)
				
				// pour tenir compte de l'heure
				long heure1_long, heure2_long 
				heure1_long = hour(heure1) * 60 + minute(heure1)
				heure2_long = hour(heure2) * 60 + minute(heure2)
				
				// Compteurs pour savoir combien de jours ont été supprimés
				double nbj1,nbj2
				
				// N° jour à supprimer
				integer numjour
				
				// Suppression
				Boolean Sup
				
	

				if rb_tous.checked then
					prat_min = '      '
					prat_max = 'ZZZZZZ'
				else
					prat_min = dw_prati.gettext()
					prat_max = prat_min
				end if


				if MessageBox("ATTENTION !","Vous avez demandé la suppression de périodes interdites.~n~nConfirmez-vous ?",Question!,YesNo!,2) = 1 then
					
					open(w_patience)
					
					Select count(*) into :nbj1 from "dba"."jours_interdits" ;
			
		
					for numjour = 2 to 7
				
						// Suppression 
						Sup = false
						
						// Lundi
						if numjour = 2 and cbx_lundi.checked then
							// Suppression
							Sup = true
						end if
						// Mardi
						if numjour = 3 and cbx_mardi.checked then
							// Suppression
							Sup = true
						end if
						// Mercredi
						if numjour = 4 and cbx_mercredi.checked then
							// Suppression
							Sup = true
						end if
						// Jeudi
						if numjour = 5 and cbx_jeudi.checked then
							// Suppression
							Sup = true
						end if
						// Vendredi
						if numjour = 6 and cbx_vendredi.checked then
							// Suppression
							Sup = true
						end if
						// Samedi
						if numjour = 7 and cbx_samedi.checked then
							// Suppression
							Sup = true
						end if

						
						if Sup then
						
							DELETE FROM "dba"."jours_interdits" 
							WHERE code_praticien between :prat_min and :prat_max 
							and date(date_debut) = date(date_fin) 
							and dow(date(date_debut)) = :numjour 
							and date(date_debut) between :date1 and :date2 
							and hour(date_debut) * 60 + minute(date_debut) between :heure1_long and :heure2_long  
							and hour(date_fin) * 60 + minute(date_fin) between :heure1_long and :heure2_long  
							and :faut1 <= fauteuil_debut and fauteuil_fin <= :faut2 ;
												
							if sqlca.sqlcode <> 0 then
								MessageBox("ERREUR DANS LA SUPPRESSION",sqlca.sqlerrtext)
							end if
							commit ;
						end if
						
					NEXT
				
					
					Select count(*) into :nbj2 from "dba"."jours_interdits" ;
					
					if isnull(nbj1) then
						nbj1 = 0
					end if
					if isnull(nbj2) then
						nbj2 = 0
					end if
						
					close(w_patience)
					
					MessageBox("INFORMATION",string(nbj1 - nbj2) + " périodes ont été supprimées.")
				
				end if
	
			end if		
		end if
		
	end if
end if
	 
end event

type em_heure2 from editmask within w_jours_interdits_gen_repet
integer x = 869
integer y = 1064
integer width = 320
integer height = 100
integer taborder = 72
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
string displaydata = ""
end type

type st_5 from statictext within w_jours_interdits_gen_repet
integer x = 754
integer y = 1076
integer width = 101
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "A"
boolean focusrectangle = false
end type

type st_4 from statictext within w_jours_interdits_gen_repet
integer x = 151
integer y = 1076
integer width = 110
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "De"
boolean focusrectangle = false
end type

type em_heure1 from editmask within w_jours_interdits_gen_repet
integer x = 274
integer y = 1064
integer width = 320
integer height = 100
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = timemask!
string mask = "hh:mm"
boolean spin = true
string displaydata = ""
end type

type st_3 from statictext within w_jours_interdits_gen_repet
integer x = 741
integer y = 792
integer width = 105
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Au"
boolean focusrectangle = false
end type

type em_date2 from editmask within w_jours_interdits_gen_repet
integer x = 864
integer y = 780
integer width = 430
integer height = 96
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type em_date1 from editmask within w_jours_interdits_gen_repet
integer x = 265
integer y = 780
integer width = 430
integer height = 96
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type st_min from statictext within w_jours_interdits_gen_repet
integer x = 151
integer y = 796
integer width = 105
integer height = 64
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "Du"
boolean focusrectangle = false
end type

type em_faut1 from editmask within w_jours_interdits_gen_repet
integer x = 1838
integer y = 784
integer width = 247
integer height = 88
integer taborder = 100
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~99"
end type

type em_faut2 from editmask within w_jours_interdits_gen_repet
integer x = 2290
integer y = 784
integer width = 247
integer height = 88
integer taborder = 120
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
double increment = 1
string minmax = "0~~99"
end type

type st_1 from statictext within w_jours_interdits_gen_repet
integer x = 1673
integer y = 792
integer width = 183
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "N°"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_jours_interdits_gen_repet
integer x = 2153
integer y = 792
integer width = 119
integer height = 72
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
string text = "A"
alignment alignment = center!
boolean focusrectangle = false
end type

type cbx_samedi from checkbox within w_jours_interdits_gen_repet
integer x = 2185
integer y = 472
integer width = 347
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Samedi"
end type

type cbx_vendredi from checkbox within w_jours_interdits_gen_repet
integer x = 1760
integer y = 472
integer width = 347
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Vendredi"
end type

type cbx_jeudi from checkbox within w_jours_interdits_gen_repet
integer x = 1344
integer y = 472
integer width = 338
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Jeudi"
end type

type cbx_mercredi from checkbox within w_jours_interdits_gen_repet
integer x = 928
integer y = 472
integer width = 338
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mercredi"
end type

type cbx_mardi from checkbox within w_jours_interdits_gen_repet
integer x = 530
integer y = 472
integer width = 320
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Mardi"
end type

type cbx_lundi from checkbox within w_jours_interdits_gen_repet
integer x = 133
integer y = 472
integer width = 320
integer height = 76
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Lundi"
end type

type rb_tous from radiobutton within w_jours_interdits_gen_repet
event clicked pbm_bnclicked
integer x = 219
integer y = 112
integer width = 695
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
end type

on clicked;rb_un.checked = false
dw_prati.visible = false
end on

type rb_un from radiobutton within w_jours_interdits_gen_repet
event clicked pbm_bnclicked
integer x = 219
integer y = 208
integer width = 622
integer height = 80
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
boolean checked = true
end type

on clicked;rb_tous.checked = false
dw_prati.visible = true
end on

type dw_prati from datawindow within w_jours_interdits_gen_repet
string tag = "no resizeall"
integer x = 992
integer y = 204
integer width = 869
integer height = 76
integer taborder = 110
string dataobject = "dw_cherche_prati"
boolean border = false
end type

type uo_1 from resize_fenetre within w_jours_interdits_gen_repet
boolean visible = false
integer x = 1893
integer y = 144
integer taborder = 20
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type sle_commentaire from singlelineedit within w_jours_interdits_gen_repet
integer x = 128
integer y = 1364
integer width = 3118
integer height = 100
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
integer limit = 50
borderstyle borderstyle = stylelowered!
end type

event rbuttondown;long couleur_choisie

//Appel de la fenetre couleur et au retour, met la couleur de fond

// Les positions seront utilisées dans le timer de la fenêtre	
ii_palette_x = unitstopixels( w_mdi_2020.pointerx() , XUnitsToPixels! ) 
ii_palette_y = unitstopixels( w_mdi_2020.pointery() , YUnitsToPixels! ) 
		
Timer(0.05)	// pour déclencher le repositionnement de la palette


//--------------------------------------------------
if appel_palette(couleur_choisie)  then
	// Clic droit dans le zone commentaire => couleur
	if couleur_choisie=couleur_jour_interdit then
		messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur de fond des jours interdits.")
	else
		if couleur_choisie = couleur_rouge then 
			messagebox("Attention", "Vous ne pouvez pas choisir cette couleur, car elle correspond à la couleur des rendez-vous saisis dans une periode interdite.")
		else
			sle_commentaire.textColor = couleur_choisie
			sle_couleur.text = string(couleur_choisie)
		end if
	end if
end if


end event

type cbx_dimanche from checkbox within w_jours_interdits_gen_repet
integer x = 2610
integer y = 472
integer width = 375
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Dimanche"
end type

type sle_couleur from singlelineedit within w_jours_interdits_gen_repet
boolean visible = false
integer x = 69
integer y = 1700
integer width = 567
integer height = 112
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "0"
borderstyle borderstyle = stylelowered!
end type

type st_couleur from statictext within w_jours_interdits_gen_repet
integer x = 123
integer y = 1484
integer width = 1239
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 16711680
long backcolor = 553648127
string text = "Clic-Droit pour modifier la couleur d~'écriture"
boolean focusrectangle = false
end type

type rb_toutes_semaines from radiobutton within w_jours_interdits_gen_repet
integer x = 1591
integer y = 1084
integer width = 677
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Toutes les semaines"
boolean checked = true
end type

type rb_une_semaine_sur_deux from radiobutton within w_jours_interdits_gen_repet
integer x = 2437
integer y = 1084
integer width = 750
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
string text = "Une semaine sur deux "
end type

type gb_5 from groupbox within w_jours_interdits_gen_repet
integer x = 64
integer y = 984
integer width = 1303
integer height = 228
integer taborder = 80
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Horaires"
end type

type gb_4 from groupbox within w_jours_interdits_gen_repet
integer x = 64
integer y = 692
integer width = 1303
integer height = 228
integer taborder = 70
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Période"
end type

type gb_3 from groupbox within w_jours_interdits_gen_repet
integer x = 1527
integer y = 692
integer width = 1152
integer height = 228
integer taborder = 50
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Fauteuils"
end type

type gb_2 from groupbox within w_jours_interdits_gen_repet
integer x = 55
integer y = 364
integer width = 3013
integer height = 268
integer taborder = 30
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Jours"
end type

type gb_1 from groupbox within w_jours_interdits_gen_repet
integer x = 55
integer y = 32
integer width = 2121
integer height = 304
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Choix du praticien"
end type

type gb_6 from groupbox within w_jours_interdits_gen_repet
string tag = "NO RESIZE"
integer x = 64
integer y = 1276
integer width = 3282
integer height = 300
integer taborder = 90
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Commentaire (pour ajout)"
end type

type gb_7 from groupbox within w_jours_interdits_gen_repet
integer x = 1527
integer y = 984
integer width = 1815
integer height = 228
integer taborder = 60
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 15780518
string text = "Fréquence (si ajout)"
end type

