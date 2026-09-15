$PBExportHeader$w_diagnos_maj_swartberg4.srw
$PBExportComments$GearBox
forward
global type w_diagnos_maj_swartberg4 from Window
end type
type cb_imprimer from commandbutton within w_diagnos_maj_swartberg4
end type
type mle_mob from multilineedit within w_diagnos_maj_swartberg4
end type
type rb_mob_oui from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_mob_non from radiobutton within w_diagnos_maj_swartberg4
end type
type mle_cont from multilineedit within w_diagnos_maj_swartberg4
end type
type mle_decal from multilineedit within w_diagnos_maj_swartberg4
end type
type rb_frein_sup from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_frein_hypo from radiobutton within w_diagnos_maj_swartberg4
end type
type mle_paro from multilineedit within w_diagnos_maj_swartberg4
end type
type rb_paro_rec from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_paro_paro from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_hyg_mauv from radiobutton within w_diagnos_maj_swartberg4
end type
type mle_carie from multilineedit within w_diagnos_maj_swartberg4
end type
type rb_cont_oui from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_cont_non from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_decal_oui from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_decal_ras from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_frein_hyper from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_frein_ras from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_carie_oui from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_carie_non from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_paro_ging from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_paro_ras from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_hyg_moy from radiobutton within w_diagnos_maj_swartberg4
end type
type rb_hyg_bonne from radiobutton within w_diagnos_maj_swartberg4
end type
type cb_enregistrer from commandbutton within w_diagnos_maj_swartberg4
end type
type cb_fermer from commandbutton within w_diagnos_maj_swartberg4
end type
type cb_annuler from commandbutton within w_diagnos_maj_swartberg4
end type
type gb_16 from groupbox within w_diagnos_maj_swartberg4
end type
type gb_7 from groupbox within w_diagnos_maj_swartberg4
end type
type gb_6 from groupbox within w_diagnos_maj_swartberg4
end type
type gb_5 from groupbox within w_diagnos_maj_swartberg4
end type
type gb_4 from groupbox within w_diagnos_maj_swartberg4
end type
type gb_3 from groupbox within w_diagnos_maj_swartberg4
end type
type gb_2 from groupbox within w_diagnos_maj_swartberg4
end type
type gb_9 from groupbox within w_diagnos_maj_swartberg4
end type
end forward

global type w_diagnos_maj_swartberg4 from Window
int X=5
int Y=1
int Width=2913
int Height=1969
boolean TitleBar=true
string Title="Page N°4"
long BackColor=12632256
WindowType WindowType=response!
cb_imprimer cb_imprimer
mle_mob mle_mob
rb_mob_oui rb_mob_oui
rb_mob_non rb_mob_non
mle_cont mle_cont
mle_decal mle_decal
rb_frein_sup rb_frein_sup
rb_frein_hypo rb_frein_hypo
mle_paro mle_paro
rb_paro_rec rb_paro_rec
rb_paro_paro rb_paro_paro
rb_hyg_mauv rb_hyg_mauv
mle_carie mle_carie
rb_cont_oui rb_cont_oui
rb_cont_non rb_cont_non
rb_decal_oui rb_decal_oui
rb_decal_ras rb_decal_ras
rb_frein_hyper rb_frein_hyper
rb_frein_ras rb_frein_ras
rb_carie_oui rb_carie_oui
rb_carie_non rb_carie_non
rb_paro_ging rb_paro_ging
rb_paro_ras rb_paro_ras
rb_hyg_moy rb_hyg_moy
rb_hyg_bonne rb_hyg_bonne
cb_enregistrer cb_enregistrer
cb_fermer cb_fermer
cb_annuler cb_annuler
gb_16 gb_16
gb_7 gb_7
gb_6 gb_6
gb_5 gb_5
gb_4 gb_4
gb_3 gb_3
gb_2 gb_2
gb_9 gb_9
end type
global w_diagnos_maj_swartberg4 w_diagnos_maj_swartberg4

