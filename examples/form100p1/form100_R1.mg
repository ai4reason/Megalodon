Section RealsStruct.

Variable Rs:set.
Hypothesis HRs: RealsStruct Rs.

Let R : set := RealsStruct_carrier Rs.
Let zero : set := RealsStruct_zero Rs.
Let one : set := RealsStruct_one Rs.
Infix + 360 right := RealsStruct_plus Rs.
Infix * 355 right := RealsStruct_mult Rs.
Prefix - 358 := Field_minus (Field_of_RealsStruct Rs).
Infix :/: 353 := Field_div (Field_of_RealsStruct Rs).
(* Unicode <= "2264" *)
Infix <= 490 := RealsStruct_leq Rs.
Infix < 490 := RealsStruct_lt Rs.

Let N := RealsStruct_N Rs.
Let Npos := RealsStruct_Npos Rs.
Let Z := RealsStruct_Z Rs.
Let Q := RealsStruct_Q Rs.

Infix ^ 342 right := CRing_with_id_omega_exp (Field_of_RealsStruct Rs).

Let emb : set -> set := RealsStruct_omega_embedding Rs.

Theorem form100_R_1a: forall x :e R, x ^ 2 = emb 2 -> x /:e Q.
Admitted.

Theorem form100_R_1b: exists x :e R, x ^ 2 = emb 2 /\ zero < x.
Admitted.

Theorem form100_R_3a: exists f:set -> set, inj Q omega f.
Admitted.

Theorem form100_R_3b: exists f:set -> set, inj omega Q f.
Admitted.

Theorem form100_R_3c: equip Q omega.
Admitted.

Definition equiv_R_Z_mod : set -> set -> set -> prop
 := fun x y n => x :e Z /\ y :e Z /\ n :e Npos /\ exists m :e Z, m * (x + - y) = n.

Definition quadratic_residue_R_Z_mod : set -> set -> prop
 := fun q n => q :e Z :\: {zero} /\ n :e Npos /\ exists x :e Npos, equiv_R_Z_mod (x * x) q n.

Definition Legendre_R_Z : set -> set -> set :=
  fun a p => if quadratic_residue_R_Z_mod a p then one else if equiv_R_Z_mod a zero p then zero else - one.

Theorem form100_R_7: forall x y :e omega, forall p q :e RealsStruct_Primes Rs,
    p = 2 * emb x + 1 -> q = 2 * emb y + 1
 -> Legendre_R_Z p q * Legendre_R_Z q p = (- one) ^ (mul_nat x y).
Admitted.

Theorem form100_R_11: infinite (RealsStruct_Primes Rs).
Admitted.

Theorem form100_R_22a: forall f:set -> set, ~surj omega R f.
Admitted.

Theorem form100_R_22b: ~equip R omega.
Admitted.

End RealsStruct.