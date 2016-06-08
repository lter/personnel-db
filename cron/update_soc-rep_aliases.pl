#!/usr/bin/perl
#####
# update_soc-rep_aliases.pl
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
# modified to create a mailalias for social science committee reps from sitedb - James Brunt 2/8/11	 
#

use DBI;
use CGI;
#use warnings;
 
####
#  Open connection to data.
####

$dbh = DBI->connect('SOMEDB', 'someuser', 'somepass', { RaiseError => 1 });
$dbh->{'LongTruncOk'} = 0;

$dbh2 = DBI->connect('dbi:Sybase:server=SOMEHOST', 'someuser', 'somepass', { RaiseError => 1 });

$dbh2->do("use LTER");
$dbh2->{'LongTruncOk'} = 0;


$sql = "SELECT DISTINCT  site_id_text, social_rep
FROM  ltersites"; 

  $cursor = $dbh->prepare($sql);
  $cursor->execute();
while (@data = $cursor->fetchrow_array()) {

my    $site = $data[0];
my    $socrep = $data[1];

$sql2 = "UPDATE person_group SET personid = $socrep WHERE groupid = 264 AND site = '$site'";
#print $sql2 . "\n";
$sql3 = "Select count(*) from person_group where personid= $socrep AND groupid= 200";
#print $sql3 . "\n";
$sql4 = "INSERT INTO person_group ( personid, groupid, status ) VALUES ($socrep, 200, 1)";
#print $sql4 . "\n";

if ($socrep != ''){
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
$dbh->disconnect();

close(OUT);

exit(0);

