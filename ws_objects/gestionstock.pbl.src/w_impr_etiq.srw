$PBExportHeader$w_impr_etiq.srw
forward
global type w_impr_etiq from w_fenetre_arakis
end type
type cb_imprimer from uo_picturebutton_390x120 within w_impr_etiq
end type
type cb_option from uo_picturebutton_390x120 within w_impr_etiq
end type
type cb_fermer from uo_picturebutton_390x120_fermer within w_impr_etiq
end type
type cb_valider from uo_picturebutton_390x120 within w_impr_etiq
end type
type dw_edition from datawindow within w_impr_etiq
end type
type dw_code_barre from datawindow within w_impr_etiq
end type
type em_nombre from editmask within w_impr_etiq
end type
type em_date from editmask within w_impr_etiq
end type
type dw_basic from datawindow within w_impr_etiq
end type
type em_code_barre from editmask within w_impr_etiq
end type
type st_3 from statictext within w_impr_etiq
end type
type st_2 from statictext within w_impr_etiq
end type
type st_1 from statictext within w_impr_etiq
end type
end forward

global type w_impr_etiq from w_fenetre_arakis
integer width = 1733
integer height = 1208
string title = "Impression Etiquettes"
windowtype windowtype = response!
boolean center = true
cb_imprimer cb_imprimer
cb_option cb_option
cb_fermer cb_fermer
cb_valider cb_valider
dw_edition dw_edition
dw_code_barre dw_code_barre
em_nombre em_nombre
em_date em_date
dw_basic dw_basic
em_code_barre em_code_barre
st_3 st_3
st_2 st_2
st_1 st_1
end type
global w_impr_etiq w_impr_etiq

type variables
double code_barre
string code_produit
str_format_planche struct
end variables

forward prototypes
public subroutine impression_etiquettes ()
end prototypes

public subroutine impression_etiquettes ();integer nb_ligne_commande //nombre de ligne dans la commande
integer i,j,k,l
integer ligne_courante, colonne_courante
integer quantite_courante //quantite commandee du produit traité
integer nombre_entree_par_produit
integer nombre_produit_par_entree
str_code_barre tab[]
string designation
date date_sterilisation

//initialisation du tableau des etiquettes
nombre_entree_par_produit = integer(em_nombre.text)
date_sterilisation = date(em_date.text)

  SELECT "produit"."designation"  
    INTO :designation  
    FROM "produit"  
   WHERE "produit"."code_interne" = :code_produit   ;

i = 0
FOR j = 1 to nombre_entree_par_produit
	i = i+1
	tab[i].code_barre = code_barre
	tab[i].code_produit = code_produit
	tab[i].designation = designation
	tab[i].jour = date_sterilisation
NEXT

//initialisation du remplissage de dw_format
ligne_courante = int((struct.premiere_etiquette - 1)/struct.nb_colonne) + 1
colonne_courante = struct.premiere_etiquette - (ligne_courante - 1)*struct.nb_colonne
dw_code_barre.reset()
FOR j = 1 to ligne_courante
	dw_code_barre.insertrow(0)
NEXT

//remplissage des etiquettes
FOR j = 1 to i
	dw_code_barre.setitem(ligne_courante,"code_barre"+string(colonne_courante),tab[j].code_barre)
	dw_code_barre.setitem(ligne_courante,"designation"+string(colonne_courante),tab[j].designation)
	dw_code_barre.setitem(ligne_courante,"date"+string(colonne_courante),tab[j].jour)
	dw_code_barre.setitem(ligne_courante,"code_produit"+string(colonne_courante),tab[j].code_produit)
	if colonne_courante = struct.nb_colonne then
		colonne_courante = 1
		if ligne_courante = struct.nb_ligne then
			ligne_courante = 1
			dw_code_barre.print()
			dw_code_barre.reset()
			dw_code_barre.insertrow(0)
		else
			ligne_courante = ligne_courante + 1
			dw_code_barre.insertrow(0)
		end if
	else
		colonne_courante = colonne_courante + 1
	end if
NEXT
if colonne_courante = 1 then
	dw_code_barre.deleterow(ligne_courante)
