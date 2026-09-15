$PBExportHeader$w_limitations.srw
forward
global type w_limitations from w_fenetre_arakis
end type
type pb_fermer from uo_picturebutton_390x120_fermer within w_limitations
end type
type dw_liste from datawindow within w_limitations
end type
end forward

global type w_limitations from w_fenetre_arakis
boolean visible = false
integer width = 2811
string title = ""
boolean minbox = false
boolean maxbox = false
windowtype windowtype = child!
pb_fermer pb_fermer
dw_liste dw_liste
end type
global w_limitations w_limitations

type variables



end variables

forward prototypes
public subroutine maj ()
end prototypes

public subroutine maj ();
if not isvalid(w_agenda) then
	Messagebox("ATTENTION","L'Agenda n'est plus ouvert !")
else

	
	// Dates de la semaine
	date date_cal
	time time_cal
	date d1, d2
	date d1_mois, d2_mois
	
	w_agenda.cal.getvalue(date_cal, time_cal)
	
	d1 = relativedate(date_cal,2 - daynumber(date_cal))
	
	// Dimanche
	d2 = relativedate(d1,6)

	this.title = "Disponibilités du " + string(d1) + " au " + string(d2) 
	
	long lig, tot
	long v_nb_rdv_semaine, v_nb_rdv_mois
	string prati1, prati2
	
	string v_type_rdv, v_bloquant
	
	if not multi or w_agenda.tous = "N" then
		prati1 = w_agenda.dw_praticien.gettext()
		prati2 = prati1
	else
		prati1 = ""
		prati2 = "ZZZZZZ"
	end if
	
	v_type_rdv = dw_liste.getItemString(lig, "type_rdv_code")
	v_bloquant = dw_liste.getItemString(lig, "type_rdv_nb_rdv_bloquant")
	

	// Compta des rdv du mois
	d1_mois = date( year(d1),  month(d1), 1)
	d2_mois = fin_mois( d1 )

	dw_liste.retrieve(prati1, prati2, d1, d2, d1_mois, d2_mois)
	
	if dw_liste.rowcount() = 0 then
		MessageBox("ATTENTION","Aucun type de rendez-vous ne fait l'objet de limitation !")
		close(this)
	end if
	

	
end if
end subroutine

on w_limitations.create
int iCurrent
call super::create
this.pb_fermer=create pb_fermer
this.dw_liste=create dw_liste
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_fermer
this.Control[iCurrent+2]=this.dw_liste
end on

on w_limitations.destroy
call super::destroy
destroy(this.pb_fermer)
destroy(this.dw_liste)
end on

event open;call super::open;
colore_datawindow(dw_liste)
dw_liste.settransobject(sqlca)
maj()


end event

event close;call super::close;

// Mémorisation de l'emplacement de la fenêtre pour la prochaine fois

setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","w_limitations_x",string(UnitsToPixels( this.x, XUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","w_limitations_y",string(UnitsToPixels( this.y, YUnitsToPixels!)))
setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","w_limitations_width", string(this.width))
setprofilestring(dir_ini+inifile_orthokis,"rendez-vous","w_limitations_height", string(this.height))


end event

event resize;call super::resize;

pb_fermer.y = this.height - 320

dw_liste.height = pb_fermer.y - dw_liste.y - 40
end event

type p_fond from w_fenetre_arakis`p_fond within w_limitations
end type

type pb_fermer from uo_picturebutton_390x120_fermer within w_limitations
integer x = 1074
integer y = 1560
integer width = 411
integer height = 152
integer taborder = 10
boolean bringtotop = true
end type

type dw_liste from datawindow within w_limitations
string tag = "brush"
integer x = 14
integer y = 8
integer width = 2688
integer height = 1508
integer taborder = 10
boolean bringtotop = true
string dataobject = "dw_limitations"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

