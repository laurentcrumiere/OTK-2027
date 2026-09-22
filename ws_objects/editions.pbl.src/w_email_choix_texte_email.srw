$PBExportHeader$w_email_choix_texte_email.srw
forward
global type w_email_choix_texte_email from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120 within w_email_choix_texte_email
end type
type cb_annuler from uo_picturebutton_390x120 within w_email_choix_texte_email
end type
type dw_liste_texte_email from datawindow within w_email_choix_texte_email
end type
type rb_toutes from radiobutton within w_email_choix_texte_email
end type
type rb_une from radiobutton within w_email_choix_texte_email
end type
type dw_categorie from datawindow within w_email_choix_texte_email
end type
type gb_categorie from groupbox within w_email_choix_texte_email
end type
end forward

global type w_email_choix_texte_email from w_fenetre_arakis
integer width = 2190
integer height = 1980
string title = "Choix d~'un texte de mail"
boolean controlmenu = false
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
cb_1 cb_1
cb_annuler cb_annuler
dw_liste_texte_email dw_liste_texte_email
rb_toutes rb_toutes
rb_une rb_une
dw_categorie dw_categorie
gb_categorie gb_categorie
end type
global w_email_choix_texte_email w_email_choix_texte_email

on w_email_choix_texte_email.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_annuler=create cb_annuler
this.dw_liste_texte_email=create dw_liste_texte_email
this.rb_toutes=create rb_toutes
this.rb_une=create rb_une
this.dw_categorie=create dw_categorie
this.gb_categorie=create gb_categorie
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.dw_liste_texte_email
this.Control[iCurrent+4]=this.rb_toutes
this.Control[iCurrent+5]=this.rb_une
this.Control[iCurrent+6]=this.dw_categorie
this.Control[iCurrent+7]=this.gb_categorie
end on

on w_email_choix_texte_email.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_annuler)
destroy(this.dw_liste_texte_email)
destroy(this.rb_toutes)
destroy(this.rb_une)
destroy(this.dw_categorie)
destroy(this.gb_categorie)
end on

event open;call super::open;long v_categorie, lig

this.y = w_email_choix_adr_pat.y
this.x = w_email_choix_adr_pat.x + this.width / 2 

dw_categorie.settransobject(sqlca)
dw_categorie.retrieve()

dw_liste_texte_email.settransobject(sqlca)

// quel les actifs
dw_liste_texte_email.setfilter("actif = 1")

// Suppression des possibilité d'édition dans la DW qui sert aussi à la mise à jour
dw_liste_texte_email.modify("ordre_trie.visible = 0")
dw_liste_texte_email.modify("id_categorie.visible = 0")
dw_liste_texte_email.Modify("Nom.Edit.DisplayOnly = Yes")
dw_liste_texte_email.Modify("Nom.tabsequence=0")
dw_liste_texte_email.modify("actif.visible = 0")
dw_liste_texte_email.retrieve()


// Sélection mémorisée
if Profilestring(inifile_orthokis , "Email", "choix_categorie_toutes", "O") = "N"  then 
	v_categorie = long(Profilestring(inifile_orthokis , "Email", "choix_categorie_une", "1"))
	
	dw_categorie.setitem(1, "id", v_categorie ) 
	rb_toutes.checked = false
	rb_une.checked = true
	dw_liste_texte_email.setfilter("id_categorie = " + string(v_categorie) )
	dw_liste_texte_email.filter()

	rb_une.postevent(clicked!)
end if

end event

event close;call super::close;

// Mémorisation de la sélection pour la proposer par défaut à la prochaine ouverture
if rb_toutes.checked then 
	setProfilestring(inifile_orthokis , "Email", "choix_categorie_toutes", "O")
	setProfilestring(inifile_orthokis , "Email", "choix_categorie_une", "")
else
	setProfilestring(inifile_orthokis , "Email", "choix_categorie_toutes", "N")
	if dw_categorie.rowcount() > 0 then 
		setProfilestring(inifile_orthokis , "Email", "choix_categorie_une", string( dw_categorie.getitemnumber(1, "id")))
	else
		setProfilestring(inifile_orthokis , "Email", "choix_categorie_une", "")
	end if
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_email_choix_texte_email
end type

type cb_1 from uo_picturebutton_390x120 within w_email_choix_texte_email
integer x = 1115
integer y = 1656
integer width = 576
integer taborder = 10
boolean bringtotop = true
string text = "Choisir"
string iconname = "ACTIONS_modifier.png"
end type

event clicked;call super::clicked;dw_liste_texte_email.triggerevent( doubleclicked!)
end event

type cb_annuler from uo_picturebutton_390x120 within w_email_choix_texte_email
integer x = 498
integer y = 1656
integer width = 576
integer taborder = 10
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;close(parent)

