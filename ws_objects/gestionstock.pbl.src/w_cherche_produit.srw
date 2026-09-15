$PBExportHeader$w_cherche_produit.srw
forward
global type w_cherche_produit from w_fenetre_arakis
end type
type cb_continuer from uo_picturebutton_390x120 within w_cherche_produit
end type
type cb_annuler from uo_picturebutton_390x120 within w_cherche_produit
end type
type cb_rechercher from uo_picturebutton_390x120 within w_cherche_produit
end type
type em_code_barre from editmask within w_cherche_produit
end type
type rb_code_barre from radiobutton within w_cherche_produit
end type
type dw_prati from datawindow within w_cherche_produit
end type
type rb_un from radiobutton within w_cherche_produit
end type
type rb_tous from radiobutton within w_cherche_produit
end type
type st_resultat from statictext within w_cherche_produit
end type
type cbx_archive from checkbox within w_cherche_produit
end type
type uo_1 from resize_fenetre within w_cherche_produit
end type
type dw_resultat from u_basedw within w_cherche_produit
end type
type dw_lieu from datawindow within w_cherche_produit
end type
type rb_lieu from radiobutton within w_cherche_produit
end type
type dw_recherche from datawindow within w_cherche_produit
end type
type rb_designation from radiobutton within w_cherche_produit
end type
type rb_type from radiobutton within w_cherche_produit
end type
type em_resultat from statictext within w_cherche_produit
end type
type em_designation from singlelineedit within w_cherche_produit
end type
type rb_reference_fournisseur from radiobutton within w_cherche_produit
end type
type sle_reference_fournisseur from singlelineedit within w_cherche_produit
end type
type rb_code_produit from radiobutton within w_cherche_produit
end type
type sle_code_produit from singlelineedit within w_cherche_produit
end type
type cbx_catalogue from checkbox within w_cherche_produit
end type
type cbx_inactifs from checkbox within w_cherche_produit
end type
type rb_identifiant_udi from radiobutton within w_cherche_produit
end type
type sle_identifiant_udi from singlelineedit within w_cherche_produit
end type
type pb_udi from picturebutton within w_cherche_produit
end type
type gb_4 from groupbox within w_cherche_produit
end type
type gb_1 from groupbox within w_cherche_produit
end type
type gb_2 from groupbox within w_cherche_produit
end type
type gb_3 from groupbox within w_cherche_produit
end type
end forward

global type w_cherche_produit from w_fenetre_arakis
integer width = 4389
integer height = 2428
string title = "Recherche du Produit"
windowtype windowtype = response!
long backcolor = 15780518
cb_continuer cb_continuer
cb_annuler cb_annuler
cb_rechercher cb_rechercher
em_code_barre em_code_barre
rb_code_barre rb_code_barre
dw_prati dw_prati
rb_un rb_un
rb_tous rb_tous
st_resultat st_resultat
cbx_archive cbx_archive
uo_1 uo_1
dw_resultat dw_resultat
dw_lieu dw_lieu
rb_lieu rb_lieu
dw_recherche dw_recherche
rb_designation rb_designation
rb_type rb_type
em_resultat em_resultat
em_designation em_designation
rb_reference_fournisseur rb_reference_fournisseur
sle_reference_fournisseur sle_reference_fournisseur
rb_code_produit rb_code_produit
sle_code_produit sle_code_produit
cbx_catalogue cbx_catalogue
cbx_inactifs cbx_inactifs
rb_identifiant_udi rb_identifiant_udi
sle_identifiant_udi sle_identifiant_udi
pb_udi pb_udi
gb_4 gb_4
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
end type
global w_cherche_produit w_cherche_produit

type variables
datawindowchild idw_type
string sel,clausew,clauseo,clausea


// pour la recherche
string prat_min, prat_max
string catego_min, catego_max
string type_min, type_max
string desig, reference_fournisseur
string lieu 
string code_min, code_max

string gtin

string action_a_faire
end variables

forward prototypes
public subroutine color ()
public subroutine continuer ()
public subroutine rechercher ()
public subroutine init_variables ()
end prototypes

