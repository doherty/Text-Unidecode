use strict;
use warnings;
use utf8;
use Test::More tests => 2;
use Text::Unidecode;

my $sterling  = "\x{a3}";

is($sterling,  "£", 'Verify we entered it right');

is(unidecode($sterling),  'GBP', 'GBP is a better transliteration than PS');
