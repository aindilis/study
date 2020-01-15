package Study::TaskManager::Task;

use Data::Dumper;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / ID Description Priority ETC Status /

  ];

sub init {
  my ($self,%args) = @_;
  $self->ID($args{ID});
  $self->Description($args{Description});
  $self->Priority($args{Priority} || 1);
  $self->ETC($args{ETC} || 0);
  $self->Status($args{Status});
}

sub SPrint {
  my ($self,%args) = @_;
  return Dumper($self);
}

1;