public subroutine color ();integer compteur, i,nb_total, nb_archive
string code_produit_courant, code_praticien_courant

FOR i = 1 to dw_resultat.rowcount()
  code_produit_courant = dw_resultat.getitemstring(i,"produit_code_interne")
  code_praticien_courant = dw_resultat.getitemstring(i,"param_stock_produit_code_praticien")
 
	  SELECT "produit"."code_interne"  
	    INTO :compteur  
	    FROM "produit",   
	         "reference_produit"  
	   WHERE ( "reference_produit"."code_produit" = "produit"."code_interne" ) and  
	         ( ( "produit"."code_interne" = :code_produit_courant ) AND  
	         ( "reference_produit"."code_fournisseur" like '%' ))   ;


	if compteur = 0 then
		//ne devrait normalement jamais arrivé
		dw_resultat.setitem(i,"produit_couleur_texte",65280)
	else
		SELECT count(*)  
   	 	INTO :nb_total  
    		FROM "produit",   
         	"reference_produit"  
   		WHERE ( "reference_produit"."code_produit" = "produit"."code_interne" ) and  
         		( ( "produit"."code_interne" = :code_produit_courant )   
         		)   ;
		
//		SELECT count(*)  
//    		INTO :nb_archive  
//    		FROM "produit",   
//         	"reference_produit",
//				"param_stock_fournisseur"
//   		WHERE ( "reference_produit"."code_produit" = "produit"."code_interne" ) and  
//         		( ( "produit"."code_interne" = :code_produit_courant ) AND  
//         		( ""."archive" = 'o' )   
//         		)   ;
	  SELECT "param_stock_fournisseur"."code_produit"  
	    INTO :nb_archive  
	    FROM "param_stock_fournisseur"  
	   WHERE "param_stock_fournisseur"."archive" = 'o'   ;

		if nb_archive = nb_total then
			if cbx_archive.checked then
				dw_resultat.setitem(i,"produit_couleur_texte",255)
			else
				dw_resultat.deleterow(i)
			end if
		else
			if cbx_archive.checked then
				if nb_archive = 0 then
					dw_resultat.setitem(i,"produit_couleur_texte",0)
				else
					dw_resultat.setitem(i,"produit_couleur_texte",128)
				end if
			else
				dw_resultat.setitem(i,"produit_couleur_texte",0)
			end if
		end if
	end if
NEXT
end subroutine

public subroutine continuer ();str_boolstring struct
integer compteur
string valeur_a_retourner


struct.code_produit = dw_resultat.getitemstring(dw_resultat.getrow(),"produit_code_interne")
struct.code_praticien = dw_resultat.getitemstring(dw_resultat.getrow(),"param_stock_produit_code_praticien")

select count(*)
	into :compteur
	from "param_stock_fournisseur"
	where code_produit = :struct.code_produit and code_praticien = :struct.code_praticien;
	
if compteur = 0 then
	struct.ajout = true
else
	struct.ajout = false
end if
if cbx_archive.checked then
	struct.archive = true
else
	struct.archive = false
end if


// Mémorisation de dernière recherche

if rb_un.checked then
	v_recherche_produit_un_tous_praticiens  = "U" 
	v_recherche_produit_praticien = dw_prati.GetItemString(1, "code")
else
	v_recherche_produit_un_tous_praticiens  = "T" 
	v_recherche_produit_praticien=""
end if


if cbx_archive.checked then
	v_recherche_produit_avec_archives = "O" 
else
	v_recherche_produit_avec_archives = "N" 
end if

if cbx_catalogue.checked then
	v_recherche_produit_avec_catalogue = "O" 
else 
	v_recherche_produit_avec_catalogue = "N" 
end if


v_recherche_produit_type = ""
v_recherche_produit_categorie = ""
v_recherche_produit_critere = ""
v_recherche_produit_designation = ""
v_recherche_produit_code_produit = ""
v_recherche_produit_lieu_stockage = ""
v_recherche_produit_code_barre = ""
v_recherche_produit_reference_fournisseur = ""


