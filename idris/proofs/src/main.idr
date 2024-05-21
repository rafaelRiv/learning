module Main

basic_congruent_proof : 5 = 5
basic_congruent_proof =  Refl

{-
 - Exercice: proof decidable equality
 - decNat : (n : Nat) -> (m : Nat) -> Dec (n = m)
-}

zeroNotSucc : (prf : Z = (S k)) -> Void
zeroNotSucc Refl impossible

succNotZero : (prf : (S k) = Z) -> Void
succNotZero Refl impossible


succDiffer : (contra: k = j -> Void) -> (prf: S k = S j) -> Void
succDiffer contra Refl = contra Refl


decEqNat : (n : Nat) -> (m : Nat) -> Dec (n = m)
decEqNat 0 0  = Yes Refl
decEqNat 0 (S k) = No zeroNotSucc
decEqNat (S k) 0  = No succNotZero
decEqNat (S k) (S j) = 
  case decEqNat k j of
    (Yes prf) => rewrite prf in Yes Refl
    (No contra) => No (succDiffer contra)

{-
  Exercice: proof neutral element in +
  
-}

plusReduceZ : (n: Nat) -> n + Z = n  
plusReduceZ 0 = Refl -- Per definition
plusReduceZ (S k) = cong S $ plusReduceZ k

{-
  Exercice: proof communativity
  plus_commutes : (n, m : Nat) -> plus n m = plus m n
-}

plus_commutes_Z : (n : Nat) -> n = plus n 0
plus_commutes_Z 0 = Refl
plus_commutes_Z (S k) = cong S $ plus_commutes_Z k

plus_commutes_S : (n : Nat) -> (m : Nat) -> S (plus m n) = plus m (S n)
plus_commutes_S m Z = Refl
plus_commutes_S m (S n) = rewrite plus_commutes_S m n in Refl

total
plus_commutes : (n, m : Nat) -> n + m = m + n
plus_commutes Z n = plus_commutes_Z n
plus_commutes (S n) m = rewrite plus_commutes n m in plus_commutes_S n m

{-
 - Exercice: proof assosiatiavity
 - plus_assoc : (n, m, p : Nat) ->  n + (m + p) = (n + m) + p
-}

plus_assoc : (n, m, p : Nat) ->  n + (m + p) = (n + m) + p
plus_assoc 0 m p = Refl
plus_assoc (S k) m p = rewrite plus_assoc k m p in Refl

{-

Exercice

Prove that reverse a list twice gives the same list back.

-}

rev : List x -> List x
rev [] = []
rev (y :: xs) = rev xs ++ [y]

revrevid_e : (y : x) -> (xs : List x) -> rev (rev xs ++ [y]) = y :: xs
revrevid_e y xs = ?revrevid_rhs_1_rhs

revrevid : (a : List x) -> (rev (rev a)) = a
revrevid [] = Refl
revrevid (y :: xs) = revrevid_e y xs

{-
 - Exercice: proof showing that a list xs consists purely of repetitions of x
-}

main : IO ()
main = do 
  -- Test with IO decEqNat
  case decEqNat 5 5 of
    (Yes prf) => putStrLn "proof 5 = 5"
    (No contra) => putStrLn "proof 5 != 5"


      

