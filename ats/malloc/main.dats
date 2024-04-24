#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

#include "share/atspre_define.hats"
#include "share/atspre_staload.hats"

%{
  #include <stdio.h>
  #include <stdlib.h>
%}

extern fun malloc
  {a:t@ype}
  (s:sizeof_t a):
  [l:addr | l > null] (a? @ l | ptr l)
  = "ext#malloc"

implement main0 () = print "Hello World"
