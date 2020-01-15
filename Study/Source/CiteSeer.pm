package Study::CiteSeer;

use Manager::Dialog qw (Message ApproveCommands);

use Data::Dumper;
use WWW::Mechanize;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / Mech /

  ];

sub init {
  my ($self,%args) = (shift,@_);
  $self->Mech(WWW::Mechanize->new);
}
