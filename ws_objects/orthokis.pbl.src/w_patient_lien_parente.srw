$PBExportHeader$w_patient_lien_parente.srw
forward
global type w_patient_lien_parente from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_patient_lien_parente
end type
type dw_liste from datawindow within w_patient_lien_parente
end type
type pb_ajouter from uo_picturebutton_390x120 within w_patient_lien_parente
end type
type dw_maj from datawindow within w_patient_lien_parente
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_patient_lien_parente
end type
type pb_annuler from uo_picturebutton_390x120 within w_patient_lien_parente
end type
type pb_modifier from uo_picturebutton_390x120 within w_patient_lien_parente
end type
type pb_supprimer from uo_picturebutton_390x120 within w_patient_lien_parente
end type
type pb_soins from picturebutton within w_patient_lien_parente
end type
type pb_admini from picturebutton within w_patient_lien_parente
end type
type pb_commentaires_administratifs from picturebutton within w_patient_lien_parente
end type
type pb_commentaires_cliniques from picturebutton within w_patient_lien_parente
end type
type pb_rdv from picturebutton within w_patient_lien_parente
end type
type pb_due from picturebutton within w_patient_lien_parente
end type
type uo_1 from resize_fenetre within w_patient_lien_parente
end type
type pb_1 from picturebutton within w_patient_lien_parente
end type
type pb_imagerie from picturebutton within w_patient_lien_parente
end type
type pb_2 from picturebutton within w_patient_lien_parente
end type
end forward

global type w_patient_lien_parente from w_fenetre_arakis
boolean visible = false
integer width = 3374
integer height = 2424
string title = "Mise à jour les liens de parenté"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_fermer pb_fermer
dw_liste dw_liste
pb_ajouter pb_ajouter
dw_maj dw_maj
pb_enregistrer pb_enregistrer
pb_annuler pb_annuler
pb_modifier pb_modifier
pb_supprimer pb_supprimer
pb_soins pb_soins
pb_admini pb_admini
pb_commentaires_administratifs pb_commentaires_administratifs
pb_commentaires_cliniques pb_commentaires_cliniques
pb_rdv pb_rdv
pb_due pb_due
uo_1 uo_1
pb_1 pb_1
pb_imagerie pb_imagerie
pb_2 pb_2
end type
global w_patient_lien_parente w_patient_lien_parente

type variables


double var_code_local

double tab_parente[]


end variables

forward prototypes
public subroutine inactive_boutons ()
end prototypes

public subroutine inactive_boutons ();

// Mets tous les boutons en incactif
// utile une fois qu'on a cliqué sur un .. pour éviter plantage si on clique sur un autre rapidos

pb_admini.enabled = false
pb_soins.enabled = false
pb_commentaires_cliniques.enabled = false
pb_commentaires_administratifs.enabled = false
pb_rdv.enabled = false
pb_due.enabled = false
pb_supprimer.enabled = false
pb_enregistrer.enabled = false
pb_modifier.enabled = false
pb_annuler.enabled = false
pb_1.enabled = false
pb_fermer.enabled = false
pb_ajouter.enabled = false
end subroutine

on w_patient_lien_parente.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_liste=create dw_liste
this.pb_ajouter=create pb_ajouter
this.dw_maj=create dw_maj
this.pb_enregistrer=create pb_enregistrer
this.pb_annuler=create pb_annuler
this.pb_modifier=create pb_modifier
this.pb_supprimer=create pb_supprimer
this.pb_soins=create pb_soins
this.pb_admini=create pb_admini
this.pb_commentaires_administratifs=create pb_commentaires_administratifs
this.pb_commentaires_cliniques=create pb_commentaires_cliniques
this.pb_rdv=create pb_rdv
this.pb_due=create pb_due
this.uo_1=create uo_1
this.pb_1=create pb_1
this.pb_imagerie=create pb_imagerie
this.pb_2=create pb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_liste
this.Control[iCurrent+3]=this.pb_ajouter
this.Control[iCurrent+4]=this.dw_maj
this.Control[iCurrent+5]=this.pb_enregistrer
this.Control[iCurrent+6]=this.pb_annuler
this.Control[iCurrent+7]=this.pb_modifier
this.Control[iCurrent+8]=this.pb_supprimer
this.Control[iCurrent+9]=this.pb_soins
this.Control[iCurrent+10]=this.pb_admini
this.Control[iCurrent+11]=this.pb_commentaires_administratifs
this.Control[iCurrent+12]=this.pb_commentaires_cliniques
this.Control[iCurrent+13]=this.pb_rdv
this.Control[iCurrent+14]=this.pb_due
this.Control[iCurrent+15]=this.uo_1
this.Control[iCurrent+16]=this.pb_1
this.Control[iCurrent+17]=this.pb_imagerie
this.Control[iCurrent+18]=this.pb_2
end on

