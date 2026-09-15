$PBExportHeader$w_soins_reg_trop_percu_fratrie.srw
forward
global type w_soins_reg_trop_percu_fratrie from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120 within w_soins_reg_trop_percu_fratrie
end type
type cb_reporter from uo_picturebutton_390x120 within w_soins_reg_trop_percu_fratrie
end type
type dw_liste from datawindow within w_soins_reg_trop_percu_fratrie
end type
type uo_titre_liste from uo_barre_titre_2022 within w_soins_reg_trop_percu_fratrie
end type
type st_trop from statictext within w_soins_reg_trop_percu_fratrie
end type
type dw_soins from datawindow within w_soins_reg_trop_percu_fratrie
end type
end forward

global type w_soins_reg_trop_percu_fratrie from w_fenetre_arakis
integer width = 3886
integer height = 1740
string title = "Veuillez sélectionner le patient à qui vous souhaitez affecter le trop perçu ..."
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_reporter cb_reporter
dw_liste dw_liste
uo_titre_liste uo_titre_liste
st_trop st_trop
dw_soins dw_soins
end type
global w_soins_reg_trop_percu_fratrie w_soins_reg_trop_percu_fratrie

type variables


double var_code_local

date var_date, var_date_rem
double var_cle_regl
decimal{2} var_mon
string var_payeur, var_comment, var_mode

end variables

forward prototypes
public function long maj_liste ()
end prototypes

public function long maj_liste ();decimal {2} somme_due_famille, v_due
double v_code, v_numero_dossier
string v_nom, v_prenom
long lig = 0

declare cur cursor for 
SELECT isnull(dba.somme_due_patient ("patient"."code", getdate(), 'N'),0), "patient"."code", isnull("patient"."nom",'') , isnull("patient"."prenom",''), numero_dossier
    FROM "lien_parente",   
         "patient",   
         "patient_lien_parente"  
   WHERE ( "patient_lien_parente"."code_patient2" = "patient"."code" ) and  
         ( "patient_lien_parente"."code_lien_parente" = "lien_parente"."code" ) and     ( "patient_lien_parente"."liaison_financiere" in ('O', 'D') ) and
         ( ( "patient_lien_parente"."code_patient1" = :var_code_local ) )    

UNION

  SELECT isnull(dba.somme_due_patient ("patient"."code", getdate(), 'N'),0), "patient"."code", isnull("patient"."nom",'') , isnull("patient"."prenom",''), numero_dossier
        FROM "lien_parente",   
         "patient",   
         "patient_lien_parente"  
   WHERE ( "patient_lien_parente"."code_patient1" = "patient"."code" ) and  
         ( "patient_lien_parente"."code_lien_parente" = "lien_parente"."code" ) and   ( "patient_lien_parente"."liaison_financiere" in ('O', 'D') ) and
         ( ( "patient_lien_parente"."code_patient2" = :var_code_local ) )    ;



open cur ;
somme_due_famille = 0
fetch cur into :v_due, :v_code, :v_nom, :v_prenom, :v_numero_dossier ;


dw_liste.reset()

do while sqlca.sqlcode = 0
	dw_liste.insertrow(9999)
	lig = dw_liste.rowcount() 
	dw_liste.setitem(lig, "nom", v_nom)
	dw_liste.setitem(lig, "prenom", v_prenom)
	dw_liste.setitem(lig, "code", v_code)
	dw_liste.setitem(lig, "numero_dossier", v_numero_dossier)
	dw_liste.setitem(lig, "somme_due", v_due)
	
	
	fetch cur into :v_due, :v_code, :v_nom, :v_prenom, :v_numero_dossier ;
loop

close cur ;

if lig > 0 then
	
	dw_liste.sort()
	
	// positionnement sur le 1er qui doit de l'argent ... 
	
	lig = dw_liste.find("somme_due > 0",1 , 9999)
	
	if lig > 0 then 
		dw_liste.SelectRow(0,False)
		dw_liste.SelectRow(lig,True)
		dw_liste.SetRow(lig)
	else
		
		Messagebox("INFORMATION ! ", "Aucun patient de la fratrie doit de l'argent !")
		cb_reporter.enabled(false)
	
	end if