end if
dw_code_barre.print()
struct.premiere_etiquette = 1
end subroutine

on w_impr_etiq.create
int iCurrent
call super::create
this.cb_imprimer=create cb_imprimer
this.cb_option=create cb_option
this.cb_fermer=create cb_fermer
this.cb_valider=create cb_valider
this.dw_edition=create dw_edition
this.dw_code_barre=create dw_code_barre
this.em_nombre=create em_nombre
this.em_date=create em_date
this.dw_basic=create dw_basic
this.em_code_barre=create em_code_barre
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_imprimer
this.Control[iCurrent+2]=this.cb_option
this.Control[iCurrent+3]=this.cb_fermer
this.Control[iCurrent+4]=this.cb_valider
this.Control[iCurrent+5]=this.dw_edition
this.Control[iCurrent+6]=this.dw_code_barre
this.Control[iCurrent+7]=this.em_nombre
this.Control[iCurrent+8]=this.em_date
this.Control[iCurrent+9]=this.dw_basic
this.Control[iCurrent+10]=this.em_code_barre
this.Control[iCurrent+11]=this.st_3
this.Control[iCurrent+12]=this.st_2
this.Control[iCurrent+13]=this.st_1
end on

on w_impr_etiq.destroy
call super::destroy
destroy(this.cb_imprimer)
destroy(this.cb_option)
destroy(this.cb_fermer)
destroy(this.cb_valider)
destroy(this.dw_edition)
destroy(this.dw_code_barre)
destroy(this.em_nombre)
destroy(this.em_date)
destroy(this.dw_basic)
destroy(this.em_code_barre)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;call super::open;dw_basic.settransobject(sqlca)

code_barre = message.doubleparm
if isnull(code_barre) then
	em_code_barre.setfocus()
else
	em_code_barre.text = string(code_barre)
	cb_valider.postevent(clicked!)
end if

//initialisation des variables d'instances
struct.imprimante_c4 = true
struct.code = 1
struct.nb_ligne = 8
struct.nb_colonne = 3
struct.nom_dw = 'dw_format_planche'
struct.premiere_etiquette = 1


// Mise en place de l'imprimante spécifique	
dw_edition.Object.DataWindow.Print.PrinterName = get_imprimante_code_barre()
//dw_code_barre.Object.DataWindow.Print.PrinterName = get_imprimante_code_barre()

colore_datawindow(dw_basic)
em_date.backcolor = couleur_fond_fenetre

end event

