$PBExportHeader$w_courriers_word_proprietes.srw
forward
global type w_courriers_word_proprietes from w_fenetre_arakis
end type
type pb_2 from uo_picturebutton_390x120 within w_courriers_word_proprietes
end type
type pb_annuler from uo_picturebutton_390x120 within w_courriers_word_proprietes
end type
type dw_fiche from datawindow within w_courriers_word_proprietes
end type
type pb_fermer from uo_picturebutton_390x120 within w_courriers_word_proprietes
end type
type ddlb_imprimantes from uo_liste_imprimantes within w_courriers_word_proprietes
end type
type rb_oui from radiobutton within w_courriers_word_proprietes
end type
type rb_non from radiobutton within w_courriers_word_proprietes
end type
type gb_locaux from groupbox within w_courriers_word_proprietes
end type
end forward

global type w_courriers_word_proprietes from w_fenetre_arakis
integer width = 3374
integer height = 1908
string title = "Propriétés du Document"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_2 pb_2
pb_annuler pb_annuler
dw_fiche dw_fiche
pb_fermer pb_fermer
ddlb_imprimantes ddlb_imprimantes
rb_oui rb_oui
rb_non rb_non
gb_locaux gb_locaux
end type
global w_courriers_word_proprietes w_courriers_word_proprietes

type variables

double v_id_document 
string v_poste


//string v_ancien_nom = ""

string v_imprimante_par_defaut, v_imprimante 
end variables

forward prototypes
public subroutine get_infos ()
end prototypes

public subroutine get_infos ();

dw_fiche.retrieve(v_id_document, dir_courriers)

double id_trouve 
select isnull(id_courrier, 0) , isnull(imprimante_par_defaut, 'O'), isnull(imprimante,'') 
into :id_trouve, :v_imprimante_par_defaut, :v_imprimante  from courriers_word_imprimantes 
where id_courrier = :v_id_document and nom_poste = :v_poste  ;

// pas d'élément dans la table .. on ajoute ...
if id_trouve = 0 then
	v_imprimante_par_defaut = "O"
	v_imprimante = ""
	insert into courriers_word_imprimantes  ( "id_courrier" , "imprimante_par_defaut", "imprimante", "nom_poste") 
	values (:v_id_document, :v_imprimante_par_defaut, :v_imprimante, :v_poste) ;
	commit ;
end if


// imprimante 
if ddlb_imprimantes.setImprimanteCourante( v_imprimante )   <= 0 then
	// l'imprimante n'est pas / plus dans la liste => imprimante par défaut
	ddlb_imprimantes.SetImprimanteCourante(ddlb_imprimantes.getimprimanteDefaut())
end if

if v_imprimante_par_defaut = "O" then 
	rb_oui.checked = true
	rb_non.checked = false
	ddlb_imprimantes.visible = false
else
	rb_oui.checked = false
	rb_non.checked = true
	ddlb_imprimantes.visible = true
end if

end subroutine

on w_courriers_word_proprietes.create
int iCurrent
call super::create
this.pb_2=create pb_2
this.pb_annuler=create pb_annuler
this.dw_fiche=create dw_fiche
this.pb_fermer=create pb_fermer
this.ddlb_imprimantes=create ddlb_imprimantes
this.rb_oui=create rb_oui
this.rb_non=create rb_non
this.gb_locaux=create gb_locaux
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_2
this.Control[iCurrent+2]=this.pb_annuler
this.Control[iCurrent+3]=this.dw_fiche
this.Control[iCurrent+4]=this.pb_fermer
this.Control[iCurrent+5]=this.ddlb_imprimantes
this.Control[iCurrent+6]=this.rb_oui
this.Control[iCurrent+7]=this.rb_non
this.Control[iCurrent+8]=this.gb_locaux
end on

on w_courriers_word_proprietes.destroy
call super::destroy
destroy(this.pb_2)
destroy(this.pb_annuler)
destroy(this.dw_fiche)
destroy(this.pb_fermer)
destroy(this.ddlb_imprimantes)
destroy(this.rb_oui)
destroy(this.rb_non)
destroy(this.gb_locaux)
end on

event open;call super::open;

v_id_document = message.DoubleParm 

dw_fiche.settransobject(sqlca)



colore_datawindow(dw_fiche)
gb_locaux.backcolor = couleur_fond_fenetre 
rb_oui.backcolor = couleur_fond_fenetre 
rb_non.backcolor = couleur_fond_fenetre 

v_poste = fxg_get_infos_sybase('MachineName')


get_infos()
end event

