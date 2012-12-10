package WWW::Fimfiction::Story;

use strict;
use Moose;
require WWW::Fimfiction;

=head1 NAME

WWW::Fimfiction::Story - Stoy data

=head1 ACCESSORS

  id           => Int
  author       => WWW::Fimfiction::User
  title        => Str
  description  => Str
  status       => Str
  rating       => Str
  wordcount    => Int
  chapters     => ArrayRef[WWW::Fimfiction::Chapter]
  tags         => ArrayRef[Str]
  uri          => URI
  image_uri    => URI | Undef
  views        => Int
  updated      => DateTime

=cut

has id => ( 
	is  => 'rw',
	isa => 'Int',
);

has author => (
	is  => 'rw',
	isa => 'WWW::Fimfiction::User',
);

has title => ( 
	is  => 'rw',
	isa => 'Str',
);

has description => (
	is  => 'rw',
	isa => 'Str',
);

has status => (
	is  => 'rw',
	isa => 'Str',
);

has rating => (
	is  => 'rw',
	isa => 'Str',
);

has wordcount => (
	is  => 'rw',
	isa => 'Int',
);

has chapters => (
	is  => 'rw',
	isa => 'ArrayRef[WWW::Fimfiction::Chapter]',
);

has tags => (
	is  => 'rw',
	isa => 'ArrayRef[Str]',
);

has uri => (
	is  => 'rw',
	isa => 'URI',
	coerce => 1,
);

has image_uri => (
	is  => 'rw',
	isa => 'URI | Undef',
	coerce => 1,
);

has views => (
	is  => 'rw',
	isa => 'Int',
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