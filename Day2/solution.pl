
open(my $in, "<", "test.txt") or die "cant open test.txt";

sub getsmallest2
{
    my ($a, $b) = @_;
    return $a unless $b lt $a;
}

sub getsmallest3
{
    my ($a, $b, $c) = @_;
    return getsmallest2(getsmallest2($a, $b), $c);
}

sub getSurfaceArea3
{
    my ($length, $width, $height) = @_;
    my $sA = 2 * $length * $width + 2 * $width * $height + 2 * $length * $height;
    my @extra = sort { $a <=> $b } ($length*$width, $width*$height,$length*$height);
    return $sA + $extra[0];
}

sub getRibbonLen3
{
    my ($length, $width, $height) = @_;
    my $vol = $length * $width * $height;
    my @sorted = sort { $a <=> $b } ($length,$width,$height);
    return $vol + 2 * $sorted[0] + 2 * $sorted[1];
}

my @lines = <$in>;

my $sum = 0;
my $ribbon = 0;

for my $package (@lines)
{
    my @dims = split /x/, $package;
    $sum += getSurfaceArea3($dims[0], $dims[1], $dims[2]);
    $ribbon += getRibbonLen3($dims[0], $dims[1], $dims[2]);
}

print $sum . "\n";
print $ribbon . "\n";

