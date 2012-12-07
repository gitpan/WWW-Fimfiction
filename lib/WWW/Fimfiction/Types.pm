package WWW::Fimfiction::Types;

use Moose::Util::TypeConstraints;
use DateTime;
use URI;

class_type 'URI';
coerce 'URI',
	from 'Str',
	via { URI->new($_, 'http') };

class_type 'DateTime';
coerce 'DateTime',
	from 'Int',
	via { DateTime->from_epoch( epoch => $_ ) };

1;