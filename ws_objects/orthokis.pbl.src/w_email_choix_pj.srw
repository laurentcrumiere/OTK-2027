$PBExportHeader$w_email_choix_pj.srw
forward
global type w_email_choix_pj from w_fenetre_arakis
end type
type pb_annuler from uo_picturebutton_390x120 within w_email_choix_pj
end type
type pb_fermer from uo_picturebutton_390x120 within w_email_choix_pj
end type
type dw_liste from u_basedw within w_email_choix_pj
end type
end forward

global type w_email_choix_pj from w_fenetre_arakis
integer width = 3479
integer height = 1628
string title = "Choix de la Pièce Jointe"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_annuler pb_annuler
pb_fermer pb_fermer
dw_liste dw_liste
end type
global w_email_choix_pj w_email_choix_pj

on w_email_choix_pj.create
int iCurrent
call super::create
this.pb_annuler=create pb_annuler
this.pb_fermer=create pb_fermer
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_annuler
this.Control[iCurrent+2]=this.pb_fermer
this.Control[iCurrent+3]=this.dw_liste
end on

on w_email_choix_pj.destroy
call super::destroy
destroy(this.pb_annuler)
destroy(this.pb_fermer)
destroy(this.dw_liste)
end on

event open;call super::open;

// Le numéro de l'email est passé en pramètre => on pioche dans la dw de w_emails_entrants


double v_num_email
long lig, tot


v_num_email = Message.DoubleParm

tot = w_emails_entrants.dw_liste_pj.rowcount()

for lig = 1 to tot
	
	if w_emails_entrants.dw_liste_pj.getItemNumber(lig, "ligne") = v_num_email then
		dw_liste.InsertRow(0)
		dw_liste.SetItem(dw_liste.rowcount(), "index", dw_liste.rowcount())
		dw_liste.SetItem(dw_liste.rowcount(), "pj", w_emails_entrants.dw_liste_pj.getItemString(lig, "pj"))
	end if
	
next

if dw_liste.rowcount() > 0 then
	dw_liste.sort()
else
	Messagebox("ATTENTION","Impossible de récupérer la liste des Pièces Jointes.~n~nOpération abandonnée !")
end if


end event

type p_fond from w_fenetre_arakis`p_fond within w_email_choix_pj
end type

type pb_annuler from uo_picturebutton_390x120 within w_email_choix_pj
integer x = 1152
integer y = 1308
integer width = 411
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Annuler"
end type

event clicked;call super::clicked;

CloseWithReturn(parent, 0)
end event

type pb_fermer from uo_picturebutton_390x120 within w_email_choix_pj
integer x = 1664
integer y = 1296
integer width = 411
integer height = 152
integer taborder = 30
boolean bringtotop = true
string text = "&Fermer"
end type

event clicked;call super::clicked;CloseWithReturn(parent, dw_liste.getrow())
end event

type dw_liste from u_basedw within w_email_choix_pj
integer x = 37
integer y = 20
integer width = 3369
integer height = 1240
integer taborder = 11
boolean bringtotop = true
string dataobject = "dw_emails_pj"
end type

