package ToyBox::Distribution::Debian::Lenny::Perl
use strict;
use warnings;
use utf8;
use base qw/ToyBox::Distribution::Debian/;

__PACKAGE__->mk_classdata(pakcages => [qw/perl perl-doc/ ]); 

1;
