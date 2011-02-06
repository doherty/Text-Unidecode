use strict;
use warnings;
use Test::More tests => 2;

# Avoid "Wide character in print" warning
my $builder = Test::More->builder;
binmode $builder->output,         ":encoding(UTF-8)";
binmode $builder->failure_output, ":encoding(UTF-8)";
binmode $builder->todo_output,    ":encoding(UTF-8)";

use_ok('Text::Unidecode');

my $x = join '', "\x00" .. "\x7F";
is(unidecode($x), $x, '7-big purity test');
