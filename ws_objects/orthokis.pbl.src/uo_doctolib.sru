$PBExportHeader$uo_doctolib.sru
forward
global type uo_doctolib from userobject
end type
type pb_doctolib from picturebutton within uo_doctolib
end type
end forward

global type uo_doctolib from userobject
integer width = 128
integer height = 112
long backcolor = 67108864
string text = "none"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
pb_doctolib pb_doctolib
end type
global uo_doctolib uo_doctolib

type variables


// v_action :
// ------------
// A = pour ouvrir agenda doctolib 
// R = nouveau rdv pour un patient donné
// H = historique pour un patient donné
// P = maj ou création d'un patient
// J = pour ouvrir agenda doctolib surle prochain rdv clinique du patient 


double v_code_local

n_winsock gn_ws



end variables

forward prototypes
public subroutine lancer (string v_action)
public subroutine init (double v_patient)
end prototypes

public subroutine lancer (string v_action);
string v_code_doctolib

//select id_soft2 into 

//

Long ll_last, ll_BytesRecvd
String ls_hostname, ls_message, ls_peername, ls_reply
UInt lui_port
ULong lul_socket

SetPointer(HourGlass!)

ls_hostname = "localhost"
lui_port = 20001


choose Case v_action
		case "A"
			// Agenda Neutre
			ls_message = "AGENDA"
		case "R"
			// Agenda pour la prise de rendez-vous avec un patient
			ls_message = "AGENDA:" + string(v_code_local)
		case "H"
			// Historique des rendez-vous du patients
			ls_message = "HISTO:" + string(v_code_local)
		case "P"
			// Création d'un patient
			ls_message = "PATIENT:" + string(v_code_local)
		case "S"
			// Salle d'attente
			ls_message = "S"
		case "J"
			// Agenda pour la prise de rendez-vous avec un patient, positionné au prochain rendez-vous du patient
			ls_message = "AGENDA:" + string(v_code_local)
	end choose			

// connect to the host
lul_socket = gn_ws.of_Connect(ls_hostname, lui_port)
If lul_socket = 0 Then
	ls_message = gn_ws.of_GetLastError()
	MessageBox("Erreur de Connection à l'Hôte", &
		ls_message, StopSign!)
	Return
End If

// get address of machine at the other end of the connection
ls_peername = gn_ws.of_GetPeerName(lul_socket)
//If ls_peername <> "" Then
//	lb_msgs.AddItem("Peer: " + ls_peername)
//End If

Trace("Lien Doctolib : Envoi du message : " + ls_message)

// send the message
gn_ws.of_SetUnicode(false)
If Not gn_ws.of_Send(lul_socket, ls_message) Then
	ls_message = gn_ws.of_GetLastError()
	gn_ws.of_Close(lul_socket)
	MessageBox("Erreur dans l'envoi du Message", &
		ls_message, StopSign!)
	Return
End If

// receive a reply
//ll_BytesRecvd = gn_ws.of_Recv(lul_socket, ls_reply)
//If ll_BytesRecvd > 0 Then
//	lb_msgs.AddItem("Msg Recvd: " + ls_reply)
//Else
//	ls_message = gn_ws.of_GetLastError()
//	lb_msgs.AddItem(ls_message)
//	gn_ws.of_Close(lul_socket)
//	MessageBox("Receive Reply Failed", &
//		ls_message, StopSign!)
//	Return
//End If

// disconnect from the host
gn_ws.of_Close(lul_socket)

end subroutine

public subroutine init (double v_patient);
v_code_local = v_patient

gn_ws = create n_winsock 

// Initialize Winsock
If Not gn_ws.of_Startup() Then
	MessageBox("Erreur dans l'initilisation de la Communication Doctolib !", &
		gn_ws.of_GetLastError(), StopSign!)
	Return
End If

end subroutine

on uo_doctolib.create
this.pb_doctolib=create pb_doctolib
this.Control[]={this.pb_doctolib}
end on

on uo_doctolib.destroy
destroy(this.pb_doctolib)
end on

type pb_doctolib from picturebutton within uo_doctolib
integer width = 128
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string picturename = "lc_doctolib.png"
alignment htextalign = left!
string powertiptext = "Crée ou met à jour le patient et crée un rendez-vous pour le patient dans Doctolib / Ouvre l~'historique des rendez-vous du patient dans Doctolib"
end type

event clicked;
// pour créer ou mettre à jour le patient
lancer("P")

// pour ajouter un rendez-vois
lancer("R")
end event

event rbuttondown;

// pour l'historique des rendez-vois
lancer("H")
end event

