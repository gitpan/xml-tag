package XML::Tag::html5_bootstrap;
use XML::Tag::html5;
use Exporter 'import';
our @EXPORT = qw< top_menu >; 

sub top_menu  (&) {
    my ($chunk) = shift;
    div { +{class => "navbar navbar-fixed-top"},
	div { +{class => "navbar-inner"},
	    div { +{class => "container-fluid"}, &$chunk }
	}
    }
}

1; 
