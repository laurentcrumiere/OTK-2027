$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type cb_4 from commandbutton within w_main
end type
type st_1 from statictext within w_main
end type
type sle_dir_photos from singlelineedit within w_main
end type
type lb_3 from listbox within w_main
end type
type lb_2 from listbox within w_main
end type
type lb_1 from listbox within w_main
end type
type cb_3 from commandbutton within w_main
end type
type cb_2 from commandbutton within w_main
end type
type cb_1 from commandbutton within w_main
end type
type cb_fermer from commandbutton within w_main
end type
type gb_1 from groupbox within w_main
end type
type gb_2 from groupbox within w_main
end type
end forward

global type w_main from window
integer width = 1609
integer height = 1360
boolean titlebar = true
string title = "Boite à Outils Orthokis"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_4 cb_4
st_1 st_1
sle_dir_photos sle_dir_photos
lb_3 lb_3
lb_2 lb_2
lb_1 lb_1
cb_3 cb_3
cb_2 cb_2
cb_1 cb_1
cb_fermer cb_fermer
gb_1 gb_1
gb_2 gb_2
end type
global w_main w_main

on w_main.create
this.cb_4=create cb_4
this.st_1=create st_1
this.sle_dir_photos=create sle_dir_photos
this.lb_3=create lb_3
this.lb_2=create lb_2
this.lb_1=create lb_1
this.cb_3=create cb_3
this.cb_2=create cb_2
this.cb_1=create cb_1
this.cb_fermer=create cb_fermer
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_4,&
this.st_1,&
this.sle_dir_photos,&
this.lb_3,&
this.lb_2,&
this.lb_1,&
this.cb_3,&
this.cb_2,&
this.cb_1,&
this.cb_fermer,&
this.gb_1,&
this.gb_2}
end on

on w_main.destroy
destroy(this.cb_4)
destroy(this.st_1)
destroy(this.sle_dir_photos)
destroy(this.lb_3)
destroy(this.lb_2)
destroy(this.lb_1)
destroy(this.cb_3)
destroy(this.cb_2)
destroy(this.cb_1)
destroy(this.cb_fermer)
destroy(this.gb_1)
destroy(this.gb_2)
end on

type cb_4 from commandbutton within w_main
integer x = 64
integer y = 372
integer width = 1426
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "MàJ Qte Colisée + archive nuls"
end type

event clicked;

update param_stock_fournisseur set qte_colisee = 1 where qte_colisee is null ;
update param_stock_fournisseur set archive = 'n'  where archive is null ;
commit ;
Messagebox("INFORMATION","Opération terminée !")
end event

type st_1 from statictext within w_main
integer x = 73
integer y = 1184
integer width = 311
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "V 2024"
boolean focusrectangle = false
end type

type sle_dir_photos from singlelineedit within w_main
integer x = 73
integer y = 776
integer width = 1422
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "c:\power\photos\"
borderstyle borderstyle = stylelowered!
end type

type lb_3 from listbox within w_main
boolean visible = false
integer x = 1422
integer y = 784
integer width = 160
integer height = 400
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
borderstyle borderstyle = stylelowered!
end type

type lb_2 from listbox within w_main
boolean visible = false
integer x = 2825
integer y = 2236
integer width = 160
integer height = 400
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
borderstyle borderstyle = stylelowered!
end type

type lb_1 from listbox within w_main
boolean visible = false
integer x = 425
integer y = 832
integer width = 809
integer height = 400
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Eras Demi ITC"
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

type cb_3 from commandbutton within w_main
integer x = 64
integer y = 648
integer width = 1426
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Suppression de toutes les vignettes"
end type

event clicked;long totitems1, totitems2, lint_i1,lint_i2
string nom_dossier, fichier_image
string dir_photos 

dir_photos = trim(sle_dir_photos.text)

