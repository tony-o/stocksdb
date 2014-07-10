use 5.008_008;
use strict;
use warnings; 
use ExtUtils::MakeMaker;

my $pm =   'lib/DB/Schema.pm';
my $repo = 'https://github.com/ugexe/StocksDB';
my $bugs = 'https://github.com/ugexe/StocksDB/issues';
 
WriteMakefile (  
    NAME           => 'DB::Schema',
    VERSION_FROM   => $pm, 
    ABSTRACT_FROM  => $pm,
    AUTHOR         => 'Nick Logan <ugexe@cpan.org>',
    LICENSE        => 'perl',
    MIN_PERL_VERSION => '5.014',
    PREREQ_PM      => {
        'DBIx::Class'                          => 0,
        'DBIx::Class::InflateColumn::DateTime' => 0,
        'MooseX::MarkAsMethods'                => 0.13,
        'MooseX::NonMoose'                     => 0.16,
        'DBIx::Class::Schema::Loader'          => 0, 
        'Modern::Perl'                         => 0,
        'Try::Tiny'                            => 0,
        'Getopt::Long::Descriptive'            => 0,
        'Config::General'                      => 0,
    },
    BUILD_REQUIRES => {
        'Test::More'        => 0,
    },
    META_MERGE => {
        resources => {
            repository => $repo, 
            bugtracker => "$bugs",
        },
    },
);