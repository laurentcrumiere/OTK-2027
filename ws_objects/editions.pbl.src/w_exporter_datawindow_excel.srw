$PBExportHeader$w_exporter_datawindow_excel.srw
forward
global type w_exporter_datawindow_excel from w_fenetre_arakis
end type
type pb_exporter from uo_picturebutton_390x120 within w_exporter_datawindow_excel
end type
type pb_annuler from uo_picturebutton_390x120 within w_exporter_datawindow_excel
end type
type sle_dossier from singlelineedit within w_exporter_datawindow_excel
end type
type pb_15 from picturebutton within w_exporter_datawindow_excel
end type
type st_1 from statictext within w_exporter_datawindow_excel
end type
type st_2 from statictext within w_exporter_datawindow_excel
end type
type sle_fichier from singlelineedit within w_exporter_datawindow_excel
end type
type cbx_pdf_natif from checkbox within w_exporter_datawindow_excel
end type
end forward

global type w_exporter_datawindow_excel from w_fenetre_arakis
integer width = 2437
integer height = 808
string title = "Export de la liste au format ..."
boolean minbox = false
boolean maxbox = false
boolean resizable = false
windowtype windowtype = response!
boolean center = true
pb_exporter pb_exporter
pb_annuler pb_annuler
sle_dossier sle_dossier
pb_15 pb_15
st_1 st_1
st_2 st_2
sle_fichier sle_fichier
cbx_pdf_natif cbx_pdf_natif
end type
global w_exporter_datawindow_excel w_exporter_datawindow_excel

type variables


datawindow dw_a_exporter
string v_type_a_exporter, v_extension
end variables

on w_exporter_datawindow_excel.create
int iCurrent
call super::create
this.pb_exporter=create pb_exporter
this.pb_annuler=create pb_annuler
this.sle_dossier=create sle_dossier
this.pb_15=create pb_15
this.st_1=create st_1
this.st_2=create st_2
this.sle_fichier=create sle_fichier
this.cbx_pdf_natif=create cbx_pdf_natif
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=this.pb_exporter
this.Control[iCurrent+2]=this.pb_annuler
this.Control[iCurrent+3]=this.sle_dossier
this.Control[iCurrent+4]=this.pb_15
this.Control[iCurrent+5]=this.st_1
this.Control[iCurrent+6]=this.st_2
this.Control[iCurrent+7]=this.sle_fichier
this.Control[iCurrent+8]=this.cbx_pdf_natif
end on

on w_exporter_datawindow_excel.destroy
call super::destroy
destroy(this.pb_exporter)
destroy(this.pb_annuler)
destroy(this.sle_dossier)
destroy(this.pb_15)
destroy(this.st_1)
destroy(this.st_2)
destroy(this.sle_fichier)
destroy(this.cbx_pdf_natif)
end on

event open;call super::open;

// La dw est passée en param
dw_a_exporter = Message.PowerObjectParm

// Param_win[1] contient le type de fichier d'export

v_type_a_exporter = Param_win[1]
sle_fichier.text = dw_a_exporter.object.datawindow.print.DocumentName

choose case v_type_a_exporter
	case "E"
		v_extension = ".xls"
		this.title = "Export de la liste au format Excel"
	case "P"
		v_extension = ".pdf"
		this.title = "Export de la liste au format PDF"
		//cbx_pdf_natif.visible = true
	case "E+"
		v_extension = ".xls"
		this.title = "Export de la liste au format Excel avec éléments affichés"
end choose


if len(trim(sle_fichier.text)) = 0 then
	sle_fichier.text = "Liste exportée" + v_extension
else
	sle_fichier.text = trim(sle_fichier.text) + v_extension
end if
end event

type p_fond from w_fenetre_arakis`p_fond within w_exporter_datawindow_excel
end type

type pb_exporter from uo_picturebutton_390x120 within w_exporter_datawindow_excel
integer x = 1248
integer y = 552
integer width = 530
integer height = 152
integer taborder = 10
boolean bringtotop = true
string text = "&Exporter"
string iconname = "ACTIONS_Exporter.png"
end type

event clicked;call super::clicked;string fichier_destination
integer res

fichier_destination = trim(trim(sle_dossier.text)) + trim(sle_fichier.text)

Choose Case v_type_a_exporter
	case "E"
		res = dw_a_exporter.saveas(fichier_destination , Excel8! , true  )
	case "P"
//		if cbx_pdf_natif.checked then
//			dw_a_exporter.Object.DataWindow.Export.PDF.NativePDF.UsePrintSpec = 'Yes'
//			dw_a_exporter.Object.DataWindow.Export.PDF.Method = NativePDF!
//			dw_a_exporter.Object.DataWindow.Export.PDF.NativePDF.PDFStandard = 1 //PDF/A-1a
//		end if

		res = dw_a_exporter.saveas(fichier_destination , Pdf! , true  )
		
	case "E+"
		res = dw_a_exporter.savedisplayeddataas(fichier_destination , Excel8!   )
end choose

if FileExists(fichier_destination) then
	Messagebox("ATTENTION","L'export a été réalisé avec succés !")
else
	Messagebox("ATTENTION","Une erreur est survenue. L'export a échoué.")
end if

close(parent)
end event

type pb_annuler from uo_picturebutton_390x120 within w_exporter_datawindow_excel
integer x = 558
integer y = 552
integer width = 530
integer height = 152
integer taborder = 20
boolean bringtotop = true
string text = "&Annuler"
string iconname = "ACTIONS_abandonner.png"
end type

event clicked;call super::clicked;

close(parent)
end event

type sle_dossier from singlelineedit within w_exporter_datawindow_excel
integer x = 14
integer y = 160
integer width = 2309
integer height = 96
integer taborder = 20
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
string text = "c:\"
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

type pb_15 from picturebutton within w_exporter_datawindow_excel
integer x = 2080
integer y = 8
integer width = 151
integer height = 128
integer taborder = 10
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_explorer.png"
alignment htextalign = left!
end type

event clicked;string repertoire
repertoire = sle_dossier.text
sle_dossier.text = get_repertoire("Sélectionnez le dossier pour l'exportation de la liste ...",repertoire)

end event

type st_1 from statictext within w_exporter_datawindow_excel
integer x = 14
integer y = 64
integer width = 544
integer height = 80
boolean bringtotop = true
integer textsize = -11
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Emplacement :"
end type

type st_2 from statictext within w_exporter_datawindow_excel
integer x = 14
integer y = 296
integer width = 526
integer height = 80
boolean bringtotop = true
integer textsize = -11
fontcharset fontcharset = ansi!
string facename = "Arial"
long backcolor = 553648127
string text = "Nom du Fichier :"
end type

type sle_fichier from singlelineedit within w_exporter_datawindow_excel
integer x = 14
integer y = 400
integer width = 2309
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long backcolor = 16777215
integer limit = 200
borderstyle borderstyle = stylelowered!
end type

type cbx_pdf_natif from checkbox within w_exporter_datawindow_excel
boolean visible = false
integer x = 1911
integer y = 576
integer width = 402
integer height = 80
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PDF Natif"
end type

