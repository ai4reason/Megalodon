(* Parameter Eps_i "174b78e53fc239e8c2aab4ab5a996a27e3e5741e88070dad186e05fb13f275e5" *)
Parameter Eps_i : (set->prop)->set.

Axiom Eps_i_ax : forall P:set->prop, forall x:set, P x -> P (Eps_i P).

Definition True : prop := forall p:prop, p -> p.
Definition False : prop := forall p:prop, p.

Definition not : prop -> prop := fun A:prop => A -> False.

(* Unicode ~ "00ac" *)
Prefix ~ 700 := not.

Definition and : prop -> prop -> prop := fun A B:prop => forall p:prop, (A -> B -> p) -> p.

(* Unicode /\ "2227" *)
Infix /\ 780 left := and.

Definition or : prop -> prop -> prop := fun A B:prop => forall p:prop, (A -> p) -> (B -> p) -> p.

(* Unicode \/ "2228" *)
Infix \/ 785 left := or.

Definition iff : prop -> prop -> prop := fun A B:prop => and (A -> B) (B -> A).

(* Unicode <-> "2194" *)
Infix <-> 805 := iff.

Section Eq.
Variable A:SType.
Definition eq : A->A->prop := fun x y:A => forall Q:A->A->prop, Q x y -> Q y x.
Definition neq : A->A->prop := fun x y:A => ~ eq x y.
End Eq.

Infix = 502 := eq.
(* Unicode <> "2260" *)
Infix <> 502 := neq.

Section FE.
Variable A B : SType.
Axiom func_ext : forall f g : A -> B , (forall x : A , f x = g x) -> f = g.
End FE.

Section Ex.
Variable A:SType.
Definition ex : (A->prop)->prop := fun Q:A->prop => forall P:prop, (forall x:A, Q x -> P) -> P.
End Ex.

(* Unicode exists "2203" *)
Binder+ exists , := ex.

Axiom prop_ext : forall p q:prop, iff p q -> p = q.

Parameter In:set->set->prop.

Definition Subq : set -> set -> prop := fun A B => forall x :e A, x :e B.

Axiom set_ext : forall X Y:set, X c= Y -> Y c= X -> X = Y.

Axiom In_ind : forall P:set->prop, (forall X:set, (forall x :e X, P x) -> P X) -> forall X:set, P X.

Binder+ exists , := ex; and.

Parameter Empty : set.
Axiom EmptyAx : ~exists x:set, x :e Empty.

(* Unicode Union "22C3" *)
Parameter Union : set->set.

Axiom UnionEq : forall X x, x :e Union X <-> exists Y, x :e Y /\ Y :e X.

(* Unicode Power "1D4AB" *)
Parameter Power : set->set.

Axiom PowerEq : forall X Y:set, Y :e Power X <-> Y c= X.

Parameter Repl : set -> (set -> set) -> set.
Notation Repl Repl.

Axiom ReplEq : forall A:set, forall F:set->set, forall y:set, y :e {F x|x :e A} <-> exists x :e A, y = F x.

Definition TransSet : set->prop := fun U:set => forall x :e U, x c= U.

Definition Union_closed : set->prop := fun U:set => forall X:set, X :e U -> Union X :e U.
Definition Power_closed : set->prop := fun U:set => forall X:set, X :e U -> Power X :e U.
Definition Repl_closed : set->prop := fun U:set => forall X:set, X :e U -> forall F:set->set,
   (forall x:set, x :e X -> F x :e U) -> {F x|x :e X} :e U.
Definition ZF_closed : set->prop := fun U:set =>
   Union_closed U
/\ Power_closed U
/\ Repl_closed U.

Parameter UnivOf : set->set.

Axiom UnivOf_In : forall N:set, N :e UnivOf N.

Axiom UnivOf_TransSet : forall N:set, TransSet (UnivOf N).

Axiom UnivOf_ZF_closed : forall N:set, ZF_closed (UnivOf N).

Axiom UnivOf_Min : forall N U:set, N :e U
  -> TransSet U
  -> ZF_closed U
  -> UnivOf N c= U.

Theorem FalseE : False -> forall p:prop, p.
exact (fun H => H).
Qed.

Theorem TrueI : True.
exact (fun p H => H).
Qed.

Theorem andI : forall (A B : prop), A -> B -> A /\ B.
exact (fun A B a b P H => H a b).
Qed.

Theorem andEL : forall (A B : prop), A /\ B -> A.
exact (fun A B H => H A (fun a b => a)).
Qed.

Theorem andER : forall (A B : prop), A /\ B -> B.
exact (fun A B H => H B (fun a b => b)).
Qed.

Theorem orIL : forall (A B : prop), A -> A \/ B.
exact (fun A B a P H1 H2 => H1 a).
Qed.

Theorem orIR : forall (A B : prop), B -> A \/ B.
exact (fun A B b P H1 H2 => H2 b).
Qed.

Section PropN.

Variable P1 P2 P3:prop.

Theorem and3I : P1 -> P2 -> P3 -> P1 /\ P2 /\ P3.
exact (fun H1 H2 H3 => andI (P1 /\ P2) P3 (andI P1 P2 H1 H2) H3).
Qed.

Theorem and3E : P1 /\ P2 /\ P3 -> (forall p:prop, (P1 -> P2 -> P3 -> p) -> p).
exact (fun u p H => u p (fun u u3 => u p (fun u1 u2 => H u1 u2 u3))).
Qed.

Theorem or3I1 : P1 -> P1 \/ P2 \/ P3.
exact (fun u => orIL (P1 \/ P2) P3 (orIL P1 P2 u)).
Qed.

Theorem or3I2 : P2 -> P1 \/ P2 \/ P3.
exact (fun u => orIL (P1 \/ P2) P3 (orIR P1 P2 u)).
Qed.

Theorem or3I3 : P3 -> P1 \/ P2 \/ P3.
exact (orIR (P1 \/ P2) P3).
Qed.

Theorem or3E : P1 \/ P2 \/ P3 -> (forall p:prop, (P1 -> p) -> (P2 -> p) -> (P3 -> p) -> p).
exact (fun u p H1 H2 H3 => u p (fun u => u p H1 H2) H3).
Qed.

Variable P4:prop.

Theorem and4I : P1 -> P2 -> P3 -> P4 -> P1 /\ P2 /\ P3 /\ P4.
exact (fun H1 H2 H3 H4 => andI (P1 /\ P2 /\ P3) P4 (and3I H1 H2 H3) H4).
Qed.

Variable P5:prop.

Theorem and5I : P1 -> P2 -> P3 -> P4 -> P5 -> P1 /\ P2 /\ P3 /\ P4 /\ P5.
exact (fun H1 H2 H3 H4 H5 => andI (P1 /\ P2 /\ P3 /\ P4) P5 (and4I H1 H2 H3 H4) H5).
Qed.

End PropN.

Theorem not_or_and_demorgan : forall A B:prop, ~(A \/ B) -> ~A /\ ~B.
let A B.
assume u : ~(A \/ B).
apply andI.
- prove ~A. assume a:A. exact (u (orIL A B a)).
- prove ~B. assume b:B. exact (u (orIR A B b)).
Qed.

Theorem not_ex_all_demorgan_i : forall P:set->prop, (~exists x, P x) -> forall x, ~P x.
let P. assume H1. let x. assume H2. apply H1.
witness x.
exact H2.
Qed.

Theorem iffI : forall A B:prop, (A -> B) -> (B -> A) -> (A <-> B).
exact (fun A B => andI (A -> B) (B -> A)).
Qed.

Theorem iffEL : forall A B:prop, (A <-> B) -> A -> B.
exact (fun A B => andEL (A -> B) (B -> A)).
Qed.

Theorem iffER : forall A B:prop, (A <-> B) -> B -> A.
exact (fun A B => andER (A -> B) (B -> A)).
Qed.

Theorem iff_refl : forall A:prop, A <-> A.
exact (fun A:prop => andI (A -> A) (A -> A) (fun H : A => H) (fun H : A => H)).
Qed.

Theorem iff_sym : forall A B:prop, (A <-> B) -> (B <-> A).
let A B.
assume H1: (A -> B) /\ (B -> A).
apply H1.
assume H2: A -> B.
assume H3: B -> A.
exact iffI B A H3 H2.
Qed.

Theorem iff_trans : forall A B C: prop, (A <-> B) -> (B <-> C) -> (A <-> C).
let A B C.
assume H1: A <-> B.
assume H2: B <-> C.
apply H1.
assume H3: A -> B.
assume H4: B -> A.
apply H2.
assume H5: B -> C.
assume H6: C -> B.
exact (iffI A C (fun H => H5 (H3 H)) (fun H => H4 (H6 H))).
Qed.

Theorem eq_i_tra : forall x y z, x = y -> y = z -> x = z.
let x y z. assume H1 H2. rewrite <- H2. exact H1.
Qed.

Theorem f_eq_i : forall f:set -> set, forall x y, x = y -> f x = f y.
let f x y. assume H1. rewrite H1. reflexivity.
Qed.

Theorem neq_i_sym: forall x y, x <> y -> y <> x.
let x y. assume H1 H2. apply H1. symmetry. exact H2.
Qed.

Definition nIn : set->set->prop :=
fun x X => ~In x X.

(* Unicode /:e "2209" *)
Infix /:e 502 := nIn.

Theorem Eps_i_ex : forall P:set -> prop, (exists x, P x) -> P (Eps_i P).
let P. assume H1. apply H1.
let x. assume H2.
exact Eps_i_ax P x H2.
Qed.

Theorem pred_ext : forall P Q:set -> prop, (forall x, P x <-> Q x) -> P = Q.
let P Q. assume H1. apply func_ext set prop.
let x. apply prop_ext.
prove P x <-> Q x. exact H1 x.
Qed.

Theorem prop_ext_2 : forall p q:prop, (p -> q) -> (q -> p) -> p = q.
let p q. assume H1 H2. apply prop_ext. apply iffI.
- exact H1.
- exact H2.
Qed.

Theorem Subq_ref : forall X:set, X c= X.
exact (fun (X x : set) (H : x :e X) => H).
Qed.

Theorem Subq_tra : forall X Y Z:set, X c= Y -> Y c= Z -> X c= Z.
exact (fun (X Y Z : set) (H1 : X c= Y) (H2 : Y c= Z) (x : set) (H : x :e X) => (H2 x (H1 x H))).
Qed.

Theorem Subq_contra : forall X Y z:set, X c= Y -> z /:e Y -> z /:e X.
exact (fun X Y z H1 H2 H3 => H2 (H1 z H3)).
Qed.

Theorem EmptyE : forall x:set, x /:e Empty.
let x. assume H.
apply EmptyAx.
witness x. exact H.
Qed.

Theorem Subq_Empty : forall X:set, Empty c= X.
exact (fun (X x : set) (H : x :e Empty) => EmptyE x H (x :e X)).
Qed.

Theorem Empty_Subq_eq : forall X:set, X c= Empty -> X = Empty.
let X.
assume H1: X c= Empty.
apply set_ext.
- exact H1.
- exact (Subq_Empty X).
Qed.

Theorem Empty_eq : forall X:set, (forall x, x /:e X) -> X = Empty.
let X.
assume H1: forall x, x /:e X.
apply Empty_Subq_eq.
let x.
assume H2: x :e X.
prove False.
exact (H1 x H2).
Qed.

Theorem UnionI : forall X x Y:set, x :e Y -> Y :e X -> x :e Union X.
let X x Y.
assume H1: x :e Y.
assume H2: Y :e X.
apply UnionEq X x.
assume _ H3. apply H3.
prove exists Y:set, x :e Y /\ Y :e X.
witness Y.
apply andI.
- exact H1.
- exact H2.
Qed.

Theorem UnionE : forall X x:set, x :e Union X -> exists Y:set, x :e Y /\ Y :e X.
exact (fun X x : set => iffEL (x :e Union X) (exists Y:set, x :e Y /\ Y :e X) (UnionEq X x)).
Qed.

Theorem UnionE_impred : forall X x:set, x :e Union X -> forall p:prop, (forall Y:set, x :e Y -> Y :e X -> p) -> p.
let X x. assume H1.
let p. assume Hp.
apply UnionE X x H1.
let x. assume H2. apply H2.
exact Hp x.
Qed.

Theorem PowerI : forall X Y:set, Y c= X -> Y :e Power X.
let X Y. apply PowerEq X Y. exact (fun _ H => H).
Qed.

Theorem PowerE : forall X Y:set, Y :e Power X -> Y c= X.
let X Y. apply PowerEq X Y. exact (fun H _ => H).
Qed.

Theorem Empty_In_Power : forall X:set, Empty :e Power X.
exact (fun X : set => PowerI X Empty (Subq_Empty X)).
Qed.

Theorem Self_In_Power : forall X:set, X :e Power X.
exact (fun X : set => PowerI X X (Subq_ref X)).
Qed.

Theorem xm : forall P:prop, P \/ ~P.
let P:prop.
set p1 := fun x : set => x = Empty \/ P.
set p2 := fun x : set => x <> Empty \/ P.
claim L1:p1 Empty.
{ prove (Empty = Empty \/ P). apply orIL. exact (fun q H => H). }
claim L2: (Eps_i p1) = Empty \/ P.
{ exact (Eps_i_ax p1 Empty L1). }
claim L3:p2 (Power Empty).
{ prove ~(Power Empty = Empty) \/ P. apply orIL.
  assume H1: Power Empty = Empty.
  apply EmptyE Empty.
  prove Empty :e Empty.
  rewrite <- H1 at 2. apply Empty_In_Power.
}
claim L4: Eps_i p2 <> Empty \/ P.
{ exact (Eps_i_ax p2 (Power Empty) L3). }
apply L2.
- assume H1: Eps_i p1 = Empty.
  apply L4.
  + assume H2: Eps_i p2 <> Empty.
    prove P \/ ~ P.
    apply orIR.
    prove ~ P.
    assume H3 : P.
    claim L5:p1 = p2.
    {
      apply pred_ext. let x. apply iffI.
      - assume H4.
        prove (~(x = Empty) \/ P).
        apply orIR.
	prove P.
        exact H3.
      - assume H4.
        prove (x = Empty \/ P).
        apply orIR.
	prove P.
        exact H3.
    }
    apply H2. rewrite <- L5. exact H1.
  + assume H2:P.
    prove P \/ ~ P.
    apply orIL.
    prove P.
    exact H2.
- assume H1:P.
    prove P \/ ~ P.
    apply orIL.
    prove P.
    exact H1.
Qed.

Theorem dneg : forall P:prop, ~~P -> P.
let P. assume H1.
apply xm P.
- exact (fun H => H).
- assume H2: ~P.
  prove False.
  exact H1 H2.
Qed.

Theorem not_all_ex_demorgan_i : forall P:set->prop, ~(forall x, P x) -> exists x, ~P x.
let P.
assume u:~forall x, P x.
apply dneg.
assume v:~exists x, ~P x.
apply u. let x. apply dneg.
assume w:~P x. 
exact (not_ex_all_demorgan_i (fun x => ~P x) v x w).
Qed.

Theorem eq_or_nand : or = (fun (x y:prop) => ~(~x /\ ~y)).
apply func_ext prop (prop -> prop).
let x. apply func_ext prop prop.
let y. apply prop_ext_2.
- assume H1: x \/ y.
  assume H2: ~x /\ ~y.
  apply H2. assume H3 H4. exact (H1 False H3 H4).
- assume H1:~(~x /\ ~y).
  apply (xm x).
  + assume H2: x. apply orIL. exact H2.
  + assume H2: ~x. apply (xm y).
    * assume H3: y. apply orIR. exact H3.
    * assume H3: ~y. apply H1. exact (andI (~x) (~y) H2 H3).
Qed.

(* Parameter exactly1of2 "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" "163602f90de012a7426ee39176523ca58bc964ccde619b652cb448bd678f7e21" *)
Definition exactly1of2 : prop->prop->prop := fun A B:prop =>
A /\ ~B \/ ~A /\ B.

Theorem exactly1of2_I1 : forall A B:prop, A -> ~B -> exactly1of2 A B.
let A B.
assume HA: A.
assume HB: ~B.
prove A /\ ~B \/ ~A /\ B.
apply orIL.
prove A /\ ~B.
exact (andI A (~B) HA HB).
Qed.

Theorem exactly1of2_I2 : forall A B:prop, ~A -> B -> exactly1of2 A B.
let A B.
assume HA: ~A.
assume HB: B.
prove A /\ ~B \/ ~A /\ B.
apply orIR.
prove ~A /\ B.
exact (andI (~A) B HA HB).
Qed.

Theorem exactly1of2_E : forall A B:prop, exactly1of2 A B ->
forall p:prop,
(A -> ~B -> p) ->
(~A -> B -> p) ->
p.
let A B.
assume H1: exactly1of2 A B.
let p.
assume H2 : A -> ~B -> p.
assume H3 : ~A -> B -> p.
apply (H1 p).
- exact (fun H4 : A /\ ~B => H4 p H2).
- exact (fun H4 : ~A /\ B => H4 p H3).
Qed.

Theorem exactly1of2_or : forall A B:prop, exactly1of2 A B -> A \/ B.
let A B.
assume H1: exactly1of2 A B.
apply (exactly1of2_E A B H1 (A \/ B)).
- exact (fun (HA : A) (_ : ~B) => orIL A B HA).
- exact (fun (_ : ~A) (HB : B) => orIR A B HB).
Qed.

Theorem ReplI : forall A:set, forall F:set->set, forall x:set, x :e A -> F x :e {F x|x :e A}.
let A F x. assume H1.
apply ReplEq A F (F x).
assume _ H2. apply H2.
prove exists x' :e A, F x = F x'.
witness x. apply andI.
- exact H1.
- exact (fun q H => H).
Qed.

Theorem ReplE : forall A:set, forall F:set->set, forall y:set, y :e {F x|x :e A} -> exists x :e A, y = F x.
let A F y. apply ReplEq A F y. exact (fun H _ => H).
Qed.

Theorem ReplE_impred : forall A:set, forall F:set->set, forall y:set, y :e {F x|x :e A} -> forall p:prop, (forall x:set, x :e A -> y = F x -> p) -> p.
let A F y. assume H1.
apply ReplE A F y H1.
let x. assume H2. apply H2.
assume H3 H4.
let p. assume Hp.
exact Hp x H3 H4.
Qed.

Theorem ReplE' : forall X, forall f:set -> set, forall p:set -> prop, (forall x :e X, p (f x)) -> forall y :e {f x|x :e X}, p y.
let X f p. assume H1. let y. assume Hy.
apply ReplE_impred X f y Hy.
let x. assume Hx: x :e X. assume Hx2: y = f x.
prove p y. rewrite Hx2. exact H1 x Hx.
Qed.

Theorem Repl_Empty : forall F:set -> set, {F x|x :e Empty} = Empty.
let F. apply (Empty_eq {F x|x :e Empty}).
let y.
assume H1: y :e {F x|x :e Empty}.
apply (ReplE_impred Empty F y H1).
let x.
assume H2: x :e Empty.
assume _.
exact (EmptyE x H2).
Qed.

Theorem ReplEq_ext_sub : forall X, forall F G:set -> set, (forall x :e X, F x = G x) -> {F x|x :e X} c= {G x|x :e X}.
let X F G.
assume H1: forall x :e X, F x = G x.
let y. assume Hy: y :e {F x|x :e X}.
apply ReplE_impred X F y Hy.
let x. assume Hx: x :e X.
assume H2: y = F x.
prove y :e {G x|x :e X}.
rewrite H2.
prove F x :e {G x|x :e X}.
rewrite H1 x Hx.
prove G x :e {G x|x :e X}.
apply ReplI. exact Hx.
Qed.

Theorem ReplEq_ext : forall X, forall F G:set -> set, (forall x :e X, F x = G x) -> {F x|x :e X} = {G x|x :e X}.
let X F G.
assume H1: forall x :e X, F x = G x.
apply set_ext.
- exact ReplEq_ext_sub X F G H1.
- apply ReplEq_ext_sub X G F.
  let x. assume Hx. symmetry. exact H1 x Hx.
Qed.

Theorem Repl_inv_eq : forall P:set -> prop, forall f g:set -> set,
    (forall x, P x -> g (f x) = x)
 -> forall X, (forall x :e X, P x) -> {g y|y :e {f x|x :e X}} = X.
let P f g. assume H1. let X. assume HX.
apply set_ext.
- let w. assume Hw: w :e {g y|y :e {f x|x :e X}}.
  apply ReplE_impred {f x|x :e X} g w Hw.
  let y. assume Hy: y :e {f x|x :e X}.
  assume Hwy: w = g y.
  apply ReplE_impred X f y Hy.
  let x. assume Hx: x :e X.
  assume Hyx: y = f x.
  prove w :e X. rewrite Hwy. rewrite Hyx.
  prove g (f x) :e X.
  rewrite H1 x (HX x Hx).
  exact Hx.
- let x. assume Hx: x :e X.
  rewrite <- H1 x (HX x Hx).
  prove g (f x) :e {g y|y :e {f x|x :e X}}.
  apply ReplI.
  prove f x :e {f x|x :e X}.
  apply ReplI. exact Hx.
Qed.

Theorem Repl_invol_eq : forall P:set -> prop, forall f:set -> set,
    (forall x, P x -> f (f x) = x)
 -> forall X, (forall x :e X, P x) -> {f y|y :e {f x|x :e X}} = X.
let P f. assume H1.
exact Repl_inv_eq P f f H1.
Qed.

