$PBExportHeader$uov_pbwc_pb_graph_ancestor.sru
forward
global type uov_pbwc_pb_graph_ancestor from userobject
end type
type gr_pbwc from uov_pbwc_pb_graph within uov_pbwc_pb_graph_ancestor
end type
type ole_ie_graph from uov_pbwc_ie_graph within uov_pbwc_pb_graph_ancestor
end type
end forward

global type uov_pbwc_pb_graph_ancestor from userobject
integer width = 1934
integer height = 1356
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
event resize pbm_size
gr_pbwc gr_pbwc
ole_ie_graph ole_ie_graph
end type
global uov_pbwc_pb_graph_ancestor uov_pbwc_pb_graph_ancestor

type variables
graxis category 
graxis series 
graxis values 
grdispattr legenddispattr 
grdispattr piedispattr 
grdispattr titledispattr 
grgraphtype graphtype 
grlegendtype legend 
grsorttype categorysort 
grsorttype seriessort 
integer depth 
integer elevation 
integer overlappercent 
integer perspective 
integer rotation 
integer spacing 
long shadecolor 
string title 

end variables

forward prototypes
public function integer addcategory (readonly date c)
public function integer addcategory ( readonly datetime c ) 
public function integer addcategory ( readonly double c )  
public function integer addcategory ( readonly string c ) 
public function integer addcategory ( readonly time c )  
public function long adddata ( integer s, readonly date v ) 
public function long adddata ( integer s, readonly date v, readonly date c ) 
public function long adddata ( integer s, readonly date v, readonly datetime c ) 
public function long adddata ( integer s, readonly date v, readonly double c ) 
public function long adddata ( integer s, readonly date v, readonly string c ) 
public function long adddata ( integer s, readonly date v, readonly time c )  
public function long adddata ( integer s, readonly datetime v ) 
public function long adddata ( integer s, readonly datetime v, readonly date c )  
public function long adddata ( integer s, readonly datetime v, readonly datetime c ) 
public function long adddata ( integer s, readonly datetime v, readonly double c )  
public function long adddata ( integer s, readonly datetime v, readonly string c )  
public function long adddata ( integer s, readonly datetime v, readonly time c ) 
public function long adddata ( integer s, readonly double v )  
public function long adddata ( integer s, readonly double v, readonly date c )  
public function long adddata ( integer s, readonly double v, readonly datetime c )  
public function long adddata ( integer s, readonly double v, readonly double c ) 
public function long adddata ( integer s, readonly double v, readonly string c )  
public function long adddata ( integer s, readonly double v, readonly time c ) 
public function long adddata ( integer s, readonly string v )  
public function long adddata ( integer s, readonly string v, readonly date c )  
public function long adddata ( integer s, readonly string v, readonly datetime c ) 
public function long adddata ( integer s, readonly string v, readonly double c ) 
public function long adddata ( integer s, readonly string v, readonly string c ) 
public function long adddata ( integer s, readonly string v, readonly time c ) 
public function long adddata ( integer s, readonly time v )  
public function long adddata ( integer s, readonly time v, readonly date c )  
public function long adddata ( integer s, readonly time v, readonly datetime c )  
public function long adddata ( integer s, readonly time v, readonly double c ) 
public function long adddata ( integer s, readonly time v, readonly string c )  
public function long adddata ( integer s, readonly time v, readonly time c )  
public function integer addseries ( string s )  
public function integer categorycount ( )  
public function string categoryname ( integer c ) 
public function integer datacount ( string s )  
public function integer deletecategory ( readonly date c )  
public function integer deletecategory ( readonly datetime c )  
public function integer deletecategory ( readonly double c ) 
public function integer deletecategory ( readonly string c ) 
public function integer deletecategory ( readonly time c ) 
public function integer deletedata ( integer s, integer i )  
public function integer deleteseries ( string s )  
public function integer findcategory ( readonly date c )  
public function integer findcategory ( readonly datetime c )  
public function integer findcategory ( readonly double c )  
public function integer findcategory ( readonly string c )  
public function integer findcategory ( readonly time c )  
public function integer findseries ( string s )  
public function double getdata ( integer s, integer i ) 
public function integer getdata ( integer s, integer i, grdatatype ay ) 
public function integer getdatalabelling ( integer s, integer i, ref boolean v ) 
public function integer getdatapieexplode ( integer s, integer i, ref integer p )  
public function integer getdatastyle ( integer s, integer i, grcolortype c, ref long v ) 
public function integer getdatastyle ( integer s, integer i, ref fillpattern p )  
public function integer getdatastyle ( integer s, integer i, ref grsymboltype m )  
public function integer getdatastyle ( integer s, integer i, ref linestyle l ) 
public function integer getdatastyle ( integer s, integer i, ref linestyle l, ref integer w ) 
public function integer getdatatransparency ( integer s, integer i, ref integer v ) 
public function integer getdatavalue ( integer s, integer i, ref date v )  
public function integer getdatavalue ( integer s, integer i, ref date v, grdatatype ay )  
public function integer getdatavalue ( integer s, integer i, ref datetime v ) 
public function integer getdatavalue ( integer s, integer i, ref datetime v, grdatatype ay )  
public function integer getdatavalue ( integer s, integer i, ref double v )  
public function integer getdatavalue ( integer s, integer i, ref double v, grdatatype ay ) 
public function integer getdatavalue ( integer s, integer i, ref string v )  
public function integer getdatavalue ( integer s, integer i, ref string v, grdatatype ay )  
public function integer getdatavalue ( integer s, integer i, ref time v ) 
public function integer getdatavalue ( integer s, integer i, ref time v, grdatatype ay ) 
public function integer getserieslabelling ( string s, ref boolean v )  
public function integer getseriesstyle ( string s, grcolortype c, ref long v )  
public function integer getseriesstyle ( string s, ref boolean o )  
public function integer getseriesstyle ( string s, ref fillpattern p )  
public function integer getseriesstyle ( string s, ref grsymboltype m )  
public function integer getseriesstyle ( string s, ref linestyle l ) 
public function integer getseriesstyle ( string s, ref linestyle l, ref integer w ) 
public function integer getseriestransparency ( string s, ref integer v ) 
public function long importclipboard ( )  
public function long importclipboard (string s ) 
public function long importclipboard ( saveastype t, long  startrow )  
public function long importclipboard ( saveastype t, long  startrow , long endrow) 
public function long importclipboard ( saveastype t , long  startrow , long endrow, long startcolumn) 
public function long importclipboard (string s, saveastype t, long  startrow )  
public function long importclipboard (string s, saveastype t, long  startrow , long endrow) 
public function long importclipboard (string s, saveastype t , long  startrow , long endrow, long startcolumn)  

