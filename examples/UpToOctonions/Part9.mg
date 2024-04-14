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
Axiom famunion_ext: forall X, forall f g:set -> set, (forall x :e X, f x = g x) -> famunion X f = famunion X g.

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

Axiom Sep_Empty: forall P:set -> prop, {x :e Empty|P x} = Empty.

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

Axiom add_nat_com : forall n:set, nat_p n -> forall m:set, nat_p m -> n + m = m + n.

Axiom nat_Subq_add_ex: forall n, nat_p n -> forall m, nat_p m -> n c= m -> exists k, nat_p k /\ m = k + n.

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

Axiom SNoL_SNoCutP_ex: forall L R, SNoCutP L R -> forall w :e SNoL (SNoCut L R), exists w' :e L, w <= w'.
Axiom SNoR_SNoCutP_ex: forall L R, SNoCutP L R -> forall z :e SNoR (SNoCut L R), exists z' :e R, z' <= z.

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

Axiom add_SNo_minus_SNo_prop2 : forall x y, SNo x -> SNo y -> x + - x + y = y.

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

Axiom mul_SNo_nonneg_nonneg: forall x y, SNo x -> SNo y -> 0 <= x -> 0 <= y -> 0 <= x * y.
Axiom mul_SNo_nonpos_pos: forall x y, SNo x -> SNo y -> x <= 0 -> 0 < y -> x * y <= 0.
Axiom mul_SNo_nonpos_neg: forall x y, SNo x -> SNo y -> x <= 0 -> y < 0 -> 0 <= x * y.
Axiom nonpos_mul_SNo_Le : forall x y z, SNo x -> x <= 0 -> SNo y -> SNo z -> z <= y -> x * y <= x * z.

Axiom SNo_sqr_nonneg : forall x, SNo x -> 0 <= x * x.

Axiom SNo_zero_or_sqr_pos : forall x, SNo x -> x = 0 \/ 0 < x * x.

Axiom SNo_nonneg_sqr_uniq: forall x y, SNo x -> SNo y -> 0 <= x -> 0 <= y -> x * x = y * y -> x = y.

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

Axiom mul_SNo_SNoCut_SNoL_interpolate_impred : forall Lx Rx Ly Ry,
    SNoCutP Lx Rx -> SNoCutP Ly Ry
 -> forall x y, x = SNoCut Lx Rx -> y = SNoCut Ly Ry
 -> forall u :e SNoL (x * y),
    forall p:prop,
        (forall v :e Lx, forall w :e Ly, u + v * w <= v * y + x * w -> p)
     -> (forall v :e Rx, forall w :e Ry, u + v * w <= v * y + x * w -> p)
     -> p.

Axiom mul_SNo_SNoCut_SNoR_interpolate_impred : forall Lx Rx Ly Ry,
    SNoCutP Lx Rx -> SNoCutP Ly Ry
 -> forall x y, x = SNoCut Lx Rx -> y = SNoCut Ly Ry
 -> forall u :e SNoR (x * y),
    forall p:prop,
        (forall v :e Lx, forall w :e Ry, v * y + x * w <= u + v * w -> p)
     -> (forall v :e Rx, forall w :e Ly, v * y + x * w <= u + v * w -> p)
     -> p.

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

(** Part 9 **)

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

Theorem SNoL_nonneg_0: SNoL_nonneg 0 = 0.
prove {w :e SNoL 0|0 <= w} = 0.
rewrite SNoL_0.
exact Sep_Empty (fun w => 0 <= w).
Qed.

Theorem SNoL_nonneg_1: SNoL_nonneg 1 = 1.
prove {w :e SNoL 1|0 <= w} = 1.
rewrite SNoL_1.
prove {w :e 1|0 <= w} = 1.
apply set_ext.
- exact Sep_Subq 1 (fun w => 0 <= w).
- let w. assume Hw: w :e 1.
  apply cases_1 w Hw.
  prove 0 :e {w :e 1|0 <= w}.
  apply SepI.
  + exact In_0_1.
  + prove 0 <= 0. apply SNoLe_ref.
Qed.

Definition SNo_sqrtauxset : set -> set -> set -> set := fun Y Z x => \/_ y :e Y, {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}.

Theorem SNo_sqrtauxset_I : forall Y Z x,
 forall y :e Y, forall z :e Z, 0 < y + z -> (x + y * z) :/: (y + z) :e SNo_sqrtauxset Y Z x.
let Y Z x y. assume Hy. let z. assume Hz.
assume H1.
prove (x + y * z) :/: (y + z) :e \/_ y :e Y, {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}.
apply famunionI Y (fun y => {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}) y ((x + y * z) :/: (y + z)) Hy.
prove (x + y * z) :/: (y + z) :e {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}.
exact ReplSepI Z (fun z => 0 < y + z) (fun z => (x + y * z) :/: (y + z)) z Hz H1.
Qed.

Theorem SNo_sqrtauxset_E : forall Y Z x,
 forall u :e SNo_sqrtauxset Y Z x, forall p:prop,
     (forall y :e Y, forall z :e Z, 0 < y + z -> u = (x + y * z) :/: (y + z) -> p)
  -> p.
let Y Z x u. assume Hu. let p. assume H1.
apply famunionE_impred Y (fun y => {(x + y * z) :/: (y + z)|z :e Z, 0 < y + z}) u Hu.
let y. assume Hy: y :e Y. assume Hu1.
apply ReplSepE_impred Z (fun z => 0 < y + z) (fun z => (x + y * z) :/: (y + z)) u Hu1.
let z. assume Hz: z :e Z.
assume Hyz: 0 < y + z.
assume Hu2: u = (x + y * z) :/: (y + z).
exact H1 y Hy z Hz Hyz Hu2.
Qed.

Theorem SNo_sqrtauxset_0: forall Z x, SNo_sqrtauxset 0 Z x = 0.
let Z x. apply Empty_eq.
let u. assume Hu.
apply SNo_sqrtauxset_E 0 Z x u Hu.
let y. assume Hy: y :e 0.
prove False. exact EmptyE y Hy.
Qed.

Theorem SNo_sqrtauxset_0': forall Y x, SNo_sqrtauxset Y 0 x = 0.
let Y x. apply Empty_eq.
let u. assume Hu.
apply SNo_sqrtauxset_E Y 0 x u Hu.
let y. assume Hy: y :e Y.
let z. assume Hz: z :e 0.
prove False. exact EmptyE z Hz.
Qed.

Definition SNo_sqrtaux : set -> (set -> set) -> set -> set :=
 fun x g =>
  nat_primrec ({g w|w :e SNoL_nonneg x},{g z|z :e SNoR x})
   (fun k p => (p 0 :\/: SNo_sqrtauxset (p 0) (p 1) x,
                p 1 :\/: SNo_sqrtauxset (p 0) (p 0) x
                    :\/: SNo_sqrtauxset (p 1) (p 1) x)).

Theorem SNo_sqrtaux_0: forall x, forall g:set -> set, SNo_sqrtaux x g 0 = ({g w|w :e SNoL_nonneg x},{g z|z :e SNoR x}).
let x g.
exact nat_primrec_0 ({g w|w :e SNoL_nonneg x},{g z|z :e SNoR x})
   (fun k p => (p 0 :\/: SNo_sqrtauxset (p 0) (p 1) x,
                p 1 :\/: SNo_sqrtauxset (p 0) (p 0) x
                    :\/: SNo_sqrtauxset (p 1) (p 1) x)).
Qed.

Theorem SNo_sqrtaux_S: forall x, forall g:set -> set, forall n, nat_p n
 -> SNo_sqrtaux x g (ordsucc n)
  = (SNo_sqrtaux x g n 0
       :\/: SNo_sqrtauxset (SNo_sqrtaux x g n 0) (SNo_sqrtaux x g n 1) x,
     SNo_sqrtaux x g n 1
       :\/: SNo_sqrtauxset (SNo_sqrtaux x g n 0) (SNo_sqrtaux x g n 0) x
       :\/: SNo_sqrtauxset (SNo_sqrtaux x g n 1) (SNo_sqrtaux x g n 1) x).
let x g n. assume Hn.
exact nat_primrec_S ({g w|w :e SNoL_nonneg x},{g z|z :e SNoR x})
   (fun k p => (p 0 :\/: SNo_sqrtauxset (p 0) (p 1) x,
                p 1 :\/: SNo_sqrtauxset (p 0) (p 0) x
                    :\/: SNo_sqrtauxset (p 1) (p 1) x)) n Hn.
Qed.

Theorem SNo_sqrtaux_mon_lem: forall x, forall g:set -> set,
  forall m, nat_p m -> forall n, nat_p n
   -> SNo_sqrtaux x g m 0 c= SNo_sqrtaux x g (add_nat m n) 0
   /\ SNo_sqrtaux x g m 1 c= SNo_sqrtaux x g (add_nat m n) 1.
let x g m. assume Hm.
apply nat_ind.
- prove SNo_sqrtaux x g m 0 c= SNo_sqrtaux x g (add_nat m 0) 0
     /\ SNo_sqrtaux x g m 1 c= SNo_sqrtaux x g (add_nat m 0) 1.
  rewrite add_nat_0R m.
  prove SNo_sqrtaux x g m 0 c= SNo_sqrtaux x g m 0
     /\ SNo_sqrtaux x g m 1 c= SNo_sqrtaux x g m 1.
  apply andI.
  + apply Subq_ref.
  + apply Subq_ref.
- let n. assume Hn IH. apply IH.
  assume IH0: SNo_sqrtaux x g m 0 c= SNo_sqrtaux x g (add_nat m n) 0.
  assume IH1: SNo_sqrtaux x g m 1 c= SNo_sqrtaux x g (add_nat m n) 1.
  rewrite add_nat_SR m n Hn.
  prove SNo_sqrtaux x g m 0 c= SNo_sqrtaux x g (ordsucc (add_nat m n)) 0
     /\ SNo_sqrtaux x g m 1 c= SNo_sqrtaux x g (ordsucc (add_nat m n)) 1.
  rewrite SNo_sqrtaux_S x g (add_nat m n) (add_nat_p m Hm n Hn).
  rewrite tuple_2_0_eq.
  rewrite tuple_2_1_eq.
  apply andI.
  + prove SNo_sqrtaux x g m 0 c= SNo_sqrtaux x g (add_nat m n) 0 :\/: SNo_sqrtauxset (SNo_sqrtaux x g (add_nat m n) 0) (SNo_sqrtaux x g (add_nat m n) 1) x.
    apply Subq_tra (SNo_sqrtaux x g m 0)
                   (SNo_sqrtaux x g (add_nat m n) 0)
                   (SNo_sqrtaux x g (add_nat m n) 0 :\/: SNo_sqrtauxset (SNo_sqrtaux x g (add_nat m n) 0) (SNo_sqrtaux x g (add_nat m n) 1) x)
                   IH0.
    apply binunion_Subq_1.
  + prove SNo_sqrtaux x g m 1 c= SNo_sqrtaux x g (add_nat m n) 1 :\/: SNo_sqrtauxset (SNo_sqrtaux x g (add_nat m n) 0) (SNo_sqrtaux x g (add_nat m n) 0) x :\/: SNo_sqrtauxset (SNo_sqrtaux x g (add_nat m n) 1) (SNo_sqrtaux x g (add_nat m n) 1) x.
    apply Subq_tra (SNo_sqrtaux x g m 1)
                   (SNo_sqrtaux x g (add_nat m n) 1)
                   (SNo_sqrtaux x g (add_nat m n) 1 :\/: SNo_sqrtauxset (SNo_sqrtaux x g (add_nat m n) 0) (SNo_sqrtaux x g (add_nat m n) 0) x :\/: SNo_sqrtauxset (SNo_sqrtaux x g (add_nat m n) 1) (SNo_sqrtaux x g (add_nat m n) 1) x)
                   IH1.
    apply Subq_tra (SNo_sqrtaux x g (add_nat m n) 1)
                   (SNo_sqrtaux x g (add_nat m n) 1 :\/: SNo_sqrtauxset (SNo_sqrtaux x g (add_nat m n) 0) (SNo_sqrtaux x g (add_nat m n) 0) x)
                   (SNo_sqrtaux x g (add_nat m n) 1 :\/: SNo_sqrtauxset (SNo_sqrtaux x g (add_nat m n) 0) (SNo_sqrtaux x g (add_nat m n) 0) x :\/: SNo_sqrtauxset (SNo_sqrtaux x g (add_nat m n) 1) (SNo_sqrtaux x g (add_nat m n) 1) x).
    * apply binunion_Subq_1.
    * apply binunion_Subq_1.
Qed.

Theorem SNo_sqrtaux_mon: forall x, forall g:set -> set,
  forall m, nat_p m -> forall n, nat_p n -> m c= n
   -> SNo_sqrtaux x g m 0 c= SNo_sqrtaux x g n 0
   /\ SNo_sqrtaux x g m 1 c= SNo_sqrtaux x g n 1.
let x g m. assume Hm. let n. assume Hn Hmn.
apply nat_Subq_add_ex m Hm n Hn Hmn.
let k. assume H. apply H.
assume Hk: nat_p k.
rewrite add_nat_com k Hk m Hm.
assume H1: n = add_nat m k.
rewrite H1.
exact SNo_sqrtaux_mon_lem x g m Hm k Hk.
Qed.

