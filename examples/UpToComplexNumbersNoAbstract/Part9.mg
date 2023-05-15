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

Section Reals.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix < 490 := SNoLt.
(* Unicode <= "2264" *)
Infix <= 490 := SNoLe.

Infix ^ 342 right := exp_SNo_nat.

Axiom SNoS_omega_drat_intvl : forall x :e SNoS_ omega,
  forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.

Axiom SNoS_ordsucc_omega_bdd_above : forall x :e SNoS_ (ordsucc omega), x < omega -> exists N :e omega, x < N.

Axiom SNoS_ordsucc_omega_bdd_below : forall x :e SNoS_ (ordsucc omega), - omega < x -> exists N :e omega, - N < x.

Axiom SNoS_ordsucc_omega_bdd_drat_intvl : forall x :e SNoS_ (ordsucc omega),
    - omega < x -> x < omega
 -> forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.

(* Parameter real "0d955384652ad934e09a854e236e549b47a140bb15c1ad93b6b63a51593ab579" "e26ffa4403d3e38948f53ead677d97077fe74954ba92c8bb181aba8433e99682" *)
Parameter real : set.

Axiom real_I : forall x :e SNoS_ (ordsucc omega),
    x <> omega
 -> x <> - omega
 -> (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
 -> x :e real.

Axiom real_E : forall x :e real,
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

Axiom real_SNo : forall x :e real, SNo x.

Axiom real_SNoS_omega_prop : forall x :e real, forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x.

Axiom SNoS_omega_real : SNoS_ omega c= real.

Axiom real_0 : 0 :e real.

Axiom real_1 : 1 :e real.

Axiom SNoLev_In_real_SNoS_omega : forall x :e real, forall w, SNo w -> SNoLev w :e SNoLev x -> w :e SNoS_ omega.

Axiom minus_SNo_prereal_1 : forall x, SNo x ->
    (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
 -> (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - - x) < eps_ k) -> q = - x).

Axiom minus_SNo_prereal_2 : forall x, SNo x ->
    (forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k)
 -> (forall k :e omega, exists q :e SNoS_ omega, q < - x /\ - x < q + eps_ k).

