#!/usr/bin/perl
#####
# update_CAP_list.pl
#
# to produce UNIX style mail alias listings from LTER database
# NOTE: run as root
# James W Brunt 5/19/03
# modified for new database and server - James Brunt 6/27/03
# modified field name from dbo.person.id to dbo.ltertable.emailalias
# as dbo.person.id is deprecated - mmurillo 12 May 2004
# modified to check for a blank emailalias - James Brunt 3/24/05
# modified to create a mailalias for SEV graduate students - James Brunt 12/19/07	 
# modified to create a mailalias for climate committee reps from sitedb - James Brunt 9/24/10	 
#
#modifed to create grad list for HBR - James 7/14/2014
#modifed to create grad list for SEV - James 7/14/2014
#modifed to create list for CAP - James 7/14/2014

use DBI;
use CGI;
#use warnings;
 
####
#  Open connection to data.
####

$dbh2 = DBI->connect('dbi:Sybase:server=SOMEHOST', 'someuser', 'somepass', { RaiseError => 1 });

$dbh2->do("use LTER");
$dbh2->{'LongTruncOk'} = 0;

$sql = "SELECT LTER.dbo.person.personid
FROM  LTER.dbo.ltertable
INNER JOIN dbo.person
   ON LTER.dbo.ltertable.personid = LTER.dbo.person.personid
WHERE LTER.dbo.person.status !=4 AND LTER.dbo.ltertable.primarysite = 'CAP'
ORDER BY LTER.dbo.person.lastname";

#$sql = "SELECT personid
#FROM  LTER.dbo.ltertable where primarysite = 'CAP'"; 

  $cursor = $dbh2->prepare($sql);
  $cursor->execute();
while (@data = $cursor->fetchrow_array()) {

my    $person = $data[0];

$sql2 = "UPDATE LTER.dbo.person_group SET personid = $person WHERE groupid = 305 AND site = 'CAP'";
print $sql2 . "\n";
$sql3 = "Select count(*) from LTER.dbo.person_group where personid= $person AND groupid= 305";
print $sql3 . "\n";
$sql4 = "INSERT INTO LTER.dbo.person_group ( personid, groupid, status ) VALUES ($person, 305, 1)";
print $sql4 . "\n";

if ($person != ''){
#do this
  $cursor2 = $dbh2->prepare($sql2);
  $cursor2->execute();
  $cursor2->finish();
# then do this
my $rowcount = 0;
  $cursor3 = $dbh2->prepare($sql3);
  $cursor3->execute();
while (@data2 = $cursor3->fetchrow_array()) {

$rowcount=$data2[0];
}
$cursor3->finish();


if ($rowcount == 0){
$cursor4 = $dbh2->prepare($sql4);
    $cursor4->execute();
    $cursor4->finish();
	}
}
   }

$cursor->finish();
$dbh2->disconnect();

close(OUT);

exit(0);

