(** Dieudonne Foundations of Modern Analysis Section II.2 **)

Definition finsequnion : set -> set -> set := fun n X => nat_primrec 0 (fun i Y => X i :\/: Y) n.

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
Let N := RealsStruct_N Rs.
Let Npos := RealsStruct_Npos Rs.
Let Z := RealsStruct_Z Rs.
Let Q := RealsStruct_Q Rs.
Infix < 490 := RealsStruct_lt Rs.

Let emb : set -> set := RealsStruct_omega_embedding Rs.

Theorem Dieudonne_2_2_3a: forall A c= R, A <> 0 -> finite A -> exists a :e A, forall x :e A, a <= x.
Admitted.

Theorem Dieudonne_2_2_3b: forall A c= R, A <> 0 -> finite A -> exists b :e A, forall x :e A, x <= b.
Admitted.

Theorem Dieudonne_2_2_4: forall n :e omega, forall A c= R, equip n A ->
 exists f:set -> set, bij n A f /\ (forall j :e n, forall i :e j, f i :e f j)
   /\ forall g:set -> set, bij n A g
       -> (forall j :e n, forall i :e j, g i :e g j)
       -> (forall i :e n, f i = g i).
Admitted.

Definition RealsStruct_finseqsum : set -> set -> set :=
 fun n f => nat_primrec zero (fun i r => f i + r) n.

Let finseqsum : set -> set -> set := RealsStruct_finseqsum.

Theorem Dieudonne_2_2_5a: forall n :e omega, forall x y :e R :^: n, (forall i :e n, x i <= y i) -> finseqsum n x <= finseqsum n y.
Admitted.

Theorem Dieudonne_2_2_5b: forall n :e omega, forall x y :e R :^: n, (forall i :e n, x i <= y i) -> (exists i :e n, x i < y i) -> finseqsum n x < finseqsum n y.
Admitted.

Theorem Dieudonne_2_2_6: forall x y z :e R, x <= y <-> x + z <= y + z.
Admitted.

Theorem Dieudonne_2_2_7a: forall x y :e R, x <= y -> zero <= y + - x.
Admitted.

Theorem Dieudonne_2_2_7b: forall x y :e R, zero <= y + - x -> x <= y.
Admitted.

Theorem Dieudonne_2_2_7c: forall x y :e R, x <= y -> x + - y <= zero.
Admitted.

Theorem Dieudonne_2_2_7d: forall x y :e R, x + - y <= zero -> x <= y.
Admitted.

Theorem Dieudonne_2_2_7e: forall x y :e R, x <= y -> - y <= - x.
Admitted.

Theorem Dieudonne_2_2_7f: forall x y :e R, - y <= - x -> x <= y.
Admitted.

Theorem Dieudonne_2_2_8a: forall n :e omega, forall x :e R :^: n, (forall i :e n, zero <= x i) -> zero <= finseqsum n x.
Admitted.

Theorem Dieudonne_2_2_8b: forall n :e omega, forall x :e R :^: n, (forall i :e n, zero <= x i) -> finseqsum n x = zero -> forall i :e n, x i = zero.
Admitted.

Let abs := RealsStruct_abs Rs.

Theorem Dieudonne_2_2_9a: forall a :e R, zero < a -> forall x :e R, abs x <= a -> - a <= x /\ x <= a.
Admitted.

Theorem Dieudonne_2_2_9b: forall a :e R, zero < a -> forall x :e R, - a <= x -> x <= a -> abs x <= a.
Admitted.

Theorem Dieudonne_2_2_9c: forall a :e R, zero < a -> forall x :e R, abs x < a -> - a < x /\ x < a.
Admitted.

Theorem Dieudonne_2_2_9d: forall a :e R, zero < a -> forall x :e R, - a < x -> x < a -> abs x < a.
Admitted.

Theorem Dieudonne_2_2_10a: forall x y :e R, abs (x + y) <= abs x + abs y.
Admitted.

Theorem Dieudonne_2_2_10b: forall x y :e R, abs (abs x + - abs y) <= abs (x + - y).
Admitted.

Theorem Dieudonne_2_2_11: forall z :e R, zero <= z -> forall x y :e R, x <= y -> x * z <= y * z.
Admitted.

