#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

staload "prelude/SATS/pointer.sats"
staload "prelude/SATS/memory.sats"


implement main0 () = 
  let
    val (pf, pfgc | i) = malloc_gc(sizeof<int>)
  in
    mfree_gc(pf, pfgc | i)
  end

