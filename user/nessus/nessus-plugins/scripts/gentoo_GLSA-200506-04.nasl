# This script was automatically generated from 
#  http://www.gentoo.org/security/en/glsa/glsa-200506-04.xml
# It is released under the Nessus Script Licence.
# The messages are release under the Creative Commons - Attribution /
# Share Alike license. See http://creativecommons.org/licenses/by-sa/2.0/
#
# Avisory is copyright 2001-2005 Gentoo Foundation, Inc.
# GLSA2nasl Convertor is copyright 2004 Michel Arboi <mikhail@nessus.org>

if (! defined_func('bn_random')) exit(0);

if (description)
{
 script_id(18427);
 script_version("$Revision: 1.2 $");
 script_xref(name: "GLSA", value: "200506-04");

 desc = 'The remote host is affected by the vulnerability described in GLSA-200506-04
(Wordpress: Multiple vulnerabilities)


    Due to a lack of input validation, WordPress is vulnerable to SQL
    injection and XSS attacks.
  
Impact

    An attacker could use the SQL injection vulnerabilites to gain
    information from the database. Furthermore the cross-site scripting
    issues give an attacker the ability to inject and execute malicious
    script code or to steal cookie-based authentication credentials,
    potentially compromising the victim\'s browser.
  
Workaround

    There is no known workaround at this time.
  

Solution: 
    All Wordpress users should upgrade to the latest version:
    # emerge --sync
    # emerge --ask --oneshot --verbose ">=www-apps/wordpress-1.5.1.2"
  

Risk factor : Medium
';
 script_description(english: desc);
 script_copyright(english: "(C) 2005 Michel Arboi <mikhail@nessus.org>");
 script_name(english: "[GLSA-200506-04] Wordpress: Multiple vulnerabilities");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Gentoo Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys('Host/Gentoo/qpkg-list');
 script_summary(english: 'Wordpress: Multiple vulnerabilities');
 exit(0);
}

include('qpkg.inc');
if (qpkg_check(package: "www-apps/wordpress", unaffected: make_list("ge 1.5.1.2"), vulnerable: make_list("lt 1.5.1.2")
)) { security_warning(0); exit(0); }
