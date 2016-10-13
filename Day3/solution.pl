


sub santa
{
    my ($es, $val) = @_;
    my @elements = @$es;
    robot(\@elements, $val);
}

sub robot
{
    my ($es, $val) = @_;
    my @elements = @$es;
    my %houses = ( "0-0" => 1 );
    my $x = 0; my $y = 0;
    my $a = 0; my $b = 0;

    for (my $i = 0; $i < @elements; $i++)
    {
        if( ($i % 2 eq 0) or $val)
        {
            if($elements[$i] eq ">")
            {
                $a++;
            }
            elsif($elements[$i] eq "<")
            {
                $a--;
            }
            elsif($elements[$i] eq "^")
            {
                $b++;
            }
            elsif($elements[$i] eq "v")
            {
                $b--;
            }
        }
        else
        {
            if($elements[$i] eq ">")
            {
                $x++;
            }
            elsif($elements[$i] eq "<")
            {
                $x--;
            }
            elsif($elements[$i] eq "^")
            {
                $y++;
            }
            elsif($elements[$i] eq "v")
            {
                $y--;
            }
        }
        $houses{$a."-".$b} = 1;
        $houses{$x."-".$y} = 1;
    }
    print scalar(keys %houses) . "\n";
}

open(my $in, "<", "test.txt") or die "cant open test.txt";
my @arr = split //, <$in>;
santa(\@arr, 1);
robot(\@arr, 0);
