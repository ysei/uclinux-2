# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200503-07.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2005 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004 Michel Arboi <mikhail@nessus.org>

if (! defined_func('bn_random')) exit(0);

if (description)
{
 script_id(17263);
 script_version("$Revision: 1.2 $");
 script_xref(name: "GLSA", value: "200503-07");

 desc = 'The remote host is affected by the vulnerability described in GLSA-200503-07
(phpMyAdmin: Multiple vulnerabilities)


    phpMyAdmin contains several security issues:
    Maksymilian Arciemowicz has discovered multiple variable injection
    vulnerabilities that can be exploited through "$cfg" and "GLOBALS"
    variables and localized strings
    It is possible to force
    phpMyAdmin to disclose information in error messages
    Failure
    to correctly escape special characters
  
Impact

    By sending a specially-crafted request, an attacker can include
    and execute arbitrary PHP code or cause path information disclosure.
    Furthermore the XSS issue allows an attacker to inject malicious script
    code, potentially compromising the victim\'s browser. Lastly the
    improper escaping of special characters results in unintended privilege
    settings for MySQL.
  
Workaround

    There is no known workaround at this time.
  
References:
    http://www.phpmyadmin.net/home_page/security.php?issue=PMASA-2005-1
    http://www.phpmyadmin.net/home_page/security.php?issue=PMASA-2005-2
    http://sourceforge.net/tracker/index.php?func=detail&aid=1113788&group_id=23067&atid=377408


Solution: 
    All phpMyAdmin users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=dev-db/phpmyadmin-2.6.1_p2-r1"
  

Risk factor : Medium
';
 script_description(english: desc);
 script_copyright(english: "(C) 2005 Michel Arboi <mikhail@nessus.org>");
 script_name(english: "[GLSA-200503-07] phpMyAdmin: Multiple vulnerabilities");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'phpMyAdmin: Multiple vulnerabilities');
 exit(0);
}

include('qpkg.inc');
if (qpkg_check(package: "dev-db/phpmyadmin", unaffected: make_list("ge 2.6.1_p2-r1"), vulnerable: make_list("lt 2.6.1_p2-r1")
)) { security_warning(0); exit(0); }
