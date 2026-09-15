$PBExportHeader$w_rte.srw
$PBExportComments$RichPad RTE control
forward
global type w_rte from window
end type
type rte_3 from richtextedit within w_rte
end type
type rte_2 from richtextedit within w_rte
end type
type rte_1 from richtextedit within w_rte
end type
end forward

global type w_rte from window
integer y = 4
integer width = 4498
integer height = 2948
boolean titlebar = true
string menuname = "m_rte"
boolean controlmenu = true
long backcolor = 16777215
toolbaralignment toolbaralignment = alignatleft!
rte_3 rte_3
rte_2 rte_2
rte_1 rte_1
end type
global w_rte w_rte

type variables
String	is_FindNext, is_FileName = "Untitled"
Boolean	ib_HeadFoot, ib_DataSource
DataStore ids_Customer
struct_rte mes
end variables

forward prototypes
public function integer of_print ()
public function integer of_saveas ()
public function integer of_cut ()
public function integer of_copy ()
public function integer of_paste ()
public function integer of_delete ()
public function integer of_selectall ()
public function integer of_find ()
public function integer of_findnext ()
public function integer of_undo ()
public function integer of_printpreview ()
public function boolean of_isprintpreview ()
public function integer of_replace ()
public function integer of_send ()
public function integer of_setfind (string as_find)
public function integer of_new ()
public function boolean of_showhf (boolean ab_query)
public function integer of_open ()
public function boolean of_canundo ()
public function integer of_save ()
public function integer of_timedate ()
public subroutine of_insert_datafield (string as_column)
public subroutine of_menu (string nommenu)
public subroutine of_insert_texte (string as_texte)
end prototypes

public function integer of_print ();Return rte_1.print(1, "", True, True)

end function

public function integer of_saveas ();String	ls_File, ls_Path

ls_Path = is_FileName

If GetFileSaveName("Select File", ls_Path, ls_File, "rtf", "Rich Text (*.rtf), *.rtf") = 1 Then
	is_FileName = ls_Path

	Return This.of_save()
Else
	Return 0
End If

end function

public function integer of_cut ();Return rte_1.cut()

end function

public function integer of_copy ();Return rte_1.copy()

end function

public function integer of_paste ();Return rte_1.paste()

end function

public function integer of_delete ();Return rte_1.clear()

end function

public function integer of_selectall ();Return rte_1.selecttextall()

end function

public function integer of_find ();OpenWithParm(w_rte_find, rte_1)

Return 1

end function

public function integer of_findnext ();If is_FindNext = "" Then
	of_find()
Else
	rte_1.findnext()
End If

Return 0

end function

public function integer of_undo ();Return rte_1.Undo()

end function

public function integer of_printpreview ();Boolean		lb_Preview

if rte_1.ispreview() Then 
	lb_Preview = False
Else
	lb_Preview = True
End If

Return rte_1.preview(lb_Preview)

end function

public function boolean of_isprintpreview ();ids_customer.SetTransObject(SQLCA)
rte_1.DataSource(ids_customer)
Return rte_1.ispreview() 

end function

public function integer of_replace ();OpenWithParm(w_rte_replace, rte_1)

Return 1

end function

public function integer of_send ();mailSession mSes
mailMessage mMsg
mailReturnCode mRet
mailFileDescription mAttach

// Create a mail session.
This.Enabled = False

mSes = CREATE mailSession

// Log on to the session
mRet = mSes.mailLogon(mailNewSession!)
If mRet <> mailReturnSuccess! Then
	This.Enabled = True
	MessageBox("RichPad", "Logon to mail failed.")
	Return 0
End If

mAttach.filename = is_FileName

mMsg.AttachmentFile[1] = mAttach
mRet = mSes.mailAddress(mMsg)
If mRet <> mailReturnSuccess! Then
	MessageBox("RichPad", "Mail addressing failed.")
Else
	// Send the mail
	mRet = mSes.mailSend(mMsg)
End If

mSes.mailLogoff()

DESTROY mSes

This.Enabled = True

Return 1

end function

public function integer of_setfind (string as_find);is_FindNext = as_Find

Return 1

end function

public function integer of_new ();String	ls_File, ls_Path
Integer	li_RC

If rte_1.modified Then
	li_RC = MessageBox("Richpad", "The Text in " + is_FileName + &
								" has changed.~r~nDo you want to save the changes?", &
								Question!, YesNoCancel!)

	Choose Case li_RC
		Case 1
			This.of_save()
		Case 3
			Return 0
	End Choose
End If

// Display empty rte
rte_1.SetRedraw(False)

of_selectall()
of_delete()
is_FileName = "Untitled"
This.Title = "Untitled - Richpad"
rte_1.modified = False

