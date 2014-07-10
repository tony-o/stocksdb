#!/usr/bin/env perl

use Modern::Perl;
use LWP::Simple;
use File::Slurp qw<slurp>;
use Cwd 'abs_path';
use DateTime;

my $datadir = abs_path("$0/..");
my $d       = DateTime->now(time_zone => 'America/New_York');
if ($d->day_of_week > 5) {
  say 'day_of_week exit';
  exit 0;
}
if (($d->hour_1 < 9 && $d->minute < 30) || $d->hour_1 > 16) {
  say 'time exit';
  exit 0;
}

my @formats = grep { /.+/ }
              map  { (split ',')[0] } split("\n", slurp("$datadir/data/format.csv"));
my @symbols = grep { /.+/ }
              map  { (split ',')[0] } split("\n", slurp("$datadir/data/symbols.csv"));

my $url     = 'http://download.finance.yahoo.com/d/quotes.csv?f=' . join(',',@formats[1..$#formats]) . '&s=';
my $tmp     = '';
my $idx     = 0;
my $ulimit  = 2034;
my $slimit  = 200;
for my $s (@symbols) {
  if (length $url . $tmp . ",$s" > $ulimit || \$s == \$symbols[-1] || $idx >= $slimit) {
    my $data = get $url . $tmp;
    say $data;
    say 'req len: ' . length($data);
    $tmp = $s;
    $idx = 1;
  } else {
    $tmp .= ",$s";
    $idx++;
  }
}
#my $data = 
#say $data;
#'http://download.finance.yahoo.com/d/quotes.csv?s=AAPL+GOOG+MSFT&e=.csv&f=abo'

