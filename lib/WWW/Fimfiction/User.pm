package WWW::Fimfiction::User;

use strict;
use Moose;

=head1 NAME

WWW::Fimfiction::User - User data

=head1 ACCESSORS

  id    => Int
  name  => Str

=cut

has id => (
	is  => 'rw',
	isa => 'Int',
);

has name => (
	is  => 'rw',
	isa => 'Str',
);

=head1 SEE ALSO

L<WWW::Fimfiction>

=head1 AUTHOR

Cameron Thornton E<lt>cthor@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright (c) 2012 Cameron Thornton.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

=cut

1;