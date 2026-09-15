$PBExportHeader$w_efacturation_belgique_maj.srw
forward
global type w_efacturation_belgique_maj from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_efacturation_belgique_maj
end type
type tab_1 from tab within w_efacturation_belgique_maj
end type
type tabpage_1 from userobject within tab_1
end type
type dw_gene from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_gene dw_gene
end type
type tabpage_2 from userobject within tab_1
end type
type dw_lignes from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
dw_lignes dw_lignes
end type
type tab_1 from tab within w_efacturation_belgique_maj
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type
type cb_supprimer from uo_picturebutton_390x120 within w_efacturation_belgique_maj
end type
type cb_annuler from uo_picturebutton_390x120 within w_efacturation_belgique_maj
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_efacturation_belgique_maj
end type
type uo_1 from resize_fenetre within w_efacturation_belgique_maj
end type
type cb_note from uo_picturebutton_390x120 within w_efacturation_belgique_maj
end type
type dw_lignes_notes from datawindow within w_efacturation_belgique_maj
end type
end forward

global type w_efacturation_belgique_maj from w_fenetre_arakis
integer width = 4425
integer height = 2480
string title = ""
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
tab_1 tab_1
cb_supprimer cb_supprimer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
uo_1 uo_1
cb_note cb_note
dw_lignes_notes dw_lignes_notes
end type
global w_efacturation_belgique_maj w_efacturation_belgique_maj

type variables


long li_numero_facture
char ci_type_facture, ci_type_action
string si_libelle_type_facture

double var_code_local

integer ii_numero_envoi
end variables

on w_efacturation_belgique_maj.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.tab_1=create tab_1
this.cb_supprimer=create cb_supprimer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.uo_1=create uo_1
this.cb_note=create cb_note
this.dw_lignes_notes=create dw_lignes_notes
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.tab_1
this.Control[iCurrent+3]=this.cb_supprimer
this.Control[iCurrent+4]=this.cb_annuler
this.Control[iCurrent+5]=this.cb_enregistrer
this.Control[iCurrent+6]=this.uo_1
this.Control[iCurrent+7]=this.cb_note
this.Control[iCurrent+8]=this.dw_lignes_notes
end on

on w_efacturation_belgique_maj.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.tab_1)
destroy(this.cb_supprimer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.uo_1)
destroy(this.cb_note)
destroy(this.dw_lignes_notes)
end on

event open;call super::open;
date v_date_envoi

uo_1.taille(this)

// Tramission du numero de facture


li_numero_facture = message.doubleparm

// Type d'action : Ajout ou Consultation
ci_type_action= param_win[1]

// type de document : Facture ou Note de crédit
ci_type_facture = param_win[2]

string ls_statut_my_carenet

choose case ci_type_facture
	case "F"
		si_libelle_type_facture = "Facture"
	case "N"
		si_libelle_type_facture = "Note de Crédit"
		
end choose

title = si_libelle_type_facture + " N°" + string(li_numero_facture) 

// Mise à jour des datawindows
tab_1.tabpage_1.dw_gene.settransobject(sqlca)
tab_1.tabpage_1.dw_gene.retrieve(li_numero_facture, ci_type_facture)

tab_1.tabpage_2.dw_lignes.settransobject(sqlca)
tab_1.tabpage_2.dw_lignes.retrieve(li_numero_facture, ci_type_facture)

if tab_1.tabpage_1.dw_gene.rowcount() = 0 then 
	messagebox("ATTENTION !", "Erreur dans l'ouverture de la facture !")
	close(this)
else
	colore_datawindow(tab_1.tabpage_1.dw_gene)
	colore_datawindow(tab_1.tabpage_2.dw_lignes)
	
	ls_statut_my_carenet =  tab_1.tabpage_1.dw_gene.getitemString(1,"statut_my_carenet")
	
	if ci_type_action = "C" or (ls_statut_my_carenet <> " " and ls_statut_my_carenet <> "A") then
		// mode consultation
		title = si_libelle_type_facture + " N°" + string(li_numero_facture) +" *** CONSULTATION ou SUPPRESSION UNIQUEMENT ***"
		tab_1.tabpage_1.dw_gene.enabled = false
		tab_1.tabpage_2.dw_lignes.enabled = false
		
		if ci_type_facture <> "N" then
			cb_note.visible = true
		end if
		
		// dans quel envoi est la facture
		select top 1 isnull(numero_envoi, 0), date_envoi 
		into :ii_numero_envoi, :v_date_envoi
		from ligne_envoi_efacture_belgique  
		where ligne_envoi_efacture_belgique.numero_facture = :li_numero_facture and type_facture = :ci_type_facture ;
		
		if ii_numero_envoi <> 0 then 
				tab_1.tabpage_1.dw_gene.object.t_envoi.text = "Envoi N°" +string(ii_numero_envoi) + " du "+ string(v_date_envoi)
		end if
	else
		title = "Facture N°" + string(li_numero_facture)  
	end if



	
	var_code_local =  tab_1.tabpage_1.dw_gene.getitemnumber(1, "code_patient") 

	dw_lignes_notes.settransobject(sqlca)