public function long importfile ( saveastype t, string f )  
public function long importfile ( string f ) 
public function long importfile ( saveastype t, string f,long  startrow )  
public function long importfile ( string f ,long  startrow ) 
public function long importfile ( saveastype t, string f,long  startrow , long endrow)  
public function long importfile ( string f ,long  startrow, long endrow )  
public function long importfile ( saveastype t, string f,long  startrow , long endrow, long startcolumn)  
public function long importfile ( string f ,long  startrow, long endrow, long startcolumn ) 

public function long importstring ( saveastype t, string s )  
public function long importstring ( string s ) 
public function long importstring ( string s ,long  startrow) 
public function long importstring ( string s ,long  startrow, long endrow)  
public function long importstring ( string s ,long  startrow, long endrow, long startcolumn)  
public function long importstring (saveastype t, string s ,long  startrow)   
public function long importstring (saveastype t, string s ,long  startrow, long endrow) 
public function long importstring (saveastype t, string s ,long  startrow, long endrow, long startcolumn) 

public function integer insertcategory ( readonly date c, integer i )  
public function integer insertcategory ( readonly datetime c, integer i ) 
public function integer insertcategory ( readonly double c, integer i ) 
public function integer insertcategory ( readonly string c, integer i ) 
public function integer insertcategory ( readonly time c, integer i )  
public function long insertdata ( integer s, integer i, readonly date v )
public function long insertdata ( integer s, integer i, readonly date v, readonly date c ) 
public function long insertdata ( integer s, integer i, readonly date v, readonly datetime c ) 
public function long insertdata ( integer s, integer i, readonly date v, readonly double c ) 
public function long insertdata ( integer s, integer i, readonly date v, readonly string c ) 
public function long insertdata ( integer s, integer i, readonly date v, readonly time c ) 
public function long insertdata ( integer s, integer i, readonly datetime v )  
public function long insertdata ( integer s, integer i, readonly datetime v, readonly date c )  
public function long insertdata ( integer s, integer i, readonly datetime v, readonly datetime c )  
public function long insertdata ( integer s, integer i, readonly datetime v, readonly double c ) 
public function long insertdata ( integer s, integer i, readonly datetime v, readonly string c )
public function long insertdata ( integer s, integer i, readonly datetime v, readonly time c ) 
public function long insertdata ( integer s, integer i, readonly double v )  
public function long insertdata ( integer s, integer i, readonly double v, readonly date c ) 
public function long insertdata ( integer s, integer i, readonly double v, readonly datetime c ) 
public function long insertdata ( integer s, integer i, readonly double v, readonly double c )
public function long insertdata ( integer s, integer i, readonly double v, readonly string c )  
public function long insertdata ( integer s, integer i, readonly double v, readonly time c )  
public function long insertdata ( integer s, integer i, readonly string v ) 
public function long insertdata ( integer s, integer i, readonly string v, readonly date c ) 
public function long insertdata ( integer s, integer i, readonly string v, readonly datetime c )  
public function long insertdata ( integer s, integer i, readonly string v, readonly double c )  
public function long insertdata ( integer s, integer i, readonly string v, readonly string c )   
public function long insertdata ( integer s, integer i, readonly string v, readonly time c )   
public function long insertdata ( integer s, integer i, readonly time v )  
public function long insertdata ( integer s, integer i, readonly time v, readonly date c )  
public function long insertdata ( integer s, integer i, readonly time v, readonly datetime c )  
public function long insertdata ( integer s, integer i, readonly time v, readonly double c )  
public function long insertdata ( integer s, integer i, readonly time v, readonly string c ) 
public function long insertdata ( integer s, integer i, readonly time v, readonly time c )  
public function integer insertseries ( string n, integer i ) 
public function integer modifydata ( integer s, integer i, readonly date v )  
public function integer modifydata ( integer s, integer i, readonly date v, readonly date c )  
public function integer modifydata ( integer s, integer i, readonly date v, readonly datetime c )  
public function integer modifydata ( integer s, integer i, readonly date v, readonly double c )  
public function integer modifydata ( integer s, integer i, readonly date v, readonly string c )   
public function integer modifydata ( integer s, integer i, readonly date v, readonly time c )  
public function integer modifydata ( integer s, integer i, readonly datetime v )  
public function integer modifydata ( integer s, integer i, readonly datetime v, readonly date c ) 
public function integer modifydata ( integer s, integer i, readonly datetime v, readonly datetime c ) 
public function integer modifydata ( integer s, integer i, readonly datetime v, readonly double c ) 
public function integer modifydata ( integer s, integer i, readonly datetime v, readonly string c ) 
public function integer modifydata ( integer s, integer i, readonly datetime v, readonly time c )
public function integer modifydata ( integer s, integer i, readonly double v )  
public function integer modifydata ( integer s, integer i, readonly double v, readonly date c ) 
public function integer modifydata ( integer s, integer i, readonly double v, readonly datetime c )  
public function integer modifydata ( integer s, integer i, readonly double v, readonly double c ) 
public function integer modifydata ( integer s, integer i, readonly double v, readonly string c )
public function integer modifydata ( integer s, integer i, readonly double v, readonly time c )
public function integer modifydata ( integer s, integer i, readonly string v )  
public function integer modifydata ( integer s, integer i, readonly string v, readonly date c )   
public function integer modifydata ( integer s, integer i, readonly string v, readonly datetime c )
public function integer modifydata ( integer s, integer i, readonly string v, readonly double c )
public function integer modifydata ( integer s, integer i, readonly string v, readonly string c )
public function integer modifydata ( integer s, integer i, readonly string v, readonly time c )  
public function integer modifydata ( integer s, integer i, readonly time v ) 
public function integer modifydata ( integer s, integer i, readonly time v, readonly date c )  
public function integer modifydata ( integer s, integer i, readonly time v, readonly datetime c )  
public function integer modifydata ( integer s, integer i, readonly time v, readonly double c ) 
public function integer modifydata ( integer s, integer i, readonly time v, readonly string c )  
public function integer modifydata ( integer s, integer i, readonly time v, readonly time c ) 
public function grobjecttype objectatpointer ( ref integer s, ref integer i )  
public function integer reset ( grresettype t ) 
public function integer resetdatacolors ( integer s, integer i ) 
public function integer saveas ( )  
public function integer saveas ( string f, saveastype t, boolean i ) 
public function integer saveas ( string f, saveastype t, boolean i, encoding e ) 
public function integer seriescount ( )  
public function string seriesname ( integer s ) 
public function integer setdatalabelling ( integer s, integer i, boolean v ) 
public function integer setdatapieexplode ( integer s, integer i, integer p )  
public function integer setdatastyle ( integer s, integer i, fillpattern p )  
public function integer setdatastyle ( integer s, integer i, grcolortype c, long v )  
public function integer setdatastyle ( integer s, integer i, grsymboltype m ) 
public function integer setdatastyle ( integer s, integer i, linestyle l ) 
public function integer setdatastyle ( integer s, integer i, linestyle l, integer w ) 
public function integer setdatatransparency ( integer s, integer i, integer v ) 
public function integer setserieslabelling ( string s, boolean v )  
public function integer setseriesstyle ( string s, boolean o )  
public function integer setseriesstyle ( string s, fillpattern p )  
public function integer setseriesstyle ( string s, grcolortype c, long v )  
public function integer setseriesstyle ( string s, grsymboltype m )  
public function integer setseriesstyle ( string s, linestyle l )  
public function integer setseriesstyle ( string s, linestyle l, integer w ) 
public function integer setseriestransparency ( string s, integer v ) 
end prototypes

