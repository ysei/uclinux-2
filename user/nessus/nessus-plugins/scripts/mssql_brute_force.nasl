##
#
#             MSSQL Brute Forcer
#
# This script checks a SQL Server instance for common
# username and password combinations. If you know of a
# common/default account that is not listed, please
# submit it to:
#   
#   plugins@digitaloffense.net
#          or
#   deraison@cvs.nessus.org 
#
# System accounts with blank passwords are checked for in
# a seperate plugin (mssql_blank_password.nasl). This plugin
# is geared towards accounts created by rushed admins or
# certain software installations.
#
##


if(description)
{
 script_id(10862);
 script_version ("$Revision: 1.17 $");
 name["english"] = "Microsoft's SQL Server Brute Force";
 script_name(english:name["english"]);
 
 desc["english"] = "
 
 The SQL Server has a common password for one or more accounts.
 These accounts may be used to gain access to the records in 
 the database or even allow remote command execution.
 
 Solution: Please set a difficult to guess password for these accounts.
 
 Risk factor : High
 ";
 
 script_description(english:desc["english"]);
 
 summary["english"] = "Microsoft's SQL Server Brute Force";
 script_summary(english:summary["english"]);
 
 script_category(ACT_ATTACK);
 
 script_copyright(english:"This script is Copyright (C) 2001 H D Moore");
 family["english"] = "Databases";
 script_family(english:family["english"]);
 script_require_ports("Services/mssql", 1433); 
 script_dependencie("mssqlserver_detect.nasl", "sybase_detect.nasl");
 exit(0);
}

#
# The script code starts here
#

pkt_hdr = raw_string(
    0x02, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
);


pkt_pt2 = raw_string (
    0x30, 0x30, 0x30, 0x30, 0x30, 0x30, 0x61, 0x30, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x20, 0x18, 0x81, 0xb8, 0x2c, 0x08, 0x03,
    0x01, 0x06, 0x0a, 0x09, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x73, 0x71, 0x75, 0x65, 0x6c, 0x64, 0x61,
    0x20, 0x31, 0x2e, 0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00
);

pkt_pt3 = raw_string (
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x04, 0x02, 0x00, 0x00, 0x4d, 0x53, 0x44,
    0x42, 0x4c, 0x49, 0x42, 0x00, 0x00, 0x00, 0x07, 0x06, 0x00, 0x00,
    0x00, 0x00, 0x0d, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00
);

pkt_lang = raw_string(
    0x02, 0x01, 0x00, 0x47, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x30, 0x30, 0x00, 0x00,
    0x00, 0x03, 0x00, 0x00, 0x00
);


function sql_recv(socket)
{
 local_var head, len_hi, len_lo, len, body;

 head = recv(socket:socket, length:4, min:4);
 if(strlen(head) < 4) return NULL;
 
 len_hi = 256 * ord(head[2]);
 len_lo = ord(head[3]);
 
 len = len_hi + len_lo;
 body = recv(socket:socket, length:len);
 return(string(head, body));
}

function make_sql_login_pkt (username, password)
{
    local_var ulen, plen, upad, ppad, ubuf, pbuf, nul, ublen, pblen, sql_packet;

    ulen = strlen(username);
    plen = strlen(password);
    
    upad = 30 - ulen;
    ppad = 30 - plen;
    
    ubuf = "";
    pbuf = "";
    
    nul = raw_string(0x00);
    
  
    if(ulen)
    {
        ublen = raw_string(ulen % 255);
    } else {
        ublen = raw_string(0x00);
    }
    
    
    if(plen)
    {
        pblen =  raw_string(plen % 255);
    } else {
        pblen = raw_string(0x00);
    }  

    ubuf = string(username, crap(data:nul, length:upad));
    pbuf = string(password, crap(data:nul, length:ppad));

    sql_packet = string(pkt_hdr,ubuf,ublen,pbuf,pblen,pkt_pt2,pblen,pbuf,pkt_pt3);

    return sql_packet;
}


user[0]="sa";       pass[0]="sa";
user[1]="sa";       pass[1]="password";
user[2]="sa";       pass[2]="administrator";
user[3]="sa";       pass[3]="admin";

user[4]="admin";    pass[4]="administrator";
user[5]="admin";    pass[5]="password";
user[6]="admin";    pass[6]="admin";

user[7]="probe";    pass[7]="probe";
user[8]="probe";    pass[8]="password";

user[9]="sql";      pass[9]="sql";
user[10]="sa";      pass[10]="sql";


report = "";
port = get_kb_item("Services/mssql");
if(!port) port = get_kb_item("Services/sybase");
if(!port) port = 1433;




found = 0;
if(get_port_state(port))
{
    for(i=0;user[i];i=i+1)
    {
        username = user[i];
        password = pass[i];
        
        soc = open_sock_tcp(port);
	if(!soc)
	 {
	   i = 10;
	 }
	else
        {
            # this creates a variable called sql_packet
            sql_packet = make_sql_login_pkt(username:username, password:password);

	    send(socket:soc, data:sql_packet);
            send(socket:soc, data:pkt_lang);

	    r  = sql_recv(socket:soc);
	    close(soc);
	    
	    if(strlen(r) > 10 &&
	       ord(r[8]) == 0xE3)
	   {
	    report = string(report, "Account '",username, "' has password '", password, "'\n");
            found = found + 1;
	    }
        }
    }
}

if(found)
{
    report = string("The following accounts were found on the SQL Server:\n", report);
    report += string("\n\nAn attacker can use these accounts to read and/or modify\n");
    report += string("data on your SQL server.  In addition, the attacker may be\n");
    report += string("able to launch programs on the target Operating system\n"); 
    security_hole(port:port, data:report);
}
