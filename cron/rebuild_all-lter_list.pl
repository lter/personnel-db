#!/usr/bin/perl

use DBI;

#Connect to database serever
$dbh = DBI->connect('dbi:Sybase:server=SOMEHOST', 'someuser', 'somepass', {
RaiseError => 1}) || die;
$dbh->do("use LTER");

#Setup the query
$sql = "SELECT     dbo.person.primaryemail
  FROM         dbo.person INNER JOIN
                      dbo.ltertable ON dbo.person.personid = dbo.ltertable.personid
  WHERE     (dbo.person.primaryemail IS NOT NULL) 
  AND (dbo.person.primaryemail <> '') 
  AND (dbo.person.status = 1) 
  AND (dbo.ltertable.primarynetwork = 'us')
  AND (dbo.ltertable.personid != 12275)";


open(OUT,">/var/local/mailman/lists/all-lter");

$cursor = $dbh->prepare($sql);
#do the query
$cursor->execute;

#Fetch results and process them
while (@row = $cursor->fetchrow_array){
	my %row_data;
	if  ($row[0] =~ /^$/){
		break;
	}else{
		print OUT "$row[0]\n";
	}
}
$cursor->finish();

close(OUT);
my $param = "-a=no -w=no -g=no -d=no -f /var/local/mailman/lists/all-lter all-lter";
my $command = "/var/lib/mailman/bin/sync_members $param";
print $command . "\n";
system($command);

$dbh->disconnect;



