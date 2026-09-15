$PBExportHeader$w_efacturation_belgique_lecture_isi.srw
forward
global type w_efacturation_belgique_lecture_isi from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120_fermer within w_efacturation_belgique_lecture_isi
end type
type cb_lancer from commandbutton within w_efacturation_belgique_lecture_isi
end type
type p_qr_code from picture within w_efacturation_belgique_lecture_isi
end type
type st_titre from statictext within w_efacturation_belgique_lecture_isi
end type
type mle_lire_isi from multilineedit within w_efacturation_belgique_lecture_isi
end type
type p_code_barre from picture within w_efacturation_belgique_lecture_isi
end type
type sle_niss_test from singlelineedit within w_efacturation_belgique_lecture_isi
end type
type st_1 from statictext within w_efacturation_belgique_lecture_isi
end type
end forward

global type w_efacturation_belgique_lecture_isi from w_fenetre_arakis
integer width = 1531
integer height = 680
string title = "Lecture par scanner"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
cb_lancer cb_lancer
p_qr_code p_qr_code
st_titre st_titre
mle_lire_isi mle_lire_isi
p_code_barre p_code_barre
sle_niss_test sle_niss_test
st_1 st_1
end type
global w_efacturation_belgique_lecture_isi w_efacturation_belgique_lecture_isi

type variables

integer li_type_lecture

uo_lire_eid_belgique uo_valeur_retour
end variables

on w_efacturation_belgique_lecture_isi.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_lancer=create cb_lancer
this.p_qr_code=create p_qr_code
this.st_titre=create st_titre
this.mle_lire_isi=create mle_lire_isi
this.p_code_barre=create p_code_barre
this.sle_niss_test=create sle_niss_test
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_lancer
this.Control[iCurrent+3]=this.p_qr_code
this.Control[iCurrent+4]=this.st_titre
this.Control[iCurrent+5]=this.mle_lire_isi
this.Control[iCurrent+6]=this.p_code_barre
this.Control[iCurrent+7]=this.sle_niss_test
this.Control[iCurrent+8]=this.st_1
end on

on w_efacturation_belgique_lecture_isi.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_lancer)
destroy(this.p_qr_code)
destroy(this.st_titre)
destroy(this.mle_lire_isi)
destroy(this.p_code_barre)
destroy(this.sle_niss_test)
destroy(this.st_1)
end on

event open;call super::open;// Renvoie le N° de la carte  lu 


li_type_lecture = message.doubleparm

choose case li_type_lecture
	case 1	// Lecture QR Code
		st_titre.text = "Veuillez scanner le QR code du document du patient"
		p_code_barre.visible = false
		p_qr_code.visible = true
case 2	// Lecture code barre
		st_titre.text = "Veuillez scanner le code barre du document du patient"
		p_code_barre.visible = true
		p_qr_code.visible = false
end choose

trace("- Open w_efacturation_belgique_lecture_isi")
trace("- li_type_lecture : " + string(li_type_lecture))

uo_valeur_retour = create uo_lire_eid_belgique
uo_valeur_retour.cardnumber = ""
uo_valeur_retour.ssin = ""

mle_lire_isi.setfocus()


end event

event close;call super::close;trace("- Close w_efacturation_belgique_lecture_isi")
end event

