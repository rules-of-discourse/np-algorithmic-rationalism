
# Copyright (c) 2018 - Sophia Elizabeth Shapira
# This script is licensed under the terms of the GNU General
# Public License version 2.0 or later.

use strict;
my @arglist;
my $prefixa;
my $eachone;

sub counto {
  my $lc_a;
  $lc_a = @_;
  return $lc_a;
}
@arglist = @ARGV;
if ( &counto(@arglist) < 1.5 ) { die "\nNot enough arguments.\n\n"; }

$prefixa = shift(@arglist);
foreach $eachone (@arglist)
{
  print $prefixa . $eachone . "\n";
}