event resize;ole_ie_graph.resize(newwidth,newheight)
end event

public function integer addcategory (readonly date c);return gr_pbwc.addcategory(c)
end function

public function integer addcategory ( readonly datetime c ) ;return gr_pbwc.addcategory(c)
end function

public function integer addcategory ( readonly double c )  ;return gr_pbwc.addcategory(c)
end function

public function integer addcategory ( readonly string c ) ;return gr_pbwc.addcategory(c)
end function

public function integer addcategory ( readonly time c )  ;return gr_pbwc.addcategory(c)
end function

public function long adddata ( integer s, readonly date v ) ;return  gr_pbwc.adddata (  s,  v )
end function

public function long adddata ( integer s, readonly date v, readonly date c ) ;return  gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly date v, readonly datetime c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly date v, readonly double c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly date v, readonly string c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly date v, readonly time c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly datetime v ) ;return gr_pbwc.adddata (  s,  v )
end function

public function long adddata ( integer s, readonly datetime v, readonly date c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly datetime v, readonly datetime c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly datetime v, readonly double c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly datetime v, readonly string c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly datetime v, readonly time c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly double v )  ;return gr_pbwc.adddata (  s,  v )
end function

public function long adddata ( integer s, readonly double v, readonly date c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly double v, readonly datetime c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly double v, readonly double c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly double v, readonly string c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly double v, readonly time c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly string v )  ;return gr_pbwc.adddata (  s,  v )
end function

