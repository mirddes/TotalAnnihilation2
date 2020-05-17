#!perl -w
#
# usage: perl fbi2xls.pl *.fbi
#
# converts .fbi files into comma-delimited text for excel

@headers = ();

for $filename (@ARGV) {
  print "reading $filename\n";

  open(FBI,"<$filename") || die "can't open $filename: $!";

  while(<FBI>) {
    s/^\s+//;                   # remove leading whitespace
    s/\s+$//;                   # remove trailing whitespace
    s/;$//;                     # remove trailing semicolon

    next if /^$/;               # ignore blank lines
    next if /^\[UNITINFO\]$/;   # ignore header
    next if /^\{$/;             # ignore opening brace
    next if /^\}$/;             # ignore closing brace

    ($header,$value) = split(/\s*=\s*/,$_,2);

    $entry{$filename}{$header} = $value;

    if(!$header_exists{$header}) {
      $header_exists{$header} = 1;
      push @headers,$header;
    }
  }
  close FBI;
}

# open XLS file and print header line
open (XLS,">allunits.xls") || die "can't create allunits.xls: $!";
print XLS join("\t",@headers) . "\n";

# print out unit data
for $filename (@ARGV) {
  for $header (@headers) {
    $value = $entry{$filename}{$header};
    $value = "" unless defined($value);
    print XLS "$value\t";
  }
  print XLS "\n";
}
close XLS;

