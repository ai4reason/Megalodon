Infix + 360 right := add_nat.
Infix * 355 right := mul_nat.
Prefix - 358 := minus_SNo.
Infix :/: 353 := div_SNo.
Infix ^ 342 right := exp_nat.

Definition nat_binomial_coefficient_f : set -> set -> set
 := fun n k => nat_factorial n :/: (nat_factorial (n + - k) * nat_factorial k).

Definition nat_binomial_coefficient_r : set -> set -> set
 := fun n k => nat_primrec (fun k :e omega => if k = 0 then 1 else 0)
                           (fun m r => fun k :e omega => if k = 0 then 1 else r (Union k) + r k) n k.

Theorem form100_44_v1: forall x y n :e omega, (x + y) ^ n = nat_primrec 0 (fun k r => nat_binomial_coefficient_f n k * x ^ k * y ^ (n + - k)) (ordsucc n).
Admitted.

Theorem form100_44_v2: forall x y n :e omega, (x + y) ^ n = nat_primrec 0 (fun k r => nat_binomial_coefficient_r n k * x ^ k * y ^ (n + - k)) (ordsucc n).
Admitted.

Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix ^ 342 right := exp_SNo_nat.

Theorem form100_44_v3: forall x y, SNo x -> SNo y -> forall n :e omega, (x + y) ^ n = nat_primrec 0 (fun k r => nat_binomial_coefficient_f n k * x ^ k * y ^ (n + - k)) (ordsucc n).
Admitted.

Theorem form100_44_v4: forall x y, SNo x -> SNo y -> forall n :e omega, (x + y) ^ n = nat_primrec 0 (fun k r => nat_binomial_coefficient_r n k * x ^ k * y ^ (n + - k)) (ordsucc n).
Admitted.

Infix + 360 right := add_CSNo.
Infix * 355 right := mul_CSNo.

Definition exp_CSNo_nat : set->set->set := fun n m:set => nat_primrec 1 (fun _ r => n * r) m.
Infix ^ 342 right := exp_CSNo_nat.

Theorem form100_44_v5: forall x y, CSNo x -> CSNo y -> forall n :e omega, (x + y) ^ n = nat_primrec 0 (fun k r => nat_binomial_coefficient_f n k * x ^ k * y ^ (n + - k)) (ordsucc n).
Admitted.

Theorem form100_44_v6: forall x y, CSNo x -> CSNo y -> forall n :e omega, (x + y) ^ n = nat_primrec 0 (fun k r => nat_binomial_coefficient_r n k * x ^ k * y ^ (n + - k)) (ordsucc n).
Admitted.

Section explicit_CRing_with_id.

Variable R : set.

Variable zero one : set.
Variable plus mult : set -> set -> set.

Infix + 360 right := plus.
Infix * 355 right := mult.
Infix ^ 342 right := explicit_Ring_with_id_exp_nat R zero one plus mult.

Theorem form100_44_v7: explicit_CRing_with_id R zero one plus mult
 -> forall x y :e R, forall n :e omega,
      (x + y) ^ n = nat_primrec (zero,n) (fun k r => (r 0 + nat_binomial_coefficient_f n k * x ^ k * y ^ (r 1),Union (r 1))) (ordsucc n) 0.
Admitted.

Theorem form100_44_v8: explicit_CRing_with_id R zero one plus mult
 -> forall x y :e R, forall n :e omega,
      (x + y) ^ n = nat_primrec (zero,n) (fun k r => (r 0 + nat_binomial_coefficient_f n k * x ^ k * y ^ (r 1),Union (r 1))) (ordsucc n) 0.
Admitted.

End explicit_CRing_with_id.
