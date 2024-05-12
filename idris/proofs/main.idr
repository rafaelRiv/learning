module Main

my_plus: Nat -> Nat -> Nat
my_plus Z m = m
my_plus (S k) m = S (plus k m)

basic_congruent_proof: 5 = 5
basic_congruent_proof =  Refl

{-
 - Exercice: proof assosiatiavity
 - plus_assoc : (n, m, p : Nat) -> plus n (plus m p) = plus (plus n m) p
-}

main : IO ()
main = putStrLn "Proofs valid"

