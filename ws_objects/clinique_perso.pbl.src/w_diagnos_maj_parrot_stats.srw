$PBExportHeader$w_diagnos_maj_parrot_stats.srw
forward
global type w_diagnos_maj_parrot_stats from Window
end type
type st_2 from statictext within w_diagnos_maj_parrot_stats
end type
type st_1 from statictext within w_diagnos_maj_parrot_stats
end type
type cb_autre from commandbutton within w_diagnos_maj_parrot_stats
end type
type cb_fermer from commandbutton within w_diagnos_maj_parrot_stats
end type
type cb_annuler from commandbutton within w_diagnos_maj_parrot_stats
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_parrot_stats
end type
type dw_stats from datawindow within w_diagnos_maj_parrot_stats
end type
end forward

global type w_diagnos_maj_parrot_stats from Window
int X=673
int Y=269
int Width=1975
int Height=1409
boolean TitleBar=true
string Title="Untitled"
long BackColor=8421504
boolean ControlMenu=true
WindowType WindowType=response!
st_2 st_2
st_1 st_1
cb_autre cb_autre
cb_fermer cb_fermer
cb_annuler cb_annuler
cb_enregistrer cb_enregistrer
dw_stats dw_stats
end type
global w_diagnos_maj_parrot_stats w_diagnos_maj_parrot_stats

type variables
double var_code_local
string var_nom_local

end variables

event open;var_code_local = var_code
var_nom_local = var_nom

this.title = "Code Statistiques : "+var_nom_local+" ("+string(var_code_local)+")"

double tot
string vide

vide = space(2000)

tot = 0
SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

if not (tot > 0) then

  	INSERT INTO "dba"."diagnos"  
         ( "code", "perso" )  
	  VALUES ( :var_code_local, :vide )  ;

		IF	Sqlca.Sqlcode = 0 then
			MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
		else
			MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
			close(this)
		end if
end if

dw_stats.settransobject(sqlca)
dw_stats.retrieve(var_code_local)

end event

on w_diagnos_maj_parrot_stats.create
this.st_2=create st_2
this.st_1=create st_1
this.cb_autre=create cb_autre
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.cb_enregistrer=create cb_enregistrer
this.dw_stats=create dw_stats
this.Control[]={ this.st_2,&
this.st_1,&
this.cb_autre,&
this.cb_fermer,&
this.cb_annuler,&
this.cb_enregistrer,&
this.dw_stats}
end on

on w_diagnos_maj_parrot_stats.destroy
destroy(this.st_2)
destroy(this.st_1)
destroy(this.cb_autre)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.cb_enregistrer)
destroy(this.dw_stats)
end on

type st_2 from statictext within w_diagnos_maj_parrot_stats
int X=641
int Y=45
int Width=453
int Height=97
boolean Enabled=false
string Text="RUBRIQUES"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=8421504
int TextSize=-12
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type st_1 from statictext within w_diagnos_maj_parrot_stats
int X=161
int Y=1085
int Width=1518
int Height=77
boolean Enabled=false
string Text="N'utilisez pas de '/' à l'intérieur des codes"
Alignment Alignment=Center!
boolean FocusRectangle=false
long TextColor=33554432
long BackColor=8421504
int TextSize=-10
int Weight=700
string FaceName="Arial"
boolean Italic=true
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_autre from commandbutton within w_diagnos_maj_parrot_stats
event clicked pbm_bnclicked
int X=106
int Y=1177
int Width=385
int Height=109
int TabOrder=21
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

	parent.title = "Code Statistiques : "+var_nom_local+" ("+string(var_code_local)+")"

	double tot
	string vide

	vide = space(2000)

	tot = 0
	SELECT count(*) INTO :tot FROM diagnos WHERE code = :var_code_local ;

	if not (tot > 0) then

	  	INSERT INTO "dba"."diagnos"  
         ( "code", "perso" )  
	  VALUES ( :var_code_local, :vide )  ;

		IF	Sqlca.Sqlcode = 0 then
			MessageBox("INFORMATION","Le dossier vient d'être ouvert !")
		else
			MessageBox("ATTENTION !","Erreur dans l'ouverture du dossier !")
			close(PARENT)
		end if
	end if

dw_stats.retrieve(var_code_local)

end if
end event

type cb_fermer from commandbutton within w_diagnos_maj_parrot_stats
event clicked pbm_bnclicked
int X=1463
int Y=1173
int Width=385
int Height=109
int TabOrder=30
string Text="&Fermer"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_stats.accepttext()
if dw_stats.modifiedcount() > 0 or dw_stats.deletedcount()>0 Then
	If MessageBox("ATTENTION","Vous avez fait des modifications sur le fichier !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_annuler from commandbutton within w_diagnos_maj_parrot_stats
event clicked pbm_bnclicked
int X=659
int Y=1173
int Width=385
int Height=109
int TabOrder=10
string Text="A&nnuler"
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_stats.retrieve(var_code_local)
end event

type cb_enregistrer from commandbutton within w_diagnos_maj_parrot_stats
event clicked pbm_bnclicked
int X=1061
int Y=1173
int Width=385
int Height=109
int TabOrder=40
string Text="&Enregistrer"
boolean Default=true
int TextSize=-10
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;dw_stats.accepttext()
if dw_stats.update() = 1 then
	commit ;
else
	Rollback ;
end if

end event

type dw_stats from datawindow within w_diagnos_maj_parrot_stats
int X=311
int Y=161
int Width=1134
int Height=901
int TabOrder=20
string DataObject="dw_parrot_maj_stats"
BorderStyle BorderStyle=StyleRaised!
boolean LiveScroll=true
end type