Theorem Dieudonne_2_2_12a: forall x y :e R, x <= zero -> zero <= y -> x * y <= zero.
Admitted.

Theorem Dieudonne_2_2_12b: forall x y :e R, x <= zero -> y <= zero -> zero <= x * y.
Admitted.

Theorem Dieudonne_2_2_12c: forall x y :e R, x < zero -> zero < y -> x * y < zero.
Admitted.

Theorem Dieudonne_2_2_12d: forall x y :e R, x < zero -> y < zero -> zero < x * y.
Admitted.

Theorem Dieudonne_2_2_13a: forall x :e R, zero < x -> zero < one :/: x.
Admitted.

Theorem Dieudonne_2_2_11_imp_2_2_13b:
    (forall z :e R, zero <= z -> forall x y :e R, x <= y -> x * z <= y * z)
 -> forall z :e R, zero < z -> forall x y :e R, x <= y -> x * z <= y * z.
Admitted.

Theorem Dieudonne_2_2_13b: forall z :e R, zero < z -> forall x y :e R, x <= y -> x * z <= y * z.
Admitted.

Theorem Dieudonne_2_2_13c: forall z :e R, zero < z -> forall x y :e R, x * z <= y * z -> x <= y.
Admitted.

Theorem Dieudonne_2_2_13d: forall z :e R, zero < z -> forall x y :e R, x < y -> x * z < y * z.
Admitted.

Theorem Dieudonne_2_2_13c_imp_2_2_13e:
    (forall z :e R, zero < z -> forall x y :e R, x * z <= y * z -> x <= y)
 -> forall z :e R, zero < z -> forall x y :e R, x * z < y * z -> x < y.
Admitted.

Theorem Dieudonne_2_2_13e: forall z :e R, zero < z -> forall x y :e R, x * z < y * z -> x < y.
Admitted.

Theorem Dieudonne_2_2_13f: forall x y :e R, zero < x -> x < y -> zero < 1 :/: y /\ 1 :/: y < 1 :/: x.
Admitted.

Theorem Dieudonne_2_2_13g: forall x y :e R, zero < 1 :/: y -> 1 :/: y < 1 :/: x -> zero < x /\ x < y.
Admitted.

Infix ^ 342 right := CRing_with_id_omega_exp (Field_of_RealsStruct Rs).

Theorem Dieudonne_2_2_13h: forall x y :e R, zero < x -> x < y -> forall n :e omega :\: {0}, zero < x ^ n /\ x ^ n < y ^ n.
Admitted.

Theorem Dieudonne_2_2_13i: forall x y :e R, forall n :e omega :\: {0}, zero < x ^ n /\ x ^ n < y ^ n -> zero < x /\ x < y.
Admitted.

Definition RealsStruct_openint : set -> set -> set := fun a b => {x :e R|a < x /\ x < b}.
Let openint := RealsStruct_openint.

Definition RealsStruct_openints : set := {ab :e R :^: 2|ab 0 < ab 1}.
Let openints := RealsStruct_openints.

Theorem RealsStruct_openints_nonempty : forall ab :e openints, openint (ab 0) (ab 1) <> 0.
Admitted.

Definition RealsStruct_openints_len : set -> set := fun ab => ab 1 + - ab 0.
Let len := RealsStruct_openints_len.

Theorem RealsStruct_openints_len_pos : forall ab :e openints, zero < len ab.
Admitted.

Theorem Dieudonne_2_2_14: forall n :e omega, forall J :e openints :^: n, (forall j :e n, forall i :e j, J i :/\: J j = 0) -> forall I :e openints, finsequnion n J c= I -> finseqsum n (fun i :e n => len (J i)) <= len I.
Admitted.

Theorem Dieudonne_2_2_15: equip omega Q.
Admitted.

Theorem Dieudonne_2_2_16: forall ab :e openints, infinite (openint (ab 0) (ab 1) :/\: Q).
Admitted.

Theorem Dieudonne_2_2_17a: forall f:set -> set, ~surj omega R f.
Admitted.

Theorem Dieudonne_2_2_17b: ~equip omega R.
Admitted.

End RealsStruct.
