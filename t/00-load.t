use strict;
use warnings;
use Test::More tests => 2;

use_ok('Text::Unidecode');

my $x = join '', "\x00" .. "\x7F";
is(unidecode($x), $x, '7-big purity test');
