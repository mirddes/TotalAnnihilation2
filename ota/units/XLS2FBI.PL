#!perl -wl
#
# usage: perl xls2fbi.pl allunits.xls
#
# converts comma-delimited text from excel into .fbi files

$ARGV[0]="allunits.xls" unless $#ARGV>=0;

# open XLS file and read headers
open (XLS,"<$ARGV[0]") || die "can't open allunits.xls: $!";

chomp($headerrow = <XLS>);
@headers = split('\t',$headerrow);
$headers[0] eq "UnitName" || die "expecting UnitName in first column\nstopped";

while(<XLS>) {
  chomp;
  @values = split('\t');

  $filename = $values[0] . ".FBI";

  print "writing $filename";

  open(FBI,">$filename") || die "can't create $filename: $!";

  print FBI "[UNITINFO]";
  print FBI "\t{";

  for($i=0; $i<=$#headers; $i++) {
    if(defined($values[$i]) && ($values[$i] ne "")) {
        print FBI "\t$headers[$i]=$values[$i];";
    }
  }

  print FBI "\t}";
  close FBI;
}
