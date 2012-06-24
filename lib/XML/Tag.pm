#! /usr/bin/perl
package XML::Tag;
use Exporter 'import';
our @EXPORT = qw< tag >;
our $VERSION = '0.1';

# ABSTRACT: tag

sub tag {
    my ( $tag, $code, $attrs ) = @_;
    my %attr = $attrs ? %$attrs : ();
    my @data = $code ? $code->() : ();


    # TODO: what if blessed ? 
    while (my $ref = ref $data[0] ) {
	$ref eq 'HASH' or die "$ref cant hold xml attributes";
	my $news = shift @data;
	while ( my ( $k, $v ) = each %$news ) { push @{ $attr{$k} }, $v; }
    }

    ( '<'
    , $tag
    ,   ( keys %attr
	    ? ( map {
		# yeah: i know that this code can lead to stuttering xml like
		# class="foo foo foo bar"
		# frankly ? i don't care :-)
		' '
		, $_
		, '='
		, ( map {ref $_ ? qq{"@$_"} : qq("$_") } $attr{$_} )
		} keys %attr )
	    : ()
	)
    ,   ( @data
	    ? ( '>', @data, '</', $tag , '>')
	    : '/>'
	)
    )
}

1;
