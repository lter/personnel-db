#!/usr/bin/perl
#####
# mailout_group_list.pl
#
# to produce email detailing some group list entries from LTER database
# 
# modified for new database and server - James Brunt 6/27/03
# modified to close administrivia bounces - James Brunt 3/12/05
# modified to build group lists from scratch 11/29/07 - JB
#

use DBI;
use CGI;


#use warnings;
 
####
#  Open connection to DSN.
####

$dbh = DBI->connect('dbi:Sybase:server=SOMEHOST', 'someuser', 'somepass', { RaiseError => 1 });
$dbh->do("use LTER");

$dbh->{'LongTruncOk'} = 0;
#$dbh->{'LongReadLen'} = 20000;

my $sql = "SELECT LTER.dbo.person.firstname ,LTER.dbo.person.lastname, 
   LTER.dbo.person.primaryemail, LTER.dbo.ltertable.primarysite, LTER.dbo.person_group.groupid FROM LTER.dbo.person 
   INNER JOIN LTER.dbo.person_group ON LTER.dbo.person.personid = LTER.dbo.person_group.personid 
   INNER JOIN LTER.dbo.ltertable ON LTER.dbo.person.personid = LTER.dbo.ltertable.personid
   LEFT OUTER JOIN LTER.dbo.contact ON LTER.dbo.person.personid = LTER.dbo.contact.personid 
   WHERE (LTER.dbo.person_group.groupid = 38 ) ORDER BY LTER.dbo.ltertable.primarysite"; 

   open my $fh, '>', \$variable or die "Can't open variable: $!";
   print $fh "<h1>This is the LTER LPI mail list for your review</h1>";
print $fh "<ul>";
  $cursor = $dbh->prepare($sql);
  $cursor->execute();
while (@data = $cursor->fetchrow_array()) {
    
my    $firstname = $data[0];
my    $lastname = $data[1];
my    $primaryemail = $data[2];
my    $primarysite = $data[3];

print $fh "<li>" . $firstname . " " . $lastname . ", " . $primaryemail . ", " . $primarysite . "\n";
}

print $fh "</ul>";
print $fh "<em>Reply to this message with any corrections</em>";
close $fh;

 use Mail::Sender;

        eval {
                (new Mail::Sender)
                ->OpenMultipart({
                        to => 'rwaide@lternet.edu',
                        cc => 'jbrunt@lternet.edu',
                        from => 'tech-support@lternet.edu',
                        subject => 'Monthly LTER Lead PI Email List Review',
                        smtp => 'smtp.lternet.edu',
                        multipart => 'mixed',
                })
                        ->Part({ctype => 'multipart/related'})
                           ->Part({ctype => 'text/html', disposition => 'NONE', msg => $variable })
                        ->EndPart("multipart/related")
                ->Close();
        } or print "Error sending mail: $Mail::Sender::Error\n";
        

$cursor->finish();

$dbh->disconnect();

exit(0);

