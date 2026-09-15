$PBExportHeader$w_dumu_export.srw
forward
global type w_dumu_export from w_fenetre_arakis
end type
type cb_1 from uo_picturebutton_390x120_fermer within w_dumu_export
end type
type cb_3 from uo_picturebutton_390x120 within w_dumu_export
end type
type dw_patients from datawindow within w_dumu_export
end type
type dw_rdv from datawindow within w_dumu_export
end type
type st_1 from statictext within w_dumu_export
end type
type em_date from editmask within w_dumu_export
end type
type st_patients from statictext within w_dumu_export
end type
type st_rdv from statictext within w_dumu_export
end type
end forward

global type w_dumu_export from w_fenetre_arakis
integer width = 2501
integer height = 1200
string title = "Placements Invisalign"
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
cb_1 cb_1
cb_3 cb_3
dw_patients dw_patients
dw_rdv dw_rdv
st_1 st_1
em_date em_date
st_patients st_patients
st_rdv st_rdv
end type
global w_dumu_export w_dumu_export

type variables

integer i_target = 80
string s_code_rdv = "22"
date d_date_du_jour
end variables

forward prototypes
public subroutine convert_tab (string as_file)
end prototypes

public subroutine convert_tab (string as_file);
string ls_data
long ll_file

// 2. Lire le fichier généré
ll_file = FileOpen(as_file, StreamMode!, Read!, Shared!)
FileReadEx(ll_file, ls_data)
FileClose(ll_file)

// 3. Remplacer les tabulations (~t) par des points-virgules (;)
// Note : Si vous n'avez pas de fonction ReplaceAll, vous pouvez en créer une simple
ls_data = gfx_tout_remplacer(ls_data, "~t", ";")

// 4. Réécrire le fichier
ll_file = FileOpen(as_file, StreamMode!, Write!, LockWrite!, Replace!)
FileWriteEx(ll_file, ls_data)
FileClose(ll_file)
end subroutine

on w_dumu_export.create
int iCurrent
call super::create
this.cb_1=create cb_1
this.cb_3=create cb_3
this.dw_patients=create dw_patients
this.dw_rdv=create dw_rdv
this.st_1=create st_1
this.em_date=create em_date
this.st_patients=create st_patients
this.st_rdv=create st_rdv
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.cb_1
this.Control[iCurrent+2]=this.cb_3
this.Control[iCurrent+3]=this.dw_patients
this.Control[iCurrent+4]=this.dw_rdv
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.em_date
this.Control[iCurrent+7]=this.st_patients
this.Control[iCurrent+8]=this.st_rdv
end on

on w_dumu_export.destroy
call super::destroy
destroy(this.cb_1)
destroy(this.cb_3)
destroy(this.dw_patients)
destroy(this.dw_rdv)
destroy(this.st_1)
destroy(this.em_date)
destroy(this.st_patients)
destroy(this.st_rdv)
end on

event open;call super::open;dw_patients.settransobject(sqlca)
dw_rdv.settransobject(sqlca)

em_date.text = "01/01/"  + string(year(today()))




end event

type p_fond from w_fenetre_arakis`p_fond within w_dumu_export
end type

type cb_1 from uo_picturebutton_390x120_fermer within w_dumu_export
integer x = 1317
integer y = 896
integer width = 517
integer taborder = 10
boolean bringtotop = true
end type

type cb_3 from uo_picturebutton_390x120 within w_dumu_export
integer x = 613
integer y = 884
integer width = 512
integer height = 132
integer taborder = 20
boolean bringtotop = true
string text = "&Exporter"
string iconname = "ACTIONS_enregistrer.png"
end type

event clicked;call super::clicked;date ld_date 

// 1. On définit le point-virgule comme délimiteur pour l'export CSV
//dw_patients.Object.DataWindow.Export.CSV.Delimiter = ";"
//dw_rdv.Object.DataWindow.Export.CSV.Delimiter = ";"

//// 2. On peut aussi forcer l'utilisation des guillemets pour les textes (optionnel)
//dw_patients.Object.DataWindow.Export.CSV.Quote = '"'
//dw_rdv.Object.DataWindow.Export.CSV.Quote = '"'

string ls_patient_file, ls_rdv_file
long lig , tot

ls_patient_file = dir_ini + "patients_" + string(today(), "yyyymmdd") + ".xls"
ls_rdv_file = dir_ini + "rdv_" + string(today(), "yyyymmdd")+ ".xls"

ld_date = date(em_date.text)
dw_patients.retrieve(ld_date)
tot = dw_patients.rowcount()
for lig = 1 to tot
	yield()
	st_patients.text = string(lig) + " / " + string(tot)
	dw_patients.setitem(lig, "numero_serie", SERIAL)
next
	
dw_patients.SaveAs(ls_patient_file, Excel!, True, EncodingUTF8!)
	


dw_rdv.settransobject(sqlca)
dw_rdv.retrieve(ld_date)
tot = dw_rdv.rowcount()
for lig = 1 to dw_rdv.rowcount()
	yield()
	st_rdv.text = string(lig) + " / " + string(tot)
	dw_rdv.setitem(lig, "numero_serie", SERIAL)
next
dw_rdv.saveas(ls_rdv_file   , Excel!, true, EncodingUTF8! )

end event

type dw_patients from datawindow within w_dumu_export
integer x = 466
integer y = 272
integer width = 686
integer height = 400
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "dw_dumu_export_patients"
boolean border = false
boolean livescroll = true
end type

type dw_rdv from datawindow within w_dumu_export
integer x = 1376
integer y = 324
integer width = 686
integer height = 400
integer taborder = 30
boolean bringtotop = true
string title = "none"
string dataobject = "dw_dumu_export_rdv"
boolean border = false
boolean livescroll = true
end type

type st_1 from statictext within w_dumu_export
integer x = 311
integer y = 128
integer width = 475
integer height = 64
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 553648127
string text = "Modifiés depuis : "
boolean focusrectangle = false
end type

type em_date from editmask within w_dumu_export
integer x = 873
integer y = 124
integer width = 475
integer height = 112
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean border = false
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yyyy"
boolean spin = true
end type

type st_patients from statictext within w_dumu_export
integer x = 197
integer y = 780
integer width = 402
integer height = 100
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

type st_rdv from statictext within w_dumu_export
integer x = 1490
integer y = 756
integer width = 402
integer height = 92
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
boolean focusrectangle = false
end type