public function long adddata ( integer s, readonly string v, readonly date c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function 

public function long adddata ( integer s, readonly string v, readonly datetime c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly string v, readonly double c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly string v, readonly string c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly string v, readonly time c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly time v )  ;return gr_pbwc.adddata (  s,  v )
end function

public function long adddata ( integer s, readonly time v, readonly date c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly time v, readonly datetime c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly time v, readonly double c ) ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly time v, readonly string c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function long adddata ( integer s, readonly time v, readonly time c )  ;return gr_pbwc.adddata (  s,  v ,c)
end function

public function integer addseries ( string s )  ;return gr_pbwc.addseries(s)
end function

public function integer categorycount ( )  ;return  gr_pbwc.categorycount()
end function

public function string categoryname ( integer c ) ;return gr_pbwc.categoryname(c)
end function

public function integer datacount ( string s )  ;return gr_pbwc.datacount(s)
end function

public function integer deletecategory ( readonly date c )  ;return gr_pbwc.deletecategory(c)
end function

public function integer deletecategory ( readonly datetime c )  ;return gr_pbwc.deletecategory(c)
end function

public function integer deletecategory ( readonly double c ) ;return gr_pbwc.deletecategory(c)
end function

public function integer deletecategory ( readonly string c ) ;return gr_pbwc.deletecategory(c)
end function

public function integer deletecategory ( readonly time c ) ;return gr_pbwc.deletecategory(c)
end function

public function integer deletedata ( integer s, integer i )  ;return gr_pbwc.deletedata(s,i)
end function

public function integer deleteseries ( string s )  ;return gr_pbwc.deleteseries(s)
end function

public function integer findcategory ( readonly date c )  ;return gr_pbwc.findcategory(c)
end function

public function integer findcategory ( readonly datetime c )  ;return gr_pbwc.findcategory(c)
end function

public function integer findcategory ( readonly double c )  ;return gr_pbwc.findcategory(c)
end function

public function integer findcategory ( readonly string c )  ;return gr_pbwc.findcategory(c)
end function

public function integer findcategory ( readonly time c )  ;return gr_pbwc.findcategory(c)
end function

public function integer findseries ( string s )  ;return gr_pbwc.findseries(s)
end function

public function double getdata ( integer s, integer i ) ;return gr_pbwc.getdata(s,i)
end function

public function integer getdata ( integer s, integer i, grdatatype ay ) ;return gr_pbwc.getdata(s,i,ay)
end function

public function integer getdatalabelling ( integer s, integer i, ref boolean v ) ;return gr_pbwc.getdatalabelling(s,i,v)
end function

public function integer getdatapieexplode ( integer s, integer i, ref integer p )  ;return gr_pbwc.getdatapieexplode(s,i,p)
end function

public function integer getdatastyle ( integer s, integer i, grcolortype c, ref long v ) ;return gr_pbwc.getdatastyle(s,i,c,v)
end function

public function integer getdatastyle ( integer s, integer i, ref fillpattern p )  ;return gr_pbwc.getdatastyle(s,i,p)
end function

public function integer getdatastyle ( integer s, integer i, ref grsymboltype m )  ;return gr_pbwc.getdatastyle(s,i,m)
end function

public function integer getdatastyle ( integer s, integer i, ref linestyle l ) ;return gr_pbwc.getdatastyle(s,i,l)
end function

public function integer getdatastyle ( integer s, integer i, ref linestyle l, ref integer w ) ;return gr_pbwc.getdatastyle(s,i,l,w)
end function

public function integer getdatatransparency ( integer s, integer i, ref integer v ) ;return gr_pbwc.getdatatransparency(s,i,v)
end function

public function integer getdatavalue ( integer s, integer i, ref date v )  ;return gr_pbwc.getdatavalue(s,i,v)
end function

public function integer getdatavalue ( integer s, integer i, ref date v, grdatatype ay )  ;return gr_pbwc.getdatavalue(s,i,v,ay)
end function

public function integer getdatavalue ( integer s, integer i, ref datetime v ) ;return gr_pbwc.getdatavalue(s,i,v)
end function

public function integer getdatavalue ( integer s, integer i, ref datetime v, grdatatype ay )  ;return gr_pbwc.getdatavalue(s,i,v,ay)
end function

public function integer getdatavalue ( integer s, integer i, ref double v )  ;return gr_pbwc.getdatavalue(s,i,v)
end function

public function integer getdatavalue ( integer s, integer i, ref double v, grdatatype ay ) ;return gr_pbwc.getdatavalue(s,i,v,ay)
end function

public function integer getdatavalue ( integer s, integer i, ref string v )  ;return gr_pbwc.getdatavalue(s,i,v)
end function

public function integer getdatavalue ( integer s, integer i, ref string v, grdatatype ay )  ;return gr_pbwc.getdatavalue(s,i,v,ay)
end function

public function integer getdatavalue ( integer s, integer i, ref time v ) ;return gr_pbwc.getdatavalue(s,i,v)
end function

public function integer getdatavalue ( integer s, integer i, ref time v, grdatatype ay ) ;return gr_pbwc.getdatavalue(s,i,v,ay)
end function

public function integer getserieslabelling ( string s, ref boolean v )  ;return gr_pbwc.getserieslabelling(s,v)
end function

public function integer getseriesstyle ( string s, grcolortype c, ref long v )  ;return gr_pbwc.getseriesstyle(s,c,v)
end function

public function integer getseriesstyle ( string s, ref boolean o )  ;return gr_pbwc.getseriesstyle(s,o)
end function

public function integer getseriesstyle ( string s, ref fillpattern p )  ;return gr_pbwc.getseriesstyle(s,p)
end function

public function integer getseriesstyle ( string s, ref grsymboltype m )  ;return gr_pbwc.getseriesstyle(s,m)
end function

public function integer getseriesstyle ( string s, ref linestyle l ) ;return gr_pbwc.getseriesstyle(s,l)
end function

public function integer getseriesstyle ( string s, ref linestyle l, ref integer w ) ;return gr_pbwc.getseriesstyle(s,l,w)
end function

public function integer getseriestransparency ( string s, ref integer v ) ;return gr_pbwc.getseriestransparency(s,v)
end function

public function long importclipboard ( )  ;return gr_pbwc.importclipboard()
end function

public function long importclipboard ( saveastype t, long  startrow )  ;return gr_pbwc.importclipboard(t,startrow)
end function

public function long importclipboard ( saveastype t, long  startrow , long endrow) ;return gr_pbwc.importclipboard(t,startrow,endrow)
end function

public function long importclipboard ( saveastype t , long  startrow , long endrow, long startcolumn) ;return gr_pbwc.importclipboard(t,startrow,endrow,startcolumn)
end function

public function long importfile ( saveastype t, string f )  ;return gr_pbwc.importfile(t,f)
end function

public function long importfile ( string f ) ;return gr_pbwc.importfile(f)
end function

public function long importfile ( saveastype t, string f,long  startrow )  ;return gr_pbwc.importfile(t,f,startrow)
end function

public function long importfile ( string f ,long  startrow ) ;return gr_pbwc.importfile(f,startrow)
end function

public function long importfile ( saveastype t, string f,long  startrow , long endrow)  ;return gr_pbwc.importfile(t,f,startrow,endrow)
end function

public function long importfile ( string f ,long  startrow, long endrow )  ;return gr_pbwc.importfile(f,startrow,endrow)
end function

public function long importfile ( saveastype t, string f,long  startrow , long endrow, long startcolumn)  ;return gr_pbwc.importfile(t,f,startrow,endrow,startcolumn)
end function

public function long importfile ( string f ,long  startrow, long endrow, long startcolumn ) ;return gr_pbwc.importfile(f,startrow,endrow,startcolumn)
end function

public function long importstring ( saveastype t, string s );return gr_pbwc.importstring(t,s)
end function  

public function long importstring ( string s ) ;return  gr_pbwc.importstring(s)
end function

public function long importstring ( string s ,long  startrow) ;return  gr_pbwc.importstring(s,startrow)
end function

public function long importstring ( string s ,long  startrow, long endrow)  ;return  gr_pbwc.importstring(s,startrow,endrow)
end function

public function long importstring ( string s ,long  startrow, long endrow, long startcolumn)  ;return  gr_pbwc.importstring(s,startrow,endrow,startcolumn)
end function

public function long importstring (saveastype t, string s ,long  startrow)   ;return gr_pbwc.importstring(t,s,startrow)
end function

public function long importstring (saveastype t, string s ,long  startrow, long endrow) ;return  gr_pbwc.importstring(t,s,startrow,endrow)
end function

public function long importstring (saveastype t, string s ,long  startrow, long endrow, long startcolumn) ;return gr_pbwc.importstring(t,s,startrow,endrow,startcolumn)
end function

public function integer insertcategory ( readonly date c, integer i )  ;return gr_pbwc.insertcategory(c,i)
end function

public function integer insertcategory ( readonly datetime c, integer i ) ;return gr_pbwc.insertcategory(c,i)
end function

public function integer insertcategory ( readonly double c, integer i ) ;return gr_pbwc.insertcategory(c,i)
end function

public function integer insertcategory ( readonly string c, integer i ) ;return gr_pbwc.insertcategory(c,i)
end function

public function integer insertcategory ( readonly time c, integer i )  ;return gr_pbwc.insertcategory(c,i)
end function

public function long insertdata ( integer s, integer i, readonly date v );return gr_pbwc.insertdata(s,i,v)
end function

public function long insertdata ( integer s, integer i, readonly date v, readonly date c ) ;return gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly date v, readonly datetime c ) ;return gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly date v, readonly double c ) ;return gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly date v, readonly string c ) ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly date v, readonly time c ) ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly datetime v )  ;return  gr_pbwc.insertdata(s,i,v)
end function

