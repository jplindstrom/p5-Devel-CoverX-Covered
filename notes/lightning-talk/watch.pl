#!/usr/bin/env perl
use strict; use warnings;
use Getopt::Long;
use Time::HiRes qw/ sleep /;

main();
sub main {
    GetOptions(
        "run:s"       => \( my $run ),
        "initial-run" => \( my $initial_run ),
    );
    my @files = @ARGV;
    @files && $run or die("Syntax: $0 --run=COMMAND FILES

Watch the FILES and whenever any of them changes, run COMMAND \$FILE
for each of them.");

    my $file_stats = $initial_run
        ? { }
        : get_stats(@files);

    while(1) {
        my $file_new_stats = get_stats(@files);

        my @files_to_run =
            grep { $file_new_stats->{$_} ne ($file_stats->{$_} || 0) }
            @files;
        for my $file (@files_to_run) {
            print "$run $file\n";
            system($run, $file);
        }

        $file_stats = $file_new_stats;
        sleep(0.2);
    }
}

sub get_stats {
    my (@files) = @_;
    return {
        map { $_ => ( -M $_ ) }
        @files
    };
}


