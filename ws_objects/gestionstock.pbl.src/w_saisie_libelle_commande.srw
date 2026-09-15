$PBExportHeader$w_saisie_libelle_commande.srw
forward
global type w_saisie_libelle_commande from w_fenetre_arakis
end type
type cb_continuer from uo_picturebutton_390x120 within w_saisie_libelle_commande
end type
type cb_annuler from uo_picturebutton_390x120 within w_saisie_libelle_commande
end type
type uo_1 from resize_fenetre within w_saisie_libelle_commande
end type
type dw_fiche from datawindow within w_saisie_libelle_commande
end type
end forward

global type w_saisie_libelle_commande from w_fenetre_arakis
integer width = 2405
integer height = 1032
string title = "Saisie de l~'entête de la commande "
windowtype windowtype = response!
cb_continuer cb_continuer
cb_annuler cb_annuler
uo_1 uo_1
dw_fiche dw_fiche
end type
global w_saisie_libelle_commande w_saisie_libelle_commande

type variables
datawindowchild idw_livraison //dddw du libelle livraison de dw_fiche
end variables

on w_saisie_libelle_commande.create
int iCurrent
call super::create
this.cb_continuer=create cb_continuer
this.cb_annuler=create cb_annuler
this.uo_1=create uo_1
this.dw_fiche=create dw_fiche
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_continuer
this.Control[iCurrent+2]=this.cb_annuler
this.Control[iCurrent+3]=this.uo_1
this.Control[iCurrent+4]=this.dw_fiche
end on

on w_saisie_libelle_commande.destroy
call super::destroy
destroy(this.cb_continuer)
destroy(this.cb_annuler)
destroy(this.uo_1)
destroy(this.dw_fiche)
end on

event open;call super::open;//response window preparant l'ouverture de w_saisie_commande
//on génère un code pour la commande tout en laissant le champ éditable pour l'utilisateur
//l'utilisateur doit choisir un fournisseur, et un praticien (un praticien est mis par default)
//pour le libelle de livraison ce n'est pas obligatoire
//la dddw permet de choisir la livraison puis on affiche le libelle si la livraison en a un sinon le mode de transport

double max //pour la generation du code de la commande
string code_praticien_default //pour choisir le praticien par default
string fermer_saisie //pour savoir si on ferme la fenetre de saisie de commande


fermer_saisie = message.stringparm

if fermer_saisie = "1" then
	close(w_saisie_commande)
end if

colore_datawindow(dw_fiche)

dw_fiche.settransobject(sqlca) //dw de l'entete
dw_fiche.getchild("libelle_livraison",idw_livraison)
//on insere une ligne ds la dddw fille de dw_fiche car dddw avec retrieval argument
//on effectue le retrieve de la dddw au itemchanged du fournisseur de dw_fiche 
idw_livraison.settransobject(sqlca)
idw_livraison.insertrow(0)

  SELECT "prati"."code"  
    INTO :code_praticien_default  
    FROM "prati"  
   WHERE "prati"."prati_defaut" = 1   ;


select max("numero_commande")
	into :max
	from "commande";

if isnull(max) then
	max = 1
else
	max = max + 1
end if
dw_fiche.insertrow(0)
dw_fiche.setitem(dw_fiche.getrow(),"numero_commande",max)
dw_fiche.setitem(dw_fiche.getrow(),"code_praticien",code_praticien_default)
dw_fiche.selecttext(1,9)
dw_fiche.setfocus()

centrer(this)
end event

event resize;call super::resize;//uo_1.retaille(this)
end event

type p_fond from w_fenetre_arakis`p_fond within w_saisie_libelle_commande
end type

type cb_continuer from uo_picturebutton_390x120 within w_saisie_libelle_commande
integer x = 1531
integer y = 704
integer width = 466
integer taborder = 40
boolean enabled = false
string text = "&Continuer"
boolean default = true
string iconname = "ACTIONS_valider.png"
end type

event clicked;call super::clicked;str_commande struct
integer compteur

dw_fiche.accepttext()
struct.numero = dw_fiche.getitemnumber(dw_fiche.getrow(),"numero_commande")
struct.code_fourn = dw_fiche.getitemstring(dw_fiche.getrow(),"code_fournisseur")
struct.code_livraison = dw_fiche.getitemstring(dw_fiche.getrow(),"libelle_livraison")
struct.code_praticien = dw_fiche.getitemstring(dw_fiche.getrow(),"code_praticien")
struct.maj = false

select count(*)
	into :compteur
	from "commande"		
	where numero_commande = :struct.numero;

if compteur = 1 then
	struct.maj = true
	MessageBox("Attention","Le numero saisi a déjà été utilisé.~n~nPour modifier cette commande vous devez utiliser une autre fonction !")
else
	w_mdi_2020.uo_powerdock.of_openDocument(w_saisie_commande, struct, "Mise à jour de Commande", m_orthokis_2020.m_gestion_de_stock.m_saisie_commande.toolbarItemName)
	close(parent)
end if




end event

type cb_annuler from uo_picturebutton_390x120 within w_saisie_libelle_commande
integer x = 1033
integer y = 704
integer width = 475
integer height = 152
integer taborder = 30
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;close(parent)
end event

type uo_1 from resize_fenetre within w_saisie_libelle_commande
boolean visible = false
integer x = 658
integer y = 952
integer taborder = 20
end type

on uo_1.destroy
call resize_fenetre::destroy
end on

type dw_fiche from datawindow within w_saisie_libelle_commande
string tag = "brush"
integer x = 119
integer y = 108
integer width = 2043
integer height = 532
integer taborder = 10
string title = "none"
string dataobject = "dw_saisie_commande"
boolean livescroll = true
end type

event itemchanged;string libelle_livraison
if dwo.name = "code_fournisseur" then
	idw_livraison.retrieve(data)//on recupere les livraisons de ce fournisseur
	if dw_fiche.getitemstring(row,"code_praticien") <> "" then
		cb_continuer.enabled ( true)
	end if
end if
if dwo.name = "code_praticien" then
	if dw_fiche.getitemstring(row,"code_fournisseur") <> "" then
		cb_continuer.enabled ( true)
	end if
end if
if dwo.name = "libelle_livraison" then
	//on gère l'affichage du libelle
	//si on trouve un libelle on l'afffiche sinon on affiche le mode de transport
	SELECT "livraison"."libelle"  
    INTO :libelle_livraison
    FROM "livraison"  
   WHERE "livraison"."code" = :data   ;

	if isnull(libelle_livraison) then
		//mode de transport
		dw_fiche.object.t_1.visible = true
		dw_fiche.object.libelle_livraison.dddw.displaycolumn = "mode_transport_mode_transport"
		dw_fiche.setitem(row,"libelle_livraison",data)
	else
		//libelle
		dw_fiche.object.t_1.visible = false
		dw_fiche.object.libelle_livraison.dddw.displaycolumn = "livraison_libelle"
		dw_fiche.setitem(row,"libelle_livraison",data)
	end if
end if
end event

