#!/usr/bin/env ruby -i

def getSmallest(a,b,c)
    extra = a
    if(a < b)
        if(a < c)
            extra = a
        else
            extra = c
        end
    else
        #a not less than b -> b < a
        if(b < c)
            extra = b
        else
            extra = c
        end
    end
    return extra
end

def getSurfaceArea(length, width, height)
    surfaceArea = 2*length*width + 2*width*height + 2*height*length
    extra = getSmallest(length*height, length*width,  height*width)
    return surfaceArea + extra
end

def getRibbonLength(length, width, height)
    vol = length*width*height
    s = [length, width, height].sort
    ribbon = s[0]*2 + s[1]*2
    return vol + ribbon
end 

sum = 0
ribbon = 0
STDIN.read.split("\n").each do |line|
    dims = line.split('x')
    sum += getSurfaceArea((dims[0]).to_i, (dims[1]).to_i, (dims[2]).to_i)
    ribbon += getRibbonLength((dims[0]).to_i, (dims[1]).to_i, (dims[2]).to_i)
end
print sum
print " " 
print ribbon
puts ""