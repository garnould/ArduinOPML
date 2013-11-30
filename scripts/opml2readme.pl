#!/usr/bin/perl -w

# Creates a README.md

use strict ;

my $appendedNoise = 'utm_source=ArduinOPML&utm_campaign=Please_contribute_on_ArduinOPML&utm_medium=RSS' ;

if (!(defined(open(OPML, '<ArduinOPML.opml'))))
{
    print STDERR 'Unable to open ArduiOPML.opml' ;
    exit 1 ;
}

my @output = () ;

while (my $line = <OPML>)
{
    $line =~ s/^\s+//g ;
    $line =~ s/[\s\n\r]+$//g ;

    if ($line =~ /^<outline/)
    {
	my $text = ($line =~ /text="([^"]*)"/)[0] ;
	my $description = ($line =~ /description="([^"]*)"/)[0] ;
	my $title = ($line =~ /title="([^"]*)"/)[0] ;
	my $htmlUrl = ($line =~ /htmlUrl="([^"]*)"/)[0] ;
	my $xmlUrl = ($line =~ /xmlUrl="([^"]*)"/)[0] ;

	push @output, '* ' . '[' . $title . '](' . $htmlUrl . ( $htmlUrl =~ /\?/ ? '&' : '?' ) . $appendedNoise . ') [RSS](' . $xmlUrl . ')' ;
    }
}

close(OPML);

print join("\n", @output), "\n" ;

exit 0 ;
