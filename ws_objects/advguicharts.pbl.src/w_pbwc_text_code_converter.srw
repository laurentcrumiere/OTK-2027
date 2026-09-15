$PBExportHeader$w_pbwc_text_code_converter.srw
forward
global type w_pbwc_text_code_converter from window
end type
type sle_1 from singlelineedit within w_pbwc_text_code_converter
end type
type st_1 from statictext within w_pbwc_text_code_converter
end type
type cb_1 from commandbutton within w_pbwc_text_code_converter
end type
type mle_1 from multilineedit within w_pbwc_text_code_converter
end type
end forward

global type w_pbwc_text_code_converter from window
integer width = 4754
integer height = 2272
boolean titlebar = true
string title = "Text code converter"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
sle_1 sle_1
st_1 st_1
cb_1 cb_1
mle_1 mle_1
end type
global w_pbwc_text_code_converter w_pbwc_text_code_converter

type variables
string  is_fullname, is_filename
string is_source_code, is_prototypes
string is_function_name
end variables

on w_pbwc_text_code_converter.create
this.sle_1=create sle_1
this.st_1=create st_1
this.cb_1=create cb_1
this.mle_1=create mle_1
this.Control[]={this.sle_1,&
this.st_1,&
this.cb_1,&
this.mle_1}
end on

on w_pbwc_text_code_converter.destroy
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.mle_1)
end on

type sle_1 from singlelineedit within w_pbwc_text_code_converter
integer y = 20
integer width = 1577
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
string text = "of_chart_bundle"
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_pbwc_text_code_converter
integer x = 3017
integer y = 52
integer width = 1367
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
alignment alignment = right!
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_pbwc_text_code_converter
integer x = 1627
integer y = 20
integer width = 402
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Selec file..."
end type

event clicked;int   li_fileid, li_ret
long ii,jj,li_fct_nb,kk
string ls_line,ls_file_content
boolean ib_min_file
n_cst_pbwc_string lnv_string
if GetFileOpenName ("Open", is_fullname, is_filename,   "all", "Text Files (*.*),*.*;","c:\") < 1 then return


is_function_name = sle_1.text
is_prototypes=""
is_source_code = ""

//CHECK if file is a min file or a standard file
li_fileid = FileOpen (is_fullname, linemode!)
li_ret = FileReadex (li_fileid, ls_line)
DO WHILE li_ret <> -100 and ib_min_file = false
	IF len(ls_line) > 200 then 		ib_min_file = TRUE
	li_ret = FileReadex (li_fileid, ls_line)
LOOP
FileClose (li_fileid)    
//converting javascript min files to standard files
IF ib_min_file THEN
	li_fileid = FileOpen (is_fullname, TextMode!)
	li_ret = FileReadex (li_fileid, ls_file_content)
	FileClose (li_fileid)   
	ls_file_content = lnv_string.of_globalreplace(ls_file_content,';',';~r~n')
	li_fileid = FileOpen(is_fullname+'.TXT',   TextMode!, Write!, LockWrite!, replace!)
	FileWriteEx(li_fileid, ls_file_content)
	FileClose (li_fileid)   
	is_fullname = is_fullname+'.TXT'
END IF



IF is_function_name = "" THEN is_function_name = "of_noname"

li_fileid = FileOpen (is_fullname, linemode!)
li_ret = FileReadex (li_fileid, ls_line)
DO WHILE li_ret <> -100
	ii++
	JJ++
	st_1.text = "Converting line "+string(ii)
	lnv_string.of_refglobalreplace(ls_line,"~~","~~~~'")
	lnv_string.of_refglobalreplace(ls_line,"'","~~'")
	lnv_string.of_refglobalreplace(ls_line,"~t","~~t")
	IF jj > 1000 THEN jj = 1
	
	IF jj = 1 THEN
		li_fct_nb++
		is_prototypes += "public subroutine "+is_function_name+"_"+string(li_fct_nb)+" (ref string as_code)~r~n"
		is_source_code += "public subroutine "+is_function_name+"_"+string(li_fct_nb)+" (ref string as_code);~r~n"
	END IF
	
	is_source_code += "as_code+='" +ls_line+"~~r~~n'~r~n"
	
	li_ret = FileReadex (li_fileid, ls_line)
	
	IF jj = 1000  or li_ret = -100 THEN 
		is_source_code += "end subroutine~r~n"
	END IF
LOOP
FileClose (li_fileid)    
//main function
is_prototypes += "public function integer "+is_function_name+" (string as_filename)~r~n"
is_source_code += "public function integer  "+is_function_name+" (string as_filename);is_source=''~r~n"
FOR kk = 1 to li_fct_nb
	is_source_code += is_function_name +"_"+string(kk)+"(is_source)~r~n"
NEXT
is_source_code += "return of_write_file(as_filename)~r~n"
is_source_code +="end function~r~n"



mle_1.text = is_prototypes + "~r~n~r~n"+ is_source_code
clipboard(mle_1.text)
end event

type mle_1 from multilineedit within w_pbwc_text_code_converter
integer y = 176
integer width = 4398
integer height = 2076
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean hscrollbar = true
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

