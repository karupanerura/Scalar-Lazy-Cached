package Scalar::Lazy::Cached;
use 5.009_004;
use strict;
use warnings;

our $VERSION = '0.01';

use parent qw/Scalar::Lazy/;
our @EXPORT = qw/ delay lazy /;

use Hash::Util::FieldHash qw/fieldhash/;

sub lazy(&;$) {## no critic
    __PACKAGE__->new(@_);
}

no warnings 'once';
*delay = \&lazy;
use warnings 'once';

fieldhash my %value;
sub force($) {## no critic
    my $self = shift;
    return exists($value{$self}) ? $value{$self} : $value{$self} = $self->SUPER::force;
}

use overload (
    fallback => 1,
    map { $_ => sub { $_[0]->force } } qw( bool "" 0+ ${} @{} %{} &{} *{} )
);

1;
__END__

=head1 NAME

Scalar::Lazy::Cached - Perl extention to do something

=head1 VERSION

This document describes Scalar::Lazy::Cached version 0.01.

=head1 SYNOPSIS

    use Scalar::Lazy::Cached qw/lazy/;

=head1 DESCRIPTION

# TODO

=head1 INTERFACE

=head2 Functions

=head3 C<< hello() >>

# TODO

=head1 DEPENDENCIES

Perl 5.8.1 or later.

=head1 BUGS

All complex software has bugs lurking in it, and this module is no
exception. If you find a bug please either email me, or add the bug
to cpan-RT.

=head1 SEE ALSO

L<perl>

=head1 AUTHOR

<<YOUR NAME HERE>> E<lt><<YOUR EMAIL ADDRESS HERE>>E<gt>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2012, <<YOUR NAME HERE>>. All rights reserved.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
