# This script was automatically generated from the dsa-1163
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2004 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004 Michel Arboi

if (! defined_func('bn_random')) exit(0);

desc = '
Michael Gehring discovered several potential out-of-bounds index
accesses in gtetrinet, a multiplayer Tetris-like game, which may allow
a remote server to execute arbitrary code.
For the stable distribution (sarge) these problems have been fixed in
version 0.7.8-1sarge2.
For the unstable distribution (sid) these problems will be fixed soon.
We recommend that you upgrade your gtetrinet package.


Solution : http://www.debian.org/security/2006/dsa-1163
Risk factor : High';

if (description) {
 script_id(22705);
 script_version("$Revision: 1.1 $");
 script_xref(name: "DSA", value: "1163");
 script_cve_id("CVE-2006-3125");

 script_description(english: desc);
 script_copyright(english: "This script is (C) 2006 Michel Arboi <mikhail@nessus.org>");
 script_name(english: "[DSA1163] DSA-1163-1 gtetrinet");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1163-1 gtetrinet");
 exit(0);
}

include("debian_package.inc");

w = 0;
if (deb_check(prefix: 'gtetrinet', release: '3.1', reference: '0.7.8-1sarge2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package gtetrinet is vulnerable in Debian 3.1.\nUpgrade to gtetrinet_0.7.8-1sarge2\n');
}
if (deb_check(prefix: 'gtetrinet', release: '3.1', reference: '0.7.8-1sarge2')) {
 w ++;
 if (report_verbosity > 0) desc = strcat(desc, '\nThe package gtetrinet is vulnerable in Debian sarge.\nUpgrade to gtetrinet_0.7.8-1sarge2\n');
}
if (w) { security_hole(port: 0, data: desc); }
