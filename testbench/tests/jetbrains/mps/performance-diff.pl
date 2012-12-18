#!/usr/bin/perl

if ($#ARGV != 1 ) {
	print "usage: performance-diff.pl <old.performace> <new.performance>\n\n";
	exit;
}

sub readMap($) {
	my ($file) = @_;
	my %originalMap = ();

	open(FILE, "< $file") or die "$file: $!";

	while(<FILE>) {
		if(/^Generation Time Report/){
		} elsif(/^([\w\.]+)\s+(\d+)ms$/) {
			$module = $1;
			$time = $2;
			$originalMap{$module} = $time;
		} else {
			die "wrong line: $.: $_\n";
		}
	}
	close(FILE);
	%originalMap;
}

sub mapDiff(%%) {
	my ($old, $new) = @_;
	my %result = ();
	while (($key, $value) = each %$old) {
		$result{$key} = [$value, -1];
	}
	while (($key, $value) = each %$new) {
		if(exists $result{$key}) {
			$result{$key}[1] = $value;
		} else {
			$result{$key} = [-1, $value];
		}
	}

	@res = ();
	while (($key, $value) = each %result) {
		push @res, [$key, $$value[0], $$value[1], $$value[1]-$$value[0]];
	}
	return @res;
}

%oldm = readMap($ARGV[0]);
%newm = readMap($ARGV[1]);
@diff = mapDiff(\%oldm, \%newm);

$totalOld = 0;
$totalNew = 0;
for $var(@diff) {
	$totalOld += $$var[1] unless $$var[1] == -1;
	$totalNew += $$var[2] unless $$var[2] == -1;
}

for $var(sort { $$a[3] <=> $$b[3] } @diff) {
	print $$var[0]." ".$$var[3]."ms\n";
}

print "old: ${totalOld}ms, new: ${totalNew}ms\n";