rte_1.SetRedraw(True)

Return 1

end function

public function boolean of_showhf (boolean ab_query);If ab_Query Then Return ib_HeadFoot

If ib_HeadFoot Then
	ib_HeadFoot = False
Else
	ib_HeadFoot = True
End If

rte_1.showheadfoot(ib_HeadFoot)
rte_1.InputFieldBackColor = 16777215
rte_1.BackColor = 16777215

Return ib_HeadFoot

end function

public function integer of_open ();String	ls_File, ls_Path
Integer	li_RC

If rte_1.modified Then
	li_RC = MessageBox("Richpad", "Le Texte dans " + is_FileName + &
								"a changé.~r~nVoulez-vous enregistrer les changements?", &
								Question!, YesNoCancel!)

	Choose Case li_RC
		Case 1
			This.of_save()
		Case 3
			Return 0
	End Choose
End If

If GetFileOpenName("Select File", ls_Path, ls_File, "rtf", "Rich Text (*.rtF), *.rtf") = 1 Then
	is_FileName = ls_Path
	rte_1.insertdocument(is_FileName, True, FileTypeRichText!)
	This.Title = ls_File + " - Richpad"
	rte_1.modified = False
	
	rte_1.InputFieldNamesVisible = TRUE
	rte_1.InputFieldBackColor = 16777215
	rte_1.BackColor = 16777215

	Return 1
Else
	Return 0
End If

end function

public function boolean of_canundo ();Return rte_1.canundo()

end function

public function integer of_save ();If is_FileName = "Untitled" Then
	Return of_saveas()
Else
	rte_1.modified = False
	Return rte_1.savedocument(is_FileName, FileTypeRichText!)
End If
end function

public function integer of_timedate ();//DateTime	ldt_Now
//
//ldt_Now = DateTime(Today(), Now())
//
//rte_1.replacetext(String(ldt_Now, "mm/dd/yy hh:mm:ss"))
//
//Return 1
Date	ldt_Now

ldt_Now = Today()

rte_1.replacetext(String(ldt_Now, "dd/mm/yyyy"))

Return 1

end function

public subroutine of_insert_datafield (string as_column);// This function will insert a datafield into the current document.

// Determine if the DataStore has already been retrieved.
//If ids_Customer.RowCount() <= 0 Then
//	ids_Customer.SetTransObject(sqlca)
//	
//	If ids_Customer.Retrieve() <= 0 Then
//		Return
//	End If
//End If

// Insert the data field.
rte_1.inputfieldinsert(as_Column)

// Met une valeur au champ
rte_1.Inputfieldchangedata(as_Column,"??")

// Set the DataStore as the RTE's data source if not already done.
//If Not ib_DataSource Then
//	rte_1.datasource(ids_Customer)
//	ib_DataSource = True
//End If
//
end subroutine

public subroutine of_menu (string nommenu);//m_rte.m_edit.m_insertcustomerdatafield.Visible = FALSE
//m_rte.m_edit.m_insertchampdevis.Visible = FALSE
//m_rte.m_edit.m_insertchamprelance.Visible = FALSE
//m_rte.m_edit.m_insertchamphonoraire.Visible = FALSE
//m_rte.m_edit.m_insertchampremerciement.Visible = FALSE
//m_rte.m_edit.m_insertchamprendez.Visible = FALSE
//m_rte.m_edit.m_insertchamprecu.Visible = FALSE
//m_rte.m_edit.m_insertchampticket.Visible = FALSE

// On fonction du menu ou active / désactive les insertions de champs ...

CHOOSE CASE nommenu
	CASE ""
		m_rte.m_edit.m_insertcustomerdatafield.Visible = TRUE
	CASE "devis"
		m_rte.m_edit.m_insertchampdevis.Visible = TRUE
	CASE "relance"
		m_rte.m_edit.m_insertchamprelance.Visible = TRUE
	CASE "honoraire"
		m_rte.m_edit.m_insertchamphonoraire.Visible = TRUE
	CASE "remerciement"
		m_rte.m_edit.m_insertchampremerciement.Visible = TRUE
	CASE "rendez"
		m_rte.m_edit.m_insertchamprendez.Visible = TRUE
	CASE "recu"
		m_rte.m_edit.m_insertchamprecu.Visible = TRUE
	CASE "ticket"
		m_rte.m_edit.m_insertchampticket.Visible = TRUE
	CASE "ep"
		m_rte.m_edit.m_insertchampep.Visible = TRUE
END CHOOSE

end subroutine

public subroutine of_insert_texte (string as_texte);// This function will insert a texte into the current document.



// Insert the data field.
rte_1.replacetext(as_texte)



end subroutine

