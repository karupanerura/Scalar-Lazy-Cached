use strict;
use warnings;

use Module::Build::Pluggable (
    'Repository',
    'ReadmeMarkdownFromPod',
);

my $builder = Module::Build::Pluggable->new(
    license              => 'perl',
    dynamic_config       => 0,
    build_requires       => {
        'Test::More'     => '0.88',
        'Test::Requires' => '0.06',
    },
    configure_requires   => {
        'Module::Build::Pluggable'                        => '0.04',
        'Module::Build::Pluggable::ReadmeMarkdownFromPod' => '0.02',
    },
    requires             => {
        perl => '5.009_004',
        'parent'                => 0,
        'Scalar::Lazy'          => 0,
        'Hash::Util::FieldHash' => 0,
    },
    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'Scalar-Lazy-Cached',
    module_name => 'Scalar::Lazy::Cached',
    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? 't/ xt/' : 't/',
    recursive_test_files => 1,
    create_readme  => 1,
    create_license => 1,
);
$builder->create_build_script();
