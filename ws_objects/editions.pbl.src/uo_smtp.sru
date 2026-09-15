$PBExportHeader$uo_smtp.sru
forward
global type uo_smtp from nonvisualobject
end type
end forward

global type uo_smtp from nonvisualobject
end type
global uo_smtp uo_smtp

type variables
SMTPClient  l_SmtpClient

private constant int defaut_smtp_port = 25
private constant int defaut_pop3_port = 995

int id
string nom

string user
string pwd

string my_alias
string my_adr, starttls_str
integer starttls

string email_objet_defaut

// spécif smtp (envoie email)
string Smtp_Host, smtp_ssl_str
int Smtp_Port, smtp_ssl

// spécif pop (réception email)
string pop3_Host, pop3_ssl_str
int pop3_Port, pop3_ssl


// texte brut par défaut
string texte_brut_defaut

end variables

forward prototypes
public subroutine init ()
public function boolean charger_compte (integer local_id)
end prototypes

public subroutine init ();l_SmtpClient = CREATE SMTPClient
l_SmtpClient.Message.Encoding = "UTF-8"
end subroutine

public function boolean charger_compte (integer local_id);// charge les valeurs d'un compte à partir de la BD
// renvoie True si pas de pb

boolean val_retour = false

if isnull(local_id) then return val_retour

select id, nom, "user", pwd, smtp_host, smtp_port, my_alias, my_adr, email_objet_defaut, texte_envoi_piece_jointe, pop3_host, pop3_port, isnull(smtp_ssl, 'N'), isnull(pop3_ssl, 'O'), isnull(starttls, 'N')
into :id, :nom, :user, :pwd, :smtp_host, :smtp_port, :my_alias, :my_adr, :email_objet_defaut, :texte_brut_defaut , :pop3_host, :pop3_port, :smtp_ssl_str, :pop3_ssl_str, :starttls_str
from email_comptes where id = :local_id ;



if isnull(id) then id = 0
if isnull(nom) then nom = '' 
if isnull(user) then user = ''
if isnull(pwd) then pwd = ''
if isnull(Smtp_Host) then Smtp_Host = ''
if isnull(Smtp_Port) then smtp_port = defaut_smtp_port
if isnull(pop3_Host) then pop3_Host = ''
if isnull(pop3_Port) then pop3_port = defaut_pop3_port
if isnull(my_alias) then my_alias = ''
if isnull(my_adr) then my_adr = ''
if isnull(email_objet_defaut) then email_objet_defaut = ''
if isnull(texte_brut_defaut) then texte_brut_defaut = ''


if smtp_ssl_str = "O" then 
	smtp_ssl = 1
else
	smtp_ssl = 0
end if

if pop3_ssl_str = "O" then 
	pop3_ssl = 1
else
	pop3_ssl = 0
end if

if starttls_str = "O" then 
	starttls = 1
else
	starttls = 0
end if

// Initialisation de l'objet SMTP
l_SmtpClient.Host = smtp_host
l_SmtpClient.Port = smtp_port
l_SmtpClient.Username = user
l_SmtpClient.password = pwd
if  starttls_str = "O" then
	l_SmtpClient.EnableTLS = True
else
	l_SmtpClient.EnableTLS = False
end if


//Sets the email message
l_SmtpClient.Message.SetSender(user, my_alias)


l_SmtpClient.LogFile (dir_ini +  "email_last_error.log")

if id > 0 then val_retour = true

return val_retour
end function

on uo_smtp.create
call super::create
TriggerEvent( this, "constructor" )
end on

on uo_smtp.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

event constructor;l_SmtpClient = CREATE SMTPClient

end event