Theorem SNo_sqrtaux_ext: forall x, SNo x -> forall g h:set -> set, (forall x' :e SNoS_ (SNoLev x), g x' = h x') -> forall k, nat_p k -> SNo_sqrtaux x g k = SNo_sqrtaux x h k.
let x. assume Hx. let g h.
assume Hgh.
apply nat_ind.
- prove SNo_sqrtaux x g 0 = SNo_sqrtaux x h 0.
  rewrite SNo_sqrtaux_0 x g.
  rewrite SNo_sqrtaux_0 x h.
  prove ({g w|w :e SNoL_nonneg x},{g z|z :e SNoR x}) = ({h w|w :e SNoL_nonneg x},{h z|z :e SNoR x}).
  claim L1: {g w|w :e SNoL_nonneg x} = {h w|w :e SNoL_nonneg x}.
  { apply ReplEq_ext (SNoL_nonneg x) g h.
    let w. assume Hw: w :e SNoL_nonneg x.
    prove g w = h w.
    apply SNoL_E x Hx w (SepE1 (SNoL x) (fun w => 0 <= w) w Hw).
    assume Hw1 Hw2 Hw3.
    apply Hgh.
    prove w :e SNoS_ (SNoLev x).
    exact SNoS_I2 w x Hw1 Hx Hw2.
  }
  claim L2: {g w|w :e SNoR x} = {h w|w :e SNoR x}.
  { apply ReplEq_ext (SNoR x) g h.
    let w. assume Hw: w :e SNoR x.
    prove g w = h w.
    apply SNoR_E x Hx w Hw.
    assume Hw1 Hw2 Hw3.
    apply Hgh.
    prove w :e SNoS_ (SNoLev x).
    exact SNoS_I2 w x Hw1 Hx Hw2.
  }
  rewrite L1. rewrite L2. reflexivity.
- let k.
  assume Hk: nat_p k.
  assume IH: SNo_sqrtaux x g k = SNo_sqrtaux x h k.
  prove SNo_sqrtaux x g (ordsucc k) = SNo_sqrtaux x h (ordsucc k).
  rewrite SNo_sqrtaux_S x g k Hk.
  rewrite SNo_sqrtaux_S x h k Hk.
  rewrite IH.
  reflexivity.
Qed.

Section sqrt_SNo_nonneg.

Let G : set -> (set -> set) -> set := fun x g => SNoCut (\/_ k :e omega, SNo_sqrtaux x g k 0) (\/_ k :e omega, SNo_sqrtaux x g k 1).

Definition sqrt_SNo_nonneg : set -> set := SNo_rec_i G.

Theorem sqrt_SNo_nonneg_eq: forall x, SNo x -> sqrt_SNo_nonneg x = G x sqrt_SNo_nonneg.
apply SNo_rec_i_eq G.
let x. assume Hx.
let g h. assume Hgh.
prove SNoCut (\/_ k :e omega, SNo_sqrtaux x g k 0) (\/_ k :e omega, SNo_sqrtaux x g k 1)
    = SNoCut (\/_ k :e omega, SNo_sqrtaux x h k 0) (\/_ k :e omega, SNo_sqrtaux x h k 1).
f_equal.
- apply famunion_ext.
  let k. assume Hk.
  prove SNo_sqrtaux x g k 0 = SNo_sqrtaux x h k 0.
  f_equal.
  apply SNo_sqrtaux_ext x Hx g h.
  + prove forall w :e SNoS_ (SNoLev x), g w = h w.
    exact Hgh.
  + exact omega_nat_p k Hk.
- apply famunion_ext.
  let k. assume Hk.
  prove SNo_sqrtaux x g k 1 = SNo_sqrtaux x h k 1.
  f_equal.
  apply SNo_sqrtaux_ext x Hx g h.
  + prove forall w :e SNoS_ (SNoLev x), g w = h w.
    exact Hgh.
  + exact omega_nat_p k Hk.
Qed.

Theorem sqrt_SNo_nonneg_prop1a: forall x, SNo x -> 0 <= x ->
    (forall w :e SNoS_ (SNoLev x), 0 <= w -> SNo (sqrt_SNo_nonneg w) /\ 0 <= sqrt_SNo_nonneg w /\ sqrt_SNo_nonneg w * sqrt_SNo_nonneg w = w)
 -> forall k, nat_p k ->
              (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 0, SNo y /\ 0 <= y /\ y * y < x)
           /\ (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 1, SNo y /\ 0 <= y /\ x < y * y).
let x. assume Hx Hxnonneg IH.
set L_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
set R_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 1.
set L := \/_ k :e omega, L_ k.
set R := \/_ k :e omega, R_ k.
apply nat_ind.
- prove (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg 0 0, SNo y /\ 0 <= y /\ y * y < x)
     /\ (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg 0 1, SNo y /\ 0 <= y /\ x < y * y).
  rewrite SNo_sqrtaux_0 x sqrt_SNo_nonneg. apply andI.
  + let y. rewrite tuple_2_0_eq.
    assume Hy: y :e {sqrt_SNo_nonneg w|w :e SNoL_nonneg x}.
    prove SNo y /\ 0 <= y /\ y * y < x.
    apply ReplE_impred (SNoL_nonneg x) sqrt_SNo_nonneg y Hy.
    let w. assume Hw: w :e SNoL_nonneg x.
    assume Hyw: y = sqrt_SNo_nonneg w.
    apply SepE (SNoL x) (fun w => 0 <= w) w Hw.
    assume Hw: w :e SNoL x.
    assume Hwnonneg: 0 <= w.
    apply SNoL_E x Hx w Hw.
    assume Hw1 Hw2 Hw3.
    claim Lw: w :e SNoS_ (SNoLev x).
    { exact SNoS_I2 w x Hw1 Hx Hw2. }
    apply IH w Lw Hwnonneg. assume H. apply H.
    assume IHa: SNo (sqrt_SNo_nonneg w).
    assume IHb: 0 <= sqrt_SNo_nonneg w.
    assume IHc: sqrt_SNo_nonneg w * sqrt_SNo_nonneg w = w.
    apply and3I.
    * rewrite Hyw. exact IHa.
    * rewrite Hyw. exact IHb.
    * rewrite Hyw.
      prove sqrt_SNo_nonneg w * sqrt_SNo_nonneg w < x.
      rewrite IHc.
      exact Hw3.
  + let y. rewrite tuple_2_1_eq.
    assume Hy: y :e {sqrt_SNo_nonneg z|z :e SNoR x}.
    prove SNo y /\ 0 <= y /\ x < y * y.
    apply ReplE_impred (SNoR x) sqrt_SNo_nonneg y Hy.
    let z. assume Hz: z :e SNoR x.
    assume Hyz: y = sqrt_SNo_nonneg z.
    apply SNoR_E x Hx z Hz.
    assume Hz1 Hz2 Hz3.
    claim Lz: z :e SNoS_ (SNoLev x).
    { exact SNoS_I2 z x Hz1 Hx Hz2. }
    claim Lznonneg: 0 <= z.
    { exact SNoLe_tra 0 x z SNo_0 Hx Hz1 Hxnonneg (SNoLtLe x z Hz3). }
    apply IH z Lz Lznonneg. assume H. apply H.
    assume IHa: SNo (sqrt_SNo_nonneg z).
    assume IHb: 0 <= sqrt_SNo_nonneg z.
    assume IHc: sqrt_SNo_nonneg z * sqrt_SNo_nonneg z = z.
    apply and3I.
    * rewrite Hyz. exact IHa.
    * rewrite Hyz. exact IHb.
    * rewrite Hyz.
      prove x < sqrt_SNo_nonneg z * sqrt_SNo_nonneg z.
      rewrite IHc.
      exact Hz3.
- let k. assume Hk: nat_p k.
  assume IHk: (forall y :e L_ k, SNo y /\ 0 <= y /\ y * y < x)
           /\ (forall y :e R_ k, SNo y /\ 0 <= y /\ x < y * y).
  apply IHk.
  assume IHk0 IHk1.
  prove (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k) 0, SNo y /\ 0 <= y /\ y * y < x)
     /\ (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k) 1, SNo y /\ 0 <= y /\ x < y * y).
  rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k Hk. apply andI.
  + let y. rewrite tuple_2_0_eq.
    apply binunionE'.
    * exact IHk0 y.
    * { assume Hy: y :e SNo_sqrtauxset (L_ k) (R_ k) x.
        apply SNo_sqrtauxset_E (L_ k) (R_ k) x y Hy.
        let w. assume Hw: w :e L_ k.
        let z. assume Hz: z :e R_ k.
        assume Hwpzpos: 0 < w + z.
        assume Hywz: y = (x + w * z) :/: (w + z).
        apply IHk0 w Hw. assume H. apply H.
        assume Hw1: SNo w.
        assume Hw2: 0 <= w.
        assume Hw3: w * w < x.
        apply IHk1 z Hz. assume H. apply H.
        assume Hz1: SNo z.
        assume Hz2: 0 <= z.
        assume Hz3: x < z * z.
        prove SNo y /\ 0 <= y /\ y * y < x.
        claim Lwz: SNo (w * z).
        { exact SNo_mul_SNo w z Hw1 Hz1. }
        claim Lxpwz: SNo (x + w * z).
        { exact SNo_add_SNo x (w * z) Hx Lwz. }
        claim Lwpz: SNo (w + z).
        { exact SNo_add_SNo w z Hw1 Hz1. }
        claim Ly: SNo y.
        { rewrite Hywz.
          exact SNo_div_SNo (x + w * z) (w + z) Lxpwz Lwpz.
        }
        claim Lxpwznonneg: 0 <= x + w * z.
        { rewrite <- add_SNo_0L 0 SNo_0.
          apply add_SNo_Le3 0 0 x (w * z) SNo_0 SNo_0 Hx Lwz Hxnonneg.
          prove 0 <= w * z.
          exact mul_SNo_nonneg_nonneg w z Hw1 Hz1 Hw2 Hz2.
        }
        claim Lynonneg: 0 <= y.
        { prove 0 <= y. rewrite Hywz.
          prove 0 <= (x + w * z) :/: (w + z).
          apply SNoLeE 0 (x + w * z) SNo_0 Lxpwz Lxpwznonneg.
          - assume H1: 0 < x + w * z.
            apply SNoLtLe.
            apply div_SNo_pos_pos (x + w * z) (w + z) Lxpwz Lwpz.
            + prove 0 < x + w * z. exact H1.
            + prove 0 < w + z. exact Hwpzpos.
          - assume H1: 0 = x + w * z. rewrite <- H1.
            prove 0 <= 0 :/: (w + z).
            rewrite div_SNo_0_num (w + z) Lwpz.
            apply SNoLe_ref.
        }
        apply and3I.
        - exact Ly.
        - exact Lynonneg.
        - prove y * y < x.
          rewrite Hywz.
          prove ((x + w * z) :/: (w + z)) * ((x + w * z) :/: (w + z)) < x.
          rewrite mul_div_SNo_both (x + w * z) (w + z) (x + w * z) (w + z) Lxpwz Lwpz Lxpwz Lwpz.
          prove ((x + w * z) * (x + w * z)) :/: ((w + z) * (w + z)) < x.
          apply div_SNo_pos_LtL ((x + w * z) * (x + w * z)) ((w + z) * (w + z)) x (SNo_mul_SNo (x + w * z) (x + w * z) Lxpwz Lxpwz) (SNo_mul_SNo (w + z) (w + z) Lwpz Lwpz) Hx.
          + prove 0 < (w + z) * (w + z).
            exact mul_SNo_pos_pos (w + z) (w + z) Lwpz Lwpz Hwpzpos Hwpzpos.
          + prove ((x + w * z) * (x + w * z)) < x * ((w + z) * (w + z)).
            rewrite SNo_foil x (w * z) x (w * z) Hx Lwz.
            rewrite SNo_foil w z w z Hw1 Hz1 Hw1 Hz1.
            prove x * x + x * w * z + (w * z) * x + (w * z) * w * z
                < x * (w * w + w * z + z * w + z * z).
            rewrite mul_SNo_com z w Hz1 Hw1.
            rewrite <- add_SNo_rotate_4_1 (w * z) (w * z) (z * z) (w * w) Lwz Lwz (SNo_mul_SNo z z Hz1 Hz1) (SNo_mul_SNo w w Hw1 Hw1).
            prove x * x + x * w * z + (w * z) * x + (w * z) * w * z
                < x * (w * z + w * z + z * z + w * w).
            rewrite mul_SNo_com (w * z) x Lwz Hx.
            prove x * x + x * w * z + x * w * z + (w * z) * w * z
                < x * (w * z + w * z + z * z + w * w).
            claim Lxwz: SNo (x * w * z).
            { exact SNo_mul_SNo x (w * z) Hx Lwz. }
            rewrite <- add_SNo_rotate_4_1 (x * w * z) (x * w * z) ((w * z) * w * z) (x * x) Lxwz Lxwz (SNo_mul_SNo (w * z) (w * z) Lwz Lwz) (SNo_mul_SNo x x Hx Hx).
            prove x * w * z + x * w * z + (w * z) * w * z + x * x
                < x * (w * z + w * z + z * z + w * w).
            rewrite mul_SNo_distrL x (w * z) (w * z + z * z + w * w) Hx Lwz (SNo_add_SNo_3 (w * z) (z * z) (w * w) Lwz (SNo_mul_SNo z z Hz1 Hz1) (SNo_mul_SNo w w Hw1 Hw1)).
            prove x * w * z + x * w * z + (w * z) * w * z + x * x
                < x * w * z + x * (w * z + z * z + w * w).
            rewrite mul_SNo_distrL x (w * z) (z * z + w * w) Hx Lwz (SNo_add_SNo (z * z) (w * w) (SNo_mul_SNo z z Hz1 Hz1) (SNo_mul_SNo w w Hw1 Hw1)).
            prove x * w * z + x * w * z + (w * z) * w * z + x * x
                < x * w * z + x * w * z + x * (z * z + w * w).
            claim Lxwz: SNo (x * w * z).
            { exact SNo_mul_SNo_3 x w z Hx Hw1 Hz1. }
            apply add_SNo_Lt2 (x * w * z) (x * w * z + (w * z) * w * z + x * x) (x * w * z + x * (z * z + w * w)) Lxwz (SNo_add_SNo_3 (x * w * z) ((w * z) * w * z) (x * x) Lxwz (SNo_mul_SNo (w * z) (w * z) Lwz Lwz) (SNo_mul_SNo x x Hx Hx)) (SNo_add_SNo (x * w * z) (x * (z * z + w * w)) Lxwz (SNo_mul_SNo x (z * z + w * w) Hx (SNo_add_SNo (z * z) (w * w) (SNo_mul_SNo z z Hz1 Hz1) (SNo_mul_SNo w w Hw1 Hw1)))).
            prove x * w * z + (w * z) * w * z + x * x
                < x * w * z + x * (z * z + w * w).
            apply add_SNo_Lt2 (x * w * z) ((w * z) * w * z + x * x) (x * (z * z + w * w)) Lxwz (SNo_add_SNo ((w * z) * w * z) (x * x) (SNo_mul_SNo (w * z) (w * z) Lwz Lwz) (SNo_mul_SNo x x Hx Hx)) (SNo_mul_SNo x (z * z + w * w) Hx (SNo_add_SNo (z * z) (w * w) (SNo_mul_SNo z z Hz1 Hz1) (SNo_mul_SNo w w Hw1 Hw1))).
            prove (w * z) * w * z + x * x < x * (z * z + w * w).
            rewrite mul_SNo_distrL x (z * z) (w * w) Hx (SNo_mul_SNo z z Hz1 Hz1) (SNo_mul_SNo w w Hw1 Hw1).
            prove (w * z) * w * z + x * x < x * z * z + x * w * w.
            rewrite mul_SNo_com x (w * w) Hx (SNo_mul_SNo w w Hw1 Hw1).
            prove (w * z) * w * z + x * x < x * z * z + (w * w) * x.
            rewrite <- add_SNo_0L ((w * z) * w * z + x * x) (SNo_add_SNo ((w * z) * w * z) (x * x) (SNo_mul_SNo (w * z) (w * z) Lwz Lwz) (SNo_mul_SNo x x Hx Hx)).
            prove 0 + (w * z) * w * z + x * x < x * z * z + (w * w) * x.
            apply add_SNo_minus_Lt2 (x * z * z + (w * w) * x) ((w * z) * w * z + x * x) 0 (SNo_add_SNo (x * z * z) ((w * w) * x) (SNo_mul_SNo x (z * z) Hx (SNo_mul_SNo z z Hz1 Hz1)) (SNo_mul_SNo (w * w) x (SNo_mul_SNo w w Hw1 Hw1) Hx)) (SNo_add_SNo ((w * z) * w * z) (x * x) (SNo_mul_SNo (w * z) (w * z) Lwz Lwz) (SNo_mul_SNo x x Hx Hx)) SNo_0.
            prove 0 < (x * z * z + (w * w) * x) + - ((w * z) * w * z + x * x).
            rewrite <- add_SNo_assoc (x * z * z) ((w * w) * x) (- ((w * z) * w * z + x * x)) (SNo_mul_SNo x (z * z) Hx (SNo_mul_SNo z z Hz1 Hz1)) (SNo_mul_SNo (w * w) x (SNo_mul_SNo w w Hw1 Hw1) Hx) (SNo_minus_SNo ((w * z) * w * z + x * x) (SNo_add_SNo ((w * z) * w * z) (x * x) (SNo_mul_SNo (w * z) (w * z) Lwz Lwz) (SNo_mul_SNo x x Hx Hx))).
            rewrite minus_add_SNo_distr ((w * z) * w * z) (x * x) (SNo_mul_SNo (w * z) (w * z) Lwz Lwz) (SNo_mul_SNo x x Hx Hx).
            prove 0 < x * z * z + (w * w) * x + - (w * z) * w * z + - x * x.
            rewrite add_SNo_rotate_3_1 ((w * w) * x) (- (w * z) * w * z) (- x * x) (SNo_mul_SNo (w * w) x (SNo_mul_SNo w w Hw1 Hw1) Hx) (SNo_minus_SNo ((w * z) * w * z) (SNo_mul_SNo (w * z) (w * z) Lwz Lwz)) (SNo_minus_SNo (x * x) (SNo_mul_SNo x x Hx Hx)).
            prove 0 < x * z * z + - x * x + (w * w) * x + - (w * z) * w * z.
            rewrite add_SNo_com ((w * w) * x) (- (w * z) * w * z) (SNo_mul_SNo (w * w) x (SNo_mul_SNo w w Hw1 Hw1) Hx) (SNo_minus_SNo ((w * z) * w * z) (SNo_mul_SNo (w * z) (w * z) Lwz Lwz)).
            prove 0 < x * z * z + - x * x + - (w * z) * w * z + (w * w) * x.
            rewrite <- mul_SNo_assoc w z (w * z) Hw1 Hz1 Lwz.
            prove 0 < x * z * z + - x * x + - w * z * w * z + (w * w) * x.
            rewrite mul_SNo_com_3_0_1 z w z Hz1 Hw1 Hz1.
            prove 0 < x * z * z + - x * x + - w * w * z * z + (w * w) * x.
            rewrite mul_SNo_assoc w w (z * z) Hw1 Hw1 (SNo_mul_SNo z z Hz1 Hz1).
            rewrite <- SNo_foil_mm x (w * w) (z * z) x Hx (SNo_mul_SNo w w Hw1 Hw1) (SNo_mul_SNo z z Hz1 Hz1) Hx.
            prove 0 < (x + - w * w) * (z * z + - x).
            apply mul_SNo_pos_pos (x + - w * w) (z * z + - x) (SNo_add_SNo x (- w * w) Hx (SNo_minus_SNo (w * w) (SNo_mul_SNo w w Hw1 Hw1))) (SNo_add_SNo (z * z) (- x) (SNo_mul_SNo z z Hz1 Hz1) (SNo_minus_SNo x Hx)).
            * prove 0 < x + - w * w.
              exact SNoLt_minus_pos (w * w) x (SNo_mul_SNo w w Hw1 Hw1) Hx Hw3.
            * prove 0 < z * z + - x.
              exact SNoLt_minus_pos x (z * z) Hx (SNo_mul_SNo z z Hz1 Hz1) Hz3.
            * exact Hx.
            * prove SNo (w * z). exact Lwz.
      }
  + let y. rewrite tuple_2_1_eq.
    apply binunionE'.
    * { apply binunionE'.
        - exact IHk1 y.
        - assume Hy: y :e SNo_sqrtauxset (L_ k) (L_ k) x.
          prove SNo y /\ 0 <= y /\ x < y * y.
          apply SNo_sqrtauxset_E (L_ k) (L_ k) x y Hy.
          let w. assume Hw: w :e L_ k.
          let w'. assume Hw': w' :e L_ k.
          assume Hww'pos: 0 < w + w'.
          assume Hyww': y = (x + w * w') :/: (w + w').
          apply IHk0 w Hw. assume H. apply H.
          assume Hw1: SNo w.
          assume Hw2: 0 <= w.
          assume Hw3: w * w < x.
          apply IHk0 w' Hw'. assume H. apply H.
          assume Hw'1: SNo w'.
          assume Hw'2: 0 <= w'.
          assume Hw'3: w' * w' < x.
          prove SNo y /\ 0 <= y /\ x < y * y.
          claim Lww': SNo (w * w').
          { exact SNo_mul_SNo w w' Hw1 Hw'1. }
          claim Lxpww': SNo (x + w * w').
          { exact SNo_add_SNo x (w * w') Hx Lww'. }
          claim Lwpw': SNo (w + w').
          { exact SNo_add_SNo w w' Hw1 Hw'1. }
          claim Ly: SNo y.
          { rewrite Hyww'.
            exact SNo_div_SNo (x + w * w') (w + w') Lxpww' Lwpw'.
          }
          claim Lxpww'nonneg: 0 <= x + w * w'.
          { rewrite <- add_SNo_0L 0 SNo_0.
            apply add_SNo_Le3 0 0 x (w * w') SNo_0 SNo_0 Hx Lww' Hxnonneg.
            prove 0 <= w * w'.
            exact mul_SNo_nonneg_nonneg w w' Hw1 Hw'1 Hw2 Hw'2.
          }
          claim Lynonneg: 0 <= y.
          { prove 0 <= y. rewrite Hyww'.
            prove 0 <= (x + w * w') :/: (w + w').
            apply SNoLeE 0 (x + w * w') SNo_0 Lxpww' Lxpww'nonneg.
            - assume H1: 0 < x + w * w'.
              apply SNoLtLe.
              apply div_SNo_pos_pos (x + w * w') (w + w') Lxpww' Lwpw'.
              + prove 0 < x + w * w'.
                exact H1.
              + prove 0 < w + w'. exact Hww'pos.
            - assume H1: 0 = x + w * w'. rewrite <- H1.
              prove 0 <= 0 :/: (w + w').
              rewrite div_SNo_0_num (w + w') Lwpw'.
              apply SNoLe_ref.
          }
          apply and3I.
          + exact Ly.
          + exact Lynonneg.
          + prove x < y * y.
            rewrite Hyww'.
            prove x < ((x + w * w') :/: (w + w')) * ((x + w * w') :/: (w + w')).
            rewrite mul_div_SNo_both (x + w * w') (w + w') (x + w * w') (w + w') Lxpww' Lwpw' Lxpww' Lwpw'.
            prove x < ((x + w * w') * (x + w * w')) :/: ((w + w') * (w + w')).
            apply div_SNo_pos_LtR ((x + w * w') * (x + w * w')) ((w + w') * (w + w')) x (SNo_mul_SNo (x + w * w') (x + w * w') Lxpww' Lxpww') (SNo_mul_SNo (w + w') (w + w') Lwpw' Lwpw') Hx.
            * prove 0 < (w + w') * (w + w').
              exact mul_SNo_pos_pos (w + w') (w + w') Lwpw' Lwpw' Hww'pos Hww'pos.
            * { prove x * ((w + w') * (w + w')) < ((x + w * w') * (x + w * w')).
                rewrite SNo_foil x (w * w') x (w * w') Hx Lww'.
                rewrite SNo_foil w w' w w' Hw1 Hw'1 Hw1 Hw'1.
                prove x * (w * w + w * w' + w' * w + w' * w')
                    < x * x + x * w * w' + (w * w') * x + (w * w') * w * w'.
                rewrite mul_SNo_com w' w Hw'1 Hw1.
                rewrite <- add_SNo_rotate_4_1 (w * w') (w * w') (w' * w') (w * w) Lww' Lww' (SNo_mul_SNo w' w' Hw'1 Hw'1) (SNo_mul_SNo w w Hw1 Hw1).
                prove x * (w * w' + w * w' + w' * w' + w * w)
                    < x * x + x * w * w' + (w * w') * x + (w * w') * w * w'.
                rewrite mul_SNo_com (w * w') x Lww' Hx.
                prove x * (w * w' + w * w' + w' * w' + w * w)
                    < x * x + x * w * w' + x * w * w' + (w * w') * w * w'.
                claim Lxww': SNo (x * w * w').
                { exact SNo_mul_SNo x (w * w') Hx Lww'. }
                rewrite <- add_SNo_rotate_4_1 (x * w * w') (x * w * w') ((w * w') * w * w') (x * x) Lxww' Lxww' (SNo_mul_SNo (w * w') (w * w') Lww' Lww') (SNo_mul_SNo x x Hx Hx).
                prove x * (w * w' + w * w' + w' * w' + w * w)
                    < x * w * w' + x * w * w' + (w * w') * w * w' + x * x.
                rewrite mul_SNo_distrL x (w * w') (w * w' + w' * w' + w * w) Hx Lww' (SNo_add_SNo_3 (w * w') (w' * w') (w * w) Lww' (SNo_mul_SNo w' w' Hw'1 Hw'1) (SNo_mul_SNo w w Hw1 Hw1)).
                prove x * w * w' + x * (w * w' + w' * w' + w * w)
                    < x * w * w' + x * w * w' + (w * w') * w * w' + x * x.
                rewrite mul_SNo_distrL x (w * w') (w' * w' + w * w) Hx Lww' (SNo_add_SNo (w' * w') (w * w) (SNo_mul_SNo w' w' Hw'1 Hw'1) (SNo_mul_SNo w w Hw1 Hw1)).
                prove x * w * w' + x * w * w' + x * (w' * w' + w * w)
                    < x * w * w' + x * w * w' + (w * w') * w * w' + x * x.
                claim Lxww': SNo (x * w * w').
                { exact SNo_mul_SNo_3 x w w' Hx Hw1 Hw'1. }
                apply add_SNo_Lt2 (x * w * w') (x * w * w' + x * (w' * w' + w * w)) (x * w * w' + (w * w') * w * w' + x * x) Lxww' (SNo_add_SNo (x * w * w') (x * (w' * w' + w * w)) Lxww' (SNo_mul_SNo x (w' * w' + w * w) Hx (SNo_add_SNo (w' * w') (w * w) (SNo_mul_SNo w' w' Hw'1 Hw'1) (SNo_mul_SNo w w Hw1 Hw1)))) (SNo_add_SNo_3 (x * w * w') ((w * w') * w * w') (x * x) Lxww' (SNo_mul_SNo (w * w') (w * w') Lww' Lww') (SNo_mul_SNo x x Hx Hx)).
                prove x * w * w' + x * (w' * w' + w * w)
                    < x * w * w' + (w * w') * w * w' + x * x.
                apply add_SNo_Lt2 (x * w * w') (x * (w' * w' + w * w)) ((w * w') * w * w' + x * x) Lxww' (SNo_mul_SNo x (w' * w' + w * w) Hx (SNo_add_SNo (w' * w') (w * w) (SNo_mul_SNo w' w' Hw'1 Hw'1) (SNo_mul_SNo w w Hw1 Hw1))) (SNo_add_SNo ((w * w') * w * w') (x * x) (SNo_mul_SNo (w * w') (w * w') Lww' Lww') (SNo_mul_SNo x x Hx Hx)).
                prove x * (w' * w' + w * w) < (w * w') * w * w' + x * x.
                rewrite mul_SNo_distrL x (w' * w') (w * w) Hx (SNo_mul_SNo w' w' Hw'1 Hw'1) (SNo_mul_SNo w w Hw1 Hw1).
                prove x * w' * w' + x * w * w < (w * w') * w * w' + x * x.
                rewrite mul_SNo_com x (w * w) Hx (SNo_mul_SNo w w Hw1 Hw1).
                prove x * w' * w' + (w * w) * x < (w * w') * w * w' + x * x.
                rewrite <- add_SNo_0L ((w * w') * w * w' + x * x) (SNo_add_SNo ((w * w') * w * w') (x * x) (SNo_mul_SNo (w * w') (w * w') Lww' Lww') (SNo_mul_SNo x x Hx Hx)).
                prove x * w' * w' + (w * w) * x < 0 + (w * w') * w * w' + x * x.
                apply add_SNo_minus_Lt1 (x * w' * w' + (w * w) * x) ((w * w') * w * w' + x * x) 0 (SNo_add_SNo (x * w' * w') ((w * w) * x) (SNo_mul_SNo x (w' * w') Hx (SNo_mul_SNo w' w' Hw'1 Hw'1)) (SNo_mul_SNo (w * w) x (SNo_mul_SNo w w Hw1 Hw1) Hx)) (SNo_add_SNo ((w * w') * w * w') (x * x) (SNo_mul_SNo (w * w') (w * w') Lww' Lww') (SNo_mul_SNo x x Hx Hx)) SNo_0.
                prove (x * w' * w' + (w * w) * x) + - ((w * w') * w * w' + x * x) < 0.
                rewrite <- add_SNo_assoc (x * w' * w') ((w * w) * x) (- ((w * w') * w * w' + x * x)) (SNo_mul_SNo x (w' * w') Hx (SNo_mul_SNo w' w' Hw'1 Hw'1)) (SNo_mul_SNo (w * w) x (SNo_mul_SNo w w Hw1 Hw1) Hx) (SNo_minus_SNo ((w * w') * w * w' + x * x) (SNo_add_SNo ((w * w') * w * w') (x * x) (SNo_mul_SNo (w * w') (w * w') Lww' Lww') (SNo_mul_SNo x x Hx Hx))).
                rewrite minus_add_SNo_distr ((w * w') * w * w') (x * x) (SNo_mul_SNo (w * w') (w * w') Lww' Lww') (SNo_mul_SNo x x Hx Hx).
                prove x * w' * w' + (w * w) * x + - (w * w') * w * w' + - x * x < 0.
                rewrite add_SNo_rotate_3_1 ((w * w) * x) (- (w * w') * w * w') (- x * x) (SNo_mul_SNo (w * w) x (SNo_mul_SNo w w Hw1 Hw1) Hx) (SNo_minus_SNo ((w * w') * w * w') (SNo_mul_SNo (w * w') (w * w') Lww' Lww')) (SNo_minus_SNo (x * x) (SNo_mul_SNo x x Hx Hx)).
                prove x * w' * w' + - x * x + (w * w) * x + - (w * w') * w * w' < 0.
                rewrite add_SNo_com ((w * w) * x) (- (w * w') * w * w') (SNo_mul_SNo (w * w) x (SNo_mul_SNo w w Hw1 Hw1) Hx) (SNo_minus_SNo ((w * w') * w * w') (SNo_mul_SNo (w * w') (w * w') Lww' Lww')).
                prove x * w' * w' + - x * x + - (w * w') * w * w' + (w * w) * x < 0.
                rewrite <- mul_SNo_assoc w w' (w * w') Hw1 Hw'1 Lww'.
                prove x * w' * w' + - x * x + - w * w' * w * w' + (w * w) * x < 0.
                rewrite mul_SNo_com_3_0_1 w' w w' Hw'1 Hw1 Hw'1.
                prove x * w' * w' + - x * x + - w * w * w' * w' + (w * w) * x < 0.
                rewrite mul_SNo_assoc w w (w' * w') Hw1 Hw1 (SNo_mul_SNo w' w' Hw'1 Hw'1).
                rewrite <- SNo_foil_mm x (w * w) (w' * w') x Hx (SNo_mul_SNo w w Hw1 Hw1) (SNo_mul_SNo w' w' Hw'1 Hw'1) Hx.
                prove (x + - w * w) * (w' * w' + - x) < 0.
                apply mul_SNo_pos_neg (x + - w * w) (w' * w' + - x) (SNo_add_SNo x (- w * w) Hx (SNo_minus_SNo (w * w) (SNo_mul_SNo w w Hw1 Hw1))) (SNo_add_SNo (w' * w') (- x) (SNo_mul_SNo w' w' Hw'1 Hw'1) (SNo_minus_SNo x Hx)).
                - prove 0 < x + - w * w.
                  exact SNoLt_minus_pos (w * w) x (SNo_mul_SNo w w Hw1 Hw1) Hx Hw3.
                - prove w' * w' + - x < 0.
                  apply add_SNo_minus_Lt1b (w' * w') x 0 (SNo_mul_SNo w' w' Hw'1 Hw'1) Hx SNo_0.
                  prove w' * w' < 0 + x.
                  rewrite add_SNo_0L x Hx.
                  prove w' * w' < x.
                  exact Hw'3.
                - exact Hx.
                - prove SNo (w * w'). exact Lww'.
              }
      }
    * { assume Hy: y :e SNo_sqrtauxset (R_ k) (R_ k) x.
        prove SNo y /\ 0 <= y /\ x < y * y.
        apply SNo_sqrtauxset_E (R_ k) (R_ k) x y Hy.
        let z. assume Hz: z :e R_ k.
        let z'. assume Hz': z' :e R_ k.
        assume Hzz'pos: 0 < z + z'.
        assume Hyzz': y = (x + z * z') :/: (z + z').
        apply IHk1 z Hz. assume H. apply H.
        assume Hz1: SNo z.
        assume Hz2: 0 <= z.
        assume Hz3: x < z * z.
        apply IHk1 z' Hz'. assume H. apply H.
        assume Hz'1: SNo z'.
        assume Hz'2: 0 <= z'.
        assume Hz'3: x < z' * z'.
        prove SNo y /\ 0 <= y /\ x < y * y.
        claim Lzz': SNo (z * z').
        { exact SNo_mul_SNo z z' Hz1 Hz'1. }
        claim Lxpzz': SNo (x + z * z').
        { exact SNo_add_SNo x (z * z') Hx Lzz'. }
        claim Lzpz': SNo (z + z').
        { exact SNo_add_SNo z z' Hz1 Hz'1. }
        claim Ly: SNo y.
        { rewrite Hyzz'.
          exact SNo_div_SNo (x + z * z') (z + z') Lxpzz' Lzpz'.
        }
        claim Lxpzz'nonneg: 0 <= x + z * z'.
        { rewrite <- add_SNo_0L 0 SNo_0.
          apply add_SNo_Le3 0 0 x (z * z') SNo_0 SNo_0 Hx Lzz' Hxnonneg.
          prove 0 <= z * z'.
          exact mul_SNo_nonneg_nonneg z z' Hz1 Hz'1 Hz2 Hz'2.
        }
        claim Lynonneg: 0 <= y.
        { prove 0 <= y. rewrite Hyzz'.
          prove 0 <= (x + z * z') :/: (z + z').
          apply SNoLeE 0 (x + z * z') SNo_0 Lxpzz' Lxpzz'nonneg.
          - assume H1: 0 < x + z * z'.
            apply SNoLtLe.
            apply div_SNo_pos_pos (x + z * z') (z + z') Lxpzz' Lzpz'.
            + prove 0 < x + z * z'. exact H1.
            + prove 0 < z + z'. exact Hzz'pos.
          - assume H1: 0 = x + z * z'. rewrite <- H1.
            prove 0 <= 0 :/: (z + z').
            rewrite div_SNo_0_num (z + z') Lzpz'.
            apply SNoLe_ref.
        }
        apply and3I.
        - exact Ly.
        - exact Lynonneg.
        - prove x < y * y.
          rewrite Hyzz'.
          prove x < ((x + z * z') :/: (z + z')) * ((x + z * z') :/: (z + z')).
          rewrite mul_div_SNo_both (x + z * z') (z + z') (x + z * z') (z + z') Lxpzz' Lzpz' Lxpzz' Lzpz'.
          prove x < ((x + z * z') * (x + z * z')) :/: ((z + z') * (z + z')).
          apply div_SNo_pos_LtR ((x + z * z') * (x + z * z')) ((z + z') * (z + z')) x (SNo_mul_SNo (x + z * z') (x + z * z') Lxpzz' Lxpzz') (SNo_mul_SNo (z + z') (z + z') Lzpz' Lzpz') Hx.
          + prove 0 < (z + z') * (z + z').
            exact mul_SNo_pos_pos (z + z') (z + z') Lzpz' Lzpz' Hzz'pos Hzz'pos.
          + prove x * ((z + z') * (z + z')) < ((x + z * z') * (x + z * z')).
            rewrite SNo_foil x (z * z') x (z * z') Hx Lzz'.
            rewrite SNo_foil z z' z z' Hz1 Hz'1 Hz1 Hz'1.
            prove x * (z * z + z * z' + z' * z + z' * z')
                < x * x + x * z * z' + (z * z') * x + (z * z') * z * z'.
            rewrite mul_SNo_com z' z Hz'1 Hz1.
            rewrite <- add_SNo_rotate_4_1 (z * z') (z * z') (z' * z') (z * z) Lzz' Lzz' (SNo_mul_SNo z' z' Hz'1 Hz'1) (SNo_mul_SNo z z Hz1 Hz1).
            prove x * (z * z' + z * z' + z' * z' + z * z)
                < x * x + x * z * z' + (z * z') * x + (z * z') * z * z'.
            rewrite mul_SNo_com (z * z') x Lzz' Hx.
            prove x * (z * z' + z * z' + z' * z' + z * z)
                < x * x + x * z * z' + x * z * z' + (z * z') * z * z'.
            claim Lxzz': SNo (x * z * z').
            { exact SNo_mul_SNo x (z * z') Hx Lzz'. }
            rewrite <- add_SNo_rotate_4_1 (x * z * z') (x * z * z') ((z * z') * z * z') (x * x) Lxzz' Lxzz' (SNo_mul_SNo (z * z') (z * z') Lzz' Lzz') (SNo_mul_SNo x x Hx Hx).
            prove x * (z * z' + z * z' + z' * z' + z * z)
                < x * z * z' + x * z * z' + (z * z') * z * z' + x * x.
            rewrite mul_SNo_distrL x (z * z') (z * z' + z' * z' + z * z) Hx Lzz' (SNo_add_SNo_3 (z * z') (z' * z') (z * z) Lzz' (SNo_mul_SNo z' z' Hz'1 Hz'1) (SNo_mul_SNo z z Hz1 Hz1)).
            prove x * z * z' + x * (z * z' + z' * z' + z * z)
                < x * z * z' + x * z * z' + (z * z') * z * z' + x * x.
            rewrite mul_SNo_distrL x (z * z') (z' * z' + z * z) Hx Lzz' (SNo_add_SNo (z' * z') (z * z) (SNo_mul_SNo z' z' Hz'1 Hz'1) (SNo_mul_SNo z z Hz1 Hz1)).
            prove x * z * z' + x * z * z' + x * (z' * z' + z * z)
                < x * z * z' + x * z * z' + (z * z') * z * z' + x * x.
            claim Lxzz': SNo (x * z * z').
            { exact SNo_mul_SNo_3 x z z' Hx Hz1 Hz'1. }
            apply add_SNo_Lt2 (x * z * z') (x * z * z' + x * (z' * z' + z * z)) (x * z * z' + (z * z') * z * z' + x * x) Lxzz' (SNo_add_SNo (x * z * z') (x * (z' * z' + z * z)) Lxzz' (SNo_mul_SNo x (z' * z' + z * z) Hx (SNo_add_SNo (z' * z') (z * z) (SNo_mul_SNo z' z' Hz'1 Hz'1) (SNo_mul_SNo z z Hz1 Hz1)))) (SNo_add_SNo_3 (x * z * z') ((z * z') * z * z') (x * x) Lxzz' (SNo_mul_SNo (z * z') (z * z') Lzz' Lzz') (SNo_mul_SNo x x Hx Hx)).
            prove x * z * z' + x * (z' * z' + z * z)
                < x * z * z' + (z * z') * z * z' + x * x.
            apply add_SNo_Lt2 (x * z * z') (x * (z' * z' + z * z)) ((z * z') * z * z' + x * x) Lxzz' (SNo_mul_SNo x (z' * z' + z * z) Hx (SNo_add_SNo (z' * z') (z * z) (SNo_mul_SNo z' z' Hz'1 Hz'1) (SNo_mul_SNo z z Hz1 Hz1))) (SNo_add_SNo ((z * z') * z * z') (x * x) (SNo_mul_SNo (z * z') (z * z') Lzz' Lzz') (SNo_mul_SNo x x Hx Hx)).
            prove x * (z' * z' + z * z) < (z * z') * z * z' + x * x.
            rewrite mul_SNo_distrL x (z' * z') (z * z) Hx (SNo_mul_SNo z' z' Hz'1 Hz'1) (SNo_mul_SNo z z Hz1 Hz1).
            prove x * z' * z' + x * z * z < (z * z') * z * z' + x * x.
            rewrite mul_SNo_com x (z * z) Hx (SNo_mul_SNo z z Hz1 Hz1).
            prove x * z' * z' + (z * z) * x < (z * z') * z * z' + x * x.
            rewrite <- add_SNo_0L ((z * z') * z * z' + x * x) (SNo_add_SNo ((z * z') * z * z') (x * x) (SNo_mul_SNo (z * z') (z * z') Lzz' Lzz') (SNo_mul_SNo x x Hx Hx)).
            prove x * z' * z' + (z * z) * x < 0 + (z * z') * z * z' + x * x.
            apply add_SNo_minus_Lt1 (x * z' * z' + (z * z) * x) ((z * z') * z * z' + x * x) 0 (SNo_add_SNo (x * z' * z') ((z * z) * x) (SNo_mul_SNo x (z' * z') Hx (SNo_mul_SNo z' z' Hz'1 Hz'1)) (SNo_mul_SNo (z * z) x (SNo_mul_SNo z z Hz1 Hz1) Hx)) (SNo_add_SNo ((z * z') * z * z') (x * x) (SNo_mul_SNo (z * z') (z * z') Lzz' Lzz') (SNo_mul_SNo x x Hx Hx)) SNo_0.
            prove (x * z' * z' + (z * z) * x) + - ((z * z') * z * z' + x * x) < 0.
            rewrite <- add_SNo_assoc (x * z' * z') ((z * z) * x) (- ((z * z') * z * z' + x * x)) (SNo_mul_SNo x (z' * z') Hx (SNo_mul_SNo z' z' Hz'1 Hz'1)) (SNo_mul_SNo (z * z) x (SNo_mul_SNo z z Hz1 Hz1) Hx) (SNo_minus_SNo ((z * z') * z * z' + x * x) (SNo_add_SNo ((z * z') * z * z') (x * x) (SNo_mul_SNo (z * z') (z * z') Lzz' Lzz') (SNo_mul_SNo x x Hx Hx))).
            rewrite minus_add_SNo_distr ((z * z') * z * z') (x * x) (SNo_mul_SNo (z * z') (z * z') Lzz' Lzz') (SNo_mul_SNo x x Hx Hx).
            prove x * z' * z' + (z * z) * x + - (z * z') * z * z' + - x * x < 0.
            rewrite add_SNo_rotate_3_1 ((z * z) * x) (- (z * z') * z * z') (- x * x) (SNo_mul_SNo (z * z) x (SNo_mul_SNo z z Hz1 Hz1) Hx) (SNo_minus_SNo ((z * z') * z * z') (SNo_mul_SNo (z * z') (z * z') Lzz' Lzz')) (SNo_minus_SNo (x * x) (SNo_mul_SNo x x Hx Hx)).
            prove x * z' * z' + - x * x + (z * z) * x + - (z * z') * z * z' < 0.
            rewrite add_SNo_com ((z * z) * x) (- (z * z') * z * z') (SNo_mul_SNo (z * z) x (SNo_mul_SNo z z Hz1 Hz1) Hx) (SNo_minus_SNo ((z * z') * z * z') (SNo_mul_SNo (z * z') (z * z') Lzz' Lzz')).
            prove x * z' * z' + - x * x + - (z * z') * z * z' + (z * z) * x < 0.
            rewrite <- mul_SNo_assoc z z' (z * z') Hz1 Hz'1 Lzz'.
            prove x * z' * z' + - x * x + - z * z' * z * z' + (z * z) * x < 0.
            rewrite mul_SNo_com_3_0_1 z' z z' Hz'1 Hz1 Hz'1.
            prove x * z' * z' + - x * x + - z * z * z' * z' + (z * z) * x < 0.
            rewrite mul_SNo_assoc z z (z' * z') Hz1 Hz1 (SNo_mul_SNo z' z' Hz'1 Hz'1).
            rewrite <- SNo_foil_mm x (z * z) (z' * z') x Hx (SNo_mul_SNo z z Hz1 Hz1) (SNo_mul_SNo z' z' Hz'1 Hz'1) Hx.
            prove (x + - z * z) * (z' * z' + - x) < 0.
            apply mul_SNo_neg_pos (x + - z * z) (z' * z' + - x) (SNo_add_SNo x (- z * z) Hx (SNo_minus_SNo (z * z) (SNo_mul_SNo z z Hz1 Hz1))) (SNo_add_SNo (z' * z') (- x) (SNo_mul_SNo z' z' Hz'1 Hz'1) (SNo_minus_SNo x Hx)).
            * prove x + - z * z < 0.
              apply add_SNo_minus_Lt1b x (z * z) 0 Hx (SNo_mul_SNo z z Hz1 Hz1) SNo_0.
              prove x < 0 + z * z.
              rewrite add_SNo_0L (z * z) (SNo_mul_SNo z z Hz1 Hz1).
              prove x < z * z.
              exact Hz3.
            * prove 0 < z' * z' + - x.
              exact SNoLt_minus_pos x (z' * z') Hx (SNo_mul_SNo z' z' Hz'1 Hz'1) Hz'3.
            * exact Hx.
            * prove SNo (z * z'). exact Lzz'.
      }
Qed.

Theorem sqrt_SNo_nonneg_prop1b: forall x, SNo x -> 0 <= x
 -> (forall k, nat_p k ->
              (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 0, SNo y /\ 0 <= y /\ y * y < x)
           /\ (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 1, SNo y /\ 0 <= y /\ x < y * y))
 -> SNoCutP (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0) (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1).
let x. assume Hx Hxnonneg.
set L_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
set R_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 1.
set L := \/_ k :e omega, L_ k.
set R := \/_ k :e omega, R_ k.
assume H0: forall k, nat_p k ->
              (forall y :e L_ k, SNo y /\ 0 <= y /\ y * y < x)
           /\ (forall y :e R_ k, SNo y /\ 0 <= y /\ x < y * y).
prove (forall x :e L, SNo x)
   /\ (forall y :e R, SNo y)
   /\ (forall x :e L, forall y :e R, x < y).
apply and3I.
- let w. assume Hw: w :e L.
  apply famunionE_impred omega L_ w Hw.
  let k. assume Hk: k :e omega.
  assume H1: w :e L_ k.
  apply H0 k (omega_nat_p k Hk).
  assume H2 _.
  apply H2 w H1.
  assume H3 _. apply H3. assume H3 _.
  exact H3.
- let z. assume Hz: z :e R.
  apply famunionE_impred omega R_ z Hz.
  let k. assume Hk: k :e omega.
  assume H1: z :e R_ k.
  apply H0 k (omega_nat_p k Hk).
  assume _ H2.
  apply H2 z H1.
  assume H3 _. apply H3. assume H3 _. exact H3.
- let w. assume Hw: w :e L.
  let z. assume Hz: z :e R.
  prove w < z.
  apply famunionE_impred omega L_ w Hw.
  let k. assume Hk: k :e omega.
  assume H1: w :e L_ k.
  apply H0 k (omega_nat_p k Hk).
  assume H2 _.
  apply H2 w H1. assume H. apply H.
  assume Hw1: SNo w.
  assume Hw2: 0 <= w.
  assume Hw3: w * w < x.
  apply famunionE_impred omega R_ z Hz.
  let k'. assume Hk': k' :e omega.
  assume H3: z :e R_ k'.
  apply H0 k' (omega_nat_p k' Hk').
  assume _ H4.
  apply H4 z H3. assume H. apply H.
  assume Hz1: SNo z.
  assume Hz2: 0 <= z.
  assume Hz3: x < z * z.
  prove w < z.
  apply SNoLtLe_or w z Hw1 Hz1.
  + assume H5: w < z. exact H5.
  + assume H5: z <= w. prove False.
    apply SNoLt_irref x.
    prove x < x.
    apply SNoLt_tra x (z * z) x Hx (SNo_mul_SNo z z Hz1 Hz1) Hx Hz3.
    prove z * z < x.
    apply SNoLeLt_tra (z * z) (w * w) x (SNo_mul_SNo z z Hz1 Hz1) (SNo_mul_SNo w w Hw1 Hw1) Hx.
    * prove z * z <= w * w.
      exact nonneg_mul_SNo_Le2 z z w w Hz1 Hz1 Hw1 Hw1 Hz2 Hz2 H5 H5.
    * exact Hw3.
Qed.

Theorem sqrt_SNo_nonneg_prop1c: forall x, SNo x -> 0 <= x ->
    SNoCutP (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0) (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1)
 -> (forall z :e (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1), forall p:prop, (SNo z -> 0 <= z -> x < z * z -> p) -> p)
 -> 0 <= G x sqrt_SNo_nonneg.
let x. assume Hx Hxnonneg H1 H1R.
rewrite <- SNoCut_0_0 at 1.
set L_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
set R_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 1.
set L := \/_ k :e omega, L_ k.
set R := \/_ k :e omega, R_ k.
prove SNoCut 0 0 <= SNoCut L R.
apply SNoCut_Le 0 0 L R.
- prove SNoCutP 0 0. exact SNoCutP_0_0.
- exact H1.
- let w. assume Hw: w :e 0. prove False. exact EmptyE w Hw.
- let z. assume Hz: z :e R.
  prove SNoCut 0 0 < z.
  rewrite SNoCut_0_0.
  prove 0 < z.
  apply H1R z Hz.
  assume Hz1: SNo z.
  assume Hz2: 0 <= z.
  assume Hz3: x < z * z.
  apply SNoLeE 0 z SNo_0 Hz1 Hz2.
  + assume H6: 0 < z. exact H6.
  + assume H6: 0 = z. prove False.
    apply SNoLt_irref x.
    prove x < x.
    apply SNoLtLe_tra x 0 x Hx SNo_0 Hx.
    * prove x < 0.
      rewrite <- mul_SNo_zeroR 0 SNo_0.
      prove x < 0 * 0.
      rewrite H6. exact Hz3.
    * prove 0 <= x. exact Hxnonneg.
Qed.

Theorem sqrt_SNo_nonneg_prop1d: forall x, SNo x -> 0 <= x
  -> (forall w :e SNoS_ (SNoLev x), 0 <= w -> SNo (sqrt_SNo_nonneg w) /\ 0 <= sqrt_SNo_nonneg w /\ sqrt_SNo_nonneg w * sqrt_SNo_nonneg w = w)
  -> SNoCutP (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0) (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1)
  -> 0 <= G x sqrt_SNo_nonneg
  -> G x sqrt_SNo_nonneg * G x sqrt_SNo_nonneg < x
  -> False.
let x.
assume Hx Hxnonneg IH HLR.
set L_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
set R_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 1.
set L := \/_ k :e omega, L_ k.
set R := \/_ k :e omega, R_ k.
set y := SNoCut L R.
assume Hynn: 0 <= y.
assume H6: y * y < x.
apply HLR.
assume HLHR. apply HLHR.
assume HL: forall w :e L, SNo w.
assume HR: forall z :e R, SNo z.
assume HLR': forall w :e L, forall z :e R, w < z.
apply SNoCutP_SNoCut_impred L R HLR.
assume H1: SNo y.
assume H2: SNoLev y :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume H3: forall w :e L, w < y.
assume H4: forall z :e R, y < z.
assume H5: forall u, SNo u -> (forall w :e L, w < u) -> (forall z :e R, u < z) -> SNoLev y c= SNoLev u /\ SNoEq_ (SNoLev y) y u.
claim Lyy: SNo (y * y).
{ exact SNo_mul_SNo y y H1 H1. }
claim Lyynn: 0 <= y * y.
{ exact mul_SNo_nonneg_nonneg y y H1 H1 Hynn Hynn. }
claim LL_mon: forall k k', nat_p k -> nat_p k' -> k c= k' -> L_ k c= L_ k'.
{ let k k'. assume Hk Hk' Hkk'.
  apply SNo_sqrtaux_mon x sqrt_SNo_nonneg k Hk k' Hk' Hkk'.
  assume H _. exact H.
}
claim LR_mon: forall k k', nat_p k -> nat_p k' -> k c= k' -> R_ k c= R_ k'.
{ let k k'. assume Hk Hk' Hkk'.
  apply SNo_sqrtaux_mon x sqrt_SNo_nonneg k Hk k' Hk' Hkk'.
  assume _ H. exact H.
}
claim L1: forall k, nat_p k ->
              (forall y :e L_ k, SNo y /\ 0 <= y /\ y * y < x)
           /\ (forall y :e R_ k, SNo y /\ 0 <= y /\ x < y * y).
{ exact sqrt_SNo_nonneg_prop1a x Hx Hxnonneg IH. }
claim L1L: forall w :e L, forall p:prop, (SNo w -> 0 <= w -> w * w < x -> p) -> p.
{ let w. assume Hw. let p. assume Hp.
  apply famunionE_impred omega L_ w Hw.
  let k. assume Hk: k :e omega.
  assume H1: w :e L_ k.
  apply L1 k (omega_nat_p k Hk).
  assume H2 _.
  apply H2 w H1.
  assume H3. apply H3.
  exact Hp.
}
claim L1R: forall z :e R, forall p:prop, (SNo z -> 0 <= z -> x < z * z -> p) -> p.
{ let z. assume Hz. let p. assume Hp.
  apply famunionE_impred omega R_ z Hz.
  let k. assume Hk: k :e omega.
  assume H1: z :e R_ k.
  apply L1 k (omega_nat_p k Hk).
  assume _ H2.
  apply H2 z H1.
  assume H3. apply H3.
  exact Hp.
}
apply SNoLtE (y * y) x Lyy Hx H6.
- let u.
  assume Hu1: SNo u.
  assume Hu2: SNoLev u :e SNoLev (y * y) :/\: SNoLev x.
  assume Hu3: SNoEq_ (SNoLev u) u (y * y).
  assume Hu4: SNoEq_ (SNoLev u) u x.
  assume Hu5: y * y < u.
  assume Hu6: u < x.
  prove False.
(** In this case u is in SNoL x. And 0 <= y times y < u.
    So u is in SNoL_nonneg x.
    So sqrt u in L and sqrt u < y.
    u = sqrt u times sqrt u < y times y, contradiction to Hu5.
 **)
  claim Lunn: 0 <= u.
  { apply SNoLtLe.
    exact SNoLeLt_tra 0 (y * y) u SNo_0 Lyy Hu1 Lyynn Hu5.
  }
  claim LuSx: u :e SNoS_ (SNoLev x).
  { apply SNoS_I2 u x Hu1 Hx.
    prove SNoLev u :e SNoLev x.
    exact binintersectE2 (SNoLev (y * y)) (SNoLev x) (SNoLev u) Hu2.
  }
  apply IH u LuSx Lunn. assume H. apply H.
  assume H7: SNo (sqrt_SNo_nonneg u).
  assume H8: 0 <= sqrt_SNo_nonneg u.
  assume H9: sqrt_SNo_nonneg u * sqrt_SNo_nonneg u = u.
  claim Lsruy: sqrt_SNo_nonneg u <= y.
  { apply SNoLtLe.
    prove sqrt_SNo_nonneg u < y.
    apply H3.
    prove sqrt_SNo_nonneg u :e L.
    claim Lsruy0: sqrt_SNo_nonneg u :e L_ 0.
    { prove sqrt_SNo_nonneg u :e SNo_sqrtaux x sqrt_SNo_nonneg 0 0.
      rewrite SNo_sqrtaux_0.
      rewrite tuple_2_0_eq.
      prove sqrt_SNo_nonneg u :e {sqrt_SNo_nonneg w|w :e SNoL_nonneg x}.
      apply ReplI.
      prove u :e {w :e SNoL x|0 <= w}.
      apply SepI.
      - apply SNoL_I x Hx u Hu1.
        + exact binintersectE2 (SNoLev (y * y)) (SNoLev x) (SNoLev u) Hu2.
        + prove u < x. exact Hu6.
      - exact Lunn.
    }
    exact famunionI omega L_ 0 (sqrt_SNo_nonneg u) (nat_p_omega 0 nat_0) Lsruy0.
  }
  claim Luyy: u <= y * y.
  { rewrite <- H9.
    prove sqrt_SNo_nonneg u * sqrt_SNo_nonneg u <= y * y.
    exact nonneg_mul_SNo_Le2 (sqrt_SNo_nonneg u) (sqrt_SNo_nonneg u) y y H7 H7 H1 H1 H8 H8 Lsruy Lsruy.
  }
  apply SNoLt_irref (y * y).
  prove y * y < y * y.
  exact SNoLtLe_tra (y * y) u (y * y) Lyy Hu1 Lyy Hu5 Luyy.
- assume H7: SNoLev (y * y) :e SNoLev x.
  prove False.
  (** In this case y times y is in SNoL x.
      Also 0 <= y times y so y times y is in SNoL_nonneg x.
      Hence y = sqrt (y times y) is in L giving y < y.
   **)
  claim Lsryy: sqrt_SNo_nonneg (y * y) = y.
  { apply IH (y * y) (SNoS_I2 (y * y) x Lyy Hx H7) Lyynn.
    assume H. apply H.
    assume H10: SNo (sqrt_SNo_nonneg (y * y)).
    assume H11: 0 <= sqrt_SNo_nonneg (y * y).
    assume H12: sqrt_SNo_nonneg (y * y) * sqrt_SNo_nonneg (y * y) = y * y.
    exact SNo_nonneg_sqr_uniq (sqrt_SNo_nonneg (y * y)) y H10 H1 H11 Hynn H12.
  }
  apply SNoLt_irref y.
  prove y < y.
  rewrite <- Lsryy at 1.
  prove sqrt_SNo_nonneg (y * y) < y.
  apply H3.
  prove sqrt_SNo_nonneg (y * y) :e \/_ k :e omega, L_ k.
  claim LyyL0: sqrt_SNo_nonneg (y * y) :e L_ 0.
  { prove sqrt_SNo_nonneg (y * y) :e SNo_sqrtaux x sqrt_SNo_nonneg 0 0.
    rewrite SNo_sqrtaux_0.
    rewrite tuple_2_0_eq.
    prove sqrt_SNo_nonneg (y * y) :e {sqrt_SNo_nonneg w|w :e SNoL_nonneg x}.
    apply ReplI.
    prove y * y :e SNoL_nonneg x.
    prove y * y :e {w :e SNoL x|0 <= w}.
    apply SepI.
    - exact SNoL_I x Hx (y * y) Lyy H7 H6.
    - prove 0 <= y * y. exact Lyynn.
  }
  exact famunionI omega L_ 0 (sqrt_SNo_nonneg (y * y)) (nat_p_omega 0 nat_0) LyyL0.
- assume H7: SNoLev x :e SNoLev (y * y).
  assume H8: SNoEq_ (SNoLev x) (y * y) x.
  assume H9: SNoLev x /:e y * y.
  claim L3: x :e SNoR (y * y).
  { exact SNoR_I (y * y) Lyy x Hx H7 H6. }
  claim L4: forall p:prop, (forall v :e L, forall w :e R, v * y + y * w <= x + v * w -> p) -> p.
  { let p. assume Hp.
    apply mul_SNo_SNoCut_SNoR_interpolate_impred L R L R HLR HLR y y (fun q H => H) (fun q H => H) x L3.
    - let v. assume Hv: v :e L.
      let w. assume Hw: w :e R.
      assume H10: v * y + y * w <= x + v * w.
      exact Hp v Hv w Hw H10.
    - let v. assume Hv: v :e R.
      let w. assume Hw: w :e L.
      assume H10: v * y + y * w <= x + v * w.
      apply Hp w Hw v Hv.
      prove w * y + y * v <= x + w * v.
      claim Lv1: SNo v.
      { exact HR v Hv. }
      claim Lw1: SNo w.
      { exact HL w Hw. }
      rewrite mul_SNo_com w v Lw1 Lv1.
      prove w * y + y * v <= x + v * w.
      apply mul_SNo_com w y Lw1 H1 (fun _ u => u + y * v <= x + v * w).
      prove y * w + y * v <= x + v * w.
      apply mul_SNo_com y v H1 Lv1 (fun _ u => y * w + u <= x + v * w).
      prove y * w + v * y <= x + v * w.
      apply add_SNo_com (y * w) (v * y) (SNo_mul_SNo y w H1 Lw1) (SNo_mul_SNo v y Lv1 H1) (fun _ u => u <= x + v * w).
      exact H10.
  }
  apply L4.
  let v. assume Hv: v :e L.
  let w. assume Hw: w :e R.
  assume H10: v * y + y * w <= x + v * w.
  apply L1L v Hv.
  assume Hv1: SNo v.
  assume Hv2: 0 <= v.
  assume Hv3: v * v < x.
  apply L1R w Hw.
  assume Hw1: SNo w.
  assume Hw2: 0 <= w.
  assume Hw3: x < w * w.
  claim L5: exists k, nat_p k /\ v :e L_ k /\ w :e R_ k.
  { apply famunionE omega L_ v Hv.
    let k'. assume H. apply H.
    assume Hk'1: k' :e omega.
    assume Hk'2: v :e L_ k'.
    apply famunionE omega R_ w Hw.
    let k''. assume H. apply H.
    assume Hk''1: k'' :e omega.
    assume Hk''2: w :e R_ k''.
    apply ordinal_linear k' k'' (nat_p_ordinal k' (omega_nat_p k' Hk'1)) (nat_p_ordinal k'' (omega_nat_p k'' Hk''1)).
    - assume H1: k' c= k''.
      witness k''.
      apply and3I.
      + exact omega_nat_p k'' Hk''1.
      + prove v :e L_ k''.
        exact LL_mon k' k'' (omega_nat_p k' Hk'1) (omega_nat_p k'' Hk''1) H1 v Hk'2.
      + exact Hk''2.
    - assume H1: k'' c= k'.
      witness k'.
      apply and3I.
      + exact omega_nat_p k' Hk'1.
      + exact Hk'2.
      + prove w :e R_ k'.
        exact LR_mon k'' k' (omega_nat_p k'' Hk''1) (omega_nat_p k' Hk'1) H1 w Hk''2.
  }
  apply L5. let k. assume H. apply H. assume H. apply H.
  assume Hk: nat_p k.
  assume Hvk: v :e L_ k.
  assume Hwk: w :e R_ k.
  claim Lvwpos: 0 < v + w.
  { apply SNoLeLt_tra 0 v (v + w) SNo_0 Hv1 (SNo_add_SNo v w Hv1 Hw1) Hv2.
    prove v < v + w.
    rewrite <- add_SNo_0R v Hv1 at 1.
    prove v + 0 < v + w.
    apply add_SNo_Lt2 v 0 w Hv1 SNo_0 Hw1.
    prove 0 < w.
    apply SNoLeLt_tra 0 y w SNo_0 H1 Hw1 Hynn.
    prove y < w. apply H4.
    prove w :e R.
    exact famunionI omega R_ k w (nat_p_omega k Hk) Hwk.
  }
  claim Lvw0: v + w <> 0.
  { assume H. apply SNoLt_irref 0. rewrite <- H at 2. exact Lvwpos. }
  claim L6: (x + v * w) :/: (v + w) :e L_ (ordsucc k).
  { prove (x + v * w) :/: (v + w) :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k) 0.
    rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k Hk.
    rewrite tuple_2_0_eq.
    prove (x + v * w) :/: (v + w) :e L_ k :\/: SNo_sqrtauxset (L_ k) (R_ k) x.
    apply binunionI2.
    exact SNo_sqrtauxset_I (L_ k) (R_ k) x v Hvk w Hwk Lvwpos.
  }
  claim L7: (x + v * w) :/: (v + w) :e L.
  { exact famunionI omega L_ (ordsucc k) ((x + v * w) :/: (v + w)) (nat_p_omega (ordsucc k) (nat_ordsucc k Hk)) L6. }
  claim L8: (x + v * w) :/: (v + w) < y.
  { exact H3 ((x + v * w) :/: (v + w)) L7. }
  claim L9: v * y + y * w = y * (v + w).
  { transitivity y * v + y * w.
    - f_equal. prove v * y = y * v. exact mul_SNo_com v y Hv1 H1.
    - prove y * v + y * w = y * (v + w).
      symmetry.
      exact mul_SNo_distrL y v w H1 Hv1 Hw1.
  }
  prove False.
  apply SNoLt_irref (v * y + y * w).
  apply SNoLeLt_tra (v * y + y * w) (x + v * w) (v * y + y * w)
                    (SNo_add_SNo (v * y) (y * w) (SNo_mul_SNo v y Hv1 H1) (SNo_mul_SNo y w H1 Hw1))
                    (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                    (SNo_add_SNo (v * y) (y * w) (SNo_mul_SNo v y Hv1 H1) (SNo_mul_SNo y w H1 Hw1))
                    H10.
  prove x + v * w < v * y + y * w.
  rewrite L9.
  prove x + v * w < y * (v + w).
  rewrite <- mul_div_SNo_invL (x + v * w) (v + w)
                    (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                    (SNo_add_SNo v w Hv1 Hw1)
                    Lvw0.
  prove ((x + v * w) :/: (v + w)) * (v + w) < y * (v + w).
  exact pos_mul_SNo_Lt' ((x + v * w) :/: (v + w)) y (v + w)
                        (SNo_div_SNo (x + v * w) (v + w)
                          (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                          (SNo_add_SNo v w Hv1 Hw1))
                        H1
                        (SNo_add_SNo v w Hv1 Hw1)
                        Lvwpos
                        L8.
Qed.

Theorem sqrt_SNo_nonneg_prop1e: forall x, SNo x -> 0 <= x
  -> (forall w :e SNoS_ (SNoLev x), 0 <= w -> SNo (sqrt_SNo_nonneg w) /\ 0 <= sqrt_SNo_nonneg w /\ sqrt_SNo_nonneg w * sqrt_SNo_nonneg w = w)
  -> SNoCutP (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0) (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1)
  -> 0 <= G x sqrt_SNo_nonneg
  -> x < G x sqrt_SNo_nonneg * G x sqrt_SNo_nonneg
  -> False.
let x.
assume Hx Hxnonneg IH HLR.
set L_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
set R_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 1.
set L := \/_ k :e omega, L_ k.
set R := \/_ k :e omega, R_ k.
set y := SNoCut L R.
assume Hynn: 0 <= y.
assume H6: x < y * y.
apply HLR.
assume HLHR. apply HLHR.
assume HL: forall w :e L, SNo w.
assume HR: forall z :e R, SNo z.
assume HLR': forall w :e L, forall z :e R, w < z.
apply SNoCutP_SNoCut_impred L R HLR.
assume H1: SNo y.
assume H2: SNoLev y :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume H3: forall w :e L, w < y.
assume H4: forall z :e R, y < z.
assume H5: forall u, SNo u -> (forall w :e L, w < u) -> (forall z :e R, u < z) -> SNoLev y c= SNoLev u /\ SNoEq_ (SNoLev y) y u.
claim Lyy: SNo (y * y).
{ exact SNo_mul_SNo y y H1 H1. }
claim Lyynn: 0 <= y * y.
{ exact mul_SNo_nonneg_nonneg y y H1 H1 Hynn Hynn. }
claim LL_mon: forall k k', nat_p k -> nat_p k' -> k c= k' -> L_ k c= L_ k'.
{ let k k'. assume Hk Hk' Hkk'.
  apply SNo_sqrtaux_mon x sqrt_SNo_nonneg k Hk k' Hk' Hkk'.
  assume H _. exact H.
}
claim LR_mon: forall k k', nat_p k -> nat_p k' -> k c= k' -> R_ k c= R_ k'.
{ let k k'. assume Hk Hk' Hkk'.
  apply SNo_sqrtaux_mon x sqrt_SNo_nonneg k Hk k' Hk' Hkk'.
  assume _ H. exact H.
}
claim L1: forall k, nat_p k ->
              (forall y :e L_ k, SNo y /\ 0 <= y /\ y * y < x)
           /\ (forall y :e R_ k, SNo y /\ 0 <= y /\ x < y * y).
{ exact sqrt_SNo_nonneg_prop1a x Hx Hxnonneg IH. }
claim L1L: forall w :e L, forall p:prop, (SNo w -> 0 <= w -> w * w < x -> p) -> p.
{ let w. assume Hw. let p. assume Hp.
  apply famunionE_impred omega L_ w Hw.
  let k. assume Hk: k :e omega.
  assume H1: w :e L_ k.
  apply L1 k (omega_nat_p k Hk).
  assume H2 _.
  apply H2 w H1.
  assume H3. apply H3.
  exact Hp.
}
claim L1R: forall z :e R, forall p:prop, (SNo z -> 0 <= z -> x < z * z -> p) -> p.
{ let z. assume Hz. let p. assume Hp.
  apply famunionE_impred omega R_ z Hz.
  let k. assume Hk: k :e omega.
  assume H1: z :e R_ k.
  apply L1 k (omega_nat_p k Hk).
  assume _ H2.
  apply H2 z H1.
  assume H3. apply H3.
  exact Hp.
}
apply SNoLtE x (y * y) Hx Lyy H6.
- let u.
  assume Hu1: SNo u.
  assume Hu2: SNoLev u :e SNoLev x :/\: SNoLev (y * y).
  assume Hu3: SNoEq_ (SNoLev u) u x.
  assume Hu4: SNoEq_ (SNoLev u) u (y * y).
  assume Hu5: x < u.
  assume Hu6: u < y * y.
  prove False.
  claim Lunn: 0 <= u.
  { apply SNoLtLe.
    exact SNoLeLt_tra 0 x u SNo_0 Hx Hu1 Hxnonneg Hu5.
  }
  claim LuSx: u :e SNoS_ (SNoLev x).
  { apply SNoS_I2 u x Hu1 Hx.
    prove SNoLev u :e SNoLev x.
    exact binintersectE1 (SNoLev x) (SNoLev (y * y)) (SNoLev u) Hu2.
  }
  apply IH u LuSx Lunn. assume H. apply H.
  assume H7: SNo (sqrt_SNo_nonneg u).
  assume H8: 0 <= sqrt_SNo_nonneg u.
  assume H9: sqrt_SNo_nonneg u * sqrt_SNo_nonneg u = u.
  claim Lysru: y <= sqrt_SNo_nonneg u.
  { apply SNoLtLe.
    prove y < sqrt_SNo_nonneg u.
    apply H4.
    prove sqrt_SNo_nonneg u :e R.
    claim Lysru0: sqrt_SNo_nonneg u :e R_ 0.
    { prove sqrt_SNo_nonneg u :e SNo_sqrtaux x sqrt_SNo_nonneg 0 1.
      rewrite SNo_sqrtaux_0.
      rewrite tuple_2_1_eq.
      prove sqrt_SNo_nonneg u :e {sqrt_SNo_nonneg w|w :e SNoR x}.
      apply ReplI.
      apply SNoR_I x Hx u Hu1.
      - exact binintersectE1 (SNoLev x) (SNoLev (y * y)) (SNoLev u) Hu2.
      - prove x < u. exact Hu5.
    }
    exact famunionI omega R_ 0 (sqrt_SNo_nonneg u) (nat_p_omega 0 nat_0) Lysru0.
  }
  apply SNoLt_irref u.
  prove u < u.
  apply SNoLtLe_tra u (y * y) u Hu1 Lyy Hu1 Hu6.
  prove y * y <= u.
  rewrite <- H9.
  prove y * y <= sqrt_SNo_nonneg u * sqrt_SNo_nonneg u.
  exact nonneg_mul_SNo_Le2 y y (sqrt_SNo_nonneg u) (sqrt_SNo_nonneg u) H1 H1 H7 H7 Hynn Hynn Lysru Lysru.
- assume H7: SNoLev x :e SNoLev (y * y).
  assume H8: SNoEq_ (SNoLev x) x (y * y).
  assume H9: SNoLev x :e y * y.
  claim L10: x :e SNoL (y * y).
  { exact SNoL_I (y * y) Lyy x Hx H7 H6. }
  apply mul_SNo_SNoCut_SNoL_interpolate_impred L R L R HLR HLR y y (fun q H => H) (fun q H => H) x L10.
  + let v. assume Hv: v :e L.
    let w. assume Hw: w :e L.
    assume H10: x + v * w <= v * y + y * w.
    apply L1L v Hv.
    assume Hv1: SNo v.
    assume Hv2: 0 <= v.
    assume Hv3: v * v < x.
    apply L1L w Hw.
    assume Hw1: SNo w.
    assume Hw2: 0 <= w.
    assume Hw3: w * w < x.
    apply SNoLtLe_or 0 (v + w) SNo_0 (SNo_add_SNo v w Hv1 Hw1).
    * assume H11: 0 < v + w.
      claim L11: exists k, nat_p k /\ v :e L_ k /\ w :e L_ k.
      { apply famunionE omega L_ v Hv.
        let k'. assume H. apply H.
        assume Hk'1: k' :e omega.
        assume Hk'2: v :e L_ k'.
        apply famunionE omega L_ w Hw.
        let k''. assume H. apply H.
        assume Hk''1: k'' :e omega.
        assume Hk''2: w :e L_ k''.
        apply ordinal_linear k' k'' (nat_p_ordinal k' (omega_nat_p k' Hk'1)) (nat_p_ordinal k'' (omega_nat_p k'' Hk''1)).
        - assume H1: k' c= k''.
          witness k''.
          apply and3I.
          + exact omega_nat_p k'' Hk''1.
          + prove v :e L_ k''.
            exact LL_mon k' k'' (omega_nat_p k' Hk'1) (omega_nat_p k'' Hk''1) H1 v Hk'2.
          + exact Hk''2.
        - assume H1: k'' c= k'.
          witness k'.
          apply and3I.
          + exact omega_nat_p k' Hk'1.
          + exact Hk'2.
          + prove w :e L_ k'.
            exact LL_mon k'' k' (omega_nat_p k'' Hk''1) (omega_nat_p k' Hk'1) H1 w Hk''2.
      }
      apply L11. let k. assume H. apply H. assume H. apply H.
      assume Hk: nat_p k.
      assume Hvk: v :e L_ k.
      assume Hwk: w :e L_ k.
      claim Lvw0: v + w <> 0.
      { assume H. apply SNoLt_irref 0. rewrite <- H at 2. exact H11. }
      claim L12: (x + v * w) :/: (v + w) :e R_ (ordsucc k).
      { prove (x + v * w) :/: (v + w) :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k) 1.
        rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k Hk.
        rewrite tuple_2_1_eq.
        prove (x + v * w) :/: (v + w) :e R_ k :\/: SNo_sqrtauxset (L_ k) (L_ k) x :\/: SNo_sqrtauxset (R_ k) (R_ k) x.
        apply binunionI1.
        apply binunionI2.
        exact SNo_sqrtauxset_I (L_ k) (L_ k) x v Hvk w Hwk H11.
      }
      claim L13: (x + v * w) :/: (v + w) :e R.
      { exact famunionI omega R_ (ordsucc k) ((x + v * w) :/: (v + w)) (nat_p_omega (ordsucc k) (nat_ordsucc k Hk)) L12. }
      claim L14: y < (x + v * w) :/: (v + w).
      { exact H4 ((x + v * w) :/: (v + w)) L13. }
      claim L15: v * y + y * w = y * (v + w).
      { transitivity y * v + y * w.
        - f_equal. prove v * y = y * v. exact mul_SNo_com v y Hv1 H1.
        - prove y * v + y * w = y * (v + w).
          symmetry.
          exact mul_SNo_distrL y v w H1 Hv1 Hw1.
      }
      prove False.
      apply SNoLt_irref (x + v * w).
      apply SNoLeLt_tra (x + v * w) (v * y + y * w) (x + v * w)
                        (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                        (SNo_add_SNo (v * y) (y * w) (SNo_mul_SNo v y Hv1 H1) (SNo_mul_SNo y w H1 Hw1))
                        (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                        H10.
      prove v * y + y * w < x + v * w.
      rewrite L15.
      prove y * (v + w) < x + v * w.
      rewrite <- mul_div_SNo_invL (x + v * w) (v + w)
                        (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                        (SNo_add_SNo v w Hv1 Hw1)
                        Lvw0.
      prove y * (v + w) < ((x + v * w) :/: (v + w)) * (v + w).
      exact pos_mul_SNo_Lt' y ((x + v * w) :/: (v + w)) (v + w)
                            H1
                            (SNo_div_SNo (x + v * w) (v + w)
                              (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                              (SNo_add_SNo v w Hv1 Hw1))
                            (SNo_add_SNo v w Hv1 Hw1)
                            H11
                            L14.
    * assume H11: v + w <= 0.
      claim L16: v = 0 /\ w = 0.
      { apply SNoLtLe_or 0 v SNo_0 Hv1.
        - assume H12: 0 < v. prove False.
          apply SNoLt_irref 0.
          apply SNoLtLe_tra 0 v 0 SNo_0 Hv1 SNo_0 H12.
          prove v <= 0.
          apply SNoLe_tra v (v + w) 0 Hv1 (SNo_add_SNo v w Hv1 Hw1) SNo_0.
          + prove v <= v + w.
            rewrite <- add_SNo_0R v Hv1 at 1.
            prove v + 0 <= v + w.
            exact add_SNo_Le2 v 0 w Hv1 SNo_0 Hw1 Hw2.
          + prove v + w <= 0. exact H11.
        - assume H12: v <= 0.
          apply SNoLtLe_or 0 w SNo_0 Hw1.
          + assume H13: 0 < w. prove False.
            apply SNoLt_irref 0.
            apply SNoLtLe_tra 0 w 0 SNo_0 Hw1 SNo_0 H13.
            prove w <= 0.
            apply SNoLe_tra w (v + w) 0 Hw1 (SNo_add_SNo v w Hv1 Hw1) SNo_0.
            * prove w <= v + w.
              rewrite <- add_SNo_0L w Hw1 at 1.
              prove 0 + w <= v + w.
              exact add_SNo_Le1 0 w v SNo_0 Hw1 Hv1 Hv2.
            * prove v + w <= 0. exact H11.
          + assume H13: w <= 0.
            apply andI.
            * exact SNoLe_antisym v 0 Hv1 SNo_0 H12 Hv2.
            * exact SNoLe_antisym w 0 Hw1 SNo_0 H13 Hw2.
      }
      apply L16.
      assume Hv0: v = 0.
      assume Hw0: w = 0.
      claim L17: x + v * w = x.
      { rewrite Hv0. rewrite mul_SNo_zeroL w Hw1. exact add_SNo_0R x Hx. }
      claim L18: v * y + y * w = 0.
      { rewrite Hv0.
        prove 0 * y + y * w = 0.
        apply mul_SNo_zeroL y H1 (fun _ u => u + y * w = 0).
        rewrite Hw0.
        prove 0 + y * 0 = 0.
        apply mul_SNo_zeroR y H1 (fun _ u => 0 + u = 0).
        exact add_SNo_0L 0 SNo_0.
      }
      claim L19: x <= 0.
      { rewrite <- L17. rewrite <- L18. exact H10. }
      claim L20: x = 0.
      { exact SNoLe_antisym x 0 Hx SNo_0 L19 Hxnonneg. }
      apply SNoLt_irref (v * v).
      prove v * v < v * v.
      rewrite Hv0 at 3.
      prove v * v < 0 * v.
      rewrite mul_SNo_zeroL v Hv1.
      prove v * v < 0.
      rewrite <- L20. exact Hv3.
  + let v. assume Hv: v :e R.
    let w. assume Hw: w :e R.
    assume H10: x + v * w <= v * y + y * w.
    apply L1R v Hv.
    assume Hv1: SNo v.
    assume Hv2: 0 <= v.
    assume Hv3: x < v * v.
    apply L1R w Hw.
    assume Hw1: SNo w.
    assume Hw2: 0 <= w.
    assume Hw3: x < w * w.
    claim L21: exists k, nat_p k /\ v :e R_ k /\ w :e R_ k.
    { apply famunionE omega R_ v Hv.
      let k'. assume H. apply H.
      assume Hk'1: k' :e omega.
      assume Hk'2: v :e R_ k'.
      apply famunionE omega R_ w Hw.
      let k''. assume H. apply H.
      assume Hk''1: k'' :e omega.
      assume Hk''2: w :e R_ k''.
      apply ordinal_linear k' k'' (nat_p_ordinal k' (omega_nat_p k' Hk'1)) (nat_p_ordinal k'' (omega_nat_p k'' Hk''1)).
      - assume H1: k' c= k''.
        witness k''.
        apply and3I.
        + exact omega_nat_p k'' Hk''1.
        + prove v :e R_ k''.
          exact LR_mon k' k'' (omega_nat_p k' Hk'1) (omega_nat_p k'' Hk''1) H1 v Hk'2.
        + exact Hk''2.
      - assume H1: k'' c= k'.
        witness k'.
        apply and3I.
        + exact omega_nat_p k' Hk'1.
        + exact Hk'2.
        + prove w :e R_ k'.
          exact LR_mon k'' k' (omega_nat_p k'' Hk''1) (omega_nat_p k' Hk'1) H1 w Hk''2.
    }
    apply L21. let k. assume H. apply H. assume H. apply H.
    assume Hk: nat_p k.
    assume Hvk: v :e R_ k.
    assume Hwk: w :e R_ k.
    claim Lvwpos: 0 < v + w.
    { apply SNoLeLt_tra 0 v (v + w) SNo_0 Hv1 (SNo_add_SNo v w Hv1 Hw1) Hv2.
      prove v < v + w.
      rewrite <- add_SNo_0R v Hv1 at 1.
      prove v + 0 < v + w.
      apply add_SNo_Lt2 v 0 w Hv1 SNo_0 Hw1.
      prove 0 < w.
      apply SNoLeLt_tra 0 y w SNo_0 H1 Hw1 Hynn.
      prove y < w. apply H4.
      prove w :e R.
      exact famunionI omega R_ k w (nat_p_omega k Hk) Hwk.
    }
    claim Lvw0: v + w <> 0.
    { assume H. apply SNoLt_irref 0. rewrite <- H at 2. exact Lvwpos. }
    claim L22: (x + v * w) :/: (v + w) :e R_ (ordsucc k).
    { prove (x + v * w) :/: (v + w) :e SNo_sqrtaux x sqrt_SNo_nonneg (ordsucc k) 1.
      rewrite SNo_sqrtaux_S x sqrt_SNo_nonneg k Hk.
      rewrite tuple_2_1_eq.
      prove (x + v * w) :/: (v + w) :e R_ k :\/: SNo_sqrtauxset (L_ k) (L_ k) x :\/: SNo_sqrtauxset (R_ k) (R_ k) x.
      apply binunionI2.
      exact SNo_sqrtauxset_I (R_ k) (R_ k) x v Hvk w Hwk Lvwpos.
    }
    claim L23: (x + v * w) :/: (v + w) :e R.
    { exact famunionI omega R_ (ordsucc k) ((x + v * w) :/: (v + w)) (nat_p_omega (ordsucc k) (nat_ordsucc k Hk)) L22. }
    claim L24: y < (x + v * w) :/: (v + w).
    { exact H4 ((x + v * w) :/: (v + w)) L23. }
    claim L25: v * y + y * w = y * (v + w).
    { transitivity y * v + y * w.
      - f_equal. prove v * y = y * v. exact mul_SNo_com v y Hv1 H1.
      - prove y * v + y * w = y * (v + w).
        symmetry.
        exact mul_SNo_distrL y v w H1 Hv1 Hw1.
    }
    prove False.
    apply SNoLt_irref (x + v * w).
    apply SNoLeLt_tra (x + v * w) (v * y + y * w) (x + v * w)
                      (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                      (SNo_add_SNo (v * y) (y * w) (SNo_mul_SNo v y Hv1 H1) (SNo_mul_SNo y w H1 Hw1))
                      (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                      H10.
    prove v * y + y * w < x + v * w.
    rewrite L25.
    prove y * (v + w) < x + v * w.
    rewrite <- mul_div_SNo_invL (x + v * w) (v + w)
                      (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                      (SNo_add_SNo v w Hv1 Hw1)
                      Lvw0.
    prove y * (v + w) < ((x + v * w) :/: (v + w)) * (v + w).
    exact pos_mul_SNo_Lt' y ((x + v * w) :/: (v + w)) (v + w)
                          H1
                          (SNo_div_SNo (x + v * w) (v + w)
                            (SNo_add_SNo x (v * w) Hx (SNo_mul_SNo v w Hv1 Hw1))
                            (SNo_add_SNo v w Hv1 Hw1))
                          (SNo_add_SNo v w Hv1 Hw1)
                          Lvwpos
                          L24.
- assume H7: SNoLev (y * y) :e SNoLev x.
  prove False.
  claim Lsryy: sqrt_SNo_nonneg (y * y) = y.
  { apply IH (y * y) (SNoS_I2 (y * y) x Lyy Hx H7) Lyynn.
    assume H. apply H.
    assume H10: SNo (sqrt_SNo_nonneg (y * y)).
    assume H11: 0 <= sqrt_SNo_nonneg (y * y).
    assume H12: sqrt_SNo_nonneg (y * y) * sqrt_SNo_nonneg (y * y) = y * y.
    exact SNo_nonneg_sqr_uniq (sqrt_SNo_nonneg (y * y)) y H10 H1 H11 Hynn H12.
  }
  apply SNoLt_irref y.
  prove y < y.
  rewrite <- Lsryy at 2.
  prove y < sqrt_SNo_nonneg (y * y).
  apply H4.
  prove sqrt_SNo_nonneg (y * y) :e R.
  claim LyyR0: sqrt_SNo_nonneg (y * y) :e R_ 0.
  { prove sqrt_SNo_nonneg (y * y) :e SNo_sqrtaux x sqrt_SNo_nonneg 0 1.
    rewrite SNo_sqrtaux_0.
    rewrite tuple_2_1_eq.
    prove sqrt_SNo_nonneg (y * y) :e {sqrt_SNo_nonneg w|w :e SNoR x}.
    apply ReplI.
    prove y * y :e SNoR x.
    exact SNoR_I x Hx (y * y) Lyy H7 H6.
  }
  exact famunionI omega R_ 0 (sqrt_SNo_nonneg (y * y)) (nat_p_omega 0 nat_0) LyyR0.
Qed.

Theorem sqrt_SNo_nonneg_prop1: forall x, SNo x -> 0 <= x -> SNo (sqrt_SNo_nonneg x) /\ 0 <= sqrt_SNo_nonneg x /\ sqrt_SNo_nonneg x * sqrt_SNo_nonneg x = x.
apply SNoLev_ind.
let x. assume Hx: SNo x.
assume IH: forall w :e SNoS_ (SNoLev x), 0 <= w -> SNo (sqrt_SNo_nonneg w) /\ 0 <= sqrt_SNo_nonneg w /\ sqrt_SNo_nonneg w * sqrt_SNo_nonneg w = w.
assume Hxnonneg: 0 <= x.
prove SNo (sqrt_SNo_nonneg x) /\ 0 <= sqrt_SNo_nonneg x /\ sqrt_SNo_nonneg x * sqrt_SNo_nonneg x = x.
rewrite sqrt_SNo_nonneg_eq x Hx.
prove SNo (G x sqrt_SNo_nonneg) /\ 0 <= G x sqrt_SNo_nonneg /\ G x sqrt_SNo_nonneg * G x sqrt_SNo_nonneg = x.
set L_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 0.
set R_ : set -> set := fun k => SNo_sqrtaux x sqrt_SNo_nonneg k 1.
set L := \/_ k :e omega, L_ k.
set R := \/_ k :e omega, R_ k.
claim LL_mon: forall k k', nat_p k -> nat_p k' -> k c= k' -> L_ k c= L_ k'.
{ let k k'. assume Hk Hk' Hkk'.
  apply SNo_sqrtaux_mon x sqrt_SNo_nonneg k Hk k' Hk' Hkk'.
  assume H _. exact H.
}
claim LR_mon: forall k k', nat_p k -> nat_p k' -> k c= k' -> R_ k c= R_ k'.
{ let k k'. assume Hk Hk' Hkk'.
  apply SNo_sqrtaux_mon x sqrt_SNo_nonneg k Hk k' Hk' Hkk'.
  assume _ H. exact H.
}
claim L1: forall k, nat_p k ->
              (forall y :e L_ k, SNo y /\ 0 <= y /\ y * y < x)
           /\ (forall y :e R_ k, SNo y /\ 0 <= y /\ x < y * y).
{ exact sqrt_SNo_nonneg_prop1a x Hx Hxnonneg IH. }
claim L1L: forall w :e L, forall p:prop, (SNo w -> 0 <= w -> w * w < x -> p) -> p.
{ let w. assume Hw. let p. assume Hp.
  apply famunionE_impred omega L_ w Hw.
  let k. assume Hk: k :e omega.
  assume H1: w :e L_ k.
  apply L1 k (omega_nat_p k Hk).
  assume H2 _.
  apply H2 w H1.
  assume H3. apply H3.
  exact Hp.
}
claim L1R: forall z :e R, forall p:prop, (SNo z -> 0 <= z -> x < z * z -> p) -> p.
{ let z. assume Hz. let p. assume Hp.
  apply famunionE_impred omega R_ z Hz.
  let k. assume Hk: k :e omega.
  assume H1: z :e R_ k.
  apply L1 k (omega_nat_p k Hk).
  assume _ H2.
  apply H2 z H1.
  assume H3. apply H3.
  exact Hp.
}
claim L2: SNoCutP L R.
{ exact sqrt_SNo_nonneg_prop1b x Hx Hxnonneg L1. }
apply L2.
assume HLHR. apply HLHR.
assume HL: forall w :e L, SNo w.
assume HR: forall z :e R, SNo z.
assume HLR: forall w :e L, forall z :e R, w < z.
set y := SNoCut L R.
apply SNoCutP_SNoCut_impred L R L2.
assume H1: SNo y.
assume H2: SNoLev y :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume H3: forall w :e L, w < y.
assume H4: forall z :e R, y < z.
assume H5: forall u, SNo u -> (forall w :e L, w < u) -> (forall z :e R, u < z) -> SNoLev y c= SNoLev u /\ SNoEq_ (SNoLev y) y u.
claim Lynn: 0 <= y.
{ exact sqrt_SNo_nonneg_prop1c x Hx Hxnonneg L2 L1R. }
prove SNo y /\ 0 <= y /\ y * y = x.
apply and3I.
- prove SNo y. exact H1.
- prove 0 <= y. exact Lynn.
- prove y * y = x.
  claim Lyy: SNo (y * y).
  { exact SNo_mul_SNo y y H1 H1. }
  claim Lyynn: 0 <= y * y.
  { exact mul_SNo_nonneg_nonneg y y H1 H1 Lynn Lynn. }
  apply SNoLt_trichotomy_or_impred (y * y) x Lyy Hx.
  + assume H6: y * y < x. prove False.
    exact sqrt_SNo_nonneg_prop1d x Hx Hxnonneg IH L2 Lynn H6.
  + assume H6: y * y = x. exact H6.
  + assume H6: x < y * y. prove False.
    exact sqrt_SNo_nonneg_prop1e x Hx Hxnonneg IH L2 Lynn H6.
Qed.

End sqrt_SNo_nonneg.

Theorem SNo_sqrtaux_0_1_prop: forall x, SNo x -> 0 <= x ->
  forall k, nat_p k ->
      (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 0, SNo y /\ 0 <= y /\ y * y < x)
   /\ (forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 1, SNo y /\ 0 <= y /\ x < y * y).
let x. assume Hx Hxnonneg.
apply sqrt_SNo_nonneg_prop1a x Hx Hxnonneg.
let w. assume Hw Hwnonneg.
apply SNoS_E2 (SNoLev x) (SNoLev_ordinal x Hx) w Hw. assume Hw1 Hw2 Hw3 Hw4.
exact sqrt_SNo_nonneg_prop1 w Hw3 Hwnonneg.
Qed.

Theorem SNo_sqrtaux_0_prop: forall x, SNo x -> 0 <= x ->
  forall k, nat_p k ->
  forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 0, SNo y /\ 0 <= y /\ y * y < x.
let x. assume Hx Hxnonneg.
let k. assume Hk.
apply SNo_sqrtaux_0_1_prop x Hx Hxnonneg k Hk.
assume H _. exact H.
Qed.

Theorem SNo_sqrtaux_1_prop: forall x, SNo x -> 0 <= x ->
  forall k, nat_p k ->
  forall y :e SNo_sqrtaux x sqrt_SNo_nonneg k 1, SNo y /\ 0 <= y /\ x < y * y.
let x. assume Hx Hxnonneg.
let k. assume Hk.
apply SNo_sqrtaux_0_1_prop x Hx Hxnonneg k Hk.
assume _ H. exact H.
Qed.

Theorem SNo_sqrt_SNo_SNoCutP: forall x, SNo x -> 0 <= x ->
  SNoCutP (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0)
          (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1).
let x. assume Hx Hxnonneg.
apply sqrt_SNo_nonneg_prop1b x Hx Hxnonneg.
exact SNo_sqrtaux_0_1_prop x Hx Hxnonneg.
Qed.

Theorem SNo_sqrt_SNo_nonneg: forall x, SNo x -> 0 <= x -> SNo (sqrt_SNo_nonneg x).
let x. assume Hx Hxnonneg.
apply sqrt_SNo_nonneg_prop1 x Hx Hxnonneg.
assume H _. apply H. assume H _. exact H.
Qed.

Theorem sqrt_SNo_nonneg_nonneg: forall x, SNo x -> 0 <= x -> 0 <= sqrt_SNo_nonneg x.
let x. assume Hx Hxnonneg.
apply sqrt_SNo_nonneg_prop1 x Hx Hxnonneg.
assume H _. apply H. assume _ H. exact H.
Qed.

Theorem sqrt_SNo_nonneg_sqr: forall x, SNo x -> 0 <= x -> sqrt_SNo_nonneg x * sqrt_SNo_nonneg x = x.
let x. assume Hx Hxnonneg.
apply sqrt_SNo_nonneg_prop1 x Hx Hxnonneg.
assume _ H. exact H.
Qed.

Theorem sqrt_SNo_nonneg_0 : sqrt_SNo_nonneg 0 = 0.
rewrite sqrt_SNo_nonneg_eq 0 SNo_0.
set L_ := fun k:set => SNo_sqrtaux 0 sqrt_SNo_nonneg k 0.
set R_ := fun k:set => SNo_sqrtaux 0 sqrt_SNo_nonneg k 1.
set L := \/_ k :e omega, L_ k.
set R := \/_ k :e omega, R_ k.
prove SNoCut L R = 0.
claim L1: forall k, nat_p k -> L_ k = 0 /\ R_ k = 0.
{ apply nat_ind.
  - apply andI.
    + prove L_ 0 = 0.
      prove SNo_sqrtaux 0 sqrt_SNo_nonneg 0 0 = 0.
      rewrite SNo_sqrtaux_0.
      rewrite tuple_2_0_eq.
      prove {sqrt_SNo_nonneg w|w :e SNoL_nonneg 0} = 0.
      rewrite SNoL_nonneg_0.
      exact Repl_Empty sqrt_SNo_nonneg.
    + prove R_ 0 = 0.
      prove SNo_sqrtaux 0 sqrt_SNo_nonneg 0 1 = 0.
      rewrite SNo_sqrtaux_0.
      rewrite tuple_2_1_eq.
      prove {sqrt_SNo_nonneg w|w :e SNoR 0} = 0.
      rewrite SNoR_0.
      exact Repl_Empty sqrt_SNo_nonneg.
  - let k. assume Hk.
    assume IHk. apply IHk.
    assume IHLk: L_ k = 0.
    assume IHRk: R_ k = 0.
    apply andI.
    + prove L_ (ordsucc k) = 0.
      prove SNo_sqrtaux 0 sqrt_SNo_nonneg (ordsucc k) 0 = 0.
      rewrite SNo_sqrtaux_S 0 sqrt_SNo_nonneg k Hk.
      rewrite tuple_2_0_eq.
      prove L_ k :\/: SNo_sqrtauxset (L_ k) (R_ k) 0 = Empty.
      rewrite IHLk.
      prove 0 :\/: SNo_sqrtauxset 0 (R_ k) 0 = Empty.
      apply SNo_sqrtauxset_0 (R_ k) 0 (fun _ u => 0 :\/: u = 0).
      prove 0 :\/: 0 = Empty.
      apply binunion_idl.
    + prove R_ (ordsucc k) = 0.
      prove SNo_sqrtaux 0 sqrt_SNo_nonneg (ordsucc k) 1 = 0.
      rewrite SNo_sqrtaux_S 0 sqrt_SNo_nonneg k Hk.
      rewrite tuple_2_1_eq.
      prove R_ k :\/: SNo_sqrtauxset (L_ k) (L_ k) 0 :\/: SNo_sqrtauxset (R_ k) (R_ k) 0 = Empty.
      rewrite IHLk. rewrite IHRk.
      prove 0 :\/: SNo_sqrtauxset 0 0 0 :\/: SNo_sqrtauxset 0 0 0 = Empty.
      rewrite SNo_sqrtauxset_0 0 0.
      prove 0 :\/: 0 :\/: 0 = Empty.
      rewrite binunion_idl 0.
      prove 0 :\/: 0 = Empty.
      apply binunion_idl.
}
claim L2: L = 0.
{ apply Empty_eq.
  let x. assume Hx: x :e L.
  apply famunionE_impred omega L_ x Hx.
  let k. assume Hk: k :e omega.
  apply L1 k (omega_nat_p k Hk).
  assume H1: L_ k = 0.
  assume _.
  prove x /:e L_ k.
  rewrite H1.
  exact EmptyE x.
}
claim L3: R = 0.
{ apply Empty_eq.
  let x. assume Hx: x :e R.
  apply famunionE_impred omega R_ x Hx.
  let k. assume Hk: k :e omega.
  apply L1 k (omega_nat_p k Hk).
  assume _.
  assume H1: R_ k = 0.
  prove x /:e R_ k.
  rewrite H1.
  exact EmptyE x.
}
rewrite L2. rewrite L3.
exact SNoCut_0_0.
Qed.

Theorem sqrt_SNo_nonneg_1 : sqrt_SNo_nonneg 1 = 1.
rewrite sqrt_SNo_nonneg_eq 1 SNo_1.
set L_ := fun k:set => SNo_sqrtaux 1 sqrt_SNo_nonneg k 0.
set R_ := fun k:set => SNo_sqrtaux 1 sqrt_SNo_nonneg k 1.
set L := \/_ k :e omega, L_ k.
set R := \/_ k :e omega, R_ k.
prove SNoCut L R = 1.
claim L1: forall k, nat_p k -> L_ k = 1 /\ R_ k = 0.
{ apply nat_ind.
  - apply andI.
    + prove L_ 0 = 1.
      prove SNo_sqrtaux 1 sqrt_SNo_nonneg 0 0 = 1.
      rewrite SNo_sqrtaux_0.
      rewrite tuple_2_0_eq.
      prove {sqrt_SNo_nonneg w|w :e SNoL_nonneg 1} = 1.
      rewrite SNoL_nonneg_1.
      prove {sqrt_SNo_nonneg w|w :e 1} = 1.
      apply set_ext.
      * let u. assume Hu: u :e {sqrt_SNo_nonneg w|w :e 1}.
        prove u :e 1.
        apply ReplE_impred 1 sqrt_SNo_nonneg u Hu.
        let w. assume Hw: w :e 1.
        apply cases_1 w Hw.
        rewrite sqrt_SNo_nonneg_0.
        assume Hu0: u = 0.
        rewrite Hu0. exact In_0_1.
      * let u. assume Hu: u :e 1.
        apply cases_1 u Hu.
        prove 0 :e {sqrt_SNo_nonneg w|w :e 1}.
        rewrite <- sqrt_SNo_nonneg_0 at 1.
        apply ReplI. exact In_0_1.
    + prove R_ 0 = 0.
      prove SNo_sqrtaux 1 sqrt_SNo_nonneg 0 1 = 0.
      rewrite SNo_sqrtaux_0.
      rewrite tuple_2_1_eq.
      prove {sqrt_SNo_nonneg w|w :e SNoR 1} = 0.
      rewrite SNoR_1.
      exact Repl_Empty sqrt_SNo_nonneg.
  - let k. assume Hk.
    assume IHk. apply IHk.
    assume IHLk: L_ k = 1.
    assume IHRk: R_ k = 0.
    apply andI.
    + prove L_ (ordsucc k) = 1.
      prove SNo_sqrtaux 1 sqrt_SNo_nonneg (ordsucc k) 0 = 1.
      rewrite SNo_sqrtaux_S 1 sqrt_SNo_nonneg k Hk.
      rewrite tuple_2_0_eq.
      prove L_ k :\/: SNo_sqrtauxset (L_ k) (R_ k) 1 = 1.
      rewrite IHLk. rewrite IHRk.
      prove 1 :\/: SNo_sqrtauxset 1 0 1 = 1.
      rewrite SNo_sqrtauxset_0' 1 1.
      apply binunion_idr.
    + prove R_ (ordsucc k) = 0.
      prove SNo_sqrtaux 1 sqrt_SNo_nonneg (ordsucc k) 1 = 0.
      rewrite SNo_sqrtaux_S 1 sqrt_SNo_nonneg k Hk.
      rewrite tuple_2_1_eq.
      prove R_ k :\/: SNo_sqrtauxset (L_ k) (L_ k) 1 :\/: SNo_sqrtauxset (R_ k) (R_ k) 1 = 0.
      rewrite IHLk. rewrite IHRk.
      prove 0 :\/: SNo_sqrtauxset 1 1 1 :\/: SNo_sqrtauxset 0 0 1 = 0.
      rewrite SNo_sqrtauxset_0 0 1.
      prove 0 :\/: SNo_sqrtauxset 1 1 1 :\/: 0 = 0.
      rewrite binunion_idl (SNo_sqrtauxset 1 1 1).
      rewrite binunion_idr (SNo_sqrtauxset 1 1 1).
      prove SNo_sqrtauxset 1 1 1 = 0.
      apply Empty_eq.
      let u. assume Hu: u :e SNo_sqrtauxset 1 1 1.
      apply SNo_sqrtauxset_E 1 1 1 u Hu.
      let w. assume Hw: w :e 1.
      let z. assume Hz: z :e 1.
      apply cases_1 w Hw.
      apply cases_1 z Hz.
      rewrite add_SNo_0R 0 SNo_0.
      assume H1: 0 < 0.
      prove False.
      apply SNoLt_irref 0.
      exact H1.
}
claim L2: L = 1.
{ apply set_ext.
  - prove L c= 1.
    let x. assume Hx: x :e L.
    apply famunionE_impred omega L_ x Hx.
    let k. assume Hk: k :e omega.
    apply L1 k (omega_nat_p k Hk).
    assume H1: L_ k = 1.
    assume _.
    prove x :e L_ k -> x :e 1.
    rewrite H1.
    assume H2: x :e 1.
    prove x :e 1.
    exact H2.
  - let x. assume Hx: x :e 1.
    apply cases_1 x Hx.
    prove 0 :e L.
    claim L2a: 0 :e L_ 0.
    { apply L1 0 nat_0.
      assume H1: L_ 0 = 1.
      assume _.
      rewrite H1. exact In_0_1.
    }
    prove 0 :e \/_ k :e omega, L_ k.
    exact famunionI omega L_ 0 0 (nat_p_omega 0 nat_0) L2a.
}
claim L3: R = 0.
{ apply Empty_eq.
  let x. assume Hx: x :e R.
  apply famunionE_impred omega R_ x Hx.
  let k. assume Hk: k :e omega.
  apply L1 k (omega_nat_p k Hk).
  assume _.
  assume H1: R_ k = 0.
  prove x /:e R_ k.
  rewrite H1.
  exact EmptyE x.
}
rewrite L2. rewrite L3.
prove SNoCut 1 0 = 1.
rewrite <- SNoL_1 at 1.
rewrite <- SNoR_1 at 2.
prove SNoCut (SNoL 1) (SNoR 1) = 1.
symmetry.
exact SNo_eta 1 SNo_1.
Qed.

End SurrealSqrt.
