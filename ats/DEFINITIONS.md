# Boxed tuple

A boxed tuple is essentially a
pointer pointing to some heap location where a flat tuple is stored

# Proof

Constructing a proof for a theorem in ATS/LF means implementing a total value (which is most likely to
be a total function) of the type that is the encoding of the theorem in ATS/LF, where being total means
being pure and terminating. Please note that this style of theorem-proving may seem rather peculiar to
those who have never tried it before.
