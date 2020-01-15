package Study::PO;

# pedagogical objective

use Data::Dumper;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / Contents /

  ];

sub init {
  my ($self,%args) = @_;
  $self->Contents($args{Contents});
}

1;
