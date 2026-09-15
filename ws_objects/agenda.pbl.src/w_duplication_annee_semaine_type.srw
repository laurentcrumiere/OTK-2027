$PBExportHeader$w_duplication_annee_semaine_type.srw
forward
global type w_duplication_annee_semaine_type from window
end type
type em_annee2 from editmask within w_duplication_annee_semaine_type
end type
type em_annee1 from editmask within w_duplication_annee_semaine_type
end type
type pb_ok from uo_picturebutton_390x120 within w_duplication_annee_semaine_type
end type
type pb_annuler from uo_picturebutton_390x120 within w_duplication_annee_semaine_type
end type
type st_2 from statictext within w_duplication_annee_semaine_type
end type
type st_1 from statictext within w_duplication_annee_semaine_type
end type
end forward

global type w_duplication_annee_semaine_type from window
integer width = 2277
integer height = 976
string title = "Duplication d~'une Année de Semaines Types"
windowtype windowtype = response!
long backcolor = 12639424
em_annee2 em_annee2
em_annee1 em_annee1
pb_ok pb_ok
pb_annuler pb_annuler
st_2 st_2
st_1 st_1
end type
global w_duplication_annee_semaine_type w_duplication_annee_semaine_type

type variables


string praticien
end variables

on w_duplication_annee_semaine_type.create
this.em_annee2=create em_annee2
this.em_annee1=create em_annee1
this.pb_ok=create pb_ok
this.pb_annuler=create pb_annuler
this.st_2=create st_2
this.st_1=create st_1
this.Control[]={this.em_annee2,&
this.em_annee1,&
this.pb_ok,&
this.pb_annuler,&
this.st_2,&
this.st_1}
end on

on w_duplication_annee_semaine_type.destroy
destroy(this.em_annee2)
destroy(this.em_annee1)
destroy(this.pb_ok)
destroy(this.pb_annuler)
destroy(this.st_2)
destroy(this.st_1)
end on

event open;call super::open;


centrer(this)

em_annee1.text = param_win[1]
em_annee2.text = string ( long (em_annee1.text) + 1 )



praticien = param_win[2]


end event

type em_annee2 from editmask within w_duplication_annee_semaine_type
integer x = 928
integer y = 508
integer width = 297
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy"
boolean spin = true
end type

type em_annee1 from editmask within w_duplication_annee_semaine_type
integer x = 928
integer y = 208
integer width = 297
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
string text = "none"
alignment alignment = center!
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "yyyy"
boolean spin = true
end type

type pb_ok from uo_picturebutton_390x120 within w_duplication_annee_semaine_type
integer x = 1102
integer y = 728
integer taborder = 30
string text = "&Ok"
end type

event clicked;call super::clicked;

if em_annee1.text = em_annee2.text then
	Messagebox("ATTENTION !","Vous avez indiqué 2 fois la même année !")
else
	If messagebox("ATTENTION !","Confirmez-vous la duplication ?~n~n(Si des affections ont été faites pour ce praticien pour l'année "+""+" elles seront effacées)",Question!,Yesno!,2) = 1 then
	
	
			long annee1, annee2
			
			annee1 = long(em_annee1.text)
			annee2 = long(em_annee2.text)
			

			//On efface le planning pour l'année et le praticien choisi avant de sauvegarder
			//-------------------------------------------------------------
			DELETE FROM Affectation_semaine_type 
			WHERE annee = :annee2
			AND praticien=:praticien;
			commit;

		
			INSERT INTO Affectation_semaine_type (annee,numero_semaine_annee,numero_semaine_type,praticien)
			SELECT :annee2, numero_semaine_annee,numero_semaine_type,praticien from Affectation_semaine_type where annee = :annee1 and praticien = :praticien ;
			
			
			
			if sqlca.sqlcode =0 then
				COMMIT;
				Messagebox("INFORMATION","La duplication a été effectuée avec succès !")
				close(parent)
			else
				Messagebox("ATTENTION","Erreur dans la duplication : "+sqlca.sqlerrtext)
				rollback ;
			end if

	end if
end if
end event

type pb_annuler from uo_picturebutton_390x120 within w_duplication_annee_semaine_type
integer x = 585
integer y = 728
integer taborder = 20
string text = "&Annuler"
boolean originalsize = false
end type

event clicked;call super::clicked;

close(parent)

end event

type st_2 from statictext within w_duplication_annee_semaine_type
integer x = 763
integer y = 360
integer width = 622
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Vers l~'année"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_1 from statictext within w_duplication_annee_semaine_type
integer y = 60
integer width = 2153
integer height = 88
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
string text = "Vous allez dupliquer les affectation de semaines types de l~'année"
alignment alignment = center!
boolean focusrectangle = false
end type