if rb_type.checked	then
	// type produit 
	v_recherche_produit_critere = "T"
	v_recherche_produit_categorie = dw_recherche.GetItemString(1, "type_produit_code_categorie_produit")
	v_recherche_produit_type = dw_recherche.GetItemString(1, "produit_code_type_produit" )
end if
if rb_designation.checked	then
	// Désignation
	v_recherche_produit_critere =	"D"
	v_recherche_produit_designation = em_designation.text
end if

if rb_code_produit.checked then
	// Code produit
	v_recherche_produit_critere =	"P"
	v_recherche_produit_code_produit = sle_code_produit.text
end if

if rb_lieu.checked then
	// Lieu Stockage
	v_recherche_produit_critere =	"L"
	v_recherche_produit_lieu_stockage = dw_lieu.GetItemString(1, "code")
end if
	
if rb_code_barre.checked then
	// Code Barre
	v_recherche_produit_critere =	"B"
	v_recherche_produit_code_barre = em_code_barre.text
end if


if rb_reference_fournisseur.checked then
	// Référence Fournisseur
	v_recherche_produit_critere =	"R"
	v_recherche_produit_reference_fournisseur = sle_reference_fournisseur.text
end if


if action_a_faire = "2" then
	// On enchaine sur la gestion de stock
	if isvalid(w_maj_stock_produit) then
		// on a déja une fiche ouverte et on boucle dessus => on ferme la précédente
		close(w_maj_stock_produit)
	end if
	

	// Ferme recherche et ouvre la mise à jour du stock car 2 response => faut fermer avant d'ouvrir
	ferme_rechercher_ouvre_maj(struct)

else

	
	if action_a_faire = "3" then
		// On renvoit le code du produit
		valeur_a_retourner = struct.code_produit
	end if
	
	
	CloseWithReturn(this, valeur_a_retourner)
end if



end subroutine

public subroutine rechercher ();string rapport,clause
integer nb_row

clause = clausew + clausea + clauseo
rapport = dw_resultat.modify('datawindow.table.select ="' + sel + clause+'"')
if rapport = "" then
	nb_row =dw_resultat.retrieve()
	if nb_row > 0 then
		cb_continuer.enabled ( true)
		em_resultat.text = string(nb_row)
		st_resultat.text = "Résultats"
		color()
	else
		cb_continuer.enabled ( false)
		em_resultat.text = "Aucun"
		st_resultat.text = "Résultat"
	end if
	if dw_resultat.rowcount() = 1 then
		continuer()
	end if
else
	messagebox("Attention","Problème dans le changement de select")
end if
end subroutine

public subroutine init_variables ();
catego_min = " "
catego_max = "ZZZZZZ"

type_min = " "
type_max = "ZZZZZZ"

setnull(lieu)

code_min = " "
code_max = "ZZZZZZZZZZZZZZ"

desig = '%'

reference_fournisseur = '%'

gtin = '%'
end subroutine

