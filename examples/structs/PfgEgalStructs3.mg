Definition pack_c_b_u : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> set := fun X C f i => (X,encode_c X C,encode_b X f,encode_u X i).

Theorem pack_c_b_u_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, S = pack_c_b_u X C f i -> X = S 0.
let S X C f i. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_u X i) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_c_b_u_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, X = pack_c_b_u X C f i 0.
let X C f i. apply pack_c_b_u_0_eq (pack_c_b_u X C f i) X C f i. reflexivity.
Qed.

Theorem pack_c_b_u_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, S = pack_c_b_u X C f i -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f i. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_u X i) 1) U.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_u_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_u X C f i 1) U.
let X C f i. apply pack_c_b_u_1_eq (pack_c_b_u X C f i) X C f i. reflexivity.
Qed.

Theorem pack_c_b_u_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, S = pack_c_b_u X C f i -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f i. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_u X i) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_u_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall x y :e X, f x y = decode_b (pack_c_b_u X C f i 2) x y.
let X C f i. apply pack_c_b_u_2_eq (pack_c_b_u X C f i) X C f i. reflexivity.
Qed.

Theorem pack_c_b_u_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, S = pack_c_b_u X C f i -> forall x :e X, i x = decode_u (S 3) x.
let S X C f i. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_b X f,encode_u X i) 3) x.
rewrite tuple_4_3_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_b_u_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, forall x :e X, i x = decode_u (pack_c_b_u X C f i 3) x.
let X C f i. apply pack_c_b_u_3_eq (pack_c_b_u X C f i) X C f i. reflexivity.
Qed.

Theorem pack_c_b_u_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall i i':set -> set, pack_c_b_u X C f i = pack_c_b_u X' C' f' i' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x).
let X X' C C' f f' i i'. assume H1.
claim L0: X' = pack_c_b_u X C f i 0.
{ exact pack_c_b_u_0_eq (pack_c_b_u X C f i) X' C' f' i' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_u_0_eq2 X C f i. }
apply and4I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_u_1_eq2 X C f i U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_u_1_eq2 X' C' f' i' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_u_2_eq2 X C f i x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_u_2_eq2 X' C' f' i' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_b_u_3_eq2 X C f i x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_u_3_eq2 X' C' f' i' x Lx.
Qed.

Theorem pack_c_b_u_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall i i':set -> set,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 pack_c_b_u X C f i = pack_c_b_u X C' f' i'.
let X C C' f f' i i'. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_b X f,encode_u X i) = (X,encode_c X C',encode_b X f',encode_u X i').
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

Definition struct_c_b_u : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> q (pack_c_b_u X C f i)) -> q S.

Theorem pack_struct_c_b_u_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> struct_c_b_u (pack_c_b_u X C f i).
let X C f. assume Hf. let i. assume Hi. let q. assume Hq.
exact Hq X C f Hf i Hi.
Qed.

Theorem pack_struct_c_b_u_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, struct_c_b_u (pack_c_b_u X C f i) -> forall x y :e X, f x y :e X.
let X C f i. assume H1. apply H1 (fun z => z = pack_c_b_u X C f i -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'.
  assume Heq: pack_c_b_u X' C' f' i' = pack_c_b_u X C f i.
  apply pack_c_b_u_inj X' X C' C f' f i' i Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_c_b_u_E3: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set, struct_c_b_u (pack_c_b_u X C f i) -> forall x :e X, i x :e X.
let X C f i. assume H1. apply H1 (fun z => z = pack_c_b_u X C f i -> forall x :e X, i x :e X).
- let X'. let C'. let f'. assume Hf'. let i'. assume Hi'.
  assume Heq: pack_c_b_u X' C' f' i' = pack_c_b_u X C f i.
  apply pack_c_b_u_inj X' X C' C f' f i' i Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hi'i.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_c_b_u_eta: forall S, struct_c_b_u S -> S = pack_c_b_u (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_c_b_u (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_u (z 3))).
let X. let C. let f. assume _. let i. assume _.
prove pack_c_b_u X C f i = pack_c_b_u (pack_c_b_u X C f i 0) (decode_c (pack_c_b_u X C f i 1)) (decode_b (pack_c_b_u X C f i 2)) (decode_u (pack_c_b_u X C f i 3)).
rewrite <- pack_c_b_u_0_eq2 X C f i.
apply pack_c_b_u_ext.
- let U. assume HU.
  rewrite <- pack_c_b_u_1_eq2 X C f i U HU.
  apply iff_refl.
- exact pack_c_b_u_2_eq2 X C f i.
- exact pack_c_b_u_3_eq2 X C f i.
Qed.


Definition unpack_c_b_u_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)).

Theorem unpack_c_b_u_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X C' f' i' = Phi X C f i)
  ->
  unpack_c_b_u_i (pack_c_b_u X C f i) Phi = Phi X C f i.
let Phi X C f i.
assume HPhi.
prove Phi (pack_c_b_u X C f i 0) (decode_c (pack_c_b_u X C f i 1)) (decode_b (pack_c_b_u X C f i 2)) (decode_u (pack_c_b_u X C f i 3)) = Phi X C f i.
rewrite <- pack_c_b_u_0_eq2 X C f i.
prove Phi X (decode_c (pack_c_b_u X C f i 1)) (decode_b (pack_c_b_u X C f i 2)) (decode_u (pack_c_b_u X C f i 3)) = Phi X C f i.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_u X C f i 1) U.
  rewrite <- pack_c_b_u_1_eq2 X C f i U HU.
  apply iff_refl.
- exact pack_c_b_u_2_eq2 X C f i.
- exact pack_c_b_u_3_eq2 X C f i.
Qed.


Definition unpack_c_b_u_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_u (S 3)).

Theorem unpack_c_b_u_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall i:set -> set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X C' f' i' = Phi X C f i)
  ->
  unpack_c_b_u_o (pack_c_b_u X C f i) Phi = Phi X C f i.
let Phi X C f i.
assume HPhi.
prove Phi (pack_c_b_u X C f i 0) (decode_c (pack_c_b_u X C f i 1)) (decode_b (pack_c_b_u X C f i 2)) (decode_u (pack_c_b_u X C f i 3)) = Phi X C f i.
rewrite <- pack_c_b_u_0_eq2 X C f i.
prove Phi X (decode_c (pack_c_b_u X C f i 1)) (decode_b (pack_c_b_u X C f i 2)) (decode_u (pack_c_b_u X C f i 3)) = Phi X C f i.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_u X C f i 1) U.
  rewrite <- pack_c_b_u_1_eq2 X C f i U HU.
  apply iff_refl.
- exact pack_c_b_u_2_eq2 X C f i.
- exact pack_c_b_u_3_eq2 X C f i.
Qed.


Definition pack_c_b_r : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> set := fun X C f R => (X,encode_c X C,encode_b X f,encode_r X R).

Theorem pack_c_b_r_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, S = pack_c_b_r X C f R -> X = S 0.
let S X C f R. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_r X R) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_c_b_r_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, X = pack_c_b_r X C f R 0.
let X C f R. apply pack_c_b_r_0_eq (pack_c_b_r X C f R) X C f R. reflexivity.
Qed.

Theorem pack_c_b_r_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, S = pack_c_b_r X C f R -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f R. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_r X R) 1) U.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_r_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_r X C f R 1) U.
let X C f R. apply pack_c_b_r_1_eq (pack_c_b_r X C f R) X C f R. reflexivity.
Qed.

Theorem pack_c_b_r_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, S = pack_c_b_r X C f R -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_r X R) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_r_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, f x y = decode_b (pack_c_b_r X C f R 2) x y.
let X C f R. apply pack_c_b_r_2_eq (pack_c_b_r X C f R) X C f R. reflexivity.
Qed.

Theorem pack_c_b_r_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, S = pack_c_b_r X C f R -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X C f R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_b X f,encode_r X R) 3) x y.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_b_r_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_c_b_r X C f R 3) x y.
let X C f R. apply pack_c_b_r_3_eq (pack_c_b_r X C f R) X C f R. reflexivity.
Qed.

Theorem pack_c_b_r_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall R R':set -> set -> prop, pack_c_b_r X C f R = pack_c_b_r X' C' f' R' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, R x y = R' x y).
let X X' C C' f f' R R'. assume H1.
claim L0: X' = pack_c_b_r X C f R 0.
{ exact pack_c_b_r_0_eq (pack_c_b_r X C f R) X' C' f' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_r_0_eq2 X C f R. }
apply and4I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_r_1_eq2 X C f R U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_r_1_eq2 X' C' f' R' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_r_2_eq2 X C f R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_r_2_eq2 X' C' f' R' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_b_r_3_eq2 X C f R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_r_3_eq2 X' C' f' R' x Lx y Ly.
Qed.

Theorem pack_c_b_r_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall R R':set -> set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_c_b_r X C f R = pack_c_b_r X C' f' R'.
let X C C' f f' R R'. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_b X f,encode_r X R) = (X,encode_c X C',encode_b X f',encode_r X R').
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

Definition struct_c_b_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, q (pack_c_b_r X C f R)) -> q S.

Theorem pack_struct_c_b_r_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, struct_c_b_r (pack_c_b_r X C f R).
let X C f. assume Hf. let R q. assume Hq.
exact Hq X C f Hf R.
Qed.

Theorem pack_struct_c_b_r_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop, struct_c_b_r (pack_c_b_r X C f R) -> forall x y :e X, f x y :e X.
let X C f R. assume H1. apply H1 (fun z => z = pack_c_b_r X C f R -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let R'.
  assume Heq: pack_c_b_r X' C' f' R' = pack_c_b_r X C f R.
  apply pack_c_b_r_inj X' X C' C f' f R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_c_b_r_eta: forall S, struct_c_b_r S -> S = pack_c_b_r (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_c_b_r (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_r (z 3))).
let X. let C. let f. assume _. let R.
prove pack_c_b_r X C f R = pack_c_b_r (pack_c_b_r X C f R 0) (decode_c (pack_c_b_r X C f R 1)) (decode_b (pack_c_b_r X C f R 2)) (decode_r (pack_c_b_r X C f R 3)).
rewrite <- pack_c_b_r_0_eq2 X C f R.
apply pack_c_b_r_ext.
- let U. assume HU.
  rewrite <- pack_c_b_r_1_eq2 X C f R U HU.
  apply iff_refl.
- exact pack_c_b_r_2_eq2 X C f R.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_b_r_3_eq2 X C f R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_b_r_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)).

Theorem unpack_c_b_r_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' f' R' = Phi X C f R)
  ->
  unpack_c_b_r_i (pack_c_b_r X C f R) Phi = Phi X C f R.
let Phi X C f R.
assume HPhi.
prove Phi (pack_c_b_r X C f R 0) (decode_c (pack_c_b_r X C f R 1)) (decode_b (pack_c_b_r X C f R 2)) (decode_r (pack_c_b_r X C f R 3)) = Phi X C f R.
rewrite <- pack_c_b_r_0_eq2 X C f R.
prove Phi X (decode_c (pack_c_b_r X C f R 1)) (decode_b (pack_c_b_r X C f R 2)) (decode_r (pack_c_b_r X C f R 3)) = Phi X C f R.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_r X C f R 1) U.
  rewrite <- pack_c_b_r_1_eq2 X C f R U HU.
  apply iff_refl.
- exact pack_c_b_r_2_eq2 X C f R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_b_r X C f R 3) x y.
  rewrite <- pack_c_b_r_3_eq2 X C f R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_b_r_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_r (S 3)).

Theorem unpack_c_b_r_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall R:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' f' R' = Phi X C f R)
  ->
  unpack_c_b_r_o (pack_c_b_r X C f R) Phi = Phi X C f R.
let Phi X C f R.
assume HPhi.
prove Phi (pack_c_b_r X C f R 0) (decode_c (pack_c_b_r X C f R 1)) (decode_b (pack_c_b_r X C f R 2)) (decode_r (pack_c_b_r X C f R 3)) = Phi X C f R.
rewrite <- pack_c_b_r_0_eq2 X C f R.
prove Phi X (decode_c (pack_c_b_r X C f R 1)) (decode_b (pack_c_b_r X C f R 2)) (decode_r (pack_c_b_r X C f R 3)) = Phi X C f R.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_r X C f R 1) U.
  rewrite <- pack_c_b_r_1_eq2 X C f R U HU.
  apply iff_refl.
- exact pack_c_b_r_2_eq2 X C f R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_b_r X C f R 3) x y.
  rewrite <- pack_c_b_r_3_eq2 X C f R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_c_b_p : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> set := fun X C f P => (X,encode_c X C,encode_b X f,encode_p X P).

Theorem pack_c_b_p_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, S = pack_c_b_p X C f P -> X = S 0.
let S X C f P. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,encode_p X P) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_c_b_p_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, X = pack_c_b_p X C f P 0.
let X C f P. apply pack_c_b_p_0_eq (pack_c_b_p X C f P) X C f P. reflexivity.
Qed.

Theorem pack_c_b_p_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, S = pack_c_b_p X C f P -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f P. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,encode_p X P) 1) U.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_p_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_p X C f P 1) U.
let X C f P. apply pack_c_b_p_1_eq (pack_c_b_p X C f P) X C f P. reflexivity.
Qed.

Theorem pack_c_b_p_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, S = pack_c_b_p X C f P -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,encode_p X P) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_p_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_c_b_p X C f P 2) x y.
let X C f P. apply pack_c_b_p_2_eq (pack_c_b_p X C f P) X C f P. reflexivity.
Qed.

Theorem pack_c_b_p_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, S = pack_c_b_p X C f P -> forall x :e X, P x = decode_p (S 3) x.
let S X C f P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_b X f,encode_p X P) 3) x.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_b_p_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, forall x :e X, P x = decode_p (pack_c_b_p X C f P 3) x.
let X C f P. apply pack_c_b_p_3_eq (pack_c_b_p X C f P) X C f P. reflexivity.
Qed.

Theorem pack_c_b_p_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall P P':set -> prop, pack_c_b_p X C f P = pack_c_b_p X' C' f' P' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, P x = P' x).
let X X' C C' f f' P P'. assume H1.
claim L0: X' = pack_c_b_p X C f P 0.
{ exact pack_c_b_p_0_eq (pack_c_b_p X C f P) X' C' f' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_p_0_eq2 X C f P. }
apply and4I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_p_1_eq2 X C f P U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_p_1_eq2 X' C' f' P' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_p_2_eq2 X C f P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_p_2_eq2 X' C' f' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_b_p_3_eq2 X C f P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_b_p_3_eq2 X' C' f' P' x Lx.
Qed.

Theorem pack_c_b_p_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall P P':set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_b_p X C f P = pack_c_b_p X C' f' P'.
let X C C' f f' P P'. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_b X f,encode_p X P) = (X,encode_c X C',encode_b X f',encode_p X P').
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

Definition struct_c_b_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, q (pack_c_b_p X C f P)) -> q S.

Theorem pack_struct_c_b_p_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, struct_c_b_p (pack_c_b_p X C f P).
let X C f. assume Hf. let P q. assume Hq.
exact Hq X C f Hf P.
Qed.

Theorem pack_struct_c_b_p_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop, struct_c_b_p (pack_c_b_p X C f P) -> forall x y :e X, f x y :e X.
let X C f P. assume H1. apply H1 (fun z => z = pack_c_b_p X C f P -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let P'.
  assume Heq: pack_c_b_p X' C' f' P' = pack_c_b_p X C f P.
  apply pack_c_b_p_inj X' X C' C f' f P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_c_b_p_eta: forall S, struct_c_b_p S -> S = pack_c_b_p (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_p (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_c_b_p (z 0) (decode_c (z 1)) (decode_b (z 2)) (decode_p (z 3))).
let X. let C. let f. assume _. let P.
prove pack_c_b_p X C f P = pack_c_b_p (pack_c_b_p X C f P 0) (decode_c (pack_c_b_p X C f P 1)) (decode_b (pack_c_b_p X C f P 2)) (decode_p (pack_c_b_p X C f P 3)).
rewrite <- pack_c_b_p_0_eq2 X C f P.
apply pack_c_b_p_ext.
- let U. assume HU.
  rewrite <- pack_c_b_p_1_eq2 X C f P U HU.
  apply iff_refl.
- exact pack_c_b_p_2_eq2 X C f P.
- let x. assume Hx.
  rewrite <- pack_c_b_p_3_eq2 X C f P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_b_p_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_p (S 3)).

Theorem unpack_c_b_p_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' f' P' = Phi X C f P)
  ->
  unpack_c_b_p_i (pack_c_b_p X C f P) Phi = Phi X C f P.
let Phi X C f P.
assume HPhi.
prove Phi (pack_c_b_p X C f P 0) (decode_c (pack_c_b_p X C f P 1)) (decode_b (pack_c_b_p X C f P 2)) (decode_p (pack_c_b_p X C f P 3)) = Phi X C f P.
rewrite <- pack_c_b_p_0_eq2 X C f P.
prove Phi X (decode_c (pack_c_b_p X C f P 1)) (decode_b (pack_c_b_p X C f P 2)) (decode_p (pack_c_b_p X C f P 3)) = Phi X C f P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_p X C f P 1) U.
  rewrite <- pack_c_b_p_1_eq2 X C f P U HU.
  apply iff_refl.
- exact pack_c_b_p_2_eq2 X C f P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_b_p X C f P 3) x.
  rewrite <- pack_c_b_p_3_eq2 X C f P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_b_p_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (decode_p (S 3)).

Theorem unpack_c_b_p_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> (set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' f' P' = Phi X C f P)
  ->
  unpack_c_b_p_o (pack_c_b_p X C f P) Phi = Phi X C f P.
let Phi X C f P.
assume HPhi.
prove Phi (pack_c_b_p X C f P 0) (decode_c (pack_c_b_p X C f P 1)) (decode_b (pack_c_b_p X C f P 2)) (decode_p (pack_c_b_p X C f P 3)) = Phi X C f P.
rewrite <- pack_c_b_p_0_eq2 X C f P.
prove Phi X (decode_c (pack_c_b_p X C f P 1)) (decode_b (pack_c_b_p X C f P 2)) (decode_p (pack_c_b_p X C f P 3)) = Phi X C f P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_p X C f P 1) U.
  rewrite <- pack_c_b_p_1_eq2 X C f P U HU.
  apply iff_refl.
- exact pack_c_b_p_2_eq2 X C f P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_b_p X C f P 3) x.
  rewrite <- pack_c_b_p_3_eq2 X C f P x Hx.
  apply iff_refl.
Qed.


Definition pack_c_b_e : set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set -> set := fun X C f c => (X,encode_c X C,encode_b X f,c).

Theorem pack_c_b_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, S = pack_c_b_e X C f c -> X = S 0.
let S X C f c. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_b X f,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_c_b_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, X = pack_c_b_e X C f c 0.
let X C f c. apply pack_c_b_e_0_eq (pack_c_b_e X C f c) X C f c. reflexivity.
Qed.

Theorem pack_c_b_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, S = pack_c_b_e X C f c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C f c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_b X f,c) 1) U.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_b_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_b_e X C f c 1) U.
let X C f c. apply pack_c_b_e_1_eq (pack_c_b_e X C f c) X C f c. reflexivity.
Qed.

Theorem pack_c_b_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, S = pack_c_b_e X C f c -> forall x y :e X, f x y = decode_b (S 2) x y.
let S X C f c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_c X C,encode_b X f,c) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_c_b_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, forall x y :e X, f x y = decode_b (pack_c_b_e X C f c 2) x y.
let X C f c. apply pack_c_b_e_2_eq (pack_c_b_e X C f c) X C f c. reflexivity.
Qed.

Theorem pack_c_b_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, S = pack_c_b_e X C f c -> c = S 3.
let S X C f c. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_b X f,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_c_b_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, c = pack_c_b_e X C f c 3.
let X C f c. apply pack_c_b_e_3_eq (pack_c_b_e X C f c) X C f c. reflexivity.
Qed.

Theorem pack_c_b_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall c c':set, pack_c_b_e X C f c = pack_c_b_e X' C' f' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, f x y = f' x y) /\ c = c'.
let X X' C C' f f' c c'. assume H1.
claim L0: X' = pack_c_b_e X C f c 0.
{ exact pack_c_b_e_0_eq (pack_c_b_e X C f c) X' C' f' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_b_e_0_eq2 X C f c. }
apply and4I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_b_e_1_eq2 X C f c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_b_e_1_eq2 X' C' f' c' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_c_b_e_2_eq2 X C f c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_b_e_2_eq2 X' C' f' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_c_b_e_3_eq2 X C f c.
  rewrite H1. symmetry.
  exact pack_c_b_e_3_eq2 X' C' f' c'.
Qed.

Theorem pack_c_b_e_ext : forall X, forall C C':(set -> prop) -> prop, forall f f':set -> set -> set, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, f x y = f' x y) ->
 pack_c_b_e X C f c = pack_c_b_e X C' f' c.
let X C C' f f' c. assume H1. assume H2.
prove (X,encode_c X C,encode_b X f,c) = (X,encode_c X C',encode_b X f',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_b_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall c:set, c :e X -> q (pack_c_b_e X C f c)) -> q S.

Theorem pack_struct_c_b_e_I: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall c:set, c :e X -> struct_c_b_e (pack_c_b_e X C f c).
let X C f. assume Hf. let c. assume Hc. let q. assume Hq.
exact Hq X C f Hf c Hc.
Qed.

Theorem pack_struct_c_b_e_E2: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, struct_c_b_e (pack_c_b_e X C f c) -> forall x y :e X, f x y :e X.
let X C f c. assume H1. apply H1 (fun z => z = pack_c_b_e X C f c -> forall x y :e X, f x y :e X).
- let X'. let C'. let f'. assume Hf'. let c'. assume Hc'.
  assume Heq: pack_c_b_e X' C' f' c' = pack_c_b_e X C f c.
  apply pack_c_b_e_inj X' X C' C f' f c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_c_b_e_E3: forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set, struct_c_b_e (pack_c_b_e X C f c) -> c :e X.
let X C f c. assume H1. apply H1 (fun z => z = pack_c_b_e X C f c -> c :e X).
- let X'. let C'. let f'. assume Hf'. let c'. assume Hc'.
  assume Heq: pack_c_b_e X' C' f' c' = pack_c_b_e X C f c.
  apply pack_c_b_e_inj X' X C' C f' f c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hf'f Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_b_e_eta: forall S, struct_c_b_e S -> S = pack_c_b_e (S 0) (decode_c (S 1)) (decode_b (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_c_b_e (z 0) (decode_c (z 1)) (decode_b (z 2)) (z 3)).
let X. let C. let f. assume _. let c. assume _.
prove pack_c_b_e X C f c = pack_c_b_e (pack_c_b_e X C f c 0) (decode_c (pack_c_b_e X C f c 1)) (decode_b (pack_c_b_e X C f c 2)) (pack_c_b_e X C f c 3).
rewrite <- pack_c_b_e_0_eq2 X C f c.
rewrite <- pack_c_b_e_3_eq2 X C f c.
apply pack_c_b_e_ext.
- let U. assume HU.
  rewrite <- pack_c_b_e_1_eq2 X C f c U HU.
  apply iff_refl.
- exact pack_c_b_e_2_eq2 X C f c.
Qed.


Definition unpack_c_b_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (S 3).

Theorem unpack_c_b_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) -> Phi X C' f' c = Phi X C f c)
  ->
  unpack_c_b_e_i (pack_c_b_e X C f c) Phi = Phi X C f c.
let Phi X C f c.
assume HPhi.
prove Phi (pack_c_b_e X C f c 0) (decode_c (pack_c_b_e X C f c 1)) (decode_b (pack_c_b_e X C f c 2)) (pack_c_b_e X C f c 3) = Phi X C f c.
rewrite <- pack_c_b_e_0_eq2 X C f c.
prove Phi X (decode_c (pack_c_b_e X C f c 1)) (decode_b (pack_c_b_e X C f c 2)) (pack_c_b_e X C f c 3) = Phi X C f c.
rewrite <- pack_c_b_e_3_eq2 X C f c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_e X C f c 1) U.
  rewrite <- pack_c_b_e_1_eq2 X C f c U HU.
  apply iff_refl.
- exact pack_c_b_e_2_eq2 X C f c.
Qed.


Definition unpack_c_b_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_b (S 2)) (S 3).

Theorem unpack_c_b_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> set) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall f:set -> set -> set, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) -> Phi X C' f' c = Phi X C f c)
  ->
  unpack_c_b_e_o (pack_c_b_e X C f c) Phi = Phi X C f c.
let Phi X C f c.
assume HPhi.
prove Phi (pack_c_b_e X C f c 0) (decode_c (pack_c_b_e X C f c 1)) (decode_b (pack_c_b_e X C f c 2)) (pack_c_b_e X C f c 3) = Phi X C f c.
rewrite <- pack_c_b_e_0_eq2 X C f c.
prove Phi X (decode_c (pack_c_b_e X C f c 1)) (decode_b (pack_c_b_e X C f c 2)) (pack_c_b_e X C f c 3) = Phi X C f c.
rewrite <- pack_c_b_e_3_eq2 X C f c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_b_e X C f c 1) U.
  rewrite <- pack_c_b_e_1_eq2 X C f c U HU.
  apply iff_refl.
- exact pack_c_b_e_2_eq2 X C f c.
Qed.


Definition pack_c_u_r : set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> set := fun X C i R => (X,encode_c X C,encode_u X i,encode_r X R).

Theorem pack_c_u_r_0_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, S = pack_c_u_r X C i R -> X = S 0.
let S X C i R. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_u X i,encode_r X R) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_c_u_r_0_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, X = pack_c_u_r X C i R 0.
let X C i R. apply pack_c_u_r_0_eq (pack_c_u_r X C i R) X C i R. reflexivity.
Qed.

Theorem pack_c_u_r_1_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, S = pack_c_u_r X C i R -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C i R. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_u X i,encode_r X R) 1) U.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_u_r_1_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_u_r X C i R 1) U.
let X C i R. apply pack_c_u_r_1_eq (pack_c_u_r X C i R) X C i R. reflexivity.
Qed.

Theorem pack_c_u_r_2_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, S = pack_c_u_r X C i R -> forall x :e X, i x = decode_u (S 2) x.
let S X C i R. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_u X i,encode_r X R) 2) x.
rewrite tuple_4_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_u_r_2_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall x :e X, i x = decode_u (pack_c_u_r X C i R 2) x.
let X C i R. apply pack_c_u_r_2_eq (pack_c_u_r X C i R) X C i R. reflexivity.
Qed.

Theorem pack_c_u_r_3_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, S = pack_c_u_r X C i R -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X C i R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_u X i,encode_r X R) 3) x y.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_u_r_3_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_c_u_r X C i R 3) x y.
let X C i R. apply pack_c_u_r_3_eq (pack_c_u_r X C i R) X C i R. reflexivity.
Qed.