type variables
double var_code_local 
string page
boolean modif
end variables

forward prototypes
public subroutine init ()
end prototypes

public subroutine init ();if mid(page,1534,1) = '1' OR mid(page,1534,1) = ' ' then
	rb_hyg_bonne.checked = true
else
	if mid(page,1534,1) = '2' then
		rb_hyg_moy.checked = true
	else
		rb_hyg_mauv.checked = true
	end if
end if

if mid(page,1535,1) = '1' OR mid(page,1535,1) = ' ' then
	rb_paro_ras.checked = true
else
	if mid(page,1535,1) = '2' then
		rb_paro_ging.checked = true
	else
		if mid(page,1535,1) = '3' then
			rb_paro_paro.checked = true
		else
			rb_paro_rec.checked = true
		end if
	end if
end if

if mid(page,1536,1) = '1' OR mid(page,1536,1) = ' ' then
	rb_carie_non.checked = true
else
	rb_carie_oui.checked = true
end if

if mid(page,1537,1) = '1' OR mid(page,1537,1) = ' ' then
	rb_frein_ras.checked = true
else
	if mid(page,1537,1) = '2' then
		rb_frein_hyper.checked = true
	else
		if mid(page,1537,1) = '3' then
			rb_frein_hypo.checked = true
		else
			rb_frein_sup.checked = true
		end if
	end if
end if

if mid(page,1538,1) = '1' OR mid(page,1538,1) = ' ' then
	rb_decal_ras.checked = true
else
	rb_decal_oui.checked = true
end if

if mid(page,1539,1) = '1' OR mid(page,1539,1) = ' ' then
	rb_cont_non.checked = true
else
	rb_cont_oui.checked = true
end if

if mid(page,1540,1) = '1' OR mid(page,1540,1) = ' ' then
	rb_mob_non.checked = true
else
	rb_mob_oui.checked = true
end if

mle_paro.text = Righttrim(mid(page,1541,27))
mle_carie.text = Righttrim(mid(page,1568,62))
mle_decal.text = Righttrim(mid(page,1630,62))
mle_cont.text = Righttrim(mid(page,1692,62))
mle_mob.text = Righttrim(mid(page,1754,62))

modif = false


end subroutine

event open;
var_code_local = message.doubleparm

string vn,vm 
date vd
select nom,moulage,date_naissance INTO :vn,:vm,:vd FROM patient WHERE code = :var_code_local ;
if isnull(vm) then
	vm = ""
end if


this.title = "Page N°4 : "+vn+" - N° dossier : "+string(var_code_local)+ " - Date de naissance : " + string(vd,'dd/mm/yyyy') + " (Moulage : "+vm+")"



SELECT perso INTO :page FROM diagnos WHERE code = :var_code_local ;

if isnull(page) then
	page = space(4000)
end if

if len(page) < 4000 then
	page = page + space(4000 - len(page))
end if


init()

end event

