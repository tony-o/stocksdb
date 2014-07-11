#!/usr/bin/env perl

use Cwd qw<abs_path>;
use lib abs_path("$0/../../lib");
use Modern::Perl;
use Config::General;
use Getopt::Long::Descriptive;
use Try::Tiny;
use DB::Schema;

my $conf    = Config::General->new(abs_path("$0/../../lib/DB/db.conf"));
my %config  = $conf->getall;

my ($opt, $usage) = describe_options(
  "$0 %o",
    [ 'db=s',          'name of database',             { default => $config{$config{default}}{db},   required => 1 }  ],
    [ 'user=s',        'username for database',        { default => $config{$config{default}}{user}, required => 1 }  ],
    [ 'pass=s',        'password for database',        { default => $config{$config{default}}{pass}, required => 1 }  ],
    [ 'host=s',        'host/ip for database',         { default => $config{$config{default}}{host}, required => 1 }  ],
    [ 'drop_tables',   'drop tables if already exist',           ],
    [ 'debug',         'Show SQL queries via dbix::class debug', ],
    [],
    [ 'db_type' => hidden => { required => 1, one_of => [
            ['Pg|p',     'postgres' ],
            ['mysql|m',  'mysql'    ],
            ['SQLite|s', 'sqlite'   ],
            ['Oracle|o', 'oracle'   ],            
    ] } ],
    [],
    [ 'help', 'print usage message and exit'  ],
);
if( $opt->help ) {
    say $usage->text;
    exit;
}


say   "Connecting to: "
    . "\n\tDB: "      . $opt->db 
    . "\n\tDB type: " . $opt->db_type 
    . "\n\tuser: "    . $opt->user 
    . "\n\tpass: "    . $opt->pass 
    . "\n\thost: "    . $opt->host;

my $connect_str = "DBI:". get_db_type( $opt->db_type ) . 
                              ":dbname=" . $opt->db . 
                              ';host='   . $opt->host; 

my $schema = DB::Schema->connect($connect_str, $opt->user, $opt->pass) or die 'Unable to connect to db.';

$schema->storage->debug($opt->debug?1:0);

say "\nConnected To Database. Attempting to deploy the following schemas:"
    . "\t" . join(', ', $schema->sources);

$schema->deploy({ add_drop_table => $opt->drop_tables });

# This could be modified to look at each table and try to insert a row into them to test them all.
# For now we just test a known table and column
my $stocks  = $schema->resultset('Stock');

try {
    my $row = $stocks->create({ a => 1 });
    say 'Row creation succeeded.';
    $row->delete;
    say 'Schema creations succeeded.'
} 
catch {
    warn "caught error: $_";
    say 'Schema creations failed';
};


1;


sub get_db_type {
    my $db = shift;

    return 'Pg'     if( $db =~ /^p(?:g|ostres)?$/i);
    return 'SQLite' if( $db =~ /^s(?:qlite)?$/i);
    return 'mysql'  if( $db =~ /^m(?:ysql)?$/i);
    return 'Oracle' if( $db =~ /^o(?:racle)?$/i);

    return $opt->db_type;
}


__END__
