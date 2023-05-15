Section explicit_Complex.

Variable C : set.

Variable Re Im : set -> set.
Variable zero one i : set.
Variable plus mult : set -> set -> set.

Infix + 360 right := plus.
Infix * 355 right := mult.

Hypothesis HC: explicit_Complex C Re Im zero one i plus mult.

Theorem FundamentalTheoremOfAlgebra: forall n :e omega :\: 1, forall cs :e C :^: ordsucc n, cs n <> zero ->
  exists z :e C, explicit_Ring_with_id_eval_poly C zero one plus mult (ordsucc n) cs z = zero.
Admitted.

End explicit_Complex.