#!/usr/bin/env ruby -i

ind = -1
count = 0
floor = 0
STDIN.read.split("\n").each do |line|
    line.each_char do |elem|
        if elem == '('
            floor+=1
        else
            floor-=1
        end

        if floor == -1 and ind == -1
            ind = count+1
        end
        count += 1
    end
end
print floor
print " "
print ind
puts ""
raise "This is wrong" unless floor == 280