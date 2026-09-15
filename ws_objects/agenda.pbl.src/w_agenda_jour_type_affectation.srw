$PBExportHeader$w_agenda_jour_type_affectation.srw
forward
global type w_agenda_jour_type_affectation from w_fenetre_arakis
end type
type rb_aucune from radiobutton within w_agenda_jour_type_affectation
end type
type rb_une from radiobutton within w_agenda_jour_type_affectation
end type
type pb_annuler from uo_picturebutton_390x120 within w_agenda_jour_type_affectation
end type
type pb_enregister from uo_picturebutton_390x120 within w_agenda_jour_type_affectation
end type
type dw_jour_type from datawindow within w_agenda_jour_type_affectation
end type
type st_jour from statictext within w_agenda_jour_type_affectation
end type
type st_praticien from statictext within w_agenda_jour_type_affectation
end type
type em_date_fin from editmask within w_agenda_jour_type_affectation
end type
type st_repetition from statictext within w_agenda_jour_type_affectation
end type
type rb_nouvelle from radiobutton within w_agenda_jour_type_affectation
end type
type rb_copie from radiobutton within w_agenda_jour_type_affectation
end type
type rb_specif from radiobutton within w_agenda_jour_type_affectation
end type
type gb_1 from groupbox within w_agenda_jour_type_affectation
end type
end forward

global type w_agenda_jour_type_affectation from w_fenetre_arakis
integer width = 2473
integer height = 1460
string title = "Affectation d~'une Journée Type"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
rb_aucune rb_aucune
rb_une rb_une
pb_annuler pb_annuler
pb_enregister pb_enregister
dw_jour_type dw_jour_type
st_jour st_jour
st_praticien st_praticien
em_date_fin em_date_fin
st_repetition st_repetition
rb_nouvelle rb_nouvelle
rb_copie rb_copie
rb_specif rb_specif
gb_1 gb_1
end type
global w_agenda_jour_type_affectation w_agenda_jour_type_affectation

type variables
date v_date_du_jour
double v_code_jour_avant, v_code_jour_apres
string v_code_praticien
end variables

on w_agenda_jour_type_affectation.create
int iCurrent
call super::create
this.rb_aucune=create rb_aucune
this.rb_une=create rb_une
this.pb_annuler=create pb_annuler
this.pb_enregister=create pb_enregister
this.dw_jour_type=create dw_jour_type
this.st_jour=create st_jour
this.st_praticien=create st_praticien
this.em_date_fin=create em_date_fin
this.st_repetition=create st_repetition
this.rb_nouvelle=create rb_nouvelle
this.rb_copie=create rb_copie
this.rb_specif=create rb_specif
this.gb_1=create gb_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.rb_aucune
this.Control[iCurrent+2]=this.rb_une
this.Control[iCurrent+3]=this.pb_annuler
this.Control[iCurrent+4]=this.pb_enregister
this.Control[iCurrent+5]=this.dw_jour_type
this.Control[iCurrent+6]=this.st_jour
this.Control[iCurrent+7]=this.st_praticien
this.Control[iCurrent+8]=this.em_date_fin
this.Control[iCurrent+9]=this.st_repetition
this.Control[iCurrent+10]=this.rb_nouvelle
this.Control[iCurrent+11]=this.rb_copie
this.Control[iCurrent+12]=this.rb_specif
this.Control[iCurrent+13]=this.gb_1
end on

on w_agenda_jour_type_affectation.destroy
call super::destroy
destroy(this.rb_aucune)
destroy(this.rb_une)
destroy(this.pb_annuler)
destroy(this.pb_enregister)
destroy(this.dw_jour_type)
destroy(this.st_jour)
destroy(this.st_praticien)
destroy(this.em_date_fin)
destroy(this.st_repetition)
destroy(this.rb_nouvelle)
destroy(this.rb_copie)
destroy(this.rb_specif)
destroy(this.gb_1)
end on

event open;call super::open;
// Format de la chaine passée en paramètre :
// jj/mm/aaaa : la date du jour est passée en string pour compatibilité
// pppppp : jusqu'à 6 catactères pour le code du praticien ... ou TOUS si pour tous

v_date_du_jour = date(Message.StringParm)
v_code_praticien = right(Message.StringParm, len(Message.StringParm) - 10)
date v_jour_unique
st_jour.text = date_claire (v_date_du_jour)
double v_code_semaine

