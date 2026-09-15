$PBExportHeader$w_couchat_export_prelev_quadratus.srw
forward
global type w_couchat_export_prelev_quadratus from w_fenetre_arakis
end type
type sle_pourcent from singlelineedit within w_couchat_export_prelev_quadratus
end type
type uo_1 from resize_fenetre within w_couchat_export_prelev_quadratus
end type
type dw_envoi from datawindow within w_couchat_export_prelev_quadratus
end type
type dw_liste from datawindow within w_couchat_export_prelev_quadratus
end type
type em_da from editmask within w_couchat_export_prelev_quadratus
end type
type cb_rechercher from uo_picturebutton_390x120 within w_couchat_export_prelev_quadratus
end type
type cb_imprimer from uo_picturebutton_390x120 within w_couchat_export_prelev_quadratus
end type
type cb_lancer from uo_picturebutton_390x120 within w_couchat_export_prelev_quadratus
end type
type pb_2 from uo_picturebutton_390x120_fermer within w_couchat_export_prelev_quadratus
end type
type gb_2 from groupbox within w_couchat_export_prelev_quadratus
end type
end forward

global type w_couchat_export_prelev_quadratus from w_fenetre_arakis
integer x = 27
integer y = 140
integer width = 3657
integer height = 1952
string title = "Envois des Prélèvementsvers Comptabilité Quadratus"
long backcolor = 15780518
sle_pourcent sle_pourcent
uo_1 uo_1
dw_envoi dw_envoi
dw_liste dw_liste
em_da em_da
cb_rechercher cb_rechercher
cb_imprimer cb_imprimer
cb_lancer cb_lancer
pb_2 pb_2
gb_2 gb_2
end type
global w_couchat_export_prelev_quadratus w_couchat_export_prelev_quadratus

forward prototypes
public function boolean exporter_text_brut (datawindow dw, string fichier)
end prototypes

public function boolean exporter_text_brut (datawindow dw, string fichier);

boolean result = true
integer num_fichier, nb_caracteres
string ligne, nom_colonne, valeur_colonne

long nb_colonnes = 32

long nb_lignes 
long cpt_ligne, cpt_colonne

nb_lignes = dw.rowcount()


num_fichier = fileOpen(fichier, LineMode!, Write! , LockReadWrite! , Replace!)

for cpt_ligne = 1 to nb_lignes
	
	ligne = ""
	
	for cpt_colonne = 1 to nb_colonnes
	
	
		dw.SetColumn(cpt_colonne)
		
		nom_colonne = dw.getColumnName()
		valeur_colonne = dw.getItemString( cpt_ligne, cpt_colonne)
		
		if isnull(valeur_colonne) then 
			valeur_colonne = ""
		end if
		
		// pour obtenir la largeur de la colonne en nb de caractères on se sert de la case 'limit'
		nb_caracteres = integer( dw.describe(nom_colonne+".edit.limit") )
		
		ligne = ligne + left(  valeur_colonne + space(300), nb_caracteres)
	
	
	next
	fileWrite(num_fichier, ligne)
	
	
	
next

fileClose(num_fichier)

return result 
end function

event open;call super::open;em_da.text = string(today())

dw_envoi.settransobject(SQLCA)

dw_liste.settransobject(SQLCA)
uo_1.taille(this)






end event

on w_couchat_export_prelev_quadratus.create
int iCurrent
call super::create
this.sle_pourcent=create sle_pourcent
this.uo_1=create uo_1
this.dw_envoi=create dw_envoi
this.dw_liste=create dw_liste
this.em_da=create em_da
this.cb_rechercher=create cb_rechercher
this.cb_imprimer=create cb_imprimer
this.cb_lancer=create cb_lancer
this.pb_2=create pb_2
this.gb_2=create gb_2
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.sle_pourcent
this.Control[iCurrent+2]=this.uo_1
this.Control[iCurrent+3]=this.dw_envoi
this.Control[iCurrent+4]=this.dw_liste
this.Control[iCurrent+5]=this.em_da
this.Control[iCurrent+6]=this.cb_rechercher
this.Control[iCurrent+7]=this.cb_imprimer
this.Control[iCurrent+8]=this.cb_lancer
this.Control[iCurrent+9]=this.pb_2
this.Control[iCurrent+10]=this.gb_2
end on

on w_couchat_export_prelev_quadratus.destroy
call super::destroy
destroy(this.sle_pourcent)
destroy(this.uo_1)
destroy(this.dw_envoi)
destroy(this.dw_liste)
destroy(this.em_da)
destroy(this.cb_rechercher)
destroy(this.cb_imprimer)
destroy(this.cb_lancer)
destroy(this.pb_2)
destroy(this.gb_2)
end on