on w_diagnos_maj_swartberg4.create
this.cb_imprimer=create cb_imprimer
this.mle_mob=create mle_mob
this.rb_mob_oui=create rb_mob_oui
this.rb_mob_non=create rb_mob_non
this.mle_cont=create mle_cont
this.mle_decal=create mle_decal
this.rb_frein_sup=create rb_frein_sup
this.rb_frein_hypo=create rb_frein_hypo
this.mle_paro=create mle_paro
this.rb_paro_rec=create rb_paro_rec
this.rb_paro_paro=create rb_paro_paro
this.rb_hyg_mauv=create rb_hyg_mauv
this.mle_carie=create mle_carie
this.rb_cont_oui=create rb_cont_oui
this.rb_cont_non=create rb_cont_non
this.rb_decal_oui=create rb_decal_oui
this.rb_decal_ras=create rb_decal_ras
this.rb_frein_hyper=create rb_frein_hyper
this.rb_frein_ras=create rb_frein_ras
this.rb_carie_oui=create rb_carie_oui
this.rb_carie_non=create rb_carie_non
this.rb_paro_ging=create rb_paro_ging
this.rb_paro_ras=create rb_paro_ras
this.rb_hyg_moy=create rb_hyg_moy
this.rb_hyg_bonne=create rb_hyg_bonne
this.cb_enregistrer=create cb_enregistrer
this.cb_fermer=create cb_fermer
this.cb_annuler=create cb_annuler
this.gb_16=create gb_16
this.gb_7=create gb_7
this.gb_6=create gb_6
this.gb_5=create gb_5
this.gb_4=create gb_4
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_9=create gb_9
this.Control[]={ this.cb_imprimer,&
this.mle_mob,&
this.rb_mob_oui,&
this.rb_mob_non,&
this.mle_cont,&
this.mle_decal,&
this.rb_frein_sup,&
this.rb_frein_hypo,&
this.mle_paro,&
this.rb_paro_rec,&
this.rb_paro_paro,&
this.rb_hyg_mauv,&
this.mle_carie,&
this.rb_cont_oui,&
this.rb_cont_non,&
this.rb_decal_oui,&
this.rb_decal_ras,&
this.rb_frein_hyper,&
this.rb_frein_ras,&
this.rb_carie_oui,&
this.rb_carie_non,&
this.rb_paro_ging,&
this.rb_paro_ras,&
this.rb_hyg_moy,&
this.rb_hyg_bonne,&
this.cb_enregistrer,&
this.cb_fermer,&
this.cb_annuler,&
this.gb_16,&
this.gb_7,&
this.gb_6,&
this.gb_5,&
this.gb_4,&
this.gb_3,&
this.gb_2,&
this.gb_9}
end on

on w_diagnos_maj_swartberg4.destroy
destroy(this.cb_imprimer)
destroy(this.mle_mob)
destroy(this.rb_mob_oui)
destroy(this.rb_mob_non)
destroy(this.mle_cont)
destroy(this.mle_decal)
destroy(this.rb_frein_sup)
destroy(this.rb_frein_hypo)
destroy(this.mle_paro)
destroy(this.rb_paro_rec)
destroy(this.rb_paro_paro)
destroy(this.rb_hyg_mauv)
destroy(this.mle_carie)
destroy(this.rb_cont_oui)
destroy(this.rb_cont_non)
destroy(this.rb_decal_oui)
destroy(this.rb_decal_ras)
destroy(this.rb_frein_hyper)
destroy(this.rb_frein_ras)
destroy(this.rb_carie_oui)
destroy(this.rb_carie_non)
destroy(this.rb_paro_ging)
destroy(this.rb_paro_ras)
destroy(this.rb_hyg_moy)
destroy(this.rb_hyg_bonne)
destroy(this.cb_enregistrer)
destroy(this.cb_fermer)
destroy(this.cb_annuler)
destroy(this.gb_16)
destroy(this.gb_7)
destroy(this.gb_6)
destroy(this.gb_5)
destroy(this.gb_4)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_9)
end on

type cb_imprimer from commandbutton within w_diagnos_maj_swartberg4
event clicked pbm_bnclicked
int X=1418
int Y=1573
int Width=339
int Height=97
int TabOrder=151
string Text="&Imprimer"
int TextSize=-8
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

type mle_mob from multilineedit within w_diagnos_maj_swartberg4
int X=1084
int Y=1053
int Width=1751
int Height=85
int TabOrder=130
BorderStyle BorderStyle=StyleLowered!
int Limit=62
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;modif = true
end event

type rb_mob_oui from radiobutton within w_diagnos_maj_swartberg4
int X=485
int Y=1069
int Width=165
int Height=73
string Text="oui"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_mob_non from radiobutton within w_diagnos_maj_swartberg4
int X=206
int Y=1069
int Width=307
int Height=73
string Text="non"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type mle_cont from multilineedit within w_diagnos_maj_swartberg4
int X=1084
int Y=913
int Width=1751
int Height=85
int TabOrder=110
BorderStyle BorderStyle=StyleLowered!
int Limit=62
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;modif = true
end event