on w_patient_lien_parente.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_liste)
destroy(this.pb_ajouter)
destroy(this.dw_maj)
destroy(this.pb_enregistrer)
destroy(this.pb_annuler)
destroy(this.pb_modifier)
destroy(this.pb_supprimer)
destroy(this.pb_soins)
destroy(this.pb_admini)
destroy(this.pb_commentaires_administratifs)
destroy(this.pb_commentaires_cliniques)
destroy(this.pb_rdv)
destroy(this.pb_due)
destroy(this.uo_1)
destroy(this.pb_1)
destroy(this.pb_imagerie)
destroy(this.pb_2)
end on

event open;call super::open;
//------------------------------------------------------------
// La fenêtre est VOLONTAIREMENT invisible
// C'est la fonction CENTRER qui la rendra visible !!!
//------------------------------------------------------------

centrer_selon_w_mdi_2020(this)

uo_1.taille(this) // uniquement pour le brush de la datawindow

//pb_admini.backcolor = couleur_fond_fenetre
//pb_commentaires_administratifs.backcolor = couleur_fond_fenetre
//pb_commentaires_cliniques.backcolor = couleur_fond_fenetre
//pb_rdv.backcolor = couleur_fond_fenetre
//pb_soins.backcolor = couleur_fond_fenetre
//pb_due.backcolor = couleur_fond_fenetre


// recup du code patient passé en param

var_code_local = message.doubleparm

// recherche des éléments pour titre de la fenêtre
string v_nom, v_prenom, v_numero_dossier

select nom, prenom, numero_dossier into :v_nom, :v_prenom, :v_numero_dossier from patient 
where code = :var_code_local ;


this.title = "Liens de parenté du patient "+trim(v_nom)+" "+trim(v_prenom)+" ("+string(v_numero_dossier)+")"


dw_liste.settransobject(sqlca)
dw_liste.retrieve(var_code_local)

dw_maj.settransobject(sqlca)

end event

event resize;call super::resize;

uo_1.retaille(this) // uniquement pour le brush de la datawindow

end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_lien_parente
end type

type pb_fermer from uo_picturebutton_390x120 within w_patient_lien_parente
integer x = 2761
integer y = 2084
integer width = 517
integer taborder = 10
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;

close(parent)
end event

type dw_liste from datawindow within w_patient_lien_parente
string tag = "brush "
integer x = 183
integer y = 16
integer width = 3136
integer height = 1296
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_lien_parente_liste"
boolean vscrollbar = true
boolean livescroll = true
end type

event clicked;

If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

event retrieveend;if rowcount > 0 then
	This.SelectRow(0,False)
	This.SelectRow(1,True)
	This.setrow(1)
end if

if getitemnumber(rowcount, "due_totale") + due (var_code_local , today()) > 0  then
	pb_due.visible = true
else
	pb_due.visible = false
end if
end event

event doubleclicked;

pb_modifier.triggerevent(clicked!)
end event

type pb_ajouter from uo_picturebutton_390x120 within w_patient_lien_parente
integer x = 110
integer y = 2084
integer width = 517
integer taborder = 20
boolean bringtotop = true
string text = "&Ajouter"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;


// patient en parenté ...
var_suite = false

string var_nom_sauve

var_nom_sauve = var_nom

// Recherche du nom de famille pour le proposer par défaut
select isnull(nom,'') into :var_nom from patient where code = :var_code_local ;

open(w_cherche) 
//guo_fenetre_modale.wf_ouvrir(w_cherche)


