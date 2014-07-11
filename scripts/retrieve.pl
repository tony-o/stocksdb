#!/usr/bin/env perl

use Modern::Perl;
use LWP::Simple;
use File::Slurp qw<slurp>;
use Cwd 'abs_path';
use DateTime;
use List::MoreUtils qw<zip>;
use Text::CSV_XS;
use DB::Schema;
use Getopt::Long::Descriptive;
use Config::General;
use Try::Tiny;
use Parallel::ForkManager;

my $conf    = Config::General->new(abs_path("$0/../../lib/DB/db.conf"));
my %config  = $conf->getall;
my ($opt, $usage) = describe_options(
  "$0 %o",
    [ 'db=s',          'name of database',             { default => $config{$config{default}}{db},   required => 1 }  ],
    [ 'user=s',        'username for database',        { default => $config{$config{default}}{user}, required => 1 }  ],
    [ 'pass=s',        'password for database',        { default => $config{$config{default}}{pass}, required => 1 }  ],
    [ 'host=s',        'host/ip for database',         { default => $config{$config{default}}{host}, required => 1 }  ],
    [ 'db_type' => hidden => { required => 1, one_of => [
            ['Pg|p',     'postgres' ],
            ['mysql|m',  'mysql'    ],
            ['SQLite|s', 'sqlite'   ],
            ['Oracle|o', 'oracle'   ],            
    ], default => 'p' } ],
    [ 'help', 'print usage message and exit'  ],
);
if( $opt->help ) {
    say $usage->text;
    exit;
}


my $connect_str = "DBI:Pg" . # get_db_type( $opt->db_type ) . 
                              ":dbname=" . $opt->db . 
                              ';host='   . $opt->host; 
my $schema = DB::Schema->connect($connect_str, $opt->user, $opt->pass) or die 'Unable to connect to db.';
$schema->storage->sql_maker->quote_char('"');

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

my @formats = grep { /^[^#].*/ }
              map  { (split ',')[0] } split("\n", slurp("$datadir/data/format.csv"));
my @symbols = grep { /^[^#].*/ }
              map  { (split ',')[0] } split("\n", slurp("$datadir/data/symbols.csv"));

my $url     = 'http://download.finance.yahoo.com/d/quotes.csv?f=' . join('',@formats) . '&s=';
my $idx     = 0;
my $ulimit  = 2034;
my $slimit  = 200;
my $csv     = Text::CSV_XS->new;
my $rs      = $schema->resultset('Stock');
my %months  = ( 'jan' => 1, 'feb' => 2, 'mar' => 3, 'apr' => 4, 'may' => 5, 'jun' => 6, 'jul' => 7, 'aug' => 8, 'sep' => 9, 'oct' => 10, 'nov' => 11, 'dec' => 12 );
my $fm      = Parallel::ForkManager->new(20);
my @tmp;
my @datas;

for my $s (@symbols) {
  if (length $url . length(join ',', @tmp) . ",$s" > $ulimit || \$s == \$symbols[-1] || $idx >= $slimit) {
    push @datas, get($url . join(',', @tmp));
    @tmp = ($s);
    $idx = 1;
  } else {
    push @tmp, $s;
    $idx++;
  }
}

my $cnt = 0;
$fm->run_on_finish(sub {
  say 'Open forks-: ' . (--$cnt);
});

$fm->run_on_start(sub {
  say 'Open forks+: ' . (++$cnt);
});

for my $dta (@datas) {
  $fm->start and next;
  try {
    my $data = $dta;
    $data =~ s/\r//g;
    for my $line (split "\n", $data) {
      $csv->parse($line);
      my @values = $csv->fields;
      my %hash = zip(@formats, @values);
      for my $k (keys %hash) {
        $hash{$k} = undef if defined($hash{$k}) && ( $hash{$k} eq 'N/A' || $hash{$k} eq '-' || $hash{$k} eq '' );
        $hash{$k} = substr($hash{$k},0,-1) / 100.0 if defined($hash{$k}) && substr($hash{$k}, -1) eq '%';
        if (index('|r1|q|', "|$k|") >= 0 && defined($hash{$k})) {
          #parse date
          try {
            my ($mon,$day) = map { lc $_ } split ' ', $hash{$k};
            my $d = DateTime->now;
            $d->set(month => $months{$mon}, day => $day);
            $hash{$k} = $d;
          } catch { $hash{$k} = undef; };
        } elsif (index('t1', $k) >= 0 && defined($hash{$k})) {
          #parse time
          try { 
            my ($hour,$min) = split ':', $hash{$k};
            $hour += 12 if index($min, 'pm') > -1;
            $min  =~ s/[apm]+//g;
            my $d = DateTime->now;
            $d->set(hour => $hour, minute => $min);
            $hash{$k} = $d;
          } catch { $hash{$k} = undef; };
        }
      }
      try {
        my $result = $rs->create({%hash});
      } catch {
        warn 'Insert error: ' . $_; 
      };
    }     
  };
  $fm->finish;
}
$fm->wait_all_children;

sub get_db_type {
    my $db = shift;
    return 'Pg'     if( $db =~ /^p(?:g|ostres)?$/i);
    return 'SQLite' if( $db =~ /^s(?:qlite)?$/i);
    return 'mysql'  if( $db =~ /^m(?:ysql)?$/i);
    return 'Oracle' if( $db =~ /^o(?:racle)?$/i);
    return $opt->db_type;
}
