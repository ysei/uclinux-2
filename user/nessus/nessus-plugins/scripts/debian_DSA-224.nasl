# This script was automatically generated from the dsa-224
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2004 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004 Michel Arboi

if (! defined_func('bn_random')) exit(0);

desc = '
Several vulnerabilities have been discovered in canna, a Japanese
input system.  The Common Vulnerabilities and Exposures (CVE) project
identified the following vulnerabilities:
For the current stable distribution (woody) these problems have been
fixed in version 3.5b2-46.2.
For the old stable distribution (potato) these problems have been
fixed in version 3.5b2-25.2.
For the unstable distribution (sid) these problems have been fixed in
version 3.6p1-1.
We recommend that you upgrade your canna packages.


Solution : http://www.debian.org/security/2003/dsa-224
Risk factor : High';

if (description) {
 script_id(15061);
 script_version("$Revision: 1.6 $");
 script_xref(name: "DSA", value: "224");
 script_cve_id("CVE-2002-1158", "CVE-2002-1159");
 script_bugtraq_id(6351, 6354);

 script_description(english: desc);
 script_copyright(english: "This script is (C) 2005 Michel Arboi <mikhail@nessus.org>");
 script_name(english: "[DSA224] DSA-224-1 canna");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-224-1 canna");
 exit(0);
}

include("debian_package.inc");

w = 0;
if (deb_check(prefix: 'canna', release: '2.2', reference: '3.5b2-25.2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package canna is vulnerable in Debian 2.2.\nUpgrade to canna_3.5b2-25.2\n');
}
if (deb_check(prefix: 'canna-utils', release: '2.2', reference: '3.5b2-25.2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package canna-utils is vulnerable in Debian 2.2.\nUpgrade to canna-utils_3.5b2-25.2\n');
}
if (deb_check(prefix: 'libcanna1g', release: '2.2', reference: '3.5b2-25.2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package libcanna1g is vulnerable in Debian 2.2.\nUpgrade to libcanna1g_3.5b2-25.2\n');
}
if (deb_check(prefix: 'libcanna1g-dev', release: '2.2', reference: '3.5b2-25.2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package libcanna1g-dev is vulnerable in Debian 2.2.\nUpgrade to libcanna1g-dev_3.5b2-25.2\n');
}
if (deb_check(prefix: 'canna', release: '3.0', reference: '3.5b2-46.2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package canna is vulnerable in Debian 3.0.\nUpgrade to canna_3.5b2-46.2\n');
}
if (deb_check(prefix: 'canna-utils', release: '3.0', reference: '3.5b2-46.2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package canna-utils is vulnerable in Debian 3.0.\nUpgrade to canna-utils_3.5b2-46.2\n');
}
if (deb_check(prefix: 'libcanna1g', release: '3.0', reference: '3.5b2-46.2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package libcanna1g is vulnerable in Debian 3.0.\nUpgrade to libcanna1g_3.5b2-46.2\n');
}
if (deb_check(prefix: 'libcanna1g-dev', release: '3.0', reference: '3.5b2-46.2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package libcanna1g-dev is vulnerable in Debian 3.0.\nUpgrade to libcanna1g-dev_3.5b2-46.2\n');
}
if (deb_check(prefix: 'canna', release: '3.1', reference: '3.6p1-1')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package canna is vulnerable in Debian 3.1.\nUpgrade to canna_3.6p1-1\n');
}
if (deb_check(prefix: 'canna', release: '2.2', reference: '3.5b2-25.2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package canna is vulnerable in Debian potato.\nUpgrade to canna_3.5b2-25.2\n');
}
if (deb_check(prefix: 'canna', release: '3.0', reference: '3.5b2-46.2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package canna is vulnerable in Debian woody.\nUpgrade to canna_3.5b2-46.2\n');
}
if (w) { security_hole(port: 0, data: desc); }
