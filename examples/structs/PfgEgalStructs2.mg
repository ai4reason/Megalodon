Definition pack_c_b : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set := fun X C f => (X,encode_c X C,encode_b X f).

Theorem pack_c_b_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, S = pack_c_b X C f -> X = S 0.
let S X C f. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_c_b_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, X = pack_c_b X C f 0.
let X C f. apply pack_c_b_0_eq (pack_c_b X C f) X C f. reflexivity.
Qed.

Theorem pack_c_b_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, S = pack_c_b X C f -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f) 1) U.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b X C f 1) U.
let X C f. apply pack_c_b_1_eq (pack_c_b X C f) X C f. reflexivity.
Qed.

Theorem pack_c_b_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, S = pack_c_b X C f -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f) 2) x y.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall x y :e X, f x y = decode_b (pack_c_b X C f 2) x y.
let X C f. apply pack_c_b_2_eq (pack_c_b X C f) X C f. reflexivity.
Qed.

Theorem pack_c_b_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, pack_c_b X C f = pack_c_b X' C' f' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y).
let X X' C C' f f'. assume H1.
claim L0: X' = pack_c_b X C f 0.
{ exact pack_c_b_0_eq (pack_c_b X C f) X' C' f' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_0_eq2 X C f. }
apply and3I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_1_eq2 X C f U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_1_eq2 X' C' f' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_2_eq2 X C f x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_2_eq2 X' C' f' x Lx y Ly.
Qed.

Theorem pack_c_b_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 pack_c_b X C f = pack_c_b X C' f'.
let X C C' f f'. assume H1. assume H2.
prove (X,encode_c X C,encode_b X f) = (X,encode_c X C',encode_b X f').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_b : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> q (pack_c_b X C f)) -> q S.

Theorem pack_struct_c_b_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> struct_c_b (pack_c_b X C f).
let X C f. assume Hf. let q. assume Hq.
exact Hq X C f Hf.
Qed.

Theorem pack_struct_c_b_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, struct_c_b (pack_c_b X C f) -> forall x y :e X, f x y :e X.
let X C f. assume H1. apply H1 (fun z => z = pack_c_b X C f -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'.
  assume Heq: pack_c_b X' C' f' = pack_c_b X C f.
  apply pack_c_b_inj X' X C' C f' f Heq.
  assume H. apply H.
  assume HX'X HC'C Hf'f.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_c_b_eta: forall S, struct_c_b S -> S = pack_c_b (S 0) (decode_c (S 1)) (decode_b (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_c_b (z 0) (decode_c (z 1)) (decode_b (z 2))).
let X. let C. let f. assume _.
prove pack_c_b X C f = pack_c_b (pack_c_b X C f 0) (decode_c (pack_c_b X C f 1)) (decode_b (pack_c_b X C f 2)).
rewrite <- pack_c_b_0_eq2 X C f.
apply pack_c_b_ext.
- let U. assume HU.
  rewrite <- pack_c_b_1_eq2 X C f U HU.
  apply iff_refl.
- exact pack_c_b_2_eq2 X C f.
Qed.


Definition unpack_c_b_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)).

Theorem unpack_c_b_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) -> Phi X C' f' = Phi X C f)
  ->
  unpack_c_b_i (pack_c_b X C f) Phi = Phi X C f.
let Phi X C f.
assume HPhi.
prove Phi (pack_c_b X C f 0) (decode_c (pack_c_b X C f 1)) (decode_b (pack_c_b X C f 2)) = Phi X C f.
rewrite <- pack_c_b_0_eq2 X C f.
prove Phi X (decode_c (pack_c_b X C f 1)) (decode_b (pack_c_b X C f 2)) = Phi X C f.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b X C f 1) U.
  rewrite <- pack_c_b_1_eq2 X C f U HU.
  apply iff_refl.
- exact pack_c_b_2_eq2 X C f.
Qed.


Definition unpack_c_b_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)).

Theorem unpack_c_b_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) -> Phi X C' f' = Phi X C f)
  ->
  unpack_c_b_o (pack_c_b X C f) Phi = Phi X C f.
let Phi X C f.
assume HPhi.
prove Phi (pack_c_b X C f 0) (decode_c (pack_c_b X C f 1)) (decode_b (pack_c_b X C f 2)) = Phi X C f.
rewrite <- pack_c_b_0_eq2 X C f.
prove Phi X (decode_c (pack_c_b X C f 1)) (decode_b (pack_c_b X C f 2)) = Phi X C f.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b X C f 1) U.
  rewrite <- pack_c_b_1_eq2 X C f U HU.
  apply iff_refl.
- exact pack_c_b_2_eq2 X C f.
Qed.


Definition pack_c_u : set -> ((set -> prop) -> prop) -> (set -> set) -> set := fun X C i => (X,encode_c X C,encode_u X i).

Theorem pack_c_u_0_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, S = pack_c_u X C i -> X = S 0.
let S X C i. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_u X i) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_c_u_0_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, X = pack_c_u X C i 0.
let X C i. apply pack_c_u_0_eq (pack_c_u X C i) X C i. reflexivity.
Qed.

Theorem pack_c_u_1_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, S = pack_c_u X C i -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C i. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_u X i) 1) U.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_u_1_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_u X C i 1) U.
let X C i. apply pack_c_u_1_eq (pack_c_u X C i) X C i. reflexivity.
Qed.

Theorem pack_c_u_2_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, S = pack_c_u X C i -> forall x :e X, i x = decode_u (S 2) x.
let S X C i. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_u X i) 2) x.
rewrite tuple_3_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_u_2_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall x :e X, i x = decode_u (pack_c_u X C i 2) x.
let X C i. apply pack_c_u_2_eq (pack_c_u X C i) X C i. reflexivity.
Qed.

Theorem pack_c_u_inj : forall X X', forall C C':(set -> prop) -> prop, forall i i':set -> set, pack_c_u X C i = pack_c_u X' C' i' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, i x = i' x).
let X X' C C' i i'. assume H1.
claim L0: X' = pack_c_u X C i 0.
{ exact pack_c_u_0_eq (pack_c_u X C i) X' C' i' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_u_0_eq2 X C i. }
apply and3I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_u_1_eq2 X C i U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_u_1_eq2 X' C' i' U LU.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_u_2_eq2 X C i x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_2_eq2 X' C' i' x Lx.
Qed.

Theorem pack_c_u_ext : forall X, forall C C':(set -> prop) -> prop, forall i i':set -> set,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, i x = i' x) ->
 pack_c_u X C i = pack_c_u X C' i'.
let X C C' i i'. assume H1. assume H2.
prove (X,encode_c X C,encode_u X i) = (X,encode_c X C',encode_u X i').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_u : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> q (pack_c_u X C i)) -> q S.

Theorem pack_struct_c_u_I: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> struct_c_u (pack_c_u X C i).
let X C i. assume Hi. let q. assume Hq.
exact Hq X C i Hi.
Qed.

Theorem pack_struct_c_u_E2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, struct_c_u (pack_c_u X C i) -> forall x :e X, i x :e X.
let X C i. assume H1. apply H1 (fun z => z = pack_c_u X C i -> forall x :e X, i x :e X).
- let X'. let C'. let i'. assume Hi'.
  assume Heq: pack_c_u X' C' i' = pack_c_u X C i.
  apply pack_c_u_inj X' X C' C i' i Heq.
  assume H. apply H.
  assume HX'X HC'C Hi'i.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_c_u_eta: forall S, struct_c_u S -> S = pack_c_u (S 0) (decode_c (S 1)) (decode_u (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_c_u (z 0) (decode_c (z 1)) (decode_u (z 2))).
let X. let C. let i. assume _.
prove pack_c_u X C i = pack_c_u (pack_c_u X C i 0) (decode_c (pack_c_u X C i 1)) (decode_u (pack_c_u X C i 2)).
rewrite <- pack_c_u_0_eq2 X C i.
apply pack_c_u_ext.
- let U. assume HU.
  rewrite <- pack_c_u_1_eq2 X C i U HU.
  apply iff_refl.
- exact pack_c_u_2_eq2 X C i.
Qed.


Definition unpack_c_u_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)).

Theorem unpack_c_u_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> set,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X C' i' = Phi X C i)
  ->
  unpack_c_u_i (pack_c_u X C i) Phi = Phi X C i.
let Phi X C i.
assume HPhi.
prove Phi (pack_c_u X C i 0) (decode_c (pack_c_u X C i 1)) (decode_u (pack_c_u X C i 2)) = Phi X C i.
rewrite <- pack_c_u_0_eq2 X C i.
prove Phi X (decode_c (pack_c_u X C i 1)) (decode_u (pack_c_u X C i 2)) = Phi X C i.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u X C i 1) U.
  rewrite <- pack_c_u_1_eq2 X C i U HU.
  apply iff_refl.
- exact pack_c_u_2_eq2 X C i.
Qed.


Definition unpack_c_u_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)).

Theorem unpack_c_u_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X C' i' = Phi X C i)
  ->
  unpack_c_u_o (pack_c_u X C i) Phi = Phi X C i.
let Phi X C i.
assume HPhi.
prove Phi (pack_c_u X C i 0) (decode_c (pack_c_u X C i 1)) (decode_u (pack_c_u X C i 2)) = Phi X C i.
rewrite <- pack_c_u_0_eq2 X C i.
prove Phi X (decode_c (pack_c_u X C i 1)) (decode_u (pack_c_u X C i 2)) = Phi X C i.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u X C i 1) U.
  rewrite <- pack_c_u_1_eq2 X C i U HU.
  apply iff_refl.
- exact pack_c_u_2_eq2 X C i.
Qed.


Definition pack_c_r : set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set := fun X C R => (X,encode_c X C,encode_r X R).

Theorem pack_c_r_0_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, S = pack_c_r X C R -> X = S 0.
let S X C R. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_r X R) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_c_r_0_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, X = pack_c_r X C R 0.
let X C R. apply pack_c_r_0_eq (pack_c_r X C R) X C R. reflexivity.
Qed.

Theorem pack_c_r_1_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, S = pack_c_r X C R -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C R. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_r X R) 1) U.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_r_1_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_r X C R 1) U.
let X C R. apply pack_c_r_1_eq (pack_c_r X C R) X C R. reflexivity.
Qed.

Theorem pack_c_r_2_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, S = pack_c_r X C R -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X C R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_r X R) 2) x y.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_r_2_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_c_r X C R 2) x y.
let X C R. apply pack_c_r_2_eq (pack_c_r X C R) X C R. reflexivity.
Qed.

Theorem pack_c_r_inj : forall X X', forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, pack_c_r X C R = pack_c_r X' C' R' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, R x y = R' x y).
let X X' C C' R R'. assume H1.
claim L0: X' = pack_c_r X C R 0.
{ exact pack_c_r_0_eq (pack_c_r X C R) X' C' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_r_0_eq2 X C R. }
apply and3I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_r_1_eq2 X C R U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_r_1_eq2 X' C' R' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_r_2_eq2 X C R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_r_2_eq2 X' C' R' x Lx y Ly.
Qed.

Theorem pack_c_r_ext : forall X, forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_c_r X C R = pack_c_r X C' R'.
let X C C' R R'. assume H1. assume H2.
prove (X,encode_c X C,encode_r X R) = (X,encode_c X C',encode_r X R').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, q (pack_c_r X C R)) -> q S.

Theorem pack_struct_c_r_I: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, struct_c_r (pack_c_r X C R).
let X C R q. assume Hq.
exact Hq X C R.
Qed.

Theorem struct_c_r_eta: forall S, struct_c_r S -> S = pack_c_r (S 0) (decode_c (S 1)) (decode_r (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_c_r (z 0) (decode_c (z 1)) (decode_r (z 2))).
let X. let C. let R.
prove pack_c_r X C R = pack_c_r (pack_c_r X C R 0) (decode_c (pack_c_r X C R 1)) (decode_r (pack_c_r X C R 2)).
rewrite <- pack_c_r_0_eq2 X C R.
apply pack_c_r_ext.
- let U. assume HU.
  rewrite <- pack_c_r_1_eq2 X C R U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_r_2_eq2 X C R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_r_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)).

Theorem unpack_c_r_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' R' = Phi X C R)
  ->
  unpack_c_r_i (pack_c_r X C R) Phi = Phi X C R.
let Phi X C R.
assume HPhi.
prove Phi (pack_c_r X C R 0) (decode_c (pack_c_r X C R 1)) (decode_r (pack_c_r X C R 2)) = Phi X C R.
rewrite <- pack_c_r_0_eq2 X C R.
prove Phi X (decode_c (pack_c_r X C R 1)) (decode_r (pack_c_r X C R 2)) = Phi X C R.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r X C R 1) U.
  rewrite <- pack_c_r_1_eq2 X C R U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r X C R 2) x y.
  rewrite <- pack_c_r_2_eq2 X C R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_r_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)).

Theorem unpack_c_r_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' R' = Phi X C R)
  ->
  unpack_c_r_o (pack_c_r X C R) Phi = Phi X C R.
