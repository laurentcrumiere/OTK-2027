$PBExportHeader$w_soins_remplacer_par.srw
forward
global type w_soins_remplacer_par from w_fenetre_arakis
end type
type pb_annuler from uo_picturebutton_390x120 within w_soins_remplacer_par
end type
type pb_confimer from uo_picturebutton_390x120 within w_soins_remplacer_par
end type
type dw_soins from datawindow within w_soins_remplacer_par
end type
type st_1 from statictext within w_soins_remplacer_par
end type
type sle_libelle from singlelineedit within w_soins_remplacer_par
end type
type st_2 from statictext within w_soins_remplacer_par
end type
type st_3 from statictext within w_soins_remplacer_par
end type
type sle_date from singlelineedit within w_soins_remplacer_par
end type
type st_4 from statictext within w_soins_remplacer_par
end type
type sle_montant from singlelineedit within w_soins_remplacer_par
end type
end forward

global type w_soins_remplacer_par from w_fenetre_arakis
integer width = 3017
integer height = 1084
string title = "Remplacer par ..."
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_annuler pb_annuler
pb_confimer pb_confimer
dw_soins dw_soins
st_1 st_1
sle_libelle sle_libelle
st_2 st_2
st_3 st_3
sle_date sle_date
st_4 st_4
sle_montant sle_montant
end type
global w_soins_remplacer_par w_soins_remplacer_par

type variables



double v_code_local
long v_clef

date v_date_demande
double v_montant
end variables

on w_soins_remplacer_par.create
int iCurrent
call super::create
this.pb_annuler=create pb_annuler
this.pb_confimer=create pb_confimer
this.dw_soins=create dw_soins
this.st_1=create st_1
this.sle_libelle=create sle_libelle
this.st_2=create st_2
this.st_3=create st_3
this.sle_date=create sle_date
this.st_4=create st_4
this.sle_montant=create sle_montant
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_annuler
this.Control[iCurrent+2]=this.pb_confimer
this.Control[iCurrent+3]=this.dw_soins
this.Control[iCurrent+4]=this.st_1
this.Control[iCurrent+5]=this.sle_libelle
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.st_3
this.Control[iCurrent+8]=this.sle_date
this.Control[iCurrent+9]=this.st_4
this.Control[iCurrent+10]=this.sle_montant
end on

on w_soins_remplacer_par.destroy
call super::destroy
destroy(this.pb_annuler)
destroy(this.pb_confimer)
destroy(this.dw_soins)
destroy(this.st_1)
destroy(this.sle_libelle)
destroy(this.st_2)
destroy(this.st_3)
destroy(this.sle_date)
destroy(this.st_4)
destroy(this.sle_montant)
end on

event open;call super::open;

// Le passage de paramètre se fait par la tableau string param_win[4]	


if w_click_soins_reg.dw_soins.rowcount() > 0 then
	long lig
	string libelle_soin
	
	dw_soins.setTransobject(sqlca)
	dw_soins.retrieve()
	
	if dw_soins.rowcount() = 0 then
		MessageBox("ATTENTION","Vous devez d'abord saisir des soins automatiques (menu 'Tables', puis 'Soins & Règlements', puis 'Soins automatiques' !")
		close(this)
	else

		// Code du patient
		lig = w_click_soins_reg.dw_soins.getrow()
		v_code_local = w_click_soins_reg.dw_soins.getitemnumber(lig,"soins_code")
		v_clef = w_click_soins_reg.dw_soins.getitemnumber(lig,"cle")
		v_date_demande = w_click_soins_reg.dw_soins.getitemDate(lig,"date_demande")
		v_montant = w_click_soins_reg.dw_soins.getitemNumber(lig,"total")
		
		sle_libelle.text =  w_click_soins_reg.dw_soins.getitemString(lig,"code_soins_nom")
		sle_date.text = string(v_date_demande)
		sle_montant.text = string( v_montant,"0.00")
		
		// Vérification si règlement 
		integer cpt
		select isnull(count(*),0) into :cpt from paye where code = :v_code_local and cle = :v_clef ;
		
		if cpt > 0 then
			
			if Messagebox("ATTENTION","Un règlement a déjà été saisi sur ce soin.~n~nConfirmez-vous le remplacement ?~n~n(Le règlement ne sera pas modfiié.)", Question!, YesNo!, 2) = 2 then
				close(this)
			end if
			
		end if
		
	end if
	
	
