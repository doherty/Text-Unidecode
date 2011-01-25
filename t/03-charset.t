use strict;
use warnings;
use utf8;
use charnames qw(:full);
use Test::More tests => 4;
use Text::Unidecode qw(unidecode unidecode_to_charset);

my $builder = Test::More->builder;
binmode $builder->output,         ':encoding(UTF-8)';
binmode $builder->failure_output, ':encoding(UTF-8)';
binmode $builder->todo_output,    ':encoding(UTF-8)';

my $text       = "\xfc\x{20ac}\N{HORIZONTAL ELLIPSIS}\N{LEFT DOUBLE QUOTATION MARK}";
my $utf8       = 'ü€…“';
my $iso_8859_1 = 'üEUR..."';
my $ascii      = 'uEUR..."';

is($text,                                        $utf8,                              'Check we entered it correctly');
is(unidecode_to_charset('iso-8859-1', $text),    $iso_8859_1,                        'iso-8859-1 can have ü in it, but not €…“');
is(unidecode_to_charset('ascii', $text),         $ascii,                             'ASCII is totally vanilla');
is(unidecode($text),                             unidecode_to_charset(undef, $text), 'ASCII is the default, and matches normal unidecode');
