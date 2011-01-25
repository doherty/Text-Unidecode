use strict;
use warnings;
use utf8;
use Test::More;
use Text::Unidecode;

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