event resize;uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_couchat_export_prelev_quadratus
end type

type sle_pourcent from singlelineedit within w_couchat_export_prelev_quadratus
integer x = 288
integer y = 1664
integer width = 951
integer height = 112
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 81324524
borderstyle borderstyle = stylelowered!
end type

type uo_1 from resize_fenetre within w_couchat_export_prelev_quadratus
boolean visible = false
integer x = 1595
integer y = 460
integer taborder = 21
long backcolor = 1090519039
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_envoi from datawindow within w_couchat_export_prelev_quadratus
boolean visible = false
integer x = 283
integer y = 868
integer width = 2766
integer height = 360
integer taborder = 30
string dataobject = "dw_couchat_export_quadratus_ascii"
boolean livescroll = true
end type

type dw_liste from datawindow within w_couchat_export_prelev_quadratus
boolean visible = false
integer x = 69
integer y = 20
integer width = 3479
integer height = 1568
integer taborder = 60
string dataobject = "dw_couchat_export_prelevements"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type em_da from editmask within w_couchat_export_prelev_quadratus
integer x = 2126
integer y = 128
integer width = 517
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
double increment = 1
string minmax = "~~"
end type

type cb_rechercher from uo_picturebutton_390x120 within w_couchat_export_prelev_quadratus
integer x = 1659
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 40
boolean bringtotop = true
string text = "&Rechercher"
end type

event clicked;call super::clicked;


string var_pra
date date_max


date_max = date(em_da.text)

ok_mdp = false

dw_liste.retrieve( date_max )

close(w_patience)

if dw_liste.rowcount() > 0 then

	this.enabled = false
	dw_liste.visible = true
	cb_lancer.enabled = true
	cb_imprimer.enabled = true
else
	Messagebox("ATTENTION !","Il n'y a aucun prélèvement à transférer !")
end if




end event

type cb_imprimer from uo_picturebutton_390x120 within w_couchat_export_prelev_quadratus
integer x = 2130
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 50
boolean bringtotop = true
boolean enabled = false
string text = "&Imprimer"
end type

event clicked;call super::clicked;dw_liste.print()
end event

type cb_lancer from uo_picturebutton_390x120 within w_couchat_export_prelev_quadratus
integer x = 2592
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 60
boolean bringtotop = true
boolean enabled = false
string text = "&Lancer"
end type

event clicked;call super::clicked;
double tot,cpt, lig
string m
boolean adulte 
boolean deux_lignes_de_vente 
string compte_banque = '51210000'
string v_lettre

double v_base, v_depassement, v_total

tot = dw_liste.rowcount()

// On vérfie les codes comptables des patients
lig =  dw_liste.Find( 'longueur_moulage = 0', 0, tot)

if lig > 0 then 
	Messagebox("ATTENTION","Le patient "+dw_liste.getitemString(lig,"nom_patient_complet")+" n'a pas de compte comptable.~n~nLe transfert ne peut avoir lieu !")
	cb_rechercher.enabled = true
	dw_liste.visible = false
	cb_lancer.enabled = false
	cb_imprimer.enabled = false

