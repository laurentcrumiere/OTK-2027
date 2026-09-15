$PBExportHeader$w_udi_lecture.srw
forward
global type w_udi_lecture from w_fenetre_arakis
end type
type cb_annuler from uo_picturebutton_390x120_fermer within w_udi_lecture
end type
type sle_gs1 from singlelineedit within w_udi_lecture
end type
type cb_lancer from commandbutton within w_udi_lecture
end type
type p_1 from picture within w_udi_lecture
end type
type st_1 from statictext within w_udi_lecture
end type
type uo_udi from u_scintilla within w_udi_lecture
end type
end forward

global type w_udi_lecture from w_fenetre_arakis
integer width = 1207
integer height = 636
string title = "Lecture d~'un code barre UDI"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_annuler cb_annuler
sle_gs1 sle_gs1
cb_lancer cb_lancer
p_1 p_1
st_1 st_1
uo_udi uo_udi
end type
global w_udi_lecture w_udi_lecture

type variables


string v_di
string v_numero_lot
date v_date_peremption, v_date_fabrication


str_udi v_udi

string s_chaine_lu = ""
string s_chaine_finale = ""

integer nb_car_lu = 0
end variables

on w_udi_lecture.create
int iCurrent
call super::create
this.cb_annuler=create cb_annuler
this.sle_gs1=create sle_gs1
this.cb_lancer=create cb_lancer
this.p_1=create p_1
this.st_1=create st_1
this.uo_udi=create uo_udi
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_annuler
this.Control[iCurrent+2]=this.sle_gs1
this.Control[iCurrent+3]=this.cb_lancer
this.Control[iCurrent+4]=this.p_1
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.uo_udi
end on

on w_udi_lecture.destroy
call super::destroy
destroy(this.cb_annuler)
destroy(this.sle_gs1)
destroy(this.cb_lancer)
destroy(this.p_1)
destroy(this.st_1)
destroy(this.uo_udi)
end on

event open;call super::open;//sle_gs1.setfocus()

trace("- Open w_UDI_lecture")
uo_udi.setfocus()


end event

event key;call super::key;string lu
boolean fin = false
integer i

nb_car_lu = nb_car_lu + 1

//Trace ("- Key : " + string(key))

IF KeyDown(13) then
	// Caractère de fin de saisie
	
	uo_udi.of_selectall()
	
	s_chaine_lu = uo_udi.of_gettext()
	
	Trace ("- Chaine lue brute : " + s_chaine_lu)
	
//	// recherche du char(25)
//	nb_car_lu = nb_car_lu / 2		// y a des caractères Shit au milieu
//	i = 1
//	do while i <= nb_car_lu and not fin
//		//messagebox("asc", string(i) +" -> " + string(asc(mid(s_chaine_lu, i, 1))))
//		if asc(mid(s_chaine_lu, i, 1)) = 29 then 
//			//messagebox("bingo", "trouvé 29")
//			s_chaine_finale = right(s_chaine_lu, len(s_chaine_lu) - i) + left(s_chaine_lu, i)
//			//messagebox("chaine_finale", s_chaine_finale)
//			Trace ("    - Chaine lue - modifiée car présente Char(29) en pos " + string(i) + " : " + s_chaine_finale)
//			fin = true
//		end if
//		i = i + 1
//	loop
//	
//	if not fin then
//		// pas de char(29)
//		s_chaine_finale = s_chaine_lu
//		Trace ("    - Chaine lue - pas de Char(29) : " + s_chaine_finale)
//	end if
//	

	s_chaine_finale = s_chaine_lu

	cb_lancer.triggerevent(clicked!)
	
end if

end event

event close;call super::close;trace("- Close w_UDI_lecture")
end event