if var_suite then
	
	if var_code = var_code_local then 
		// Pas glop !
		Messagebox("ATTENTION !","Vous ne pouvez pas relier ce patient à lui-même !")
	else
		
		dw_maj.reset()
		dw_maj.insertrow(0)
		dw_maj.setitem(dw_maj.rowcount(),"code_patient1",var_code_local)
		dw_maj.setitem(dw_maj.rowcount(),"code_patient2",var_code)
		
		// lien par défaut
		long tri_min
		double v_code_min
		select min(ordre_trie) into :tri_min from lien_parente where actif = 1; 
		select min(code) into :v_code_min from lien_parente where actif = 1 and ordre_trie = :tri_min ; 
		
		dw_maj.setitem(dw_maj.rowcount(),"code_lien_parente",v_code_min)
	
		// on utilise des libéllés pour afficher nom des patient
		string v_complet1, v_complet2
		select nom + (case when "prenom" is null then '' else ' ' + "prenom" end) into :v_complet1 from patient where code = :var_code_local ;
		select nom + (case when "prenom" is null then '' else ' ' + "prenom" end) into :v_complet2 from patient where code = :var_code  ;
		
		dw_maj.object.nom1_par_prog.text = v_complet1
		dw_maj.object.nom2_par_prog.text = v_complet2
		
		dw_maj.visible = true
		pb_annuler.visible = true
		pb_enregistrer.visible = true
		
		pb_ajouter.visible = false
		pb_modifier.visible = false
		pb_supprimer.visible = false		
		pb_fermer.visible = false		

		string v_code_lien
		string v_liaison, v_synchro

		select top 1 code, liaison_financiere, synchroniser into :v_code_lien, :v_liaison, :v_synchro  from lien_parente where actif = 1 order by ordre_trie ;
		
		dw_maj.SetItem(1, 'code_lien_parente',v_code_lien ) 
		dw_maj.SetItem(1, "liaison_financiere", v_liaison)
		dw_maj.SetItem(1, "synchroniser", v_synchro)

	end if
	
end if

// on remet le nom sauvegardé
var_nom = var_nom_sauve

end event

type dw_maj from datawindow within w_patient_lien_parente
string tag = "brush"
boolean visible = false
integer x = 544
integer y = 1324
integer width = 2213
integer height = 716
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_lien_parente_ajout"
boolean livescroll = true
end type

event itemchanged;

// si on modifier le type de lien on actualise les syncho et liaison fi

string v_code_lien
string v_liaison, v_synchro

if this.rowcount() > 0 then
	
	if dwo.type = "column" and dwo.name = 'code_lien_parente' then
		v_code_lien = data
		
		select liaison_financiere, synchroniser into  :v_liaison, :v_synchro
		from lien_parente where code = :v_code_lien ;
		
		SetItem(row, "liaison_financiere", v_liaison)
		SetItem(row, "synchroniser", v_synchro)
	end if
end if

end event

type pb_enregistrer from uo_picturebutton_390x120 within w_patient_lien_parente
boolean visible = false
integer x = 2231
integer y = 2084
integer width = 517
integer taborder = 30
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;

if dw_maj.update() = 1 then
	commit ;
else
	rollback ;
end if

// raffraichissement
dw_liste.retrieve(var_code_local)


dw_maj.visible = false
pb_annuler.visible = false
pb_enregistrer.visible = false

pb_ajouter.visible = true
pb_modifier.visible = true
pb_supprimer.visible = true
pb_fermer.visible = true		


end event

type pb_annuler from uo_picturebutton_390x120 within w_patient_lien_parente
boolean visible = false
integer x = 1701
integer y = 2084
integer width = 517
integer taborder = 40
boolean bringtotop = true
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;
dw_maj.visible = false
pb_annuler.visible = false
pb_enregistrer.visible = false

pb_ajouter.visible = true
pb_modifier.visible = true
pb_supprimer.visible = true
pb_fermer.visible = true		

dw_liste.retrieve(var_code_local)

end event

type pb_modifier from uo_picturebutton_390x120 within w_patient_lien_parente
integer x = 640
integer y = 2084
integer width = 517
integer taborder = 30
boolean bringtotop = true
string text = "&Modifier"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;
// récup des data de la liste

if dw_liste.rowcount() > 0 then
	
	double  v_patient2
	
	v_patient2 = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
	
	dw_maj.retrieve(var_code_local, v_patient2)
	if dw_maj.rowcount() = 0 then
		dw_maj.retrieve(v_patient2, var_code_local)
	end if
	
	if dw_maj.rowcount() > 0 then

		dw_maj.visible = true
		pb_annuler.visible = true
		pb_enregistrer.visible = true
		
		pb_ajouter.visible = false
		pb_modifier.visible = false
		pb_supprimer.visible = false		
		pb_fermer.visible = false		
	end if
	
