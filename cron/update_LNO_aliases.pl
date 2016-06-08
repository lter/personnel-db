#!/usr/bin/perl
#####
# update_LTERnet_aliases.pl
#
# to produce UNIX style mail alias listings from LTER database
# NOTE: run as root
# James W Brunt 5/19/03
# modified for new database and server - James Brunt 6/27/03
# modified field name from dbo.person.id to dbo.ltertable.emailalias
# as dbo.person.id is deprecated - mmurillo 12 May 2004
# modified to check for a blank emailalias - James Brunt 3/24/05
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
$dbh->{'LongReadLen'} = 20000;


$sql = "SELECT DISTINCT dbo.person.lastname, dbo.person.firstname, 
                        dbo.ltertable.emailalias, dbo.person.primaryemail, 
                        dbo.contact.email1
FROM  dbo.ltertable 
INNER JOIN dbo.person 
   ON dbo.ltertable.personid = dbo.person.personid 
left outer JOIN dbo.contact 
   ON dbo.person.personid = dbo.contact.personid
WHERE dbo.person.status !=4 AND (dbo.ltertable.primarysite = 'LNO')

ORDER BY dbo.person.lastname";

open(OUT,">/etc/aliases.lno");
print OUT "#----: A u t o m a t i c a l l y   G e n e r a t e d   A l i a s e s \n";
print OUT "####!!!---EVERYTHING BELOW THIS LINE IS AUTOMATICALLY GENERATED---!!!###\n";
print OUT "####--------------------------------------------------------------------\n";

  $cursor = $dbh->prepare($sql);
  $cursor->execute();
while (@data = $cursor->fetchrow_array()) {

my    $lastname = $data[0];
my    $firstname = $data[1];
my    $emailalias = $data[2];
my    $eaddress1 = $data[3];
my    $eaddress2 = $data[4];

   if (!$emailalias eq '' and !$eaddress1 eq '' and $eaddress2 eq '') {
	print OUT $emailalias . ":\t" . "\"" . $firstname . " " . $lastname . "\" <" . $eaddress1 . ">\n";
    }
    if (!$emailalias eq '' and !$eaddress1 eq '' and !$eaddress2 eq '') {
    print OUT $emailalias . ":\t" . "\"" . $firstname . " " . $lastname . "\" <" . $eaddress1 . ">,\n\t<" . $eaddress2 . ">\n";
   }

}

$cursor->finish();
$dbh->disconnect();

close(OUT);

system("/etc/update_aliases");

exit(0);

