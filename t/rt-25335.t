use strict;
use warnings;
use utf8;
use Test::More tests => 2;
use Text::Unidecode;

# Avoid "Wide character in print" warning
my $builder = Test::More->builder;
binmode $builder->output,         ":encoding(UTF-8)";
binmode $builder->failure_output, ":encoding(UTF-8)";
binmode $builder->todo_output,    ":encoding(UTF-8)";

my $sterling  = "\x{a3}";

is($sterling,  "£", 'Verify we entered it right');

is(unidecode($sterling),  'GBP', 'GBP is a better transliteration than PS');
