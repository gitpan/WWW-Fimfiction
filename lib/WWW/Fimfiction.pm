package WWW::Fimfiction;

use 5.006;
use strict;
use warnings FATAL => 'all';
use base 'Exporter';
use LWP::UserAgent;
use Carp 'croak';
use JSON 'decode_json';
use WWW::Fimfiction::_types;
use WWW::Fimfiction::Story;
use WWW::Fimfiction::User;
use WWW::Fimfiction::Chapter;

our @EXPORT_OK = ('story');
our $VERSION = 'v0.2.1';

my $ua = LWP::UserAgent->new( timeout => 10 );
$ua->agent(__PACKAGE__ . ' ');

=head1 NAME

WWW::Fimfiction - Data from fimfiction.net

=head1 SYNOPSIS

  use WWW::Fimfiction qw/story/;

  my $story = story(6762);
  print $story->title; # 'To Catch a Stallion'

=head1 FUNCTIONS

=head2 story

Returns a L<WWW::Fimfiction::Story> object from a story ID. Croaks on error.

=cut

sub story {
	my $id = shift;

	my $res = $ua->get("http://www.fimfiction.net/api/story.php?story=$id");

	if( $res->is_success ) {
		my $data = decode_json $res->decoded_content;

		if( defined $data->{error} ) {
			croak 'Error: ' . $data->{error};
		}

		my $story = $data->{story};
		my $tags = $story->{categories};
		my $chapters = $story->{chapters};

		return WWW::Fimfiction::Story->new(
			author => WWW::Fimfiction::User->new(
				id   => $story->{author}{id},
				name => $story->{author}{name},
			),
			id          => $story->{id},
			title       => $story->{title},
			description => $story->{description},
			rating      => $story->{content_rating_text},
			tags        => [ grep { $tags->{$_} } keys %$tags ],
			wordcount   => $story->{words},
			status      => $story->{status},
			uri         => $story->{url},
			image_uri   => $story->{image},
			views       => $story->{views},
			chapters    => [ map {
				WWW::Fimfiction::Chapter->new(
					id        => $_->{id},
					title     => $_->{title},
					wordcount => $_->{words},
					uri       => $_->{link},
					views     => $_->{views},
					updated   => $_->{date_modified},
				)
			} @$chapters ],
			updated => $story->{date_modified},
		);
	}
	else {
		croak "Error: " . $res->status_line;
	}
}

=head1 SEE ALSO

L<WWW::Fimfiction::Story>,
L<WWW::Fimfiction::User>,
L<WWW::Fimfiction::Chapter>

=head1 AUTHOR

Cameron Thornton E<lt>cthor@cpan.orgE<gt>

=head1 COPYRIGHT

Copyright (c) 2012 Cameron Thornton.

This program is free software; you can redistribute it and/or 
modify it under the same terms as Perl itself.

=cut

1;