module Lib.Env.Env where 

addStuff :: Int -> Int
addStuff = do
	a <- (*2)
	b <- (+10)
	return (a+b)

test :: IO ()
test = putStrLn $ show $ addStuff 10
