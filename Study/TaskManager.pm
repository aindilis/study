package Study::TaskManager;

use Manager::Dialog qw (Message ApproveCommands);
use Study::TaskManager::Task;
use PerlLib::Collection;
use PerlLib::Lisp;

use Data::Dumper;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / Tasks CurrentAgenda /

  ];

sub init {
  my ($self,%args) = @_;
  $self->Tasks
    (PerlLib::Collection->new
     (StorageFile => $args{StorageFile} || $UNIVERSAL::systemdir."/data/tasks",
      Type => "Study::TaskManager::Task"));
  $self->Tasks->Contents({});
  $self->CurrentAgenda([]);
}

sub AddTask {
  my ($self,%args) = @_;
  my $task = Study::TaskManager::Task->new
    (ID => $self->Tasks->Count,
     Description => $args{Task},
     Priority => 1);
  $self->Tasks->Add
    ($task->ID => $task);
}

sub SPrintAgenda {
  my ($self,%args) = @_;
  return Dumper($self->Tasks);
}

sub Awareness {
  my ($self,%args) = @_;
  # Get everything ready ahead of time.
  # check current task priorities
  # set new task priorities
  # interrupt the user to determine progress

  # "stay on task" => 1,
  # "judge what may be relevant" => 1,
  # "don't make the problem perfect or huge" => 1,
  # "do the fast demo, product" => 1,

  # Do some things on the side.
}

sub DailyStatusReports {
  my ($self,%args) = @_;
  # Write a cron job for a thing that beeps at me.  Daily status reports.
}

1;