let Phi X C R.
assume HPhi.
prove Phi (pack_c_r X C R 0) (decode_c (pack_c_r X C R 1)) (decode_r (pack_c_r X C R 2)) = Phi X C R.
rewrite <- pack_c_r_0_eq2 X C R.
prove Phi X (decode_c (pack_c_r X C R 1)) (decode_r (pack_c_r X C R 2)) = Phi X C R.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r X C R 1) U.
  rewrite <- pack_c_r_1_eq2 X C R U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r X C R 2) x y.
  rewrite <- pack_c_r_2_eq2 X C R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_c_p : set -> ((set -> prop) -> prop) -> (set -> prop) -> set := fun X C P => (X,encode_c X C,encode_p X P).

Theorem pack_c_p_0_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, S = pack_c_p X C P -> X = S 0.
let S X C P. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_p X P) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_c_p_0_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, X = pack_c_p X C P 0.
let X C P. apply pack_c_p_0_eq (pack_c_p X C P) X C P. reflexivity.
Qed.

Theorem pack_c_p_1_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, S = pack_c_p X C P -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C P. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_p X P) 1) U.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_p_1_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_p X C P 1) U.
let X C P. apply pack_c_p_1_eq (pack_c_p X C P) X C P. reflexivity.
Qed.

Theorem pack_c_p_2_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, S = pack_c_p X C P -> forall x :e X, P x = decode_p (S 2) x.
let S X C P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_p X P) 2) x.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_p_2_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_c_p X C P 2) x.
let X C P. apply pack_c_p_2_eq (pack_c_p X C P) X C P. reflexivity.
Qed.

Theorem pack_c_p_inj : forall X X', forall C C':(set -> prop) -> prop, forall P P':set -> prop, pack_c_p X C P = pack_c_p X' C' P' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, P x = P' x).
let X X' C C' P P'. assume H1.
claim L0: X' = pack_c_p X C P 0.
{ exact pack_c_p_0_eq (pack_c_p X C P) X' C' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_p_0_eq2 X C P. }
apply and3I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_p_1_eq2 X C P U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_p_1_eq2 X' C' P' U LU.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_p_2_eq2 X C P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_p_2_eq2 X' C' P' x Lx.
Qed.

Theorem pack_c_p_ext : forall X, forall C C':(set -> prop) -> prop, forall P P':set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_p X C P = pack_c_p X C' P'.
let X C C' P P'. assume H1. assume H2.
prove (X,encode_c X C,encode_p X P) = (X,encode_c X C',encode_p X P').
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall P:set -> prop, q (pack_c_p X C P)) -> q S.

Theorem pack_struct_c_p_I: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, struct_c_p (pack_c_p X C P).
let X C P q. assume Hq.
exact Hq X C P.
Qed.

Theorem struct_c_p_eta: forall S, struct_c_p S -> S = pack_c_p (S 0) (decode_c (S 1)) (decode_p (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_c_p (z 0) (decode_c (z 1)) (decode_p (z 2))).
let X. let C. let P.
prove pack_c_p X C P = pack_c_p (pack_c_p X C P 0) (decode_c (pack_c_p X C P 1)) (decode_p (pack_c_p X C P 2)).
rewrite <- pack_c_p_0_eq2 X C P.
apply pack_c_p_ext.
- let U. assume HU.
  rewrite <- pack_c_p_1_eq2 X C P U HU.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_p_2_eq2 X C P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_p_i : set -> (set -> ((set -> prop) -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_p (S 2)).

Theorem unpack_c_p_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' P' = Phi X C P)
  ->
  unpack_c_p_i (pack_c_p X C P) Phi = Phi X C P.
let Phi X C P.
assume HPhi.
prove Phi (pack_c_p X C P 0) (decode_c (pack_c_p X C P 1)) (decode_p (pack_c_p X C P 2)) = Phi X C P.
rewrite <- pack_c_p_0_eq2 X C P.
prove Phi X (decode_c (pack_c_p X C P 1)) (decode_p (pack_c_p X C P 2)) = Phi X C P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_p X C P 1) U.
  rewrite <- pack_c_p_1_eq2 X C P U HU.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_p X C P 2) x.
  rewrite <- pack_c_p_2_eq2 X C P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_p_o : set -> (set -> ((set -> prop) -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_p (S 2)).

Theorem unpack_c_p_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' P' = Phi X C P)
  ->
  unpack_c_p_o (pack_c_p X C P) Phi = Phi X C P.
let Phi X C P.
assume HPhi.
prove Phi (pack_c_p X C P 0) (decode_c (pack_c_p X C P 1)) (decode_p (pack_c_p X C P 2)) = Phi X C P.
rewrite <- pack_c_p_0_eq2 X C P.
prove Phi X (decode_c (pack_c_p X C P 1)) (decode_p (pack_c_p X C P 2)) = Phi X C P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_p X C P 1) U.
  rewrite <- pack_c_p_1_eq2 X C P U HU.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_p X C P 2) x.
  rewrite <- pack_c_p_2_eq2 X C P x Hx.
  apply iff_refl.
Qed.


Definition pack_c_e : set -> ((set -> prop) -> prop) -> set -> set := fun X C c => (X,encode_c X C,c).

Theorem pack_c_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall c:set, S = pack_c_e X C c -> X = S 0.
let S X C c. assume H1. rewrite H1.
prove X = (X,encode_c X C,c) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_c_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall c:set, X = pack_c_e X C c 0.
let X C c. apply pack_c_e_0_eq (pack_c_e X C c) X C c. reflexivity.
Qed.

Theorem pack_c_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall c:set, S = pack_c_e X C c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,c) 1) U.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_e X C c 1) U.
let X C c. apply pack_c_e_1_eq (pack_c_e X C c) X C c. reflexivity.
Qed.

Theorem pack_c_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall c:set, S = pack_c_e X C c -> c = S 2.
let S X C c. assume H1.
rewrite H1. prove c = (X,encode_c X C,c) 2. symmetry. apply tuple_3_2_eq.
Qed.

Theorem pack_c_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall c:set, c = pack_c_e X C c 2.
let X C c. apply pack_c_e_2_eq (pack_c_e X C c) X C c. reflexivity.
Qed.

Theorem pack_c_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall c c':set, pack_c_e X C c = pack_c_e X' C' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ c = c'.
let X X' C C' c c'. assume H1.
claim L0: X' = pack_c_e X C c 0.
{ exact pack_c_e_0_eq (pack_c_e X C c) X' C' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_e_0_eq2 X C c. }
apply and3I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_e_1_eq2 X C c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_e_1_eq2 X' C' c' U LU.
- prove c = c'.
  rewrite pack_c_e_2_eq2 X C c.
  rewrite H1. symmetry.
  exact pack_c_e_2_eq2 X' C' c'.
Qed.

Theorem pack_c_e_ext : forall X, forall C C':(set -> prop) -> prop, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 pack_c_e X C c = pack_c_e X C' c.
let X C C' c. assume H1.
prove (X,encode_c X C,c) = (X,encode_c X C',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
reflexivity.
Qed.

Definition struct_c_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall c:set, c :e X -> q (pack_c_e X C c)) -> q S.

Theorem pack_struct_c_e_I: forall X, forall C:(set -> prop) -> prop, forall c:set, c :e X -> struct_c_e (pack_c_e X C c).
let X C c. assume Hc. let q. assume Hq.
exact Hq X C c Hc.
Qed.

Theorem pack_struct_c_e_E2: forall X, forall C:(set -> prop) -> prop, forall c:set, struct_c_e (pack_c_e X C c) -> c :e X.
let X C c. assume H1. apply H1 (fun z => z = pack_c_e X C c -> c :e X).
- let X'. let C'. let c'. assume Hc'.
  assume Heq: pack_c_e X' C' c' = pack_c_e X C c.
  apply pack_c_e_inj X' X C' C c' c Heq.
  assume H. apply H.
  assume HX'X HC'C Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_e_eta: forall S, struct_c_e S -> S = pack_c_e (S 0) (decode_c (S 1)) (S 2).
let S. assume H1. apply H1 (fun z => z = pack_c_e (z 0) (decode_c (z 1)) (z 2)).
let X. let C. let c. assume _.
prove pack_c_e X C c = pack_c_e (pack_c_e X C c 0) (decode_c (pack_c_e X C c 1)) (pack_c_e X C c 2).
rewrite <- pack_c_e_0_eq2 X C c.
rewrite <- pack_c_e_2_eq2 X C c.
apply pack_c_e_ext.
let U. assume HU.
rewrite <- pack_c_e_1_eq2 X C c U HU.
apply iff_refl.
Qed.


Definition unpack_c_e_i : set -> (set -> ((set -> prop) -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (S 2).

Theorem unpack_c_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) -> Phi X C' c = Phi X C c)
  ->
  unpack_c_e_i (pack_c_e X C c) Phi = Phi X C c.
let Phi X C c.
assume HPhi.
prove Phi (pack_c_e X C c 0) (decode_c (pack_c_e X C c 1)) (pack_c_e X C c 2) = Phi X C c.
rewrite <- pack_c_e_0_eq2 X C c.
prove Phi X (decode_c (pack_c_e X C c 1)) (pack_c_e X C c 2) = Phi X C c.
rewrite <- pack_c_e_2_eq2 X C c.
apply HPhi.
let U. assume HU.
prove C U <-> decode_c (pack_c_e X C c 1) U.
rewrite <- pack_c_e_1_eq2 X C c U HU.
apply iff_refl.
Qed.


Definition unpack_c_e_o : set -> (set -> ((set -> prop) -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (S 2).

Theorem unpack_c_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) -> Phi X C' c = Phi X C c)
  ->
  unpack_c_e_o (pack_c_e X C c) Phi = Phi X C c.
let Phi X C c.
assume HPhi.
prove Phi (pack_c_e X C c 0) (decode_c (pack_c_e X C c 1)) (pack_c_e X C c 2) = Phi X C c.
rewrite <- pack_c_e_0_eq2 X C c.
prove Phi X (decode_c (pack_c_e X C c 1)) (pack_c_e X C c 2) = Phi X C c.
rewrite <- pack_c_e_2_eq2 X C c.
apply HPhi.
let U. assume HU.
prove C U <-> decode_c (pack_c_e X C c 1) U.
rewrite <- pack_c_e_1_eq2 X C c U HU.
apply iff_refl.
Qed.


Definition pack_b_b : set -> (set -> set -> set) -> (set -> set -> set) -> set := fun X f g => (X,encode_b X f,encode_b X g).

Theorem pack_b_b_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, S = pack_b_b X f g -> X = S 0.
let S X f g. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_b_b_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, X = pack_b_b X f g 0.
let X f g. apply pack_b_b_0_eq (pack_b_b X f g) X f g. reflexivity.
Qed.

Theorem pack_b_b_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, S = pack_b_b X f g -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g) 1) x y.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall x y :e X, f x y = decode_b (pack_b_b X f g 1) x y.
let X f g. apply pack_b_b_1_eq (pack_b_b X f g) X f g. reflexivity.
Qed.

Theorem pack_b_b_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, S = pack_b_b X f g -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g) 2) x y.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall x y :e X, g x y = decode_b (pack_b_b X f g 2) x y.
let X f g. apply pack_b_b_2_eq (pack_b_b X f g) X f g. reflexivity.
Qed.

Theorem pack_b_b_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, pack_b_b X f g = pack_b_b X' f' g' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y).
let X X' f f' g g'. assume H1.
claim L0: X' = pack_b_b X f g 0.
{ exact pack_b_b_0_eq (pack_b_b X f g) X' f' g' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_0_eq2 X f g. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_1_eq2 X f g x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_1_eq2 X' f' g' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_2_eq2 X f g x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_2_eq2 X' f' g' x Lx y Ly.
Qed.

Theorem pack_b_b_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 pack_b_b X f g = pack_b_b X f' g'.
let X f f' g g'. assume H1. assume H2.
prove (X,encode_b X f,encode_b X g) = (X,encode_b X f',encode_b X g').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_b : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> q (pack_b_b X f g)) -> q S.

Theorem pack_struct_b_b_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> struct_b_b (pack_b_b X f g).
let X f. assume Hf. let g. assume Hg. let q. assume Hq.
exact Hq X f Hf g Hg.
Qed.

Theorem pack_struct_b_b_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, struct_b_b (pack_b_b X f g) -> forall x y :e X, f x y :e X.
let X f g. assume H1. apply H1 (fun z => z = pack_b_b X f g -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'.
  assume Heq: pack_b_b X' f' g' = pack_b_b X f g.
  apply pack_b_b_inj X' X f' f g' g Heq.
  assume H. apply H.
  assume HX'X Hf'f Hg'g.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, struct_b_b (pack_b_b X f g) -> forall x y :e X, g x y :e X.
let X f g. assume H1. apply H1 (fun z => z = pack_b_b X f g -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'.
  assume Heq: pack_b_b X' f' g' = pack_b_b X f g.
  apply pack_b_b_inj X' X f' f g' g Heq.
  assume H. apply H.
  assume HX'X Hf'f Hg'g.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_b_eta: forall S, struct_b_b S -> S = pack_b_b (S 0) (decode_b (S 1)) (decode_b (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_b_b (z 0) (decode_b (z 1)) (decode_b (z 2))).
let X. let f. assume _. let g. assume _.
prove pack_b_b X f g = pack_b_b (pack_b_b X f g 0) (decode_b (pack_b_b X f g 1)) (decode_b (pack_b_b X f g 2)).
rewrite <- pack_b_b_0_eq2 X f g.
apply pack_b_b_ext.
- exact pack_b_b_1_eq2 X f g.
- exact pack_b_b_2_eq2 X f g.
Qed.


Definition unpack_b_b_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)).

