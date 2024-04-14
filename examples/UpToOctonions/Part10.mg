(** from Part 1 **)
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

Axiom FalseE : False -> forall p:prop, p.

Axiom TrueI : True.

Axiom andI : forall (A B : prop), A -> B -> A /\ B.

Axiom andEL : forall (A B : prop), A /\ B -> A.

Axiom andER : forall (A B : prop), A /\ B -> B.

Axiom orIL : forall (A B : prop), A -> A \/ B.

Axiom orIR : forall (A B : prop), B -> A \/ B.

Section PropN.

Variable P1 P2 P3:prop.

Axiom and3I : P1 -> P2 -> P3 -> P1 /\ P2 /\ P3.

Axiom and3E : P1 /\ P2 /\ P3 -> (forall p:prop, (P1 -> P2 -> P3 -> p) -> p).

Axiom or3I1 : P1 -> P1 \/ P2 \/ P3.

Axiom or3I2 : P2 -> P1 \/ P2 \/ P3.

Axiom or3I3 : P3 -> P1 \/ P2 \/ P3.

Axiom or3E : P1 \/ P2 \/ P3 -> (forall p:prop, (P1 -> p) -> (P2 -> p) -> (P3 -> p) -> p).

Variable P4:prop.

Axiom and4I : P1 -> P2 -> P3 -> P4 -> P1 /\ P2 /\ P3 /\ P4.

Variable P5:prop.

Axiom and5I : P1 -> P2 -> P3 -> P4 -> P5 -> P1 /\ P2 /\ P3 /\ P4 /\ P5.

End PropN.

Axiom not_or_and_demorgan : forall A B:prop, ~(A \/ B) -> ~A /\ ~B.

Axiom not_ex_all_demorgan_i : forall P:set->prop, (~exists x, P x) -> forall x, ~P x.

Axiom iffI : forall A B:prop, (A -> B) -> (B -> A) -> (A <-> B).

Axiom iffEL : forall A B:prop, (A <-> B) -> A -> B.

Axiom iffER : forall A B:prop, (A <-> B) -> B -> A.

Axiom iff_refl : forall A:prop, A <-> A.

Axiom iff_sym : forall A B:prop, (A <-> B) -> (B <-> A).

Axiom iff_trans : forall A B C: prop, (A <-> B) -> (B <-> C) -> (A <-> C).

Axiom eq_i_tra : forall x y z, x = y -> y = z -> x = z.

Axiom f_eq_i : forall f:set -> set, forall x y, x = y -> f x = f y.

Axiom neq_i_sym: forall x y, x <> y -> y <> x.

Definition nIn : set->set->prop :=
fun x X => ~In x X.

(* Unicode /:e "2209" *)
Infix /:e 502 := nIn.

Axiom Eps_i_ex : forall P:set -> prop, (exists x, P x) -> P (Eps_i P).

Axiom pred_ext : forall P Q:set -> prop, (forall x, P x <-> Q x) -> P = Q.

Axiom prop_ext_2 : forall p q:prop, (p -> q) -> (q -> p) -> p = q.

Axiom Subq_ref : forall X:set, X c= X.

Axiom Subq_tra : forall X Y Z:set, X c= Y -> Y c= Z -> X c= Z.

Axiom Subq_contra : forall X Y z:set, X c= Y -> z /:e Y -> z /:e X.

Axiom EmptyE : forall x:set, x /:e Empty.

Axiom Subq_Empty : forall X:set, Empty c= X.

Axiom Empty_Subq_eq : forall X:set, X c= Empty -> X = Empty.

Axiom Empty_eq : forall X:set, (forall x, x /:e X) -> X = Empty.

Axiom UnionI : forall X x Y:set, x :e Y -> Y :e X -> x :e Union X.

Axiom UnionE : forall X x:set, x :e Union X -> exists Y:set, x :e Y /\ Y :e X.

Axiom UnionE_impred : forall X x:set, x :e Union X -> forall p:prop, (forall Y:set, x :e Y -> Y :e X -> p) -> p.

Axiom PowerI : forall X Y:set, Y c= X -> Y :e Power X.

Axiom PowerE : forall X Y:set, Y :e Power X -> Y c= X.

Axiom Empty_In_Power : forall X:set, Empty :e Power X.

Axiom Self_In_Power : forall X:set, X :e Power X.

Axiom xm : forall P:prop, P \/ ~P.

Axiom dneg : forall P:prop, ~~P -> P.

Axiom not_all_ex_demorgan_i : forall P:set->prop, ~(forall x, P x) -> exists x, ~P x.

Axiom eq_or_nand : or = (fun (x y:prop) => ~(~x /\ ~y)).

(* Parameter exactly1of2 "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" "163602f90de012a7426ee39176523ca58bc964ccde619b652cb448bd678f7e21" *)
Parameter exactly1of2 : prop->prop->prop.

Axiom exactly1of2_I1 : forall A B:prop, A -> ~B -> exactly1of2 A B.

Axiom exactly1of2_I2 : forall A B:prop, ~A -> B -> exactly1of2 A B.

Axiom exactly1of2_E : forall A B:prop, exactly1of2 A B ->
forall p:prop,
(A -> ~B -> p) ->
(~A -> B -> p) ->
p.

Axiom exactly1of2_or : forall A B:prop, exactly1of2 A B -> A \/ B.

Axiom ReplI : forall A:set, forall F:set->set, forall x:set, x :e A -> F x :e {F x|x :e A}.

Axiom ReplE : forall A:set, forall F:set->set, forall y:set, y :e {F x|x :e A} -> exists x :e A, y = F x.

Axiom ReplE_impred : forall A:set, forall F:set->set, forall y:set, y :e {F x|x :e A} -> forall p:prop, (forall x:set, x :e A -> y = F x -> p) -> p.

Axiom ReplE' : forall X, forall f:set -> set, forall p:set -> prop, (forall x :e X, p (f x)) -> forall y :e {f x|x :e X}, p y.

Axiom Repl_Empty : forall F:set -> set, {F x|x :e Empty} = Empty.

Axiom ReplEq_ext_sub : forall X, forall F G:set -> set, (forall x :e X, F x = G x) -> {F x|x :e X} c= {G x|x :e X}.

Axiom ReplEq_ext : forall X, forall F G:set -> set, (forall x :e X, F x = G x) -> {F x|x :e X} = {G x|x :e X}.

Axiom Repl_inv_eq : forall P:set -> prop, forall f g:set -> set,
    (forall x, P x -> g (f x) = x)
 -> forall X, (forall x :e X, P x) -> {g y|y :e {f x|x :e X}} = X.

Axiom Repl_invol_eq : forall P:set -> prop, forall f:set -> set,
    (forall x, P x -> f (f x) = x)
 -> forall X, (forall x :e X, P x) -> {f y|y :e {f x|x :e X}} = X.

(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop->set->set->set.

Notation IfThenElse If_i.

Axiom If_i_correct : forall p:prop, forall x y:set,
p /\ (if p then x else y) = x \/ ~p /\ (if p then x else y) = y.

Axiom If_i_0 : forall p:prop, forall x y:set,
~ p -> (if p then x else y) = y.

Axiom If_i_1 : forall p:prop, forall x y:set,
p -> (if p then x else y) = x.

Axiom If_i_or : forall p:prop, forall x y:set, (if p then x else y) = x \/ (if p then x else y) = y.

(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set->set->set.

Notation SetEnum2 UPair.

Axiom UPairE :
forall x y z:set, x :e {y,z} -> x = y \/ x = z.

Axiom UPairI1 : forall y z:set, y :e {y,z}.

Axiom UPairI2 : forall y z:set, z :e {y,z}.

(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Notation SetEnum1 Sing.

Axiom SingI : forall x:set, x :e {x}. 
Axiom SingE : forall x y:set, y :e {x} -> y = x. 
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.

(* Unicode :\/: "222a" *)
Infix :\/: 345 left := binunion.

Axiom binunionI1 : forall X Y z:set, z :e X -> z :e X :\/: Y.

Axiom binunionI2 : forall X Y z:set, z :e Y -> z :e X :\/: Y.

Axiom binunionE : forall X Y z:set, z :e X :\/: Y -> z :e X \/ z :e Y.

Axiom binunionE' : forall X Y z, forall p:prop, (z :e X -> p) -> (z :e Y -> p) -> (z :e X :\/: Y -> p).

Axiom binunion_asso:forall X Y Z:set, X :\/: (Y :\/: Z) = (X :\/: Y) :\/: Z.

Axiom binunion_com_Subq:forall X Y:set, X :\/: Y c= Y :\/: X.

Axiom binunion_com:forall X Y:set, X :\/: Y = Y :\/: X.

Axiom binunion_idl:forall X:set, Empty :\/: X = X.

Axiom binunion_idr:forall X:set, X :\/: Empty = X.

Axiom binunion_Subq_1: forall X Y:set, X c= X :\/: Y.

Axiom binunion_Subq_2: forall X Y:set, Y c= X :\/: Y.

Axiom binunion_Subq_min: forall X Y Z:set, X c= Z -> Y c= Z -> X :\/: Y c= Z.

Axiom Subq_binunion_eq:forall X Y, (X c= Y) = (X :\/: Y = Y).

Definition SetAdjoin : set->set->set := fun X y => X :\/: {y}.

Notation SetEnum Empty Sing UPair SetAdjoin.

(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion:set->(set->set)->set.

(* Unicode \/_ "22C3" *)
(* Subscript \/_ *)
Binder \/_ , := famunion.

Axiom famunionI:forall X:set, forall F:(set->set), forall x y:set, x :e X -> y :e F x -> y :e \/_ x :e X, F x.

Axiom famunionE:forall X:set, forall F:(set->set), forall y:set, y :e (\/_ x :e X, F x) -> exists x :e X, y :e F x.

Axiom famunionE_impred : forall X : set , forall F : (set -> set) , forall y : set , y :e (\/_ x :e X , F x) -> forall p:prop, (forall x, x :e X -> y :e F x -> p) -> p.

Axiom famunion_Empty: forall F:set -> set, (\/_ x :e Empty, F x) = Empty.

Section SepSec.

Variable X:set.
Variable P:set->prop.
Let z : set := Eps_i (fun z => z :e X /\ P z).
Let F:set->set := fun x => if P x then x else z.

(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep:set.

End SepSec.

Notation Sep Sep.

Axiom SepI:forall X:set, forall P:(set->prop), forall x:set, x :e X -> P x -> x :e {x :e X|P x}.

Axiom SepE:forall X:set, forall P:(set->prop), forall x:set, x :e {x :e X|P x} -> x :e X /\ P x.

Axiom SepE1:forall X:set, forall P:(set->prop), forall x:set, x :e {x :e X|P x} -> x :e X.

Axiom SepE2:forall X:set, forall P:(set->prop), forall x:set, x :e {x :e X|P x} -> P x.

Axiom Sep_Subq : forall X:set, forall P:set->prop, {x :e X|P x} c= X.

Axiom Sep_In_Power : forall X:set, forall P:set->prop, {x :e X|P x} :e Power X.

(* Parameter ReplSep "f627d20f1b21063483a5b96e4e2704bac09415a75fed6806a2587ce257f1f2fd" "ec807b205da3293041239ff9552e2912636525180ddecb3a2b285b91b53f70d8" *)
Parameter ReplSep : set->(set->prop)->(set->set)->set.
Notation ReplSep ReplSep.

Axiom ReplSepI: forall X:set, forall P:set->prop, forall F:set->set, forall x:set, x :e X -> P x -> F x :e {F x|x :e X, P x}.

Axiom ReplSepE:forall X:set, forall P:set->prop, forall F:set->set, forall y:set, y :e {F x|x :e X, P x} -> exists x:set, x :e X /\ P x /\ y = F x.

Axiom ReplSepE_impred: forall X:set, forall P:set->prop, forall F:set->set, forall y:set, y :e {F x|x :e X, P x} -> forall p:prop, (forall x :e X, P x -> y = F x -> p) -> p.

(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect:set->set->set.

(* Unicode :/\: "2229" *)
Infix :/\: 340 left := binintersect.

Axiom binintersectI:forall X Y z, z :e X -> z :e Y -> z :e X :/\: Y.

Axiom binintersectE:forall X Y z, z :e X :/\: Y -> z :e X /\ z :e Y.

Axiom binintersectE1:forall X Y z, z :e X :/\: Y -> z :e X.

Axiom binintersectE2:forall X Y z, z :e X :/\: Y -> z :e Y.

Axiom binintersect_Subq_1:forall X Y:set, X :/\: Y c= X.

Axiom binintersect_Subq_2:forall X Y:set, X :/\: Y c= Y.

Axiom binintersect_Subq_eq_1 : forall X Y, X c= Y -> X :/\: Y = X.

Axiom binintersect_Subq_max:forall X Y Z:set, Z c= X -> Z c= Y -> Z c= X :/\: Y.

Axiom binintersect_com_Subq: forall X Y:set, X :/\: Y c= Y :/\: X.

Axiom binintersect_com: forall X Y:set, X :/\: Y = Y :/\: X.

(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus:set->set->set.

(* Unicode :\: "2216" *)
Infix :\: 350 := setminus.

Axiom setminusI:forall X Y z, (z :e X) -> (z /:e Y) -> z :e X :\: Y.

Axiom setminusE:forall X Y z, (z :e X :\: Y) -> z :e X /\ z /:e Y.

Axiom setminusE1:forall X Y z, (z :e X :\: Y) -> z :e X.
Axiom setminusE2:forall X Y z, (z :e X :\: Y) -> z /:e Y.

Axiom setminus_Subq:forall X Y:set, X :\: Y c= X.

Axiom setminus_Subq_contra:forall X Y Z:set, Z c= Y -> X :\: Y c= X :\: Z.

Axiom setminus_In_Power : forall A U, A :\: U :e Power A.

Axiom In_irref : forall x, x /:e x.

Axiom In_no2cycle : forall x y, x :e y -> y :e x -> False.

(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set->set.

Axiom ordsuccI1 : forall x:set, x c= ordsucc x.

Axiom ordsuccI2 : forall x:set, x :e ordsucc x.

Axiom ordsuccE : forall x y:set, y :e ordsucc x -> y :e x \/ y = x.

Notation Nat Empty ordsucc.

Axiom neq_0_ordsucc : forall a:set, 0 <> ordsucc a.

Axiom neq_ordsucc_0 : forall a:set, ordsucc a <> 0.

Axiom ordsucc_inj : forall a b:set, ordsucc a = ordsucc b -> a = b.

Axiom ordsucc_inj_contra : forall a b:set, a <> b -> ordsucc a <> ordsucc b.

Axiom In_0_1 : 0 :e 1.

Axiom In_0_2 : 0 :e 2.

Axiom In_1_2 : 1 :e 2.

Definition nat_p : set->prop := fun n:set => forall p:set->prop, p 0 -> (forall x:set, p x -> p (ordsucc x)) -> p n.

Axiom nat_0 : nat_p 0.

Axiom nat_ordsucc : forall n:set, nat_p n -> nat_p (ordsucc n).

Axiom nat_1 : nat_p 1.

Axiom nat_2 : nat_p 2.

Axiom nat_0_in_ordsucc : forall n, nat_p n -> 0 :e ordsucc n.

Axiom nat_ordsucc_in_ordsucc : forall n, nat_p n -> forall m :e n, ordsucc m :e ordsucc n.

Axiom nat_ind : forall p:set->prop, p 0 -> (forall n, nat_p n -> p n -> p (ordsucc n)) -> forall n, nat_p n -> p n.

Axiom nat_inv_impred : forall p:set->prop, p 0 -> (forall n, nat_p n -> p (ordsucc n)) -> forall n, nat_p n -> p n.

Axiom nat_inv : forall n, nat_p n -> n = 0 \/ exists x, nat_p x /\ n = ordsucc x.

Axiom nat_complete_ind : forall p:set->prop, (forall n, nat_p n -> (forall m :e n, p m) -> p n) -> forall n, nat_p n -> p n.

Axiom nat_p_trans : forall n, nat_p n -> forall m :e n, nat_p m.

Axiom nat_trans : forall n, nat_p n -> forall m :e n, m c= n.

Axiom nat_ordsucc_trans : forall n, nat_p n -> forall m :e ordsucc n, m c= n.

Axiom Union_ordsucc_eq : forall n, nat_p n -> Union (ordsucc n) = n.

Axiom cases_1: forall i :e 1, forall p:set->prop, p 0 -> p i.

Axiom cases_2: forall i :e 2, forall p:set->prop, p 0 -> p 1 -> p i.

Axiom cases_3: forall i :e 3, forall p:set->prop, p 0 -> p 1 -> p 2 -> p i.

Axiom neq_0_1 : 0 <> 1.

Axiom neq_1_0 : 1 <> 0.

Axiom neq_0_2 : 0 <> 2.

Axiom neq_2_0 : 2 <> 0.

Axiom neq_1_2 : 1 <> 2.

Axiom ZF_closed_E : forall U, ZF_closed U ->
 forall p:prop,
 (Union_closed U ->
  Power_closed U ->
  Repl_closed U -> p)
 -> p.

Axiom ZF_Union_closed : forall U, ZF_closed U ->
  forall X :e U, Union X :e U.

Axiom ZF_Power_closed : forall U, ZF_closed U ->
  forall X :e U, Power X :e U.

Axiom ZF_Repl_closed : forall U, ZF_closed U ->
  forall X :e U, forall F:set->set, (forall x :e X, F x :e U) -> {F x|x:eX} :e U.

Axiom ZF_UPair_closed : forall U, ZF_closed U ->
  forall x y :e U, {x,y} :e U.

Axiom ZF_Sing_closed : forall U, ZF_closed U ->
  forall x :e U, {x} :e U.

Axiom ZF_binunion_closed : forall U, ZF_closed U ->
  forall X Y :e U, (X :\/: Y) :e U.

Axiom ZF_ordsucc_closed : forall U, ZF_closed U ->
  forall x :e U, ordsucc x :e U.

Axiom nat_p_UnivOf_Empty : forall n:set, nat_p n -> n :e UnivOf Empty.

(* Unicode omega "3c9" *)
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.

Axiom omega_nat_p : forall n :e omega, nat_p n.

Axiom nat_p_omega : forall n:set, nat_p n -> n :e omega.

Axiom omega_ordsucc : forall n :e omega, ordsucc n :e omega.

Definition ordinal : set->prop := fun (alpha:set) => TransSet alpha /\ forall beta :e alpha, TransSet beta.

Axiom ordinal_TransSet : forall alpha:set, ordinal alpha -> TransSet alpha.

Axiom ordinal_Empty : ordinal Empty.

Axiom ordinal_Hered : forall alpha:set, ordinal alpha -> forall beta :e alpha, ordinal beta.

Axiom TransSet_ordsucc : forall X:set, TransSet X -> TransSet (ordsucc X).

Axiom ordinal_ordsucc : forall alpha:set, ordinal alpha -> ordinal (ordsucc alpha).

Axiom nat_p_ordinal : forall n:set, nat_p n -> ordinal n.

Axiom ordinal_1 : ordinal 1.

Axiom ordinal_2 : ordinal 2.

Axiom omega_TransSet : TransSet omega.

Axiom omega_ordinal : ordinal omega.

Axiom ordsucc_omega_ordinal: ordinal (ordsucc omega).

Axiom TransSet_ordsucc_In_Subq : forall X:set, TransSet X -> forall x :e X, ordsucc x c= X.

Axiom ordinal_ordsucc_In_Subq : forall alpha, ordinal alpha -> forall beta :e alpha, ordsucc beta c= alpha.

Axiom ordinal_trichotomy_or : forall alpha beta:set, ordinal alpha -> ordinal beta -> alpha :e beta \/ alpha = beta \/ beta :e alpha.
   

Axiom ordinal_trichotomy_or_impred : forall alpha beta:set, ordinal alpha -> ordinal beta -> forall p:prop, (alpha :e beta -> p) -> (alpha = beta -> p) -> (beta :e alpha -> p) -> p.

Axiom ordinal_In_Or_Subq : forall alpha beta, ordinal alpha -> ordinal beta -> alpha :e beta \/ beta c= alpha.

Axiom ordinal_linear : forall alpha beta, ordinal alpha -> ordinal beta -> alpha c= beta \/ beta c= alpha.

Axiom ordinal_ordsucc_In_eq : forall alpha beta, ordinal alpha -> beta :e alpha -> ordsucc beta :e alpha \/ alpha = ordsucc beta.

Axiom ordinal_lim_or_succ : forall alpha, ordinal alpha -> (forall beta :e alpha, ordsucc beta :e alpha) \/ (exists beta :e alpha, alpha = ordsucc beta).

Axiom ordinal_ordsucc_In : forall alpha, ordinal alpha -> forall beta :e alpha, ordsucc beta :e ordsucc alpha.

Axiom ordinal_famunion : forall X, forall F:set -> set, (forall x :e X, ordinal (F x)) -> ordinal (\/_ x :e X, F x).

Axiom ordinal_binintersect : forall alpha beta, ordinal alpha -> ordinal beta -> ordinal (alpha :/\: beta).

Axiom ordinal_binunion : forall alpha beta, ordinal alpha -> ordinal beta -> ordinal (alpha :\/: beta).

Axiom ordinal_ind : forall p:set->prop, 
(forall alpha, ordinal alpha -> (forall beta :e alpha, p beta) -> p alpha)
->
forall alpha, ordinal alpha -> p alpha.

Axiom least_ordinal_ex : forall p:set -> prop, (exists alpha, ordinal alpha /\ p alpha) -> exists alpha, ordinal alpha /\ p alpha /\ forall beta :e alpha, ~p beta.


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

Axiom bijI : forall X Y, forall f:set -> set,
    (forall u :e X, f u :e Y)
 -> (forall u v :e X, f u = f v -> u = v)
 -> (forall w :e Y, exists u :e X, f u = w)
 -> bij X Y f.

Axiom bijE : forall X Y, forall f:set -> set,
    bij X Y f
 -> forall p:prop,
      ((forall u :e X, f u :e Y)
    -> (forall u v :e X, f u = f v -> u = v)
    -> (forall w :e Y, exists u :e X, f u = w)
    -> p)
   -> p.
  
(* Parameter inv "e1e47685e70397861382a17f4ecc47d07cdab63beca11b1d0c6d2985d3e2d38b" "896fa967e973688effc566a01c68f328848acd8b37e857ad23e133fdd4a50463" *)
Parameter inv : set -> (set -> set) -> set -> set.

Axiom surj_rinv : forall X Y, forall f:set->set, (forall w :e Y, exists u :e X, f u = w) -> forall y :e Y, inv X f y :e X /\ f (inv X f y) = y.

Axiom inj_linv : forall X, forall f:set->set, (forall u v :e X, f u = f v -> u = v) -> forall x :e X, inv X f (f x) = x.

Axiom bij_inv : forall X Y, forall f:set->set, bij X Y f -> bij Y X (inv X f).

Axiom bij_id : forall X, bij X X (fun x => x).

Axiom bij_comp : forall X Y Z:set, forall f g:set->set, bij X Y f -> bij Y Z g -> bij X Z (fun x => g (f x)).

Definition equip : set -> set -> prop
 := fun X Y : set => exists f : set -> set, bij X Y f.

Axiom equip_ref : forall X, equip X X.

Axiom equip_sym : forall X Y, equip X Y -> equip Y X.

Axiom equip_tra : forall X Y Z, equip X Y -> equip Y Z -> equip X Z.

Axiom equip_0_Empty : forall X, equip X 0 -> X = 0.

Section SchroederBernstein.

Axiom KnasterTarski_set: forall A, forall F:set->set,
    (forall U :e Power A, F U :e Power A)
 -> (forall U V :e Power A, U c= V -> F U c= F V)
 -> exists Y :e Power A, F Y = Y.

Axiom image_In_Power : forall A B, forall f:set -> set, (forall x :e A, f x :e B) -> forall U :e Power A, {f x|x :e U} :e Power B.

Axiom image_monotone : forall f:set -> set, forall U V, U c= V -> {f x|x :e U} c= {f x|x :e V}.

Axiom setminus_antimonotone : forall A U V, U c= V -> A :\: V c= A :\: U.

Axiom SchroederBernstein: forall A B, forall f g:set -> set, inj A B f -> inj B A g -> equip A B.

End SchroederBernstein.

Section PigeonHole.

Axiom PigeonHole_nat : forall n, nat_p n -> forall f:set -> set, (forall i :e ordsucc n, f i :e n) -> ~(forall i j :e ordsucc n, f i = f j -> i = j).

Axiom PigeonHole_nat_bij : forall n, nat_p n -> forall f:set -> set, (forall i :e n, f i :e n) -> (forall i j :e n, f i = f j -> i = j) -> bij n n f.

End PigeonHole.

Definition finite : set -> prop := fun X => exists n :e omega, equip X n.

Axiom finite_ind : forall p:set -> prop,
    p Empty
 -> (forall X y, finite X -> y /:e X -> p X -> p (X :\/: {y}))
 -> forall X, finite X -> p X.

Axiom finite_Empty: finite 0.

Axiom adjoin_finite: forall X y, finite X -> finite (X :\/: {y}).

Axiom binunion_finite: forall X, finite X -> forall Y, finite Y -> finite (X :\/: Y).

Axiom famunion_nat_finite : forall X:set -> set, forall n, nat_p n -> (forall i :e n, finite (X i)) -> finite (\/_ i :e n, X i).

Axiom Subq_finite : forall X, finite X -> forall Y, Y c= X -> finite Y.

Axiom TransSet_In_ordsucc_Subq : forall x y, TransSet y -> x :e ordsucc y -> x c= y.

Axiom exandE_i : forall P Q:set -> prop, (exists x, P x /\ Q x) -> forall r:prop, (forall x, P x -> Q x -> r) -> r.

Axiom exandE_ii : forall P Q:(set -> set) -> prop, (exists x:set -> set, P x /\ Q x) -> forall p:prop, (forall x:set -> set, P x -> Q x -> p) -> p.

Axiom exandE_iii : forall P Q:(set -> set -> set) -> prop, (exists x:set -> set -> set, P x /\ Q x) -> forall p:prop, (forall x:set -> set -> set, P x -> Q x -> p) -> p.

Axiom exandE_iiii : forall P Q:(set -> set -> set -> set) -> prop, (exists x:set -> set -> set -> set, P x /\ Q x) -> forall p:prop, (forall x:set -> set -> set -> set, P x -> Q x -> p) -> p.

Section Descr_ii.

Variable P : (set -> set) -> prop.

(* Parameter Descr_ii "a6e81668bfd1db6e6eb6a13bf66094509af176d9d0daccda274aa6582f6dcd7c" "3bae39e9880bbf5d70538d82bbb05caf44c2c11484d80d06dee0589d6f75178c" *)
Parameter Descr_ii : set -> set.

Hypothesis Pex: exists f:set -> set, P f.
Hypothesis Puniq: forall f g:set -> set, P f -> P g -> f = g.

Axiom Descr_ii_prop : P Descr_ii.

End Descr_ii.

Section Descr_iii.

Variable P : (set -> set -> set) -> prop.

(* Parameter Descr_iii "dc42f3fe5d0c55512ef81fe5d2ad0ff27c1052a6814b1b27f5a5dcb6d86240bf" "ca5fc17a582fdd4350456951ccbb37275637ba6c06694213083ed9434fe3d545" *)
Parameter Descr_iii : set -> set -> set.

Hypothesis Pex: exists f:set -> set -> set, P f.
Hypothesis Puniq: forall f g:set -> set -> set, P f -> P g -> f = g.

Axiom Descr_iii_prop : P Descr_iii.

End Descr_iii.

Section Descr_Vo1.

Variable P : Vo 1 -> prop.

(* Parameter Descr_Vo1 "322bf09a1711d51a4512e112e1767cb2616a7708dc89d7312c8064cfee6e3315" "615c0ac7fca2b62596ed34285f29a77b39225d1deed75d43b7ae87c33ba37083" *)
Parameter Descr_Vo1 : Vo 1.

Hypothesis Pex: exists f:Vo 1, P f.
Hypothesis Puniq: forall f g:Vo 1, P f -> P g -> f = g.

Axiom Descr_Vo1_prop : P Descr_Vo1.

End Descr_Vo1.

Section If_ii.

Variable p:prop.
Variable f g:set -> set.

(* Parameter If_ii "e76df3235104afd8b513a92c00d3cc56d71dd961510bf955a508d9c2713c3f29" "17057f3db7be61b4e6bd237e7b37125096af29c45cb784bb9cc29b1d52333779" *)
Parameter If_ii : set -> set.

Axiom If_ii_1 : p -> If_ii = f.

Axiom If_ii_0 : ~p -> If_ii = g.

End If_ii.

Section If_iii.

Variable p:prop.
Variable f g:set -> set -> set.

(* Parameter If_iii "53034f33cbed012c3c6db42812d3964f65a258627a765f5bede719198af1d1ca" "3314762dce5a2e94b7e9e468173b047dd4a9fac6ee2c5f553c6ea15e9c8b7542" *)
Parameter If_iii : set -> set -> set.

Axiom If_iii_1 : p -> If_iii = f.

Axiom If_iii_0 : ~p -> If_iii = g.

End If_iii.

Section EpsilonRec_i.

Variable F:set -> (set -> set) -> set.

(* Parameter In_rec_i "f97da687c51f5a332ff57562bd465232bc70c9165b0afe0a54e6440fc4962a9f" "fac413e747a57408ad38b3855d3cde8673f86206e95ccdadff2b5babaf0c219e" *)
Parameter In_rec_i : set -> set.

Hypothesis Fr:forall X:set, forall g h:set -> set, (forall x :e X, g x = h x) -> F X g = F X h.

Axiom In_rec_i_eq : forall X:set, In_rec_i X = F X In_rec_i.

End EpsilonRec_i.

Section EpsilonRec_ii.

Variable F:set -> (set -> (set -> set)) -> (set -> set).

(* Parameter In_rec_ii "4d137cad40b107eb0fc2c707372525f1279575e6cadb4ebc129108161af3cedb" "f3c9abbc5074c0d68e744893a170de526469426a5e95400ae7fc81f74f412f7e" *)
Parameter In_rec_ii : set -> (set -> set).

Hypothesis Fr:forall X:set, forall g h:set -> (set -> set), (forall x :e X, g x = h x) -> F X g = F X h.

Axiom In_rec_ii_eq : forall X:set, In_rec_ii X = F X In_rec_ii.

End EpsilonRec_ii.

Section EpsilonRec_iii.

Variable F:set -> (set -> (set -> set -> set)) -> (set -> set -> set).

(* Parameter In_rec_iii "222f1b8dcfb0d2e33cc4b232e87cbcdfe5c4a2bdc5326011eb70c6c9aeefa556" "9b3a85b85e8269209d0ca8bf18ef658e56f967161bf5b7da5e193d24d345dd06" *)
Parameter In_rec_iii : set -> (set -> set -> set).

Hypothesis Fr:forall X:set, forall g h:set -> (set -> set -> set), (forall x :e X, g x = h x) -> F X g = F X h.

Axiom In_rec_iii_eq : forall X:set, In_rec_iii X = F X In_rec_iii.

End EpsilonRec_iii.

Section NatRec.

Variable z:set.
Variable f:set->set->set.
Let F : set->(set->set)->set := fun n g => if Union n :e n then f (Union n) (g (Union n)) else z.

Definition nat_primrec : set->set := In_rec_i F.

Axiom nat_primrec_r : forall X:set, forall g h:set -> set, (forall x :e X, g x = h x) -> F X g = F X h.

Axiom nat_primrec_0 : nat_primrec 0 = z.

Axiom nat_primrec_S : forall n:set, nat_p n -> nat_primrec (ordsucc n) = f n (nat_primrec n).

End NatRec.

Section NatArith.

Definition add_nat : set->set->set := fun n m:set => nat_primrec n (fun _ r => ordsucc r) m.

Infix + 360 right := add_nat.

Axiom add_nat_0R : forall n:set, n + 0 = n.

Axiom add_nat_SR : forall n m:set, nat_p m -> n + ordsucc m = ordsucc (n + m).

Axiom add_nat_p : forall n:set, nat_p n -> forall m:set, nat_p m -> nat_p (n + m).

Axiom add_nat_1_1_2 : 1 + 1 = 2.

Definition mul_nat : set->set->set := fun n m:set => nat_primrec 0 (fun _ r => n + r) m.

Infix * 355 right := mul_nat.

Axiom mul_nat_0R : forall n:set, n * 0 = 0.

Axiom mul_nat_SR : forall n m:set, nat_p m -> n * ordsucc m = n + n * m.

Axiom mul_nat_p : forall n:set, nat_p n -> forall m:set, nat_p m -> nat_p (n * m).

End NatArith.

(*** Injection of set into itself that will correspond to x |-> (1,x) after pairing is defined. ***)
Definition Inj1 : set -> set := In_rec_i (fun X f => {0} :\/: {f x|x :e X}).

Axiom Inj1_eq : forall X:set, Inj1 X = {0} :\/: {Inj1 x|x :e X}.

Axiom Inj1I1 : forall X:set, 0 :e Inj1 X.

Axiom Inj1I2 : forall X x:set, x :e X -> Inj1 x :e Inj1 X.

Axiom Inj1E : forall X y:set, y :e Inj1 X -> y = 0 \/ exists x :e X, y = Inj1 x.

Axiom Inj1NE1 : forall x:set, Inj1 x <> 0.

Axiom Inj1NE2 : forall x:set, Inj1 x /:e {0}.

(*** Injection of set into itself that will correspond to x |-> (0,x) after pairing is defined. ***)
Definition Inj0 : set -> set := fun X => {Inj1 x|x :e X}.

Axiom Inj0I : forall X x:set, x :e X -> Inj1 x :e Inj0 X.

Axiom Inj0E : forall X y:set, y :e Inj0 X -> exists x:set, x :e X /\ y = Inj1 x.

(*** Unj : Left inverse of Inj1 and Inj0 ***)
Definition Unj : set -> set := In_rec_i (fun X f => {f x|x :e X :\: {0}}).

Axiom Unj_eq : forall X:set, Unj X = {Unj x|x :e X :\: {0}}.

Axiom Unj_Inj1_eq : forall X:set, Unj (Inj1 X) = X.

Axiom Inj1_inj : forall X Y:set, Inj1 X = Inj1 Y -> X = Y.

Axiom Unj_Inj0_eq : forall X:set, Unj (Inj0 X) = X.

Axiom Inj0_inj : forall X Y:set, Inj0 X = Inj0 Y -> X = Y.

Axiom Inj0_0 : Inj0 0 = 0.

Axiom Inj0_Inj1_neq : forall X Y:set, Inj0 X <> Inj1 Y.

(*** setsum ***)
Definition setsum : set -> set -> set := fun X Y => {Inj0 x|x :e X} :\/: {Inj1 y|y :e Y}.

(* Unicode :+: "002b" *)
Infix :+: 450 left := setsum.

Axiom Inj0_setsum : forall X Y x:set, x :e X -> Inj0 x :e X :+: Y.

Axiom Inj1_setsum : forall X Y y:set, y :e Y -> Inj1 y :e X :+: Y.

Axiom setsum_Inj_inv : forall X Y z:set, z :e X :+: Y -> (exists x :e X, z = Inj0 x) \/ (exists y :e Y, z = Inj1 y).

Axiom Inj0_setsum_0L : forall X:set, 0 :+: X = Inj0 X.

Axiom Subq_1_Sing0 : 1 c= {0}.
Axiom eq_1_Sing0 : 1 = {0}.

Axiom Inj1_setsum_1L : forall X:set, 1 :+: X = Inj1 X.

Axiom nat_setsum1_ordsucc : forall n:set, nat_p n -> 1 :+: n = ordsucc n.

Axiom setsum_0_0 : 0 :+: 0 = 0.

Axiom setsum_1_0_1 : 1 :+: 0 = 1.

Axiom setsum_1_1_2 : 1 :+: 1 = 2.

Section pair_setsum.

Let pair := setsum.

Definition proj0 : set -> set := fun Z => {Unj z|z :e Z, exists x:set, Inj0 x = z}.
Definition proj1 : set -> set := fun Z => {Unj z|z :e Z, exists y:set, Inj1 y = z}.

Axiom Inj0_pair_0_eq : Inj0 = pair 0.

Axiom Inj1_pair_1_eq : Inj1 = pair 1.

Axiom pairI0 : forall X Y x, x :e X -> pair 0 x :e pair X Y.

Axiom pairI1 : forall X Y y, y :e Y -> pair 1 y :e pair X Y.

Axiom pairE : forall X Y z, z :e pair X Y -> (exists x :e X, z = pair 0 x) \/ (exists y :e Y, z = pair 1 y).

Axiom pairE0 : forall X Y x, pair 0 x :e pair X Y -> x :e X.

Axiom pairE1 : forall X Y y, pair 1 y :e pair X Y -> y :e Y.

Axiom proj0I : forall w u:set, pair 0 u :e w -> u :e proj0 w.

Axiom proj0E : forall w u:set, u :e proj0 w -> pair 0 u :e w.

Axiom proj1I : forall w u:set, pair 1 u :e w -> u :e proj1 w.

Axiom proj1E : forall w u:set, u :e proj1 w -> pair 1 u :e w.

Axiom proj0_pair_eq : forall X Y:set, proj0 (pair X Y) = X.

Axiom proj1_pair_eq : forall X Y:set, proj1 (pair X Y) = Y.


(*** Sigma X Y = {(x,y) | x in X, y in Y x} ***)
Definition Sigma : set -> (set -> set) -> set :=
fun X Y => \/_ x :e X, {pair x y|y :e Y x}.

(* Unicode Sigma_ "2211" *)
Binder+ Sigma_ , := Sigma.

Axiom pair_Sigma : forall X:set, forall Y:set -> set, forall x :e X, forall y :e Y x, pair x y :e Sigma_ x :e X, Y x.

Axiom Sigma_eta_proj0_proj1 : forall X:set, forall Y:set -> set, forall z :e (Sigma_ x :e X, Y x), pair (proj0 z) (proj1 z) = z /\ proj0 z :e X /\ proj1 z :e Y (proj0 z).

Axiom proj_Sigma_eta : forall X:set, forall Y:set -> set, forall z :e (Sigma_ x :e X, Y x), pair (proj0 z) (proj1 z) = z.

Axiom proj0_Sigma : forall X:set, forall Y:set -> set, forall z:set, z :e (Sigma_ x :e X, Y x) -> proj0 z :e X.

Axiom proj1_Sigma : forall X:set, forall Y:set -> set, forall z:set, z :e (Sigma_ x :e X, Y x) -> proj1 z :e Y (proj0 z).

Axiom pair_Sigma_E1 : forall X:set, forall Y:set->set, forall x y:set, pair x y :e (Sigma_ x :e X, Y x) -> y :e Y x.

Axiom Sigma_E : forall X:set, forall Y:set->set, forall z:set, z :e (Sigma_ x :e X, Y x) -> exists x :e X, exists y :e Y x, z = pair x y.

Definition setprod : set->set->set := fun X Y:set => Sigma_ x :e X, Y.

(* Unicode :*: "2a2f" *)
Infix :*: 440 left := setprod.

(*** lam X F = {(x,y) | x :e X, y :e F x} = \/_{x :e X} {(x,y) | y :e (F x)} = Sigma X F ***)
Let lam : set -> (set -> set) -> set := Sigma.

(***  ap f x = {proj1 z | z :e f,  exists y, z = pair x y}} ***)
Definition ap : set -> set -> set := fun f x => {proj1 z|z :e f, exists y:set, z = pair x y}.

Notation SetImplicitOp ap.
Notation SetLam Sigma.

Axiom lamI : forall X:set, forall F:set->set, forall x :e X, forall y :e F x, pair x y :e fun x :e X => F x.

Axiom lamE : forall X:set, forall F:set->set, forall z:set, z :e (fun x :e X => F x) -> exists x :e X, exists y :e F x, z = pair x y.

Axiom apI : forall f x y, pair x y :e f -> y :e f x.

Axiom apE : forall f x y, y :e f x -> pair x y :e f.

Axiom beta : forall X:set, forall F:set -> set, forall x:set, x :e X -> (fun x :e X => F x) x = F x.

Axiom proj0_ap_0 : forall u, proj0 u = u 0.

Axiom proj1_ap_1 : forall u, proj1 u = u 1.

Axiom pair_ap_0 : forall x y:set, (pair x y) 0 = x.

Axiom pair_ap_1 : forall x y:set, (pair x y) 1 = y.

Axiom ap0_Sigma : forall X:set, forall Y:set -> set, forall z:set, z :e (Sigma_ x :e X, Y x) -> (z 0) :e X.

Axiom ap1_Sigma : forall X:set, forall Y:set -> set, forall z:set, z :e (Sigma_ x :e X, Y x) -> (z 1) :e (Y (z 0)).

Definition pair_p:set->prop
:= fun u:set => pair (u 0) (u 1) = u.

Axiom pair_p_I : forall x y, pair_p (pair x y).

Axiom Subq_2_UPair01 : 2 c= {0,1}.

Axiom tuple_pair : forall x y:set, pair x y = (x,y).

Definition Pi : set -> (set -> set) -> set := fun X Y => {f :e Power (Sigma_ x :e X, Union (Y x)) | forall x :e X, f x :e Y x}.

(* Unicode Pi_ "220f" *)
Binder+ Pi_ , := Pi.

Axiom PiI : forall X:set, forall Y:set->set, forall f:set,
    (forall u :e f, pair_p u /\ u 0 :e X) -> (forall x :e X, f x :e Y x) -> f :e Pi_ x :e X, Y x.

Axiom lam_Pi : forall X:set, forall Y:set -> set, forall F:set -> set,
 (forall x :e X, F x :e Y x) -> (fun x :e X => F x) :e (Pi_ x :e X, Y x).

Axiom ap_Pi : forall X:set, forall Y:set -> set, forall f:set, forall x:set, f :e (Pi_ x :e X, Y x) -> x :e X -> f x :e Y x.

Definition setexp : set->set->set := fun X Y:set => Pi_ y :e Y, X.

(* Superscript :^: *)
Infix :^: 430 left := setexp.

Axiom pair_tuple_fun : pair = (fun x y => (x,y)).

Axiom lamI2 : forall X, forall F:set->set, forall x :e X, forall y :e F x, (x,y) :e fun x :e X => F x.

Section Tuples.

Variable x0 x1: set.

Axiom tuple_2_0_eq: (x0,x1) 0 = x0.

Axiom tuple_2_1_eq: (x0,x1) 1 = x1.

End Tuples.

Axiom ReplEq_setprod_ext : forall X Y, forall F G:set -> set -> set, (forall x :e X, forall y :e Y, F x y = G x y) -> {F (w 0) (w 1)|w :e X :*: Y} = {G (w 0) (w 1)|w :e X :*: Y}.

Axiom tuple_2_Sigma : forall X:set, forall Y:set -> set, forall x :e X, forall y :e Y x, (x,y) :e Sigma_ x :e X, Y x.

Axiom tuple_2_setprod : forall X:set, forall Y:set, forall x :e X, forall y :e Y, (x,y) :e X :*: Y.

End pair_setsum.

(** from Part 2 **)

(* Unicode Sigma_ "2211" *)
Binder+ Sigma_ , := Sigma.

(* Unicode :*: "2a2f" *)
Infix :*: 440 left := setprod.

(* Unicode Pi_ "220f" *)
Binder+ Pi_ , := Pi.

(* Superscript :^: *)
Infix :^: 430 left := setexp.

(* Parameter DescrR_i_io_1 "1f005fdad5c6f98763a15a5e5539088f5d43b7d1be866b0b204fda1ce9ed9248" "1d3fd4a14ef05bd43f5c147d7966cf05fd2fed808eea94f56380454b9a6044b2" *)
Parameter DescrR_i_io_1 : (set->(set->prop)->prop) -> set.

(* Parameter DescrR_i_io_2 "28d8599686476258c12dcc5fc5f5974335febd7d5259e1a8e5918b7f9b91ca03" "768eb2ad186988375e6055394e36e90c81323954b8a44eb08816fb7a84db2272" *)
Parameter DescrR_i_io_2 : (set->(set->prop)->prop) -> set->prop.

Axiom DescrR_i_io_12 : forall R:set->(set->prop)->prop, (exists x, (exists y:set->prop, R x y) /\ (forall y z:set -> prop, R x y -> R x z -> y = z)) -> R (DescrR_i_io_1 R) (DescrR_i_io_2 R).

(** Conway describes this way of formalizing in ZF in an appendix to Part Zero of his book,
    but rejects formalization in favor of "Mathematician's Liberation."
 **)

Definition PNoEq_ : set -> (set -> prop) -> (set -> prop) -> prop
 := fun alpha p q => forall beta :e alpha, p beta <-> q beta.

Axiom PNoEq_ref_ : forall alpha, forall p:set -> prop, PNoEq_ alpha p p.

Axiom PNoEq_sym_ : forall alpha, forall p q:set -> prop, PNoEq_ alpha p q -> PNoEq_ alpha q p.

Axiom PNoEq_tra_ : forall alpha, forall p q r:set -> prop, PNoEq_ alpha p q -> PNoEq_ alpha q r -> PNoEq_ alpha p r.

Axiom PNoEq_antimon_ : forall p q:set -> prop, forall alpha, ordinal alpha -> forall beta :e alpha, PNoEq_ alpha p q -> PNoEq_ beta p q.

Definition PNoLt_ : set -> (set -> prop) -> (set -> prop) -> prop
 := fun alpha p q => exists beta :e alpha, PNoEq_ beta p q /\ ~p beta /\ q beta.

Axiom PNoLt_E_ : forall alpha, forall p q:set -> prop, PNoLt_ alpha p q ->
  forall R:prop, (forall beta, beta :e alpha -> PNoEq_ beta p q -> ~p beta -> q beta -> R) -> R.

Axiom PNoLt_irref_ : forall alpha, forall p:set -> prop, ~PNoLt_ alpha p p.

Axiom PNoLt_mon_ : forall p q:set -> prop, forall alpha, ordinal alpha -> forall beta :e alpha, PNoLt_ beta p q -> PNoLt_ alpha p q.

Axiom PNoLt_trichotomy_or_ : forall p q:set -> prop, forall alpha, ordinal alpha
  -> PNoLt_ alpha p q \/ PNoEq_ alpha p q \/ PNoLt_ alpha q p.

Axiom PNoLt_tra_ : forall alpha, ordinal alpha -> forall p q r:set -> prop, PNoLt_ alpha p q -> PNoLt_ alpha q r -> PNoLt_ alpha p r.

(* Parameter PNoLt "2336eb45d48549dd8a6a128edc17a8761fd9043c180691483bcf16e1acc9f00a" "8f57a05ce4764eff8bc94b278352b6755f1a46566cd7220a5488a4a595a47189" *)
Parameter PNoLt : set -> (set -> prop) -> set -> (set -> prop) -> prop.

Axiom PNoLtI1 : forall alpha beta, forall p q:set -> prop,
  PNoLt_ (alpha :/\: beta) p q -> PNoLt alpha p beta q.

Axiom PNoLtI2 : forall alpha beta, forall p q:set -> prop,
  alpha :e beta -> PNoEq_ alpha p q -> q alpha -> PNoLt alpha p beta q.

Axiom PNoLtI3 : forall alpha beta, forall p q:set -> prop,
  beta :e alpha -> PNoEq_ beta p q -> ~p beta -> PNoLt alpha p beta q.

Axiom PNoLtE : forall alpha beta, forall p q:set -> prop,
  PNoLt alpha p beta q ->
  forall R:prop,
      (PNoLt_ (alpha :/\: beta) p q -> R)
   -> (alpha :e beta -> PNoEq_ alpha p q -> q alpha -> R)
   -> (beta :e alpha -> PNoEq_ beta p q -> ~p beta -> R)
   -> R.

Axiom PNoLt_irref : forall alpha, forall p:set -> prop, ~PNoLt alpha p alpha p.

Axiom PNoLt_trichotomy_or : forall alpha beta, forall p q:set -> prop,
 ordinal alpha -> ordinal beta ->
 PNoLt alpha p beta q \/ alpha = beta /\ PNoEq_ alpha p q \/ PNoLt beta q alpha p.

Axiom PNoLtEq_tra : forall alpha beta, ordinal alpha -> ordinal beta -> forall p q r:set -> prop, PNoLt alpha p beta q -> PNoEq_ beta q r -> PNoLt alpha p beta r.

Axiom PNoEqLt_tra : forall alpha beta, ordinal alpha -> ordinal beta -> forall p q r:set -> prop, PNoEq_ alpha p q -> PNoLt alpha q beta r -> PNoLt alpha p beta r.

Axiom PNoLt_tra : forall alpha beta gamma, ordinal alpha -> ordinal beta -> ordinal gamma -> forall p q r:set -> prop, PNoLt alpha p beta q -> PNoLt beta q gamma r -> PNoLt alpha p gamma r.

Definition PNoLe : set -> (set -> prop) -> set -> (set -> prop) -> prop
   := fun alpha p beta q => PNoLt alpha p beta q \/ alpha = beta /\ PNoEq_ alpha p q.

Axiom PNoLeI1 : forall alpha beta, forall p q:set -> prop,
   PNoLt alpha p beta q -> PNoLe alpha p beta q.

Axiom PNoLeI2 : forall alpha, forall p q:set -> prop,
   PNoEq_ alpha p q -> PNoLe alpha p alpha q.

Axiom PNoLe_ref : forall alpha, forall p:set -> prop, PNoLe alpha p alpha p.

Axiom PNoLe_antisym : forall alpha beta, ordinal alpha -> ordinal beta ->
 forall p q:set -> prop,
 PNoLe alpha p beta q -> PNoLe beta q alpha p -> alpha = beta /\ PNoEq_ alpha p q.

Axiom PNoLtLe_tra : forall alpha beta gamma, ordinal alpha -> ordinal beta -> ordinal gamma -> forall p q r:set -> prop, PNoLt alpha p beta q -> PNoLe beta q gamma r -> PNoLt alpha p gamma r.

Axiom PNoLeLt_tra : forall alpha beta gamma, ordinal alpha -> ordinal beta -> ordinal gamma -> forall p q r:set -> prop, PNoLe alpha p beta q -> PNoLt beta q gamma r -> PNoLt alpha p gamma r.

Axiom PNoEqLe_tra : forall alpha beta, ordinal alpha -> ordinal beta -> forall p q r:set -> prop, PNoEq_ alpha p q -> PNoLe alpha q beta r -> PNoLe alpha p beta r.

Axiom PNoLe_tra : forall alpha beta gamma, ordinal alpha -> ordinal beta -> ordinal gamma -> forall p q r:set -> prop, PNoLe alpha p beta q -> PNoLe beta q gamma r -> PNoLe alpha p gamma r.

Definition PNo_downc : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
 := fun L alpha p => exists beta, ordinal beta /\ exists q:set -> prop, L beta q /\ PNoLe alpha p beta q.

Definition PNo_upc : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
 := fun R alpha p => exists beta, ordinal beta /\ exists q:set -> prop, R beta q /\ PNoLe beta q alpha p.

Axiom PNoLe_downc : forall L:set -> (set -> prop) -> prop, forall alpha beta, forall p q:set -> prop,
  ordinal alpha -> ordinal beta ->
  PNo_downc L alpha p -> PNoLe beta q alpha p -> PNo_downc L beta q.

Axiom PNo_downc_ref : forall L:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p:set -> prop, L alpha p -> PNo_downc L alpha p.

Axiom PNo_upc_ref : forall R:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p:set -> prop, R alpha p -> PNo_upc R alpha p.

Axiom PNoLe_upc : forall R:set -> (set -> prop) -> prop, forall alpha beta, forall p q:set -> prop,
  ordinal alpha -> ordinal beta ->
  PNo_upc R alpha p -> PNoLe alpha p beta q -> PNo_upc R beta q.

Definition PNoLt_pwise : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> prop
  := fun L R => forall gamma, ordinal gamma -> forall p:set -> prop, L gamma p -> forall delta, ordinal delta -> forall q:set -> prop, R delta q -> PNoLt gamma p delta q.

Axiom PNoLt_pwise_downc_upc : forall L R:set -> (set -> prop) -> prop,
    PNoLt_pwise L R -> PNoLt_pwise (PNo_downc L) (PNo_upc R).

Definition PNo_rel_strict_upperbd : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
  := fun L alpha p =>
       forall beta :e alpha, forall q:set -> prop, PNo_downc L beta q -> PNoLt beta q alpha p.

Definition PNo_rel_strict_lowerbd : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
  := fun R alpha p =>
       forall beta :e alpha, forall q:set -> prop, PNo_upc R beta q -> PNoLt alpha p beta q.

Definition PNo_rel_strict_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
  := fun L R alpha p => PNo_rel_strict_upperbd L alpha p /\ PNo_rel_strict_lowerbd R alpha p.

Axiom PNoEq_rel_strict_upperbd : forall L:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p q:set -> prop,
  PNoEq_ alpha p q -> PNo_rel_strict_upperbd L alpha p -> PNo_rel_strict_upperbd L alpha q.

Axiom PNo_rel_strict_upperbd_antimon : forall L:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p:set -> prop, forall beta :e alpha,
  PNo_rel_strict_upperbd L alpha p -> PNo_rel_strict_upperbd L beta p.

Axiom PNoEq_rel_strict_lowerbd : forall R:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p q:set -> prop,
  PNoEq_ alpha p q -> PNo_rel_strict_lowerbd R alpha p -> PNo_rel_strict_lowerbd R alpha q.

Axiom PNo_rel_strict_lowerbd_antimon : forall R:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p:set -> prop, forall beta :e alpha,
  PNo_rel_strict_lowerbd R alpha p -> PNo_rel_strict_lowerbd R beta p.

Axiom PNoEq_rel_strict_imv : forall L R:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p q:set -> prop,
  PNoEq_ alpha p q -> PNo_rel_strict_imv L R alpha p -> PNo_rel_strict_imv L R alpha q.

Axiom PNo_rel_strict_imv_antimon : forall L R:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p:set -> prop, forall beta :e alpha,
  PNo_rel_strict_imv L R alpha p -> PNo_rel_strict_imv L R beta p.

Definition PNo_rel_strict_uniq_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
  := fun L R alpha p => PNo_rel_strict_imv L R alpha p /\ forall q:set -> prop, PNo_rel_strict_imv L R alpha q -> PNoEq_ alpha p q.

Definition PNo_rel_strict_split_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
  := fun L R alpha p =>
         PNo_rel_strict_imv L R (ordsucc alpha) (fun delta => p delta /\ delta <> alpha)
      /\ PNo_rel_strict_imv L R (ordsucc alpha) (fun delta => p delta \/ delta = alpha).

Axiom PNo_extend0_eq : forall alpha, forall p:set -> prop, PNoEq_ alpha p (fun delta => p delta /\ delta <> alpha).

Axiom PNo_extend1_eq : forall alpha, forall p:set -> prop, PNoEq_ alpha p (fun delta => p delta \/ delta = alpha).

Axiom PNo_rel_imv_ex : forall L R:set -> (set -> prop) -> prop,
  PNoLt_pwise L R ->
  forall alpha, ordinal alpha ->
      (exists p:set -> prop, PNo_rel_strict_uniq_imv L R alpha p)
   \/ (exists tau :e alpha, exists p:set -> prop, PNo_rel_strict_split_imv L R tau p).

Definition PNo_lenbdd : set -> (set -> (set -> prop) -> prop) -> prop
  := fun alpha L => forall beta, forall p:set -> prop, L beta p -> beta :e alpha.

Axiom PNo_lenbdd_strict_imv_extend0 : forall L R:set -> (set -> prop) -> prop,
  forall alpha, ordinal alpha -> PNo_lenbdd alpha L -> PNo_lenbdd alpha R ->
  forall p:set -> prop,
  PNo_rel_strict_imv L R alpha p -> PNo_rel_strict_imv L R (ordsucc alpha) (fun delta => p delta /\ delta <> alpha).

Axiom PNo_lenbdd_strict_imv_extend1 : forall L R:set -> (set -> prop) -> prop,
  forall alpha, ordinal alpha -> PNo_lenbdd alpha L -> PNo_lenbdd alpha R ->
  forall p:set -> prop,
  PNo_rel_strict_imv L R alpha p -> PNo_rel_strict_imv L R (ordsucc alpha) (fun delta => p delta \/ delta = alpha).

Axiom PNo_lenbdd_strict_imv_split : forall L R:set -> (set -> prop) -> prop,
  forall alpha, ordinal alpha -> PNo_lenbdd alpha L -> PNo_lenbdd alpha R ->
  forall p:set -> prop,
  PNo_rel_strict_imv L R alpha p -> PNo_rel_strict_split_imv L R alpha p.

Axiom PNo_rel_imv_bdd_ex : forall L R:set -> (set -> prop) -> prop,
  PNoLt_pwise L R ->
  forall alpha, ordinal alpha
   -> PNo_lenbdd alpha L
   -> PNo_lenbdd alpha R
   -> exists beta :e ordsucc alpha,
      exists p:set -> prop, PNo_rel_strict_split_imv L R beta p.

Definition PNo_strict_upperbd : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
  := fun L alpha p =>
       forall beta, ordinal beta -> forall q:set -> prop, L beta q -> PNoLt beta q alpha p.

Definition PNo_strict_lowerbd : (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
  := fun R alpha p =>
       forall beta, ordinal beta -> forall q:set -> prop, R beta q -> PNoLt alpha p beta q.

Definition PNo_strict_imv : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
  := fun L R alpha p => PNo_strict_upperbd L alpha p /\ PNo_strict_lowerbd R alpha p.

Axiom PNoEq_strict_upperbd : forall L:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p q:set -> prop,
  PNoEq_ alpha p q -> PNo_strict_upperbd L alpha p -> PNo_strict_upperbd L alpha q.

Axiom PNoEq_strict_lowerbd : forall R:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p q:set -> prop,
  PNoEq_ alpha p q -> PNo_strict_lowerbd R alpha p -> PNo_strict_lowerbd R alpha q.

Axiom PNoEq_strict_imv : forall L R:set -> (set -> prop) -> prop, forall alpha, ordinal alpha -> forall p q:set -> prop,
  PNoEq_ alpha p q -> PNo_strict_imv L R alpha p -> PNo_strict_imv L R alpha q.

Axiom PNo_strict_upperbd_imp_rel_strict_upperbd : forall L:set -> (set -> prop) -> prop, forall alpha, ordinal alpha ->
  forall beta :e ordsucc alpha, forall p:set -> prop,
   PNo_strict_upperbd L alpha p -> PNo_rel_strict_upperbd L beta p.

Axiom PNo_strict_lowerbd_imp_rel_strict_lowerbd : forall R:set -> (set -> prop) -> prop, forall alpha, ordinal alpha ->
  forall beta :e ordsucc alpha, forall p:set -> prop,
   PNo_strict_lowerbd R alpha p -> PNo_rel_strict_lowerbd R beta p.

Axiom PNo_strict_imv_imp_rel_strict_imv : forall L R:set -> (set -> prop) -> prop, forall alpha, ordinal alpha ->
  forall beta :e ordsucc alpha, forall p:set -> prop,
   PNo_strict_imv L R alpha p -> PNo_rel_strict_imv L R beta p.

Axiom PNo_rel_split_imv_imp_strict_imv : forall L R:set -> (set -> prop) -> prop,
  forall alpha, ordinal alpha -> forall p:set -> prop,
       PNo_rel_strict_split_imv L R alpha p
    -> PNo_strict_imv L R alpha p.

Axiom PNo_lenbdd_strict_imv_ex : forall L R:set -> (set -> prop) -> prop,
  PNoLt_pwise L R ->
  forall alpha, ordinal alpha
   -> PNo_lenbdd alpha L
   -> PNo_lenbdd alpha R
   -> exists beta :e ordsucc alpha,
      exists p:set -> prop, PNo_strict_imv L R beta p.

Definition PNo_least_rep : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
  := fun L R beta p => ordinal beta
       /\ PNo_strict_imv L R beta p
       /\ forall gamma :e beta,
           forall q:set -> prop, ~PNo_strict_imv L R gamma q.

Definition PNo_least_rep2 : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> (set -> prop) -> prop
  := fun L R beta p => PNo_least_rep L R beta p /\ forall x, x /:e beta -> ~p x.

Axiom PNo_strict_imv_pred_eq : forall L R:set -> (set -> prop) -> prop,
  PNoLt_pwise L R ->
  forall alpha, ordinal alpha -> forall p q:set -> prop,
     PNo_least_rep L R alpha p
  -> PNo_strict_imv L R alpha q
  -> forall beta :e alpha, p beta <-> q beta.

Axiom PNo_lenbdd_least_rep2_exuniq2 : forall L R:set -> (set -> prop) -> prop,
  PNoLt_pwise L R ->
  forall alpha, ordinal alpha
   -> PNo_lenbdd alpha L
   -> PNo_lenbdd alpha R
   -> exists beta,
        (exists p:set -> prop, PNo_least_rep2 L R beta p)
     /\ (forall p q:set -> prop, PNo_least_rep2 L R beta p -> PNo_least_rep2 L R beta q -> p = q).

(* Parameter PNo_bd "1b39e85278dd9e820e7b6258957386ac55934d784aa3702c57a28ec807453b01" "ed76e76de9b58e621daa601cca73b4159a437ba0e73114924cb92ec8044f2aa2" *)
Parameter PNo_bd : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set.

(* Parameter PNo_pred "be07c39b18a3aa93f066f4c064fee3941ec27cfd07a4728b6209135c77ce5704" "b2d51dcfccb9527e9551b0d0c47d891c9031a1d4ee87bba5a9ae5215025d107a" *)
Parameter PNo_pred : (set -> (set -> prop) -> prop) -> (set -> (set -> prop) -> prop) -> set -> prop.

Axiom PNo_bd_pred_lem : forall L R:set -> (set -> prop) -> prop,
  PNoLt_pwise L R ->
  forall alpha, ordinal alpha
   -> PNo_lenbdd alpha L
   -> PNo_lenbdd alpha R
   -> PNo_least_rep2 L R (PNo_bd L R) (PNo_pred L R).

Axiom PNo_bd_pred : forall L R:set -> (set -> prop) -> prop,
  PNoLt_pwise L R ->
  forall alpha, ordinal alpha
   -> PNo_lenbdd alpha L
   -> PNo_lenbdd alpha R
   -> PNo_least_rep L R (PNo_bd L R) (PNo_pred L R).

Axiom PNo_bd_In : forall L R:set -> (set -> prop) -> prop,
  PNoLt_pwise L R ->
  forall alpha, ordinal alpha
   -> PNo_lenbdd alpha L
   -> PNo_lenbdd alpha R
   -> PNo_bd L R :e ordsucc alpha.

(** from Part 3 **)
Section TaggedSets.

Let tag : set -> set := fun alpha => SetAdjoin alpha {1}.
Postfix ' 100 := tag.

Axiom not_TransSet_Sing1 : ~TransSet {1}.

Axiom not_ordinal_Sing1 : ~ordinal {1}.

Axiom tagged_not_ordinal : forall y, ~ordinal (y ').

Axiom tagged_notin_ordinal : forall alpha y, ordinal alpha -> (y ') /:e alpha.

Axiom tagged_eqE_Subq : forall alpha beta, ordinal alpha -> alpha ' = beta ' -> alpha c= beta.

Axiom tagged_eqE_eq : forall alpha beta, ordinal alpha -> ordinal beta -> alpha ' = beta ' -> alpha = beta.

Axiom tagged_ReplE : forall alpha beta, ordinal alpha -> ordinal beta -> beta ' :e {gamma '|gamma :e alpha} -> beta :e alpha.

Axiom ordinal_notin_tagged_Repl : forall alpha Y, ordinal alpha -> alpha /:e {y '|y :e Y}.

Definition SNoElts_ : set -> set := fun alpha => alpha :\/: {beta '|beta :e alpha}.

Axiom SNoElts_mon : forall alpha beta, alpha c= beta -> SNoElts_ alpha c= SNoElts_ beta.

Definition SNo_ : set -> set -> prop := fun alpha x =>
    x c= SNoElts_ alpha
 /\ forall beta :e alpha, exactly1of2 (beta ' :e x) (beta :e x).

Definition PSNo : set -> (set -> prop) -> set :=
  fun alpha p => {beta :e alpha|p beta} :\/: {beta '|beta :e alpha, ~p beta}.

Axiom PNoEq_PSNo : forall alpha, ordinal alpha -> forall p:set -> prop, PNoEq_ alpha (fun beta => beta :e PSNo alpha p) p.

Axiom SNo_PSNo : forall alpha, ordinal alpha -> forall p:set -> prop, SNo_ alpha (PSNo alpha p).

Axiom SNo_PSNo_eta_ : forall alpha x, ordinal alpha -> SNo_ alpha x -> x = PSNo alpha (fun beta => beta :e x).

(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.

Axiom SNo_SNo : forall alpha, ordinal alpha -> forall z, SNo_ alpha z -> SNo z.

(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.

Axiom SNoLev_uniq_Subq : forall x alpha beta, ordinal alpha -> ordinal beta -> SNo_ alpha x -> SNo_ beta x -> alpha c= beta.

Axiom SNoLev_uniq : forall x alpha beta, ordinal alpha -> ordinal beta -> SNo_ alpha x -> SNo_ beta x -> alpha = beta.

Axiom SNoLev_prop : forall x, SNo x -> ordinal (SNoLev x) /\ SNo_ (SNoLev x) x.

Axiom SNoLev_ordinal : forall x, SNo x -> ordinal (SNoLev x).

Axiom SNoLev_ : forall x, SNo x -> SNo_ (SNoLev x) x.

Axiom SNo_PSNo_eta : forall x, SNo x -> x = PSNo (SNoLev x) (fun beta => beta :e x).

Axiom SNoLev_PSNo : forall alpha, ordinal alpha -> forall p:set -> prop, SNoLev (PSNo alpha p) = alpha.

Axiom SNo_Subq : forall x y, SNo x -> SNo y -> SNoLev x c= SNoLev y -> (forall alpha :e SNoLev x, alpha :e x <-> alpha :e y) -> x c= y.

Definition SNoEq_ : set -> set -> set -> prop
 := fun alpha x y => PNoEq_ alpha (fun beta => beta :e x) (fun beta => beta :e y).

Axiom SNoEq_I : forall alpha x y, (forall beta :e alpha, beta :e x <-> beta :e y) -> SNoEq_ alpha x y.

Axiom SNo_eq : forall x y, SNo x -> SNo y -> SNoLev x = SNoLev y -> SNoEq_ (SNoLev x) x y -> x = y.

End TaggedSets.

Definition SNoLt : set -> set -> prop :=
  fun x y => PNoLt (SNoLev x) (fun beta => beta :e x) (SNoLev y) (fun beta => beta :e y).

Infix < 490 := SNoLt.

Definition SNoLe : set -> set -> prop :=
  fun x y => PNoLe (SNoLev x) (fun beta => beta :e x) (SNoLev y) (fun beta => beta :e y).

(* Unicode <= "2264" *)
Infix <= 490 := SNoLe.

Axiom SNoLtLe : forall x y, x < y -> x <= y.

Axiom SNoLeE : forall x y, SNo x -> SNo y -> x <= y -> x < y \/ x = y.

Axiom SNoEq_sym_ : forall alpha x y, SNoEq_ alpha x y -> SNoEq_ alpha y x.

Axiom SNoEq_tra_ : forall alpha x y z, SNoEq_ alpha x y -> SNoEq_ alpha y z -> SNoEq_ alpha x z.

Axiom SNoLtE : forall x y, SNo x -> SNo y -> x < y ->
 forall p:prop,
    (forall z, SNo z -> SNoLev z :e SNoLev x :/\: SNoLev y -> SNoEq_ (SNoLev z) z x -> SNoEq_ (SNoLev z) z y -> x < z -> z < y -> SNoLev z /:e x -> SNoLev z :e y -> p)
 -> (SNoLev x :e SNoLev y -> SNoEq_ (SNoLev x) x y -> SNoLev x :e y -> p)
 -> (SNoLev y :e SNoLev x -> SNoEq_ (SNoLev y) x y -> SNoLev y /:e x -> p)
 -> p.

(** The analogous thm to PNoLtI1 can be recovered by SNoLt_tra (transitivity) and SNoLtI2 and SNoLtI3. **)

Axiom SNoLtI2 : forall x y,
     SNoLev x :e SNoLev y
  -> SNoEq_ (SNoLev x) x y
  -> SNoLev x :e y
  -> x < y.

Axiom SNoLtI3 : forall x y,
     SNoLev y :e SNoLev x
  -> SNoEq_ (SNoLev y) x y
  -> SNoLev y /:e x
  -> x < y.

Axiom SNoLt_irref : forall x, ~SNoLt x x.

Axiom SNoLt_trichotomy_or : forall x y, SNo x -> SNo y -> x < y \/ x = y \/ y < x.

Axiom SNoLt_trichotomy_or_impred : forall x y, SNo x -> SNo y ->
  forall p:prop,
      (x < y -> p)
   -> (x = y -> p)
   -> (y < x -> p)
   -> p.

Axiom SNoLt_tra : forall x y z, SNo x -> SNo y -> SNo z -> x < y -> y < z -> x < z.

Axiom SNoLe_ref : forall x, SNoLe x x.

Axiom SNoLe_antisym : forall x y, SNo x -> SNo y -> x <= y -> y <= x -> x = y.

Axiom SNoLtLe_tra : forall x y z, SNo x -> SNo y -> SNo z -> x < y -> y <= z -> x < z.

Axiom SNoLeLt_tra : forall x y z, SNo x -> SNo y -> SNo z -> x <= y -> y < z -> x < z.

Axiom SNoLe_tra : forall x y z, SNo x -> SNo y -> SNo z -> x <= y -> y <= z -> x <= z.

Axiom SNoLtLe_or : forall x y, SNo x -> SNo y -> x < y \/ y <= x.

Axiom SNoLt_PSNo_PNoLt : forall alpha beta, forall p q:set -> prop,
 ordinal alpha -> ordinal beta ->
 PSNo alpha p < PSNo beta q -> PNoLt alpha p beta q.

Axiom PNoLt_SNoLt_PSNo : forall alpha beta, forall p q:set -> prop,
 ordinal alpha -> ordinal beta ->
 PNoLt alpha p beta q -> PSNo alpha p < PSNo beta q.

Definition SNoCut : set -> set -> set :=
  fun L R => PSNo (PNo_bd (fun alpha p => ordinal alpha /\ PSNo alpha p :e L) (fun alpha p => ordinal alpha /\ PSNo alpha p :e R)) (PNo_pred (fun alpha p => ordinal alpha /\ PSNo alpha p :e L) (fun alpha p => ordinal alpha /\ PSNo alpha p :e R)).

Definition SNoCutP : set -> set -> prop :=
 fun L R =>
      (forall x :e L, SNo x)
   /\ (forall y :e R, SNo y)
   /\ (forall x :e L, forall y :e R, x < y).

Axiom SNoCutP_SNoCut : forall L R, SNoCutP L R
 -> SNo (SNoCut L R)
 /\ SNoLev (SNoCut L R) :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y)))
 /\ (forall x :e L, x < SNoCut L R)
 /\ (forall y :e R, SNoCut L R < y)
 /\ (forall z, SNo z -> (forall x :e L, x < z) -> (forall y :e R, z < y) -> SNoLev (SNoCut L R) c= SNoLev z /\ SNoEq_ (SNoLev (SNoCut L R)) (SNoCut L R) z).

Axiom SNoCutP_SNoCut_impred : forall L R, SNoCutP L R
 -> forall p:prop,
      (SNo (SNoCut L R)
    -> SNoLev (SNoCut L R) :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y)))
    -> (forall x :e L, x < SNoCut L R)
    -> (forall y :e R, SNoCut L R < y)
    -> (forall z, SNo z -> (forall x :e L, x < z) -> (forall y :e R, z < y) -> SNoLev (SNoCut L R) c= SNoLev z /\ SNoEq_ (SNoLev (SNoCut L R)) (SNoCut L R) z)
    -> p)
   -> p.

Axiom SNoCutP_L_0: forall L, (forall x :e L, SNo x) -> SNoCutP L 0.

Axiom SNoCutP_0_R: forall R, (forall x :e R, SNo x) -> SNoCutP 0 R.

Axiom SNoCutP_0_0: SNoCutP 0 0.

Definition SNoS_ : set -> set := fun alpha => {x :e Power (SNoElts_ alpha)|exists beta :e alpha, SNo_ beta x}.

Axiom SNoS_E : forall alpha, ordinal alpha -> forall x :e SNoS_ alpha, exists beta :e alpha, SNo_ beta x.

Section TaggedSets2.

Let tag : set -> set := fun alpha => SetAdjoin alpha {1}.
Postfix ' 100 := tag.

Axiom SNoS_I : forall alpha, ordinal alpha -> forall x, forall beta :e alpha, SNo_ beta x -> x :e SNoS_ alpha.

Axiom SNoS_I2 : forall x y, SNo x -> SNo y -> SNoLev x :e SNoLev y -> x :e SNoS_ (SNoLev y).
 

Axiom SNoS_Subq : forall alpha beta, ordinal alpha -> ordinal beta -> alpha c= beta -> SNoS_ alpha c= SNoS_ beta.

Axiom SNoLev_uniq2 : forall alpha, ordinal alpha -> forall x, SNo_ alpha x -> SNoLev x = alpha.

Axiom SNoS_E2 : forall alpha, ordinal alpha -> forall x :e SNoS_ alpha,
 forall p:prop,
     (SNoLev x :e alpha -> ordinal (SNoLev x) -> SNo x -> SNo_ (SNoLev x) x -> p)
  -> p.

Axiom SNoS_In_neq : forall w, SNo w -> forall x :e SNoS_ (SNoLev w), x <> w.

Axiom SNoS_SNoLev : forall z, SNo z -> z :e SNoS_ (ordsucc (SNoLev z)).

Definition SNoL : set -> set := fun z => {x :e SNoS_ (SNoLev z) | x < z}.
Definition SNoR : set -> set := fun z => {y :e SNoS_ (SNoLev z) | z < y}.

Axiom SNoCutP_SNoL_SNoR: forall z, SNo z -> SNoCutP (SNoL z) (SNoR z).

Axiom SNoL_E : forall x, SNo x -> forall w :e SNoL x,
  forall p:prop,
       (SNo w -> SNoLev w :e SNoLev x -> w < x -> p)
    -> p.

Axiom SNoR_E : forall x, SNo x -> forall z :e SNoR x,
  forall p:prop,
       (SNo z -> SNoLev z :e SNoLev x -> x < z -> p)
    -> p.

Axiom SNoL_SNoS_ : forall z, SNoL z c= SNoS_ (SNoLev z).

Axiom SNoR_SNoS_ : forall z, SNoR z c= SNoS_ (SNoLev z).

Axiom SNoL_SNoS : forall x, SNo x -> forall w :e SNoL x, w :e SNoS_ (SNoLev x).

Axiom SNoR_SNoS : forall x, SNo x -> forall z :e SNoR x, z :e SNoS_ (SNoLev x).

Axiom SNoL_I : forall z, SNo z -> forall x, SNo x -> SNoLev x :e SNoLev z -> x < z -> x :e SNoL z.

Axiom SNoR_I : forall z, SNo z -> forall y, SNo y -> SNoLev y :e SNoLev z -> z < y -> y :e SNoR z.

Axiom SNo_eta : forall z, SNo z -> z = SNoCut (SNoL z) (SNoR z).

Axiom SNoCutP_SNo_SNoCut : forall L R, SNoCutP L R -> SNo (SNoCut L R).

Axiom SNoCutP_SNoCut_L : forall L R, SNoCutP L R -> forall x :e L, x < SNoCut L R.

Axiom SNoCutP_SNoCut_R : forall L R, SNoCutP L R -> forall y :e R, SNoCut L R < y.

Axiom SNoCutP_SNoCut_fst : forall L R, SNoCutP L R ->
 forall z, SNo z
   -> (forall x :e L, x < z)
   -> (forall y :e R, z < y)
   -> SNoLev (SNoCut L R) c= SNoLev z
   /\ SNoEq_ (SNoLev (SNoCut L R)) (SNoCut L R) z.

Axiom SNoCut_Le : forall L1 R1 L2 R2, SNoCutP L1 R1 -> SNoCutP L2 R2
  -> (forall w :e L1, w < SNoCut L2 R2)
  -> (forall z :e R2, SNoCut L1 R1 < z)
  -> SNoCut L1 R1 <= SNoCut L2 R2.

Axiom SNoCut_ext : forall L1 R1 L2 R2, SNoCutP L1 R1 -> SNoCutP L2 R2
  -> (forall w :e L1, w < SNoCut L2 R2)
  -> (forall z :e R1, SNoCut L2 R2 < z)
  -> (forall w :e L2, w < SNoCut L1 R1)
  -> (forall z :e R2, SNoCut L1 R1 < z)
  -> SNoCut L1 R1 = SNoCut L2 R2.

Axiom SNoLt_SNoL_or_SNoR_impred: forall x y, SNo x -> SNo y -> x < y ->
 forall p:prop,
    (forall z :e SNoL y, z :e SNoR x -> p)
 -> (x :e SNoL y -> p)
 -> (y :e SNoR x -> p)
 -> p.

Axiom SNoL_or_SNoR_impred: forall x y, SNo x -> SNo y ->
 forall p:prop,
    (x = y -> p)
 -> (forall z :e SNoL y, z :e SNoR x -> p)
 -> (x :e SNoL y -> p)
 -> (y :e SNoR x -> p)
 -> (forall z :e SNoR y, z :e SNoL x -> p)
 -> (x :e SNoR y -> p)
 -> (y :e SNoL x -> p)
 -> p.

Axiom ordinal_SNo_ : forall alpha, ordinal alpha -> SNo_ alpha alpha.

Axiom ordinal_SNo : forall alpha, ordinal alpha -> SNo alpha.

Axiom ordinal_SNoLev : forall alpha, ordinal alpha -> SNoLev alpha = alpha.

Axiom ordinal_SNoLev_max : forall alpha, ordinal alpha -> forall z, SNo z -> SNoLev z :e alpha -> z < alpha.

Axiom ordinal_SNoL : forall alpha, ordinal alpha -> SNoL alpha = SNoS_ alpha.

Axiom ordinal_SNoR : forall alpha, ordinal alpha -> SNoR alpha = Empty.

Axiom nat_p_SNo: forall n, nat_p n -> SNo n.

Axiom omega_SNo: forall n :e omega, SNo n.

Axiom omega_SNoS_omega : omega c= SNoS_ omega.

Axiom ordinal_In_SNoLt : forall alpha, ordinal alpha -> forall beta :e alpha, beta < alpha.

Axiom ordinal_SNoLev_max_2 : forall alpha, ordinal alpha -> forall z, SNo z -> SNoLev z :e ordsucc alpha -> z <= alpha.

Axiom ordinal_Subq_SNoLe : forall alpha beta, ordinal alpha -> ordinal beta -> alpha c= beta -> alpha <= beta.

Axiom ordinal_SNoLt_In : forall alpha beta, ordinal alpha -> ordinal beta -> alpha < beta -> alpha :e beta.

Axiom omega_nonneg : forall m :e omega, 0 <= m.

Axiom SNo_0 : SNo 0.

Axiom SNo_1 : SNo 1.

Axiom SNo_2 : SNo 2.

Axiom SNoLev_0 : SNoLev 0 = 0.

Axiom SNoCut_0_0: SNoCut 0 0 = 0.

Axiom SNoL_0 : SNoL 0 = 0.

Axiom SNoR_0 : SNoR 0 = 0.

Axiom SNoL_1 : SNoL 1 = 1.

Axiom SNoR_1 : SNoR 1 = 0.

Axiom SNo_max_SNoLev : forall x, SNo x -> (forall y :e SNoS_ (SNoLev x), y < x) -> SNoLev x = x.

Axiom SNo_max_ordinal : forall x, SNo x -> (forall y :e SNoS_ (SNoLev x), y < x) -> ordinal x.

Axiom pos_low_eq_one : forall x, SNo x -> 0 < x -> SNoLev x c= 1 -> x = 1.

Definition SNo_extend0 : set -> set := fun x => PSNo (ordsucc (SNoLev x)) (fun delta => delta :e x /\ delta <> SNoLev x).

Definition SNo_extend1 : set -> set := fun x => PSNo (ordsucc (SNoLev x)) (fun delta => delta :e x \/ delta = SNoLev x).

Axiom SNo_extend0_SNo_ : forall x, SNo x -> SNo_ (ordsucc (SNoLev x)) (SNo_extend0 x).

Axiom SNo_extend1_SNo_ : forall x, SNo x -> SNo_ (ordsucc (SNoLev x)) (SNo_extend1 x).

Axiom SNo_extend0_SNo : forall x, SNo x -> SNo (SNo_extend0 x).

Axiom SNo_extend1_SNo : forall x, SNo x -> SNo (SNo_extend1 x).

Axiom SNo_extend0_SNoLev : forall x, SNo x -> SNoLev (SNo_extend0 x) = ordsucc (SNoLev x).

Axiom SNo_extend1_SNoLev : forall x, SNo x -> SNoLev (SNo_extend1 x) = ordsucc (SNoLev x).

Axiom SNo_extend0_nIn : forall x, SNo x -> SNoLev x /:e SNo_extend0 x.

Axiom SNo_extend1_In : forall x, SNo x -> SNoLev x :e SNo_extend1 x.

Axiom SNo_extend0_SNoEq : forall x, SNo x -> SNoEq_ (SNoLev x) (SNo_extend0 x) x.

Axiom SNo_extend1_SNoEq : forall x, SNo x -> SNoEq_ (SNoLev x) (SNo_extend1 x) x.

Axiom SNoLev_0_eq_0 : forall x, SNo x -> SNoLev x = 0 -> x = 0.

(** eps_ n is the Surreal Number 1/2^n, without needing to define division or exponents first **)
Definition eps_ : set -> set := fun n => {0} :\/: {(ordsucc m) ' | m :e n}.

Axiom eps_ordinal_In_eq_0 : forall n alpha, ordinal alpha -> alpha :e eps_ n -> alpha = 0.

Axiom eps_0_1 : eps_ 0 = 1.

Axiom SNo__eps_ : forall n :e omega, SNo_ (ordsucc n) (eps_ n).

Axiom SNo_eps_ : forall n :e omega, SNo (eps_ n).

Axiom SNo_eps_1 : SNo (eps_ 1).

Axiom SNoLev_eps_ : forall n :e omega, SNoLev (eps_ n) = ordsucc n.

Axiom SNo_eps_SNoS_omega : forall n :e omega, eps_ n :e SNoS_ omega.

Axiom SNo_eps_decr : forall n :e omega, forall m :e n, eps_ n < eps_ m.

Axiom SNo_eps_pos : forall n :e omega, 0 < eps_ n.

Axiom SNo_pos_eps_Lt : forall n, nat_p n -> forall x :e SNoS_ (ordsucc n), 0 < x -> eps_ n < x.

Axiom SNo_pos_eps_Le : forall n, nat_p n -> forall x :e SNoS_ (ordsucc (ordsucc n)), 0 < x -> eps_ n <= x.

Axiom eps_SNo_eq : forall n, nat_p n -> forall x :e SNoS_ (ordsucc n), 0 < x -> SNoEq_ (SNoLev x) (eps_ n) x -> exists m :e n, x = eps_ m.

Axiom eps_SNoCutP : forall n :e omega, SNoCutP {0} {eps_ m|m :e n}.

Axiom eps_SNoCut : forall n :e omega, eps_ n = SNoCut {0} {eps_ m|m :e n}.

End TaggedSets2.

Axiom SNo_etaE : forall z, SNo z ->
  forall p:prop,
     (forall L R, SNoCutP L R
       -> (forall x :e L, SNoLev x :e SNoLev z)
       -> (forall y :e R, SNoLev y :e SNoLev z)
       -> z = SNoCut L R
       -> p)
   -> p.

(*** surreal induction ***)
Axiom SNo_ind : forall P:set -> prop,
  (forall L R, SNoCutP L R
   -> (forall x :e L, P x)
   -> (forall y :e R, P y)
   -> P (SNoCut L R))
 -> forall z, SNo z -> P z.

(*** surreal recursion ***)
Section SurrealRecI.

Variable F:set -> (set -> set) -> set.

Let default : set := Eps_i (fun _ => True).
Let G : set -> (set -> set -> set) -> set -> set
  := fun alpha g =>
       If_ii
          (ordinal alpha)
          (fun z:set => if z :e SNoS_ (ordsucc alpha) then
                           F z (fun w => g (SNoLev w) w)
                        else
                           default)
          (fun z:set => default).

(* Parameter SNo_rec_i "352082c509ab97c1757375f37a2ac62ed806c7b39944c98161720a584364bfaf" "be45dfaed6c479503a967f3834400c4fd18a8a567c8887787251ed89579f7be3" *)
Parameter SNo_rec_i : set -> set.

Hypothesis Fr: forall z, SNo z ->
   forall g h:set -> set, (forall w :e SNoS_ (SNoLev z), g w = h w)
     -> F z g = F z h.

Axiom SNo_rec_i_eq : forall z, SNo z -> SNo_rec_i z = F z SNo_rec_i.

End SurrealRecI.

Section SurrealRecII.

Variable F:set -> (set -> (set -> set)) -> (set -> set).
Let default : (set -> set) := Descr_ii (fun _ => True).
Let G : set -> (set -> set -> (set -> set)) -> set -> (set -> set)
  := fun alpha g =>
       If_iii
          (ordinal alpha)
          (fun z:set => If_ii (z :e SNoS_ (ordsucc alpha))
                              (F z (fun w => g (SNoLev w) w))
                              default)
          (fun z:set => default).

(* Parameter SNo_rec_ii "030b1b3db48f720b8db18b1192717cad8f204fff5fff81201b9a2414f5036417" "e148e62186e718374accb69cda703e3440725cca8832aed55c0b32731f7401ab" *)
Parameter SNo_rec_ii : set -> (set -> set).

Hypothesis Fr: forall z, SNo z ->
   forall g h:set -> (set -> set), (forall w :e SNoS_ (SNoLev z), g w = h w)
     -> F z g = F z h.

Axiom SNo_rec_ii_eq : forall z, SNo z -> SNo_rec_ii z = F z SNo_rec_ii.

End SurrealRecII.

Section SurrealRec2.

Variable F:set -> set -> (set -> set -> set) -> set.

Let G:set -> (set -> set -> set) -> set -> (set -> set) -> set
  := fun w f z g => F w z (fun x y => if x = w then g y else f x y).

Let H:set -> (set -> set -> set) -> set -> set
  := fun w f z => if SNo z then SNo_rec_i (G w f) z else Empty.

(* Parameter SNo_rec2 "9c6267051fa817eed39b404ea37e7913b3571fe071763da2ebc1baa56b4b77f5" "7d10ab58310ebefb7f8bf63883310aa10fc2535f53bb48db513a868bc02ec028" *)
Parameter SNo_rec2 : set -> set -> set.

Hypothesis Fr: forall w, SNo w -> forall z, SNo z ->
   forall g h:set -> set -> set,
        (forall x :e SNoS_ (SNoLev w), forall y, SNo y -> g x y = h x y)
     -> (forall y :e SNoS_ (SNoLev z), g w y = h w y)
     -> F w z g = F w z h.

Axiom SNo_rec2_G_prop : forall w, SNo w -> forall f k:set -> set -> set,
    (forall x :e SNoS_ (SNoLev w), f x = k x)
 -> forall z, SNo z ->
    forall g h:set -> set, (forall u :e SNoS_ (SNoLev z), g u = h u)
 -> G w f z g = G w k z h.

Axiom SNo_rec2_eq_1 : forall w, SNo w -> forall f:set -> set -> set,
  forall z, SNo z ->
   SNo_rec_i (G w f) z = G w f z (SNo_rec_i (G w f)).

Axiom SNo_rec2_eq : forall w, SNo w -> forall z, SNo z ->
   SNo_rec2 w z = F w z SNo_rec2.

End SurrealRec2.

Axiom SNo_ordinal_ind : forall P:set -> prop,
  (forall alpha, ordinal alpha -> forall x :e SNoS_ alpha, P x)
  ->
  (forall x, SNo x -> P x).

Axiom SNo_ordinal_ind2 : forall P:set -> set -> prop,
  (forall alpha, ordinal alpha ->
   forall beta, ordinal beta ->
   forall x :e SNoS_ alpha, forall y :e SNoS_ beta, P x y)
  ->
  (forall x y, SNo x -> SNo y -> P x y).

Axiom SNo_ordinal_ind3 : forall P:set -> set -> set -> prop,
  (forall alpha, ordinal alpha ->
   forall beta, ordinal beta ->
   forall gamma, ordinal gamma ->
   forall x :e SNoS_ alpha, forall y :e SNoS_ beta, forall z :e SNoS_ gamma, P x y z)
  ->
  (forall x y z, SNo x -> SNo y -> SNo z -> P x y z).

Axiom SNoLev_ind : forall P:set -> prop,
  (forall x, SNo x -> (forall w :e SNoS_ (SNoLev x), P w) -> P x)
  ->
  (forall x, SNo x -> P x).

Axiom SNoLev_ind2 : forall P:set -> set -> prop,
  (forall x y, SNo x -> SNo y
    -> (forall w :e SNoS_ (SNoLev x), P w y)
    -> (forall z :e SNoS_ (SNoLev y), P x z)
    -> (forall w :e SNoS_ (SNoLev x), forall z :e SNoS_ (SNoLev y), P w z)
    -> P x y)
-> forall x y, SNo x -> SNo y -> P x y.

Axiom SNoLev_ind3 : forall P:set -> set -> set -> prop,
  (forall x y z, SNo x -> SNo y -> SNo z
    -> (forall u :e SNoS_ (SNoLev x), P u y z)
    -> (forall v :e SNoS_ (SNoLev y), P x v z)
    -> (forall w :e SNoS_ (SNoLev z), P x y w)
    -> (forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), P u v z)
    -> (forall u :e SNoS_ (SNoLev x), forall w :e SNoS_ (SNoLev z), P u y w)
    -> (forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), P x v w)
    -> (forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), P u v w)
    -> P x y z)
 -> forall x y z, SNo x -> SNo y -> SNo z -> P x y z.

Axiom SNo_omega : SNo omega.

Axiom SNoLt_0_1 : 0 < 1.

Axiom SNoLt_0_2 : 0 < 2.

Axiom SNoLt_1_2 : 1 < 2.

Axiom restr_SNo_ : forall x, SNo x -> forall alpha :e SNoLev x, SNo_ alpha (x :/\: SNoElts_ alpha).

Axiom restr_SNo : forall x, SNo x -> forall alpha :e SNoLev x, SNo (x :/\: SNoElts_ alpha).

Axiom restr_SNoLev : forall x, SNo x -> forall alpha :e SNoLev x, SNoLev (x :/\: SNoElts_ alpha) = alpha.

Axiom restr_SNoEq : forall x, SNo x -> forall alpha :e SNoLev x, SNoEq_ alpha (x :/\: SNoElts_ alpha) x.

Axiom SNo_extend0_restr_eq : forall x, SNo x -> x = SNo_extend0 x :/\: SNoElts_ (SNoLev x).

Axiom SNo_extend1_restr_eq : forall x, SNo x -> x = SNo_extend1 x :/\: SNoElts_ (SNoLev x).

(** from Part 4 **)

Section SurrealMinus.

(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.

Prefix - 358 := minus_SNo.

(* Unicode <= "2264" *)
Infix <= 490 := SNoLe.

Axiom minus_SNo_eq : forall x, SNo x -> - x = SNoCut {- z|z :e SNoR x} {- w|w :e SNoL x}.

Axiom minus_SNo_prop1 : forall x, SNo x -> SNo (- x) /\ (forall u :e SNoL x, - x < - u) /\ (forall u :e SNoR x, - u < - x) /\ SNoCutP {- z|z :e SNoR x} {- w|w :e SNoL x}.

Axiom SNo_minus_SNo : forall x, SNo x -> SNo (- x).

Axiom minus_SNo_Lt_contra : forall x y, SNo x -> SNo y -> x < y -> - y < - x.

Axiom minus_SNo_Le_contra : forall x y, SNo x -> SNo y -> x <= y -> - y <= - x.

Axiom minus_SNo_SNoCutP : forall x, SNo x -> SNoCutP {- z|z :e SNoR x} {- w|w :e SNoL x}.

Axiom minus_SNo_SNoCutP_gen : forall L R, SNoCutP L R -> SNoCutP {- z|z :e R} {- w|w :e L}.

Axiom minus_SNo_Lev_lem1 : forall alpha, ordinal alpha -> forall x :e SNoS_ alpha, SNoLev (- x) c= SNoLev x.

Axiom minus_SNo_Lev_lem2 : forall x, SNo x -> SNoLev (- x) c= SNoLev x.

Axiom minus_SNo_invol : forall x, SNo x -> - - x = x.

Axiom minus_SNo_Lev : forall x, SNo x -> SNoLev (- x) = SNoLev x.

Axiom minus_SNo_SNo_ : forall alpha, ordinal alpha -> forall x, SNo_ alpha x -> SNo_ alpha (- x).

Axiom minus_SNo_SNoS_ : forall alpha, ordinal alpha -> forall x, x :e SNoS_ alpha -> - x :e SNoS_ alpha.

Axiom minus_SNoCut_eq_lem : forall v, SNo v -> forall L R, SNoCutP L R -> v = SNoCut L R -> - v = SNoCut {- z|z :e R} {- w|w :e L}.

Axiom minus_SNoCut_eq : forall L R, SNoCutP L R -> - SNoCut L R = SNoCut {- z|z :e R} {- w|w :e L}.

Axiom minus_SNo_Lt_contra1 : forall x y, SNo x -> SNo y -> -x < y -> - y < x.

Axiom minus_SNo_Lt_contra2 : forall x y, SNo x -> SNo y -> x < -y -> y < - x.

Axiom mordinal_SNoLev_min_2 : forall alpha, ordinal alpha -> forall z, SNo z -> SNoLev z :e ordsucc alpha -> - alpha <= z.

Axiom minus_SNo_SNoS_omega : forall x :e SNoS_ omega, - x :e SNoS_ omega.

Axiom SNoL_minus_SNoR: forall x, SNo x -> SNoL (- x) = {- w|w :e SNoR x}.

End SurrealMinus.

(** from Part 5 **)
Section SurrealAdd.

Prefix - 358 := minus_SNo.

(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.

Infix + 360 right := add_SNo.

Axiom add_SNo_eq : forall x, SNo x -> forall y, SNo y ->
    x + y = SNoCut ({w + y|w :e SNoL x} :\/: {x + w|w :e SNoL y}) ({z + y|z :e SNoR x} :\/: {x + z|z :e SNoR y}).

Axiom add_SNo_prop1 : forall x y, SNo x -> SNo y ->
    SNo (x + y)
 /\ (forall u :e SNoL x, u + y < x + y)
 /\ (forall u :e SNoR x, x + y < u + y)
 /\ (forall u :e SNoL y, x + u < x + y)
 /\ (forall u :e SNoR y, x + y < x + u)
 /\ SNoCutP ({w + y|w :e SNoL x} :\/: {x + w|w :e SNoL y}) ({z + y|z :e SNoR x} :\/: {x + z|z :e SNoR y}).

Axiom SNo_add_SNo : forall x y, SNo x -> SNo y -> SNo (x + y).

Axiom SNo_add_SNo_3 : forall x y z, SNo x -> SNo y -> SNo z -> SNo (x + y + z).

Axiom SNo_add_SNo_3c : forall x y z, SNo x -> SNo y -> SNo z -> SNo (x + y + - z).

Axiom SNo_add_SNo_4 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> SNo (x + y + z + w).

Axiom add_SNo_Lt1 : forall x y z, SNo x -> SNo y -> SNo z -> x < z -> x + y < z + y.

Axiom add_SNo_Le1 : forall x y z, SNo x -> SNo y -> SNo z -> x <= z -> x + y <= z + y.

Axiom add_SNo_Lt2 : forall x y z, SNo x -> SNo y -> SNo z -> y < z -> x + y < x + z.

Axiom add_SNo_Le2 : forall x y z, SNo x -> SNo y -> SNo z -> y <= z -> x + y <= x + z.

Axiom add_SNo_Lt3a : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> x < z -> y <= w -> x + y < z + w.

Axiom add_SNo_Lt3b : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> x <= z -> y < w -> x + y < z + w.

Axiom add_SNo_Lt3 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> x < z -> y < w -> x + y < z + w.

Axiom add_SNo_Le3 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> x <= z -> y <= w -> x + y <= z + w.

Axiom add_SNo_SNoCutP : forall x y, SNo x -> SNo y -> SNoCutP ({w + y|w :e SNoL x} :\/: {x + w|w :e SNoL y}) ({z + y|z :e SNoR x} :\/: {x + z|z :e SNoR y}).

Axiom add_SNo_com : forall x y, SNo x -> SNo y -> x + y = y + x.

Axiom add_SNo_0L : forall x, SNo x -> 0 + x = x.

Axiom add_SNo_0R : forall x, SNo x -> x + 0 = x.

Axiom add_SNo_minus_SNo_linv : forall x, SNo x -> -x+x = 0.

Axiom add_SNo_minus_SNo_rinv : forall x, SNo x -> x + -x = 0.

Axiom add_SNo_ordinal_SNoCutP : forall alpha, ordinal alpha -> forall beta, ordinal beta -> SNoCutP ({x + beta | x :e SNoS_ alpha} :\/: {alpha + x | x :e SNoS_ beta}) Empty.

Axiom add_SNo_ordinal_eq : forall alpha, ordinal alpha -> forall beta, ordinal beta -> alpha + beta = SNoCut ({x + beta | x :e SNoS_ alpha} :\/: {alpha + x | x :e SNoS_ beta}) Empty.

Axiom add_SNo_ordinal_ordinal : forall alpha, ordinal alpha -> forall beta, ordinal beta -> ordinal (alpha + beta).

Axiom add_SNo_ordinal_SL : forall alpha, ordinal alpha -> forall beta, ordinal beta -> ordsucc alpha + beta = ordsucc (alpha + beta).

Axiom add_SNo_ordinal_SR : forall alpha, ordinal alpha -> forall beta, ordinal beta -> alpha + ordsucc beta = ordsucc (alpha + beta).

Axiom add_SNo_ordinal_InL : forall alpha, ordinal alpha -> forall beta, ordinal beta -> forall gamma :e alpha, gamma + beta :e alpha + beta.

Axiom add_SNo_ordinal_InR : forall alpha, ordinal alpha -> forall beta, ordinal beta -> forall gamma :e beta, alpha + gamma :e alpha + beta.

Axiom add_nat_add_SNo : forall n m :e omega, add_nat n m = n + m.

Axiom add_SNo_In_omega : forall n m :e omega, n + m :e omega.

Axiom add_SNo_1_1_2 : 1 + 1 = 2.

Axiom add_SNo_SNoL_interpolate : forall x y, SNo x -> SNo y -> forall u :e SNoL (x + y), (exists v :e SNoL x, u <= v + y) \/ (exists v :e SNoL y, u <= x + v).

Axiom add_SNo_SNoR_interpolate : forall x y, SNo x -> SNo y -> forall u :e SNoR (x + y), (exists v :e SNoR x, v + y <= u) \/ (exists v :e SNoR y, x + v <= u).

Axiom add_SNo_assoc : forall x y z, SNo x -> SNo y -> SNo z -> x + (y + z) = (x + y) + z.

Axiom add_SNo_cancel_L : forall x y z, SNo x -> SNo y -> SNo z -> x + y = x + z -> y = z.

Axiom minus_SNo_0 : - 0 = 0.

Axiom minus_add_SNo_distr : forall x y, SNo x -> SNo y -> -(x+y) = (-x) + (-y).

Axiom minus_add_SNo_distr_3 : forall x y z, SNo x -> SNo y -> SNo z -> -(x + y + z) = -x + - y + -z.

Axiom add_SNo_Lev_bd : forall x y, SNo x -> SNo y -> SNoLev (x + y) c= SNoLev x + SNoLev y.

Axiom add_SNo_SNoS_omega : forall x y :e SNoS_ omega, x + y :e SNoS_ omega.

Axiom add_SNo_minus_R2 : forall x y, SNo x -> SNo y -> (x + y) + - y = x.

Axiom add_SNo_minus_R2' : forall x y, SNo x -> SNo y -> (x + - y) + y = x.

Axiom add_SNo_minus_L2 : forall x y, SNo x -> SNo y -> - x + (x + y) = y.

Axiom add_SNo_minus_L2' : forall x y, SNo x -> SNo y -> x + (- x + y) = y.

Axiom add_SNo_Lt1_cancel : forall x y z, SNo x -> SNo y -> SNo z -> x + y < z + y -> x < z.

Axiom add_SNo_Lt2_cancel : forall x y z, SNo x -> SNo y -> SNo z -> x + y < x + z -> y < z.

Axiom add_SNo_assoc_4 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w
  -> x + y + z + w = (x + y + z) + w.

Axiom add_SNo_com_3_0_1 : forall x y z, SNo x -> SNo y -> SNo z
  -> x + y + z = y + x + z.

Axiom add_SNo_com_3b_1_2 : forall x y z, SNo x -> SNo y -> SNo z
  -> (x + y) + z = (x + z) + y.

Axiom add_SNo_com_4_inner_mid : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w
  -> (x + y) + (z + w) = (x + z) + (y + w).

Axiom add_SNo_rotate_3_1 : forall x y z, SNo x -> SNo y -> SNo z ->
  x + y + z = z + x + y.

Axiom add_SNo_rotate_4_1 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w ->
  x + y + z + w = w + x + y + z.

Axiom add_SNo_rotate_5_1 : forall x y z w v, SNo x -> SNo y -> SNo z -> SNo w -> SNo v ->
  x + y + z + w + v = v + x + y + z + w.

Axiom add_SNo_rotate_5_2 : forall x y z w v, SNo x -> SNo y -> SNo z -> SNo w -> SNo v ->
  x + y + z + w + v = w + v + x + y + z.

Axiom add_SNo_minus_SNo_prop3 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> (x + y + z) + (- z + w) = x + y + w.

Axiom add_SNo_minus_SNo_prop4 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> (x + y + z) + (w + - z) = x + y + w.

Axiom add_SNo_minus_SNo_prop5 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> (x + y + - z) + (z + w) = x + y + w.

Axiom add_SNo_minus_Lt1 : forall x y z, SNo x -> SNo y -> SNo z -> x + - y < z -> x < z + y.

Axiom add_SNo_minus_Lt2 : forall x y z, SNo x -> SNo y -> SNo z -> z < x + - y -> z + y < x.

Axiom add_SNo_minus_Lt1b : forall x y z, SNo x -> SNo y -> SNo z -> x < z + y -> x + - y < z.

Axiom add_SNo_minus_Lt2b : forall x y z, SNo x -> SNo y -> SNo z -> z + y < x -> z < x + - y.

Axiom add_SNo_minus_Lt1b3 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> x + y < w + z -> x + y + - z < w.

Axiom add_SNo_minus_Lt2b3 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> w + z < x + y -> w < x + y + - z.

Axiom add_SNo_minus_Lt_lem : forall x y z u v w, SNo x -> SNo y -> SNo z -> SNo u -> SNo v -> SNo w ->
  x + y + w < u + v + z ->
  x + y + - z < u + v + - w.

Axiom add_SNo_minus_Le2 : forall x y z, SNo x -> SNo y -> SNo z -> z <= x + - y -> z + y <= x.

Axiom add_SNo_minus_Le2b : forall x y z, SNo x -> SNo y -> SNo z -> z + y <= x -> z <= x + - y.

Axiom add_SNo_Lt_subprop2 : forall x y z w u v, SNo x -> SNo y -> SNo z -> SNo w -> SNo u -> SNo v
  -> x + u < z + v
  -> y + v < w + u
  -> x + y < z + w.

Axiom add_SNo_Lt_subprop3a : forall x y z w u a, SNo x -> SNo y -> SNo z -> SNo w -> SNo u -> SNo a
  -> x + z < w + a
  -> y + a < u
  -> x + y + z < w + u.

Axiom add_SNo_Lt_subprop3b : forall x y w u v a, SNo x -> SNo y -> SNo w -> SNo u -> SNo v -> SNo a
  -> x + a < w + v
  -> y < a + u
  -> x + y < w + u + v.

Axiom add_SNo_Lt_subprop3c : forall x y z w u a b c, SNo x -> SNo y -> SNo z -> SNo w -> SNo u -> SNo a -> SNo b -> SNo c
 -> x + a < b + c
 -> y + c < u
 -> b + z < w + a
 -> x + y + z < w + u.

Axiom add_SNo_Lt_subprop3d : forall x y w u v a b c, SNo x -> SNo y -> SNo w -> SNo u -> SNo v -> SNo a -> SNo b -> SNo c
 -> x + a < b + v
 -> y < c + u
 -> b + c < w + a
 -> x + y < w + u + v.

Axiom ordinal_ordsucc_SNo_eq : forall alpha, ordinal alpha -> ordsucc alpha = 1 + alpha.

Axiom add_SNo_3a_2b: forall x y z w u, SNo x -> SNo y -> SNo z -> SNo w -> SNo u
 -> (x + y + z) + (w + u) = (u + y + z) + (w + x).

Axiom add_SNo_1_ordsucc : forall n :e omega, n + 1 = ordsucc n.

Axiom add_SNo_eps_Lt : forall x, SNo x -> forall n :e omega, x < x + eps_ n.

Axiom add_SNo_eps_Lt' : forall x y, SNo x -> SNo y -> forall n :e omega, x < y -> x < y + eps_ n.

Axiom SNoLt_minus_pos : forall x y, SNo x -> SNo y -> x < y -> 0 < y + - x.

Axiom add_SNo_omega_In_cases: forall m, forall n :e omega, forall k, nat_p k -> m :e n + k -> m :e n \/ m + - n :e k.

Axiom add_SNo_Lt4 : forall x y z w u v, SNo x -> SNo y -> SNo z -> SNo w -> SNo u -> SNo v -> x < w -> y < u -> z < v -> x + y + z < w + u + v.

Axiom add_SNo_3_3_3_Lt1 : forall x y z w u, SNo x -> SNo y -> SNo z -> SNo w -> SNo u ->
  x + y < z + w -> x + y + u < z + w + u.

Axiom add_SNo_3_2_3_Lt1 : forall x y z w u, SNo x -> SNo y -> SNo z -> SNo w -> SNo u ->
  y + x < z + w -> x + u + y < z + w + u.

End SurrealAdd.

(** from Part 6 **)

Section SurrealMul.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.

(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Definition mul_SNo : set -> set -> set
  := SNo_rec2
      (fun x y m =>
        SNoCut ({m (w 0) y + m x (w 1) + - m (w 0) (w 1)|w :e SNoL x :*: SNoL y}
                  :\/:
                {m (z 0) y + m x (z 1) + - m (z 0) (z 1)|z :e SNoR x :*: SNoR y})
               ({m (w 0) y + m x (w 1) + - m (w 0) (w 1)|w :e SNoL x :*: SNoR y}
                  :\/:
                {m (z 0) y + m x (z 1) + - m (z 0) (z 1)|z :e SNoR x :*: SNoL y})).

Infix * 355 right := mul_SNo.

Axiom mul_SNo_eq : forall x, SNo x -> forall y, SNo y ->
   x * y
      = SNoCut ({(w 0) * y + x * (w 1) + - (w 0) * (w 1)|w :e SNoL x :*: SNoL y}
                  :\/:
                {(z 0) * y + x * (z 1) + - (z 0) * (z 1)|z :e SNoR x :*: SNoR y})
               ({(w 0) * y + x * (w 1) + - (w 0) * (w 1)|w :e SNoL x :*: SNoR y}
                  :\/:
                {(z 0) * y + x * (z 1) + - (z 0) * (z 1)|z :e SNoR x :*: SNoL y}).

Axiom mul_SNo_eq_2 : forall x y, SNo x -> SNo y ->
  forall p:prop,
    (forall L R,
         (forall u, u :e L ->
           (forall q:prop,
                (forall w0 :e SNoL x, forall w1 :e SNoL y, u = w0 * y + x * w1 + - w0 * w1 -> q)
             -> (forall z0 :e SNoR x, forall z1 :e SNoR y, u = z0 * y + x * z1 + - z0 * z1 -> q)
             -> q))
      -> (forall w0 :e SNoL x, forall w1 :e SNoL y, w0 * y + x * w1 + - w0 * w1 :e L)
      -> (forall z0 :e SNoR x, forall z1 :e SNoR y, z0 * y + x * z1 + - z0 * z1 :e L)
      -> (forall u, u :e R ->
           (forall q:prop,
                (forall w0 :e SNoL x, forall z1 :e SNoR y, u = w0 * y + x * z1 + - w0 * z1 -> q)
             -> (forall z0 :e SNoR x, forall w1 :e SNoL y, u = z0 * y + x * w1 + - z0 * w1 -> q)
             -> q))
      -> (forall w0 :e SNoL x, forall z1 :e SNoR y, w0 * y + x * z1 + - w0 * z1 :e R)
      -> (forall z0 :e SNoR x, forall w1 :e SNoL y, z0 * y + x * w1 + - z0 * w1 :e R)
      -> x * y = SNoCut L R
      -> p)
   -> p.

Axiom mul_SNo_prop_1 : forall x, SNo x -> forall y, SNo y ->
 forall p:prop,
    (SNo (x * y)
  -> (forall u :e SNoL x, forall v :e SNoL y, u * y + x * v < x * y + u * v)
  -> (forall u :e SNoR x, forall v :e SNoR y, u * y + x * v < x * y + u * v)
  -> (forall u :e SNoL x, forall v :e SNoR y, x * y + u * v < u * y + x * v)
  -> (forall u :e SNoR x, forall v :e SNoL y, x * y + u * v < u * y + x * v)
  -> p)
 -> p.

Axiom SNo_mul_SNo : forall x y, SNo x -> SNo y -> SNo (x * y).

Axiom SNo_mul_SNo_lem : forall x y u v, SNo x -> SNo y -> SNo u -> SNo v -> SNo (u * y + x * v + - (u * v)).

Axiom SNo_mul_SNo_3 : forall x y z, SNo x -> SNo y -> SNo z -> SNo (x * y * z).

Axiom mul_SNo_eq_3 : forall x y, SNo x -> SNo y ->
  forall p:prop,
    (forall L R, SNoCutP L R
       -> (forall u, u :e L ->
           (forall q:prop,
                (forall w0 :e SNoL x, forall w1 :e SNoL y, u = w0 * y + x * w1 + - w0 * w1 -> q)
             -> (forall z0 :e SNoR x, forall z1 :e SNoR y, u = z0 * y + x * z1 + - z0 * z1 -> q)
             -> q))
      -> (forall w0 :e SNoL x, forall w1 :e SNoL y, w0 * y + x * w1 + - w0 * w1 :e L)
      -> (forall z0 :e SNoR x, forall z1 :e SNoR y, z0 * y + x * z1 + - z0 * z1 :e L)
      -> (forall u, u :e R ->
           (forall q:prop,
                (forall w0 :e SNoL x, forall z1 :e SNoR y, u = w0 * y + x * z1 + - w0 * z1 -> q)
             -> (forall z0 :e SNoR x, forall w1 :e SNoL y, u = z0 * y + x * w1 + - z0 * w1 -> q)
             -> q))
      -> (forall w0 :e SNoL x, forall z1 :e SNoR y, w0 * y + x * z1 + - w0 * z1 :e R)
      -> (forall z0 :e SNoR x, forall w1 :e SNoL y, z0 * y + x * w1 + - z0 * w1 :e R)
      -> x * y = SNoCut L R
      -> p)
   -> p.

Axiom mul_SNo_Lt : forall x y u v, SNo x -> SNo y -> SNo u -> SNo v
 -> u < x -> v < y -> u * y + x * v < x * y + u * v.

Axiom mul_SNo_Le : forall x y u v, SNo x -> SNo y -> SNo u -> SNo v
 -> u <= x -> v <= y -> u * y + x * v <= x * y + u * v.

Axiom mul_SNo_SNoL_interpolate : forall x y, SNo x -> SNo y -> forall u :e SNoL (x * y),
 (exists v :e SNoL x, exists w :e SNoL y, u + v * w <= v * y + x * w)
 \/
 (exists v :e SNoR x, exists w :e SNoR y, u + v * w <= v * y + x * w).

Axiom mul_SNo_SNoL_interpolate_impred : forall x y, SNo x -> SNo y -> forall u :e SNoL (x * y),
 forall p:prop,
      (forall v :e SNoL x, forall w :e SNoL y, u + v * w <= v * y + x * w -> p)
   -> (forall v :e SNoR x, forall w :e SNoR y, u + v * w <= v * y + x * w -> p)
   -> p.
 

Axiom mul_SNo_SNoR_interpolate : forall x y, SNo x -> SNo y -> forall u :e SNoR (x * y),
 (exists v :e SNoL x, exists w :e SNoR y, v * y + x * w <= u + v * w)
 \/
 (exists v :e SNoR x, exists w :e SNoL y, v * y + x * w <= u + v * w).

Axiom mul_SNo_SNoR_interpolate_impred : forall x y, SNo x -> SNo y -> forall u :e SNoR (x * y),
 forall p:prop,
     (forall v :e SNoL x, forall w :e SNoR y, v * y + x * w <= u + v * w -> p)
  -> (forall v :e SNoR x, forall w :e SNoL y, v * y + x * w <= u + v * w -> p)
  -> p.

(** This could be useful for proving L c= L', L = L', R c= R' or R = R'
    when corresponding conditions hold. **)
Axiom mul_SNo_Subq_lem : forall x y X Y Z W,
  forall U U',
      (forall u, u :e U ->
         (forall q:prop,
                (forall w0 :e X, forall w1 :e Y, u = w0 * y + x * w1 + - w0 * w1 -> q)
             -> (forall z0 :e Z, forall z1 :e W, u = z0 * y + x * z1 + - z0 * z1 -> q)
             -> q))
   -> (forall w0 :e X, forall w1 :e Y, w0 * y + x * w1 + - w0 * w1 :e U')
   -> (forall w0 :e Z, forall w1 :e W, w0 * y + x * w1 + - w0 * w1 :e U')
   -> U c= U'.

(** Part of Conway Chapter 2 Thm 7 **)
Axiom mul_SNo_zeroR : forall x, SNo x -> x * 0 = 0.

Axiom mul_SNo_oneR : forall x, SNo x -> x * 1 = x.

Axiom mul_SNo_com : forall x y, SNo x -> SNo y -> x * y = y * x.

Axiom mul_SNo_minus_distrL : forall x y, SNo x -> SNo y -> (- x) * y = - x * y.

Axiom mul_SNo_minus_distrR: forall x y, SNo x -> SNo y -> x * (- y) = - (x * y).

Axiom mul_SNo_distrR : forall x y z, SNo x -> SNo y -> SNo z
  -> (x + y) * z = x * z + y * z.

Axiom mul_SNo_distrL : forall x y z, SNo x -> SNo y -> SNo z
  -> x * (y + z) = x * y + x * z.

Section mul_SNo_assoc_lems.

Variable M:set -> set -> set.
Infix * 355 right := M.

Hypothesis SNo_M : forall x y, SNo x -> SNo y -> SNo (x * y).

Hypothesis DL: forall x y z, SNo x -> SNo y -> SNo z -> x * (y + z) = x * y + x * z.
Hypothesis DR: forall x y z, SNo x -> SNo y -> SNo z -> (x + y) * z = x * z + y * z.
Hypothesis IL: forall x y, SNo x -> SNo y -> forall u :e SNoL (x * y),
 forall p:prop,
      (forall v :e SNoL x, forall w :e SNoL y, u + v * w <= v * y + x * w -> p)
   -> (forall v :e SNoR x, forall w :e SNoR y, u + v * w <= v * y + x * w -> p)
   -> p.
Hypothesis IR: forall x y, SNo x -> SNo y -> forall u :e SNoR (x * y),
 forall p:prop,
     (forall v :e SNoL x, forall w :e SNoR y, v * y + x * w <= u + v * w -> p)
  -> (forall v :e SNoR x, forall w :e SNoL y, v * y + x * w <= u + v * w -> p)
  -> p.

Hypothesis M_Lt: forall x y u v, SNo x -> SNo y -> SNo u -> SNo v
 -> u < x -> v < y -> u * y + x * v < x * y + u * v.
Hypothesis M_Le: forall x y u v, SNo x -> SNo y -> SNo u -> SNo v
 -> u <= x -> v <= y -> u * y + x * v <= x * y + u * v.

Axiom mul_SNo_assoc_lem1 : forall x y z, SNo x -> SNo y -> SNo z
 -> (forall u :e SNoS_ (SNoLev x), u * (y * z) = (u * y) * z)
 -> (forall v :e SNoS_ (SNoLev y), x * (v * z) = (x * v) * z)
 -> (forall w :e SNoS_ (SNoLev z), x * (y * w) = (x * y) * w)
 -> (forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), u * (v * z) = (u * v) * z)
 -> (forall u :e SNoS_ (SNoLev x), forall w :e SNoS_ (SNoLev z), u * (y * w) = (u * y) * w)
 -> (forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), x * (v * w) = (x * v) * w)
 -> (forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), u * (v * w) = (u * v) * w)
 -> forall L,
    (forall u :e L,
     forall q:prop,
         (forall v :e SNoL x, forall w :e SNoL (y * z), u = v * (y * z) + x * w + - v * w -> q)
      -> (forall v :e SNoR x, forall w :e SNoR (y * z), u = v * (y * z) + x * w + - v * w -> q)
      -> q)
 -> forall u :e L, u < (x * y) * z.

Axiom mul_SNo_assoc_lem2 : forall x y z, SNo x -> SNo y -> SNo z
 -> (forall u :e SNoS_ (SNoLev x), u * (y * z) = (u * y) * z)
 -> (forall v :e SNoS_ (SNoLev y), x * (v * z) = (x * v) * z)
 -> (forall w :e SNoS_ (SNoLev z), x * (y * w) = (x * y) * w)
 -> (forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), u * (v * z) = (u * v) * z)
 -> (forall u :e SNoS_ (SNoLev x), forall w :e SNoS_ (SNoLev z), u * (y * w) = (u * y) * w)
 -> (forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), x * (v * w) = (x * v) * w)
 -> (forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), u * (v * w) = (u * v) * w)
 -> forall R,
    (forall u :e R,
     forall q:prop,
         (forall v :e SNoL x, forall w :e SNoR (y * z), u = v * (y * z) + x * w + - v * w -> q)
      -> (forall v :e SNoR x, forall w :e SNoL (y * z), u = v * (y * z) + x * w + - v * w -> q)
      -> q)
 -> forall u :e R, (x * y) * z < u.

End mul_SNo_assoc_lems.

Axiom mul_SNo_assoc : forall x y z, SNo x -> SNo y -> SNo z
  -> x * (y * z) = (x * y) * z.

Axiom mul_nat_mul_SNo : forall n m :e omega, mul_nat n m = n * m.

Axiom mul_SNo_In_omega : forall n m :e omega, n * m :e omega.

Axiom mul_SNo_zeroL : forall x, SNo x -> 0 * x = 0.

Axiom mul_SNo_oneL : forall x, SNo x -> 1 * x = x.

Axiom pos_mul_SNo_Lt : forall x y z, SNo x -> 0 < x -> SNo y -> SNo z -> y < z -> x * y < x * z.

Axiom nonneg_mul_SNo_Le : forall x y z, SNo x -> 0 <= x -> SNo y -> SNo z -> y <= z -> x * y <= x * z.

Axiom neg_mul_SNo_Lt : forall x y z, SNo x -> x < 0 -> SNo y -> SNo z -> z < y -> x * y < x * z.

Axiom pos_mul_SNo_Lt' : forall x y z, SNo x -> SNo y -> SNo z -> 0 < z -> x < y -> x * z < y * z.

Axiom mul_SNo_Lt1_pos_Lt : forall x y, SNo x -> SNo y -> x < 1 -> 0 < y -> x * y < y.

Axiom nonneg_mul_SNo_Le' : forall x y z, SNo x -> SNo y -> SNo z -> 0 <= z -> x <= y -> x * z <= y * z.

Axiom mul_SNo_Le1_nonneg_Le : forall x y, SNo x -> SNo y -> x <= 1 -> 0 <= y -> x * y <= y.

Axiom pos_mul_SNo_Lt2 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> 0 < x -> 0 < y -> x < z -> y < w -> x * y < z * w.

Axiom nonneg_mul_SNo_Le2 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> 0 <= x -> 0 <= y -> x <= z -> y <= w -> x * y <= z * w.

Axiom mul_SNo_pos_pos: forall x y, SNo x -> SNo y -> 0 < x -> 0 < y -> 0 < x * y.

Axiom mul_SNo_pos_neg: forall x y, SNo x -> SNo y -> 0 < x -> y < 0 -> x * y < 0.

Axiom mul_SNo_neg_pos: forall x y, SNo x -> SNo y -> x < 0 -> 0 < y -> x * y < 0.

Axiom mul_SNo_neg_neg: forall x y, SNo x -> SNo y -> x < 0 -> y < 0 -> 0 < x * y.

Axiom SNo_sqr_nonneg : forall x, SNo x -> 0 <= x * x.

Axiom SNo_zero_or_sqr_pos : forall x, SNo x -> x = 0 \/ 0 < x * x.

Axiom SNo_foil: forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> (x + y) * (z + w) = x * z + x * w + y * z + y * w.

Axiom mul_SNo_minus_minus: forall x y, SNo x -> SNo y -> (- x) * (- y) = x * y.

Axiom mul_SNo_com_3_0_1 : forall x y z, SNo x -> SNo y -> SNo z
  -> x * y * z = y * x * z.

Axiom mul_SNo_com_3b_1_2 : forall x y z, SNo x -> SNo y -> SNo z
  -> (x * y) * z = (x * z) * y.

Axiom mul_SNo_com_4_inner_mid : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w
  -> (x * y) * (z * w) = (x * z) * (y * w).

Axiom mul_SNo_rotate_3_1 : forall x y z, SNo x -> SNo y -> SNo z ->
  x * y * z = z * x * y.

Axiom mul_SNo_rotate_4_1 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w ->
  x * y * z * w = w * x * y * z.

Axiom SNo_foil_mm: forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> (x + - y) * (z + - w) = x * z + - x * w + - y * z + y * w.

Axiom mul_SNo_nonzero_cancel: forall x y z, SNo x -> x <> 0 -> SNo y -> SNo z -> x * y = x * z -> y = z.

End SurrealMul.

Section SurrealExp.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.

Definition exp_SNo_nat : set->set->set := fun n m:set => nat_primrec 1 (fun _ r => n * r) m.

Infix ^ 342 right := exp_SNo_nat.

Axiom exp_SNo_nat_0 : forall x, SNo x -> x ^ 0 = 1.

Axiom exp_SNo_nat_S : forall x, SNo x -> forall n, nat_p n -> x ^ (ordsucc n) = x * x ^ n.

Axiom SNo_exp_SNo_nat : forall x, SNo x -> forall n, nat_p n -> SNo (x ^ n).

Axiom nat_exp_SNo_nat : forall x, nat_p x -> forall n, nat_p n -> nat_p (x ^ n).

Axiom eps_ordsucc_half_add : forall n, nat_p n -> eps_ (ordsucc n) + eps_ (ordsucc n) = eps_ n.

Axiom eps_1_half_eq1 : eps_ 1 + eps_ 1 = 1.

Axiom eps_1_half_eq2 : 2 * eps_ 1 = 1.

Axiom double_eps_1 : forall x y z, SNo x -> SNo y -> SNo z -> x + x = y + z -> x = eps_ 1 * (y + z).

Axiom exp_SNo_1_bd: forall x, SNo x -> 1 <= x -> forall n, nat_p n -> 1 <= x ^ n.

Axiom exp_SNo_2_bd: forall n, nat_p n -> n < 2 ^ n.

Axiom mul_SNo_eps_power_2: forall n, nat_p n -> eps_ n * 2 ^ n = 1.

Axiom eps_bd_1 : forall n :e omega, eps_ n <= 1.

Axiom mul_SNo_eps_power_2': forall n, nat_p n -> 2 ^ n * eps_ n = 1.

Axiom exp_SNo_nat_mul_add : forall x, SNo x -> forall m, nat_p m -> forall n, nat_p n -> x ^ m * x ^ n = x ^ (m + n).

Axiom exp_SNo_nat_mul_add' : forall x, SNo x -> forall m n :e omega, x ^ m * x ^ n = x ^ (m + n).

Axiom exp_SNo_nat_pos : forall x, SNo x -> 0 < x -> forall n, nat_p n -> 0 < x ^ n.

Axiom mul_SNo_eps_eps_add_SNo: forall m n :e omega, eps_ m * eps_ n = eps_ (m + n).

Axiom SNoS_omega_Lev_equip : forall n, nat_p n -> equip {x :e SNoS_ omega|SNoLev x = n} (2 ^ n).

Axiom SNoS_finite : forall n :e omega, finite (SNoS_ n).

Axiom SNoS_omega_SNoL_finite : forall x :e SNoS_ omega, finite (SNoL x).

Axiom SNoS_omega_SNoR_finite : forall x :e SNoS_ omega, finite (SNoR x).

End SurrealExp.

(** from Part 7 **)
Section Int.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.

(* Parameter int "f7cd39d139f71b389f61d3cf639bf341d01dac1be60ad65b40ee3aa5218e0043" "90ee851305d1ba4b80424ec6e2760ebabb1fd3e399fcb5c6b5c814d898138c16" *)
Parameter int : set.

Axiom int_SNo_cases : forall p:set -> prop,
    (forall n :e omega, p n)
 -> (forall n :e omega, p (- n))
 -> forall x :e int, p x.

Axiom int_3_cases: forall n :e int, forall p:prop,
    (forall m :e omega, n = - ordsucc m -> p)
 -> (n = 0 -> p)
 -> (forall m :e omega, n = ordsucc m -> p)
 -> p.

Axiom int_SNo : forall x :e int, SNo x.

Axiom Subq_omega_int : omega c= int.

Axiom int_minus_SNo_omega : forall n :e omega, - n :e int.

Axiom int_add_SNo_lem: forall n :e omega, forall m, nat_p m -> - n + m :e int.

Axiom int_add_SNo: forall x y :e int, x + y :e int.

Axiom int_minus_SNo: forall x :e int, - x :e int.

Axiom int_mul_SNo: forall x y :e int, x * y :e int.

End Int.

Section SurrealAbs.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.

(* Parameter abs_SNo "9f9389c36823b2e0124a7fe367eb786d080772b5171a5d059b10c47361cef0ef" "34f6dccfd6f62ca020248cdfbd473fcb15d8d9c5c55d1ec7c5ab6284006ff40f" *)
Definition abs_SNo : set -> set := fun x => if 0 <= x then x else - x.

Axiom nonneg_abs_SNo : forall x, 0 <= x -> abs_SNo x = x.

Axiom not_nonneg_abs_SNo : forall x, ~(0 <= x) -> abs_SNo x = - x.

Axiom abs_SNo_0 : abs_SNo 0 = 0.

Axiom pos_abs_SNo : forall x, 0 < x -> abs_SNo x = x.

Axiom neg_abs_SNo : forall x, SNo x -> x < 0 -> abs_SNo x = - x.

Axiom SNo_abs_SNo : forall x, SNo x -> SNo (abs_SNo x).

Axiom abs_SNo_Lev : forall x, SNo x -> SNoLev (abs_SNo x) = SNoLev x.

Axiom abs_SNo_minus: forall x, SNo x -> abs_SNo (- x) = abs_SNo x.

Axiom abs_SNo_dist_swap: forall x y, SNo x -> SNo y -> abs_SNo (x + - y) = abs_SNo (y + - x).

Axiom SNo_triangle: forall x y, SNo x -> SNo y -> abs_SNo (x + y) <= abs_SNo x + abs_SNo y.

Axiom SNo_triangle2: forall x y z, SNo x -> SNo y -> SNo z -> abs_SNo (x + - z) <= abs_SNo (x + - y) + abs_SNo (y + - z).

End SurrealAbs.

Section SNoMaxMin.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix ^ 342 right := exp_SNo_nat.
Infix < 490 := SNoLt.
(* Unicode <= "2264" *)
Infix <= 490 := SNoLe.

Definition SNo_max_of : set -> set -> prop := fun X x => x :e X /\ SNo x /\ forall y :e X, SNo y -> y <= x.
Definition SNo_min_of : set -> set -> prop := fun X x => x :e X /\ SNo x /\ forall y :e X, SNo y -> x <= y.

Axiom minus_SNo_max_min : forall X y, (forall x :e X, SNo x) -> SNo_max_of X y -> SNo_min_of {- x|x :e X} (- y).

Axiom minus_SNo_max_min' : forall X y, (forall x :e X, SNo x) -> SNo_max_of {- x|x :e X} y -> SNo_min_of X (- y).

Axiom minus_SNo_min_max : forall X y, (forall x :e X, SNo x) -> SNo_min_of X y -> SNo_max_of {- x|x :e X} (- y).

Axiom double_SNo_max_1 : forall x y, SNo x -> SNo_max_of (SNoL x) y -> forall z, SNo z -> x < z -> y + z < x + x -> exists w :e SNoR z, y + w = x + x.

Axiom double_SNo_min_1 : forall x y, SNo x -> SNo_min_of (SNoR x) y -> forall z, SNo z -> z < x -> x + x < y + z -> exists w :e SNoL z, y + w = x + x.

Axiom finite_max_exists : forall X, (forall x :e X, SNo x) -> finite X -> X <> 0 -> exists x, SNo_max_of X x.

Axiom finite_min_exists : forall X, (forall x :e X, SNo x) -> finite X -> X <> 0 -> exists x, SNo_min_of X x.

Axiom SNoS_omega_SNoL_max_exists : forall x :e SNoS_ omega, SNoL x = 0 \/ exists y, SNo_max_of (SNoL x) y.

Axiom SNoS_omega_SNoR_min_exists : forall x :e SNoS_ omega, SNoR x = 0 \/ exists y, SNo_min_of (SNoR x) y.

End SNoMaxMin.

Section DiadicRationals.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix < 490 := SNoLt.
(* Unicode <= "2264" *)
Infix <= 490 := SNoLe.

Infix ^ 342 right := exp_SNo_nat.

Axiom nonneg_diadic_rational_p_SNoS_omega: forall k :e omega, forall n, nat_p n -> eps_ k * n :e SNoS_ omega.

Definition diadic_rational_p : set -> prop := fun x => exists k :e omega, exists m :e int, x = eps_ k * m.

Axiom diadic_rational_p_SNoS_omega: forall x, diadic_rational_p x -> x :e SNoS_ omega.

Axiom int_diadic_rational_p : forall m :e int, diadic_rational_p m.

Axiom omega_diadic_rational_p : forall m :e omega, diadic_rational_p m.

Axiom eps_diadic_rational_p : forall k :e omega, diadic_rational_p (eps_ k).

Axiom minus_SNo_diadic_rational_p : forall x, diadic_rational_p x -> diadic_rational_p (- x).

Axiom mul_SNo_diadic_rational_p : forall x y, diadic_rational_p x -> diadic_rational_p y -> diadic_rational_p (x * y).

Axiom add_SNo_diadic_rational_p : forall x y, diadic_rational_p x -> diadic_rational_p y -> diadic_rational_p (x + y).

Axiom SNoS_omega_diadic_rational_p_lem: forall n, nat_p n -> forall x, SNo x -> SNoLev x = n -> diadic_rational_p x.

Axiom SNoS_omega_diadic_rational_p: forall x :e SNoS_ omega, diadic_rational_p x.

Axiom mul_SNo_SNoS_omega : forall x y :e SNoS_ omega, x * y :e SNoS_ omega.

End DiadicRationals.

(** from Part 8 **)

Section SurrealDiv.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix < 490 := SNoLt.
(* Unicode <= "2264" *)
Infix <= 490 := SNoLe.
Infix ^ 342 right := exp_SNo_nat.

Definition SNoL_pos : set -> set := fun x => {w :e SNoL x|0 < w}.

Axiom SNo_recip_pos_pos: forall x xi, SNo x -> SNo xi -> 0 < x -> x * xi = 1 -> 0 < xi.

Axiom SNo_recip_lem1: forall x x' x'i y y', SNo x -> 0 < x -> x' :e SNoL_pos x -> SNo x'i -> x' * x'i = 1 -> SNo y -> x * y < 1 -> SNo y' -> 1 + - x * y' = (1 + - x * y) * (x' + - x) * x'i -> 1 < x * y'.

Axiom SNo_recip_lem2: forall x x' x'i y y', SNo x -> 0 < x -> x' :e SNoL_pos x -> SNo x'i -> x' * x'i = 1 -> SNo y -> 1 < x * y -> SNo y' -> 1 + - x * y' = (1 + - x * y) * (x' + - x) * x'i -> x * y' < 1.

Axiom SNo_recip_lem3: forall x x' x'i y y', SNo x -> 0 < x -> x' :e SNoR x -> SNo x'i -> x' * x'i = 1 -> SNo y -> x * y < 1 -> SNo y' -> 1 + - x * y' = (1 + - x * y) * (x' + - x) * x'i -> x * y' < 1.

Axiom SNo_recip_lem4: forall x x' x'i y y', SNo x -> 0 < x -> x' :e SNoR x -> SNo x'i -> x' * x'i = 1 -> SNo y -> 1 < x * y -> SNo y' -> 1 + - x * y' = (1 + - x * y) * (x' + - x) * x'i -> 1 < x * y'.

Definition SNo_recipauxset : set -> set -> set -> (set -> set) -> set := fun Y x X g => \/_ y :e Y, {(1 + (x' + - x) * y) * g x'|x' :e X}.

Axiom SNo_recipauxset_I: forall Y x X, forall g:set -> set,
 forall y :e Y, forall x' :e X, (1 + (x' + - x) * y) * g x' :e SNo_recipauxset Y x X g.

Axiom SNo_recipauxset_E : forall Y x X, forall g:set -> set, forall z :e SNo_recipauxset Y x X g, forall p:prop, (forall y :e Y, forall x' :e X, z = (1 + (x' + - x) * y) * g x' -> p) -> p.

Axiom SNo_recipauxset_ext: forall Y x X, forall g h:set -> set, (forall x' :e X, g x' = h x') -> SNo_recipauxset Y x X g = SNo_recipauxset Y x X h.

Definition SNo_recipaux : set -> (set -> set) -> set -> set :=
 fun x g =>
  nat_primrec ({0},0)
   (fun k p => (p 0 :\/: SNo_recipauxset (p 0) x (SNoR x) g
                    :\/: SNo_recipauxset (p 1) x (SNoL_pos x) g,
                p 1 :\/: SNo_recipauxset (p 0) x (SNoL_pos x) g
                    :\/: SNo_recipauxset (p 1) x (SNoR x) g)).

Axiom SNo_recipaux_0: forall x, forall g:set -> set, SNo_recipaux x g 0 = ({0},0).

Axiom SNo_recipaux_S: forall x, forall g:set -> set, forall n, nat_p n ->
   SNo_recipaux x g (ordsucc n)
 = (SNo_recipaux x g n 0 :\/: SNo_recipauxset (SNo_recipaux x g n 0) x (SNoR x) g
        :\/: SNo_recipauxset (SNo_recipaux x g n 1) x (SNoL_pos x) g,
    SNo_recipaux x g n 1 :\/: SNo_recipauxset (SNo_recipaux x g n 0) x (SNoL_pos x) g
        :\/: SNo_recipauxset (SNo_recipaux x g n 1) x (SNoR x) g).

Axiom SNo_recipaux_lem1: forall x, SNo x -> 0 < x ->
 forall g:set -> set,
    (forall x' :e SNoS_ (SNoLev x), 0 < x' -> SNo (g x') /\ x' * g x' = 1)
 -> forall k, nat_p k ->
         (forall y :e SNo_recipaux x g k 0, SNo y /\ x * y < 1)
      /\ (forall y :e SNo_recipaux x g k 1, SNo y /\ 1 < x * y).

Axiom SNo_recipaux_lem2: forall x, SNo x -> 0 < x ->
 forall g:set -> set,
    (forall x' :e SNoS_ (SNoLev x), 0 < x' -> SNo (g x') /\ x' * g x' = 1)
 -> SNoCutP (\/_ k :e omega, SNo_recipaux x g k 0) (\/_ k :e omega, SNo_recipaux x g k 1).

Axiom SNo_recipaux_ext: forall x, SNo x -> forall g h:set -> set, (forall x' :e SNoS_ (SNoLev x), g x' = h x') -> forall k, nat_p k -> SNo_recipaux x g k = SNo_recipaux x h k.

Section recip_SNo_pos.

Let G : set -> (set -> set) -> set := fun x g => SNoCut (\/_ k :e omega, SNo_recipaux x g k 0) (\/_ k :e omega, SNo_recipaux x g k 1).

Definition recip_SNo_pos : set -> set := SNo_rec_i G.

Axiom recip_SNo_pos_eq: forall x, SNo x -> recip_SNo_pos x = G x recip_SNo_pos.

Axiom recip_SNo_pos_prop1: forall x, SNo x -> 0 < x -> SNo (recip_SNo_pos x) /\ x * recip_SNo_pos x = 1.

Axiom SNo_recip_SNo_pos: forall x, SNo x -> 0 < x -> SNo (recip_SNo_pos x).

Axiom recip_SNo_pos_invR: forall x, SNo x -> 0 < x -> x * recip_SNo_pos x = 1.

Axiom recip_SNo_pos_1: recip_SNo_pos 1 = 1.

Axiom recip_SNo_pos_is_pos: forall x, SNo x -> 0 < x -> 0 < recip_SNo_pos x.

Axiom recip_SNo_pos_invol: forall x, SNo x -> 0 < x -> recip_SNo_pos (recip_SNo_pos x) = x.

Axiom recip_SNo_pos_eps_: forall n, nat_p n -> recip_SNo_pos (eps_ n) = 2 ^ n.

Axiom recip_SNo_pos_pow_2: forall n, nat_p n -> recip_SNo_pos (2 ^ n) = eps_ n.

Axiom exp_SNo_nat_1: forall x, SNo x -> x ^ 1 = x.

Axiom recip_SNo_pos_2: recip_SNo_pos 2 = eps_ 1.

End recip_SNo_pos.

Definition recip_SNo : set -> set := fun x => if 0 < x then recip_SNo_pos x else if x < 0 then - recip_SNo_pos (- x) else 0.

Axiom recip_SNo_poscase: forall x, 0 < x -> recip_SNo x = recip_SNo_pos x.

Axiom recip_SNo_negcase: forall x, SNo x -> x < 0 -> recip_SNo x = - recip_SNo_pos (- x).

Axiom recip_SNo_0: recip_SNo 0 = 0.

Axiom recip_SNo_1: recip_SNo 1 = 1.

Axiom SNo_recip_SNo: forall x, SNo x -> SNo (recip_SNo x).

Axiom recip_SNo_invR: forall x, SNo x -> x <> 0 -> x * recip_SNo x = 1.

Axiom recip_SNo_invL: forall x, SNo x -> x <> 0 -> recip_SNo x * x = 1.

Axiom recip_SNo_eps_: forall n, nat_p n -> recip_SNo (eps_ n) = 2 ^ n.

Axiom recip_SNo_pow_2 : forall n, nat_p n -> recip_SNo (2 ^ n) = eps_ n.

Axiom recip_SNo_2 : recip_SNo 2 = eps_ 1.

Axiom recip_SNo_invol: forall x, SNo x -> recip_SNo (recip_SNo x) = x.

Axiom recip_SNo_of_pos_is_pos: forall x, SNo x -> 0 < x -> 0 < recip_SNo x.

Axiom recip_SNo_neg': forall x, SNo x -> x < 0 -> recip_SNo x < 0.

Definition div_SNo : set -> set -> set := fun x y => x * recip_SNo y.

Infix :/: 353 := div_SNo.

Axiom SNo_div_SNo: forall x y, SNo x -> SNo y -> SNo (x :/: y).

Axiom div_SNo_0_num: forall x, SNo x -> 0 :/: x = 0.

Axiom div_SNo_0_denum: forall x, SNo x -> x :/: 0 = 0.

Axiom mul_div_SNo_invL: forall x y, SNo x -> SNo y -> y <> 0 -> (x :/: y) * y = x.

Axiom mul_div_SNo_invR: forall x y, SNo x -> SNo y -> y <> 0 -> y * (x :/: y) = x.

Axiom mul_div_SNo_R: forall x y z, SNo x -> SNo y -> SNo z -> (x :/: y) * z = (x * z) :/: y.

Axiom mul_div_SNo_L: forall x y z, SNo x -> SNo y -> SNo z -> z * (x :/: y) = (z * x) :/: y.

Axiom div_mul_SNo_invL: forall x y, SNo x -> SNo y -> y <> 0 -> (x * y) :/: y = x.

Axiom div_div_SNo: forall x y z, SNo x -> SNo y -> SNo z -> (x :/: y) :/: z = x :/: (y * z).

Axiom mul_div_SNo_both: forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> (x :/: y) * (z :/: w) = (x * z) :/: (y * w).

Axiom recip_SNo_pos_pos: forall x, SNo x -> 0 < x -> 0 < recip_SNo_pos x.

Axiom recip_SNo_of_neg_is_neg: forall x, SNo x -> x < 0 -> recip_SNo x < 0.

Axiom div_SNo_pos_pos: forall x y, SNo x -> SNo y -> 0 < x -> 0 < y -> 0 < x :/: y.

Axiom div_SNo_neg_neg: forall x y, SNo x -> SNo y -> x < 0 -> y < 0 -> 0 < x :/: y.

Axiom div_SNo_pos_neg: forall x y, SNo x -> SNo y -> 0 < x -> y < 0 -> x :/: y < 0.

Axiom div_SNo_neg_pos: forall x y, SNo x -> SNo y -> x < 0 -> 0 < y -> x :/: y < 0.

Axiom div_SNo_pos_LtL : forall x y z, SNo x -> SNo y -> SNo z -> 0 < y -> x < z * y -> x :/: y < z.

Axiom div_SNo_pos_LtR : forall x y z, SNo x -> SNo y -> SNo z -> 0 < y -> z * y < x -> z < x :/: y.

Axiom div_SNo_pos_LtL' : forall x y z, SNo x -> SNo y -> SNo z -> 0 < y -> x :/: y < z -> x < z * y.

Axiom div_SNo_pos_LtR' : forall x y z, SNo x -> SNo y -> SNo z -> 0 < y -> z < x :/: y -> z * y < x.

Axiom mul_div_SNo_nonzero_eq: forall x y z, SNo x -> SNo y -> SNo z -> y <> 0 -> x = y * z -> x :/: y = z.

End SurrealDiv.

(** from Part 9 **)
Section SurrealSqrt.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix :/: 353 := div_SNo.
Infix < 490 := SNoLt.
(* Unicode <= "2264" *)
Infix <= 490 := SNoLe.
Infix ^ 342 right := exp_SNo_nat.

Definition SNoL_nonneg : set -> set := fun x => {w :e SNoL x|0 <= w}.

Axiom SNoL_nonneg_0: SNoL_nonneg 0 = 0.

Axiom SNoL_nonneg_1: SNoL_nonneg 1 = 1.

Definition SNo_sqrtauxset : set -> set -> set -> set := fun Y Z x => \/_ y :e Y, {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}.

Axiom SNo_sqrtauxset_I : forall Y Z x,
 forall y :e Y, forall z :e Z, 0 < y + z -> (x + y * z) :/: (y + z) :e SNo_sqrtauxset Y Z x.

Axiom SNo_sqrtauxset_E : forall Y Z x,
 forall u :e SNo_sqrtauxset Y Z x, forall p:prop,
     (forall y :e Y, forall z :e Z, 0 < y + z -> u = (x + y * z) :/: (y + z) -> p)
  -> p.

Axiom SNo_sqrtauxset_0: forall Z x, SNo_sqrtauxset 0 Z x = 0.

Axiom SNo_sqrtauxset_0': forall Y x, SNo_sqrtauxset Y 0 x = 0.

Definition SNo_sqrtaux : set -> (set -> set) -> set -> set :=
 fun x g =>
  nat_primrec ({g w|w :e SNoL_nonneg x},{g z|z :e SNoR x})
   (fun k p => (p 0 :\/: SNo_sqrtauxset (p 0) (p 1) x,
                p 1 :\/: SNo_sqrtauxset (p 0) (p 0) x
                    :\/: SNo_sqrtauxset (p 1) (p 1) x)).

Axiom SNo_sqrtaux_0: forall x, forall g:set -> set, SNo_sqrtaux x g 0 = ({g w|w :e SNoL_nonneg x},{g z|z :e SNoR x}).

Axiom SNo_sqrtaux_S: forall x, forall g:set -> set, forall n, nat_p n
 -> SNo_sqrtaux x g (ordsucc n)
  = (SNo_sqrtaux x g n 0
       :\/: SNo_sqrtauxset (SNo_sqrtaux x g n 0) (SNo_sqrtaux x g n 1) x,
     SNo_sqrtaux x g n 1
       :\/: SNo_sqrtauxset (SNo_sqrtaux x g n 0) (SNo_sqrtaux x g n 0) x
       :\/: SNo_sqrtauxset (SNo_sqrtaux x g n 1) (SNo_sqrtaux x g n 1) x).

Axiom SNo_sqrtaux_mon_lem: forall x, forall g:set -> set,
  forall m, nat_p m -> forall n, nat_p n
   -> SNo_sqrtaux x g m 0 c= SNo_sqrtaux x g (add_nat m n) 0
   /\ SNo_sqrtaux x g m 1 c= SNo_sqrtaux x g (add_nat m n) 1.

Axiom SNo_sqrtaux_mon: forall x, forall g:set -> set,
  forall m, nat_p m -> forall n, nat_p n -> m c= n
   -> SNo_sqrtaux x g m 0 c= SNo_sqrtaux x g n 0
   /\ SNo_sqrtaux x g m 1 c= SNo_sqrtaux x g n 1.

Axiom SNo_sqrtaux_ext: forall x, SNo x -> forall g h:set -> set, (forall x' :e SNoS_ (SNoLev x), g x' = h x') -> forall k, nat_p k -> SNo_sqrtaux x g k = SNo_sqrtaux x h k.

Section sqrt_SNo_nonneg.

Let G : set -> (set -> set) -> set := fun x g => SNoCut (\/_ k :e omega, SNo_sqrtaux x g k 0) (\/_ k :e omega, SNo_sqrtaux x g k 1).

Definition sqrt_SNo_nonneg : set -> set := SNo_rec_i G.

Axiom sqrt_SNo_nonneg_eq: forall x, SNo x -> sqrt_SNo_nonneg x = G x sqrt_SNo_nonneg.

Axiom sqrt_SNo_nonneg_prop1a: forall x, SNo x -> 0 <= x ->
    (forall w :e SNoS_ (SNoLev x), 0 <= w -> SNo (sqrt_SNo_nonneg w) /\ 0 <= sqrt_SNo_nonneg w /\ sqrt_SNo_nonneg w * sqrt_SNo_nonneg w = w)
 -> forall k, nat_p k ->
              (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 0, SNo y /\ 0 <= y /\ y * y < x)
           /\ (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 1, SNo y /\ 0 <= y /\ x < y * y).

Axiom sqrt_SNo_nonneg_prop1b: forall x, SNo x -> 0 <= x
 -> (forall k, nat_p k ->
              (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 0, SNo y /\ 0 <= y /\ y * y < x)
           /\ (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 1, SNo y /\ 0 <= y /\ x < y * y))
 -> SNoCutP (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0) (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1).

Axiom sqrt_SNo_nonneg_prop1c: forall x, SNo x -> 0 <= x ->
    SNoCutP (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0) (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1)
 -> (forall z :e (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1), forall p:prop, (SNo z -> 0 <= z -> x < z * z -> p) -> p)
 -> 0 <= G x sqrt_SNo_nonneg.

Axiom sqrt_SNo_nonneg_prop1d: forall x, SNo x -> 0 <= x
  -> (forall w :e SNoS_ (SNoLev x), 0 <= w -> SNo (sqrt_SNo_nonneg w) /\ 0 <= sqrt_SNo_nonneg w /\ sqrt_SNo_nonneg w * sqrt_SNo_nonneg w = w)
  -> SNoCutP (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0) (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1)
  -> 0 <= G x sqrt_SNo_nonneg
  -> G x sqrt_SNo_nonneg * G x sqrt_SNo_nonneg < x
  -> False.

Axiom sqrt_SNo_nonneg_prop1e: forall x, SNo x -> 0 <= x
  -> (forall w :e SNoS_ (SNoLev x), 0 <= w -> SNo (sqrt_SNo_nonneg w) /\ 0 <= sqrt_SNo_nonneg w /\ sqrt_SNo_nonneg w * sqrt_SNo_nonneg w = w)
  -> SNoCutP (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0) (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1)
  -> 0 <= G x sqrt_SNo_nonneg
  -> x < G x sqrt_SNo_nonneg * G x sqrt_SNo_nonneg
  -> False.

Axiom sqrt_SNo_nonneg_prop1: forall x, SNo x -> 0 <= x -> SNo (sqrt_SNo_nonneg x) /\ 0 <= sqrt_SNo_nonneg x /\ sqrt_SNo_nonneg x * sqrt_SNo_nonneg x = x.

End sqrt_SNo_nonneg.

Axiom SNo_sqrtaux_0_1_prop: forall x, SNo x -> 0 <= x ->
  forall k, nat_p k ->
      (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 0, SNo y /\ 0 <= y /\ y * y < x)
   /\ (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 1, SNo y /\ 0 <= y /\ x < y * y).

Axiom SNo_sqrtaux_0_prop: forall x, SNo x -> 0 <= x ->
  forall k, nat_p k ->
  forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 0, SNo y /\ 0 <= y /\ y * y < x.

Axiom SNo_sqrtaux_1_prop: forall x, SNo x -> 0 <= x ->
  forall k, nat_p k ->
  forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 1, SNo y /\ 0 <= y /\ x < y * y.

Axiom SNo_sqrt_SNo_SNoCutP: forall x, SNo x -> 0 <= x ->
  SNoCutP (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0)
          (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1).

Axiom SNo_sqrt_SNo_nonneg: forall x, SNo x -> 0 <= x -> SNo (sqrt_SNo_nonneg x).

Axiom sqrt_SNo_nonneg_nonneg: forall x, SNo x -> 0 <= x -> 0 <= sqrt_SNo_nonneg x.

Axiom sqrt_SNo_nonneg_sqr: forall x, SNo x -> 0 <= x -> sqrt_SNo_nonneg x * sqrt_SNo_nonneg x = x.

Axiom sqrt_SNo_nonneg_0 : sqrt_SNo_nonneg 0 = 0.

Axiom sqrt_SNo_nonneg_1 : sqrt_SNo_nonneg 1 = 1.

End SurrealSqrt.

(** Part 10 **)

Section Reals.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix :/: 353 := div_SNo.
Infix < 490 := SNoLt.
(* Unicode <= "2264" *)
Infix <= 490 := SNoLe.
Infix ^ 342 right := exp_SNo_nat.

Theorem SNoS_omega_drat_intvl : forall x :e SNoS_ omega,
  forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.
let x. assume Hx.
apply SNoS_E2 omega omega_ordinal x Hx.
assume Hx1 Hx2 Hx3 Hx4.
let k. assume Hk. prove exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.
claim Lk1: SNo (eps_ (ordsucc k)).
{ exact SNo_eps_ (ordsucc k) (omega_ordsucc k Hk). }
witness x + - eps_ (ordsucc k).
apply andI.
- prove x + - eps_ (ordsucc k) :e SNoS_ omega.
  exact add_SNo_SNoS_omega x Hx (- eps_ (ordsucc k)) (minus_SNo_SNoS_omega (eps_ (ordsucc k)) (SNo_eps_SNoS_omega (ordsucc k) (omega_ordsucc k Hk))).
- apply andI.
  + prove x + - eps_ (ordsucc k) < x.
    apply add_SNo_minus_Lt1b x (eps_ (ordsucc k)) x Hx3 Lk1 Hx3.
    prove x < x + eps_ (ordsucc k).
    exact add_SNo_eps_Lt x Hx3 (ordsucc k) (omega_ordsucc k Hk).
  + prove x < (x + - eps_ (ordsucc k)) + eps_ k.
    rewrite <- eps_ordsucc_half_add k (omega_nat_p k Hk).
    prove x < (x + - eps_ (ordsucc k)) + (eps_ (ordsucc k) + eps_ (ordsucc k)).
    rewrite add_SNo_com_4_inner_mid x (- eps_ (ordsucc k)) (eps_ (ordsucc k)) (eps_ (ordsucc k)) Hx3 (SNo_minus_SNo (eps_ (ordsucc k)) Lk1) Lk1 Lk1.
    prove x < (x + eps_ (ordsucc k)) + (- eps_ (ordsucc k) + eps_ (ordsucc k)).
    rewrite add_SNo_minus_SNo_linv (eps_ (ordsucc k)) Lk1.
    rewrite add_SNo_0R (x + eps_ (ordsucc k)) (SNo_add_SNo x (eps_ (ordsucc k)) Hx3 Lk1).
    prove x < x + eps_ (ordsucc k).
    exact add_SNo_eps_Lt x Hx3 (ordsucc k) (omega_ordsucc k Hk).
Qed.

Theorem SNoS_ordsucc_omega_bdd_above : forall x :e SNoS_ (ordsucc omega), x < omega -> exists N :e omega, x < N.
let x. assume Hx1 Hx2.
apply SNoS_E2 (ordsucc omega) ordsucc_omega_ordinal x Hx1.
assume Hx1a Hx1b Hx1c Hx1d.
apply SNoLtE x omega Hx1c SNo_omega Hx2.
- let z.
  assume Hz1: SNo z.
  assume Hz2: SNoLev z :e SNoLev x :/\: SNoLev omega.
  assume Hz3: SNoEq_ (SNoLev z) z x.
  assume Hz4: SNoEq_ (SNoLev z) z omega.
  assume Hz5: x < z.
  assume Hz6: z < omega.
  assume Hz7: SNoLev z /:e x.
  assume Hz8: SNoLev z :e omega.
  claim Lz1: ordinal (SNoLev z).
  { apply SNoLev_ordinal. exact Hz1. }
  claim Lz2: SNo (SNoLev z).
  { apply ordinal_SNo. exact Lz1. }
  witness (SNoLev z). apply andI.
  + exact Hz8.
  + prove x < SNoLev z.
    apply SNoLtLe_tra x z (SNoLev z) Hx1c Hz1 Lz2 Hz5.
    prove z <= SNoLev z.
    apply ordinal_SNoLev_max_2 (SNoLev z) Lz1 z Hz1.
    prove SNoLev z :e ordsucc (SNoLev z).
    apply ordsuccI2.
- assume H1: SNoLev x :e SNoLev omega.
  assume H2: SNoEq_ (SNoLev x) x omega.
  assume H3: SNoLev x :e omega.
  claim Lx1: ordinal (SNoLev x).
  { apply SNoLev_ordinal. exact Hx1c. }
  claim Lx2: ordinal (ordsucc (SNoLev x)).
  { apply ordinal_ordsucc. exact Lx1. }
  witness (ordsucc (SNoLev x)). apply andI.
  + apply omega_ordsucc. exact H3.
  + prove x < ordsucc (SNoLev x).
    apply ordinal_SNoLev_max (ordsucc (SNoLev x)) Lx2 x Hx1c.
    prove SNoLev x :e ordsucc (SNoLev x).
    apply ordsuccI2.
- rewrite ordinal_SNoLev omega omega_ordinal.
  assume H1: omega :e SNoLev x.
  prove False.
  apply ordsuccE omega (SNoLev x) Hx1a.
  + assume H2: SNoLev x :e omega. exact In_no2cycle (SNoLev x) omega H2 H1.
  + assume H2: SNoLev x = omega. apply In_irref omega. rewrite <- H2 at 2. exact H1.
Qed.

Theorem SNoS_ordsucc_omega_bdd_below : forall x :e SNoS_ (ordsucc omega), - omega < x -> exists N :e omega, - N < x.
let x. assume Hx1 Hx2.
apply SNoS_E2 (ordsucc omega) ordsucc_omega_ordinal x Hx1.
assume Hx1a Hx1b Hx1c Hx1d.
claim Lx1: - x :e SNoS_ (ordsucc omega).
{ exact minus_SNo_SNoS_ (ordsucc omega) ordsucc_omega_ordinal x Hx1. }
claim Lx2: - x < omega.
{ apply minus_SNo_Lt_contra1 omega x SNo_omega Hx1c.
  prove - omega < x. exact Hx2.
}
apply SNoS_ordsucc_omega_bdd_above (- x) Lx1 Lx2.
let N. assume HN. apply HN.
assume HN1: N :e omega.
assume HN2: - x < N.
witness N. apply andI.
- exact HN1.
- prove - N < x.
  apply minus_SNo_Lt_contra1 x N Hx1c (omega_SNo N HN1).
  prove - x < N. exact HN2.
Qed.

Theorem SNoS_ordsucc_omega_bdd_drat_intvl : forall x :e SNoS_ (ordsucc omega),
    - omega < x -> x < omega
 -> forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.
let x. assume Hx1 Hx2 Hx3.
apply SNoS_E2 (ordsucc omega) ordsucc_omega_ordinal x Hx1.
assume Hx1a Hx1b Hx1c Hx1d.
apply dneg.
assume HC: ~(forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k).
claim L1: x /:e SNoS_ omega.
{ assume H1: x :e SNoS_ omega.
  apply HC.
  exact SNoS_omega_drat_intvl x H1.
}
claim L2: forall k, nat_p k -> exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.
{ apply nat_ind.
  - prove exists q :e SNoS_ omega, q < x /\ x < q + eps_ 0.
    rewrite eps_0_1.
    prove exists q :e SNoS_ omega, q < x /\ x < q + 1.
    claim L1a: forall N, nat_p N -> - N < x -> x < N -> exists q :e SNoS_ omega, q < x /\ x < q + 1.
    { apply nat_ind.
      - rewrite minus_SNo_0.
        assume H1: 0 < x.
        assume H2: x < 0.
        prove False. apply SNoLt_irref x.
        exact SNoLt_tra x 0 x Hx1c SNo_0 Hx1c H2 H1.
      - let N. assume HN.
        assume IHN: - N < x -> x < N -> exists q :e SNoS_ omega, q < x /\ x < q + 1.
        assume H1: - ordsucc N < x.
        assume H2: x < ordsucc N.
        prove exists q :e SNoS_ omega, q < x /\ x < q + 1.
        claim LN1: SNo N.
        { exact nat_p_SNo N HN. }
        claim LN2: SNo (- N).
        { exact SNo_minus_SNo N LN1. }
        claim LN3: N :e SNoS_ omega.
        { apply omega_SNoS_omega. exact nat_p_omega N HN. }
        apply SNoLt_trichotomy_or_impred x N Hx1c LN1.
        + assume H3: x < N.
          apply SNoLt_trichotomy_or_impred x (- N) Hx1c LN2.
          * { assume H4: x < - N.
              witness (- ordsucc N). apply andI.
              - prove - ordsucc N :e SNoS_ omega.
                apply minus_SNo_SNoS_omega.
                prove ordsucc N :e SNoS_ omega.
                apply omega_SNoS_omega. apply omega_ordsucc. apply nat_p_omega. exact HN.
              - apply andI.
                + prove - ordsucc N < x. exact H1.
                + prove x < - ordsucc N + 1.
                  rewrite <- add_SNo_1_ordsucc N (nat_p_omega N HN).
                  prove x < -(N + 1) + 1.
                  rewrite minus_add_SNo_distr N 1 LN1 SNo_1.
                  prove x < (- N + - 1) + 1.
                  rewrite add_SNo_minus_R2' (- N) 1 LN2 SNo_1.
                  prove x < - N. exact H4.
            }
          * assume H4: x = - N. prove False. apply L1.
            prove x :e SNoS_ omega.
            rewrite H4. apply minus_SNo_SNoS_omega.
            prove N :e SNoS_ omega. exact LN3.
          * assume H4: - N < x.
            exact IHN H4 H3.
        + assume H3: x = N. prove False. apply L1.
          prove x :e SNoS_ omega.
          rewrite H3.
          prove N :e SNoS_ omega. exact LN3.
        + assume H3: N < x.
          witness N. apply andI.
          * prove N :e SNoS_ omega. exact LN3.
          * { apply andI.
              - prove N < x. exact H3.
              - prove x < N + 1.
                rewrite add_SNo_1_ordsucc N (nat_p_omega N HN).
                prove x < ordsucc N.
                exact H2.
            }
    }
    apply SNoS_ordsucc_omega_bdd_above x Hx1 Hx3.
    let N. assume HN. apply HN.
    assume HN1: N :e omega.
    assume HN2: x < N.
    apply SNoS_ordsucc_omega_bdd_below x Hx1 Hx2.
    let N'. assume HN'. apply HN'.
    assume HN'1: N' :e omega.
    assume HN'2: - N' < x.
    apply SNoLt_trichotomy_or_impred N N' (omega_SNo N HN1) (omega_SNo N' HN'1).
    + assume H1: N < N'.
      apply L1a N' (omega_nat_p N' HN'1) HN'2.
      prove x < N'.
      exact SNoLt_tra x N N' Hx1c (omega_SNo N HN1) (omega_SNo N' HN'1) HN2 H1.
    + assume H1: N = N'.
      apply L1a N' (omega_nat_p N' HN'1) HN'2.
      prove x < N'. rewrite <- H1. exact HN2.
    + assume H1: N' < N.
      apply L1a N (omega_nat_p N HN1).
      * { prove - N < x.
          apply SNoLt_tra (- N) (- N') x (SNo_minus_SNo N (omega_SNo N HN1)) (SNo_minus_SNo N' (omega_SNo N' HN'1)) Hx1c.
          - prove - N < - N'. apply minus_SNo_Lt_contra N' N (omega_SNo N' HN'1) (omega_SNo N HN1).
            exact H1.
          - prove - N' < x. exact HN'2.
        }
      * prove x < N. exact HN2.
  - let k. assume Hk.
    assume IHk. apply IHk.
    let q. assume H. apply H.
    assume Hq1: q :e SNoS_ omega. assume H. apply H.
    assume Hq2: q < x.
    assume Hq3: x < q + eps_ k.
    apply SNoS_E2 omega omega_ordinal q Hq1.
    assume Hq1a Hq1b Hq1c Hq1d.
    prove exists q :e SNoS_ omega, q < x /\ x < q + eps_ (ordsucc k).
    apply SNoLt_trichotomy_or_impred x (q + eps_ (ordsucc k)) Hx1c (SNo_add_SNo q (eps_ (ordsucc k)) Hq1c (SNo_eps_ (ordsucc k) (omega_ordsucc k (nat_p_omega k Hk)))).
    + assume H1: x < q + eps_ (ordsucc k).
      witness q. apply andI.
      * exact Hq1.
      * { apply andI.
          - exact Hq2.
          - exact H1.
        }
    + assume H1: x = q + eps_ (ordsucc k). prove False.
      apply L1. rewrite H1.
      exact add_SNo_SNoS_omega q Hq1 (eps_ (ordsucc k)) (SNo_eps_SNoS_omega (ordsucc k) (omega_ordsucc k (nat_p_omega k Hk))).
    + assume H1: q + eps_ (ordsucc k) < x.
      witness (q + eps_ (ordsucc k)). apply andI.
      * exact add_SNo_SNoS_omega q Hq1 (eps_ (ordsucc k)) (SNo_eps_SNoS_omega (ordsucc k) (omega_ordsucc k (nat_p_omega k Hk))).
      * { apply andI.
          - exact H1.
          - prove x < (q + eps_ (ordsucc k)) + eps_ (ordsucc k).
            rewrite <- add_SNo_assoc q (eps_ (ordsucc k)) (eps_ (ordsucc k)) Hq1c (SNo_eps_ (ordsucc k) (omega_ordsucc k (nat_p_omega k Hk))) (SNo_eps_ (ordsucc k) (omega_ordsucc k (nat_p_omega k Hk))).
            prove x < q + (eps_ (ordsucc k) + eps_ (ordsucc k)).
            rewrite eps_ordsucc_half_add k Hk.
            prove x < q + eps_ k.
            exact Hq3.
        }
}
apply HC.
let k. assume Hk. exact L2 k (omega_nat_p k Hk).
Qed.

Definition real : set := {x :e SNoS_ (ordsucc omega)| x <> omega /\ x <> - omega /\ (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)}.

Definition rational : set := {x :e real | exists m :e int, exists n :e omega :\: {0}, x = m :/: n}.

Theorem real_I : forall x :e SNoS_ (ordsucc omega),
    x <> omega
 -> x <> - omega
 -> (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
 -> x :e real.
let x. assume Hx H1 H2 H3.
prove x :e {x :e SNoS_ (ordsucc omega)| x <> omega /\ x <> - omega /\ (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)}.
apply SepI.
- exact Hx.
- prove x <> omega /\ x <> - omega /\ (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x).
  apply and3I.
  + exact H1.
  + exact H2.
  + exact H3.
Qed.

Theorem real_E : forall x :e real,
 forall p:prop,
      (SNo x
    -> SNoLev x :e ordsucc omega
    -> x :e SNoS_ (ordsucc omega)
    -> - omega < x
    -> x < omega
    -> (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
    -> (forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k)
    -> p)
   -> p.
let x. assume Hx.
let p. assume Hp.
apply SepE (SNoS_ (ordsucc omega)) (fun x => x <> omega /\ x <> - omega /\ (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)) x Hx.
assume H1 H2. apply H2. assume H2. apply H2.
assume H2: x <> omega.
assume H3: x <> - omega.
assume H4.
apply SNoS_E2 (ordsucc omega) ordsucc_omega_ordinal x H1.
assume H1a H1b H1c H1d.
claim L1: x < omega.
{ claim L1a: x <= omega.
  { apply ordinal_SNoLev_max_2 omega omega_ordinal x H1c.
    prove SNoLev x :e ordsucc omega. exact H1a.
  }
  apply SNoLeE x omega H1c SNo_omega L1a.
  - assume H. exact H.
  - assume H: x = omega. prove False. exact H2 H.
}
claim L2: - omega < x.
{ claim L2a: - omega <= x.
  { apply mordinal_SNoLev_min_2 omega omega_ordinal x H1c.
    prove SNoLev x :e ordsucc omega. exact H1a.
  }
  apply SNoLeE (- omega) x (SNo_minus_SNo omega SNo_omega) H1c L2a.
  - assume H. exact H.
  - assume H: - omega = x. prove False. apply H3. symmetry. exact H.
}
claim L3: forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.
{ exact SNoS_ordsucc_omega_bdd_drat_intvl x H1 L2 L1. }
exact Hp H1c H1a H1 L2 L1 H4 L3.
Qed.

Theorem real_SNo : forall x :e real, SNo x.
let x. assume Hx. apply real_E x Hx.
assume Hx1 _ _ _ _ _ _. exact Hx1.
Qed.

Theorem real_SNoS_omega_prop : forall x :e real, forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x.
let x. assume Hx. apply real_E x Hx.
assume _ _ _ _ _ Hx6 _. exact Hx6.
Qed.

Theorem SNoS_omega_real : SNoS_ omega c= real.
let x. assume Hx: x :e SNoS_ omega.
apply SNoS_E2 omega omega_ordinal x Hx.
assume Hx1 Hx2 Hx3 Hx4.
apply real_I.
- prove x :e SNoS_ (ordsucc omega).
  apply SNoS_Subq omega (ordsucc omega) omega_ordinal ordsucc_omega_ordinal (ordsuccI1 omega).
  exact Hx.
- prove x <> omega.
  assume H1: x = omega.
  apply In_irref (SNoLev x).
  prove SNoLev x :e SNoLev x.
  rewrite H1 at 2.
  prove SNoLev x :e SNoLev omega.
  rewrite ordinal_SNoLev omega omega_ordinal.
  exact Hx1.
- prove x <> - omega.
  assume H1: x = - omega.
  apply In_irref (SNoLev x).
  prove SNoLev x :e SNoLev x.
  rewrite H1 at 2.
  prove SNoLev x :e SNoLev (- omega).
  rewrite minus_SNo_Lev omega SNo_omega.
  prove SNoLev x :e SNoLev omega.
  rewrite ordinal_SNoLev omega omega_ordinal.
  exact Hx1.
- let q. assume Hq: q :e SNoS_ omega.
  assume H1: forall k :e omega, abs_SNo (q + - x) < eps_ k.
  apply SNoS_E2 omega omega_ordinal q Hq.
  assume Hq1 Hq2 Hq3 Hq4.
  prove q = x.
  apply SNoLt_trichotomy_or_impred q x Hq3 Hx3.
  + assume Hqx: q < x. prove False.
    claim L1: 0 < x + - q.
    { apply SNoLt_minus_pos q x Hq3 Hx3.
      exact Hqx.
    }
    claim L2: x + - q :e SNoS_ omega.
    { exact add_SNo_SNoS_omega x Hx (- q) (minus_SNo_SNoS_omega q Hq). }
    apply SNoS_E2 omega omega_ordinal (x + - q) L2.
    assume H2: SNoLev (x + - q) :e omega.
    assume H3: ordinal (SNoLev (x + - q)).
    assume H4: SNo (x + - q).
    assume H5: SNo_ (SNoLev (x + - q)) (x + - q).
    apply SNoLt_irref (x + - q).
    apply SNoLt_tra (x + - q) (eps_ (SNoLev (x + - q))) (x + - q) H4 (SNo_eps_ (SNoLev (x + - q)) H2) H4.
    * prove x + - q < eps_ (SNoLev (x + - q)).
      claim L3: abs_SNo (q + - x) = x + - q.
      { rewrite abs_SNo_dist_swap q x Hq3 Hx3.
        exact pos_abs_SNo (x + - q) L1.
      }
      rewrite <- L3 at 1.
      exact H1 (SNoLev (x + - q)) H2.
    * { prove eps_ (SNoLev (x + - q)) < x + - q.
        apply SNo_pos_eps_Lt (SNoLev (x + - q)) (omega_nat_p (SNoLev (x + - q)) H2) (x + - q).
	- prove (x + - q) :e SNoS_ (ordsucc (SNoLev (x + - q))).
	  apply SNoS_I (ordsucc (SNoLev (x + - q))) (ordinal_ordsucc (SNoLev (x + - q)) H3) (x + - q) (SNoLev (x + - q)).
	  + apply ordsuccI2.
	  + exact H5.
	- exact L1.
      }
  + assume Hqx: q = x. exact Hqx.
  + assume Hxq: x < q. prove False.
    claim L4: 0 < q + - x.
    { apply SNoLt_minus_pos x q Hx3 Hq3.
      exact Hxq.
    }
    claim L5: q + - x :e SNoS_ omega.
    { exact add_SNo_SNoS_omega q Hq (- x) (minus_SNo_SNoS_omega x Hx). }
    apply SNoS_E2 omega omega_ordinal (q + - x) L5.
    assume H2: SNoLev (q + - x) :e omega.
    assume H3: ordinal (SNoLev (q + - x)).
    assume H4: SNo (q + - x).
    assume H5: SNo_ (SNoLev (q + - x)) (q + - x).
    apply SNoLt_irref (q + - x).
    apply SNoLt_tra (q + - x) (eps_ (SNoLev (q + - x))) (q + - x) H4 (SNo_eps_ (SNoLev (q + - x)) H2) H4.
    * prove q + - x < eps_ (SNoLev (q + - x)).
      claim L6: abs_SNo (q + - x) = q + - x.
      { exact pos_abs_SNo (q + - x) L4. }
      rewrite <- L6 at 1.
      exact H1 (SNoLev (q + - x)) H2.
    * { prove eps_ (SNoLev (q + - x)) < q + - x.
        apply SNo_pos_eps_Lt (SNoLev (q + - x)) (omega_nat_p (SNoLev (q + - x)) H2) (q + - x).
	- prove (q + - x) :e SNoS_ (ordsucc (SNoLev (q + - x))).
	  apply SNoS_I (ordsucc (SNoLev (q + - x))) (ordinal_ordsucc (SNoLev (q + - x)) H3) (q + - x) (SNoLev (q + - x)).
	  + apply ordsuccI2.
	  + exact H5.
	- exact L4.
      }
Qed.

Theorem real_0 : 0 :e real.
exact SNoS_omega_real 0 (omega_SNoS_omega 0 (nat_p_omega 0 nat_0)).
Qed.

Theorem real_1 : 1 :e real.
exact SNoS_omega_real 1 (omega_SNoS_omega 1 (nat_p_omega 1 nat_1)).
Qed.

Theorem SNoLev_In_real_SNoS_omega : forall x :e real, forall w, SNo w -> SNoLev w :e SNoLev x -> w :e SNoS_ omega.
let x. assume Hx. let w. assume Hw1 Hw2.
apply real_E x Hx.
assume Hx1: SNo x.
assume Hx2: SNoLev x :e ordsucc omega.
assume _ _ _ _ _.
claim L1: SNoLev w :e omega.
{ apply ordsuccE omega (SNoLev x) Hx2.
  - assume H1: SNoLev x :e omega.
    exact omega_TransSet (SNoLev x) H1 (SNoLev w) Hw2.
  - assume H1: SNoLev x = omega.
    rewrite <- H1. exact Hw2.
}
apply SNoS_I omega omega_ordinal w (SNoLev w) L1.
prove SNo_ (SNoLev w) w. apply SNoLev_. exact Hw1.
Qed.

Theorem real_SNoCut_SNoS_omega: forall L R c= SNoS_ omega, SNoCutP L R
 -> L <> 0
 -> R <> 0
 -> (forall w :e L, exists w' :e L, w < w')
 -> (forall z :e R, exists z' :e R, z' < z)
 -> SNoCut L R :e real.
let L. assume HL. let R. assume HR.
assume HLR. apply HLR. assume H. apply H.
assume HLR1: forall w :e L, SNo w.
assume HLR2: forall z :e R, SNo z.
assume HLR3: forall w :e L, forall z :e R, w < z.
assume HL0: L <> 0.
assume HR0: R <> 0.
assume HL1: forall w :e L, exists w' :e L, w < w'.
assume HR1: forall z :e R, exists z' :e R, z' < z.
set x := SNoCut L R.
apply SNoCutP_SNoCut_impred L R HLR.
assume H1: SNo x.
assume H2: SNoLev x :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume H3: forall w :e L, w < x.
assume H4: forall z :e R, x < z.
assume H5: forall u, SNo u -> (forall w :e L, w < u) -> (forall z :e R, u < z) -> SNoLev x c= SNoLev u /\ SNoEq_ (SNoLev x) x u.
claim Lo: ordinal ((\/_ w :e L, ordsucc (SNoLev w)) :\/: (\/_ z :e R, ordsucc (SNoLev z))).
{ apply ordinal_binunion.
  - apply ordinal_famunion.
    let w. assume Hw.
    prove ordinal (ordsucc (SNoLev w)).
    apply ordinal_ordsucc.
    prove ordinal (SNoLev w).
    apply SNoLev_ordinal.
    exact HLR1 w Hw.
  - apply ordinal_famunion.
    let z. assume Hz.
    prove ordinal (ordsucc (SNoLev z)).
    apply ordinal_ordsucc.
    prove ordinal (SNoLev z).
    apply SNoLev_ordinal.
    exact HLR2 z Hz.
}
claim LLRsoo: ordsucc ((\/_ w :e L, ordsucc (SNoLev w)) :\/: (\/_ z :e R, ordsucc (SNoLev z))) c= ordsucc omega.
{ apply ordinal_ordsucc_In_Subq (ordsucc omega) ordsucc_omega_ordinal ((\/_ w :e L, ordsucc (SNoLev w)) :\/: (\/_ z :e R, ordsucc (SNoLev z))).
  prove ((\/_ w :e L, ordsucc (SNoLev w)) :\/: (\/_ z :e R, ordsucc (SNoLev z))) :e ordsucc omega.
  apply ordinal_In_Or_Subq ((\/_ w :e L, ordsucc (SNoLev w)) :\/: (\/_ z :e R, ordsucc (SNoLev z))) (ordsucc omega) Lo ordsucc_omega_ordinal.
  - assume H6. exact H6.
  - assume H6: ordsucc omega c= (\/_ w :e L, ordsucc (SNoLev w)) :\/: (\/_ z :e R, ordsucc (SNoLev z)).
    prove False.
    apply binunionE (\/_ w :e L, ordsucc (SNoLev w)) (\/_ z :e R, ordsucc (SNoLev z)) omega (H6 omega (ordsuccI2 omega)).
    + assume H7: omega :e \/_ w :e L, ordsucc (SNoLev w).
      apply famunionE_impred L (fun w => ordsucc (SNoLev w)) omega H7.
      let w. assume Hw: w :e L.
      assume H8: omega :e ordsucc (SNoLev w).
      apply SNoS_E2 omega omega_ordinal w (HL w Hw).
      assume Hw1: SNoLev w :e omega.
      prove False.
      apply ordsuccE (SNoLev w) omega H8.
      * assume H9: omega :e SNoLev w.
        exact In_no2cycle omega (SNoLev w) H9 Hw1.
      * assume H9: omega = SNoLev w.
        prove False.
        apply In_irref omega.
        rewrite H9 at 1. exact Hw1.
    + assume H7: omega :e \/_ z :e R, ordsucc (SNoLev z).
      apply famunionE_impred R (fun z => ordsucc (SNoLev z)) omega H7.
      let z. assume Hz: z :e R.
      assume H8: omega :e ordsucc (SNoLev z).
      apply SNoS_E2 omega omega_ordinal z (HR z Hz).
      assume Hz1: SNoLev z :e omega.
      prove False.
      apply ordsuccE (SNoLev z) omega H8.
      * assume H9: omega :e SNoLev z.
        exact In_no2cycle omega (SNoLev z) H9 Hz1.
      * assume H9: omega = SNoLev z.
        prove False.
        apply In_irref omega.
        rewrite H9 at 1. exact Hz1.
}
apply ordsuccE omega (SNoLev x) (LLRsoo (SNoLev x) H2).
- assume H6: SNoLev x :e omega.
  prove x :e real.
  apply SNoS_omega_real.
  prove x :e SNoS_ omega.
  apply SNoS_I omega omega_ordinal x (SNoLev x) H6.
  prove SNo_ (SNoLev x) x.
  apply SNoLev_.
  exact H1.
- assume H6: SNoLev x = omega.
  prove x :e real.
  apply real_I.
  + prove x :e SNoS_ (ordsucc omega).
    apply SNoS_I (ordsucc omega) ordsucc_omega_ordinal x (SNoLev x).
    * prove SNoLev x :e ordsucc omega.
      rewrite H6. apply ordsuccI2.
    * prove SNo_ (SNoLev x) x. apply SNoLev_. exact H1.
  + assume H7: x = omega.
    apply HR0.
    apply Empty_eq.
    let z. assume Hz: z :e R.
    apply SNoLt_irref z.
    prove z < z.
    apply SNoLt_tra z x z (HLR2 z Hz) H1 (HLR2 z Hz).
    * prove z < x. rewrite H7.
      prove z < omega.
      apply ordinal_SNoLev_max omega omega_ordinal z (HLR2 z Hz).
      prove SNoLev z :e omega.
      apply SNoS_E2 omega omega_ordinal z (HR z Hz).
      assume Hz1: SNoLev z :e omega.
      assume _ _ _.
      exact Hz1.
    * prove x < z. apply H4. exact Hz.
  + assume H7: x = - omega.
    apply HL0.
    apply Empty_eq.
    let w. assume Hw: w :e L.
    apply SNoLt_irref w.
    prove w < w.
    apply SNoLt_tra w x w (HLR1 w Hw) H1 (HLR1 w Hw).
    * prove w < x. apply H3. exact Hw.
    * prove x < w. rewrite H7.
      prove - omega < w.
      apply minus_SNo_Lt_contra1 w omega (HLR1 w Hw) SNo_omega.
      prove - w < omega.
      apply ordinal_SNoLev_max omega omega_ordinal (- w) (SNo_minus_SNo w (HLR1 w Hw)).
      prove SNoLev (- w) :e omega.
      rewrite minus_SNo_Lev w (HLR1 w Hw).
      apply SNoS_E2 omega omega_ordinal w (HL w Hw).
      assume Hw1: SNoLev w :e omega.
      assume _ _ _.
      exact Hw1.
  + let q. assume Hq: q :e SNoS_ omega.
    assume H7: forall k :e omega, abs_SNo (q + - x) < eps_ k.
    prove False.
    apply SNoS_E2 omega omega_ordinal q Hq.
    assume Hq1: SNoLev q :e omega.
    assume Hq2: ordinal (SNoLev q).
    assume Hq3: SNo q.
    assume Hq4: SNo_ (SNoLev q) q.
    claim LqL: forall w :e L, w < q.
    { let w. assume Hw: w :e L.
      apply SNoLtLe_or w q (HLR1 w Hw) Hq3.
      - assume H8: w < q. exact H8.
      - assume H8: q <= w. prove False.
        apply HL1 w Hw.
        let w'. assume H. apply H.
        assume H9: w' :e L.
        assume H10: w < w'.
        claim LqL1: w' + - q :e SNoS_ omega.
        { apply add_SNo_SNoS_omega.
          - exact HL w' H9.
          - apply minus_SNo_SNoS_omega. exact Hq.
        }
        apply SNoS_E2 omega omega_ordinal (w' + - q) LqL1.
        assume Hw'q1: SNoLev (w' + - q) :e omega.
        assume Hw'q2: ordinal (SNoLev (w' + - q)).
        assume Hw'q3: SNo (w' + - q).
        assume Hw'q4: SNo_ (SNoLev (w' + - q)) (w' + - q).
        claim LqL2: 0 < w' + - q.
        { apply SNoLt_minus_pos q w' Hq3 (HLR1 w' H9).
          prove q < w'.
          exact SNoLeLt_tra q w w' Hq3 (HLR1 w Hw) (HLR1 w' H9) H8 H10.
        }
        set k := SNoLev (w' + - q).
        claim LqL3: w' + - q :e SNoS_ (ordsucc k).
        { exact SNoS_I (ordsucc k) (ordinal_ordsucc k (nat_p_ordinal k (omega_nat_p k Hw'q1))) (w' + - q) k (ordsuccI2 k) Hw'q4. }
        claim Lek: SNo (eps_ k).
        { exact SNo_eps_ k Hw'q1. }
        claim LqL4: eps_ k < w' + - q.
        { exact SNo_pos_eps_Lt k (omega_nat_p k Hw'q1) (w' + - q) LqL3 LqL2. }
        apply SNoLt_irref (eps_ k).
        apply SNoLt_tra (eps_ k) (w' + - q) (eps_ k) Lek Hw'q3 Lek LqL4.
        prove w' + - q < eps_ k.
        claim Lxq: SNo (x + - q).
        { exact SNo_add_SNo x (- q) H1 (SNo_minus_SNo q Hq3). }
        apply SNoLt_tra (w' + - q) (x + - q) (eps_ k) Hw'q3 Lxq Lek.
        + prove w' + - q < x + - q.
          apply add_SNo_Lt1 w' (- q) x (HLR1 w' H9) (SNo_minus_SNo q Hq3) H1.
          prove w' < x.
          apply H3. prove w' :e L. exact H9.
        + prove x + - q < eps_ k.
          apply SNoLtLe_or (x + - q) 0 Lxq SNo_0.
          * assume H11: x + - q < 0.
            exact SNoLt_tra (x + - q) 0 (eps_ k) Lxq SNo_0 Lek H11 (SNo_eps_pos k Hw'q1).
          * assume H11: 0 <= x + - q.
            rewrite <- nonneg_abs_SNo (x + - q) H11.
            prove abs_SNo (x + - q) < eps_ k.
            rewrite abs_SNo_dist_swap x q H1 Hq3.
            exact H7 k Hw'q1.
    }
    claim LqR: forall z :e R, q < z.
    { let z. assume Hz: z :e R.
      apply SNoLtLe_or q z Hq3 (HLR2 z Hz).
      - assume H8: q < z. exact H8.
      - assume H8: z <= q. prove False.
        apply HR1 z Hz.
        let z'. assume H. apply H.
        assume H9: z' :e R.
        assume H10: z' < z.
        claim LqR1: q + - z' :e SNoS_ omega.
        { apply add_SNo_SNoS_omega.
          - exact Hq.
          - apply minus_SNo_SNoS_omega. exact HR z' H9.
        }
        apply SNoS_E2 omega omega_ordinal (q + - z') LqR1.
        assume Hz'q1: SNoLev (q + - z') :e omega.
        assume Hz'q2: ordinal (SNoLev (q + - z')).
        assume Hz'q3: SNo (q + - z').
        assume Hz'q4: SNo_ (SNoLev (q + - z')) (q + - z').
        claim LqR2: 0 < q + - z'.
        { apply SNoLt_minus_pos z' q (HLR2 z' H9) Hq3.
          prove z' < q.
          exact SNoLtLe_tra z' z q (HLR2 z' H9) (HLR2 z Hz) Hq3 H10 H8.
        }
        set k := SNoLev (q + - z').
        claim LqR3: q + - z' :e SNoS_ (ordsucc k).
        { exact SNoS_I (ordsucc k) (ordinal_ordsucc k (nat_p_ordinal k (omega_nat_p k Hz'q1))) (q + - z') k (ordsuccI2 k) Hz'q4. }
        claim Lek: SNo (eps_ k).
        { exact SNo_eps_ k Hz'q1. }
        claim LqR4: eps_ k < q + - z'.
        { exact SNo_pos_eps_Lt k (omega_nat_p k Hz'q1) (q + - z') LqR3 LqR2. }
        apply SNoLt_irref (eps_ k).
        apply SNoLt_tra (eps_ k) (q + - z') (eps_ k) Lek Hz'q3 Lek LqR4.
        prove q + - z' < eps_ k.
        claim Lxq: SNo (q + - x).
        { exact SNo_add_SNo q (- x) Hq3 (SNo_minus_SNo x H1). }
        apply SNoLt_tra (q + - z') (q + - x) (eps_ k) Hz'q3 Lxq Lek.
        + prove q + - z' < q + - x.
          apply add_SNo_Lt2 q (- z') (- x) Hq3 (SNo_minus_SNo z' (HLR2 z' H9)) (SNo_minus_SNo x H1).
          prove - z' < - x.
          apply minus_SNo_Lt_contra x z' H1 (HLR2 z' H9).
          prove x < z'.
          apply H4. prove z' :e R. exact H9.
        + prove q + - x < eps_ k.
          apply SNoLtLe_or (q + - x) 0 Lxq SNo_0.
          * assume H11: q + - x < 0.
            exact SNoLt_tra (q + - x) 0 (eps_ k) Lxq SNo_0 Lek H11 (SNo_eps_pos k Hz'q1).
          * assume H11: 0 <= q + - x.
            rewrite <- nonneg_abs_SNo (q + - x) H11.
            prove abs_SNo (q + - x) < eps_ k.
            exact H7 k Hz'q1.
    }
    apply H5 q Hq3 LqL LqR.
    assume H10: SNoLev x c= SNoLev q.
    prove False.
    apply In_irref (SNoLev q).
    apply H10.
    prove SNoLev q :e SNoLev x.
    rewrite H6.
    exact Hq1.
Qed.

Theorem real_SNoCut: forall L R c= real, SNoCutP L R
 -> L <> 0
 -> R <> 0
 -> (forall w :e L, exists w' :e L, w < w')
 -> (forall z :e R, exists z' :e R, z' < z)
 -> SNoCut L R :e real.
let L. assume HL. let R. assume HR.
assume HLR. apply HLR. assume H. apply H.
assume HLR1: forall w :e L, SNo w.
assume HLR2: forall z :e R, SNo z.
assume HLR3: forall w :e L, forall z :e R, w < z.
assume HL0: L <> 0.
assume HR0: R <> 0.
assume HL1: forall w :e L, exists w' :e L, w < w'.
assume HR1: forall z :e R, exists z' :e R, z' < z.
set x := SNoCut L R.
apply SNoCutP_SNoCut_impred L R HLR.
assume H1: SNo x.
assume H2: SNoLev x :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume H3: forall w :e L, w < x.
assume H4: forall z :e R, x < z.
assume H5: forall u, SNo u -> (forall w :e L, w < u) -> (forall z :e R, u < z) -> SNoLev x c= SNoLev u /\ SNoEq_ (SNoLev x) x u.
set L_ : set -> set := fun n => {w' :e SNoS_ n|exists w :e L, w' <= w}.
set R_ : set -> set := fun n => {z' :e SNoS_ n|exists z :e R, z <= z'}.
set L' := \/_ n :e omega, L_ n.
set R' := \/_ n :e omega, R_ n.
set x' := SNoCut L' R'.
claim LL'L: forall w' :e L', exists w :e L, w' <= w.
{ let w'. assume Hw'.
  apply famunionE_impred omega L_ w' Hw'.
  let n.
  assume Hn: n :e omega.
  assume Hw'2: w' :e L_ n.
  exact SepE2 (SNoS_ n) (fun w' => exists w :e L, w' <= w) w' Hw'2.
}
claim LR'R: forall z' :e R', exists z :e R, z <= z'.
{ let z'. assume Hz'.
  apply famunionE_impred omega R_ z' Hz'.
  let n.
  assume Hn: n :e omega.
  assume Hz'2: z' :e R_ n.
  exact SepE2 (SNoS_ n) (fun z' => exists z :e R, z <= z') z' Hz'2.
}
claim LL'o: L' c= SNoS_ omega.
{ let w'. assume Hw'.
  apply famunionE_impred omega L_ w' Hw'.
  let n.
  assume Hn: n :e omega.
  assume Hw'2: w' :e L_ n.
  apply SNoS_E2 n (nat_p_ordinal n (omega_nat_p n Hn )) w' (SepE1 (SNoS_ n) (fun w' => exists w :e L, w' <= w) w' Hw'2).
  assume Hw'3: SNoLev w' :e n.
  assume Hw'4: ordinal (SNoLev w').
  assume Hw'5: SNo w'.
  assume Hw'6: SNo_ (SNoLev w') w'.
  apply SNoS_I omega omega_ordinal w' (SNoLev w').
  - prove SNoLev w' :e omega.
    exact omega_TransSet n Hn (SNoLev w') Hw'3.
  - exact Hw'6.
}
claim LR'o: R' c= SNoS_ omega.
{ let z'. assume Hz'.
  apply famunionE_impred omega R_ z' Hz'.
  let n.
  assume Hn: n :e omega.
  assume Hz'2: z' :e R_ n.
  apply SNoS_E2 n (nat_p_ordinal n (omega_nat_p n Hn )) z' (SepE1 (SNoS_ n) (fun z' => exists z :e R, z <= z') z' Hz'2).
  assume Hz'3: SNoLev z' :e n.
  assume Hz'4: ordinal (SNoLev z').
  assume Hz'5: SNo z'.
  assume Hz'6: SNo_ (SNoLev z') z'.
  apply SNoS_I omega omega_ordinal z' (SNoLev z').
  - prove SNoLev z' :e omega.
    exact omega_TransSet n Hn (SNoLev z') Hz'3.
  - exact Hz'6.
}
claim LL': forall w' :e L', SNo w'.
{ let w'. assume Hw'.
  apply SNoS_E2 omega omega_ordinal w' (LL'o w' Hw').
  assume _ _ H _. exact H.
}
claim LR': forall z :e R', SNo z.
{ let z'. assume Hz'.
  apply SNoS_E2 omega omega_ordinal z' (LR'o z' Hz').
  assume _ _ H _. exact H.
}
claim LLR': SNoCutP L' R'.
{ prove (forall w :e L', SNo w)
     /\ (forall z :e R', SNo z)
     /\ (forall w :e L', forall z :e R', w < z).
  apply and3I.
  - exact LL'.
  - exact LR'.
  - let w'. assume Hw'. let z'. assume Hz'.
    apply LL'L w' Hw'.
    let w. assume H. apply H.
    assume Hw: w :e L.
    assume Hw'w: w' <= w.
    apply LR'R z' Hz'.
    let z. assume H. apply H.
    assume Hz: z :e R.
    assume Hzz': z <= z'.
    prove w' < z'.
    apply SNoLeLt_tra w' w z' (LL' w' Hw') (HLR1 w Hw) (LR' z' Hz') Hw'w.
    prove w < z'.
    apply SNoLtLe_tra w z z' (HLR1 w Hw) (HLR2 z Hz) (LR' z' Hz').
    + prove w < z.
      apply HLR3.
      * exact Hw.
      * exact Hz.
    + prove z <= z'. exact Hzz'.
}
apply SNoCutP_SNoCut_impred L' R' LLR'.
assume H1': SNo x'.
assume H2': SNoLev x' :e ordsucc ((\/_ x :e L', ordsucc (SNoLev x)) :\/: (\/_ y :e R', ordsucc (SNoLev y))).
assume H3': forall w :e L', w < x'.
assume H4': forall z :e R', x' < z.
assume H5': forall u, SNo u -> (forall w :e L', w < u) -> (forall z :e R', u < z) -> SNoLev x' c= SNoLev u /\ SNoEq_ (SNoLev x') x' u.
claim L1: forall w :e L, exists w' :e L', w <= w'.
{ let w. assume Hw.
  apply real_E w (HL w Hw).
  assume Hw1: SNo w.
  assume Hw2: SNoLev w :e ordsucc omega.
  assume _ _ _ _ _.
  apply ordsuccE omega (SNoLev w) Hw2.
  - assume H6: SNoLev w :e omega.
    witness w. apply andI.
    + prove w :e L'.
      prove w :e famunion omega L_.
      apply famunionI omega L_ (ordsucc (SNoLev w)) w.
      * prove ordsucc (SNoLev w) :e omega.
        apply omega_ordsucc.
        exact H6.
      * { prove w :e {w' :e SNoS_ (ordsucc (SNoLev w))|exists w :e L, w' <= w}.
          apply SepI.
          - apply SNoS_SNoLev. exact Hw1.
          - prove exists u :e L, w <= u.
            witness w. apply andI.
            + exact Hw.
            + apply SNoLe_ref.
        }
    + apply SNoLe_ref.
  - assume H6: SNoLev w = omega.
    apply HL1 w Hw.
    let w'. assume H. apply H.
    assume Hw': w' :e L.
    assume Hww': w < w'.
    apply real_E w' (HL w' Hw').
    assume Hw'1: SNo w'.
    assume Hw'2: SNoLev w' :e ordsucc omega.
    assume _ _ _ _ _.
    apply ordsuccE omega (SNoLev w') Hw'2.
    + assume H7: SNoLev w' :e omega.
      witness w'. apply andI.
      * { prove w' :e L'.
          prove w' :e famunion omega L_.
          apply famunionI omega L_ (ordsucc (SNoLev w')) w'.
          - prove ordsucc (SNoLev w') :e omega.
            apply omega_ordsucc. exact H7.
          - prove w' :e {w' :e SNoS_ (ordsucc (SNoLev w'))|exists w :e L, w' <= w}.
            apply SepI.
            + apply SNoS_SNoLev. exact Hw'1.
            + prove exists u :e L, w' <= u.
              witness w'.
              apply andI.
              * exact Hw'.
              * apply SNoLe_ref.
        }
      * apply SNoLtLe. exact Hww'.
    + assume H7: SNoLev w' = omega.
      apply SNoLtE w w' Hw1 Hw'1 Hww'.
      * { let w''. rewrite H6.
          assume Hw''1: SNo w''.
          assume Hw''2: SNoLev w'' :e omega :/\: SNoLev w'.
          assume _ _.
          assume Hw''3: w < w''.
          assume Hw''4: w'' < w'.
          assume _ _.
          witness w''. apply andI.
          - prove w'' :e L'.
            prove w'' :e famunion omega L_.
            apply famunionI omega L_ (ordsucc (SNoLev w'')) w''.
            + prove ordsucc (SNoLev w'') :e omega.
              apply omega_ordsucc.
              exact binintersectE1 omega (SNoLev w') (SNoLev w'') Hw''2.
            + prove w'' :e {w' :e SNoS_ (ordsucc (SNoLev w''))|exists w :e L, w' <= w}.
              apply SepI.
              * apply SNoS_SNoLev. exact Hw''1.
              * { prove exists u :e L, w'' <= u.
                  witness w'.
                  apply andI.
                  - exact Hw'.
                  - apply SNoLtLe. exact Hw''4.
                }
          - prove w <= w''. apply SNoLtLe. exact Hw''3.
        }
      * rewrite H6. rewrite H7. assume H8: omega :e omega.
        prove False. exact In_irref omega H8.
      * rewrite H6. rewrite H7. assume H8: omega :e omega.
        prove False. exact In_irref omega H8.
}
claim L2: forall z :e R, exists z' :e R', z' <= z.
{ let z. assume Hz.
  apply real_E z (HR z Hz).
  assume Hz1: SNo z.
  assume Hz2: SNoLev z :e ordsucc omega.
  assume _ _ _ _ _.
  apply ordsuccE omega (SNoLev z) Hz2.
  - assume H6: SNoLev z :e omega.
    witness z. apply andI.
    + prove z :e R'.
      prove z :e famunion omega R_.
      apply famunionI omega R_ (ordsucc (SNoLev z)) z.
      * prove ordsucc (SNoLev z) :e omega.
        apply omega_ordsucc.
        exact H6.
      * { prove z :e {z' :e SNoS_ (ordsucc (SNoLev z))|exists z :e R, z <= z'}.
          apply SepI.
          - apply SNoS_SNoLev. exact Hz1.
          - prove exists u :e R, u <= z.
            witness z. apply andI.
            + exact Hz.
            + apply SNoLe_ref.
        }
    + apply SNoLe_ref.
  - assume H6: SNoLev z = omega.
    apply HR1 z Hz.
    let z'. assume H. apply H.
    assume Hz': z' :e R.
    assume Hz'z: z' < z.
    apply real_E z' (HR z' Hz').
    assume Hz'1: SNo z'.
    assume Hz'2: SNoLev z' :e ordsucc omega.
    assume _ _ _ _ _.
    apply ordsuccE omega (SNoLev z') Hz'2.
    + assume H7: SNoLev z' :e omega.
      witness z'. apply andI.
      * { prove z' :e R'.
          prove z' :e famunion omega R_.
          apply famunionI omega R_ (ordsucc (SNoLev z')) z'.
          - prove ordsucc (SNoLev z') :e omega.
            apply omega_ordsucc. exact H7.
          - prove z' :e {z' :e SNoS_ (ordsucc (SNoLev z'))|exists z :e R, z <= z'}.
            apply SepI.
            + apply SNoS_SNoLev. exact Hz'1.
            + prove exists u :e R, u <= z'.
              witness z'.
              apply andI.
              * exact Hz'.
              * apply SNoLe_ref.
        }
      * apply SNoLtLe. exact Hz'z.
    + assume H7: SNoLev z' = omega.
      apply SNoLtE z' z Hz'1 Hz1 Hz'z.
      * { let z''. rewrite H7.
          assume Hz''1: SNo z''.
          assume Hz''2: SNoLev z'' :e omega :/\: SNoLev z.
          assume _ _.
          assume Hz''3: z' < z''.
          assume Hz''4: z'' < z.
          assume _ _.
          witness z''. apply andI.
          - prove z'' :e R'.
            prove z'' :e famunion omega R_.
            apply famunionI omega R_ (ordsucc (SNoLev z'')) z''.
            + prove ordsucc (SNoLev z'') :e omega.
              apply omega_ordsucc.
              exact binintersectE1 omega (SNoLev z) (SNoLev z'') Hz''2.
            + prove z'' :e {z' :e SNoS_ (ordsucc (SNoLev z''))|exists z :e R, z <= z'}.
              apply SepI.
              * apply SNoS_SNoLev. exact Hz''1.
              * { prove exists u :e R, u <= z''.
                  witness z'.
                  apply andI.
                  - exact Hz'.
                  - apply SNoLtLe. exact Hz''3.
                }
          - prove z'' <= z. apply SNoLtLe. exact Hz''4.
        }
      * rewrite H6. rewrite H7. assume H8: omega :e omega.
        prove False. exact In_irref omega H8.
      * rewrite H6. rewrite H7. assume H8: omega :e omega.
        prove False. exact In_irref omega H8.
}
claim L3: L' <> 0.
{ assume H6: L' = 0.
  apply HL0.
  prove L = 0.
  apply Empty_eq.
  let w. assume Hw: w :e L.
  apply L1 w Hw.
  let w'. assume H. apply H.
  assume Hw': w' :e L'.
  prove False.
  apply EmptyE w'.
  prove w' :e 0. rewrite <- H6. exact Hw'.
}
claim L4: R' <> 0.
{ assume H6: R' = 0.
  apply HR0.
  prove R = 0.
  apply Empty_eq.
  let z. assume Hz: z :e R.
  apply L2 z Hz.
  let z'. assume H. apply H.
  assume Hz': z' :e R'.
  prove False. apply EmptyE z'.
  prove z' :e 0.
  rewrite <- H6. exact Hz'.
}
claim L5: forall w :e L', exists w' :e L', w < w'.
{ let w. assume Hw.
  apply LL'L w Hw.
  let u. assume H. apply H.
  assume Hu: u :e L.
  assume Hwu: w <= u.
  apply HL1 u Hu.
  let v. assume H. apply H.
  assume Hv: v :e L.
  assume Huv: u < v.
  apply L1 v Hv.
  let w'. assume H. apply H.
  assume Hw': w' :e L'.
  assume Hvw': v <= w'.
  witness w'. apply andI.
  - exact Hw'.
  - prove w < w'.
    apply SNoLeLt_tra w u w' (LL' w Hw) (HLR1 u Hu) (LL' w' Hw') Hwu.
    prove u < w'.
    exact SNoLtLe_tra u v w' (HLR1 u Hu) (HLR1 v Hv) (LL' w' Hw') Huv Hvw'.
}
claim L6: forall z :e R', exists z' :e R', z' < z.
{ let z. assume Hz.
  apply LR'R z Hz.
  let u. assume H. apply H.
  assume Hu: u :e R.
  assume Huz: u <= z.
  apply HR1 u Hu.
  let v. assume H. apply H.
  assume Hv: v :e R.
  assume Hvu: v < u.
  apply L2 v Hv.
  let z'. assume H. apply H.
  assume Hz': z' :e R'.
  assume Hz'v: z' <= v.
  witness z'. apply andI.
  - exact Hz'.
  - prove z' < z.
    apply SNoLeLt_tra z' v z (LR' z' Hz') (HLR2 v Hv) (LR' z Hz) Hz'v.
    prove v < z.
    exact SNoLtLe_tra v u z (HLR2 v Hv) (HLR2 u Hu) (LR' z Hz) Hvu Huz.
}
claim Lxx': x = x'.
{ apply SNoCut_ext.
  - exact HLR.
  - exact LLR'.
  - let w. assume Hw: w :e L.
    prove w < x'.
    apply L1 w Hw.
    let w'. assume H. apply H.
    assume Hw': w' :e L'.
    assume Hww': w <= w'.
    apply SNoLeLt_tra w w' x'.
    + prove SNo w. exact HLR1 w Hw.
    + prove SNo w'. exact LL' w' Hw'.
    + prove SNo x'. exact H1'.
    + exact Hww'.
    + prove w' < x'. apply H3'.
      prove w' :e L'. exact Hw'.
  - let z. assume Hz: z :e R.
    prove x' < z.
    apply L2 z Hz.
    let z'. assume H. apply H.
    assume Hz': z' :e R'.
    assume Hz'z: z' <= z.
    prove x' < z.
    exact SNoLtLe_tra x' z' z H1' (LR' z' Hz') (HLR2 z Hz) (H4' z' Hz') Hz'z.
  - let w. assume Hw: w :e L'.
    prove w < x.
    apply LL'L w Hw.
    let u. assume H. apply H.
    assume Hu: u :e L.
    assume Hwu: w <= u.
    exact SNoLeLt_tra w u x (LL' w Hw) (HLR1 u Hu) H1 Hwu (H3 u Hu).
  - let z. assume Hz: z :e R'.
    prove x < z.
    apply LR'R z Hz.
    let u. assume H. apply H.
    assume Hu: u :e R.
    assume Huz: u <= z.
    exact SNoLtLe_tra x u z H1 (HLR2 u Hu) (LR' z Hz) (H4 u Hu) Huz.
}
prove x :e real.
rewrite Lxx'.
prove x' :e real.
exact real_SNoCut_SNoS_omega L' LL'o R' LR'o LLR' L3 L4 L5 L6.
Qed.

Theorem minus_SNo_prereal_1 : forall x, SNo x ->
    (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
 -> (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - - x) < eps_ k) -> q = - x).
let x. assume Hx H1. let q.
assume Hq1: q :e SNoS_ omega.
rewrite minus_SNo_invol x Hx.
assume Hq2: forall k :e omega, abs_SNo (q + x) < eps_ k.
prove q = - x.
apply SNoS_E2 omega omega_ordinal q Hq1.
assume Hq1a Hq1b Hq1c Hq1d.
rewrite <- minus_SNo_invol q Hq1c.
prove - - q = - x.
f_equal.
prove - q = x.
apply H1 (- q) (minus_SNo_SNoS_omega q Hq1).
let k. assume Hk.
prove abs_SNo (- q + - x) < eps_ k.
rewrite abs_SNo_dist_swap (- q) x (SNo_minus_SNo q Hq1c) Hx.
prove abs_SNo (x + - - q) < eps_ k.
rewrite minus_SNo_invol q Hq1c.
prove abs_SNo (x + q) < eps_ k.
rewrite add_SNo_com x q Hx Hq1c.
prove abs_SNo (q + x) < eps_ k.
exact Hq2 k Hk.
Qed.

Theorem minus_SNo_prereal_2 : forall x, SNo x ->
    (forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k)
 -> (forall k :e omega, exists q :e SNoS_ omega, q < - x /\ - x < q + eps_ k).
let x. assume Hx H1. let k. assume Hk.
apply H1 k Hk. let q. assume Hq. apply Hq.
assume Hq1: q :e SNoS_ omega.
assume Hq. apply Hq.
assume Hq2: q < x.
assume Hq3: x < q + eps_ k.
apply SNoS_E2 omega omega_ordinal q Hq1.
assume Hq1a Hq1b Hq1c Hq1d.
claim Lqk: SNo (q + eps_ k).
{ exact SNo_add_SNo q (eps_ k) Hq1c (SNo_eps_ k Hk). }
witness (- (q + eps_ k)). apply andI.
- exact minus_SNo_SNoS_omega (q + eps_ k) (add_SNo_SNoS_omega q Hq1 (eps_ k) (SNo_eps_SNoS_omega k Hk)).
- apply andI.
  + prove - (q + eps_ k) < - x.
    apply minus_SNo_Lt_contra x (q + eps_ k) Hx Lqk.
    prove x < q + eps_ k.
    exact Hq3.
  + prove - x < - (q + eps_ k) + eps_ k.
    rewrite minus_add_SNo_distr q (eps_ k) Hq1c (SNo_eps_ k Hk).
    prove - x < (- q + - eps_ k) + eps_ k.
    rewrite add_SNo_minus_R2' (- q) (eps_ k) (SNo_minus_SNo q Hq1c) (SNo_eps_ k Hk).
    prove - x < - q.
    apply minus_SNo_Lt_contra q x Hq1c Hx.
    prove q < x.
    exact Hq2.
Qed.

Theorem SNo_prereal_incr_lower_pos: forall x, SNo x -> 0 < x
 -> (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
 -> (forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k)
 -> forall k :e omega,
     forall p:prop,
         (forall q :e SNoS_ omega, 0 < q -> q < x -> x < q + eps_ k -> p)
      -> p.
let x. assume Hx Hx0 Hx2 Hx3.
let k. assume Hk. let p. assume Hp.
apply Hx3 k Hk.
let q. assume H. apply H.
assume Hq1: q :e SNoS_ omega. assume H. apply H.
assume Hq2: q < x.
assume Hq3: x < q + eps_ k.
apply SNoS_E2 omega omega_ordinal q Hq1.
assume Hq1a Hq1b Hq1c Hq1d.
apply SNoLtLe_or 0 q SNo_0 Hq1c.
- assume H1: 0 < q. exact Hp q Hq1 H1 Hq2 Hq3.
- assume H1: q <= 0.
  apply xm (forall k' :e omega, x < eps_ k').
  + assume H2: forall k' :e omega, x < eps_ k'. prove False.
    claim L1: 0 = x.
    { apply Hx2 0 (omega_SNoS_omega 0 (nat_p_omega 0 nat_0)).
      let k'. assume Hk': k' :e omega.
      prove abs_SNo (0 + - x) < eps_ k'.
      rewrite add_SNo_0L (- x) (SNo_minus_SNo x Hx).
      prove abs_SNo (- x) < eps_ k'.
      rewrite abs_SNo_minus x Hx.
      prove abs_SNo x < eps_ k'.
      rewrite pos_abs_SNo x Hx0.
      exact H2 k' Hk'.
    }
    apply SNoLt_irref x.
    prove x < x. rewrite <- L1 at 1. exact Hx0.
  + assume H2: ~(forall k' :e omega, x < eps_ k').
    apply dneg.
    assume H3: ~p.
    apply H2.
    let k'. assume Hk': k' :e omega.
    apply SNoLtLe_or x (eps_ k') Hx (SNo_eps_ k' Hk').
    * assume H4: x < eps_ k'. exact H4.
    * { assume H4: eps_ k' <= x.
        claim Lek': SNo (eps_ k').
        { apply SNo_eps_.
          exact Hk'.
        }
        claim LeSk': SNo (eps_ (ordsucc k')).
        { apply SNo_eps_.
          apply omega_ordsucc.
          exact Hk'.
        }
        claim LeSk'pos: 0 < eps_ (ordsucc k').
        { apply SNo_eps_pos.
          apply omega_ordsucc.
          exact Hk'.
        }
        apply H3.
        apply Hp (eps_ (ordsucc k')).
        - prove eps_ (ordsucc k') :e SNoS_ omega.
          apply SNo_eps_SNoS_omega.
          apply omega_ordsucc.
          exact Hk'.
        - prove 0 < eps_ (ordsucc k'). exact LeSk'pos.
        - prove eps_ (ordsucc k') < x.
          apply SNoLtLe_tra (eps_ (ordsucc k')) (eps_ k') x LeSk' Lek' Hx.
          + prove eps_ (ordsucc k') < eps_ k'.
            exact SNo_eps_decr (ordsucc k') (omega_ordsucc k' Hk') k' (ordsuccI2 k').
          + prove eps_ k' <= x. exact H4.
        - prove x < eps_ (ordsucc k') + eps_ k.
          claim L2: q < eps_ (ordsucc k').
          { apply SNoLeLt_tra q 0 (eps_ (ordsucc k')) Hq1c SNo_0 LeSk'.
            - prove q <= 0. exact H1.
            - prove 0 < eps_ (ordsucc k'). exact LeSk'pos.
          }
          apply SNoLt_tra x (q + eps_ k) (eps_ (ordsucc k') + eps_ k)
                          Hx
                          (SNo_add_SNo q (eps_ k) Hq1c (SNo_eps_ k Hk))
                          (SNo_add_SNo (eps_ (ordsucc k')) (eps_ k) LeSk' (SNo_eps_ k Hk)).
          + prove x < q + eps_ k. exact Hq3.
          + prove q + eps_ k < eps_ (ordsucc k') + eps_ k.
            apply add_SNo_Lt1 q (eps_ k) (eps_ (ordsucc k')) Hq1c (SNo_eps_ k Hk) LeSk'.
            prove q < eps_ (ordsucc k').
            exact L2.
      }
Qed.

Theorem real_minus_SNo : forall x :e real, - x :e real.
let x. assume Hx. apply real_E x Hx.
assume Hx1 Hx2 Hx3 Hx4 Hx5 Hx6 Hx7.
apply real_I.
- prove - x :e SNoS_ (ordsucc omega).
  exact minus_SNo_SNoS_ (ordsucc omega) ordsucc_omega_ordinal x Hx3.
- prove - x <> omega.
  assume H1: - x = omega.
  apply SNoLt_irref x.
  prove x < x.
  rewrite <- minus_SNo_invol x Hx1 at 1.
  prove - - x < x. rewrite H1.
  prove - omega < x. exact Hx4.
- prove - x <> - omega.
  assume H1: - x = - omega.
  apply SNoLt_irref x.
  prove x < x.
  rewrite <- minus_SNo_invol x Hx1 at 2.
  prove x < - - x.
  rewrite H1.
  prove x < - - omega.
  rewrite minus_SNo_invol omega SNo_omega.
  prove x < omega. exact Hx5.
- prove forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - - x) < eps_ k) -> q = - x.
  exact minus_SNo_prereal_1 x Hx1 Hx6.
Qed.

Theorem SNo_prereal_incr_lower_approx: forall x, SNo x ->
    (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
 -> (forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k)
 -> exists f :e SNoS_ omega :^: omega,
       forall n :e omega, f n < x /\ x < f n + eps_ n
                       /\ forall i :e n, f i < f n.
let x. assume H1 H2 H3.
set f' : set -> set
 := nat_primrec (Eps_i (fun q => q :e SNoS_ omega /\ q < x /\ x < q + eps_ 0))
                (fun n r => (Eps_i (fun q => q :e SNoS_ omega /\ q < x /\ x < q + eps_ (ordsucc n) /\ r < q))).
set f := fun n :e omega => f' n.
claim Lf'0: f' 0 = Eps_i (fun q => q :e SNoS_ omega /\ q < x /\ x < q + eps_ 0).
{ exact nat_primrec_0
                (Eps_i (fun q => q :e SNoS_ omega /\ q < x /\ x < q + eps_ 0))
                (fun n r => (Eps_i (fun q => q :e SNoS_ omega /\ q < x /\ x < q + eps_ (ordsucc n) /\ r < q))).
}
claim Lf'0b: f' 0 :e SNoS_ omega /\ f' 0 < x /\ x < f' 0 + eps_ 0.
{ rewrite Lf'0.
  apply Eps_i_ex (fun q => q :e SNoS_ omega /\ q < x /\ x < q + eps_ 0).
  prove exists q, q :e SNoS_ omega /\ q < x /\ x < q + eps_ 0.
  apply H3 0 (nat_p_omega 0 nat_0).
  let q. assume Hq. apply Hq.
  assume Hq1 Hq. apply Hq.
  assume Hq2 Hq3.
  witness q.
  apply and3I.
  - exact Hq1.
  - exact Hq2.
  - exact Hq3.
}
claim Lf'S: forall n, nat_p n -> f' (ordsucc n) = Eps_i (fun q => q :e SNoS_ omega /\ q < x /\ x < q + eps_ (ordsucc n) /\ f' n < q).
{ exact nat_primrec_S
                (Eps_i (fun q => q :e SNoS_ omega /\ q < x /\ x < q + eps_ 0))
                (fun n r => (Eps_i (fun q => q :e SNoS_ omega /\ q < x /\ x < q + eps_ (ordsucc n) /\ r < q))).
}
claim L1: forall n, nat_p n -> f' n :e SNoS_ omega /\ f' n < x /\ x < f' n + eps_ n /\ forall i :e n, SNo (f i) -> f i < f' n.
{ apply nat_ind.
  - prove f' 0 :e SNoS_ omega /\ f' 0 < x /\ x < f' 0 + eps_ 0 /\ forall i :e 0, SNo (f i) -> f i < f' 0.
    apply Lf'0b. assume H H6. apply H. assume H4 H5.
    apply and4I.
    + exact H4.
    + exact H5.
    + exact H6.
    + let i. assume Hi. prove False. exact EmptyE i Hi.
  - let n. assume Hn.
    assume IHn: f' n :e SNoS_ omega /\ f' n < x /\ x < f' n + eps_ n /\ forall i :e n, SNo (f i) -> f i < f' n.
    prove f' (ordsucc n) :e SNoS_ omega /\ f' (ordsucc n) < x /\ x < f' (ordsucc n) + eps_ (ordsucc n)
       /\ forall i :e ordsucc n, SNo (f i) -> f i < f' (ordsucc n).
    apply IHn. assume IHn123 IHn4. apply IHn123. assume IHn12 IHn3. apply IHn12. assume IHn1 IHn2.
    apply SNoS_E2 omega omega_ordinal (f' n) IHn1.
    assume _ _.
    assume IHn1c: SNo (f' n).
    assume _.
    claim L1b: exists q, q :e SNoS_ omega /\ q < x /\ x < q + eps_ (ordsucc n) /\ f' n < q.
    { apply H3 (ordsucc n) (nat_p_omega (ordsucc n) (nat_ordsucc n Hn)).
      let q. assume Hq. apply Hq.
      assume Hq1 Hq. apply Hq.
      assume Hq2 Hq3.
      apply SNoS_E2 omega omega_ordinal q Hq1.
      assume Hq1a Hq1b Hq1c Hq1d.
      apply SNoLtLe_or (f' n) q IHn1c Hq1c.
      - assume H4: f' n < q.
        witness q. apply and4I.
	+ exact Hq1.
	+ exact Hq2.
	+ exact Hq3.
	+ exact H4.
      - assume H4: q <= f' n.
        claim L1ba: SNo (- f' n).
	{ exact SNo_minus_SNo (f' n) IHn1c. }
        claim L1bb: SNo (x + - f' n).
	{ exact SNo_add_SNo x (- f' n) H1 L1ba. }
	claim L1bc: SNo (eps_ (ordsucc n)).
	{ exact SNo_eps_ (ordsucc n) (omega_ordsucc n (nat_p_omega n Hn)). }
        apply xm (exists k :e omega, eps_ k <= x + - f' n).
	+ assume H5. apply H5. let k. assume H5. apply H5.
	  assume Hk1: k :e omega.
	  assume Hk2: eps_ k <= x + - f' n.
	  witness (f' n + eps_ (ordsucc k)).
          claim Lk1: ordsucc k :e omega.
	  { exact omega_ordsucc k Hk1. }
          claim Lk2: SNo (eps_ (ordsucc k)).
	  { exact SNo_eps_ (ordsucc k) Lk1. }
	  claim Lk3: f' n + eps_ (ordsucc k) :e SNoS_ omega.
	  { exact add_SNo_SNoS_omega (f' n) IHn1 (eps_ (ordsucc k)) (SNo_eps_SNoS_omega (ordsucc k) (omega_ordsucc k Hk1)). }
	  apply SNoS_E2 omega omega_ordinal (f' n + eps_ (ordsucc k)) Lk3.
	  assume _ _.
	  assume H6: SNo (f' n + eps_ (ordsucc k)).
	  assume _.
	  apply and4I.
	  * exact Lk3.
	  * { prove f' n + eps_ (ordsucc k) < x.
	      apply SNoLtLe_tra (f' n + eps_ (ordsucc k)) (f' n + eps_ k) x.
	      - exact H6.
	      - exact SNo_add_SNo (f' n) (eps_ k) IHn1c (SNo_eps_ k Hk1).
	      - exact H1.
	      - prove f' n + eps_ (ordsucc k) < f' n + eps_ k.
	        apply add_SNo_Lt2 (f' n) (eps_ (ordsucc k)) (eps_ k) IHn1c Lk2 (SNo_eps_ k Hk1).
		prove eps_ (ordsucc k) < eps_ k.
		apply SNo_eps_decr.
		+ prove ordsucc k :e omega. exact Lk1.
		+ prove k :e ordsucc k. apply ordsuccI2.
	      - prove f' n + eps_ k <= x.
	        apply add_SNo_minus_L2' (f' n) x IHn1c H1 (fun u v => f' n + eps_ k <= u).
		prove f' n + eps_ k <= f' n + (- f' n + x).
		rewrite add_SNo_com (- f' n) x L1ba H1.
		prove f' n + eps_ k <= f' n + (x + - f' n).
		exact add_SNo_Le2 (f' n) (eps_ k) (x + - f' n) IHn1c (SNo_eps_ k Hk1) L1bb Hk2.
	    }
	  * { prove x < (f' n + eps_ (ordsucc k)) + eps_ (ordsucc n).
	      rewrite add_SNo_com_3b_1_2 (f' n) (eps_ (ordsucc k)) (eps_ (ordsucc n))
	                  IHn1c Lk2 L1bc.
              prove x < (f' n + eps_ (ordsucc n)) + eps_ (ordsucc k).
	      apply add_SNo_eps_Lt' x (f' n + eps_ (ordsucc n)) H1 (SNo_add_SNo (f' n) (eps_ (ordsucc n)) IHn1c L1bc) (ordsucc k) Lk1.
	      prove x < f' n + eps_ (ordsucc n).
	      apply SNoLtLe_tra x (q + (eps_ (ordsucc n))).
	      - exact H1.
	      - exact SNo_add_SNo q (eps_ (ordsucc n)) Hq1c L1bc.
	      - exact SNo_add_SNo (f' n) (eps_ (ordsucc n)) IHn1c L1bc.
	      - prove x < q + eps_ (ordsucc n). exact Hq3.
	      - prove q + eps_ (ordsucc n) <= f' n + eps_ (ordsucc n).
	        exact add_SNo_Le1 q (eps_ (ordsucc n)) (f' n) Hq1c L1bc IHn1c H4.
	    }
	  * prove f' n < f' n + eps_ (ordsucc k).
	    exact add_SNo_eps_Lt (f' n) IHn1c (ordsucc k) (omega_ordsucc k Hk1).
	+ assume H5: ~(exists k :e omega, eps_ k <= x + - f' n).
	  prove False.
	  apply SNoLt_irref x.
	  prove x < x.
	  claim L1bd: 0 < x + - f' n.
	  { apply add_SNo_Lt1_cancel 0 (f' n) (x + - f' n) SNo_0 IHn1c L1bb.
	    prove 0 + f' n < (x + - f' n) + f' n.
	    rewrite add_SNo_0L (f' n) IHn1c.
	    rewrite add_SNo_minus_R2' x (f' n) H1 IHn1c.
	    prove f' n < x. exact IHn2.
	  }
	  claim L1be: f' n = x.
          { apply H2 (f' n) IHn1.
	    let k. assume Hk.
	    prove abs_SNo (f' n + - x) < eps_ k.
	    apply SNoLtLe_or (x + - f' n) (eps_ k) L1bb (SNo_eps_ k Hk).
	    - assume H6: x + - f' n < eps_ k.
	      prove abs_SNo (f' n + - x) < eps_ k.
	      rewrite abs_SNo_dist_swap (f' n) x IHn1c H1.
	      prove abs_SNo (x + - f' n) < eps_ k.
	      rewrite pos_abs_SNo (x + - f' n) L1bd. exact H6.
	    - assume H6: eps_ k <= x + - f' n.
              apply H5. witness k. apply andI.
	      + exact Hk.
	      + exact H6.
	  }
	  rewrite <- L1be at 1.
	  exact IHn2.
    }
    claim L1c: f' (ordsucc n) :e SNoS_ omega /\ f' (ordsucc n) < x /\ x < f' (ordsucc n) + eps_ (ordsucc n) /\ f' n < f' (ordsucc n).
    { rewrite Lf'S n Hn.
      exact Eps_i_ex (fun q => q :e SNoS_ omega /\ q < x /\ x < q + eps_ (ordsucc n) /\ f' n < q) L1b.
    }
    apply L1c. assume H H7. apply H. assume H H6. apply H. assume H4 H5.
    apply and4I.
    + exact H4.
    + exact H5.
    + exact H6.
    + let i. assume Hi: i :e ordsucc n. assume Hfi: SNo (f i).
      apply ordsuccE n i Hi.
      * { assume H8: i :e n.
          prove f i < f' (ordsucc n).
	  apply SNoLt_tra (f i) (f' n) (f' (ordsucc n)).
	  - prove SNo (f i). exact Hfi.
	  - exact IHn1c.
	  - apply SNoS_E2 omega omega_ordinal (f' (ordsucc n)) H4. assume _ _ H9 _. exact H9.
          - apply IHn. assume _.
	    assume IHn4: forall i :e n, SNo (f i) -> f i < f' n.
            exact IHn4 i H8 Hfi.
	  - exact H7.
        }
      * assume H8: i = n. rewrite H8.
        prove f n < f' (ordsucc n).
	rewrite beta omega f' n (nat_p_omega n Hn).
        exact H7.
}
claim L2: forall n :e omega, f' n :e SNoS_ omega /\ f n < x /\ x < f n + eps_ n /\ forall i :e n, SNo (f i) -> f i < f n.
{ let n. assume Hn.
  exact beta omega f' n Hn
         (fun u v => f' n :e SNoS_ omega /\ v < x /\ x < v + eps_ n /\ forall i :e n, SNo (f i) -> f i < v)
	 (L1 n (omega_nat_p n Hn)).
}
witness f.
apply andI.
- prove (fun n :e omega => f' n) :e Pi_ n :e omega, SNoS_ omega.
  apply lam_Pi.
  let n. assume Hn.
  apply L2 n Hn. assume H _. apply H. assume H _.
  apply H. assume H _. exact H.
- let n. assume Hn. apply L2 n Hn. assume H H7.
  apply H. assume H H6. apply H. assume H4 H5.
  apply and3I.
  + exact H5.
  + exact H6.
  + let i. assume Hi: i :e n.
    apply H7 i Hi.
    prove SNo (f i).
    claim Li: i :e omega.
    { exact nat_p_omega i (nat_p_trans n (omega_nat_p n Hn) i Hi). }
    rewrite beta omega f' i Li.
    prove SNo (f' i).
    apply L2 i Li.
    assume H _. apply H. assume H _. apply H.
    assume H8: f' i :e SNoS_ omega.
    assume _.
    apply SNoS_E2 omega omega_ordinal (f' i) H8.
    assume _ _ H9 _.
    prove SNo (f' i).
    exact H9.
Qed.

Theorem SNo_prereal_decr_upper_approx: forall x, SNo x ->
    (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
 -> (forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k)
 -> exists g :e SNoS_ omega :^: omega,
       forall n :e omega, g n + - eps_ n < x /\ x < g n
                       /\ forall i :e n, g n < g i.
let x. assume H1 H2 H3.
claim L1: SNo (- x).
{ exact SNo_minus_SNo x H1. }
apply SNo_prereal_incr_lower_approx (- x) L1
       (minus_SNo_prereal_1 x H1 H2)
       (minus_SNo_prereal_2 x H1 H3).
let f. assume Hf. apply Hf.
assume Hf1: f :e SNoS_ omega :^: omega.
assume Hf2: forall n :e omega, f n < - x /\ - x < f n + eps_ n
                       /\ forall i :e n, f i < f n.
claim Lf: forall n :e omega, SNo (f n).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (f n) (ap_Pi omega (fun _ => SNoS_ omega) f n Hf1 Hn).
  assume _ _ H _. exact H.
}
set g := fun n :e omega => - f n.
witness g.
apply andI.
- prove g :e SNoS_ omega :^: omega.
  prove (fun n :e omega => - f n) :e Pi_ _ :e omega, SNoS_ omega.
  apply lam_Pi. let n. assume Hn.
  prove - f n :e SNoS_ omega.
  apply minus_SNo_SNoS_omega.
  prove f n :e SNoS_ omega.
  exact ap_Pi omega (fun _ => SNoS_ omega) f n Hf1 Hn.
- let n. assume Hn.
  prove g n + - eps_ n < x /\ x < g n /\ forall i :e n, g n < g i.
  claim L1: - f n + - eps_ n < x /\ x < - f n /\ forall i :e n, - f n < g i.
  { apply Hf2 n Hn.
    assume H. apply H.
    assume Hf2a: f n < - x.
    assume Hf2b: - x < f n + eps_ n.
    assume Hf2c: forall i :e n, f i < f n.
    apply and3I.
    - prove - f n + - eps_ n < x.
      rewrite <- minus_add_SNo_distr (f n) (eps_ n) (Lf n Hn) (SNo_eps_ n Hn).
      prove - (f n + eps_ n) < x.
      apply minus_SNo_Lt_contra1 x (f n + eps_ n) H1 (SNo_add_SNo (f n) (eps_ n) (Lf n Hn) (SNo_eps_ n Hn)).
      prove - x < f n + eps_ n.
      exact Hf2b.
    - prove x < - f n.
      apply minus_SNo_Lt_contra2 (f n) x (Lf n Hn) H1.
      prove f n < - x.
      exact Hf2a.
    - let i. assume Hi.
      claim Li: i :e omega.
      { exact nat_p_omega i (nat_p_trans n (omega_nat_p n Hn) i Hi). }
      rewrite beta omega (fun n => - f n) i Li.
      prove - f n < - f i.
      apply minus_SNo_Lt_contra (f i) (f n) (Lf i Li) (Lf n Hn).
      exact Hf2c i Hi.
  }
  claim L2: g n = - f n.
  { exact beta omega (fun n => - f n) n Hn. }
  exact L2 (fun u v => v + - eps_ n < x /\ x < v /\ forall i :e n, v < g i) L1.
Qed.

Theorem SNoCutP_SNoCut_lim : forall lambda, ordinal lambda
 -> (forall alpha :e lambda, ordsucc alpha :e lambda)
 -> forall L R c= SNoS_ lambda, SNoCutP L R
 -> SNoLev (SNoCut L R) :e ordsucc lambda.
let lambda. assume Hl1 Hl2.
let L. assume HL. let R. assume HR HLR.
claim L1: forall x :e L, SNoLev x :e lambda.
{ let x. assume Hx.
  apply SNoS_E2 lambda Hl1 x (HL x Hx).
  assume H _ _ _. exact H.
}
claim L2: forall y :e R, SNoLev y :e lambda.
{ let y. assume Hy.
  apply SNoS_E2 lambda Hl1 y (HR y Hy).
  assume H _ _ _. exact H.
}
claim L3: ordinal ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
{ apply ordinal_binunion.
  - apply ordinal_famunion.
    let x. assume Hx.
    apply SNoS_E2 lambda Hl1 x (HL x Hx).
    assume _ H _ _.
    prove ordinal (ordsucc (SNoLev x)).
    apply ordinal_ordsucc.
    prove ordinal (SNoLev x). exact H.
  - apply ordinal_famunion.
    let y. assume Hy.
    apply SNoS_E2 lambda Hl1 y (HR y Hy).
    assume _ H _ _.
    prove ordinal (ordsucc (SNoLev y)).
    apply ordinal_ordsucc.
    prove ordinal (SNoLev y). exact H.
}
claim L4: ordinal (ordsucc lambda).
{ apply ordinal_ordsucc. exact Hl1. }
claim L5: ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))) c= ordsucc lambda.
{ apply ordinal_ordsucc_In_Subq.
  - prove ordinal (ordsucc lambda). exact L4.
  - prove ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))) :e ordsucc lambda.
    apply ordinal_In_Or_Subq ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))) (ordsucc lambda) L3 L4.
    + assume H1. exact H1.
    + assume H1: ordsucc lambda c= ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
      prove False.
      apply binunionE (\/_ x :e L, ordsucc (SNoLev x)) (\/_ y :e R, ordsucc (SNoLev y)) lambda (H1 lambda (ordsuccI2 lambda)).
      * assume H2: lambda :e \/_ x :e L, ordsucc (SNoLev x).
        apply famunionE_impred L (fun x => ordsucc (SNoLev x)) lambda H2.
        let x. assume Hx: x :e L.
        assume H3: lambda :e ordsucc (SNoLev x).
        apply In_no2cycle lambda (ordsucc (SNoLev x)) H3.
        prove ordsucc (SNoLev x) :e lambda.
        apply Hl2. exact L1 x Hx.
      * assume H2: lambda :e \/_ y :e R, ordsucc (SNoLev y).
        apply famunionE_impred R (fun y => ordsucc (SNoLev y)) lambda H2.
        let y. assume Hy: y :e R.
        assume H3: lambda :e ordsucc (SNoLev y).
        apply In_no2cycle lambda (ordsucc (SNoLev y)) H3.
        prove ordsucc (SNoLev y) :e lambda.
        apply Hl2. exact L2 y Hy.
}
apply SNoCutP_SNoCut_impred L R HLR.
assume H1: SNo (SNoCut L R).
assume H2: SNoLev (SNoCut L R) :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume _ _ _.
exact L5 (SNoLev (SNoCut L R)) H2.
Qed.

Theorem SNoCutP_SNoCut_omega : forall L R c= SNoS_ omega, SNoCutP L R
 -> SNoLev (SNoCut L R) :e ordsucc omega.
exact SNoCutP_SNoCut_lim omega omega_ordinal omega_ordsucc.
Qed.

Theorem SNo_approx_real_lem:
  forall f g :e SNoS_ omega :^: omega,
     (forall n m :e omega, f n < g m)
  -> forall p:prop,
         (SNoCutP {f n|n :e omega} {g n|n :e omega}
       -> SNo (SNoCut {f n|n :e omega} {g n|n :e omega})
       -> SNoLev (SNoCut {f n|n :e omega} {g n|n :e omega}) :e ordsucc omega
       -> SNoCut {f n|n :e omega} {g n|n :e omega} :e SNoS_ (ordsucc omega)
       -> (forall n :e omega, f n < SNoCut {f n|n :e omega} {g n|n :e omega})
       -> (forall n :e omega, SNoCut {f n|n :e omega} {g n|n :e omega} < g n)
       -> p)
      -> p.
let f. assume Hf1. let g. assume Hg1 Hfg.
let p. assume Hp.
set L := {f n|n :e omega}.
set R := {g n|n :e omega}.
set x := SNoCut L R.
claim Lf: forall n :e omega, SNo (f n).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (f n) (ap_Pi omega (fun _ => SNoS_ omega) f n Hf1 Hn).
  assume _ _ H _. exact H.
}
claim Lg: forall n :e omega, SNo (g n).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (g n) (ap_Pi omega (fun _ => SNoS_ omega) g n Hg1 Hn).
  assume _ _ H _. exact H.
}
claim L1: SNoCutP L R.
{ prove (forall w :e L, SNo w)
     /\ (forall z :e R, SNo z)
     /\ (forall w :e L, forall z :e R, w < z).
  apply and3I.
  - let w. assume Hw: w :e L.
    apply ReplE_impred omega (fun n => f n) w Hw.
    let n. assume Hn.
    assume Hwn: w = f n.
    rewrite Hwn.
    prove SNo (f n).
    exact Lf n Hn.
  - let z. assume Hz: z :e R.
    apply ReplE_impred omega (fun n => g n) z Hz.
    let m. assume Hm.
    assume Hzm: z = g m.
    rewrite Hzm.
    prove SNo (g m).
    exact Lg m Hm.
  - let w. assume Hw: w :e L.
    let z. assume Hz: z :e R.
    apply ReplE_impred omega (fun n => f n) w Hw.
    let n. assume Hn.
    assume Hwn: w = f n.
    rewrite Hwn.
    apply ReplE_impred omega (fun n => g n) z Hz.
    let m. assume Hm.
    assume Hzm: z = g m.
    rewrite Hzm.
    prove f n < g m.
    exact Hfg n Hn m Hm.
}
apply SNoCutP_SNoCut_impred L R L1.
assume HLR1: SNo x.
assume HLR2: SNoLev x :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume HLR3: forall w :e L, w < x.
assume HLR4: forall y :e R, x < y.
assume HLR5: forall z, SNo z -> (forall w :e L, w < z) -> (forall y :e R, z < y) -> SNoLev x c= SNoLev z /\ SNoEq_ (SNoLev x) x z.
claim L2: L c= SNoS_ omega.
{ let w. assume Hw.
  apply ReplE_impred omega (fun n => f n) w Hw.
  let n. assume Hn.
  assume Hwn: w = f n.
  rewrite Hwn.
  prove f n :e SNoS_ omega.
  exact ap_Pi omega (fun _ => SNoS_ omega) f n Hf1 Hn.
}
claim L3: R c= SNoS_ omega.
{ let z. assume Hz: z :e R.
  apply ReplE_impred omega (fun n => g n) z Hz.
  let m. assume Hm.
  assume Hzm: z = g m.
  rewrite Hzm.
  prove g m :e SNoS_ omega.
  exact (ap_Pi omega (fun _ => SNoS_ omega) g m Hg1 Hm).
}
claim L4: SNoLev x :e ordsucc omega.
{ exact SNoCutP_SNoCut_omega L L2 R L3 L1. }
claim L5: x :e SNoS_ (ordsucc omega).
{ apply SNoS_I (ordsucc omega) ordsucc_omega_ordinal x (SNoLev x).
  - prove SNoLev x :e ordsucc omega. exact L4.
  - prove SNo_ (SNoLev x) x. apply SNoLev_. exact HLR1.
}
apply Hp L1 HLR1 L4 L5.
- let n. assume Hn.
  prove f n < x.
  apply HLR3.
  exact ReplI omega (fun n => f n) n Hn.
- let n. assume Hn.
  prove x < g n.
  apply HLR4.
  exact ReplI omega (fun n => g n) n Hn.
Qed.

Theorem SNo_approx_real: forall x, SNo x ->
 forall f g :e SNoS_ omega :^: omega,
     (forall n :e omega, f n < x)
  -> (forall n :e omega, x < f n + eps_ n)
  -> (forall n :e omega, forall i :e n, f i < f n)
  -> (forall n :e omega, x < g n)
  -> (forall n :e omega, forall i :e n, g n < g i)
  -> x = SNoCut {f n|n :e omega} {g n|n :e omega}
  -> x :e real.
let x. assume Hx. let f. assume Hf1. let g. assume Hg1 Hf2 Hf3 Hf4 Hg3 Hg4.
set L := {f n|n :e omega}.
set R := {g n|n :e omega}.
assume Hxfg: x = SNoCut L R.
claim Lmx: SNo (- x).
{ exact SNo_minus_SNo x Hx. }
claim Lf: forall n :e omega, SNo (f n).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (f n) (ap_Pi omega (fun _ => SNoS_ omega) f n Hf1 Hn).
  assume _ _ H _. exact H.
}
claim Lg: forall n :e omega, SNo (g n).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (g n) (ap_Pi omega (fun _ => SNoS_ omega) g n Hg1 Hn).
  assume _ _ H _. exact H.
}
claim Lfg: forall n m :e omega, f n < g m.
{ let n. assume Hn. let m. assume Hm.
  apply SNoLt_tra (f n) x (g m) (Lf n Hn) Hx (Lg m Hm).
  - exact Hf2 n Hn.
  - exact Hg3 m Hm.
}
apply SNo_approx_real_lem f Hf1 g Hg1 Lfg.
rewrite <- Hxfg.
assume H1: SNoCutP L R.
assume H2: SNo x.
rewrite <- Hxfg.
assume H3: SNoLev x :e ordsucc omega.
rewrite <- Hxfg.
assume H4: x :e SNoS_ (ordsucc omega).
rewrite <- Hxfg.
assume H5: forall n :e omega, f n < x.
rewrite <- Hxfg.
assume H6: forall n :e omega, x < g n.
apply SNoCutP_SNoCut_impred L R H1.
assume _ _ _ _.
assume H7: forall z, SNo z -> (forall w :e L, w < z) -> (forall y :e R, z < y) -> SNoLev (SNoCut L R) c= SNoLev z /\ SNoEq_ (SNoLev (SNoCut L R)) (SNoCut L R) z.
apply ordsuccE omega (SNoLev x) H3.
- assume H8: SNoLev x :e omega.
  apply SNoS_omega_real.
  prove x :e SNoS_ omega.
  apply SNoS_I omega omega_ordinal x (SNoLev x) H8.
  prove SNo_ (SNoLev x) x.
  exact SNoLev_ x Hx.
- assume H8: SNoLev x = omega.
  apply real_I.
  + prove x :e SNoS_ (ordsucc omega). exact H4.
  + prove x <> omega.
    assume H9: x = omega.
    claim Lbd1: x < g 0.
    { exact Hg3 0 (nat_p_omega 0 nat_0). }
    apply real_E (g 0) (SNoS_omega_real (g 0) (ap_Pi omega (fun _ => SNoS_ omega) g 0 Hg1 (nat_p_omega 0 nat_0))).
    assume Hg0a: SNo (g 0).
    assume _ _ _.
    assume Hg0b: g 0 < omega.
    assume _ _.
    apply SNoLt_irref x.
    prove x < x.
    apply SNoLt_tra x (g 0) x Hx Hg0a Hx Lbd1.
    prove g 0 < x. rewrite H9.
    prove g 0 < omega. exact Hg0b.
  + prove x <> - omega.
    assume H9: x = - omega.
    claim Lbd2: f 0 < x.
    { exact Hf2 0 (nat_p_omega 0 nat_0). }
    apply real_E (f 0) (SNoS_omega_real (f 0) (ap_Pi omega (fun _ => SNoS_ omega) f 0 Hf1 (nat_p_omega 0 nat_0))).
    assume Hf0a: SNo (f 0).
    assume _ _.
    assume Hf0b: - omega < f 0.
    assume _ _ _.
    apply SNoLt_irref x.
    prove x < x.
    apply SNoLt_tra x (f 0) x Hx Hf0a Hx.
    * prove x < f 0. rewrite H9. exact Hf0b.
    * prove f 0 < x. exact Lbd2.
  + prove forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x.
    let q. assume Hq1 Hq2. prove q = x.
    apply SNoS_E2 omega omega_ordinal q Hq1.
    assume Hq1a Hq1b Hq1c Hq1d.
    claim Lmq: SNo (- q).
    { exact SNo_minus_SNo q Hq1c. }
    claim Lxmq: SNo (x + - q).
    { exact SNo_add_SNo x (- q) Hx Lmq. }
    claim Lqmx: SNo (q + - x).
    { exact SNo_add_SNo q (- x) Hq1c Lmx. }
    claim L5: forall w :e L, w < q.
    { let w. assume Hw.
      apply ReplE_impred omega (fun n => f n) w Hw.
      let n. assume Hn.
      assume Hwn: w = f n.
      rewrite Hwn.
      prove f n < q.
      apply SNoLtLe_or (f n) q (Lf n Hn) Hq1c.
      - assume H9: f n < q. exact H9.
      - assume H9: q <= f n.
        apply real_E (f (ordsucc n)) (SNoS_omega_real (f (ordsucc n)) (ap_Pi omega (fun _ => SNoS_ omega) f (ordsucc n) Hf1 (omega_ordsucc n Hn))).
        assume _ _ _ _ _.
        assume Hfn2: forall q' :e SNoS_ omega, (forall k :e omega, abs_SNo (q' + - f (ordsucc n)) < eps_ k) -> q' = f (ordsucc n).
        assume _.
        claim L5a: SNo (f (ordsucc n)).
        { exact Lf (ordsucc n) (omega_ordsucc n Hn). }
        claim L5b: q < f (ordsucc n).
        { apply SNoLeLt_tra q (f n) (f (ordsucc n)) Hq1c (Lf n Hn) L5a H9.
          prove f n < f (ordsucc n).
          apply Hf4 (ordsucc n) (omega_ordsucc n Hn).
          prove n :e ordsucc n. apply ordsuccI2.
        }
        claim L5c: 0 < f (ordsucc n) + - q.
        { exact SNoLt_minus_pos q (f (ordsucc n)) Hq1c L5a L5b. }
        claim L5d: SNo (f (ordsucc n) + - q).
        { exact SNo_add_SNo (f (ordsucc n)) (- q) L5a Lmq. }
        claim L5e: f (ordsucc n) < x.
        { exact Hf2 (ordsucc n) (omega_ordsucc n Hn). }
        claim L5f: q < x.
        { exact SNoLt_tra q (f (ordsucc n)) x Hq1c L5a Hx L5b L5e. }
        claim L5g: 0 < x + - q.
        { exact SNoLt_minus_pos q x Hq1c Hx L5f. }
        claim L5h: abs_SNo (q + - x) = x + - q.
        { rewrite abs_SNo_dist_swap q x Hq1c Hx.
          exact pos_abs_SNo (x + - q) L5g.
        }
        claim L5i: q = f (ordsucc n).
        { apply Hfn2 q Hq1.
          let k. assume Hk: k :e omega.
          prove abs_SNo (q + - f (ordsucc n)) < eps_ k.
          rewrite abs_SNo_dist_swap q (f (ordsucc n)) Hq1c (Lf (ordsucc n) (omega_ordsucc n Hn)).
          prove abs_SNo (f (ordsucc n) + - q) < eps_ k.
          rewrite pos_abs_SNo (f (ordsucc n) + - q) L5c.
          prove f (ordsucc n) + - q < eps_ k.
          apply SNoLt_tra (f (ordsucc n) + - q) (x + - q) (eps_ k) L5d Lxmq (SNo_eps_ k Hk).
          - prove f (ordsucc n) + - q < x + - q.
            apply add_SNo_Lt1 (f (ordsucc n)) (- q) x L5a Lmq Hx.
            prove f (ordsucc n) < x.
            exact L5e.
          - prove x + - q < eps_ k.
            rewrite <- L5h.
            prove abs_SNo (q + - x) < eps_ k.
            exact Hq2 k Hk.
        }
        apply SNoLt_irref q.
        rewrite L5i at 2. exact L5b.
    }
    claim L6: forall z :e R, q < z.
    { let z. assume Hz: z :e R.
      apply ReplE_impred omega (fun n => g n) z Hz.
      let m. assume Hm.
      assume Hzm: z = g m.
      rewrite Hzm.
      prove q < g m.
      apply SNoLtLe_or q (g m) Hq1c (Lg m Hm).
      - assume H9: q < g m. exact H9.
      - assume H9: g m <= q.
        apply real_E (g (ordsucc m)) (SNoS_omega_real (g (ordsucc m)) (ap_Pi omega (fun _ => SNoS_ omega) g (ordsucc m) Hg1 (omega_ordsucc m Hm))).
        assume _ _ _ _ _.
        assume Hgm2: forall q' :e SNoS_ omega, (forall k :e omega, abs_SNo (q' + - g (ordsucc m)) < eps_ k) -> q' = g (ordsucc m).
        assume _.
        claim L6a: SNo (g (ordsucc m)).
        { exact Lg (ordsucc m) (omega_ordsucc m Hm). }
        claim L6b: g (ordsucc m) < q.
        { apply SNoLtLe_tra (g (ordsucc m)) (g m) q L6a (Lg m Hm) Hq1c.
          - prove g (ordsucc m) < g m.
            apply Hg4 (ordsucc m) (omega_ordsucc m Hm).
            prove m :e ordsucc m. apply ordsuccI2.
          - exact H9.
        }
        claim L6c: 0 < q + - g (ordsucc m).
        { exact SNoLt_minus_pos (g (ordsucc m)) q L6a Hq1c L6b. }
        claim L6d: SNo (q + - g (ordsucc m)).
        { exact SNo_add_SNo q (- g (ordsucc m)) Hq1c (SNo_minus_SNo (g (ordsucc m)) L6a). }
        claim L6e: x < g (ordsucc m).
        { exact Hg3 (ordsucc m) (omega_ordsucc m Hm). }
        claim L6f: x < q.
        { exact SNoLt_tra x (g (ordsucc m)) q Hx L6a Hq1c L6e L6b. }
        claim L6g: 0 < q + - x.
        { exact SNoLt_minus_pos x q Hx Hq1c L6f. }
        claim L6h: abs_SNo (q + - x) = q + - x.
        { exact pos_abs_SNo (q + - x) L6g. }
        claim L6i: q = g (ordsucc m).
        { apply Hgm2 q Hq1.
          let k. assume Hk: k :e omega.
          prove abs_SNo (q + - g (ordsucc m)) < eps_ k.
          rewrite pos_abs_SNo (q + - g (ordsucc m)) L6c.
          prove q + - g (ordsucc m) < eps_ k.
          apply SNoLt_tra (q + - g (ordsucc m)) (q + - x) (eps_ k) L6d Lqmx (SNo_eps_ k Hk).
          - prove q + - g (ordsucc m) < q + - x.
            apply add_SNo_Lt2 q (- g (ordsucc m)) (- x) Hq1c (SNo_minus_SNo (g (ordsucc m)) L6a) Lmx.
            prove - g (ordsucc m) < - x.
            apply minus_SNo_Lt_contra x (g (ordsucc m)) Hx L6a.
            exact L6e.
          - prove q + - x < eps_ k.
            rewrite <- L6h.
            prove abs_SNo (q + - x) < eps_ k.
            exact Hq2 k Hk.
        }
        apply SNoLt_irref q.
        rewrite L6i at 1. exact L6b.
    }
    apply H7 q Hq1c L5 L6.
    rewrite <- Hxfg. rewrite H8.
    assume H9: omega c= SNoLev q.
    prove False.
    apply In_irref (SNoLev q).
    prove SNoLev q :e SNoLev q.
    apply H9.
    prove SNoLev q :e omega.
    exact Hq1a.
Qed.

Theorem SNo_approx_real_rep : forall x :e real,
 forall p:prop,
     (forall f g :e SNoS_ omega :^: omega,
           (forall n :e omega, f n < x)
        -> (forall n :e omega, x < f n + eps_ n)
        -> (forall n :e omega, forall i :e n, f i < f n)
        -> (forall n :e omega, g n + - eps_ n < x)
        -> (forall n :e omega, x < g n)
        -> (forall n :e omega, forall i :e n, g n < g i)
        -> SNoCutP {f n|n :e omega} {g n|n :e omega}
        -> x = SNoCut {f n|n :e omega} {g n|n :e omega}
        -> p)
  -> p.
let x. assume Hx. let p. assume Hp.
apply real_E x Hx.
assume Hx1 Hx2 Hx3 _ _ Hx4 Hx5.
apply SNo_prereal_incr_lower_approx x Hx1 Hx4 Hx5.
let f. assume Hf. apply Hf.
assume Hf1 Hf2.
apply SNo_prereal_decr_upper_approx x Hx1 Hx4 Hx5.
let g. assume Hg. apply Hg.
assume Hg1 Hg2.
claim Lf: forall n :e omega, SNo (f n).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (f n) (ap_Pi omega (fun _ => SNoS_ omega) f n Hf1 Hn).
  assume _ _ H _. exact H.
}
claim Lg: forall n :e omega, SNo (g n).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (g n) (ap_Pi omega (fun _ => SNoS_ omega) g n Hg1 Hn).
  assume _ _ H _. exact H.
}
claim Lf1: forall n :e omega, f n < x.
{ let n. assume Hn. apply Hf2 n Hn. assume H _. apply H. assume H _. exact H. }
claim Lf2: forall n :e omega, x < f n + eps_ n.
{ let n. assume Hn. apply Hf2 n Hn. assume H _. apply H. assume _ H. exact H. }
claim Lf3: forall n :e omega, forall i :e n, f i < f n.
{ let n. assume Hn. apply Hf2 n Hn. assume _ H. exact H. }
claim Lg1: forall n :e omega, g n + - eps_ n < x.
{ let n. assume Hn. apply Hg2 n Hn. assume H _. apply H. assume H _. exact H. }
claim Lg2: forall n :e omega, x < g n.
{ let n. assume Hn. apply Hg2 n Hn. assume H _. apply H. assume _ H. exact H. }
claim Lg3: forall n :e omega, forall i :e n, g n < g i.
{ let n. assume Hn. apply Hg2 n Hn. assume _ H. exact H. }
claim Lfg: forall n m :e omega, f n < g m.
{ let n. assume Hn. let m. assume Hm.
  apply SNoLt_tra (f n) x (g m) (Lf n Hn) Hx1 (Lg m Hm).
  - prove f n < x. exact Lf1 n Hn.
  - prove x < g m. exact Lg2 m Hm.
}
set L := {f n|n :e omega}.
set R := {g n|n :e omega}.
apply SNo_approx_real_lem f Hf1 g Hg1 Lfg.
assume H1: SNoCutP L R.
assume H2: SNo (SNoCut L R).
assume H3: SNoLev (SNoCut L R) :e ordsucc omega.
assume H4: SNoCut L R :e SNoS_ (ordsucc omega).
assume H5: forall n :e omega, f n < SNoCut L R.
assume H6: forall n :e omega, SNoCut L R < g n.
claim Lxfg: x = SNoCut L R.
{ rewrite SNo_eta x Hx1.
  apply SNoCut_ext (SNoL x) (SNoR x) L R (SNoCutP_SNoL_SNoR x Hx1) H1.
  - let w. assume Hw: w :e SNoL x. prove w < SNoCut L R.
    apply SNoL_E x Hx1 w Hw.
    assume Hw1: SNo w.
    assume Hw2: SNoLev w :e SNoLev x.
    assume Hw3: w < x.
    claim Lw1: w :e SNoS_ omega.
    { exact SNoLev_In_real_SNoS_omega x Hx w Hw1 Hw2. }
    claim Lw2: 0 < x + - w.
    { exact SNoLt_minus_pos w x Hw1 Hx1 Hw3. }
    claim Lw3: exists k :e omega, w + eps_ k <= x.
    { apply dneg.
      assume H7: ~exists k :e omega, w + eps_ k <= x.
      claim Lw3a: w = x.
      { apply Hx4 w Lw1.
        let k. assume Hk: k :e omega.
        prove abs_SNo (w + - x) < eps_ k.
        rewrite abs_SNo_dist_swap w x Hw1 Hx1.
        prove abs_SNo (x + - w) < eps_ k.
        rewrite pos_abs_SNo (x + - w) Lw2.
        prove x + - w < eps_ k.
        apply SNoLtLe_or (x + - w) (eps_ k) (SNo_add_SNo x (- w) Hx1 (SNo_minus_SNo w Hw1)) (SNo_eps_ k Hk).
        - assume H8: x + - w < eps_ k. exact H8.
        - assume H8: eps_ k <= x + - w. prove False.
          apply H7. witness k. apply andI.
          + exact Hk.
          + prove w + eps_ k <= x.
            rewrite <- add_SNo_minus_R2' x w Hx1 Hw1.
            prove w + eps_ k <= (x + - w) + w.
            rewrite add_SNo_com w (eps_ k) Hw1 (SNo_eps_ k Hk).
            prove eps_ k + w <= (x + - w) + w.
            exact add_SNo_Le1 (eps_ k) w (x + - w) (SNo_eps_ k Hk) Hw1 (SNo_add_SNo x (- w) Hx1 (SNo_minus_SNo w Hw1)) H8.
      }
      apply SNoLt_irref x.
      rewrite <- Lw3a at 1. exact Hw3.
    }
    apply Lw3.
    let k. assume Hk. apply Hk.
    assume Hk1: k :e omega.
    assume Hk2: w + eps_ k <= x.
    prove w < SNoCut L R.
    apply SNoLt_tra w (f k) (SNoCut L R) Hw1 (Lf k Hk1) H2.
    + prove w < f k.
      apply add_SNo_Lt1_cancel w (eps_ k) (f k) Hw1 (SNo_eps_ k Hk1) (Lf k Hk1).
      prove w + eps_ k < f k + eps_ k.
      apply SNoLeLt_tra (w + eps_ k) x (f k + eps_ k)
              (SNo_add_SNo w (eps_ k) Hw1 (SNo_eps_ k Hk1))
              Hx1 
              (SNo_add_SNo (f k) (eps_ k) (Lf k Hk1) (SNo_eps_ k Hk1))
              Hk2.
      prove x < f k + eps_ k.
      apply Hf2 k Hk1. assume H _. apply H. assume _ H. exact H.
    + prove f k < SNoCut L R. exact H5 k Hk1.
  - let z. assume Hz: z :e SNoR x. prove SNoCut L R < z.
    apply SNoR_E x Hx1 z Hz.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev x.
    assume Hz3: x < z.
    claim Lz1: z :e SNoS_ omega.
    { exact SNoLev_In_real_SNoS_omega x Hx z Hz1 Hz2. }
    claim Lz2: 0 < z + - x.
    { exact SNoLt_minus_pos x z Hx1 Hz1 Hz3. }
    claim Lz3: exists k :e omega, x + eps_ k <= z.
    { apply dneg.
      assume H7: ~exists k :e omega, x + eps_ k <= z.
      claim Lz3a: z = x.
      { apply Hx4 z Lz1.
        let k. assume Hk: k :e omega.
        prove abs_SNo (z + - x) < eps_ k.
        rewrite pos_abs_SNo (z + - x) Lz2.
        prove z + - x < eps_ k.
        apply SNoLtLe_or (z + - x) (eps_ k) (SNo_add_SNo z (- x) Hz1 (SNo_minus_SNo x Hx1)) (SNo_eps_ k Hk).
        - assume H8: z + - x < eps_ k. exact H8.
        - assume H8: eps_ k <= z + - x. prove False.
          apply H7. witness k. apply andI.
          + exact Hk.
          + prove x + eps_ k <= z.
            rewrite <- add_SNo_minus_R2' z x Hz1 Hx1.
            prove x + eps_ k <= (z + - x) + x.
            rewrite add_SNo_com x (eps_ k) Hx1 (SNo_eps_ k Hk).
            prove eps_ k + x <= (z + - x) + x.
            exact add_SNo_Le1 (eps_ k) x (z + - x) (SNo_eps_ k Hk) Hx1 (SNo_add_SNo z (- x) Hz1 (SNo_minus_SNo x Hx1)) H8.
      }
      apply SNoLt_irref x.
      rewrite <- Lz3a at 2. exact Hz3.
    }
    apply Lz3.
    let k. assume Hk. apply Hk.
    assume Hk1: k :e omega.
    assume Hk2: x + eps_ k <= z.
    prove SNoCut L R < z.
    apply SNoLt_tra (SNoCut L R) (g k) z H2 (Lg k Hk1) Hz1.
    + exact H6 k Hk1.
    + prove g k < z.
      apply SNoLtLe_tra (g k) (x + eps_ k) z (Lg k Hk1) (SNo_add_SNo x (eps_ k) Hx1 (SNo_eps_ k Hk1)) Hz1.
      * prove g k < x + eps_ k.
        apply add_SNo_minus_Lt1 (g k) (eps_ k) x (Lg k Hk1) (SNo_eps_ k Hk1) Hx1.
        prove g k + - eps_ k < x.
        exact Lg1 k Hk1.
      * prove x + eps_ k <= z. exact Hk2.
  - let w. assume Hw: w :e L.
    rewrite <- SNo_eta x Hx1.
    prove w < x.
    apply ReplE_impred omega (fun n => f n) w Hw.
    let n. assume Hn.
    assume Hwn: w = f n.
    rewrite Hwn.
    prove f n < x.
    exact Lf1 n Hn.
  - let z. assume Hz: z :e R.
    rewrite <- SNo_eta x Hx1.
    prove x < z.
    apply ReplE_impred omega (fun n => g n) z Hz.
    let m. assume Hm.
    assume Hzm: z = g m.
    rewrite Hzm.
    prove x < g m.
    exact Lg2 m Hm.
}
exact Hp f Hf1 g Hg1 Lf1 Lf2 Lf3 Lg1 Lg2 Lg3 H1 Lxfg.
Qed.

Theorem real_add_SNo : forall x y :e real, x + y :e real.
let x. assume Hx. let y. assume Hy.
apply SNo_approx_real_rep x Hx.
let fL. assume HfL. let fR. assume HfR HfL1 HfL2 HfL3 HfR1 HfR2 HfR3 HfLR HxfLR.
apply SNo_approx_real_rep y Hy.
let gL. assume HgL. let gR. assume HgR HgL1 HgL2 HgL3 HgR1 HgR2 HgR3 HgLR HygLR.
set hL := fun n :e omega => fL (ordsucc n) + gL (ordsucc n).
set hR := fun n :e omega => fR (ordsucc n) + gR (ordsucc n).
set L := {hL n|n :e omega}.
set R := {hR n|n :e omega}.
claim Lx: SNo x.
{ exact real_SNo x Hx. }
claim Ly: SNo y.
{ exact real_SNo y Hy. }
claim Lxy: SNo (x + y).
{ exact SNo_add_SNo x y Lx Ly. }
claim Lx2: forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x.
{ exact real_SNoS_omega_prop x Hx. }
claim Ly2: forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - y) < eps_ k) -> q = y.
{ exact real_SNoS_omega_prop y Hy. }
claim LfLa: forall n :e omega, fL (ordsucc n) :e SNoS_ omega.
{ let n. assume Hn. exact ap_Pi omega (fun _ => SNoS_ omega) fL (ordsucc n) HfL (omega_ordsucc n Hn). }
claim LfLb: forall n :e omega, SNo (fL (ordsucc n)).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (fL (ordsucc n)) (LfLa n Hn).
  assume _ _ H _. exact H.
}
claim LgLa: forall n :e omega, gL (ordsucc n) :e SNoS_ omega.
{ let n. assume Hn. exact ap_Pi omega (fun _ => SNoS_ omega) gL (ordsucc n) HgL (omega_ordsucc n Hn). }
claim LgLb: forall n :e omega, SNo (gL (ordsucc n)).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (gL (ordsucc n)) (LgLa n Hn).
  assume _ _ H _. exact H.
}
claim LfRa: forall n :e omega, fR (ordsucc n) :e SNoS_ omega.
{ let n. assume Hn. exact ap_Pi omega (fun _ => SNoS_ omega) fR (ordsucc n) HfR (omega_ordsucc n Hn). }
claim LfRb: forall n :e omega, SNo (fR (ordsucc n)).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (fR (ordsucc n)) (LfRa n Hn).
  assume _ _ H _. exact H.
}
claim LgRa: forall n :e omega, gR (ordsucc n) :e SNoS_ omega.
{ let n. assume Hn. exact ap_Pi omega (fun _ => SNoS_ omega) gR (ordsucc n) HgR (omega_ordsucc n Hn). }
claim LgRb: forall n :e omega, SNo (gR (ordsucc n)).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (gR (ordsucc n)) (LgRa n Hn).
  assume _ _ H _. exact H.
}
claim LhL: forall n :e omega, hL n = fL (ordsucc n) + gL (ordsucc n).
{ let n. assume Hn.
  exact beta omega (fun n => fL (ordsucc n) + gL (ordsucc n)) n Hn.
}
claim LhR: forall n :e omega, hR n = fR (ordsucc n) + gR (ordsucc n).
{ let n. assume Hn.
  exact beta omega (fun n => fR (ordsucc n) + gR (ordsucc n)) n Hn.
}
claim LhLb: forall n :e omega, SNo (hL n).
{ let n. assume Hn. rewrite LhL n Hn.
  prove SNo (fL (ordsucc n) + gL (ordsucc n)).
  exact SNo_add_SNo (fL (ordsucc n)) (gL (ordsucc n)) (LfLb n Hn) (LgLb n Hn).
}
claim LhRb: forall n :e omega, SNo (hR n).
{ let n. assume Hn. rewrite LhR n Hn.
  prove SNo (fR (ordsucc n) + gR (ordsucc n)).
  exact SNo_add_SNo (fR (ordsucc n)) (gR (ordsucc n)) (LfRb n Hn) (LgRb n Hn).
}
claim L1: hL :e SNoS_ omega :^: omega.
{ prove (fun n :e omega => fL (ordsucc n) + gL (ordsucc n)) :e Pi_ _ :e omega, SNoS_ omega.
  apply lam_Pi.
  let n. assume Hn.
  prove fL (ordsucc n) + gL (ordsucc n) :e SNoS_ omega.
  apply add_SNo_SNoS_omega.
  - exact LfLa n Hn.
  - exact LgLa n Hn.
}
claim L2: hR :e SNoS_ omega :^: omega.
{ prove (fun n :e omega => fR (ordsucc n) + gR (ordsucc n)) :e Pi_ _ :e omega, SNoS_ omega.
  apply lam_Pi.
  let n. assume Hn.
  prove fR (ordsucc n) + gR (ordsucc n) :e SNoS_ omega.
  apply add_SNo_SNoS_omega.
  - exact LfRa n Hn.
  - exact LgRa n Hn.
}
claim L3: forall n :e omega, hL n < x + y.
{ let n. assume Hn. rewrite LhL n Hn.
  prove fL (ordsucc n) + gL (ordsucc n) < x + y.
  apply add_SNo_Lt3 (fL (ordsucc n)) (gL (ordsucc n)) x y
                    (LfLb n Hn) (LgLb n Hn) Lx Ly.
  - prove fL (ordsucc n) < x.
    exact HfL1 (ordsucc n) (omega_ordsucc n Hn).
  - prove gL (ordsucc n) < y.
    exact HgL1 (ordsucc n) (omega_ordsucc n Hn).
}
claim L4: forall n :e omega, x + y < hL n + eps_ n.
{ let n. assume Hn.
  rewrite LhL n Hn.
  prove x + y < (fL (ordsucc n) + gL (ordsucc n)) + eps_ n.
  rewrite <- eps_ordsucc_half_add n (omega_nat_p n Hn).
  prove x + y < (fL (ordsucc n) + gL (ordsucc n)) + (eps_ (ordsucc n) + eps_ (ordsucc n)).
  claim LeSn: SNo (eps_ (ordsucc n)).
  { exact SNo_eps_ (ordsucc n) (omega_ordsucc n Hn). }
  rewrite add_SNo_com_4_inner_mid (fL (ordsucc n)) (gL (ordsucc n)) (eps_ (ordsucc n)) (eps_ (ordsucc n))
                                  (LfLb n Hn) (LgLb n Hn) LeSn LeSn.
  prove x + y < (fL (ordsucc n) + eps_ (ordsucc n)) + (gL (ordsucc n) + eps_ (ordsucc n)).
  apply add_SNo_Lt3 x y (fL (ordsucc n) + eps_ (ordsucc n)) (gL (ordsucc n) + eps_ (ordsucc n))
                    Lx Ly
                    (SNo_add_SNo (fL (ordsucc n)) (eps_ (ordsucc n)) (LfLb n Hn) LeSn)
                    (SNo_add_SNo (gL (ordsucc n)) (eps_ (ordsucc n)) (LgLb n Hn) LeSn).
  - exact HfL2 (ordsucc n) (omega_ordsucc n Hn).
  - exact HgL2 (ordsucc n) (omega_ordsucc n Hn).
}
claim L5: forall n :e omega, forall i :e n, hL i < hL n.
{ let n. assume Hn. let i. assume Hi.
  rewrite LhL n Hn.
  claim Li: i :e omega.
  { exact nat_p_omega i (nat_p_trans n (omega_nat_p n Hn) i Hi). }
  rewrite LhL i Li.
  prove fL (ordsucc i) + gL (ordsucc i) < fL (ordsucc n) + gL (ordsucc n).
  apply add_SNo_Lt3 (fL (ordsucc i)) (gL (ordsucc i)) (fL (ordsucc n)) (gL (ordsucc n))
                    (LfLb i Li) (LgLb i Li)
                    (LfLb n Hn) (LgLb n Hn).
  - prove fL (ordsucc i) < fL (ordsucc n).
    exact HfL3 (ordsucc n) (omega_ordsucc n Hn) (ordsucc i) (nat_ordsucc_in_ordsucc n (omega_nat_p n Hn) i Hi).
  - prove gL (ordsucc i) < gL (ordsucc n).
    exact HgL3 (ordsucc n) (omega_ordsucc n Hn) (ordsucc i) (nat_ordsucc_in_ordsucc n (omega_nat_p n Hn) i Hi).
}
claim L6: forall n :e omega, hR n + - eps_ n < x + y.
{ let n. assume Hn. rewrite LhR n Hn.
  prove (fR (ordsucc n) + gR (ordsucc n)) + - eps_ n < x + y.
  rewrite <- eps_ordsucc_half_add n (omega_nat_p n Hn).
  prove (fR (ordsucc n) + gR (ordsucc n)) + - (eps_ (ordsucc n) + eps_ (ordsucc n)) < x + y.
  claim LeSn: SNo (eps_ (ordsucc n)).
  { exact SNo_eps_ (ordsucc n) (omega_ordsucc n Hn). }
  claim LmeSn: SNo (- eps_ (ordsucc n)).
  { exact SNo_minus_SNo (eps_ (ordsucc n)) LeSn. }
  rewrite minus_add_SNo_distr (eps_ (ordsucc n)) (eps_ (ordsucc n)) LeSn LeSn.
  prove (fR (ordsucc n) + gR (ordsucc n)) + (- eps_ (ordsucc n) + - eps_ (ordsucc n)) < x + y.
  rewrite add_SNo_com_4_inner_mid (fR (ordsucc n)) (gR (ordsucc n)) (- eps_ (ordsucc n)) (- eps_ (ordsucc n))
                                  (LfRb n Hn) (LgRb n Hn) LmeSn LmeSn.
  prove (fR (ordsucc n) + - eps_ (ordsucc n)) + (gR (ordsucc n) + - eps_ (ordsucc n)) < x + y.
  apply add_SNo_Lt3 (fR (ordsucc n) + - eps_ (ordsucc n)) (gR (ordsucc n) + - eps_ (ordsucc n)) x y
                    (SNo_add_SNo (fR (ordsucc n)) (- eps_ (ordsucc n)) (LfRb n Hn) LmeSn)
                    (SNo_add_SNo (gR (ordsucc n)) (- eps_ (ordsucc n)) (LgRb n Hn) LmeSn)
                    Lx Ly.
  - prove fR (ordsucc n) + - eps_ (ordsucc n) < x.
    exact HfR1 (ordsucc n) (omega_ordsucc n Hn).
  - prove gR (ordsucc n) + - eps_ (ordsucc n) < y.
    exact HgR1 (ordsucc n) (omega_ordsucc n Hn).
}
claim L7: forall n :e omega, x + y < hR n.
{ let n. assume Hn. rewrite LhR n Hn.
  prove x + y < fR (ordsucc n) + gR (ordsucc n).
  apply add_SNo_Lt3 x y (fR (ordsucc n)) (gR (ordsucc n))
                    Lx Ly (LfRb n Hn) (LgRb n Hn).
  - prove x < fR (ordsucc n).
    exact HfR2 (ordsucc n) (omega_ordsucc n Hn).
  - prove y < gR (ordsucc n).
    exact HgR2 (ordsucc n) (omega_ordsucc n Hn).
}
claim L8: forall n :e omega, forall i :e n, hR n < hR i.
{ let n. assume Hn. let i. assume Hi.
  rewrite LhR n Hn.
  claim Li: i :e omega.
  { exact nat_p_omega i (nat_p_trans n (omega_nat_p n Hn) i Hi). }
  rewrite LhR i Li.
  prove fR (ordsucc n) + gR (ordsucc n) < fR (ordsucc i) + gR (ordsucc i).
  apply add_SNo_Lt3 (fR (ordsucc n)) (gR (ordsucc n)) (fR (ordsucc i)) (gR (ordsucc i))
                    (LfRb n Hn) (LgRb n Hn)
                    (LfRb i Li) (LgRb i Li).
  - prove fR (ordsucc n) < fR (ordsucc i).
    exact HfR3 (ordsucc n) (omega_ordsucc n Hn) (ordsucc i) (nat_ordsucc_in_ordsucc n (omega_nat_p n Hn) i Hi).
  - prove gR (ordsucc n) < gR (ordsucc i).
    exact HgR3 (ordsucc n) (omega_ordsucc n Hn) (ordsucc i) (nat_ordsucc_in_ordsucc n (omega_nat_p n Hn) i Hi).
}
claim LLR: SNoCutP L R.
{ prove (forall w :e L, SNo w)
     /\ (forall z :e R, SNo z)
     /\ (forall w :e L, forall z :e R, w < z).
  apply and3I.
  - let w. assume Hw.
    apply ReplE_impred omega (fun n => hL n) w Hw.
    let n. assume Hn: n :e omega.
    assume Hwn: w = hL n. rewrite Hwn.
    prove SNo (hL n). exact LhLb n Hn.
  - let z. assume Hz.
    apply ReplE_impred omega (fun n => hR n) z Hz.
    let m. assume Hm: m :e omega.
    assume Hzm: z = hR m. rewrite Hzm.
    prove SNo (hR m). exact LhRb m Hm.
  - let w. assume Hw.
    let z. assume Hz.
    apply ReplE_impred omega (fun n => hL n) w Hw.
    let n. assume Hn: n :e omega.
    assume Hwn: w = hL n. rewrite Hwn.
    apply ReplE_impred omega (fun n => hR n) z Hz.
    let m. assume Hm: m :e omega.
    assume Hzm: z = hR m. rewrite Hzm.
    prove hL n < hR m.
    apply SNoLt_tra (hL n) (x + y) (hR m) (LhLb n Hn) (SNo_add_SNo x y Lx Ly) (LhRb m Hm).
    + prove hL n < x + y. exact L3 n Hn.
    + prove x + y < hR m. exact L7 m Hm.
}
apply SNoCutP_SNoCut_impred L R LLR.
assume HLR1 HLR2 HLR3 HLR4 HLR5.
claim L9: x + y = SNoCut L R.
{ rewrite add_SNo_eq x Lx y Ly.
  prove SNoCut ({w + y|w :e SNoL x} :\/: {x + w|w :e SNoL y}) ({z + y|z :e SNoR x} :\/: {x + z|z :e SNoR y})
      = SNoCut L R.
  apply SNoCut_ext ({w + y|w :e SNoL x} :\/: {x + w|w :e SNoL y})
                   ({z + y|z :e SNoR x} :\/: {x + z|z :e SNoR y})
                   L R
                   (add_SNo_SNoCutP x y Lx Ly)
                   LLR.
  - prove forall w :e {w + y|w :e SNoL x} :\/: {x + w|w :e SNoL y}, w < SNoCut L R.
    let w. assume Hw.
    apply binunionE {w + y|w :e SNoL x} {x + w|w :e SNoL y} w Hw.
    + assume Hw: w :e {w + y|w :e SNoL x}.
      apply ReplE_impred (SNoL x) (fun w => w + y) w Hw.
      let w'. assume Hw': w' :e SNoL x.
      assume Hww'. rewrite Hww'.
      prove w' + y < SNoCut L R.
      apply SNoL_E x Lx w' Hw'.
      assume Hw'1 Hw'2 Hw'3.
      claim Lw'1: w' :e SNoS_ omega.
      { exact SNoLev_In_real_SNoS_omega x Hx w' Hw'1 Hw'2. }
      claim Lw'2: exists n :e omega, w' + y <= hL n.
      { apply dneg. assume HC: ~(exists n :e omega, w' + y <= hL n).
        claim Lw'2a: 0 < x + - w'.
        { apply SNoLt_minus_pos w' x Hw'1 Lx Hw'3. }
        claim Lw'2b: w' = x.
        { apply Lx2 w' Lw'1.
          let k. assume Hk.
          prove abs_SNo (w' + - x) < eps_ k.
          rewrite abs_SNo_dist_swap w' x Hw'1 Lx.
          prove abs_SNo (x + - w') < eps_ k.
          rewrite pos_abs_SNo (x + - w') Lw'2a.
          prove x + - w' < eps_ k.
          apply add_SNo_minus_Lt1b x w' (eps_ k) Lx Hw'1 (SNo_eps_ k Hk).
          prove x < eps_ k + w'.
          apply SNoLtLe_or x (eps_ k + w') Lx (SNo_add_SNo (eps_ k) w' (SNo_eps_ k Hk) Hw'1).
          - assume H2. exact H2.
          - assume H2: eps_ k + w' <= x. prove False.
            apply HC.
            witness k. apply andI.
            + exact Hk.
            + prove w' + y <= hL k.
              apply SNoLtLe.
              prove w' + y < hL k.
              apply add_SNo_Lt1_cancel (w' + y) (eps_ k) (hL k) (SNo_add_SNo w' y Hw'1 Ly) (SNo_eps_ k Hk) (LhLb k Hk).
              prove (w' + y) + eps_ k < hL k + eps_ k.
              apply SNoLeLt_tra ((w' + y) + eps_ k) (x + y) (hL k + eps_ k)
                                (SNo_add_SNo (w' + y) (eps_ k) (SNo_add_SNo w' y Hw'1 Ly) (SNo_eps_ k Hk))
                                Lxy
                                (SNo_add_SNo (hL k) (eps_ k) (LhLb k Hk) (SNo_eps_ k Hk)).
              * prove (w' + y) + eps_ k <= x + y.
                rewrite add_SNo_com_3b_1_2 w' y (eps_ k) Hw'1 Ly (SNo_eps_ k Hk).
                prove (w' + eps_ k) + y <= x + y.
                apply add_SNo_Le1 (w' + eps_ k) y x (SNo_add_SNo w' (eps_ k) Hw'1 (SNo_eps_ k Hk)) Ly Lx.
                prove w' + eps_ k <= x.
                rewrite add_SNo_com w' (eps_ k) Hw'1 (SNo_eps_ k Hk).
                prove eps_ k + w' <= x.
                exact H2.
              * prove x + y < hL k + eps_ k.
                exact L4 k Hk.
        }
        apply SNoLt_irref x.
        prove x < x. rewrite <- Lw'2b at 1. exact Hw'3.
      }
      apply Lw'2. let n. assume Hn. apply Hn. assume Hn1 Hn2.
      apply SNoLeLt_tra (w' + y) (hL n) (SNoCut L R)
                        (SNo_add_SNo w' y Hw'1 Ly)
                        (LhLb n Hn1)
                        HLR1.
      * prove w' + y <= hL n. exact Hn2.
      * prove hL n < SNoCut L R. apply HLR3.
        prove hL n :e L. apply ReplI. exact Hn1.
    + assume Hw: w :e {x + w|w :e SNoL y}.
      apply ReplE_impred (SNoL y) (fun w => x + w) w Hw.
      let w'. assume Hw': w' :e SNoL y.
      assume Hww'. rewrite Hww'.
      prove x + w' < SNoCut L R.
      apply SNoL_E y Ly w' Hw'.
      assume Hw'1 Hw'2 Hw'3.
      claim Lw'1: w' :e SNoS_ omega.
      { exact SNoLev_In_real_SNoS_omega y Hy w' Hw'1 Hw'2. }
      claim Lw'2: exists n :e omega, x + w' <= hL n.
      { apply dneg. assume HC: ~(exists n :e omega, x + w' <= hL n).
        claim Lw'2a: 0 < y + - w'.
        { apply SNoLt_minus_pos w' y Hw'1 Ly Hw'3. }
        claim Lw'2b: w' = y.
        { apply Ly2 w' Lw'1.
          let k. assume Hk.
          prove abs_SNo (w' + - y) < eps_ k.
          rewrite abs_SNo_dist_swap w' y Hw'1 Ly.
          prove abs_SNo (y + - w') < eps_ k.
          rewrite pos_abs_SNo (y + - w') Lw'2a.
          prove y + - w' < eps_ k.
          apply add_SNo_minus_Lt1b y w' (eps_ k) Ly Hw'1 (SNo_eps_ k Hk).
          prove y < eps_ k + w'.
          apply SNoLtLe_or y (eps_ k + w') Ly (SNo_add_SNo (eps_ k) w' (SNo_eps_ k Hk) Hw'1).
          - assume H2. exact H2.
          - assume H2: eps_ k + w' <= y. prove False.
            apply HC.
            witness k. apply andI.
            + exact Hk.
            + prove x + w' <= hL k.
              apply SNoLtLe.
              prove x + w' < hL k.
              apply add_SNo_Lt1_cancel (x + w') (eps_ k) (hL k) (SNo_add_SNo x w' Lx Hw'1) (SNo_eps_ k Hk) (LhLb k Hk).
              prove (x + w') + eps_ k < hL k + eps_ k.
              apply SNoLeLt_tra ((x + w') + eps_ k) (x + y) (hL k + eps_ k)
                                (SNo_add_SNo (x + w') (eps_ k) (SNo_add_SNo x w' Lx Hw'1) (SNo_eps_ k Hk))
                                Lxy
                                (SNo_add_SNo (hL k) (eps_ k) (LhLb k Hk) (SNo_eps_ k Hk)).
              * prove (x + w') + eps_ k <= x + y.
                rewrite <- add_SNo_assoc x w' (eps_ k) Lx Hw'1 (SNo_eps_ k Hk).
                prove x + (w' + eps_ k) <= x + y.
                apply add_SNo_Le2 x (w' + eps_ k) y Lx (SNo_add_SNo w' (eps_ k) Hw'1 (SNo_eps_ k Hk)) Ly.
                prove w' + eps_ k <= y.
                rewrite add_SNo_com w' (eps_ k) Hw'1 (SNo_eps_ k Hk).
                prove eps_ k + w' <= y.
                exact H2.
              * prove x + y < hL k + eps_ k.
                exact L4 k Hk.
        }
        apply SNoLt_irref y.
        prove y < y. rewrite <- Lw'2b at 1. exact Hw'3.
      }
      apply Lw'2. let n. assume Hn. apply Hn. assume Hn1 Hn2.
      apply SNoLeLt_tra (x + w') (hL n) (SNoCut L R)
                        (SNo_add_SNo x w' Lx Hw'1)
                        (LhLb n Hn1)
                        HLR1.
      * prove x + w' <= hL n. exact Hn2.
      * prove hL n < SNoCut L R. apply HLR3.
        prove hL n :e L. apply ReplI. exact Hn1.
  - prove forall z :e {z + y|z :e SNoR x} :\/: {x + z|z :e SNoR y}, SNoCut L R < z.
    let z. assume Hz.
    apply binunionE {z + y|z :e SNoR x} {x + z|z :e SNoR y} z Hz.
    + assume Hz: z :e {z + y|z :e SNoR x}.
      apply ReplE_impred (SNoR x) (fun z => z + y) z Hz.
      let z'. assume Hz': z' :e SNoR x.
      assume Hzz'. rewrite Hzz'.
      prove SNoCut L R < z' + y.
      apply SNoR_E x Lx z' Hz'.
      assume Hz'1 Hz'2 Hz'3.
      claim Lz'1: z' :e SNoS_ omega.
      { exact SNoLev_In_real_SNoS_omega x Hx z' Hz'1 Hz'2. }
      claim Lz'2: exists n :e omega, hR n <= z' + y.
      { apply dneg. assume HC: ~(exists n :e omega, hR n <= z' + y).
        claim Lz'2a: 0 < z' + - x.
        { apply SNoLt_minus_pos x z' Lx Hz'1 Hz'3. }
        claim Lz'2b: z' = x.
        { apply Lx2 z' Lz'1.
          let k. assume Hk.
          prove abs_SNo (z' + - x) < eps_ k.
          rewrite pos_abs_SNo (z' + - x) Lz'2a.
          prove z' + - x < eps_ k.
          apply add_SNo_minus_Lt1b z' x (eps_ k) Hz'1 Lx (SNo_eps_ k Hk).
          prove z' < eps_ k + x.
          apply SNoLtLe_or z' (eps_ k + x) Hz'1 (SNo_add_SNo (eps_ k) x (SNo_eps_ k Hk) Lx).
          - assume H2. exact H2.
          - assume H2: eps_ k + x <= z'. prove False.
            apply HC.
            witness k. apply andI.
            + exact Hk.
            + prove hR k <= z' + y.
              apply SNoLtLe.
              apply add_SNo_Lt1_cancel (hR k) (- eps_ k) (z' + y) (LhRb k Hk) (SNo_minus_SNo (eps_ k) (SNo_eps_ k Hk)) (SNo_add_SNo z' y Hz'1 Ly).
              prove hR k + - eps_ k < (z' + y) + - eps_ k.
              apply SNoLtLe_tra (hR k + - eps_ k) (x + y) ((z' + y) + - eps_ k)
                                (SNo_add_SNo (hR k) (- eps_ k) (LhRb k Hk) (SNo_minus_SNo (eps_ k) (SNo_eps_ k Hk)))
                                Lxy
                                (SNo_add_SNo (z' + y) (- eps_ k) (SNo_add_SNo z' y Hz'1 Ly) (SNo_minus_SNo (eps_ k) (SNo_eps_ k Hk))).
              * prove hR k + - eps_ k < x + y.
                exact L6 k Hk.
              * prove x + y <= (z' + y) + - eps_ k.
                apply add_SNo_minus_Le2b (z' + y) (eps_ k) (x + y) (SNo_add_SNo z' y Hz'1 Ly) (SNo_eps_ k Hk) Lxy.
                prove (x + y) + eps_ k <= z' + y.
                rewrite add_SNo_com_3b_1_2 x y (eps_ k) Lx Ly (SNo_eps_ k Hk).
                prove (x + eps_ k) + y <= z' + y.
                apply add_SNo_Le1 (x + eps_ k) y z' (SNo_add_SNo x (eps_ k) Lx (SNo_eps_ k Hk)) Ly Hz'1.
                prove x + eps_ k <= z'.
                rewrite add_SNo_com x (eps_ k) Lx (SNo_eps_ k Hk).
                exact H2.
        }
        apply SNoLt_irref x.
        prove x < x. rewrite <- Lz'2b at 2. exact Hz'3.
      }
      apply Lz'2. let n. assume Hn. apply Hn. assume Hn1 Hn2.
      apply SNoLtLe_tra (SNoCut L R) (hR n) (z' + y)
                        HLR1
                        (LhRb n Hn1)
                        (SNo_add_SNo z' y Hz'1 Ly).
      * prove SNoCut L R < hR n. apply HLR4.
        prove hR n :e R. apply ReplI. exact Hn1.
      * prove hR n <= z' + y. exact Hn2.
    + assume Hz: z :e {x + z|z :e SNoR y}.
      apply ReplE_impred (SNoR y) (fun z => x + z) z Hz.
      let z'. assume Hz': z' :e SNoR y.
      assume Hzz'. rewrite Hzz'.
      prove SNoCut L R < x + z'.
      apply SNoR_E y Ly z' Hz'.
      assume Hz'1 Hz'2 Hz'3.
      claim Lz'1: z' :e SNoS_ omega.
      { exact SNoLev_In_real_SNoS_omega y Hy z' Hz'1 Hz'2. }
      claim Lz'2: exists n :e omega, hR n <= x + z'.
      { apply dneg. assume HC: ~(exists n :e omega, hR n <= x + z').
        claim Lz'2a: 0 < z' + - y.
        { apply SNoLt_minus_pos y z' Ly Hz'1 Hz'3. }
        claim Lz'2b: z' = y.
        { apply Ly2 z' Lz'1.
          let k. assume Hk.
          prove abs_SNo (z' + - y) < eps_ k.
          rewrite pos_abs_SNo (z' + - y) Lz'2a.
          prove z' + - y < eps_ k.
          apply add_SNo_minus_Lt1b z' y (eps_ k) Hz'1 Ly (SNo_eps_ k Hk).
          prove z' < eps_ k + y.
          apply SNoLtLe_or z' (eps_ k + y) Hz'1 (SNo_add_SNo (eps_ k) y (SNo_eps_ k Hk) Ly).
          - assume H2. exact H2.
          - assume H2: eps_ k + y <= z'. prove False.
            apply HC.
            witness k. apply andI.
            + exact Hk.
            + prove hR k <= x + z'.
              apply SNoLtLe.
              apply add_SNo_Lt1_cancel (hR k) (- eps_ k) (x + z') (LhRb k Hk) (SNo_minus_SNo (eps_ k) (SNo_eps_ k Hk)) (SNo_add_SNo x z' Lx Hz'1).
              prove hR k + - eps_ k < (x + z') + - eps_ k.
              apply SNoLtLe_tra (hR k + - eps_ k) (x + y) ((x + z') + - eps_ k)
                                (SNo_add_SNo (hR k) (- eps_ k) (LhRb k Hk) (SNo_minus_SNo (eps_ k) (SNo_eps_ k Hk)))
                                Lxy
                                (SNo_add_SNo (x + z') (- eps_ k) (SNo_add_SNo x z' Lx Hz'1) (SNo_minus_SNo (eps_ k) (SNo_eps_ k Hk))).
              * prove hR k + - eps_ k < x + y.
                exact L6 k Hk.
              * prove x + y <= (x + z') + - eps_ k.
                apply add_SNo_minus_Le2b (x + z') (eps_ k) (x + y) (SNo_add_SNo x z' Lx Hz'1) (SNo_eps_ k Hk) Lxy.
                prove (x + y) + eps_ k <= x + z'.
                rewrite <- add_SNo_assoc x y (eps_ k) Lx Ly (SNo_eps_ k Hk).
                prove x + (y + eps_ k) <= x + z'.
                apply add_SNo_Le2 x (y + eps_ k) z' Lx (SNo_add_SNo y (eps_ k) Ly (SNo_eps_ k Hk)) Hz'1.
                prove y + eps_ k <= z'.
                rewrite add_SNo_com y (eps_ k) Ly (SNo_eps_ k Hk).
                exact H2.
        }
        apply SNoLt_irref y.
        prove y < y. rewrite <- Lz'2b at 2. exact Hz'3.
      }
      apply Lz'2. let n. assume Hn. apply Hn. assume Hn1 Hn2.
      apply SNoLtLe_tra (SNoCut L R) (hR n) (x + z')
                        HLR1
                        (LhRb n Hn1)
                        (SNo_add_SNo x z' Lx Hz'1).
      * prove SNoCut L R < hR n. apply HLR4.
        prove hR n :e R. apply ReplI. exact Hn1.
      * prove hR n <= x + z'. exact Hn2.
  - let w. assume Hw: w :e L.
    rewrite <- add_SNo_eq x Lx y Ly.
    prove w < x + y.
    apply ReplE_impred omega (fun n => hL n) w Hw.
    let n. assume Hn: n :e omega.
    assume Hwn: w = hL n. rewrite Hwn.
    prove hL n < x + y.
    exact L3 n Hn.
  - let z. assume Hz: z :e R.
    rewrite <- add_SNo_eq x Lx y Ly.
    prove x + y < z.
    apply ReplE_impred omega (fun n => hR n) z Hz.
    let n. assume Hn: n :e omega.
    assume Hzn: z = hR n. rewrite Hzn.
    prove x + y < hR n.
    exact L7 n Hn.
}
exact SNo_approx_real (x + y) (SNo_add_SNo x y Lx Ly) hL L1 hR L2 L3 L4 L5 L7 L8 L9.
Qed.

Theorem SNoS_ordsucc_omega_bdd_eps_pos : forall x :e SNoS_ (ordsucc omega), 0 < x -> x < omega -> exists N :e omega, eps_ N * x < 1.
let x. assume Hx1 Hx2 Hx3.
apply SNoS_E2 (ordsucc omega) ordsucc_omega_ordinal x Hx1.
assume Hx1a Hx1b Hx1c Hx1d.
apply SNoS_ordsucc_omega_bdd_above x Hx1 Hx3.
let N. assume HN. apply HN.
assume HN1: N :e omega.
assume HN2: x < N.
claim LN: SNo N.
{ exact omega_SNo N HN1. }
witness N. apply andI.
- exact HN1.
- prove eps_ N * x < 1.
  apply SNoLt_tra (eps_ N * x) (eps_ N * N) 1
                  (SNo_mul_SNo (eps_ N) x (SNo_eps_ N HN1) Hx1c)
                  (SNo_mul_SNo (eps_ N) N (SNo_eps_ N HN1) LN)
                  SNo_1.
  + prove eps_ N * x < eps_ N * N.
    apply pos_mul_SNo_Lt (eps_ N) x N (SNo_eps_ N HN1) (SNo_eps_pos N HN1) Hx1c LN.
    prove x < N. exact HN2.
  + prove eps_ N * N < 1.
    apply SNoLtLe_or (eps_ N * N) 1
                  (SNo_mul_SNo (eps_ N) N (SNo_eps_ N HN1) LN) SNo_1.
    * assume H1: eps_ N * N < 1. exact H1.
    * { assume H1: 1 <= eps_ N * N. prove False.
        claim L2N: SNo (2 ^ N).
        { exact SNo_exp_SNo_nat 2 SNo_2 N (omega_nat_p N HN1). }
        claim L1: 2 ^ N <= 2 ^ N * eps_ N * N.
        { rewrite <- mul_SNo_oneR (2 ^ N) L2N at 1.
          prove 2 ^ N * 1 <= 2 ^ N * eps_ N * N.
          apply nonneg_mul_SNo_Le (2 ^ N) 1 (eps_ N * N) L2N.
          - prove 0 <= 2 ^ N. apply SNoLtLe.
            exact exp_SNo_nat_pos 2 SNo_2 SNoLt_0_2 N (omega_nat_p N HN1).
          - exact SNo_1.
          - exact SNo_mul_SNo (eps_ N) N (SNo_eps_ N HN1) LN.
          - prove 1 <= eps_ N * N. exact H1.
        }
        apply SNoLt_irref (2 ^ N).
        prove 2 ^ N < 2 ^ N.
        apply SNoLeLt_tra (2 ^ N) N (2 ^ N) L2N LN L2N.
        - prove 2 ^ N <= N.
          rewrite <- mul_SNo_oneL N LN at 2.
          prove 2 ^ N <= 1 * N.
          rewrite <- mul_SNo_eps_power_2' N (omega_nat_p N HN1) at 2.
          prove 2 ^ N <= (2 ^ N * eps_ N) * N.
          rewrite <- mul_SNo_assoc (2 ^ N) (eps_ N) N L2N (SNo_eps_ N HN1) LN.
          exact L1.
        - prove N < 2 ^ N. exact exp_SNo_2_bd N (omega_nat_p N HN1).
      }
Qed.

Theorem real_mul_SNo_pos : forall x y :e real, 0 < x -> 0 < y -> x * y :e real.
let x. assume Hx. let y. assume Hy Hx0 Hy0.
apply dneg.
assume HC: x * y /:e real.
apply real_E x Hx.
assume Hx1 Hx2 Hx3 Hx4 Hx5 Hx6 Hx7.
apply real_E y Hy.
assume Hy1 Hy2 Hy3 Hy4 Hy5 Hy6 Hy7.
claim Lx7: forall k :e omega,
  forall p:prop,
      (forall q :e SNoS_ omega, 0 < q -> q < x -> x < q + eps_ k -> p)
   -> p.
{ exact SNo_prereal_incr_lower_pos x Hx1 Hx0 Hx6 Hx7. }
claim Ly7: forall k :e omega,
  forall p:prop,
      (forall q :e SNoS_ omega, 0 < q -> q < y -> y < q + eps_ k -> p)
   -> p.
{ exact SNo_prereal_incr_lower_pos y Hy1 Hy0 Hy6 Hy7. }
claim Lxy: SNo (x * y).
{ exact SNo_mul_SNo x y Hx1 Hy1. }
claim Lmxy: SNo (- x * y).
{ exact SNo_minus_SNo (x * y) Lxy. }
claim Lxy2: SNoLev (x * y) /:e omega.
{ assume H1: SNoLev (x * y) :e omega.
  apply HC.
  apply SNoS_omega_real (x * y).
  prove x * y :e SNoS_ omega.
  apply SNoS_I omega omega_ordinal (x * y) (SNoLev (x * y)) H1.
  prove SNo_ (SNoLev (x * y)) (x * y). apply SNoLev_. exact Lxy.
}
claim Lxy3: forall q, SNo q -> SNoLev q :e omega -> SNoLev q :e SNoLev (x * y).
{ let q. assume Hq1 Hq2.
  apply ordinal_trichotomy_or_impred (SNoLev q) (SNoLev (x * y)) (SNoLev_ordinal q Hq1) (SNoLev_ordinal (x * y) Lxy).
  - assume H1. exact H1.
  - assume H1: SNoLev q = SNoLev (x * y). prove False.
    apply Lxy2.
    rewrite <- H1. exact Hq2.
  - assume H1: SNoLev (x * y) :e SNoLev q. prove False.
    apply Lxy2. apply nat_p_omega.
    exact nat_p_trans (SNoLev q) (omega_nat_p (SNoLev q) Hq2) (SNoLev (x * y)) H1.
}
claim LLx: SNoL x c= SNoS_ omega.
{ let v. assume Hv.
  apply SNoL_E x Hx1 v Hv.
  assume Hv1: SNo v.
  assume Hv2: SNoLev v :e SNoLev x.
  assume Hv3.
  apply SNoS_I omega omega_ordinal v (SNoLev v).
  - prove SNoLev v :e omega.
    apply ordsuccE omega (SNoLev x) Hx2.
    + assume H1: SNoLev x :e omega.
      exact omega_TransSet (SNoLev x) H1 (SNoLev v) Hv2.
    + assume H1: SNoLev x = omega. rewrite <- H1. exact Hv2.
  - prove SNo_ (SNoLev v) v. apply SNoLev_. exact Hv1.
}
claim LRx: SNoR x c= SNoS_ omega.
{ let v. assume Hv.
  apply SNoR_E x Hx1 v Hv.
  assume Hv1: SNo v.
  assume Hv2: SNoLev v :e SNoLev x.
  assume Hv3.
  apply SNoS_I omega omega_ordinal v (SNoLev v).
  - prove SNoLev v :e omega.
    apply ordsuccE omega (SNoLev x) Hx2.
    + assume H1: SNoLev x :e omega.
      exact omega_TransSet (SNoLev x) H1 (SNoLev v) Hv2.
    + assume H1: SNoLev x = omega. rewrite <- H1. exact Hv2.
  - prove SNo_ (SNoLev v) v. apply SNoLev_. exact Hv1.
}
claim LLy: SNoL y c= SNoS_ omega.
{ let v. assume Hv.
  apply SNoL_E y Hy1 v Hv.
  assume Hv1: SNo v.
  assume Hv2: SNoLev v :e SNoLev y.
  assume Hv3.
  apply SNoS_I omega omega_ordinal v (SNoLev v).
  - prove SNoLev v :e omega.
    apply ordsuccE omega (SNoLev y) Hy2.
    + assume H1: SNoLev y :e omega.
      exact omega_TransSet (SNoLev y) H1 (SNoLev v) Hv2.
    + assume H1: SNoLev y = omega. rewrite <- H1. exact Hv2.
  - prove SNo_ (SNoLev v) v. apply SNoLev_. exact Hv1.
}
claim LRy: SNoR y c= SNoS_ omega.
{ let v. assume Hv.
  apply SNoR_E y Hy1 v Hv.
  assume Hv1: SNo v.
  assume Hv2: SNoLev v :e SNoLev y.
  assume Hv3.
  apply SNoS_I omega omega_ordinal v (SNoLev v).
  - prove SNoLev v :e omega.
    apply ordsuccE omega (SNoLev y) Hy2.
    + assume H1: SNoLev y :e omega.
      exact omega_TransSet (SNoLev y) H1 (SNoLev v) Hv2.
    + assume H1: SNoLev y = omega. rewrite <- H1. exact Hv2.
  - prove SNo_ (SNoLev v) v. apply SNoLev_. exact Hv1.
}
claim LLx2: forall v :e SNoL x, forall p:prop, (forall k, k :e omega -> eps_ k <= x + - v -> p) -> p.
{ let v. assume Hv. let p. assume Hp.
  apply SNoL_E x Hx1 v Hv.
  assume Hv1: SNo v.
  assume Hv2: SNoLev v :e SNoLev x.
  assume Hv3: v < x.
  apply xm (forall k :e omega, abs_SNo (v + - x) < eps_ k).
  - assume H1. prove False.
    apply SNoLt_irref x.
    prove x < x.
    rewrite <- Hx6 v (LLx v Hv) H1 at 1.
    prove v < x. exact Hv3.
  - assume H1: ~(forall k :e omega, abs_SNo (v + - x) < eps_ k).
    apply dneg. assume H2: ~p.
    apply H1. let k. assume Hk: k :e omega.
    prove abs_SNo (v + - x) < eps_ k.
    rewrite abs_SNo_dist_swap v x Hv1 Hx1.
    prove abs_SNo (x + - v) < eps_ k.
    rewrite pos_abs_SNo (x + - v) (SNoLt_minus_pos v x Hv1 Hx1 Hv3).
    prove x + - v < eps_ k.
    apply SNoLtLe_or (x + - v) (eps_ k) (SNo_add_SNo x (- v) Hx1 (SNo_minus_SNo v Hv1)) (SNo_eps_ k Hk).
    + assume H3: x + - v < eps_ k. exact H3.
    + assume H3: eps_ k <= x + - v. prove False.
      apply H2. apply Hp k Hk. exact H3.
}
claim LRx2: forall v :e SNoR x, forall p:prop, (forall k, k :e omega -> eps_ k <= v + - x -> p) -> p.
{ let v. assume Hv. let p. assume Hp.
  apply SNoR_E x Hx1 v Hv.
  assume Hv1: SNo v.
  assume Hv2: SNoLev v :e SNoLev x.
  assume Hv3: x < v.
  apply xm (forall k :e omega, abs_SNo (v + - x) < eps_ k).
  - assume H1. prove False.
    apply SNoLt_irref x.
    prove x < x.
    rewrite <- Hx6 v (LRx v Hv) H1 at 2.
    prove x < v. exact Hv3.
  - assume H1: ~(forall k :e omega, abs_SNo (v + - x) < eps_ k).
    apply dneg. assume H2: ~p.
    apply H1. let k. assume Hk: k :e omega.
    prove abs_SNo (v + - x) < eps_ k.
    rewrite pos_abs_SNo (v + - x) (SNoLt_minus_pos x v Hx1 Hv1 Hv3).
    prove v + - x < eps_ k.
    apply SNoLtLe_or (v + - x) (eps_ k) (SNo_add_SNo v (- x) Hv1 (SNo_minus_SNo x Hx1)) (SNo_eps_ k Hk).
    + assume H3: v + - x < eps_ k. exact H3.
    + assume H3: eps_ k <= v + - x. prove False.
      apply H2. apply Hp k Hk. exact H3.
}
claim LLy2: forall v :e SNoL y, forall p:prop, (forall k, k :e omega -> eps_ k <= y + - v -> p) -> p.
{ let v. assume Hv. let p. assume Hp.
  apply SNoL_E y Hy1 v Hv.
  assume Hv1: SNo v.
  assume Hv2: SNoLev v :e SNoLev y.
  assume Hv3: v < y.
  apply xm (forall k :e omega, abs_SNo (v + - y) < eps_ k).
  - assume H1. prove False.
    apply SNoLt_irref y.
    prove y < y.
    rewrite <- Hy6 v (LLy v Hv) H1 at 1.
    prove v < y. exact Hv3.
  - assume H1: ~(forall k :e omega, abs_SNo (v + - y) < eps_ k).
    apply dneg. assume H2: ~p.
    apply H1. let k. assume Hk: k :e omega.
    prove abs_SNo (v + - y) < eps_ k.
    rewrite abs_SNo_dist_swap v y Hv1 Hy1.
    prove abs_SNo (y + - v) < eps_ k.
    rewrite pos_abs_SNo (y + - v) (SNoLt_minus_pos v y Hv1 Hy1 Hv3).
    prove y + - v < eps_ k.
    apply SNoLtLe_or (y + - v) (eps_ k) (SNo_add_SNo y (- v) Hy1 (SNo_minus_SNo v Hv1)) (SNo_eps_ k Hk).
    + assume H3: y + - v < eps_ k. exact H3.
    + assume H3: eps_ k <= y + - v. prove False.
      apply H2. apply Hp k Hk. exact H3.
}
claim LRy2: forall v :e SNoR y, forall p:prop, (forall k, k :e omega -> eps_ k <= v + - y -> p) -> p.
{ let v. assume Hv. let p. assume Hp.
  apply SNoR_E y Hy1 v Hv.
  assume Hv1: SNo v.
  assume Hv2: SNoLev v :e SNoLev y.
  assume Hv3: y < v.
  apply xm (forall k :e omega, abs_SNo (v + - y) < eps_ k).
  - assume H1. prove False.
    apply SNoLt_irref y.
    prove y < y.
    rewrite <- Hy6 v (LRy v Hv) H1 at 2.
    prove y < v. exact Hv3.
  - assume H1: ~(forall k :e omega, abs_SNo (v + - y) < eps_ k).
    apply dneg. assume H2: ~p.
    apply H1. let k. assume Hk: k :e omega.
    prove abs_SNo (v + - y) < eps_ k.
    rewrite pos_abs_SNo (v + - y) (SNoLt_minus_pos y v Hy1 Hv1 Hv3).
    prove v + - y < eps_ k.
    apply SNoLtLe_or (v + - y) (eps_ k) (SNo_add_SNo v (- y) Hv1 (SNo_minus_SNo y Hy1)) (SNo_eps_ k Hk).
    + assume H3: v + - y < eps_ k. exact H3.
    + assume H3: eps_ k <= v + - y. prove False.
      apply H2. apply Hp k Hk. exact H3.
}
apply mul_SNo_eq_3 x y Hx1 Hy1.
let L R.
assume HLR: SNoCutP L R.
assume HLE: forall u, u :e L -> forall q:prop,
                (forall w0 :e SNoL x, forall w1 :e SNoL y, u = w0 * y + x * w1 + - w0 * w1 -> q)
             -> (forall z0 :e SNoR x, forall z1 :e SNoR y, u = z0 * y + x * z1 + - z0 * z1 -> q)
             -> q.
assume HLI1: forall w0 :e SNoL x, forall w1 :e SNoL y, w0 * y + x * w1 + - w0 * w1 :e L.
assume HLI2: forall z0 :e SNoR x, forall z1 :e SNoR y, z0 * y + x * z1 + - z0 * z1 :e L.
assume HRE: forall u, u :e R -> forall q:prop,
                (forall w0 :e SNoL x, forall z1 :e SNoR y, u = w0 * y + x * z1 + - w0 * z1 -> q)
             -> (forall z0 :e SNoR x, forall w1 :e SNoL y, u = z0 * y + x * w1 + - z0 * w1 -> q)
             -> q.
assume HRI1: forall w0 :e SNoL x, forall z1 :e SNoR y, w0 * y + x * z1 + - w0 * z1 :e R.
assume HRI2: forall z0 :e SNoR x, forall w1 :e SNoL y, z0 * y + x * w1 + - z0 * w1 :e R.
assume HxyLR: x * y = SNoCut L R.
claim L1: forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - (x * y)) < eps_ k) -> q = x * y.
{ let q. assume Hq1 Hq2.
  prove q = x * y.
  apply SNoS_E2 omega omega_ordinal q Hq1.
  assume Hq1a Hq1b Hq1c Hq1d.
  apply SNoLt_trichotomy_or_impred q (x * y) Hq1c Lxy.
  - assume H1: q < x * y. prove False.
    claim Lq1: q :e SNoL (x * y).
    { apply SNoL_I.
      - exact Lxy.
      - exact Hq1c.
      - prove SNoLev q :e SNoLev (x * y).
        exact Lxy3 q Hq1c Hq1a.
      - prove q < x * y. exact H1.
    }
    apply mul_SNo_SNoL_interpolate_impred x y Hx1 Hy1 q Lq1.
    + let v. assume Hv: v :e SNoL x. let w. assume Hw: w :e SNoL y.
      apply SNoL_E x Hx1 v Hv.
      assume Hv1 _ _.
      apply SNoL_E y Hy1 w Hw.
      assume Hw1 _ _.
      assume H2: q + v * w <= v * y + x * w.
      claim Lvw: SNo (v * w).
      { exact SNo_mul_SNo v w Hv1 Hw1. }
      claim Lxw: SNo (x * w).
      { exact SNo_mul_SNo x w ?? Hw1. }
      claim Lmxw: SNo (- x * w).
      { exact SNo_minus_SNo (x * w) Lxw. }
      claim Lvy: SNo (v * y).
      { exact SNo_mul_SNo v y Hv1 ??. }
      claim Lmvy: SNo (- v * y).
      { exact SNo_minus_SNo (v * y) Lvy. }
      claim Lxmv: SNo (x + - v).
      { exact SNo_add_SNo x (- v) ?? (SNo_minus_SNo v ??). }
      claim Lymw: SNo (y + - w).
      { exact SNo_add_SNo y (- w) ?? (SNo_minus_SNo w ??). }
      apply LLx2 v Hv.
      let k. assume Hk1: k :e omega. assume Hk2: eps_ k <= x + - v.
      apply LLy2 w Hw.
      let k'. assume Hk'1: k' :e omega. assume Hk'2: eps_ k' <= y + - w.
      claim Lek: SNo (eps_ k).
      { exact SNo_eps_ k Hk1. }
      claim Lek': SNo (eps_ k').
      { exact SNo_eps_ k' Hk'1. }
      claim Lkk': k + k' :e omega.
      { exact add_SNo_In_omega k Hk1 k' Hk'1. }
      claim Lekk': SNo (eps_ (k + k')).
      { exact SNo_eps_ (k + k') Lkk'. }
      claim Lekek': SNo (eps_ k * eps_ k').
      { exact SNo_mul_SNo (eps_ k) (eps_ k') Lek Lek'. }
      claim L1a: abs_SNo (q + - (x * y)) < eps_ (k + k').
      { exact Hq2 (k + k') (add_SNo_In_omega k Hk1 k' Hk'1). }
      claim L1b: eps_ (k + k') <= abs_SNo (q + - (x * y)).
      { rewrite abs_SNo_dist_swap q (x * y) Hq1c Lxy.
        prove eps_ (k + k') <= abs_SNo (x * y + - q).
        rewrite pos_abs_SNo (x * y + - q) (SNoLt_minus_pos q (x * y) Hq1c Lxy H1).
        prove eps_ (k + k') <= x * y + - q.
        apply add_SNo_minus_Le2b (x * y) q (eps_ (k + k')) Lxy Hq1c Lekk'.
        prove eps_ (k + k') + q <= x * y.
        rewrite <- mul_SNo_eps_eps_add_SNo k Hk1 k' Hk'1.
        prove eps_ k * eps_ k' + q <= x * y.
        apply SNoLe_tra (eps_ k * eps_ k' + q)
                        ((x + - v) * (y + - w) + q)
                        (x * y)
                        (SNo_add_SNo (eps_ k * eps_ k') q ?? ??)
                        (SNo_add_SNo ((x + - v) * (y + - w)) q
                            (SNo_mul_SNo (x + - v) (y + - w) Lxmv Lymw)
                            Hq1c)
                        Lxy.
        - prove eps_ k * eps_ k' + q <= (x + - v) * (y + - w) + q.
          apply add_SNo_Le1 (eps_ k * eps_ k') q ((x + - v) * (y + - w))
                            Lekek'
                            Hq1c
                            (SNo_mul_SNo (x + - v) (y + - w) Lxmv Lymw).
          prove eps_ k * eps_ k' <= (x + - v) * (y + - w).
          apply nonneg_mul_SNo_Le2 (eps_ k) (eps_ k') (x + - v) (y + - w)
                         Lek Lek' Lxmv Lymw.
          + prove 0 <= eps_ k. apply SNoLtLe. exact SNo_eps_pos k Hk1.
          + prove 0 <= eps_ k'. apply SNoLtLe. exact SNo_eps_pos k' Hk'1.
          + prove eps_ k <= x + - v. exact Hk2.
          + prove eps_ k' <= y + - w. exact Hk'2.
        - prove (x + - v) * (y + - w) + q <= x * y.
          rewrite SNo_foil_mm x v y w Hx1 Hv1 Hy1 Hw1.
          prove (x * y + - x * w + - v * y + v * w) + q <= x * y.
          rewrite add_SNo_assoc_4 (x * y) (- x * w) (- v * y) (v * w)
                         ?? ?? ?? ??.
          prove ((x * y + - x * w + - v * y) + v * w) + q <= x * y.
          rewrite <- add_SNo_assoc
                       (x * y + - x * w + - v * y) (v * w) q
                       (SNo_add_SNo_3 (x * y) (- x * w) (- v * y) ?? ?? ??)
                       ??
                       Hq1c.                           
          prove (x * y + - x * w + - v * y) + (v * w + q) <= x * y.
          rewrite add_SNo_com (v * w) q ?? Hq1c.
          prove (x * y + - x * w + - v * y) + (q + v * w) <= x * y.
          apply SNoLe_tra ((x * y + - x * w + - v * y) + (q + v * w))
                          ((x * y + - x * w + - v * y) + (v * y + x * w))
                          (x * y)
                          (SNo_add_SNo
                           (x * y + - x * w + - v * y)
                           (q + v * w)
                           (SNo_add_SNo_3 (x * y) (- x * w) (- v * y) ?? ?? ??)
                           (SNo_add_SNo q (v * w) Hq1c ??))
                          (SNo_add_SNo
                           (x * y + - x * w + - v * y)
                           (v * y + x * w)
                           (SNo_add_SNo_3 (x * y) (- x * w) (- v * y) ?? ?? ??)
                           (SNo_add_SNo (v * y) (x * w) ?? ??))
                          (SNo_mul_SNo x y Hx1 Hy1).
          + prove (x * y + - x * w + - v * y) + (q + v * w)
               <= (x * y + - x * w + - v * y) + (v * y + x * w).
            exact add_SNo_Le2 (x * y + - x * w + - v * y)
                              (q + v * w)
                              (v * y + x * w)
                              (SNo_add_SNo_3 (x * y) (- x * w) (- v * y) ?? ?? ??)
                              (SNo_add_SNo q (v * w) Hq1c ??)
                              (SNo_add_SNo (v * y) (x * w) ?? ??)
                              H2.
          + prove (x * y + - x * w + - v * y) + (v * y + x * w)
               <= x * y.
            rewrite add_SNo_minus_SNo_prop5 (x * y) (- x * w) (v * y) (x * w) ?? ?? ?? ??.
            prove x * y + - x * w + x * w <= x * y.
            rewrite add_SNo_minus_SNo_linv (x * w) ??.
            prove x * y + 0 <= x * y.
            rewrite add_SNo_0R (x * y) ??.
            prove x * y <= x * y. apply SNoLe_ref.
      }
      apply SNoLt_irref (eps_ (k + k')).
      prove eps_ (k + k') < eps_ (k + k').
      exact SNoLeLt_tra (eps_ (k + k')) (abs_SNo (q + - (x * y))) (eps_ (k + k'))
                        Lekk'
                        (SNo_abs_SNo (q + - (x * y)) (SNo_add_SNo q (- (x * y)) Hq1c ??))
                        Lekk'
                        L1b L1a.
    + let v. assume Hv: v :e SNoR x. let w. assume Hw: w :e SNoR y.
      apply SNoR_E x Hx1 v Hv.
      assume Hv1 _ _.
      apply SNoR_E y Hy1 w Hw.
      assume Hw1 _ _.
      assume H2: q + v * w <= v * y + x * w.
      claim Lvw: SNo (v * w).
      { exact SNo_mul_SNo v w Hv1 Hw1. }
      claim Lxw: SNo (x * w).
      { exact SNo_mul_SNo x w ?? Hw1. }
      claim Lmxw: SNo (- x * w).
      { exact SNo_minus_SNo (x * w) Lxw. }
      claim Lvy: SNo (v * y).
      { exact SNo_mul_SNo v y Hv1 ??. }
      claim Lmvy: SNo (- v * y).
      { exact SNo_minus_SNo (v * y) Lvy. }
      claim Lvmx: SNo (v + - x).
      { exact SNo_add_SNo v (- x) ?? (SNo_minus_SNo x ??). }
      claim Lwmy: SNo (w + - y).
      { exact SNo_add_SNo w (- y) ?? (SNo_minus_SNo y ??). }
      apply LRx2 v Hv.
      let k. assume Hk1: k :e omega. assume Hk2: eps_ k <= v + - x.
      apply LRy2 w Hw.
      let k'. assume Hk'1: k' :e omega. assume Hk'2: eps_ k' <= w + - y.
      claim Lek: SNo (eps_ k).
      { exact SNo_eps_ k Hk1. }
      claim Lek': SNo (eps_ k').
      { exact SNo_eps_ k' Hk'1. }
      claim Lkk': k + k' :e omega.
      { exact add_SNo_In_omega k Hk1 k' Hk'1. }
      claim Lekk': SNo (eps_ (k + k')).
      { exact SNo_eps_ (k + k') Lkk'. }
      claim Lekek': SNo (eps_ k * eps_ k').
      { exact SNo_mul_SNo (eps_ k) (eps_ k') Lek Lek'. }
      claim L1c: abs_SNo (q + - (x * y)) < eps_ (k + k').
      { exact Hq2 (k + k') (add_SNo_In_omega k Hk1 k' Hk'1). }
      claim L1d: eps_ (k + k') <= abs_SNo (q + - (x * y)).
      { rewrite abs_SNo_dist_swap q (x * y) Hq1c Lxy.
        prove eps_ (k + k') <= abs_SNo (x * y + - q).
        rewrite pos_abs_SNo (x * y + - q) (SNoLt_minus_pos q (x * y) Hq1c Lxy H1).
        prove eps_ (k + k') <= x * y + - q.
        apply add_SNo_minus_Le2b (x * y) q (eps_ (k + k')) Lxy Hq1c Lekk'.
        prove eps_ (k + k') + q <= x * y.
        rewrite <- mul_SNo_eps_eps_add_SNo k Hk1 k' Hk'1.
        prove eps_ k * eps_ k' + q <= x * y.
        apply SNoLe_tra (eps_ k * eps_ k' + q)
                        ((v + - x) * (w + - y) + q)
                        (x * y)
                        (SNo_add_SNo (eps_ k * eps_ k') q ?? Hq1c)
                        (SNo_add_SNo ((v + - x) * (w + - y)) q
                            (SNo_mul_SNo (v + - x) (w + - y) ?? ??)
                            Hq1c)
                        Lxy.
        - prove eps_ k * eps_ k' + q <= (v + - x) * (w + - y) + q.
          apply add_SNo_Le1 (eps_ k * eps_ k') q ((v + - x) * (w + - y)) Lekek'
                            Hq1c
                            (SNo_mul_SNo (v + - x) (w + - y) ?? ??).
          prove eps_ k * eps_ k' <= (v + - x) * (w + - y).
          apply nonneg_mul_SNo_Le2 (eps_ k) (eps_ k') (v + - x) (w + - y) Lek Lek' ?? ??.
          + prove 0 <= eps_ k. apply SNoLtLe. exact SNo_eps_pos k Hk1.
          + prove 0 <= eps_ k'. apply SNoLtLe. exact SNo_eps_pos k' Hk'1.
          + prove eps_ k <= v + - x. exact Hk2.
          + prove eps_ k' <= w + - y. exact Hk'2.
        - prove (v + - x) * (w + - y) + q <= x * y.
          rewrite SNo_foil_mm v x w y Hv1 Hx1 Hw1 Hy1.
          prove (v * w + - v * y + - x * w + x * y) + q <= x * y.
          rewrite add_SNo_assoc_4 (v * w) (- v * y) (- x * w) (x * y) ?? ?? ?? ??.
          prove ((v * w + - v * y + - x * w) + x * y) + q <= x * y.
          rewrite <- add_SNo_assoc
                       (v * w + - v * y + - x * w) (x * y) q
                       (SNo_add_SNo_3 (v * w) (- v * y) (- x * w) ?? ?? ??)
                       ??
                       Hq1c.                           
          prove (v * w + - v * y + - x * w) + (x * y + q) <= x * y.
          rewrite add_SNo_com (x * y) q ?? Hq1c.
          prove (v * w + - v * y + - x * w) + (q + x * y) <= x * y.
          rewrite add_SNo_3a_2b (v * w) (- v * y) (- x * w) q (x * y) ?? ?? ?? ?? ??.
          prove (x * y + - v * y + - x * w) + (q + v * w) <= x * y.
          apply SNoLe_tra ((x * y + - v * y + - x * w) + (q + v * w))
                          ((x * y + - v * y + - x * w) + (v * y + x * w))
                          (x * y)
                          (SNo_add_SNo (x * y + - v * y + - x * w) (q + v * w)
                            (SNo_add_SNo_3 (x * y) (- v * y) (- x * w) ?? ?? ??)
                            (SNo_add_SNo q (v * w) ?? ??))
                          (SNo_add_SNo (x * y + - v * y + - x * w) (v * y + x * w)
                            (SNo_add_SNo_3 (x * y) (- v * y) (- x * w) ?? ?? ??)
                            (SNo_add_SNo (v * y) (x * w) ?? ??))
                          ??.
          + prove (x * y + - v * y + - x * w) + (q + v * w)
               <= (x * y + - v * y + - x * w) + (v * y + x * w).
            apply add_SNo_Le2 (x * y + - v * y + - x * w) (q + v * w) (v * y + x * w)
                              (SNo_add_SNo_3 (x * y) (- v * y) (- x * w) ?? ?? ??)
                              (SNo_add_SNo q (v * w) ?? ??)
                              (SNo_add_SNo (v * y) (x * w) ?? ??).
            prove q + v * w <= v * y + x * w. exact H2.
          + prove (x * y + - v * y + - x * w) + (v * y + x * w)
               <= x * y.
            rewrite add_SNo_com (v * y) (x * w) ?? ??.
            prove (x * y + - v * y + - x * w) + (x * w + v * y)
               <= x * y.
            rewrite add_SNo_minus_SNo_prop5 (x * y) (- v * y) (x * w) (v * y) ?? ?? ?? ??.
            prove x * y + - v * y + v * y <= x * y.
            rewrite add_SNo_minus_SNo_linv (v * y) ??.
            prove x * y + 0 <= x * y.
            rewrite add_SNo_0R (x * y) ??.
            apply SNoLe_ref.
      }
      apply SNoLt_irref (eps_ (k + k')).
      prove eps_ (k + k') < eps_ (k + k').
      exact SNoLeLt_tra (eps_ (k + k')) (abs_SNo (q + - (x * y))) (eps_ (k + k'))
                        Lekk'
                        (SNo_abs_SNo (q + - (x * y)) (SNo_add_SNo q (- (x * y)) Hq1c (SNo_minus_SNo (x * y) Lxy)))
                        Lekk'
                        L1d L1c.
  - assume H1: q = x * y. exact H1.
  - assume H1: x * y < q. prove False.
    claim Lq2: q :e SNoR (x * y).
    { apply SNoR_I.
      - exact Lxy.
      - exact Hq1c.
      - prove SNoLev q :e SNoLev (x * y).
        exact Lxy3 q Hq1c Hq1a.
      - prove x * y < q. exact H1.
    }
    apply mul_SNo_SNoR_interpolate_impred x y Hx1 Hy1 q Lq2.
    + let v. assume Hv: v :e SNoL x. let w. assume Hw: w :e SNoR y.
      apply SNoL_E x Hx1 v Hv.
      assume Hv1 _ _.
      apply SNoR_E y Hy1 w Hw.
      assume Hw1 _ _.
      assume H2: v * y + x * w <= q + v * w.
      claim Lvy: SNo (v * y).
      { exact SNo_mul_SNo v y Hv1 Hy1. }
      claim Lxw: SNo (x * w).
      { exact SNo_mul_SNo x w ?? Hw1. }
      claim Lmxw: SNo (- x * w).
      { exact SNo_minus_SNo (x * w) Lxw. }
      claim Lvw: SNo (v * w).
      { exact SNo_mul_SNo v w Hv1 ??. }
      claim Lmvw: SNo (- v * w).
      { exact SNo_minus_SNo (v * w) Lvw. }
      claim Lxmv: SNo (x + - v).
      { exact SNo_add_SNo x (- v) ?? (SNo_minus_SNo v ??). }
      claim Lwmy: SNo (w + - y).
      { exact SNo_add_SNo w (- y) ?? (SNo_minus_SNo y ??). }
      apply LLx2 v Hv.
      let k. assume Hk1: k :e omega. assume Hk2: eps_ k <= x + - v.
      apply LRy2 w Hw.
      let k'. assume Hk'1: k' :e omega. assume Hk'2: eps_ k' <= w + - y.
      claim Lek: SNo (eps_ k).
      { exact SNo_eps_ k Hk1. }
      claim Lek': SNo (eps_ k').
      { exact SNo_eps_ k' Hk'1. }
      claim Lkk': k + k' :e omega.
      { exact add_SNo_In_omega k Hk1 k' Hk'1. }
      claim Lekk': SNo (eps_ (k + k')).
      { exact SNo_eps_ (k + k') Lkk'. }
      claim Lekek': SNo (eps_ k * eps_ k').
      { exact SNo_mul_SNo (eps_ k) (eps_ k') Lek Lek'. }
      claim L1e: abs_SNo (q + - (x * y)) < eps_ (k + k').
      { exact Hq2 (k + k') (add_SNo_In_omega k Hk1 k' Hk'1). }
      claim L1f: eps_ (k + k') <= abs_SNo (q + - (x * y)).
      { rewrite pos_abs_SNo (q + - x * y) (SNoLt_minus_pos (x * y) q Lxy Hq1c H1).
        prove eps_ (k + k') <= q + - x * y.
        apply add_SNo_minus_Le2b q (x * y) (eps_ (k + k')) Hq1c Lxy Lekk'.
        prove eps_ (k + k') + x * y <= q.
        rewrite <- mul_SNo_eps_eps_add_SNo k Hk1 k' Hk'1.
        prove eps_ k * eps_ k' + x * y <= q.
        apply SNoLe_tra (eps_ k * eps_ k' + x * y)
                        ((x + - v) * (w + - y) + x * y)
                        q
                        (SNo_add_SNo (eps_ k * eps_ k') (x * y) ?? ??)
                        (SNo_add_SNo ((x + - v) * (w + - y)) (x * y)
                            (SNo_mul_SNo (x + - v) (w + - y) Lxmv Lwmy)
                            Lxy)
                        Hq1c.
        - prove eps_ k * eps_ k' + x * y <= (x + - v) * (w + - y) + x * y.
          apply add_SNo_Le1 (eps_ k * eps_ k') (x * y) ((x + - v) * (w + - y))
                            Lekek'
                            Lxy
                            (SNo_mul_SNo (x + - v) (w + - y) Lxmv Lwmy).
          prove eps_ k * eps_ k' <= (x + - v) * (w + - y).
          apply nonneg_mul_SNo_Le2 (eps_ k) (eps_ k') (x + - v) (w + - y)
                         Lek Lek' Lxmv Lwmy.
          + prove 0 <= eps_ k. apply SNoLtLe. exact SNo_eps_pos k Hk1.
          + prove 0 <= eps_ k'. apply SNoLtLe. exact SNo_eps_pos k' Hk'1.
          + prove eps_ k <= x + - v. exact Hk2.
          + prove eps_ k' <= w + - y. exact Hk'2.
        - prove (x + - v) * (w + - y) + x * y <= q.
          rewrite SNo_foil_mm x v w y Hx1 Hv1 Hw1 Hy1.
          prove (x * w + - x * y + - v * w + v * y) + x * y <= q.
          rewrite <- add_SNo_rotate_4_1 (- x * y) (- v * w) (v * y) (x * w) ?? ?? ?? ??.
          prove (- x * y + - v * w + v * y + x * w) + x * y <= q.
          rewrite add_SNo_com (- x * y + - v * w + v * y + x * w) (x * y)
                              (SNo_add_SNo_4 (- x * y) (- v * w) (v * y) (x * w) ?? ?? ?? ??)
                              ??.
          rewrite add_SNo_minus_L2' (x * y) (- v * w + v * y + x * w)
                                    ??
                                    (SNo_add_SNo_3 (- v * w) (v * y) (x * w) ?? ?? ??).
          prove - v * w + v * y + x * w <= q.
          apply SNoLe_tra (- v * w + v * y + x * w)
                          (- v * w + q + v * w)
                          q
                          (SNo_add_SNo_3 (- v * w) (v * y) (x * w) ?? ?? ??)
                          (SNo_add_SNo_3 (- v * w) q (v * w) ?? ?? ??)
                          Hq1c.
          + prove - v * w + v * y + x * w
               <= - v * w + q + v * w.
            exact add_SNo_Le2 (- v * w)
                              (v * y + x * w)
                              (q + v * w)
                              ??
                              (SNo_add_SNo (v * y) (x * w) ?? ??)
                              (SNo_add_SNo q (v * w) Hq1c ??)
                              H2.
          + prove - v * w + q + v * w <= q.
            rewrite add_SNo_com q (v * w) ?? ??.
            rewrite add_SNo_minus_L2 (v * w) q ?? ??.
            prove q <= q. apply SNoLe_ref.
      }
      apply SNoLt_irref (eps_ (k + k')).
      prove eps_ (k + k') < eps_ (k + k').
      exact SNoLeLt_tra (eps_ (k + k')) (abs_SNo (q + - (x * y))) (eps_ (k + k'))
                        Lekk'
                        (SNo_abs_SNo (q + - (x * y)) (SNo_add_SNo q (- (x * y)) Hq1c ??))
                        Lekk'
                        L1f L1e.
    + let v. assume Hv: v :e SNoR x. let w. assume Hw: w :e SNoL y.
      apply SNoR_E x Hx1 v Hv.
      assume Hv1 _ _.
      apply SNoL_E y Hy1 w Hw.
      assume Hw1 _ _.
      assume H2: v * y + x * w <= q + v * w.
      claim Lvy: SNo (v * y).
      { exact SNo_mul_SNo v y Hv1 Hy1. }
      claim Lxw: SNo (x * w).
      { exact SNo_mul_SNo x w ?? Hw1. }
      claim Lvw: SNo (v * w).
      { exact SNo_mul_SNo v w Hv1 ??. }
      claim Lmvw: SNo (- v * w).
      { exact SNo_minus_SNo (v * w) Lvw. }
      claim Lvmx: SNo (v + - x).
      { exact SNo_add_SNo v (- x) ?? (SNo_minus_SNo x ??). }
      claim Lymw: SNo (y + - w).
      { exact SNo_add_SNo y (- w) ?? (SNo_minus_SNo w ??). }
      apply LRx2 v Hv.
      let k. assume Hk1: k :e omega. assume Hk2: eps_ k <= v + - x.
      apply LLy2 w Hw.
      let k'. assume Hk'1: k' :e omega. assume Hk'2: eps_ k' <= y + - w.
      claim Lek: SNo (eps_ k).
      { exact SNo_eps_ k Hk1. }
      claim Lek': SNo (eps_ k').
      { exact SNo_eps_ k' Hk'1. }
      claim Lkk': k + k' :e omega.
      { exact add_SNo_In_omega k Hk1 k' Hk'1. }
      claim Lekk': SNo (eps_ (k + k')).
      { exact SNo_eps_ (k + k') Lkk'. }
      claim Lekek': SNo (eps_ k * eps_ k').
      { exact SNo_mul_SNo (eps_ k) (eps_ k') Lek Lek'. }
      claim L1g: abs_SNo (q + - (x * y)) < eps_ (k + k').
      { exact Hq2 (k + k') (add_SNo_In_omega k Hk1 k' Hk'1). }
      claim L1h: eps_ (k + k') <= abs_SNo (q + - (x * y)).
      { rewrite pos_abs_SNo (q + - x * y) (SNoLt_minus_pos (x * y) q Lxy Hq1c H1).
        prove eps_ (k + k') <= q + - x * y.
        apply add_SNo_minus_Le2b q (x * y) (eps_ (k + k')) Hq1c Lxy Lekk'.
        prove eps_ (k + k') + x * y <= q.
        rewrite <- mul_SNo_eps_eps_add_SNo k Hk1 k' Hk'1.
        prove eps_ k * eps_ k' + x * y <= q.
        apply SNoLe_tra (eps_ k * eps_ k' + x * y)
                        ((v + - x) * (y + - w) + x * y)
                        q
                        (SNo_add_SNo (eps_ k * eps_ k') (x * y) ?? Lxy)
                        (SNo_add_SNo ((v + - x) * (y + - w)) (x * y)
                            (SNo_mul_SNo (v + - x) (y + - w) ?? ??)
                            Lxy)
                        Hq1c.
        - prove eps_ k * eps_ k' + x * y <= (v + - x) * (y + - w) + x * y.
          apply add_SNo_Le1 (eps_ k * eps_ k') (x * y) ((v + - x) * (y + - w)) Lekek'
                            Lxy
                            (SNo_mul_SNo (v + - x) (y + - w) ?? ??).
          prove eps_ k * eps_ k' <= (v + - x) * (y + - w).
          apply nonneg_mul_SNo_Le2 (eps_ k) (eps_ k') (v + - x) (y + - w) Lek Lek' ?? ??.
          + prove 0 <= eps_ k. apply SNoLtLe. exact SNo_eps_pos k Hk1.
          + prove 0 <= eps_ k'. apply SNoLtLe. exact SNo_eps_pos k' Hk'1.
          + prove eps_ k <= v + - x. exact Hk2.
          + prove eps_ k' <= y + - w. exact Hk'2.
        - prove (v + - x) * (y + - w) + x * y <= q.
          rewrite SNo_foil_mm v x y w Hv1 Hx1 Hy1 Hw1.
          prove (v * y + - v * w + - x * y + x * w) + x * y <= q.
          rewrite add_SNo_rotate_4_1 (v * y) (- v * w) (- x * y) (x * w) ?? ?? ?? ??.
          rewrite add_SNo_rotate_4_1 (x * w) (v * y) (- v * w) (- x * y) ?? ?? ?? ??.
          prove (- x * y + x * w + v * y + - v * w) + x * y <= q.
          rewrite add_SNo_com (- x * y + x * w + v * y + - v * w) (x * y)
                              (SNo_add_SNo_4 (- x * y) (x * w) (v * y) (- v * w) ?? ?? ?? ??)
                              ??.
          prove x * y + - x * y + x * w + v * y + - v * w <= q.
          rewrite add_SNo_minus_L2' (x * y) (x * w + v * y + - v * w) ?? (SNo_add_SNo_3 (x * w) (v * y) (- v * w) ?? ?? ??).
          prove x * w + v * y + - v * w <= q.
          rewrite add_SNo_rotate_3_1 (x * w) (v * y) (- v * w) ?? ?? ??.
          prove - v * w + x * w + v * y <= q.
          apply SNoLe_tra (- v * w + x * w + v * y)
                          (- v * w + q + v * w)
                          q
                          (SNo_add_SNo_3 (- v * w) (x * w) (v * y) ?? ?? ??)
                          (SNo_add_SNo_3 (- v * w) q (v * w) ?? ?? ??)
                          ??.
          + prove - v * w + x * w + v * y
               <= - v * w + q + v * w.
            apply add_SNo_Le2 (- v * w) (x * w + v * y) (q + v * w)
                              ??
                              (SNo_add_SNo (x * w) (v * y) ?? ??)
                              (SNo_add_SNo q (v * w) ?? ??).
            prove x * w + v * y <= q + v * w.
            rewrite add_SNo_com (x * w) (v * y) ?? ??. exact H2.
          + prove - v * w + q + v * w <= q.
            rewrite add_SNo_com q (v * w) ?? ??.
            prove - v * w + v * w + q <= q.
            rewrite add_SNo_minus_L2 (v * w) q ?? ??.
            prove q <= q.
            apply SNoLe_ref.
      }
      apply SNoLt_irref (eps_ (k + k')).
      prove eps_ (k + k') < eps_ (k + k').
      exact SNoLeLt_tra (eps_ (k + k')) (abs_SNo (q + - (x * y))) (eps_ (k + k'))
                        Lekk'
                        (SNo_abs_SNo (q + - (x * y)) (SNo_add_SNo q (- (x * y)) Hq1c (SNo_minus_SNo (x * y) Lxy)))
                        Lekk'
                        L1h L1g.
}
claim LNex: exists N :e omega, eps_ N * x < 1 /\ eps_ N * y < 1.
{ apply SNoS_ordsucc_omega_bdd_eps_pos x Hx3 Hx0 Hx5.
  let N. assume HN. apply HN.
  assume HN1: N :e omega.
  assume HN2: eps_ N * x < 1.
  apply SNoS_ordsucc_omega_bdd_eps_pos y Hy3 Hy0 Hy5.
  let N'. assume HN'. apply HN'.
  assume HN'1: N' :e omega.
  assume HN'2: eps_ N' * y < 1.
  apply ordinal_trichotomy_or_impred N N'
               (nat_p_ordinal N (omega_nat_p N HN1))
               (nat_p_ordinal N' (omega_nat_p N' HN'1)).
  - assume H1: N :e N'.
    witness N'. apply andI.
    + exact HN'1.
    + apply andI.
      * { prove eps_ N' * x < 1.
          apply SNoLt_tra (eps_ N' * x) (eps_ N * x) 1
                          (SNo_mul_SNo (eps_ N') x (SNo_eps_ N' HN'1) Hx1)
                          (SNo_mul_SNo (eps_ N) x (SNo_eps_ N HN1) Hx1)
                          SNo_1.
          - prove eps_ N' * x < eps_ N * x.
            apply pos_mul_SNo_Lt' (eps_ N') (eps_ N) x (SNo_eps_ N' HN'1) (SNo_eps_ N HN1) Hx1 Hx0.
            prove eps_ N' < eps_ N.
            exact SNo_eps_decr N' HN'1 N H1.
          - exact HN2.
        }
      * exact HN'2.
  - assume H1: N = N'.
    witness N. apply andI.
    + exact HN1.
    + apply andI.
      * exact HN2.
      * rewrite H1. exact HN'2.
  - assume H1: N' :e N.
    witness N. apply andI.
    + exact HN1.
    + apply andI.
      * exact HN2.
      * { prove eps_ N * y < 1.
          apply SNoLt_tra (eps_ N * y) (eps_ N' * y) 1
                          (SNo_mul_SNo (eps_ N) y (SNo_eps_ N HN1) Hy1)
                          (SNo_mul_SNo (eps_ N') y (SNo_eps_ N' HN'1) Hy1)
                          SNo_1.
          - prove eps_ N * y < eps_ N' * y.
            apply pos_mul_SNo_Lt' (eps_ N) (eps_ N') y (SNo_eps_ N HN1) (SNo_eps_ N' HN'1) Hy1 Hy0.
            prove eps_ N < eps_ N'.
            exact SNo_eps_decr N HN1 N' H1.
          - exact HN'2.
        }
}
apply LNex.
let N. assume HN. apply HN.
assume HN1: N :e omega. assume HN. apply HN.
assume HN2: eps_ N * x < 1.
assume HN3: eps_ N * y < 1.
claim L2: forall k :e omega, exists q :e SNoS_ omega, q < x * y /\ x * y < q + eps_ k.
{ let k. assume Hk.
  claim Lek: SNo (eps_ k).
  { exact SNo_eps_ k Hk. }
  claim Lk1: k + 1 :e omega.
  { exact add_SNo_In_omega k Hk 1 (nat_p_omega 1 nat_1). }
  claim Lk2: k + 2 :e omega.
  { exact add_SNo_In_omega k Hk 2 (nat_p_omega 2 nat_2). }
  set k' := N + k + 2.
  claim Lk': k' :e omega.
  { exact add_SNo_In_omega N HN1 (k+2) Lk2. }
  claim Lek': SNo (eps_ k').
  { exact SNo_eps_ k' Lk'. }
  apply Lx7 k' Lk'.
  let q.
  assume Hq1: q :e SNoS_ omega.
  assume Hqpos: 0 < q.
  assume Hq2: q < x.
  assume Hq3: x < q + eps_ k'.
  apply SNoS_E2 omega omega_ordinal q Hq1.
  assume Hq1a Hq1b Hq1c Hq1d.
  apply Ly7 k' Lk'.
  let q'.
  assume Hq'1: q' :e SNoS_ omega.
  assume Hq'pos: 0 < q'.
  assume Hq'2: q' < y.
  assume Hq'3: y < q' + eps_ k'.
  apply SNoS_E2 omega omega_ordinal q' Hq'1.
  assume Hq'1a Hq'1b Hq'1c Hq'1d.
  claim Lqq': SNo (q * q').
  { exact SNo_mul_SNo q q' Hq1c Hq'1c. }
  witness (q * q'). apply andI.
  + prove q * q' :e SNoS_ omega.
    exact mul_SNo_SNoS_omega q Hq1 q' Hq'1.
  + apply andI.
    * prove q * q' < x * y.
      exact pos_mul_SNo_Lt2 q q' x y Hq1c Hq'1c Hx1 Hy1 Hqpos Hq'pos Hq2 Hq'2.
    * { prove x * y < q * q' + eps_ k.
        apply SNoLt_tra (x * y) ((q + eps_ k') * (q' + eps_ k')) (q * q' + eps_ k)
                        Lxy
                        (SNo_mul_SNo
                          (q + eps_ k')
                          (q' + eps_ k')
                          (SNo_add_SNo q (eps_ k') Hq1c Lek')
                          (SNo_add_SNo q' (eps_ k') Hq'1c Lek'))
                        (SNo_add_SNo (q * q') (eps_ k) (SNo_mul_SNo q q' Hq1c Hq'1c) Lek).
        - prove x * y < (q + eps_ k') * (q' + eps_ k').
          exact pos_mul_SNo_Lt2 x y (q + eps_ k') (q' + eps_ k')
                                Hx1 Hy1
                                (SNo_add_SNo q (eps_ k') Hq1c Lek')
                                (SNo_add_SNo q' (eps_ k') Hq'1c Lek')
                                Hx0 Hy0 Hq3 Hq'3.
        - prove (q + eps_ k') * (q' + eps_ k') < q * q' + eps_ k.
          rewrite SNo_foil q (eps_ k') q' (eps_ k') Hq1c Lek' Hq'1c Lek'.
          prove q * q' + q * eps_ k' + eps_ k' * q' + eps_ k' * eps_ k' < q * q' + eps_ k.
          apply add_SNo_Lt2 (q * q') (q * eps_ k' + eps_ k' * q' + eps_ k' * eps_ k') (eps_ k)
                            Lqq'
                            (SNo_add_SNo_3 (q * eps_ k') (eps_ k' * q') (eps_ k' * eps_ k')
                                           (SNo_mul_SNo q (eps_ k') Hq1c Lek')
                                           (SNo_mul_SNo (eps_ k') q' Lek' Hq'1c)
                                           (SNo_mul_SNo (eps_ k') (eps_ k') Lek' Lek'))
                            Lek.
          prove q * eps_ k' + eps_ k' * q' + eps_ k' * eps_ k' < eps_ k.
          prove q * eps_ (N + k + 2) + eps_ (N + k + 2) * q' + eps_ (N + k + 2) * eps_ (N + k + 2) < eps_ k.
          rewrite <- mul_SNo_eps_eps_add_SNo N HN1 (k + 2) Lk2.
          prove q * eps_ N * eps_ (k + 2) + (eps_ N * eps_ (k + 2)) * q' + (eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2)) < eps_ k.
          rewrite <- eps_ordsucc_half_add k (omega_nat_p k Hk).
          prove q * eps_ N * eps_ (k + 2) + (eps_ N * eps_ (k + 2)) * q' + (eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2)) < eps_ (ordsucc k) + eps_ (ordsucc k).
          rewrite <- eps_ordsucc_half_add (ordsucc k) (nat_ordsucc k (omega_nat_p k Hk)) at 1.
          prove q * eps_ N * eps_ (k + 2) + (eps_ N * eps_ (k + 2)) * q' + (eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2)) < (eps_ (ordsucc (ordsucc k)) + eps_ (ordsucc (ordsucc k))) + eps_ (ordsucc k).
          rewrite <- add_SNo_1_ordsucc k Hk.
          prove q * eps_ N * eps_ (k + 2) + (eps_ N * eps_ (k + 2)) * q' + (eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2)) < (eps_ (ordsucc (k + 1)) + eps_ (ordsucc (k + 1))) + eps_ (k + 1).
          rewrite <- add_SNo_1_ordsucc (k+1) (add_SNo_In_omega k Hk 1 (nat_p_omega 1 nat_1)).
          prove q * eps_ N * eps_ (k + 2) + (eps_ N * eps_ (k + 2)) * q' + (eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2)) < (eps_ (((k + 1) + 1)) + eps_ (((k + 1) + 1))) + eps_ (k + 1).
          rewrite <- add_SNo_assoc k 1 1 (omega_SNo k Hk) SNo_1 SNo_1.
          rewrite add_SNo_1_1_2.
          prove q * eps_ N * eps_ (k + 2) + (eps_ N * eps_ (k + 2)) * q' + (eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2)) < (eps_ (k + 2) + eps_ (k + 2)) + eps_ (k + 1).
          claim LeN: SNo (eps_ N).
          { exact SNo_eps_ N HN1. }
          claim Lek1: SNo (eps_ (k + 1)).
          { exact SNo_eps_ (k+1) Lk1. }
          claim Lek2: SNo (eps_ (k + 2)).
          { exact SNo_eps_ (k+2) Lk2. }
          claim LeNek2: SNo (eps_ N * eps_ (k + 2)).
          { exact SNo_mul_SNo (eps_ N) (eps_ (k + 2)) LeN Lek2. }
          claim LeNek2sq: SNo ((eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2))).
          { exact SNo_mul_SNo (eps_ N * eps_ (k + 2)) (eps_ N * eps_ (k + 2)) LeNek2 LeNek2. }
          rewrite <- add_SNo_assoc (eps_ (k + 2)) (eps_ (k + 2)) (eps_ (k + 1))
                                   Lek2 Lek2 Lek1.
          apply add_SNo_Lt4 (q * eps_ N * eps_ (k + 2))
                            ((eps_ N * eps_ (k + 2)) * q')
                            ((eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2)))
                            (eps_ (k + 2))
                            (eps_ (k + 2))
                            (eps_ (k + 1))
                            (SNo_mul_SNo q (eps_ N * eps_ (k + 2)) Hq1c LeNek2)
                            (SNo_mul_SNo (eps_ N * eps_ (k + 2)) q' LeNek2 Hq'1c)
                            LeNek2sq Lek2 Lek2 Lek1.
          + prove q * eps_ N * eps_ (k + 2) < eps_ (k+2).
            rewrite mul_SNo_assoc q (eps_ N) (eps_ (k+2)) Hq1c LeN Lek2.
            prove (q * eps_ N) * eps_ (k + 2) < eps_ (k+2).
            apply mul_SNo_Lt1_pos_Lt (q * eps_ N) (eps_ (k + 2)) (SNo_mul_SNo q (eps_ N) Hq1c LeN) Lek2.
            * { prove q * eps_ N < 1.
                apply SNoLt_tra (q * eps_ N) (x * eps_ N) 1
                         (SNo_mul_SNo q (eps_ N) Hq1c LeN)
                         (SNo_mul_SNo x (eps_ N) Hx1 LeN)
                         SNo_1.
                - prove q * eps_ N < x * eps_ N.
                  apply pos_mul_SNo_Lt' q x (eps_ N) Hq1c Hx1 (SNo_eps_ N HN1).
                  + prove 0 < eps_ N. exact SNo_eps_pos N HN1.
                  + prove q < x. exact Hq2.
                - prove x * eps_ N < 1.
                  rewrite mul_SNo_com x (eps_ N) Hx1 LeN.
                  exact HN2.
              }
            * prove 0 < eps_ (k+2).
              exact SNo_eps_pos (k+2) Lk2.
          + prove (eps_ N * eps_ (k + 2)) * q' < eps_ (k+2).
            rewrite mul_SNo_com (eps_ N * eps_ (k+2)) q' (SNo_mul_SNo (eps_ N) (eps_ (k+2)) LeN Lek2) Hq'1c.
            prove q' * (eps_ N * eps_ (k + 2)) < eps_ (k+2).
            rewrite mul_SNo_assoc q' (eps_ N) (eps_ (k+2)) Hq'1c LeN Lek2.
            prove (q' * eps_ N) * eps_ (k + 2) < eps_ (k+2).
            apply mul_SNo_Lt1_pos_Lt (q' * eps_ N) (eps_ (k + 2)) (SNo_mul_SNo q' (eps_ N) Hq'1c LeN) Lek2.
            * { prove q' * eps_ N < 1.
                apply SNoLt_tra (q' * eps_ N) (y * eps_ N) 1
                         (SNo_mul_SNo q' (eps_ N) Hq'1c LeN)
                         (SNo_mul_SNo y (eps_ N) Hy1 LeN)
                         SNo_1.
                - prove q' * eps_ N < y * eps_ N.
                  apply pos_mul_SNo_Lt' q' y (eps_ N) Hq'1c Hy1 (SNo_eps_ N HN1).
                  + prove 0 < eps_ N. exact SNo_eps_pos N HN1.
                  + prove q' < y. exact Hq'2.
                - prove y * eps_ N < 1.
                  rewrite mul_SNo_com y (eps_ N) Hy1 LeN.
                  exact HN3.
              }
            * prove 0 < eps_ (k+2).
              exact SNo_eps_pos (k+2) Lk2.
          + prove (eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2)) < eps_ (k+1).
            apply SNoLeLt_tra ((eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2))) (eps_ (k+2)) (eps_ (k+1))
                            LeNek2sq Lek2 Lek1.
            * { prove (eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2)) <= eps_ (k+2).
                apply SNoLe_tra ((eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2))) (eps_ N * eps_ (k + 2)) (eps_ (k+2))
                                LeNek2sq LeNek2 Lek2.
                - prove (eps_ N * eps_ (k + 2)) * (eps_ N * eps_ (k + 2)) <= eps_ N * eps_ (k + 2).
                  apply mul_SNo_Le1_nonneg_Le (eps_ N * eps_ (k + 2)) (eps_ N * eps_ (k+2)) LeNek2 LeNek2.
                  + prove eps_ N * eps_ (k+2) <= 1.
                    rewrite <- mul_SNo_oneL 1 SNo_1 at 2.
                    prove eps_ N * eps_ (k+2) <= 1 * 1.
                    apply nonneg_mul_SNo_Le2 (eps_ N) (eps_ (k+2)) 1 1 LeN Lek2 SNo_1 SNo_1.
                    * prove 0 <= eps_ N. apply SNoLtLe. exact SNo_eps_pos N HN1.
                    * prove 0 <= eps_ (k+2). apply SNoLtLe. exact SNo_eps_pos (k+2) Lk2.
                    * prove eps_ N <= 1. apply eps_bd_1. exact HN1.
                    * prove eps_ (k+2) <= 1.  apply eps_bd_1. exact Lk2.
                  + prove 0 <= eps_ N * eps_ (k+2).
                    apply SNoLtLe.
                    apply mul_SNo_pos_pos (eps_ N) (eps_ (k+2)) LeN Lek2.
                    * exact SNo_eps_pos N HN1.
                    * exact SNo_eps_pos (k+2) Lk2.
                - prove eps_ N * eps_ (k + 2) <= eps_ (k+2).
                  apply mul_SNo_Le1_nonneg_Le (eps_ N) (eps_ (k+2)) LeN Lek2.
                  + prove eps_ N <= 1. apply eps_bd_1. exact HN1.
                  + prove 0 <= eps_ (k+2). apply SNoLtLe. exact SNo_eps_pos (k+2) Lk2.
              }
            * prove eps_ (k+2) < eps_ (k+1).
              apply SNo_eps_decr (k+2) Lk2 (k+1).
              prove k+1 :e k+2.
              apply ordinal_SNoLt_In (k+1) (k+2)
                        (nat_p_ordinal (k+1) (omega_nat_p (k+1) Lk1))
                        (nat_p_ordinal (k+2) (omega_nat_p (k+2) Lk2)).
              prove k+1 < k+2.
              apply add_SNo_Lt2 k 1 2 (omega_SNo k Hk) SNo_1 SNo_2.
              prove 1 < 2.
              exact SNoLt_1_2.
      }
}      
apply SNo_prereal_incr_lower_approx (x * y) Lxy L1 L2.
let hL. assume HhL. apply HhL.
assume HhL1: hL :e SNoS_ omega :^: omega.
assume HhL2: forall n :e omega, hL n < x * y /\ x * y < hL n + eps_ n
                             /\ forall i :e n, hL i < hL n.
apply SNo_prereal_decr_upper_approx (x * y) Lxy L1 L2.
let hR. assume HhR. apply HhR.
assume HhR1: hR :e SNoS_ omega :^: omega.
assume HhR2: forall n :e omega, hR n + - eps_ n < x * y /\ x * y < hR n
                             /\ forall i :e n, hR n < hR i.
claim LhL: forall n :e omega, SNo (hL n).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (hL n) (ap_Pi omega (fun _ => SNoS_ omega) hL n HhL1 Hn).
  assume _ _ H _. exact H.
}
claim LhR: forall n :e omega, SNo (hR n).
{ let n. assume Hn.
  apply SNoS_E2 omega omega_ordinal (hR n) (ap_Pi omega (fun _ => SNoS_ omega) hR n HhR1 Hn).
  assume _ _ H _. exact H.
}
claim L3: forall n :e omega, hL n < x * y.
{ let n. assume Hn.
  apply HhL2 n Hn. assume H _. apply H. assume H _. exact H.
}
claim L4: forall n :e omega, x * y < hR n.
{ let n. assume Hn.
  apply HhR2 n Hn. assume H _. apply H. assume _ H. exact H.
}
claim L5: forall n m :e omega, hL n < hR m.
{ let n. assume Hn. let m. assume Hm.
  apply SNoLt_tra (hL n) (x * y) (hR m) (LhL n Hn) Lxy (LhR m Hm).
  - prove hL n < x * y. exact L3 n Hn.
  - prove x * y < hR m. exact L4 m Hm.
}
apply SNo_approx_real_lem hL HhL1 hR HhR1 L5.
assume HhLR1: SNoCutP {hL n|n :e omega} {hR n|n :e omega}.
assume HhLR2: SNo (SNoCut {hL n|n :e omega} {hR n|n :e omega}).
assume _ _.
assume HhLR5: forall n :e omega, hL n < SNoCut {hL n|n :e omega} {hR n|n :e omega}.
assume HhLR6: forall n :e omega, SNoCut {hL n|n :e omega} {hR n|n :e omega} < hR n.
claim L6: forall n :e omega, x * y < hL n + eps_ n.
{ let n. assume Hn.
  apply HhL2 n Hn. assume H _. apply H. assume _ H. exact H.
}
claim L7: forall n :e omega, forall i :e n, hL i < hL n.
{ let n. assume Hn.
  apply HhL2 n Hn. assume _ H. exact H.
}
claim L8: forall n :e omega, hR n + - eps_ n < x * y.
{ let n. assume Hn.
  apply HhR2 n Hn. assume H _. apply H. assume H _. exact H.
}
claim L9: forall n :e omega, forall i :e n, hR n < hR i.
{ let n. assume Hn.
  apply HhR2 n Hn. assume _ H. exact H.
}
claim L10: x * y = SNoCut {hL n|n :e omega} {hR n|n :e omega}.
{ rewrite HxyLR.
  prove SNoCut L R = SNoCut {hL n|n :e omega} {hR n|n :e omega}.
  apply SNoCut_ext L R {hL n|n :e omega} {hR n|n :e omega}
                   HLR HhLR1.
  - let w. assume Hw: w :e L.
    prove w < SNoCut {hL n|n :e omega} {hR n|n :e omega}.
    apply HLE w Hw.
    + let w0. assume Hw0: w0 :e SNoL x.
      let w1. assume Hw1: w1 :e SNoL y.
      assume Hwe: w = w0 * y + x * w1 + - w0 * w1.
      apply LLx2 w0 Hw0.
      let k0. assume Hk0: k0 :e omega.
      assume Hk0b: eps_ k0 <= x + - w0.
      apply LLy2 w1 Hw1.
      let k1. assume Hk1: k1 :e omega.
      assume Hk1b: eps_ k1 <= y + - w1.
      apply SNoL_E x Hx1 w0 Hw0.
      assume Hw01: SNo w0.
      assume Hw02: SNoLev w0 :e SNoLev x.
      assume Hw03: w0 < x.
      apply SNoL_E y Hy1 w1 Hw1.
      assume Hw11: SNo w1.
      assume Hw12: SNoLev w1 :e SNoLev y.
      assume Hw13: w1 < y.
      claim Lek0: SNo (eps_ k0).
      { exact SNo_eps_ k0 Hk0. }
      claim Lek1: SNo (eps_ k1).
      { exact SNo_eps_ k1 Hk1. }
      claim Lk0k1: k0 + k1 :e omega.
      { exact add_SNo_In_omega k0 Hk0 k1 Hk1. }
      claim Lek0k1: SNo (eps_ (k0 + k1)).
      { exact SNo_eps_ (k0 + k1) Lk0k1. }
      claim LhLk0k1: SNo (hL (k0 + k1)).
      { exact LhL (k0 + k1) Lk0k1. }
      claim Lw0y: SNo (w0 * y).
      { exact SNo_mul_SNo w0 y Hw01 Hy1. }
      claim Lxw1: SNo (x * w1).
      { exact SNo_mul_SNo x w1 Hx1 Hw11. }
      claim Lw0w1: SNo (w0 * w1).
      { exact SNo_mul_SNo w0 w1 Hw01 Hw11. }
      claim Lmw0w1: SNo (- w0 * w1).
      { exact SNo_minus_SNo (w0 * w1) Lw0w1. }
      claim Lw0yxw1mw0w1: SNo (w0 * y + x * w1 + - w0 * w1).
      { exact SNo_add_SNo_3 (w0 * y) (x * w1) (- w0 * w1) Lw0y Lxw1 Lmw0w1. }
      rewrite Hwe.
      apply SNoLeLt_tra (w0 * y + x * w1 + - w0 * w1)
                        (hL (k0 + k1))
                        (SNoCut {hL n|n :e omega} {hR n|n :e omega})
                        Lw0yxw1mw0w1
                        LhLk0k1
                        HhLR2.
      * { prove w0 * y + x * w1 + - w0 * w1 <= hL (k0 + k1).
          apply SNoLtLe_or (hL (k0 + k1)) (w0 * y + x * w1 + - w0 * w1) LhLk0k1 Lw0yxw1mw0w1.
          - assume H1: hL (k0 + k1) < w0 * y + x * w1 + - w0 * w1. prove False.
            apply SNoLt_irref (x * y).
            prove x * y < x * y.
            apply SNoLt_tra (x * y) (hL (k0 + k1) + eps_ (k0 + k1)) (x * y)
                            Lxy (SNo_add_SNo (hL (k0 + k1)) (eps_ (k0 + k1)) LhLk0k1 Lek0k1) Lxy
                            (L6 (k0 + k1) Lk0k1).
            prove hL (k0 + k1) + eps_ (k0 + k1) < x * y.
            apply SNoLtLe_tra (hL (k0 + k1) + eps_ (k0 + k1))
                              ((w0 * y + x * w1 + - w0 * w1) + eps_ (k0 + k1))
                              (x * y)
                              (SNo_add_SNo (hL (k0 + k1)) (eps_ (k0 + k1)) LhLk0k1 Lek0k1)
                              (SNo_add_SNo (w0 * y + x * w1 + - w0 * w1) (eps_ (k0 + k1)) Lw0yxw1mw0w1 Lek0k1)
                              Lxy.
            + prove hL (k0 + k1) + eps_ (k0 + k1) < (w0 * y + x * w1 + - w0 * w1) + eps_ (k0 + k1).
              apply add_SNo_Lt1 (hL (k0 + k1)) (eps_ (k0 + k1)) (w0 * y + x * w1 + - w0 * w1)
                                LhLk0k1 Lek0k1 Lw0yxw1mw0w1.
              exact H1.
            + prove (w0 * y + x * w1 + - w0 * w1) + eps_ (k0 + k1) <= x * y.
              rewrite add_SNo_com (w0 * y + x * w1 + - w0 * w1) (eps_ (k0 + k1)) Lw0yxw1mw0w1 Lek0k1.
              apply add_SNo_minus_Le2 (x * y) (w0 * y + x * w1 + - w0 * w1) (eps_ (k0 + k1)) Lxy Lw0yxw1mw0w1 Lek0k1.
              prove eps_ (k0 + k1) <= x * y + - (w0 * y + x * w1 + - w0 * w1).
              rewrite add_SNo_com_3_0_1 (w0 * y) (x * w1) (- w0 * w1) Lw0y Lxw1 Lmw0w1.
              prove eps_ (k0 + k1) <= x * y + - (x * w1 + w0 * y + - w0 * w1).
              rewrite minus_add_SNo_distr_3 (x * w1) (w0 * y) (- w0 * w1) Lxw1 Lw0y Lmw0w1.
              prove eps_ (k0 + k1) <= x * y + - x * w1 + - w0 * y + - - w0 * w1.
              rewrite <- mul_SNo_minus_distrL w0 y Hw01 Hy1.
              rewrite <- mul_SNo_minus_distrL w0 w1 Hw01 Hw11.
              prove eps_ (k0 + k1) <= x * y + - x * w1 + (- w0) * y + - (- w0) * w1.
              rewrite <- mul_SNo_minus_distrR x w1 Hx1 Hw11.
              rewrite <- mul_SNo_minus_distrR (- w0) w1 (SNo_minus_SNo w0 Hw01) Hw11.
              prove eps_ (k0 + k1) <= x * y + x * (- w1) + (- w0) * y + (- w0) * (- w1).
              rewrite <- SNo_foil x (- w0) y (- w1) Hx1 (SNo_minus_SNo w0 Hw01) Hy1 (SNo_minus_SNo w1 Hw11).
              prove eps_ (k0 + k1) <= (x + - w0) * (y + - w1).
              rewrite <- mul_SNo_eps_eps_add_SNo k0 Hk0 k1 Hk1.
              prove eps_ k0 * eps_ k1 <= (x + - w0) * (y + - w1).
              apply nonneg_mul_SNo_Le2 (eps_ k0) (eps_ k1) (x + - w0) (y + - w1) Lek0 Lek1 (SNo_add_SNo x (- w0) Hx1 (SNo_minus_SNo w0 Hw01)) (SNo_add_SNo y (- w1) Hy1 (SNo_minus_SNo w1 Hw11)).
              * prove 0 <= eps_ k0. apply SNoLtLe. exact SNo_eps_pos k0 Hk0.
              * prove 0 <= eps_ k1. apply SNoLtLe. exact SNo_eps_pos k1 Hk1.
              * prove eps_ k0 <= x + - w0. exact Hk0b.
              * prove eps_ k1 <= y + - w1. exact Hk1b.
          - assume H1: w0 * y + x * w1 + - w0 * w1 <= hL (k0 + k1). exact H1.
        }
      * prove hL (k0 + k1) < SNoCut {hL n|n :e omega} {hR n|n :e omega}.
        exact HhLR5 (k0 + k1) Lk0k1.
    + let z0. assume Hz0: z0 :e SNoR x.
      let z1. assume Hz1: z1 :e SNoR y.
      assume Hwe: w = z0 * y + x * z1 + - z0 * z1.
      apply LRx2 z0 Hz0.
      let k0. assume Hk0: k0 :e omega.
      assume Hk0b: eps_ k0 <= z0 + - x.
      apply LRy2 z1 Hz1.
      let k1. assume Hk1: k1 :e omega.
      assume Hk1b: eps_ k1 <= z1 + - y.
      apply SNoR_E x Hx1 z0 Hz0.
      assume Hz01: SNo z0.
      assume Hz02: SNoLev z0 :e SNoLev x.
      assume Hz03: x < z0.
      apply SNoR_E y Hy1 z1 Hz1.
      assume Hz11: SNo z1.
      assume Hz12: SNoLev z1 :e SNoLev y.
      assume Hz13: y < z1.
      claim Lek0: SNo (eps_ k0).
      { exact SNo_eps_ k0 Hk0. }
      claim Lek1: SNo (eps_ k1).
      { exact SNo_eps_ k1 Hk1. }
      claim Lk0k1: k0 + k1 :e omega.
      { exact add_SNo_In_omega k0 Hk0 k1 Hk1. }
      claim Lek0k1: SNo (eps_ (k0 + k1)).
      { exact SNo_eps_ (k0 + k1) Lk0k1. }
      claim LhLk0k1: SNo (hL (k0 + k1)).
      { exact LhL (k0 + k1) Lk0k1. }
      claim Lz0y: SNo (z0 * y).
      { exact SNo_mul_SNo z0 y Hz01 Hy1. }
      claim Lxz1: SNo (x * z1).
      { exact SNo_mul_SNo x z1 Hx1 Hz11. }
      claim Lz0z1: SNo (z0 * z1).
      { exact SNo_mul_SNo z0 z1 Hz01 Hz11. }
      claim Lmz0z1: SNo (- z0 * z1).
      { exact SNo_minus_SNo (z0 * z1) Lz0z1. }
      claim Lz0yxz1mz0z1: SNo (z0 * y + x * z1 + - z0 * z1).
      { exact SNo_add_SNo_3 (z0 * y) (x * z1) (- z0 * z1) Lz0y Lxz1 Lmz0z1. }
      rewrite Hwe.
      apply SNoLeLt_tra (z0 * y + x * z1 + - z0 * z1)
                        (hL (k0 + k1))
                        (SNoCut {hL n|n :e omega} {hR n|n :e omega})
                        Lz0yxz1mz0z1
                        LhLk0k1
                        HhLR2.
      * { prove z0 * y + x * z1 + - z0 * z1 <= hL (k0 + k1).
          apply SNoLtLe_or (hL (k0 + k1)) (z0 * y + x * z1 + - z0 * z1) LhLk0k1 Lz0yxz1mz0z1.
          - assume H1: hL (k0 + k1) < z0 * y + x * z1 + - z0 * z1. prove False.
            apply SNoLt_irref (x * y).
            prove x * y < x * y.
            apply SNoLt_tra (x * y) (hL (k0 + k1) + eps_ (k0 + k1)) (x * y)
                            Lxy (SNo_add_SNo (hL (k0 + k1)) (eps_ (k0 + k1)) LhLk0k1 Lek0k1) Lxy
                            (L6 (k0 + k1) Lk0k1).
            prove hL (k0 + k1) + eps_ (k0 + k1) < x * y.
            apply SNoLtLe_tra (hL (k0 + k1) + eps_ (k0 + k1))
                              ((z0 * y + x * z1 + - z0 * z1) + eps_ (k0 + k1))
                              (x * y)
                              (SNo_add_SNo (hL (k0 + k1)) (eps_ (k0 + k1)) LhLk0k1 Lek0k1)
                              (SNo_add_SNo (z0 * y + x * z1 + - z0 * z1) (eps_ (k0 + k1)) Lz0yxz1mz0z1 Lek0k1)
                              Lxy.
            + prove hL (k0 + k1) + eps_ (k0 + k1) < (z0 * y + x * z1 + - z0 * z1) + eps_ (k0 + k1).
              apply add_SNo_Lt1 (hL (k0 + k1)) (eps_ (k0 + k1)) (z0 * y + x * z1 + - z0 * z1)
                                LhLk0k1 Lek0k1 Lz0yxz1mz0z1.
              exact H1.
            + prove (z0 * y + x * z1 + - z0 * z1) + eps_ (k0 + k1) <= x * y.
              rewrite add_SNo_com (z0 * y + x * z1 + - z0 * z1) (eps_ (k0 + k1)) Lz0yxz1mz0z1 Lek0k1.
              apply add_SNo_minus_Le2 (x * y) (z0 * y + x * z1 + - z0 * z1) (eps_ (k0 + k1)) Lxy Lz0yxz1mz0z1 Lek0k1.
              prove eps_ (k0 + k1) <= x * y + - (z0 * y + x * z1 + - z0 * z1).
              rewrite add_SNo_com (x * y) (- (z0 * y + x * z1 + - z0 * z1))
                                  Lxy (SNo_minus_SNo (z0 * y + x * z1 + - z0 * z1) Lz0yxz1mz0z1).
              rewrite add_SNo_rotate_3_1 (z0 * y) (x * z1) (- z0 * z1) Lz0y Lxz1 Lmz0z1.
              rewrite minus_add_SNo_distr_3 (- z0 * z1) (z0 * y) (x * z1) Lmz0z1 Lz0y Lxz1.
              rewrite minus_SNo_invol (z0 * z1) Lz0z1.
              prove eps_ (k0 + k1) <= (z0 * z1 + - z0 * y + - x * z1) + x * y.
              rewrite <- add_SNo_assoc_4 (z0 * z1) (- z0 * y) (- x * z1) (x * y)
                                         Lz0z1
                                         (SNo_minus_SNo (z0 * y) Lz0y)
                                         (SNo_minus_SNo (x * z1) Lxz1)
                                         Lxy.
              prove eps_ (k0 + k1) <= z0 * z1 + - z0 * y + - x * z1 + x * y.
              rewrite <- mul_SNo_minus_distrR z0 y Hz01 Hy1.
              rewrite <- mul_SNo_minus_distrL x z1 Hx1 Hz11.
              prove eps_ (k0 + k1) <= z0 * z1 + z0 * (- y) + (- x) * z1 + x * y.
              rewrite <- mul_SNo_minus_minus x y Hx1 Hy1.
              prove eps_ (k0 + k1) <= z0 * z1 + z0 * (- y) + (- x) * z1 + (- x) * (- y).
              rewrite <- SNo_foil z0 (- x) z1 (- y) Hz01 (SNo_minus_SNo x Hx1) Hz11 (SNo_minus_SNo y Hy1).
              prove eps_ (k0 + k1) <= (z0 + - x) * (z1 + - y).
              rewrite <- mul_SNo_eps_eps_add_SNo k0 Hk0 k1 Hk1.
              prove eps_ k0 * eps_ k1 <= (z0 + - x) * (z1 + - y).
              apply nonneg_mul_SNo_Le2 (eps_ k0) (eps_ k1) (z0 + - x) (z1 + - y) Lek0 Lek1 (SNo_add_SNo z0 (- x) Hz01 (SNo_minus_SNo x Hx1)) (SNo_add_SNo z1 (- y) Hz11 (SNo_minus_SNo y Hy1)).
              * prove 0 <= eps_ k0. apply SNoLtLe. exact SNo_eps_pos k0 Hk0.
              * prove 0 <= eps_ k1. apply SNoLtLe. exact SNo_eps_pos k1 Hk1.
              * prove eps_ k0 <= z0 + - x. exact Hk0b.
              * prove eps_ k1 <= z1 + - y. exact Hk1b.
          - assume H1: z0 * y + x * z1 + - z0 * z1 <= hL (k0 + k1). exact H1.
        }
      * prove hL (k0 + k1) < SNoCut {hL n|n :e omega} {hR n|n :e omega}.
        exact HhLR5 (k0 + k1) Lk0k1.
  - let z. assume Hz: z :e R.
    prove SNoCut {hL n|n :e omega} {hR n|n :e omega} < z.
    apply HRE z Hz.
    + let w0. assume Hw0: w0 :e SNoL x.
      let z1. assume Hz1: z1 :e SNoR y.
      assume Hze: z = w0 * y + x * z1 + - w0 * z1.
      apply LLx2 w0 Hw0.
      let k0. assume Hk0: k0 :e omega.
      assume Hk0b: eps_ k0 <= x + - w0.
      apply LRy2 z1 Hz1.
      let k1. assume Hk1: k1 :e omega.
      assume Hk1b: eps_ k1 <= z1 + - y.
      apply SNoL_E x Hx1 w0 Hw0.
      assume Hw01: SNo w0.
      assume Hw02: SNoLev w0 :e SNoLev x.
      assume Hw03: w0 < x.
      apply SNoR_E y Hy1 z1 Hz1.
      assume Hz11: SNo z1.
      assume Hz12: SNoLev z1 :e SNoLev y.
      assume Hz13: y < z1.
      claim Lek0: SNo (eps_ k0).
      { exact SNo_eps_ k0 Hk0. }
      claim Lek1: SNo (eps_ k1).
      { exact SNo_eps_ k1 Hk1. }
      claim Lk0k1: k0 + k1 :e omega.
      { exact add_SNo_In_omega k0 Hk0 k1 Hk1. }
      claim Lek0k1: SNo (eps_ (k0 + k1)).
      { exact SNo_eps_ (k0 + k1) Lk0k1. }
      claim Lmek0k1: SNo (- eps_ (k0 + k1)).
      { exact SNo_minus_SNo (eps_ (k0 + k1)) Lek0k1. }
      claim LhRk0k1: SNo (hR (k0 + k1)).
      { exact LhR (k0 + k1) Lk0k1. }
      claim Lw0y: SNo (w0 * y).
      { exact SNo_mul_SNo w0 y Hw01 Hy1. }
      claim Lxz1: SNo (x * z1).
      { exact SNo_mul_SNo x z1 Hx1 Hz11. }
      claim Lw0z1: SNo (w0 * z1).
      { exact SNo_mul_SNo w0 z1 Hw01 Hz11. }
      claim Lmw0z1: SNo (- w0 * z1).
      { exact SNo_minus_SNo (w0 * z1) Lw0z1. }
      claim Lw0yxz1mw0z1: SNo (w0 * y + x * z1 + - w0 * z1).
      { exact SNo_add_SNo_3 (w0 * y) (x * z1) (- w0 * z1) Lw0y Lxz1 Lmw0z1. }
      rewrite Hze.
      apply SNoLtLe_tra (SNoCut {hL n|n :e omega} {hR n|n :e omega})
                        (hR (k0 + k1))
                        (w0 * y + x * z1 + - w0 * z1)
                        HhLR2
                        LhRk0k1
                        Lw0yxz1mw0z1.
      * prove SNoCut {hL n|n :e omega} {hR n|n :e omega} < hR (k0 + k1).
        exact HhLR6 (k0 + k1) Lk0k1.
      * { prove hR (k0 + k1) <= w0 * y + x * z1 + - w0 * z1.
          apply SNoLtLe_or (w0 * y + x * z1 + - w0 * z1) (hR (k0 + k1)) Lw0yxz1mw0z1 LhRk0k1.
          - assume H1: w0 * y + x * z1 + - w0 * z1 < hR (k0 + k1). prove False.
            apply SNoLt_irref (x * y).
            prove x * y < x * y.
            apply SNoLt_tra (x * y) (hR (k0 + k1) + - eps_ (k0 + k1)) (x * y)
                            Lxy (SNo_add_SNo (hR (k0 + k1)) (- eps_ (k0 + k1)) LhRk0k1 Lmek0k1) Lxy.
            + prove x * y < hR (k0 + k1) + - eps_ (k0 + k1).
              apply SNoLeLt_tra (x * y)
                                ((w0 * y + x * z1 + - w0 * z1) + - eps_ (k0 + k1))
                                (hR (k0 + k1) + - eps_ (k0 + k1))
                                Lxy
                                (SNo_add_SNo (w0 * y + x * z1 + - w0 * z1) (- eps_ (k0 + k1)) Lw0yxz1mw0z1 Lmek0k1)
                                (SNo_add_SNo (hR (k0 + k1)) (- eps_ (k0 + k1)) LhRk0k1 Lmek0k1).
              * { prove x * y <= (w0 * y + x * z1 + - w0 * z1) + - eps_ (k0 + k1).
                  apply add_SNo_minus_Le2b (w0 * y + x * z1 + - w0 * z1) (eps_ (k0 + k1)) (x * y)
                                           Lw0yxz1mw0z1 Lek0k1 Lxy.
                  prove x * y + eps_ (k0 + k1) <= w0 * y + x * z1 + - w0 * z1.
                  rewrite add_SNo_com (x * y) (eps_ (k0 + k1)) Lxy Lek0k1.
                  apply add_SNo_minus_Le2 (w0 * y + x * z1 + - w0 * z1) (x * y) (eps_ (k0 + k1)) Lw0yxz1mw0z1 Lxy Lek0k1.
                  prove eps_ (k0 + k1) <= (w0 * y + x * z1 + - w0 * z1) + - x * y.
                  rewrite add_SNo_rotate_3_1 (w0 * y) (x * z1) (- w0 * z1) Lw0y Lxz1 Lmw0z1.
                  prove eps_ (k0 + k1) <= (- w0 * z1 + w0 * y + x * z1) + - x * y.
                  rewrite <- add_SNo_assoc_4 (- w0 * z1) (w0 * y) (x * z1) (- x * y) Lmw0z1 Lw0y Lxz1 Lmxy.
                  prove eps_ (k0 + k1) <= - w0 * z1 + w0 * y + x * z1 + - x * y.
                  rewrite add_SNo_rotate_4_1 (- w0 * z1) (w0 * y) (x * z1) (- x * y) Lmw0z1 Lw0y Lxz1 Lmxy.
                  prove eps_ (k0 + k1) <= - x * y + - w0 * z1 + w0 * y + x * z1.
                  rewrite add_SNo_rotate_4_1 (- x * y) (- w0 * z1) (w0 * y) (x * z1) Lmxy Lmw0z1 Lw0y Lxz1.
                  prove eps_ (k0 + k1) <= x * z1 + - x * y + - w0 * z1 + w0 * y.
                  rewrite <- mul_SNo_minus_distrR x y Hx1 Hy1.
                  rewrite <- mul_SNo_minus_distrL w0 z1 Hw01 Hz11.
                  rewrite <- mul_SNo_minus_minus w0 y Hw01 Hy1.
                  prove eps_ (k0 + k1) <= x * z1 + x * (- y) + (- w0) * z1 + (- w0) * (- y).
                  rewrite <- SNo_foil x (- w0) z1 (- y) Hx1 (SNo_minus_SNo w0 Hw01) Hz11 (SNo_minus_SNo y Hy1).
                  rewrite <- mul_SNo_eps_eps_add_SNo k0 Hk0 k1 Hk1.
                  prove eps_ k0 * eps_ k1 <= (x + - w0) * (z1 + - y).
                  apply nonneg_mul_SNo_Le2 (eps_ k0) (eps_ k1) (x + - w0) (z1 + - y) Lek0 Lek1 (SNo_add_SNo x (- w0) Hx1 (SNo_minus_SNo w0 Hw01)) (SNo_add_SNo z1 (- y) Hz11 (SNo_minus_SNo y Hy1)).
                  - prove 0 <= eps_ k0. apply SNoLtLe. exact SNo_eps_pos k0 Hk0.
                  - prove 0 <= eps_ k1. apply SNoLtLe. exact SNo_eps_pos k1 Hk1.
                  - prove eps_ k0 <= x + - w0. exact Hk0b.
                  - prove eps_ k1 <= z1 + - y. exact Hk1b.
                }
              * prove (w0 * y + x * z1 + - w0 * z1) + - eps_ (k0 + k1) < hR (k0 + k1) + - eps_ (k0 + k1).
                apply add_SNo_Lt1 (w0 * y + x * z1 + - w0 * z1) (- eps_ (k0 + k1)) (hR (k0 + k1))
                                  Lw0yxz1mw0z1 Lmek0k1 LhRk0k1.
                exact H1.
            + exact L8 (k0 + k1) Lk0k1.
          - assume H1: hR (k0 + k1) <= w0 * y + x * z1 + - w0 * z1. exact H1.
        }
    + let z0. assume Hz0: z0 :e SNoR x.
      let w1. assume Hw1: w1 :e SNoL y.
      assume Hze: z = z0 * y + x * w1 + - z0 * w1.
      apply LRx2 z0 Hz0.
      let k0. assume Hk0: k0 :e omega.
      assume Hk0b: eps_ k0 <= z0 + - x.
      apply LLy2 w1 Hw1.
      let k1. assume Hk1: k1 :e omega.
      assume Hk1b: eps_ k1 <= y + - w1.
      apply SNoR_E x Hx1 z0 Hz0.
      assume Hz01: SNo z0.
      assume Hz02: SNoLev z0 :e SNoLev x.
      assume Hz03: x < z0.
      apply SNoL_E y Hy1 w1 Hw1.
      assume Hw11: SNo w1.
      assume Hw12: SNoLev w1 :e SNoLev y.
      assume Hw13: w1 < y.
      claim Lek0: SNo (eps_ k0).
      { exact SNo_eps_ k0 Hk0. }
      claim Lek1: SNo (eps_ k1).
      { exact SNo_eps_ k1 Hk1. }
      claim Lk0k1: k0 + k1 :e omega.
      { exact add_SNo_In_omega k0 Hk0 k1 Hk1. }
      claim Lek0k1: SNo (eps_ (k0 + k1)).
      { exact SNo_eps_ (k0 + k1) Lk0k1. }
      claim Lmek0k1: SNo (- eps_ (k0 + k1)).
      { exact SNo_minus_SNo (eps_ (k0 + k1)) Lek0k1. }
      claim LhRk0k1: SNo (hR (k0 + k1)).
      { exact LhR (k0 + k1) Lk0k1. }
      claim Lz0y: SNo (z0 * y).
      { exact SNo_mul_SNo z0 y Hz01 Hy1. }
      claim Lxw1: SNo (x * w1).
      { exact SNo_mul_SNo x w1 Hx1 Hw11. }
      claim Lz0w1: SNo (z0 * w1).
      { exact SNo_mul_SNo z0 w1 Hz01 Hw11. }
      claim Lmz0w1: SNo (- z0 * w1).
      { exact SNo_minus_SNo (z0 * w1) Lz0w1. }
      claim Lz0yxw1mz0w1: SNo (z0 * y + x * w1 + - z0 * w1).
      { exact SNo_add_SNo_3 (z0 * y) (x * w1) (- z0 * w1) Lz0y Lxw1 Lmz0w1. }
      rewrite Hze.
      apply SNoLtLe_tra (SNoCut {hL n|n :e omega} {hR n|n :e omega})
                        (hR (k0 + k1))
                        (z0 * y + x * w1 + - z0 * w1)
                        HhLR2
                        LhRk0k1
                        Lz0yxw1mz0w1.
      * prove SNoCut {hL n|n :e omega} {hR n|n :e omega} < hR (k0 + k1).
        exact HhLR6 (k0 + k1) Lk0k1.
      * { prove hR (k0 + k1) <= z0 * y + x * w1 + - z0 * w1.
          apply SNoLtLe_or (z0 * y + x * w1 + - z0 * w1) (hR (k0 + k1)) Lz0yxw1mz0w1 LhRk0k1.
          - assume H1: z0 * y + x * w1 + - z0 * w1 < hR (k0 + k1). prove False.
            apply SNoLt_irref (x * y).
            prove x * y < x * y.
            apply SNoLt_tra (x * y) (hR (k0 + k1) + - eps_ (k0 + k1)) (x * y)
                            Lxy (SNo_add_SNo (hR (k0 + k1)) (- eps_ (k0 + k1)) LhRk0k1 Lmek0k1) Lxy.
            + prove x * y < hR (k0 + k1) + - eps_ (k0 + k1).
              apply SNoLeLt_tra (x * y)
                                ((z0 * y + x * w1 + - z0 * w1) + - eps_ (k0 + k1))
                                (hR (k0 + k1) + - eps_ (k0 + k1))
                                Lxy
                                (SNo_add_SNo (z0 * y + x * w1 + - z0 * w1) (- eps_ (k0 + k1)) Lz0yxw1mz0w1 Lmek0k1)
                                (SNo_add_SNo (hR (k0 + k1)) (- eps_ (k0 + k1)) LhRk0k1 Lmek0k1).
              * { prove x * y <= (z0 * y + x * w1 + - z0 * w1) + - eps_ (k0 + k1).
                  apply add_SNo_minus_Le2b (z0 * y + x * w1 + - z0 * w1) (eps_ (k0 + k1)) (x * y)
                                           Lz0yxw1mz0w1 Lek0k1 Lxy.
                  prove x * y + eps_ (k0 + k1) <= z0 * y + x * w1 + - z0 * w1.
                  rewrite add_SNo_com (x * y) (eps_ (k0 + k1)) Lxy Lek0k1.
                  apply add_SNo_minus_Le2 (z0 * y + x * w1 + - z0 * w1) (x * y) (eps_ (k0 + k1)) Lz0yxw1mz0w1 Lxy Lek0k1.
                  prove eps_ (k0 + k1) <= (z0 * y + x * w1 + - z0 * w1) + - x * y.
                  rewrite <- add_SNo_assoc_4 (z0 * y) (x * w1) (- z0 * w1) (- x * y) Lz0y Lxw1 Lmz0w1 Lmxy.
                  prove eps_ (k0 + k1) <= z0 * y + x * w1 + - z0 * w1 + - x * y.
                  rewrite <- add_SNo_rotate_3_1 (- z0 * w1) (- x * y) (x * w1) Lmz0w1 Lmxy Lxw1.
                  prove eps_ (k0 + k1) <= z0 * y + - z0 * w1 + - x * y + x * w1.
                  rewrite <- mul_SNo_minus_distrR z0 w1 Hz01 Hw11.
                  rewrite <- mul_SNo_minus_distrL x y Hx1 Hy1.
                  rewrite <- mul_SNo_minus_minus x w1 Hx1 Hw11.
                  prove eps_ (k0 + k1) <= z0 * y + z0 * (- w1) + (- x) * y + (- x) * (- w1).

                  rewrite <- SNo_foil z0 (- x) y (- w1) Hz01 (SNo_minus_SNo x Hx1) Hy1 (SNo_minus_SNo w1 Hw11).
                  rewrite <- mul_SNo_eps_eps_add_SNo k0 Hk0 k1 Hk1.
                  prove eps_ k0 * eps_ k1 <= (z0 + - x) * (y + - w1).
                  apply nonneg_mul_SNo_Le2 (eps_ k0) (eps_ k1) (z0 + - x) (y + - w1) Lek0 Lek1 (SNo_add_SNo z0 (- x) Hz01 (SNo_minus_SNo x Hx1)) (SNo_add_SNo y (- w1) Hy1 (SNo_minus_SNo w1 Hw11)).
                  - prove 0 <= eps_ k0. apply SNoLtLe. exact SNo_eps_pos k0 Hk0.
                  - prove 0 <= eps_ k1. apply SNoLtLe. exact SNo_eps_pos k1 Hk1.
                  - prove eps_ k0 <= z0 + - x. exact Hk0b.
                  - prove eps_ k1 <= y + - w1. exact Hk1b.
                }
              * prove (z0 * y + x * w1 + - z0 * w1) + - eps_ (k0 + k1) < hR (k0 + k1) + - eps_ (k0 + k1).
                apply add_SNo_Lt1 (z0 * y + x * w1 + - z0 * w1) (- eps_ (k0 + k1)) (hR (k0 + k1))
                                  Lz0yxw1mz0w1 Lmek0k1 LhRk0k1.
                exact H1.
            + exact L8 (k0 + k1) Lk0k1.
          - assume H1: hR (k0 + k1) <= z0 * y + x * w1 + - z0 * w1. exact H1.
        }
  - let w. assume Hw: w :e {hL n|n :e omega}. rewrite <- HxyLR.
    prove w < x * y.
    apply ReplE_impred omega (fun n => hL n) w Hw.
    let n. assume Hn Hwn.
    rewrite Hwn.
    prove hL n < x * y. exact L3 n Hn.
  - let z. assume Hz: z :e {hR n|n :e omega}. rewrite <- HxyLR.
    prove x * y < z.
    apply ReplE_impred omega (fun n => hR n) z Hz.
    let n. assume Hn Hzn.
    rewrite Hzn.
    prove x * y < hR n. exact L4 n Hn.
}
apply HC.
exact SNo_approx_real (x * y) Lxy hL HhL1 hR HhR1 L3 L6 L7 L4 L9 L10.
Qed.

Theorem real_mul_SNo : forall x y :e real, x * y :e real.
let x. assume Hx. let y. assume Hy.
claim Lx: SNo x.
{ exact real_SNo x Hx. }
claim Ly: SNo y.
{ exact real_SNo y Hy. }
claim Lxy: SNo (x * y).
{ exact SNo_mul_SNo x y Lx Ly. }
apply SNoLt_trichotomy_or_impred x 0 Lx SNo_0.
- assume H1: x < 0.
  claim Lmx: 0 < - x.
  { apply minus_SNo_Lt_contra2 x 0 Lx SNo_0.
    prove x < - 0. rewrite minus_SNo_0. exact H1.
  }
  apply SNoLt_trichotomy_or_impred y 0 Ly SNo_0.
  + assume H2: y < 0.
    prove x * y :e real.
    rewrite <- mul_SNo_minus_minus x y Lx Ly.
    prove (- x) * (- y) :e real.
    apply real_mul_SNo_pos (- x) (real_minus_SNo x Hx) (- y) (real_minus_SNo y Hy) Lmx.
    prove 0 < - y.
    apply minus_SNo_Lt_contra2 y 0 Ly SNo_0.
    prove y < - 0. rewrite minus_SNo_0. exact H2.
  + assume H2: y = 0. rewrite H2. rewrite mul_SNo_zeroR x Lx.
    exact real_0.
  + assume H2: 0 < y.
    prove x * y :e real.
    rewrite <- minus_SNo_invol (x * y) Lxy.
    prove - - (x * y) :e real.
    rewrite <- mul_SNo_minus_distrL x y Lx Ly.
    prove - ((- x) * y) :e real.
    apply real_minus_SNo.
    prove (- x) * y :e real.
    exact real_mul_SNo_pos (- x) (real_minus_SNo x Hx) y Hy Lmx H2.
- assume H1: x = 0.
  prove x * y :e real.
  rewrite H1.
  rewrite mul_SNo_zeroL y Ly.
  exact real_0.
- assume H1: 0 < x.
  apply SNoLt_trichotomy_or_impred y 0 Ly SNo_0.
  + assume H2: y < 0.
    rewrite <- minus_SNo_invol (x * y) Lxy.
    prove - - (x * y) :e real.
    rewrite <- mul_SNo_minus_distrR x y Lx Ly.
    prove - (x * (- y)) :e real.
    apply real_minus_SNo.
    prove x * (- y) :e real.
    apply real_mul_SNo_pos x Hx (- y) (real_minus_SNo y Hy) H1.
    prove 0 < - y.
    apply minus_SNo_Lt_contra2 y 0 Ly SNo_0.
    prove y < - 0. rewrite minus_SNo_0. exact H2.
  + assume H2: y = 0. rewrite H2. rewrite mul_SNo_zeroR x Lx.
    exact real_0.
  + assume H2: 0 < y.
    exact real_mul_SNo_pos x Hx y Hy H1 H2.
Qed.

Theorem abs_SNo_intvl_bd : forall x y z, SNo x -> SNo y -> SNo z
 -> x <= y -> y < x + z
 -> abs_SNo (y + - x) < z.
let x y z. assume Hx Hy Hz Hxy Hyxz.
claim L1: 0 <= y + - x.
{ rewrite <- add_SNo_minus_SNo_rinv x Hx.
  prove x + - x <= y + - x.
  exact add_SNo_Le1 x (- x) y Hx (SNo_minus_SNo x Hx) Hy Hxy.
}
claim L2: abs_SNo (y + - x) = y + - x.
{ apply nonneg_abs_SNo (y + - x) L1. }
rewrite L2.
prove y + - x < z.
apply add_SNo_minus_Lt1b y x z Hy Hx Hz.
prove y < z + x.
rewrite add_SNo_com z x Hz Hx. exact Hyxz.
Qed.

Theorem nonneg_real_nat_interval: forall x :e real, 0 <= x -> exists n :e omega, n <= x /\ x < ordsucc n.
let x. assume HxR Hxnn.
apply real_E x HxR.
assume Hx1: SNo x.
assume Hx2: SNoLev x :e ordsucc omega.
assume Hx3: x :e SNoS_ (ordsucc omega).
assume Hx4: - omega < x.
assume Hx5: x < omega.
assume Hx6: forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x.
assume Hx7: forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.
claim L1: forall m, nat_p m -> x < m -> exists n :e omega, n <= x /\ x < ordsucc n.
{ apply nat_ind.
  - assume H1: x < 0. prove False.
    apply SNoLt_irref 0.
    prove 0 < 0.
    exact SNoLeLt_tra 0 x 0 SNo_0 Hx1 SNo_0 Hxnn H1.
  - let m.
    assume Hm.
    assume IHm: x < m -> exists n :e omega, n <= x /\ x < ordsucc n.
    assume H2: x < ordsucc m.
    apply SNoLtLe_or x m Hx1 (nat_p_SNo m Hm).
    + assume H3: x < m. apply IHm. prove x < m. exact H3.
    + assume H3: m <= x.
      witness m.
      apply andI.
      * prove m :e omega. exact nat_p_omega m Hm.
      * { apply andI.
          - prove m <= x. exact H3.
          - prove x < ordsucc m. exact H2.
        }
}
apply Hx7 0 (nat_p_omega 0 nat_0).
let q. assume H. apply H.
assume Hq: q :e SNoS_ omega. assume H. apply H.
assume Hqx: q < x.
rewrite eps_0_1.
assume Hxq1: x < q + 1.
apply SNoS_E omega omega_ordinal q Hq.
let m. assume H. apply H.
assume Hm: m :e omega.
assume H1: SNo_ m q.
claim Lq: SNo q.
{ exact SNo_SNo m (nat_p_ordinal m (omega_nat_p m Hm)) q H1. }
apply L1 (ordsucc m).
- prove nat_p (ordsucc m). apply nat_ordsucc. apply omega_nat_p. exact Hm.
- prove x < ordsucc m.
  apply SNoLtLe_tra x (q + 1) (ordsucc m) Hx1 (SNo_add_SNo q 1 Lq SNo_1) (nat_p_SNo (ordsucc m) (nat_ordsucc m (omega_nat_p m Hm))) Hxq1.
  prove q + 1 <= ordsucc m.
  claim Lq1: SNo (q + 1).
  { apply SNo_add_SNo.
    - exact Lq.
    - exact SNo_1.
  }
  apply ordinal_SNoLev_max_2 (ordsucc m) (nat_p_ordinal (ordsucc m) (nat_ordsucc m (omega_nat_p m Hm))) (q + 1).
  + prove SNo (q + 1). exact Lq1.
  + prove SNoLev (q + 1) :e ordsucc (ordsucc m).
    apply ordinal_In_Or_Subq (SNoLev (q + 1)) (ordsucc m) (SNoLev_ordinal (q + 1) Lq1) (nat_p_ordinal (ordsucc m) (nat_ordsucc m (omega_nat_p m Hm))).
    * assume H2: SNoLev (q + 1) :e ordsucc m. apply ordsuccI1. exact H2.
    * assume H2: ordsucc m c= SNoLev (q + 1).
      claim L2: SNoLev (q + 1) c= ordsucc m.
      { apply Subq_tra (SNoLev (q + 1)) (SNoLev q + SNoLev 1).
        - prove SNoLev (q + 1) c= SNoLev q + SNoLev 1.
          apply add_SNo_Lev_bd.
          + exact Lq.
          + exact SNo_1.
        - prove SNoLev q + SNoLev 1 c= ordsucc m.
          rewrite SNoLev_uniq2 m (nat_p_ordinal m (omega_nat_p m Hm)) q H1.
          rewrite ordinal_SNoLev 1 (nat_p_ordinal 1 nat_1).
          prove m + 1 c= ordsucc m.
          rewrite add_SNo_1_ordsucc m Hm. apply Subq_ref.
      }
      claim L3: SNoLev (q + 1) = ordsucc m.
      { apply set_ext.
        - exact L2.
        - exact H2.
      }
      rewrite L3. apply ordsuccI2.
Qed.

Theorem pos_real_left_approx_double: forall x :e real, 0 < x
 -> x <> 2 -> (forall m :e omega, x <> eps_ m)
 -> exists w :e SNoL_pos x, x < 2 * w.
let x. assume HxR Hxpos Hxn2 Hxne.
apply real_E x HxR.
assume Hx1: SNo x.
assume Hx2: SNoLev x :e ordsucc omega.
assume Hx3: x :e SNoS_ (ordsucc omega).
assume Hx4: - omega < x.
assume Hx5: x < omega.
assume Hx6: forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x.
assume Hx7: forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.
claim L1: forall m, nat_p m -> eps_ m < x -> exists w :e SNoL_pos x, x < 2 * w.
{ apply nat_ind.
  - prove eps_ 0 < x -> exists w :e SNoL_pos x, x < 2 * w.
    rewrite eps_0_1.
    assume H1: 1 < x.
    apply SNoLt_trichotomy_or_impred x 2 Hx1 SNo_2.
    + assume H2: x < 2.
      witness 1. apply andI.
      * { prove 1 :e SNoL_pos x.
          prove 1 :e {w :e SNoL x|0 < w}.
          apply SepI.
          - prove 1 :e SNoL x.
            apply SNoL_I x Hx1 1 SNo_1.
            + prove SNoLev 1 :e SNoLev x.
              rewrite ordinal_SNoLev 1 (nat_p_ordinal 1 nat_1).
              prove 1 :e SNoLev x.
              apply ordinal_In_Or_Subq 1 (SNoLev x) (nat_p_ordinal 1 nat_1) (SNoLev_ordinal x Hx1).
              * assume H3: 1 :e SNoLev x. exact H3.
              * assume H3: SNoLev x c= 1. prove False.
                apply Hxne 0 (nat_p_omega 0 nat_0).
                prove x = eps_ 0.
                rewrite eps_0_1.
                exact pos_low_eq_one x Hx1 Hxpos H3.
            + prove 1 < x. exact H1.
          - prove 0 < 1. exact SNoLt_0_1.
        }
      * prove x < 2 * 1.
        rewrite mul_SNo_oneR 2 SNo_2.
        exact H2.
    + assume H2: x = 2. prove False. apply Hxn2. exact H2.
    + assume H2: 2 < x.
      apply nonneg_real_nat_interval x HxR (SNoLtLe 0 x Hxpos).
      let m. assume H. apply H.
      assume Hm: m :e omega. assume H. apply H.
      assume Hmx: m <= x.
      assume Hxm1: x < ordsucc m.
      claim Lm: nat_p m.
      { exact omega_nat_p m Hm. }
      apply nat_inv m Lm.
      * { assume Hm0: m = 0. prove False.
          apply SNoLt_irref x.
          prove x < x.
          apply SNoLt_tra x 1 x Hx1 SNo_1 Hx1.
          - prove x < ordsucc 0. rewrite <- Hm0.
            exact Hxm1.
          - prove 1 < x. exact H1.
        }
      * { assume H. apply H.
          let m'. assume H. apply H.
          assume Hm': nat_p m'.
          assume Hmm': m = ordsucc m'.
          apply nat_inv m' Hm'.
          - assume Hm'0: m' = 0.
            apply SNoLt_irref x.
            prove x < x.
            apply SNoLt_tra x 2 x Hx1 SNo_2 Hx1.
            + prove x < ordsucc (ordsucc 0).
              rewrite <- Hm'0.
              rewrite <- Hmm'.
              exact Hxm1.
            + prove 2 < x. exact H2.
          - assume H. apply H.
            let m''. assume H. apply H.
            assume Hm'': nat_p m''.
            assume Hm'm'': m' = ordsucc m''.
            claim L1a: exists k :e omega, 2 <= k /\ k < x /\ x <= ordsucc k.
            { apply SNoLeE m x (nat_p_SNo m Lm) Hx1 Hmx.
              - assume H4: m < x.
                witness m. apply andI.
                + prove m :e omega. exact Hm.
                + apply and3I.
                  * { prove 2 <= m.
                      apply SNoLtLe_or m 2 (nat_p_SNo m Lm) SNo_2.
                      - assume H5: m < 2. prove False.
                        claim L1aa: m :e 2.
                        { apply ordinal_SNoLt_In.
                          - exact nat_p_ordinal m Lm.
                          - exact nat_p_ordinal 2 nat_2.
                          - exact H5.
                        }
                        apply cases_2 m L1aa (fun i => m <> i).
                        + rewrite Hmm'.
                          exact neq_ordsucc_0 m'.
                        + rewrite Hmm'. rewrite Hm'm''.
                          assume H6: ordsucc (ordsucc m'') = 1.
                          exact neq_ordsucc_0 m'' (ordsucc_inj (ordsucc m'') 0 H6).
                        + reflexivity.
                      - assume H5: 2 <= m. exact H5.
                    }
                  * prove m < x. exact H4.
                  * prove x <= ordsucc m.
                    apply SNoLtLe.
                    prove x < ordsucc m.
                    exact Hxm1.
              - assume H4: m = x.
                apply nat_inv m'' Hm''.
                + assume Hm''0: m'' = 0.
                  prove False. apply Hxn2.
                  prove x = 2. rewrite <- H4.
                  rewrite Hmm'. rewrite Hm'm''.
                  rewrite Hm''0. reflexivity.
                + assume H. apply H.
                  let m'''. assume H. apply H.
                  assume Hm''': nat_p m'''.
                  assume Hm''m''': m'' = ordsucc m'''.
                  prove exists k :e omega, 2 <= k /\ k < x /\ x <= ordsucc k.
                  witness m'. apply andI.
                  * prove m' :e omega. apply nat_p_omega. exact Hm'.
                  * { prove 2 <= m' /\ m' < x /\ x <= ordsucc m'.
                      apply and3I.
                      - prove 2 <= m'.
                        rewrite Hm'm''.
                        prove 2 <= ordsucc m''.
                        rewrite ordinal_ordsucc_SNo_eq m'' (nat_p_ordinal m'' Hm'').
                        prove 2 <= 1 + m''.
                        rewrite Hm''m'''.
                        prove 2 <= 1 + ordsucc m'''.
                        rewrite ordinal_ordsucc_SNo_eq m''' (nat_p_ordinal m''' Hm''').
                        prove 2 <= 1 + 1 + m'''.
                        rewrite add_SNo_assoc 1 1 m''' SNo_1 SNo_1 (nat_p_SNo m''' Hm''').
                        prove 2 <= (1 + 1) + m'''.
                        rewrite add_SNo_1_1_2.
                        prove 2 <= 2 + m'''.
                        rewrite <- add_SNo_0R 2 SNo_2 at 1.
                        prove 2 + 0 <= 2 + m'''.
                        apply add_SNo_Le2 2 0 m''' SNo_2 SNo_0 (nat_p_SNo m''' Hm''').
                        prove 0 <= m'''.
                        apply ordinal_Subq_SNoLe 0 m''' ordinal_Empty (nat_p_ordinal m''' Hm''').
                        prove 0 c= m'''.
                        apply Subq_Empty.
                      - prove m' < x. rewrite <- H4.
                        prove m' < m.
                        apply ordinal_In_SNoLt.
                        + exact nat_p_ordinal m Lm.
                        + rewrite Hmm'. apply ordsuccI2.
                      - prove x <= ordsucc m'.
                        rewrite <- H4. rewrite Hmm'.
                        prove ordsucc m' <= ordsucc m'.
                        apply SNoLe_ref.
                    }
            }
            apply L1a.
            let k. assume H. apply H.
            assume Hk: k :e omega. assume H. apply H. assume H. apply H.
            assume H2k: 2 <= k.
            assume Hkx: k < x.
            assume HxSk: x <= ordsucc k.
            claim Lk: nat_p k.
            { exact omega_nat_p k Hk. }
            claim LkS: SNo k.
            { exact nat_p_SNo k Lk. }
            witness k.
            apply andI.
            + prove k :e SNoL_pos x.
              prove k :e {w :e SNoL x|0 < w}.
              apply SepI.
              * { prove k :e SNoL x.
                  apply SNoL_I.
                  - exact Hx1.
                  - exact LkS.
                  - prove SNoLev k :e SNoLev x.
                    rewrite ordinal_SNoLev k (nat_p_ordinal k Lk).
                    prove k :e SNoLev x.
                    apply ordinal_trichotomy_or_impred k (SNoLev x) (nat_p_ordinal k Lk) (SNoLev_ordinal x Hx1).
                    + assume H4: k :e SNoLev x. exact H4.
                    + assume H4: k = SNoLev x. prove False.
                      apply SNoLt_irref k.
                      apply SNoLtLe_tra k x k LkS Hx1 LkS Hkx.
                      prove x <= k.
                      apply ordinal_SNoLev_max_2 k (nat_p_ordinal k Lk) x Hx1.
                      rewrite <- H4. apply ordsuccI2.
                    + assume H4: SNoLev x :e k. prove False.
                      apply SNoLt_irref k.
                      apply SNoLt_tra k x k LkS Hx1 LkS Hkx.
                      prove x < k.
                      exact ordinal_SNoLev_max k (nat_p_ordinal k Lk) x Hx1 H4.
                  - prove k < x. exact Hkx.
                }
              * prove 0 < k.
                apply SNoLtLe_tra 0 2 k SNo_0 SNo_2 LkS SNoLt_0_2.
                prove 2 <= k. exact H2k.
            + prove x < 2 * k.
              rewrite <- add_SNo_1_1_2.
              rewrite mul_SNo_distrR 1 1 k SNo_1 SNo_1 LkS.
              rewrite mul_SNo_oneL k LkS.
              prove x < k + k.
              apply SNoLeLt_tra x (ordsucc k) (k + k) Hx1 (nat_p_SNo (ordsucc k) (nat_ordsucc k Lk)) (SNo_add_SNo k k LkS LkS) HxSk.
              prove ordsucc k < k + k.
              rewrite ordinal_ordsucc_SNo_eq k (nat_p_ordinal k Lk).
              prove 1 + k < k + k.
              apply add_SNo_Lt1 1 k k SNo_1 LkS LkS.
              prove 1 < k.
              apply SNoLtLe_tra 1 2 k SNo_1 SNo_2 LkS SNoLt_1_2.
              prove 2 <= k. exact H2k.
        }
  - let m. assume Hm.
    assume IHm: eps_ m < x -> exists w :e SNoL_pos x, x < 2 * w.
    assume H1: eps_ (ordsucc m) < x.
    claim Lm: m :e omega.
    { exact nat_p_omega m Hm. }
    claim Lem: SNo (eps_ m).
    { exact SNo_eps_ m Lm. }
    apply SNoLt_trichotomy_or_impred x (eps_ m) Hx1 Lem.
    + assume H2: x < eps_ m.
      claim LSm: ordsucc m :e omega.
      { exact omega_ordsucc m Lm. }
      claim LeSm: SNo (eps_ (ordsucc m)).
      { exact SNo_eps_ (ordsucc m) LSm. }
      witness (eps_ (ordsucc m)).
      apply andI.
      * { prove eps_ (ordsucc m) :e SNoL_pos x.
          prove eps_ (ordsucc m) :e {w :e SNoL x|0 < w}.
          apply SepI.
          - prove eps_ (ordsucc m) :e SNoL x.
            apply SNoL_I x Hx1 (eps_ (ordsucc m)) LeSm.
            + prove SNoLev (eps_ (ordsucc m)) :e SNoLev x.
              apply SNoLtE x (eps_ m) Hx1 Lem H2.
              * let z.
                assume Hz1: SNo z.
                assume Hz2: SNoLev z :e SNoLev x :/\: SNoLev (eps_ m).
                assume Hz3: SNoEq_ (SNoLev z) z x.
                assume Hz4: SNoEq_ (SNoLev z) z (eps_ m).
                assume Hz5: x < z.
                assume Hz6: z < eps_ m.
                assume Hz7: SNoLev z /:e x.
                assume Hz8: SNoLev z :e eps_ m.
                prove False.
                claim Lz0: z = 0.
                { apply SNoLev_0_eq_0 z Hz1.
                  prove SNoLev z = 0.
                  apply eps_ordinal_In_eq_0 m.
                  - prove ordinal (SNoLev z). exact SNoLev_ordinal z Hz1.
                  - prove SNoLev z :e eps_ m. exact Hz8.
                }
                apply SNoLt_irref x.
                apply SNoLt_tra x z x Hx1 Hz1 Hx1 Hz5.
                prove z < x.
                rewrite Lz0.
                exact Hxpos.
              * assume H3: SNoLev x :e SNoLev (eps_ m).
                assume H4: SNoEq_ (SNoLev x) x (eps_ m).
                assume H5: SNoLev x :e eps_ m.
                prove False.
                claim Lx0: x = 0.
                { apply SNoLev_0_eq_0 x Hx1.
                  prove SNoLev x = 0.
                  apply eps_ordinal_In_eq_0 m.
                  - prove ordinal (SNoLev x). exact SNoLev_ordinal x Hx1.
                  - prove SNoLev x :e eps_ m. exact H5.
                }
                apply SNoLt_irref x.
                rewrite Lx0 at 1.
                exact Hxpos.
              * { rewrite SNoLev_eps_ m Lm.
                  assume H3: ordsucc m :e SNoLev x.
                  assume H4: SNoEq_ (ordsucc m) x (eps_ m).
                  assume H5: ordsucc m /:e x.
                  apply SNoLtE (eps_ (ordsucc m)) x LeSm Hx1 H1.
                  - let z.
                    assume Hz1: SNo z.
                    rewrite SNoLev_eps_ (ordsucc m) LSm.
                    assume Hz2: SNoLev z :e ordsucc (ordsucc m) :/\: SNoLev x.
                    assume Hz3: SNoEq_ (SNoLev z) z (eps_ (ordsucc m)).
                    assume Hz4: SNoEq_ (SNoLev z) z x.
                    assume Hz5: eps_ (ordsucc m) < z.
                    assume Hz6: z < x.
                    assume Hz7: SNoLev z /:e eps_ (ordsucc m).
                    assume Hz8: SNoLev z :e x.
                    prove False.
                    apply ordsuccE (ordsucc m) (SNoLev z) (binintersectE1 (ordsucc (ordsucc m)) (SNoLev x) (SNoLev z) Hz2).
                    + assume H6: SNoLev z :e ordsucc m.
                      claim Lz0: z = 0.
                      { apply SNoLev_0_eq_0 z Hz1.
                        prove SNoLev z = 0.
                        apply eps_ordinal_In_eq_0 m.
                        - prove ordinal (SNoLev z). exact SNoLev_ordinal z Hz1.
                        - prove SNoLev z :e eps_ m.
                          apply H4 (SNoLev z) H6.
                          assume H7 _. apply H7.
                          prove SNoLev z :e x. exact Hz8.
                      }
                      apply SNoLt_irref (eps_ (ordsucc m)).
                      apply SNoLt_tra (eps_ (ordsucc m)) z (eps_ (ordsucc m)) LeSm Hz1 LeSm Hz5.
                      prove z < eps_ (ordsucc m).
                      rewrite Lz0.
                      exact SNo_eps_pos (ordsucc m) LSm.
                    + assume H6: SNoLev z = ordsucc m.
                      apply H5. rewrite <- H6.
                      exact Hz8.
                  - assume H6: SNoLev (eps_ (ordsucc m)) :e SNoLev x.
                    assume H7: SNoEq_ (SNoLev (eps_ (ordsucc m))) (eps_ (ordsucc m)) x.
                    assume H8: SNoLev (eps_ (ordsucc m)) :e x.
                    exact H6.
                  - rewrite SNoLev_eps_ (ordsucc m) LSm.
                    assume H6: SNoLev x :e ordsucc (ordsucc m).
                    assume H7: SNoEq_ (SNoLev x) (eps_ (ordsucc m)) x.
                    assume H8: SNoLev x /:e eps_ (ordsucc m).
                    prove False.
                    apply ordsuccE (ordsucc m) (SNoLev x) H6.
                    + assume H9: SNoLev x :e ordsucc m.
                      exact In_no2cycle (SNoLev x) (ordsucc m) H9 H3.
                    + assume H9: SNoLev x = ordsucc m.
                      apply In_irref (SNoLev x).
                      rewrite H9 at 1.
                      exact H3.
                }
            + prove eps_ (ordsucc m) < x. exact H1.
          - prove 0 < eps_ (ordsucc m).
            exact SNo_eps_pos (ordsucc m) LSm.
        }
      * prove x < 2 * eps_ (ordsucc m).
        rewrite <- add_SNo_1_1_2.
        rewrite mul_SNo_distrR 1 1 (eps_ (ordsucc m)) SNo_1 SNo_1 LeSm.
        rewrite mul_SNo_oneL (eps_ (ordsucc m)) LeSm.
        rewrite eps_ordsucc_half_add m Hm.
        exact H2.
    + assume H2: x = eps_ m. prove False. exact Hxne m (nat_p_omega m Hm) H2.
    + assume H2: eps_ m < x. exact IHm H2.
}
claim L2: exists k :e omega, eps_ k < x.
{ apply dneg.
  assume H1: ~exists k :e omega, eps_ k < x.
  claim Lx0: 0 = x.
  { apply Hx6 0.
    - prove 0 :e SNoS_ omega.
      apply SNoS_I omega omega_ordinal 0 0.
      + prove 0 :e omega. apply nat_p_omega. exact nat_0.
      + prove SNo_ 0 0. apply ordinal_SNo_. exact ordinal_Empty.
    - prove forall k :e omega, abs_SNo (0 + - x) < eps_ k.
      let k. assume Hk.
      rewrite add_SNo_0L (- x) (SNo_minus_SNo x Hx1).
      rewrite abs_SNo_minus x Hx1.
      rewrite pos_abs_SNo x Hxpos.
      prove x < eps_ k.
      apply SNoLt_trichotomy_or_impred x (eps_ k) Hx1 (SNo_eps_ k Hk).
      + assume H2: x < eps_ k. exact H2.
      + assume H2: x = eps_ k. prove False. exact Hxne k Hk H2.
      + assume H2: eps_ k < x. prove False. apply H1.
        witness k. apply andI.
        * exact Hk.
        * exact H2.
  }
  apply SNoLt_irref x.
  rewrite <- Lx0 at 1.
  exact Hxpos.
}
apply L2.
let k. assume H. apply H.
assume Hk: k :e omega.
assume H1: eps_ k < x.
exact L1 k (omega_nat_p k Hk) H1.
Qed.

Theorem real_recip_SNo_lem1: forall x, SNo x -> x :e real -> 0 < x ->
    recip_SNo_pos x :e real
 /\ forall k, nat_p k ->
         (SNo_recipaux x recip_SNo_pos k 0 c= real)
      /\ (SNo_recipaux x recip_SNo_pos k 1 c= real).
apply SNoLev_ind.
let x. assume Hx: SNo x.
assume IHx: forall u :e SNoS_ (SNoLev x), u :e real -> 0 < u ->
    recip_SNo_pos u :e real
 /\ forall k, nat_p k ->
         (forall y :e SNo_recipaux u recip_SNo_pos k 0, y :e real)
      /\ (forall y :e SNo_recipaux u recip_SNo_pos k 1, y :e real).
assume HxR: x :e real.
assume Hxpos: 0 < x.
apply real_E x HxR.
assume _.
assume HxR2: SNoLev x :e ordsucc omega.
assume _ _ _ _ _.
claim Lmx: SNo (- x).
{ exact SNo_minus_SNo x Hx. }
claim L1: forall y :e real, forall z :e SNoS_ (SNoLev x), 0 < z -> (1 + (z + - x) * y) * recip_SNo_pos z :e real.
{ let y. assume Hy. let z. assume Hz Hzpos.
  apply SNoS_E2 (SNoLev x) (SNoLev_ordinal x Hx) z Hz.
  assume Hz1: SNoLev z :e SNoLev x.
  assume Hz2: ordinal (SNoLev z).
  assume Hz3: SNo z.
  assume Hz4: SNo_ (SNoLev z) z.
  claim LzR: z :e real.
  { apply SNoS_omega_real.
    apply SNoS_I omega omega_ordinal z (SNoLev z).
    - prove SNoLev z :e omega.
      apply ordsuccE omega (SNoLev x) HxR2.
      + assume H1: SNoLev x :e omega.
        apply nat_p_omega.
        exact nat_p_trans (SNoLev x) (omega_nat_p (SNoLev x) H1) (SNoLev z) Hz1.
      + assume H1: SNoLev x = omega. rewrite <- H1. exact Hz1.
    - exact Hz4.
  }
  apply IHx z Hz LzR Hzpos.
  assume IH1: recip_SNo_pos z :e real.
  assume _.
  apply real_mul_SNo.
  - apply real_add_SNo.
    + exact real_1.
    + apply real_mul_SNo.
      * { apply real_add_SNo.
          - exact LzR.
          - apply real_minus_SNo. exact HxR.
        }
      * exact Hy.
  - exact IH1.
}
claim L2: forall k, nat_p k ->
    (SNo_recipaux x recip_SNo_pos k 0 c= real)
 /\ (SNo_recipaux x recip_SNo_pos k 1 c= real).
{ apply nat_ind.
  + prove (SNo_recipaux x recip_SNo_pos 0 0 c= real)
       /\ (SNo_recipaux x recip_SNo_pos 0 1 c= real).
    rewrite SNo_recipaux_0.
    apply andI.
    * rewrite tuple_2_0_eq.
      let y. assume Hy: y :e {0}.
      rewrite SingE 0 y Hy.
      prove 0 :e real.
      exact real_0.
    * rewrite tuple_2_1_eq.
      let y. assume Hy: y :e 0.
      prove False. exact EmptyE y Hy.
  + let k. assume Hk: nat_p k.
    assume IHk: (SNo_recipaux x recip_SNo_pos k 0 c= real)
             /\ (SNo_recipaux x recip_SNo_pos k 1 c= real).
    apply IHk. assume IHk0 IHk1.
    rewrite SNo_recipaux_S x recip_SNo_pos k Hk.
    apply andI.
    * { rewrite tuple_2_0_eq.
        let y.
        apply binunionE'.
        - apply binunionE'.
          + exact IHk0 y.
          + assume Hy: y :e SNo_recipauxset (SNo_recipaux x recip_SNo_pos k 0) x (SNoR x) recip_SNo_pos.
            apply SNo_recipauxset_E (SNo_recipaux x recip_SNo_pos k 0) x (SNoR x) recip_SNo_pos y Hy.
            let u. assume Hu: u :e SNo_recipaux x recip_SNo_pos k 0.
            let z. assume Hz: z :e SNoR x.
            assume Hye: y = (1 + (z + - x) * u) * recip_SNo_pos z.
            apply SNoR_E x Hx z Hz.
            assume Hz1: SNo z.
            assume Hz2: SNoLev z :e SNoLev x.
            assume Hz3: x < z.
            rewrite Hye.
            apply L1.
            * prove u :e real. exact IHk0 u Hu.
            * prove z :e SNoS_ (SNoLev x).
              exact SNoS_I2 z x Hz1 Hx Hz2.
            * prove 0 < z.
              exact SNoLt_tra 0 x z SNo_0 Hx Hz1 Hxpos Hz3.
        - assume Hy: y :e SNo_recipauxset (SNo_recipaux x recip_SNo_pos k 1) x (SNoL_pos x) recip_SNo_pos.
          apply SNo_recipauxset_E (SNo_recipaux x recip_SNo_pos k 1) x (SNoL_pos x) recip_SNo_pos y Hy.
          let u. assume Hu: u :e SNo_recipaux x recip_SNo_pos k 1.
          let w. assume Hw: w :e SNoL_pos x.
          assume Hye: y = (1 + (w + - x) * u) * recip_SNo_pos w.
          apply SepE (SNoL x) (fun w => 0 < w) w Hw.
          assume Hw0: w :e SNoL x.
          assume Hwpos: 0 < w.
          apply SNoL_E x Hx w Hw0.
          assume Hw1: SNo w.
          assume Hw2: SNoLev w :e SNoLev x.
          assume Hw3: w < x.
          rewrite Hye.
          apply L1.
          + prove u :e real. exact IHk1 u Hu.
          + prove w :e SNoS_ (SNoLev x).
            exact SNoS_I2 w x Hw1 Hx Hw2.
          + prove 0 < w. exact Hwpos.
      }
    * { rewrite tuple_2_1_eq.
        let y.
        apply binunionE'.
        - apply binunionE'.
          + exact IHk1 y.
          + assume Hy: y :e SNo_recipauxset (SNo_recipaux x recip_SNo_pos k 0) x (SNoL_pos x) recip_SNo_pos.
            apply SNo_recipauxset_E (SNo_recipaux x recip_SNo_pos k 0) x (SNoL_pos x) recip_SNo_pos y Hy.
            let u. assume Hu: u :e SNo_recipaux x recip_SNo_pos k 0.
            let w. assume Hw: w :e SNoL_pos x.
            assume Hye: y = (1 + (w + - x) * u) * recip_SNo_pos w.
            apply SepE (SNoL x) (fun w => 0 < w) w Hw.
            assume Hw0: w :e SNoL x.
            assume Hwpos: 0 < w.
            apply SNoL_E x Hx w Hw0.
            assume Hw1: SNo w.
            assume Hw2: SNoLev w :e SNoLev x.
            assume Hw3: w < x.
            rewrite Hye.
            apply L1.
            * prove u :e real. exact IHk0 u Hu.
            * prove w :e SNoS_ (SNoLev x).
              exact SNoS_I2 w x Hw1 Hx Hw2.
            * prove 0 < w. exact Hwpos.
        - assume Hy: y :e SNo_recipauxset (SNo_recipaux x recip_SNo_pos k 1) x (SNoR x) recip_SNo_pos.
          apply SNo_recipauxset_E (SNo_recipaux x recip_SNo_pos k 1) x (SNoR x) recip_SNo_pos y Hy.
          let u. assume Hu: u :e SNo_recipaux x recip_SNo_pos k 1.
          let z. assume Hz: z :e SNoR x.
          assume Hye: y = (1 + (z + - x) * u) * recip_SNo_pos z.
          apply SNoR_E x Hx z Hz.
          assume Hz1: SNo z.
          assume Hz2: SNoLev z :e SNoLev x.
          assume Hz3: x < z.
          rewrite Hye.
          apply L1.
          + prove u :e real. exact IHk1 u Hu.
          + prove z :e SNoS_ (SNoLev x).
            exact SNoS_I2 z x Hz1 Hx Hz2.
          + prove 0 < z.
            exact SNoLt_tra 0 x z SNo_0 Hx Hz1 Hxpos Hz3.
      }
}
apply andI.
- prove recip_SNo_pos x :e real.
  claim L3: forall u :e SNoS_ (SNoLev x), 0 < u -> SNo (recip_SNo_pos u) /\ u * recip_SNo_pos u = 1.
  { let u. assume Hu Hupos.
    apply SNoS_E2 (SNoLev x) (SNoLev_ordinal x Hx) u Hu.
    assume _ _.
    assume Hu1: SNo u.
    assume _.
    exact recip_SNo_pos_prop1 u Hu1 Hupos.
  }
  set L := (\/_ k :e omega, SNo_recipaux x recip_SNo_pos k 0).
  set R := (\/_ k :e omega, SNo_recipaux x recip_SNo_pos k 1).
  claim LrxLR: recip_SNo_pos x = SNoCut L R.
  { exact recip_SNo_pos_eq x Hx. }
  claim LLR: SNoCutP L R.
  { exact SNo_recipaux_lem2 x Hx Hxpos recip_SNo_pos L3. }
  apply SNoCutP_SNoCut_impred L R LLR.
  set y := SNoCut L R.
  assume HLR1: SNo y.
  assume HLR2: SNoLev y :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
  assume HLR3: forall w :e L, w < y.
  assume HLR4: forall z :e R, y < z.
  assume HLR5: forall u, SNo u -> (forall w :e L, w < u) -> (forall z :e R, u < z) -> SNoLev y c= SNoLev u /\ SNoEq_ (SNoLev y) y u.
  claim LLI: forall k :e omega, SNo_recipaux x recip_SNo_pos k 0 c= L.
  { let k. assume Hk.
    let w. assume Hw.
    prove w :e \/_ k :e omega, SNo_recipaux x recip_SNo_pos k 0.
    exact famunionI omega (fun k => SNo_recipaux x recip_SNo_pos k 0) k w Hk Hw.
  }
  claim LRI: forall k :e omega, SNo_recipaux x recip_SNo_pos k 1 c= R.
  { let k. assume Hk.
    let z. assume Hz.
    prove z :e \/_ k :e omega, SNo_recipaux x recip_SNo_pos k 1.
    exact famunionI omega (fun k => SNo_recipaux x recip_SNo_pos k 1) k z Hk Hz.
  }
  claim LLE: forall w :e L, forall p:prop, (forall k :e omega, w :e SNo_recipaux x recip_SNo_pos k 0 -> p) -> p.
  { let w. assume Hw: w :e L.
    let p. assume Hp.
    apply famunionE_impred omega (fun k => SNo_recipaux x recip_SNo_pos k 0) w Hw.
    let k. assume Hk: k :e omega.
    assume Hwk: w :e SNo_recipaux x recip_SNo_pos k 0.
    exact Hp k Hk Hwk.
  }
  claim LRE: forall z :e R, forall p:prop, (forall k :e omega, z :e SNo_recipaux x recip_SNo_pos k 1 -> p) -> p.
  { let z. assume Hz: z :e R.
    let p. assume Hp.
    apply famunionE_impred omega (fun k => SNo_recipaux x recip_SNo_pos k 1) z Hz.
    let k. assume Hk: k :e omega.
    assume Hzk: z :e SNo_recipaux x recip_SNo_pos k 1.
    exact Hp k Hk Hzk.
  }
  claim LLreal: L c= real.
  { let w. assume Hw: w :e L.
    apply LLE w Hw.
    let k. assume Hk: k :e omega.
    assume Hwk: w :e SNo_recipaux x recip_SNo_pos k 0.
    apply L2 k (omega_nat_p k Hk).
    assume H2: SNo_recipaux x recip_SNo_pos k 0 c= real.
    assume _.
    exact H2 w Hwk.
  }
  claim LRreal: R c= real.
  { let z. assume Hz: z :e R.
    apply LRE z Hz.
    let k. assume Hk: k :e omega.
    assume Hzk: z :e SNo_recipaux x recip_SNo_pos k 1.
    apply L2 k (omega_nat_p k Hk).
    assume _.
    assume H2: SNo_recipaux x recip_SNo_pos k 1 c= real.
    exact H2 z Hzk.
  }
  claim LL0: L <> 0.
  { assume H1: L = 0.
    apply EmptyE 0.
    prove 0 :e 0.
    rewrite <- H1 at 2.
    prove 0 :e L.
    apply LLI 0 (nat_p_omega 0 nat_0).
    prove 0 :e SNo_recipaux x recip_SNo_pos 0 0.
    rewrite SNo_recipaux_0. rewrite tuple_2_0_eq.
    prove 0 :e {0}. apply SingI.
  }
  apply xm (exists m :e omega, x = eps_ m).
  + assume H. apply H.
    let m. assume H. apply H.
    assume Hm: m :e omega.
    assume H1: x = eps_ m.
    prove recip_SNo_pos x :e real.
    rewrite H1.
    prove recip_SNo_pos (eps_ m) :e real.
    rewrite recip_SNo_pos_eps_ m (omega_nat_p m Hm).   
    prove 2 ^ m :e real.
    apply SNoS_omega_real.
    apply omega_SNoS_omega.
    apply nat_p_omega.
    exact nat_exp_SNo_nat 2 nat_2 m (omega_nat_p m Hm).
  + assume H1: ~(exists m :e omega, x = eps_ m).
    apply xm (x = 2).
    * assume H2: x = 2.
      rewrite H2.
      prove recip_SNo_pos 2 :e real.
      rewrite recip_SNo_pos_2.
      prove eps_ 1 :e real.
      apply SNoS_omega_real.
      apply SNo_eps_SNoS_omega.
      apply nat_p_omega. exact nat_1.
    * { assume H2: x <> 2.
        claim L4: forall m :e omega, x <> eps_ m.
        { let m. assume Hm H3.
          apply H1. witness m. apply andI.
          - exact Hm.
          - exact H3.
        }
        apply pos_real_left_approx_double x HxR Hxpos H2 L4.
        let u. assume H. apply H.
        assume Hu: u :e SNoL_pos x.
        apply SepE (SNoL x) (fun w => 0 < w) u Hu.
        assume Hua: u :e SNoL x.
        assume Hub: 0 < u.
        apply SNoL_E x Hx u Hua.
        assume Hua1: SNo u.
        assume Hua2: SNoLev u :e SNoLev x.
        assume Hua3: u < x.
        assume H3: x < 2 * u.
        claim Lru: SNo (recip_SNo_pos u).
        { exact SNo_recip_SNo_pos u Hua1 Hub. }
        claim Lumx: SNo (u + - x).
        { apply SNo_add_SNo.
          - exact Hua1.
          - exact Lmx.
        }
        set f:set -> set := fun v => (1 + (u + - x) * v) * recip_SNo_pos u.
        claim L5: forall w :e L, f w :e R.
        { let w. assume Hw.
          apply LLE w Hw.
          let k. assume Hk: k :e omega.
          assume Hwk: w :e SNo_recipaux x recip_SNo_pos k 0.
          apply LRI (ordsucc k) (omega_ordsucc k Hk).
          prove f w :e SNo_recipaux x recip_SNo_pos (ordsucc k) 1.
          rewrite SNo_recipaux_S x recip_SNo_pos k (omega_nat_p k Hk).
          rewrite tuple_2_1_eq.
          prove f w :e SNo_recipaux x recip_SNo_pos k 1
                  :\/: SNo_recipauxset (SNo_recipaux x recip_SNo_pos k 0) x (SNoL_pos x) recip_SNo_pos
                  :\/: SNo_recipauxset (SNo_recipaux x recip_SNo_pos k 1) x (SNoR x) recip_SNo_pos.
          apply binunionI1.
          apply binunionI2.
          prove (1 + (u + - x) * w) * recip_SNo_pos u :e SNo_recipauxset (SNo_recipaux x recip_SNo_pos k 0) x (SNoL_pos x) recip_SNo_pos.
          apply SNo_recipauxset_I (SNo_recipaux x recip_SNo_pos k 0) x (SNoL_pos x) recip_SNo_pos w.
          - prove w :e SNo_recipaux x recip_SNo_pos k 0.
            exact Hwk.
          - exact Hu.
        }
        claim L6: forall z :e R, f z :e L.
        { let z. assume Hz.
          apply LRE z Hz.
          let k. assume Hk: k :e omega.
          assume Hzk: z :e SNo_recipaux x recip_SNo_pos k 1.
          apply LLI (ordsucc k) (omega_ordsucc k Hk).
          prove (1 + (u + - x) * z) * recip_SNo_pos u :e SNo_recipaux x recip_SNo_pos (ordsucc k) 0.
          rewrite SNo_recipaux_S x recip_SNo_pos k (omega_nat_p k Hk).
          rewrite tuple_2_0_eq.
          prove (1 + (u + - x) * z) * recip_SNo_pos u
             :e SNo_recipaux x recip_SNo_pos k 0
           :\/: SNo_recipauxset (SNo_recipaux x recip_SNo_pos k 0) x (SNoR x) recip_SNo_pos
           :\/: SNo_recipauxset (SNo_recipaux x recip_SNo_pos k 1) x (SNoL_pos x) recip_SNo_pos.
          apply binunionI2.
          prove (1 + (u + - x) * z) * recip_SNo_pos u :e SNo_recipauxset (SNo_recipaux x recip_SNo_pos k 1) x (SNoL_pos x) recip_SNo_pos.
          apply SNo_recipauxset_I (SNo_recipaux x recip_SNo_pos k 1) x (SNoL_pos x) recip_SNo_pos z.
          - prove z :e SNo_recipaux x recip_SNo_pos k 1.
            exact Hzk.
          - exact Hu.
        }
        claim Luu: SNo (u * u).
        { exact SNo_mul_SNo u u Hua1 Hua1. }
        claim Luupos: 0 < u * u.
        { exact mul_SNo_pos_pos u u Hua1 Hua1 Hub Hub. }
        claim Luun0: u * u <> 0.
        { assume H. apply SNoLt_irref 0. rewrite <- H at 2. exact Luupos. }
        claim L2u: SNo (2 * u).
        { exact SNo_mul_SNo 2 u SNo_2 Hua1. }
        claim Lf: forall v, SNo v -> forall p:prop, (SNo ((u + - x) * v) -> SNo (1 + ((u + - x) * v)) -> SNo (f v) -> p) -> p.
        { let v. assume Hv. let p. assume Hp.
          claim Lf1: SNo ((u + - x) * v).
          { apply SNo_mul_SNo.
            - exact Lumx.
            - exact Hv.
          }
          claim Lf2: SNo (1 + (u + - x) * v).
          { apply SNo_add_SNo.
            - exact SNo_1.
            - exact Lf1.
          }
          claim Lf3: SNo ((1 + (u + - x) * v) * recip_SNo_pos u).
          { apply SNo_mul_SNo.
            - exact Lf2.
            - exact Lru.
          }
          exact Hp Lf1 Lf2 Lf3.
        }
        claim Luf: forall v, SNo v -> u * f v = 1 + (u + - x) * v.
        { let v. assume Hv.
          apply Lf v Hv.
          assume Humxv: SNo ((u + - x) * v).
          assume H1umxv: SNo (1 + (u + - x) * v).
          assume Hfv: SNo (f v).
          prove u * ((1 + (u + - x) * v) * recip_SNo_pos u) = 1 + (u + - x) * v.
          rewrite mul_SNo_com (1 + (u + - x) * v) (recip_SNo_pos u) H1umxv Lru.
          rewrite mul_SNo_assoc u (recip_SNo_pos u) (1 + (u + - x) * v) Hua1 Lru H1umxv.
          rewrite recip_SNo_pos_invR u Hua1 Hub.
          exact mul_SNo_oneL (1 + (u + - x) * v) H1umxv.
        }
        claim L7: forall v, SNo v -> f (f v) = (v * u * u + x * x * v + 2 * u + - ((2 * u) * x * v + x)) :/: (u * u).
        { let v. assume Hv.
          set v' := f v.
          apply Lf v Hv.
          assume Humxv: SNo ((u + - x) * v).
          assume H1umxv: SNo (1 + (u + - x) * v).
          assume Hv': SNo v'.
          apply Lf v' Hv'.
          assume Humxv': SNo ((u + - x) * v').
          assume H1umxv': SNo (1 + (u + - x) * v').
          assume Hfv': SNo (f v').
          claim Lxv: SNo (x * v).
          { exact SNo_mul_SNo x v Hx Hv. }
          claim Lxxv: SNo (x * x * v).
          { exact SNo_mul_SNo x (x * v) Hx Lxv. }
          claim L2uxv: SNo ((2 * u) * x * v).
          { exact SNo_mul_SNo (2 * u) (x * v) L2u Lxv. }
          claim Lvuu: SNo (v * u * u).
          { exact SNo_mul_SNo v (u * u) Hv Luu. }
          claim Luxv: SNo (u * x * v).
          { exact SNo_mul_SNo u (x * v) Hua1 Lxv. }
          claim Luv: SNo (u * v).
          { exact SNo_mul_SNo u v Hua1 Hv. }
          claim Lxuv: SNo (x * u * v).
          { exact SNo_mul_SNo x (u * v) Hx Luv. }
          claim Lmuxv: SNo (- u * x * v).
          { exact SNo_minus_SNo (u * x * v) Luxv. }
          claim Lmxuv: SNo (- x * u * v).
          { exact SNo_minus_SNo (x * u * v) Lxuv. }
          claim Lmxmxuv: SNo (- x + - x * u * v).
          { apply SNo_add_SNo.
            - exact Lmx.
            - exact Lmxuv.
          }
          claim Lmxmxuvxxv: SNo (- x + - x * u * v + x * x * v).
          { apply SNo_add_SNo_3.
            - exact Lmx.
            - exact Lmxuv.
            - exact Lxxv.
          }
          prove f v' = (v * u * u + x * x * v + 2 * u + - ((2 * u) * x * v + x)) :/: (u * u).
          symmetry.
          apply mul_div_SNo_nonzero_eq (v * u * u + x * x * v + 2 * u + - ((2 * u) * x * v + x)) (u * u) (f v')
                           (SNo_add_SNo_4 (v * u * u) (x * x * v) (2 * u) (- ((2 * u) * x * v + x))
                                          Lvuu Lxxv L2u (SNo_minus_SNo ((2 * u) * x * v + x) (SNo_add_SNo ((2 * u) * x * v) x L2uxv Hx)))
                           Luu
                           Hfv' Luun0.
          prove v * u * u + x * x * v + 2 * u + - ((2 * u) * x * v + x) = (u * u) * f v'.
          transitivity u + u * (1 + (u + - x) * v) + - x * (1 + (u + - x) * v),
                       u + u * u * v' + - x * u * v',
                       u * (1 + (u + - x) * v'),
                       u * (u * f v').
          - prove v * u * u + x * x * v + 2 * u + - ((2 * u) * x * v + x)
                = u + u * (1 + (u + - x) * v) + - x * (1 + (u + - x) * v).
            transitivity v * u * u + u + u + - u * x * v + (- x + - x * u * v + x * x * v),
                         u + (v * u * u + u + - u * x * v) + (- x + - x * u * v + x * x * v).
            + prove v * u * u + x * x * v + 2 * u + - ((2 * u) * x * v + x)
                  = v * u * u + u + u + - u * x * v + (- x + - x * u * v + x * x * v).
              f_equal.
              prove x * x * v + 2 * u + - ((2 * u) * x * v + x)
                  = u + u + - u * x * v + (- x + - x * u * v + x * x * v).
              rewrite add_SNo_com_3_0_1 (x * x * v) (2 * u) (- ((2 * u) * x * v + x))
                                        Lxxv L2u (SNo_minus_SNo ((2 * u) * x * v + x) (SNo_add_SNo ((2 * u) * x * v) x L2uxv Hx)).
              prove 2 * u + x * x * v + - ((2 * u) * x * v + x)
                  = u + u + - u * x * v + (- x + - x * u * v + x * x * v).
              rewrite <- add_SNo_1_1_2 at 1.
              rewrite mul_SNo_distrR 1 1 u SNo_1 SNo_1 Hua1.
              rewrite mul_SNo_oneL u Hua1.
              prove (u + u) + x * x * v + - ((2 * u) * x * v + x)
                  = u + u + - u * x * v + (- x + - x * u * v + x * x * v).
              transitivity u + u + x * x * v + - ((2 * u) * x * v + x).
              * { symmetry.
                  apply add_SNo_assoc u u (x * x * v + - ((2 * u) * x * v + x)) Hua1 Hua1.
                  prove SNo (x * x * v + - ((2 * u) * x * v + x)).
                  apply SNo_add_SNo.
                  - exact Lxxv.
                  - apply SNo_minus_SNo.
                    apply SNo_add_SNo.
                    + exact L2uxv.
                    + exact Hx.
                }
              * { f_equal. f_equal.
                  prove x * x * v + - ((2 * u) * x * v + x) = - u * x * v + (- x + - x * u * v + x * x * v).
                  transitivity x * x * v + - u * x * v + - x + - x * u * v.
                  - prove x * x * v + - ((2 * u) * x * v + x) = x * x * v + - u * x * v + - x + - x * u * v.
                    f_equal.
                    prove - ((2 * u) * x * v + x) = - u * x * v + - x + - x * u * v.
                    rewrite <- minus_add_SNo_distr_3 (u * x * v) x (x * u * v) Luxv Hx Lxuv.
                    prove - ((2 * u) * x * v + x) = - (u * x * v + x + x * u * v).
                    f_equal.
                    prove (2 * u) * x * v + x = u * x * v + x + x * u * v.
                    rewrite mul_SNo_com_3_0_1 x u v Hx Hua1 Hv.
                    prove (2 * u) * x * v + x = u * x * v + x + u * x * v.
                    rewrite add_SNo_com x (u * x * v) Hx Luxv.
                    rewrite add_SNo_assoc (u * x * v) (u * x * v) x Luxv Luxv Hx.
                    f_equal.
                    prove (2 * u) * x * v = u * x * v + u * x * v.
                    rewrite <- add_SNo_1_1_2 at 1.
                    rewrite mul_SNo_distrR 1 1 u SNo_1 SNo_1 Hua1.
                    rewrite mul_SNo_oneL u Hua1.
                    prove (u + u) * x * v = u * x * v + u * x * v.
                    exact mul_SNo_distrR u u (x * v) Hua1 Hua1 Lxv.
                  - prove x * x * v + - u * x * v + - x + - x * u * v = - u * x * v + (- x + - x * u * v + x * x * v).
                    rewrite add_SNo_com_3_0_1 (x * x * v) (- u * x * v) (- x + - x * u * v)
                                              Lxxv Lmuxv Lmxmxuv.
                    f_equal.
                    prove x * x * v + - x + - x * u * v = - x + - x * u * v + x * x * v.
                    rewrite add_SNo_com_3_0_1 (x * x * v) (- x) (- x * u * v) Lxxv Lmx Lmxuv.
                    f_equal.
                    prove x * x * v + - x * u * v = - x * u * v + x * x * v.
                    exact add_SNo_com (x * x * v) (- x * u * v) Lxxv Lmxuv.
                }
            + prove v * u * u + u + u + - u * x * v + (- x + - x * u * v + x * x * v)
                  = u + (v * u * u + u + - u * x * v) + (- x + - x * u * v + x * x * v).
              rewrite add_SNo_com_3_0_1 (v * u * u) u (u + - u * x * v + (- x + - x * u * v + x * x * v)) Lvuu Hua1.
              * { prove u + v * u * u + u + - u * x * v + (- x + - x * u * v + x * x * v)
                      = u + (v * u * u + u + - u * x * v) + (- x + - x * u * v + x * x * v).
                  f_equal.
                  prove v * u * u + u + - u * x * v + (- x + - x * u * v + x * x * v)
                      = (v * u * u + u + - u * x * v) + (- x + - x * u * v + x * x * v).
                  apply add_SNo_assoc_4.
                  - exact Lvuu.
                  - exact Hua1.
                  - exact Lmuxv.
                  - exact Lmxmxuvxxv.
                }
              * { apply SNo_add_SNo_3.
                  - exact Hua1.
                  - exact Lmuxv.
                  - exact Lmxmxuvxxv.
                }
            + prove u + (v * u * u + u + - u * x * v) + (- x + - x * u * v + x * x * v)
                  = u + u * (1 + (u + - x) * v) + - x * (1 + (u + - x) * v).
              f_equal. f_equal.
              * { prove v * u * u + u + - u * x * v = u * (1 + (u + - x) * v).
                  rewrite mul_SNo_distrL u 1 ((u + - x) * v) Hua1 SNo_1 Humxv.
                  prove v * u * u + u + - u * x * v = u * 1 + u * (u + - x) * v.
                  rewrite mul_SNo_oneR u Hua1.
                  prove v * u * u + u + - u * x * v = u + u * (u + - x) * v.
                  rewrite add_SNo_com_3_0_1 (v * u * u) u (- u * x * v) Lvuu Hua1 (SNo_minus_SNo (u * x * v) Luxv).
                  prove u + v * u * u + - u * x * v = u + u * (u + - x) * v.
                  f_equal.
                  prove v * u * u + - u * x * v = u * (u + - x) * v.
                  rewrite mul_SNo_distrR u (- x) v Hua1 Lmx Hv.
                  prove v * u * u + - u * x * v = u * (u * v + (- x) * v).
                  rewrite mul_SNo_distrL u (u * v) ((- x) * v) Hua1 Luv (SNo_mul_SNo (- x) v Lmx Hv).
                  prove v * u * u + - u * x * v = u * u * v + u * (- x) * v.
                  f_equal.
                  - prove v * u * u = u * u * v.
                    rewrite mul_SNo_com u v Hua1 Hv.
                    exact mul_SNo_com_3_0_1 v u u Hv Hua1 Hua1.
                  - prove - u * x * v = u * (- x) * v.
                    rewrite mul_SNo_minus_distrL x v Hx Hv.
                    symmetry.
                    exact mul_SNo_minus_distrR u (x * v) Hua1 Lxv.
                }
              * { prove - x + - x * u * v + x * x * v = - x * (1 + (u + - x) * v).
                  rewrite <- mul_SNo_minus_distrL x (1 + (u + - x) * v) Hx H1umxv.
                  prove - x + - x * u * v + x * x * v = (- x) * (1 + (u + - x) * v).
                  apply mul_SNo_distrL (- x) 1 ((u + - x) * v) Lmx SNo_1 Humxv (fun w z => - x + - x * u * v + x * x * v = z).
                  prove - x + - x * u * v + x * x * v = (- x) * 1 + (- x) * (u + - x) * v.
                  rewrite mul_SNo_oneR (- x) Lmx.
                  prove - x + - x * u * v + x * x * v = - x + (- x) * (u + - x) * v.
                  f_equal.
                  prove - x * u * v + x * x * v = (- x) * (u + - x) * v.
                  rewrite mul_SNo_distrR u (- x) v Hua1 Lmx Hv.
                  rewrite mul_SNo_distrL (- x) (u * v) ((- x) * v) Lmx Luv (SNo_mul_SNo (- x) v Lmx Hv).
                  prove - x * u * v + x * x * v = (- x) * u * v + (- x) * (- x) * v.
                  rewrite mul_SNo_minus_distrL x (u * v) Hx Luv.
                  prove - x * u * v + x * x * v = - x * u * v + (- x) * (- x) * v.
                  f_equal.
                  prove x * x * v = (- x) * (- x) * v.
                  rewrite mul_SNo_assoc (- x) (- x) v Lmx Lmx Hv.
                  rewrite mul_SNo_minus_minus x x Hx Hx.
                  exact mul_SNo_assoc x x v Hx Hx Hv.
                }
          - prove u + u * (1 + (u + - x) * v) + - x * (1 + (u + - x) * v)
                = u + u * u * v' + - x * u * v'.
            exact Luf v Hv (fun w z => u + u * w + - x * w = u + u * u * v' + - x * u * v') (fun q H => H).
          - prove u + u * u * v' + - x * u * v' = u * (1 + (u + - x) * v').
            apply mul_SNo_distrL u 1 ((u + - x) * v') Hua1 SNo_1 Humxv' (fun w z => u + u * u * v' + - x * u * v' = z).
            prove u + u * u * v' + - x * u * v' = u * 1 + u * (u + - x) * v'.
            rewrite mul_SNo_oneR u Hua1.
            f_equal.
            prove u * u * v' + - x * u * v' = u * (u + - x) * v'.
            apply mul_SNo_distrR u (- x) v' Hua1 Lmx Hv' (fun w z => u * u * v' + - x * u * v' = u * z).
            prove u * u * v' + - x * u * v' = u * (u * v' + (- x) * v').
            apply mul_SNo_distrL u (u * v') ((- x) * v') Hua1 (SNo_mul_SNo u v' Hua1 Hv') (SNo_mul_SNo (- x) v' Lmx Hv') (fun w z => u * u * v' + - x * u * v' = z).
            prove u * u * v' + - x * u * v' = u * u * v' + u * (- x) * v'.
            f_equal.
            prove - x * u * v' = u * (- x) * v'.
            apply mul_SNo_com_3_0_1 u (- x) v' Hua1 Lmx Hv' (fun w z => - x * u * v' = z).
            prove - x * u * v' = (- x) * u * v'.
            symmetry.
            exact mul_SNo_minus_distrL x (u * v') Hx (SNo_mul_SNo u v' Hua1 Hv').
          - f_equal. symmetry. exact Luf v' Hv'.
          - exact mul_SNo_assoc u u (f v') Hua1 Hua1 Hfv'.
        }
        claim L8: forall w :e L, exists w' :e L, w < w'.
        { let w. assume Hw.
          claim Lw: SNo w.
          { apply real_SNo. exact LLreal w Hw. }
          claim Lxw: SNo (x * w).
          { exact SNo_mul_SNo x w Hx Lw. }
          claim Lxxw: SNo (x * x * w).
          { exact SNo_mul_SNo x (x * w) Hx Lxw. }
          claim L2uxw: SNo ((2 * u) * x * w).
          { exact SNo_mul_SNo (2 * u) (x * w) L2u Lxw. }
          claim Lwuu: SNo (w * u * u).
          { exact SNo_mul_SNo w (u * u) Lw Luu. }
          witness f (f w). apply andI.
          - apply L6. apply L5. exact Hw.
          - prove w < f (f w).
            claim L8a: w < (w * u * u + x * x * w + 2 * u + - ((2 * u) * x * w + x)) :/: (u * u).
            { prove w < (w * u * u + x * x * w + 2 * u + - ((2 * u) * x * w + x)) :/: (u * u).
              apply div_SNo_pos_LtR (w * u * u + x * x * w + 2 * u + - ((2 * u) * x * w + x)) (u * u) w.
              + exact SNo_add_SNo_4 (w * u * u) (x * x * w) (2 * u) (- ((2 * u) * x * w + x))
                                    Lwuu Lxxw L2u
                                    (SNo_minus_SNo ((2 * u) * x * w + x) (SNo_add_SNo ((2 * u) * x * w) x L2uxw Hx)).
              + exact Luu.
              + exact Lw.
              + prove 0 < u * u. exact Luupos.
              + prove w * u * u < w * u * u + x * x * w + 2 * u + - ((2 * u) * x * w + x).
                rewrite <- add_SNo_0R (w * u * u) at 1.
                * { prove w * u * u + 0 < w * u * u + x * x * w + 2 * u + - ((2 * u) * x * w + x).
                    apply add_SNo_Lt2.
                    - exact Lwuu.
                    - exact SNo_0.
                    - exact SNo_add_SNo_3 (x * x * w) (2 * u) (- ((2 * u) * x * w + x))
                                    Lxxw L2u
                                    (SNo_minus_SNo ((2 * u) * x * w + x) (SNo_add_SNo ((2 * u) * x * w) x L2uxw Hx)).
                    - prove 0 < x * x * w + 2 * u + - ((2 * u) * x * w + x).
                      apply add_SNo_minus_Lt2b3.
                      + exact Lxxw.
                      + exact L2u.
                      + exact SNo_add_SNo ((2 * u) * x * w) x L2uxw Hx.
                      + exact SNo_0.
                      + prove 0 + (2 * u) * x * w + x < x * x * w + 2 * u.
                        rewrite add_SNo_0L.
                        * { prove (2 * u) * x * w + x < x * x * w + 2 * u.
                            rewrite add_SNo_com ((2 * u) * x * w) x (SNo_mul_SNo (2 * u) (x * w) L2u Lxw) Hx.
                            rewrite add_SNo_com (x * x * w) (2 * u) Lxxw L2u.
                            rewrite <- mul_SNo_oneR x Hx at 1.
                            prove x * 1 + (2 * u) * x * w < 2 * u + x * x * w.
                            rewrite <- mul_SNo_oneR (2 * u) L2u at 2.
                            prove x * 1 + (2 * u) * x * w < (2 * u) * 1 + x * x * w.
                            apply mul_SNo_Lt.
                            - exact L2u.
                            - exact SNo_1.
                            - exact Hx.
                            - exact Lxw.
                            - prove x < 2 * u. exact H3.
                            - prove x * w < 1.
                              rewrite mul_SNo_com x w Hx Lw.
                              apply div_SNo_pos_LtR'.
                              + exact SNo_1.
                              + exact Hx.
                              + exact Lw.
                              + prove 0 < x. exact Hxpos.
                              + prove w < 1 :/: x.
                                prove w < 1 * recip_SNo x.
                                rewrite mul_SNo_oneL (recip_SNo x) (SNo_recip_SNo x Hx).
                                rewrite recip_SNo_poscase x Hxpos.
                                prove w < recip_SNo_pos x.
                                rewrite LrxLR.
                                prove w < y.
                                apply HLR3. exact Hw.
                          }
                        * exact SNo_add_SNo ((2 * u) * x * w) x (SNo_mul_SNo (2 * u) (x * w) L2u Lxw) Hx.
                  }
                * exact Lwuu.
            }
            exact L7 w Lw (fun u v => w < v) L8a.
        }
        claim L9: forall z :e R, exists z' :e R, z' < z.
        { let z. assume Hz.
          claim Lz: SNo z.
          { apply real_SNo. exact LRreal z Hz. }
          claim Lxz: SNo (x * z).
          { exact SNo_mul_SNo x z Hx Lz. }
          claim Lxxz: SNo (x * x * z).
          { exact SNo_mul_SNo x (x * z) Hx Lxz. }
          claim L2uxz: SNo ((2 * u) * x * z).
          { exact SNo_mul_SNo (2 * u) (x * z) L2u Lxz. }
          claim Lzuu: SNo (z * u * u).
          { exact SNo_mul_SNo z (u * u) Lz Luu. }
          witness f (f z). apply andI.
          - apply L5. apply L6. exact Hz.
          - prove f (f z) < z.
            claim L9a: (z * u * u + x * x * z + 2 * u + - ((2 * u) * x * z + x)) :/: (u * u) < z.
            { apply div_SNo_pos_LtL (z * u * u + x * x * z + 2 * u + - ((2 * u) * x * z + x)) (u * u) z.
              + exact SNo_add_SNo_4 (z * u * u) (x * x * z) (2 * u) (- ((2 * u) * x * z + x))
                                    Lzuu Lxxz L2u
                                    (SNo_minus_SNo ((2 * u) * x * z + x) (SNo_add_SNo ((2 * u) * x * z) x L2uxz Hx)).
              + exact Luu.
              + exact Lz.
              + prove 0 < u * u. exact Luupos.
              + prove z * u * u + x * x * z + 2 * u + - ((2 * u) * x * z + x) < z * u * u.
                rewrite <- add_SNo_0R (z * u * u) at 2.
                * { prove z * u * u + x * x * z + 2 * u + - ((2 * u) * x * z + x) < z * u * u + 0.
                    apply add_SNo_Lt2.
                    - exact Lzuu.
                    - exact SNo_add_SNo_3 (x * x * z) (2 * u) (- ((2 * u) * x * z + x))
                                    Lxxz L2u
                                    (SNo_minus_SNo ((2 * u) * x * z + x) (SNo_add_SNo ((2 * u) * x * z) x L2uxz Hx)).
                    - exact SNo_0.
                    - prove x * x * z + 2 * u + - ((2 * u) * x * z + x) < 0.
                      apply add_SNo_minus_Lt1b3.
                      + exact Lxxz.
                      + exact L2u.
                      + exact SNo_add_SNo ((2 * u) * x * z) x L2uxz Hx.
                      + exact SNo_0.
                      + prove x * x * z + 2 * u < 0 + (2 * u) * x * z + x.
                        rewrite add_SNo_0L.
                        * { prove x * x * z + 2 * u < (2 * u) * x * z + x.
                            rewrite <- mul_SNo_oneR x Hx at 4.
                            prove x * x * z + 2 * u < (2 * u) * x * z + x * 1.
                            rewrite <- mul_SNo_oneR (2 * u) L2u at 1.
                            prove x * x * z + (2 * u) * 1 < (2 * u) * x * z + x * 1.
                            apply mul_SNo_Lt.
                            - exact L2u.
                            - exact Lxz.
                            - exact Hx.
                            - exact SNo_1.
                            - prove x < 2 * u. exact H3.
                            - prove 1 < x * z.
                              rewrite mul_SNo_com x z Hx Lz.
                              prove 1 < z * x.
                              apply div_SNo_pos_LtL'.
                              + exact SNo_1.
                              + exact Hx.
                              + exact Lz.
                              + prove 0 < x. exact Hxpos.
                              + prove 1 :/: x < z.
                                prove 1 * recip_SNo x < z.
                                rewrite mul_SNo_oneL (recip_SNo x) (SNo_recip_SNo x Hx).
                                rewrite recip_SNo_poscase x Hxpos.
                                prove recip_SNo_pos x < z.
                                rewrite LrxLR.
                                prove y < z.
                                apply HLR4. exact Hz.
                          }
                        * exact SNo_add_SNo ((2 * u) * x * z) x (SNo_mul_SNo (2 * u) (x * z) L2u Lxz) Hx.
                  }
                * exact Lzuu.
            }
            exact L7 z Lz (fun u v => v < z) L9a.
        }
        prove recip_SNo_pos x :e real.
        rewrite recip_SNo_pos_eq x Hx.
        prove SNoCut L R :e real.
        apply real_SNoCut.
        - exact LLreal.
        - exact LRreal.
        - exact LLR.
        - exact LL0.
        - prove R <> 0.
          assume H4: R = 0.
          apply EmptyE ((1 + (u + - x) * 0) * recip_SNo_pos u).
          prove (1 + (u + - x) * 0) * recip_SNo_pos u :e 0.
          rewrite <- H4 at 3.
          prove (1 + (u + - x) * 0) * recip_SNo_pos u :e R.
          apply L5 0.
          prove 0 :e L.
          apply LLI 0 (nat_p_omega 0 nat_0).
          prove 0 :e SNo_recipaux x recip_SNo_pos 0 0.
          rewrite SNo_recipaux_0 x recip_SNo_pos.
          rewrite tuple_2_0_eq.
          prove 0 :e {0}.
          apply SingI.
        - prove forall w :e L, exists w' :e L, w < w'.
          exact L8.
        - prove forall z :e R, exists z' :e R, z' < z.
          exact L9.
      }
- exact L2.
Qed.

Theorem real_recip_SNo_pos: forall x :e real, 0 < x -> recip_SNo_pos x :e real.
let x. assume Hx Hxpos.
apply real_recip_SNo_lem1 x (real_SNo x Hx) Hx Hxpos.
assume H _. exact H.
Qed.

Theorem real_recip_SNo: forall x :e real, recip_SNo x :e real.
let x. assume Hx.
claim Lx: SNo x.
{ exact real_SNo x Hx. }
apply SNoLt_trichotomy_or_impred x 0 Lx SNo_0.
- assume H1: x < 0.
  rewrite recip_SNo_negcase x Lx H1.
  prove - recip_SNo_pos (- x) :e real.
  apply real_minus_SNo (recip_SNo_pos (- x)).
  prove recip_SNo_pos (- x) :e real.
  apply real_recip_SNo_pos (- x).
  + prove - x :e real.
    exact real_minus_SNo x Hx.
  + prove 0 < - x.
    apply minus_SNo_Lt_contra2 x 0 Lx SNo_0.
    prove x < - 0.
    rewrite minus_SNo_0.
    exact H1.
- assume H1: x = 0. rewrite H1. rewrite recip_SNo_0.
  prove 0 :e real.
  exact real_0.
- assume H1: 0 < x.
  rewrite recip_SNo_poscase x H1.
  exact real_recip_SNo_pos x Hx H1.
Qed.

Theorem real_div_SNo: forall x y :e real, x :/: y :e real.
let x. assume Hx. let y. assume Hy.
prove x * recip_SNo y :e real.
apply real_mul_SNo.
- exact Hx.
- apply real_recip_SNo. exact Hy.
Qed.

Theorem sqrt_SNo_nonneg_0inL0: forall x, SNo x -> 0 <= x -> 0 :e SNoLev x -> 0 :e SNo_sqrtaux x sqrt_SNo_nonneg 0 0.
let x. assume Hx Hxnn H1.
set L_ := fun k:set => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
prove 0 :e L_ 0.
rewrite <- sqrt_SNo_nonneg_0 at 1.
prove sqrt_SNo_nonneg 0 :e SNo_sqrtaux x sqrt_SNo_nonneg 0 0.
rewrite SNo_sqrtaux_0 x sqrt_SNo_nonneg.
rewrite tuple_2_0_eq.
prove sqrt_SNo_nonneg 0 :e {sqrt_SNo_nonneg w|w :e SNoL_nonneg x}.
apply ReplI.
prove 0 :e SNoL_nonneg x.
prove 0 :e {w :e SNoL x|0 <= w}.
apply SepI.
- prove 0 :e SNoL x.
  apply SNoL_I x Hx 0 SNo_0.
  + prove SNoLev 0 :e SNoLev x.
    rewrite SNoLev_0. exact H1.
  + prove 0 < x.
    apply SNoLeE 0 x SNo_0 Hx Hxnn.
    * assume H3: 0 < x. exact H3.
    * assume H3: 0 = x. prove False.
      apply EmptyE 0.
      rewrite <- SNoLev_0 at 2.
      rewrite H3 at 2.
      exact H1.
- prove 0 <= 0. apply SNoLe_ref.
Qed.

Theorem sqrt_SNo_nonneg_Lnonempty: forall x, SNo x -> 0 <= x -> 0 :e SNoLev x -> (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0) <> 0.
let x. assume Hx Hxnn H1.
set L_ := fun k:set => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
set R_ := fun k:set => SNo_sqrtaux x sqrt_SNo_nonneg k 1.
set L := \/_ k :e omega, L_ k.
set R := \/_ k :e omega, R_ k.
prove L <> 0.
assume H2: L = 0.
claim L1: sqrt_SNo_nonneg 0 :e L_ 0.
{ rewrite sqrt_SNo_nonneg_0.
  exact sqrt_SNo_nonneg_0inL0 x Hx Hxnn H1.
}
apply EmptyE (sqrt_SNo_nonneg 0).
prove sqrt_SNo_nonneg 0 :e 0.
rewrite <- H2 at 2.
exact famunionI omega L_ 0 (sqrt_SNo_nonneg 0) (nat_p_omega 0 nat_0) L1.
Qed.

Theorem sqrt_SNo_nonneg_Rnonempty: forall x, SNo x -> 0 <= x -> 1 :e SNoLev x -> (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1) <> 0.
let x. assume Hx Hxnn H1.
set L_ := fun k:set => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
set R_ := fun k:set => SNo_sqrtaux x sqrt_SNo_nonneg k 1.
set L := \/_ k :e omega, L_ k.
set R := \/_ k :e omega, R_ k.
prove R <> 0.
assume H2: R = 0.
apply SNoLt_trichotomy_or_impred x 1 Hx SNo_1.
- assume H3: x < 1.
  claim L1: 1 :e SNoR x.
  { apply SNoR_I x Hx 1 SNo_1.
    - prove SNoLev 1 :e SNoLev x.
      rewrite ordinal_SNoLev 1 (nat_p_ordinal 1 nat_1).
      exact H1.
    - exact H3.
  }
  claim L2: sqrt_SNo_nonneg 1 :e R_ 0.
  { prove sqrt_SNo_nonneg 1 :e SNo_sqrtaux x sqrt_SNo_nonneg 0 1.
    rewrite SNo_sqrtaux_0 x sqrt_SNo_nonneg.
    rewrite tuple_2_1_eq.
    prove sqrt_SNo_nonneg 1 :e {sqrt_SNo_nonneg z|z :e SNoR x}.
    apply ReplI.
    exact L1.
  }
  apply EmptyE (sqrt_SNo_nonneg 1).
  rewrite <- H2 at 2.
  prove sqrt_SNo_nonneg 1 :e R.
  exact famunionI omega R_ 0 (sqrt_SNo_nonneg 1) (nat_p_omega 0 nat_0) L2.
- assume H3: x = 1. prove False.
  apply In_irref 1.
  prove 1 :e 1.
  rewrite <- ordinal_SNoLev 1 (nat_p_ordinal 1 nat_1) at 2.
  rewrite <- H3 at 2.
  exact H1.
- assume H3: 1 < x.
  claim L3: 1 :e SNoL_nonneg x.
  { prove 1 :e {w :e SNoL x|0 <= w}.
    apply SepI.
    - apply SNoL_I x Hx 1 SNo_1.
      + prove SNoLev 1 :e SNoLev x.
        rewrite ordinal_SNoLev 1 (nat_p_ordinal 1 nat_1).
        exact H1.
      + exact H3.
    - prove 0 <= 1. apply SNoLtLe. exact SNoLt_0_1.
  }
  claim L4: (x + 1 * 0) :/: (1 + 0) :e R_ 1.
  { prove (x + 1 * 0) :/: (1 + 0) :e SNo_sqrtaux x sqrt_SNo_nonneg 1 1.
    rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg 0 nat_0.
    rewrite tuple_2_1_eq.
    apply binunionI1.
    apply binunionI2.
    apply SNo_sqrtauxset_I.
    - prove 1 :e L_ 0.
      prove 1 :e SNo_sqrtaux x sqrt_SNo_nonneg 0 0.
      rewrite SNo_sqrtaux_0.
      rewrite tuple_2_0_eq.
      prove 1 :e {sqrt_SNo_nonneg w|w :e SNoL_nonneg x}.
      rewrite <- sqrt_SNo_nonneg_1.
      apply ReplI.
      prove 1 :e SNoL_nonneg x.
      exact L3.
    - prove 0 :e L_ 0.
      exact sqrt_SNo_nonneg_0inL0 x Hx Hxnn (ordinal_TransSet (SNoLev x) (SNoLev_ordinal x Hx) 1 H1 0 In_0_1).
    - prove 0 < 1 + 0.
      rewrite add_SNo_0R 1 SNo_1.
      exact SNoLt_0_1.
  }
  apply EmptyE ((x + 1 * 0) :/: (1 + 0)).
  rewrite <- H2 at 5.
  prove ((x + 1 * 0) :/: (1 + 0)) :e R.
  exact famunionI omega R_ 1 ((x + 1 * 0) :/: (1 + 0)) (nat_p_omega 1 nat_1) L4.
Qed.

Theorem SNo_sqrtauxset_real: forall Y Z x, Y c= real -> Z c= real -> x :e real -> SNo_sqrtauxset Y Z x c= real.
let Y Z x. assume HY HZ Hx.
prove (\/_ y :e Y, {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}) c= real.
let w. assume Hw.
apply famunionE_impred Y (fun y => {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}) w Hw.
let y.
assume Hy: y :e Y.
assume Hw2: w :e {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}.
apply ReplSepE_impred Z (fun z => 0 < y + z) (fun z => (x + y * z) :/: (y + z)) w Hw2.
let z.
assume Hz: z :e Z.
assume Hyz: 0 < y + z.
assume Hw3: w = (x + y * z) :/: (y + z).
prove w :e real.
rewrite Hw3.
apply real_div_SNo.
- prove x + y * z :e real. apply real_add_SNo.
  + exact Hx.
  + apply real_mul_SNo.
    * exact HY y Hy.
    * exact HZ z Hz.
- prove y + z :e real.
  apply real_add_SNo.
  + exact HY y Hy.
  + exact HZ z Hz.
Qed.

Theorem SNo_sqrtauxset_real_nonneg: forall Y Z x, Y c= {w :e real|0 <= w} -> Z c= {z :e real|0 <= z} -> x :e real -> 0 <= x -> SNo_sqrtauxset Y Z x c= {w :e real|0 <= w}.
let Y Z x. assume HY HZ Hx Hxnneg.
prove (\/_ y :e Y, {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}) c= {w :e real|0 <= w}.
claim LY: Y c= real.
{ let y. assume Hy. exact SepE1 real (fun w => 0 <= w) y (HY y Hy). }
claim LZ: Z c= real.
{ let z. assume Hz. exact SepE1 real (fun w => 0 <= w) z (HZ z Hz). }
claim LxS: SNo x.
{ exact real_SNo x Hx. }
let w. assume Hw.
apply SepI.
- apply SNo_sqrtauxset_real Y Z x LY LZ Hx w Hw.
- prove 0 <= w.
  apply famunionE_impred Y (fun y => {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}) w Hw.
  let y.
  assume Hy: y :e Y.
  assume Hw2: w :e {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}.
  apply ReplSepE_impred Z (fun z => 0 < y + z) (fun z => (x + y * z) :/: (y + z)) w Hw2.
  let z.
  assume Hz: z :e Z.
  assume Hyz: 0 < y + z.
  assume Hw3: w = (x + y * z) :/: (y + z).
  apply SepE real (fun w => 0 <= w) y (HY y Hy).
  assume HyR: y :e real.
  assume Hynneg: 0 <= y.
  claim LyS: SNo y.
  { exact real_SNo y HyR. }
  apply SepE real (fun z => 0 <= z) z (HZ z Hz).
  assume HzR: z :e real.
  assume Hznneg: 0 <= z.
  claim LzS: SNo z.
  { exact real_SNo z HzR. }
  rewrite Hw3.
  prove 0 <= (x + y * z) :/: (y + z).
  claim L1: 0 <= x + y * z.
  { rewrite <- add_SNo_0R 0 SNo_0.
    apply add_SNo_Le3 0 0 x (y * z) SNo_0 SNo_0 (real_SNo x Hx) (SNo_mul_SNo y z LyS LzS).
    - prove 0 <= x. exact Hxnneg.
    - prove 0 <= y * z.
      apply SNoLeE 0 y SNo_0 LyS Hynneg.
      + assume H1: 0 < y.
        apply SNoLeE 0 z SNo_0 LzS Hznneg.
	* assume H2: 0 < z.
	  apply SNoLtLe.
	  prove 0 < y * z.
	  exact mul_SNo_pos_pos y z LyS LzS H1 H2.
	* assume H2: 0 = z.
	  rewrite <- H2.
	  rewrite mul_SNo_zeroR y LyS.
	  apply SNoLe_ref.
      + assume H1: 0 = y.
        rewrite <- H1.
        rewrite mul_SNo_zeroL z LzS.
        apply SNoLe_ref.
  }
  apply SNoLeE 0 (x + y * z) SNo_0 (SNo_add_SNo x (y * z) LxS (SNo_mul_SNo y z LyS LzS)) L1.
  - assume H1: 0 < x + y * z.
    prove 0 <= (x + y * z) :/: (y + z).
    apply SNoLtLe.
    prove 0 < (x + y * z) :/: (y + z).
    exact div_SNo_pos_pos (x + y * z) (y + z)
                          (SNo_add_SNo x (y * z) LxS (SNo_mul_SNo y z LyS LzS))
			  (SNo_add_SNo y z LyS LzS)
			  H1
			  Hyz.
  - assume H1: 0 = x + y * z.
    rewrite <- H1.
    rewrite div_SNo_0_num (y + z) (SNo_add_SNo y z LyS LzS).
    apply SNoLe_ref.
Qed.

Theorem sqrt_SNo_nonneg_SNoS_omega: forall x :e SNoS_ omega, 0 <= x -> sqrt_SNo_nonneg x :e real.
claim L1: forall x, SNo x -> SNoLev x :e omega -> 0 <= x -> sqrt_SNo_nonneg x :e real.
{ apply SNoLev_ind.
  let x. assume Hx: SNo x.
  assume IH: forall w :e SNoS_ (SNoLev x), SNoLev w :e omega -> 0 <= w -> sqrt_SNo_nonneg w :e real.
  assume Hx1: SNoLev x :e omega.
  assume Hx2: 0 <= x.
  claim Lx: x :e real.
  { apply SNoS_omega_real.
    apply SNoS_I omega omega_ordinal x (SNoLev x) Hx1.
    prove SNo_ (SNoLev x) x.
    exact SNoLev_ x Hx.
  }
  prove sqrt_SNo_nonneg x :e real.
  apply ordinal_In_Or_Subq 0 (SNoLev x) ordinal_Empty (SNoLev_ordinal x Hx).
  - assume H1: 0 :e SNoLev x.
    apply ordinal_In_Or_Subq 1 (SNoLev x) ordinal_1 (SNoLev_ordinal x Hx).
    + assume H2: 1 :e SNoLev x.
      prove sqrt_SNo_nonneg x :e real.
      rewrite sqrt_SNo_nonneg_eq x Hx.
      set L_ := fun k:set => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
      set R_ := fun k:set => SNo_sqrtaux x sqrt_SNo_nonneg k 1.
      set L := \/_ k :e omega, L_ k.
      set R := \/_ k :e omega, R_ k.
      prove SNoCut L R :e real.
      claim L_L_R_real: forall k, nat_p k -> L_ k c= real /\ R_ k c= real.
      { prove forall k, nat_p k ->
                   SNo_sqrtaux x sqrt_SNo_nonneg k 0 c= real
                /\ SNo_sqrtaux x sqrt_SNo_nonneg k 1 c= real.
        apply nat_ind.
        - rewrite SNo_sqrtaux_0. rewrite tuple_2_0_eq. rewrite tuple_2_1_eq.
          apply andI.
          + prove {sqrt_SNo_nonneg w|w :e SNoL_nonneg x} c= real.
            let w'. assume Hw'.
            apply ReplE_impred (SNoL_nonneg x) sqrt_SNo_nonneg w' Hw'.
            let w. assume Hw: w :e SNoL_nonneg x.
            assume Hw'w: w' = sqrt_SNo_nonneg w.
            rewrite Hw'w.
            prove sqrt_SNo_nonneg w :e real.
            apply SepE (SNoL x) (fun w => 0 <= w) w Hw.
            assume Hw1: w :e SNoL x.
            assume Hwnneg: 0 <= w.
            apply SNoL_E x Hx w Hw1.
            assume Hw1a Hw1b Hw1c.
            apply IH.
            * prove w :e SNoS_ (SNoLev x).
              exact SNoS_I2 w x Hw1a Hx Hw1b.
            * prove SNoLev w :e omega.
              exact omega_TransSet (SNoLev x) Hx1 (SNoLev w) Hw1b.
            * prove 0 <= w. exact Hwnneg.
          + prove {sqrt_SNo_nonneg z|z :e SNoR x} c= real.
            let z'. assume Hz'.
            apply ReplE_impred (SNoR x) sqrt_SNo_nonneg z' Hz'.
            let z. assume Hz: z :e SNoR x.
            assume Hz'z: z' = sqrt_SNo_nonneg z.
            rewrite Hz'z.
            prove sqrt_SNo_nonneg z :e real.
            apply SNoR_E x Hx z Hz.
            assume Hz1 Hz2 Hz3.
            apply IH.
            * prove z :e SNoS_ (SNoLev x).
              exact SNoS_I2 z x Hz1 Hx Hz2.
            * prove SNoLev z :e omega.
              exact omega_TransSet (SNoLev x) Hx1 (SNoLev z) Hz2.
            * prove 0 <= z. apply SNoLtLe.
              prove 0 < z.
              apply SNoLeLt_tra 0 x z SNo_0 Hx Hz1 Hx2.
              prove x < z. exact Hz3.
        - let k. assume Hk.
          assume IHk. apply IHk.
          assume IHk0: SNo_sqrtaux x sqrt_SNo_nonneg k 0 c= real.
          assume IHk1: SNo_sqrtaux x sqrt_SNo_nonneg k 1 c= real.
          rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k Hk.
          rewrite tuple_2_0_eq. rewrite tuple_2_1_eq.
          apply andI.
          + prove SNo_sqrtaux x sqrt_SNo_nonneg k 0 :\/: SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 0) (SNo_sqrtaux x sqrt_SNo_nonneg k 1) x c= real.
            apply binunion_Subq_min.
            * exact IHk0.
            * { prove SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 0) (SNo_sqrtaux x sqrt_SNo_nonneg k 1) x c= real.
                apply SNo_sqrtauxset_real.
                - exact IHk0.
                - exact IHk1.
                - exact Lx.
              }
          + prove SNo_sqrtaux x sqrt_SNo_nonneg k 1 :\/: SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 0) (SNo_sqrtaux x sqrt_SNo_nonneg k 0) x :\/: SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 1) (SNo_sqrtaux x sqrt_SNo_nonneg k 1) x c= real.
            apply binunion_Subq_min.
            * { apply binunion_Subq_min.
                - exact IHk1.
                - prove SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 0) (SNo_sqrtaux x sqrt_SNo_nonneg k 0) x c= real.
                  apply SNo_sqrtauxset_real.
                  + exact IHk0.
                  + exact IHk0.
                  + exact Lx.
              }
            * { prove SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 1) (SNo_sqrtaux x sqrt_SNo_nonneg k 1) x c= real.
                apply SNo_sqrtauxset_real.
                - exact IHk1.
                - exact IHk1.
                - exact Lx.
              }
      }
      claim L1L: forall w :e L, forall p:prop, (SNo w -> 0 <= w -> w * w < x -> p) -> p.
      { let w. assume Hw. let p. assume Hp.
        apply famunionE_impred omega L_ w Hw.
        let k. assume Hk: k :e omega.
        assume H1: w :e L_ k.
        apply SNo_sqrtaux_0_prop x Hx Hx2 k (omega_nat_p k Hk) w H1.
        assume H2. apply H2.
        exact Hp.
      }
      claim L1R: forall z :e R, forall p:prop, (SNo z -> 0 <= z -> x < z * z -> p) -> p.
      { let z. assume Hz. let p. assume Hp.
        apply famunionE_impred omega R_ z Hz.
        let k. assume Hk: k :e omega.
        assume H1: z :e R_ k.
        apply SNo_sqrtaux_1_prop x Hx Hx2 k (omega_nat_p k Hk) z H1.
        assume H3. apply H3.
        exact Hp.
      }
      claim LLR: SNoCutP L R.
      { exact SNo_sqrt_SNo_SNoCutP x Hx Hx2. }
      apply LLR.
      assume HLHR. apply HLHR.
      assume HL: forall w :e L, SNo w.
      assume HR: forall z :e R, SNo z.
      assume HLR: forall w :e L, forall z :e R, w < z.
      apply real_SNoCut.
      * prove L c= real.
        let w. assume Hw: w :e L.
        apply famunionE_impred omega L_ w Hw.
        let k. assume Hk: k :e omega.
        assume H1: w :e L_ k.
        apply L_L_R_real k (omega_nat_p k Hk).
        assume H2 _. exact H2 w H1.
      * prove R c= real.
        let z. assume Hz: z :e R.
        apply famunionE_impred omega R_ z Hz.
        let k. assume Hk: k :e omega.
        assume H1: z :e R_ k.
        apply L_L_R_real k (omega_nat_p k Hk).
        assume _ H2. exact H2 z H1.
      * prove SNoCutP L R. exact LLR.
      * prove L <> 0.
        exact sqrt_SNo_nonneg_Lnonempty x Hx Hx2 H1.
      * prove R <> 0.
        exact sqrt_SNo_nonneg_Rnonempty x Hx Hx2 H2.
      * prove forall w :e L, exists w' :e L, w < w'.
        let w. assume Hw.
        apply famunionE_impred omega L_ w Hw.
        let k. assume Hk: k :e omega.
        assume H3: w :e L_ k.
        apply L1L w Hw.
        assume Hw1: SNo w.
        assume Hw2: 0 <= w.
        assume Hw3: w * w < x.
        claim Lwmw: SNo (w * w).
        { exact SNo_mul_SNo w w Hw1 Hw1. }
        claim Lwpw: SNo (w + w).
        { exact SNo_add_SNo w w Hw1 Hw1. }
        claim L1a: exists z, z :e R_ (ordsucc k).
        { apply SNoLt_trichotomy_or_impred x 1 Hx SNo_1.
          - assume H4: x < 1.
            witness 1.
            prove 1 :e R_ (ordsucc k).
            apply SNo_sqrtaux_mon x sqrt_SNo_nonneg 0 nat_0 (ordsucc k) (nat_ordsucc k (omega_nat_p k Hk)) (Subq_Empty (ordsucc k)).
            assume _.
            assume H5: forall z :e R_ 0, z :e R_ (ordsucc k).
            prove 1 :e R_ (ordsucc k).
            apply H5.
            prove 1 :e R_ 0.
            prove 1 :e SNo_sqrtaux x sqrt_SNo_nonneg 0 1.
            rewrite SNo_sqrtaux_0.
            rewrite tuple_2_1_eq.
            prove 1 :e {sqrt_SNo_nonneg z|z :e SNoR x}.
            rewrite <- sqrt_SNo_nonneg_1.
            apply ReplI.
            prove 1 :e SNoR x.
            prove 1 :e {z :e SNoS_ (SNoLev x)|x < z}.
            apply SepI.
            + prove 1 :e SNoS_ (SNoLev x).
              apply SNoS_I2 1 x SNo_1 Hx.
              prove SNoLev 1 :e SNoLev x.
              rewrite ordinal_SNoLev 1 ordinal_1.
              exact H2.
            + prove x < 1. exact H4.
          - assume H4: x = 1. prove False.
            apply In_irref 1.
            prove 1 :e 1.
            rewrite <- ordinal_SNoLev 1 ordinal_1 at 2.
            prove 1 :e SNoLev 1.
            rewrite <- H4 at 2.
            exact H2.
          - assume H4: 1 < x.
            claim L1a1: 1 :e L_ k.
            { apply SNo_sqrtaux_mon x sqrt_SNo_nonneg 0 nat_0 k (omega_nat_p k Hk) (Subq_Empty k).
              assume H5: forall z :e L_ 0, z :e L_ k.
              assume _.
              prove 1 :e L_ k.
              apply H5.
              prove 1 :e L_ 0.
              prove 1 :e SNo_sqrtaux x sqrt_SNo_nonneg 0 0.
              rewrite SNo_sqrtaux_0.
              rewrite tuple_2_0_eq.
              prove 1 :e {sqrt_SNo_nonneg z|z :e SNoL_nonneg x}.
              rewrite <- sqrt_SNo_nonneg_1.
              apply ReplI.
              prove 1 :e SNoL_nonneg x.
              prove 1 :e {w :e SNoL x|0 <= w}.
              apply SepI.
              - prove 1 :e {z :e SNoS_ (SNoLev x)|z < x}.
                apply SepI.
                + prove 1 :e SNoS_ (SNoLev x).
                  apply SNoS_I2 1 x SNo_1 Hx.
                  prove SNoLev 1 :e SNoLev x.
                  rewrite ordinal_SNoLev 1 ordinal_1.
                  exact H2.
                + prove 1 < x. exact H4.
              - prove 0 <= 1. apply SNoLtLe. exact SNoLt_0_1.
            }
            claim L1a2: 0 < 1 + 1.
            { rewrite add_SNo_1_1_2. exact SNoLt_0_2. }
            set z := (x + 1 * 1) :/: (1 + 1).
            witness z.
            prove z :e R_ (ordsucc k).
            prove z :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k) 1.
            rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k (omega_nat_p k Hk).
            rewrite tuple_2_1_eq.
            prove z :e R_ k :\/: SNo_sqrtauxset (L_ k) (L_ k) x :\/: SNo_sqrtauxset (R_ k) (R_ k) x.
            apply binunionI1. apply binunionI2.
            prove z :e SNo_sqrtauxset (L_ k) (L_ k) x.
            exact SNo_sqrtauxset_I (L_ k) (L_ k) x 1 L1a1 1 L1a1 L1a2.
        }
        apply L1a.
        let z. assume Hz: z :e R_ (ordsucc k).
        claim Lz: z :e R.
        { exact famunionI omega R_ (ordsucc k) z (omega_ordsucc k Hk) Hz. }
        apply L1R z Lz.
        assume Hz1: SNo z.
        assume Hz2: 0 <= z.
        assume Hz3: x < z * z.
        claim Lwmz: SNo (w * z).
        { exact SNo_mul_SNo w z Hw1 Hz1. }
        claim Lwpz: SNo (w + z).
        { exact SNo_add_SNo w z Hw1 Hz1. }
        claim Lzpos: 0 < z.
        { apply SNoLeE 0 z SNo_0 Hz1 Hz2.
          - assume H4: 0 < z. exact H4.
          - assume H4: 0 = z. prove False.
            apply SNoLt_irref 0.
            prove 0 < 0.
            apply SNoLeLt_tra 0 x 0 SNo_0 Hx SNo_0 Hx2.
            prove x < 0.
            rewrite <- mul_SNo_zeroR 0 SNo_0.
            rewrite H4.
            prove x < z * z.
            exact Hz3.
        }
        claim Lwpzpos: 0 < w + z.
        { apply SNoLtLe_tra 0 z (w + z) SNo_0 Hz1 Lwpz Lzpos.
          prove z <= w + z.
          rewrite <- add_SNo_0L z Hz1 at 1.
          prove 0 + z <= w + z.
          exact add_SNo_Le1 0 z w SNo_0 Hz1 Hw1 Hw2.
        }
        claim Lwpzn0: w + z <> 0.
        { assume H4: w + z = 0.
          apply SNoLt_irref 0.
          rewrite <- H4 at 2.
          exact Lwpzpos.
        }
        set w' := (x + w * z) :/: (w + z).
        claim Lw': w' :e L_ (ordsucc (ordsucc k)).
        { prove w' :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc (ordsucc k)) 0.
          rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg (ordsucc k) (nat_ordsucc k (omega_nat_p k Hk)).
          rewrite tuple_2_0_eq.
          prove w' :e L_ (ordsucc k) :\/: SNo_sqrtauxset (L_ (ordsucc k)) (R_ (ordsucc k)) x.
          apply binunionI2.
          prove w' :e SNo_sqrtauxset (L_ (ordsucc k)) (R_ (ordsucc k)) x.
          prove (x + w * z) :/: (w + z) :e SNo_sqrtauxset (L_ (ordsucc k)) (R_ (ordsucc k)) x.
          claim LwLk: w :e L_ (ordsucc k).
          { prove w :e L_ (ordsucc k).
            apply SNo_sqrtaux_mon x sqrt_SNo_nonneg k (omega_nat_p k Hk) (ordsucc k) (nat_ordsucc k (omega_nat_p k Hk)) (ordsuccI1 k).
            assume H5: forall u :e L_ k, u :e L_ (ordsucc k).
            assume _.
            apply H5.
            prove w :e L_ k.
            exact H3.
          }
          exact SNo_sqrtauxset_I (L_ (ordsucc k)) (R_ (ordsucc k)) x w LwLk z Hz Lwpzpos.
        }
        witness w'. apply andI.
        + prove w' :e L.
          exact famunionI omega L_ (ordsucc (ordsucc k)) w' (omega_ordsucc (ordsucc k) (omega_ordsucc k Hk)) Lw'.
        + prove w < w'.
          rewrite <- div_mul_SNo_invL w (w + z) Hw1 Lwpz Lwpzn0 at 1.
          prove (w * (w + z)) :/: (w + z) < w'.
          prove (w * (w + z)) * recip_SNo (w + z) < (x + w * z) * recip_SNo (w + z).
          apply pos_mul_SNo_Lt' (w * (w + z)) (x + w * z) (recip_SNo (w + z))
                                (SNo_mul_SNo w (w + z) Hw1 Lwpz)
                                (SNo_add_SNo x (w * z) Hx Lwmz)
                                (SNo_recip_SNo (w + z) Lwpz)
                                (recip_SNo_of_pos_is_pos (w + z) Lwpz Lwpzpos).
          prove w * (w + z) < x + w * z.
          rewrite mul_SNo_distrL w w z Hw1 Hw1 Hz1.
          prove w * w + w * z < x + w * z.
          apply add_SNo_Lt1 (w * w) (w * z) x Lwmw Lwmz Hx.
          prove w * w < x.
          exact Hw3.
      * { prove forall z :e R, exists z' :e R, z' < z.
          let z. assume Hz.
          apply famunionE_impred omega R_ z Hz.
          let k. assume Hk: k :e omega.
          assume H3: z :e R_ k.
          apply L1R z Hz.
          assume Hz1: SNo z.
          assume Hz2: 0 <= z.
          assume Hz3: x < z * z.
          claim Lzmz: SNo (z * z).
          { exact SNo_mul_SNo z z Hz1 Hz1. }
          claim Lzpz: SNo (z + z).
          { exact SNo_add_SNo z z Hz1 Hz1. }
          claim Lzpos: 0 < z.
          { apply SNoLeE 0 z SNo_0 Hz1 Hz2.
            - assume H4: 0 < z. exact H4.
            - assume H4: 0 = z. prove False.
              apply SNoLt_irref 0.
              prove 0 < 0.
              apply SNoLeLt_tra 0 x 0 SNo_0 Hx SNo_0 Hx2.
              prove x < 0.
              rewrite <- mul_SNo_zeroR 0 SNo_0.
              rewrite H4.
              prove x < z * z.
              exact Hz3.
          }
          claim Lzpzpos: 0 < z + z.
          { rewrite <- add_SNo_0L 0 SNo_0.
            exact add_SNo_Lt3 0 0 z z SNo_0 SNo_0 Hz1 Hz1 Lzpos Lzpos.
          }
          claim Lzpzn0: z + z <> 0.
          { assume H4: z + z = 0.
            apply SNoLt_irref 0.
            rewrite <- H4 at 2.
            exact Lzpzpos.
          }
          set z' := (x + z * z) :/: (z + z).
          claim Lz': z' :e R_ (ordsucc k).
          { prove z' :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k) 1.
            rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k (omega_nat_p k Hk).
            rewrite tuple_2_1_eq.
            prove z' :e R_ k :\/: SNo_sqrtauxset (L_ k) (L_ k) x :\/: SNo_sqrtauxset (R_ k) (R_ k) x.
            apply binunionI2.
            prove z' :e SNo_sqrtauxset (R_ k) (R_ k) x.
            apply SNo_sqrtauxset_I.
            - prove z :e R_ k. exact H3.
            - prove z :e R_ k. exact H3.
            - prove 0 < z + z. exact Lzpzpos.
          }
          witness z'. apply andI.
          - prove z' :e R.
            exact famunionI omega R_ (ordsucc k) z' (omega_ordsucc k Hk) Lz'.
          - prove z' < z.
            rewrite <- div_mul_SNo_invL z (z + z) Hz1 Lzpz Lzpzn0 at 5.
            prove z' < (z * (z + z)) :/: (z + z).
            prove (x + z * z) * recip_SNo (z + z) < (z * (z + z)) * recip_SNo (z + z).
            apply pos_mul_SNo_Lt' (x + z * z) (z * (z + z)) (recip_SNo (z + z))
                                  (SNo_add_SNo x (z * z) Hx Lzmz)
                                  (SNo_mul_SNo z (z + z) Hz1 Lzpz)
                                  (SNo_recip_SNo (z + z) Lzpz)
                                  (recip_SNo_of_pos_is_pos (z + z) Lzpz Lzpzpos).
            prove x + z * z < z * (z + z).
            rewrite mul_SNo_distrL z z z Hz1 Hz1 Hz1.
            prove x + z * z < z * z + z * z.
            apply add_SNo_Lt1 x (z * z) (z * z) Hx Lzmz Lzmz.
            prove x < z * z.
            exact Hz3.
          }
    + assume H2: SNoLev x c= 1.
      claim L1_1: x = 1.
      { symmetry. apply SNo_eq 1 x SNo_1 Hx.
        - prove SNoLev 1 = SNoLev x. rewrite ordinal_SNoLev 1 ordinal_1.
          prove 1 = SNoLev x.
          apply set_ext.
          + let u. assume Hu: u :e 1.
            apply cases_1 u Hu.
            prove 0 :e SNoLev x.
            exact H1.
          + exact H2.
        - prove SNoEq_ (SNoLev 1) 1 x.
          rewrite ordinal_SNoLev 1 ordinal_1.
          prove SNoEq_ 1 1 x.
          let u. assume Hu: u :e 1.
          prove u :e 1 <-> u :e x.
          apply iffI.
          + assume _. apply cases_1 u Hu.
            prove 0 :e x. apply dneg.
            assume H3: 0 /:e x.
            apply SNoLt_irref 0.
            prove 0 < 0.
            apply SNoLeLt_tra 0 x 0 SNo_0 Hx SNo_0 Hx2.
            prove x < 0.
            apply SNoLtI3.
            * prove SNoLev 0 :e SNoLev x. rewrite SNoLev_0. exact H1.
            * prove SNoEq_ (SNoLev 0) x 0. rewrite SNoLev_0.
              let u. assume Hu: u :e 0. prove False. exact EmptyE u Hu.
            * rewrite SNoLev_0. exact H3.
          + assume _. exact Hu.
      }
      rewrite L1_1. rewrite sqrt_SNo_nonneg_1.
      prove 1 :e real. exact real_1.
  - assume H1: SNoLev x c= 0.
    claim L1_0: x = 0.
    { apply SNoLev_0_eq_0 x Hx. prove SNoLev x = 0. apply Empty_Subq_eq. exact H1. }
    rewrite L1_0. rewrite sqrt_SNo_nonneg_0.
    prove 0 :e real. exact real_0.
}
let x. assume Hx.
apply SNoS_E2 omega omega_ordinal x Hx.
assume Hx1: SNoLev x :e omega.
assume Hx2: ordinal (SNoLev x).
assume Hx3: SNo x.
assume Hx4: SNo_ (SNoLev x) x.
exact L1 x Hx3 Hx1.
Qed.

Theorem sqrt_SNo_nonneg_real: forall x :e real, 0 <= x -> sqrt_SNo_nonneg x :e real.
let x. assume Hx Hxnn.
apply real_E x Hx.
assume Hx1: SNo x.
assume Hx2: SNoLev x :e ordsucc omega.
assume Hx3: x :e SNoS_ (ordsucc omega).
assume Hx4: - omega < x.
assume Hx5: x < omega.
assume Hx6: forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x.
assume Hx7: forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.
apply sqrt_SNo_nonneg_prop1 x Hx1 Hxnn. assume H. apply H.
assume H1: SNo (sqrt_SNo_nonneg x).
assume H2: 0 <= sqrt_SNo_nonneg x.
assume H3: sqrt_SNo_nonneg x * sqrt_SNo_nonneg x = x.
apply ordsuccE omega (SNoLev x) Hx2.
- assume H4: SNoLev x :e omega.
  prove sqrt_SNo_nonneg x :e real.
  apply sqrt_SNo_nonneg_SNoS_omega.
  + prove x :e SNoS_ omega.
    apply SNoS_I omega omega_ordinal x (SNoLev x) H4.
    prove SNo_ (SNoLev x) x.
    apply SNoLev_. exact Hx1.
  + prove 0 <= x. exact Hxnn.
- assume H4: SNoLev x = omega.
  prove sqrt_SNo_nonneg x :e real.
  rewrite sqrt_SNo_nonneg_eq x Hx1.
  set L_ := fun k:set => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
  set R_ := fun k:set => SNo_sqrtaux x sqrt_SNo_nonneg k 1.
  set L := \/_ k :e omega, L_ k.
  set R := \/_ k :e omega, R_ k.
  prove SNoCut L R :e real.
  claim LLI: forall k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0 c= L.
  { let k. assume Hk.
    let w. assume Hw.
    prove w :e \/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0.
    exact famunionI omega (fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 0) k w Hk Hw.
  }
  claim LRI: forall k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1 c= R.
  { let k. assume Hk.
    let z. assume Hz.
    prove z :e \/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1.
    exact famunionI omega (fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 1) k z Hk Hz.
  }
  claim LLE: forall w :e L, forall p:prop, (forall k :e omega, w :e SNo_sqrtaux x sqrt_SNo_nonneg k 0 -> p) -> p.
  { let w. assume Hw: w :e L.
    let p. assume Hp.
    apply famunionE_impred omega (fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 0) w Hw.
    let k. assume Hk: k :e omega.
    assume Hwk: w :e SNo_sqrtaux x sqrt_SNo_nonneg k 0.
    exact Hp k Hk Hwk.
  }
  claim LRE: forall z :e R, forall p:prop, (forall k :e omega, z :e SNo_sqrtaux x sqrt_SNo_nonneg k 1 -> p) -> p.
  { let z. assume Hz: z :e R.
    let p. assume Hp.
    apply famunionE_impred omega (fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 1) z Hz.
    let k. assume Hk: k :e omega.
    assume Hzk: z :e SNo_sqrtaux x sqrt_SNo_nonneg k 1.
    exact Hp k Hk Hzk.
  }
  claim L_L_Subq: forall k, nat_p k -> L_ k c= L_ (ordsucc k).
  { let k. assume Hk.
    let w. assume Hw: w :e L_ k.
    prove w :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k) 0.
    rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k Hk.
    rewrite tuple_2_0_eq.
    apply binunionI1. exact Hw.
  }
  claim L_R_Subq: forall k, nat_p k -> R_ k c= R_ (ordsucc k).
  { let k. assume Hk.
    let w. assume Hw: w :e R_ k.
    prove w :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k) 1.
    rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k Hk.
    rewrite tuple_2_1_eq.
    apply binunionI1. apply binunionI1.
    exact Hw.
  }
  claim L_L_R_Subq: forall k, nat_p k -> forall k' :e k, L_ k' c= L_ k /\ R_ k' c= R_ k.
  { prove forall k, nat_p k ->
          forall k' :e k,
               SNo_sqrtaux x sqrt_SNo_nonneg k' 0 c= SNo_sqrtaux x sqrt_SNo_nonneg k 0
            /\ SNo_sqrtaux x sqrt_SNo_nonneg k' 1 c= SNo_sqrtaux x sqrt_SNo_nonneg k 1.
    apply nat_ind.
    - let k'. assume Hk': k' :e 0. prove False. exact EmptyE k' Hk'.
    - let k. assume Hk.
      assume IHk: forall k' :e k, L_ k' c= L_ k /\ R_ k' c= R_ k.
      let k'. assume Hk': k' :e ordsucc k.
      apply ordsuccE k k' Hk'.
      + assume Hk'2: k' :e k. apply IHk k' Hk'2.
        assume IHkL IHkR.
	apply andI.
	* prove L_ k' c= L_ (ordsucc k).
	  apply Subq_tra (L_ k') (L_ k) (L_ (ordsucc k)) IHkL.
	  prove L_ k c= L_ (ordsucc k).
	  exact L_L_Subq k Hk.
	* prove R_ k' c= R_ (ordsucc k).
	  apply Subq_tra (R_ k') (R_ k) (R_ (ordsucc k)) IHkR.
	  prove R_ k c= R_ (ordsucc k).
          exact L_R_Subq k Hk.
      + assume Hk'2: k' = k. rewrite Hk'2. apply andI.
        * prove L_ k c= L_ (ordsucc k).
          exact L_L_Subq k Hk.
        * prove R_ k c= R_ (ordsucc k).
          exact L_R_Subq k Hk.
  }
  claim L_L_R_real: forall k, nat_p k -> L_ k c= {w :e real|0 <= w} /\ R_ k c= {w :e real|0 <= w}.
  { prove forall k, nat_p k ->
               SNo_sqrtaux x sqrt_SNo_nonneg k 0 c= {w :e real|0 <= w}
            /\ SNo_sqrtaux x sqrt_SNo_nonneg k 1 c= {w :e real|0 <= w}.
    apply nat_ind.
    - rewrite SNo_sqrtaux_0. rewrite tuple_2_0_eq. rewrite tuple_2_1_eq.
      apply andI.
      + prove {sqrt_SNo_nonneg w|w :e SNoL_nonneg x} c= {w :e real|0 <= w}.
        let w'. assume Hw'.
        apply ReplE_impred (SNoL_nonneg x) sqrt_SNo_nonneg w' Hw'.
        let w. assume Hw: w :e SNoL_nonneg x.
        assume Hw'w: w' = sqrt_SNo_nonneg w.
        rewrite Hw'w.
        prove sqrt_SNo_nonneg w :e {w :e real|0 <= w}.
        apply SepE (SNoL x) (fun w => 0 <= w) w Hw.
        assume Hw1: w :e SNoL x.
        assume Hwnneg: 0 <= w.
	apply SNoL_E x Hx1 w Hw1.
        assume Hw1a Hw1b Hw1c.
	apply SepI.
	* { apply sqrt_SNo_nonneg_SNoS_omega.
	    - prove w :e SNoS_ omega.
	      apply SNoS_I omega omega_ordinal w (SNoLev w).
	      + prove SNoLev w :e omega.
	        rewrite <- H4. exact Hw1b.
	      + prove SNo_ (SNoLev w) w.
	        apply SNoLev_. exact Hw1a.
	    - prove 0 <= w. exact Hwnneg.
	  }
	* prove 0 <= sqrt_SNo_nonneg w.
	  exact sqrt_SNo_nonneg_nonneg w Hw1a Hwnneg.
      + prove {sqrt_SNo_nonneg z|z :e SNoR x} c= {w :e real|0 <= w}.
        let z'. assume Hz'.
        apply ReplE_impred (SNoR x) sqrt_SNo_nonneg z' Hz'.
        let z. assume Hz: z :e SNoR x.
        assume Hz'z: z' = sqrt_SNo_nonneg z.
        rewrite Hz'z.
        prove sqrt_SNo_nonneg z :e {z :e real|0 <= z}.
	apply SNoR_E x Hx1 z Hz.
        assume Hz1 Hz2 Hz3.
	apply SepI.
	* { apply sqrt_SNo_nonneg_SNoS_omega.
	    - prove z :e SNoS_ omega.
	      apply SNoS_I omega omega_ordinal z (SNoLev z).
	      + prove SNoLev z :e omega.
	        rewrite <- H4. exact Hz2.
	      + prove SNo_ (SNoLev z) z.
	        apply SNoLev_. exact Hz1.
	    - prove 0 <= z. apply SNoLtLe.
	      prove 0 < z.
	      exact SNoLeLt_tra 0 x z SNo_0 Hx1 Hz1 Hxnn Hz3.
	  }
	* prove 0 <= sqrt_SNo_nonneg z.
	  apply sqrt_SNo_nonneg_nonneg z Hz1.
	  prove 0 <= z.
	  apply SNoLtLe.
	  prove 0 < z.
	  exact SNoLeLt_tra 0 x z SNo_0 Hx1 Hz1 Hxnn Hz3.
    - let k. assume Hk.
      assume IHk. apply IHk.
      assume IHk0: SNo_sqrtaux x sqrt_SNo_nonneg k 0 c= {w :e real|0 <= w}.
      assume IHk1: SNo_sqrtaux x sqrt_SNo_nonneg k 1 c= {w :e real|0 <= w}.
      rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k Hk.
      rewrite tuple_2_0_eq. rewrite tuple_2_1_eq.
      apply andI.
      + prove SNo_sqrtaux x sqrt_SNo_nonneg k 0 :\/: SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 0) (SNo_sqrtaux x sqrt_SNo_nonneg k 1) x c= {w :e real|0 <= w}.
        apply binunion_Subq_min.
        * exact IHk0.
        * { prove SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 0) (SNo_sqrtaux x sqrt_SNo_nonneg k 1) x c= {w :e real|0 <= w}.
            apply SNo_sqrtauxset_real_nonneg.
            - exact IHk0.
	    - exact IHk1.
            - exact Hx.
	    - exact Hxnn.
          }
      + prove SNo_sqrtaux x sqrt_SNo_nonneg k 1 :\/: SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 0) (SNo_sqrtaux x sqrt_SNo_nonneg k 0) x :\/: SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 1) (SNo_sqrtaux x sqrt_SNo_nonneg k 1) x c= {w :e real|0 <= w}.
        apply binunion_Subq_min.
        * { apply binunion_Subq_min.
            - exact IHk1.
            - prove SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 0) (SNo_sqrtaux x sqrt_SNo_nonneg k 0) x c= {w :e real|0 <= w}.
              apply SNo_sqrtauxset_real_nonneg.
              + exact IHk0.
              + exact IHk0.
              + exact Hx.
	      + exact Hxnn.
          }
        * { prove SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 1) (SNo_sqrtaux x sqrt_SNo_nonneg k 1) x c= {w :e real|0 <= w}.
            apply SNo_sqrtauxset_real_nonneg.
            - exact IHk1.
            - exact IHk1.
            - exact Hx.
	    - exact Hxnn.
          }
  }
  claim LLsR: L c= real.
  { let w. assume Hw. apply LLE w Hw.
    let k. assume Hk: k :e omega.
    assume Hwk: w :e L_ k.
    apply L_L_R_real k (omega_nat_p k Hk).
    assume H _.
    exact SepE1 real (fun w => 0 <= w) w (H w Hwk).
  }
  claim LRsR: R c= real.
  { let z. assume Hz. apply LRE z Hz.
    let k. assume Hk: k :e omega.
    assume Hzk: z :e R_ k.
    apply L_L_R_real k (omega_nat_p k Hk).
    assume _ H.
    exact SepE1 real (fun w => 0 <= w) z (H z Hzk).
  }
  claim LLR: SNoCutP L R.
  { exact SNo_sqrt_SNo_SNoCutP x Hx1 Hxnn. }
  apply SNoCutP_SNoCut_impred L R LLR.
  rewrite <- sqrt_SNo_nonneg_eq x Hx1.
  assume HLR1 HLR2.
  assume HLR3: forall w :e L, w < sqrt_SNo_nonneg x.
  assume HLR4: forall z :e R, sqrt_SNo_nonneg x < z.
  assume HLR5.
  claim L0Lx: 0 :e SNoLev x.
  { rewrite H4. exact nat_p_omega 0 nat_0. }
  claim L1Lx: 1 :e SNoLev x.
  { rewrite H4. exact nat_p_omega 1 nat_1. }
  claim LLne: L <> 0.
  { exact sqrt_SNo_nonneg_Lnonempty x Hx1 Hxnn L0Lx. }
  claim LRne: R <> 0.
  { exact sqrt_SNo_nonneg_Rnonempty x Hx1 Hxnn L1Lx. }
  prove SNoCut L R :e real.
  claim LRE': forall z :e R, SNo z /\ 0 < z.
  { let z. assume Hz.
    claim LzS: SNo z.
    { exact real_SNo z (LRsR z Hz). }
    apply andI.
    - exact LzS.
    - apply SNoLeLt_tra 0 (sqrt_SNo_nonneg x) z SNo_0 H1 LzS.
      + prove 0 <= sqrt_SNo_nonneg x.
        exact H2.
      + prove sqrt_SNo_nonneg x < z.
        exact HLR4 z Hz.
  }
  claim LLnomax: forall w :e L, exists w' :e L, w < w'.
  { let w. assume Hw. apply LLE w Hw.
    let k. assume Hk.
    assume Hwk: w :e L_ k.
    apply L_L_R_real k (omega_nat_p k Hk).
    assume H _.
    apply SepE real (fun w => 0 <= w) w (H w Hwk).
    assume HwR: w :e real.
    assume Hwnn: 0 <= w.
    claim Lw: SNo w.
    { exact real_SNo w HwR. }
    apply xm (exists z, z :e R).
    - assume H5. apply H5.
      let z. assume Hz: z :e R.
      apply LRE z Hz.
      let k'. assume Hk'.
      assume Hzk': z :e R_ k'.
      apply LRE' z Hz.
      assume HzS: SNo z.
      assume Hzpos: 0 < z.
      apply L_L_R_real k' (omega_nat_p k' Hk').
      assume _ H.
      claim LzR: z :e real.
      { exact SepE1 real (fun w => 0 <= w) z (H z Hzk'). }
      claim Lz: SNo z.
      { exact real_SNo z LzR. }
      claim Lzpos: 0 < z.
      { apply SNoLeLt_tra 0 (sqrt_SNo_nonneg x) z SNo_0 H1 Lz.
        - prove 0 <= sqrt_SNo_nonneg x.
          exact H2.
        - prove sqrt_SNo_nonneg x < z.
          exact HLR4 z Hz.
      }
      claim Lwz: SNo (w + z).
      { exact SNo_add_SNo w z Lw Lz. }
      claim Lwmz: SNo (w * z).
      { exact SNo_mul_SNo w z Lw Lz. }
      claim Lwzpos: 0 < w + z.
      { rewrite <- add_SNo_0R 0 SNo_0.
        apply add_SNo_Lt3b 0 0 w z SNo_0 SNo_0 Lw Lz Hwnn.
	prove 0 < z.
	exact Lzpos.
      }
      set w' := (x + w * z) :/: (w + z).
      witness w'. apply andI.
      + prove w' :e L.
        claim Lwzk'': exists k'' :e omega, w :e L_ k'' /\ z :e R_ k''.
	{ apply ordinal_trichotomy_or_impred k k' (nat_p_ordinal k (omega_nat_p k Hk)) (nat_p_ordinal k' (omega_nat_p k' Hk')).
	  - assume H6: k :e k'. witness k'. apply andI.
	    + exact Hk'.
	    + apply andI.
	      * prove w :e L_ k'.
	        apply L_L_R_Subq k' (omega_nat_p k' Hk') k H6.
		assume H _. exact H w Hwk.
	      * exact Hzk'.
	  - assume H6: k = k'. witness k. apply andI.
	    + exact Hk.
	    + apply andI.
	      * exact Hwk.
	      * prove z :e R_ k. rewrite H6. exact Hzk'.
	  - assume H6: k' :e k. witness k. apply andI.
	    + exact Hk.
	    + apply andI.
	      * exact Hwk.
	      * prove z :e R_ k.
	        apply L_L_R_Subq k (omega_nat_p k Hk) k' H6.
		assume _ H. exact H z Hzk'.
	}
	apply Lwzk''.
	let k''. assume H. apply H.
	assume Hk'': k'' :e omega. assume H. apply H.
	assume Hwk'': w :e L_ k''.
	assume Hzk'': z :e R_ k''.
	claim Lw'LSk'': w' :e L_ (ordsucc k'').
	{ prove w' :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k'') 0.
	  rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k'' (omega_nat_p k'' Hk'').
	  rewrite tuple_2_0_eq.
	  apply binunionI2.
	  prove w' :e SNo_sqrtauxset (L_ k'') (R_ k'') x.
	  apply SNo_sqrtauxset_I.
	  - exact Hwk''.
	  - exact Hzk''.
	  - prove 0 < w + z. exact Lwzpos.
	}
	exact famunionI omega L_ (ordsucc k'') w' (omega_ordsucc k'' Hk'') Lw'LSk''.
      + prove w < w'.
        prove w < (x + w * z) :/: (w + z).
	apply div_SNo_pos_LtR (x + w * z) (w + z) w (SNo_add_SNo x (w * z) Hx1 Lwmz) Lwz Lw Lwzpos.
	prove w * (w + z) < x + w * z.
	rewrite mul_SNo_distrL w w z Lw Lw HzS.
	prove w * w + w * z < x + w * z.
	apply add_SNo_Lt1 (w * w) (w * z) x (SNo_mul_SNo w w Lw Lw) (SNo_mul_SNo w z Lw HzS) Hx1.
	prove w * w < x.
	rewrite <- H3.
	prove w * w < sqrt_SNo_nonneg x * sqrt_SNo_nonneg x.
        claim Lwsx: w < sqrt_SNo_nonneg x.
        { exact HLR3 w Hw. }
	apply SNoLeE 0 w SNo_0 Lw Hwnn.
	* assume H6: 0 < w.
	  exact pos_mul_SNo_Lt2 w w (sqrt_SNo_nonneg x) (sqrt_SNo_nonneg x)
	                        Lw Lw H1 H1 H6 H6
				Lwsx Lwsx.
	* { assume H6: 0 = w. rewrite <- H6.
	    rewrite mul_SNo_zeroR 0 SNo_0.
	    prove 0 < sqrt_SNo_nonneg x * sqrt_SNo_nonneg x.
	    claim Lsxpos: 0 < sqrt_SNo_nonneg x.
	    { rewrite H6. exact Lwsx. }
	    exact mul_SNo_pos_pos (sqrt_SNo_nonneg x) (sqrt_SNo_nonneg x)
	                          H1 H1 Lsxpos Lsxpos.
          }
    - assume H5: ~exists z, z :e R.
      apply LRne.
      apply Empty_eq.
      let z. assume Hz. apply H5. witness z. exact Hz.
  }
  claim LRnomin: forall z :e R, exists z' :e R, z' < z.
  { let z. assume Hz. apply LRE z Hz.
    let k. assume Hk.
    assume Hzk: z :e R_ k.
    apply LRE' z Hz.
    assume HzS: SNo z.
    assume Hzpos: 0 < z.
    claim Lzz: SNo (z + z).
    { exact SNo_add_SNo z z HzS HzS. }
    claim Lzzpos: 0 < z + z.
    { rewrite <- add_SNo_0R 0 SNo_0.
      prove 0 + 0 < z + z.
      exact add_SNo_Lt3 0 0 z z SNo_0 SNo_0 HzS HzS Hzpos Hzpos.
    }
    claim Lzzn0: z + z <> 0.
    { assume H5. apply SNoLt_irref 0. rewrite <- H5 at 2. exact Lzzpos. }
    claim Lzmz: SNo (z * z).
    { exact SNo_mul_SNo z z HzS HzS. }
    set z' := (x + z * z) :/: (z + z).
    claim Lz': z' :e R_ (ordsucc k).
    { prove z' :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k) 1.
      rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k (omega_nat_p k Hk).
      rewrite tuple_2_1_eq.
      apply binunionI2.
      prove (x + z * z) :/: (z + z) :e SNo_sqrtauxset (SNo_sqrtaux x sqrt_SNo_nonneg k 1) (SNo_sqrtaux x sqrt_SNo_nonneg k 1) x.
      apply SNo_sqrtauxset_I.
      - prove z :e R_ k. exact Hzk.
      - prove z :e R_ k. exact Hzk.
      - prove 0 < z + z. exact Lzzpos.
    }
    claim Lz'R: z' :e R.
    { exact famunionI omega R_ (ordsucc k) z' (omega_ordsucc k Hk) Lz'. }
    claim Lz'S: SNo z'.
    { exact real_SNo z' (LRsR z' Lz'R). }
    witness z'. apply andI.
    - prove z' :e R. exact Lz'R.
    - prove z' < z.
      prove (x + z * z) :/: (z + z) < z.
      apply div_SNo_pos_LtL (x + z * z) (z + z) z (SNo_add_SNo x (z * z) Hx1 Lzmz) Lzz HzS Lzzpos.
      prove x + z * z < z * (z + z).
      rewrite mul_SNo_distrL z z z HzS HzS HzS.
      prove x + z * z < z * z + z * z.
      apply add_SNo_Lt1 x (z * z) (z * z) Hx1 Lzmz Lzmz.
      prove x < z * z.
      rewrite <- H3.
      prove sqrt_SNo_nonneg x * sqrt_SNo_nonneg x < z * z.
      apply SNoLeE 0 (sqrt_SNo_nonneg x) SNo_0 H1 H2.
      + assume Hsxpos: 0 < sqrt_SNo_nonneg x.
        exact pos_mul_SNo_Lt2 (sqrt_SNo_nonneg x) (sqrt_SNo_nonneg x) z z H1 H1 HzS HzS Hsxpos Hsxpos (HLR4 z Hz) (HLR4 z Hz).
      + assume Hsx0: 0 = sqrt_SNo_nonneg x.
        rewrite <- Hsx0.
	rewrite mul_SNo_zeroR 0 SNo_0.
	prove 0 < z * z.
	exact mul_SNo_pos_pos z z HzS HzS Hzpos Hzpos.
  }
  exact real_SNoCut L LLsR R LRsR LLR LLne LRne LLnomax LRnomin.
Qed.

Theorem real_Archimedean: forall x y :e real, 0 < x -> 0 <= y -> exists n :e omega, y <= n * x.
let x. assume Hx. let y. assume Hy. assume Hxpos Hynneg.
apply real_E x Hx.
assume Hx1 Hx2 Hx3 Hx4 Hx5.
assume Hx6: forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x.
assume Hx7.
claim L1: exists n :e omega, eps_ n <= x.
{ apply dneg.
  assume HC: ~(exists n :e omega, eps_ n <= x).
  claim L1a: 0 = x.
  { apply Hx6 0 (omega_SNoS_omega 0 (nat_p_omega 0 nat_0)).
    let k. assume Hk: k :e omega.
    prove abs_SNo (0 + - x) < eps_ k.
    rewrite add_SNo_0L (- x) (SNo_minus_SNo x Hx1).
    prove abs_SNo (- x) < eps_ k.
    rewrite abs_SNo_minus x Hx1.
    prove abs_SNo x < eps_ k.
    rewrite pos_abs_SNo x Hxpos.
    prove x < eps_ k.
    apply SNoLtLe_or x (eps_ k) Hx1 (SNo_eps_ k Hk).
    - assume H1. exact H1.
    - assume H1: eps_ k <= x. prove False. apply HC.
      witness k. apply andI.
      + exact Hk.
      + exact H1.
  }
  apply SNoLt_irref x. rewrite <- L1a at 1. exact Hxpos.
}
apply L1.
let n. assume Hn. apply Hn.
assume Hn1: n :e omega.
assume Hn2: eps_ n <= x.
claim L2n: nat_p (2 ^ n).
{ apply nat_exp_SNo_nat.
  - exact nat_2.
  - exact omega_nat_p n Hn1.
}
claim L2nb: SNo (2 ^ n).
{ exact SNo_exp_SNo_nat 2 SNo_2 n (omega_nat_p n Hn1). }
claim L2nc: 0 <= 2 ^ n.
{ apply ordinal_SNoLev_max_2.
  - prove ordinal (2 ^ n). apply nat_p_ordinal. exact L2n.
  - exact SNo_0.
  - prove SNoLev 0 :e ordsucc (2 ^ n). rewrite SNoLev_0.
    prove 0 :e ordsucc (2 ^ n). apply nat_0_in_ordsucc.
    exact L2n.
}
claim L2: 1 <= 2 ^ n * x.
{ rewrite <- mul_SNo_eps_power_2' n (omega_nat_p n Hn1) at 1.
  prove 2 ^ n * eps_ n <= 2 ^ n * x.
  apply nonneg_mul_SNo_Le (2 ^ n) (eps_ n) x L2nb L2nc (SNo_eps_ n Hn1) Hx1.
  prove eps_ n <= x. exact Hn2.
}
apply real_E y Hy.
assume Hy1 Hy2.
assume Hy3: y :e SNoS_ (ordsucc omega).
assume Hy4.
assume Hy5: y < omega.
assume Hy6 Hy7.
apply SNoS_ordsucc_omega_bdd_above y Hy3 Hy5.
let N. assume HN. apply HN.
assume HN1: N :e omega.
assume HN2: y < N.
witness (N * 2 ^ n). apply andI.
- prove N * 2 ^ n :e omega.
  prove N * 2 ^ n :e omega.
  rewrite <- mul_nat_mul_SNo N HN1 (2 ^ n) (nat_p_omega (2 ^ n) L2n).
  prove mul_nat N (2 ^ n) :e omega.
  apply nat_p_omega.
  apply mul_nat_p.
  + exact omega_nat_p N HN1.
  + exact L2n.
- prove y <= (N * 2 ^ n) * x.
  claim LN1: SNo N.
  { exact omega_SNo N HN1. }
  claim LN2n: SNo (N * 2 ^ n).
  { apply SNo_mul_SNo.
    - exact LN1.
    - exact L2nb.
  }
  apply SNoLe_tra y N ((N * 2 ^ n) * x) Hy1 LN1 (SNo_mul_SNo (N * 2 ^ n) x LN2n Hx1).
  + prove y <= N. apply SNoLtLe. exact HN2.
  + prove N <= (N * 2 ^ n) * x.
    rewrite <- mul_SNo_oneR N LN1 at 1.
    prove N * 1 <= (N * 2 ^ n) * x.
    rewrite <- mul_SNo_assoc N (2 ^ n) x LN1 L2nb Hx1.
    prove N * 1 <= N * (2 ^ n * x).
    claim LN2: 0 <= N.
    { apply ordinal_SNoLev_max_2.
      - prove ordinal N. apply nat_p_ordinal. exact omega_nat_p N HN1.
      - exact SNo_0.
      - prove SNoLev 0 :e ordsucc N. rewrite SNoLev_0.
        prove 0 :e ordsucc N. apply nat_0_in_ordsucc. exact omega_nat_p N HN1.
    }
    apply nonneg_mul_SNo_Le N 1 (2 ^ n * x) LN1 LN2 SNo_1.
    * prove SNo (2 ^ n * x).
      exact SNo_mul_SNo (2 ^ n) x L2nb Hx1.
    * prove 1 <= 2 ^ n * x. exact L2.
Qed.

Theorem real_complete1: forall a b :e real :^: omega,
    (forall n :e omega, a n <= b n /\ a n <= a (ordsucc n) /\ b (ordsucc n) <= b n)
 -> exists x :e real, forall n :e omega, a n <= x /\ x <= b n.
let a. assume Ha. let b. assume Hb H1.
apply dneg.
assume HC: ~(exists x :e real, forall n :e omega, a n <= x /\ x <= b n).
prove False.
claim La1: forall n :e omega, SNo (a n).
{ let n. assume Hn.
  apply real_E (a n) (ap_Pi omega (fun _ => real) a n Ha Hn).
  assume H _ _ _ _ _ _. exact H.
}
claim Lb1: forall n :e omega, SNo (b n).
{ let n. assume Hn.
  apply real_E (b n) (ap_Pi omega (fun _ => real) b n Hb Hn).
  assume H _ _ _ _ _ _. exact H.
}
claim La2: forall n, nat_p n -> forall m :e n, a m <= a n.
{ apply nat_ind.
  - let m. assume Hm: m :e 0. prove False. exact EmptyE m Hm.
  - let n. assume Hn.
    assume IHn: forall m :e n, a m <= a n.
    let m. assume Hm: m :e ordsucc n.
    prove a m <= a (ordsucc n).
    claim Ln: n :e omega.
    { exact nat_p_omega n Hn. }
    claim LSn: ordsucc n :e omega.
    { exact omega_ordsucc n Ln. }
    claim Lm: m :e omega.
    { exact omega_TransSet (ordsucc n) LSn m Hm. }
    claim LanSn: a n <= a (ordsucc n).
    { apply H1 n Ln. assume H _. apply H. assume _ H. exact H. }
    apply ordsuccE n m Hm.
    + assume H2: m :e n.
      apply SNoLe_tra (a m) (a n) (a (ordsucc n)) (La1 m Lm) (La1 n Ln) (La1 (ordsucc n) LSn).
      * prove a m <= a n. exact IHn m H2.
      * exact LanSn.
    + assume H2: m = n. rewrite H2. exact LanSn.
}
claim Lb2: forall n, nat_p n -> forall m :e n, b n <= b m.
{ apply nat_ind.
  - let m. assume Hm: m :e 0. prove False. exact EmptyE m Hm.
  - let n. assume Hn.
    assume IHn: forall m :e n, b n <= b m.
    let m. assume Hm: m :e ordsucc n.
    prove b (ordsucc n) <= b m.
    claim Ln: n :e omega.
    { exact nat_p_omega n Hn. }
    claim LSn: ordsucc n :e omega.
    { exact omega_ordsucc n Ln. }
    claim Lm: m :e omega.
    { exact omega_TransSet (ordsucc n) LSn m Hm. }
    claim LbSnn: b (ordsucc n) <= b n.
    { apply H1 n Ln. assume _ H. exact H. }
    apply ordsuccE n m Hm.
    + assume H2: m :e n.
      apply SNoLe_tra (b (ordsucc n)) (b n) (b m) (Lb1 (ordsucc n) LSn) (Lb1 n Ln) (Lb1 m Lm).
      * exact LbSnn.
      * prove b n <= b m. exact IHn m H2.
    + assume H2: m = n. rewrite H2. exact LbSnn.
}
claim Lab: forall n m :e omega, a n <= b m.
{ let n. assume Hn. let m. assume Hm.
  claim Ln: nat_p n.
  { exact omega_nat_p n Hn. }
  claim Lm: nat_p m.
  { exact omega_nat_p m Hm. }
  claim Labn: a n <= b n.
  { apply H1 n Hn. assume H _. apply H. assume H _. exact H. }
  apply ordinal_trichotomy_or_impred n m (nat_p_ordinal n Ln) (nat_p_ordinal m Lm).
  - assume H2: n :e m.
    prove a n <= b m.
    apply SNoLe_tra (a n) (a m) (b m) (La1 n Hn) (La1 m Hm) (Lb1 m Hm).
    + prove a n <= a m. exact La2 m Lm n H2.
    + prove a m <= b m. apply H1 m Hm. assume H _. apply H. assume H _. exact H.
  - assume H2: n = m. rewrite <- H2.
    prove a n <= b n.
    exact Labn.
  - assume H2: m :e n.
    prove a n <= b m.
    apply SNoLe_tra (a n) (b n) (b m) (La1 n Hn) (Lb1 n Hn) (Lb1 m Hm).
    + prove a n <= b n.
      exact Labn.
    + prove b n <= b m. exact Lb2 n Ln m H2.
}
set L := {q :e SNoS_ omega|exists n :e omega, q < a n}.
set R := {q :e SNoS_ omega|exists n :e omega, b n < q}.
set x := SNoCut L R.
claim LL: L c= SNoS_ omega.
{ exact Sep_Subq (SNoS_ omega) (fun q => exists n :e omega, q < a n). }
claim LR: R c= SNoS_ omega.
{ exact Sep_Subq (SNoS_ omega) (fun q => exists n :e omega, b n < q). }
claim LLR: SNoCutP L R.
{ prove (forall w :e L, SNo w)
     /\ (forall y :e R, SNo y)
     /\ (forall w :e L, forall y :e R, w < y).
  apply and3I.
  - let w. assume Hw: w :e L.
    apply SepE (SNoS_ omega) (fun q => exists m :e omega, q < a m) w Hw.
    assume H2: w :e SNoS_ omega.
    assume H3. apply H3.
    let n. assume H3. apply H3.
    assume Hn: n :e omega.
    assume H3: w < a n.
    apply SNoS_E2 omega omega_ordinal w H2.
    assume Hw1 Hw2 Hw3 Hw4.
    exact Hw3.
  - let z. assume Hz: z :e R.
    apply SepE (SNoS_ omega) (fun q => exists m :e omega, b m < q) z Hz.
    assume H2: z :e SNoS_ omega.
    assume H3. apply H3.
    let m. assume H3. apply H3.
    assume Hm: m :e omega.
    assume H3: b m < z.
    apply SNoS_E2 omega omega_ordinal z H2.
    assume Hz1 Hz2 Hz3 Hz4.
    exact Hz3.
  - let w. assume Hw: w :e L.
    let z. assume Hz: z :e R.
    apply SepE (SNoS_ omega) (fun q => exists m :e omega, q < a m) w Hw.
    assume H2: w :e SNoS_ omega.
    assume H3. apply H3.
    let n. assume H3. apply H3.
    assume Hn: n :e omega.
    assume H3: w < a n.
    apply SNoS_E2 omega omega_ordinal w H2.
    assume Hw1 Hw2 Hw3 Hw4.
    apply SepE (SNoS_ omega) (fun q => exists m :e omega, b m < q) z Hz.
    assume H4: z :e SNoS_ omega.
    assume H5. apply H5.
    let m. assume H5. apply H5.
    assume Hm: m :e omega.
    assume H5: b m < z.
    apply SNoS_E2 omega omega_ordinal z H4.
    assume Hz1 Hz2 Hz3 Hz4.
    prove w < z.
    apply SNoLt_tra w (a n) z Hw3 (La1 n Hn) Hz3 H3.
    prove a n < z.
    apply SNoLeLt_tra (a n) (b m) z (La1 n Hn) (Lb1 m Hm) Hz3.
    + prove a n <= b m. exact Lab n Hn m Hm.
    + prove b m < z. exact H5.
}
apply SNoCutP_SNoCut_impred L R LLR.
assume HLR1: SNo (SNoCut L R).
assume HLR2: SNoLev (SNoCut L R) :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume HLR3: forall w :e L, w < SNoCut L R.
assume HLR4: forall y :e R, SNoCut L R < y.
assume HLR5: forall z, SNo z -> (forall x :e L, x < z) -> (forall y :e R, z < y) -> SNoLev (SNoCut L R) c= SNoLev z /\ SNoEq_ (SNoLev (SNoCut L R)) (SNoCut L R) z.
claim Lax: forall n :e omega, a n <= x.
{ let n. assume Hn.
  apply SNo_approx_real_rep (a n) (ap_Pi omega (fun _ => real) a n Ha Hn).
  let f. assume Hf. let g. assume Hg Hf1 Hf2 Hf3 Hg1 Hg2 Hg3 Hfg Hanfg.
  rewrite Hanfg.
  prove SNoCut {f m|m :e omega} {g m|m :e omega} <= SNoCut L R.
  apply SNoCut_Le {f m|m :e omega} {g m|m :e omega} L R.
  - prove SNoCutP {f m|m :e omega} {g m|m :e omega}. exact Hfg.
  - prove SNoCutP L R. exact LLR.
  - let w. assume Hw: w :e {f m|m :e omega}. prove w < x.
    apply ReplE_impred omega (fun m => f m) w Hw.
    let m. assume Hm: m :e omega.
    assume Hwm: w = f m. rewrite Hwm.
    prove f m < x.
    apply HLR3.
    prove f m :e L.
    apply SepI.
    + prove f m :e SNoS_ omega.
      exact ap_Pi omega (fun _ => SNoS_ omega) f m Hf Hm.
    + prove exists n :e omega, f m < a n.
      witness n. apply andI.
      * exact Hn.
      * exact Hf1 m Hm.
  - let z. assume Hz: z :e R.
    rewrite <- Hanfg.
    prove a n < z.
    apply SepE (SNoS_ omega) (fun q => exists m :e omega, b m < q) z Hz.
    assume H2: z :e SNoS_ omega.
    assume H3. apply H3.
    let m. assume H3. apply H3.
    assume Hm: m :e omega.
    assume H3: b m < z.
    apply SNoS_E2 omega omega_ordinal z H2.
    assume Hz1 Hz2 Hz3 Hz4.
    apply SNoLeLt_tra (a n) (b m) z (La1 n Hn) (Lb1 m Hm) Hz3.
    + prove a n <= b m. exact Lab n Hn m Hm.
    + exact H3.
}
claim Lxb: forall n :e omega, x <= b n.
{ let n. assume Hn.
  prove x <= b n.
  apply SNo_approx_real_rep (b n) (ap_Pi omega (fun _ => real) b n Hb Hn).
  let f. assume Hf. let g. assume Hg Hf1 Hf2 Hf3 Hg1 Hg2 Hg3 Hfg Hbnfg.
  rewrite Hbnfg.
  prove SNoCut L R <= SNoCut {f m|m :e omega} {g m|m :e omega}.
  apply SNoCut_Le L R {f m|m :e omega} {g m|m :e omega}.
  - prove SNoCutP L R. exact LLR.
  - prove SNoCutP {f m|m :e omega} {g m|m :e omega}. exact Hfg.
  - let w. assume Hw: w :e L.
    rewrite <- Hbnfg.
    prove w < b n.
    apply SepE (SNoS_ omega) (fun q => exists m :e omega, q < a m) w Hw.
    assume H2: w :e SNoS_ omega.
    assume H3. apply H3.
    let m. assume H3. apply H3.
    assume Hm: m :e omega.
    assume H3: w < a m.
    apply SNoS_E2 omega omega_ordinal w H2.
    assume Hw1 Hw2 Hw3 Hw4.
    apply SNoLtLe_tra w (a m) (b n) Hw3 (La1 m Hm) (Lb1 n Hn).
    + exact H3.
    + prove a m <= b n. exact Lab m Hm n Hn.
  - let z. assume Hz: z :e {g m|m :e omega}. prove x < z.
    apply ReplE_impred omega (fun m => g m) z Hz.
    let m. assume Hm: m :e omega.
    assume Hzm: z = g m. rewrite Hzm.
    prove x < g m.
    apply HLR4.
    prove g m :e R.
    apply SepI.
    + prove g m :e SNoS_ omega.
      exact ap_Pi omega (fun _ => SNoS_ omega) g m Hg Hm.
    + prove exists n :e omega, b n < g m.
      witness n. apply andI.
      * exact Hn.
      * exact Hg2 m Hm.
}
claim Laxb: forall n :e omega, a n <= x /\ x <= b n.
{ let n. assume Hn. apply andI.
  - exact Lax n Hn.
  - exact Lxb n Hn.
}
claim L1: forall q :e SNoS_ omega, q :e L \/ q :e R.
{ let q. assume Hq. apply dneg.
  assume HCq: ~(q :e L \/ q :e R). (** Assume not. Then x is a diadic rational, and so x is a real satisfying Laxb. **)
  apply SNoS_E2 omega omega_ordinal q Hq.
  assume Hq1 Hq2 Hq3 Hq4.
  claim L1a: forall w :e L, w < q.
  { let w. assume Hw: w :e L.
    apply SepE (SNoS_ omega) (fun q => exists m :e omega, q < a m) w Hw.
    assume H2: w :e SNoS_ omega.
    assume H3. apply H3.
    let n. assume H3. apply H3.
    assume Hn: n :e omega.
    assume H3: w < a n.
    apply SNoS_E2 omega omega_ordinal w H2.
    assume Hw1 Hw2 Hw3 Hw4.
    apply SNoLtLe_or w q Hw3 Hq3.
    - assume H4: w < q. exact H4.
    - assume H4: q <= w. prove False.
      apply HCq. apply orIL.
      prove q :e L.
      apply SepI.
      + exact Hq.
      + prove exists n :e omega, q < a n.
        witness n. apply andI.
        * exact Hn.
        * prove q < a n.
          exact SNoLeLt_tra q w (a n) Hq3 Hw3 (La1 n Hn) H4 H3.
  }
  claim L1b: forall z :e R, q < z.
  { let z. assume Hz: z :e R.
    apply SepE (SNoS_ omega) (fun q => exists m :e omega, b m < q) z Hz.
    assume H2: z :e SNoS_ omega.
    assume H3. apply H3.
    let n. assume H3. apply H3.
    assume Hn: n :e omega.
    assume H3: b n < z.
    apply SNoS_E2 omega omega_ordinal z H2.
    assume Hz1 Hz2 Hz3 Hz4.
    apply SNoLtLe_or q z Hq3 Hz3.
    - assume H4: q < z. exact H4.
    - assume H4: z <= q. prove False.
      apply HCq. apply orIR.
      prove q :e R.
      apply SepI.
      + exact Hq.
      + prove exists n :e omega, b n < q.
        witness n. apply andI.
        * exact Hn.
        * prove b n < q.
          exact SNoLtLe_tra (b n) z q (Lb1 n Hn) Hz3 Hq3 H3 H4.
  }
  apply HLR5 q Hq3 L1a L1b.
  assume H2: SNoLev x c= SNoLev q. assume _.
  apply HC.
  witness x. apply andI.
  - apply SNoS_omega_real.
    prove x :e SNoS_ omega.
    apply SNoS_I omega omega_ordinal x (SNoLev x).
    + prove SNoLev x :e omega.
      apply omega_TransSet (ordsucc (SNoLev q)) (omega_ordsucc (SNoLev q) Hq1).
      prove SNoLev x :e ordsucc (SNoLev q).
      apply ordinal_In_Or_Subq (SNoLev x) (ordsucc (SNoLev q))
                               (SNoLev_ordinal x HLR1)
                               (ordinal_ordsucc (SNoLev q) Hq2).
      * assume H3. exact H3.
      * assume H3: ordsucc (SNoLev q) c= SNoLev x. prove False.
        apply In_irref (SNoLev q). apply H2. apply H3. apply ordsuccI2.
    + apply SNoLev_. exact HLR1.
  - exact Laxb.
}
apply HC.
witness x.
apply andI.
- prove x :e real. apply real_I.
  + prove x :e SNoS_ (ordsucc omega).
    apply SNoS_I (ordsucc omega) ordsucc_omega_ordinal x (SNoLev x).
    * prove SNoLev x :e ordsucc omega.
      exact SNoCutP_SNoCut_omega L LL R LR LLR.
    * apply SNoLev_. exact HLR1.
  + prove x <> omega.
    assume H2: x = omega.
    claim Lbd1: x <= b 0.
    { exact Lxb 0 (nat_p_omega 0 nat_0). }
    apply real_E (b 0) (ap_Pi omega (fun _ => real) b 0 Hb (nat_p_omega 0 nat_0)).
    assume Hb0a: SNo (b 0).
    assume _ _ _.
    assume Hb0b: b 0 < omega.
    assume _ _.
    apply SNoLt_irref x.
    prove x < x.
    apply SNoLeLt_tra x (b 0) x HLR1 Hb0a HLR1 Lbd1.
    prove b 0 < x. rewrite H2.
    prove b 0 < omega. exact Hb0b.
  + prove x <> - omega.
    assume H2: x = - omega.
    claim Lbd2: a 0 <= x.
    { exact Lax 0 (nat_p_omega 0 nat_0). }
    apply real_E (a 0) (ap_Pi omega (fun _ => real) a 0 Ha (nat_p_omega 0 nat_0)).
    assume Ha0a: SNo (a 0).
    assume _ _.
    assume Ha0b: - omega < a 0.
    assume _ _ _.
    apply SNoLt_irref x.
    prove x < x.
    apply SNoLtLe_tra x (a 0) x HLR1 Ha0a HLR1.
    * prove x < a 0. rewrite H2. exact Ha0b.
    * prove a 0 <= x. exact Lbd2.
  + prove forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x.
    let q.
    assume Hq1: q :e SNoS_ omega.
    assume Hq2: forall k :e omega, abs_SNo (q + - x) < eps_ k.
    prove False. (** ruled out already by L1 **)
    apply SNoS_E2 omega omega_ordinal q Hq1.
    assume Hq1a Hq1b Hq1c Hq1d.
    apply L1 q Hq1.
    * assume H2: q :e L.
      apply SepE (SNoS_ omega) (fun q => exists m :e omega, q < a m) q H2.
      assume _ H3. apply H3.
      let n. assume H3. apply H3.
      assume Hn: n :e omega.
      assume H3: q < a n.
      apply real_E (a n) (ap_Pi omega (fun _ => real) a n Ha Hn).
      assume _ _ _ _ _.
      assume H4: forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - a n) < eps_ k) -> q = a n.
      assume _.
      claim L2: q = a n.
      { apply H4 q Hq1.
        let k.
        assume Hk: k :e omega.
        prove abs_SNo (q + - a n) < eps_ k.
        claim L2a: 0 < a n + - q.
        { exact SNoLt_minus_pos q (a n) Hq1c (La1 n Hn) H3. }
        claim L2b: a n <= x.
        { exact Lax n Hn. }
        claim L2c: 0 < x + - q.
        { apply SNoLt_minus_pos q x Hq1c HLR1.
          prove q < x.
          exact SNoLtLe_tra q (a n) x Hq1c (La1 n Hn) HLR1 H3 L2b.
        }
        rewrite abs_SNo_dist_swap q (a n) Hq1c (La1 n Hn).
        prove abs_SNo (a n + - q) < eps_ k.
        rewrite pos_abs_SNo (a n + - q) L2a.
        prove a n + - q < eps_ k.
        apply SNoLeLt_tra (a n + - q) (x + - q) (eps_ k)
                 (SNo_add_SNo (a n) (- q) (La1 n Hn) (SNo_minus_SNo q Hq1c))
                 (SNo_add_SNo x (- q) HLR1 (SNo_minus_SNo q Hq1c))
                 (SNo_eps_ k Hk).
        - prove a n + - q <= x + - q.
          apply add_SNo_Le1 (a n) (- q) x (La1 n Hn) (SNo_minus_SNo q Hq1c) HLR1.
          prove a n <= x. exact L2b.
        - prove x + - q < eps_ k.
          rewrite <- pos_abs_SNo (x + - q) L2c.
          rewrite abs_SNo_dist_swap x q HLR1 Hq1c.
          prove abs_SNo (q + - x) < eps_ k.
          exact Hq2 k Hk.
      }
      apply SNoLt_irref q.
      rewrite L2 at 2. exact H3.
    * assume H2: q :e R.
      apply SepE (SNoS_ omega) (fun q => exists m :e omega, b m < q) q H2.
      assume _ H3. apply H3.
      let n. assume H3. apply H3.
      assume Hn: n :e omega.
      assume H3: b n < q.
      apply real_E (b n) (ap_Pi omega (fun _ => real) b n Hb Hn).
      assume _ _ _ _ _.
      assume H4: forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - b n) < eps_ k) -> q = b n.
      assume _.
      claim L3: q = b n.
      { apply H4 q Hq1.
        let k.
        assume Hk: k :e omega.
        prove abs_SNo (q + - b n) < eps_ k.
        claim L3a: 0 < q + - b n.
        { exact SNoLt_minus_pos (b n) q (Lb1 n Hn) Hq1c H3. }
        claim L3b: x <= b n.
        { exact Lxb n Hn. }
        claim L3c: 0 < q + - x.
        { apply SNoLt_minus_pos x q HLR1 Hq1c.
          prove x < q.
          exact SNoLeLt_tra x (b n) q HLR1 (Lb1 n Hn) Hq1c L3b H3.
        }
        prove abs_SNo (q + - b n) < eps_ k.
        rewrite pos_abs_SNo (q + - b n) L3a.
        prove q + - b n < eps_ k.
        apply SNoLeLt_tra (q + - b n) (q + - x) (eps_ k)
                 (SNo_add_SNo q (- b n) Hq1c (SNo_minus_SNo (b n) (Lb1 n Hn)))
                 (SNo_add_SNo q (- x) Hq1c (SNo_minus_SNo x HLR1))
                 (SNo_eps_ k Hk).
        - prove q + - b n <= q + - x.
          apply add_SNo_Le2 q (- b n) (- x) Hq1c (SNo_minus_SNo (b n) (Lb1 n Hn)) (SNo_minus_SNo x HLR1).
          prove - b n <= - x.
          exact minus_SNo_Le_contra x (b n) HLR1 (Lb1 n Hn) L3b.
        - prove q + - x < eps_ k.
          rewrite <- pos_abs_SNo (q + - x) L3c.
          prove abs_SNo (q + - x) < eps_ k.
          exact Hq2 k Hk.
      }
      apply SNoLt_irref q.
      rewrite L3 at 1. exact H3.
- exact Laxb.
Qed.

Theorem real_complete2: forall a b :e real :^: omega,
    (forall n :e omega, a n <= b n /\ a n <= a (n + 1) /\ b (n + 1) <= b n)
 -> exists x :e real, forall n :e omega, a n <= x /\ x <= b n.
let a. assume Ha. let b. assume Hb.
assume H1.
apply real_complete1 a Ha b Hb.
let n. assume Hn.
prove a n <= b n /\ a n <= a (ordsucc n) /\ b (ordsucc n) <= b n.
claim L1: ordsucc n = n + 1.
{ rewrite <- add_nat_add_SNo n Hn 1 (nat_p_omega 1 nat_1).
  prove ordsucc n = add_nat n 1.
  rewrite add_nat_SR n 0 nat_0.
  prove ordsucc n = ordsucc (add_nat n 0).
  rewrite add_nat_0R. reflexivity.
}
rewrite L1.
exact H1 n Hn.
Qed.

End Reals.

