use Modern::Perl;
use Config::General;
use Getopt::Long::Descriptive;
use DBIx::Class::Schema::Loader qw/ make_schema_at /;

my $conf    = Config::General->new("../lib/DB/db.conf");
my %config  = $conf->getall;

my ($opt, $usage) = describe_options(
  "$0 %o",
    [ 'db=s',          'name of database',             { default => $config{$config{default}}{db},   required => 1 }  ],
    [ 'user=s',        'username for database',        { default => $config{$config{default}}{user}, required => 1 }  ],
    [ 'pass=s',        'password for database',        { default => $config{$config{default}}{pass}, required => 1 }  ],
    [ 'host=s',        'host/ip for database',         { default => $config{$config{default}}{host}, required => 1 }  ],
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

make_schema_at(
    'DB::Schema',
    { 
      debug          => 1,
      components     => ["InflateColumn::DateTime"],
      dump_directory => '../lib',
      use_moose      => 1,
    },
    [ 
        "dbi:". get_db_type( $opt->db_type ) . ":dbname=" . $opt->db . ':host='   . $opt->host, $opt->user, $opt->pass
    ],
);


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