Theorem unpack_b_b_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) -> Phi X f' g' = Phi X f g)
  ->
  unpack_b_b_i (pack_b_b X f g) Phi = Phi X f g.
let Phi X f g.
assume HPhi.
prove Phi (pack_b_b X f g 0) (decode_b (pack_b_b X f g 1)) (decode_b (pack_b_b X f g 2)) = Phi X f g.
rewrite <- pack_b_b_0_eq2 X f g.
prove Phi X (decode_b (pack_b_b X f g 1)) (decode_b (pack_b_b X f g 2)) = Phi X f g.
apply HPhi.
- exact pack_b_b_1_eq2 X f g.
- exact pack_b_b_2_eq2 X f g.
Qed.


Definition unpack_b_b_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)).

Theorem unpack_b_b_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) -> Phi X f' g' = Phi X f g)
  ->
  unpack_b_b_o (pack_b_b X f g) Phi = Phi X f g.
let Phi X f g.
assume HPhi.
prove Phi (pack_b_b X f g 0) (decode_b (pack_b_b X f g 1)) (decode_b (pack_b_b X f g 2)) = Phi X f g.
rewrite <- pack_b_b_0_eq2 X f g.
prove Phi X (decode_b (pack_b_b X f g 1)) (decode_b (pack_b_b X f g 2)) = Phi X f g.
apply HPhi.
- exact pack_b_b_1_eq2 X f g.
- exact pack_b_b_2_eq2 X f g.
Qed.


Definition pack_b_u : set -> (set -> set -> set) -> (set -> set) -> set := fun X f i => (X,encode_b X f,encode_u X i).

Theorem pack_b_u_0_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, S = pack_b_u X f i -> X = S 0.
let S X f i. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_u X i) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_b_u_0_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, X = pack_b_u X f i 0.
let X f i. apply pack_b_u_0_eq (pack_b_u X f i) X f i. reflexivity.
Qed.

Theorem pack_b_u_1_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, S = pack_b_u X f i -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f i. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_u X i) 1) x y.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_u_1_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall x y :e X, f x y = decode_b (pack_b_u X f i 1) x y.
let X f i. apply pack_b_u_1_eq (pack_b_u X f i) X f i. reflexivity.
Qed.

Theorem pack_b_u_2_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, S = pack_b_u X f i -> forall x :e X, i x = decode_u (S 2) x.
let S X f i. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_u X i) 2) x.
rewrite tuple_3_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_u_2_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall x :e X, i x = decode_u (pack_b_u X f i 2) x.
let X f i. apply pack_b_u_2_eq (pack_b_u X f i) X f i. reflexivity.
Qed.

Theorem pack_b_u_inj : forall X X', forall f f':set -> set -> set, forall i i':set -> set, pack_b_u X f i = pack_b_u X' f' i' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x).
let X X' f f' i i'. assume H1.
claim L0: X' = pack_b_u X f i 0.
{ exact pack_b_u_0_eq (pack_b_u X f i) X' f' i' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_u_0_eq2 X f i. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_u_1_eq2 X f i x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_1_eq2 X' f' i' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_u_2_eq2 X f i x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_2_eq2 X' f' i' x Lx.
Qed.

Theorem pack_b_u_ext : forall X, forall f f':set -> set -> set, forall i i':set -> set,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 pack_b_u X f i = pack_b_u X f' i'.
let X f f' i i'. assume H1. assume H2.
prove (X,encode_b X f,encode_u X i) = (X,encode_b X f',encode_u X i').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_u : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> q (pack_b_u X f i)) -> q S.

Theorem pack_struct_b_u_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> struct_b_u (pack_b_u X f i).
let X f. assume Hf. let i. assume Hi. let q. assume Hq.
exact Hq X f Hf i Hi.
Qed.

Theorem pack_struct_b_u_E1: forall X, forall f:set -> set -> set, forall i:set -> set, struct_b_u (pack_b_u X f i) -> forall x y :e X, f x y :e X.
let X f i. assume H1. apply H1 (fun z => z = pack_b_u X f i -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'.
  assume Heq: pack_b_u X' f' i' = pack_b_u X f i.
  apply pack_b_u_inj X' X f' f i' i Heq.
  assume H. apply H.
  assume HX'X Hf'f Hi'i.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_u_E2: forall X, forall f:set -> set -> set, forall i:set -> set, struct_b_u (pack_b_u X f i) -> forall x :e X, i x :e X.
let X f i. assume H1. apply H1 (fun z => z = pack_b_u X f i -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'.
  assume Heq: pack_b_u X' f' i' = pack_b_u X f i.
  apply pack_b_u_inj X' X f' f i' i Heq.
  assume H. apply H.
  assume HX'X Hf'f Hi'i.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_b_u_eta: forall S, struct_b_u S -> S = pack_b_u (S 0) (decode_b (S 1)) (decode_u (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_b_u (z 0) (decode_b (z 1)) (decode_u (z 2))).
let X. let f. assume _. let i. assume _.
prove pack_b_u X f i = pack_b_u (pack_b_u X f i 0) (decode_b (pack_b_u X f i 1)) (decode_u (pack_b_u X f i 2)).
rewrite <- pack_b_u_0_eq2 X f i.
apply pack_b_u_ext.
- exact pack_b_u_1_eq2 X f i.
- exact pack_b_u_2_eq2 X f i.
Qed.


Definition unpack_b_u_i : set -> (set -> (set -> set -> set) -> (set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)).

Theorem unpack_b_u_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> set,
  forall X, forall f:set -> set -> set, forall i:set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' i' = Phi X f i)
  ->
  unpack_b_u_i (pack_b_u X f i) Phi = Phi X f i.
let Phi X f i.
assume HPhi.
prove Phi (pack_b_u X f i 0) (decode_b (pack_b_u X f i 1)) (decode_u (pack_b_u X f i 2)) = Phi X f i.
rewrite <- pack_b_u_0_eq2 X f i.
prove Phi X (decode_b (pack_b_u X f i 1)) (decode_u (pack_b_u X f i 2)) = Phi X f i.
apply HPhi.
- exact pack_b_u_1_eq2 X f i.
- exact pack_b_u_2_eq2 X f i.
Qed.


Definition unpack_b_u_o : set -> (set -> (set -> set -> set) -> (set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)).

Theorem unpack_b_u_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> prop,
  forall X, forall f:set -> set -> set, forall i:set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' i' = Phi X f i)
  ->
  unpack_b_u_o (pack_b_u X f i) Phi = Phi X f i.
let Phi X f i.
assume HPhi.
prove Phi (pack_b_u X f i 0) (decode_b (pack_b_u X f i 1)) (decode_u (pack_b_u X f i 2)) = Phi X f i.
rewrite <- pack_b_u_0_eq2 X f i.
prove Phi X (decode_b (pack_b_u X f i 1)) (decode_u (pack_b_u X f i 2)) = Phi X f i.
apply HPhi.
- exact pack_b_u_1_eq2 X f i.
- exact pack_b_u_2_eq2 X f i.
Qed.


Definition pack_b_r : set -> (set -> set -> set) -> (set -> set -> prop) -> set := fun X f R => (X,encode_b X f,encode_r X R).

Theorem pack_b_r_0_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, S = pack_b_r X f R -> X = S 0.
let S X f R. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_r X R) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_b_r_0_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, X = pack_b_r X f R 0.
let X f R. apply pack_b_r_0_eq (pack_b_r X f R) X f R. reflexivity.
Qed.

Theorem pack_b_r_1_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, S = pack_b_r X f R -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_r X R) 1) x y.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_r_1_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, f x y = decode_b (pack_b_r X f R 1) x y.
let X f R. apply pack_b_r_1_eq (pack_b_r X f R) X f R. reflexivity.
Qed.

Theorem pack_b_r_2_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, S = pack_b_r X f R -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X f R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_r X R) 2) x y.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_r_2_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_b_r X f R 2) x y.
let X f R. apply pack_b_r_2_eq (pack_b_r X f R) X f R. reflexivity.
Qed.

Theorem pack_b_r_inj : forall X X', forall f f':set -> set -> set, forall R R':set -> set -> prop, pack_b_r X f R = pack_b_r X' f' R' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, R x y = R' x y).
let X X' f f' R R'. assume H1.
claim L0: X' = pack_b_r X f R 0.
{ exact pack_b_r_0_eq (pack_b_r X f R) X' f' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_r_0_eq2 X f R. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_r_1_eq2 X f R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_1_eq2 X' f' R' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_r_2_eq2 X f R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_2_eq2 X' f' R' x Lx y Ly.
Qed.

Theorem pack_b_r_ext : forall X, forall f f':set -> set -> set, forall R R':set -> set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_b_r X f R = pack_b_r X f' R'.
let X f f' R R'. assume H1. assume H2.
prove (X,encode_b X f,encode_r X R) = (X,encode_b X f',encode_r X R').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, q (pack_b_r X f R)) -> q S.

Theorem pack_struct_b_r_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, struct_b_r (pack_b_r X f R).
let X f. assume Hf. let R q. assume Hq.
exact Hq X f Hf R.
Qed.

Theorem pack_struct_b_r_E1: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, struct_b_r (pack_b_r X f R) -> forall x y :e X, f x y :e X.
let X f R. assume H1. apply H1 (fun z => z = pack_b_r X f R -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let R'.
  assume Heq: pack_b_r X' f' R' = pack_b_r X f R.
  apply pack_b_r_inj X' X f' f R' R Heq.
  assume H. apply H.
  assume HX'X Hf'f HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_r_eta: forall S, struct_b_r S -> S = pack_b_r (S 0) (decode_b (S 1)) (decode_r (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_b_r (z 0) (decode_b (z 1)) (decode_r (z 2))).
let X. let f. assume _. let R.
prove pack_b_r X f R = pack_b_r (pack_b_r X f R 0) (decode_b (pack_b_r X f R 1)) (decode_r (pack_b_r X f R 2)).
rewrite <- pack_b_r_0_eq2 X f R.
apply pack_b_r_ext.
- exact pack_b_r_1_eq2 X f R.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_r_2_eq2 X f R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_r_i : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)).

Theorem unpack_b_r_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' R' = Phi X f R)
  ->
  unpack_b_r_i (pack_b_r X f R) Phi = Phi X f R.
let Phi X f R.
assume HPhi.
prove Phi (pack_b_r X f R 0) (decode_b (pack_b_r X f R 1)) (decode_r (pack_b_r X f R 2)) = Phi X f R.
rewrite <- pack_b_r_0_eq2 X f R.
prove Phi X (decode_b (pack_b_r X f R 1)) (decode_r (pack_b_r X f R 2)) = Phi X f R.
apply HPhi.
- exact pack_b_r_1_eq2 X f R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r X f R 2) x y.
  rewrite <- pack_b_r_2_eq2 X f R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_r_o : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)).

Theorem unpack_b_r_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' R' = Phi X f R)
  ->
  unpack_b_r_o (pack_b_r X f R) Phi = Phi X f R.
let Phi X f R.
assume HPhi.
prove Phi (pack_b_r X f R 0) (decode_b (pack_b_r X f R 1)) (decode_r (pack_b_r X f R 2)) = Phi X f R.
rewrite <- pack_b_r_0_eq2 X f R.
prove Phi X (decode_b (pack_b_r X f R 1)) (decode_r (pack_b_r X f R 2)) = Phi X f R.
apply HPhi.
- exact pack_b_r_1_eq2 X f R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r X f R 2) x y.
  rewrite <- pack_b_r_2_eq2 X f R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_p : set -> (set -> set -> set) -> (set -> prop) -> set := fun X f P => (X,encode_b X f,encode_p X P).

Theorem pack_b_p_0_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, S = pack_b_p X f P -> X = S 0.
let S X f P. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_p X P) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_b_p_0_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, X = pack_b_p X f P 0.
let X f P. apply pack_b_p_0_eq (pack_b_p X f P) X f P. reflexivity.
Qed.

Theorem pack_b_p_1_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, S = pack_b_p X f P -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_p X P) 1) x y.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_p_1_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_b_p X f P 1) x y.
let X f P. apply pack_b_p_1_eq (pack_b_p X f P) X f P. reflexivity.
Qed.

Theorem pack_b_p_2_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, S = pack_b_p X f P -> forall x :e X, P x = decode_p (S 2) x.
let S X f P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_p X P) 2) x.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_p_2_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall x :e X, P x = decode_p (pack_b_p X f P 2) x.
let X f P. apply pack_b_p_2_eq (pack_b_p X f P) X f P. reflexivity.
Qed.

