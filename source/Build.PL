use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Devel::CoverX::Covered',
    license             => 'perl',
    dist_author         => 'Johan Lindström <johanl[ÄT]DarSerMan.com>',
    dist_version_from   => 'lib/Devel/CoverX/Covered.pm',
    requires => {
        'Carp'              => 0,
        'DBD::SQLite'       => 1.12,
        'DBIx::Simple'      => 0,
        'Data::Dumper'      => 0,
        'Devel::Cover'      => 0.64,
        'File::Basename'    => 0,
        'File::Slurp'       => 0,
        'File::chdir'       => 0,
        'Getopt::Long'      => 0,
        'List::MoreUtils'   => 0,
        'Memoize'           => 0,
        'Moose'             => 0,
        'Path::Class'       => 0.11,
        'Pod::Usage'        => 0,
        'SQL::Abstract'     => 0,
        'Test::Differences' => 0,
        'Test::Exception'   => 0,
        'Test::More'        => 0,
        'perl'              => '5.6.0',
    },
    script_files => [
        "bin/covered",
       ],  
    add_to_cleanup      => [ 'Devel-CoverX-Covered-*' ],
    create_readme => 1,
    create_makefile_pl => 'traditional',
);
$builder->create_build_script();
