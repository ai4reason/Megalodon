Definition pack_c_b_u_u : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> set) -> set := fun X C f i j => (X,encode_c X C,encode_b X f,encode_u X i,encode_u X j).

Theorem pack_c_b_u_u_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, S = pack_c_b_u_u X C f i j -> X = S 0.
let S X C f i j. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_u X i,encode_u X j) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_b_u_u_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, X = pack_c_b_u_u X C f i j 0.
let X C f i j. apply pack_c_b_u_u_0_eq (pack_c_b_u_u X C f i j) X C f i j. reflexivity.
Qed.

Theorem pack_c_b_u_u_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, S = pack_c_b_u_u X C f i j -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f i j. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_u X i,encode_u X j) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_u_u_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_u_u X C f i j 1) U.
let X C f i j. apply pack_c_b_u_u_1_eq (pack_c_b_u_u X C f i j) X C f i j. reflexivity.
Qed.

Theorem pack_c_b_u_u_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, S = pack_c_b_u_u X C f i j -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f i j. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_u X i,encode_u X j) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_u_u_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, forall x y :e X, f x y = decode_b (pack_c_b_u_u X C f i j 2) x y.
let X C f i j. apply pack_c_b_u_u_2_eq (pack_c_b_u_u X C f i j) X C f i j. reflexivity.
Qed.

Theorem pack_c_b_u_u_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, S = pack_c_b_u_u X C f i j -> forall x :e X, i x = decode_u (S 3) x.
let S X C f i j. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_b X f,encode_u X i,encode_u X j) 3) x.
rewrite tuple_5_3_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_b_u_u_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, forall x :e X, i x = decode_u (pack_c_b_u_u X C f i j 3) x.
let X C f i j. apply pack_c_b_u_u_3_eq (pack_c_b_u_u X C f i j) X C f i j. reflexivity.
Qed.

Theorem pack_c_b_u_u_4_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, S = pack_c_b_u_u X C f i j -> forall x :e X, j x = decode_u (S 4) x.
let S X C f i j. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_c X C,encode_b X f,encode_u X i,encode_u X j) 4) x.
rewrite tuple_5_4_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_c_b_u_u_4_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, forall x :e X, j x = decode_u (pack_c_b_u_u X C f i j 4) x.
let X C f i j. apply pack_c_b_u_u_4_eq (pack_c_b_u_u X C f i j) X C f i j. reflexivity.
Qed.

Theorem pack_c_b_u_u_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall i i':set -> set, forall j j':set -> set, pack_c_b_u_u X C f i j = pack_c_b_u_u X' C' f' i' j' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x).
let X X' C C' f f' i i' j j'. assume H1.
claim L0: X' = pack_c_b_u_u X C f i j 0.
{ exact pack_c_b_u_u_0_eq (pack_c_b_u_u X C f i j) X' C' f' i' j' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_u_u_0_eq2 X C f i j. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_u_u_1_eq2 X C f i j U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_u_u_1_eq2 X' C' f' i' j' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_u_u_2_eq2 X C f i j x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_u_u_2_eq2 X' C' f' i' j' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_b_u_u_3_eq2 X C f i j x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_u_u_3_eq2 X' C' f' i' j' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_c_b_u_u_4_eq2 X C f i j x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_u_u_4_eq2 X' C' f' i' j' x Lx.
Qed.

Theorem pack_c_b_u_u_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall i i':set -> set, forall j j':set -> set,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 pack_c_b_u_u X C f i j = pack_c_b_u_u X C' f' i' j'.
let X C C' f f' i i' j j'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_c X C,encode_b X f,encode_u X i,encode_u X j) = (X,encode_c X C',encode_b X f',encode_u X i',encode_u X j').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H3. }
rewrite <- L3.
claim L4: encode_u X j = encode_u X j'.
{ apply encode_u_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_c_b_u_u : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> q (pack_c_b_u_u X C f i j)) -> q S.

Theorem pack_struct_c_b_u_u_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> struct_c_b_u_u (pack_c_b_u_u X C f i j).
let X C f. assume Hf. let i. assume Hi. let j. assume Hj. let q. assume Hq.
exact Hq X C f Hf i Hi j Hj.
Qed.

Theorem pack_struct_c_b_u_u_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, struct_c_b_u_u (pack_c_b_u_u X C f i j) -> forall x y :e X, f x y :e X.
let X C f i j. assume H1. apply H1 (fun z => z = pack_c_b_u_u X C f i j -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'. let j'. assume Hj'.
  assume Heq: pack_c_b_u_u X' C' f' i' j' = pack_c_b_u_u X C f i j.
  apply pack_c_b_u_u_inj X' X C' C f' f i' i j' j Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i Hj'j.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_c_b_u_u_E3: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, struct_c_b_u_u (pack_c_b_u_u X C f i j) -> forall x :e X, i x :e X.
let X C f i j. assume H1. apply H1 (fun z => z = pack_c_b_u_u X C f i j -> forall x :e X, i x :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'. let j'. assume Hj'.
  assume Heq: pack_c_b_u_u X' C' f' i' j' = pack_c_b_u_u X C f i j.
  apply pack_c_b_u_u_inj X' X C' C f' f i' i j' j Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i Hj'j.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_c_b_u_u_E4: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set, struct_c_b_u_u (pack_c_b_u_u X C f i j) -> forall x :e X, j x :e X.
let X C f i j. assume H1. apply H1 (fun z => z = pack_c_b_u_u X C f i j -> forall x :e X, j x :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'. let j'. assume Hj'.
  assume Heq: pack_c_b_u_u X' C' f' i' j' = pack_c_b_u_u X C f i j.
  apply pack_c_b_u_u_inj X' X C' C f' f i' i j' j Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i Hj'j.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem struct_c_b_u_u_eta: forall S, struct_c_b_u_u S -> S = pack_c_b_u_u (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_u (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_c_b_u_u (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_u (z 3)) (decode_u (z 4))).
let X. let C. let f. assume _. let i. assume _. let j. assume _.
prove pack_c_b_u_u X C f i j = pack_c_b_u_u (pack_c_b_u_u X C f i j 0) (decode_c (pack_c_b_u_u X C f i j 1)) (decode_b (pack_c_b_u_u X C f i j 2)) (decode_u (pack_c_b_u_u X C f i j 3)) (decode_u (pack_c_b_u_u X C f i j 4)).
rewrite <- pack_c_b_u_u_0_eq2 X C f i j.
apply pack_c_b_u_u_ext.
- let U. assume HU.
  rewrite <- pack_c_b_u_u_1_eq2 X C f i j U HU.
  apply iff_refl.
- exact pack_c_b_u_u_2_eq2 X C f i j.
- exact pack_c_b_u_u_3_eq2 X C f i j.
- exact pack_c_b_u_u_4_eq2 X C f i j.
Qed.


Definition unpack_c_b_u_u_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_u (S 4)).

Theorem unpack_c_b_u_u_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> set) -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) -> Phi X C' f' i' j' = Phi X C f i j)
  ->
  unpack_c_b_u_u_i (pack_c_b_u_u X C f i j) Phi = Phi X C f i j.
let Phi X C f i j.
assume HPhi.
prove Phi (pack_c_b_u_u X C f i j 0) (decode_c (pack_c_b_u_u X C f i j 1)) (decode_b (pack_c_b_u_u X C f i j 2)) (decode_u (pack_c_b_u_u X C f i j 3)) (decode_u (pack_c_b_u_u X C f i j 4)) = Phi X C f i j.
rewrite <- pack_c_b_u_u_0_eq2 X C f i j.
prove Phi X (decode_c (pack_c_b_u_u X C f i j 1)) (decode_b (pack_c_b_u_u X C f i j 2)) (decode_u (pack_c_b_u_u X C f i j 3)) (decode_u (pack_c_b_u_u X C f i j 4)) = Phi X C f i j.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_u_u X C f i j 1) U.
  rewrite <- pack_c_b_u_u_1_eq2 X C f i j U HU.
  apply iff_refl.
- exact pack_c_b_u_u_2_eq2 X C f i j.
- exact pack_c_b_u_u_3_eq2 X C f i j.
- exact pack_c_b_u_u_4_eq2 X C f i j.
Qed.


Definition unpack_c_b_u_u_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_u (S 4)).

Theorem unpack_c_b_u_u_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> set) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall j:set -> set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) -> Phi X C' f' i' j' = Phi X C f i j)
  ->
  unpack_c_b_u_u_o (pack_c_b_u_u X C f i j) Phi = Phi X C f i j.
let Phi X C f i j.
assume HPhi.
prove Phi (pack_c_b_u_u X C f i j 0) (decode_c (pack_c_b_u_u X C f i j 1)) (decode_b (pack_c_b_u_u X C f i j 2)) (decode_u (pack_c_b_u_u X C f i j 3)) (decode_u (pack_c_b_u_u X C f i j 4)) = Phi X C f i j.
rewrite <- pack_c_b_u_u_0_eq2 X C f i j.
prove Phi X (decode_c (pack_c_b_u_u X C f i j 1)) (decode_b (pack_c_b_u_u X C f i j 2)) (decode_u (pack_c_b_u_u X C f i j 3)) (decode_u (pack_c_b_u_u X C f i j 4)) = Phi X C f i j.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_u_u X C f i j 1) U.
  rewrite <- pack_c_b_u_u_1_eq2 X C f i j U HU.
  apply iff_refl.
- exact pack_c_b_u_u_2_eq2 X C f i j.
- exact pack_c_b_u_u_3_eq2 X C f i j.
- exact pack_c_b_u_u_4_eq2 X C f i j.
Qed.


Definition pack_c_b_u_r : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set := fun X C f i R => (X,encode_c X C,encode_b X f,encode_u X i,encode_r X R).

Theorem pack_c_b_u_r_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_c_b_u_r X C f i R -> X = S 0.
let S X C f i R. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_u X i,encode_r X R) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_b_u_r_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, X = pack_c_b_u_r X C f i R 0.
let X C f i R. apply pack_c_b_u_r_0_eq (pack_c_b_u_r X C f i R) X C f i R. reflexivity.
Qed.

Theorem pack_c_b_u_r_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_c_b_u_r X C f i R -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f i R. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_u X i,encode_r X R) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_u_r_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_u_r X C f i R 1) U.
let X C f i R. apply pack_c_b_u_r_1_eq (pack_c_b_u_r X C f i R) X C f i R. reflexivity.
Qed.

Theorem pack_c_b_u_r_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_c_b_u_r X C f i R -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f i R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_u X i,encode_r X R) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_u_r_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall x y :e X, f x y = decode_b (pack_c_b_u_r X C f i R 2) x y.
let X C f i R. apply pack_c_b_u_r_2_eq (pack_c_b_u_r X C f i R) X C f i R. reflexivity.
Qed.

Theorem pack_c_b_u_r_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_c_b_u_r X C f i R -> forall x :e X, i x = decode_u (S 3) x.
let S X C f i R. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_b X f,encode_u X i,encode_r X R) 3) x.
rewrite tuple_5_3_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_b_u_r_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall x :e X, i x = decode_u (pack_c_b_u_r X C f i R 3) x.
let X C f i R. apply pack_c_b_u_r_3_eq (pack_c_b_u_r X C f i R) X C f i R. reflexivity.
Qed.

Theorem pack_c_b_u_r_4_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_c_b_u_r X C f i R -> forall x y :e X, R x y = decode_r (S 4) x y.
let S X C f i R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_b X f,encode_u X i,encode_r X R) 4) x y.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_b_u_r_4_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_c_b_u_r X C f i R 4) x y.
let X C f i R. apply pack_c_b_u_r_4_eq (pack_c_b_u_r X C f i R) X C f i R. reflexivity.
Qed.

Theorem pack_c_b_u_r_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop, pack_c_b_u_r X C f i R = pack_c_b_u_r X' C' f' i' R' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y).
let X X' C C' f f' i i' R R'. assume H1.
claim L0: X' = pack_c_b_u_r X C f i R 0.
{ exact pack_c_b_u_r_0_eq (pack_c_b_u_r X C f i R) X' C' f' i' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_u_r_0_eq2 X C f i R. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_u_r_1_eq2 X C f i R U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_u_r_1_eq2 X' C' f' i' R' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_u_r_2_eq2 X C f i R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_u_r_2_eq2 X' C' f' i' R' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_b_u_r_3_eq2 X C f i R x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_u_r_3_eq2 X' C' f' i' R' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_b_u_r_4_eq2 X C f i R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_u_r_4_eq2 X' C' f' i' R' x Lx y Ly.
Qed.

Theorem pack_c_b_u_r_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_c_b_u_r X C f i R = pack_c_b_u_r X C' f' i' R'.
let X C C' f f' i i' R R'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_c X C,encode_b X f,encode_u X i,encode_r X R) = (X,encode_c X C',encode_b X f',encode_u X i',encode_r X R').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H3. }
rewrite <- L3.
claim L4: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_c_b_u_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, q (pack_c_b_u_r X C f i R)) -> q S.

Theorem pack_struct_c_b_u_r_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, struct_c_b_u_r (pack_c_b_u_r X C f i R).
let X C f. assume Hf. let i. assume Hi. let R q. assume Hq.
exact Hq X C f Hf i Hi R.
Qed.

Theorem pack_struct_c_b_u_r_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, struct_c_b_u_r (pack_c_b_u_r X C f i R) -> forall x y :e X, f x y :e X.
let X C f i R. assume H1. apply H1 (fun z => z = pack_c_b_u_r X C f i R -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'. let R'.
  assume Heq: pack_c_b_u_r X' C' f' i' R' = pack_c_b_u_r X C f i R.
  apply pack_c_b_u_r_inj X' X C' C f' f i' i R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_c_b_u_r_E3: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, struct_c_b_u_r (pack_c_b_u_r X C f i R) -> forall x :e X, i x :e X.
let X C f i R. assume H1. apply H1 (fun z => z = pack_c_b_u_r X C f i R -> forall x :e X, i x :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'. let R'.
  assume Heq: pack_c_b_u_r X' C' f' i' R' = pack_c_b_u_r X C f i R.
  apply pack_c_b_u_r_inj X' X C' C f' f i' i R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i HR'R.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_c_b_u_r_eta: forall S, struct_c_b_u_r S -> S = pack_c_b_u_r (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_r (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_c_b_u_r (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_u (z 3)) (decode_r (z 4))).
let X. let C. let f. assume _. let i. assume _. let R.
prove pack_c_b_u_r X C f i R = pack_c_b_u_r (pack_c_b_u_r X C f i R 0) (decode_c (pack_c_b_u_r X C f i R 1)) (decode_b (pack_c_b_u_r X C f i R 2)) (decode_u (pack_c_b_u_r X C f i R 3)) (decode_r (pack_c_b_u_r X C f i R 4)).
rewrite <- pack_c_b_u_r_0_eq2 X C f i R.
apply pack_c_b_u_r_ext.
- let U. assume HU.
  rewrite <- pack_c_b_u_r_1_eq2 X C f i R U HU.
  apply iff_refl.
- exact pack_c_b_u_r_2_eq2 X C f i R.
- exact pack_c_b_u_r_3_eq2 X C f i R.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_b_u_r_4_eq2 X C f i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_b_u_r_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_r (S 4)).

Theorem unpack_c_b_u_r_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' f' i' R' = Phi X C f i R)
  ->
  unpack_c_b_u_r_i (pack_c_b_u_r X C f i R) Phi = Phi X C f i R.
let Phi X C f i R.
assume HPhi.
prove Phi (pack_c_b_u_r X C f i R 0) (decode_c (pack_c_b_u_r X C f i R 1)) (decode_b (pack_c_b_u_r X C f i R 2)) (decode_u (pack_c_b_u_r X C f i R 3)) (decode_r (pack_c_b_u_r X C f i R 4)) = Phi X C f i R.
rewrite <- pack_c_b_u_r_0_eq2 X C f i R.
prove Phi X (decode_c (pack_c_b_u_r X C f i R 1)) (decode_b (pack_c_b_u_r X C f i R 2)) (decode_u (pack_c_b_u_r X C f i R 3)) (decode_r (pack_c_b_u_r X C f i R 4)) = Phi X C f i R.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_u_r X C f i R 1) U.
  rewrite <- pack_c_b_u_r_1_eq2 X C f i R U HU.
  apply iff_refl.
- exact pack_c_b_u_r_2_eq2 X C f i R.
- exact pack_c_b_u_r_3_eq2 X C f i R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_b_u_r X C f i R 4) x y.
  rewrite <- pack_c_b_u_r_4_eq2 X C f i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_b_u_r_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_r (S 4)).

Theorem unpack_c_b_u_r_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' f' i' R' = Phi X C f i R)
  ->
  unpack_c_b_u_r_o (pack_c_b_u_r X C f i R) Phi = Phi X C f i R.
let Phi X C f i R.
assume HPhi.
prove Phi (pack_c_b_u_r X C f i R 0) (decode_c (pack_c_b_u_r X C f i R 1)) (decode_b (pack_c_b_u_r X C f i R 2)) (decode_u (pack_c_b_u_r X C f i R 3)) (decode_r (pack_c_b_u_r X C f i R 4)) = Phi X C f i R.
rewrite <- pack_c_b_u_r_0_eq2 X C f i R.
prove Phi X (decode_c (pack_c_b_u_r X C f i R 1)) (decode_b (pack_c_b_u_r X C f i R 2)) (decode_u (pack_c_b_u_r X C f i R 3)) (decode_r (pack_c_b_u_r X C f i R 4)) = Phi X C f i R.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_u_r X C f i R 1) U.
  rewrite <- pack_c_b_u_r_1_eq2 X C f i R U HU.
  apply iff_refl.
- exact pack_c_b_u_r_2_eq2 X C f i R.
- exact pack_c_b_u_r_3_eq2 X C f i R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_b_u_r X C f i R 4) x y.
  rewrite <- pack_c_b_u_r_4_eq2 X C f i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_c_b_u_p : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set := fun X C f i P => (X,encode_c X C,encode_b X f,encode_u X i,encode_p X P).

Theorem pack_c_b_u_p_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_c_b_u_p X C f i P -> X = S 0.
let S X C f i P. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_u X i,encode_p X P) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_b_u_p_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, X = pack_c_b_u_p X C f i P 0.
let X C f i P. apply pack_c_b_u_p_0_eq (pack_c_b_u_p X C f i P) X C f i P. reflexivity.
Qed.

Theorem pack_c_b_u_p_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_c_b_u_p X C f i P -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f i P. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_u X i,encode_p X P) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_u_p_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_u_p X C f i P 1) U.
let X C f i P. apply pack_c_b_u_p_1_eq (pack_c_b_u_p X C f i P) X C f i P. reflexivity.
Qed.

Theorem pack_c_b_u_p_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_c_b_u_p X C f i P -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f i P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_u X i,encode_p X P) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_u_p_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_c_b_u_p X C f i P 2) x y.
let X C f i P. apply pack_c_b_u_p_2_eq (pack_c_b_u_p X C f i P) X C f i P. reflexivity.
Qed.

Theorem pack_c_b_u_p_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_c_b_u_p X C f i P -> forall x :e X, i x = decode_u (S 3) x.
let S X C f i P. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_b X f,encode_u X i,encode_p X P) 3) x.
rewrite tuple_5_3_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_b_u_p_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall x :e X, i x = decode_u (pack_c_b_u_p X C f i P 3) x.
let X C f i P. apply pack_c_b_u_p_3_eq (pack_c_b_u_p X C f i P) X C f i P. reflexivity.
Qed.

Theorem pack_c_b_u_p_4_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_c_b_u_p X C f i P -> forall x :e X, P x = decode_p (S 4) x.
let S X C f i P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_b X f,encode_u X i,encode_p X P) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_b_u_p_4_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall x :e X, P x = decode_p (pack_c_b_u_p X C f i P 4) x.
let X C f i P. apply pack_c_b_u_p_4_eq (pack_c_b_u_p X C f i P) X C f i P. reflexivity.
Qed.

Theorem pack_c_b_u_p_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall i i':set -> set, forall P P':set -> prop, pack_c_b_u_p X C f i P = pack_c_b_u_p X' C' f' i' P' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x).
let X X' C C' f f' i i' P P'. assume H1.
claim L0: X' = pack_c_b_u_p X C f i P 0.
{ exact pack_c_b_u_p_0_eq (pack_c_b_u_p X C f i P) X' C' f' i' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_u_p_0_eq2 X C f i P. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_u_p_1_eq2 X C f i P U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_u_p_1_eq2 X' C' f' i' P' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_u_p_2_eq2 X C f i P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_u_p_2_eq2 X' C' f' i' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_b_u_p_3_eq2 X C f i P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_u_p_3_eq2 X' C' f' i' P' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_b_u_p_4_eq2 X C f i P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_u_p_4_eq2 X' C' f' i' P' x Lx.
Qed.

Theorem pack_c_b_u_p_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall i i':set -> set, forall P P':set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_b_u_p X C f i P = pack_c_b_u_p X C' f' i' P'.
let X C C' f f' i i' P P'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_c X C,encode_b X f,encode_u X i,encode_p X P) = (X,encode_c X C',encode_b X f',encode_u X i',encode_p X P').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_c_b_u_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, q (pack_c_b_u_p X C f i P)) -> q S.

Theorem pack_struct_c_b_u_p_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, struct_c_b_u_p (pack_c_b_u_p X C f i P).
let X C f. assume Hf. let i. assume Hi. let P q. assume Hq.
exact Hq X C f Hf i Hi P.
Qed.

Theorem pack_struct_c_b_u_p_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, struct_c_b_u_p (pack_c_b_u_p X C f i P) -> forall x y :e X, f x y :e X.
let X C f i P. assume H1. apply H1 (fun z => z = pack_c_b_u_p X C f i P -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'. let P'.
  assume Heq: pack_c_b_u_p X' C' f' i' P' = pack_c_b_u_p X C f i P.
  apply pack_c_b_u_p_inj X' X C' C f' f i' i P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_c_b_u_p_E3: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, struct_c_b_u_p (pack_c_b_u_p X C f i P) -> forall x :e X, i x :e X.
let X C f i P. assume H1. apply H1 (fun z => z = pack_c_b_u_p X C f i P -> forall x :e X, i x :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'. let P'.
  assume Heq: pack_c_b_u_p X' C' f' i' P' = pack_c_b_u_p X C f i P.
  apply pack_c_b_u_p_inj X' X C' C f' f i' i P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_c_b_u_p_eta: forall S, struct_c_b_u_p S -> S = pack_c_b_u_p (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_c_b_u_p (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_u (z 3)) (decode_p (z 4))).
let X. let C. let f. assume _. let i. assume _. let P.
prove pack_c_b_u_p X C f i P = pack_c_b_u_p (pack_c_b_u_p X C f i P 0) (decode_c (pack_c_b_u_p X C f i P 1)) (decode_b (pack_c_b_u_p X C f i P 2)) (decode_u (pack_c_b_u_p X C f i P 3)) (decode_p (pack_c_b_u_p X C f i P 4)).
rewrite <- pack_c_b_u_p_0_eq2 X C f i P.
apply pack_c_b_u_p_ext.
- let U. assume HU.
  rewrite <- pack_c_b_u_p_1_eq2 X C f i P U HU.
  apply iff_refl.
- exact pack_c_b_u_p_2_eq2 X C f i P.
- exact pack_c_b_u_p_3_eq2 X C f i P.
- let x. assume Hx.
  rewrite <- pack_c_b_u_p_4_eq2 X C f i P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_b_u_p_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_p (S 4)).

Theorem unpack_c_b_u_p_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' f' i' P' = Phi X C f i P)
  ->
  unpack_c_b_u_p_i (pack_c_b_u_p X C f i P) Phi = Phi X C f i P.
let Phi X C f i P.
assume HPhi.
prove Phi (pack_c_b_u_p X C f i P 0) (decode_c (pack_c_b_u_p X C f i P 1)) (decode_b (pack_c_b_u_p X C f i P 2)) (decode_u (pack_c_b_u_p X C f i P 3)) (decode_p (pack_c_b_u_p X C f i P 4)) = Phi X C f i P.
rewrite <- pack_c_b_u_p_0_eq2 X C f i P.
prove Phi X (decode_c (pack_c_b_u_p X C f i P 1)) (decode_b (pack_c_b_u_p X C f i P 2)) (decode_u (pack_c_b_u_p X C f i P 3)) (decode_p (pack_c_b_u_p X C f i P 4)) = Phi X C f i P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_u_p X C f i P 1) U.
  rewrite <- pack_c_b_u_p_1_eq2 X C f i P U HU.
  apply iff_refl.
- exact pack_c_b_u_p_2_eq2 X C f i P.
- exact pack_c_b_u_p_3_eq2 X C f i P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_b_u_p X C f i P 4) x.
  rewrite <- pack_c_b_u_p_4_eq2 X C f i P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_b_u_p_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_p (S 4)).

Theorem unpack_c_b_u_p_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' f' i' P' = Phi X C f i P)
  ->
  unpack_c_b_u_p_o (pack_c_b_u_p X C f i P) Phi = Phi X C f i P.
let Phi X C f i P.
assume HPhi.
prove Phi (pack_c_b_u_p X C f i P 0) (decode_c (pack_c_b_u_p X C f i P 1)) (decode_b (pack_c_b_u_p X C f i P 2)) (decode_u (pack_c_b_u_p X C f i P 3)) (decode_p (pack_c_b_u_p X C f i P 4)) = Phi X C f i P.
rewrite <- pack_c_b_u_p_0_eq2 X C f i P.
prove Phi X (decode_c (pack_c_b_u_p X C f i P 1)) (decode_b (pack_c_b_u_p X C f i P 2)) (decode_u (pack_c_b_u_p X C f i P 3)) (decode_p (pack_c_b_u_p X C f i P 4)) = Phi X C f i P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_u_p X C f i P 1) U.
  rewrite <- pack_c_b_u_p_1_eq2 X C f i P U HU.
  apply iff_refl.
- exact pack_c_b_u_p_2_eq2 X C f i P.
- exact pack_c_b_u_p_3_eq2 X C f i P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_b_u_p X C f i P 4) x.
  rewrite <- pack_c_b_u_p_4_eq2 X C f i P x Hx.
  apply iff_refl.
Qed.


Definition pack_c_b_u_e : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> set -> set := fun X C f i c => (X,encode_c X C,encode_b X f,encode_u X i,c).

Theorem pack_c_b_u_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, S = pack_c_b_u_e X C f i c -> X = S 0.
let S X C f i c. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_u X i,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_b_u_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, X = pack_c_b_u_e X C f i c 0.
let X C f i c. apply pack_c_b_u_e_0_eq (pack_c_b_u_e X C f i c) X C f i c. reflexivity.
Qed.

Theorem pack_c_b_u_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, S = pack_c_b_u_e X C f i c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f i c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_u X i,c) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_u_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_u_e X C f i c 1) U.
let X C f i c. apply pack_c_b_u_e_1_eq (pack_c_b_u_e X C f i c) X C f i c. reflexivity.
Qed.

Theorem pack_c_b_u_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, S = pack_c_b_u_e X C f i c -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f i c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_u X i,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_u_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall x y :e X, f x y = decode_b (pack_c_b_u_e X C f i c 2) x y.
let X C f i c. apply pack_c_b_u_e_2_eq (pack_c_b_u_e X C f i c) X C f i c. reflexivity.
Qed.

Theorem pack_c_b_u_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, S = pack_c_b_u_e X C f i c -> forall x :e X, i x = decode_u (S 3) x.
let S X C f i c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_b X f,encode_u X i,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_b_u_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall x :e X, i x = decode_u (pack_c_b_u_e X C f i c 3) x.
let X C f i c. apply pack_c_b_u_e_3_eq (pack_c_b_u_e X C f i c) X C f i c. reflexivity.
Qed.

Theorem pack_c_b_u_e_4_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, S = pack_c_b_u_e X C f i c -> c = S 4.
let S X C f i c. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_b X f,encode_u X i,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_c_b_u_e_4_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, c = pack_c_b_u_e X C f i c 4.
let X C f i c. apply pack_c_b_u_e_4_eq (pack_c_b_u_e X C f i c) X C f i c. reflexivity.
Qed.

Theorem pack_c_b_u_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall i i':set -> set, forall c c':set, pack_c_b_u_e X C f i c = pack_c_b_u_e X' C' f' i' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ c = c'.
let X X' C C' f f' i i' c c'. assume H1.
claim L0: X' = pack_c_b_u_e X C f i c 0.
{ exact pack_c_b_u_e_0_eq (pack_c_b_u_e X C f i c) X' C' f' i' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_u_e_0_eq2 X C f i c. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_u_e_1_eq2 X C f i c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_u_e_1_eq2 X' C' f' i' c' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_u_e_2_eq2 X C f i c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_u_e_2_eq2 X' C' f' i' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_b_u_e_3_eq2 X C f i c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_u_e_3_eq2 X' C' f' i' c' x Lx.
- prove c = c'.
  rewrite pack_c_b_u_e_4_eq2 X C f i c.
  rewrite H1. symmetry.
  exact pack_c_b_u_e_4_eq2 X' C' f' i' c'.
Qed.

Theorem pack_c_b_u_e_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall i i':set -> set, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 pack_c_b_u_e X C f i c = pack_c_b_u_e X C' f' i' c.
let X C C' f f' i i' c. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_b X f,encode_u X i,c) = (X,encode_c X C',encode_b X f',encode_u X i',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_c_b_u_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> q (pack_c_b_u_e X C f i c)) -> q S.

Theorem pack_struct_c_b_u_e_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> struct_c_b_u_e (pack_c_b_u_e X C f i c).
let X C f. assume Hf. let i. assume Hi. let c. assume Hc. let q. assume Hq.
exact Hq X C f Hf i Hi c Hc.
Qed.

Theorem pack_struct_c_b_u_e_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, struct_c_b_u_e (pack_c_b_u_e X C f i c) -> forall x y :e X, f x y :e X.
let X C f i c. assume H1. apply H1 (fun z => z = pack_c_b_u_e X C f i c -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_c_b_u_e X' C' f' i' c' = pack_c_b_u_e X C f i c.
  apply pack_c_b_u_e_inj X' X C' C f' f i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_c_b_u_e_E3: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, struct_c_b_u_e (pack_c_b_u_e X C f i c) -> forall x :e X, i x :e X.
let X C f i c. assume H1. apply H1 (fun z => z = pack_c_b_u_e X C f i c -> forall x :e X, i x :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_c_b_u_e X' C' f' i' c' = pack_c_b_u_e X C f i c.
  apply pack_c_b_u_e_inj X' X C' C f' f i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_c_b_u_e_E4: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set, struct_c_b_u_e (pack_c_b_u_e X C f i c) -> c :e X.
let X C f i c. assume H1. apply H1 (fun z => z = pack_c_b_u_e X C f i c -> c :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_c_b_u_e X' C' f' i' c' = pack_c_b_u_e X C f i c.
  apply pack_c_b_u_e_inj X' X C' C f' f i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_b_u_e_eta: forall S, struct_c_b_u_e S -> S = pack_c_b_u_e (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_c_b_u_e (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_u (z 3)) (z 4)).
let X. let C. let f. assume _. let i. assume _. let c. assume _.
prove pack_c_b_u_e X C f i c = pack_c_b_u_e (pack_c_b_u_e X C f i c 0) (decode_c (pack_c_b_u_e X C f i c 1)) (decode_b (pack_c_b_u_e X C f i c 2)) (decode_u (pack_c_b_u_e X C f i c 3)) (pack_c_b_u_e X C f i c 4).
rewrite <- pack_c_b_u_e_0_eq2 X C f i c.
rewrite <- pack_c_b_u_e_4_eq2 X C f i c.
apply pack_c_b_u_e_ext.
- let U. assume HU.
  rewrite <- pack_c_b_u_e_1_eq2 X C f i c U HU.
  apply iff_refl.
- exact pack_c_b_u_e_2_eq2 X C f i c.
- exact pack_c_b_u_e_3_eq2 X C f i c.
Qed.


Definition unpack_c_b_u_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (S 4).

Theorem unpack_c_b_u_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X C' f' i' c = Phi X C f i c)
  ->
  unpack_c_b_u_e_i (pack_c_b_u_e X C f i c) Phi = Phi X C f i c.
let Phi X C f i c.
assume HPhi.
prove Phi (pack_c_b_u_e X C f i c 0) (decode_c (pack_c_b_u_e X C f i c 1)) (decode_b (pack_c_b_u_e X C f i c 2)) (decode_u (pack_c_b_u_e X C f i c 3)) (pack_c_b_u_e X C f i c 4) = Phi X C f i c.
rewrite <- pack_c_b_u_e_0_eq2 X C f i c.
prove Phi X (decode_c (pack_c_b_u_e X C f i c 1)) (decode_b (pack_c_b_u_e X C f i c 2)) (decode_u (pack_c_b_u_e X C f i c 3)) (pack_c_b_u_e X C f i c 4) = Phi X C f i c.
rewrite <- pack_c_b_u_e_4_eq2 X C f i c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_u_e X C f i c 1) U.
  rewrite <- pack_c_b_u_e_1_eq2 X C f i c U HU.
  apply iff_refl.
- exact pack_c_b_u_e_2_eq2 X C f i c.
- exact pack_c_b_u_e_3_eq2 X C f i c.
Qed.


Definition unpack_c_b_u_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)) (S 4).

Theorem unpack_c_b_u_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X C' f' i' c = Phi X C f i c)
  ->
  unpack_c_b_u_e_o (pack_c_b_u_e X C f i c) Phi = Phi X C f i c.
let Phi X C f i c.
assume HPhi.
prove Phi (pack_c_b_u_e X C f i c 0) (decode_c (pack_c_b_u_e X C f i c 1)) (decode_b (pack_c_b_u_e X C f i c 2)) (decode_u (pack_c_b_u_e X C f i c 3)) (pack_c_b_u_e X C f i c 4) = Phi X C f i c.
rewrite <- pack_c_b_u_e_0_eq2 X C f i c.
prove Phi X (decode_c (pack_c_b_u_e X C f i c 1)) (decode_b (pack_c_b_u_e X C f i c 2)) (decode_u (pack_c_b_u_e X C f i c 3)) (pack_c_b_u_e X C f i c 4) = Phi X C f i c.
rewrite <- pack_c_b_u_e_4_eq2 X C f i c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_u_e X C f i c 1) U.
  rewrite <- pack_c_b_u_e_1_eq2 X C f i c U HU.
  apply iff_refl.
- exact pack_c_b_u_e_2_eq2 X C f i c.
- exact pack_c_b_u_e_3_eq2 X C f i c.
Qed.


Definition pack_c_b_r_r : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set := fun X C f R T => (X,encode_c X C,encode_b X f,encode_r X R,encode_r X T).

Theorem pack_c_b_r_r_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_c_b_r_r X C f R T -> X = S 0.
let S X C f R T. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_r X R,encode_r X T) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_b_r_r_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, X = pack_c_b_r_r X C f R T 0.
let X C f R T. apply pack_c_b_r_r_0_eq (pack_c_b_r_r X C f R T) X C f R T. reflexivity.
Qed.

Theorem pack_c_b_r_r_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_c_b_r_r X C f R T -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f R T. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_r X R,encode_r X T) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_r_r_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_r_r X C f R T 1) U.
let X C f R T. apply pack_c_b_r_r_1_eq (pack_c_b_r_r X C f R T) X C f R T. reflexivity.
Qed.

Theorem pack_c_b_r_r_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_c_b_r_r X C f R T -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_r X R,encode_r X T) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_r_r_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, f x y = decode_b (pack_c_b_r_r X C f R T 2) x y.
let X C f R T. apply pack_c_b_r_r_2_eq (pack_c_b_r_r X C f R T) X C f R T. reflexivity.
Qed.

Theorem pack_c_b_r_r_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_c_b_r_r X C f R T -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X C f R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_b X f,encode_r X R,encode_r X T) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_b_r_r_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_c_b_r_r X C f R T 3) x y.
let X C f R T. apply pack_c_b_r_r_3_eq (pack_c_b_r_r X C f R T) X C f R T. reflexivity.
Qed.

Theorem pack_c_b_r_r_4_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_c_b_r_r X C f R T -> forall x y :e X, T x y = decode_r (S 4) x y.
let S X C f R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_c X C,encode_b X f,encode_r X R,encode_r X T) 4) x y.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_c_b_r_r_4_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, T x y = decode_r (pack_c_b_r_r X C f R T 4) x y.
let X C f R T. apply pack_c_b_r_r_4_eq (pack_c_b_r_r X C f R T) X C f R T. reflexivity.
Qed.

Theorem pack_c_b_r_r_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall T T':set -> set -> prop, pack_c_b_r_r X C f R T = pack_c_b_r_r X' C' f' R' T' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y).
let X X' C C' f f' R R' T T'. assume H1.
claim L0: X' = pack_c_b_r_r X C f R T 0.
{ exact pack_c_b_r_r_0_eq (pack_c_b_r_r X C f R T) X' C' f' R' T' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_r_r_0_eq2 X C f R T. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_r_r_1_eq2 X C f R T U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_r_r_1_eq2 X' C' f' R' T' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_r_r_2_eq2 X C f R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_r_r_2_eq2 X' C' f' R' T' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_b_r_r_3_eq2 X C f R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_r_r_3_eq2 X' C' f' R' T' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_c_b_r_r_4_eq2 X C f R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_r_r_4_eq2 X' C' f' R' T' x Lx y Ly.
Qed.

Theorem pack_c_b_r_r_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall T T':set -> set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 pack_c_b_r_r X C f R T = pack_c_b_r_r X C' f' R' T'.
let X C C' f f' R R' T T'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_c X C,encode_b X f,encode_r X R,encode_r X T) = (X,encode_c X C',encode_b X f',encode_r X R',encode_r X T').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
claim L4: encode_r X T = encode_r X T'.
{ apply encode_r_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_c_b_r_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall T:set -> set -> prop, q (pack_c_b_r_r X C f R T)) -> q S.

Theorem pack_struct_c_b_r_r_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall T:set -> set -> prop, struct_c_b_r_r (pack_c_b_r_r X C f R T).
let X C f. assume Hf. let R T q. assume Hq.
exact Hq X C f Hf R T.
Qed.

Theorem pack_struct_c_b_r_r_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, struct_c_b_r_r (pack_c_b_r_r X C f R T) -> forall x y :e X, f x y :e X.
let X C f R T. assume H1. apply H1 (fun z => z = pack_c_b_r_r X C f R T -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let R'. let T'.
  assume Heq: pack_c_b_r_r X' C' f' R' T' = pack_c_b_r_r X C f R T.
  apply pack_c_b_r_r_inj X' X C' C f' f R' R T' T Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f HR'R HT'T.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_c_b_r_r_eta: forall S, struct_c_b_r_r S -> S = pack_c_b_r_r (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_r (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_c_b_r_r (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_r (z 3)) (decode_r (z 4))).
let X. let C. let f. assume _. let R. let T.
prove pack_c_b_r_r X C f R T = pack_c_b_r_r (pack_c_b_r_r X C f R T 0) (decode_c (pack_c_b_r_r X C f R T 1)) (decode_b (pack_c_b_r_r X C f R T 2)) (decode_r (pack_c_b_r_r X C f R T 3)) (decode_r (pack_c_b_r_r X C f R T 4)).
rewrite <- pack_c_b_r_r_0_eq2 X C f R T.
apply pack_c_b_r_r_ext.
- let U. assume HU.
  rewrite <- pack_c_b_r_r_1_eq2 X C f R T U HU.
  apply iff_refl.
- exact pack_c_b_r_r_2_eq2 X C f R T.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_b_r_r_3_eq2 X C f R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_b_r_r_4_eq2 X C f R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_b_r_r_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_r (S 4)).

Theorem unpack_c_b_r_r_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X C' f' R' T' = Phi X C f R T)
  ->
  unpack_c_b_r_r_i (pack_c_b_r_r X C f R T) Phi = Phi X C f R T.
let Phi X C f R T.
assume HPhi.
prove Phi (pack_c_b_r_r X C f R T 0) (decode_c (pack_c_b_r_r X C f R T 1)) (decode_b (pack_c_b_r_r X C f R T 2)) (decode_r (pack_c_b_r_r X C f R T 3)) (decode_r (pack_c_b_r_r X C f R T 4)) = Phi X C f R T.
rewrite <- pack_c_b_r_r_0_eq2 X C f R T.
prove Phi X (decode_c (pack_c_b_r_r X C f R T 1)) (decode_b (pack_c_b_r_r X C f R T 2)) (decode_r (pack_c_b_r_r X C f R T 3)) (decode_r (pack_c_b_r_r X C f R T 4)) = Phi X C f R T.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_r_r X C f R T 1) U.
  rewrite <- pack_c_b_r_r_1_eq2 X C f R T U HU.
  apply iff_refl.
- exact pack_c_b_r_r_2_eq2 X C f R T.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_b_r_r X C f R T 3) x y.
  rewrite <- pack_c_b_r_r_3_eq2 X C f R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_c_b_r_r X C f R T 4) x y.
  rewrite <- pack_c_b_r_r_4_eq2 X C f R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_b_r_r_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_r (S 4)).

Theorem unpack_c_b_r_r_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X C' f' R' T' = Phi X C f R T)
  ->
  unpack_c_b_r_r_o (pack_c_b_r_r X C f R T) Phi = Phi X C f R T.
let Phi X C f R T.
assume HPhi.
prove Phi (pack_c_b_r_r X C f R T 0) (decode_c (pack_c_b_r_r X C f R T 1)) (decode_b (pack_c_b_r_r X C f R T 2)) (decode_r (pack_c_b_r_r X C f R T 3)) (decode_r (pack_c_b_r_r X C f R T 4)) = Phi X C f R T.
rewrite <- pack_c_b_r_r_0_eq2 X C f R T.
prove Phi X (decode_c (pack_c_b_r_r X C f R T 1)) (decode_b (pack_c_b_r_r X C f R T 2)) (decode_r (pack_c_b_r_r X C f R T 3)) (decode_r (pack_c_b_r_r X C f R T 4)) = Phi X C f R T.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_r_r X C f R T 1) U.
  rewrite <- pack_c_b_r_r_1_eq2 X C f R T U HU.
  apply iff_refl.
- exact pack_c_b_r_r_2_eq2 X C f R T.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_b_r_r X C f R T 3) x y.
  rewrite <- pack_c_b_r_r_3_eq2 X C f R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_c_b_r_r X C f R T 4) x y.
  rewrite <- pack_c_b_r_r_4_eq2 X C f R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_c_b_r_p : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set := fun X C f R P => (X,encode_c X C,encode_b X f,encode_r X R,encode_p X P).

Theorem pack_c_b_r_p_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_b_r_p X C f R P -> X = S 0.
let S X C f R P. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_r X R,encode_p X P) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_b_r_p_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, X = pack_c_b_r_p X C f R P 0.
let X C f R P. apply pack_c_b_r_p_0_eq (pack_c_b_r_p X C f R P) X C f R P. reflexivity.
Qed.

Theorem pack_c_b_r_p_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_b_r_p X C f R P -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f R P. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_r X R,encode_p X P) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_r_p_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_r_p X C f R P 1) U.
let X C f R P. apply pack_c_b_r_p_1_eq (pack_c_b_r_p X C f R P) X C f R P. reflexivity.
Qed.

Theorem pack_c_b_r_p_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_b_r_p X C f R P -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_r X R,encode_p X P) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_r_p_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_c_b_r_p X C f R P 2) x y.
let X C f R P. apply pack_c_b_r_p_2_eq (pack_c_b_r_p X C f R P) X C f R P. reflexivity.
Qed.

Theorem pack_c_b_r_p_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_b_r_p X C f R P -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X C f R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_b X f,encode_r X R,encode_p X P) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_b_r_p_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, R x y = decode_r (pack_c_b_r_p X C f R P 3) x y.
let X C f R P. apply pack_c_b_r_p_3_eq (pack_c_b_r_p X C f R P) X C f R P. reflexivity.
Qed.

Theorem pack_c_b_r_p_4_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_b_r_p X C f R P -> forall x :e X, P x = decode_p (S 4) x.
let S X C f R P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_b X f,encode_r X R,encode_p X P) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_b_r_p_4_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_c_b_r_p X C f R P 4) x.
let X C f R P. apply pack_c_b_r_p_4_eq (pack_c_b_r_p X C f R P) X C f R P. reflexivity.
Qed.

Theorem pack_c_b_r_p_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, pack_c_b_r_p X C f R P = pack_c_b_r_p X' C' f' R' P' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x).
let X X' C C' f f' R R' P P'. assume H1.
claim L0: X' = pack_c_b_r_p X C f R P 0.
{ exact pack_c_b_r_p_0_eq (pack_c_b_r_p X C f R P) X' C' f' R' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_r_p_0_eq2 X C f R P. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_r_p_1_eq2 X C f R P U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_r_p_1_eq2 X' C' f' R' P' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_r_p_2_eq2 X C f R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_r_p_2_eq2 X' C' f' R' P' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_b_r_p_3_eq2 X C f R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_r_p_3_eq2 X' C' f' R' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_b_r_p_4_eq2 X C f R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_r_p_4_eq2 X' C' f' R' P' x Lx.
Qed.

Theorem pack_c_b_r_p_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall P P':set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_b_r_p X C f R P = pack_c_b_r_p X C' f' R' P'.
let X C C' f f' R R' P P'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_c X C,encode_b X f,encode_r X R,encode_p X P) = (X,encode_c X C',encode_b X f',encode_r X R',encode_p X P').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_c_b_r_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall P:set -> prop, q (pack_c_b_r_p X C f R P)) -> q S.

Theorem pack_struct_c_b_r_p_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall P:set -> prop, struct_c_b_r_p (pack_c_b_r_p X C f R P).
let X C f. assume Hf. let R P q. assume Hq.
exact Hq X C f Hf R P.
Qed.

Theorem pack_struct_c_b_r_p_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, struct_c_b_r_p (pack_c_b_r_p X C f R P) -> forall x y :e X, f x y :e X.
let X C f R P. assume H1. apply H1 (fun z => z = pack_c_b_r_p X C f R P -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let R'. let P'.
  assume Heq: pack_c_b_r_p X' C' f' R' P' = pack_c_b_r_p X C f R P.
  apply pack_c_b_r_p_inj X' X C' C f' f R' R P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f HR'R HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_c_b_r_p_eta: forall S, struct_c_b_r_p S -> S = pack_c_b_r_p (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_c_b_r_p (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_r (z 3)) (decode_p (z 4))).
let X. let C. let f. assume _. let R. let P.
prove pack_c_b_r_p X C f R P = pack_c_b_r_p (pack_c_b_r_p X C f R P 0) (decode_c (pack_c_b_r_p X C f R P 1)) (decode_b (pack_c_b_r_p X C f R P 2)) (decode_r (pack_c_b_r_p X C f R P 3)) (decode_p (pack_c_b_r_p X C f R P 4)).
rewrite <- pack_c_b_r_p_0_eq2 X C f R P.
apply pack_c_b_r_p_ext.
- let U. assume HU.
  rewrite <- pack_c_b_r_p_1_eq2 X C f R P U HU.
  apply iff_refl.
- exact pack_c_b_r_p_2_eq2 X C f R P.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_b_r_p_3_eq2 X C f R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_b_r_p_4_eq2 X C f R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_b_r_p_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_p (S 4)).

Theorem unpack_c_b_r_p_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' f' R' P' = Phi X C f R P)
  ->
  unpack_c_b_r_p_i (pack_c_b_r_p X C f R P) Phi = Phi X C f R P.
let Phi X C f R P.
assume HPhi.
prove Phi (pack_c_b_r_p X C f R P 0) (decode_c (pack_c_b_r_p X C f R P 1)) (decode_b (pack_c_b_r_p X C f R P 2)) (decode_r (pack_c_b_r_p X C f R P 3)) (decode_p (pack_c_b_r_p X C f R P 4)) = Phi X C f R P.
rewrite <- pack_c_b_r_p_0_eq2 X C f R P.
prove Phi X (decode_c (pack_c_b_r_p X C f R P 1)) (decode_b (pack_c_b_r_p X C f R P 2)) (decode_r (pack_c_b_r_p X C f R P 3)) (decode_p (pack_c_b_r_p X C f R P 4)) = Phi X C f R P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_r_p X C f R P 1) U.
  rewrite <- pack_c_b_r_p_1_eq2 X C f R P U HU.
  apply iff_refl.
- exact pack_c_b_r_p_2_eq2 X C f R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_b_r_p X C f R P 3) x y.
  rewrite <- pack_c_b_r_p_3_eq2 X C f R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_b_r_p X C f R P 4) x.
  rewrite <- pack_c_b_r_p_4_eq2 X C f R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_b_r_p_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_p (S 4)).

Theorem unpack_c_b_r_p_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' f' R' P' = Phi X C f R P)
  ->
  unpack_c_b_r_p_o (pack_c_b_r_p X C f R P) Phi = Phi X C f R P.
let Phi X C f R P.
assume HPhi.
prove Phi (pack_c_b_r_p X C f R P 0) (decode_c (pack_c_b_r_p X C f R P 1)) (decode_b (pack_c_b_r_p X C f R P 2)) (decode_r (pack_c_b_r_p X C f R P 3)) (decode_p (pack_c_b_r_p X C f R P 4)) = Phi X C f R P.
rewrite <- pack_c_b_r_p_0_eq2 X C f R P.
prove Phi X (decode_c (pack_c_b_r_p X C f R P 1)) (decode_b (pack_c_b_r_p X C f R P 2)) (decode_r (pack_c_b_r_p X C f R P 3)) (decode_p (pack_c_b_r_p X C f R P 4)) = Phi X C f R P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_r_p X C f R P 1) U.
  rewrite <- pack_c_b_r_p_1_eq2 X C f R P U HU.
  apply iff_refl.
- exact pack_c_b_r_p_2_eq2 X C f R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_b_r_p X C f R P 3) x y.
  rewrite <- pack_c_b_r_p_3_eq2 X C f R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_b_r_p X C f R P 4) x.
  rewrite <- pack_c_b_r_p_4_eq2 X C f R P x Hx.
  apply iff_refl.
Qed.


Definition pack_c_b_r_e : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set := fun X C f R c => (X,encode_c X C,encode_b X f,encode_r X R,c).

Theorem pack_c_b_r_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_c_b_r_e X C f R c -> X = S 0.
let S X C f R c. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_r X R,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_b_r_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, X = pack_c_b_r_e X C f R c 0.
let X C f R c. apply pack_c_b_r_e_0_eq (pack_c_b_r_e X C f R c) X C f R c. reflexivity.
Qed.

Theorem pack_c_b_r_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_c_b_r_e X C f R c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f R c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_r X R,c) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_r_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_r_e X C f R c 1) U.
let X C f R c. apply pack_c_b_r_e_1_eq (pack_c_b_r_e X C f R c) X C f R c. reflexivity.
Qed.

Theorem pack_c_b_r_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_c_b_r_e X C f R c -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_r X R,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_r_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, f x y = decode_b (pack_c_b_r_e X C f R c 2) x y.
let X C f R c. apply pack_c_b_r_e_2_eq (pack_c_b_r_e X C f R c) X C f R c. reflexivity.
Qed.

Theorem pack_c_b_r_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_c_b_r_e X C f R c -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X C f R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_b X f,encode_r X R,c) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_b_r_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_c_b_r_e X C f R c 3) x y.
let X C f R c. apply pack_c_b_r_e_3_eq (pack_c_b_r_e X C f R c) X C f R c. reflexivity.
Qed.

Theorem pack_c_b_r_e_4_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_c_b_r_e X C f R c -> c = S 4.
let S X C f R c. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_b X f,encode_r X R,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_c_b_r_e_4_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, c = pack_c_b_r_e X C f R c 4.
let X C f R c. apply pack_c_b_r_e_4_eq (pack_c_b_r_e X C f R c) X C f R c. reflexivity.
Qed.

Theorem pack_c_b_r_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall c c':set, pack_c_b_r_e X C f R c = pack_c_b_r_e X' C' f' R' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, R x y = R' x y) /\ c = c'.
let X X' C C' f f' R R' c c'. assume H1.
claim L0: X' = pack_c_b_r_e X C f R c 0.
{ exact pack_c_b_r_e_0_eq (pack_c_b_r_e X C f R c) X' C' f' R' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_r_e_0_eq2 X C f R c. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_r_e_1_eq2 X C f R c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_r_e_1_eq2 X' C' f' R' c' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_r_e_2_eq2 X C f R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_r_e_2_eq2 X' C' f' R' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_b_r_e_3_eq2 X C f R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_r_e_3_eq2 X' C' f' R' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_c_b_r_e_4_eq2 X C f R c.
  rewrite H1. symmetry.
  exact pack_c_b_r_e_4_eq2 X' C' f' R' c'.
Qed.

Theorem pack_c_b_r_e_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_c_b_r_e X C f R c = pack_c_b_r_e X C' f' R' c.
let X C C' f f' R R' c. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_b X f,encode_r X R,c) = (X,encode_c X C',encode_b X f',encode_r X R',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_c_b_r_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> q (pack_c_b_r_e X C f R c)) -> q S.

Theorem pack_struct_c_b_r_e_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> struct_c_b_r_e (pack_c_b_r_e X C f R c).
let X C f. assume Hf. let R c. assume Hc. let q. assume Hq.
exact Hq X C f Hf R c Hc.
Qed.

Theorem pack_struct_c_b_r_e_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, struct_c_b_r_e (pack_c_b_r_e X C f R c) -> forall x y :e X, f x y :e X.
let X C f R c. assume H1. apply H1 (fun z => z = pack_c_b_r_e X C f R c -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let R'. let c'. assume Hc'.
  assume Heq: pack_c_b_r_e X' C' f' R' c' = pack_c_b_r_e X C f R c.
  apply pack_c_b_r_e_inj X' X C' C f' f R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f HR'R Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_c_b_r_e_E4: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, struct_c_b_r_e (pack_c_b_r_e X C f R c) -> c :e X.
let X C f R c. assume H1. apply H1 (fun z => z = pack_c_b_r_e X C f R c -> c :e X).
- let X'. let C'. let f'. assume Hf'. let R'. let c'. assume Hc'.
  assume Heq: pack_c_b_r_e X' C' f' R' c' = pack_c_b_r_e X C f R c.
  apply pack_c_b_r_e_inj X' X C' C f' f R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f HR'R Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_b_r_e_eta: forall S, struct_c_b_r_e S -> S = pack_c_b_r_e (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_c_b_r_e (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_r (z 3)) (z 4)).
let X. let C. let f. assume _. let R. let c. assume _.
prove pack_c_b_r_e X C f R c = pack_c_b_r_e (pack_c_b_r_e X C f R c 0) (decode_c (pack_c_b_r_e X C f R c 1)) (decode_b (pack_c_b_r_e X C f R c 2)) (decode_r (pack_c_b_r_e X C f R c 3)) (pack_c_b_r_e X C f R c 4).
rewrite <- pack_c_b_r_e_0_eq2 X C f R c.
rewrite <- pack_c_b_r_e_4_eq2 X C f R c.
apply pack_c_b_r_e_ext.
- let U. assume HU.
  rewrite <- pack_c_b_r_e_1_eq2 X C f R c U HU.
  apply iff_refl.
- exact pack_c_b_r_e_2_eq2 X C f R c.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_b_r_e_3_eq2 X C f R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_b_r_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)) (S 4).

Theorem unpack_c_b_r_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' f' R' c = Phi X C f R c)
  ->
  unpack_c_b_r_e_i (pack_c_b_r_e X C f R c) Phi = Phi X C f R c.
let Phi X C f R c.
assume HPhi.
prove Phi (pack_c_b_r_e X C f R c 0) (decode_c (pack_c_b_r_e X C f R c 1)) (decode_b (pack_c_b_r_e X C f R c 2)) (decode_r (pack_c_b_r_e X C f R c 3)) (pack_c_b_r_e X C f R c 4) = Phi X C f R c.
rewrite <- pack_c_b_r_e_0_eq2 X C f R c.
prove Phi X (decode_c (pack_c_b_r_e X C f R c 1)) (decode_b (pack_c_b_r_e X C f R c 2)) (decode_r (pack_c_b_r_e X C f R c 3)) (pack_c_b_r_e X C f R c 4) = Phi X C f R c.
rewrite <- pack_c_b_r_e_4_eq2 X C f R c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_r_e X C f R c 1) U.
  rewrite <- pack_c_b_r_e_1_eq2 X C f R c U HU.
  apply iff_refl.
- exact pack_c_b_r_e_2_eq2 X C f R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_b_r_e X C f R c 3) x y.
  rewrite <- pack_c_b_r_e_3_eq2 X C f R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_b_r_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)) (S 4).

Theorem unpack_c_b_r_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' f' R' c = Phi X C f R c)
  ->
  unpack_c_b_r_e_o (pack_c_b_r_e X C f R c) Phi = Phi X C f R c.
let Phi X C f R c.
assume HPhi.
prove Phi (pack_c_b_r_e X C f R c 0) (decode_c (pack_c_b_r_e X C f R c 1)) (decode_b (pack_c_b_r_e X C f R c 2)) (decode_r (pack_c_b_r_e X C f R c 3)) (pack_c_b_r_e X C f R c 4) = Phi X C f R c.
rewrite <- pack_c_b_r_e_0_eq2 X C f R c.
prove Phi X (decode_c (pack_c_b_r_e X C f R c 1)) (decode_b (pack_c_b_r_e X C f R c 2)) (decode_r (pack_c_b_r_e X C f R c 3)) (pack_c_b_r_e X C f R c 4) = Phi X C f R c.
rewrite <- pack_c_b_r_e_4_eq2 X C f R c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_r_e X C f R c 1) U.
  rewrite <- pack_c_b_r_e_1_eq2 X C f R c U HU.
  apply iff_refl.
- exact pack_c_b_r_e_2_eq2 X C f R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_b_r_e X C f R c 3) x y.
  rewrite <- pack_c_b_r_e_3_eq2 X C f R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_c_b_p_p : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> (set -> prop) -> set := fun X C f P Q => (X,encode_c X C,encode_b X f,encode_p X P,encode_p X Q).

Theorem pack_c_b_p_p_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_c_b_p_p X C f P Q -> X = S 0.
let S X C f P Q. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_p X P,encode_p X Q) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_b_p_p_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, X = pack_c_b_p_p X C f P Q 0.
let X C f P Q. apply pack_c_b_p_p_0_eq (pack_c_b_p_p X C f P Q) X C f P Q. reflexivity.
Qed.

Theorem pack_c_b_p_p_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_c_b_p_p X C f P Q -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f P Q. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_p X P,encode_p X Q) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_p_p_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_p_p X C f P Q 1) U.
let X C f P Q. apply pack_c_b_p_p_1_eq (pack_c_b_p_p X C f P Q) X C f P Q. reflexivity.
Qed.

Theorem pack_c_b_p_p_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_c_b_p_p X C f P Q -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f P Q. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_p X P,encode_p X Q) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_p_p_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, forall x y :e X, f x y = decode_b (pack_c_b_p_p X C f P Q 2) x y.
let X C f P Q. apply pack_c_b_p_p_2_eq (pack_c_b_p_p X C f P Q) X C f P Q. reflexivity.
Qed.

Theorem pack_c_b_p_p_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_c_b_p_p X C f P Q -> forall x :e X, P x = decode_p (S 3) x.
let S X C f P Q. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_b X f,encode_p X P,encode_p X Q) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_b_p_p_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, P x = decode_p (pack_c_b_p_p X C f P Q 3) x.
let X C f P Q. apply pack_c_b_p_p_3_eq (pack_c_b_p_p X C f P Q) X C f P Q. reflexivity.
Qed.

Theorem pack_c_b_p_p_4_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_c_b_p_p X C f P Q -> forall x :e X, Q x = decode_p (S 4) x.
let S X C f P Q. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_c X C,encode_b X f,encode_p X P,encode_p X Q) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_c_b_p_p_4_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, Q x = decode_p (pack_c_b_p_p X C f P Q 4) x.
let X C f P Q. apply pack_c_b_p_p_4_eq (pack_c_b_p_p X C f P Q) X C f P Q. reflexivity.
Qed.

Theorem pack_c_b_p_p_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall P P':set -> prop, forall Q Q':set -> prop, pack_c_b_p_p X C f P Q = pack_c_b_p_p X' C' f' P' Q' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x).
let X X' C C' f f' P P' Q Q'. assume H1.
claim L0: X' = pack_c_b_p_p X C f P Q 0.
{ exact pack_c_b_p_p_0_eq (pack_c_b_p_p X C f P Q) X' C' f' P' Q' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_p_p_0_eq2 X C f P Q. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_p_p_1_eq2 X C f P Q U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_p_p_1_eq2 X' C' f' P' Q' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_p_p_2_eq2 X C f P Q x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_p_p_2_eq2 X' C' f' P' Q' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_b_p_p_3_eq2 X C f P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_p_p_3_eq2 X' C' f' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_c_b_p_p_4_eq2 X C f P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_p_p_4_eq2 X' C' f' P' Q' x Lx.
Qed.

Theorem pack_c_b_p_p_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall P P':set -> prop, forall Q Q':set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_c_b_p_p X C f P Q = pack_c_b_p_p X C' f' P' Q'.
let X C C' f f' P P' Q Q'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_c X C,encode_b X f,encode_p X P,encode_p X Q) = (X,encode_c X C',encode_b X f',encode_p X P',encode_p X Q').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_c_b_p_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, forall Q:set -> prop, q (pack_c_b_p_p X C f P Q)) -> q S.

Theorem pack_struct_c_b_p_p_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, forall Q:set -> prop, struct_c_b_p_p (pack_c_b_p_p X C f P Q).
let X C f. assume Hf. let P Q q. assume Hq.
exact Hq X C f Hf P Q.
Qed.

Theorem pack_struct_c_b_p_p_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, struct_c_b_p_p (pack_c_b_p_p X C f P Q) -> forall x y :e X, f x y :e X.
let X C f P Q. assume H1. apply H1 (fun z => z = pack_c_b_p_p X C f P Q -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let P'. let Q'.
  assume Heq: pack_c_b_p_p X' C' f' P' Q' = pack_c_b_p_p X C f P Q.
  apply pack_c_b_p_p_inj X' X C' C f' f P' P Q' Q Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f HP'P HQ'Q.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_c_b_p_p_eta: forall S, struct_c_b_p_p S -> S = pack_c_b_p_p (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_p (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_c_b_p_p (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_p (z 3)) (decode_p (z 4))).
let X. let C. let f. assume _. let P. let Q.
prove pack_c_b_p_p X C f P Q = pack_c_b_p_p (pack_c_b_p_p X C f P Q 0) (decode_c (pack_c_b_p_p X C f P Q 1)) (decode_b (pack_c_b_p_p X C f P Q 2)) (decode_p (pack_c_b_p_p X C f P Q 3)) (decode_p (pack_c_b_p_p X C f P Q 4)).
rewrite <- pack_c_b_p_p_0_eq2 X C f P Q.
apply pack_c_b_p_p_ext.
- let U. assume HU.
  rewrite <- pack_c_b_p_p_1_eq2 X C f P Q U HU.
  apply iff_refl.
- exact pack_c_b_p_p_2_eq2 X C f P Q.
- let x. assume Hx.
  rewrite <- pack_c_b_p_p_3_eq2 X C f P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_b_p_p_4_eq2 X C f P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_b_p_p_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_c_b_p_p_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> (set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X C' f' P' Q' = Phi X C f P Q)
  ->
  unpack_c_b_p_p_i (pack_c_b_p_p X C f P Q) Phi = Phi X C f P Q.
let Phi X C f P Q.
assume HPhi.
prove Phi (pack_c_b_p_p X C f P Q 0) (decode_c (pack_c_b_p_p X C f P Q 1)) (decode_b (pack_c_b_p_p X C f P Q 2)) (decode_p (pack_c_b_p_p X C f P Q 3)) (decode_p (pack_c_b_p_p X C f P Q 4)) = Phi X C f P Q.
rewrite <- pack_c_b_p_p_0_eq2 X C f P Q.
prove Phi X (decode_c (pack_c_b_p_p X C f P Q 1)) (decode_b (pack_c_b_p_p X C f P Q 2)) (decode_p (pack_c_b_p_p X C f P Q 3)) (decode_p (pack_c_b_p_p X C f P Q 4)) = Phi X C f P Q.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_p_p X C f P Q 1) U.
  rewrite <- pack_c_b_p_p_1_eq2 X C f P Q U HU.
  apply iff_refl.
- exact pack_c_b_p_p_2_eq2 X C f P Q.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_b_p_p X C f P Q 3) x.
  rewrite <- pack_c_b_p_p_3_eq2 X C f P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_c_b_p_p X C f P Q 4) x.
  rewrite <- pack_c_b_p_p_4_eq2 X C f P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_b_p_p_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_c_b_p_p_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> (set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall Q:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X C' f' P' Q' = Phi X C f P Q)
  ->
  unpack_c_b_p_p_o (pack_c_b_p_p X C f P Q) Phi = Phi X C f P Q.
let Phi X C f P Q.
assume HPhi.
prove Phi (pack_c_b_p_p X C f P Q 0) (decode_c (pack_c_b_p_p X C f P Q 1)) (decode_b (pack_c_b_p_p X C f P Q 2)) (decode_p (pack_c_b_p_p X C f P Q 3)) (decode_p (pack_c_b_p_p X C f P Q 4)) = Phi X C f P Q.
rewrite <- pack_c_b_p_p_0_eq2 X C f P Q.
prove Phi X (decode_c (pack_c_b_p_p X C f P Q 1)) (decode_b (pack_c_b_p_p X C f P Q 2)) (decode_p (pack_c_b_p_p X C f P Q 3)) (decode_p (pack_c_b_p_p X C f P Q 4)) = Phi X C f P Q.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_p_p X C f P Q 1) U.
  rewrite <- pack_c_b_p_p_1_eq2 X C f P Q U HU.
  apply iff_refl.
- exact pack_c_b_p_p_2_eq2 X C f P Q.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_b_p_p X C f P Q 3) x.
  rewrite <- pack_c_b_p_p_3_eq2 X C f P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_c_b_p_p X C f P Q 4) x.
  rewrite <- pack_c_b_p_p_4_eq2 X C f P Q x Hx.
  apply iff_refl.
Qed.


Definition pack_c_b_p_e : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> set -> set := fun X C f P c => (X,encode_c X C,encode_b X f,encode_p X P,c).

Theorem pack_c_b_p_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_c_b_p_e X C f P c -> X = S 0.
let S X C f P c. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_p X P,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_b_p_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, X = pack_c_b_p_e X C f P c 0.
let X C f P c. apply pack_c_b_p_e_0_eq (pack_c_b_p_e X C f P c) X C f P c. reflexivity.
Qed.

Theorem pack_c_b_p_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_c_b_p_e X C f P c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f P c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_p X P,c) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_p_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_p_e X C f P c 1) U.
let X C f P c. apply pack_c_b_p_e_1_eq (pack_c_b_p_e X C f P c) X C f P c. reflexivity.
Qed.

Theorem pack_c_b_p_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_c_b_p_e X C f P c -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_p X P,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_p_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall x y :e X, f x y = decode_b (pack_c_b_p_e X C f P c 2) x y.
let X C f P c. apply pack_c_b_p_e_2_eq (pack_c_b_p_e X C f P c) X C f P c. reflexivity.
Qed.

Theorem pack_c_b_p_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_c_b_p_e X C f P c -> forall x :e X, P x = decode_p (S 3) x.
let S X C f P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_b X f,encode_p X P,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_b_p_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_c_b_p_e X C f P c 3) x.
let X C f P c. apply pack_c_b_p_e_3_eq (pack_c_b_p_e X C f P c) X C f P c. reflexivity.
Qed.

Theorem pack_c_b_p_e_4_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_c_b_p_e X C f P c -> c = S 4.
let S X C f P c. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_b X f,encode_p X P,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_c_b_p_e_4_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, c = pack_c_b_p_e X C f P c 4.
let X C f P c. apply pack_c_b_p_e_4_eq (pack_c_b_p_e X C f P c) X C f P c. reflexivity.
Qed.

Theorem pack_c_b_p_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall P P':set -> prop, forall c c':set, pack_c_b_p_e X C f P c = pack_c_b_p_e X' C' f' P' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' C C' f f' P P' c c'. assume H1.
claim L0: X' = pack_c_b_p_e X C f P c 0.
{ exact pack_c_b_p_e_0_eq (pack_c_b_p_e X C f P c) X' C' f' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_p_e_0_eq2 X C f P c. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_p_e_1_eq2 X C f P c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_p_e_1_eq2 X' C' f' P' c' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_p_e_2_eq2 X C f P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_p_e_2_eq2 X' C' f' P' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_b_p_e_3_eq2 X C f P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_p_e_3_eq2 X' C' f' P' c' x Lx.
- prove c = c'.
  rewrite pack_c_b_p_e_4_eq2 X C f P c.
  rewrite H1. symmetry.
  exact pack_c_b_p_e_4_eq2 X' C' f' P' c'.
Qed.

Theorem pack_c_b_p_e_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall P P':set -> prop, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_b_p_e X C f P c = pack_c_b_p_e X C' f' P' c.
let X C C' f f' P P' c. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_b X f,encode_p X P,c) = (X,encode_c X C',encode_b X f',encode_p X P',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_c_b_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, forall c:set, c :e X -> q (pack_c_b_p_e X C f P c)) -> q S.

Theorem pack_struct_c_b_p_e_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, forall c:set, c :e X -> struct_c_b_p_e (pack_c_b_p_e X C f P c).
let X C f. assume Hf. let P c. assume Hc. let q. assume Hq.
exact Hq X C f Hf P c Hc.
Qed.

Theorem pack_struct_c_b_p_e_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, struct_c_b_p_e (pack_c_b_p_e X C f P c) -> forall x y :e X, f x y :e X.
let X C f P c. assume H1. apply H1 (fun z => z = pack_c_b_p_e X C f P c -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let P'. let c'. assume Hc'.
  assume Heq: pack_c_b_p_e X' C' f' P' c' = pack_c_b_p_e X C f P c.
  apply pack_c_b_p_e_inj X' X C' C f' f P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_c_b_p_e_E4: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set, struct_c_b_p_e (pack_c_b_p_e X C f P c) -> c :e X.
let X C f P c. assume H1. apply H1 (fun z => z = pack_c_b_p_e X C f P c -> c :e X).
- let X'. let C'. let f'. assume Hf'. let P'. let c'. assume Hc'.
  assume Heq: pack_c_b_p_e X' C' f' P' c' = pack_c_b_p_e X C f P c.
  apply pack_c_b_p_e_inj X' X C' C f' f P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_b_p_e_eta: forall S, struct_c_b_p_e S -> S = pack_c_b_p_e (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_p (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_c_b_p_e (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_p (z 3)) (z 4)).
let X. let C. let f. assume _. let P. let c. assume _.
prove pack_c_b_p_e X C f P c = pack_c_b_p_e (pack_c_b_p_e X C f P c 0) (decode_c (pack_c_b_p_e X C f P c 1)) (decode_b (pack_c_b_p_e X C f P c 2)) (decode_p (pack_c_b_p_e X C f P c 3)) (pack_c_b_p_e X C f P c 4).
rewrite <- pack_c_b_p_e_0_eq2 X C f P c.
rewrite <- pack_c_b_p_e_4_eq2 X C f P c.
apply pack_c_b_p_e_ext.
- let U. assume HU.
  rewrite <- pack_c_b_p_e_1_eq2 X C f P c U HU.
  apply iff_refl.
- exact pack_c_b_p_e_2_eq2 X C f P c.
- let x. assume Hx.
  rewrite <- pack_c_b_p_e_3_eq2 X C f P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_b_p_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_c_b_p_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' f' P' c = Phi X C f P c)
  ->
  unpack_c_b_p_e_i (pack_c_b_p_e X C f P c) Phi = Phi X C f P c.
let Phi X C f P c.
assume HPhi.
prove Phi (pack_c_b_p_e X C f P c 0) (decode_c (pack_c_b_p_e X C f P c 1)) (decode_b (pack_c_b_p_e X C f P c 2)) (decode_p (pack_c_b_p_e X C f P c 3)) (pack_c_b_p_e X C f P c 4) = Phi X C f P c.
rewrite <- pack_c_b_p_e_0_eq2 X C f P c.
prove Phi X (decode_c (pack_c_b_p_e X C f P c 1)) (decode_b (pack_c_b_p_e X C f P c 2)) (decode_p (pack_c_b_p_e X C f P c 3)) (pack_c_b_p_e X C f P c 4) = Phi X C f P c.
rewrite <- pack_c_b_p_e_4_eq2 X C f P c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_p_e X C f P c 1) U.
  rewrite <- pack_c_b_p_e_1_eq2 X C f P c U HU.
  apply iff_refl.
- exact pack_c_b_p_e_2_eq2 X C f P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_b_p_e X C f P c 3) x.
  rewrite <- pack_c_b_p_e_3_eq2 X C f P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_b_p_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_c_b_p_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' f' P' c = Phi X C f P c)
  ->
  unpack_c_b_p_e_o (pack_c_b_p_e X C f P c) Phi = Phi X C f P c.
let Phi X C f P c.
assume HPhi.
prove Phi (pack_c_b_p_e X C f P c 0) (decode_c (pack_c_b_p_e X C f P c 1)) (decode_b (pack_c_b_p_e X C f P c 2)) (decode_p (pack_c_b_p_e X C f P c 3)) (pack_c_b_p_e X C f P c 4) = Phi X C f P c.
rewrite <- pack_c_b_p_e_0_eq2 X C f P c.
prove Phi X (decode_c (pack_c_b_p_e X C f P c 1)) (decode_b (pack_c_b_p_e X C f P c 2)) (decode_p (pack_c_b_p_e X C f P c 3)) (pack_c_b_p_e X C f P c 4) = Phi X C f P c.
rewrite <- pack_c_b_p_e_4_eq2 X C f P c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_p_e X C f P c 1) U.
  rewrite <- pack_c_b_p_e_1_eq2 X C f P c U HU.
  apply iff_refl.
- exact pack_c_b_p_e_2_eq2 X C f P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_b_p_e X C f P c 3) x.
  rewrite <- pack_c_b_p_e_3_eq2 X C f P c x Hx.
  apply iff_refl.
Qed.


Definition pack_c_b_e_e : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set -> set -> set := fun X C f c d => (X,encode_c X C,encode_b X f,c,d).

Theorem pack_c_b_e_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, S = pack_c_b_e_e X C f c d -> X = S 0.
let S X C f c d. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_b_e_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, X = pack_c_b_e_e X C f c d 0.
let X C f c d. apply pack_c_b_e_e_0_eq (pack_c_b_e_e X C f c d) X C f c d. reflexivity.
Qed.

Theorem pack_c_b_e_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, S = pack_c_b_e_e X C f c d -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f c d. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,c,d) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_e_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_e_e X C f c d 1) U.
let X C f c d. apply pack_c_b_e_e_1_eq (pack_c_b_e_e X C f c d) X C f c d. reflexivity.
Qed.

Theorem pack_c_b_e_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, S = pack_c_b_e_e X C f c d -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,c,d) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_e_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, forall x y :e X, f x y = decode_b (pack_c_b_e_e X C f c d 2) x y.
let X C f c d. apply pack_c_b_e_e_2_eq (pack_c_b_e_e X C f c d) X C f c d. reflexivity.
Qed.

Theorem pack_c_b_e_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, S = pack_c_b_e_e X C f c d -> c = S 3.
let S X C f c d. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_b X f,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_c_b_e_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, c = pack_c_b_e_e X C f c d 3.
let X C f c d. apply pack_c_b_e_e_3_eq (pack_c_b_e_e X C f c d) X C f c d. reflexivity.
Qed.

Theorem pack_c_b_e_e_4_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, S = pack_c_b_e_e X C f c d -> d = S 4.
let S X C f c d. assume H1.
rewrite H1. prove d = (X,encode_c X C,encode_b X f,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_c_b_e_e_4_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, d = pack_c_b_e_e X C f c d 4.
let X C f c d. apply pack_c_b_e_e_4_eq (pack_c_b_e_e X C f c d) X C f c d. reflexivity.
Qed.

Theorem pack_c_b_e_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall c c':set, forall d d':set, pack_c_b_e_e X C f c d = pack_c_b_e_e X' C' f' c' d' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ c = c' /\ d = d'.
let X X' C C' f f' c c' d d'. assume H1.
claim L0: X' = pack_c_b_e_e X C f c d 0.
{ exact pack_c_b_e_e_0_eq (pack_c_b_e_e X C f c d) X' C' f' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_e_e_0_eq2 X C f c d. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_e_e_1_eq2 X C f c d U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_e_e_1_eq2 X' C' f' c' d' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_e_e_2_eq2 X C f c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_e_e_2_eq2 X' C' f' c' d' x Lx y Ly.
- prove c = c'.
  rewrite pack_c_b_e_e_3_eq2 X C f c d.
  rewrite H1. symmetry.
  exact pack_c_b_e_e_3_eq2 X' C' f' c' d'.
- prove d = d'.
  rewrite pack_c_b_e_e_4_eq2 X C f c d.
  rewrite H1. symmetry.
  exact pack_c_b_e_e_4_eq2 X' C' f' c' d'.
Qed.

Theorem pack_c_b_e_e_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall c, forall d,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 pack_c_b_e_e X C f c d = pack_c_b_e_e X C' f' c d.
let X C C' f f' c d. assume H1. assume H2.
prove (X,encode_c X C,encode_b X f,c,d) = (X,encode_c X C',encode_b X f',c,d).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_b_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall c:set, c :e X -> forall d:set, d :e X -> q (pack_c_b_e_e X C f c d)) -> q S.

Theorem pack_struct_c_b_e_e_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall c:set, c :e X -> forall d:set, d :e X -> struct_c_b_e_e (pack_c_b_e_e X C f c d).
let X C f. assume Hf. let c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X C f Hf c Hc d Hd.
Qed.

Theorem pack_struct_c_b_e_e_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, struct_c_b_e_e (pack_c_b_e_e X C f c d) -> forall x y :e X, f x y :e X.
let X C f c d. assume H1. apply H1 (fun z => z = pack_c_b_e_e X C f c d -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_c_b_e_e X' C' f' c' d' = pack_c_b_e_e X C f c d.
  apply pack_c_b_e_e_inj X' X C' C f' f c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_c_b_e_e_E3: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, struct_c_b_e_e (pack_c_b_e_e X C f c d) -> c :e X.
let X C f c d. assume H1. apply H1 (fun z => z = pack_c_b_e_e X C f c d -> c :e X).
- let X'. let C'. let f'. assume Hf'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_c_b_e_e X' C' f' c' d' = pack_c_b_e_e X C f c d.
  apply pack_c_b_e_e_inj X' X C' C f' f c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_c_b_e_e_E4: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set, struct_c_b_e_e (pack_c_b_e_e X C f c d) -> d :e X.
let X C f c d. assume H1. apply H1 (fun z => z = pack_c_b_e_e X C f c d -> d :e X).
- let X'. let C'. let f'. assume Hf'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_c_b_e_e X' C' f' c' d' = pack_c_b_e_e X C f c d.
  apply pack_c_b_e_e_inj X' X C' C f' f c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_c_b_e_e_eta: forall S, struct_c_b_e_e S -> S = pack_c_b_e_e (S 0) (decode_c (S 1)) (decode_b (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_c_b_e_e (z 0) (decode_c (z 1)) (decode_b (z 2)) (z 3) (z 4)).
let X. let C. let f. assume _. let c. assume _. let d. assume _.
prove pack_c_b_e_e X C f c d = pack_c_b_e_e (pack_c_b_e_e X C f c d 0) (decode_c (pack_c_b_e_e X C f c d 1)) (decode_b (pack_c_b_e_e X C f c d 2)) (pack_c_b_e_e X C f c d 3) (pack_c_b_e_e X C f c d 4).
rewrite <- pack_c_b_e_e_0_eq2 X C f c d.
rewrite <- pack_c_b_e_e_3_eq2 X C f c d.
rewrite <- pack_c_b_e_e_4_eq2 X C f c d.
apply pack_c_b_e_e_ext.
- let U. assume HU.
  rewrite <- pack_c_b_e_e_1_eq2 X C f c d U HU.
  apply iff_refl.
- exact pack_c_b_e_e_2_eq2 X C f c d.
Qed.


Definition unpack_c_b_e_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (S 3) (S 4).

Theorem unpack_c_b_e_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) -> Phi X C' f' c d = Phi X C f c d)
  ->
  unpack_c_b_e_e_i (pack_c_b_e_e X C f c d) Phi = Phi X C f c d.
let Phi X C f c d.
assume HPhi.
prove Phi (pack_c_b_e_e X C f c d 0) (decode_c (pack_c_b_e_e X C f c d 1)) (decode_b (pack_c_b_e_e X C f c d 2)) (pack_c_b_e_e X C f c d 3) (pack_c_b_e_e X C f c d 4) = Phi X C f c d.
rewrite <- pack_c_b_e_e_0_eq2 X C f c d.
prove Phi X (decode_c (pack_c_b_e_e X C f c d 1)) (decode_b (pack_c_b_e_e X C f c d 2)) (pack_c_b_e_e X C f c d 3) (pack_c_b_e_e X C f c d 4) = Phi X C f c d.
rewrite <- pack_c_b_e_e_3_eq2 X C f c d.
rewrite <- pack_c_b_e_e_4_eq2 X C f c d.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_e_e X C f c d 1) U.
  rewrite <- pack_c_b_e_e_1_eq2 X C f c d U HU.
  apply iff_refl.
- exact pack_c_b_e_e_2_eq2 X C f c d.
Qed.


Definition unpack_c_b_e_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (S 3) (S 4).

Theorem unpack_c_b_e_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall d:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) -> Phi X C' f' c d = Phi X C f c d)
  ->
  unpack_c_b_e_e_o (pack_c_b_e_e X C f c d) Phi = Phi X C f c d.
let Phi X C f c d.
assume HPhi.
prove Phi (pack_c_b_e_e X C f c d 0) (decode_c (pack_c_b_e_e X C f c d 1)) (decode_b (pack_c_b_e_e X C f c d 2)) (pack_c_b_e_e X C f c d 3) (pack_c_b_e_e X C f c d 4) = Phi X C f c d.
rewrite <- pack_c_b_e_e_0_eq2 X C f c d.
prove Phi X (decode_c (pack_c_b_e_e X C f c d 1)) (decode_b (pack_c_b_e_e X C f c d 2)) (pack_c_b_e_e X C f c d 3) (pack_c_b_e_e X C f c d 4) = Phi X C f c d.
rewrite <- pack_c_b_e_e_3_eq2 X C f c d.
rewrite <- pack_c_b_e_e_4_eq2 X C f c d.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_e_e X C f c d 1) U.
  rewrite <- pack_c_b_e_e_1_eq2 X C f c d U HU.
  apply iff_refl.
- exact pack_c_b_e_e_2_eq2 X C f c d.
Qed.


Definition pack_c_u_r_r : set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set := fun X C i R T => (X,encode_c X C,encode_u X i,encode_r X R,encode_r X T).

Theorem pack_c_u_r_r_0_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_c_u_r_r X C i R T -> X = S 0.
let S X C i R T. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_u X i,encode_r X R,encode_r X T) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_u_r_r_0_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, X = pack_c_u_r_r X C i R T 0.
let X C i R T. apply pack_c_u_r_r_0_eq (pack_c_u_r_r X C i R T) X C i R T. reflexivity.
Qed.

Theorem pack_c_u_r_r_1_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_c_u_r_r X C i R T -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C i R T. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_u X i,encode_r X R,encode_r X T) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_u_r_r_1_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_u_r_r X C i R T 1) U.
let X C i R T. apply pack_c_u_r_r_1_eq (pack_c_u_r_r X C i R T) X C i R T. reflexivity.
Qed.

Theorem pack_c_u_r_r_2_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_c_u_r_r X C i R T -> forall x :e X, i x = decode_u (S 2) x.
let S X C i R T. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_u X i,encode_r X R,encode_r X T) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_u_r_r_2_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x :e X, i x = decode_u (pack_c_u_r_r X C i R T 2) x.
let X C i R T. apply pack_c_u_r_r_2_eq (pack_c_u_r_r X C i R T) X C i R T. reflexivity.
Qed.

Theorem pack_c_u_r_r_3_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_c_u_r_r X C i R T -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X C i R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_u X i,encode_r X R,encode_r X T) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_u_r_r_3_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_c_u_r_r X C i R T 3) x y.
let X C i R T. apply pack_c_u_r_r_3_eq (pack_c_u_r_r X C i R T) X C i R T. reflexivity.
Qed.

Theorem pack_c_u_r_r_4_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_c_u_r_r X C i R T -> forall x y :e X, T x y = decode_r (S 4) x y.
let S X C i R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_c X C,encode_u X i,encode_r X R,encode_r X T) 4) x y.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_c_u_r_r_4_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, T x y = decode_r (pack_c_u_r_r X C i R T 4) x y.
let X C i R T. apply pack_c_u_r_r_4_eq (pack_c_u_r_r X C i R T) X C i R T. reflexivity.
Qed.

Theorem pack_c_u_r_r_inj : forall X X', forall C C':(set -> prop) -> prop, forall i i':set -> set, forall R R':set -> set -> prop, forall T T':set -> set -> prop, pack_c_u_r_r X C i R T = pack_c_u_r_r X' C' i' R' T' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y).
let X X' C C' i i' R R' T T'. assume H1.
claim L0: X' = pack_c_u_r_r X C i R T 0.
{ exact pack_c_u_r_r_0_eq (pack_c_u_r_r X C i R T) X' C' i' R' T' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_u_r_r_0_eq2 X C i R T. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_u_r_r_1_eq2 X C i R T U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_u_r_r_1_eq2 X' C' i' R' T' U LU.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_u_r_r_2_eq2 X C i R T x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_r_r_2_eq2 X' C' i' R' T' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_u_r_r_3_eq2 X C i R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_u_r_r_3_eq2 X' C' i' R' T' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_c_u_r_r_4_eq2 X C i R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_u_r_r_4_eq2 X' C' i' R' T' x Lx y Ly.
Qed.

Theorem pack_c_u_r_r_ext : forall X, forall C C':(set -> prop) -> prop, forall i i':set -> set, forall R R':set -> set -> prop, forall T T':set -> set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 pack_c_u_r_r X C i R T = pack_c_u_r_r X C' i' R' T'.
let X C C' i i' R R' T T'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_c X C,encode_u X i,encode_r X R,encode_r X T) = (X,encode_c X C',encode_u X i',encode_r X R',encode_r X T').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
claim L4: encode_r X T = encode_r X T'.
{ apply encode_r_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_c_u_r_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall T:set -> set -> prop, q (pack_c_u_r_r X C i R T)) -> q S.

Theorem pack_struct_c_u_r_r_I: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall T:set -> set -> prop, struct_c_u_r_r (pack_c_u_r_r X C i R T).
let X C i. assume Hi. let R T q. assume Hq.
exact Hq X C i Hi R T.
Qed.

Theorem pack_struct_c_u_r_r_E2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, struct_c_u_r_r (pack_c_u_r_r X C i R T) -> forall x :e X, i x :e X.
let X C i R T. assume H1. apply H1 (fun z => z = pack_c_u_r_r X C i R T -> forall x :e X, i x :e X).
- let X'. let C'. let i'. assume Hi'. let R'. let T'.
  assume Heq: pack_c_u_r_r X' C' i' R' T' = pack_c_u_r_r X C i R T.
  apply pack_c_u_r_r_inj X' X C' C i' i R' R T' T Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i HR'R HT'T.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_c_u_r_r_eta: forall S, struct_c_u_r_r S -> S = pack_c_u_r_r (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_r (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_c_u_r_r (z 0) (decode_c (z 1)) (decode_u (z 2)) (decode_r (z 3)) (decode_r (z 4))).
let X. let C. let i. assume _. let R. let T.
prove pack_c_u_r_r X C i R T = pack_c_u_r_r (pack_c_u_r_r X C i R T 0) (decode_c (pack_c_u_r_r X C i R T 1)) (decode_u (pack_c_u_r_r X C i R T 2)) (decode_r (pack_c_u_r_r X C i R T 3)) (decode_r (pack_c_u_r_r X C i R T 4)).
rewrite <- pack_c_u_r_r_0_eq2 X C i R T.
apply pack_c_u_r_r_ext.
- let U. assume HU.
  rewrite <- pack_c_u_r_r_1_eq2 X C i R T U HU.
  apply iff_refl.
- exact pack_c_u_r_r_2_eq2 X C i R T.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_u_r_r_3_eq2 X C i R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_u_r_r_4_eq2 X C i R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_u_r_r_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_r (S 4)).

Theorem unpack_c_u_r_r_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X C' i' R' T' = Phi X C i R T)
  ->
  unpack_c_u_r_r_i (pack_c_u_r_r X C i R T) Phi = Phi X C i R T.
let Phi X C i R T.
assume HPhi.
prove Phi (pack_c_u_r_r X C i R T 0) (decode_c (pack_c_u_r_r X C i R T 1)) (decode_u (pack_c_u_r_r X C i R T 2)) (decode_r (pack_c_u_r_r X C i R T 3)) (decode_r (pack_c_u_r_r X C i R T 4)) = Phi X C i R T.
rewrite <- pack_c_u_r_r_0_eq2 X C i R T.
prove Phi X (decode_c (pack_c_u_r_r X C i R T 1)) (decode_u (pack_c_u_r_r X C i R T 2)) (decode_r (pack_c_u_r_r X C i R T 3)) (decode_r (pack_c_u_r_r X C i R T 4)) = Phi X C i R T.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_r_r X C i R T 1) U.
  rewrite <- pack_c_u_r_r_1_eq2 X C i R T U HU.
  apply iff_refl.
- exact pack_c_u_r_r_2_eq2 X C i R T.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_u_r_r X C i R T 3) x y.
  rewrite <- pack_c_u_r_r_3_eq2 X C i R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_c_u_r_r X C i R T 4) x y.
  rewrite <- pack_c_u_r_r_4_eq2 X C i R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_u_r_r_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_r (S 4)).

Theorem unpack_c_u_r_r_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X C' i' R' T' = Phi X C i R T)
  ->
  unpack_c_u_r_r_o (pack_c_u_r_r X C i R T) Phi = Phi X C i R T.
let Phi X C i R T.
assume HPhi.
prove Phi (pack_c_u_r_r X C i R T 0) (decode_c (pack_c_u_r_r X C i R T 1)) (decode_u (pack_c_u_r_r X C i R T 2)) (decode_r (pack_c_u_r_r X C i R T 3)) (decode_r (pack_c_u_r_r X C i R T 4)) = Phi X C i R T.
rewrite <- pack_c_u_r_r_0_eq2 X C i R T.
prove Phi X (decode_c (pack_c_u_r_r X C i R T 1)) (decode_u (pack_c_u_r_r X C i R T 2)) (decode_r (pack_c_u_r_r X C i R T 3)) (decode_r (pack_c_u_r_r X C i R T 4)) = Phi X C i R T.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_r_r X C i R T 1) U.
  rewrite <- pack_c_u_r_r_1_eq2 X C i R T U HU.
  apply iff_refl.
- exact pack_c_u_r_r_2_eq2 X C i R T.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_u_r_r X C i R T 3) x y.
  rewrite <- pack_c_u_r_r_3_eq2 X C i R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_c_u_r_r X C i R T 4) x y.
  rewrite <- pack_c_u_r_r_4_eq2 X C i R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_c_u_r_p : set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set := fun X C i R P => (X,encode_c X C,encode_u X i,encode_r X R,encode_p X P).

Theorem pack_c_u_r_p_0_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_u_r_p X C i R P -> X = S 0.
let S X C i R P. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_u X i,encode_r X R,encode_p X P) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_u_r_p_0_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, X = pack_c_u_r_p X C i R P 0.
let X C i R P. apply pack_c_u_r_p_0_eq (pack_c_u_r_p X C i R P) X C i R P. reflexivity.
Qed.

Theorem pack_c_u_r_p_1_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_u_r_p X C i R P -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C i R P. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_u X i,encode_r X R,encode_p X P) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_u_r_p_1_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_u_r_p X C i R P 1) U.
let X C i R P. apply pack_c_u_r_p_1_eq (pack_c_u_r_p X C i R P) X C i R P. reflexivity.
Qed.

Theorem pack_c_u_r_p_2_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_u_r_p X C i R P -> forall x :e X, i x = decode_u (S 2) x.
let S X C i R P. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_u X i,encode_r X R,encode_p X P) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_u_r_p_2_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, i x = decode_u (pack_c_u_r_p X C i R P 2) x.
let X C i R P. apply pack_c_u_r_p_2_eq (pack_c_u_r_p X C i R P) X C i R P. reflexivity.
Qed.

Theorem pack_c_u_r_p_3_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_u_r_p X C i R P -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X C i R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_u X i,encode_r X R,encode_p X P) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_u_r_p_3_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, R x y = decode_r (pack_c_u_r_p X C i R P 3) x y.
let X C i R P. apply pack_c_u_r_p_3_eq (pack_c_u_r_p X C i R P) X C i R P. reflexivity.
Qed.

Theorem pack_c_u_r_p_4_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_u_r_p X C i R P -> forall x :e X, P x = decode_p (S 4) x.
let S X C i R P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_u X i,encode_r X R,encode_p X P) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_u_r_p_4_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_c_u_r_p X C i R P 4) x.
let X C i R P. apply pack_c_u_r_p_4_eq (pack_c_u_r_p X C i R P) X C i R P. reflexivity.
Qed.

Theorem pack_c_u_r_p_inj : forall X X', forall C C':(set -> prop) -> prop, forall i i':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, pack_c_u_r_p X C i R P = pack_c_u_r_p X' C' i' R' P' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x).
let X X' C C' i i' R R' P P'. assume H1.
claim L0: X' = pack_c_u_r_p X C i R P 0.
{ exact pack_c_u_r_p_0_eq (pack_c_u_r_p X C i R P) X' C' i' R' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_u_r_p_0_eq2 X C i R P. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_u_r_p_1_eq2 X C i R P U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_u_r_p_1_eq2 X' C' i' R' P' U LU.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_u_r_p_2_eq2 X C i R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_r_p_2_eq2 X' C' i' R' P' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_u_r_p_3_eq2 X C i R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_u_r_p_3_eq2 X' C' i' R' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_u_r_p_4_eq2 X C i R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_r_p_4_eq2 X' C' i' R' P' x Lx.
Qed.

Theorem pack_c_u_r_p_ext : forall X, forall C C':(set -> prop) -> prop, forall i i':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_u_r_p X C i R P = pack_c_u_r_p X C' i' R' P'.
let X C C' i i' R R' P P'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_c X C,encode_u X i,encode_r X R,encode_p X P) = (X,encode_c X C',encode_u X i',encode_r X R',encode_p X P').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_c_u_r_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, q (pack_c_u_r_p X C i R P)) -> q S.

Theorem pack_struct_c_u_r_p_I: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, struct_c_u_r_p (pack_c_u_r_p X C i R P).
let X C i. assume Hi. let R P q. assume Hq.
exact Hq X C i Hi R P.
Qed.

Theorem pack_struct_c_u_r_p_E2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, struct_c_u_r_p (pack_c_u_r_p X C i R P) -> forall x :e X, i x :e X.
let X C i R P. assume H1. apply H1 (fun z => z = pack_c_u_r_p X C i R P -> forall x :e X, i x :e X).
- let X'. let C'. let i'. assume Hi'. let R'. let P'.
  assume Heq: pack_c_u_r_p X' C' i' R' P' = pack_c_u_r_p X C i R P.
  apply pack_c_u_r_p_inj X' X C' C i' i R' R P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i HR'R HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_c_u_r_p_eta: forall S, struct_c_u_r_p S -> S = pack_c_u_r_p (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_c_u_r_p (z 0) (decode_c (z 1)) (decode_u (z 2)) (decode_r (z 3)) (decode_p (z 4))).
let X. let C. let i. assume _. let R. let P.
prove pack_c_u_r_p X C i R P = pack_c_u_r_p (pack_c_u_r_p X C i R P 0) (decode_c (pack_c_u_r_p X C i R P 1)) (decode_u (pack_c_u_r_p X C i R P 2)) (decode_r (pack_c_u_r_p X C i R P 3)) (decode_p (pack_c_u_r_p X C i R P 4)).
rewrite <- pack_c_u_r_p_0_eq2 X C i R P.
apply pack_c_u_r_p_ext.
- let U. assume HU.
  rewrite <- pack_c_u_r_p_1_eq2 X C i R P U HU.
  apply iff_refl.
- exact pack_c_u_r_p_2_eq2 X C i R P.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_u_r_p_3_eq2 X C i R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_u_r_p_4_eq2 X C i R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_u_r_p_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_p (S 4)).

Theorem unpack_c_u_r_p_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' i' R' P' = Phi X C i R P)
  ->
  unpack_c_u_r_p_i (pack_c_u_r_p X C i R P) Phi = Phi X C i R P.
let Phi X C i R P.
assume HPhi.
prove Phi (pack_c_u_r_p X C i R P 0) (decode_c (pack_c_u_r_p X C i R P 1)) (decode_u (pack_c_u_r_p X C i R P 2)) (decode_r (pack_c_u_r_p X C i R P 3)) (decode_p (pack_c_u_r_p X C i R P 4)) = Phi X C i R P.
rewrite <- pack_c_u_r_p_0_eq2 X C i R P.
prove Phi X (decode_c (pack_c_u_r_p X C i R P 1)) (decode_u (pack_c_u_r_p X C i R P 2)) (decode_r (pack_c_u_r_p X C i R P 3)) (decode_p (pack_c_u_r_p X C i R P 4)) = Phi X C i R P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_r_p X C i R P 1) U.
  rewrite <- pack_c_u_r_p_1_eq2 X C i R P U HU.
  apply iff_refl.
- exact pack_c_u_r_p_2_eq2 X C i R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_u_r_p X C i R P 3) x y.
  rewrite <- pack_c_u_r_p_3_eq2 X C i R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_u_r_p X C i R P 4) x.
  rewrite <- pack_c_u_r_p_4_eq2 X C i R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_u_r_p_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_p (S 4)).

Theorem unpack_c_u_r_p_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' i' R' P' = Phi X C i R P)
  ->
  unpack_c_u_r_p_o (pack_c_u_r_p X C i R P) Phi = Phi X C i R P.
let Phi X C i R P.
assume HPhi.
prove Phi (pack_c_u_r_p X C i R P 0) (decode_c (pack_c_u_r_p X C i R P 1)) (decode_u (pack_c_u_r_p X C i R P 2)) (decode_r (pack_c_u_r_p X C i R P 3)) (decode_p (pack_c_u_r_p X C i R P 4)) = Phi X C i R P.
rewrite <- pack_c_u_r_p_0_eq2 X C i R P.
prove Phi X (decode_c (pack_c_u_r_p X C i R P 1)) (decode_u (pack_c_u_r_p X C i R P 2)) (decode_r (pack_c_u_r_p X C i R P 3)) (decode_p (pack_c_u_r_p X C i R P 4)) = Phi X C i R P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_r_p X C i R P 1) U.
  rewrite <- pack_c_u_r_p_1_eq2 X C i R P U HU.
  apply iff_refl.
- exact pack_c_u_r_p_2_eq2 X C i R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_u_r_p X C i R P 3) x y.
  rewrite <- pack_c_u_r_p_3_eq2 X C i R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_u_r_p X C i R P 4) x.
  rewrite <- pack_c_u_r_p_4_eq2 X C i R P x Hx.
  apply iff_refl.
Qed.


Definition pack_c_u_r_e : set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> set -> set := fun X C i R c => (X,encode_c X C,encode_u X i,encode_r X R,c).

Theorem pack_c_u_r_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_c_u_r_e X C i R c -> X = S 0.
let S X C i R c. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_u X i,encode_r X R,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_u_r_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, X = pack_c_u_r_e X C i R c 0.
let X C i R c. apply pack_c_u_r_e_0_eq (pack_c_u_r_e X C i R c) X C i R c. reflexivity.
Qed.

Theorem pack_c_u_r_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_c_u_r_e X C i R c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C i R c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_u X i,encode_r X R,c) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_u_r_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_u_r_e X C i R c 1) U.
let X C i R c. apply pack_c_u_r_e_1_eq (pack_c_u_r_e X C i R c) X C i R c. reflexivity.
Qed.

Theorem pack_c_u_r_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_c_u_r_e X C i R c -> forall x :e X, i x = decode_u (S 2) x.
let S X C i R c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_u X i,encode_r X R,c) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_u_r_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall x :e X, i x = decode_u (pack_c_u_r_e X C i R c 2) x.
let X C i R c. apply pack_c_u_r_e_2_eq (pack_c_u_r_e X C i R c) X C i R c. reflexivity.
Qed.

Theorem pack_c_u_r_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_c_u_r_e X C i R c -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X C i R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_u X i,encode_r X R,c) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_u_r_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_c_u_r_e X C i R c 3) x y.
let X C i R c. apply pack_c_u_r_e_3_eq (pack_c_u_r_e X C i R c) X C i R c. reflexivity.
Qed.

Theorem pack_c_u_r_e_4_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_c_u_r_e X C i R c -> c = S 4.
let S X C i R c. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_u X i,encode_r X R,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_c_u_r_e_4_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, c = pack_c_u_r_e X C i R c 4.
let X C i R c. apply pack_c_u_r_e_4_eq (pack_c_u_r_e X C i R c) X C i R c. reflexivity.
Qed.

Theorem pack_c_u_r_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall i i':set -> set, forall R R':set -> set -> prop, forall c c':set, pack_c_u_r_e X C i R c = pack_c_u_r_e X' C' i' R' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ c = c'.
let X X' C C' i i' R R' c c'. assume H1.
claim L0: X' = pack_c_u_r_e X C i R c 0.
{ exact pack_c_u_r_e_0_eq (pack_c_u_r_e X C i R c) X' C' i' R' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_u_r_e_0_eq2 X C i R c. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_u_r_e_1_eq2 X C i R c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_u_r_e_1_eq2 X' C' i' R' c' U LU.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_u_r_e_2_eq2 X C i R c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_r_e_2_eq2 X' C' i' R' c' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_u_r_e_3_eq2 X C i R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_u_r_e_3_eq2 X' C' i' R' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_c_u_r_e_4_eq2 X C i R c.
  rewrite H1. symmetry.
  exact pack_c_u_r_e_4_eq2 X' C' i' R' c'.
Qed.

Theorem pack_c_u_r_e_ext : forall X, forall C C':(set -> prop) -> prop, forall i i':set -> set, forall R R':set -> set -> prop, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_c_u_r_e X C i R c = pack_c_u_r_e X C' i' R' c.
let X C C' i i' R R' c. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_u X i,encode_r X R,c) = (X,encode_c X C',encode_u X i',encode_r X R',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_c_u_r_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> q (pack_c_u_r_e X C i R c)) -> q S.

Theorem pack_struct_c_u_r_e_I: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> struct_c_u_r_e (pack_c_u_r_e X C i R c).
let X C i. assume Hi. let R c. assume Hc. let q. assume Hq.
exact Hq X C i Hi R c Hc.
Qed.

Theorem pack_struct_c_u_r_e_E2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, struct_c_u_r_e (pack_c_u_r_e X C i R c) -> forall x :e X, i x :e X.
let X C i R c. assume H1. apply H1 (fun z => z = pack_c_u_r_e X C i R c -> forall x :e X, i x :e X).
- let X'. let C'. let i'. assume Hi'. let R'. let c'. assume Hc'.
  assume Heq: pack_c_u_r_e X' C' i' R' c' = pack_c_u_r_e X C i R c.
  apply pack_c_u_r_e_inj X' X C' C i' i R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i HR'R Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_c_u_r_e_E4: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set, struct_c_u_r_e (pack_c_u_r_e X C i R c) -> c :e X.
let X C i R c. assume H1. apply H1 (fun z => z = pack_c_u_r_e X C i R c -> c :e X).
- let X'. let C'. let i'. assume Hi'. let R'. let c'. assume Hc'.
  assume Heq: pack_c_u_r_e X' C' i' R' c' = pack_c_u_r_e X C i R c.
  apply pack_c_u_r_e_inj X' X C' C i' i R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i HR'R Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_u_r_e_eta: forall S, struct_c_u_r_e S -> S = pack_c_u_r_e (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_c_u_r_e (z 0) (decode_c (z 1)) (decode_u (z 2)) (decode_r (z 3)) (z 4)).
let X. let C. let i. assume _. let R. let c. assume _.
prove pack_c_u_r_e X C i R c = pack_c_u_r_e (pack_c_u_r_e X C i R c 0) (decode_c (pack_c_u_r_e X C i R c 1)) (decode_u (pack_c_u_r_e X C i R c 2)) (decode_r (pack_c_u_r_e X C i R c 3)) (pack_c_u_r_e X C i R c 4).
rewrite <- pack_c_u_r_e_0_eq2 X C i R c.
rewrite <- pack_c_u_r_e_4_eq2 X C i R c.
apply pack_c_u_r_e_ext.
- let U. assume HU.
  rewrite <- pack_c_u_r_e_1_eq2 X C i R c U HU.
  apply iff_refl.
- exact pack_c_u_r_e_2_eq2 X C i R c.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_u_r_e_3_eq2 X C i R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_u_r_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)) (S 4).

Theorem unpack_c_u_r_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' i' R' c = Phi X C i R c)
  ->
  unpack_c_u_r_e_i (pack_c_u_r_e X C i R c) Phi = Phi X C i R c.
let Phi X C i R c.
assume HPhi.
prove Phi (pack_c_u_r_e X C i R c 0) (decode_c (pack_c_u_r_e X C i R c 1)) (decode_u (pack_c_u_r_e X C i R c 2)) (decode_r (pack_c_u_r_e X C i R c 3)) (pack_c_u_r_e X C i R c 4) = Phi X C i R c.
rewrite <- pack_c_u_r_e_0_eq2 X C i R c.
prove Phi X (decode_c (pack_c_u_r_e X C i R c 1)) (decode_u (pack_c_u_r_e X C i R c 2)) (decode_r (pack_c_u_r_e X C i R c 3)) (pack_c_u_r_e X C i R c 4) = Phi X C i R c.
rewrite <- pack_c_u_r_e_4_eq2 X C i R c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_r_e X C i R c 1) U.
  rewrite <- pack_c_u_r_e_1_eq2 X C i R c U HU.
  apply iff_refl.
- exact pack_c_u_r_e_2_eq2 X C i R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_u_r_e X C i R c 3) x y.
  rewrite <- pack_c_u_r_e_3_eq2 X C i R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_u_r_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)) (S 4).

Theorem unpack_c_u_r_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' i' R' c = Phi X C i R c)
  ->
  unpack_c_u_r_e_o (pack_c_u_r_e X C i R c) Phi = Phi X C i R c.
let Phi X C i R c.
assume HPhi.
prove Phi (pack_c_u_r_e X C i R c 0) (decode_c (pack_c_u_r_e X C i R c 1)) (decode_u (pack_c_u_r_e X C i R c 2)) (decode_r (pack_c_u_r_e X C i R c 3)) (pack_c_u_r_e X C i R c 4) = Phi X C i R c.
rewrite <- pack_c_u_r_e_0_eq2 X C i R c.
prove Phi X (decode_c (pack_c_u_r_e X C i R c 1)) (decode_u (pack_c_u_r_e X C i R c 2)) (decode_r (pack_c_u_r_e X C i R c 3)) (pack_c_u_r_e X C i R c 4) = Phi X C i R c.
rewrite <- pack_c_u_r_e_4_eq2 X C i R c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_r_e X C i R c 1) U.
  rewrite <- pack_c_u_r_e_1_eq2 X C i R c U HU.
  apply iff_refl.
- exact pack_c_u_r_e_2_eq2 X C i R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_u_r_e X C i R c 3) x y.
  rewrite <- pack_c_u_r_e_3_eq2 X C i R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_c_u_p_p : set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> (set -> prop) -> set := fun X C i P Q => (X,encode_c X C,encode_u X i,encode_p X P,encode_p X Q).

Theorem pack_c_u_p_p_0_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_c_u_p_p X C i P Q -> X = S 0.
let S X C i P Q. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_u X i,encode_p X P,encode_p X Q) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_u_p_p_0_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, X = pack_c_u_p_p X C i P Q 0.
let X C i P Q. apply pack_c_u_p_p_0_eq (pack_c_u_p_p X C i P Q) X C i P Q. reflexivity.
Qed.

Theorem pack_c_u_p_p_1_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_c_u_p_p X C i P Q -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C i P Q. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_u X i,encode_p X P,encode_p X Q) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_u_p_p_1_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_u_p_p X C i P Q 1) U.
let X C i P Q. apply pack_c_u_p_p_1_eq (pack_c_u_p_p X C i P Q) X C i P Q. reflexivity.
Qed.

Theorem pack_c_u_p_p_2_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_c_u_p_p X C i P Q -> forall x :e X, i x = decode_u (S 2) x.
let S X C i P Q. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_u X i,encode_p X P,encode_p X Q) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_u_p_p_2_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, i x = decode_u (pack_c_u_p_p X C i P Q 2) x.
let X C i P Q. apply pack_c_u_p_p_2_eq (pack_c_u_p_p X C i P Q) X C i P Q. reflexivity.
Qed.

Theorem pack_c_u_p_p_3_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_c_u_p_p X C i P Q -> forall x :e X, P x = decode_p (S 3) x.
let S X C i P Q. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_u X i,encode_p X P,encode_p X Q) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_u_p_p_3_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, P x = decode_p (pack_c_u_p_p X C i P Q 3) x.
let X C i P Q. apply pack_c_u_p_p_3_eq (pack_c_u_p_p X C i P Q) X C i P Q. reflexivity.
Qed.

Theorem pack_c_u_p_p_4_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_c_u_p_p X C i P Q -> forall x :e X, Q x = decode_p (S 4) x.
let S X C i P Q. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_c X C,encode_u X i,encode_p X P,encode_p X Q) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_c_u_p_p_4_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, Q x = decode_p (pack_c_u_p_p X C i P Q 4) x.
let X C i P Q. apply pack_c_u_p_p_4_eq (pack_c_u_p_p X C i P Q) X C i P Q. reflexivity.
Qed.

Theorem pack_c_u_p_p_inj : forall X X', forall C C':(set -> prop) -> prop, forall i i':set -> set, forall P P':set -> prop, forall Q Q':set -> prop, pack_c_u_p_p X C i P Q = pack_c_u_p_p X' C' i' P' Q' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x).
let X X' C C' i i' P P' Q Q'. assume H1.
claim L0: X' = pack_c_u_p_p X C i P Q 0.
{ exact pack_c_u_p_p_0_eq (pack_c_u_p_p X C i P Q) X' C' i' P' Q' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_u_p_p_0_eq2 X C i P Q. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_u_p_p_1_eq2 X C i P Q U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_u_p_p_1_eq2 X' C' i' P' Q' U LU.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_u_p_p_2_eq2 X C i P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_p_p_2_eq2 X' C' i' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_u_p_p_3_eq2 X C i P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_p_p_3_eq2 X' C' i' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_c_u_p_p_4_eq2 X C i P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_p_p_4_eq2 X' C' i' P' Q' x Lx.
Qed.

Theorem pack_c_u_p_p_ext : forall X, forall C C':(set -> prop) -> prop, forall i i':set -> set, forall P P':set -> prop, forall Q Q':set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_c_u_p_p X C i P Q = pack_c_u_p_p X C' i' P' Q'.
let X C C' i i' P P' Q Q'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_c X C,encode_u X i,encode_p X P,encode_p X Q) = (X,encode_c X C',encode_u X i',encode_p X P',encode_p X Q').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_c_u_p_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall Q:set -> prop, q (pack_c_u_p_p X C i P Q)) -> q S.

Theorem pack_struct_c_u_p_p_I: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall Q:set -> prop, struct_c_u_p_p (pack_c_u_p_p X C i P Q).
let X C i. assume Hi. let P Q q. assume Hq.
exact Hq X C i Hi P Q.
Qed.

Theorem pack_struct_c_u_p_p_E2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, struct_c_u_p_p (pack_c_u_p_p X C i P Q) -> forall x :e X, i x :e X.
let X C i P Q. assume H1. apply H1 (fun z => z = pack_c_u_p_p X C i P Q -> forall x :e X, i x :e X).
- let X'. let C'. let i'. assume Hi'. let P'. let Q'.
  assume Heq: pack_c_u_p_p X' C' i' P' Q' = pack_c_u_p_p X C i P Q.
  apply pack_c_u_p_p_inj X' X C' C i' i P' P Q' Q Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i HP'P HQ'Q.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_c_u_p_p_eta: forall S, struct_c_u_p_p S -> S = pack_c_u_p_p (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_p (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_c_u_p_p (z 0) (decode_c (z 1)) (decode_u (z 2)) (decode_p (z 3)) (decode_p (z 4))).
let X. let C. let i. assume _. let P. let Q.
prove pack_c_u_p_p X C i P Q = pack_c_u_p_p (pack_c_u_p_p X C i P Q 0) (decode_c (pack_c_u_p_p X C i P Q 1)) (decode_u (pack_c_u_p_p X C i P Q 2)) (decode_p (pack_c_u_p_p X C i P Q 3)) (decode_p (pack_c_u_p_p X C i P Q 4)).
rewrite <- pack_c_u_p_p_0_eq2 X C i P Q.
apply pack_c_u_p_p_ext.
- let U. assume HU.
  rewrite <- pack_c_u_p_p_1_eq2 X C i P Q U HU.
  apply iff_refl.
- exact pack_c_u_p_p_2_eq2 X C i P Q.
- let x. assume Hx.
  rewrite <- pack_c_u_p_p_3_eq2 X C i P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_u_p_p_4_eq2 X C i P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_u_p_p_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_c_u_p_p_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> (set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X C' i' P' Q' = Phi X C i P Q)
  ->
  unpack_c_u_p_p_i (pack_c_u_p_p X C i P Q) Phi = Phi X C i P Q.
let Phi X C i P Q.
assume HPhi.
prove Phi (pack_c_u_p_p X C i P Q 0) (decode_c (pack_c_u_p_p X C i P Q 1)) (decode_u (pack_c_u_p_p X C i P Q 2)) (decode_p (pack_c_u_p_p X C i P Q 3)) (decode_p (pack_c_u_p_p X C i P Q 4)) = Phi X C i P Q.
rewrite <- pack_c_u_p_p_0_eq2 X C i P Q.
prove Phi X (decode_c (pack_c_u_p_p X C i P Q 1)) (decode_u (pack_c_u_p_p X C i P Q 2)) (decode_p (pack_c_u_p_p X C i P Q 3)) (decode_p (pack_c_u_p_p X C i P Q 4)) = Phi X C i P Q.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_p_p X C i P Q 1) U.
  rewrite <- pack_c_u_p_p_1_eq2 X C i P Q U HU.
  apply iff_refl.
- exact pack_c_u_p_p_2_eq2 X C i P Q.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_u_p_p X C i P Q 3) x.
  rewrite <- pack_c_u_p_p_3_eq2 X C i P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_c_u_p_p X C i P Q 4) x.
  rewrite <- pack_c_u_p_p_4_eq2 X C i P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_u_p_p_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_c_u_p_p_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> (set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X C' i' P' Q' = Phi X C i P Q)
  ->
  unpack_c_u_p_p_o (pack_c_u_p_p X C i P Q) Phi = Phi X C i P Q.
let Phi X C i P Q.
assume HPhi.
prove Phi (pack_c_u_p_p X C i P Q 0) (decode_c (pack_c_u_p_p X C i P Q 1)) (decode_u (pack_c_u_p_p X C i P Q 2)) (decode_p (pack_c_u_p_p X C i P Q 3)) (decode_p (pack_c_u_p_p X C i P Q 4)) = Phi X C i P Q.
rewrite <- pack_c_u_p_p_0_eq2 X C i P Q.
prove Phi X (decode_c (pack_c_u_p_p X C i P Q 1)) (decode_u (pack_c_u_p_p X C i P Q 2)) (decode_p (pack_c_u_p_p X C i P Q 3)) (decode_p (pack_c_u_p_p X C i P Q 4)) = Phi X C i P Q.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_p_p X C i P Q 1) U.
  rewrite <- pack_c_u_p_p_1_eq2 X C i P Q U HU.
  apply iff_refl.
- exact pack_c_u_p_p_2_eq2 X C i P Q.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_u_p_p X C i P Q 3) x.
  rewrite <- pack_c_u_p_p_3_eq2 X C i P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_c_u_p_p X C i P Q 4) x.
  rewrite <- pack_c_u_p_p_4_eq2 X C i P Q x Hx.
  apply iff_refl.
Qed.


Definition pack_c_u_p_e : set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> set -> set := fun X C i P c => (X,encode_c X C,encode_u X i,encode_p X P,c).

Theorem pack_c_u_p_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_c_u_p_e X C i P c -> X = S 0.
let S X C i P c. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_u X i,encode_p X P,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_u_p_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, X = pack_c_u_p_e X C i P c 0.
let X C i P c. apply pack_c_u_p_e_0_eq (pack_c_u_p_e X C i P c) X C i P c. reflexivity.
Qed.

Theorem pack_c_u_p_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_c_u_p_e X C i P c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C i P c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_u X i,encode_p X P,c) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_u_p_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_u_p_e X C i P c 1) U.
let X C i P c. apply pack_c_u_p_e_1_eq (pack_c_u_p_e X C i P c) X C i P c. reflexivity.
Qed.

Theorem pack_c_u_p_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_c_u_p_e X C i P c -> forall x :e X, i x = decode_u (S 2) x.
let S X C i P c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_u X i,encode_p X P,c) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_u_p_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, forall x :e X, i x = decode_u (pack_c_u_p_e X C i P c 2) x.
let X C i P c. apply pack_c_u_p_e_2_eq (pack_c_u_p_e X C i P c) X C i P c. reflexivity.
Qed.

Theorem pack_c_u_p_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_c_u_p_e X C i P c -> forall x :e X, P x = decode_p (S 3) x.
let S X C i P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_u X i,encode_p X P,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_u_p_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_c_u_p_e X C i P c 3) x.
let X C i P c. apply pack_c_u_p_e_3_eq (pack_c_u_p_e X C i P c) X C i P c. reflexivity.
Qed.

Theorem pack_c_u_p_e_4_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_c_u_p_e X C i P c -> c = S 4.
let S X C i P c. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_u X i,encode_p X P,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_c_u_p_e_4_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, c = pack_c_u_p_e X C i P c 4.
let X C i P c. apply pack_c_u_p_e_4_eq (pack_c_u_p_e X C i P c) X C i P c. reflexivity.
Qed.

Theorem pack_c_u_p_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall i i':set -> set, forall P P':set -> prop, forall c c':set, pack_c_u_p_e X C i P c = pack_c_u_p_e X' C' i' P' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' C C' i i' P P' c c'. assume H1.
claim L0: X' = pack_c_u_p_e X C i P c 0.
{ exact pack_c_u_p_e_0_eq (pack_c_u_p_e X C i P c) X' C' i' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_u_p_e_0_eq2 X C i P c. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_u_p_e_1_eq2 X C i P c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_u_p_e_1_eq2 X' C' i' P' c' U LU.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_u_p_e_2_eq2 X C i P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_p_e_2_eq2 X' C' i' P' c' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_u_p_e_3_eq2 X C i P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_p_e_3_eq2 X' C' i' P' c' x Lx.
- prove c = c'.
  rewrite pack_c_u_p_e_4_eq2 X C i P c.
  rewrite H1. symmetry.
  exact pack_c_u_p_e_4_eq2 X' C' i' P' c'.
Qed.

Theorem pack_c_u_p_e_ext : forall X, forall C C':(set -> prop) -> prop, forall i i':set -> set, forall P P':set -> prop, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_u_p_e X C i P c = pack_c_u_p_e X C' i' P' c.
let X C C' i i' P P' c. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_u X i,encode_p X P,c) = (X,encode_c X C',encode_u X i',encode_p X P',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_c_u_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall c:set, c :e X -> q (pack_c_u_p_e X C i P c)) -> q S.

Theorem pack_struct_c_u_p_e_I: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall c:set, c :e X -> struct_c_u_p_e (pack_c_u_p_e X C i P c).
let X C i. assume Hi. let P c. assume Hc. let q. assume Hq.
exact Hq X C i Hi P c Hc.
Qed.

Theorem pack_struct_c_u_p_e_E2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, struct_c_u_p_e (pack_c_u_p_e X C i P c) -> forall x :e X, i x :e X.
let X C i P c. assume H1. apply H1 (fun z => z = pack_c_u_p_e X C i P c -> forall x :e X, i x :e X).
- let X'. let C'. let i'. assume Hi'. let P'. let c'. assume Hc'.
  assume Heq: pack_c_u_p_e X' C' i' P' c' = pack_c_u_p_e X C i P c.
  apply pack_c_u_p_e_inj X' X C' C i' i P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_c_u_p_e_E4: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set, struct_c_u_p_e (pack_c_u_p_e X C i P c) -> c :e X.
let X C i P c. assume H1. apply H1 (fun z => z = pack_c_u_p_e X C i P c -> c :e X).
- let X'. let C'. let i'. assume Hi'. let P'. let c'. assume Hc'.
  assume Heq: pack_c_u_p_e X' C' i' P' c' = pack_c_u_p_e X C i P c.
  apply pack_c_u_p_e_inj X' X C' C i' i P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_u_p_e_eta: forall S, struct_c_u_p_e S -> S = pack_c_u_p_e (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_p (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_c_u_p_e (z 0) (decode_c (z 1)) (decode_u (z 2)) (decode_p (z 3)) (z 4)).
let X. let C. let i. assume _. let P. let c. assume _.
prove pack_c_u_p_e X C i P c = pack_c_u_p_e (pack_c_u_p_e X C i P c 0) (decode_c (pack_c_u_p_e X C i P c 1)) (decode_u (pack_c_u_p_e X C i P c 2)) (decode_p (pack_c_u_p_e X C i P c 3)) (pack_c_u_p_e X C i P c 4).
rewrite <- pack_c_u_p_e_0_eq2 X C i P c.
rewrite <- pack_c_u_p_e_4_eq2 X C i P c.
apply pack_c_u_p_e_ext.
- let U. assume HU.
  rewrite <- pack_c_u_p_e_1_eq2 X C i P c U HU.
  apply iff_refl.
- exact pack_c_u_p_e_2_eq2 X C i P c.
- let x. assume Hx.
  rewrite <- pack_c_u_p_e_3_eq2 X C i P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_u_p_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_c_u_p_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' i' P' c = Phi X C i P c)
  ->
  unpack_c_u_p_e_i (pack_c_u_p_e X C i P c) Phi = Phi X C i P c.
let Phi X C i P c.
assume HPhi.
prove Phi (pack_c_u_p_e X C i P c 0) (decode_c (pack_c_u_p_e X C i P c 1)) (decode_u (pack_c_u_p_e X C i P c 2)) (decode_p (pack_c_u_p_e X C i P c 3)) (pack_c_u_p_e X C i P c 4) = Phi X C i P c.
rewrite <- pack_c_u_p_e_0_eq2 X C i P c.
prove Phi X (decode_c (pack_c_u_p_e X C i P c 1)) (decode_u (pack_c_u_p_e X C i P c 2)) (decode_p (pack_c_u_p_e X C i P c 3)) (pack_c_u_p_e X C i P c 4) = Phi X C i P c.
rewrite <- pack_c_u_p_e_4_eq2 X C i P c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_p_e X C i P c 1) U.
  rewrite <- pack_c_u_p_e_1_eq2 X C i P c U HU.
  apply iff_refl.
- exact pack_c_u_p_e_2_eq2 X C i P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_u_p_e X C i P c 3) x.
  rewrite <- pack_c_u_p_e_3_eq2 X C i P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_u_p_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_c_u_p_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' i' P' c = Phi X C i P c)
  ->
  unpack_c_u_p_e_o (pack_c_u_p_e X C i P c) Phi = Phi X C i P c.
let Phi X C i P c.
assume HPhi.
prove Phi (pack_c_u_p_e X C i P c 0) (decode_c (pack_c_u_p_e X C i P c 1)) (decode_u (pack_c_u_p_e X C i P c 2)) (decode_p (pack_c_u_p_e X C i P c 3)) (pack_c_u_p_e X C i P c 4) = Phi X C i P c.
rewrite <- pack_c_u_p_e_0_eq2 X C i P c.
prove Phi X (decode_c (pack_c_u_p_e X C i P c 1)) (decode_u (pack_c_u_p_e X C i P c 2)) (decode_p (pack_c_u_p_e X C i P c 3)) (pack_c_u_p_e X C i P c 4) = Phi X C i P c.
rewrite <- pack_c_u_p_e_4_eq2 X C i P c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_p_e X C i P c 1) U.
  rewrite <- pack_c_u_p_e_1_eq2 X C i P c U HU.
  apply iff_refl.
- exact pack_c_u_p_e_2_eq2 X C i P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_u_p_e X C i P c 3) x.
  rewrite <- pack_c_u_p_e_3_eq2 X C i P c x Hx.
  apply iff_refl.
Qed.


Definition pack_c_u_e_e : set -> ((set -> prop) -> prop) -> (set -> set) -> set -> set -> set := fun X C i c d => (X,encode_c X C,encode_u X i,c,d).

Theorem pack_c_u_e_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, S = pack_c_u_e_e X C i c d -> X = S 0.
let S X C i c d. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_u X i,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_u_e_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, X = pack_c_u_e_e X C i c d 0.
let X C i c d. apply pack_c_u_e_e_0_eq (pack_c_u_e_e X C i c d) X C i c d. reflexivity.
Qed.

Theorem pack_c_u_e_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, S = pack_c_u_e_e X C i c d -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C i c d. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_u X i,c,d) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_u_e_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_u_e_e X C i c d 1) U.
let X C i c d. apply pack_c_u_e_e_1_eq (pack_c_u_e_e X C i c d) X C i c d. reflexivity.
Qed.

Theorem pack_c_u_e_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, S = pack_c_u_e_e X C i c d -> forall x :e X, i x = decode_u (S 2) x.
let S X C i c d. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_u X i,c,d) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_u_e_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, forall x :e X, i x = decode_u (pack_c_u_e_e X C i c d 2) x.
let X C i c d. apply pack_c_u_e_e_2_eq (pack_c_u_e_e X C i c d) X C i c d. reflexivity.
Qed.

Theorem pack_c_u_e_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, S = pack_c_u_e_e X C i c d -> c = S 3.
let S X C i c d. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_u X i,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_c_u_e_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, c = pack_c_u_e_e X C i c d 3.
let X C i c d. apply pack_c_u_e_e_3_eq (pack_c_u_e_e X C i c d) X C i c d. reflexivity.
Qed.

Theorem pack_c_u_e_e_4_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, S = pack_c_u_e_e X C i c d -> d = S 4.
let S X C i c d. assume H1.
rewrite H1. prove d = (X,encode_c X C,encode_u X i,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_c_u_e_e_4_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, d = pack_c_u_e_e X C i c d 4.
let X C i c d. apply pack_c_u_e_e_4_eq (pack_c_u_e_e X C i c d) X C i c d. reflexivity.
Qed.

Theorem pack_c_u_e_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall i i':set -> set, forall c c':set, forall d d':set, pack_c_u_e_e X C i c d = pack_c_u_e_e X' C' i' c' d' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, i x = i' x) /\ c = c' /\ d = d'.
let X X' C C' i i' c c' d d'. assume H1.
claim L0: X' = pack_c_u_e_e X C i c d 0.
{ exact pack_c_u_e_e_0_eq (pack_c_u_e_e X C i c d) X' C' i' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_u_e_e_0_eq2 X C i c d. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_u_e_e_1_eq2 X C i c d U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_u_e_e_1_eq2 X' C' i' c' d' U LU.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_u_e_e_2_eq2 X C i c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_e_e_2_eq2 X' C' i' c' d' x Lx.
- prove c = c'.
  rewrite pack_c_u_e_e_3_eq2 X C i c d.
  rewrite H1. symmetry.
  exact pack_c_u_e_e_3_eq2 X' C' i' c' d'.
- prove d = d'.
  rewrite pack_c_u_e_e_4_eq2 X C i c d.
  rewrite H1. symmetry.
  exact pack_c_u_e_e_4_eq2 X' C' i' c' d'.
Qed.

Theorem pack_c_u_e_e_ext : forall X, forall C C':(set -> prop) -> prop, forall i i':set -> set, forall c, forall d,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, i x = i' x) ->
 pack_c_u_e_e X C i c d = pack_c_u_e_e X C' i' c d.
let X C C' i i' c d. assume H1. assume H2.
prove (X,encode_c X C,encode_u X i,c,d) = (X,encode_c X C',encode_u X i',c,d).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_u_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> forall d:set, d :e X -> q (pack_c_u_e_e X C i c d)) -> q S.

Theorem pack_struct_c_u_e_e_I: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> forall d:set, d :e X -> struct_c_u_e_e (pack_c_u_e_e X C i c d).
let X C i. assume Hi. let c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X C i Hi c Hc d Hd.
Qed.

Theorem pack_struct_c_u_e_e_E2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, struct_c_u_e_e (pack_c_u_e_e X C i c d) -> forall x :e X, i x :e X.
let X C i c d. assume H1. apply H1 (fun z => z = pack_c_u_e_e X C i c d -> forall x :e X, i x :e X).
- let X'. let C'. let i'. assume Hi'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_c_u_e_e X' C' i' c' d' = pack_c_u_e_e X C i c d.
  apply pack_c_u_e_e_inj X' X C' C i' i c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_c_u_e_e_E3: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, struct_c_u_e_e (pack_c_u_e_e X C i c d) -> c :e X.
let X C i c d. assume H1. apply H1 (fun z => z = pack_c_u_e_e X C i c d -> c :e X).
- let X'. let C'. let i'. assume Hi'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_c_u_e_e X' C' i' c' d' = pack_c_u_e_e X C i c d.
  apply pack_c_u_e_e_inj X' X C' C i' i c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_c_u_e_e_E4: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set, struct_c_u_e_e (pack_c_u_e_e X C i c d) -> d :e X.
let X C i c d. assume H1. apply H1 (fun z => z = pack_c_u_e_e X C i c d -> d :e X).
- let X'. let C'. let i'. assume Hi'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_c_u_e_e X' C' i' c' d' = pack_c_u_e_e X C i c d.
  apply pack_c_u_e_e_inj X' X C' C i' i c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_c_u_e_e_eta: forall S, struct_c_u_e_e S -> S = pack_c_u_e_e (S 0) (decode_c (S 1)) (decode_u (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_c_u_e_e (z 0) (decode_c (z 1)) (decode_u (z 2)) (z 3) (z 4)).
let X. let C. let i. assume _. let c. assume _. let d. assume _.
prove pack_c_u_e_e X C i c d = pack_c_u_e_e (pack_c_u_e_e X C i c d 0) (decode_c (pack_c_u_e_e X C i c d 1)) (decode_u (pack_c_u_e_e X C i c d 2)) (pack_c_u_e_e X C i c d 3) (pack_c_u_e_e X C i c d 4).
rewrite <- pack_c_u_e_e_0_eq2 X C i c d.
rewrite <- pack_c_u_e_e_3_eq2 X C i c d.
rewrite <- pack_c_u_e_e_4_eq2 X C i c d.
apply pack_c_u_e_e_ext.
- let U. assume HU.
  rewrite <- pack_c_u_e_e_1_eq2 X C i c d U HU.
  apply iff_refl.
- exact pack_c_u_e_e_2_eq2 X C i c d.
Qed.


Definition unpack_c_u_e_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (S 3) (S 4).

Theorem unpack_c_u_e_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> set -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X C' i' c d = Phi X C i c d)
  ->
  unpack_c_u_e_e_i (pack_c_u_e_e X C i c d) Phi = Phi X C i c d.
let Phi X C i c d.
assume HPhi.
prove Phi (pack_c_u_e_e X C i c d 0) (decode_c (pack_c_u_e_e X C i c d 1)) (decode_u (pack_c_u_e_e X C i c d 2)) (pack_c_u_e_e X C i c d 3) (pack_c_u_e_e X C i c d 4) = Phi X C i c d.
rewrite <- pack_c_u_e_e_0_eq2 X C i c d.
prove Phi X (decode_c (pack_c_u_e_e X C i c d 1)) (decode_u (pack_c_u_e_e X C i c d 2)) (pack_c_u_e_e X C i c d 3) (pack_c_u_e_e X C i c d 4) = Phi X C i c d.
rewrite <- pack_c_u_e_e_3_eq2 X C i c d.
rewrite <- pack_c_u_e_e_4_eq2 X C i c d.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_e_e X C i c d 1) U.
  rewrite <- pack_c_u_e_e_1_eq2 X C i c d U HU.
  apply iff_refl.
- exact pack_c_u_e_e_2_eq2 X C i c d.
Qed.


Definition unpack_c_u_e_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (S 3) (S 4).

Theorem unpack_c_u_e_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> set -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall d:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X C' i' c d = Phi X C i c d)
  ->
  unpack_c_u_e_e_o (pack_c_u_e_e X C i c d) Phi = Phi X C i c d.
let Phi X C i c d.
assume HPhi.
prove Phi (pack_c_u_e_e X C i c d 0) (decode_c (pack_c_u_e_e X C i c d 1)) (decode_u (pack_c_u_e_e X C i c d 2)) (pack_c_u_e_e X C i c d 3) (pack_c_u_e_e X C i c d 4) = Phi X C i c d.
rewrite <- pack_c_u_e_e_0_eq2 X C i c d.
prove Phi X (decode_c (pack_c_u_e_e X C i c d 1)) (decode_u (pack_c_u_e_e X C i c d 2)) (pack_c_u_e_e X C i c d 3) (pack_c_u_e_e X C i c d 4) = Phi X C i c d.
rewrite <- pack_c_u_e_e_3_eq2 X C i c d.
rewrite <- pack_c_u_e_e_4_eq2 X C i c d.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_e_e X C i c d 1) U.
  rewrite <- pack_c_u_e_e_1_eq2 X C i c d U HU.
  apply iff_refl.
- exact pack_c_u_e_e_2_eq2 X C i c d.
Qed.


Definition pack_c_r_p_p : set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set := fun X C R P Q => (X,encode_c X C,encode_r X R,encode_p X P,encode_p X Q).

Theorem pack_c_r_p_p_0_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_c_r_p_p X C R P Q -> X = S 0.
let S X C R P Q. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_r X R,encode_p X P,encode_p X Q) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_r_p_p_0_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, X = pack_c_r_p_p X C R P Q 0.
let X C R P Q. apply pack_c_r_p_p_0_eq (pack_c_r_p_p X C R P Q) X C R P Q. reflexivity.
Qed.

Theorem pack_c_r_p_p_1_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_c_r_p_p X C R P Q -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C R P Q. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_r X R,encode_p X P,encode_p X Q) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_r_p_p_1_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_r_p_p X C R P Q 1) U.
let X C R P Q. apply pack_c_r_p_p_1_eq (pack_c_r_p_p X C R P Q) X C R P Q. reflexivity.
Qed.

Theorem pack_c_r_p_p_2_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_c_r_p_p X C R P Q -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X C R P Q. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_r X R,encode_p X P,encode_p X Q) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_r_p_p_2_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x y :e X, R x y = decode_r (pack_c_r_p_p X C R P Q 2) x y.
let X C R P Q. apply pack_c_r_p_p_2_eq (pack_c_r_p_p X C R P Q) X C R P Q. reflexivity.
Qed.

Theorem pack_c_r_p_p_3_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_c_r_p_p X C R P Q -> forall x :e X, P x = decode_p (S 3) x.
let S X C R P Q. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_r X R,encode_p X P,encode_p X Q) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_r_p_p_3_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x :e X, P x = decode_p (pack_c_r_p_p X C R P Q 3) x.
let X C R P Q. apply pack_c_r_p_p_3_eq (pack_c_r_p_p X C R P Q) X C R P Q. reflexivity.
Qed.

Theorem pack_c_r_p_p_4_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_c_r_p_p X C R P Q -> forall x :e X, Q x = decode_p (S 4) x.
let S X C R P Q. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_c X C,encode_r X R,encode_p X P,encode_p X Q) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_c_r_p_p_4_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x :e X, Q x = decode_p (pack_c_r_p_p X C R P Q 4) x.
let X C R P Q. apply pack_c_r_p_p_4_eq (pack_c_r_p_p X C R P Q) X C R P Q. reflexivity.
Qed.

Theorem pack_c_r_p_p_inj : forall X X', forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, forall P P':set -> prop, forall Q Q':set -> prop, pack_c_r_p_p X C R P Q = pack_c_r_p_p X' C' R' P' Q' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x).
let X X' C C' R R' P P' Q Q'. assume H1.
claim L0: X' = pack_c_r_p_p X C R P Q 0.
{ exact pack_c_r_p_p_0_eq (pack_c_r_p_p X C R P Q) X' C' R' P' Q' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_r_p_p_0_eq2 X C R P Q. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_r_p_p_1_eq2 X C R P Q U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_r_p_p_1_eq2 X' C' R' P' Q' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_r_p_p_2_eq2 X C R P Q x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_r_p_p_2_eq2 X' C' R' P' Q' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_r_p_p_3_eq2 X C R P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_r_p_p_3_eq2 X' C' R' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_c_r_p_p_4_eq2 X C R P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_r_p_p_4_eq2 X' C' R' P' Q' x Lx.
Qed.

Theorem pack_c_r_p_p_ext : forall X, forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, forall P P':set -> prop, forall Q Q':set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_c_r_p_p X C R P Q = pack_c_r_p_p X C' R' P' Q'.
let X C C' R R' P P' Q Q'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_c X C,encode_r X R,encode_p X P,encode_p X Q) = (X,encode_c X C',encode_r X R',encode_p X P',encode_p X Q').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_c_r_p_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, q (pack_c_r_p_p X C R P Q)) -> q S.

Theorem pack_struct_c_r_p_p_I: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, struct_c_r_p_p (pack_c_r_p_p X C R P Q).
let X C R P Q q. assume Hq.
exact Hq X C R P Q.
Qed.

Theorem struct_c_r_p_p_eta: forall S, struct_c_r_p_p S -> S = pack_c_r_p_p (S 0) (decode_c (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_c_r_p_p (z 0) (decode_c (z 1)) (decode_r (z 2)) (decode_p (z 3)) (decode_p (z 4))).
let X. let C. let R. let P. let Q.
prove pack_c_r_p_p X C R P Q = pack_c_r_p_p (pack_c_r_p_p X C R P Q 0) (decode_c (pack_c_r_p_p X C R P Q 1)) (decode_r (pack_c_r_p_p X C R P Q 2)) (decode_p (pack_c_r_p_p X C R P Q 3)) (decode_p (pack_c_r_p_p X C R P Q 4)).
rewrite <- pack_c_r_p_p_0_eq2 X C R P Q.
apply pack_c_r_p_p_ext.
- let U. assume HU.
  rewrite <- pack_c_r_p_p_1_eq2 X C R P Q U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_r_p_p_2_eq2 X C R P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_r_p_p_3_eq2 X C R P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_r_p_p_4_eq2 X C R P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_r_p_p_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_c_r_p_p_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X C' R' P' Q' = Phi X C R P Q)
  ->
  unpack_c_r_p_p_i (pack_c_r_p_p X C R P Q) Phi = Phi X C R P Q.
let Phi X C R P Q.
assume HPhi.
prove Phi (pack_c_r_p_p X C R P Q 0) (decode_c (pack_c_r_p_p X C R P Q 1)) (decode_r (pack_c_r_p_p X C R P Q 2)) (decode_p (pack_c_r_p_p X C R P Q 3)) (decode_p (pack_c_r_p_p X C R P Q 4)) = Phi X C R P Q.
rewrite <- pack_c_r_p_p_0_eq2 X C R P Q.
prove Phi X (decode_c (pack_c_r_p_p X C R P Q 1)) (decode_r (pack_c_r_p_p X C R P Q 2)) (decode_p (pack_c_r_p_p X C R P Q 3)) (decode_p (pack_c_r_p_p X C R P Q 4)) = Phi X C R P Q.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r_p_p X C R P Q 1) U.
  rewrite <- pack_c_r_p_p_1_eq2 X C R P Q U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r_p_p X C R P Q 2) x y.
  rewrite <- pack_c_r_p_p_2_eq2 X C R P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_r_p_p X C R P Q 3) x.
  rewrite <- pack_c_r_p_p_3_eq2 X C R P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_c_r_p_p X C R P Q 4) x.
  rewrite <- pack_c_r_p_p_4_eq2 X C R P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_r_p_p_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_c_r_p_p_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X C' R' P' Q' = Phi X C R P Q)
  ->
  unpack_c_r_p_p_o (pack_c_r_p_p X C R P Q) Phi = Phi X C R P Q.
let Phi X C R P Q.
assume HPhi.
prove Phi (pack_c_r_p_p X C R P Q 0) (decode_c (pack_c_r_p_p X C R P Q 1)) (decode_r (pack_c_r_p_p X C R P Q 2)) (decode_p (pack_c_r_p_p X C R P Q 3)) (decode_p (pack_c_r_p_p X C R P Q 4)) = Phi X C R P Q.
rewrite <- pack_c_r_p_p_0_eq2 X C R P Q.
prove Phi X (decode_c (pack_c_r_p_p X C R P Q 1)) (decode_r (pack_c_r_p_p X C R P Q 2)) (decode_p (pack_c_r_p_p X C R P Q 3)) (decode_p (pack_c_r_p_p X C R P Q 4)) = Phi X C R P Q.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r_p_p X C R P Q 1) U.
  rewrite <- pack_c_r_p_p_1_eq2 X C R P Q U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r_p_p X C R P Q 2) x y.
  rewrite <- pack_c_r_p_p_2_eq2 X C R P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_r_p_p X C R P Q 3) x.
  rewrite <- pack_c_r_p_p_3_eq2 X C R P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_c_r_p_p X C R P Q 4) x.
  rewrite <- pack_c_r_p_p_4_eq2 X C R P Q x Hx.
  apply iff_refl.
Qed.


Definition pack_c_r_p_e : set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> set -> set := fun X C R P c => (X,encode_c X C,encode_r X R,encode_p X P,c).

Theorem pack_c_r_p_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_c_r_p_e X C R P c -> X = S 0.
let S X C R P c. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_r X R,encode_p X P,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_r_p_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, X = pack_c_r_p_e X C R P c 0.
let X C R P c. apply pack_c_r_p_e_0_eq (pack_c_r_p_e X C R P c) X C R P c. reflexivity.
Qed.

Theorem pack_c_r_p_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_c_r_p_e X C R P c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C R P c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_r X R,encode_p X P,c) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_r_p_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_r_p_e X C R P c 1) U.
let X C R P c. apply pack_c_r_p_e_1_eq (pack_c_r_p_e X C R P c) X C R P c. reflexivity.
Qed.

Theorem pack_c_r_p_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_c_r_p_e X C R P c -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X C R P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_r X R,encode_p X P,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_r_p_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_c_r_p_e X C R P c 2) x y.
let X C R P c. apply pack_c_r_p_e_2_eq (pack_c_r_p_e X C R P c) X C R P c. reflexivity.
Qed.

Theorem pack_c_r_p_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_c_r_p_e X C R P c -> forall x :e X, P x = decode_p (S 3) x.
let S X C R P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_r X R,encode_p X P,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_r_p_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_c_r_p_e X C R P c 3) x.
let X C R P c. apply pack_c_r_p_e_3_eq (pack_c_r_p_e X C R P c) X C R P c. reflexivity.
Qed.

Theorem pack_c_r_p_e_4_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_c_r_p_e X C R P c -> c = S 4.
let S X C R P c. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_r X R,encode_p X P,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_c_r_p_e_4_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c = pack_c_r_p_e X C R P c 4.
let X C R P c. apply pack_c_r_p_e_4_eq (pack_c_r_p_e X C R P c) X C R P c. reflexivity.
Qed.

Theorem pack_c_r_p_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, forall P P':set -> prop, forall c c':set, pack_c_r_p_e X C R P c = pack_c_r_p_e X' C' R' P' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' C C' R R' P P' c c'. assume H1.
claim L0: X' = pack_c_r_p_e X C R P c 0.
{ exact pack_c_r_p_e_0_eq (pack_c_r_p_e X C R P c) X' C' R' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_r_p_e_0_eq2 X C R P c. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_r_p_e_1_eq2 X C R P c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_r_p_e_1_eq2 X' C' R' P' c' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_r_p_e_2_eq2 X C R P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_r_p_e_2_eq2 X' C' R' P' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_r_p_e_3_eq2 X C R P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_r_p_e_3_eq2 X' C' R' P' c' x Lx.
- prove c = c'.
  rewrite pack_c_r_p_e_4_eq2 X C R P c.
  rewrite H1. symmetry.
  exact pack_c_r_p_e_4_eq2 X' C' R' P' c'.
Qed.

Theorem pack_c_r_p_e_ext : forall X, forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, forall P P':set -> prop, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_r_p_e X C R P c = pack_c_r_p_e X C' R' P' c.
let X C C' R R' P P' c. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_r X R,encode_p X P,c) = (X,encode_c X C',encode_r X R',encode_p X P',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_c_r_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> q (pack_c_r_p_e X C R P c)) -> q S.

Theorem pack_struct_c_r_p_e_I: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> struct_c_r_p_e (pack_c_r_p_e X C R P c).
let X C R P c. assume Hc. let q. assume Hq.
exact Hq X C R P c Hc.
Qed.

Theorem pack_struct_c_r_p_e_E4: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, struct_c_r_p_e (pack_c_r_p_e X C R P c) -> c :e X.
let X C R P c. assume H1. apply H1 (fun z => z = pack_c_r_p_e X C R P c -> c :e X).
- let X'. let C'. let R'. let P'. let c'. assume Hc'.
  assume Heq: pack_c_r_p_e X' C' R' P' c' = pack_c_r_p_e X C R P c.
  apply pack_c_r_p_e_inj X' X C' C R' R P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C HR'R HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_r_p_e_eta: forall S, struct_c_r_p_e S -> S = pack_c_r_p_e (S 0) (decode_c (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_c_r_p_e (z 0) (decode_c (z 1)) (decode_r (z 2)) (decode_p (z 3)) (z 4)).
let X. let C. let R. let P. let c. assume _.
prove pack_c_r_p_e X C R P c = pack_c_r_p_e (pack_c_r_p_e X C R P c 0) (decode_c (pack_c_r_p_e X C R P c 1)) (decode_r (pack_c_r_p_e X C R P c 2)) (decode_p (pack_c_r_p_e X C R P c 3)) (pack_c_r_p_e X C R P c 4).
rewrite <- pack_c_r_p_e_0_eq2 X C R P c.
rewrite <- pack_c_r_p_e_4_eq2 X C R P c.
apply pack_c_r_p_e_ext.
- let U. assume HU.
  rewrite <- pack_c_r_p_e_1_eq2 X C R P c U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_r_p_e_2_eq2 X C R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_r_p_e_3_eq2 X C R P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_r_p_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_c_r_p_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' R' P' c = Phi X C R P c)
  ->
  unpack_c_r_p_e_i (pack_c_r_p_e X C R P c) Phi = Phi X C R P c.
let Phi X C R P c.
assume HPhi.
prove Phi (pack_c_r_p_e X C R P c 0) (decode_c (pack_c_r_p_e X C R P c 1)) (decode_r (pack_c_r_p_e X C R P c 2)) (decode_p (pack_c_r_p_e X C R P c 3)) (pack_c_r_p_e X C R P c 4) = Phi X C R P c.
rewrite <- pack_c_r_p_e_0_eq2 X C R P c.
prove Phi X (decode_c (pack_c_r_p_e X C R P c 1)) (decode_r (pack_c_r_p_e X C R P c 2)) (decode_p (pack_c_r_p_e X C R P c 3)) (pack_c_r_p_e X C R P c 4) = Phi X C R P c.
rewrite <- pack_c_r_p_e_4_eq2 X C R P c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r_p_e X C R P c 1) U.
  rewrite <- pack_c_r_p_e_1_eq2 X C R P c U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r_p_e X C R P c 2) x y.
  rewrite <- pack_c_r_p_e_2_eq2 X C R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_r_p_e X C R P c 3) x.
  rewrite <- pack_c_r_p_e_3_eq2 X C R P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_r_p_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_c_r_p_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' R' P' c = Phi X C R P c)
  ->
  unpack_c_r_p_e_o (pack_c_r_p_e X C R P c) Phi = Phi X C R P c.
let Phi X C R P c.
assume HPhi.
prove Phi (pack_c_r_p_e X C R P c 0) (decode_c (pack_c_r_p_e X C R P c 1)) (decode_r (pack_c_r_p_e X C R P c 2)) (decode_p (pack_c_r_p_e X C R P c 3)) (pack_c_r_p_e X C R P c 4) = Phi X C R P c.
rewrite <- pack_c_r_p_e_0_eq2 X C R P c.
prove Phi X (decode_c (pack_c_r_p_e X C R P c 1)) (decode_r (pack_c_r_p_e X C R P c 2)) (decode_p (pack_c_r_p_e X C R P c 3)) (pack_c_r_p_e X C R P c 4) = Phi X C R P c.
rewrite <- pack_c_r_p_e_4_eq2 X C R P c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r_p_e X C R P c 1) U.
  rewrite <- pack_c_r_p_e_1_eq2 X C R P c U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r_p_e X C R P c 2) x y.
  rewrite <- pack_c_r_p_e_2_eq2 X C R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_r_p_e X C R P c 3) x.
  rewrite <- pack_c_r_p_e_3_eq2 X C R P c x Hx.
  apply iff_refl.
Qed.


Definition pack_c_r_e_e : set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set -> set -> set := fun X C R c d => (X,encode_c X C,encode_r X R,c,d).

Theorem pack_c_r_e_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_c_r_e_e X C R c d -> X = S 0.
let S X C R c d. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_r X R,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_r_e_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, X = pack_c_r_e_e X C R c d 0.
let X C R c d. apply pack_c_r_e_e_0_eq (pack_c_r_e_e X C R c d) X C R c d. reflexivity.
Qed.

Theorem pack_c_r_e_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_c_r_e_e X C R c d -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C R c d. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_r X R,c,d) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_r_e_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_r_e_e X C R c d 1) U.
let X C R c d. apply pack_c_r_e_e_1_eq (pack_c_r_e_e X C R c d) X C R c d. reflexivity.
Qed.

Theorem pack_c_r_e_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_c_r_e_e X C R c d -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X C R c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_r X R,c,d) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_r_e_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, forall x y :e X, R x y = decode_r (pack_c_r_e_e X C R c d 2) x y.
let X C R c d. apply pack_c_r_e_e_2_eq (pack_c_r_e_e X C R c d) X C R c d. reflexivity.
Qed.

Theorem pack_c_r_e_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_c_r_e_e X C R c d -> c = S 3.
let S X C R c d. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_r X R,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_c_r_e_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, c = pack_c_r_e_e X C R c d 3.
let X C R c d. apply pack_c_r_e_e_3_eq (pack_c_r_e_e X C R c d) X C R c d. reflexivity.
Qed.

Theorem pack_c_r_e_e_4_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_c_r_e_e X C R c d -> d = S 4.
let S X C R c d. assume H1.
rewrite H1. prove d = (X,encode_c X C,encode_r X R,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_c_r_e_e_4_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, d = pack_c_r_e_e X C R c d 4.
let X C R c d. apply pack_c_r_e_e_4_eq (pack_c_r_e_e X C R c d) X C R c d. reflexivity.
Qed.

Theorem pack_c_r_e_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, forall c c':set, forall d d':set, pack_c_r_e_e X C R c d = pack_c_r_e_e X' C' R' c' d' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, R x y = R' x y) /\ c = c' /\ d = d'.
let X X' C C' R R' c c' d d'. assume H1.
claim L0: X' = pack_c_r_e_e X C R c d 0.
{ exact pack_c_r_e_e_0_eq (pack_c_r_e_e X C R c d) X' C' R' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_r_e_e_0_eq2 X C R c d. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_r_e_e_1_eq2 X C R c d U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_r_e_e_1_eq2 X' C' R' c' d' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_r_e_e_2_eq2 X C R c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_r_e_e_2_eq2 X' C' R' c' d' x Lx y Ly.
- prove c = c'.
  rewrite pack_c_r_e_e_3_eq2 X C R c d.
  rewrite H1. symmetry.
  exact pack_c_r_e_e_3_eq2 X' C' R' c' d'.
- prove d = d'.
  rewrite pack_c_r_e_e_4_eq2 X C R c d.
  rewrite H1. symmetry.
  exact pack_c_r_e_e_4_eq2 X' C' R' c' d'.
Qed.

Theorem pack_c_r_e_e_ext : forall X, forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, forall c, forall d,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_c_r_e_e X C R c d = pack_c_r_e_e X C' R' c d.
let X C C' R R' c d. assume H1. assume H2.
prove (X,encode_c X C,encode_r X R,c,d) = (X,encode_c X C',encode_r X R',c,d).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_r_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> q (pack_c_r_e_e X C R c d)) -> q S.

Theorem pack_struct_c_r_e_e_I: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> struct_c_r_e_e (pack_c_r_e_e X C R c d).
let X C R c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X C R c Hc d Hd.
Qed.

Theorem pack_struct_c_r_e_e_E3: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, struct_c_r_e_e (pack_c_r_e_e X C R c d) -> c :e X.
let X C R c d. assume H1. apply H1 (fun z => z = pack_c_r_e_e X C R c d -> c :e X).
- let X'. let C'. let R'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_c_r_e_e X' C' R' c' d' = pack_c_r_e_e X C R c d.
  apply pack_c_r_e_e_inj X' X C' C R' R c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C HR'R Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_c_r_e_e_E4: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set, struct_c_r_e_e (pack_c_r_e_e X C R c d) -> d :e X.
let X C R c d. assume H1. apply H1 (fun z => z = pack_c_r_e_e X C R c d -> d :e X).
- let X'. let C'. let R'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_c_r_e_e X' C' R' c' d' = pack_c_r_e_e X C R c d.
  apply pack_c_r_e_e_inj X' X C' C R' R c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C HR'R Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_c_r_e_e_eta: forall S, struct_c_r_e_e S -> S = pack_c_r_e_e (S 0) (decode_c (S 1)) (decode_r (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_c_r_e_e (z 0) (decode_c (z 1)) (decode_r (z 2)) (z 3) (z 4)).
let X. let C. let R. let c. assume _. let d. assume _.
prove pack_c_r_e_e X C R c d = pack_c_r_e_e (pack_c_r_e_e X C R c d 0) (decode_c (pack_c_r_e_e X C R c d 1)) (decode_r (pack_c_r_e_e X C R c d 2)) (pack_c_r_e_e X C R c d 3) (pack_c_r_e_e X C R c d 4).
rewrite <- pack_c_r_e_e_0_eq2 X C R c d.
rewrite <- pack_c_r_e_e_3_eq2 X C R c d.
rewrite <- pack_c_r_e_e_4_eq2 X C R c d.
apply pack_c_r_e_e_ext.
- let U. assume HU.
  rewrite <- pack_c_r_e_e_1_eq2 X C R c d U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_r_e_e_2_eq2 X C R c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_r_e_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)) (S 3) (S 4).

Theorem unpack_c_r_e_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' R' c d = Phi X C R c d)
  ->
  unpack_c_r_e_e_i (pack_c_r_e_e X C R c d) Phi = Phi X C R c d.
let Phi X C R c d.
assume HPhi.
prove Phi (pack_c_r_e_e X C R c d 0) (decode_c (pack_c_r_e_e X C R c d 1)) (decode_r (pack_c_r_e_e X C R c d 2)) (pack_c_r_e_e X C R c d 3) (pack_c_r_e_e X C R c d 4) = Phi X C R c d.
rewrite <- pack_c_r_e_e_0_eq2 X C R c d.
prove Phi X (decode_c (pack_c_r_e_e X C R c d 1)) (decode_r (pack_c_r_e_e X C R c d 2)) (pack_c_r_e_e X C R c d 3) (pack_c_r_e_e X C R c d 4) = Phi X C R c d.
rewrite <- pack_c_r_e_e_3_eq2 X C R c d.
rewrite <- pack_c_r_e_e_4_eq2 X C R c d.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r_e_e X C R c d 1) U.
  rewrite <- pack_c_r_e_e_1_eq2 X C R c d U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r_e_e X C R c d 2) x y.
  rewrite <- pack_c_r_e_e_2_eq2 X C R c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_r_e_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)) (S 3) (S 4).

Theorem unpack_c_r_e_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall d:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' R' c d = Phi X C R c d)
  ->
  unpack_c_r_e_e_o (pack_c_r_e_e X C R c d) Phi = Phi X C R c d.
let Phi X C R c d.
assume HPhi.
prove Phi (pack_c_r_e_e X C R c d 0) (decode_c (pack_c_r_e_e X C R c d 1)) (decode_r (pack_c_r_e_e X C R c d 2)) (pack_c_r_e_e X C R c d 3) (pack_c_r_e_e X C R c d 4) = Phi X C R c d.
rewrite <- pack_c_r_e_e_0_eq2 X C R c d.
prove Phi X (decode_c (pack_c_r_e_e X C R c d 1)) (decode_r (pack_c_r_e_e X C R c d 2)) (pack_c_r_e_e X C R c d 3) (pack_c_r_e_e X C R c d 4) = Phi X C R c d.
rewrite <- pack_c_r_e_e_3_eq2 X C R c d.
rewrite <- pack_c_r_e_e_4_eq2 X C R c d.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r_e_e X C R c d 1) U.
  rewrite <- pack_c_r_e_e_1_eq2 X C R c d U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r_e_e X C R c d 2) x y.
  rewrite <- pack_c_r_e_e_2_eq2 X C R c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_c_p_e_e : set -> ((set -> prop) -> prop) -> (set -> prop) -> set -> set -> set := fun X C P c d => (X,encode_c X C,encode_p X P,c,d).

Theorem pack_c_p_e_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, S = pack_c_p_e_e X C P c d -> X = S 0.
let S X C P c d. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_p X P,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_c_p_e_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, X = pack_c_p_e_e X C P c d 0.
let X C P c d. apply pack_c_p_e_e_0_eq (pack_c_p_e_e X C P c d) X C P c d. reflexivity.
Qed.

Theorem pack_c_p_e_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, S = pack_c_p_e_e X C P c d -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C P c d. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_p X P,c,d) 1) U.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_p_e_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_p_e_e X C P c d 1) U.
let X C P c d. apply pack_c_p_e_e_1_eq (pack_c_p_e_e X C P c d) X C P c d. reflexivity.
Qed.

Theorem pack_c_p_e_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, S = pack_c_p_e_e X C P c d -> forall x :e X, P x = decode_p (S 2) x.
let S X C P c d. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_p X P,c,d) 2) x.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_p_e_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, forall x :e X, P x = decode_p (pack_c_p_e_e X C P c d 2) x.
let X C P c d. apply pack_c_p_e_e_2_eq (pack_c_p_e_e X C P c d) X C P c d. reflexivity.
Qed.

Theorem pack_c_p_e_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, S = pack_c_p_e_e X C P c d -> c = S 3.
let S X C P c d. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_p X P,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_c_p_e_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, c = pack_c_p_e_e X C P c d 3.
let X C P c d. apply pack_c_p_e_e_3_eq (pack_c_p_e_e X C P c d) X C P c d. reflexivity.
Qed.

Theorem pack_c_p_e_e_4_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, S = pack_c_p_e_e X C P c d -> d = S 4.
let S X C P c d. assume H1.
rewrite H1. prove d = (X,encode_c X C,encode_p X P,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_c_p_e_e_4_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, d = pack_c_p_e_e X C P c d 4.
let X C P c d. apply pack_c_p_e_e_4_eq (pack_c_p_e_e X C P c d) X C P c d. reflexivity.
Qed.

Theorem pack_c_p_e_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall P P':set -> prop, forall c c':set, forall d d':set, pack_c_p_e_e X C P c d = pack_c_p_e_e X' C' P' c' d' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, P x = P' x) /\ c = c' /\ d = d'.
let X X' C C' P P' c c' d d'. assume H1.
claim L0: X' = pack_c_p_e_e X C P c d 0.
{ exact pack_c_p_e_e_0_eq (pack_c_p_e_e X C P c d) X' C' P' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_p_e_e_0_eq2 X C P c d. }
apply and5I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_p_e_e_1_eq2 X C P c d U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_p_e_e_1_eq2 X' C' P' c' d' U LU.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_p_e_e_2_eq2 X C P c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_p_e_e_2_eq2 X' C' P' c' d' x Lx.
- prove c = c'.
  rewrite pack_c_p_e_e_3_eq2 X C P c d.
  rewrite H1. symmetry.
  exact pack_c_p_e_e_3_eq2 X' C' P' c' d'.
- prove d = d'.
  rewrite pack_c_p_e_e_4_eq2 X C P c d.
  rewrite H1. symmetry.
  exact pack_c_p_e_e_4_eq2 X' C' P' c' d'.
Qed.

Theorem pack_c_p_e_e_ext : forall X, forall C C':(set -> prop) -> prop, forall P P':set -> prop, forall c, forall d,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_p_e_e X C P c d = pack_c_p_e_e X C' P' c d.
let X C C' P P' c d. assume H1. assume H2.
prove (X,encode_c X C,encode_p X P,c,d) = (X,encode_c X C',encode_p X P',c,d).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_p_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> q (pack_c_p_e_e X C P c d)) -> q S.

Theorem pack_struct_c_p_e_e_I: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> struct_c_p_e_e (pack_c_p_e_e X C P c d).
let X C P c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X C P c Hc d Hd.
Qed.

Theorem pack_struct_c_p_e_e_E3: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, struct_c_p_e_e (pack_c_p_e_e X C P c d) -> c :e X.
let X C P c d. assume H1. apply H1 (fun z => z = pack_c_p_e_e X C P c d -> c :e X).
- let X'. let C'. let P'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_c_p_e_e X' C' P' c' d' = pack_c_p_e_e X C P c d.
  apply pack_c_p_e_e_inj X' X C' C P' P c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C HP'P Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_c_p_e_e_E4: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set, struct_c_p_e_e (pack_c_p_e_e X C P c d) -> d :e X.
let X C P c d. assume H1. apply H1 (fun z => z = pack_c_p_e_e X C P c d -> d :e X).
- let X'. let C'. let P'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_c_p_e_e X' C' P' c' d' = pack_c_p_e_e X C P c d.
  apply pack_c_p_e_e_inj X' X C' C P' P c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C HP'P Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_c_p_e_e_eta: forall S, struct_c_p_e_e S -> S = pack_c_p_e_e (S 0) (decode_c (S 1)) (decode_p (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_c_p_e_e (z 0) (decode_c (z 1)) (decode_p (z 2)) (z 3) (z 4)).
let X. let C. let P. let c. assume _. let d. assume _.
prove pack_c_p_e_e X C P c d = pack_c_p_e_e (pack_c_p_e_e X C P c d 0) (decode_c (pack_c_p_e_e X C P c d 1)) (decode_p (pack_c_p_e_e X C P c d 2)) (pack_c_p_e_e X C P c d 3) (pack_c_p_e_e X C P c d 4).
rewrite <- pack_c_p_e_e_0_eq2 X C P c d.
rewrite <- pack_c_p_e_e_3_eq2 X C P c d.
rewrite <- pack_c_p_e_e_4_eq2 X C P c d.
apply pack_c_p_e_e_ext.
- let U. assume HU.
  rewrite <- pack_c_p_e_e_1_eq2 X C P c d U HU.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_p_e_e_2_eq2 X C P c d x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_p_e_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> prop) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_p (S 2)) (S 3) (S 4).

Theorem unpack_c_p_e_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> prop) -> set -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' P' c d = Phi X C P c d)
  ->
  unpack_c_p_e_e_i (pack_c_p_e_e X C P c d) Phi = Phi X C P c d.
let Phi X C P c d.
assume HPhi.
prove Phi (pack_c_p_e_e X C P c d 0) (decode_c (pack_c_p_e_e X C P c d 1)) (decode_p (pack_c_p_e_e X C P c d 2)) (pack_c_p_e_e X C P c d 3) (pack_c_p_e_e X C P c d 4) = Phi X C P c d.
rewrite <- pack_c_p_e_e_0_eq2 X C P c d.
prove Phi X (decode_c (pack_c_p_e_e X C P c d 1)) (decode_p (pack_c_p_e_e X C P c d 2)) (pack_c_p_e_e X C P c d 3) (pack_c_p_e_e X C P c d 4) = Phi X C P c d.
rewrite <- pack_c_p_e_e_3_eq2 X C P c d.
rewrite <- pack_c_p_e_e_4_eq2 X C P c d.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_p_e_e X C P c d 1) U.
  rewrite <- pack_c_p_e_e_1_eq2 X C P c d U HU.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_p_e_e X C P c d 2) x.
  rewrite <- pack_c_p_e_e_2_eq2 X C P c d x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_p_e_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> prop) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_p (S 2)) (S 3) (S 4).

Theorem unpack_c_p_e_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> prop) -> set -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall d:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' P' c d = Phi X C P c d)
  ->
  unpack_c_p_e_e_o (pack_c_p_e_e X C P c d) Phi = Phi X C P c d.
let Phi X C P c d.
assume HPhi.
prove Phi (pack_c_p_e_e X C P c d 0) (decode_c (pack_c_p_e_e X C P c d 1)) (decode_p (pack_c_p_e_e X C P c d 2)) (pack_c_p_e_e X C P c d 3) (pack_c_p_e_e X C P c d 4) = Phi X C P c d.
rewrite <- pack_c_p_e_e_0_eq2 X C P c d.
prove Phi X (decode_c (pack_c_p_e_e X C P c d 1)) (decode_p (pack_c_p_e_e X C P c d 2)) (pack_c_p_e_e X C P c d 3) (pack_c_p_e_e X C P c d 4) = Phi X C P c d.
rewrite <- pack_c_p_e_e_3_eq2 X C P c d.
rewrite <- pack_c_p_e_e_4_eq2 X C P c d.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_p_e_e X C P c d 1) U.
  rewrite <- pack_c_p_e_e_1_eq2 X C P c d U HU.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_p_e_e X C P c d 2) x.
  rewrite <- pack_c_p_e_e_2_eq2 X C P c d x Hx.
  apply iff_refl.
Qed.


Definition pack_b_b_b_u : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set := fun X f g h i => (X,encode_b X f,encode_b X g,encode_b X h,encode_u X i).

Theorem pack_b_b_b_u_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, S = pack_b_b_b_u X f g h i -> X = S 0.
let S X f g h i. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_b X h,encode_u X i) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_b_u_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, X = pack_b_b_b_u X f g h i 0.
let X f g h i. apply pack_b_b_b_u_0_eq (pack_b_b_b_u X f g h i) X f g h i. reflexivity.
Qed.

Theorem pack_b_b_b_u_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, S = pack_b_b_b_u X f g h i -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g h i. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,encode_u X i) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_b_u_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, forall x y :e X, f x y = decode_b (pack_b_b_b_u X f g h i 1) x y.
let X f g h i. apply pack_b_b_b_u_1_eq (pack_b_b_b_u X f g h i) X f g h i. reflexivity.
Qed.

Theorem pack_b_b_b_u_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, S = pack_b_b_b_u X f g h i -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g h i. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,encode_u X i) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_b_u_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, forall x y :e X, g x y = decode_b (pack_b_b_b_u X f g h i 2) x y.
let X f g h i. apply pack_b_b_b_u_2_eq (pack_b_b_b_u X f g h i) X f g h i. reflexivity.
Qed.

Theorem pack_b_b_b_u_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, S = pack_b_b_b_u X f g h i -> forall x y :e X, h x y = decode_b (S 3) x y.
let S X f g h i. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove h x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,encode_u X i) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_b X h x Hx y Hy.
Qed.

Theorem pack_b_b_b_u_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, forall x y :e X, h x y = decode_b (pack_b_b_b_u X f g h i 3) x y.
let X f g h i. apply pack_b_b_b_u_3_eq (pack_b_b_b_u X f g h i) X f g h i. reflexivity.
Qed.

Theorem pack_b_b_b_u_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, S = pack_b_b_b_u X f g h i -> forall x :e X, i x = decode_u (S 4) x.
let S X f g h i. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_b X g,encode_b X h,encode_u X i) 4) x.
rewrite tuple_5_4_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_b_b_u_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, forall x :e X, i x = decode_u (pack_b_b_b_u X f g h i 4) x.
let X f g h i. apply pack_b_b_b_u_4_eq (pack_b_b_b_u X f g h i) X f g h i. reflexivity.
Qed.

Theorem pack_b_b_b_u_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall h h':set -> set -> set, forall i i':set -> set, pack_b_b_b_u X f g h i = pack_b_b_b_u X' f' g' h' i' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x y :e X, h x y = h' x y) /\ (forall x :e X, i x = i' x).
let X X' f f' g g' h h' i i'. assume H1.
claim L0: X' = pack_b_b_b_u X f g h i 0.
{ exact pack_b_b_b_u_0_eq (pack_b_b_b_u X f g h i) X' f' g' h' i' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_b_u_0_eq2 X f g h i. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_b_u_1_eq2 X f g h i x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_u_1_eq2 X' f' g' h' i' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_b_u_2_eq2 X f g h i x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_u_2_eq2 X' f' g' h' i' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove h x y = h' x y.
  rewrite pack_b_b_b_u_3_eq2 X f g h i x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_u_3_eq2 X' f' g' h' i' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_b_b_u_4_eq2 X f g h i x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_b_u_4_eq2 X' f' g' h' i' x Lx.
Qed.

Theorem pack_b_b_b_u_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall h h':set -> set -> set, forall i i':set -> set,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x y :e X, h x y = h' x y) ->
 (forall x :e X, i x = i' x) ->
 pack_b_b_b_u X f g h i = pack_b_b_b_u X f' g' h' i'.
let X f f' g g' h h' i i'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_b X g,encode_b X h,encode_u X i) = (X,encode_b X f',encode_b X g',encode_b X h',encode_u X i').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_b X h = encode_b X h'.
{ apply encode_b_ext. exact H3. }
rewrite <- L3.
claim L4: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_b_b_u : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall h:set -> set -> set, (forall x y :e X, h x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> q (pack_b_b_b_u X f g h i)) -> q S.

Theorem pack_struct_b_b_b_u_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall h:set -> set -> set, (forall x y :e X, h x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> struct_b_b_b_u (pack_b_b_b_u X f g h i).
let X f. assume Hf. let g. assume Hg. let h. assume Hh. let i. assume Hi. let q. assume Hq.
exact Hq X f Hf g Hg h Hh i Hi.
Qed.

Theorem pack_struct_b_b_b_u_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, struct_b_b_b_u (pack_b_b_b_u X f g h i) -> forall x y :e X, f x y :e X.
let X f g h i. assume H1. apply H1 (fun z => z = pack_b_b_b_u X f g h i -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let i'. assume Hi'.
  assume Heq: pack_b_b_b_u X' f' g' h' i' = pack_b_b_b_u X f g h i.
  apply pack_b_b_b_u_inj X' X f' f g' g h' h i' i Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h Hi'i.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_u_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, struct_b_b_b_u (pack_b_b_b_u X f g h i) -> forall x y :e X, g x y :e X.
let X f g h i. assume H1. apply H1 (fun z => z = pack_b_b_b_u X f g h i -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let i'. assume Hi'.
  assume Heq: pack_b_b_b_u X' f' g' h' i' = pack_b_b_b_u X f g h i.
  apply pack_b_b_b_u_inj X' X f' f g' g h' h i' i Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h Hi'i.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_u_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, struct_b_b_b_u (pack_b_b_b_u X f g h i) -> forall x y :e X, h x y :e X.
let X f g h i. assume H1. apply H1 (fun z => z = pack_b_b_b_u X f g h i -> forall x y :e X, h x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let i'. assume Hi'.
  assume Heq: pack_b_b_b_u X' f' g' h' i' = pack_b_b_b_u X f g h i.
  apply pack_b_b_b_u_inj X' X f' f g' g h' h i' i Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h Hi'i.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hh'h x Hx y Hy.  exact Hh' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_u_E4: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set, struct_b_b_b_u (pack_b_b_b_u X f g h i) -> forall x :e X, i x :e X.
let X f g h i. assume H1. apply H1 (fun z => z = pack_b_b_b_u X f g h i -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let i'. assume Hi'.
  assume Heq: pack_b_b_b_u X' f' g' h' i' = pack_b_b_b_u X f g h i.
  apply pack_b_b_b_u_inj X' X f' f g' g h' h i' i Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h Hi'i.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_b_b_b_u_eta: forall S, struct_b_b_b_u S -> S = pack_b_b_b_u (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (decode_u (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_b_u (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_b (z 3)) (decode_u (z 4))).
let X. let f. assume _. let g. assume _. let h. assume _. let i. assume _.
prove pack_b_b_b_u X f g h i = pack_b_b_b_u (pack_b_b_b_u X f g h i 0) (decode_b (pack_b_b_b_u X f g h i 1)) (decode_b (pack_b_b_b_u X f g h i 2)) (decode_b (pack_b_b_b_u X f g h i 3)) (decode_u (pack_b_b_b_u X f g h i 4)).
rewrite <- pack_b_b_b_u_0_eq2 X f g h i.
apply pack_b_b_b_u_ext.
- exact pack_b_b_b_u_1_eq2 X f g h i.
- exact pack_b_b_b_u_2_eq2 X f g h i.
- exact pack_b_b_b_u_3_eq2 X f g h i.
- exact pack_b_b_b_u_4_eq2 X f g h i.
Qed.


Definition unpack_b_b_b_u_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (decode_u (S 4)).

Theorem unpack_b_b_b_u_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall h':set -> set -> set, (forall x y :e X, h x y = h' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' g' h' i' = Phi X f g h i)
  ->
  unpack_b_b_b_u_i (pack_b_b_b_u X f g h i) Phi = Phi X f g h i.
let Phi X f g h i.
assume HPhi.
prove Phi (pack_b_b_b_u X f g h i 0) (decode_b (pack_b_b_b_u X f g h i 1)) (decode_b (pack_b_b_b_u X f g h i 2)) (decode_b (pack_b_b_b_u X f g h i 3)) (decode_u (pack_b_b_b_u X f g h i 4)) = Phi X f g h i.
rewrite <- pack_b_b_b_u_0_eq2 X f g h i.
prove Phi X (decode_b (pack_b_b_b_u X f g h i 1)) (decode_b (pack_b_b_b_u X f g h i 2)) (decode_b (pack_b_b_b_u X f g h i 3)) (decode_u (pack_b_b_b_u X f g h i 4)) = Phi X f g h i.
apply HPhi.
- exact pack_b_b_b_u_1_eq2 X f g h i.
- exact pack_b_b_b_u_2_eq2 X f g h i.
- exact pack_b_b_b_u_3_eq2 X f g h i.
- exact pack_b_b_b_u_4_eq2 X f g h i.
Qed.


Definition unpack_b_b_b_u_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (decode_u (S 4)).

Theorem unpack_b_b_b_u_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall i:set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall h':set -> set -> set, (forall x y :e X, h x y = h' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' g' h' i' = Phi X f g h i)
  ->
  unpack_b_b_b_u_o (pack_b_b_b_u X f g h i) Phi = Phi X f g h i.
let Phi X f g h i.
assume HPhi.
prove Phi (pack_b_b_b_u X f g h i 0) (decode_b (pack_b_b_b_u X f g h i 1)) (decode_b (pack_b_b_b_u X f g h i 2)) (decode_b (pack_b_b_b_u X f g h i 3)) (decode_u (pack_b_b_b_u X f g h i 4)) = Phi X f g h i.
rewrite <- pack_b_b_b_u_0_eq2 X f g h i.
prove Phi X (decode_b (pack_b_b_b_u X f g h i 1)) (decode_b (pack_b_b_b_u X f g h i 2)) (decode_b (pack_b_b_b_u X f g h i 3)) (decode_u (pack_b_b_b_u X f g h i 4)) = Phi X f g h i.
apply HPhi.
- exact pack_b_b_b_u_1_eq2 X f g h i.
- exact pack_b_b_b_u_2_eq2 X f g h i.
- exact pack_b_b_b_u_3_eq2 X f g h i.
- exact pack_b_b_b_u_4_eq2 X f g h i.
Qed.


Definition pack_b_b_b_r : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set := fun X f g h R => (X,encode_b X f,encode_b X g,encode_b X h,encode_r X R).

Theorem pack_b_b_b_r_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, S = pack_b_b_b_r X f g h R -> X = S 0.
let S X f g h R. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_b X h,encode_r X R) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_b_r_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, X = pack_b_b_b_r X f g h R 0.
let X f g h R. apply pack_b_b_b_r_0_eq (pack_b_b_b_r X f g h R) X f g h R. reflexivity.
Qed.

Theorem pack_b_b_b_r_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, S = pack_b_b_b_r X f g h R -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g h R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,encode_r X R) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_b_r_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, f x y = decode_b (pack_b_b_b_r X f g h R 1) x y.
let X f g h R. apply pack_b_b_b_r_1_eq (pack_b_b_b_r X f g h R) X f g h R. reflexivity.
Qed.

Theorem pack_b_b_b_r_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, S = pack_b_b_b_r X f g h R -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g h R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,encode_r X R) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_b_r_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, g x y = decode_b (pack_b_b_b_r X f g h R 2) x y.
let X f g h R. apply pack_b_b_b_r_2_eq (pack_b_b_b_r X f g h R) X f g h R. reflexivity.
Qed.

Theorem pack_b_b_b_r_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, S = pack_b_b_b_r X f g h R -> forall x y :e X, h x y = decode_b (S 3) x y.
let S X f g h R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove h x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,encode_r X R) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_b X h x Hx y Hy.
Qed.

Theorem pack_b_b_b_r_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, h x y = decode_b (pack_b_b_b_r X f g h R 3) x y.
let X f g h R. apply pack_b_b_b_r_3_eq (pack_b_b_b_r X f g h R) X f g h R. reflexivity.
Qed.

Theorem pack_b_b_b_r_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, S = pack_b_b_b_r X f g h R -> forall x y :e X, R x y = decode_r (S 4) x y.
let S X f g h R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_b X g,encode_b X h,encode_r X R) 4) x y.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_b_b_r_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_b_b_b_r X f g h R 4) x y.
let X f g h R. apply pack_b_b_b_r_4_eq (pack_b_b_b_r X f g h R) X f g h R. reflexivity.
Qed.

Theorem pack_b_b_b_r_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall h h':set -> set -> set, forall R R':set -> set -> prop, pack_b_b_b_r X f g h R = pack_b_b_b_r X' f' g' h' R' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x y :e X, h x y = h' x y) /\ (forall x y :e X, R x y = R' x y).
let X X' f f' g g' h h' R R'. assume H1.
claim L0: X' = pack_b_b_b_r X f g h R 0.
{ exact pack_b_b_b_r_0_eq (pack_b_b_b_r X f g h R) X' f' g' h' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_b_r_0_eq2 X f g h R. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_b_r_1_eq2 X f g h R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_r_1_eq2 X' f' g' h' R' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_b_r_2_eq2 X f g h R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_r_2_eq2 X' f' g' h' R' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove h x y = h' x y.
  rewrite pack_b_b_b_r_3_eq2 X f g h R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_r_3_eq2 X' f' g' h' R' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_b_b_r_4_eq2 X f g h R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_r_4_eq2 X' f' g' h' R' x Lx y Ly.
Qed.

Theorem pack_b_b_b_r_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall h h':set -> set -> set, forall R R':set -> set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x y :e X, h x y = h' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_b_b_b_r X f g h R = pack_b_b_b_r X f' g' h' R'.
let X f f' g g' h h' R R'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_b X g,encode_b X h,encode_r X R) = (X,encode_b X f',encode_b X g',encode_b X h',encode_r X R').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_b X h = encode_b X h'.
{ apply encode_b_ext. exact H3. }
rewrite <- L3.
claim L4: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_b_b_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall h:set -> set -> set, (forall x y :e X, h x y :e X) -> forall R:set -> set -> prop, q (pack_b_b_b_r X f g h R)) -> q S.

Theorem pack_struct_b_b_b_r_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall h:set -> set -> set, (forall x y :e X, h x y :e X) -> forall R:set -> set -> prop, struct_b_b_b_r (pack_b_b_b_r X f g h R).
let X f. assume Hf. let g. assume Hg. let h. assume Hh. let R q. assume Hq.
exact Hq X f Hf g Hg h Hh R.
Qed.

Theorem pack_struct_b_b_b_r_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, struct_b_b_b_r (pack_b_b_b_r X f g h R) -> forall x y :e X, f x y :e X.
let X f g h R. assume H1. apply H1 (fun z => z = pack_b_b_b_r X f g h R -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let R'.
  assume Heq: pack_b_b_b_r X' f' g' h' R' = pack_b_b_b_r X f g h R.
  apply pack_b_b_b_r_inj X' X f' f g' g h' h R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_r_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, struct_b_b_b_r (pack_b_b_b_r X f g h R) -> forall x y :e X, g x y :e X.
let X f g h R. assume H1. apply H1 (fun z => z = pack_b_b_b_r X f g h R -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let R'.
  assume Heq: pack_b_b_b_r X' f' g' h' R' = pack_b_b_b_r X f g h R.
  apply pack_b_b_b_r_inj X' X f' f g' g h' h R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_r_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop, struct_b_b_b_r (pack_b_b_b_r X f g h R) -> forall x y :e X, h x y :e X.
let X f g h R. assume H1. apply H1 (fun z => z = pack_b_b_b_r X f g h R -> forall x y :e X, h x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let R'.
  assume Heq: pack_b_b_b_r X' f' g' h' R' = pack_b_b_b_r X f g h R.
  apply pack_b_b_b_r_inj X' X f' f g' g h' h R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hh'h x Hx y Hy.  exact Hh' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_b_b_r_eta: forall S, struct_b_b_b_r S -> S = pack_b_b_b_r (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (decode_r (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_b_r (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_b (z 3)) (decode_r (z 4))).
let X. let f. assume _. let g. assume _. let h. assume _. let R.
prove pack_b_b_b_r X f g h R = pack_b_b_b_r (pack_b_b_b_r X f g h R 0) (decode_b (pack_b_b_b_r X f g h R 1)) (decode_b (pack_b_b_b_r X f g h R 2)) (decode_b (pack_b_b_b_r X f g h R 3)) (decode_r (pack_b_b_b_r X f g h R 4)).
rewrite <- pack_b_b_b_r_0_eq2 X f g h R.
apply pack_b_b_b_r_ext.
- exact pack_b_b_b_r_1_eq2 X f g h R.
- exact pack_b_b_b_r_2_eq2 X f g h R.
- exact pack_b_b_b_r_3_eq2 X f g h R.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_b_b_r_4_eq2 X f g h R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_b_b_r_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (decode_r (S 4)).

Theorem unpack_b_b_b_r_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall h':set -> set -> set, (forall x y :e X, h x y = h' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' g' h' R' = Phi X f g h R)
  ->
  unpack_b_b_b_r_i (pack_b_b_b_r X f g h R) Phi = Phi X f g h R.
let Phi X f g h R.
assume HPhi.
prove Phi (pack_b_b_b_r X f g h R 0) (decode_b (pack_b_b_b_r X f g h R 1)) (decode_b (pack_b_b_b_r X f g h R 2)) (decode_b (pack_b_b_b_r X f g h R 3)) (decode_r (pack_b_b_b_r X f g h R 4)) = Phi X f g h R.
rewrite <- pack_b_b_b_r_0_eq2 X f g h R.
prove Phi X (decode_b (pack_b_b_b_r X f g h R 1)) (decode_b (pack_b_b_b_r X f g h R 2)) (decode_b (pack_b_b_b_r X f g h R 3)) (decode_r (pack_b_b_b_r X f g h R 4)) = Phi X f g h R.
apply HPhi.
- exact pack_b_b_b_r_1_eq2 X f g h R.
- exact pack_b_b_b_r_2_eq2 X f g h R.
- exact pack_b_b_b_r_3_eq2 X f g h R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_b_r X f g h R 4) x y.
  rewrite <- pack_b_b_b_r_4_eq2 X f g h R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_b_b_r_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (decode_r (S 4)).

Theorem unpack_b_b_b_r_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall R:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall h':set -> set -> set, (forall x y :e X, h x y = h' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' g' h' R' = Phi X f g h R)
  ->
  unpack_b_b_b_r_o (pack_b_b_b_r X f g h R) Phi = Phi X f g h R.
let Phi X f g h R.
assume HPhi.
prove Phi (pack_b_b_b_r X f g h R 0) (decode_b (pack_b_b_b_r X f g h R 1)) (decode_b (pack_b_b_b_r X f g h R 2)) (decode_b (pack_b_b_b_r X f g h R 3)) (decode_r (pack_b_b_b_r X f g h R 4)) = Phi X f g h R.
rewrite <- pack_b_b_b_r_0_eq2 X f g h R.
prove Phi X (decode_b (pack_b_b_b_r X f g h R 1)) (decode_b (pack_b_b_b_r X f g h R 2)) (decode_b (pack_b_b_b_r X f g h R 3)) (decode_r (pack_b_b_b_r X f g h R 4)) = Phi X f g h R.
apply HPhi.
- exact pack_b_b_b_r_1_eq2 X f g h R.
- exact pack_b_b_b_r_2_eq2 X f g h R.
- exact pack_b_b_b_r_3_eq2 X f g h R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_b_r X f g h R 4) x y.
  rewrite <- pack_b_b_b_r_4_eq2 X f g h R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_b_b_p : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set := fun X f g h P => (X,encode_b X f,encode_b X g,encode_b X h,encode_p X P).

Theorem pack_b_b_b_p_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, S = pack_b_b_b_p X f g h P -> X = S 0.
let S X f g h P. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_b X h,encode_p X P) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_b_p_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, X = pack_b_b_b_p X f g h P 0.
let X f g h P. apply pack_b_b_b_p_0_eq (pack_b_b_b_p X f g h P) X f g h P. reflexivity.
Qed.

Theorem pack_b_b_b_p_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, S = pack_b_b_b_p X f g h P -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g h P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,encode_p X P) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_b_p_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_b_b_b_p X f g h P 1) x y.
let X f g h P. apply pack_b_b_b_p_1_eq (pack_b_b_b_p X f g h P) X f g h P. reflexivity.
Qed.

Theorem pack_b_b_b_p_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, S = pack_b_b_b_p X f g h P -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g h P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,encode_p X P) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_b_p_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, forall x y :e X, g x y = decode_b (pack_b_b_b_p X f g h P 2) x y.
let X f g h P. apply pack_b_b_b_p_2_eq (pack_b_b_b_p X f g h P) X f g h P. reflexivity.
Qed.

Theorem pack_b_b_b_p_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, S = pack_b_b_b_p X f g h P -> forall x y :e X, h x y = decode_b (S 3) x y.
let S X f g h P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove h x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,encode_p X P) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_b X h x Hx y Hy.
Qed.

Theorem pack_b_b_b_p_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, forall x y :e X, h x y = decode_b (pack_b_b_b_p X f g h P 3) x y.
let X f g h P. apply pack_b_b_b_p_3_eq (pack_b_b_b_p X f g h P) X f g h P. reflexivity.
Qed.

Theorem pack_b_b_b_p_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, S = pack_b_b_b_p X f g h P -> forall x :e X, P x = decode_p (S 4) x.
let S X f g h P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_b X g,encode_b X h,encode_p X P) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_b_b_p_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, forall x :e X, P x = decode_p (pack_b_b_b_p X f g h P 4) x.
let X f g h P. apply pack_b_b_b_p_4_eq (pack_b_b_b_p X f g h P) X f g h P. reflexivity.
Qed.

Theorem pack_b_b_b_p_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall h h':set -> set -> set, forall P P':set -> prop, pack_b_b_b_p X f g h P = pack_b_b_b_p X' f' g' h' P' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x y :e X, h x y = h' x y) /\ (forall x :e X, P x = P' x).
let X X' f f' g g' h h' P P'. assume H1.
claim L0: X' = pack_b_b_b_p X f g h P 0.
{ exact pack_b_b_b_p_0_eq (pack_b_b_b_p X f g h P) X' f' g' h' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_b_p_0_eq2 X f g h P. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_b_p_1_eq2 X f g h P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_p_1_eq2 X' f' g' h' P' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_b_p_2_eq2 X f g h P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_p_2_eq2 X' f' g' h' P' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove h x y = h' x y.
  rewrite pack_b_b_b_p_3_eq2 X f g h P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_p_3_eq2 X' f' g' h' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_b_b_p_4_eq2 X f g h P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_b_p_4_eq2 X' f' g' h' P' x Lx.
Qed.

Theorem pack_b_b_b_p_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall h h':set -> set -> set, forall P P':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x y :e X, h x y = h' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_b_b_p X f g h P = pack_b_b_b_p X f' g' h' P'.
let X f f' g g' h h' P P'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_b X g,encode_b X h,encode_p X P) = (X,encode_b X f',encode_b X g',encode_b X h',encode_p X P').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_b X h = encode_b X h'.
{ apply encode_b_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_b_b_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall h:set -> set -> set, (forall x y :e X, h x y :e X) -> forall P:set -> prop, q (pack_b_b_b_p X f g h P)) -> q S.

Theorem pack_struct_b_b_b_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall h:set -> set -> set, (forall x y :e X, h x y :e X) -> forall P:set -> prop, struct_b_b_b_p (pack_b_b_b_p X f g h P).
let X f. assume Hf. let g. assume Hg. let h. assume Hh. let P q. assume Hq.
exact Hq X f Hf g Hg h Hh P.
Qed.

Theorem pack_struct_b_b_b_p_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, struct_b_b_b_p (pack_b_b_b_p X f g h P) -> forall x y :e X, f x y :e X.
let X f g h P. assume H1. apply H1 (fun z => z = pack_b_b_b_p X f g h P -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let P'.
  assume Heq: pack_b_b_b_p X' f' g' h' P' = pack_b_b_b_p X f g h P.
  apply pack_b_b_b_p_inj X' X f' f g' g h' h P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_p_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, struct_b_b_b_p (pack_b_b_b_p X f g h P) -> forall x y :e X, g x y :e X.
let X f g h P. assume H1. apply H1 (fun z => z = pack_b_b_b_p X f g h P -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let P'.
  assume Heq: pack_b_b_b_p X' f' g' h' P' = pack_b_b_b_p X f g h P.
  apply pack_b_b_b_p_inj X' X f' f g' g h' h P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_p_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop, struct_b_b_b_p (pack_b_b_b_p X f g h P) -> forall x y :e X, h x y :e X.
let X f g h P. assume H1. apply H1 (fun z => z = pack_b_b_b_p X f g h P -> forall x y :e X, h x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let P'.
  assume Heq: pack_b_b_b_p X' f' g' h' P' = pack_b_b_b_p X f g h P.
  apply pack_b_b_b_p_inj X' X f' f g' g h' h P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hh'h x Hx y Hy.  exact Hh' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_b_b_p_eta: forall S, struct_b_b_b_p S -> S = pack_b_b_b_p (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_b_p (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_b (z 3)) (decode_p (z 4))).
let X. let f. assume _. let g. assume _. let h. assume _. let P.
prove pack_b_b_b_p X f g h P = pack_b_b_b_p (pack_b_b_b_p X f g h P 0) (decode_b (pack_b_b_b_p X f g h P 1)) (decode_b (pack_b_b_b_p X f g h P 2)) (decode_b (pack_b_b_b_p X f g h P 3)) (decode_p (pack_b_b_b_p X f g h P 4)).
rewrite <- pack_b_b_b_p_0_eq2 X f g h P.
apply pack_b_b_b_p_ext.
- exact pack_b_b_b_p_1_eq2 X f g h P.
- exact pack_b_b_b_p_2_eq2 X f g h P.
- exact pack_b_b_b_p_3_eq2 X f g h P.
- let x. assume Hx.
  rewrite <- pack_b_b_b_p_4_eq2 X f g h P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_b_p_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (decode_p (S 4)).

Theorem unpack_b_b_b_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall h':set -> set -> set, (forall x y :e X, h x y = h' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' g' h' P' = Phi X f g h P)
  ->
  unpack_b_b_b_p_i (pack_b_b_b_p X f g h P) Phi = Phi X f g h P.
let Phi X f g h P.
assume HPhi.
prove Phi (pack_b_b_b_p X f g h P 0) (decode_b (pack_b_b_b_p X f g h P 1)) (decode_b (pack_b_b_b_p X f g h P 2)) (decode_b (pack_b_b_b_p X f g h P 3)) (decode_p (pack_b_b_b_p X f g h P 4)) = Phi X f g h P.
rewrite <- pack_b_b_b_p_0_eq2 X f g h P.
prove Phi X (decode_b (pack_b_b_b_p X f g h P 1)) (decode_b (pack_b_b_b_p X f g h P 2)) (decode_b (pack_b_b_b_p X f g h P 3)) (decode_p (pack_b_b_b_p X f g h P 4)) = Phi X f g h P.
apply HPhi.
- exact pack_b_b_b_p_1_eq2 X f g h P.
- exact pack_b_b_b_p_2_eq2 X f g h P.
- exact pack_b_b_b_p_3_eq2 X f g h P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_b_p X f g h P 4) x.
  rewrite <- pack_b_b_b_p_4_eq2 X f g h P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_b_p_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (decode_p (S 4)).

Theorem unpack_b_b_b_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall h':set -> set -> set, (forall x y :e X, h x y = h' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' g' h' P' = Phi X f g h P)
  ->
  unpack_b_b_b_p_o (pack_b_b_b_p X f g h P) Phi = Phi X f g h P.
let Phi X f g h P.
assume HPhi.
prove Phi (pack_b_b_b_p X f g h P 0) (decode_b (pack_b_b_b_p X f g h P 1)) (decode_b (pack_b_b_b_p X f g h P 2)) (decode_b (pack_b_b_b_p X f g h P 3)) (decode_p (pack_b_b_b_p X f g h P 4)) = Phi X f g h P.
rewrite <- pack_b_b_b_p_0_eq2 X f g h P.
prove Phi X (decode_b (pack_b_b_b_p X f g h P 1)) (decode_b (pack_b_b_b_p X f g h P 2)) (decode_b (pack_b_b_b_p X f g h P 3)) (decode_p (pack_b_b_b_p X f g h P 4)) = Phi X f g h P.
apply HPhi.
- exact pack_b_b_b_p_1_eq2 X f g h P.
- exact pack_b_b_b_p_2_eq2 X f g h P.
- exact pack_b_b_b_p_3_eq2 X f g h P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_b_p X f g h P 4) x.
  rewrite <- pack_b_b_b_p_4_eq2 X f g h P x Hx.
  apply iff_refl.
Qed.


Definition pack_b_b_b_e : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set := fun X f g h c => (X,encode_b X f,encode_b X g,encode_b X h,c).

Theorem pack_b_b_b_e_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, S = pack_b_b_b_e X f g h c -> X = S 0.
let S X f g h c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_b X h,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_b_e_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, X = pack_b_b_b_e X f g h c 0.
let X f g h c. apply pack_b_b_b_e_0_eq (pack_b_b_b_e X f g h c) X f g h c. reflexivity.
Qed.

Theorem pack_b_b_b_e_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, S = pack_b_b_b_e X f g h c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g h c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,c) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_b_e_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, forall x y :e X, f x y = decode_b (pack_b_b_b_e X f g h c 1) x y.
let X f g h c. apply pack_b_b_b_e_1_eq (pack_b_b_b_e X f g h c) X f g h c. reflexivity.
Qed.

Theorem pack_b_b_b_e_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, S = pack_b_b_b_e X f g h c -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g h c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_b_e_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, forall x y :e X, g x y = decode_b (pack_b_b_b_e X f g h c 2) x y.
let X f g h c. apply pack_b_b_b_e_2_eq (pack_b_b_b_e X f g h c) X f g h c. reflexivity.
Qed.

Theorem pack_b_b_b_e_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, S = pack_b_b_b_e X f g h c -> forall x y :e X, h x y = decode_b (S 3) x y.
let S X f g h c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove h x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h,c) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_b X h x Hx y Hy.
Qed.

Theorem pack_b_b_b_e_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, forall x y :e X, h x y = decode_b (pack_b_b_b_e X f g h c 3) x y.
let X f g h c. apply pack_b_b_b_e_3_eq (pack_b_b_b_e X f g h c) X f g h c. reflexivity.
Qed.

Theorem pack_b_b_b_e_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, S = pack_b_b_b_e X f g h c -> c = S 4.
let S X f g h c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_b X g,encode_b X h,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_b_b_e_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, c = pack_b_b_b_e X f g h c 4.
let X f g h c. apply pack_b_b_b_e_4_eq (pack_b_b_b_e X f g h c) X f g h c. reflexivity.
Qed.

Theorem pack_b_b_b_e_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall h h':set -> set -> set, forall c c':set, pack_b_b_b_e X f g h c = pack_b_b_b_e X' f' g' h' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x y :e X, h x y = h' x y) /\ c = c'.
let X X' f f' g g' h h' c c'. assume H1.
claim L0: X' = pack_b_b_b_e X f g h c 0.
{ exact pack_b_b_b_e_0_eq (pack_b_b_b_e X f g h c) X' f' g' h' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_b_e_0_eq2 X f g h c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_b_e_1_eq2 X f g h c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_e_1_eq2 X' f' g' h' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_b_e_2_eq2 X f g h c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_e_2_eq2 X' f' g' h' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove h x y = h' x y.
  rewrite pack_b_b_b_e_3_eq2 X f g h c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_e_3_eq2 X' f' g' h' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_b_b_b_e_4_eq2 X f g h c.
  rewrite H1. symmetry.
  exact pack_b_b_b_e_4_eq2 X' f' g' h' c'.
Qed.

Theorem pack_b_b_b_e_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall h h':set -> set -> set, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x y :e X, h x y = h' x y) ->
 pack_b_b_b_e X f g h c = pack_b_b_b_e X f' g' h' c.
let X f f' g g' h h' c. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_b X g,encode_b X h,c) = (X,encode_b X f',encode_b X g',encode_b X h',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_b X h = encode_b X h'.
{ apply encode_b_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_b_b_b_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall h:set -> set -> set, (forall x y :e X, h x y :e X) -> forall c:set, c :e X -> q (pack_b_b_b_e X f g h c)) -> q S.

Theorem pack_struct_b_b_b_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall h:set -> set -> set, (forall x y :e X, h x y :e X) -> forall c:set, c :e X -> struct_b_b_b_e (pack_b_b_b_e X f g h c).
let X f. assume Hf. let g. assume Hg. let h. assume Hh. let c. assume Hc. let q. assume Hq.
exact Hq X f Hf g Hg h Hh c Hc.
Qed.

Theorem pack_struct_b_b_b_e_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, struct_b_b_b_e (pack_b_b_b_e X f g h c) -> forall x y :e X, f x y :e X.
let X f g h c. assume H1. apply H1 (fun z => z = pack_b_b_b_e X f g h c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let c'. assume Hc'.
  assume Heq: pack_b_b_b_e X' f' g' h' c' = pack_b_b_b_e X f g h c.
  apply pack_b_b_b_e_inj X' X f' f g' g h' h c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_e_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, struct_b_b_b_e (pack_b_b_b_e X f g h c) -> forall x y :e X, g x y :e X.
let X f g h c. assume H1. apply H1 (fun z => z = pack_b_b_b_e X f g h c -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let c'. assume Hc'.
  assume Heq: pack_b_b_b_e X' f' g' h' c' = pack_b_b_b_e X f g h c.
  apply pack_b_b_b_e_inj X' X f' f g' g h' h c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_e_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, struct_b_b_b_e (pack_b_b_b_e X f g h c) -> forall x y :e X, h x y :e X.
let X f g h c. assume H1. apply H1 (fun z => z = pack_b_b_b_e X f g h c -> forall x y :e X, h x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let c'. assume Hc'.
  assume Heq: pack_b_b_b_e X' f' g' h' c' = pack_b_b_b_e X f g h c.
  apply pack_b_b_b_e_inj X' X f' f g' g h' h c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hh'h x Hx y Hy.  exact Hh' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_e_E4: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set, struct_b_b_b_e (pack_b_b_b_e X f g h c) -> c :e X.
let X f g h c. assume H1. apply H1 (fun z => z = pack_b_b_b_e X f g h c -> c :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'. let c'. assume Hc'.
  assume Heq: pack_b_b_b_e X' f' g' h' c' = pack_b_b_b_e X f g h c.
  apply pack_b_b_b_e_inj X' X f' f g' g h' h c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_b_b_e_eta: forall S, struct_b_b_b_e S -> S = pack_b_b_b_e (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_b_b_e (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_b (z 3)) (z 4)).
let X. let f. assume _. let g. assume _. let h. assume _. let c. assume _.
prove pack_b_b_b_e X f g h c = pack_b_b_b_e (pack_b_b_b_e X f g h c 0) (decode_b (pack_b_b_b_e X f g h c 1)) (decode_b (pack_b_b_b_e X f g h c 2)) (decode_b (pack_b_b_b_e X f g h c 3)) (pack_b_b_b_e X f g h c 4).
rewrite <- pack_b_b_b_e_0_eq2 X f g h c.
rewrite <- pack_b_b_b_e_4_eq2 X f g h c.
apply pack_b_b_b_e_ext.
- exact pack_b_b_b_e_1_eq2 X f g h c.
- exact pack_b_b_b_e_2_eq2 X f g h c.
- exact pack_b_b_b_e_3_eq2 X f g h c.
Qed.


Definition unpack_b_b_b_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (S 4).

Theorem unpack_b_b_b_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall h':set -> set -> set, (forall x y :e X, h x y = h' x y) -> Phi X f' g' h' c = Phi X f g h c)
  ->
  unpack_b_b_b_e_i (pack_b_b_b_e X f g h c) Phi = Phi X f g h c.
let Phi X f g h c.
assume HPhi.
prove Phi (pack_b_b_b_e X f g h c 0) (decode_b (pack_b_b_b_e X f g h c 1)) (decode_b (pack_b_b_b_e X f g h c 2)) (decode_b (pack_b_b_b_e X f g h c 3)) (pack_b_b_b_e X f g h c 4) = Phi X f g h c.
rewrite <- pack_b_b_b_e_0_eq2 X f g h c.
prove Phi X (decode_b (pack_b_b_b_e X f g h c 1)) (decode_b (pack_b_b_b_e X f g h c 2)) (decode_b (pack_b_b_b_e X f g h c 3)) (pack_b_b_b_e X f g h c 4) = Phi X f g h c.
rewrite <- pack_b_b_b_e_4_eq2 X f g h c.
apply HPhi.
- exact pack_b_b_b_e_1_eq2 X f g h c.
- exact pack_b_b_b_e_2_eq2 X f g h c.
- exact pack_b_b_b_e_3_eq2 X f g h c.
Qed.


Definition unpack_b_b_b_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)) (S 4).

Theorem unpack_b_b_b_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall h':set -> set -> set, (forall x y :e X, h x y = h' x y) -> Phi X f' g' h' c = Phi X f g h c)
  ->
  unpack_b_b_b_e_o (pack_b_b_b_e X f g h c) Phi = Phi X f g h c.
let Phi X f g h c.
assume HPhi.
prove Phi (pack_b_b_b_e X f g h c 0) (decode_b (pack_b_b_b_e X f g h c 1)) (decode_b (pack_b_b_b_e X f g h c 2)) (decode_b (pack_b_b_b_e X f g h c 3)) (pack_b_b_b_e X f g h c 4) = Phi X f g h c.
rewrite <- pack_b_b_b_e_0_eq2 X f g h c.
prove Phi X (decode_b (pack_b_b_b_e X f g h c 1)) (decode_b (pack_b_b_b_e X f g h c 2)) (decode_b (pack_b_b_b_e X f g h c 3)) (pack_b_b_b_e X f g h c 4) = Phi X f g h c.
rewrite <- pack_b_b_b_e_4_eq2 X f g h c.
apply HPhi.
- exact pack_b_b_b_e_1_eq2 X f g h c.
- exact pack_b_b_b_e_2_eq2 X f g h c.
- exact pack_b_b_b_e_3_eq2 X f g h c.
Qed.


Definition pack_b_b_u_u : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> set) -> set := fun X f g i j => (X,encode_b X f,encode_b X g,encode_u X i,encode_u X j).

Theorem pack_b_b_u_u_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, S = pack_b_b_u_u X f g i j -> X = S 0.
let S X f g i j. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_u X i,encode_u X j) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_u_u_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, X = pack_b_b_u_u X f g i j 0.
let X f g i j. apply pack_b_b_u_u_0_eq (pack_b_b_u_u X f g i j) X f g i j. reflexivity.
Qed.

Theorem pack_b_b_u_u_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, S = pack_b_b_u_u X f g i j -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g i j. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_u X i,encode_u X j) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_u_u_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, forall x y :e X, f x y = decode_b (pack_b_b_u_u X f g i j 1) x y.
let X f g i j. apply pack_b_b_u_u_1_eq (pack_b_b_u_u X f g i j) X f g i j. reflexivity.
Qed.

Theorem pack_b_b_u_u_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, S = pack_b_b_u_u X f g i j -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g i j. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_u X i,encode_u X j) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_u_u_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, forall x y :e X, g x y = decode_b (pack_b_b_u_u X f g i j 2) x y.
let X f g i j. apply pack_b_b_u_u_2_eq (pack_b_b_u_u X f g i j) X f g i j. reflexivity.
Qed.

Theorem pack_b_b_u_u_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, S = pack_b_b_u_u X f g i j -> forall x :e X, i x = decode_u (S 3) x.
let S X f g i j. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_b X g,encode_u X i,encode_u X j) 3) x.
rewrite tuple_5_3_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_b_u_u_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, forall x :e X, i x = decode_u (pack_b_b_u_u X f g i j 3) x.
let X f g i j. apply pack_b_b_u_u_3_eq (pack_b_b_u_u X f g i j) X f g i j. reflexivity.
Qed.

Theorem pack_b_b_u_u_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, S = pack_b_b_u_u X f g i j -> forall x :e X, j x = decode_u (S 4) x.
let S X f g i j. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_b X f,encode_b X g,encode_u X i,encode_u X j) 4) x.
rewrite tuple_5_4_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_b_b_u_u_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, forall x :e X, j x = decode_u (pack_b_b_u_u X f g i j 4) x.
let X f g i j. apply pack_b_b_u_u_4_eq (pack_b_b_u_u X f g i j) X f g i j. reflexivity.
Qed.

Theorem pack_b_b_u_u_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall i i':set -> set, forall j j':set -> set, pack_b_b_u_u X f g i j = pack_b_b_u_u X' f' g' i' j' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x).
let X X' f f' g g' i i' j j'. assume H1.
claim L0: X' = pack_b_b_u_u X f g i j 0.
{ exact pack_b_b_u_u_0_eq (pack_b_b_u_u X f g i j) X' f' g' i' j' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_u_u_0_eq2 X f g i j. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_u_u_1_eq2 X f g i j x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_u_1_eq2 X' f' g' i' j' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_u_u_2_eq2 X f g i j x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_u_2_eq2 X' f' g' i' j' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_b_u_u_3_eq2 X f g i j x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_u_u_3_eq2 X' f' g' i' j' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_b_b_u_u_4_eq2 X f g i j x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_u_u_4_eq2 X' f' g' i' j' x Lx.
Qed.

Theorem pack_b_b_u_u_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall i i':set -> set, forall j j':set -> set,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 pack_b_b_u_u X f g i j = pack_b_b_u_u X f' g' i' j'.
let X f f' g g' i i' j j'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_b X g,encode_u X i,encode_u X j) = (X,encode_b X f',encode_b X g',encode_u X i',encode_u X j').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H3. }
rewrite <- L3.
claim L4: encode_u X j = encode_u X j'.
{ apply encode_u_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_b_u_u : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> q (pack_b_b_u_u X f g i j)) -> q S.

Theorem pack_struct_b_b_u_u_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> struct_b_b_u_u (pack_b_b_u_u X f g i j).
let X f. assume Hf. let g. assume Hg. let i. assume Hi. let j. assume Hj. let q. assume Hq.
exact Hq X f Hf g Hg i Hi j Hj.
Qed.

Theorem pack_struct_b_b_u_u_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, struct_b_b_u_u (pack_b_b_u_u X f g i j) -> forall x y :e X, f x y :e X.
let X f g i j. assume H1. apply H1 (fun z => z = pack_b_b_u_u X f g i j -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let j'. assume Hj'.
  assume Heq: pack_b_b_u_u X' f' g' i' j' = pack_b_b_u_u X f g i j.
  apply pack_b_b_u_u_inj X' X f' f g' g i' i j' j Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i Hj'j.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_u_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, struct_b_b_u_u (pack_b_b_u_u X f g i j) -> forall x y :e X, g x y :e X.
let X f g i j. assume H1. apply H1 (fun z => z = pack_b_b_u_u X f g i j -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let j'. assume Hj'.
  assume Heq: pack_b_b_u_u X' f' g' i' j' = pack_b_b_u_u X f g i j.
  apply pack_b_b_u_u_inj X' X f' f g' g i' i j' j Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i Hj'j.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_u_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, struct_b_b_u_u (pack_b_b_u_u X f g i j) -> forall x :e X, i x :e X.
let X f g i j. assume H1. apply H1 (fun z => z = pack_b_b_u_u X f g i j -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let j'. assume Hj'.
  assume Heq: pack_b_b_u_u X' f' g' i' j' = pack_b_b_u_u X f g i j.
  apply pack_b_b_u_u_inj X' X f' f g' g i' i j' j Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i Hj'j.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_u_E4: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set, struct_b_b_u_u (pack_b_b_u_u X f g i j) -> forall x :e X, j x :e X.
let X f g i j. assume H1. apply H1 (fun z => z = pack_b_b_u_u X f g i j -> forall x :e X, j x :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let j'. assume Hj'.
  assume Heq: pack_b_b_u_u X' f' g' i' j' = pack_b_b_u_u X f g i j.
  apply pack_b_b_u_u_inj X' X f' f g' g i' i j' j Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i Hj'j.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem struct_b_b_u_u_eta: forall S, struct_b_b_u_u S -> S = pack_b_b_u_u (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_u (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_u_u (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_u (z 3)) (decode_u (z 4))).
let X. let f. assume _. let g. assume _. let i. assume _. let j. assume _.
prove pack_b_b_u_u X f g i j = pack_b_b_u_u (pack_b_b_u_u X f g i j 0) (decode_b (pack_b_b_u_u X f g i j 1)) (decode_b (pack_b_b_u_u X f g i j 2)) (decode_u (pack_b_b_u_u X f g i j 3)) (decode_u (pack_b_b_u_u X f g i j 4)).
rewrite <- pack_b_b_u_u_0_eq2 X f g i j.
apply pack_b_b_u_u_ext.
- exact pack_b_b_u_u_1_eq2 X f g i j.
- exact pack_b_b_u_u_2_eq2 X f g i j.
- exact pack_b_b_u_u_3_eq2 X f g i j.
- exact pack_b_b_u_u_4_eq2 X f g i j.
Qed.


Definition unpack_b_b_u_u_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_u (S 4)).

Theorem unpack_b_b_u_u_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> set) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) -> Phi X f' g' i' j' = Phi X f g i j)
  ->
  unpack_b_b_u_u_i (pack_b_b_u_u X f g i j) Phi = Phi X f g i j.
let Phi X f g i j.
assume HPhi.
prove Phi (pack_b_b_u_u X f g i j 0) (decode_b (pack_b_b_u_u X f g i j 1)) (decode_b (pack_b_b_u_u X f g i j 2)) (decode_u (pack_b_b_u_u X f g i j 3)) (decode_u (pack_b_b_u_u X f g i j 4)) = Phi X f g i j.
rewrite <- pack_b_b_u_u_0_eq2 X f g i j.
prove Phi X (decode_b (pack_b_b_u_u X f g i j 1)) (decode_b (pack_b_b_u_u X f g i j 2)) (decode_u (pack_b_b_u_u X f g i j 3)) (decode_u (pack_b_b_u_u X f g i j 4)) = Phi X f g i j.
apply HPhi.
- exact pack_b_b_u_u_1_eq2 X f g i j.
- exact pack_b_b_u_u_2_eq2 X f g i j.
- exact pack_b_b_u_u_3_eq2 X f g i j.
- exact pack_b_b_u_u_4_eq2 X f g i j.
Qed.


Definition unpack_b_b_u_u_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_u (S 4)).

Theorem unpack_b_b_u_u_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> set) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall j:set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) -> Phi X f' g' i' j' = Phi X f g i j)
  ->
  unpack_b_b_u_u_o (pack_b_b_u_u X f g i j) Phi = Phi X f g i j.
let Phi X f g i j.
assume HPhi.
prove Phi (pack_b_b_u_u X f g i j 0) (decode_b (pack_b_b_u_u X f g i j 1)) (decode_b (pack_b_b_u_u X f g i j 2)) (decode_u (pack_b_b_u_u X f g i j 3)) (decode_u (pack_b_b_u_u X f g i j 4)) = Phi X f g i j.
rewrite <- pack_b_b_u_u_0_eq2 X f g i j.
prove Phi X (decode_b (pack_b_b_u_u X f g i j 1)) (decode_b (pack_b_b_u_u X f g i j 2)) (decode_u (pack_b_b_u_u X f g i j 3)) (decode_u (pack_b_b_u_u X f g i j 4)) = Phi X f g i j.
apply HPhi.
- exact pack_b_b_u_u_1_eq2 X f g i j.
- exact pack_b_b_u_u_2_eq2 X f g i j.
- exact pack_b_b_u_u_3_eq2 X f g i j.
- exact pack_b_b_u_u_4_eq2 X f g i j.
Qed.


Definition pack_b_b_u_r : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set := fun X f g i R => (X,encode_b X f,encode_b X g,encode_u X i,encode_r X R).

Theorem pack_b_b_u_r_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_b_b_u_r X f g i R -> X = S 0.
let S X f g i R. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_u X i,encode_r X R) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_u_r_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, X = pack_b_b_u_r X f g i R 0.
let X f g i R. apply pack_b_b_u_r_0_eq (pack_b_b_u_r X f g i R) X f g i R. reflexivity.
Qed.

Theorem pack_b_b_u_r_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_b_b_u_r X f g i R -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g i R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_u X i,encode_r X R) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_u_r_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall x y :e X, f x y = decode_b (pack_b_b_u_r X f g i R 1) x y.
let X f g i R. apply pack_b_b_u_r_1_eq (pack_b_b_u_r X f g i R) X f g i R. reflexivity.
Qed.

Theorem pack_b_b_u_r_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_b_b_u_r X f g i R -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g i R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_u X i,encode_r X R) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_u_r_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall x y :e X, g x y = decode_b (pack_b_b_u_r X f g i R 2) x y.
let X f g i R. apply pack_b_b_u_r_2_eq (pack_b_b_u_r X f g i R) X f g i R. reflexivity.
Qed.

Theorem pack_b_b_u_r_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_b_b_u_r X f g i R -> forall x :e X, i x = decode_u (S 3) x.
let S X f g i R. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_b X g,encode_u X i,encode_r X R) 3) x.
rewrite tuple_5_3_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_b_u_r_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall x :e X, i x = decode_u (pack_b_b_u_r X f g i R 3) x.
let X f g i R. apply pack_b_b_u_r_3_eq (pack_b_b_u_r X f g i R) X f g i R. reflexivity.
Qed.

Theorem pack_b_b_u_r_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_b_b_u_r X f g i R -> forall x y :e X, R x y = decode_r (S 4) x y.
let S X f g i R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_b X g,encode_u X i,encode_r X R) 4) x y.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_b_u_r_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_b_b_u_r X f g i R 4) x y.
let X f g i R. apply pack_b_b_u_r_4_eq (pack_b_b_u_r X f g i R) X f g i R. reflexivity.
Qed.

Theorem pack_b_b_u_r_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop, pack_b_b_u_r X f g i R = pack_b_b_u_r X' f' g' i' R' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y).
let X X' f f' g g' i i' R R'. assume H1.
claim L0: X' = pack_b_b_u_r X f g i R 0.
{ exact pack_b_b_u_r_0_eq (pack_b_b_u_r X f g i R) X' f' g' i' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_u_r_0_eq2 X f g i R. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_u_r_1_eq2 X f g i R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_r_1_eq2 X' f' g' i' R' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_u_r_2_eq2 X f g i R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_r_2_eq2 X' f' g' i' R' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_b_u_r_3_eq2 X f g i R x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_u_r_3_eq2 X' f' g' i' R' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_b_u_r_4_eq2 X f g i R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_r_4_eq2 X' f' g' i' R' x Lx y Ly.
Qed.

Theorem pack_b_b_u_r_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_b_b_u_r X f g i R = pack_b_b_u_r X f' g' i' R'.
let X f f' g g' i i' R R'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_b X g,encode_u X i,encode_r X R) = (X,encode_b X f',encode_b X g',encode_u X i',encode_r X R').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H3. }
rewrite <- L3.
claim L4: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_b_u_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, q (pack_b_b_u_r X f g i R)) -> q S.

Theorem pack_struct_b_b_u_r_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, struct_b_b_u_r (pack_b_b_u_r X f g i R).
let X f. assume Hf. let g. assume Hg. let i. assume Hi. let R q. assume Hq.
exact Hq X f Hf g Hg i Hi R.
Qed.

Theorem pack_struct_b_b_u_r_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, struct_b_b_u_r (pack_b_b_u_r X f g i R) -> forall x y :e X, f x y :e X.
let X f g i R. assume H1. apply H1 (fun z => z = pack_b_b_u_r X f g i R -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let R'.
  assume Heq: pack_b_b_u_r X' f' g' i' R' = pack_b_b_u_r X f g i R.
  apply pack_b_b_u_r_inj X' X f' f g' g i' i R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_r_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, struct_b_b_u_r (pack_b_b_u_r X f g i R) -> forall x y :e X, g x y :e X.
let X f g i R. assume H1. apply H1 (fun z => z = pack_b_b_u_r X f g i R -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let R'.
  assume Heq: pack_b_b_u_r X' f' g' i' R' = pack_b_b_u_r X f g i R.
  apply pack_b_b_u_r_inj X' X f' f g' g i' i R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_r_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, struct_b_b_u_r (pack_b_b_u_r X f g i R) -> forall x :e X, i x :e X.
let X f g i R. assume H1. apply H1 (fun z => z = pack_b_b_u_r X f g i R -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let R'.
  assume Heq: pack_b_b_u_r X' f' g' i' R' = pack_b_b_u_r X f g i R.
  apply pack_b_b_u_r_inj X' X f' f g' g i' i R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i HR'R.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_b_b_u_r_eta: forall S, struct_b_b_u_r S -> S = pack_b_b_u_r (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_r (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_u_r (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_u (z 3)) (decode_r (z 4))).
let X. let f. assume _. let g. assume _. let i. assume _. let R.
prove pack_b_b_u_r X f g i R = pack_b_b_u_r (pack_b_b_u_r X f g i R 0) (decode_b (pack_b_b_u_r X f g i R 1)) (decode_b (pack_b_b_u_r X f g i R 2)) (decode_u (pack_b_b_u_r X f g i R 3)) (decode_r (pack_b_b_u_r X f g i R 4)).
rewrite <- pack_b_b_u_r_0_eq2 X f g i R.
apply pack_b_b_u_r_ext.
- exact pack_b_b_u_r_1_eq2 X f g i R.
- exact pack_b_b_u_r_2_eq2 X f g i R.
- exact pack_b_b_u_r_3_eq2 X f g i R.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_b_u_r_4_eq2 X f g i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_b_u_r_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_r (S 4)).

Theorem unpack_b_b_u_r_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' g' i' R' = Phi X f g i R)
  ->
  unpack_b_b_u_r_i (pack_b_b_u_r X f g i R) Phi = Phi X f g i R.
let Phi X f g i R.
assume HPhi.
prove Phi (pack_b_b_u_r X f g i R 0) (decode_b (pack_b_b_u_r X f g i R 1)) (decode_b (pack_b_b_u_r X f g i R 2)) (decode_u (pack_b_b_u_r X f g i R 3)) (decode_r (pack_b_b_u_r X f g i R 4)) = Phi X f g i R.
rewrite <- pack_b_b_u_r_0_eq2 X f g i R.
prove Phi X (decode_b (pack_b_b_u_r X f g i R 1)) (decode_b (pack_b_b_u_r X f g i R 2)) (decode_u (pack_b_b_u_r X f g i R 3)) (decode_r (pack_b_b_u_r X f g i R 4)) = Phi X f g i R.
apply HPhi.
- exact pack_b_b_u_r_1_eq2 X f g i R.
- exact pack_b_b_u_r_2_eq2 X f g i R.
- exact pack_b_b_u_r_3_eq2 X f g i R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_u_r X f g i R 4) x y.
  rewrite <- pack_b_b_u_r_4_eq2 X f g i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_b_u_r_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_r (S 4)).

Theorem unpack_b_b_u_r_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' g' i' R' = Phi X f g i R)
  ->
  unpack_b_b_u_r_o (pack_b_b_u_r X f g i R) Phi = Phi X f g i R.
let Phi X f g i R.
assume HPhi.
prove Phi (pack_b_b_u_r X f g i R 0) (decode_b (pack_b_b_u_r X f g i R 1)) (decode_b (pack_b_b_u_r X f g i R 2)) (decode_u (pack_b_b_u_r X f g i R 3)) (decode_r (pack_b_b_u_r X f g i R 4)) = Phi X f g i R.
rewrite <- pack_b_b_u_r_0_eq2 X f g i R.
prove Phi X (decode_b (pack_b_b_u_r X f g i R 1)) (decode_b (pack_b_b_u_r X f g i R 2)) (decode_u (pack_b_b_u_r X f g i R 3)) (decode_r (pack_b_b_u_r X f g i R 4)) = Phi X f g i R.
apply HPhi.
- exact pack_b_b_u_r_1_eq2 X f g i R.
- exact pack_b_b_u_r_2_eq2 X f g i R.
- exact pack_b_b_u_r_3_eq2 X f g i R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_u_r X f g i R 4) x y.
  rewrite <- pack_b_b_u_r_4_eq2 X f g i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_b_u_p : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set := fun X f g i P => (X,encode_b X f,encode_b X g,encode_u X i,encode_p X P).

Theorem pack_b_b_u_p_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_b_b_u_p X f g i P -> X = S 0.
let S X f g i P. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_u X i,encode_p X P) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_u_p_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, X = pack_b_b_u_p X f g i P 0.
let X f g i P. apply pack_b_b_u_p_0_eq (pack_b_b_u_p X f g i P) X f g i P. reflexivity.
Qed.

Theorem pack_b_b_u_p_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_b_b_u_p X f g i P -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g i P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_u X i,encode_p X P) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_u_p_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_b_b_u_p X f g i P 1) x y.
let X f g i P. apply pack_b_b_u_p_1_eq (pack_b_b_u_p X f g i P) X f g i P. reflexivity.
Qed.

Theorem pack_b_b_u_p_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_b_b_u_p X f g i P -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g i P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_u X i,encode_p X P) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_u_p_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall x y :e X, g x y = decode_b (pack_b_b_u_p X f g i P 2) x y.
let X f g i P. apply pack_b_b_u_p_2_eq (pack_b_b_u_p X f g i P) X f g i P. reflexivity.
Qed.

Theorem pack_b_b_u_p_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_b_b_u_p X f g i P -> forall x :e X, i x = decode_u (S 3) x.
let S X f g i P. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_b X g,encode_u X i,encode_p X P) 3) x.
rewrite tuple_5_3_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_b_u_p_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall x :e X, i x = decode_u (pack_b_b_u_p X f g i P 3) x.
let X f g i P. apply pack_b_b_u_p_3_eq (pack_b_b_u_p X f g i P) X f g i P. reflexivity.
Qed.

Theorem pack_b_b_u_p_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_b_b_u_p X f g i P -> forall x :e X, P x = decode_p (S 4) x.
let S X f g i P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_b X g,encode_u X i,encode_p X P) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_b_u_p_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall x :e X, P x = decode_p (pack_b_b_u_p X f g i P 4) x.
let X f g i P. apply pack_b_b_u_p_4_eq (pack_b_b_u_p X f g i P) X f g i P. reflexivity.
Qed.

Theorem pack_b_b_u_p_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall i i':set -> set, forall P P':set -> prop, pack_b_b_u_p X f g i P = pack_b_b_u_p X' f' g' i' P' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x).
let X X' f f' g g' i i' P P'. assume H1.
claim L0: X' = pack_b_b_u_p X f g i P 0.
{ exact pack_b_b_u_p_0_eq (pack_b_b_u_p X f g i P) X' f' g' i' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_u_p_0_eq2 X f g i P. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_u_p_1_eq2 X f g i P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_p_1_eq2 X' f' g' i' P' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_u_p_2_eq2 X f g i P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_p_2_eq2 X' f' g' i' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_b_u_p_3_eq2 X f g i P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_u_p_3_eq2 X' f' g' i' P' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_b_u_p_4_eq2 X f g i P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_u_p_4_eq2 X' f' g' i' P' x Lx.
Qed.

Theorem pack_b_b_u_p_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall i i':set -> set, forall P P':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_b_u_p X f g i P = pack_b_b_u_p X f' g' i' P'.
let X f f' g g' i i' P P'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_b X g,encode_u X i,encode_p X P) = (X,encode_b X f',encode_b X g',encode_u X i',encode_p X P').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_b_u_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, q (pack_b_b_u_p X f g i P)) -> q S.

Theorem pack_struct_b_b_u_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, struct_b_b_u_p (pack_b_b_u_p X f g i P).
let X f. assume Hf. let g. assume Hg. let i. assume Hi. let P q. assume Hq.
exact Hq X f Hf g Hg i Hi P.
Qed.

Theorem pack_struct_b_b_u_p_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, struct_b_b_u_p (pack_b_b_u_p X f g i P) -> forall x y :e X, f x y :e X.
let X f g i P. assume H1. apply H1 (fun z => z = pack_b_b_u_p X f g i P -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let P'.
  assume Heq: pack_b_b_u_p X' f' g' i' P' = pack_b_b_u_p X f g i P.
  apply pack_b_b_u_p_inj X' X f' f g' g i' i P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_p_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, struct_b_b_u_p (pack_b_b_u_p X f g i P) -> forall x y :e X, g x y :e X.
let X f g i P. assume H1. apply H1 (fun z => z = pack_b_b_u_p X f g i P -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let P'.
  assume Heq: pack_b_b_u_p X' f' g' i' P' = pack_b_b_u_p X f g i P.
  apply pack_b_b_u_p_inj X' X f' f g' g i' i P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_p_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop, struct_b_b_u_p (pack_b_b_u_p X f g i P) -> forall x :e X, i x :e X.
let X f g i P. assume H1. apply H1 (fun z => z = pack_b_b_u_p X f g i P -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let P'.
  assume Heq: pack_b_b_u_p X' f' g' i' P' = pack_b_b_u_p X f g i P.
  apply pack_b_b_u_p_inj X' X f' f g' g i' i P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_b_b_u_p_eta: forall S, struct_b_b_u_p S -> S = pack_b_b_u_p (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_u_p (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_u (z 3)) (decode_p (z 4))).
let X. let f. assume _. let g. assume _. let i. assume _. let P.
prove pack_b_b_u_p X f g i P = pack_b_b_u_p (pack_b_b_u_p X f g i P 0) (decode_b (pack_b_b_u_p X f g i P 1)) (decode_b (pack_b_b_u_p X f g i P 2)) (decode_u (pack_b_b_u_p X f g i P 3)) (decode_p (pack_b_b_u_p X f g i P 4)).
rewrite <- pack_b_b_u_p_0_eq2 X f g i P.
apply pack_b_b_u_p_ext.
- exact pack_b_b_u_p_1_eq2 X f g i P.
- exact pack_b_b_u_p_2_eq2 X f g i P.
- exact pack_b_b_u_p_3_eq2 X f g i P.
- let x. assume Hx.
  rewrite <- pack_b_b_u_p_4_eq2 X f g i P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_u_p_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_p (S 4)).

Theorem unpack_b_b_u_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' g' i' P' = Phi X f g i P)
  ->
  unpack_b_b_u_p_i (pack_b_b_u_p X f g i P) Phi = Phi X f g i P.
let Phi X f g i P.
assume HPhi.
prove Phi (pack_b_b_u_p X f g i P 0) (decode_b (pack_b_b_u_p X f g i P 1)) (decode_b (pack_b_b_u_p X f g i P 2)) (decode_u (pack_b_b_u_p X f g i P 3)) (decode_p (pack_b_b_u_p X f g i P 4)) = Phi X f g i P.
rewrite <- pack_b_b_u_p_0_eq2 X f g i P.
prove Phi X (decode_b (pack_b_b_u_p X f g i P 1)) (decode_b (pack_b_b_u_p X f g i P 2)) (decode_u (pack_b_b_u_p X f g i P 3)) (decode_p (pack_b_b_u_p X f g i P 4)) = Phi X f g i P.
apply HPhi.
- exact pack_b_b_u_p_1_eq2 X f g i P.
- exact pack_b_b_u_p_2_eq2 X f g i P.
- exact pack_b_b_u_p_3_eq2 X f g i P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_u_p X f g i P 4) x.
  rewrite <- pack_b_b_u_p_4_eq2 X f g i P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_u_p_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (decode_p (S 4)).

Theorem unpack_b_b_u_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' g' i' P' = Phi X f g i P)
  ->
  unpack_b_b_u_p_o (pack_b_b_u_p X f g i P) Phi = Phi X f g i P.
let Phi X f g i P.
assume HPhi.
prove Phi (pack_b_b_u_p X f g i P 0) (decode_b (pack_b_b_u_p X f g i P 1)) (decode_b (pack_b_b_u_p X f g i P 2)) (decode_u (pack_b_b_u_p X f g i P 3)) (decode_p (pack_b_b_u_p X f g i P 4)) = Phi X f g i P.
rewrite <- pack_b_b_u_p_0_eq2 X f g i P.
prove Phi X (decode_b (pack_b_b_u_p X f g i P 1)) (decode_b (pack_b_b_u_p X f g i P 2)) (decode_u (pack_b_b_u_p X f g i P 3)) (decode_p (pack_b_b_u_p X f g i P 4)) = Phi X f g i P.
apply HPhi.
- exact pack_b_b_u_p_1_eq2 X f g i P.
- exact pack_b_b_u_p_2_eq2 X f g i P.
- exact pack_b_b_u_p_3_eq2 X f g i P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_u_p X f g i P 4) x.
  rewrite <- pack_b_b_u_p_4_eq2 X f g i P x Hx.
  apply iff_refl.
Qed.


Definition pack_b_b_u_e : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set -> set := fun X f g i c => (X,encode_b X f,encode_b X g,encode_u X i,c).

Theorem pack_b_b_u_e_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, S = pack_b_b_u_e X f g i c -> X = S 0.
let S X f g i c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_u X i,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_u_e_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, X = pack_b_b_u_e X f g i c 0.
let X f g i c. apply pack_b_b_u_e_0_eq (pack_b_b_u_e X f g i c) X f g i c. reflexivity.
Qed.

Theorem pack_b_b_u_e_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, S = pack_b_b_u_e X f g i c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g i c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_u X i,c) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_u_e_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, forall x y :e X, f x y = decode_b (pack_b_b_u_e X f g i c 1) x y.
let X f g i c. apply pack_b_b_u_e_1_eq (pack_b_b_u_e X f g i c) X f g i c. reflexivity.
Qed.

Theorem pack_b_b_u_e_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, S = pack_b_b_u_e X f g i c -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g i c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_u X i,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_u_e_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, forall x y :e X, g x y = decode_b (pack_b_b_u_e X f g i c 2) x y.
let X f g i c. apply pack_b_b_u_e_2_eq (pack_b_b_u_e X f g i c) X f g i c. reflexivity.
Qed.

Theorem pack_b_b_u_e_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, S = pack_b_b_u_e X f g i c -> forall x :e X, i x = decode_u (S 3) x.
let S X f g i c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_b X g,encode_u X i,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_b_u_e_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, forall x :e X, i x = decode_u (pack_b_b_u_e X f g i c 3) x.
let X f g i c. apply pack_b_b_u_e_3_eq (pack_b_b_u_e X f g i c) X f g i c. reflexivity.
Qed.

Theorem pack_b_b_u_e_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, S = pack_b_b_u_e X f g i c -> c = S 4.
let S X f g i c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_b X g,encode_u X i,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_b_u_e_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, c = pack_b_b_u_e X f g i c 4.
let X f g i c. apply pack_b_b_u_e_4_eq (pack_b_b_u_e X f g i c) X f g i c. reflexivity.
Qed.

Theorem pack_b_b_u_e_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall i i':set -> set, forall c c':set, pack_b_b_u_e X f g i c = pack_b_b_u_e X' f' g' i' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x :e X, i x = i' x) /\ c = c'.
let X X' f f' g g' i i' c c'. assume H1.
claim L0: X' = pack_b_b_u_e X f g i c 0.
{ exact pack_b_b_u_e_0_eq (pack_b_b_u_e X f g i c) X' f' g' i' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_u_e_0_eq2 X f g i c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_u_e_1_eq2 X f g i c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_e_1_eq2 X' f' g' i' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_u_e_2_eq2 X f g i c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_e_2_eq2 X' f' g' i' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_b_u_e_3_eq2 X f g i c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_u_e_3_eq2 X' f' g' i' c' x Lx.
- prove c = c'.
  rewrite pack_b_b_u_e_4_eq2 X f g i c.
  rewrite H1. symmetry.
  exact pack_b_b_u_e_4_eq2 X' f' g' i' c'.
Qed.

Theorem pack_b_b_u_e_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall i i':set -> set, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x :e X, i x = i' x) ->
 pack_b_b_u_e X f g i c = pack_b_b_u_e X f' g' i' c.
let X f f' g g' i i' c. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_b X g,encode_u X i,c) = (X,encode_b X f',encode_b X g',encode_u X i',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_b_b_u_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> q (pack_b_b_u_e X f g i c)) -> q S.

Theorem pack_struct_b_b_u_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> struct_b_b_u_e (pack_b_b_u_e X f g i c).
let X f. assume Hf. let g. assume Hg. let i. assume Hi. let c. assume Hc. let q. assume Hq.
exact Hq X f Hf g Hg i Hi c Hc.
Qed.

Theorem pack_struct_b_b_u_e_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, struct_b_b_u_e (pack_b_b_u_e X f g i c) -> forall x y :e X, f x y :e X.
let X f g i c. assume H1. apply H1 (fun z => z = pack_b_b_u_e X f g i c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_b_b_u_e X' f' g' i' c' = pack_b_b_u_e X f g i c.
  apply pack_b_b_u_e_inj X' X f' f g' g i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_e_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, struct_b_b_u_e (pack_b_b_u_e X f g i c) -> forall x y :e X, g x y :e X.
let X f g i c. assume H1. apply H1 (fun z => z = pack_b_b_u_e X f g i c -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_b_b_u_e X' f' g' i' c' = pack_b_b_u_e X f g i c.
  apply pack_b_b_u_e_inj X' X f' f g' g i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_e_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, struct_b_b_u_e (pack_b_b_u_e X f g i c) -> forall x :e X, i x :e X.
let X f g i c. assume H1. apply H1 (fun z => z = pack_b_b_u_e X f g i c -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_b_b_u_e X' f' g' i' c' = pack_b_b_u_e X f g i c.
  apply pack_b_b_u_e_inj X' X f' f g' g i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_e_E4: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set, struct_b_b_u_e (pack_b_b_u_e X f g i c) -> c :e X.
let X f g i c. assume H1. apply H1 (fun z => z = pack_b_b_u_e X f g i c -> c :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_b_b_u_e X' f' g' i' c' = pack_b_b_u_e X f g i c.
  apply pack_b_b_u_e_inj X' X f' f g' g i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_b_u_e_eta: forall S, struct_b_b_u_e S -> S = pack_b_b_u_e (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_b_u_e (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_u (z 3)) (z 4)).
let X. let f. assume _. let g. assume _. let i. assume _. let c. assume _.
prove pack_b_b_u_e X f g i c = pack_b_b_u_e (pack_b_b_u_e X f g i c 0) (decode_b (pack_b_b_u_e X f g i c 1)) (decode_b (pack_b_b_u_e X f g i c 2)) (decode_u (pack_b_b_u_e X f g i c 3)) (pack_b_b_u_e X f g i c 4).
rewrite <- pack_b_b_u_e_0_eq2 X f g i c.
rewrite <- pack_b_b_u_e_4_eq2 X f g i c.
apply pack_b_b_u_e_ext.
- exact pack_b_b_u_e_1_eq2 X f g i c.
- exact pack_b_b_u_e_2_eq2 X f g i c.
- exact pack_b_b_u_e_3_eq2 X f g i c.
Qed.


Definition unpack_b_b_u_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (S 4).

Theorem unpack_b_b_u_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' g' i' c = Phi X f g i c)
  ->
  unpack_b_b_u_e_i (pack_b_b_u_e X f g i c) Phi = Phi X f g i c.
let Phi X f g i c.
assume HPhi.
prove Phi (pack_b_b_u_e X f g i c 0) (decode_b (pack_b_b_u_e X f g i c 1)) (decode_b (pack_b_b_u_e X f g i c 2)) (decode_u (pack_b_b_u_e X f g i c 3)) (pack_b_b_u_e X f g i c 4) = Phi X f g i c.
rewrite <- pack_b_b_u_e_0_eq2 X f g i c.
prove Phi X (decode_b (pack_b_b_u_e X f g i c 1)) (decode_b (pack_b_b_u_e X f g i c 2)) (decode_u (pack_b_b_u_e X f g i c 3)) (pack_b_b_u_e X f g i c 4) = Phi X f g i c.
rewrite <- pack_b_b_u_e_4_eq2 X f g i c.
apply HPhi.
- exact pack_b_b_u_e_1_eq2 X f g i c.
- exact pack_b_b_u_e_2_eq2 X f g i c.
- exact pack_b_b_u_e_3_eq2 X f g i c.
Qed.


Definition unpack_b_b_u_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)) (S 4).

Theorem unpack_b_b_u_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' g' i' c = Phi X f g i c)
  ->
  unpack_b_b_u_e_o (pack_b_b_u_e X f g i c) Phi = Phi X f g i c.
let Phi X f g i c.
assume HPhi.
prove Phi (pack_b_b_u_e X f g i c 0) (decode_b (pack_b_b_u_e X f g i c 1)) (decode_b (pack_b_b_u_e X f g i c 2)) (decode_u (pack_b_b_u_e X f g i c 3)) (pack_b_b_u_e X f g i c 4) = Phi X f g i c.
rewrite <- pack_b_b_u_e_0_eq2 X f g i c.
prove Phi X (decode_b (pack_b_b_u_e X f g i c 1)) (decode_b (pack_b_b_u_e X f g i c 2)) (decode_u (pack_b_b_u_e X f g i c 3)) (pack_b_b_u_e X f g i c 4) = Phi X f g i c.
rewrite <- pack_b_b_u_e_4_eq2 X f g i c.
apply HPhi.
- exact pack_b_b_u_e_1_eq2 X f g i c.
- exact pack_b_b_u_e_2_eq2 X f g i c.
- exact pack_b_b_u_e_3_eq2 X f g i c.
Qed.


Definition pack_b_b_r_r : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set := fun X f g R T => (X,encode_b X f,encode_b X g,encode_r X R,encode_r X T).

Theorem pack_b_b_r_r_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_b_b_r_r X f g R T -> X = S 0.
let S X f g R T. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_r X R,encode_r X T) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_r_r_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, X = pack_b_b_r_r X f g R T 0.
let X f g R T. apply pack_b_b_r_r_0_eq (pack_b_b_r_r X f g R T) X f g R T. reflexivity.
Qed.

Theorem pack_b_b_r_r_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_b_b_r_r X f g R T -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_r X R,encode_r X T) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_r_r_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, f x y = decode_b (pack_b_b_r_r X f g R T 1) x y.
let X f g R T. apply pack_b_b_r_r_1_eq (pack_b_b_r_r X f g R T) X f g R T. reflexivity.
Qed.

Theorem pack_b_b_r_r_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_b_b_r_r X f g R T -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_r X R,encode_r X T) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_r_r_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, g x y = decode_b (pack_b_b_r_r X f g R T 2) x y.
let X f g R T. apply pack_b_b_r_r_2_eq (pack_b_b_r_r X f g R T) X f g R T. reflexivity.
Qed.

Theorem pack_b_b_r_r_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_b_b_r_r X f g R T -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X f g R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_b X g,encode_r X R,encode_r X T) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_b_r_r_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_b_b_r_r X f g R T 3) x y.
let X f g R T. apply pack_b_b_r_r_3_eq (pack_b_b_r_r X f g R T) X f g R T. reflexivity.
Qed.

Theorem pack_b_b_r_r_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_b_b_r_r X f g R T -> forall x y :e X, T x y = decode_r (S 4) x y.
let S X f g R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_b X f,encode_b X g,encode_r X R,encode_r X T) 4) x y.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_b_b_r_r_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, T x y = decode_r (pack_b_b_r_r X f g R T 4) x y.
let X f g R T. apply pack_b_b_r_r_4_eq (pack_b_b_r_r X f g R T) X f g R T. reflexivity.
Qed.

Theorem pack_b_b_r_r_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall R R':set -> set -> prop, forall T T':set -> set -> prop, pack_b_b_r_r X f g R T = pack_b_b_r_r X' f' g' R' T' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y).
let X X' f f' g g' R R' T T'. assume H1.
claim L0: X' = pack_b_b_r_r X f g R T 0.
{ exact pack_b_b_r_r_0_eq (pack_b_b_r_r X f g R T) X' f' g' R' T' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_r_r_0_eq2 X f g R T. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_r_r_1_eq2 X f g R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_r_1_eq2 X' f' g' R' T' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_r_r_2_eq2 X f g R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_r_2_eq2 X' f' g' R' T' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_b_r_r_3_eq2 X f g R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_r_3_eq2 X' f' g' R' T' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_b_b_r_r_4_eq2 X f g R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_r_4_eq2 X' f' g' R' T' x Lx y Ly.
Qed.

Theorem pack_b_b_r_r_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall R R':set -> set -> prop, forall T T':set -> set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 pack_b_b_r_r X f g R T = pack_b_b_r_r X f' g' R' T'.
let X f f' g g' R R' T T'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_b X g,encode_r X R,encode_r X T) = (X,encode_b X f',encode_b X g',encode_r X R',encode_r X T').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
claim L4: encode_r X T = encode_r X T'.
{ apply encode_r_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_b_r_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall R:set -> set -> prop, forall T:set -> set -> prop, q (pack_b_b_r_r X f g R T)) -> q S.

Theorem pack_struct_b_b_r_r_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall R:set -> set -> prop, forall T:set -> set -> prop, struct_b_b_r_r (pack_b_b_r_r X f g R T).
let X f. assume Hf. let g. assume Hg. let R T q. assume Hq.
exact Hq X f Hf g Hg R T.
Qed.

Theorem pack_struct_b_b_r_r_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, struct_b_b_r_r (pack_b_b_r_r X f g R T) -> forall x y :e X, f x y :e X.
let X f g R T. assume H1. apply H1 (fun z => z = pack_b_b_r_r X f g R T -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let R'. let T'.
  assume Heq: pack_b_b_r_r X' f' g' R' T' = pack_b_b_r_r X f g R T.
  apply pack_b_b_r_r_inj X' X f' f g' g R' R T' T Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HR'R HT'T.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_r_r_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, struct_b_b_r_r (pack_b_b_r_r X f g R T) -> forall x y :e X, g x y :e X.
let X f g R T. assume H1. apply H1 (fun z => z = pack_b_b_r_r X f g R T -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let R'. let T'.
  assume Heq: pack_b_b_r_r X' f' g' R' T' = pack_b_b_r_r X f g R T.
  apply pack_b_b_r_r_inj X' X f' f g' g R' R T' T Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HR'R HT'T.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_b_r_r_eta: forall S, struct_b_b_r_r S -> S = pack_b_b_r_r (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_r (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_r_r (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_r (z 3)) (decode_r (z 4))).
let X. let f. assume _. let g. assume _. let R. let T.
prove pack_b_b_r_r X f g R T = pack_b_b_r_r (pack_b_b_r_r X f g R T 0) (decode_b (pack_b_b_r_r X f g R T 1)) (decode_b (pack_b_b_r_r X f g R T 2)) (decode_r (pack_b_b_r_r X f g R T 3)) (decode_r (pack_b_b_r_r X f g R T 4)).
rewrite <- pack_b_b_r_r_0_eq2 X f g R T.
apply pack_b_b_r_r_ext.
- exact pack_b_b_r_r_1_eq2 X f g R T.
- exact pack_b_b_r_r_2_eq2 X f g R T.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_b_r_r_3_eq2 X f g R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_b_r_r_4_eq2 X f g R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_b_r_r_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_r (S 4)).

Theorem unpack_b_b_r_r_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X f' g' R' T' = Phi X f g R T)
  ->
  unpack_b_b_r_r_i (pack_b_b_r_r X f g R T) Phi = Phi X f g R T.
let Phi X f g R T.
assume HPhi.
prove Phi (pack_b_b_r_r X f g R T 0) (decode_b (pack_b_b_r_r X f g R T 1)) (decode_b (pack_b_b_r_r X f g R T 2)) (decode_r (pack_b_b_r_r X f g R T 3)) (decode_r (pack_b_b_r_r X f g R T 4)) = Phi X f g R T.
rewrite <- pack_b_b_r_r_0_eq2 X f g R T.
prove Phi X (decode_b (pack_b_b_r_r X f g R T 1)) (decode_b (pack_b_b_r_r X f g R T 2)) (decode_r (pack_b_b_r_r X f g R T 3)) (decode_r (pack_b_b_r_r X f g R T 4)) = Phi X f g R T.
apply HPhi.
- exact pack_b_b_r_r_1_eq2 X f g R T.
- exact pack_b_b_r_r_2_eq2 X f g R T.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_r_r X f g R T 3) x y.
  rewrite <- pack_b_b_r_r_3_eq2 X f g R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_b_b_r_r X f g R T 4) x y.
  rewrite <- pack_b_b_r_r_4_eq2 X f g R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_b_r_r_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_r (S 4)).

Theorem unpack_b_b_r_r_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X f' g' R' T' = Phi X f g R T)
  ->
  unpack_b_b_r_r_o (pack_b_b_r_r X f g R T) Phi = Phi X f g R T.
let Phi X f g R T.
assume HPhi.
prove Phi (pack_b_b_r_r X f g R T 0) (decode_b (pack_b_b_r_r X f g R T 1)) (decode_b (pack_b_b_r_r X f g R T 2)) (decode_r (pack_b_b_r_r X f g R T 3)) (decode_r (pack_b_b_r_r X f g R T 4)) = Phi X f g R T.
rewrite <- pack_b_b_r_r_0_eq2 X f g R T.
prove Phi X (decode_b (pack_b_b_r_r X f g R T 1)) (decode_b (pack_b_b_r_r X f g R T 2)) (decode_r (pack_b_b_r_r X f g R T 3)) (decode_r (pack_b_b_r_r X f g R T 4)) = Phi X f g R T.
apply HPhi.
- exact pack_b_b_r_r_1_eq2 X f g R T.
- exact pack_b_b_r_r_2_eq2 X f g R T.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_r_r X f g R T 3) x y.
  rewrite <- pack_b_b_r_r_3_eq2 X f g R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_b_b_r_r X f g R T 4) x y.
  rewrite <- pack_b_b_r_r_4_eq2 X f g R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_b_r_p : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set := fun X f g R P => (X,encode_b X f,encode_b X g,encode_r X R,encode_p X P).

Theorem pack_b_b_r_p_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_b_r_p X f g R P -> X = S 0.
let S X f g R P. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_r X R,encode_p X P) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_r_p_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, X = pack_b_b_r_p X f g R P 0.
let X f g R P. apply pack_b_b_r_p_0_eq (pack_b_b_r_p X f g R P) X f g R P. reflexivity.
Qed.

Theorem pack_b_b_r_p_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_b_r_p X f g R P -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_r X R,encode_p X P) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_r_p_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_b_b_r_p X f g R P 1) x y.
let X f g R P. apply pack_b_b_r_p_1_eq (pack_b_b_r_p X f g R P) X f g R P. reflexivity.
Qed.

Theorem pack_b_b_r_p_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_b_r_p X f g R P -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_r X R,encode_p X P) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_r_p_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, g x y = decode_b (pack_b_b_r_p X f g R P 2) x y.
let X f g R P. apply pack_b_b_r_p_2_eq (pack_b_b_r_p X f g R P) X f g R P. reflexivity.
Qed.

Theorem pack_b_b_r_p_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_b_r_p X f g R P -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X f g R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_b X g,encode_r X R,encode_p X P) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_b_r_p_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, R x y = decode_r (pack_b_b_r_p X f g R P 3) x y.
let X f g R P. apply pack_b_b_r_p_3_eq (pack_b_b_r_p X f g R P) X f g R P. reflexivity.
Qed.

Theorem pack_b_b_r_p_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_b_r_p X f g R P -> forall x :e X, P x = decode_p (S 4) x.
let S X f g R P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_b X g,encode_r X R,encode_p X P) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_b_r_p_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_b_b_r_p X f g R P 4) x.
let X f g R P. apply pack_b_b_r_p_4_eq (pack_b_b_r_p X f g R P) X f g R P. reflexivity.
Qed.

Theorem pack_b_b_r_p_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, pack_b_b_r_p X f g R P = pack_b_b_r_p X' f' g' R' P' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x).
let X X' f f' g g' R R' P P'. assume H1.
claim L0: X' = pack_b_b_r_p X f g R P 0.
{ exact pack_b_b_r_p_0_eq (pack_b_b_r_p X f g R P) X' f' g' R' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_r_p_0_eq2 X f g R P. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_r_p_1_eq2 X f g R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_p_1_eq2 X' f' g' R' P' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_r_p_2_eq2 X f g R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_p_2_eq2 X' f' g' R' P' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_b_r_p_3_eq2 X f g R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_p_3_eq2 X' f' g' R' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_b_r_p_4_eq2 X f g R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_r_p_4_eq2 X' f' g' R' P' x Lx.
Qed.

Theorem pack_b_b_r_p_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall R R':set -> set -> prop, forall P P':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_b_r_p X f g R P = pack_b_b_r_p X f' g' R' P'.
let X f f' g g' R R' P P'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_b X g,encode_r X R,encode_p X P) = (X,encode_b X f',encode_b X g',encode_r X R',encode_p X P').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_b_r_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall R:set -> set -> prop, forall P:set -> prop, q (pack_b_b_r_p X f g R P)) -> q S.

Theorem pack_struct_b_b_r_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall R:set -> set -> prop, forall P:set -> prop, struct_b_b_r_p (pack_b_b_r_p X f g R P).
let X f. assume Hf. let g. assume Hg. let R P q. assume Hq.
exact Hq X f Hf g Hg R P.
Qed.

Theorem pack_struct_b_b_r_p_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, struct_b_b_r_p (pack_b_b_r_p X f g R P) -> forall x y :e X, f x y :e X.
let X f g R P. assume H1. apply H1 (fun z => z = pack_b_b_r_p X f g R P -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let R'. let P'.
  assume Heq: pack_b_b_r_p X' f' g' R' P' = pack_b_b_r_p X f g R P.
  apply pack_b_b_r_p_inj X' X f' f g' g R' R P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HR'R HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_r_p_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, struct_b_b_r_p (pack_b_b_r_p X f g R P) -> forall x y :e X, g x y :e X.
let X f g R P. assume H1. apply H1 (fun z => z = pack_b_b_r_p X f g R P -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let R'. let P'.
  assume Heq: pack_b_b_r_p X' f' g' R' P' = pack_b_b_r_p X f g R P.
  apply pack_b_b_r_p_inj X' X f' f g' g R' R P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HR'R HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_b_r_p_eta: forall S, struct_b_b_r_p S -> S = pack_b_b_r_p (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_r_p (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_r (z 3)) (decode_p (z 4))).
let X. let f. assume _. let g. assume _. let R. let P.
prove pack_b_b_r_p X f g R P = pack_b_b_r_p (pack_b_b_r_p X f g R P 0) (decode_b (pack_b_b_r_p X f g R P 1)) (decode_b (pack_b_b_r_p X f g R P 2)) (decode_r (pack_b_b_r_p X f g R P 3)) (decode_p (pack_b_b_r_p X f g R P 4)).
rewrite <- pack_b_b_r_p_0_eq2 X f g R P.
apply pack_b_b_r_p_ext.
- exact pack_b_b_r_p_1_eq2 X f g R P.
- exact pack_b_b_r_p_2_eq2 X f g R P.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_b_r_p_3_eq2 X f g R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_b_b_r_p_4_eq2 X f g R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_r_p_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_p (S 4)).

Theorem unpack_b_b_r_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' g' R' P' = Phi X f g R P)
  ->
  unpack_b_b_r_p_i (pack_b_b_r_p X f g R P) Phi = Phi X f g R P.
let Phi X f g R P.
assume HPhi.
prove Phi (pack_b_b_r_p X f g R P 0) (decode_b (pack_b_b_r_p X f g R P 1)) (decode_b (pack_b_b_r_p X f g R P 2)) (decode_r (pack_b_b_r_p X f g R P 3)) (decode_p (pack_b_b_r_p X f g R P 4)) = Phi X f g R P.
rewrite <- pack_b_b_r_p_0_eq2 X f g R P.
prove Phi X (decode_b (pack_b_b_r_p X f g R P 1)) (decode_b (pack_b_b_r_p X f g R P 2)) (decode_r (pack_b_b_r_p X f g R P 3)) (decode_p (pack_b_b_r_p X f g R P 4)) = Phi X f g R P.
apply HPhi.
- exact pack_b_b_r_p_1_eq2 X f g R P.
- exact pack_b_b_r_p_2_eq2 X f g R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_r_p X f g R P 3) x y.
  rewrite <- pack_b_b_r_p_3_eq2 X f g R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_r_p X f g R P 4) x.
  rewrite <- pack_b_b_r_p_4_eq2 X f g R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_r_p_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)) (decode_p (S 4)).

Theorem unpack_b_b_r_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' g' R' P' = Phi X f g R P)
  ->
  unpack_b_b_r_p_o (pack_b_b_r_p X f g R P) Phi = Phi X f g R P.
let Phi X f g R P.
assume HPhi.
prove Phi (pack_b_b_r_p X f g R P 0) (decode_b (pack_b_b_r_p X f g R P 1)) (decode_b (pack_b_b_r_p X f g R P 2)) (decode_r (pack_b_b_r_p X f g R P 3)) (decode_p (pack_b_b_r_p X f g R P 4)) = Phi X f g R P.
rewrite <- pack_b_b_r_p_0_eq2 X f g R P.
prove Phi X (decode_b (pack_b_b_r_p X f g R P 1)) (decode_b (pack_b_b_r_p X f g R P 2)) (decode_r (pack_b_b_r_p X f g R P 3)) (decode_p (pack_b_b_r_p X f g R P 4)) = Phi X f g R P.
apply HPhi.
- exact pack_b_b_r_p_1_eq2 X f g R P.
- exact pack_b_b_r_p_2_eq2 X f g R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_r_p X f g R P 3) x y.
  rewrite <- pack_b_b_r_p_3_eq2 X f g R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_r_p X f g R P 4) x.
  rewrite <- pack_b_b_r_p_4_eq2 X f g R P x Hx.
  apply iff_refl.
Qed.


Definition pack_b_b_r_e : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set := fun X f g R c => (X,encode_b X f,encode_b X g,encode_r X R,c).

Theorem pack_b_b_r_e_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_b_r_e X f g R c -> X = S 0.
let S X f g R c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_r X R,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_r_e_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, X = pack_b_b_r_e X f g R c 0.
let X f g R c. apply pack_b_b_r_e_0_eq (pack_b_b_r_e X f g R c) X f g R c. reflexivity.
Qed.

Theorem pack_b_b_r_e_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_b_r_e X f g R c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_r X R,c) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_r_e_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, f x y = decode_b (pack_b_b_r_e X f g R c 1) x y.
let X f g R c. apply pack_b_b_r_e_1_eq (pack_b_b_r_e X f g R c) X f g R c. reflexivity.
Qed.

Theorem pack_b_b_r_e_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_b_r_e X f g R c -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_r X R,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_r_e_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, g x y = decode_b (pack_b_b_r_e X f g R c 2) x y.
let X f g R c. apply pack_b_b_r_e_2_eq (pack_b_b_r_e X f g R c) X f g R c. reflexivity.
Qed.

Theorem pack_b_b_r_e_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_b_r_e X f g R c -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X f g R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_b X g,encode_r X R,c) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_b_r_e_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_b_b_r_e X f g R c 3) x y.
let X f g R c. apply pack_b_b_r_e_3_eq (pack_b_b_r_e X f g R c) X f g R c. reflexivity.
Qed.

Theorem pack_b_b_r_e_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_b_r_e X f g R c -> c = S 4.
let S X f g R c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_b X g,encode_r X R,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_b_r_e_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, c = pack_b_b_r_e X f g R c 4.
let X f g R c. apply pack_b_b_r_e_4_eq (pack_b_b_r_e X f g R c) X f g R c. reflexivity.
Qed.

Theorem pack_b_b_r_e_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall R R':set -> set -> prop, forall c c':set, pack_b_b_r_e X f g R c = pack_b_b_r_e X' f' g' R' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x y :e X, R x y = R' x y) /\ c = c'.
let X X' f f' g g' R R' c c'. assume H1.
claim L0: X' = pack_b_b_r_e X f g R c 0.
{ exact pack_b_b_r_e_0_eq (pack_b_b_r_e X f g R c) X' f' g' R' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_r_e_0_eq2 X f g R c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_r_e_1_eq2 X f g R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_e_1_eq2 X' f' g' R' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_r_e_2_eq2 X f g R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_e_2_eq2 X' f' g' R' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_b_r_e_3_eq2 X f g R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_e_3_eq2 X' f' g' R' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_b_b_r_e_4_eq2 X f g R c.
  rewrite H1. symmetry.
  exact pack_b_b_r_e_4_eq2 X' f' g' R' c'.
Qed.

Theorem pack_b_b_r_e_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall R R':set -> set -> prop, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_b_b_r_e X f g R c = pack_b_b_r_e X f' g' R' c.
let X f f' g g' R R' c. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_b X g,encode_r X R,c) = (X,encode_b X f',encode_b X g',encode_r X R',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_b_b_r_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> q (pack_b_b_r_e X f g R c)) -> q S.

Theorem pack_struct_b_b_r_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> struct_b_b_r_e (pack_b_b_r_e X f g R c).
let X f. assume Hf. let g. assume Hg. let R c. assume Hc. let q. assume Hq.
exact Hq X f Hf g Hg R c Hc.
Qed.

Theorem pack_struct_b_b_r_e_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, struct_b_b_r_e (pack_b_b_r_e X f g R c) -> forall x y :e X, f x y :e X.
let X f g R c. assume H1. apply H1 (fun z => z = pack_b_b_r_e X f g R c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let R'. let c'. assume Hc'.
  assume Heq: pack_b_b_r_e X' f' g' R' c' = pack_b_b_r_e X f g R c.
  apply pack_b_b_r_e_inj X' X f' f g' g R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HR'R Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_r_e_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, struct_b_b_r_e (pack_b_b_r_e X f g R c) -> forall x y :e X, g x y :e X.
let X f g R c. assume H1. apply H1 (fun z => z = pack_b_b_r_e X f g R c -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let R'. let c'. assume Hc'.
  assume Heq: pack_b_b_r_e X' f' g' R' c' = pack_b_b_r_e X f g R c.
  apply pack_b_b_r_e_inj X' X f' f g' g R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HR'R Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_r_e_E4: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set, struct_b_b_r_e (pack_b_b_r_e X f g R c) -> c :e X.
let X f g R c. assume H1. apply H1 (fun z => z = pack_b_b_r_e X f g R c -> c :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let R'. let c'. assume Hc'.
  assume Heq: pack_b_b_r_e X' f' g' R' c' = pack_b_b_r_e X f g R c.
  apply pack_b_b_r_e_inj X' X f' f g' g R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HR'R Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_b_r_e_eta: forall S, struct_b_b_r_e S -> S = pack_b_b_r_e (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_b_r_e (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_r (z 3)) (z 4)).
let X. let f. assume _. let g. assume _. let R. let c. assume _.
prove pack_b_b_r_e X f g R c = pack_b_b_r_e (pack_b_b_r_e X f g R c 0) (decode_b (pack_b_b_r_e X f g R c 1)) (decode_b (pack_b_b_r_e X f g R c 2)) (decode_r (pack_b_b_r_e X f g R c 3)) (pack_b_b_r_e X f g R c 4).
rewrite <- pack_b_b_r_e_0_eq2 X f g R c.
rewrite <- pack_b_b_r_e_4_eq2 X f g R c.
apply pack_b_b_r_e_ext.
- exact pack_b_b_r_e_1_eq2 X f g R c.
- exact pack_b_b_r_e_2_eq2 X f g R c.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_b_r_e_3_eq2 X f g R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_b_r_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)) (S 4).

Theorem unpack_b_b_r_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' g' R' c = Phi X f g R c)
  ->
  unpack_b_b_r_e_i (pack_b_b_r_e X f g R c) Phi = Phi X f g R c.
let Phi X f g R c.
assume HPhi.
prove Phi (pack_b_b_r_e X f g R c 0) (decode_b (pack_b_b_r_e X f g R c 1)) (decode_b (pack_b_b_r_e X f g R c 2)) (decode_r (pack_b_b_r_e X f g R c 3)) (pack_b_b_r_e X f g R c 4) = Phi X f g R c.
rewrite <- pack_b_b_r_e_0_eq2 X f g R c.
prove Phi X (decode_b (pack_b_b_r_e X f g R c 1)) (decode_b (pack_b_b_r_e X f g R c 2)) (decode_r (pack_b_b_r_e X f g R c 3)) (pack_b_b_r_e X f g R c 4) = Phi X f g R c.
rewrite <- pack_b_b_r_e_4_eq2 X f g R c.
apply HPhi.
- exact pack_b_b_r_e_1_eq2 X f g R c.
- exact pack_b_b_r_e_2_eq2 X f g R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_r_e X f g R c 3) x y.
  rewrite <- pack_b_b_r_e_3_eq2 X f g R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_b_r_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)) (S 4).

Theorem unpack_b_b_r_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' g' R' c = Phi X f g R c)
  ->
  unpack_b_b_r_e_o (pack_b_b_r_e X f g R c) Phi = Phi X f g R c.
let Phi X f g R c.
assume HPhi.
prove Phi (pack_b_b_r_e X f g R c 0) (decode_b (pack_b_b_r_e X f g R c 1)) (decode_b (pack_b_b_r_e X f g R c 2)) (decode_r (pack_b_b_r_e X f g R c 3)) (pack_b_b_r_e X f g R c 4) = Phi X f g R c.
rewrite <- pack_b_b_r_e_0_eq2 X f g R c.
prove Phi X (decode_b (pack_b_b_r_e X f g R c 1)) (decode_b (pack_b_b_r_e X f g R c 2)) (decode_r (pack_b_b_r_e X f g R c 3)) (pack_b_b_r_e X f g R c 4) = Phi X f g R c.
rewrite <- pack_b_b_r_e_4_eq2 X f g R c.
apply HPhi.
- exact pack_b_b_r_e_1_eq2 X f g R c.
- exact pack_b_b_r_e_2_eq2 X f g R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_r_e X f g R c 3) x y.
  rewrite <- pack_b_b_r_e_3_eq2 X f g R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_b_p_p : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> (set -> prop) -> set := fun X f g P Q => (X,encode_b X f,encode_b X g,encode_p X P,encode_p X Q).

Theorem pack_b_b_p_p_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_b_b_p_p X f g P Q -> X = S 0.
let S X f g P Q. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_p X P,encode_p X Q) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_p_p_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, X = pack_b_b_p_p X f g P Q 0.
let X f g P Q. apply pack_b_b_p_p_0_eq (pack_b_b_p_p X f g P Q) X f g P Q. reflexivity.
Qed.

Theorem pack_b_b_p_p_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_b_b_p_p X f g P Q -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g P Q. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_p X P,encode_p X Q) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_p_p_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, forall x y :e X, f x y = decode_b (pack_b_b_p_p X f g P Q 1) x y.
let X f g P Q. apply pack_b_b_p_p_1_eq (pack_b_b_p_p X f g P Q) X f g P Q. reflexivity.
Qed.

Theorem pack_b_b_p_p_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_b_b_p_p X f g P Q -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g P Q. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_p X P,encode_p X Q) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_p_p_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, forall x y :e X, g x y = decode_b (pack_b_b_p_p X f g P Q 2) x y.
let X f g P Q. apply pack_b_b_p_p_2_eq (pack_b_b_p_p X f g P Q) X f g P Q. reflexivity.
Qed.

Theorem pack_b_b_p_p_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_b_b_p_p X f g P Q -> forall x :e X, P x = decode_p (S 3) x.
let S X f g P Q. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_b X g,encode_p X P,encode_p X Q) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_b_p_p_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, P x = decode_p (pack_b_b_p_p X f g P Q 3) x.
let X f g P Q. apply pack_b_b_p_p_3_eq (pack_b_b_p_p X f g P Q) X f g P Q. reflexivity.
Qed.

Theorem pack_b_b_p_p_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_b_b_p_p X f g P Q -> forall x :e X, Q x = decode_p (S 4) x.
let S X f g P Q. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_b X f,encode_b X g,encode_p X P,encode_p X Q) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_b_b_p_p_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, Q x = decode_p (pack_b_b_p_p X f g P Q 4) x.
let X f g P Q. apply pack_b_b_p_p_4_eq (pack_b_b_p_p X f g P Q) X f g P Q. reflexivity.
Qed.

Theorem pack_b_b_p_p_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall P P':set -> prop, forall Q Q':set -> prop, pack_b_b_p_p X f g P Q = pack_b_b_p_p X' f' g' P' Q' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x).
let X X' f f' g g' P P' Q Q'. assume H1.
claim L0: X' = pack_b_b_p_p X f g P Q 0.
{ exact pack_b_b_p_p_0_eq (pack_b_b_p_p X f g P Q) X' f' g' P' Q' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_p_p_0_eq2 X f g P Q. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_p_p_1_eq2 X f g P Q x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_p_p_1_eq2 X' f' g' P' Q' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_p_p_2_eq2 X f g P Q x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_p_p_2_eq2 X' f' g' P' Q' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_b_p_p_3_eq2 X f g P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_p_p_3_eq2 X' f' g' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_b_b_p_p_4_eq2 X f g P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_p_p_4_eq2 X' f' g' P' Q' x Lx.
Qed.

Theorem pack_b_b_p_p_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall P P':set -> prop, forall Q Q':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_b_b_p_p X f g P Q = pack_b_b_p_p X f' g' P' Q'.
let X f f' g g' P P' Q Q'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_b X g,encode_p X P,encode_p X Q) = (X,encode_b X f',encode_b X g',encode_p X P',encode_p X Q').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_b_p_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall P:set -> prop, forall Q:set -> prop, q (pack_b_b_p_p X f g P Q)) -> q S.

Theorem pack_struct_b_b_p_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall P:set -> prop, forall Q:set -> prop, struct_b_b_p_p (pack_b_b_p_p X f g P Q).
let X f. assume Hf. let g. assume Hg. let P Q q. assume Hq.
exact Hq X f Hf g Hg P Q.
Qed.

Theorem pack_struct_b_b_p_p_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, struct_b_b_p_p (pack_b_b_p_p X f g P Q) -> forall x y :e X, f x y :e X.
let X f g P Q. assume H1. apply H1 (fun z => z = pack_b_b_p_p X f g P Q -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let P'. let Q'.
  assume Heq: pack_b_b_p_p X' f' g' P' Q' = pack_b_b_p_p X f g P Q.
  apply pack_b_b_p_p_inj X' X f' f g' g P' P Q' Q Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HP'P HQ'Q.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_p_p_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop, struct_b_b_p_p (pack_b_b_p_p X f g P Q) -> forall x y :e X, g x y :e X.
let X f g P Q. assume H1. apply H1 (fun z => z = pack_b_b_p_p X f g P Q -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let P'. let Q'.
  assume Heq: pack_b_b_p_p X' f' g' P' Q' = pack_b_b_p_p X f g P Q.
  apply pack_b_b_p_p_inj X' X f' f g' g P' P Q' Q Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HP'P HQ'Q.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_b_p_p_eta: forall S, struct_b_b_p_p S -> S = pack_b_b_p_p (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_p (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_p_p (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_p (z 3)) (decode_p (z 4))).
let X. let f. assume _. let g. assume _. let P. let Q.
prove pack_b_b_p_p X f g P Q = pack_b_b_p_p (pack_b_b_p_p X f g P Q 0) (decode_b (pack_b_b_p_p X f g P Q 1)) (decode_b (pack_b_b_p_p X f g P Q 2)) (decode_p (pack_b_b_p_p X f g P Q 3)) (decode_p (pack_b_b_p_p X f g P Q 4)).
rewrite <- pack_b_b_p_p_0_eq2 X f g P Q.
apply pack_b_b_p_p_ext.
- exact pack_b_b_p_p_1_eq2 X f g P Q.
- exact pack_b_b_p_p_2_eq2 X f g P Q.
- let x. assume Hx.
  rewrite <- pack_b_b_p_p_3_eq2 X f g P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_b_b_p_p_4_eq2 X f g P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_p_p_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_b_b_p_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X f' g' P' Q' = Phi X f g P Q)
  ->
  unpack_b_b_p_p_i (pack_b_b_p_p X f g P Q) Phi = Phi X f g P Q.
let Phi X f g P Q.
assume HPhi.
prove Phi (pack_b_b_p_p X f g P Q 0) (decode_b (pack_b_b_p_p X f g P Q 1)) (decode_b (pack_b_b_p_p X f g P Q 2)) (decode_p (pack_b_b_p_p X f g P Q 3)) (decode_p (pack_b_b_p_p X f g P Q 4)) = Phi X f g P Q.
rewrite <- pack_b_b_p_p_0_eq2 X f g P Q.
prove Phi X (decode_b (pack_b_b_p_p X f g P Q 1)) (decode_b (pack_b_b_p_p X f g P Q 2)) (decode_p (pack_b_b_p_p X f g P Q 3)) (decode_p (pack_b_b_p_p X f g P Q 4)) = Phi X f g P Q.
apply HPhi.
- exact pack_b_b_p_p_1_eq2 X f g P Q.
- exact pack_b_b_p_p_2_eq2 X f g P Q.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_p_p X f g P Q 3) x.
  rewrite <- pack_b_b_p_p_3_eq2 X f g P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_b_b_p_p X f g P Q 4) x.
  rewrite <- pack_b_b_p_p_4_eq2 X f g P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_p_p_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_b_b_p_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall Q:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X f' g' P' Q' = Phi X f g P Q)
  ->
  unpack_b_b_p_p_o (pack_b_b_p_p X f g P Q) Phi = Phi X f g P Q.
let Phi X f g P Q.
assume HPhi.
prove Phi (pack_b_b_p_p X f g P Q 0) (decode_b (pack_b_b_p_p X f g P Q 1)) (decode_b (pack_b_b_p_p X f g P Q 2)) (decode_p (pack_b_b_p_p X f g P Q 3)) (decode_p (pack_b_b_p_p X f g P Q 4)) = Phi X f g P Q.
rewrite <- pack_b_b_p_p_0_eq2 X f g P Q.
prove Phi X (decode_b (pack_b_b_p_p X f g P Q 1)) (decode_b (pack_b_b_p_p X f g P Q 2)) (decode_p (pack_b_b_p_p X f g P Q 3)) (decode_p (pack_b_b_p_p X f g P Q 4)) = Phi X f g P Q.
apply HPhi.
- exact pack_b_b_p_p_1_eq2 X f g P Q.
- exact pack_b_b_p_p_2_eq2 X f g P Q.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_p_p X f g P Q 3) x.
  rewrite <- pack_b_b_p_p_3_eq2 X f g P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_b_b_p_p X f g P Q 4) x.
  rewrite <- pack_b_b_p_p_4_eq2 X f g P Q x Hx.
  apply iff_refl.
Qed.


Definition pack_b_b_p_e : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set -> set := fun X f g P c => (X,encode_b X f,encode_b X g,encode_p X P,c).

Theorem pack_b_b_p_e_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_b_b_p_e X f g P c -> X = S 0.
let S X f g P c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_p X P,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_p_e_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, X = pack_b_b_p_e X f g P c 0.
let X f g P c. apply pack_b_b_p_e_0_eq (pack_b_b_p_e X f g P c) X f g P c. reflexivity.
Qed.

Theorem pack_b_b_p_e_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_b_b_p_e X f g P c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_p X P,c) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_p_e_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, forall x y :e X, f x y = decode_b (pack_b_b_p_e X f g P c 1) x y.
let X f g P c. apply pack_b_b_p_e_1_eq (pack_b_b_p_e X f g P c) X f g P c. reflexivity.
Qed.

Theorem pack_b_b_p_e_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_b_b_p_e X f g P c -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_p X P,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_p_e_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, forall x y :e X, g x y = decode_b (pack_b_b_p_e X f g P c 2) x y.
let X f g P c. apply pack_b_b_p_e_2_eq (pack_b_b_p_e X f g P c) X f g P c. reflexivity.
Qed.

Theorem pack_b_b_p_e_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_b_b_p_e X f g P c -> forall x :e X, P x = decode_p (S 3) x.
let S X f g P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_b X g,encode_p X P,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_b_p_e_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_b_b_p_e X f g P c 3) x.
let X f g P c. apply pack_b_b_p_e_3_eq (pack_b_b_p_e X f g P c) X f g P c. reflexivity.
Qed.

Theorem pack_b_b_p_e_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_b_b_p_e X f g P c -> c = S 4.
let S X f g P c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_b X g,encode_p X P,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_b_p_e_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, c = pack_b_b_p_e X f g P c 4.
let X f g P c. apply pack_b_b_p_e_4_eq (pack_b_b_p_e X f g P c) X f g P c. reflexivity.
Qed.

Theorem pack_b_b_p_e_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall P P':set -> prop, forall c c':set, pack_b_b_p_e X f g P c = pack_b_b_p_e X' f' g' P' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' f f' g g' P P' c c'. assume H1.
claim L0: X' = pack_b_b_p_e X f g P c 0.
{ exact pack_b_b_p_e_0_eq (pack_b_b_p_e X f g P c) X' f' g' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_p_e_0_eq2 X f g P c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_p_e_1_eq2 X f g P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_p_e_1_eq2 X' f' g' P' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_p_e_2_eq2 X f g P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_p_e_2_eq2 X' f' g' P' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_b_p_e_3_eq2 X f g P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_p_e_3_eq2 X' f' g' P' c' x Lx.
- prove c = c'.
  rewrite pack_b_b_p_e_4_eq2 X f g P c.
  rewrite H1. symmetry.
  exact pack_b_b_p_e_4_eq2 X' f' g' P' c'.
Qed.

Theorem pack_b_b_p_e_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall P P':set -> prop, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_b_p_e X f g P c = pack_b_b_p_e X f' g' P' c.
let X f f' g g' P P' c. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_b X g,encode_p X P,c) = (X,encode_b X f',encode_b X g',encode_p X P',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_b_b_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall P:set -> prop, forall c:set, c :e X -> q (pack_b_b_p_e X f g P c)) -> q S.

Theorem pack_struct_b_b_p_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall P:set -> prop, forall c:set, c :e X -> struct_b_b_p_e (pack_b_b_p_e X f g P c).
let X f. assume Hf. let g. assume Hg. let P c. assume Hc. let q. assume Hq.
exact Hq X f Hf g Hg P c Hc.
Qed.

Theorem pack_struct_b_b_p_e_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, struct_b_b_p_e (pack_b_b_p_e X f g P c) -> forall x y :e X, f x y :e X.
let X f g P c. assume H1. apply H1 (fun z => z = pack_b_b_p_e X f g P c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let P'. let c'. assume Hc'.
  assume Heq: pack_b_b_p_e X' f' g' P' c' = pack_b_b_p_e X f g P c.
  apply pack_b_b_p_e_inj X' X f' f g' g P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_p_e_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, struct_b_b_p_e (pack_b_b_p_e X f g P c) -> forall x y :e X, g x y :e X.
let X f g P c. assume H1. apply H1 (fun z => z = pack_b_b_p_e X f g P c -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let P'. let c'. assume Hc'.
  assume Heq: pack_b_b_p_e X' f' g' P' c' = pack_b_b_p_e X f g P c.
  apply pack_b_b_p_e_inj X' X f' f g' g P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_p_e_E4: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set, struct_b_b_p_e (pack_b_b_p_e X f g P c) -> c :e X.
let X f g P c. assume H1. apply H1 (fun z => z = pack_b_b_p_e X f g P c -> c :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let P'. let c'. assume Hc'.
  assume Heq: pack_b_b_p_e X' f' g' P' c' = pack_b_b_p_e X f g P c.
  apply pack_b_b_p_e_inj X' X f' f g' g P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_b_p_e_eta: forall S, struct_b_b_p_e S -> S = pack_b_b_p_e (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_p (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_b_p_e (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_p (z 3)) (z 4)).
let X. let f. assume _. let g. assume _. let P. let c. assume _.
prove pack_b_b_p_e X f g P c = pack_b_b_p_e (pack_b_b_p_e X f g P c 0) (decode_b (pack_b_b_p_e X f g P c 1)) (decode_b (pack_b_b_p_e X f g P c 2)) (decode_p (pack_b_b_p_e X f g P c 3)) (pack_b_b_p_e X f g P c 4).
rewrite <- pack_b_b_p_e_0_eq2 X f g P c.
rewrite <- pack_b_b_p_e_4_eq2 X f g P c.
apply pack_b_b_p_e_ext.
- exact pack_b_b_p_e_1_eq2 X f g P c.
- exact pack_b_b_p_e_2_eq2 X f g P c.
- let x. assume Hx.
  rewrite <- pack_b_b_p_e_3_eq2 X f g P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_p_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_b_b_p_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' g' P' c = Phi X f g P c)
  ->
  unpack_b_b_p_e_i (pack_b_b_p_e X f g P c) Phi = Phi X f g P c.
let Phi X f g P c.
assume HPhi.
prove Phi (pack_b_b_p_e X f g P c 0) (decode_b (pack_b_b_p_e X f g P c 1)) (decode_b (pack_b_b_p_e X f g P c 2)) (decode_p (pack_b_b_p_e X f g P c 3)) (pack_b_b_p_e X f g P c 4) = Phi X f g P c.
rewrite <- pack_b_b_p_e_0_eq2 X f g P c.
prove Phi X (decode_b (pack_b_b_p_e X f g P c 1)) (decode_b (pack_b_b_p_e X f g P c 2)) (decode_p (pack_b_b_p_e X f g P c 3)) (pack_b_b_p_e X f g P c 4) = Phi X f g P c.
rewrite <- pack_b_b_p_e_4_eq2 X f g P c.
apply HPhi.
- exact pack_b_b_p_e_1_eq2 X f g P c.
- exact pack_b_b_p_e_2_eq2 X f g P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_p_e X f g P c 3) x.
  rewrite <- pack_b_b_p_e_3_eq2 X f g P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_p_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_b_b_p_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' g' P' c = Phi X f g P c)
  ->
  unpack_b_b_p_e_o (pack_b_b_p_e X f g P c) Phi = Phi X f g P c.
let Phi X f g P c.
assume HPhi.
prove Phi (pack_b_b_p_e X f g P c 0) (decode_b (pack_b_b_p_e X f g P c 1)) (decode_b (pack_b_b_p_e X f g P c 2)) (decode_p (pack_b_b_p_e X f g P c 3)) (pack_b_b_p_e X f g P c 4) = Phi X f g P c.
rewrite <- pack_b_b_p_e_0_eq2 X f g P c.
prove Phi X (decode_b (pack_b_b_p_e X f g P c 1)) (decode_b (pack_b_b_p_e X f g P c 2)) (decode_p (pack_b_b_p_e X f g P c 3)) (pack_b_b_p_e X f g P c 4) = Phi X f g P c.
rewrite <- pack_b_b_p_e_4_eq2 X f g P c.
apply HPhi.
- exact pack_b_b_p_e_1_eq2 X f g P c.
- exact pack_b_b_p_e_2_eq2 X f g P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_p_e X f g P c 3) x.
  rewrite <- pack_b_b_p_e_3_eq2 X f g P c x Hx.
  apply iff_refl.
Qed.


Definition pack_b_b_e_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set := fun X f g c d => (X,encode_b X f,encode_b X g,c,d).

Theorem pack_b_b_e_e_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, S = pack_b_b_e_e X f g c d -> X = S 0.
let S X f g c d. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_b_e_e_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, X = pack_b_b_e_e X f g c d 0.
let X f g c d. apply pack_b_b_e_e_0_eq (pack_b_b_e_e X f g c d) X f g c d. reflexivity.
Qed.

Theorem pack_b_b_e_e_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, S = pack_b_b_e_e X f g c d -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,c,d) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_e_e_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, forall x y :e X, f x y = decode_b (pack_b_b_e_e X f g c d 1) x y.
let X f g c d. apply pack_b_b_e_e_1_eq (pack_b_b_e_e X f g c d) X f g c d. reflexivity.
Qed.

Theorem pack_b_b_e_e_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, S = pack_b_b_e_e X f g c d -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,c,d) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_e_e_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, forall x y :e X, g x y = decode_b (pack_b_b_e_e X f g c d 2) x y.
let X f g c d. apply pack_b_b_e_e_2_eq (pack_b_b_e_e X f g c d) X f g c d. reflexivity.
Qed.

Theorem pack_b_b_e_e_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, S = pack_b_b_e_e X f g c d -> c = S 3.
let S X f g c d. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_b X g,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_b_b_e_e_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, c = pack_b_b_e_e X f g c d 3.
let X f g c d. apply pack_b_b_e_e_3_eq (pack_b_b_e_e X f g c d) X f g c d. reflexivity.
Qed.

Theorem pack_b_b_e_e_4_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, S = pack_b_b_e_e X f g c d -> d = S 4.
let S X f g c d. assume H1.
rewrite H1. prove d = (X,encode_b X f,encode_b X g,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_b_e_e_4_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, d = pack_b_b_e_e X f g c d 4.
let X f g c d. apply pack_b_b_e_e_4_eq (pack_b_b_e_e X f g c d) X f g c d. reflexivity.
Qed.

Theorem pack_b_b_e_e_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall c c':set, forall d d':set, pack_b_b_e_e X f g c d = pack_b_b_e_e X' f' g' c' d' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ c = c' /\ d = d'.
let X X' f f' g g' c c' d d'. assume H1.
claim L0: X' = pack_b_b_e_e X f g c d 0.
{ exact pack_b_b_e_e_0_eq (pack_b_b_e_e X f g c d) X' f' g' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_e_e_0_eq2 X f g c d. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_e_e_1_eq2 X f g c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_e_e_1_eq2 X' f' g' c' d' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_e_e_2_eq2 X f g c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_e_e_2_eq2 X' f' g' c' d' x Lx y Ly.
- prove c = c'.
  rewrite pack_b_b_e_e_3_eq2 X f g c d.
  rewrite H1. symmetry.
  exact pack_b_b_e_e_3_eq2 X' f' g' c' d'.
- prove d = d'.
  rewrite pack_b_b_e_e_4_eq2 X f g c d.
  rewrite H1. symmetry.
  exact pack_b_b_e_e_4_eq2 X' f' g' c' d'.
Qed.

Theorem pack_b_b_e_e_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall c, forall d,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 pack_b_b_e_e X f g c d = pack_b_b_e_e X f' g' c d.
let X f f' g g' c d. assume H1. assume H2.
prove (X,encode_b X f,encode_b X g,c,d) = (X,encode_b X f',encode_b X g',c,d).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_b_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall c:set, c :e X -> forall d:set, d :e X -> q (pack_b_b_e_e X f g c d)) -> q S.

Theorem pack_struct_b_b_e_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall c:set, c :e X -> forall d:set, d :e X -> struct_b_b_e_e (pack_b_b_e_e X f g c d).
let X f. assume Hf. let g. assume Hg. let c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X f Hf g Hg c Hc d Hd.
Qed.

Theorem pack_struct_b_b_e_e_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, struct_b_b_e_e (pack_b_b_e_e X f g c d) -> forall x y :e X, f x y :e X.
let X f g c d. assume H1. apply H1 (fun z => z = pack_b_b_e_e X f g c d -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_b_e_e X' f' g' c' d' = pack_b_b_e_e X f g c d.
  apply pack_b_b_e_e_inj X' X f' f g' g c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_e_e_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, struct_b_b_e_e (pack_b_b_e_e X f g c d) -> forall x y :e X, g x y :e X.
let X f g c d. assume H1. apply H1 (fun z => z = pack_b_b_e_e X f g c d -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_b_e_e X' f' g' c' d' = pack_b_b_e_e X f g c d.
  apply pack_b_b_e_e_inj X' X f' f g' g c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_e_e_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, struct_b_b_e_e (pack_b_b_e_e X f g c d) -> c :e X.
let X f g c d. assume H1. apply H1 (fun z => z = pack_b_b_e_e X f g c d -> c :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_b_e_e X' f' g' c' d' = pack_b_b_e_e X f g c d.
  apply pack_b_b_e_e_inj X' X f' f g' g c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_b_b_e_e_E4: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set, struct_b_b_e_e (pack_b_b_e_e X f g c d) -> d :e X.
let X f g c d. assume H1. apply H1 (fun z => z = pack_b_b_e_e X f g c d -> d :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_b_e_e X' f' g' c' d' = pack_b_b_e_e X f g c d.
  apply pack_b_b_e_e_inj X' X f' f g' g c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_b_b_e_e_eta: forall S, struct_b_b_e_e S -> S = pack_b_b_e_e (S 0) (decode_b (S 1)) (decode_b (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_b_e_e (z 0) (decode_b (z 1)) (decode_b (z 2)) (z 3) (z 4)).
let X. let f. assume _. let g. assume _. let c. assume _. let d. assume _.
prove pack_b_b_e_e X f g c d = pack_b_b_e_e (pack_b_b_e_e X f g c d 0) (decode_b (pack_b_b_e_e X f g c d 1)) (decode_b (pack_b_b_e_e X f g c d 2)) (pack_b_b_e_e X f g c d 3) (pack_b_b_e_e X f g c d 4).
rewrite <- pack_b_b_e_e_0_eq2 X f g c d.
rewrite <- pack_b_b_e_e_3_eq2 X f g c d.
rewrite <- pack_b_b_e_e_4_eq2 X f g c d.
apply pack_b_b_e_e_ext.
- exact pack_b_b_e_e_1_eq2 X f g c d.
- exact pack_b_b_e_e_2_eq2 X f g c d.
Qed.


Definition unpack_b_b_e_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (S 3) (S 4).

Theorem unpack_b_b_e_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) -> Phi X f' g' c d = Phi X f g c d)
  ->
  unpack_b_b_e_e_i (pack_b_b_e_e X f g c d) Phi = Phi X f g c d.
let Phi X f g c d.
assume HPhi.
prove Phi (pack_b_b_e_e X f g c d 0) (decode_b (pack_b_b_e_e X f g c d 1)) (decode_b (pack_b_b_e_e X f g c d 2)) (pack_b_b_e_e X f g c d 3) (pack_b_b_e_e X f g c d 4) = Phi X f g c d.
rewrite <- pack_b_b_e_e_0_eq2 X f g c d.
prove Phi X (decode_b (pack_b_b_e_e X f g c d 1)) (decode_b (pack_b_b_e_e X f g c d 2)) (pack_b_b_e_e X f g c d 3) (pack_b_b_e_e X f g c d 4) = Phi X f g c d.
rewrite <- pack_b_b_e_e_3_eq2 X f g c d.
rewrite <- pack_b_b_e_e_4_eq2 X f g c d.
apply HPhi.
- exact pack_b_b_e_e_1_eq2 X f g c d.
- exact pack_b_b_e_e_2_eq2 X f g c d.
Qed.


Definition unpack_b_b_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (S 3) (S 4).

Theorem unpack_b_b_e_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall d:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) -> Phi X f' g' c d = Phi X f g c d)
  ->
  unpack_b_b_e_e_o (pack_b_b_e_e X f g c d) Phi = Phi X f g c d.
let Phi X f g c d.
assume HPhi.
prove Phi (pack_b_b_e_e X f g c d 0) (decode_b (pack_b_b_e_e X f g c d 1)) (decode_b (pack_b_b_e_e X f g c d 2)) (pack_b_b_e_e X f g c d 3) (pack_b_b_e_e X f g c d 4) = Phi X f g c d.
rewrite <- pack_b_b_e_e_0_eq2 X f g c d.
prove Phi X (decode_b (pack_b_b_e_e X f g c d 1)) (decode_b (pack_b_b_e_e X f g c d 2)) (pack_b_b_e_e X f g c d 3) (pack_b_b_e_e X f g c d 4) = Phi X f g c d.
rewrite <- pack_b_b_e_e_3_eq2 X f g c d.
rewrite <- pack_b_b_e_e_4_eq2 X f g c d.
apply HPhi.
- exact pack_b_b_e_e_1_eq2 X f g c d.
- exact pack_b_b_e_e_2_eq2 X f g c d.
Qed.


Definition pack_b_u_r_r : set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set := fun X f i R T => (X,encode_b X f,encode_u X i,encode_r X R,encode_r X T).

Theorem pack_b_u_r_r_0_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_b_u_r_r X f i R T -> X = S 0.
let S X f i R T. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_u X i,encode_r X R,encode_r X T) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_u_r_r_0_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, X = pack_b_u_r_r X f i R T 0.
let X f i R T. apply pack_b_u_r_r_0_eq (pack_b_u_r_r X f i R T) X f i R T. reflexivity.
Qed.

Theorem pack_b_u_r_r_1_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_b_u_r_r X f i R T -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f i R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_u X i,encode_r X R,encode_r X T) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_u_r_r_1_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, f x y = decode_b (pack_b_u_r_r X f i R T 1) x y.
let X f i R T. apply pack_b_u_r_r_1_eq (pack_b_u_r_r X f i R T) X f i R T. reflexivity.
Qed.

Theorem pack_b_u_r_r_2_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_b_u_r_r X f i R T -> forall x :e X, i x = decode_u (S 2) x.
let S X f i R T. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_u X i,encode_r X R,encode_r X T) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_u_r_r_2_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x :e X, i x = decode_u (pack_b_u_r_r X f i R T 2) x.
let X f i R T. apply pack_b_u_r_r_2_eq (pack_b_u_r_r X f i R T) X f i R T. reflexivity.
Qed.

Theorem pack_b_u_r_r_3_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_b_u_r_r X f i R T -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X f i R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_u X i,encode_r X R,encode_r X T) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_u_r_r_3_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_b_u_r_r X f i R T 3) x y.
let X f i R T. apply pack_b_u_r_r_3_eq (pack_b_u_r_r X f i R T) X f i R T. reflexivity.
Qed.

Theorem pack_b_u_r_r_4_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_b_u_r_r X f i R T -> forall x y :e X, T x y = decode_r (S 4) x y.
let S X f i R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_b X f,encode_u X i,encode_r X R,encode_r X T) 4) x y.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_b_u_r_r_4_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, T x y = decode_r (pack_b_u_r_r X f i R T 4) x y.
let X f i R T. apply pack_b_u_r_r_4_eq (pack_b_u_r_r X f i R T) X f i R T. reflexivity.
Qed.

Theorem pack_b_u_r_r_inj : forall X X', forall f f':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop, forall T T':set -> set -> prop, pack_b_u_r_r X f i R T = pack_b_u_r_r X' f' i' R' T' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y).
let X X' f f' i i' R R' T T'. assume H1.
claim L0: X' = pack_b_u_r_r X f i R T 0.
{ exact pack_b_u_r_r_0_eq (pack_b_u_r_r X f i R T) X' f' i' R' T' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_u_r_r_0_eq2 X f i R T. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_u_r_r_1_eq2 X f i R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_r_r_1_eq2 X' f' i' R' T' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_u_r_r_2_eq2 X f i R T x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_r_r_2_eq2 X' f' i' R' T' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_u_r_r_3_eq2 X f i R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_r_r_3_eq2 X' f' i' R' T' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_b_u_r_r_4_eq2 X f i R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_r_r_4_eq2 X' f' i' R' T' x Lx y Ly.
Qed.

Theorem pack_b_u_r_r_ext : forall X, forall f f':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop, forall T T':set -> set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 pack_b_u_r_r X f i R T = pack_b_u_r_r X f' i' R' T'.
let X f f' i i' R R' T T'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_u X i,encode_r X R,encode_r X T) = (X,encode_b X f',encode_u X i',encode_r X R',encode_r X T').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
claim L4: encode_r X T = encode_r X T'.
{ apply encode_r_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_u_r_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall T:set -> set -> prop, q (pack_b_u_r_r X f i R T)) -> q S.

Theorem pack_struct_b_u_r_r_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall T:set -> set -> prop, struct_b_u_r_r (pack_b_u_r_r X f i R T).
let X f. assume Hf. let i. assume Hi. let R T q. assume Hq.
exact Hq X f Hf i Hi R T.
Qed.

Theorem pack_struct_b_u_r_r_E1: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, struct_b_u_r_r (pack_b_u_r_r X f i R T) -> forall x y :e X, f x y :e X.
let X f i R T. assume H1. apply H1 (fun z => z = pack_b_u_r_r X f i R T -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let R'. let T'.
  assume Heq: pack_b_u_r_r X' f' i' R' T' = pack_b_u_r_r X f i R T.
  apply pack_b_u_r_r_inj X' X f' f i' i R' R T' T Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HR'R HT'T.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_u_r_r_E2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, struct_b_u_r_r (pack_b_u_r_r X f i R T) -> forall x :e X, i x :e X.
let X f i R T. assume H1. apply H1 (fun z => z = pack_b_u_r_r X f i R T -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let R'. let T'.
  assume Heq: pack_b_u_r_r X' f' i' R' T' = pack_b_u_r_r X f i R T.
  apply pack_b_u_r_r_inj X' X f' f i' i R' R T' T Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HR'R HT'T.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_b_u_r_r_eta: forall S, struct_b_u_r_r S -> S = pack_b_u_r_r (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_r (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_u_r_r (z 0) (decode_b (z 1)) (decode_u (z 2)) (decode_r (z 3)) (decode_r (z 4))).
let X. let f. assume _. let i. assume _. let R. let T.
prove pack_b_u_r_r X f i R T = pack_b_u_r_r (pack_b_u_r_r X f i R T 0) (decode_b (pack_b_u_r_r X f i R T 1)) (decode_u (pack_b_u_r_r X f i R T 2)) (decode_r (pack_b_u_r_r X f i R T 3)) (decode_r (pack_b_u_r_r X f i R T 4)).
rewrite <- pack_b_u_r_r_0_eq2 X f i R T.
apply pack_b_u_r_r_ext.
- exact pack_b_u_r_r_1_eq2 X f i R T.
- exact pack_b_u_r_r_2_eq2 X f i R T.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_u_r_r_3_eq2 X f i R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_u_r_r_4_eq2 X f i R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_u_r_r_i : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_r (S 4)).

Theorem unpack_b_u_r_r_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X f' i' R' T' = Phi X f i R T)
  ->
  unpack_b_u_r_r_i (pack_b_u_r_r X f i R T) Phi = Phi X f i R T.
let Phi X f i R T.
assume HPhi.
prove Phi (pack_b_u_r_r X f i R T 0) (decode_b (pack_b_u_r_r X f i R T 1)) (decode_u (pack_b_u_r_r X f i R T 2)) (decode_r (pack_b_u_r_r X f i R T 3)) (decode_r (pack_b_u_r_r X f i R T 4)) = Phi X f i R T.
rewrite <- pack_b_u_r_r_0_eq2 X f i R T.
prove Phi X (decode_b (pack_b_u_r_r X f i R T 1)) (decode_u (pack_b_u_r_r X f i R T 2)) (decode_r (pack_b_u_r_r X f i R T 3)) (decode_r (pack_b_u_r_r X f i R T 4)) = Phi X f i R T.
apply HPhi.
- exact pack_b_u_r_r_1_eq2 X f i R T.
- exact pack_b_u_r_r_2_eq2 X f i R T.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_u_r_r X f i R T 3) x y.
  rewrite <- pack_b_u_r_r_3_eq2 X f i R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_b_u_r_r X f i R T 4) x y.
  rewrite <- pack_b_u_r_r_4_eq2 X f i R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_u_r_r_o : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_r (S 4)).

Theorem unpack_b_u_r_r_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X f' i' R' T' = Phi X f i R T)
  ->
  unpack_b_u_r_r_o (pack_b_u_r_r X f i R T) Phi = Phi X f i R T.
let Phi X f i R T.
assume HPhi.
prove Phi (pack_b_u_r_r X f i R T 0) (decode_b (pack_b_u_r_r X f i R T 1)) (decode_u (pack_b_u_r_r X f i R T 2)) (decode_r (pack_b_u_r_r X f i R T 3)) (decode_r (pack_b_u_r_r X f i R T 4)) = Phi X f i R T.
rewrite <- pack_b_u_r_r_0_eq2 X f i R T.
prove Phi X (decode_b (pack_b_u_r_r X f i R T 1)) (decode_u (pack_b_u_r_r X f i R T 2)) (decode_r (pack_b_u_r_r X f i R T 3)) (decode_r (pack_b_u_r_r X f i R T 4)) = Phi X f i R T.
apply HPhi.
- exact pack_b_u_r_r_1_eq2 X f i R T.
- exact pack_b_u_r_r_2_eq2 X f i R T.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_u_r_r X f i R T 3) x y.
  rewrite <- pack_b_u_r_r_3_eq2 X f i R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_b_u_r_r X f i R T 4) x y.
  rewrite <- pack_b_u_r_r_4_eq2 X f i R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_u_r_p : set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set := fun X f i R P => (X,encode_b X f,encode_u X i,encode_r X R,encode_p X P).

Theorem pack_b_u_r_p_0_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_u_r_p X f i R P -> X = S 0.
let S X f i R P. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_u X i,encode_r X R,encode_p X P) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_u_r_p_0_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, X = pack_b_u_r_p X f i R P 0.
let X f i R P. apply pack_b_u_r_p_0_eq (pack_b_u_r_p X f i R P) X f i R P. reflexivity.
Qed.

Theorem pack_b_u_r_p_1_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_u_r_p X f i R P -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f i R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_u X i,encode_r X R,encode_p X P) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_u_r_p_1_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_b_u_r_p X f i R P 1) x y.
let X f i R P. apply pack_b_u_r_p_1_eq (pack_b_u_r_p X f i R P) X f i R P. reflexivity.
Qed.

Theorem pack_b_u_r_p_2_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_u_r_p X f i R P -> forall x :e X, i x = decode_u (S 2) x.
let S X f i R P. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_u X i,encode_r X R,encode_p X P) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_u_r_p_2_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, i x = decode_u (pack_b_u_r_p X f i R P 2) x.
let X f i R P. apply pack_b_u_r_p_2_eq (pack_b_u_r_p X f i R P) X f i R P. reflexivity.
Qed.

Theorem pack_b_u_r_p_3_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_u_r_p X f i R P -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X f i R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_u X i,encode_r X R,encode_p X P) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_u_r_p_3_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, R x y = decode_r (pack_b_u_r_p X f i R P 3) x y.
let X f i R P. apply pack_b_u_r_p_3_eq (pack_b_u_r_p X f i R P) X f i R P. reflexivity.
Qed.

Theorem pack_b_u_r_p_4_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_u_r_p X f i R P -> forall x :e X, P x = decode_p (S 4) x.
let S X f i R P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_u X i,encode_r X R,encode_p X P) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_u_r_p_4_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_b_u_r_p X f i R P 4) x.
let X f i R P. apply pack_b_u_r_p_4_eq (pack_b_u_r_p X f i R P) X f i R P. reflexivity.
Qed.

Theorem pack_b_u_r_p_inj : forall X X', forall f f':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, pack_b_u_r_p X f i R P = pack_b_u_r_p X' f' i' R' P' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x).
let X X' f f' i i' R R' P P'. assume H1.
claim L0: X' = pack_b_u_r_p X f i R P 0.
{ exact pack_b_u_r_p_0_eq (pack_b_u_r_p X f i R P) X' f' i' R' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_u_r_p_0_eq2 X f i R P. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_u_r_p_1_eq2 X f i R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_r_p_1_eq2 X' f' i' R' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_u_r_p_2_eq2 X f i R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_r_p_2_eq2 X' f' i' R' P' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_u_r_p_3_eq2 X f i R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_r_p_3_eq2 X' f' i' R' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_u_r_p_4_eq2 X f i R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_r_p_4_eq2 X' f' i' R' P' x Lx.
Qed.

Theorem pack_b_u_r_p_ext : forall X, forall f f':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_u_r_p X f i R P = pack_b_u_r_p X f' i' R' P'.
let X f f' i i' R R' P P'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_u X i,encode_r X R,encode_p X P) = (X,encode_b X f',encode_u X i',encode_r X R',encode_p X P').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_u_r_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, q (pack_b_u_r_p X f i R P)) -> q S.

Theorem pack_struct_b_u_r_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, struct_b_u_r_p (pack_b_u_r_p X f i R P).
let X f. assume Hf. let i. assume Hi. let R P q. assume Hq.
exact Hq X f Hf i Hi R P.
Qed.

Theorem pack_struct_b_u_r_p_E1: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, struct_b_u_r_p (pack_b_u_r_p X f i R P) -> forall x y :e X, f x y :e X.
let X f i R P. assume H1. apply H1 (fun z => z = pack_b_u_r_p X f i R P -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let R'. let P'.
  assume Heq: pack_b_u_r_p X' f' i' R' P' = pack_b_u_r_p X f i R P.
  apply pack_b_u_r_p_inj X' X f' f i' i R' R P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HR'R HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_u_r_p_E2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, struct_b_u_r_p (pack_b_u_r_p X f i R P) -> forall x :e X, i x :e X.
let X f i R P. assume H1. apply H1 (fun z => z = pack_b_u_r_p X f i R P -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let R'. let P'.
  assume Heq: pack_b_u_r_p X' f' i' R' P' = pack_b_u_r_p X f i R P.
  apply pack_b_u_r_p_inj X' X f' f i' i R' R P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HR'R HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_b_u_r_p_eta: forall S, struct_b_u_r_p S -> S = pack_b_u_r_p (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_u_r_p (z 0) (decode_b (z 1)) (decode_u (z 2)) (decode_r (z 3)) (decode_p (z 4))).
let X. let f. assume _. let i. assume _. let R. let P.
prove pack_b_u_r_p X f i R P = pack_b_u_r_p (pack_b_u_r_p X f i R P 0) (decode_b (pack_b_u_r_p X f i R P 1)) (decode_u (pack_b_u_r_p X f i R P 2)) (decode_r (pack_b_u_r_p X f i R P 3)) (decode_p (pack_b_u_r_p X f i R P 4)).
rewrite <- pack_b_u_r_p_0_eq2 X f i R P.
apply pack_b_u_r_p_ext.
- exact pack_b_u_r_p_1_eq2 X f i R P.
- exact pack_b_u_r_p_2_eq2 X f i R P.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_u_r_p_3_eq2 X f i R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_b_u_r_p_4_eq2 X f i R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_u_r_p_i : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_p (S 4)).

Theorem unpack_b_u_r_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' i' R' P' = Phi X f i R P)
  ->
  unpack_b_u_r_p_i (pack_b_u_r_p X f i R P) Phi = Phi X f i R P.
let Phi X f i R P.
assume HPhi.
prove Phi (pack_b_u_r_p X f i R P 0) (decode_b (pack_b_u_r_p X f i R P 1)) (decode_u (pack_b_u_r_p X f i R P 2)) (decode_r (pack_b_u_r_p X f i R P 3)) (decode_p (pack_b_u_r_p X f i R P 4)) = Phi X f i R P.
rewrite <- pack_b_u_r_p_0_eq2 X f i R P.
prove Phi X (decode_b (pack_b_u_r_p X f i R P 1)) (decode_u (pack_b_u_r_p X f i R P 2)) (decode_r (pack_b_u_r_p X f i R P 3)) (decode_p (pack_b_u_r_p X f i R P 4)) = Phi X f i R P.
apply HPhi.
- exact pack_b_u_r_p_1_eq2 X f i R P.
- exact pack_b_u_r_p_2_eq2 X f i R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_u_r_p X f i R P 3) x y.
  rewrite <- pack_b_u_r_p_3_eq2 X f i R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_u_r_p X f i R P 4) x.
  rewrite <- pack_b_u_r_p_4_eq2 X f i R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_u_r_p_o : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_p (S 4)).

Theorem unpack_b_u_r_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' i' R' P' = Phi X f i R P)
  ->
  unpack_b_u_r_p_o (pack_b_u_r_p X f i R P) Phi = Phi X f i R P.
let Phi X f i R P.
assume HPhi.
prove Phi (pack_b_u_r_p X f i R P 0) (decode_b (pack_b_u_r_p X f i R P 1)) (decode_u (pack_b_u_r_p X f i R P 2)) (decode_r (pack_b_u_r_p X f i R P 3)) (decode_p (pack_b_u_r_p X f i R P 4)) = Phi X f i R P.
rewrite <- pack_b_u_r_p_0_eq2 X f i R P.
prove Phi X (decode_b (pack_b_u_r_p X f i R P 1)) (decode_u (pack_b_u_r_p X f i R P 2)) (decode_r (pack_b_u_r_p X f i R P 3)) (decode_p (pack_b_u_r_p X f i R P 4)) = Phi X f i R P.
apply HPhi.
- exact pack_b_u_r_p_1_eq2 X f i R P.
- exact pack_b_u_r_p_2_eq2 X f i R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_u_r_p X f i R P 3) x y.
  rewrite <- pack_b_u_r_p_3_eq2 X f i R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_u_r_p X f i R P 4) x.
  rewrite <- pack_b_u_r_p_4_eq2 X f i R P x Hx.
  apply iff_refl.
Qed.


Definition pack_b_u_r_e : set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set -> set := fun X f i R c => (X,encode_b X f,encode_u X i,encode_r X R,c).

Theorem pack_b_u_r_e_0_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_u_r_e X f i R c -> X = S 0.
let S X f i R c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_u X i,encode_r X R,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_u_r_e_0_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, X = pack_b_u_r_e X f i R c 0.
let X f i R c. apply pack_b_u_r_e_0_eq (pack_b_u_r_e X f i R c) X f i R c. reflexivity.
Qed.

Theorem pack_b_u_r_e_1_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_u_r_e X f i R c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f i R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_u X i,encode_r X R,c) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_u_r_e_1_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, f x y = decode_b (pack_b_u_r_e X f i R c 1) x y.
let X f i R c. apply pack_b_u_r_e_1_eq (pack_b_u_r_e X f i R c) X f i R c. reflexivity.
Qed.

Theorem pack_b_u_r_e_2_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_u_r_e X f i R c -> forall x :e X, i x = decode_u (S 2) x.
let S X f i R c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_u X i,encode_r X R,c) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_u_r_e_2_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall x :e X, i x = decode_u (pack_b_u_r_e X f i R c 2) x.
let X f i R c. apply pack_b_u_r_e_2_eq (pack_b_u_r_e X f i R c) X f i R c. reflexivity.
Qed.

Theorem pack_b_u_r_e_3_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_u_r_e X f i R c -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X f i R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_u X i,encode_r X R,c) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_u_r_e_3_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_b_u_r_e X f i R c 3) x y.
let X f i R c. apply pack_b_u_r_e_3_eq (pack_b_u_r_e X f i R c) X f i R c. reflexivity.
Qed.

Theorem pack_b_u_r_e_4_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_u_r_e X f i R c -> c = S 4.
let S X f i R c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_u X i,encode_r X R,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_u_r_e_4_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, c = pack_b_u_r_e X f i R c 4.
let X f i R c. apply pack_b_u_r_e_4_eq (pack_b_u_r_e X f i R c) X f i R c. reflexivity.
Qed.

Theorem pack_b_u_r_e_inj : forall X X', forall f f':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop, forall c c':set, pack_b_u_r_e X f i R c = pack_b_u_r_e X' f' i' R' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ c = c'.
let X X' f f' i i' R R' c c'. assume H1.
claim L0: X' = pack_b_u_r_e X f i R c 0.
{ exact pack_b_u_r_e_0_eq (pack_b_u_r_e X f i R c) X' f' i' R' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_u_r_e_0_eq2 X f i R c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_u_r_e_1_eq2 X f i R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_r_e_1_eq2 X' f' i' R' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_u_r_e_2_eq2 X f i R c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_r_e_2_eq2 X' f' i' R' c' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_u_r_e_3_eq2 X f i R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_r_e_3_eq2 X' f' i' R' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_b_u_r_e_4_eq2 X f i R c.
  rewrite H1. symmetry.
  exact pack_b_u_r_e_4_eq2 X' f' i' R' c'.
Qed.

Theorem pack_b_u_r_e_ext : forall X, forall f f':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_b_u_r_e X f i R c = pack_b_u_r_e X f' i' R' c.
let X f f' i i' R R' c. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_u X i,encode_r X R,c) = (X,encode_b X f',encode_u X i',encode_r X R',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_b_u_r_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> q (pack_b_u_r_e X f i R c)) -> q S.

Theorem pack_struct_b_u_r_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> struct_b_u_r_e (pack_b_u_r_e X f i R c).
let X f. assume Hf. let i. assume Hi. let R c. assume Hc. let q. assume Hq.
exact Hq X f Hf i Hi R c Hc.
Qed.

Theorem pack_struct_b_u_r_e_E1: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, struct_b_u_r_e (pack_b_u_r_e X f i R c) -> forall x y :e X, f x y :e X.
let X f i R c. assume H1. apply H1 (fun z => z = pack_b_u_r_e X f i R c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let R'. let c'. assume Hc'.
  assume Heq: pack_b_u_r_e X' f' i' R' c' = pack_b_u_r_e X f i R c.
  apply pack_b_u_r_e_inj X' X f' f i' i R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HR'R Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_u_r_e_E2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, struct_b_u_r_e (pack_b_u_r_e X f i R c) -> forall x :e X, i x :e X.
let X f i R c. assume H1. apply H1 (fun z => z = pack_b_u_r_e X f i R c -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let R'. let c'. assume Hc'.
  assume Heq: pack_b_u_r_e X' f' i' R' c' = pack_b_u_r_e X f i R c.
  apply pack_b_u_r_e_inj X' X f' f i' i R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HR'R Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_b_u_r_e_E4: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set, struct_b_u_r_e (pack_b_u_r_e X f i R c) -> c :e X.
let X f i R c. assume H1. apply H1 (fun z => z = pack_b_u_r_e X f i R c -> c :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let R'. let c'. assume Hc'.
  assume Heq: pack_b_u_r_e X' f' i' R' c' = pack_b_u_r_e X f i R c.
  apply pack_b_u_r_e_inj X' X f' f i' i R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HR'R Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_u_r_e_eta: forall S, struct_b_u_r_e S -> S = pack_b_u_r_e (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_u_r_e (z 0) (decode_b (z 1)) (decode_u (z 2)) (decode_r (z 3)) (z 4)).
let X. let f. assume _. let i. assume _. let R. let c. assume _.
prove pack_b_u_r_e X f i R c = pack_b_u_r_e (pack_b_u_r_e X f i R c 0) (decode_b (pack_b_u_r_e X f i R c 1)) (decode_u (pack_b_u_r_e X f i R c 2)) (decode_r (pack_b_u_r_e X f i R c 3)) (pack_b_u_r_e X f i R c 4).
rewrite <- pack_b_u_r_e_0_eq2 X f i R c.
rewrite <- pack_b_u_r_e_4_eq2 X f i R c.
apply pack_b_u_r_e_ext.
- exact pack_b_u_r_e_1_eq2 X f i R c.
- exact pack_b_u_r_e_2_eq2 X f i R c.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_u_r_e_3_eq2 X f i R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_u_r_e_i : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)) (S 4).

Theorem unpack_b_u_r_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set -> set,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' i' R' c = Phi X f i R c)
  ->
  unpack_b_u_r_e_i (pack_b_u_r_e X f i R c) Phi = Phi X f i R c.
let Phi X f i R c.
assume HPhi.
prove Phi (pack_b_u_r_e X f i R c 0) (decode_b (pack_b_u_r_e X f i R c 1)) (decode_u (pack_b_u_r_e X f i R c 2)) (decode_r (pack_b_u_r_e X f i R c 3)) (pack_b_u_r_e X f i R c 4) = Phi X f i R c.
rewrite <- pack_b_u_r_e_0_eq2 X f i R c.
prove Phi X (decode_b (pack_b_u_r_e X f i R c 1)) (decode_u (pack_b_u_r_e X f i R c 2)) (decode_r (pack_b_u_r_e X f i R c 3)) (pack_b_u_r_e X f i R c 4) = Phi X f i R c.
rewrite <- pack_b_u_r_e_4_eq2 X f i R c.
apply HPhi.
- exact pack_b_u_r_e_1_eq2 X f i R c.
- exact pack_b_u_r_e_2_eq2 X f i R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_u_r_e X f i R c 3) x y.
  rewrite <- pack_b_u_r_e_3_eq2 X f i R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_u_r_e_o : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)) (S 4).

Theorem unpack_b_u_r_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set -> prop,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' i' R' c = Phi X f i R c)
  ->
  unpack_b_u_r_e_o (pack_b_u_r_e X f i R c) Phi = Phi X f i R c.
let Phi X f i R c.
assume HPhi.
prove Phi (pack_b_u_r_e X f i R c 0) (decode_b (pack_b_u_r_e X f i R c 1)) (decode_u (pack_b_u_r_e X f i R c 2)) (decode_r (pack_b_u_r_e X f i R c 3)) (pack_b_u_r_e X f i R c 4) = Phi X f i R c.
rewrite <- pack_b_u_r_e_0_eq2 X f i R c.
prove Phi X (decode_b (pack_b_u_r_e X f i R c 1)) (decode_u (pack_b_u_r_e X f i R c 2)) (decode_r (pack_b_u_r_e X f i R c 3)) (pack_b_u_r_e X f i R c 4) = Phi X f i R c.
rewrite <- pack_b_u_r_e_4_eq2 X f i R c.
apply HPhi.
- exact pack_b_u_r_e_1_eq2 X f i R c.
- exact pack_b_u_r_e_2_eq2 X f i R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_u_r_e X f i R c 3) x y.
  rewrite <- pack_b_u_r_e_3_eq2 X f i R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_u_p_p : set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> (set -> prop) -> set := fun X f i P Q => (X,encode_b X f,encode_u X i,encode_p X P,encode_p X Q).

Theorem pack_b_u_p_p_0_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_b_u_p_p X f i P Q -> X = S 0.
let S X f i P Q. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_u X i,encode_p X P,encode_p X Q) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_u_p_p_0_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, X = pack_b_u_p_p X f i P Q 0.
let X f i P Q. apply pack_b_u_p_p_0_eq (pack_b_u_p_p X f i P Q) X f i P Q. reflexivity.
Qed.

Theorem pack_b_u_p_p_1_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_b_u_p_p X f i P Q -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f i P Q. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_u X i,encode_p X P,encode_p X Q) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_u_p_p_1_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x y :e X, f x y = decode_b (pack_b_u_p_p X f i P Q 1) x y.
let X f i P Q. apply pack_b_u_p_p_1_eq (pack_b_u_p_p X f i P Q) X f i P Q. reflexivity.
Qed.

Theorem pack_b_u_p_p_2_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_b_u_p_p X f i P Q -> forall x :e X, i x = decode_u (S 2) x.
let S X f i P Q. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_u X i,encode_p X P,encode_p X Q) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_u_p_p_2_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, i x = decode_u (pack_b_u_p_p X f i P Q 2) x.
let X f i P Q. apply pack_b_u_p_p_2_eq (pack_b_u_p_p X f i P Q) X f i P Q. reflexivity.
Qed.

Theorem pack_b_u_p_p_3_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_b_u_p_p X f i P Q -> forall x :e X, P x = decode_p (S 3) x.
let S X f i P Q. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_u X i,encode_p X P,encode_p X Q) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_u_p_p_3_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, P x = decode_p (pack_b_u_p_p X f i P Q 3) x.
let X f i P Q. apply pack_b_u_p_p_3_eq (pack_b_u_p_p X f i P Q) X f i P Q. reflexivity.
Qed.

Theorem pack_b_u_p_p_4_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_b_u_p_p X f i P Q -> forall x :e X, Q x = decode_p (S 4) x.
let S X f i P Q. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_b X f,encode_u X i,encode_p X P,encode_p X Q) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_b_u_p_p_4_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, Q x = decode_p (pack_b_u_p_p X f i P Q 4) x.
let X f i P Q. apply pack_b_u_p_p_4_eq (pack_b_u_p_p X f i P Q) X f i P Q. reflexivity.
Qed.

Theorem pack_b_u_p_p_inj : forall X X', forall f f':set -> set -> set, forall i i':set -> set, forall P P':set -> prop, forall Q Q':set -> prop, pack_b_u_p_p X f i P Q = pack_b_u_p_p X' f' i' P' Q' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x).
let X X' f f' i i' P P' Q Q'. assume H1.
claim L0: X' = pack_b_u_p_p X f i P Q 0.
{ exact pack_b_u_p_p_0_eq (pack_b_u_p_p X f i P Q) X' f' i' P' Q' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_u_p_p_0_eq2 X f i P Q. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_u_p_p_1_eq2 X f i P Q x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_p_p_1_eq2 X' f' i' P' Q' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_u_p_p_2_eq2 X f i P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_p_p_2_eq2 X' f' i' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_u_p_p_3_eq2 X f i P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_p_p_3_eq2 X' f' i' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_b_u_p_p_4_eq2 X f i P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_p_p_4_eq2 X' f' i' P' Q' x Lx.
Qed.

Theorem pack_b_u_p_p_ext : forall X, forall f f':set -> set -> set, forall i i':set -> set, forall P P':set -> prop, forall Q Q':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_b_u_p_p X f i P Q = pack_b_u_p_p X f' i' P' Q'.
let X f f' i i' P P' Q Q'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_u X i,encode_p X P,encode_p X Q) = (X,encode_b X f',encode_u X i',encode_p X P',encode_p X Q').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_u_p_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall Q:set -> prop, q (pack_b_u_p_p X f i P Q)) -> q S.

Theorem pack_struct_b_u_p_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall Q:set -> prop, struct_b_u_p_p (pack_b_u_p_p X f i P Q).
let X f. assume Hf. let i. assume Hi. let P Q q. assume Hq.
exact Hq X f Hf i Hi P Q.
Qed.

Theorem pack_struct_b_u_p_p_E1: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, struct_b_u_p_p (pack_b_u_p_p X f i P Q) -> forall x y :e X, f x y :e X.
let X f i P Q. assume H1. apply H1 (fun z => z = pack_b_u_p_p X f i P Q -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let P'. let Q'.
  assume Heq: pack_b_u_p_p X' f' i' P' Q' = pack_b_u_p_p X f i P Q.
  apply pack_b_u_p_p_inj X' X f' f i' i P' P Q' Q Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HP'P HQ'Q.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_u_p_p_E2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop, struct_b_u_p_p (pack_b_u_p_p X f i P Q) -> forall x :e X, i x :e X.
let X f i P Q. assume H1. apply H1 (fun z => z = pack_b_u_p_p X f i P Q -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let P'. let Q'.
  assume Heq: pack_b_u_p_p X' f' i' P' Q' = pack_b_u_p_p X f i P Q.
  apply pack_b_u_p_p_inj X' X f' f i' i P' P Q' Q Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HP'P HQ'Q.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_b_u_p_p_eta: forall S, struct_b_u_p_p S -> S = pack_b_u_p_p (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_p (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_u_p_p (z 0) (decode_b (z 1)) (decode_u (z 2)) (decode_p (z 3)) (decode_p (z 4))).
let X. let f. assume _. let i. assume _. let P. let Q.
prove pack_b_u_p_p X f i P Q = pack_b_u_p_p (pack_b_u_p_p X f i P Q 0) (decode_b (pack_b_u_p_p X f i P Q 1)) (decode_u (pack_b_u_p_p X f i P Q 2)) (decode_p (pack_b_u_p_p X f i P Q 3)) (decode_p (pack_b_u_p_p X f i P Q 4)).
rewrite <- pack_b_u_p_p_0_eq2 X f i P Q.
apply pack_b_u_p_p_ext.
- exact pack_b_u_p_p_1_eq2 X f i P Q.
- exact pack_b_u_p_p_2_eq2 X f i P Q.
- let x. assume Hx.
  rewrite <- pack_b_u_p_p_3_eq2 X f i P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_b_u_p_p_4_eq2 X f i P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_u_p_p_i : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_b_u_p_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X f' i' P' Q' = Phi X f i P Q)
  ->
  unpack_b_u_p_p_i (pack_b_u_p_p X f i P Q) Phi = Phi X f i P Q.
let Phi X f i P Q.
assume HPhi.
prove Phi (pack_b_u_p_p X f i P Q 0) (decode_b (pack_b_u_p_p X f i P Q 1)) (decode_u (pack_b_u_p_p X f i P Q 2)) (decode_p (pack_b_u_p_p X f i P Q 3)) (decode_p (pack_b_u_p_p X f i P Q 4)) = Phi X f i P Q.
rewrite <- pack_b_u_p_p_0_eq2 X f i P Q.
prove Phi X (decode_b (pack_b_u_p_p X f i P Q 1)) (decode_u (pack_b_u_p_p X f i P Q 2)) (decode_p (pack_b_u_p_p X f i P Q 3)) (decode_p (pack_b_u_p_p X f i P Q 4)) = Phi X f i P Q.
apply HPhi.
- exact pack_b_u_p_p_1_eq2 X f i P Q.
- exact pack_b_u_p_p_2_eq2 X f i P Q.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_u_p_p X f i P Q 3) x.
  rewrite <- pack_b_u_p_p_3_eq2 X f i P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_b_u_p_p X f i P Q 4) x.
  rewrite <- pack_b_u_p_p_4_eq2 X f i P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_u_p_p_o : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_b_u_p_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall Q:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X f' i' P' Q' = Phi X f i P Q)
  ->
  unpack_b_u_p_p_o (pack_b_u_p_p X f i P Q) Phi = Phi X f i P Q.
let Phi X f i P Q.
assume HPhi.
prove Phi (pack_b_u_p_p X f i P Q 0) (decode_b (pack_b_u_p_p X f i P Q 1)) (decode_u (pack_b_u_p_p X f i P Q 2)) (decode_p (pack_b_u_p_p X f i P Q 3)) (decode_p (pack_b_u_p_p X f i P Q 4)) = Phi X f i P Q.
rewrite <- pack_b_u_p_p_0_eq2 X f i P Q.
prove Phi X (decode_b (pack_b_u_p_p X f i P Q 1)) (decode_u (pack_b_u_p_p X f i P Q 2)) (decode_p (pack_b_u_p_p X f i P Q 3)) (decode_p (pack_b_u_p_p X f i P Q 4)) = Phi X f i P Q.
apply HPhi.
- exact pack_b_u_p_p_1_eq2 X f i P Q.
- exact pack_b_u_p_p_2_eq2 X f i P Q.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_u_p_p X f i P Q 3) x.
  rewrite <- pack_b_u_p_p_3_eq2 X f i P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_b_u_p_p X f i P Q 4) x.
  rewrite <- pack_b_u_p_p_4_eq2 X f i P Q x Hx.
  apply iff_refl.
Qed.


Definition pack_b_u_p_e : set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set -> set := fun X f i P c => (X,encode_b X f,encode_u X i,encode_p X P,c).

Theorem pack_b_u_p_e_0_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_b_u_p_e X f i P c -> X = S 0.
let S X f i P c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_u X i,encode_p X P,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_u_p_e_0_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, X = pack_b_u_p_e X f i P c 0.
let X f i P c. apply pack_b_u_p_e_0_eq (pack_b_u_p_e X f i P c) X f i P c. reflexivity.
Qed.

Theorem pack_b_u_p_e_1_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_b_u_p_e X f i P c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f i P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_u X i,encode_p X P,c) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_u_p_e_1_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, forall x y :e X, f x y = decode_b (pack_b_u_p_e X f i P c 1) x y.
let X f i P c. apply pack_b_u_p_e_1_eq (pack_b_u_p_e X f i P c) X f i P c. reflexivity.
Qed.

Theorem pack_b_u_p_e_2_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_b_u_p_e X f i P c -> forall x :e X, i x = decode_u (S 2) x.
let S X f i P c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_u X i,encode_p X P,c) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_u_p_e_2_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, forall x :e X, i x = decode_u (pack_b_u_p_e X f i P c 2) x.
let X f i P c. apply pack_b_u_p_e_2_eq (pack_b_u_p_e X f i P c) X f i P c. reflexivity.
Qed.

Theorem pack_b_u_p_e_3_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_b_u_p_e X f i P c -> forall x :e X, P x = decode_p (S 3) x.
let S X f i P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_u X i,encode_p X P,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_u_p_e_3_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_b_u_p_e X f i P c 3) x.
let X f i P c. apply pack_b_u_p_e_3_eq (pack_b_u_p_e X f i P c) X f i P c. reflexivity.
Qed.

Theorem pack_b_u_p_e_4_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_b_u_p_e X f i P c -> c = S 4.
let S X f i P c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_u X i,encode_p X P,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_u_p_e_4_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, c = pack_b_u_p_e X f i P c 4.
let X f i P c. apply pack_b_u_p_e_4_eq (pack_b_u_p_e X f i P c) X f i P c. reflexivity.
Qed.

Theorem pack_b_u_p_e_inj : forall X X', forall f f':set -> set -> set, forall i i':set -> set, forall P P':set -> prop, forall c c':set, pack_b_u_p_e X f i P c = pack_b_u_p_e X' f' i' P' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' f f' i i' P P' c c'. assume H1.
claim L0: X' = pack_b_u_p_e X f i P c 0.
{ exact pack_b_u_p_e_0_eq (pack_b_u_p_e X f i P c) X' f' i' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_u_p_e_0_eq2 X f i P c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_u_p_e_1_eq2 X f i P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_p_e_1_eq2 X' f' i' P' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_u_p_e_2_eq2 X f i P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_p_e_2_eq2 X' f' i' P' c' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_u_p_e_3_eq2 X f i P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_p_e_3_eq2 X' f' i' P' c' x Lx.
- prove c = c'.
  rewrite pack_b_u_p_e_4_eq2 X f i P c.
  rewrite H1. symmetry.
  exact pack_b_u_p_e_4_eq2 X' f' i' P' c'.
Qed.

Theorem pack_b_u_p_e_ext : forall X, forall f f':set -> set -> set, forall i i':set -> set, forall P P':set -> prop, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_u_p_e X f i P c = pack_b_u_p_e X f' i' P' c.
let X f f' i i' P P' c. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_u X i,encode_p X P,c) = (X,encode_b X f',encode_u X i',encode_p X P',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_b_u_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall c:set, c :e X -> q (pack_b_u_p_e X f i P c)) -> q S.

Theorem pack_struct_b_u_p_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall c:set, c :e X -> struct_b_u_p_e (pack_b_u_p_e X f i P c).
let X f. assume Hf. let i. assume Hi. let P c. assume Hc. let q. assume Hq.
exact Hq X f Hf i Hi P c Hc.
Qed.

Theorem pack_struct_b_u_p_e_E1: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, struct_b_u_p_e (pack_b_u_p_e X f i P c) -> forall x y :e X, f x y :e X.
let X f i P c. assume H1. apply H1 (fun z => z = pack_b_u_p_e X f i P c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let P'. let c'. assume Hc'.
  assume Heq: pack_b_u_p_e X' f' i' P' c' = pack_b_u_p_e X f i P c.
  apply pack_b_u_p_e_inj X' X f' f i' i P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_u_p_e_E2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, struct_b_u_p_e (pack_b_u_p_e X f i P c) -> forall x :e X, i x :e X.
let X f i P c. assume H1. apply H1 (fun z => z = pack_b_u_p_e X f i P c -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let P'. let c'. assume Hc'.
  assume Heq: pack_b_u_p_e X' f' i' P' c' = pack_b_u_p_e X f i P c.
  apply pack_b_u_p_e_inj X' X f' f i' i P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_b_u_p_e_E4: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set, struct_b_u_p_e (pack_b_u_p_e X f i P c) -> c :e X.
let X f i P c. assume H1. apply H1 (fun z => z = pack_b_u_p_e X f i P c -> c :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let P'. let c'. assume Hc'.
  assume Heq: pack_b_u_p_e X' f' i' P' c' = pack_b_u_p_e X f i P c.
  apply pack_b_u_p_e_inj X' X f' f i' i P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_u_p_e_eta: forall S, struct_b_u_p_e S -> S = pack_b_u_p_e (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_p (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_u_p_e (z 0) (decode_b (z 1)) (decode_u (z 2)) (decode_p (z 3)) (z 4)).
let X. let f. assume _. let i. assume _. let P. let c. assume _.
prove pack_b_u_p_e X f i P c = pack_b_u_p_e (pack_b_u_p_e X f i P c 0) (decode_b (pack_b_u_p_e X f i P c 1)) (decode_u (pack_b_u_p_e X f i P c 2)) (decode_p (pack_b_u_p_e X f i P c 3)) (pack_b_u_p_e X f i P c 4).
rewrite <- pack_b_u_p_e_0_eq2 X f i P c.
rewrite <- pack_b_u_p_e_4_eq2 X f i P c.
apply pack_b_u_p_e_ext.
- exact pack_b_u_p_e_1_eq2 X f i P c.
- exact pack_b_u_p_e_2_eq2 X f i P c.
- let x. assume Hx.
  rewrite <- pack_b_u_p_e_3_eq2 X f i P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_u_p_e_i : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_b_u_p_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set -> set,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' i' P' c = Phi X f i P c)
  ->
  unpack_b_u_p_e_i (pack_b_u_p_e X f i P c) Phi = Phi X f i P c.
let Phi X f i P c.
assume HPhi.
prove Phi (pack_b_u_p_e X f i P c 0) (decode_b (pack_b_u_p_e X f i P c 1)) (decode_u (pack_b_u_p_e X f i P c 2)) (decode_p (pack_b_u_p_e X f i P c 3)) (pack_b_u_p_e X f i P c 4) = Phi X f i P c.
rewrite <- pack_b_u_p_e_0_eq2 X f i P c.
prove Phi X (decode_b (pack_b_u_p_e X f i P c 1)) (decode_u (pack_b_u_p_e X f i P c 2)) (decode_p (pack_b_u_p_e X f i P c 3)) (pack_b_u_p_e X f i P c 4) = Phi X f i P c.
rewrite <- pack_b_u_p_e_4_eq2 X f i P c.
apply HPhi.
- exact pack_b_u_p_e_1_eq2 X f i P c.
- exact pack_b_u_p_e_2_eq2 X f i P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_u_p_e X f i P c 3) x.
  rewrite <- pack_b_u_p_e_3_eq2 X f i P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_u_p_e_o : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_b_u_p_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set -> prop,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' i' P' c = Phi X f i P c)
  ->
  unpack_b_u_p_e_o (pack_b_u_p_e X f i P c) Phi = Phi X f i P c.
let Phi X f i P c.
assume HPhi.
prove Phi (pack_b_u_p_e X f i P c 0) (decode_b (pack_b_u_p_e X f i P c 1)) (decode_u (pack_b_u_p_e X f i P c 2)) (decode_p (pack_b_u_p_e X f i P c 3)) (pack_b_u_p_e X f i P c 4) = Phi X f i P c.
rewrite <- pack_b_u_p_e_0_eq2 X f i P c.
prove Phi X (decode_b (pack_b_u_p_e X f i P c 1)) (decode_u (pack_b_u_p_e X f i P c 2)) (decode_p (pack_b_u_p_e X f i P c 3)) (pack_b_u_p_e X f i P c 4) = Phi X f i P c.
rewrite <- pack_b_u_p_e_4_eq2 X f i P c.
apply HPhi.
- exact pack_b_u_p_e_1_eq2 X f i P c.
- exact pack_b_u_p_e_2_eq2 X f i P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_u_p_e X f i P c 3) x.
  rewrite <- pack_b_u_p_e_3_eq2 X f i P c x Hx.
  apply iff_refl.
Qed.


Definition pack_b_u_e_e : set -> (set -> set -> set) -> (set -> set) -> set -> set -> set := fun X f i c d => (X,encode_b X f,encode_u X i,c,d).

Theorem pack_b_u_e_e_0_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, S = pack_b_u_e_e X f i c d -> X = S 0.
let S X f i c d. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_u X i,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_u_e_e_0_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, X = pack_b_u_e_e X f i c d 0.
let X f i c d. apply pack_b_u_e_e_0_eq (pack_b_u_e_e X f i c d) X f i c d. reflexivity.
Qed.

Theorem pack_b_u_e_e_1_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, S = pack_b_u_e_e X f i c d -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f i c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_u X i,c,d) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_u_e_e_1_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, forall x y :e X, f x y = decode_b (pack_b_u_e_e X f i c d 1) x y.
let X f i c d. apply pack_b_u_e_e_1_eq (pack_b_u_e_e X f i c d) X f i c d. reflexivity.
Qed.

Theorem pack_b_u_e_e_2_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, S = pack_b_u_e_e X f i c d -> forall x :e X, i x = decode_u (S 2) x.
let S X f i c d. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_u X i,c,d) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_u_e_e_2_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, forall x :e X, i x = decode_u (pack_b_u_e_e X f i c d 2) x.
let X f i c d. apply pack_b_u_e_e_2_eq (pack_b_u_e_e X f i c d) X f i c d. reflexivity.
Qed.

Theorem pack_b_u_e_e_3_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, S = pack_b_u_e_e X f i c d -> c = S 3.
let S X f i c d. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_u X i,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_b_u_e_e_3_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, c = pack_b_u_e_e X f i c d 3.
let X f i c d. apply pack_b_u_e_e_3_eq (pack_b_u_e_e X f i c d) X f i c d. reflexivity.
Qed.

Theorem pack_b_u_e_e_4_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, S = pack_b_u_e_e X f i c d -> d = S 4.
let S X f i c d. assume H1.
rewrite H1. prove d = (X,encode_b X f,encode_u X i,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_u_e_e_4_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, d = pack_b_u_e_e X f i c d 4.
let X f i c d. apply pack_b_u_e_e_4_eq (pack_b_u_e_e X f i c d) X f i c d. reflexivity.
Qed.

Theorem pack_b_u_e_e_inj : forall X X', forall f f':set -> set -> set, forall i i':set -> set, forall c c':set, forall d d':set, pack_b_u_e_e X f i c d = pack_b_u_e_e X' f' i' c' d' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ c = c' /\ d = d'.
let X X' f f' i i' c c' d d'. assume H1.
claim L0: X' = pack_b_u_e_e X f i c d 0.
{ exact pack_b_u_e_e_0_eq (pack_b_u_e_e X f i c d) X' f' i' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_u_e_e_0_eq2 X f i c d. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_u_e_e_1_eq2 X f i c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_e_e_1_eq2 X' f' i' c' d' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_u_e_e_2_eq2 X f i c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_e_e_2_eq2 X' f' i' c' d' x Lx.
- prove c = c'.
  rewrite pack_b_u_e_e_3_eq2 X f i c d.
  rewrite H1. symmetry.
  exact pack_b_u_e_e_3_eq2 X' f' i' c' d'.
- prove d = d'.
  rewrite pack_b_u_e_e_4_eq2 X f i c d.
  rewrite H1. symmetry.
  exact pack_b_u_e_e_4_eq2 X' f' i' c' d'.
Qed.

Theorem pack_b_u_e_e_ext : forall X, forall f f':set -> set -> set, forall i i':set -> set, forall c, forall d,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 pack_b_u_e_e X f i c d = pack_b_u_e_e X f' i' c d.
let X f f' i i' c d. assume H1. assume H2.
prove (X,encode_b X f,encode_u X i,c,d) = (X,encode_b X f',encode_u X i',c,d).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_u_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> forall d:set, d :e X -> q (pack_b_u_e_e X f i c d)) -> q S.

Theorem pack_struct_b_u_e_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> forall d:set, d :e X -> struct_b_u_e_e (pack_b_u_e_e X f i c d).
let X f. assume Hf. let i. assume Hi. let c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X f Hf i Hi c Hc d Hd.
Qed.

Theorem pack_struct_b_u_e_e_E1: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, struct_b_u_e_e (pack_b_u_e_e X f i c d) -> forall x y :e X, f x y :e X.
let X f i c d. assume H1. apply H1 (fun z => z = pack_b_u_e_e X f i c d -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_u_e_e X' f' i' c' d' = pack_b_u_e_e X f i c d.
  apply pack_b_u_e_e_inj X' X f' f i' i c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_u_e_e_E2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, struct_b_u_e_e (pack_b_u_e_e X f i c d) -> forall x :e X, i x :e X.
let X f i c d. assume H1. apply H1 (fun z => z = pack_b_u_e_e X f i c d -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_u_e_e X' f' i' c' d' = pack_b_u_e_e X f i c d.
  apply pack_b_u_e_e_inj X' X f' f i' i c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_b_u_e_e_E3: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, struct_b_u_e_e (pack_b_u_e_e X f i c d) -> c :e X.
let X f i c d. assume H1. apply H1 (fun z => z = pack_b_u_e_e X f i c d -> c :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_u_e_e X' f' i' c' d' = pack_b_u_e_e X f i c d.
  apply pack_b_u_e_e_inj X' X f' f i' i c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_b_u_e_e_E4: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set, struct_b_u_e_e (pack_b_u_e_e X f i c d) -> d :e X.
let X f i c d. assume H1. apply H1 (fun z => z = pack_b_u_e_e X f i c d -> d :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_u_e_e X' f' i' c' d' = pack_b_u_e_e X f i c d.
  apply pack_b_u_e_e_inj X' X f' f i' i c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_b_u_e_e_eta: forall S, struct_b_u_e_e S -> S = pack_b_u_e_e (S 0) (decode_b (S 1)) (decode_u (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_u_e_e (z 0) (decode_b (z 1)) (decode_u (z 2)) (z 3) (z 4)).
let X. let f. assume _. let i. assume _. let c. assume _. let d. assume _.
prove pack_b_u_e_e X f i c d = pack_b_u_e_e (pack_b_u_e_e X f i c d 0) (decode_b (pack_b_u_e_e X f i c d 1)) (decode_u (pack_b_u_e_e X f i c d 2)) (pack_b_u_e_e X f i c d 3) (pack_b_u_e_e X f i c d 4).
rewrite <- pack_b_u_e_e_0_eq2 X f i c d.
rewrite <- pack_b_u_e_e_3_eq2 X f i c d.
rewrite <- pack_b_u_e_e_4_eq2 X f i c d.
apply pack_b_u_e_e_ext.
- exact pack_b_u_e_e_1_eq2 X f i c d.
- exact pack_b_u_e_e_2_eq2 X f i c d.
Qed.


Definition unpack_b_u_e_e_i : set -> (set -> (set -> set -> set) -> (set -> set) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (S 3) (S 4).

Theorem unpack_b_u_e_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> set -> set -> set,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' i' c d = Phi X f i c d)
  ->
  unpack_b_u_e_e_i (pack_b_u_e_e X f i c d) Phi = Phi X f i c d.
let Phi X f i c d.
assume HPhi.
prove Phi (pack_b_u_e_e X f i c d 0) (decode_b (pack_b_u_e_e X f i c d 1)) (decode_u (pack_b_u_e_e X f i c d 2)) (pack_b_u_e_e X f i c d 3) (pack_b_u_e_e X f i c d 4) = Phi X f i c d.
rewrite <- pack_b_u_e_e_0_eq2 X f i c d.
prove Phi X (decode_b (pack_b_u_e_e X f i c d 1)) (decode_u (pack_b_u_e_e X f i c d 2)) (pack_b_u_e_e X f i c d 3) (pack_b_u_e_e X f i c d 4) = Phi X f i c d.
rewrite <- pack_b_u_e_e_3_eq2 X f i c d.
rewrite <- pack_b_u_e_e_4_eq2 X f i c d.
apply HPhi.
- exact pack_b_u_e_e_1_eq2 X f i c d.
- exact pack_b_u_e_e_2_eq2 X f i c d.
Qed.


Definition unpack_b_u_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (S 3) (S 4).

Theorem unpack_b_u_e_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> set -> set -> prop,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall d:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' i' c d = Phi X f i c d)
  ->
  unpack_b_u_e_e_o (pack_b_u_e_e X f i c d) Phi = Phi X f i c d.
let Phi X f i c d.
assume HPhi.
prove Phi (pack_b_u_e_e X f i c d 0) (decode_b (pack_b_u_e_e X f i c d 1)) (decode_u (pack_b_u_e_e X f i c d 2)) (pack_b_u_e_e X f i c d 3) (pack_b_u_e_e X f i c d 4) = Phi X f i c d.
rewrite <- pack_b_u_e_e_0_eq2 X f i c d.
prove Phi X (decode_b (pack_b_u_e_e X f i c d 1)) (decode_u (pack_b_u_e_e X f i c d 2)) (pack_b_u_e_e X f i c d 3) (pack_b_u_e_e X f i c d 4) = Phi X f i c d.
rewrite <- pack_b_u_e_e_3_eq2 X f i c d.
rewrite <- pack_b_u_e_e_4_eq2 X f i c d.
apply HPhi.
- exact pack_b_u_e_e_1_eq2 X f i c d.
- exact pack_b_u_e_e_2_eq2 X f i c d.
Qed.


Definition pack_b_r_p_p : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set := fun X f R P Q => (X,encode_b X f,encode_r X R,encode_p X P,encode_p X Q).

Theorem pack_b_r_p_p_0_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_b_r_p_p X f R P Q -> X = S 0.
let S X f R P Q. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_r X R,encode_p X P,encode_p X Q) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_r_p_p_0_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, X = pack_b_r_p_p X f R P Q 0.
let X f R P Q. apply pack_b_r_p_p_0_eq (pack_b_r_p_p X f R P Q) X f R P Q. reflexivity.
Qed.

Theorem pack_b_r_p_p_1_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_b_r_p_p X f R P Q -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f R P Q. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_r X R,encode_p X P,encode_p X Q) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_r_p_p_1_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x y :e X, f x y = decode_b (pack_b_r_p_p X f R P Q 1) x y.
let X f R P Q. apply pack_b_r_p_p_1_eq (pack_b_r_p_p X f R P Q) X f R P Q. reflexivity.
Qed.

Theorem pack_b_r_p_p_2_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_b_r_p_p X f R P Q -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X f R P Q. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_r X R,encode_p X P,encode_p X Q) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_r_p_p_2_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x y :e X, R x y = decode_r (pack_b_r_p_p X f R P Q 2) x y.
let X f R P Q. apply pack_b_r_p_p_2_eq (pack_b_r_p_p X f R P Q) X f R P Q. reflexivity.
Qed.

Theorem pack_b_r_p_p_3_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_b_r_p_p X f R P Q -> forall x :e X, P x = decode_p (S 3) x.
let S X f R P Q. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_r X R,encode_p X P,encode_p X Q) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_r_p_p_3_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x :e X, P x = decode_p (pack_b_r_p_p X f R P Q 3) x.
let X f R P Q. apply pack_b_r_p_p_3_eq (pack_b_r_p_p X f R P Q) X f R P Q. reflexivity.
Qed.

Theorem pack_b_r_p_p_4_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_b_r_p_p X f R P Q -> forall x :e X, Q x = decode_p (S 4) x.
let S X f R P Q. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_b X f,encode_r X R,encode_p X P,encode_p X Q) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_b_r_p_p_4_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x :e X, Q x = decode_p (pack_b_r_p_p X f R P Q 4) x.
let X f R P Q. apply pack_b_r_p_p_4_eq (pack_b_r_p_p X f R P Q) X f R P Q. reflexivity.
Qed.

Theorem pack_b_r_p_p_inj : forall X X', forall f f':set -> set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, forall Q Q':set -> prop, pack_b_r_p_p X f R P Q = pack_b_r_p_p X' f' R' P' Q' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x).
let X X' f f' R R' P P' Q Q'. assume H1.
claim L0: X' = pack_b_r_p_p X f R P Q 0.
{ exact pack_b_r_p_p_0_eq (pack_b_r_p_p X f R P Q) X' f' R' P' Q' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_r_p_p_0_eq2 X f R P Q. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_r_p_p_1_eq2 X f R P Q x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_p_p_1_eq2 X' f' R' P' Q' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_r_p_p_2_eq2 X f R P Q x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_p_p_2_eq2 X' f' R' P' Q' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_r_p_p_3_eq2 X f R P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_r_p_p_3_eq2 X' f' R' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_b_r_p_p_4_eq2 X f R P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_r_p_p_4_eq2 X' f' R' P' Q' x Lx.
Qed.

Theorem pack_b_r_p_p_ext : forall X, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, forall Q Q':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_b_r_p_p X f R P Q = pack_b_r_p_p X f' R' P' Q'.
let X f f' R R' P P' Q Q'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_b X f,encode_r X R,encode_p X P,encode_p X Q) = (X,encode_b X f',encode_r X R',encode_p X P',encode_p X Q').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_b_r_p_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, q (pack_b_r_p_p X f R P Q)) -> q S.

Theorem pack_struct_b_r_p_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, struct_b_r_p_p (pack_b_r_p_p X f R P Q).
let X f. assume Hf. let R P Q q. assume Hq.
exact Hq X f Hf R P Q.
Qed.

Theorem pack_struct_b_r_p_p_E1: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, struct_b_r_p_p (pack_b_r_p_p X f R P Q) -> forall x y :e X, f x y :e X.
let X f R P Q. assume H1. apply H1 (fun z => z = pack_b_r_p_p X f R P Q -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let R'. let P'. let Q'.
  assume Heq: pack_b_r_p_p X' f' R' P' Q' = pack_b_r_p_p X f R P Q.
  apply pack_b_r_p_p_inj X' X f' f R' R P' P Q' Q Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HR'R HP'P HQ'Q.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_r_p_p_eta: forall S, struct_b_r_p_p S -> S = pack_b_r_p_p (S 0) (decode_b (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_b_r_p_p (z 0) (decode_b (z 1)) (decode_r (z 2)) (decode_p (z 3)) (decode_p (z 4))).
let X. let f. assume _. let R. let P. let Q.
prove pack_b_r_p_p X f R P Q = pack_b_r_p_p (pack_b_r_p_p X f R P Q 0) (decode_b (pack_b_r_p_p X f R P Q 1)) (decode_r (pack_b_r_p_p X f R P Q 2)) (decode_p (pack_b_r_p_p X f R P Q 3)) (decode_p (pack_b_r_p_p X f R P Q 4)).
rewrite <- pack_b_r_p_p_0_eq2 X f R P Q.
apply pack_b_r_p_p_ext.
- exact pack_b_r_p_p_1_eq2 X f R P Q.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_r_p_p_2_eq2 X f R P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_b_r_p_p_3_eq2 X f R P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_b_r_p_p_4_eq2 X f R P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_r_p_p_i : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_b_r_p_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X f' R' P' Q' = Phi X f R P Q)
  ->
  unpack_b_r_p_p_i (pack_b_r_p_p X f R P Q) Phi = Phi X f R P Q.
let Phi X f R P Q.
assume HPhi.
prove Phi (pack_b_r_p_p X f R P Q 0) (decode_b (pack_b_r_p_p X f R P Q 1)) (decode_r (pack_b_r_p_p X f R P Q 2)) (decode_p (pack_b_r_p_p X f R P Q 3)) (decode_p (pack_b_r_p_p X f R P Q 4)) = Phi X f R P Q.
rewrite <- pack_b_r_p_p_0_eq2 X f R P Q.
prove Phi X (decode_b (pack_b_r_p_p X f R P Q 1)) (decode_r (pack_b_r_p_p X f R P Q 2)) (decode_p (pack_b_r_p_p X f R P Q 3)) (decode_p (pack_b_r_p_p X f R P Q 4)) = Phi X f R P Q.
apply HPhi.
- exact pack_b_r_p_p_1_eq2 X f R P Q.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r_p_p X f R P Q 2) x y.
  rewrite <- pack_b_r_p_p_2_eq2 X f R P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_r_p_p X f R P Q 3) x.
  rewrite <- pack_b_r_p_p_3_eq2 X f R P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_b_r_p_p X f R P Q 4) x.
  rewrite <- pack_b_r_p_p_4_eq2 X f R P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_r_p_p_o : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_b_r_p_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X f' R' P' Q' = Phi X f R P Q)
  ->
  unpack_b_r_p_p_o (pack_b_r_p_p X f R P Q) Phi = Phi X f R P Q.
let Phi X f R P Q.
assume HPhi.
prove Phi (pack_b_r_p_p X f R P Q 0) (decode_b (pack_b_r_p_p X f R P Q 1)) (decode_r (pack_b_r_p_p X f R P Q 2)) (decode_p (pack_b_r_p_p X f R P Q 3)) (decode_p (pack_b_r_p_p X f R P Q 4)) = Phi X f R P Q.
rewrite <- pack_b_r_p_p_0_eq2 X f R P Q.
prove Phi X (decode_b (pack_b_r_p_p X f R P Q 1)) (decode_r (pack_b_r_p_p X f R P Q 2)) (decode_p (pack_b_r_p_p X f R P Q 3)) (decode_p (pack_b_r_p_p X f R P Q 4)) = Phi X f R P Q.
apply HPhi.
- exact pack_b_r_p_p_1_eq2 X f R P Q.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r_p_p X f R P Q 2) x y.
  rewrite <- pack_b_r_p_p_2_eq2 X f R P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_r_p_p X f R P Q 3) x.
  rewrite <- pack_b_r_p_p_3_eq2 X f R P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_b_r_p_p X f R P Q 4) x.
  rewrite <- pack_b_r_p_p_4_eq2 X f R P Q x Hx.
  apply iff_refl.
Qed.


Definition pack_b_r_p_e : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> set := fun X f R P c => (X,encode_b X f,encode_r X R,encode_p X P,c).

Theorem pack_b_r_p_e_0_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_b_r_p_e X f R P c -> X = S 0.
let S X f R P c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_r X R,encode_p X P,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_r_p_e_0_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, X = pack_b_r_p_e X f R P c 0.
let X f R P c. apply pack_b_r_p_e_0_eq (pack_b_r_p_e X f R P c) X f R P c. reflexivity.
Qed.

Theorem pack_b_r_p_e_1_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_b_r_p_e X f R P c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f R P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_r X R,encode_p X P,c) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_r_p_e_1_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall x y :e X, f x y = decode_b (pack_b_r_p_e X f R P c 1) x y.
let X f R P c. apply pack_b_r_p_e_1_eq (pack_b_r_p_e X f R P c) X f R P c. reflexivity.
Qed.

Theorem pack_b_r_p_e_2_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_b_r_p_e X f R P c -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X f R P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_r X R,encode_p X P,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_r_p_e_2_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_b_r_p_e X f R P c 2) x y.
let X f R P c. apply pack_b_r_p_e_2_eq (pack_b_r_p_e X f R P c) X f R P c. reflexivity.
Qed.

Theorem pack_b_r_p_e_3_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_b_r_p_e X f R P c -> forall x :e X, P x = decode_p (S 3) x.
let S X f R P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_r X R,encode_p X P,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_r_p_e_3_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_b_r_p_e X f R P c 3) x.
let X f R P c. apply pack_b_r_p_e_3_eq (pack_b_r_p_e X f R P c) X f R P c. reflexivity.
Qed.

Theorem pack_b_r_p_e_4_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_b_r_p_e X f R P c -> c = S 4.
let S X f R P c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_r X R,encode_p X P,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_r_p_e_4_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c = pack_b_r_p_e X f R P c 4.
let X f R P c. apply pack_b_r_p_e_4_eq (pack_b_r_p_e X f R P c) X f R P c. reflexivity.
Qed.

Theorem pack_b_r_p_e_inj : forall X X', forall f f':set -> set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, forall c c':set, pack_b_r_p_e X f R P c = pack_b_r_p_e X' f' R' P' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' f f' R R' P P' c c'. assume H1.
claim L0: X' = pack_b_r_p_e X f R P c 0.
{ exact pack_b_r_p_e_0_eq (pack_b_r_p_e X f R P c) X' f' R' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_r_p_e_0_eq2 X f R P c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_r_p_e_1_eq2 X f R P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_p_e_1_eq2 X' f' R' P' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_r_p_e_2_eq2 X f R P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_p_e_2_eq2 X' f' R' P' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_r_p_e_3_eq2 X f R P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_r_p_e_3_eq2 X' f' R' P' c' x Lx.
- prove c = c'.
  rewrite pack_b_r_p_e_4_eq2 X f R P c.
  rewrite H1. symmetry.
  exact pack_b_r_p_e_4_eq2 X' f' R' P' c'.
Qed.

Theorem pack_b_r_p_e_ext : forall X, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_r_p_e X f R P c = pack_b_r_p_e X f' R' P' c.
let X f f' R R' P P' c. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_r X R,encode_p X P,c) = (X,encode_b X f',encode_r X R',encode_p X P',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_b_r_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> q (pack_b_r_p_e X f R P c)) -> q S.

Theorem pack_struct_b_r_p_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> struct_b_r_p_e (pack_b_r_p_e X f R P c).
let X f. assume Hf. let R P c. assume Hc. let q. assume Hq.
exact Hq X f Hf R P c Hc.
Qed.

Theorem pack_struct_b_r_p_e_E1: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, struct_b_r_p_e (pack_b_r_p_e X f R P c) -> forall x y :e X, f x y :e X.
let X f R P c. assume H1. apply H1 (fun z => z = pack_b_r_p_e X f R P c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let R'. let P'. let c'. assume Hc'.
  assume Heq: pack_b_r_p_e X' f' R' P' c' = pack_b_r_p_e X f R P c.
  apply pack_b_r_p_e_inj X' X f' f R' R P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HR'R HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_r_p_e_E4: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, struct_b_r_p_e (pack_b_r_p_e X f R P c) -> c :e X.
let X f R P c. assume H1. apply H1 (fun z => z = pack_b_r_p_e X f R P c -> c :e X).
- let X'. let f'. assume Hf'. let R'. let P'. let c'. assume Hc'.
  assume Heq: pack_b_r_p_e X' f' R' P' c' = pack_b_r_p_e X f R P c.
  apply pack_b_r_p_e_inj X' X f' f R' R P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HR'R HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_r_p_e_eta: forall S, struct_b_r_p_e S -> S = pack_b_r_p_e (S 0) (decode_b (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_r_p_e (z 0) (decode_b (z 1)) (decode_r (z 2)) (decode_p (z 3)) (z 4)).
let X. let f. assume _. let R. let P. let c. assume _.
prove pack_b_r_p_e X f R P c = pack_b_r_p_e (pack_b_r_p_e X f R P c 0) (decode_b (pack_b_r_p_e X f R P c 1)) (decode_r (pack_b_r_p_e X f R P c 2)) (decode_p (pack_b_r_p_e X f R P c 3)) (pack_b_r_p_e X f R P c 4).
rewrite <- pack_b_r_p_e_0_eq2 X f R P c.
rewrite <- pack_b_r_p_e_4_eq2 X f R P c.
apply pack_b_r_p_e_ext.
- exact pack_b_r_p_e_1_eq2 X f R P c.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_r_p_e_2_eq2 X f R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_b_r_p_e_3_eq2 X f R P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_r_p_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_b_r_p_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> set,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' R' P' c = Phi X f R P c)
  ->
  unpack_b_r_p_e_i (pack_b_r_p_e X f R P c) Phi = Phi X f R P c.
let Phi X f R P c.
assume HPhi.
prove Phi (pack_b_r_p_e X f R P c 0) (decode_b (pack_b_r_p_e X f R P c 1)) (decode_r (pack_b_r_p_e X f R P c 2)) (decode_p (pack_b_r_p_e X f R P c 3)) (pack_b_r_p_e X f R P c 4) = Phi X f R P c.
rewrite <- pack_b_r_p_e_0_eq2 X f R P c.
prove Phi X (decode_b (pack_b_r_p_e X f R P c 1)) (decode_r (pack_b_r_p_e X f R P c 2)) (decode_p (pack_b_r_p_e X f R P c 3)) (pack_b_r_p_e X f R P c 4) = Phi X f R P c.
rewrite <- pack_b_r_p_e_4_eq2 X f R P c.
apply HPhi.
- exact pack_b_r_p_e_1_eq2 X f R P c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r_p_e X f R P c 2) x y.
  rewrite <- pack_b_r_p_e_2_eq2 X f R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_r_p_e X f R P c 3) x.
  rewrite <- pack_b_r_p_e_3_eq2 X f R P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_r_p_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_b_r_p_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> prop,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' R' P' c = Phi X f R P c)
  ->
  unpack_b_r_p_e_o (pack_b_r_p_e X f R P c) Phi = Phi X f R P c.
let Phi X f R P c.
assume HPhi.
prove Phi (pack_b_r_p_e X f R P c 0) (decode_b (pack_b_r_p_e X f R P c 1)) (decode_r (pack_b_r_p_e X f R P c 2)) (decode_p (pack_b_r_p_e X f R P c 3)) (pack_b_r_p_e X f R P c 4) = Phi X f R P c.
rewrite <- pack_b_r_p_e_0_eq2 X f R P c.
prove Phi X (decode_b (pack_b_r_p_e X f R P c 1)) (decode_r (pack_b_r_p_e X f R P c 2)) (decode_p (pack_b_r_p_e X f R P c 3)) (pack_b_r_p_e X f R P c 4) = Phi X f R P c.
rewrite <- pack_b_r_p_e_4_eq2 X f R P c.
apply HPhi.
- exact pack_b_r_p_e_1_eq2 X f R P c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r_p_e X f R P c 2) x y.
  rewrite <- pack_b_r_p_e_2_eq2 X f R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_r_p_e X f R P c 3) x.
  rewrite <- pack_b_r_p_e_3_eq2 X f R P c x Hx.
  apply iff_refl.
Qed.


Definition pack_b_r_e_e : set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set := fun X f R c d => (X,encode_b X f,encode_r X R,c,d).

Theorem pack_b_r_e_e_0_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_b_r_e_e X f R c d -> X = S 0.
let S X f R c d. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_r X R,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_r_e_e_0_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, X = pack_b_r_e_e X f R c d 0.
let X f R c d. apply pack_b_r_e_e_0_eq (pack_b_r_e_e X f R c d) X f R c d. reflexivity.
Qed.

Theorem pack_b_r_e_e_1_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_b_r_e_e X f R c d -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f R c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_r X R,c,d) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_r_e_e_1_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, forall x y :e X, f x y = decode_b (pack_b_r_e_e X f R c d 1) x y.
let X f R c d. apply pack_b_r_e_e_1_eq (pack_b_r_e_e X f R c d) X f R c d. reflexivity.
Qed.

Theorem pack_b_r_e_e_2_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_b_r_e_e X f R c d -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X f R c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_r X R,c,d) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_r_e_e_2_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, forall x y :e X, R x y = decode_r (pack_b_r_e_e X f R c d 2) x y.
let X f R c d. apply pack_b_r_e_e_2_eq (pack_b_r_e_e X f R c d) X f R c d. reflexivity.
Qed.

Theorem pack_b_r_e_e_3_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_b_r_e_e X f R c d -> c = S 3.
let S X f R c d. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_r X R,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_b_r_e_e_3_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, c = pack_b_r_e_e X f R c d 3.
let X f R c d. apply pack_b_r_e_e_3_eq (pack_b_r_e_e X f R c d) X f R c d. reflexivity.
Qed.

Theorem pack_b_r_e_e_4_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_b_r_e_e X f R c d -> d = S 4.
let S X f R c d. assume H1.
rewrite H1. prove d = (X,encode_b X f,encode_r X R,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_r_e_e_4_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, d = pack_b_r_e_e X f R c d 4.
let X f R c d. apply pack_b_r_e_e_4_eq (pack_b_r_e_e X f R c d) X f R c d. reflexivity.
Qed.

Theorem pack_b_r_e_e_inj : forall X X', forall f f':set -> set -> set, forall R R':set -> set -> prop, forall c c':set, forall d d':set, pack_b_r_e_e X f R c d = pack_b_r_e_e X' f' R' c' d' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, R x y = R' x y) /\ c = c' /\ d = d'.
let X X' f f' R R' c c' d d'. assume H1.
claim L0: X' = pack_b_r_e_e X f R c d 0.
{ exact pack_b_r_e_e_0_eq (pack_b_r_e_e X f R c d) X' f' R' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_r_e_e_0_eq2 X f R c d. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_r_e_e_1_eq2 X f R c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_e_e_1_eq2 X' f' R' c' d' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_r_e_e_2_eq2 X f R c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_e_e_2_eq2 X' f' R' c' d' x Lx y Ly.
- prove c = c'.
  rewrite pack_b_r_e_e_3_eq2 X f R c d.
  rewrite H1. symmetry.
  exact pack_b_r_e_e_3_eq2 X' f' R' c' d'.
- prove d = d'.
  rewrite pack_b_r_e_e_4_eq2 X f R c d.
  rewrite H1. symmetry.
  exact pack_b_r_e_e_4_eq2 X' f' R' c' d'.
Qed.

Theorem pack_b_r_e_e_ext : forall X, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall c, forall d,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_b_r_e_e X f R c d = pack_b_r_e_e X f' R' c d.
let X f f' R R' c d. assume H1. assume H2.
prove (X,encode_b X f,encode_r X R,c,d) = (X,encode_b X f',encode_r X R',c,d).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_r_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> q (pack_b_r_e_e X f R c d)) -> q S.

Theorem pack_struct_b_r_e_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> struct_b_r_e_e (pack_b_r_e_e X f R c d).
let X f. assume Hf. let R c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X f Hf R c Hc d Hd.
Qed.

Theorem pack_struct_b_r_e_e_E1: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, struct_b_r_e_e (pack_b_r_e_e X f R c d) -> forall x y :e X, f x y :e X.
let X f R c d. assume H1. apply H1 (fun z => z = pack_b_r_e_e X f R c d -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let R'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_r_e_e X' f' R' c' d' = pack_b_r_e_e X f R c d.
  apply pack_b_r_e_e_inj X' X f' f R' R c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HR'R Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_r_e_e_E3: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, struct_b_r_e_e (pack_b_r_e_e X f R c d) -> c :e X.
let X f R c d. assume H1. apply H1 (fun z => z = pack_b_r_e_e X f R c d -> c :e X).
- let X'. let f'. assume Hf'. let R'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_r_e_e X' f' R' c' d' = pack_b_r_e_e X f R c d.
  apply pack_b_r_e_e_inj X' X f' f R' R c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HR'R Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_b_r_e_e_E4: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, struct_b_r_e_e (pack_b_r_e_e X f R c d) -> d :e X.
let X f R c d. assume H1. apply H1 (fun z => z = pack_b_r_e_e X f R c d -> d :e X).
- let X'. let f'. assume Hf'. let R'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_r_e_e X' f' R' c' d' = pack_b_r_e_e X f R c d.
  apply pack_b_r_e_e_inj X' X f' f R' R c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HR'R Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_b_r_e_e_eta: forall S, struct_b_r_e_e S -> S = pack_b_r_e_e (S 0) (decode_b (S 1)) (decode_r (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_r_e_e (z 0) (decode_b (z 1)) (decode_r (z 2)) (z 3) (z 4)).
let X. let f. assume _. let R. let c. assume _. let d. assume _.
prove pack_b_r_e_e X f R c d = pack_b_r_e_e (pack_b_r_e_e X f R c d 0) (decode_b (pack_b_r_e_e X f R c d 1)) (decode_r (pack_b_r_e_e X f R c d 2)) (pack_b_r_e_e X f R c d 3) (pack_b_r_e_e X f R c d 4).
rewrite <- pack_b_r_e_e_0_eq2 X f R c d.
rewrite <- pack_b_r_e_e_3_eq2 X f R c d.
rewrite <- pack_b_r_e_e_4_eq2 X f R c d.
apply pack_b_r_e_e_ext.
- exact pack_b_r_e_e_1_eq2 X f R c d.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_r_e_e_2_eq2 X f R c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_r_e_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)) (S 3) (S 4).

Theorem unpack_b_r_e_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> set,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' R' c d = Phi X f R c d)
  ->
  unpack_b_r_e_e_i (pack_b_r_e_e X f R c d) Phi = Phi X f R c d.
let Phi X f R c d.
assume HPhi.
prove Phi (pack_b_r_e_e X f R c d 0) (decode_b (pack_b_r_e_e X f R c d 1)) (decode_r (pack_b_r_e_e X f R c d 2)) (pack_b_r_e_e X f R c d 3) (pack_b_r_e_e X f R c d 4) = Phi X f R c d.
rewrite <- pack_b_r_e_e_0_eq2 X f R c d.
prove Phi X (decode_b (pack_b_r_e_e X f R c d 1)) (decode_r (pack_b_r_e_e X f R c d 2)) (pack_b_r_e_e X f R c d 3) (pack_b_r_e_e X f R c d 4) = Phi X f R c d.
rewrite <- pack_b_r_e_e_3_eq2 X f R c d.
rewrite <- pack_b_r_e_e_4_eq2 X f R c d.
apply HPhi.
- exact pack_b_r_e_e_1_eq2 X f R c d.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r_e_e X f R c d 2) x y.
  rewrite <- pack_b_r_e_e_2_eq2 X f R c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_r_e_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)) (S 3) (S 4).

Theorem unpack_b_r_e_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set -> prop,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall d:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' R' c d = Phi X f R c d)
  ->
  unpack_b_r_e_e_o (pack_b_r_e_e X f R c d) Phi = Phi X f R c d.
let Phi X f R c d.
assume HPhi.
prove Phi (pack_b_r_e_e X f R c d 0) (decode_b (pack_b_r_e_e X f R c d 1)) (decode_r (pack_b_r_e_e X f R c d 2)) (pack_b_r_e_e X f R c d 3) (pack_b_r_e_e X f R c d 4) = Phi X f R c d.
rewrite <- pack_b_r_e_e_0_eq2 X f R c d.
prove Phi X (decode_b (pack_b_r_e_e X f R c d 1)) (decode_r (pack_b_r_e_e X f R c d 2)) (pack_b_r_e_e X f R c d 3) (pack_b_r_e_e X f R c d 4) = Phi X f R c d.
rewrite <- pack_b_r_e_e_3_eq2 X f R c d.
rewrite <- pack_b_r_e_e_4_eq2 X f R c d.
apply HPhi.
- exact pack_b_r_e_e_1_eq2 X f R c d.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r_e_e X f R c d 2) x y.
  rewrite <- pack_b_r_e_e_2_eq2 X f R c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_p_e_e : set -> (set -> set -> set) -> (set -> prop) -> set -> set -> set := fun X f P c d => (X,encode_b X f,encode_p X P,c,d).

Theorem pack_b_p_e_e_0_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, S = pack_b_p_e_e X f P c d -> X = S 0.
let S X f P c d. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_p X P,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_b_p_e_e_0_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, X = pack_b_p_e_e X f P c d 0.
let X f P c d. apply pack_b_p_e_e_0_eq (pack_b_p_e_e X f P c d) X f P c d. reflexivity.
Qed.

Theorem pack_b_p_e_e_1_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, S = pack_b_p_e_e X f P c d -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f P c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_p X P,c,d) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_p_e_e_1_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, forall x y :e X, f x y = decode_b (pack_b_p_e_e X f P c d 1) x y.
let X f P c d. apply pack_b_p_e_e_1_eq (pack_b_p_e_e X f P c d) X f P c d. reflexivity.
Qed.

Theorem pack_b_p_e_e_2_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, S = pack_b_p_e_e X f P c d -> forall x :e X, P x = decode_p (S 2) x.
let S X f P c d. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_p X P,c,d) 2) x.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_p_e_e_2_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, forall x :e X, P x = decode_p (pack_b_p_e_e X f P c d 2) x.
let X f P c d. apply pack_b_p_e_e_2_eq (pack_b_p_e_e X f P c d) X f P c d. reflexivity.
Qed.

Theorem pack_b_p_e_e_3_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, S = pack_b_p_e_e X f P c d -> c = S 3.
let S X f P c d. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_p X P,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_b_p_e_e_3_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, c = pack_b_p_e_e X f P c d 3.
let X f P c d. apply pack_b_p_e_e_3_eq (pack_b_p_e_e X f P c d) X f P c d. reflexivity.
Qed.

Theorem pack_b_p_e_e_4_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, S = pack_b_p_e_e X f P c d -> d = S 4.
let S X f P c d. assume H1.
rewrite H1. prove d = (X,encode_b X f,encode_p X P,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_b_p_e_e_4_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, d = pack_b_p_e_e X f P c d 4.
let X f P c d. apply pack_b_p_e_e_4_eq (pack_b_p_e_e X f P c d) X f P c d. reflexivity.
Qed.

Theorem pack_b_p_e_e_inj : forall X X', forall f f':set -> set -> set, forall P P':set -> prop, forall c c':set, forall d d':set, pack_b_p_e_e X f P c d = pack_b_p_e_e X' f' P' c' d' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, P x = P' x) /\ c = c' /\ d = d'.
let X X' f f' P P' c c' d d'. assume H1.
claim L0: X' = pack_b_p_e_e X f P c d 0.
{ exact pack_b_p_e_e_0_eq (pack_b_p_e_e X f P c d) X' f' P' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_p_e_e_0_eq2 X f P c d. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_p_e_e_1_eq2 X f P c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_p_e_e_1_eq2 X' f' P' c' d' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_p_e_e_2_eq2 X f P c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_p_e_e_2_eq2 X' f' P' c' d' x Lx.
- prove c = c'.
  rewrite pack_b_p_e_e_3_eq2 X f P c d.
  rewrite H1. symmetry.
  exact pack_b_p_e_e_3_eq2 X' f' P' c' d'.
- prove d = d'.
  rewrite pack_b_p_e_e_4_eq2 X f P c d.
  rewrite H1. symmetry.
  exact pack_b_p_e_e_4_eq2 X' f' P' c' d'.
Qed.

Theorem pack_b_p_e_e_ext : forall X, forall f f':set -> set -> set, forall P P':set -> prop, forall c, forall d,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_p_e_e X f P c d = pack_b_p_e_e X f' P' c d.
let X f f' P P' c d. assume H1. assume H2.
prove (X,encode_b X f,encode_p X P,c,d) = (X,encode_b X f',encode_p X P',c,d).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_p_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> q (pack_b_p_e_e X f P c d)) -> q S.

Theorem pack_struct_b_p_e_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> struct_b_p_e_e (pack_b_p_e_e X f P c d).
let X f. assume Hf. let P c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X f Hf P c Hc d Hd.
Qed.

Theorem pack_struct_b_p_e_e_E1: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, struct_b_p_e_e (pack_b_p_e_e X f P c d) -> forall x y :e X, f x y :e X.
let X f P c d. assume H1. apply H1 (fun z => z = pack_b_p_e_e X f P c d -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let P'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_p_e_e X' f' P' c' d' = pack_b_p_e_e X f P c d.
  apply pack_b_p_e_e_inj X' X f' f P' P c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HP'P Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_p_e_e_E3: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, struct_b_p_e_e (pack_b_p_e_e X f P c d) -> c :e X.
let X f P c d. assume H1. apply H1 (fun z => z = pack_b_p_e_e X f P c d -> c :e X).
- let X'. let f'. assume Hf'. let P'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_p_e_e X' f' P' c' d' = pack_b_p_e_e X f P c d.
  apply pack_b_p_e_e_inj X' X f' f P' P c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HP'P Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_b_p_e_e_E4: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set, struct_b_p_e_e (pack_b_p_e_e X f P c d) -> d :e X.
let X f P c d. assume H1. apply H1 (fun z => z = pack_b_p_e_e X f P c d -> d :e X).
- let X'. let f'. assume Hf'. let P'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_b_p_e_e X' f' P' c' d' = pack_b_p_e_e X f P c d.
  apply pack_b_p_e_e_inj X' X f' f P' P c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HP'P Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_b_p_e_e_eta: forall S, struct_b_p_e_e S -> S = pack_b_p_e_e (S 0) (decode_b (S 1)) (decode_p (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_b_p_e_e (z 0) (decode_b (z 1)) (decode_p (z 2)) (z 3) (z 4)).
let X. let f. assume _. let P. let c. assume _. let d. assume _.
prove pack_b_p_e_e X f P c d = pack_b_p_e_e (pack_b_p_e_e X f P c d 0) (decode_b (pack_b_p_e_e X f P c d 1)) (decode_p (pack_b_p_e_e X f P c d 2)) (pack_b_p_e_e X f P c d 3) (pack_b_p_e_e X f P c d 4).
rewrite <- pack_b_p_e_e_0_eq2 X f P c d.
rewrite <- pack_b_p_e_e_3_eq2 X f P c d.
rewrite <- pack_b_p_e_e_4_eq2 X f P c d.
apply pack_b_p_e_e_ext.
- exact pack_b_p_e_e_1_eq2 X f P c d.
- let x. assume Hx.
  rewrite <- pack_b_p_e_e_2_eq2 X f P c d x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_p_e_e_i : set -> (set -> (set -> set -> set) -> (set -> prop) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_p (S 2)) (S 3) (S 4).

Theorem unpack_b_p_e_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> prop) -> set -> set -> set,
  forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' P' c d = Phi X f P c d)
  ->
  unpack_b_p_e_e_i (pack_b_p_e_e X f P c d) Phi = Phi X f P c d.
let Phi X f P c d.
assume HPhi.
prove Phi (pack_b_p_e_e X f P c d 0) (decode_b (pack_b_p_e_e X f P c d 1)) (decode_p (pack_b_p_e_e X f P c d 2)) (pack_b_p_e_e X f P c d 3) (pack_b_p_e_e X f P c d 4) = Phi X f P c d.
rewrite <- pack_b_p_e_e_0_eq2 X f P c d.
prove Phi X (decode_b (pack_b_p_e_e X f P c d 1)) (decode_p (pack_b_p_e_e X f P c d 2)) (pack_b_p_e_e X f P c d 3) (pack_b_p_e_e X f P c d 4) = Phi X f P c d.
rewrite <- pack_b_p_e_e_3_eq2 X f P c d.
rewrite <- pack_b_p_e_e_4_eq2 X f P c d.
apply HPhi.
- exact pack_b_p_e_e_1_eq2 X f P c d.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_p_e_e X f P c d 2) x.
  rewrite <- pack_b_p_e_e_2_eq2 X f P c d x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_p_e_e_o : set -> (set -> (set -> set -> set) -> (set -> prop) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_p (S 2)) (S 3) (S 4).

Theorem unpack_b_p_e_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> prop) -> set -> set -> prop,
  forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall d:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' P' c d = Phi X f P c d)
  ->
  unpack_b_p_e_e_o (pack_b_p_e_e X f P c d) Phi = Phi X f P c d.
let Phi X f P c d.
assume HPhi.
prove Phi (pack_b_p_e_e X f P c d 0) (decode_b (pack_b_p_e_e X f P c d 1)) (decode_p (pack_b_p_e_e X f P c d 2)) (pack_b_p_e_e X f P c d 3) (pack_b_p_e_e X f P c d 4) = Phi X f P c d.
rewrite <- pack_b_p_e_e_0_eq2 X f P c d.
prove Phi X (decode_b (pack_b_p_e_e X f P c d 1)) (decode_p (pack_b_p_e_e X f P c d 2)) (pack_b_p_e_e X f P c d 3) (pack_b_p_e_e X f P c d 4) = Phi X f P c d.
rewrite <- pack_b_p_e_e_3_eq2 X f P c d.
rewrite <- pack_b_p_e_e_4_eq2 X f P c d.
apply HPhi.
- exact pack_b_p_e_e_1_eq2 X f P c d.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_p_e_e X f P c d 2) x.
  rewrite <- pack_b_p_e_e_2_eq2 X f P c d x Hx.
  apply iff_refl.
Qed.


Definition pack_u_u_r_r : set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set := fun X i j R T => (X,encode_u X i,encode_u X j,encode_r X R,encode_r X T).

Theorem pack_u_u_r_r_0_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_u_u_r_r X i j R T -> X = S 0.
let S X i j R T. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_u X j,encode_r X R,encode_r X T) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_u_u_r_r_0_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, X = pack_u_u_r_r X i j R T 0.
let X i j R T. apply pack_u_u_r_r_0_eq (pack_u_u_r_r X i j R T) X i j R T. reflexivity.
Qed.

Theorem pack_u_u_r_r_1_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_u_u_r_r X i j R T -> forall x :e X, i x = decode_u (S 1) x.
let S X i j R T. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_u X j,encode_r X R,encode_r X T) 1) x.
rewrite tuple_5_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_u_r_r_1_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x :e X, i x = decode_u (pack_u_u_r_r X i j R T 1) x.
let X i j R T. apply pack_u_u_r_r_1_eq (pack_u_u_r_r X i j R T) X i j R T. reflexivity.
Qed.

Theorem pack_u_u_r_r_2_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_u_u_r_r X i j R T -> forall x :e X, j x = decode_u (S 2) x.
let S X i j R T. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_u X i,encode_u X j,encode_r X R,encode_r X T) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_u_u_r_r_2_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x :e X, j x = decode_u (pack_u_u_r_r X i j R T 2) x.
let X i j R T. apply pack_u_u_r_r_2_eq (pack_u_u_r_r X i j R T) X i j R T. reflexivity.
Qed.

Theorem pack_u_u_r_r_3_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_u_u_r_r X i j R T -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X i j R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_u X i,encode_u X j,encode_r X R,encode_r X T) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_u_u_r_r_3_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_u_u_r_r X i j R T 3) x y.
let X i j R T. apply pack_u_u_r_r_3_eq (pack_u_u_r_r X i j R T) X i j R T. reflexivity.
Qed.

Theorem pack_u_u_r_r_4_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_u_u_r_r X i j R T -> forall x y :e X, T x y = decode_r (S 4) x y.
let S X i j R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_u X i,encode_u X j,encode_r X R,encode_r X T) 4) x y.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_u_u_r_r_4_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, T x y = decode_r (pack_u_u_r_r X i j R T 4) x y.
let X i j R T. apply pack_u_u_r_r_4_eq (pack_u_u_r_r X i j R T) X i j R T. reflexivity.
Qed.

Theorem pack_u_u_r_r_inj : forall X X', forall i i':set -> set, forall j j':set -> set, forall R R':set -> set -> prop, forall T T':set -> set -> prop, pack_u_u_r_r X i j R T = pack_u_u_r_r X' i' j' R' T' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x) /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y).
let X X' i i' j j' R R' T T'. assume H1.
claim L0: X' = pack_u_u_r_r X i j R T 0.
{ exact pack_u_u_r_r_0_eq (pack_u_u_r_r X i j R T) X' i' j' R' T' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_u_r_r_0_eq2 X i j R T. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_u_r_r_1_eq2 X i j R T x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_r_r_1_eq2 X' i' j' R' T' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_u_u_r_r_2_eq2 X i j R T x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_r_r_2_eq2 X' i' j' R' T' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_u_u_r_r_3_eq2 X i j R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_u_r_r_3_eq2 X' i' j' R' T' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_u_u_r_r_4_eq2 X i j R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_u_r_r_4_eq2 X' i' j' R' T' x Lx y Ly.
Qed.

Theorem pack_u_u_r_r_ext : forall X, forall i i':set -> set, forall j j':set -> set, forall R R':set -> set -> prop, forall T T':set -> set -> prop,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 pack_u_u_r_r X i j R T = pack_u_u_r_r X i' j' R' T'.
let X i i' j j' R R' T T'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_u X i,encode_u X j,encode_r X R,encode_r X T) = (X,encode_u X i',encode_u X j',encode_r X R',encode_r X T').
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X j = encode_u X j'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
claim L4: encode_r X T = encode_r X T'.
{ apply encode_r_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_u_u_r_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall R:set -> set -> prop, forall T:set -> set -> prop, q (pack_u_u_r_r X i j R T)) -> q S.

Theorem pack_struct_u_u_r_r_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall R:set -> set -> prop, forall T:set -> set -> prop, struct_u_u_r_r (pack_u_u_r_r X i j R T).
let X i. assume Hi. let j. assume Hj. let R T q. assume Hq.
exact Hq X i Hi j Hj R T.
Qed.

Theorem pack_struct_u_u_r_r_E1: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, struct_u_u_r_r (pack_u_u_r_r X i j R T) -> forall x :e X, i x :e X.
let X i j R T. assume H1. apply H1 (fun z => z = pack_u_u_r_r X i j R T -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let R'. let T'.
  assume Heq: pack_u_u_r_r X' i' j' R' T' = pack_u_u_r_r X i j R T.
  apply pack_u_u_r_r_inj X' X i' i j' j R' R T' T Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HR'R HT'T.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_r_r_E2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop, struct_u_u_r_r (pack_u_u_r_r X i j R T) -> forall x :e X, j x :e X.
let X i j R T. assume H1. apply H1 (fun z => z = pack_u_u_r_r X i j R T -> forall x :e X, j x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let R'. let T'.
  assume Heq: pack_u_u_r_r X' i' j' R' T' = pack_u_u_r_r X i j R T.
  apply pack_u_u_r_r_inj X' X i' i j' j R' R T' T Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HR'R HT'T.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem struct_u_u_r_r_eta: forall S, struct_u_u_r_r S -> S = pack_u_u_r_r (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_r (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_u_u_r_r (z 0) (decode_u (z 1)) (decode_u (z 2)) (decode_r (z 3)) (decode_r (z 4))).
let X. let i. assume _. let j. assume _. let R. let T.
prove pack_u_u_r_r X i j R T = pack_u_u_r_r (pack_u_u_r_r X i j R T 0) (decode_u (pack_u_u_r_r X i j R T 1)) (decode_u (pack_u_u_r_r X i j R T 2)) (decode_r (pack_u_u_r_r X i j R T 3)) (decode_r (pack_u_u_r_r X i j R T 4)).
rewrite <- pack_u_u_r_r_0_eq2 X i j R T.
apply pack_u_u_r_r_ext.
- exact pack_u_u_r_r_1_eq2 X i j R T.
- exact pack_u_u_r_r_2_eq2 X i j R T.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_u_r_r_3_eq2 X i j R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_u_r_r_4_eq2 X i j R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_u_r_r_i : set -> (set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_r (S 4)).

Theorem unpack_u_u_r_r_i_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> set,
  forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X i' j' R' T' = Phi X i j R T)
  ->
  unpack_u_u_r_r_i (pack_u_u_r_r X i j R T) Phi = Phi X i j R T.
let Phi X i j R T.
assume HPhi.
prove Phi (pack_u_u_r_r X i j R T 0) (decode_u (pack_u_u_r_r X i j R T 1)) (decode_u (pack_u_u_r_r X i j R T 2)) (decode_r (pack_u_u_r_r X i j R T 3)) (decode_r (pack_u_u_r_r X i j R T 4)) = Phi X i j R T.
rewrite <- pack_u_u_r_r_0_eq2 X i j R T.
prove Phi X (decode_u (pack_u_u_r_r X i j R T 1)) (decode_u (pack_u_u_r_r X i j R T 2)) (decode_r (pack_u_u_r_r X i j R T 3)) (decode_r (pack_u_u_r_r X i j R T 4)) = Phi X i j R T.
apply HPhi.
- exact pack_u_u_r_r_1_eq2 X i j R T.
- exact pack_u_u_r_r_2_eq2 X i j R T.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_u_r_r X i j R T 3) x y.
  rewrite <- pack_u_u_r_r_3_eq2 X i j R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_u_u_r_r X i j R T 4) x y.
  rewrite <- pack_u_u_r_r_4_eq2 X i j R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_u_r_r_o : set -> (set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_r (S 4)).

Theorem unpack_u_u_r_r_o_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> set -> prop) -> prop,
  forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X i' j' R' T' = Phi X i j R T)
  ->
  unpack_u_u_r_r_o (pack_u_u_r_r X i j R T) Phi = Phi X i j R T.
let Phi X i j R T.
assume HPhi.
prove Phi (pack_u_u_r_r X i j R T 0) (decode_u (pack_u_u_r_r X i j R T 1)) (decode_u (pack_u_u_r_r X i j R T 2)) (decode_r (pack_u_u_r_r X i j R T 3)) (decode_r (pack_u_u_r_r X i j R T 4)) = Phi X i j R T.
rewrite <- pack_u_u_r_r_0_eq2 X i j R T.
prove Phi X (decode_u (pack_u_u_r_r X i j R T 1)) (decode_u (pack_u_u_r_r X i j R T 2)) (decode_r (pack_u_u_r_r X i j R T 3)) (decode_r (pack_u_u_r_r X i j R T 4)) = Phi X i j R T.
apply HPhi.
- exact pack_u_u_r_r_1_eq2 X i j R T.
- exact pack_u_u_r_r_2_eq2 X i j R T.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_u_r_r X i j R T 3) x y.
  rewrite <- pack_u_u_r_r_3_eq2 X i j R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_u_u_r_r X i j R T 4) x y.
  rewrite <- pack_u_u_r_r_4_eq2 X i j R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_u_u_r_p : set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set := fun X i j R P => (X,encode_u X i,encode_u X j,encode_r X R,encode_p X P).

Theorem pack_u_u_r_p_0_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_u_u_r_p X i j R P -> X = S 0.
let S X i j R P. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_u X j,encode_r X R,encode_p X P) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_u_u_r_p_0_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, X = pack_u_u_r_p X i j R P 0.
let X i j R P. apply pack_u_u_r_p_0_eq (pack_u_u_r_p X i j R P) X i j R P. reflexivity.
Qed.

Theorem pack_u_u_r_p_1_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_u_u_r_p X i j R P -> forall x :e X, i x = decode_u (S 1) x.
let S X i j R P. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_u X j,encode_r X R,encode_p X P) 1) x.
rewrite tuple_5_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_u_r_p_1_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, i x = decode_u (pack_u_u_r_p X i j R P 1) x.
let X i j R P. apply pack_u_u_r_p_1_eq (pack_u_u_r_p X i j R P) X i j R P. reflexivity.
Qed.

Theorem pack_u_u_r_p_2_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_u_u_r_p X i j R P -> forall x :e X, j x = decode_u (S 2) x.
let S X i j R P. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_u X i,encode_u X j,encode_r X R,encode_p X P) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_u_u_r_p_2_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, j x = decode_u (pack_u_u_r_p X i j R P 2) x.
let X i j R P. apply pack_u_u_r_p_2_eq (pack_u_u_r_p X i j R P) X i j R P. reflexivity.
Qed.

Theorem pack_u_u_r_p_3_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_u_u_r_p X i j R P -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X i j R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_u X i,encode_u X j,encode_r X R,encode_p X P) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_u_u_r_p_3_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, R x y = decode_r (pack_u_u_r_p X i j R P 3) x y.
let X i j R P. apply pack_u_u_r_p_3_eq (pack_u_u_r_p X i j R P) X i j R P. reflexivity.
Qed.

Theorem pack_u_u_r_p_4_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_u_u_r_p X i j R P -> forall x :e X, P x = decode_p (S 4) x.
let S X i j R P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_u X i,encode_u X j,encode_r X R,encode_p X P) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_u_u_r_p_4_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_u_u_r_p X i j R P 4) x.
let X i j R P. apply pack_u_u_r_p_4_eq (pack_u_u_r_p X i j R P) X i j R P. reflexivity.
Qed.

Theorem pack_u_u_r_p_inj : forall X X', forall i i':set -> set, forall j j':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, pack_u_u_r_p X i j R P = pack_u_u_r_p X' i' j' R' P' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x).
let X X' i i' j j' R R' P P'. assume H1.
claim L0: X' = pack_u_u_r_p X i j R P 0.
{ exact pack_u_u_r_p_0_eq (pack_u_u_r_p X i j R P) X' i' j' R' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_u_r_p_0_eq2 X i j R P. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_u_r_p_1_eq2 X i j R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_r_p_1_eq2 X' i' j' R' P' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_u_u_r_p_2_eq2 X i j R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_r_p_2_eq2 X' i' j' R' P' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_u_u_r_p_3_eq2 X i j R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_u_r_p_3_eq2 X' i' j' R' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_u_u_r_p_4_eq2 X i j R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_r_p_4_eq2 X' i' j' R' P' x Lx.
Qed.

Theorem pack_u_u_r_p_ext : forall X, forall i i':set -> set, forall j j':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_u_u_r_p X i j R P = pack_u_u_r_p X i' j' R' P'.
let X i i' j j' R R' P P'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_u X i,encode_u X j,encode_r X R,encode_p X P) = (X,encode_u X i',encode_u X j',encode_r X R',encode_p X P').
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X j = encode_u X j'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_u_u_r_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, q (pack_u_u_r_p X i j R P)) -> q S.

Theorem pack_struct_u_u_r_p_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, struct_u_u_r_p (pack_u_u_r_p X i j R P).
let X i. assume Hi. let j. assume Hj. let R P q. assume Hq.
exact Hq X i Hi j Hj R P.
Qed.

Theorem pack_struct_u_u_r_p_E1: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, struct_u_u_r_p (pack_u_u_r_p X i j R P) -> forall x :e X, i x :e X.
let X i j R P. assume H1. apply H1 (fun z => z = pack_u_u_r_p X i j R P -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let R'. let P'.
  assume Heq: pack_u_u_r_p X' i' j' R' P' = pack_u_u_r_p X i j R P.
  apply pack_u_u_r_p_inj X' X i' i j' j R' R P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HR'R HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_r_p_E2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop, struct_u_u_r_p (pack_u_u_r_p X i j R P) -> forall x :e X, j x :e X.
let X i j R P. assume H1. apply H1 (fun z => z = pack_u_u_r_p X i j R P -> forall x :e X, j x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let R'. let P'.
  assume Heq: pack_u_u_r_p X' i' j' R' P' = pack_u_u_r_p X i j R P.
  apply pack_u_u_r_p_inj X' X i' i j' j R' R P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HR'R HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem struct_u_u_r_p_eta: forall S, struct_u_u_r_p S -> S = pack_u_u_r_p (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_u_u_r_p (z 0) (decode_u (z 1)) (decode_u (z 2)) (decode_r (z 3)) (decode_p (z 4))).
let X. let i. assume _. let j. assume _. let R. let P.
prove pack_u_u_r_p X i j R P = pack_u_u_r_p (pack_u_u_r_p X i j R P 0) (decode_u (pack_u_u_r_p X i j R P 1)) (decode_u (pack_u_u_r_p X i j R P 2)) (decode_r (pack_u_u_r_p X i j R P 3)) (decode_p (pack_u_u_r_p X i j R P 4)).
rewrite <- pack_u_u_r_p_0_eq2 X i j R P.
apply pack_u_u_r_p_ext.
- exact pack_u_u_r_p_1_eq2 X i j R P.
- exact pack_u_u_r_p_2_eq2 X i j R P.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_u_r_p_3_eq2 X i j R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_u_u_r_p_4_eq2 X i j R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_u_r_p_i : set -> (set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_p (S 4)).

Theorem unpack_u_u_r_p_i_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set,
  forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' j' R' P' = Phi X i j R P)
  ->
  unpack_u_u_r_p_i (pack_u_u_r_p X i j R P) Phi = Phi X i j R P.
let Phi X i j R P.
assume HPhi.
prove Phi (pack_u_u_r_p X i j R P 0) (decode_u (pack_u_u_r_p X i j R P 1)) (decode_u (pack_u_u_r_p X i j R P 2)) (decode_r (pack_u_u_r_p X i j R P 3)) (decode_p (pack_u_u_r_p X i j R P 4)) = Phi X i j R P.
rewrite <- pack_u_u_r_p_0_eq2 X i j R P.
prove Phi X (decode_u (pack_u_u_r_p X i j R P 1)) (decode_u (pack_u_u_r_p X i j R P 2)) (decode_r (pack_u_u_r_p X i j R P 3)) (decode_p (pack_u_u_r_p X i j R P 4)) = Phi X i j R P.
apply HPhi.
- exact pack_u_u_r_p_1_eq2 X i j R P.
- exact pack_u_u_r_p_2_eq2 X i j R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_u_r_p X i j R P 3) x y.
  rewrite <- pack_u_u_r_p_3_eq2 X i j R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_u_r_p X i j R P 4) x.
  rewrite <- pack_u_u_r_p_4_eq2 X i j R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_u_r_p_o : set -> (set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)) (decode_p (S 4)).

Theorem unpack_u_u_r_p_o_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop,
  forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' j' R' P' = Phi X i j R P)
  ->
  unpack_u_u_r_p_o (pack_u_u_r_p X i j R P) Phi = Phi X i j R P.
let Phi X i j R P.
assume HPhi.
prove Phi (pack_u_u_r_p X i j R P 0) (decode_u (pack_u_u_r_p X i j R P 1)) (decode_u (pack_u_u_r_p X i j R P 2)) (decode_r (pack_u_u_r_p X i j R P 3)) (decode_p (pack_u_u_r_p X i j R P 4)) = Phi X i j R P.
rewrite <- pack_u_u_r_p_0_eq2 X i j R P.
prove Phi X (decode_u (pack_u_u_r_p X i j R P 1)) (decode_u (pack_u_u_r_p X i j R P 2)) (decode_r (pack_u_u_r_p X i j R P 3)) (decode_p (pack_u_u_r_p X i j R P 4)) = Phi X i j R P.
apply HPhi.
- exact pack_u_u_r_p_1_eq2 X i j R P.
- exact pack_u_u_r_p_2_eq2 X i j R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_u_r_p X i j R P 3) x y.
  rewrite <- pack_u_u_r_p_3_eq2 X i j R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_u_r_p X i j R P 4) x.
  rewrite <- pack_u_u_r_p_4_eq2 X i j R P x Hx.
  apply iff_refl.
Qed.


Definition pack_u_u_r_e : set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> set -> set := fun X i j R c => (X,encode_u X i,encode_u X j,encode_r X R,c).

Theorem pack_u_u_r_e_0_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_u_u_r_e X i j R c -> X = S 0.
let S X i j R c. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_u X j,encode_r X R,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_u_u_r_e_0_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, X = pack_u_u_r_e X i j R c 0.
let X i j R c. apply pack_u_u_r_e_0_eq (pack_u_u_r_e X i j R c) X i j R c. reflexivity.
Qed.

Theorem pack_u_u_r_e_1_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_u_u_r_e X i j R c -> forall x :e X, i x = decode_u (S 1) x.
let S X i j R c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_u X j,encode_r X R,c) 1) x.
rewrite tuple_5_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_u_r_e_1_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, forall x :e X, i x = decode_u (pack_u_u_r_e X i j R c 1) x.
let X i j R c. apply pack_u_u_r_e_1_eq (pack_u_u_r_e X i j R c) X i j R c. reflexivity.
Qed.

Theorem pack_u_u_r_e_2_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_u_u_r_e X i j R c -> forall x :e X, j x = decode_u (S 2) x.
let S X i j R c. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_u X i,encode_u X j,encode_r X R,c) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_u_u_r_e_2_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, forall x :e X, j x = decode_u (pack_u_u_r_e X i j R c 2) x.
let X i j R c. apply pack_u_u_r_e_2_eq (pack_u_u_r_e X i j R c) X i j R c. reflexivity.
Qed.

Theorem pack_u_u_r_e_3_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_u_u_r_e X i j R c -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X i j R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_u X i,encode_u X j,encode_r X R,c) 3) x y.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_u_u_r_e_3_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_u_u_r_e X i j R c 3) x y.
let X i j R c. apply pack_u_u_r_e_3_eq (pack_u_u_r_e X i j R c) X i j R c. reflexivity.
Qed.

Theorem pack_u_u_r_e_4_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_u_u_r_e X i j R c -> c = S 4.
let S X i j R c. assume H1.
rewrite H1. prove c = (X,encode_u X i,encode_u X j,encode_r X R,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_u_u_r_e_4_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, c = pack_u_u_r_e X i j R c 4.
let X i j R c. apply pack_u_u_r_e_4_eq (pack_u_u_r_e X i j R c) X i j R c. reflexivity.
Qed.

Theorem pack_u_u_r_e_inj : forall X X', forall i i':set -> set, forall j j':set -> set, forall R R':set -> set -> prop, forall c c':set, pack_u_u_r_e X i j R c = pack_u_u_r_e X' i' j' R' c' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x) /\ (forall x y :e X, R x y = R' x y) /\ c = c'.
let X X' i i' j j' R R' c c'. assume H1.
claim L0: X' = pack_u_u_r_e X i j R c 0.
{ exact pack_u_u_r_e_0_eq (pack_u_u_r_e X i j R c) X' i' j' R' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_u_r_e_0_eq2 X i j R c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_u_r_e_1_eq2 X i j R c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_r_e_1_eq2 X' i' j' R' c' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_u_u_r_e_2_eq2 X i j R c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_r_e_2_eq2 X' i' j' R' c' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_u_u_r_e_3_eq2 X i j R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_u_r_e_3_eq2 X' i' j' R' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_u_u_r_e_4_eq2 X i j R c.
  rewrite H1. symmetry.
  exact pack_u_u_r_e_4_eq2 X' i' j' R' c'.
Qed.

Theorem pack_u_u_r_e_ext : forall X, forall i i':set -> set, forall j j':set -> set, forall R R':set -> set -> prop, forall c,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_u_u_r_e X i j R c = pack_u_u_r_e X i' j' R' c.
let X i i' j j' R R' c. assume H1. assume H2. assume H3.
prove (X,encode_u X i,encode_u X j,encode_r X R,c) = (X,encode_u X i',encode_u X j',encode_r X R',c).
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X j = encode_u X j'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_u_u_r_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> q (pack_u_u_r_e X i j R c)) -> q S.

Theorem pack_struct_u_u_r_e_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> struct_u_u_r_e (pack_u_u_r_e X i j R c).
let X i. assume Hi. let j. assume Hj. let R c. assume Hc. let q. assume Hq.
exact Hq X i Hi j Hj R c Hc.
Qed.

Theorem pack_struct_u_u_r_e_E1: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, struct_u_u_r_e (pack_u_u_r_e X i j R c) -> forall x :e X, i x :e X.
let X i j R c. assume H1. apply H1 (fun z => z = pack_u_u_r_e X i j R c -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let R'. let c'. assume Hc'.
  assume Heq: pack_u_u_r_e X' i' j' R' c' = pack_u_u_r_e X i j R c.
  apply pack_u_u_r_e_inj X' X i' i j' j R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HR'R Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_r_e_E2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, struct_u_u_r_e (pack_u_u_r_e X i j R c) -> forall x :e X, j x :e X.
let X i j R c. assume H1. apply H1 (fun z => z = pack_u_u_r_e X i j R c -> forall x :e X, j x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let R'. let c'. assume Hc'.
  assume Heq: pack_u_u_r_e X' i' j' R' c' = pack_u_u_r_e X i j R c.
  apply pack_u_u_r_e_inj X' X i' i j' j R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HR'R Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_r_e_E4: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set, struct_u_u_r_e (pack_u_u_r_e X i j R c) -> c :e X.
let X i j R c. assume H1. apply H1 (fun z => z = pack_u_u_r_e X i j R c -> c :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let R'. let c'. assume Hc'.
  assume Heq: pack_u_u_r_e X' i' j' R' c' = pack_u_u_r_e X i j R c.
  apply pack_u_u_r_e_inj X' X i' i j' j R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HR'R Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_u_u_r_e_eta: forall S, struct_u_u_r_e S -> S = pack_u_u_r_e (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_u_u_r_e (z 0) (decode_u (z 1)) (decode_u (z 2)) (decode_r (z 3)) (z 4)).
let X. let i. assume _. let j. assume _. let R. let c. assume _.
prove pack_u_u_r_e X i j R c = pack_u_u_r_e (pack_u_u_r_e X i j R c 0) (decode_u (pack_u_u_r_e X i j R c 1)) (decode_u (pack_u_u_r_e X i j R c 2)) (decode_r (pack_u_u_r_e X i j R c 3)) (pack_u_u_r_e X i j R c 4).
rewrite <- pack_u_u_r_e_0_eq2 X i j R c.
rewrite <- pack_u_u_r_e_4_eq2 X i j R c.
apply pack_u_u_r_e_ext.
- exact pack_u_u_r_e_1_eq2 X i j R c.
- exact pack_u_u_r_e_2_eq2 X i j R c.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_u_r_e_3_eq2 X i j R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_u_r_e_i : set -> (set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)) (S 4).

Theorem unpack_u_u_r_e_i_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> set -> set,
  forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X i' j' R' c = Phi X i j R c)
  ->
  unpack_u_u_r_e_i (pack_u_u_r_e X i j R c) Phi = Phi X i j R c.
let Phi X i j R c.
assume HPhi.
prove Phi (pack_u_u_r_e X i j R c 0) (decode_u (pack_u_u_r_e X i j R c 1)) (decode_u (pack_u_u_r_e X i j R c 2)) (decode_r (pack_u_u_r_e X i j R c 3)) (pack_u_u_r_e X i j R c 4) = Phi X i j R c.
rewrite <- pack_u_u_r_e_0_eq2 X i j R c.
prove Phi X (decode_u (pack_u_u_r_e X i j R c 1)) (decode_u (pack_u_u_r_e X i j R c 2)) (decode_r (pack_u_u_r_e X i j R c 3)) (pack_u_u_r_e X i j R c 4) = Phi X i j R c.
rewrite <- pack_u_u_r_e_4_eq2 X i j R c.
apply HPhi.
- exact pack_u_u_r_e_1_eq2 X i j R c.
- exact pack_u_u_r_e_2_eq2 X i j R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_u_r_e X i j R c 3) x y.
  rewrite <- pack_u_u_r_e_3_eq2 X i j R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_u_r_e_o : set -> (set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)) (S 4).

Theorem unpack_u_u_r_e_o_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> set -> prop,
  forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X i' j' R' c = Phi X i j R c)
  ->
  unpack_u_u_r_e_o (pack_u_u_r_e X i j R c) Phi = Phi X i j R c.
let Phi X i j R c.
assume HPhi.
prove Phi (pack_u_u_r_e X i j R c 0) (decode_u (pack_u_u_r_e X i j R c 1)) (decode_u (pack_u_u_r_e X i j R c 2)) (decode_r (pack_u_u_r_e X i j R c 3)) (pack_u_u_r_e X i j R c 4) = Phi X i j R c.
rewrite <- pack_u_u_r_e_0_eq2 X i j R c.
prove Phi X (decode_u (pack_u_u_r_e X i j R c 1)) (decode_u (pack_u_u_r_e X i j R c 2)) (decode_r (pack_u_u_r_e X i j R c 3)) (pack_u_u_r_e X i j R c 4) = Phi X i j R c.
rewrite <- pack_u_u_r_e_4_eq2 X i j R c.
apply HPhi.
- exact pack_u_u_r_e_1_eq2 X i j R c.
- exact pack_u_u_r_e_2_eq2 X i j R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_u_r_e X i j R c 3) x y.
  rewrite <- pack_u_u_r_e_3_eq2 X i j R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_u_u_p_p : set -> (set -> set) -> (set -> set) -> (set -> prop) -> (set -> prop) -> set := fun X i j P Q => (X,encode_u X i,encode_u X j,encode_p X P,encode_p X Q).

Theorem pack_u_u_p_p_0_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_u_u_p_p X i j P Q -> X = S 0.
let S X i j P Q. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_u X j,encode_p X P,encode_p X Q) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_u_u_p_p_0_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, X = pack_u_u_p_p X i j P Q 0.
let X i j P Q. apply pack_u_u_p_p_0_eq (pack_u_u_p_p X i j P Q) X i j P Q. reflexivity.
Qed.

Theorem pack_u_u_p_p_1_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_u_u_p_p X i j P Q -> forall x :e X, i x = decode_u (S 1) x.
let S X i j P Q. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_u X j,encode_p X P,encode_p X Q) 1) x.
rewrite tuple_5_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_u_p_p_1_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, i x = decode_u (pack_u_u_p_p X i j P Q 1) x.
let X i j P Q. apply pack_u_u_p_p_1_eq (pack_u_u_p_p X i j P Q) X i j P Q. reflexivity.
Qed.

Theorem pack_u_u_p_p_2_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_u_u_p_p X i j P Q -> forall x :e X, j x = decode_u (S 2) x.
let S X i j P Q. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_u X i,encode_u X j,encode_p X P,encode_p X Q) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_u_u_p_p_2_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, j x = decode_u (pack_u_u_p_p X i j P Q 2) x.
let X i j P Q. apply pack_u_u_p_p_2_eq (pack_u_u_p_p X i j P Q) X i j P Q. reflexivity.
Qed.

Theorem pack_u_u_p_p_3_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_u_u_p_p X i j P Q -> forall x :e X, P x = decode_p (S 3) x.
let S X i j P Q. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_u X i,encode_u X j,encode_p X P,encode_p X Q) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_u_u_p_p_3_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, P x = decode_p (pack_u_u_p_p X i j P Q 3) x.
let X i j P Q. apply pack_u_u_p_p_3_eq (pack_u_u_p_p X i j P Q) X i j P Q. reflexivity.
Qed.

Theorem pack_u_u_p_p_4_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, S = pack_u_u_p_p X i j P Q -> forall x :e X, Q x = decode_p (S 4) x.
let S X i j P Q. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_u X i,encode_u X j,encode_p X P,encode_p X Q) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_u_u_p_p_4_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, forall x :e X, Q x = decode_p (pack_u_u_p_p X i j P Q 4) x.
let X i j P Q. apply pack_u_u_p_p_4_eq (pack_u_u_p_p X i j P Q) X i j P Q. reflexivity.
Qed.

Theorem pack_u_u_p_p_inj : forall X X', forall i i':set -> set, forall j j':set -> set, forall P P':set -> prop, forall Q Q':set -> prop, pack_u_u_p_p X i j P Q = pack_u_u_p_p X' i' j' P' Q' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x) /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x).
let X X' i i' j j' P P' Q Q'. assume H1.
claim L0: X' = pack_u_u_p_p X i j P Q 0.
{ exact pack_u_u_p_p_0_eq (pack_u_u_p_p X i j P Q) X' i' j' P' Q' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_u_p_p_0_eq2 X i j P Q. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_u_p_p_1_eq2 X i j P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_p_p_1_eq2 X' i' j' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_u_u_p_p_2_eq2 X i j P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_p_p_2_eq2 X' i' j' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_u_u_p_p_3_eq2 X i j P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_p_p_3_eq2 X' i' j' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_u_u_p_p_4_eq2 X i j P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_p_p_4_eq2 X' i' j' P' Q' x Lx.
Qed.

Theorem pack_u_u_p_p_ext : forall X, forall i i':set -> set, forall j j':set -> set, forall P P':set -> prop, forall Q Q':set -> prop,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_u_u_p_p X i j P Q = pack_u_u_p_p X i' j' P' Q'.
let X i i' j j' P P' Q Q'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_u X i,encode_u X j,encode_p X P,encode_p X Q) = (X,encode_u X i',encode_u X j',encode_p X P',encode_p X Q').
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X j = encode_u X j'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_u_u_p_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall P:set -> prop, forall Q:set -> prop, q (pack_u_u_p_p X i j P Q)) -> q S.

Theorem pack_struct_u_u_p_p_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall P:set -> prop, forall Q:set -> prop, struct_u_u_p_p (pack_u_u_p_p X i j P Q).
let X i. assume Hi. let j. assume Hj. let P Q q. assume Hq.
exact Hq X i Hi j Hj P Q.
Qed.

Theorem pack_struct_u_u_p_p_E1: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, struct_u_u_p_p (pack_u_u_p_p X i j P Q) -> forall x :e X, i x :e X.
let X i j P Q. assume H1. apply H1 (fun z => z = pack_u_u_p_p X i j P Q -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let P'. let Q'.
  assume Heq: pack_u_u_p_p X' i' j' P' Q' = pack_u_u_p_p X i j P Q.
  apply pack_u_u_p_p_inj X' X i' i j' j P' P Q' Q Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HP'P HQ'Q.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_p_p_E2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop, struct_u_u_p_p (pack_u_u_p_p X i j P Q) -> forall x :e X, j x :e X.
let X i j P Q. assume H1. apply H1 (fun z => z = pack_u_u_p_p X i j P Q -> forall x :e X, j x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let P'. let Q'.
  assume Heq: pack_u_u_p_p X' i' j' P' Q' = pack_u_u_p_p X i j P Q.
  apply pack_u_u_p_p_inj X' X i' i j' j P' P Q' Q Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HP'P HQ'Q.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem struct_u_u_p_p_eta: forall S, struct_u_u_p_p S -> S = pack_u_u_p_p (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_p (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_u_u_p_p (z 0) (decode_u (z 1)) (decode_u (z 2)) (decode_p (z 3)) (decode_p (z 4))).
let X. let i. assume _. let j. assume _. let P. let Q.
prove pack_u_u_p_p X i j P Q = pack_u_u_p_p (pack_u_u_p_p X i j P Q 0) (decode_u (pack_u_u_p_p X i j P Q 1)) (decode_u (pack_u_u_p_p X i j P Q 2)) (decode_p (pack_u_u_p_p X i j P Q 3)) (decode_p (pack_u_u_p_p X i j P Q 4)).
rewrite <- pack_u_u_p_p_0_eq2 X i j P Q.
apply pack_u_u_p_p_ext.
- exact pack_u_u_p_p_1_eq2 X i j P Q.
- exact pack_u_u_p_p_2_eq2 X i j P Q.
- let x. assume Hx.
  rewrite <- pack_u_u_p_p_3_eq2 X i j P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_u_u_p_p_4_eq2 X i j P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_u_p_p_i : set -> (set -> (set -> set) -> (set -> set) -> (set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_u_u_p_p_i_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> prop) -> (set -> prop) -> set,
  forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X i' j' P' Q' = Phi X i j P Q)
  ->
  unpack_u_u_p_p_i (pack_u_u_p_p X i j P Q) Phi = Phi X i j P Q.
let Phi X i j P Q.
assume HPhi.
prove Phi (pack_u_u_p_p X i j P Q 0) (decode_u (pack_u_u_p_p X i j P Q 1)) (decode_u (pack_u_u_p_p X i j P Q 2)) (decode_p (pack_u_u_p_p X i j P Q 3)) (decode_p (pack_u_u_p_p X i j P Q 4)) = Phi X i j P Q.
rewrite <- pack_u_u_p_p_0_eq2 X i j P Q.
prove Phi X (decode_u (pack_u_u_p_p X i j P Q 1)) (decode_u (pack_u_u_p_p X i j P Q 2)) (decode_p (pack_u_u_p_p X i j P Q 3)) (decode_p (pack_u_u_p_p X i j P Q 4)) = Phi X i j P Q.
apply HPhi.
- exact pack_u_u_p_p_1_eq2 X i j P Q.
- exact pack_u_u_p_p_2_eq2 X i j P Q.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_u_p_p X i j P Q 3) x.
  rewrite <- pack_u_u_p_p_3_eq2 X i j P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_u_u_p_p X i j P Q 4) x.
  rewrite <- pack_u_u_p_p_4_eq2 X i j P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_u_p_p_o : set -> (set -> (set -> set) -> (set -> set) -> (set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_u_u_p_p_o_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> prop) -> (set -> prop) -> prop,
  forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall Q:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X i' j' P' Q' = Phi X i j P Q)
  ->
  unpack_u_u_p_p_o (pack_u_u_p_p X i j P Q) Phi = Phi X i j P Q.
let Phi X i j P Q.
assume HPhi.
prove Phi (pack_u_u_p_p X i j P Q 0) (decode_u (pack_u_u_p_p X i j P Q 1)) (decode_u (pack_u_u_p_p X i j P Q 2)) (decode_p (pack_u_u_p_p X i j P Q 3)) (decode_p (pack_u_u_p_p X i j P Q 4)) = Phi X i j P Q.
rewrite <- pack_u_u_p_p_0_eq2 X i j P Q.
prove Phi X (decode_u (pack_u_u_p_p X i j P Q 1)) (decode_u (pack_u_u_p_p X i j P Q 2)) (decode_p (pack_u_u_p_p X i j P Q 3)) (decode_p (pack_u_u_p_p X i j P Q 4)) = Phi X i j P Q.
apply HPhi.
- exact pack_u_u_p_p_1_eq2 X i j P Q.
- exact pack_u_u_p_p_2_eq2 X i j P Q.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_u_p_p X i j P Q 3) x.
  rewrite <- pack_u_u_p_p_3_eq2 X i j P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_u_u_p_p X i j P Q 4) x.
  rewrite <- pack_u_u_p_p_4_eq2 X i j P Q x Hx.
  apply iff_refl.
Qed.


Definition pack_u_u_p_e : set -> (set -> set) -> (set -> set) -> (set -> prop) -> set -> set := fun X i j P c => (X,encode_u X i,encode_u X j,encode_p X P,c).

Theorem pack_u_u_p_e_0_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, S = pack_u_u_p_e X i j P c -> X = S 0.
let S X i j P c. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_u X j,encode_p X P,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_u_u_p_e_0_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, X = pack_u_u_p_e X i j P c 0.
let X i j P c. apply pack_u_u_p_e_0_eq (pack_u_u_p_e X i j P c) X i j P c. reflexivity.
Qed.

Theorem pack_u_u_p_e_1_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, S = pack_u_u_p_e X i j P c -> forall x :e X, i x = decode_u (S 1) x.
let S X i j P c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_u X j,encode_p X P,c) 1) x.
rewrite tuple_5_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_u_p_e_1_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, forall x :e X, i x = decode_u (pack_u_u_p_e X i j P c 1) x.
let X i j P c. apply pack_u_u_p_e_1_eq (pack_u_u_p_e X i j P c) X i j P c. reflexivity.
Qed.

Theorem pack_u_u_p_e_2_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, S = pack_u_u_p_e X i j P c -> forall x :e X, j x = decode_u (S 2) x.
let S X i j P c. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_u X i,encode_u X j,encode_p X P,c) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_u_u_p_e_2_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, forall x :e X, j x = decode_u (pack_u_u_p_e X i j P c 2) x.
let X i j P c. apply pack_u_u_p_e_2_eq (pack_u_u_p_e X i j P c) X i j P c. reflexivity.
Qed.

Theorem pack_u_u_p_e_3_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, S = pack_u_u_p_e X i j P c -> forall x :e X, P x = decode_p (S 3) x.
let S X i j P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_u X i,encode_u X j,encode_p X P,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_u_u_p_e_3_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_u_u_p_e X i j P c 3) x.
let X i j P c. apply pack_u_u_p_e_3_eq (pack_u_u_p_e X i j P c) X i j P c. reflexivity.
Qed.

Theorem pack_u_u_p_e_4_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, S = pack_u_u_p_e X i j P c -> c = S 4.
let S X i j P c. assume H1.
rewrite H1. prove c = (X,encode_u X i,encode_u X j,encode_p X P,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_u_u_p_e_4_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, c = pack_u_u_p_e X i j P c 4.
let X i j P c. apply pack_u_u_p_e_4_eq (pack_u_u_p_e X i j P c) X i j P c. reflexivity.
Qed.

Theorem pack_u_u_p_e_inj : forall X X', forall i i':set -> set, forall j j':set -> set, forall P P':set -> prop, forall c c':set, pack_u_u_p_e X i j P c = pack_u_u_p_e X' i' j' P' c' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' i i' j j' P P' c c'. assume H1.
claim L0: X' = pack_u_u_p_e X i j P c 0.
{ exact pack_u_u_p_e_0_eq (pack_u_u_p_e X i j P c) X' i' j' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_u_p_e_0_eq2 X i j P c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_u_p_e_1_eq2 X i j P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_p_e_1_eq2 X' i' j' P' c' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_u_u_p_e_2_eq2 X i j P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_p_e_2_eq2 X' i' j' P' c' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_u_u_p_e_3_eq2 X i j P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_p_e_3_eq2 X' i' j' P' c' x Lx.
- prove c = c'.
  rewrite pack_u_u_p_e_4_eq2 X i j P c.
  rewrite H1. symmetry.
  exact pack_u_u_p_e_4_eq2 X' i' j' P' c'.
Qed.

Theorem pack_u_u_p_e_ext : forall X, forall i i':set -> set, forall j j':set -> set, forall P P':set -> prop, forall c,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_u_u_p_e X i j P c = pack_u_u_p_e X i' j' P' c.
let X i i' j j' P P' c. assume H1. assume H2. assume H3.
prove (X,encode_u X i,encode_u X j,encode_p X P,c) = (X,encode_u X i',encode_u X j',encode_p X P',c).
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X j = encode_u X j'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_u_u_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall P:set -> prop, forall c:set, c :e X -> q (pack_u_u_p_e X i j P c)) -> q S.

Theorem pack_struct_u_u_p_e_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall P:set -> prop, forall c:set, c :e X -> struct_u_u_p_e (pack_u_u_p_e X i j P c).
let X i. assume Hi. let j. assume Hj. let P c. assume Hc. let q. assume Hq.
exact Hq X i Hi j Hj P c Hc.
Qed.

Theorem pack_struct_u_u_p_e_E1: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, struct_u_u_p_e (pack_u_u_p_e X i j P c) -> forall x :e X, i x :e X.
let X i j P c. assume H1. apply H1 (fun z => z = pack_u_u_p_e X i j P c -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let P'. let c'. assume Hc'.
  assume Heq: pack_u_u_p_e X' i' j' P' c' = pack_u_u_p_e X i j P c.
  apply pack_u_u_p_e_inj X' X i' i j' j P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_p_e_E2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, struct_u_u_p_e (pack_u_u_p_e X i j P c) -> forall x :e X, j x :e X.
let X i j P c. assume H1. apply H1 (fun z => z = pack_u_u_p_e X i j P c -> forall x :e X, j x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let P'. let c'. assume Hc'.
  assume Heq: pack_u_u_p_e X' i' j' P' c' = pack_u_u_p_e X i j P c.
  apply pack_u_u_p_e_inj X' X i' i j' j P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_p_e_E4: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set, struct_u_u_p_e (pack_u_u_p_e X i j P c) -> c :e X.
let X i j P c. assume H1. apply H1 (fun z => z = pack_u_u_p_e X i j P c -> c :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let P'. let c'. assume Hc'.
  assume Heq: pack_u_u_p_e X' i' j' P' c' = pack_u_u_p_e X i j P c.
  apply pack_u_u_p_e_inj X' X i' i j' j P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_u_u_p_e_eta: forall S, struct_u_u_p_e S -> S = pack_u_u_p_e (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_p (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_u_u_p_e (z 0) (decode_u (z 1)) (decode_u (z 2)) (decode_p (z 3)) (z 4)).
let X. let i. assume _. let j. assume _. let P. let c. assume _.
prove pack_u_u_p_e X i j P c = pack_u_u_p_e (pack_u_u_p_e X i j P c 0) (decode_u (pack_u_u_p_e X i j P c 1)) (decode_u (pack_u_u_p_e X i j P c 2)) (decode_p (pack_u_u_p_e X i j P c 3)) (pack_u_u_p_e X i j P c 4).
rewrite <- pack_u_u_p_e_0_eq2 X i j P c.
rewrite <- pack_u_u_p_e_4_eq2 X i j P c.
apply pack_u_u_p_e_ext.
- exact pack_u_u_p_e_1_eq2 X i j P c.
- exact pack_u_u_p_e_2_eq2 X i j P c.
- let x. assume Hx.
  rewrite <- pack_u_u_p_e_3_eq2 X i j P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_u_p_e_i : set -> (set -> (set -> set) -> (set -> set) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_u_u_p_e_i_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> prop) -> set -> set,
  forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' j' P' c = Phi X i j P c)
  ->
  unpack_u_u_p_e_i (pack_u_u_p_e X i j P c) Phi = Phi X i j P c.
let Phi X i j P c.
assume HPhi.
prove Phi (pack_u_u_p_e X i j P c 0) (decode_u (pack_u_u_p_e X i j P c 1)) (decode_u (pack_u_u_p_e X i j P c 2)) (decode_p (pack_u_u_p_e X i j P c 3)) (pack_u_u_p_e X i j P c 4) = Phi X i j P c.
rewrite <- pack_u_u_p_e_0_eq2 X i j P c.
prove Phi X (decode_u (pack_u_u_p_e X i j P c 1)) (decode_u (pack_u_u_p_e X i j P c 2)) (decode_p (pack_u_u_p_e X i j P c 3)) (pack_u_u_p_e X i j P c 4) = Phi X i j P c.
rewrite <- pack_u_u_p_e_4_eq2 X i j P c.
apply HPhi.
- exact pack_u_u_p_e_1_eq2 X i j P c.
- exact pack_u_u_p_e_2_eq2 X i j P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_u_p_e X i j P c 3) x.
  rewrite <- pack_u_u_p_e_3_eq2 X i j P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_u_p_e_o : set -> (set -> (set -> set) -> (set -> set) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_u_u_p_e_o_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> prop) -> set -> prop,
  forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' j' P' c = Phi X i j P c)
  ->
  unpack_u_u_p_e_o (pack_u_u_p_e X i j P c) Phi = Phi X i j P c.
let Phi X i j P c.
assume HPhi.
prove Phi (pack_u_u_p_e X i j P c 0) (decode_u (pack_u_u_p_e X i j P c 1)) (decode_u (pack_u_u_p_e X i j P c 2)) (decode_p (pack_u_u_p_e X i j P c 3)) (pack_u_u_p_e X i j P c 4) = Phi X i j P c.
rewrite <- pack_u_u_p_e_0_eq2 X i j P c.
prove Phi X (decode_u (pack_u_u_p_e X i j P c 1)) (decode_u (pack_u_u_p_e X i j P c 2)) (decode_p (pack_u_u_p_e X i j P c 3)) (pack_u_u_p_e X i j P c 4) = Phi X i j P c.
rewrite <- pack_u_u_p_e_4_eq2 X i j P c.
apply HPhi.
- exact pack_u_u_p_e_1_eq2 X i j P c.
- exact pack_u_u_p_e_2_eq2 X i j P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_u_p_e X i j P c 3) x.
  rewrite <- pack_u_u_p_e_3_eq2 X i j P c x Hx.
  apply iff_refl.
Qed.


Definition pack_u_u_e_e : set -> (set -> set) -> (set -> set) -> set -> set -> set := fun X i j c d => (X,encode_u X i,encode_u X j,c,d).

Theorem pack_u_u_e_e_0_eq: forall S X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, S = pack_u_u_e_e X i j c d -> X = S 0.
let S X i j c d. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_u X j,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_u_u_e_e_0_eq2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, X = pack_u_u_e_e X i j c d 0.
let X i j c d. apply pack_u_u_e_e_0_eq (pack_u_u_e_e X i j c d) X i j c d. reflexivity.
Qed.

Theorem pack_u_u_e_e_1_eq: forall S X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, S = pack_u_u_e_e X i j c d -> forall x :e X, i x = decode_u (S 1) x.
let S X i j c d. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_u X j,c,d) 1) x.
rewrite tuple_5_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_u_e_e_1_eq2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, forall x :e X, i x = decode_u (pack_u_u_e_e X i j c d 1) x.
let X i j c d. apply pack_u_u_e_e_1_eq (pack_u_u_e_e X i j c d) X i j c d. reflexivity.
Qed.

Theorem pack_u_u_e_e_2_eq: forall S X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, S = pack_u_u_e_e X i j c d -> forall x :e X, j x = decode_u (S 2) x.
let S X i j c d. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_u X i,encode_u X j,c,d) 2) x.
rewrite tuple_5_2_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_u_u_e_e_2_eq2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, forall x :e X, j x = decode_u (pack_u_u_e_e X i j c d 2) x.
let X i j c d. apply pack_u_u_e_e_2_eq (pack_u_u_e_e X i j c d) X i j c d. reflexivity.
Qed.

Theorem pack_u_u_e_e_3_eq: forall S X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, S = pack_u_u_e_e X i j c d -> c = S 3.
let S X i j c d. assume H1.
rewrite H1. prove c = (X,encode_u X i,encode_u X j,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_u_u_e_e_3_eq2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, c = pack_u_u_e_e X i j c d 3.
let X i j c d. apply pack_u_u_e_e_3_eq (pack_u_u_e_e X i j c d) X i j c d. reflexivity.
Qed.

Theorem pack_u_u_e_e_4_eq: forall S X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, S = pack_u_u_e_e X i j c d -> d = S 4.
let S X i j c d. assume H1.
rewrite H1. prove d = (X,encode_u X i,encode_u X j,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_u_u_e_e_4_eq2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, d = pack_u_u_e_e X i j c d 4.
let X i j c d. apply pack_u_u_e_e_4_eq (pack_u_u_e_e X i j c d) X i j c d. reflexivity.
Qed.

Theorem pack_u_u_e_e_inj : forall X X', forall i i':set -> set, forall j j':set -> set, forall c c':set, forall d d':set, pack_u_u_e_e X i j c d = pack_u_u_e_e X' i' j' c' d' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x) /\ c = c' /\ d = d'.
let X X' i i' j j' c c' d d'. assume H1.
claim L0: X' = pack_u_u_e_e X i j c d 0.
{ exact pack_u_u_e_e_0_eq (pack_u_u_e_e X i j c d) X' i' j' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_u_e_e_0_eq2 X i j c d. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_u_e_e_1_eq2 X i j c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_e_e_1_eq2 X' i' j' c' d' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_u_u_e_e_2_eq2 X i j c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_e_e_2_eq2 X' i' j' c' d' x Lx.
- prove c = c'.
  rewrite pack_u_u_e_e_3_eq2 X i j c d.
  rewrite H1. symmetry.
  exact pack_u_u_e_e_3_eq2 X' i' j' c' d'.
- prove d = d'.
  rewrite pack_u_u_e_e_4_eq2 X i j c d.
  rewrite H1. symmetry.
  exact pack_u_u_e_e_4_eq2 X' i' j' c' d'.
Qed.

Theorem pack_u_u_e_e_ext : forall X, forall i i':set -> set, forall j j':set -> set, forall c, forall d,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 pack_u_u_e_e X i j c d = pack_u_u_e_e X i' j' c d.
let X i i' j j' c d. assume H1. assume H2.
prove (X,encode_u X i,encode_u X j,c,d) = (X,encode_u X i',encode_u X j',c,d).
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X j = encode_u X j'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_u_u_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall c:set, c :e X -> forall d:set, d :e X -> q (pack_u_u_e_e X i j c d)) -> q S.

Theorem pack_struct_u_u_e_e_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall c:set, c :e X -> forall d:set, d :e X -> struct_u_u_e_e (pack_u_u_e_e X i j c d).
let X i. assume Hi. let j. assume Hj. let c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X i Hi j Hj c Hc d Hd.
Qed.

Theorem pack_struct_u_u_e_e_E1: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, struct_u_u_e_e (pack_u_u_e_e X i j c d) -> forall x :e X, i x :e X.
let X i j c d. assume H1. apply H1 (fun z => z = pack_u_u_e_e X i j c d -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_u_u_e_e X' i' j' c' d' = pack_u_u_e_e X i j c d.
  apply pack_u_u_e_e_inj X' X i' i j' j c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_e_e_E2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, struct_u_u_e_e (pack_u_u_e_e X i j c d) -> forall x :e X, j x :e X.
let X i j c d. assume H1. apply H1 (fun z => z = pack_u_u_e_e X i j c d -> forall x :e X, j x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_u_u_e_e X' i' j' c' d' = pack_u_u_e_e X i j c d.
  apply pack_u_u_e_e_inj X' X i' i j' j c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_e_e_E3: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, struct_u_u_e_e (pack_u_u_e_e X i j c d) -> c :e X.
let X i j c d. assume H1. apply H1 (fun z => z = pack_u_u_e_e X i j c d -> c :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_u_u_e_e X' i' j' c' d' = pack_u_u_e_e X i j c d.
  apply pack_u_u_e_e_inj X' X i' i j' j c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_u_u_e_e_E4: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set, struct_u_u_e_e (pack_u_u_e_e X i j c d) -> d :e X.
let X i j c d. assume H1. apply H1 (fun z => z = pack_u_u_e_e X i j c d -> d :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_u_u_e_e X' i' j' c' d' = pack_u_u_e_e X i j c d.
  apply pack_u_u_e_e_inj X' X i' i j' j c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_u_u_e_e_eta: forall S, struct_u_u_e_e S -> S = pack_u_u_e_e (S 0) (decode_u (S 1)) (decode_u (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_u_u_e_e (z 0) (decode_u (z 1)) (decode_u (z 2)) (z 3) (z 4)).
let X. let i. assume _. let j. assume _. let c. assume _. let d. assume _.
prove pack_u_u_e_e X i j c d = pack_u_u_e_e (pack_u_u_e_e X i j c d 0) (decode_u (pack_u_u_e_e X i j c d 1)) (decode_u (pack_u_u_e_e X i j c d 2)) (pack_u_u_e_e X i j c d 3) (pack_u_u_e_e X i j c d 4).
rewrite <- pack_u_u_e_e_0_eq2 X i j c d.
rewrite <- pack_u_u_e_e_3_eq2 X i j c d.
rewrite <- pack_u_u_e_e_4_eq2 X i j c d.
apply pack_u_u_e_e_ext.
- exact pack_u_u_e_e_1_eq2 X i j c d.
- exact pack_u_u_e_e_2_eq2 X i j c d.
Qed.


Definition unpack_u_u_e_e_i : set -> (set -> (set -> set) -> (set -> set) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (S 3) (S 4).

Theorem unpack_u_u_e_e_i_eq : forall Phi:set -> (set -> set) -> (set -> set) -> set -> set -> set,
  forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) -> Phi X i' j' c d = Phi X i j c d)
  ->
  unpack_u_u_e_e_i (pack_u_u_e_e X i j c d) Phi = Phi X i j c d.
let Phi X i j c d.
assume HPhi.
prove Phi (pack_u_u_e_e X i j c d 0) (decode_u (pack_u_u_e_e X i j c d 1)) (decode_u (pack_u_u_e_e X i j c d 2)) (pack_u_u_e_e X i j c d 3) (pack_u_u_e_e X i j c d 4) = Phi X i j c d.
rewrite <- pack_u_u_e_e_0_eq2 X i j c d.
prove Phi X (decode_u (pack_u_u_e_e X i j c d 1)) (decode_u (pack_u_u_e_e X i j c d 2)) (pack_u_u_e_e X i j c d 3) (pack_u_u_e_e X i j c d 4) = Phi X i j c d.
rewrite <- pack_u_u_e_e_3_eq2 X i j c d.
rewrite <- pack_u_u_e_e_4_eq2 X i j c d.
apply HPhi.
- exact pack_u_u_e_e_1_eq2 X i j c d.
- exact pack_u_u_e_e_2_eq2 X i j c d.
Qed.


Definition unpack_u_u_e_e_o : set -> (set -> (set -> set) -> (set -> set) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (S 3) (S 4).

Theorem unpack_u_u_e_e_o_eq : forall Phi:set -> (set -> set) -> (set -> set) -> set -> set -> prop,
  forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall d:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) -> Phi X i' j' c d = Phi X i j c d)
  ->
  unpack_u_u_e_e_o (pack_u_u_e_e X i j c d) Phi = Phi X i j c d.
let Phi X i j c d.
assume HPhi.
prove Phi (pack_u_u_e_e X i j c d 0) (decode_u (pack_u_u_e_e X i j c d 1)) (decode_u (pack_u_u_e_e X i j c d 2)) (pack_u_u_e_e X i j c d 3) (pack_u_u_e_e X i j c d 4) = Phi X i j c d.
rewrite <- pack_u_u_e_e_0_eq2 X i j c d.
prove Phi X (decode_u (pack_u_u_e_e X i j c d 1)) (decode_u (pack_u_u_e_e X i j c d 2)) (pack_u_u_e_e X i j c d 3) (pack_u_u_e_e X i j c d 4) = Phi X i j c d.
rewrite <- pack_u_u_e_e_3_eq2 X i j c d.
rewrite <- pack_u_u_e_e_4_eq2 X i j c d.
apply HPhi.
- exact pack_u_u_e_e_1_eq2 X i j c d.
- exact pack_u_u_e_e_2_eq2 X i j c d.
Qed.


Definition pack_u_r_p_p : set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set := fun X i R P Q => (X,encode_u X i,encode_r X R,encode_p X P,encode_p X Q).

Theorem pack_u_r_p_p_0_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_u_r_p_p X i R P Q -> X = S 0.
let S X i R P Q. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_r X R,encode_p X P,encode_p X Q) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_u_r_p_p_0_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, X = pack_u_r_p_p X i R P Q 0.
let X i R P Q. apply pack_u_r_p_p_0_eq (pack_u_r_p_p X i R P Q) X i R P Q. reflexivity.
Qed.

Theorem pack_u_r_p_p_1_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_u_r_p_p X i R P Q -> forall x :e X, i x = decode_u (S 1) x.
let S X i R P Q. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_r X R,encode_p X P,encode_p X Q) 1) x.
rewrite tuple_5_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_r_p_p_1_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x :e X, i x = decode_u (pack_u_r_p_p X i R P Q 1) x.
let X i R P Q. apply pack_u_r_p_p_1_eq (pack_u_r_p_p X i R P Q) X i R P Q. reflexivity.
Qed.

Theorem pack_u_r_p_p_2_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_u_r_p_p X i R P Q -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X i R P Q. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_u X i,encode_r X R,encode_p X P,encode_p X Q) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_u_r_p_p_2_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x y :e X, R x y = decode_r (pack_u_r_p_p X i R P Q 2) x y.
let X i R P Q. apply pack_u_r_p_p_2_eq (pack_u_r_p_p X i R P Q) X i R P Q. reflexivity.
Qed.

Theorem pack_u_r_p_p_3_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_u_r_p_p X i R P Q -> forall x :e X, P x = decode_p (S 3) x.
let S X i R P Q. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_u X i,encode_r X R,encode_p X P,encode_p X Q) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_u_r_p_p_3_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x :e X, P x = decode_p (pack_u_r_p_p X i R P Q 3) x.
let X i R P Q. apply pack_u_r_p_p_3_eq (pack_u_r_p_p X i R P Q) X i R P Q. reflexivity.
Qed.

Theorem pack_u_r_p_p_4_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_u_r_p_p X i R P Q -> forall x :e X, Q x = decode_p (S 4) x.
let S X i R P Q. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_u X i,encode_r X R,encode_p X P,encode_p X Q) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_u_r_p_p_4_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x :e X, Q x = decode_p (pack_u_r_p_p X i R P Q 4) x.
let X i R P Q. apply pack_u_r_p_p_4_eq (pack_u_r_p_p X i R P Q) X i R P Q. reflexivity.
Qed.

Theorem pack_u_r_p_p_inj : forall X X', forall i i':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, forall Q Q':set -> prop, pack_u_r_p_p X i R P Q = pack_u_r_p_p X' i' R' P' Q' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x).
let X X' i i' R R' P P' Q Q'. assume H1.
claim L0: X' = pack_u_r_p_p X i R P Q 0.
{ exact pack_u_r_p_p_0_eq (pack_u_r_p_p X i R P Q) X' i' R' P' Q' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_r_p_p_0_eq2 X i R P Q. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_r_p_p_1_eq2 X i R P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_r_p_p_1_eq2 X' i' R' P' Q' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_u_r_p_p_2_eq2 X i R P Q x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_r_p_p_2_eq2 X' i' R' P' Q' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_u_r_p_p_3_eq2 X i R P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_r_p_p_3_eq2 X' i' R' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_u_r_p_p_4_eq2 X i R P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_r_p_p_4_eq2 X' i' R' P' Q' x Lx.
Qed.

Theorem pack_u_r_p_p_ext : forall X, forall i i':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, forall Q Q':set -> prop,
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_u_r_p_p X i R P Q = pack_u_r_p_p X i' R' P' Q'.
let X i i' R R' P P' Q Q'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_u X i,encode_r X R,encode_p X P,encode_p X Q) = (X,encode_u X i',encode_r X R',encode_p X P',encode_p X Q').
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_u_r_p_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, q (pack_u_r_p_p X i R P Q)) -> q S.

Theorem pack_struct_u_r_p_p_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, struct_u_r_p_p (pack_u_r_p_p X i R P Q).
let X i. assume Hi. let R P Q q. assume Hq.
exact Hq X i Hi R P Q.
Qed.

Theorem pack_struct_u_r_p_p_E1: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, struct_u_r_p_p (pack_u_r_p_p X i R P Q) -> forall x :e X, i x :e X.
let X i R P Q. assume H1. apply H1 (fun z => z = pack_u_r_p_p X i R P Q -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let R'. let P'. let Q'.
  assume Heq: pack_u_r_p_p X' i' R' P' Q' = pack_u_r_p_p X i R P Q.
  apply pack_u_r_p_p_inj X' X i' i R' R P' P Q' Q Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HR'R HP'P HQ'Q.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_u_r_p_p_eta: forall S, struct_u_r_p_p S -> S = pack_u_r_p_p (S 0) (decode_u (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_u_r_p_p (z 0) (decode_u (z 1)) (decode_r (z 2)) (decode_p (z 3)) (decode_p (z 4))).
let X. let i. assume _. let R. let P. let Q.
prove pack_u_r_p_p X i R P Q = pack_u_r_p_p (pack_u_r_p_p X i R P Q 0) (decode_u (pack_u_r_p_p X i R P Q 1)) (decode_r (pack_u_r_p_p X i R P Q 2)) (decode_p (pack_u_r_p_p X i R P Q 3)) (decode_p (pack_u_r_p_p X i R P Q 4)).
rewrite <- pack_u_r_p_p_0_eq2 X i R P Q.
apply pack_u_r_p_p_ext.
- exact pack_u_r_p_p_1_eq2 X i R P Q.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_r_p_p_2_eq2 X i R P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_u_r_p_p_3_eq2 X i R P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_u_r_p_p_4_eq2 X i R P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_r_p_p_i : set -> (set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_u_r_p_p_i_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set,
  forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X i' R' P' Q' = Phi X i R P Q)
  ->
  unpack_u_r_p_p_i (pack_u_r_p_p X i R P Q) Phi = Phi X i R P Q.
let Phi X i R P Q.
assume HPhi.
prove Phi (pack_u_r_p_p X i R P Q 0) (decode_u (pack_u_r_p_p X i R P Q 1)) (decode_r (pack_u_r_p_p X i R P Q 2)) (decode_p (pack_u_r_p_p X i R P Q 3)) (decode_p (pack_u_r_p_p X i R P Q 4)) = Phi X i R P Q.
rewrite <- pack_u_r_p_p_0_eq2 X i R P Q.
prove Phi X (decode_u (pack_u_r_p_p X i R P Q 1)) (decode_r (pack_u_r_p_p X i R P Q 2)) (decode_p (pack_u_r_p_p X i R P Q 3)) (decode_p (pack_u_r_p_p X i R P Q 4)) = Phi X i R P Q.
apply HPhi.
- exact pack_u_r_p_p_1_eq2 X i R P Q.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r_p_p X i R P Q 2) x y.
  rewrite <- pack_u_r_p_p_2_eq2 X i R P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_r_p_p X i R P Q 3) x.
  rewrite <- pack_u_r_p_p_3_eq2 X i R P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_u_r_p_p X i R P Q 4) x.
  rewrite <- pack_u_r_p_p_4_eq2 X i R P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_r_p_p_o : set -> (set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_u_r_p_p_o_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop,
  forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X i' R' P' Q' = Phi X i R P Q)
  ->
  unpack_u_r_p_p_o (pack_u_r_p_p X i R P Q) Phi = Phi X i R P Q.
let Phi X i R P Q.
assume HPhi.
prove Phi (pack_u_r_p_p X i R P Q 0) (decode_u (pack_u_r_p_p X i R P Q 1)) (decode_r (pack_u_r_p_p X i R P Q 2)) (decode_p (pack_u_r_p_p X i R P Q 3)) (decode_p (pack_u_r_p_p X i R P Q 4)) = Phi X i R P Q.
rewrite <- pack_u_r_p_p_0_eq2 X i R P Q.
prove Phi X (decode_u (pack_u_r_p_p X i R P Q 1)) (decode_r (pack_u_r_p_p X i R P Q 2)) (decode_p (pack_u_r_p_p X i R P Q 3)) (decode_p (pack_u_r_p_p X i R P Q 4)) = Phi X i R P Q.
apply HPhi.
- exact pack_u_r_p_p_1_eq2 X i R P Q.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r_p_p X i R P Q 2) x y.
  rewrite <- pack_u_r_p_p_2_eq2 X i R P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_r_p_p X i R P Q 3) x.
  rewrite <- pack_u_r_p_p_3_eq2 X i R P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_u_r_p_p X i R P Q 4) x.
  rewrite <- pack_u_r_p_p_4_eq2 X i R P Q x Hx.
  apply iff_refl.
Qed.


Definition pack_u_r_p_e : set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> set := fun X i R P c => (X,encode_u X i,encode_r X R,encode_p X P,c).

Theorem pack_u_r_p_e_0_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_u_r_p_e X i R P c -> X = S 0.
let S X i R P c. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_r X R,encode_p X P,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_u_r_p_e_0_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, X = pack_u_r_p_e X i R P c 0.
let X i R P c. apply pack_u_r_p_e_0_eq (pack_u_r_p_e X i R P c) X i R P c. reflexivity.
Qed.

Theorem pack_u_r_p_e_1_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_u_r_p_e X i R P c -> forall x :e X, i x = decode_u (S 1) x.
let S X i R P c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_r X R,encode_p X P,c) 1) x.
rewrite tuple_5_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_r_p_e_1_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall x :e X, i x = decode_u (pack_u_r_p_e X i R P c 1) x.
let X i R P c. apply pack_u_r_p_e_1_eq (pack_u_r_p_e X i R P c) X i R P c. reflexivity.
Qed.

Theorem pack_u_r_p_e_2_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_u_r_p_e X i R P c -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X i R P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_u X i,encode_r X R,encode_p X P,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_u_r_p_e_2_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_u_r_p_e X i R P c 2) x y.
let X i R P c. apply pack_u_r_p_e_2_eq (pack_u_r_p_e X i R P c) X i R P c. reflexivity.
Qed.

Theorem pack_u_r_p_e_3_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_u_r_p_e X i R P c -> forall x :e X, P x = decode_p (S 3) x.
let S X i R P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_u X i,encode_r X R,encode_p X P,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_u_r_p_e_3_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_u_r_p_e X i R P c 3) x.
let X i R P c. apply pack_u_r_p_e_3_eq (pack_u_r_p_e X i R P c) X i R P c. reflexivity.
Qed.

Theorem pack_u_r_p_e_4_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_u_r_p_e X i R P c -> c = S 4.
let S X i R P c. assume H1.
rewrite H1. prove c = (X,encode_u X i,encode_r X R,encode_p X P,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_u_r_p_e_4_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c = pack_u_r_p_e X i R P c 4.
let X i R P c. apply pack_u_r_p_e_4_eq (pack_u_r_p_e X i R P c) X i R P c. reflexivity.
Qed.

Theorem pack_u_r_p_e_inj : forall X X', forall i i':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, forall c c':set, pack_u_r_p_e X i R P c = pack_u_r_p_e X' i' R' P' c' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' i i' R R' P P' c c'. assume H1.
claim L0: X' = pack_u_r_p_e X i R P c 0.
{ exact pack_u_r_p_e_0_eq (pack_u_r_p_e X i R P c) X' i' R' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_r_p_e_0_eq2 X i R P c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_r_p_e_1_eq2 X i R P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_r_p_e_1_eq2 X' i' R' P' c' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_u_r_p_e_2_eq2 X i R P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_r_p_e_2_eq2 X' i' R' P' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_u_r_p_e_3_eq2 X i R P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_r_p_e_3_eq2 X' i' R' P' c' x Lx.
- prove c = c'.
  rewrite pack_u_r_p_e_4_eq2 X i R P c.
  rewrite H1. symmetry.
  exact pack_u_r_p_e_4_eq2 X' i' R' P' c'.
Qed.

Theorem pack_u_r_p_e_ext : forall X, forall i i':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, forall c,
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_u_r_p_e X i R P c = pack_u_r_p_e X i' R' P' c.
let X i i' R R' P P' c. assume H1. assume H2. assume H3.
prove (X,encode_u X i,encode_r X R,encode_p X P,c) = (X,encode_u X i',encode_r X R',encode_p X P',c).
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_u_r_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> q (pack_u_r_p_e X i R P c)) -> q S.

Theorem pack_struct_u_r_p_e_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> struct_u_r_p_e (pack_u_r_p_e X i R P c).
let X i. assume Hi. let R P c. assume Hc. let q. assume Hq.
exact Hq X i Hi R P c Hc.
Qed.

Theorem pack_struct_u_r_p_e_E1: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, struct_u_r_p_e (pack_u_r_p_e X i R P c) -> forall x :e X, i x :e X.
let X i R P c. assume H1. apply H1 (fun z => z = pack_u_r_p_e X i R P c -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let R'. let P'. let c'. assume Hc'.
  assume Heq: pack_u_r_p_e X' i' R' P' c' = pack_u_r_p_e X i R P c.
  apply pack_u_r_p_e_inj X' X i' i R' R P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HR'R HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_r_p_e_E4: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, struct_u_r_p_e (pack_u_r_p_e X i R P c) -> c :e X.
let X i R P c. assume H1. apply H1 (fun z => z = pack_u_r_p_e X i R P c -> c :e X).
- let X'. let i'. assume Hi'. let R'. let P'. let c'. assume Hc'.
  assume Heq: pack_u_r_p_e X' i' R' P' c' = pack_u_r_p_e X i R P c.
  apply pack_u_r_p_e_inj X' X i' i R' R P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HR'R HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_u_r_p_e_eta: forall S, struct_u_r_p_e S -> S = pack_u_r_p_e (S 0) (decode_u (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_u_r_p_e (z 0) (decode_u (z 1)) (decode_r (z 2)) (decode_p (z 3)) (z 4)).
let X. let i. assume _. let R. let P. let c. assume _.
prove pack_u_r_p_e X i R P c = pack_u_r_p_e (pack_u_r_p_e X i R P c 0) (decode_u (pack_u_r_p_e X i R P c 1)) (decode_r (pack_u_r_p_e X i R P c 2)) (decode_p (pack_u_r_p_e X i R P c 3)) (pack_u_r_p_e X i R P c 4).
rewrite <- pack_u_r_p_e_0_eq2 X i R P c.
rewrite <- pack_u_r_p_e_4_eq2 X i R P c.
apply pack_u_r_p_e_ext.
- exact pack_u_r_p_e_1_eq2 X i R P c.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_r_p_e_2_eq2 X i R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_u_r_p_e_3_eq2 X i R P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_r_p_e_i : set -> (set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_u_r_p_e_i_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> set,
  forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' R' P' c = Phi X i R P c)
  ->
  unpack_u_r_p_e_i (pack_u_r_p_e X i R P c) Phi = Phi X i R P c.
let Phi X i R P c.
assume HPhi.
prove Phi (pack_u_r_p_e X i R P c 0) (decode_u (pack_u_r_p_e X i R P c 1)) (decode_r (pack_u_r_p_e X i R P c 2)) (decode_p (pack_u_r_p_e X i R P c 3)) (pack_u_r_p_e X i R P c 4) = Phi X i R P c.
rewrite <- pack_u_r_p_e_0_eq2 X i R P c.
prove Phi X (decode_u (pack_u_r_p_e X i R P c 1)) (decode_r (pack_u_r_p_e X i R P c 2)) (decode_p (pack_u_r_p_e X i R P c 3)) (pack_u_r_p_e X i R P c 4) = Phi X i R P c.
rewrite <- pack_u_r_p_e_4_eq2 X i R P c.
apply HPhi.
- exact pack_u_r_p_e_1_eq2 X i R P c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r_p_e X i R P c 2) x y.
  rewrite <- pack_u_r_p_e_2_eq2 X i R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_r_p_e X i R P c 3) x.
  rewrite <- pack_u_r_p_e_3_eq2 X i R P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_r_p_e_o : set -> (set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_u_r_p_e_o_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set -> prop,
  forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' R' P' c = Phi X i R P c)
  ->
  unpack_u_r_p_e_o (pack_u_r_p_e X i R P c) Phi = Phi X i R P c.
let Phi X i R P c.
assume HPhi.
prove Phi (pack_u_r_p_e X i R P c 0) (decode_u (pack_u_r_p_e X i R P c 1)) (decode_r (pack_u_r_p_e X i R P c 2)) (decode_p (pack_u_r_p_e X i R P c 3)) (pack_u_r_p_e X i R P c 4) = Phi X i R P c.
rewrite <- pack_u_r_p_e_0_eq2 X i R P c.
prove Phi X (decode_u (pack_u_r_p_e X i R P c 1)) (decode_r (pack_u_r_p_e X i R P c 2)) (decode_p (pack_u_r_p_e X i R P c 3)) (pack_u_r_p_e X i R P c 4) = Phi X i R P c.
rewrite <- pack_u_r_p_e_4_eq2 X i R P c.
apply HPhi.
- exact pack_u_r_p_e_1_eq2 X i R P c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r_p_e X i R P c 2) x y.
  rewrite <- pack_u_r_p_e_2_eq2 X i R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_r_p_e X i R P c 3) x.
  rewrite <- pack_u_r_p_e_3_eq2 X i R P c x Hx.
  apply iff_refl.
Qed.


Definition pack_u_r_e_e : set -> (set -> set) -> (set -> set -> prop) -> set -> set -> set := fun X i R c d => (X,encode_u X i,encode_r X R,c,d).

Theorem pack_u_r_e_e_0_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_u_r_e_e X i R c d -> X = S 0.
let S X i R c d. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_r X R,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_u_r_e_e_0_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, X = pack_u_r_e_e X i R c d 0.
let X i R c d. apply pack_u_r_e_e_0_eq (pack_u_r_e_e X i R c d) X i R c d. reflexivity.
Qed.

Theorem pack_u_r_e_e_1_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_u_r_e_e X i R c d -> forall x :e X, i x = decode_u (S 1) x.
let S X i R c d. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_r X R,c,d) 1) x.
rewrite tuple_5_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_r_e_e_1_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, forall x :e X, i x = decode_u (pack_u_r_e_e X i R c d 1) x.
let X i R c d. apply pack_u_r_e_e_1_eq (pack_u_r_e_e X i R c d) X i R c d. reflexivity.
Qed.

Theorem pack_u_r_e_e_2_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_u_r_e_e X i R c d -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X i R c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_u X i,encode_r X R,c,d) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_u_r_e_e_2_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, forall x y :e X, R x y = decode_r (pack_u_r_e_e X i R c d 2) x y.
let X i R c d. apply pack_u_r_e_e_2_eq (pack_u_r_e_e X i R c d) X i R c d. reflexivity.
Qed.

Theorem pack_u_r_e_e_3_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_u_r_e_e X i R c d -> c = S 3.
let S X i R c d. assume H1.
rewrite H1. prove c = (X,encode_u X i,encode_r X R,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_u_r_e_e_3_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, c = pack_u_r_e_e X i R c d 3.
let X i R c d. apply pack_u_r_e_e_3_eq (pack_u_r_e_e X i R c d) X i R c d. reflexivity.
Qed.

Theorem pack_u_r_e_e_4_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, S = pack_u_r_e_e X i R c d -> d = S 4.
let S X i R c d. assume H1.
rewrite H1. prove d = (X,encode_u X i,encode_r X R,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_u_r_e_e_4_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, d = pack_u_r_e_e X i R c d 4.
let X i R c d. apply pack_u_r_e_e_4_eq (pack_u_r_e_e X i R c d) X i R c d. reflexivity.
Qed.

Theorem pack_u_r_e_e_inj : forall X X', forall i i':set -> set, forall R R':set -> set -> prop, forall c c':set, forall d d':set, pack_u_r_e_e X i R c d = pack_u_r_e_e X' i' R' c' d' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ c = c' /\ d = d'.
let X X' i i' R R' c c' d d'. assume H1.
claim L0: X' = pack_u_r_e_e X i R c d 0.
{ exact pack_u_r_e_e_0_eq (pack_u_r_e_e X i R c d) X' i' R' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_r_e_e_0_eq2 X i R c d. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_r_e_e_1_eq2 X i R c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_r_e_e_1_eq2 X' i' R' c' d' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_u_r_e_e_2_eq2 X i R c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_r_e_e_2_eq2 X' i' R' c' d' x Lx y Ly.
- prove c = c'.
  rewrite pack_u_r_e_e_3_eq2 X i R c d.
  rewrite H1. symmetry.
  exact pack_u_r_e_e_3_eq2 X' i' R' c' d'.
- prove d = d'.
  rewrite pack_u_r_e_e_4_eq2 X i R c d.
  rewrite H1. symmetry.
  exact pack_u_r_e_e_4_eq2 X' i' R' c' d'.
Qed.

Theorem pack_u_r_e_e_ext : forall X, forall i i':set -> set, forall R R':set -> set -> prop, forall c, forall d,
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_u_r_e_e X i R c d = pack_u_r_e_e X i' R' c d.
let X i i' R R' c d. assume H1. assume H2.
prove (X,encode_u X i,encode_r X R,c,d) = (X,encode_u X i',encode_r X R',c,d).
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_u_r_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> q (pack_u_r_e_e X i R c d)) -> q S.

Theorem pack_struct_u_r_e_e_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> struct_u_r_e_e (pack_u_r_e_e X i R c d).
let X i. assume Hi. let R c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X i Hi R c Hc d Hd.
Qed.

Theorem pack_struct_u_r_e_e_E1: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, struct_u_r_e_e (pack_u_r_e_e X i R c d) -> forall x :e X, i x :e X.
let X i R c d. assume H1. apply H1 (fun z => z = pack_u_r_e_e X i R c d -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let R'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_u_r_e_e X' i' R' c' d' = pack_u_r_e_e X i R c d.
  apply pack_u_r_e_e_inj X' X i' i R' R c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HR'R Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_r_e_e_E3: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, struct_u_r_e_e (pack_u_r_e_e X i R c d) -> c :e X.
let X i R c d. assume H1. apply H1 (fun z => z = pack_u_r_e_e X i R c d -> c :e X).
- let X'. let i'. assume Hi'. let R'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_u_r_e_e X' i' R' c' d' = pack_u_r_e_e X i R c d.
  apply pack_u_r_e_e_inj X' X i' i R' R c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HR'R Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_u_r_e_e_E4: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set, struct_u_r_e_e (pack_u_r_e_e X i R c d) -> d :e X.
let X i R c d. assume H1. apply H1 (fun z => z = pack_u_r_e_e X i R c d -> d :e X).
- let X'. let i'. assume Hi'. let R'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_u_r_e_e X' i' R' c' d' = pack_u_r_e_e X i R c d.
  apply pack_u_r_e_e_inj X' X i' i R' R c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HR'R Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_u_r_e_e_eta: forall S, struct_u_r_e_e S -> S = pack_u_r_e_e (S 0) (decode_u (S 1)) (decode_r (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_u_r_e_e (z 0) (decode_u (z 1)) (decode_r (z 2)) (z 3) (z 4)).
let X. let i. assume _. let R. let c. assume _. let d. assume _.
prove pack_u_r_e_e X i R c d = pack_u_r_e_e (pack_u_r_e_e X i R c d 0) (decode_u (pack_u_r_e_e X i R c d 1)) (decode_r (pack_u_r_e_e X i R c d 2)) (pack_u_r_e_e X i R c d 3) (pack_u_r_e_e X i R c d 4).
rewrite <- pack_u_r_e_e_0_eq2 X i R c d.
rewrite <- pack_u_r_e_e_3_eq2 X i R c d.
rewrite <- pack_u_r_e_e_4_eq2 X i R c d.
apply pack_u_r_e_e_ext.
- exact pack_u_r_e_e_1_eq2 X i R c d.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_r_e_e_2_eq2 X i R c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_r_e_e_i : set -> (set -> (set -> set) -> (set -> set -> prop) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)) (S 3) (S 4).

Theorem unpack_u_r_e_e_i_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> set -> set -> set,
  forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X i' R' c d = Phi X i R c d)
  ->
  unpack_u_r_e_e_i (pack_u_r_e_e X i R c d) Phi = Phi X i R c d.
let Phi X i R c d.
assume HPhi.
prove Phi (pack_u_r_e_e X i R c d 0) (decode_u (pack_u_r_e_e X i R c d 1)) (decode_r (pack_u_r_e_e X i R c d 2)) (pack_u_r_e_e X i R c d 3) (pack_u_r_e_e X i R c d 4) = Phi X i R c d.
rewrite <- pack_u_r_e_e_0_eq2 X i R c d.
prove Phi X (decode_u (pack_u_r_e_e X i R c d 1)) (decode_r (pack_u_r_e_e X i R c d 2)) (pack_u_r_e_e X i R c d 3) (pack_u_r_e_e X i R c d 4) = Phi X i R c d.
rewrite <- pack_u_r_e_e_3_eq2 X i R c d.
rewrite <- pack_u_r_e_e_4_eq2 X i R c d.
apply HPhi.
- exact pack_u_r_e_e_1_eq2 X i R c d.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r_e_e X i R c d 2) x y.
  rewrite <- pack_u_r_e_e_2_eq2 X i R c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_r_e_e_o : set -> (set -> (set -> set) -> (set -> set -> prop) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)) (S 3) (S 4).

Theorem unpack_u_r_e_e_o_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> set -> set -> prop,
  forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall d:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X i' R' c d = Phi X i R c d)
  ->
  unpack_u_r_e_e_o (pack_u_r_e_e X i R c d) Phi = Phi X i R c d.
let Phi X i R c d.
assume HPhi.
prove Phi (pack_u_r_e_e X i R c d 0) (decode_u (pack_u_r_e_e X i R c d 1)) (decode_r (pack_u_r_e_e X i R c d 2)) (pack_u_r_e_e X i R c d 3) (pack_u_r_e_e X i R c d 4) = Phi X i R c d.
rewrite <- pack_u_r_e_e_0_eq2 X i R c d.
prove Phi X (decode_u (pack_u_r_e_e X i R c d 1)) (decode_r (pack_u_r_e_e X i R c d 2)) (pack_u_r_e_e X i R c d 3) (pack_u_r_e_e X i R c d 4) = Phi X i R c d.
rewrite <- pack_u_r_e_e_3_eq2 X i R c d.
rewrite <- pack_u_r_e_e_4_eq2 X i R c d.
apply HPhi.
- exact pack_u_r_e_e_1_eq2 X i R c d.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r_e_e X i R c d 2) x y.
  rewrite <- pack_u_r_e_e_2_eq2 X i R c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_u_p_e_e : set -> (set -> set) -> (set -> prop) -> set -> set -> set := fun X i P c d => (X,encode_u X i,encode_p X P,c,d).

Theorem pack_u_p_e_e_0_eq: forall S X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, S = pack_u_p_e_e X i P c d -> X = S 0.
let S X i P c d. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_p X P,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_u_p_e_e_0_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, X = pack_u_p_e_e X i P c d 0.
let X i P c d. apply pack_u_p_e_e_0_eq (pack_u_p_e_e X i P c d) X i P c d. reflexivity.
Qed.

Theorem pack_u_p_e_e_1_eq: forall S X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, S = pack_u_p_e_e X i P c d -> forall x :e X, i x = decode_u (S 1) x.
let S X i P c d. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_p X P,c,d) 1) x.
rewrite tuple_5_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_p_e_e_1_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, forall x :e X, i x = decode_u (pack_u_p_e_e X i P c d 1) x.
let X i P c d. apply pack_u_p_e_e_1_eq (pack_u_p_e_e X i P c d) X i P c d. reflexivity.
Qed.

Theorem pack_u_p_e_e_2_eq: forall S X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, S = pack_u_p_e_e X i P c d -> forall x :e X, P x = decode_p (S 2) x.
let S X i P c d. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_u X i,encode_p X P,c,d) 2) x.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_u_p_e_e_2_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, forall x :e X, P x = decode_p (pack_u_p_e_e X i P c d 2) x.
let X i P c d. apply pack_u_p_e_e_2_eq (pack_u_p_e_e X i P c d) X i P c d. reflexivity.
Qed.

Theorem pack_u_p_e_e_3_eq: forall S X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, S = pack_u_p_e_e X i P c d -> c = S 3.
let S X i P c d. assume H1.
rewrite H1. prove c = (X,encode_u X i,encode_p X P,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_u_p_e_e_3_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, c = pack_u_p_e_e X i P c d 3.
let X i P c d. apply pack_u_p_e_e_3_eq (pack_u_p_e_e X i P c d) X i P c d. reflexivity.
Qed.

Theorem pack_u_p_e_e_4_eq: forall S X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, S = pack_u_p_e_e X i P c d -> d = S 4.
let S X i P c d. assume H1.
rewrite H1. prove d = (X,encode_u X i,encode_p X P,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_u_p_e_e_4_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, d = pack_u_p_e_e X i P c d 4.
let X i P c d. apply pack_u_p_e_e_4_eq (pack_u_p_e_e X i P c d) X i P c d. reflexivity.
Qed.

Theorem pack_u_p_e_e_inj : forall X X', forall i i':set -> set, forall P P':set -> prop, forall c c':set, forall d d':set, pack_u_p_e_e X i P c d = pack_u_p_e_e X' i' P' c' d' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x) /\ c = c' /\ d = d'.
let X X' i i' P P' c c' d d'. assume H1.
claim L0: X' = pack_u_p_e_e X i P c d 0.
{ exact pack_u_p_e_e_0_eq (pack_u_p_e_e X i P c d) X' i' P' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_p_e_e_0_eq2 X i P c d. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_p_e_e_1_eq2 X i P c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_p_e_e_1_eq2 X' i' P' c' d' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_u_p_e_e_2_eq2 X i P c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_p_e_e_2_eq2 X' i' P' c' d' x Lx.
- prove c = c'.
  rewrite pack_u_p_e_e_3_eq2 X i P c d.
  rewrite H1. symmetry.
  exact pack_u_p_e_e_3_eq2 X' i' P' c' d'.
- prove d = d'.
  rewrite pack_u_p_e_e_4_eq2 X i P c d.
  rewrite H1. symmetry.
  exact pack_u_p_e_e_4_eq2 X' i' P' c' d'.
Qed.

Theorem pack_u_p_e_e_ext : forall X, forall i i':set -> set, forall P P':set -> prop, forall c, forall d,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_u_p_e_e X i P c d = pack_u_p_e_e X i' P' c d.
let X i i' P P' c d. assume H1. assume H2.
prove (X,encode_u X i,encode_p X P,c,d) = (X,encode_u X i',encode_p X P',c,d).
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_u_p_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> q (pack_u_p_e_e X i P c d)) -> q S.

Theorem pack_struct_u_p_e_e_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> struct_u_p_e_e (pack_u_p_e_e X i P c d).
let X i. assume Hi. let P c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X i Hi P c Hc d Hd.
Qed.

Theorem pack_struct_u_p_e_e_E1: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, struct_u_p_e_e (pack_u_p_e_e X i P c d) -> forall x :e X, i x :e X.
let X i P c d. assume H1. apply H1 (fun z => z = pack_u_p_e_e X i P c d -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let P'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_u_p_e_e X' i' P' c' d' = pack_u_p_e_e X i P c d.
  apply pack_u_p_e_e_inj X' X i' i P' P c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HP'P Hc'c Hd'd.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_p_e_e_E3: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, struct_u_p_e_e (pack_u_p_e_e X i P c d) -> c :e X.
let X i P c d. assume H1. apply H1 (fun z => z = pack_u_p_e_e X i P c d -> c :e X).
- let X'. let i'. assume Hi'. let P'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_u_p_e_e X' i' P' c' d' = pack_u_p_e_e X i P c d.
  apply pack_u_p_e_e_inj X' X i' i P' P c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HP'P Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_u_p_e_e_E4: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set, struct_u_p_e_e (pack_u_p_e_e X i P c d) -> d :e X.
let X i P c d. assume H1. apply H1 (fun z => z = pack_u_p_e_e X i P c d -> d :e X).
- let X'. let i'. assume Hi'. let P'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_u_p_e_e X' i' P' c' d' = pack_u_p_e_e X i P c d.
  apply pack_u_p_e_e_inj X' X i' i P' P c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HP'P Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_u_p_e_e_eta: forall S, struct_u_p_e_e S -> S = pack_u_p_e_e (S 0) (decode_u (S 1)) (decode_p (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_u_p_e_e (z 0) (decode_u (z 1)) (decode_p (z 2)) (z 3) (z 4)).
let X. let i. assume _. let P. let c. assume _. let d. assume _.
prove pack_u_p_e_e X i P c d = pack_u_p_e_e (pack_u_p_e_e X i P c d 0) (decode_u (pack_u_p_e_e X i P c d 1)) (decode_p (pack_u_p_e_e X i P c d 2)) (pack_u_p_e_e X i P c d 3) (pack_u_p_e_e X i P c d 4).
rewrite <- pack_u_p_e_e_0_eq2 X i P c d.
rewrite <- pack_u_p_e_e_3_eq2 X i P c d.
rewrite <- pack_u_p_e_e_4_eq2 X i P c d.
apply pack_u_p_e_e_ext.
- exact pack_u_p_e_e_1_eq2 X i P c d.
- let x. assume Hx.
  rewrite <- pack_u_p_e_e_2_eq2 X i P c d x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_p_e_e_i : set -> (set -> (set -> set) -> (set -> prop) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_p (S 2)) (S 3) (S 4).

Theorem unpack_u_p_e_e_i_eq : forall Phi:set -> (set -> set) -> (set -> prop) -> set -> set -> set,
  forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' P' c d = Phi X i P c d)
  ->
  unpack_u_p_e_e_i (pack_u_p_e_e X i P c d) Phi = Phi X i P c d.
let Phi X i P c d.
assume HPhi.
prove Phi (pack_u_p_e_e X i P c d 0) (decode_u (pack_u_p_e_e X i P c d 1)) (decode_p (pack_u_p_e_e X i P c d 2)) (pack_u_p_e_e X i P c d 3) (pack_u_p_e_e X i P c d 4) = Phi X i P c d.
rewrite <- pack_u_p_e_e_0_eq2 X i P c d.
prove Phi X (decode_u (pack_u_p_e_e X i P c d 1)) (decode_p (pack_u_p_e_e X i P c d 2)) (pack_u_p_e_e X i P c d 3) (pack_u_p_e_e X i P c d 4) = Phi X i P c d.
rewrite <- pack_u_p_e_e_3_eq2 X i P c d.
rewrite <- pack_u_p_e_e_4_eq2 X i P c d.
apply HPhi.
- exact pack_u_p_e_e_1_eq2 X i P c d.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_p_e_e X i P c d 2) x.
  rewrite <- pack_u_p_e_e_2_eq2 X i P c d x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_p_e_e_o : set -> (set -> (set -> set) -> (set -> prop) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_p (S 2)) (S 3) (S 4).

Theorem unpack_u_p_e_e_o_eq : forall Phi:set -> (set -> set) -> (set -> prop) -> set -> set -> prop,
  forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall d:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' P' c d = Phi X i P c d)
  ->
  unpack_u_p_e_e_o (pack_u_p_e_e X i P c d) Phi = Phi X i P c d.
let Phi X i P c d.
assume HPhi.
prove Phi (pack_u_p_e_e X i P c d 0) (decode_u (pack_u_p_e_e X i P c d 1)) (decode_p (pack_u_p_e_e X i P c d 2)) (pack_u_p_e_e X i P c d 3) (pack_u_p_e_e X i P c d 4) = Phi X i P c d.
rewrite <- pack_u_p_e_e_0_eq2 X i P c d.
prove Phi X (decode_u (pack_u_p_e_e X i P c d 1)) (decode_p (pack_u_p_e_e X i P c d 2)) (pack_u_p_e_e X i P c d 3) (pack_u_p_e_e X i P c d 4) = Phi X i P c d.
rewrite <- pack_u_p_e_e_3_eq2 X i P c d.
rewrite <- pack_u_p_e_e_4_eq2 X i P c d.
apply HPhi.
- exact pack_u_p_e_e_1_eq2 X i P c d.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_p_e_e X i P c d 2) x.
  rewrite <- pack_u_p_e_e_2_eq2 X i P c d x Hx.
  apply iff_refl.
Qed.


Definition pack_r_r_p_p : set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set := fun X R T P Q => (X,encode_r X R,encode_r X T,encode_p X P,encode_p X Q).

Theorem pack_r_r_p_p_0_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_r_r_p_p X R T P Q -> X = S 0.
let S X R T P Q. assume H1. rewrite H1.
prove X = (X,encode_r X R,encode_r X T,encode_p X P,encode_p X Q) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_r_r_p_p_0_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, X = pack_r_r_p_p X R T P Q 0.
let X R T P Q. apply pack_r_r_p_p_0_eq (pack_r_r_p_p X R T P Q) X R T P Q. reflexivity.
Qed.

Theorem pack_r_r_p_p_1_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_r_r_p_p X R T P Q -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R T P Q. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_r X R,encode_r X T,encode_p X P,encode_p X Q) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_r_p_p_1_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x y :e X, R x y = decode_r (pack_r_r_p_p X R T P Q 1) x y.
let X R T P Q. apply pack_r_r_p_p_1_eq (pack_r_r_p_p X R T P Q) X R T P Q. reflexivity.
Qed.

Theorem pack_r_r_p_p_2_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_r_r_p_p X R T P Q -> forall x y :e X, T x y = decode_r (S 2) x y.
let S X R T P Q. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_r X R,encode_r X T,encode_p X P,encode_p X Q) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_r_r_p_p_2_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x y :e X, T x y = decode_r (pack_r_r_p_p X R T P Q 2) x y.
let X R T P Q. apply pack_r_r_p_p_2_eq (pack_r_r_p_p X R T P Q) X R T P Q. reflexivity.
Qed.

Theorem pack_r_r_p_p_3_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_r_r_p_p X R T P Q -> forall x :e X, P x = decode_p (S 3) x.
let S X R T P Q. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_r X R,encode_r X T,encode_p X P,encode_p X Q) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_r_r_p_p_3_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x :e X, P x = decode_p (pack_r_r_p_p X R T P Q 3) x.
let X R T P Q. apply pack_r_r_p_p_3_eq (pack_r_r_p_p X R T P Q) X R T P Q. reflexivity.
Qed.

Theorem pack_r_r_p_p_4_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, S = pack_r_r_p_p X R T P Q -> forall x :e X, Q x = decode_p (S 4) x.
let S X R T P Q. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_r X R,encode_r X T,encode_p X P,encode_p X Q) 4) x.
rewrite tuple_5_4_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_r_r_p_p_4_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, forall x :e X, Q x = decode_p (pack_r_r_p_p X R T P Q 4) x.
let X R T P Q. apply pack_r_r_p_p_4_eq (pack_r_r_p_p X R T P Q) X R T P Q. reflexivity.
Qed.

Theorem pack_r_r_p_p_inj : forall X X', forall R R':set -> set -> prop, forall T T':set -> set -> prop, forall P P':set -> prop, forall Q Q':set -> prop, pack_r_r_p_p X R T P Q = pack_r_r_p_p X' R' T' P' Q' -> X = X' /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y) /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x).
let X X' R R' T T' P P' Q Q'. assume H1.
claim L0: X' = pack_r_r_p_p X R T P Q 0.
{ exact pack_r_r_p_p_0_eq (pack_r_r_p_p X R T P Q) X' R' T' P' Q' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_r_p_p_0_eq2 X R T P Q. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_r_r_p_p_1_eq2 X R T P Q x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_p_p_1_eq2 X' R' T' P' Q' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_r_r_p_p_2_eq2 X R T P Q x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_p_p_2_eq2 X' R' T' P' Q' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_r_r_p_p_3_eq2 X R T P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_r_r_p_p_3_eq2 X' R' T' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_r_r_p_p_4_eq2 X R T P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_r_r_p_p_4_eq2 X' R' T' P' Q' x Lx.
Qed.

Theorem pack_r_r_p_p_ext : forall X, forall R R':set -> set -> prop, forall T T':set -> set -> prop, forall P P':set -> prop, forall Q Q':set -> prop,
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_r_r_p_p X R T P Q = pack_r_r_p_p X R' T' P' Q'.
let X R R' T T' P P' Q Q'. assume H1. assume H2. assume H3. assume H4.
prove (X,encode_r X R,encode_r X T,encode_p X P,encode_p X Q) = (X,encode_r X R',encode_r X T',encode_p X P',encode_p X Q').
claim L1: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X T = encode_r X T'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
claim L4: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H4. }
rewrite <- L4.
reflexivity.
Qed.

Definition struct_r_r_p_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, q (pack_r_r_p_p X R T P Q)) -> q S.

Theorem pack_struct_r_r_p_p_I: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop, struct_r_r_p_p (pack_r_r_p_p X R T P Q).
let X R T P Q q. assume Hq.
exact Hq X R T P Q.
Qed.

Theorem struct_r_r_p_p_eta: forall S, struct_r_r_p_p S -> S = pack_r_r_p_p (S 0) (decode_r (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).
let S. assume H1. apply H1 (fun z => z = pack_r_r_p_p (z 0) (decode_r (z 1)) (decode_r (z 2)) (decode_p (z 3)) (decode_p (z 4))).
let X. let R. let T. let P. let Q.
prove pack_r_r_p_p X R T P Q = pack_r_r_p_p (pack_r_r_p_p X R T P Q 0) (decode_r (pack_r_r_p_p X R T P Q 1)) (decode_r (pack_r_r_p_p X R T P Q 2)) (decode_p (pack_r_r_p_p X R T P Q 3)) (decode_p (pack_r_r_p_p X R T P Q 4)).
rewrite <- pack_r_r_p_p_0_eq2 X R T P Q.
apply pack_r_r_p_p_ext.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_p_p_1_eq2 X R T P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_p_p_2_eq2 X R T P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_r_r_p_p_3_eq2 X R T P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_r_r_p_p_4_eq2 X R T P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_r_p_p_i : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_r_r_p_p_i_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> set,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X R' T' P' Q' = Phi X R T P Q)
  ->
  unpack_r_r_p_p_i (pack_r_r_p_p X R T P Q) Phi = Phi X R T P Q.
let Phi X R T P Q.
assume HPhi.
prove Phi (pack_r_r_p_p X R T P Q 0) (decode_r (pack_r_r_p_p X R T P Q 1)) (decode_r (pack_r_r_p_p X R T P Q 2)) (decode_p (pack_r_r_p_p X R T P Q 3)) (decode_p (pack_r_r_p_p X R T P Q 4)) = Phi X R T P Q.
rewrite <- pack_r_r_p_p_0_eq2 X R T P Q.
prove Phi X (decode_r (pack_r_r_p_p X R T P Q 1)) (decode_r (pack_r_r_p_p X R T P Q 2)) (decode_p (pack_r_r_p_p X R T P Q 3)) (decode_p (pack_r_r_p_p X R T P Q 4)) = Phi X R T P Q.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r_p_p X R T P Q 1) x y.
  rewrite <- pack_r_r_p_p_1_eq2 X R T P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r_p_p X R T P Q 2) x y.
  rewrite <- pack_r_r_p_p_2_eq2 X R T P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_r_p_p X R T P Q 3) x.
  rewrite <- pack_r_r_p_p_3_eq2 X R T P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_r_r_p_p X R T P Q 4) x.
  rewrite <- pack_r_r_p_p_4_eq2 X R T P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_r_p_p_o : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)) (decode_p (S 3)) (decode_p (S 4)).

Theorem unpack_r_r_p_p_o_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> (set -> prop) -> prop,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall Q:set -> prop,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X R' T' P' Q' = Phi X R T P Q)
  ->
  unpack_r_r_p_p_o (pack_r_r_p_p X R T P Q) Phi = Phi X R T P Q.
let Phi X R T P Q.
assume HPhi.
prove Phi (pack_r_r_p_p X R T P Q 0) (decode_r (pack_r_r_p_p X R T P Q 1)) (decode_r (pack_r_r_p_p X R T P Q 2)) (decode_p (pack_r_r_p_p X R T P Q 3)) (decode_p (pack_r_r_p_p X R T P Q 4)) = Phi X R T P Q.
rewrite <- pack_r_r_p_p_0_eq2 X R T P Q.
prove Phi X (decode_r (pack_r_r_p_p X R T P Q 1)) (decode_r (pack_r_r_p_p X R T P Q 2)) (decode_p (pack_r_r_p_p X R T P Q 3)) (decode_p (pack_r_r_p_p X R T P Q 4)) = Phi X R T P Q.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r_p_p X R T P Q 1) x y.
  rewrite <- pack_r_r_p_p_1_eq2 X R T P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r_p_p X R T P Q 2) x y.
  rewrite <- pack_r_r_p_p_2_eq2 X R T P Q x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_r_p_p X R T P Q 3) x.
  rewrite <- pack_r_r_p_p_3_eq2 X R T P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_r_r_p_p X R T P Q 4) x.
  rewrite <- pack_r_r_p_p_4_eq2 X R T P Q x Hx.
  apply iff_refl.
Qed.


Definition pack_r_r_p_e : set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> set -> set := fun X R T P c => (X,encode_r X R,encode_r X T,encode_p X P,c).

Theorem pack_r_r_p_e_0_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_r_r_p_e X R T P c -> X = S 0.
let S X R T P c. assume H1. rewrite H1.
prove X = (X,encode_r X R,encode_r X T,encode_p X P,c) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_r_r_p_e_0_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, X = pack_r_r_p_e X R T P c 0.
let X R T P c. apply pack_r_r_p_e_0_eq (pack_r_r_p_e X R T P c) X R T P c. reflexivity.
Qed.

Theorem pack_r_r_p_e_1_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_r_r_p_e X R T P c -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R T P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_r X R,encode_r X T,encode_p X P,c) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_r_p_e_1_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_r_r_p_e X R T P c 1) x y.
let X R T P c. apply pack_r_r_p_e_1_eq (pack_r_r_p_e X R T P c) X R T P c. reflexivity.
Qed.

Theorem pack_r_r_p_e_2_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_r_r_p_e X R T P c -> forall x y :e X, T x y = decode_r (S 2) x y.
let S X R T P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_r X R,encode_r X T,encode_p X P,c) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_r_r_p_e_2_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, forall x y :e X, T x y = decode_r (pack_r_r_p_e X R T P c 2) x y.
let X R T P c. apply pack_r_r_p_e_2_eq (pack_r_r_p_e X R T P c) X R T P c. reflexivity.
Qed.

Theorem pack_r_r_p_e_3_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_r_r_p_e X R T P c -> forall x :e X, P x = decode_p (S 3) x.
let S X R T P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_r X R,encode_r X T,encode_p X P,c) 3) x.
rewrite tuple_5_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_r_r_p_e_3_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_r_r_p_e X R T P c 3) x.
let X R T P c. apply pack_r_r_p_e_3_eq (pack_r_r_p_e X R T P c) X R T P c. reflexivity.
Qed.

Theorem pack_r_r_p_e_4_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_r_r_p_e X R T P c -> c = S 4.
let S X R T P c. assume H1.
rewrite H1. prove c = (X,encode_r X R,encode_r X T,encode_p X P,c) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_r_r_p_e_4_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, c = pack_r_r_p_e X R T P c 4.
let X R T P c. apply pack_r_r_p_e_4_eq (pack_r_r_p_e X R T P c) X R T P c. reflexivity.
Qed.

Theorem pack_r_r_p_e_inj : forall X X', forall R R':set -> set -> prop, forall T T':set -> set -> prop, forall P P':set -> prop, forall c c':set, pack_r_r_p_e X R T P c = pack_r_r_p_e X' R' T' P' c' -> X = X' /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' R R' T T' P P' c c'. assume H1.
claim L0: X' = pack_r_r_p_e X R T P c 0.
{ exact pack_r_r_p_e_0_eq (pack_r_r_p_e X R T P c) X' R' T' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_r_p_e_0_eq2 X R T P c. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_r_r_p_e_1_eq2 X R T P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_p_e_1_eq2 X' R' T' P' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_r_r_p_e_2_eq2 X R T P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_p_e_2_eq2 X' R' T' P' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_r_r_p_e_3_eq2 X R T P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_r_r_p_e_3_eq2 X' R' T' P' c' x Lx.
- prove c = c'.
  rewrite pack_r_r_p_e_4_eq2 X R T P c.
  rewrite H1. symmetry.
  exact pack_r_r_p_e_4_eq2 X' R' T' P' c'.
Qed.

Theorem pack_r_r_p_e_ext : forall X, forall R R':set -> set -> prop, forall T T':set -> set -> prop, forall P P':set -> prop, forall c,
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_r_r_p_e X R T P c = pack_r_r_p_e X R' T' P' c.
let X R R' T T' P P' c. assume H1. assume H2. assume H3.
prove (X,encode_r X R,encode_r X T,encode_p X P,c) = (X,encode_r X R',encode_r X T',encode_p X P',c).
claim L1: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X T = encode_r X T'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
claim L3: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H3. }
rewrite <- L3.
reflexivity.
Qed.

Definition struct_r_r_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> q (pack_r_r_p_e X R T P c)) -> q S.

Theorem pack_struct_r_r_p_e_I: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> struct_r_r_p_e (pack_r_r_p_e X R T P c).
let X R T P c. assume Hc. let q. assume Hq.
exact Hq X R T P c Hc.
Qed.

Theorem pack_struct_r_r_p_e_E4: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set, struct_r_r_p_e (pack_r_r_p_e X R T P c) -> c :e X.
let X R T P c. assume H1. apply H1 (fun z => z = pack_r_r_p_e X R T P c -> c :e X).
- let X'. let R'. let T'. let P'. let c'. assume Hc'.
  assume Heq: pack_r_r_p_e X' R' T' P' c' = pack_r_r_p_e X R T P c.
  apply pack_r_r_p_e_inj X' X R' R T' T P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HR'R HT'T HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_r_r_p_e_eta: forall S, struct_r_r_p_e S -> S = pack_r_r_p_e (S 0) (decode_r (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_r_r_p_e (z 0) (decode_r (z 1)) (decode_r (z 2)) (decode_p (z 3)) (z 4)).
let X. let R. let T. let P. let c. assume _.
prove pack_r_r_p_e X R T P c = pack_r_r_p_e (pack_r_r_p_e X R T P c 0) (decode_r (pack_r_r_p_e X R T P c 1)) (decode_r (pack_r_r_p_e X R T P c 2)) (decode_p (pack_r_r_p_e X R T P c 3)) (pack_r_r_p_e X R T P c 4).
rewrite <- pack_r_r_p_e_0_eq2 X R T P c.
rewrite <- pack_r_r_p_e_4_eq2 X R T P c.
apply pack_r_r_p_e_ext.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_p_e_1_eq2 X R T P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_p_e_2_eq2 X R T P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_r_r_p_e_3_eq2 X R T P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_r_p_e_i : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_r_r_p_e_i_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> set -> set,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X R' T' P' c = Phi X R T P c)
  ->
  unpack_r_r_p_e_i (pack_r_r_p_e X R T P c) Phi = Phi X R T P c.
let Phi X R T P c.
assume HPhi.
prove Phi (pack_r_r_p_e X R T P c 0) (decode_r (pack_r_r_p_e X R T P c 1)) (decode_r (pack_r_r_p_e X R T P c 2)) (decode_p (pack_r_r_p_e X R T P c 3)) (pack_r_r_p_e X R T P c 4) = Phi X R T P c.
rewrite <- pack_r_r_p_e_0_eq2 X R T P c.
prove Phi X (decode_r (pack_r_r_p_e X R T P c 1)) (decode_r (pack_r_r_p_e X R T P c 2)) (decode_p (pack_r_r_p_e X R T P c 3)) (pack_r_r_p_e X R T P c 4) = Phi X R T P c.
rewrite <- pack_r_r_p_e_4_eq2 X R T P c.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r_p_e X R T P c 1) x y.
  rewrite <- pack_r_r_p_e_1_eq2 X R T P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r_p_e X R T P c 2) x y.
  rewrite <- pack_r_r_p_e_2_eq2 X R T P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_r_p_e X R T P c 3) x.
  rewrite <- pack_r_r_p_e_3_eq2 X R T P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_r_p_e_o : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)) (decode_p (S 3)) (S 4).

Theorem unpack_r_r_p_e_o_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> set -> prop,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall c:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X R' T' P' c = Phi X R T P c)
  ->
  unpack_r_r_p_e_o (pack_r_r_p_e X R T P c) Phi = Phi X R T P c.
let Phi X R T P c.
assume HPhi.
prove Phi (pack_r_r_p_e X R T P c 0) (decode_r (pack_r_r_p_e X R T P c 1)) (decode_r (pack_r_r_p_e X R T P c 2)) (decode_p (pack_r_r_p_e X R T P c 3)) (pack_r_r_p_e X R T P c 4) = Phi X R T P c.
rewrite <- pack_r_r_p_e_0_eq2 X R T P c.
prove Phi X (decode_r (pack_r_r_p_e X R T P c 1)) (decode_r (pack_r_r_p_e X R T P c 2)) (decode_p (pack_r_r_p_e X R T P c 3)) (pack_r_r_p_e X R T P c 4) = Phi X R T P c.
rewrite <- pack_r_r_p_e_4_eq2 X R T P c.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r_p_e X R T P c 1) x y.
  rewrite <- pack_r_r_p_e_1_eq2 X R T P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r_p_e X R T P c 2) x y.
  rewrite <- pack_r_r_p_e_2_eq2 X R T P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_r_p_e X R T P c 3) x.
  rewrite <- pack_r_r_p_e_3_eq2 X R T P c x Hx.
  apply iff_refl.
Qed.


Definition pack_r_r_e_e : set -> (set -> set -> prop) -> (set -> set -> prop) -> set -> set -> set := fun X R T c d => (X,encode_r X R,encode_r X T,c,d).

Theorem pack_r_r_e_e_0_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, S = pack_r_r_e_e X R T c d -> X = S 0.
let S X R T c d. assume H1. rewrite H1.
prove X = (X,encode_r X R,encode_r X T,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_r_r_e_e_0_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, X = pack_r_r_e_e X R T c d 0.
let X R T c d. apply pack_r_r_e_e_0_eq (pack_r_r_e_e X R T c d) X R T c d. reflexivity.
Qed.

Theorem pack_r_r_e_e_1_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, S = pack_r_r_e_e X R T c d -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R T c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_r X R,encode_r X T,c,d) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_r_e_e_1_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, forall x y :e X, R x y = decode_r (pack_r_r_e_e X R T c d 1) x y.
let X R T c d. apply pack_r_r_e_e_1_eq (pack_r_r_e_e X R T c d) X R T c d. reflexivity.
Qed.

Theorem pack_r_r_e_e_2_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, S = pack_r_r_e_e X R T c d -> forall x y :e X, T x y = decode_r (S 2) x y.
let S X R T c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_r X R,encode_r X T,c,d) 2) x y.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_r_r_e_e_2_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, forall x y :e X, T x y = decode_r (pack_r_r_e_e X R T c d 2) x y.
let X R T c d. apply pack_r_r_e_e_2_eq (pack_r_r_e_e X R T c d) X R T c d. reflexivity.
Qed.

Theorem pack_r_r_e_e_3_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, S = pack_r_r_e_e X R T c d -> c = S 3.
let S X R T c d. assume H1.
rewrite H1. prove c = (X,encode_r X R,encode_r X T,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_r_r_e_e_3_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, c = pack_r_r_e_e X R T c d 3.
let X R T c d. apply pack_r_r_e_e_3_eq (pack_r_r_e_e X R T c d) X R T c d. reflexivity.
Qed.

Theorem pack_r_r_e_e_4_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, S = pack_r_r_e_e X R T c d -> d = S 4.
let S X R T c d. assume H1.
rewrite H1. prove d = (X,encode_r X R,encode_r X T,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_r_r_e_e_4_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, d = pack_r_r_e_e X R T c d 4.
let X R T c d. apply pack_r_r_e_e_4_eq (pack_r_r_e_e X R T c d) X R T c d. reflexivity.
Qed.

Theorem pack_r_r_e_e_inj : forall X X', forall R R':set -> set -> prop, forall T T':set -> set -> prop, forall c c':set, forall d d':set, pack_r_r_e_e X R T c d = pack_r_r_e_e X' R' T' c' d' -> X = X' /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y) /\ c = c' /\ d = d'.
let X X' R R' T T' c c' d d'. assume H1.
claim L0: X' = pack_r_r_e_e X R T c d 0.
{ exact pack_r_r_e_e_0_eq (pack_r_r_e_e X R T c d) X' R' T' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_r_e_e_0_eq2 X R T c d. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_r_r_e_e_1_eq2 X R T c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_e_e_1_eq2 X' R' T' c' d' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_r_r_e_e_2_eq2 X R T c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_e_e_2_eq2 X' R' T' c' d' x Lx y Ly.
- prove c = c'.
  rewrite pack_r_r_e_e_3_eq2 X R T c d.
  rewrite H1. symmetry.
  exact pack_r_r_e_e_3_eq2 X' R' T' c' d'.
- prove d = d'.
  rewrite pack_r_r_e_e_4_eq2 X R T c d.
  rewrite H1. symmetry.
  exact pack_r_r_e_e_4_eq2 X' R' T' c' d'.
Qed.

Theorem pack_r_r_e_e_ext : forall X, forall R R':set -> set -> prop, forall T T':set -> set -> prop, forall c, forall d,
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 pack_r_r_e_e X R T c d = pack_r_r_e_e X R' T' c d.
let X R R' T T' c d. assume H1. assume H2.
prove (X,encode_r X R,encode_r X T,c,d) = (X,encode_r X R',encode_r X T',c,d).
claim L1: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X T = encode_r X T'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_r_r_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> q (pack_r_r_e_e X R T c d)) -> q S.

Theorem pack_struct_r_r_e_e_I: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> struct_r_r_e_e (pack_r_r_e_e X R T c d).
let X R T c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X R T c Hc d Hd.
Qed.

Theorem pack_struct_r_r_e_e_E3: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, struct_r_r_e_e (pack_r_r_e_e X R T c d) -> c :e X.
let X R T c d. assume H1. apply H1 (fun z => z = pack_r_r_e_e X R T c d -> c :e X).
- let X'. let R'. let T'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_r_r_e_e X' R' T' c' d' = pack_r_r_e_e X R T c d.
  apply pack_r_r_e_e_inj X' X R' R T' T c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HR'R HT'T Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_r_r_e_e_E4: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set, struct_r_r_e_e (pack_r_r_e_e X R T c d) -> d :e X.
let X R T c d. assume H1. apply H1 (fun z => z = pack_r_r_e_e X R T c d -> d :e X).
- let X'. let R'. let T'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_r_r_e_e X' R' T' c' d' = pack_r_r_e_e X R T c d.
  apply pack_r_r_e_e_inj X' X R' R T' T c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HR'R HT'T Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_r_r_e_e_eta: forall S, struct_r_r_e_e S -> S = pack_r_r_e_e (S 0) (decode_r (S 1)) (decode_r (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_r_r_e_e (z 0) (decode_r (z 1)) (decode_r (z 2)) (z 3) (z 4)).
let X. let R. let T. let c. assume _. let d. assume _.
prove pack_r_r_e_e X R T c d = pack_r_r_e_e (pack_r_r_e_e X R T c d 0) (decode_r (pack_r_r_e_e X R T c d 1)) (decode_r (pack_r_r_e_e X R T c d 2)) (pack_r_r_e_e X R T c d 3) (pack_r_r_e_e X R T c d 4).
rewrite <- pack_r_r_e_e_0_eq2 X R T c d.
rewrite <- pack_r_r_e_e_3_eq2 X R T c d.
rewrite <- pack_r_r_e_e_4_eq2 X R T c d.
apply pack_r_r_e_e_ext.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_e_e_1_eq2 X R T c d x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_e_e_2_eq2 X R T c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_r_r_e_e_i : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)) (S 3) (S 4).

Theorem unpack_r_r_e_e_i_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> set -> set -> set,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X R' T' c d = Phi X R T c d)
  ->
  unpack_r_r_e_e_i (pack_r_r_e_e X R T c d) Phi = Phi X R T c d.
let Phi X R T c d.
assume HPhi.
prove Phi (pack_r_r_e_e X R T c d 0) (decode_r (pack_r_r_e_e X R T c d 1)) (decode_r (pack_r_r_e_e X R T c d 2)) (pack_r_r_e_e X R T c d 3) (pack_r_r_e_e X R T c d 4) = Phi X R T c d.
rewrite <- pack_r_r_e_e_0_eq2 X R T c d.
prove Phi X (decode_r (pack_r_r_e_e X R T c d 1)) (decode_r (pack_r_r_e_e X R T c d 2)) (pack_r_r_e_e X R T c d 3) (pack_r_r_e_e X R T c d 4) = Phi X R T c d.
rewrite <- pack_r_r_e_e_3_eq2 X R T c d.
rewrite <- pack_r_r_e_e_4_eq2 X R T c d.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r_e_e X R T c d 1) x y.
  rewrite <- pack_r_r_e_e_1_eq2 X R T c d x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r_e_e X R T c d 2) x y.
  rewrite <- pack_r_r_e_e_2_eq2 X R T c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_r_r_e_e_o : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)) (S 3) (S 4).

Theorem unpack_r_r_e_e_o_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> set -> set -> prop,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall d:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X R' T' c d = Phi X R T c d)
  ->
  unpack_r_r_e_e_o (pack_r_r_e_e X R T c d) Phi = Phi X R T c d.
let Phi X R T c d.
assume HPhi.
prove Phi (pack_r_r_e_e X R T c d 0) (decode_r (pack_r_r_e_e X R T c d 1)) (decode_r (pack_r_r_e_e X R T c d 2)) (pack_r_r_e_e X R T c d 3) (pack_r_r_e_e X R T c d 4) = Phi X R T c d.
rewrite <- pack_r_r_e_e_0_eq2 X R T c d.
prove Phi X (decode_r (pack_r_r_e_e X R T c d 1)) (decode_r (pack_r_r_e_e X R T c d 2)) (pack_r_r_e_e X R T c d 3) (pack_r_r_e_e X R T c d 4) = Phi X R T c d.
rewrite <- pack_r_r_e_e_3_eq2 X R T c d.
rewrite <- pack_r_r_e_e_4_eq2 X R T c d.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r_e_e X R T c d 1) x y.
  rewrite <- pack_r_r_e_e_1_eq2 X R T c d x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r_e_e X R T c d 2) x y.
  rewrite <- pack_r_r_e_e_2_eq2 X R T c d x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_r_p_e_e : set -> (set -> set -> prop) -> (set -> prop) -> set -> set -> set := fun X R P c d => (X,encode_r X R,encode_p X P,c,d).

Theorem pack_r_p_e_e_0_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, S = pack_r_p_e_e X R P c d -> X = S 0.
let S X R P c d. assume H1. rewrite H1.
prove X = (X,encode_r X R,encode_p X P,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_r_p_e_e_0_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, X = pack_r_p_e_e X R P c d 0.
let X R P c d. apply pack_r_p_e_e_0_eq (pack_r_p_e_e X R P c d) X R P c d. reflexivity.
Qed.

Theorem pack_r_p_e_e_1_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, S = pack_r_p_e_e X R P c d -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R P c d. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_r X R,encode_p X P,c,d) 1) x y.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_p_e_e_1_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, forall x y :e X, R x y = decode_r (pack_r_p_e_e X R P c d 1) x y.
let X R P c d. apply pack_r_p_e_e_1_eq (pack_r_p_e_e X R P c d) X R P c d. reflexivity.
Qed.

Theorem pack_r_p_e_e_2_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, S = pack_r_p_e_e X R P c d -> forall x :e X, P x = decode_p (S 2) x.
let S X R P c d. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_r X R,encode_p X P,c,d) 2) x.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_r_p_e_e_2_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, forall x :e X, P x = decode_p (pack_r_p_e_e X R P c d 2) x.
let X R P c d. apply pack_r_p_e_e_2_eq (pack_r_p_e_e X R P c d) X R P c d. reflexivity.
Qed.

Theorem pack_r_p_e_e_3_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, S = pack_r_p_e_e X R P c d -> c = S 3.
let S X R P c d. assume H1.
rewrite H1. prove c = (X,encode_r X R,encode_p X P,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_r_p_e_e_3_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, c = pack_r_p_e_e X R P c d 3.
let X R P c d. apply pack_r_p_e_e_3_eq (pack_r_p_e_e X R P c d) X R P c d. reflexivity.
Qed.

Theorem pack_r_p_e_e_4_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, S = pack_r_p_e_e X R P c d -> d = S 4.
let S X R P c d. assume H1.
rewrite H1. prove d = (X,encode_r X R,encode_p X P,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_r_p_e_e_4_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, d = pack_r_p_e_e X R P c d 4.
let X R P c d. apply pack_r_p_e_e_4_eq (pack_r_p_e_e X R P c d) X R P c d. reflexivity.
Qed.

Theorem pack_r_p_e_e_inj : forall X X', forall R R':set -> set -> prop, forall P P':set -> prop, forall c c':set, forall d d':set, pack_r_p_e_e X R P c d = pack_r_p_e_e X' R' P' c' d' -> X = X' /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x) /\ c = c' /\ d = d'.
let X X' R R' P P' c c' d d'. assume H1.
claim L0: X' = pack_r_p_e_e X R P c d 0.
{ exact pack_r_p_e_e_0_eq (pack_r_p_e_e X R P c d) X' R' P' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_p_e_e_0_eq2 X R P c d. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_r_p_e_e_1_eq2 X R P c d x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_p_e_e_1_eq2 X' R' P' c' d' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_r_p_e_e_2_eq2 X R P c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_r_p_e_e_2_eq2 X' R' P' c' d' x Lx.
- prove c = c'.
  rewrite pack_r_p_e_e_3_eq2 X R P c d.
  rewrite H1. symmetry.
  exact pack_r_p_e_e_3_eq2 X' R' P' c' d'.
- prove d = d'.
  rewrite pack_r_p_e_e_4_eq2 X R P c d.
  rewrite H1. symmetry.
  exact pack_r_p_e_e_4_eq2 X' R' P' c' d'.
Qed.

Theorem pack_r_p_e_e_ext : forall X, forall R R':set -> set -> prop, forall P P':set -> prop, forall c, forall d,
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_r_p_e_e X R P c d = pack_r_p_e_e X R' P' c d.
let X R R' P P' c d. assume H1. assume H2.
prove (X,encode_r X R,encode_p X P,c,d) = (X,encode_r X R',encode_p X P',c,d).
claim L1: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_r_p_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> q (pack_r_p_e_e X R P c d)) -> q S.

Theorem pack_struct_r_p_e_e_I: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> struct_r_p_e_e (pack_r_p_e_e X R P c d).
let X R P c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X R P c Hc d Hd.
Qed.

Theorem pack_struct_r_p_e_e_E3: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, struct_r_p_e_e (pack_r_p_e_e X R P c d) -> c :e X.
let X R P c d. assume H1. apply H1 (fun z => z = pack_r_p_e_e X R P c d -> c :e X).
- let X'. let R'. let P'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_r_p_e_e X' R' P' c' d' = pack_r_p_e_e X R P c d.
  apply pack_r_p_e_e_inj X' X R' R P' P c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HR'R HP'P Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_r_p_e_e_E4: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set, struct_r_p_e_e (pack_r_p_e_e X R P c d) -> d :e X.
let X R P c d. assume H1. apply H1 (fun z => z = pack_r_p_e_e X R P c d -> d :e X).
- let X'. let R'. let P'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_r_p_e_e X' R' P' c' d' = pack_r_p_e_e X R P c d.
  apply pack_r_p_e_e_inj X' X R' R P' P c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HR'R HP'P Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_r_p_e_e_eta: forall S, struct_r_p_e_e S -> S = pack_r_p_e_e (S 0) (decode_r (S 1)) (decode_p (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_r_p_e_e (z 0) (decode_r (z 1)) (decode_p (z 2)) (z 3) (z 4)).
let X. let R. let P. let c. assume _. let d. assume _.
prove pack_r_p_e_e X R P c d = pack_r_p_e_e (pack_r_p_e_e X R P c d 0) (decode_r (pack_r_p_e_e X R P c d 1)) (decode_p (pack_r_p_e_e X R P c d 2)) (pack_r_p_e_e X R P c d 3) (pack_r_p_e_e X R P c d 4).
rewrite <- pack_r_p_e_e_0_eq2 X R P c d.
rewrite <- pack_r_p_e_e_3_eq2 X R P c d.
rewrite <- pack_r_p_e_e_4_eq2 X R P c d.
apply pack_r_p_e_e_ext.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_p_e_e_1_eq2 X R P c d x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_r_p_e_e_2_eq2 X R P c d x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_p_e_e_i : set -> (set -> (set -> set -> prop) -> (set -> prop) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_p (S 2)) (S 3) (S 4).

Theorem unpack_r_p_e_e_i_eq : forall Phi:set -> (set -> set -> prop) -> (set -> prop) -> set -> set -> set,
  forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X R' P' c d = Phi X R P c d)
  ->
  unpack_r_p_e_e_i (pack_r_p_e_e X R P c d) Phi = Phi X R P c d.
let Phi X R P c d.
assume HPhi.
prove Phi (pack_r_p_e_e X R P c d 0) (decode_r (pack_r_p_e_e X R P c d 1)) (decode_p (pack_r_p_e_e X R P c d 2)) (pack_r_p_e_e X R P c d 3) (pack_r_p_e_e X R P c d 4) = Phi X R P c d.
rewrite <- pack_r_p_e_e_0_eq2 X R P c d.
prove Phi X (decode_r (pack_r_p_e_e X R P c d 1)) (decode_p (pack_r_p_e_e X R P c d 2)) (pack_r_p_e_e X R P c d 3) (pack_r_p_e_e X R P c d 4) = Phi X R P c d.
rewrite <- pack_r_p_e_e_3_eq2 X R P c d.
rewrite <- pack_r_p_e_e_4_eq2 X R P c d.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_p_e_e X R P c d 1) x y.
  rewrite <- pack_r_p_e_e_1_eq2 X R P c d x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_p_e_e X R P c d 2) x.
  rewrite <- pack_r_p_e_e_2_eq2 X R P c d x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_p_e_e_o : set -> (set -> (set -> set -> prop) -> (set -> prop) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_p (S 2)) (S 3) (S 4).

Theorem unpack_r_p_e_e_o_eq : forall Phi:set -> (set -> set -> prop) -> (set -> prop) -> set -> set -> prop,
  forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall d:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X R' P' c d = Phi X R P c d)
  ->
  unpack_r_p_e_e_o (pack_r_p_e_e X R P c d) Phi = Phi X R P c d.
let Phi X R P c d.
assume HPhi.
prove Phi (pack_r_p_e_e X R P c d 0) (decode_r (pack_r_p_e_e X R P c d 1)) (decode_p (pack_r_p_e_e X R P c d 2)) (pack_r_p_e_e X R P c d 3) (pack_r_p_e_e X R P c d 4) = Phi X R P c d.
rewrite <- pack_r_p_e_e_0_eq2 X R P c d.
prove Phi X (decode_r (pack_r_p_e_e X R P c d 1)) (decode_p (pack_r_p_e_e X R P c d 2)) (pack_r_p_e_e X R P c d 3) (pack_r_p_e_e X R P c d 4) = Phi X R P c d.
rewrite <- pack_r_p_e_e_3_eq2 X R P c d.
rewrite <- pack_r_p_e_e_4_eq2 X R P c d.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_p_e_e X R P c d 1) x y.
  rewrite <- pack_r_p_e_e_1_eq2 X R P c d x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_p_e_e X R P c d 2) x.
  rewrite <- pack_r_p_e_e_2_eq2 X R P c d x Hx.
  apply iff_refl.
Qed.


Definition pack_p_p_e_e : set -> (set -> prop) -> (set -> prop) -> set -> set -> set := fun X P Q c d => (X,encode_p X P,encode_p X Q,c,d).

Theorem pack_p_p_e_e_0_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, S = pack_p_p_e_e X P Q c d -> X = S 0.
let S X P Q c d. assume H1. rewrite H1.
prove X = (X,encode_p X P,encode_p X Q,c,d) 0.
symmetry. apply tuple_5_0_eq.
Qed.

Theorem pack_p_p_e_e_0_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, X = pack_p_p_e_e X P Q c d 0.
let X P Q c d. apply pack_p_p_e_e_0_eq (pack_p_p_e_e X P Q c d) X P Q c d. reflexivity.
Qed.

Theorem pack_p_p_e_e_1_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, S = pack_p_p_e_e X P Q c d -> forall x :e X, P x = decode_p (S 1) x.
let S X P Q c d. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_p X P,encode_p X Q,c,d) 1) x.
rewrite tuple_5_1_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_p_p_e_e_1_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, forall x :e X, P x = decode_p (pack_p_p_e_e X P Q c d 1) x.
let X P Q c d. apply pack_p_p_e_e_1_eq (pack_p_p_e_e X P Q c d) X P Q c d. reflexivity.
Qed.

Theorem pack_p_p_e_e_2_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, S = pack_p_p_e_e X P Q c d -> forall x :e X, Q x = decode_p (S 2) x.
let S X P Q c d. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_p X P,encode_p X Q,c,d) 2) x.
rewrite tuple_5_2_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_p_p_e_e_2_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, forall x :e X, Q x = decode_p (pack_p_p_e_e X P Q c d 2) x.
let X P Q c d. apply pack_p_p_e_e_2_eq (pack_p_p_e_e X P Q c d) X P Q c d. reflexivity.
Qed.

Theorem pack_p_p_e_e_3_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, S = pack_p_p_e_e X P Q c d -> c = S 3.
let S X P Q c d. assume H1.
rewrite H1. prove c = (X,encode_p X P,encode_p X Q,c,d) 3. symmetry. apply tuple_5_3_eq.
Qed.

Theorem pack_p_p_e_e_3_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, c = pack_p_p_e_e X P Q c d 3.
let X P Q c d. apply pack_p_p_e_e_3_eq (pack_p_p_e_e X P Q c d) X P Q c d. reflexivity.
Qed.

Theorem pack_p_p_e_e_4_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, S = pack_p_p_e_e X P Q c d -> d = S 4.
let S X P Q c d. assume H1.
rewrite H1. prove d = (X,encode_p X P,encode_p X Q,c,d) 4. symmetry. apply tuple_5_4_eq.
Qed.

Theorem pack_p_p_e_e_4_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, d = pack_p_p_e_e X P Q c d 4.
let X P Q c d. apply pack_p_p_e_e_4_eq (pack_p_p_e_e X P Q c d) X P Q c d. reflexivity.
Qed.

Theorem pack_p_p_e_e_inj : forall X X', forall P P':set -> prop, forall Q Q':set -> prop, forall c c':set, forall d d':set, pack_p_p_e_e X P Q c d = pack_p_p_e_e X' P' Q' c' d' -> X = X' /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x) /\ c = c' /\ d = d'.
let X X' P P' Q Q' c c' d d'. assume H1.
claim L0: X' = pack_p_p_e_e X P Q c d 0.
{ exact pack_p_p_e_e_0_eq (pack_p_p_e_e X P Q c d) X' P' Q' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_p_p_e_e_0_eq2 X P Q c d. }
apply and5I.
- exact L1.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_p_p_e_e_1_eq2 X P Q c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_p_p_e_e_1_eq2 X' P' Q' c' d' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_p_p_e_e_2_eq2 X P Q c d x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_p_p_e_e_2_eq2 X' P' Q' c' d' x Lx.
- prove c = c'.
  rewrite pack_p_p_e_e_3_eq2 X P Q c d.
  rewrite H1. symmetry.
  exact pack_p_p_e_e_3_eq2 X' P' Q' c' d'.
- prove d = d'.
  rewrite pack_p_p_e_e_4_eq2 X P Q c d.
  rewrite H1. symmetry.
  exact pack_p_p_e_e_4_eq2 X' P' Q' c' d'.
Qed.

Theorem pack_p_p_e_e_ext : forall X, forall P P':set -> prop, forall Q Q':set -> prop, forall c, forall d,
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_p_p_e_e X P Q c d = pack_p_p_e_e X P' Q' c d.
let X P P' Q Q' c d. assume H1. assume H2.
prove (X,encode_p X P,encode_p X Q,c,d) = (X,encode_p X P',encode_p X Q',c,d).
claim L1: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_p_p_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall P:set -> prop, forall Q:set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> q (pack_p_p_e_e X P Q c d)) -> q S.

Theorem pack_struct_p_p_e_e_I: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, c :e X -> forall d:set, d :e X -> struct_p_p_e_e (pack_p_p_e_e X P Q c d).
let X P Q c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X P Q c Hc d Hd.
Qed.

Theorem pack_struct_p_p_e_e_E3: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, struct_p_p_e_e (pack_p_p_e_e X P Q c d) -> c :e X.
let X P Q c d. assume H1. apply H1 (fun z => z = pack_p_p_e_e X P Q c d -> c :e X).
- let X'. let P'. let Q'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_p_p_e_e X' P' Q' c' d' = pack_p_p_e_e X P Q c d.
  apply pack_p_p_e_e_inj X' X P' P Q' Q c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HP'P HQ'Q Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_p_p_e_e_E4: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set, struct_p_p_e_e (pack_p_p_e_e X P Q c d) -> d :e X.
let X P Q c d. assume H1. apply H1 (fun z => z = pack_p_p_e_e X P Q c d -> d :e X).
- let X'. let P'. let Q'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_p_p_e_e X' P' Q' c' d' = pack_p_p_e_e X P Q c d.
  apply pack_p_p_e_e_inj X' X P' P Q' Q c' c d' d Heq.
  assume H. apply H.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HP'P HQ'Q Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_p_p_e_e_eta: forall S, struct_p_p_e_e S -> S = pack_p_p_e_e (S 0) (decode_p (S 1)) (decode_p (S 2)) (S 3) (S 4).
let S. assume H1. apply H1 (fun z => z = pack_p_p_e_e (z 0) (decode_p (z 1)) (decode_p (z 2)) (z 3) (z 4)).
let X. let P. let Q. let c. assume _. let d. assume _.
prove pack_p_p_e_e X P Q c d = pack_p_p_e_e (pack_p_p_e_e X P Q c d 0) (decode_p (pack_p_p_e_e X P Q c d 1)) (decode_p (pack_p_p_e_e X P Q c d 2)) (pack_p_p_e_e X P Q c d 3) (pack_p_p_e_e X P Q c d 4).
rewrite <- pack_p_p_e_e_0_eq2 X P Q c d.
rewrite <- pack_p_p_e_e_3_eq2 X P Q c d.
rewrite <- pack_p_p_e_e_4_eq2 X P Q c d.
apply pack_p_p_e_e_ext.
- let x. assume Hx.
  rewrite <- pack_p_p_e_e_1_eq2 X P Q c d x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_p_p_e_e_2_eq2 X P Q c d x Hx.
  apply iff_refl.
Qed.


Definition unpack_p_p_e_e_i : set -> (set -> (set -> prop) -> (set -> prop) -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_p (S 1)) (decode_p (S 2)) (S 3) (S 4).

Theorem unpack_p_p_e_e_i_eq : forall Phi:set -> (set -> prop) -> (set -> prop) -> set -> set -> set,
  forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set,
  ( forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X P' Q' c d = Phi X P Q c d)
  ->
  unpack_p_p_e_e_i (pack_p_p_e_e X P Q c d) Phi = Phi X P Q c d.
let Phi X P Q c d.
assume HPhi.
prove Phi (pack_p_p_e_e X P Q c d 0) (decode_p (pack_p_p_e_e X P Q c d 1)) (decode_p (pack_p_p_e_e X P Q c d 2)) (pack_p_p_e_e X P Q c d 3) (pack_p_p_e_e X P Q c d 4) = Phi X P Q c d.
rewrite <- pack_p_p_e_e_0_eq2 X P Q c d.
prove Phi X (decode_p (pack_p_p_e_e X P Q c d 1)) (decode_p (pack_p_p_e_e X P Q c d 2)) (pack_p_p_e_e X P Q c d 3) (pack_p_p_e_e X P Q c d 4) = Phi X P Q c d.
rewrite <- pack_p_p_e_e_3_eq2 X P Q c d.
rewrite <- pack_p_p_e_e_4_eq2 X P Q c d.
apply HPhi.
- let x. assume Hx.
  prove P x <-> decode_p (pack_p_p_e_e X P Q c d 1) x.
  rewrite <- pack_p_p_e_e_1_eq2 X P Q c d x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_p_p_e_e X P Q c d 2) x.
  rewrite <- pack_p_p_e_e_2_eq2 X P Q c d x Hx.
  apply iff_refl.
Qed.


Definition unpack_p_p_e_e_o : set -> (set -> (set -> prop) -> (set -> prop) -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_p (S 1)) (decode_p (S 2)) (S 3) (S 4).

Theorem unpack_p_p_e_e_o_eq : forall Phi:set -> (set -> prop) -> (set -> prop) -> set -> set -> prop,
  forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall d:set,
  ( forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X P' Q' c d = Phi X P Q c d)
  ->
  unpack_p_p_e_e_o (pack_p_p_e_e X P Q c d) Phi = Phi X P Q c d.
let Phi X P Q c d.
assume HPhi.
prove Phi (pack_p_p_e_e X P Q c d 0) (decode_p (pack_p_p_e_e X P Q c d 1)) (decode_p (pack_p_p_e_e X P Q c d 2)) (pack_p_p_e_e X P Q c d 3) (pack_p_p_e_e X P Q c d 4) = Phi X P Q c d.
rewrite <- pack_p_p_e_e_0_eq2 X P Q c d.
prove Phi X (decode_p (pack_p_p_e_e X P Q c d 1)) (decode_p (pack_p_p_e_e X P Q c d 2)) (pack_p_p_e_e X P Q c d 3) (pack_p_p_e_e X P Q c d 4) = Phi X P Q c d.
rewrite <- pack_p_p_e_e_3_eq2 X P Q c d.
rewrite <- pack_p_p_e_e_4_eq2 X P Q c d.
apply HPhi.
- let x. assume Hx.
  prove P x <-> decode_p (pack_p_p_e_e X P Q c d 1) x.
  rewrite <- pack_p_p_e_e_1_eq2 X P Q c d x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_p_p_e_e X P Q c d 2) x.
  rewrite <- pack_p_p_e_e_2_eq2 X P Q c d x Hx.
  apply iff_refl.
Qed.