Theorem pack_c_u_r_inj : forall X X', forall C C':(set -> prop) -> prop, forall i i':set -> set, forall R R':set -> set -> prop, pack_c_u_r X C i R = pack_c_u_r X' C' i' R' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y).
let X X' C C' i i' R R'. assume H1.
claim L0: X' = pack_c_u_r X C i R 0.
{ exact pack_c_u_r_0_eq (pack_c_u_r X C i R) X' C' i' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_u_r_0_eq2 X C i R. }
apply and4I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_u_r_1_eq2 X C i R U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_u_r_1_eq2 X' C' i' R' U LU.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_u_r_2_eq2 X C i R x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_r_2_eq2 X' C' i' R' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_u_r_3_eq2 X C i R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_u_r_3_eq2 X' C' i' R' x Lx y Ly.
Qed.

Theorem pack_c_u_r_ext : forall X, forall C C':(set -> prop) -> prop, forall i i':set -> set, forall R R':set -> set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_c_u_r X C i R = pack_c_u_r X C' i' R'.
let X C C' i i' R R'. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_u X i,encode_r X R) = (X,encode_c X C',encode_u X i',encode_r X R').
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

Definition struct_c_u_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, q (pack_c_u_r X C i R)) -> q S.

Theorem pack_struct_c_u_r_I: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, struct_c_u_r (pack_c_u_r X C i R).
let X C i. assume Hi. let R q. assume Hq.
exact Hq X C i Hi R.
Qed.

Theorem pack_struct_c_u_r_E2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop, struct_c_u_r (pack_c_u_r X C i R) -> forall x :e X, i x :e X.
let X C i R. assume H1. apply H1 (fun z => z = pack_c_u_r X C i R -> forall x :e X, i x :e X).
- let X'. let C'. let i'. assume Hi'. let R'.
  assume Heq: pack_c_u_r X' C' i' R' = pack_c_u_r X C i R.
  apply pack_c_u_r_inj X' X C' C i' i R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i HR'R.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_c_u_r_eta: forall S, struct_c_u_r S -> S = pack_c_u_r (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_c_u_r (z 0) (decode_c (z 1)) (decode_u (z 2)) (decode_r (z 3))).
let X. let C. let i. assume _. let R.
prove pack_c_u_r X C i R = pack_c_u_r (pack_c_u_r X C i R 0) (decode_c (pack_c_u_r X C i R 1)) (decode_u (pack_c_u_r X C i R 2)) (decode_r (pack_c_u_r X C i R 3)).
rewrite <- pack_c_u_r_0_eq2 X C i R.
apply pack_c_u_r_ext.
- let U. assume HU.
  rewrite <- pack_c_u_r_1_eq2 X C i R U HU.
  apply iff_refl.
- exact pack_c_u_r_2_eq2 X C i R.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_u_r_3_eq2 X C i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_u_r_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)).

Theorem unpack_c_u_r_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' i' R' = Phi X C i R)
  ->
  unpack_c_u_r_i (pack_c_u_r X C i R) Phi = Phi X C i R.
let Phi X C i R.
assume HPhi.
prove Phi (pack_c_u_r X C i R 0) (decode_c (pack_c_u_r X C i R 1)) (decode_u (pack_c_u_r X C i R 2)) (decode_r (pack_c_u_r X C i R 3)) = Phi X C i R.
rewrite <- pack_c_u_r_0_eq2 X C i R.
prove Phi X (decode_c (pack_c_u_r X C i R 1)) (decode_u (pack_c_u_r X C i R 2)) (decode_r (pack_c_u_r X C i R 3)) = Phi X C i R.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_r X C i R 1) U.
  rewrite <- pack_c_u_r_1_eq2 X C i R U HU.
  apply iff_refl.
- exact pack_c_u_r_2_eq2 X C i R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_u_r X C i R 3) x y.
  rewrite <- pack_c_u_r_3_eq2 X C i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_u_r_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_r (S 3)).

Theorem unpack_c_u_r_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall R:set -> set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' i' R' = Phi X C i R)
  ->
  unpack_c_u_r_o (pack_c_u_r X C i R) Phi = Phi X C i R.
let Phi X C i R.
assume HPhi.
prove Phi (pack_c_u_r X C i R 0) (decode_c (pack_c_u_r X C i R 1)) (decode_u (pack_c_u_r X C i R 2)) (decode_r (pack_c_u_r X C i R 3)) = Phi X C i R.
rewrite <- pack_c_u_r_0_eq2 X C i R.
prove Phi X (decode_c (pack_c_u_r X C i R 1)) (decode_u (pack_c_u_r X C i R 2)) (decode_r (pack_c_u_r X C i R 3)) = Phi X C i R.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_r X C i R 1) U.
  rewrite <- pack_c_u_r_1_eq2 X C i R U HU.
  apply iff_refl.
- exact pack_c_u_r_2_eq2 X C i R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_u_r X C i R 3) x y.
  rewrite <- pack_c_u_r_3_eq2 X C i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_c_u_p : set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> set := fun X C i P => (X,encode_c X C,encode_u X i,encode_p X P).

Theorem pack_c_u_p_0_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, S = pack_c_u_p X C i P -> X = S 0.
let S X C i P. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_u X i,encode_p X P) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_c_u_p_0_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, X = pack_c_u_p X C i P 0.
let X C i P. apply pack_c_u_p_0_eq (pack_c_u_p X C i P) X C i P. reflexivity.
Qed.

Theorem pack_c_u_p_1_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, S = pack_c_u_p X C i P -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C i P. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_u X i,encode_p X P) 1) U.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_u_p_1_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_u_p X C i P 1) U.
let X C i P. apply pack_c_u_p_1_eq (pack_c_u_p X C i P) X C i P. reflexivity.
Qed.

Theorem pack_c_u_p_2_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, S = pack_c_u_p X C i P -> forall x :e X, i x = decode_u (S 2) x.
let S X C i P. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_u X i,encode_p X P) 2) x.
rewrite tuple_4_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_u_p_2_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall x :e X, i x = decode_u (pack_c_u_p X C i P 2) x.
let X C i P. apply pack_c_u_p_2_eq (pack_c_u_p X C i P) X C i P. reflexivity.
Qed.

Theorem pack_c_u_p_3_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, S = pack_c_u_p X C i P -> forall x :e X, P x = decode_p (S 3) x.
let S X C i P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_u X i,encode_p X P) 3) x.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_u_p_3_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, forall x :e X, P x = decode_p (pack_c_u_p X C i P 3) x.
let X C i P. apply pack_c_u_p_3_eq (pack_c_u_p X C i P) X C i P. reflexivity.
Qed.

Theorem pack_c_u_p_inj : forall X X', forall C C':(set -> prop) -> prop, forall i i':set -> set, forall P P':set -> prop, pack_c_u_p X C i P = pack_c_u_p X' C' i' P' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x).
let X X' C C' i i' P P'. assume H1.
claim L0: X' = pack_c_u_p X C i P 0.
{ exact pack_c_u_p_0_eq (pack_c_u_p X C i P) X' C' i' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_u_p_0_eq2 X C i P. }
apply and4I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_u_p_1_eq2 X C i P U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_u_p_1_eq2 X' C' i' P' U LU.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_u_p_2_eq2 X C i P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_p_2_eq2 X' C' i' P' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_u_p_3_eq2 X C i P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_p_3_eq2 X' C' i' P' x Lx.
Qed.

Theorem pack_c_u_p_ext : forall X, forall C C':(set -> prop) -> prop, forall i i':set -> set, forall P P':set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_u_p X C i P = pack_c_u_p X C' i' P'.
let X C C' i i' P P'. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_u X i,encode_p X P) = (X,encode_c X C',encode_u X i',encode_p X P').
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

Definition struct_c_u_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, q (pack_c_u_p X C i P)) -> q S.

Theorem pack_struct_c_u_p_I: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, struct_c_u_p (pack_c_u_p X C i P).
let X C i. assume Hi. let P q. assume Hq.
exact Hq X C i Hi P.
Qed.

Theorem pack_struct_c_u_p_E2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop, struct_c_u_p (pack_c_u_p X C i P) -> forall x :e X, i x :e X.
let X C i P. assume H1. apply H1 (fun z => z = pack_c_u_p X C i P -> forall x :e X, i x :e X).
- let X'. let C'. let i'. assume Hi'. let P'.
  assume Heq: pack_c_u_p X' C' i' P' = pack_c_u_p X C i P.
  apply pack_c_u_p_inj X' X C' C i' i P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_c_u_p_eta: forall S, struct_c_u_p S -> S = pack_c_u_p (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_p (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_c_u_p (z 0) (decode_c (z 1)) (decode_u (z 2)) (decode_p (z 3))).
let X. let C. let i. assume _. let P.
prove pack_c_u_p X C i P = pack_c_u_p (pack_c_u_p X C i P 0) (decode_c (pack_c_u_p X C i P 1)) (decode_u (pack_c_u_p X C i P 2)) (decode_p (pack_c_u_p X C i P 3)).
rewrite <- pack_c_u_p_0_eq2 X C i P.
apply pack_c_u_p_ext.
- let U. assume HU.
  rewrite <- pack_c_u_p_1_eq2 X C i P U HU.
  apply iff_refl.
- exact pack_c_u_p_2_eq2 X C i P.
- let x. assume Hx.
  rewrite <- pack_c_u_p_3_eq2 X C i P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_u_p_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_p (S 3)).

Theorem unpack_c_u_p_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' i' P' = Phi X C i P)
  ->
  unpack_c_u_p_i (pack_c_u_p X C i P) Phi = Phi X C i P.
let Phi X C i P.
assume HPhi.
prove Phi (pack_c_u_p X C i P 0) (decode_c (pack_c_u_p X C i P 1)) (decode_u (pack_c_u_p X C i P 2)) (decode_p (pack_c_u_p X C i P 3)) = Phi X C i P.
rewrite <- pack_c_u_p_0_eq2 X C i P.
prove Phi X (decode_c (pack_c_u_p X C i P 1)) (decode_u (pack_c_u_p X C i P 2)) (decode_p (pack_c_u_p X C i P 3)) = Phi X C i P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_p X C i P 1) U.
  rewrite <- pack_c_u_p_1_eq2 X C i P U HU.
  apply iff_refl.
- exact pack_c_u_p_2_eq2 X C i P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_u_p X C i P 3) x.
  rewrite <- pack_c_u_p_3_eq2 X C i P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_u_p_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (decode_p (S 3)).

Theorem unpack_c_u_p_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> (set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' i' P' = Phi X C i P)
  ->
  unpack_c_u_p_o (pack_c_u_p X C i P) Phi = Phi X C i P.
let Phi X C i P.
assume HPhi.
prove Phi (pack_c_u_p X C i P 0) (decode_c (pack_c_u_p X C i P 1)) (decode_u (pack_c_u_p X C i P 2)) (decode_p (pack_c_u_p X C i P 3)) = Phi X C i P.
rewrite <- pack_c_u_p_0_eq2 X C i P.
prove Phi X (decode_c (pack_c_u_p X C i P 1)) (decode_u (pack_c_u_p X C i P 2)) (decode_p (pack_c_u_p X C i P 3)) = Phi X C i P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_p X C i P 1) U.
  rewrite <- pack_c_u_p_1_eq2 X C i P U HU.
  apply iff_refl.
- exact pack_c_u_p_2_eq2 X C i P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_u_p X C i P 3) x.
  rewrite <- pack_c_u_p_3_eq2 X C i P x Hx.
  apply iff_refl.
Qed.


Definition pack_c_u_e : set -> ((set -> prop) -> prop) -> (set -> set) -> set -> set := fun X C i c => (X,encode_c X C,encode_u X i,c).

Theorem pack_c_u_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, S = pack_c_u_e X C i c -> X = S 0.
let S X C i c. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_u X i,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_c_u_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, X = pack_c_u_e X C i c 0.
let X C i c. apply pack_c_u_e_0_eq (pack_c_u_e X C i c) X C i c. reflexivity.
Qed.

Theorem pack_c_u_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, S = pack_c_u_e X C i c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C i c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_u X i,c) 1) U.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_u_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_u_e X C i c 1) U.
let X C i c. apply pack_c_u_e_1_eq (pack_c_u_e X C i c) X C i c. reflexivity.
Qed.

Theorem pack_c_u_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, S = pack_c_u_e X C i c -> forall x :e X, i x = decode_u (S 2) x.
let S X C i c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_c X C,encode_u X i,c) 2) x.
rewrite tuple_4_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_c_u_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, forall x :e X, i x = decode_u (pack_c_u_e X C i c 2) x.
let X C i c. apply pack_c_u_e_2_eq (pack_c_u_e X C i c) X C i c. reflexivity.
Qed.

Theorem pack_c_u_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, S = pack_c_u_e X C i c -> c = S 3.
let S X C i c. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_u X i,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_c_u_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, c = pack_c_u_e X C i c 3.
let X C i c. apply pack_c_u_e_3_eq (pack_c_u_e X C i c) X C i c. reflexivity.
Qed.

Theorem pack_c_u_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall i i':set -> set, forall c c':set, pack_c_u_e X C i c = pack_c_u_e X' C' i' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, i x = i' x) /\ c = c'.
let X X' C C' i i' c c'. assume H1.
claim L0: X' = pack_c_u_e X C i c 0.
{ exact pack_c_u_e_0_eq (pack_c_u_e X C i c) X' C' i' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_u_e_0_eq2 X C i c. }
apply and4I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_u_e_1_eq2 X C i c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_u_e_1_eq2 X' C' i' c' U LU.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_c_u_e_2_eq2 X C i c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_u_e_2_eq2 X' C' i' c' x Lx.
- prove c = c'.
  rewrite pack_c_u_e_3_eq2 X C i c.
  rewrite H1. symmetry.
  exact pack_c_u_e_3_eq2 X' C' i' c'.
Qed.

Theorem pack_c_u_e_ext : forall X, forall C C':(set -> prop) -> prop, forall i i':set -> set, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, i x = i' x) ->
 pack_c_u_e X C i c = pack_c_u_e X C' i' c.
let X C C' i i' c. assume H1. assume H2.
prove (X,encode_c X C,encode_u X i,c) = (X,encode_c X C',encode_u X i',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_u_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> q (pack_c_u_e X C i c)) -> q S.

Theorem pack_struct_c_u_e_I: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> struct_c_u_e (pack_c_u_e X C i c).
let X C i. assume Hi. let c. assume Hc. let q. assume Hq.
exact Hq X C i Hi c Hc.
Qed.

Theorem pack_struct_c_u_e_E2: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, struct_c_u_e (pack_c_u_e X C i c) -> forall x :e X, i x :e X.
let X C i c. assume H1. apply H1 (fun z => z = pack_c_u_e X C i c -> forall x :e X, i x :e X).
- let X'. let C'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_c_u_e X' C' i' c' = pack_c_u_e X C i c.
  apply pack_c_u_e_inj X' X C' C i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_c_u_e_E3: forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set, struct_c_u_e (pack_c_u_e X C i c) -> c :e X.
let X C i c. assume H1. apply H1 (fun z => z = pack_c_u_e X C i c -> c :e X).
- let X'. let C'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_c_u_e X' C' i' c' = pack_c_u_e X C i c.
  apply pack_c_u_e_inj X' X C' C i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C Hi'i Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_u_e_eta: forall S, struct_c_u_e S -> S = pack_c_u_e (S 0) (decode_c (S 1)) (decode_u (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_c_u_e (z 0) (decode_c (z 1)) (decode_u (z 2)) (z 3)).
let X. let C. let i. assume _. let c. assume _.
prove pack_c_u_e X C i c = pack_c_u_e (pack_c_u_e X C i c 0) (decode_c (pack_c_u_e X C i c 1)) (decode_u (pack_c_u_e X C i c 2)) (pack_c_u_e X C i c 3).
rewrite <- pack_c_u_e_0_eq2 X C i c.
rewrite <- pack_c_u_e_3_eq2 X C i c.
apply pack_c_u_e_ext.
- let U. assume HU.
  rewrite <- pack_c_u_e_1_eq2 X C i c U HU.
  apply iff_refl.
- exact pack_c_u_e_2_eq2 X C i c.
Qed.


Definition unpack_c_u_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (S 3).

Theorem unpack_c_u_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X C' i' c = Phi X C i c)
  ->
  unpack_c_u_e_i (pack_c_u_e X C i c) Phi = Phi X C i c.
let Phi X C i c.
assume HPhi.
prove Phi (pack_c_u_e X C i c 0) (decode_c (pack_c_u_e X C i c 1)) (decode_u (pack_c_u_e X C i c 2)) (pack_c_u_e X C i c 3) = Phi X C i c.
rewrite <- pack_c_u_e_0_eq2 X C i c.
prove Phi X (decode_c (pack_c_u_e X C i c 1)) (decode_u (pack_c_u_e X C i c 2)) (pack_c_u_e X C i c 3) = Phi X C i c.
rewrite <- pack_c_u_e_3_eq2 X C i c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_e X C i c 1) U.
  rewrite <- pack_c_u_e_1_eq2 X C i c U HU.
  apply iff_refl.
- exact pack_c_u_e_2_eq2 X C i c.
Qed.


Definition unpack_c_u_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_u (S 2)) (S 3).

Theorem unpack_c_u_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall i:set -> set, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X C' i' c = Phi X C i c)
  ->
  unpack_c_u_e_o (pack_c_u_e X C i c) Phi = Phi X C i c.
let Phi X C i c.
assume HPhi.
prove Phi (pack_c_u_e X C i c 0) (decode_c (pack_c_u_e X C i c 1)) (decode_u (pack_c_u_e X C i c 2)) (pack_c_u_e X C i c 3) = Phi X C i c.
rewrite <- pack_c_u_e_0_eq2 X C i c.
prove Phi X (decode_c (pack_c_u_e X C i c 1)) (decode_u (pack_c_u_e X C i c 2)) (pack_c_u_e X C i c 3) = Phi X C i c.
rewrite <- pack_c_u_e_3_eq2 X C i c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_u_e X C i c 1) U.
  rewrite <- pack_c_u_e_1_eq2 X C i c U HU.
  apply iff_refl.
- exact pack_c_u_e_2_eq2 X C i c.
Qed.


Definition pack_c_r_p : set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> set := fun X C R P => (X,encode_c X C,encode_r X R,encode_p X P).

Theorem pack_c_r_p_0_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_r_p X C R P -> X = S 0.
let S X C R P. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_r X R,encode_p X P) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_c_r_p_0_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, X = pack_c_r_p X C R P 0.
let X C R P. apply pack_c_r_p_0_eq (pack_c_r_p X C R P) X C R P. reflexivity.
Qed.

Theorem pack_c_r_p_1_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_r_p X C R P -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C R P. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_r X R,encode_p X P) 1) U.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_r_p_1_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_r_p X C R P 1) U.
let X C R P. apply pack_c_r_p_1_eq (pack_c_r_p X C R P) X C R P. reflexivity.
Qed.

Theorem pack_c_r_p_2_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_r_p X C R P -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X C R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_r X R,encode_p X P) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_r_p_2_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, R x y = decode_r (pack_c_r_p X C R P 2) x y.
let X C R P. apply pack_c_r_p_2_eq (pack_c_r_p X C R P) X C R P. reflexivity.
Qed.

Theorem pack_c_r_p_3_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, S = pack_c_r_p X C R P -> forall x :e X, P x = decode_p (S 3) x.
let S X C R P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_r X R,encode_p X P) 3) x.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_r_p_3_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_c_r_p X C R P 3) x.
let X C R P. apply pack_c_r_p_3_eq (pack_c_r_p X C R P) X C R P. reflexivity.
Qed.

Theorem pack_c_r_p_inj : forall X X', forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, forall P P':set -> prop, pack_c_r_p X C R P = pack_c_r_p X' C' R' P' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x).
let X X' C C' R R' P P'. assume H1.
claim L0: X' = pack_c_r_p X C R P 0.
{ exact pack_c_r_p_0_eq (pack_c_r_p X C R P) X' C' R' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_r_p_0_eq2 X C R P. }
apply and4I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_r_p_1_eq2 X C R P U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_r_p_1_eq2 X' C' R' P' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_r_p_2_eq2 X C R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_r_p_2_eq2 X' C' R' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_r_p_3_eq2 X C R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_r_p_3_eq2 X' C' R' P' x Lx.
Qed.

Theorem pack_c_r_p_ext : forall X, forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, forall P P':set -> prop,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_r_p X C R P = pack_c_r_p X C' R' P'.
let X C C' R R' P P'. assume H1. assume H2. assume H3.
prove (X,encode_c X C,encode_r X R,encode_p X P) = (X,encode_c X C',encode_r X R',encode_p X P').
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

Definition struct_c_r_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, q (pack_c_r_p X C R P)) -> q S.

Theorem pack_struct_c_r_p_I: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop, struct_c_r_p (pack_c_r_p X C R P).
let X C R P q. assume Hq.
exact Hq X C R P.
Qed.

Theorem struct_c_r_p_eta: forall S, struct_c_r_p S -> S = pack_c_r_p (S 0) (decode_c (S 1)) (decode_r (S 2)) (decode_p (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_c_r_p (z 0) (decode_c (z 1)) (decode_r (z 2)) (decode_p (z 3))).
let X. let C. let R. let P.
prove pack_c_r_p X C R P = pack_c_r_p (pack_c_r_p X C R P 0) (decode_c (pack_c_r_p X C R P 1)) (decode_r (pack_c_r_p X C R P 2)) (decode_p (pack_c_r_p X C R P 3)).
rewrite <- pack_c_r_p_0_eq2 X C R P.
apply pack_c_r_p_ext.
- let U. assume HU.
  rewrite <- pack_c_r_p_1_eq2 X C R P U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_r_p_2_eq2 X C R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_r_p_3_eq2 X C R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_r_p_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)) (decode_p (S 3)).

Theorem unpack_c_r_p_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' R' P' = Phi X C R P)
  ->
  unpack_c_r_p_i (pack_c_r_p X C R P) Phi = Phi X C R P.
let Phi X C R P.
assume HPhi.
prove Phi (pack_c_r_p X C R P 0) (decode_c (pack_c_r_p X C R P 1)) (decode_r (pack_c_r_p X C R P 2)) (decode_p (pack_c_r_p X C R P 3)) = Phi X C R P.
rewrite <- pack_c_r_p_0_eq2 X C R P.
prove Phi X (decode_c (pack_c_r_p X C R P 1)) (decode_r (pack_c_r_p X C R P 2)) (decode_p (pack_c_r_p X C R P 3)) = Phi X C R P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r_p X C R P 1) U.
  rewrite <- pack_c_r_p_1_eq2 X C R P U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r_p X C R P 2) x y.
  rewrite <- pack_c_r_p_2_eq2 X C R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_r_p X C R P 3) x.
  rewrite <- pack_c_r_p_3_eq2 X C R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_r_p_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)) (decode_p (S 3)).

Theorem unpack_c_r_p_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> (set -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' R' P' = Phi X C R P)
  ->
  unpack_c_r_p_o (pack_c_r_p X C R P) Phi = Phi X C R P.
let Phi X C R P.
assume HPhi.
prove Phi (pack_c_r_p X C R P 0) (decode_c (pack_c_r_p X C R P 1)) (decode_r (pack_c_r_p X C R P 2)) (decode_p (pack_c_r_p X C R P 3)) = Phi X C R P.
rewrite <- pack_c_r_p_0_eq2 X C R P.
prove Phi X (decode_c (pack_c_r_p X C R P 1)) (decode_r (pack_c_r_p X C R P 2)) (decode_p (pack_c_r_p X C R P 3)) = Phi X C R P.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r_p X C R P 1) U.
  rewrite <- pack_c_r_p_1_eq2 X C R P U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r_p X C R P 2) x y.
  rewrite <- pack_c_r_p_2_eq2 X C R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_r_p X C R P 3) x.
  rewrite <- pack_c_r_p_3_eq2 X C R P x Hx.
  apply iff_refl.
Qed.


Definition pack_c_r_e : set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set -> set := fun X C R c => (X,encode_c X C,encode_r X R,c).

Theorem pack_c_r_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, S = pack_c_r_e X C R c -> X = S 0.
let S X C R c. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_r X R,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_c_r_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, X = pack_c_r_e X C R c 0.
let X C R c. apply pack_c_r_e_0_eq (pack_c_r_e X C R c) X C R c. reflexivity.
Qed.

Theorem pack_c_r_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, S = pack_c_r_e X C R c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C R c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_r X R,c) 1) U.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_r_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_r_e X C R c 1) U.
let X C R c. apply pack_c_r_e_1_eq (pack_c_r_e X C R c) X C R c. reflexivity.
Qed.

Theorem pack_c_r_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, S = pack_c_r_e X C R c -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X C R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_c X C,encode_r X R,c) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_c_r_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_c_r_e X C R c 2) x y.
let X C R c. apply pack_c_r_e_2_eq (pack_c_r_e X C R c) X C R c. reflexivity.
Qed.

Theorem pack_c_r_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, S = pack_c_r_e X C R c -> c = S 3.
let S X C R c. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_r X R,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_c_r_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, c = pack_c_r_e X C R c 3.
let X C R c. apply pack_c_r_e_3_eq (pack_c_r_e X C R c) X C R c. reflexivity.
Qed.

Theorem pack_c_r_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, forall c c':set, pack_c_r_e X C R c = pack_c_r_e X' C' R' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x y :e X, R x y = R' x y) /\ c = c'.
let X X' C C' R R' c c'. assume H1.
claim L0: X' = pack_c_r_e X C R c 0.
{ exact pack_c_r_e_0_eq (pack_c_r_e X C R c) X' C' R' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_r_e_0_eq2 X C R c. }
apply and4I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_r_e_1_eq2 X C R c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_r_e_1_eq2 X' C' R' c' U LU.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_c_r_e_2_eq2 X C R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_c_r_e_2_eq2 X' C' R' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_c_r_e_3_eq2 X C R c.
  rewrite H1. symmetry.
  exact pack_c_r_e_3_eq2 X' C' R' c'.
Qed.

Theorem pack_c_r_e_ext : forall X, forall C C':(set -> prop) -> prop, forall R R':set -> set -> prop, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_c_r_e X C R c = pack_c_r_e X C' R' c.
let X C C' R R' c. assume H1. assume H2.
prove (X,encode_c X C,encode_r X R,c) = (X,encode_c X C',encode_r X R',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_r_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, c :e X -> q (pack_c_r_e X C R c)) -> q S.

Theorem pack_struct_c_r_e_I: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, c :e X -> struct_c_r_e (pack_c_r_e X C R c).
let X C R c. assume Hc. let q. assume Hq.
exact Hq X C R c Hc.
Qed.

Theorem pack_struct_c_r_e_E3: forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set, struct_c_r_e (pack_c_r_e X C R c) -> c :e X.
let X C R c. assume H1. apply H1 (fun z => z = pack_c_r_e X C R c -> c :e X).
- let X'. let C'. let R'. let c'. assume Hc'.
  assume Heq: pack_c_r_e X' C' R' c' = pack_c_r_e X C R c.
  apply pack_c_r_e_inj X' X C' C R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C HR'R Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_r_e_eta: forall S, struct_c_r_e S -> S = pack_c_r_e (S 0) (decode_c (S 1)) (decode_r (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_c_r_e (z 0) (decode_c (z 1)) (decode_r (z 2)) (z 3)).
let X. let C. let R. let c. assume _.
prove pack_c_r_e X C R c = pack_c_r_e (pack_c_r_e X C R c 0) (decode_c (pack_c_r_e X C R c 1)) (decode_r (pack_c_r_e X C R c 2)) (pack_c_r_e X C R c 3).
rewrite <- pack_c_r_e_0_eq2 X C R c.
rewrite <- pack_c_r_e_3_eq2 X C R c.
apply pack_c_r_e_ext.
- let U. assume HU.
  rewrite <- pack_c_r_e_1_eq2 X C R c U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_c_r_e_2_eq2 X C R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_r_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)) (S 3).