else
	close(this)
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_soins_remplacer_par
end type

type pb_annuler from uo_picturebutton_390x120 within w_soins_remplacer_par
integer x = 718
integer y = 720
integer width = 553
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;

close(parent)


end event

type pb_confimer from uo_picturebutton_390x120 within w_soins_remplacer_par
integer x = 1330
integer y = 720
integer width = 553
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Confirmer"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;

If Messagebox("ATTENTION !","Confirmez-vous le remplacement ?",Question!, YesNo!,2) = 1 then
	
	
	// vérification des montants ...
	double v_montant_auto
	boolean v_suite = true
	
	double v_soins_auto 
	v_soins_auto = dw_soins.getitemnumber(dw_soins.getrow(),"code")
	
	select isnull(sum(montant),0) into :v_montant_auto  from ligne_soins_auto where ligne_soins_auto.code = :v_soins_auto ;
	
	if v_montant_auto <> v_montant then
		if MessageBox("ATTENTION","Vous souhaitez remplacer un soin d'une valeur de "+string(v_montant,'0.00') +" "+symbole_euro+" par un soin automatique valant "+string(v_montant_auto,'0.00') +" "+symbole_euro+"~n~nConfirmez-vous ?",Question!,Yesno!,2) = 2 then
			v_suite = false
		end if
	end if
		
	if v_suite then
	
		date v_date_impr 
		setnull(v_date_impr)
		select date_impr into :v_date_impr from soins where code = :v_code_local and cle = :v_clef ;
		
		if not isnull(v_date_impr) then
			// Recherche de la valeur de la clef que va prendre le 1er soin auto (pour Maj ensuite de la date d'impression de DEP)
			long cle_max 
			SELECT Max(cle) INTO :cle_max FROM "soins" WHERE code = :v_code_local ;
			if isnull(cle_max) then
				cle_max = 1
			else
				cle_max = cle_max + 1
			end if
		end if

	
		// Ajout du soin automatique !!
		if ajout_soins_automatiques(v_code_local, "S", v_soins_auto, 1, v_date_demande, false, true, 0, 0, false ) then
			
			if not isnull(v_date_impr) then
				// Mise à jour de la date d'impression de la DEP
				update soins set date_impr = :v_date_impr where code = :v_code_local and cle = :cle_max  ;
			end if
			
			// suppression du soin qu'on remplace 
			delete from ligne_soins where code = :v_code_local and cle = :v_clef ;
			delete from soins where code = :v_code_local and cle = :v_clef ;
			commit ;
			
			 w_click_soins_reg.dw_soins.retrieve(v_code_local)
			close(parent)		
			
		end if
	end if
	
end if





end event

type dw_soins from datawindow within w_soins_remplacer_par
integer x = 882
integer y = 500
integer width = 1577
integer height = 92
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_titre_soin_auto"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_soins_remplacer_par
integer x = 64
integer y = 108
integer width = 791
integer height = 72
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Vous allez remplacer le soin "
alignment alignment = right!
end type

type sle_libelle from singlelineedit within w_soins_remplacer_par
integer x = 887
integer y = 96
integer width = 2030
integer height = 96
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type st_2 from statictext within w_soins_remplacer_par
integer x = 64
integer y = 220
integer width = 791
integer height = 72
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "du"
alignment alignment = right!
end type

type st_3 from statictext within w_soins_remplacer_par
integer x = 64
integer y = 512
integer width = 791
integer height = 72
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Par  "
alignment alignment = right!
end type

type sle_date from singlelineedit within w_soins_remplacer_par
integer x = 887
integer y = 212
integer width = 553
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

type st_4 from statictext within w_soins_remplacer_par
integer x = 64
integer y = 332
integer width = 791
integer height = 72
boolean bringtotop = true
integer textsize = -10
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "pour un montant de"
alignment alignment = right!
end type

type sle_montant from singlelineedit within w_soins_remplacer_par
integer x = 882
integer y = 328
integer width = 553
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
borderstyle borderstyle = stylelowered!
end type

