use strict;
use warnings;
use Test::More;
use Data::DigestPath;

{
    my $dp = Data::DigestPath->new;
    isa_ok $dp, 'Data::DigestPath';
    is $dp->salt, '';
    is $dp->depth, 4;
    is $dp->delim, '/';
    is $dp->make_path, 'd/4/1/d/d41d8cd98f00b204e9800998ecf8427e';
    $dp->depth(0);
    is $dp->make_path, 'd41d8cd98f00b204e9800998ecf8427e';
    $dp->depth(6);
    is $dp->make_path, 'd/4/1/d/8/c/d41d8cd98f00b204e9800998ecf8427e';
    $dp->salt("aloha");
    is $dp->make_path, 'd/3/4/b/6/c/d34b6c59ef0497d8ff246abd1049352e';
    $dp->delim('-');
    is $dp->make_path, 'd-3-4-b-6-c-d34b6c59ef0497d8ff246abd1049352e';
}

done_testing;