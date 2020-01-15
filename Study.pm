package Study;

use BOSS::Config;

use Manager::Dialog qw (Message ApproveCommands);
use Study::Programming;
use Study::TaskManager;

use Data::Dumper;

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / Config Interviewers PedagogicalObjectives Priorities Skills
   MyTaskManager MyProgramming SeedReading /

  ];

sub init {
  my ($self,%args) = (shift,@_);
  $specification = "
	-r			Focused review
	-s			Read all files on system
";
  $self->Config(BOSS::Config->new
		(Spec => $specification,
		 ConfFile => ""));
  my $conf = $self->Config->CLIConfig;
  if (exists $conf->{'-u'}) {
    $UNIVERSAL::agent->Register
      (Host => defined $conf->{-u}->{'<host>'} ?
       $conf->{-u}->{'<host>'} : "localhost",
       Port => defined $conf->{-u}->{'<port>'} ?
       $conf->{-u}->{'<port>'} : "9000");
  }

  $self->Interviewers($args{Interviewers} || {});
  $self->PedagogicalObjectives($args{PedagogicalObjectives} || {});
  $self->SeedReading($args{SeedReading} || []);
  $self->Priorities($args{Priorities} || {});
  $self->Skills($args{Skills} || {});

  $self->MyTaskManager
    (Study::TaskManager->new);
  $self->MyProgramming
    (Study::Programming->new
     (SeedReading => $self->SeedReading));
}

sub Execute {
  my ($self,%args) = (shift,@_);
  my $conf = $self->Config->CLIConfig;

  if (exists $conf->{'-r'}) {
    $self->GenerateTasks;
    print $self->MyTaskManager->SPrintAgenda;

    # $self->ScheduleTasks;

    # my program has just achieved self awareness
    # Sun Oct 16 13:15:13 EDT 2005
    # $self->Awareness;
    $self->MyTaskManager->Awareness;
  }
}

sub GenerateTasks {
  my ($self,%args) = @_;
  foreach my $subject (keys %{$self->PedagogicalObjectives}) {
    $self->MyTaskManager->AddTask
      (Task => "CLEAR, read-about $subject");
    $self->MyTaskManager->AddTask
      (Task => "FieldGoal, experiment-with $subject");
    $self->MyTaskManager->AddTask
      (Task => "CLEAR, read-about (protocol-for $subject)");

    # learn various applications that employ these types of things
    $self->MyTaskManager->AddTask
      (Task => "Sorcerer, -a $subject");
  }
}

sub GenerateWorkPlan {
  my ($self,%args) = @_;
  # first compile study plan
}

sub GenerateStudyPlan {
  my ($self,%args) = @_;
  # do all the analysis for generating programming here
}

sub Studying {
  my ($self,%args) = @_;
  # this  program takes  a  series of  things  to learn  and produces  a
  # reading  list.  it  is  the  same thing  as  recommend readings  for
  # job-search, at least for now, and it's what I am doing.
}

sub InterviewTalkingPoints {
  my ($self,%args) = @_;
  # generate a quick summary of interview talking points

  # s/AI/large scale software systems/ig;
}

# IF ALL THIS IS DONE, fly to the moon and back

1;
