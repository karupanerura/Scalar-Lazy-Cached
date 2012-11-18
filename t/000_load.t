#!perl -w
use strict;
use Test::More tests => 1;

BEGIN {
    use_ok 'Scalar::Lazy::Cached';
}

diag "Testing Scalar::Lazy::Cached/$Scalar::Lazy::Cached::VERSION";