Theorem unpack_c_r_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' R' c = Phi X C R c)
  ->
  unpack_c_r_e_i (pack_c_r_e X C R c) Phi = Phi X C R c.
let Phi X C R c.
assume HPhi.
prove Phi (pack_c_r_e X C R c 0) (decode_c (pack_c_r_e X C R c 1)) (decode_r (pack_c_r_e X C R c 2)) (pack_c_r_e X C R c 3) = Phi X C R c.
rewrite <- pack_c_r_e_0_eq2 X C R c.
prove Phi X (decode_c (pack_c_r_e X C R c 1)) (decode_r (pack_c_r_e X C R c 2)) (pack_c_r_e X C R c 3) = Phi X C R c.
rewrite <- pack_c_r_e_3_eq2 X C R c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r_e X C R c 1) U.
  rewrite <- pack_c_r_e_1_eq2 X C R c U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r_e X C R c 2) x y.
  rewrite <- pack_c_r_e_2_eq2 X C R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_c_r_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_r (S 2)) (S 3).

Theorem unpack_c_r_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> set -> prop) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall R:set -> set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X C' R' c = Phi X C R c)
  ->
  unpack_c_r_e_o (pack_c_r_e X C R c) Phi = Phi X C R c.
let Phi X C R c.
assume HPhi.
prove Phi (pack_c_r_e X C R c 0) (decode_c (pack_c_r_e X C R c 1)) (decode_r (pack_c_r_e X C R c 2)) (pack_c_r_e X C R c 3) = Phi X C R c.
rewrite <- pack_c_r_e_0_eq2 X C R c.
prove Phi X (decode_c (pack_c_r_e X C R c 1)) (decode_r (pack_c_r_e X C R c 2)) (pack_c_r_e X C R c 3) = Phi X C R c.
rewrite <- pack_c_r_e_3_eq2 X C R c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_r_e X C R c 1) U.
  rewrite <- pack_c_r_e_1_eq2 X C R c U HU.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_c_r_e X C R c 2) x y.
  rewrite <- pack_c_r_e_2_eq2 X C R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_c_p_e : set -> ((set -> prop) -> prop) -> (set -> prop) -> set -> set := fun X C P c => (X,encode_c X C,encode_p X P,c).

Theorem pack_c_p_e_0_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, S = pack_c_p_e X C P c -> X = S 0.
let S X C P c. assume H1. rewrite H1.
prove X = (X,encode_c X C,encode_p X P,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_c_p_e_0_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, X = pack_c_p_e X C P c 0.
let X C P c. apply pack_c_p_e_0_eq (pack_c_p_e X C P c) X C P c. reflexivity.
Qed.

Theorem pack_c_p_e_1_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, S = pack_c_p_e X C P c -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C P c. assume H1.
let U. assume HU. rewrite H1.
prove C U = decode_c ((X,encode_c X C,encode_p X P,c) 1) U.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_p_e_1_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c_p_e X C P c 1) U.
let X C P c. apply pack_c_p_e_1_eq (pack_c_p_e X C P c) X C P c. reflexivity.
Qed.

Theorem pack_c_p_e_2_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, S = pack_c_p_e X C P c -> forall x :e X, P x = decode_p (S 2) x.
let S X C P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_c X C,encode_p X P,c) 2) x.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_c_p_e_2_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_c_p_e X C P c 2) x.
let X C P c. apply pack_c_p_e_2_eq (pack_c_p_e X C P c) X C P c. reflexivity.
Qed.

Theorem pack_c_p_e_3_eq: forall S X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, S = pack_c_p_e X C P c -> c = S 3.
let S X C P c. assume H1.
rewrite H1. prove c = (X,encode_c X C,encode_p X P,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_c_p_e_3_eq2: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, c = pack_c_p_e X C P c 3.
let X C P c. apply pack_c_p_e_3_eq (pack_c_p_e X C P c) X C P c. reflexivity.
Qed.

Theorem pack_c_p_e_inj : forall X X', forall C C':(set -> prop) -> prop, forall P P':set -> prop, forall c c':set, pack_c_p_e X C P c = pack_c_p_e X' C' P' c' -> X = X' /\ (forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' C C' P P' c c'. assume H1.
claim L0: X' = pack_c_p_e X C P c 0.
{ exact pack_c_p_e_0_eq (pack_c_p_e X C P c) X' C' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_p_e_0_eq2 X C P c. }
apply and4I.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  rewrite pack_c_p_e_1_eq2 X C P c U HU.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite H1. symmetry.
  exact pack_c_p_e_1_eq2 X' C' P' c' U LU.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_c_p_e_2_eq2 X C P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_c_p_e_2_eq2 X' C' P' c' x Lx.
- prove c = c'.
  rewrite pack_c_p_e_3_eq2 X C P c.
  rewrite H1. symmetry.
  exact pack_c_p_e_3_eq2 X' C' P' c'.
Qed.

Theorem pack_c_p_e_ext : forall X, forall C C':(set -> prop) -> prop, forall P P':set -> prop, forall c,
 (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->
 (forall x :e X, P x <-> P' x) ->
 pack_c_p_e X C P c = pack_c_p_e X C' P' c.
let X C C' P P' c. assume H1. assume H2.
prove (X,encode_c X C,encode_p X P,c) = (X,encode_c X C',encode_p X P',c).
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_c_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, c :e X -> q (pack_c_p_e X C P c)) -> q S.

Theorem pack_struct_c_p_e_I: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, c :e X -> struct_c_p_e (pack_c_p_e X C P c).
let X C P c. assume Hc. let q. assume Hq.
exact Hq X C P c Hc.
Qed.

Theorem pack_struct_c_p_e_E3: forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set, struct_c_p_e (pack_c_p_e X C P c) -> c :e X.
let X C P c. assume H1. apply H1 (fun z => z = pack_c_p_e X C P c -> c :e X).
- let X'. let C'. let P'. let c'. assume Hc'.
  assume Heq: pack_c_p_e X' C' P' c' = pack_c_p_e X C P c.
  apply pack_c_p_e_inj X' X C' C P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HC'C HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_c_p_e_eta: forall S, struct_c_p_e S -> S = pack_c_p_e (S 0) (decode_c (S 1)) (decode_p (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_c_p_e (z 0) (decode_c (z 1)) (decode_p (z 2)) (z 3)).
let X. let C. let P. let c. assume _.
prove pack_c_p_e X C P c = pack_c_p_e (pack_c_p_e X C P c 0) (decode_c (pack_c_p_e X C P c 1)) (decode_p (pack_c_p_e X C P c 2)) (pack_c_p_e X C P c 3).
rewrite <- pack_c_p_e_0_eq2 X C P c.
rewrite <- pack_c_p_e_3_eq2 X C P c.
apply pack_c_p_e_ext.
- let U. assume HU.
  rewrite <- pack_c_p_e_1_eq2 X C P c U HU.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_c_p_e_2_eq2 X C P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_p_e_i : set -> (set -> ((set -> prop) -> prop) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_p (S 2)) (S 3).

Theorem unpack_c_p_e_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> prop) -> set -> set,
  forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' P' c = Phi X C P c)
  ->
  unpack_c_p_e_i (pack_c_p_e X C P c) Phi = Phi X C P c.
let Phi X C P c.
assume HPhi.
prove Phi (pack_c_p_e X C P c 0) (decode_c (pack_c_p_e X C P c 1)) (decode_p (pack_c_p_e X C P c 2)) (pack_c_p_e X C P c 3) = Phi X C P c.
rewrite <- pack_c_p_e_0_eq2 X C P c.
prove Phi X (decode_c (pack_c_p_e X C P c 1)) (decode_p (pack_c_p_e X C P c 2)) (pack_c_p_e X C P c 3) = Phi X C P c.
rewrite <- pack_c_p_e_3_eq2 X C P c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_p_e X C P c 1) U.
  rewrite <- pack_c_p_e_1_eq2 X C P c U HU.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_p_e X C P c 2) x.
  rewrite <- pack_c_p_e_2_eq2 X C P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_c_p_e_o : set -> (set -> ((set -> prop) -> prop) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)) (decode_p (S 2)) (S 3).

Theorem unpack_c_p_e_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> (set -> prop) -> set -> prop,
  forall X, forall C:(set -> prop) -> prop, forall P:set -> prop, forall c:set,
  ( forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X C' P' c = Phi X C P c)
  ->
  unpack_c_p_e_o (pack_c_p_e X C P c) Phi = Phi X C P c.
let Phi X C P c.
assume HPhi.
prove Phi (pack_c_p_e X C P c 0) (decode_c (pack_c_p_e X C P c 1)) (decode_p (pack_c_p_e X C P c 2)) (pack_c_p_e X C P c 3) = Phi X C P c.
rewrite <- pack_c_p_e_0_eq2 X C P c.
prove Phi X (decode_c (pack_c_p_e X C P c 1)) (decode_p (pack_c_p_e X C P c 2)) (pack_c_p_e X C P c 3) = Phi X C P c.
rewrite <- pack_c_p_e_3_eq2 X C P c.
apply HPhi.
- let U. assume HU.
  prove C U <-> decode_c (pack_c_p_e X C P c 1) U.
  rewrite <- pack_c_p_e_1_eq2 X C P c U HU.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_c_p_e X C P c 2) x.
  rewrite <- pack_c_p_e_2_eq2 X C P c x Hx.
  apply iff_refl.
Qed.


Definition pack_b_b_b : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set := fun X f g h => (X,encode_b X f,encode_b X g,encode_b X h).

Theorem pack_b_b_b_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, S = pack_b_b_b X f g h -> X = S 0.
let S X f g h. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_b X h) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_b_b_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, X = pack_b_b_b X f g h 0.
let X f g h. apply pack_b_b_b_0_eq (pack_b_b_b X f g h) X f g h. reflexivity.
Qed.

Theorem pack_b_b_b_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, S = pack_b_b_b X f g h -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g h. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_b_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall x y :e X, f x y = decode_b (pack_b_b_b X f g h 1) x y.
let X f g h. apply pack_b_b_b_1_eq (pack_b_b_b X f g h) X f g h. reflexivity.
Qed.

Theorem pack_b_b_b_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, S = pack_b_b_b X f g h -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g h. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_b_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall x y :e X, g x y = decode_b (pack_b_b_b X f g h 2) x y.
let X f g h. apply pack_b_b_b_2_eq (pack_b_b_b X f g h) X f g h. reflexivity.
Qed.

Theorem pack_b_b_b_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, S = pack_b_b_b X f g h -> forall x y :e X, h x y = decode_b (S 3) x y.
let S X f g h. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove h x y = decode_b ((X,encode_b X f,encode_b X g,encode_b X h) 3) x y.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_b X h x Hx y Hy.
Qed.

Theorem pack_b_b_b_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, forall x y :e X, h x y = decode_b (pack_b_b_b X f g h 3) x y.
let X f g h. apply pack_b_b_b_3_eq (pack_b_b_b X f g h) X f g h. reflexivity.
Qed.

Theorem pack_b_b_b_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall h h':set -> set -> set, pack_b_b_b X f g h = pack_b_b_b X' f' g' h' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x y :e X, h x y = h' x y).
let X X' f f' g g' h h'. assume H1.
claim L0: X' = pack_b_b_b X f g h 0.
{ exact pack_b_b_b_0_eq (pack_b_b_b X f g h) X' f' g' h' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_b_0_eq2 X f g h. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_b_1_eq2 X f g h x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_1_eq2 X' f' g' h' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_b_2_eq2 X f g h x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_2_eq2 X' f' g' h' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove h x y = h' x y.
  rewrite pack_b_b_b_3_eq2 X f g h x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_b_3_eq2 X' f' g' h' x Lx y Ly.
Qed.

Theorem pack_b_b_b_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall h h':set -> set -> set,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x y :e X, h x y = h' x y) ->
 pack_b_b_b X f g h = pack_b_b_b X f' g' h'.
let X f f' g g' h h'. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_b X g,encode_b X h) = (X,encode_b X f',encode_b X g',encode_b X h').
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

Definition struct_b_b_b : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall h:set -> set -> set, (forall x y :e X, h x y :e X) -> q (pack_b_b_b X f g h)) -> q S.

Theorem pack_struct_b_b_b_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall h:set -> set -> set, (forall x y :e X, h x y :e X) -> struct_b_b_b (pack_b_b_b X f g h).
let X f. assume Hf. let g. assume Hg. let h. assume Hh. let q. assume Hq.
exact Hq X f Hf g Hg h Hh.
Qed.

Theorem pack_struct_b_b_b_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, struct_b_b_b (pack_b_b_b X f g h) -> forall x y :e X, f x y :e X.
let X f g h. assume H1. apply H1 (fun z => z = pack_b_b_b X f g h -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'.
  assume Heq: pack_b_b_b X' f' g' h' = pack_b_b_b X f g h.
  apply pack_b_b_b_inj X' X f' f g' g h' h Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, struct_b_b_b (pack_b_b_b X f g h) -> forall x y :e X, g x y :e X.
let X f g h. assume H1. apply H1 (fun z => z = pack_b_b_b X f g h -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'.
  assume Heq: pack_b_b_b X' f' g' h' = pack_b_b_b X f g h.
  apply pack_b_b_b_inj X' X f' f g' g h' h Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_b_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set, struct_b_b_b (pack_b_b_b X f g h) -> forall x y :e X, h x y :e X.
let X f g h. assume H1. apply H1 (fun z => z = pack_b_b_b X f g h -> forall x y :e X, h x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let h'. assume Hh'.
  assume Heq: pack_b_b_b X' f' g' h' = pack_b_b_b X f g h.
  apply pack_b_b_b_inj X' X f' f g' g h' h Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hh'h.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hh'h x Hx y Hy.  exact Hh' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_b_b_eta: forall S, struct_b_b_b S -> S = pack_b_b_b (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_b (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_b (z 3))).
let X. let f. assume _. let g. assume _. let h. assume _.
prove pack_b_b_b X f g h = pack_b_b_b (pack_b_b_b X f g h 0) (decode_b (pack_b_b_b X f g h 1)) (decode_b (pack_b_b_b X f g h 2)) (decode_b (pack_b_b_b X f g h 3)).
rewrite <- pack_b_b_b_0_eq2 X f g h.
apply pack_b_b_b_ext.
- exact pack_b_b_b_1_eq2 X f g h.
- exact pack_b_b_b_2_eq2 X f g h.
- exact pack_b_b_b_3_eq2 X f g h.
Qed.


Definition unpack_b_b_b_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)).

Theorem unpack_b_b_b_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall h':set -> set -> set, (forall x y :e X, h x y = h' x y) -> Phi X f' g' h' = Phi X f g h)
  ->
  unpack_b_b_b_i (pack_b_b_b X f g h) Phi = Phi X f g h.
let Phi X f g h.
assume HPhi.
prove Phi (pack_b_b_b X f g h 0) (decode_b (pack_b_b_b X f g h 1)) (decode_b (pack_b_b_b X f g h 2)) (decode_b (pack_b_b_b X f g h 3)) = Phi X f g h.
rewrite <- pack_b_b_b_0_eq2 X f g h.
prove Phi X (decode_b (pack_b_b_b X f g h 1)) (decode_b (pack_b_b_b X f g h 2)) (decode_b (pack_b_b_b X f g h 3)) = Phi X f g h.
apply HPhi.
- exact pack_b_b_b_1_eq2 X f g h.
- exact pack_b_b_b_2_eq2 X f g h.
- exact pack_b_b_b_3_eq2 X f g h.
Qed.


Definition unpack_b_b_b_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_b (S 3)).

Theorem unpack_b_b_b_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall h:set -> set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall h':set -> set -> set, (forall x y :e X, h x y = h' x y) -> Phi X f' g' h' = Phi X f g h)
  ->
  unpack_b_b_b_o (pack_b_b_b X f g h) Phi = Phi X f g h.
let Phi X f g h.
assume HPhi.
prove Phi (pack_b_b_b X f g h 0) (decode_b (pack_b_b_b X f g h 1)) (decode_b (pack_b_b_b X f g h 2)) (decode_b (pack_b_b_b X f g h 3)) = Phi X f g h.
rewrite <- pack_b_b_b_0_eq2 X f g h.
prove Phi X (decode_b (pack_b_b_b X f g h 1)) (decode_b (pack_b_b_b X f g h 2)) (decode_b (pack_b_b_b X f g h 3)) = Phi X f g h.
apply HPhi.
- exact pack_b_b_b_1_eq2 X f g h.
- exact pack_b_b_b_2_eq2 X f g h.
- exact pack_b_b_b_3_eq2 X f g h.
Qed.


Definition pack_b_b_u : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set := fun X f g i => (X,encode_b X f,encode_b X g,encode_u X i).

Theorem pack_b_b_u_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, S = pack_b_b_u X f g i -> X = S 0.
let S X f g i. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_u X i) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_b_u_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, X = pack_b_b_u X f g i 0.
let X f g i. apply pack_b_b_u_0_eq (pack_b_b_u X f g i) X f g i. reflexivity.
Qed.

Theorem pack_b_b_u_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, S = pack_b_b_u X f g i -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g i. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_u X i) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_u_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall x y :e X, f x y = decode_b (pack_b_b_u X f g i 1) x y.
let X f g i. apply pack_b_b_u_1_eq (pack_b_b_u X f g i) X f g i. reflexivity.
Qed.

Theorem pack_b_b_u_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, S = pack_b_b_u X f g i -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g i. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_u X i) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_u_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall x y :e X, g x y = decode_b (pack_b_b_u X f g i 2) x y.
let X f g i. apply pack_b_b_u_2_eq (pack_b_b_u X f g i) X f g i. reflexivity.
Qed.

Theorem pack_b_b_u_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, S = pack_b_b_u X f g i -> forall x :e X, i x = decode_u (S 3) x.
let S X f g i. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_b X g,encode_u X i) 3) x.
rewrite tuple_4_3_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_b_u_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, forall x :e X, i x = decode_u (pack_b_b_u X f g i 3) x.
let X f g i. apply pack_b_b_u_3_eq (pack_b_b_u X f g i) X f g i. reflexivity.
Qed.

Theorem pack_b_b_u_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall i i':set -> set, pack_b_b_u X f g i = pack_b_b_u X' f' g' i' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x :e X, i x = i' x).
let X X' f f' g g' i i'. assume H1.
claim L0: X' = pack_b_b_u X f g i 0.
{ exact pack_b_b_u_0_eq (pack_b_b_u X f g i) X' f' g' i' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_u_0_eq2 X f g i. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_u_1_eq2 X f g i x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_1_eq2 X' f' g' i' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_u_2_eq2 X f g i x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_u_2_eq2 X' f' g' i' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_b_u_3_eq2 X f g i x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_u_3_eq2 X' f' g' i' x Lx.
Qed.

Theorem pack_b_b_u_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall i i':set -> set,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x :e X, i x = i' x) ->
 pack_b_b_u X f g i = pack_b_b_u X f' g' i'.
let X f f' g g' i i'. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_b X g,encode_u X i) = (X,encode_b X f',encode_b X g',encode_u X i').
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

Definition struct_b_b_u : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> q (pack_b_b_u X f g i)) -> q S.

Theorem pack_struct_b_b_u_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> struct_b_b_u (pack_b_b_u X f g i).
let X f. assume Hf. let g. assume Hg. let i. assume Hi. let q. assume Hq.
exact Hq X f Hf g Hg i Hi.
Qed.

Theorem pack_struct_b_b_u_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, struct_b_b_u (pack_b_b_u X f g i) -> forall x y :e X, f x y :e X.
let X f g i. assume H1. apply H1 (fun z => z = pack_b_b_u X f g i -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'.
  assume Heq: pack_b_b_u X' f' g' i' = pack_b_b_u X f g i.
  apply pack_b_b_u_inj X' X f' f g' g i' i Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, struct_b_b_u (pack_b_b_u X f g i) -> forall x y :e X, g x y :e X.
let X f g i. assume H1. apply H1 (fun z => z = pack_b_b_u X f g i -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'.
  assume Heq: pack_b_b_u X' f' g' i' = pack_b_b_u X f g i.
  apply pack_b_b_u_inj X' X f' f g' g i' i Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_u_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set, struct_b_b_u (pack_b_b_u X f g i) -> forall x :e X, i x :e X.
let X f g i. assume H1. apply H1 (fun z => z = pack_b_b_u X f g i -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let i'. assume Hi'.
  assume Heq: pack_b_b_u X' f' g' i' = pack_b_b_u X f g i.
  apply pack_b_b_u_inj X' X f' f g' g i' i Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hi'i.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_b_b_u_eta: forall S, struct_b_b_u S -> S = pack_b_b_u (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_u (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_u (z 3))).
let X. let f. assume _. let g. assume _. let i. assume _.
prove pack_b_b_u X f g i = pack_b_b_u (pack_b_b_u X f g i 0) (decode_b (pack_b_b_u X f g i 1)) (decode_b (pack_b_b_u X f g i 2)) (decode_u (pack_b_b_u X f g i 3)).
rewrite <- pack_b_b_u_0_eq2 X f g i.
apply pack_b_b_u_ext.
- exact pack_b_b_u_1_eq2 X f g i.
- exact pack_b_b_u_2_eq2 X f g i.
- exact pack_b_b_u_3_eq2 X f g i.
Qed.


Definition unpack_b_b_u_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)).

Theorem unpack_b_b_u_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' g' i' = Phi X f g i)
  ->
  unpack_b_b_u_i (pack_b_b_u X f g i) Phi = Phi X f g i.
let Phi X f g i.
assume HPhi.
prove Phi (pack_b_b_u X f g i 0) (decode_b (pack_b_b_u X f g i 1)) (decode_b (pack_b_b_u X f g i 2)) (decode_u (pack_b_b_u X f g i 3)) = Phi X f g i.
rewrite <- pack_b_b_u_0_eq2 X f g i.
prove Phi X (decode_b (pack_b_b_u X f g i 1)) (decode_b (pack_b_b_u X f g i 2)) (decode_u (pack_b_b_u X f g i 3)) = Phi X f g i.
apply HPhi.
- exact pack_b_b_u_1_eq2 X f g i.
- exact pack_b_b_u_2_eq2 X f g i.
- exact pack_b_b_u_3_eq2 X f g i.
Qed.


Definition unpack_b_b_u_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_u (S 3)).

Theorem unpack_b_b_u_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall i:set -> set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' g' i' = Phi X f g i)
  ->
  unpack_b_b_u_o (pack_b_b_u X f g i) Phi = Phi X f g i.
let Phi X f g i.
assume HPhi.
prove Phi (pack_b_b_u X f g i 0) (decode_b (pack_b_b_u X f g i 1)) (decode_b (pack_b_b_u X f g i 2)) (decode_u (pack_b_b_u X f g i 3)) = Phi X f g i.
rewrite <- pack_b_b_u_0_eq2 X f g i.
prove Phi X (decode_b (pack_b_b_u X f g i 1)) (decode_b (pack_b_b_u X f g i 2)) (decode_u (pack_b_b_u X f g i 3)) = Phi X f g i.
apply HPhi.
- exact pack_b_b_u_1_eq2 X f g i.
- exact pack_b_b_u_2_eq2 X f g i.
- exact pack_b_b_u_3_eq2 X f g i.
Qed.


Definition pack_b_b_r : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set := fun X f g R => (X,encode_b X f,encode_b X g,encode_r X R).

Theorem pack_b_b_r_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, S = pack_b_b_r X f g R -> X = S 0.
let S X f g R. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_r X R) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_b_r_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, X = pack_b_b_r X f g R 0.
let X f g R. apply pack_b_b_r_0_eq (pack_b_b_r X f g R) X f g R. reflexivity.
Qed.

Theorem pack_b_b_r_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, S = pack_b_b_r X f g R -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_r X R) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_r_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, f x y = decode_b (pack_b_b_r X f g R 1) x y.
let X f g R. apply pack_b_b_r_1_eq (pack_b_b_r X f g R) X f g R. reflexivity.
Qed.

Theorem pack_b_b_r_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, S = pack_b_b_r X f g R -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_r X R) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_r_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, g x y = decode_b (pack_b_b_r X f g R 2) x y.
let X f g R. apply pack_b_b_r_2_eq (pack_b_b_r X f g R) X f g R. reflexivity.
Qed.

Theorem pack_b_b_r_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, S = pack_b_b_r X f g R -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X f g R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_b X g,encode_r X R) 3) x y.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_b_r_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_b_b_r X f g R 3) x y.
let X f g R. apply pack_b_b_r_3_eq (pack_b_b_r X f g R) X f g R. reflexivity.
Qed.

Theorem pack_b_b_r_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall R R':set -> set -> prop, pack_b_b_r X f g R = pack_b_b_r X' f' g' R' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x y :e X, R x y = R' x y).
let X X' f f' g g' R R'. assume H1.
claim L0: X' = pack_b_b_r X f g R 0.
{ exact pack_b_b_r_0_eq (pack_b_b_r X f g R) X' f' g' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_r_0_eq2 X f g R. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_r_1_eq2 X f g R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_1_eq2 X' f' g' R' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_r_2_eq2 X f g R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_2_eq2 X' f' g' R' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_b_r_3_eq2 X f g R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_r_3_eq2 X' f' g' R' x Lx y Ly.
Qed.

Theorem pack_b_b_r_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall R R':set -> set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_b_b_r X f g R = pack_b_b_r X f' g' R'.
let X f f' g g' R R'. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_b X g,encode_r X R) = (X,encode_b X f',encode_b X g',encode_r X R').
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

Definition struct_b_b_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall R:set -> set -> prop, q (pack_b_b_r X f g R)) -> q S.

Theorem pack_struct_b_b_r_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall R:set -> set -> prop, struct_b_b_r (pack_b_b_r X f g R).
let X f. assume Hf. let g. assume Hg. let R q. assume Hq.
exact Hq X f Hf g Hg R.
Qed.

Theorem pack_struct_b_b_r_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, struct_b_b_r (pack_b_b_r X f g R) -> forall x y :e X, f x y :e X.
let X f g R. assume H1. apply H1 (fun z => z = pack_b_b_r X f g R -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let R'.
  assume Heq: pack_b_b_r X' f' g' R' = pack_b_b_r X f g R.
  apply pack_b_b_r_inj X' X f' f g' g R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_r_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop, struct_b_b_r (pack_b_b_r X f g R) -> forall x y :e X, g x y :e X.
let X f g R. assume H1. apply H1 (fun z => z = pack_b_b_r X f g R -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let R'.
  assume Heq: pack_b_b_r X' f' g' R' = pack_b_b_r X f g R.
  apply pack_b_b_r_inj X' X f' f g' g R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_b_r_eta: forall S, struct_b_b_r S -> S = pack_b_b_r (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_r (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_r (z 3))).
let X. let f. assume _. let g. assume _. let R.
prove pack_b_b_r X f g R = pack_b_b_r (pack_b_b_r X f g R 0) (decode_b (pack_b_b_r X f g R 1)) (decode_b (pack_b_b_r X f g R 2)) (decode_r (pack_b_b_r X f g R 3)).
rewrite <- pack_b_b_r_0_eq2 X f g R.
apply pack_b_b_r_ext.
- exact pack_b_b_r_1_eq2 X f g R.
- exact pack_b_b_r_2_eq2 X f g R.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_b_r_3_eq2 X f g R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_b_r_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)).

