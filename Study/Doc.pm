package Study::Doc;

use Data::Dumper;
use Lingua::EN::Fathom;

# this is to represent a document

use Class::MethodMaker
  new_with_init => 'new',
  get_set       =>
  [

   qw / Title URL FileLoc Topics /

  ];

sub init {
  my ($self,%args) = @_;
  $self->Title($args{Title});
  $self->URL($args{URL});
  $self->FileLoc($args{FileLoc});
  $self->Topics($args{Topics} || {});
  $self->Contents($args{Contents} || {});
}

sub Retrieve {
  my ($self,%args) = @_;
  if (! $self->FileLoc) {
    my $url = $self->URL;
    $command = "wget -N -P \"".$websitedir."\" -xN \"$url\" >> /tmp/log 2>> /tmp/log";
    print "$command\n";
    `$command`;
    my $res = `cat /tmp/log`;
    my $line = [grep /./, split /\n/,$res]->[-1];
    if ($line =~ /.*? - \`(.*?)\' saved/ or
	$line =~ /Server file no newer than local file \`(.*?)\' -- not retrieving./) {
      my $fileloc = $1;
      Message(Message => "adding $fileloc");
      $self->FileLoc($fileloc);
      $self->TmpContentsFileLoc($fileloc.".txt");
    }
  }
}

sub Topics {
  my ($self,%args) = @_;
  # has to be retrieved
  # extract out documents
}

sub Length {
  my ($self,%args) = @_;
}

sub Informativeness {
  my ($self,%args) = @_;
}

sub Readability {
  my ($self,%args) = @_;
  my $self->MyFathom(Lingua::EN::Fathom->new);
  $self->MyFathom->analyse_block($self->Contents,1);
  $num_chars             = $self->MyFathom->num_chars;
  $num_words             = $self->MyFathom->num_words;
  $percent_complex_words = $self->MyFathom->percent_complex_words;
  $num_sentences         = $self->MyFathom->num_sentences;
  $num_text_lines        = $self->MyFathom->num_text_lines;
  $num_blank_lines       = $self->MyFathom->num_blank_lines;
  $num_paragraphs        = $self->MyFathom->num_paragraphs;
  $syllables_per_word    = $self->MyFathom->syllables_per_word;
  $words_per_sentence    = $self->MyFathom->words_per_sentence;
  %words = $self->MyFathom->unique_words;
  foreach $word ( sort keys %words ) {
    print("$words{$word} :$word\n");
  }
  $fog     = $self->MyFathom->fog;
  $flesch  = $self->MyFathom->flesch;
  $kincaid = $self->MyFathom->kincaid;
  print($self->MyFathom->report);
}

1;
