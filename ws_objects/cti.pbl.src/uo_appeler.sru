$PBExportHeader$uo_appeler.sru
forward
global type uo_appeler from userobject
end type
type p_1 from picturebutton within uo_appeler
end type
end forward

global type uo_appeler from userobject
integer width = 160
integer height = 136
long backcolor = 16777215
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
p_1 p_1
end type
global uo_appeler uo_appeler

type variables

// Element contenant le N° de téléphone à appeler
datawindow dw
integer nb_zone
string zone[]
end variables

on uo_appeler.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on uo_appeler.destroy
destroy(this.p_1)
end on

event constructor;// Ne se voit que si CTI actif
this.visible = cti_actif
end event

type p_1 from picturebutton within uo_appeler
integer width = 155
integer height = 136
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean flatstyle = true
string picturename = "lc_telephone.png"
alignment htextalign = left!
string powertiptext = "Appel du numéro sélectionné"
long backcolor = 553648127
end type

event clicked;
boolean v_suite


// Selon l'option de l'envrironnement du poste de travail
if profilestring(dir_ini+inifile_orthokis,"CTI","verif_ligne_sortie","O") = "O" then
	// faut vérifier ..

	// Si le bouton pour appeler est dispo
	v_suite =  w_cti.ole_phonepc.object.Et_Appeler() 
else
	v_suite = true 
end if


if v_suite then

		string numero_a_appeler
		
		if nb_zone = 1 then
			// une zone => on récup et on appele			
			numero_a_appeler = dw.getitemstring(dw.getrow(),zone[1])
		else
			// Y a plusieurs zone de téléphones ...
			// Dans laquelle y a t il le focus ??? (si nulle part, on prendra la première zone)
			
			// par défaut on prend la première
			numero_a_appeler = dw.getitemstring(dw.getrow(),zone[1])

			integer i 
			for i = 1 to nb_zone
				if dw.getcolumnname() = zone[i] then
					numero_a_appeler = dw.getitemstring(dw.getrow(),zone[i])
				end if
			next
			
		end if
			
		
		
		numero_a_appeler = espace(numero_a_appeler)
		
		numero_a_appeler =  trim(profilestring(dir_ini+inifile_orthokis,"CTI","numero_sortir",""))  + numero_a_appeler		
		
		if len(trim(numero_a_appeler)) >= 5 then
			
			// on ajoute "0" en dur comme préfixe
			
			if MessageBox("Confirmation","Vous allez appeler le N°"+numero_a_appeler+"~n~nConfirmez-vous ?",Question!,Yesno!,2) = 1 then

//				w_cti.appel_sortant = true
//				w_cti.st_sortant.visible = true
//				w_cti.cb_raccrocher.enabled = true
				w_cti.ole_phonepc.object.compose(numero_a_appeler)
				
			end if
		else
			MessageBox("ATTENTION !","Il n'y a pas de numéro de téléphone valide sur cette fiche !")
		end if
	else
		Messagebox("ATTENTION !","Votre ligne téléphonique est actuellement occupée !")
	end if

end event

