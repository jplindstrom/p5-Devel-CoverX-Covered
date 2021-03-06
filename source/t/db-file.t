
use strict;
use warnings;
use Test::More tests => 13;
use Test::Exception;

use Path::Class;
use File::Path;



use lib "lib", "t/lib";
use Test::Covered;
my $test_dir = dir(qw/ t data cover_db /);

use Devel::CoverX::Covered::Db;




diag("Create db file");

my $count;

ok(my $covered_db = Devel::CoverX::Covered::Db->new(dir => $test_dir), "Create DB ok");
ok($covered_db->db, "  and got db object");


diag("get_file_id");

sub count_rows {
    my ($db) = @_;
    $db->query("select count(*) from file")->into( my $count );
    return $count;
}

is(count_rows($covered_db->db), 0, "Initially empty table");

my $file_name_1 = "one.txt";
ok(my $file_id_1 = $covered_db->get_file_id($file_name_1), "Got id for one");
is(count_rows($covered_db->db), 1, "First get inserted a row");


is($covered_db->get_file_id($file_name_1), $file_id_1, "Got same id for one again");
is(count_rows($covered_db->db), 1, "Second get didn't insert a row");



   
__END__
