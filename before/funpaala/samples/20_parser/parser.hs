import Data.Maybe (listToMaybe, fromJust)
import Data.Char (isDigit, isSpace, digitToInt)

type Parse a = String -> [(a, String)]

succeed :: a -> Parse a
succeed v inp = [(v, inp)]

check :: (Char -> Bool) -> Parse Char
check p (c : cs) | p c = [(c, cs)]
check _ _ = []

char :: Char -> Parse Char
char = check . (==)

alt :: Parse a -> Parse a -> Parse a
(p1 `alt` p2) i = p1 i ++ p2 i

build :: Parse a -> (a -> b) -> Parse b
build p f inp = [ (f x, r) | (x, r) <- p inp ]

(>@>) :: Parse a -> Parse b -> Parse (a, b)
(p1 >@> p2) inp = [ ((x, y), r') | (x, r) <- p1 inp, (y, r') <- p2 r ]

(>@) :: Parse a -> Parse b -> Parse a
p1 >@ p2 = (p1 >@> p2) `build` fst

(@>) :: Parse a -> Parse b -> Parse b
p1 @> p2 = (p1 >@> p2) `build` snd

eof :: Parse ()
eof "" = [((), "")]
eof _ = []

list, list1 :: Parse a -> Parse [a]
list p = succeed [] `alt` list1 p
list1 p = (p >@> list p) `build` uncurry (:)

number :: Parse Integer
number = list1 (check isDigit) `build` read

parse :: Parse a -> String -> Maybe a
parse p = listToMaybe . map fst . (p >@ eof)

spaces1 :: Parse ()
spaces1 = list1 (check isSpace) `build` const ()

spaces :: Parse ()
spaces = list (check isSpace) `build` const ()

comma :: Parse ()
comma = (spaces >@> char ',' >@> spaces) `build` const ()

sep :: Parse ()
sep = spaces1 `alt` comma

numbers :: Parse [Integer]
numbers = (number >@> list (sep @> number)) `build` uncurry (:)

type Op = Integer -> Integer -> Integer

op, ad, sb, ml, dv :: Parse Op
op = ad `alt` sb `alt` ml `alt` dv
ad = char '+' `build` const (+)
sb = char '-' `build` const (-)
ml = char '*' `build` const (*)
dv = char '/' `build` const div

expr :: Parse Integer
expr = (term >@> op >@> term) `build` \((x, o), y) -> x `o` y

term :: Parse Integer
term = number `alt` (char '(' @> expr >@ char ')')

calc :: String -> Maybe Integer
calc = parse expr
