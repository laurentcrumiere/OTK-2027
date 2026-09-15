$PBExportHeader$w_initialisation.srw
forward
global type w_initialisation from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120_fermer within w_initialisation
end type
type cb_enregistrer from uo_picturebutton_390x120 within w_initialisation
end type
type st_4 from statictext within w_initialisation
end type
type st_3 from statictext within w_initialisation
end type
type em_clef3 from editmask within w_initialisation
end type
type em_clef2 from editmask within w_initialisation
end type
type em_clef1 from editmask within w_initialisation
end type
type st_2 from statictext within w_initialisation
end type
type pb_coller from uo_picturebutton_390x120 within w_initialisation
end type
type sle_paste from singlelineedit within w_initialisation
end type
type st_6 from statictext within w_initialisation
end type
type em_clef4 from editmask within w_initialisation
end type
type sle_url_autre from singlelineedit within w_initialisation
end type
type st_url_autre from statictext within w_initialisation
end type
type em_clef5 from editmask within w_initialisation
end type
type st_9 from statictext within w_initialisation
end type
type dw_cabinet from datawindow within w_initialisation
end type
type cb_mdp from uo_picturebutton_390x120 within w_initialisation
end type
type cb_cabinet from uo_picturebutton_390x120 within w_initialisation
end type
type cb_vider_table_mo from uo_picturebutton_390x120 within w_initialisation
end type
type cb_email from uo_picturebutton_390x120 within w_initialisation
end type
type gb_tea from groupbox within w_initialisation
end type
end forward

global type w_initialisation from w_fenetre_arakis
integer width = 3931
integer height = 2220
string title = "Paramètres Cabinet"
windowtype windowtype = response!
long backcolor = 15780518
boolean center = true
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
st_4 st_4
st_3 st_3
em_clef3 em_clef3
em_clef2 em_clef2
em_clef1 em_clef1
st_2 st_2
pb_coller pb_coller
sle_paste sle_paste
st_6 st_6
em_clef4 em_clef4
sle_url_autre sle_url_autre
st_url_autre st_url_autre
em_clef5 em_clef5
st_9 st_9
dw_cabinet dw_cabinet
cb_mdp cb_mdp
cb_cabinet cb_cabinet
cb_vider_table_mo cb_vider_table_mo
cb_email cb_email
gb_tea gb_tea
end type
global w_initialisation w_initialisation

type variables
boolean	sortir	//pour savoir si message nécéssaire en sortie
int 		flag

boolean b_mot_passe_tea_deja_saisi = false
end variables

forward prototypes
private subroutine aes ()
public function integer val_cbx (checkbox cb)
public function integer boolean_to_integer (boolean bool)
end prototypes

private subroutine aes ();//AntiEssaisSuccesifs
//pour éviter l'essais succécif de plusieurs num d'authenticité


if (h.VWrd[6] <> 0) AND (mod(h.VWrd[6],3) = 0) then
	em_clef1.enabled = false
	em_clef2.enabled = false
	em_clef3.enabled = false
	em_clef4.enabled = false
	cb_enregistrer.enabled = false
	cb_annuler.enabled = false
	
	sleep(10 *h.VWrd[6])
	
	em_clef1.enabled = true
	em_clef2.enabled = true
	em_clef3.enabled = true
	em_clef4.enabled = true
	cb_enregistrer.enabled = true
	cb_annuler.enabled = true
end if
end subroutine

public function integer val_cbx (checkbox cb);

// pour les test de validité de clefs 2014

// renvoie 0 ou 1 si un cbx est coché ou pas

if cb.checked  then 
	return 1
else
	return 0
end if 
end function

public function integer boolean_to_integer (boolean bool);
// renvoie 0 ou 1 selon le boolean

if bool then
	return 1
else
	return 0
end if
end function

event open;call super::open;string v_clef_logiciel_2013, v_url_application

dw_cabinet.settransobject(sqlca)
dw_cabinet.retrieve()

colore_datawindow(dw_cabinet)

select top 1 clef_logiciel_2013 into :v_clef_logiciel_2013 from param ;

if TEA then 
	dw_cabinet.object.url_application.visible = true
	dw_cabinet.object.url_application_t.visible = true
	dw_cabinet.object.b_tester_url_application.visible = true
	v_url_application = trim(string_non_nulle(dw_cabinet.getitemstring(1, "url_application")))
	if v_url_application = "" then
	
	//https://serveur:8443/dsapi/
	end if
