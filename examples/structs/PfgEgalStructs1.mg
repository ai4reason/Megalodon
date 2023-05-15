Definition pack_e : set -> set -> set := fun X c => (X,c).

Theorem pack_e_0_eq : forall S X, forall c:set, S = pack_e X c -> X = S 0.
let S X c.
assume H1: S = (X,c).
prove X = S 0.
rewrite H1.
symmetry.
apply tuple_2_0_eq.
Qed.

Theorem pack_e_0_eq2 : forall X, forall c:set, X = pack_e X c 0.
let X c. apply pack_e_0_eq (pack_e X c) X c. reflexivity.
Qed.

Theorem pack_e_1_eq : forall S X, forall c:set, S = pack_e X c -> c = S 1.
let S X c.
assume H1: S = (X,c).
prove c = S 1.
rewrite H1.
symmetry.
apply tuple_2_1_eq.
Qed.

Theorem pack_e_1_eq2 : forall X, forall c:set, c = pack_e X c 1.
let X c. apply pack_e_1_eq (pack_e X c) X c. reflexivity.
Qed.

Theorem pack_e_inj: forall X X', forall c c', pack_e X c = pack_e X' c' -> X = X' /\ c = c'.
let X X' c c'. assume H1.
claim L0: X' = pack_e X c 0.
{ exact pack_e_0_eq (pack_e X c) X' c' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_e_0_eq2 X c. }
apply andI.
- exact L1.
- prove c = c'.
  rewrite pack_e_1_eq2 X c.
  prove pack_e X c 1 = c'.
  rewrite H1.
  prove pack_e X' c' 1 = c'.
  symmetry.
  exact pack_e_1_eq2 X' c'.
Qed.

Definition struct_e : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall c:set, c :e X -> q (pack_e X c)) -> q S.

Theorem pack_struct_e_I: forall X, forall c:set, c :e X -> struct_e (pack_e X c).
let X c. assume Hc.
prove struct_e (pack_e X c).
let q. assume Hq.
exact Hq X c Hc.
Qed.

Theorem pack_struct_e_E1: forall X, forall c:set, struct_e (pack_e X c) -> c :e X.
let X c. assume H1. apply H1 (fun z => z = pack_e X c -> c :e X).
- let X' c'. assume Hc'.
  assume Heq: pack_e X' c' = pack_e X c.
  prove c :e X.
  apply pack_e_inj X' X c' c Heq.
  assume HX'X.
  assume Hc'c.
  rewrite <- HX'X.
  rewrite <- Hc'c.
  exact Hc'.
- reflexivity.
Qed.

Theorem struct_e_eta: forall S, struct_e S -> S = pack_e (S 0) (S 1).
let S. assume H1. apply H1 (fun z => z = pack_e (z 0) (z 1)).
let X c. assume Hc.
prove pack_e X c = pack_e (pack_e X c 0) (pack_e X c 1).
rewrite <- pack_e_0_eq2 X c.
rewrite <- pack_e_1_eq2 X c.
reflexivity.
Qed.

Definition unpack_e_i : set -> (set -> set -> set) -> set := fun S c => c (S 0) (S 1).

Theorem unpack_e_i_eq : forall Phi:set -> set -> set,
  forall X, forall c:set, unpack_e_i (pack_e X c) Phi = Phi X c.
let Phi.
let X c.
prove unpack_e_i (pack_e X c) Phi = Phi X c.
prove Phi (pack_e X c 0) (pack_e X c 1) = Phi X c.
rewrite <- pack_e_0_eq2 X c.
prove Phi X (pack_e X c 1) = Phi X c.
rewrite <- pack_e_1_eq2 X c.
prove Phi X c = Phi X c.
reflexivity.
Qed.

Definition unpack_e_o : set -> (set -> set -> prop) -> prop := fun S c => c (S 0) (S 1).

Theorem unpack_e_o_eq : forall Phi:set -> set -> prop,
  forall X, forall c:set, unpack_e_o (pack_e X c) Phi = Phi X c.
let Phi.
let X c.
prove unpack_e_o (pack_e X c) Phi = Phi X c.
prove Phi (pack_e X c 0) (pack_e X c 1) = Phi X c.
rewrite <- pack_e_0_eq2 X c.
prove Phi X (pack_e X c 1) = Phi X c.
rewrite <- pack_e_1_eq2 X c.
prove Phi X c = Phi X c.
reflexivity.
Qed.