end if	
	

end event

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_maj
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_efacturation_belgique_maj
integer x = 3433
integer y = 2204
integer width = 544
integer height = 132
integer taborder = 10
boolean bringtotop = true
end type

event clicked;		// on renvoie 1 si on a supprimé la facture, 0 sinon
		closeWithReturn(parent, 0)

end event

type tab_1 from tab within w_efacturation_belgique_maj
integer x = 32
integer y = 24
integer width = 4357
integer height = 2100
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 16777215
boolean focusonbuttondown = true
boolean boldselectedtext = true
alignment alignment = center!
integer selectedtab = 1
tabpage_1 tabpage_1
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

type tabpage_1 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4320
integer height = 1972
long backcolor = 16777215
string text = "Généralités"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
dw_gene dw_gene
end type

on tabpage_1.create
this.dw_gene=create dw_gene
this.Control[]={this.dw_gene}
end on

on tabpage_1.destroy
destroy(this.dw_gene)
end on

type dw_gene from datawindow within tabpage_1
string tag = "brush"
integer x = 55
integer y = 16
integer width = 4059
integer height = 1948
integer taborder = 30
string title = "none"
string dataobject = "dw_efacture_belgique_generalites"
boolean border = false
boolean livescroll = true
end type

event buttonclicked;string ls_object

ls_Object = String(dwo.name)

choose case ls_Object
	case  "b_date_heure_lecture" 
		// Date de jour
		setitem(1, "identite_date_heure_lecture", datetime(today(), now()))
end choose
end event

event itemchanged;//si control pas une "column" on ne prend pas en compte
if dwo.type = "column" then
	
	//sélection suivant le nom de la "column" de la data window que l'on quitte
	choose case dwo.name
		
		case "code_oa_affiliation"	// OA de destination
			this.setitem(row,"code_oa_destination",fxg_mutualite_destination(data))
	end choose
end if
end event

type tabpage_2 from userobject within tab_1
integer x = 18
integer y = 112
integer width = 4320
integer height = 1972
long backcolor = 16777215
string text = "Lignes de Facture"
long tabtextcolor = 33554432
long tabbackcolor = 16777215
long picturemaskcolor = 536870912
dw_lignes dw_lignes
end type

on tabpage_2.create
this.dw_lignes=create dw_lignes
this.Control[]={this.dw_lignes}
end on

on tabpage_2.destroy
destroy(this.dw_lignes)
end on

type dw_lignes from datawindow within tabpage_2
string tag = "brush"
integer x = 46
integer y = 52
integer width = 4238
integer height = 1860
integer taborder = 30
string title = "none"
string dataobject = "dw_efacture_belgique_lignes"
boolean border = false
boolean livescroll = true
end type