on w_cherche_produit.create
int iCurrent
call super::create
this.cb_continuer=create cb_continuer
this.cb_annuler=create cb_annuler
this.cb_rechercher=create cb_rechercher
this.em_code_barre=create em_code_barre
this.rb_code_barre=create rb_code_barre
this.dw_prati=create dw_prati
this.rb_un=create rb_un
this.rb_tous=create rb_tous
this.st_resultat=create st_resultat
this.cbx_archive=create cbx_archive
this.uo_1=create uo_1
this.dw_resultat=create dw_resultat
this.dw_lieu=create dw_lieu
this.rb_lieu=create rb_lieu
this.dw_recherche=create dw_recherche
this.rb_designation=create rb_designation
this.rb_type=create rb_type
this.em_resultat=create em_resultat
this.em_designation=create em_designation
this.rb_reference_fournisseur=create rb_reference_fournisseur
this.sle_reference_fournisseur=create sle_reference_fournisseur
this.rb_code_produit=create rb_code_produit
this.sle_code_produit=create sle_code_produit
this.cbx_catalogue=create cbx_catalogue
this.cbx_inactifs=create cbx_inactifs
this.rb_identifiant_udi=create rb_identifiant_udi
this.sle_identifiant_udi=create sle_identifiant_udi
this.pb_udi=create pb_udi
this.gb_4=create gb_4
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_continuer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.cb_rechercher
this.Control[iCurrent+4]=this.em_code_barre
this.Control[iCurrent+5]=this.rb_code_barre
this.Control[iCurrent+6]=this.dw_prati
this.Control[iCurrent+7]=this.rb_un
this.Control[iCurrent+8]=this.rb_tous
this.Control[iCurrent+9]=this.st_resultat
this.Control[iCurrent+10]=this.cbx_archive
this.Control[iCurrent+11]=this.uo_1
this.Control[iCurrent+12]=this.dw_resultat
this.Control[iCurrent+13]=this.dw_lieu
this.Control[iCurrent+14]=this.rb_lieu
this.Control[iCurrent+15]=this.dw_recherche
this.Control[iCurrent+16]=this.rb_designation
this.Control[iCurrent+17]=this.rb_type
this.Control[iCurrent+18]=this.em_resultat
this.Control[iCurrent+19]=this.em_designation
this.Control[iCurrent+20]=this.rb_reference_fournisseur
this.Control[iCurrent+21]=this.sle_reference_fournisseur
this.Control[iCurrent+22]=this.rb_code_produit
this.Control[iCurrent+23]=this.sle_code_produit
this.Control[iCurrent+24]=this.cbx_catalogue
this.Control[iCurrent+25]=this.cbx_inactifs
this.Control[iCurrent+26]=this.rb_identifiant_udi
this.Control[iCurrent+27]=this.sle_identifiant_udi
this.Control[iCurrent+28]=this.pb_udi
this.Control[iCurrent+29]=this.gb_4
this.Control[iCurrent+30]=this.gb_1
this.Control[iCurrent+31]=this.gb_2
this.Control[iCurrent+32]=this.gb_3
end on

on w_cherche_produit.destroy
call super::destroy
destroy(this.cb_continuer)
destroy(this.cb_annuler)
destroy(this.cb_rechercher)
destroy(this.em_code_barre)
destroy(this.rb_code_barre)
destroy(this.dw_prati)
destroy(this.rb_un)
destroy(this.rb_tous)
destroy(this.st_resultat)
destroy(this.cbx_archive)
destroy(this.uo_1)
destroy(this.dw_resultat)
destroy(this.dw_lieu)
destroy(this.rb_lieu)
destroy(this.dw_recherche)
destroy(this.rb_designation)
destroy(this.rb_type)
destroy(this.em_resultat)
destroy(this.em_designation)
destroy(this.rb_reference_fournisseur)
destroy(this.sle_reference_fournisseur)
destroy(this.rb_code_produit)
destroy(this.sle_code_produit)
destroy(this.cbx_catalogue)
destroy(this.cbx_inactifs)
destroy(this.rb_identifiant_udi)
destroy(this.sle_identifiant_udi)
destroy(this.pb_udi)
destroy(this.gb_4)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
end on

event open;call super::open;// On passe un string en paramètre pour savoir ce qu'on doit faire
// avant ou après ou pendant

// 1 : fermer la fenêtre  "w_maj_stock_produit"
// 2 : enchainer sur la mise à jour du stock du produit
// 3 : retourner le code interne du produit choisi (table des produits)


action_a_faire = message.stringparm


if action_a_faire = "1" then
	close(w_maj_stock_produit)
end if

if action_a_faire = "3" then
	cbx_catalogue.checked = true
end if


dw_recherche.settransobject(sqlca)
dw_lieu.settransobject(sqlca)
dw_resultat.settransobject(sqlca)
dw_prati.Settransobject(sqlca)

dw_recherche.getchild("produit_code_type_produit",idw_type)
idw_type.settransobject(sqlca)
idw_type.insertrow(0)

sel = dw_resultat.describe("datawindow.table.select")
clausea = ""
clauseo = " ORDER by produit.code_interne"

dw_recherche.insertrow(0)
dw_lieu.insertrow(0)
dw_prati.retrieve()

dw_lieu.visible = false
em_designation.visible = false
dw_prati.visible = false
em_code_barre.visible = false
sle_reference_fournisseur.visible = false
sle_identifiant_udi.visible = false

