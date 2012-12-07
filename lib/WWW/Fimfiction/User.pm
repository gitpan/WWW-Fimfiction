package WWW::Fimfiction::User;

use Moose;

has id => (
	is  => 'rw',
	isa => 'Int',
);

has name => (
	is  => 'rw',
	isa => 'Str',
);

1;