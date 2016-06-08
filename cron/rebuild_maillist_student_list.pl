#!/usr/bin/perl
#####
# to produce UNIX style mail alias listings from LTER database
# NOTE: run as root
# James W Brunt 5/19/03
# modified for new database and server - James Brunt 6/27/03
# modified field name from dbo.person.id to dbo.ltertable.emailalias
# as dbo.person.id is deprecated - mmurillo 12 May 2004
# modified to check for a blank emailalias - James Brunt 3/24/05
# modified to create a mailalias for SEV graduate students - James Brunt 12/19/07	 
# modified to creat a new student list - James Brunt 6/01/2009
# modified to  add list to groups - James Brunt 6/01/2009


use DBI;
use CGI;
#use warnings;
 
####
#  Open connection to DSN.
####

$dbh = DBI->connect('dbi:Sybase:server=SOMEHOST', 'someuser', 'somepass', { RaiseError => 1 });
$dbh->do("use LTER");

$dbh->{'LongTruncOk'} = 0;

#DROP everyone from person_group for this list

$sql0 = "DELETE FROM person_group WHERE groupid = 270";
  
  $cursor0 = $dbh->prepare($sql0);
  $cursor0->execute();
  $cursor0->finish();

#FIND all current graduate students

$sql = "SELECT DISTINCT dbo.person.personid 
FROM  dbo.ltertable 
INNER JOIN dbo.person 
   ON dbo.ltertable.personid = dbo.person.personid 
WHERE dbo.person.status !=4 AND 
dbo.ltertable.primaryrole = 'GS'";

  $cursor = $dbh->prepare($sql);
  $cursor->execute();
while (@data = $cursor->fetchrow_array()) {

my $student = $data[0];
#print $student . "\n";

#INSERT all graduate students

$sql2 = "INSERT INTO LTER.dbo.person_group (personid, groupid, status) VALUES($student, 270, 1)";
#print $sql2 . "\n";
  $cursor2 = $dbh->prepare($sql2);
  $cursor2->execute();
  $cursor2->finish();
}

$cursor->finish();
$dbh->disconnect();

close(OUT);

exit(0);

