(** http://www.cs.ru.nl/~freek/100/ problem 1:
    Irrationality of square root of 2 **)

Infix * 355 right := mul_nat.

(** (n/m)^2 = 2, ie, n^2 = 2 m^2 is impossible for n,m :e omega :\: 1 **)
Theorem Form100_1_v1 : forall n m :e omega :\: 1, n * n <> 2 * m * m.
claim L1: forall n, nat_p n -> forall m :e omega, ordsucc n * ordsucc n <> 2 * m * m.
{ apply nat_ind.
  - let m. assume Hm. assume H1: 1 * 1 = 2 * m * m.
  
  admit.
  - let n. assume Hn IHn.
    let m. assume Hm.
  admit.
}
let n. assume Hn. let m. assume Hm.
apply setminusE omega 1 n Hn.
assume Hn1 Hn2.
claim Ln: nat_p n.
{ exact omega_nat_p n Hn1. }
apply nat_inv n Ln.
- assume H1: n = 0. prove False. apply Hn2. rewrite H1. exact In_0_1.
- assume H. apply H. let n'. assume Hn'. apply Hn'.
  assume Hn'1: nat_p n'.
  assume Hn'2: n = ordsucc n'.
  prove n * n <> 2 * m * m.
  rewrite Hn'2.
  exact L1 n' Hn'1 m (setminusE1 omega 1 m Hm).
Qed.
foo.

Infix * 355 right := mul_SNo.

(** Version for surreal numbers saying no rational squares to 2 **)
(** Here rational is defined relative division for CSNo (complex surreals),
    so proving this requires knowing that division for CSNo
    behaves appropriately. **)
Theorem Form100_1_v2 : forall x, SNo x -> x * x = 2 -> x /:e rational.
Admitted.

(** Of course, the result also holds for complex surreals. **)
Theorem Form100_1_v3 : forall x, CSNo x -> x * x = 2 -> x /:e rational.
Admitted.

(** Define square root operator for complex surreals using choice (the)
    and use this in the third version. **)
Definition sqrt_CSNo : set -> set := fun x => the (fun y => CSNo y /\ y * y = x).

(** This version requires proving a square root exists. **)
Theorem Form100_1_v4 : forall x, SNo x -> sqrt_CSNo x /:e rational.
Admitted.

(** Next are versions with abstract explicit natural numbers. **)
(** explicit_Nats are agnostic about whether the first element is zero or one.
    We treat it as one here to avoid division by zero.
 **)
Section explicit_Nats.

Variable N : set.
Variable one : set.
Variable S : set -> set.

Definition explicit_Nats_one_plusR : set -> set -> set -> prop
 := fun n m k =>
      forall p:set -> set -> set -> prop,
          (forall m :e N, p one m (S m))
       -> (forall n m k, p n m k -> p (S n) m (S k))
       -> p n m k.


End explicit_Nats.

(** Next are versions with abstract explicit real numbers. **)

Section explicit_Reals.

Variable R : set.

Variable zero one : set.
Variable plus mult : set -> set -> set.

Infix + 360 right := plus.
Infix * 355 right := mult.

Definition explicit_Field_sqr : set -> set := fun x => x * x.

Definition explicit_Field_div : set -> set -> set
 := fun x y => if y = zero then zero else the (fun z => z :e R /\ z * y = x).

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

Theorem Form100_1_v5 : explicit_Reals R zero one plus mult leq
  -> forall x :e R, x * x = two -> 
      forall n m,
            natOfOrderedField_p R zero one plus mult leq n
         -> natOfOrderedField_p R zero one plus mult leq m -> m <> zero
         -> n * n <> two * m * m.
Admitted.

Theorem Form100_1_v6 : explicit_Reals R zero one plus mult leq
  -> forall x :e R, x * x = two -> 
      forall n m,
            natOfOrderedField_p R zero one plus mult leq n
         -> natOfOrderedField_p R zero one plus mult leq m -> m <> zero
         -> explicit_Field_sqr (explicit_Field_div n m) <> two.
Admitted.

Definition explicit_Reals_sqrt : set -> set
 := fun x => if zero <= x then the (fun y => y :e R /\ zero <= y /\ y * y = x) else zero.

Theorem Form100_1_v7 : explicit_Reals R zero one plus mult leq
  -> forall n m,
            natOfOrderedField_p R zero one plus mult leq n
         -> natOfOrderedField_p R zero one plus mult leq m -> m <> zero
         -> explicit_Field_div n m <> explicit_Reals_sqrt two.
Admitted.

Theorem Form100_1_v8 : explicit_Reals R zero one plus mult leq
  -> ~explicit_OrderedField_rationalp_mult (explicit_Reals_sqrt two).
Admitted.

Theorem Form100_1_v9 : explicit_Reals R zero one plus mult leq
  -> ~explicit_OrderedField_rationalp_div (explicit_Reals_sqrt two).
Admitted.

End explicit_Reals.
