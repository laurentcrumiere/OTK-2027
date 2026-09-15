$PBExportHeader$w_patient_lien_parente_duplication.srw
forward
global type w_patient_lien_parente_duplication from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120 within w_patient_lien_parente_duplication
end type
type dw_maj from datawindow within w_patient_lien_parente_duplication
end type
type pb_enregistrer from uo_picturebutton_390x120 within w_patient_lien_parente_duplication
end type
type pb_annuler from uo_picturebutton_390x120 within w_patient_lien_parente_duplication
end type
type uo_1 from resize_fenetre within w_patient_lien_parente_duplication
end type
end forward

global type w_patient_lien_parente_duplication from w_fenetre_arakis
boolean visible = false
integer width = 2304
integer height = 1192
string title = "Mise à jour les liens de parenté"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
pb_fermer pb_fermer
dw_maj dw_maj
pb_enregistrer pb_enregistrer
pb_annuler pb_annuler
uo_1 uo_1
end type
global w_patient_lien_parente_duplication w_patient_lien_parente_duplication

type variables


double var_code_local

double tab_parente[]


end variables

on w_patient_lien_parente_duplication.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_maj=create dw_maj
this.pb_enregistrer=create pb_enregistrer
this.pb_annuler=create pb_annuler
this.uo_1=create uo_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_maj
this.Control[iCurrent+3]=this.pb_enregistrer
this.Control[iCurrent+4]=this.pb_annuler
this.Control[iCurrent+5]=this.uo_1
end on

on w_patient_lien_parente_duplication.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_maj)
destroy(this.pb_enregistrer)
destroy(this.pb_annuler)
destroy(this.uo_1)
end on

event open;call super::open;
//------------------------------------------------------------
// La fenêtre est VOLONTAIREMENT invisible
// C'est la fonction CENTRER qui la rendra visible !!!
//------------------------------------------------------------
double var_code_nouveau

var_code_local = message.doubleparm
var_code_nouveau = double(param_win[1])

centrer_selon_w_mdi_2020(this)

uo_1.taille(this) // uniquement pour le brush de la datawindow


// recup du code patient passé en param


// recherche des éléments pour titre de la fenêtre
string v_nom, v_prenom, v_numero_dossier


select nom, prenom, numero_dossier into :v_nom, :v_prenom, :v_numero_dossier from patient 
where code = :var_code_local ;


this.title = "Liens de parenté du patient "+trim(v_nom)+" "+trim(v_prenom)+" ("+string(v_numero_dossier)+")"


dw_maj.settransobject(sqlca)


dw_maj.reset()
dw_maj.insertrow(0)
dw_maj.setitem(dw_maj.rowcount(),"code_patient1",var_code_local)
dw_maj.setitem(dw_maj.rowcount(),"code_patient2",var_code_nouveau)

// lien par défaut
long tri_min
double v_code_min
select min(ordre_trie) into :tri_min from lien_parente where actif = 1; 
select min(code) into :v_code_min from lien_parente where actif = 1 and ordre_trie = :tri_min ; 

dw_maj.setitem(dw_maj.rowcount(),"code_lien_parente",v_code_min)

// on utilise des libéllés pour afficher nom des patient
string v_complet1, v_complet2
select nom + (case when "prenom" is null then '' else ' ' + "prenom" end) into :v_complet1 from patient where code = :var_code_local ;
select nom + (case when "prenom" is null then '' else ' ' + "prenom" end) into :v_complet2 from patient where code = :var_code_nouveau  ;

dw_maj.object.nom1_par_prog.text = v_complet1
dw_maj.object.nom2_par_prog.text = v_complet2

end event

event resize;call super::resize;

uo_1.retaille(this) // uniquement pour le brush de la datawindow

end event

type p_fond from w_fenetre_arakis`p_fond within w_patient_lien_parente_duplication
integer x = 635
integer y = 844
end type

type pb_fermer from uo_picturebutton_390x120 within w_patient_lien_parente_duplication
integer x = 1486
integer y = 888
integer width = 517
integer taborder = 10
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;

close(parent)
end event

type dw_maj from datawindow within w_patient_lien_parente_duplication
string tag = "brush"
integer x = 37
integer y = 24
integer width = 2213
integer height = 788
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_patient_lien_parente_ajout"
boolean livescroll = true
borderstyle borderstyle = styleraised!
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

type pb_enregistrer from uo_picturebutton_390x120 within w_patient_lien_parente_duplication
integer x = 955
integer y = 888
integer width = 517
integer taborder = 30
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;//

if dw_maj.update() = 1 then
	commit ;
else
	rollback ;
end if

close(parent)

end event

type pb_annuler from uo_picturebutton_390x120 within w_patient_lien_parente_duplication
integer x = 425
integer y = 888
integer width = 517
integer taborder = 40
boolean bringtotop = true
string text = "A&nnuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;//
//dw_maj.visible = false
//pb_annuler.visible = false
//pb_enregistrer.visible = false
//
//pb_ajouter.visible = true
//pb_modifier.visible = true
//pb_supprimer.visible = true
//pb_fermer.visible = true		
//
dw_maj.retrieve(var_code_local)
//
end event

type uo_1 from resize_fenetre within w_patient_lien_parente_duplication
boolean visible = false
integer x = 1856
integer y = 80
integer taborder = 70
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

