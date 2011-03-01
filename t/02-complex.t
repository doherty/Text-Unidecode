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

my $tests = {
    # Complex tests
    "\x{C6}neid" => "AEneid",
    "\x{E9}tude" => "etude",
    "\x{5317}\x{4EB0}" => "Bei Jing ", # Chinese
    "\x{1515}\x{14c7}\x{14c7}" => "shanana", # Canadian syllabics
    "\x{13d4}\x{13b5}\x{13c6}" => "taliqua", # Cherokee
    "\x{0726}\x{071b}\x{073d}\x{0710}\x{073a}" => "ptu'i", # Syriac
    "\x{0905}\x{092d}\x{093f}\x{091c}\x{0940}\x{0924}" => "abhijiit", # Devanagari
    "\x{0985}\x{09ad}\x{09bf}\x{099c}\x{09c0}\x{09a4}" => "abhijiit", # Bangali
    "\x{0d05}\x{0d2d}\x{0d3f}\x{0d1c}\x{0d40}\x{0d24}" => "abhijiit", # Malayalaam
    # The Malayalaam word for "Malayalaam"
    # If we were doing this right, it should come out as "malayalaam" - not "mlyaalm"
    "\x{0d2e}\x{0d32}\x{0d2f}\x{0d3e}\x{0d32}\x{0d2e}\x{0d4d}" => "mlyaalm",
    "\x{3052}\x{3093}\x{307e}\x{3044}\x{8336}" => "genmaiCha ", # Japanese
    'perl5i is MËTÁŁ' => 'perl5i is METAL', # from perl5i.pm
};
plan tests => scalar keys %$tests;

foreach my $line (keys %$tests) {
    my $was    = $line;
    my $should = $tests->{$line};
    my $is     = unidecode($was);

    is($is, $should, "$was -> $is (should be: $should)");
}
