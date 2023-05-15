(** http://www.cs.ru.nl/~freek/100/ problem 3:
    The Denumerability of the Rational Numbers **)

Theorem form100_3_v1: equip omega rational.
Admitted.

Theorem form100_3_v2: exists f:set -> set, forall x :e rational, exists n :e omega, f n = x.
Admitted.

Infix * 355 right := mul_nat.

Theorem form100_3_v3 : equip omega {u :e omega :*: omega | quotient (fun u v => u 0 * v 1 = u 1 * v 0) u}.
Admitted.

Infix * 355 right := mul_SNo.

Theorem form100_3_v4 : equip omega {u :e omega :*: omega | quotient (fun u v => u 0 * v 1 = u 1 * v 0) u}.
Admitted.

Infix * 355 right := mul_CSNo.

Theorem form100_3_v5 : equip omega {u :e omega :*: omega | quotient (fun u v => u 0 * v 1 = u 1 * v 0) u}.
Admitted.


(** Next are versions with abstract real numbers. **)

Section explicit_Reals.

Variable R : set.

Variable zero one : set.
Variable plus mult : set -> set -> set.

Infix + 360 right := plus.
Infix * 355 right := mult.

Definition explicit_Field_div : set -> set -> set
 := fun x y => if y = zero then zero else Eps_i (fun z => z :e R /\ z * y = x).

Variable leq : set -> set -> prop.

(* Unicode <= "2264" *)
Infix <= 490 := leq.

Definition explicit_OrderedField_rationalp_mult : set -> prop
 := fun x =>
      exists n m, natOfOrderedField_p R zero one plus mult leq n
               /\ natOfOrderedField_p R zero one plus mult leq m
               /\ m * x = n.

Definition explicit_OrderedField_rationalp_div : set -> prop
 := fun x =>
      exists n m, natOfOrderedField_p R zero one plus mult leq n
               /\ natOfOrderedField_p R zero one plus mult leq m
               /\ m <> zero
               /\ x = explicit_Field_div n m.

Theorem form100_3_v6: explicit_Reals R zero one plus mult leq
  -> equip omega {x :e R|explicit_OrderedField_rationalp_mult x}.
Admitted.

Theorem form100_3_v7: explicit_Reals R zero one plus mult leq
  -> exists f:set -> set, forall x :e {x :e R|explicit_OrderedField_rationalp_mult x}, exists n :e omega, f n = x.
Admitted.

Theorem form100_3_v8: explicit_Reals R zero one plus mult leq
  -> equip omega {x :e R|explicit_OrderedField_rationalp_div x}.
Admitted.

Theorem form100_3_v9: explicit_Reals R zero one plus mult leq
  -> exists f:set -> set, forall x :e {x :e R|explicit_OrderedField_rationalp_div x}, exists n :e omega, f n = x.
Admitted.

End explicit_Reals.

Section explicit_Nats_one.

Variable N : set.
Variable one : set.
Variable S : set -> set.

Infix + 360 right := explicit_Nats_one_plus N one S.
Infix * 355 right := explicit_Nats_one_mult N one S.
Infix ^ 342 right := explicit_Nats_one_exp N one S.

Hypothesis HN: explicit_Nats N one S.

Theorem form100_3_v10 : equip {u :e N :*: N | quotient (fun u v => u 0 * v 1 = u 1 * v 0) u} N.
Admitted.

End explicit_Nats_one.