end event

type dw_liste_texte_email from datawindow within w_email_choix_texte_email
integer x = 347
integer y = 252
integer width = 1536
integer height = 1356
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_email_texte_liste"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event clicked;If row > 0 Then
	This.SelectRow(0,False)
	This.SelectRow(row,True)
End If

end event

event doubleclicked;


if this.rowcount() > 0 then

	double v_id
	string texte , v_objet
	integer v_categorie
	DataWindowChild dw_fille
	string v_fichier_pj
	boolean v_suite 
	
	texte = this.GetItemString(row,"texte")
	v_objet = this.GetItemString(row,"objet")
	v_categorie =  this.GetItemNumber(row, "id_categorie")
	
	if len(trim(v_objet)) > 0 then
		w_email_choix_adr_pat.sle_objet.text = v_objet
	end if

	// Catégorie par défaut
	w_email_choix_adr_pat.dw_categorie.setItem(1, "id", v_categorie )



	// on va passer par un fichier RTF
	integer  num_fichier_texte_rtf
	num_fichier_texte_rtf = FileOpen( w_email_choix_adr_pat.v_fichier_temporaire_rtf, StreamMode! , Write! , LockWrite! , replace!)
	FileWrite(num_fichier_texte_rtf, texte)
	FileClose(num_fichier_texte_rtf)


	// Insertion du nouveau
	w_email_choix_adr_pat.rte_1.selecttextall()
	w_email_choix_adr_pat.rte_1.clear()
	w_email_choix_adr_pat.rte_1.insertdocument(w_email_choix_adr_pat.v_fichier_temporaire_rtf, True, FileTypeRichText!)
	w_email_choix_adr_pat.rte_1.modified = False
	
	
	// Si pas déjà de pJ sélectionnée avant
	if not (w_email_choix_adr_pat.type_email = "I" or  w_email_choix_adr_pat.type_email = "W"  or w_email_choix_adr_pat.type_email = "O"  or  w_email_choix_adr_pat.type_email = "D"  or  w_email_choix_adr_pat.type_email = "P" )  then

		
		// Vérification si piece jointe par défaut
		v_id =  this.GetItemNumber(row, "id")
		select isnull(nom_complet_fichier_pj, '') into :v_fichier_pj 
		from email_texte_defaut where id = :v_id ;
		
		if v_fichier_pj <> "" then
			if fileExists(v_fichier_pj) then 
				// La pj existe ... 
				
				if trim(w_email_choix_adr_pat.sle_fichier_pj.text) <> "" then 
					
					if MessageBox("ATTENTION", "Une pièce jointe par défaut est associée à ce texte de mail  : ~n~n" + v_fichier_pj + "~n~nSoutaitez-vous remplacer la pièce jointe actuelle de ce mail par ce fichier ?", Question!, Yesno!, 2)  = 1 then
						v_suite = true
					else
						v_suite = false
					end if
				else
					
					v_suite = true
					
				end if
				
				if v_suite then
					w_email_choix_adr_pat.frm_output.pj[1] = v_fichier_pj
					w_email_choix_adr_pat.sle_fichier_pj.text = gfx_extraire_nom_fichier ( v_fichier_pj )
				end if
			else
				MessageBox("ATTENTION", "Une pièce jointe par défaut est associée à ce texte de mail mais le fichier est introuvable : ~n~n" + v_fichier_pj ) 
			end if
		end if
	end if

end if
close(parent)



end event

event rbuttondown;

cb_annuler.triggerevent(clicked!)
end event

type rb_toutes from radiobutton within w_email_choix_texte_email
integer x = 366
integer y = 100
integer width = 338
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Toutes"
boolean checked = true
end type

event clicked;dw_liste_texte_email.setfilter("")
dw_liste_texte_email.filter()
dw_categorie.visible = false
end event

type rb_une from radiobutton within w_email_choix_texte_email
integer x = 768
integer y = 104
integer width = 242
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Une"
end type

event clicked;dw_categorie.visible = true

end event

type dw_categorie from datawindow within w_email_choix_texte_email
boolean visible = false
integer x = 1024
integer y = 96
integer width = 933
integer height = 96
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_categorie_courrier_word_favoris_cherche"
boolean border = false
boolean livescroll = true
end type

event itemchanged;

long  v_categorie


this.accepttext()

v_categorie = this.getitemnumber(1, "id")

dw_liste_texte_email.setfilter("id_categorie = " + string(v_categorie) )
dw_liste_texte_email.filter()

end event

type gb_categorie from groupbox within w_email_choix_texte_email
integer x = 146
integer y = 28
integer width = 1911
integer height = 188
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 553648127
string text = "Catégorie"
end type

