(** Local Preamble **)
Definition False : prop := forall p:prop, p.

Definition not : prop -> prop := fun A:prop => A -> False.

(* Unicode ~ "00ac" *)
Prefix ~ 700 := not.

Definition and : prop -> prop -> prop := fun A B:prop => forall p:prop, (A -> B -> p) -> p.

(* Unicode /\ "2227" *)
Infix /\ 780 left := and.

Axiom andI : forall (A B : prop), A -> B -> A /\ B.

Definition or : prop -> prop -> prop := fun A B:prop => forall p:prop, (A -> p) -> (B -> p) -> p.

(* Unicode \/ "2228" *)
Infix \/ 785 left := or.

Axiom xm : forall P:prop, P \/ ~P.

Section Eq.
Variable A:SType.
Definition eq : A->A->prop := fun x y:A => forall Q:A->A->prop, Q x y -> Q y x.
End Eq.

Infix = 502 := eq.

Section Ex.
Variable A:SType.
Definition ex : (A->prop)->prop := fun Q:A->prop => forall P:prop, (forall x:A, Q x -> P) -> P.
End Ex.

Parameter In:set->set->prop.

Definition Subq : set -> set -> prop := fun A B => forall x :e A, x :e B.

Axiom set_ext : forall X Y:set, X c= Y -> Y c= X -> X = Y.

(* Unicode exists "2203" *)
Binder+ exists , := ex; and.

Definition nIn : set->set->prop :=
fun x X => ~In x X.

(* Unicode /:e "2209" *)
Infix /:e 502 := nIn.

(* Unicode Power "1D4AB" *)
Parameter Power : set->set.

Axiom PowerI : forall X Y:set, Y c= X -> Y :e Power X.
Axiom PowerE : forall X Y:set, Y :e Power X -> Y c= X.

Parameter Repl : set -> (set -> set) -> set.
Notation Repl Repl.

Axiom ReplI : forall A:set, forall F:set->set, forall x:set, x :e A -> F x :e {F x|x :e A}.

Axiom ReplE_impred : forall A:set, forall F:set->set, forall y:set, y :e {F x|x :e A} -> forall p:prop, (forall x:set, x :e A -> y = F x -> p) -> p.