Theorem unpack_b_b_r_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' g' R' = Phi X f g R)
  ->
  unpack_b_b_r_i (pack_b_b_r X f g R) Phi = Phi X f g R.
let Phi X f g R.
assume HPhi.
prove Phi (pack_b_b_r X f g R 0) (decode_b (pack_b_b_r X f g R 1)) (decode_b (pack_b_b_r X f g R 2)) (decode_r (pack_b_b_r X f g R 3)) = Phi X f g R.
rewrite <- pack_b_b_r_0_eq2 X f g R.
prove Phi X (decode_b (pack_b_b_r X f g R 1)) (decode_b (pack_b_b_r X f g R 2)) (decode_r (pack_b_b_r X f g R 3)) = Phi X f g R.
apply HPhi.
- exact pack_b_b_r_1_eq2 X f g R.
- exact pack_b_b_r_2_eq2 X f g R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_r X f g R 3) x y.
  rewrite <- pack_b_b_r_3_eq2 X f g R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_b_r_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_r (S 3)).

Theorem unpack_b_b_r_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall R:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' g' R' = Phi X f g R)
  ->
  unpack_b_b_r_o (pack_b_b_r X f g R) Phi = Phi X f g R.
let Phi X f g R.
assume HPhi.
prove Phi (pack_b_b_r X f g R 0) (decode_b (pack_b_b_r X f g R 1)) (decode_b (pack_b_b_r X f g R 2)) (decode_r (pack_b_b_r X f g R 3)) = Phi X f g R.
rewrite <- pack_b_b_r_0_eq2 X f g R.
prove Phi X (decode_b (pack_b_b_r X f g R 1)) (decode_b (pack_b_b_r X f g R 2)) (decode_r (pack_b_b_r X f g R 3)) = Phi X f g R.
apply HPhi.
- exact pack_b_b_r_1_eq2 X f g R.
- exact pack_b_b_r_2_eq2 X f g R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_b_r X f g R 3) x y.
  rewrite <- pack_b_b_r_3_eq2 X f g R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_b_p : set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set := fun X f g P => (X,encode_b X f,encode_b X g,encode_p X P).

Theorem pack_b_b_p_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, S = pack_b_b_p X f g P -> X = S 0.
let S X f g P. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,encode_p X P) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_b_p_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, X = pack_b_b_p X f g P 0.
let X f g P. apply pack_b_b_p_0_eq (pack_b_b_p X f g P) X f g P. reflexivity.
Qed.

Theorem pack_b_b_p_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, S = pack_b_b_p X f g P -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,encode_p X P) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_p_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_b_b_p X f g P 1) x y.
let X f g P. apply pack_b_b_p_1_eq (pack_b_b_p X f g P) X f g P. reflexivity.
Qed.

Theorem pack_b_b_p_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, S = pack_b_b_p X f g P -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,encode_p X P) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_p_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall x y :e X, g x y = decode_b (pack_b_b_p X f g P 2) x y.
let X f g P. apply pack_b_b_p_2_eq (pack_b_b_p X f g P) X f g P. reflexivity.
Qed.

Theorem pack_b_b_p_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, S = pack_b_b_p X f g P -> forall x :e X, P x = decode_p (S 3) x.
let S X f g P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_b X g,encode_p X P) 3) x.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_b_p_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, forall x :e X, P x = decode_p (pack_b_b_p X f g P 3) x.
let X f g P. apply pack_b_b_p_3_eq (pack_b_b_p X f g P) X f g P. reflexivity.
Qed.

Theorem pack_b_b_p_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall P P':set -> prop, pack_b_b_p X f g P = pack_b_b_p X' f' g' P' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ (forall x :e X, P x = P' x).
let X X' f f' g g' P P'. assume H1.
claim L0: X' = pack_b_b_p X f g P 0.
{ exact pack_b_b_p_0_eq (pack_b_b_p X f g P) X' f' g' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_p_0_eq2 X f g P. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_p_1_eq2 X f g P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_p_1_eq2 X' f' g' P' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_p_2_eq2 X f g P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_p_2_eq2 X' f' g' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_b_p_3_eq2 X f g P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_b_p_3_eq2 X' f' g' P' x Lx.
Qed.

Theorem pack_b_b_p_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall P P':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_b_p X f g P = pack_b_b_p X f' g' P'.
let X f f' g g' P P'. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_b X g,encode_p X P) = (X,encode_b X f',encode_b X g',encode_p X P').
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

Definition struct_b_b_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall P:set -> prop, q (pack_b_b_p X f g P)) -> q S.

Theorem pack_struct_b_b_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall P:set -> prop, struct_b_b_p (pack_b_b_p X f g P).
let X f. assume Hf. let g. assume Hg. let P q. assume Hq.
exact Hq X f Hf g Hg P.
Qed.

Theorem pack_struct_b_b_p_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, struct_b_b_p (pack_b_b_p X f g P) -> forall x y :e X, f x y :e X.
let X f g P. assume H1. apply H1 (fun z => z = pack_b_b_p X f g P -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let P'.
  assume Heq: pack_b_b_p X' f' g' P' = pack_b_b_p X f g P.
  apply pack_b_b_p_inj X' X f' f g' g P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_p_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop, struct_b_b_p (pack_b_b_p X f g P) -> forall x y :e X, g x y :e X.
let X f g P. assume H1. apply H1 (fun z => z = pack_b_b_p X f g P -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let P'.
  assume Heq: pack_b_b_p X' f' g' P' = pack_b_b_p X f g P.
  apply pack_b_b_p_inj X' X f' f g' g P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_b_p_eta: forall S, struct_b_b_p S -> S = pack_b_b_p (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_p (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_b_b_p (z 0) (decode_b (z 1)) (decode_b (z 2)) (decode_p (z 3))).
let X. let f. assume _. let g. assume _. let P.
prove pack_b_b_p X f g P = pack_b_b_p (pack_b_b_p X f g P 0) (decode_b (pack_b_b_p X f g P 1)) (decode_b (pack_b_b_p X f g P 2)) (decode_p (pack_b_b_p X f g P 3)).
rewrite <- pack_b_b_p_0_eq2 X f g P.
apply pack_b_b_p_ext.
- exact pack_b_b_p_1_eq2 X f g P.
- exact pack_b_b_p_2_eq2 X f g P.
- let x. assume Hx.
  rewrite <- pack_b_b_p_3_eq2 X f g P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_p_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_p (S 3)).

Theorem unpack_b_b_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' g' P' = Phi X f g P)
  ->
  unpack_b_b_p_i (pack_b_b_p X f g P) Phi = Phi X f g P.
let Phi X f g P.
assume HPhi.
prove Phi (pack_b_b_p X f g P 0) (decode_b (pack_b_b_p X f g P 1)) (decode_b (pack_b_b_p X f g P 2)) (decode_p (pack_b_b_p X f g P 3)) = Phi X f g P.
rewrite <- pack_b_b_p_0_eq2 X f g P.
prove Phi X (decode_b (pack_b_b_p X f g P 1)) (decode_b (pack_b_b_p X f g P 2)) (decode_p (pack_b_b_p X f g P 3)) = Phi X f g P.
apply HPhi.
- exact pack_b_b_p_1_eq2 X f g P.
- exact pack_b_b_p_2_eq2 X f g P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_p X f g P 3) x.
  rewrite <- pack_b_b_p_3_eq2 X f g P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_b_p_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (decode_p (S 3)).

Theorem unpack_b_b_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' g' P' = Phi X f g P)
  ->
  unpack_b_b_p_o (pack_b_b_p X f g P) Phi = Phi X f g P.
let Phi X f g P.
assume HPhi.
prove Phi (pack_b_b_p X f g P 0) (decode_b (pack_b_b_p X f g P 1)) (decode_b (pack_b_b_p X f g P 2)) (decode_p (pack_b_b_p X f g P 3)) = Phi X f g P.
rewrite <- pack_b_b_p_0_eq2 X f g P.
prove Phi X (decode_b (pack_b_b_p X f g P 1)) (decode_b (pack_b_b_p X f g P 2)) (decode_p (pack_b_b_p X f g P 3)) = Phi X f g P.
apply HPhi.
- exact pack_b_b_p_1_eq2 X f g P.
- exact pack_b_b_p_2_eq2 X f g P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_b_p X f g P 3) x.
  rewrite <- pack_b_b_p_3_eq2 X f g P x Hx.
  apply iff_refl.
Qed.


Definition pack_b_b_e : set -> (set -> set -> set) -> (set -> set -> set) -> set -> set := fun X f g c => (X,encode_b X f,encode_b X g,c).

Theorem pack_b_b_e_0_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, S = pack_b_b_e X f g c -> X = S 0.
let S X f g c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_b X g,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_b_e_0_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, X = pack_b_b_e X f g c 0.
let X f g c. apply pack_b_b_e_0_eq (pack_b_b_e X f g c) X f g c. reflexivity.
Qed.

Theorem pack_b_b_e_1_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, S = pack_b_b_e X f g c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f g c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_b X g,c) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_b_e_1_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall x y :e X, f x y = decode_b (pack_b_b_e X f g c 1) x y.
let X f g c. apply pack_b_b_e_1_eq (pack_b_b_e X f g c) X f g c. reflexivity.
Qed.

Theorem pack_b_b_e_2_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, S = pack_b_b_e X f g c -> forall x y :e X, g x y = decode_b (S 2) x y.
let S X f g c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove g x y = decode_b ((X,encode_b X f,encode_b X g,c) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_b X g x Hx y Hy.
Qed.

Theorem pack_b_b_e_2_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, forall x y :e X, g x y = decode_b (pack_b_b_e X f g c 2) x y.
let X f g c. apply pack_b_b_e_2_eq (pack_b_b_e X f g c) X f g c. reflexivity.
Qed.

Theorem pack_b_b_e_3_eq: forall S X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, S = pack_b_b_e X f g c -> c = S 3.
let S X f g c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_b X g,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_b_b_e_3_eq2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, c = pack_b_b_e X f g c 3.
let X f g c. apply pack_b_b_e_3_eq (pack_b_b_e X f g c) X f g c. reflexivity.
Qed.

Theorem pack_b_b_e_inj : forall X X', forall f f':set -> set -> set, forall g g':set -> set -> set, forall c c':set, pack_b_b_e X f g c = pack_b_b_e X' f' g' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, g x y = g' x y) /\ c = c'.
let X X' f f' g g' c c'. assume H1.
claim L0: X' = pack_b_b_e X f g c 0.
{ exact pack_b_b_e_0_eq (pack_b_b_e X f g c) X' f' g' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_b_e_0_eq2 X f g c. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_b_e_1_eq2 X f g c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_e_1_eq2 X' f' g' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove g x y = g' x y.
  rewrite pack_b_b_e_2_eq2 X f g c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_b_e_2_eq2 X' f' g' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_b_b_e_3_eq2 X f g c.
  rewrite H1. symmetry.
  exact pack_b_b_e_3_eq2 X' f' g' c'.
Qed.

Theorem pack_b_b_e_ext : forall X, forall f f':set -> set -> set, forall g g':set -> set -> set, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, g x y = g' x y) ->
 pack_b_b_e X f g c = pack_b_b_e X f' g' c.
let X f f' g g' c. assume H1. assume H2.
prove (X,encode_b X f,encode_b X g,c) = (X,encode_b X f',encode_b X g',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_b X g = encode_b X g'.
{ apply encode_b_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_b_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall c:set, c :e X -> q (pack_b_b_e X f g c)) -> q S.

Theorem pack_struct_b_b_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall g:set -> set -> set, (forall x y :e X, g x y :e X) -> forall c:set, c :e X -> struct_b_b_e (pack_b_b_e X f g c).
let X f. assume Hf. let g. assume Hg. let c. assume Hc. let q. assume Hq.
exact Hq X f Hf g Hg c Hc.
Qed.

Theorem pack_struct_b_b_e_E1: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, struct_b_b_e (pack_b_b_e X f g c) -> forall x y :e X, f x y :e X.
let X f g c. assume H1. apply H1 (fun z => z = pack_b_b_e X f g c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let c'. assume Hc'.
  assume Heq: pack_b_b_e X' f' g' c' = pack_b_b_e X f g c.
  apply pack_b_b_e_inj X' X f' f g' g c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_e_E2: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, struct_b_b_e (pack_b_b_e X f g c) -> forall x y :e X, g x y :e X.
let X f g c. assume H1. apply H1 (fun z => z = pack_b_b_e X f g c -> forall x y :e X, g x y :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let c'. assume Hc'.
  assume Heq: pack_b_b_e X' f' g' c' = pack_b_b_e X f g c.
  apply pack_b_b_e_inj X' X f' f g' g c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hg'g x Hx y Hy.  exact Hg' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_b_e_E3: forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set, struct_b_b_e (pack_b_b_e X f g c) -> c :e X.
let X f g c. assume H1. apply H1 (fun z => z = pack_b_b_e X f g c -> c :e X).
- let X'. let f'. assume Hf'. let g'. assume Hg'. let c'. assume Hc'.
  assume Heq: pack_b_b_e X' f' g' c' = pack_b_b_e X f g c.
  apply pack_b_b_e_inj X' X f' f g' g c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hg'g Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_b_e_eta: forall S, struct_b_b_e S -> S = pack_b_b_e (S 0) (decode_b (S 1)) (decode_b (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_b_b_e (z 0) (decode_b (z 1)) (decode_b (z 2)) (z 3)).
let X. let f. assume _. let g. assume _. let c. assume _.
prove pack_b_b_e X f g c = pack_b_b_e (pack_b_b_e X f g c 0) (decode_b (pack_b_b_e X f g c 1)) (decode_b (pack_b_b_e X f g c 2)) (pack_b_b_e X f g c 3).
rewrite <- pack_b_b_e_0_eq2 X f g c.
rewrite <- pack_b_b_e_3_eq2 X f g c.
apply pack_b_b_e_ext.
- exact pack_b_b_e_1_eq2 X f g c.
- exact pack_b_b_e_2_eq2 X f g c.
Qed.


Definition unpack_b_b_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (S 3).

Theorem unpack_b_b_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> set -> set,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) -> Phi X f' g' c = Phi X f g c)
  ->
  unpack_b_b_e_i (pack_b_b_e X f g c) Phi = Phi X f g c.
let Phi X f g c.
assume HPhi.
prove Phi (pack_b_b_e X f g c 0) (decode_b (pack_b_b_e X f g c 1)) (decode_b (pack_b_b_e X f g c 2)) (pack_b_b_e X f g c 3) = Phi X f g c.
rewrite <- pack_b_b_e_0_eq2 X f g c.
prove Phi X (decode_b (pack_b_b_e X f g c 1)) (decode_b (pack_b_b_e X f g c 2)) (pack_b_b_e X f g c 3) = Phi X f g c.
rewrite <- pack_b_b_e_3_eq2 X f g c.
apply HPhi.
- exact pack_b_b_e_1_eq2 X f g c.
- exact pack_b_b_e_2_eq2 X f g c.
Qed.


Definition unpack_b_b_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> set) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_b (S 2)) (S 3).

Theorem unpack_b_b_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> set) -> set -> prop,
  forall X, forall f:set -> set -> set, forall g:set -> set -> set, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall g':set -> set -> set, (forall x y :e X, g x y = g' x y) -> Phi X f' g' c = Phi X f g c)
  ->
  unpack_b_b_e_o (pack_b_b_e X f g c) Phi = Phi X f g c.
let Phi X f g c.
assume HPhi.
prove Phi (pack_b_b_e X f g c 0) (decode_b (pack_b_b_e X f g c 1)) (decode_b (pack_b_b_e X f g c 2)) (pack_b_b_e X f g c 3) = Phi X f g c.
rewrite <- pack_b_b_e_0_eq2 X f g c.
prove Phi X (decode_b (pack_b_b_e X f g c 1)) (decode_b (pack_b_b_e X f g c 2)) (pack_b_b_e X f g c 3) = Phi X f g c.
rewrite <- pack_b_b_e_3_eq2 X f g c.
apply HPhi.
- exact pack_b_b_e_1_eq2 X f g c.
- exact pack_b_b_e_2_eq2 X f g c.
Qed.


Definition pack_b_u_r : set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set := fun X f i R => (X,encode_b X f,encode_u X i,encode_r X R).

Theorem pack_b_u_r_0_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_b_u_r X f i R -> X = S 0.
let S X f i R. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_u X i,encode_r X R) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_u_r_0_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, X = pack_b_u_r X f i R 0.
let X f i R. apply pack_b_u_r_0_eq (pack_b_u_r X f i R) X f i R. reflexivity.
Qed.

Theorem pack_b_u_r_1_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_b_u_r X f i R -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f i R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_u X i,encode_r X R) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_u_r_1_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall x y :e X, f x y = decode_b (pack_b_u_r X f i R 1) x y.
let X f i R. apply pack_b_u_r_1_eq (pack_b_u_r X f i R) X f i R. reflexivity.
Qed.

Theorem pack_b_u_r_2_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_b_u_r X f i R -> forall x :e X, i x = decode_u (S 2) x.
let S X f i R. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_u X i,encode_r X R) 2) x.
rewrite tuple_4_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_u_r_2_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall x :e X, i x = decode_u (pack_b_u_r X f i R 2) x.
let X f i R. apply pack_b_u_r_2_eq (pack_b_u_r X f i R) X f i R. reflexivity.
Qed.

Theorem pack_b_u_r_3_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, S = pack_b_u_r X f i R -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X f i R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_u X i,encode_r X R) 3) x y.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_u_r_3_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_b_u_r X f i R 3) x y.
let X f i R. apply pack_b_u_r_3_eq (pack_b_u_r X f i R) X f i R. reflexivity.
Qed.

Theorem pack_b_u_r_inj : forall X X', forall f f':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop, pack_b_u_r X f i R = pack_b_u_r X' f' i' R' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y).
let X X' f f' i i' R R'. assume H1.
claim L0: X' = pack_b_u_r X f i R 0.
{ exact pack_b_u_r_0_eq (pack_b_u_r X f i R) X' f' i' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_u_r_0_eq2 X f i R. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_u_r_1_eq2 X f i R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_r_1_eq2 X' f' i' R' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_u_r_2_eq2 X f i R x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_r_2_eq2 X' f' i' R' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_u_r_3_eq2 X f i R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_r_3_eq2 X' f' i' R' x Lx y Ly.
Qed.

Theorem pack_b_u_r_ext : forall X, forall f f':set -> set -> set, forall i i':set -> set, forall R R':set -> set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_b_u_r X f i R = pack_b_u_r X f' i' R'.
let X f f' i i' R R'. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_u X i,encode_r X R) = (X,encode_b X f',encode_u X i',encode_r X R').
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

Definition struct_b_u_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, q (pack_b_u_r X f i R)) -> q S.

Theorem pack_struct_b_u_r_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, struct_b_u_r (pack_b_u_r X f i R).
let X f. assume Hf. let i. assume Hi. let R q. assume Hq.
exact Hq X f Hf i Hi R.
Qed.

Theorem pack_struct_b_u_r_E1: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, struct_b_u_r (pack_b_u_r X f i R) -> forall x y :e X, f x y :e X.
let X f i R. assume H1. apply H1 (fun z => z = pack_b_u_r X f i R -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let R'.
  assume Heq: pack_b_u_r X' f' i' R' = pack_b_u_r X f i R.
  apply pack_b_u_r_inj X' X f' f i' i R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HR'R.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_u_r_E2: forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop, struct_b_u_r (pack_b_u_r X f i R) -> forall x :e X, i x :e X.
let X f i R. assume H1. apply H1 (fun z => z = pack_b_u_r X f i R -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let R'.
  assume Heq: pack_b_u_r X' f' i' R' = pack_b_u_r X f i R.
  apply pack_b_u_r_inj X' X f' f i' i R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HR'R.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_b_u_r_eta: forall S, struct_b_u_r S -> S = pack_b_u_r (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_b_u_r (z 0) (decode_b (z 1)) (decode_u (z 2)) (decode_r (z 3))).
let X. let f. assume _. let i. assume _. let R.
prove pack_b_u_r X f i R = pack_b_u_r (pack_b_u_r X f i R 0) (decode_b (pack_b_u_r X f i R 1)) (decode_u (pack_b_u_r X f i R 2)) (decode_r (pack_b_u_r X f i R 3)).
rewrite <- pack_b_u_r_0_eq2 X f i R.
apply pack_b_u_r_ext.
- exact pack_b_u_r_1_eq2 X f i R.
- exact pack_b_u_r_2_eq2 X f i R.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_u_r_3_eq2 X f i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_u_r_i : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)).

Theorem unpack_b_u_r_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' i' R' = Phi X f i R)
  ->
  unpack_b_u_r_i (pack_b_u_r X f i R) Phi = Phi X f i R.
let Phi X f i R.
assume HPhi.
prove Phi (pack_b_u_r X f i R 0) (decode_b (pack_b_u_r X f i R 1)) (decode_u (pack_b_u_r X f i R 2)) (decode_r (pack_b_u_r X f i R 3)) = Phi X f i R.
rewrite <- pack_b_u_r_0_eq2 X f i R.
prove Phi X (decode_b (pack_b_u_r X f i R 1)) (decode_u (pack_b_u_r X f i R 2)) (decode_r (pack_b_u_r X f i R 3)) = Phi X f i R.
apply HPhi.
- exact pack_b_u_r_1_eq2 X f i R.
- exact pack_b_u_r_2_eq2 X f i R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_u_r X f i R 3) x y.
  rewrite <- pack_b_u_r_3_eq2 X f i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_u_r_o : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_r (S 3)).

Theorem unpack_b_u_r_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall R:set -> set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' i' R' = Phi X f i R)
  ->
  unpack_b_u_r_o (pack_b_u_r X f i R) Phi = Phi X f i R.
let Phi X f i R.
assume HPhi.
prove Phi (pack_b_u_r X f i R 0) (decode_b (pack_b_u_r X f i R 1)) (decode_u (pack_b_u_r X f i R 2)) (decode_r (pack_b_u_r X f i R 3)) = Phi X f i R.
rewrite <- pack_b_u_r_0_eq2 X f i R.
prove Phi X (decode_b (pack_b_u_r X f i R 1)) (decode_u (pack_b_u_r X f i R 2)) (decode_r (pack_b_u_r X f i R 3)) = Phi X f i R.
apply HPhi.
- exact pack_b_u_r_1_eq2 X f i R.
- exact pack_b_u_r_2_eq2 X f i R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_u_r X f i R 3) x y.
  rewrite <- pack_b_u_r_3_eq2 X f i R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_u_p : set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set := fun X f i P => (X,encode_b X f,encode_u X i,encode_p X P).

Theorem pack_b_u_p_0_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_b_u_p X f i P -> X = S 0.
let S X f i P. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_u X i,encode_p X P) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_u_p_0_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, X = pack_b_u_p X f i P 0.
let X f i P. apply pack_b_u_p_0_eq (pack_b_u_p X f i P) X f i P. reflexivity.
Qed.

Theorem pack_b_u_p_1_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_b_u_p X f i P -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f i P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_u X i,encode_p X P) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_u_p_1_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_b_u_p X f i P 1) x y.
let X f i P. apply pack_b_u_p_1_eq (pack_b_u_p X f i P) X f i P. reflexivity.
Qed.

Theorem pack_b_u_p_2_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_b_u_p X f i P -> forall x :e X, i x = decode_u (S 2) x.
let S X f i P. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_u X i,encode_p X P) 2) x.
rewrite tuple_4_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_u_p_2_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall x :e X, i x = decode_u (pack_b_u_p X f i P 2) x.
let X f i P. apply pack_b_u_p_2_eq (pack_b_u_p X f i P) X f i P. reflexivity.
Qed.

Theorem pack_b_u_p_3_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, S = pack_b_u_p X f i P -> forall x :e X, P x = decode_p (S 3) x.
let S X f i P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_u X i,encode_p X P) 3) x.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_u_p_3_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, forall x :e X, P x = decode_p (pack_b_u_p X f i P 3) x.
let X f i P. apply pack_b_u_p_3_eq (pack_b_u_p X f i P) X f i P. reflexivity.
Qed.

Theorem pack_b_u_p_inj : forall X X', forall f f':set -> set -> set, forall i i':set -> set, forall P P':set -> prop, pack_b_u_p X f i P = pack_b_u_p X' f' i' P' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x).
let X X' f f' i i' P P'. assume H1.
claim L0: X' = pack_b_u_p X f i P 0.
{ exact pack_b_u_p_0_eq (pack_b_u_p X f i P) X' f' i' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_u_p_0_eq2 X f i P. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_u_p_1_eq2 X f i P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_p_1_eq2 X' f' i' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_u_p_2_eq2 X f i P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_p_2_eq2 X' f' i' P' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_u_p_3_eq2 X f i P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_p_3_eq2 X' f' i' P' x Lx.
Qed.

Theorem pack_b_u_p_ext : forall X, forall f f':set -> set -> set, forall i i':set -> set, forall P P':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_u_p X f i P = pack_b_u_p X f' i' P'.
let X f f' i i' P P'. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_u X i,encode_p X P) = (X,encode_b X f',encode_u X i',encode_p X P').
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

Definition struct_b_u_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, q (pack_b_u_p X f i P)) -> q S.

Theorem pack_struct_b_u_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, struct_b_u_p (pack_b_u_p X f i P).
let X f. assume Hf. let i. assume Hi. let P q. assume Hq.
exact Hq X f Hf i Hi P.
Qed.

