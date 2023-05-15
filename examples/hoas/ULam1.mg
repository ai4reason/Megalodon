Definition ap : set -> set -> set := fun x y => pair nil (pair x y).
Definition lam : (set -> set) -> set := fun f => pair nil (bind f).

Theorem ap_inj : forall x y z w, ap x y = ap z w -> forall p:prop, (x = z -> y = w -> p) -> p.
let x y z w. assume H1.
apply pair_inj nil (pair x y) nil (pair z w) H1.
assume _.
exact pair_inj x y z w.
Qed.

Theorem lam_inj : forall f g:set -> set, lam f = lam g -> f = g.
let f g. assume H1.
apply pair_inj nil (bind f) nil (bind g) H1.
assume _.
exact bind_inj f g.
Qed.

Theorem ap_not_lam : forall x y, forall f:set -> set, ap x y = lam f -> forall p:prop, p.
let x y f.
assume H1: pair nil (pair x y) = pair nil (bind f).
apply pair_inj nil (pair x y) nil (bind f) H1.
assume _.
exact pair_not_bind x y f.
Qed.

Definition ulamp : (set -> prop) -> set -> prop := fun G x =>
  forall p:(set -> prop) -> set -> prop,
       (forall G:set -> prop, forall y, G y -> p G y)
    -> (forall G:set -> prop, forall f:set -> set, (forall x, p (adj G x) (f x)) -> p G (lam f))
    -> (forall G:set -> prop, forall y z, p G y -> p G z -> p G (ap y z))
    -> p G x.

Theorem ulamp_var : forall G:set -> prop, forall x, G x -> ulamp G x.
let G x. assume H1.
let p. assume H2 H3 H4. apply H2. exact H1.
Qed.

Theorem ulamp_lam : forall G:set -> prop, forall f:set -> set, (forall x, ulamp (adj G x) (f x)) -> ulamp G (lam f).
let G f. assume Hf.
let p. assume H1 H2 H3. apply H2.
prove forall y, p (adj G y) (f y).
let y. exact Hf y p H1 H2 H3.
Qed.

Theorem ulamp_ap : forall G:set -> prop, forall x y, ulamp G x -> ulamp G y -> ulamp G (ap x y).
let G x y. assume Hx Hy.
let p. assume H1 H2 H3. apply H3.
- exact Hx p H1 H2 H3.
- exact Hy p H1 H2 H3.
Qed.

Definition beta1 : (set -> prop) -> set -> set -> prop := fun G x y =>
  forall r:(set -> prop) -> set -> set -> prop,
       (forall G:set -> prop, forall f:set -> set, forall z, (forall x, ulamp (adj G x) (f x)) -> ulamp G z -> r G (ap (lam f) z) (f z))
    -> (forall G:set -> prop, forall f g:set -> set, (forall z, r (adj G z) (f z) (g z)) -> r G (lam f) (lam g))
    -> (forall G:set -> prop, forall x y z, r G x z -> ulamp G y -> r G (ap x y) (ap z y))
    -> (forall G:set -> prop, forall x y z, r G y z -> ulamp G x -> r G (ap x y) (ap x z))
    -> r G x y.

Theorem beta1_beta : forall G:set -> prop, forall f:set -> set, forall x, (forall y, ulamp (adj G y) (f y)) -> ulamp G x -> beta1 G (ap (lam f) x) (f x).
let G f x. assume H1 H2.
let r. assume H3 H4 H5 H6.
prove r G (ap (lam f) x) (f x).
apply H3.
- exact H1.
- exact H2.
Qed.

Theorem beta1_lam : forall G:set -> prop, forall f g:set -> set, (forall z, beta1 (adj G z) (f z) (g z)) -> beta1 G (lam f) (lam g).
let G f g. assume Hfg.
let r. assume H1 H2 H3 H4.
apply H2 G f g.
let z.
exact Hfg z r H1 H2 H3 H4.
Qed.

Theorem beta1_ap1 : forall G:set -> prop, forall x y z, beta1 G x z -> ulamp G y -> beta1 G (ap x y) (ap z y).
let G x y z. assume Hxz Hy.
let r. assume H1 H2 H3 H4.
apply H3.
- exact Hxz r H1 H2 H3 H4.
- exact Hy.
Qed.

Theorem beta1_ap2 : forall G:set -> prop, forall x y z, beta1 G y z -> ulamp G x -> beta1 G (ap x y) (ap x z).
let G x y z. assume Hyz Hx.
let r. assume H1 H2 H3 H4.
apply H4.
- exact Hyz r H1 H2 H3 H4.
- exact Hx.
Qed.

