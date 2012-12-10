#!perl -T
use 5.006;
use strict;
use warnings FATAL => 'all';
use Test::More;
use WWW::Fimfiction 'story';

my $story = eval{ story(6762) };

if($@ =~ /^Error: 503 Service Unavailable/) {
	plan skip_all => 'Fimfiction service currently unavailable';
}

is(
	$story->id, 
	6762,
	'ID as expected',
);

is(
	$story->title, 
	'To Catch a Stallion',
	'Title as expected',
);

isa_ok(
	$story->author,
	'WWW::Fimfiction::User',
	'Author',
);

is(
	$story->author->name, 
	'RogerDodger',
	'Author name as expected',
);

is(
	$story->image_uri->host,
	'www.fimfiction-static.net',
	'Image host as expected',
);

is(
	$story->rating,
	'Teen',
	'Rating as expected',
);

is(
	$story->status,
	'Complete',
	'Status as expected',
);

ok(
	$story->wordcount < 1000,
	'Wordcount as expected',
);

is(
	substr($story->description, 0, 10),
	'Some ponie',
	'Description as expected',
);

is_deeply(
	$story->tags,
	[ 'Comedy' ],
	'Tags as expected',
);

is(
	substr($story->uri->path, 0, 12),
	'/story/6762/',
	'URI path as expected',
);

isa_ok(
	$story->updated,
	'DateTime',
	'Story mtime',
);

isa_ok(
	$story->chapters->[0],
	'WWW::Fimfiction::Chapter',
	'Chapter 1',
);

isa_ok(
	$story->chapters->[0]->updated,
	'DateTime',
	'Chapter 1 mtime'
);

$story = story(66145);

is(
	$story->image_uri,
	undef,
	'No image, as expected'
);

is_deeply(
	$story->tags,
	[],
	'No tags, as expected'
);

done_testing;