Theorem pack_struct_b_u_p_E1: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, struct_b_u_p (pack_b_u_p X f i P) -> forall x y :e X, f x y :e X.
let X f i P. assume H1. apply H1 (fun z => z = pack_b_u_p X f i P -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let P'.
  assume Heq: pack_b_u_p X' f' i' P' = pack_b_u_p X f i P.
  apply pack_b_u_p_inj X' X f' f i' i P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_u_p_E2: forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop, struct_b_u_p (pack_b_u_p X f i P) -> forall x :e X, i x :e X.
let X f i P. assume H1. apply H1 (fun z => z = pack_b_u_p X f i P -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let P'.
  assume Heq: pack_b_u_p X' f' i' P' = pack_b_u_p X f i P.
  apply pack_b_u_p_inj X' X f' f i' i P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_b_u_p_eta: forall S, struct_b_u_p S -> S = pack_b_u_p (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_p (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_b_u_p (z 0) (decode_b (z 1)) (decode_u (z 2)) (decode_p (z 3))).
let X. let f. assume _. let i. assume _. let P.
prove pack_b_u_p X f i P = pack_b_u_p (pack_b_u_p X f i P 0) (decode_b (pack_b_u_p X f i P 1)) (decode_u (pack_b_u_p X f i P 2)) (decode_p (pack_b_u_p X f i P 3)).
rewrite <- pack_b_u_p_0_eq2 X f i P.
apply pack_b_u_p_ext.
- exact pack_b_u_p_1_eq2 X f i P.
- exact pack_b_u_p_2_eq2 X f i P.
- let x. assume Hx.
  rewrite <- pack_b_u_p_3_eq2 X f i P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_u_p_i : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_p (S 3)).

Theorem unpack_b_u_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' i' P' = Phi X f i P)
  ->
  unpack_b_u_p_i (pack_b_u_p X f i P) Phi = Phi X f i P.
let Phi X f i P.
assume HPhi.
prove Phi (pack_b_u_p X f i P 0) (decode_b (pack_b_u_p X f i P 1)) (decode_u (pack_b_u_p X f i P 2)) (decode_p (pack_b_u_p X f i P 3)) = Phi X f i P.
rewrite <- pack_b_u_p_0_eq2 X f i P.
prove Phi X (decode_b (pack_b_u_p X f i P 1)) (decode_u (pack_b_u_p X f i P 2)) (decode_p (pack_b_u_p X f i P 3)) = Phi X f i P.
apply HPhi.
- exact pack_b_u_p_1_eq2 X f i P.
- exact pack_b_u_p_2_eq2 X f i P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_u_p X f i P 3) x.
  rewrite <- pack_b_u_p_3_eq2 X f i P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_u_p_o : set -> (set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (decode_p (S 3)).

Theorem unpack_b_u_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' i' P' = Phi X f i P)
  ->
  unpack_b_u_p_o (pack_b_u_p X f i P) Phi = Phi X f i P.
let Phi X f i P.
assume HPhi.
prove Phi (pack_b_u_p X f i P 0) (decode_b (pack_b_u_p X f i P 1)) (decode_u (pack_b_u_p X f i P 2)) (decode_p (pack_b_u_p X f i P 3)) = Phi X f i P.
rewrite <- pack_b_u_p_0_eq2 X f i P.
prove Phi X (decode_b (pack_b_u_p X f i P 1)) (decode_u (pack_b_u_p X f i P 2)) (decode_p (pack_b_u_p X f i P 3)) = Phi X f i P.
apply HPhi.
- exact pack_b_u_p_1_eq2 X f i P.
- exact pack_b_u_p_2_eq2 X f i P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_u_p X f i P 3) x.
  rewrite <- pack_b_u_p_3_eq2 X f i P x Hx.
  apply iff_refl.
Qed.


Definition pack_b_u_e : set -> (set -> set -> set) -> (set -> set) -> set -> set := fun X f i c => (X,encode_b X f,encode_u X i,c).

Theorem pack_b_u_e_0_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall c:set, S = pack_b_u_e X f i c -> X = S 0.
let S X f i c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_u X i,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_u_e_0_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, X = pack_b_u_e X f i c 0.
let X f i c. apply pack_b_u_e_0_eq (pack_b_u_e X f i c) X f i c. reflexivity.
Qed.

Theorem pack_b_u_e_1_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall c:set, S = pack_b_u_e X f i c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f i c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_u X i,c) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_u_e_1_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall x y :e X, f x y = decode_b (pack_b_u_e X f i c 1) x y.
let X f i c. apply pack_b_u_e_1_eq (pack_b_u_e X f i c) X f i c. reflexivity.
Qed.

Theorem pack_b_u_e_2_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall c:set, S = pack_b_u_e X f i c -> forall x :e X, i x = decode_u (S 2) x.
let S X f i c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_b X f,encode_u X i,c) 2) x.
rewrite tuple_4_2_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_b_u_e_2_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, forall x :e X, i x = decode_u (pack_b_u_e X f i c 2) x.
let X f i c. apply pack_b_u_e_2_eq (pack_b_u_e X f i c) X f i c. reflexivity.
Qed.

Theorem pack_b_u_e_3_eq: forall S X, forall f:set -> set -> set, forall i:set -> set, forall c:set, S = pack_b_u_e X f i c -> c = S 3.
let S X f i c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_u X i,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_b_u_e_3_eq2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, c = pack_b_u_e X f i c 3.
let X f i c. apply pack_b_u_e_3_eq (pack_b_u_e X f i c) X f i c. reflexivity.
Qed.

Theorem pack_b_u_e_inj : forall X X', forall f f':set -> set -> set, forall i i':set -> set, forall c c':set, pack_b_u_e X f i c = pack_b_u_e X' f' i' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, i x = i' x) /\ c = c'.
let X X' f f' i i' c c'. assume H1.
claim L0: X' = pack_b_u_e X f i c 0.
{ exact pack_b_u_e_0_eq (pack_b_u_e X f i c) X' f' i' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_u_e_0_eq2 X f i c. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_u_e_1_eq2 X f i c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_u_e_1_eq2 X' f' i' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_b_u_e_2_eq2 X f i c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_u_e_2_eq2 X' f' i' c' x Lx.
- prove c = c'.
  rewrite pack_b_u_e_3_eq2 X f i c.
  rewrite H1. symmetry.
  exact pack_b_u_e_3_eq2 X' f' i' c'.
Qed.

Theorem pack_b_u_e_ext : forall X, forall f f':set -> set -> set, forall i i':set -> set, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, i x = i' x) ->
 pack_b_u_e X f i c = pack_b_u_e X f' i' c.
let X f f' i i' c. assume H1. assume H2.
prove (X,encode_b X f,encode_u X i,c) = (X,encode_b X f',encode_u X i',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_u_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> q (pack_b_u_e X f i c)) -> q S.

Theorem pack_struct_b_u_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall i:set -> set, (forall x :e X, i x :e X) -> forall c:set, c :e X -> struct_b_u_e (pack_b_u_e X f i c).
let X f. assume Hf. let i. assume Hi. let c. assume Hc. let q. assume Hq.
exact Hq X f Hf i Hi c Hc.
Qed.

Theorem pack_struct_b_u_e_E1: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, struct_b_u_e (pack_b_u_e X f i c) -> forall x y :e X, f x y :e X.
let X f i c. assume H1. apply H1 (fun z => z = pack_b_u_e X f i c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_b_u_e X' f' i' c' = pack_b_u_e X f i c.
  apply pack_b_u_e_inj X' X f' f i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_u_e_E2: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, struct_b_u_e (pack_b_u_e X f i c) -> forall x :e X, i x :e X.
let X f i c. assume H1. apply H1 (fun z => z = pack_b_u_e X f i c -> forall x :e X, i x :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_b_u_e X' f' i' c' = pack_b_u_e X f i c.
  apply pack_b_u_e_inj X' X f' f i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_b_u_e_E3: forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set, struct_b_u_e (pack_b_u_e X f i c) -> c :e X.
let X f i c. assume H1. apply H1 (fun z => z = pack_b_u_e X f i c -> c :e X).
- let X'. let f'. assume Hf'. let i'. assume Hi'. let c'. assume Hc'.
  assume Heq: pack_b_u_e X' f' i' c' = pack_b_u_e X f i c.
  apply pack_b_u_e_inj X' X f' f i' i c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f Hi'i Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_u_e_eta: forall S, struct_b_u_e S -> S = pack_b_u_e (S 0) (decode_b (S 1)) (decode_u (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_b_u_e (z 0) (decode_b (z 1)) (decode_u (z 2)) (z 3)).
let X. let f. assume _. let i. assume _. let c. assume _.
prove pack_b_u_e X f i c = pack_b_u_e (pack_b_u_e X f i c 0) (decode_b (pack_b_u_e X f i c 1)) (decode_u (pack_b_u_e X f i c 2)) (pack_b_u_e X f i c 3).
rewrite <- pack_b_u_e_0_eq2 X f i c.
rewrite <- pack_b_u_e_3_eq2 X f i c.
apply pack_b_u_e_ext.
- exact pack_b_u_e_1_eq2 X f i c.
- exact pack_b_u_e_2_eq2 X f i c.
Qed.


Definition unpack_b_u_e_i : set -> (set -> (set -> set -> set) -> (set -> set) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (S 3).

Theorem unpack_b_u_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> set -> set,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' i' c = Phi X f i c)
  ->
  unpack_b_u_e_i (pack_b_u_e X f i c) Phi = Phi X f i c.
let Phi X f i c.
assume HPhi.
prove Phi (pack_b_u_e X f i c 0) (decode_b (pack_b_u_e X f i c 1)) (decode_u (pack_b_u_e X f i c 2)) (pack_b_u_e X f i c 3) = Phi X f i c.
rewrite <- pack_b_u_e_0_eq2 X f i c.
prove Phi X (decode_b (pack_b_u_e X f i c 1)) (decode_u (pack_b_u_e X f i c 2)) (pack_b_u_e X f i c 3) = Phi X f i c.
rewrite <- pack_b_u_e_3_eq2 X f i c.
apply HPhi.
- exact pack_b_u_e_1_eq2 X f i c.
- exact pack_b_u_e_2_eq2 X f i c.
Qed.


Definition unpack_b_u_e_o : set -> (set -> (set -> set -> set) -> (set -> set) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_u (S 2)) (S 3).

Theorem unpack_b_u_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set) -> set -> prop,
  forall X, forall f:set -> set -> set, forall i:set -> set, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall i':set -> set, (forall x :e X, i x = i' x) -> Phi X f' i' c = Phi X f i c)
  ->
  unpack_b_u_e_o (pack_b_u_e X f i c) Phi = Phi X f i c.
let Phi X f i c.
assume HPhi.
prove Phi (pack_b_u_e X f i c 0) (decode_b (pack_b_u_e X f i c 1)) (decode_u (pack_b_u_e X f i c 2)) (pack_b_u_e X f i c 3) = Phi X f i c.
rewrite <- pack_b_u_e_0_eq2 X f i c.
prove Phi X (decode_b (pack_b_u_e X f i c 1)) (decode_u (pack_b_u_e X f i c 2)) (pack_b_u_e X f i c 3) = Phi X f i c.
rewrite <- pack_b_u_e_3_eq2 X f i c.
apply HPhi.
- exact pack_b_u_e_1_eq2 X f i c.
- exact pack_b_u_e_2_eq2 X f i c.
Qed.


Definition pack_b_r_p : set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set := fun X f R P => (X,encode_b X f,encode_r X R,encode_p X P).

Theorem pack_b_r_p_0_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_r_p X f R P -> X = S 0.
let S X f R P. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_r X R,encode_p X P) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_r_p_0_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, X = pack_b_r_p X f R P 0.
let X f R P. apply pack_b_r_p_0_eq (pack_b_r_p X f R P) X f R P. reflexivity.
Qed.

Theorem pack_b_r_p_1_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_r_p X f R P -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_r X R,encode_p X P) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_r_p_1_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, f x y = decode_b (pack_b_r_p X f R P 1) x y.
let X f R P. apply pack_b_r_p_1_eq (pack_b_r_p X f R P) X f R P. reflexivity.
Qed.

Theorem pack_b_r_p_2_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_r_p X f R P -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X f R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_r X R,encode_p X P) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_r_p_2_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, R x y = decode_r (pack_b_r_p X f R P 2) x y.
let X f R P. apply pack_b_r_p_2_eq (pack_b_r_p X f R P) X f R P. reflexivity.
Qed.

Theorem pack_b_r_p_3_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_b_r_p X f R P -> forall x :e X, P x = decode_p (S 3) x.
let S X f R P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_r X R,encode_p X P) 3) x.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_r_p_3_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_b_r_p X f R P 3) x.
let X f R P. apply pack_b_r_p_3_eq (pack_b_r_p X f R P) X f R P. reflexivity.
Qed.

Theorem pack_b_r_p_inj : forall X X', forall f f':set -> set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, pack_b_r_p X f R P = pack_b_r_p X' f' R' P' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x).
let X X' f f' R R' P P'. assume H1.
claim L0: X' = pack_b_r_p X f R P 0.
{ exact pack_b_r_p_0_eq (pack_b_r_p X f R P) X' f' R' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_r_p_0_eq2 X f R P. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_r_p_1_eq2 X f R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_p_1_eq2 X' f' R' P' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_r_p_2_eq2 X f R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_p_2_eq2 X' f' R' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_r_p_3_eq2 X f R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_r_p_3_eq2 X' f' R' P' x Lx.
Qed.

Theorem pack_b_r_p_ext : forall X, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall P P':set -> prop,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_r_p X f R P = pack_b_r_p X f' R' P'.
let X f f' R R' P P'. assume H1. assume H2. assume H3.
prove (X,encode_b X f,encode_r X R,encode_p X P) = (X,encode_b X f',encode_r X R',encode_p X P').
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

Definition struct_b_r_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall P:set -> prop, q (pack_b_r_p X f R P)) -> q S.

Theorem pack_struct_b_r_p_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall P:set -> prop, struct_b_r_p (pack_b_r_p X f R P).
let X f. assume Hf. let R P q. assume Hq.
exact Hq X f Hf R P.
Qed.

Theorem pack_struct_b_r_p_E1: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop, struct_b_r_p (pack_b_r_p X f R P) -> forall x y :e X, f x y :e X.
let X f R P. assume H1. apply H1 (fun z => z = pack_b_r_p X f R P -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let R'. let P'.
  assume Heq: pack_b_r_p X' f' R' P' = pack_b_r_p X f R P.
  apply pack_b_r_p_inj X' X f' f R' R P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HR'R HP'P.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_r_p_eta: forall S, struct_b_r_p S -> S = pack_b_r_p (S 0) (decode_b (S 1)) (decode_r (S 2)) (decode_p (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_b_r_p (z 0) (decode_b (z 1)) (decode_r (z 2)) (decode_p (z 3))).
let X. let f. assume _. let R. let P.
prove pack_b_r_p X f R P = pack_b_r_p (pack_b_r_p X f R P 0) (decode_b (pack_b_r_p X f R P 1)) (decode_r (pack_b_r_p X f R P 2)) (decode_p (pack_b_r_p X f R P 3)).
rewrite <- pack_b_r_p_0_eq2 X f R P.
apply pack_b_r_p_ext.
- exact pack_b_r_p_1_eq2 X f R P.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_r_p_2_eq2 X f R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_b_r_p_3_eq2 X f R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_r_p_i : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)) (decode_p (S 3)).

Theorem unpack_b_r_p_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> set,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' R' P' = Phi X f R P)
  ->
  unpack_b_r_p_i (pack_b_r_p X f R P) Phi = Phi X f R P.
let Phi X f R P.
assume HPhi.
prove Phi (pack_b_r_p X f R P 0) (decode_b (pack_b_r_p X f R P 1)) (decode_r (pack_b_r_p X f R P 2)) (decode_p (pack_b_r_p X f R P 3)) = Phi X f R P.
rewrite <- pack_b_r_p_0_eq2 X f R P.
prove Phi X (decode_b (pack_b_r_p X f R P 1)) (decode_r (pack_b_r_p X f R P 2)) (decode_p (pack_b_r_p X f R P 3)) = Phi X f R P.
apply HPhi.
- exact pack_b_r_p_1_eq2 X f R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r_p X f R P 2) x y.
  rewrite <- pack_b_r_p_2_eq2 X f R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_r_p X f R P 3) x.
  rewrite <- pack_b_r_p_3_eq2 X f R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_r_p_o : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)) (decode_p (S 3)).

Theorem unpack_b_r_p_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' R' P' = Phi X f R P)
  ->
  unpack_b_r_p_o (pack_b_r_p X f R P) Phi = Phi X f R P.
let Phi X f R P.
assume HPhi.
prove Phi (pack_b_r_p X f R P 0) (decode_b (pack_b_r_p X f R P 1)) (decode_r (pack_b_r_p X f R P 2)) (decode_p (pack_b_r_p X f R P 3)) = Phi X f R P.
rewrite <- pack_b_r_p_0_eq2 X f R P.
prove Phi X (decode_b (pack_b_r_p X f R P 1)) (decode_r (pack_b_r_p X f R P 2)) (decode_p (pack_b_r_p X f R P 3)) = Phi X f R P.
apply HPhi.
- exact pack_b_r_p_1_eq2 X f R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r_p X f R P 2) x y.
  rewrite <- pack_b_r_p_2_eq2 X f R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_r_p X f R P 3) x.
  rewrite <- pack_b_r_p_3_eq2 X f R P x Hx.
  apply iff_refl.
Qed.


Definition pack_b_r_e : set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set := fun X f R c => (X,encode_b X f,encode_r X R,c).

Theorem pack_b_r_e_0_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_r_e X f R c -> X = S 0.
let S X f R c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_r X R,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_r_e_0_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, X = pack_b_r_e X f R c 0.
let X f R c. apply pack_b_r_e_0_eq (pack_b_r_e X f R c) X f R c. reflexivity.
Qed.

Theorem pack_b_r_e_1_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_r_e X f R c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_r X R,c) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_r_e_1_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, f x y = decode_b (pack_b_r_e X f R c 1) x y.
let X f R c. apply pack_b_r_e_1_eq (pack_b_r_e X f R c) X f R c. reflexivity.
Qed.

Theorem pack_b_r_e_2_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_r_e X f R c -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X f R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_b X f,encode_r X R,c) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_b_r_e_2_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_b_r_e X f R c 2) x y.
let X f R c. apply pack_b_r_e_2_eq (pack_b_r_e X f R c) X f R c. reflexivity.
Qed.

Theorem pack_b_r_e_3_eq: forall S X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, S = pack_b_r_e X f R c -> c = S 3.
let S X f R c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_r X R,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_b_r_e_3_eq2: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, c = pack_b_r_e X f R c 3.
let X f R c. apply pack_b_r_e_3_eq (pack_b_r_e X f R c) X f R c. reflexivity.
Qed.

Theorem pack_b_r_e_inj : forall X X', forall f f':set -> set -> set, forall R R':set -> set -> prop, forall c c':set, pack_b_r_e X f R c = pack_b_r_e X' f' R' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x y :e X, R x y = R' x y) /\ c = c'.
let X X' f f' R R' c c'. assume H1.
claim L0: X' = pack_b_r_e X f R c 0.
{ exact pack_b_r_e_0_eq (pack_b_r_e X f R c) X' f' R' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_r_e_0_eq2 X f R c. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_r_e_1_eq2 X f R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_e_1_eq2 X' f' R' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_b_r_e_2_eq2 X f R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_r_e_2_eq2 X' f' R' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_b_r_e_3_eq2 X f R c.
  rewrite H1. symmetry.
  exact pack_b_r_e_3_eq2 X' f' R' c'.
Qed.

Theorem pack_b_r_e_ext : forall X, forall f f':set -> set -> set, forall R R':set -> set -> prop, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_b_r_e X f R c = pack_b_r_e X f' R' c.
let X f f' R R' c. assume H1. assume H2.
prove (X,encode_b X f,encode_r X R,c) = (X,encode_b X f',encode_r X R',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_r_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> q (pack_b_r_e X f R c)) -> q S.

Theorem pack_struct_b_r_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> struct_b_r_e (pack_b_r_e X f R c).
let X f. assume Hf. let R c. assume Hc. let q. assume Hq.
exact Hq X f Hf R c Hc.
Qed.

Theorem pack_struct_b_r_e_E1: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, struct_b_r_e (pack_b_r_e X f R c) -> forall x y :e X, f x y :e X.
let X f R c. assume H1. apply H1 (fun z => z = pack_b_r_e X f R c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let R'. let c'. assume Hc'.
  assume Heq: pack_b_r_e X' f' R' c' = pack_b_r_e X f R c.
  apply pack_b_r_e_inj X' X f' f R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HR'R Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_r_e_E3: forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set, struct_b_r_e (pack_b_r_e X f R c) -> c :e X.
let X f R c. assume H1. apply H1 (fun z => z = pack_b_r_e X f R c -> c :e X).
- let X'. let f'. assume Hf'. let R'. let c'. assume Hc'.
  assume Heq: pack_b_r_e X' f' R' c' = pack_b_r_e X f R c.
  apply pack_b_r_e_inj X' X f' f R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HR'R Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_r_e_eta: forall S, struct_b_r_e S -> S = pack_b_r_e (S 0) (decode_b (S 1)) (decode_r (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_b_r_e (z 0) (decode_b (z 1)) (decode_r (z 2)) (z 3)).
let X. let f. assume _. let R. let c. assume _.
prove pack_b_r_e X f R c = pack_b_r_e (pack_b_r_e X f R c 0) (decode_b (pack_b_r_e X f R c 1)) (decode_r (pack_b_r_e X f R c 2)) (pack_b_r_e X f R c 3).
rewrite <- pack_b_r_e_0_eq2 X f R c.
rewrite <- pack_b_r_e_3_eq2 X f R c.
apply pack_b_r_e_ext.
- exact pack_b_r_e_1_eq2 X f R c.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_b_r_e_2_eq2 X f R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_r_e_i : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)) (S 3).

Theorem unpack_b_r_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> set -> set,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' R' c = Phi X f R c)
  ->
  unpack_b_r_e_i (pack_b_r_e X f R c) Phi = Phi X f R c.
let Phi X f R c.
assume HPhi.
prove Phi (pack_b_r_e X f R c 0) (decode_b (pack_b_r_e X f R c 1)) (decode_r (pack_b_r_e X f R c 2)) (pack_b_r_e X f R c 3) = Phi X f R c.
rewrite <- pack_b_r_e_0_eq2 X f R c.
prove Phi X (decode_b (pack_b_r_e X f R c 1)) (decode_r (pack_b_r_e X f R c 2)) (pack_b_r_e X f R c 3) = Phi X f R c.
rewrite <- pack_b_r_e_3_eq2 X f R c.
apply HPhi.
- exact pack_b_r_e_1_eq2 X f R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r_e X f R c 2) x y.
  rewrite <- pack_b_r_e_2_eq2 X f R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_b_r_e_o : set -> (set -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_r (S 2)) (S 3).

Theorem unpack_b_r_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> set -> prop) -> set -> prop,
  forall X, forall f:set -> set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X f' R' c = Phi X f R c)
  ->
  unpack_b_r_e_o (pack_b_r_e X f R c) Phi = Phi X f R c.
let Phi X f R c.
assume HPhi.
prove Phi (pack_b_r_e X f R c 0) (decode_b (pack_b_r_e X f R c 1)) (decode_r (pack_b_r_e X f R c 2)) (pack_b_r_e X f R c 3) = Phi X f R c.
rewrite <- pack_b_r_e_0_eq2 X f R c.
prove Phi X (decode_b (pack_b_r_e X f R c 1)) (decode_r (pack_b_r_e X f R c 2)) (pack_b_r_e X f R c 3) = Phi X f R c.
rewrite <- pack_b_r_e_3_eq2 X f R c.
apply HPhi.
- exact pack_b_r_e_1_eq2 X f R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_b_r_e X f R c 2) x y.
  rewrite <- pack_b_r_e_2_eq2 X f R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_b_p_e : set -> (set -> set -> set) -> (set -> prop) -> set -> set := fun X f P c => (X,encode_b X f,encode_p X P,c).

Theorem pack_b_p_e_0_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_b_p_e X f P c -> X = S 0.
let S X f P c. assume H1. rewrite H1.
prove X = (X,encode_b X f,encode_p X P,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_b_p_e_0_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, X = pack_b_p_e X f P c 0.
let X f P c. apply pack_b_p_e_0_eq (pack_b_p_e X f P c) X f P c. reflexivity.
Qed.

Theorem pack_b_p_e_1_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_b_p_e X f P c -> forall x y :e X, f x y = decode_b (S 1) x y.
let S X f P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove f x y = decode_b ((X,encode_b X f,encode_p X P,c) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_b X f x Hx y Hy.
Qed.

Theorem pack_b_p_e_1_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall x y :e X, f x y = decode_b (pack_b_p_e X f P c 1) x y.
let X f P c. apply pack_b_p_e_1_eq (pack_b_p_e X f P c) X f P c. reflexivity.
Qed.

Theorem pack_b_p_e_2_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_b_p_e X f P c -> forall x :e X, P x = decode_p (S 2) x.
let S X f P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_b X f,encode_p X P,c) 2) x.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_b_p_e_2_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_b_p_e X f P c 2) x.
let X f P c. apply pack_b_p_e_2_eq (pack_b_p_e X f P c) X f P c. reflexivity.
Qed.

Theorem pack_b_p_e_3_eq: forall S X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, S = pack_b_p_e X f P c -> c = S 3.
let S X f P c. assume H1.
rewrite H1. prove c = (X,encode_b X f,encode_p X P,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_b_p_e_3_eq2: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, c = pack_b_p_e X f P c 3.
let X f P c. apply pack_b_p_e_3_eq (pack_b_p_e X f P c) X f P c. reflexivity.
Qed.

Theorem pack_b_p_e_inj : forall X X', forall f f':set -> set -> set, forall P P':set -> prop, forall c c':set, pack_b_p_e X f P c = pack_b_p_e X' f' P' c' -> X = X' /\ (forall x y :e X, f x y = f' x y) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' f f' P P' c c'. assume H1.
claim L0: X' = pack_b_p_e X f P c 0.
{ exact pack_b_p_e_0_eq (pack_b_p_e X f P c) X' f' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_p_e_0_eq2 X f P c. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove f x y = f' x y.
  rewrite pack_b_p_e_1_eq2 X f P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_b_p_e_1_eq2 X' f' P' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_b_p_e_2_eq2 X f P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_b_p_e_2_eq2 X' f' P' c' x Lx.
- prove c = c'.
  rewrite pack_b_p_e_3_eq2 X f P c.
  rewrite H1. symmetry.
  exact pack_b_p_e_3_eq2 X' f' P' c'.
Qed.

Theorem pack_b_p_e_ext : forall X, forall f f':set -> set -> set, forall P P':set -> prop, forall c,
 (forall x y :e X, f x y = f' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_b_p_e X f P c = pack_b_p_e X f' P' c.
let X f f' P P' c. assume H1. assume H2.
prove (X,encode_b X f,encode_p X P,c) = (X,encode_b X f',encode_p X P',c).
claim L1: encode_b X f = encode_b X f'.
{ apply encode_b_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_b_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, forall c:set, c :e X -> q (pack_b_p_e X f P c)) -> q S.

Theorem pack_struct_b_p_e_I: forall X, forall f:set -> set -> set, (forall x y :e X, f x y :e X) -> forall P:set -> prop, forall c:set, c :e X -> struct_b_p_e (pack_b_p_e X f P c).
let X f. assume Hf. let P c. assume Hc. let q. assume Hq.
exact Hq X f Hf P c Hc.
Qed.

Theorem pack_struct_b_p_e_E1: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, struct_b_p_e (pack_b_p_e X f P c) -> forall x y :e X, f x y :e X.
let X f P c. assume H1. apply H1 (fun z => z = pack_b_p_e X f P c -> forall x y :e X, f x y :e X).
- let X'. let f'. assume Hf'. let P'. let c'. assume Hc'.
  assume Heq: pack_b_p_e X' f' P' c' = pack_b_p_e X f P c.
  apply pack_b_p_e_inj X' X f' f P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx. let y. assume Hy.
  rewrite <- Hf'f x Hx y Hy.  exact Hf' x Hx y Hy.
- reflexivity.
Qed.

Theorem pack_struct_b_p_e_E3: forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set, struct_b_p_e (pack_b_p_e X f P c) -> c :e X.
let X f P c. assume H1. apply H1 (fun z => z = pack_b_p_e X f P c -> c :e X).
- let X'. let f'. assume Hf'. let P'. let c'. assume Hc'.
  assume Heq: pack_b_p_e X' f' P' c' = pack_b_p_e X f P c.
  apply pack_b_p_e_inj X' X f' f P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hf'f HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_b_p_e_eta: forall S, struct_b_p_e S -> S = pack_b_p_e (S 0) (decode_b (S 1)) (decode_p (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_b_p_e (z 0) (decode_b (z 1)) (decode_p (z 2)) (z 3)).
let X. let f. assume _. let P. let c. assume _.
prove pack_b_p_e X f P c = pack_b_p_e (pack_b_p_e X f P c 0) (decode_b (pack_b_p_e X f P c 1)) (decode_p (pack_b_p_e X f P c 2)) (pack_b_p_e X f P c 3).
rewrite <- pack_b_p_e_0_eq2 X f P c.
rewrite <- pack_b_p_e_3_eq2 X f P c.
apply pack_b_p_e_ext.
- exact pack_b_p_e_1_eq2 X f P c.
- let x. assume Hx.
  rewrite <- pack_b_p_e_2_eq2 X f P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_p_e_i : set -> (set -> (set -> set -> set) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_p (S 2)) (S 3).

Theorem unpack_b_p_e_i_eq : forall Phi:set -> (set -> set -> set) -> (set -> prop) -> set -> set,
  forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' P' c = Phi X f P c)
  ->
  unpack_b_p_e_i (pack_b_p_e X f P c) Phi = Phi X f P c.
let Phi X f P c.
assume HPhi.
prove Phi (pack_b_p_e X f P c 0) (decode_b (pack_b_p_e X f P c 1)) (decode_p (pack_b_p_e X f P c 2)) (pack_b_p_e X f P c 3) = Phi X f P c.
rewrite <- pack_b_p_e_0_eq2 X f P c.
prove Phi X (decode_b (pack_b_p_e X f P c 1)) (decode_p (pack_b_p_e X f P c 2)) (pack_b_p_e X f P c 3) = Phi X f P c.
rewrite <- pack_b_p_e_3_eq2 X f P c.
apply HPhi.
- exact pack_b_p_e_1_eq2 X f P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_p_e X f P c 2) x.
  rewrite <- pack_b_p_e_2_eq2 X f P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_b_p_e_o : set -> (set -> (set -> set -> set) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_b (S 1)) (decode_p (S 2)) (S 3).