Theorem pack_b_p_inj : forall X X', forall f f':set -> set -> set, forall P P':set -> prop, pack_b_p X f P = pack_b_p X' f' P' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, P x = P' x).
let X X' f f' P P'. assume H1.
claim L0: X' = pack_b_p X f P 0.
{ exact pack_b_p_0_eq (pack_b_p X f P) X' f' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_p_0_eq2 X f P. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_p_1_eq2 X f P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_p_1_eq2 X' f' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_p_2_eq2 X f P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_p_2_eq2 X' f' P' x Lx.
Qed.

Theorem pack_b_p_ext : forall X, forall f f':set -> set -> set, forall P P':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_p X f P = pack_b_p X f' P'.
let X f f' P P'. assume H1. assume H2.
prove (X,encode_b X f,encode_p X P) = (X,encode_b X f',encode_p X P').
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, q (pack_b_p X f P)) -> q S.

Theorem pack_struct_b_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, struct_b_p (pack_b_p X f P).
let X f. assume Hf. let P q. assume Hq.
exact Hq X f Hf P.
Qed.

Theorem pack_struct_b_p_E1: forall X, forall f:set -> set -> set, forall P:set -> prop, struct_b_p (pack_b_p X f P) -> forall x y :e X, f x y :e X.
let X f P. assume H1. apply H1 (fun z => z = pack_b_p X f P -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let P'.
  assume Heq: pack_b_p X' f' P' = pack_b_p X f P.
  apply pack_b_p_inj X' X f' f P' P Heq.
  assume H. apply H.
  assume HX'X Hf'f HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_p_eta: forall S, struct_b_p S -> S = pack_b_p (S 0) (decode_b (S 1)) (decode_p (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_b_p (z 0) (decode_b (z 1)) (decode_p (z 2))).
let X. let f. assume _. let P.
prove pack_b_p X f P = pack_b_p (pack_b_p X f P 0) (decode_b (pack_b_p X f P 1)) (decode_p (pack_b_p X f P 2)).
rewrite <- pack_b_p_0_eq2 X f P.
apply pack_b_p_ext.
- exact pack_b_p_1_eq2 X f P.
- let x. assume Hx.
  rewrite <- pack_b_p_2_eq2 X f P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_p_i : set -> (set -> (set -> set -> set) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_p (S 2)).

Theorem unpack_b_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' P' = Phi X f P)
  ->
  unpack_b_p_i (pack_b_p X f P) Phi = Phi X f P.
let Phi X f P.
assume HPhi.
prove Phi (pack_b_p X f P 0) (decode_b (pack_b_p X f P 1)) (decode_p (pack_b_p X f P 2)) = Phi X f P.
rewrite <- pack_b_p_0_eq2 X f P.
prove Phi X (decode_b (pack_b_p X f P 1)) (decode_p (pack_b_p X f P 2)) = Phi X f P.
apply HPhi.
- exact pack_b_p_1_eq2 X f P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_p X f P 2) x.
  rewrite <- pack_b_p_2_eq2 X f P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_p_o : set -> (set -> (set -> set -> set) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_p (S 2)).

Theorem unpack_b_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' P' = Phi X f P)
  ->
  unpack_b_p_o (pack_b_p X f P) Phi = Phi X f P.
let Phi X f P.
assume HPhi.
prove Phi (pack_b_p X f P 0) (decode_b (pack_b_p X f P 1)) (decode_p (pack_b_p X f P 2)) = Phi X f P.
rewrite <- pack_b_p_0_eq2 X f P.
prove Phi X (decode_b (pack_b_p X f P 1)) (decode_p (pack_b_p X f P 2)) = Phi X f P.
apply HPhi.
- exact pack_b_p_1_eq2 X f P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_p X f P 2) x.
  rewrite <- pack_b_p_2_eq2 X f P x Hx.
  apply iff_refl.
Qed.


Definition pack_b_e : set -> (set -> set -> set) -> set -> set := fun X f c => (X,encode_b X f,c).

Theorem pack_b_e_0_eq: forall S X, forall f:set -> set -> set, forall c:set, S = pack_b_e X f c -> X = S 0.
let S X f c. assume H1. rewrite H1.
prove X = (X,encode_b X f,c) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_b_e_0_eq2: forall X, forall f:set -> set -> set, forall c:set, X = pack_b_e X f c 0.
let X f c. apply pack_b_e_0_eq (pack_b_e X f c) X f c. reflexivity.
Qed.

Theorem pack_b_e_1_eq: forall S X, forall f:set -> set -> set, forall c:set, S = pack_b_e X f c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,c) 1) x y.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_e_1_eq2: forall X, forall f:set -> set -> set, forall c:set, forall x y :e X, f x y = decode_b (pack_b_e X f c 1) x y.
let X f c. apply pack_b_e_1_eq (pack_b_e X f c) X f c. reflexivity.
Qed.

Theorem pack_b_e_2_eq: forall S X, forall f:set -> set -> set, forall c:set, S = pack_b_e X f c -> c = S 2.
let S X f c. assume H1.
rewrite H1. prove c = (X,encode_b X f,c) 2. symmetry. apply tuple_3_2_eq.
Qed.

Theorem pack_b_e_2_eq2: forall X, forall f:set -> set -> set, forall c:set, c = pack_b_e X f c 2.
let X f c. apply pack_b_e_2_eq (pack_b_e X f c) X f c. reflexivity.
Qed.

Theorem pack_b_e_inj : forall X X', forall f f':set -> set -> set, forall c c':set, pack_b_e X f c = pack_b_e X' f' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ c = c'.
let X X' f f' c c'. assume H1.
claim L0: X' = pack_b_e X f c 0.
{ exact pack_b_e_0_eq (pack_b_e X f c) X' f' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_e_0_eq2 X f c. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_e_1_eq2 X f c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_e_1_eq2 X' f' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_b_e_2_eq2 X f c.
  rewrite H1. symmetry.
  exact pack_b_e_2_eq2 X' f' c'.
Qed.

Theorem pack_b_e_ext : forall X, forall f f':set -> set -> set, forall c,
 (forall x y :e X, f x y = f' x y) ->
 pack_b_e X f c = pack_b_e X f' c.
let X f f' c. assume H1.
prove (X,encode_b X f,c) = (X,encode_b X f',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
reflexivity.
Qed.

Definition struct_b_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall c:set, c :e X -> q (pack_b_e X f c)) -> q S.

Theorem pack_struct_b_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall c:set, c :e X -> struct_b_e (pack_b_e X f c).
let X f. assume Hf. let c. assume Hc. let q. assume Hq.
exact Hq X f Hf c Hc.
Qed.

Theorem pack_struct_b_e_E1: forall X, forall f:set -> set -> set, forall c:set, struct_b_e (pack_b_e X f c) -> forall x y :e X, f x y :e X.
let X f c. assume H1. apply H1 (fun z => z = pack_b_e X f c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let c'. assume Hc'.
  assume Heq: pack_b_e X' f' c' = pack_b_e X f c.
  apply pack_b_e_inj X' X f' f c' c Heq.
  assume H. apply H.
  assume HX'X Hf'f Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_e_E2: forall X, forall f:set -> set -> set, forall c:set, struct_b_e (pack_b_e X f c) -> c :e X.
let X f c. assume H1. apply H1 (fun z => z = pack_b_e X f c -> c :e X).
- let X'. let f'. assume Hf'. let c'. assume Hc'.
  assume Heq: pack_b_e X' f' c' = pack_b_e X f c.
  apply pack_b_e_inj X' X f' f c' c Heq.
  assume H. apply H.
  assume HX'X Hf'f Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_e_eta: forall S, struct_b_e S -> S = pack_b_e (S 0) (decode_b (S 1)) (S 2).
let S. assume H1. apply H1 (fun z => z = pack_b_e (z 0) (decode_b (z 1)) (z 2)).
let X. let f. assume _. let c. assume _.
prove pack_b_e X f c = pack_b_e (pack_b_e X f c 0) (decode_b (pack_b_e X f c 1)) (pack_b_e X f c 2).
rewrite <- pack_b_e_0_eq2 X f c.
rewrite <- pack_b_e_2_eq2 X f c.
apply pack_b_e_ext.
exact pack_b_e_1_eq2 X f c.
Qed.


Definition unpack_b_e_i : set -> (set -> (set -> set -> set) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (S 2).

Theorem unpack_b_e_i_eq : forall Phi:set -> (set -> set -> set) -> set -> set,
  forall X, forall f:set -> set -> set, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) -> Phi X f' c = Phi X f c)
  ->
  unpack_b_e_i (pack_b_e X f c) Phi = Phi X f c.
let Phi X f c.
assume HPhi.
prove Phi (pack_b_e X f c 0) (decode_b (pack_b_e X f c 1)) (pack_b_e X f c 2) = Phi X f c.
rewrite <- pack_b_e_0_eq2 X f c.
prove Phi X (decode_b (pack_b_e X f c 1)) (pack_b_e X f c 2) = Phi X f c.
rewrite <- pack_b_e_2_eq2 X f c.
apply HPhi.
exact pack_b_e_1_eq2 X f c.
Qed.


Definition unpack_b_e_o : set -> (set -> (set -> set -> set) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (S 2).

Theorem unpack_b_e_o_eq : forall Phi:set -> (set -> set -> set) -> set -> prop,
  forall X, forall f:set -> set -> set, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) -> Phi X f' c = Phi X f c)
  ->
  unpack_b_e_o (pack_b_e X f c) Phi = Phi X f c.
let Phi X f c.
assume HPhi.
prove Phi (pack_b_e X f c 0) (decode_b (pack_b_e X f c 1)) (pack_b_e X f c 2) = Phi X f c.
rewrite <- pack_b_e_0_eq2 X f c.
prove Phi X (decode_b (pack_b_e X f c 1)) (pack_b_e X f c 2) = Phi X f c.
rewrite <- pack_b_e_2_eq2 X f c.
apply HPhi.
exact pack_b_e_1_eq2 X f c.
Qed.


Definition pack_u_u : set -> (set -> set) -> (set -> set) -> set := fun X i j => (X,encode_u X i,encode_u X j).

Theorem pack_u_u_0_eq: forall S X, forall i:set -> set, forall j:set -> set, S = pack_u_u X i j -> X = S 0.
let S X i j. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_u X j) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_u_u_0_eq2: forall X, forall i:set -> set, forall j:set -> set, X = pack_u_u X i j 0.
let X i j. apply pack_u_u_0_eq (pack_u_u X i j) X i j. reflexivity.
Qed.

Theorem pack_u_u_1_eq: forall S X, forall i:set -> set, forall j:set -> set, S = pack_u_u X i j -> forall x :e X, i x = decode_u (S 1) x.
let S X i j. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_u X j) 1) x.
rewrite tuple_3_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_u_1_eq2: forall X, forall i:set -> set, forall j:set -> set, forall x :e X, i x = decode_u (pack_u_u X i j 1) x.
let X i j. apply pack_u_u_1_eq (pack_u_u X i j) X i j. reflexivity.
Qed.

Theorem pack_u_u_2_eq: forall S X, forall i:set -> set, forall j:set -> set, S = pack_u_u X i j -> forall x :e X, j x = decode_u (S 2) x.
let S X i j. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_u X i,encode_u X j) 2) x.
rewrite tuple_3_2_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_u_u_2_eq2: forall X, forall i:set -> set, forall j:set -> set, forall x :e X, j x = decode_u (pack_u_u X i j 2) x.
let X i j. apply pack_u_u_2_eq (pack_u_u X i j) X i j. reflexivity.
Qed.