dw_jour_type.settransobject(sqlca)
dw_jour_type.retrieve()

select isnull(code_jour,0) into :v_code_jour_avant from agenda_jour_type where date_jour = :v_date_du_jour and praticien = :v_code_praticien;


if v_code_praticien = "TOUS" then
	st_praticien.text = "Pour TOUS les praticiens"
else
	string v_nom_prati
	select nom into :v_nom_prati from prati where code = :v_code_praticien ;
	st_praticien.text = "Pour " + v_nom_prati
end if

if v_code_jour_avant = 0 then 
	// Pas de journée type
	
	v_code_semaine = w_agenda.code_semaine_type_de_la_semaine()
	if v_code_semaine > 0 then
		// Y a une semaine 
		rb_specif.visible = false
		rb_aucune.checked = false
		rb_une.checked = false
		dw_jour_type.visible = false
		rb_copie.checked = true
	else
		// pas de semaine non plus
		rb_specif.visible = false
		rb_aucune.checked = true
		rb_une.checked = false
		dw_jour_type.visible = false
		// pas de journée actuellement
		rb_copie.visible = false
	end if
else
	// Y a journée type
	select jour_unique into :v_jour_unique from jour_type where code = :v_code_jour_avant ; 
	
	if not isnull(v_jour_unique) then
		// jour unique 
		rb_specif.checked = true
		rb_specif.visible = true
	else
		rb_specif.visible = false
		rb_une.checked = true
		dw_jour_type.visible = true
		dw_jour_type.SetItem(1, "code", v_code_jour_avant)
		rb_aucune.checked = false
	end if
end if


rb_aucune.backcolor = couleur_fond_fenetre
rb_une.backcolor = couleur_fond_fenetre
rb_nouvelle.backcolor = couleur_fond_fenetre
rb_specif.backcolor = couleur_fond_fenetre
gb_1.backcolor = couleur_fond_fenetre
rb_copie.backcolor = couleur_fond_fenetre


st_repetition.text = "Répéter cette action tous les " + jour[daynumber(v_date_du_jour)] + " jusqu'au "
em_date_fin.text = string(v_date_du_jour)
end event

