$PBExportHeader$w_cc_vitale_erreur_montants.srw
forward
global type w_cc_vitale_erreur_montants from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_cc_vitale_erreur_montants
end type
type st_1 from statictext within w_cc_vitale_erreur_montants
end type
type st_3 from statictext within w_cc_vitale_erreur_montants
end type
type st_4 from statictext within w_cc_vitale_erreur_montants
end type
type st_5 from statictext within w_cc_vitale_erreur_montants
end type
type st_total from statictext within w_cc_vitale_erreur_montants
end type
type st_total_cc from statictext within w_cc_vitale_erreur_montants
end type
type st_6 from statictext within w_cc_vitale_erreur_montants
end type
type st_patient from statictext within w_cc_vitale_erreur_montants
end type
type st_patient_cc from statictext within w_cc_vitale_erreur_montants
end type
type st_7 from statictext within w_cc_vitale_erreur_montants
end type
type st_caisse from statictext within w_cc_vitale_erreur_montants
end type
type st_caisse_cc from statictext within w_cc_vitale_erreur_montants
end type
type st_8 from statictext within w_cc_vitale_erreur_montants
end type
type st_mutuelle from statictext within w_cc_vitale_erreur_montants
end type
type st_mutuelle_cc from statictext within w_cc_vitale_erreur_montants
end type
type st_9 from statictext within w_cc_vitale_erreur_montants
end type
type st_10 from statictext within w_cc_vitale_erreur_montants
end type
type st_11 from statictext within w_cc_vitale_erreur_montants
end type
type st_12 from statictext within w_cc_vitale_erreur_montants
end type
type st_13 from statictext within w_cc_vitale_erreur_montants
end type
type cb_corriger from uo_picturebutton_390x120 within w_cc_vitale_erreur_montants
end type
end forward

global type w_cc_vitale_erreur_montants from w_fenetre_arakis
integer width = 3246
integer height = 1936
string title = "Montants différents sur la FSE"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean clientedge = true
boolean center = true
cb_fermer cb_fermer
st_1 st_1
st_3 st_3
st_4 st_4
st_5 st_5
st_total st_total
st_total_cc st_total_cc
st_6 st_6
st_patient st_patient
st_patient_cc st_patient_cc
st_7 st_7
st_caisse st_caisse
st_caisse_cc st_caisse_cc
st_8 st_8
st_mutuelle st_mutuelle
st_mutuelle_cc st_mutuelle_cc
st_9 st_9
st_10 st_10
st_11 st_11
st_12 st_12
st_13 st_13
cb_corriger cb_corriger
end type
global w_cc_vitale_erreur_montants w_cc_vitale_erreur_montants

on w_cc_vitale_erreur_montants.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.st_1=create st_1
this.st_3=create st_3
this.st_4=create st_4
this.st_5=create st_5
this.st_total=create st_total
this.st_total_cc=create st_total_cc
this.st_6=create st_6
this.st_patient=create st_patient
this.st_patient_cc=create st_patient_cc
this.st_7=create st_7
this.st_caisse=create st_caisse
this.st_caisse_cc=create st_caisse_cc
this.st_8=create st_8
this.st_mutuelle=create st_mutuelle
this.st_mutuelle_cc=create st_mutuelle_cc
this.st_9=create st_9
this.st_10=create st_10
this.st_11=create st_11
this.st_12=create st_12
this.st_13=create st_13
this.cb_corriger=create cb_corriger
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.st_1
this.Control[iCurrent+3]=this.st_3
this.Control[iCurrent+4]=this.st_4
this.Control[iCurrent+5]=this.st_5
this.Control[iCurrent+6]=this.st_total
this.Control[iCurrent+7]=this.st_total_cc
this.Control[iCurrent+8]=this.st_6
this.Control[iCurrent+9]=this.st_patient
this.Control[iCurrent+10]=this.st_patient_cc
this.Control[iCurrent+11]=this.st_7
this.Control[iCurrent+12]=this.st_caisse
this.Control[iCurrent+13]=this.st_caisse_cc
this.Control[iCurrent+14]=this.st_8
this.Control[iCurrent+15]=this.st_mutuelle
this.Control[iCurrent+16]=this.st_mutuelle_cc
this.Control[iCurrent+17]=this.st_9
this.Control[iCurrent+18]=this.st_10
this.Control[iCurrent+19]=this.st_11
this.Control[iCurrent+20]=this.st_12
this.Control[iCurrent+21]=this.st_13
this.Control[iCurrent+22]=this.cb_corriger
end on

