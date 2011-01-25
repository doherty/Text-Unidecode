use strict;
use warnings;
use utf8;
use Test::More tests => 2;
use Text::Unidecode;

my $euro = "\x{20ac}";

is($euro, '€', 'Verify we entered it right');

is(unidecode($euro), 'EUR', 'EUR is the accepted transliteration for the Euro symbol');
