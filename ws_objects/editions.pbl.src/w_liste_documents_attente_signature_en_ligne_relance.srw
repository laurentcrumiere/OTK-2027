$PBExportHeader$w_liste_documents_attente_signature_en_ligne_relance.srw
forward
global type w_liste_documents_attente_signature_en_ligne_relance from w_fenetre_arakis
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_documents_attente_signature_en_ligne_relance
end type
type cbx1_email from checkbox within w_liste_documents_attente_signature_en_ligne_relance
end type
type dw1_textes_email from datawindow within w_liste_documents_attente_signature_en_ligne_relance
end type
type rb1_parent1 from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
end type
type rb1_patient from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
end type
type rb1_parent2 from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
end type
type rb1_payeur from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
end type
type cbx1_notif1 from checkbox within w_liste_documents_attente_signature_en_ligne_relance
end type
type cbx1_notif2 from checkbox within w_liste_documents_attente_signature_en_ligne_relance
end type
type cbx2_email from checkbox within w_liste_documents_attente_signature_en_ligne_relance
end type
type dw2_textes_email from datawindow within w_liste_documents_attente_signature_en_ligne_relance
end type
type rb2_parent1 from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
end type
type rb2_patient from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
end type
type rb2_parent2 from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
end type
type rb2_payeur from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
end type
type cbx2_notif1 from checkbox within w_liste_documents_attente_signature_en_ligne_relance
end type
type cbx2_notif2 from checkbox within w_liste_documents_attente_signature_en_ligne_relance
end type
type cb_lancer from uo_picturebutton_390x120 within w_liste_documents_attente_signature_en_ligne_relance
end type
type gb_signataire1 from groupbox within w_liste_documents_attente_signature_en_ligne_relance
end type
type gb_signataire2 from groupbox within w_liste_documents_attente_signature_en_ligne_relance
end type
end forward

global type w_liste_documents_attente_signature_en_ligne_relance from w_fenetre_arakis
integer width = 3141
integer height = 1848
string title = "Relance des signataires des documents en attente de signature"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_fermer cb_fermer
cbx1_email cbx1_email
dw1_textes_email dw1_textes_email
rb1_parent1 rb1_parent1
rb1_patient rb1_patient
rb1_parent2 rb1_parent2
rb1_payeur rb1_payeur
cbx1_notif1 cbx1_notif1
cbx1_notif2 cbx1_notif2
cbx2_email cbx2_email
dw2_textes_email dw2_textes_email
rb2_parent1 rb2_parent1
rb2_patient rb2_patient
rb2_parent2 rb2_parent2
rb2_payeur rb2_payeur
cbx2_notif1 cbx2_notif1
cbx2_notif2 cbx2_notif2
cb_lancer cb_lancer
gb_signataire1 gb_signataire1
gb_signataire2 gb_signataire2
end type
global w_liste_documents_attente_signature_en_ligne_relance w_liste_documents_attente_signature_en_ligne_relance

type variables


w_liste_documents_attente_signature_en_ligne w_parent

string s_signataire1, s_signataire2
end variables

on w_liste_documents_attente_signature_en_ligne_relance.create
int iCurrent
call super::create
this.cb_fermer=create cb_fermer
this.cbx1_email=create cbx1_email
this.dw1_textes_email=create dw1_textes_email
this.rb1_parent1=create rb1_parent1
this.rb1_patient=create rb1_patient
this.rb1_parent2=create rb1_parent2
this.rb1_payeur=create rb1_payeur
this.cbx1_notif1=create cbx1_notif1
this.cbx1_notif2=create cbx1_notif2
this.cbx2_email=create cbx2_email
this.dw2_textes_email=create dw2_textes_email
this.rb2_parent1=create rb2_parent1
this.rb2_patient=create rb2_patient
this.rb2_parent2=create rb2_parent2
this.rb2_payeur=create rb2_payeur
this.cbx2_notif1=create cbx2_notif1
this.cbx2_notif2=create cbx2_notif2
this.cb_lancer=create cb_lancer
this.gb_signataire1=create gb_signataire1
this.gb_signataire2=create gb_signataire2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_fermer
this.Control[iCurrent+2]=this.cbx1_email
this.Control[iCurrent+3]=this.dw1_textes_email
this.Control[iCurrent+4]=this.rb1_parent1
this.Control[iCurrent+5]=this.rb1_patient
this.Control[iCurrent+6]=this.rb1_parent2
this.Control[iCurrent+7]=this.rb1_payeur
this.Control[iCurrent+8]=this.cbx1_notif1
this.Control[iCurrent+9]=this.cbx1_notif2
this.Control[iCurrent+10]=this.cbx2_email
this.Control[iCurrent+11]=this.dw2_textes_email
this.Control[iCurrent+12]=this.rb2_parent1
this.Control[iCurrent+13]=this.rb2_patient
this.Control[iCurrent+14]=this.rb2_parent2
this.Control[iCurrent+15]=this.rb2_payeur
this.Control[iCurrent+16]=this.cbx2_notif1
this.Control[iCurrent+17]=this.cbx2_notif2
this.Control[iCurrent+18]=this.cb_lancer
this.Control[iCurrent+19]=this.gb_signataire1
this.Control[iCurrent+20]=this.gb_signataire2
end on

