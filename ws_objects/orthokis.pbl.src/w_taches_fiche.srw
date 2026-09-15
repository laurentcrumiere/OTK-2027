$PBExportHeader$w_taches_fiche.srw
$PBExportComments$Héritée de param_fiche
forward
global type w_taches_fiche from w_param_fiche
end type
type dw_liste_taches_defaut from datawindow within w_taches_fiche
end type
end forward

global type w_taches_fiche from w_param_fiche
integer width = 3511
integer height = 1752
string title = "Tâche"
dw_liste_taches_defaut dw_liste_taches_defaut
end type
global w_taches_fiche w_taches_fiche

type variables


double v_id
end variables

on w_taches_fiche.create
int iCurrent
call super::create
this.dw_liste_taches_defaut=create dw_liste_taches_defaut
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.dw_liste_taches_defaut
end on

on w_taches_fiche.destroy
call super::destroy
destroy(this.dw_liste_taches_defaut)
end on

event open;// Passage de paramètre entre fenêtre
// après un openwithparm(nom_fenêtre,paramètre(string,number...)
//

double var_code_local , var_numero_dossier_local
string var_nom_local

v_id = message.doubleparm

// param_win[1] sert à savoir si on veut un patient par defaut (code interne) ou pas (vide)

uo_1.taille(this)
//centrer(this)

//dw_fiche.dataobject = "dw_taches_fiche"

dw_fiche.settransobject(SQLCA)

dw_liste_taches_defaut.SetTransObject(SQLCA)
dw_liste_taches_defaut.Retrieve()


if v_id = 0 then
	dw_fiche.insertrow(0)
	// Valeur par defaur ...
	this.title = "Création d'une Tâche"
	dw_fiche.Setitem(1, "date_echeance", relativedate(today(),1))
	dw_fiche.Setitem(1, "texte", " ")
	dw_fiche.Setitem(1, "utilisateur_emetteur", utilisateur_code)
	dw_fiche.Setitem(1, "utilisateur_destinataire", utilisateur_code)
	dw_fiche.Setitem(1, "saisie", now())
	
	if param_win[1] <> "" then 
		// patient par defaut
		var_code_local = double(param_win[1])
		
		select top 1 nom + ' ' + isnull(prenom, ''), numero_dossier 
		into :var_nom_local, :var_numero_dossier_local
		from patient
		where code = :var_code_local ;
		
		dw_fiche.SetItem(1, "code", var_code_local)
		dw_fiche.SetItem(1, "nom_patient", var_nom_local + "  (" + string(var_numero_dossier_local) + ")")
		
	end if
	

else
	dw_fiche.retrieve(v_id)
	this.title = "Mise à jour d'une Tâche"
end if

if enregistrement_automatique then
	cb_annuler.visible = false
	cb_enregistrer.visible = false
end if


dw_fiche.SetFocus()



end event

type p_fond from w_param_fiche`p_fond within w_taches_fiche
end type

type cb_fermer from w_param_fiche`cb_fermer within w_taches_fiche
integer x = 2158
integer y = 1408
integer width = 576
end type

event cb_fermer::clicked;dw_fiche.accepttext()

if dw_fiche.rowcount() > 0 then
	v_id = dw_fiche.getitemnumber(1, "id")
	
	
	// Vérification pour ne pas avoir de groupe nul ou vide
	integer v_gd
	
	v_gd = dw_fiche.getitemnumber(1, "groupe_destinataire") 
	zeroi(v_gd)
		
	if v_gd = 0 then
		dw_fiche.setitem(1, "type_destinataire", "U")
	end if

else
	v_id = 0
end if

if enregistrement_automatique then
	// Si pas de texte, on supprime !!
	if trim(dw_fiche.getitemString(1, "texte") ) = "" then
		dw_fiche.deleterow(1)
		if dw_fiche.update() = 1 then
			commit ;
		else
			Rollback ;
		end if
	end if
	Close(parent)
