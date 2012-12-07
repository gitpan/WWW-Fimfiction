use 5.006;
use strict;
use warnings FATAL => 'all';
use inc::Module::Install;

name 'WWW-Fimfiction';
all_from 'lib/WWW/Fimfiction.pm';

test_requires 'Test::More' => 0;

requires 'LWP::UserAgent' => 0;
requires 'Exporter' => 0;
requires 'DateTime' => 0;
requires 'Moose' => 0;
requires 'JSON' => 0;
requires 'Carp' => 0;
requires 'URI' => 0;

recommends 'JSON::XS';

WriteAll;
