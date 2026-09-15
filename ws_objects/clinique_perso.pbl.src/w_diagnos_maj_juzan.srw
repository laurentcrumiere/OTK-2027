$PBExportHeader$w_diagnos_maj_juzan.srw
$PBExportComments$gearbox
forward
global type w_diagnos_maj_juzan from Window
end type
type cb_page3 from commandbutton within w_diagnos_maj_juzan
end type
type cb_autre from commandbutton within w_diagnos_maj_juzan
end type
type cb_page2 from commandbutton within w_diagnos_maj_juzan
end type
type cb_page1 from commandbutton within w_diagnos_maj_juzan
end type
type cb_fermer from commandbutton within w_diagnos_maj_juzan
end type
end forward

global type w_diagnos_maj_juzan from Window
int X=426
int Y=833
int Width=2213
int Height=237
boolean TitleBar=true
string Title="Pages Diagnostiques"
long BackColor=12632256
WindowType WindowType=response!
cb_page3 cb_page3
cb_autre cb_autre
cb_page2 cb_page2
cb_page1 cb_page1
cb_fermer cb_fermer
end type
global w_diagnos_maj_juzan w_diagnos_maj_juzan

type variables
double var_code_local 
string var_nom_local
end variables

event open;var_code_local = var_code
var_nom_local = var_nom

this.title = "Pages Cliniques : "+var_nom_local+" ("+string(var_code_local)+")"

double tot
string vide

vide = space(2000)

tot = 0
SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

if not (tot > 0) then

  	INSERT INTO "dba"."diagnos"  
         ( "code", "perso" )  
	  VALUES ( :var_code_local, :vide )  ;

		IF	Sqlca.Sqlcode <> 0 then
//			MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
			commit ;
		else
			MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
			close(this)
		end if
end if

end event

on w_diagnos_maj_juzan.create
this.cb_page3=create cb_page3
this.cb_autre=create cb_autre
this.cb_page2=create cb_page2
this.cb_page1=create cb_page1
this.cb_fermer=create cb_fermer
this.Control[]={ this.cb_page3,&
this.cb_autre,&
this.cb_page2,&
this.cb_page1,&
this.cb_fermer}
end on

on w_diagnos_maj_juzan.destroy
destroy(this.cb_page3)
destroy(this.cb_autre)
destroy(this.cb_page2)
destroy(this.cb_page1)
destroy(this.cb_fermer)
end on

type cb_page3 from commandbutton within w_diagnos_maj_juzan
int X=851
int Y=21
int Width=385
int Height=109
int TabOrder=40
string Text="Page &3"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;openwithparm(w_diagnos_maj_juzan3,var_code_local)
end event

type cb_autre from commandbutton within w_diagnos_maj_juzan
int X=1372
int Y=21
int Width=385
int Height=109
int TabOrder=30
string Text="A&utre"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;var_suite = false
open(w_cherche)

if var_suite then

	var_code_local = var_code
	var_nom_local = var_nom

	parent.title = "Pages Diagnostiques : "+var_nom_local+" ("+string(var_code_local)+")"

	double tot
	string vide

	vide = space(2000)

	tot = 0
	SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

	if not (tot > 0) then

	  	INSERT INTO "dba"."diagnos"  
         ( "code", "perso" )  
	  VALUES ( :var_code_local, :vide )  ;

		IF	Sqlca.Sqlcode <> 0 then
//			MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
			commit ;
		else
			MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
			close(PARENT)
		end if
	end if



end if
end event

type cb_page2 from commandbutton within w_diagnos_maj_juzan
int X=439
int Y=21
int Width=385
int Height=109
int TabOrder=20
string Text="Page &2"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;openwithparm(w_diagnos_maj_juzan2,var_code_local)
end event

type cb_page1 from commandbutton within w_diagnos_maj_juzan
int X=28
int Y=21
int Width=385
int Height=109
int TabOrder=10
string Text="Page &1"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;openwithparm(w_diagnos_maj_juzan1,var_code_local)
end event

type cb_fermer from commandbutton within w_diagnos_maj_juzan
int X=1770
int Y=21
int Width=385
int Height=109
int TabOrder=50
string Text="&Fermer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;//if dw_diag1.modifiedcount() > 0 or dw_diag2.modifiedcount() > 0 then
//	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
//	end if
//else
//	close(parent)
//end if
end on

