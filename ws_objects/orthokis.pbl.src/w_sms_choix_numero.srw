$PBExportHeader$w_sms_choix_numero.srw
forward
global type w_sms_choix_numero from w_fenetre_arakis
end type
type cb_ok from uo_picturebutton_390x120 within w_sms_choix_numero
end type
type cb_annuler from uo_picturebutton_390x120 within w_sms_choix_numero
end type
type dw_fiche from datawindow within w_sms_choix_numero
end type
end forward

global type w_sms_choix_numero from w_fenetre_arakis
integer width = 2112
integer height = 1488
string title = "Choix du/des numéro(s) destinataire(s)"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_ok cb_ok
cb_annuler cb_annuler
dw_fiche dw_fiche
end type
global w_sms_choix_numero w_sms_choix_numero

type variables

double var_code_local
end variables

on w_sms_choix_numero.create
int iCurrent
call super::create
this.cb_ok=create cb_ok
this.cb_annuler=create cb_annuler
this.dw_fiche=create dw_fiche
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_ok
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.dw_fiche
end on

on w_sms_choix_numero.destroy
call super::destroy
destroy(this.cb_ok)
destroy(this.cb_annuler)
destroy(this.dw_fiche)
end on

event open;call super::open;// Code du patient passé en paramètre
// on renvoie une string avec le N° de téléphone choisi



var_code_local = message.doubleparm

// pour les sélection multiple de numero
update table_vide set v1 = 'N' ; 
commit ;



dw_fiche.settransobject(sqlca)
dw_fiche.retrieve(var_code_local)


string v_pays
long row

if dw_fiche.rowcount() > 0 then
	
	row = 1
	
	v_pays = dw_fiche.getitemstring(row, "pays_parent1")
	formater_zone_pays(v_pays, 'P', dw_fiche, "portable2_parent1")
	formater_zone_pays(v_pays, 'P', dw_fiche, "portable")
	formater_zone_pays(v_pays, 'P', dw_fiche, "portable_patient")
	
	v_pays = dw_fiche.getitemstring(row, "pays_parent2")
	formater_zone_pays(v_pays, 'P', dw_fiche, "portable1_parent2")
	formater_zone_pays(v_pays, 'P', dw_fiche, "portable2_parent2")
	
	v_pays = dw_fiche.getitemstring(row, "pays_payeur")
	formater_zone_pays(v_pays, 'P', dw_fiche, "portable1_payeur")
	formater_zone_pays(v_pays, 'P', dw_fiche, "portable2_payeur")
	
	
	// pour mettre le focus sur le N° qui va bien 
	if dw_fiche.getitemstring(row, "portable_patient") <> "" then
		dw_fiche.setcolumn("portable_patient")
		dw_fiche.setfocus()
	else
		if dw_fiche.getitemstring(row, "portable") <> "" then
			dw_fiche.setcolumn("portable")
			dw_fiche.setfocus()
		else
			if dw_fiche.getitemstring(row, "portable2_parent1") <> "" then
				dw_fiche.setcolumn("portable2_parent1")
				dw_fiche.setfocus()
			else
				if dw_fiche.getitemstring(row, "portable1_parent2") <> ""  then
					dw_fiche.setcolumn("portable1_parent2")
					dw_fiche.setfocus()
				else
					if dw_fiche.getitemstring(row, "portable2_parent2") <> "" then
						dw_fiche.setcolumn("portable2_parent2")
						dw_fiche.setfocus()
					else
						if dw_fiche.getitemstring(row, "portable1_payeur") <> "" then
							dw_fiche.setcolumn("portable1_payeur")
							dw_fiche.setfocus()
						else
							if dw_fiche.getitemstring(row, "portable2_payeur") <> "" then
								dw_fiche.setcolumn("portable2_payeur")
								dw_fiche.setfocus()
							else
								Messagebox("ATTENTION", "Ce patient n'a aucun numéro de portable de renseigné dans son dossier !")
								closewithreturn(this, "-1")
							end if
						end if
					end if
				end if
			end if
		end if
	end if
	
else
	Messagebox("ATTENTION", "Erreur dans la récupération des numéros de portable du patient !")
	closewithreturn(this, "-1")
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_sms_choix_numero
end type

