use strict;
my $txtcolor;
my $nomobase;
my $the_smdate;
my $the_justhour;
my $version_id;
my $version_ttl;
my $version_stat;

$txtcolor = '#' . $ARGV[1];
$nomobase = $ARGV[0];

$the_smdate = `cat tmpres/smdate.txt`; chomp($the_smdate);
$the_justhour = `cat tmpres/justhour.txt`; chomp($the_justhour);
{
  my $lc_a;
  $lc_a = `cat version-info.txt`;
  ($version_id,$version_stat) = split(/\n/,$lc_a);
}
$version_ttl = 'Version ' . $version_id;
open TAKI, "| cat > tmpres/version-stamp.txt";
print TAKI $version_id . "\n";
close TAKI;

system("convert",($nomobase . ".png"),"-gravity","North","-fill",$txtcolor,"-pointsize","100","-annotate","+0+800",$version_ttl,($nomobase . "005.png"));

system("convert",($nomobase . "005.png"),"-gravity","North","-fill",$txtcolor,"-pointsize","170","-annotate","+0+1650",$the_smdate,($nomobase . "01.png"));

system("convert",($nomobase . "01.png"),"-gravity","North","-fill",$txtcolor,"-pointsize","170","-annotate","+0+1900",$the_justhour,($nomobase . "02.png"));

if ( $version_stat eq 'stable' )
{
  system("convert",($nomobase . "005.png"),($nomobase . ".jpg"));
  exit(0);
}
if ( $version_stat eq 'unstable' )
{
  system("convert",($nomobase . "02.png"),($nomobase . ".jpg"));
  exit(0);
}

die "\nSecond line in \"version-info.txt\" MUST be either \"stable\" or \"unstable\".\n\n";



