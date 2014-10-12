#!/usr/bin/env perl
use strict; use warnings;
my ($haml_file) = @ARGV;
my $html_file = $haml_file || "";
$html_file =~ s/\.haml$/.html/ or die("Syntax: $0 FILE.haml\n");
system("haml", $haml_file, $html_file); # , "--style=ugly"
