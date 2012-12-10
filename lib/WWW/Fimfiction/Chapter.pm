package WWW::Fimfiction::Chapter;

use strict;
use Moose;
require WWW::Fimfiction;

=head1 NAME

WWW::Fimfiction::Chapter - Chapter data

=head1 ACCESSORS

  id        => Int
  title     => Str
  wordcount => Int
  views     => Int
  uri       => URI
  updated   => DateTime

=cut

has id => (
	is  => 'rw',
	isa => 'Int',
);

has title => (
	is  => 'rw',
	isa => 'Str',
);

has wordcount => (
	is  => 'rw',
	isa => 'Int',
);

has views => (
	is  => 'rw',
	isa => 'Int',
);

has uri => (
	is  => 'rw',
	isa => 'URI',
	coerce => 1,
);

has updated => (
	is  => 'rw',
	isa => 'DateTime',
	coerce => 1,
);

=head1 SEE ALSO

L<WWW::Fimfiction>,
L<URI>,
L<DateTime>

=head1 AUTHOR

Cameron Thornton E<lt>cthor@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright (c) 2012 Cameron Thornton.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

=cut

1;