Theorem unpack_b_p_e_o_eq : forall Phi:set -> (set -> set -> set) -> (set -> prop) -> set -> prop,
  forall X, forall f:set -> set -> set, forall P:set -> prop, forall c:set,
  ( forall f':set -> set -> set, (forall x y :e X, f x y = f' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X f' P' c = Phi X f P c)
  ->
  unpack_b_p_e_o (pack_b_p_e X f P c) Phi = Phi X f P c.
let Phi X f P c.
assume HPhi.
prove Phi (pack_b_p_e X f P c 0) (decode_b (pack_b_p_e X f P c 1)) (decode_p (pack_b_p_e X f P c 2)) (pack_b_p_e X f P c 3) = Phi X f P c.
rewrite <- pack_b_p_e_0_eq2 X f P c.
prove Phi X (decode_b (pack_b_p_e X f P c 1)) (decode_p (pack_b_p_e X f P c 2)) (pack_b_p_e X f P c 3) = Phi X f P c.
rewrite <- pack_b_p_e_3_eq2 X f P c.
apply HPhi.
- exact pack_b_p_e_1_eq2 X f P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_b_p_e X f P c 2) x.
  rewrite <- pack_b_p_e_2_eq2 X f P c x Hx.
  apply iff_refl.
Qed.


Definition pack_u_u_r : set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> set := fun X i j R => (X,encode_u X i,encode_u X j,encode_r X R).

Theorem pack_u_u_r_0_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, S = pack_u_u_r X i j R -> X = S 0.
let S X i j R. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_u X j,encode_r X R) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_u_u_r_0_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, X = pack_u_u_r X i j R 0.
let X i j R. apply pack_u_u_r_0_eq (pack_u_u_r X i j R) X i j R. reflexivity.
Qed.

Theorem pack_u_u_r_1_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, S = pack_u_u_r X i j R -> forall x :e X, i x = decode_u (S 1) x.
let S X i j R. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_u X j,encode_r X R) 1) x.
rewrite tuple_4_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_u_r_1_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall x :e X, i x = decode_u (pack_u_u_r X i j R 1) x.
let X i j R. apply pack_u_u_r_1_eq (pack_u_u_r X i j R) X i j R. reflexivity.
Qed.

Theorem pack_u_u_r_2_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, S = pack_u_u_r X i j R -> forall x :e X, j x = decode_u (S 2) x.
let S X i j R. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_u X i,encode_u X j,encode_r X R) 2) x.
rewrite tuple_4_2_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_u_u_r_2_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall x :e X, j x = decode_u (pack_u_u_r X i j R 2) x.
let X i j R. apply pack_u_u_r_2_eq (pack_u_u_r X i j R) X i j R. reflexivity.
Qed.

Theorem pack_u_u_r_3_eq: forall S X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, S = pack_u_u_r X i j R -> forall x y :e X, R x y = decode_r (S 3) x y.
let S X i j R. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_u X i,encode_u X j,encode_r X R) 3) x y.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_u_u_r_3_eq2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_u_u_r X i j R 3) x y.
let X i j R. apply pack_u_u_r_3_eq (pack_u_u_r X i j R) X i j R. reflexivity.
Qed.

Theorem pack_u_u_r_inj : forall X X', forall i i':set -> set, forall j j':set -> set, forall R R':set -> set -> prop, pack_u_u_r X i j R = pack_u_u_r X' i' j' R' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x) /\ (forall x y :e X, R x y = R' x y).
let X X' i i' j j' R R'. assume H1.
claim L0: X' = pack_u_u_r X i j R 0.
{ exact pack_u_u_r_0_eq (pack_u_u_r X i j R) X' i' j' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_u_r_0_eq2 X i j R. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_u_r_1_eq2 X i j R x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_r_1_eq2 X' i' j' R' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_u_u_r_2_eq2 X i j R x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_r_2_eq2 X' i' j' R' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_u_u_r_3_eq2 X i j R x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_u_r_3_eq2 X' i' j' R' x Lx y Ly.
Qed.

Theorem pack_u_u_r_ext : forall X, forall i i':set -> set, forall j j':set -> set, forall R R':set -> set -> prop,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_u_u_r X i j R = pack_u_u_r X i' j' R'.
let X i i' j j' R R'. assume H1. assume H2. assume H3.
prove (X,encode_u X i,encode_u X j,encode_r X R) = (X,encode_u X i',encode_u X j',encode_r X R').
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

Definition struct_u_u_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall R:set -> set -> prop, q (pack_u_u_r X i j R)) -> q S.

Theorem pack_struct_u_u_r_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall R:set -> set -> prop, struct_u_u_r (pack_u_u_r X i j R).
let X i. assume Hi. let j. assume Hj. let R q. assume Hq.
exact Hq X i Hi j Hj R.
Qed.

Theorem pack_struct_u_u_r_E1: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, struct_u_u_r (pack_u_u_r X i j R) -> forall x :e X, i x :e X.
let X i j R. assume H1. apply H1 (fun z => z = pack_u_u_r X i j R -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let R'.
  assume Heq: pack_u_u_r X' i' j' R' = pack_u_u_r X i j R.
  apply pack_u_u_r_inj X' X i' i j' j R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HR'R.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_r_E2: forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop, struct_u_u_r (pack_u_u_r X i j R) -> forall x :e X, j x :e X.
let X i j R. assume H1. apply H1 (fun z => z = pack_u_u_r X i j R -> forall x :e X, j x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let R'.
  assume Heq: pack_u_u_r X' i' j' R' = pack_u_u_r X i j R.
  apply pack_u_u_r_inj X' X i' i j' j R' R Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HR'R.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem struct_u_u_r_eta: forall S, struct_u_u_r S -> S = pack_u_u_r (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_u_u_r (z 0) (decode_u (z 1)) (decode_u (z 2)) (decode_r (z 3))).
let X. let i. assume _. let j. assume _. let R.
prove pack_u_u_r X i j R = pack_u_u_r (pack_u_u_r X i j R 0) (decode_u (pack_u_u_r X i j R 1)) (decode_u (pack_u_u_r X i j R 2)) (decode_r (pack_u_u_r X i j R 3)).
rewrite <- pack_u_u_r_0_eq2 X i j R.
apply pack_u_u_r_ext.
- exact pack_u_u_r_1_eq2 X i j R.
- exact pack_u_u_r_2_eq2 X i j R.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_u_r_3_eq2 X i j R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_u_r_i : set -> (set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)).

Theorem unpack_u_u_r_i_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> set,
  forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X i' j' R' = Phi X i j R)
  ->
  unpack_u_u_r_i (pack_u_u_r X i j R) Phi = Phi X i j R.
let Phi X i j R.
assume HPhi.
prove Phi (pack_u_u_r X i j R 0) (decode_u (pack_u_u_r X i j R 1)) (decode_u (pack_u_u_r X i j R 2)) (decode_r (pack_u_u_r X i j R 3)) = Phi X i j R.
rewrite <- pack_u_u_r_0_eq2 X i j R.
prove Phi X (decode_u (pack_u_u_r X i j R 1)) (decode_u (pack_u_u_r X i j R 2)) (decode_r (pack_u_u_r X i j R 3)) = Phi X i j R.
apply HPhi.
- exact pack_u_u_r_1_eq2 X i j R.
- exact pack_u_u_r_2_eq2 X i j R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_u_r X i j R 3) x y.
  rewrite <- pack_u_u_r_3_eq2 X i j R x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_u_r_o : set -> (set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_r (S 3)).

Theorem unpack_u_u_r_o_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> set -> prop) -> prop,
  forall X, forall i:set -> set, forall j:set -> set, forall R:set -> set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X i' j' R' = Phi X i j R)
  ->
  unpack_u_u_r_o (pack_u_u_r X i j R) Phi = Phi X i j R.
let Phi X i j R.
assume HPhi.
prove Phi (pack_u_u_r X i j R 0) (decode_u (pack_u_u_r X i j R 1)) (decode_u (pack_u_u_r X i j R 2)) (decode_r (pack_u_u_r X i j R 3)) = Phi X i j R.
rewrite <- pack_u_u_r_0_eq2 X i j R.
prove Phi X (decode_u (pack_u_u_r X i j R 1)) (decode_u (pack_u_u_r X i j R 2)) (decode_r (pack_u_u_r X i j R 3)) = Phi X i j R.
apply HPhi.
- exact pack_u_u_r_1_eq2 X i j R.
- exact pack_u_u_r_2_eq2 X i j R.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_u_r X i j R 3) x y.
  rewrite <- pack_u_u_r_3_eq2 X i j R x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_u_u_p : set -> (set -> set) -> (set -> set) -> (set -> prop) -> set := fun X i j P => (X,encode_u X i,encode_u X j,encode_p X P).

Theorem pack_u_u_p_0_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, S = pack_u_u_p X i j P -> X = S 0.
let S X i j P. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_u X j,encode_p X P) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_u_u_p_0_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, X = pack_u_u_p X i j P 0.
let X i j P. apply pack_u_u_p_0_eq (pack_u_u_p X i j P) X i j P. reflexivity.
Qed.

Theorem pack_u_u_p_1_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, S = pack_u_u_p X i j P -> forall x :e X, i x = decode_u (S 1) x.
let S X i j P. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_u X j,encode_p X P) 1) x.
rewrite tuple_4_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_u_p_1_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall x :e X, i x = decode_u (pack_u_u_p X i j P 1) x.
let X i j P. apply pack_u_u_p_1_eq (pack_u_u_p X i j P) X i j P. reflexivity.
Qed.

Theorem pack_u_u_p_2_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, S = pack_u_u_p X i j P -> forall x :e X, j x = decode_u (S 2) x.
let S X i j P. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_u X i,encode_u X j,encode_p X P) 2) x.
rewrite tuple_4_2_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_u_u_p_2_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall x :e X, j x = decode_u (pack_u_u_p X i j P 2) x.
let X i j P. apply pack_u_u_p_2_eq (pack_u_u_p X i j P) X i j P. reflexivity.
Qed.

Theorem pack_u_u_p_3_eq: forall S X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, S = pack_u_u_p X i j P -> forall x :e X, P x = decode_p (S 3) x.
let S X i j P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_u X i,encode_u X j,encode_p X P) 3) x.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_u_u_p_3_eq2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, forall x :e X, P x = decode_p (pack_u_u_p X i j P 3) x.
let X i j P. apply pack_u_u_p_3_eq (pack_u_u_p X i j P) X i j P. reflexivity.
Qed.

Theorem pack_u_u_p_inj : forall X X', forall i i':set -> set, forall j j':set -> set, forall P P':set -> prop, pack_u_u_p X i j P = pack_u_u_p X' i' j' P' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x) /\ (forall x :e X, P x = P' x).
let X X' i i' j j' P P'. assume H1.
claim L0: X' = pack_u_u_p X i j P 0.
{ exact pack_u_u_p_0_eq (pack_u_u_p X i j P) X' i' j' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_u_p_0_eq2 X i j P. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_u_p_1_eq2 X i j P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_p_1_eq2 X' i' j' P' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_u_u_p_2_eq2 X i j P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_p_2_eq2 X' i' j' P' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_u_u_p_3_eq2 X i j P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_p_3_eq2 X' i' j' P' x Lx.
Qed.

Theorem pack_u_u_p_ext : forall X, forall i i':set -> set, forall j j':set -> set, forall P P':set -> prop,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_u_u_p X i j P = pack_u_u_p X i' j' P'.
let X i i' j j' P P'. assume H1. assume H2. assume H3.
prove (X,encode_u X i,encode_u X j,encode_p X P) = (X,encode_u X i',encode_u X j',encode_p X P').
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

Definition struct_u_u_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall P:set -> prop, q (pack_u_u_p X i j P)) -> q S.

Theorem pack_struct_u_u_p_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall P:set -> prop, struct_u_u_p (pack_u_u_p X i j P).
let X i. assume Hi. let j. assume Hj. let P q. assume Hq.
exact Hq X i Hi j Hj P.
Qed.

Theorem pack_struct_u_u_p_E1: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, struct_u_u_p (pack_u_u_p X i j P) -> forall x :e X, i x :e X.
let X i j P. assume H1. apply H1 (fun z => z = pack_u_u_p X i j P -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let P'.
  assume Heq: pack_u_u_p X' i' j' P' = pack_u_u_p X i j P.
  apply pack_u_u_p_inj X' X i' i j' j P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_p_E2: forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop, struct_u_u_p (pack_u_u_p X i j P) -> forall x :e X, j x :e X.
let X i j P. assume H1. apply H1 (fun z => z = pack_u_u_p X i j P -> forall x :e X, j x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let P'.
  assume Heq: pack_u_u_p X' i' j' P' = pack_u_u_p X i j P.
  apply pack_u_u_p_inj X' X i' i j' j P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem struct_u_u_p_eta: forall S, struct_u_u_p S -> S = pack_u_u_p (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_p (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_u_u_p (z 0) (decode_u (z 1)) (decode_u (z 2)) (decode_p (z 3))).
let X. let i. assume _. let j. assume _. let P.
prove pack_u_u_p X i j P = pack_u_u_p (pack_u_u_p X i j P 0) (decode_u (pack_u_u_p X i j P 1)) (decode_u (pack_u_u_p X i j P 2)) (decode_p (pack_u_u_p X i j P 3)).
rewrite <- pack_u_u_p_0_eq2 X i j P.
apply pack_u_u_p_ext.
- exact pack_u_u_p_1_eq2 X i j P.
- exact pack_u_u_p_2_eq2 X i j P.
- let x. assume Hx.
  rewrite <- pack_u_u_p_3_eq2 X i j P x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_u_p_i : set -> (set -> (set -> set) -> (set -> set) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_p (S 3)).

Theorem unpack_u_u_p_i_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> prop) -> set,
  forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' j' P' = Phi X i j P)
  ->
  unpack_u_u_p_i (pack_u_u_p X i j P) Phi = Phi X i j P.
let Phi X i j P.
assume HPhi.
prove Phi (pack_u_u_p X i j P 0) (decode_u (pack_u_u_p X i j P 1)) (decode_u (pack_u_u_p X i j P 2)) (decode_p (pack_u_u_p X i j P 3)) = Phi X i j P.
rewrite <- pack_u_u_p_0_eq2 X i j P.
prove Phi X (decode_u (pack_u_u_p X i j P 1)) (decode_u (pack_u_u_p X i j P 2)) (decode_p (pack_u_u_p X i j P 3)) = Phi X i j P.
apply HPhi.
- exact pack_u_u_p_1_eq2 X i j P.
- exact pack_u_u_p_2_eq2 X i j P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_u_p X i j P 3) x.
  rewrite <- pack_u_u_p_3_eq2 X i j P x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_u_p_o : set -> (set -> (set -> set) -> (set -> set) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (decode_p (S 3)).

Theorem unpack_u_u_p_o_eq : forall Phi:set -> (set -> set) -> (set -> set) -> (set -> prop) -> prop,
  forall X, forall i:set -> set, forall j:set -> set, forall P:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' j' P' = Phi X i j P)
  ->
  unpack_u_u_p_o (pack_u_u_p X i j P) Phi = Phi X i j P.
let Phi X i j P.
assume HPhi.
prove Phi (pack_u_u_p X i j P 0) (decode_u (pack_u_u_p X i j P 1)) (decode_u (pack_u_u_p X i j P 2)) (decode_p (pack_u_u_p X i j P 3)) = Phi X i j P.
rewrite <- pack_u_u_p_0_eq2 X i j P.
prove Phi X (decode_u (pack_u_u_p X i j P 1)) (decode_u (pack_u_u_p X i j P 2)) (decode_p (pack_u_u_p X i j P 3)) = Phi X i j P.
apply HPhi.
- exact pack_u_u_p_1_eq2 X i j P.
- exact pack_u_u_p_2_eq2 X i j P.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_u_p X i j P 3) x.
  rewrite <- pack_u_u_p_3_eq2 X i j P x Hx.
  apply iff_refl.
Qed.


Definition pack_u_u_e : set -> (set -> set) -> (set -> set) -> set -> set := fun X i j c => (X,encode_u X i,encode_u X j,c).

Theorem pack_u_u_e_0_eq: forall S X, forall i:set -> set, forall j:set -> set, forall c:set, S = pack_u_u_e X i j c -> X = S 0.
let S X i j c. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_u X j,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_u_u_e_0_eq2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, X = pack_u_u_e X i j c 0.
let X i j c. apply pack_u_u_e_0_eq (pack_u_u_e X i j c) X i j c. reflexivity.
Qed.

Theorem pack_u_u_e_1_eq: forall S X, forall i:set -> set, forall j:set -> set, forall c:set, S = pack_u_u_e X i j c -> forall x :e X, i x = decode_u (S 1) x.
let S X i j c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_u X j,c) 1) x.
rewrite tuple_4_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_u_e_1_eq2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall x :e X, i x = decode_u (pack_u_u_e X i j c 1) x.
let X i j c. apply pack_u_u_e_1_eq (pack_u_u_e X i j c) X i j c. reflexivity.
Qed.

Theorem pack_u_u_e_2_eq: forall S X, forall i:set -> set, forall j:set -> set, forall c:set, S = pack_u_u_e X i j c -> forall x :e X, j x = decode_u (S 2) x.
let S X i j c. assume H1.
let x. assume Hx. rewrite H1.
prove j x = decode_u ((X,encode_u X i,encode_u X j,c) 2) x.
rewrite tuple_4_2_eq.
symmetry. apply decode_encode_u X j x Hx.
Qed.

Theorem pack_u_u_e_2_eq2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, forall x :e X, j x = decode_u (pack_u_u_e X i j c 2) x.
let X i j c. apply pack_u_u_e_2_eq (pack_u_u_e X i j c) X i j c. reflexivity.
Qed.

Theorem pack_u_u_e_3_eq: forall S X, forall i:set -> set, forall j:set -> set, forall c:set, S = pack_u_u_e X i j c -> c = S 3.
let S X i j c. assume H1.
rewrite H1. prove c = (X,encode_u X i,encode_u X j,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_u_u_e_3_eq2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, c = pack_u_u_e X i j c 3.
let X i j c. apply pack_u_u_e_3_eq (pack_u_u_e X i j c) X i j c. reflexivity.
Qed.

Theorem pack_u_u_e_inj : forall X X', forall i i':set -> set, forall j j':set -> set, forall c c':set, pack_u_u_e X i j c = pack_u_u_e X' i' j' c' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, j x = j' x) /\ c = c'.
let X X' i i' j j' c c'. assume H1.
claim L0: X' = pack_u_u_e X i j c 0.
{ exact pack_u_u_e_0_eq (pack_u_u_e X i j c) X' i' j' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_u_e_0_eq2 X i j c. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_u_e_1_eq2 X i j c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_e_1_eq2 X' i' j' c' x Lx.
- let x. assume Hx: x :e X.
  prove j x = j' x.
  rewrite pack_u_u_e_2_eq2 X i j c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_u_e_2_eq2 X' i' j' c' x Lx.
- prove c = c'.
  rewrite pack_u_u_e_3_eq2 X i j c.
  rewrite H1. symmetry.
  exact pack_u_u_e_3_eq2 X' i' j' c'.
Qed.

Theorem pack_u_u_e_ext : forall X, forall i i':set -> set, forall j j':set -> set, forall c,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, j x = j' x) ->
 pack_u_u_e X i j c = pack_u_u_e X i' j' c.
let X i i' j j' c. assume H1. assume H2.
prove (X,encode_u X i,encode_u X j,c) = (X,encode_u X i',encode_u X j',c).
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_u X j = encode_u X j'.
{ apply encode_u_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_u_u_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall c:set, c :e X -> q (pack_u_u_e X i j c)) -> q S.

Theorem pack_struct_u_u_e_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall j:set -> set, (forall x :e X, j x :e X) -> forall c:set, c :e X -> struct_u_u_e (pack_u_u_e X i j c).
let X i. assume Hi. let j. assume Hj. let c. assume Hc. let q. assume Hq.
exact Hq X i Hi j Hj c Hc.
Qed.

Theorem pack_struct_u_u_e_E1: forall X, forall i:set -> set, forall j:set -> set, forall c:set, struct_u_u_e (pack_u_u_e X i j c) -> forall x :e X, i x :e X.
let X i j c. assume H1. apply H1 (fun z => z = pack_u_u_e X i j c -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let c'. assume Hc'.
  assume Heq: pack_u_u_e X' i' j' c' = pack_u_u_e X i j c.
  apply pack_u_u_e_inj X' X i' i j' j c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_e_E2: forall X, forall i:set -> set, forall j:set -> set, forall c:set, struct_u_u_e (pack_u_u_e X i j c) -> forall x :e X, j x :e X.
let X i j c. assume H1. apply H1 (fun z => z = pack_u_u_e X i j c -> forall x :e X, j x :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let c'. assume Hc'.
  assume Heq: pack_u_u_e X' i' j' c' = pack_u_u_e X i j c.
  apply pack_u_u_e_inj X' X i' i j' j c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hj'j x Hx.  exact Hj' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_u_e_E3: forall X, forall i:set -> set, forall j:set -> set, forall c:set, struct_u_u_e (pack_u_u_e X i j c) -> c :e X.
let X i j c. assume H1. apply H1 (fun z => z = pack_u_u_e X i j c -> c :e X).
- let X'. let i'. assume Hi'. let j'. assume Hj'. let c'. assume Hc'.
  assume Heq: pack_u_u_e X' i' j' c' = pack_u_u_e X i j c.
  apply pack_u_u_e_inj X' X i' i j' j c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i Hj'j Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_u_u_e_eta: forall S, struct_u_u_e S -> S = pack_u_u_e (S 0) (decode_u (S 1)) (decode_u (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_u_u_e (z 0) (decode_u (z 1)) (decode_u (z 2)) (z 3)).
let X. let i. assume _. let j. assume _. let c. assume _.
prove pack_u_u_e X i j c = pack_u_u_e (pack_u_u_e X i j c 0) (decode_u (pack_u_u_e X i j c 1)) (decode_u (pack_u_u_e X i j c 2)) (pack_u_u_e X i j c 3).
rewrite <- pack_u_u_e_0_eq2 X i j c.
rewrite <- pack_u_u_e_3_eq2 X i j c.
apply pack_u_u_e_ext.
- exact pack_u_u_e_1_eq2 X i j c.
- exact pack_u_u_e_2_eq2 X i j c.
Qed.


Definition unpack_u_u_e_i : set -> (set -> (set -> set) -> (set -> set) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (S 3).

Theorem unpack_u_u_e_i_eq : forall Phi:set -> (set -> set) -> (set -> set) -> set -> set,
  forall X, forall i:set -> set, forall j:set -> set, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) -> Phi X i' j' c = Phi X i j c)
  ->
  unpack_u_u_e_i (pack_u_u_e X i j c) Phi = Phi X i j c.
let Phi X i j c.
assume HPhi.
prove Phi (pack_u_u_e X i j c 0) (decode_u (pack_u_u_e X i j c 1)) (decode_u (pack_u_u_e X i j c 2)) (pack_u_u_e X i j c 3) = Phi X i j c.
rewrite <- pack_u_u_e_0_eq2 X i j c.
prove Phi X (decode_u (pack_u_u_e X i j c 1)) (decode_u (pack_u_u_e X i j c 2)) (pack_u_u_e X i j c 3) = Phi X i j c.
rewrite <- pack_u_u_e_3_eq2 X i j c.
apply HPhi.
- exact pack_u_u_e_1_eq2 X i j c.
- exact pack_u_u_e_2_eq2 X i j c.
Qed.


Definition unpack_u_u_e_o : set -> (set -> (set -> set) -> (set -> set) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_u (S 2)) (S 3).

Theorem unpack_u_u_e_o_eq : forall Phi:set -> (set -> set) -> (set -> set) -> set -> prop,
  forall X, forall i:set -> set, forall j:set -> set, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall j':set -> set, (forall x :e X, j x = j' x) -> Phi X i' j' c = Phi X i j c)
  ->
  unpack_u_u_e_o (pack_u_u_e X i j c) Phi = Phi X i j c.
let Phi X i j c.
assume HPhi.
prove Phi (pack_u_u_e X i j c 0) (decode_u (pack_u_u_e X i j c 1)) (decode_u (pack_u_u_e X i j c 2)) (pack_u_u_e X i j c 3) = Phi X i j c.
rewrite <- pack_u_u_e_0_eq2 X i j c.
prove Phi X (decode_u (pack_u_u_e X i j c 1)) (decode_u (pack_u_u_e X i j c 2)) (pack_u_u_e X i j c 3) = Phi X i j c.
rewrite <- pack_u_u_e_3_eq2 X i j c.
apply HPhi.
- exact pack_u_u_e_1_eq2 X i j c.
- exact pack_u_u_e_2_eq2 X i j c.
Qed.


Definition pack_u_r_p : set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set := fun X i R P => (X,encode_u X i,encode_r X R,encode_p X P).

Theorem pack_u_r_p_0_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_u_r_p X i R P -> X = S 0.
let S X i R P. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_r X R,encode_p X P) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_u_r_p_0_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, X = pack_u_r_p X i R P 0.
let X i R P. apply pack_u_r_p_0_eq (pack_u_r_p X i R P) X i R P. reflexivity.
Qed.

Theorem pack_u_r_p_1_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_u_r_p X i R P -> forall x :e X, i x = decode_u (S 1) x.
let S X i R P. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_r X R,encode_p X P) 1) x.
rewrite tuple_4_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_r_p_1_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, i x = decode_u (pack_u_r_p X i R P 1) x.
let X i R P. apply pack_u_r_p_1_eq (pack_u_r_p X i R P) X i R P. reflexivity.
Qed.

