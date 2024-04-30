#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

// See https://bluishcoder.co.nz/2018/01/03/writing-basic-proofs-in-ats.html

dataprop FACT (int, int) =
  | FACTzero (0, 1)
  | {n,r1:int | n > 0} FACTsucc (n, r1 * n) of (FACT (n-1, r1))

fun fact {n:nat} (n: int n): [r:int] (FACT (n, r) | int r) =
  if n > 0 then let
    val (pf1 | r1) = fact (n - 1)
    val r = n * r1
  in
    (FACTsucc (pf1) | r)
  end else begin
    (FACTzero () | 1)
end

implement main0 () = 
  let
    val (prf | x) = fact 5
    val () = print x
  in
  end