end if


return dw_liste.rowcount()
end function

on w_soins_reg_trop_percu_fratrie.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_reporter=create cb_reporter
this.dw_liste=create dw_liste
this.uo_titre_liste=create uo_titre_liste
this.st_trop=create st_trop
this.dw_soins=create dw_soins
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_reporter
this.Control[iCurrent+3]=this.dw_liste
this.Control[iCurrent+4]=this.uo_titre_liste
this.Control[iCurrent+5]=this.st_trop
this.Control[iCurrent+6]=this.dw_soins
end on

on w_soins_reg_trop_percu_fratrie.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_reporter)
destroy(this.dw_liste)
destroy(this.uo_titre_liste)
destroy(this.st_trop)
destroy(this.dw_soins)
end on

event open;call super::open;// constitution de la liste 

// verifie la somme due de tous les membres de la famille d'un patient mais ... pas celle du patient


str_reglement reglement

reglement = message.PowerObjectParm
	
var_date = reglement.date
var_code_local = reglement.code
var_cle_regl = reglement.cle
var_mon = reglement.montant
var_date_rem = reglement.dateremise  
var_payeur = reglement.payeur  
var_mode = reglement.mode 
var_comment = reglement.commentaire

st_trop.text = "Trop perçu à reporter : " + string(var_mon) + " €" 
	
if  maj_liste() = 0 then
	Messagebox("ATTENTION", "Il n'y a aucun patient lié à ce patient au niveau financier !")
	close(this)
else

	uo_titre_liste.retaille(couleur_bleue, couleur_bleue, "lc_admini_16.png")	
	

	dw_soins.settransobject(sqlca)


end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_reg_trop_percu_fratrie
end type

type cb_annuler from uo_picturebutton_390x120 within w_soins_reg_trop_percu_fratrie
integer x = 1243
integer y = 1468
integer width = 640
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_reporter from uo_picturebutton_390x120 within w_soins_reg_trop_percu_fratrie
integer x = 1957
integer y = 1468
integer width = 640
integer taborder = 10
boolean bringtotop = true
string text = "Reporter"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;
long lig , lig_soins, cle_soins, lig_reg
decimal{2} v_somme_due, montant_a_ajouter
boolean v_fin
string v_prat, v_monnaie, v_banque, v_user_modif
double var_code_patient_destinataire

datetime v_date_modif
datetime v_heure_saisie
double v_code_remise
date v_transfert

lig = dw_liste.getrow()

v_somme_due = dw_liste.getitemnumber(lig, "somme_due")