on w_cc_vitale_erreur_montants.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.st_1)
destroy(this.st_3)
destroy(this.st_4)
destroy(this.st_5)
destroy(this.st_total)
destroy(this.st_total_cc)
destroy(this.st_6)
destroy(this.st_patient)
destroy(this.st_patient_cc)
destroy(this.st_7)
destroy(this.st_caisse)
destroy(this.st_caisse_cc)
destroy(this.st_8)
destroy(this.st_mutuelle)
destroy(this.st_mutuelle_cc)
destroy(this.st_9)
destroy(this.st_10)
destroy(this.st_11)
destroy(this.st_12)
destroy(this.st_13)
destroy(this.cb_corriger)
end on

event open;call super::open;

// Mise à jour des montants


st_total.text = string(w_cc_vitale.v_montant, '0.00')
st_total_cc.text = string(w_cc_vitale.v_montant_cc, '0.00')

st_mutuelle.text = string(w_cc_vitale.v_montant_mutuelle, '0.00')
st_mutuelle_cc.text = string(w_cc_vitale.v_montant_mutuelle_cc, '0.00')

st_patient.text = string(w_cc_vitale.v_montant_patient, '0.00')
st_patient_cc.text = string(w_cc_vitale.v_montant_patient_cc, '0.00')

st_caisse.text = string(w_cc_vitale.v_montant_caisse, '0.00')
st_caisse_cc.text = string(w_cc_vitale.v_montant_caisse_cc, '0.00')



end event

