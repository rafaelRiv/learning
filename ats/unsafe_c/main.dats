#include "share/atspre_staload.hats"

staload "prelude/SATS/unsafe.sats"

fun kmain () = 
  let
    val t: ptr = int2ptr(0x10000000)
   // val () = ptr0_set(t, 'C')
  in
  end

val () = kmain()