if v_somme_due > 0 then

	var_code_patient_destinataire = dw_liste.getitemnumber(lig, "code")
	
	dw_soins.retrieve(var_code_patient_destinataire)
	
	v_fin = false
	lig_soins = 0
	lig_soins = dw_soins.find("cpaye < cdoit", lig_soins , 9999)
	do while not v_fin and lig_soins > 0
		
		montant_a_ajouter = min(var_mon , dw_soins.getitemnumber(lig_soins, "cdoit") - dw_soins.getitemnumber(lig_soins, "cpaye") )
		cle_soins =  dw_soins.getitemnumber(lig_soins, "cle")

		// Ajout effectif du règlement 
		
		// récupération des datas non encore récup
		lig_reg = w_click_soins_reg.tab_1.tabpage_reglements.dw_reglements.getrow()
		v_prat = w_click_soins_reg.tab_1.tabpage_reglements.dw_reglements.getitemString(lig_reg , "paye_code_praticien") 
		v_monnaie = w_click_soins_reg.tab_1.tabpage_reglements.dw_reglements.getitemString(lig_reg , "monnaie") 
		v_banque = w_click_soins_reg.tab_1.tabpage_reglements.dw_reglements.getitemString(lig_reg , "banque_code") 

		v_user_modif = w_click_soins_reg.tab_1.tabpage_reglements.dw_reglements.getitemString(lig_reg, "user_modif") 
		v_date_modif = w_click_soins_reg.tab_1.tabpage_reglements.dw_reglements.getitemDatetime(lig_reg, "date_modif") 
		v_code_remise = w_click_soins_reg.tab_1.tabpage_reglements.dw_reglements.getitemNumber(lig_reg, "code_remise") 
		v_heure_saisie = w_click_soins_reg.tab_1.tabpage_reglements.dw_reglements.getitemDatetime(lig_reg, "heure_saisie") 
		v_transfert = w_click_soins_reg.tab_1.tabpage_reglements.dw_reglements.getitemDate(lig_reg, "transfert") 
		
		insert into paye (code, cle, "date", montant, "mode", commentaire, payeur, dateremise, tp, transfert, origine_tp, code_praticien, montant_monnaie,
				monnaie, banque, user_modif, date_modif, heure_saisie, code_remise, sur_place)
		
		values(:var_code_patient_destinataire, :cle_soins, :var_date, :montant_a_ajouter, :var_mode, :var_comment, :var_payeur, :var_date_rem, 'N', :v_transfert, ' ', :v_prat, :montant_a_ajouter,
				:v_monnaie, :v_banque, :v_user_modif, :v_date_modif, :v_heure_saisie , :v_code_remise, 'O') ;


		
		if sqlca.sqlcode = 0 then
			
			// on déduit 
			
			// On met à jour le reglement originet 
			update paye set montant = montant - :montant_a_ajouter, montant_monnaie =  montant - :montant_a_ajouter 
			where code = :var_code_local and cle = :var_cle_regl and "date" = :var_date and "mode" = :var_mode and dateremise = :var_date_rem and commentaire = :var_comment ;
			
			if sqlca.sqlcode = 0 then
				commit ; 
				var_mon = var_mon - montant_a_ajouter
			else
				Messagebox("ATTENTION", "Erreur dans la modification du règlement trop perçu !~n~n"+ sqlca.sqlerrtext)
				rollback ;
				// on arrete car sinon ça fausse tout
				v_fin = true
			end if
		else
			Messagebox("ATTENTION", "Erreur dans l'ajout d'un règlement !~n~n"+ sqlca.sqlerrtext)
			rollback ;
			// on arrete car sinon ça fausse tout
			v_fin = true
		end if

		if var_mon <= 0 then 
			// plus rien à répartir
			v_fin = true
		else
			lig_soins = dw_soins.find("cpaye < cdoit", lig_soins + 1 , 9999)
		end if
		

	loop 
	if var_mon <= 0 then
		
		Messagebox("INFORMATION", "La totalité du trop perçu a été réparti !")
		close(parent)
		
	else
	
		st_trop.text = "Trop perçu à reporter : " + string(var_mon) + " €" 
	
		// Actualisation de la liste
		maj_liste() 
		
	end if
else
	Messagebox("ATTENTION !", "Ce patient ne vous doit rien.~n~nLe trop perçu ne peut être reporté que sur des patients devant de l'argent.")
end if
end event

type dw_liste from datawindow within w_soins_reg_trop_percu_fratrie
integer x = 59
integer y = 276
integer width = 3803
integer height = 1148
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins_regl_report_trop_percu_fratrie"
boolean vscrollbar = true
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
	This.setrow(row)
End If

end event

event doubleclicked;
if row > 0 then
	cb_reporter.triggerevent(clicked!)
end if
end event

type uo_titre_liste from uo_barre_titre_2022 within w_soins_reg_trop_percu_fratrie
string tag = "no resize all"
integer x = 59
integer y = 176
integer width = 3803
integer taborder = 270
boolean bringtotop = true
string texte_titre = "Fratie avec lien Financier"
end type

on uo_titre_liste.destroy
call uo_barre_titre_2022::destroy
end on

type st_trop from statictext within w_soins_reg_trop_percu_fratrie
integer x = 69
integer y = 36
integer width = 2331
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 553648127
string text = "Trop perçu à reporter :"
boolean focusrectangle = false
end type

type dw_soins from datawindow within w_soins_reg_trop_percu_fratrie
boolean visible = false
integer x = 745
integer y = 780
integer width = 2510
integer height = 400
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_soins"
boolean livescroll = true
end type

