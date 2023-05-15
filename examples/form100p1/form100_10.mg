Definition Euler_totient : set -> set := fun n => Eps_i (fun m => m :e omega /\ equip m {k :e ordsucc n | 0 :e k /\ coprime_nat k n}).

Infix ^ 342 right := exp_nat.

Theorem form100_10_v1: forall a :e omega :\: 1, forall m :e omega :\: 2, coprime_nat a m -> equiv_nat_mod (a ^ Euler_totient m) 1 m.
Admitted.

Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Prefix - 358 := minus_SNo.
Infix :/: 353 := div_SNo.

Infix ^ 342 right := exp_SNo_nat.

Theorem form100_10_v2: forall a :e int :\: 1, forall m :e omega :\: 2, coprime_int a m -> equiv_int_mod (a ^ Euler_totient m) 1 m.
Admitted.

