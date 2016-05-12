import System.IO


split delimiter = foldr f [[]] 
    where f c l@(x:xs) | c == delimiter = []:l
                       | otherwise = (c:x):xs

surfaceArea :: [Int] -> Int
surfaceArea (a:b:c:_) = 2*a*b + 2*b*c + 2*a*c + (min (min (a*b) (b*c)) (a*c))
surfaceArea _ = undefined

abc :: String -> Int
abc st = surfaceArea (map read (split 'x' st))


--def getRibbonLength(length, width, height):
--    vol = length*width*height
--    s = (sorted([length, width, height]))[:2]
--    ribbon = s[0]*2 + s[1]*2
----    return vol + ribbon

removeItem :: Int -> [Int] -> [Int]
removeItem _ [] = []
removeItem x (y:ys) = if (x == y) then ys else y : (removeItem x ys)

removeMin :: [Int] -> [Int]
removeMin a = (removeItem (minimum a) a)

smallestTwo :: [Int] -> [Int]
smallestTwo a = [ (minimum a) , (minimum (removeMin a)) ]

multt :: [Int] -> Int
multt (a:b:c:_) = (a*b*c)
multt _ = 0

rib :: [Int] -> Int
rib (a:b:_) = a*2 + b*2 

ribbonLength :: [Int] -> Int
ribbonLength xs = (multt xs) + (rib (smallestTwo xs))

def :: String -> Int
def st = ribbonLength (map read (split 'x' st))

main = do
    z <- getContents
    let mebe = map abc (lines z)
    let sa = show (sum mebe)
    let mebe2 = map def (lines z)
    let sa2 = show (sum mebe2)
    putStrLn $ unwords [sa, sa2]