// coloration

colore_datawindow(dw_resultat)
colore_datawindow(dw_recherche)
colore_tous_objets_window(this, couleur_fond_fenetre)



init_variables()

//uo_1.taille(this)
centrer(this)


// Mise à jour de la dernière recherche

if v_recherche_produit_un_tous_praticiens  = "U" then
	rb_un.checked = true
	rb_tous.checked = false
	dw_prati.SetItem(1, "code", v_recherche_produit_praticien)
	dw_prati.visible = true
end if

if v_recherche_produit_avec_archives = "O" then 
	cbx_archive.checked = true
end if

if v_recherche_produit_avec_catalogue = "O" then 
	cbx_catalogue.checked = true
end if

v_recherche_produit_critere = string( profileInt(dir_ini+inifile_orthokis,"recherche", "Stock_Tracabilité",1))

choose case v_recherche_produit_critere
//	case "T"
	case "1"
		// type produit 

		dw_recherche.SetItem(1, "type_produit_code_categorie_produit",v_recherche_produit_categorie)
		idw_type.retrieve(v_recherche_produit_categorie)
		dw_recherche.SetItem(1, "produit_code_type_produit", v_recherche_produit_type)
		catego_min = v_recherche_produit_categorie
		catego_max = v_recherche_produit_categorie
		type_min = v_recherche_produit_type
		type_max = v_recherche_produit_type
		dw_recherche.setfocus()
//case "D"
	case "2"
		// Désignation
		rb_type.checked = false
		dw_recherche.visible = false
		rb_designation.checked = true
		em_designation.visible = true
		em_designation.text = v_recherche_produit_designation
		em_designation.setfocus()
//	case "P"
	case "3"
		// Code produit
		rb_type.checked = false
		dw_recherche.visible = false
		rb_code_produit.checked = true
		sle_code_produit.visible = true
		sle_code_produit.text = v_recherche_produit_code_produit
		sle_code_produit.setfocus()
//	case "L"
	case "4"

		// Lieu Stockage
		rb_type.checked = false
		dw_recherche.visible = false
		rb_lieu.checked = true
		dw_lieu.visible = true
		dw_lieu.SetItem(1, "code", v_recherche_produit_lieu_stockage)
		dw_lieu.setfocus()
///	case "B"
	case "5"

		// Code Barre
		rb_type.checked = false
		dw_recherche.visible = false
		rb_code_barre.checked = true
		em_code_barre.visible = true
		em_code_barre.text = v_recherche_produit_code_barre
		em_code_barre.setfocus()
//	case "R"
	case "6"

		// Référence Fournisseur
		rb_type.checked = false
		dw_recherche.visible = false
		rb_reference_fournisseur.checked = true
		sle_reference_fournisseur.visible = true
		sle_reference_fournisseur.text = v_recherche_produit_reference_fournisseur
		sle_reference_fournisseur.setfocus()
		
	case "7"

		// Identifiant UDI 
		rb_identifiant_udi.checked = true
		dw_recherche.visible = false
		sle_identifiant_udi.visible = true
		sle_identifiant_udi.setfocus()
end choose
end event

event resize;call super::resize;//uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_cherche_produit
integer y = 680
end type

type cb_continuer from uo_picturebutton_390x120 within w_cherche_produit
integer x = 3241
integer y = 2140
integer width = 457
integer taborder = 50
boolean enabled = false
string text = "&Continuer"
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;continuer()
end event

type cb_annuler from uo_picturebutton_390x120 within w_cherche_produit
integer x = 2757
integer y = 2140
integer width = 457
integer taborder = 40
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type cb_rechercher from uo_picturebutton_390x120 within w_cherche_produit
integer x = 3154
integer y = 216
integer width = 539
integer height = 152
integer taborder = 20
string text = "&Rechercher"
boolean default = true
string iconname = "ACTIONS_chercher.png"
end type

event clicked;call super::clicked;
double code_barre
integer compteur
string code_prod,code_prat
string v_pour_catalogue

if rb_un.checked then
	prat_min = dw_prati.gettext()
	prat_max = dw_prati.gettext()
