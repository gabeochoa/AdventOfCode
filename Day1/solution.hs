import System.IO


convert :: Char -> Int
convert c =
    if c == '(' then
        1
    else
        -1

basement :: [Int] -> Int -> Int -> Int
basement [] f step = -1
basement xs (-1) step = step
basement (next:xs) f step =
    basement xs (f+next) (step+1)

--( ( ( ) ) ) ( ) ) ) )

--1 1 1 -1 -1 -1 1 -1 -1 -1 -1
-- -3
--[1 1 1 -1 -1 -1 1 -1 -1 -1 -1 ] 0 0
--[1 1 -1 -1 -1 1 -1 -1 -1 -1 ] 0+1 0+1
--[1 -1 -1 -1 1 -1 -1 -1 -1 ] 2 2
--[-1 -1 -1 1 -1 -1 -1 -1 ] 3 3
--[-1 -1 1 -1 -1 -1 -1 ] 2 4
--[-1 1 -1 -1 -1 -1 ] 1 5
--[1 -1 -1 -1 -1 ] 0 6
--[-1 -1 -1 -1 ] 1 7
--[-1 -1 -1 ] 0 8
--[-1 -1 ] -1 9

main = do
    z <- getLine
    let nums = map convert z
    let floors = sum nums
    let index = basement nums 0 0
    putStr . show $ floors
    putStr " "
    print index



































