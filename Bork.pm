package Lingua::Bork;

use strict;
use warnings;

require Exporter;

use vars qw(@ISA %EXPORT_TAGS @EXPORT_OK $VERSION)

@ISA = qw(Exporter);

%EXPORT_TAGS = ( 'all' => [ 'bork' ] );
@EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

$VERSION = '0.01';

my %map = ( tion => 'shun',
            the  => 'zee',
            an   => 'un',
            au   => 'oo',
            en   => 'ee',
            ir   => 'ur',
            ow   => 'oo',
            E    => 'I',
            e    => 'ea',
            f    => 'ff',
            i    => 'ee',
            o    => 'u',
            u    => 'oo',
            v    => 'f',
            w    => 'v',
           );

sub new {
  my $class = shift;
  bless {}, ref($class)||$class;
}

sub bork {
   local $_ = shift;
   s/\b(\w)(\w+)/\u$1\L$2/g;
   s/(tion|\bthe\b|an|au|en\b|ir|ow|\bE|e\b|f|i|\Bo\B|u|v|w)/$map{$1}/g;
   s/([.!?])+/$1  Bork Bork Bork!/g;
   return $_;
}

1;
__END__

=head1 NAME

Lingua::Bork - Perl extension for Bork Bork Bork

=head1 SYNOPSIS

  use Lingua::Bork 'bork';
  print bork("This is the conjunction junction.")

=head1 DESCRIPTION

Bork Bork Bork.

=head1 EXPORT

None by default.

Can export bork function for convenience.

=head1 AUTHOR

Michael Ching, E<lt>michaelc@wush.netE<gt>

=head1 SEE ALSO

http://www.cs.yorku.ca/course_archive/2000-01/W/3311/assignments/a1.pdf

=head1 KNOWN PROBLEMS

Automagically title cases words to distinguish start and end 'e'.

This man page is not in Bork Bork Bork.

=cut