Theorem pack_u_r_p_2_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_u_r_p X i R P -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X i R P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_u X i,encode_r X R,encode_p X P) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_u_r_p_2_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x y :e X, R x y = decode_r (pack_u_r_p X i R P 2) x y.
let X i R P. apply pack_u_r_p_2_eq (pack_u_r_p X i R P) X i R P. reflexivity.
Qed.

Theorem pack_u_r_p_3_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, S = pack_u_r_p X i R P -> forall x :e X, P x = decode_p (S 3) x.
let S X i R P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_u X i,encode_r X R,encode_p X P) 3) x.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_u_r_p_3_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_u_r_p X i R P 3) x.
let X i R P. apply pack_u_r_p_3_eq (pack_u_r_p X i R P) X i R P. reflexivity.
Qed.

Theorem pack_u_r_p_inj : forall X X', forall i i':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop, pack_u_r_p X i R P = pack_u_r_p X' i' R' P' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x).
let X X' i i' R R' P P'. assume H1.
claim L0: X' = pack_u_r_p X i R P 0.
{ exact pack_u_r_p_0_eq (pack_u_r_p X i R P) X' i' R' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_r_p_0_eq2 X i R P. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_r_p_1_eq2 X i R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_r_p_1_eq2 X' i' R' P' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_u_r_p_2_eq2 X i R P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_r_p_2_eq2 X' i' R' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_u_r_p_3_eq2 X i R P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_r_p_3_eq2 X' i' R' P' x Lx.
Qed.

Theorem pack_u_r_p_ext : forall X, forall i i':set -> set, forall R R':set -> set -> prop, forall P P':set -> prop,
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_u_r_p X i R P = pack_u_r_p X i' R' P'.
let X i i' R R' P P'. assume H1. assume H2. assume H3.
prove (X,encode_u X i,encode_r X R,encode_p X P) = (X,encode_u X i',encode_r X R',encode_p X P').
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

Definition struct_u_r_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, q (pack_u_r_p X i R P)) -> q S.

Theorem pack_struct_u_r_p_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall P:set -> prop, struct_u_r_p (pack_u_r_p X i R P).
let X i. assume Hi. let R P q. assume Hq.
exact Hq X i Hi R P.
Qed.

Theorem pack_struct_u_r_p_E1: forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop, struct_u_r_p (pack_u_r_p X i R P) -> forall x :e X, i x :e X.
let X i R P. assume H1. apply H1 (fun z => z = pack_u_r_p X i R P -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let R'. let P'.
  assume Heq: pack_u_r_p X' i' R' P' = pack_u_r_p X i R P.
  apply pack_u_r_p_inj X' X i' i R' R P' P Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HR'R HP'P.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem struct_u_r_p_eta: forall S, struct_u_r_p S -> S = pack_u_r_p (S 0) (decode_u (S 1)) (decode_r (S 2)) (decode_p (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_u_r_p (z 0) (decode_u (z 1)) (decode_r (z 2)) (decode_p (z 3))).
let X. let i. assume _. let R. let P.
prove pack_u_r_p X i R P = pack_u_r_p (pack_u_r_p X i R P 0) (decode_u (pack_u_r_p X i R P 1)) (decode_r (pack_u_r_p X i R P 2)) (decode_p (pack_u_r_p X i R P 3)).
rewrite <- pack_u_r_p_0_eq2 X i R P.
apply pack_u_r_p_ext.
- exact pack_u_r_p_1_eq2 X i R P.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_r_p_2_eq2 X i R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_u_r_p_3_eq2 X i R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_r_p_i : set -> (set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)) (decode_p (S 3)).

Theorem unpack_u_r_p_i_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> set,
  forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' R' P' = Phi X i R P)
  ->
  unpack_u_r_p_i (pack_u_r_p X i R P) Phi = Phi X i R P.
let Phi X i R P.
assume HPhi.
prove Phi (pack_u_r_p X i R P 0) (decode_u (pack_u_r_p X i R P 1)) (decode_r (pack_u_r_p X i R P 2)) (decode_p (pack_u_r_p X i R P 3)) = Phi X i R P.
rewrite <- pack_u_r_p_0_eq2 X i R P.
prove Phi X (decode_u (pack_u_r_p X i R P 1)) (decode_r (pack_u_r_p X i R P 2)) (decode_p (pack_u_r_p X i R P 3)) = Phi X i R P.
apply HPhi.
- exact pack_u_r_p_1_eq2 X i R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r_p X i R P 2) x y.
  rewrite <- pack_u_r_p_2_eq2 X i R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_r_p X i R P 3) x.
  rewrite <- pack_u_r_p_3_eq2 X i R P x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_r_p_o : set -> (set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)) (decode_p (S 3)).

Theorem unpack_u_r_p_o_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> (set -> prop) -> prop,
  forall X, forall i:set -> set, forall R:set -> set -> prop, forall P:set -> prop,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' R' P' = Phi X i R P)
  ->
  unpack_u_r_p_o (pack_u_r_p X i R P) Phi = Phi X i R P.
let Phi X i R P.
assume HPhi.
prove Phi (pack_u_r_p X i R P 0) (decode_u (pack_u_r_p X i R P 1)) (decode_r (pack_u_r_p X i R P 2)) (decode_p (pack_u_r_p X i R P 3)) = Phi X i R P.
rewrite <- pack_u_r_p_0_eq2 X i R P.
prove Phi X (decode_u (pack_u_r_p X i R P 1)) (decode_r (pack_u_r_p X i R P 2)) (decode_p (pack_u_r_p X i R P 3)) = Phi X i R P.
apply HPhi.
- exact pack_u_r_p_1_eq2 X i R P.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r_p X i R P 2) x y.
  rewrite <- pack_u_r_p_2_eq2 X i R P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_r_p X i R P 3) x.
  rewrite <- pack_u_r_p_3_eq2 X i R P x Hx.
  apply iff_refl.
Qed.


Definition pack_u_r_e : set -> (set -> set) -> (set -> set -> prop) -> set -> set := fun X i R c => (X,encode_u X i,encode_r X R,c).

Theorem pack_u_r_e_0_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_u_r_e X i R c -> X = S 0.
let S X i R c. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_r X R,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_u_r_e_0_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, X = pack_u_r_e X i R c 0.
let X i R c. apply pack_u_r_e_0_eq (pack_u_r_e X i R c) X i R c. reflexivity.
Qed.

Theorem pack_u_r_e_1_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_u_r_e X i R c -> forall x :e X, i x = decode_u (S 1) x.
let S X i R c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_r X R,c) 1) x.
rewrite tuple_4_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_r_e_1_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall x :e X, i x = decode_u (pack_u_r_e X i R c 1) x.
let X i R c. apply pack_u_r_e_1_eq (pack_u_r_e X i R c) X i R c. reflexivity.
Qed.

Theorem pack_u_r_e_2_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_u_r_e X i R c -> forall x y :e X, R x y = decode_r (S 2) x y.
let S X i R c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_u X i,encode_r X R,c) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_u_r_e_2_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_u_r_e X i R c 2) x y.
let X i R c. apply pack_u_r_e_2_eq (pack_u_r_e X i R c) X i R c. reflexivity.
Qed.

Theorem pack_u_r_e_3_eq: forall S X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, S = pack_u_r_e X i R c -> c = S 3.
let S X i R c. assume H1.
rewrite H1. prove c = (X,encode_u X i,encode_r X R,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_u_r_e_3_eq2: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, c = pack_u_r_e X i R c 3.
let X i R c. apply pack_u_r_e_3_eq (pack_u_r_e X i R c) X i R c. reflexivity.
Qed.

Theorem pack_u_r_e_inj : forall X X', forall i i':set -> set, forall R R':set -> set -> prop, forall c c':set, pack_u_r_e X i R c = pack_u_r_e X' i' R' c' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x y :e X, R x y = R' x y) /\ c = c'.
let X X' i i' R R' c c'. assume H1.
claim L0: X' = pack_u_r_e X i R c 0.
{ exact pack_u_r_e_0_eq (pack_u_r_e X i R c) X' i' R' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_r_e_0_eq2 X i R c. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_r_e_1_eq2 X i R c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_r_e_1_eq2 X' i' R' c' x Lx.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_u_r_e_2_eq2 X i R c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_u_r_e_2_eq2 X' i' R' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_u_r_e_3_eq2 X i R c.
  rewrite H1. symmetry.
  exact pack_u_r_e_3_eq2 X' i' R' c'.
Qed.

Theorem pack_u_r_e_ext : forall X, forall i i':set -> set, forall R R':set -> set -> prop, forall c,
 (forall x :e X, i x = i' x) ->
 (forall x y :e X, R x y <-> R' x y) ->
 pack_u_r_e X i R c = pack_u_r_e X i' R' c.
let X i i' R R' c. assume H1. assume H2.
prove (X,encode_u X i,encode_r X R,c) = (X,encode_u X i',encode_r X R',c).
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_u_r_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> q (pack_u_r_e X i R c)) -> q S.

Theorem pack_struct_u_r_e_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall R:set -> set -> prop, forall c:set, c :e X -> struct_u_r_e (pack_u_r_e X i R c).
let X i. assume Hi. let R c. assume Hc. let q. assume Hq.
exact Hq X i Hi R c Hc.
Qed.

Theorem pack_struct_u_r_e_E1: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, struct_u_r_e (pack_u_r_e X i R c) -> forall x :e X, i x :e X.
let X i R c. assume H1. apply H1 (fun z => z = pack_u_r_e X i R c -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let R'. let c'. assume Hc'.
  assume Heq: pack_u_r_e X' i' R' c' = pack_u_r_e X i R c.
  apply pack_u_r_e_inj X' X i' i R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HR'R Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_r_e_E3: forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set, struct_u_r_e (pack_u_r_e X i R c) -> c :e X.
let X i R c. assume H1. apply H1 (fun z => z = pack_u_r_e X i R c -> c :e X).
- let X'. let i'. assume Hi'. let R'. let c'. assume Hc'.
  assume Heq: pack_u_r_e X' i' R' c' = pack_u_r_e X i R c.
  apply pack_u_r_e_inj X' X i' i R' R c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HR'R Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_u_r_e_eta: forall S, struct_u_r_e S -> S = pack_u_r_e (S 0) (decode_u (S 1)) (decode_r (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_u_r_e (z 0) (decode_u (z 1)) (decode_r (z 2)) (z 3)).
let X. let i. assume _. let R. let c. assume _.
prove pack_u_r_e X i R c = pack_u_r_e (pack_u_r_e X i R c 0) (decode_u (pack_u_r_e X i R c 1)) (decode_r (pack_u_r_e X i R c 2)) (pack_u_r_e X i R c 3).
rewrite <- pack_u_r_e_0_eq2 X i R c.
rewrite <- pack_u_r_e_3_eq2 X i R c.
apply pack_u_r_e_ext.
- exact pack_u_r_e_1_eq2 X i R c.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_u_r_e_2_eq2 X i R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_r_e_i : set -> (set -> (set -> set) -> (set -> set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)) (S 3).

Theorem unpack_u_r_e_i_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> set -> set,
  forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X i' R' c = Phi X i R c)
  ->
  unpack_u_r_e_i (pack_u_r_e X i R c) Phi = Phi X i R c.
let Phi X i R c.
assume HPhi.
prove Phi (pack_u_r_e X i R c 0) (decode_u (pack_u_r_e X i R c 1)) (decode_r (pack_u_r_e X i R c 2)) (pack_u_r_e X i R c 3) = Phi X i R c.
rewrite <- pack_u_r_e_0_eq2 X i R c.
prove Phi X (decode_u (pack_u_r_e X i R c 1)) (decode_r (pack_u_r_e X i R c 2)) (pack_u_r_e X i R c 3) = Phi X i R c.
rewrite <- pack_u_r_e_3_eq2 X i R c.
apply HPhi.
- exact pack_u_r_e_1_eq2 X i R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r_e X i R c 2) x y.
  rewrite <- pack_u_r_e_2_eq2 X i R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_u_r_e_o : set -> (set -> (set -> set) -> (set -> set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_r (S 2)) (S 3).

Theorem unpack_u_r_e_o_eq : forall Phi:set -> (set -> set) -> (set -> set -> prop) -> set -> prop,
  forall X, forall i:set -> set, forall R:set -> set -> prop, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X i' R' c = Phi X i R c)
  ->
  unpack_u_r_e_o (pack_u_r_e X i R c) Phi = Phi X i R c.
let Phi X i R c.
assume HPhi.
prove Phi (pack_u_r_e X i R c 0) (decode_u (pack_u_r_e X i R c 1)) (decode_r (pack_u_r_e X i R c 2)) (pack_u_r_e X i R c 3) = Phi X i R c.
rewrite <- pack_u_r_e_0_eq2 X i R c.
prove Phi X (decode_u (pack_u_r_e X i R c 1)) (decode_r (pack_u_r_e X i R c 2)) (pack_u_r_e X i R c 3) = Phi X i R c.
rewrite <- pack_u_r_e_3_eq2 X i R c.
apply HPhi.
- exact pack_u_r_e_1_eq2 X i R c.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_u_r_e X i R c 2) x y.
  rewrite <- pack_u_r_e_2_eq2 X i R c x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_u_p_e : set -> (set -> set) -> (set -> prop) -> set -> set := fun X i P c => (X,encode_u X i,encode_p X P,c).

Theorem pack_u_p_e_0_eq: forall S X, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_u_p_e X i P c -> X = S 0.
let S X i P c. assume H1. rewrite H1.
prove X = (X,encode_u X i,encode_p X P,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_u_p_e_0_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, X = pack_u_p_e X i P c 0.
let X i P c. apply pack_u_p_e_0_eq (pack_u_p_e X i P c) X i P c. reflexivity.
Qed.

Theorem pack_u_p_e_1_eq: forall S X, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_u_p_e X i P c -> forall x :e X, i x = decode_u (S 1) x.
let S X i P c. assume H1.
let x. assume Hx. rewrite H1.
prove i x = decode_u ((X,encode_u X i,encode_p X P,c) 1) x.
rewrite tuple_4_1_eq.
symmetry. apply decode_encode_u X i x Hx.
Qed.

Theorem pack_u_p_e_1_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall x :e X, i x = decode_u (pack_u_p_e X i P c 1) x.
let X i P c. apply pack_u_p_e_1_eq (pack_u_p_e X i P c) X i P c. reflexivity.
Qed.

Theorem pack_u_p_e_2_eq: forall S X, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_u_p_e X i P c -> forall x :e X, P x = decode_p (S 2) x.
let S X i P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_u X i,encode_p X P,c) 2) x.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_u_p_e_2_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_u_p_e X i P c 2) x.
let X i P c. apply pack_u_p_e_2_eq (pack_u_p_e X i P c) X i P c. reflexivity.
Qed.

Theorem pack_u_p_e_3_eq: forall S X, forall i:set -> set, forall P:set -> prop, forall c:set, S = pack_u_p_e X i P c -> c = S 3.
let S X i P c. assume H1.
rewrite H1. prove c = (X,encode_u X i,encode_p X P,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_u_p_e_3_eq2: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, c = pack_u_p_e X i P c 3.
let X i P c. apply pack_u_p_e_3_eq (pack_u_p_e X i P c) X i P c. reflexivity.
Qed.

Theorem pack_u_p_e_inj : forall X X', forall i i':set -> set, forall P P':set -> prop, forall c c':set, pack_u_p_e X i P c = pack_u_p_e X' i' P' c' -> X = X' /\ (forall x :e X, i x = i' x) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' i i' P P' c c'. assume H1.
claim L0: X' = pack_u_p_e X i P c 0.
{ exact pack_u_p_e_0_eq (pack_u_p_e X i P c) X' i' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_p_e_0_eq2 X i P c. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X.
  prove i x = i' x.
  rewrite pack_u_p_e_1_eq2 X i P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_p_e_1_eq2 X' i' P' c' x Lx.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_u_p_e_2_eq2 X i P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_u_p_e_2_eq2 X' i' P' c' x Lx.
- prove c = c'.
  rewrite pack_u_p_e_3_eq2 X i P c.
  rewrite H1. symmetry.
  exact pack_u_p_e_3_eq2 X' i' P' c'.
Qed.

Theorem pack_u_p_e_ext : forall X, forall i i':set -> set, forall P P':set -> prop, forall c,
 (forall x :e X, i x = i' x) ->
 (forall x :e X, P x <-> P' x) ->
 pack_u_p_e X i P c = pack_u_p_e X i' P' c.
let X i i' P P' c. assume H1. assume H2.
prove (X,encode_u X i,encode_p X P,c) = (X,encode_u X i',encode_p X P',c).
claim L1: encode_u X i = encode_u X i'.
{ apply encode_u_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_u_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall c:set, c :e X -> q (pack_u_p_e X i P c)) -> q S.

Theorem pack_struct_u_p_e_I: forall X, forall i:set -> set, (forall x :e X, i x :e X) -> forall P:set -> prop, forall c:set, c :e X -> struct_u_p_e (pack_u_p_e X i P c).
let X i. assume Hi. let P c. assume Hc. let q. assume Hq.
exact Hq X i Hi P c Hc.
Qed.

Theorem pack_struct_u_p_e_E1: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, struct_u_p_e (pack_u_p_e X i P c) -> forall x :e X, i x :e X.
let X i P c. assume H1. apply H1 (fun z => z = pack_u_p_e X i P c -> forall x :e X, i x :e X).
- let X'. let i'. assume Hi'. let P'. let c'. assume Hc'.
  assume Heq: pack_u_p_e X' i' P' c' = pack_u_p_e X i P c.
  apply pack_u_p_e_inj X' X i' i P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HP'P Hc'c.
  rewrite <- HX'X.  let x. assume Hx.
  rewrite <- Hi'i x Hx.  exact Hi' x Hx.
- reflexivity.
Qed.

Theorem pack_struct_u_p_e_E3: forall X, forall i:set -> set, forall P:set -> prop, forall c:set, struct_u_p_e (pack_u_p_e X i P c) -> c :e X.
let X i P c. assume H1. apply H1 (fun z => z = pack_u_p_e X i P c -> c :e X).
- let X'. let i'. assume Hi'. let P'. let c'. assume Hc'.
  assume Heq: pack_u_p_e X' i' P' c' = pack_u_p_e X i P c.
  apply pack_u_p_e_inj X' X i' i P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X Hi'i HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_u_p_e_eta: forall S, struct_u_p_e S -> S = pack_u_p_e (S 0) (decode_u (S 1)) (decode_p (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_u_p_e (z 0) (decode_u (z 1)) (decode_p (z 2)) (z 3)).
let X. let i. assume _. let P. let c. assume _.
prove pack_u_p_e X i P c = pack_u_p_e (pack_u_p_e X i P c 0) (decode_u (pack_u_p_e X i P c 1)) (decode_p (pack_u_p_e X i P c 2)) (pack_u_p_e X i P c 3).
rewrite <- pack_u_p_e_0_eq2 X i P c.
rewrite <- pack_u_p_e_3_eq2 X i P c.
apply pack_u_p_e_ext.
- exact pack_u_p_e_1_eq2 X i P c.
- let x. assume Hx.
  rewrite <- pack_u_p_e_2_eq2 X i P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_p_e_i : set -> (set -> (set -> set) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_p (S 2)) (S 3).

Theorem unpack_u_p_e_i_eq : forall Phi:set -> (set -> set) -> (set -> prop) -> set -> set,
  forall X, forall i:set -> set, forall P:set -> prop, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' P' c = Phi X i P c)
  ->
  unpack_u_p_e_i (pack_u_p_e X i P c) Phi = Phi X i P c.
let Phi X i P c.
assume HPhi.
prove Phi (pack_u_p_e X i P c 0) (decode_u (pack_u_p_e X i P c 1)) (decode_p (pack_u_p_e X i P c 2)) (pack_u_p_e X i P c 3) = Phi X i P c.
rewrite <- pack_u_p_e_0_eq2 X i P c.
prove Phi X (decode_u (pack_u_p_e X i P c 1)) (decode_p (pack_u_p_e X i P c 2)) (pack_u_p_e X i P c 3) = Phi X i P c.
rewrite <- pack_u_p_e_3_eq2 X i P c.
apply HPhi.
- exact pack_u_p_e_1_eq2 X i P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_p_e X i P c 2) x.
  rewrite <- pack_u_p_e_2_eq2 X i P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_u_p_e_o : set -> (set -> (set -> set) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_u (S 1)) (decode_p (S 2)) (S 3).

Theorem unpack_u_p_e_o_eq : forall Phi:set -> (set -> set) -> (set -> prop) -> set -> prop,
  forall X, forall i:set -> set, forall P:set -> prop, forall c:set,
  ( forall i':set -> set, (forall x :e X, i x = i' x) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X i' P' c = Phi X i P c)
  ->
  unpack_u_p_e_o (pack_u_p_e X i P c) Phi = Phi X i P c.
let Phi X i P c.
assume HPhi.
prove Phi (pack_u_p_e X i P c 0) (decode_u (pack_u_p_e X i P c 1)) (decode_p (pack_u_p_e X i P c 2)) (pack_u_p_e X i P c 3) = Phi X i P c.
rewrite <- pack_u_p_e_0_eq2 X i P c.
prove Phi X (decode_u (pack_u_p_e X i P c 1)) (decode_p (pack_u_p_e X i P c 2)) (pack_u_p_e X i P c 3) = Phi X i P c.
rewrite <- pack_u_p_e_3_eq2 X i P c.
apply HPhi.
- exact pack_u_p_e_1_eq2 X i P c.
- let x. assume Hx.
  prove P x <-> decode_p (pack_u_p_e X i P c 2) x.
  rewrite <- pack_u_p_e_2_eq2 X i P c x Hx.
  apply iff_refl.
Qed.


Definition pack_r_r_p : set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> set := fun X R T P => (X,encode_r X R,encode_r X T,encode_p X P).

Theorem pack_r_r_p_0_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, S = pack_r_r_p X R T P -> X = S 0.
let S X R T P. assume H1. rewrite H1.
prove X = (X,encode_r X R,encode_r X T,encode_p X P) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_r_r_p_0_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, X = pack_r_r_p X R T P 0.
let X R T P. apply pack_r_r_p_0_eq (pack_r_r_p X R T P) X R T P. reflexivity.
Qed.

Theorem pack_r_r_p_1_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, S = pack_r_r_p X R T P -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R T P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_r X R,encode_r X T,encode_p X P) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_r_p_1_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall x y :e X, R x y = decode_r (pack_r_r_p X R T P 1) x y.
let X R T P. apply pack_r_r_p_1_eq (pack_r_r_p X R T P) X R T P. reflexivity.
Qed.

Theorem pack_r_r_p_2_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, S = pack_r_r_p X R T P -> forall x y :e X, T x y = decode_r (S 2) x y.
let S X R T P. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_r X R,encode_r X T,encode_p X P) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_r_r_p_2_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall x y :e X, T x y = decode_r (pack_r_r_p X R T P 2) x y.
let X R T P. apply pack_r_r_p_2_eq (pack_r_r_p X R T P) X R T P. reflexivity.
Qed.

Theorem pack_r_r_p_3_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, S = pack_r_r_p X R T P -> forall x :e X, P x = decode_p (S 3) x.
let S X R T P. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_r X R,encode_r X T,encode_p X P) 3) x.
rewrite tuple_4_3_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_r_r_p_3_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, forall x :e X, P x = decode_p (pack_r_r_p X R T P 3) x.
let X R T P. apply pack_r_r_p_3_eq (pack_r_r_p X R T P) X R T P. reflexivity.
Qed.

Theorem pack_r_r_p_inj : forall X X', forall R R':set -> set -> prop, forall T T':set -> set -> prop, forall P P':set -> prop, pack_r_r_p X R T P = pack_r_r_p X' R' T' P' -> X = X' /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y) /\ (forall x :e X, P x = P' x).
let X X' R R' T T' P P'. assume H1.
claim L0: X' = pack_r_r_p X R T P 0.
{ exact pack_r_r_p_0_eq (pack_r_r_p X R T P) X' R' T' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_r_p_0_eq2 X R T P. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_r_r_p_1_eq2 X R T P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_p_1_eq2 X' R' T' P' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_r_r_p_2_eq2 X R T P x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_p_2_eq2 X' R' T' P' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_r_r_p_3_eq2 X R T P x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_r_r_p_3_eq2 X' R' T' P' x Lx.
Qed.

Theorem pack_r_r_p_ext : forall X, forall R R':set -> set -> prop, forall T T':set -> set -> prop, forall P P':set -> prop,
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_r_r_p X R T P = pack_r_r_p X R' T' P'.
let X R R' T T' P P'. assume H1. assume H2. assume H3.
prove (X,encode_r X R,encode_r X T,encode_p X P) = (X,encode_r X R',encode_r X T',encode_p X P').
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

Definition struct_r_r_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, q (pack_r_r_p X R T P)) -> q S.

Theorem pack_struct_r_r_p_I: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop, struct_r_r_p (pack_r_r_p X R T P).
let X R T P q. assume Hq.
exact Hq X R T P.
Qed.

Theorem struct_r_r_p_eta: forall S, struct_r_r_p S -> S = pack_r_r_p (S 0) (decode_r (S 1)) (decode_r (S 2)) (decode_p (S 3)).
let S. assume H1. apply H1 (fun z => z = pack_r_r_p (z 0) (decode_r (z 1)) (decode_r (z 2)) (decode_p (z 3))).
let X. let R. let T. let P.
prove pack_r_r_p X R T P = pack_r_r_p (pack_r_r_p X R T P 0) (decode_r (pack_r_r_p X R T P 1)) (decode_r (pack_r_r_p X R T P 2)) (decode_p (pack_r_r_p X R T P 3)).
rewrite <- pack_r_r_p_0_eq2 X R T P.
apply pack_r_r_p_ext.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_p_1_eq2 X R T P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_p_2_eq2 X R T P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_r_r_p_3_eq2 X R T P x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_r_p_i : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)) (decode_p (S 3)).

Theorem unpack_r_r_p_i_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> set,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X R' T' P' = Phi X R T P)
  ->
  unpack_r_r_p_i (pack_r_r_p X R T P) Phi = Phi X R T P.
