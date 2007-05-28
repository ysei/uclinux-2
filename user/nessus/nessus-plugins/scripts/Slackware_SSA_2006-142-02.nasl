# This script was automatically generated from the SSA-2006-142-02
# Slackware Security Advisory
# It is released under the Nessus Script Licence.
# Slackware Security Advisories are copyright 1999-2004 Slackware Linux, Inc.
# SSA2nasl Convertor is copyright 2004 Michel Arboi
# See http://www.slackware.com/about/ or http://www.slackware.com/security/
# Slackware(R) is a registered trademark of Slackware Linux, Inc.

if (! defined_func("bn_random")) exit(0);
desc='
New bin packages are available for Slackware 10.2 and -current to
fix a security issue with the zoo archive program.  A non-security-
related upgrade to the newest version of "eject" was also done.


';
if (description) {
script_id(21584);
script_version("$Revision: 1.1 $");
script_category(ACT_GATHER_INFO);
script_family(english: "Slackware Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_copyright("This script is Copyright (C) 2006 Michel Arboi <mikhail@nessus.org>");
script_require_keys("Host/Slackware/release", "Host/Slackware/packages");
script_description(english: desc);

script_xref(name: "SSA", value: "2006-142-02");
script_summary("SSA-2006-142-02 zoo archiver overflow ");
name["english"] = "SSA-2006-142-02 zoo archiver overflow ";
script_name(english:name["english"]);
exit(0);
}

include('slackware.inc');
include('global_settings.inc');

if (slackware_check(osver: "-current", pkgname: "bin", pkgver: "11.0", pkgnum:  "1", pkgarch: "i486")) {
w++;
if (report_verbosity > 0) desc = strcat(desc, '
The package bin is vulnerable in Slackware -current
Upgrade to bin-11.0-i486-1 or newer.
');
}

if (w) { security_hole(port: 0, data: desc); }
