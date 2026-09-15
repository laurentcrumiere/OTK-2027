$PBExportHeader$w_courriers_word_favoris_duplication.srw
forward
global type w_courriers_word_favoris_duplication from w_fenetre_arakis
end type
type st_1 from statictext within w_courriers_word_favoris_duplication
end type
type dw_user from datawindow within w_courriers_word_favoris_duplication
end type
type cb_annuler from uo_picturebutton_390x120 within w_courriers_word_favoris_duplication
end type
type cb_2 from uo_picturebutton_390x120 within w_courriers_word_favoris_duplication
end type
type cbx_effacer from checkbox within w_courriers_word_favoris_duplication
end type
end forward

global type w_courriers_word_favoris_duplication from w_fenetre_arakis
integer width = 3141
integer height = 888
string title = "Duplication des Courriers Favoris"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
st_1 st_1
dw_user dw_user
cb_annuler cb_annuler
cb_2 cb_2
cbx_effacer cbx_effacer
end type
global w_courriers_word_favoris_duplication w_courriers_word_favoris_duplication

type variables
string s_code_user_destination, s_nom_user_destination
end variables

on w_courriers_word_favoris_duplication.create
int iCurrent
call super::create
this.st_1=create st_1
this.dw_user=create dw_user
this.cb_annuler=create cb_annuler
this.cb_2=create cb_2
this.cbx_effacer=create cbx_effacer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.st_1
this.Control[iCurrent+2]=this.dw_user
this.Control[iCurrent+3]=this.cb_annuler
this.Control[iCurrent+4]=this.cb_2
this.Control[iCurrent+5]=this.cbx_effacer
end on

on w_courriers_word_favoris_duplication.destroy
call super::destroy
destroy(this.st_1)
destroy(this.dw_user)
destroy(this.cb_annuler)
destroy(this.cb_2)
destroy(this.cbx_effacer)
end on

event open;call super::open;dw_user.setTransObject(sqlca)
dw_user.retrieve()


end event

type p_fond from w_fenetre_arakis`p_fond within w_courriers_word_favoris_duplication
end type

type st_1 from statictext within w_courriers_word_favoris_duplication
integer x = 338
integer y = 116
integer width = 882
integer height = 96
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 553648127
string text = "Utilisateur de destination :"
boolean focusrectangle = false
end type

type dw_user from datawindow within w_courriers_word_favoris_duplication
event test_tab pbm_dwnkey
event repositionner ( )
integer x = 1257
integer y = 124
integer width = 1184
integer height = 72
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_cherche_utilisateur"
boolean border = false
end type

type cb_annuler from uo_picturebutton_390x120 within w_courriers_word_favoris_duplication
integer x = 631
integer y = 568
integer width = 672
integer taborder = 30
boolean bringtotop = true
string text = "Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close (parent)
end event

type cb_2 from uo_picturebutton_390x120 within w_courriers_word_favoris_duplication
integer x = 1376
integer y = 568
integer width = 672
integer taborder = 40
boolean bringtotop = true
string text = "Lancer"
string iconname = "ACTIONS_executer.png"
end type

event clicked;call super::clicked;
s_code_user_destination = dw_user.gettext()
select nom into :s_nom_user_destination from utilisateurs where code = :s_code_user_destination ;

if s_code_user_destination = utilisateur_code then
	Messagebox("ATTENTION","Vous devez indiquer un utilisateur différent !")
else

	if Messagebox("ATTENTION", "Vous aller dupliquer vos courriers favoris vers l'utilisateur " +s_nom_user_destination +".~n~nConfirmez-vous ?", Question!, YesNo!, 2 ) = 1 then
		// On y va
		if cbx_effacer.checked then
			delete from courriers_word_favoris where "user" = :s_code_user_destination ;
			if sqlca.sqlcode = 0 then 
				commit ;
			else
				messagebox("ATTENTION !", "Erreur dans la suppression des courriers favoris de " + s_nom_user_destination + " !~n~n" + sqlca.sqlerrtext)
				rollback ;
			end if
		end if
		
		// On ajoute, sauf s'ils y sont déjà ;-)
		
		insert into courriers_word_favoris ("user", dossier_courrier, nom_courrier, ordre_trie, id_courrier, type_courrier, categorie) 
		(select :s_code_user_destination, dossier_courrier, nom_courrier, ordre_trie, id_courrier, type_courrier, categorie from courriers_word_favoris 
		where "user" = :utilisateur_code and id_courrier not in (select id_courrier from courriers_word_favoris where "user" = :s_code_user_destination)) ;
		
		if sqlca.sqlcode = 0 then 
			commit ;
			Messagebox("INFORMATION !","La duplication a été effectuée !")
		else
			messagebox("ATTENTION !", "Erreur dans la duplication !~n~n" + sqlca.sqlerrtext)
		end if
		close (parent)
	end if
end if
end event

type cbx_effacer from checkbox within w_courriers_word_favoris_duplication
integer x = 571
integer y = 300
integer width = 2107
integer height = 80
boolean bringtotop = true
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Effacer les favoris précédents de l~'utilisateur de destination"
end type