public function long insertdata ( integer s, integer i, readonly datetime v, readonly date c )  ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly datetime v, readonly datetime c )  ;return gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly datetime v, readonly double c ) ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly datetime v, readonly string c );return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly datetime v, readonly time c ) ;return gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly double v )  ;return gr_pbwc.insertdata(s,i,v)
end function

public function long insertdata ( integer s, integer i, readonly double v, readonly date c ) ; return gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly double v, readonly datetime c ) ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly double v, readonly double c );return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly double v, readonly string c )  ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly double v, readonly time c )  ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly string v ) ;return  gr_pbwc.insertdata(s,i,v)
end function

public function long insertdata ( integer s, integer i, readonly string v, readonly date c ) ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly string v, readonly datetime c )  ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly string v, readonly double c )  ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly string v, readonly string c )   ;return gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly string v, readonly time c )   ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly time v )  ;return  gr_pbwc.insertdata(s,i,v)
end function

public function long insertdata ( integer s, integer i, readonly time v, readonly date c )  ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly time v, readonly datetime c )  ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly time v, readonly double c )  ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly time v, readonly string c ) ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function long insertdata ( integer s, integer i, readonly time v, readonly time c )  ;return  gr_pbwc.insertdata(s,i,v,c)
end function

