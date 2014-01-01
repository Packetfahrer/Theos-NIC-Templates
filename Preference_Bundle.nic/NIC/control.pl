#Date & Time:

use POSIX qw/strftime/;

NIC->variable("DATE") = strftime("%d.%m.%Y", localtime);

NIC->variable("YEAR") = strftime("%Y", localtime);


#ARC:

my $default_ARC_Setting = "Y";


my $ARC_Setting = NIC->prompt("Use ARC? (Y/N)", {default => $default_ARC_Setting});


if (uc($ARC_Setting) eq "Y" || uc($ARC_Setting) eq "YES") {
    NIC->variable("CFLAGS") = "-fobjc-arc";
    
    NIC->variable("LOADER") = "[self loadSpecifiersFromPlistName:@\"" . NIC->variable("PROJECTNAME") . "\" target:self]"
}
else {
    NIC->variable("CFLAGS") = "-fno-objc-arc";
    
    NIC->variable("LOADER") = "[[self loadSpecifiersFromPlistName:@\"" . NIC->variable("PROJECTNAME") . "\" target:self] retain]"
}