Definition pack_u : set -> (set -> set) -> set := fun X F => (X,encode_u X F).

Theorem pack_u_0_eq : forall S X, forall F:set -> set, S = pack_u X F -> X = S 0.
let S X F.
assume H1: S = (X,encode_u X F).
prove X = S 0.
rewrite H1.
symmetry.
apply tuple_2_0_eq.
Qed.

Theorem pack_u_0_eq2 : forall X, forall F:set -> set, X = pack_u X F 0.
let X F. apply pack_u_0_eq (pack_u X F) X F. reflexivity.
Qed.

Theorem pack_u_1_eq : forall S X, forall F:set -> set, S = pack_u X F -> forall x :e X, F x = decode_u (S 1) x.
let S X F.
assume H1: S = (X,encode_u X F).
let x. assume Hx: x :e X.
prove F x = decode_u (S 1) x.
rewrite H1.
prove F x = decode_u ((X,encode_u X F) 1) x.
rewrite tuple_2_1_eq.
symmetry.
apply decode_encode_u.
exact Hx.
Qed.

Theorem pack_u_1_eq2 : forall X, forall F:set -> set, forall x :e X, F x = decode_u (pack_u X F 1) x.
let X F. apply pack_u_1_eq (pack_u X F) X F. reflexivity.
Qed.

Theorem pack_u_inj: forall X X', forall F F':set -> set, pack_u X F = pack_u X' F' -> X = X' /\ forall x :e X, F x = F' x.
let X X' F F'. assume H1.
claim L0: X' = pack_u X F 0.
{ exact pack_u_0_eq (pack_u X F) X' F' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_u_0_eq2 X F. }
apply andI.
- exact L1.
- let x. assume Hx: x :e X.
  prove F x = F' x.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite pack_u_1_eq2 X F x Hx.
  prove decode_u (pack_u X F 1) x = F' x.
  rewrite H1.
  prove decode_u (pack_u X' F' 1) x = F' x.
  symmetry.
  exact pack_u_1_eq2 X' F' x Lx.
Qed.