public function integer insertseries ( string n, integer i ) ;return gr_pbwc.insertseries(n,i)
end function

public function integer modifydata ( integer s, integer i, readonly date v )  ;return gr_pbwc.modifydata(s,i,v)
end function

public function integer modifydata ( integer s, integer i, readonly date v, readonly date c )  ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly date v, readonly datetime c )  ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly date v, readonly double c )  ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly date v, readonly string c )   ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly date v, readonly time c )  ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly datetime v )  ;return gr_pbwc.modifydata(s,i,v)
end function

public function integer modifydata ( integer s, integer i, readonly datetime v, readonly date c ) ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly datetime v, readonly datetime c ) ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly datetime v, readonly double c ) ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly datetime v, readonly string c ) ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly datetime v, readonly time c );return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly double v )  ;return gr_pbwc.modifydata(s,i,v)
end function

public function integer modifydata ( integer s, integer i, readonly double v, readonly date c ) ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly double v, readonly datetime c )  ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly double v, readonly double c ) ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly double v, readonly string c );return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly double v, readonly time c );return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly string v )  ;return gr_pbwc.modifydata(s,i,v)
end function

public function integer modifydata ( integer s, integer i, readonly string v, readonly date c )   ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly string v, readonly datetime c );return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly string v, readonly double c );return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly string v, readonly string c );return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly string v, readonly time c )  ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly time v ) ;return gr_pbwc.modifydata(s,i,v)
end function