let Phi X R T P.
assume HPhi.
prove Phi (pack_r_r_p X R T P 0) (decode_r (pack_r_r_p X R T P 1)) (decode_r (pack_r_r_p X R T P 2)) (decode_p (pack_r_r_p X R T P 3)) = Phi X R T P.
rewrite <- pack_r_r_p_0_eq2 X R T P.
prove Phi X (decode_r (pack_r_r_p X R T P 1)) (decode_r (pack_r_r_p X R T P 2)) (decode_p (pack_r_r_p X R T P 3)) = Phi X R T P.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r_p X R T P 1) x y.
  rewrite <- pack_r_r_p_1_eq2 X R T P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r_p X R T P 2) x y.
  rewrite <- pack_r_r_p_2_eq2 X R T P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_r_p X R T P 3) x.
  rewrite <- pack_r_r_p_3_eq2 X R T P x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_r_p_o : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)) (decode_p (S 3)).

Theorem unpack_r_r_p_o_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> (set -> prop) -> prop,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall P:set -> prop,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X R' T' P' = Phi X R T P)
  ->
  unpack_r_r_p_o (pack_r_r_p X R T P) Phi = Phi X R T P.
let Phi X R T P.
assume HPhi.
prove Phi (pack_r_r_p X R T P 0) (decode_r (pack_r_r_p X R T P 1)) (decode_r (pack_r_r_p X R T P 2)) (decode_p (pack_r_r_p X R T P 3)) = Phi X R T P.
rewrite <- pack_r_r_p_0_eq2 X R T P.
prove Phi X (decode_r (pack_r_r_p X R T P 1)) (decode_r (pack_r_r_p X R T P 2)) (decode_p (pack_r_r_p X R T P 3)) = Phi X R T P.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r_p X R T P 1) x y.
  rewrite <- pack_r_r_p_1_eq2 X R T P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r_p X R T P 2) x y.
  rewrite <- pack_r_r_p_2_eq2 X R T P x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_r_p X R T P 3) x.
  rewrite <- pack_r_r_p_3_eq2 X R T P x Hx.
  apply iff_refl.
Qed.


Definition pack_r_r_e : set -> (set -> set -> prop) -> (set -> set -> prop) -> set -> set := fun X R T c => (X,encode_r X R,encode_r X T,c).

Theorem pack_r_r_e_0_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, S = pack_r_r_e X R T c -> X = S 0.
let S X R T c. assume H1. rewrite H1.
prove X = (X,encode_r X R,encode_r X T,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_r_r_e_0_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, X = pack_r_r_e X R T c 0.
let X R T c. apply pack_r_r_e_0_eq (pack_r_r_e X R T c) X R T c. reflexivity.
Qed.

Theorem pack_r_r_e_1_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, S = pack_r_r_e X R T c -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R T c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_r X R,encode_r X T,c) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_r_e_1_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_r_r_e X R T c 1) x y.
let X R T c. apply pack_r_r_e_1_eq (pack_r_r_e X R T c) X R T c. reflexivity.
Qed.

Theorem pack_r_r_e_2_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, S = pack_r_r_e X R T c -> forall x y :e X, T x y = decode_r (S 2) x y.
let S X R T c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove T x y = decode_r ((X,encode_r X R,encode_r X T,c) 2) x y.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_r X T x Hx y Hy.
Qed.

Theorem pack_r_r_e_2_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, forall x y :e X, T x y = decode_r (pack_r_r_e X R T c 2) x y.
let X R T c. apply pack_r_r_e_2_eq (pack_r_r_e X R T c) X R T c. reflexivity.
Qed.

Theorem pack_r_r_e_3_eq: forall S X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, S = pack_r_r_e X R T c -> c = S 3.
let S X R T c. assume H1.
rewrite H1. prove c = (X,encode_r X R,encode_r X T,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_r_r_e_3_eq2: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, c = pack_r_r_e X R T c 3.
let X R T c. apply pack_r_r_e_3_eq (pack_r_r_e X R T c) X R T c. reflexivity.
Qed.

Theorem pack_r_r_e_inj : forall X X', forall R R':set -> set -> prop, forall T T':set -> set -> prop, forall c c':set, pack_r_r_e X R T c = pack_r_r_e X' R' T' c' -> X = X' /\ (forall x y :e X, R x y = R' x y) /\ (forall x y :e X, T x y = T' x y) /\ c = c'.
let X X' R R' T T' c c'. assume H1.
claim L0: X' = pack_r_r_e X R T c 0.
{ exact pack_r_r_e_0_eq (pack_r_r_e X R T c) X' R' T' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_r_e_0_eq2 X R T c. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_r_r_e_1_eq2 X R T c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_e_1_eq2 X' R' T' c' x Lx y Ly.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove T x y = T' x y.
  rewrite pack_r_r_e_2_eq2 X R T c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_r_e_2_eq2 X' R' T' c' x Lx y Ly.
- prove c = c'.
  rewrite pack_r_r_e_3_eq2 X R T c.
  rewrite H1. symmetry.
  exact pack_r_r_e_3_eq2 X' R' T' c'.
Qed.

Theorem pack_r_r_e_ext : forall X, forall R R':set -> set -> prop, forall T T':set -> set -> prop, forall c,
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x y :e X, T x y <-> T' x y) ->
 pack_r_r_e X R T c = pack_r_r_e X R' T' c.
let X R R' T T' c. assume H1. assume H2.
prove (X,encode_r X R,encode_r X T,c) = (X,encode_r X R',encode_r X T',c).
claim L1: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H1. }
rewrite <- L1.
claim L2: encode_r X T = encode_r X T'.
{ apply encode_r_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_r_r_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, c :e X -> q (pack_r_r_e X R T c)) -> q S.

Theorem pack_struct_r_r_e_I: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, c :e X -> struct_r_r_e (pack_r_r_e X R T c).
let X R T c. assume Hc. let q. assume Hq.
exact Hq X R T c Hc.
Qed.

Theorem pack_struct_r_r_e_E3: forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set, struct_r_r_e (pack_r_r_e X R T c) -> c :e X.
let X R T c. assume H1. apply H1 (fun z => z = pack_r_r_e X R T c -> c :e X).
- let X'. let R'. let T'. let c'. assume Hc'.
  assume Heq: pack_r_r_e X' R' T' c' = pack_r_r_e X R T c.
  apply pack_r_r_e_inj X' X R' R T' T c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HR'R HT'T Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_r_r_e_eta: forall S, struct_r_r_e S -> S = pack_r_r_e (S 0) (decode_r (S 1)) (decode_r (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_r_r_e (z 0) (decode_r (z 1)) (decode_r (z 2)) (z 3)).
let X. let R. let T. let c. assume _.
prove pack_r_r_e X R T c = pack_r_r_e (pack_r_r_e X R T c 0) (decode_r (pack_r_r_e X R T c 1)) (decode_r (pack_r_r_e X R T c 2)) (pack_r_r_e X R T c 3).
rewrite <- pack_r_r_e_0_eq2 X R T c.
rewrite <- pack_r_r_e_3_eq2 X R T c.
apply pack_r_r_e_ext.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_e_1_eq2 X R T c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_r_e_2_eq2 X R T c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_r_r_e_i : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)) (S 3).

Theorem unpack_r_r_e_i_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> set -> set,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X R' T' c = Phi X R T c)
  ->
  unpack_r_r_e_i (pack_r_r_e X R T c) Phi = Phi X R T c.
let Phi X R T c.
assume HPhi.
prove Phi (pack_r_r_e X R T c 0) (decode_r (pack_r_r_e X R T c 1)) (decode_r (pack_r_r_e X R T c 2)) (pack_r_r_e X R T c 3) = Phi X R T c.
rewrite <- pack_r_r_e_0_eq2 X R T c.
prove Phi X (decode_r (pack_r_r_e X R T c 1)) (decode_r (pack_r_r_e X R T c 2)) (pack_r_r_e X R T c 3) = Phi X R T c.
rewrite <- pack_r_r_e_3_eq2 X R T c.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r_e X R T c 1) x y.
  rewrite <- pack_r_r_e_1_eq2 X R T c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r_e X R T c 2) x y.
  rewrite <- pack_r_r_e_2_eq2 X R T c x Hx y Hy.
  apply iff_refl.
Qed.


Definition unpack_r_r_e_o : set -> (set -> (set -> set -> prop) -> (set -> set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_r (S 2)) (S 3).

Theorem unpack_r_r_e_o_eq : forall Phi:set -> (set -> set -> prop) -> (set -> set -> prop) -> set -> prop,
  forall X, forall R:set -> set -> prop, forall T:set -> set -> prop, forall c:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall T':set -> set -> prop, (forall x y :e X, T x y <-> T' x y) -> Phi X R' T' c = Phi X R T c)
  ->
  unpack_r_r_e_o (pack_r_r_e X R T c) Phi = Phi X R T c.
let Phi X R T c.
assume HPhi.
prove Phi (pack_r_r_e X R T c 0) (decode_r (pack_r_r_e X R T c 1)) (decode_r (pack_r_r_e X R T c 2)) (pack_r_r_e X R T c 3) = Phi X R T c.
rewrite <- pack_r_r_e_0_eq2 X R T c.
prove Phi X (decode_r (pack_r_r_e X R T c 1)) (decode_r (pack_r_r_e X R T c 2)) (pack_r_r_e X R T c 3) = Phi X R T c.
rewrite <- pack_r_r_e_3_eq2 X R T c.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_r_e X R T c 1) x y.
  rewrite <- pack_r_r_e_1_eq2 X R T c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx. let y. assume Hy.
  prove T x y <-> decode_r (pack_r_r_e X R T c 2) x y.
  rewrite <- pack_r_r_e_2_eq2 X R T c x Hx y Hy.
  apply iff_refl.
Qed.


Definition pack_r_p_e : set -> (set -> set -> prop) -> (set -> prop) -> set -> set := fun X R P c => (X,encode_r X R,encode_p X P,c).

Theorem pack_r_p_e_0_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_r_p_e X R P c -> X = S 0.
let S X R P c. assume H1. rewrite H1.
prove X = (X,encode_r X R,encode_p X P,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_r_p_e_0_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, X = pack_r_p_e X R P c 0.
let X R P c. apply pack_r_p_e_0_eq (pack_r_p_e X R P c) X R P c. reflexivity.
Qed.

Theorem pack_r_p_e_1_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_r_p_e X R P c -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R P c. assume H1.
let x. assume Hx. let y. assume Hy. rewrite H1.
prove R x y = decode_r ((X,encode_r X R,encode_p X P,c) 1) x y.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_p_e_1_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall x y :e X, R x y = decode_r (pack_r_p_e X R P c 1) x y.
let X R P c. apply pack_r_p_e_1_eq (pack_r_p_e X R P c) X R P c. reflexivity.
Qed.

Theorem pack_r_p_e_2_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_r_p_e X R P c -> forall x :e X, P x = decode_p (S 2) x.
let S X R P c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_r X R,encode_p X P,c) 2) x.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_r_p_e_2_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_r_p_e X R P c 2) x.
let X R P c. apply pack_r_p_e_2_eq (pack_r_p_e X R P c) X R P c. reflexivity.
Qed.

Theorem pack_r_p_e_3_eq: forall S X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, S = pack_r_p_e X R P c -> c = S 3.
let S X R P c. assume H1.
rewrite H1. prove c = (X,encode_r X R,encode_p X P,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_r_p_e_3_eq2: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c = pack_r_p_e X R P c 3.
let X R P c. apply pack_r_p_e_3_eq (pack_r_p_e X R P c) X R P c. reflexivity.
Qed.

Theorem pack_r_p_e_inj : forall X X', forall R R':set -> set -> prop, forall P P':set -> prop, forall c c':set, pack_r_p_e X R P c = pack_r_p_e X' R' P' c' -> X = X' /\ (forall x y :e X, R x y = R' x y) /\ (forall x :e X, P x = P' x) /\ c = c'.
let X X' R R' P P' c c'. assume H1.
claim L0: X' = pack_r_p_e X R P c 0.
{ exact pack_r_p_e_0_eq (pack_r_p_e X R P c) X' R' P' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_p_e_0_eq2 X R P c. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove R x y = R' x y.
  rewrite pack_r_p_e_1_eq2 X R P c x Hx y Hy.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite H1. symmetry.
  exact pack_r_p_e_1_eq2 X' R' P' c' x Lx y Ly.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_r_p_e_2_eq2 X R P c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_r_p_e_2_eq2 X' R' P' c' x Lx.
- prove c = c'.
  rewrite pack_r_p_e_3_eq2 X R P c.
  rewrite H1. symmetry.
  exact pack_r_p_e_3_eq2 X' R' P' c'.
Qed.

Theorem pack_r_p_e_ext : forall X, forall R R':set -> set -> prop, forall P P':set -> prop, forall c,
 (forall x y :e X, R x y <-> R' x y) ->
 (forall x :e X, P x <-> P' x) ->
 pack_r_p_e X R P c = pack_r_p_e X R' P' c.
let X R R' P P' c. assume H1. assume H2.
prove (X,encode_r X R,encode_p X P,c) = (X,encode_r X R',encode_p X P',c).
claim L1: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_r_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> q (pack_r_p_e X R P c)) -> q S.

Theorem pack_struct_r_p_e_I: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, c :e X -> struct_r_p_e (pack_r_p_e X R P c).
let X R P c. assume Hc. let q. assume Hq.
exact Hq X R P c Hc.
Qed.

Theorem pack_struct_r_p_e_E3: forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set, struct_r_p_e (pack_r_p_e X R P c) -> c :e X.
let X R P c. assume H1. apply H1 (fun z => z = pack_r_p_e X R P c -> c :e X).
- let X'. let R'. let P'. let c'. assume Hc'.
  assume Heq: pack_r_p_e X' R' P' c' = pack_r_p_e X R P c.
  apply pack_r_p_e_inj X' X R' R P' P c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HR'R HP'P Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_r_p_e_eta: forall S, struct_r_p_e S -> S = pack_r_p_e (S 0) (decode_r (S 1)) (decode_p (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_r_p_e (z 0) (decode_r (z 1)) (decode_p (z 2)) (z 3)).
let X. let R. let P. let c. assume _.
prove pack_r_p_e X R P c = pack_r_p_e (pack_r_p_e X R P c 0) (decode_r (pack_r_p_e X R P c 1)) (decode_p (pack_r_p_e X R P c 2)) (pack_r_p_e X R P c 3).
rewrite <- pack_r_p_e_0_eq2 X R P c.
rewrite <- pack_r_p_e_3_eq2 X R P c.
apply pack_r_p_e_ext.
- let x. assume Hx. let y. assume Hy.
  rewrite <- pack_r_p_e_1_eq2 X R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_r_p_e_2_eq2 X R P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_p_e_i : set -> (set -> (set -> set -> prop) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_p (S 2)) (S 3).

Theorem unpack_r_p_e_i_eq : forall Phi:set -> (set -> set -> prop) -> (set -> prop) -> set -> set,
  forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X R' P' c = Phi X R P c)
  ->
  unpack_r_p_e_i (pack_r_p_e X R P c) Phi = Phi X R P c.
let Phi X R P c.
assume HPhi.
prove Phi (pack_r_p_e X R P c 0) (decode_r (pack_r_p_e X R P c 1)) (decode_p (pack_r_p_e X R P c 2)) (pack_r_p_e X R P c 3) = Phi X R P c.
rewrite <- pack_r_p_e_0_eq2 X R P c.
prove Phi X (decode_r (pack_r_p_e X R P c 1)) (decode_p (pack_r_p_e X R P c 2)) (pack_r_p_e X R P c 3) = Phi X R P c.
rewrite <- pack_r_p_e_3_eq2 X R P c.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_p_e X R P c 1) x y.
  rewrite <- pack_r_p_e_1_eq2 X R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_p_e X R P c 2) x.
  rewrite <- pack_r_p_e_2_eq2 X R P c x Hx.
  apply iff_refl.
Qed.


Definition unpack_r_p_e_o : set -> (set -> (set -> set -> prop) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)) (decode_p (S 2)) (S 3).

Theorem unpack_r_p_e_o_eq : forall Phi:set -> (set -> set -> prop) -> (set -> prop) -> set -> prop,
  forall X, forall R:set -> set -> prop, forall P:set -> prop, forall c:set,
  ( forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) ->  forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X R' P' c = Phi X R P c)
  ->
  unpack_r_p_e_o (pack_r_p_e X R P c) Phi = Phi X R P c.
let Phi X R P c.
assume HPhi.
prove Phi (pack_r_p_e X R P c 0) (decode_r (pack_r_p_e X R P c 1)) (decode_p (pack_r_p_e X R P c 2)) (pack_r_p_e X R P c 3) = Phi X R P c.
rewrite <- pack_r_p_e_0_eq2 X R P c.
prove Phi X (decode_r (pack_r_p_e X R P c 1)) (decode_p (pack_r_p_e X R P c 2)) (pack_r_p_e X R P c 3) = Phi X R P c.
rewrite <- pack_r_p_e_3_eq2 X R P c.
apply HPhi.
- let x. assume Hx. let y. assume Hy.
  prove R x y <-> decode_r (pack_r_p_e X R P c 1) x y.
  rewrite <- pack_r_p_e_1_eq2 X R P c x Hx y Hy.
  apply iff_refl.
- let x. assume Hx.
  prove P x <-> decode_p (pack_r_p_e X R P c 2) x.
  rewrite <- pack_r_p_e_2_eq2 X R P c x Hx.
  apply iff_refl.
Qed.


Definition pack_p_p_e : set -> (set -> prop) -> (set -> prop) -> set -> set := fun X P Q c => (X,encode_p X P,encode_p X Q,c).

Theorem pack_p_p_e_0_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, forall c:set, S = pack_p_p_e X P Q c -> X = S 0.
let S X P Q c. assume H1. rewrite H1.
prove X = (X,encode_p X P,encode_p X Q,c) 0.
symmetry. apply tuple_4_0_eq.
Qed.

Theorem pack_p_p_e_0_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, X = pack_p_p_e X P Q c 0.
let X P Q c. apply pack_p_p_e_0_eq (pack_p_p_e X P Q c) X P Q c. reflexivity.
Qed.

Theorem pack_p_p_e_1_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, forall c:set, S = pack_p_p_e X P Q c -> forall x :e X, P x = decode_p (S 1) x.
let S X P Q c. assume H1.
let x. assume Hx. rewrite H1.
prove P x = decode_p ((X,encode_p X P,encode_p X Q,c) 1) x.
rewrite tuple_4_1_eq.
symmetry. exact decode_encode_p X P x Hx.
Qed.

Theorem pack_p_p_e_1_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall x :e X, P x = decode_p (pack_p_p_e X P Q c 1) x.
let X P Q c. apply pack_p_p_e_1_eq (pack_p_p_e X P Q c) X P Q c. reflexivity.
Qed.

Theorem pack_p_p_e_2_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, forall c:set, S = pack_p_p_e X P Q c -> forall x :e X, Q x = decode_p (S 2) x.
let S X P Q c. assume H1.
let x. assume Hx. rewrite H1.
prove Q x = decode_p ((X,encode_p X P,encode_p X Q,c) 2) x.
rewrite tuple_4_2_eq.
symmetry. exact decode_encode_p X Q x Hx.
Qed.

Theorem pack_p_p_e_2_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, forall x :e X, Q x = decode_p (pack_p_p_e X P Q c 2) x.
let X P Q c. apply pack_p_p_e_2_eq (pack_p_p_e X P Q c) X P Q c. reflexivity.
Qed.

Theorem pack_p_p_e_3_eq: forall S X, forall P:set -> prop, forall Q:set -> prop, forall c:set, S = pack_p_p_e X P Q c -> c = S 3.
let S X P Q c. assume H1.
rewrite H1. prove c = (X,encode_p X P,encode_p X Q,c) 3. symmetry. apply tuple_4_3_eq.
Qed.

Theorem pack_p_p_e_3_eq2: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, c = pack_p_p_e X P Q c 3.
let X P Q c. apply pack_p_p_e_3_eq (pack_p_p_e X P Q c) X P Q c. reflexivity.
Qed.

Theorem pack_p_p_e_inj : forall X X', forall P P':set -> prop, forall Q Q':set -> prop, forall c c':set, pack_p_p_e X P Q c = pack_p_p_e X' P' Q' c' -> X = X' /\ (forall x :e X, P x = P' x) /\ (forall x :e X, Q x = Q' x) /\ c = c'.
let X X' P P' Q Q' c c'. assume H1.
claim L0: X' = pack_p_p_e X P Q c 0.
{ exact pack_p_p_e_0_eq (pack_p_p_e X P Q c) X' P' Q' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_p_p_e_0_eq2 X P Q c. }
apply and4I.
- exact L1.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  rewrite pack_p_p_e_1_eq2 X P Q c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_p_p_e_1_eq2 X' P' Q' c' x Lx.
- let x. assume Hx: x :e X.
  prove Q x = Q' x.
  rewrite pack_p_p_e_2_eq2 X P Q c x Hx.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite H1. symmetry.
  exact pack_p_p_e_2_eq2 X' P' Q' c' x Lx.
- prove c = c'.
  rewrite pack_p_p_e_3_eq2 X P Q c.
  rewrite H1. symmetry.
  exact pack_p_p_e_3_eq2 X' P' Q' c'.
Qed.

Theorem pack_p_p_e_ext : forall X, forall P P':set -> prop, forall Q Q':set -> prop, forall c,
 (forall x :e X, P x <-> P' x) ->
 (forall x :e X, Q x <-> Q' x) ->
 pack_p_p_e X P Q c = pack_p_p_e X P' Q' c.
let X P P' Q Q' c. assume H1. assume H2.
prove (X,encode_p X P,encode_p X Q,c) = (X,encode_p X P',encode_p X Q',c).
claim L1: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H1. }
rewrite <- L1.
claim L2: encode_p X Q = encode_p X Q'.
{ apply encode_p_ext. exact H2. }
rewrite <- L2.
reflexivity.
Qed.

Definition struct_p_p_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall P:set -> prop, forall Q:set -> prop, forall c:set, c :e X -> q (pack_p_p_e X P Q c)) -> q S.

Theorem pack_struct_p_p_e_I: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, c :e X -> struct_p_p_e (pack_p_p_e X P Q c).
let X P Q c. assume Hc. let q. assume Hq.
exact Hq X P Q c Hc.
Qed.

Theorem pack_struct_p_p_e_E3: forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set, struct_p_p_e (pack_p_p_e X P Q c) -> c :e X.
let X P Q c. assume H1. apply H1 (fun z => z = pack_p_p_e X P Q c -> c :e X).
- let X'. let P'. let Q'. let c'. assume Hc'.
  assume Heq: pack_p_p_e X' P' Q' c' = pack_p_p_e X P Q c.
  apply pack_p_p_e_inj X' X P' P Q' Q c' c Heq.
  assume H. apply H.
  assume H. apply H.
  assume HX'X HP'P HQ'Q Hc'c.
  rewrite <- HX'X.  rewrite <- Hc'c.  exact Hc'.
- reflexivity.
Qed.

Theorem struct_p_p_e_eta: forall S, struct_p_p_e S -> S = pack_p_p_e (S 0) (decode_p (S 1)) (decode_p (S 2)) (S 3).
let S. assume H1. apply H1 (fun z => z = pack_p_p_e (z 0) (decode_p (z 1)) (decode_p (z 2)) (z 3)).
let X. let P. let Q. let c. assume _.
prove pack_p_p_e X P Q c = pack_p_p_e (pack_p_p_e X P Q c 0) (decode_p (pack_p_p_e X P Q c 1)) (decode_p (pack_p_p_e X P Q c 2)) (pack_p_p_e X P Q c 3).
rewrite <- pack_p_p_e_0_eq2 X P Q c.
rewrite <- pack_p_p_e_3_eq2 X P Q c.
apply pack_p_p_e_ext.
- let x. assume Hx.
  rewrite <- pack_p_p_e_1_eq2 X P Q c x Hx.
  apply iff_refl.
- let x. assume Hx.
  rewrite <- pack_p_p_e_2_eq2 X P Q c x Hx.
  apply iff_refl.
Qed.


Definition unpack_p_p_e_i : set -> (set -> (set -> prop) -> (set -> prop) -> set -> set) -> set := fun S Phi => Phi (S 0) (decode_p (S 1)) (decode_p (S 2)) (S 3).

Theorem unpack_p_p_e_i_eq : forall Phi:set -> (set -> prop) -> (set -> prop) -> set -> set,
  forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set,
  ( forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X P' Q' c = Phi X P Q c)
  ->
  unpack_p_p_e_i (pack_p_p_e X P Q c) Phi = Phi X P Q c.
let Phi X P Q c.
assume HPhi.
prove Phi (pack_p_p_e X P Q c 0) (decode_p (pack_p_p_e X P Q c 1)) (decode_p (pack_p_p_e X P Q c 2)) (pack_p_p_e X P Q c 3) = Phi X P Q c.
rewrite <- pack_p_p_e_0_eq2 X P Q c.
prove Phi X (decode_p (pack_p_p_e X P Q c 1)) (decode_p (pack_p_p_e X P Q c 2)) (pack_p_p_e X P Q c 3) = Phi X P Q c.
rewrite <- pack_p_p_e_3_eq2 X P Q c.
apply HPhi.
- let x. assume Hx.
  prove P x <-> decode_p (pack_p_p_e X P Q c 1) x.
  rewrite <- pack_p_p_e_1_eq2 X P Q c x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_p_p_e X P Q c 2) x.
  rewrite <- pack_p_p_e_2_eq2 X P Q c x Hx.
  apply iff_refl.
Qed.


Definition unpack_p_p_e_o : set -> (set -> (set -> prop) -> (set -> prop) -> set -> prop) -> prop := fun S Phi => Phi (S 0) (decode_p (S 1)) (decode_p (S 2)) (S 3).

Theorem unpack_p_p_e_o_eq : forall Phi:set -> (set -> prop) -> (set -> prop) -> set -> prop,
  forall X, forall P:set -> prop, forall Q:set -> prop, forall c:set,
  ( forall P':set -> prop, (forall x :e X, P x <-> P' x) ->  forall Q':set -> prop, (forall x :e X, Q x <-> Q' x) -> Phi X P' Q' c = Phi X P Q c)
  ->
  unpack_p_p_e_o (pack_p_p_e X P Q c) Phi = Phi X P Q c.
let Phi X P Q c.
assume HPhi.
prove Phi (pack_p_p_e X P Q c 0) (decode_p (pack_p_p_e X P Q c 1)) (decode_p (pack_p_p_e X P Q c 2)) (pack_p_p_e X P Q c 3) = Phi X P Q c.
rewrite <- pack_p_p_e_0_eq2 X P Q c.
prove Phi X (decode_p (pack_p_p_e X P Q c 1)) (decode_p (pack_p_p_e X P Q c 2)) (pack_p_p_e X P Q c 3) = Phi X P Q c.
rewrite <- pack_p_p_e_3_eq2 X P Q c.
apply HPhi.
- let x. assume Hx.
  prove P x <-> decode_p (pack_p_p_e X P Q c 1) x.
  rewrite <- pack_p_p_e_1_eq2 X P Q c x Hx.
  apply iff_refl.
- let x. assume Hx.
  prove Q x <-> decode_p (pack_p_p_e X P Q c 2) x.
  rewrite <- pack_p_p_e_2_eq2 X P Q c x Hx.
  apply iff_refl.
Qed.