on w_rte.create
if this.MenuName = "m_rte" then this.MenuID = create m_rte
this.rte_3=create rte_3
this.rte_2=create rte_2
this.rte_1=create rte_1
this.Control[]={this.rte_3,&
this.rte_2,&
this.rte_1}
end on

on w_rte.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.rte_3)
destroy(this.rte_2)
destroy(this.rte_1)
end on

event open;centrer(this)


mes = message.PowerObjectParm


string entete, baspage
double bottom, left, right, top

  SELECT "param"."bottommargin",   
         "param"."rightmargin",   
         "param"."leftmargin",   
         "param"."topmargin"  
    INTO :bottom,   
         :right,   
         :left,   
         :top  
    FROM "param"  ;


ids_Customer = CREATE DataStore
ids_Customer.DataObject = mes.nom_dw

rte_1.insertdocument(mes.chemin, True, FileTypeRichText!)
is_FileName = mes.chemin

This.Title = mes.titre
This.Title = This.title + " (" + mes.chemin + " )"

rte_1.modified = False

rte_1.InputFieldsVisible = TRUE
rte_1.InputFieldNamesVisible = TRUE
rte_1.InputFieldBackColor = rgb(192, 192, 192)	// gris clair
rte_1.BackColor = couleur_blanche

rte_1.HeaderFooter = true

of_menu(mes.nom_menu)
IF mes.nom_menu = "entete" THEN
	m_rte.m_edit.m_showheadfoot.Visible = FALSE
ELSE
	m_rte.m_edit.m_showheadfoot.Visible = TRUE 
END IF


rte_1.BottomMargin = bottom / 100
rte_1.LeftMargin = left / 100
rte_1.RightMargin = right/ 100
rte_1.TopMargin = top / 100


ids_customer.SetTransObject(SQLCA)
ids_customer.insertRow(0)

this.backcolor = couleur_fond_fenetre


end event

event closequery;Integer	li_RC

If rte_1.modified Then
	li_RC = MessageBox("Richpad", "Le texte dans " + is_FileName + &
								" a changé.~r~nVoulez-vous enregistrer les changements?", &
								Question!, YesNoCancel!)

	Choose Case li_RC
		Case 1
			IF mes.chemin = "" THEN
				This.of_saveas ()
			ELSE	
				This.of_save()
			END IF	
			Return 0
		Case 2
			Return 0
		Case 3
			Return 1
	End Choose
End If

end event

event resize;rte_1.Resize(newwidth - (rte_1.X * 2), newheight - (rte_1.Y * 2))

//Pas de resize
//rte_1.Resize(newwidth - (rte_1.X * 2), newheight - (rte_1.Y * 2))


// Pas de center pour pouvoir agrandir la fenêtre en 800x600
//Centrer(this)
//rte_1.width = this.width - 100
//rte_1.height = this.height - 200
//
end event

type rte_3 from richtextedit within w_rte
boolean visible = false
integer x = 2331
integer y = 660
integer width = 494
integer height = 360
integer taborder = 20
long init_backcolor = 16777215
long init_inputfieldbackcolor = 16777215
end type

on rte_3.create
BackColor=16777215
InputFieldBackColor=16777215
end on

type rte_2 from richtextedit within w_rte
boolean visible = false
integer x = 2304
integer y = 236
integer width = 494
integer height = 360
integer taborder = 30
long init_backcolor = 16777215
long init_inputfieldbackcolor = 16777215
end type

on rte_2.create
BackColor=16777215
InputFieldBackColor=16777215
end on

type rte_1 from richtextedit within w_rte
integer x = 41
integer y = 28
integer width = 4384
integer height = 2708
integer taborder = 10
boolean init_hscrollbar = true
boolean init_vscrollbar = true
long init_backcolor = 16777215
boolean init_wordwrap = true
boolean init_tabsvisible = true
long init_inputfieldbackcolor = 16777215
boolean init_inputfieldsvisible = true
boolean init_inputfieldnamesvisible = true
boolean init_rulerbar = true
boolean init_tabbar = true
boolean init_toolbar = true
boolean init_headerfooter = true
boolean init_popmenu = true
integer init_undodepth = 100
long init_leftmargin = 10
long init_topmargin = 10
long init_rightmargin = 10
long init_bottommargin = 20
borderstyle borderstyle = stylelowered!
end type

on rte_1.create
HScrollBar=true
VScrollBar=true
HeaderFooter=true
InputFieldsVisible=true
PopMenu=true
RulerBar=true
TabBar=true
ToolBar=true
WordWrap=true
UndoDepth=100
LeftMargin=10
TopMargin=10
RightMargin=10
BottomMargin=20
BackColor=16777215
InputFieldBackColor=16777215
end on