public function integer modifydata ( integer s, integer i, readonly time v, readonly date c )  ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly time v, readonly datetime c )  ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly time v, readonly double c ) ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly time v, readonly string c )  ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function integer modifydata ( integer s, integer i, readonly time v, readonly time c ) ;return gr_pbwc.modifydata(s,i,v,c)
end function

public function grobjecttype objectatpointer ( ref integer s, ref integer i )  ;return gr_pbwc.objectatpointer(s,i)
end function

public function integer reset ( grresettype t ) ;return gr_pbwc.reset(t)
end function

public function integer resetdatacolors ( integer s, integer i ) ;return gr_pbwc.resetdatacolors(s,i)
end function

public function integer saveas ( )  ;return gr_pbwc.saveas()
end function

public function integer saveas ( string f, saveastype t, boolean i ) ;return gr_pbwc.saveas(f,t,i)
end function

public function integer saveas ( string f, saveastype t, boolean i, encoding e ) ;return gr_pbwc.saveas(f,t,i,e)
end function

public function integer seriescount ( )  ;return gr_pbwc.seriescount()
end function

public function string  seriesname ( integer s ) ;return gr_pbwc.seriesname(s)
end function

public function integer setdatalabelling ( integer s, integer i, boolean v ) ;return gr_pbwc.setdatalabelling(s,i,v)
end function

public function integer setdatapieexplode ( integer s, integer i, integer p )  ;return gr_pbwc.setdatapieexplode(s,i,p)
end function

public function integer setdatastyle ( integer s, integer i, fillpattern p )  ;return gr_pbwc.setdatastyle(s,i,p)
end function

public function integer setdatastyle ( integer s, integer i, grcolortype c, long v )  ;return gr_pbwc.setdatastyle(s,i,c,v)
end function

public function integer setdatastyle ( integer s, integer i, grsymboltype m ) ;return gr_pbwc.setdatastyle(s,i,m)
end function

public function integer setdatastyle ( integer s, integer i, linestyle l ) ;return gr_pbwc.setdatastyle(s,i,l)
end function

public function integer setdatastyle ( integer s, integer i, linestyle l, integer w ) ;return gr_pbwc.setdatastyle(s,i,l,w)
end function

public function integer setdatatransparency ( integer s, integer i, integer v ) ;return gr_pbwc.setdatatransparency(s,i,v)
end function