Axiom SNo_prereal_incr_lower_pos: forall x, SNo x -> 0 < x
 -> (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
 -> (forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k)
 -> forall k :e omega,
     forall p:prop,
         (forall q :e SNoS_ omega, 0 < q -> q < x -> x < q + eps_ k -> p)
      -> p.

Axiom real_minus_SNo : forall x :e real, - x :e real.

Axiom SNo_prereal_incr_lower_approx: forall x, SNo x ->
    (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
 -> (forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k)
 -> exists f :e SNoS_ omega :^: omega,
       forall n :e omega, f n < x /\ x < f n + eps_ n
                       /\ forall i :e n, f i < f n.

Axiom SNo_prereal_decr_upper_approx: forall x, SNo x ->
    (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)
 -> (forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k)
 -> exists g :e SNoS_ omega :^: omega,
       forall n :e omega, g n + - eps_ n < x /\ x < g n
                       /\ forall i :e n, g n < g i.

Axiom SNoCutP_SNoCut_lim : forall lambda, ordinal lambda
 -> (forall alpha :e lambda, ordsucc alpha :e lambda)
 -> forall L R c= SNoS_ lambda, SNoCutP L R
 -> SNoLev (SNoCut L R) :e ordsucc lambda.

Axiom SNoCutP_SNoCut_omega : forall L R c= SNoS_ omega, SNoCutP L R
 -> SNoLev (SNoCut L R) :e ordsucc omega.

Axiom SNo_approx_real_lem:
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

Axiom SNo_approx_real: forall x, SNo x ->
 forall f g :e SNoS_ omega :^: omega,
     (forall n :e omega, f n < x)
  -> (forall n :e omega, x < f n + eps_ n)
  -> (forall n :e omega, forall i :e n, f i < f n)
  -> (forall n :e omega, x < g n)
  -> (forall n :e omega, forall i :e n, g n < g i)
  -> x = SNoCut {f n|n :e omega} {g n|n :e omega}
  -> x :e real.

Axiom SNo_approx_real_rep : forall x :e real,
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

Axiom real_add_SNo : forall x y :e real, x + y :e real.

Axiom SNoS_ordsucc_omega_bdd_eps_pos : forall x :e SNoS_ (ordsucc omega), 0 < x -> x < omega -> exists N :e omega, eps_ N * x < 1.

Axiom real_mul_SNo_pos : forall x y :e real, 0 < x -> 0 < y -> x * y :e real.

Axiom real_mul_SNo : forall x y :e real, x * y :e real.

Axiom abs_SNo_intvl_bd : forall x y z, SNo x -> SNo y -> SNo z
 -> x <= y -> y < x + z
 -> abs_SNo (y + - x) < z.

Axiom pos_small_real_recip_ex: forall x :e real, 0 < x -> x < 1 -> exists y :e real, x * y = 1.

Axiom pos_real_recip_ex: forall x :e real, 0 < x -> exists y :e real, x * y = 1.

Axiom nonzero_real_recip_ex: forall x :e real, x <> 0 -> exists y :e real, x * y = 1.

Axiom real_Archimedean: forall x y :e real, 0 < x -> 0 <= y -> exists n :e omega, y <= n * x.

Axiom real_complete1: forall a b :e real :^: omega,
    (forall n :e omega, a n <= b n /\ a n <= a (ordsucc n) /\ b (ordsucc n) <= b n)
 -> exists x :e real, forall n :e omega, a n <= x /\ x <= b n.

Axiom real_complete2: forall a b :e real :^: omega,
    (forall n :e omega, a n <= b n /\ a n <= a (n + 1) /\ b (n + 1) <= b n)
 -> exists x :e real, forall n :e omega, a n <= x /\ x <= b n.

End Reals.

(** Part 9 **)

Section ComplexSNo.

Section CTaggedSets.

Let tag : set -> set := fun alpha => SetAdjoin alpha {1}.
Postfix ' 100 := tag.

Let ctag : set -> set := fun alpha => SetAdjoin alpha {2}.

Postfix '' 100 := ctag.

Theorem not_TransSet_Sing2 : ~TransSet {2}.
assume H1: TransSet {2}.
claim L1: 0 :e {2}.
{ exact H1 2 (SingI 2) 0 In_0_2. }
apply neq_0_2.
exact SingE 2 0 L1.
Qed.

Theorem not_ordinal_Sing2 : ~ordinal {2}.
assume H1. apply H1. assume H2 _. exact not_TransSet_Sing2 H2.
Qed.

Theorem ctagged_not_ordinal : forall y, ~ordinal (y '').
let y.
assume H1: ordinal (y '').
claim L1: {2} :e y ''.
{ prove {2} :e y :\/: {{2}}.
  apply binunionI2.
  exact SingI {2}.
}
apply not_ordinal_Sing2.
exact ordinal_Hered (y '') H1 {2} L1.
Qed.

Theorem ctagged_notin_ordinal : forall alpha y, ordinal alpha -> (y '') /:e alpha.
let alpha y.
assume H1 H2.
apply ctagged_not_ordinal y.
exact ordinal_Hered alpha H1 (y '') H2.
Qed.

Theorem Sing2_notin_SingSing1 : {2} /:e {{1}}.
assume H1: {2} :e {{1}}.
claim L1: 1 :e {2}.
{ rewrite SingE {1} {2} H1.
  exact SingI 1.
}
apply neq_1_2.
prove 1 = 2.
exact SingE 2 1 L1.
Qed.

Theorem ctagged_notin_SNo : forall x y, SNo x -> (y '') /:e x.
let x y.
assume Hx: SNo x.
assume Hyc: (y '') :e x.
prove False.
set alpha := SNoLev x.
apply SNoLev_prop x Hx.
assume Ha: ordinal alpha.
assume Hxa: SNo_ alpha x.
apply Hxa.
assume Hxa1: x c= SNoElts_ (SNoLev x).
prove False.
claim L1: y '' :e alpha :\/: {beta '|beta :e alpha}.
{ exact Hxa1 (y '') Hyc. }
apply binunionE alpha {beta '|beta :e alpha} (y '') L1.
- assume H1: y '' :e alpha.
  exact ctagged_notin_ordinal alpha y Ha H1.
- assume H1: y '' :e {beta '|beta :e alpha}.
  apply ReplE_impred alpha (fun beta => beta ') (y '') H1.
  let beta.
  assume Hb: beta :e alpha.
  assume Hyb: y '' = beta '.
  claim Lb: ordinal beta.
  { exact ordinal_Hered alpha Ha beta Hb. }
  claim L2: {2} :e beta '.
  { rewrite <- Hyb.
    prove {2} :e y :\/: {{2}}.
    apply binunionI2.
    exact SingI {2}.
  }
  apply binunionE beta {{1}} {2} L2.
  + assume H2: {2} :e beta.
    apply not_ordinal_Sing2.
    exact ordinal_Hered beta Lb {2} H2.
  + exact Sing2_notin_SingSing1.
Qed.

Theorem ctagged_eqE_Subq : forall x y, SNo x -> SNo y -> forall u :e x, forall v :e y, u '' = v '' -> u c= v.
let x y. assume Hx Hy. let u. assume Hu. let v. assume Hv Huv.
let w. assume Hw: w :e u.
claim L1: w :e v ''.
{ rewrite <- Huv.
  prove w :e u :\/: {{2}}.
  apply binunionI1. exact Hw.
}
apply binunionE v {{2}} w L1.
- assume H1: w :e v. exact H1.
- assume H1: w :e {{2}}. prove False.
  claim L2: w = {2}.
  { exact SingE {2} w H1. }
  claim L3: {2} :e u.
  { rewrite <- L2. exact Hw. }
  set alpha := SNoLev x.
  apply SNoLev_prop x Hx.
  assume Ha: ordinal alpha.
  assume Hxa: SNo_ alpha x.
  apply Hxa.
  assume Hxa1: x c= SNoElts_ alpha.
  prove False.
  apply binunionE alpha {beta '|beta :e alpha} u (Hxa1 u Hu).
  + assume H2: u :e alpha.
    claim Lu: ordinal u.
    { exact ordinal_Hered alpha Ha u H2. }
    apply not_ordinal_Sing2.
    exact ordinal_Hered u Lu {2} L3.
  + assume H2: u :e {beta '|beta :e alpha}.
    apply ReplE_impred alpha (fun beta => beta ') u H2.
    let beta. assume Hb: beta :e alpha. assume Hub: u = beta '.
    claim Lb: ordinal beta.
    { exact ordinal_Hered alpha Ha beta Hb. }
    claim L4: {2} :e beta '.
    { rewrite <- Hub. exact L3. }
    apply binunionE beta {{1}} {2} L4.
    * assume H3: {2} :e beta.
      apply not_ordinal_Sing2.
      exact ordinal_Hered beta Lb {2} H3.
    * exact Sing2_notin_SingSing1.
Qed.

Theorem ctagged_eqE_eq : forall x y, SNo x -> SNo y -> forall u :e x, forall v :e y, u '' = v '' -> u = v.
let x y. assume Hx Hy. let u. assume Hu. let v. assume Hv Huv.
apply set_ext.
- exact ctagged_eqE_Subq x y Hx Hy u Hu v Hv Huv.
- apply ctagged_eqE_Subq y x Hy Hx v Hv u Hu. symmetry. exact Huv.
Qed.

Definition SNo_pair : set -> set -> set := fun x y => x :\/: {u ''| u :e y}.

Theorem SNo_pair_prop_1_Subq : forall x1 y1 x2 y2, SNo x1 -> SNo_pair x1 y1 = SNo_pair x2 y2 -> x1 c= x2.
let x1 y1 x2 y2.
assume Hx1.
assume H1: SNo_pair x1 y1 = SNo_pair x2 y2.
let v. assume Hv: v :e x1.
claim L1: v :e SNo_pair x2 y2.
{ rewrite <- H1.
  prove v :e x1 :\/: {u ''|u :e y1}.
  apply binunionI1.
  exact Hv.
}
apply binunionE x2 {u ''|u :e y2} v L1.
- assume H2: v :e x2. exact H2.
- assume H2: v :e {u ''|u :e y2}. prove False.
  apply ReplE_impred y2 (fun u => u '') v H2.
  let u. assume Hu: u :e y2.
  assume Hvu: v = u ''.
  apply ctagged_notin_SNo x1 u Hx1.
  prove u '' :e x1.
  rewrite <- Hvu. exact Hv.
Qed.

Theorem SNo_pair_prop_1 : forall x1 y1 x2 y2, SNo x1 -> SNo x2 -> SNo_pair x1 y1 = SNo_pair x2 y2 -> x1 = x2.
let x1 y1 x2 y2.
assume Hx1 Hx2.
assume H1: SNo_pair x1 y1 = SNo_pair x2 y2.
apply set_ext.
- exact SNo_pair_prop_1_Subq x1 y1 x2 y2 Hx1 H1.
- apply SNo_pair_prop_1_Subq x2 y2 x1 y1 Hx2.
  symmetry. exact H1.
Qed.

Theorem SNo_pair_prop_2_Subq : forall x1 y1 x2 y2, SNo y1 -> SNo x2 -> SNo y2 -> SNo_pair x1 y1 = SNo_pair x2 y2 -> y1 c= y2.
let x1 y1 x2 y2.
assume Hy1 Hx2 Hy2.
assume H1: SNo_pair x1 y1 = SNo_pair x2 y2.
let v. assume Hv: v :e y1.
claim L1: v '' :e SNo_pair x2 y2.
{ rewrite <- H1.
  prove v '' :e x1 :\/: {u ''|u :e y1}.
  apply binunionI2.
  prove v '' :e {u ''|u :e y1}.
  exact ReplI y1 (fun u => u '') v Hv.
}
apply binunionE x2 {u ''|u :e y2} (v '') L1.
- assume H2: v '' :e x2. prove False.
  exact ctagged_notin_SNo x2 v Hx2 H2.
- assume H2: v '' :e {u ''|u :e y2}.
  apply ReplE_impred y2 (fun u => u '') (v '') H2.
  let u. assume Hu: u :e y2.
  assume Hvu: v '' = u ''.
  claim L2: v = u.
  { exact ctagged_eqE_eq y1 y2 Hy1 Hy2 v Hv u Hu Hvu. }
  prove v :e y2. rewrite L2. exact Hu.
Qed.

Theorem SNo_pair_prop_2 : forall x1 y1 x2 y2, SNo x1 -> SNo y1 -> SNo x2 -> SNo y2 -> SNo_pair x1 y1 = SNo_pair x2 y2 -> y1 = y2.
let x1 y1 x2 y2.
assume Hx1 Hy1 Hx2 Hy2.
assume H1: SNo_pair x1 y1 = SNo_pair x2 y2.
apply set_ext.
- exact SNo_pair_prop_2_Subq x1 y1 x2 y2 Hy1 Hx2 Hy2 H1.
- apply SNo_pair_prop_2_Subq x2 y2 x1 y1 Hy2 Hx1 Hy1.
  symmetry. exact H1.
Qed.

Theorem SNo_pair_0 : forall x, SNo_pair x 0 = x.
let x.
prove x :\/: {u ''|u :e 0} = x.
rewrite Repl_Empty (fun u => u '').
prove x :\/: 0 = x.
exact binunion_idr x.
Qed.

End CTaggedSets.

Definition CSNo : set -> prop := fun z => exists x, SNo x /\ exists y, SNo y /\ z = SNo_pair x y.

Theorem CSNo_I : forall x y, SNo x -> SNo y -> CSNo (SNo_pair x y).
let x y. assume Hx Hy.
prove exists x', SNo x' /\ exists y', SNo y' /\ SNo_pair x y = SNo_pair x' y'.
witness x. apply andI.
- exact Hx.
- witness y. apply andI.
  + exact Hy.
  + reflexivity.
Qed.

Theorem CSNo_E : forall z, CSNo z ->
  forall p:set -> prop,
      (forall x y, SNo x -> SNo y -> z = SNo_pair x y -> p (SNo_pair x y))
    -> p z.
let z. assume Hz. let p. assume Hp.
apply Hz.
let x. assume H1. apply H1.
assume Hx. assume H1. apply H1.
let y. assume H1. apply H1.
assume Hy Hzxy.
rewrite Hzxy.
exact Hp x y Hx Hy Hzxy.
Qed.

Theorem SNo_CSNo : forall x, SNo x -> CSNo x.
let x. assume Hx.
prove exists x', SNo x' /\ exists y, SNo y /\ x = SNo_pair x' y.
witness x. apply andI.
- exact Hx.
- witness 0. apply andI.
  + exact SNo_0.
  + symmetry. exact SNo_pair_0 x.
Qed.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.

Definition Complex_i : set := SNo_pair 0 1.
Definition CSNo_Re : set -> set := fun z => Eps_i (fun x => SNo x /\ exists y, SNo y /\ z = SNo_pair x y).
Definition CSNo_Im : set -> set := fun z => Eps_i (fun y => SNo y /\ z = SNo_pair (CSNo_Re z) y).

Let i := Complex_i.
Let Re : set -> set := CSNo_Re.
Let Im : set -> set := CSNo_Im.
Let pa : set -> set -> set := SNo_pair.

Theorem CSNo_Re1: forall z, CSNo z -> SNo (Re z) /\ exists y, SNo y /\ z = pa (Re z) y.
let z. assume Hz.
apply Eps_i_ex (fun x => SNo x /\ exists y, SNo y /\ z = pa x y).
prove exists x, SNo x /\ exists y, SNo y /\ z = pa x y.
exact Hz.
Qed.

Theorem CSNo_Re2: forall x y, SNo x -> SNo y -> Re (pa x y) = x.
let x y. assume Hx Hy.
apply CSNo_Re1 (pa x y) (CSNo_I x y Hx Hy).
assume H1: SNo (Re (pa x y)).
assume H2: exists y', SNo y' /\ pa x y = pa (Re (pa x y)) y'.
apply H2.
let y'. assume H3. apply H3.
assume Hy': SNo y'.
assume H4: pa x y = pa (Re (pa x y)) y'.
symmetry.
exact SNo_pair_prop_1 x y (Re (pa x y)) y' Hx H1 H4.
Qed.

Theorem CSNo_Im1: forall z, CSNo z -> SNo (Im z) /\ z = pa (Re z) (Im z).
let z. assume Hz.
apply Eps_i_ex (fun y => SNo y /\ z = pa (Re z) y).
prove exists y, SNo y /\ z = pa (Re z) y.
apply CSNo_E z Hz.
let x y. assume Hx Hy.
assume Hzxy: z = pa x y.
witness y. apply andI.
- exact Hy.
- prove pa x y = pa (Re (pa x y)) y.
  apply CSNo_Re2 x y Hx Hy (fun u v => pa x y = pa v y).
  prove pa x y = pa x y.
  reflexivity.
Qed.

Theorem CSNo_Im2: forall x y, SNo x -> SNo y -> Im (pa x y) = y.
let x y. assume Hx Hy.
symmetry.
apply CSNo_Im1 (pa x y) (CSNo_I x y Hx Hy).
assume H1: SNo (Im (pa x y)).
apply CSNo_Re2 x y Hx Hy (fun u v => pa x y = pa v (Im (pa x y)) -> y = Im (pa x y)).
assume H2: pa x y = pa x (Im (pa x y)).
exact SNo_pair_prop_2 x y x (Im (pa x y)) Hx Hy Hx H1 H2.
Qed.

Theorem CSNo_ReR: forall z, CSNo z -> SNo (Re z).
let z. assume Hz. apply CSNo_Re1 z Hz. exact (fun H _ => H).
Qed.

Theorem CSNo_ImR: forall z, CSNo z -> SNo (Im z).
let z. assume Hz. apply CSNo_Im1 z Hz. exact (fun H _ => H).
Qed.

Theorem CSNo_ReIm: forall z, CSNo z -> z = pa (Re z) (Im z).
let z. assume Hz. apply CSNo_Im1 z Hz. exact (fun _ H => H).
Qed.

Theorem CSNo_ReIm_split: forall z w, CSNo z -> CSNo w -> Re z = Re w -> Im z = Im w -> z = w.
let z w. assume Hz Hw.
assume H1 H2.
transitivity (pa (Re z) (Im z)).
- exact CSNo_ReIm z Hz.
- transitivity (pa (Re w) (Im w)).
  + rewrite H1. rewrite H2. reflexivity.
  + symmetry. exact CSNo_ReIm w Hw.
Qed.

Definition minus_CSNo : set -> set := fun z => pa (- Re z) (- Im z).
Definition add_CSNo : set -> set -> set := fun z w => pa (Re z + Re w) (Im z + Im w).
Definition mul_CSNo : set -> set -> set := fun z w => pa (Re z * Re w + - (Im z * Im w)) (Re z * Im w + Im z * Re w).

Let plus' := add_CSNo.
Let mult' := mul_CSNo.

Prefix :-: 358 := minus_CSNo.
Infix :+: 360 right := add_CSNo.
Infix :*: 355 right := mul_CSNo.

Theorem CSNo_Complex_i : CSNo i.
prove CSNo (pa 0 1).
apply CSNo_I.
- exact SNo_0.
- exact SNo_1.
Qed.

Theorem minus_CSNo_CRe: forall z, CSNo z -> Re (:-: z) = - Re z.
let z. assume Hz.
exact CSNo_Re2 (- Re z) (- Im z)
               (SNo_minus_SNo (Re z) (CSNo_ReR z Hz))
               (SNo_minus_SNo (Im z) (CSNo_ImR z Hz)).
Qed.

Theorem minus_CSNo_CIm: forall z, CSNo z -> Im (:-: z) = - Im z.
let z. assume Hz.
exact CSNo_Im2 (- Re z) (- Im z)
               (SNo_minus_SNo (Re z) (CSNo_ReR z Hz))
               (SNo_minus_SNo (Im z) (CSNo_ImR z Hz)).
Qed.

Theorem add_CSNo_CRe: forall z w, CSNo z -> CSNo w -> Re (plus' z w) = Re z + Re w.
let z w. assume Hz Hw.
exact CSNo_Re2 (Re z + Re w) (Im z + Im w)
               (SNo_add_SNo (Re z) (Re w) (CSNo_ReR z Hz) (CSNo_ReR w Hw))
               (SNo_add_SNo (Im z) (Im w) (CSNo_ImR z Hz) (CSNo_ImR w Hw)).
Qed.

Theorem add_CSNo_CIm: forall z w, CSNo z -> CSNo w -> Im (plus' z w) = Im z + Im w.
let z w. assume Hz Hw.
exact CSNo_Im2 (Re z + Re w) (Im z + Im w) 
               (SNo_add_SNo (Re z) (Re w) (CSNo_ReR z Hz) (CSNo_ReR w Hw))
               (SNo_add_SNo (Im z) (Im w) (CSNo_ImR z Hz) (CSNo_ImR w Hw)).
Qed.

Theorem CSNo_minus_CSNo : forall z, CSNo z -> CSNo (minus_CSNo z).
let z. assume Hz.
prove CSNo (pa (- Re z) (- Im z)).
apply CSNo_I.
- apply SNo_minus_SNo. apply CSNo_ReR. exact Hz.
- apply SNo_minus_SNo. apply CSNo_ImR. exact Hz.
Qed.

Theorem SNo_Re: forall x, SNo x -> Re x = x.
let x. assume Hx.
rewrite <- SNo_pair_0 x at 1.
prove Re (pa x 0) = x.
exact CSNo_Re2 x 0 Hx SNo_0.
Qed.

Theorem SNo_Im: forall x, SNo x -> Im x = 0.
let x. assume Hx.
rewrite <- SNo_pair_0 x at 1.
prove Im (pa x 0) = 0.
exact CSNo_Im2 x 0 Hx SNo_0.
Qed.

Theorem Re_0 : Re 0 = 0.
exact SNo_Re 0 SNo_0.
Qed.

Theorem Im_0 : Im 0 = 0.
exact SNo_Im 0 SNo_0.
Qed.

Theorem Re_1 : Re 1 = 1.
exact SNo_Re 1 SNo_1.
Qed.

Theorem Im_1 : Im 1 = 0.
exact SNo_Im 1 SNo_1.
Qed.

Theorem Re_i : Re i = 0.
exact CSNo_Re2 0 1 SNo_0 SNo_1.
Qed.

Theorem Im_i : Im i = 1.
exact CSNo_Im2 0 1 SNo_0 SNo_1.
Qed.

Theorem add_SNo_add_CSNo : forall x y, SNo x -> SNo y -> x + y = add_CSNo x y.
let x y. assume Hx Hy.
transitivity Re x + Re y,
             pa (Re x + Re y) 0.
- rewrite SNo_Re x Hx. rewrite SNo_Re y Hy. reflexivity.
- symmetry. exact SNo_pair_0 (Re x + Re y).
- prove pa (Re x + Re y) 0 = pa (Re x + Re y) (Im x + Im y).
  f_equal. rewrite SNo_Im x Hx. rewrite SNo_Im y Hy.
  prove 0 = 0 + 0.
  symmetry. exact add_SNo_0L 0 SNo_0.
Qed.

Theorem CSNo_add_CSNo : forall z w, CSNo z -> CSNo w -> CSNo (add_CSNo z w).
let z w. assume Hz Hw.
prove CSNo (pa (Re z + Re w) (Im z + Im w)).
apply CSNo_I.
- apply SNo_add_SNo.
  + exact CSNo_ReR z Hz.
  + exact CSNo_ReR w Hw.
- apply SNo_add_SNo.
  + exact CSNo_ImR z Hz.
  + exact CSNo_ImR w Hw.
Qed.

Theorem add_CSNo_0L : forall z, CSNo z -> add_CSNo 0 z = z.
let z. assume Hz.
prove pa (Re 0 + Re z) (Im 0 + Im z) = z.
rewrite Re_0. rewrite Im_0.
prove pa (0 + Re z) (0 + Im z) = z.
rewrite add_SNo_0L (Re z) (CSNo_ReR z Hz).
rewrite add_SNo_0L (Im z) (CSNo_ImR z Hz).
symmetry. exact CSNo_ReIm z Hz.
Qed.

Theorem add_CSNo_0R : forall z, CSNo z -> add_CSNo z 0 = z.
let z. assume Hz.
prove pa (Re z + Re 0) (Im z + Im 0) = z.
rewrite Re_0. rewrite Im_0.
prove pa (Re z + 0) (Im z + 0) = z.
rewrite add_SNo_0R (Re z) (CSNo_ReR z Hz).
rewrite add_SNo_0R (Im z) (CSNo_ImR z Hz).
symmetry. exact CSNo_ReIm z Hz.
Qed.

Theorem add_CSNo_minus_CSNo_linv : forall z, CSNo z -> add_CSNo (minus_CSNo z) z = 0.
let z. assume Hz.
prove pa (Re (pa (- Re z) (- Im z)) + Re z) (Im (pa (- Re z) (- Im z)) + Im z) = 0.
claim LmRez: SNo (- Re z).
{ apply SNo_minus_SNo. exact CSNo_ReR z Hz. }
claim LmImz: SNo (- Im z).
{ apply SNo_minus_SNo. exact CSNo_ImR z Hz. }
rewrite CSNo_Re2 (- Re z) (- Im z) LmRez LmImz.
rewrite CSNo_Im2 (- Re z) (- Im z) LmRez LmImz.
prove pa ((- Re z) + Re z) ((- Im z) + Im z) = 0.
rewrite add_SNo_minus_SNo_linv (Re z) (CSNo_ReR z Hz).
rewrite add_SNo_minus_SNo_linv (Im z) (CSNo_ImR z Hz).
prove pa 0 0 = 0.
exact SNo_pair_0 0.
Qed.

Theorem add_CSNo_minus_CSNo_rinv : forall z, CSNo z -> add_CSNo z (minus_CSNo z) = 0.
let z. assume Hz.
claim LmRez: SNo (- Re z).
{ apply SNo_minus_SNo. exact CSNo_ReR z Hz. }
claim LmImz: SNo (- Im z).
{ apply SNo_minus_SNo. exact CSNo_ImR z Hz. }
prove pa (Re z + Re (pa (- Re z) (- Im z))) (Im z + Im (pa (- Re z) (- Im z))) = 0.
rewrite CSNo_Re2 (- Re z) (- Im z) LmRez LmImz.
rewrite CSNo_Im2 (- Re z) (- Im z) LmRez LmImz.
prove pa (Re z + - Re z) (Im z + - Im z) = 0.
rewrite add_SNo_minus_SNo_rinv (Re z) (CSNo_ReR z Hz).
rewrite add_SNo_minus_SNo_rinv (Im z) (CSNo_ImR z Hz).
prove pa 0 0 = 0.
exact SNo_pair_0 0.
Qed.

Theorem minus_SNo_minus_CSNo : forall x, SNo x -> - x = minus_CSNo x.
let x. assume Hx.
prove - x = pa (- Re x) (- Im x).
rewrite SNo_Re x Hx.
rewrite SNo_Im x Hx.
prove - x = pa (- x) (- 0).
rewrite minus_SNo_0.
symmetry.
exact SNo_pair_0 (- x).
Qed.

Theorem add_CSNo_com : forall z w, CSNo z -> CSNo w -> z :+: w = w :+: z.
let z w. assume Hz Hw.
claim Lzw: CSNo (plus' z w).
{ exact CSNo_add_CSNo z w Hz Hw. }
claim Lwz: CSNo (plus' w z).
{ exact CSNo_add_CSNo w z Hw Hz. }
apply CSNo_ReIm_split (plus' z w) (plus' w z) Lzw Lwz.
- prove Re (plus' z w) = Re (plus' w z).
  transitivity (Re z + Re w).
  + exact add_CSNo_CRe z w Hz Hw.
  + transitivity (Re w + Re z).
    * exact add_SNo_com (Re z) (Re w) (CSNo_ReR z Hz) (CSNo_ReR w Hw).
    * symmetry. exact add_CSNo_CRe w z Hw Hz.
- prove Im (plus' z w) = Im (plus' w z).
  transitivity (Im z + Im w).
  + exact add_CSNo_CIm z w Hz Hw.
  + transitivity (Im w + Im z).
    * exact add_SNo_com (Im z) (Im w) (CSNo_ImR z Hz) (CSNo_ImR w Hw).
    * symmetry. exact add_CSNo_CIm w z Hw Hz.
Qed.

Theorem add_CSNo_assoc: forall z w v, CSNo z -> CSNo w -> CSNo v -> z :+: (w :+: v) = (z :+: w) :+: v.
let z w v. assume Hz Hw Hv.
claim Lwv: CSNo (plus' w v).
{ exact CSNo_add_CSNo w v Hw Hv. }
claim Lzw: CSNo (plus' z w).
{ exact CSNo_add_CSNo z w Hz Hw. }
claim Lzwv1: CSNo (plus' z (plus' w v)).
{ exact CSNo_add_CSNo z (plus' w v) Hz Lwv. }
claim Lzwv2: CSNo (plus' (plus' z w) v).
{ exact CSNo_add_CSNo (plus' z w) v Lzw Hv. }
apply CSNo_ReIm_split (plus' z (plus' w v)) (plus' (plus' z w) v) Lzwv1 Lzwv2.
- prove Re (plus' z (plus' w v)) = Re (plus' (plus' z w) v).
  transitivity (Re z + Re (plus' w v)).
  + exact add_CSNo_CRe z (plus' w v) Hz Lwv.
  + transitivity (Re (plus' z w) + Re v).
    * { prove Re z + Re (plus' w v) = Re (plus' z w) + Re v.
        transitivity (Re z + (Re w + Re v)).
        - apply f_eq_i (fun V => Re z + V). exact add_CSNo_CRe w v Hw Hv.
        - prove Re z + (Re w + Re v) = Re (plus' z w) + Re v.
          transitivity (Re z + Re w) + Re v.
          + exact add_SNo_assoc (Re z) (Re w) (Re v) (CSNo_ReR z Hz) (CSNo_ReR w Hw) (CSNo_ReR v Hv).
          + symmetry.
            prove Re (plus' z w) + Re v = (Re z + Re w) + Re v.
            prove (fun U:set => U + Re v) (Re (plus' z w)) = (fun U:set => U + Re v) (Re z + Re w).
            f_equal.
            prove Re (plus' z w) = Re z + Re w.
            exact add_CSNo_CRe z w Hz Hw.
      }
    * symmetry. exact add_CSNo_CRe (plus' z w) v Lzw Hv.
- prove Im (plus' z (plus' w v)) = Im (plus' (plus' z w) v).
  transitivity (Im z + Im (plus' w v)).
  + exact add_CSNo_CIm z (plus' w v) Hz Lwv.
  + transitivity (Im (plus' z w) + Im v).
    * { prove Im z + Im (plus' w v) = Im (plus' z w) + Im v.
        transitivity (Im z + (Im w + Im v)).
        - apply f_eq_i (fun V => Im z + V). exact add_CSNo_CIm w v Hw Hv.
        - prove Im z + (Im w + Im v) = Im (plus' z w) + Im v.
          transitivity (Im z + Im w) + Im v.
          + exact add_SNo_assoc (Im z) (Im w) (Im v) (CSNo_ImR z Hz) (CSNo_ImR w Hw) (CSNo_ImR v Hv).
          + symmetry.
            prove Im (plus' z w) + Im v = (Im z + Im w) + Im v.
            prove (fun U:set => U + Im v) (Im (plus' z w)) = (fun U:set => U + Im v) (Im z + Im w).
            apply f_eq_i (fun U => U + Im v).
            prove Im (plus' z w) = Im z + Im w.
            exact add_CSNo_CIm z w Hz Hw.
      }
   * symmetry. exact add_CSNo_CIm (plus' z w) v Lzw Hv.
Qed.

Theorem add_SNo_rotate_4_0312: forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> (x + y) + (z + w) = (x + w) + (y + z).
let x y z w. assume Hx Hy Hz Hw.
rewrite add_SNo_com z w Hz Hw.
prove (x + y) + (w + z) = (x + w) + (y + z).
exact add_SNo_com_4_inner_mid x y w z Hx Hy Hw Hz.
Qed.

Theorem mul_CSNo_ReR: forall z w, CSNo z -> CSNo w -> SNo (Re z * Re w + - (Im z * Im w)).
let z w. assume Hz Hw.
apply SNo_add_SNo.
- apply SNo_mul_SNo.
  + apply CSNo_ReR. exact Hz.
  + apply CSNo_ReR. exact Hw.
- apply SNo_minus_SNo.
  apply SNo_mul_SNo.
  + apply CSNo_ImR. exact Hz.
  + apply CSNo_ImR. exact Hw.
Qed.

Theorem mul_CSNo_ImR: forall z w, CSNo z -> CSNo w -> SNo (Re z * Im w + Im z * Re w).
let z w. assume Hz Hw.
apply SNo_add_SNo.
- apply SNo_mul_SNo.
  + apply CSNo_ReR. exact Hz.
  + apply CSNo_ImR. exact Hw.
- apply SNo_mul_SNo.
  + apply CSNo_ImR. exact Hz.
  + apply CSNo_ReR. exact Hw.
Qed.

Theorem mul_CSNo_CRe: forall z w, CSNo z -> CSNo w -> Re (mult' z w) = Re z * Re w + - (Im z * Im w).
let z w. assume Hz Hw.
exact CSNo_Re2 (Re z * Re w + - (Im z * Im w))
               (Re z * Im w + Im z * Re w)
               (mul_CSNo_ReR z w Hz Hw) (mul_CSNo_ImR z w Hz Hw).
Qed.

Theorem mul_CSNo_CIm: forall z w, CSNo z -> CSNo w -> Im (mult' z w) = Re z * Im w + Im z * Re w.
let z w. assume Hz Hw.
exact CSNo_Im2 (Re z * Re w + - (Im z * Im w))
               (Re z * Im w + Im z * Re w)
               (mul_CSNo_ReR z w Hz Hw) (mul_CSNo_ImR z w Hz Hw).
Qed.

Theorem CSNo_mul_CSNo : forall z w, CSNo z -> CSNo w -> CSNo (z :*: w).
let z w. assume Hz Hw.
prove CSNo (pa (Re z * Re w + - (Im z * Im w)) (Re z * Im w + Im z * Re w)).
apply CSNo_I.
- exact mul_CSNo_ReR z w Hz Hw.
- exact mul_CSNo_ImR z w Hz Hw.
Qed.

Theorem mul_CSNo_com : forall z w, CSNo z -> CSNo w -> z :*: w = w :*: z.
let z w. assume Hz Hw.
claim Lzw: CSNo (mult' z w).
{ exact CSNo_mul_CSNo z w Hz Hw. }
claim Lwz: CSNo (mult' w z).
{ exact CSNo_mul_CSNo w z Hw Hz. }
claim LRezR: SNo (Re z).
{ exact CSNo_ReR z Hz. }
claim LRewR: SNo (Re w).
{ exact CSNo_ReR w Hw. }
claim LImzR: SNo (Im z).
{ exact CSNo_ImR z Hz. }
claim LImwR: SNo (Im w).
{ exact CSNo_ImR w Hw. }
apply CSNo_ReIm_split (mult' z w) (mult' w z) Lzw Lwz.
- prove Re (mult' z w) = Re (mult' w z).
  transitivity Re z * Re w + - (Im z * Im w),
               Re w * Re z + - (Im w * Im z).
  + exact mul_CSNo_CRe z w Hz Hw.
  + f_equal.
    * exact mul_SNo_com (Re z) (Re w) LRezR LRewR.
    * f_equal. exact mul_SNo_com (Im z) (Im w) LImzR LImwR.
  + symmetry. exact mul_CSNo_CRe w z Hw Hz.
- prove Im (mult' z w) = Im (mult' w z).
  transitivity Re z * Im w + Im z * Re w,
               Im z * Re w + Re z * Im w,
               Re w * Im z + Im w * Re z.
  + exact mul_CSNo_CIm z w Hz Hw.
  + exact add_SNo_com (Re z * Im w) (Im z * Re w) (SNo_mul_SNo (Re z) (Im w) LRezR LImwR) (SNo_mul_SNo (Im z) (Re w) LImzR LRewR).
  + f_equal.
    * exact mul_SNo_com (Im z) (Re w) LImzR LRewR.
    * exact mul_SNo_com (Re z) (Im w) LRezR LImwR.
  + symmetry. exact mul_CSNo_CIm w z Hw Hz.
Qed.

Theorem mul_CSNo_assoc: forall z w v, CSNo z -> CSNo w -> CSNo v -> z :*: (w :*: v) = (z :*: w) :*: v.
let z w v. assume Hz Hw Hv.
claim Lwv: CSNo (mult' w v).
{ exact CSNo_mul_CSNo w v Hw Hv. }
claim Lzw: CSNo (mult' z w).
{ exact CSNo_mul_CSNo z w Hz Hw. }
claim Lzwv1: CSNo (mult' z (mult' w v)).
{ exact CSNo_mul_CSNo z (mult' w v) Hz Lwv. }
claim Lzwv2: CSNo (mult' (mult' z w) v).
{ exact CSNo_mul_CSNo (mult' z w) v Lzw Hv. }
claim LRezR: SNo (Re z).
{ exact CSNo_ReR z Hz. }
claim LRewR: SNo (Re w).
{ exact CSNo_ReR w Hw. }
claim LRevR: SNo (Re v).
{ exact CSNo_ReR v Hv. }
claim LImzR: SNo (Im z).
{ exact CSNo_ImR z Hz. }
claim LImwR: SNo (Im w).
{ exact CSNo_ImR w Hw. }
claim LImvR: SNo (Im v).
{ exact CSNo_ImR v Hv. }
apply CSNo_ReIm_split (mult' z (mult' w v)) (mult' (mult' z w) v) Lzwv1 Lzwv2.
- prove Re (mult' z (mult' w v)) = Re (mult' (mult' z w) v).
  transitivity (Re z * Re (mult' w v) + - (Im z * Im (mult' w v))),
               ((Re z * Re w * Re v + - (Re z * Im w * Im v))
                 + (- (Im z * Re w * Im v) + - (Im z * Im w * Re v))),
               ((Re z * Re w * Re v + - (Im z * Im w * Re v))
                 + (- (Re z * Im w * Im v) + - (Im z * Re w * Im v))),
               (Re (mult' z w) * Re v + - (Im (mult' z w) * Im v)).
  + exact mul_CSNo_CRe z (mult' w v) Hz Lwv.
  + f_equal.
    * { prove Re z * Re (mult' w v) = Re z * Re w * Re v + - (Re z * Im w * Im v).
        transitivity Re z * (Re w * Re v + - (Im w * Im v)),
                     Re z * Re w * Re v + Re z * (- (Im w * Im v)).
        - f_equal. exact mul_CSNo_CRe w v Hw Hv.
	- apply mul_SNo_distrL (Re z) (Re w * Re v) (- (Im w * Im v)) LRezR (SNo_mul_SNo (Re w) (Re v) LRewR LRevR).
	  apply SNo_minus_SNo.
	  exact SNo_mul_SNo (Im w) (Im v) LImwR LImvR.
	- f_equal.
	  prove Re z * (- (Im w * Im v)) = - (Re z * Im w * Im v).
	  exact mul_SNo_minus_distrR (Re z) (Im w * Im v) LRezR (SNo_mul_SNo (Im w) (Im v) LImwR LImvR).
      }
    * { prove - (Im z * Im (mult' w v)) = - (Im z * Re w * Im v) + - (Im z * Im w * Re v).
        transitivity - (Im z * Re w * Im v + Im z * Im w * Re v).
	- f_equal.
          prove Im z * Im (mult' w v) = Im z * Re w * Im v + Im z * Im w * Re v.
	  transitivity Im z * (Re w * Im v + Im w * Re v).
	  + f_equal. exact mul_CSNo_CIm w v Hw Hv.
	  + exact mul_SNo_distrL (Im z) (Re w * Im v) (Im w * Re v) LImzR (SNo_mul_SNo (Re w) (Im v) LRewR LImvR) (SNo_mul_SNo (Im w) (Re v) LImwR LRevR).
        - apply minus_add_SNo_distr.
	  + exact SNo_mul_SNo_3 (Im z) (Re w) (Im v) LImzR LRewR LImvR.
	  + exact SNo_mul_SNo_3 (Im z) (Im w) (Re v) LImzR LImwR LRevR.
      }
  + apply add_SNo_rotate_4_0312.
    * exact SNo_mul_SNo_3 (Re z) (Re w) (Re v) LRezR LRewR LRevR.
    * apply SNo_minus_SNo.
      exact SNo_mul_SNo_3 (Re z) (Im w) (Im v) LRezR LImwR LImvR.
    * apply SNo_minus_SNo.
      exact SNo_mul_SNo_3 (Im z) (Re w) (Im v) LImzR LRewR LImvR.
    * apply SNo_minus_SNo.
      exact SNo_mul_SNo_3 (Im z) (Im w) (Re v) LImzR LImwR LRevR.
  + f_equal.
    * { prove Re z * Re w * Re v + - (Im z * Im w * Re v) = Re (mult' z w) * Re v.
        transitivity (Re z * Re w) * Re v + (- (Im z * Im w)) * Re v,
                     (Re z * Re w + - (Im z * Im w)) * Re v.
	- f_equal.
	  + prove Re z * Re w * Re v = (Re z * Re w) * Re v.
	    exact mul_SNo_assoc (Re z) (Re w) (Re v) LRezR LRewR LRevR.
	  + prove - (Im z * Im w * Re v) = (- (Im z * Im w)) * Re v.
	    transitivity - ((Im z * Im w) * Re v).
	    * f_equal. exact mul_SNo_assoc (Im z) (Im w) (Re v) LImzR LImwR LRevR.
	    * symmetry.
	      exact mul_SNo_minus_distrL (Im z * Im w) (Re v) (SNo_mul_SNo (Im z) (Im w) LImzR LImwR) LRevR.
	- symmetry. exact mul_SNo_distrR (Re z * Re w) (- (Im z * Im w)) (Re v) (SNo_mul_SNo (Re z) (Re w) LRezR LRewR) (SNo_minus_SNo (Im z * Im w) (SNo_mul_SNo (Im z) (Im w) LImzR LImwR)) LRevR.
	- f_equal. symmetry. exact mul_CSNo_CRe z w Hz Hw.
      }
    * { prove - (Re z * Im w * Im v) + - (Im z * Re w * Im v) = - (Im (mult' z w) * Im v).
        transitivity - (Re z * Im w * Im v + Im z * Re w * Im v).
        - symmetry. apply minus_add_SNo_distr.
	  + exact SNo_mul_SNo_3 (Re z) (Im w) (Im v) LRezR LImwR LImvR.
	  + exact SNo_mul_SNo_3 (Im z) (Re w) (Im v) LImzR LRewR LImvR.
	- f_equal.
	  transitivity (Re z * Im w) * Im v + (Im z * Re w) * Im v,
	               (Re z * Im w + Im z * Re w) * Im v.
	  + f_equal.
	    * exact mul_SNo_assoc (Re z) (Im w) (Im v) LRezR LImwR LImvR.
	    * exact mul_SNo_assoc (Im z) (Re w) (Im v) LImzR LRewR LImvR.
	  + symmetry.
	    exact mul_SNo_distrR (Re z * Im w) (Im z * Re w) (Im v) (SNo_mul_SNo (Re z) (Im w) LRezR LImwR) (SNo_mul_SNo (Im z) (Re w) LImzR LRewR) LImvR.
	  + f_equal. symmetry. exact mul_CSNo_CIm z w Hz Hw.
      }
  + symmetry. exact mul_CSNo_CRe (mult' z w) v Lzw Hv.
- prove Im (mult' z (mult' w v)) = Im (mult' (mult' z w) v).
  transitivity (Re z * Im (mult' w v) + (Im z * Re (mult' w v))),
               ((Re z * Re w * Im v + Re z * Im w * Re v)
                 + (Im z * Re w * Re v + - (Im z * Im w * Im v))),
               ((Re z * Re w * Im v + - (Im z * Im w * Im v))
                 + (Re z * Im w * Re v + Im z * Re w * Re v)),
               (Re (mult' z w) * Im v + Im (mult' z w) * Re v).
  + exact mul_CSNo_CIm z (mult' w v) Hz Lwv.
  + f_equal.
    * { prove Re z * Im (mult' w v) = Re z * Re w * Im v + Re z * Im w * Re v.
        transitivity Re z * (Re w * Im v + Im w * Re v).
        - f_equal. exact mul_CSNo_CIm w v Hw Hv.
	- exact mul_SNo_distrL (Re z) (Re w * Im v) (Im w * Re v) LRezR (SNo_mul_SNo (Re w) (Im v) LRewR LImvR) (SNo_mul_SNo (Im w) (Re v) LImwR LRevR).
      }
    * { prove Im z * Re (mult' w v) = Im z * Re w * Re v + - (Im z * Im w * Im v).
        transitivity Im z * (Re w * Re v + - (Im w * Im v)),
	             Im z * Re w * Re v + Im z * (- (Im w * Im v)).
	- f_equal. exact mul_CSNo_CRe w v Hw Hv.
	- exact mul_SNo_distrL (Im z) (Re w * Re v) (- (Im w * Im v)) LImzR (SNo_mul_SNo (Re w) (Re v) LRewR LRevR) (SNo_minus_SNo (Im w * Im v) (SNo_mul_SNo (Im w) (Im v) LImwR LImvR)).
	- f_equal. exact mul_SNo_minus_distrR (Im z) (Im w * Im v) LImzR (SNo_mul_SNo (Im w) (Im v) LImwR LImvR).
      }
  + apply add_SNo_rotate_4_0312.
    * exact SNo_mul_SNo_3 (Re z) (Re w) (Im v) LRezR LRewR LImvR.
    * exact SNo_mul_SNo_3 (Re z) (Im w) (Re v) LRezR LImwR LRevR.
    * exact SNo_mul_SNo_3 (Im z) (Re w) (Re v) LImzR LRewR LRevR.
    * apply SNo_minus_SNo.
       exact SNo_mul_SNo_3 (Im z) (Im w) (Im v) LImzR LImwR LImvR.
  + f_equal.
    * { prove Re z * Re w * Im v + - (Im z * Im w * Im v) = Re (mult' z w) * Im v.
        transitivity (Re z * Re w) * Im v + (- (Im z * Im w)) * Im v,
                     (Re z * Re w + - (Im z * Im w)) * Im v.
	- f_equal.
	  + prove Re z * Re w * Im v = (Re z * Re w) * Im v.
	    exact mul_SNo_assoc (Re z) (Re w) (Im v) LRezR LRewR LImvR.
	  + prove - (Im z * Im w * Im v) = (- (Im z * Im w)) * Im v.
	    transitivity - ((Im z * Im w) * Im v).
	    * f_equal. exact mul_SNo_assoc (Im z) (Im w) (Im v) LImzR LImwR LImvR.
	    * symmetry.
	      prove (- (Im z * Im w)) * Im v = - ((Im z * Im w) * Im v).
	      exact mul_SNo_minus_distrL (Im z * Im w) (Im v) (SNo_mul_SNo (Im z) (Im w) LImzR LImwR) LImvR.
	- symmetry. exact mul_SNo_distrR (Re z * Re w) (- (Im z * Im w)) (Im v) (SNo_mul_SNo (Re z) (Re w) LRezR LRewR) (SNo_minus_SNo (Im z * Im w) (SNo_mul_SNo (Im z) (Im w) LImzR LImwR)) LImvR.
	- f_equal. symmetry. exact mul_CSNo_CRe z w Hz Hw.
      }
    * { prove Re z * Im w * Re v + Im z * Re w * Re v = Im (mult' z w) * Re v.
        transitivity (Re z * Im w) * Re v + (Im z * Re w) * Re v,
                     (Re z * Im w + Im z * Re w) * Re v.
        - f_equal.
          + exact mul_SNo_assoc (Re z) (Im w) (Re v) LRezR LImwR LRevR.
          + exact mul_SNo_assoc (Im z) (Re w) (Re v) LImzR LRewR LRevR.
	- symmetry.
	  exact mul_SNo_distrR (Re z * Im w) (Im z * Re w) (Re v) (SNo_mul_SNo (Re z) (Im w) LRezR LImwR) (SNo_mul_SNo (Im z) (Re w) LImzR LRewR) LRevR.
	- f_equal. symmetry. exact mul_CSNo_CIm z w Hz Hw.
      }
  + symmetry. exact mul_CSNo_CIm (mult' z w) v Lzw Hv.
Qed.

Theorem CSNo_0: CSNo 0.
apply SNo_CSNo. exact SNo_0.
Qed.

Theorem CSNo_1: CSNo 1.
apply SNo_CSNo. exact SNo_1.
Qed.

Theorem mul_CSNo_oneL: forall z, CSNo z -> 1 :*: z = z.
let z. assume Hz.
claim L1z: CSNo (mult' 1 z).
{ exact CSNo_mul_CSNo 1 z CSNo_1 Hz. }    
claim LRezR: SNo (Re z).
{ exact CSNo_ReR z Hz. }
claim LImzR: SNo (Im z).
{ exact CSNo_ImR z Hz. }
apply CSNo_ReIm_split (mult' 1 z) z L1z Hz.
- prove Re (mult' 1 z) = Re z.
  transitivity Re 1 * Re z + - (Im 1 * Im z),
               Re z + 0.
  + exact mul_CSNo_CRe 1 z CSNo_1 Hz.
  + f_equal.
    * prove Re 1 * Re z = Re z.
      rewrite <- SNo_pair_0 1.
      prove Re (pa 1 0) * Re z = Re z.
      apply CSNo_Re2 1 0 SNo_1 SNo_0 (fun U V => V * Re z = Re z).
      prove 1 * Re z = Re z.
      exact mul_SNo_oneL (Re z) LRezR.
    * { prove - (Im 1 * Im z) = 0.
        rewrite <- minus_SNo_0 at 2.
        prove - (Im 1 * Im z) = - 0.
	f_equal.
	rewrite <- SNo_pair_0 1.
	prove Im (pa 1 0) * Im z = 0.
	transitivity 0 * Im z.
	- f_equal. exact CSNo_Im2 1 0 SNo_1 SNo_0.
	- exact mul_SNo_zeroL (Im z) LImzR.
      }
  + transitivity 0 + Re z.
    * exact add_SNo_com (Re z) 0 LRezR SNo_0.
    * exact add_SNo_0L (Re z) LRezR.
- prove Im (mult' 1 z) = Im z.
  transitivity Re 1 * Im z + Im 1 * Re z,
               Im z + 0.
  + exact mul_CSNo_CIm 1 z CSNo_1 Hz.
  + f_equal.
    * prove Re 1 * Im z = Im z.
      rewrite <- SNo_pair_0 1.
      prove Re (pa 1 0) * Im z = Im z.
      apply CSNo_Re2 1 0 SNo_1 SNo_0 (fun U V => V * Im z = Im z).
      prove 1 * Im z = Im z.
      exact mul_SNo_oneL (Im z) LImzR.
    * { prove Im 1 * Re z = 0.
        transitivity 0 * Re z.
        - f_equal. rewrite <- SNo_pair_0 1. exact CSNo_Im2 1 0 SNo_1 SNo_0.
        - exact mul_SNo_zeroL (Re z) LRezR.
      }
  + transitivity 0 + Im z.
    * exact add_SNo_com (Im z) 0 LImzR SNo_0.
    * exact add_SNo_0L (Im z) LImzR.
Qed.

Theorem mul_CSNo_distrL : forall z w v, CSNo z -> CSNo w -> CSNo v -> z :*: (w :+: v) = z :*: w :+: z :*: v.
let z w v. assume Hz Hw Hv.
claim Lwv: CSNo (plus' w v).
{ exact CSNo_add_CSNo w v Hw Hv. }
claim Lzw: CSNo (mult' z w).
{ exact CSNo_mul_CSNo z w Hz Hw. }
claim Lzv: CSNo (mult' z v).
{ exact CSNo_mul_CSNo z v Hz Hv. }
claim Lzwv: CSNo (mult' z (plus' w v)).
{ exact CSNo_mul_CSNo z (plus' w v) Hz Lwv. }
claim Lzwzv: CSNo (plus' (mult' z w) (mult' z v)).
{ exact CSNo_add_CSNo (mult' z w) (mult' z v) Lzw Lzv. }
claim LRezR: SNo (Re z).
{ exact CSNo_ReR z Hz. }
claim LRewR: SNo (Re w).
{ exact CSNo_ReR w Hw. }
claim LRevR: SNo (Re v).
{ exact CSNo_ReR v Hv. }
claim LImzR: SNo (Im z).
{ exact CSNo_ImR z Hz. }
claim LImwR: SNo (Im w).
{ exact CSNo_ImR w Hw. }
claim LImvR: SNo (Im v).
{ exact CSNo_ImR v Hv. }
apply CSNo_ReIm_split (mult' z (plus' w v)) (plus' (mult' z w) (mult' z v)) Lzwv Lzwzv.
- prove Re (mult' z (plus' w v)) = Re (plus' (mult' z w) (mult' z v)).
  transitivity Re z * Re (plus' w v) + - Im z * Im (plus' w v),
               (Re z * Re w + Re z * Re v) + (- Im z * Im w + - Im z * Im v),
               (Re z * Re w + - (Im z * Im w)) + (Re z * Re v + - (Im z * Im v)),
               Re (mult' z w) + Re (mult' z v).
  + exact mul_CSNo_CRe z (plus' w v) Hz Lwv.
  + f_equal.
    * prove Re z * Re (plus' w v) = Re z * Re w + Re z * Re v.
      apply mul_SNo_distrL (Re z) (Re w) (Re v) LRezR LRewR LRevR (fun U V => Re z * Re (plus' w v) = U).
      prove Re z * Re (plus' w v) = Re z * (Re w + Re v).
      f_equal.
      exact add_CSNo_CRe w v Hw Hv.
    * { prove - Im z * Im (plus' w v) = - Im z * Im w + - Im z * Im v.
        transitivity - Im z * (Im w + Im v),
                     (- Im z) * (Im w + Im v),
                     (- Im z) * Im w + (- Im z) * Im v.
        - f_equal. f_equal. exact add_CSNo_CIm w v Hw Hv.
        - symmetry. exact mul_SNo_minus_distrL (Im z) (Im w + Im v) LImzR (SNo_add_SNo (Im w) (Im v) LImwR LImvR).
        - exact mul_SNo_distrL (- Im z) (Im w) (Im v) (SNo_minus_SNo (Im z) LImzR) LImwR LImvR.
        - f_equal.
          + exact mul_SNo_minus_distrL (Im z) (Im w) LImzR LImwR.
          + exact mul_SNo_minus_distrL (Im z) (Im v) LImzR LImvR.
      }
  + apply add_SNo_com_4_inner_mid.
    * exact SNo_mul_SNo (Re z) (Re w) LRezR LRewR.
    * exact SNo_mul_SNo (Re z) (Re v) LRezR LRevR.
    * apply SNo_minus_SNo.
      exact SNo_mul_SNo (Im z) (Im w) LImzR LImwR.
    * apply SNo_minus_SNo.
      exact SNo_mul_SNo (Im z) (Im v) LImzR LImvR.
  + f_equal.
    * symmetry. exact mul_CSNo_CRe z w Hz Hw.
    * symmetry. exact mul_CSNo_CRe z v Hz Hv.
  + symmetry. exact add_CSNo_CRe (mult' z w) (mult' z v) Lzw Lzv.
- prove Im (mult' z (plus' w v)) = Im (plus' (mult' z w) (mult' z v)).
  transitivity Re z * Im (plus' w v) + Im z * Re (plus' w v),
               (Re z * Im w + Re z * Im v) + (Im z * Re w + Im z * Re v),
               (Re z * Im w + Im z * Re w) + (Re z * Im v + Im z * Re v),
               Im (mult' z w) + Im (mult' z v).
  + exact mul_CSNo_CIm z (plus' w v) Hz Lwv.
  + f_equal.
    * prove Re z * Im (plus' w v) = Re z * Im w + Re z * Im v.
      apply mul_SNo_distrL (Re z) (Im w) (Im v) LRezR LImwR LImvR (fun U V => Re z * Im (plus' w v) = U).
      prove Re z * Im (plus' w v) = Re z * (Im w + Im v).
      f_equal.
      exact add_CSNo_CIm w v Hw Hv.
    * { prove Im z * Re (plus' w v) = Im z * Re w + Im z * Re v.
        transitivity Im z * (Re w + Re v).
        - f_equal. exact add_CSNo_CRe w v Hw Hv.
        - exact mul_SNo_distrL (Im z) (Re w) (Re v) LImzR LRewR LRevR.
      }
  + apply add_SNo_com_4_inner_mid.
    * exact SNo_mul_SNo (Re z) (Im w) LRezR LImwR.
    * exact SNo_mul_SNo (Re z) (Im v) LRezR LImvR.
    * exact SNo_mul_SNo (Im z) (Re w) LImzR LRewR.
    * exact SNo_mul_SNo (Im z) (Re v) LImzR LRevR.
  + f_equal.
    * symmetry. exact mul_CSNo_CIm z w Hz Hw.
    * symmetry. exact mul_CSNo_CIm z v Hz Hv.
  + symmetry. exact add_CSNo_CIm (mult' z w) (mult' z v) Lzw Lzv.
Qed.

Theorem mul_SNo_mul_CSNo : forall x y, SNo x -> SNo y -> x * y = x :*: y.
let x y. assume Hx Hy.
transitivity Re x * Re y,
             pa (Re x * Re y) 0.
- rewrite SNo_Re x Hx. rewrite SNo_Re y Hy. reflexivity.
- symmetry. exact SNo_pair_0 (Re x * Re y).
- prove pa (Re x * Re y) 0
      = pa (Re x * Re y + - Im x * Im y) (Re x * Im y + Im x * Re y).
  f_equal.
  + prove Re x * Re y = Re x * Re y + - Im x * Im y.
    rewrite SNo_Im x Hx.
    rewrite mul_SNo_zeroL (Im y) (CSNo_ImR y (SNo_CSNo y Hy)).
    prove Re x * Re y = Re x * Re y + - 0.
    rewrite minus_SNo_0.
    symmetry.
    prove Re x * Re y + 0 = Re x * Re y.
    exact add_SNo_0R (Re x * Re y)
                 (SNo_mul_SNo (Re x) (Re y)
                              (CSNo_ReR x (SNo_CSNo x Hx))
                              (CSNo_ReR y (SNo_CSNo y Hy))).
  + prove 0 = Re x * Im y + Im x * Re y.
    rewrite SNo_Im x Hx. rewrite SNo_Im y Hy.
    rewrite mul_SNo_zeroL (Re y) (CSNo_ReR y (SNo_CSNo y Hy)).
    rewrite mul_SNo_zeroR (Re x) (CSNo_ReR x (SNo_CSNo x Hx)).
    symmetry.
    exact add_SNo_0R 0 SNo_0.
Qed.

Theorem Complex_i_sqr : i :*: i = :-: 1.
claim Lii: CSNo (i :*: i).
{ exact CSNo_mul_CSNo i i CSNo_Complex_i CSNo_Complex_i. }
claim Lm1: CSNo (:-: 1).
{ exact CSNo_minus_CSNo 1 CSNo_1. }
apply CSNo_ReIm_split (i :*: i) (:-: 1) Lii Lm1.
- prove Re (i :*: i) = Re (:-: 1).
  rewrite mul_CSNo_CRe i i CSNo_Complex_i CSNo_Complex_i.
  rewrite minus_CSNo_CRe 1 CSNo_1.
  prove Re i * Re i + - Im i * Im i = - Re 1.
  rewrite Re_i. rewrite Im_i. rewrite Re_1.
  prove 0 * 0 + - 1 * 1 = - 1.
  rewrite mul_SNo_zeroL 0 SNo_0.
  rewrite mul_SNo_oneL 1 SNo_1.
  prove 0 + - 1 = - 1.
  exact add_SNo_0L (- 1) (SNo_minus_SNo 1 SNo_1).
- prove Im (i :*: i) = Im (:-: 1).
  rewrite mul_CSNo_CIm i i CSNo_Complex_i CSNo_Complex_i.
  rewrite minus_CSNo_CIm 1 CSNo_1.
  prove Re i * Im i + Im i * Re i = - Im 1.
  rewrite Re_i. rewrite Im_i. rewrite Im_1.
  prove 0 * 1 + 1 * 0 = - 0.
  rewrite minus_SNo_0.
  rewrite mul_SNo_zeroL 1 SNo_1.
  rewrite mul_SNo_zeroR 1 SNo_1.
  prove 0 + 0 = 0.
  exact add_SNo_0L 0 SNo_0.
Qed.

Theorem CSNo_relative_recip : forall z, CSNo z -> forall u, SNo u -> (Re z * Re z + Im z * Im z) * u = 1 -> z :*: (u :*: Re z :+: :-: i :*: u :*: Im z) = 1.
let z. assume Hz. let u. assume Hu.
assume Hur: (Re z * Re z + Im z * Im z) * u = 1.
prove z :*: (u :*: Re z :+: :-: i :*: u :*: Im z) = 1.
claim LRezR: SNo (Re z).
{ exact CSNo_ReR z Hz. }
claim LImzR: SNo (Im z).
{ exact CSNo_ImR z Hz. }
prove z :*: (u :*: Re z :+: :-: i :*: u :*: Im z) = 1.
rewrite <- mul_SNo_mul_CSNo u (Re z) Hu LRezR.
rewrite <- mul_SNo_mul_CSNo u (Im z) Hu LImzR.
prove z :*: (u * Re z :+: :-: i :*: u * Im z) = 1.
claim LuRez: SNo (u * Re z).
{ exact SNo_mul_SNo u (Re z) ?? ??. }
claim LuRez': CSNo (u * Re z).
{ apply SNo_CSNo. exact LuRez. }
claim LuImz: SNo (u * Im z).
{ exact SNo_mul_SNo u (Im z) ?? ??. }
claim LuImz': CSNo (u * Im z).
{ apply SNo_CSNo. exact LuImz. }
claim LiuImz: CSNo (i :*: u * Im z).
{ apply CSNo_mul_CSNo.
  - exact CSNo_Complex_i.
  - exact LuImz'.
}
claim LmiuImz: CSNo (:-: i :*: u * Im z).
{ apply CSNo_minus_CSNo. exact LiuImz. }
claim L1: CSNo (u * Re z :+: :-: i :*: u * Im z).
{ apply CSNo_add_CSNo.
  - prove CSNo (u * Re z). exact LuRez'.
  - prove CSNo (:-: i :*: u * Im z). exact LmiuImz.
}
claim LRezRez: SNo (Re z * Re z).
{ exact SNo_mul_SNo (Re z) (Re z) ?? ??. }
claim LImzImz: SNo (Im z * Im z).
{ exact SNo_mul_SNo (Im z) (Im z) ?? ??. }
apply CSNo_ReIm_split (z :*: (u * Re z :+: :-: i :*: u * Im z)) 1
                      (CSNo_mul_CSNo z (u * Re z :+: :-: i :*: u * Im z) Hz L1)
		      CSNo_1.
- prove Re (z :*: (u * Re z :+: :-: i :*: u * Im z)) = Re 1.
  rewrite Re_1.
  rewrite mul_CSNo_CRe z (u * Re z :+: :-: i :*: u * Im z) Hz L1.
  prove Re z * Re (u * Re z :+: :-: i :*: u * Im z)
      + - Im z * Im (u * Re z :+: :-: i :*: u * Im z) = 1.
  rewrite add_CSNo_CRe (u * Re z) (:-: i :*: u * Im z) LuRez' LmiuImz.
  rewrite add_CSNo_CIm (u * Re z) (:-: i :*: u * Im z) LuRez' LmiuImz.
  prove Re z * (Re (u * Re z) + Re (:-: i :*: u * Im z))
      + - Im z * (Im (u * Re z) + Im (:-: i :*: u * Im z)) = 1.
  rewrite minus_CSNo_CRe (i :*: u * Im z) LiuImz.
  rewrite minus_CSNo_CIm (i :*: u * Im z) LiuImz.
  rewrite SNo_Re (u * Re z) LuRez.
  rewrite SNo_Im (u * Re z) LuRez.
  prove Re z * (u * Re z + - Re (i :*: u * Im z))
      + - Im z * (0 + - Im (i :*: u * Im z)) = 1.
  rewrite mul_CSNo_CRe i (u * Im z) CSNo_Complex_i LuImz'.
  prove Re z * (u * Re z + - (Re i * Re (u * Im z) + - Im i * Im (u * Im z)))
      + - Im z * (0 + - Im (i :*: u * Im z)) = 1.
  rewrite mul_CSNo_CIm i (u * Im z) CSNo_Complex_i LuImz'.
  prove Re z * (u * Re z + - (Re i * Re (u * Im z) + - Im i * Im (u * Im z)))
      + - Im z * (0 + - (Re i * Im (u * Im z) + Im i * Re (u * Im z))) = 1.
  rewrite Re_i. rewrite Im_i.
  prove Re z * (u * Re z + - (0 * Re (u * Im z) + - 1 * Im (u * Im z)))
      + - Im z * (0 + - (0 * Im (u * Im z) + 1 * Re (u * Im z))) = 1.
  rewrite SNo_Re (u * Im z) LuImz.
  rewrite SNo_Im (u * Im z) LuImz.
  prove Re z * (u * Re z + - (0 * (u * Im z) + - 1 * 0))
      + - Im z * (0 + - (0 * 0 + 1 * (u * Im z))) = 1.
  rewrite mul_SNo_zeroR 0 SNo_0.
  rewrite mul_SNo_zeroL (u * Im z) LuImz.
  rewrite mul_SNo_zeroR 1 SNo_1.
  prove Re z * (u * Re z + - (0 + - 0))
      + - Im z * (0 + - (0 + 1 * (u * Im z))) = 1.
  rewrite minus_SNo_0.
  rewrite add_SNo_0L 0 SNo_0.
  rewrite minus_SNo_0.
  rewrite add_SNo_0R (u * Re z) LuRez.
  prove Re z * (u * Re z)
      + - Im z * (0 + - (0 + 1 * (u * Im z))) = 1.
  rewrite mul_SNo_oneL (u * Im z) LuImz.
  prove Re z * (u * Re z)
      + - Im z * (0 + - (0 + (u * Im z))) = 1.
  rewrite add_SNo_0L (u * Im z) LuImz.
  rewrite add_SNo_0L (- u * Im z) (SNo_minus_SNo (u * Im z) LuImz).
  prove Re z * (u * Re z)
      + - Im z * (- (u * Im z)) = 1.
  rewrite <- mul_SNo_minus_distrR (Im z) (- u * Im z) LImzR (SNo_minus_SNo (u * Im z) LuImz).
  rewrite minus_SNo_invol (u * Im z) LuImz.
  prove Re z * (u * Re z) + Im z * (u * Im z) = 1.
  rewrite mul_SNo_com_3_0_1 (Re z) u (Re z) ?? ?? ??.
  rewrite mul_SNo_com_3_0_1 (Im z) u (Im z) ?? ?? ??.
  prove u * (Re z * Re z) + u * (Im z * Im z) = 1.
  rewrite mul_SNo_com u (Re z * Re z) ?? ??.
  rewrite mul_SNo_com u (Im z * Im z) ?? ??.
  rewrite <- mul_SNo_distrR (Re z * Re z) (Im z * Im z) u ?? ?? ??.
  exact Hur.
- prove Im (z :*: (u * Re z :+: :-: i :*: u * Im z)) = Im 1.
  rewrite mul_CSNo_CIm z (u * Re z :+: :-: i :*: u * Im z) Hz L1.
  rewrite Im_1.
  prove Re z * Im (u * Re z :+: :-: i :*: u * Im z)
      + Im z * Re (u * Re z :+: :-: i :*: u * Im z) = 0.
  rewrite add_CSNo_CRe (u * Re z) (:-: i :*: u * Im z) LuRez' LmiuImz.
  rewrite add_CSNo_CIm (u * Re z) (:-: i :*: u * Im z) LuRez' LmiuImz.
  prove Re z * (Im (u * Re z) + Im (:-: i :*: u * Im z))
      + Im z * (Re (u * Re z) + Re (:-: i :*: u * Im z)) = 0.
  rewrite minus_CSNo_CRe (i :*: u * Im z) LiuImz.
  rewrite minus_CSNo_CIm (i :*: u * Im z) LiuImz.
  prove Re z * (Im (u * Re z) + - Im (i :*: u * Im z))
      + Im z * (Re (u * Re z) + - Re (i :*: u * Im z)) = 0.
  rewrite SNo_Re (u * Re z) LuRez.
  rewrite SNo_Im (u * Re z) LuRez.
  prove Re z * (0 + - Im (i :*: u * Im z))
      + Im z * ((u * Re z) + - Re (i :*: u * Im z)) = 0.
  rewrite mul_CSNo_CRe i (u * Im z) CSNo_Complex_i LuImz'.
  prove Re z * (0 + - Im (i :*: u * Im z))
      + Im z * ((u * Re z) + - (Re i * Re (u * Im z) + - Im i * Im (u * Im z))) = 0.
  rewrite mul_CSNo_CIm i (u * Im z) CSNo_Complex_i LuImz'.
  prove Re z * (0 + - (Re i * Im (u * Im z) + Im i * Re (u * Im z)))
      + Im z * ((u * Re z) + - (Re i * Re (u * Im z) + - Im i * Im (u * Im z))) = 0.
  rewrite Re_i. rewrite Im_i.
  prove Re z * (0 + - (0 * Im (u * Im z) + 1 * Re (u * Im z)))
      + Im z * ((u * Re z) + - (0 * Re (u * Im z) + - 1 * Im (u * Im z))) = 0.
  rewrite SNo_Re (u * Im z) LuImz.
  rewrite SNo_Im (u * Im z) LuImz.
  prove Re z * (0 + - (0 * 0 + 1 * (u * Im z)))
      + Im z * ((u * Re z) + - (0 * (u * Im z) + - 1 * 0)) = 0.
  rewrite mul_SNo_zeroL 0 SNo_0.
  rewrite mul_SNo_zeroL (u * Im z) ??.
  rewrite mul_SNo_zeroR 1 SNo_1.
  rewrite mul_SNo_oneL (u * Im z) ??.
  prove Re z * (0 + - (0 + u * Im z))
      + Im z * ((u * Re z) + - (0 + - 0)) = 0.
  rewrite minus_SNo_0.
  rewrite add_SNo_0L 0 SNo_0.
  rewrite minus_SNo_0.
  rewrite add_SNo_0R (u * Re z) ??.
  rewrite add_SNo_0L (u * Im z) ??.
  prove Re z * (0 + - (u * Im z))
      + Im z * (u * Re z) = 0.
  rewrite add_SNo_0L (- (u * Im z)) (SNo_minus_SNo (u * Im z) ??).
  prove Re z * (- (u * Im z))
      + Im z * (u * Re z) = 0.
  rewrite mul_SNo_minus_distrR (Re z) (u * Im z) ?? ??.
  prove - Re z * u * Im z + Im z * u * Re z = 0.
  rewrite mul_SNo_com_3_0_1 (Re z) u (Im z) ?? ?? ??.
  rewrite mul_SNo_com_3_0_1 (Im z) u (Re z) ?? ?? ??.
  prove - u * Re z * Im z + u * Im z * Re z = 0.
  rewrite mul_SNo_com (Re z) (Im z) ?? ??.
  prove - u * Im z * Re z + u * Im z * Re z = 0.
  exact add_SNo_minus_SNo_linv (u * Im z * Re z) (SNo_mul_SNo_3 u (Im z) (Re z) ?? ?? ??).
Qed.

End ComplexSNo.

Section Complex.

Prefix - 358 := minus_CSNo.
Infix + 360 right := add_CSNo.
Infix * 355 right := mul_CSNo.

Infix < 490 := SNoLt.
(* Unicode <= "2264" *)
Infix <= 490 := SNoLe.

Let i := Complex_i.
Let Re : set -> set := CSNo_Re.
Let Im : set -> set := CSNo_Im.
Let pa : set -> set -> set := SNo_pair.

Definition complex : set := {pa (u 0) (u 1)|u :e real :*: real}.

Theorem complex_I : forall x y :e real, pa x y :e complex.
let x. assume Hx. let y. assume Hy.
prove pa x y :e complex.
rewrite <- tuple_2_0_eq x y.
rewrite <- tuple_2_1_eq x y at 2.
prove pa ((x,y) 0) ((x,y) 1) :e complex.
apply ReplI (real :*: real) (fun u => pa (u 0) (u 1)).
prove (x,y) :e real :*: real.
exact tuple_2_setprod real real x Hx y Hy.
Qed.

Theorem complex_E : forall z :e complex, forall p:prop,
   (forall x y :e real, z = pa x y -> p)
 -> p.
let z. assume Hz. let p. assume Hp.
apply ReplE_impred (real :*: real) (fun u => pa (u 0) (u 1)) z Hz.
let u.
assume Hu: u :e real :*: real.
assume Hzu: z = pa (u 0) (u 1).
exact Hp (u 0) (ap0_Sigma real (fun _ => real) u Hu)
         (u 1) (ap1_Sigma real (fun _ => real) u Hu)
         Hzu.
Qed.

Theorem complex_CSNo: forall z :e complex, CSNo z.
let z. assume Hz.
apply complex_E z Hz.
let x. assume Hx. let y. assume Hy.
assume Hzxy: z = pa x y.
prove CSNo z.
rewrite Hzxy. apply CSNo_I.
- exact real_SNo x Hx.
- exact real_SNo y Hy.
Qed.

Theorem real_complex: real c= complex.
let x. assume Hx: x :e real.
prove x :e complex.
rewrite <- SNo_pair_0 x.
prove pa x 0 :e complex.
apply complex_I.
- exact Hx.
- exact real_0.
Qed.

Theorem complex_0 : 0 :e complex.
exact real_complex 0 real_0.
Qed.

Theorem complex_1 : 1 :e complex.
exact real_complex 1 real_1.
Qed.

Theorem complex_i : i :e complex.
prove pa 0 1 :e complex.
apply complex_I.
- exact real_0.
- exact real_1.
Qed.

Theorem complex_Re_eq: forall x y :e real, Re (pa x y) = x.
let x. assume Hx. let y. assume Hy.
exact CSNo_Re2 x y (real_SNo x Hx) (real_SNo y Hy).
Qed.

Theorem complex_Im_eq: forall x y :e real, Im (pa x y) = y.
let x. assume Hx. let y. assume Hy.
exact CSNo_Im2 x y (real_SNo x Hx) (real_SNo y Hy).
Qed.

Theorem complex_Re_real: forall z :e complex, Re z :e real.
let z. assume Hz. apply complex_E z Hz.
let x. assume Hx. let y. assume Hy Hzxy.
rewrite Hzxy.
prove Re (pa x y) :e real.
rewrite complex_Re_eq x Hx y Hy.
prove x :e real. exact Hx.
Qed.

Theorem complex_Im_real: forall z :e complex, Im z :e real.
let z. assume Hz. apply complex_E z Hz.
let x. assume Hx. let y. assume Hy Hzxy.
rewrite Hzxy.
prove Im (pa x y) :e real.
rewrite complex_Im_eq x Hx y Hy.
prove y :e real. exact Hy.
Qed.

Theorem complex_ReIm_split: forall z w :e complex, Re z = Re w -> Im z = Im w -> z = w.
let z. assume Hz. let w. assume Hw.
exact CSNo_ReIm_split z w (complex_CSNo z Hz) (complex_CSNo w Hw).
Qed.

Theorem complex_minus_CSNo : forall z :e complex, - z :e complex.
let z. assume Hz.
prove pa (minus_SNo (Re z)) (minus_SNo (Im z)) :e complex.
apply complex_I.
- apply real_minus_SNo. exact complex_Re_real z Hz.
- apply real_minus_SNo. exact complex_Im_real z Hz.
Qed.

Theorem complex_add_CSNo : forall z w :e complex, z + w :e complex.
let z. assume Hz. let w. assume Hw.
prove pa (add_SNo (Re z) (Re w)) (add_SNo (Im z) (Im w)) :e complex.
apply complex_I.
- apply real_add_SNo.
  + exact complex_Re_real z Hz.
  + exact complex_Re_real w Hw.
- apply real_add_SNo.
  + exact complex_Im_real z Hz.
  + exact complex_Im_real w Hw.
Qed.

Theorem complex_mul_CSNo : forall z w :e complex, z * w :e complex.
let z. assume Hz. let w. assume Hw.
prove pa (add_SNo (mul_SNo (Re z) (Re w)) (minus_SNo (mul_SNo (Im z) (Im w))))
         (add_SNo (mul_SNo (Re z) (Im w)) (mul_SNo (Im z) (Re w)))
       :e complex.
claim Lz0: Re z :e real.
{ exact complex_Re_real z Hz. }
claim Lz1: Im z :e real.
{ exact complex_Im_real z Hz. }
claim Lw0: Re w :e real.
{ exact complex_Re_real w Hw. }
claim Lw1: Im w :e real.
{ exact complex_Im_real w Hw. }
apply complex_I.
- apply real_add_SNo.
  + apply real_mul_SNo.
    * exact ??.
    * exact ??.
  + apply real_minus_SNo. apply real_mul_SNo.
    * exact ??.
    * exact ??.
- apply real_add_SNo.
  + apply real_mul_SNo.
    * exact ??.
    * exact ??.
  + apply real_mul_SNo.
    * exact ??.
    * exact ??.
Qed.

Theorem real_Re_eq: forall x :e real, Re x = x.
let x. assume Hx.
rewrite <- SNo_pair_0 x at 1.
exact complex_Re_eq x Hx 0 real_0.
Qed.

Theorem real_Im_eq: forall x :e real, Im x = 0.
let x. assume Hx.
rewrite <- SNo_pair_0 x.
exact complex_Im_eq x Hx 0 real_0.
Qed.

Theorem mul_i_real_eq: forall x :e real, i * x = pa 0 x.
let x. assume Hx.
prove pa (add_SNo (mul_SNo (Re (pa 0 1)) (Re x))
                  (minus_SNo (mul_SNo (Im (pa 0 1)) (Im x))))
         (add_SNo (mul_SNo (Re (pa 0 1)) (Im x))
                  (mul_SNo (Im (pa 0 1)) (Re x)))
    = pa 0 x.
rewrite real_Re_eq x Hx.
rewrite real_Im_eq x Hx.
rewrite complex_Re_eq 0 real_0 1 real_1.
rewrite complex_Im_eq 0 real_0 1 real_1.
prove pa (add_SNo (mul_SNo 0 x)
                  (minus_SNo (mul_SNo 1 0)))
         (add_SNo (mul_SNo 0 0)
                  (mul_SNo 1 x))
    = pa 0 x.
rewrite mul_SNo_zeroL x (real_SNo x Hx).
rewrite mul_SNo_zeroR 1 SNo_1.
rewrite minus_SNo_0.
rewrite mul_SNo_zeroL 0 SNo_0.
rewrite mul_SNo_oneL x (real_SNo x Hx).
prove pa (add_SNo 0 0) (add_SNo 0 x)
    = pa 0 x.
rewrite add_SNo_0L 0 SNo_0.
rewrite add_SNo_0L x (real_SNo x Hx).
reflexivity.
Qed.

Theorem real_Re_i_eq: forall x :e real, Re (i * x) = 0.
let x. assume Hx.
rewrite mul_i_real_eq x Hx.
prove Re (pa 0 x) = 0.
exact complex_Re_eq 0 real_0 x Hx.
Qed.

Theorem real_Im_i_eq: forall x :e real, Im (i * x) = x.
let x. assume Hx.
rewrite mul_i_real_eq x Hx.
prove Im (pa 0 x) = x.
exact complex_Im_eq 0 real_0 x Hx.
Qed.

Theorem complex_eta : forall z :e complex, z = Re z + i * Im z.
let z. assume Hz. apply complex_E z Hz.
let x. assume Hx. let y. assume Hy Hzxy.
rewrite Hzxy.
rewrite complex_Re_eq x Hx y Hy.
rewrite complex_Im_eq x Hx y Hy.
prove pa x y = x + i * y.
prove pa x y = pa (add_SNo (Re x) (Re (i * y))) (add_SNo (Im x) (Im (i * y))).
rewrite real_Re_eq x Hx.
rewrite real_Im_eq x Hx.
rewrite real_Re_i_eq y Hy.
rewrite real_Im_i_eq y Hy.
prove pa x y = pa (add_SNo x 0) (add_SNo 0 y).
rewrite add_SNo_0R x (real_SNo x Hx).
rewrite add_SNo_0L y (real_SNo y Hy).
reflexivity.
Qed.

Theorem nonzero_complex_recip_ex : forall z :e complex, z <> 0 -> exists w :e complex, z * w = 1.
let z. assume Hz Hznz.
set x := Re z.
set y := Im z.
set r := add_SNo (mul_SNo x x) (mul_SNo y y).
claim Lx: x :e real.
{ exact complex_Re_real z Hz. }
claim Ly: y :e real.
{ exact complex_Im_real z Hz. }
claim Lxx: mul_SNo x x :e real.
{ exact real_mul_SNo x ?? x ??. }
claim Lxx': SNo (mul_SNo x x).
{ apply real_SNo. exact Lxx. }
claim Lyy: mul_SNo y y :e real.
{ exact real_mul_SNo y ?? y ??. }
claim Lyy': SNo (mul_SNo y y).
{ apply real_SNo. exact Lyy. }
claim Lr: r :e real.
{ exact real_add_SNo (mul_SNo x x) ?? (mul_SNo y y) ??. }
claim Lr': SNo r.
{ apply real_SNo. exact Lr. }
claim Lrnz: r <> 0.
{ assume H1: r = 0.
  apply Hznz.
  prove z = 0.
  apply CSNo_ReIm_split z 0 (complex_CSNo z Hz) CSNo_0.
  - prove Re z = Re 0. rewrite Re_0.
    prove x = 0.
    apply SNo_zero_or_sqr_pos x (real_SNo x Lx).
    + assume H2: x = 0. exact H2.
    + assume H2: 0 < mul_SNo x x. prove False.
      apply SNoLt_irref 0.
      prove 0 < 0.
      rewrite <- H1 at 2.
      prove 0 < r.
      apply SNoLtLe_tra 0 (mul_SNo x x) r SNo_0 ?? ?? H2.
      prove mul_SNo x x <= r.
      rewrite <- add_SNo_0R (mul_SNo x x) ?? at 1.
      prove add_SNo (mul_SNo x x) 0 <= r.
      apply add_SNo_Le2 (mul_SNo x x) 0 (mul_SNo y y) ?? SNo_0 ??.
      prove 0 <= mul_SNo y y.
      apply SNo_sqr_nonneg y (real_SNo y Ly).
  - prove Im z = Im 0. rewrite Im_0.
    prove y = 0.
    apply SNo_zero_or_sqr_pos y (real_SNo y Ly).
    + assume H2: y = 0. exact H2.
    + assume H2: 0 < mul_SNo y y. prove False.
      apply SNoLt_irref 0.
      prove 0 < 0.
      rewrite <- H1 at 2.
      prove 0 < r.
      apply SNoLtLe_tra 0 (mul_SNo y y) r SNo_0 ?? ?? H2.
      prove mul_SNo y y <= r.
      rewrite <- add_SNo_0L (mul_SNo y y) ?? at 1.
      prove add_SNo 0 (mul_SNo y y) <= r.
      apply add_SNo_Le1 0 (mul_SNo y y) (mul_SNo x x) SNo_0 ?? ??.
      prove 0 <= mul_SNo x x.
      apply SNo_sqr_nonneg x (real_SNo x Lx).
}
apply nonzero_real_recip_ex r Lr Lrnz.
let u. assume H. apply H.
assume Hu: u :e real.
assume Hu2: mul_SNo r u = 1.
witness (u * x + - i * u * y). apply andI.
- apply complex_add_CSNo.
  + apply complex_mul_CSNo.
    * apply real_complex. exact Hu.
    * apply real_complex. exact ??.
  + apply complex_minus_CSNo.
    apply complex_mul_CSNo.
    * exact complex_i.
    * { apply complex_mul_CSNo.
        - apply real_complex. exact Hu.
        - apply real_complex. exact ??.
      }
- apply CSNo_relative_recip z (complex_CSNo z Hz) u (real_SNo u Hu) Hu2.
Qed.

Theorem complex_real_set_eq : real = {z :e complex | Re z = z}.
apply set_ext.
- let x. assume Hx: x :e real. apply SepI.
  + exact real_complex x Hx.
  + exact real_Re_eq x Hx.
- let z. assume Hz: z :e {z :e complex | Re z = z}.
  apply SepE complex (fun z => Re z = z) z Hz.
  assume Hz1: z :e complex.
  assume Hz2: Re z = z.
  prove z :e real.
  rewrite <- Hz2.
  exact complex_Re_real z Hz1.
Qed.

End Complex.