type mle_decal from multilineedit within w_diagnos_maj_swartberg4
int X=1084
int Y=773
int Width=1751
int Height=85
int TabOrder=90
BorderStyle BorderStyle=StyleLowered!
int Limit=62
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;modif = true
end event

type rb_frein_sup from radiobutton within w_diagnos_maj_swartberg4
int X=1258
int Y=637
int Width=247
int Height=73
string Text="sup/inf"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_frein_hypo from radiobutton within w_diagnos_maj_swartberg4
int X=865
int Y=637
int Width=353
int Height=73
string Text="hypotrophie"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type mle_paro from multilineedit within w_diagnos_maj_swartberg4
int X=2026
int Y=345
int Width=810
int Height=85
int TabOrder=40
BorderStyle BorderStyle=StyleLowered!
int Limit=27
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;modif = true
end event

type rb_paro_rec from radiobutton within w_diagnos_maj_swartberg4
int X=1258
int Y=353
int Width=321
int Height=73
string Text="récession"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_paro_paro from radiobutton within w_diagnos_maj_swartberg4
int X=865
int Y=357
int Width=330
int Height=73
string Text="parodontite"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_hyg_mauv from radiobutton within w_diagnos_maj_swartberg4
int X=865
int Y=221
int Width=311
int Height=73
string Text="mauvaise"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type mle_carie from multilineedit within w_diagnos_maj_swartberg4
int X=1084
int Y=493
int Width=1751
int Height=85
int TabOrder=60
BorderStyle BorderStyle=StyleLowered!
int Limit=62
long TextColor=33554432
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event modified;modif = true
end event

type rb_cont_oui from radiobutton within w_diagnos_maj_swartberg4
int X=485
int Y=913
int Width=165
int Height=73
string Text="oui"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_cont_non from radiobutton within w_diagnos_maj_swartberg4
int X=206
int Y=913
int Width=302
int Height=73
string Text="non"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_decal_oui from radiobutton within w_diagnos_maj_swartberg4
int X=485
int Y=777
int Width=174
int Height=73
string Text="oui"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_decal_ras from radiobutton within w_diagnos_maj_swartberg4
int X=206
int Y=781
int Width=302
int Height=73
string Text="R.A.S"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_frein_hyper from radiobutton within w_diagnos_maj_swartberg4
int X=485
int Y=637
int Width=366
int Height=73
string Text="hypertrophie"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_frein_ras from radiobutton within w_diagnos_maj_swartberg4
int X=206
int Y=637
int Width=302
int Height=73
string Text="R.A.S"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_carie_oui from radiobutton within w_diagnos_maj_swartberg4
int X=485
int Y=497
int Width=211
int Height=73
string Text="oui"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_carie_non from radiobutton within w_diagnos_maj_swartberg4
int X=206
int Y=497
int Width=302
int Height=73
string Text="non"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_paro_ging from radiobutton within w_diagnos_maj_swartberg4
int X=485
int Y=357
int Width=293
int Height=73
string Text="gingivite"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_paro_ras from radiobutton within w_diagnos_maj_swartberg4
int X=206
int Y=357
int Width=357
int Height=73
string Text="R.A.S"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_hyg_moy from radiobutton within w_diagnos_maj_swartberg4
int X=485
int Y=221
int Width=302
int Height=73
string Text="moyenne"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type rb_hyg_bonne from radiobutton within w_diagnos_maj_swartberg4
int X=206
int Y=221
int Width=270
int Height=73
string Text="bonne"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type cb_enregistrer from commandbutton within w_diagnos_maj_swartberg4
int X=2149
int Y=1573
int Width=339
int Height=97
int TabOrder=150
string Text="&Enregistrer"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if	rb_hyg_bonne.checked then
	place("1",page,1534)
else
	if	rb_hyg_moy.checked then
		place("2",page,1534)
	else	
		place("3",page,1534)
	end if	
end if

if	rb_paro_ras.checked then
	place("1",page,1535)