on w_liste_documents_attente_signature_en_ligne_relance.destroy
call super::destroy
destroy(this.cb_fermer)
destroy(this.cbx1_email)
destroy(this.dw1_textes_email)
destroy(this.rb1_parent1)
destroy(this.rb1_patient)
destroy(this.rb1_parent2)
destroy(this.rb1_payeur)
destroy(this.cbx1_notif1)
destroy(this.cbx1_notif2)
destroy(this.cbx2_email)
destroy(this.dw2_textes_email)
destroy(this.rb2_parent1)
destroy(this.rb2_patient)
destroy(this.rb2_parent2)
destroy(this.rb2_payeur)
destroy(this.cbx2_notif1)
destroy(this.cbx2_notif2)
destroy(this.cb_lancer)
destroy(this.gb_signataire1)
destroy(this.gb_signataire2)
end on

event open;call super::open;long lig 
long signe_1 = 0
long signe_2 = 0



w_parent = message.powerobjectparm


if isvalid (w_parent) then 
	
	if w_parent.dw_liste.rowcount() > 0 then 
		
		cbx1_notif1.text = "Notification " + LIBELLE_APPLICATION + " 1er Numéro"
		cbx1_notif2.text = "Notification " + LIBELLE_APPLICATION + " 2ème Numéro"

		cbx2_notif1.text = "Notification " + LIBELLE_APPLICATION + " 1er Numéro"
		cbx2_notif2.text = "Notification " + LIBELLE_APPLICATION + " 2ème Numéro"
		
		
		// Vérification si on a des documents avec signataire 1 (seule ou 2 signature)
		signe_1 = w_parent.dw_liste.find ("historique_editions_statut_signature = 'A1' or historique_editions_statut_signature = 'A3' ", 1, w_parent.dw_liste.rowcount() )

		// Vérification si on a des documents avec signataire 2 (seule ou 2 signature)
		signe_2 = w_parent.dw_liste.find ("historique_editions_statut_signature = 'A2' or historique_editions_statut_signature = 'A3' ", 1, w_parent.dw_liste.rowcount() )

		if signe_2 = 0 then 
			// Pas de signataire 2 : On enlève le signataire 2 et on réduit la fenêtre
			gb_signataire2.visible = false
			rb2_parent1.visible = false
			rb2_patient.visible = false
			rb2_parent2.visible = false
			rb2_payeur.visible = false
			cbx2_email.visible = false
			cbx2_notif1.visible = false
			cbx2_notif2.visible = false
			dw2_textes_email.visible = false
			cb_lancer.y = 850
			cb_fermer.y = cb_lancer.y 
			this.height = 1188
			s_signataire2 = ""
			rb1_parent1.triggerevent(clicked!)
		else
			rb2_patient.triggerevent(clicked!)
			if signe_1 = 0 then 
				// Pas de signataire 1 - On enlève le signataire 1 - on remonte le signataire 2 et on réduit la fenêtre
				gb_signataire1.visible = false
				rb1_parent1.visible = false
				rb1_patient.visible = false
				rb1_parent2.visible = false
				rb1_payeur.visible = false
				cbx1_email.visible = false
				cbx1_notif1.visible = false
				cbx1_notif2.visible = false
				dw1_textes_email.visible = false

				gb_signataire2.y = gb_signataire1.y
				rb2_parent1.y = rb1_parent1.y
				rb2_patient.y = rb1_patient.y
				rb2_parent2.y = rb1_parent2.y
				rb2_payeur.y = rb1_payeur.y
				cbx2_email.y = cbx1_email.y
				cbx2_notif1.y = cbx1_notif1.y
				cbx2_notif2.y = cbx1_notif2.y
				dw2_textes_email.y = dw1_textes_email.y
				
				cb_lancer.y = 850
				cb_fermer.y = cb_lancer.y
				this.height = 1188
				s_signataire1 = ""
			else
				rb1_parent1.triggerevent(clicked!)
			end if 
		end if
		
		
		dw1_textes_email.settransobject(sqlca)
		dw2_textes_email.settransobject(sqlca)
		dw1_textes_email.retrieve()
		dw2_textes_email.retrieve()
	
	else
		Messagebox("ATTENTION", "Il n'y a aucun document dans la liste.~n~nRelance impossible !")
	end if
	
