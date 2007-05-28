#
# (C) Tenable Network Security
#
# This plugin text was extracted from Mandrake Linux Security Advisory MDKSA-2005:033
#


if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(16376);
 script_version ("$Revision: 1.3 $");
 script_cve_id("CVE-2004-1184", "CVE-2004-1185", "CVE-2004-1186");
 
 name["english"] = "MDKSA-2005:033: enscript";
 
 script_name(english:name["english"]);
 
 desc["english"] = "
The remote host is missing the patch for the advisory MDKSA-2005:033 (enscript).



A vulnerability in the enscript program's handling of the epsf command used to
insert inline EPS file into a document was found. An attacker could create a
carefully crafted ASCII file which would make used of the epsf pipe command in
such a way that it could execute arbitrary commands if the file was opened with
enscript (CVE-2004-1184).

Additionally, flaws were found in enscript that could be abused by executing
enscript with carefully crafted command-line arguments. These flaws only have a
security impact if enscript is executed by other programs and passed untrusted
data from remote users (CVE-2004-1185 and CVE-2004-1186).

The updated packages have been patched to prevent these problems.



Solution : http://wwwnew.mandriva.com/security/advisories?name=MDKSA-2005:033
Risk factor : High";



 script_description(english:desc["english"]);
 
 summary["english"] = "Check for the version of the enscript package";
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2005 Tenable Network Security");
 family["english"] = "Mandrake Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Mandrake/rpm-list");
 exit(0);
}

include("rpm.inc");
if ( rpm_check( reference:"enscript-1.6.4-1.1.100mdk", release:"MDK10.0", yank:"mdk") )
{
 security_hole(0);
 exit(0);
}
if ( rpm_check( reference:"enscript-1.6.4-1.1.101mdk", release:"MDK10.1", yank:"mdk") )
{
 security_hole(0);
 exit(0);
}
if (rpm_exists(rpm:"enscript-", release:"MDK10.0")
 || rpm_exists(rpm:"enscript-", release:"MDK10.1") )
{
 set_kb_item(name:"CVE-2004-1184", value:TRUE);
 set_kb_item(name:"CVE-2004-1185", value:TRUE);
 set_kb_item(name:"CVE-2004-1186", value:TRUE);
}