else
	if	rb_paro_ging.checked then
		place("2",page,1535)
	else	
		if	rb_paro_paro.checked then
			place("3",page,1535)
		else	
			place("4",page,1535)
		end if	
	end if	
end if

if	rb_carie_non.checked then
	place("1",page,1536)
else
	place("2",page,1536)
end if

if	rb_frein_ras.checked then
	place("1",page,1537)
else
	if	rb_frein_hyper.checked then
		place("2",page,1537)
	else	
		if	rb_frein_hypo.checked then
			place("3",page,1537)
		else	
			place("4",page,1537)
		end if	
	end if	
end if

if	rb_decal_ras.checked then
	place("1",page,1538)
else
	place("2",page,1538)
end if

if	rb_cont_non.checked then
	place("1",page,1539)
else
	place("2",page,1539)
end if

if	rb_mob_non.checked then
	place("1",page,1540)
else
	place("2",page,1540)
end if


place_avec_blancs(mle_paro.text,page,1541,27)
place_avec_blancs(mle_carie.text,page,1568,62)
place_avec_blancs(mle_decal.text,page,1630,62)
place_avec_blancs(mle_cont.text,page,1692,62)
place_avec_blancs(mle_mob.text,page,1754,62)



UPDATE diagnos SET perso = :page WHERE code = :var_code_local ;

if SQLCA.Sqlcode <> 0 then
	son(4)
	Messagebox("ERREUR BASE DE DONNEES (N°1)",SQLCA.SqlErrText)
else
	modif = false
	COMMIT ;
end if

end event

type cb_fermer from commandbutton within w_diagnos_maj_swartberg4
event clicked pbm_bnclicked
int X=2506
int Y=1573
int Width=339
int Height=97
int TabOrder=160
string Text="&Fermer"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

event clicked;if modif then
	If MessageBox("ATTENTION","Vous avez fait des modifications !~n~nVoulez-vous tout de même quitter~ncette fenêtre ?",Question!,YesNo!) = 1 Then
		Close(parent)
	end if
else
	close(parent)
end if
end event

type cb_annuler from commandbutton within w_diagnos_maj_swartberg4
event clicked pbm_bnclicked
int X=1783
int Y=1573
int Width=339
int Height=97
int TabOrder=140
string Text="A&nnuler"
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

on clicked;init()
end on

type gb_16 from groupbox within w_diagnos_maj_swartberg4
int X=33
int Y=1013
int Width=691
int Height=133
int TabOrder=120
string Text="Mobilité accrue"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_7 from groupbox within w_diagnos_maj_swartberg4
int X=33
int Y=865
int Width=691
int Height=129
int TabOrder=100
string Text="Contacts prématurés"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_6 from groupbox within w_diagnos_maj_swartberg4
int X=28
int Y=729
int Width=691
int Height=129
int TabOrder=80
string Text="Décalcification"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_5 from groupbox within w_diagnos_maj_swartberg4
int X=28
int Y=589
int Width=1665
int Height=129
int TabOrder=70
string Text="Frein"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_4 from groupbox within w_diagnos_maj_swartberg4
int X=28
int Y=449
int Width=691
int Height=129
int TabOrder=50
string Text="Caries"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_3 from groupbox within w_diagnos_maj_swartberg4
int X=28
int Y=309
int Width=1665
int Height=129
int TabOrder=30
string Text="Parodontal"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_2 from groupbox within w_diagnos_maj_swartberg4
int X=28
int Y=169
int Width=1399
int Height=129
int TabOrder=20
string Text="Hygiène"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=400
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

type gb_9 from groupbox within w_diagnos_maj_swartberg4
int Y=101
int Width=2858
int Height=1125
int TabOrder=10
string Text="EXAMEN INTRA-ORAL"
long TextColor=33554432
long BackColor=79741120
int TextSize=-8
int Weight=700
string FaceName="Arial"
FontFamily FontFamily=Swiss!
FontPitch FontPitch=Variable!
end type

