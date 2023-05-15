Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Prefix - 358 := minus_SNo.
Infix :/: 353 := div_SNo.

Definition quadratic_residue_mod : set -> set -> prop
 := fun q n => q :e int :\: {0} /\ n :e omega /\ exists x :e n, equiv_int_mod (x * x) q n.

Definition Legendre : set -> set -> set :=
  fun a p => if quadratic_residue_mod a p then 1 else if equiv_int_mod a 0 p then 0 else - 1.

Infix ^ 342 right := exp_SNo_nat.

Theorem quadratic_reciprocity_nat : forall p q :e omega, 
    prime_nat p -> 2 :e p -> prime_nat q -> 2 :e q
 -> Legendre p q * Legendre q p = (- 1) ^ (((p + - 1) :/: 2) * ((q + - 1) :/: 2)).
Admitted.
