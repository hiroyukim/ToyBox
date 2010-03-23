package ToyBox;
use strict;
use warnings;
use utf8;
use base 'Class::Accessor::Fast';
use UNIVERSAL::require;
use Params::Validate qw(:all); 

__PACKAGE__->mk_accessors(qw/file data/);

sub new {
    my $class = shift;
    my %args  = validate(@_,{
        file => { type => SCALAR },
    });

    my $self = bless \%args,$class;

    $self->_init;

    return $self;
}

sub _init {
    my $self = shift;

    $self->_load_file;
}

sub _load_file {
    my $self = shift;
    return $self->data(YAML::Syck::LoadFile($self->file));
}


1;