end if


// Mise en place de l'URL licence locale si initialisation ... Sinon, on masque !
if trim(v_clef_logiciel_2013) = '' or trim(v_clef_logiciel_2013) = 'INITIALISATION' then
	sle_url_autre.text = 'http://localhost:5100/'
	sle_url_autre.visible = true
	st_url_autre.visible = true
else
	sle_url_autre.visible = false
	st_url_autre.visible = false
end if

if TEA then 
	string v_mdp
	v_mdp = string_non_nulle (trim(dw_cabinet.getitemstring(1, "mot_passe_tea")))
	gb_tea.visible = true
	cb_mdp.visible = true
	cb_cabinet.visible = true
	cb_vider_table_mo.visible = true
	cb_email.visible = true
	if v_mdp <> "" then
		cb_mdp.text = "Réinitialiser Mot de Passe"
		b_mot_passe_tea_deja_saisi = true
	else
		b_mot_passe_tea_deja_saisi = false
	end if
end if 


//pour mettre le focus ou il faut : confort utilisateur
//if licencelocale <> "" 						then em_clef1.setfocus()
//if trim(h.rak(0)) = "INITIALISATION" 	then em_clef1.setfocus()


message.doubleparm = 0	//init de l'objet message : nécessaire pour le bouton enregistrer



end event

on w_initialisation.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.st_4=create st_4
this.st_3=create st_3
this.em_clef3=create em_clef3
this.em_clef2=create em_clef2
this.em_clef1=create em_clef1
this.st_2=create st_2
this.pb_coller=create pb_coller
this.sle_paste=create sle_paste
this.st_6=create st_6
this.em_clef4=create em_clef4
this.sle_url_autre=create sle_url_autre
this.st_url_autre=create st_url_autre
this.em_clef5=create em_clef5
this.st_9=create st_9
this.dw_cabinet=create dw_cabinet
this.cb_mdp=create cb_mdp
this.cb_cabinet=create cb_cabinet
this.cb_vider_table_mo=create cb_vider_table_mo
this.cb_email=create cb_email
this.gb_tea=create gb_tea
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.cb_enregistrer
this.Control[iCurrent+3]=this.st_4
this.Control[iCurrent+4]=this.st_3
this.Control[iCurrent+5]=this.em_clef3
this.Control[iCurrent+6]=this.em_clef2
this.Control[iCurrent+7]=this.em_clef1
this.Control[iCurrent+8]=this.st_2
this.Control[iCurrent+9]=this.pb_coller
this.Control[iCurrent+10]=this.sle_paste
this.Control[iCurrent+11]=this.st_6
this.Control[iCurrent+12]=this.em_clef4
this.Control[iCurrent+13]=this.sle_url_autre
this.Control[iCurrent+14]=this.st_url_autre
this.Control[iCurrent+15]=this.em_clef5
this.Control[iCurrent+16]=this.st_9
this.Control[iCurrent+17]=this.dw_cabinet
this.Control[iCurrent+18]=this.cb_mdp
this.Control[iCurrent+19]=this.cb_cabinet
this.Control[iCurrent+20]=this.cb_vider_table_mo
this.Control[iCurrent+21]=this.cb_email
this.Control[iCurrent+22]=this.gb_tea
end on

on w_initialisation.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.em_clef3)
destroy(this.em_clef2)
destroy(this.em_clef1)
destroy(this.st_2)
destroy(this.pb_coller)
destroy(this.sle_paste)
destroy(this.st_6)
destroy(this.em_clef4)
destroy(this.sle_url_autre)
destroy(this.st_url_autre)
destroy(this.em_clef5)
destroy(this.st_9)
destroy(this.dw_cabinet)
destroy(this.cb_mdp)
destroy(this.cb_cabinet)
destroy(this.cb_vider_table_mo)
destroy(this.cb_email)
destroy(this.gb_tea)
end on

event close;call super::close;if not sortir then
	// si on essaye de sortir sans entrer un num authenticité
	if (trim(h.rak(0)) = "INITIALISATION") OR (h.cp(h.rak()) <> 1) then
		// si la base est à initialiser, la clef aussi forcément !
		Messagebox("INFORMATION ...","Vous n'avez pas achevé l'initialisation ~ndu Numéro d'Authenticité.~n~nORTHOkis(r) va donc se fermer.")
		halt close
	end if