else
	prat_min = " "
	prat_max = "ZZZZZZ"
end if

if rb_designation.checked then
	desig = trim(em_designation.text)+"%"
end if

if rb_reference_fournisseur.checked then
	reference_fournisseur = trim(sle_reference_fournisseur.text)+"%"
end if

if rb_code_produit.checked then
	code_min = sle_code_produit.text
	code_max = sle_code_produit.text
end if

if rb_code_barre.checked then
	code_barre = double(em_code_barre.text)
		
	  SELECT	"stock_produit"."code_produit",   
				"stock_produit"."code_praticien"  
		 INTO :code_prod,   
				:code_prat  
		 FROM "stock_produit"  
		WHERE "stock_produit"."code_barre" = :code_barre   ;
		
	  SELECT count(*)
		 INTO :compteur  
		 FROM "param_stock_produit"  
		WHERE ( "param_stock_produit"."code_produit" = :code_prod ) AND  
				( "param_stock_produit"."code_praticien" = :code_prat )   ;
				
		code_min = code_prod
		code_max = code_prod
			
end if


if cbx_catalogue.checked then 
	v_pour_catalogue = '04081966'
else
	v_pour_catalogue = 'COMMUN'
end if

if rb_identifiant_udi.checked then 
	gtin = trim(sle_identifiant_udi.text)
end if

// Le lieu est géré sous forme de filtre car il peut être nul
string v_filtre 
if rb_lieu.checked then
	lieu = dw_lieu.gettext()
	v_filtre = "lieu_stockage = '"+lieu+"'"
else
	v_filtre = ""
end if

integer actif_min, actif_max
if cbx_inactifs.checked then 
	actif_min = 0
	actif_max = 1
else
	actif_min = 1
	actif_max = 1
end if

dw_resultat.setfilter(v_filtre)
dw_resultat.filter()

dw_resultat.retrieve(prat_min, prat_max, catego_min, catego_max, type_min, type_max ,desig, code_min, code_max, reference_fournisseur,v_pour_catalogue, actif_min, actif_max, gtin)

if dw_resultat.rowcount() = 1 then
	Continuer()
end if



end event

type em_code_barre from editmask within w_cherche_produit
integer x = 2702
integer y = 560
integer width = 466
integer height = 80
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
alignment alignment = right!
borderstyle borderstyle = stylelowered!
string mask = "#######"
end type

type rb_code_barre from radiobutton within w_cherche_produit
integer x = 2030
integer y = 568
integer width = 434
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Code Barre"
end type

event clicked;sle_identifiant_udi.visible = false
sle_code_produit.visible = false
em_designation.visible = false
dw_recherche.visible = false
dw_lieu.visible = false
sle_reference_fournisseur.visible = false
em_code_barre.visible = true
//cb_rechercher.enabled = true
clausew = ""

init_variables()

em_code_barre.setfocus()
end event

type dw_prati from datawindow within w_cherche_produit
integer x = 713
integer y = 208
integer width = 818
integer height = 80
integer taborder = 30
string title = "none"
string dataobject = "dw_affich_prati"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;clausea = " AND param_stock_produit.code_praticien ='"+data+"'"
//rechercher()
end event

type rb_un from radiobutton within w_cherche_produit
integer x = 201
integer y = 220
integer width = 402
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Un praticien"
end type

event clicked;dw_prati.visible = true
clausea = " AND param_stock_produit.code_praticien ='"+dw_prati.getitemstring(dw_prati.getrow(),"code")+"'"
//rechercher()
end event

type rb_tous from radiobutton within w_cherche_produit
integer x = 201
integer y = 128
integer width = 585
integer height = 64
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Tous les praticiens"
boolean checked = true
end type

event clicked;dw_prati.visible = false
clausea = ""
//rechercher()

end event

type st_resultat from statictext within w_cherche_produit
integer x = 1943
integer y = 240
integer width = 457
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
string text = "Produits trouvés"
boolean focusrectangle = false
end type

type cbx_archive from checkbox within w_cherche_produit
integer x = 1765
integer y = 120
integer width = 457
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Avec Archivés"
end type