type p_fond from w_fenetre_arakis`p_fond within w_impr_etiq
end type

type cb_imprimer from uo_picturebutton_390x120 within w_impr_etiq
integer x = 576
integer y = 896
integer width = 517
integer taborder = 30
string text = "&Imprimer"
string iconname = "ACTIONS_imprimer.png"
end type

event clicked;call super::clicked;integer nombre_etiquette, i
string designation
date date_sterilisation


//string nom_imprimante
//boolean is_c4
//nom_imprimante = dw_edition.Object.DataWindow.Printer
//is_c4 = match(nom_imprimante,'EasyCoder C4')
date_sterilisation = date(em_date.text)
	

	
if struct.imprimante_c4 then
	dw_edition.reset()
	dw_edition.insertrow(0)
	dw_edition.setitem(1,"code_barre",code_barre)
	dw_edition.setitem(1,"date_etiq",date_sterilisation)
	
	  SELECT "produit"."designation"  
	    INTO :designation  
	    FROM "produit"  
	   WHERE "produit"."code_interne" = :code_produit    ;

	dw_edition.setitem(1,"designation",designation)

	nombre_etiquette = integer(em_nombre.text)
	
	if profileString(dir_ini+inifile_orthokis,"Stock_Tracabilité","imprimer_lot_etiquettes","N") = "O" then
		string v_numero_lot = ''
		select isnull(numero_lot,'') into :v_numero_lot from stock_produit where code_barre = :code_barre ;
		if v_numero_lot <> "" then
			// impression du N° de lot fournisseur
			dw_edition.modify("code_barre.y = 0")
			dw_edition.modify("code_barre.height = 124")
			dw_edition.modify("numero_lot.visible = 1")
			dw_edition.setitem(1,"numero_lot",v_numero_lot)
		end if
	end if
	
	
//	if is_c4 then
		FOR i = 1 to nombre_etiquette
			dw_edition.print()
		NEXT
//	else
//		MessageBox("Attention","   Vous devez sélectionner l'imprimante à rouleau d'étiquette   ~n           dans le paramètrage des imprimantes,~n~n           ou choisir une autre imprimante~n   dans les options d'impressions d'étiquettes ci dessus")
//	end if
else
//	if is_c4 then
//		MessageBox("Attention","          Vous êtes en mode d'impression classique ~n Vous ne pouvez pas imprimer sur une imprimante à rouleau d'étiquettes ~n             Sélectionner une imprimante classique ~n          ou changer les options d'impressions ci dessus") 
//	else
		impression_etiquettes()		
//	end if
end if
end event

type cb_option from uo_picturebutton_390x120 within w_impr_etiq
integer x = 46
integer y = 896
integer width = 517
integer taborder = 80
string text = "&Opt. Impr."
end type

event clicked;call super::clicked;

printsetup()
end event

type cb_fermer from uo_picturebutton_390x120_fermer within w_impr_etiq
integer x = 1106
integer y = 896
integer width = 517
integer taborder = 80
end type

type cb_valider from uo_picturebutton_390x120 within w_impr_etiq
integer x = 1061
integer y = 36
integer width = 517
integer height = 152
integer taborder = 50
string text = "&Valider"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;code_barre = double(em_code_barre.text)

  SELECT "stock_produit"."code_produit"  
    INTO :code_produit  
    FROM "stock_produit"  
   WHERE "stock_produit"."code_barre" = :code_barre   ;

if sqlca.sqlcode = 0 then
	dw_basic.retrieve(code_produit)
	em_date.enabled = true
	em_nombre.enabled = true
	em_date.text = string(today())
	em_nombre.text = "1"
	cb_imprimer.enabled ( true)
	cb_option.enabled ( true)
else
	dw_basic.reset()
	em_date.enabled = false
	em_nombre.enabled = false
	cb_imprimer.enabled ( false)
	cb_option.enabled ( false)
end if
end event

type dw_edition from datawindow within w_impr_etiq
boolean visible = false
integer x = 795
integer y = 240
integer width = 571
integer height = 600
integer taborder = 40
string title = "none"
string dataobject = "dw_edition_etiquettes_3"
boolean border = false
boolean livescroll = true
end type

type dw_code_barre from datawindow within w_impr_etiq
boolean visible = false
integer x = 146
integer y = 152
integer width = 571
integer height = 600
integer taborder = 30
string title = "none"
string dataobject = "dw_code_barre"
boolean border = false
boolean livescroll = true
end type

type em_nombre from editmask within w_impr_etiq
integer x = 1225
integer y = 756
integer width = 210
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 16777215
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
string mask = "##"
boolean spin = true
end type

type em_date from editmask within w_impr_etiq
integer x = 955
integer y = 656
integer width = 402
integer height = 80
integer taborder = 40
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
boolean enabled = false
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
end type

type dw_basic from datawindow within w_impr_etiq
string tag = "brush"
integer x = 41
integer y = 212
integer width = 1605
integer height = 364
integer taborder = 30
boolean enabled = false
string title = "none"
string dataobject = "dw_produit_data_little"
boolean livescroll = true
end type

type em_code_barre from editmask within w_impr_etiq
integer x = 567
integer y = 76
integer width = 430
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
string mask = "#######"
end type

type st_3 from statictext within w_impr_etiq
integer x = 256
integer y = 764
integer width = 942
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Nombre étiquettes à imprimer :"
boolean focusrectangle = false
end type

type st_2 from statictext within w_impr_etiq
integer x = 265
integer y = 664
integer width = 640
integer height = 64
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Date d~'impression :"
boolean focusrectangle = false
end type

type st_1 from statictext within w_impr_etiq
integer x = 87
integer y = 84
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 700
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Code Barre :"
alignment alignment = right!
boolean focusrectangle = false
end type