Theorem pack_u_u_inj : forall X X', forall i i':set -> set, forall j j':set -> set, pack_u_u X i j = pack_u_u X' i' j' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x).
let X X' i i' j j'. assume H1.
claim L0: X' = pack_u_u X i j 0.
{ exact pack_u_u_0_eq (pack_u_u X i j) X' i' j' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_u_0_eq2 X i j. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_u_1_eq2 X i j x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_1_eq2 X' i' j' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_u_u_2_eq2 X i j x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_2_eq2 X' i' j' x Lx.
Qed.

Theorem pack_u_u_ext : forall X, forall i i':set -> set, forall j j':set -> set,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 pack_u_u X i j = pack_u_u X i' j'.
let X i i' j j'. assume H1. assume H2.
prove (X,encode_u X i,encode_u X j) = (X,encode_u X i',encode_u X j').
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X j = encode_u X j'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_u_u : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> q (pack_u_u X i j)) -> q S.

Theorem pack_struct_u_u_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> struct_u_u (pack_u_u X i j).
let X i. assume Hi. let j. assume Hj. let q. assume Hq.
exact Hq X i Hi j Hj.
Qed.

Theorem pack_struct_u_u_E1: forall X, forall i:set -> set, forall j:set -> set, struct_u_u (pack_u_u X i j) -> forall x :e X, i x :e X.
let X i j. assume H1. apply H1 (fun z => z = pack_u_u X i j -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'.
  assume Heq: pack_u_u X' i' j' = pack_u_u X i j.
  apply pack_u_u_inj X' X i' i j' j Heq.
  assume H. apply H.
  assume HX'X Hi'i Hj'j.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_E2: forall X, forall i:set -> set, forall j:set -> set, struct_u_u (pack_u_u X i j) -> forall x :e X, j x :e X.
let X i j. assume H1. apply H1 (fun z => z = pack_u_u X i j -> forall x :e X, j x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'.
  assume Heq: pack_u_u X' i' j' = pack_u_u X i j.
  apply pack_u_u_inj X' X i' i j' j Heq.
  assume H. apply H.
  assume HX'X Hi'i Hj'j.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem struct_u_u_eta: forall S, struct_u_u S -> S = pack_u_u (S 0) (decode_u (S 1)) (decode_u (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_u_u (z 0) (decode_u (z 1)) (decode_u (z 2))).
let X. let i. assume _. let j. assume _.
prove pack_u_u X i j = pack_u_u (pack_u_u X i j 0) (decode_u (pack_u_u X i j 1)) (decode_u (pack_u_u X i j 2)).
rewrite <- pack_u_u_0_eq2 X i j.
apply pack_u_u_ext.
- exact pack_u_u_1_eq2 X i j.
- exact pack_u_u_2_eq2 X i j.
Qed.


Definition unpack_u_u_i : set -> (set -> (set -> set) -> (set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)).

Theorem unpack_u_u_i_eq : forall Phi:set -> (set -> set) -> (set -> set) -> set,
  forall X, forall i:set -> set, forall j:set -> set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) -> Phi X i' j' = Phi X i j)
  ->
  unpack_u_u_i (pack_u_u X i j) Phi = Phi X i j.
let Phi X i j.
assume HPhi.
prove Phi (pack_u_u X i j 0) (decode_u (pack_u_u X i j 1)) (decode_u (pack_u_u X i j 2)) = Phi X i j.
rewrite <- pack_u_u_0_eq2 X i j.
prove Phi X (decode_u (pack_u_u X i j 1)) (decode_u (pack_u_u X i j 2)) = Phi X i j.
apply HPhi.
- exact pack_u_u_1_eq2 X i j.
- exact pack_u_u_2_eq2 X i j.
Qed.


Definition unpack_u_u_o : set -> (set -> (set -> set) -> (set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)).

Theorem unpack_u_u_o_eq : forall Phi:set -> (set -> set) -> (set -> set) -> prop,
  forall X, forall i:set -> set, forall j:set -> set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) -> Phi X i' j' = Phi X i j)
  ->
  unpack_u_u_o (pack_u_u X i j) Phi = Phi X i j.
let Phi X i j.
assume HPhi.
prove Phi (pack_u_u X i j 0) (decode_u (pack_u_u X i j 1)) (decode_u (pack_u_u X i j 2)) = Phi X i j.
rewrite <- pack_u_u_0_eq2 X i j.
prove Phi X (decode_u (pack_u_u X i j 1)) (decode_u (pack_u_u X i j 2)) = Phi X i j.
apply HPhi.
- exact pack_u_u_1_eq2 X i j.
- exact pack_u_u_2_eq2 X i j.
Qed.


Definition pack_u_r : set -> (set -> set) -> (set -> set -> prop) -> set := fun X i R => (X,encode_u X i,encode_r X R).

Theorem pack_u_r_0_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, S = pack_u_r X i R -> X = S 0.
let S X i R. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_r X R) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_u_r_0_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, X = pack_u_r X i R 0.
let X i R. apply pack_u_r_0_eq (pack_u_r X i R) X i R. reflexivity.
Qed.

Theorem pack_u_r_1_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, S = pack_u_r X i R -> forall x :e X, i x = decode_u (S 1) x.
let S X i R. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_r X R) 1) x.
rewrite tuple_3_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_r_1_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall x :e X, i x = decode_u (pack_u_r X i R 1) x.
let X i R. apply pack_u_r_1_eq (pack_u_r X i R) X i R. reflexivity.
Qed.

Theorem pack_u_r_2_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, S = pack_u_r X i R -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X i R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_u X i,encode_r X R) 2) x y.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_u_r_2_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_u_r X i R 2) x y.
let X i R. apply pack_u_r_2_eq (pack_u_r X i R) X i R. reflexivity.
Qed.

Theorem pack_u_r_inj : forall X X', forall i i':set -> set, forall R R':set -> set -> prop, pack_u_r X i R = pack_u_r X' i' R' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y).
let X X' i i' R R'. assume H1.
claim L0: X' = pack_u_r X i R 0.
{ exact pack_u_r_0_eq (pack_u_r X i R) X' i' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_r_0_eq2 X i R. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_r_1_eq2 X i R x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_r_1_eq2 X' i' R' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_u_r_2_eq2 X i R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_r_2_eq2 X' i' R' x Lx y Ly.
Qed.

Theorem pack_u_r_ext : forall X, forall i i':set -> set, forall R R':set -> set -> prop,
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_u_r X i R = pack_u_r X i' R'.
let X i i' R R'. assume H1. assume H2.
prove (X,encode_u X i,encode_r X R) = (X,encode_u X i',encode_r X R').
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_u_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, q (pack_u_r X i R)) -> q S.

Theorem pack_struct_u_r_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, struct_u_r (pack_u_r X i R).
let X i. assume Hi. let R q. assume Hq.
exact Hq X i Hi R.
Qed.

Theorem pack_struct_u_r_E1: forall X, forall i:set -> set, forall R:set -> set -> prop, struct_u_r (pack_u_r X i R) -> forall x :e X, i x :e X.
let X i R. assume H1. apply H1 (fun z => z = pack_u_r X i R -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let R'.
  assume Heq: pack_u_r X' i' R' = pack_u_r X i R.
  apply pack_u_r_inj X' X i' i R' R Heq.
  assume H. apply H.
  assume HX'X Hi'i HR'R.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_u_r_eta: forall S, struct_u_r S -> S = pack_u_r (S 0) (decode_u (S 1)) (decode_r (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_u_r (z 0) (decode_u (z 1)) (decode_r (z 2))).
let X. let i. assume _. let R.
prove pack_u_r X i R = pack_u_r (pack_u_r X i R 0) (decode_u (pack_u_r X i R 1)) (decode_r (pack_u_r X i R 2)).
rewrite <- pack_u_r_0_eq2 X i R.
apply pack_u_r_ext.
- exact pack_u_r_1_eq2 X i R.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_r_2_eq2 X i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_r_i : set -> (set -> (set -> set) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)).

Theorem unpack_u_r_i_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> set,
  forall X, forall i:set -> set, forall R:set -> set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X i' R' = Phi X i R)
  ->
  unpack_u_r_i (pack_u_r X i R) Phi = Phi X i R.
let Phi X i R.
assume HPhi.
prove Phi (pack_u_r X i R 0) (decode_u (pack_u_r X i R 1)) (decode_r (pack_u_r X i R 2)) = Phi X i R.
rewrite <- pack_u_r_0_eq2 X i R.
prove Phi X (decode_u (pack_u_r X i R 1)) (decode_r (pack_u_r X i R 2)) = Phi X i R.
apply HPhi.
- exact pack_u_r_1_eq2 X i R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r X i R 2) x y.
  rewrite <- pack_u_r_2_eq2 X i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_r_o : set -> (set -> (set -> set) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)).

Theorem unpack_u_r_o_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> prop,
  forall X, forall i:set -> set, forall R:set -> set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X i' R' = Phi X i R)
  ->
  unpack_u_r_o (pack_u_r X i R) Phi = Phi X i R.
let Phi X i R.
assume HPhi.
prove Phi (pack_u_r X i R 0) (decode_u (pack_u_r X i R 1)) (decode_r (pack_u_r X i R 2)) = Phi X i R.
rewrite <- pack_u_r_0_eq2 X i R.
prove Phi X (decode_u (pack_u_r X i R 1)) (decode_r (pack_u_r X i R 2)) = Phi X i R.
apply HPhi.
- exact pack_u_r_1_eq2 X i R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r X i R 2) x y.
  rewrite <- pack_u_r_2_eq2 X i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_u_p : set -> (set -> set) -> (set -> prop) -> set := fun X i P => (X,encode_u X i,encode_p X P).

Theorem pack_u_p_0_eq: forall S X, forall i:set -> set, forall P:set -> prop, S = pack_u_p X i P -> X = S 0.
let S X i P. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_p X P) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_u_p_0_eq2: forall X, forall i:set -> set, forall P:set -> prop, X = pack_u_p X i P 0.
let X i P. apply pack_u_p_0_eq (pack_u_p X i P) X i P. reflexivity.
Qed.

Theorem pack_u_p_1_eq: forall S X, forall i:set -> set, forall P:set -> prop, S = pack_u_p X i P -> forall x :e X, i x = decode_u (S 1) x.
let S X i P. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_p X P) 1) x.
rewrite tuple_3_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_p_1_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall x :e X, i x = decode_u (pack_u_p X i P 1) x.
let X i P. apply pack_u_p_1_eq (pack_u_p X i P) X i P. reflexivity.
Qed.

Theorem pack_u_p_2_eq: forall S X, forall i:set -> set, forall P:set -> prop, S = pack_u_p X i P -> forall x :e X, P x = decode_p (S 2) x.
let S X i P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_u X i,encode_p X P) 2) x.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_u_p_2_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall x :e X, P x = decode_p (pack_u_p X i P 2) x.
let X i P. apply pack_u_p_2_eq (pack_u_p X i P) X i P. reflexivity.
Qed.

Theorem pack_u_p_inj : forall X X', forall i i':set -> set, forall P P':set -> prop, pack_u_p X i P = pack_u_p X' i' P' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x).
let X X' i i' P P'. assume H1.
claim L0: X' = pack_u_p X i P 0.
{ exact pack_u_p_0_eq (pack_u_p X i P) X' i' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_p_0_eq2 X i P. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_p_1_eq2 X i P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_p_1_eq2 X' i' P' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_u_p_2_eq2 X i P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_p_2_eq2 X' i' P' x Lx.
Qed.

Theorem pack_u_p_ext : forall X, forall i i':set -> set, forall P P':set -> prop,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_u_p X i P = pack_u_p X i' P'.
let X i i' P P'. assume H1. assume H2.
prove (X,encode_u X i,encode_p X P) = (X,encode_u X i',encode_p X P').
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_u_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, q (pack_u_p X i P)) -> q S.

Theorem pack_struct_u_p_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, struct_u_p (pack_u_p X i P).
let X i. assume Hi. let P q. assume Hq.
exact Hq X i Hi P.
Qed.

Theorem pack_struct_u_p_E1: forall X, forall i:set -> set, forall P:set -> prop, struct_u_p (pack_u_p X i P) -> forall x :e X, i x :e X.
let X i P. assume H1. apply H1 (fun z => z = pack_u_p X i P -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let P'.
  assume Heq: pack_u_p X' i' P' = pack_u_p X i P.
  apply pack_u_p_inj X' X i' i P' P Heq.
  assume H. apply H.
  assume HX'X Hi'i HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_u_p_eta: forall S, struct_u_p S -> S = pack_u_p (S 0) (decode_u (S 1)) (decode_p (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_u_p (z 0) (decode_u (z 1)) (decode_p (z 2))).
let X. let i. assume _. let P.
prove pack_u_p X i P = pack_u_p (pack_u_p X i P 0) (decode_u (pack_u_p X i P 1)) (decode_p (pack_u_p X i P 2)).
rewrite <- pack_u_p_0_eq2 X i P.
apply pack_u_p_ext.
- exact pack_u_p_1_eq2 X i P.
- let x. assume Hx.
  rewrite <- pack_u_p_2_eq2 X i P x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_p_i : set -> (set -> (set -> set) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_p (S 2)).

Theorem unpack_u_p_i_eq : forall Phi:set -> (set -> set) -> (set -> prop) -> set,
  forall X, forall i:set -> set, forall P:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' P' = Phi X i P)
  ->
  unpack_u_p_i (pack_u_p X i P) Phi = Phi X i P.
let Phi X i P.
assume HPhi.
prove Phi (pack_u_p X i P 0) (decode_u (pack_u_p X i P 1)) (decode_p (pack_u_p X i P 2)) = Phi X i P.
rewrite <- pack_u_p_0_eq2 X i P.
prove Phi X (decode_u (pack_u_p X i P 1)) (decode_p (pack_u_p X i P 2)) = Phi X i P.
apply HPhi.
- exact pack_u_p_1_eq2 X i P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_p X i P 2) x.
  rewrite <- pack_u_p_2_eq2 X i P x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_p_o : set -> (set -> (set -> set) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_p (S 2)).

Theorem unpack_u_p_o_eq : forall Phi:set -> (set -> set) -> (set -> prop) -> prop,
  forall X, forall i:set -> set, forall P:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' P' = Phi X i P)
  ->
  unpack_u_p_o (pack_u_p X i P) Phi = Phi X i P.
let Phi X i P.
assume HPhi.
prove Phi (pack_u_p X i P 0) (decode_u (pack_u_p X i P 1)) (decode_p (pack_u_p X i P 2)) = Phi X i P.
rewrite <- pack_u_p_0_eq2 X i P.
prove Phi X (decode_u (pack_u_p X i P 1)) (decode_p (pack_u_p X i P 2)) = Phi X i P.
apply HPhi.
- exact pack_u_p_1_eq2 X i P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_p X i P 2) x.
  rewrite <- pack_u_p_2_eq2 X i P x Hx.
  apply iff_refl.