type uo_1 from resize_fenetre within w_cherche_produit
boolean visible = false
integer x = 1403
integer y = 908
integer taborder = 50
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_resultat from u_basedw within w_cherche_produit
string tag = "brush"
integer x = 46
integer y = 932
integer width = 4247
integer height = 1156
integer taborder = 40
boolean titlebar = true
string title = "Résultats Recherche"
string dataobject = "dw_produit_liste_recherche"
boolean border = false
end type

event doubleclicked;call super::doubleclicked;This.setRow(row)
continuer()
end event

event retrieveend;call super::retrieveend;if rowcount() > 0 then
	
	em_resultat.text = string(rowcount())
	st_resultat.text = "Produits Trouvés"
	cb_continuer.enabled ( true)
else
	em_resultat.text = "Aucun"
	st_resultat.text = "Produit Trouvé"
	cb_continuer.enabled ( false)
end if
end event

type dw_lieu from datawindow within w_cherche_produit
integer x = 2693
integer y = 472
integer width = 928
integer height = 84
integer taborder = 40
string title = "none"
string dataobject = "dw_recherche_lieu"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string rapport
integer nb_row

clausew = " AND param_stock_produit.code_lieu_stockage_habituel = '"+data+"'"
//rechercher()

lieu  = data

end event

type rb_lieu from radiobutton within w_cherche_produit
integer x = 2030
integer y = 476
integer width = 471
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Lieu Stockage"
end type

event clicked;sle_identifiant_udi.visible = false
sle_code_produit.visible = false
sle_reference_fournisseur.visible = false
em_designation.visible = false
dw_recherche.visible = false
dw_lieu.visible = true
em_code_barre.visible = false
//cb_rechercher.enabled = false

init_variables()

clausew = ""
end event

type dw_recherche from datawindow within w_cherche_produit
string tag = "brush"
integer x = 677
integer y = 456
integer width = 910
integer height = 164
integer taborder = 20
string dataobject = "dw_recherche_produit"
boolean border = false
boolean livescroll = true
end type

event itemchanged;string rapport, err
integer nb_row

if dwo.name = 'type_produit_code_categorie_produit' then
	idw_type.retrieve(data)
	dw_recherche.setitem(dw_recherche.getrow(),"produit_code_type_produit","")
	
	catego_min = data
	catego_max = data
	type_min = ''
	type_max = 'ZZZZZZ'
end if
if dwo.name = 'produit_code_type_produit' then
	clausew = " AND produit.code_type_produit = '"+data+"'"
	type_min = data
	type_max = data
//	rechercher()
end if
end event

type rb_designation from radiobutton within w_cherche_produit
integer x = 169
integer y = 656
integer width = 402
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Désignation"
end type

event clicked;sle_identifiant_udi.visible = false
sle_reference_fournisseur.visible = false
em_designation.visible = true
dw_recherche.visible = false
dw_lieu.visible = false
em_code_barre.visible = false
sle_code_produit.visible = false
//cb_rechercher.enabled = true
clausew = ""

init_variables()
//dw_recherche.reset()
em_designation.setfocus()
end event

type rb_type from radiobutton within w_cherche_produit
integer x = 169
integer y = 472
integer width = 416
integer height = 80
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Type Produit"
boolean checked = true
end type

event clicked;sle_code_produit.visible = false
sle_reference_fournisseur.visible = false
sle_identifiant_udi.visible = false
em_designation.visible = false
dw_recherche.visible = true
dw_lieu.visible = false
em_code_barre.visible = false
//cb_rechercher.enabled = false
clausew = ""

init_variables()


//dw_recherche.reset()
//dw_recherche.insertrow(0)

end event

type em_resultat from statictext within w_cherche_produit
integer x = 1696
integer y = 232
integer width = 206
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
boolean enabled = false
alignment alignment = right!
boolean focusrectangle = false
end type

type em_designation from singlelineedit within w_cherche_produit
boolean visible = false
integer x = 677
integer y = 648
integer width = 1262
integer height = 80
integer taborder = 40
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 100
borderstyle borderstyle = stylelowered!
end type

