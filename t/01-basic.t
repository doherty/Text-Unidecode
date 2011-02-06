use strict;
use warnings;
use utf8;
use Test::More;
use Text::Unidecode;

# Avoid "Wide character in print" warning
my $builder = Test::More->builder;
binmode $builder->output,         ":encoding(UTF-8)";
binmode $builder->failure_output, ":encoding(UTF-8)";
binmode $builder->todo_output,    ":encoding(UTF-8)";

my @tests = ( # Basic string tests
    "",
    1/10,
    "I like pie.",
    "\n",
    "\cm\cj",
    "I like pie.\n",
);
plan tests => scalar @tests;

foreach my $line (@tests) {
    my $is = unidecode($line);
    is($is, $line, "$line comes through unidecode unscathed");
}
