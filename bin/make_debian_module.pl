#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Getopt::Long;
use Template;
use FindBin;
use Path::Class;
use String::CamelCase qw(camelize);

my %opts;

GetOptions(
    \%opts,
    'module_name=s'  ,
    'package_names=s',
    'code_name=s'    ,
) or die $@;

die unless ( 3 == grep { $opts{$_} } keys %opts );

$opts{module_name} = camelize $opts{module_name};
$opts{code_name}   = ucfirst  $opts{code_name};

my $lib_path    = dir($FindBin::Bin,'..','lib');
my $module_path = file($lib_path,'ToyBox','Distribution','Debian',$opts{code_name},$opts{module_name}.'.pm');

my $template = <<TEMPLATE; 
package ToyBox::Distribution::Debian::[% code_name %]::[% module_name %]
use strict;
use warnings;
use utf8;
use base qw/ToyBox::Distribution::Debian/;

__PACKAGE__->mk_classdata(pakcages => [qw/[% package_names.replace(',',' ') %]/ ]); 

1;
TEMPLATE

my $tt = Template->new({
    EVAL_PERL => 1,
})->process( 
    \$template,
    \%opts,
    \my $data,
) or die Template->error;

my $fh = $module_path->openw or die $!;
print $fh $data;
$fh->close;

warn $module_path . "\n";
warn $data . "\n";

__END__

perl bin/make_debian_module.pl --package_name=perl,perl-doc --module_name=perl --code_name=lenny