Definition betared : (set -> prop) -> set -> set -> prop := fun G => transclos (beta1 G).

Theorem betared_beta1 : forall G:set -> prop, forall x y, beta1 G x y -> betared G x y.
let G x y. assume Hxy.
prove transclos (beta1 G) x y.
apply transclos_incl.
exact Hxy.
Qed.

Theorem betared_beta : forall G:set -> prop, forall f:set -> set, forall x, (forall y, ulamp (adj G y) (f y)) -> ulamp G x -> betared G (ap (lam f) x) (f x).
let G f x. assume H1 H2.
apply betared_beta1.
exact beta1_beta G f x H1 H2.
Qed.

Theorem betared_tra : forall G:set -> prop, forall x y z, betared G x y -> betared G y z -> betared G x z.
let G. exact transclos_tra (beta1 G).
Qed.

Definition eqclos : (set -> prop) -> (set -> set -> prop) -> set -> set -> prop :=
  fun dom q x y =>
   forall r:set -> set -> prop,
        (forall x y, q x y -> r x y)
     -> (forall x, dom x -> r x x)
     -> (forall x y, r x y -> r y x)
     -> (forall x y z, r x y -> r y z -> r x z)
     -> r x y.

Theorem eqclos_incl : forall dom:set -> prop, forall q:set -> set -> prop, forall x y, q x y -> eqclos dom q x y.
let dom q x y. assume Hxy.
let r. assume H1 H2 H3 H4.
apply H1. exact Hxy.
Qed.

Theorem eqclos_ref : forall dom:set -> prop, forall q:set -> set -> prop, forall x, dom x -> eqclos dom q x x.
let dom q x. assume Hx.
let r. assume H1 H2 H3 H4.
apply H2. exact Hx.
Qed.

Theorem eqclos_sym : forall dom:set -> prop, forall q:set -> set -> prop, forall x y, eqclos dom q x y -> eqclos dom q y x.
let dom q x y. assume Hxy.
let r. assume H1 H2 H3 H4.
apply H3. exact Hxy r H1 H2 H3 H4.
Qed.

Theorem eqclos_tra : forall dom:set -> prop, forall q:set -> set -> prop, forall x y z, eqclos dom q x y -> eqclos dom q y z -> eqclos dom q x z.
let dom q x y z. assume Hxy Hyz.
let r. assume H1 H2 H3 H4.
apply H4 x y z.
- exact Hxy r H1 H2 H3 H4.
- exact Hyz r H1 H2 H3 H4.
Qed.

Definition betaeq : (set -> prop) -> set -> set -> prop := fun G => eqclos (ulamp G) (beta1 G).

Theorem betaeq_beta1 : forall G:set -> prop, forall x y, beta1 G x y -> betaeq G x y.
let G x y. assume Hxy.
prove eqclos (ulamp G) (beta1 G) x y.
apply eqclos_incl.
exact Hxy.
Qed.

Theorem betaeq_beta : forall G:set -> prop, forall f:set -> set, forall x, (forall y, ulamp (adj G y) (f y)) -> ulamp G x -> betaeq G (ap (lam f) x) (f x).
let G f x. assume H1 H2.
apply betaeq_beta1.
exact beta1_beta G f x H1 H2.
Qed.

Theorem betaeq_ref : forall G:set -> prop, forall x, ulamp G x -> betaeq G x x.
let G x. assume Hx: ulamp G x.
prove betaeq G x x.
prove eqclos (ulamp G) (beta1 G) x x.
apply eqclos_ref.
exact Hx.
Qed.

Theorem betaeq_sym : forall G:set -> prop, forall x y, betaeq G x y -> betaeq G y x.
let G x y. assume Hxy.
prove eqclos (ulamp G) (beta1 G) y x.
apply eqclos_sym.
exact Hxy.
Qed.

Theorem betaeq_tra : forall G:set -> prop, forall x y z, betaeq G x y -> betaeq G y z -> betaeq G x z.
let G x y z. assume Hxy Hyz.
prove eqclos (ulamp G) (beta1 G) x z.
apply eqclos_tra (ulamp G) (beta1 G) x y z.
- exact Hxy.
- exact Hyz.
Qed.

Theorem ulam_id_ex : exists F, ulamp emp F /\ forall x, betaeq (adj emp x) (ap F x) x.
Admitted.

Theorem ulam_fp_ex : exists Y, ulamp emp Y /\ forall f, betaeq (adj emp f) (ap Y f) (ap f (ap Y f)).
Admitted.
