#!/usr/bin/perl
#####
# rebuild_maillist_group_list.pl
#
# to produce majordomo lists.alias entries from LTER database
# 
# modified for new database and server - James Brunt 6/27/03
# modified to close administrivia bounces - James Brunt 3/12/05
# modified to build group lists from scratch 11/29/07 - JB
# modified to build mailman groups 5/20/15 - JB


use DBI;
use CGI;
#use warnings;
 
####
#  Open connection to DSN.
####

$dbh = DBI->connect('dbi:Sybase:server=SOMEHOST', 'someuser', 'somepass', { RaiseError => 1 });
$dbh->do("use LTER");

$dbh->{'LongTruncOk'} = 0;
$dbh->{'LongReadLen'} = 20000;

$sql = "SELECT dbo.groups.groupname, dbo.groups.groupowner, dbo.person.primaryemail, dbo.person.personid, dbo.groups.status, dbo.groups.groupid, dbo.groups.groupdescription, dbo.groups.grouptype
FROM dbo.groups INNER JOIN
dbo.person ON dbo.groups.groupowner = dbo.person.personid WHERE dbo.groups.status = 1"; 
#AND dbo.groups.groupid = 179";

  $cursor = $dbh->prepare($sql);
  $cursor->execute();
while (@data = $cursor->fetchrow_array()) {
    
my    $listname = $data[0];
my    $owner = 'rootmail@lternet.edu';
#my    $owner = $data[2];
my    $status = $data[4];
my    $groupid = $data[5];
my    $description = $data[6];
my    $type = $data[7];

my $param = "-q $listname $owner $listname.pass";
my $command = "/var/lib/mailman/bin/newlist $param";
print $command . "\n";
system($command);

#build list.config file
open(OUT,">/var/local/mailman/groups/$listname.config");

print OUT <<EnD;
real_name = '$listname'
subject_prefix = '[LTER-$listname]'
description = '$description'
send_welcome_msg = 0
send_goodbye_msg = 0
respond_to_post_requests = 0
subscribe_policy = 2
administrivia       =   1
max_message_size    =   0
advertised = 0 
default_member_moderation = 0
msg_footer = '_______________________________________________\\nLong Term Ecological Research Network\\n%(real_name)s mailing list\\n%(real_name)s\@lternet.edu\\n'
EnD

close(OUT);
my $param = "-i /var/local/mailman/groups/$listname.config $listname";
my $command = "/var/lib/mailman/bin/config_list $param";
print $command . "\n";
system($command);


$sql2 = "SELECT LTER.dbo.groups.groupname, LTER.dbo.person_group.personid, LTER.dbo.person.primaryemail, LTER.dbo.contact.email1, LTER.dbo.person_group.status, LTER.dbo.person_group.groupid, LTER.dbo.contact.email2 FROM LTER.dbo.person INNER JOIN LTER.dbo.person_group ON LTER.dbo.person.personid = LTER.dbo.person_group.personid INNER JOIN LTER.dbo.groups ON LTER.dbo.person_group.groupid = LTER.dbo.groups.groupid LEFT OUTER JOIN LTER.dbo.contact ON LTER.dbo.person.personid = LTER.dbo.contact.personid WHERE (LTER.dbo.person_group.groupid = $groupid ) AND (LTER.dbo.person.primaryemail != '') AND (LTER.dbo.person_group.status = 2 OR LTER.dbo.person_group.status = 3 or LTER.dbo.person_group.status = 1)";

 open(OUT1,">/var/local/mailman/groups/$listname");

$cursor2 = $dbh->prepare($sql2);
$cursor2->execute();

while (@data = $cursor2->fetchrow_array()) {

    my $listname = $data[0];
    my $id = $data[1];
    my $listemail = $data[2];
    my $listemail2 = $data[3];
    my $status = $data[4];
    my $groupid = $data[5];
    my $listemail3 = $data[6];

    my @luqids = (39,40,41,42,54,56,237);

    if (!$listemail eq '') {
        #if ((($groupid == 39) || ($groupid == 40) || ($groupid == 41) || ($groupid == 42) || ($groupid == 54) || ($groupid == 56) || ($groupid == 237)) && ($id == 12575)) {
            #print OUT1 $listemail3 . "\n";
        #} else {
            print OUT1 $listemail . "\n";
            if ($listemail2 =~ /@/) {
                print OUT1 $listemail2 . "\n";
            }
        #}
    }
}

close(OUT1);

my $param = "-a=no -d=no -g=no -w=no -f /var/local/mailman/groups/$listname $listname";
my $command = "/var/lib/mailman/bin/sync_members $param";
print $command . "\n";
system($command);

$cursor2->finish();

}

$cursor->finish();

    close(OUT2);

#Clean up database tables

$sql3 = "UPDATE LTER.dbo.person_group SET LTER.dbo.person_group.status = 1 WHERE LTER.dbo.person_group.status = 2 OR LTER.dbo.person_group.status = 3";

$cursor3 = $dbh->prepare($sql3);
$cursor3->execute();
$cursor3->finish();


$sql4 = "DELETE FROM LTER.dbo.person_group WHERE LTER.dbo.person_group.status = 4 ";
$cursor4 = $dbh->prepare($sql4);
$cursor4->execute();
$cursor4->finish();

$sql5 = "UPDATE LTER.dbo.groups SET LTER.dbo.groups.status = 1 WHERE LTER.dbo.groups.status = 2 OR LTER.dbo.groups.status = 3";

$cursor5 = $dbh->prepare($sql5);
$cursor5->execute();
$cursor5->finish();

$dbh->disconnect();

exit(0);

