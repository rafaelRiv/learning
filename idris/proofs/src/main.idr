module Main

basic_congruent_proof : 5 = 5
basic_congruent_proof =  Refl

{-
 - Exercice: proof decideble equality
 - decNat : (n : Nat) -> (m : Nat) -> Dec (n = m)
-}

zeroNotSucc : (prf : Z = (S k)) -> Void
zeroNotSucc Refl impossible

succNotZero : (prf : (S k) = Z) -> Void
succNotZero Refl impossible


succDiffer : (contra: k = j -> Void) -> (prf: S k = S j) -> Void
succDiffer contra Refl = contra Refl


decNat : (n : Nat) -> (m : Nat) -> Dec (n = m)
decNat 0 0  = Yes Refl
decNat 0 (S k) = No zeroNotSucc
decNat (S k) 0  = No succNotZero
decNat (S k) (S j) = 
  case decNat k j of
    (Yes prf) => rewrite prf in Yes Refl
    (No contra) => No (succDiffer contra)

{-
 - Exercice: proof assosiatiavity
 - plus_assoc : (n, m, p : Nat) -> plus n (plus m p) = plus (plus n m) p
-}

main : IO ()
main = putStrLn "Proofs valid"