type cb_supprimer from uo_picturebutton_390x120 within w_efacturation_belgique_maj
integer x = 1591
integer y = 2204
integer width = 544
integer height = 132
integer taborder = 40
boolean bringtotop = true
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;if messagebox("ATTENTION", "Vous allez supprimer cette " + si_libelle_type_facture  +" !~n~n(Les soins du patient ne seront pas supprimés.)~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
	
	long lig, tot
	
	tab_1.tabpage_1.dw_gene.deleterow(1)
	
	tot = tab_1.tabpage_2.dw_lignes.rowcount()
	
	// on ne supprime pas les lignes ici, elle le seront pas la liaison en base de données
	tab_1.tabpage_2.dw_lignes.reset()

end if


end event

type cb_annuler from uo_picturebutton_390x120 within w_efacturation_belgique_maj
integer x = 2208
integer y = 2204
integer width = 544
integer height = 132
integer taborder = 60
boolean bringtotop = true
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;rollback ;
tab_1.tabpage_1.dw_gene.retrieve(li_numero_facture, ci_type_facture)
tab_1.tabpage_2.dw_lignes.retrieve(li_numero_facture, ci_type_facture)

end event

type cb_enregistrer from uo_picturebutton_390x120 within w_efacturation_belgique_maj
integer x = 2821
integer y = 2204
integer width = 544
integer height = 132
integer taborder = 70
boolean bringtotop = true
string text = "&Enregistrer"
boolean default = true
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;tab_1.tabpage_1.dw_gene.accepttext()
tab_1.tabpage_2.dw_lignes.accepttext()

if tab_1.tabpage_1.dw_gene.update() = 1 and tab_1.tabpage_2.dw_lignes.update() = 1 then
	commit ;
	
	if tab_1.tabpage_1.dw_gene.rowcount() = 0 then 
		Messagebox("ATTENTION", "La " + si_libelle_type_facture + " vient d'être supprimée !")
		
		// Mise à jour des lignes de soins correspondantes
		update soins set derniere_efacture = 0 where code = :var_code_local and derniere_efacture = :li_numero_facture ;
		
		commit ;
		
		// on renvoie 1 si on a supprimé la facture, 0 sinon
		closeWithReturn(parent, 1)
	end if
else
	MessageBox("ATTENTION !","La mise à jour de la base de données a échoué !~n"+	"Aucune modification ne sera prise en compte !~n~nErreur : " + sqlca.sqlerrtext,Exclamation!)
	Rollback ;

end if


end event

type uo_1 from resize_fenetre within w_efacturation_belgique_maj
boolean visible = false
integer y = 1372
integer taborder = 50
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type cb_note from uo_picturebutton_390x120 within w_efacturation_belgique_maj
boolean visible = false
integer x = 137
integer y = 2204
integer width = 1015
integer height = 132
integer taborder = 50
boolean bringtotop = true
string text = "&Générer Note de Crédit"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;if messagebox("ATTENTION", "Confirmez-vous la génération d'une Note de Crédit à partir de cette facture ?", Question!, YesNo!, 2) = 1 then
	
// La fenetre renvoie un numéro de facture à créer ... -1 si abandon

	dw_lignes_notes.reset()

	long l_numero_note, lig, tot
	
	openWithParm(w_efacturation_belgique_numero, "N")
	
	l_numero_note = Message.DoubleParm
	
	
	
	// création de la note !
	if l_numero_note > 0 then 
	
		string s_code_oa_affiliation, s_niss, s_sexe, s_codes_titulaires, s_cause_traitement
		string s_code_praticien, s_etablissement_de_sejour, s_levee_delai_de_prescription, s_code_oa_destination
		date d_date_facture_precedente
		string s_mutualite_precedente
		integer i_mois_facture_precedente, i_annee_facture_precedente, i_numero_envoi_precedent
		
		string s_numero_compte_financier, s_identite_type_saisie, s_identite_type_support, s_identite_raison_encodage_manuel, s_identite_raison_utilisation_vignette, s_identite_numero_serie_support
		datetime dt_identite_date_heure_lecture
		
		
		
		s_code_oa_affiliation = tab_1.tabpage_1.dw_gene.getitemstring(1, "code_oa_affiliation")
		s_niss = tab_1.tabpage_1.dw_gene.getitemstring(1, "niss")
		s_sexe = tab_1.tabpage_1.dw_gene.getitemstring(1, "sexe")
		s_codes_titulaires = tab_1.tabpage_1.dw_gene.getitemstring(1, "codes_titulaires")
		s_cause_traitement = tab_1.tabpage_1.dw_gene.getitemstring(1, "cause_traitement")
		
		s_code_praticien = tab_1.tabpage_1.dw_gene.getitemstring(1, "code_praticien")
		s_etablissement_de_sejour = tab_1.tabpage_1.dw_gene.getitemstring(1, "etablissement_de_sejour")
		s_levee_delai_de_prescription = tab_1.tabpage_1.dw_gene.getitemstring(1, "levee_delai_de_prescription")
		s_code_oa_destination = tab_1.tabpage_1.dw_gene.getitemstring(1, "code_oa_destination")
		
		d_date_facture_precedente = tab_1.tabpage_1.dw_gene.getitemdate(1, "date_facture")
		
		s_mutualite_precedente = s_code_oa_destination
		
		 i_mois_facture_precedente = month(d_date_facture_precedente)
		 i_annee_facture_precedente = year(d_date_facture_precedente)
		
		s_numero_compte_financier = tab_1.tabpage_1.dw_gene.getitemstring(1, "numero_compte_financier")
		s_identite_type_saisie = tab_1.tabpage_1.dw_gene.getitemstring(1, "identite_type_saisie")
		s_identite_type_support = tab_1.tabpage_1.dw_gene.getitemstring(1, "identite_type_support")
		s_identite_raison_encodage_manuel = tab_1.tabpage_1.dw_gene.getitemstring(1, "identite_raison_encodage_manuel")
		s_identite_raison_utilisation_vignette = tab_1.tabpage_1.dw_gene.getitemstring(1, "identite_raison_utilisation_vignette")
		s_identite_numero_serie_support = tab_1.tabpage_1.dw_gene.getitemstring(1, "identite_numero_serie_support")

		
		dt_identite_date_heure_lecture = tab_1.tabpage_1.dw_gene.getitemDatetime(1, "identite_date_heure_lecture")
		 
		insert into efacture_belgique (numero_facture, type_facture, type_facturation, date_facture, code_patient, code_oa_affiliation, niss, sexe, codes_titulaires, cause_traitement, 
		code_praticien, etablissement_de_sejour, levee_delai_de_prescription, code_oa_destination, numero_facture_precedente, date_facture_precedente,
		numero_envoi_precedent, mois_facture_precedente, annee_facture_precedente, mutualite_precedente, 
		numero_compte_financier, identite_type_saisie, identite_type_support, identite_raison_encodage_manuel, identite_raison_utilisation_vignette, identite_numero_serie_support, numero_document_justificatif ,
		identite_date_heure_lecture, statut_my_carenet)
		
		values (:l_numero_note, 'N', '3', today(*) , :var_code_local, :s_code_oa_affiliation, :s_niss, :s_sexe, :s_codes_titulaires, :s_cause_traitement,
		:s_code_praticien, :s_etablissement_de_sejour, :s_levee_delai_de_prescription, :s_code_oa_destination, :li_numero_facture, :d_date_facture_precedente,
		:ii_numero_envoi, :i_mois_facture_precedente, :i_annee_facture_precedente , :s_mutualite_precedente, 
		:s_numero_compte_financier, :s_identite_type_saisie, :s_identite_type_support, :s_identite_raison_encodage_manuel, :s_identite_raison_utilisation_vignette, :s_identite_numero_serie_support, string(:l_numero_note), 
		:dt_identite_date_heure_lecture, ' ') ;
		
		if sqlca.sqlcode = 0 then
			// on récupère toutes les lignes 
			
			tab_1.tabpage_2.dw_lignes.rowscopy(1, 999, primary!, dw_lignes_notes, 1, primary!)
			
			// mise à jour des valeurs
			tot = dw_lignes_notes.rowcount()
			
			for lig = 1 to tot
				
				// Note de crédit
				dw_lignes_notes.setitem(lig,"numero_facture", l_numero_note)
				dw_lignes_notes.setitem(lig,"type_facture", 'N')
				
				// montants en négatif
				dw_lignes_notes.setitem(lig, "montant_rembourse_oa", - dw_lignes_notes.Getitemnumber(lig, "montant_rembourse_oa" ))
				
				
			next
			
			if dw_lignes_notes.update() = 1 then 
				
				commit ; 
				Messagebox("INFORMATION", "La Note de Crédit N°" + string(l_numero_note) + " a été générée !~n~n" + sqlca.sqlerrtext)
			else
				Messagebox("ATTENTION", "Erreur dans la génération des lignes de la Note de Crédit !~n~n" + sqlca.sqlerrtext)
				rollback ;
			end if
		
			
			
		else
			
			Messagebox("ATTENTION", "Erreur dans la génération de l'entête de la Note de Crédit !~n~n" + sqlca.sqlerrtext)
			
			rollback ;
		end if
		
		
	end if 




end if


end event

type dw_lignes_notes from datawindow within w_efacturation_belgique_maj
string tag = "brush"
boolean visible = false
integer x = 2898
integer y = 1028
integer width = 1413
integer height = 1092
integer taborder = 40
boolean bringtotop = true
string title = "none"
string dataobject = "dw_efacture_belgique_lignes"
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