public function integer setserieslabelling ( string s, boolean v )  ;return gr_pbwc.setserieslabelling(s,v)
end function

public function integer setseriesstyle ( string s, boolean o )  ;return gr_pbwc.setseriesstyle(s,o)
end function

public function integer setseriesstyle ( string s, fillpattern p )  ;return gr_pbwc.setseriesstyle(s,p)
end function

public function integer setseriesstyle ( string s, grcolortype c, long v )  ;return gr_pbwc.setseriesstyle(s,c,v)
end function

public function integer setseriesstyle ( string s, grsymboltype m )  ;return gr_pbwc.setseriesstyle(s,m)
end function

public function integer setseriesstyle ( string s, linestyle l )  ;return gr_pbwc.setseriesstyle(s,l)
end function

public function integer setseriesstyle ( string s, linestyle l, integer w ) ;return gr_pbwc.setseriesstyle(s,l,w)
end function

public function integer setseriestransparency ( string s, integer v ) ;return gr_pbwc.setseriestransparency(s,v)
end function

on uov_pbwc_pb_graph_ancestor.create
this.gr_pbwc=create gr_pbwc
this.ole_ie_graph=create ole_ie_graph
this.Control[]={this.gr_pbwc,&
this.ole_ie_graph}
end on

on uov_pbwc_pb_graph_ancestor.destroy
destroy(this.gr_pbwc)
destroy(this.ole_ie_graph)
end on

event constructor;gr_pbwc.category = this.category 
gr_pbwc.series = this.series 
gr_pbwc.values = this.values 
gr_pbwc.legenddispattr = this.legenddispattr 
gr_pbwc.piedispattr = this.piedispattr 
gr_pbwc.titledispattr = this.titledispattr 
gr_pbwc.graphtype = this.graphtype 
gr_pbwc.legend = this.legend 
gr_pbwc.categorysort = this.categorysort 
gr_pbwc.seriessort = this.seriessort 
gr_pbwc.depth = this.depth 
gr_pbwc.elevation = this.elevation 
gr_pbwc.overlappercent = this.overlappercent 
gr_pbwc.perspective = this.perspective 
gr_pbwc.rotation = this.rotation 
gr_pbwc.spacing = this.spacing 
gr_pbwc.shadecolor = this.shadecolor 
gr_pbwc.title = this.title 

end event

type gr_pbwc from uov_pbwc_pb_graph within uov_pbwc_pb_graph_ancestor
integer y = 144
integer width = 1856
integer height = 908
end type

type ole_ie_graph from uov_pbwc_ie_graph within uov_pbwc_pb_graph_ancestor
integer width = 1842
integer height = 604
integer taborder = 10
boolean border = false
string binarykey = "uov_pbwc_pb_graph_ancestor.udo"
end type


Start of PowerBuilder Binary Data Section : Do NOT Edit
0Cuov_pbwc_pb_graph_ancestor.bin 
2000000a00e011cfd0e11ab1a1000000000000000000000000000000000003003e0009fffe000000060000000000000000000000010000000100000000000010000000000200000001fffffffe0000000000000000fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffdfffffffefffffffefffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff006f00520074006f004500200074006e00790072000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000050016ffffffffffffffff0000000100000000000000000000000000000000000000000000000000000000bc01c00001d3dbf800000003000001800000000000500003004f0042005800430054005300450052004d0041000000000000000000000000000000000000000000000000000000000000000000000000000000000102001affffffff00000002ffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000000000009c00000000004200500043004f00530058004f00540041005200450047000000000000000000000000000000000000000000000000000000000000000000000000000000000001001affffffffffffffff000000038856f96111d0340ac0006ba9a205d74f00000000bc01c00001d3dbf8bc01c00001d3dbf8000000000000000000000000004f00430054004e004e00450053005400000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001020012ffffffffffffffffffffffff000000000000000000000000000000000000000000000000000000000000000000000000000000030000009c000000000000000100000002fffffffe0000000400000005fffffffeffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
2Cffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff0000004c000029a700000f9b0000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000004c000029a700000f9b0000000000000000000000000000000000000000000000000000004c0000000000000000000000010057d0e011cf3573000869ae62122e2b00000008000000000000004c0002140100000000000000c0460000000000008000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1Cuov_pbwc_pb_graph_ancestor.bin 
End of PowerBuilder Binary Data Section : No Source Expected After This Point
