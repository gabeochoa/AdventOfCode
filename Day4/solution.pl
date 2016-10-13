







sub checkmd5
{
    my $in = shift;
    my $len = shift;

    $ss = md5_hex($in);
    if($ss =~ /^[0]{$len}.*$/)
    {
        return 1;
    }
    return 0;
}





use Digest::MD5 qw(md5_hex);

open(my $in, "<", "test.txt") or die "cant open test.txt";
my $list = <$in>;

my $number = 0;

while(not checkmd5($list . $number, 6))
{
    $number ++;
}

print $number."\n";
print $list."\n";