type p_fond from w_fenetre_arakis`p_fond within w_agenda_jour_type_affectation
integer y = 868
end type

type rb_aucune from radiobutton within w_agenda_jour_type_affectation
integer x = 91
integer y = 476
integer width = 654
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Aucune Journée Type"
end type

event clicked;

dw_jour_type.visible = false
end event

type rb_une from radiobutton within w_agenda_jour_type_affectation
integer x = 91
integer y = 704
integer width = 718
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Affecter la Journée Type"
end type

event clicked;
dw_jour_type.visible = true
end event

type pb_annuler from uo_picturebutton_390x120 within w_agenda_jour_type_affectation
integer x = 599
integer y = 1196
integer width = 558
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;
fermer_fenetre(parent)
end event

type pb_enregister from uo_picturebutton_390x120 within w_agenda_jour_type_affectation
integer x = 1257
integer y = 1196
integer width = 558
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&OK"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;boolean v_suite 
date v_date_fin
//string v_date_du_jour_ok
double v_code_jour, v_code_jour_nouveau
string v_libelle
double v_code_semaine

v_date_fin = date(em_date_fin.text)

v_libelle = "Journée type du " +  string( v_date_du_jour)

if rb_nouvelle.checked or rb_copie.checked then

	if rb_nouvelle.checked then
		
		if Messagebox("ATTENTION","Confirmez-vous la mise en place d'une nouvelle journée type pour le " + string(v_date_du_jour)  +" ?~n~nUne fois dessinée, vous devrez actualiser l'agenda pour qu'elle y figure.", Question!, YesNo!, 2) = 1 then
			
			// Ajout de la journée en base de données
			boolean ajout_ok = false
			integer v_cpt = 0
			
			
			
			// Suppression d'une éventuelle autre journée tentée avant
			Delete from agenda_jour_type where date_jour = :v_date_du_jour  and praticien = :v_code_praticien ;
			delete from rdv_jour_type from jour_type where rdv_jour_type.code_jour = jour_type.code and jour_type.jour_unique = :v_date_du_jour ;
			delete from jour_type where jour_unique = :v_date_du_jour ;
			
			insert into jour_type (nom_jour, commentaire, actif, ordre_trie, jour_unique) 
			values ( :v_libelle , 'Ajout Direct Vierge', 1, 100, :v_date_du_jour) ;
			
			if sqlca.sqlcode = 0 then
				commit ;
				v_suite = true
				// recherche du code de la journée ajoutée
				select isnull(max(code),0) into :v_code_jour from jour_type where nom_jour = :v_libelle and jour_unique = :v_date_du_jour ; 

			else
				Messagebox("ATTENTION", "Erreur N°2 dans l'ajout de la Journée Type !~n~n"+sqlca.sqlerrtext) 
				rollback ;
			end if
		end if
	else
		
		// y a t il déja une journée type unique
		select isnull(max(code),0) into :v_code_jour from jour_type, agenda_jour_type  
		where agenda_jour_type.code_jour = jour_type.code and agenda_jour_type.date_jour = :v_date_du_jour and jour_unique = :v_date_du_jour ; 
		if v_code_jour > 0 then
			// y a une journée unique ... on touche pas .. on la modifiera
			v_suite = true 
		else
			// une journée pas unique ?
			select isnull(max(code),0) into :v_code_jour from jour_type, agenda_jour_type  
			where agenda_jour_type.code_jour = jour_type.code and agenda_jour_type.date_jour = :v_date_du_jour  ; 
			
			if v_code_jour > 0 then 
				// on va la dupliquer ...
				insert into jour_type (nom_jour, commentaire, actif, ordre_trie, jour_unique) 
				values ( :v_libelle , 'Ajout Direct Copie', 1, 100, :v_date_du_jour) ;
				
				// recherche du code de la journée ajoutée
				select isnull(max(code),0) into :v_code_jour_nouveau from jour_type where nom_jour = :v_libelle and jour_unique = :v_date_du_jour ; 
				
				insert into rdv_jour_type (code_jour, debut_rdv, fin_rdv, famille_rdv, numero_fauteuil)
				select :v_code_jour_nouveau, debut_rdv, fin_rdv, famille_rdv, numero_fauteuil  from rdv_jour_type where code_jour = :v_code_jour  ; 
				
				commit; 
				v_suite = true
				v_code_jour = v_code_jour_nouveau ;
			else
				// Une semaine type ?
				v_code_semaine = w_agenda.code_semaine_type_de_la_semaine()
				if v_code_semaine > 0 then
					
					integer v_dn
					v_dn = of_daynumber(v_date_du_jour)
					
					// on va la dupliquer ...
					insert into jour_type (nom_jour, commentaire, actif, ordre_trie, jour_unique) 
					values ( :v_libelle , 'Ajout Direct Semaine', 1, 100, :v_date_du_jour) ;
				
					// recherche du code de la journée ajoutée
					select isnull(max(code),0) into :v_code_jour from jour_type where nom_jour = :v_libelle and jour_unique = :v_date_du_jour ; 
					
					insert into rdv_jour_type (code_jour, debut_rdv, fin_rdv, famille_rdv, numero_fauteuil)
					select :v_code_jour, debut_rdv, fin_rdv, famille_rdv, numero_fauteuil  from rdv_semaine_type 
					where numero_semaine = :v_code_semaine and jour_semaine = :v_dn  ; 
					
					commit; 
					v_suite = true
					
				end if
			end if
			
		end if
	
	end if

	
	if v_suite then
		commit ;

		if v_code_jour > 0 then
			
			// Affection de la journée type à la date du jour cliqué .. à l'avance !!!
			// Par sécurité on supprime et on ajoute !!!
			Delete from agenda_jour_type where date_jour = :v_date_du_jour  and praticien = :v_code_praticien ;
			
			insert into agenda_jour_type (code_jour, date_jour, praticien) 
			values (:v_code_jour, :v_date_du_jour, :v_code_praticien) ;
			
			commit ;
			
			// Fenêtre de mise à jour de la journée type
			str_param_string param_passe  
			param_passe.param = string(v_code_jour)
			w_mdi_2020.uo_powerdock.of_openDocument(w_agenda_jour_type, param_passe, "Journée Type", m_orthokis_2020.m_patients.m_agendagraphique.toolbarItemName)

		else
			Messagebox("ATTENTION", "Erreur N°1 dans l'ajout de la Journée Type !") 
		end if
		
	end if

	
else

	if rb_une.checked then
		v_code_jour_apres = dw_jour_type.getitemNumber(1, "code")
	end if
	
	if v_code_jour_avant <> v_code_jour_apres or v_date_du_jour <> v_date_fin  then
		
		If v_date_du_jour <> v_date_fin then 
			if v_date_fin < v_date_du_jour then
				Messagebox("ATTENTION","La date de fin de répétition est antérieure au " + string(v_date_du_jour) +" !")
				v_suite = false
			else
				if Messagebox("ATTENTION","Vous souhaitez répéter cette action jusqu'au " + em_date_fin.text + ".~n~nCeci est irrémédiable.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then 
					v_suite = true
				else
					v_suite = false
				end if
			end if
		else
			v_suite = true
		end if
		
		if v_suite then
			
			// Par sécurité on supprime et on ajoute !!!
			Delete from agenda_jour_type where date_jour between :v_date_du_jour and :v_date_fin and praticien = :v_code_praticien and dow(:v_date_du_jour) = dow(date_jour) ;
			if sqlca.sqlcode <> 0 then 
				rollback ;
				Messagebox("ATTENTION","Un erreur N°1 s'est produite dans la mise à jour : ~n~n"+sqlca.sqlErrText)
			else
				commit ;
			end if
			
			if v_code_jour_apres <> 0 then
				// On ajoute
				do while sqlca.sqlcode = 0 and v_date_du_jour <= v_date_fin 
					insert into agenda_jour_type (code_jour, date_jour, praticien) 
					values (:v_code_jour_apres, :v_date_du_jour, :v_code_praticien) ;
					v_date_du_jour = relativeDate(v_date_du_jour, 7)
				loop 
			end if
	
			if sqlca.sqlcode <> 0 then 
				rollback ;
				Messagebox("ATTENTION","Un erreur N°2 s'est produite dans la mise à jour : ~n~n"+sqlca.sqlErrText)
			else
				commit ;
			end if
			
			// En cas de modification .. on réactualise l'affichage 
			w_agenda.actualiser()
			w_agenda.recherche_pause_dejeuner(w_agenda.pause_debut, w_agenda.pause_fin, w_agenda.nombre_intervalle)
	
		end if
	end if	
end if
fermer_fenetre(parent)
end event

type dw_jour_type from datawindow within w_agenda_jour_type_affectation
integer x = 969
integer y = 704
integer width = 1221
integer height = 80
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_liste_jour_type"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_jour from statictext within w_agenda_jour_type_affectation
integer x = 78
integer y = 28
integer width = 2313
integer height = 104
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
long backcolor = 553648127
alignment alignment = center!
end type

type st_praticien from statictext within w_agenda_jour_type_affectation
integer x = 78
integer y = 152
integer width = 2313
integer height = 104
boolean bringtotop = true
integer weight = 700
fontcharset fontcharset = ansi!
long backcolor = 553648127
alignment alignment = center!
end type

type em_date_fin from editmask within w_agenda_jour_type_affectation
integer x = 1755
integer y = 804
integer width = 434
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type st_repetition from statictext within w_agenda_jour_type_affectation
integer x = 96
integer y = 824
integer width = 1646
integer height = 72
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = "Répéter cette action tous les .............. jusqu~'au "
alignment alignment = right!
end type

type rb_nouvelle from radiobutton within w_agenda_jour_type_affectation
integer x = 91
integer y = 924
integer width = 896
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nouvelle Journée Type (Vierge)"
end type

type rb_copie from radiobutton within w_agenda_jour_type_affectation
integer x = 91
integer y = 1056
integer width = 1157
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Modification de la Journée Type actuelle"
end type

type rb_specif from radiobutton within w_agenda_jour_type_affectation
boolean visible = false
integer x = 91
integer y = 592
integer width = 942
integer height = 76
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Journée Type spécifique actuelle"
end type

type gb_1 from groupbox within w_agenda_jour_type_affectation
integer x = 27
integer y = 368
integer width = 2286
integer height = 800
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long textcolor = 33554432
long backcolor = 67108864
end type

