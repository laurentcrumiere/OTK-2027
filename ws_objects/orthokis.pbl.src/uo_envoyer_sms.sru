$PBExportHeader$uo_envoyer_sms.sru
forward
global type uo_envoyer_sms from userobject
end type
type p_1 from picturebutton within uo_envoyer_sms
end type
end forward

global type uo_envoyer_sms from userobject
integer width = 160
integer height = 136
long backcolor = 553648127
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_1 p_1
end type
global uo_envoyer_sms uo_envoyer_sms

type variables

// Element contenant le N° de téléphone à appeler
datawindow dw
integer nb_zone
string zone[]

double var_code_local

// Mode d'envoi 
string mode = "N"

// N = normal, on a passé tous les élements
// R = depuis les rendez-vous => faut choisir le numéro d'appel
end variables

on uo_envoyer_sms.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on uo_envoyer_sms.destroy
destroy(this.p_1)
end on

event constructor;p_1.width = this.width
p_1.height = this.height
end event

type p_1 from picturebutton within uo_envoyer_sms
integer width = 155
integer height = 136
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_sms.png"
alignment htextalign = left!
string powertiptext = "Envoi un SMS au numero sélectionné / Suivi des SMS envoyés au patient"
long backcolor = 553648127
end type

event clicked;
boolean v_suite



string numero_a_appeler

if nb_zone = 1 then
	// une zone => on récup et on appele			
	numero_a_appeler = dw.getitemstring(dw.getrow(),zone[1])
else
	
	if profilestring(dir_ini+inifile_orthokis,"SMS","choix_multiple", "false") = "true" then
		mode = "R"
	end if
	
	choose case mode
		case "N" 	// Normal ... 
			
			// Y a plusieurs zone de téléphones ...
			// Dans laquelle y a t il le focus ??? (si nulle part, on prendra la première zone)
			
			// par défaut on prend la première
			numero_a_appeler =  fxg_formater_telephone_international( dw.getitemstring(dw.getrow(),zone[1]), "P1", var_code_local)
		
			integer i 
			for i = 1 to nb_zone
				if dw.getcolumnname() = zone[i] then
					// pour tenir compte des pays
					choose case i
						case 1, 2, 3
							numero_a_appeler = fxg_formater_telephone_international( dw.getitemstring(dw.getrow(),zone[i]), "P1", var_code_local)
						case 4, 5
							numero_a_appeler = fxg_formater_telephone_international( dw.getitemstring(dw.getrow(),zone[i]), "P2", var_code_local)
						case 6, 7
							numero_a_appeler = fxg_formater_telephone_international( dw.getitemstring(dw.getrow(),zone[i]), "PA", var_code_local)
					end choose
				end if
			next
		case "R" // Depuis les rendez-vous, on doit choisir le n° dans une liste
			
			guo_fenetre_modale.wf_ouvrir_param_nombre(w_sms_choix_numero,var_code_local )
			//openwithparm(w_sms_choix_numero, var_code_local)
			// Le numéro à appeler est renvoyé dans param_win[1]
			//numero_a_appeler = message.StringParm
			numero_a_appeler = param_win[1]
	end choose
end if

// On enlève les espaces - pas utile car fait avant
//numero_a_appeler = espace(numero_a_appeler)

if len(trim(numero_a_appeler)) >= 5 then 
	
	guo_fenetre_modale.wf_ouvrir_param_string(w_envoi_sms, trim(numero_a_appeler) + "/" + string(var_code_local ) )

	//openWithParm(w_envoi_sms,  trim(numero_a_appeler) + "/" + string(var_code_local ) )
	
else
	if mode = "N" then
		MessageBox("ATTENTION !","Le numéro de téléphone que vous cherchez à utiliser (" +  numero_a_appeler + ") n'est pas valide !")
	end if
end if


end event

event rbuttondown;
// Suivi des SMS du patient

// Reprise du script existant dans clic droit sur les rdv


long v_numero_dossier

select numero_dossier into :v_numero_dossier from patient where code = :var_code_local ;

w_mdi_2020.uo_powerdock.of_openDocument(w_sms_histo, "Liste des envois de SMS", "ACTIONS_Exporter.png")


// mise en place des datas ...

w_sms_histo.em_min.text =  string(v_numero_dossier)
w_sms_histo.em_max.text =  string(v_numero_dossier)

w_sms_histo.em_date_min.SetDate( date(  year(today()) - 1 , 1 , 1))
w_sms_histo.em_date_max.SetDate(today())


w_sms_histo.em_date_envoi_min.SetDate( date(  year(today()) - 1 , 1 , 1))
w_sms_histo.em_date_envoi_max.setdate(today())


w_sms_histo.cb_ecran.triggerevent(clicked!)

end event