(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Definition If_i : prop->set->set->set := (fun p x y => Eps_i (fun z:set => p /\ z = x \/ ~p /\ z = y)).

Notation IfThenElse If_i.

Theorem If_i_correct : forall p:prop, forall x y:set,
p /\ (if p then x else y) = x \/ ~p /\ (if p then x else y) = y.
let p x y.
apply (xm p).
- assume H1: p.
  claim L1: p /\ x = x \/ ~p /\ x = y.
  {
    apply orIL. apply andI.
    - exact H1.
    - reflexivity.
  }
  exact (Eps_i_ax (fun z : set => p /\ z = x \/ ~ p /\ z = y) x L1).
- assume H1: ~p.
  claim L1: p /\ y = x \/ ~p /\ y = y.
  {
    apply orIR. apply andI.
    - exact H1.
    - reflexivity.
  }
  exact (Eps_i_ax (fun z : set => p /\ z = x \/ ~ p /\ z = y) y L1).
Qed.

Theorem If_i_0 : forall p:prop, forall x y:set,
~ p -> (if p then x else y) = y.
let p x y.
assume H1: ~p.
apply (If_i_correct p x y).
- assume H2: p /\ (if p then x else y) = x.
  exact (H1 (andEL p ((if p then x else y) = x) H2) ((if p then x else y) = y)).
- assume H2: ~p /\ (if p then x else y) = y.
  exact (andER (~p) ((if p then x else y) = y) H2).
Qed.

Theorem If_i_1 : forall p:prop, forall x y:set,
p -> (if p then x else y) = x.
let p x y.
assume H1: p.
apply (If_i_correct p x y).
- assume H2: p /\ (if p then x else y) = x.
  exact (andER p ((if p then x else y) = x) H2).
- assume H2: ~p /\ (if p then x else y) = y.
  exact (andEL (~p) ((if p then x else y) = y) H2 H1 ((if p then x else y) = x)).
Qed.

Theorem If_i_or : forall p:prop, forall x y:set, (if p then x else y) = x \/ (if p then x else y) = y.
let p x y.
apply (xm p).
- assume H1: p. apply orIL. exact (If_i_1 p x y H1).
- assume H1: ~p. apply orIR. exact (If_i_0 p x y H1).
Qed.

(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Definition UPair : set->set->set :=
fun y z => {if Empty :e X then y else z | X :e Power (Power Empty)}.

Notation SetEnum2 UPair.

Theorem UPairE :
forall x y z:set, x :e {y,z} -> x = y \/ x = z.
let x y z.
assume H1: x :e {y,z}.
apply (ReplE (Power (Power Empty)) (fun X => if Empty :e X then y else z) x H1).
let X.
assume H2: X :e Power (Power Empty) /\ x = if Empty :e X then y else z.
claim L1: x = if Empty :e X then y else z.
{ exact (andER (X :e Power (Power Empty)) (x = if Empty :e X then y else z) H2). }
apply (If_i_or (Empty :e X) y z).
- assume H3: (if Empty :e X then y else z) = y.
  apply orIL.
  prove x = y.
  rewrite <- H3. exact L1.
- assume H3: (if Empty :e X then y else z) = z.
  apply orIR.
  prove x = z.
  rewrite <- H3. exact L1.
Qed.

Theorem UPairI1 : forall y z:set, y :e {y,z}.
let y z.
prove y :e {y,z}.
rewrite <- (If_i_1 (Empty :e Power Empty) y z (Empty_In_Power Empty)) at 1.
prove (if Empty :e Power Empty then y else z) :e {y,z}.
prove (if Empty :e Power Empty then y else z) :e {if Empty :e X then y else z | X :e Power (Power Empty)}.
apply (ReplI (Power (Power Empty)) (fun X : set => if (Empty :e X) then y else z) (Power Empty)).
prove Power Empty :e Power (Power Empty).
exact (Self_In_Power (Power Empty)).
Qed.

Theorem UPairI2 : forall y z:set, z :e {y,z}.
let y z.
prove z :e {y,z}.
rewrite <- (If_i_0 (Empty :e Empty) y z (EmptyE Empty)) at 1.
prove (if Empty :e Empty then y else z) :e {y,z}.
prove (if Empty :e Empty then y else z) :e {if Empty :e X then y else z | X :e Power (Power Empty)}.
apply (ReplI (Power (Power Empty)) (fun X : set => if (Empty :e X) then y else z) Empty).
prove Empty :e Power (Power Empty).
exact (Empty_In_Power (Power Empty)).
Qed.

(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Definition Sing : set -> set := fun x => {x,x}.
Notation SetEnum1 Sing.

Theorem SingI : forall x:set, x :e {x}. 
exact (fun x : set => UPairI1 x x).
Qed.

Theorem SingE : forall x y:set, y :e {x} -> y = x. 
exact (fun x y H => UPairE y x x H (y = x) (fun H => H) (fun H => H)).
Qed.

Theorem Sing_inj: forall x y, {x} = {y} -> x = y.
let x y.
assume H1: {x} = {y}.
apply SingE.
prove x :e {y}.
rewrite <- H1.
apply SingI.
Qed.

(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Definition binunion : set -> set -> set := fun X Y => Union {X,Y}.

(* Unicode :\/: "222a" *)
Infix :\/: 345 left := binunion.

Theorem binunionI1 : forall X Y z:set, z :e X -> z :e X :\/: Y.
let X Y z.
assume H1: z :e X.
prove z :e X :\/: Y.
prove z :e Union {X,Y}.
apply (UnionI {X,Y} z X).
- prove z :e X. exact H1.
- prove X :e {X,Y}. exact (UPairI1 X Y).
Qed.

Theorem binunionI2 : forall X Y z:set, z :e Y -> z :e X :\/: Y.
let X Y z.
assume H1: z :e Y.
prove z :e X :\/: Y.
prove z :e Union {X,Y}.
apply (UnionI {X,Y} z Y).
- prove z :e Y. exact H1.
- prove Y :e {X,Y}. exact (UPairI2 X Y).
Qed.

Theorem binunionE : forall X Y z:set, z :e X :\/: Y -> z :e X \/ z :e Y.
let X Y z.
assume H1: z :e X :\/: Y.
prove z :e X \/ z :e Y.
apply (UnionE_impred {X,Y} z H1).
let Z.
assume H2: z :e Z.
assume H3: Z :e {X,Y}.
apply (UPairE Z X Y H3).
- assume H4: Z = X.
  apply orIL.
  prove z :e X.
  rewrite <- H4.
  prove z :e Z.
  exact H2.
- assume H4: Z = Y.
  apply orIR.
  prove z :e Y.
  rewrite <- H4.
  prove z :e Z.
  exact H2.
Qed.

Theorem binunionE' : forall X Y z, forall p:prop, (z :e X -> p) -> (z :e Y -> p) -> (z :e X :\/: Y -> p).
let X Y z p. assume H1 H2 Hz.
apply binunionE X Y z Hz.
- assume H3: z :e X. exact H1 H3.
- assume H3: z :e Y. exact H2 H3.
Qed.

Theorem binunion_asso:forall X Y Z:set, X :\/: (Y :\/: Z) = (X :\/: Y) :\/: Z.
let X Y Z. apply set_ext.
- let w. assume H1: w :e X :\/: (Y :\/: Z).
  prove w :e (X :\/: Y) :\/: Z.
  apply (binunionE X (Y :\/: Z) w H1).
  + assume H2: w :e X.
    apply binunionI1. apply binunionI1. exact H2.
  + assume H2: w :e Y :\/: Z.
    apply (binunionE Y Z w H2).
    * assume H3: w :e Y.
      apply binunionI1. apply binunionI2. exact H3.
    * assume H3: w :e Z.
      apply binunionI2. exact H3.
- let w. assume H1: w :e (X :\/: Y) :\/: Z.
  prove w :e X :\/: (Y :\/: Z).
  apply (binunionE (X :\/: Y) Z w H1).
  + assume H2: w :e X :\/: Y.
    apply (binunionE X Y w H2).
    * assume H3: w :e X.
      apply binunionI1. exact H3.
    * assume H3: w :e Y.
      apply binunionI2. apply binunionI1. exact H3.
  + assume H2: w :e Z.
    apply binunionI2. apply binunionI2. exact H2.
Qed.

Theorem binunion_com_Subq:forall X Y:set, X :\/: Y c= Y :\/: X.
let X Y w. assume H1: w :e X :\/: Y.
prove w :e Y :\/: X.
apply (binunionE X Y w H1).
- assume H2: w :e X. apply binunionI2. exact H2.
- assume H2: w :e Y. apply binunionI1. exact H2.
Qed.

Theorem binunion_com:forall X Y:set, X :\/: Y = Y :\/: X.
let X Y. apply set_ext.
- exact (binunion_com_Subq X Y).
- exact (binunion_com_Subq Y X).
Qed.

Theorem binunion_idl:forall X:set, Empty :\/: X = X.
let X. apply set_ext.
- let x. assume H1: x :e Empty :\/: X.
  apply (binunionE Empty X x H1).
  + assume H2: x :e Empty. prove False. exact (EmptyE x H2).
  + assume H2: x :e X. exact H2.
- let x. assume H2: x :e X. prove x :e Empty :\/: X. apply binunionI2. exact H2.
Qed.

Theorem binunion_idr:forall X:set, X :\/: Empty = X.
let X.
rewrite (binunion_com X Empty).
exact (binunion_idl X).
Qed.

Theorem binunion_Subq_1: forall X Y:set, X c= X :\/: Y.
exact binunionI1.
Qed.

Theorem binunion_Subq_2: forall X Y:set, Y c= X :\/: Y.
exact binunionI2.
Qed.

Theorem binunion_Subq_min: forall X Y Z:set, X c= Z -> Y c= Z -> X :\/: Y c= Z.
let X Y Z.
assume H1: X c= Z.
assume H2: Y c= Z.
let w.
assume H3: w :e X :\/: Y.
apply (binunionE X Y w H3).
- assume H4: w :e X. exact (H1 w H4).
- assume H4: w :e Y. exact (H2 w H4).
Qed.

Theorem Subq_binunion_eq:forall X Y, (X c= Y) = (X :\/: Y = Y).
let X Y. apply prop_ext_2.
- assume H1: X c= Y.
  prove X :\/: Y = Y.
  apply set_ext.
  + prove X :\/: Y c= Y. apply (binunion_Subq_min X Y Y).
    * prove X c= Y. exact H1.
    * prove Y c= Y. exact (Subq_ref Y).
  + prove Y c= X :\/: Y. exact (binunion_Subq_2 X Y).
- assume H1: X :\/: Y = Y.
  prove X c= Y.
  rewrite <- H1.
  prove X c= X :\/: Y.
  exact (binunion_Subq_1 X Y).
Qed.

Definition SetAdjoin : set->set->set := fun X y => X :\/: {y}.

Notation SetEnum Empty Sing UPair SetAdjoin.

(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Definition famunion:set->(set->set)->set
:= fun X F => Union {F x|x :e X}.

(* Unicode \/_ "22C3" *)
(* Subscript \/_ *)
Binder \/_ , := famunion.

Theorem famunionI:forall X:set, forall F:(set->set), forall x y:set, x :e X -> y :e F x -> y :e \/_ x :e X, F x.
exact (fun X F x y H1 H2 => UnionI (Repl X F) y (F x) H2 (ReplI X F x H1)).
Qed.

Theorem famunionE:forall X:set, forall F:(set->set), forall y:set, y :e (\/_ x :e X, F x) -> exists x :e X, y :e F x.
let X F y.
assume H1: y :e (\/_ x :e X, F x).
prove exists x :e X, y :e F x.
apply (UnionE_impred {F x|x :e X} y H1).
let Y.
assume H2: y :e Y.
assume H3: Y :e {F x|x :e X}.
apply (ReplE_impred X F Y H3).
let x.
assume H4: x :e X.
assume H5: Y = F x.
witness x.
prove x :e X /\ y :e F x.
apply andI.
- exact H4.
- prove y :e F x.
  rewrite <- H5.
  exact H2.
Qed.

Theorem famunionE_impred : forall X : set , forall F : (set -> set) , forall y : set , y :e (\/_ x :e X , F x) -> forall p:prop, (forall x, x :e X -> y :e F x -> p) -> p.
let X F y. assume Hy.
let p. assume Hp.
apply famunionE X F y Hy.
let x. assume H1. apply H1.
exact Hp x.
Qed.

Theorem famunion_Empty: forall F:set -> set, (\/_ x :e Empty, F x) = Empty.
let F. apply Empty_Subq_eq.
let y. assume Hy: y :e \/_ x :e Empty, F x.
apply famunionE_impred Empty F y Hy.
let x. assume Hx: x :e Empty. prove False. exact EmptyE x Hx.
Qed.

Theorem famunion_Subq: forall X, forall f g:set -> set, (forall x :e X, f x c= g x) -> famunion X f c= famunion X g.
let X f g. assume Hfg.
let y. assume Hy. apply famunionE_impred X f y Hy.
let x. assume Hx.
assume H1: y :e f x.
apply famunionI X g x y Hx.
prove y :e g x.
exact Hfg x Hx y H1.
Qed.

Theorem famunion_ext: forall X, forall f g:set -> set, (forall x :e X, f x = g x) -> famunion X f = famunion X g.
let X f g. assume Hfg.
apply set_ext.
- apply famunion_Subq.
  let x. assume Hx. rewrite Hfg x Hx. apply Subq_ref.
- apply famunion_Subq.
  let x. assume Hx. rewrite Hfg x Hx. apply Subq_ref.
Qed.

Section SepSec.

Variable X:set.
Variable P:set->prop.
Let z : set := Eps_i (fun z => z :e X /\ P z).
Let F:set->set := fun x => if P x then x else z.

(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Definition Sep:set
:= if (exists z :e X, P z) then {F x|x :e X} else Empty.

End SepSec.

Notation Sep Sep.

Theorem SepI:forall X:set, forall P:(set->prop), forall x:set, x :e X -> P x -> x :e {x :e X|P x}.
let X P x.
set z : set := Eps_i (fun z => z :e X /\ P z).
set F : set->set := fun x => if P x then x else z.
assume H1: x :e X.
assume H2: P x.
claim L1: exists z :e X, P z.
{
  witness x. apply andI.
  - exact H1.
  - exact H2.
}
prove x :e {x :e X|P x}.
prove x :e if (exists z :e X, P z) then {F x|x :e X} else Empty.
(*** Note:
 Making L2 a claim and then rewriting with it succeeds, but rewrite (If_i_1 (exists z :e X, P z) {F x|x :e X} Empty L1) fails.
 The reason is that when the proposition proved by (If_i_1 (exists z :e X, P z) {F x|x :e X} Empty L1) is
 extracted by the code, the F x will be beta reduced to be if P x then x else z. After this beta reduction, the left hand side of the
 equation does not match the right hand side of the claim x :e if (exists z :e X, P z) then {F x|x :e X} else Empty.
 This is an example of how one must be careful using the apply and rewrite tactics and must sometimes give these
 kinds of explicit annotations, i.e., proving a beta-eta-delta equivalent claim.
 ***)
claim L2: (if (exists z :e X, P z) then {F x|x :e X} else Empty) = {F x|x :e X}.
{
  exact (If_i_1 (exists z :e X, P z) {F x|x :e X} Empty L1).
}
rewrite L2.
prove x :e {F x|x :e X}.
claim L3: F x = x.
{
  prove (if P x then x else z) = x.
  exact (If_i_1 (P x) x z H2).
}
rewrite <- L3.
prove F x :e {F x|x :e X}.
exact (ReplI X F x H1).
Qed.

Theorem SepE:forall X:set, forall P:(set->prop), forall x:set, x :e {x :e X|P x} -> x :e X /\ P x.
let X P x.
set z : set := Eps_i (fun z => z :e X /\ P z).
set F : set->set := fun x => if P x then x else z.
apply (xm (exists z :e X, P z)).
- assume H1: exists z :e X, P z.
  prove (x :e (if (exists z :e X, P z) then {F x|x :e X} else Empty) -> x :e X /\ P x).
  claim L1: (if (exists z :e X, P z) then {F x|x :e X} else Empty) = {F x|x :e X}.
  {
    exact (If_i_1 (exists z :e X, P z) {F x|x :e X} Empty H1).
  }
  rewrite L1.
  prove x :e {F x|x :e X} -> x :e X /\ P x.
  assume H2: x :e {F x|x :e X}.
  apply (ReplE_impred X F x H2).
  let y.
  assume H3: y :e X.
  assume H4: x = F y.
  prove x :e X /\ P x.
  apply (xm (P y)).
  + assume H5: P y.
    claim L2: x = y.
    {
      rewrite <- (If_i_1 (P y) y z H5).
      exact H4.
    }
    rewrite L2.
    prove y :e X /\ P y.
    apply andI.
    * exact H3.
    * exact H5.
  + assume H5: ~P y.
    claim L2: x = z.
    {
      rewrite <- (If_i_0 (P y) y z H5).
      exact H4.
    }
    rewrite L2.
    prove z :e X /\ P z.
    exact (Eps_i_ex (fun z => z :e X /\ P z) H1).
- assume H1: ~exists z :e X, P z.
  prove (x :e (if (exists z :e X, P z) then {F x|x :e X} else Empty) -> x :e X /\ P x).
  claim L1: (if (exists z :e X, P z) then {F x|x :e X} else Empty) = Empty.
  { exact (If_i_0 (exists z :e X, P z) {F x|x :e X} Empty H1). }
  rewrite L1.
  prove x :e Empty -> x :e X /\ P x.
  assume H2: x :e Empty.
  prove False.
  exact (EmptyE x H2).
Qed.

Theorem SepE1:forall X:set, forall P:(set->prop), forall x:set, x :e {x :e X|P x} -> x :e X.
exact (fun X P x H => SepE X P x H (x :e X) (fun H _ => H)).
Qed.

Theorem SepE2:forall X:set, forall P:(set->prop), forall x:set, x :e {x :e X|P x} -> P x.
exact (fun X P x H => SepE X P x H (P x) (fun _ H => H)).
Qed.

Theorem Sep_Empty: forall P:set -> prop, {x :e Empty|P x} = Empty.
let P. apply Empty_eq.
let x. assume Hx.
exact EmptyE x (SepE1 Empty P x Hx).
Qed.

Theorem Sep_Subq : forall X:set, forall P:set->prop, {x :e X|P x} c= X.
exact SepE1.
Qed.

Theorem Sep_In_Power : forall X:set, forall P:set->prop, {x :e X|P x} :e Power X.
exact (fun X P => PowerI X (Sep X P) (Sep_Subq X P)).
Qed.

(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Definition ReplSep : set->(set->prop)->(set->set)->set := fun X P F => {F x|x :e {z :e X|P z}}.
Notation ReplSep ReplSep.

Theorem ReplSepI: forall X:set, forall P:set->prop, forall F:set->set, forall x:set, x :e X -> P x -> F x :e {F x|x :e X, P x}.
exact (fun X P F x u v => ReplI (Sep X P) F x (SepI X P x u v)).
Qed.

Theorem ReplSepE:forall X:set, forall P:set->prop, forall F:set->set, forall y:set, y :e {F x|x :e X, P x} -> exists x:set, x :e X /\ P x /\ y = F x.
let X P F y.
assume H1: y :e {F x|x :e {z :e X|P z}}.
apply (ReplE {z :e X|P z} F y H1).
let x.
assume H2: x :e {z :e X|P z} /\ y = F x.
apply H2.
assume H3: x :e {z :e X|P z}.
assume H4: y = F x.
apply (SepE X P x H3).
assume H5: x :e X.
assume H6: P x.
witness x.
apply and3I.
- exact H5.
- exact H6.
- exact H4.
Qed.

Theorem ReplSepE_impred: forall X:set, forall P:set->prop, forall F:set->set, forall y:set, y :e {F x|x :e X, P x} -> forall p:prop, (forall x :e X, P x -> y = F x -> p) -> p.
let X P F y.
assume H1: y :e {F x|x :e X, P x}.
let p.
assume H2: forall x :e X, P x -> y = F x -> p.
prove p.
apply ReplSepE X P F y H1.
let x. assume H3. apply H3. assume H3. apply H3.
exact H2 x.
Qed.

(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Definition binintersect:set->set->set
:= fun X Y => {x :e X |x :e Y}.

(* Unicode :/\: "2229" *)
Infix :/\: 340 left := binintersect.

Theorem binintersectI:forall X Y z, z :e X -> z :e Y -> z :e X :/\: Y.
exact (fun X Y z H1 H2 => SepI X (fun x:set => x :e Y) z H1 H2).
Qed.

Theorem binintersectE:forall X Y z, z :e X :/\: Y -> z :e X /\ z :e Y.
exact (fun X Y z H1 => SepE X (fun x:set => x :e Y) z H1).
Qed.

Theorem binintersectE1:forall X Y z, z :e X :/\: Y -> z :e X.
exact (fun X Y z H1 => SepE1 X (fun x:set => x :e Y) z H1).
Qed.

Theorem binintersectE2:forall X Y z, z :e X :/\: Y -> z :e Y.
exact (fun X Y z H1 => SepE2 X (fun x:set => x :e Y) z H1).
Qed.

Theorem binintersect_Subq_1:forall X Y:set, X :/\: Y c= X.
exact binintersectE1.
Qed.

Theorem binintersect_Subq_2:forall X Y:set, X :/\: Y c= Y.
exact binintersectE2.
Qed.

Theorem binintersect_Subq_eq_1 : forall X Y, X c= Y -> X :/\: Y = X.
let X Y.
assume H1: X c= Y.
apply set_ext.
- apply binintersect_Subq_1.
- let x. assume H2: x :e X.
  apply binintersectI.
  + exact H2.
  + apply H1. exact H2.
Qed.

Theorem binintersect_Subq_max:forall X Y Z:set, Z c= X -> Z c= Y -> Z c= X :/\: Y.
let X Y Z.
assume H1: Z c= X.
assume H2: Z c= Y.
let w.
assume H3: w :e Z.
apply (binintersectI X Y w).
- prove w :e X. exact (H1 w H3).
- prove w :e Y. exact (H2 w H3).
Qed.

Theorem binintersect_com_Subq: forall X Y:set, X :/\: Y c= Y :/\: X.
let X Y. apply (binintersect_Subq_max Y X (X :/\: Y)).
- prove X :/\: Y c= Y. apply binintersect_Subq_2.
- prove X :/\: Y c= X. apply binintersect_Subq_1.
Qed.

Theorem binintersect_com: forall X Y:set, X :/\: Y = Y :/\: X.
let X Y. apply set_ext.
- exact (binintersect_com_Subq X Y).
- exact (binintersect_com_Subq Y X).
Qed.

(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Definition setminus:set->set->set
:= fun X Y => Sep X (fun x => x /:e Y).

(* Unicode :\: "2216" *)
Infix :\: 350 := setminus.

Theorem setminusI:forall X Y z, (z :e X) -> (z /:e Y) -> z :e X :\: Y.
exact (fun X Y z H1 H2 => SepI X (fun x:set => x /:e Y) z H1 H2).
Qed.

Theorem setminusE:forall X Y z, (z :e X :\: Y) -> z :e X /\ z /:e Y.
exact (fun X Y z H => SepE X (fun x:set => x /:e Y) z H).
Qed.

Theorem setminusE1:forall X Y z, (z :e X :\: Y) -> z :e X.
exact (fun X Y z H => SepE1 X (fun x:set => x /:e Y) z H).
Qed.

Theorem setminusE2:forall X Y z, (z :e X :\: Y) -> z /:e Y.
exact (fun X Y z H => SepE2 X (fun x:set => x /:e Y) z H).
Qed.

Theorem setminus_Subq:forall X Y:set, X :\: Y c= X.
exact setminusE1.
Qed.

Theorem setminus_Subq_contra:forall X Y Z:set, Z c= Y -> X :\: Y c= X :\: Z.
let X Y Z.
assume H1: Z c= Y.
let x.
assume H2: x :e X :\: Y.
apply (setminusE X Y x H2).
assume H3: x :e X.
assume H4: x /:e Y.
prove x :e X :\: Z.
apply setminusI.
- exact H3.
- prove x /:e Z. exact (Subq_contra Z Y x H1 H4).
Qed.

Theorem setminus_In_Power : forall A U, A :\: U :e Power A.
let A U. apply PowerI. apply setminus_Subq.
Qed.

Theorem setminus_idr: forall X, X :\: Empty = X.
let X.
apply set_ext.
- exact setminus_Subq X Empty.
- let u. assume Hu: u :e X.
  apply setminusI.
  + exact Hu.
  + exact EmptyE u.
Qed.

Theorem In_irref : forall x, x /:e x.
apply In_ind.
prove (forall X:set, (forall x:set, x :e X -> x /:e x) -> X /:e X).
let X.
assume IH: forall x : set, x :e X -> x /:e x.
assume H: X :e X.
exact IH X H H.
Qed.

Theorem In_no2cycle : forall x y, x :e y -> y :e x -> False.
apply In_ind.
let x.
assume IH: forall z, z :e x -> forall y, z :e y -> y :e z -> False.
let y.
assume H1: x :e y.
assume H2: y :e x.
exact IH y H2 x H2 H1.
Qed.

(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Definition ordsucc : set->set := fun x:set => x :\/: {x}.

Theorem ordsuccI1 : forall x:set, x c= ordsucc x.
let x.
exact (fun (y : set) (H1 : y :e x) => binunionI1 x {x} y H1).
Qed.

Theorem ordsuccI2 : forall x:set, x :e ordsucc x.
exact (fun x : set => binunionI2 x {x} x (SingI x)).
Qed.

Theorem ordsuccE : forall x y:set, y :e ordsucc x -> y :e x \/ y = x.
let x y.
assume H1: y :e x :\/: {x}.
apply (binunionE x {x} y H1).
- assume H2: y :e x. apply orIL. exact H2.
- assume H2: y :e {x}. apply orIR. exact (SingE x y H2).
Qed.

Notation Nat Empty ordsucc.

Theorem neq_0_ordsucc : forall a:set, 0 <> ordsucc a.
let a. prove ~(0 = ordsucc a).
assume H1: 0 = ordsucc a.
claim L1: a :e ordsucc a -> False.
{ rewrite <- H1. exact (EmptyE a). }
exact (L1 (ordsuccI2 a)).
Qed.

Theorem neq_ordsucc_0 : forall a:set, ordsucc a <> 0.
let a. exact neq_i_sym 0 (ordsucc a) (neq_0_ordsucc a).
Qed.

Theorem ordsucc_inj : forall a b:set, ordsucc a = ordsucc b -> a = b.
let a b.
assume H1: ordsucc a = ordsucc b.
claim L1: a :e ordsucc b.
{
  rewrite <- H1.
  exact (ordsuccI2 a).
}
apply (ordsuccE b a L1).
- assume H2: a :e b.
  claim L2: b :e ordsucc a.
  {
    rewrite H1.
    exact (ordsuccI2 b).
  }
  apply (ordsuccE a b L2).
  + assume H3: b :e a. prove False. exact (In_no2cycle a b H2 H3).
  + assume H3: b = a. symmetry. exact H3.
- assume H2: a = b. exact H2.
Qed.

Theorem ordsucc_inj_contra : forall a b:set, a <> b -> ordsucc a <> ordsucc b.
let a b. assume H1.
prove ~(ordsucc a = ordsucc b).
assume H2: ordsucc a = ordsucc b.
exact H1 (ordsucc_inj a b H2).
Qed.

Theorem In_0_1 : 0 :e 1.
exact (ordsuccI2 0).
Qed.

Theorem In_0_2 : 0 :e 2.
exact (ordsuccI1 1 0 In_0_1).
Qed.

Theorem In_1_2 : 1 :e 2.
exact (ordsuccI2 1).
Qed.

Theorem In_1_3: 1 :e 3.
apply ordsuccI1. exact In_1_2.
Qed.

Theorem In_2_3: 2 :e 3.
apply ordsuccI2.
Qed.

Theorem In_1_4: 1 :e 4.
apply ordsuccI1. exact In_1_3.
Qed.

Theorem In_2_4: 2 :e 4.
apply ordsuccI1. exact In_2_3.
Qed.

Theorem In_3_4: 3 :e 4.
apply ordsuccI2.
Qed.

Theorem In_1_5: 1 :e 5.
apply ordsuccI1. exact In_1_4.
Qed.

Theorem In_2_5: 2 :e 5.
apply ordsuccI1. exact In_2_4.
Qed.

Theorem In_3_5: 3 :e 5.
apply ordsuccI1. exact In_3_4.
Qed.

Theorem In_4_5: 4 :e 5.
apply ordsuccI2.
Qed.

Theorem In_1_6: 1 :e 6.
apply ordsuccI1. exact In_1_5.
Qed.

Theorem In_1_7: 1 :e 7.
apply ordsuccI1. exact In_1_6.
Qed.

Theorem In_1_8: 1 :e 8.
apply ordsuccI1. exact In_1_7.
Qed.

Definition nat_p : set->prop := fun n:set => forall p:set->prop, p 0 -> (forall x:set, p x -> p (ordsucc x)) -> p n.

Theorem nat_0 : nat_p 0.
exact (fun p H _ => H).
Qed.

Theorem nat_ordsucc : forall n:set, nat_p n -> nat_p (ordsucc n).
exact (fun n H1 p H2 H3 => H3 n (H1 p H2 H3)).
Qed.

Theorem nat_1 : nat_p 1.
exact (nat_ordsucc 0 nat_0).
Qed.

Theorem nat_2 : nat_p 2.
exact (nat_ordsucc 1 nat_1).
Qed.

Theorem nat_3: nat_p 3.
exact nat_ordsucc 2 nat_2.
Qed.

Theorem nat_4: nat_p 4.
exact nat_ordsucc 3 nat_3.
Qed.

Theorem nat_5: nat_p 5.
exact nat_ordsucc 4 nat_4.
Qed.

Theorem nat_6: nat_p 6.
exact nat_ordsucc 5 nat_5.
Qed.

Theorem nat_7: nat_p 7.
exact nat_ordsucc 6 nat_6.
Qed.

Theorem nat_8: nat_p 8.
exact nat_ordsucc 7 nat_7.
Qed.

Theorem nat_0_in_ordsucc : forall n, nat_p n -> 0 :e ordsucc n.
let n.
assume H1.
apply H1 (fun n => 0 :e ordsucc n).
- prove 0 :e ordsucc 0.
  exact In_0_1.
- let n.
  assume IH: 0 :e ordsucc n.
  prove 0 :e ordsucc (ordsucc n).
  exact (ordsuccI1 (ordsucc n) 0 IH).
Qed.

Theorem nat_ordsucc_in_ordsucc : forall n, nat_p n -> forall m :e n, ordsucc m :e ordsucc n.
let n.
assume H1.
apply (H1 (fun n => forall m :e n, ordsucc m :e ordsucc n)).
- prove forall m :e 0, ordsucc m :e ordsucc 0.
  let m.
  assume Hm: m :e 0.
  prove False.
  exact (EmptyE m Hm).
- let n.
  assume IH: forall m :e n, ordsucc m :e ordsucc n.
  prove forall m :e ordsucc n, ordsucc m :e ordsucc (ordsucc n).
  let m.
  assume H2: m :e ordsucc n.
  prove ordsucc m :e ordsucc (ordsucc n).
  apply (ordsuccE n m H2).
  + assume H3: m :e n.
    claim L1: ordsucc m :e ordsucc n.
    { exact (IH m H3). }
    exact (ordsuccI1 (ordsucc n) (ordsucc m) L1).
  + assume H3: m = n.
    rewrite H3.
    prove ordsucc n :e ordsucc (ordsucc n).
    exact (ordsuccI2 (ordsucc n)).
Qed.

Theorem nat_ind : forall p:set->prop, p 0 -> (forall n, nat_p n -> p n -> p (ordsucc n)) -> forall n, nat_p n -> p n.
let p.
assume H1: p 0.
assume H2: forall n, nat_p n -> p n -> p (ordsucc n).
claim L1: nat_p 0 /\ p 0.
{
  exact (andI (nat_p 0) (p 0) nat_0 H1).
}
claim L2: forall n, nat_p n /\ p n -> nat_p (ordsucc n) /\ p (ordsucc n).
{
  let n.
  assume H3: nat_p n /\ p n.
  apply H3.
  assume H4: nat_p n.
  assume H5: p n.
  apply andI.
  - prove nat_p (ordsucc n).
    exact (nat_ordsucc n H4).
  - prove p (ordsucc n).
    exact (H2 n H4 H5).
}
let n.
assume H3.
claim L3: nat_p n /\ p n.
{ exact (H3 (fun n => nat_p n /\ p n) L1 L2). }
exact (andER (nat_p n) (p n) L3).
Qed.

Theorem nat_inv_impred : forall p:set->prop, p 0 -> (forall n, nat_p n -> p (ordsucc n)) -> forall n, nat_p n -> p n.
let p. assume H1 H2. exact nat_ind p H1 (fun n H _ => H2 n H).
Qed.

Theorem nat_inv : forall n, nat_p n -> n = 0 \/ exists x, nat_p x /\ n = ordsucc x.
apply nat_inv_impred.
- apply orIL. reflexivity.
- let n. assume Hn. apply orIR. witness n. apply andI.
  + exact Hn.
  + reflexivity.
Qed.

Theorem nat_complete_ind : forall p:set->prop, (forall n, nat_p n -> (forall m :e n, p m) -> p n) -> forall n, nat_p n -> p n.
let p.
assume H1: forall n, nat_p n -> (forall m :e n, p m) -> p n.
claim L1: forall n:set, nat_p n -> forall m :e n, p m.
{
  apply nat_ind.
  - prove forall m :e 0, p m.
    let m.
    assume Hm: m :e 0.
    prove False.
    exact (EmptyE m Hm).
  - let n.
    assume Hn: nat_p n.
    assume IHn: forall m :e n, p m.
    prove forall m :e ordsucc n, p m.
    let m.
    assume Hm: m :e ordsucc n.
    prove p m.
    apply (ordsuccE n m Hm).
    + assume H2: m :e n.
      exact (IHn m H2).
    + assume H2: m = n.
      prove p m.
      rewrite H2.
      prove p n.
      exact (H1 n Hn IHn).
}
prove forall n, nat_p n -> p n.
exact (fun n Hn => H1 n Hn (L1 n Hn)).
Qed.

Theorem nat_p_trans : forall n, nat_p n -> forall m :e n, nat_p m.
apply nat_ind.
- prove forall m :e 0, nat_p m.
  let m.
  assume Hm: m :e 0.
  prove False.
  exact (EmptyE m Hm).
- let n.
  assume Hn: nat_p n.
  assume IHn: forall m :e n, nat_p m.
  prove forall m :e ordsucc n, nat_p m.
  let m.
  assume Hm: m :e ordsucc n.
  apply (ordsuccE n m Hm).
  + assume H1: m :e n.
    exact (IHn m H1).
  + assume H1: m = n.
    rewrite H1.
    exact Hn.
Qed.

Theorem nat_trans : forall n, nat_p n -> forall m :e n, m c= n.
apply nat_ind.
- prove forall m :e 0, m c= 0.
  let m.
  assume Hm: m :e 0.
  prove False.
  exact (EmptyE m Hm).
- let n.
  assume Hn: nat_p n.
  assume IHn: forall m :e n, m c= n.
  prove forall m :e ordsucc n, m c= ordsucc n.
  let m.
  assume Hm: m :e ordsucc n.
  apply (ordsuccE n m Hm).
  + assume H1: m :e n.
    prove m c= ordsucc n.
    apply (Subq_tra m n (ordsucc n)).
    * exact (IHn m H1).
    * exact (ordsuccI1 n).
  + assume H1: m = n.
    prove m c= ordsucc n.
    rewrite H1.
    prove n c= ordsucc n.
    exact (ordsuccI1 n).
Qed.

Theorem nat_ordsucc_trans : forall n, nat_p n -> forall m :e ordsucc n, m c= n.
let n.
assume Hn: nat_p n.
let m.
assume Hm: m :e ordsucc n.
let k.
assume Hk: k :e m.
prove k :e n.
apply (ordsuccE n m Hm).
- assume H1: m :e n.
  exact nat_trans n Hn m H1 k Hk.
- assume H1: m = n.
  rewrite <- H1.
  exact Hk.
Qed.

Theorem Union_ordsucc_eq : forall n, nat_p n -> Union (ordsucc n) = n.
apply nat_complete_ind.
let n.
assume Hn: nat_p n.
assume IHn: forall m :e n, Union (ordsucc m) = m.
prove Union (ordsucc n) = n.
apply set_ext.
- let m.
  assume Hm: m :e Union (ordsucc n).
  apply (UnionE_impred (ordsucc n) m Hm).
  let k.
  assume H1: m :e k.
  assume H2: k :e ordsucc n.
  prove m :e n.
  exact nat_ordsucc_trans n Hn k H2 m H1.
- let m.
  assume Hm: m :e n.
  prove m :e Union (ordsucc n).
  apply (UnionI (ordsucc n) m n).
  + exact Hm.
  + exact (ordsuccI2 n).
Qed.

Theorem cases_1: forall i :e 1, forall p:set->prop, p 0 -> p i.
let i. assume Hi. let p. assume Hp0.
apply ordsuccE 0 i Hi.
- assume Hil: i :e 0.
  apply EmptyE i Hil.
- assume Hie: i = 0.
  rewrite Hie. exact Hp0.
Qed.

Theorem cases_2: forall i :e 2, forall p:set->prop, p 0 -> p 1 -> p i.
let i. assume Hi. let p. assume Hp0 Hp1.
apply ordsuccE 1 i Hi.
- assume Hil: i :e 1.
  exact cases_1 i Hil p Hp0.
- assume Hie: i = 1.
  rewrite Hie. exact Hp1.
Qed.

Theorem cases_3: forall i :e 3, forall p:set->prop, p 0 -> p 1 -> p 2 -> p i.
let i. assume Hi. let p. assume Hp0 Hp1 Hp2.
apply ordsuccE 2 i Hi.
- assume Hil: i :e 2.
  exact cases_2 i Hil p Hp0 Hp1.
- assume Hie: i = 2.
  rewrite Hie. exact Hp2.
Qed.

Theorem neq_0_1 : 0 <> 1.
exact (neq_0_ordsucc 0).
Qed.

Theorem neq_1_0 : 1 <> 0.
exact (neq_ordsucc_0 0).
Qed.

Theorem neq_0_2 : 0 <> 2.
exact (neq_0_ordsucc 1).
Qed.

Theorem neq_2_0 : 2 <> 0.
exact (neq_ordsucc_0 1).
Qed.

Theorem neq_1_2 : 1 <> 2.
exact (ordsucc_inj_contra 0 1 neq_0_1).
Qed.

Theorem neq_1_3: 1 <> 3.
apply ordsucc_inj_contra.
exact neq_0_2.
Qed.

Theorem neq_2_3: 2 <> 3.
apply ordsucc_inj_contra.
exact neq_1_2.
Qed.

Theorem neq_2_4: 2 <> 4.
apply ordsucc_inj_contra.
exact neq_1_3.
Qed.

Theorem neq_3_4: 3 <> 4.
apply ordsucc_inj_contra.
exact neq_2_3.
Qed.

Theorem ZF_closed_E : forall U, ZF_closed U ->
 forall p:prop,
 (Union_closed U ->
  Power_closed U ->
  Repl_closed U -> p)
 -> p.
exact (fun U C p v => C p (fun C H3 => C p (fun H1 H2 => v H1 H2 H3))).
Qed.

Theorem ZF_Union_closed : forall U, ZF_closed U ->
  forall X :e U, Union X :e U.
exact (fun U C => ZF_closed_E U C (forall X :e U, Union X :e U) (fun H _ _ => H)).
Qed.

Theorem ZF_Power_closed : forall U, ZF_closed U ->
  forall X :e U, Power X :e U.
exact (fun U C => ZF_closed_E U C (forall X :e U, Power X :e U) (fun _ H _ => H)).
Qed.

Theorem ZF_Repl_closed : forall U, ZF_closed U ->
  forall X :e U, forall F:set->set, (forall x :e X, F x :e U) -> {F x|x:eX} :e U.
exact (fun U C => ZF_closed_E U C (forall X :e U, forall F:set->set, (forall x :e X, F x :e U) -> {F x|x :e X} :e U) (fun _ _ H => H)).
Qed.

Theorem ZF_UPair_closed : forall U, ZF_closed U ->
  forall x y :e U, {x,y} :e U.
let U.
assume C: ZF_closed U.
let x.
assume Hx: x :e U.
let y.
assume Hy: y :e U.
prove {x,y} :e U.
claim L1: {if x :e X then x else y|X :e Power (Power x)} = {x,y}.
{
  apply set_ext.
  - prove {if x :e X then x else y|X :e Power (Power x)} c= {x,y}.
    let z.
    assume Hz: z :e {if x :e X then x else y|X :e Power (Power x)}.
    prove z :e {x,y}.
    apply (ReplE_impred (Power (Power x)) (fun X => if x :e X then x else y) z Hz).
    let X. assume _.
    prove z = (if x :e X then x else y) -> z :e {x,y}.
    apply (xm (x :e X)).
    + assume H2: x :e X.
      rewrite (If_i_1 (x :e X) x y H2).
      prove (z = x -> z :e {x,y}).
      assume H3: z = x.
      rewrite H3.
      exact (UPairI1 x y).
    + assume H2: x /:e X.
      rewrite (If_i_0 (x :e X) x y H2).
      prove (z = y -> z :e {x,y}).
      assume H3: z = y.
      rewrite H3.
      exact (UPairI2 x y).
  - prove {x,y} c= {if x :e X then x else y|X :e Power (Power x)}.
    let z.
    assume Hz : z :e {x,y}.
    prove z :e {if x :e X then x else y|X :e Power (Power x)}.
    claim L1a: (if x :e (Power x) then x else y) :e {if x :e X then x else y|X :e Power (Power x)}.
    {
      apply (ReplI (Power (Power x)) (fun X => if x :e X then x else y) (Power x)).
      prove Power x :e Power (Power x).
      exact (Self_In_Power (Power x)).
    }
    claim L1b: (if x :e Empty then x else y) :e {if x :e X then x else y|X :e Power (Power x)}.
    {
      apply (ReplI (Power (Power x)) (fun X => if x :e X then x else y) Empty).
      prove Empty :e Power (Power x).
      exact (Empty_In_Power (Power x)).
    }
    apply (UPairE z x y Hz).
    + assume H1: z = x.
      rewrite H1.
      prove x :e {if x :e X then x else y|X :e Power (Power x)}.
      rewrite <- (If_i_1 (x :e (Power x)) x y (Self_In_Power x)) at 1.
      exact L1a.
    + assume H1: z = y.
      rewrite H1.
      prove y :e {if x :e X then x else y|X :e Power (Power x)}.
      rewrite <- (If_i_0 (x :e Empty) x y (EmptyE x)) at 1.
      exact L1b.
}
prove {x,y} :e U.
rewrite <- L1.
prove {if x :e X then x else y|X :e Power (Power x)} :e U.
claim L2: Power (Power x) :e U.
{
  exact (ZF_Power_closed U C (Power x) (ZF_Power_closed U C x Hx)).
}
claim L3: forall X :e Power (Power x), (if x :e X then x else y) :e U.
{
  let X. assume _.
  prove (if x :e X then x else y) :e U.
  apply (xm (x :e X)).
  - assume H1: x :e X.
    rewrite (If_i_1 (x :e X) x y H1).
    prove x :e U.
    exact Hx.
  - assume H1: x /:e X.
    rewrite (If_i_0 (x :e X) x y H1).
    prove y :e U.
    exact Hy.
}
exact (ZF_Repl_closed U C (Power (Power x)) L2 (fun X => if x :e X then x else y) L3).
Qed.

Theorem ZF_Sing_closed : forall U, ZF_closed U ->
  forall x :e U, {x} :e U.
exact (fun U C x H => ZF_UPair_closed U C x H x H).
Qed.

Theorem ZF_binunion_closed : forall U, ZF_closed U ->
  forall X Y :e U, (X :\/: Y) :e U.
exact (fun U C X HX Y HY => ZF_Union_closed U C {X,Y} (ZF_UPair_closed U C X HX Y HY)). 
Qed.

Theorem ZF_ordsucc_closed : forall U, ZF_closed U ->
  forall x :e U, ordsucc x :e U.
exact (fun U C x H => ZF_binunion_closed U C x H {x} (ZF_Sing_closed U C x H)).
Qed.

Theorem nat_p_UnivOf_Empty : forall n:set, nat_p n -> n :e UnivOf Empty.
apply nat_ind.
- prove 0 :e UnivOf Empty.
  exact (UnivOf_In Empty).
- let n.
  assume Hn: nat_p n.
  assume IHn: n :e UnivOf Empty.
  prove ordsucc n :e UnivOf Empty.
  exact (ZF_ordsucc_closed (UnivOf Empty) (UnivOf_ZF_closed Empty) n IHn).
Qed.

(* Unicode omega "3c9" *)
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Definition omega : set := {n :e UnivOf Empty|nat_p n}.

Theorem omega_nat_p : forall n :e omega, nat_p n.
exact (fun n H => SepE2 (UnivOf Empty) nat_p n H).
Qed.

Theorem nat_p_omega : forall n:set, nat_p n -> n :e omega.
let n.
assume H: nat_p n.
prove n :e {n :e UnivOf Empty|nat_p n}.
apply SepI.
- prove n :e UnivOf Empty. exact (nat_p_UnivOf_Empty n H).
- prove nat_p n. exact H.
Qed.

Theorem omega_ordsucc : forall n :e omega, ordsucc n :e omega.
let n. assume Hn.
apply nat_p_omega.
apply nat_ordsucc.
apply omega_nat_p.
exact Hn.
Qed.

Definition ordinal : set->prop := fun (alpha:set) => TransSet alpha /\ forall beta :e alpha, TransSet beta.

Theorem ordinal_TransSet : forall alpha:set, ordinal alpha -> TransSet alpha.
exact (fun alpha H => andEL (TransSet alpha) (forall beta :e alpha, TransSet beta) H).
Qed.

Theorem ordinal_Empty : ordinal Empty.
prove TransSet Empty /\ forall x :e Empty, TransSet x.
apply andI.
- let x.
  assume Hx: x :e Empty.
  prove False.
  exact (EmptyE x Hx).
- let x.
  assume Hx: x :e Empty.
  prove False.
  exact (EmptyE x Hx).
Qed.

Theorem ordinal_Hered : forall alpha:set, ordinal alpha -> forall beta :e alpha, ordinal beta.
let alpha.
assume H1: TransSet alpha /\ forall x :e alpha, TransSet x.
let beta.
assume H2: beta :e alpha.
prove TransSet beta /\ forall x :e beta, TransSet x.
apply H1.
assume H3: TransSet alpha.
assume H4: forall x :e alpha, TransSet x.
apply andI.
- exact (H4 beta H2).
- prove forall x :e beta, TransSet x.
  let x.
  assume Hx: x :e beta.
  claim L1: x :e alpha.
  { exact (H3 beta H2 x Hx). }
  prove TransSet x.
  exact (H4 x L1).
Qed.

Theorem TransSet_ordsucc : forall X:set, TransSet X -> TransSet (ordsucc X).
let X.
assume H1: TransSet X.
let x.
assume H2: x :e ordsucc X.
let y.
assume H3: y :e x.
prove y :e ordsucc X.
apply (ordsuccE X x H2).
- assume H4: x :e X.
  apply ordsuccI1.
  prove y :e X.
  exact (H1 x H4 y H3).
- assume H4: x = X.
  apply ordsuccI1.
  prove y :e X.
  rewrite <- H4.
  prove y :e x.
  exact H3.
Qed.

Theorem ordinal_ordsucc : forall alpha:set, ordinal alpha -> ordinal (ordsucc alpha).
let alpha.
assume H1: TransSet alpha /\ forall beta :e alpha, TransSet beta.
apply H1.
assume H2: TransSet alpha.
assume H3: forall beta :e alpha, TransSet beta.
prove TransSet (ordsucc alpha) /\ forall beta :e ordsucc alpha, TransSet beta.
apply andI.
- exact (TransSet_ordsucc alpha H2).
- let beta.
  assume H4: beta :e ordsucc alpha.
  prove TransSet beta.
  apply (ordsuccE alpha beta H4).
  + assume H5: beta :e alpha.
    exact (H3 beta H5).
  + assume H5: beta = alpha.
    rewrite H5.
    exact H2.
Qed.

Theorem nat_p_ordinal : forall n:set, nat_p n -> ordinal n.
apply nat_ind.
- prove ordinal 0.
  exact ordinal_Empty.
- let n.
  assume Hn: nat_p n.
  assume IHn: ordinal n.
  prove ordinal (ordsucc n).
  exact (ordinal_ordsucc n IHn).
Qed.

Theorem ordinal_1 : ordinal 1.
exact nat_p_ordinal 1 nat_1.
Qed.

Theorem ordinal_2 : ordinal 2.
exact nat_p_ordinal 2 nat_2.
Qed.

Theorem omega_TransSet : TransSet omega.
let n.
assume Hn: n :e omega.
let m.
assume Hm: m :e n.
prove m :e omega.
apply nat_p_omega.
prove nat_p m.
apply (nat_p_trans n).
- prove nat_p n. exact (omega_nat_p n Hn).
- prove m :e n. exact Hm.
Qed.

Theorem omega_ordinal : ordinal omega.
prove TransSet omega /\ forall n :e omega, TransSet n.
apply andI.
- exact omega_TransSet.
- let n.
  assume Hn: n :e omega.
  prove TransSet n.
  apply ordinal_TransSet.
  prove ordinal n.
  apply nat_p_ordinal.
  prove nat_p n.
  exact (omega_nat_p n Hn).
Qed.

Theorem ordsucc_omega_ordinal: ordinal (ordsucc omega).
exact ordinal_ordsucc omega omega_ordinal.
Qed.

Theorem TransSet_ordsucc_In_Subq : forall X:set, TransSet X -> forall x :e X, ordsucc x c= X.
let X.
assume H1: TransSet X.
let x.
assume H2: x :e X.
let y.
assume H3: y :e ordsucc x.
prove y :e X.
apply (ordsuccE x y H3).
- assume H4: y :e x.
  exact (H1 x H2 y H4).
- assume H4: y = x.
  rewrite H4.
  prove x :e X.
  exact H2.
Qed.

Theorem ordinal_ordsucc_In_Subq : forall alpha, ordinal alpha -> forall beta :e alpha, ordsucc beta c= alpha.
let alpha.
assume H: ordinal alpha.
exact (TransSet_ordsucc_In_Subq alpha (ordinal_TransSet alpha H)).
Qed.

Theorem ordinal_trichotomy_or : forall alpha beta:set, ordinal alpha -> ordinal beta -> alpha :e beta \/ alpha = beta \/ beta :e alpha.
apply In_ind.
let alpha.
assume IHalpha: forall gamma :e alpha, forall beta:set, ordinal gamma -> ordinal beta -> gamma :e beta \/ gamma = beta \/ beta :e gamma.
prove forall beta:set, ordinal alpha -> ordinal beta -> alpha :e beta \/ alpha = beta \/ beta :e alpha.
apply In_ind.
let beta.
assume IHbeta: forall delta :e beta, ordinal alpha -> ordinal delta -> alpha :e delta \/ alpha = delta \/ delta :e alpha.
assume Halpha : ordinal alpha.
assume Hbeta : ordinal beta.
prove alpha :e beta \/ alpha = beta \/ beta :e alpha.
apply (xm (alpha :e beta)).
- assume H1: alpha :e beta.
  apply or3I1.
  exact H1.
- assume H1: alpha /:e beta.
  apply (xm (beta :e alpha)).
  + assume H2: beta :e alpha.
    apply or3I3.
    exact H2.
  + assume H2: beta /:e alpha.
    apply or3I2.
    prove alpha = beta.
    apply set_ext.
    * { prove alpha c= beta.
        let gamma.
	assume H3: gamma :e alpha.
	prove gamma :e beta.
	claim Lgamma: ordinal gamma.
	{ exact (ordinal_Hered alpha Halpha gamma H3). }
	apply (or3E (gamma :e beta) (gamma = beta) (beta :e gamma) (IHalpha gamma H3 beta Lgamma Hbeta)).
	- assume H4: gamma :e beta.
	  exact H4.
        - assume H4: gamma = beta.
          prove False.
          apply H2.
          prove beta :e alpha.
	  rewrite <- H4.
	  exact H3.
        - assume H4: beta :e gamma.
          prove False.
          apply H2.
          prove beta :e alpha.
          exact (ordinal_TransSet alpha Halpha gamma H3 beta H4).
      }
    * { prove beta c= alpha.
        let delta.
	assume H3: delta :e beta.
	prove delta :e alpha.
	claim Ldelta: ordinal delta.
	{ exact (ordinal_Hered beta Hbeta delta H3). }
	apply (or3E (alpha :e delta) (alpha = delta) (delta :e alpha) (IHbeta delta H3 Halpha Ldelta)).
        - assume H4: alpha :e delta.
          prove False.
          apply H1.
          prove alpha :e beta.
          exact (ordinal_TransSet beta Hbeta delta H3 alpha H4).
        - assume H4: alpha = delta.
          prove False.
          apply H1.
          prove alpha :e beta.
	  rewrite H4.
	  exact H3.
	- assume H4: delta :e alpha.
	  exact H4.
      }
Qed.    

Theorem ordinal_trichotomy_or_impred : forall alpha beta:set, ordinal alpha -> ordinal beta -> forall p:prop, (alpha :e beta -> p) -> (alpha = beta -> p) -> (beta :e alpha -> p) -> p.
let alpha beta. assume H1 H2.
exact (or3E (alpha :e beta) (alpha = beta) (beta :e alpha) (ordinal_trichotomy_or alpha beta H1 H2)).
Qed.

Theorem ordinal_In_Or_Subq : forall alpha beta, ordinal alpha -> ordinal beta -> alpha :e beta \/ beta c= alpha.
let alpha beta.
assume H1: ordinal alpha.
assume H2: ordinal beta.
apply (or3E (alpha :e beta) (alpha = beta) (beta :e alpha) (ordinal_trichotomy_or alpha beta H1 H2)).
- assume H3: alpha :e beta.
  apply orIL.
  exact H3.
- assume H3: alpha = beta.
  apply orIR.
  rewrite H3.
  apply Subq_ref.
- assume H3: beta :e alpha.
  apply orIR.
  exact (ordinal_TransSet alpha H1 beta H3).
Qed.

Theorem ordinal_linear : forall alpha beta, ordinal alpha -> ordinal beta -> alpha c= beta \/ beta c= alpha.
let alpha beta.
assume H1: ordinal alpha.
assume H2: ordinal beta.
apply (ordinal_In_Or_Subq alpha beta H1 H2).
- assume H3: alpha :e beta.
  apply orIL.
  exact (ordinal_TransSet beta H2 alpha H3).
- assume H3: beta c= alpha.
  apply orIR.
  exact H3.
Qed.

Theorem ordinal_ordsucc_In_eq : forall alpha beta, ordinal alpha -> beta :e alpha -> ordsucc beta :e alpha \/ alpha = ordsucc beta.
let alpha beta.
assume Ha Hb.
claim L1: ordinal (ordsucc beta).
{ exact ordinal_ordsucc beta (ordinal_Hered alpha Ha beta Hb). }
apply ordinal_trichotomy_or alpha (ordsucc beta) Ha L1. assume H1. apply H1.
- assume H2: alpha :e ordsucc beta.
  prove False.
  apply ordsuccE beta alpha H2.
  + assume H3: alpha :e beta.
    exact In_no2cycle alpha beta H3 Hb.
  + assume H3: alpha = beta.
    apply In_irref alpha. rewrite H3 at 1. exact Hb.
- assume H2: alpha = ordsucc beta. apply orIR. exact H2.
- assume H2: ordsucc beta :e alpha. apply orIL. exact H2.
Qed.

Theorem ordinal_lim_or_succ : forall alpha, ordinal alpha -> (forall beta :e alpha, ordsucc beta :e alpha) \/ (exists beta :e alpha, alpha = ordsucc beta).
let alpha. assume Ha.
apply xm (exists beta :e alpha, alpha = ordsucc beta).
- assume H1. apply orIR. exact H1.
- assume H1: ~exists beta :e alpha, alpha = ordsucc beta.
  apply orIL.
  let beta. assume H2: beta :e alpha.
  apply ordinal_ordsucc_In_eq alpha beta Ha H2.
  + assume H3: ordsucc beta :e alpha. exact H3.
  + assume H3: alpha = ordsucc beta. prove False. apply H1.
    witness beta. apply andI.
    * exact H2.
    * exact H3.
Qed.

Theorem ordinal_ordsucc_In : forall alpha, ordinal alpha -> forall beta :e alpha, ordsucc beta :e ordsucc alpha.
let alpha. assume Ha. let beta. assume Hb.
claim L1: ordsucc beta c= alpha.
{ exact ordinal_ordsucc_In_Subq alpha Ha beta Hb. }
apply ordinal_In_Or_Subq (ordsucc beta) alpha (ordinal_ordsucc beta (ordinal_Hered alpha Ha beta Hb)) Ha.
- assume H1: ordsucc beta :e alpha. apply ordsuccI1. exact H1.
- assume H1: alpha c= ordsucc beta.
  claim L2: ordsucc beta = alpha.
  { apply set_ext.
    - exact L1.
    - exact H1.
  }
  rewrite L2. apply ordsuccI2.
Qed.

Theorem ordinal_famunion : forall X, forall F:set -> set, (forall x :e X, ordinal (F x)) -> ordinal (\/_ x :e X, F x).
let X F. assume HXF.
prove TransSet (\/_ x :e X, F x) /\ forall y :e (\/_ x :e X, F x), TransSet y.
apply andI.
- let y. assume Hy: y :e \/_ x :e X, F x.
  apply famunionE X F y Hy.
  let x. assume H1. apply H1.
  assume Hx: x :e X.
  assume Hy: y :e F x.
  prove y c= \/_ x :e X, F x.
  claim LFx: ordinal (F x).
  { exact HXF x Hx. }
  apply LFx. assume HFx1 _.
  let z. assume Hz: z :e y.
  prove z :e \/_ x :e X, F x.
  claim LzFx: z :e F x.
  { exact HFx1 y Hy z Hz. }
  exact famunionI X F x z Hx LzFx.
- let y. assume Hy: y :e \/_ x :e X, F x.
  prove TransSet y.
  apply famunionE X F y Hy.
  let x. assume H1. apply H1.
  assume Hx: x :e X.
  assume Hy: y :e F x.
  claim LFx: ordinal (F x).
  { exact HXF x Hx. }
  claim Ly: ordinal y.
  { exact ordinal_Hered (F x) LFx y Hy. }
  apply Ly. assume Hy1 _. exact Hy1.
Qed.

Theorem ordinal_binintersect : forall alpha beta, ordinal alpha -> ordinal beta -> ordinal (alpha :/\: beta).
let alpha beta. assume Ha Hb.
apply Ha. assume Ha1 _.
apply Hb. assume Hb1 _.
apply ordinal_In_Or_Subq alpha beta Ha Hb.
- assume H1: alpha :e beta.
  rewrite binintersect_Subq_eq_1 alpha beta (Hb1 alpha H1).
  exact Ha.
- assume H1: beta c= alpha.
  rewrite binintersect_com.
  rewrite binintersect_Subq_eq_1 beta alpha H1.
  exact Hb.
Qed.

Theorem ordinal_binunion : forall alpha beta, ordinal alpha -> ordinal beta -> ordinal (alpha :\/: beta).
let alpha beta. assume Ha Hb.
apply Ha. assume Ha1 _.
apply Hb. assume Hb1 _.
apply ordinal_linear alpha beta Ha Hb.
- rewrite Subq_binunion_eq.
  assume H1: alpha :\/: beta = beta.
  rewrite H1.
  exact Hb.
- rewrite Subq_binunion_eq. rewrite binunion_com.
  assume H1: alpha :\/: beta = alpha.
  rewrite H1.
  exact Ha.
Qed.

Theorem ordinal_ind : forall p:set->prop, 
(forall alpha, ordinal alpha -> (forall beta :e alpha, p beta) -> p alpha)
->
forall alpha, ordinal alpha -> p alpha.
let p.
assume H1: forall alpha, ordinal alpha -> (forall beta :e alpha, p beta) -> p alpha.
apply In_ind.
let alpha.
assume IH: forall beta :e alpha, ordinal beta -> p beta.
assume H2: ordinal alpha.
prove p alpha.
apply (H1 alpha H2).
let beta.
assume H3: beta :e alpha.
prove p beta.
apply (IH beta H3).
prove ordinal beta.
exact (ordinal_Hered alpha H2 beta H3).
Qed.

Theorem least_ordinal_ex : forall p:set -> prop, (exists alpha, ordinal alpha /\ p alpha) -> exists alpha, ordinal alpha /\ p alpha /\ forall beta :e alpha, ~p beta.
let p. assume H1.
apply dneg.
assume H2: ~exists alpha, ordinal alpha /\ p alpha /\ forall beta :e alpha, ~p beta.
claim L1: forall alpha, ordinal alpha -> ~p alpha.
{ apply ordinal_ind.
  let alpha. assume Ha.
  assume IH: forall beta :e alpha, ~p beta.
  assume H3: p alpha.
  apply H2.
  witness alpha. apply and3I.
  - exact Ha.
  - exact H3.
  - exact IH.
}
apply H1.
let alpha. assume H1a. apply H1a.
assume Ha: ordinal alpha.
assume Hp: p alpha.
exact L1 alpha Ha Hp.
Qed. 

Definition inj : set->set->(set->set)->prop :=
  fun X Y f =>
  (forall u :e X, f u :e Y)
  /\
  (forall u v :e X, f u = f v -> u = v).

Definition bij : set->set->(set->set)->prop :=
  fun X Y f =>
  (forall u :e X, f u :e Y)
  /\
  (forall u v :e X, f u = f v -> u = v)
  /\
  (forall w :e Y, exists u :e X, f u = w).

Theorem bijI : forall X Y, forall f:set -> set,
    (forall u :e X, f u :e Y)
 -> (forall u v :e X, f u = f v -> u = v)
 -> (forall w :e Y, exists u :e X, f u = w)
 -> bij X Y f.
let X Y f. assume Hf1 Hf2 Hf3.
prove (forall u :e X, f u :e Y)
   /\ (forall u v :e X, f u = f v -> u = v)
   /\ (forall w :e Y, exists u :e X, f u = w).
apply and3I.
- exact Hf1.
- exact Hf2.
- exact Hf3.
Qed.

Theorem bijE : forall X Y, forall f:set -> set,
    bij X Y f
 -> forall p:prop,
      ((forall u :e X, f u :e Y)
    -> (forall u v :e X, f u = f v -> u = v)
    -> (forall w :e Y, exists u :e X, f u = w)
    -> p)
   -> p.
let X Y f. assume Hf. let p. assume Hp.
apply Hf. assume Hf. apply Hf.
assume Hf1 Hf2 Hf3.
exact Hp Hf1 Hf2 Hf3.
Qed.
  
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Definition inv : set -> (set -> set) -> set -> set := fun X f => fun y:set => Eps_i (fun x => x :e X /\ f x = y).

Theorem surj_rinv : forall X Y, forall f:set->set, (forall w :e Y, exists u :e X, f u = w) -> forall y :e Y, inv X f y :e X /\ f (inv X f y) = y.
let X Y f. assume H1.
let y. assume Hy: y :e Y.
apply H1 y Hy.
let x.
assume H2.
exact Eps_i_ax (fun x => x :e X /\ f x = y) x H2.
Qed.

Theorem inj_linv : forall X, forall f:set->set, (forall u v :e X, f u = f v -> u = v) -> forall x :e X, inv X f (f x) = x.
let X f.
assume H1.
let x. assume Hx.
claim L1: inv X f (f x) :e X /\ f (inv X f (f x)) = f x.
{ apply Eps_i_ax (fun x' => x' :e X /\ f x' = f x) x.
  apply andI.
  - exact Hx.
  - reflexivity.
}
apply L1.
assume H2 H3.
exact H1 (inv X f (f x)) H2 x Hx H3.
Qed.

Theorem bij_inv : forall X Y, forall f:set->set, bij X Y f -> bij Y X (inv X f).
let X Y f.
assume H1. apply H1.
assume H2. apply H2.
assume H3: forall u :e X, f u :e Y.
assume H4: forall u v :e X, f u = f v -> u = v.
assume H5: forall w :e Y, exists u :e X, f u = w.
set g : set->set := fun y => Eps_i (fun x => x :e X /\ f x = y).
claim L1: forall y :e Y, g y :e X /\ f (g y) = y.
{ exact surj_rinv X Y f H5. }
prove (forall u :e Y, g u :e X)
      /\
      (forall u v :e Y, g u = g v -> u = v)
      /\
      (forall w :e X, exists u :e Y, g u = w).
apply and3I.
- prove forall u :e Y, g u :e X.
  let u. assume Hu. apply L1 u Hu. assume H _. exact H.
- prove forall u v :e Y, g u = g v -> u = v.
  let u. assume Hu. let v. assume Hv H6.
  prove u = v.
  apply L1 u Hu.
  assume H7: g u :e X.
  assume H8: f (g u) = u.
  apply L1 v Hv.
  assume H9: g v :e X.
  assume H10: f (g v) = v.
  rewrite <- H8.
  rewrite <- H10.
  rewrite <- H6.
  reflexivity.
- prove forall w :e X, exists u :e Y, g u = w.
  let w. assume Hw.
  claim Lfw: f w :e Y.
  { exact H3 w Hw. }
  witness f w.
  apply andI.
  + exact Lfw.
  + exact inj_linv X f H4 w Hw.
Qed.

Theorem bij_id : forall X, bij X X (fun x => x).
let X.
prove (forall u :e X, u :e X) /\ (forall u v :e X, u = v -> u = v) /\ (forall w :e X, exists u :e X, u = w).
apply and3I.
- exact (fun u Hu => Hu).
- exact (fun u Hu v Hv H1 => H1).
- let w. assume Hw. witness w. apply andI.
  + exact Hw.
  + reflexivity.
Qed.

Theorem bij_comp : forall X Y Z:set, forall f g:set->set, bij X Y f -> bij Y Z g -> bij X Z (fun x => g (f x)).
let X Y Z f g.
assume Hf. apply Hf. assume Hf12 Hf3. apply Hf12. assume Hf1 Hf2.
assume Hg. apply Hg. assume Hg12 Hg3. apply Hg12. assume Hg1 Hg2.
prove (forall u :e X, g (f u) :e Z)
  /\
  (forall u v :e X, g (f u) = g (f v) -> u = v)
  /\
  (forall w :e Z, exists u :e X, g (f u) = w).
apply and3I.
- let u. assume Hu: u :e X. exact (Hg1 (f u) (Hf1 u Hu)).
- let u. assume Hu: u :e X. let v. assume Hv: v :e X.
  assume H1: g (f u) = g (f v).
  prove u = v.
  apply Hf2 u Hu v Hv.
  prove f u = f v.
  apply Hg2 (f u) (Hf1 u Hu) (f v) (Hf1 v Hv).
  prove g (f u) = g (f v).
  exact H1.
- let w. assume Hw: w :e Z. apply Hg3 w Hw.
  let y. assume Hy12. apply Hy12.
  assume Hy1: y :e Y. assume Hy2: g y = w.
  apply Hf3 y Hy1.
  let u. assume Hu12. apply Hu12.
  assume Hu1: u :e X. assume Hu2: f u = y.
  prove exists u :e X, g (f u) = w.
  witness u.
  apply andI.
  + exact Hu1.
  + rewrite Hu2. exact Hy2.
Qed.

Definition equip : set -> set -> prop
 := fun X Y : set => exists f : set -> set, bij X Y f.

Theorem equip_ref : forall X, equip X X.
let X.
prove exists f:set -> set, bij X X f.
witness (fun x:set => x).
exact bij_id X.
Qed.

Theorem equip_sym : forall X Y, equip X Y -> equip Y X.
let X Y. assume H1. apply H1.
let f. assume H2: bij X Y f.
prove exists g:set -> set, bij Y X g.
witness (inv X f).
prove bij Y X (inv X f).
exact bij_inv X Y f H2.
Qed.

Theorem equip_tra : forall X Y Z, equip X Y -> equip Y Z -> equip X Z.
let X Y Z. assume H1 H2.
apply H1.
let f. assume H3: bij X Y f.
apply H2.
let g. assume H4: bij Y Z g.
prove exists h:set -> set, bij X Z h.
witness (fun x:set => g (f x)).
exact bij_comp X Y Z f g H3 H4.
Qed.

Theorem equip_0_Empty : forall X, equip X 0 -> X = 0.
let X. assume H1.
apply Empty_eq.
let x. assume Hx.
prove False.
apply H1.
let f. assume Hf: bij X 0 f.
apply bijE X 0 f Hf.
assume Hf1: forall x :e X, f x :e 0.
prove False.
exact EmptyE (f x) (Hf1 x Hx).
Qed.

Section SchroederBernstein.

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

End SchroederBernstein.

Section PigeonHole.

Theorem PigeonHole_nat : forall n, nat_p n -> forall f:set -> set, (forall i :e ordsucc n, f i :e n) -> ~(forall i j :e ordsucc n, f i = f j -> i = j).
apply nat_ind (fun n => forall f:set -> set, (forall i :e ordsucc n, f i :e n) -> ~(forall i j :e ordsucc n, f i = f j -> i = j)).
- prove forall f:set -> set, (forall i :e 1, f i :e 0) -> ~(forall i j :e 1, f i = f j -> i = j).
  let f. assume H1. apply EmptyE (f 0) (H1 0 In_0_1).
- let n. assume Hn: nat_p n.
  assume IH: forall f:set -> set, (forall i :e ordsucc n, f i :e n) -> ~(forall i j :e ordsucc n, f i = f j -> i = j).
  let f.
  assume H1: forall i :e ordsucc (ordsucc n), f i :e ordsucc n.
  assume H2: forall i j :e ordsucc (ordsucc n), f i = f j -> i = j.
  apply xm (exists i :e ordsucc (ordsucc n), f i = n).
  + assume H3. apply H3. let k. assume Hk. apply Hk.
    assume Hk1: k :e ordsucc (ordsucc n).
    assume Hk2: f k = n.
    set f' := fun i:set => if k c= i then f (ordsucc i) else f i.
    apply IH f'.
    * { prove forall i :e ordsucc n, f' i :e n.
        let i. assume Hi: i :e ordsucc n.
        apply xm (k c= i).
	- assume H4: k c= i.
          prove (if k c= i then f (ordsucc i) else f i) :e n.
	  rewrite If_i_1 (k c= i) (f (ordsucc i)) (f i) H4.
	  prove f (ordsucc i) :e n.
	  claim L1: ordsucc i :e ordsucc (ordsucc n).
          { apply nat_ordsucc_in_ordsucc.
	    - apply nat_ordsucc. exact Hn.
	    - exact Hi.
	  }
	  apply ordsuccE n (f (ordsucc i)) (H1 (ordsucc i) L1).
	  + assume H5: f (ordsucc i) :e n. exact H5.
	  + assume H5: f (ordsucc i) = n.
	    prove False.
	    apply In_irref i.
	    prove i :e i.
	    claim L2: k = ordsucc i.
	    { apply H2.
	      - exact Hk1.
	      - exact L1.
	      - rewrite H5. exact Hk2.
	    }
	    claim L3: i :e k.
	    { rewrite L2. apply ordsuccI2. }
	    exact H4 i L3.
	- assume H4: ~(k c= i).
          prove (if k c= i then f (ordsucc i) else f i) :e n.
	  rewrite If_i_0 (k c= i) (f (ordsucc i)) (f i) H4.
	  prove f i :e n.
	  apply ordsuccE n (f i) (H1 i (ordsuccI1 (ordsucc n) i Hi)).
	  + assume H5: f i :e n. exact H5.
	  + assume H5: f i = n.
	    prove False.
	    apply H4.
	    prove k c= i.
	    claim L2: k = i.
	    { apply H2.
	      - exact Hk1.
	      - exact ordsuccI1 (ordsucc n) i Hi.
	      - rewrite H5. exact Hk2.
	    }
	    rewrite <- L2.
	    exact (fun x Hx => Hx).
      }
    * { prove forall i j :e ordsucc n, f' i = f' j -> i = j.
        let i. assume Hi. let j. assume Hj.
	prove (if k c= i then f (ordsucc i) else f i) = (if k c= j then f (ordsucc j) else f j) -> i = j.
	claim Li1: i :e ordsucc (ordsucc n).
	{ apply ordsuccI1. exact Hi. }
	claim Li2: ordsucc i :e ordsucc (ordsucc n).
	{ apply nat_ordsucc_in_ordsucc.
	  - apply nat_ordsucc. exact Hn.
	  - exact Hi.
        }
	claim Lj1: j :e ordsucc (ordsucc n).
	{ apply ordsuccI1. exact Hj. }
	claim Lj2: ordsucc j :e ordsucc (ordsucc n).
	{ apply nat_ordsucc_in_ordsucc.
	  - apply nat_ordsucc. exact Hn.
	  - exact Hj.
        }
	apply xm (k c= i).
	- assume H4: k c= i.
	  rewrite If_i_1 (k c= i) (f (ordsucc i)) (f i) H4.
	  apply xm (k c= j).
	  + assume H5: k c= j.
	    rewrite If_i_1 (k c= j) (f (ordsucc j)) (f j) H5.
	    prove f (ordsucc i) = f (ordsucc j) -> i = j.
	    assume H6.
	    apply ordsucc_inj.
	    prove ordsucc i = ordsucc j.
	    exact H2 (ordsucc i) Li2 (ordsucc j) Lj2 H6.
	  + assume H5: ~(k c= j).
	    rewrite If_i_0 (k c= j) (f (ordsucc j)) (f j) H5.
	    prove f (ordsucc i) = f j -> i = j.
	    assume H6.
	    prove False.
	    claim L3: ordsucc i = j.
	    { apply H2.
	      - exact Li2.
	      - exact Lj1.
	      - exact H6.
	    }
	    apply H5.
	    rewrite <- L3.
	    let x. assume Hx: x :e k.
	    apply ordsuccI1. apply H4. exact Hx.
	- assume H4: ~(k c= i).
	  rewrite If_i_0 (k c= i) (f (ordsucc i)) (f i) H4.
	  apply xm (k c= j).
	  + assume H5: k c= j.
	    rewrite If_i_1 (k c= j) (f (ordsucc j)) (f j) H5.
	    prove f i = f (ordsucc j) -> i = j.
	    assume H6.
	    prove False.
	    claim L3: i = ordsucc j.
	    { apply H2.
	      - exact Li1.
	      - exact Lj2.
	      - exact H6.
	    }
	    apply H4.
	    rewrite L3.
	    let x. assume Hx: x :e k.
	    apply ordsuccI1. apply H5. exact Hx.
	  + assume H5: ~(k c= j).
	    rewrite If_i_0 (k c= j) (f (ordsucc j)) (f j) H5.
	    prove f i = f j -> i = j.
	    apply H2.
	    * exact Li1.
	    * exact Lj1.
      }
  + assume H3: ~(exists i :e ordsucc (ordsucc n), f i = n).
    apply IH f.
    * { prove forall i :e ordsucc n, f i :e n.
        let i. assume Hi: i :e ordsucc n.
	apply ordsuccE n (f i) (H1 i (ordsuccI1 (ordsucc n) i Hi)).
	- assume Hfi: f i :e n. exact Hfi.
	- assume Hfi: f i = n. apply H3. witness i. apply andI.
	  + apply ordsuccI1. exact Hi.
	  + exact Hfi.
      }
    * { prove forall i j :e ordsucc n, f i = f j -> i = j.
        let i. assume Hi. let j. assume Hj.
	apply H2.
	- apply ordsuccI1. exact Hi.
	- apply ordsuccI1. exact Hj.
      }
Qed.

Theorem PigeonHole_nat_bij : forall n, nat_p n -> forall f:set -> set, (forall i :e n, f i :e n) -> (forall i j :e n, f i = f j -> i = j) -> bij n n f.
let n. assume Hn. let f. assume Hf1 Hf2.
prove (forall i :e n, f i :e n)
   /\ (forall i j :e n, f i = f j -> i = j)
   /\ (forall j :e n, exists i :e n, f i = j).
apply and3I.
- exact Hf1.
- exact Hf2.
- let j. assume Hj: j :e n. apply dneg. assume H1: ~exists i :e n, f i = j.
  set f' := fun i:set => if i = n then j else f i.
  apply PigeonHole_nat n Hn f'.
  + prove forall i :e ordsucc n, f' i :e n.
    let i. assume Hi.
    prove (if i = n then j else f i) :e n.
    apply xm (i = n).
    * assume H1: i = n.
      rewrite If_i_1 (i = n) j (f i) H1.
      prove j :e n.
      exact Hj.
    * { assume H1: i <> n.
        rewrite If_i_0 (i = n) j (f i) H1.
        prove f i :e n.
        apply Hf1.
        apply ordsuccE n i Hi.
	- assume H2: i :e n. exact H2.
	- assume H2: i = n. apply H1 H2.
      }
  + prove forall i k :e ordsucc n, f' i = f' k -> i = k.
    let i. assume Hi. let k. assume Hk.
    claim Li: i <> n -> i :e n.
    { assume Hin: i <> n.
      apply ordsuccE n i Hi.
      - assume H2. exact H2.
      - assume H2. apply Hin H2.
    }
    claim Lk: k <> n -> k :e n.
    { assume Hkn: k <> n.
      apply ordsuccE n k Hk.
      - assume H2. exact H2.
      - assume H2. apply Hkn H2.
    }
    prove (if i = n then j else f i) = (if k = n then j else f k) -> i = k.
    apply xm (i = n).
    * { assume H2: i = n.
        apply xm (k = n).
	- assume H3: k = n.
	  assume _. rewrite H3. exact H2.
	- assume H3: k <> n.
	  rewrite If_i_1 (i = n) j (f i) H2.
	  rewrite If_i_0 (k = n) j (f k) H3.
	  assume H4: j = f k.
	  apply H1. witness k.
	  apply andI.
	  + prove k :e n. exact Lk H3.
          + symmetry. exact H4.
      }
    * { assume H2: i <> n.
        apply xm (k = n).
	- assume H3: k = n.
	  rewrite If_i_0 (i = n) j (f i) H2.
	  rewrite If_i_1 (k = n) j (f k) H3.
	  assume H4: f i = j.
	  apply H1. witness i.
	  apply andI.
	  + prove i :e n. exact Li H2.
          + exact H4.
	- assume H3: k <> n.
	  rewrite If_i_0 (i = n) j (f i) H2.
	  rewrite If_i_0 (k = n) j (f k) H3.
	  prove f i = f k -> i = k.
	  apply Hf2.
	  + prove i :e n. exact Li H2.
	  + prove k :e n. exact Lk H3.
      }
Qed.

End PigeonHole.

Definition finite : set -> prop := fun X => exists n :e omega, equip X n.

Theorem finite_ind : forall p:set -> prop,
    p Empty
 -> (forall X y, finite X -> y /:e X -> p X -> p (X :\/: {y}))
 -> forall X, finite X -> p X.
let p. assume H1 H2.
claim L1: forall n, nat_p n -> forall X, equip X n -> p X.
{ apply nat_ind.
  - let X. assume H3: equip X 0.
    rewrite equip_0_Empty X H3. exact H1.
  - let n. assume Hn.
    assume IHn: forall X, equip X n -> p X.
    let X. assume H3: equip X (ordsucc n).
    apply equip_sym X (ordsucc n) H3.
    let f. assume Hf: bij (ordsucc n) X f.
    apply bijE (ordsucc n) X f Hf.
    assume Hf1: forall i :e ordsucc n, f i :e X.
    assume Hf2: forall i j :e ordsucc n, f i = f j -> i = j.
    assume Hf3: forall x :e X, exists i :e ordsucc n, f i = x.
    set Z := {f i|i :e n}.
    set y := f n.
    claim L1a: X = Z :\/: {y}.
    { apply set_ext.
      - let x. assume Hx: x :e X.
        apply Hf3 x Hx.
        let i. assume H. apply H.
        assume Hi: i :e ordsucc n.
        assume H4: f i = x.
        apply ordsuccE n i Hi.
        + assume H5: i :e n.
          apply binunionI1.
          prove x :e Z. rewrite <- H4.
          prove f i :e Z. apply ReplI. exact H5.
        + assume H5: i = n.
          apply binunionI2.
          prove x :e {y}. rewrite <- H4. rewrite H5.
          exact SingI (f n).
      - let x. assume Hx: x :e Z :\/: {y}.
        apply binunionE Z {y} x Hx.
        + assume H4: x :e Z.
          apply ReplE_impred n f x H4.
          let i. assume Hi: i :e n.
          assume H5: x = f i.
          prove x :e X. rewrite H5.
          prove f i :e X.
          exact Hf1 i (ordsuccI1 n i Hi).
        + assume H4: x :e {y}.
          rewrite SingE y x H4.
          prove f n :e X.
          exact Hf1 n (ordsuccI2 n).
    }
    claim L1b: equip Z n.
    { apply equip_sym.
      prove exists f:set -> set, bij n Z f.
      witness f. apply bijI.
      - let i. assume Hi. prove f i :e {f i|i :e n}. apply ReplI. exact Hi.
      - let i. assume Hi. let j. assume Hj.
        apply Hf2.
        + apply ordsuccI1. exact Hi.
        + apply ordsuccI1. exact Hj.
      - apply ReplE'.
        let i. assume Hi: i :e n.
        prove exists i' :e n, f i' = f i.
        witness i. apply andI.
        + exact Hi.
        + reflexivity.
    }
    rewrite L1a.
    prove p (Z :\/: {y}).
    apply H2 Z y.
    + prove finite Z.
      prove exists n :e omega, equip Z n.
      witness n. apply andI.
      * exact nat_p_omega n Hn.
      * exact L1b.
    + prove y /:e Z.
      assume H4: y :e Z.
      apply ReplE_impred n f y H4.
      let i. assume Hi: i :e n.
      assume H5: y = f i.
      apply In_irref n.
      prove n :e n.
      rewrite Hf2 n (ordsuccI2 n) i (ordsuccI1 n i Hi) H5 at 1.
      prove i :e n. exact Hi.
    + prove p Z. exact IHn Z L1b.
}
let X. assume H3. apply H3.
let n. assume H. apply H.
assume Hn: n :e omega.
assume H4: equip X n.
exact L1 n (omega_nat_p n Hn) X H4.
Qed.

Theorem finite_Empty: finite 0.
prove exists n :e omega, equip 0 n.
witness 0. apply andI.
- exact nat_p_omega 0 nat_0.
- apply equip_ref.
Qed.

Theorem adjoin_finite: forall X y, finite X -> finite (X :\/: {y}).
let X y. assume H1. apply H1.
let n. assume H. apply H.
assume Hn: n :e omega.
assume H2: equip X n.
apply equip_sym X n H2.
let f. assume Hf: bij n X f.
apply bijE n X f Hf.
assume Hf1: forall i :e n, f i :e X.
assume Hf2: forall i j :e n, f i = f j -> i = j.
assume Hf3: forall x :e X, exists i :e n, f i = x.
apply xm (y :e X).
- assume H3: y :e X.
  claim L1: X :\/: {y} = X.
  { apply set_ext.
    - let x. assume Hx. apply binunionE X {y} x Hx.
      + assume H4. exact H4.
      + assume H4: x :e {y}. rewrite SingE y x H4. exact H3.
    - apply binunion_Subq_1.
  }
  rewrite L1.
  exact H1.
- assume H3: y /:e X.
  prove exists m :e omega, equip (X :\/: {y}) m.
  witness ordsucc n. apply andI.
  + apply omega_ordsucc. exact Hn.
  + prove equip (X :\/: {y}) (ordsucc n).
    apply equip_sym.
    prove exists g:set -> set, bij (ordsucc n) (X :\/: {y}) g.
    claim Lg: exists g:set -> set, (forall i :e n, g i = f i) /\ g n = y.
    { witness (fun i : set => if i :e n then f i else y).
      apply andI.
      - let i. assume Hi. exact If_i_1 (i :e n) (f i) y Hi.
      - exact If_i_0 (n :e n) (f n) y (In_irref n).
    }
    apply Lg.
    let g. assume H. apply H.
    assume Hg1 Hg2.
    witness g.
    apply bijI.
    * { prove forall i :e ordsucc n, g i :e X :\/: {y}.
        let i. assume Hi. apply ordsuccE n i Hi.
        - assume H4: i :e n. apply binunionI1. rewrite Hg1 i H4.
          prove f i :e X. exact Hf1 i H4.
        - assume H4: i = n. apply binunionI2. rewrite H4. rewrite Hg2.
          apply SingI.
      }
    * { prove forall i j :e ordsucc n, g i = g j -> i = j.
        let i. assume Hi. let j. assume Hj.
        apply ordsuccE n i Hi.
        - assume H4: i :e n. rewrite Hg1 i H4.
          apply ordsuccE n j Hj.
          + assume H5: j :e n. rewrite Hg1 j H5.
            exact Hf2 i H4 j H5.
          + assume H5: j = n. rewrite H5. rewrite Hg2.
            assume H6: f i = y. prove False.
            apply H3. prove y :e X. rewrite <- H6.
            exact Hf1 i H4.
        - assume H4: i = n. rewrite H4. rewrite Hg2.
          apply ordsuccE n j Hj.
          + assume H5: j :e n. rewrite Hg1 j H5.
            assume H6: y = f j. prove False.
            apply H3. prove y :e X. rewrite H6.
            exact Hf1 j H5.
          + assume H5: j = n. rewrite H5.
            assume _. prove n = n. reflexivity.
      }
    * { prove forall x :e X :\/: {y}, exists i :e ordsucc n, g i = x.
        let x. assume Hx.
        apply binunionE X {y} x Hx.
        - assume H4: x :e X. apply Hf3 x H4.
          let i. assume H. apply H.
          assume Hi: i :e n. assume H5: f i = x.
          witness i. apply andI.
          + apply ordsuccI1. exact Hi.
          + prove g i = x. rewrite Hg1 i Hi. exact H5.
        - assume H4: x :e {y}.
          witness n. apply andI.
          + apply ordsuccI2.
          + prove g n = x. rewrite SingE y x H4. exact Hg2.
      }
Qed.

Theorem binunion_finite: forall X, finite X -> forall Y, finite Y -> finite (X :\/: Y).
let X. assume HX.
apply finite_ind.
- prove finite (X :\/: 0).
  rewrite binunion_idr X. exact HX.
- let Y z.
  assume HY: finite Y.
  assume Hz: z /:e Y.
  assume IH: finite (X :\/: Y).
  prove finite (X :\/: (Y :\/: {z})).
  rewrite binunion_asso.
  prove finite ((X :\/: Y) :\/: {z}).
  apply adjoin_finite. exact IH.
Qed.

Theorem famunion_nat_finite : forall X:set -> set, forall n, nat_p n -> (forall i :e n, finite (X i)) -> finite (\/_ i :e n, X i).
let X. apply nat_ind.
- assume _.
  prove finite (\/_ i :e 0, X i).
  rewrite famunion_Empty.
  exact finite_Empty.
- let n. assume Hn.
  assume IHn: (forall i :e n, finite (X i)) -> finite (\/_ i :e n, X i).
  assume H1: forall i :e ordsucc n, finite (X i).
  prove finite (\/_ i :e ordsucc n, X i).
  claim L1: (\/_ i :e ordsucc n, X i) = (\/_ i :e n, X i) :\/: X n.
  { apply set_ext.
    - let z. assume Hz: z :e \/_ i :e ordsucc n, X i.
      apply famunionE_impred (ordsucc n) X z Hz.
      let i. assume Hi: i :e ordsucc n.
      assume H2: z :e X i.
      apply ordsuccE n i Hi.
      + assume H3: i :e n. apply binunionI1.
        exact famunionI n X i z H3 H2.
      + assume H3: i = n. apply binunionI2. rewrite <- H3. exact H2.
    - let z. apply binunionE'.
      + assume Hz. apply famunionE_impred n X z Hz.
        let i. assume Hi: i :e n.
        assume H2: z :e X i.
        apply famunionI (ordsucc n) X i z.
        * apply ordsuccI1. exact Hi.
        * exact H2.
      + assume Hz. apply famunionI (ordsucc n) X n z.
        * apply ordsuccI2.
        * exact Hz.
  }
  rewrite L1.
  prove finite ((\/_ i :e n, X i) :\/: X n).
  apply binunion_finite.
  + apply IHn.
    let i. assume Hi: i :e n. apply H1. apply ordsuccI1. exact Hi.
  + apply H1 n. apply ordsuccI2.
Qed.

Theorem Subq_finite : forall X, finite X -> forall Y, Y c= X -> finite Y.
apply finite_ind.
- let Y. assume H1: Y c= 0.
  prove finite Y.
  rewrite Empty_Subq_eq Y H1. exact finite_Empty.
- let X z.
  assume HX: finite X.
  assume Hz: z /:e X.
  assume IH: forall Y, Y c= X -> finite Y.
  let Y.
  assume H1: Y c= X :\/: {z}.
  prove finite Y.
  apply xm (z :e Y).
  + assume H2: z :e Y.
    claim L1: Y = (Y :\: {z}) :\/: {z}.
    { apply set_ext.
      - let w. assume Hw: w :e Y.
        apply xm (w :e {z}).
        + assume H3: w :e {z}. apply binunionI2. exact H3.
        + assume H3: w /:e {z}. apply binunionI1. apply setminusI.
          * exact Hw.
          * exact H3.
      - let w. assume Hw: w :e (Y :\: {z}) :\/: {z}.
        apply binunionE (Y :\: {z}) {z} w Hw.
        + assume H3: w :e Y :\: {z}.
          exact setminusE1 Y {z} w H3.
        + assume H3: w :e {z}.
          prove w :e Y. rewrite SingE z w H3. exact H2.
    }
    rewrite L1.
    apply adjoin_finite.
    prove finite (Y :\: {z}).
    apply IH.
    let y. assume Hy: y :e Y :\: {z}.
    apply setminusE Y {z} y Hy.
    assume Hy1: y :e Y.
    assume Hy2: y /:e {z}.
    prove y :e X.
    apply binunionE X {z} y (H1 y Hy1).
    * assume H3: y :e X. exact H3.
    * assume H3: y :e {z}. prove False. apply Hy2. exact H3.
  + assume H2: z /:e Y.
    apply IH.
    let y. assume Hy: y :e Y.
    prove y :e X.
    apply binunionE X {z} y (H1 y Hy).
    * assume H3: y :e X. exact H3.
    * assume H3: y :e {z}.
      prove False. apply H2.
      prove z :e Y. rewrite <- SingE z y H3.
      exact Hy.
Qed.

Theorem TransSet_In_ordsucc_Subq : forall x y, TransSet y -> x :e ordsucc y -> x c= y.
let x y. assume H1 H2. apply ordsuccE y x H2.
- assume H3: x :e y. exact H1 x H3.
- assume H3: x = y. rewrite H3. apply Subq_ref.
Qed.

Theorem exandE_i : forall P Q:set -> prop, (exists x, P x /\ Q x) -> forall r:prop, (forall x, P x -> Q x -> r) -> r.
let P Q. assume H1. let r. assume Hr.
apply H1. let x. assume H2. apply H2. exact Hr x.
Qed.

Theorem exandE_ii : forall P Q:(set -> set) -> prop, (exists x:set -> set, P x /\ Q x) -> forall p:prop, (forall x:set -> set, P x -> Q x -> p) -> p.
let P Q. assume H. let p. assume Hp.
apply H. let x. assume H0.
apply H0.
assume H1 H2. exact Hp x H1 H2.
Qed.

Theorem exandE_iii : forall P Q:(set -> set -> set) -> prop, (exists x:set -> set -> set, P x /\ Q x) -> forall p:prop, (forall x:set -> set -> set, P x -> Q x -> p) -> p.
let P Q. assume H. let p. assume Hp.
apply H. let x. assume H0.
apply H0.
assume H1 H2. exact Hp x H1 H2.
Qed.

Theorem exandE_iiii : forall P Q:(set -> set -> set -> set) -> prop, (exists x:set -> set -> set -> set, P x /\ Q x) -> forall p:prop, (forall x:set -> set -> set -> set, P x -> Q x -> p) -> p.
let P Q. assume H. let p. assume Hp.
apply H. let x. assume H0.
apply H0.
assume H1 H2. exact Hp x H1 H2.
Qed.

Section Descr_ii.

Variable P : (set -> set) -> prop.

(* Parameter Descr_ii "a6e81668bfd1db6e6eb6a13bf66094509af176d9d0daccda274aa6582f6dcd7c" "3bae39e9880bbf5d70538d82bbb05caf44c2c11484d80d06dee0589d6f75178c" *)
Definition Descr_ii : set -> set := fun x:set => Eps_i (fun y => forall h:set -> set, P h -> h x = y).

Hypothesis Pex: exists f:set -> set, P f.
Hypothesis Puniq: forall f g:set -> set, P f -> P g -> f = g.

Theorem Descr_ii_prop : P Descr_ii.
apply Pex.
let f. assume Hf: P f.
claim L1: f = Descr_ii.
{ apply func_ext set set.
  let x.
  prove f x = Descr_ii x.
  prove f x = Eps_i (fun y => forall h:set -> set, P h -> h x = y).
  claim L2: forall h:set -> set, P h -> h x = f x.
  { let h. assume Hh. rewrite Puniq f h Hf Hh. exact (fun q H => H). }
  claim L3: forall h:set -> set, P h -> h x = Descr_ii x.
  { exact Eps_i_ax (fun y => forall h:set -> set, P h -> h x = y) (f x) L2. }
  exact L3 f Hf.
}
rewrite <- L1. exact Hf.
Qed.

End Descr_ii.

Section Descr_iii.

Variable P : (set -> set -> set) -> prop.

(* Parameter Descr_iii "dc42f3fe5d0c55512ef81fe5d2ad0ff27c1052a6814b1b27f5a5dcb6d86240bf" "ca5fc17a582fdd4350456951ccbb37275637ba6c06694213083ed9434fe3d545" *)
Definition Descr_iii : set -> set -> set := fun x y:set => Eps_i (fun z => forall h:set -> set -> set, P h -> h x y = z).

Hypothesis Pex: exists f:set -> set -> set, P f.
Hypothesis Puniq: forall f g:set -> set -> set, P f -> P g -> f = g.

Theorem Descr_iii_prop : P Descr_iii.
apply Pex.
let f. assume Hf: P f.
claim L1: f = Descr_iii.
{ apply func_ext set (set -> set).
  let x.
  apply func_ext set set.
  let y.
  prove f x y = Descr_iii x y.
  prove f x y = Eps_i (fun z => forall h:set -> set -> set, P h -> h x y = z).
  claim L2: forall h:set -> set -> set, P h -> h x y = f x y.
  { let h. assume Hh. rewrite Puniq f h Hf Hh. exact (fun q H => H). }
  claim L3: forall h:set -> set -> set, P h -> h x y = Descr_iii x y.
  { exact Eps_i_ax (fun z => forall h:set -> set -> set, P h -> h x y = z) (f x y) L2. }
  exact L3 f Hf.
}
rewrite <- L1. exact Hf.
Qed.

End Descr_iii.

Section Descr_Vo1.

Variable P : Vo 1 -> prop.

(* Parameter Descr_Vo1 "322bf09a1711d51a4512e112e1767cb2616a7708dc89d7312c8064cfee6e3315" "615c0ac7fca2b62596ed34285f29a77b39225d1deed75d43b7ae87c33ba37083" *)
Definition Descr_Vo1 : Vo 1 := fun x:set => forall h:set -> prop, P h -> h x.

Hypothesis Pex: exists f:Vo 1, P f.
Hypothesis Puniq: forall f g:Vo 1, P f -> P g -> f = g.

Theorem Descr_Vo1_prop : P Descr_Vo1.
apply Pex.
let f. assume Hf: P f.
claim L1: f = Descr_Vo1.
{ apply func_ext set prop.
  let x.
  prove f x = Descr_Vo1 x.
  apply prop_ext_2.
  - assume H1: f x. let h. assume Hh: P h. prove h x.
    rewrite <- Puniq f h Hf Hh. exact H1.
  - assume H1: Descr_Vo1 x.
    exact H1 f Hf.
}
rewrite <- L1. exact Hf.
Qed.

End Descr_Vo1.

Section If_ii.

Variable p:prop.
Variable f g:set -> set.

(* Parameter If_ii "e76df3235104afd8b513a92c00d3cc56d71dd961510bf955a508d9c2713c3f29" "17057f3db7be61b4e6bd237e7b37125096af29c45cb784bb9cc29b1d52333779" *)
Definition If_ii : set -> set := fun x => if p then f x else g x.

Theorem If_ii_1 : p -> If_ii = f.
assume H1. apply func_ext set set.
let x.
prove If_ii x = f x.
exact If_i_1 p (f x) (g x) H1.
Qed.

Theorem If_ii_0 : ~p -> If_ii = g.
assume H1. apply func_ext set set.
let x.
prove If_ii x = g x.
exact If_i_0 p (f x) (g x) H1.
Qed.

End If_ii.

Section If_iii.

Variable p:prop.
Variable f g:set -> set -> set.

(* Parameter If_iii "53034f33cbed012c3c6db42812d3964f65a258627a765f5bede719198af1d1ca" "3314762dce5a2e94b7e9e468173b047dd4a9fac6ee2c5f553c6ea15e9c8b7542" *)
Definition If_iii : set -> set -> set := fun x y => if p then f x y else g x y.

Theorem If_iii_1 : p -> If_iii = f.
assume H1.
apply func_ext set (set -> set).
let x.
apply func_ext set set.
let y.
prove If_iii x y = f x y.
exact If_i_1 p (f x y) (g x y) H1.
Qed.

Theorem If_iii_0 : ~p -> If_iii = g.
assume H1.
apply func_ext set (set -> set).
let x.
apply func_ext set set.
let y.
prove If_iii x y = g x y.
exact If_i_0 p (f x y) (g x y) H1.
Qed.

End If_iii.

Section EpsilonRec_i.

Variable F:set -> (set -> set) -> set.

Definition In_rec_i_G : set -> set -> prop :=
fun X Y =>
forall R:set->set->prop,
(forall X:set, forall f:set->set, (forall x :e X, R x (f x)) -> R X (F X f)) ->
R X Y.

(* Parameter In_rec_i "f97da687c51f5a332ff57562bd465232bc70c9165b0afe0a54e6440fc4962a9f" "fac413e747a57408ad38b3855d3cde8673f86206e95ccdadff2b5babaf0c219e" *)
Definition In_rec_i : set -> set := fun X => Eps_i (In_rec_i_G X).

Theorem In_rec_i_G_c : forall X:set, forall f:set->set, (forall x :e X, In_rec_i_G x (f x)) -> In_rec_i_G X (F X f).
let X:set.
let f:set->set.
assume H1: forall x :e X, In_rec_i_G x (f x).
prove In_rec_i_G X (F X f).
let R:set->set->prop.
assume H2: forall X:set, forall f:set->set, (forall x :e X, R x (f x)) -> R X (F X f).
prove R X (F X f).
apply (H2 X f).
prove forall x :e X, R x (f x).
let x:set.
assume H3: x :e X.
prove R x (f x).
exact (H1 x H3 R H2).
Qed.

Theorem In_rec_i_G_inv : forall X:set, forall Y:set, In_rec_i_G X Y -> exists f:set->set, (forall x :e X, In_rec_i_G x (f x)) /\ Y = F X f.
let X Y.
assume H1: In_rec_i_G X Y.
set R := (fun X:set => fun Y:set => exists f:set->set, (forall x :e X, In_rec_i_G x (f x)) /\ Y = F X f).
apply (H1 R).
prove forall Z:set, forall g:set->set, (forall z :e Z, R z (g z)) -> R Z (F Z g).
let Z g.
assume IH: forall z :e Z, exists f:set->set, (forall x :e z, In_rec_i_G x (f x)) /\ g z = F z f.
prove exists f:set->set, (forall x :e Z, In_rec_i_G x (f x)) /\ F Z g = F Z f.
witness g. apply andI.
- let z.
  assume H2: z :e Z.
  apply (exandE_ii (fun f => forall x :e z, In_rec_i_G x (f x)) (fun f => g z = F z f) (IH z H2)).
  let f:set->set.
  assume H3: forall x :e z, In_rec_i_G x (f x).
  assume H4: g z = F z f.
  prove In_rec_i_G z (g z).
  rewrite H4.
  prove In_rec_i_G z (F z f).
  exact (In_rec_i_G_c z f H3).
- reflexivity.
Qed.

Hypothesis Fr:forall X:set, forall g h:set -> set, (forall x :e X, g x = h x) -> F X g = F X h.

Theorem In_rec_i_G_f : forall X:set, forall Y Z:set, In_rec_i_G X Y -> In_rec_i_G X Z -> Y = Z.
apply In_ind.
let X.
assume IH: forall x :e X, forall y z:set, In_rec_i_G x y -> In_rec_i_G x z -> y = z.
let Y Z.
assume H1: In_rec_i_G X Y.
assume H2: In_rec_i_G X Z.
prove Y = Z.
claim L1: exists f:set->set, (forall x :e X, In_rec_i_G x (f x)) /\ Y = F X f.
{ exact (In_rec_i_G_inv X Y H1). }
claim L2: exists f:set->set, (forall x :e X, In_rec_i_G x (f x)) /\ Z = F X f.
{ exact (In_rec_i_G_inv X Z H2). }
apply (exandE_ii (fun f => forall x :e X, In_rec_i_G x (f x)) (fun f => Y = F X f) L1).
let g.
assume H3: forall x :e X, In_rec_i_G x (g x).
assume H4: Y = F X g.
apply (exandE_ii (fun f => forall x :e X, In_rec_i_G x (f x)) (fun f => Z = F X f) L2).
let h.
assume H5: forall x :e X, In_rec_i_G x (h x).
assume H6: Z = F X h.
prove Y = Z.
rewrite H4.
rewrite H6.
prove F X g = F X h.
apply Fr.
prove forall x :e X, g x = h x.
let x.
assume H7: x :e X.
exact (IH x H7 (g x) (h x) (H3 x H7) (H5 x H7)).
Qed.

Theorem In_rec_i_G_In_rec_i : forall X:set, In_rec_i_G X (In_rec_i X).
apply In_ind.
let X.
assume IH: forall x :e X, In_rec_i_G x (In_rec_i x).
prove In_rec_i_G X (In_rec_i X).
prove In_rec_i_G X (Eps_i (In_rec_i_G X)).
apply (Eps_i_ax (In_rec_i_G X) (F X In_rec_i)).
prove In_rec_i_G X (F X In_rec_i).
exact (In_rec_i_G_c X In_rec_i IH).
Qed.

Theorem In_rec_i_G_In_rec_i_d : forall X:set, In_rec_i_G X (F X In_rec_i).
let X R.
assume H1: forall X:set, forall f:set->set, (forall x :e X, R x (f x)) -> R X (F X f).
apply (H1 X In_rec_i).
let x. assume _.
exact (In_rec_i_G_In_rec_i x R H1).
Qed.

Theorem In_rec_i_eq : forall X:set, In_rec_i X = F X In_rec_i.
exact (fun X : set => In_rec_i_G_f X (In_rec_i X) (F X In_rec_i) (In_rec_i_G_In_rec_i X) (In_rec_i_G_In_rec_i_d X)).
Qed.

End EpsilonRec_i.

Section EpsilonRec_ii.

Variable F:set -> (set -> (set -> set)) -> (set -> set).

Definition In_rec_G_ii : set -> (set -> set) -> prop :=
fun X Y =>
forall R:set->(set -> set)->prop,
(forall X:set, forall f:set->(set -> set), (forall x :e X, R x (f x)) -> R X (F X f)) ->
R X Y.

(* Parameter In_rec_ii "4d137cad40b107eb0fc2c707372525f1279575e6cadb4ebc129108161af3cedb" "f3c9abbc5074c0d68e744893a170de526469426a5e95400ae7fc81f74f412f7e" *)
Definition In_rec_ii : set -> (set -> set) := fun X => Descr_ii (In_rec_G_ii X).

Theorem In_rec_G_ii_c : forall X:set, forall f:set->(set -> set), (forall x :e X, In_rec_G_ii x (f x)) -> In_rec_G_ii X (F X f).
let X:set.
let f:set->(set -> set).
assume H1: forall x :e X, In_rec_G_ii x (f x).
prove In_rec_G_ii X (F X f).
let R:set->(set -> set)->prop.
assume H2: forall X:set, forall f:set->(set -> set), (forall x :e X, R x (f x)) -> R X (F X f).
prove R X (F X f).
apply (H2 X f).
prove forall x :e X, R x (f x).
let x:set.
assume H3: x :e X.
prove R x (f x).
exact (H1 x H3 R H2).
Qed.

Theorem In_rec_G_ii_inv : forall X:set, forall Y:(set -> set), In_rec_G_ii X Y -> exists f:set->(set -> set), (forall x :e X, In_rec_G_ii x (f x)) /\ Y = F X f.
let X Y.
assume H1: In_rec_G_ii X Y.
set R := (fun X:set => fun Y:(set -> set) => exists f:set->(set -> set), (forall x :e X, In_rec_G_ii x (f x)) /\ Y = F X f).
apply (H1 R).
prove forall Z:set, forall g:set->(set -> set), (forall z :e Z, R z (g z)) -> R Z (F Z g).
let Z g.
assume IH: forall z :e Z, exists f:set->(set -> set), (forall x :e z, In_rec_G_ii x (f x)) /\ g z = F z f.
prove exists f:set->(set -> set), (forall x :e Z, In_rec_G_ii x (f x)) /\ F Z g = F Z f.
witness g. apply andI.
- let z.
  assume H2: z :e Z.
  apply (exandE_iii (fun f => forall x :e z, In_rec_G_ii x (f x)) (fun f => g z = F z f) (IH z H2)).
  let f:set->(set -> set).
  assume H3: forall x :e z, In_rec_G_ii x (f x).
  assume H4: g z = F z f.
  prove In_rec_G_ii z (g z).
  rewrite H4.
  prove In_rec_G_ii z (F z f).
  exact (In_rec_G_ii_c z f H3).
- exact (fun q H => H).
Qed.

Hypothesis Fr:forall X:set, forall g h:set -> (set -> set), (forall x :e X, g x = h x) -> F X g = F X h.

Theorem In_rec_G_ii_f : forall X:set, forall Y Z:(set -> set), In_rec_G_ii X Y -> In_rec_G_ii X Z -> Y = Z.
apply In_ind.
let X.
assume IH: forall x :e X, forall y z:(set -> set), In_rec_G_ii x y -> In_rec_G_ii x z -> y = z.
let Y Z.
assume H1: In_rec_G_ii X Y.
assume H2: In_rec_G_ii X Z.
prove Y = Z.
claim L1: exists f:set->(set -> set), (forall x :e X, In_rec_G_ii x (f x)) /\ Y = F X f.
{ exact (In_rec_G_ii_inv X Y H1). }
claim L2: exists f:set->(set -> set), (forall x :e X, In_rec_G_ii x (f x)) /\ Z = F X f.
{ exact (In_rec_G_ii_inv X Z H2). }
apply (exandE_iii (fun f => forall x :e X, In_rec_G_ii x (f x)) (fun f => Y = F X f) L1).
let g.
assume H3: forall x :e X, In_rec_G_ii x (g x).
assume H4: Y = F X g.
apply (exandE_iii (fun f => forall x :e X, In_rec_G_ii x (f x)) (fun f => Z = F X f) L2).
let h.
assume H5: forall x :e X, In_rec_G_ii x (h x).
assume H6: Z = F X h.
prove Y = Z.
rewrite H4.
rewrite H6.
prove F X g = F X h.
apply Fr.
prove forall x :e X, g x = h x.
let x.
assume H7: x :e X.
exact (IH x H7 (g x) (h x) (H3 x H7) (H5 x H7)).
Qed.

Theorem In_rec_G_ii_In_rec_ii : forall X:set, In_rec_G_ii X (In_rec_ii X).
apply In_ind.
let X.
assume IH: forall x :e X, In_rec_G_ii x (In_rec_ii x).
prove In_rec_G_ii X (In_rec_ii X).
prove In_rec_G_ii X (Descr_ii (In_rec_G_ii X)).
apply (Descr_ii_prop (In_rec_G_ii X)).
- witness (F X In_rec_ii).
  prove In_rec_G_ii X (F X In_rec_ii).
  exact (In_rec_G_ii_c X In_rec_ii IH).
- exact In_rec_G_ii_f X.
Qed.

Theorem In_rec_G_ii_In_rec_ii_d : forall X:set, In_rec_G_ii X (F X In_rec_ii).
let X R.
assume H1: forall X:set, forall f:set->(set -> set), (forall x :e X, R x (f x)) -> R X (F X f).
apply (H1 X In_rec_ii).
let x. assume _.
exact (In_rec_G_ii_In_rec_ii x R H1).
Qed.

Theorem In_rec_ii_eq : forall X:set, In_rec_ii X = F X In_rec_ii.
exact (fun X : set => In_rec_G_ii_f X (In_rec_ii X) (F X In_rec_ii) (In_rec_G_ii_In_rec_ii X) (In_rec_G_ii_In_rec_ii_d X)).
Qed.

End EpsilonRec_ii.

Section EpsilonRec_iii.

Variable F:set -> (set -> (set -> set -> set)) -> (set -> set -> set).

Definition In_rec_G_iii : set -> (set -> set -> set) -> prop :=
fun X Y =>
forall R:set->(set -> set -> set)->prop,
(forall X:set, forall f:set->(set -> set -> set), (forall x :e X, R x (f x)) -> R X (F X f)) ->
R X Y.

(* Parameter In_rec_iii "222f1b8dcfb0d2e33cc4b232e87cbcdfe5c4a2bdc5326011eb70c6c9aeefa556" "9b3a85b85e8269209d0ca8bf18ef658e56f967161bf5b7da5e193d24d345dd06" *)
Definition In_rec_iii : set -> (set -> set -> set) := fun X => Descr_iii (In_rec_G_iii X).

Theorem In_rec_G_iii_c : forall X:set, forall f:set->(set -> set -> set), (forall x :e X, In_rec_G_iii x (f x)) -> In_rec_G_iii X (F X f).
let X:set.
let f:set->(set -> set -> set).
assume H1: forall x :e X, In_rec_G_iii x (f x).
prove In_rec_G_iii X (F X f).
let R:set->(set -> set -> set)->prop.
assume H2: forall X:set, forall f:set->(set -> set -> set), (forall x :e X, R x (f x)) -> R X (F X f).
prove R X (F X f).
apply (H2 X f).
prove forall x :e X, R x (f x).
let x:set.
assume H3: x :e X.
prove R x (f x).
exact (H1 x H3 R H2).
Qed.

Theorem In_rec_G_iii_inv : forall X:set, forall Y:(set -> set -> set), In_rec_G_iii X Y -> exists f:set->(set -> set -> set), (forall x :e X, In_rec_G_iii x (f x)) /\ Y = F X f.
let X Y.
assume H1: In_rec_G_iii X Y.
set R := (fun X:set => fun Y:(set -> set -> set) => exists f:set->(set -> set -> set), (forall x :e X, In_rec_G_iii x (f x)) /\ Y = F X f).
apply (H1 R).
prove forall Z:set, forall g:set->(set -> set -> set), (forall z :e Z, R z (g z)) -> R Z (F Z g).
let Z g.
assume IH: forall z :e Z, exists f:set->(set -> set -> set), (forall x :e z, In_rec_G_iii x (f x)) /\ g z = F z f.
prove exists f:set->(set -> set -> set), (forall x :e Z, In_rec_G_iii x (f x)) /\ F Z g = F Z f.
witness g. apply andI.
- let z.
  assume H2: z :e Z.
  apply (exandE_iiii (fun f => forall x :e z, In_rec_G_iii x (f x)) (fun f => g z = F z f) (IH z H2)).
  let f:set->(set -> set -> set).
  assume H3: forall x :e z, In_rec_G_iii x (f x).
  assume H4: g z = F z f.
  prove In_rec_G_iii z (g z).
  rewrite H4.
  prove In_rec_G_iii z (F z f).
  exact (In_rec_G_iii_c z f H3).
- exact (fun q H => H).
Qed.

Hypothesis Fr:forall X:set, forall g h:set -> (set -> set -> set), (forall x :e X, g x = h x) -> F X g = F X h.

Theorem In_rec_G_iii_f : forall X:set, forall Y Z:(set -> set -> set), In_rec_G_iii X Y -> In_rec_G_iii X Z -> Y = Z.
apply In_ind.
let X.
assume IH: forall x :e X, forall y z:(set -> set -> set), In_rec_G_iii x y -> In_rec_G_iii x z -> y = z.
let Y Z.
assume H1: In_rec_G_iii X Y.
assume H2: In_rec_G_iii X Z.
prove Y = Z.
claim L1: exists f:set->(set -> set -> set), (forall x :e X, In_rec_G_iii x (f x)) /\ Y = F X f.
{ exact (In_rec_G_iii_inv X Y H1). }
claim L2: exists f:set->(set -> set -> set), (forall x :e X, In_rec_G_iii x (f x)) /\ Z = F X f.
{ exact (In_rec_G_iii_inv X Z H2). }
apply (exandE_iiii (fun f => forall x :e X, In_rec_G_iii x (f x)) (fun f => Y = F X f) L1).
let g.
assume H3: forall x :e X, In_rec_G_iii x (g x).
assume H4: Y = F X g.
apply (exandE_iiii (fun f => forall x :e X, In_rec_G_iii x (f x)) (fun f => Z = F X f) L2).
let h.
assume H5: forall x :e X, In_rec_G_iii x (h x).
assume H6: Z = F X h.
prove Y = Z.
rewrite H4.
rewrite H6.
prove F X g = F X h.
apply Fr.
prove forall x :e X, g x = h x.
let x.
assume H7: x :e X.
exact (IH x H7 (g x) (h x) (H3 x H7) (H5 x H7)).
Qed.

Theorem In_rec_G_iii_In_rec_iii : forall X:set, In_rec_G_iii X (In_rec_iii X).
apply In_ind.
let X.
assume IH: forall x :e X, In_rec_G_iii x (In_rec_iii x).
prove In_rec_G_iii X (In_rec_iii X).
prove In_rec_G_iii X (Descr_iii (In_rec_G_iii X)).
apply (Descr_iii_prop (In_rec_G_iii X)).
- witness (F X In_rec_iii).
  prove In_rec_G_iii X (F X In_rec_iii).
  exact (In_rec_G_iii_c X In_rec_iii IH).
- exact In_rec_G_iii_f X.
Qed.

Theorem In_rec_G_iii_In_rec_iii_d : forall X:set, In_rec_G_iii X (F X In_rec_iii).
let X R.
assume H1: forall X:set, forall f:set->(set -> set -> set), (forall x :e X, R x (f x)) -> R X (F X f).
apply (H1 X In_rec_iii).
let x. assume _.
exact (In_rec_G_iii_In_rec_iii x R H1).
Qed.

Theorem In_rec_iii_eq : forall X:set, In_rec_iii X = F X In_rec_iii.
exact (fun X : set => In_rec_G_iii_f X (In_rec_iii X) (F X In_rec_iii) (In_rec_G_iii_In_rec_iii X) (In_rec_G_iii_In_rec_iii_d X)).
Qed.

End EpsilonRec_iii.

Section NatRec.

Variable z:set.
Variable f:set->set->set.
Let F : set->(set->set)->set := fun n g => if Union n :e n then f (Union n) (g (Union n)) else z.

Definition nat_primrec : set->set := In_rec_i F.

Theorem nat_primrec_r : forall X:set, forall g h:set -> set, (forall x :e X, g x = h x) -> F X g = F X h.
let X g h.
assume H1: forall x :e X, g x = h x.
prove F X g = F X h.
apply xm (Union X :e X).
- assume H2: (Union X :e X).
  prove (if Union X :e X then f (Union X) (g (Union X)) else z) = (if Union X :e X then f (Union X) (h (Union X)) else z).
  rewrite (H1 (Union X) H2).
  prove (if Union X :e X then f (Union X) (h (Union X)) else z) = (if Union X :e X then f (Union X) (h (Union X)) else z).
  exact (fun q H => H).
- assume H2: ~(Union X :e X).
  prove (if Union X :e X then f (Union X) (g (Union X)) else z) = (if Union X :e X then f (Union X) (h (Union X)) else z).
  claim L1: (if Union X :e X then f (Union X) (g (Union X)) else z) = z.
  { exact (If_i_0 (Union X :e X) (f (Union X) (g (Union X))) z H2). }
  claim L2: (if Union X :e X then f (Union X) (h (Union X)) else z) = z.
  { exact (If_i_0 (Union X :e X) (f (Union X) (h (Union X))) z H2). }
  rewrite L2.
  exact L1.
Qed.

Theorem nat_primrec_0 : nat_primrec 0 = z.
prove (In_rec_i F 0 = z).
rewrite (In_rec_i_eq F nat_primrec_r).
prove F 0 (In_rec_i F) = z.
prove (if Union 0 :e 0 then f (Union 0) (In_rec_i F (Union 0)) else z) = z.
exact (If_i_0 (Union 0 :e 0) (f (Union 0) (In_rec_i F (Union 0))) z (EmptyE (Union 0))).
Qed.

Theorem nat_primrec_S : forall n:set, nat_p n -> nat_primrec (ordsucc n) = f n (nat_primrec n).
let n.
assume Hn: nat_p n.
prove (In_rec_i F (ordsucc n) = f n (In_rec_i F n)).
rewrite (In_rec_i_eq F nat_primrec_r) at 1.
prove F (ordsucc n) (In_rec_i F) = f n (In_rec_i F n).
prove (if Union (ordsucc n) :e ordsucc n then f (Union (ordsucc n)) (In_rec_i F (Union (ordsucc n))) else z) = f n (In_rec_i F n).
rewrite (Union_ordsucc_eq n Hn).
prove (if n :e ordsucc n then f n (In_rec_i F n) else z) = f n (In_rec_i F n).
exact (If_i_1 (n :e ordsucc n) (f n (In_rec_i F n)) z (ordsuccI2 n)).
Qed.

End NatRec.

Section NatArith.

Definition add_nat : set->set->set := fun n m:set => nat_primrec n (fun _ r => ordsucc r) m.

Infix + 360 right := add_nat.

Theorem add_nat_0R : forall n:set, n + 0 = n.
let n.
exact (nat_primrec_0 n (fun _ r => ordsucc r)).
Qed.

Theorem add_nat_SR : forall n m:set, nat_p m -> n + ordsucc m = ordsucc (n + m).
let n m. assume Hm.
exact (nat_primrec_S n (fun _ r => ordsucc r) m Hm).
Qed.

Theorem add_nat_p : forall n:set, nat_p n -> forall m:set, nat_p m -> nat_p (n + m).
let n.
assume Hn: nat_p n.
apply nat_ind.
- prove nat_p (n+0).
  rewrite (add_nat_0R n).
  prove nat_p n.
  exact Hn.
- let m.
  assume Hm: nat_p m.
  assume IHm: nat_p (n+m).
  prove nat_p (n + ordsucc m).
  rewrite (add_nat_SR n m Hm).
  prove nat_p (ordsucc (n+m)).
  apply nat_ordsucc.
  prove nat_p (n+m).
  exact IHm.
Qed.

Theorem add_nat_1_1_2 : 1 + 1 = 2.
symmetry.
prove ordsucc 1 = 1 + ordsucc 0.
rewrite add_nat_SR 1 0 nat_0.
prove ordsucc 1 = ordsucc (1 + 0).
rewrite add_nat_0R 1.
exact (fun q H => H).
Qed.

Theorem add_nat_0L : forall m:set, nat_p m -> 0+m = m.
apply nat_ind.
- prove 0+0 = 0.
  apply add_nat_0R.
- let m.
  assume Hm: nat_p m.
  assume IHm: 0 + m = m.
  prove 0 + ordsucc m = ordsucc m.
  rewrite (add_nat_SR 0 m Hm).
  prove ordsucc (0 + m) = ordsucc m.
  rewrite IHm.
  reflexivity.
Qed.

Theorem add_nat_SL : forall n:set, nat_p n -> forall m:set, nat_p m -> ordsucc n + m = ordsucc (n+m).
let n.
assume Hn: nat_p n.
apply nat_ind.
- prove ordsucc n + 0 = ordsucc (n+0).
  rewrite add_nat_0R. rewrite add_nat_0R.
  reflexivity.
- let m.
  assume Hm: nat_p m.
  assume IHm: ordsucc n + m = ordsucc (n+m).
  prove ordsucc n + ordsucc m = ordsucc (n + ordsucc m).
  rewrite (add_nat_SR (ordsucc n) m Hm).
  prove ordsucc (ordsucc n + m) = ordsucc (n + ordsucc m).
  rewrite (add_nat_SR n m Hm).
  prove ordsucc (ordsucc n + m) = ordsucc (ordsucc (n + m)).
  rewrite IHm.
  reflexivity.
Qed.

Theorem add_nat_com : forall n:set, nat_p n -> forall m:set, nat_p m -> n + m = m + n.
let n.
assume Hn: nat_p n.
apply nat_ind.
- prove n + 0 = 0 + n.
  rewrite (add_nat_0L n Hn).
  exact (add_nat_0R n).
- let m.
  assume Hm: nat_p m.
  assume IHm: n+m = m+n.
  prove n + ordsucc m = ordsucc m + n.
  rewrite (add_nat_SL m Hm n Hn).
  prove n + ordsucc m = ordsucc (m + n).
  rewrite <- IHm.
  prove n + ordsucc m = ordsucc (n + m).
  exact (add_nat_SR n m Hm).
Qed.

Theorem nat_Subq_add_ex: forall n, nat_p n -> forall m, nat_p m -> n c= m -> exists k, nat_p k /\ m = k + n.
apply nat_ind.
- let m. assume Hm Hnm. witness m. apply andI.
  + exact Hm.
  + prove m = m + 0.
    symmetry.
    exact add_nat_0R m.
- let n. assume Hn.
  assume IH: forall m, nat_p m -> n c= m -> exists k, nat_p k /\ m = k + n.
  apply nat_inv_impred.
  + assume Hnm: ordsucc n c= 0. prove False.
    apply EmptyE n. prove n :e 0. apply Hnm. apply ordsuccI2.
  + let m.
    assume Hm: nat_p m.
    assume Hnm: ordsucc n c= ordsucc m.
    claim Lnm: n c= m.
    { apply ordinal_In_Or_Subq m n (nat_p_ordinal m Hm) (nat_p_ordinal n Hn).
      - assume H1: m :e n. prove False.
        apply In_irref (ordsucc m).
        apply Hnm.
        prove ordsucc m :e ordsucc n.
        exact nat_ordsucc_in_ordsucc n Hn m H1.
      - assume H1: n c= m. exact H1.
    }
    apply IH m Hm Lnm.
    let k. assume H. apply H.
    assume Hk: nat_p k.
    assume H1: m = k + n.
    prove exists k, nat_p k /\ ordsucc m = k + ordsucc n.
    witness k. apply andI.
    * exact Hk.
    * prove ordsucc m = k + ordsucc n.
      rewrite add_nat_SR k n Hn.
      prove ordsucc m = ordsucc (k + n).
      f_equal.
      exact H1.
Qed.

Definition mul_nat : set->set->set := fun n m:set => nat_primrec 0 (fun _ r => n + r) m.

Infix * 355 right := mul_nat.

Theorem mul_nat_0R : forall n:set, n * 0 = 0.
let n.
exact (nat_primrec_0 0 (fun _ r => n + r)).
Qed.

Theorem mul_nat_SR : forall n m:set, nat_p m -> n * ordsucc m = n + n * m.
let n m. assume Hm.
exact (nat_primrec_S 0 (fun _ r => n + r) m Hm).
Qed.

Theorem mul_nat_p : forall n:set, nat_p n -> forall m:set, nat_p m -> nat_p (n * m).
let n.
assume Hn: nat_p n.
apply nat_ind.
- prove nat_p (n*0).
  rewrite (mul_nat_0R n).
  prove nat_p 0.
  exact nat_0.
- let m.
  assume Hm: nat_p m.
  assume IHm: nat_p (n*m).
  prove nat_p (n * ordsucc m).
  rewrite (mul_nat_SR n m Hm).
  prove nat_p (n + n*m).
  exact (add_nat_p n Hn (n*m) IHm).
Qed.

End NatArith.

(*** Injection of set into itself that will correspond to x |-> (1,x) after pairing is defined. ***)
Definition Inj1 : set -> set := In_rec_i (fun X f => {0} :\/: {f x|x :e X}).

Theorem Inj1_eq : forall X:set, Inj1 X = {0} :\/: {Inj1 x|x :e X}.
claim L1: forall X:set, forall g h:set->set, (forall x :e X, g x = h x)
                         -> {0} :\/: {g x|x :e X} = {0} :\/: {h x|x :e X}.
{
  let X g h.
   assume H: forall x :e X, g x = h x.
   claim L1a: {g x|x :e X} = {h x|x :e X}.
   {
     exact (ReplEq_ext X g h H).
   }
   prove {0} :\/: {g x|x :e X} = {0} :\/: {h x|x :e X}.
   rewrite L1a.
   reflexivity.
}
exact (In_rec_i_eq (fun X f => {0} :\/: {f x|x :e X}) L1).
Qed.

Theorem Inj1I1 : forall X:set, 0 :e Inj1 X.
let X.
rewrite (Inj1_eq X).
prove 0 :e {0} :\/: {Inj1 x|x :e X}.
apply binunionI1.
apply SingI.
Qed.

Theorem Inj1I2 : forall X x:set, x :e X -> Inj1 x :e Inj1 X.
let X x.
assume H: x :e X.
rewrite (Inj1_eq X).
prove Inj1 x :e {0} :\/: {Inj1 x|x :e X}.
apply binunionI2.
exact (ReplI X Inj1 x H).
Qed.

Theorem Inj1E : forall X y:set, y :e Inj1 X -> y = 0 \/ exists x :e X, y = Inj1 x.
let X y.
rewrite (Inj1_eq X).
assume H1: y :e {0} :\/: {Inj1 x|x :e X}.
prove y = 0 \/ exists x :e X, y = Inj1 x.
apply (binunionE {0} {Inj1 x|x :e X} y H1).
- assume H2: y :e {0}.
  apply orIL.
  exact (SingE 0 y H2).
- assume H2: y :e {Inj1 x|x :e X}.
  apply orIR.
  prove exists x :e X, y = Inj1 x.
  exact (ReplE X Inj1 y H2).
Qed.

Theorem Inj1NE1 : forall x:set, Inj1 x <> 0.
let x.
assume H1: Inj1 x = 0.
apply (EmptyE 0).
prove 0 :e 0.
rewrite <- H1 at 2.
prove 0 :e Inj1 x.
exact (Inj1I1 x).
Qed.

Theorem Inj1NE2 : forall x:set, Inj1 x /:e {0}.
let x.
assume H1: Inj1 x :e {0}.
exact (Inj1NE1 x (SingE 0 (Inj1 x) H1)).
Qed.

(*** Injection of set into itself that will correspond to x |-> (0,x) after pairing is defined. ***)
Definition Inj0 : set -> set := fun X => {Inj1 x|x :e X}.

Theorem Inj0I : forall X x:set, x :e X -> Inj1 x :e Inj0 X.
exact (fun X x H => ReplI X Inj1 x H).
Qed.

Theorem Inj0E : forall X y:set, y :e Inj0 X -> exists x:set, x :e X /\ y = Inj1 x.
exact (fun X y H => ReplE X Inj1 y H).
Qed.

(*** Unj : Left inverse of Inj1 and Inj0 ***)
Definition Unj : set -> set := In_rec_i (fun X f => {f x|x :e X :\: {0}}).

Theorem Unj_eq : forall X:set, Unj X = {Unj x|x :e X :\: {0}}.
claim L1: forall X:set, forall g h:set->set, (forall x :e X, g x = h x) -> {g x|x :e X :\: {0}} = {h x|x :e X :\: {0}}.
{
  let X g h.
  assume H1: forall x :e X, g x = h x.
  prove {g x|x :e X :\: {0}} = {h x|x :e X :\: {0}}.
  apply (ReplEq_ext (X :\: {0}) g h).
  let x.
  assume H2: x :e X :\: {0}.
  prove g x = h x.
  apply H1.
  prove x :e X.
  exact (setminusE1 X {0} x H2).
}
exact (In_rec_i_eq (fun X f => {f x|x :e X :\: {0}}) L1).
Qed.

Theorem Unj_Inj1_eq : forall X:set, Unj (Inj1 X) = X.
apply In_ind.
let X.
assume IH: forall x :e X, Unj (Inj1 x) = x.
prove Unj (Inj1 X) = X.
rewrite Unj_eq.
prove {Unj x|x :e Inj1 X :\: {0}} = X.
apply set_ext.
- prove {Unj x|x :e Inj1 X :\: {0}} c= X.
  let x.
  assume H1: x :e {Unj x|x :e Inj1 X :\: {0}}.
  prove x :e X.
  apply (ReplE_impred (Inj1 X :\: {0}) Unj x H1).
  let y.
  assume H2: y :e Inj1 X :\: {0}.
  assume H3: x = Unj y.
  rewrite H3.
  prove Unj y :e X.
  apply (setminusE (Inj1 X) {0} y H2).
  assume H4: y :e Inj1 X.
  assume H5: y /:e {0}.
  apply (Inj1E X y H4).
  + assume H6: y = 0.
    prove False.
    apply H5.
    rewrite H6.
    prove 0 :e {0}.
    apply SingI.
  + assume H6: exists x :e X, y = Inj1 x.
    apply (exandE_i (fun x => x :e X) (fun x => y = Inj1 x) H6).
    let z.
    assume H7: z :e X.
    assume H8: y = Inj1 z.
    rewrite H8.
    prove Unj (Inj1 z) :e X.
    rewrite (IH z H7).
    prove z :e X.
    exact H7.
- prove X c= {Unj x|x :e Inj1 X :\: {0}}.
  let x.
  assume H1: x :e X.
  prove x :e {Unj x|x :e Inj1 X :\: {0}}.
  rewrite <- (IH x H1).
  prove Unj (Inj1 x) :e {Unj x|x :e Inj1 X :\: {0}}.
  apply (ReplI (Inj1 X :\: {0}) Unj).
  prove Inj1 x :e Inj1 X :\: {0}.
  apply setminusI.
  + exact (Inj1I2 X x H1).
  + prove Inj1 x /:e {0}.
    exact (Inj1NE2 x).
Qed.

Theorem Inj1_inj : forall X Y:set, Inj1 X = Inj1 Y -> X = Y.
let X Y.
assume H1: Inj1 X = Inj1 Y.
prove X = Y.
rewrite <- (Unj_Inj1_eq X).
rewrite <- (Unj_Inj1_eq Y).
rewrite H1.
reflexivity.
Qed.

Theorem Unj_Inj0_eq : forall X:set, Unj (Inj0 X) = X.
let X.
rewrite (Unj_eq (Inj0 X)).
prove {Unj x|x :e Inj0 X :\: {0}} = X.
apply set_ext.
- prove {Unj x|x :e Inj0 X :\: {0}} c= X.
  let x.
  assume H1: x :e {Unj x|x :e Inj0 X :\: {0}}.
  prove x :e X.
  apply (ReplE_impred (Inj0 X :\: {0}) Unj x H1).
  let y.
  assume H2: y :e Inj0 X :\: {0}.
  assume H3: x = Unj y.
  apply (setminusE (Inj0 X) {0} y H2).
  assume H4: y :e {Inj1 x|x :e X}.
  assume H5: y /:e {0}.
  apply (ReplE_impred X Inj1 y H4).
  let z.
  assume H6: z :e X.
  assume H7: y = Inj1 z.
  claim L1: x = z.
  {
    rewrite H3.
    prove Unj y = z.
    rewrite H7.
    prove Unj (Inj1 z) = z.
    exact (Unj_Inj1_eq z).
  }
  prove x :e X.
  rewrite L1.
  prove z :e X.
  exact H6.
- prove X c= {Unj x|x :e Inj0 X :\: {0}}.
  let x.
  assume H1: x :e X.
  prove x :e {Unj x|x :e Inj0 X :\: {0}}.
  rewrite <- (Unj_Inj1_eq x).
  prove Unj (Inj1 x) :e {Unj x|x :e Inj0 X :\: {0}}.
  apply (ReplI (Inj0 X :\: {0}) Unj).
  prove Inj1 x :e Inj0 X :\: {0}.
  apply setminusI.
  + prove Inj1 x :e {Inj1 x|x :e X}.
    apply ReplI.
    exact H1.
  + prove Inj1 x /:e {0}.
    exact (Inj1NE2 x).
Qed.

Theorem Inj0_inj : forall X Y:set, Inj0 X = Inj0 Y -> X = Y.
let X Y.
assume H1: Inj0 X = Inj0 Y.
prove X = Y.
rewrite <- (Unj_Inj0_eq X).
rewrite <- (Unj_Inj0_eq Y).
rewrite H1.
reflexivity.
Qed.

Theorem Inj0_0 : Inj0 0 = 0.
exact (Repl_Empty Inj1).
Qed.

Theorem Inj0_Inj1_neq : forall X Y:set, Inj0 X <> Inj1 Y.
let X Y.
assume H1 : Inj0 X = Inj1 Y.
claim L1: 0 :e Inj1 Y.
{ exact (Inj1I1 Y). }
claim L2: 0 :e Inj0 X.
{ rewrite H1. exact L1. }
apply (Inj0E X 0 L2).
let x.
assume H2: x :e X /\ 0 = Inj1 x.
apply Inj1NE1 x.
symmetry.
exact andER (x :e X) (0 = Inj1 x) H2.
Qed.

(*** setsum ***)
Definition setsum : set -> set -> set := fun X Y => {Inj0 x|x :e X} :\/: {Inj1 y|y :e Y}.

(* Unicode :+: "002b" *)
Infix :+: 450 left := setsum.

Theorem Inj0_setsum : forall X Y x:set, x :e X -> Inj0 x :e X :+: Y.
let X Y x.
assume H: x :e X.
prove Inj0 x :e {Inj0 x|x :e X} :\/: {Inj1 y|y :e Y}.
apply binunionI1.
prove Inj0 x :e {Inj0 x|x :e X}.
apply ReplI.
exact H.
Qed.

Theorem Inj1_setsum : forall X Y y:set, y :e Y -> Inj1 y :e X :+: Y.
let X Y y.
assume H: y :e Y.
prove Inj1 y :e {Inj0 x|x :e X} :\/: {Inj1 y|y :e Y}.
apply binunionI2.
prove Inj1 y :e {Inj1 y|y :e Y}.
apply ReplI.
exact H.
Qed.

Theorem setsum_Inj_inv : forall X Y z:set, z :e X :+: Y -> (exists x :e X, z = Inj0 x) \/ (exists y :e Y, z = Inj1 y).
let X Y z.
assume H1 : z :e {Inj0 x|x :e X} :\/: {Inj1 y|y :e Y}.
apply (binunionE {Inj0 x|x :e X} {Inj1 y|y :e Y} z H1).
- assume H2: z :e {Inj0 x|x :e X}.
  apply orIL.
  exact (ReplE X Inj0 z H2).
- assume H2: z :e {Inj1 y|y :e Y}.
  apply orIR.
  exact (ReplE Y Inj1 z H2).
Qed.

Theorem Inj0_setsum_0L : forall X:set, 0 :+: X = Inj0 X.
let X. apply set_ext.
- let z.
  assume H1: z :e 0 :+: X.
  prove z :e Inj0 X.
  apply (setsum_Inj_inv 0 X z H1).
  + assume H2: exists x :e 0, z = Inj0 x.
    apply (exandE_i (fun x => x :e 0) (fun x => z = Inj0 x) H2).
    let x.
    assume H3: x :e 0.
    prove False.
    exact (EmptyE x H3).
  + assume H2: exists x :e X, z = Inj1 x.
    apply (exandE_i (fun x => x :e X) (fun x => z = Inj1 x) H2).
    let x.
    assume H3: x :e X.
    assume H4: z = Inj1 x.
    rewrite H4.
    prove Inj1 x :e Inj0 X.
    exact (Inj0I X x H3).
- let z.
  assume H1: z :e Inj0 X.
  prove z :e 0 :+: X.
  apply (exandE_i (fun x => x :e X) (fun x => z = Inj1 x) (Inj0E X z H1)).
  let x.
  assume H2: x :e X.
  assume H3: z = Inj1 x.
  rewrite H3.
  prove Inj1 x :e 0 :+: X.
  apply Inj1_setsum.
  exact H2.
Qed.

Theorem Subq_1_Sing0 : 1 c= {0}.
let x.
assume H1: x :e 1.
prove x :e {0}.
apply ordsuccE 0 x H1.
- assume H2: x :e 0.
  prove False.
  exact (EmptyE x H2).
- assume H2: x = 0.
  rewrite H2.
  prove 0 :e {0}.
  exact (SingI 0).
Qed.

Theorem Subq_Sing0_1 : {0} c= 1.
exact (fun x H1 => SingE 0 x H1 (fun s _ : set => x :e ordsucc s) (ordsuccI2 x)).
Qed.

Theorem eq_1_Sing0 : 1 = {0}.
exact (set_ext 1 (Sing 0) Subq_1_Sing0 Subq_Sing0_1).
Qed.

Theorem Inj1_setsum_1L : forall X:set, 1 :+: X = Inj1 X.
let X. apply set_ext.
- let z.
  assume H1: z :e 1 :+: X.
  prove z :e Inj1 X.
  apply (setsum_Inj_inv 1 X z H1).
  + assume H2: exists x :e 1, z = Inj0 x.
    apply (exandE_i (fun x => x :e 1) (fun x => z = Inj0 x) H2).
    let x.
    assume H3: x :e 1.
    assume H4: z = Inj0 x.
    rewrite H4.
    prove Inj0 x :e Inj1 X.
    claim L1: x = 0.
    { exact (SingE 0 x (Subq_1_Sing0 x H3)). }
    rewrite L1.
    prove Inj0 0 :e Inj1 X.
    rewrite Inj0_0.
    prove 0 :e Inj1 X.
    exact (Inj1I1 X).
  + assume H2: exists x :e X, z = Inj1 x.
    apply (exandE_i (fun x => x :e X) (fun x => z = Inj1 x) H2).
    let x.
    assume H3: x :e X.
    assume H4: z = Inj1 x.
    rewrite H4.
    prove Inj1 x :e Inj1 X.
    exact (Inj1I2 X x H3).
- let z.
  assume H1: z :e Inj1 X.
  prove z :e 1 :+: X.
  apply (Inj1E X z H1).
  + assume H2: z = 0.
    rewrite H2.
    prove 0 :e 1 :+: X.
    rewrite <- Inj0_0 at 1. (*** This is a little tricky. Recall that 1 is notation for ordsucc 0, so without "at 1" this hidden 0 would also be rewritten. ***)
    prove Inj0 0 :e 1 :+: X.
    apply Inj0_setsum.
    prove 0 :e 1.
    exact In_0_1.
  + assume H2: exists x :e X, z = Inj1 x.
    apply (exandE_i (fun x => x :e X) (fun x => z = Inj1 x) H2).
    let x.
    assume H2: x :e X.
    assume H3: z = Inj1 x.
    rewrite H3.
    prove Inj1 x :e 1 :+: X.
    apply Inj1_setsum.
    exact H2.
Qed.

Theorem nat_setsum1_ordsucc : forall n:set, nat_p n -> 1 :+: n = ordsucc n.
claim L: forall n:set, nat_p n -> Inj1 n = ordsucc n.
{
  apply nat_complete_ind.
  let n.
  assume Hn: nat_p n.
  assume IHn: forall m :e n, Inj1 m = ordsucc m.
  prove Inj1 n = ordsucc n.
  apply set_ext.
  - prove Inj1 n c= ordsucc n.
    let z.
    assume H1: z :e Inj1 n.
    prove z :e ordsucc n.
    apply (Inj1E n z H1).
    + assume H2: z = 0.
      rewrite H2.
      prove 0 :e ordsucc n.
      exact (nat_0_in_ordsucc n Hn).
    + assume H2: exists m :e n, z = Inj1 m.
      apply (exandE_i (fun m => m :e n) (fun m => z = Inj1 m) H2).
      let m.
      assume H3: m :e n.
      assume H4: z = Inj1 m.
      rewrite H4.
      prove Inj1 m :e ordsucc n.
      rewrite (IHn m H3).
      prove ordsucc m :e ordsucc n.
      exact (nat_ordsucc_in_ordsucc n Hn m H3).
  - prove ordsucc n c= Inj1 n.
    let m.
    assume H1: m :e ordsucc n.
    prove m :e Inj1 n.
    apply (ordsuccE n m H1).
    + assume H2: m :e n.
      apply (nat_inv m (nat_p_trans n Hn m H2)).
      * assume H3: m = 0.
        rewrite H3.
        prove 0 :e Inj1 n.
        exact (Inj1I1 n).
      * assume H3: exists k, nat_p k /\ m = ordsucc k.
        apply (exandE_i nat_p (fun k => m = ordsucc k) H3).
        let k.
        assume H4: nat_p k.
        assume H5: m = ordsucc k.
        rewrite H5.
        prove ordsucc k :e Inj1 n.
        claim L1: k :e m.
        {
          rewrite H5.
  	  exact (ordsuccI2 k).
        }
        claim L2: k :e n.
        { exact (nat_trans n Hn m H2 k L1). }
        rewrite <- (IHn k L2).
        prove Inj1 k :e Inj1 n.
        exact (Inj1I2 n k L2).
    + assume H2: m = n.
      rewrite H2.
      prove n :e Inj1 n.
      apply (nat_inv n Hn).
      * assume H3: n = 0.
        rewrite H3 at 1.
        prove 0 :e Inj1 n.
        exact (Inj1I1 n).
      * assume H3: exists k, nat_p k /\ n = ordsucc k.
        apply (exandE_i nat_p (fun k => n = ordsucc k) H3).
        let k.
        assume H4: nat_p k.
        assume H5: n = ordsucc k.
        rewrite H5 at 1.
        prove ordsucc k :e Inj1 n.
        claim L1: k :e n.
        {
          rewrite H5.
	  exact (ordsuccI2 k).
        }
        rewrite <- (IHn k L1).
        prove Inj1 k :e Inj1 n.
        exact (Inj1I2 n k L1).
}
let n.
assume Hn: nat_p n.
prove 1 :+: n = ordsucc n.
rewrite Inj1_setsum_1L.
prove Inj1 n = ordsucc n.
exact (L n Hn).
Qed.

Theorem setsum_0_0 : 0 :+: 0 = 0.
rewrite (Inj0_setsum_0L 0).
prove Inj0 0 = 0.
exact Inj0_0.
Qed.

Theorem setsum_1_0_1 : 1 :+: 0 = 1.
exact (nat_setsum1_ordsucc 0 nat_0).
Qed.

Theorem setsum_1_1_2 : 1 :+: 1 = 2.
exact (nat_setsum1_ordsucc 1 nat_1).
Qed.

Section pair_setsum.

Let pair := setsum.

Definition proj0 : set -> set := fun Z => {Unj z|z :e Z, exists x:set, Inj0 x = z}.
Definition proj1 : set -> set := fun Z => {Unj z|z :e Z, exists y:set, Inj1 y = z}.

Theorem Inj0_pair_0_eq : Inj0 = pair 0.
apply (func_ext set set).
let x.
symmetry.
prove 0 :+: x = Inj0 x.
exact (Inj0_setsum_0L x).
Qed.

Theorem Inj1_pair_1_eq : Inj1 = pair 1.
apply (func_ext set set).
let x.
symmetry.
prove 1 :+: x = Inj1 x.
exact (Inj1_setsum_1L x).
Qed.

Theorem pairI0 : forall X Y x, x :e X -> pair 0 x :e pair X Y.
rewrite <- Inj0_pair_0_eq.
exact Inj0_setsum.
Qed.

Theorem pairI1 : forall X Y y, y :e Y -> pair 1 y :e pair X Y.
rewrite <- Inj1_pair_1_eq.
exact Inj1_setsum.
Qed.

Theorem pairE : forall X Y z, z :e pair X Y -> (exists x :e X, z = pair 0 x) \/ (exists y :e Y, z = pair 1 y).
rewrite <- Inj0_pair_0_eq.
rewrite <- Inj1_pair_1_eq.
exact setsum_Inj_inv.
Qed.

Theorem pairE0 : forall X Y x, pair 0 x :e pair X Y -> x :e X.
let X Y x.
assume H1: pair 0 x :e pair X Y.
prove x :e X.
apply (pairE X Y (pair 0 x) H1).
- rewrite <- Inj0_pair_0_eq.
  assume H2: exists x' :e X, Inj0 x = Inj0 x'.
  apply (exandE_i (fun x' => x' :e X) (fun x' => Inj0 x = Inj0 x') H2).
  let x'.
  assume H3: x' :e X.
  assume H4: Inj0 x = Inj0 x'.
  prove x :e X.
  rewrite (Inj0_inj x x' H4).
  prove x' :e X.
  exact H3.
- rewrite <- Inj0_pair_0_eq.
  rewrite <- Inj1_pair_1_eq.
  assume H2: exists y :e Y, Inj0 x = Inj1 y.
  prove False.
  apply (exandE_i (fun y => y :e Y) (fun y => Inj0 x = Inj1 y) H2).
  let y.
  assume _.
  assume H3: Inj0 x = Inj1 y.
  exact (Inj0_Inj1_neq x y H3).
Qed.

Theorem pairE1 : forall X Y y, pair 1 y :e pair X Y -> y :e Y.
let X Y y.
assume H1: pair 1 y :e pair X Y.
prove y :e Y.
apply (pairE X Y (pair 1 y) H1).
- rewrite <- Inj0_pair_0_eq.
  rewrite <- Inj1_pair_1_eq.
  assume H2: exists x :e X, Inj1 y = Inj0 x.
  prove False.
  apply (exandE_i (fun x => x :e X) (fun x => Inj1 y = Inj0 x) H2).
  let x.
  assume _.
  assume H3: Inj1 y = Inj0 x.
  apply (Inj0_Inj1_neq x y).
  symmetry.
  exact H3.
- rewrite <- Inj1_pair_1_eq.
  assume H2: exists y' :e Y, Inj1 y = Inj1 y'.
  apply (exandE_i (fun y' => y' :e Y) (fun y' => Inj1 y = Inj1 y') H2).
  let y'.
  assume H3: y' :e Y.
  assume H4: Inj1 y = Inj1 y'.
  prove y :e Y.
  rewrite (Inj1_inj y y' H4).
  prove y' :e Y.
  exact H3.
Qed.

Theorem proj0I : forall w u:set, pair 0 u :e w -> u :e proj0 w.
rewrite <- Inj0_pair_0_eq.
let w u.
assume H1: Inj0 u :e w.
prove u :e {Unj z|z :e w, exists x:set, Inj0 x = z}.
rewrite <- (Unj_Inj0_eq u).
prove Unj (Inj0 u) :e {Unj z|z :e w, exists x:set, Inj0 x = z}.
apply (ReplSepI w (fun z => exists x:set, Inj0 x = z) Unj (Inj0 u)).
- prove Inj0 u :e w.
  exact H1.
- prove exists x, Inj0 x = Inj0 u.
  witness u.
  reflexivity.
Qed.

Theorem proj0E : forall w u:set, u :e proj0 w -> pair 0 u :e w.
let w u.
assume H1: u :e {Unj z|z :e w, exists x:set, Inj0 x = z}.
rewrite <- Inj0_pair_0_eq.
prove Inj0 u :e w.
apply (ReplSepE_impred w (fun z => exists x:set, Inj0 x = z) Unj u H1).
let z.
assume H2: z :e w.
assume H3: exists x, Inj0 x = z.
assume H4: u = Unj z.
apply H3.
let x.
assume H5: Inj0 x = z.
prove Inj0 u :e w.
rewrite H4.
prove Inj0 (Unj z) :e w.
rewrite <- H5.
prove Inj0 (Unj (Inj0 x)) :e w.
rewrite Unj_Inj0_eq.
prove Inj0 x :e w.
rewrite H5.
exact H2.
Qed.

Theorem proj1I : forall w u:set, pair 1 u :e w -> u :e proj1 w.
rewrite <- Inj1_pair_1_eq.
let w u.
assume H1: Inj1 u :e w.
prove u :e {Unj z|z :e w, exists y:set, Inj1 y = z}.
rewrite <- (Unj_Inj1_eq u).
prove Unj (Inj1 u) :e {Unj z|z :e w, exists y:set, Inj1 y = z}.
apply (ReplSepI w (fun z => exists y:set, Inj1 y = z) Unj (Inj1 u)).
- prove Inj1 u :e w.
  exact H1.
- prove exists y, Inj1 y = Inj1 u.
  witness u.
  reflexivity.
Qed.

Theorem proj1E : forall w u:set, u :e proj1 w -> pair 1 u :e w.
let w u.
assume H1: u :e {Unj z|z :e w, exists y:set, Inj1 y = z}.
rewrite <- Inj1_pair_1_eq.
prove Inj1 u :e w.
apply (ReplSepE_impred w (fun z => exists y:set, Inj1 y = z) Unj u H1).
let z.
assume H2: z :e w.
assume H3: exists y, Inj1 y = z.
assume H4: u = Unj z.
apply H3.
let y.
assume H5: Inj1 y = z.
prove Inj1 u :e w.
rewrite H4.
prove Inj1 (Unj z) :e w.
rewrite <- H5.
prove Inj1 (Unj (Inj1 y)) :e w.
rewrite Unj_Inj1_eq.
prove Inj1 y :e w.
rewrite H5.
exact H2.
Qed.

Theorem proj0_pair_eq : forall X Y:set, proj0 (pair X Y) = X.
let X Y. apply set_ext.
- prove proj0 (pair X Y) c= X.
  let u.
  assume H1: u :e proj0 (pair X Y).
  prove u :e X.
  apply (pairE0 X Y u).
  prove pair 0 u :e pair X Y.
  exact (proj0E (pair X Y) u H1).
- prove X c= proj0 (pair X Y).
  let u.
  assume H1: u :e X.
  prove u :e proj0 (pair X Y).
  apply proj0I.
  prove pair 0 u :e pair X Y.
  apply pairI0.
  prove u :e X.
  exact H1.
Qed.

Theorem proj1_pair_eq : forall X Y:set, proj1 (pair X Y) = Y.
let X Y. apply set_ext.
- prove proj1 (pair X Y) c= Y.
  let u.
  assume H1: u :e proj1 (pair X Y).
  prove u :e Y.
  apply (pairE1 X Y u).
  prove pair 1 u :e pair X Y.
  exact (proj1E (pair X Y) u H1).
- prove Y c= proj1 (pair X Y).
  let u.
  assume H1: u :e Y.
  prove u :e proj1 (pair X Y).
  apply proj1I.
  prove pair 1 u :e pair X Y.
  apply pairI1.
  prove u :e Y.
  exact H1.
Qed.


(*** Sigma X Y = {(x,y) | x in X, y in Y x} ***)
Definition Sigma : set -> (set -> set) -> set :=
fun X Y => \/_ x :e X, {pair x y|y :e Y x}.

(* Unicode Sigma_ "2211" *)
Binder+ Sigma_ , := Sigma.

Theorem pair_Sigma : forall X:set, forall Y:set -> set, forall x :e X, forall y :e Y x, pair x y :e Sigma_ x :e X, Y x.
let X Y x.
assume Hx: x :e X.
let y.
assume Hy: y :e Y x.
prove pair x y :e \/_ x :e X, {pair x y|y :e Y x}.
apply (famunionI X (fun x => {pair x y|y :e Y x}) x (pair x y)).
- prove x :e X.
  exact Hx.
- prove pair x y :e {pair x y|y :e Y x}.
  apply ReplI.
  prove y :e Y x.
  exact Hy.
Qed.

Theorem Sigma_eta_proj0_proj1 : forall X:set, forall Y:set -> set, forall z :e (Sigma_ x :e X, Y x), pair (proj0 z) (proj1 z) = z /\ proj0 z :e X /\ proj1 z :e Y (proj0 z).
let X Y z.
assume H1: z :e Sigma_ x :e X, Y x.
claim L1: exists x :e X, z :e {pair x y|y :e Y x}.
{ exact (famunionE X (fun x => {pair x y|y :e Y x}) z H1). }
apply (exandE_i (fun x => x :e X) (fun x => z :e {pair x y|y :e Y x}) L1).
let x.
assume H2: x :e X.
assume H3: z :e {pair x y|y :e Y x}.
apply (ReplE_impred (Y x) (pair x) z H3).
let y.
assume H4: y :e Y x.
assume H5: z = pair x y.
rewrite H5.
prove pair (proj0 (pair x y)) (proj1 (pair x y)) = pair x y /\ proj0 (pair x y) :e X /\ proj1 (pair x y) :e Y (proj0 (pair x y)).
rewrite proj0_pair_eq.
prove pair x (proj1 (pair x y)) = pair x y /\ x :e X /\ proj1 (pair x y) :e Y x.
rewrite proj1_pair_eq.
prove pair x y = pair x y /\ x :e X /\ y :e Y x.
apply and3I.
- prove pair x y = pair x y.
  reflexivity.
- prove x :e X.
  exact H2.
- prove y :e Y x.
  exact H4.
Qed.

Theorem proj_Sigma_eta : forall X:set, forall Y:set -> set, forall z :e (Sigma_ x :e X, Y x), pair (proj0 z) (proj1 z) = z.
let X Y z.
assume H1: z :e Sigma_ x :e X, Y x.
apply (and3E (pair (proj0 z) (proj1 z) = z) (proj0 z :e X) (proj1 z :e Y (proj0 z)) (Sigma_eta_proj0_proj1 X Y z H1)).
assume H2 _ _.
exact H2.
Qed.

Theorem proj0_Sigma : forall X:set, forall Y:set -> set, forall z:set, z :e (Sigma_ x :e X, Y x) -> proj0 z :e X.
let X Y z.
assume H1: z :e Sigma_ x :e X, Y x.
apply (and3E (pair (proj0 z) (proj1 z) = z) (proj0 z :e X) (proj1 z :e Y (proj0 z)) (Sigma_eta_proj0_proj1 X Y z H1)).
assume _ H2 _.
exact H2.
Qed.

Theorem proj1_Sigma : forall X:set, forall Y:set -> set, forall z:set, z :e (Sigma_ x :e X, Y x) -> proj1 z :e Y (proj0 z).
let X Y z.
assume H1: z :e Sigma_ x :e X, Y x.
apply (and3E (pair (proj0 z) (proj1 z) = z) (proj0 z :e X) (proj1 z :e Y (proj0 z)) (Sigma_eta_proj0_proj1 X Y z H1)).
assume _ _ H2.
exact H2.
Qed.

Theorem pair_Sigma_E1 : forall X:set, forall Y:set->set, forall x y:set, pair x y :e (Sigma_ x :e X, Y x) -> y :e Y x.
let X Y x y.
assume H1: pair x y :e Sigma_ x :e X, Y x.
prove y :e Y x.
rewrite <- (proj0_pair_eq x y).
prove y :e Y (proj0 (pair x y)).
rewrite <- (proj1_pair_eq x y) at 1.
prove proj1 (pair x y) :e Y (proj0 (pair x y)).
exact (proj1_Sigma X Y (pair x y) H1).
Qed.

Theorem Sigma_E : forall X:set, forall Y:set->set, forall z:set, z :e (Sigma_ x :e X, Y x) -> exists x :e X, exists y :e Y x, z = pair x y.
let X Y z.
assume Hz: z :e Sigma_ x :e X, Y x.
apply (and3E (pair (proj0 z) (proj1 z) = z) (proj0 z :e X) (proj1 z :e Y (proj0 z)) (Sigma_eta_proj0_proj1 X Y z Hz)).
assume H1: pair (proj0 z) (proj1 z) = z.
assume H2: proj0 z :e X.
assume H3: proj1 z :e Y (proj0 z).
witness (proj0 z).
apply andI.
- prove proj0 z :e X. exact H2.
- witness (proj1 z).
  apply andI.
  + prove proj1 z :e Y (proj0 z). exact H3.
  + prove z = pair (proj0 z) (proj1 z).
    symmetry.
    exact H1.
Qed.

Definition setprod : set->set->set := fun X Y:set => Sigma_ x :e X, Y.

(* Unicode :*: "2a2f" *)
Infix :*: 440 left := setprod.

(*** lam X F = {(x,y) | x :e X, y :e F x} = \/_{x :e X} {(x,y) | y :e (F x)} = Sigma X F ***)
Let lam : set -> (set -> set) -> set := Sigma.

(***  ap f x = {proj1 z | z :e f,  exists y, z = pair x y}} ***)
Definition ap : set -> set -> set := fun f x => {proj1 z|z :e f, exists y:set, z = pair x y}.

Notation SetImplicitOp ap.
Notation SetLam Sigma.

Theorem lamI : forall X:set, forall F:set->set, forall x :e X, forall y :e F x, pair x y :e fun x :e X => F x.
exact pair_Sigma.
Qed.

Theorem lamE : forall X:set, forall F:set->set, forall z:set, z :e (fun x :e X => F x) -> exists x :e X, exists y :e F x, z = pair x y.
exact Sigma_E.
Qed.

Theorem apI : forall f x y, pair x y :e f -> y :e f x.
let f x y.
assume H1: pair x y :e f.
prove y :e {proj1 z|z :e f, exists y:set, z = pair x y}.
rewrite <- (proj1_pair_eq x y).
prove proj1 (pair x y) :e {proj1 z|z :e f, exists y:set, z = pair x y}.
apply (ReplSepI f (fun z => exists y:set, z = pair x y) proj1 (pair x y) H1).
prove exists y':set, pair x y = pair x y'.
witness y.
reflexivity.
Qed.

Theorem apE : forall f x y, y :e f x -> pair x y :e f.
let f x y.
assume H1: y :e {proj1 z|z :e f, exists y:set, z = pair x y}.
prove pair x y :e f.
apply (ReplSepE_impred f (fun z => exists y:set, z = pair x y) proj1 y H1).
let z.
assume Hz: z :e f.
assume H1: exists y:set, z = pair x y.
assume H2: y = proj1 z.
apply H1.
let v.
assume H3: z = pair x v.
claim L1: y = v.
{
  rewrite H2.
  rewrite H3.
  prove proj1 (pair x v) = v.
  apply proj1_pair_eq.
}
claim L2: z = pair x y.
{
  rewrite L1.
  exact H3.
}
rewrite <- L2.
exact Hz.
Qed.

Theorem beta : forall X:set, forall F:set -> set, forall x:set, x :e X -> (fun x :e X => F x) x = F x.
let X F x.
assume Hx: x :e X.
apply set_ext.
- let w.
  assume Hw: w :e (fun x :e X => F x) x.
  claim L1: pair x w :e (fun x :e X => F x).
  { exact (apE (fun x :e X => F x) x w Hw). }
  exact (pair_Sigma_E1 X F x w L1).
- let w.
  assume Hw: w :e F x.
  prove w :e (fun x :e X => F x) x.
  apply apI.
  prove pair x w :e fun x :e X => F x.
  prove pair x w :e Sigma_ x :e X, F x.
  apply pair_Sigma.
  + exact Hx.
  + exact Hw.
Qed.

Theorem proj0_ap_0 : forall u, proj0 u = u 0.
let u. apply set_ext.
- let w.
  assume H1: w :e proj0 u.
  prove w :e u 0.
  apply apI.
  prove pair 0 w :e u.
  apply proj0E.
  prove w :e proj0 u.
  exact H1.
- let w.
  assume H1: w :e u 0.
  prove w :e proj0 u.
  apply proj0I.
  prove pair 0 w :e u.
  apply apE.
  prove w :e u 0.
  exact H1.
Qed.

Theorem proj1_ap_1 : forall u, proj1 u = u 1.
let u. apply set_ext.
- let w.
  assume H1: w :e proj1 u.
  prove w :e u 1.
  apply apI.
  prove pair 1 w :e u.
  apply proj1E.
  prove w :e proj1 u.
  exact H1.
- let w.
  assume H1: w :e u 1.
  prove w :e proj1 u.
  apply proj1I.
  prove pair 1 w :e u.
  apply apE.
  prove w :e u 1.
  exact H1.
Qed.

Theorem pair_ap_0 : forall x y:set, (pair x y) 0 = x.
let x y.
rewrite <- (proj0_ap_0 (pair x y)).
prove proj0 (pair x y) = x.
apply proj0_pair_eq.
Qed.

Theorem pair_ap_1 : forall x y:set, (pair x y) 1 = y.
let x y.
rewrite <- (proj1_ap_1 (pair x y)).
prove proj1 (pair x y) = y.
apply proj1_pair_eq.
Qed.

Theorem ap0_Sigma : forall X:set, forall Y:set -> set, forall z:set, z :e (Sigma_ x :e X, Y x) -> (z 0) :e X.
let X Y z.
rewrite <- proj0_ap_0.
apply proj0_Sigma.
Qed.

Theorem ap1_Sigma : forall X:set, forall Y:set -> set, forall z:set, z :e (Sigma_ x :e X, Y x) -> (z 1) :e (Y (z 0)).
let X Y z.
rewrite <- proj0_ap_0.
rewrite <- proj1_ap_1.
apply proj1_Sigma.
Qed.

Definition pair_p:set->prop
:= fun u:set => pair (u 0) (u 1) = u.

Theorem pair_p_I : forall x y, pair_p (pair x y).
let x y.
prove pair (pair x y 0) (pair x y 1) = pair x y.
rewrite pair_ap_0.
rewrite pair_ap_1.
reflexivity.
Qed.

Theorem Subq_2_UPair01 : 2 c= {0,1}.
let x.
assume H1: x :e 2.
apply ordsuccE 1 x H1.
- assume H2: x :e 1.
  claim L1: x = 0.
  { exact (SingE 0 x (Subq_1_Sing0 x H2)). }
  prove x :e {0,1}.
  rewrite L1.
  prove 0 :e {0,1}.
  exact (UPairI1 0 1).
- assume H2: x = 1.
  prove x :e {0,1}.
  rewrite H2.
  prove 1 :e {0,1}.
  exact (UPairI2 0 1).
Qed.

Theorem tuple_pair : forall x y:set, pair x y = (x,y).
let x y. apply set_ext.
- let z.
  assume Hz: z :e pair x y.
  apply (pairE x y z Hz).
  + assume H1: exists u :e x, z = pair 0 u.
    apply (exandE_i (fun u => u :e x) (fun u => z = pair 0 u) H1).
    let u.
    assume Hu: u :e x.
    assume H2: z = pair 0 u.
    prove z :e (x,y).
    prove z :e fun i :e 2 => if i = 0 then x else y.
    rewrite H2.
    prove pair 0 u :e fun i :e 2 => if i = 0 then x else y.
    apply (lamI 2 (fun i => if i = 0 then x else y) 0 In_0_2 u).
    prove u :e if 0 = 0 then x else y.
    rewrite (If_i_1 (0 = 0) x y (fun q H => H)).
    prove u :e x.
    exact Hu.
  + assume H1: exists u :e y, z = pair 1 u.
    apply (exandE_i (fun u => u :e y) (fun u => z = pair 1 u) H1).
    let u.
    assume Hu: u :e y.
    assume H2: z = pair 1 u.
    prove z :e (x,y).
    prove z :e fun i :e 2 => if i = 0 then x else y.
    rewrite H2.
    prove pair 1 u :e fun i :e 2 => if i = 0 then x else y.
    apply (lamI 2 (fun i => if i = 0 then x else y) 1 In_1_2 u).
    prove u :e if 1 = 0 then x else y.
    rewrite (If_i_0 (1 = 0) x y neq_1_0).
    prove u :e y.
    exact Hu.
- let z.
  assume Hz: z :e (x,y).
  prove z :e pair x y.
  claim L1: exists i :e 2, exists w :e (if i = 0 then x else y), z = pair i w.
  { exact (lamE 2 (fun i => if i = 0 then x else y) z Hz). }
  apply (exandE_i (fun i => i :e 2) (fun i => exists w :e (if i = 0 then x else y), z = pair i w) L1).
  let i.
  assume Hi: i :e 2.
  assume H1: exists w :e (if i = 0 then x else y), z = pair i w.
  apply (exandE_i (fun w => w :e if i = 0 then x else y) (fun w => z = pair i w) H1).
  let w.
  assume Hw: w :e if i = 0 then x else y.
  assume H2: z = pair i w.
  prove z :e pair x y.
  rewrite H2.
  prove pair i w :e pair x y.
  claim L2: i :e {0,1}.
  { exact (Subq_2_UPair01 i Hi). }
  apply (UPairE i 0 1 L2).
  + assume Hi0: i = 0.
    rewrite Hi0.
    prove pair 0 w :e pair x y.
    apply pairI0.
    prove w :e x.
    claim L3: (if i = 0 then x else y) = x.
    { exact (If_i_1 (i = 0) x y Hi0). }
    rewrite <- L3.
    exact Hw.
  + assume Hi1: i = 1.
    rewrite Hi1.
    prove pair 1 w :e pair x y.
    apply pairI1.
    prove w :e y.
    claim L3: (if i = 0 then x else y) = y.
    {
      rewrite Hi1.
      exact (If_i_0 (1 = 0) x y neq_1_0).
    }
    rewrite <- L3.
    exact Hw.
Qed.

Definition Pi : set -> (set -> set) -> set := fun X Y => {f :e Power (Sigma_ x :e X, Union (Y x)) | forall x :e X, f x :e Y x}.

(* Unicode Pi_ "220f" *)
Binder+ Pi_ , := Pi.

Theorem PiI : forall X:set, forall Y:set->set, forall f:set,
    (forall u :e f, pair_p u /\ u 0 :e X) -> (forall x :e X, f x :e Y x) -> f :e Pi_ x :e X, Y x.
let X Y f.
assume H1: forall u :e f, pair_p u /\ u 0 :e X.
assume H2: forall x :e X, f x :e Y x.
prove f :e {f :e Power (Sigma_ x :e X, Union (Y x)) | forall x :e X, f x :e Y x}.
apply SepI.
- prove f :e Power (Sigma_ x :e X, Union (Y x)).
  apply PowerI.
  prove f c= Sigma_ x :e X, Union (Y x).
  let z.
  assume Hz: z :e f.
  prove z :e Sigma_ x :e X, Union (Y x).
  apply (H1 z Hz).
  assume H3: pair (z 0) (z 1) = z.
  assume H4: z 0 :e X.
  rewrite <- H3.
  prove pair (z 0) (z 1) :e Sigma_ x :e X, Union (Y x).
  apply pair_Sigma.
  + prove z 0 :e X.
    exact H4.
  + prove z 1 :e Union (Y (z 0)).
    apply (UnionI (Y (z 0)) (z 1) (f (z 0))).
    * prove z 1 :e f (z 0).
      apply apI.
      prove pair (z 0) (z 1) :e f.
      rewrite H3.
      exact Hz.
    * prove f (z 0) :e Y (z 0).
      exact (H2 (z 0) H4).
- prove forall x :e X, f x :e Y x.
  exact H2.
Qed.

Theorem lam_Pi : forall X:set, forall Y:set -> set, forall F:set -> set,
 (forall x :e X, F x :e Y x) -> (fun x :e X => F x) :e (Pi_ x :e X, Y x).
let X Y F.
assume H1: forall x :e X, F x :e Y x.
prove (fun x :e X => F x) :e (Pi_ x :e X, Y x).
apply PiI.
- prove forall u :e (fun x :e X => F x), pair_p u /\ u 0 :e X.
  let u.
  assume Hu: u :e fun x :e X => F x.
  claim L1: exists x :e X, exists y :e F x, u = pair x y.
  {
    exact (lamE X F u Hu).
  }
  apply (exandE_i (fun x => x :e X) (fun x => exists y :e F x, u = pair x y) L1).
  let x.
  assume Hx: x :e X.
  assume H2: exists y :e F x, u = pair x y.
  apply (exandE_i (fun y => y :e F x) (fun y => u = pair x y) H2).
  let y.
  assume Hy: y :e F x.
  assume H3: u = pair x y.
  apply andI.
  + prove pair_p u.
    rewrite H3.
    apply pair_p_I.
  + prove u 0 :e X.
    rewrite H3.
    prove pair x y 0 :e X.
    rewrite pair_ap_0.
    prove x :e X.
    exact Hx.
- prove forall x :e X, (fun x :e X => F x) x :e Y x.
  let x.
  assume Hx: x :e X.
  rewrite (beta X F x Hx).
  prove F x :e Y x.
  exact (H1 x Hx).
Qed.

Theorem ap_Pi : forall X:set, forall Y:set -> set, forall f:set, forall x:set, f :e (Pi_ x :e X, Y x) -> x :e X -> f x :e Y x.
let X Y f x.
assume Hf: f :e Pi_ x :e X, Y x.
exact (SepE2 (Power (Sigma_ x :e X, Union (Y x))) (fun f => forall x :e X, f x :e Y x) f Hf x).
Qed.

Definition setexp : set->set->set := fun X Y:set => Pi_ y :e Y, X.

(* Superscript :^: *)
Infix :^: 430 left := setexp.

Theorem pair_tuple_fun : pair = (fun x y => (x,y)).
apply func_ext set (set -> set). let x.
apply func_ext set set. let y.
prove pair x y = (x,y).
apply tuple_pair.
Qed.

Theorem lamI2 : forall X, forall F:set->set, forall x :e X, forall y :e F x, (x,y) :e fun x :e X => F x.
prove (forall X, forall F:set->set, forall x :e X, forall y :e F x, ((fun x y:set => (x,y)) x y) :e fun x :e X => F x).
rewrite <- pair_tuple_fun.
exact lamI.
Qed.

Section Tuples.

Variable x0 x1: set.

Theorem tuple_2_0_eq: (x0,x1) 0 = x0.
rewrite beta 2 (fun i => if i = 0 then x0 else x1) 0 In_0_2.
apply If_i_1. reflexivity.
Qed.

Theorem tuple_2_1_eq: (x0,x1) 1 = x1.
rewrite beta 2 (fun i => if i = 0 then x0 else x1) 1 In_1_2.
apply If_i_0. apply neq_1_0.
Qed.

End Tuples.

Theorem ReplEq_setprod_ext : forall X Y, forall F G:set -> set -> set, (forall x :e X, forall y :e Y, F x y = G x y) -> {F (w 0) (w 1)|w :e X :*: Y} = {G (w 0) (w 1)|w :e X :*: Y}.
let X Y F G.
assume H1: forall x :e X, forall y :e Y, F x y = G x y.
apply ReplEq_ext (X :*: Y) (fun w => F (w 0) (w 1)) (fun w => G (w 0) (w 1)).
prove forall w :e X :*: Y, F (w 0) (w 1) = G (w 0) (w 1).
let w. assume Hw: w :e X :*: Y.
apply H1.
- prove w 0 :e X. exact ap0_Sigma X (fun _ => Y) w Hw.
- prove w 1 :e Y. exact ap1_Sigma X (fun _ => Y) w Hw.
Qed.

Theorem tuple_2_Sigma : forall X:set, forall Y:set -> set, forall x :e X, forall y :e Y x, (x,y) :e Sigma_ x :e X, Y x.
exact lamI2.
Qed.

Theorem tuple_2_setprod : forall X:set, forall Y:set, forall x :e X, forall y :e Y, (x,y) :e X :*: Y.
exact fun X Y x Hx y Hy => tuple_2_Sigma X (fun _ => Y) x Hx y Hy.
Qed.

End pair_setsum.

