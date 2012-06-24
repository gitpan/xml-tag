#! /usr/bin/perl
use Modern::Perl;
use XML::Tag;

sub foo (&) { tag foo => @_ }

say foo{
    + {qw< class bar id bang >}
    , {qw< style text-align:center >}
    , "this is "
    , "the content"
};