type p_fond from w_fenetre_arakis`p_fond within w_courriers_word_proprietes
end type

type pb_2 from uo_picturebutton_390x120 within w_courriers_word_proprietes
integer x = 1449
integer y = 1568
integer width = 526
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Enregistrer"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;// Pas d'espace dans le nom du document
dw_fiche.accepttext()
dw_fiche.SetItem(1, "nom_document", trim(dw_fiche.GetItemString(1 , "nom_document")) )


if dw_fiche.update() = 1 then
	
	commit ;
	
	// imprimante 
			
	if rb_oui.checked then
		v_imprimante_par_defaut = "O"
	else
		v_imprimante_par_defaut = "N"
	end if
	v_imprimante = ddlb_imprimantes.text

	update courriers_word_imprimantes  set imprimante_par_defaut = :v_imprimante_par_defaut , imprimante = :v_imprimante 
	where  "id_courrier"  = :v_id_document and nom_poste = :v_poste ;
	commit ;

	
else
	Messagebox("ATTENTION !", "Erreur dans l'enregistrement !+~n~n" + sqlca.sqlerrtext)
	Rollback ;
end if

end event

type pb_annuler from uo_picturebutton_390x120 within w_courriers_word_proprietes
integer x = 878
integer y = 1568
integer width = 526
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_annuler.png"
end type

event clicked;call super::clicked;
get_infos()

end event

type dw_fiche from datawindow within w_courriers_word_proprietes
string tag = "brush"
integer x = 27
integer y = 36
integer width = 3301
integer height = 976
integer taborder = 10
boolean bringtotop = true
string title = "none"
string dataobject = "dw_courriers_word_proprietes"
boolean livescroll = true
end type

event retrieveend;

//if rowcount > 0 then
//	v_ancien_nom = getiTemString(getrow(), "nom_document")
//end if
end event

event dberror;db_erreur(dw_fiche ,sqldbcode,sqlerrtext)
return 1
end event

event itemchanged;

// si on vire la mémo, on vire la copie PDF automatique

if dwo.name = "memorisation" then
	if GetItemString(row, "memorisation") = "O" then		// du coup faut tester l'inverse !
		if GetItemString(row, "copie_pdf") = "O" then
			Messagebox("ATTENTION", "Vous venez de désactiver la mémorisation.~n~nLa copie PDF pour publication sera donc désactivée !")
			SetItem(row, "copie_pdf", "N") 
		end if
	end if
else
	if dwo.name = "copie_pdf" then
		if GetItemString(row, "copie_pdf") = "N" then		// du coup faut tester l'inverse !
			if GetItemString(row, "memorisation") = "N" then
				Messagebox("ATTENTION", "Vous venez d'activer la copie PDF pour duplication.~n~nLa mémorisation est donc activée !")
				SetItem(row, "copie_pdf", "O") 
			end if
		end if
	end if
end if
end event

type pb_fermer from uo_picturebutton_390x120 within w_courriers_word_proprietes
integer x = 2021
integer y = 1568
integer width = 526
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Fermer"
string iconname = "ACTIONS_fermer.png"
end type

event clicked;call super::clicked;dw_fiche.accepttext()

if dw_fiche.modifiedcount() > 0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur les informations !~n~nVoulez-vous vraiment fermer cette fenêtre sans enregistrer (et ainsi perdre les modifications) ?",Question!,YesNo!, 2) = 1 Then
		Close(parent)
	end if
else
	Close(parent)
end if
	
end event

type ddlb_imprimantes from uo_liste_imprimantes within w_courriers_word_proprietes
integer x = 1230
integer y = 1288
integer taborder = 20
boolean bringtotop = true
end type

type rb_oui from radiobutton within w_courriers_word_proprietes
integer x = 270
integer y = 1188
integer width = 1193
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
string text = "Utiliser l~'imprimante par défaut (Windows)"
boolean checked = true
end type

event clicked;
if checked then 
	ddlb_imprimantes.visible = false
else
	ddlb_imprimantes.visible = true
end if
end event

type rb_non from radiobutton within w_courriers_word_proprietes
integer x = 270
integer y = 1288
integer width = 928
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
string text = "Utiliser l~'imprimante spécifique "
end type

event clicked;if checked then 
	ddlb_imprimantes.visible = true
else
	ddlb_imprimantes.visible = false
end if
end event

type gb_locaux from groupbox within w_courriers_word_proprietes
integer x = 69
integer y = 1060
integer width = 3154
integer height = 400
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean italic = true
long textcolor = 33554432
long backcolor = 67108864
string text = "Paramètres locaux (propres au poste)"
end type

