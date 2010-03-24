package ToyBox::Distribution::Debian::Lenny::Java
use strict;
use warnings;
use utf8;
use base qw/ToyBox::Distribution::Debian/;

__PACKAGE__->mk_classdata(pakcages => [qw/sun-java6-jdk sun-java6-demo sun-java6-source sun-java6-doc sun-java6-plugin sun-java6-fonts ant/ ]); 

1;