if MessageBox("ATTENTION","Vous allez SUPPRIMER TOUTES les vignettes de votre répertoire photos : " + dir_photos + "~n~nSouhaitez-vous continuer ?",Question!,Yesno!,2) = 1 then

	open(w_patience)
	w_patience.avancement("Initialisation")
	
	
	// lb_1 contient les sous répertoires des dossiers photos ...
	lb_1.DirList(dir_photos , 32768 + 16)  
	
	
	totitems1 = lb_1.totalitems()
	for lint_i1 = 1 to totitems1
		
		w_patience.avancement("Dossiers "+string(lint_i1)+"/"+string(totitems1) + " "+string(lint_i1 / totitems1 * 100 ,'0')+ " %" )
		
		
		// pour tous les dossiers photos .... 
		nom_dossier =  lb_1.Text(lint_i1)
		// On enlève le 1er et le dernier caractère qui sont des []
		nom_dossier = left(nom_dossier , len(nom_dossier) -1)
		nom_dossier = right(nom_dossier , len(nom_dossier) -1)
		
		
		
		lb_2.DirList(dir_photos+"\"+nom_dossier+"\v*.jpg" , 32 +1)  // on regarde les fichiers
		totitems2 = lb_2.totalitems()
		
		for lint_i2 = 1 to totitems2
			fichier_image = dir_photos+nom_dossier+"\"+lb_2.Text(lint_i2)
			FileDElete(fichier_image)
		next
		
	next

	
	
	close(w_patience)
end if
end event

type cb_2 from commandbutton within w_main
integer x = 64
integer y = 240
integer width = 1426
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Ajout des manquants dans param_stock_fournisseur"
end type

event clicked;
string v_code_produit, v_code_fournisseur, v_code_praticien 
long v_cpt
double v_qte_com_min, v_qte_colisee, v_remise
string v_archive, v_generer
double v_code_index 

integer cptajout1, cptajout2

// Liste des produits manquants par fournisseur

declare cur1 cursor for select code_produit, code_fournisseur from reference_produit where code_produit not in (select code_produit from param_stock_fournisseur where param_stock_fournisseur.code_produit = reference_produit.code_produit 
and  param_stock_fournisseur.code_fournisseur = reference_produit.code_fournisseur ) ;

declare cur2 cursor for select code_praticien from param_stock_produit where code_produit = :v_code_produit ;

declare cur3 cursor for select code_produit, code_praticien from param_stock_produit where code_produit not in (select code_produit from param_stock_fournisseur where param_stock_fournisseur.code_produit = param_stock_produit.code_produit 
and  param_stock_fournisseur.code_praticien = param_stock_produit.code_praticien ) ;

declare cur4 cursor for select code_fournisseur from reference_produit where code_produit = :v_code_produit ;

// TEST SELON LE FOURNISSEUR

cptajout1 = 0 

open cur1 ;

fetch cur1 into :v_code_produit, :v_code_fournisseur ;

do while sqlca.sqlcode = 0 

	// on etudie pour tous les praticiens du produit
	open cur2 ;
	
	fetch cur2 into :v_code_praticien ; 
	
	do while sqlca.sqlcode = 0 
			
			select isnull(count(*),0) into :v_cpt from param_stock_fournisseur where code_produit = :v_code_produit and 
			code_fournisseur = :v_code_fournisseur and code_praticien = :v_code_praticien ;
			
			if v_cpt = 0 then
				
				// Faut ajouter ....
				select first qte_com_min, qte_colisee, remise, archive, generer, code_index 
				into :v_qte_com_min, :v_qte_colisee, :v_remise, :v_archive, :v_generer, :v_code_index 
				from param_stock_fournisseur where code_produit = :v_code_produit ;
				
				if sqlca.sqlcode <> 0 then
					// Valeurs par défaut
					v_qte_com_min = 0
					v_qte_colisee = 1
					v_remise = 0
					v_archive = 'n'
					setnull(v_generer)
					setnull(v_code_index)
				end if
				
				// ajout effectif 
				insert into param_stock_fournisseur 	(code_produit, code_fournisseur, code_praticien, qte_com_min, qte_colisee, remise, archive, generer, code_index ) 				
				values (:v_code_produit, :v_code_fournisseur, :v_code_praticien, :v_qte_com_min, :v_qte_colisee, :v_remise, :v_archive, :v_generer, :v_code_index ) ;
				cptajout1 = cptajout1 + 1
 

			end if

			fetch cur2 into :v_code_praticien ; 

	loop
	

	close cur2 ;
	
	fetch cur1 into :v_code_produit, :v_code_fournisseur ;

loop


close cur1 ;

commit ;

//-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
// TEST SELON LE PRATICIEN 

cptajout2 = 0
 
open cur3 ;

fetch cur3 into :v_code_produit, :v_code_praticien ;

do while sqlca.sqlcode = 0 

	// on etudie pour tous les fournisseurs du produit
	open cur4 ;
	
	fetch cur4 into :v_code_fournisseur ; 
	
	do while sqlca.sqlcode = 0 
			
			select isnull(count(*),0) into :v_cpt from param_stock_fournisseur where code_produit = :v_code_produit and 
			code_fournisseur = :v_code_fournisseur and code_praticien = :v_code_praticien ;
			
			if v_cpt = 0 then
				
				// Faut ajouter ....
				select first qte_com_min, qte_colisee, remise, archive, generer, code_index 
				into :v_qte_com_min, :v_qte_colisee, :v_remise, :v_archive, :v_generer, :v_code_index 
				from param_stock_fournisseur where code_produit = :v_code_produit ;
				
				if sqlca.sqlcode <> 0 then
					// Valeurs par défaut
					v_qte_com_min = 0
					v_qte_colisee = 1
					v_remise = 0
					v_archive = 'n'
					setnull(v_generer)
					setnull(v_code_index)
				end if
				
				// ajout effectif 
				insert into param_stock_fournisseur 	(code_produit, code_fournisseur, code_praticien, qte_com_min, qte_colisee, remise, archive, generer, code_index ) 				
				values (:v_code_produit, :v_code_fournisseur, :v_code_praticien, :v_qte_com_min, :v_qte_colisee, :v_remise, :v_archive, :v_generer, :v_code_index ) ;
			
				cptajout2 = cptajout1 + 2
 
			end if

			fetch cur4 into :v_code_fournisseur ; 
		
			
	loop
	

	close cur4 ;
	
	fetch cur3 into :v_code_produit, :v_code_praticien ;

loop


close cur1 ;

commit ;



/*select * from param_stock_produit where code_produit not in (select code_produit from param_stock_fournisseur where param_stock_fournisseur.code_produit = param_stock_produit.code_produit 
and  param_stock_fournisseur.code_praticien = param_stock_produit.code_praticien ) ;
*/
Messagebox("INFORMATION","Opération terminée !~n~nAjout 1 "+ string(cptajout1)+ "~nAjout 2 : " + string(cptajout2))
end event

type cb_1 from commandbutton within w_main
integer x = 64
integer y = 104
integer width = 1426
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Eliminition des références fournisseurs Nulles"
end type

event clicked;

update reference_produit set "reference" = '' where "reference" is null ;
commit ;

Messagebox("INFORMATION","Opération terminée !")
end event

type cb_fermer from commandbutton within w_main
integer x = 549
integer y = 1056
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Fermer"
end type

event clicked;
close(parent)
end event

type gb_1 from groupbox within w_main
integer x = 9
integer y = 560
integer width = 1563
integer height = 376
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Imagerie"
end type

type gb_2 from groupbox within w_main
integer x = 9
integer width = 1563
integer height = 524
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Gestion de Stock"
end type

