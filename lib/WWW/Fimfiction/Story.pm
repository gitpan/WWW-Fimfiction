package WWW::Fimfiction::Story;

use Moose;
require WWW::Fimfiction;

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
	isa => 'Str',
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

1;