else

	
	string fichier_export 
	fichier_export  =  dir_ini + "QUADRATUS_REGL.TXT"
	
	
	if MessageBox("ATTENTION !","1°/ Cette opération va générer le fichier '" + fichier_export + "' contenant les écritures à envoyer vers Quadratus Compta.~n~n2°/ Vous allez écraser le transfert précédent.~n~n3°/ Cette opération est~nABSOLUMENT IRREMEDIABLE !~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then
	
		open(w_patience)
		sle_pourcent.visible = true
	
		
		string classification_du_soin
		date v_date_courante, v_date_debit
		decimal {2}  v_montant
		boolean meme_date
		
		cpt = 1
			
		do while  cpt <= tot
				
			sle_pourcent.text = "Avancement : "+string(cpt)+"/"+string(tot)
			
			v_date_courante = dw_liste.getitemDate(cpt,"paye_date")
			meme_date = true
			
			v_montant = 0
			
			do while meme_date and cpt <= tot
			
				dw_liste.ScrollToRow(cpt)
			
				// Ecriture de banque - CREDIT 
				//------------------------
				
				dw_envoi.insertrow(0)
				lig = dw_envoi.rowcount()
	
				dw_envoi.setitem(lig,"type","M")
				dw_envoi.setitem(lig,"compte", dw_liste.getitemString(cpt,"patient_moulage") )	
				dw_envoi.setitem(lig,"code_journal_2", "CL")	
				dw_envoi.setitem(lig,"folio", "000")	
				dw_envoi.setitem(lig,"date_ecriture", string(dw_liste.getitemDate(cpt,"paye_date"), "ddmmyy"))
				dw_envoi.setitem(lig,"code_libelle", "P")	
				dw_envoi.setitem(lig,"libelle_libre", dw_liste.getitemString(cpt,"nom_patient_complet"))	
				dw_envoi.setitem(lig,"libelle", dw_liste.getitemString(cpt,"nom_patient_complet"))	
				dw_envoi.setitem(lig,"sens", "C")	
				dw_envoi.setitem(lig,"montant",  string(dw_liste.getitemNumber(cpt,"paye_montant") * 100 , "+#############"))	
				dw_envoi.setitem(lig,"contrepartie","")	
				dw_envoi.setitem(lig,"date_echeance", string(dw_liste.getitemDate(cpt,"paye_date"), "ddmmyy"))
				dw_envoi.setitem(lig,"code_devise", "EUR")	
				dw_envoi.setitem(lig,"code_journal_3", "CL")	
				dw_envoi.setitem(lig,"flag_code_tva", "N")	
				dw_envoi.setitem(lig,"montant_signe",  string(dw_liste.getitemNumber(cpt,"paye_montant") * 100 , "+#############"))	
				
				//	Mise à jour de la date de transfert 
				dw_liste.setitem(cpt, "paye_transfert", today())
				
				v_date_debit = dw_liste.getitemDate(cpt,"paye_date")
				
				v_montant = v_montant + dw_liste.getitemNumber(cpt,"paye_montant")
				
				cpt = cpt + 1
				
				if cpt <= tot then
					if v_date_courante <> dw_liste.getitemDate(cpt,"paye_date") then
						meme_date = false
					end if
				end if
				
			loop
				
			
			// Ecriture du client - DEBIT
			//------------------------

			dw_envoi.insertrow(0)
			lig = dw_envoi.rowcount()

			dw_envoi.setitem(lig,"type","M")
			dw_envoi.setitem(lig,"compte", compte_banque)	
			dw_envoi.setitem(lig,"code_journal_2", "CL")	
			dw_envoi.setitem(lig,"folio", "000")	
			dw_envoi.setitem(lig,"date_ecriture", string(v_date_debit , "ddmmyy"))
			dw_envoi.setitem(lig,"code_libelle", "P")	
			dw_envoi.setitem(lig,"libelle_libre", "Prélèvement")	
			dw_envoi.setitem(lig,"libelle", "Prélèvement")	
			dw_envoi.setitem(lig,"sens", "D")	
			dw_envoi.setitem(lig,"montant",  string(v_montant * 100 , "+#############"))	
			dw_envoi.setitem(lig,"contrepartie","")	
			dw_envoi.setitem(lig,"date_echeance", string(v_date_debit , "ddmmyy"))
			dw_envoi.setitem(lig,"code_devise", "EUR")	
			dw_envoi.setitem(lig,"code_journal_3", "CL")	
			dw_envoi.setitem(lig,"flag_code_tva", "N")	
			dw_envoi.setitem(lig,"montant_signe",  string(v_montant * 100 , "+#############"))	
			
	
		loop 
	
		dw_liste.ScrollToRow(1)
	
		sle_pourcent.text = "Exportation du fichier"
	
		if exporter_text_brut(dw_envoi , fichier_export) then
			close(w_patience)
	
			if dw_liste.update() = 1 then
				commit ;
				MessageBox("ATTENTION !","L'envoi a été réalisé avec succès !")
				
				fermer_fenetre(parent)
			else
				MessageBox("ATTENTION !","Une erreur N°1 est survenue durant l'envoi.~nIl n'a pas été effectué avec succés !")	
				Rollback ;
			end if
		else
			close(w_patience)
			MessageBox("ATTENTION !","Une erreur N°2 est survenue durant l'envoi.~nIl n'a pas été effectué avec succés !")	
		end if
	
		
		
	
	end if
	
end if
end event

type pb_2 from uo_picturebutton_390x120_fermer within w_couchat_export_prelev_quadratus
integer x = 3058
integer y = 1648
integer width = 411
integer height = 152
integer taborder = 40
boolean bringtotop = true
end type

event clicked;

fermer_fenetre(parent)
end event

type gb_2 from groupbox within w_couchat_export_prelev_quadratus
integer x = 1792
integer y = 28
integer width = 1253
integer height = 236
integer taborder = 40
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long textcolor = 33554432
long backcolor = 15780518
string text = "Prélèvements saisis jusqu~'au"
end type

