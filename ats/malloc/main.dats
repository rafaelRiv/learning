#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

implement main0 () = 
  let
    /*
  
    list of questions to answer
    ---------------------------------------

    What is pf ?
    what is pfgc ?
    what is | ?
    what is i ?
       
    */
    val (pf, pfgc | i) = malloc_gc(sizeof<int>)
  in
    mfree_gc(pf, pfgc | i)
  end