type rb_reference_fournisseur from radiobutton within w_cherche_produit
integer x = 2030
integer y = 656
integer width = 672
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Référence Fournisseur"
end type

event clicked;sle_identifiant_udi.visible = false
sle_code_produit.visible = false
em_designation.visible = false
dw_recherche.visible = false
dw_lieu.visible = false
sle_reference_fournisseur.visible = true
em_code_barre.visible = false
//cb_rechercher.enabled = true
clausew = ""

init_variables()

sle_reference_fournisseur.setfocus()
end event

type sle_reference_fournisseur from singlelineedit within w_cherche_produit
integer x = 2702
integer y = 648
integer width = 1271
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 40
borderstyle borderstyle = stylelowered!
end type

type rb_code_produit from radiobutton within w_cherche_produit
integer x = 169
integer y = 744
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Code Produit"
end type

event clicked;sle_identifiant_udi.visible = false
sle_reference_fournisseur.visible = false
em_designation.visible = false
dw_recherche.visible = false
dw_lieu.visible = false
em_code_barre.visible = false
sle_code_produit.visible = true
//cb_rechercher.enabled = true
clausew = ""

init_variables()
//dw_recherche.reset()
sle_code_produit.setfocus()
end event

type sle_code_produit from singlelineedit within w_cherche_produit
boolean visible = false
integer x = 677
integer y = 748
integer width = 800
integer height = 80
integer taborder = 50
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 20
borderstyle borderstyle = stylelowered!
end type

type cbx_catalogue from checkbox within w_cherche_produit
integer x = 2597
integer y = 100
integer width = 1563
integer height = 80
boolean bringtotop = true
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Avec les produits ~"Catalogue~" (non encore référencés)"
end type

type cbx_inactifs from checkbox within w_cherche_produit
integer x = 3758
integer y = 448
integer width = 457
integer height = 76
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Avec inactifs"
end type

type rb_identifiant_udi from radiobutton within w_cherche_produit
integer x = 2030
integer y = 744
integer width = 503
integer height = 64
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 15780518
string text = "Identifiant UDI"
end type

event clicked;sle_code_produit.visible = false
em_designation.visible = false
dw_recherche.visible = false
dw_lieu.visible = false
sle_reference_fournisseur.visible = false
em_code_barre.visible = false
//cb_rechercher.enabled = true
clausew = ""

init_variables()

sle_identifiant_udi.setfocus()

sle_identifiant_udi.visible = true
open(w_udi_lecture)

str_udi v_udi
v_udi = message.PowerObjectParm

if not isnull(v_udi.di) then
	sle_identifiant_udi.text = v_udi.di
	cb_rechercher.triggerevent(clicked!)
end if
end event

type sle_identifiant_udi from singlelineedit within w_cherche_produit
boolean visible = false
integer x = 2702
integer y = 748
integer width = 722
integer height = 80
integer taborder = 60
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
integer limit = 14
borderstyle borderstyle = stylelowered!
end type

type pb_udi from picturebutton within w_cherche_produit
integer x = 3506
integer y = 744
integer width = 123
integer height = 116
integer taborder = 70
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_gs1.png"
alignment htextalign = left!
string powertiptext = "Scan du code barre pour saisir l~'identifiant UDI"
end type

event clicked;
rb_identifiant_udi.checked = true




rb_identifiant_udi.triggerevent(clicked!)

end event

type gb_4 from groupbox within w_cherche_produit
integer x = 46
integer y = 372
integer width = 4247
integer height = 520
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Critères Recherche Produit"
end type

type gb_1 from groupbox within w_cherche_produit
integer x = 46
integer y = 28
integer width = 1582
integer height = 332
integer taborder = 10
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 15780518
string text = "Séléection praticien"
end type

type gb_2 from groupbox within w_cherche_produit
integer x = 1655
integer y = 28
integer width = 768
integer height = 332
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 15780518
end type

type gb_3 from groupbox within w_cherche_produit
integer x = 2464
integer y = 32
integer width = 1801
integer height = 164
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
long textcolor = 33554432
long backcolor = 15780518
end type

