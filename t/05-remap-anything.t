use strict;
use warnings;
use utf8;
use Test::More;
use Text::Unidecode qw(unidecode remap);

my %remap = (
    'A' => 'The letter "A"',
    'B' => 'The letter "B"',
);
plan tests => scalar keys(%remap) * 2 + 1;
while (my ($char, $remap) = each %remap) {
    remap($char, $remap);
    is $Text::Unidecode::{'Char'}->[ord($char)>>8]->[ord($char)&255], $remap, 'Remap was successful';
}

while (my ($char, $remap) = each %remap) {
    is(unidecode($char), $remap, 'Remapping successful');
}
is(unidecode('A£BC€DE'), 'The letter "A"GBPThe letter "B"CEURDE', 'Remapping successful');
