use strict;
use warnings;
use Test::More;
use Data::DigestPath;
use Digest::SHA1 qw//;

{
    my $dp = Data::DigestPath->new(
        digest => sub {
            Digest::SHA1::sha1_hex(@_)
        },
    );
    is $dp->make_path, 'd/a/3/9/da39a3ee5e6b4b0d3255bfef95601890afd80709';
    $dp->digest(sub{ Digest::MD5::md5_hex(@_) });
    is $dp->make_path, 'd/4/1/d/d41d8cd98f00b204e9800998ecf8427e';
}

done_testing;