end if
		
end event

type pb_supprimer from uo_picturebutton_390x120 within w_patient_lien_parente
integer x = 1170
integer y = 2084
integer width = 517
integer taborder = 40
boolean bringtotop = true
string text = "&Supprimer"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;



if MessageBox("ATTENTION","Confirmez-vous la suppression de ce lien de parenté ?",Question!,YesNo!,2) = 1 then
	
	double v_patient2
	v_patient2 = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")

	// en SQL directement
	delete from patient_lien_parente 
	where (code_patient1 = :var_code_local and code_patient2 = :v_patient2) 
	or (code_patient2 = :var_code_local and code_patient1 = :v_patient2) ;
	commit ;
	dw_liste.retrieve(var_code_local)

end if
end event

type pb_soins from picturebutton within w_patient_lien_parente
event mouse_move pbm_mousemove
string tag = "Gestion des Soins"
integer y = 508
integer width = 174
integer height = 152
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_regl.png"
string powertiptext = "Soins / Règlements du patient"
long backcolor = 553648127
end type

event clicked;if dw_liste.rowcount() > 0 then
	
	inactive_boutons()

	param_win[1] = 'R'
	param_win[3] = 'M'
	
	w_soins_reg_maj win
	
	double v_code
	v_code = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
	
	//Mise à jour des patients en mémoire
	MajTabPatientsCourants(v_code)
	
	m_orthokis_2020.ouvrir_mdi(6)
	
	close(parent)
end if
end event

event rbuttondown;this.triggerevent(clicked!)
end event

type pb_admini from picturebutton within w_patient_lien_parente
event mouve_move pbm_mousemove
string tag = "Fiche Administrative du Patient"
integer y = 16
integer width = 174
integer height = 152
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_admini.png"
string powertiptext = "Fiche Administrative du Patient"
long backcolor = 553648127
end type

event clicked;if dw_liste.rowcount() > 0 then

	inactive_boutons()
	
	w_patient_maj win
	
	double v_code
	v_code = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
	
	//Mise à jour des patients en mémoire
	MajTabPatientsCourants(v_code)
	
	m_orthokis_2020.ouvrir_mdi(2)
	
	close(parent)
end if
	

end event

event rbuttondown;

this.triggerevent(clicked!)
end event

type pb_commentaires_administratifs from picturebutton within w_patient_lien_parente
event mouse_move pbm_mousemove
string tag = "Commentaires Administratifs"
integer y = 344
integer width = 174
integer height = 152
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_coment_admini.png"
string powertiptext = "Commentaires Administratifs du Patient"
long backcolor = 553648127
end type

event clicked;if dw_liste.rowcount() > 0 then
	
	inactive_boutons()

	w_coment_admini_maj win
	
	
	double v_code
	v_code = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
	
	//Mise à jour des patients en mémoire
	MajTabPatientsCourants(v_code)
	
	//on ouvre la fenètre voulue
	m_orthokis_2020.ouvrir_mdi(3)
	
	close(parent)
end if
end event

event rbuttondown;this.triggerevent(clicked!)
end event

type pb_commentaires_cliniques from picturebutton within w_patient_lien_parente
event mouse_move pbm_mousemove
string tag = "Commentaires Cliniques"
integer y = 672
integer width = 174
integer height = 152
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_coment.png"
string powertiptext = "Commentaires Cliniques du Patient"
long backcolor = 553648127
end type

event clicked;if dw_liste.rowcount() > 0 then
	
	inactive_boutons()

	w_coment_maj win
	
	double v_code
	v_code = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
	
	//Mise à jour des patients en mémoire
	MajTabPatientsCourants(v_code)
	
	m_orthokis_2020.ouvrir_mdi(9)
	
	close(parent)
end if
end event

event rbuttondown;this.triggerevent(clicked!)
end event

type pb_rdv from picturebutton within w_patient_lien_parente
event mouse_move pbm_mousemove
string tag = "Gestion des Rendez-vous"
integer y = 836
integer width = 174
integer height = 152
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_rdv.png"
string powertiptext = "Rendez-vous du Patient"
long backcolor = 553648127
end type

