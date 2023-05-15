(** http://www.cs.ru.nl/~freek/100/ problem 1:
    Irrationality of square root of 2 **)

Infix * 355 right := mul_nat.

(** (n/m)^2 = 2, ie, n^2 = 2 m^2 is impossible for n,m :e omega :\: 1 **)
Theorem form100_1_v1 : forall n m :e omega :\: 1, n * n <> 2 * m * m.
Admitted.

Infix * 355 right := mul_SNo.

(** Version for surreal numbers saying no rational squares to 2 **)
(** Here rational is defined relative division for CSNo (complex surreals),
    so proving this requires knowing that division for CSNo
    behaves appropriately. **)
Theorem form100_1_v2 : forall x, SNo x -> x * x = 2 -> x /:e rational.
Admitted.

(** Of course, the result also holds for complex surreals. **)
Theorem form100_1_v3 : forall x, CSNo x -> x * x = 2 -> x /:e rational.
Admitted.

(** Define square root operator for complex surreals using choice (Eps_i)
    and use this in the third version. **)
Definition sqrt_CSNo : set -> set := fun x => Eps_i (fun y => CSNo y /\ y * y = x).

(** This version requires proving a square root exists. **)
Theorem form100_1_v4 : forall x, SNo x -> sqrt_CSNo x /:e rational.
Admitted.

(** Next are versions with abstract explicit real numbers. **)

Section explicit_Reals.

Variable R : set.

Variable zero one : set.
Variable plus mult : set -> set -> set.

Infix + 360 right := plus.
Infix * 355 right := mult.

Definition explicit_Field_sqr : set -> set := fun x => x * x.

Definition explicit_Field_div : set -> set -> set
 := fun x y => if y = zero then zero else Eps_i (fun z => z :e R /\ z * y = x).

Let two := one + one.

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

Theorem form100_1_v5 : explicit_Reals R zero one plus mult leq
  -> forall x :e R, x * x = two -> 
      forall n m,
            natOfOrderedField_p R zero one plus mult leq n
         -> natOfOrderedField_p R zero one plus mult leq m -> m <> zero
         -> n * n <> two * m * m.
Admitted.

Theorem form100_1_v6 : explicit_Reals R zero one plus mult leq
  -> forall x :e R, x * x = two -> 
      forall n m,
            natOfOrderedField_p R zero one plus mult leq n
         -> natOfOrderedField_p R zero one plus mult leq m -> m <> zero
         -> explicit_Field_sqr (explicit_Field_div n m) <> two.
Admitted.

Definition explicit_Reals_sqrt : set -> set
 := fun x => if zero <= x then Eps_i (fun y => y :e R /\ zero <= y /\ y * y = x) else zero.

Theorem form100_1_v7 : explicit_Reals R zero one plus mult leq
  -> forall n m,
            natOfOrderedField_p R zero one plus mult leq n
         -> natOfOrderedField_p R zero one plus mult leq m -> m <> zero
         -> explicit_Field_div n m <> explicit_Reals_sqrt two.
Admitted.

Theorem form100_1_v8 : explicit_Reals R zero one plus mult leq
  -> ~explicit_OrderedField_rationalp_mult (explicit_Reals_sqrt two).
Admitted.

Theorem form100_1_v9 : explicit_Reals R zero one plus mult leq
  -> ~explicit_OrderedField_rationalp_div (explicit_Reals_sqrt two).
Admitted.

End explicit_Reals.

Section explicit_Nats_zero.

Variable N : set.
Variable zero : set.
Variable S : set -> set.

Infix + 360 right := explicit_Nats_zero_plus N zero S.
Infix * 355 right := explicit_Nats_zero_mult N zero S.

Hypothesis HN: explicit_Nats N zero S.

Theorem form100_1_v10 : forall n m :e N, m <> zero -> n * n <> (S (S zero)) * m * m.
Admitted.

End explicit_Nats_zero.

Section explicit_Nats_one.

Variable N : set.
Variable one : set.
Variable S : set -> set.

Infix + 360 right := explicit_Nats_one_plus N one S.
Infix * 355 right := explicit_Nats_one_mult N one S.
Infix ^ 342 right := explicit_Nats_one_exp N one S.

Hypothesis HN: explicit_Nats N one S.

Let two := S one.

Theorem form100_1_v11 : forall n m :e N, n * n <> two * m * m.
Admitted.

End explicit_Nats_one.