else
	Messagebox("ATTENTION", "Erreur dans le lancement de la relance !")
	close(this)
	
end if 
end event

type p_fond from w_fenetre_arakis`p_fond within w_liste_documents_attente_signature_en_ligne_relance
integer x = 951
integer y = 828
end type

type cb_fermer from uo_picturebutton_390x120_fermer within w_liste_documents_attente_signature_en_ligne_relance
integer x = 1577
integer y = 1484
integer width = 594
integer taborder = 10
boolean bringtotop = true
boolean default = true
end type

type cbx1_email from checkbox within w_liste_documents_attente_signature_en_ligne_relance
integer x = 265
integer y = 184
integer width = 512
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Envoi d~'un email"
boolean checked = true
end type

type dw1_textes_email from datawindow within w_liste_documents_attente_signature_en_ligne_relance
string tag = "no resize all"
integer x = 805
integer y = 184
integer width = 1216
integer height = 76
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_texte_email"
boolean border = false
boolean livescroll = true
end type

type rb1_parent1 from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
integer x = 2267
integer y = 172
integer width = 352
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parent 1"
boolean checked = true
end type

event clicked;cbx1_notif2.visible = true
s_signataire1 = "parent1"
end event

type rb1_patient from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
integer x = 2267
integer y = 272
integer width = 338
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Patient"
end type

event clicked;cbx1_notif2.visible = false
cbx1_notif2.checked = false
s_signataire1 = "patient"
end event

type rb1_parent2 from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
integer x = 2267
integer y = 372
integer width = 347
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parent 2"
end type

event clicked;cbx1_notif2.visible = false
s_signataire1 = "parent2"
end event

type rb1_payeur from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
integer x = 2267
integer y = 472
integer width = 320
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payeur"
end type

event clicked;cbx1_notif2.visible = false
s_signataire1 = "payeur"
end event

type cbx1_notif1 from checkbox within w_liste_documents_attente_signature_en_ligne_relance
integer x = 274
integer y = 348
integer width = 1216
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notification Application 1er Numéro"
boolean checked = true
end type

type cbx1_notif2 from checkbox within w_liste_documents_attente_signature_en_ligne_relance
integer x = 270
integer y = 516
integer width = 1275
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notification Application  2ème Numéro"
boolean checked = true
end type

type cbx2_email from checkbox within w_liste_documents_attente_signature_en_ligne_relance
integer x = 251
integer y = 892
integer width = 512
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Envoi d~'un email"
boolean checked = true
end type

type dw2_textes_email from datawindow within w_liste_documents_attente_signature_en_ligne_relance
string tag = "no resize all"
integer x = 818
integer y = 896
integer width = 1216
integer height = 76
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cherche_texte_email"
boolean border = false
boolean livescroll = true
end type

type rb2_parent1 from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
integer x = 2281
integer y = 896
integer width = 352
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parent 1"
end type

event clicked;cbx2_notif2.visible = true
s_signataire2 = "parent1"
end event

type rb2_patient from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
integer x = 2281
integer y = 996
integer width = 338
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Patient"
boolean checked = true
end type

event clicked;cbx2_notif2.visible = false
cbx2_notif2.checked = false
s_signataire2 = "patient"
end event

type rb2_parent2 from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
integer x = 2281
integer y = 1096
integer width = 347
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Parent 2"
end type

event clicked;cbx2_notif2.visible = true
s_signataire2 = "parent2"
end event

type rb2_payeur from radiobutton within w_liste_documents_attente_signature_en_ligne_relance
integer x = 2281
integer y = 1196
integer width = 320
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Payeur"
end type

event clicked;cbx2_notif2.visible = true
s_signataire2 = "payeur"
end event

type cbx2_notif1 from checkbox within w_liste_documents_attente_signature_en_ligne_relance
integer x = 251
integer y = 1060
integer width = 1216
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notification Application 1er Numéro"
boolean checked = true
end type

type cbx2_notif2 from checkbox within w_liste_documents_attente_signature_en_ligne_relance
boolean visible = false
integer x = 247
integer y = 1228
integer width = 1275
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Notification Application 2ème Numéro"
boolean checked = true
end type

type cb_lancer from uo_picturebutton_390x120 within w_liste_documents_attente_signature_en_ligne_relance
integer x = 855
integer y = 1484
integer width = 594
integer taborder = 70
boolean bringtotop = true
string text = "&Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;long lig, tot
w_signature_en_ligne_non_modale w_signature
string v_statut_signature, v_fichier_pdf
double v_code_patient

if s_signataire1 = s_signataire2 then
	
	Messagebox("ATTENTION", "Vous ne pouvez pas indiquer la même personne en signataire 1 et signataire 2 !")

else


	if not ( cbx1_email.checked or cbx1_notif1.checked or cbx1_notif2.checked) then
		messagebox("ATTENTION", "Vous devez cocher au moins un mode de relance pour le signataire 1 !")
	else
		if s_signataire2 <> "" and not ( cbx2_email.checked or cbx2_notif1.checked or cbx2_notif2.checked) then 
			messagebox("ATTENTION", "Vous devez cocher au moins un mode de relance pour le signataire 2 !")
		else
			
			tot = w_parent.dw_liste.rowcount() 
			
			if messagebox("QUESTION", "Confirmez-vous la relance de ce(s) " + string(tot) + " ligne(s) ?", question!, YesNo!, 2) = 1 then  
				
	
				// parcours de la liste
				for lig = 1 to tot
					
					
					v_statut_signature	= w_parent.dw_liste.getitemstring (lig , "historique_editions_statut_signature")
					v_fichier_pdf	= w_parent.dw_liste.getitemstring (lig , "historique_editions_nom_courrier")
					v_code_patient	= w_parent.dw_liste.getitemNumber(lig , "code")
				
					param_win[1] = v_statut_signature
					param_win[2] = v_fichier_pdf
					param_win[3] = w_parent.dw_liste.getitemstring (lig , "historique_editions_code_interne")
					
					openWithParm(w_signature, v_code_patient)
					
					// pour etre sur que la fenetre n'a pas été fermée dans l'open pour une mauvaise configuration
					if isvalid (w_signature) then
						w_signature.hide()
						w_signature.b_avec_message = false
						
						// Mise en place des éléments de l'interface
						
						// Signataire 1 
						
						w_signature.uo_signataire1.cbx_email1.checked = cbx1_email.checked
						w_signature.uo_signataire1.cbx_notif11.checked = cbx1_notif1.checked
						w_signature.uo_signataire1.cbx_notif12.checked = cbx1_notif2.checked
						w_signature.uo_signataire1.dw_textes_email1.setitem(1, "id", dw1_textes_email.getitemnumber(1, "id"))
						
						choose case s_signataire1
							case "parent1"
								w_signature.uo_signataire1.rb_parent1.triggerevent(clicked!)
							case "patient"
								w_signature.uo_signataire1.rb_patient.triggerevent(clicked!)
							case "parent2"
								w_signature.uo_signataire1.rb_parent2.triggerevent(clicked!)
							case "payeur"
								w_signature.uo_signataire1.rb_payeur.triggerevent(clicked!)
						end choose
						
		
						// signataire 2
						if s_signataire2 <> "" then 
							
							w_signature.uo_signataire2.cbx_email1.checked = cbx2_email.checked
							w_signature.uo_signataire2.cbx_notif11.checked = cbx2_notif1.checked
							w_signature.uo_signataire2.cbx_notif12.checked = cbx2_notif2.checked
							w_signature.uo_signataire2.dw_textes_email1.setitem(1, "id", dw2_textes_email.getitemnumber(1, "id"))
							
							choose case s_signataire1
								case "parent1"
									w_signature.uo_signataire2.rb_parent1.triggerevent(clicked!)
								case "patient"
									w_signature.uo_signataire2.rb_patient.triggerevent(clicked!)
								case "parent2"
									w_signature.uo_signataire2.rb_parent2.triggerevent(clicked!)
								case "payeur"
									w_signature.uo_signataire2.rb_payeur.triggerevent(clicked!)
							end choose
							
								
						end if
						
						
						
						// Lancement effectif de la signature
						w_signature.cb_envoi_signature.triggerevent(clicked!)
						
						
						close(w_signature)
					else
						Messagebox("ATTENTION", "Erreur dans la configuration de la Signature !~n~nAction impossible !")
						lig = tot + 1
					end if		
				next
				
				Messagebox("INFORMATION", "Opération terminée !")
				close(parent)
			end if
		end if
		
	end if
			
end if
end event

type gb_signataire1 from groupbox within w_liste_documents_attente_signature_en_ligne_relance
integer x = 128
integer y = 68
integer width = 2738
integer height = 664
integer taborder = 10
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Signataire 1"
end type

type gb_signataire2 from groupbox within w_liste_documents_attente_signature_en_ligne_relance
integer x = 128
integer y = 752
integer width = 2738
integer height = 664
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Signataire 2"
end type