Theorem pack_u_ext : forall X, forall F F':set -> set,
     (forall x :e X, F x = F' x)
  -> pack_u X F = pack_u X F'.
let X F F'. assume H1.
claim L1: encode_u X F = encode_u X F'.
{ apply encode_u_ext. exact H1. }
prove (X,encode_u X F) = (X,encode_u X F').
rewrite <- L1.
reflexivity.
Qed.

Definition struct_u : set -> prop := fun S => forall q:set -> prop, (forall X, forall F:set -> set, (forall x :e X, F x :e X) -> q (pack_u X F)) -> q S.

Theorem pack_struct_u_I: forall X, forall F:set -> set, (forall x :e X, F x :e X) -> struct_u (pack_u X F).
let X F.
assume HF.
let q. assume Hq.
exact Hq X F HF.
Qed.

Theorem pack_struct_u_E1: forall X, forall F:set -> set, struct_u (pack_u X F) -> forall x :e X, F x :e X.
let X F. assume H1. apply H1 (fun z => z = pack_u X F -> forall x :e X, F x :e X).
- let X' F'. assume HF'.
  assume Heq: pack_u X' F' = pack_u X F.
  prove forall x :e X, F x :e X.
  apply pack_u_inj X' X F' F Heq.
  assume HX'X.
  assume HF'F.
  rewrite <- HX'X.
  let x. assume Hx: x :e X'.
  rewrite <- HF'F x Hx.
  exact HF' x Hx.
- reflexivity.
Qed.

Theorem struct_u_eta: forall S, struct_u S -> S = pack_u (S 0) (decode_u (S 1)).
let S. assume H1. apply H1 (fun z => z = pack_u (z 0) (decode_u (z 1))).
let X F. assume _.
prove pack_u X F = pack_u (pack_u X F 0) (decode_u (pack_u X F 1)).
rewrite <- pack_u_0_eq2 X F.
prove pack_u X F = pack_u X (decode_u (pack_u X F 1)).
apply pack_u_ext.
exact pack_u_1_eq2 X F.
Qed.

Definition unpack_u_i : set -> (set -> (set -> set) -> set) -> set := fun S F => F (S 0) (decode_u (S 1)).

Theorem unpack_u_i_eq : forall Phi:set -> (set -> set) -> set,
  forall X, forall F:set -> set,
  (forall F':set -> set, (forall x :e X, F x = F' x) -> Phi X F' = Phi X F)
  ->
  unpack_u_i (pack_u X F) Phi = Phi X F.
let Phi X F.
assume HPhi.
prove unpack_u_i (pack_u X F) Phi = Phi X F.
prove Phi (pack_u X F 0) (decode_u (pack_u X F 1)) = Phi X F.
rewrite <- pack_u_0_eq2 X F.
prove Phi X (decode_u (pack_u X F 1)) = Phi X F.
apply HPhi.
let x. assume Hx.
prove F x = decode_u (pack_u X F 1) x.
exact pack_u_1_eq2 X F x Hx.
Qed.

Definition unpack_u_o : set -> (set -> (set -> set) -> prop) -> prop := fun S F => F (S 0) (decode_u (S 1)).

Theorem unpack_u_o_eq : forall Phi:set -> (set -> set) -> prop,
  forall X, forall F:set -> set,
  (forall F':set -> set, (forall x :e X, F x = F' x) -> Phi X F' = Phi X F)
  ->
  unpack_u_o (pack_u X F) Phi = Phi X F.
let Phi X F.
assume HPhi.
prove unpack_u_o (pack_u X F) Phi = Phi X F.
prove Phi (pack_u X F 0) (decode_u (pack_u X F 1)) = Phi X F.
rewrite <- pack_u_0_eq2 X F.
prove Phi X (decode_u (pack_u X F 1)) = Phi X F.
apply HPhi.
let x. assume Hx.
prove F x = decode_u (pack_u X F 1) x.
exact pack_u_1_eq2 X F x Hx.
Qed.

Definition pack_b : set -> (set -> set -> set) -> set := fun X F => (X,encode_b X F).

Theorem pack_b_0_eq : forall S X, forall F:set -> set -> set, S = pack_b X F -> X = S 0.
let S X F.
assume H1: S = (X,encode_b X F).
prove X = S 0.
rewrite H1.
symmetry.
apply tuple_2_0_eq.
Qed.

Theorem pack_b_0_eq2 : forall X, forall F:set -> set -> set, X = pack_b X F 0.
let X F. apply pack_b_0_eq (pack_b X F) X F. reflexivity.
Qed.

Theorem pack_b_1_eq : forall S X, forall F:set -> set -> set, S = pack_b X F -> forall x y :e X, F x y = decode_b (S 1) x y.
let S X F.
assume H1: S = (X,encode_b X F).
let x. assume Hx: x :e X.
let y. assume Hy: y :e X.
prove F x y = decode_b (S 1) x y.
rewrite H1.
prove F x y = decode_b ((X,encode_b X F) 1) x y.
rewrite tuple_2_1_eq.
symmetry. apply decode_encode_b.
- exact Hx.
- exact Hy.
Qed.

Theorem pack_b_1_eq2 : forall X, forall F:set -> set -> set, forall x y :e X, F x y = decode_b (pack_b X F 1) x y.
let X F. apply pack_b_1_eq (pack_b X F) X F. reflexivity.
Qed.

Theorem pack_b_inj: forall X X', forall F F':set -> set -> set, pack_b X F = pack_b X' F' -> X = X' /\ forall x y :e X, F x y = F' x y.
let X X' F F'. assume H1.
claim L0: X' = pack_b X F 0.
{ exact pack_b_0_eq (pack_b X F) X' F' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_b_0_eq2 X F. }
apply andI.
- exact L1.
- let x. assume Hx: x :e X. let y. assume Hy: y :e X.
  prove F x y = F' x y.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite pack_b_1_eq2 X F x Hx y Hy.
  prove decode_b (pack_b X F 1) x y = F' x y.
  rewrite H1.
  prove decode_b (pack_b X' F' 1) x y = F' x y.
  symmetry.
  exact pack_b_1_eq2 X' F' x Lx y Ly.
Qed.

Theorem pack_b_ext : forall X, forall F F':set -> set -> set,
     (forall x y :e X, F x y = F' x y)
  -> pack_b X F = pack_b X F'.
let X F F'. assume H1.
claim L1: encode_b X F = encode_b X F'.
{ apply encode_b_ext. exact H1. }
prove (X,encode_b X F) = (X,encode_b X F').
rewrite <- L1.
reflexivity.
Qed.

Definition struct_b : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall F:set -> set -> set, (forall x y :e X, F x y :e X) -> q (pack_b X F)) -> q S.

Theorem pack_struct_b_I: forall X, forall F:set -> set -> set, (forall x y :e X, F x y :e X) -> struct_b (pack_b X F).
let X F.
assume HF.
let q. assume Hq.
exact Hq X F HF.
Qed.

Theorem pack_struct_b_E1: forall X, forall F:set -> set -> set, struct_b (pack_b X F) -> forall x y :e X, F x y :e X.
let X F. assume H1. apply H1 (fun z => z = pack_b X F -> forall x y :e X, F x y :e X).
- let X' F'. assume HF'.
  assume Heq: pack_b X' F' = pack_b X F.
  prove forall x y :e X, F x y :e X.
  apply pack_b_inj X' X F' F Heq.
  assume HX'X.
  assume HF'F.
  rewrite <- HX'X.
  let x. assume Hx: x :e X'.
  let y. assume Hy: y :e X'.
  rewrite <- HF'F x Hx y Hy.
  exact HF' x Hx y Hy.
- reflexivity.
Qed.

Theorem struct_b_eta: forall S, struct_b S -> S = pack_b (S 0) (decode_b (S 1)).
let S. assume H1. apply H1 (fun z => z = pack_b (z 0) (decode_b (z 1))).
let X F. assume _.
prove pack_b X F = pack_b (pack_b X F 0) (decode_b (pack_b X F 1)).
rewrite <- pack_b_0_eq2 X F.
prove pack_b X F = pack_b X (decode_b (pack_b X F 1)).
apply pack_b_ext.
exact pack_b_1_eq2 X F.
Qed.

Definition unpack_b_i : set -> (set -> (set -> set -> set) -> set) -> set := fun S F => F (S 0) (decode_b (S 1)).

Theorem unpack_b_i_eq : forall Phi:set -> (set -> set -> set) -> set,
  forall X, forall F:set -> set -> set,
  (forall F':set -> set -> set, (forall x y :e X, F x y = F' x y) -> Phi X F' = Phi X F)
  ->
  unpack_b_i (pack_b X F) Phi = Phi X F.
let Phi X F.
assume HPhi.
prove unpack_b_i (pack_b X F) Phi = Phi X F.
prove Phi (pack_b X F 0) (decode_b (pack_b X F 1)) = Phi X F.
rewrite <- pack_b_0_eq2 X F.
prove Phi X (decode_b (pack_b X F 1)) = Phi X F.
apply HPhi.
let x. assume Hx. let y. assume Hy.
prove F x y = decode_b (pack_b X F 1) x y.
exact pack_b_1_eq2 X F x Hx y Hy.
Qed.

Definition unpack_b_o : set -> (set -> (set -> set -> set) -> prop) -> prop := fun S F => F (S 0) (decode_b (S 1)).

Theorem unpack_b_o_eq : forall Phi:set -> (set -> set -> set) -> prop,
  forall X, forall F:set -> set -> set,
  (forall F':set -> set -> set, (forall x y :e X, F x y = F' x y) -> Phi X F' = Phi X F)
  ->
  unpack_b_o (pack_b X F) Phi = Phi X F.
let Phi X F.
assume HPhi.
prove unpack_b_o (pack_b X F) Phi = Phi X F.
prove Phi (pack_b X F 0) (decode_b (pack_b X F 1)) = Phi X F.
rewrite <- pack_b_0_eq2 X F.
prove Phi X (decode_b (pack_b X F 1)) = Phi X F.
apply HPhi.
let x. assume Hx. let y. assume Hy.
prove F x y = decode_b (pack_b X F 1) x y.
exact pack_b_1_eq2 X F x Hx y Hy.
Qed.

Definition pack_p : set -> (set -> prop) -> set := fun X P => (X,encode_p X P).

Theorem pack_p_0_eq : forall S X, forall P:set -> prop, S = pack_p X P -> X = S 0.
let S X P.
assume H1: S = (X,encode_p X P).
prove X = S 0.
rewrite H1.
symmetry.
apply tuple_2_0_eq.
Qed.

Theorem pack_p_0_eq2 : forall X, forall P:set -> prop, X = pack_p X P 0.
let X P. apply pack_p_0_eq (pack_p X P) X P. reflexivity.
Qed.

Theorem pack_p_1_eq : forall S X, forall P:set -> prop, S = pack_p X P -> forall x :e X, P x = decode_p (S 1) x.
let S X P.
assume H1: S = (X,encode_p X P).
let x. assume Hx: x :e X.
prove P x = decode_p (S 1) x.
rewrite H1.
prove P x = decode_p ((X,encode_p X P) 1) x.
rewrite tuple_2_1_eq.
prove P x = decode_p (encode_p X P) x.
symmetry.
exact decode_encode_p X P x Hx.
Qed.

Theorem pack_p_1_eq2 : forall X, forall P:set -> prop, forall x :e X, P x = decode_p (pack_p X P 1) x.
let X P. apply pack_p_1_eq (pack_p X P) X P. reflexivity.
Qed.

Theorem pack_p_inj: forall X X', forall P P':set -> prop, pack_p X P = pack_p X' P' -> X = X' /\ forall x :e X, P x = P' x.
let X X' P P'. assume H1.
claim L0: X' = pack_p X P 0.
{ exact pack_p_0_eq (pack_p X P) X' P' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_p_0_eq2 X P. }
apply andI.
- exact L1.
- let x. assume Hx: x :e X.
  prove P x = P' x.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  rewrite pack_p_1_eq2 X P x Hx.
  prove decode_p (pack_p X P 1) x = P' x.
  rewrite H1.
  prove decode_p (pack_p X' P' 1) x = P' x.
  symmetry.
  exact pack_p_1_eq2 X' P' x Lx.
Qed.

Theorem pack_p_ext : forall X, forall P P':set -> prop,
     (forall x :e X, P x <-> P' x)
  -> pack_p X P = pack_p X P'.
let X P P'.
assume H1: forall x :e X, P x <-> P' x.
claim L1: encode_p X P = encode_p X P'.
{ apply encode_p_ext. exact H1. }
prove (X,encode_p X P) = (X,encode_p X P').
rewrite L1.
reflexivity.
Qed.

Definition struct_p : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall P:set -> prop, q (pack_p X P)) -> q S.

Theorem pack_struct_p_I: forall X, forall P:set -> prop, struct_p (pack_p X P).
let X P.
let q. assume Hq.
exact Hq X P.
Qed.

Theorem struct_p_eta: forall S, struct_p S -> S = pack_p (S 0) (decode_p (S 1)).
let S. assume H1. apply H1 (fun z => z = pack_p (z 0) (decode_p (z 1))).
let X P.
prove pack_p X P = pack_p (pack_p X P 0) (decode_p (pack_p X P 1)).
rewrite <- pack_p_0_eq2 X P.
prove pack_p X P = pack_p X (decode_p (pack_p X P 1)).
apply pack_p_ext.
let x. assume Hx.
rewrite <- pack_p_1_eq2 X P x Hx.
apply iff_refl.
Qed.

Definition unpack_p_i : set -> (set -> (set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_p (S 1)).

Theorem unpack_p_i_eq : forall Phi:set -> (set -> prop) -> set,
  forall X, forall P:set -> prop,
  (forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X P' = Phi X P)
  ->
  unpack_p_i (pack_p X P) Phi = Phi X P.
let Phi X P.
assume HPhi.
prove unpack_p_i (pack_p X P) Phi = Phi X P.
prove Phi (pack_p X P 0) (decode_p (pack_p X P 1)) = Phi X P.
rewrite <- pack_p_0_eq2 X P.
prove Phi X (decode_p (pack_p X P 1)) = Phi X P.
apply HPhi.
let x. assume Hx.
prove P x <-> decode_p (pack_p X P 1) x.
rewrite <- pack_p_1_eq2 X P x Hx.
apply iff_refl.
Qed.

Definition unpack_p_o : set -> (set -> (set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_p (S 1)).

Theorem unpack_p_o_eq : forall Phi:set -> (set -> prop) -> prop,
  forall X, forall P:set -> prop,
  (forall P':set -> prop, (forall x :e X, P x <-> P' x) -> Phi X P' = Phi X P)
  ->
  unpack_p_o (pack_p X P) Phi = Phi X P.
let Phi X P.
assume HPhi.
prove unpack_p_o (pack_p X P) Phi = Phi X P.
prove Phi (pack_p X P 0) (decode_p (pack_p X P 1)) = Phi X P.
rewrite <- pack_p_0_eq2 X P.
prove Phi X (decode_p (pack_p X P 1)) = Phi X P.
apply HPhi.
let x. assume Hx.
prove P x <-> decode_p (pack_p X P 1) x.
rewrite <- pack_p_1_eq2 X P x Hx.
apply iff_refl.
Qed.

Definition pack_r : set -> (set -> set -> prop) -> set := fun X R => (X,encode_r X R).

Theorem pack_r_0_eq : forall S X, forall R:set -> set -> prop, S = pack_r X R -> X = S 0.
let S X R.
assume H1: S = (X,encode_r X R).
prove X = S 0.
rewrite H1.
symmetry.
apply tuple_2_0_eq.
Qed.

Theorem pack_r_0_eq2 : forall X, forall R:set -> set -> prop, X = pack_r X R 0.
let X R. apply pack_r_0_eq (pack_r X R) X R. reflexivity.
Qed.

Theorem pack_r_1_eq : forall S X, forall R:set -> set -> prop, S = pack_r X R -> forall x y :e X, R x y = decode_r (S 1) x y.
let S X R.
assume H1: S = (X,encode_r X R).
let x. assume Hx: x :e X.
let y. assume Hy: y :e X.
prove R x y = decode_r (S 1) x y.
rewrite H1.
prove R x y = decode_r ((X,encode_r X R) 1) x y.
rewrite tuple_2_1_eq.
prove R x y = decode_r (encode_r X R) x y.
symmetry.
exact decode_encode_r X R x Hx y Hy.
Qed.

Theorem pack_r_1_eq2 : forall X, forall R:set -> set -> prop, forall x y :e X, R x y = decode_r (pack_r X R 1) x y.
let X R. apply pack_r_1_eq (pack_r X R) X R. reflexivity.
Qed.

Theorem pack_r_inj: forall X X', forall R R':set -> set -> prop, pack_r X R = pack_r X' R' -> X = X' /\ forall x y :e X, R x y = R' x y.
let X X' R R'. assume H1.
claim L0: X' = pack_r X R 0.
{ exact pack_r_0_eq (pack_r X R) X' R' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_r_0_eq2 X R. }
apply andI.
- exact L1.
- let x. assume Hx: x :e X.
  let y. assume Hy: y :e X.
  prove R x y = R' x y.
  claim Lx: x :e X'.
  { rewrite <- L1. exact Hx. }
  claim Ly: y :e X'.
  { rewrite <- L1. exact Hy. }
  rewrite pack_r_1_eq2 X R x Hx y Hy.
  prove decode_r (pack_r X R 1) x y = R' x y.
  rewrite H1.
  prove decode_r (pack_r X' R' 1) x y = R' x y.
  symmetry.
  exact pack_r_1_eq2 X' R' x Lx y Ly.
Qed.

Theorem pack_r_ext : forall X, forall R R':set -> set -> prop,
     (forall x y :e X, R x y <-> R' x y)
  -> pack_r X R = pack_r X R'.
let X R R'.
assume H1: forall x y :e X, R x y <-> R' x y.
claim L1: encode_r X R = encode_r X R'.
{ apply encode_r_ext. exact H1. }
prove (X,encode_r X R) = (X,encode_r X R').
rewrite L1.
reflexivity.
Qed.

Definition struct_r : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall R:set -> set -> prop, q (pack_r X R)) -> q S.

Theorem pack_struct_r_I: forall X, forall R:set -> set -> prop, struct_r (pack_r X R).
let X R.
let q. assume Hq.
exact Hq X R.
Qed.

Theorem struct_r_eta: forall S, struct_r S -> S = pack_r (S 0) (decode_r (S 1)).
let S. assume H1. apply H1 (fun z => z = pack_r (z 0) (decode_r (z 1))).
let X R.
prove pack_r X R = pack_r (pack_r X R 0) (decode_r (pack_r X R 1)).
rewrite <- pack_r_0_eq2 X R.
prove pack_r X R = pack_r X (decode_r (pack_r X R 1)).
apply pack_r_ext.
let x. assume Hx.
let y. assume Hy.
rewrite <- pack_r_1_eq2 X R x Hx y Hy.
apply iff_refl.
Qed.

Definition unpack_r_i : set -> (set -> (set -> set -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_r (S 1)).

Theorem unpack_r_i_eq : forall Phi:set -> (set -> set -> prop) -> set,
  forall X, forall R:set -> set -> prop,
  (forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X R' = Phi X R)
  ->
  unpack_r_i (pack_r X R) Phi = Phi X R.
let Phi X R. 
assume HPhi.
prove unpack_r_i (pack_r X R) Phi = Phi X R.
prove Phi (pack_r X R 0) (decode_r (pack_r X R 1)) = Phi X R.
rewrite <- pack_r_0_eq2 X R.
prove Phi X (decode_r (pack_r X R 1)) = Phi X R.
apply HPhi.
let x. assume Hx. let y. assume Hy.
prove R x y <-> decode_r (pack_r X R 1) x y.
rewrite <- pack_r_1_eq2 X R x Hx y Hy.
apply iff_refl.
Qed.

Definition unpack_r_o : set -> (set -> (set -> set -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_r (S 1)).

Theorem unpack_r_o_eq : forall Phi:set -> (set -> set -> prop) -> prop,
  forall X, forall R:set -> set -> prop,
  (forall R':set -> set -> prop, (forall x y :e X, R x y <-> R' x y) -> Phi X R' = Phi X R)
  ->
  unpack_r_o (pack_r X R) Phi = Phi X R.
let Phi X R. 
assume HPhi.
prove unpack_r_o (pack_r X R) Phi = Phi X R.
prove Phi (pack_r X R 0) (decode_r (pack_r X R 1)) = Phi X R.
rewrite <- pack_r_0_eq2 X R.
prove Phi X (decode_r (pack_r X R 1)) = Phi X R.
apply HPhi.
let x. assume Hx. let y. assume Hy.
prove R x y <-> decode_r (pack_r X R 1) x y.
rewrite <- pack_r_1_eq2 X R x Hx y Hy.
apply iff_refl.
Qed.

Definition pack_c : set -> ((set -> prop) -> prop) -> set := fun X C => (X,encode_c X C).

Theorem pack_c_0_eq : forall S X, forall C:(set -> prop) -> prop, S = pack_c X C -> X = S 0.
let S X C.
assume H1: S = (X,encode_c X C).
prove X = S 0.
rewrite H1.
symmetry.
apply tuple_2_0_eq.
Qed.

Theorem pack_c_0_eq2 : forall X, forall C:(set -> prop) -> prop, X = pack_c X C 0.
let X C. apply pack_c_0_eq (pack_c X C) X C. reflexivity.
Qed.

Theorem pack_c_1_eq : forall S X, forall C:(set -> prop) -> prop, S = pack_c X C -> forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (S 1) U.
let S X C.
assume H1: S = (X,encode_c X C).
let U.
assume HU: forall x, U x -> x :e X.
prove C U = decode_c (S 1) U.
rewrite H1.
prove C U = decode_c ((X,encode_c X C) 1) U.
rewrite tuple_2_1_eq.
prove C U = decode_c (encode_c X C) U.
symmetry.
exact decode_encode_c X C U HU.
Qed.

Theorem pack_c_1_eq2 : forall X, forall C:(set -> prop) -> prop, forall U:set -> prop, (forall x, U x -> x :e X) -> C U = decode_c (pack_c X C 1) U.
let X C. apply pack_c_1_eq (pack_c X C) X C. reflexivity.
Qed.

Theorem pack_c_inj: forall X X', forall C C':(set -> prop) -> prop, pack_c X C = pack_c X' C' -> X = X' /\ forall U:set -> prop, (forall x, U x -> x :e X) -> C U = C' U.
let X X' C C'. assume H1.
claim L0: X' = pack_c X C 0.
{ exact pack_c_0_eq (pack_c X C) X' C' H1. }
claim L1: X = X'.
{ rewrite L0. exact pack_c_0_eq2 X C. }
apply andI.
- exact L1.
- let U. assume HU: forall x, U x -> x :e X.
  prove C U = C' U.
  claim LU: forall x, U x -> x :e X'.
  { rewrite <- L1. exact HU. }
  rewrite pack_c_1_eq2 X C U HU.
  prove decode_c (pack_c X C 1) U = C' U.
  rewrite H1.
  prove decode_c (pack_c X' C' 1) U = C' U.
  symmetry.
  exact pack_c_1_eq2 X' C' U LU.
Qed.

Theorem pack_c_ext : forall X, forall C C':(set -> prop) -> prop,
     (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U))
  -> pack_c X C = pack_c X C'.
let X C C'. assume H1.
claim L1: encode_c X C = encode_c X C'.
{ apply encode_c_ext. exact H1. }
prove (X,encode_c X C) = (X,encode_c X C').
rewrite <- L1.
reflexivity.
Qed.

Definition struct_c : set -> prop := fun S => forall q:set -> prop, (forall X:set, forall C:(set -> prop) -> prop, q (pack_c X C)) -> q S.

Theorem pack_struct_c_I: forall X, forall C:(set -> prop) -> prop, struct_c (pack_c X C).
let X C.
let q. assume Hq.
exact Hq X C.
Qed.

Theorem struct_c_eta: forall S, struct_c S -> S = pack_c (S 0) (decode_c (S 1)).
let S. assume H1. apply H1 (fun z => z = pack_c (z 0) (decode_c (z 1))).
let X C.
prove pack_c X C = pack_c (pack_c X C 0) (decode_c (pack_c X C 1)).
rewrite <- pack_c_0_eq2 X C.
prove pack_c X C = pack_c X (decode_c (pack_c X C 1)).
apply pack_c_ext.
let U. assume HU.
rewrite <- pack_c_1_eq2 X C U HU.
apply iff_refl.
Qed.

Definition unpack_c_i : set -> (set -> ((set -> prop) -> prop) -> set) -> set := fun S Phi => Phi (S 0) (decode_c (S 1)).

Theorem unpack_c_i_eq : forall Phi:set -> ((set -> prop) -> prop) -> set,
  forall X, forall C:(set -> prop) -> prop,
  (forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) -> Phi X C' = Phi X C)
  ->
  unpack_c_i (pack_c X C) Phi = Phi X C.
let Phi X C.
assume HPhi.
prove unpack_c_i (pack_c X C) Phi = Phi X C.
prove Phi (pack_c X C 0) (decode_c (pack_c X C 1)) = Phi X C.
rewrite <- pack_c_0_eq2 X C.
prove Phi X (decode_c (pack_c X C 1)) = Phi X C.
apply HPhi.
let U. assume HU.
prove C U <-> decode_c (pack_c X C 1) U.
rewrite <- pack_c_1_eq2 X C U HU.
apply iff_refl.
Qed.

Definition unpack_c_o : set -> (set -> ((set -> prop) -> prop) -> prop) -> prop := fun S Phi => Phi (S 0) (decode_c (S 1)).

Theorem unpack_c_o_eq : forall Phi:set -> ((set -> prop) -> prop) -> prop,
  forall X, forall C:(set -> prop) -> prop,
  (forall C':(set -> prop) -> prop, (forall U:set -> prop, (forall x, U x -> x :e X) -> (C U <-> C' U)) -> Phi X C' = Phi X C)
  ->
  unpack_c_o (pack_c X C) Phi = Phi X C.
let Phi X C.
assume HPhi.
prove unpack_c_o (pack_c X C) Phi = Phi X C.
prove Phi (pack_c X C 0) (decode_c (pack_c X C 1)) = Phi X C.
rewrite <- pack_c_0_eq2 X C.
prove Phi X (decode_c (pack_c X C 1)) = Phi X C.
apply HPhi.
let U. assume HU.
prove C U <-> decode_c (pack_c X C 1) U.
rewrite <- pack_c_1_eq2 X C U HU.
apply iff_refl.
Qed.