(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep: set -> (set -> prop) -> set.

Notation Sep Sep.

Axiom SepI:forall X:set, forall P:(set->prop), forall x:set, x :e X -> P x -> x :e {x :e X|P x}.
Axiom SepE2:forall X:set, forall P:(set->prop), forall x:set, x :e {x :e X|P x} -> P x.

Axiom Sep_In_Power : forall X:set, forall P:set->prop, {x :e X|P x} :e Power X.

(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus:set->set->set.

(* Unicode :\: "2216" *)
Infix :\: 350 := setminus.

Axiom setminusI:forall X Y z, (z :e X) -> (z /:e Y) -> z :e X :\: Y.
Axiom setminusE:forall X Y z, (z :e X :\: Y) -> z :e X /\ z /:e Y.
Axiom setminusE1:forall X Y z, (z :e X :\: Y) -> z :e X.
Axiom setminus_Subq:forall X Y:set, X :\: Y c= X.

(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop->set->set->set.

Notation IfThenElse If_i.

Axiom If_i_0 : forall p:prop, forall x y:set,
~ p -> (if p then x else y) = y.

Axiom If_i_1 : forall p:prop, forall x y:set,
p -> (if p then x else y) = x.

Definition inj : set->set->(set->set)->prop :=
  fun X Y f =>
  (forall u :e X, f u :e Y)
  /\
  (forall u v :e X, f u = f v -> u = v).

(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set->set->(set->set)->prop.

Definition equip : set -> set -> prop
 := fun X Y : set => exists f : set -> set, bij X Y f.

Axiom bijI : forall X Y, forall f:set -> set,
    (forall u :e X, f u :e Y)
 -> (forall u v :e X, f u = f v -> u = v)
 -> (forall w :e Y, exists u :e X, f u = w)
 -> bij X Y f.

(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.

Axiom inj_linv : forall X, forall f:set->set, (forall u v :e X, f u = f v -> u = v) -> forall x :e X, inv X f (f x) = x.

(** Body **)
Theorem KnasterTarski_set: forall A, forall F:set->set,
    (forall U :e Power A, F U :e Power A)
 -> (forall U V :e Power A, U c= V -> F U c= F V)
 -> exists Y :e Power A, F Y = Y.
let A F. assume H1 H2.
set Y : set := {u :e A|forall X :e Power A, F X c= X -> u :e X}.
claim L1: Y :e Power A.
{ apply Sep_In_Power. }
claim L2: F Y :e Power A.
{ exact H1 Y L1. }
claim L3: forall X :e Power A, F X c= X -> Y c= X.
{ let X. assume HX: X :e Power A.
  assume H3: F X c= X.
  let y. assume Hy: y :e Y.
  exact SepE2 A (fun u => forall X :e Power A, F X c= X -> u :e X) y Hy X HX H3.
}
claim L4: F Y c= Y.
{ let u. assume H3: u :e F Y. prove u :e Y.
  apply SepI.
  - prove u :e A. exact PowerE A (F Y) L2 u H3.
  - let X. assume HX: X :e Power A.
    assume H4: F X c= X.
    prove u :e X.
    claim L4a: Y c= X.
    { exact L3 X HX H4. }
    claim L4b: F Y c= F X.
    { exact H2 Y L1 X HX L4a. }
    prove u :e X. apply H4. prove u :e F X. apply L4b. exact H3.
}
claim L5: F (F Y) c= F Y.
{ exact H2 (F Y) L2 Y L1 L4. }
witness Y.
apply andI.
- exact L1.
- apply set_ext.
  + exact L4.
  + prove Y c= F Y. apply L3.
    * exact L2.
    * exact L5.
Qed.

Theorem image_In_Power : forall A B, forall f:set -> set, (forall x :e A, f x :e B) -> forall U :e Power A, {f x|x :e U} :e Power B.
let A B f. assume Hf.
let U. assume HU. apply PowerI.
let y. assume Hy: y :e {f x|x :e U}.
apply ReplE_impred U f y Hy.
let x.
assume Hx: x :e U.
assume H1: y = f x. rewrite H1. apply Hf.
prove x :e A.
apply PowerE A U HU.
exact Hx.
Qed.

Theorem image_monotone : forall f:set -> set, forall U V, U c= V -> {f x|x :e U} c= {f x|x :e V}.
let f U V. assume HUV.
let y. assume Hy: y :e {f x|x :e U}.
apply ReplE_impred U f y Hy.
let x.
assume Hx: x :e U.
assume H1: y = f x. rewrite H1.
prove f x :e {f x|x :e V}.
apply ReplI. apply HUV. exact Hx.
Qed.

Theorem setminus_In_Power : forall A U, A :\: U :e Power A.
let A U. apply PowerI. apply setminus_Subq.
Qed.

Theorem setminus_antimonotone : forall A U V, U c= V -> A :\: V c= A :\: U.
let A U V. assume HUV.
let x. assume Hx. apply setminusE A V x Hx.
assume H1 H2. apply setminusI.
- exact H1.
- assume H3: x :e U. apply H2. prove x :e V. exact HUV x H3.
Qed.

Theorem SchroederBernstein: forall A B, forall f g:set -> set, inj A B f -> inj B A g -> equip A B.
let A B f g. assume Hf Hg.
apply Hf. assume Hf1 Hf2.
apply Hg. assume Hg1 Hg2.
set F : set -> set := fun X => {g y|y :e B :\: {f x|x :e A :\: X}}.
claim L1: forall U :e Power A, F U :e Power A.
{ let U. assume HU.
  prove {g y|y :e B :\: {f x|x :e A :\: U}} :e Power A.
  apply image_In_Power B A g Hg1.
  prove B :\: {f x|x :e A :\: U} :e Power B.
  apply setminus_In_Power.
}
claim L2: forall U V :e Power A, U c= V -> F U c= F V.
{ let U. assume HU. let V. assume HV HUV.
  prove {g y|y :e B :\: {f x|x :e A :\: U}} c= {g y|y :e B :\: {f x|x :e A :\: V}}.
  apply image_monotone g.
  prove B :\: {f x|x :e A :\: U} c= B :\: {f x|x :e A :\: V}.
  apply setminus_antimonotone.
  prove {f x|x :e A :\: V} c= {f x|x :e A :\: U}.
  apply image_monotone f.
  prove A :\: V c= A :\: U. apply setminus_antimonotone. exact HUV.
}
apply KnasterTarski_set A F L1 L2.
let Y. assume H1. apply H1.
assume H1: Y :e Power A.
assume H2: F Y = Y.
set h : set -> set := fun x => if x :e Y then inv B g x else f x.
prove exists f:set -> set, bij A B f.
witness h.
apply bijI.
- let x. assume Hx.
  prove (if x :e Y then inv B g x else f x) :e B.
  apply xm (x :e Y).
  + assume H3: x :e Y. rewrite If_i_1 (x :e Y) (inv B g x) (f x) H3.
    prove inv B g x :e B.
    claim L1: x :e F Y.
    { rewrite H2. exact H3. }
    apply ReplE_impred (B :\: {f x|x :e A :\: Y}) g x L1.
    let y. assume H4: y :e B :\: {f x|x :e A :\: Y}.
    assume H5: x = g y.
    claim L2: y :e B.
    { exact setminusE1 B {f x|x :e A :\: Y} y H4. }
    rewrite H5. prove inv B g (g y) :e B.
    rewrite inj_linv B g Hg2 y L2.
    prove y :e B. exact L2.
  + assume H3: x /:e Y. rewrite If_i_0 (x :e Y) (inv B g x) (f x) H3.
    prove f x :e B. apply Hf1. exact Hx.
- let x. assume Hx. let y. assume Hy.
  prove (if x :e Y then inv B g x else f x)
      = (if y :e Y then inv B g y else f y)
     -> x = y.
  apply xm (x :e Y).
  + assume H3: x :e Y. rewrite If_i_1 (x :e Y) (inv B g x) (f x) H3.
    prove inv B g x = (if y :e Y then inv B g y else f y)
       -> x = y.
    claim Lx: x :e F Y.
    { rewrite H2. exact H3. }
    apply ReplE_impred (B :\: {f x|x :e A :\: Y}) g x Lx.
    let z.
    assume Hz1: z :e B :\: {f x|x :e A :\: Y}.
    assume Hz2: x = g z.
    apply setminusE B {f x|x :e A :\: Y} z Hz1.
    assume Hz1a Hz1b.
    apply xm (y :e Y).
    * { assume H4: y :e Y. rewrite If_i_1 (y :e Y) (inv B g y) (f y) H4.
        prove inv B g x = inv B g y -> x = y.
        claim Ly: y :e F Y.
        { rewrite H2. exact H4. }
        apply ReplE_impred (B :\: {f x|x :e A :\: Y}) g y Ly.
        let w.
        assume Hw1: w :e B :\: {f x|x :e A :\: Y}.
        assume Hw2: y = g w.
	rewrite Hz2. rewrite Hw2.
	rewrite inj_linv B g Hg2 z Hz1a.
	rewrite inj_linv B g Hg2 w (setminusE1 B {f x|x :e A :\: Y} w Hw1).
	assume H5: z = w.
	prove g z = g w.
	f_equal. exact H5.
      }
    * { assume H4: y /:e Y. rewrite If_i_0 (y :e Y) (inv B g y) (f y) H4.
        prove inv B g x = f y -> x = y.
	rewrite Hz2.
	rewrite inj_linv B g Hg2 z Hz1a.
	prove z = f y -> g z = y.
	assume H5: z = f y.
	prove False.
	apply Hz1b.
	prove z :e {f x|x :e A :\: Y}.
	rewrite H5.
	apply ReplI.
	prove y :e A :\: Y.
	apply setminusI.
	+ exact Hy.
	+ exact H4.
      }
  + assume H3: x /:e Y. rewrite If_i_0 (x :e Y) (inv B g x) (f x) H3.
    prove f x = (if y :e Y then inv B g y else f y)
       -> x = y.
    apply xm (y :e Y).
    * { assume H4: y :e Y. rewrite If_i_1 (y :e Y) (inv B g y) (f y) H4.
        prove f x = inv B g y -> x = y.
        claim Ly: y :e F Y.
        { rewrite H2. exact H4. }
        apply ReplE_impred (B :\: {f x|x :e A :\: Y}) g y Ly.
        let w.
        assume Hw1: w :e B :\: {f x|x :e A :\: Y}.
        assume Hw2: y = g w.
	apply setminusE B {f x|x :e A :\: Y} w Hw1.
	assume Hw1a Hw1b.
	rewrite Hw2.
	rewrite inj_linv B g Hg2 w Hw1a.
	assume H5: f x = w.
	prove False.
	apply Hw1b.
	prove w :e {f x|x :e A :\: Y}.
	rewrite <- H5.
	apply ReplI. apply setminusI.
	- exact Hx.
	- exact H3.
      }
    * { assume H4: y /:e Y. rewrite If_i_0 (y :e Y) (inv B g y) (f y) H4.
        prove f x = f y -> x = y.
	exact Hf2 x Hx y Hy.
      }
- let w. assume Hw: w :e B.
  apply xm (w :e {f x|x :e A :\: Y}).
  + assume H3: w :e {f x|x :e A :\: Y}.
    apply ReplE_impred (A :\: Y) f w H3.
    let x. assume H4: x :e A :\: Y.
    assume H5: w = f x.
    apply setminusE A Y x H4.
    assume H6: x :e A.
    assume H7: x /:e Y.
    witness x. apply andI.
    * exact H6.
    * prove (if x :e Y then inv B g x else f x) = w.
      rewrite If_i_0 (x :e Y) (inv B g x) (f x) H7.
      symmetry. exact H5.
  + assume H3: w /:e {f x|x :e A :\: Y}.
    claim Lgw: g w :e Y.
    { rewrite <- H2. prove g w :e F Y.
      prove g w :e {g y|y :e B :\: {f x|x :e A :\: Y}}.
      apply ReplI.
      apply setminusI.
      - prove w :e B. exact Hw.
      - prove w /:e {f x|x :e A :\: Y}. exact H3.
    }
    witness (g w). apply andI.
    * prove g w :e A. apply Hg1. exact Hw.
    * prove (if g w :e Y then inv B g (g w) else f (g w)) = w.
      rewrite If_i_1 (g w :e Y) (inv B g (g w)) (f (g w)) Lgw.
      exact inj_linv B g Hg2 w Hw.
Qed.