type p_fond from w_fenetre_arakis`p_fond within w_cc_vitale_erreur_montants
boolean border = true
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_cc_vitale_erreur_montants
integer x = 1618
integer y = 1584
integer width = 608
integer taborder = 10
boolean bringtotop = true
end type

type st_1 from statictext within w_cc_vitale_erreur_montants
integer x = 366
integer y = 220
integer width = 2267
integer height = 224
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 553648127
string text = "Il y a une différence entre les montants d~'Orthokis et ceux facturés dans CC-Vitale"
alignment alignment = center!
end type

type st_3 from statictext within w_cc_vitale_erreur_montants
integer x = 1147
integer y = 572
integer width = 443
integer height = 156
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Orthokis"
alignment alignment = center!
end type

type st_4 from statictext within w_cc_vitale_erreur_montants
integer x = 2610
integer y = 588
integer width = 453
integer height = 156
boolean bringtotop = true
integer textsize = -16
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "CC-Vitale"
alignment alignment = center!
end type

type st_5 from statictext within w_cc_vitale_erreur_montants
integer x = 50
integer y = 824
integer width = 617
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Montant total "
end type

type st_total from statictext within w_cc_vitale_erreur_montants
integer x = 997
integer y = 824
integer width = 594
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = right!
boolean border = true
end type

type st_total_cc from statictext within w_cc_vitale_erreur_montants
integer x = 2459
integer y = 824
integer width = 594
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = right!
boolean border = true
end type

type st_6 from statictext within w_cc_vitale_erreur_montants
integer x = 1746
integer y = 1028
integer width = 677
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Payable Patient"
end type

type st_patient from statictext within w_cc_vitale_erreur_montants
integer x = 997
integer y = 1028
integer width = 594
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = right!
boolean border = true
end type

type st_patient_cc from statictext within w_cc_vitale_erreur_montants
integer x = 2459
integer y = 1028
integer width = 594
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = right!
boolean border = true
end type

type st_7 from statictext within w_cc_vitale_erreur_montants
integer x = 1746
integer y = 1172
integer width = 617
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Remb Caisse"
end type

type st_caisse from statictext within w_cc_vitale_erreur_montants
integer x = 997
integer y = 1172
integer width = 594
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = right!
boolean border = true
end type

type st_caisse_cc from statictext within w_cc_vitale_erreur_montants
integer x = 2459
integer y = 1172
integer width = 594
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = right!
boolean border = true
end type

type st_8 from statictext within w_cc_vitale_erreur_montants
integer x = 1746
integer y = 1316
integer width = 690
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Remb Mutuelle"
end type

type st_mutuelle from statictext within w_cc_vitale_erreur_montants
integer x = 997
integer y = 1316
integer width = 594
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = right!
boolean border = true
end type

type st_mutuelle_cc from statictext within w_cc_vitale_erreur_montants
integer x = 2459
integer y = 1316
integer width = 594
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
alignment alignment = right!
boolean border = true
end type

type st_9 from statictext within w_cc_vitale_erreur_montants
integer x = 50
integer y = 1028
integer width = 677
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Payable Patient"
end type

type st_10 from statictext within w_cc_vitale_erreur_montants
integer x = 50
integer y = 1172
integer width = 645
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Payable Caisse"
end type

type st_11 from statictext within w_cc_vitale_erreur_montants
integer x = 50
integer y = 1316
integer width = 741
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Payable Mutuelle"
end type

type st_12 from statictext within w_cc_vitale_erreur_montants
integer x = 1746
integer y = 824
integer width = 617
integer height = 124
boolean bringtotop = true
integer textsize = -16
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
string text = "Montant total "
end type

type st_13 from statictext within w_cc_vitale_erreur_montants
integer x = 1088
integer y = 56
integer width = 942
integer height = 128
boolean bringtotop = true
integer textsize = -20
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long textcolor = 255
long backcolor = 553648127
string text = "ATTENTION !"
end type

type cb_corriger from uo_picturebutton_390x120 within w_cc_vitale_erreur_montants
integer x = 850
integer y = 1584
integer width = 608
integer taborder = 20
boolean bringtotop = true
string text = "Corriger"
string tiptext = "Corriger les échéances d~'Orthokis"
string iconname = "lc_remplacer.png"
end type

event clicked;call super::clicked;// Correction soins orthokis


long handle_eIdHonoraireExterne, handle_MontantsPrestation, handle_mMontantCompl

boolean b_separateur_virgule

string valeur_eIdHonoraireExterne, valeur_strCCV_MontantsPrestation


double v_cle, v_code
integer nb_corrections =  0
integer nb_erreurs =  0

date v_date_exe_ort, v_date_ligne_soins
integer cpt = 0
boolean premier = true

decimal {2}   v_MontantTotal_cc , v_MontantAmo_cc, v_MontantCompl_cc, v_MontantPatient_cc
decimal {2}   v_MontantTotal_ort , v_MontantAmo_ort, v_MontantCompl_ort,v_MontantPatient_ort,  v_montant_ligne_soins
string s_MontantTotal , s_MontantAmo, s_MontantCompl

string s_TpAmo, s_TpAmc

treeviewitem ltvi_1


// Pour saoir si c'est le . ou la , comme symbole de décimal dans Windows car si c'est la , ça fausse les conversions

if pos(string(1.2, "0.0"), ",") > 0 then 
	// on est avec la virgule
	b_separateur_virgule = true
else
	b_separateur_virgule = false
end if



/*//-------------------------


handle_MontantsPrestation = w_cc_vitale.wf_find_next_item( "m_t_stMontantsPrestations" , valeur_strCCV_MontantsPrestation,  0)

//handle_eIdHonoraireExterne = w_cc_vitale.tv_message.FindItem  ( ChildTreeItem! , handle_MontantsPrestation) 
//handle_eIdHonoraireExterne = w_cc_vitale.tv_message.FindItem  ( ChildTreeItem!, handle_MontantsPrestation)

handle_eIdHonoraireExterne = handle_MontantsPrestation  + 3 
tv_message.Getitem(handle_eIdHonoraireExterne,ltvi_1)
valeur_eIdHonoraireExterne = right(ltvi_1.label, len(ltvi_1.label) - 7)

*/
w_cc_vitale.wf_find_next_item( "m_bTpAmo" , s_TpAmo,  0)
w_cc_vitale.wf_find_next_item( "m_bTpAmc" , s_TpAmc,  0)

handle_MontantsPrestation = w_cc_vitale.wf_find_next_item( "m_t_stMontantsPrestations" , valeur_strCCV_MontantsPrestation,  0)
handle_eIdHonoraireExterne = handle_MontantsPrestation  + 3 

//handle_eIdHonoraireExterne = w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  0)

v_code = w_cc_vitale.var_code_local 

// On parcours tous les soins pour étudier les différences et corriger si besoin
do while w_cc_vitale.tv_message.Getitem(handle_eIdHonoraireExterne,ltvi_1) = 1
	
	valeur_eIdHonoraireExterne = right(ltvi_1.label, len(ltvi_1.label) - 7)
	v_cle = double(valeur_eIdHonoraireExterne)

	w_cc_vitale.tv_message.Getitem(handle_eIdHonoraireExterne + 6,ltvi_1)
	s_MontantTotal = right(ltvi_1.label, len(ltvi_1.label) - 7)

	w_cc_vitale.tv_message.Getitem(handle_eIdHonoraireExterne + 8,ltvi_1)
	s_MontantAmo = right(ltvi_1.label, len(ltvi_1.label) - 7)
	
	w_cc_vitale.tv_message.Getitem(handle_eIdHonoraireExterne + 10,ltvi_1)
	s_MontantCompl = right(ltvi_1.label, len(ltvi_1.label) - 7)

	cpt = cpt + 1
	
	// Infos sur le soin renvoyées par la facture
	//w_cc_vitale.wf_find_next_item( "mMontantTotal" , s_MontantTotal,  handle_eIdHonoraireExterne)
	//w_cc_vitale.wf_find_next_item( "mMontantAmo" , s_MontantAmo,  handle_eIdHonoraireExterne)
	//handle_mMontantCompl = w_cc_vitale.wf_find_next_item( "mMontantCompl" , s_MontantCompl,  handle_eIdHonoraireExterne)

	if b_separateur_virgule then
		v_MontantTotal_cc =  dec( gfx_tout_remplacer( s_MontantTotal , ".", ",") )
		v_MontantAmo_cc = dec(gfx_tout_remplacer(s_MontantAmo , ".", ",") )
		v_MontantCompl_cc = dec(gfx_tout_remplacer(s_MontantCompl , ".", ",") )
	else
		v_MontantTotal_cc =  dec( s_MontantTotal )
		v_MontantAmo_cc = dec(s_MontantAmo )
		v_MontantCompl_cc = dec(s_MontantCompl )
	end if
	
	// On ne considère les montants AMO et AMC que si y a du TP
	if s_TpAmo = "0" then
		v_MontantAmo_cc = 0
	end if
	if s_TpAmc = "0" then
		v_MontantCompl_cc = 0
	end if
	
	v_MontantPatient_cc = v_MontantTotal_cc - v_MontantAmo_cc - v_MontantCompl_cc
	
	// Recherche des infos sur le soin dans Orthokis
	select total, isnull(date_exe, getdate()) into :v_MontantTotal_ort, :v_date_exe_ort 	from soins	where code = :v_code  and cle = :v_cle ;
	select isnull(sum(montant), 0) into :v_MontantAmo_ort 	from ligne_soins	where code = :v_code  and cle = :v_cle and tp = 'O' and origine_tp = 'C'  ;
	select isnull(sum(montant), 0) into :v_MontantCompl_ort 	from ligne_soins	where code = :v_code  and cle = :v_cle and tp = 'O' and origine_tp = 'M'  ;
	select isnull(sum(montant), 0) into :v_MontantPatient_ort 	from ligne_soins	where code = :v_code  and cle = :v_cle and tp <> 'O'  ;
	
	// Montant total du Soins
	if v_MontantTotal_cc <> v_MontantTotal_ort then 
		update soins set total = :v_MontantTotal_cc where code = :v_code  and cle = :v_cle ;
		if sqlca.sqlcode = 0 then 
			nb_corrections = nb_corrections + 1
			commit ;
		else
			nb_erreurs = nb_erreurs + 1
			MessageBox("ATTENTION", "Erreur dans la mise à jour du montant total pour le soin N°"+string(cpt)+"~n~n" + sqlca.sqlerrText)
			rollback ;
		end if	
	end if
	
	// AMO - TP Caisse
	if v_MontantAmo_cc <> v_MontantAmo_ort then
		if v_MontantAmo_cc = 0 and v_MontantAmo_ort > 0 then
			// il ne faut plus de TP Caisse => on supprimer
			delete from ligne_soins where code = :v_code  and cle = :v_cle and tp = 'O' and origine_tp = 'C'  ;
			if sqlca.sqlcode = 0 then 
				nb_corrections = nb_corrections + 1
				commit ;
			else
				nb_erreurs = nb_erreurs + 1
				MessageBox("ATTENTION", "Erreur dans la suppression des échéances Tiers Payant Caisse pour le soin N°"+string(cpt)+"~n~n" + sqlca.sqlerrText)
				rollback ;
			end if
		else
			if v_MontantAmo_cc > 0 and v_MontantAmo_ort = 0 then
				// Il faut ajouter un montant AMO 
				
				insert into ligne_soins ("code", "cle", "date", "montant", "tp", "origine_tp" )
				values (:v_code, :v_cle, :v_date_exe_ort, :v_MontantAmo_cc, 'O', 'C') ;
				
				if sqlca.sqlcode = 0 then 
					nb_corrections = nb_corrections + 1
					commit ;
				else
					nb_erreurs = nb_erreurs + 1
					MessageBox("ATTENTION", "Erreur dans l'ajout d'une échéance Tiers Payant Caisse pour le soin N°"+string(cpt)+"~n~n" + sqlca.sqlerrText)
					rollback ;
				end if
				
			else
				// Faut ajuster le montant TP Caisse ... on fait ça sur la première échéance qu'on trouve ...
				select top 1 "date", "montant" into :v_date_ligne_soins, :v_montant_ligne_soins from ligne_soins where code = :v_code  and cle = :v_cle and tp = 'O' and origine_tp = 'C'  order by "date" desc ;
				
				update ligne_soins set montant = montant + :v_MontantAmo_cc - :v_MontantAmo_ort where code = :v_code  and cle = :v_cle and tp = 'O' and origine_tp = 'C' and "date" =  :v_date_ligne_soins ; 
				if sqlca.sqlcode = 0 then 
					nb_corrections = nb_corrections + 1
					commit ;
				else
					nb_erreurs = nb_erreurs + 1
					MessageBox("ATTENTION", "Erreur dans la mise à jour d'une échéance Tiers Payant Caisse pour le soin N°"+string(cpt)+"~n~n" + sqlca.sqlerrText)
					rollback ;
				end if
				
			end if
		end if
	end if
	
	
	// COMPL - TP Mutuelle
	if v_MontantCompl_cc <> v_MontantCompl_ort then
		if v_MontantCompl_cc = 0 and v_MontantCompl_ort > 0 then
			// il ne faut plus de TP Mutuelle => on supprimer
			delete from ligne_soins where code = :v_code  and cle = :v_cle and tp = 'O' and origine_tp = 'M'  ;
			if sqlca.sqlcode = 0 then 
				nb_corrections = nb_corrections + 1
				commit ;
			else
				nb_erreurs = nb_erreurs + 1
				MessageBox("ATTENTION", "Erreur dans la suppression des échéances Tiers Payant Mutuelle pour le soin N°"+string(cpt)+"~n~n" + sqlca.sqlerrText)
				rollback ;
			end if
		else
			if v_MontantCompl_cc > 0 and v_MontantCompl_ort = 0 then
				// Il faut ajouter un montant TP Mutuelle 
				
				insert into ligne_soins ("code", "cle", "date", "montant", "tp", "origine_tp" )
				values (:v_code, :v_cle, :v_date_exe_ort, :v_MontantCompl_cc, 'O', 'M') ;
				
				if sqlca.sqlcode = 0 then 
					nb_corrections = nb_corrections + 1
					commit ;
				else
					nb_erreurs = nb_erreurs + 1
					MessageBox("ATTENTION", "Erreur dans l'ajout d'une échéance Tiers Payant Mutuelle pour le soin N°"+string(cpt)+"~n~n" + sqlca.sqlerrText)
					rollback ;
				end if
				
			else
				// Faut ajuster le montant TP Mutuelle ... on fait ça sur la première échéance qu'on trouve ...
				select top 1 "date", "montant" into :v_date_ligne_soins, :v_montant_ligne_soins from ligne_soins where code = :v_code  and cle = :v_cle and tp = 'O' and origine_tp = 'M'  order by "date" desc ;
				
				update ligne_soins set montant = montant + :v_MontantCompl_cc - :v_MontantCompl_ort where code = :v_code  and cle = :v_cle and tp = 'O' and origine_tp = 'M' and "date" =  :v_date_ligne_soins ; 
				if sqlca.sqlcode = 0 then 
					nb_corrections = nb_corrections + 1
					commit ;
				else
					nb_erreurs = nb_erreurs + 1
					MessageBox("ATTENTION", "Erreur dans la mise à jour d'une échéance Tiers Payant Mutuelle pour le soin N°"+string(cpt)+"~n~n" + sqlca.sqlerrText)
					rollback ;
				end if
				
			end if
		end if
	end if
	
	
	
	// Partie Patient
	if v_MontantPatient_cc <> v_MontantPatient_ort then
		if v_MontantPatient_cc = 0 and v_MontantPatient_ort > 0 then
			// il ne faut plus de part patient => on supprime
			delete from ligne_soins where code = :v_code  and cle = :v_cle and tp <> 'O'  ;
			if sqlca.sqlcode = 0 then 
				nb_corrections = nb_corrections + 1
				commit ;
			else
				nb_erreurs = nb_erreurs + 1
				MessageBox("ATTENTION", "Erreur dans la suppression des échéances Patient pour le soin N°"+string(cpt)+"~n~n" + sqlca.sqlerrText)
				rollback ;
			end if
		else
			if v_MontantPatient_cc > 0 and v_MontantPatient_ort = 0 then
				// Il faut ajouter un montant Patient 
				
				insert into ligne_soins ("code", "cle", "date", "montant", "tp", "origine_tp" )
				values (:v_code, :v_cle, :v_date_exe_ort, :v_MontantPatient_cc, 'N', ' ') ;
				
				if sqlca.sqlcode = 0 then 
					nb_corrections = nb_corrections + 1
					commit ;
				else
					nb_erreurs = nb_erreurs + 1
					MessageBox("ATTENTION", "Erreur dans l'ajout d'une échéance Patient pour le soin N°"+string(cpt)+"~n~n" + sqlca.sqlerrText)
					rollback ;
				end if
				
			else
				// Faut ajuster le montant Patient ... on fait ça sur la première échéance qu'on trouve ...
				select top 1 "date", "montant" into :v_date_ligne_soins, :v_montant_ligne_soins from ligne_soins where code = :v_code  and cle = :v_cle and tp <> 'O' order by "date" desc ;
				
				update ligne_soins set montant = montant + :v_MontantPatient_cc - :v_MontantPatient_ort where code = :v_code  and cle = :v_cle and tp <> 'O' and "date" =  :v_date_ligne_soins ; 
				if sqlca.sqlcode = 0 then 
					nb_corrections = nb_corrections + 1
					commit ;
				else
					nb_erreurs = nb_erreurs + 1
					MessageBox("ATTENTION", "Erreur dans la mise à jour d'une échéance Patient pour le soin N°"+string(cpt)+"~n~n" + sqlca.sqlerrText)
					rollback ;
				end if
				
			end if
		end if
	end if
		
	
	
	
	
	// Soin suivant ...
	//handle_MontantsPrestation = w_cc_vitale.wf_find_next_item( "strCCV_MontantsPrestation" , valeur_strCCV_MontantsPrestation,  handle_MontantsPrestation )
	//handle_eIdHonoraireExterne = w_cc_vitale.wf_find_next_item( "eIdHonoraireExterne" , valeur_eIdHonoraireExterne,  handle_eIdHonoraireExterne )
	//handle_eIdHonoraireExterne = w_cc_vitale.tv_message.FindItem  ( NextTreeItem! , handle_eIdHonoraireExterne)
	handle_eIdHonoraireExterne = handle_eIdHonoraireExterne + 13
loop 

if nb_erreurs = 0 then 
	Messagebox("INFORMATION", string(nb_corrections) + " Correction(s) effectuée(s) !")
else
	if nb_erreurs > 0 and nb_corrections = 0 then 
		Messagebox("ATTENTION", string(nb_erreurs) + " Erreur(s) relevé(s) ; aucune correction n'a été effectuée  !")
	else
		Messagebox("ATTENTION", string(nb_erreurs) + " Erreur(s) relevé(s) et " + string(nb_corrections) + " Correction(s) effectuée(s) !~n~nNous vous conseillons de vérifier les soins de cette facture dans Orthokis !")
	end if
end if
close (parent)
end event

