$PBExportHeader$w_diagnos_maj_bany3.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_bany3 from Window
end type
type cb_imprimer from commandbutton within w_diagnos_maj_bany3
end type
type dw_diag from datawindow within w_diagnos_maj_bany3
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_bany3
end type
type cb_annuler from commandbutton within w_diagnos_maj_bany3
end type
type cb_fermer from commandbutton within w_diagnos_maj_bany3
end type
end forward

global type w_diagnos_maj_bany3 from Window
int X=28
int Y=109
int Width=2867
int Height=1701
boolean TitleBar=true
string Title="Page N°3"
long BackColor=12632256
boolean ControlMenu=true
WindowType WindowType=response!
cb_imprimer cb_imprimer
dw_diag dw_diag
cb_enregistrer cb_enregistrer
cb_annuler cb_annuler
cb_fermer cb_fermer
end type
global w_diagnos_maj_bany3 w_diagnos_maj_bany3

type variables
double var_code_local 
end variables

on open;string sel,rc

var_code_local = var_code

dw_diag.settransobject(SQLCA)
dw_diag.retrieve(var_code_local)

end on

on w_diagnos_maj_bany3.create
this.cb_imprimer=create cb_imprimer
this.dw_diag=create dw_diag
this.cb_enregistrer=create cb_enregistrer
this.cb_annuler=create cb_annuler
this.cb_fermer=create cb_fermer
this.Control[]={ this.cb_imprimer,&
this.dw_diag,&
this.cb_enregistrer,&
this.cb_annuler,&
this.cb_fermer}
end on

on w_diagnos_maj_bany3.destroy
destroy(this.cb_imprimer)
destroy(this.dw_diag)
destroy(this.cb_enregistrer)
destroy(this.cb_annuler)
destroy(this.cb_fermer)
end on

type cb_imprimer from commandbutton within w_diagnos_maj_bany3
event clicked pbm_bnclicked
int X=1034
int Y=1445
int Width=385
int Height=109
int TabOrder=31
string Text="&Imprimer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;long Job

Job = PrintOpen( )
PrintScreen(Job, 500,1000)
PrintClose(Job)
end event

type dw_diag from datawindow within w_diagnos_maj_bany3
int X=19
int Y=17
int Width=2835
int Height=1349
int TabOrder=10
string DataObject="dw_diagnos_2"
BorderStyle BorderStyle=StyleLowered!
boolean LiveScroll=true
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_bany3
int X=1939
int Y=1445
int Width=385
int Height=109
int TabOrder=30
string Text="&Enregistrer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;if dw_diag.update() = 1 then
	commit ;
else
	Rollback ;
end if

end on

type cb_annuler from commandbutton within w_diagnos_maj_bany3
int X=1537
int Y=1445
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

on clicked;dw_diag.retrieve(var_code_local) ;

end on

type cb_fermer from commandbutton within w_diagnos_maj_bany3
int X=2341
int Y=1445
int Width=385
int Height=109
int TabOrder=40
string Text="&Fermer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;if dw_diag.modifiedcount() > 0 then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end on

