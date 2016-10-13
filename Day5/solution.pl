

open(my $in, "<", "test.txt") or die "cant open test.txt";
my @list = <$in>;

sub nice
{
    $word = shift;

    $threevowels = 0;
    $twiceinarow = 0;
    $mystrings = 0;

    $threevowels = 1 if $word =~ /[aeiou].*[aeiou].*[aeiou]/;
    $twiceinarow = 1 if $word =~ /(\w{1})(\1)/;
    $mystrings   = 1 if $word =~ /(ab|cd|pq|xy)/;
    return 1 if $threevowels and $twiceinarow and not $mystrings;
}

sub nice2
{
    $word = shift;

    $threevowels = 0;
    $twiceinarow = 0;
    $mystrings = 0;

    $threevowels = 1 if $word =~ /[aeiou].*[aeiou].*[aeiou]/;
    $twiceinarow = 1 if $word =~ /(\w{1})(\1)/;
    $mystrings   = 1 if $word =~ /(ab|cd|pq|xy)/;
    return 1 if $threevowels and $twiceinarow and not $mystrings;
}

my $count = 0;

for my $element (@list)
{
    if( nice2($element) )
    {
        print "$element is nice\n";
        $count ++;
    }
    else
    {
        print "$element is not nice\n";
    }
}


print $count."\n";
