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

(** Part 3 **)
Section TaggedSets.

Let tag : set -> set := fun alpha => SetAdjoin alpha {1}.
Postfix ' 100 := tag.

Theorem not_TransSet_Sing1 : ~TransSet {1}.
assume H1: TransSet {1}.
claim L1: 0 :e {1}.
{ exact H1 1 (SingI 1) 0 In_0_1. }
apply neq_0_1.
exact SingE 1 0 L1.
Qed.

Theorem not_ordinal_Sing1 : ~ordinal {1}.
assume H1. apply H1. assume H2 _. exact not_TransSet_Sing1 H2.
Qed.

Theorem tagged_not_ordinal : forall y, ~ordinal (y ').
let y.
assume H1: ordinal (y ').
claim L1: {1} :e y '.
{ prove {1} :e y :\/: {{1}}.
  apply binunionI2.
  exact SingI {1}.
}
apply not_ordinal_Sing1.
exact ordinal_Hered (y ') H1 {1} L1.
Qed.

Theorem tagged_notin_ordinal : forall alpha y, ordinal alpha -> (y ') /:e alpha.
let alpha y.
assume H1 H2.
apply tagged_not_ordinal y.
exact ordinal_Hered alpha H1 (y ') H2.
Qed.

Theorem tagged_eqE_Subq : forall alpha beta, ordinal alpha -> alpha ' = beta ' -> alpha c= beta.
let alpha beta.
assume Ha He.
let gamma.
assume Hc: gamma :e alpha.
claim L1: gamma :e beta '.
{ rewrite <- He.
  prove gamma :e alpha :\/: {{1}}.
  apply binunionI1.
  exact Hc.
}
apply binunionE beta {{1}} gamma L1.
- assume H1: gamma :e beta.
  exact H1.
- assume H1: gamma :e {{1}}.
  prove False.
  apply not_ordinal_Sing1.
  rewrite <- SingE {1} gamma H1.
  exact ordinal_Hered alpha Ha gamma Hc.
Qed.

Theorem tagged_eqE_eq : forall alpha beta, ordinal alpha -> ordinal beta -> alpha ' = beta ' -> alpha = beta.
let alpha beta.
assume Ha Hb He.
exact set_ext alpha beta
       (tagged_eqE_Subq alpha beta Ha He)
       (tagged_eqE_Subq beta alpha Hb (fun q => He (fun u v => q v u))).
Qed.

Theorem tagged_ReplE : forall alpha beta, ordinal alpha -> ordinal beta -> beta ' :e {gamma '|gamma :e alpha} -> beta :e alpha.
let alpha beta.
assume Ha Hb.
assume H1: beta ' :e {gamma '|gamma :e alpha}.
apply ReplE_impred alpha (fun gamma => gamma ') (beta ') H1.
let gamma.
assume H2: gamma :e alpha.
assume H3: beta ' = gamma '.
claim L2: beta = gamma.
{ exact tagged_eqE_eq beta gamma Hb (ordinal_Hered alpha Ha gamma H2) H3. }
rewrite L2. exact H2.
Qed.

Theorem ordinal_notin_tagged_Repl : forall alpha Y, ordinal alpha -> alpha /:e {y '|y :e Y}.
let alpha Y.
assume H1: ordinal alpha.
assume H2: alpha :e {y '|y :e Y}.
apply ReplE_impred Y (fun y => y ') alpha H2.
let y.
assume H3: y :e Y.
assume H4: alpha = y '.
apply tagged_not_ordinal y.
prove ordinal (y ').
rewrite <- H4.
exact H1.
Qed.

Definition SNoElts_ : set -> set := fun alpha => alpha :\/: {beta '|beta :e alpha}.

Theorem SNoElts_mon : forall alpha beta, alpha c= beta -> SNoElts_ alpha c= SNoElts_ beta.
let alpha beta.
assume H1: alpha c= beta.
let x.
assume H2: x :e alpha :\/: {gamma '|gamma :e alpha}.
apply binunionE alpha {gamma '|gamma :e alpha} x H2.
- assume H3: x :e alpha.
  prove x :e beta :\/: {gamma '|gamma :e beta}.
  apply binunionI1.
  apply H1.
  exact H3.
- assume H3: x :e {gamma '|gamma :e alpha}.
  prove x :e beta :\/: {gamma '|gamma :e beta}.
  apply binunionI2.
  prove x :e {gamma '|gamma :e beta}.
  apply ReplE_impred alpha (fun gamma => gamma ') x H3.
  let gamma.
  assume H4: gamma :e alpha.
  assume H5: x = gamma '.
  rewrite H5.
  prove gamma ' :e {gamma '|gamma :e beta}.
  exact ReplI beta (fun gamma => gamma ') gamma (H1 gamma H4).
Qed.

Definition SNo_ : set -> set -> prop := fun alpha x =>
    x c= SNoElts_ alpha
 /\ forall beta :e alpha, exactly1of2 (beta ' :e x) (beta :e x).

Definition PSNo : set -> (set -> prop) -> set :=
  fun alpha p => {beta :e alpha|p beta} :\/: {beta '|beta :e alpha, ~p beta}.

Theorem PNoEq_PSNo : forall alpha, ordinal alpha -> forall p:set -> prop, PNoEq_ alpha (fun beta => beta :e PSNo alpha p) p.
let alpha. assume Ha: ordinal alpha. let p.
let beta. assume Hb: beta :e alpha.
prove beta :e PSNo alpha p <-> p beta.
apply iffI.
- assume H1: beta :e {beta :e alpha|p beta} :\/: {beta '|beta :e alpha, ~p beta}.
  apply binunionE {beta :e alpha|p beta} {beta '|beta :e alpha, ~p beta} beta H1.
  + assume H2: beta :e {beta :e alpha|p beta}.
    exact SepE2 alpha p beta H2.
  + assume H2: beta :e {beta '|beta :e alpha, ~p beta}.
    prove False.
    apply ReplSepE_impred alpha (fun beta => ~p beta) (fun x => x ') beta H2.
    let gamma. assume Hc: gamma :e alpha.
    assume H3: ~p gamma.
    assume H4: beta = gamma '.
    apply tagged_notin_ordinal alpha gamma Ha.
    prove gamma ' :e alpha.
    rewrite <- H4. exact Hb.
- assume H1: p beta.
  prove beta :e PSNo alpha p.
  prove beta :e {beta :e alpha|p beta} :\/: {beta '|beta :e alpha, ~p beta}.
  apply binunionI1.
  apply SepI.
  + exact Hb.
  + exact H1.
Qed.

Theorem SNo_PSNo : forall alpha, ordinal alpha -> forall p:set -> prop, SNo_ alpha (PSNo alpha p).
let alpha. assume Ha. let p.
prove PSNo alpha p c= SNoElts_ alpha
 /\ forall beta :e alpha, exactly1of2 (beta ' :e PSNo alpha p) (beta :e PSNo alpha p).
apply andI.
- let u. assume Hu: u :e PSNo alpha p.
  prove u :e SNoElts_ alpha.
  apply binunionE {beta :e alpha|p beta} {beta '|beta :e alpha, ~p beta} u Hu.
  + assume H1: u :e {beta :e alpha|p beta}. apply SepE alpha p u H1.
    assume H2: u :e alpha.
    assume H3: p u.
    prove u :e alpha :\/: {beta '|beta :e alpha}.
    apply binunionI1.
    exact H2.
  + assume H1: u :e {beta '|beta :e alpha, ~p beta}.
    apply ReplSepE_impred alpha (fun beta => ~p beta) (fun beta => beta ') u H1.
    let beta.
    assume H2: beta :e alpha.
    assume H3: ~p beta.
    assume H4: u = beta '.
    prove u :e alpha :\/: {beta '|beta :e alpha}.
    apply binunionI2.
    prove u :e {beta '|beta :e alpha}.
    rewrite H4.
    exact ReplI alpha (fun beta => beta ') beta H2.
- let beta. assume H1: beta :e alpha.
  claim Lbeta: ordinal beta.
  { exact ordinal_Hered alpha Ha beta H1. }
  prove exactly1of2 (beta ' :e PSNo alpha p) (beta :e PSNo alpha p).
  apply xm (p beta).
  + assume H2: p beta. apply exactly1of2_I2.
    * { prove beta ' /:e PSNo alpha p.
        assume H3: beta ' :e PSNo alpha p.
        apply binunionE {beta :e alpha|p beta} {beta '|beta :e alpha, ~p beta} (beta ') H3.
        - assume H4: beta ' :e {beta :e alpha|p beta}.
          apply SepE alpha p (beta ') H4.
          assume H5: beta ' :e alpha.
          assume H6: p (beta ').
          prove False.
          apply tagged_not_ordinal beta.
          exact ordinal_Hered alpha Ha (beta ') H5.
        - assume H4: beta ' :e {beta '|beta :e alpha, ~p beta}.
          apply ReplSepE_impred alpha (fun beta => ~p beta) (fun beta => beta ') (beta ') H4.
          let gamma.
          assume H5: gamma :e alpha.
          assume H6: ~p gamma.
          assume H7: beta ' = gamma '.
          claim Lgamma: ordinal gamma.
          { exact ordinal_Hered alpha Ha gamma H5. }
          claim L1: beta = gamma.
          { exact tagged_eqE_eq beta gamma Lbeta Lgamma H7. }
          apply H6. prove p gamma. rewrite <- L1. prove p beta. exact H2.
      }
    * prove beta :e {beta :e alpha|p beta} :\/: {beta '|beta :e alpha, ~p beta}.
      apply binunionI1. exact SepI alpha p beta H1 H2.
  + assume H2: ~p beta. apply exactly1of2_I1.
    * prove beta ' :e {beta :e alpha|p beta} :\/: {beta '|beta :e alpha, ~p beta}.
      apply binunionI2.
      exact ReplSepI alpha (fun beta => ~p beta) (fun beta => beta ') beta H1 H2.
    * { prove beta /:e PSNo alpha p.
        assume H3: beta :e PSNo alpha p.
        apply binunionE {beta :e alpha|p beta} {beta '|beta :e alpha, ~p beta} beta H3.
        - assume H4: beta :e {beta :e alpha|p beta}.
          apply SepE alpha p beta H4.
          assume H5: beta :e alpha.
          assume H6: p beta.
          prove False. exact H2 H6.
        - assume H4: beta :e {beta '|beta :e alpha, ~p beta}.
          apply ReplSepE_impred alpha (fun beta => ~p beta) (fun beta => beta ') beta H4.
          let gamma.
          assume H5: gamma :e alpha.
          assume H6: ~p gamma.
          assume H7: beta = gamma '.
          apply tagged_not_ordinal gamma.
          prove ordinal (gamma ').
          rewrite <- H7.
          exact Lbeta.
      }
Qed.

Theorem SNo_PSNo_eta_ : forall alpha x, ordinal alpha -> SNo_ alpha x -> x = PSNo alpha (fun beta => beta :e x).
let alpha x. assume Ha Hx.
apply Hx.
assume Hx1: x c= SNoElts_ alpha.
assume Hx2: forall beta :e alpha, exactly1of2 (beta ' :e x) (beta :e x).
apply set_ext.
- prove x c= PSNo alpha (fun beta => beta :e x).
  let u. assume Hu: u :e x.
  apply binunionE alpha {beta '|beta :e alpha} u (Hx1 u Hu).
  + assume H1: u :e alpha.
    prove u :e {beta :e alpha|beta :e x} :\/: {beta '|beta :e alpha, beta /:e x}.
    apply binunionI1.
    apply SepI.
    * exact H1.
    * exact Hu.
  + assume H1: u :e {beta '|beta :e alpha}.
    apply ReplE_impred alpha (fun beta => beta ') u H1.
    let beta.
    assume H2: beta :e alpha.
    assume H3: u = beta '.
    prove u :e {beta :e alpha|beta :e x} :\/: {beta '|beta :e alpha, beta /:e x}.
    apply binunionI2.
    prove u :e {beta '|beta :e alpha, beta /:e x}.
    rewrite H3.
    prove beta ' :e {beta '|beta :e alpha, beta /:e x}.
    claim L2: beta /:e x.
    { assume H4: beta :e x.
      apply exactly1of2_E (beta ' :e x) (beta :e x) (Hx2 beta H2).
      - assume H5: beta ' :e x.
        assume H6: beta /:e x.
        exact H6 H4.
      - assume H4: beta ' /:e x.
        assume H5: beta :e x.
        apply H4.
        prove (beta ') :e x.
        rewrite <- H3.
        prove u :e x.
        exact Hu.
    }
    exact ReplSepI alpha (fun beta => beta /:e x) (fun beta => beta ') beta H2 L2.
- prove PSNo alpha (fun beta => beta :e x) c= x.
  let u. assume Hu: u :e PSNo alpha (fun beta => beta :e x).
  prove u :e x.
  apply binunionE {beta :e alpha|beta :e x} {beta '|beta :e alpha, beta /:e x} u Hu.
  + assume H1: u :e {beta :e alpha|beta :e x}.
    apply SepE alpha (fun beta => beta :e x) u H1.
    assume H2: u :e alpha.
    assume H3: u :e x.
    exact H3.
  + assume H1: u :e {beta '|beta :e alpha, beta /:e x}.
    apply ReplSepE_impred alpha (fun beta => beta /:e x) (fun beta => beta ') u H1.
    let beta.
    assume H2: beta :e alpha.
    assume H3: beta /:e x.
    assume H4: u = beta '.
    apply exactly1of2_E (beta ' :e x) (beta :e x) (Hx2 beta H2).
    * assume H5: beta ' :e x.
      assume H6: beta /:e x.
      rewrite H4. exact H5.
    * assume H4: beta ' /:e x.
      assume H5: beta :e x.
      prove False.
      exact H3 H5.
Qed.

(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Definition SNo : set -> prop := fun x => exists alpha, ordinal alpha /\ SNo_ alpha x.

Theorem SNo_SNo : forall alpha, ordinal alpha -> forall z, SNo_ alpha z -> SNo z.
let alpha. assume Ha.
let z. assume Hz: SNo_ alpha z.
prove exists alpha, ordinal alpha /\ SNo_ alpha z.
witness alpha. apply andI.
- exact Ha.
- exact Hz.
Qed.

(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Definition SNoLev : set -> set := fun x => Eps_i (fun alpha => ordinal alpha /\ SNo_ alpha x).

Theorem SNoLev_uniq_Subq : forall x alpha beta, ordinal alpha -> ordinal beta -> SNo_ alpha x -> SNo_ beta x -> alpha c= beta.
let x alpha beta. assume Ha Hb Hax Hbx.
let gamma. assume Hc: gamma :e alpha.
prove gamma :e beta.
apply Hax. assume Hax1 Hax2.
apply Hbx. assume Hbx1 Hbx2.
claim Lc: ordinal gamma.
{ exact ordinal_Hered alpha Ha gamma Hc. }
apply exactly1of2_or (gamma ' :e x) (gamma :e x) (Hax2 gamma Hc).
- assume H1: gamma ' :e x.
  claim L1: gamma ' :e beta :\/: {delta '|delta :e beta}.
  { exact Hbx1 (gamma ') H1. }
  claim L2: gamma ' :e beta \/ gamma ' :e {delta '|delta :e beta}.
  { exact binunionE beta {delta '|delta :e beta} (gamma ') L1. }
  apply L2.
  + assume H2: gamma ' :e beta.
    prove False.
    exact tagged_notin_ordinal beta gamma Hb H2.
  + assume H2: gamma ' :e {delta '|delta :e beta}.
    exact tagged_ReplE beta gamma Hb Lc H2.
- assume H1: gamma :e x.
  claim L1: gamma :e beta :\/: {delta '|delta :e beta}.
  { exact Hbx1 gamma H1. }
  claim L2: gamma :e beta \/ gamma :e {delta '|delta :e beta}.
  { exact binunionE beta {delta '|delta :e beta} gamma L1. }
  apply L2.
  + assume H2: gamma :e beta.
    exact H2.
  + assume H2: gamma :e {delta '|delta :e beta}.
    prove False.
    exact ordinal_notin_tagged_Repl gamma beta Lc H2.
Qed.

Theorem SNoLev_uniq : forall x alpha beta, ordinal alpha -> ordinal beta -> SNo_ alpha x -> SNo_ beta x -> alpha = beta.
let x alpha beta. assume Ha Hb Hax Hbx.
apply set_ext.
- exact SNoLev_uniq_Subq x alpha beta Ha Hb Hax Hbx.
- exact SNoLev_uniq_Subq x beta alpha Hb Ha Hbx Hax.
Qed.

Theorem SNoLev_prop : forall x, SNo x -> ordinal (SNoLev x) /\ SNo_ (SNoLev x) x.
let x.
assume Hx: SNo x.
exact Eps_i_ex (fun alpha => ordinal alpha /\ SNo_ alpha x) Hx.
Qed.

Theorem SNoLev_ordinal : forall x, SNo x -> ordinal (SNoLev x).
let x. assume Hx. apply SNoLev_prop x Hx. assume H1 _. exact H1.
Qed.

Theorem SNoLev_ : forall x, SNo x -> SNo_ (SNoLev x) x.
let x. assume Hx. apply SNoLev_prop x Hx. assume _ H1. exact H1.
Qed.

Theorem SNo_PSNo_eta : forall x, SNo x -> x = PSNo (SNoLev x) (fun beta => beta :e x).
let x. assume Hx.
apply SNoLev_prop x Hx.
assume Hx1: ordinal (SNoLev x).
assume Hx2: SNo_ (SNoLev x) x.
apply SNo_PSNo_eta_.
- prove ordinal (SNoLev x). exact Hx1.
- prove SNo_ (SNoLev x) x. exact Hx2.
Qed.

Theorem SNoLev_PSNo : forall alpha, ordinal alpha -> forall p:set -> prop, SNoLev (PSNo alpha p) = alpha.
let alpha. assume Ha: ordinal alpha.
let p.
claim L1: SNo_ alpha (PSNo alpha p).
{ exact SNo_PSNo alpha Ha p. }
claim L2: SNo (PSNo alpha p).
{ prove exists beta, ordinal beta /\ SNo_ beta (PSNo alpha p).
  witness alpha. apply andI.
  - exact Ha.
  - exact L1.
}
apply SNoLev_prop (PSNo alpha p) L2.
assume H2: ordinal (SNoLev (PSNo alpha p)).
assume H3: SNo_ (SNoLev (PSNo alpha p)) (PSNo alpha p).
exact SNoLev_uniq (PSNo alpha p) (SNoLev (PSNo alpha p)) alpha H2 Ha H3 L1.
Qed.

Theorem SNo_Subq : forall x y, SNo x -> SNo y -> SNoLev x c= SNoLev y -> (forall alpha :e SNoLev x, alpha :e x <-> alpha :e y) -> x c= y.
let x y.
assume Hx Hy H1 H2.
apply SNoLev_ x Hx.
assume Hx2a: x c= SNoElts_ (SNoLev x).
assume Hx2b: forall beta :e SNoLev x, exactly1of2 (beta ' :e x) (beta :e x).
apply SNoLev_ y Hy.
assume Hy2a: y c= SNoElts_ (SNoLev y).
assume Hy2b: forall beta :e SNoLev y, exactly1of2 (beta ' :e y) (beta :e y).
let u. assume Hu: u :e x.
claim L1: u :e SNoLev x :\/: {beta '|beta :e SNoLev x}.
{ exact Hx2a u Hu. }
apply binunionE (SNoLev x) {beta '|beta :e SNoLev x} u L1.
- assume H3: u :e SNoLev x.
  apply H2 u H3.
  assume H4 _. exact H4 Hu.
- assume H3: u :e {beta '|beta :e SNoLev x}.
  apply ReplE_impred (SNoLev x) (fun gamma => gamma ') u H3.
  let beta.
  assume H4: beta :e SNoLev x.
  assume H5: u = beta '.
  claim L3: beta :e SNoLev y.
  { exact H1 beta H4. }
  apply exactly1of2_E (beta ' :e y) (beta :e y) (Hy2b beta L3).
  + assume H6: beta ' :e y.
    assume H7: beta /:e y.
    prove u :e y.
    rewrite H5. exact H6.
  + assume H6: beta ' /:e y.
    assume H7: beta :e y.
    prove False.
    apply exactly1of2_E (beta ' :e x) (beta :e x) (Hx2b beta H4).
    * assume H8: beta ' :e x.
      assume H9: beta /:e x.
      apply H9.
      apply H2 beta H4.
      assume _ H10. exact H10 H7.
    * assume H8: beta ' /:e x.
      assume H9: beta :e x.
      apply H8.
      prove beta ' :e x.
      rewrite <- H5.
      exact Hu.
Qed.

Definition SNoEq_ : set -> set -> set -> prop
 := fun alpha x y => PNoEq_ alpha (fun beta => beta :e x) (fun beta => beta :e y).

Theorem SNoEq_I : forall alpha x y, (forall beta :e alpha, beta :e x <-> beta :e y) -> SNoEq_ alpha x y.
let alpha x y. assume Hxy. exact Hxy.
Qed.

Theorem SNo_eq : forall x y, SNo x -> SNo y -> SNoLev x = SNoLev y -> SNoEq_ (SNoLev x) x y -> x = y.
let x y.
assume Hx Hy H1 H2.
apply set_ext.
- prove x c= y. apply SNo_Subq x y Hx Hy.
  + prove SNoLev x c= SNoLev y. rewrite <- H1. apply Subq_ref.
  + exact H2.
- prove y c= x. apply SNo_Subq y x Hy Hx.
  + prove SNoLev y c= SNoLev x. rewrite H1. apply Subq_ref.
  + let alpha. assume H3: alpha :e SNoLev y.
    prove alpha :e y <-> alpha :e x.
    apply iff_sym.
    prove alpha :e x <-> alpha :e y.
    apply H2 alpha.
    prove alpha :e SNoLev x.
    rewrite H1. exact H3.
Qed.

End TaggedSets.

Definition SNoLt : set -> set -> prop :=
  fun x y => PNoLt (SNoLev x) (fun beta => beta :e x) (SNoLev y) (fun beta => beta :e y).

Infix < 490 := SNoLt.

Definition SNoLe : set -> set -> prop :=
  fun x y => PNoLe (SNoLev x) (fun beta => beta :e x) (SNoLev y) (fun beta => beta :e y).

(* Unicode <= "2264" *)
Infix <= 490 := SNoLe.

Theorem SNoLtLe : forall x y, x < y -> x <= y.
let x y. assume H1.
prove PNoLe (SNoLev x) (fun beta => beta :e x) (SNoLev y) (fun beta => beta :e y).
apply PNoLeI1.
exact H1.
Qed.

Theorem SNoLeE : forall x y, SNo x -> SNo y -> x <= y -> x < y \/ x = y.
let x y. assume Hx Hy.
assume H1: PNoLe (SNoLev x) (fun beta => beta :e x) (SNoLev y) (fun beta => beta :e y).
apply H1.
- assume H2: PNoLt (SNoLev x) (fun beta => beta :e x) (SNoLev y) (fun beta => beta :e y).
  apply orIL.
  exact H2.
- assume H2. apply H2.
  assume H2: SNoLev x = SNoLev y.
  assume H3: PNoEq_ (SNoLev x) (fun beta => beta :e x) (fun beta => beta :e y).
  apply orIR.
  exact SNo_eq x y Hx Hy H2 H3.
Qed.

Theorem SNoEq_sym_ : forall alpha x y, SNoEq_ alpha x y -> SNoEq_ alpha y x.
let alpha x y.
exact PNoEq_sym_ alpha (fun beta => beta :e x) (fun beta => beta :e y).
Qed.

Theorem SNoEq_tra_ : forall alpha x y z, SNoEq_ alpha x y -> SNoEq_ alpha y z -> SNoEq_ alpha x z.
let alpha x y z.
exact PNoEq_tra_ alpha (fun beta => beta :e x) (fun beta => beta :e y) (fun beta => beta :e z).
Qed.

Theorem SNoLtE : forall x y, SNo x -> SNo y -> x < y ->
 forall p:prop,
    (forall z, SNo z -> SNoLev z :e SNoLev x :/\: SNoLev y -> SNoEq_ (SNoLev z) z x -> SNoEq_ (SNoLev z) z y -> x < z -> z < y -> SNoLev z /:e x -> SNoLev z :e y -> p)
 -> (SNoLev x :e SNoLev y -> SNoEq_ (SNoLev x) x y -> SNoLev x :e y -> p)
 -> (SNoLev y :e SNoLev x -> SNoEq_ (SNoLev y) x y -> SNoLev y /:e x -> p)
 -> p.
let x y.
assume Hx: SNo x.
assume Hy: SNo y.
assume Hxy: PNoLt (SNoLev x) (fun beta => beta :e x) (SNoLev y) (fun beta => beta :e y).
let p.
assume Hp1 Hp2 Hp3.
claim LLx: ordinal (SNoLev x).
{ apply SNoLev_ordinal x. exact Hx. }
claim LLy: ordinal (SNoLev y).
{ apply SNoLev_ordinal y. exact Hy. }
apply PNoLtE (SNoLev x) (SNoLev y) (fun beta => beta :e x) (fun beta => beta :e y) Hxy.
- assume H1: PNoLt_ (SNoLev x :/\: SNoLev y) (fun beta => beta :e x) (fun beta => beta :e y).
  apply PNoLt_E_ (SNoLev x :/\: SNoLev y) (fun beta => beta :e x) (fun beta => beta :e y) H1.
  let alpha.
  assume Ha: alpha :e SNoLev x :/\: SNoLev y.
  assume H2: PNoEq_ alpha (fun beta => beta :e x) (fun beta => beta :e y).
  assume H3: alpha /:e x.
  assume H4: alpha :e y.
  apply binintersectE (SNoLev x) (SNoLev y) alpha Ha.
  assume Ha1: alpha :e SNoLev x.
  assume Ha2: alpha :e SNoLev y.
  claim La: ordinal alpha.
  { exact ordinal_Hered (SNoLev x) LLx alpha Ha1. }
  set z := PSNo alpha (fun beta => beta :e x).
  claim L1: SNo_ alpha z.
  { apply SNo_PSNo. exact La. }
  claim L2: SNo z.
  { prove exists alpha, ordinal alpha /\ SNo_ alpha z.
    witness alpha. apply andI.
    - exact La.
    - exact L1.
  }
  apply SNoLev_prop z L2.
  assume Hz1: ordinal (SNoLev z).
  assume Hz2: SNo_ (SNoLev z) z.
  claim L3: SNoLev z = alpha.
  { exact SNoLev_uniq z (SNoLev z) alpha Hz1 La Hz2 L1. }
  claim L4: SNoEq_ alpha z x.
  { prove PNoEq_ alpha (fun beta => beta :e z) (fun beta => beta :e x).
    prove PNoEq_ alpha (fun beta => beta :e PSNo alpha (fun beta => beta :e x)) (fun beta => beta :e x).
    apply PNoEq_PSNo.
    exact La.
  }
  claim L5: SNoEq_ alpha z y.
  { apply SNoEq_tra_ alpha z x y L4.
    prove SNoEq_ alpha x y.
    prove PNoEq_ alpha (fun beta => beta :e x) (fun beta => beta :e y).
    exact H2.
  }
  apply Hp1 z L2.
  + prove SNoLev z :e SNoLev x :/\: SNoLev y.
    rewrite L3. exact Ha.
  + prove SNoEq_ (SNoLev z) z x. rewrite L3. exact L4.
  + prove SNoEq_ (SNoLev z) z y. rewrite L3. exact L5.
  + prove x < z.
    prove PNoLt (SNoLev x) (fun beta => beta :e x) (SNoLev z) (fun beta => beta :e z).
    rewrite L3.
    prove PNoLt (SNoLev x) (fun beta => beta :e x) alpha (fun beta => beta :e z).
    apply PNoLtI3.
    * prove alpha :e SNoLev x.
      exact Ha1.
    * prove PNoEq_ alpha (fun beta => beta :e x) (fun beta => beta :e z).
      apply PNoEq_sym_.
      exact L4.
    * prove alpha /:e x.
      exact H3.
  + prove z < y.
    prove PNoLt (SNoLev z) (fun beta => beta :e z) (SNoLev y) (fun beta => beta :e y).
    rewrite L3.
    prove PNoLt alpha (fun beta => beta :e z) (SNoLev y) (fun beta => beta :e y).
    apply PNoLtI2.
    * prove alpha :e SNoLev y.
      exact Ha2.
    * prove PNoEq_ alpha (fun beta => beta :e z) (fun beta => beta :e y).
      exact L5.
    * prove alpha :e y.
      exact H4.
  + prove SNoLev z /:e x.
    rewrite L3. exact H3.
  + prove SNoLev z :e y.
    rewrite L3. exact H4.
- assume H1: SNoLev x :e SNoLev y.
  assume H2: PNoEq_ (SNoLev x) (fun beta => beta :e x) (fun beta => beta :e y).
  assume H3: SNoLev x :e y.
  apply Hp2.
  + prove SNoLev x :e SNoLev y. exact H1.
  + prove SNoEq_ (SNoLev x) x y. exact H2.
  + prove SNoLev x :e y. exact H3.
- assume H1: SNoLev y :e SNoLev x.
  assume H2: PNoEq_ (SNoLev y) (fun beta => beta :e x) (fun beta => beta :e y).
  assume H3: SNoLev y /:e x.
  apply Hp3.
  + prove SNoLev y :e SNoLev x. exact H1.
  + prove SNoEq_ (SNoLev y) x y. exact H2.
  + prove SNoLev y /:e x. exact H3.
Qed.

(** The analogous thm to PNoLtI1 can be recovered by SNoLt_tra (transitivity) and SNoLtI2 and SNoLtI3. **)

Theorem SNoLtI2 : forall x y,
     SNoLev x :e SNoLev y
  -> SNoEq_ (SNoLev x) x y
  -> SNoLev x :e y
  -> x < y.
let x y.
assume H1 H2 H3.
prove PNoLt (SNoLev x) (fun beta => beta :e x) (SNoLev y) (fun beta => beta :e y).
apply PNoLtI2.
- exact H1.
- exact H2.
- exact H3.
Qed.

Theorem SNoLtI3 : forall x y,
     SNoLev y :e SNoLev x
  -> SNoEq_ (SNoLev y) x y
  -> SNoLev y /:e x
  -> x < y.
let x y.
assume H1 H2 H3.
prove PNoLt (SNoLev x) (fun beta => beta :e x) (SNoLev y) (fun beta => beta :e y).
apply PNoLtI3.
- exact H1.
- exact H2.
- exact H3.
Qed.

Theorem SNoLt_irref : forall x, ~SNoLt x x.
let x.
exact PNoLt_irref (SNoLev x) (fun beta => beta :e x).
Qed.

Theorem SNoLt_trichotomy_or : forall x y, SNo x -> SNo y -> x < y \/ x = y \/ y < x.
let x y. assume Hx Hy.
apply PNoLt_trichotomy_or (SNoLev x) (SNoLev y) (fun beta => beta :e x) (fun beta => beta :e y) (SNoLev_ordinal x Hx) (SNoLev_ordinal y Hy). assume H1. apply H1.
- assume H1. apply or3I1. exact H1.
- assume H1. apply H1.
  assume H2: SNoLev x = SNoLev y.
  assume H3: PNoEq_ (SNoLev x) (fun beta => beta :e x) (fun beta => beta :e y).
  apply or3I2. exact SNo_eq x y Hx Hy H2 H3.
- assume H1. apply or3I3. exact H1.
Qed.

Theorem SNoLt_trichotomy_or_impred : forall x y, SNo x -> SNo y ->
  forall p:prop,
      (x < y -> p)
   -> (x = y -> p)
   -> (y < x -> p)
   -> p.
let x y. assume Hx Hy. let p. assume Hp1 Hp2 Hp3.
apply SNoLt_trichotomy_or x y Hx Hy. assume H. apply H.
- exact Hp1.
- exact Hp2.
- exact Hp3.
Qed.

Theorem SNoLt_tra : forall x y z, SNo x -> SNo y -> SNo z -> x < y -> y < z -> x < z.
let x y z. assume Hx Hy Hz Hxy Hyz.
prove PNoLt (SNoLev x) (fun beta => beta :e x) (SNoLev z) (fun beta => beta :e z).
exact PNoLt_tra (SNoLev x) (SNoLev y) (SNoLev z) (SNoLev_ordinal x Hx) (SNoLev_ordinal y Hy) (SNoLev_ordinal z Hz) (fun beta => beta :e x) (fun beta => beta :e y) (fun beta => beta :e z) Hxy Hyz.
Qed.

Theorem SNoLe_ref : forall x, SNoLe x x.
let x. exact PNoLe_ref (SNoLev x) (fun beta => beta :e x).
Qed.

Theorem SNoLe_antisym : forall x y, SNo x -> SNo y -> x <= y -> y <= x -> x = y.
let x y. assume Hx Hy Hxy Hyx.
apply PNoLe_antisym (SNoLev x) (SNoLev y) (SNoLev_ordinal x Hx) (SNoLev_ordinal y Hy) (fun beta => beta :e x) (fun beta => beta :e y) Hxy Hyx.
assume H1: SNoLev x = SNoLev y.
assume H2: PNoEq_ (SNoLev x) (fun beta => beta :e x) (fun beta => beta :e y).
exact SNo_eq x y Hx Hy H1 H2.
Qed.

Theorem SNoLtLe_tra : forall x y z, SNo x -> SNo y -> SNo z -> x < y -> y <= z -> x < z.
let x y z. assume Hx Hy Hz Hxy Hyz.
exact PNoLtLe_tra (SNoLev x) (SNoLev y) (SNoLev z) (SNoLev_ordinal x Hx) (SNoLev_ordinal y Hy) (SNoLev_ordinal z Hz) (fun beta => beta :e x) (fun beta => beta :e y) (fun beta => beta :e z) Hxy Hyz.
Qed.

Theorem SNoLeLt_tra : forall x y z, SNo x -> SNo y -> SNo z -> x <= y -> y < z -> x < z.
let x y z. assume Hx Hy Hz Hxy Hyz.
exact PNoLeLt_tra (SNoLev x) (SNoLev y) (SNoLev z) (SNoLev_ordinal x Hx) (SNoLev_ordinal y Hy) (SNoLev_ordinal z Hz) (fun beta => beta :e x) (fun beta => beta :e y) (fun beta => beta :e z) Hxy Hyz.
Qed.

Theorem SNoLe_tra : forall x y z, SNo x -> SNo y -> SNo z -> x <= y -> y <= z -> x <= z.
let x y z. assume Hx Hy Hz Hxy Hyz.
exact PNoLe_tra (SNoLev x) (SNoLev y) (SNoLev z) (SNoLev_ordinal x Hx) (SNoLev_ordinal y Hy) (SNoLev_ordinal z Hz) (fun beta => beta :e x) (fun beta => beta :e y) (fun beta => beta :e z) Hxy Hyz.
Qed.

Theorem SNoLtLe_or : forall x y, SNo x -> SNo y -> x < y \/ y <= x.
let x y.
assume Hx Hy.
apply SNoLt_trichotomy_or x y Hx Hy. assume H1. apply H1.
- assume H1: x < y. apply orIL. exact H1.
- assume H1: x = y. apply orIR. prove y <= x. rewrite H1. prove y <= y. apply SNoLe_ref.
- assume H1: y < x. apply orIR. prove y <= x. apply SNoLtLe. exact H1.
Qed.

Theorem SNoLt_PSNo_PNoLt : forall alpha beta, forall p q:set -> prop,
 ordinal alpha -> ordinal beta ->
 PSNo alpha p < PSNo beta q -> PNoLt alpha p beta q.
let alpha beta p q.
assume Ha Hb.
prove PNoLt (SNoLev (PSNo alpha p)) (fun gamma => gamma :e PSNo alpha p) (SNoLev (PSNo beta q)) (fun gamma => gamma :e PSNo beta q)
  -> PNoLt alpha p beta q.
rewrite SNoLev_PSNo alpha Ha p.
rewrite SNoLev_PSNo beta Hb q.
assume H1: PNoLt alpha (fun gamma => gamma :e PSNo alpha p) beta (fun gamma => gamma :e PSNo beta q).
apply PNoEqLt_tra alpha beta Ha Hb p (fun gamma => gamma :e PSNo alpha p) q.
- prove PNoEq_ alpha p (fun gamma => gamma :e PSNo alpha p).
  apply PNoEq_sym_.
  apply PNoEq_PSNo.
  exact Ha.
- prove PNoLt alpha (fun gamma => gamma :e PSNo alpha p) beta q.
  apply PNoLtEq_tra alpha beta Ha Hb (fun gamma => gamma :e PSNo alpha p) (fun gamma => gamma :e PSNo beta q) q.
  + exact H1.
  + prove PNoEq_ beta (fun gamma => gamma :e PSNo beta q) q.
    apply PNoEq_PSNo.
    exact Hb.
Qed.

Theorem PNoLt_SNoLt_PSNo : forall alpha beta, forall p q:set -> prop,
 ordinal alpha -> ordinal beta ->
 PNoLt alpha p beta q -> PSNo alpha p < PSNo beta q.
let alpha beta p q.
assume Ha Hb.
assume H1: PNoLt alpha p beta q.
prove PNoLt (SNoLev (PSNo alpha p)) (fun gamma => gamma :e PSNo alpha p) (SNoLev (PSNo beta q)) (fun gamma => gamma :e PSNo beta q).
rewrite SNoLev_PSNo alpha Ha p.
rewrite SNoLev_PSNo beta Hb q.
prove PNoLt alpha (fun gamma => gamma :e PSNo alpha p) beta (fun gamma => gamma :e PSNo beta q).
apply PNoEqLt_tra alpha beta Ha Hb (fun gamma => gamma :e PSNo alpha p) p (fun gamma => gamma :e PSNo beta q).
- prove PNoEq_ alpha (fun gamma => gamma :e PSNo alpha p) p.
  apply PNoEq_PSNo.
  exact Ha.
- prove PNoLt alpha p beta (fun gamma => gamma :e PSNo beta q).
  apply PNoLtEq_tra alpha beta Ha Hb p q (fun gamma => gamma :e PSNo beta q).
  + exact H1.
  + prove PNoEq_ beta q (fun gamma => gamma :e PSNo beta q).
    apply PNoEq_sym_.
    apply PNoEq_PSNo.
    exact Hb.
Qed.

Definition SNoCut : set -> set -> set :=
  fun L R => PSNo (PNo_bd (fun alpha p => ordinal alpha /\ PSNo alpha p :e L) (fun alpha p => ordinal alpha /\ PSNo alpha p :e R)) (PNo_pred (fun alpha p => ordinal alpha /\ PSNo alpha p :e L) (fun alpha p => ordinal alpha /\ PSNo alpha p :e R)).

Definition SNoCutP : set -> set -> prop :=
 fun L R =>
      (forall x :e L, SNo x)
   /\ (forall y :e R, SNo y)
   /\ (forall x :e L, forall y :e R, x < y).

Theorem SNoCutP_SNoCut : forall L R, SNoCutP L R
 -> SNo (SNoCut L R)
 /\ SNoLev (SNoCut L R) :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y)))
 /\ (forall x :e L, x < SNoCut L R)
 /\ (forall y :e R, SNoCut L R < y)
 /\ (forall z, SNo z -> (forall x :e L, x < z) -> (forall y :e R, z < y) -> SNoLev (SNoCut L R) c= SNoLev z /\ SNoEq_ (SNoLev (SNoCut L R)) (SNoCut L R) z).
let L R.
assume HC: SNoCutP L R.
apply HC. assume HC. apply HC.
assume HL: forall x :e L, SNo x.
assume HR: forall y :e R, SNo y.
assume HLR: forall x :e L, forall y :e R, x < y.
set L' : set -> (set -> prop) -> prop := fun alpha p => ordinal alpha /\ PSNo alpha p :e L.
set R' : set -> (set -> prop) -> prop := fun alpha p => ordinal alpha /\ PSNo alpha p :e R.
set tau := PNo_bd L' R'.
set w := PNo_pred L' R'.
set alpha := \/_ x :e L, ordsucc (SNoLev x).
set beta := \/_ y :e R, ordsucc (SNoLev y).
prove SNo (SNoCut L R)
 /\ SNoLev (SNoCut L R) :e ordsucc (alpha :\/: beta)
 /\ (forall x :e L, x < SNoCut L R)
 /\ (forall y :e R, SNoCut L R < y)
 /\ (forall z, SNo z -> (forall x :e L, x < z) -> (forall y :e R, z < y) -> SNoLev (SNoCut L R) c= SNoLev z /\ PNoEq_ (SNoLev (SNoCut L R)) (fun gamma => gamma :e SNoCut L R) (fun gamma => gamma :e z)).
claim LLR: PNoLt_pwise L' R'.
{ let gamma. assume Hc: ordinal gamma. let p.
  assume H1: L' gamma p. apply H1. assume _ H1.
  let delta. assume Hd: ordinal delta. let q.
  assume H2: R' delta q. apply H2. assume _ H2.
  prove PNoLt gamma p delta q.
  apply SNoLt_PSNo_PNoLt gamma delta p q Hc Hd.
  prove PSNo gamma p < PSNo delta q.
  exact HLR (PSNo gamma p) H1 (PSNo delta q) H2.
}
claim La: ordinal alpha.
{ apply ordinal_famunion L (fun x => ordsucc (SNoLev x)).
  let x. assume Hx: x :e L.
  prove ordinal (ordsucc (SNoLev x)).
  apply ordinal_ordsucc.
  apply SNoLev_ordinal.
  prove SNo x. exact HL x Hx.
}
claim Lb: ordinal beta.
{ apply ordinal_famunion R (fun y => ordsucc (SNoLev y)).
  let y. assume Hy: y :e R.
  prove ordinal (ordsucc (SNoLev y)).
  apply ordinal_ordsucc.
  apply SNoLev_ordinal.
  prove SNo y. exact HR y Hy.
}
claim Lab: ordinal (alpha :\/: beta).
{ apply ordinal_linear alpha beta La Lb.
  - prove alpha c= beta -> ordinal (alpha :\/: beta).
    rewrite Subq_binunion_eq alpha beta.
    prove alpha :\/: beta = beta -> ordinal (alpha :\/: beta).
    assume H1. rewrite H1. exact Lb.
  - prove beta c= alpha -> ordinal (alpha :\/: beta).
    rewrite Subq_binunion_eq beta alpha.
    prove beta :\/: alpha = alpha -> ordinal (alpha :\/: beta).
    assume H1. rewrite binunion_com. rewrite H1. exact La.
}
claim LLab: PNo_lenbdd (alpha :\/: beta) L'.
{ let gamma. let p.
  assume H1. apply H1.
  assume H1: ordinal gamma.
  assume H2: PSNo gamma p :e L.
  prove gamma :e alpha :\/: beta.
  apply binunionI1.
  prove gamma :e \/_ x :e L, ordsucc (SNoLev x).
  apply famunionI L (fun x => ordsucc (SNoLev x)) (PSNo gamma p) gamma.
  + prove PSNo gamma p :e L. exact H2.
  + prove gamma :e ordsucc (SNoLev (PSNo gamma p)).
    rewrite SNoLev_PSNo gamma H1 p.
    prove gamma :e ordsucc gamma. apply ordsuccI2.
}
claim LRab: PNo_lenbdd (alpha :\/: beta) R'.
{ let gamma. let p.
  assume H1. apply H1.
  assume H1: ordinal gamma.
  assume H2: PSNo gamma p :e R.
  prove gamma :e alpha :\/: beta.
  apply binunionI2.
  prove gamma :e \/_ y :e R, ordsucc (SNoLev y).
  apply famunionI R (fun y => ordsucc (SNoLev y)) (PSNo gamma p) gamma.
  + prove PSNo gamma p :e R. exact H2.
  + prove gamma :e ordsucc (SNoLev (PSNo gamma p)).
    rewrite SNoLev_PSNo gamma H1 p.
    prove gamma :e ordsucc gamma. apply ordsuccI2.
}
apply PNo_bd_pred L' R' LLR (alpha :\/: beta) Lab LLab LRab.
assume H1. apply H1.
assume H1: ordinal tau.
assume H2: PNo_strict_imv L' R' tau w.
assume H3: forall gamma :e tau,
           forall q:set -> prop, ~PNo_strict_imv L' R' gamma q.
apply H2.
assume H4: PNo_strict_upperbd L' tau w.
assume H5: PNo_strict_lowerbd R' tau w.
claim LNoC: SNo (SNoCut L R).
{ prove SNo (PSNo tau w).
  prove exists alpha, ordinal alpha /\ SNo_ alpha (PSNo tau w).
  witness tau.
  apply andI.
  - exact H1.
  - prove SNo_ tau (PSNo tau w).
    apply SNo_PSNo tau.
    prove ordinal tau.
    exact H1.
}
claim LLleveqtau: SNoLev (SNoCut L R) = tau.
{ exact SNoLev_PSNo tau H1 (PNo_pred L' R'). }
claim LLbdtau: tau :e ordsucc (alpha :\/: beta).
{ exact PNo_bd_In L' R' LLR (alpha :\/: beta) Lab LLab LRab. }
claim LLbd: SNoLev (SNoCut L R) :e ordsucc (alpha :\/: beta).
{ rewrite LLleveqtau. exact LLbdtau. }
claim LLecw: PNoEq_ tau (fun gamma => gamma :e SNoCut L R) w.
{ prove PNoEq_ tau (fun gamma => gamma :e PSNo tau w) w.
  exact PNoEq_PSNo tau H1 w.
}
claim LLC: ordinal (SNoLev (SNoCut L R)).
{ apply SNoLev_ordinal. exact LNoC. }
claim LL: forall x :e L, x < SNoCut L R.
{ let x. assume Hx: x :e L.
  prove x < SNoCut L R.
  prove x < PSNo tau w.
  claim L1: SNo x.
  { exact HL x Hx. }
  claim LLx: ordinal (SNoLev x).
  { exact SNoLev_ordinal x L1. }
  claim L2: x = PSNo (SNoLev x) (fun gamma => gamma :e x).
  { apply SNo_PSNo_eta. exact L1. }
  claim L3: L' (SNoLev x) (fun gamma => gamma :e x).
  { prove ordinal (SNoLev x) /\ PSNo (SNoLev x) (fun gamma => gamma :e x) :e L.
    apply andI.
    - exact LLx.
    - rewrite <- L2.
      exact Hx.
  }
  prove x < PSNo tau w.
  rewrite L2.
  apply PNoLt_SNoLt_PSNo (SNoLev x) tau (fun gamma => gamma :e x) w LLx H1.
  prove PNoLt (SNoLev x) (fun gamma => gamma :e x) tau w.
  exact H4 (SNoLev x) LLx (fun gamma => gamma :e x) L3.
}
claim LR: forall y :e R, SNoCut L R < y.
{ let y. assume Hy: y :e R.
  prove SNoCut L R < y.
  prove PSNo tau w < y.
  claim L1: SNo y.
  { exact HR y Hy. }
  claim LLy: ordinal (SNoLev y).
  { exact SNoLev_ordinal y L1. }
  claim L2: y = PSNo (SNoLev y) (fun gamma => gamma :e y).
  { apply SNo_PSNo_eta. exact L1. }
  claim L3: R' (SNoLev y) (fun gamma => gamma :e y).
  { prove ordinal (SNoLev y) /\ PSNo (SNoLev y) (fun gamma => gamma :e y) :e R.
    apply andI.
    - exact LLy.
    - rewrite <- L2.
      exact Hy.
  }
  prove PSNo tau w < y.
  rewrite L2.
  apply PNoLt_SNoLt_PSNo tau (SNoLev y) w (fun gamma => gamma :e y) H1 LLy.
  prove PNoLt tau w (SNoLev y) (fun gamma => gamma :e y).
  exact H5 (SNoLev y) LLy (fun gamma => gamma :e y) L3.
}
apply and5I.
- exact LNoC.
- exact LLbd.
- exact LL.
- exact LR.
- prove forall z, SNo z -> (forall x :e L, x < z) -> (forall y :e R, z < y) -> SNoLev (SNoCut L R) c= SNoLev z /\ PNoEq_ (SNoLev (SNoCut L R)) (fun gamma => gamma :e SNoCut L R) (fun gamma => gamma :e z).
  let z. assume Hz: SNo z.
  assume H10: forall x :e L, x < z.
  assume H11: forall y :e R, z < y.
  claim LLz: ordinal (SNoLev z).
  { apply SNoLev_ordinal. exact Hz. }
  claim Lzimv: PNo_strict_imv L' R' (SNoLev z) (fun gamma => gamma :e z).
  { prove PNo_strict_upperbd L' (SNoLev z) (fun gamma => gamma :e z)
       /\ PNo_strict_lowerbd R' (SNoLev z) (fun gamma => gamma :e z).
    apply andI.
    - let gamma. assume Hc: ordinal gamma.
      let q. assume Hq: L' gamma q.
      prove PNoLt gamma q (SNoLev z) (fun gamma => gamma :e z).
      apply Hq.
      assume Hq1: ordinal gamma.
      assume Hq2: PSNo gamma q :e L.
      apply SNoLt_PSNo_PNoLt gamma (SNoLev z) q (fun gamma => gamma :e z) Hc LLz.
      prove PSNo gamma q < PSNo (SNoLev z) (fun gamma => gamma :e z).
      rewrite <- SNo_PSNo_eta z Hz.
      prove PSNo gamma q < z.
      exact H10 (PSNo gamma q) Hq2.
    - let gamma. assume Hc: ordinal gamma.
      let q. assume Hq: R' gamma q.
      prove PNoLt (SNoLev z) (fun gamma => gamma :e z) gamma q.
      apply Hq.
      assume Hq1: ordinal gamma.
      assume Hq2: PSNo gamma q :e R.
      apply SNoLt_PSNo_PNoLt (SNoLev z) gamma (fun gamma => gamma :e z) q LLz Hc.
      prove PSNo (SNoLev z) (fun gamma => gamma :e z) < PSNo gamma q.
      rewrite <- SNo_PSNo_eta z Hz.
      prove z < PSNo gamma q.
      exact H11 (PSNo gamma q) Hq2.
  }
  claim LLznt: SNoLev z /:e tau.
  { assume H12: SNoLev z :e tau.
    exact H3 (SNoLev z) H12 (fun gamma => gamma :e z) Lzimv.
  }
  claim LLzlet : tau c= SNoLev z.
  { apply ordinal_In_Or_Subq (SNoLev z) tau LLz H1.
    - assume H12: SNoLev z :e tau. prove False. exact LLznt H12.
    - assume H12. exact H12.
  }
  prove SNoLev (SNoCut L R) c= SNoLev z /\ PNoEq_ (SNoLev (SNoCut L R)) (fun gamma => gamma :e SNoCut L R) (fun gamma => gamma :e z).
  rewrite LLleveqtau.
  prove tau c= SNoLev z /\ PNoEq_ tau (fun gamma => gamma :e SNoCut L R) (fun gamma => gamma :e z).
  apply andI.
  + prove tau c= SNoLev z.
    exact LLzlet.
  + prove PNoEq_ tau (fun gamma => gamma :e SNoCut L R) (fun gamma => gamma :e z).
    apply PNoLt_trichotomy_or_ w (fun gamma => gamma :e z) tau H1. assume H12. apply H12.
    * { assume H12: PNoLt_ tau w (fun gamma => gamma :e z).
        prove False.
        apply H12.
        let delta. assume H13. apply H13.
        assume Hd: delta :e tau.
        assume H13. apply H13. assume H13. apply H13.
        assume H13: PNoEq_ delta w (fun gamma => gamma :e z).
        assume H14: ~w delta.
        assume H15: delta :e z.
        claim Ld: ordinal delta.
        { exact ordinal_Hered tau H1 delta Hd. }
        claim Lsd: ordinal (ordsucc delta).
        { exact ordinal_ordsucc delta Ld. }
        set z0 : set -> prop := fun eps => eps :e z /\ eps <> delta.
        set z1 : set -> prop := fun eps => eps :e z \/ eps = delta.
        claim Lnz0d: ~z0 delta.
        { assume H10. apply H10.
          assume H11: delta :e z.
          assume H12: delta <> delta.
          apply H12. reflexivity.
        }
        claim Lz1d: z1 delta.
        { prove delta :e z \/ delta = delta.
          apply orIR. reflexivity.
        }
        apply H3 delta Hd (fun gamma => gamma :e z).
        prove PNo_strict_imv L' R' delta (fun gamma => gamma :e z).
        apply PNo_rel_split_imv_imp_strict_imv L' R' delta Ld (fun gamma => gamma :e z).
        prove PNo_rel_strict_split_imv L' R' delta (fun gamma => gamma :e z).
        prove PNo_rel_strict_imv L' R' (ordsucc delta) z0
           /\ PNo_rel_strict_imv L' R' (ordsucc delta) z1.
        apply andI.
        - prove PNo_rel_strict_imv L' R' (ordsucc delta) z0.
          apply PNoEq_rel_strict_imv L' R' (ordsucc delta) Lsd w z0.
          + prove PNoEq_ (ordsucc delta) w z0.
            let eps. assume He: eps :e ordsucc delta.
            apply ordsuccE delta eps He.
            * { assume He1: eps :e delta.
                apply iff_trans (w eps) (eps :e z) (z0 eps).
                - exact H13 eps He1.
                - exact PNo_extend0_eq delta (fun gamma => gamma :e z) eps He1.
              }
            * { assume He1: eps = delta.
                prove w eps <-> z0 eps.
                rewrite He1.
                prove w delta <-> z0 delta.
                apply iffI.
                - assume H16: w delta. prove False. exact H14 H16.
                - assume H16: z0 delta. prove False. exact Lnz0d H16.
              }
          + prove PNo_rel_strict_imv L' R' (ordsucc delta) w.
            apply PNo_strict_imv_imp_rel_strict_imv L' R' tau H1 (ordsucc delta).
            * prove ordsucc delta :e ordsucc tau.
              apply ordinal_ordsucc_In tau H1. exact Hd.
            * prove PNo_strict_imv L' R' tau w. exact H2.
        - prove PNo_rel_strict_imv L' R' (ordsucc delta) z1.
          apply PNoEq_rel_strict_imv L' R' (ordsucc delta) Lsd (fun gamma => gamma :e z) z1.
          + prove PNoEq_ (ordsucc delta) (fun gamma => gamma :e z) z1.
            let eps. assume He: eps :e ordsucc delta.
            apply ordsuccE delta eps He.
            * assume He1: eps :e delta.
              exact PNo_extend1_eq delta (fun gamma => gamma :e z) eps He1.
            * { assume He1: eps = delta.
                prove eps :e z <-> z1 eps.
                rewrite He1.
                prove delta :e z <-> z1 delta.
                apply iffI.
                - assume _. exact Lz1d.
                - assume _. exact H15.
              }
          + prove PNo_rel_strict_imv L' R' (ordsucc delta) (fun gamma => gamma :e z).
            apply PNo_strict_imv_imp_rel_strict_imv L' R' (SNoLev z) LLz (ordsucc delta).
            * prove ordsucc delta :e ordsucc (SNoLev z).
              apply ordinal_ordsucc_In (SNoLev z) LLz.
              prove delta :e SNoLev z.
              apply LLzlet.
              prove delta :e tau. exact Hd.
            * prove PNo_strict_imv L' R' (SNoLev z) (fun gamma => gamma :e z).
              exact Lzimv.
      }
    * { assume H12: PNoEq_ tau w (fun gamma => gamma :e z).
        apply PNoEq_tra_ tau (fun gamma => gamma :e SNoCut L R) w (fun gamma => gamma :e z).
        - prove PNoEq_ tau (fun gamma => gamma :e SNoCut L R) w.
          exact LLecw.
        - prove PNoEq_ tau w (fun gamma => gamma :e z). exact H12.
      }    
    * { assume H12: PNoLt_ tau (fun gamma => gamma :e z) w.
        prove False.
        apply H12.
        let delta. assume H13. apply H13.
        assume Hd: delta :e tau.
        assume H13. apply H13. assume H13. apply H13.
        assume H13: PNoEq_ delta (fun gamma => gamma :e z) w.
        assume H14: delta /:e z.
        assume H15: w delta.
        claim Ld: ordinal delta.
        { exact ordinal_Hered tau H1 delta Hd. }
        claim Lsd: ordinal (ordsucc delta).
        { exact ordinal_ordsucc delta Ld. }
        set z0 : set -> prop := fun eps => eps :e z /\ eps <> delta.
        set z1 : set -> prop := fun eps => eps :e z \/ eps = delta.
        claim Lnz0d: ~z0 delta.
        { assume H10. apply H10.
          assume H11: delta :e z.
          assume H12: delta <> delta.
          apply H12. reflexivity.
        }
        claim Lz1d: z1 delta.
        { prove delta :e z \/ delta = delta.
          apply orIR. reflexivity.
        }
        apply H3 delta Hd (fun gamma => gamma :e z).
        prove PNo_strict_imv L' R' delta (fun gamma => gamma :e z).
        apply PNo_rel_split_imv_imp_strict_imv L' R' delta Ld (fun gamma => gamma :e z).
        prove PNo_rel_strict_split_imv L' R' delta (fun gamma => gamma :e z).
        prove PNo_rel_strict_imv L' R' (ordsucc delta) z0
           /\ PNo_rel_strict_imv L' R' (ordsucc delta) z1.
        apply andI.
        - prove PNo_rel_strict_imv L' R' (ordsucc delta) z0.
          apply PNoEq_rel_strict_imv L' R' (ordsucc delta) Lsd (fun gamma => gamma :e z) z0.
          + prove PNoEq_ (ordsucc delta) (fun gamma => gamma :e z) z0.
            let eps. assume He: eps :e ordsucc delta.
            apply ordsuccE delta eps He.
            * assume He1: eps :e delta.
              exact PNo_extend0_eq delta (fun gamma => gamma :e z) eps He1.
            * { assume He1: eps = delta.
                prove eps :e z <-> z0 eps.
                rewrite He1.
                prove delta :e z <-> z0 delta.
                apply iffI.
                - assume H16: delta :e z. prove False. exact H14 H16.
                - assume H16: z0 delta. prove False. exact Lnz0d H16.
              }
          + prove PNo_rel_strict_imv L' R' (ordsucc delta) (fun gamma => gamma :e z).
            apply PNo_strict_imv_imp_rel_strict_imv L' R' (SNoLev z) LLz (ordsucc delta).
            * prove ordsucc delta :e ordsucc (SNoLev z).
              apply ordinal_ordsucc_In (SNoLev z) LLz.
              prove delta :e SNoLev z.
              apply LLzlet.
              prove delta :e tau. exact Hd.
            * prove PNo_strict_imv L' R' (SNoLev z) (fun gamma => gamma :e z).
              exact Lzimv.
        - prove PNo_rel_strict_imv L' R' (ordsucc delta) z1.
          apply PNoEq_rel_strict_imv L' R' (ordsucc delta) Lsd w z1.
          + prove PNoEq_ (ordsucc delta) w z1.
            let eps. assume He: eps :e ordsucc delta.
            apply ordsuccE delta eps He.
            * { assume He1: eps :e delta.
                apply iff_trans (w eps) (eps :e z) (z1 eps).
                - apply iff_sym. exact H13 eps He1.
                - exact PNo_extend1_eq delta (fun gamma => gamma :e z) eps He1.
              }
            * { assume He1: eps = delta.
                prove w eps <-> z1 eps.
                rewrite He1.
                prove w delta <-> z1 delta.
                apply iffI.
                - assume _. exact Lz1d.
                - assume _. exact H15.
              }
          + prove PNo_rel_strict_imv L' R' (ordsucc delta) w.
            apply PNo_strict_imv_imp_rel_strict_imv L' R' tau H1 (ordsucc delta).
            * prove ordsucc delta :e ordsucc tau.
              apply ordinal_ordsucc_In tau H1. exact Hd.
            * prove PNo_strict_imv L' R' tau w. exact H2.
      }
Qed.

Theorem SNoCutP_SNoCut_impred : forall L R, SNoCutP L R
 -> forall p:prop,
      (SNo (SNoCut L R)
    -> SNoLev (SNoCut L R) :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y)))
    -> (forall x :e L, x < SNoCut L R)
    -> (forall y :e R, SNoCut L R < y)
    -> (forall z, SNo z -> (forall x :e L, x < z) -> (forall y :e R, z < y) -> SNoLev (SNoCut L R) c= SNoLev z /\ SNoEq_ (SNoLev (SNoCut L R)) (SNoCut L R) z)
    -> p)
   -> p.
let L R. assume HLR. let p. assume Hp.
apply SNoCutP_SNoCut L R HLR.
assume H. apply H. assume H. apply H. assume H. apply H.
exact Hp.
Qed.

Theorem SNoCutP_L_0: forall L, (forall x :e L, SNo x) -> SNoCutP L 0.
let L. assume H1.
prove (forall x :e L, SNo x)
   /\ (forall y :e 0, SNo y)
   /\ (forall x :e L, forall y :e 0, x < y).
apply and3I.
- exact H1.
- let y. assume Hy. prove False. exact EmptyE y Hy.
- let x. assume Hx. let y. assume Hy. prove False. exact EmptyE y Hy.
Qed.

Theorem SNoCutP_0_R: forall R, (forall x :e R, SNo x) -> SNoCutP 0 R.
let R. assume H1.
prove (forall x :e 0, SNo x)
   /\ (forall y :e R, SNo y)
   /\ (forall x :e 0, forall y :e R, x < y).
apply and3I.
- let x. assume Hx. prove False. exact EmptyE x Hx.
- exact H1.
- let x. assume Hx. prove False. exact EmptyE x Hx.
Qed.

Theorem SNoCutP_0_0: SNoCutP 0 0.
apply SNoCutP_L_0. let x. assume Hx. prove False. exact EmptyE x Hx.
Qed.

Definition SNoS_ : set -> set := fun alpha => {x :e Power (SNoElts_ alpha)|exists beta :e alpha, SNo_ beta x}.

Theorem SNoS_E : forall alpha, ordinal alpha -> forall x :e SNoS_ alpha, exists beta :e alpha, SNo_ beta x.
let alpha. assume Ha: ordinal alpha.
let x.
assume H1: x :e SNoS_ alpha.
prove exists beta :e alpha, SNo_ beta x.
exact SepE2 (Power (SNoElts_ alpha)) (fun x => exists beta :e alpha, SNo_ beta x) x H1.
Qed.

Section TaggedSets2.

Let tag : set -> set := fun alpha => SetAdjoin alpha {1}.
Postfix ' 100 := tag.

Theorem SNoS_I : forall alpha, ordinal alpha -> forall x, forall beta :e alpha, SNo_ beta x -> x :e SNoS_ alpha.
let alpha. assume Ha: ordinal alpha.
let x.
let beta.
assume Hb: beta :e alpha.
assume H1: SNo_ beta x.
apply H1.
assume H2: x c= SNoElts_ beta.
assume H3: forall gamma :e beta, exactly1of2 (gamma ' :e x) (gamma :e x).
prove x :e SNoS_ alpha.
prove x :e {x :e Power (SNoElts_ alpha)|exists gamma :e alpha, SNo_ gamma x}.
apply SepI.
- prove x :e Power (SNoElts_ alpha).
  apply PowerI.
  prove x c= SNoElts_ alpha.
  apply Subq_tra x (SNoElts_ beta) (SNoElts_ alpha) H2.
  prove SNoElts_ beta c= SNoElts_ alpha.
  apply SNoElts_mon.
  apply Ha. assume Ha1 _. exact Ha1 beta Hb.
- prove exists gamma :e alpha, SNo_ gamma x.
  witness beta. apply andI.
  + exact Hb.
  + exact H1.
Qed.

Theorem SNoS_I2 : forall x y, SNo x -> SNo y -> SNoLev x :e SNoLev y -> x :e SNoS_ (SNoLev y).
let x y.
assume Hx Hy Hxy.
exact SNoS_I (SNoLev y) (SNoLev_ordinal y Hy) x (SNoLev x) Hxy (SNoLev_ x Hx).
Qed.  

Theorem SNoS_Subq : forall alpha beta, ordinal alpha -> ordinal beta -> alpha c= beta -> SNoS_ alpha c= SNoS_ beta.
let alpha beta. assume Ha Hb Hab.
let x. assume Hx: x :e SNoS_ alpha.
apply SNoS_E alpha Ha x Hx.
let gamma. assume Hc. apply Hc.
assume Hc1: gamma :e alpha.
assume Hc2: SNo_ gamma x.
exact SNoS_I beta Hb x gamma (Hab gamma Hc1) Hc2.
Qed.

Theorem SNoLev_uniq2 : forall alpha, ordinal alpha -> forall x, SNo_ alpha x -> SNoLev x = alpha.
let alpha. assume Ha.
let x. assume Hx.
apply SNoLev_prop x (SNo_SNo alpha Ha x Hx).
assume Hx1: ordinal (SNoLev x).
assume Hx2: SNo_ (SNoLev x) x.
apply SNoLev_uniq x.
- exact Hx1.
- exact Ha.
- exact Hx2.
- exact Hx.
Qed.

Theorem SNoS_E2 : forall alpha, ordinal alpha -> forall x :e SNoS_ alpha,
 forall p:prop,
     (SNoLev x :e alpha -> ordinal (SNoLev x) -> SNo x -> SNo_ (SNoLev x) x -> p)
  -> p.
let alpha. assume Ha. let x. assume Hx.
let p. assume Hp.
apply SNoS_E alpha Ha x Hx.
let beta. assume H1. apply H1.
assume Hb: beta :e alpha.
assume H1: SNo_ beta x.
claim Lb: ordinal beta.
{ exact ordinal_Hered alpha Ha beta Hb. }
claim Lx: SNo x.
{ exact SNo_SNo beta Lb x H1. }
apply SNoLev_prop x Lx.
assume Hx1: ordinal (SNoLev x).
assume Hx2: SNo_ (SNoLev x) x.
claim Lxb: SNoLev x = beta.
{ exact SNoLev_uniq2 beta Lb x H1. }
claim Lxa: SNoLev x :e alpha.
{ rewrite Lxb. exact Hb. }
exact Hp Lxa Hx1 Lx Hx2.
Qed.

Theorem SNoS_In_neq : forall w, SNo w -> forall x :e SNoS_ (SNoLev w), x <> w.
let w. assume Hw: SNo w. let x. assume Hx: x :e SNoS_ (SNoLev w).
assume Hxw: x = w.
apply SNoLev_prop w Hw.
assume Hw1: ordinal (SNoLev w).
assume Hw2: SNo_ (SNoLev w) w.
apply SNoS_E2 (SNoLev w) Hw1 x Hx.
assume Hx1: SNoLev x :e SNoLev w.
assume Hx2: ordinal (SNoLev x).
assume Hx3: SNo x.
assume Hx4: SNo_ (SNoLev x) x.
prove False.
apply In_irref (SNoLev x).
rewrite Hxw at 2. exact Hx1.
Qed.

Theorem SNoS_SNoLev : forall z, SNo z -> z :e SNoS_ (ordsucc (SNoLev z)).
let z. assume Hz: SNo z.
apply SNoLev_prop z Hz.
assume Hz1: ordinal (SNoLev z).
assume Hz2: SNo_ (SNoLev z) z.
exact SNoS_I (ordsucc (SNoLev z)) (ordinal_ordsucc (SNoLev z) Hz1) z (SNoLev z) (ordsuccI2 (SNoLev z)) Hz2.
Qed.

Definition SNoL : set -> set := fun z => {x :e SNoS_ (SNoLev z) | x < z}.
Definition SNoR : set -> set := fun z => {y :e SNoS_ (SNoLev z) | z < y}.

Theorem SNoCutP_SNoL_SNoR: forall z, SNo z -> SNoCutP (SNoL z) (SNoR z).
let z. assume Hz: SNo z.
set L := SNoL z.
set R := SNoR z.
claim LLz: ordinal (SNoLev z).
{ exact SNoLev_ordinal z Hz. }
claim L1: forall x :e L, SNo x.
{ let x. assume Hx: x :e L.
  prove exists alpha, ordinal alpha /\ SNo_ alpha x.
  claim L1a: x :e SNoS_ (SNoLev z).
  { exact SepE1 (SNoS_ (SNoLev z)) (fun x => x < z) x Hx. }
  apply SNoS_E (SNoLev z) LLz x L1a.
  let beta. assume H1. apply H1.
  assume Hb: beta :e SNoLev z.
  assume H1: SNo_ beta x.
  witness beta. apply andI.
  - exact ordinal_Hered (SNoLev z) LLz beta Hb.
  - exact H1.
}
claim L2: forall y :e R, SNo y.
{ let y. assume Hy: y :e R.
  prove exists alpha, ordinal alpha /\ SNo_ alpha y.
  claim L2a: y :e SNoS_ (SNoLev z).
  { exact SepE1 (SNoS_ (SNoLev z)) (fun y => z < y) y Hy. }
  apply SNoS_E (SNoLev z) LLz y L2a.
  let beta. assume H1. apply H1.
  assume Hb: beta :e SNoLev z.
  assume H1: SNo_ beta y.
  witness beta. apply andI.
  - exact ordinal_Hered (SNoLev z) LLz beta Hb.
  - exact H1.
}
claim L3: forall x :e L, forall y :e R, x < y.
{ let x. assume Hx. let y. assume Hy.
  apply SNoLt_tra x z y (L1 x Hx) Hz (L2 y Hy).
  - prove x < z. exact SepE2 (SNoS_ (SNoLev z)) (fun x => x < z) x Hx.
  - prove z < y. exact SepE2 (SNoS_ (SNoLev z)) (fun y => z < y) y Hy.
}
prove SNoCutP L R.
prove (forall x :e L, SNo x)
   /\ (forall y :e R, SNo y)
   /\ (forall x :e L, forall y :e R, x < y).
apply and3I.
- exact L1.
- exact L2.
- exact L3.
Qed.

Theorem SNoL_E : forall x, SNo x -> forall w :e SNoL x,
  forall p:prop,
       (SNo w -> SNoLev w :e SNoLev x -> w < x -> p)
    -> p.
let x. assume Hx: SNo x.
let w. assume Hw: w :e SNoL x.
let p. assume Hp.
apply SepE (SNoS_ (SNoLev x)) (fun w => w < x) w Hw.
assume Hw1: w :e SNoS_ (SNoLev x).
assume Hw2: w < x.
apply SNoS_E2 (SNoLev x) (SNoLev_ordinal x Hx) w Hw1.
assume Hw3: SNoLev w :e SNoLev x.
assume Hw4: ordinal (SNoLev w).
assume Hw5: SNo w.
assume Hw6: SNo_ (SNoLev w) w.
exact Hp Hw5 Hw3 Hw2.
Qed.

Theorem SNoR_E : forall x, SNo x -> forall z :e SNoR x,
  forall p:prop,
       (SNo z -> SNoLev z :e SNoLev x -> x < z -> p)
    -> p.
let x. assume Hx: SNo x.
let z. assume Hz: z :e SNoR x.
let p. assume Hp.
apply SepE (SNoS_ (SNoLev x)) (fun z => x < z) z Hz.
assume Hz1: z :e SNoS_ (SNoLev x).
assume Hz2: x < z.
apply SNoS_E2 (SNoLev x) (SNoLev_ordinal x Hx) z Hz1.
assume Hz3: SNoLev z :e SNoLev x.
assume Hz4: ordinal (SNoLev z).
assume Hz5: SNo z.
assume Hz6: SNo_ (SNoLev z) z.
exact Hp Hz5 Hz3 Hz2.
Qed.

Theorem SNoL_SNoS_ : forall z, SNoL z c= SNoS_ (SNoLev z).
let z. exact Sep_Subq (SNoS_ (SNoLev z)) (fun x => x < z).
Qed.

Theorem SNoR_SNoS_ : forall z, SNoR z c= SNoS_ (SNoLev z).
let z. exact Sep_Subq (SNoS_ (SNoLev z)) (fun y => z < y).
Qed.

Theorem SNoL_SNoS : forall x, SNo x -> forall w :e SNoL x, w :e SNoS_ (SNoLev x).
let x. assume Hx. let w. assume Hw: w :e SNoL x.
apply SNoL_E x Hx w Hw.
assume Hw1: SNo w.
assume Hw2: SNoLev w :e SNoLev x.
assume Hw3: w < x.
prove w :e SNoS_ (SNoLev x).
exact SNoS_I2 w x Hw1 Hx Hw2.
Qed.

Theorem SNoR_SNoS : forall x, SNo x -> forall z :e SNoR x, z :e SNoS_ (SNoLev x).
let x. assume Hx. let z. assume Hz: z :e SNoR x.
apply SNoR_E x Hx z Hz.
assume Hz1: SNo z.
assume Hz2: SNoLev z :e SNoLev x.
assume Hz3: x < z.
prove z :e SNoS_ (SNoLev x).
exact SNoS_I2 z x Hz1 Hx Hz2.
Qed.

Theorem SNoL_I : forall z, SNo z -> forall x, SNo x -> SNoLev x :e SNoLev z -> x < z -> x :e SNoL z.
let z. assume Hz. let x. assume Hx Hxz1 Hxz2.
prove x :e SNoL z.
prove x :e {x :e SNoS_ (SNoLev z) | x < z}.
apply SepI.
- prove x :e SNoS_ (SNoLev z).
  exact SNoS_I2 x z Hx Hz Hxz1.
- prove x < z. exact Hxz2.
Qed.

Theorem SNoR_I : forall z, SNo z -> forall y, SNo y -> SNoLev y :e SNoLev z -> z < y -> y :e SNoR z.
let z. assume Hz. let y. assume Hy Hyz Hzy.
prove y :e SNoR z.
prove y :e {y :e SNoS_ (SNoLev z) | z < y}.
apply SepI.
- prove y :e SNoS_ (SNoLev z).
  exact SNoS_I2 y z Hy Hz Hyz.
- prove z < y. exact Hzy.
Qed.

Theorem SNo_eta : forall z, SNo z -> z = SNoCut (SNoL z) (SNoR z).
let z. assume Hz: SNo z.
set L := SNoL z.
set R := SNoR z.
claim LLz: ordinal (SNoLev z).
{ exact SNoLev_ordinal z Hz. }
claim LC: SNoCutP L R.
{ exact SNoCutP_SNoL_SNoR z Hz. }
apply SNoCutP_SNoCut L R LC.
assume H1. apply H1. assume H1. apply H1. assume H1. apply H1.
assume H1: SNo (SNoCut L R).
assume H2: SNoLev (SNoCut L R) :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume H3: forall x :e L, x < SNoCut L R.
assume H4: forall y :e R, SNoCut L R < y.
assume H5: forall z, SNo z -> (forall x :e L, x < z) -> (forall y :e R, z < y) -> SNoLev (SNoCut L R) c= SNoLev z /\ PNoEq_ (SNoLev (SNoCut L R)) (fun gamma => gamma :e SNoCut L R) (fun gamma => gamma :e z).
claim L4: ordinal (SNoLev (SNoCut L R)).
{ apply SNoLev_ordinal. exact H1. }
claim L5: forall x :e L, x < z.
{ let x. assume Hx: x :e L.
  exact SepE2 (SNoS_ (SNoLev z)) (fun x => x < z) x Hx.
}
claim L6: forall y :e R, z < y.
{ let y. assume Hy: y :e R.
  exact SepE2 (SNoS_ (SNoLev z)) (fun y => z < y) y Hy.
}
apply H5 z Hz L5 L6.
assume H6: SNoLev (SNoCut L R) c= SNoLev z.
assume H7: PNoEq_ (SNoLev (SNoCut L R)) (fun gamma => gamma :e SNoCut L R) (fun gamma => gamma :e z).
claim L7: SNoLev (SNoCut L R) = SNoLev z.
{ apply ordinal_trichotomy_or (SNoLev (SNoCut L R)) (SNoLev z) L4 LLz. assume H8. apply H8.
  - assume H8: SNoLev (SNoCut L R) :e SNoLev z.
    prove False.
    apply SNoLt_trichotomy_or z (SNoCut L R) Hz H1. assume H9. apply H9.
    + assume H9: z < SNoCut L R.
      apply SNoLt_irref (SNoCut L R).
      apply H4.
      prove SNoCut L R :e R.
      prove SNoCut L R :e {y :e SNoS_ (SNoLev z) | z < y}.
      apply SepI.
      * apply SNoS_I (SNoLev z) LLz (SNoCut L R) (SNoLev (SNoCut L R)) H8.
        prove SNo_ (SNoLev (SNoCut L R)) (SNoCut L R).
        exact SNoLev_ (SNoCut L R) H1.
      * prove z < SNoCut L R. exact H9.
    + assume H9: z = SNoCut L R.
      apply In_irref (SNoLev z). rewrite H9 at 1. exact H8.
    + assume H9: SNoCut L R < z.
      apply SNoLt_irref (SNoCut L R).
      apply H3.
      prove SNoCut L R :e L.
      prove SNoCut L R :e {x :e SNoS_ (SNoLev z) | x < z}.
      apply SepI.
      * apply SNoS_I (SNoLev z) LLz (SNoCut L R) (SNoLev (SNoCut L R)) H8.
        prove SNo_ (SNoLev (SNoCut L R)) (SNoCut L R).
        exact SNoLev_ (SNoCut L R) H1.
      * prove SNoCut L R < z. exact H9.
  - assume H8: SNoLev (SNoCut L R) = SNoLev z.
    exact H8.
  - assume H8: SNoLev z :e SNoLev (SNoCut L R).
    prove False.
    apply In_irref (SNoLev z).
    apply H6.
    exact H8.
}
prove z = SNoCut L R.
symmetry.
prove SNoCut L R = z.
apply SNo_eq.
- prove SNo (SNoCut L R). exact H1.
- prove SNo z. exact Hz.
- prove SNoLev (SNoCut L R) = SNoLev z. exact L7.
- prove forall alpha :e SNoLev (SNoCut L R), alpha :e SNoCut L R <-> alpha :e z.
  exact H7.
Qed.

Theorem SNoCutP_SNo_SNoCut : forall L R, SNoCutP L R -> SNo (SNoCut L R).
let L R.
assume H1: SNoCutP L R.
apply SNoCutP_SNoCut L R H1.
assume H2 _. apply H2. assume H2 _. apply H2.
assume H2 _. apply H2.
assume H2 _. exact H2.
Qed.

Theorem SNoCutP_SNoCut_L : forall L R, SNoCutP L R -> forall x :e L, x < SNoCut L R.
let L R.
assume H1: SNoCutP L R.
apply SNoCutP_SNoCut L R H1.
assume H2 _. apply H2. assume H2 _. apply H2.
assume _ H2. exact H2.
Qed.

Theorem SNoCutP_SNoCut_R : forall L R, SNoCutP L R -> forall y :e R, SNoCut L R < y.
let L R.
assume H1: SNoCutP L R.
apply SNoCutP_SNoCut L R H1.
assume H2 _. apply H2. assume _ H2. exact H2.
Qed.

Theorem SNoCutP_SNoCut_fst : forall L R, SNoCutP L R ->
 forall z, SNo z
   -> (forall x :e L, x < z)
   -> (forall y :e R, z < y)
   -> SNoLev (SNoCut L R) c= SNoLev z
   /\ SNoEq_ (SNoLev (SNoCut L R)) (SNoCut L R) z.
let L R.
assume H1: SNoCutP L R.
apply SNoCutP_SNoCut L R H1.
assume _ H2. exact H2.
Qed.

Theorem SNoCut_Le : forall L1 R1 L2 R2, SNoCutP L1 R1 -> SNoCutP L2 R2
  -> (forall w :e L1, w < SNoCut L2 R2)
  -> (forall z :e R2, SNoCut L1 R1 < z)
  -> SNoCut L1 R1 <= SNoCut L2 R2.
let L1 R1 L2 R2.
assume HLR1 HLR2.
assume H1: forall w :e L1, w < SNoCut L2 R2.
assume H2: forall z :e R2, SNoCut L1 R1 < z.
apply HLR1. assume HLR1a. apply HLR1a.
assume HLR1a: forall x :e L1, SNo x.
assume HLR1b: forall y :e R1, SNo y.
assume HLR1c: forall x :e L1, forall y :e R1, x < y.
apply HLR2. assume HLR2a. apply HLR2a.
assume HLR2a: forall x :e L2, SNo x.
assume HLR2b: forall y :e R2, SNo y.
assume HLR2c: forall x :e L2, forall y :e R2, x < y.
set alpha := \/_ x :e L1, ordsucc (SNoLev x).
set beta := \/_ y :e R1, ordsucc (SNoLev y).
set gamma := \/_ x :e L2, ordsucc (SNoLev x).
set delta := \/_ y :e R2, ordsucc (SNoLev y).
apply SNoCutP_SNoCut L1 R1 HLR1.
assume H3. apply H3. assume H3. apply H3. assume H3. apply H3.
assume H3: SNo (SNoCut L1 R1).
assume H4: SNoLev (SNoCut L1 R1) :e ordsucc (alpha :\/: beta).
assume H5: forall x :e L1, x < SNoCut L1 R1.
assume H6: forall y :e R1, SNoCut L1 R1 < y.
assume H7: forall z, SNo z -> (forall x :e L1, x < z) -> (forall y :e R1, z < y) -> SNoLev (SNoCut L1 R1) c= SNoLev z /\ SNoEq_ (SNoLev (SNoCut L1 R1)) (SNoCut L1 R1) z.
apply SNoCutP_SNoCut L2 R2 HLR2.
assume H8. apply H8. assume H8. apply H8. assume H8. apply H8.
assume H8: SNo (SNoCut L2 R2).
assume H9: SNoLev (SNoCut L2 R2) :e ordsucc (gamma :\/: delta).
assume H10: forall x :e L2, x < SNoCut L2 R2.
assume H11: forall y :e R2, SNoCut L2 R2 < y.
assume H12: forall z, SNo z -> (forall x :e L2, x < z) -> (forall y :e R2, z < y) -> SNoLev (SNoCut L2 R2) c= SNoLev z /\ SNoEq_ (SNoLev (SNoCut L2 R2)) (SNoCut L2 R2) z.
apply SNoLtLe_or (SNoCut L2 R2) (SNoCut L1 R1) H8 H3.
- assume H13: SNoCut L2 R2 < SNoCut L1 R1.
  prove False.
  apply SNoLtE (SNoCut L2 R2) (SNoCut L1 R1) H8 H3 H13.
  + let z.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev (SNoCut L2 R2) :/\: SNoLev (SNoCut L1 R1).
    assume Hz3: SNoEq_ (SNoLev z) z (SNoCut L2 R2).
    assume Hz4: SNoEq_ (SNoLev z) z (SNoCut L1 R1).
    assume Hz5: (SNoCut L2 R2) < z.
    assume Hz6: z < (SNoCut L1 R1).
    assume Hz7: SNoLev z /:e (SNoCut L2 R2).
    assume Hz8: SNoLev z :e (SNoCut L1 R1).
    claim LzL1: forall x :e L1, x < z.
    { let x. assume Hx: x :e L1.
      apply SNoLt_tra x (SNoCut L2 R2) z (HLR1a x Hx) H8 Hz1.
      - prove x < SNoCut L2 R2. exact H1 x Hx.
      - prove SNoCut L2 R2 < z. exact Hz5.
    }
    claim LzR1: forall y :e R1, z < y.
    { let y. assume Hy: y :e R1.
      apply SNoLt_tra z (SNoCut L1 R1) y Hz1 H3 (HLR1b y Hy).
      - prove z < SNoCut L1 R1. exact Hz6.
      - prove SNoCut L1 R1 < y. exact H6 y Hy.
    }
    apply H7 z Hz1 LzL1 LzR1.
    assume H14: SNoLev (SNoCut L1 R1) c= SNoLev z.
    assume _.
    apply In_irref (SNoLev z).
    apply H14.
    prove SNoLev z :e SNoLev (SNoCut L1 R1).
    exact binintersectE2 (SNoLev (SNoCut L2 R2)) (SNoLev (SNoCut L1 R1)) (SNoLev z) Hz2.
  + assume H14: SNoLev (SNoCut L2 R2) :e SNoLev (SNoCut L1 R1).
    assume H15: SNoEq_ (SNoLev (SNoCut L2 R2)) (SNoCut L2 R2) (SNoCut L1 R1).
    assume H16: SNoLev (SNoCut L2 R2) :e (SNoCut L1 R1).
    set z := SNoCut L2 R2.
    claim LzR1: forall y :e R1, z < y.
    { let y. assume Hy: y :e R1.
      apply SNoLt_tra z (SNoCut L1 R1) y H8 H3 (HLR1b y Hy).
      - prove z < SNoCut L1 R1. exact H13.
      - prove SNoCut L1 R1 < y. exact H6 y Hy.
    }
    apply H7 z H8 H1 LzR1.
    assume H17: SNoLev (SNoCut L1 R1) c= SNoLev z.
    assume _.
    apply In_irref (SNoLev z).
    apply H17.
    prove SNoLev z :e SNoLev (SNoCut L1 R1).
    exact H14.
  + assume H14: SNoLev (SNoCut L1 R1) :e SNoLev (SNoCut L2 R2).
    assume H15: SNoEq_ (SNoLev (SNoCut L1 R1)) (SNoCut L2 R2) (SNoCut L1 R1).
    assume H16: SNoLev (SNoCut L1 R1) /:e (SNoCut L2 R2).
    set z := SNoCut L1 R1.
    claim LzL2: forall x :e L2, x < z.
    { let x. assume Hx: x :e L2.
      apply SNoLt_tra x (SNoCut L2 R2) z (HLR2a x Hx) H8 H3.
      - prove x < SNoCut L2 R2. exact H10 x Hx.
      - prove SNoCut L2 R2 < z. exact H13.
    }
    apply H12 z H3 LzL2 H2.
    assume H17: SNoLev (SNoCut L2 R2) c= SNoLev z.
    assume _.
    apply In_irref (SNoLev z).
    apply H17.
    prove SNoLev z :e SNoLev (SNoCut L2 R2).
    exact H14.
- assume H13: SNoCut L1 R1 <= SNoCut L2 R2. exact H13.
Qed.

Theorem SNoCut_ext : forall L1 R1 L2 R2, SNoCutP L1 R1 -> SNoCutP L2 R2
  -> (forall w :e L1, w < SNoCut L2 R2)
  -> (forall z :e R1, SNoCut L2 R2 < z)
  -> (forall w :e L2, w < SNoCut L1 R1)
  -> (forall z :e R2, SNoCut L1 R1 < z)
  -> SNoCut L1 R1 = SNoCut L2 R2.
let L1 R1 L2 R2.
assume HLR1 HLR2.
assume H1: forall w :e L1, w < SNoCut L2 R2.
assume H2: forall z :e R1, SNoCut L2 R2 < z.
assume H3: forall w :e L2, w < SNoCut L1 R1.
assume H4: forall z :e R2, SNoCut L1 R1 < z.
claim LNLR1: SNo (SNoCut L1 R1).
{ exact SNoCutP_SNo_SNoCut L1 R1 HLR1. }
claim LNLR2: SNo (SNoCut L2 R2).
{ exact SNoCutP_SNo_SNoCut L2 R2 HLR2. }
apply SNoLe_antisym (SNoCut L1 R1) (SNoCut L2 R2) LNLR1 LNLR2.
- prove SNoCut L1 R1 <= SNoCut L2 R2.
  exact SNoCut_Le L1 R1 L2 R2 HLR1 HLR2 H1 H4.
- prove SNoCut L2 R2 <= SNoCut L1 R1.
  exact SNoCut_Le L2 R2 L1 R1 HLR2 HLR1 H3 H2.
Qed.

Theorem SNoLt_SNoL_or_SNoR_impred: forall x y, SNo x -> SNo y -> x < y ->
 forall p:prop,
    (forall z :e SNoL y, z :e SNoR x -> p)
 -> (x :e SNoL y -> p)
 -> (y :e SNoR x -> p)
 -> p.
let x y. assume Hx Hy Hxy. let p. assume Hp1 Hp2 Hp3.
apply SNoLtE x y Hx Hy Hxy.
- let z. assume Hz1 Hz2 _ _ Hz3 Hz4 _ _.
  apply binintersectE (SNoLev x) (SNoLev y) (SNoLev z) Hz2.
  assume Hz2a Hz2b.
  apply Hp1 z.
  + prove z :e SNoL y. exact SNoL_I y Hy z Hz1 Hz2b Hz4.
  + prove z :e SNoR x. exact SNoR_I x Hx z Hz1 Hz2a Hz3.
- assume H1 _ _.
  apply Hp2.
  exact SNoL_I y Hy x Hx H1 Hxy.
- assume H1 _ _.
  apply Hp3.
  exact SNoR_I x Hx y Hy H1 Hxy.
Qed.

Theorem SNoL_or_SNoR_impred: forall x y, SNo x -> SNo y ->
 forall p:prop,
    (x = y -> p)
 -> (forall z :e SNoL y, z :e SNoR x -> p)
 -> (x :e SNoL y -> p)
 -> (y :e SNoR x -> p)
 -> (forall z :e SNoR y, z :e SNoL x -> p)
 -> (x :e SNoR y -> p)
 -> (y :e SNoL x -> p)
 -> p.
let x y. assume Hx Hy.
let p. assume Hp1 Hp2 Hp3 Hp4 Hp5 Hp6 Hp7.
apply SNoLt_trichotomy_or_impred x y Hx Hy.
- assume H1: x < y.
  apply SNoLt_SNoL_or_SNoR_impred x y Hx Hy H1.
  + exact Hp2.
  + exact Hp3.
  + exact Hp4.
- assume H1: x = y. exact Hp1 H1.
- assume H1: y < x.
  apply SNoLt_SNoL_or_SNoR_impred y x Hy Hx H1.
  + let z. assume H2 H3. exact Hp5 z H3 H2.
  + exact Hp7.
  + exact Hp6.
Qed.

Theorem SNoL_SNoCutP_ex: forall L R, SNoCutP L R -> forall w :e SNoL (SNoCut L R), exists w' :e L, w <= w'.
let L R. assume HLR.
set y := SNoCut L R.
let w.
assume Hw: w :e SNoL y.
apply dneg.
assume HC: ~exists w' :e L, w <= w'.
apply HLR.
assume H. apply H.
assume HL HR HLR'.
apply SNoCutP_SNoCut_impred L R HLR.
assume H1: SNo y.
assume H2: SNoLev y :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume H3: forall w :e L, w < y.
assume H4: forall z :e R, y < z.
assume H5: forall u, SNo u -> (forall w :e L, w < u) -> (forall z :e R, u < z) -> SNoLev y c= SNoLev u /\ SNoEq_ (SNoLev y) y u.
apply SNoL_E y H1 w Hw.
assume Hw1 Hw2 Hw3.
claim L1: SNoLev y c= SNoLev w /\ SNoEq_ (SNoLev y) y w.
{ apply H5 w Hw1.
  - let w'. assume Hw': w' :e L.
    prove w' < w.
    apply SNoLtLe_or w' w (HL w' Hw') Hw1.
    + assume H6. exact H6.
    + assume H6: w <= w'. apply HC. witness w'. apply andI.
      * exact Hw'.
      * exact H6.
  - let z. assume Hz: z :e R.
    prove w < z.
    apply SNoLt_tra w y z Hw1 H1 (HR z Hz) Hw3.
    prove y < z.
    exact H4 z Hz.
}
apply In_irref (SNoLev w).
prove SNoLev w :e SNoLev w.
apply andEL (SNoLev y c= SNoLev w) (SNoEq_ (SNoLev y) y w) L1.
prove SNoLev w :e SNoLev y.
exact Hw2.
Qed.

Theorem SNoR_SNoCutP_ex: forall L R, SNoCutP L R -> forall z :e SNoR (SNoCut L R), exists z' :e R, z' <= z.
let L R. assume HLR.
set y := SNoCut L R.
let z.
assume Hz: z :e SNoR y.
apply dneg.
assume HC: ~exists z' :e R, z' <= z.
apply HLR.
assume H. apply H.
assume HL HR HLR'.
apply SNoCutP_SNoCut_impred L R HLR.
assume H1: SNo y.
assume H2: SNoLev y :e ordsucc ((\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y))).
assume H3: forall w :e L, w < y.
assume H4: forall z :e R, y < z.
assume H5: forall u, SNo u -> (forall w :e L, w < u) -> (forall z :e R, u < z) -> SNoLev y c= SNoLev u /\ SNoEq_ (SNoLev y) y u.
apply SNoR_E y H1 z Hz.
assume Hz1 Hz2 Hz3.
claim L1: SNoLev y c= SNoLev z /\ SNoEq_ (SNoLev y) y z.
{ apply H5 z Hz1.
  - let w. assume Hw: w :e L.
    prove w < z.
    apply SNoLt_tra w y z (HL w Hw) H1 Hz1.
    + prove w < y. exact H3 w Hw.
    + prove y < z. exact Hz3.
  - let z'. assume Hz': z' :e R.
    prove z < z'.
    apply SNoLtLe_or z z' Hz1 (HR z' Hz').
    + assume H6. exact H6.
    + assume H6: z' <= z. apply HC. witness z'. apply andI.
      * exact Hz'.
      * exact H6.
}
apply In_irref (SNoLev z).
prove SNoLev z :e SNoLev z.
apply andEL (SNoLev y c= SNoLev z) (SNoEq_ (SNoLev y) y z) L1.
prove SNoLev z :e SNoLev y.
exact Hz2.
Qed.

Theorem ordinal_SNo_ : forall alpha, ordinal alpha -> SNo_ alpha alpha.
let alpha.
assume Ha: ordinal alpha.
prove alpha c= SNoElts_ alpha
   /\ forall beta :e alpha, exactly1of2 (beta ' :e alpha) (beta :e alpha).
apply andI.
- prove alpha c= SNoElts_ alpha.
  let beta. assume Hb: beta :e alpha.
  prove beta :e alpha :\/: {beta '|beta :e alpha}.
  apply binunionI1.
  exact Hb.
- prove forall beta :e alpha, exactly1of2 (beta ' :e alpha) (beta :e alpha).
  let beta. assume Hb: beta :e alpha.
  apply exactly1of2_I2.
  + prove beta ' /:e alpha.
    assume H1: beta ' :e alpha.
    prove False.
    apply tagged_not_ordinal beta.
    prove ordinal (beta ').
    exact ordinal_Hered alpha Ha (beta ') H1.
  + prove beta :e alpha. exact Hb.
Qed.

Theorem ordinal_SNo : forall alpha, ordinal alpha -> SNo alpha.
let alpha.
assume Ha: ordinal alpha.
prove exists beta, ordinal beta /\ SNo_ beta alpha.
witness alpha. apply andI.
- exact Ha.
- exact ordinal_SNo_ alpha Ha.
Qed.

Theorem ordinal_SNoLev : forall alpha, ordinal alpha -> SNoLev alpha = alpha.
let alpha.
assume Ha: ordinal alpha.
apply SNoLev_prop alpha (ordinal_SNo alpha Ha).
assume H1: ordinal (SNoLev alpha).
assume H2: SNo_ (SNoLev alpha) alpha.
exact SNoLev_uniq alpha (SNoLev alpha) alpha H1 Ha H2 (ordinal_SNo_ alpha Ha).
Qed.

Theorem ordinal_SNoLev_max : forall alpha, ordinal alpha -> forall z, SNo z -> SNoLev z :e alpha -> z < alpha.
let alpha.
assume Ha: ordinal alpha.
let z.
assume Hz: SNo z.
assume Hz2: SNoLev z :e alpha.
claim La1: SNo alpha.
{ exact ordinal_SNo alpha Ha. }
claim La2: SNoLev alpha = alpha.
{ exact ordinal_SNoLev alpha Ha. }
prove z < alpha.
apply SNoLt_trichotomy_or z alpha Hz (ordinal_SNo alpha Ha).
assume H1. apply H1.
- assume H1: z < alpha. exact H1.
- assume H1: z = alpha.
  prove False. apply In_irref alpha.
  rewrite <- La2 at 1.
  prove SNoLev alpha :e alpha.
  rewrite <- H1 at 1.
  prove SNoLev z :e alpha.
  exact Hz2.
- assume H1: alpha < z.
  prove False.
  apply SNoLtE alpha z La1 Hz H1.
  + let w.
    rewrite La2.
    assume Hw: SNo w.
    assume H2: SNoLev w :e alpha :/\: SNoLev z.
    assume H3: SNoEq_ (SNoLev w) w alpha.
    assume H4: SNoEq_ (SNoLev w) w z.
    assume H5: alpha < w.
    assume H6: w < z.
    assume H7: SNoLev w /:e alpha.
    prove False.
    apply H7.
    exact binintersectE1 alpha (SNoLev z) (SNoLev w) H2.
  + rewrite La2.
    assume H2: alpha :e SNoLev z.
    prove False.
    exact In_no2cycle alpha (SNoLev z) H2 Hz2.
  + rewrite La2.
    assume H2: SNoLev z :e alpha.
    assume H3: SNoEq_ (SNoLev z) alpha z.
    assume H4: SNoLev z /:e alpha.
    exact H4 H2.
Qed.

Theorem ordinal_SNoL : forall alpha, ordinal alpha -> SNoL alpha = SNoS_ alpha.
let alpha.
assume Ha: ordinal alpha.
claim La1: SNo alpha.
{ exact ordinal_SNo alpha Ha. }
claim La2: SNoLev alpha = alpha.
{ exact ordinal_SNoLev alpha Ha. }
apply set_ext.
- let x. assume Hx: x :e SNoL alpha.
  apply SNoL_E alpha La1 x Hx.
  assume Hx1: SNo x.
  assume Hx2: SNoLev x :e SNoLev alpha.
  assume Hx3: x < alpha.
  prove x :e SNoS_ alpha.
  rewrite <- La2.
  prove x :e SNoS_ (SNoLev alpha).
  apply SNoS_I2 x alpha Hx1 La1.
  prove SNoLev x :e SNoLev alpha.
  exact Hx2.
- let x. assume Hx: x :e SNoS_ alpha.
  apply SNoS_E2 alpha Ha x Hx.
  assume Hx1: SNoLev x :e alpha.
  assume Hx2: ordinal (SNoLev x).
  assume Hx3: SNo x.
  assume Hx4: SNo_ (SNoLev x) x.
  prove x :e SNoL alpha.
  apply SNoL_I alpha La1 x Hx3.
  + prove SNoLev x :e SNoLev alpha. rewrite La2. exact Hx1.
  + prove x < alpha.
    exact ordinal_SNoLev_max alpha Ha x Hx3 Hx1.
Qed.

Theorem ordinal_SNoR : forall alpha, ordinal alpha -> SNoR alpha = Empty.
let alpha.
assume Ha: ordinal alpha.
claim La1: SNo alpha.
{ exact ordinal_SNo alpha Ha. }
claim La2: SNoLev alpha = alpha.
{ exact ordinal_SNoLev alpha Ha. }
apply Empty_Subq_eq.
let x. assume Hx: x :e SNoR alpha.
apply SNoR_E alpha La1 x Hx.
assume Hx1: SNo x.
rewrite La2.
assume Hx2: SNoLev x :e alpha.
assume Hx3: alpha < x.
prove False.
apply SNoLt_irref x.
apply SNoLt_tra x alpha x Hx1 La1 Hx1.
- prove x < alpha.
  exact ordinal_SNoLev_max alpha Ha x Hx1 Hx2.
- prove alpha < x. exact Hx3.
Qed.

Theorem nat_p_SNo: forall n, nat_p n -> SNo n.
let n. assume Hn.
apply ordinal_SNo.
prove ordinal n.
apply nat_p_ordinal.
exact Hn.
Qed.

Theorem omega_SNo: forall n :e omega, SNo n.
let n. assume Hn.
apply nat_p_SNo.
apply omega_nat_p.
exact Hn.
Qed.

Theorem omega_SNoS_omega : omega c= SNoS_ omega.
let n. assume Hn: n :e omega.
apply SNoS_I omega omega_ordinal n n.
- exact Hn.
- prove SNo_ n n. rewrite <- ordinal_SNoLev n (nat_p_ordinal n (omega_nat_p n Hn)) at 1.
  prove SNo_ (SNoLev n) n. apply SNoLev_. apply omega_SNo. exact Hn.
Qed.

Theorem ordinal_In_SNoLt : forall alpha, ordinal alpha -> forall beta :e alpha, beta < alpha.
let alpha.
assume Ha: ordinal alpha.
let beta.
assume Hb: beta :e alpha.
claim Lb: ordinal beta.
{ exact ordinal_Hered alpha Ha beta Hb. }
claim Lb1: SNo beta.
{ exact ordinal_SNo beta Lb. }
claim Lb2: SNoLev beta = beta.
{ exact ordinal_SNoLev beta Lb. }
apply ordinal_SNoLev_max alpha Ha beta Lb1.
prove SNoLev beta :e alpha.
rewrite Lb2. exact Hb.
Qed.

Theorem ordinal_SNoLev_max_2 : forall alpha, ordinal alpha -> forall z, SNo z -> SNoLev z :e ordsucc alpha -> z <= alpha.
let alpha.
assume Ha: ordinal alpha.
apply Ha. assume Ha1 _.
let z.
assume Hz: SNo z.
assume Hz2: SNoLev z :e ordsucc alpha.
claim La1: SNo alpha.
{ exact ordinal_SNo alpha Ha. }
claim La2: SNoLev alpha = alpha.
{ exact ordinal_SNoLev alpha Ha. }
apply ordsuccE alpha (SNoLev z) Hz2.
- assume Hz3: SNoLev z :e alpha.
  prove z <= alpha.
  apply SNoLtLe.
  prove z < alpha.
  exact ordinal_SNoLev_max alpha Ha z Hz Hz3.
- assume Hz3: SNoLev z = alpha.
  apply dneg.
  assume H1: ~(z <= alpha).
  claim L1: forall beta, ordinal beta -> beta :e alpha -> beta :e z.
  { apply ordinal_ind.
    let beta.
    assume Hb: ordinal beta.
    assume IH: forall gamma :e beta, gamma :e alpha -> gamma :e z.
    assume Hb2: beta :e alpha.
    apply dneg.
    assume H2: beta /:e z.
    apply H1.
    apply SNoLtLe.
    prove z < alpha.
    claim Lb1: SNo beta.
    { exact ordinal_SNo beta Hb. }
    claim Lb2: SNoLev beta = beta.
    { exact ordinal_SNoLev beta Hb. }
    apply SNoLt_tra z beta alpha Hz Lb1 La1.
    - prove z < beta. apply SNoLtI3.
      + prove SNoLev beta :e SNoLev z.
        rewrite Lb2. rewrite Hz3.
        prove beta :e alpha.
        exact Hb2.
      + prove SNoEq_ (SNoLev beta) z beta.
        rewrite Lb2.
        let gamma. assume Hc: gamma :e beta.
        prove gamma :e z <-> gamma :e beta.
        apply iffI.
        * assume _. exact Hc.
        * assume _.
          prove gamma :e z.
          apply IH gamma Hc.
          prove gamma :e alpha.
          exact Ha1 beta Hb2 gamma Hc.
      + prove SNoLev beta /:e z.
        rewrite Lb2. prove beta /:e z. exact H2.
    - prove beta < alpha.
      exact ordinal_In_SNoLt alpha Ha beta Hb2.
  }
  claim L2: alpha c= z.
  { let beta. assume Hb: beta :e alpha.
    exact L1 beta (ordinal_Hered alpha Ha beta Hb) Hb.
  }
  claim L3: z = alpha.
  { apply SNo_eq z alpha Hz La1.
    - prove SNoLev z = SNoLev alpha. rewrite La2. exact Hz3.
    - prove SNoEq_ (SNoLev z) z alpha.
      rewrite Hz3.
      let beta. assume Hb: beta :e alpha.
      prove beta :e z <-> beta :e alpha.
      apply iffI.
      + assume _. exact Hb.
      + assume _. exact L2 beta Hb.
  }
  apply H1.
  prove z <= alpha.
  rewrite L3.
  prove alpha <= alpha.
  apply SNoLe_ref.
Qed.

Theorem ordinal_Subq_SNoLe : forall alpha beta, ordinal alpha -> ordinal beta -> alpha c= beta -> alpha <= beta.
let alpha beta. assume Ha Hb Hab.
claim L1: alpha :e ordsucc beta.
{ apply ordinal_In_Or_Subq alpha beta Ha Hb.
  - assume H1: alpha :e beta. apply ordsuccI1. exact H1.
  - assume H1: beta c= alpha.
    claim L1a: alpha = beta.
    { apply set_ext.
      - exact Hab.
      - exact H1.
    }
    rewrite L1a. apply ordsuccI2.
}
claim La1: SNo alpha.
{ exact ordinal_SNo alpha Ha. }
claim La2: SNoLev alpha = alpha.
{ exact ordinal_SNoLev alpha Ha. }
apply ordinal_SNoLev_max_2 beta Hb alpha La1.
prove SNoLev alpha :e ordsucc beta.
rewrite La2. exact L1.
Qed.

Theorem ordinal_SNoLt_In : forall alpha beta, ordinal alpha -> ordinal beta -> alpha < beta -> alpha :e beta.
let alpha beta. assume Ha Hb.
assume H1.
apply ordinal_In_Or_Subq alpha beta Ha Hb.
- assume H2. exact H2.
- assume H2: beta c= alpha.
  prove False. apply SNoLt_irref alpha.
  prove alpha < alpha.
  apply SNoLtLe_tra alpha beta alpha (ordinal_SNo alpha Ha) (ordinal_SNo beta Hb) (ordinal_SNo alpha Ha) H1.
  prove beta <= alpha.
  exact ordinal_Subq_SNoLe beta alpha Hb Ha H2.
Qed.

Theorem omega_nonneg : forall m :e omega, 0 <= m.
let m. assume Hm.
apply ordinal_Subq_SNoLe 0 m ordinal_Empty (nat_p_ordinal m (omega_nat_p m Hm)).
prove 0 c= m. apply Subq_Empty.
Qed.

Theorem SNo_0 : SNo 0.
exact ordinal_SNo 0 ordinal_Empty.
Qed.

Theorem SNo_1 : SNo 1.
apply ordinal_SNo. apply nat_p_ordinal. exact nat_1.
Qed.

Theorem SNo_2 : SNo 2.
apply ordinal_SNo. apply nat_p_ordinal. exact nat_2.
Qed.

Theorem SNoLev_0 : SNoLev 0 = 0.
exact ordinal_SNoLev 0 ordinal_Empty.
Qed.

Theorem SNoCut_0_0: SNoCut 0 0 = 0.
apply SNoCutP_SNoCut_impred 0 0 SNoCutP_0_0.
assume H1: SNo (SNoCut 0 0).
rewrite famunion_Empty (fun x => ordsucc (SNoLev x)).
rewrite binunion_idl 0.
assume H2: SNoLev (SNoCut 0 0) :e 1.
assume _ _ _.
claim L1: SNoLev (SNoCut 0 0) = 0.
{ apply cases_1 (SNoLev (SNoCut 0 0)) H2 (fun u => u = 0).
  prove 0 = 0.
  reflexivity.
}
apply SNo_eq (SNoCut 0 0) 0 H1 SNo_0.
- prove SNoLev (SNoCut 0 0) = SNoLev 0.
  transitivity 0.
  + exact L1.
  + symmetry. exact SNoLev_0.
- prove SNoEq_ (SNoLev (SNoCut 0 0)) (SNoCut 0 0) 0.
  rewrite L1.
  prove SNoEq_ 0 (SNoCut 0 0) 0.
  apply SNoEq_I.
  let beta. assume Hb: beta :e 0.
  prove False. exact EmptyE beta Hb.
Qed.

Theorem SNoL_0 : SNoL 0 = 0.
apply Empty_Subq_eq.
prove SNoL 0 c= Empty.
let z. assume Hz: z :e SNoL 0.
claim Lz: z :e SNoS_ 0.
{ rewrite <- SNoLev_0.
  prove z :e SNoS_ (SNoLev 0).
  exact SNoL_SNoS_ 0 z Hz.
}
apply SNoS_E2 0 ordinal_Empty z Lz.
assume Hz1: SNoLev z :e 0.
prove False.
exact EmptyE (SNoLev z) Hz1.
Qed.

Theorem SNoR_0 : SNoR 0 = 0.
apply Empty_Subq_eq.
prove SNoR 0 c= Empty.
let z. assume Hz: z :e SNoR 0.
claim Lz: z :e SNoS_ 0.
{ rewrite <- SNoLev_0.
  prove z :e SNoS_ (SNoLev 0).
  exact SNoR_SNoS_ 0 z Hz.
}
apply SNoS_E2 0 ordinal_Empty z Lz.
assume Hz1: SNoLev z :e 0.
prove False.
exact EmptyE (SNoLev z) Hz1.
Qed.

Theorem SNoL_1 : SNoL 1 = 1.
apply set_ext.
- let x. assume Hx: x :e SNoL 1.
  prove x :e 1.
  apply SNoL_E 1 SNo_1 x Hx.
  assume Hxa: SNo x.
  rewrite ordinal_SNoLev 1 (nat_p_ordinal 1 nat_1).
  assume Hxb: SNoLev x :e 1.
  assume _.
  claim L1: 0 = x.
  { apply SNo_eq 0 x SNo_0 Hxa.
    - prove SNoLev 0 = SNoLev x.
      rewrite SNoLev_0.
      prove 0 = SNoLev x.
      apply cases_1 (SNoLev x) Hxb (fun u => 0 = u).
      prove 0 = 0.
      reflexivity.
    - prove SNoEq_ (SNoLev 0) 0 x.
      rewrite SNoLev_0.
      prove SNoEq_ 0 0 x.
      apply SNoEq_I. let beta. assume Hb: beta :e 0.
      prove False. exact EmptyE beta Hb.
  }
  rewrite <- L1. exact In_0_1.
- let x. assume Hx: x :e 1.
  prove x :e SNoL 1.
  apply cases_1 x Hx (fun x => x :e SNoL 1).
  prove 0 :e SNoL 1.
  apply SNoL_I 1 SNo_1 0 SNo_0.
  + prove SNoLev 0 :e SNoLev 1. rewrite SNoLev_0.
    rewrite ordinal_SNoLev 1 (nat_p_ordinal 1 nat_1).
    exact In_0_1.
  + prove 0 < 1.
    exact ordinal_In_SNoLt 1 (nat_p_ordinal 1 nat_1) 0 In_0_1.
Qed.

Theorem SNoR_1 : SNoR 1 = 0.
exact ordinal_SNoR 1 (nat_p_ordinal 1 nat_1).
Qed.

Theorem SNo_max_SNoLev : forall x, SNo x -> (forall y :e SNoS_ (SNoLev x), y < x) -> SNoLev x = x.
let x. assume Hx: SNo x.
assume H2: forall y :e SNoS_ (SNoLev x), y < x.
claim LLx1: ordinal (SNoLev x).
{ exact SNoLev_ordinal x Hx. }
claim LLx2: SNo (SNoLev x).
{ exact ordinal_SNo (SNoLev x) LLx1. }
claim L3: x <= SNoLev x.
{ apply ordinal_SNoLev_max_2 (SNoLev x) LLx1 x Hx.
  prove SNoLev x :e ordsucc (SNoLev x).
  apply ordsuccI2.
}
apply SNoLeE x (SNoLev x) Hx LLx2 L3.
- assume H3: x < SNoLev x.
  prove False.
  apply SNoLtE x (SNoLev x) Hx LLx2 H3.
  + let z. assume Hz: SNo z. 
    assume Hz1: SNoLev z :e SNoLev x :/\: SNoLev (SNoLev x).
    assume Hz2: SNoEq_ (SNoLev z) z x.
    assume Hz3: SNoEq_ (SNoLev z) z (SNoLev x).
    assume Hz4: x < z.
    assume Hz5: z < SNoLev x.
    assume Hz6: SNoLev z /:e x.
    assume Hz7: SNoLev z :e SNoLev x.
    apply SNoLt_irref z.
    apply SNoLt_tra z x z Hz Hx Hz.
    * { prove z < x.
        apply H2.
        prove z :e SNoS_ (SNoLev x).
        apply SNoS_I (SNoLev x) LLx1 z (SNoLev z).
        - prove SNoLev z :e SNoLev x. exact Hz7.
        - prove SNo_ (SNoLev z) z. apply SNoLev_. exact Hz.
      }
    * prove x < z. exact Hz4.
  + assume H4: SNoLev x :e SNoLev (SNoLev x).
    prove False.
    apply In_irref (SNoLev x).
    rewrite <- ordinal_SNoLev (SNoLev x) LLx1 at 2.
    exact H4.
  + assume H4: SNoLev (SNoLev x) :e SNoLev x.
    prove False.
    apply In_irref (SNoLev x).
    rewrite <- ordinal_SNoLev (SNoLev x) LLx1 at 1.
    exact H4.
- assume H3: x = SNoLev x. symmetry. exact H3.
Qed.

Theorem SNo_max_ordinal : forall x, SNo x -> (forall y :e SNoS_ (SNoLev x), y < x) -> ordinal x.
let x. assume Hx: SNo x.
assume H2: forall y :e SNoS_ (SNoLev x), y < x.
prove ordinal x.
rewrite <- SNo_max_SNoLev x Hx H2.
prove ordinal (SNoLev x).
exact SNoLev_ordinal x Hx.
Qed.

Theorem pos_low_eq_one : forall x, SNo x -> 0 < x -> SNoLev x c= 1 -> x = 1.
let x. assume Hx Hxpos Hxlow.
apply SNoLtE 0 x SNo_0 Hx Hxpos.
- let y.
  assume Hy1: SNo y.
  assume Hy2: SNoLev y :e SNoLev 0 :/\: SNoLev x.
  prove False.
  apply EmptyE (SNoLev y).
  prove SNoLev y :e 0.
  rewrite <- ordinal_SNoLev 0 ordinal_Empty.
  prove SNoLev y :e SNoLev 0.
  exact binintersectE1 (SNoLev 0) (SNoLev x) (SNoLev y) Hy2.
- rewrite ordinal_SNoLev 0 ordinal_Empty.
  assume H1: 0 :e SNoLev x.
  assume _.
  assume H2: 0 :e x.
  claim L1: SNoLev x = 1.
  { apply set_ext.
    - exact Hxlow.
    - let n. assume Hn: n :e 1.
      apply cases_1 n Hn.
      prove 0 :e SNoLev x.
      exact H1.
  }
  apply SNo_eq x 1 Hx SNo_1.
  + prove SNoLev x = SNoLev 1.
    rewrite ordinal_SNoLev 1 (nat_p_ordinal 1 nat_1).
    prove SNoLev x = 1.
    exact L1.
  + prove SNoEq_ (SNoLev x) x 1. rewrite L1.
    prove SNoEq_ 1 x 1.
    let n. assume Hn: n :e 1.
    prove n :e x <-> n :e 1.
    apply cases_1 n Hn (fun n => n :e x <-> n :e 1).
    prove 0 :e x <-> 0 :e 1.
    apply iffI.
    * assume _. exact In_0_1.
    * assume _. exact H2.
- assume H1: SNoLev x :e SNoLev 0.
  prove False.
  apply EmptyE (SNoLev x).
  prove SNoLev x :e 0.
  rewrite <- ordinal_SNoLev 0 ordinal_Empty.
  prove SNoLev x :e SNoLev 0.
  exact H1.
Qed.

Definition SNo_extend0 : set -> set := fun x => PSNo (ordsucc (SNoLev x)) (fun delta => delta :e x /\ delta <> SNoLev x).

Definition SNo_extend1 : set -> set := fun x => PSNo (ordsucc (SNoLev x)) (fun delta => delta :e x \/ delta = SNoLev x).

Theorem SNo_extend0_SNo_ : forall x, SNo x -> SNo_ (ordsucc (SNoLev x)) (SNo_extend0 x).
let x. assume Hx: SNo x.
set alpha := SNoLev x.
claim La: ordinal alpha.
{ exact SNoLev_ordinal x Hx. }
exact SNo_PSNo (ordsucc alpha) (ordinal_ordsucc alpha La) (fun delta => delta :e x /\ delta <> alpha).
Qed.

Theorem SNo_extend1_SNo_ : forall x, SNo x -> SNo_ (ordsucc (SNoLev x)) (SNo_extend1 x).
let x. assume Hx: SNo x.
set alpha := SNoLev x.
claim La: ordinal alpha.
{ exact SNoLev_ordinal x Hx. }
exact SNo_PSNo (ordsucc alpha) (ordinal_ordsucc alpha La) (fun delta => delta :e x \/ delta = alpha).
Qed.

Theorem SNo_extend0_SNo : forall x, SNo x -> SNo (SNo_extend0 x).
let x. assume Hx.
exact SNo_SNo (ordsucc (SNoLev x))
              (ordinal_ordsucc (SNoLev x) (SNoLev_ordinal x Hx))
              (SNo_extend0 x) (SNo_extend0_SNo_ x Hx).
Qed.

Theorem SNo_extend1_SNo : forall x, SNo x -> SNo (SNo_extend1 x).
let x. assume Hx.
exact SNo_SNo (ordsucc (SNoLev x))
              (ordinal_ordsucc (SNoLev x) (SNoLev_ordinal x Hx))
              (SNo_extend1 x) (SNo_extend1_SNo_ x Hx).
Qed.

Theorem SNo_extend0_SNoLev : forall x, SNo x -> SNoLev (SNo_extend0 x) = ordsucc (SNoLev x).
let x. assume Hx.
exact SNoLev_uniq2 (ordsucc (SNoLev x))
                   (ordinal_ordsucc (SNoLev x) (SNoLev_ordinal x Hx))
                   (SNo_extend0 x) (SNo_extend0_SNo_ x Hx).
Qed.

Theorem SNo_extend1_SNoLev : forall x, SNo x -> SNoLev (SNo_extend1 x) = ordsucc (SNoLev x).
let x. assume Hx.
exact SNoLev_uniq2 (ordsucc (SNoLev x))
                   (ordinal_ordsucc (SNoLev x) (SNoLev_ordinal x Hx))
                   (SNo_extend1 x) (SNo_extend1_SNo_ x Hx).
Qed.

Theorem SNo_extend0_nIn : forall x, SNo x -> SNoLev x /:e SNo_extend0 x.
let x.
assume Hx: SNo x.
set alpha := SNoLev x.
assume H2: alpha :e PSNo (ordsucc alpha) (fun delta => delta :e x /\ delta <> alpha).
set p : set -> prop := fun delta => delta :e x /\ delta <> alpha.
apply binunionE {beta :e ordsucc alpha|p beta} {beta '|beta :e ordsucc alpha, ~p beta} alpha H2.
- assume H3: alpha :e {beta :e ordsucc alpha|p beta}.
  apply SepE2 (ordsucc alpha) p alpha H3.
  assume _.
  assume H4: alpha <> alpha. apply H4. reflexivity.
- assume H3: alpha :e {beta '|beta :e ordsucc alpha, ~p beta}.
  apply ReplSepE_impred (ordsucc alpha) (fun beta => ~p beta) (fun x => x ') alpha H3.
  let beta. assume Hb: beta :e ordsucc alpha.
  assume H4: ~p beta.
  assume H5: alpha = beta '.
  apply tagged_not_ordinal beta.
  prove ordinal (beta ').
  rewrite <- H5.
  prove ordinal alpha.
  exact SNoLev_ordinal x Hx.
Qed.

Theorem SNo_extend1_In : forall x, SNo x -> SNoLev x :e SNo_extend1 x.
let x.
assume Hx: SNo x.
set alpha := SNoLev x.
set p : set -> prop := fun delta => delta :e x \/ delta = alpha.
prove alpha :e {beta :e ordsucc alpha|p beta} :\/: {beta '|beta :e ordsucc alpha, ~p beta}.
apply binunionI1.
apply SepI.
- prove alpha :e ordsucc alpha. apply ordsuccI2.
- prove alpha :e x \/ alpha = alpha. apply orIR. reflexivity.
Qed.

Theorem SNo_extend0_SNoEq : forall x, SNo x -> SNoEq_ (SNoLev x) (SNo_extend0 x) x.
let x.
assume Hx: SNo x.
set alpha := SNoLev x.
claim La: ordinal alpha.
{ exact SNoLev_ordinal x Hx. }
prove SNoEq_ alpha (SNo_extend0 x) x.
set p : set -> prop := fun beta => beta :e x.
set q : set -> prop := fun beta => beta :e x /\ beta <> alpha.
prove PNoEq_ alpha (fun beta => beta :e PSNo (ordsucc alpha) q) p.
apply PNoEq_tra_ alpha
    (fun beta => beta :e PSNo (ordsucc alpha) q)
    q p.
- prove PNoEq_ alpha (fun beta => beta :e PSNo (ordsucc alpha) q) q.
  apply PNoEq_antimon_ (fun beta => beta :e PSNo (ordsucc alpha) q) q
                       (ordsucc alpha) (ordinal_ordsucc alpha La)
                       alpha (ordsuccI2 alpha).
  prove PNoEq_ (ordsucc alpha) (fun beta => beta :e PSNo (ordsucc alpha) q) q.
  exact PNoEq_PSNo (ordsucc alpha) (ordinal_ordsucc alpha La) q.
- prove PNoEq_ alpha q p.
  apply PNoEq_sym_.
  exact PNo_extend0_eq alpha p.
Qed.

Theorem SNo_extend1_SNoEq : forall x, SNo x -> SNoEq_ (SNoLev x) (SNo_extend1 x) x.
let x.
assume Hx: SNo x.
set alpha := SNoLev x.
claim La: ordinal alpha.
{ exact SNoLev_ordinal x Hx. }
prove SNoEq_ alpha (SNo_extend1 x) x.
set p : set -> prop := fun beta => beta :e x.
set q : set -> prop := fun beta => beta :e x \/ beta = alpha.
prove PNoEq_ alpha (fun beta => beta :e PSNo (ordsucc alpha) q) p.
apply PNoEq_tra_ alpha
    (fun beta => beta :e PSNo (ordsucc alpha) q)
    q p.
- prove PNoEq_ alpha (fun beta => beta :e PSNo (ordsucc alpha) q) q.
  apply PNoEq_antimon_ (fun beta => beta :e PSNo (ordsucc alpha) q) q
                       (ordsucc alpha) (ordinal_ordsucc alpha La)
                       alpha (ordsuccI2 alpha).
  prove PNoEq_ (ordsucc alpha) (fun beta => beta :e PSNo (ordsucc alpha) q) q.
  exact PNoEq_PSNo (ordsucc alpha) (ordinal_ordsucc alpha La) q.
- prove PNoEq_ alpha q p.
  apply PNoEq_sym_.
  exact PNo_extend1_eq alpha p.
Qed.

Theorem SNoLev_0_eq_0 : forall x, SNo x -> SNoLev x = 0 -> x = 0.
let x. assume Hx Hx0.
apply SNo_eq x 0 Hx SNo_0.
- prove SNoLev x = SNoLev 0. rewrite SNoLev_0. exact Hx0.
- prove SNoEq_ (SNoLev x) x 0.
  rewrite Hx0.
  let alpha. assume Ha: alpha :e 0.
  prove False. exact EmptyE alpha Ha.
Qed.

Theorem SNo_0_eq_0: forall q, SNo_ 0 q -> q = 0.
let q.
assume H1: SNo_ 0 q.
apply SNoLev_0_eq_0.
- exact SNo_SNo 0 ordinal_Empty q H1.
- exact SNoLev_uniq2 0 ordinal_Empty q H1.
Qed.

(** eps_ n is the Surreal Number 1/2^n, without needing to define division or exponents first **)
Definition eps_ : set -> set := fun n => {0} :\/: {(ordsucc m) ' | m :e n}.

Theorem eps_ordinal_In_eq_0 : forall n alpha, ordinal alpha -> alpha :e eps_ n -> alpha = 0.
let n alpha. assume Ha.
assume H1: alpha :e {0} :\/: {(ordsucc m) ' | m :e n}.
apply binunionE {0} {(ordsucc m) ' | m :e n} alpha H1.
- assume H2: alpha :e {0}. exact SingE 0 alpha H2.
- assume H2: alpha :e {(ordsucc m) ' | m :e n}. prove False.
  apply ReplE_impred n (fun m => (ordsucc m) ') alpha H2.
  let m. assume Hm: m :e n.
  assume H3: alpha = (ordsucc m) '.
  apply tagged_not_ordinal (ordsucc m).
  prove ordinal ((ordsucc m) ').
  rewrite <- H3.
  exact Ha.
Qed.

Theorem eps_0_1 : eps_ 0 = 1.
apply set_ext.
- let x. assume Hx: x :e {0} :\/: {(ordsucc m) ' | m :e 0}.
  apply binunionE {0} {(ordsucc m) ' | m :e 0} x Hx.
  + assume Hx: x :e {0}. rewrite SingE 0 x Hx.
    prove 0 :e 1. exact In_0_1.
  + assume Hx: x :e {(ordsucc m) ' | m :e 0}.
    apply ReplE_impred 0 (fun m => (ordsucc m) ') x Hx.
    let m. assume Hm: m :e 0. prove False. exact EmptyE m Hm.
- let x. assume Hx: x :e 1.
  apply cases_1 x Hx (fun x => x :e eps_ 0).
  prove 0 :e {0} :\/: {(ordsucc m) ' | m :e 0}.
  apply binunionI1. apply SingI.
Qed.

Theorem SNo__eps_ : forall n :e omega, SNo_ (ordsucc n) (eps_ n).
let n. assume Hn.
claim Ln: nat_p n.
{ exact omega_nat_p n Hn. }
prove eps_ n c= SNoElts_ (ordsucc n)
   /\ forall m :e ordsucc n, exactly1of2 (m ' :e eps_ n) (m :e eps_ n).
apply andI.
- let x. assume Hx: x :e {0} :\/: {(ordsucc m) ' | m :e n}.
  apply binunionE {0} {(ordsucc m) ' | m :e n} x Hx.
  + assume Hx: x :e {0}. rewrite SingE 0 x Hx.
    prove 0 :e SNoElts_ (ordsucc n).
    prove 0 :e ordsucc n :\/: {beta '|beta :e ordsucc n}.
    apply binunionI1.
    prove 0 :e ordsucc n.
    exact nat_0_in_ordsucc n Ln.
  + assume Hx: x :e {(ordsucc m) ' | m :e n}.
    apply ReplE_impred n (fun m => (ordsucc m) ') x Hx.
    let m. assume Hm: m :e n.
    assume Hxm: x = (ordsucc m) '.
    prove x :e SNoElts_ (ordsucc n).
    prove x :e ordsucc n :\/: {beta '|beta :e ordsucc n}.
    apply binunionI2.
    prove x :e {beta '|beta :e ordsucc n}.
    rewrite Hxm.
    prove (ordsucc m) ' :e {beta '|beta :e ordsucc n}.
    exact ReplI (ordsucc n) (fun beta => beta ') (ordsucc m) (nat_ordsucc_in_ordsucc n Ln m Hm).
- let m. assume Hm: m :e ordsucc n.
  claim Lm: nat_p m.
  { exact nat_p_trans (ordsucc n) (nat_ordsucc n Ln) m Hm. }
  apply nat_inv m Lm.
  + assume Hm: m = 0. rewrite Hm.
    apply exactly1of2_I2.
    * { prove 0 ' /:e eps_ n.
        assume H1: 0 ' :e {0} :\/: {(ordsucc m) ' | m :e n}.
        apply binunionE {0} {(ordsucc m) ' | m :e n} (0 ') H1.
        - assume H2: 0 ' :e {0}. apply EmptyE {1}.
          prove {1} :e 0.
          rewrite <- SingE 0 (0 ') H2 at 2.
          prove {1} :e 0 '.
          prove {1} :e 0 :\/: {{1}}.
          apply binunionI2.
          prove {1} :e {{1}}.
          apply SingI.
        - assume H2: 0 ' :e {(ordsucc m) ' | m :e n}.
          apply ReplE_impred n (fun m => (ordsucc m) ') (0 ') H2.
          let m. assume Hm: m :e n.
          assume H3: 0 ' = (ordsucc m) '.
          apply neq_0_ordsucc m.
          prove 0 = ordsucc m.
          apply tagged_eqE_eq.
          + prove ordinal 0. exact ordinal_Empty.
          + prove ordinal (ordsucc m).
            exact (nat_p_ordinal (ordsucc m) (nat_ordsucc m (nat_p_trans n Ln m Hm))).
          + prove 0 ' = (ordsucc m) '. exact H3.
      }
    * prove 0 :e eps_ n.
      prove 0 :e {0} :\/: {(ordsucc m) '|m :e n}.
      apply binunionI1. exact SingI 0.
  + assume H1. apply H1. let k. assume H1. apply H1.
    assume Hk: nat_p k.
    assume Hmk: m = ordsucc k.
    claim Lm: nat_p m.
    { rewrite Hmk. exact nat_ordsucc k Hk. }
    claim LSk: ordsucc k :e ordsucc n.
    { rewrite <- Hmk. exact Hm. }
    claim Lk: k :e n.
    { apply ordsuccE n (ordsucc k) LSk.
      - assume H2: ordsucc k :e n. apply nat_trans n Ln (ordsucc k) H2.
        prove k :e ordsucc k. apply ordsuccI2.
      - assume H2: ordsucc k = n. rewrite <- H2. apply ordsuccI2.
    }
    apply exactly1of2_I1.
    * prove m ' :e eps_ n.
      prove m ' :e {0} :\/: {(ordsucc m) ' | m :e n}.
      apply binunionI2.
      rewrite Hmk.
      prove (ordsucc k) ' :e {(ordsucc m) ' | m :e n}.
      exact ReplI n (fun k => (ordsucc k) ') k Lk.
    * { prove m /:e eps_ n.
        assume H1: m :e {0} :\/: {(ordsucc m) ' | m :e n}.
        apply binunionE {0} {(ordsucc m) ' | m :e n} m H1.
        - assume H2: m :e {0}. apply EmptyE 0.
          prove 0 :e 0. rewrite <- SingE 0 m H2 at 2.
          prove 0 :e m.
          rewrite Hmk.
          exact nat_0_in_ordsucc k Hk.
        - assume H2: m :e {(ordsucc j) ' | j :e n}.
          apply ReplE_impred n (fun j => (ordsucc j) ') m H2.
          let j. assume Hj: j :e n.
          assume Hmj: m = (ordsucc j) '.
          apply tagged_not_ordinal (ordsucc j).
          prove ordinal ((ordsucc j) ').
          rewrite <- Hmj.
          prove ordinal m.
          exact nat_p_ordinal m Lm.
      }
Qed.

Theorem SNo_eps_ : forall n :e omega, SNo (eps_ n).
let n. assume Hn.
claim Ln: nat_p n.
{ exact omega_nat_p n Hn. }
exact SNo_SNo (ordsucc n) (ordinal_ordsucc n (nat_p_ordinal n Ln)) (eps_ n) (SNo__eps_ n Hn).
Qed.

Theorem SNo_eps_1 : SNo (eps_ 1).
exact SNo_eps_ 1 (nat_p_omega 1 nat_1).
Qed.

Theorem SNoLev_eps_ : forall n :e omega, SNoLev (eps_ n) = ordsucc n.
let n. assume Hn.
claim Ln: nat_p n.
{ exact omega_nat_p n Hn. }
apply SNoLev_uniq2 (ordsucc n) (ordinal_ordsucc n (nat_p_ordinal n Ln)) (eps_ n) (SNo__eps_ n Hn).
Qed.

Theorem SNo_eps_SNoS_omega : forall n :e omega, eps_ n :e SNoS_ omega.
let n. assume Hn.
apply SNoS_I omega omega_ordinal (eps_ n) (ordsucc n).
- prove ordsucc n :e omega. exact omega_ordsucc n Hn.
- prove SNo_ (ordsucc n) (eps_ n). exact SNo__eps_ n Hn.
Qed.

Theorem SNo_eps_decr : forall n :e omega, forall m :e n, eps_ n < eps_ m.
let n. assume Hn. let m. assume Hm.
claim Lnn: nat_p n.
{ exact omega_nat_p n Hn. }
claim Lmn: nat_p m.
{ exact nat_p_trans n Lnn m Hm. }
claim Lm: m :e omega.
{ exact nat_p_omega m Lmn. }
apply SNoLtI3.
- prove SNoLev (eps_ m) :e SNoLev (eps_ n).
  rewrite SNoLev_eps_ m Lm.
  rewrite SNoLev_eps_ n Hn.
  prove ordsucc m :e ordsucc n.
  exact nat_ordsucc_in_ordsucc n Lnn m Hm.
- prove SNoEq_ (SNoLev (eps_ m)) (eps_ n) (eps_ m).
  rewrite SNoLev_eps_ m Lm.
  prove SNoEq_ (ordsucc m) (eps_ n) (eps_ m).
  let k. assume Hk: k :e ordsucc m.
  prove k :e eps_ n <-> k :e eps_ m.
  claim Lk: ordinal k.
  { exact nat_p_ordinal k (nat_p_trans (ordsucc m) (nat_ordsucc m Lmn) k Hk). }
  apply iffI.
  + assume H1: k :e eps_ n. rewrite eps_ordinal_In_eq_0 n k Lk H1.
    prove 0 :e eps_ m.
    prove 0 :e {0} :\/: {(ordsucc j) ' | j :e m}.
    apply binunionI1. apply SingI.
  + assume H1: k :e eps_ m. rewrite eps_ordinal_In_eq_0 m k Lk H1.
    prove 0 :e eps_ n.
    prove 0 :e {0} :\/: {(ordsucc j) ' | j :e n}.
    apply binunionI1. apply SingI.
- prove SNoLev (eps_ m) /:e eps_ n.
  rewrite SNoLev_eps_ m Lm.
  assume H1: ordsucc m :e eps_ n.
  apply neq_ordsucc_0 m.
  prove ordsucc m = 0.
  exact eps_ordinal_In_eq_0 n (ordsucc m) (ordinal_ordsucc m (nat_p_ordinal m Lmn)) H1.
Qed.

Theorem SNo_eps_pos : forall n :e omega, 0 < eps_ n.
let n. assume Hn.
apply SNoLtI2 0 (eps_ n).
- prove SNoLev 0 :e SNoLev (eps_ n).
  rewrite SNoLev_0. rewrite SNoLev_eps_ n Hn.
  prove 0 :e ordsucc n. exact nat_0_in_ordsucc n (omega_nat_p n Hn).
- prove SNoEq_ (SNoLev 0) 0 (eps_ n).
  rewrite SNoLev_0.
  let alpha. assume Ha: alpha :e 0.
  prove False. exact EmptyE alpha Ha.
- prove SNoLev 0 :e eps_ n.
  rewrite SNoLev_0.
  prove 0 :e eps_ n.
  prove 0 :e {0} :\/: {(ordsucc m) ' | m :e n}.
  apply binunionI1. apply SingI.
Qed.

Theorem SNo_pos_eps_Lt : forall n, nat_p n -> forall x :e SNoS_ (ordsucc n), 0 < x -> eps_ n < x.
let n. assume Hn: nat_p n.
let x. assume Hx: x :e SNoS_ (ordsucc n).
assume Hxpos: 0 < x.
claim Ln: n :e omega.
{ exact nat_p_omega n Hn. }
apply SNoS_E2 (ordsucc n) (nat_p_ordinal (ordsucc n) (nat_ordsucc n Hn)) x Hx.
assume Hx1: SNoLev x :e ordsucc n.
assume Hx2: ordinal (SNoLev x).
assume Hx3: SNo x.
assume Hx4: SNo_ (SNoLev x) x.
prove eps_ n < x.
apply SNoLt_trichotomy_or_impred (eps_ n) x (SNo_eps_ n Ln) Hx3.
- assume H2: eps_ n < x. exact H2.
- assume H2: eps_ n = x. prove False.
  apply In_irref (ordsucc n).
  rewrite <- SNoLev_eps_ n Ln at 1.
  prove SNoLev (eps_ n) :e ordsucc n.
  rewrite H2. exact Hx1.
- assume H2: x < eps_ n. prove False.
  apply SNoLtE x (eps_ n) Hx3 (SNo_eps_ n Ln) H2.
  + let z.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev x :/\: SNoLev (eps_ n).
    assume Hz3: SNoEq_ (SNoLev z) z x.
    assume Hz4: SNoEq_ (SNoLev z) z (eps_ n).
    assume Hz5: x < z.
    assume Hz6: z < eps_ n.
    assume Hz7: SNoLev z /:e x.
    assume Hz8: SNoLev z :e eps_ n.
    claim Lz0: z = 0.
    { apply SNoLev_0_eq_0 z Hz1. exact eps_ordinal_In_eq_0 n (SNoLev z) (SNoLev_ordinal z Hz1) Hz8. }
    apply SNoLt_irref x.
    prove x < x.
    apply SNoLt_tra x z x Hx3 Hz1 Hx3 Hz5.
    prove z < x. rewrite Lz0. exact Hxpos.
  + assume H1: SNoLev x :e SNoLev (eps_ n).
    assume H2: SNoEq_ (SNoLev x) x (eps_ n).
    assume H3: SNoLev x :e (eps_ n).
    claim Lx0: x = 0.
    { apply SNoLev_0_eq_0 x Hx3. exact eps_ordinal_In_eq_0 n (SNoLev x) Hx2 H3. }
    apply SNoLt_irref x. rewrite Lx0 at 1. exact Hxpos.
  + rewrite SNoLev_eps_ n Ln.
    assume H1: ordsucc n :e SNoLev x. prove False.
    exact In_no2cycle (SNoLev x) (ordsucc n) Hx1 H1.
Qed.

Theorem SNo_pos_eps_Le : forall n, nat_p n -> forall x :e SNoS_ (ordsucc (ordsucc n)), 0 < x -> eps_ n <= x.
let n. assume Hn.
let x. assume Hx: x :e SNoS_ (ordsucc (ordsucc n)).
assume Hxpos: 0 < x.
claim Ln: n :e omega.
{ exact nat_p_omega n Hn. }
apply SNoS_E2 (ordsucc (ordsucc n)) (nat_p_ordinal (ordsucc (ordsucc n)) (nat_ordsucc (ordsucc n) (nat_ordsucc n Hn))) x Hx.
assume Hx1: SNoLev x :e ordsucc (ordsucc n).
assume Hx2: ordinal (SNoLev x).
assume Hx3: SNo x.
assume Hx4: SNo_ (SNoLev x) x.
prove eps_ n <= x.
apply SNoLtLe_or x (eps_ n) Hx3 (SNo_eps_ n Ln).
- assume H2: x < eps_ n. prove False.
  apply SNoLtE x (eps_ n) Hx3 (SNo_eps_ n Ln) H2.
  + let z.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev x :/\: SNoLev (eps_ n).
    assume Hz3: SNoEq_ (SNoLev z) z x.
    assume Hz4: SNoEq_ (SNoLev z) z (eps_ n).
    assume Hz5: x < z.
    assume Hz6: z < eps_ n.
    assume Hz7: SNoLev z /:e x.
    assume Hz8: SNoLev z :e eps_ n.
    claim Lz0: z = 0.
    { apply SNoLev_0_eq_0 z Hz1. exact eps_ordinal_In_eq_0 n (SNoLev z) (SNoLev_ordinal z Hz1) Hz8. }
    apply SNoLt_irref x.
    prove x < x.
    apply SNoLt_tra x z x Hx3 Hz1 Hx3 Hz5.
    prove z < x. rewrite Lz0. exact Hxpos.
  + assume H1: SNoLev x :e SNoLev (eps_ n).
    assume H2: SNoEq_ (SNoLev x) x (eps_ n).
    assume H3: SNoLev x :e (eps_ n).
    claim Lx0: x = 0.
    { apply SNoLev_0_eq_0 x Hx3. exact eps_ordinal_In_eq_0 n (SNoLev x) Hx2 H3. }
    apply SNoLt_irref x. rewrite Lx0 at 1. exact Hxpos.
  + rewrite SNoLev_eps_ n Ln.
    assume H3: ordsucc n :e SNoLev x. prove False.
    apply ordsuccE (ordsucc n) (SNoLev x) Hx1.
    * assume H4: SNoLev x :e ordsucc n.
      exact In_no2cycle (SNoLev x) (ordsucc n) H4 H3.
    * assume H4: SNoLev x = ordsucc n.
      apply In_irref (SNoLev x). rewrite H4 at 1. exact H3.
- assume H2: eps_ n <= x. exact H2.
Qed.

Theorem eps_SNo_eq : forall n, nat_p n -> forall x :e SNoS_ (ordsucc n), 0 < x -> SNoEq_ (SNoLev x) (eps_ n) x -> exists m :e n, x = eps_ m.
let n. assume Hn.
let x.
assume Hx1: x :e SNoS_ (ordsucc n).
assume Hx2: 0 < x.
assume Hx3: SNoEq_ (SNoLev x) (eps_ n) x.
apply SNoS_E2 (ordsucc n) (nat_p_ordinal (ordsucc n) (nat_ordsucc n Hn)) x Hx1.
assume Hx1a: SNoLev x :e ordsucc n.
assume Hx1b: ordinal (SNoLev x).
assume Hx1c: SNo x.
assume Hx1d: SNo_ (SNoLev x) x.
claim L1: nat_p (SNoLev x).
{ apply nat_p_trans (ordsucc n) (nat_ordsucc n Hn).
  prove SNoLev x :e ordsucc n. exact Hx1a.
}
apply nat_inv (SNoLev x) L1.
- assume H1: SNoLev x = 0. prove False.
  claim L2: x = 0.
  { exact SNoLev_0_eq_0 x Hx1c H1. }
  apply SNoLt_irref x.
  rewrite L2 at 1.
  exact Hx2.
- assume H1. apply H1. let m. assume H1. apply H1.
  assume Hm1: nat_p m.
  assume Hm2: SNoLev x = ordsucc m.
  witness m. apply andI.
  + prove m :e n.
    apply nat_ordsucc_trans n Hn (SNoLev x) Hx1a.
    prove m :e SNoLev x. rewrite Hm2. apply ordsuccI2.
  + prove x = eps_ m.
    apply SNo_eq x (eps_ m) Hx1c (SNo_eps_ m (nat_p_omega m Hm1)).
    * prove SNoLev x = SNoLev (eps_ m).
      rewrite SNoLev_eps_ m (nat_p_omega m Hm1).
      exact Hm2.
    * { prove SNoEq_ (SNoLev x) x (eps_ m).
        apply SNoEq_tra_ (SNoLev x) x (eps_ n) (eps_ m).
        - apply SNoEq_sym_. exact Hx3.
        - prove SNoEq_ (SNoLev x) (eps_ n) (eps_ m).
          rewrite Hm2.
          prove SNoEq_ (ordsucc m) (eps_ n) (eps_ m).
          apply SNoEq_I.
          let k. assume Hk: k :e ordsucc m.
          claim L3: ordinal k.
          { exact nat_p_ordinal k (nat_p_trans (ordsucc m) (nat_ordsucc m Hm1) k Hk). }
          apply iffI.
          + assume H2: k :e eps_ n.
            rewrite eps_ordinal_In_eq_0 n k L3 H2.
            prove 0 :e eps_ m.
            prove 0 :e {0} :\/: {SetAdjoin (ordsucc k) {1}| k :e m}.
            apply binunionI1. apply SingI.
          + assume H2: k :e eps_ m.
            rewrite eps_ordinal_In_eq_0 m k L3 H2.
            prove 0 :e eps_ n.
            prove 0 :e {0} :\/: {SetAdjoin (ordsucc k) {1}| k :e n}.
            apply binunionI1. apply SingI.
      }
Qed.

Theorem eps_SNoCutP : forall n :e omega, SNoCutP {0} {eps_ m|m :e n}.
let n. assume Hn.
set L := {0}.
set R := {eps_ m|m :e n}.
claim Ln: nat_p n.
{ exact omega_nat_p n Hn. }
prove (forall w :e L, SNo w)
   /\ (forall z :e R, SNo z)
   /\ (forall w :e L, forall z :e R, w < z).
apply and3I.
- let w. assume Hw. rewrite SingE 0 w Hw. exact SNo_0.
- let z. assume Hz. apply ReplE_impred n eps_ z Hz.
  let m. assume Hm1: m :e n. assume Hm2: z = eps_ m.
  rewrite Hm2. apply SNo_eps_.
  prove m :e omega. apply nat_p_omega.
  exact nat_p_trans n Ln m Hm1.
- let w. assume Hw.
  let z. assume Hz. apply ReplE_impred n eps_ z Hz.
  let m. assume Hm1: m :e n. assume Hm2: z = eps_ m.
  rewrite SingE 0 w Hw.
  rewrite Hm2.
  prove 0 < eps_ m.
  apply SNo_eps_pos.
  prove m :e omega. apply nat_p_omega.
  exact nat_p_trans n Ln m Hm1.
Qed.

Theorem eps_SNoCut : forall n :e omega, eps_ n = SNoCut {0} {eps_ m|m :e n}.
let n. assume Hn.
set L := {0}.
set R := {eps_ m|m :e n}.
claim Ln: nat_p n.
{ exact omega_nat_p n Hn. }
claim L1: SNoCutP L R.
{ exact eps_SNoCutP n Hn. }
claim LRS: forall z :e R, SNo z.
{ apply L1. assume H _. apply H. assume _ H. exact H. }
claim L2: (\/_ x :e L, ordsucc (SNoLev x)) = 1.
{ apply set_ext.
  - let k. assume Hk. apply famunionE_impred L (fun x => ordsucc (SNoLev x)) k Hk.
    let w. assume Hw: w :e L. rewrite SingE 0 w Hw.
    rewrite SNoLev_0.
    assume H2: k :e 1.
    prove k :e 1.
    exact H2.
  - let i. assume Hi. apply cases_1 i Hi (fun i => i :e \/_ x :e L, ordsucc (SNoLev x)).
    prove 0 :e \/_ x :e L, ordsucc (SNoLev x).
    apply famunionI L (fun x => ordsucc (SNoLev x)) 0 0 (SingI 0).
    prove 0 :e ordsucc (SNoLev 0).
    rewrite SNoLev_0.
    exact In_0_1.
}
claim L3: n <> 0 -> (\/_ y :e R, ordsucc (SNoLev y)) = ordsucc n.
{ assume Hn0: n <> 0.
  apply set_ext.
  - let k. assume Hk. apply famunionE_impred R (fun y => ordsucc (SNoLev y)) k Hk.
    let z. assume Hz: z :e R. apply ReplE_impred n eps_ z Hz.
    let m. assume Hm1: m :e n. assume Hm2: z = eps_ m.
    rewrite Hm2. rewrite SNoLev_eps_ m (nat_p_omega m (nat_p_trans n Ln m Hm1)).
    assume H2: k :e ordsucc (ordsucc m).
    prove k :e ordsucc n.
    claim L3a: ordsucc m :e ordsucc n.
    { apply ordinal_ordsucc_In.
      - prove ordinal n. apply nat_p_ordinal n. exact Ln.
      - exact Hm1.
    }
    claim L3b: ordsucc m c= ordsucc n.
    { exact nat_trans (ordsucc n) (nat_ordsucc n Ln) (ordsucc m) L3a. }
    apply ordsuccE (ordsucc m) k H2.
    + assume H3: k :e ordsucc m. apply L3b. exact H3.
    + assume H3: k = ordsucc m. rewrite H3. exact L3a.
  - let i. assume Hi: i :e ordsucc n.
    prove i :e \/_ y :e R, ordsucc (SNoLev y).
    apply nat_inv n Ln.
    + assume H2: n = 0. prove False. exact Hn0 H2.
    + assume H2. apply H2.
      let n'.
      assume H2. apply H2.
      assume Hn'1: nat_p n'. assume Hn'2: n = ordsucc n'.
      apply famunionI R (fun y => ordsucc (SNoLev y)) (eps_ n') i.
      * prove eps_ n' :e R. apply ReplI. prove n' :e n. rewrite Hn'2. apply ordsuccI2.
      * prove i :e ordsucc (SNoLev (eps_ n')).
        rewrite SNoLev_eps_ n' (nat_p_omega n' Hn'1).
        prove i :e ordsucc (ordsucc n'). rewrite <- Hn'2. exact Hi.
}
claim L4: (\/_ x :e L, ordsucc (SNoLev x)) :\/: (\/_ y :e R, ordsucc (SNoLev y)) = ordsucc n.
{ apply xm (n = 0).
  - assume H2: n = 0.
    claim L4a: R = 0.
    { apply Empty_eq.
      let z. assume Hz. apply ReplE_impred n eps_ z Hz.
      let m. rewrite H2. assume Hm1: m :e 0.
      prove False. exact EmptyE m Hm1.
    }
    rewrite L4a. rewrite famunion_Empty (fun y => ordsucc (SNoLev y)).
    prove (\/_ x :e L, ordsucc (SNoLev x)) :\/: 0 = ordsucc n.
    rewrite binunion_idr.
    prove (\/_ x :e L, ordsucc (SNoLev x)) = ordsucc n.
    rewrite H2. exact L2.
  - assume H2: n <> 0.
    rewrite <- L3 H2.
    rewrite <- Subq_binunion_eq.
    rewrite L2. rewrite L3 H2.
    prove 1 c= ordsucc n.
    let i. assume Hi. apply cases_1 i Hi (fun i => i :e ordsucc n).
    prove 0 :e ordsucc n. apply nat_0_in_ordsucc. exact Ln.
}
apply SNoCutP_SNoCut_impred L R L1.
assume H1: SNo (SNoCut L R).
rewrite L4.
assume H2: SNoLev (SNoCut L R) :e ordsucc (ordsucc n).
assume H3: forall w :e L, w < SNoCut L R.
assume H4: forall z :e R, SNoCut L R < z.
assume H5: forall u, SNo u -> (forall w :e L, w < u) -> (forall z :e R, u < z) -> SNoLev (SNoCut L R) c= SNoLev u /\ SNoEq_ (SNoLev (SNoCut L R)) (SNoCut L R) u.
claim L5: SNo (eps_ n).
{ exact SNo_eps_ n Hn. }
claim L6: forall w :e L, w < eps_ n.
{ let w. assume Hw. rewrite SingE 0 w Hw.
  prove 0 < eps_ n. exact SNo_eps_pos n Hn.
}
claim L7: forall z :e R, eps_ n < z.
{ let z. assume Hz. apply ReplE_impred n eps_ z Hz.
  let m. assume Hm1: m :e n. assume Hm2: z = eps_ m.
  rewrite Hm2.
  prove eps_ n < eps_ m.
  exact SNo_eps_decr n Hn m Hm1.
}
apply H5 (eps_ n) L5 L6 L7.
assume H6: SNoLev (SNoCut L R) c= SNoLev (eps_ n).
assume H7: SNoEq_ (SNoLev (SNoCut L R)) (SNoCut L R) (eps_ n).
symmetry.
apply SNo_eq (SNoCut L R) (eps_ n) H1 L5.
- prove SNoLev (SNoCut L R) = SNoLev (eps_ n).
  rewrite SNoLev_eps_ n Hn.
  prove SNoLev (SNoCut L R) = ordsucc n.
  apply ordsuccE (ordsucc n) (SNoLev (SNoCut L R)) H2.
  + assume H8: SNoLev (SNoCut L R) :e ordsucc n.
    prove False.
    claim L8: eps_ n < SNoCut L R.
    { apply SNo_pos_eps_Lt n (omega_nat_p n Hn) (SNoCut L R).
      - prove SNoCut L R :e SNoS_ (ordsucc n).
        apply SNoS_I (ordsucc n) (nat_p_ordinal (ordsucc n) (nat_ordsucc n (omega_nat_p n Hn))) (SNoCut L R) (SNoLev (SNoCut L R)) H8.
        prove SNo_ (SNoLev (SNoCut L R)) (SNoCut L R).
        exact SNoLev_ (SNoCut L R) H1.
      - prove 0 < SNoCut L R. apply H3. apply SingI.
    }
    apply SNoLtE (eps_ n) (SNoCut L R) (SNo_eps_ n Hn) H1 L8.
    * let z.
      assume Hz1: SNo z.
      assume Hz2: SNoLev z :e SNoLev (eps_ n) :/\: SNoLev (SNoCut L R).
      assume Hz3: SNoEq_ (SNoLev z) z (eps_ n).
      assume Hz4: SNoEq_ (SNoLev z) z (SNoCut L R).
      assume Hz5: eps_ n < z.
      assume Hz6: z < SNoCut L R.
      assume Hz7: SNoLev z /:e eps_ n.
      assume Hz8: SNoLev z :e SNoCut L R.
      claim L9: forall w :e L, w < z.
      { let w. assume Hw. rewrite SingE 0 w Hw.
        prove 0 < z.
        apply SNoLt_tra 0 (eps_ n) z SNo_0 (SNo_eps_ n Hn) Hz1.
        - exact SNo_eps_pos n Hn.
        - exact Hz5.
      }
      claim L10: forall v :e R, z < v.
      { let v. assume Hv.
        apply SNoLt_tra z (SNoCut L R) v Hz1 H1 (LRS v Hv) Hz6.
        prove SNoCut L R < v. apply H4. exact Hv.
      }
      apply H5 z Hz1 L9 L10.
      assume H9: SNoLev (SNoCut L R) c= SNoLev z.
      prove False.
      apply In_irref (SNoLev z). apply H9.
      exact binintersectE2 (SNoLev (eps_ n)) (SNoLev (SNoCut L R)) (SNoLev z) Hz2.
    * rewrite SNoLev_eps_ n Hn. 
      assume H9: ordsucc n :e SNoLev (SNoCut L R).
      prove False.
      exact In_no2cycle (SNoLev (SNoCut L R)) (ordsucc n) H8 H9.
    * rewrite SNoLev_eps_ n Hn.
      assume H9: SNoLev (SNoCut L R) :e ordsucc n.
      assume H10: SNoEq_ (SNoLev (SNoCut L R)) (eps_ n) (SNoCut L R).
      assume H11: SNoLev (SNoCut L R) /:e eps_ n.
      claim L11: exists m :e n, SNoCut L R = eps_ m.
      { apply eps_SNo_eq n (omega_nat_p n Hn) (SNoCut L R).
        - prove SNoCut L R :e SNoS_ (ordsucc n).
          apply SNoS_I (ordsucc n) (nat_p_ordinal (ordsucc n) (nat_ordsucc n (omega_nat_p n Hn))) (SNoCut L R) (SNoLev (SNoCut L R)).
          + prove SNoLev (SNoCut L R) :e ordsucc n. exact H9.
          + prove SNo_ (SNoLev (SNoCut L R)) (SNoCut L R).
            apply SNoLev_. exact H1.
        - prove 0 < SNoCut L R. apply H3. apply SingI.
        - prove SNoEq_ (SNoLev (SNoCut L R)) (eps_ n) (SNoCut L R). exact H10.
      }
      apply L11. let m. assume H12. apply H12.
      assume Hm1: m :e n.
      assume Hm2: SNoCut L R = eps_ m.
      apply SNoLt_irref (eps_ m).
      prove eps_ m < eps_ m.
      rewrite <- Hm2 at 1.
      prove SNoCut L R < eps_ m.
      apply H4.
      prove eps_ m :e {eps_ m|m :e n}.
      apply ReplI. exact Hm1.
  + assume H8: SNoLev (SNoCut L R) = ordsucc n. exact H8.
- exact H7.
Qed.

End TaggedSets2.

Theorem SNo_etaE : forall z, SNo z ->
  forall p:prop,
     (forall L R, SNoCutP L R
       -> (forall x :e L, SNoLev x :e SNoLev z)
       -> (forall y :e R, SNoLev y :e SNoLev z)
       -> z = SNoCut L R
       -> p)
   -> p.
let z. assume Hz: SNo z.
let p. assume H1.
claim LLz: ordinal (SNoLev z).
{ exact SNoLev_ordinal z Hz. }
set L := {x :e SNoS_ (SNoLev z) | x < z}.
set R := {y :e SNoS_ (SNoLev z) | z < y}.
claim L1: z = SNoCut L R.
{ exact SNo_eta z Hz. }
claim LL: forall x, x :e L -> SNo x /\ SNoLev x :e SNoLev z /\ x < z.
{ let x. assume Hx: x :e L.
  apply SepE (SNoS_ (SNoLev z)) (fun x => x < z) x Hx.
  assume Hx1: x :e SNoS_ (SNoLev z).
  assume Hx2: x < z.
  apply SNoS_E (SNoLev z) LLz x Hx1.
  let beta. assume Hx3. apply Hx3.
  assume Hb: beta :e SNoLev z.
  assume Hx3: SNo_ beta x.
  claim Lb: ordinal beta.
  { exact ordinal_Hered (SNoLev z) LLz beta Hb. }
  claim Lx1: SNo x.
  { prove exists alpha, ordinal alpha /\ SNo_ alpha x.
    witness beta.
    apply andI.
    - exact Lb.
    - exact Hx3.
  }
  claim Lx2: SNoLev x = beta.
  { apply SNoLev_prop x Lx1.
    assume Hx4: ordinal (SNoLev x).
    assume Hx5: SNo_ (SNoLev x) x.
    apply SNoLev_uniq x.
    - exact Hx4.
    - exact Lb.
    - apply Hx5.
    - exact Hx3.
  }
  claim Lx3: SNoLev x :e SNoLev z.
  { rewrite Lx2. exact Hb. }
  apply and3I.
  - prove SNo x. exact Lx1.
  - prove SNoLev x :e SNoLev z. exact Lx3.
  - prove x < z. exact Hx2.
}
claim LR: forall y, y :e R -> SNo y /\ SNoLev y :e SNoLev z /\ z < y.
{ let y.
  assume Hy: y :e R.
  apply SepE (SNoS_ (SNoLev z)) (fun y => z < y) y Hy.
  assume Hy1: y :e SNoS_ (SNoLev z).
  assume Hy2: z < y.
  apply SNoS_E (SNoLev z) LLz y Hy1.
  let beta. assume Hy3. apply Hy3.
  assume Hb: beta :e SNoLev z.
  assume Hy3: SNo_ beta y.
  claim Lb: ordinal beta.
  { exact ordinal_Hered (SNoLev z) LLz beta Hb. }
  claim Ly1: SNo y.
  { prove exists alpha, ordinal alpha /\ SNo_ alpha y.
    witness beta. apply andI.
    - exact Lb.
    - exact Hy3.
  }
  claim Ly2: SNoLev y = beta.
  { apply SNoLev_prop y Ly1.
    assume Hy4: ordinal (SNoLev y).
    assume Hy5: SNo_ (SNoLev y) y.
    apply SNoLev_uniq y.
    - exact Hy4.
    - exact Lb.
    - apply Hy5.
    - exact Hy3.
  }
  claim Ly3: SNoLev y :e SNoLev z.
  { rewrite Ly2. exact Hb. }
  apply and3I.
  - prove SNo y. exact Ly1.
  - prove SNoLev y :e SNoLev z. exact Ly3.
  - prove z < y. exact Hy2.
}
apply H1 L R.
- prove SNoCutP L R.
  prove (forall x :e L, SNo x)
     /\ (forall y :e R, SNo y)
     /\ (forall x :e L, forall y :e R, x < y).
  apply and3I.
  + let x. assume Hx. apply LL x Hx. assume H _. apply H. assume H _. exact H.
  + let y. assume Hy. apply LR y Hy. assume H _. apply H. assume H _. exact H.
  + let x. assume Hx. let y. assume Hy.
    apply LL x Hx. assume H2. apply H2.
    assume H2: SNo x.
    assume H3: SNoLev x :e SNoLev z.
    assume H4: x < z.
    apply LR y Hy. assume H5. apply H5.
    assume H5: SNo y.
    assume H6: SNoLev y :e SNoLev z.
    assume H7: z < y.
    exact SNoLt_tra x z y H2 Hz H5 H4 H7.
- prove forall x :e L, SNoLev x :e SNoLev z.
  let x. assume Hx. apply LL x Hx. assume H _. apply H. assume _ H. exact H.
- prove forall y :e R, SNoLev y :e SNoLev z.
  let y. assume Hy. apply LR y Hy. assume H _. apply H. assume _ H. exact H.
- prove z = SNoCut L R. exact L1.
Qed.

(*** surreal induction ***)
Theorem SNo_ind : forall P:set -> prop,
  (forall L R, SNoCutP L R
   -> (forall x :e L, P x)
   -> (forall y :e R, P y)
   -> P (SNoCut L R))
 -> forall z, SNo z -> P z.
let P.
assume H1.
claim L1: forall alpha, ordinal alpha -> forall z, SNo z -> SNoLev z :e alpha -> P z.
{ apply ordinal_ind.
  let alpha. assume Ha: ordinal alpha.
  assume IH: forall beta :e alpha, forall z, SNo z -> SNoLev z :e beta -> P z.
  let z. assume Hz: SNo z.
  assume Hz2: SNoLev z :e alpha.
  prove P z.
  claim LLz: ordinal (SNoLev z).
  { exact SNoLev_ordinal z Hz. }
  apply SNo_etaE z Hz.
  let L R.
  assume H2: SNoCutP L R.
  assume H3: forall x :e L, SNoLev x :e SNoLev z.
  assume H4: forall y :e R, SNoLev y :e SNoLev z.
  assume H5: z = SNoCut L R.
  apply H2. assume H6. apply H6.
  assume H6: forall x :e L, SNo x.
  assume H7: forall y :e R, SNo y.
  assume H8: forall x :e L, forall y :e R, x < y.
  rewrite H5.
  prove P (SNoCut L R).
  apply H1.
  - prove SNoCutP L R. exact H2.
  - prove forall x, x :e L -> P x.
    let x. assume Hx: x :e L.
    apply IH (SNoLev z) Hz2 x.
    + prove SNo x. exact H6 x Hx.
    + prove SNoLev x :e SNoLev z. exact H3 x Hx.
  - prove forall y, y :e R -> P y.
    let y. assume Hy: y :e R.
    apply IH (SNoLev z) Hz2 y.
    + prove SNo y. exact H7 y Hy.
    + prove SNoLev y :e SNoLev z. exact H4 y Hy.
}
let z. assume Hz: SNo z.
claim L2: ordinal (ordsucc (SNoLev z)).
{ apply ordinal_ordsucc. apply SNoLev_ordinal. exact Hz. }
apply L1 (ordsucc (SNoLev z)) L2 z Hz.
apply ordsuccI2.
Qed.

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
Definition SNo_rec_i : set -> set
 := fun z => In_rec_ii G (SNoLev z) z.

Hypothesis Fr: forall z, SNo z ->
   forall g h:set -> set, (forall w :e SNoS_ (SNoLev z), g w = h w)
     -> F z g = F z h.

Theorem SNo_rec_i_eq : forall z, SNo z -> SNo_rec_i z = F z SNo_rec_i.
let z. assume Hz: SNo z.
prove SNo_rec_i z = F z SNo_rec_i.
prove In_rec_ii G (SNoLev z) z = F z (fun z => In_rec_ii G (SNoLev z) z).
claim L1: forall alpha, forall g h:set -> set -> set, (forall x :e alpha, g x = h x) -> G alpha g = G alpha h.
{ let alpha g h.
  assume Hgh: forall x :e alpha, g x = h x.
  prove G alpha g = G alpha h.
  prove (If_ii (ordinal alpha) (fun z:set => if z :e SNoS_ (ordsucc alpha) then F z (fun w => g (SNoLev w) w) else default) (fun z:set => default))
      = (If_ii (ordinal alpha) (fun z:set => if z :e SNoS_ (ordsucc alpha) then F z (fun w => h (SNoLev w) w) else default) (fun z:set => default)).
  apply xm (ordinal alpha).
  - assume H1: ordinal alpha.
    rewrite If_ii_1 (ordinal alpha) (fun z => if z :e SNoS_ (ordsucc alpha) then F z (fun w => h (SNoLev w) w) else default) (fun z:set => default) H1.
    rewrite If_ii_1 (ordinal alpha) (fun z => if z :e SNoS_ (ordsucc alpha) then F z (fun w => g (SNoLev w) w) else default) (fun z:set => default) H1.
    prove (fun z:set => if z :e SNoS_ (ordsucc alpha) then F z (fun w => g (SNoLev w) w) else default)
        = (fun z:set => if z :e SNoS_ (ordsucc alpha) then F z (fun w => h (SNoLev w) w) else default).
    apply func_ext set set.
    let z.
    prove (if z :e SNoS_ (ordsucc alpha) then F z (fun w => g (SNoLev w) w) else default)
        = (if z :e SNoS_ (ordsucc alpha) then F z (fun w => h (SNoLev w) w) else default).
    apply xm (z :e SNoS_ (ordsucc alpha)).
    + assume Hz: z :e SNoS_ (ordsucc alpha).
      rewrite If_i_1 (z :e SNoS_ (ordsucc alpha)) (F z (fun w => g (SNoLev w) w)) default Hz.
      rewrite If_i_1 (z :e SNoS_ (ordsucc alpha)) (F z (fun w => h (SNoLev w) w)) default Hz.
      prove F z (fun w => g (SNoLev w) w) = F z (fun w => h (SNoLev w) w).
      claim Lsa: ordinal (ordsucc alpha).
      { exact ordinal_ordsucc alpha H1. }
      apply SNoS_E2 (ordsucc alpha) Lsa z Hz.
      assume Hz1: SNoLev z :e ordsucc alpha.
      assume Hz2: ordinal (SNoLev z).
      assume Hz3: SNo z.
      assume Hz4: SNo_ (SNoLev z) z.
      prove F z (fun w => g (SNoLev w) w)
          = F z (fun w => h (SNoLev w) w).
      apply Fr.
      * prove SNo z. exact Hz3.
      * prove forall w :e SNoS_ (SNoLev z), g (SNoLev w) w = h (SNoLev w) w.
        let w. assume Hw: w :e SNoS_ (SNoLev z).
        apply SNoS_E2 (SNoLev z) Hz2 w Hw.
        assume Hw1: SNoLev w :e SNoLev z.
        assume Hw2: ordinal (SNoLev w).
        assume Hw3: SNo w.
        assume Hw4: SNo_ (SNoLev w) w.
        claim LLw: SNoLev w :e alpha.
        { apply ordsuccE alpha (SNoLev z) Hz1.
          - assume H2: SNoLev z :e alpha.
            apply H1. assume Ha1 _. exact Ha1 (SNoLev z) H2 (SNoLev w) Hw1.
          - assume H2: SNoLev z = alpha.
            rewrite <- H2. exact Hw1.
        }
        rewrite Hgh (SNoLev w) LLw.
        reflexivity.
    + assume Hz: z /:e SNoS_ (ordsucc alpha).
      rewrite If_i_0 (z :e SNoS_ (ordsucc alpha)) (F z (fun w => h (SNoLev w) w)) default Hz.
      exact If_i_0 (z :e SNoS_ (ordsucc alpha)) (F z (fun w => g (SNoLev w) w)) default Hz.
  - assume H1: ~ordinal alpha.
    rewrite If_ii_0 (ordinal alpha) (fun z => if z :e SNoS_ (ordsucc alpha) then F z (fun w => h (SNoLev w) w) else default) (fun z:set => default) H1.
    exact If_ii_0 (ordinal alpha) (fun z => if z :e SNoS_ (ordsucc alpha) then F z (fun w => g (SNoLev w) w) else default) (fun z:set => default) H1.
}
rewrite In_rec_ii_eq G L1.
prove G (SNoLev z) (In_rec_ii G) z = F z (fun z => In_rec_ii G (SNoLev z) z).
prove (If_ii (ordinal (SNoLev z)) (fun u:set => if u :e SNoS_ (ordsucc (SNoLev z)) then F u (fun w:set => In_rec_ii G (SNoLev w) w) else default) (fun _:set => default)) z = F z (fun z => In_rec_ii G (SNoLev z) z).
claim L2: ordinal (SNoLev z).
{ exact SNoLev_ordinal z Hz. }
rewrite If_ii_1 (ordinal (SNoLev z))
                (fun u:set => if u :e SNoS_ (ordsucc (SNoLev z)) then F u (fun w:set => In_rec_ii G (SNoLev w) w) else default)
                        (fun _:set => default)
                        L2.
prove (if z :e SNoS_ (ordsucc (SNoLev z)) then F z (fun w:set => In_rec_ii G (SNoLev w) w) else default) = F z (fun z => In_rec_ii G (SNoLev z) z).
claim L3: z :e SNoS_ (ordsucc (SNoLev z)).
{ exact SNoS_SNoLev z Hz. }
exact If_i_1 (z :e SNoS_ (ordsucc (SNoLev z))) (F z (fun w:set => In_rec_ii G (SNoLev w) w)) default L3.
Qed.

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
Definition SNo_rec_ii : set -> (set -> set)
 := fun z => In_rec_iii G (SNoLev z) z.

Hypothesis Fr: forall z, SNo z ->
   forall g h:set -> (set -> set), (forall w :e SNoS_ (SNoLev z), g w = h w)
     -> F z g = F z h.

Theorem SNo_rec_ii_eq : forall z, SNo z -> SNo_rec_ii z = F z SNo_rec_ii.
let z. assume Hz: SNo z.
prove SNo_rec_ii z = F z SNo_rec_ii.
prove In_rec_iii G (SNoLev z) z = F z (fun z => In_rec_iii G (SNoLev z) z).
claim L1: forall alpha, forall g h:set -> set -> (set -> set), (forall x :e alpha, g x = h x) -> G alpha g = G alpha h.
{ let alpha g h.
  assume Hgh: forall x :e alpha, g x = h x.
  prove G alpha g = G alpha h.
  prove (If_iii (ordinal alpha) (fun z:set => If_ii (z :e SNoS_ (ordsucc alpha)) (F z (fun w => g (SNoLev w) w)) default) (fun z:set => default))
      = (If_iii (ordinal alpha) (fun z:set => If_ii (z :e SNoS_ (ordsucc alpha)) (F z (fun w => h (SNoLev w) w)) default) (fun z:set => default)).
  apply xm (ordinal alpha).
  - assume H1: ordinal alpha.
    rewrite If_iii_1 (ordinal alpha) (fun z => If_ii (z :e SNoS_ (ordsucc alpha)) (F z (fun w => h (SNoLev w) w)) default) (fun z:set => default) H1.
    rewrite If_iii_1 (ordinal alpha) (fun z => If_ii (z :e SNoS_ (ordsucc alpha)) (F z (fun w => g (SNoLev w) w)) default) (fun z:set => default) H1.
    prove (fun z:set => If_ii (z :e SNoS_ (ordsucc alpha)) (F z (fun w => g (SNoLev w) w)) default)
        = (fun z:set => If_ii (z :e SNoS_ (ordsucc alpha)) (F z (fun w => h (SNoLev w) w)) default).
    apply func_ext set (set -> set).
    let z.
    prove (If_ii (z :e SNoS_ (ordsucc alpha)) (F z (fun w => g (SNoLev w) w)) default)
        = (If_ii (z :e SNoS_ (ordsucc alpha)) (F z (fun w => h (SNoLev w) w)) default).
    apply xm (z :e SNoS_ (ordsucc alpha)).
    + assume Hz: z :e SNoS_ (ordsucc alpha).
      rewrite If_ii_1 (z :e SNoS_ (ordsucc alpha)) (F z (fun w => g (SNoLev w) w)) default Hz.
      rewrite If_ii_1 (z :e SNoS_ (ordsucc alpha)) (F z (fun w => h (SNoLev w) w)) default Hz.
      prove F z (fun w => g (SNoLev w) w) = F z (fun w => h (SNoLev w) w).
      claim Lsa: ordinal (ordsucc alpha).
      { exact ordinal_ordsucc alpha H1. }
      apply SNoS_E2 (ordsucc alpha) Lsa z Hz.
      assume Hz1: SNoLev z :e ordsucc alpha.
      assume Hz2: ordinal (SNoLev z).
      assume Hz3: SNo z.
      assume Hz4: SNo_ (SNoLev z) z.
      prove F z (fun w => g (SNoLev w) w)
          = F z (fun w => h (SNoLev w) w).
      apply Fr.
      * prove SNo z. exact Hz3.
      * prove forall w :e SNoS_ (SNoLev z), g (SNoLev w) w = h (SNoLev w) w.
        let w. assume Hw: w :e SNoS_ (SNoLev z).
        apply SNoS_E2 (SNoLev z) Hz2 w Hw.
        assume Hw1: SNoLev w :e SNoLev z.
        assume Hw2: ordinal (SNoLev w).
        assume Hw3: SNo w.
        assume Hw4: SNo_ (SNoLev w) w.
        claim LLw: SNoLev w :e alpha.
        { apply ordsuccE alpha (SNoLev z) Hz1.
          - assume H2: SNoLev z :e alpha.
            apply H1. assume Ha1 _. exact Ha1 (SNoLev z) H2 (SNoLev w) Hw1.
          - assume H2: SNoLev z = alpha.
            rewrite <- H2. exact Hw1.
        }
        rewrite Hgh (SNoLev w) LLw.
        reflexivity.
    + assume Hz: z /:e SNoS_ (ordsucc alpha).
      rewrite If_ii_0 (z :e SNoS_ (ordsucc alpha)) (F z (fun w => h (SNoLev w) w)) default Hz.
      exact If_ii_0 (z :e SNoS_ (ordsucc alpha)) (F z (fun w => g (SNoLev w) w)) default Hz.
  - assume H1: ~ordinal alpha.
    rewrite If_iii_0 (ordinal alpha) (fun z => If_ii (z :e SNoS_ (ordsucc alpha)) (F z (fun w => h (SNoLev w) w)) default) (fun z:set => default) H1.
    exact If_iii_0 (ordinal alpha) (fun z => If_ii (z :e SNoS_ (ordsucc alpha)) (F z (fun w => g (SNoLev w) w)) default) (fun z:set => default) H1.
}
rewrite In_rec_iii_eq G L1.
prove G (SNoLev z) (In_rec_iii G) z = F z (fun z => In_rec_iii G (SNoLev z) z).
prove (If_iii (ordinal (SNoLev z)) (fun u:set => If_ii (u :e SNoS_ (ordsucc (SNoLev z))) (F u (fun w:set => In_rec_iii G (SNoLev w) w)) default) (fun _:set => default)) z = F z (fun z => In_rec_iii G (SNoLev z) z).
claim L2: ordinal (SNoLev z).
{ exact SNoLev_ordinal z Hz. }
rewrite If_iii_1 (ordinal (SNoLev z))
                        (fun u:set => If_ii (u :e SNoS_ (ordsucc (SNoLev z))) (F u (fun w:set => In_rec_iii G (SNoLev w) w)) default)
                        (fun _:set => default)
                        L2.
prove (If_ii (z :e SNoS_ (ordsucc (SNoLev z))) (F z (fun w:set => In_rec_iii G (SNoLev w) w)) default) = F z (fun z => In_rec_iii G (SNoLev z) z).
claim L3: z :e SNoS_ (ordsucc (SNoLev z)).
{ exact SNoS_SNoLev z Hz. }
exact If_ii_1 (z :e SNoS_ (ordsucc (SNoLev z))) (F z (fun w:set => In_rec_iii G (SNoLev w) w)) default L3.
Qed.

End SurrealRecII.

Section SurrealRec2.

Variable F:set -> set -> (set -> set -> set) -> set.

Let G:set -> (set -> set -> set) -> set -> (set -> set) -> set
  := fun w f z g => F w z (fun x y => if x = w then g y else f x y).

Let H:set -> (set -> set -> set) -> set -> set
  := fun w f z => if SNo z then SNo_rec_i (G w f) z else Empty.

(* Parameter SNo_rec2 "9c6267051fa817eed39b404ea37e7913b3571fe071763da2ebc1baa56b4b77f5" "7d10ab58310ebefb7f8bf63883310aa10fc2535f53bb48db513a868bc02ec028" *)
Definition SNo_rec2 : set -> set -> set
  := SNo_rec_ii H.

Hypothesis Fr: forall w, SNo w -> forall z, SNo z ->
   forall g h:set -> set -> set,
        (forall x :e SNoS_ (SNoLev w), forall y, SNo y -> g x y = h x y)
     -> (forall y :e SNoS_ (SNoLev z), g w y = h w y)
     -> F w z g = F w z h.

Theorem SNo_rec2_G_prop : forall w, SNo w -> forall f k:set -> set -> set,
    (forall x :e SNoS_ (SNoLev w), f x = k x)
 -> forall z, SNo z ->
    forall g h:set -> set, (forall u :e SNoS_ (SNoLev z), g u = h u)
 -> G w f z g = G w k z h.
let w. assume Hw: SNo w.
let f k.
assume Hfk: forall x :e SNoS_ (SNoLev w), f x = k x.
let z. assume Hz: SNo z.
let g h.
assume Hgh: forall u :e SNoS_ (SNoLev z), g u = h u.
prove G w f z g = G w k z h.
prove F w z (fun x y => if x = w then g y else f x y)
    = F w z (fun x y => if x = w then h y else k x y).
apply Fr.
- prove SNo w. exact Hw.
- prove SNo z. exact Hz.
- let x. assume Hx: x :e SNoS_ (SNoLev w).
  let y. assume Hy: SNo y.
  prove (if x = w then g y else f x y)
      = (if x = w then h y else k x y).
  claim Lxw: x <> w.
  { exact SNoS_In_neq w Hw x Hx. }
  rewrite If_i_0 (x = w) (g y) (f x y) Lxw.
  rewrite If_i_0 (x = w) (h y) (k x y) Lxw.
  prove f x y = k x y.
  rewrite Hfk x Hx.
  reflexivity.
- let y. assume Hy: y :e SNoS_ (SNoLev z).
  prove (if w = w then g y else f w y)
      = (if w = w then h y else k w y).
  rewrite If_i_1 (w = w) (g y) (f w y) (fun q H => H).
  rewrite If_i_1 (w = w) (h y) (k w y) (fun q H => H).
  prove g y = h y.
  exact Hgh y Hy.
Qed.

Theorem SNo_rec2_eq_1 : forall w, SNo w -> forall f:set -> set -> set,
  forall z, SNo z ->
   SNo_rec_i (G w f) z = G w f z (SNo_rec_i (G w f)).
let w. assume Hw: SNo w.
let f.
claim L1: forall z, SNo z -> forall g h:set -> set, (forall u :e SNoS_ (SNoLev z), g u = h u) -> G w f z g = G w f z h.
{ let z. assume Hz. let g h. assume Hgh.
  claim L1a: forall x :e SNoS_ (SNoLev w), f x = f x.
  { let x. assume Hx. reflexivity. }
  exact SNo_rec2_G_prop w Hw f f L1a z Hz g h Hgh.
}
exact SNo_rec_i_eq (G w f) L1.
Qed.

Theorem SNo_rec2_eq : forall w, SNo w -> forall z, SNo z ->
   SNo_rec2 w z = F w z SNo_rec2.
let w. assume Hw: SNo w.
let z. assume Hz: SNo z.
prove SNo_rec2 w z = F w z SNo_rec2.
prove SNo_rec_ii H w z = F w z SNo_rec2.
claim L1: forall w, SNo w ->
    forall g h:set -> set -> set, (forall x :e SNoS_ (SNoLev w), g x = h x)
     -> H w g = H w h.
{ let w. assume Hw: SNo w.
  let g h.
  assume Hgh: forall x :e SNoS_ (SNoLev w), g x = h x.
  prove H w g = H w h.
  prove (fun z:set => if SNo z then SNo_rec_i (G w g) z else Empty)
      = (fun z:set => if SNo z then SNo_rec_i (G w h) z else Empty).
  apply func_ext set set.
  let z.
  prove (if SNo z then SNo_rec_i (G w g) z else Empty)
      = (if SNo z then SNo_rec_i (G w h) z else Empty).
  apply xm (SNo z).
  - assume Hz: SNo z.
    rewrite If_i_1 (SNo z) (SNo_rec_i (G w g) z) Empty Hz.
    rewrite If_i_1 (SNo z) (SNo_rec_i (G w h) z) Empty Hz.
    prove SNo_rec_i (G w g) z = SNo_rec_i (G w h) z.
    claim L1a: forall alpha, ordinal alpha -> forall z :e SNoS_ alpha, SNo_rec_i (G w g) z = SNo_rec_i (G w h) z.
    { apply ordinal_ind.
      let alpha. assume Ha: ordinal alpha.
      assume IH: forall beta :e alpha, forall z :e SNoS_ beta, SNo_rec_i (G w g) z = SNo_rec_i (G w h) z.
      let z. assume Hz: z :e SNoS_ alpha.
      apply SNoS_E2 alpha Ha z Hz.
      assume Hz1: SNoLev z :e alpha.
      assume Hz2: ordinal (SNoLev z).
      assume Hz3: SNo z.
      assume Hz4: SNo_ (SNoLev z) z.
      prove SNo_rec_i (G w g) z = SNo_rec_i (G w h) z.
      rewrite SNo_rec2_eq_1 w Hw g z Hz3.
      rewrite SNo_rec2_eq_1 w Hw h z Hz3.
      prove G w g z (SNo_rec_i (G w g)) = G w h z (SNo_rec_i (G w h)).
      apply SNo_rec2_G_prop w Hw g h Hgh z Hz3 (SNo_rec_i (G w g)) (SNo_rec_i (G w h)).
      prove forall y :e SNoS_ (SNoLev z), SNo_rec_i (G w g) y = SNo_rec_i (G w h) y.
      let y.
      assume Hy : y :e SNoS_ (SNoLev z).
      exact IH (SNoLev z) Hz1 y Hy.
    }
    exact L1a (ordsucc (SNoLev z)) (ordinal_ordsucc (SNoLev z) (SNoLev_ordinal z Hz))
              z (SNoS_SNoLev z Hz).
  - assume Hz: ~SNo z.
    rewrite If_i_0 (SNo z) (SNo_rec_i (G w h) z) Empty Hz.
    exact If_i_0 (SNo z) (SNo_rec_i (G w g) z) Empty Hz.
}
claim L2: H w (SNo_rec_ii H) z = F w z SNo_rec2.
{ prove (if SNo z then SNo_rec_i (G w (SNo_rec_ii H)) z else Empty) = F w z SNo_rec2.
  rewrite If_i_1 (SNo z) (SNo_rec_i (G w (SNo_rec_ii H)) z) Empty Hz.
  prove SNo_rec_i (G w (SNo_rec_ii H)) z = F w z SNo_rec2.
  prove SNo_rec_i (G w (SNo_rec_ii H)) z = F w z (SNo_rec_ii H).
  rewrite SNo_rec2_eq_1 w Hw (SNo_rec_ii H) z Hz.
  prove G w (SNo_rec_ii H) z (SNo_rec_i (G w (SNo_rec_ii H))) = F w z (SNo_rec_ii H).
  prove F w z (fun x y => if x = w then SNo_rec_i (G w (SNo_rec_ii H)) y else SNo_rec_ii H x y) = F w z (SNo_rec_ii H).
  claim L2a: forall x :e SNoS_ (SNoLev w), forall y, SNo y -> (if x = w then SNo_rec_i (G w (SNo_rec_ii H)) y else SNo_rec_ii H x y) = SNo_rec_ii H x y.
  { let x. assume Hx: x :e SNoS_ (SNoLev w).
    let y. assume Hy: SNo y.
    claim Lxw: x <> w.
    { exact SNoS_In_neq w Hw x Hx. }
    exact If_i_0 (x = w) (SNo_rec_i (G w (SNo_rec_ii H)) y) (SNo_rec_ii H x y) Lxw.
  }
  claim L2b: forall y :e SNoS_ (SNoLev z), (if w = w then SNo_rec_i (G w (SNo_rec_ii H)) y else SNo_rec_ii H w y) = SNo_rec_ii H w y.
  { let y. assume Hy: y :e SNoS_ (SNoLev z).
    rewrite If_i_1 (w = w) (SNo_rec_i (G w (SNo_rec_ii H)) y) (SNo_rec_ii H w y) (fun q H => H).
    claim Ly: SNo y.
    { apply SNoS_E2 (SNoLev z) (SNoLev_ordinal z Hz) y Hy.
      assume Hy1: SNoLev y :e SNoLev z.
      assume Hy2: ordinal (SNoLev y).
      assume Hy3: SNo y.
      assume Hy4: SNo_ (SNoLev y) y.
      exact Hy3.
    }
    prove SNo_rec_i (G w (SNo_rec_ii H)) y = SNo_rec_ii H w y.
    apply eq_i_tra (SNo_rec_i (G w (SNo_rec_ii H)) y) (H w (SNo_rec_ii H) y) (SNo_rec_ii H w y).
    - prove SNo_rec_i (G w (SNo_rec_ii H)) y = H w (SNo_rec_ii H) y.
      prove SNo_rec_i (G w (SNo_rec_ii H)) y = if SNo y then (SNo_rec_i (G w (SNo_rec_ii H)) y) else Empty.
      symmetry.
      exact If_i_1 (SNo y) (SNo_rec_i (G w (SNo_rec_ii H)) y) Empty Ly.
    - prove H w (SNo_rec_ii H) y = SNo_rec_ii H w y.
      rewrite SNo_rec_ii_eq H L1 w Hw.
      prove H w (SNo_rec_ii H) y = H w (SNo_rec_ii H) y.
      exact (fun q H => H).
  }
  exact Fr w Hw z Hz (fun x y => if x = w then SNo_rec_i (G w (SNo_rec_ii H)) y else SNo_rec_ii H x y) (SNo_rec_ii H) L2a L2b.
}
prove SNo_rec_ii H w z = F w z SNo_rec2.
rewrite SNo_rec_ii_eq H L1 w Hw.
prove H w (SNo_rec_ii H) z = F w z SNo_rec2.
exact L2.
Qed.

End SurrealRec2.

Theorem SNo_ordinal_ind : forall P:set -> prop,
  (forall alpha, ordinal alpha -> forall x :e SNoS_ alpha, P x)
  ->
  (forall x, SNo x -> P x).
let P.
assume H1.
let x. assume Hx: SNo x.
claim LLx: ordinal (SNoLev x).
{ exact SNoLev_ordinal x Hx. }
claim LsLx: ordinal (ordsucc (SNoLev x)).
{ exact ordinal_ordsucc (SNoLev x) LLx. }
claim LxsLx: x :e SNoS_ (ordsucc (SNoLev x)).
{ exact SNoS_SNoLev x Hx. }
exact H1 (ordsucc (SNoLev x)) LsLx x LxsLx.
Qed.

Theorem SNo_ordinal_ind2 : forall P:set -> set -> prop,
  (forall alpha, ordinal alpha ->
   forall beta, ordinal beta ->
   forall x :e SNoS_ alpha, forall y :e SNoS_ beta, P x y)
  ->
  (forall x y, SNo x -> SNo y -> P x y).
let P.
assume H1.
let x y.
assume Hx: SNo x.
assume Hy: SNo y.
claim LLx: ordinal (SNoLev x).
{ exact SNoLev_ordinal x Hx. }
claim LsLx: ordinal (ordsucc (SNoLev x)).
{ exact ordinal_ordsucc (SNoLev x) LLx. }
claim LxsLx: x :e SNoS_ (ordsucc (SNoLev x)).
{ exact SNoS_SNoLev x Hx. }
claim LLy: ordinal (SNoLev y).
{ exact SNoLev_ordinal y Hy. }
claim LsLy: ordinal (ordsucc (SNoLev y)).
{ exact ordinal_ordsucc (SNoLev y) LLy. }
claim LysLy: y :e SNoS_ (ordsucc (SNoLev y)).
{ exact SNoS_SNoLev y Hy. }
exact H1 (ordsucc (SNoLev x)) LsLx
         (ordsucc (SNoLev y)) LsLy
         x LxsLx y LysLy.
Qed.

Theorem SNo_ordinal_ind3 : forall P:set -> set -> set -> prop,
  (forall alpha, ordinal alpha ->
   forall beta, ordinal beta ->
   forall gamma, ordinal gamma ->
   forall x :e SNoS_ alpha, forall y :e SNoS_ beta, forall z :e SNoS_ gamma, P x y z)
  ->
  (forall x y z, SNo x -> SNo y -> SNo z -> P x y z).
let P.
assume H1.
let x y z.
assume Hx: SNo x.
assume Hy: SNo y.
assume Hz: SNo z.
claim LLx: ordinal (SNoLev x).
{ exact SNoLev_ordinal x Hx. }
claim LsLx: ordinal (ordsucc (SNoLev x)).
{ exact ordinal_ordsucc (SNoLev x) LLx. }
claim LxsLx: x :e SNoS_ (ordsucc (SNoLev x)).
{ exact SNoS_SNoLev x Hx. }
claim LLy: ordinal (SNoLev y).
{ exact SNoLev_ordinal y Hy. }
claim LsLy: ordinal (ordsucc (SNoLev y)).
{ exact ordinal_ordsucc (SNoLev y) LLy. }
claim LysLy: y :e SNoS_ (ordsucc (SNoLev y)).
{ exact SNoS_SNoLev y Hy. }
claim LLz: ordinal (SNoLev z).
{ exact SNoLev_ordinal z Hz. }
claim LsLz: ordinal (ordsucc (SNoLev z)).
{ exact ordinal_ordsucc (SNoLev z) LLz. }
claim LzsLz: z :e SNoS_ (ordsucc (SNoLev z)).
{ exact SNoS_SNoLev z Hz. }
exact H1 (ordsucc (SNoLev x)) LsLx
         (ordsucc (SNoLev y)) LsLy
         (ordsucc (SNoLev z)) LsLz
         x LxsLx y LysLy z LzsLz.
Qed.

Theorem SNoLev_ind : forall P:set -> prop,
  (forall x, SNo x -> (forall w :e SNoS_ (SNoLev x), P w) -> P x)
  ->
  (forall x, SNo x -> P x).
let P.
assume H1: forall x, SNo x -> (forall w :e SNoS_ (SNoLev x), P w) -> P x.
claim L1: forall alpha, ordinal alpha -> forall x :e SNoS_ alpha, P x.
{ apply ordinal_ind.
  let alpha. assume Ha: ordinal alpha.
  assume IH: forall beta :e alpha, forall x :e SNoS_ beta, P x.
  let x. assume Hx: x :e SNoS_ alpha.
  apply SNoS_E2 alpha Ha x Hx.
  assume Hx1: SNoLev x :e alpha.
  assume Hx2: ordinal (SNoLev x).
  assume Hx3: SNo x.
  assume Hx4: SNo_ (SNoLev x) x.
  apply H1 x Hx3.
  prove forall w :e SNoS_ (SNoLev x), P w.
  exact IH (SNoLev x) Hx1.
}
exact SNo_ordinal_ind P L1.
Qed.

Theorem SNoLev_ind2 : forall P:set -> set -> prop,
  (forall x y, SNo x -> SNo y
    -> (forall w :e SNoS_ (SNoLev x), P w y)
    -> (forall z :e SNoS_ (SNoLev y), P x z)
    -> (forall w :e SNoS_ (SNoLev x), forall z :e SNoS_ (SNoLev y), P w z)
    -> P x y)
-> forall x y, SNo x -> SNo y -> P x y.
let P.
assume H1: forall x y, SNo x -> SNo y
    -> (forall w :e SNoS_ (SNoLev x), P w y)
    -> (forall z :e SNoS_ (SNoLev y), P x z)
    -> (forall w :e SNoS_ (SNoLev x), forall z :e SNoS_ (SNoLev y), P w z)
    -> P x y.
claim L1: forall alpha, ordinal alpha -> forall beta, ordinal beta -> forall x :e SNoS_ alpha, forall y :e SNoS_ beta, P x y.
{ apply ordinal_ind.
  let alpha. assume Ha: ordinal alpha.
  assume IHa: forall gamma :e alpha, forall beta, ordinal beta -> forall x :e SNoS_ gamma, forall y :e SNoS_ beta, P x y.
  apply ordinal_ind.
  let beta. assume Hb: ordinal beta.
  assume IHb: forall delta :e beta, forall x :e SNoS_ alpha, forall y :e SNoS_ delta, P x y.
  let x. assume Hx: x :e SNoS_ alpha.
  let y. assume Hy: y :e SNoS_ beta.
  apply SNoS_E2 alpha Ha x Hx.
  assume Hx1: SNoLev x :e alpha.
  assume Hx2: ordinal (SNoLev x).
  assume Hx3: SNo x.
  assume Hx4: SNo_ (SNoLev x) x.
  apply SNoS_E2 beta Hb y Hy.
  assume Hy1: SNoLev y :e beta.
  assume Hy2: ordinal (SNoLev y).
  assume Hy3: SNo y.
  assume Hy4: SNo_ (SNoLev y) y.
  apply H1 x y Hx3 Hy3.
  - prove forall w :e SNoS_ (SNoLev x), P w y.
    let w. assume Hw: w :e SNoS_ (SNoLev x).
    exact IHa (SNoLev x) Hx1 beta Hb w Hw y Hy.
  - prove forall z :e SNoS_ (SNoLev y), P x z.
    exact IHb (SNoLev y) Hy1 x Hx.
  - prove forall w :e SNoS_ (SNoLev x), forall z :e SNoS_ (SNoLev y), P w z.
    let w. assume Hw: w :e SNoS_ (SNoLev x).
    let z. assume Hz: z :e SNoS_ (SNoLev y).
    exact IHa (SNoLev x) Hx1 (SNoLev y) Hy2 w Hw z Hz.
}
exact SNo_ordinal_ind2 P L1.
Qed.

Theorem SNoLev_ind3 : forall P:set -> set -> set -> prop,
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
let P.
assume H1: forall x y z, SNo x -> SNo y -> SNo z
    -> (forall u :e SNoS_ (SNoLev x), P u y z)
    -> (forall v :e SNoS_ (SNoLev y), P x v z)
    -> (forall w :e SNoS_ (SNoLev z), P x y w)
    -> (forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), P u v z)
    -> (forall u :e SNoS_ (SNoLev x), forall w :e SNoS_ (SNoLev z), P u y w)
    -> (forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), P x v w)
    -> (forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), P u v w)
    -> P x y z.
claim L1: forall alpha, ordinal alpha -> forall beta, ordinal beta -> forall gamma, ordinal gamma -> forall x :e SNoS_ alpha, forall y :e SNoS_ beta, forall z :e SNoS_ gamma, P x y z.
{ apply ordinal_ind.
  let alpha. assume Ha: ordinal alpha.
  assume IHa: forall delta :e alpha, forall beta, ordinal beta -> forall gamma, ordinal gamma -> forall x :e SNoS_ delta, forall y :e SNoS_ beta, forall z :e SNoS_ gamma, P x y z.
  apply ordinal_ind.
  let beta. assume Hb: ordinal beta.
  assume IHb: forall delta :e beta, forall gamma, ordinal gamma -> forall x :e SNoS_ alpha, forall y :e SNoS_ delta, forall z :e SNoS_ gamma, P x y z.
  apply ordinal_ind.
  let gamma. assume Hc: ordinal gamma.
  assume IHc: forall delta :e gamma, forall x :e SNoS_ alpha, forall y :e SNoS_ beta, forall z :e SNoS_ delta, P x y z.
  let x. assume Hx: x :e SNoS_ alpha.
  let y. assume Hy: y :e SNoS_ beta.
  let z. assume Hz: z :e SNoS_ gamma.
  apply SNoS_E2 alpha Ha x Hx.
  assume Hx1: SNoLev x :e alpha.
  assume Hx2: ordinal (SNoLev x).
  assume Hx3: SNo x.
  assume Hx4: SNo_ (SNoLev x) x.
  apply SNoS_E2 beta Hb y Hy.
  assume Hy1: SNoLev y :e beta.
  assume Hy2: ordinal (SNoLev y).
  assume Hy3: SNo y.
  assume Hy4: SNo_ (SNoLev y) y.
  apply SNoS_E2 gamma Hc z Hz.
  assume Hz1: SNoLev z :e gamma.
  assume Hz2: ordinal (SNoLev z).
  assume Hz3: SNo z.
  assume Hz4: SNo_ (SNoLev z) z.
  apply H1 x y z Hx3 Hy3 Hz3.
  - prove forall u :e SNoS_ (SNoLev x), P u y z.
    let u. assume Hu: u :e SNoS_ (SNoLev x).
    exact IHa (SNoLev x) Hx1 beta Hb gamma Hc u Hu y Hy z Hz.
  - prove forall v :e SNoS_ (SNoLev y), P x v z.
    let v. assume Hv: v :e SNoS_ (SNoLev y).
    exact IHb (SNoLev y) Hy1 gamma Hc x Hx v Hv z Hz.
  - prove forall w :e SNoS_ (SNoLev z), P x y w.
    exact IHc (SNoLev z) Hz1 x Hx y Hy.
  - prove forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), P u v z.
    let u. assume Hu: u :e SNoS_ (SNoLev x).
    let v. assume Hv: v :e SNoS_ (SNoLev y).
    exact IHa (SNoLev x) Hx1 (SNoLev y) Hy2 gamma Hc u Hu v Hv z Hz.
  - prove forall u :e SNoS_ (SNoLev x), forall w :e SNoS_ (SNoLev z), P u y w.
    let u. assume Hu: u :e SNoS_ (SNoLev x).
    let w. assume Hw: w :e SNoS_ (SNoLev z).
    exact IHa (SNoLev x) Hx1 beta Hb (SNoLev z) Hz2 u Hu y Hy w Hw.
  - prove forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), P x v w.
    let v. assume Hv: v :e SNoS_ (SNoLev y).
    let w. assume Hw: w :e SNoS_ (SNoLev z).
    exact IHb (SNoLev y) Hy1 (SNoLev z) Hz2 x Hx v Hv w Hw.
  - prove forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), P u v w.
    let u. assume Hu: u :e SNoS_ (SNoLev x).
    let v. assume Hv: v :e SNoS_ (SNoLev y).
    let w. assume Hw: w :e SNoS_ (SNoLev z).
    exact IHa (SNoLev x) Hx1 (SNoLev y) Hy2 (SNoLev z) Hz2 u Hu v Hv w Hw.
}
exact SNo_ordinal_ind3 P L1.
Qed.

Theorem SNo_omega : SNo omega.
exact ordinal_SNo omega omega_ordinal.
Qed.

Theorem SNoLt_0_1 : 0 < 1.
apply ordinal_In_SNoLt 1 ordinal_1 0.
prove 0 :e 1.
exact In_0_1.
Qed.

Theorem SNoLt_0_2 : 0 < 2.
apply ordinal_In_SNoLt 2 ordinal_2 0.
prove 0 :e 2.
exact In_0_2.
Qed.

Theorem SNoLt_1_2 : 1 < 2.
apply ordinal_In_SNoLt 2 ordinal_2 1.
prove 1 :e 2.
exact In_1_2.
Qed.

Theorem restr_SNo_ : forall x, SNo x -> forall alpha :e SNoLev x, SNo_ alpha (x :/\: SNoElts_ alpha).
let x. assume Hx. let alpha. assume Ha.
claim Lx1: SNo_ (SNoLev x) x.
{ exact SNoLev_ x Hx. }
apply Lx1.
assume Hx1: x c= SNoElts_ (SNoLev x).
assume Hx2: forall beta :e SNoLev x, exactly1of2 (SetAdjoin beta {1} :e x) (beta :e x).
prove x :/\: SNoElts_ alpha c= SNoElts_ alpha
   /\ forall beta :e alpha, exactly1of2 (SetAdjoin beta {1} :e x :/\: SNoElts_ alpha) (beta :e x :/\: SNoElts_ alpha).
apply andI.
- exact binintersect_Subq_2 x (SNoElts_ alpha).
- let beta. assume Hb: beta :e alpha.
  claim Lb: beta :e SNoLev x.
  { exact ordinal_TransSet (SNoLev x) (SNoLev_ordinal x Hx) alpha Ha beta Hb. }
  apply exactly1of2_E (SetAdjoin beta {1} :e x) (beta :e x) (Hx2 beta Lb).
  + assume H1: SetAdjoin beta {1} :e x.
    assume H2: beta /:e x.
    apply exactly1of2_I1.
    * { apply binintersectI.
        - exact H1.
        - prove SetAdjoin beta {1} :e SNoElts_ alpha.
          prove SetAdjoin beta {1} :e alpha :\/: {SetAdjoin beta {1}|beta :e alpha}.
          apply binunionI2.
          exact ReplI alpha (fun beta => SetAdjoin beta {1}) beta Hb.
      }
    * prove beta /:e x :/\: SNoElts_ alpha.
      assume H3. exact H2 (binintersectE1 x (SNoElts_ alpha) beta H3).
  + assume H1: SetAdjoin beta {1} /:e x.
    assume H2: beta :e x.
    apply exactly1of2_I2.
    * assume H3: SetAdjoin beta {1} :e x :/\: SNoElts_ alpha.
      exact H1 (binintersectE1 x (SNoElts_ alpha) (SetAdjoin beta {1}) H3).
    * { apply binintersectI.
        - exact H2.
        - prove beta :e SNoElts_ alpha.
          prove beta :e alpha :\/: {SetAdjoin beta {1}|beta :e alpha}.
          apply binunionI1. exact Hb.
      }
Qed.

Theorem restr_SNo : forall x, SNo x -> forall alpha :e SNoLev x, SNo (x :/\: SNoElts_ alpha).
let x. assume Hx. let alpha. assume Ha.
claim La: ordinal alpha.
{ exact ordinal_Hered (SNoLev x) (SNoLev_ordinal x Hx) alpha Ha. }
claim L1: SNo_ alpha (x :/\: SNoElts_ alpha).
{ exact restr_SNo_ x Hx alpha Ha. }
exact SNo_SNo alpha La (x :/\: SNoElts_ alpha) L1.
Qed.

Theorem restr_SNoLev : forall x, SNo x -> forall alpha :e SNoLev x, SNoLev (x :/\: SNoElts_ alpha) = alpha.
let x. assume Hx. let alpha. assume Ha.
claim La: ordinal alpha.
{ exact ordinal_Hered (SNoLev x) (SNoLev_ordinal x Hx) alpha Ha. }
claim L1: SNo_ alpha (x :/\: SNoElts_ alpha).
{ exact restr_SNo_ x Hx alpha Ha. }
exact SNoLev_uniq2 alpha La (x :/\: SNoElts_ alpha) L1.
Qed.

Theorem restr_SNoEq : forall x, SNo x -> forall alpha :e SNoLev x, SNoEq_ alpha (x :/\: SNoElts_ alpha) x.
let x. assume Hx.
let alpha. assume Ha.
apply SNoEq_I.
let beta. assume Hb: beta :e alpha.
prove beta :e x :/\: SNoElts_ alpha <-> beta :e x.
apply iffI.
- assume H1: beta :e x :/\: SNoElts_ alpha.
  exact binintersectE1 x (SNoElts_ alpha) beta H1.
- assume H1: beta :e x.
  apply binintersectI.
  + exact H1.
  + prove beta :e alpha :\/: {SetAdjoin beta {1}|beta :e alpha}.
    apply binunionI1. exact Hb.
Qed.

Theorem SNo_extend0_restr_eq : forall x, SNo x -> x = SNo_extend0 x :/\: SNoElts_ (SNoLev x).
let x. assume Hx.
claim L1: SNo (SNo_extend0 x).
{ exact SNo_extend0_SNo x Hx. }
claim L2: SNoLev x :e SNoLev (SNo_extend0 x).
{ rewrite SNo_extend0_SNoLev x Hx. apply ordsuccI2. }
apply SNo_eq.
- exact Hx.
- apply restr_SNo.
  + exact L1.
  + exact L2.
- prove SNoLev x = SNoLev (SNo_extend0 x :/\: SNoElts_ (SNoLev x)).
  symmetry.
  apply restr_SNoLev.
  + exact L1.
  + exact L2.
- prove SNoEq_ (SNoLev x) x (SNo_extend0 x :/\: SNoElts_ (SNoLev x)).
  apply SNoEq_sym_.
  apply SNoEq_tra_ (SNoLev x) (SNo_extend0 x :/\: SNoElts_ (SNoLev x)) (SNo_extend0 x) x.
  + prove SNoEq_ (SNoLev x) (SNo_extend0 x :/\: SNoElts_ (SNoLev x)) (SNo_extend0 x).
    exact restr_SNoEq (SNo_extend0 x) L1 (SNoLev x) L2.
  + prove SNoEq_ (SNoLev x) (SNo_extend0 x) x.
    exact SNo_extend0_SNoEq x Hx.
Qed.

Theorem SNo_extend1_restr_eq : forall x, SNo x -> x = SNo_extend1 x :/\: SNoElts_ (SNoLev x).
let x. assume Hx.
claim L1: SNo (SNo_extend1 x).
{ exact SNo_extend1_SNo x Hx. }
claim L2: SNoLev x :e SNoLev (SNo_extend1 x).
{ rewrite SNo_extend1_SNoLev x Hx. apply ordsuccI2. }
apply SNo_eq.
- exact Hx.
- apply restr_SNo.
  + exact L1.
  + exact L2.
- prove SNoLev x = SNoLev (SNo_extend1 x :/\: SNoElts_ (SNoLev x)).
  symmetry.
  apply restr_SNoLev.
  + exact L1.
  + exact L2.
- prove SNoEq_ (SNoLev x) x (SNo_extend1 x :/\: SNoElts_ (SNoLev x)).
  apply SNoEq_sym_.
  apply SNoEq_tra_ (SNoLev x) (SNo_extend1 x :/\: SNoElts_ (SNoLev x)) (SNo_extend1 x) x.
  + prove SNoEq_ (SNoLev x) (SNo_extend1 x :/\: SNoElts_ (SNoLev x)) (SNo_extend1 x).
    exact restr_SNoEq (SNo_extend1 x) L1 (SNoLev x) L2.
  + prove SNoEq_ (SNoLev x) (SNo_extend1 x) x.
    exact SNo_extend1_SNoEq x Hx.
Qed.

