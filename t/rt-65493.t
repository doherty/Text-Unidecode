use strict;
use warnings;
use utf8;
use Test::More tests => 2;
sub Text::Unidecode::DEBUG {1};
use Text::Unidecode;

# Avoid "Wide character in print" warning
my $builder = Test::More->builder;
binmode $builder->output,         ":encoding(UTF-8)";
binmode $builder->failure_output, ":encoding(UTF-8)";
binmode $builder->todo_output,    ":encoding(UTF-8)";

my $tm = "\x{2122}";

is($tm, '™', 'Verify we entered it right');
is(unidecode($tm), '(TM)', 'Useful transliteration of the trademark symbol');
