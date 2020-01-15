package Study::Programming;

use Manager::Dialog qw (Message ApproveCommands);

use Data::Dumper;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / POs Readings /

  ];

sub init {
  my ($self,%args) = @_;
  # POs := Pedagogical Objectives
  $self->POs
    ($args{POs} || {});
}

sub MapOutPOs {
  my ($self,%args) = @_;
  my $rdir = "$UNIVERSAL::systemdir/data/readings";
  # just get the current readings for now
}

# better make damn sure you know all the acronyms and can pass all the
# quizzes

# this is a system for programming the users's reading.

# It should take into account  the pedagogical objectives, and be in a
# race against time.

# it should therefore  determine what are the best  items to read, how
# much of  them to read, etc,  in the available  time, budgeting under
# the general assumption that time changes.

# example given  these pedagogical objectives,  needs to come  up with
# reading lists, etc, that satisfy these objectives.

# this algorithm generates the reading list



# find the shortest texts (so that we can get on with the priorities,
# estimate the reading time of each text
# store them locally and deal with clear idiosyncracies
# determine how well they define the subjects
# map out the key parts of the subjects using google

# plan for time
# allow user to say whether the text is helping

# use dependency analysis to prepare the readings

# ; install openbsd
# vpn 80211[bi] wpa/rsn/peap/
# 8021X
# + windows file sharing (looking into samba protocols)
# + sniff traffic

# here was a human generated reading list for that.

# note that we could train the human generalted lists.

# Overview of WPA/RSN/80211i
# http://www.windowsecurity.com/articles/80211i-WPA-RSN-Wi-Fi-Security.html

# EAP Methods Overview (MD5,TLS,TTLS,PEAP,etc...)
# http://www.mtghouse.com/EAP_082404.pdf

# Setting up WPA/EAP-TLS
# http://www.rinta-aho.org/docs/wlan/wlan.html

# Setting up 802.1x/Radius
# http://tldp.org/HOWTO/html_single/8021X-HOWTO/

# SSL Certificates HOWTO
# http://www.tldp.org/HOWTO/SSL-Certificates-HOWTO/

1;

# Without being  curt, I  was wondering whether  you would  consider the
# following problem: Suppose you  have someone who doesn't know anything
# about a particular field, but wants  to know about it.  How can we use
# CLEAR/PIC  to  teach  them/teach  itself about  this  field.   Suppose
# further there are time  constraints.  How does PIC prioritize/schedule
# the reading.  I  think this problem has to  do with Question Networks.
# It  would  be  a major  component  of  CoAuthor,  since we  would  use
# CoAuthor/QUAC to write  books on the very subject  of the question, by
# searching our digital library.

# Any kind of future teaching software should use PICForm Cross-Domain
# Relations to form metaphoric relations between what the person
# already knows about and the topics that the person needs to learn
# about. That's the easiest way to explain a new topic. Otherwise they
# have to memorize entirely new stuff and then somehow teach
# themselves how it operates to understand something entirely new.

# essentially what we are doing - to use picform in a practical system
# to help develop picform