Qed.


Definition pack_u_e : set -> (set -> set) -> set -> set := fun X i c => (X,encode_u X i,c).

Theorem pack_u_e_0_eq: forall S X, forall i:set -> set, forall c:set, S = pack_u_e X i c -> X = S 0.
let S X i c. assume H1. rewrite H1.
prove X = (X,encode_u X i,c) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_u_e_0_eq2: forall X, forall i:set -> set, forall c:set, X = pack_u_e X i c 0.
let X i c. apply pack_u_e_0_eq (pack_u_e X i c) X i c. reflexivity.
Qed.

Theorem pack_u_e_1_eq: forall S X, forall i:set -> set, forall c:set, S = pack_u_e X i c -> forall x :e X, i x = decode_u (S 1) x.
let S X i c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,c) 1) x.
rewrite tuple_3_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_e_1_eq2: forall X, forall i:set -> set, forall c:set, forall x :e X, i x = decode_u (pack_u_e X i c 1) x.
let X i c. apply pack_u_e_1_eq (pack_u_e X i c) X i c. reflexivity.
Qed.

Theorem pack_u_e_2_eq: forall S X, forall i:set -> set, forall c:set, S = pack_u_e X i c -> c = S 2.
let S X i c. assume H1.
rewrite H1. prove c = (X,encode_u X i,c) 2. symmetry. apply tuple_3_2_eq.
Qed.

Theorem pack_u_e_2_eq2: forall X, forall i:set -> set, forall c:set, c = pack_u_e X i c 2.
let X i c. apply pack_u_e_2_eq (pack_u_e X i c) X i c. reflexivity.
Qed.

Theorem pack_u_e_inj : forall X X', forall i i':set -> set, forall c c':set, pack_u_e X i c = pack_u_e X' i' c' -> X = X' /\ (forall x :e X, i x = i' x) /\ c = c'.
let X X' i i' c c'. assume H1.
claim L0: X' = pack_u_e X i c 0.
{ exact pack_u_e_0_eq (pack_u_e X i c) X' i' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_e_0_eq2 X i c. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_e_1_eq2 X i c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_e_1_eq2 X' i' c' x Lx.
- prove c = c'.
  rewrite pack_u_e_2_eq2 X i c.
  rewrite H1. symmetry.
  exact pack_u_e_2_eq2 X' i' c'.
Qed.

Theorem pack_u_e_ext : forall X, forall i i':set -> set, forall c,
 (forall x :e X, i x = i' x) ->
 pack_u_e X i c = pack_u_e X i' c.
let X i i' c. assume H1.
prove (X,encode_u X i,c) = (X,encode_u X i',c).
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
reflexivity.
Qed.

Definition struct_u_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> q (pack_u_e X i c)) -> q S.

Theorem pack_struct_u_e_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> struct_u_e (pack_u_e X i c).
let X i. assume Hi. let c. assume Hc. let q. assume Hq.
exact Hq X i Hi c Hc.
Qed.

Theorem pack_struct_u_e_E1: forall X, forall i:set -> set, forall c:set, struct_u_e (pack_u_e X i c) -> forall x :e X, i x :e X.
let X i c. assume H1. apply H1 (fun z => z = pack_u_e X i c -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_u_e X' i' c' = pack_u_e X i c.
  apply pack_u_e_inj X' X i' i c' c Heq.
  assume H. apply H.
  assume HX'X Hi'i Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_e_E2: forall X, forall i:set -> set, forall c:set, struct_u_e (pack_u_e X i c) -> c :e X.
let X i c. assume H1. apply H1 (fun z => z = pack_u_e X i c -> c :e X).
- let X'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_u_e X' i' c' = pack_u_e X i c.
  apply pack_u_e_inj X' X i' i c' c Heq.
  assume H. apply H.
  assume HX'X Hi'i Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_u_e_eta: forall S, struct_u_e S -> S = pack_u_e (S 0) (decode_u (S 1)) (S 2).
let S. assume H1. apply H1 (fun z => z = pack_u_e (z 0) (decode_u (z 1)) (z 2)).
let X. let i. assume _. let c. assume _.
prove pack_u_e X i c = pack_u_e (pack_u_e X i c 0) (decode_u (pack_u_e X i c 1)) (pack_u_e X i c 2).
rewrite <- pack_u_e_0_eq2 X i c.
rewrite <- pack_u_e_2_eq2 X i c.
apply pack_u_e_ext.
exact pack_u_e_1_eq2 X i c.
Qed.


Definition unpack_u_e_i : set -> (set -> (set -> set) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (S 2).

Theorem unpack_u_e_i_eq : forall Phi:set -> (set -> set) -> set -> set,
  forall X, forall i:set -> set, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X i' c = Phi X i c)
  ->
  unpack_u_e_i (pack_u_e X i c) Phi = Phi X i c.
let Phi X i c.
assume HPhi.
prove Phi (pack_u_e X i c 0) (decode_u (pack_u_e X i c 1)) (pack_u_e X i c 2) = Phi X i c.
rewrite <- pack_u_e_0_eq2 X i c.
prove Phi X (decode_u (pack_u_e X i c 1)) (pack_u_e X i c 2) = Phi X i c.
rewrite <- pack_u_e_2_eq2 X i c.
apply HPhi.
exact pack_u_e_1_eq2 X i c.
Qed.


Definition unpack_u_e_o : set -> (set -> (set -> set) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (S 2).

Theorem unpack_u_e_o_eq : forall Phi:set -> (set -> set) -> set -> prop,
  forall X, forall i:set -> set, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X i' c = Phi X i c)
  ->
  unpack_u_e_o (pack_u_e X i c) Phi = Phi X i c.
let Phi X i c.
assume HPhi.
prove Phi (pack_u_e X i c 0) (decode_u (pack_u_e X i c 1)) (pack_u_e X i c 2) = Phi X i c.
rewrite <- pack_u_e_0_eq2 X i c.
prove Phi X (decode_u (pack_u_e X i c 1)) (pack_u_e X i c 2) = Phi X i c.
rewrite <- pack_u_e_2_eq2 X i c.
apply HPhi.
exact pack_u_e_1_eq2 X i c.
Qed.


Definition pack_r_r : set -> (set -> set -> prop) -> (set -> set -> prop) -> set := fun X R T => (X,encode_r X R,encode_r X T).

Theorem pack_r_r_0_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_r_r X R T -> X = S 0.
let S X R T. assume H1. rewrite H1.
prove X = (X,encode_r X R,encode_r X T) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_r_r_0_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, X = pack_r_r X R T 0.
let X R T. apply pack_r_r_0_eq (pack_r_r X R T) X R T. reflexivity.
Qed.

Theorem pack_r_r_1_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_r_r X R T -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_r X R,encode_r X T) 1) x y.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_r_1_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_r_r X R T 1) x y.
let X R T. apply pack_r_r_1_eq (pack_r_r X R T) X R T. reflexivity.
Qed.

Theorem pack_r_r_2_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, S = pack_r_r X R T -> forall x y :e X, T x y = decode_r (S 2) x y.
let S X R T. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_r X R,encode_r X T) 2) x y.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_r_r_2_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall x y :e X, T x y = decode_r (pack_r_r X R T 2) x y.
let X R T. apply pack_r_r_2_eq (pack_r_r X R T) X R T. reflexivity.
Qed.

Theorem pack_r_r_inj : forall X X', forall R R':set -> set -> prop, forall T T':set -> set -> prop, pack_r_r X R T = pack_r_r X' R' T' -> X = X' /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y).
let X X' R R' T T'. assume H1.
claim L0: X' = pack_r_r X R T 0.
{ exact pack_r_r_0_eq (pack_r_r X R T) X' R' T' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_r_0_eq2 X R T. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_r_r_1_eq2 X R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_1_eq2 X' R' T' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_r_r_2_eq2 X R T x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_2_eq2 X' R' T' x Lx y Ly.
Qed.

Theorem pack_r_r_ext : forall X, forall R R':set -> set -> prop, forall T T':set -> set -> prop,
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 pack_r_r X R T = pack_r_r X R' T'.
let X R R' T T'. assume H1. assume H2.
prove (X,encode_r X R,encode_r X T) = (X,encode_r X R',encode_r X T').
claim L1: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X T = encode_r X T'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_r_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, forall T:set -> set -> prop, q (pack_r_r X R T)) -> q S.

Theorem pack_struct_r_r_I: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, struct_r_r (pack_r_r X R T).
let X R T q. assume Hq.
exact Hq X R T.
Qed.

Theorem struct_r_r_eta: forall S, struct_r_r S -> S = pack_r_r (S 0) (decode_r (S 1)) (decode_r (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_r_r (z 0) (decode_r (z 1)) (decode_r (z 2))).
let X. let R. let T.
prove pack_r_r X R T = pack_r_r (pack_r_r X R T 0) (decode_r (pack_r_r X R T 1)) (decode_r (pack_r_r X R T 2)).
rewrite <- pack_r_r_0_eq2 X R T.
apply pack_r_r_ext.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_1_eq2 X R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_2_eq2 X R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_r_r_i : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)).

Theorem unpack_r_r_i_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> set,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X R' T' = Phi X R T)
  ->
  unpack_r_r_i (pack_r_r X R T) Phi = Phi X R T.
let Phi X R T.
assume HPhi.
prove Phi (pack_r_r X R T 0) (decode_r (pack_r_r X R T 1)) (decode_r (pack_r_r X R T 2)) = Phi X R T.
rewrite <- pack_r_r_0_eq2 X R T.
prove Phi X (decode_r (pack_r_r X R T 1)) (decode_r (pack_r_r X R T 2)) = Phi X R T.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r X R T 1) x y.
  rewrite <- pack_r_r_1_eq2 X R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r X R T 2) x y.
  rewrite <- pack_r_r_2_eq2 X R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_r_r_o : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)).

Theorem unpack_r_r_o_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> prop,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X R' T' = Phi X R T)
  ->
  unpack_r_r_o (pack_r_r X R T) Phi = Phi X R T.
let Phi X R T.
assume HPhi.
prove Phi (pack_r_r X R T 0) (decode_r (pack_r_r X R T 1)) (decode_r (pack_r_r X R T 2)) = Phi X R T.
rewrite <- pack_r_r_0_eq2 X R T.
prove Phi X (decode_r (pack_r_r X R T 1)) (decode_r (pack_r_r X R T 2)) = Phi X R T.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r X R T 1) x y.
  rewrite <- pack_r_r_1_eq2 X R T x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r X R T 2) x y.
  rewrite <- pack_r_r_2_eq2 X R T x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_r_p : set -> (set -> set -> prop) -> (set -> prop) -> set := fun X R P => (X,encode_r X R,encode_p X P).

Theorem pack_r_p_0_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, S = pack_r_p X R P -> X = S 0.
let S X R P. assume H1. rewrite H1.
prove X = (X,encode_r X R,encode_p X P) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_r_p_0_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, X = pack_r_p X R P 0.
let X R P. apply pack_r_p_0_eq (pack_r_p X R P) X R P. reflexivity.
Qed.

Theorem pack_r_p_1_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, S = pack_r_p X R P -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_r X R,encode_p X P) 1) x y.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_p_1_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, R x y = decode_r (pack_r_p X R P 1) x y.
let X R P. apply pack_r_p_1_eq (pack_r_p X R P) X R P. reflexivity.
Qed.

Theorem pack_r_p_2_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, S = pack_r_p X R P -> forall x :e X, P x = decode_p (S 2) x.
let S X R P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_r X R,encode_p X P) 2) x.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_r_p_2_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_r_p X R P 2) x.
let X R P. apply pack_r_p_2_eq (pack_r_p X R P) X R P. reflexivity.
Qed.

Theorem pack_r_p_inj : forall X X', forall R R':set -> set -> prop, forall P P':set -> prop, pack_r_p X R P = pack_r_p X' R' P' -> X = X' /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x).
let X X' R R' P P'. assume H1.
claim L0: X' = pack_r_p X R P 0.
{ exact pack_r_p_0_eq (pack_r_p X R P) X' R' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_p_0_eq2 X R P. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_r_p_1_eq2 X R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_p_1_eq2 X' R' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_r_p_2_eq2 X R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_r_p_2_eq2 X' R' P' x Lx.
Qed.

Theorem pack_r_p_ext : forall X, forall R R':set -> set -> prop, forall P P':set -> prop,
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_r_p X R P = pack_r_p X R' P'.
let X R R' P P'. assume H1. assume H2.
prove (X,encode_r X R,encode_p X P) = (X,encode_r X R',encode_p X P').
claim L1: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_r_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, forall P:set -> prop, q (pack_r_p X R P)) -> q S.

Theorem pack_struct_r_p_I: forall X, forall R:set -> set -> prop, forall P:set -> prop, struct_r_p (pack_r_p X R P).
let X R P q. assume Hq.
exact Hq X R P.
Qed.

