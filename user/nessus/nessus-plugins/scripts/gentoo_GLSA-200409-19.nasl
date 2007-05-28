# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200409-19.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2005 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004 Michel Arboi <mikhail@nessus.org>

if (! defined_func('bn_random')) exit(0);

if (description)
{
 script_id(14745);
 script_version("$Revision: 1.3 $");
 script_xref(name: "GLSA", value: "200409-19");
 script_cve_id("CVE-2004-0794");

 desc = 'The remote host is affected by the vulnerability described in GLSA-200409-19
(Heimdal: ftpd root escalation)


    Przemyslaw Frasunek discovered several flaws in lukemftpd, which also apply
    to Heimdal ftpd\'s out-of-band signal handling code.
    Additionally, a potential vulnerability that could lead to Denial of
    Service by the Key Distribution Center (KDC) has been fixed in this
    version.
  
Impact

    A remote attacker could be able to run arbitrary code with escalated
    privileges, which can result in a total compromise of the server.
  
Workaround

    There is no known workaround at this time.
  
References:
    http://www.pdc.kth.se/heimdal/advisory/2004-09-13/
    http://www.frasunek.com/lukemftpd.txt
    http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2004-0794


Solution: 
    All Heimdal users should upgrade to the latest version:
    # emerge sync
    # emerge -pv ">=app-crypt/heimdal-0.6.3"
    # emerge ">=app-crypt/heimdal-0.6.3"
  

Risk factor : High
';
 script_description(english: desc);
 script_copyright(english: "(C) 2005 Michel Arboi <mikhail@nessus.org>");
 script_name(english: "[GLSA-200409-19] Heimdal: ftpd root escalation");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Heimdal: ftpd root escalation');
 exit(0);
}

include('qpkg.inc');
if (qpkg_check(package: "app-crypt/heimdal", unaffected: make_list("ge 0.6.3"), vulnerable: make_list("lt 0.6.3")
)) { security_hole(0); exit(0); }