event clicked;if dw_liste.rowcount() > 0 then
	
	inactive_boutons()

	w_rdv_maj win
	
	double v_code
	v_code = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
	
	//Mise à jour des patients en mémoire
	MajTabPatientsCourants(v_code)
	
	//on ouvre la fenètre voulue

	m_orthokis_2020.ouvrir_mdi(8)

	close(parent)
	
end if

end event

event rbuttondown;this.triggerevent(clicked!)
end event

type pb_due from picturebutton within w_patient_lien_parente
string tag = "Gestion des Rendez-vous"
boolean visible = false
integer x = 2953
integer y = 1604
integer width = 174
integer height = 152
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_money.png"
string powertiptext = "Somme due par les patients liés financièrement"
long backcolor = 553648127
end type

event clicked;

// On passe en paramètre la liste des patients qui doivent de l'argent  ...

//le 1er, c'est le nombre de patient listés
// Le 2ème c'est le patient courant, qu'il doient ou pas de l'argent


long cpt, tot, cpt_tab

tab_parente[2] = var_code_local

cpt_tab = 2

tot = dw_liste.rowcount()

for cpt = 1 to tot
	if dw_liste.getitemnumber(cpt,"due") > 0 and (dw_liste.getitemstring(cpt, "patient_lien_parente_liaison_financiere") = "O" or dw_liste.getitemstring(cpt, "patient_lien_parente_liaison_financiere") = "D")  then
		cpt_tab = cpt_tab + 1
		tab_parente[cpt_tab] =	dw_liste.getitemnumber(cpt,"patient_code") 
	end if
next

// Nombre de patient listés 
tab_parente[1] = cpt_tab - 1


// la fenetre lira directement le tableau 
open(w_patient_lien_parente_due)

if message.DoubleParm = 1 then
	// y a eu un reglement global saisie 
	dw_liste.retrieve(var_code_local)
end if


end event

type uo_1 from resize_fenetre within w_patient_lien_parente
boolean visible = false
integer x = 151
integer y = 1164
integer taborder = 70
boolean bringtotop = true
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type pb_1 from picturebutton within w_patient_lien_parente
string tag = "Agenda"
integer y = 1000
integer width = 174
integer height = 152
integer taborder = 60
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_agenda.png"
string powertiptext = "Agenda pour le Patient"
long backcolor = 553648127
end type

event clicked;if dw_liste.rowcount() > 0 then
	
	inactive_boutons()

	
	double v_code
	v_code = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
	
	//Mise à jour des patients en mémoire
	MajTabPatientsCourants(v_code)
	
	ouvrir_agenda_salle_attente(v_code, 0)
	
	close(parent)
	
end if

end event

type pb_imagerie from picturebutton within w_patient_lien_parente
string tag = "Imagerie"
integer y = 1164
integer width = 174
integer height = 152
integer taborder = 70
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_images.png"
string powertiptext = "Imagerie du Patient"
long backcolor = 553648127
end type

event clicked;if dw_liste.rowcount() > 0 then
	
	inactive_boutons()

	w_explorateur_2013 win
	
	double v_code
	v_code = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
	
	//Mise à jour des patients en mémoire
	MajTabPatientsCourants(v_code)
	
	//on ouvre la fenètre voulue
	m_orthokis_2020.ouvrir_mdi(12)

	close(parent)
	
end if

end event

type pb_2 from picturebutton within w_patient_lien_parente
event mouse_move pbm_mousemove
string tag = "Courriers / Actions / Documents"
integer y = 180
integer width = 174
integer height = 152
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_fiche_admini5.png"
string powertiptext = "Courriers / Actions / Documents du Patient"
long backcolor = 553648127
end type

event clicked;if dw_liste.rowcount() > 0 then
	
	inactive_boutons()

	w_patient_ged win
	
	
	double v_code
	v_code = dw_liste.getitemnumber(dw_liste.getrow(),"patient_code")
	
	//Mise à jour des patients en mémoire
	MajTabPatientsCourants(v_code)
	
	//on ouvre la fenètre voulue
	m_orthokis_2020.ouvrir_mdi(16)
	
	close(parent)
end if
end event

event rbuttondown;this.triggerevent(clicked!)
end event