Theorem struct_r_p_eta: forall S, struct_r_p S -> S = pack_r_p (S 0) (decode_r (S 1)) (decode_p (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_r_p (z 0) (decode_r (z 1)) (decode_p (z 2))).
let X. let R. let P.
prove pack_r_p X R P = pack_r_p (pack_r_p X R P 0) (decode_r (pack_r_p X R P 1)) (decode_p (pack_r_p X R P 2)).
rewrite <- pack_r_p_0_eq2 X R P.
apply pack_r_p_ext.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_p_1_eq2 X R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_r_p_2_eq2 X R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_p_i : set -> (set -> (set -> set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_p (S 2)).

Theorem unpack_r_p_i_eq : forall Phi:set -> (set -> set -> prop) -> (set -> prop) -> set,
  forall X, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X R' P' = Phi X R P)
  ->
  unpack_r_p_i (pack_r_p X R P) Phi = Phi X R P.
let Phi X R P.
assume HPhi.
prove Phi (pack_r_p X R P 0) (decode_r (pack_r_p X R P 1)) (decode_p (pack_r_p X R P 2)) = Phi X R P.
rewrite <- pack_r_p_0_eq2 X R P.
prove Phi X (decode_r (pack_r_p X R P 1)) (decode_p (pack_r_p X R P 2)) = Phi X R P.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_p X R P 1) x y.
  rewrite <- pack_r_p_1_eq2 X R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_p X R P 2) x.
  rewrite <- pack_r_p_2_eq2 X R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_p_o : set -> (set -> (set -> set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_p (S 2)).

Theorem unpack_r_p_o_eq : forall Phi:set -> (set -> set -> prop) -> (set -> prop) -> prop,
  forall X, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X R' P' = Phi X R P)
  ->
  unpack_r_p_o (pack_r_p X R P) Phi = Phi X R P.
let Phi X R P.
assume HPhi.
prove Phi (pack_r_p X R P 0) (decode_r (pack_r_p X R P 1)) (decode_p (pack_r_p X R P 2)) = Phi X R P.
rewrite <- pack_r_p_0_eq2 X R P.
prove Phi X (decode_r (pack_r_p X R P 1)) (decode_p (pack_r_p X R P 2)) = Phi X R P.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_p X R P 1) x y.
  rewrite <- pack_r_p_1_eq2 X R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_p X R P 2) x.
  rewrite <- pack_r_p_2_eq2 X R P x Hx.
  apply iff_refl.
Qed.


Definition pack_r_e : set -> (set -> set -> prop) -> set -> set := fun X R c => (X,encode_r X R,c).

Theorem pack_r_e_0_eq: forall S X, forall R:set -> set -> prop, forall c:set, S = pack_r_e X R c -> X = S 0.
let S X R c. assume H1. rewrite H1.
prove X = (X,encode_r X R,c) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_r_e_0_eq2: forall X, forall R:set -> set -> prop, forall c:set, X = pack_r_e X R c 0.
let X R c. apply pack_r_e_0_eq (pack_r_e X R c) X R c. reflexivity.
Qed.

Theorem pack_r_e_1_eq: forall S X, forall R:set -> set -> prop, forall c:set, S = pack_r_e X R c -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_r X R,c) 1) x y.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_e_1_eq2: forall X, forall R:set -> set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_r_e X R c 1) x y.
let X R c. apply pack_r_e_1_eq (pack_r_e X R c) X R c. reflexivity.
Qed.

Theorem pack_r_e_2_eq: forall S X, forall R:set -> set -> prop, forall c:set, S = pack_r_e X R c -> c = S 2.
let S X R c. assume H1.
rewrite H1. prove c = (X,encode_r X R,c) 2. symmetry. apply tuple_3_2_eq.
Qed.

Theorem pack_r_e_2_eq2: forall X, forall R:set -> set -> prop, forall c:set, c = pack_r_e X R c 2.
let X R c. apply pack_r_e_2_eq (pack_r_e X R c) X R c. reflexivity.
Qed.

Theorem pack_r_e_inj : forall X X', forall R R':set -> set -> prop, forall c c':set, pack_r_e X R c = pack_r_e X' R' c' -> X = X' /\ (forall x y :e X, R x y = R' x y) /\ c = c'.
let X X' R R' c c'. assume H1.
claim L0: X' = pack_r_e X R c 0.
{ exact pack_r_e_0_eq (pack_r_e X R c) X' R' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_e_0_eq2 X R c. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_r_e_1_eq2 X R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_e_1_eq2 X' R' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_r_e_2_eq2 X R c.
  rewrite H1. symmetry.
  exact pack_r_e_2_eq2 X' R' c'.
Qed.

Theorem pack_r_e_ext : forall X, forall R R':set -> set -> prop, forall c,
 (forall x y :e X, R x y <-> R' x y) ->
 pack_r_e X R c = pack_r_e X R' c.
let X R R' c. assume H1.
prove (X,encode_r X R,c) = (X,encode_r X R',c).
claim L1: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H1. }
rewrite <- L1.
reflexivity.
Qed.

Definition struct_r_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, forall c:set, c :e X -> q (pack_r_e X R c)) -> q S.

Theorem pack_struct_r_e_I: forall X, forall R:set -> set -> prop, forall c:set, c :e X -> struct_r_e (pack_r_e X R c).
let X R c. assume Hc. let q. assume Hq.
exact Hq X R c Hc.
Qed.

Theorem pack_struct_r_e_E2: forall X, forall R:set -> set -> prop, forall c:set, struct_r_e (pack_r_e X R c) -> c :e X.
let X R c. assume H1. apply H1 (fun z => z = pack_r_e X R c -> c :e X).
- let X'. let R'. let c'. assume Hc'.
  assume Heq: pack_r_e X' R' c' = pack_r_e X R c.
  apply pack_r_e_inj X' X R' R c' c Heq.
  assume H. apply H.
  assume HX'X HR'R Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_r_e_eta: forall S, struct_r_e S -> S = pack_r_e (S 0) (decode_r (S 1)) (S 2).
let S. assume H1. apply H1 (fun z => z = pack_r_e (z 0) (decode_r (z 1)) (z 2)).
let X. let R. let c. assume _.
prove pack_r_e X R c = pack_r_e (pack_r_e X R c 0) (decode_r (pack_r_e X R c 1)) (pack_r_e X R c 2).
rewrite <- pack_r_e_0_eq2 X R c.
rewrite <- pack_r_e_2_eq2 X R c.
apply pack_r_e_ext.
let x. assume Hx. let y. assume Hy.
rewrite <- pack_r_e_1_eq2 X R c x Hx y Hy.
apply iff_refl.
Qed.


Definition unpack_r_e_i : set -> (set -> (set -> set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)) (S 2).

Theorem unpack_r_e_i_eq : forall Phi:set -> (set -> set -> prop) -> set -> set,
  forall X, forall R:set -> set -> prop, forall c:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X R' c = Phi X R c)
  ->
  unpack_r_e_i (pack_r_e X R c) Phi = Phi X R c.
let Phi X R c.
assume HPhi.
prove Phi (pack_r_e X R c 0) (decode_r (pack_r_e X R c 1)) (pack_r_e X R c 2) = Phi X R c.
rewrite <- pack_r_e_0_eq2 X R c.
prove Phi X (decode_r (pack_r_e X R c 1)) (pack_r_e X R c 2) = Phi X R c.
rewrite <- pack_r_e_2_eq2 X R c.
apply HPhi.
let x. assume Hx. let y. assume Hy.
prove R x y <-> decode_r (pack_r_e X R c 1) x y.
rewrite <- pack_r_e_1_eq2 X R c x Hx y Hy.
apply iff_refl.
Qed.


Definition unpack_r_e_o : set -> (set -> (set -> set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)) (S 2).

Theorem unpack_r_e_o_eq : forall Phi:set -> (set -> set -> prop) -> set -> prop,
  forall X, forall R:set -> set -> prop, forall c:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X R' c = Phi X R c)
  ->
  unpack_r_e_o (pack_r_e X R c) Phi = Phi X R c.
let Phi X R c.
assume HPhi.
prove Phi (pack_r_e X R c 0) (decode_r (pack_r_e X R c 1)) (pack_r_e X R c 2) = Phi X R c.
rewrite <- pack_r_e_0_eq2 X R c.
prove Phi X (decode_r (pack_r_e X R c 1)) (pack_r_e X R c 2) = Phi X R c.
rewrite <- pack_r_e_2_eq2 X R c.
apply HPhi.
let x. assume Hx. let y. assume Hy.
prove R x y <-> decode_r (pack_r_e X R c 1) x y.
rewrite <- pack_r_e_1_eq2 X R c x Hx y Hy.
apply iff_refl.
Qed.


Definition pack_p_p : set -> (set -> prop) -> (set -> prop) -> set := fun X P Q => (X,encode_p X P,encode_p X Q).

Theorem pack_p_p_0_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, S = pack_p_p X P Q -> X = S 0.
let S X P Q. assume H1. rewrite H1.
prove X = (X,encode_p X P,encode_p X Q) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_p_p_0_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, X = pack_p_p X P Q 0.
let X P Q. apply pack_p_p_0_eq (pack_p_p X P Q) X P Q. reflexivity.
Qed.

Theorem pack_p_p_1_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, S = pack_p_p X P Q -> forall x :e X, P x = decode_p (S 1) x.
let S X P Q. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_p X P,encode_p X Q) 1) x.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_p_p_1_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall x :e X, P x = decode_p (pack_p_p X P Q 1) x.
let X P Q. apply pack_p_p_1_eq (pack_p_p X P Q) X P Q. reflexivity.
Qed.

Theorem pack_p_p_2_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, S = pack_p_p X P Q -> forall x :e X, Q x = decode_p (S 2) x.
let S X P Q. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_p X P,encode_p X Q) 2) x.
rewrite tuple_3_2_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_p_p_2_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall x :e X, Q x = decode_p (pack_p_p X P Q 2) x.
let X P Q. apply pack_p_p_2_eq (pack_p_p X P Q) X P Q. reflexivity.
Qed.

Theorem pack_p_p_inj : forall X X', forall P P':set -> prop, forall Q Q':set -> prop, pack_p_p X P Q = pack_p_p X' P' Q' -> X = X' /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x).
let X X' P P' Q Q'. assume H1.
claim L0: X' = pack_p_p X P Q 0.
{ exact pack_p_p_0_eq (pack_p_p X P Q) X' P' Q' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_p_p_0_eq2 X P Q. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_p_p_1_eq2 X P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_p_p_1_eq2 X' P' Q' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_p_p_2_eq2 X P Q x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_p_p_2_eq2 X' P' Q' x Lx.
Qed.

Theorem pack_p_p_ext : forall X, forall P P':set -> prop, forall Q Q':set -> prop,
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_p_p X P Q = pack_p_p X P' Q'.
let X P P' Q Q'. assume H1. assume H2.
prove (X,encode_p X P,encode_p X Q) = (X,encode_p X P',encode_p X Q').
claim L1: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_p_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall P:set -> prop, forall Q:set -> prop, q (pack_p_p X P Q)) -> q S.

Theorem pack_struct_p_p_I: forall X, forall P:set -> prop, forall Q:set -> prop, struct_p_p (pack_p_p X P Q).
let X P Q q. assume Hq.
exact Hq X P Q.
Qed.

Theorem struct_p_p_eta: forall S, struct_p_p S -> S = pack_p_p (S 0) (decode_p (S 1)) (decode_p (S 2)).
let S. assume H1. apply H1 (fun z => z = pack_p_p (z 0) (decode_p (z 1)) (decode_p (z 2))).
let X. let P. let Q.
prove pack_p_p X P Q = pack_p_p (pack_p_p X P Q 0) (decode_p (pack_p_p X P Q 1)) (decode_p (pack_p_p X P Q 2)).
rewrite <- pack_p_p_0_eq2 X P Q.
apply pack_p_p_ext.
- let x. assume Hx.
  rewrite <- pack_p_p_1_eq2 X P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_p_p_2_eq2 X P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_p_p_i : set -> (set -> (set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_p (S 1)) (decode_p (S 2)).

Theorem unpack_p_p_i_eq : forall Phi:set -> (set -> prop) -> (set -> prop) -> set,
  forall X, forall P:set -> prop, forall Q:set -> prop,
  ( forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X P' Q' = Phi X P Q)
  ->
  unpack_p_p_i (pack_p_p X P Q) Phi = Phi X P Q.
let Phi X P Q.
assume HPhi.
prove Phi (pack_p_p X P Q 0) (decode_p (pack_p_p X P Q 1)) (decode_p (pack_p_p X P Q 2)) = Phi X P Q.
rewrite <- pack_p_p_0_eq2 X P Q.
prove Phi X (decode_p (pack_p_p X P Q 1)) (decode_p (pack_p_p X P Q 2)) = Phi X P Q.
apply HPhi.
- let x. assume Hx.
  prove P x <-> decode_p (pack_p_p X P Q 1) x.
  rewrite <- pack_p_p_1_eq2 X P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_p_p X P Q 2) x.
  rewrite <- pack_p_p_2_eq2 X P Q x Hx.
  apply iff_refl.
Qed.