type p_fond from w_fenetre_arakis`p_fond within w_efacturation_belgique_lecture_isi
integer x = 617
integer y = 728
end type

type cb_annuler from uo_picturebutton_390x120_fermer within w_efacturation_belgique_lecture_isi
integer x = 494
integer y = 384
integer width = 489
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;// On n'a rien lu
CloseWithReturn(parent, uo_valeur_retour)

end event

event rbuttondown;call super::rbuttondown;// pour augmenter la hauter pour les test
if serial = "87001" then 
	parent.height = 1800
	parent.width = 2100
end if
end event

type cb_lancer from commandbutton within w_efacturation_belgique_lecture_isi
integer x = 384
integer y = 884
integer width = 288
integer height = 120
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Lancer"
boolean default = true
end type

event clicked;// sauvegarde en fichier temp

string ls_fichier_temp_xml
integer li_fichier_temp_xml
string ls_texte_lu 




if li_type_lecture = 1 then
//	QR code => faut décode le xml
	ls_fichier_temp_xml = dir_ini + "isi_temp.xml"
	
	// par sécurité
	if fileExists(ls_fichier_temp_xml) then
		FileDelete(ls_fichier_temp_xml)
	end if
	
	li_fichier_temp_xml = fileOpen(ls_fichier_temp_xml, TextMode!,write!, LockWrite!, replace!, EncodingUTF8! )
	
	ls_texte_lu = mle_lire_isi.text
	
	FileWriteEx(li_fichier_temp_xml, ls_texte_lu)
	
	FileClose(li_fichier_temp_xml)
	
	if not fileExists(ls_fichier_temp_xml) then
		Messagebox("ATTENTION", "Erreur N°1 dans la lecture du document !")
		uo_valeur_retour.cardnumber = ""
	else
		
		// Lecture des éléments dans le XML
		
		try 
			// Déclaration des variables PBDOM
			PBDOM_Builder       pbdom_bld
			PBDOM_Document      pbdom_doc
			PBDOM_Element       pbdom_root, pbdom_identity, pbdom_card
			string              ls_ssin, ls_card_num
			
			// 1. Initialisation du Builder
			pbdom_bld = create PBDOM_Builder
			
			// 2. Chargement du fichier (remplacez par votre chemin réel)
			pbdom_doc = pbdom_bld.BuildFromFile(ls_fichier_temp_xml)
			
			// 3. Récupération de la racine <isi>
			pbdom_root = pbdom_doc.GetRootElement()
			
			// 4. Extraction du SSIN (situé dans isi -> identity -> ssin)
			pbdom_identity = pbdom_root.GetChildElement("identity")
			if isValid(pbdom_identity) then
			    ls_ssin = pbdom_identity.GetChildElement("ssin").GetText()
			end if
			
			// 5. Extraction du numéro de carte (situé dans isi -> card -> n)
			pbdom_card = pbdom_root.GetChildElement("card")
			if isValid(pbdom_card) then
			    ls_card_num = pbdom_card.GetChildElement("n").GetText()
			end if
			
			// 6. Affichage des résultats
			//MessageBox("Données extraites", "SSIN : " + ls_ssin + "~r~nCarte : " + ls_card_num)
			
			Trace("Valeurs lues :  ls_ssin = " + ls_ssin + "    ls_card_num =  " + ls_card_num)

			uo_valeur_retour.cardnumber = ls_card_num
			if sle_niss_test.text <> "" then 
				uo_valeur_retour.ssin = sle_niss_test.text
			else
				uo_valeur_retour.ssin = ls_ssin
			end if
			
			// Nettoyage
			destroy pbdom_bld
				
		Catch (RuntimeError er)
			Messagebox("ATTENTION", "Erreur N°2 dans la lecture du document !")
			uo_valeur_retour.cardnumber = "" 
		End Try
	end if
else
	// code barre ... on renvoie simplement la valeur lue
	ls_ssin = left(trim(mle_lire_isi.text),11	)
	ls_card_num = right(trim(mle_lire_isi.text),10)
	
	Trace("Valeurs lues :  ls_ssin = " + ls_ssin + "    ls_card_num =  " + ls_card_num)

	uo_valeur_retour.cardnumber = ls_card_num
	
	if sle_niss_test.text <> "" then 
		uo_valeur_retour.ssin = sle_niss_test.text
	else
		uo_valeur_retour.ssin = ls_ssin
	end if

end if

CloseWithReturn( parent, uo_valeur_retour)

end event

type p_qr_code from picture within w_efacturation_belgique_lecture_isi
integer x = 1184
integer y = 124
integer width = 165
integer height = 136
boolean bringtotop = true
string picturename = "lc_gs1.png"
boolean focusrectangle = false
end type

type st_titre from statictext within w_efacturation_belgique_lecture_isi
integer x = 18
integer y = 24
integer width = 928
integer height = 292
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
boolean enabled = false
string text = "Veuillez scanner le QR code du document du patient"
alignment alignment = center!
boolean focusrectangle = false
end type

type mle_lire_isi from multilineedit within w_efacturation_belgique_lecture_isi
integer x = 768
integer y = 868
integer width = 1111
integer height = 764
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
end type

type p_code_barre from picture within w_efacturation_belgique_lecture_isi
integer x = 1056
integer y = 128
integer width = 421
integer height = 136
boolean bringtotop = true
string picturename = "lc_code_barre.png"
boolean focusrectangle = false
end type

type sle_niss_test from singlelineedit within w_efacturation_belgique_lecture_isi
integer x = 768
integer y = 700
integer width = 571
integer height = 112
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_efacturation_belgique_lecture_isi
integer x = 146
integer y = 724
integer width = 599
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 553648127
string text = " Niss pour les tests : "
alignment alignment = center!
boolean focusrectangle = false
end type