else
	// un num authenticité valide est rentré
	if (not h.tm1o(2,2)) then
		//si c un num final
		if not h.is4net( ) then h.ww(51,0)			//on initialise FAS à 0
		h.ww(28,h.rw(19))	//on met en w28 le NumCabinet (comme à l'envoie de la clef)
	end if
end if

end event

event key;boolean	on_fait_pas


if KeyDown(KeyShift!) then on_fait_pas = true
if KeyDown(KeyCapsLock!) then on_fait_pas = true

if not on_fait_pas then
	choose case flag
		case 1
			if em_clef1.SelectedStart ( ) = 5 then
				em_clef2.setfocus()
				em_clef2.SelectText(1,0)
			end if
		case 2
			if em_clef2.SelectedStart ( ) = 5 then
				em_clef3.setfocus()
				em_clef3.SelectText(1,0)
			end if
		case 3
			if em_clef3.SelectedStart ( ) = 5 then
				em_clef4.setfocus()
				em_clef4.SelectText(1,0)
			end if
	end choose
end if

end event

type p_fond from w_fenetre_arakis`p_fond within w_initialisation
integer x = 4000
integer y = 1780
end type

type cb_annuler from uo_picturebutton_390x120_fermer within w_initialisation
integer x = 1778
integer y = 1888
integer width = 517
integer taborder = 120
end type

type cb_enregistrer from uo_picturebutton_390x120 within w_initialisation
integer x = 1198
integer y = 1888
integer width = 517
integer taborder = 110
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;string	licencelocale,  v_url_autre
boolean	blocal
boolean sortie
integer v_longueur_clef
string v_clef_logiciel_2023

string v_nom_licence, v_code_postal

dw_cabinet.accepttext()

v_nom_licence = dw_cabinet.getitemstring(1, "nom_licence")
v_code_postal = dw_cabinet.getitemstring(1, "code_postal")

sortie = false

if trim(v_nom_licence) = "" or trim(v_code_postal) = "" then
	// si aucun cabinet n'est indiqué
	messagebox("ATTENTION !","Vous n'avez pas saisi le Nom et/ou le Code Postal du Cabinet.~n~nVeuillez y remédier ....",Exclamation!)
else
	v_clef_logiciel_2023 = trim(em_clef1.text) + trim(em_clef2.text) + trim(em_clef3.text) + trim(em_clef4.text) + trim(em_clef5.text)
	v_longueur_clef = len(v_clef_logiciel_2023)
	
	if v_longueur_clef > 0 and  v_longueur_clef <> 25  then
		
		messagebox("ATTENTION !","Vous devez saisir une clef complète.~n~nVeuillez y remédier ....",Exclamation!)
	else
			
		// un cabinet est renseigné
		h.VWrd[6] = h.VWrd[6] +1	// pour éviter les essais succécifs de plusieurs num d'authenticité
		
		// on vérif si num authenticité tapé est un num d'évaluation ou final
		BLocal = h.leoe(trim(em_clef1.text) + trim(em_clef2.text) + trim(em_clef3.text))
		
		if v_longueur_clef > 0 and h.cp(trim(em_clef1.text) + trim(em_clef2.text) + trim(em_clef3.text) + trim(em_clef4.text)+ trim(em_clef5.text)) = 0 then
			// si le numéro indiqué ne semble pas correct (calcule sur bit de parité)
			MessageBox("ATTENTION !","La clef que vous avez saisie est incorrecte !~n~nVeuillez corriger ....",Exclamation!)
			em_clef1.setfocus()
		else
			// le calcule sur bit de parité est bon pour le numéro indiqué
			if v_longueur_clef > 0 and not h.chak(trim(em_clef1.text) + trim(em_clef2.text) + trim(em_clef3.text)) then
				// si le num authenticité d'indiqué n'est pas fait pour ce cabinet
				// (cf num client : w19 init ds la clef)
				messagebox("ATTENTION !","Le Numéro d'Authenticité que vous essayez d'entrer n'est pas fait pour votre cabinet.~n~nSauvegarde impossible.",Exclamation!)
				AES()	//pour éviter l'essais succécif de plusieurs num d'authenticité
				em_clef1.setfocus()
				sortie = true
				return	//on sort
			end if
			
		
			if MessageBox("Confirmation","Cabinet : "+ v_nom_licence + "  ("+v_code_postal+")"+"~n~nConfirmation ?",Question!,Yesno!,2) = 1 then
				// si l'utilisateur confirme le numéro d'authenticité indiqué
				dw_cabinet.update()
				if sqlca.sqlcode = 0 then
					commit ;
				else
					Messagebox("ERREUR DANS LA MISE A JOUR", sqlca.sqlerrtext )
					rollback ;
				end if
				
				v_url_autre = trim(sle_url_autre.text)	
				if v_url_autre <> "" then
					// pour être sur de ne pas effacer
					UPDATE "param" SET url_autre = :v_url_autre ;
				end if

				IF sqlca.sqlcode = 0 THEN
					// si l'écriture ds la base s'est bien passée
					COMMIT;
					
					if v_longueur_clef > 0 then 
						//Enregistrment ds la base du Num Authenticité
						h.wak(trim(em_clef1.text) + trim(em_clef2.text) + trim(em_clef3.text) + trim(em_clef4.text)+ trim(em_clef5.text))
					end if
					
					sortir = true	// indication qu'on est Ok (cf close event de la fenêtre)
					sortie = true
					if v_longueur_clef > 0 then 
						closewithreturn(parent,3218)
					else
						close(parent)
					end if
				else
					// pb lors de l'écriture ds la base
					Messagebox("ERREUR DANS LA MISE A JOUR", sqlca.sqlerrtext )
					ROLLBACK;
				END IF
			end if
		end if
	end if
end if

if not sortie then
	AES()	//pour éviter l'essais succécif de plusieurs num d'authenticité
end if
end event

type st_4 from statictext within w_initialisation
integer x = 1371
integer y = 1596
integer width = 91
integer height = 76
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "-"
alignment alignment = center!
end type

type st_3 from statictext within w_initialisation
integer x = 928
integer y = 1596
integer width = 91
integer height = 76
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "-"
alignment alignment = center!
end type

type em_clef3 from editmask within w_initialisation
integer x = 1463
integer y = 1596
integer width = 352
integer height = 96
integer taborder = 50
integer textsize = -15
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaaa"
end type

event getfocus;flag = 3
end event

event losefocus;flag = 0
end event

type em_clef2 from editmask within w_initialisation
integer x = 1019
integer y = 1596
integer width = 352
integer height = 96
integer taborder = 40
integer textsize = -15
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaaa"
end type

event getfocus;flag = 2
end event

event losefocus;flag = 0
end event

type em_clef1 from editmask within w_initialisation
integer x = 576
integer y = 1596
integer width = 352
integer height = 96
integer taborder = 30
integer textsize = -15
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaaa"
end type

event losefocus;flag = 0
end event

event getfocus;flag = 1
end event

type st_2 from statictext within w_initialisation
integer x = 101
integer y = 1612
integer width = 443
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nouvelle Clef :"
alignment alignment = right!
end type

type pb_coller from uo_picturebutton_390x120 within w_initialisation
integer x = 2747
integer y = 1568
integer width = 517
integer taborder = 70
boolean bringtotop = true
string text = "&Coller"
string iconname = "Paste_2!"
end type

event clicked;call super::clicked;string v_clef

// Copie le presse papier
sle_paste.text = ""
sle_paste.paste()

v_clef = sle_paste.text

// elimination des - et des espages si copie de shani
v_clef = gfx_tout_remplacer(v_clef, " ", "")
v_clef = gfx_tout_remplacer(v_clef, "-", "")

// Découpage pour mettre là ou il le faut
em_clef1.text = left(v_clef, 5)
em_clef2.text = mid(v_clef, 6, 5)
em_clef3.text = mid(v_clef, 11, 5)
em_clef4.text = mid(v_clef, 16, 5)
if len(v_clef) > 20 then
	em_clef5.text = mid(v_clef, 21, 5)
else
	// valeur par défaut pour aucune option
	em_clef5.text = "aabaa"
end if


end event

type sle_paste from singlelineedit within w_initialisation
boolean visible = false
integer x = 2647
integer y = 1888
integer width = 402
integer height = 112
integer taborder = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
borderstyle borderstyle = stylelowered!
end type

type st_6 from statictext within w_initialisation
integer x = 1815
integer y = 1596
integer width = 91
integer height = 76
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "-"
alignment alignment = center!
end type

type em_clef4 from editmask within w_initialisation
integer x = 1906
integer y = 1596
integer width = 352
integer height = 96
integer taborder = 60
boolean bringtotop = true
integer textsize = -15
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaaa"
end type

event getfocus;flag = 4
end event

type sle_url_autre from singlelineedit within w_initialisation
integer x = 585
integer y = 1740
integer width = 2670
integer height = 96
integer taborder = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

type st_url_autre from statictext within w_initialisation
integer x = 101
integer y = 1756
integer width = 443
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "URL Licences :"
alignment alignment = right!
end type

type em_clef5 from editmask within w_initialisation
integer x = 2350
integer y = 1596
integer width = 352
integer height = 96
integer taborder = 90
boolean bringtotop = true
integer textsize = -15
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = fixed!
fontfamily fontfamily = modern!
string facename = "Courier"
long textcolor = 33554432
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = stringmask!
string mask = "aaaaa"
end type

type st_9 from statictext within w_initialisation
integer x = 2258
integer y = 1596
integer width = 91
integer height = 76
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "-"
alignment alignment = center!
end type

type dw_cabinet from datawindow within w_initialisation
integer x = 50
integer y = 36
integer width = 3689
integer height = 1208
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_cabinet"
boolean livescroll = true
end type

event buttonclicked;
dw_cabinet.accepttext()
choose case String(dwo.name)
	case "b_tester_url_application"
		if dw_cabinet.update() = 1 then
			commit ;
			if not fxg_lancer_commande_dsapi("office/getOfficeDevices", "", "A", "G"  , 0) then
				Messagebox("ATTENTION","L'URL de DsApi n'est pas fonctionnelle !~n~nVous devez la corriger et/ou mettre en place un mot de passe. Si le problème persiste, veuillez la supprimer pour désactiver Téa car cela peut engendrer d'importants dysfonctionnements !")
			else
				Messagebox("INFORMATION","L'URL de DsApi est correcte !")
			end if
		else
			Messagebox("ATTENTION !","Erreur dans la mémorisation des informations !~n~n"+ sqlca.sqlerrtext)
		end if
end choose
end event

type cb_mdp from uo_picturebutton_390x120 within w_initialisation
boolean visible = false
integer x = 1934
integer y = 1372
integer width = 846
integer taborder = 30
boolean bringtotop = true
string text = "Initialiser Mot de Passe"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;
string ls_mdp
blob lblb_mdp

if b_mot_passe_tea_deja_saisi then
	if Messagebox("INFORMATION !","Vous allez réinitialiser le mot de passe de sécurité des transactions (internes) entre Orthokis et Téa..~nLe mot de passe d'accès à la Console ne sera pas modifier.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
		ls_mdp = inputbox("APPLICATION "+ LIBELLE_APPLICATION, "Veuillez indiquer le nouveau mot de passe pour " + LIBELLE_APPLICATION)
	end if
else
	if Messagebox("INFORMATION !","Vous allez saisir pour la première fois le mot de passe Téa.~nCe mot de passe de sécurité sera utilisé pour des transactions (internes) entre Orthokis et Téa.~nIl sera, par défaut, le mot de passe utilisé pour vous connecter à la Console Téa.~n~nPar la suite vous pourrez modifier le mot de passe d'accès à la Console (via la Console, indépendemment d'Orthokis) sans modifier ce mot de passe de sécurité.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then
		ls_mdp = inputbox("APPLICATION "+ LIBELLE_APPLICATION, "Veuillez indiquer le mot de passe pour " + LIBELLE_APPLICATION)
	end if
end if

Blob lblb_data
Blob lblb_md5
String ls_md5

lblb_data = Blob(ls_mdp, EncodingUTF8!)

CrypterObject lnv_CrypterObject
CoderObject lnv_CoderObject
lnv_CrypterObject = Create CrypterObject
lnv_CoderObject = Create CoderObject

lblb_md5 = lnv_CrypterObject.MD5(lblb_data)

ls_md5 = lower(lnv_CoderObject.HexEncode(lblb_md5))


update param set mot_passe_tea = :ls_md5 ;

if sqlca.sqlcode = 0 then
	commit ;
else
	messagebox("ATTENTION","Erreur dans la mise à jour du mot de passe : ~n~n" + sqlca.sqlerrtext)
	rollback ;
end if

end event

type cb_cabinet from uo_picturebutton_390x120 within w_initialisation
boolean visible = false
integer x = 1061
integer y = 1372
integer width = 846
integer taborder = 40
boolean bringtotop = true
string text = "Création Cabinet"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;if MessageBox("ATTENTION","Cette action ne doit être faite que pour initialiser le cabinet dans Téa.~n~nEst-ce bien le cas ?", Question!, YesNo!, 2) = 1 then
	open(w_patience)

	integer v_cpt = 0
	boolean ok_suite = true
	
	select isnull(count(*),0) into :v_cpt from type_rdv where nom is null ;
	
	if v_cpt > 0 then
		// Correction des types de rdv à NULL car ça peut générer la création du cabinet
		update type_rdv set  nom = code + ' *** a supprimer ? ***'  where nom is null ;
		if sqlca.sqlcode = 0 then
			commit ;
		else
			Messagebox("ATTENTION","Impossible de corriger des Types de rendez-vous à Null - Création impossible sans correction !~n~n" + sqlca.sqlerrtext )
			Rollback ;
		end if
	end if
	
	if not fxg_lancer_commande_dsapi("office/create", "", "", "G"  , 0) then
		Messagebox("ATTENTION","Erreur dans la création du Cabinet !~n~nIl est possible de Téa ne soit pas fonctionnelle !")
	else
		Messagebox("INFORMATION","La création du cabinet a été effectuée avec succès dans Téa !")
		
		// Suppression des anciennes connexions à Mon Ortho
		delete from patient_mon_orthodontiste ;
		if sqlca.sqlcode = 0 then
			commit ;
		else
			Messagebox("ATTENTION","Impossible de supprimer les (anciennes) informations de connexion à Mon Orthodontiste !~n~n" + sqlca.sqlerrtext )
			Rollback ;
		end if
		
	end if
	close(w_patience)
end if

end event

type cb_vider_table_mo from uo_picturebutton_390x120 within w_initialisation
boolean visible = false
integer x = 187
integer y = 1372
integer width = 846
integer taborder = 50
boolean bringtotop = true
string text = "Vider Table Mon Ortho"
string iconname = "ACTIONS_supprimer.png"
end type

event clicked;call super::clicked;

ok_mdp = false
open(w_mot_passe_administrateur)	

if ok_mdp then
	if messagebox("QUESTION", "Confirmez-vous le viage de la table des connexions de Mon Orthodontiste ?", Question!, YesNo!, 2) = 1 then
		Delete from patient_mon_orthodontiste ;
		if sqlca.sqlcode = 0 then 
			commit ;
			MessageBox("INFORMATION", "Vidage effectué avec succès !")
		else
			MessageBox("ERREUR", "Erreur dans le vidage : ~n~n" + sqlca.sqlerrtext)
			rollback ;
		end if
	end if
end if
end event

type cb_email from uo_picturebutton_390x120 within w_initialisation
boolean visible = false
integer x = 2807
integer y = 1372
integer width = 846
integer taborder = 40
boolean bringtotop = true
string text = "Ajouter eMail"
string iconname = "ACTIONS_ajouter.png"
end type

event clicked;call super::clicked;// 
If messagebox("CONFIRMATION","Vous allez ajouter un texte d'email dans la table afin de pouvoir l'adresser aux patients qui utilisaient Mon Orthodontiste auparavant.~n~nConfirmez-vous ?", Question!, YesNo!, 2) = 1 then

// recopie des fichiers qui vont bien

string ls_texte
string ls_fichier_email_haut, ls_fichier_email_bas
integer li_cpt2, li_cpt3

// Copie des fichiers images 
ls_fichier_email_haut = "email_mo_tea_haut.jpg"
ls_fichier_email_bas = "email_mo_tea_bas.jpg"

if FileCopy (dir_ini + ls_fichier_email_haut, dir_courriers + ls_fichier_email_haut, true) = 1 and FileCopy (dir_ini + ls_fichier_email_bas, dir_courriers + ls_fichier_email_bas, true) = 1 then 
	
	// insertion du texte de mail
	ls_texte = "{\rtf1\ansi\ansicpg1252\uc1\deff1\adeff1\deflang0\deflangfe0\adeflang0{\fonttbl" + &
"{\f0\fswiss\fcharset0\fprq2{\*\panose 020B0604020202020204}Arial;}" + &
"{\f1\fswiss\fcharset1\fprq2 Arial;}" + &
"{\f2\froman\fcharset2\fprq2{\*\panose 05050102010706020507}Symbol;}}" + &
"{\colortbl;\red0\green0\blue0;\red85\green87\blue93;\red255\green255\blue255;}" + &
"{\stylesheet{\s0\ltrpar\itap0\nowidctlpar\ql\li0\ri0\lin0\rin0\cbpat0\rtlch\af0\afs24\ltrch\f0\fs24\lang1036\langnp1036\langfe1036\langfenp1036 [Normal];}{\*\cs10\additive Default Paragraph Font;}{\s17\ltrpar\itap0\nowidctlpar\ql\li0\ri0\lin0\rin0\cbpat0\rtlch\af1\afs24\ltrch\f1\fs24\lang0\langnp0\langfe0\langfenp0\sbasedon0 BODY;}{\s18\ltrpar\itap0\nowidctlpar\ql\li0\ri0\lin0\rin0\sb160\sa320\cbpat0\rtlch\af1\afs48\ab\ltrch\f1\fs48\lang0\langnp0\langfe0\langfenp0\b\sbasedon17 H1;}{\*\cs19\rtlch\ab\ltrch\lang0\langnp0\langfe0\langfenp0\b\additive\sbasedon10 B;}}" + &
"{\info" + &
"{\*\txInfo{\txVer 32.0.831.500}}}" + &
"\paperw11905\paperh16838\margl0\margt0\margr0\margb0\deftab1134\widowctrl\trackmoves0\trackformatting1\lytexcttp\formshade\sectd" + &
"\headery567\footery567\pgwsxn13503\pghsxn16838\marglsxn1134\margtsxn1134\margrsxn1134\margbsxn1134\pgbrdropt32\pard\ltrpar\itap0\nowidctlpar\ql\li0\ri0\lin0\rin0\plain\rtlch\af0\afs24\alang1036\ltrch\f0\fs24\lang1036\langnp1036\langfe1036\langfenp1036\{logo_praticien\}\par\par\{logo2_praticien\}\par\par Pr\loch\af0\dbch\af0\hich\f0\''e9\hich\af0\dbch\af0\loch\f0 sentation de la nouvelle application T\loch\af0\dbch\af0\hich\f0\''e9\hich\af0\dbch\af0\loch\f0 a : https://www.youtube.com/watch?v=e5g3yy_Bifs\line\line\{logo3_praticien\}\par\plain\rtlch\af0\afs21\alang1036\acf2\ltrch\f0\fs21\lang1036\langnp1036\langfe1036\langfenp1036\cf2\par\pard\ltrpar\s17\itap0\nowidctlpar\ql\li0\ri0\lin0\rin0\sb150\sa150\cbpat3\plain\rtlch\af0\afs24\alang0\ab\ltrch\f0\fs24\lang0\langnp0\langfe0\langfenp0\b D\loch\af0\dbch\af0\hich\f0\''e9\hich\af0\dbch\af0\loch\f0 couvrez les 5 \loch\af0\dbch\af0\hich\f0\''e9\hich\af0\dbch\af0\loch\f0 tapes en vid\loch\af0\dbch\af0\hich\f0\''e9\hich\af0\dbch\af0\loch\f0 o\plain\rtlch\af0\afs24\alang0\ab\acf1\ltrch\f0\fs24\lang0\langnp0\langfe0\langfenp0\b\cf1  :\plain\rtlch\af0\afs24\alang0\acf1\ltrch\f0\fs24\lang0\langnp0\langfe0\langfenp0\cf1  https://www.youtube.com/watch?v=rWlkGnUuxqo\par\pard\ltrpar\s17\itap0\nowidctlpar\ql\li0\ri0\lin0\rin0\sb150\sa150\sl330\slmult0\cbpat3\plain\rtlch\af0\afs24\alang0\acf2\ltrch\f0\fs24\lang0\langnp0\langfe0\langfenp0\cf2 Nous esp\loch\af0\dbch\af0\hich\f0\''e9\hich\af0\dbch\af0\loch\f0 rons que vous appr\loch\af0\dbch\af0\hich\f0\''e9\hich\af0\dbch\af0\loch\f0 cierez pleinement cette nouvelle application et vous souhaitons une excellente utilisation de T\loch\af0\dbch\af0\hich\f0\''e9\hich\af0\dbch\af0\loch\f0 a.\plain\rtlch\af0\afs24\alang0\acf1\ltrch\f0\fs24\lang0\langnp0\langfe0\langfenp0\cf1\par\plain\rtlch\af0\afs24\alang0\acf2\ltrch\f0\fs24\lang0\langnp0\langfe0\langfenp0\cf2 Nous restons bien entendu \loch\af0\dbch\af0\hich\f0\''e0\hich\af0\dbch\af0\loch\f0  votre disposition pour vous accompagner dans cette transition et r\loch\af0\dbch\af0\hich\f0\''e9\hich\af0\dbch\af0\loch\f0 pondre \loch\af0\dbch\af0\hich\f0\''e0\hich\af0\dbch\af0\loch\f0  toutes vos questions.\plain\rtlch\af0\afs24\alang0\acf1\ltrch\f0\fs24\lang0\langnp0\langfe0\langfenp0\cf1\par\plain\rtlch\af0\afs24\alang0\acf2\ltrch\f0\fs24\lang0\langnp0\langfe0\langfenp0\cf2\loch\af0\dbch\af0\hich\f0\''c0\hich\af0\dbch\af0\loch\f0  tr\loch\af0\dbch\af0\hich\f0\''e8\hich\af0\dbch\af0\loch\f0 s bient\loch\af0\dbch\af0\hich\f0\''f4\hich\af0\dbch\af0\loch\f0 t,\plain\rtlch\af0\afs24\alang0\acf1\ltrch\f0\fs24\lang0\langnp0\langfe0\langfenp0\cf1\par\plain\rtlch\af0\afs24\alang0\acf2\ltrch\f0\fs24\lang0\langnp0\langfe0\langfenp0\cf2 L\loch\af0\dbch\af0\hich\f0\''92\''e9\hich\af0\dbch\af0\loch\f0 quipe du cabinet.\plain\rtlch\af0\afs20\alang0\acf1\ltrch\f0\fs20\lang0\langnp0\langfe0\langfenp0\cf1\par\pard\ltrpar\s17\itap0\nowidctlpar\ql\li0\ri0\lin0\rin0\sb150\sa150\cbpat3\par\pard\ltrpar\itap0\nowidctlpar\ql\li0\ri0\lin0\rin0 }"

	INSERT INTO email_texte_defaut ("nom", "texte", "objet", "ordre_trie", "actif", "id_categorie")
	VALUES ( 	'MON ORTHO -> TEA', :ls_texte	, 'MonOrthodontiste devient Téa !',	100,	1,	 1);
	
	if sqlca.sqlcode = 0 then 
		commit ;
		
		// mise à jour de la table des praticien pour logo2 et logo3 si pas utilisés, sinon, message d'erreur 
		
		// Logo 2
		select count(*) into :li_cpt2 from prati where trim(isnull(chemin_complet_logo2,'')) <> '' and actif = 1 ;
		if li_cpt2 > 0 then 
			Messagebox("ATTENTION", string(li_cpt2) + " praticien(s) utilise(nt) le logo N°2 !")
		end if
		ls_fichier_email_haut = dir_courriers + ls_fichier_email_haut
		update prati set chemin_complet_logo2 = :ls_fichier_email_haut where trim(isnull(chemin_complet_logo2,'')) = '' and actif = 1 ;
		if sqlca.sqlcode = 0 then 
			commit ;
		else
			Messagebox("ATTENTION", "Une erreur s'est produite dans mise à jour de la table des praticiens pour le logo n°2 !~n~n" + sqlca.sqlerrtext)
			rollback ;
		end if
		// Logo 3
		select count(*) into :li_cpt3 from prati where trim(isnull(chemin_complet_logo3,'')) <> '' and actif = 1 ;
		if li_cpt3 > 0 then 
			Messagebox("ATTENTION", string(li_cpt3) + " praticien(s) utilise(nt) le logo N°3 !")
		end if
		ls_fichier_email_bas = dir_courriers + ls_fichier_email_bas
		update prati set chemin_complet_logo3 = :ls_fichier_email_bas where trim(isnull(chemin_complet_logo3,'')) = '' and actif = 1 ;
		
		if sqlca.sqlcode = 0 then 
			commit ;
		else
			Messagebox("ATTENTION", "Une erreur s'est produite dans mise à jour de la table des praticiens pour le logo n°3 !~n~n" + sqlca.sqlerrtext)
			rollback ;
		end if
		
		Messagebox("INFORMATION", "Mise en place terminée !")

	
	else
		Messagebox("ATTENTION", "Une erreur s'est produite dans l'ajout du mail dans la table !~n~n" + sqlca.sqlerrtext)
		rollback ;
		
	end if
	
else
	Messagebox("ATTENTION", "Une erreur s'est produite dans la copie des fichiers images !")
end if


end if


end event

type gb_tea from groupbox within w_initialisation
boolean visible = false
integer x = 137
integer y = 1288
integer width = 3575
integer height = 272
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean italic = true
long backcolor = 553648127
string text = "Spécial Téa"
borderstyle borderstyle = stylebox!
end type

