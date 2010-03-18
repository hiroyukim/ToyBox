package ToyBox::Distribution::Debian::Lenny;
use strict;
use warnings;
use utf8;
use base 'ToyBox::Distribution::Debian';
use Template;

__PACKAGE__->mk_classdata('git' => { 
    pkg   => [qw/git-core/],
    after => sub {
        my ($name,$email) = @_;
        
        my $template = q{
            git config --global user.name  [% user.name %]
            git config --global user.email [% user.email %]
            git config core.editor vim
            git config core.pager  less
        };

        my $tt = Template->new({
            EVAL_PERL => 1,
        })->process(\$template,
            {
                user => {
                    name  => $name,
                    email => $email,
                },
            },
            \my $output,
        ) || die Template->error;;

        return $output;
    },
});


1;
