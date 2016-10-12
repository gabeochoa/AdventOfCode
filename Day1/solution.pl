
open(my $in, "<", "test.txt") or die "cant open test.txt";

my @lines = <$in>;
my @arr = split //, $lines[0];

my $floor = 0;
my $letcount = -1;
my $notdone = 0;

for my $letter (@arr)
{
    if( $letter eq '(')
    {
        $floor += 1;
    }
    else
    {
        $floor -= 1;
    }
    $letcount += 1;
    if($floor eq -1 and $notdone eq 0)
    {
        print $letcount . "\n";
        $notdone = 1;
    }
}

print $floor . "\n";

