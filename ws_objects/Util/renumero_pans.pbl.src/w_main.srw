$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type dw_liste from datawindow within w_main
end type
type sle_etat from singlelineedit within w_main
end type
type cb_annuler from commandbutton within w_main
end type
type cb_lancer from commandbutton within w_main
end type
end forward

global type w_main from window
integer x = 663
integer y = 428
integer width = 1883
integer height = 1620
boolean titlebar = true
string title = "Renumérotation des clefs Soins / Ligen Soins / Paye"
windowtype windowtype = response!
long backcolor = 12632256
boolean center = true
cb_2 cb_2
cb_1 cb_1
dw_liste dw_liste
sle_etat sle_etat
cb_annuler cb_annuler
cb_lancer cb_lancer
end type
global w_main w_main

forward prototypes
public subroutine execute_commande_sql (string as_commande)
public subroutine maj_etat (string as_message)
end prototypes

public subroutine execute_commande_sql (string as_commande);
long y_prec
execute immediate :as_commande ;

if sqlca.sqlcode <> 0 then

	MessageBox("ERREUR DANS LA MISE A JOUR DE LA BASE DE DONNEES","Commande exécutée : "+as_commande+"~n~nMessage d'erreur : "+sqlca.sqlerrtext)

end if


end subroutine

public subroutine maj_etat (string as_message);sle_etat.text = as_message
yield()


end subroutine

event open;
dw_liste.settransobject(sqlca)



end event

on w_main.create
this.cb_2=create cb_2
this.cb_1=create cb_1
this.dw_liste=create dw_liste
this.sle_etat=create sle_etat
this.cb_annuler=create cb_annuler
this.cb_lancer=create cb_lancer
this.Control[]={this.cb_2,&
this.cb_1,&
this.dw_liste,&
this.sle_etat,&
this.cb_annuler,&
this.cb_lancer}
end on

on w_main.destroy
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.dw_liste)
destroy(this.sle_etat)
destroy(this.cb_annuler)
destroy(this.cb_lancer)
end on

type cb_2 from commandbutton within w_main
integer x = 265
integer y = 572
integer width = 1202
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "3 - Remise en place des clefs / index"
end type

event clicked;maj_etat("Ligne Soins ...")

// Soins
execute_commande_sql ('ALTER TABLE ligne_soins ADD FOREIGN KEY "soins" ("cle", "code" ) REFERENCES "dba"."soins" ON DELETE RESTRICT;')
execute_commande_sql ('ALTER TABLE paye ADD FOREIGN KEY "paye_soins" ("cle", "code" ) REFERENCES "dba"."soins" ON DELETE RESTRICT ;')


maj_etat("Remise en place effectuée !")
end event

type cb_1 from commandbutton within w_main
integer x = 265
integer y = 148
integer width = 1202
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "1 - Suppression des clefs / index"
end type

event clicked;


maj_etat("Lignes de Soins ...")
// Lignes Soins

execute_commande_sql ('ALTER TABLE ligne_soins DROP FOREIGN KEY "soins" ;')
execute_commande_sql ('ALTER TABLE paye DROP FOREIGN KEY "paye_soins" ; ')


maj_etat("Suppression effectuée !")

end event

type dw_liste from datawindow within w_main
boolean visible = false
integer x = 549
integer y = 632
integer width = 1472
integer height = 504
integer taborder = 110
string title = "none"
string dataobject = "dw_modif_numero_soins"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_etat from singlelineedit within w_main
integer x = 91
integer y = 772
integer width = 1591
integer height = 96
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 65280
borderstyle borderstyle = stylelowered!
end type

type cb_annuler from commandbutton within w_main
integer x = 654
integer y = 1268
integer width = 402
integer height = 128
integer taborder = 230
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "&Fermer"
boolean default = true
end type

on clicked;close(parent)
end on

type cb_lancer from commandbutton within w_main
integer x = 265
integer y = 352
integer width = 1202
integer height = 128
integer taborder = 220
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "2 -> Lancement de la renumérotation"
end type

event clicked;long lig, tot
double v_code_patient, v_cle_patient , v_cle_courante, v_code_patient_courant

maj_etat("Chargement des soins ... ")
dw_liste.retrieve()

tot = dw_liste.rowcount()

lig = 1

do while lig <= tot

	maj_etat(string(lig) + " /  " + string(tot) + "  (" + string((lig * 100) / tot, "0.00") + ")")
	Trace(sle_etat.text)
	v_code_patient = dw_liste.getitemnumber(lig, "code") 
	
	if v_code_patient = 3341 then 
		boolean ff
		ff = true 
	end if
	
	v_cle_patient = 1
	
	v_code_patient_courant = dw_liste.getitemnumber(lig, "code")
	do while v_code_patient = v_code_patient_courant  and lig <= tot
		v_cle_courante = dw_liste.getitemnumber(lig, "cle")
		
		// mise à jour des tables
		update soins set cle = :v_cle_patient where cle = :v_cle_courante and code = :v_code_patient ;
		
		if sqlca.sqlcode = 0 then 
			update ligne_soins set cle = :v_cle_patient where cle = :v_cle_courante and code = :v_code_patient ;
			if sqlca.sqlcode = 0 then 
				update paye set cle = :v_cle_patient where cle = :v_cle_courante and code = :v_code_patient ; 
				if sqlca.sqlcode = 0 then 
					commit ;
					Trace("Patient N°"  + string(v_code_patient) + " -> OK -  Cle : " + string(v_cle_courante) + " -> " + string(v_cle_patient))
				else
					Messagebox("ATTENTION", "Erreur dans la mise à jour du patient - PAYE : " + string(v_code_patient) + "~n~nCle : " + string(v_cle_courante) + " -> " + string(v_cle_patient)+"~n~n" + sqlca.sqlerrtext )
					rollback ;
					Trace("Patient N°"  + string(v_code_patient) + " -> KO PAYE -  Cle : " + string(v_cle_courante) + " -> " + string(v_cle_patient)+" - " + sqlca.sqlerrtext )
				end if
			else
				Messagebox("ATTENTION", "Erreur dans la mise à jour du patient - LIGNE SOINS : " + string(v_code_patient) + "~n~nCle : " + string(v_cle_courante) + " -> " + string(v_cle_patient)+"~n~n" + sqlca.sqlerrtext )
				rollback ;
				Trace("Patient N°"  + string(v_code_patient) + " -> KO LIGNE SOINS -  Cle : " + string(v_cle_courante) + " -> " + string(v_cle_patient)+" - " + sqlca.sqlerrtext )
			end if
		else
			Messagebox("ATTENTION", "Erreur dans la mise à jour du patient - SOINS : " + string(v_code_patient) + "~n~nCle : " + string(v_cle_courante) + " -> " + string(v_cle_patient)+"~n~n" + sqlca.sqlerrtext )
			rollback ;
			Trace("Patient N°"  + string(v_code_patient) + " -> KO SOINS  -  Cle : " + string(v_cle_courante) + " -> " + string(v_cle_patient)+" - " + sqlca.sqlerrtext )
		end if
		
		
		lig = lig + 1
		v_cle_patient = v_cle_patient + 1 
		
		if lig <= tot then 
			v_code_patient_courant = dw_liste.getitemnumber(lig, "code")
		end if
	loop


loop 

messagebox("FINI", "Mise à jour terminée !")

end event

