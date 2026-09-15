$PBExportHeader$w_impr_etiq_sterilisation.srw
forward
global type w_impr_etiq_sterilisation from w_impr_etiq
end type
type cb_enregistrer from cb_imprimer within w_impr_etiq_sterilisation
end type
end forward

global type w_impr_etiq_sterilisation from w_impr_etiq
integer width = 2226
integer height = 1252
string title = "Impression Etiquettes de Stérilisation"
cb_enregistrer cb_enregistrer
end type
global w_impr_etiq_sterilisation w_impr_etiq_sterilisation

on w_impr_etiq_sterilisation.create
int iCurrent
call super::create
this.cb_enregistrer=create cb_enregistrer
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_enregistrer
end on

on w_impr_etiq_sterilisation.destroy
call super::destroy
destroy(this.cb_enregistrer)
end on

type p_fond from w_impr_etiq`p_fond within w_impr_etiq_sterilisation
end type

type cb_imprimer from w_impr_etiq`cb_imprimer within w_impr_etiq_sterilisation
integer x = 562
integer y = 900
integer width = 521
end type

event cb_imprimer::clicked;integer nombre_etiquette, i
//string nom_imprimante
string designation
date date_sterilisation
//boolean is_c4
string en_cycle

  SELECT "stock_produit"."cycle_sterilisation"  
    INTO :en_cycle  
    FROM "stock_produit"  
   WHERE "stock_produit"."code_barre" = :code_barre   ;

if en_cycle = 'o' Then
	If MessageBox("ATTENTION","Ce produit est dans un cycle de stérilisation !~n~nVoulez-vous vraiment mettre à jour la date de stérilisation de cet instrument ?",Question!,YesNo!) = 1 Then
		goto impr
	end if
else
	goto impr
end if

goto Fin

impr:

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
	
//	if is_c4 then
		FOR i = 1 to nombre_etiquette
			dw_edition.print()
		NEXT
		  UPDATE "stock_produit"  
		     SET "date_sterilisation" = :date_sterilisation,
			  		"cycle_sterilisation" = 'o'
		   WHERE "stock_produit"."code_barre" = :code_barre ;
		
		if sqlca.sqlcode = -1 then
			rollback;
			MessageBox("Erreur SQL","Problème dans la base de donnéees, la mise à jour de la date de sté n'a pas été validé")
		else
			commit;
		end if
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

Fin:
end event

type cb_option from w_impr_etiq`cb_option within w_impr_etiq_sterilisation
integer x = 32
integer y = 900
integer width = 521
end type

type cb_fermer from w_impr_etiq`cb_fermer within w_impr_etiq_sterilisation
integer x = 1623
integer y = 900
integer width = 521
end type

type cb_valider from w_impr_etiq`cb_valider within w_impr_etiq_sterilisation
integer x = 1362
integer width = 521
string iconname = "ACTIONS_valider.png"
end type

event cb_valider::clicked;code_barre = double(em_code_barre.text)

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
	cb_enregistrer.enabled ( true)
	cb_option.enabled ( true)
else
	dw_basic.reset()
	em_date.enabled = false 
	em_nombre.enabled = false 
	cb_imprimer.enabled ( false )
	cb_enregistrer.enabled ( false )
	cb_option.enabled ( false )
end if
end event

type dw_edition from w_impr_etiq`dw_edition within w_impr_etiq_sterilisation
end type

type dw_code_barre from w_impr_etiq`dw_code_barre within w_impr_etiq_sterilisation
end type

type em_nombre from w_impr_etiq`em_nombre within w_impr_etiq_sterilisation
boolean visible = false
end type

type em_date from w_impr_etiq`em_date within w_impr_etiq_sterilisation
integer x = 1129
end type

type dw_basic from w_impr_etiq`dw_basic within w_impr_etiq_sterilisation
integer x = 215
integer width = 1714
borderstyle borderstyle = stylebox!
end type

type em_code_barre from w_impr_etiq`em_code_barre within w_impr_etiq_sterilisation
integer x = 869
end type

type st_3 from w_impr_etiq`st_3 within w_impr_etiq_sterilisation
boolean visible = false
end type

type st_2 from w_impr_etiq`st_2 within w_impr_etiq_sterilisation
integer x = 439
string text = "Date de stérilisation :"
end type

type st_1 from w_impr_etiq`st_1 within w_impr_etiq_sterilisation
integer x = 389
fontcharset fontcharset = ansi!
end type

type cb_enregistrer from cb_imprimer within w_impr_etiq_sterilisation
integer x = 1093
integer taborder = 80
boolean bringtotop = true
string text = "&Enregistrer"
end type

event clicked;date date_sterilisation
string en_cycle

  SELECT "stock_produit"."cycle_sterilisation"  
    INTO :en_cycle  
    FROM "stock_produit"  
   WHERE "stock_produit"."code_barre" = :code_barre   ;

if en_cycle = 'o' Then
	If MessageBox("ATTENTION","Ce produit est dans un cycle de stérilisation !~n~nVoulez-vous vraiment mettre à jour la date de stérilisation de cet instrument ?",Question!,YesNo!) = 1 Then
		goto maj
	end if
else
	goto maj
end if

goto Fin

maj:

date_sterilisation = date(em_date.text)

  UPDATE "stock_produit"  
     SET "date_sterilisation" = :date_sterilisation,
	  		"cycle_sterilisation" = 'o'
   WHERE "stock_produit"."code_barre" = :code_barre ;

if sqlca.sqlcode = -1 then
	rollback;
	MessageBox("Erreur SQL","Problème dans la base de donnéees, la mise à jour de la date de sté n'a pas été validé")
else
	commit;
end if
		
Fin:
end event

