#!perl -w
use strict;
use Test::More;

use Scalar::Lazy::Cached;

my @list = (0 .. 10);
my $fast_value = lazy { shift @list };
isa_ok $fast_value, 'Scalar::Lazy::Cached';
is $fast_value, 0, 'fast value';
isa_ok $fast_value, 'Scalar::Lazy::Cached';
is $fast_value, 0, 'each value';
isa_ok $fast_value, 'Scalar::Lazy::Cached';
is $fast_value, 0, 'each value';

done_testing;
