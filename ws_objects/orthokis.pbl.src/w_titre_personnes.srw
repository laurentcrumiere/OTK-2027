$PBExportHeader$w_titre_personnes.srw
forward
global type w_titre_personnes from w_param
end type
end forward

global type w_titre_personnes from w_param
string title = "Table des Titres de Personnes"
end type
global w_titre_personnes w_titre_personnes

type variables
double max
end variables

on w_titre_personnes.create
int iCurrent
call super::create
end on

on w_titre_personnes.destroy
call super::destroy
end on

event open;call super::open;// Verrouillage selon les droits d'accès
//-------------------------------------------

choose case droits_acces[32]
	Case 'C'
		// Consultation 
		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
		cb_enregistrer.enabled = false
	Case 'M'
		// Modification 
//		cb_ajouter.enabled = false
		cb_supprimer.enabled = false
end choose

//SELECT MAX(code)
//INTO :max
// FROM "titre_personnes" ;



end event

type p_fond from w_param`p_fond within w_titre_personnes
end type

type pb_raz_ordre_trie from w_param`pb_raz_ordre_trie within w_titre_personnes
boolean visible = true
end type

type cb_annuler from w_param`cb_annuler within w_titre_personnes
end type

type cb_enregistrer from w_param`cb_enregistrer within w_titre_personnes
end type

type cb_fermer from w_param`cb_fermer within w_titre_personnes
end type

type cb_supprimer from w_param`cb_supprimer within w_titre_personnes
end type

type cb_ajouter from w_param`cb_ajouter within w_titre_personnes
end type

event cb_ajouter::clicked;
// recherche de la valeur maxi


long nb_lig, cpt_lig

nb_lig = dw_liste.rowcount()

for cpt_lig= 1 to nb_lig
	max = max ( valeur_max, (dw_liste.getitemnumber(cpt_lig,"code")) )
next



IF IsNull(max) THEN
	max = 1
ELSE	
	max = max + 1
END IF	

dw_liste.InsertRow(0)
dw_liste.ScrollToRow(dw_liste.rowcount())
dw_liste.SetItem(dw_liste.RowCount(),"code",max)
dw_liste.Setcolumn(1)
dw_liste.SetFocus()


end event

type dw_liste from w_param`dw_liste within w_titre_personnes
integer x = 1115
integer width = 1883
string dataobject = "dw_titre_personnes_liste"
end type

type uo_1 from w_param`uo_1 within w_titre_personnes
end type

type cbx_avec_les_inactifs from w_param`cbx_avec_les_inactifs within w_titre_personnes
end type

type gb_filtre from w_param`gb_filtre within w_titre_personnes
end type