type cb_ok from uo_picturebutton_390x120 within w_sms_choix_numero
integer x = 1065
integer y = 1108
integer width = 581
integer height = 136
integer taborder = 10
boolean bringtotop = true
string text = "Ok"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;// Y a plusieurs zone de téléphones ...
// Dans laquelle y a t il le focus ??? (si nulle part, on prendra la première zone)

string numero_a_appeler



// plusieurs numeros possibles => On renvoie les numéros séparés par des "%"
// Si on a des numero sélectionnés, on les prend ..
numero_a_appeler = ""
if dw_fiche.getitemstring(1, "sel_portable_patient") = "O" then
	numero_a_appeler = numero_a_appeler + fxg_formater_telephone_international(dw_fiche.getitemstring(1, "portable_patient"), "P", var_code_local)
end if


if dw_fiche.getitemstring(1, "sel_portable") = "O" then
	if numero_a_appeler <> "" then
		numero_a_appeler = numero_a_appeler + "%"
	end if
	numero_a_appeler = numero_a_appeler + fxg_formater_telephone_international(dw_fiche.getitemstring(1, "portable"), "P1", var_code_local)
end if

if dw_fiche.getitemstring(1, "sel_portable2_parent1") = "O" then
	if numero_a_appeler <> "" then
		numero_a_appeler = numero_a_appeler + "%"
	end if
	numero_a_appeler = numero_a_appeler +  fxg_formater_telephone_international(dw_fiche.getitemstring(1, "portable2_parent1"), "P1", var_code_local)
end if


if dw_fiche.getitemstring(1, "sel_portable1_parent2") = "O" then
	if numero_a_appeler <> "" then
		numero_a_appeler = numero_a_appeler + "%"
	end if
	numero_a_appeler = numero_a_appeler + fxg_formater_telephone_international(dw_fiche.getitemstring(1, "portable1_parent2"), "P2", var_code_local)
end if

if dw_fiche.getitemstring(1, "sel_portable2_parent2") = "O" then
	if numero_a_appeler <> "" then
		numero_a_appeler = numero_a_appeler + "%"
	end if
	numero_a_appeler = numero_a_appeler + fxg_formater_telephone_international(dw_fiche.getitemstring(1, "portable2_parent2"), "P2", var_code_local)
end if


if dw_fiche.getitemstring(1, "sel_portable1_payeur") = "O" then
	if numero_a_appeler <> "" then
		numero_a_appeler = numero_a_appeler + "%"
	end if
	numero_a_appeler = numero_a_appeler + fxg_formater_telephone_international(dw_fiche.getitemstring(1, "portable1_payeur"), "PA", var_code_local)
end if

if dw_fiche.getitemstring(1, "sel_portable2_payeur") = "O" then
	if numero_a_appeler <> "" then
		numero_a_appeler = numero_a_appeler + "%"
	end if
	numero_a_appeler = numero_a_appeler + fxg_formater_telephone_international(dw_fiche.getitemstring(1, "portable2_payeur"), "PA", var_code_local)
end if

if numero_a_appeler = "" then
	// pas de selection par les cases
	if dw_fiche.getcolumnname() <> "" then 
		// par défaut on prend la première
		numero_a_appeler = fxg_formater_telephone_international(dw_fiche.getitemstring(1,dw_fiche.getcolumnname()), "P", var_code_local)
		closewithreturn(parent,numero_a_appeler)
	else
		Messagebox("ATTENTION", "Aucun numéro sélectionné !")
		//closewithreturn(parent, "0")
		param_win[1] = "0"
		close(parent)
	end if
else
	//closewithreturn(parent,numero_a_appeler)
	param_win[1] = numero_a_appeler
	close(parent)
end if

end event

type cb_annuler from uo_picturebutton_390x120 within w_sms_choix_numero
integer x = 279
integer y = 1108
integer width = 581
integer taborder = 20
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;//closewithreturn(parent, "0")

param_win[1] = "0"
close(parent)

end event

type dw_fiche from datawindow within w_sms_choix_numero
integer x = 91
integer y = 32
integer width = 1874
integer height = 992
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_sms_choix_numero"
boolean border = false
boolean livescroll = true
end type