Definition unpack_p_p_o : set -> (set -> (set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_p (S 1)) (decode_p (S 2)).

Theorem unpack_p_p_o_eq : forall Phi:set -> (set -> prop) -> (set -> prop) -> prop,
  forall X, forall P:set -> prop, forall Q:set -> prop,
  ( forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X P' Q' = Phi X P Q)
  ->
  unpack_p_p_o (pack_p_p X P Q) Phi = Phi X P Q.
let Phi X P Q.
assume HPhi.
prove Phi (pack_p_p X P Q 0) (decode_p (pack_p_p X P Q 1)) (decode_p (pack_p_p X P Q 2)) = Phi X P Q.
rewrite <- pack_p_p_0_eq2 X P Q.
prove Phi X (decode_p (pack_p_p X P Q 1)) (decode_p (pack_p_p X P Q 2)) = Phi X P Q.
apply HPhi.
- let x. assume Hx.
  prove P x <-> decode_p (pack_p_p X P Q 1) x.
  rewrite <- pack_p_p_1_eq2 X P Q x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_p_p X P Q 2) x.
  rewrite <- pack_p_p_2_eq2 X P Q x Hx.
  apply iff_refl.
Qed.


Definition pack_p_e : set -> (set -> prop) -> set -> set := fun X P c => (X,encode_p X P,c).

Theorem pack_p_e_0_eq: forall S X, forall P:set -> prop, forall c:set, S = pack_p_e X P c -> X = S 0.
let S X P c. assume H1. rewrite H1.
prove X = (X,encode_p X P,c) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_p_e_0_eq2: forall X, forall P:set -> prop, forall c:set, X = pack_p_e X P c 0.
let X P c. apply pack_p_e_0_eq (pack_p_e X P c) X P c. reflexivity.
Qed.

Theorem pack_p_e_1_eq: forall S X, forall P:set -> prop, forall c:set, S = pack_p_e X P c -> forall x :e X, P x = decode_p (S 1) x.
let S X P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_p X P,c) 1) x.
rewrite tuple_3_1_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_p_e_1_eq2: forall X, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_p_e X P c 1) x.
let X P c. apply pack_p_e_1_eq (pack_p_e X P c) X P c. reflexivity.
Qed.

Theorem pack_p_e_2_eq: forall S X, forall P:set -> prop, forall c:set, S = pack_p_e X P c -> c = S 2.
let S X P c. assume H1.
rewrite H1. prove c = (X,encode_p X P,c) 2. symmetry. apply tuple_3_2_eq.
Qed.

Theorem pack_p_e_2_eq2: forall X, forall P:set -> prop, forall c:set, c = pack_p_e X P c 2.
let X P c. apply pack_p_e_2_eq (pack_p_e X P c) X P c. reflexivity.
Qed.

Theorem pack_p_e_inj : forall X X', forall P P':set -> prop, forall c c':set, pack_p_e X P c = pack_p_e X' P' c' -> X = X' /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' P P' c c'. assume H1.
claim L0: X' = pack_p_e X P c 0.
{ exact pack_p_e_0_eq (pack_p_e X P c) X' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_p_e_0_eq2 X P c. }
apply and3I.
- exact L1.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_p_e_1_eq2 X P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_p_e_1_eq2 X' P' c' x Lx.
- prove c = c'.
  rewrite pack_p_e_2_eq2 X P c.
  rewrite H1. symmetry.
  exact pack_p_e_2_eq2 X' P' c'.
Qed.

Theorem pack_p_e_ext : forall X, forall P P':set -> prop, forall c,
 (forall x :e X, P x <-> P' x) ->
 pack_p_e X P c = pack_p_e X P' c.
let X P P' c. assume H1.
prove (X,encode_p X P,c) = (X,encode_p X P',c).
claim L1: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H1. }
rewrite <- L1.
reflexivity.
Qed.

Definition struct_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall P:set -> prop, forall c:set, c :e X -> q (pack_p_e X P c)) -> q S.

Theorem pack_struct_p_e_I: forall X, forall P:set -> prop, forall c:set, c :e X -> struct_p_e (pack_p_e X P c).
let X P c. assume Hc. let q. assume Hq.
exact Hq X P c Hc.
Qed.

Theorem pack_struct_p_e_E2: forall X, forall P:set -> prop, forall c:set, struct_p_e (pack_p_e X P c) -> c :e X.
let X P c. assume H1. apply H1 (fun z => z = pack_p_e X P c -> c :e X).
- let X'. let P'. let c'. assume Hc'.
  assume Heq: pack_p_e X' P' c' = pack_p_e X P c.
  apply pack_p_e_inj X' X P' P c' c Heq.
  assume H. apply H.
  assume HX'X HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_p_e_eta: forall S, struct_p_e S -> S = pack_p_e (S 0) (decode_p (S 1)) (S 2).
let S. assume H1. apply H1 (fun z => z = pack_p_e (z 0) (decode_p (z 1)) (z 2)).
let X. let P. let c. assume _.
prove pack_p_e X P c = pack_p_e (pack_p_e X P c 0) (decode_p (pack_p_e X P c 1)) (pack_p_e X P c 2).
rewrite <- pack_p_e_0_eq2 X P c.
rewrite <- pack_p_e_2_eq2 X P c.
apply pack_p_e_ext.
let x. assume Hx.
rewrite <- pack_p_e_1_eq2 X P c x Hx.
apply iff_refl.
Qed.


Definition unpack_p_e_i : set -> (set -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_p (S 1)) (S 2).

Theorem unpack_p_e_i_eq : forall Phi:set -> (set -> prop) -> set -> set,
  forall X, forall P:set -> prop, forall c:set,
  ( forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X P' c = Phi X P c)
  ->
  unpack_p_e_i (pack_p_e X P c) Phi = Phi X P c.
let Phi X P c.
assume HPhi.
prove Phi (pack_p_e X P c 0) (decode_p (pack_p_e X P c 1)) (pack_p_e X P c 2) = Phi X P c.
rewrite <- pack_p_e_0_eq2 X P c.
prove Phi X (decode_p (pack_p_e X P c 1)) (pack_p_e X P c 2) = Phi X P c.
rewrite <- pack_p_e_2_eq2 X P c.
apply HPhi.
let x. assume Hx.
prove P x <-> decode_p (pack_p_e X P c 1) x.
rewrite <- pack_p_e_1_eq2 X P c x Hx.
apply iff_refl.
Qed.


Definition unpack_p_e_o : set -> (set -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_p (S 1)) (S 2).

Theorem unpack_p_e_o_eq : forall Phi:set -> (set -> prop) -> set -> prop,
  forall X, forall P:set -> prop, forall c:set,
  ( forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X P' c = Phi X P c)
  ->
  unpack_p_e_o (pack_p_e X P c) Phi = Phi X P c.
let Phi X P c.
assume HPhi.
prove Phi (pack_p_e X P c 0) (decode_p (pack_p_e X P c 1)) (pack_p_e X P c 2) = Phi X P c.
rewrite <- pack_p_e_0_eq2 X P c.
prove Phi X (decode_p (pack_p_e X P c 1)) (pack_p_e X P c 2) = Phi X P c.
rewrite <- pack_p_e_2_eq2 X P c.
apply HPhi.
let x. assume Hx.
prove P x <-> decode_p (pack_p_e X P c 1) x.
rewrite <- pack_p_e_1_eq2 X P c x Hx.
apply iff_refl.
Qed.


Definition pack_e_e : set -> set -> set -> set := fun X c d => (X,c,d).

Theorem pack_e_e_0_eq: forall S X, forall c:set, forall d:set, S = pack_e_e X c d -> X = S 0.
let S X c d. assume H1. rewrite H1.
prove X = (X,c,d) 0.
symmetry. apply tuple_3_0_eq.
Qed.

Theorem pack_e_e_0_eq2: forall X, forall c:set, forall d:set, X = pack_e_e X c d 0.
let X c d. apply pack_e_e_0_eq (pack_e_e X c d) X c d. reflexivity.
Qed.

Theorem pack_e_e_1_eq: forall S X, forall c:set, forall d:set, S = pack_e_e X c d -> c = S 1.
let S X c d. assume H1.
rewrite H1. prove c = (X,c,d) 1. symmetry. apply tuple_3_1_eq.
Qed.

Theorem pack_e_e_1_eq2: forall X, forall c:set, forall d:set, c = pack_e_e X c d 1.
let X c d. apply pack_e_e_1_eq (pack_e_e X c d) X c d. reflexivity.
Qed.

Theorem pack_e_e_2_eq: forall S X, forall c:set, forall d:set, S = pack_e_e X c d -> d = S 2.
let S X c d. assume H1.
rewrite H1. prove d = (X,c,d) 2. symmetry. apply tuple_3_2_eq.
Qed.

Theorem pack_e_e_2_eq2: forall X, forall c:set, forall d:set, d = pack_e_e X c d 2.
let X c d. apply pack_e_e_2_eq (pack_e_e X c d) X c d. reflexivity.
Qed.

Theorem pack_e_e_inj : forall X X', forall c c':set, forall d d':set, pack_e_e X c d = pack_e_e X' c' d' -> X = X' /\ c = c' /\ d = d'.
let X X' c c' d d'. assume H1.
claim L0: X' = pack_e_e X c d 0.
{ exact pack_e_e_0_eq (pack_e_e X c d) X' c' d' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_e_e_0_eq2 X c d. }
apply and3I.
- exact L1.
- prove c = c'.
  rewrite pack_e_e_1_eq2 X c d.
  rewrite H1. symmetry.
  exact pack_e_e_1_eq2 X' c' d'.
- prove d = d'.
  rewrite pack_e_e_2_eq2 X c d.
  rewrite H1. symmetry.
  exact pack_e_e_2_eq2 X' c' d'.
Qed.

Definition struct_e_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall c:set, c :e X -> forall d:set, d :e X -> q (pack_e_e X c d)) -> q S.

Theorem pack_struct_e_e_I: forall X, forall c:set, c :e X -> forall d:set, d :e X -> struct_e_e (pack_e_e X c d).
let X c. assume Hc. let d. assume Hd. let q. assume Hq.
exact Hq X c Hc d Hd.
Qed.

Theorem pack_struct_e_e_E1: forall X, forall c:set, forall d:set, struct_e_e (pack_e_e X c d) -> c :e X.
let X c d. assume H1. apply H1 (fun z => z = pack_e_e X c d -> c :e X).
- let X'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_e_e X' c' d' = pack_e_e X c d.
  apply pack_e_e_inj X' X c' c d' d Heq.
  assume H. apply H.
  assume HX'X Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem pack_struct_e_e_E2: forall X, forall c:set, forall d:set, struct_e_e (pack_e_e X c d) -> d :e X.
let X c d. assume H1. apply H1 (fun z => z = pack_e_e X c d -> d :e X).
- let X'. let c'. assume Hc'. let d'. assume Hd'.
  assume Heq: pack_e_e X' c' d' = pack_e_e X c d.
  apply pack_e_e_inj X' X c' c d' d Heq.
  assume H. apply H.
  assume HX'X Hc'c Hd'd.
  rewrite <- HX'X.  rewrite <- Hd'd.  exact Hd'.
- reflexivity.
Qed.

Theorem struct_e_e_eta: forall S, struct_e_e S -> S = pack_e_e (S 0) (S 1) (S 2).
let S. assume H1. apply H1 (fun z => z = pack_e_e (z 0) (z 1) (z 2)).
let X. let c. assume _. let d. assume _.
prove pack_e_e X c d = pack_e_e (pack_e_e X c d 0) (pack_e_e X c d 1) (pack_e_e X c d 2).
rewrite <- pack_e_e_0_eq2 X c d.
rewrite <- pack_e_e_1_eq2 X c d.
rewrite <- pack_e_e_2_eq2 X c d.
reflexivity.
Qed.


Definition unpack_e_e_i : set -> (set -> set -> set -> set) -> set := fun S Phi => Phi (S 0) (S 1) (S 2).

Theorem unpack_e_e_i_eq : forall Phi:set -> set -> set -> set,
  forall X, forall c:set, forall d:set,
  unpack_e_e_i (pack_e_e X c d) Phi = Phi X c d.
let Phi X c d.
prove Phi (pack_e_e X c d 0) (pack_e_e X c d 1) (pack_e_e X c d 2) = Phi X c d.
rewrite <- pack_e_e_0_eq2 X c d.
prove Phi X (pack_e_e X c d 1) (pack_e_e X c d 2) = Phi X c d.
rewrite <- pack_e_e_1_eq2 X c d.
rewrite <- pack_e_e_2_eq2 X c d.
reflexivity.
Qed.


Definition unpack_e_e_o : set -> (set -> set -> set -> prop) -> prop := fun S Phi => Phi (S 0) (S 1) (S 2).

Theorem unpack_e_e_o_eq : forall Phi:set -> set -> set -> prop,
  forall X, forall c:set, forall d:set,
  unpack_e_e_o (pack_e_e X c d) Phi = Phi X c d.
let Phi X c d.
prove Phi (pack_e_e X c d 0) (pack_e_e X c d 1) (pack_e_e X c d 2) = Phi X c d.
rewrite <- pack_e_e_0_eq2 X c d.
prove Phi X (pack_e_e X c d 1) (pack_e_e X c d 2) = Phi X c d.
rewrite <- pack_e_e_1_eq2 X c d.
rewrite <- pack_e_e_2_eq2 X c d.
reflexivity.
Qed.

