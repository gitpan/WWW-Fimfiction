package WWW::Fimfiction::Chapter;

use Moose;
require WWW::Fimfiction;

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

1;