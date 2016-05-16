import System.IO

data Set a = Set [a]
empty :: Set a
empty = Set []

insert :: (Int, Int) -> Set (Int, Int) -> Set (Int, Int)
insert x (Set xs)
    | not (elem x xs) = Set (x:xs)
    | otherwise = Set xs

size :: Set [a] -> Int
size (Set[]) = 0
size (Set(x:xs)) = 1 + (size (Set xs) )

moveSanta :: (Int, Int) -> Char -> (Int, Int)
moveSanta (x, y) '^' = (x, y - 1)
moveSanta (x, y) 'v' = (x, y + 1)
moveSanta (x, y) '<' = (x - 1, y)
moveSanta (x, y) '>' = (x + 1, y)

addVectors :: (Num a) => (a, a) -> (a, a) -> (a, a)  
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)  

santa :: [Char] -> (Int, Int) -> (Int, Int)
santa [] a = a
santa (c:cs) a = santa cs (moveSanta a c)

main = do
    z <- getContents
    let mebe = santa z (0,0)
    putStrLn $ show mebe
    