else
	if dw_fiche.modifiedcount() > 0 or dw_fiche.deletedcount()>0 Then
		If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
			CloseWithReturn(parent, v_id)
		end if
	else
		// Si pas de texte, on supprime !!
		if trim(dw_fiche.getitemString(1, "texte") ) = "" then
			dw_fiche.deleterow(1)
			if dw_fiche.update() = 1 then
				v_id = 0
				commit ;
			else
				Rollback ;
			end if
		end if
		CloseWithReturn(parent, v_id)
	end if
	
end if


end event

type cb_enregistrer from w_param_fiche`cb_enregistrer within w_taches_fiche
integer x = 1559
integer y = 1408
integer width = 576
integer taborder = 40
end type

event cb_enregistrer::clicked;

dw_fiche.accepttext()

if dw_fiche.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type cb_annuler from w_param_fiche`cb_annuler within w_taches_fiche
integer x = 960
integer y = 1408
integer width = 576
integer taborder = 30
end type

event cb_annuler::clicked;


rollback ;
dw_fiche.retrieve(v_id) ;
end event

type cb_imprimer from w_param_fiche`cb_imprimer within w_taches_fiche
boolean visible = false
integer x = 105
integer y = 1064
end type

type uo_1 from w_param_fiche`uo_1 within w_taches_fiche
end type

type dw_fiche from w_param_fiche`dw_fiche within w_taches_fiche
integer width = 3250
integer height = 1332
string dataobject = "dw_taches_fiche"
end type

event dw_fiche::buttonclicked;call super::buttonclicked;


string ls_object
string code_retour
string v_nom_saisi


ls_Object = String(dwo.name)

// envoi d'email
choose case  ls_Object
	case "b_patient" 
		open(w_cherche)
		//guo_fenetre_modale.wf_ouvrir(w_cherche)
		if var_suite then
			SetItem(row, "code", var_code)
			SetItem(row, "nom_patient", var_nom+ "  (" + string(var_numero_dossier) + ")")
		end if
		
		
	case "b_raz_patient"
		long v_nul
		setnull(v_nul)
		setItem(row, "code", v_nul)
		SetItem(row, "nom_patient", "")

	case "b_ouvrir_patient"
		
		if  getitemnumber(row,"code") > 0 then
	
			var_code 				= 	getitemnumber(row,"code")
			var_numero_dossier 	= 	0
			var_nom 				= getitemstring(row,"nom_patient")
			var_nomp 				= ""
			var_pay 					= ""
			var_moul 				= ""
		
			ouverture_salle_attente()
			
			close(parent)
		end if

end choose
end event

event dw_fiche::rbuttondown;call super::rbuttondown;
string nom
String nom_colonne;

nom_colonne = dw_fiche.getColumnName();

// Si le curseur est dans le champ "Plan de traitement"
// Alors on affiche la datawindow pour pouvoir choisir un nouveau plan de ttt
// Sinon on affiche la datawindow pour pouvoir choisir un nouveau diagnostic
//       si le curseur est dans le champ "Diagnostic"

IF nom_colonne = "texte" THEN
	dw_liste_taches_defaut.visible = TRUE
	return 1
END IF
end event

type dw_liste_taches_defaut from datawindow within w_taches_fiche
string tag = "brush"
boolean visible = false
integer x = 2112
integer y = 28
integer width = 1349
integer height = 1152
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_taches_defaut_liste"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = styleraised!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;dw_fiche.accepttext()

if this.rowcount() > 0 then

	string texte, texte_deja, texte_selectionne, texte_final

	texte = this.GetItemString(this.GetRow(),"texte_html")
		
	texte_deja = dw_fiche.GetItemString(1,"texte")

	texte_selectionne = dw_fiche.SelectedText()
	
	if  IsNull(texte_deja) then
		 texte_deja = ""
	end if
	
	IF texte_deja = texte_selectionne or len(trim(texte_deja)) = 0 THEN
		texte_final =  texte
	ELSE	
		texte_final = texte_deja  + texte
	END IF
	
	
	dw_fiche.SetItem(1,"texte",texte_final)
	
	
end if
this.visible = FALSE
end event

event rbuttondown;	this.visible = false

end event