type p_fond from w_fenetre_arakis`p_fond within w_udi_lecture
integer x = 617
integer y = 728
end type

type cb_annuler from uo_picturebutton_390x120_fermer within w_udi_lecture
integer x = 297
integer y = 368
integer width = 489
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;//v_udi sera null
CloseWithReturn(parent, v_udi)

end event

type sle_gs1 from singlelineedit within w_udi_lecture
integer x = 18
integer y = 596
integer width = 1335
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
boolean border = false
end type

type cb_lancer from commandbutton within w_udi_lecture
integer x = 384
integer y = 884
integer width = 288
integer height = 120
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Lancer"
boolean default = true
end type

event clicked;// lancement WB qui va bien + mise à jour de la variables d'instance v_udi
 // en utilisant sle_gs1 pour la saisie

string v_gs1_lu
string v_action
integer li_rc
Inet iinet_base
string url_wb, url_myo
n_inetresult in_irdata
integer v_fichier_retour

// pour les tests .... 
//sle_gs1.text = "014003507701310917200831103988867"
//------------------------------------------------------------------------------------------------------------


Trace ("--- DEBUT LECTURE CODE UDI ---")
//
////v_gs1_lu = trim(sle_gs1.text)
//dw_udi.accepttext()
//v_gs1_lu = dw_udi.getitemstring(1, "saisie")
//
//v_gs1_lu = dw_udi.getitemstring(1, "compute_1")

v_gs1_lu = s_chaine_finale

Trace ("    - Chaine Finale : " + v_gs1_lu)

// Char(29) est une fain de groupe et doit se situer à la fin si présent, pas au milieu
v_gs1_lu = gfx_tout_remplacer(v_gs1_lu, char(29),"%1D") 

Trace ("    - Elimination des caractères parasites : " + v_gs1_lu)
//v_gs1_lu = que_chiffres_ou_lettres(v_gs1_lu)



//if pos(v_gs1_lu , char(29)) > 0 then
//	if pos(v_gs1_lu , char(29)) < len(v_gs1_lu) then
//		// il est avant, on place à la fin - en vidde + on ajoute
//		v_gs1_lu = gfx_tout_remplacer(v_gs1_lu, char(29),"")  + "%1D"
//	else
//		// il est à la fin : ok, on remples
//		v_gs1_lu = gfx_tout_remplacer(v_gs1_lu, char(29),"%1D") 
//	end if
//end if



// On enlève les ( et les )
v_gs1_lu = gfx_tout_remplacer(v_gs1_lu, "(","") 
v_gs1_lu = gfx_tout_remplacer(v_gs1_lu, ")","") 

v_action = "action?type=ParseBarcode&barcode=" + v_gs1_lu + "&format=ini"

GetContextService("Internet", iinet_base)
in_irdata = CREATE n_inetresult

//open(w_patience)

// Retour XML
constant string nom_fichier_recu = "wb.xml"

// myo ?
select top 1 url_my_orthokis into :url_myo from param ;


// effacement du fichier du dernier appel
FileDelete(dir_ini + nom_fichier_recu)

// Lancement du webservice qui va bien
url_wb = url_myo + "myorthokis/" +  v_action
li_rc = iinet_base.GetURL(url_wb, in_irdata)

trace("- Lancement de myOthokis : " + url_wb )

trace("- Retour : " + string(li_rc))


if li_rc = 1 then
	
	in_irdata.of_WriteFile(dir_ini + nom_fichier_recu, in_irdata.iblob_data)
	
end if

if not FileExists(dir_ini + nom_fichier_recu) then
	
	Messagebox("ATTENTION","Erreur de communication avec myOrthokis.~n~nMerci de contacter l'administrateur du réseau.~n~nCauses probables : ~n- l'URL de myorthokis est mal indiquée dans les Paramètres Généraux~n- les services Apache sont arrétés")
	
else
	
	// Analyse code erreur ...
	
	
	
	// Affichage des infos en retour
	if ProfileString(dir_ini + nom_fichier_recu,"0", "CodeErreur", "") <> "0" then
		MessageBox("ERREUR DE DECODAGE UDI", "Erreur N° : " +  ProfileString(dir_ini + nom_fichier_recu,"0", "CodeErreur", "")  +&
		"~n~Message : " +  ProfileString(dir_ini + nom_fichier_recu,"0", "LibelleErreur", ""))
		
	else
		// Pas d'erreur 
		 
		v_udi.di =  ProfileString(dir_ini + nom_fichier_recu,"0", "GTIN", "")
		v_udi.date_peremption = date( ProfileString(dir_ini + nom_fichier_recu,"0", "EXPIRATION_DATE", ""))
		v_udi.date_fabrication = date( ProfileString(dir_ini + nom_fichier_recu,"0", "PROD_DATE", ""))
		v_udi.numero_lot = ProfileString(dir_ini + nom_fichier_recu,"0", "LOT", "")
		
		
		Trace ("    - Décodage du code : "  )
		Trace ("           . Code : " + ProfileString(dir_ini + nom_fichier_recu,"0", "GTIN", "") )
		Trace ("           . date_peremption : " + ProfileString(dir_ini + nom_fichier_recu,"0", "EXPIRATION_DATE", "") )
		Trace ("           . date_fabrication : " + ProfileString(dir_ini + nom_fichier_recu,"0", "PROD_DATE", "") )
		Trace ("           . numero_lot : " + ProfileString(dir_ini + nom_fichier_recu,"0", "LOT", "") )
			
	end if
end if

Trace ("--- FIN LECTURE CODE UDI ---")


CloseWithReturn(parent, v_udi)









//// lancement WB qui va bien + mise à jour de la variables d'instance v_udi
// // en utilisant sle_gs1 pour la saisie
//
//string v_gs1_lu
//string v_action
//integer li_rc
//Inet iinet_base
//string url_wb, url_myo
//n_inetresult in_irdata
//integer v_fichier_retour
//
//// pour les tests .... 
////sle_gs1.text = "014003507701310917200831103988867"
////------------------------------------------------------------------------------------------------------------
//
//
//Trace ("--- DEBUT LECTURE CODE UDI ---")
//
//v_gs1_lu = trim(sle_gs1.text)
//
//Trace ("    - Lecture directe : " + v_gs1_lu)
//
//
////v_gs1_lu = que_chiffres_ou_lettres(v_gs1_lu)
////Trace ("    - Elimination des caractères parasites : " + v_gs1_lu)
//
//
//// Char(29) est une fain de groupe et doit se situer à la fin si présent, pas au milieu
//if pos(v_gs1_lu , char(29)) > 0 then
//	if pos(v_gs1_lu , char(29)) < len(v_gs1_lu) then
//		// il est avant, on place à la fin - en vidde + on ajoute
//		v_gs1_lu = gfx_tout_remplacer(v_gs1_lu, char(29),"")  + "%1D"
//	else
//		// il est à la fin : ok, on remples
//		v_gs1_lu = gfx_tout_remplacer(v_gs1_lu, char(29),"%1D") 
//	end if
//end if
//
//
//// On enlève les ( et les )
//v_gs1_lu = gfx_tout_remplacer(v_gs1_lu, "(","") 
//v_gs1_lu = gfx_tout_remplacer(v_gs1_lu, ")","") 
//
//v_action = "action?type=ParseBarcode&barcode=" + v_gs1_lu + "&format=ini"
//
//GetContextService("Internet", iinet_base)
//in_irdata = CREATE n_inetresult
//
////open(w_patience)
//
//// Retour XML
//constant string nom_fichier_recu = "wb.xml"
//
//// myo ?
//select top 1 url_my_orthokis into :url_myo from param ;
//
//
//// effacement du fichier du dernier appel
//FileDelete(dir_ini + nom_fichier_recu)
//
//// Lancement du webservice qui va bien
//url_wb = url_myo + "myorthokis/" +  v_action
//li_rc = iinet_base.GetURL(url_wb, in_irdata)
//
//if li_rc = 1 then
//	
//	in_irdata.of_WriteFile(dir_ini + nom_fichier_recu, in_irdata.iblob_data)
//	
//end if
//
//if not FileExists(dir_ini + nom_fichier_recu) then
//	
//	Messagebox("ATTENTION","Erreur de communication avec myOrthokis.~n~nMerci de contacter l'administrateur du réseau.~n~nCauses probables : ~n- l'URL de myorthokis est mal indiquée dans les Paramètres Généraux~n- les services Apache sont arrétés")
//	
//else
//	
//	// Analyse code erreur ...
//	
//	
//	
//	// Affichage des infos en retour
//	if ProfileString(dir_ini + nom_fichier_recu,"0", "CodeErreur", "") <> "0" then
//		MessageBox("ERREUR DE DECODAGE UDI", "Erreur N° : " +  ProfileString(dir_ini + nom_fichier_recu,"0", "CodeErreur", "")  +&
//		"~n~Message : " +  ProfileString(dir_ini + nom_fichier_recu,"0", "LibelleErreur", ""))
//		
//	else
//		// Pas d'erreur 
//		 
//		v_udi.di =  ProfileString(dir_ini + nom_fichier_recu,"0", "GTIN", "")
//		v_udi.date_peremption = date( ProfileString(dir_ini + nom_fichier_recu,"0", "EXPIRATION_DATE", ""))
//		v_udi.date_fabrication = date( ProfileString(dir_ini + nom_fichier_recu,"0", "PROD_DATE", ""))
//		v_udi.numero_lot = ProfileString(dir_ini + nom_fichier_recu,"0", "LOT", "")
//		
//		
//		Trace ("    - Décodage du code : "  )
//		Trace ("           . Code : " + ProfileString(dir_ini + nom_fichier_recu,"0", "GTIN", "") )
//		Trace ("           . date_peremption : " + ProfileString(dir_ini + nom_fichier_recu,"0", "EXPIRATION_DATE", "") )
//		Trace ("           . date_fabrication : " + ProfileString(dir_ini + nom_fichier_recu,"0", "PROD_DATE", "") )
//		Trace ("           . numero_lot : " + ProfileString(dir_ini + nom_fichier_recu,"0", "LOT", "") )
//			
//	end if
//end if
//
//Trace ("--- FIN LECTURE CODE UDI ---")
//
//
//CloseWithReturn(parent, v_udi)
//
//
end event

type p_1 from picture within w_udi_lecture
integer x = 960
integer y = 88
integer width = 165
integer height = 136
boolean bringtotop = true
string picturename = "lc_gs1.png"
boolean focusrectangle = false
end type

type st_1 from statictext within w_udi_lecture
integer y = 12
integer width = 946
integer height = 292
boolean bringtotop = true
integer textsize = -14
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Tahoma"
long backcolor = 553648127
boolean enabled = false
string text = "Veuillez scanner le code barre UDI du produit"
alignment alignment = center!
boolean focusrectangle = false
end type

type uo_udi from u_scintilla within w_udi_lecture
integer x = 82
integer y = 1068
integer width = 987
integer height = 292
integer taborder = 40
boolean bringtotop = true
end type

