$PBExportHeader$w_diagnos_maj_cabot2.srw
$PBExportComments$Gearbox
forward
global type w_diagnos_maj_cabot2 from Window
end type
type cb_imprimer from commandbutton within w_diagnos_maj_cabot2
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_cabot2
end type
type cb_annuler from commandbutton within w_diagnos_maj_cabot2
end type
type dw_diag1 from datawindow within w_diagnos_maj_cabot2
end type
type cb_fermer from commandbutton within w_diagnos_maj_cabot2
end type
end forward

global type w_diagnos_maj_cabot2 from Window
int X=1
int Y=269
int Width=3068
int Height=1517
boolean TitleBar=true
string Title="Page N°2"
long BackColor=8421504
boolean ControlMenu=true
WindowType WindowType=response!
cb_imprimer cb_imprimer
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
dw_diag1 dw_diag1
cb_fermer cb_fermer
end type
global w_diagnos_maj_cabot2 w_diagnos_maj_cabot2

type variables
double var_code_local 
string page,var_nom_local
end variables

event open;string sel,rc

var_code_local = message.doubleparm

select nom INTO :var_nom_local FROM patient WHERE code = :var_code_local ;
this.title = "Page N°2 : "+var_nom_local+" ("+string(var_code_local)+")"

dw_diag1.settransobject(SQLCA)

dw_diag1.retrieve(var_code_local)


if dw_diag1.rowcount() = 0 then
	dw_diag1.insertrow(0)
	dw_diag1.setitem(1,"code",var_code_local)

	if dw_diag1.update() = 1 then
		commit ;
		MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
	else
		MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
		Rollback ;
		close(this)
	end if
end if


SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;


dw_diag1.Modify("col1.text = '"+RightTrim(mid(page,1,100))+"'")
dw_diag1.Modify("col2.text = '"+RightTrim(mid(page,101,100))+"'")
dw_diag1.Modify("col3.text = '"+RightTrim(mid(page,201,100))+"'")
dw_diag1.Modify("col4.text = '"+RightTrim(mid(page,301,100))+"'")
dw_diag1.Modify("col5.text = '"+RightTrim(mid(page,401,100))+"'")
dw_diag1.Modify("col6.text = '"+RightTrim(mid(page,501,100))+"'")

end event

on w_diagnos_maj_cabot2.create
this.cb_imprimer=create cb_imprimer
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.dw_diag1=create dw_diag1
this.cb_fermer=create cb_fermer
this.Control[]={ this.cb_imprimer,&
this.cb_enregistrer,&
this.cb_annuler,&
this.dw_diag1,&
this.cb_fermer}
end on

on w_diagnos_maj_cabot2.destroy
destroy(this.cb_imprimer)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.dw_diag1)
destroy(this.cb_fermer)
end on

type cb_imprimer from commandbutton within w_diagnos_maj_cabot2
int X=1226
int Y=1297
int Width=385
int Height=109
int TabOrder=50
string Text="&Imprimer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;dw_diag1.print()

end on

type cb_enregistrer from commandbutton within w_diagnos_maj_cabot2
int X=2067
int Y=1297
int Width=385
int Height=109
int TabOrder=30
string Text="&Enregistrer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;if dw_diag1.update() = 1  then
	commit ;
else
	Rollback ;
end if

end on

type cb_annuler from commandbutton within w_diagnos_maj_cabot2
int X=1665
int Y=1297
int Width=385
int Height=109
int TabOrder=20
string Text="A&nnuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;dw_diag1.retrieve(var_code_local) ;

end on

type dw_diag1 from datawindow within w_diagnos_maj_cabot2
int X=19
int Y=21
int Width=2835
int Height=1249
int TabOrder=10
string DataObject="dw_diagnos_cabot2"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type cb_fermer from commandbutton within w_diagnos_maj_cabot2
int X=2469
int Y=1297
int Width=385
int Height=109
int TabOrder=40
string Text="&Fermer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;if dw_diag1.modifiedcount() > 0 then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end on

