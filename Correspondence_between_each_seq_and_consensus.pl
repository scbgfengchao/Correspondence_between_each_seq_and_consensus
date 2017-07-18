#/usr/bin/perl -w
use strict;

open (FH, "$ARGV[0]") or die;
open (OUT, ">Correspondence_List.txt") or die;

my ($i,$j1,$j2,$seq,$len,@arr);

$seq="";

while (<FH>) {
	chomp;
	if (/^>/) {
		print OUT "Consensus_id\t".$_."_id\n";
	}else{
		$seq=$seq.$_;
	}
}

$j1=0;
$j2=0;

$len=length($seq);
@arr=split ("",$seq);
for ($i=0;$i<$len;$i++) {
	$j1++;
	if ($arr[$i] ne "-") {
		$j2++;
	}
	print OUT "$j1\t"."$j2\n";	
}
close FH;
close OUT;

