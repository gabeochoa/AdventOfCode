import System.IO


convert :: Char -> Int
convert c = 
    if c == '(' then
        1
    else
        -1

basement :: [Int] -> Int -> Int -> Int
basement [] f step = step 
basement xs (-1) step = step 
basement (next:xs) f step = 
    basement xs (f+next) (step+1)
    
main = do
    z <- getLine
    let nums = map convert z
    let floors = sum nums
    let index = basement nums 0 0
    putStr . show $ floors
    putStr " "
    print index
