(** Type Semantics and Big Step Semantics, could be generalized **)
(** Note that we define relations instead of functions since function spaces are nonstandard. **)
Definition one_interp : set -> prop := fun x => x = nil.

Definition injl_interp : set -> set := fun x => pair "L" x.
Definition injr_interp : set -> set := fun y => pair "R" y.

Theorem injl_interp_inj : forall x y, injl_interp x = injl_interp y -> x = y.
let x y. assume H.
exact pair_inj_2 "L" x "L" y H.
Qed.

Theorem injr_interp_inj : forall x y, injr_interp x = injr_interp y -> x = y.
let x y. assume H.
exact pair_inj_2 "R" x "R" y H.
Qed.

Theorem injl_interp_not_injr_interp : forall x y, injl_interp x <> injr_interp y.
let x y. assume H.
claim L1 : "L" <> "R".
{ distinct. }
exact L1 (pair_inj_1 "L" x "R" y H).
Qed.

Definition sum_interp : (set -> prop) -> (set -> prop) -> set -> prop
  := fun X Y z =>
          (exists x, X x /\ z = injl_interp x)
       \/ (exists y, Y y /\ z = injr_interp y).

Theorem sum_interp_IL : forall X Y:set -> prop, forall x, X x -> sum_interp X Y (injl_interp x).
let X Y x. assume Hx.
prove (exists x', X x' /\ injl_interp x = injl_interp x')
   \/ (exists y, Y y /\ injl_interp x = injr_interp y).
apply orIL.
witness x. apply andI.
+ exact Hx.
+ reflexivity.
Qed.

Theorem sum_interp_IR : forall X Y:set -> prop, forall y, Y y -> sum_interp X Y (injr_interp y).
let X Y y. assume Hy.
prove (exists x, X x /\ injr_interp y = injl_interp x)
   \/ (exists y', Y y' /\ injr_interp y = injr_interp y').
apply orIR.
witness y. apply andI.
+ exact Hy.
+ reflexivity.
Qed.

Theorem sum_interp_E : forall X Y:set -> prop, forall z, sum_interp X Y z -> forall p:set -> prop,
      (forall x, X x -> p (injl_interp x))
   -> (forall y, Y y -> p (injr_interp y))
   -> p z.
let X Y z. assume H1.
let p. assume Hp1 Hp2.
apply H1.
- assume H2. apply H2.
  let x. assume H3. apply H3.
  assume H4 H5. rewrite H5.
  apply Hp1. exact H4.
- assume H2. apply H2.
  let y. assume H3. apply H3.
  assume H4 H5. rewrite H5.
  apply Hp2. exact H4.
Qed.

Definition spair_interp : set -> set -> set := fun x y => pair "P" (pair x y).

Theorem spair_interp_inj : forall x y z w, spair_interp x y = spair_interp z w -> x = z /\ y = w.
let x y z w. assume H.
exact pair_inj x y z w (pair_inj_2 "P" (pair x y) "P" (pair z w) H).
Qed.

Definition prod_interp : (set -> prop) -> (set -> prop) -> set -> prop
  := fun X Y z => exists x y, X x /\ Y y /\ z = spair_interp x y.

Theorem prod_interp_I : forall X Y:set -> prop, forall x y, X x -> Y y -> prod_interp X Y (spair_interp x y).
let X Y x y. assume Hx Hy.
prove exists x' y', X x' /\ Y y' /\ spair_interp x y = spair_interp x' y'.
witness x. witness y. apply and3I.
- exact Hx.
- exact Hy.
- reflexivity.
Qed.

Theorem prod_interp_E : forall X Y:set -> prop, forall z, prod_interp X Y z
  -> forall p:set -> prop,
          (forall x y, X x -> Y y -> p (spair_interp x y))
       -> p z.
let X Y z. assume H.
let p. assume Hp1.
apply H.
let x. assume H. apply H.
let y. assume H. apply H. assume H. apply H.
assume Hx Hy Hz.
rewrite Hz. apply Hp1.
- exact Hx.
- exact Hy.
Qed.

Definition tyev : set -> (set -> prop) -> prop
  := fun A X =>
     forall p:set -> (set -> prop) -> prop,
         p one one_interp
      -> (forall A B, forall X Y:set -> prop, p A X -> p B Y -> p (A + B) (sum_interp X Y))
      -> (forall A B, forall X Y:set -> prop, p A X -> p B Y -> p (A * B) (prod_interp X Y))
      -> p A X.

Theorem tyev_one : tyev one one_interp.
let p. assume H1 H2 H3.
exact H1.
Qed.

Theorem tyev_sum : forall A B, forall X Y:set -> prop, tyev A X -> tyev B Y -> tyev (A + B) (sum_interp X Y).
let A B X Y. assume HAX HBY.
let p. assume H1 H2 H3.
exact H2 A B X Y (HAX p H1 H2 H3) (HBY p H1 H2 H3).
Qed.

Theorem tyev_prod : forall A B, forall X Y:set -> prop, tyev A X -> tyev B Y -> tyev (A * B) (prod_interp X Y).
let A B X Y. assume HAX HBY.
let p. assume H1 H2 H3.
exact H3 A B X Y (HAX p H1 H2 H3) (HBY p H1 H2 H3).
Qed.

Theorem tyev_total : forall A, type_p A -> exists X:set -> prop, tyev A X.
apply type_ind.
- witness one_interp. apply tyev_one.
- let A B. assume HA IHA HB IHB.
  apply IHA.
  let X. assume HAX.
  apply IHB.
  let Y. assume HBY.
  witness (sum_interp X Y).
  apply tyev_sum.
  + exact HAX.
  + exact HBY.
- let A B. assume HA IHA HB IHB.
  apply IHA.
  let X. assume HAX.
  apply IHB.
  let Y. assume HBY.
  witness (prod_interp X Y).
  apply tyev_prod.
  + exact HAX.
  + exact HBY.
Qed.

Theorem tyev_ind : forall p:set -> (set -> prop) -> prop,
      p one one_interp
   -> (forall A B, forall X Y:set -> prop, tyev A X -> p A X -> tyev B Y -> p B Y -> p (A + B) (sum_interp X Y))
   -> (forall A B, forall X Y:set -> prop, tyev A X -> p A X -> tyev B Y -> p B Y -> p (A * B) (prod_interp X Y))
   -> forall A, forall X:set -> prop, tyev A X -> p A X.
let p. assume H1 H2 H3.
let A X. assume HAX.
set q := fun A:set => fun X:set -> prop => tyev A X /\ p A X.
claim LqE: forall A, forall X:set -> prop, forall r:prop, (tyev A X -> p A X -> r) -> (q A X -> r).
{ let A X r. assume Hr Hq. apply Hq. exact Hr. }
claim LqI: forall A, forall X:set -> prop, tyev A X -> p A X -> q A X.
{ let A X. assume Htyev Hp. prove tyev A X /\ p A X. apply andI.
  - exact Htyev.
  - exact Hp.
}
claim L1: q A X.
{ apply HAX q.
  - apply LqI.
    + apply tyev_one.
    + exact H1.
  - let A B X Y.
    apply LqE.
    assume IHAX1 IHAX2.
    apply LqE.
    assume IHBY1 IHBY2.
    apply LqI.
    + apply tyev_sum.
      * exact IHAX1.
      * exact IHBY1.
    + apply H2.
      * exact IHAX1.
      * exact IHAX2.
      * exact IHBY1.
      * exact IHBY2.
  - let A B X Y.
    apply LqE.
    assume IHAX1 IHAX2.
    apply LqE.
    assume IHBY1 IHBY2.
    apply LqI.
    + apply tyev_prod.
      * exact IHAX1.
      * exact IHBY1.
    + apply H3.
      * exact IHAX1.
      * exact IHAX2.
      * exact IHBY1.
      * exact IHBY2.
}
apply L1. assume _ H. exact H.
Qed.

Theorem tyev_functional_lem : forall A, forall X:set -> prop, tyev A X -> forall B, forall Y:set -> prop, tyev B Y -> A = B -> X = Y.
apply tyev_ind.
- apply tyev_ind.
  + assume _. reflexivity.
  + let B1 B2 Y1 Y2.
    assume HBY1: tyev B1 Y1.
    assume IHBY1.
    assume HBY2: tyev B2 Y2.
    assume IHBY2.
    assume H1: one = B1 + B2.
    prove False.
    exact neq_one_sum B1 B2 H1.
  + let B1 B2 Y1 Y2.
    assume HBY1: tyev B1 Y1.
    assume IHBY1.
    assume HBY2: tyev B2 Y2.
    assume IHBY2.
    assume H1: one = B1 * B2.
    prove False.
    exact neq_one_prod B1 B2 H1.
- let A1 A2 X1 X2.
  assume HAX1: tyev A1 X1.
  assume IHAX1.
  assume HAX2: tyev A2 X2.
  assume IHAX2.
  apply tyev_ind.
  + assume H1: A1 + A2 = one.
    prove False.
    apply neq_one_sum A1 A2. symmetry. exact H1.
  + let B1 B2 Y1 Y2.
    assume HBY1: tyev B1 Y1.
    assume IHBY1.
    assume HBY2: tyev B2 Y2.
    assume IHBY2.
    assume H1: A1 + A2 = B1 + B2.
    apply sum_inj A1 A2 B1 B2 H1.
    assume H2: A1 = B1.
    assume H3: A2 = B2.
    prove sum_interp X1 X2 = sum_interp Y1 Y2.
    claim L1: X1 = Y1.
    { exact IHAX1 B1 Y1 HBY1 H2. }
    claim L2: X2 = Y2.
    { exact IHAX2 B2 Y2 HBY2 H3. }
    rewrite L1.
    rewrite L2.
    reflexivity.
  + let B1 B2 Y1 Y2.
    assume HBY1: tyev B1 Y1.
    assume IHBY1.
    assume HBY2: tyev B2 Y2.
    assume IHBY2.
    assume H1: A1 + A2 = B1 * B2.
    prove False.
    exact neq_sum_prod A1 A2 B1 B2 H1.
- let A1 A2 X1 X2.
  assume HAX1: tyev A1 X1.
  assume IHAX1.
  assume HAX2: tyev A2 X2.
  assume IHAX2.
  apply tyev_ind.
  + assume H1: A1 * A2 = one.
    prove False.
    apply neq_one_prod A1 A2. symmetry. exact H1.
  + let B1 B2 Y1 Y2.
    assume HBY1: tyev B1 Y1.
    assume IHBY1.
    assume HBY2: tyev B2 Y2.
    assume IHBY2.
    assume H1: A1 * A2 = B1 + B2.
    prove False.
    apply neq_sum_prod B1 B2 A1 A2. symmetry. exact H1.
  + let B1 B2 Y1 Y2.
    assume HBY1: tyev B1 Y1.
    assume IHBY1.
    assume HBY2: tyev B2 Y2.
    assume IHBY2.
    assume H1: A1 * A2 = B1 * B2.
    apply prod_inj A1 A2 B1 B2 H1.
    assume H2: A1 = B1.
    assume H3: A2 = B2.
    prove prod_interp X1 X2 = prod_interp Y1 Y2.
    claim L1: X1 = Y1.
    { exact IHAX1 B1 Y1 HBY1 H2. }
    claim L2: X2 = Y2.
    { exact IHAX2 B2 Y2 HBY2 H3. }
    rewrite L1.
    rewrite L2.
    reflexivity.
Qed.

Theorem tyev_functional : forall A, forall X Y:set -> prop, tyev A X -> tyev A Y -> X = Y.
let A X Y. assume HAX HAY.
apply tyev_functional_lem A X HAX A Y HAY.
reflexivity.
Qed.

Theorem tyev_inv : forall A, forall X:set -> prop, tyev A X ->
  forall p:prop,
       (A = one -> X = one_interp -> p)
    -> (forall B C, forall Y Z:set -> prop, tyev B Y -> tyev C Z -> A = B + C -> X = sum_interp Y Z -> p)
    -> (forall B C, forall Y Z:set -> prop, tyev B Y -> tyev C Z -> A = B * C -> X = prod_interp Y Z -> p)
    -> p.
apply tyev_ind.
- let p. assume Hp1 Hp2 Hp3. apply Hp1.
  + reflexivity.
  + reflexivity.
- let B C Y Z. assume HBY _ HCZ _.
  let p. assume Hp1 Hp2 Hp3. apply Hp2 B C Y Z HBY HCZ.
  + reflexivity.
  + reflexivity.
- let B C Y Z. assume HBY _ HCZ _.
  let p. assume Hp1 Hp2 Hp3. apply Hp3 B C Y Z HBY HCZ.
  + reflexivity.
  + reflexivity.
Qed.

Theorem tyev_sum_inv : forall A B, forall X:set -> prop, tyev (A + B) X -> exists Y Z:set -> prop, tyev A Y /\ tyev B Z /\ X = sum_interp Y Z.
let A B X. assume H. apply tyev_inv (A + B) X H.
- assume HE: A + B = one.
  prove False.
  apply neq_one_sum A B. symmetry. exact HE.
- let C D Y Z.
  assume HCY HDZ.
  assume HE: A + B = C + D.
  assume HX: X = sum_interp Y Z.
  apply sum_inj A B C D HE.
  assume HE1: A = C.
  assume HE2: B = D.
  witness Y. witness Z. apply and3I.
  + rewrite HE1. exact HCY.
  + rewrite HE2. exact HDZ.
  + exact HX.
- let C D Y Z. assume _ _.
  assume HE: A + B = C * D.
  prove False.
  exact neq_sum_prod A B C D HE.
Qed.

Theorem tyev_prod_inv : forall A B, forall X:set -> prop, tyev (A * B) X -> exists Y Z:set -> prop, tyev A Y /\ tyev B Z /\ X = prod_interp Y Z.
let A B X. assume H. apply tyev_inv (A * B) X H.
- assume HE: A * B = one.
  prove False.
  apply neq_one_prod A B. symmetry. exact HE.
- let C D Y Z. assume _ _.
  assume HE: A * B = C + D.
  prove False.
  apply neq_sum_prod C D A B.
  symmetry. exact HE.
- let C D Y Z.
  assume HCY HDZ.
  assume HE: A * B = C * D.
  assume HX: X = prod_interp Y Z.
  apply prod_inj A B C D HE.
  assume HE1: A = C.
  assume HE2: B = D.
  witness Y. witness Z. apply and3I.
  + rewrite HE1. exact HCY.
  + rewrite HE2. exact HDZ.
  + exact HX.
Qed.

Definition ev : set -> set -> set -> prop
  := fun t a b =>
  forall p:set -> set -> set -> prop,
       (forall a, p iden a a)
    -> (forall s t a b c, p s a b -> p t b c -> p (comp s t) a c)
    -> (forall a, p unit a nil)
    -> (forall t a b, p t a b -> p (injl t) a (injl_interp b))
    -> (forall t a b, p t a b -> p (injr t) a (injr_interp b))
    -> (forall s t a c d, term_p t -> p s (spair_interp a c) d -> p (case s t) (spair_interp (injl_interp a) c) d)
    -> (forall s t b c d, term_p s -> p t (spair_interp b c) d -> p (case s t) (spair_interp (injr_interp b) c) d)
    -> (forall s t a b c, p s a b -> p t a c -> p (spair s t) a (spair_interp b c))
    -> (forall t a b c, p t a c -> p (take t) (spair_interp a b) c)
    -> (forall t a b c, p t b c -> p (drop t) (spair_interp a b) c)
    -> p t a b.

Theorem ev_iden : forall a, ev iden a a.
let a p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
apply H1.
Qed.

Theorem ev_comp : forall s t a b c, ev s a b -> ev t b c -> ev (comp s t) a c.
let s t a b c. assume Hs Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
exact H2 s t a b c (Hs p H1 H2 H3 H4 H5 H6 H7 H8 H9 H10) (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9 H10).
Qed.

Theorem ev_unit : forall a, ev unit a nil.
let a p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
apply H3.
Qed.

Theorem ev_injl : forall t a b, ev t a b -> ev (injl t) a (injl_interp b).
let t a b. assume Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
exact H4 t a b (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9 H10).
Qed.

Theorem ev_injr : forall t a b, ev t a b -> ev (injr t) a (injr_interp b).
let t a b. assume Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
exact H5 t a b (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9 H10).
Qed.

Theorem ev_case_l : forall s t a c d, term_p t -> ev s (spair_interp a c) d -> ev (case s t) (spair_interp (injl_interp a) c) d.
let s t a c d. assume Ht Hs.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
exact H6 s t a c d Ht (Hs p H1 H2 H3 H4 H5 H6 H7 H8 H9 H10).
Qed.

Theorem ev_case_r : forall s t b c d, term_p s -> ev t (spair_interp b c) d -> ev (case s t) (spair_interp (injr_interp b) c) d.
let s t a c d. assume Hs Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
exact H7 s t a c d Hs (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9 H10).
Qed.

Theorem ev_spair : forall s t a b c, ev s a b -> ev t a c -> ev (spair s t) a (spair_interp b c).
let s t a b c. assume Hs Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
exact H8 s t a b c (Hs p H1 H2 H3 H4 H5 H6 H7 H8 H9 H10) (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9 H10).
Qed.

Theorem ev_take : forall t a b c, ev t a c -> ev (take t) (spair_interp a b) c.
let t a b c. assume Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
exact H9 t a b c (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9 H10).
Qed.

Theorem ev_drop : forall t a b c, ev t b c -> ev (drop t) (spair_interp a b) c.
let t a b c. assume Ht.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
exact H10 t a b c (Ht p H1 H2 H3 H4 H5 H6 H7 H8 H9 H10).
Qed.

Theorem ev_ind : forall p:set -> set -> set -> prop,
     (forall a, ev iden a a -> p iden a a)
  -> (forall s t a b c, ev s a b -> p s a b -> ev t b c -> p t b c -> p (comp s t) a c)
  -> (forall a, ev unit a nil -> p unit a nil)
  -> (forall t a b, ev t a b -> p t a b -> p (injl t) a (injl_interp b))
  -> (forall t a b, ev t a b -> p t a b -> p (injr t) a (injr_interp b))
  -> (forall s t a c d, term_p t -> ev s (spair_interp a c) d -> p s (spair_interp a c) d -> p (case s t) (spair_interp (injl_interp a) c) d)
  -> (forall s t b c d, term_p s -> ev t (spair_interp b c) d -> p t (spair_interp b c) d -> p (case s t) (spair_interp (injr_interp b) c) d)
  -> (forall s t a b c, ev s a b -> p s a b -> ev t a c -> p t a c -> p (spair s t) a (spair_interp b c))
  -> (forall t a b c, ev t a c -> p t a c -> p (take t) (spair_interp a b) c)
  -> (forall t a b c, ev t b c -> p t b c -> p (drop t) (spair_interp a b) c)
  -> forall t a b, ev t a b -> p t a b.
let p. assume H1 H2 H3 H4 H5 H6 H7 H8 H9 H10.
let t a b. assume Ht.
set q := fun t a b : set => ev t a b /\ p t a b.
claim LqE: forall t a b, forall r:prop, (ev t a b -> p t a b -> r) -> (q t a b -> r).
{ let t a b r. assume Hr Hq. apply Hq. exact Hr. }
claim LqI: forall t a b, ev t a b -> p t a b -> q t a b.
{ let t a b. assume Hev Hp.
  prove ev t a b /\ p t a b.
  apply andI.
  - exact Hev.
  - exact Hp.
}
claim L1: ev t a b /\ p t a b.
{ prove q t a b.
  apply Ht q.
  - let a. apply LqI.
    + apply ev_iden.
    + apply H1. apply ev_iden.
  - let s t a b c.
    apply LqE.
    assume IHs1 IHs2.
    apply LqE.
    assume IHt1 IHt2.
    apply LqI.
    + apply ev_comp s t a b c.
      * exact IHs1.
      * exact IHt1.
    + apply H2 s t a b c.
      * exact IHs1.
      * exact IHs2.
      * exact IHt1.
      * exact IHt2.
  - let a. apply LqI.
    + apply ev_unit.
    + apply H3. apply ev_unit.
  - let t a b.
    apply LqE.
    assume IHt1 IHt2.
    apply LqI.
    + apply ev_injl. exact IHt1.
    + apply H4.
      * exact IHt1.
      * exact IHt2.
  - let t a b.
    apply LqE.
    assume IHt1 IHt2.
    apply LqI.
    + apply ev_injr. exact IHt1.
    + apply H5.
      * exact IHt1.
      * exact IHt2.
  - let s t a c d. assume Ht.
    apply LqE.
    assume IHs1 IHs2.
    apply LqI.
    + apply ev_case_l.
      * exact Ht.
      * exact IHs1.
    + apply H6 s t a c d.
      * exact Ht.
      * exact IHs1.
      * exact IHs2.
  - let s t a c d. assume Hs.
    apply LqE.
    assume IHt1 IHt2.
    apply LqI.
    + apply ev_case_r.
      * exact Hs.
      * exact IHt1.
    + apply H7.
      * exact Hs.
      * exact IHt1.
      * exact IHt2.
  - let s t a b c.
    apply LqE.
    assume IHs1 IHs2.
    apply LqE.
    assume IHt1 IHt2.
    apply LqI.
    + apply ev_spair.
      * exact IHs1.
      * exact IHt1.
    + apply H8.
      * exact IHs1.
      * exact IHs2.
      * exact IHt1.
      * exact IHt2.
  - let t a b c.
    apply LqE.
    assume IHt1 IHt2.
    apply LqI.
    + apply ev_take. exact IHt1.
    + apply H9.
      * exact IHt1.
      * exact IHt2.
  - let t a b c.
    apply LqE.
    assume IHt1 IHt2.
    apply LqI.
    + apply ev_drop. exact IHt1.
    + apply H10.
      * exact IHt1.
      * exact IHt2.
}
apply L1. assume _ H. exact H.
Qed.

Theorem ev_inv : forall t a b, ev t a b ->
  forall p:prop,
       (t = iden -> a = b -> p)
    -> (forall s' t' a' b' c', ev s' a' b' -> ev t' b' c' -> t = comp s' t' -> a = a' -> b = c' -> p)
    -> (t = unit -> b = nil -> p)
    -> (forall t' a' b', ev t' a' b' -> t = injl t' -> a = a' -> b = injl_interp b' -> p)
    -> (forall t' a' b', ev t' a' b' -> t = injr t' -> a = a' -> b = injr_interp b' -> p)
    -> (forall s' t' a' c' d', term_p t' -> ev s' (spair_interp a' c') d' -> t = case s' t' -> a = spair_interp (injl_interp a') c' -> b = d' -> p)
    -> (forall s' t' b' c' d', term_p s' -> ev t' (spair_interp b' c') d' -> t = case s' t' -> a = spair_interp (injr_interp b') c' -> b = d' -> p)
    -> (forall s' t' a' b' c', ev s' a' b' -> ev t' a' c' -> t = spair s' t' -> a = a' -> b = spair_interp b' c' -> p)
    -> (forall t' a' b' c', ev t' a' c' -> t = take t' -> a = spair_interp a' b' -> b = c' -> p)
    -> (forall t' a' b' c', ev t' b' c' -> t = drop t' -> a = spair_interp a' b' -> b = c' -> p)
    -> p.
apply ev_ind.
- let a'. assume Ha': ev iden a' a'.
  let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7 Hp8 Hp9 Hp10.
  apply Hp1.
  + prove iden = iden. reflexivity.
  + prove a' = a'. reflexivity.
- let s' t' a' b' c'. assume Hs' IHs' Ht' IHt.
  let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7 Hp8 Hp9 Hp10.
  apply Hp2 s' t' a' b' c' Hs' Ht'.
  + reflexivity.
  + reflexivity.
  + reflexivity.
- let a'. assume Ha': ev unit a' nil.
  let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7 Hp8 Hp9 Hp10.
  apply Hp3.
  + reflexivity.
  + reflexivity.
- let t' a' b'. assume Ht' _.
  let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7 Hp8 Hp9 Hp10.
  apply Hp4 t' a' b' Ht'.
  + reflexivity.
  + reflexivity.
  + reflexivity.
- let t' a' b'. assume Ht' _.
  let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7 Hp8 Hp9 Hp10.
  apply Hp5 t' a' b' Ht'.
  + reflexivity.
  + reflexivity.
  + reflexivity.
- let s' t' a' c' d'. assume Ht' Hs' _.
  let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7 Hp8 Hp9 Hp10.
  apply Hp6 s' t' a' c' d' Ht' Hs'.
  + reflexivity.
  + reflexivity.
  + reflexivity.
- let s' t' b' c' d'. assume Hs' Ht' _.
  let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7 Hp8 Hp9 Hp10.
  apply Hp7 s' t' b' c' d' Hs' Ht'.
  + reflexivity.
  + reflexivity.
  + reflexivity.
- let s' t' a' b' c'. assume Hs' _ Ht' _.
  let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7 Hp8 Hp9 Hp10.
  apply Hp8 s' t' a' b' c' Hs' Ht'.
  + reflexivity.
  + reflexivity.
  + reflexivity.
- let t' a' b' c'. assume Ht' _.
  let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7 Hp8 Hp9 Hp10.
  apply Hp9 t' a' b' c' Ht'.
  + reflexivity.
  + reflexivity.
  + reflexivity.
- let t' a' b' c'. assume Ht' _.
  let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7 Hp8 Hp9 Hp10.
  apply Hp10 t' a' b' c' Ht'.
  + reflexivity.
  + reflexivity.
  + reflexivity.
Qed.

Theorem ev_iden_inv : forall a b, ev iden a b -> a = b.
let a b. assume H. apply ev_inv iden a b H.
- assume _ Hab. exact Hab.
- let s' t' a' b' c'. assume _ _.
  assume HE: iden = comp s' t'.
  prove False.
  exact neq_iden_comp s' t' HE.
- assume HE: iden = unit.
  prove False.
  exact neq_iden_unit HE.
- let t' a' b'. assume _.
  assume HE: iden = injl t'.
  prove False.
  exact neq_iden_injl t' HE.
- let t' a' b'. assume _.
  assume HE: iden = injr t'.
  prove False.
  exact neq_iden_injr t' HE.
- let s' t' a' c' d'. assume _ _.
  assume HE: iden = case s' t'.
  prove False.
  exact neq_iden_case s' t' HE.
- let s' t' b' c' d'. assume _ _.
  assume HE: iden = case s' t'.
  prove False.
  exact neq_iden_case s' t' HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: iden = spair s' t'.
  prove False.
  exact neq_iden_spair s' t' HE.
- let t' a' b' c'. assume _.
  assume HE: iden = take t'.
  prove False.
  exact neq_iden_take t' HE.
- let t' a' b' c'. assume _.
  assume HE: iden = drop t'.
  prove False.
  exact neq_iden_drop t' HE.
Qed.

Theorem ev_comp_inv : forall s t a c, ev (comp s t) a c -> exists b, ev s a b /\ ev t b c.
let s t a c. assume H. apply ev_inv (comp s t) a c H.
- assume HE: comp s t = iden.
  prove False.
  apply neq_iden_comp s t. symmetry. exact HE.
- let s' t' a' b' c'. assume Hs' Ht'.
  assume HE: comp s t = comp s' t'.
  apply comp_inj s t s' t' HE.
  assume Hs: s = s'.
  assume Ht: t = t'.
  assume Ha: a = a'.
  assume Hc: c = c'.
  witness b'.
  apply andI.
  + rewrite Ha. rewrite Hs. exact Hs'.
  + rewrite Hc. rewrite Ht. exact Ht'.
- assume HE: comp s t = unit.
  prove False.
  exact neq_comp_unit s t HE.
- let t' a' b'. assume _.
  assume HE: comp s t = injl t'.
  prove False.
  exact neq_comp_injl s t t' HE.
- let t' a' b'. assume _.
  assume HE: comp s t = injr t'.
  prove False.
  exact neq_comp_injr s t t' HE.
- let s' t' a' b' d'. assume _ _.
  assume HE: comp s t = case s' t'.
  prove False.
  exact neq_comp_case s t s' t' HE.
- let s' t' a' c' d'. assume _ _.
  assume HE: comp s t = case s' t'.
  prove False.
  exact neq_comp_case s t s' t' HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: comp s t = spair s' t'.
  prove False.
  exact neq_comp_spair s t s' t' HE.
- let t' a' b' c'. assume _.
  assume HE: comp s t = take t'.
  prove False.
  exact neq_comp_take s t t' HE.
- let t' a' b' c'. assume _.
  assume HE: comp s t = drop t'.
  prove False.
  exact neq_comp_drop s t t' HE.
Qed.

Theorem ev_unit_inv : forall a b, ev unit a b -> b = nil.
let a b. assume H. apply ev_inv unit a b H.
- assume HE: unit = iden.
  prove False.
  apply neq_iden_unit. symmetry. exact HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: unit = comp s' t'.
  prove False.
  apply neq_comp_unit s' t'.
  symmetry. exact HE.
- assume _ Hb. exact Hb.
- let t' a' b'. assume _.
  assume HE: unit = injl t'.
  prove False.
  exact neq_unit_injl t' HE.
- let t' a' b'. assume _.
  assume HE: unit = injr t'.
  prove False.
  exact neq_unit_injr t' HE.
- let s' t' a' c' d'. assume _ _.
  assume HE: unit = case s' t'.
  prove False.
  exact neq_unit_case s' t' HE.
- let s' t' b' c' d'. assume _ _.
  assume HE: unit = case s' t'.
  prove False.
  exact neq_unit_case s' t' HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: unit = spair s' t'.
  prove False.
  exact neq_unit_spair s' t' HE.
- let t' a' b' c'. assume _.
  assume HE: unit = take t'.
  prove False.
  exact neq_unit_take t' HE.
- let t' a' b' c'. assume _.
  assume HE: unit = drop t'.
  prove False.
  exact neq_unit_drop t' HE.
Qed.

Theorem ev_injl_inv : forall t a b, ev (injl t) a b -> exists b', ev t a b' /\ b = injl_interp b'.
let t a b. assume H. apply ev_inv (injl t) a b H.
- assume HE: injl t = iden.
  prove False.
  apply neq_iden_injl t. symmetry. exact HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: injl t = comp s' t'.
  prove False.
  apply neq_comp_injl s' t' t. symmetry. exact HE.
- assume HE: injl t = unit.
  prove False.
  apply neq_unit_injl t. symmetry. exact HE.
- let t' a' b'.
  assume Ht': ev t' a' b'.
  assume Ht: injl t = injl t'.
  assume Ha: a = a'.
  assume Hb: b = injl_interp b'.
  witness b'.
  apply andI.
  + rewrite injl_inj t t' Ht. rewrite Ha. exact Ht'.
  + exact Hb.
- let t' a' b'. assume _.
  assume HE: injl t = injr t'.
  prove False.
  exact neq_injl_injr t t' HE.
- let s' t' a' b' d'. assume _ _.
  assume HE: injl t = case s' t'.
  prove False.
  exact neq_injl_case t s' t' HE.
- let s' t' a' c' d'. assume _ _.
  assume HE: injl t = case s' t'.
  prove False.
  exact neq_injl_case t s' t' HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: injl t = spair s' t'.
  prove False.
  exact neq_injl_spair t s' t' HE.
- let t' a' b' c'. assume _.
  assume HE: injl t = take t'.
  prove False.
  exact neq_injl_take t t' HE.
- let t' a' b' c'. assume _.
  assume HE: injl t = drop t'.
  prove False.
  exact neq_injl_drop t t' HE.
Qed.

Theorem ev_injr_inv : forall t a b, ev (injr t) a b -> exists b', ev t a b' /\ b = injr_interp b'.
let t a b. assume H. apply ev_inv (injr t) a b H.
- assume HE: injr t = iden.
  prove False.
  apply neq_iden_injr t. symmetry. exact HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: injr t = comp s' t'.
  prove False.
  apply neq_comp_injr s' t' t. symmetry. exact HE.
- assume HE: injr t = unit.
  prove False.
  apply neq_unit_injr t. symmetry. exact HE.
- let t' a' b'. assume _.
  assume HE: injr t = injl t'.
  prove False.
  apply neq_injl_injr t' t. symmetry. exact HE.
- let t' a' b'.
  assume Ht': ev t' a' b'.
  assume Ht: injr t = injr t'.
  assume Ha: a = a'.
  assume Hb: b = injr_interp b'.
  witness b'.
  apply andI.
  + rewrite injr_inj t t' Ht. rewrite Ha. exact Ht'.
  + exact Hb.
- let s' t' a' b' d'. assume _ _.
  assume HE: injr t = case s' t'.
  prove False.
  exact neq_injr_case t s' t' HE.
- let s' t' a' c' d'. assume _ _.
  assume HE: injr t = case s' t'.
  prove False.
  exact neq_injr_case t s' t' HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: injr t = spair s' t'.
  prove False.
  exact neq_injr_spair t s' t' HE.
- let t' a' b' c'. assume _.
  assume HE: injr t = take t'.
  prove False.
  exact neq_injr_take t t' HE.
- let t' a' b' c'. assume _.
  assume HE: injr t = drop t'.
  prove False.
  exact neq_injr_drop t t' HE.
Qed.

Theorem ev_case_inv : forall s t a b, ev (case s t) a b -> (exists a' c', a = spair_interp (injl_interp a') c' /\ ev s (spair_interp a' c') b) \/ (exists b' c', a = spair_interp (injr_interp b') c' /\ ev t (spair_interp b' c') b).
let s t a b. assume H. apply ev_inv (case s t) a b H.
- assume HE: case s t = iden.
  prove False.
  apply neq_iden_case s t. symmetry. exact HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: case s t = comp s' t'.
  prove False.
  apply neq_comp_case s' t' s t. symmetry. exact HE.
- assume HE: case s t = unit.
  prove False.
  apply neq_unit_case s t. symmetry. exact HE.
- let t' a' b'. assume _.
  assume HE: case s t = injl t'.
  prove False.
  apply neq_injl_case t' s t. symmetry. exact HE.
- let t' a' b'. assume _.
  assume HE: case s t = injr t'.
  prove False.
  apply neq_injr_case t' s t. symmetry. exact HE.
- let s' t' a' c' d'. assume Ht' Hs'.
  assume HE: case s t = case s' t'.
  assume Ha: a = spair_interp (injl_interp a') c'.
  assume Hb: b = d'.
  apply case_inj s t s' t' HE.
  assume HE1: s = s'.
  assume HE2: t = t'.
  apply orIL.
  witness a'. witness c'. apply andI.
  + exact Ha.
  + rewrite HE1. rewrite Hb. exact Hs'.
- let s' t' b' c' d'. assume Hs' Ht'.
  assume HE: case s t = case s' t'.
  assume Ha: a = spair_interp (injr_interp b') c'.
  assume Hb: b = d'.
  apply case_inj s t s' t' HE.
  assume HE1: s = s'.
  assume HE2: t = t'.
  apply orIR.
  witness b'. witness c'. apply andI.
  + exact Ha.
  + rewrite HE2. rewrite Hb. exact Ht'.
- let s' t' a' b' c'. assume _ _.
  assume HE: case s t = spair s' t'.
  prove False.
  exact neq_case_spair s t s' t' HE.
- let t' a' b' c'. assume _.
  assume HE: case s t = take t'.
  prove False.
  exact neq_case_take s t t' HE.
- let t' a' b' c'. assume _.
  assume HE: case s t = drop t'.
  prove False.
  exact neq_case_drop s t t' HE.
Qed.

Theorem ev_spair_inv : forall s t a b, ev (spair s t) a b -> exists b' c', ev s a b' /\ ev t a c' /\ b = spair_interp b' c'.
let s t a b. assume H. apply ev_inv (spair s t) a b H.
- assume HE: spair s t = iden.
  prove False.
  apply neq_iden_spair s t. symmetry. exact HE.
- let s' t' a' b' c'. assume Hs' Ht'.
  assume HE: spair s t = comp s' t'.
  prove False.
  apply neq_comp_spair s' t' s t.
  symmetry.
  exact HE.
- assume HE: spair s t = unit.
  prove False.
  apply neq_unit_spair s t.
  symmetry.
  exact HE.
- let t' a' b'. assume _.
  assume HE: spair s t = injl t'.
  prove False.
  apply neq_injl_spair t' s t.
  symmetry.
  exact HE.
- let t' a' b'. assume _.
  assume HE: spair s t = injr t'.
  prove False.
  apply neq_injr_spair t' s t.
  symmetry.
  exact HE.
- let s' t' a' b' d'. assume _ _.
  assume HE: spair s t = case s' t'.
  prove False.
  apply neq_case_spair s' t' s t.
  symmetry.
  exact HE.
- let s' t' a' c' d'. assume _ _.
  assume HE: spair s t = case s' t'.
  prove False.
  apply neq_case_spair s' t' s t.
  symmetry.
  exact HE.
- let s' t' a' b' c'. assume Hs' Ht'.
  assume HE: spair s t = spair s' t'.
  assume Ha: a = a'.
  assume Hb: b = spair_interp b' c'.
  apply spair_inj s t s' t' HE.
  assume HE1: s = s'.
  assume HE2: t = t'.
  witness b'.
  witness c'.
  apply and3I.
  + rewrite HE1. rewrite Ha. exact Hs'.
  + rewrite HE2. rewrite Ha. exact Ht'.
  + exact Hb.
- let t' a' b' c'. assume _.
  assume HE: spair s t = take t'.
  prove False.
  exact neq_spair_take s t t' HE.
- let t' a' b' c'. assume _.
  assume HE: spair s t = drop t'.
  prove False.
  exact neq_spair_drop s t t' HE.
Qed.

Theorem ev_take_inv : forall t a b, ev (take t) a b -> exists a' b', a = spair_interp a' b' /\ ev t a' b.
let t a b. assume H. apply ev_inv (take t) a b H.
- assume HE: take t = iden.
  prove False.
  apply neq_iden_take t. symmetry. exact HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: take t = comp s' t'.
  prove False.
  apply neq_comp_take s' t' t. symmetry. exact HE.
- assume HE: take t = unit.
  prove False.
  apply neq_unit_take t. symmetry. exact HE.
- let t' a' b'. assume _.
  assume HE: take t = injl t'.
  prove False.
  apply neq_injl_take t' t. symmetry. exact HE.
- let t' a' b'. assume _.
  assume HE: take t = injr t'.
  prove False.
  apply neq_injr_take t' t. symmetry. exact HE.
- let s' t' a' b' d'. assume _ _.
  assume HE: take t = case s' t'.
  prove False.
  apply neq_case_take s' t' t. symmetry. exact HE.
- let s' t' a' c' d'. assume _ _.
  assume HE: take t = case s' t'.
  prove False.
  apply neq_case_take s' t' t. symmetry. exact HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: take t = spair s' t'.
  prove False.
  apply neq_spair_take s' t' t.
  symmetry.
  exact HE.
- let t' a' b' c'. assume Ht'.
  assume HE: take t = take t'.
  assume Ha: a = spair_interp a' b'.
  assume Hb: b = c'.
  witness a'.
  witness b'.
  apply andI.
  + exact Ha.
  + rewrite Hb. rewrite take_inj t t' HE. exact Ht'.
- let t' a' b' c'. assume _.
  assume HE: take t = drop t'.
  prove False.
  exact neq_take_drop t t' HE.
Qed.

Theorem ev_drop_inv : forall t a b, ev (drop t) a b -> exists a' b', a = spair_interp a' b' /\ ev t b' b.
let t a b. assume H. apply ev_inv (drop t) a b H.
- assume HE: drop t = iden.
  prove False.
  apply neq_iden_drop t. symmetry. exact HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: drop t = comp s' t'.
  prove False.
  apply neq_comp_drop s' t' t. symmetry. exact HE.
- assume HE: drop t = unit.
  prove False.
  apply neq_unit_drop t. symmetry. exact HE.
- let t' a' b'. assume _.
  assume HE: drop t = injl t'.
  prove False.
  apply neq_injl_drop t' t. symmetry. exact HE.
- let t' a' b'. assume _.
  assume HE: drop t = injr t'.
  prove False.
  apply neq_injr_drop t' t. symmetry. exact HE.
- let s' t' a' b' d'. assume _ _.
  assume HE: drop t = case s' t'.
  prove False.
  apply neq_case_drop s' t' t. symmetry. exact HE.
- let s' t' a' c' d'. assume _ _.
  assume HE: drop t = case s' t'.
  prove False.
  apply neq_case_drop s' t' t. symmetry. exact HE.
- let s' t' a' b' c'. assume _ _.
  assume HE: drop t = spair s' t'.
  prove False.
  apply neq_spair_drop s' t' t. symmetry. exact HE.
- let t' a' b' c'. assume _.
  assume HE: drop t = take t'.
  prove False.
  apply neq_take_drop t' t.
  symmetry.
  exact HE.
- let t' a' b' c'. assume Ht'.
  assume HE: drop t = drop t'.
  assume Ha: a = spair_interp a' b'.
  assume Hb: b = c'.
  witness a'.
  witness b'.
  apply andI.
  + exact Ha.
  + rewrite Hb. rewrite drop_inj t t' HE. exact Ht'.
Qed.

Theorem ev_sound : forall t A B, of t A B -> forall X Y:set -> prop, tyev A X -> tyev B Y -> forall a b, X a -> ev t a b -> Y b.
Admitted.

Definition SwapSpec : set -> set -> prop
  := fun x y =>
     (forall z, x = injl_interp z -> y = injr_interp z)
     /\
     (forall z, x = injr_interp z -> y = injl_interp z).

Theorem ExSwap : forall A, type_p A
  -> exists t, of t (A + A) (A + A)
      /\ forall X:set -> prop, tyev A X
            -> forall x y, sum_interp X X x -> SwapSpec x y -> ev t x y.
Admitted.
