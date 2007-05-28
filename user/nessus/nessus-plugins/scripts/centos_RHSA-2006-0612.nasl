#
# (C) Tenable Network Security, Inc.
#

if ( ! defined_func("bn_random") ) exit(0);
desc = "
Synopsis :

The remote host is missing a security update.

Description :

The remote CentOS system is missing a security update which has been 
documented in Red Hat advisory RHSA-2006-0612.

See also :

https://rhn.redhat.com/errata/RHSA-2006-0612.html

Solution :

Upgrade to the newest packages by doing :

  yum update

Risk factor :

High";

if ( description )
{
 script_id(22197);
 script_version("$Revision: 1.2 $");
 script_name(english:"CentOS : RHSA-2006-0612");
 script_description(english:desc);

 script_summary(english:"Checks for missing updates on the remote CentOS system");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is (C) 2006 Tenable Network Security, Inc.");
 script_family(english:"CentOS Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/CentOS/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check(reference:"tzdata-2006g-1.EL2_1", release:"CentOS-4") )  faulty += '- tzdata-2006g-1.EL2_1\n';
if ( rpm_check(reference:"apache-1.3.27-11.ent.c2.1", release:"CentOS-4", cpu:"i386") )  faulty += '- apache-1.3.27-11.ent.c2.1\n';
if ( rpm_check(reference:"apache-devel-1.3.27-11.ent.c2.1", release:"CentOS-4", cpu:"i386") )  faulty += '- apache-devel-1.3.27-11.ent.c2.1\n';
if ( rpm_check(reference:"apache-manual-1.3.27-11.ent.c2.1", release:"CentOS-4", cpu:"i386") )  faulty += '- apache-manual-1.3.27-11.ent.c2.1\n';
if ( rpm_check(reference:"krb5-devel-1.3.4-33", release:"CentOS-4", cpu:"ia64") )  faulty += '- krb5-devel-1.3.4-33\n';
if ( rpm_check(reference:"krb5-libs-1.3.4-33", release:"CentOS-4", cpu:"ia64") )  faulty += '- krb5-libs-1.3.4-33\n';
if ( rpm_check(reference:"krb5-server-1.3.4-33", release:"CentOS-4", cpu:"ia64") )  faulty += '- krb5-server-1.3.4-33\n';
if ( rpm_check(reference:"krb5-workstation-1.3.4-33", release:"CentOS-4", cpu:"ia64") )  faulty += '- krb5-workstation-1.3.4-33\n';
if ( rpm_check(reference:"krb5-devel-1.3.4-33", release:"CentOS-4", cpu:"i386") )  faulty += '- krb5-devel-1.3.4-33\n';
if ( rpm_check(reference:"krb5-libs-1.3.4-33", release:"CentOS-4", cpu:"i386") )  faulty += '- krb5-libs-1.3.4-33\n';
if ( rpm_check(reference:"krb5-server-1.3.4-33", release:"CentOS-4", cpu:"i386") )  faulty += '- krb5-server-1.3.4-33\n';
if ( rpm_check(reference:"krb5-workstation-1.3.4-33", release:"CentOS-4", cpu:"i386") )  faulty += '- krb5-workstation-1.3.4-33\n';
if ( rpm_check(reference:"krb5-devel-1.3.4-33", release:"CentOS-4", cpu:"x86_64") )  faulty += '- krb5-devel-1.3.4-33\n';
if ( rpm_check(reference:"krb5-libs-1.3.4-33", release:"CentOS-4", cpu:"x86_64") )  faulty += '- krb5-libs-1.3.4-33\n';
if ( rpm_check(reference:"krb5-server-1.3.4-33", release:"CentOS-4", cpu:"x86_64") )  faulty += '- krb5-server-1.3.4-33\n';
if ( rpm_check(reference:"krb5-workstation-1.3.4-33", release:"CentOS-4", cpu:"x86_64") )  faulty += '- krb5-workstation-1.3.4-33\n';
if ( faulty ) security_hole(port:0, data:desc + '\n\nPlugin output:\n\nThe following RPMs need to be updated :\n' + faulty);
