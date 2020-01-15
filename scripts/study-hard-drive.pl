#!/usr/bin/perl -w

# program to read contents of hard drive, and then generate a reading list

my $results;
foreach my $filetype (qw(pdf ps doc html)) {
  $results .= `locate $filetype | grep '\.$filetype$'`;
}

# we have to judge whether the user is interested.

# take previous content scores.

# use a model of human interest.

# this really needs to be done at high fidelity
