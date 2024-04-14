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

Axiom add_SNo_minus_Lt12b3: forall x y z w u v,
    SNo x -> SNo y -> SNo z -> SNo w -> SNo u -> SNo v
 -> x + y + v < w + u + z
 -> x + y + - z < w + u + - v.

Axiom add_SNo_minus_Le12b3: forall x y z w u v,
    SNo x -> SNo y -> SNo z -> SNo w -> SNo u -> SNo v
 -> x + y + v <= w + u + z
 -> x + y + - z <= w + u + - v.

End SurrealAdd.

(** Part 6 **)

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

Theorem mul_SNo_eq : forall x, SNo x -> forall y, SNo y ->
   x * y
      = SNoCut ({(w 0) * y + x * (w 1) + - (w 0) * (w 1)|w :e SNoL x :*: SNoL y}
                  :\/:
                {(z 0) * y + x * (z 1) + - (z 0) * (z 1)|z :e SNoR x :*: SNoR y})
               ({(w 0) * y + x * (w 1) + - (w 0) * (w 1)|w :e SNoL x :*: SNoR y}
                  :\/:
                {(z 0) * y + x * (z 1) + - (z 0) * (z 1)|z :e SNoR x :*: SNoL y}).
set F : set -> set -> (set -> set -> set) -> set
  := fun x y m => 
        SNoCut ({m (w 0) y + m x (w 1) + - m (w 0) (w 1)|w :e SNoL x :*: SNoL y}
                  :\/:
                {m (z 0) y + m x (z 1) + - m (z 0) (z 1)|z :e SNoR x :*: SNoR y})
               ({m (w 0) y + m x (w 1) + - m (w 0) (w 1)|w :e SNoL x :*: SNoR y}
                  :\/:
                {m (z 0) y + m x (z 1) + - m (z 0) (z 1)|z :e SNoR x :*: SNoL y}).
claim L1: forall x, SNo x -> forall y, SNo y ->
  forall g h:set -> set -> set,
      (forall w :e SNoS_ (SNoLev x), forall z, SNo z -> g w z = h w z)
   -> (forall z :e SNoS_ (SNoLev y), g x z = h x z)
   -> F x y g = F x y h.
{ let x. assume Hx: SNo x.
  let y. assume Hy: SNo y.
  let g h.
  assume Hgh1: forall w :e SNoS_ (SNoLev x), forall z, SNo z -> g w z = h w z.
  assume Hgh2: forall z :e SNoS_ (SNoLev y), g x z = h x z.
  prove F x y g = F x y h.
  claim L1a: {g (w 0) y + g x (w 1) + - g (w 0) (w 1)|w :e SNoL x :*: SNoL y}
           = {h (w 0) y + h x (w 1) + - h (w 0) (w 1)|w :e SNoL x :*: SNoL y}.
  { apply ReplEq_setprod_ext (SNoL x) (SNoL y) (fun w0 w1 => g w0 y + g x w1 + - g w0 w1) (fun w0 w1 => h w0 y + h x w1 + - h w0 w1).
    prove forall w0 :e SNoL x, forall w1 :e SNoL y,
              g w0 y + g x w1 + - g w0 w1
            = h w0 y + h x w1 + - h w0 w1.
    let w0. assume Hw0: w0 :e SNoL x.
    let w1. assume Hw1: w1 :e SNoL y.
    claim Lw0: w0 :e SNoS_ (SNoLev x).
    { exact SNoL_SNoS x Hx w0 Hw0. }
    claim Lw1: w1 :e SNoS_ (SNoLev y).
    { exact SNoL_SNoS y Hy w1 Hw1. }
    claim Lw1b: SNo w1.
    { apply SNoL_E y Hy w1 Hw1. assume H _ _. exact H. }
    claim L1aa: g w0 y = h w0 y.
    { apply Hgh1.
      - exact Lw0.
      - exact Hy.
    }
    claim L1ab: g x w1 = h x w1.
    { apply Hgh2. exact Lw1. }
    claim L1ac: g w0 w1 = h w0 w1.
    { apply Hgh1.
      - exact Lw0.
      - exact Lw1b.
    }
    rewrite L1aa. rewrite L1ab. rewrite L1ac. reflexivity.
  }
  claim L1b: {g (z 0) y + g x (z 1) + - g (z 0) (z 1)|z :e SNoR x :*: SNoR y}
           = {h (z 0) y + h x (z 1) + - h (z 0) (z 1)|z :e SNoR x :*: SNoR y}.
  { apply ReplEq_setprod_ext (SNoR x) (SNoR y) (fun z0 z1 => g z0 y + g x z1 + - g z0 z1) (fun z0 z1 => h z0 y + h x z1 + - h z0 z1).
    prove forall z0 :e SNoR x, forall z1 :e SNoR y,
              g z0 y + g x z1 + - g z0 z1
            = h z0 y + h x z1 + - h z0 z1.
    let z0. assume Hz0: z0 :e SNoR x.
    let z1. assume Hz1: z1 :e SNoR y.
    claim Lz0: z0 :e SNoS_ (SNoLev x).
    { exact SNoR_SNoS x Hx z0 Hz0. }
    claim Lz1: z1 :e SNoS_ (SNoLev y).
    { exact SNoR_SNoS y Hy z1 Hz1. }
    claim Lz1b: SNo z1.
    { apply SNoR_E y Hy z1 Hz1. assume H _ _. exact H. }
    claim L1ba: g z0 y = h z0 y.
    { apply Hgh1.
      - exact Lz0.
      - exact Hy.
    }
    claim L1bb: g x z1 = h x z1.
    { apply Hgh2. exact Lz1. }
    claim L1bc: g z0 z1 = h z0 z1.
    { apply Hgh1.
      - exact Lz0.
      - exact Lz1b.
    }
    rewrite L1ba. rewrite L1bb. rewrite L1bc. reflexivity.
  }
  claim L1c: {g (w 0) y + g x (w 1) + - g (w 0) (w 1)|w :e SNoL x :*: SNoR y}
           = {h (w 0) y + h x (w 1) + - h (w 0) (w 1)|w :e SNoL x :*: SNoR y}.
  { apply ReplEq_setprod_ext (SNoL x) (SNoR y) (fun w0 w1 => g w0 y + g x w1 + - g w0 w1) (fun w0 w1 => h w0 y + h x w1 + - h w0 w1).
    prove forall w0 :e SNoL x, forall w1 :e SNoR y,
              g w0 y + g x w1 + - g w0 w1
            = h w0 y + h x w1 + - h w0 w1.
    let w0. assume Hw0: w0 :e SNoL x.
    let w1. assume Hw1: w1 :e SNoR y.
    claim Lw0: w0 :e SNoS_ (SNoLev x).
    { exact SNoL_SNoS x Hx w0 Hw0. }
    claim Lw1: w1 :e SNoS_ (SNoLev y).
    { exact SNoR_SNoS y Hy w1 Hw1. }
    claim Lw1b: SNo w1.
    { apply SNoR_E y Hy w1 Hw1. assume H _ _. exact H. }
    claim L1ca: g w0 y = h w0 y.
    { apply Hgh1.
      - exact Lw0.
      - exact Hy.
    }
    claim L1cb: g x w1 = h x w1.
    { apply Hgh2. exact Lw1. }
    claim L1cc: g w0 w1 = h w0 w1.
    { apply Hgh1.
      - exact Lw0.
      - exact Lw1b.
    }
    rewrite L1ca. rewrite L1cb. rewrite L1cc. reflexivity.
  }
  claim L1d: {g (z 0) y + g x (z 1) + - g (z 0) (z 1)|z :e SNoR x :*: SNoL y}
           = {h (z 0) y + h x (z 1) + - h (z 0) (z 1)|z :e SNoR x :*: SNoL y}.
  { apply ReplEq_setprod_ext (SNoR x) (SNoL y) (fun z0 z1 => g z0 y + g x z1 + - g z0 z1) (fun z0 z1 => h z0 y + h x z1 + - h z0 z1).
    prove forall z0 :e SNoR x, forall z1 :e SNoL y,
              g z0 y + g x z1 + - g z0 z1
            = h z0 y + h x z1 + - h z0 z1.
    let z0. assume Hz0: z0 :e SNoR x.
    let z1. assume Hz1: z1 :e SNoL y.
    claim Lz0: z0 :e SNoS_ (SNoLev x).
    { exact SNoR_SNoS x Hx z0 Hz0. }
    claim Lz1: z1 :e SNoS_ (SNoLev y).
    { exact SNoL_SNoS y Hy z1 Hz1. }
    claim Lz1b: SNo z1.
    { apply SNoL_E y Hy z1 Hz1. assume H _ _. exact H. }
    claim L1da: g z0 y = h z0 y.
    { apply Hgh1.
      - exact Lz0.
      - exact Hy.
    }
    claim L1db: g x z1 = h x z1.
    { apply Hgh2. exact Lz1. }
    claim L1dc: g z0 z1 = h z0 z1.
    { apply Hgh1.
      - exact Lz0.
      - exact Lz1b.
    }
    rewrite L1da. rewrite L1db. rewrite L1dc. reflexivity.
  }
  prove SNoCut ({g (w 0) y + g x (w 1) + - g (w 0) (w 1)|w :e SNoL x :*: SNoL y}
                  :\/:
                {g (z 0) y + g x (z 1) + - g (z 0) (z 1)|z :e SNoR x :*: SNoR y})
               ({g (w 0) y + g x (w 1) + - g (w 0) (w 1)|w :e SNoL x :*: SNoR y}
                  :\/:
                {g (z 0) y + g x (z 1) + - g (z 0) (z 1)|z :e SNoR x :*: SNoL y})
      = SNoCut ({h (w 0) y + h x (w 1) + - h (w 0) (w 1)|w :e SNoL x :*: SNoL y}
                  :\/:
                {h (z 0) y + h x (z 1) + - h (z 0) (z 1)|z :e SNoR x :*: SNoR y})
               ({h (w 0) y + h x (w 1) + - h (w 0) (w 1)|w :e SNoL x :*: SNoR y}
                  :\/:
                {h (z 0) y + h x (z 1) + - h (z 0) (z 1)|z :e SNoR x :*: SNoL y}).
  rewrite L1a.
  rewrite L1b.
  rewrite L1c.
  rewrite L1d.
  reflexivity.
}
exact SNo_rec2_eq F L1.
Qed.

Theorem mul_SNo_eq_2 : forall x y, SNo x -> SNo y ->
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
let x y. assume Hx Hy. let p. assume Hp.
prove p.
set Lxy1 := {(w 0) * y + x * (w 1) + - (w 0) * (w 1)|w :e SNoL x :*: SNoL y}.
set Lxy2 := {(z 0) * y + x * (z 1) + - (z 0) * (z 1)|z :e SNoR x :*: SNoR y}.
set Rxy1 := {(w 0) * y + x * (w 1) + - (w 0) * (w 1)|w :e SNoL x :*: SNoR y}.
set Rxy2 := {(z 0) * y + x * (z 1) + - (z 0) * (z 1)|z :e SNoR x :*: SNoL y}.
apply Hp (Lxy1 :\/: Lxy2) (Rxy1 :\/: Rxy2).
- let u. assume Hu. let q. assume Hq1 Hq2.
  apply binunionE Lxy1 Lxy2 u Hu.
  + assume Hu1: u :e Lxy1.
    apply ReplE_impred (SNoL x :*: SNoL y) (fun w => (w 0) * y + x * (w 1) + - (w 0) * (w 1)) u Hu1.
    let w. assume Hw: w :e SNoL x :*: SNoL y.
    assume Hw2: u = (w 0) * y + x * (w 1) + - (w 0) * (w 1).
    exact Hq1 (w 0) (ap0_Sigma (SNoL x) (fun _ => SNoL y) w Hw)
              (w 1) (ap1_Sigma (SNoL x) (fun _ => SNoL y) w Hw)
              Hw2.
  + assume Hu2: u :e Lxy2.
    apply ReplE_impred (SNoR x :*: SNoR y) (fun z => (z 0) * y + x * (z 1) + - (z 0) * (z 1)) u Hu2.
    let z. assume Hz: z :e SNoR x :*: SNoR y.
    assume Hz2: u = (z 0) * y + x * (z 1) + - (z 0) * (z 1).
    exact Hq2 (z 0) (ap0_Sigma (SNoR x) (fun _ => SNoR y) z Hz)
              (z 1) (ap1_Sigma (SNoR x) (fun _ => SNoR y) z Hz)
              Hz2.
- let w0. assume Hw0: w0 :e SNoL x. let w1. assume Hw1: w1 :e SNoL y.
  prove w0 * y + x * w1 + - w0 * w1 :e Lxy1 :\/: Lxy2.
  apply binunionI1.
  prove w0 * y + x * w1 + - w0 * w1 :e Lxy1.
  apply tuple_2_0_eq w0 w1 (fun u v => u * y + x * w1 + - u * w1 :e Lxy1).
  prove (w0,w1) 0 * y + x * w1 + - (w0,w1) 0 * w1 :e Lxy1.
  apply tuple_2_1_eq w0 w1 (fun u v => (w0,w1) 0 * y + x * u + - (w0,w1) 0 * u :e Lxy1).
  prove (w0,w1) 0 * y + x * (w0,w1) 1 + - (w0,w1) 0 * (w0,w1) 1 :e Lxy1.
  apply ReplI (SNoL x :*: SNoL y) (fun w => (w 0) * y + x * (w 1) + - (w 0) * (w 1)) (w0,w1).
  prove (w0,w1) :e SNoL x :*: SNoL y.
  apply tuple_2_setprod.
  + exact Hw0.
  + exact Hw1.
- let z0. assume Hz0: z0 :e SNoR x. let z1. assume Hz1: z1 :e SNoR y.
  prove z0 * y + x * z1 + - z0 * z1 :e Lxy1 :\/: Lxy2.
  apply binunionI2.
  prove z0 * y + x * z1 + - z0 * z1 :e Lxy2.
  apply tuple_2_0_eq z0 z1 (fun u v => u * y + x * z1 + - u * z1 :e Lxy2).
  prove (z0,z1) 0 * y + x * z1 + - (z0,z1) 0 * z1 :e Lxy2.
  apply tuple_2_1_eq z0 z1 (fun u v => (z0,z1) 0 * y + x * u + - (z0,z1) 0 * u :e Lxy2).
  prove (z0,z1) 0 * y + x * (z0,z1) 1 + - (z0,z1) 0 * (z0,z1) 1 :e Lxy2.
  apply ReplI (SNoR x :*: SNoR y) (fun z => (z 0) * y + x * (z 1) + - (z 0) * (z 1)) (z0,z1).
  prove (z0,z1) :e SNoR x :*: SNoR y.
  apply tuple_2_setprod.
  + exact Hz0.
  + exact Hz1.
- let u. assume Hu. let q. assume Hq1 Hq2.
  apply binunionE Rxy1 Rxy2 u Hu.
  + assume Hu1: u :e Rxy1.
    apply ReplE_impred (SNoL x :*: SNoR y) (fun w => (w 0) * y + x * (w 1) + - (w 0) * (w 1)) u Hu1.
    let w. assume Hw: w :e SNoL x :*: SNoR y.
    assume Hw2: u = (w 0) * y + x * (w 1) + - (w 0) * (w 1).
    exact Hq1 (w 0) (ap0_Sigma (SNoL x) (fun _ => SNoR y) w Hw)
              (w 1) (ap1_Sigma (SNoL x) (fun _ => SNoR y) w Hw)
              Hw2.
  + assume Hu2: u :e Rxy2.
    apply ReplE_impred (SNoR x :*: SNoL y) (fun z => (z 0) * y + x * (z 1) + - (z 0) * (z 1)) u Hu2.
    let z. assume Hz: z :e SNoR x :*: SNoL y.
    assume Hz2: u = (z 0) * y + x * (z 1) + - (z 0) * (z 1).
    exact Hq2 (z 0) (ap0_Sigma (SNoR x) (fun _ => SNoL y) z Hz)
              (z 1) (ap1_Sigma (SNoR x) (fun _ => SNoL y) z Hz)
              Hz2.
- let w0. assume Hw0: w0 :e SNoL x. let z1. assume Hz1: z1 :e SNoR y.
  prove w0 * y + x * z1 + - w0 * z1 :e Rxy1 :\/: Rxy2.
  apply binunionI1.
  prove w0 * y + x * z1 + - w0 * z1 :e Rxy1.
  apply tuple_2_0_eq w0 z1 (fun u v => u * y + x * z1 + - u * z1 :e Rxy1).
  prove (w0,z1) 0 * y + x * z1 + - (w0,z1) 0 * z1 :e Rxy1.
  apply tuple_2_1_eq w0 z1 (fun u v => (w0,z1) 0 * y + x * u + - (w0,z1) 0 * u :e Rxy1).
  prove (w0,z1) 0 * y + x * (w0,z1) 1 + - (w0,z1) 0 * (w0,z1) 1 :e Rxy1.
  apply ReplI (SNoL x :*: SNoR y) (fun w => (w 0) * y + x * (w 1) + - (w 0) * (w 1)) (w0,z1).
  prove (w0,z1) :e SNoL x :*: SNoR y.
  apply tuple_2_setprod.
  + exact Hw0.
  + exact Hz1.
- let z0. assume Hz0: z0 :e SNoR x. let w1. assume Hw1: w1 :e SNoL y.
  prove z0 * y + x * w1 + - z0 * w1 :e Rxy1 :\/: Rxy2.
  apply binunionI2.
  prove z0 * y + x * w1 + - z0 * w1 :e Rxy2.
  apply tuple_2_0_eq z0 w1 (fun u v => u * y + x * w1 + - u * w1 :e Rxy2).
  prove (z0,w1) 0 * y + x * w1 + - (z0,w1) 0 * w1 :e Rxy2.
  apply tuple_2_1_eq z0 w1 (fun u v => (z0,w1) 0 * y + x * u + - (z0,w1) 0 * u :e Rxy2).
  prove (z0,w1) 0 * y + x * (z0,w1) 1 + - (z0,w1) 0 * (z0,w1) 1 :e Rxy2.
  apply ReplI (SNoR x :*: SNoL y) (fun w => (w 0) * y + x * (w 1) + - (w 0) * (w 1)) (z0,w1).
  prove (z0,w1) :e SNoR x :*: SNoL y.
  apply tuple_2_setprod.
  + exact Hz0.
  + exact Hw1.
- exact mul_SNo_eq x Hx y Hy.         
Qed.

Theorem mul_SNo_prop_1 : forall x, SNo x -> forall y, SNo y ->
 forall p:prop,
    (SNo (x * y)
  -> (forall u :e SNoL x, forall v :e SNoL y, u * y + x * v < x * y + u * v)
  -> (forall u :e SNoR x, forall v :e SNoR y, u * y + x * v < x * y + u * v)
  -> (forall u :e SNoL x, forall v :e SNoR y, x * y + u * v < u * y + x * v)
  -> (forall u :e SNoR x, forall v :e SNoL y, x * y + u * v < u * y + x * v)
  -> p)
 -> p.
set P : set -> prop
 := fun x =>
 forall y, SNo y ->
 forall p:prop,
    (SNo (x * y)
  -> (forall u :e SNoL x, forall v :e SNoL y, u * y + x * v < x * y + u * v)
  -> (forall u :e SNoR x, forall v :e SNoR y, u * y + x * v < x * y + u * v)
  -> (forall u :e SNoL x, forall v :e SNoR y, x * y + u * v < u * y + x * v)
  -> (forall u :e SNoR x, forall v :e SNoL y, x * y + u * v < u * y + x * v)
  -> p)
 -> p.
prove forall x, SNo x -> P x.
apply SNoLev_ind.
let x.
assume Hx: SNo x.
assume IHx: forall w :e SNoS_ (SNoLev x), P w.
set Q : set -> prop
 := fun y =>
 forall p:prop,
    (SNo (x * y)
  -> (forall u :e SNoL x, forall v :e SNoL y, u * y + x * v < x * y + u * v)
  -> (forall u :e SNoR x, forall v :e SNoR y, u * y + x * v < x * y + u * v)
  -> (forall u :e SNoL x, forall v :e SNoR y, x * y + u * v < u * y + x * v)
  -> (forall u :e SNoR x, forall v :e SNoL y, x * y + u * v < u * y + x * v)
  -> p)
 -> p.
prove forall y, SNo y -> Q y.
apply SNoLev_ind.
let y.
assume Hy: SNo y.
assume IHy: forall z :e SNoS_ (SNoLev y), Q z.
apply mul_SNo_eq_2 x y Hx Hy.
let L R.
assume HLE HLI1 HLI2 HRE HRI1 HRI2 Hxy.
claim LLx: forall u :e SNoL x, forall v, SNo v -> SNo (u * v).
{ let u. assume Hu. let v. assume Hv.
  apply IHx u (SNoL_SNoS x Hx u Hu) v Hv.
  assume H1 _ _ _ _. exact H1.
}
claim LRx: forall u :e SNoR x, forall v, SNo v -> SNo (u * v).
{ let u. assume Hu. let v. assume Hv.
  apply IHx u (SNoR_SNoS x Hx u Hu) v Hv.
  assume H1 _ _ _ _. exact H1.
}
claim LLxy: forall u :e SNoL x, SNo (u * y).
{ let u. assume Hu. exact LLx u Hu y Hy. }
claim LRxy: forall u :e SNoR x, SNo (u * y).
{ let u. assume Hu. exact LRx u Hu y Hy. }
claim LxLy: forall v :e SNoL y, SNo (x * v).
{ let v. assume Hv. apply IHy v (SNoL_SNoS y Hy v Hv).
  assume H1 _ _ _ _. exact H1.
}
claim LxRy: forall v :e SNoR y, SNo (x * v).
{ let v. assume Hv. apply IHy v (SNoR_SNoS y Hy v Hv).
  assume H1 _ _ _ _. exact H1.
}
claim LLR1: SNoCutP L R.
{ prove (forall x :e L, SNo x)
     /\ (forall y :e R, SNo y)
     /\ (forall x :e L, forall y :e R, x < y).
  apply and3I.
  - let u. assume Hu.
    apply HLE u Hu.
    + let w0. assume Hw0. let w1. assume Hw1 Huw.
      apply SNoL_E y Hy w1 Hw1.
      assume Hw1a _ _.
      prove SNo u.
      rewrite Huw.
      prove SNo (w0 * y + x * w1 + - w0 * w1).
      apply SNo_add_SNo.
      * prove SNo (w0 * y). exact LLxy w0 Hw0.
      * { prove SNo (x * w1 + - w0 * w1).
          apply SNo_add_SNo.
          - prove SNo (x * w1). exact LxLy w1 Hw1.
          - prove SNo (- w0 * w1).
            apply SNo_minus_SNo.
            exact LLx w0 Hw0 w1 Hw1a.
        }
    + let z0. assume Hz0. let z1. assume Hz1 Huz.
      apply SNoR_E y Hy z1 Hz1.
      assume Hz1a _ _.
      prove SNo u.
      rewrite Huz.
      prove SNo (z0 * y + x * z1 + - z0 * z1).
      apply SNo_add_SNo.
      * prove SNo (z0 * y). exact LRxy z0 Hz0.
      * { prove SNo (x * z1 + - z0 * z1).
          apply SNo_add_SNo.
          - prove SNo (x * z1). exact LxRy z1 Hz1.
          - prove SNo (- z0 * z1).
            apply SNo_minus_SNo.
            exact LRx z0 Hz0 z1 Hz1a.
        }
  - let u. assume Hu.
    apply HRE u Hu.
    + let w0. assume Hw0. let z1. assume Hz1 Huw.
      apply SNoR_E y Hy z1 Hz1.
      assume Hz1a _ _.
      prove SNo u.
      rewrite Huw.
      prove SNo (w0 * y + x * z1 + - w0 * z1).
      apply SNo_add_SNo.
      * prove SNo (w0 * y). exact LLxy w0 Hw0.
      * { prove SNo (x * z1 + - w0 * z1).
          apply SNo_add_SNo.
          - prove SNo (x * z1). exact LxRy z1 Hz1.
          - prove SNo (- w0 * z1).
            apply SNo_minus_SNo.
            exact LLx w0 Hw0 z1 Hz1a.
        }
    + let z0. assume Hz0. let w1. assume Hw1 Huz.
      apply SNoL_E y Hy w1 Hw1.
      assume Hw1a _ _.
      prove SNo u.
      rewrite Huz.
      prove SNo (z0 * y + x * w1 + - z0 * w1).
      apply SNo_add_SNo.
      * prove SNo (z0 * y). exact LRxy z0 Hz0.
      * { prove SNo (x * w1 + - z0 * w1).
          apply SNo_add_SNo.
          - prove SNo (x * w1). exact LxLy w1 Hw1.
          - prove SNo (- z0 * w1).
            apply SNo_minus_SNo.
            exact LRx z0 Hz0 w1 Hw1a.
        }
  - let u. assume Hu. let v. assume Hv.
    claim Luvimp: forall u0 v0 :e SNoS_ (SNoLev x), forall u1 v1 :e SNoS_ (SNoLev y),
           forall p:prop,
            (SNo (u0 * y) -> SNo (x * u1) -> SNo (u0 * u1) ->
             SNo (v0 * y) -> SNo (x * v1) -> SNo (v0 * v1) ->
             SNo (u0 * v1) -> SNo (v0 * u1) ->
                 (u = u0 * y + x * u1 + - u0 * u1
               -> v = v0 * y + x * v1 + - v0 * v1
               -> u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1
               -> u < v)
              -> p)
            -> p.
    { let u0. assume Hu0. let v0. assume Hv0.
      let u1. assume Hu1. let v1. assume Hv1.
      apply SNoS_E2 (SNoLev y) (SNoLev_ordinal y Hy) u1 Hu1.
      assume Hu1a: SNoLev u1 :e SNoLev y.
      assume Hu1b: ordinal (SNoLev u1).
      assume Hu1c: SNo u1.
      assume _.
      apply SNoS_E2 (SNoLev y) (SNoLev_ordinal y Hy) v1 Hv1.
      assume Hv1a: SNoLev v1 :e SNoLev y.
      assume Hv1b: ordinal (SNoLev v1).
      assume Hv1c: SNo v1.
      assume _.
      claim Lu0u1: SNo (u0 * u1).
      { apply IHx u0 Hu0 u1 Hu1c.
        assume IHx0 _ _ _ _. exact IHx0.
      }
      claim Lv0v1: SNo (v0 * v1).
      { apply IHx v0 Hv0 v1 Hv1c.
        assume IHx0 _ _ _ _. exact IHx0.
      }
      claim Lu0y: SNo (u0 * y).
      { apply IHx u0 Hu0 y Hy. assume H _ _ _ _. exact H. }
      claim Lxu1: SNo (x * u1).
      { apply IHy u1 Hu1. assume H _ _ _ _. exact H. }
      claim Lv0y: SNo (v0 * y).
      { apply IHx v0 Hv0 y Hy. assume H _ _ _ _. exact H. }
      claim Lxv1: SNo (x * v1).
      { apply IHy v1 Hv1. assume H _ _ _ _. exact H. }
      claim Lu0v1: SNo (u0 * v1).
      { apply IHx u0 Hu0 v1 Hv1c.
        assume IHx0 _ _ _ _. exact IHx0.
      }
      claim Lv0u1: SNo (v0 * u1).
      { apply IHx v0 Hv0 u1 Hu1c.
        assume IHx0 _ _ _ _. exact IHx0.
      }
      let p. assume Hp.
      apply Hp Lu0y Lxu1 Lu0u1 Lv0y Lxv1 Lv0v1 Lu0v1 Lv0u1.
      assume Hue Hve H1.
      prove u < v.
      rewrite Hue. rewrite Hve.
      apply add_SNo_Lt1_cancel
                   (u0 * y + x * u1 + - u0 * u1)
                   (u0 * u1 + v0 * v1)
                   (v0 * y + x * v1 + - v0 * v1)
                   (SNo_add_SNo (u0 * y) (x * u1 + - u0 * u1) Lu0y (SNo_add_SNo (x * u1) (- u0 * u1) Lxu1 (SNo_minus_SNo (u0 * u1) Lu0u1)))
                   (SNo_add_SNo (u0 * u1) (v0 * v1) Lu0u1 Lv0v1)
                   (SNo_add_SNo (v0 * y) (x * v1 + - v0 * v1) Lv0y (SNo_add_SNo (x * v1) (- v0 * v1) Lxv1 (SNo_minus_SNo (v0 * v1) Lv0v1))).
      claim L1: (u0 * y + x * u1 + - u0 * u1) + (u0 * u1 + v0 * v1)
               = u0 * y + x * u1 + v0 * v1.
      { exact add_SNo_minus_SNo_prop5 (u0 * y) (x * u1) (u0 * u1) (v0 * v1) Lu0y Lxu1 Lu0u1 Lv0v1. }
      claim L2: (v0 * y + x * v1 + - v0 * v1) + (u0 * u1 + v0 * v1)
               = v0 * y + x * v1 + u0 * u1.
      { rewrite add_SNo_com (u0 * u1) (v0 * v1) Lu0u1 Lv0v1.
        exact add_SNo_minus_SNo_prop5 (v0 * y) (x * v1) (v0 * v1) (u0 * u1) Lv0y Lxv1 Lv0v1 Lu0u1.
      }
      rewrite L1. rewrite L2. exact H1.
    }
    apply HLE u Hu.
    + let u0. assume Hu0. let u1. assume Hu1 Hue.
      apply SNoL_E x Hx u0 Hu0.
      assume Hu0a: SNo u0.
      assume Hu0b: SNoLev u0 :e SNoLev x.
      assume Hu0c: u0 < x.
      apply SNoL_E y Hy u1 Hu1.
      assume Hu1a: SNo u1.
      assume Hu1b: SNoLev u1 :e SNoLev y.
      assume Hu1c: u1 < y.
      apply HRE v Hv.
      * { let v0. assume Hv0. let v1. assume Hv1 Hve.
          apply SNoL_E x Hx v0 Hv0.
          assume Hv0a: SNo v0.
          assume Hv0b: SNoLev v0 :e SNoLev x.
          assume Hv0c: v0 < x.
          apply SNoR_E y Hy v1 Hv1.
          assume Hv1a: SNo v1.
          assume Hv1b: SNoLev v1 :e SNoLev y.
          assume Hv1c: y < v1.
          apply Luvimp u0 (SNoL_SNoS x Hx u0 Hu0) v0 (SNoL_SNoS x Hx v0 Hv0)
                       u1 (SNoL_SNoS y Hy u1 Hu1) v1 (SNoR_SNoS y Hy v1 Hv1).
          assume Lu0y Lxu1 Lu0u1 Lv0y Lxv1 Lv0v1 Lu0v1 Lv0u1 Luv.
          apply Luv Hue Hve.
          prove u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          claim Lu1v1lt: u1 < v1.
          { exact SNoLt_tra u1 y v1 Hu1a Hy Hv1a Hu1c Hv1c. }
          claim L3: forall z :e SNoL x, x * u1 + z * v1 < z * u1 + x * v1.
          { let z. assume Hz.
            claim Lzu1: SNo (z * u1).
            { exact LLx z Hz u1 Hu1a. }
            claim Lzv1: SNo (z * v1).
            { exact LLx z Hz v1 Hv1a. }
            apply SNoLt_SNoL_or_SNoR_impred u1 v1 Hu1a Hv1a Lu1v1lt.
            - let w.
              assume Hwv1: w :e SNoL v1.
              assume Hwu1: w :e SNoR u1.
              apply SNoR_E u1 Hu1a w Hwu1.
              assume Hwu1a: SNo w.
              assume Hwu1b: SNoLev w :e SNoLev u1.
              assume Hwu1c: u1 < w.
              claim LwSy: w :e SNoS_ (SNoLev y).
              { apply SNoS_I2 w y Hwu1a Hy.
                prove SNoLev w :e SNoLev y.
                exact ordinal_TransSet (SNoLev y) (SNoLev_ordinal y Hy) (SNoLev u1) Hu1b (SNoLev w) Hwu1b.
              }
              claim Lzw: SNo (z * w).
              { exact LLx z Hz w Hwu1a. }
              claim Lxw: SNo (x * w).
              { apply IHy w LwSy. assume H1 _ _ _ _. exact H1. }
              claim L3a: z * v1 + x * w < x * v1 + z * w.
              { apply IHy v1 (SNoR_SNoS y Hy v1 Hv1).
                assume _ IHy1 _ _ _.
                exact IHy1 z Hz w Hwv1.
              }
              claim L3b: x * u1 + z * w < z * u1 + x * w.
              { apply IHy u1 (SNoL_SNoS y Hy u1 Hu1).
                assume _ _ _ IHy3 _.
                exact IHy3 z Hz w Hwu1.
              }
              exact add_SNo_Lt_subprop2 (x * u1) (z * v1) (z * u1) (x * v1) (z * w) (x * w)
                       Lxu1 Lzv1 Lzu1 Lxv1 Lzw Lxw
                       L3b L3a.
            - assume Hu1v1: u1 :e SNoL v1.
              apply IHy v1 (SNoR_SNoS y Hy v1 Hv1).
              assume _ IHy1 _ _ _.
              rewrite add_SNo_com (x * u1) (z * v1) Lxu1 Lzv1.
              rewrite add_SNo_com (z * u1) (x * v1) Lzu1 Lxv1.
              prove z * v1 + x * u1 < x * v1 + z * u1.
              exact IHy1 z Hz u1 Hu1v1.
            - assume Hv1u1: v1 :e SNoR u1.
              apply IHy u1 (SNoL_SNoS y Hy u1 Hu1).
              assume _ _ _ IHy3 _.
              exact IHy3 z Hz v1 Hv1u1.
          }
          claim L3u0: x * u1 + u0 * v1 < u0 * u1 + x * v1.
          { exact L3 u0 Hu0. }
          claim L3v0: x * u1 + v0 * v1 < v0 * u1 + x * v1.
          { exact L3 v0 Hv0. }
          claim L3u0imp: u0 * y + v0 * v1 < v0 * y + u0 * v1 -> u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          { assume H1.
            apply add_SNo_Lt_subprop3a (u0 * y) (x * u1) (v0 * v1) (v0 * y) (x * v1 + u0 * u1) (u0 * v1)
                            Lu0y Lxu1 Lv0v1 Lv0y
                            (SNo_add_SNo (x * v1) (u0 * u1) Lxv1 Lu0u1)
                            Lu0v1 H1.
            prove x * u1 + u0 * v1 < x * v1 + u0 * u1.
            rewrite add_SNo_com (x * v1) (u0 * u1) Lxv1 Lu0u1.
            exact L3u0.
          }
          claim L3v0imp: u0 * y + v0 * u1 < v0 * y + u0 * u1 -> u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          { assume H1.
            apply add_SNo_Lt_subprop3b (u0 * y) (x * u1 + v0 * v1) (v0 * y) (x * v1) (u0 * u1) (v0 * u1)
                            Lu0y
                            (SNo_add_SNo (x * u1) (v0 * v1) Lxu1 Lv0v1)
                            Lv0y Lxv1 Lu0u1 Lv0u1.
            - prove u0 * y + v0 * u1 < v0 * y + u0 * u1. exact H1.
            - prove x * u1 + v0 * v1 < v0 * u1 + x * v1. exact L3v0.
          }
          apply SNoL_or_SNoR_impred v0 u0 Hv0a Hu0a.
          - assume Hv0u0: v0 = u0. rewrite Hv0u0.
            prove u0 * y + (x * u1 + u0 * v1) < u0 * y + (x * v1 + u0 * u1).
            apply add_SNo_Lt2 (u0 * y) (x * u1 + u0 * v1) (x * v1 + u0 * u1)
                              Lu0y
                              (SNo_add_SNo (x * u1) (u0 * v1) Lxu1 Lu0v1)
                              (SNo_add_SNo (x * v1) (u0 * u1) Lxv1 Lu0u1).
            prove x * u1 + u0 * v1 < x * v1 + u0 * u1.
            rewrite add_SNo_com (x * v1) (u0 * u1) Lxv1 Lu0u1.
            exact L3u0.
          - let z.
            assume Hzu0: z :e SNoL u0.
            assume Hzv0: z :e SNoR v0.
            claim L4: u0 * y + z * v1 < z * y + u0 * v1.
            { apply IHx u0 (SNoL_SNoS x Hx u0 Hu0) y Hy.
              assume _ _ _ IHx3 _.
              exact IHx3 z Hzu0 v1 Hv1.
            }
            claim L5: z * y + v0 * v1 < v0 * y + z * v1.
            { apply IHx v0 (SNoL_SNoS x Hx v0 Hv0) y Hy.
              assume _ _ IHx2 _ _.
              exact IHx2 z Hzv0 v1 Hv1.
            }
            claim Lz: z :e SNoL x.
            { apply SNoL_E u0 Hu0a z Hzu0.
              assume Hza: SNo z.
              assume Hzb: SNoLev z :e SNoLev u0.
              assume Hzc: z < u0.
              apply SNoL_I x Hx z Hza.
              - prove SNoLev z :e SNoLev x.
                exact ordinal_TransSet (SNoLev x) (SNoLev_ordinal x Hx) (SNoLev u0) Hu0b (SNoLev z) Hzb.
              - prove z < x. exact SNoLt_tra z u0 x Hza Hu0a Hx Hzc Hu0c.
            }
            apply add_SNo_Lt_subprop3c (u0 * y) (x * u1) (v0 * v1) (v0 * y) (x * v1 + u0 * u1) (z * v1) (z * y) (u0 * v1)
                                       Lu0y Lxu1 Lv0v1 Lv0y
                                       (SNo_add_SNo (x * v1) (u0 * u1) Lxv1 Lu0u1)
                                       (LLx z Lz v1 Hv1a) (LLxy z Lz)
                                       Lu0v1.
            + exact L4.
            + rewrite add_SNo_com (x * v1) (u0 * u1) Lxv1 Lu0u1. exact L3u0.
            + exact L5.
          - assume Hv0u0: v0 :e SNoL u0. apply L3u0imp.
            prove u0 * y + v0 * v1 < v0 * y + u0 * v1.
            apply IHx u0 (SNoL_SNoS x Hx u0 Hu0) y Hy.
            assume _ _ _ IHx3 _.
            exact IHx3 v0 Hv0u0 v1 Hv1.
          - assume Hu0v0: u0 :e SNoR v0. apply L3u0imp.
            prove u0 * y + v0 * v1 < v0 * y + u0 * v1.
            apply IHx v0 (SNoL_SNoS x Hx v0 Hv0) y Hy.
            assume _ _ IHx2 _ _.
            exact IHx2 u0 Hu0v0 v1 Hv1.
          - let z.
            assume Hzu0: z :e SNoR u0.
            assume Hzv0: z :e SNoL v0.
            claim L6: z * y + v0 * u1 < v0 * y + z * u1.
            { apply IHx v0 (SNoL_SNoS x Hx v0 Hv0) y Hy.
              assume _ IHx1 _ _ _.
              exact IHx1 z Hzv0 u1 Hu1.
            }
            claim L7: u0 * y + z * u1 < z * y + u0 * u1.
            { apply IHx u0 (SNoL_SNoS x Hx u0 Hu0) y Hy.
              assume _ _ _ _ IHx4.
              exact IHx4 z Hzu0 u1 Hu1.
            }
            claim Lz: z :e SNoL x.
            { apply SNoL_E v0 Hv0a z Hzv0.
              assume Hza: SNo z.
              assume Hzb: SNoLev z :e SNoLev v0.
              assume Hzc: z < v0.
              apply SNoL_I x Hx z Hza.
              - prove SNoLev z :e SNoLev x.
                exact ordinal_TransSet (SNoLev x) (SNoLev_ordinal x Hx) (SNoLev v0) Hv0b (SNoLev z) Hzb.
              - prove z < x. exact SNoLt_tra z v0 x Hza Hv0a Hx Hzc Hv0c.
            }
            exact add_SNo_Lt_subprop3d (u0 * y) (x * u1 + v0 * v1) (v0 * y) (x * v1) (u0 * u1) (z * u1) (z * y) (v0 * u1)
                       Lu0y (SNo_add_SNo (x * u1) (v0 * v1) Lxu1 Lv0v1) Lv0y Lxv1 Lu0u1
                       (LLx z Lz u1 Hu1a) (LLxy z Lz)
                       Lv0u1
                       L7 L3v0 L6.
          - assume Hv0u0: v0 :e SNoR u0. apply L3v0imp.
            prove u0 * y + v0 * u1 < v0 * y + u0 * u1.
            apply IHx u0 (SNoL_SNoS x Hx u0 Hu0) y Hy.
            assume _ _ _ _ IHx4.
            exact IHx4 v0 Hv0u0 u1 Hu1.
          - assume Hu0v0: u0 :e SNoL v0. apply L3v0imp.
            prove u0 * y + v0 * u1 < v0 * y + u0 * u1.
            apply IHx v0 (SNoL_SNoS x Hx v0 Hv0) y Hy.
            assume _ IHx1 _ _ _.
            exact IHx1 u0 Hu0v0 u1 Hu1.
        }
      * { let v0. assume Hv0. let v1. assume Hv1 Hve.
          apply SNoR_E x Hx v0 Hv0.
          assume Hv0a: SNo v0.
          assume Hv0b: SNoLev v0 :e SNoLev x.
          assume Hv0c: x < v0.
          apply SNoL_E y Hy v1 Hv1.
          assume Hv1a: SNo v1.
          assume Hv1b: SNoLev v1 :e SNoLev y.
          assume Hv1c: v1 < y.
          apply Luvimp u0 (SNoL_SNoS x Hx u0 Hu0) v0 (SNoR_SNoS x Hx v0 Hv0)
                       u1 (SNoL_SNoS y Hy u1 Hu1) v1 (SNoL_SNoS y Hy v1 Hv1).
          assume Lu0y Lxu1 Lu0u1 Lv0y Lxv1 Lv0v1 Lu0v1 Lv0u1 Luv.
          apply Luv Hue Hve.
          prove u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          claim Lu0v0lt: u0 < v0.
          { exact SNoLt_tra u0 x v0 Hu0a Hx Hv0a Hu0c Hv0c. }
          claim L3: forall z :e SNoL y, u0 * y + v0 * z < v0 * y + u0 * z.
          { let z. assume Hz.
            apply SNoL_E y Hy z Hz.
            assume Hza: SNo z.
            assume Hzb: SNoLev z :e SNoLev y.
            assume Hzc: z < y.
            claim Lu0z: SNo (u0 * z).
            { exact LLx u0 Hu0 z Hza. }
            claim Lv0z: SNo (v0 * z).
            { exact LRx v0 Hv0 z Hza. }
            apply SNoLt_SNoL_or_SNoR_impred u0 v0 Hu0a Hv0a Lu0v0lt.
            - let w.
              assume Hwv0: w :e SNoL v0.
              assume Hwu0: w :e SNoR u0.
              apply SNoR_E u0 Hu0a w Hwu0.
              assume Hwu0a: SNo w.
              assume Hwu0b: SNoLev w :e SNoLev u0.
              assume Hwu0c: u0 < w.
              claim LLevwLevx: SNoLev w :e SNoLev x.
              { exact ordinal_TransSet (SNoLev x) (SNoLev_ordinal x Hx) (SNoLev u0) Hu0b (SNoLev w) Hwu0b. }
              claim LwSx: w :e SNoS_ (SNoLev x).
              { exact SNoS_I2 w x Hwu0a Hx LLevwLevx. }
              claim Lwz: SNo (w * z).
              { apply IHx w LwSx z Hza. assume H _ _ _ _. exact H. }
              claim Lwy: SNo (w * y).
              { apply IHx w LwSx y Hy. assume H _ _ _ _. exact H. }
              claim L3a: u0 * y + w * z < u0 * z + w * y.
              { rewrite add_SNo_com (u0 * z) (w * y) Lu0z Lwy.
                apply IHx u0 (SNoL_SNoS x Hx u0 Hu0) y Hy.
                assume _ _ _ _ IHx4.
                exact IHx4 w Hwu0 z Hz.
              }
              claim L3b: v0 * z + w * y < v0 * y + w * z.
              { rewrite add_SNo_com (v0 * z) (w * y) Lv0z Lwy.
                apply IHx v0 (SNoR_SNoS x Hx v0 Hv0) y Hy.
                assume _ IHx1 _ _ _.
                exact IHx1 w Hwv0 z Hz.
              }
              rewrite <- add_SNo_com (u0 * z) (v0 * y) Lu0z Lv0y.
              exact add_SNo_Lt_subprop2 (u0 * y) (v0 * z) (u0 * z) (v0 * y) (w * z) (w * y)
                       Lu0y Lv0z Lu0z Lv0y Lwz Lwy
                       L3a L3b.
            - assume Hu0v0: u0 :e SNoL v0.
              apply IHx v0 (SNoR_SNoS x Hx v0 Hv0) y Hy.
              assume _ IHx1 _ _ _.
              exact IHx1 u0 Hu0v0 z Hz.
            - assume Hv0u0: v0 :e SNoR u0.
              apply IHx u0 (SNoL_SNoS x Hx u0 Hu0) y Hy.
              assume _ _ _ _ IHx4.
              exact IHx4 v0 Hv0u0 z Hz.
          }
          claim L3u1: u0 * y + v0 * u1 < v0 * y + u0 * u1.
          { exact L3 u1 Hu1. }
          claim L3v1: u0 * y + v0 * v1 < v0 * y + u0 * v1.
          { exact L3 v1 Hv1. }
          claim L3u1imp: x * u1 + v0 * v1 < v0 * u1 + x * v1 -> u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          { exact add_SNo_Lt_subprop3b (u0 * y) (x * u1 + v0 * v1) (v0 * y) (x * v1) (u0 * u1) (v0 * u1)
                            Lu0y (SNo_add_SNo (x * u1) (v0 * v1) Lxu1 Lv0v1) Lv0y Lxv1 Lu0u1 Lv0u1
                            L3u1.
          }
          claim L3v1imp: x * u1 + u0 * v1 < x * v1 + u0 * u1 -> u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          { exact add_SNo_Lt_subprop3a (u0 * y) (x * u1) (v0 * v1) (v0 * y) (x * v1 + u0 * u1) (u0 * v1)
                            Lu0y Lxu1 Lv0v1 Lv0y (SNo_add_SNo (x * v1) (u0 * u1) Lxv1 Lu0u1) Lu0v1 L3v1.
          }
          apply SNoL_or_SNoR_impred v1 u1 Hv1a Hu1a.
          - assume Hv1u1: v1 = u1. rewrite Hv1u1.
            prove u0 * y + x * u1 + v0 * u1 < v0 * y + x * u1 + u0 * u1.
            rewrite add_SNo_com_3_0_1 (u0 * y) (x * u1) (v0 * u1) Lu0y Lxu1 Lv0u1.
            rewrite add_SNo_com_3_0_1 (v0 * y) (x * u1) (u0 * u1) Lv0y Lxu1 Lu0u1.
            apply add_SNo_Lt2 (x * u1) (u0 * y + v0 * u1) (v0 * y + u0 * u1) Lxu1 (SNo_add_SNo (u0 * y) (v0 * u1) Lu0y Lv0u1) (SNo_add_SNo (v0 * y) (u0 * u1) Lv0y Lu0u1).
            prove u0 * y + v0 * u1 < v0 * y + u0 * u1.
            exact L3u1.
          - let z.
            assume Hzu1: z :e SNoL u1.
            assume Hzv1: z :e SNoR v1.
            apply SNoL_E u1 Hu1a z Hzu1.
            assume Hza: SNo z.
            assume Hzb: SNoLev z :e SNoLev u1.
            assume Hzc: z < u1.
            claim Lz: z :e SNoL y.
            { apply SNoL_I y Hy z Hza.
              - prove SNoLev z :e SNoLev y.
                exact ordinal_TransSet (SNoLev y) (SNoLev_ordinal y Hy) (SNoLev u1) Hu1b (SNoLev z) Hzb.
              - prove z < y. exact SNoLt_tra z u1 y Hza Hu1a Hy Hzc Hu1c.
            }
            claim L4: x * u1 + v0 * z < x * z + v0 * u1.
            { rewrite add_SNo_com (x * z) (v0 * u1) (LxLy z Lz) Lv0u1.
              prove x * u1 + v0 * z < v0 * u1 + x * z.
              apply IHy u1 (SNoL_SNoS y Hy u1 Hu1).
              assume _ _ _ _ IHy4.
              exact IHy4 v0 Hv0 z Hzu1.
            }
            claim L5: x * z + v0 * v1 < x * v1 + v0 * z.
            { rewrite add_SNo_com (x * z) (v0 * v1) (LxLy z Lz) Lv0v1.
              apply IHy v1 (SNoL_SNoS y Hy v1 Hv1).
              assume _ _ IHy2 _ _.
              exact IHy2 v0 Hv0 z Hzv1.
            }
            prove u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
            rewrite add_SNo_com_3_0_1 (u0 * y) (x * u1) (v0 * v1) Lu0y Lxu1 Lv0v1.
            rewrite add_SNo_com_3_0_1 (v0 * y) (x * v1) (u0 * u1) Lv0y Lxv1 Lu0u1.
            prove x * u1 + u0 * y + v0 * v1 < x * v1 + v0 * y + u0 * u1.
            exact add_SNo_Lt_subprop3c (x * u1) (u0 * y) (v0 * v1) (x * v1) (v0 * y + u0 * u1) (v0 * z) (x * z) (v0 * u1)
                                       Lxu1 Lu0y Lv0v1 Lxv1
                                       (SNo_add_SNo (v0 * y) (u0 * u1) Lv0y Lu0u1)
                                       (LRx v0 Hv0 z Hza)
                                       (LxLy z Lz)
                                       Lv0u1
                                       L4 L3u1 L5.
          - assume Hv1u1: v1 :e SNoL u1. apply L3u1imp.
            prove x * u1 + v0 * v1 < v0 * u1 + x * v1.
            apply IHy u1 (SNoL_SNoS y Hy u1 Hu1).
            assume _ _ _ _ IHy4.
            exact IHy4 v0 Hv0 v1 Hv1u1.
          - assume Hu1v1: u1 :e SNoR v1. apply L3u1imp.
            prove x * u1 + v0 * v1 < v0 * u1 + x * v1.
            rewrite add_SNo_com (x * u1) (v0 * v1) Lxu1 Lv0v1.
            rewrite add_SNo_com (v0 * u1) (x * v1) Lv0u1 Lxv1.
            apply IHy v1 (SNoL_SNoS y Hy v1 Hv1).
            assume _ _ IHy2 _ _.
            exact IHy2 v0 Hv0 u1 Hu1v1.
          - let z.
            assume Hzu1: z :e SNoR u1.
            assume Hzv1: z :e SNoL v1.
            apply SNoL_E v1 Hv1a z Hzv1.
            assume Hza: SNo z.
            assume Hzb: SNoLev z :e SNoLev v1.
            assume Hzc: z < v1.
            claim Lz: z :e SNoL y.
            { apply SNoL_I y Hy z Hza.
              - prove SNoLev z :e SNoLev y.
                exact ordinal_TransSet (SNoLev y) (SNoLev_ordinal y Hy) (SNoLev v1) Hv1b (SNoLev z) Hzb.
              - prove z < y. exact SNoLt_tra z v1 y Hza Hv1a Hy Hzc Hv1c.
            }
            claim L6: x * u1 + u0 * z < x * z + u0 * u1.
            { rewrite add_SNo_com (x * z) (u0 * u1) (LxLy z Lz) Lu0u1.
              apply IHy u1 (SNoL_SNoS y Hy u1 Hu1).
              assume _ _ _ IHy3 _.
              exact IHy3 u0 Hu0 z Hzu1.
            }
            claim L7: x * z + u0 * v1 < x * v1 + u0 * z.
            { rewrite add_SNo_com (x * z) (u0 * v1) (LxLy z Lz) Lu0v1.
              apply IHy v1 (SNoL_SNoS y Hy v1 Hv1).
              assume _ IHy1 _ _ _.
              exact IHy1 u0 Hu0 z Hzv1.
            }
            prove u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
            rewrite add_SNo_com_3_0_1 (u0 * y) (x * u1) (v0 * v1) Lu0y Lxu1 Lv0v1.
            rewrite add_SNo_com_3_0_1 (v0 * y) (x * v1) (u0 * u1) Lv0y Lxv1 Lu0u1.
            prove x * u1 + u0 * y + v0 * v1 < x * v1 + v0 * y + u0 * u1.
            apply add_SNo_Lt_subprop3d (x * u1) (u0 * y + v0 * v1) (x * v1) (v0 * y) (u0 * u1) (u0 * z) (x * z) (u0 * v1)
                       Lxu1 (SNo_add_SNo (u0 * y) (v0 * v1) Lu0y Lv0v1)
                       Lxv1 Lv0y Lu0u1
                       (LLx u0 Hu0 z Hza) (LxLy z Lz) Lu0v1 L6.
            + prove u0 * y + v0 * v1 < u0 * v1 + v0 * y.
              rewrite add_SNo_com (u0 * v1) (v0 * y) Lu0v1 Lv0y.
              exact L3v1.
            + exact L7.
          - assume Hv1u1: v1 :e SNoR u1. apply L3v1imp.
            prove x * u1 + u0 * v1 < x * v1 + u0 * u1.
            rewrite add_SNo_com (x * v1) (u0 * u1) Lxv1 Lu0u1.
            apply IHy u1 (SNoL_SNoS y Hy u1 Hu1).
            assume _ _ _ IHy3 _.
            exact IHy3 u0 Hu0 v1 Hv1u1.
          - assume Hu1v1: u1 :e SNoL v1. apply L3v1imp.
            prove x * u1 + u0 * v1 < x * v1 + u0 * u1.
            rewrite add_SNo_com (x * u1) (u0 * v1) Lxu1 Lu0v1.
            apply IHy v1 (SNoL_SNoS y Hy v1 Hv1).
            assume _ IHy1 _ _ _.
            exact IHy1 u0 Hu0 u1 Hu1v1.
        }
    + let u0. assume Hu0. let u1. assume Hu1 Hue.
      apply SNoR_E x Hx u0 Hu0.
      assume Hu0a: SNo u0.
      assume Hu0b: SNoLev u0 :e SNoLev x.
      assume Hu0c: x < u0.
      apply SNoR_E y Hy u1 Hu1.
      assume Hu1a: SNo u1.
      assume Hu1b: SNoLev u1 :e SNoLev y.
      assume Hu1c: y < u1.
      apply HRE v Hv.
      * { let v0. assume Hv0. let v1. assume Hv1 Hve.
          apply SNoL_E x Hx v0 Hv0.
          assume Hv0a: SNo v0.
          assume Hv0b: SNoLev v0 :e SNoLev x.
          assume Hv0c: v0 < x.
          apply SNoR_E y Hy v1 Hv1.
          assume Hv1a: SNo v1.
          assume Hv1b: SNoLev v1 :e SNoLev y.
          assume Hv1c: y < v1.
          apply Luvimp u0 (SNoR_SNoS x Hx u0 Hu0) v0 (SNoL_SNoS x Hx v0 Hv0)
                       u1 (SNoR_SNoS y Hy u1 Hu1) v1 (SNoR_SNoS y Hy v1 Hv1).
          assume Lu0y Lxu1 Lu0u1 Lv0y Lxv1 Lv0v1 Lu0v1 Lv0u1 Luv.
          apply Luv Hue Hve.
          prove u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          claim Lv0u0lt: v0 < u0.
          { exact SNoLt_tra v0 x u0 Hv0a Hx Hu0a Hv0c Hu0c. }
          claim L3: forall z :e SNoR y, u0 * y + v0 * z < v0 * y + u0 * z.
          { let z. assume Hz.
            apply SNoR_E y Hy z Hz.
            assume Hza: SNo z.
            assume Hzb: SNoLev z :e SNoLev y.
            assume Hzc: y < z.
            claim Lu0z: SNo (u0 * z).
            { exact LRx u0 Hu0 z Hza. }
            claim Lv0z: SNo (v0 * z).
            { exact LLx v0 Hv0 z Hza. }
            apply SNoLt_SNoL_or_SNoR_impred v0 u0 Hv0a Hu0a Lv0u0lt.
            - let w.
              assume Hwu0: w :e SNoL u0.
              assume Hwv0: w :e SNoR v0.
              apply SNoL_E u0 Hu0a w Hwu0.
              assume Hwu0a: SNo w.
              assume Hwu0b: SNoLev w :e SNoLev u0.
              assume Hwu0c: w < u0.
              claim LLevwLevx: SNoLev w :e SNoLev x.
              { exact ordinal_TransSet (SNoLev x) (SNoLev_ordinal x Hx) (SNoLev u0) Hu0b (SNoLev w) Hwu0b. }
              claim LwSx: w :e SNoS_ (SNoLev x).
              { exact SNoS_I2 w x Hwu0a Hx LLevwLevx. }
              claim Lwz: SNo (w * z).
              { apply IHx w LwSx z Hza. assume H _ _ _ _. exact H. }
              claim Lwy: SNo (w * y).
              { apply IHx w LwSx y Hy. assume H _ _ _ _. exact H. }
              claim L3a: u0 * y + w * z < u0 * z + w * y.
              { rewrite add_SNo_com (u0 * z) (w * y) Lu0z Lwy.
                apply IHx u0 (SNoR_SNoS x Hx u0 Hu0) y Hy.
                assume _ _ _ IHx3 _.
                exact IHx3 w Hwu0 z Hz.
              }
              claim L3b: v0 * z + w * y < v0 * y + w * z.
              { rewrite add_SNo_com (v0 * z) (w * y) Lv0z Lwy.
                apply IHx v0 (SNoL_SNoS x Hx v0 Hv0) y Hy.
                assume _ _ IHx2 _ _.
                exact IHx2 w Hwv0 z Hz.
              }
              rewrite add_SNo_com (v0 * y) (u0 * z) Lv0y Lu0z.
              exact add_SNo_Lt_subprop2 (u0 * y) (v0 * z) (u0 * z) (v0 * y) (w * z) (w * y)
                       Lu0y Lv0z Lu0z Lv0y Lwz Lwy
                       L3a L3b.
            - assume Hv0u0: v0 :e SNoL u0.
              apply IHx u0 (SNoR_SNoS x Hx u0 Hu0) y Hy.
              assume _ _ _ IHx3 _.
              exact IHx3 v0 Hv0u0 z Hz.
            - assume Hu0v0: u0 :e SNoR v0.
              apply IHx v0 (SNoL_SNoS x Hx v0 Hv0) y Hy.
              assume _ _ IHx2 _ _.
              exact IHx2 u0 Hu0v0 z Hz.
          }
          claim L3u1: u0 * y + v0 * u1 < v0 * y + u0 * u1.
          { exact L3 u1 Hu1. }
          claim L3v1: u0 * y + v0 * v1 < v0 * y + u0 * v1.
          { exact L3 v1 Hv1. }
          claim L3u1imp: x * u1 + v0 * v1 < v0 * u1 + x * v1 -> u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          { exact add_SNo_Lt_subprop3b (u0 * y) (x * u1 + v0 * v1) (v0 * y) (x * v1) (u0 * u1) (v0 * u1)
                            Lu0y (SNo_add_SNo (x * u1) (v0 * v1) Lxu1 Lv0v1) Lv0y Lxv1 Lu0u1 Lv0u1
                            L3u1.
          }
          claim L3v1imp: x * u1 + u0 * v1 < x * v1 + u0 * u1 -> u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          { exact add_SNo_Lt_subprop3a (u0 * y) (x * u1) (v0 * v1) (v0 * y) (x * v1 + u0 * u1) (u0 * v1)
                            Lu0y Lxu1 Lv0v1 Lv0y (SNo_add_SNo (x * v1) (u0 * u1) Lxv1 Lu0u1) Lu0v1 L3v1.
          }
          apply SNoL_or_SNoR_impred v1 u1 Hv1a Hu1a.
          - assume Hv1u1: v1 = u1. rewrite Hv1u1.
            prove u0 * y + x * u1 + v0 * u1 < v0 * y + x * u1 + u0 * u1.
            rewrite add_SNo_com_3_0_1 (u0 * y) (x * u1) (v0 * u1) Lu0y Lxu1 Lv0u1.
            rewrite add_SNo_com_3_0_1 (v0 * y) (x * u1) (u0 * u1) Lv0y Lxu1 Lu0u1.
            apply add_SNo_Lt2 (x * u1) (u0 * y + v0 * u1) (v0 * y + u0 * u1) Lxu1 (SNo_add_SNo (u0 * y) (v0 * u1) Lu0y Lv0u1) (SNo_add_SNo (v0 * y) (u0 * u1) Lv0y Lu0u1).
            prove u0 * y + v0 * u1 < v0 * y + u0 * u1.
            exact L3u1.
          - let z.
            assume Hzu1: z :e SNoL u1.
            assume Hzv1: z :e SNoR v1.
            apply SNoR_E v1 Hv1a z Hzv1.
            assume Hza: SNo z.
            assume Hzb: SNoLev z :e SNoLev v1.
            assume Hzc: v1 < z.
            claim Lz: z :e SNoR y.
            { apply SNoR_I y Hy z Hza.
              - prove SNoLev z :e SNoLev y.
                exact ordinal_TransSet (SNoLev y) (SNoLev_ordinal y Hy) (SNoLev v1) Hv1b (SNoLev z) Hzb.
              - prove y < z. exact SNoLt_tra y v1 z Hy Hv1a Hza Hv1c Hzc.
            }
            claim L4: x * u1 + u0 * z < x * z + u0 * u1.
            { rewrite add_SNo_com (x * z) (u0 * u1) (LxRy z Lz) Lu0u1.
              apply IHy u1 (SNoR_SNoS y Hy u1 Hu1).
              assume _ _ _ _ IHy4.
              exact IHy4 u0 Hu0 z Hzu1.
            }
            claim L5: x * z + u0 * v1 < x * v1 + u0 * z.
            { rewrite add_SNo_com (x * z) (u0 * v1) (LxRy z Lz) Lu0v1.
              apply IHy v1 (SNoR_SNoS y Hy v1 Hv1).
              assume _ _ IHy2 _ _.
              exact IHy2 u0 Hu0 z Hzv1.
            }
            prove u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
            rewrite add_SNo_com_3_0_1 (u0 * y) (x * u1) (v0 * v1) Lu0y Lxu1 Lv0v1.
            rewrite add_SNo_com_3_0_1 (v0 * y) (x * v1) (u0 * u1) Lv0y Lxv1 Lu0u1.
            prove x * u1 + u0 * y + v0 * v1 < x * v1 + v0 * y + u0 * u1.
            apply add_SNo_Lt_subprop3d (x * u1) (u0 * y + v0 * v1) (x * v1) (v0 * y) (u0 * u1) (u0 * z) (x * z) (u0 * v1)
                                       Lxu1 
                                       (SNo_add_SNo (u0 * y) (v0 * v1) Lu0y Lv0v1)
                                       Lxv1 Lv0y Lu0u1
                                       (LRx u0 Hu0 z Hza)
                                       (LxRy z Lz)
                                       Lu0v1
                                       L4.
            + prove u0 * y + v0 * v1 < u0 * v1 + v0 * y.
              rewrite add_SNo_com (u0 * v1) (v0 * y) Lu0v1 Lv0y.
              exact L3v1.
            + exact L5.
          - assume Hv1u1: v1 :e SNoL u1. apply L3v1imp.
            prove x * u1 + u0 * v1 < x * v1 + u0 * u1.
            rewrite add_SNo_com (x * v1) (u0 * u1) Lxv1 Lu0u1.
            prove x * u1 + u0 * v1 < u0 * u1 + x * v1.
            apply IHy u1 (SNoR_SNoS y Hy u1 Hu1).
            assume _ _ _ _ IHy4.
            exact IHy4 u0 Hu0 v1 Hv1u1.
          - assume Hu1v1: u1 :e SNoR v1. apply L3v1imp.
            prove x * u1 + u0 * v1 < x * v1 + u0 * u1.
            rewrite add_SNo_com (x * u1) (u0 * v1) Lxu1 Lu0v1.
            apply IHy v1 (SNoR_SNoS y Hy v1 Hv1).
            assume _ _ IHy2 _ _.
            exact IHy2 u0 Hu0 u1 Hu1v1.
          - let z.
            assume Hzu1: z :e SNoR u1.
            assume Hzv1: z :e SNoL v1.
            apply SNoR_E u1 Hu1a z Hzu1.
            assume Hza: SNo z.
            assume Hzb: SNoLev z :e SNoLev u1.
            assume Hzc: u1 < z.
            claim Lz: z :e SNoR y.
            { apply SNoR_I y Hy z Hza.
              - prove SNoLev z :e SNoLev y.
                exact ordinal_TransSet (SNoLev y) (SNoLev_ordinal y Hy) (SNoLev u1) Hu1b (SNoLev z) Hzb.
              - prove y < z. exact SNoLt_tra y u1 z Hy Hu1a Hza Hu1c Hzc.
            }
            claim L6: x * u1 + v0 * z < x * z + v0 * u1.
            { rewrite add_SNo_com (x * z) (v0 * u1) (LxRy z Lz) Lv0u1.
              prove x * u1 + v0 * z < v0 * u1 + x * z.
              apply IHy u1 (SNoR_SNoS y Hy u1 Hu1).
              assume _ _ _ IHy3 _.
              exact IHy3 v0 Hv0 z Hzu1.
            }
            claim L7: x * z + v0 * v1 < x * v1 + v0 * z.
            { rewrite add_SNo_com (x * z) (v0 * v1) (LxRy z Lz) Lv0v1.
              apply IHy v1 (SNoR_SNoS y Hy v1 Hv1).
              assume _ IHy1 _ _ _.
              exact IHy1 v0 Hv0 z Hzv1.
            }
            prove u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
            rewrite add_SNo_com_3_0_1 (u0 * y) (x * u1) (v0 * v1) Lu0y Lxu1 Lv0v1.
            rewrite add_SNo_com_3_0_1 (v0 * y) (x * v1) (u0 * u1) Lv0y Lxv1 Lu0u1.
            prove x * u1 + u0 * y + v0 * v1 < x * v1 + v0 * y + u0 * u1.
            exact add_SNo_Lt_subprop3c (x * u1) (u0 * y) (v0 * v1) (x * v1) (v0 * y + u0 * u1) (v0 * z) (x * z) (v0 * u1)
                       Lxu1 Lu0y Lv0v1
                       Lxv1 (SNo_add_SNo (v0 * y) (u0 * u1) Lv0y Lu0u1)
                       (LLx v0 Hv0 z Hza) (LxRy z Lz) Lv0u1 L6 L3u1 L7.
          - assume Hv1u1: v1 :e SNoR u1. apply L3u1imp.
            prove x * u1 + v0 * v1 < v0 * u1 + x * v1.
            apply IHy u1 (SNoR_SNoS y Hy u1 Hu1).
            assume _ _ _ IHy3 _.
            exact IHy3 v0 Hv0 v1 Hv1u1.
          - assume Hu1v1: u1 :e SNoL v1. apply L3u1imp.
            prove x * u1 + v0 * v1 < v0 * u1 + x * v1.
            rewrite add_SNo_com (x * u1) (v0 * v1) Lxu1 Lv0v1.
            rewrite add_SNo_com (v0 * u1) (x * v1) Lv0u1 Lxv1.
            apply IHy v1 (SNoR_SNoS y Hy v1 Hv1).
            assume _ IHy1 _ _ _.
            exact IHy1 v0 Hv0 u1 Hu1v1.
        }
      * { let v0. assume Hv0. let v1. assume Hv1 Hve.
          apply SNoR_E x Hx v0 Hv0.
          assume Hv0a: SNo v0.
          assume Hv0b: SNoLev v0 :e SNoLev x.
          assume Hv0c: x < v0.
          apply SNoL_E y Hy v1 Hv1.
          assume Hv1a: SNo v1.
          assume Hv1b: SNoLev v1 :e SNoLev y.
          assume Hv1c: v1 < y.
          apply Luvimp u0 (SNoR_SNoS x Hx u0 Hu0) v0 (SNoR_SNoS x Hx v0 Hv0)
                       u1 (SNoR_SNoS y Hy u1 Hu1) v1 (SNoL_SNoS y Hy v1 Hv1).
          assume Lu0y Lxu1 Lu0u1 Lv0y Lxv1 Lv0v1 Lu0v1 Lv0u1 Luv.
          apply Luv Hue Hve.
          prove u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          claim Lv1u1lt: v1 < u1.
          { exact SNoLt_tra v1 y u1 Hv1a Hy Hu1a Hv1c Hu1c. }
          claim L3: forall z :e SNoR x, x * u1 + z * v1 < z * u1 + x * v1.
          { let z. assume Hz.
            claim Lzu1: SNo (z * u1).
            { exact LRx z Hz u1 Hu1a. }
            claim Lzv1: SNo (z * v1).
            { exact LRx z Hz v1 Hv1a. }
            apply SNoLt_SNoL_or_SNoR_impred v1 u1 Hv1a Hu1a Lv1u1lt.
            - let w.
              assume Hwu1: w :e SNoL u1.
              assume Hwv1: w :e SNoR v1.
              apply SNoL_E u1 Hu1a w Hwu1.
              assume Hwu1a: SNo w.
              assume Hwu1b: SNoLev w :e SNoLev u1.
              assume Hwu1c: w < u1.
              claim LwSy: w :e SNoS_ (SNoLev y).
              { apply SNoS_I2 w y Hwu1a Hy.
                prove SNoLev w :e SNoLev y.
                exact ordinal_TransSet (SNoLev y) (SNoLev_ordinal y Hy) (SNoLev u1) Hu1b (SNoLev w) Hwu1b.
              }
              claim Lzw: SNo (z * w).
              { exact LRx z Hz w Hwu1a. }
              claim Lxw: SNo (x * w).
              { apply IHy w LwSy. assume H1 _ _ _ _. exact H1. }
              claim L3a: z * v1 + x * w < x * v1 + z * w.
              { apply IHy v1 (SNoL_SNoS y Hy v1 Hv1).
                assume _ _ IHy2 _ _.
                exact IHy2 z Hz w Hwv1.
              }
              claim L3b: x * u1 + z * w < z * u1 + x * w.
              { apply IHy u1 (SNoR_SNoS y Hy u1 Hu1).
                assume _ _ _ _ IHy4.
                exact IHy4 z Hz w Hwu1.
              }
              exact add_SNo_Lt_subprop2 (x * u1) (z * v1) (z * u1) (x * v1) (z * w) (x * w)
                       Lxu1 Lzv1 Lzu1 Lxv1 Lzw Lxw
                       L3b L3a.
            - assume Hv1u1: v1 :e SNoL u1.
              apply IHy u1 (SNoR_SNoS y Hy u1 Hu1).
              assume _ _ _ _ IHy4.
              exact IHy4 z Hz v1 Hv1u1.
            - assume Hu1v1: u1 :e SNoR v1.
              apply IHy v1 (SNoL_SNoS y Hy v1 Hv1).
              assume _ _ IHy2 _ _.
              rewrite add_SNo_com (x * u1) (z * v1) Lxu1 Lzv1.
              rewrite add_SNo_com (z * u1) (x * v1) Lzu1 Lxv1.
              prove z * v1 + x * u1 < x * v1 + z * u1.
              exact IHy2 z Hz u1 Hu1v1.
          }
          claim L3u0: x * u1 + u0 * v1 < u0 * u1 + x * v1.
          { exact L3 u0 Hu0. }
          claim L3v0: x * u1 + v0 * v1 < v0 * u1 + x * v1.
          { exact L3 v0 Hv0. }
          claim L3u0imp: u0 * y + v0 * v1 < v0 * y + u0 * v1 -> u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          { assume H1.
            apply add_SNo_Lt_subprop3a (u0 * y) (x * u1) (v0 * v1) (v0 * y) (x * v1 + u0 * u1) (u0 * v1)
                            Lu0y Lxu1 Lv0v1 Lv0y
                            (SNo_add_SNo (x * v1) (u0 * u1) Lxv1 Lu0u1)
                            Lu0v1 H1.
            prove x * u1 + u0 * v1 < x * v1 + u0 * u1.
            rewrite add_SNo_com (x * v1) (u0 * u1) Lxv1 Lu0u1.
            exact L3u0.
          }
          claim L3v0imp: u0 * y + v0 * u1 < v0 * y + u0 * u1 -> u0 * y + x * u1 + v0 * v1 < v0 * y + x * v1 + u0 * u1.
          { assume H1.
            apply add_SNo_Lt_subprop3b (u0 * y) (x * u1 + v0 * v1) (v0 * y) (x * v1) (u0 * u1) (v0 * u1)
                            Lu0y
                            (SNo_add_SNo (x * u1) (v0 * v1) Lxu1 Lv0v1)
                            Lv0y Lxv1 Lu0u1 Lv0u1.
            - prove u0 * y + v0 * u1 < v0 * y + u0 * u1. exact H1.
            - prove x * u1 + v0 * v1 < v0 * u1 + x * v1. exact L3v0.
          }
          apply SNoL_or_SNoR_impred v0 u0 Hv0a Hu0a.
          - assume Hv0u0: v0 = u0. rewrite Hv0u0.
            prove u0 * y + (x * u1 + u0 * v1) < u0 * y + (x * v1 + u0 * u1).
            apply add_SNo_Lt2 (u0 * y) (x * u1 + u0 * v1) (x * v1 + u0 * u1)
                              Lu0y
                              (SNo_add_SNo (x * u1) (u0 * v1) Lxu1 Lu0v1)
                              (SNo_add_SNo (x * v1) (u0 * u1) Lxv1 Lu0u1).
            prove x * u1 + u0 * v1 < x * v1 + u0 * u1.
            rewrite add_SNo_com (x * v1) (u0 * u1) Lxv1 Lu0u1.
            exact L3u0.
          - let z.
            assume Hzu0: z :e SNoL u0.
            assume Hzv0: z :e SNoR v0.
            apply SNoR_E v0 Hv0a z Hzv0.
            assume Hza: SNo z.
            assume Hzb: SNoLev z :e SNoLev v0.
            assume Hzc: v0 < z.
            claim Lz: z :e SNoR x.
            { apply SNoR_I x Hx z Hza.
              - prove SNoLev z :e SNoLev x.
                exact ordinal_TransSet (SNoLev x) (SNoLev_ordinal x Hx) (SNoLev v0) Hv0b (SNoLev z) Hzb.
              - prove x < z. exact SNoLt_tra x v0 z Hx Hv0a Hza Hv0c Hzc.
            }
            claim L4: u0 * y + z * u1 < z * y + u0 * u1.
            { apply IHx u0 (SNoR_SNoS x Hx u0 Hu0) y Hy.
              assume _ _ _ IHx3 _.
              exact IHx3 z Hzu0 u1 Hu1.
            }
            claim L5: z * y + v0 * u1 < v0 * y + z * u1.
            { apply IHx v0 (SNoR_SNoS x Hx v0 Hv0) y Hy.
              assume _ _ IHx2 _ _.
              exact IHx2 z Hzv0 u1 Hu1.
            }
            exact add_SNo_Lt_subprop3d (u0 * y) (x * u1 + v0 * v1) (v0 * y) (x * v1) (u0 * u1) (z * u1) (z * y) (v0 * u1)
                                       Lu0y
                                       (SNo_add_SNo (x * u1) (v0 * v1) Lxu1 Lv0v1)
                                       Lv0y Lxv1 Lu0u1
                                       (LRx z Lz u1 Hu1a) (LRxy z Lz)
                                       Lv0u1 L4 L3v0 L5.
          - assume Hv0u0: v0 :e SNoL u0. apply L3v0imp.
            prove u0 * y + v0 * u1 < v0 * y + u0 * u1.
            apply IHx u0 (SNoR_SNoS x Hx u0 Hu0) y Hy.
            assume _ _ _ IHx3 _.
            exact IHx3 v0 Hv0u0 u1 Hu1.
          - assume Hu0v0: u0 :e SNoR v0. apply L3v0imp.
            prove u0 * y + v0 * u1 < v0 * y + u0 * u1.
            apply IHx v0 (SNoR_SNoS x Hx v0 Hv0) y Hy.
            assume _ _ IHx2 _ _.
            exact IHx2 u0 Hu0v0 u1 Hu1.
          - let z.
            assume Hzu0: z :e SNoR u0.
            assume Hzv0: z :e SNoL v0.
            apply SNoR_E u0 Hu0a z Hzu0.
            assume Hza: SNo z.
            assume Hzb: SNoLev z :e SNoLev u0.
            assume Hzc: u0 < z.
            claim Lz: z :e SNoR x.
            { apply SNoR_I x Hx z Hza.
              - prove SNoLev z :e SNoLev x.
                exact ordinal_TransSet (SNoLev x) (SNoLev_ordinal x Hx) (SNoLev u0) Hu0b (SNoLev z) Hzb.
              - prove x < z. exact SNoLt_tra x u0 z Hx Hu0a Hza Hu0c Hzc.
            }
            claim L6: u0 * y + z * v1 < z * y + u0 * v1.
            { apply IHx u0 (SNoR_SNoS x Hx u0 Hu0) y Hy.
              assume _ _ _ _ IHx4.
              exact IHx4 z Hzu0 v1 Hv1.
            }
            claim L7: z * y + v0 * v1 < v0 * y + z * v1.
            { apply IHx v0 (SNoR_SNoS x Hx v0 Hv0) y Hy.
              assume _ IHx1 _ _ _.
              exact IHx1 z Hzv0 v1 Hv1.
            }
            apply add_SNo_Lt_subprop3c (u0 * y) (x * u1) (v0 * v1) (v0 * y) (x * v1 + u0 * u1) (z * v1) (z * y) (u0 * v1)
                       Lu0y Lxu1 Lv0v1 Lv0y
                       (SNo_add_SNo (x * v1) (u0 * u1) Lxv1 Lu0u1)
                       (LRx z Lz v1 Hv1a) (LRxy z Lz)
                       Lu0v1 L6.
            + prove x * u1 + u0 * v1 < x * v1 + u0 * u1.
              rewrite add_SNo_com (x * v1) (u0 * u1) Lxv1 Lu0u1.
              exact L3u0.
            + prove z * y + v0 * v1 < v0 * y + z * v1.
              exact L7.
          - assume Hv0u0: v0 :e SNoR u0. apply L3u0imp.
            prove u0 * y + v0 * v1 < v0 * y + u0 * v1.
            apply IHx u0 (SNoR_SNoS x Hx u0 Hu0) y Hy.
            assume _ _ _ _ IHx4.
            exact IHx4 v0 Hv0u0 v1 Hv1.
          - assume Hu0v0: u0 :e SNoL v0. apply L3u0imp.
            prove u0 * y + v0 * v1 < v0 * y + u0 * v1.
            apply IHx v0 (SNoR_SNoS x Hx v0 Hv0) y Hy.
            assume _ IHx1 _ _ _.
            exact IHx1 u0 Hu0v0 v1 Hv1.
        }
}
claim Lxy: SNo (x * y).
{ rewrite Hxy. prove SNo (SNoCut L R). exact SNoCutP_SNo_SNoCut L R LLR1. }
let p. assume Hp. prove p. apply Hp.
- exact Lxy.
- prove forall u :e SNoL x, forall v :e SNoL y, u * y + x * v < x * y + u * v.
  let u. assume Hu. let v. assume Hv.
  apply SNoL_E y Hy v Hv.
  assume Hva _ _.
  prove u * y + x * v < x * y + u * v.
  claim L1: u * y + x * v + - u * v < x * y.
  { rewrite Hxy.
    prove u * y + x * v + - u * v < SNoCut L R.
    apply SNoCutP_SNoCut_L L R LLR1.
    prove u * y + x * v + - u * v :e L.
    exact HLI1 u Hu v Hv.
  }
  apply add_SNo_minus_Lt1 (u * y + x * v) (u * v) (x * y).
  + exact SNo_add_SNo (u * y) (x * v) (LLx u Hu y Hy) (LxLy v Hv).
  + exact LLx u Hu v Hva.
  + exact Lxy.
  + prove (u * y + x * v) + - u * v < x * y.
    rewrite <- add_SNo_assoc (u * y) (x * v) (- (u * v)) (LLx u Hu y Hy) (LxLy v Hv) (SNo_minus_SNo (u * v) (LLx u Hu v Hva)).
    exact L1.
- prove forall u :e SNoR x, forall v :e SNoR y, u * y + x * v < x * y + u * v.
  let u. assume Hu. let v. assume Hv.
  apply SNoR_E y Hy v Hv.
  assume Hva _ _.
  prove u * y + x * v < x * y + u * v.
  claim L1: u * y + x * v + - u * v < x * y.
  { rewrite Hxy.
    prove u * y + x * v + - u * v < SNoCut L R.
    apply SNoCutP_SNoCut_L L R LLR1.
    prove u * y + x * v + - u * v :e L.
    exact HLI2 u Hu v Hv.
  }
  apply add_SNo_minus_Lt1 (u * y + x * v) (u * v) (x * y).
  + exact SNo_add_SNo (u * y) (x * v) (LRx u Hu y Hy) (LxRy v Hv).
  + exact LRx u Hu v Hva.
  + exact Lxy.
  + prove (u * y + x * v) + - u * v < x * y.
    rewrite <- add_SNo_assoc (u * y) (x * v) (- (u * v)) (LRx u Hu y Hy) (LxRy v Hv) (SNo_minus_SNo (u * v) (LRx u Hu v Hva)).
    exact L1.
- prove forall u :e SNoL x, forall v :e SNoR y, x * y + u * v < u * y + x * v.
  let u. assume Hu. let v. assume Hv.
  apply SNoR_E y Hy v Hv.
  assume Hva _ _.
  prove x * y + u * v < u * y + x * v.
  claim L1: x * y < u * y + x * v + - u * v.
  { rewrite Hxy.
    prove SNoCut L R < u * y + x * v + - u * v.
    apply SNoCutP_SNoCut_R L R LLR1.
    prove u * y + x * v + - u * v :e R.
    exact HRI1 u Hu v Hv.
  }
  apply add_SNo_minus_Lt2 (u * y + x * v) (u * v) (x * y).
  + exact SNo_add_SNo (u * y) (x * v) (LLx u Hu y Hy) (LxRy v Hv).
  + exact LLx u Hu v Hva.
  + exact Lxy.
  + prove x * y < (u * y + x * v) + - u * v.
    rewrite <- add_SNo_assoc (u * y) (x * v) (- (u * v)) (LLx u Hu y Hy) (LxRy v Hv) (SNo_minus_SNo (u * v) (LLx u Hu v Hva)).
    exact L1.
- prove forall u :e SNoR x, forall v :e SNoL y, x * y + u * v < u * y + x * v.
  let u. assume Hu. let v. assume Hv.
  apply SNoL_E y Hy v Hv.
  assume Hva _ _.
  prove x * y + u * v < u * y + x * v.
  claim L1: x * y < u * y + x * v + - u * v.
  { rewrite Hxy.
    prove SNoCut L R < u * y + x * v + - u * v.
    apply SNoCutP_SNoCut_R L R LLR1.
    prove u * y + x * v + - u * v :e R.
    exact HRI2 u Hu v Hv.
  }
  apply add_SNo_minus_Lt2 (u * y + x * v) (u * v) (x * y).
  + exact SNo_add_SNo (u * y) (x * v) (LRx u Hu y Hy) (LxLy v Hv).
  + exact LRx u Hu v Hva.
  + exact Lxy.
  + prove x * y < (u * y + x * v) + - u * v.
    rewrite <- add_SNo_assoc (u * y) (x * v) (- (u * v)) (LRx u Hu y Hy) (LxLy v Hv) (SNo_minus_SNo (u * v) (LRx u Hu v Hva)).
    exact L1.
Qed.

Theorem SNo_mul_SNo : forall x y, SNo x -> SNo y -> SNo (x * y).
let x y. assume Hx Hy. apply mul_SNo_prop_1 x Hx y Hy.
assume H _ _ _ _. exact H.
Qed.

Theorem SNo_mul_SNo_lem : forall x y u v, SNo x -> SNo y -> SNo u -> SNo v -> SNo (u * y + x * v + - (u * v)).
let x y u v. assume Hx Hy Hu Hv.
apply SNo_add_SNo_3c.
- apply SNo_mul_SNo.
  + exact Hu.
  + exact Hy.
- apply SNo_mul_SNo.
  + exact Hx.
  + exact Hv.
- apply SNo_mul_SNo.
  + exact Hu.
  + exact Hv.
Qed.

Theorem SNo_mul_SNo_3 : forall x y z, SNo x -> SNo y -> SNo z -> SNo (x * y * z).
let x y z. assume Hx Hy Hz.
apply SNo_mul_SNo.
- exact Hx.
- apply SNo_mul_SNo.
  + exact Hy.
  + exact Hz.
Qed.

Theorem mul_SNo_eq_3 : forall x y, SNo x -> SNo y ->
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
let x y. assume Hx Hy. let p. assume Hp.
apply mul_SNo_eq_2 x y Hx Hy.
let L R.
assume HLE HLI1 HLI2 HRE HRI1 HRI2 He.
apply mul_SNo_prop_1 x Hx y Hy.
assume Hxy: SNo (x * y).
assume Hxy1: forall u :e SNoL x, forall v :e SNoL y, u * y + x * v < x * y + u * v.
assume Hxy2: forall u :e SNoR x, forall v :e SNoR y, u * y + x * v < x * y + u * v.
assume Hxy3: forall u :e SNoL x, forall v :e SNoR y, x * y + u * v < u * y + x * v.
assume Hxy4: forall u :e SNoR x, forall v :e SNoL y, x * y + u * v < u * y + x * v.
claim LLR: SNoCutP L R.
{ prove (forall w :e L, SNo w)
     /\ (forall z :e R, SNo z)
     /\ (forall w :e L, forall z :e R, w < z).
  apply and3I.
  - let w. assume Hw. prove SNo w.
    apply HLE w Hw.
    + let u. assume Hu. let v. assume Hv Hwe.
      apply SNoL_E x Hx u Hu.
      assume Hua _ _.
      apply SNoL_E y Hy v Hv.
      assume Hva _ _.
      rewrite Hwe.
      prove SNo (u * y + x * v + - u * v).
      apply SNo_mul_SNo_lem.
      * exact Hx.
      * exact Hy.
      * exact Hua.
      * exact Hva.
    + let u. assume Hu. let v. assume Hv Hwe.
      apply SNoR_E x Hx u Hu.
      assume Hua _ _.
      apply SNoR_E y Hy v Hv.
      assume Hva _ _.
      rewrite Hwe.
      prove SNo (u * y + x * v + - u * v).
      apply SNo_mul_SNo_lem.
      * exact Hx.
      * exact Hy.
      * exact Hua.
      * exact Hva.
  - let z. assume Hz. prove SNo z.
    apply HRE z Hz.
    + let u. assume Hu. let v. assume Hv Hze.
      apply SNoL_E x Hx u Hu.
      assume Hua _ _.
      apply SNoR_E y Hy v Hv.
      assume Hva _ _.
      rewrite Hze.
      prove SNo (u * y + x * v + - u * v).
      apply SNo_mul_SNo_lem.
      * exact Hx.
      * exact Hy.
      * exact Hua.
      * exact Hva.
    + let u. assume Hu. let v. assume Hv Hze.
      apply SNoR_E x Hx u Hu.
      assume Hua _ _.
      apply SNoL_E y Hy v Hv.
      assume Hva _ _.
      rewrite Hze.
      prove SNo (u * y + x * v + - u * v).
      apply SNo_mul_SNo_lem.
      * exact Hx.
      * exact Hy.
      * exact Hua.
      * exact Hva.
  - let w. assume Hw. let z. assume Hz. prove w < z.
    apply HLE w Hw.
    + let u. assume Hu. let v. assume Hv Hwe.
      apply SNoL_E x Hx u Hu.
      assume Hua: SNo u. assume _ _.
      apply SNoL_E y Hy v Hv.
      assume Hva: SNo v. assume _ _.
      claim Luy: SNo (u * y).
      { exact SNo_mul_SNo u y Hua Hy. }
      claim Lxv: SNo (x * v).
      { exact SNo_mul_SNo x v Hx Hva. }
      claim Luv: SNo (u * v).
      { exact SNo_mul_SNo u v Hua Hva. }
      apply HRE z Hz.
      * { let u'. assume Hu'. let v'. assume Hv' Hze.
          apply SNoL_E x Hx u' Hu'.
          assume Hu'a: SNo u'. assume _ _.
          apply SNoR_E y Hy v' Hv'.
          assume Hv'a: SNo v'. assume _ _.
          claim Lu'y: SNo (u' * y).
          { exact SNo_mul_SNo u' y Hu'a Hy. }
          claim Lxv': SNo (x * v').
          { exact SNo_mul_SNo x v' Hx Hv'a. }
          claim Lu'v': SNo (u' * v').
          { exact SNo_mul_SNo u' v' Hu'a Hv'a. }
          rewrite Hwe. rewrite Hze.
          prove u * y + x * v + - u * v < u' * y + x * v' + - u' * v'.
          apply add_SNo_minus_Lt_lem (u * y) (x * v) (u * v) (u' * y) (x * v') (u' * v') Luy Lxv Luv Lu'y Lxv' Lu'v'.
          prove u * y + x * v + u' * v' < u' * y + x * v' + u * v.
          apply SNoLt_tra (u * y + x * v + u' * v')
                          (x * y + u * v + u' * v')
                          (u' * y + x * v' + u * v)
                          (SNo_add_SNo_3 (u * y) (x * v) (u' * v') Luy Lxv Lu'v')
                          (SNo_add_SNo_3 (x * y) (u * v) (u' * v') Hxy Luv Lu'v')
                          (SNo_add_SNo_3 (u' * y) (x * v') (u * v) Lu'y Lxv' Luv).
          - prove u * y + x * v + u' * v' < x * y + u * v + u' * v'.
            apply add_SNo_3_3_3_Lt1 (u * y) (x * v) (x * y) (u * v) (u' * v') Luy Lxv Hxy Luv Lu'v'.
            prove u * y + x * v < x * y + u * v.
            exact Hxy1 u Hu v Hv.
          - prove x * y + u * v + u' * v' < u' * y + x * v' + u * v.
            apply add_SNo_3_2_3_Lt1 (x * y) (u' * v') (u' * y) (x * v') (u * v) Hxy Lu'v' Lu'y Lxv' Luv.
            prove u' * v' + x * y < u' * y + x * v'.
            rewrite add_SNo_com (u' * v') (x * y) Lu'v' Hxy.
            exact Hxy3 u' Hu' v' Hv'.
        }
      * { let u'. assume Hu'. let v'. assume Hv' Hze.
          apply SNoR_E x Hx u' Hu'.
          assume Hu'a: SNo u'. assume _ _.
          apply SNoL_E y Hy v' Hv'.
          assume Hv'a: SNo v'. assume _ _.
          claim Lu'y: SNo (u' * y).
          { exact SNo_mul_SNo u' y Hu'a Hy. }
          claim Lxv': SNo (x * v').
          { exact SNo_mul_SNo x v' Hx Hv'a. }
          claim Lu'v': SNo (u' * v').
          { exact SNo_mul_SNo u' v' Hu'a Hv'a. }
          rewrite Hwe. rewrite Hze.
          prove u * y + x * v + - u * v < u' * y + x * v' + - u' * v'.
          apply add_SNo_minus_Lt_lem (u * y) (x * v) (u * v) (u' * y) (x * v') (u' * v') Luy Lxv Luv Lu'y Lxv' Lu'v'.
          prove u * y + x * v + u' * v' < u' * y + x * v' + u * v.
          apply SNoLt_tra (u * y + x * v + u' * v')
                          (x * y + u * v + u' * v')
                          (u' * y + x * v' + u * v)
                          (SNo_add_SNo_3 (u * y) (x * v) (u' * v') Luy Lxv Lu'v')
                          (SNo_add_SNo_3 (x * y) (u * v) (u' * v') Hxy Luv Lu'v')
                          (SNo_add_SNo_3 (u' * y) (x * v') (u * v) Lu'y Lxv' Luv).
          - prove u * y + x * v + u' * v' < x * y + u * v + u' * v'.
            apply add_SNo_3_3_3_Lt1 (u * y) (x * v) (x * y) (u * v) (u' * v') Luy Lxv Hxy Luv Lu'v'.
            prove u * y + x * v < x * y + u * v.
            exact Hxy1 u Hu v Hv.
          - prove x * y + u * v + u' * v' < u' * y + x * v' + u * v.
            apply add_SNo_3_2_3_Lt1 (x * y) (u' * v') (u' * y) (x * v') (u * v) Hxy Lu'v' Lu'y Lxv' Luv.
            prove u' * v' + x * y < u' * y + x * v'.
            rewrite add_SNo_com (u' * v') (x * y) Lu'v' Hxy.
            exact Hxy4 u' Hu' v' Hv'.
        }
    + let u. assume Hu. let v. assume Hv Hwe.
      apply SNoR_E x Hx u Hu.
      assume Hua: SNo u. assume _ _.
      apply SNoR_E y Hy v Hv.
      assume Hva: SNo v. assume _ _.
      claim Luy: SNo (u * y).
      { exact SNo_mul_SNo u y Hua Hy. }
      claim Lxv: SNo (x * v).
      { exact SNo_mul_SNo x v Hx Hva. }
      claim Luv: SNo (u * v).
      { exact SNo_mul_SNo u v Hua Hva. }
      apply HRE z Hz.
      * { let u'. assume Hu'. let v'. assume Hv' Hze.
          apply SNoL_E x Hx u' Hu'.
          assume Hu'a: SNo u'. assume _ _.
          apply SNoR_E y Hy v' Hv'.
          assume Hv'a: SNo v'. assume _ _.
          claim Lu'y: SNo (u' * y).
          { exact SNo_mul_SNo u' y Hu'a Hy. }
          claim Lxv': SNo (x * v').
          { exact SNo_mul_SNo x v' Hx Hv'a. }
          claim Lu'v': SNo (u' * v').
          { exact SNo_mul_SNo u' v' Hu'a Hv'a. }
          rewrite Hwe. rewrite Hze.
          prove u * y + x * v + - u * v < u' * y + x * v' + - u' * v'.
          apply add_SNo_minus_Lt_lem (u * y) (x * v) (u * v) (u' * y) (x * v') (u' * v') Luy Lxv Luv Lu'y Lxv' Lu'v'.
          prove u * y + x * v + u' * v' < u' * y + x * v' + u * v.
          apply SNoLt_tra (u * y + x * v + u' * v')
                          (x * y + u * v + u' * v')
                          (u' * y + x * v' + u * v)
                          (SNo_add_SNo_3 (u * y) (x * v) (u' * v') Luy Lxv Lu'v')
                          (SNo_add_SNo_3 (x * y) (u * v) (u' * v') Hxy Luv Lu'v')
                          (SNo_add_SNo_3 (u' * y) (x * v') (u * v) Lu'y Lxv' Luv).
          - prove u * y + x * v + u' * v' < x * y + u * v + u' * v'.
            apply add_SNo_3_3_3_Lt1 (u * y) (x * v) (x * y) (u * v) (u' * v') Luy Lxv Hxy Luv Lu'v'.
            prove u * y + x * v < x * y + u * v.
            exact Hxy2 u Hu v Hv.
          - prove x * y + u * v + u' * v' < u' * y + x * v' + u * v.
            apply add_SNo_3_2_3_Lt1 (x * y) (u' * v') (u' * y) (x * v') (u * v) Hxy Lu'v' Lu'y Lxv' Luv.
            prove u' * v' + x * y < u' * y + x * v'.
            rewrite add_SNo_com (u' * v') (x * y) Lu'v' Hxy.
            exact Hxy3 u' Hu' v' Hv'.
        }
      * { let u'. assume Hu'. let v'. assume Hv' Hze.
          apply SNoR_E x Hx u' Hu'.
          assume Hu'a: SNo u'. assume _ _.
          apply SNoL_E y Hy v' Hv'.
          assume Hv'a: SNo v'. assume _ _.
          claim Lu'y: SNo (u' * y).
          { exact SNo_mul_SNo u' y Hu'a Hy. }
          claim Lxv': SNo (x * v').
          { exact SNo_mul_SNo x v' Hx Hv'a. }
          claim Lu'v': SNo (u' * v').
          { exact SNo_mul_SNo u' v' Hu'a Hv'a. }
          rewrite Hwe. rewrite Hze.
          prove u * y + x * v + - u * v < u' * y + x * v' + - u' * v'.
          apply add_SNo_minus_Lt_lem (u * y) (x * v) (u * v) (u' * y) (x * v') (u' * v') Luy Lxv Luv Lu'y Lxv' Lu'v'.
          prove u * y + x * v + u' * v' < u' * y + x * v' + u * v.
          apply SNoLt_tra (u * y + x * v + u' * v')
                          (x * y + u * v + u' * v')
                          (u' * y + x * v' + u * v)
                          (SNo_add_SNo_3 (u * y) (x * v) (u' * v') Luy Lxv Lu'v')
                          (SNo_add_SNo_3 (x * y) (u * v) (u' * v') Hxy Luv Lu'v')
                          (SNo_add_SNo_3 (u' * y) (x * v') (u * v) Lu'y Lxv' Luv).
          - prove u * y + x * v + u' * v' < x * y + u * v + u' * v'.
            apply add_SNo_3_3_3_Lt1 (u * y) (x * v) (x * y) (u * v) (u' * v') Luy Lxv Hxy Luv Lu'v'.
            prove u * y + x * v < x * y + u * v.
            exact Hxy2 u Hu v Hv.
          - prove x * y + u * v + u' * v' < u' * y + x * v' + u * v.
            apply add_SNo_3_2_3_Lt1 (x * y) (u' * v') (u' * y) (x * v') (u * v) Hxy Lu'v' Lu'y Lxv' Luv.
            prove u' * v' + x * y < u' * y + x * v'.
            rewrite add_SNo_com (u' * v') (x * y) Lu'v' Hxy.
            exact Hxy4 u' Hu' v' Hv'.
        }
}
exact Hp L R LLR HLE HLI1 HLI2 HRE HRI1 HRI2 He.
Qed.

Theorem mul_SNo_Lt : forall x y u v, SNo x -> SNo y -> SNo u -> SNo v
 -> u < x -> v < y -> u * y + x * v < x * y + u * v.
let x y u v. assume Hx Hy Hu Hv Hux Hvy.
apply mul_SNo_prop_1 x Hx y Hy.
assume Hxy: SNo (x * y).
assume Hxy1: forall u :e SNoL x, forall v :e SNoL y, u * y + x * v < x * y + u * v.
assume Hxy2: forall u :e SNoR x, forall v :e SNoR y, u * y + x * v < x * y + u * v.
assume Hxy3: forall u :e SNoL x, forall v :e SNoR y, x * y + u * v < u * y + x * v.
assume Hxy4: forall u :e SNoR x, forall v :e SNoL y, x * y + u * v < u * y + x * v.
apply mul_SNo_prop_1 u Hu y Hy.
assume Huy: SNo (u * y).
assume Huy1: forall x :e SNoL u, forall v :e SNoL y, x * y + u * v < u * y + x * v.
assume Huy2: forall x :e SNoR u, forall v :e SNoR y, x * y + u * v < u * y + x * v.
assume Huy3: forall x :e SNoL u, forall v :e SNoR y, u * y + x * v < x * y + u * v.
assume Huy4: forall x :e SNoR u, forall v :e SNoL y, u * y + x * v < x * y + u * v.
apply mul_SNo_prop_1 x Hx v Hv.
assume Hxv: SNo (x * v).
assume Hxv1: forall u :e SNoL x, forall y :e SNoL v, u * v + x * y < x * v + u * y.
assume Hxv2: forall u :e SNoR x, forall y :e SNoR v, u * v + x * y < x * v + u * y.
assume Hxv3: forall u :e SNoL x, forall y :e SNoR v, x * v + u * y < u * v + x * y.
assume Hxv4: forall u :e SNoR x, forall y :e SNoL v, x * v + u * y < u * v + x * y.
apply mul_SNo_prop_1 u Hu v Hv.
assume Huv: SNo (u * v).
assume Huv1: forall x :e SNoL u, forall y :e SNoL v, x * v + u * y < u * v + x * y.
assume Huv2: forall x :e SNoR u, forall y :e SNoR v, x * v + u * y < u * v + x * y.
assume Huv3: forall x :e SNoL u, forall y :e SNoR v, u * v + x * y < x * v + u * y.
assume Huv4: forall x :e SNoR u, forall y :e SNoL v, u * v + x * y < x * v + u * y.
claim Luyxv: SNo (u * y + x * v).
{ exact SNo_add_SNo (u * y) (x * v) Huy Hxv. }
claim Lxyuv: SNo (x * y + u * v).
{ exact SNo_add_SNo (x * y) (u * v) Hxy Huv. }
apply SNoLtE u x Hu Hx Hux.
- let w.
  assume Hw1: SNo w.
  assume Hw2: SNoLev w :e SNoLev u :/\: SNoLev x.
  assume Hw3: SNoEq_ (SNoLev w) w u.
  assume Hw4: SNoEq_ (SNoLev w) w x.
  assume Hw5: u < w.
  assume Hw6: w < x.
  assume Hw7: SNoLev w /:e u.
  assume Hw8: SNoLev w :e x.
  apply binintersectE (SNoLev u) (SNoLev x) (SNoLev w) Hw2.
  assume Hw2a Hw2b.
  claim Lwx: w :e SNoL x.
  { exact SNoL_I x Hx w Hw1 Hw2b Hw6. }
  claim Lwu: w :e SNoR u.
  { exact SNoR_I u Hu w Hw1 Hw2a Hw5. }
  claim Lwy: SNo (w * y).
  { exact SNo_mul_SNo w y Hw1 Hy. }
  claim Lwv: SNo (w * v).
  { exact SNo_mul_SNo w v Hw1 Hv. }
  claim Lwyxv: SNo (w * y + x * v).
  { exact SNo_add_SNo (w * y) (x * v) Lwy Hxv. }
  claim Lwyuv: SNo (w * y + u * v).
  { exact SNo_add_SNo (w * y) (u * v) Lwy Huv. }
  claim Lxywv: SNo (x * y + w * v).
  { exact SNo_add_SNo (x * y) (w * v) Hxy Lwv. }
  claim Luywv: SNo (u * y + w * v).
  { exact SNo_add_SNo (u * y) (w * v) Huy Lwv. }
  claim Luvwy: SNo (u * v + w * y).
  { exact SNo_add_SNo (u * v) (w * y) Huv Lwy. }
  claim Lwvxy: SNo (w * v + x * y).
  { exact SNo_add_SNo (w * v) (x * y) Lwv Hxy. }
  claim Lxvwy: SNo (x * v + w * y).
  { exact SNo_add_SNo (x * v) (w * y) Hxv Lwy. }
  claim Lwvuy: SNo (w * v + u * y).
  { exact SNo_add_SNo (w * v) (u * y) Lwv Huy. }
  apply SNoLtE v y Hv Hy Hvy.
  + let z.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev v :/\: SNoLev y.
    assume Hz3: SNoEq_ (SNoLev z) z v.
    assume Hz4: SNoEq_ (SNoLev z) z y.
    assume Hz5: v < z.
    assume Hz6: z < y.
    assume Hz7: SNoLev z /:e v.
    assume Hz8: SNoLev z :e y.
    apply binintersectE (SNoLev v) (SNoLev y) (SNoLev z) Hz2.
    assume Hz2a Hz2b.
    claim Lzy: z :e SNoL y.
    { exact SNoL_I y Hy z Hz1 Hz2b Hz6. }
    claim Lzv: z :e SNoR v.
    { exact SNoR_I v Hv z Hz1 Hz2a Hz5. }
    claim Lxz: SNo (x * z).
    { exact SNo_mul_SNo x z Hx Hz1. }
    claim Luz: SNo (u * z).
    { exact SNo_mul_SNo u z Hu Hz1. }
    claim Lwz: SNo (w * z).
    { exact SNo_mul_SNo w z Hw1 Hz1. }
    claim L1: w * y + x * z < x * y + w * z.
    { exact Hxy1 w Lwx z Lzy. }
    claim L2: w * v + u * z < u * v + w * z.
    { exact Huv2 w Lwu z Lzv. }
    claim L3: x * v + w * z < w * v + x * z.
    { exact Hxv3 w Lwx z Lzv. }
    claim L4: u * y + w * z < w * y + u * z.
    { exact Huy4 w Lwu z Lzy. }
    claim Lwzwz: SNo (w * z + w * z).
    { exact SNo_add_SNo (w * z) (w * z) Lwz Lwz. }
    apply add_SNo_Lt1_cancel (u * y + x * v) (w * z + w * z) (x * y + u * v) Luyxv Lwzwz Lxyuv.
    prove (u * y + x * v) + (w * z + w * z) < (x * y + u * v) + (w * z + w * z).
    claim Lwyuz: SNo (w * y + u * z).
    { exact SNo_add_SNo (w * y) (u * z) Lwy Luz. }
    claim Lwvxz: SNo (w * v + x * z).
    { exact SNo_add_SNo (w * v) (x * z) Lwv Lxz. }
    claim Luywz: SNo (u * y + w * z).
    { exact SNo_add_SNo (u * y) (w * z) Huy Lwz. }
    claim Lxvwz: SNo (x * v + w * z).
    { exact SNo_add_SNo (x * v) (w * z) Hxv Lwz. }
    claim Lwvuz: SNo (w * v + u * z).
    { exact SNo_add_SNo (w * v) (u * z) Lwv Luz. }
    claim Lxyxz: SNo (x * y + x * z).
    { exact SNo_add_SNo (x * y) (x * z) Hxy Lxz. }
    claim Lwyxz: SNo (w * y + x * z).
    { exact SNo_add_SNo (w * y) (x * z) Lwy Lxz. }
    claim Lxywz: SNo (x * y + w * z).
    { exact SNo_add_SNo (x * y) (w * z) Hxy Lwz. }
    claim Luvwz: SNo (u * v + w * z).
    { exact SNo_add_SNo (u * v) (w * z) Huv Lwz. }
    apply SNoLt_tra ((u * y + x * v) + (w * z + w * z))
                    ((w * y + u * z) + (w * v + x * z))
                    ((x * y + u * v) + (w * z + w * z))
		    (SNo_add_SNo (u * y + x * v) (w * z + w * z) Luyxv Lwzwz)
		    (SNo_add_SNo (w * y + u * z) (w * v + x * z) Lwyuz Lwvxz)
		    (SNo_add_SNo (x * y + u * v) (w * z + w * z) Lxyuv Lwzwz).
    * { prove (u * y + x * v) + (w * z + w * z) < (w * y + u * z) + (w * v + x * z).
        rewrite add_SNo_com_4_inner_mid (u * y) (x * v) (w * z) (w * z) Huy Hxv Lwz Lwz.
        prove (u * y + w * z) + (x * v + w * z) < (w * y + u * z) + (w * v + x * z).
        apply add_SNo_Lt3 (u * y + w * z) (x * v + w * z) (w * y + u * z) (w * v + x * z) Luywz Lxvwz Lwyuz Lwvxz.
	- prove u * y + w * z < w * y + u * z. exact L4.
	- prove x * v + w * z < w * v + x * z. exact L3.
      }
    * { prove (w * y + u * z) + (w * v + x * z) < (x * y + u * v) + (w * z + w * z).
        rewrite add_SNo_com_4_inner_mid (x * y) (u * v) (w * z) (w * z) Hxy Huv Lwz Lwz.
	prove (w * y + u * z) + (w * v + x * z) < (x * y + w * z) + (u * v + w * z).
	rewrite add_SNo_com (w * y) (u * z) Lwy Luz.
        rewrite add_SNo_com_4_inner_mid (u * z) (w * y) (w * v) (x * z) Luz Lwy Lwv Lxz.
	rewrite <- add_SNo_com (w * v) (u * z) Lwv Luz.
	prove (w * v + u * z) + (w * y + x * z) < (x * y + w * z) + (u * v + w * z).
	rewrite add_SNo_com (w * v + u * z) (w * y + x * z) Lwvuz Lwyxz.
	prove (w * y + x * z) + (w * v + u * z) < (x * y + w * z) + (u * v + w * z).
        apply add_SNo_Lt3 (w * y + x * z) (w * v + u * z) (x * y + w * z) (u * v + w * z) Lwyxz Lwvuz Lxywz Luvwz.
	- exact L1.
	- exact L2.
      }
  + assume H4: SNoLev v :e SNoLev y.
    assume H5: SNoEq_ (SNoLev v) v y.
    assume H6: SNoLev v :e y.
    claim Lvy: v :e SNoL y.
    { exact SNoL_I y Hy v Hv H4 Hvy. }
    claim L1: w * y + x * v < x * y + w * v.
    { exact Hxy1 w Lwx v Lvy. }
    claim L2: u * y + w * v < w * y + u * v.
    { exact Huy4 w Lwu v Lvy. }
    prove u * y + x * v < x * y + u * v.
    apply add_SNo_Lt2_cancel (w * y) (u * y + x * v) (x * y + u * v) Lwy Luyxv Lxyuv.
    prove w * y + u * y + x * v < w * y + x * y + u * v.
    apply SNoLt_tra (w * y + u * y + x * v) (u * y + w * v + x * y) (w * y + x * y + u * v)
                    (SNo_add_SNo (w * y) (u * y + x * v) Lwy Luyxv)
		    (SNo_add_SNo (u * y) (w * v + x * y) Huy (SNo_add_SNo (w * v) (x * y) Lwv Hxy))
                    (SNo_add_SNo (w * y) (x * y + u * v) Lwy Lxyuv).
    * prove w * y + u * y + x * v < u * y + w * v + x * y.
      rewrite add_SNo_com_3_0_1 (w * y) (u * y) (x * v) Lwy Huy Hxv.
      prove u * y + w * y + x * v < u * y + w * v + x * y.
      rewrite add_SNo_com (w * v) (x * y) Lwv Hxy.
      exact add_SNo_Lt2 (u * y) (w * y + x * v) (x * y + w * v)
                        Huy Lwyxv Lxywv L1.
    * prove u * y + w * v + x * y < w * y + x * y + u * v.
      rewrite add_SNo_assoc (u * y) (w * v) (x * y) Huy Lwv Hxy.
      prove (u * y + w * v) + x * y < w * y + x * y + u * v.
      rewrite add_SNo_com (x * y) (u * v) Hxy Huv.
      prove (u * y + w * v) + x * y < w * y + u * v + x * y.
      rewrite add_SNo_assoc (w * y) (u * v) (x * y) Lwy Huv Hxy.
      prove (u * y + w * v) + x * y < (w * y + u * v) + x * y.
      exact add_SNo_Lt1 (u * y + w * v) (x * y) (w * y + u * v)
                        Luywv Hxy Lwyuv L2.
  + assume H4: SNoLev y :e SNoLev v.
    assume H5: SNoEq_ (SNoLev y) v y.
    assume H6: SNoLev y /:e v.
    claim Lyv: y :e SNoR v.
    { exact SNoR_I v Hv y Hy H4 Hvy. }
    claim L1: x * v + w * y < w * v + x * y.
    { exact Hxv3 w Lwx y Lyv. }
    claim L2: w * v + u * y < u * v + w * y.
    { exact Huv2 w Lwu y Lyv. }
    prove u * y + x * v < x * y + u * v.
    apply add_SNo_Lt2_cancel (w * y) (u * y + x * v) (x * y + u * v) Lwy Luyxv Lxyuv.
    prove w * y + u * y + x * v < w * y + x * y + u * v.
    apply SNoLt_tra (w * y + u * y + x * v) (u * y + w * v + x * y) (w * y + x * y + u * v)
                    (SNo_add_SNo (w * y) (u * y + x * v) Lwy Luyxv)
		    (SNo_add_SNo (u * y) (w * v + x * y) Huy (SNo_add_SNo (w * v) (x * y) Lwv Hxy))
                    (SNo_add_SNo (w * y) (x * y + u * v) Lwy Lxyuv).
    * prove w * y + u * y + x * v < u * y + w * v + x * y.
      rewrite <- add_SNo_rotate_3_1 (u * y) (x * v) (w * y) Huy Hxv Lwy.
      prove u * y + x * v + w * y < u * y + w * v + x * y.
      exact add_SNo_Lt2 (u * y) (x * v + w * y) (w * v + x * y)
                        Huy Lxvwy Lwvxy L1.
    * prove u * y + w * v + x * y < w * y + x * y + u * v.
      rewrite add_SNo_rotate_3_1 (w * y) (x * y) (u * v) Lwy Hxy Huv.
      prove u * y + w * v + x * y < u * v + w * y + x * y.
      rewrite add_SNo_assoc (u * y) (w * v) (x * y) Huy Lwv Hxy.
      rewrite add_SNo_assoc (u * v) (w * y) (x * y) Huv Lwy Hxy.
      prove (u * y + w * v) + x * y < (u * v + w * y) + x * y.
      rewrite add_SNo_com (u * y) (w * v) Huy Lwv.
      prove (w * v + u * y) + x * y < (u * v + w * y) + x * y.
      apply add_SNo_Lt1 (w * v + u * y) (x * y) (u * v + w * y)
                        Lwvuy Hxy Luvwy L2.
- assume H1: SNoLev u :e SNoLev x.
  assume H2: SNoEq_ (SNoLev u) u x.
  assume H3: SNoLev u :e x.
  claim Lux: u :e SNoL x.
  { exact SNoL_I x Hx u Hu H1 Hux. }
  apply SNoLtE v y Hv Hy Hvy.
  + let z.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev v :/\: SNoLev y.
    assume Hz3: SNoEq_ (SNoLev z) z v.
    assume Hz4: SNoEq_ (SNoLev z) z y.
    assume Hz5: v < z.
    assume Hz6: z < y.
    assume Hz7: SNoLev z /:e v.
    assume Hz8: SNoLev z :e y.
    apply binintersectE (SNoLev v) (SNoLev y) (SNoLev z) Hz2.
    assume Hz2a Hz2b.
    claim Lzy: z :e SNoL y.
    { exact SNoL_I y Hy z Hz1 Hz2b Hz6. }
    claim Lzv: z :e SNoR v.
    { exact SNoR_I v Hv z Hz1 Hz2a Hz5. }
    claim Lxz: SNo (x * z).
    { exact SNo_mul_SNo x z Hx Hz1. }
    claim Luz: SNo (u * z).
    { exact SNo_mul_SNo u z Hu Hz1. }
    claim Luyxz: SNo (u * y + x * z).
    { exact SNo_add_SNo (u * y) (x * z) Huy Lxz. }
    claim Luvxz: SNo (u * v + x * z).
    { exact SNo_add_SNo (u * v) (x * z) Huv Lxz. }
    claim Lxyuz: SNo (x * y + u * z).
    { exact SNo_add_SNo (x * y) (u * z) Hxy Luz. }
    claim Lxvuz: SNo (x * v + u * z).
    { exact SNo_add_SNo (x * v) (u * z) Hxv Luz. }
    claim L1: u * y + x * z < x * y + u * z.
    { exact Hxy1 u Lux z Lzy. }
    claim L2: x * v + u * z < u * v + x * z.
    { exact Hxv3 u Lux z Lzv. }
    prove u * y + x * v < x * y + u * v.
    apply add_SNo_Lt2_cancel (x * z) (u * y + x * v) (x * y + u * v) Lxz Luyxv Lxyuv.
    prove x * z + u * y + x * v < x * z + x * y + u * v.
    apply SNoLt_tra (x * z + u * y + x * v) (x * y + u * z + x * v) (x * z + x * y + u * v)
                    (SNo_add_SNo (x * z) (u * y + x * v) Lxz Luyxv)
		    (SNo_add_SNo (x * y) (u * z + x * v) Hxy (SNo_add_SNo (u * z) (x * v) Luz Hxv))
                    (SNo_add_SNo (x * z) (x * y + u * v) Lxz Lxyuv).
    * prove x * z + u * y + x * v < x * y + u * z + x * v.
      rewrite add_SNo_assoc (x * z) (u * y) (x * v) Lxz Huy Hxv.
      rewrite add_SNo_com (x * z) (u * y) Lxz Huy.
      prove (u * y + x * z) + x * v < x * y + u * z + x * v.
      rewrite add_SNo_assoc (x * y) (u * z) (x * v) Hxy Luz Hxv.
      exact add_SNo_Lt1 (u * y + x * z) (x * v) (x * y + u * z)
                        Luyxz Hxv Lxyuz L1.
    * prove x * y + u * z + x * v < x * z + x * y + u * v.
      rewrite <- add_SNo_rotate_3_1 (x * y) (u * v) (x * z) Hxy Huv Lxz.
      prove x * y + u * z + x * v < x * y + u * v + x * z.
      rewrite add_SNo_com (u * z) (x * v) Luz Hxv.
      prove x * y + x * v + u * z < x * y + u * v + x * z.
      exact add_SNo_Lt2 (x * y) (x * v + u * z) (u * v + x * z)
                        Hxy Lxvuz Luvxz L2.
  + assume H4: SNoLev v :e SNoLev y.
    assume H5: SNoEq_ (SNoLev v) v y.
    assume H6: SNoLev v :e y.
    claim Lvy: v :e SNoL y.
    { exact SNoL_I y Hy v Hv H4 Hvy. }
    exact Hxy1 u Lux v Lvy.
  + assume H4: SNoLev y :e SNoLev v.
    assume H5: SNoEq_ (SNoLev y) v y.
    assume H6: SNoLev y /:e v.
    claim Lyv: y :e SNoR v.
    { exact SNoR_I v Hv y Hy H4 Hvy. }
    prove u * y + x * v < x * y + u * v.
    rewrite add_SNo_com (u * y) (x * v) Huy Hxv.
    rewrite add_SNo_com (x * y) (u * v) Hxy Huv.
    exact Hxv3 u Lux y Lyv.
- assume H1: SNoLev x :e SNoLev u.
  assume H2: SNoEq_ (SNoLev x) u x.
  assume H3: SNoLev x /:e u.
  claim Lxu: x :e SNoR u.
  { exact SNoR_I u Hu x Hx H1 Hux. }
  apply SNoLtE v y Hv Hy Hvy.
  + let z.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev v :/\: SNoLev y.
    assume Hz3: SNoEq_ (SNoLev z) z v.
    assume Hz4: SNoEq_ (SNoLev z) z y.
    assume Hz5: v < z.
    assume Hz6: z < y.
    assume Hz7: SNoLev z /:e v.
    assume Hz8: SNoLev z :e y.
    apply binintersectE (SNoLev v) (SNoLev y) (SNoLev z) Hz2.
    assume Hz2a Hz2b.
    claim Lzy: z :e SNoL y.
    { exact SNoL_I y Hy z Hz1 Hz2b Hz6. }
    claim Lzv: z :e SNoR v.
    { exact SNoR_I v Hv z Hz1 Hz2a Hz5. }
    claim Lxz: SNo (x * z).
    { exact SNo_mul_SNo x z Hx Hz1. }
    claim Luz: SNo (u * z).
    { exact SNo_mul_SNo u z Hu Hz1. }
    claim L1: u * y + x * z < x * y + u * z.
    { exact Huy4 x Lxu z Lzy. }
    claim L2: x * v + u * z < u * v + x * z.
    { exact Huv2 x Lxu z Lzv. }
    prove u * y + x * v < x * y + u * v.
    apply add_SNo_Lt1_cancel (u * y + x * v) (x * z) (x * y + u * v) Luyxv Lxz Lxyuv.
    prove (u * y + x * v) + x * z < (x * y + u * v) + x * z.
    rewrite add_SNo_com (u * y) (x * v) Huy Hxv.
    prove (x * v + u * y) + x * z < (x * y + u * v) + x * z.
    rewrite <- add_SNo_assoc (x * v) (u * y) (x * z) Hxv Huy Lxz.
    rewrite <- add_SNo_assoc (x * y) (u * v) (x * z) Hxy Huv Lxz.
    prove x * v + u * y + x * z < x * y + u * v + x * z.
    claim Luyxz: SNo (u * y + x * z).
    { exact SNo_add_SNo (u * y) (x * z) Huy Lxz. }
    claim Luzxy: SNo (u * z + x * y).
    { exact SNo_add_SNo (u * z) (x * y) Luz Hxy. }
    claim Luvxz: SNo (u * v + x * z).
    { exact SNo_add_SNo (u * v) (x * z) Huv Lxz. }
    apply SNoLt_tra (x * v + u * y + x * z)
                    (x * v + u * z + x * y)
		    (x * y + u * v + x * z)
		    (SNo_add_SNo (x * v) (u * y + x * z) Hxv Luyxz)
		    (SNo_add_SNo (x * v) (u * z + x * y) Hxv Luzxy)
		    (SNo_add_SNo (x * y) (u * v + x * z) Hxy Luvxz).
    * prove x * v + u * y + x * z < x * v + u * z + x * y.
      rewrite add_SNo_com (u * z) (x * y) Luz Hxy.
      exact add_SNo_Lt2 (x * v) (u * y + x * z) (x * y + u * z)
                        Hxv Luyxz (SNo_add_SNo (x * y) (u * z) Hxy Luz) L1.
    * prove x * v + u * z + x * y < x * y + u * v + x * z.
      rewrite add_SNo_rotate_3_1 (x * v) (u * z) (x * y) Hxv Luz Hxy.
      prove x * y + x * v + u * z < x * y + u * v + x * z.
      exact add_SNo_Lt2 (x * y) (x * v + u * z) (u * v + x * z)
                        Hxy (SNo_add_SNo (x * v) (u * z) Hxv Luz) Luvxz L2.
  + assume H4: SNoLev v :e SNoLev y.
    assume H5: SNoEq_ (SNoLev v) v y.
    assume H6: SNoLev v :e y.
    claim Lvy: v :e SNoL y.
    { exact SNoL_I y Hy v Hv H4 Hvy. }
    prove u * y + x * v < x * y + u * v.
    exact Huy4 x Lxu v Lvy.
  + assume H4: SNoLev y :e SNoLev v.
    assume H5: SNoEq_ (SNoLev y) v y.
    assume H6: SNoLev y /:e v.
    claim Lyv: y :e SNoR v.
    { exact SNoR_I v Hv y Hy H4 Hvy. }
    prove u * y + x * v < x * y + u * v.
    rewrite add_SNo_com (u * y) (x * v) Huy Hxv.
    rewrite add_SNo_com (x * y) (u * v) Hxy Huv.
    exact Huv2 x Lxu y Lyv.
Qed.

Theorem mul_SNo_Le : forall x y u v, SNo x -> SNo y -> SNo u -> SNo v
 -> u <= x -> v <= y -> u * y + x * v <= x * y + u * v.
let x y u v. assume Hx Hy Hu Hv Hux Hvy.
apply SNoLeE u x Hu Hx Hux.
- assume Hux: u < x.
  apply SNoLeE v y Hv Hy Hvy.
  + assume Hvy: v < y.
    apply SNoLtLe.
    exact mul_SNo_Lt x y u v Hx Hy Hu Hv Hux Hvy.
  + assume Hvy: v = y. rewrite Hvy.
    prove u * y + x * y <= x * y + u * y.
    rewrite add_SNo_com (u * y) (x * y) (SNo_mul_SNo u y Hu Hy) (SNo_mul_SNo x y Hx Hy).
    prove x * y + u * y <= x * y + u * y.
    apply SNoLe_ref.
- assume Hux: u = x. rewrite Hux.
  prove x * y + x * v <= x * y + x * v.
  apply SNoLe_ref.
Qed.

Theorem mul_SNo_SNoL_interpolate : forall x y, SNo x -> SNo y -> forall u :e SNoL (x * y),
 (exists v :e SNoL x, exists w :e SNoL y, u + v * w <= v * y + x * w)
 \/
 (exists v :e SNoR x, exists w :e SNoR y, u + v * w <= v * y + x * w).
let x y. assume Hx Hy.
set P1 : set -> prop :=
  fun u => exists v :e SNoL x, exists w :e SNoL y, u + v * w <= v * y + x * w.
set P2 : set -> prop :=
  fun u => exists v :e SNoR x, exists w :e SNoR y, u + v * w <= v * y + x * w.
set P : set -> prop := fun u => P1 u \/ P2 u.
claim Lxy: SNo (x * y).
{ exact SNo_mul_SNo x y Hx Hy. }
claim LI: forall u, SNo u -> SNoLev u :e SNoLev (x * y) -> u < x * y -> P u.
{ apply SNoLev_ind.
  let u.
  assume Hu1: SNo u.
  assume IH: forall z :e SNoS_ (SNoLev u), SNoLev z :e SNoLev (x * y) -> z < x * y -> P z.
  assume Hu2: SNoLev u :e SNoLev (x * y).
  assume Hu3: u < x * y.
  apply dneg.
  assume HNC: ~P u.
  claim L1: forall v :e SNoL x, forall w :e SNoL y, v * y + x * w < u + v * w.
  { let v. assume Hv. let w. assume Hw.
    apply SNoL_E x Hx v Hv.
    assume Hv1 Hv2 Hv3.
    apply SNoL_E y Hy w Hw.
    assume Hw1 Hw2 Hw3.
    apply SNoLtLe_or (v * y + x * w) (u + v * w)
           (SNo_add_SNo (v * y) (x * w) (SNo_mul_SNo v y Hv1 Hy) (SNo_mul_SNo x w Hx Hw1))
           (SNo_add_SNo u (v * w) Hu1 (SNo_mul_SNo v w Hv1 Hw1)).
    - assume H. exact H.
    - assume H. apply HNC. apply orIL.
      witness v. apply andI.
      + exact Hv.
      + witness w. apply andI.
        * exact Hw.
	* exact H.
  }
  claim L2: forall v :e SNoR x, forall w :e SNoR y, v * y + x * w < u + v * w.
  { let v. assume Hv. let w. assume Hw.
    apply SNoR_E x Hx v Hv.
    assume Hv1 Hv2 Hv3.
    apply SNoR_E y Hy w Hw.
    assume Hw1 Hw2 Hw3.
    apply SNoLtLe_or (v * y + x * w) (u + v * w)
           (SNo_add_SNo (v * y) (x * w) (SNo_mul_SNo v y Hv1 Hy) (SNo_mul_SNo x w Hx Hw1))
           (SNo_add_SNo u (v * w) Hu1 (SNo_mul_SNo v w Hv1 Hw1)).
    - assume H. exact H.
    - assume H. apply HNC. apply orIR.
      witness v. apply andI.
      + exact Hv.
      + witness w. apply andI.
        * exact Hw.
	* exact H.
  }
  apply SNoLt_irref u.
  apply SNoLtLe_tra u (x * y) u Hu1 Lxy Hu1 Hu3.
  prove x * y <= u.
  apply mul_SNo_eq_3 x y Hx Hy.
  let L R. assume HLR HLE HLI1 HLI2 HRE HRI1 HRI2.
  assume HE: x * y = SNoCut L R.
  rewrite HE.
  prove SNoCut L R <= u.
  rewrite SNo_eta u Hu1.
  prove SNoCut L R <= SNoCut (SNoL u) (SNoR u).
  apply SNoCut_Le L R (SNoL u) (SNoR u) HLR (SNoCutP_SNoL_SNoR u Hu1).
  - prove forall z :e L, z < SNoCut (SNoL u) (SNoR u).
    let z. assume Hz.
    rewrite <- SNo_eta u Hu1.
    prove z < u.
    apply HLE z Hz.
    + let v. assume Hv: v :e SNoL x. let w. assume Hw: w :e SNoL y.
      assume Hze: z = v * y + x * w + - v * w.
      rewrite Hze.
      prove v * y + x * w + - v * w < u.
      apply SNoL_E x Hx v Hv.
      assume Hv1 Hv2 Hv3.
      apply SNoL_E y Hy w Hw.
      assume Hw1 Hw2 Hw3.
      apply add_SNo_minus_Lt1b3 (v * y) (x * w) (v * w) u (SNo_mul_SNo v y Hv1 Hy) (SNo_mul_SNo x w Hx Hw1) (SNo_mul_SNo v w Hv1 Hw1) Hu1.
      prove v * y + x * w < u + v * w.
      exact L1 v Hv w Hw.
    + let v. assume Hv: v :e SNoR x. let w. assume Hw: w :e SNoR y.
      assume Hze: z = v * y + x * w + - v * w.
      rewrite Hze.
      prove v * y + x * w + - v * w < u.
      apply SNoR_E x Hx v Hv.
      assume Hv1 Hv2 Hv3.
      apply SNoR_E y Hy w Hw.
      assume Hw1 Hw2 Hw3.
      apply add_SNo_minus_Lt1b3 (v * y) (x * w) (v * w) u (SNo_mul_SNo v y Hv1 Hy) (SNo_mul_SNo x w Hx Hw1) (SNo_mul_SNo v w Hv1 Hw1) Hu1.
      prove v * y + x * w < u + v * w.
      exact L2 v Hv w Hw.
  - prove forall z :e SNoR u, SNoCut L R < z.
    let z. assume Hz: z :e SNoR u.
    rewrite <- HE.
    prove x * y < z.
    apply SNoR_E u Hu1 z Hz.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev u.
    assume Hz3: u < z.
    apply SNoLt_trichotomy_or_impred z (x * y) Hz1 Lxy.
    + assume H1: z < x * y.
      claim LPz: P z.
      { apply IH z.
        - prove z :e SNoS_ (SNoLev u). apply SNoS_I2.
	  + exact Hz1.
	  + exact Hu1.
	  + exact Hz2.
        - prove SNoLev z :e SNoLev (x * y).
	  exact ordinal_TransSet (SNoLev (x * y)) (SNoLev_ordinal (x * y) Lxy)
	                         (SNoLev u) Hu2 (SNoLev z) Hz2.
        - prove z < x * y. exact H1.
      }
      apply LPz.
      * assume H2: P1 z. apply H2.
        let v. assume H2. apply H2.
        assume Hv: v :e SNoL x. assume H2. apply H2.
	let w. assume H2. apply H2.
	assume Hw: w :e SNoL y.
	assume Hvw: z + v * w <= v * y + x * w.
        apply SNoL_E x Hx v Hv.
        assume Hv1 Hv2 Hv3.
        apply SNoL_E y Hy w Hw.
        assume Hw1 Hw2 Hw3.
	claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim L3: z + v * w < u + v * w.
	{ apply SNoLeLt_tra (z + v * w) (v * y + x * w) (u + v * w)
	                    (SNo_add_SNo z (v * w) Hz1 Lvw)
			    (SNo_add_SNo (v * y) (x * w)
			                 (SNo_mul_SNo v y Hv1 Hy)
					 (SNo_mul_SNo x w Hx Hw1))
			    (SNo_add_SNo u (v * w) Hu1 Lvw)
	                    Hvw.
	  prove v * y + x * w < u + v * w.
	  exact L1 v Hv w Hw.
	}
	claim L4: z < u.
	{ exact add_SNo_Lt1_cancel z (v * w) u Hz1 Lvw Hu1 L3. }
        apply SNoLt_irref u.
	exact SNoLt_tra u z u Hu1 Hz1 Hu1 Hz3 L4.
      * assume H2: P2 z. apply H2.
        let v. assume H2. apply H2.
        assume Hv: v :e SNoR x. assume H2. apply H2.
	let w. assume H2. apply H2.
	assume Hw: w :e SNoR y.
	assume Hvw: z + v * w <= v * y + x * w.
        apply SNoR_E x Hx v Hv.
        assume Hv1 Hv2 Hv3.
        apply SNoR_E y Hy w Hw.
        assume Hw1 Hw2 Hw3.
	claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim L5: z + v * w < u + v * w.
	{ apply SNoLeLt_tra (z + v * w) (v * y + x * w) (u + v * w)
	                    (SNo_add_SNo z (v * w) Hz1 Lvw)
			    (SNo_add_SNo (v * y) (x * w)
			                 (SNo_mul_SNo v y Hv1 Hy)
					 (SNo_mul_SNo x w Hx Hw1))
			    (SNo_add_SNo u (v * w) Hu1 Lvw)
	                    Hvw.
	  prove v * y + x * w < u + v * w.
	  exact L2 v Hv w Hw.
	}
	claim L6: z < u.
	{ exact add_SNo_Lt1_cancel z (v * w) u Hz1 Lvw Hu1 L5. }
        apply SNoLt_irref u.
	exact SNoLt_tra u z u Hu1 Hz1 Hu1 Hz3 L6.
    + assume H1: z = x * y. apply In_no2cycle (SNoLev u) (SNoLev (x * y)) Hu2.
      prove SNoLev (x * y) :e SNoLev u. rewrite <- H1. exact Hz2.
    + assume H1: x * y < z. exact H1.
}
let u.
assume Hu: u :e SNoL (x * y).
apply SNoL_E (x * y) Lxy u Hu.
assume Hu1: SNo u.
assume Hu2: SNoLev u :e SNoLev (x * y).
assume Hu3: u < x * y.
exact LI u Hu1 Hu2 Hu3.
Qed.

Theorem mul_SNo_SNoL_interpolate_impred : forall x y, SNo x -> SNo y -> forall u :e SNoL (x * y),
 forall p:prop,
      (forall v :e SNoL x, forall w :e SNoL y, u + v * w <= v * y + x * w -> p)
   -> (forall v :e SNoR x, forall w :e SNoR y, u + v * w <= v * y + x * w -> p)
   -> p.
let x y. assume Hx Hy. let u. assume Hu.
let p. assume Hp1 Hp2.
apply mul_SNo_SNoL_interpolate x y Hx Hy u Hu.
- assume H1. apply H1.
  let v. assume H1. apply H1.
  assume Hv. assume H1. apply H1.
  let w. assume H1. apply H1.
  assume Hw Hvw.
  exact Hp1 v Hv w Hw Hvw.
- assume H1. apply H1.
  let v. assume H1. apply H1.
  assume Hv. assume H1. apply H1.
  let w. assume H1. apply H1.
  assume Hw Hvw.
  exact Hp2 v Hv w Hw Hvw.
Qed.  

Theorem mul_SNo_SNoR_interpolate : forall x y, SNo x -> SNo y -> forall u :e SNoR (x * y),
 (exists v :e SNoL x, exists w :e SNoR y, v * y + x * w <= u + v * w)
 \/
 (exists v :e SNoR x, exists w :e SNoL y, v * y + x * w <= u + v * w).
let x y. assume Hx Hy.
set P1 : set -> prop :=
  fun u => exists v :e SNoL x, exists w :e SNoR y, v * y + x * w <= u + v * w.
set P2 : set -> prop :=
  fun u => exists v :e SNoR x, exists w :e SNoL y, v * y + x * w <= u + v * w.
set P : set -> prop := fun u => P1 u \/ P2 u.
claim Lxy: SNo (x * y).
{ exact SNo_mul_SNo x y Hx Hy. }
claim LI: forall u, SNo u -> SNoLev u :e SNoLev (x * y) -> x * y < u -> P u.
{ apply SNoLev_ind.
  let u.
  assume Hu1: SNo u.
  assume IH: forall z :e SNoS_ (SNoLev u), SNoLev z :e SNoLev (x * y) -> x * y < z -> P z.
  assume Hu2: SNoLev u :e SNoLev (x * y).
  assume Hu3: x * y < u.
  apply dneg.
  assume HNC: ~P u.
  claim L1: forall v :e SNoL x, forall w :e SNoR y, u + v * w < v * y + x * w.
  { let v. assume Hv. let w. assume Hw.
    apply SNoL_E x Hx v Hv.
    assume Hv1 Hv2 Hv3.
    apply SNoR_E y Hy w Hw.
    assume Hw1 Hw2 Hw3.
    apply SNoLtLe_or (u + v * w) (v * y + x * w)
           (SNo_add_SNo u (v * w) Hu1 (SNo_mul_SNo v w Hv1 Hw1))
           (SNo_add_SNo (v * y) (x * w) (SNo_mul_SNo v y Hv1 Hy) (SNo_mul_SNo x w Hx Hw1)).
    - assume H. exact H.
    - assume H. apply HNC. apply orIL.
      witness v. apply andI.
      + exact Hv.
      + witness w. apply andI.
        * exact Hw.
	* exact H.
  }
  claim L2: forall v :e SNoR x, forall w :e SNoL y, u + v * w < v * y + x * w.
  { let v. assume Hv. let w. assume Hw.
    apply SNoR_E x Hx v Hv.
    assume Hv1 Hv2 Hv3.
    apply SNoL_E y Hy w Hw.
    assume Hw1 Hw2 Hw3.
    apply SNoLtLe_or (u + v * w) (v * y + x * w)
           (SNo_add_SNo u (v * w) Hu1 (SNo_mul_SNo v w Hv1 Hw1))
           (SNo_add_SNo (v * y) (x * w) (SNo_mul_SNo v y Hv1 Hy) (SNo_mul_SNo x w Hx Hw1)).
    - assume H. exact H.
    - assume H. apply HNC. apply orIR.
      witness v. apply andI.
      + exact Hv.
      + witness w. apply andI.
        * exact Hw.
	* exact H.
  }
  apply SNoLt_irref (x * y).
  apply SNoLtLe_tra (x * y) u (x * y) Lxy Hu1 Lxy Hu3.
  prove u <= x * y.
  apply mul_SNo_eq_3 x y Hx Hy.
  let L R. assume HLR HLE HLI1 HLI2 HRE HRI1 HRI2.
  assume HE: x * y = SNoCut L R.
  rewrite HE.
  prove u <= SNoCut L R.
  rewrite SNo_eta u Hu1.
  prove SNoCut (SNoL u) (SNoR u) <= SNoCut L R.
  apply SNoCut_Le (SNoL u) (SNoR u) L R (SNoCutP_SNoL_SNoR u Hu1) HLR.
  - prove forall z :e SNoL u, z < SNoCut L R.
    let z. assume Hz: z :e SNoL u.
    rewrite <- HE.
    prove z < x * y.
    apply SNoL_E u Hu1 z Hz.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev u.
    assume Hz3: z < u.
    apply SNoLt_trichotomy_or_impred z (x * y) Hz1 Lxy.
    + assume H1: z < x * y. exact H1.
    + assume H1: z = x * y. apply In_no2cycle (SNoLev u) (SNoLev (x * y)) Hu2.
      prove SNoLev (x * y) :e SNoLev u. rewrite <- H1. exact Hz2.
    + assume H1: x * y < z.
      claim LPz: P z.
      { apply IH z.
        - prove z :e SNoS_ (SNoLev u). apply SNoS_I2.
	  + exact Hz1.
	  + exact Hu1.
	  + exact Hz2.
        - prove SNoLev z :e SNoLev (x * y).
	  exact ordinal_TransSet (SNoLev (x * y)) (SNoLev_ordinal (x * y) Lxy)
	                         (SNoLev u) Hu2 (SNoLev z) Hz2.
        - prove x * y < z. exact H1.
      }
      apply LPz.
      * assume H2: P1 z. apply H2.
        let v. assume H2. apply H2.
        assume Hv: v :e SNoL x. assume H2. apply H2.
	let w. assume H2. apply H2.
	assume Hw: w :e SNoR y.
	assume Hvw: v * y + x * w <= z + v * w.
        apply SNoL_E x Hx v Hv.
        assume Hv1 Hv2 Hv3.
        apply SNoR_E y Hy w Hw.
        assume Hw1 Hw2 Hw3.
	claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim L3: u + v * w < z + v * w.
	{ apply SNoLtLe_tra (u + v * w) (v * y + x * w) (z + v * w)
			    (SNo_add_SNo u (v * w) Hu1 Lvw)
			    (SNo_add_SNo (v * y) (x * w)
			                 (SNo_mul_SNo v y Hv1 Hy)
					 (SNo_mul_SNo x w Hx Hw1))
	                    (SNo_add_SNo z (v * w) Hz1 Lvw).
	  - prove u + v * w < v * y + x * w.
	    exact L1 v Hv w Hw.
	  - exact Hvw.
	}
	claim L4: u < z.
	{ exact add_SNo_Lt1_cancel u (v * w) z Hu1 Lvw Hz1 L3. }
        apply SNoLt_irref u.
	exact SNoLt_tra u z u Hu1 Hz1 Hu1 L4 Hz3.
      * assume H2: P2 z. apply H2.
        let v. assume H2. apply H2.
        assume Hv: v :e SNoR x. assume H2. apply H2.
	let w. assume H2. apply H2.
	assume Hw: w :e SNoL y.
	assume Hvw: v * y + x * w <= z + v * w.
        apply SNoR_E x Hx v Hv.
        assume Hv1 Hv2 Hv3.
        apply SNoL_E y Hy w Hw.
        assume Hw1 Hw2 Hw3.
	claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim L5: u + v * w < z + v * w.
	{ apply SNoLtLe_tra (u + v * w) (v * y + x * w) (z + v * w)
			    (SNo_add_SNo u (v * w) Hu1 Lvw)
			    (SNo_add_SNo (v * y) (x * w)
			                 (SNo_mul_SNo v y Hv1 Hy)
					 (SNo_mul_SNo x w Hx Hw1))
	                    (SNo_add_SNo z (v * w) Hz1 Lvw).
	  - prove u + v * w < v * y + x * w.
	    exact L2 v Hv w Hw.
	  - exact Hvw.
	}
	claim L6: u < z.
	{ exact add_SNo_Lt1_cancel u (v * w) z Hu1 Lvw Hz1 L5. }
        apply SNoLt_irref u.
	exact SNoLt_tra u z u Hu1 Hz1 Hu1 L6 Hz3.
  - prove forall z :e R, SNoCut (SNoL u) (SNoR u) < z.
    let z. assume Hz.
    rewrite <- SNo_eta u Hu1.
    prove u < z.
    apply HRE z Hz.
    + let v. assume Hv: v :e SNoL x. let w. assume Hw: w :e SNoR y.
      assume Hze: z = v * y + x * w + - v * w.
      rewrite Hze.
      prove u < v * y + x * w + - v * w.
      apply SNoL_E x Hx v Hv.
      assume Hv1 Hv2 Hv3.
      apply SNoR_E y Hy w Hw.
      assume Hw1 Hw2 Hw3.
      apply add_SNo_minus_Lt2b3 (v * y) (x * w) (v * w) u (SNo_mul_SNo v y Hv1 Hy) (SNo_mul_SNo x w Hx Hw1) (SNo_mul_SNo v w Hv1 Hw1) Hu1.
      prove u + v * w < v * y + x * w.
      exact L1 v Hv w Hw.
    + let v. assume Hv: v :e SNoR x. let w. assume Hw: w :e SNoL y.
      assume Hze: z = v * y + x * w + - v * w.
      rewrite Hze.
      prove u < v * y + x * w + - v * w.
      apply SNoR_E x Hx v Hv.
      assume Hv1 Hv2 Hv3.
      apply SNoL_E y Hy w Hw.
      assume Hw1 Hw2 Hw3.
      apply add_SNo_minus_Lt2b3 (v * y) (x * w) (v * w) u (SNo_mul_SNo v y Hv1 Hy) (SNo_mul_SNo x w Hx Hw1) (SNo_mul_SNo v w Hv1 Hw1) Hu1.
      prove u + v * w < v * y + x * w.
      exact L2 v Hv w Hw.
}
let u.
assume Hu: u :e SNoR (x * y).
apply SNoR_E (x * y) Lxy u Hu.
assume Hu1: SNo u.
assume Hu2: SNoLev u :e SNoLev (x * y).
assume Hu3: x * y < u.
exact LI u Hu1 Hu2 Hu3.
Qed.

Theorem mul_SNo_SNoR_interpolate_impred : forall x y, SNo x -> SNo y -> forall u :e SNoR (x * y),
 forall p:prop,
     (forall v :e SNoL x, forall w :e SNoR y, v * y + x * w <= u + v * w -> p)
  -> (forall v :e SNoR x, forall w :e SNoL y, v * y + x * w <= u + v * w -> p)
  -> p.
let x y. assume Hx Hy. let u. assume Hu.
let p. assume Hp1 Hp2.
apply mul_SNo_SNoR_interpolate x y Hx Hy u Hu.
- assume H1. apply H1.
  let v. assume H1. apply H1.
  assume Hv. assume H1. apply H1.
  let w. assume H1. apply H1.
  assume Hw Hvw.
  exact Hp1 v Hv w Hw Hvw.
- assume H1. apply H1.
  let v. assume H1. apply H1.
  assume Hv. assume H1. apply H1.
  let w. assume H1. apply H1.
  assume Hw Hvw.
  exact Hp2 v Hv w Hw Hvw.
Qed.

(** This could be useful for proving L c= L', L = L', R c= R' or R = R'
    when corresponding conditions hold. **)
Theorem mul_SNo_Subq_lem : forall x y X Y Z W,
  forall U U',
      (forall u, u :e U ->
         (forall q:prop,
                (forall w0 :e X, forall w1 :e Y, u = w0 * y + x * w1 + - w0 * w1 -> q)
             -> (forall z0 :e Z, forall z1 :e W, u = z0 * y + x * z1 + - z0 * z1 -> q)
             -> q))
   -> (forall w0 :e X, forall w1 :e Y, w0 * y + x * w1 + - w0 * w1 :e U')
   -> (forall w0 :e Z, forall w1 :e W, w0 * y + x * w1 + - w0 * w1 :e U')
   -> U c= U'.
let x y X Y Z W U U'. assume HUE HU'I1 HU'I2.
let u. assume Hu: u :e U.
apply HUE u Hu.
- let w. assume Hw. let z. assume Hz Huwz. rewrite Huwz. apply HU'I1.
  + exact Hw.
  + exact Hz.
- let w. assume Hw. let z. assume Hz Huwz. rewrite Huwz. apply HU'I2.
  + exact Hw.
  + exact Hz.
Qed.

(** Part of Conway Chapter 2 Theorem 7 **)
Theorem mul_SNo_zeroR : forall x, SNo x -> x * 0 = 0.
let x.
assume Hx: SNo x.
apply mul_SNo_eq_2 x 0 Hx SNo_0.
let L R.
assume HLE HLI1 HLI2 HRE HRI1 HRI2 Hx0.
prove x * 0 = 0.
rewrite Hx0.
prove SNoCut L R = 0.
claim LL0: L = 0.
{ apply Empty_Subq_eq.
  let w. assume Hw: w :e L.
  prove False.
  apply HLE w Hw.
  - let u. assume Hu: u :e SNoL x.
    let v. rewrite SNoL_0. assume Hv: v :e 0.
    prove False.
    exact EmptyE v Hv.
  - let u. assume Hu: u :e SNoR x.
    let v. rewrite SNoR_0. assume Hv: v :e 0.
    prove False.
    exact EmptyE v Hv.
}
claim LR0: R = 0.
{ apply Empty_Subq_eq.
  let w. assume Hw: w :e R.
  prove False.
  apply HRE w Hw.
  - let u. assume Hu: u :e SNoL x.
    let v. rewrite SNoR_0. assume Hv: v :e 0.
    prove False.
    exact EmptyE v Hv.
  - let u. assume Hu: u :e SNoR x.
    let v. rewrite SNoL_0. assume Hv: v :e 0.
    prove False.
    exact EmptyE v Hv.
}
rewrite LL0. rewrite LR0.
exact SNoCut_0_0.
Qed.

Theorem mul_SNo_oneR : forall x, SNo x -> x * 1 = x.
apply SNoLev_ind.
let x. assume Hx.
assume IHx: forall w :e SNoS_ (SNoLev x), w * 1 = w.
apply mul_SNo_eq_3 x 1 Hx SNo_1.
let L R.
assume HLR HLE HLI1 HLI2 HRE HRI1 HRI2 Hx1e.
prove x * 1 = x.
apply mul_SNo_prop_1 x Hx 1 SNo_1.
assume Hx1: SNo (x * 1).
assume Hx11: forall u :e SNoL x, forall v :e SNoL 1, u * 1 + x * v < x * 1 + u * v.
assume Hx12: forall u :e SNoR x, forall v :e SNoR 1, u * 1 + x * v < x * 1 + u * v.
assume Hx13: forall u :e SNoL x, forall v :e SNoR 1, x * 1 + u * v < u * 1 + x * v.
assume Hx14: forall u :e SNoR x, forall v :e SNoL 1, x * 1 + u * v < u * 1 + x * v.
claim L0L1: 0 :e SNoL 1.
{ rewrite SNoL_1. exact In_0_1. }
rewrite Hx1e.
prove SNoCut L R = x.
rewrite SNo_eta x Hx.
prove SNoCut L R = SNoCut (SNoL x) (SNoR x).
apply SNoCut_ext L R (SNoL x) (SNoR x) HLR (SNoCutP_SNoL_SNoR x Hx).
- prove forall w :e L, w < SNoCut (SNoL x) (SNoR x).
  let w. assume Hw.
  apply SNoCutP_SNoCut_L (SNoL x) (SNoR x) (SNoCutP_SNoL_SNoR x Hx).
  prove w :e SNoL x.
  apply HLE w Hw.
  + let u. assume Hu: u :e SNoL x.
    let v. rewrite SNoL_1. assume Hv: v :e 1.
    apply cases_1 v Hv.
    assume Hwuv: w = u * 1 + x * 0 + - u * 0.
    apply SNoL_E x Hx u Hu.
    assume Hua _ _.
    claim L1: w = u.
    { rewrite Hwuv.
      transitivity u * 1 + 0, u * 1.
      - prove u * 1 + x * 0 + - u * 0 = u * 1 + 0.
        f_equal.
        prove x * 0 + - u * 0 = 0.
        transitivity x * 0 + 0, x * 0.
        + prove x * 0 + - u * 0 = x * 0 + 0.
          f_equal.
          prove - u * 0 = 0.
          transitivity - 0.
          * prove - u * 0 = - 0. f_equal. exact mul_SNo_zeroR u Hua.
          * exact minus_SNo_0.
        + prove x * 0 + 0 = x * 0. exact add_SNo_0R (x * 0) (SNo_mul_SNo x 0 Hx SNo_0).
        + prove x * 0 = 0. exact mul_SNo_zeroR x Hx.
      - prove u * 1 + 0 = u * 1. exact add_SNo_0R (u * 1) (SNo_mul_SNo u 1 Hua SNo_1).
      - prove u * 1 = u. exact IHx u (SNoL_SNoS x Hx u Hu).
    }
    rewrite L1. exact Hu.
  + let u. assume Hu: u :e SNoR x.
    let v. rewrite SNoR_1. assume Hv: v :e 0.
    prove False. exact EmptyE v Hv.
- prove forall z :e R, SNoCut (SNoL x) (SNoR x) < z.
  let z. assume Hz.
  apply SNoCutP_SNoCut_R (SNoL x) (SNoR x) (SNoCutP_SNoL_SNoR x Hx).
  prove z :e SNoR x.
  apply HRE z Hz.
  + let u. assume Hu: u :e SNoL x.
    let v. rewrite SNoR_1. assume Hv: v :e 0.
    prove False. exact EmptyE v Hv.
  + let u. assume Hu: u :e SNoR x.
    let v. rewrite SNoL_1. assume Hv: v :e 1.
    apply cases_1 v Hv.
    assume Hzuv: z = u * 1 + x * 0 + - u * 0.
    apply SNoR_E x Hx u Hu.
    assume Hua _ _.
    claim L1: z = u.
    { rewrite Hzuv.
      transitivity u * 1 + 0, u * 1.
      - prove u * 1 + x * 0 + - u * 0 = u * 1 + 0.
        f_equal.
        prove x * 0 + - u * 0 = 0.
        transitivity x * 0 + 0, x * 0.
        + prove x * 0 + - u * 0 = x * 0 + 0.
          f_equal.
          prove - u * 0 = 0.
          transitivity - 0.
          * prove - u * 0 = - 0. f_equal. exact mul_SNo_zeroR u Hua.
          * exact minus_SNo_0.
        + prove x * 0 + 0 = x * 0. exact add_SNo_0R (x * 0) (SNo_mul_SNo x 0 Hx SNo_0).
        + prove x * 0 = 0. exact mul_SNo_zeroR x Hx.
      - prove u * 1 + 0 = u * 1. exact add_SNo_0R (u * 1) (SNo_mul_SNo u 1 Hua SNo_1).
      - prove u * 1 = u. exact IHx u (SNoR_SNoS x Hx u Hu).
    }
    rewrite L1. exact Hu.
- prove forall w :e SNoL x, w < SNoCut L R.
  let w. assume Hw.
  apply SNoL_E x Hx w Hw.
  assume Hwa _ _.
  rewrite <- Hx1e.
  prove w < x * 1.
  claim L1: w * 1 + x * 0 = w.
  { transitivity w * 1 + 0, w * 1.
    - f_equal. prove x * 0 = 0. exact mul_SNo_zeroR x Hx.
    - exact add_SNo_0R (w * 1) (SNo_mul_SNo w 1 Hwa SNo_1).
    - exact IHx w (SNoL_SNoS x Hx w Hw).
  }
  claim L2: x * 1 + w * 0 = x * 1.
  { transitivity x * 1 + 0.
    - f_equal. exact mul_SNo_zeroR w Hwa.
    - exact add_SNo_0R (x * 1) (SNo_mul_SNo x 1 Hx SNo_1).
  }
  rewrite <- L1. rewrite <- L2.
  prove w * 1 + x * 0 < x * 1 + w * 0.
  exact Hx11 w Hw 0 L0L1.
- prove forall z :e SNoR x, SNoCut L R < z.
  let z. assume Hz.
  apply SNoR_E x Hx z Hz.
  assume Hza _ _.
  rewrite <- Hx1e.
  prove x * 1 < z.
  claim L1: x * 1 + z * 0 = x * 1.
  { transitivity x * 1 + 0.
    - f_equal. exact mul_SNo_zeroR z Hza.
    - exact add_SNo_0R (x * 1) (SNo_mul_SNo x 1 Hx SNo_1).
  }
  claim L2: z * 1 + x * 0 = z.
  { transitivity z * 1 + 0, z * 1.
    - f_equal. prove x * 0 = 0. exact mul_SNo_zeroR x Hx.
    - exact add_SNo_0R (z * 1) (SNo_mul_SNo z 1 Hza SNo_1).
    - exact IHx z (SNoR_SNoS x Hx z Hz).
  }
  rewrite <- L2. rewrite <- L1.
  exact Hx14 z Hz 0 L0L1.
Qed.

Theorem mul_SNo_com : forall x y, SNo x -> SNo y -> x * y = y * x.
apply SNoLev_ind2.
let x y.
assume Hx Hy.
assume IHx: forall w :e SNoS_ (SNoLev x), w * y = y * w.
assume IHy: forall z :e SNoS_ (SNoLev y), x * z = z * x.
assume IHxy: forall w :e SNoS_ (SNoLev x), forall z :e SNoS_ (SNoLev y), w * z = z * w.
apply mul_SNo_eq_3 x y Hx Hy.
let L R.
assume HLR HLE HLI1 HLI2 HRE HRI1 HRI2 Hxye.
apply mul_SNo_eq_3 y x Hy Hx.
let L' R'.
assume HL'R' HL'E HL'I1 HL'I2 HR'E HR'I1 HR'I2 Hyxe.
rewrite Hxye. rewrite Hyxe.
prove SNoCut L R = SNoCut L' R'.
claim LLL': L = L'.
{ apply set_ext.
  - prove L c= L'.
    apply mul_SNo_Subq_lem x y (SNoL x) (SNoL y) (SNoR x) (SNoR y) L L' HLE.
    + let u. assume Hu: u :e SNoL x.
      let v. assume Hv: v :e SNoL y.
      apply SNoL_E x Hx u Hu.
      assume Hua _ _.
      apply SNoL_E y Hy v Hv.
      assume Hva _ _.
      rewrite IHx u (SNoL_SNoS x Hx u Hu).
      rewrite IHy v (SNoL_SNoS y Hy v Hv).
      rewrite IHxy u (SNoL_SNoS x Hx u Hu) v (SNoL_SNoS y Hy v Hv).
      rewrite add_SNo_com_3_0_1 (y * u) (v * x) (- v * u)
                                (SNo_mul_SNo y u Hy Hua)
                                (SNo_mul_SNo v x Hva Hx)
                                (SNo_minus_SNo (v * u) (SNo_mul_SNo v u Hva Hua)).
      apply HL'I1.
      * exact Hv.
      * exact Hu.
    + let u. assume Hu: u :e SNoR x.
      let v. assume Hv: v :e SNoR y.
      apply SNoR_E x Hx u Hu.
      assume Hua _ _.
      apply SNoR_E y Hy v Hv.
      assume Hva _ _.
      rewrite IHx u (SNoR_SNoS x Hx u Hu).
      rewrite IHy v (SNoR_SNoS y Hy v Hv).
      rewrite IHxy u (SNoR_SNoS x Hx u Hu) v (SNoR_SNoS y Hy v Hv).
      rewrite add_SNo_com_3_0_1 (y * u) (v * x) (- v * u)
                                (SNo_mul_SNo y u Hy Hua)
                                (SNo_mul_SNo v x Hva Hx)
                                (SNo_minus_SNo (v * u) (SNo_mul_SNo v u Hva Hua)).
      apply HL'I2.
      * exact Hv.
      * exact Hu.
  - prove L' c= L.
    apply mul_SNo_Subq_lem y x (SNoL y) (SNoL x) (SNoR y) (SNoR x) L' L HL'E.
    + let v. assume Hv: v :e SNoL y.
      let u. assume Hu: u :e SNoL x.
      apply SNoL_E x Hx u Hu.
      assume Hua _ _.
      apply SNoL_E y Hy v Hv.
      assume Hva _ _.
      rewrite <- IHx u (SNoL_SNoS x Hx u Hu).
      rewrite <- IHy v (SNoL_SNoS y Hy v Hv).
      rewrite <- IHxy u (SNoL_SNoS x Hx u Hu) v (SNoL_SNoS y Hy v Hv).
      rewrite add_SNo_com_3_0_1 (x * v) (u * y) (- u * v)
                                (SNo_mul_SNo x v Hx Hva)
                                (SNo_mul_SNo u y Hua Hy)
                                (SNo_minus_SNo (u * v) (SNo_mul_SNo u v Hua Hva)).
      apply HLI1.
      * exact Hu.
      * exact Hv.
    + let v. assume Hv: v :e SNoR y.
      let u. assume Hu: u :e SNoR x.
      apply SNoR_E x Hx u Hu.
      assume Hua _ _.
      apply SNoR_E y Hy v Hv.
      assume Hva _ _.
      rewrite <- IHx u (SNoR_SNoS x Hx u Hu).
      rewrite <- IHy v (SNoR_SNoS y Hy v Hv).
      rewrite <- IHxy u (SNoR_SNoS x Hx u Hu) v (SNoR_SNoS y Hy v Hv).
      rewrite add_SNo_com_3_0_1 (x * v) (u * y) (- u * v)
                                (SNo_mul_SNo x v Hx Hva)
                                (SNo_mul_SNo u y Hua Hy)
                                (SNo_minus_SNo (u * v) (SNo_mul_SNo u v Hua Hva)).
      apply HLI2.
      * exact Hu.
      * exact Hv.
}
claim LRR': R = R'.
{ apply set_ext.
  - apply mul_SNo_Subq_lem x y (SNoL x) (SNoR y) (SNoR x) (SNoL y) R R' HRE.
    + let u. assume Hu: u :e SNoL x.
      let v. assume Hv: v :e SNoR y.
      apply SNoL_E x Hx u Hu.
      assume Hua _ _.
      apply SNoR_E y Hy v Hv.
      assume Hva _ _.
      rewrite IHx u (SNoL_SNoS x Hx u Hu).
      rewrite IHy v (SNoR_SNoS y Hy v Hv).
      rewrite IHxy u (SNoL_SNoS x Hx u Hu) v (SNoR_SNoS y Hy v Hv).
      rewrite add_SNo_com_3_0_1 (y * u) (v * x) (- v * u)
                                (SNo_mul_SNo y u Hy Hua)
                                (SNo_mul_SNo v x Hva Hx)
                                (SNo_minus_SNo (v * u) (SNo_mul_SNo v u Hva Hua)).
      apply HR'I2.
      * exact Hv.
      * exact Hu.
    + let u. assume Hu: u :e SNoR x.
      let v. assume Hv: v :e SNoL y.
      apply SNoR_E x Hx u Hu.
      assume Hua _ _.
      apply SNoL_E y Hy v Hv.
      assume Hva _ _.
      rewrite IHx u (SNoR_SNoS x Hx u Hu).
      rewrite IHy v (SNoL_SNoS y Hy v Hv).
      rewrite IHxy u (SNoR_SNoS x Hx u Hu) v (SNoL_SNoS y Hy v Hv).
      rewrite add_SNo_com_3_0_1 (y * u) (v * x) (- v * u)
                                (SNo_mul_SNo y u Hy Hua)
                                (SNo_mul_SNo v x Hva Hx)
                                (SNo_minus_SNo (v * u) (SNo_mul_SNo v u Hva Hua)).
      apply HR'I1.
      * exact Hv.
      * exact Hu.
  - apply mul_SNo_Subq_lem y x (SNoL y) (SNoR x) (SNoR y) (SNoL x) R' R HR'E.
    + let v. assume Hv: v :e SNoL y.
      let u. assume Hu: u :e SNoR x.
      apply SNoR_E x Hx u Hu.
      assume Hua _ _.
      apply SNoL_E y Hy v Hv.
      assume Hva _ _.
      rewrite <- IHx u (SNoR_SNoS x Hx u Hu).
      rewrite <- IHy v (SNoL_SNoS y Hy v Hv).
      rewrite <- IHxy u (SNoR_SNoS x Hx u Hu) v (SNoL_SNoS y Hy v Hv).
      rewrite add_SNo_com_3_0_1 (x * v) (u * y) (- u * v)
                                (SNo_mul_SNo x v Hx Hva)
                                (SNo_mul_SNo u y Hua Hy)
                                (SNo_minus_SNo (u * v) (SNo_mul_SNo u v Hua Hva)).
      apply HRI2.
      * exact Hu.
      * exact Hv.
    + let v. assume Hv: v :e SNoR y.
      let u. assume Hu: u :e SNoL x.
      apply SNoL_E x Hx u Hu.
      assume Hua _ _.
      apply SNoR_E y Hy v Hv.
      assume Hva _ _.
      rewrite <- IHx u (SNoL_SNoS x Hx u Hu).
      rewrite <- IHy v (SNoR_SNoS y Hy v Hv).
      rewrite <- IHxy u (SNoL_SNoS x Hx u Hu) v (SNoR_SNoS y Hy v Hv).
      rewrite add_SNo_com_3_0_1 (x * v) (u * y) (- u * v)
                                (SNo_mul_SNo x v Hx Hva)
                                (SNo_mul_SNo u y Hua Hy)
                                (SNo_minus_SNo (u * v) (SNo_mul_SNo u v Hua Hva)).
      apply HRI1.
      * exact Hu.
      * exact Hv.
}
rewrite LLL'. rewrite LRR'.
reflexivity.
Qed.

Theorem mul_SNo_minus_distrL : forall x y, SNo x -> SNo y -> (- x) * y = - x * y.
apply SNoLev_ind2.
let x y.
assume Hx Hy.
assume IHx: forall w :e SNoS_ (SNoLev x), (- w) * y = - w * y.
assume IHy: forall z :e SNoS_ (SNoLev y), (- x) * z = - x * z.
assume IHxy: forall w :e SNoS_ (SNoLev x), forall z :e SNoS_ (SNoLev y), (- w) * z = - w * z.
claim Lmx: SNo (- x).
{ exact SNo_minus_SNo x Hx. }
apply mul_SNo_eq_3 x y Hx Hy.
let L R.
assume HLR HLE HLI1 HLI2 HRE HRI1 HRI2.
assume Hxye: x * y = SNoCut L R.
apply mul_SNo_eq_3 (- x) y (SNo_minus_SNo x Hx) Hy.
let L' R'.
assume HL'R' HL'E HL'I1 HL'I2 HR'E HR'I1 HR'I2.
assume Hmxye: (- x) * y = SNoCut L' R'.
claim L1: - (x * y) = SNoCut {- z | z :e R} {- w | w :e L}.
{ rewrite Hxye. exact minus_SNoCut_eq L R HLR. }
rewrite L1. rewrite Hmxye.
prove SNoCut L' R' = SNoCut {- z | z :e R} {- w | w :e L}.
f_equal.
- prove L' = {- z | z :e R}.
  apply set_ext.
  + apply mul_SNo_Subq_lem (- x) y (SNoL (- x)) (SNoL y) (SNoR (- x)) (SNoR y) L' {- z | z :e R} HL'E.
    * { let u. assume Hu: u :e SNoL (- x).
        let v. assume Hv: v :e SNoL y.
        apply SNoL_E (- x) Lmx u Hu.
        assume Hua: SNo u.
        assume Hub: SNoLev u :e SNoLev (- x).
        assume Huc: u < - x.
        apply SNoL_E y Hy v Hv.
        assume Hva _ _.
        claim Lmu1: SNo (- u).
        { exact SNo_minus_SNo u Hua. }
        claim Lmu2: - u :e SNoR x.
        { apply SNoR_I x Hx (- u) Lmu1.
          - prove SNoLev (- u) :e SNoLev x.
            rewrite minus_SNo_Lev u Hua.
            rewrite <- minus_SNo_Lev x Hx.
            exact Hub.
          - prove x < - u. exact minus_SNo_Lt_contra2 u x Hua Hx Huc.
        }
        prove u * y + (- x) * v + - u * v :e {- z | z :e R}.
        claim L1: u * y + (- x) * v + - u * v = - ((- u) * y + x * v + - (- u) * v).
        { symmetry.
          transitivity - (- u) * y + - x * v + - - (- u) * v.
          - exact minus_add_SNo_distr_3 ((- u) * y) (x * v) (- (- u) * v)
                          (SNo_mul_SNo (- u) y Lmu1 Hy)
                          (SNo_mul_SNo x v Hx Hva)
                          (SNo_minus_SNo ((- u) * v) (SNo_mul_SNo (- u) v Lmu1 Hva)).
          - f_equal.
            + prove - (- u) * y = u * y.
              transitivity (- - u) * y.
              * symmetry. exact IHx (- u) (SNoR_SNoS x Hx (- u) Lmu2).
              * rewrite minus_SNo_invol u Hua. reflexivity.
            + f_equal.
              * prove - x * v = (- x) * v.
                symmetry.
                exact IHy v (SNoL_SNoS y Hy v Hv).
              * { f_equal. prove - (- u) * v = u * v.
                  transitivity (- - u) * v.
                  - symmetry. prove (- - u) * v = - (- u) * v.
                    exact IHxy (- u) (SNoR_SNoS x Hx (- u) Lmu2) v (SNoL_SNoS y Hy v Hv).
                  - rewrite minus_SNo_invol u Hua. reflexivity.
                }
        }
        rewrite L1.
        prove - ((- u) * y + x * v + - (- u) * v) :e {- z | z :e R}.
        apply ReplI R (fun z => - z).
        prove (- u) * y + x * v + - (- u) * v :e R.
        apply HRI2.
        - prove - u :e SNoR x. exact Lmu2.
        - prove v :e SNoL y. exact Hv.
      }
    * { let u. assume Hu: u :e SNoR (- x).
        let v. assume Hv: v :e SNoR y.
        apply SNoR_E (- x) Lmx u Hu.
        assume Hua: SNo u.
        assume Hub: SNoLev u :e SNoLev (- x).
        assume Huc: -x < u.
        apply SNoR_E y Hy v Hv.
        assume Hva _ _.
        claim Lmu1: SNo (- u).
        { exact SNo_minus_SNo u Hua. }
        claim Lmu2: - u :e SNoL x.
        { apply SNoL_I x Hx (- u) Lmu1.
          - prove SNoLev (- u) :e SNoLev x.
            rewrite minus_SNo_Lev u Hua.
            rewrite <- minus_SNo_Lev x Hx.
            exact Hub.
          - prove -u < x. exact minus_SNo_Lt_contra1 x u Hx Hua Huc.
        }
        prove u * y + (- x) * v + - u * v :e {- z | z :e R}.
        claim L1: u * y + (- x) * v + - u * v = - ((- u) * y + x * v + - (- u) * v).
        { symmetry.
          transitivity - (- u) * y + - x * v + - - (- u) * v.
          - exact minus_add_SNo_distr_3 ((- u) * y) (x * v) (- (- u) * v)
                          (SNo_mul_SNo (- u) y Lmu1 Hy)
                          (SNo_mul_SNo x v Hx Hva)
                          (SNo_minus_SNo ((- u) * v) (SNo_mul_SNo (- u) v Lmu1 Hva)).
          - f_equal.
            + prove - (- u) * y = u * y.
              transitivity (- - u) * y.
              * symmetry. exact IHx (- u) (SNoL_SNoS x Hx (- u) Lmu2).
              * rewrite minus_SNo_invol u Hua. reflexivity.
            + f_equal.
              * prove - x * v = (- x) * v.
                symmetry.
                exact IHy v (SNoR_SNoS y Hy v Hv).
              * { f_equal. prove - (- u) * v = u * v.
                  transitivity (- - u) * v.
                  - symmetry. prove (- - u) * v = - (- u) * v.
                    exact IHxy (- u) (SNoL_SNoS x Hx (- u) Lmu2) v (SNoR_SNoS y Hy v Hv).
                  - rewrite minus_SNo_invol u Hua. reflexivity.
                }
        }
        rewrite L1.
        prove - ((- u) * y + x * v + - (- u) * v) :e {- z | z :e R}.
        apply ReplI R (fun z => - z).
        prove (- u) * y + x * v + - (- u) * v :e R.
        apply HRI1.
        - prove - u :e SNoL x. exact Lmu2.
        - prove v :e SNoR y. exact Hv.
      }
  + prove {- z | z :e R} c= L'.
    let a. assume Ha.
    apply ReplE_impred R (fun z => - z) a Ha.
    let z. assume Hz: z :e R. assume Hze: a = - z.
    rewrite Hze.
    prove - z :e L'.
    apply HRE z Hz.
    * { let u. assume Hu: u :e SNoL x.
        let v. assume Hv: v :e SNoR y.
        assume Hzuv: z = u * y + x * v + - u * v.
        apply SNoL_E x Hx u Hu.
        assume Hua: SNo u.
        assume Hub: SNoLev u :e SNoLev x.
        assume Huc: u < x.
        apply SNoR_E y Hy v Hv.
        assume Hva _ _.
        claim Lmu1: SNo (- u).
        { exact SNo_minus_SNo u Hua. }
        claim Lmu2: - u :e SNoR (- x).
        { apply SNoR_I (- x) (SNo_minus_SNo x Hx) (- u) Lmu1.
          - prove SNoLev (- u) :e SNoLev (- x).
            rewrite minus_SNo_Lev u Hua.
            rewrite minus_SNo_Lev x Hx.
            exact Hub.
          - prove -x < -u. exact minus_SNo_Lt_contra u x Hua Hx Huc.
        }
        claim L1: - z = (- u) * y + (- x) * v + - (- u) * v.
        { rewrite Hzuv.
          rewrite minus_add_SNo_distr_3 (u * y) (x * v) (- (u * v))
                                        (SNo_mul_SNo u y Hua Hy)
                                        (SNo_mul_SNo x v Hx Hva)
                                        (SNo_minus_SNo (u * v) (SNo_mul_SNo u v Hua Hva)).
          f_equal.
          - prove - (u * y) = (- u) * y. symmetry. exact IHx u (SNoL_SNoS x Hx u Hu).
          - f_equal.
            + prove - (x * v) = (- x) * v. symmetry. exact IHy v (SNoR_SNoS y Hy v Hv).
            + f_equal. prove - (u * v) = (- u) * v. symmetry. exact IHxy u (SNoL_SNoS x Hx u Hu) v (SNoR_SNoS y Hy v Hv).
        }
        rewrite L1.
        prove (- u) * y + (- x) * v + - (- u) * v :e L'.
        apply HL'I2.
        + exact Lmu2.
        + exact Hv.
      }
    * { let u. assume Hu: u :e SNoR x.
        let v. assume Hv: v :e SNoL y.
        assume Hzuv: z = u * y + x * v + - u * v.
        apply SNoR_E x Hx u Hu.
        assume Hua: SNo u.
        assume Hub: SNoLev u :e SNoLev x.
        assume Huc: x < u.
        apply SNoL_E y Hy v Hv.
        assume Hva _ _.
        claim Lmu1: SNo (- u).
        { exact SNo_minus_SNo u Hua. }
        claim Lmu2: - u :e SNoL (- x).
        { apply SNoL_I (- x) (SNo_minus_SNo x Hx) (- u) Lmu1.
          - prove SNoLev (- u) :e SNoLev (- x).
            rewrite minus_SNo_Lev u Hua.
            rewrite minus_SNo_Lev x Hx.
            exact Hub.
          - prove -u < -x. exact minus_SNo_Lt_contra x u Hx Hua Huc.
        }
        claim L1: - z = (- u) * y + (- x) * v + - (- u) * v.
        { rewrite Hzuv.
          rewrite minus_add_SNo_distr_3 (u * y) (x * v) (- (u * v))
                                        (SNo_mul_SNo u y Hua Hy)
                                        (SNo_mul_SNo x v Hx Hva)
                                        (SNo_minus_SNo (u * v) (SNo_mul_SNo u v Hua Hva)).
          f_equal.
          - prove - (u * y) = (- u) * y. symmetry. exact IHx u (SNoR_SNoS x Hx u Hu).
          - f_equal.
            + prove - (x * v) = (- x) * v. symmetry. exact IHy v (SNoL_SNoS y Hy v Hv).
            + f_equal. prove - (u * v) = (- u) * v. symmetry. exact IHxy u (SNoR_SNoS x Hx u Hu) v (SNoL_SNoS y Hy v Hv).
        }
        rewrite L1.
        prove (- u) * y + (- x) * v + - (- u) * v :e L'.
        apply HL'I1.
        + exact Lmu2.
        + exact Hv.
      }
- prove R' = {- w | w :e L}.
  apply set_ext.
  + apply mul_SNo_Subq_lem (- x) y (SNoL (- x)) (SNoR y) (SNoR (- x)) (SNoL y) R' {- w | w :e L} HR'E.
    * { let u. assume Hu: u :e SNoL (- x).
        let v. assume Hv: v :e SNoR y.
        apply SNoL_E (- x) Lmx u Hu.
        assume Hua: SNo u.
        assume Hub: SNoLev u :e SNoLev (- x).
        assume Huc: u < - x.
        apply SNoR_E y Hy v Hv.
        assume Hva _ _.
        claim Lmu1: SNo (- u).
        { exact SNo_minus_SNo u Hua. }
        claim Lmu2: - u :e SNoR x.
        { apply SNoR_I x Hx (- u) Lmu1.
          - prove SNoLev (- u) :e SNoLev x.
            rewrite minus_SNo_Lev u Hua.
            rewrite <- minus_SNo_Lev x Hx.
            exact Hub.
          - prove x < - u. exact minus_SNo_Lt_contra2 u x Hua Hx Huc.
        }
        prove u * y + (- x) * v + - u * v :e {- w | w :e L}.
        claim L1: u * y + (- x) * v + - u * v = - ((- u) * y + x * v + - (- u) * v).
        { symmetry.
          transitivity - (- u) * y + - x * v + - - (- u) * v.
          - exact minus_add_SNo_distr_3 ((- u) * y) (x * v) (- (- u) * v)
                          (SNo_mul_SNo (- u) y Lmu1 Hy)
                          (SNo_mul_SNo x v Hx Hva)
                          (SNo_minus_SNo ((- u) * v) (SNo_mul_SNo (- u) v Lmu1 Hva)).
          - f_equal.
            + prove - (- u) * y = u * y.
              transitivity (- - u) * y.
              * symmetry. exact IHx (- u) (SNoR_SNoS x Hx (- u) Lmu2).
              * rewrite minus_SNo_invol u Hua. reflexivity.
            + f_equal.
              * prove - x * v = (- x) * v.
                symmetry.
                exact IHy v (SNoR_SNoS y Hy v Hv).
              * { f_equal. prove - (- u) * v = u * v.
                  transitivity (- - u) * v.
                  - symmetry. prove (- - u) * v = - (- u) * v.
                    exact IHxy (- u) (SNoR_SNoS x Hx (- u) Lmu2) v (SNoR_SNoS y Hy v Hv).
                  - rewrite minus_SNo_invol u Hua. reflexivity.
                }
        }
        rewrite L1.
        prove - ((- u) * y + x * v + - (- u) * v) :e {- w | w :e L}.
        apply ReplI L (fun w => - w).
        prove (- u) * y + x * v + - (- u) * v :e L.
        apply HLI2.
        - prove - u :e SNoR x. exact Lmu2.
        - prove v :e SNoR y. exact Hv.
      }
    * { let u. assume Hu: u :e SNoR (- x).
        let v. assume Hv: v :e SNoL y.
        apply SNoR_E (- x) Lmx u Hu.
        assume Hua: SNo u.
        assume Hub: SNoLev u :e SNoLev (- x).
        assume Huc: -x < u.
        apply SNoL_E y Hy v Hv.
        assume Hva _ _.
        claim Lmu1: SNo (- u).
        { exact SNo_minus_SNo u Hua. }
        claim Lmu2: - u :e SNoL x.
        { apply SNoL_I x Hx (- u) Lmu1.
          - prove SNoLev (- u) :e SNoLev x.
            rewrite minus_SNo_Lev u Hua.
            rewrite <- minus_SNo_Lev x Hx.
            exact Hub.
          - prove -u < x. exact minus_SNo_Lt_contra1 x u Hx Hua Huc.
        }
        prove u * y + (- x) * v + - u * v :e {- w | w :e L}.
        claim L1: u * y + (- x) * v + - u * v = - ((- u) * y + x * v + - (- u) * v).
        { symmetry.
          transitivity - (- u) * y + - x * v + - - (- u) * v.
          - exact minus_add_SNo_distr_3 ((- u) * y) (x * v) (- (- u) * v)
                          (SNo_mul_SNo (- u) y Lmu1 Hy)
                          (SNo_mul_SNo x v Hx Hva)
                          (SNo_minus_SNo ((- u) * v) (SNo_mul_SNo (- u) v Lmu1 Hva)).
          - f_equal.
            + prove - (- u) * y = u * y.
              transitivity (- - u) * y.
              * symmetry. exact IHx (- u) (SNoL_SNoS x Hx (- u) Lmu2).
              * rewrite minus_SNo_invol u Hua. reflexivity.
            + f_equal.
              * prove - x * v = (- x) * v.
                symmetry.
                exact IHy v (SNoL_SNoS y Hy v Hv).
              * { f_equal. prove - (- u) * v = u * v.
                  transitivity (- - u) * v.
                  - symmetry. prove (- - u) * v = - (- u) * v.
                    exact IHxy (- u) (SNoL_SNoS x Hx (- u) Lmu2) v (SNoL_SNoS y Hy v Hv).
                  - rewrite minus_SNo_invol u Hua. reflexivity.
                }
        }
        rewrite L1.
        prove - ((- u) * y + x * v + - (- u) * v) :e {- w | w :e L}.
        apply ReplI L (fun w => - w).
        prove (- u) * y + x * v + - (- u) * v :e L.
        apply HLI1.
        - prove - u :e SNoL x. exact Lmu2.
        - prove v :e SNoL y. exact Hv.
      }
  + prove {- w | w :e L} c= R'.
    let a. assume Ha.
    apply ReplE_impred L (fun w => - w) a Ha.
    let w. assume Hw: w :e L. assume Hwe: a = - w.
    rewrite Hwe.
    prove - w :e R'.
    apply HLE w Hw.
    * { let u. assume Hu: u :e SNoL x.
        let v. assume Hv: v :e SNoL y.
        assume Hwuv: w = u * y + x * v + - u * v.
        apply SNoL_E x Hx u Hu.
        assume Hua: SNo u.
        assume Hub: SNoLev u :e SNoLev x.
        assume Huc: u < x.
        apply SNoL_E y Hy v Hv.
        assume Hva _ _.
        claim Lmu1: SNo (- u).
        { exact SNo_minus_SNo u Hua. }
        claim Lmu2: - u :e SNoR (- x).
        { apply SNoR_I (- x) (SNo_minus_SNo x Hx) (- u) Lmu1.
          - prove SNoLev (- u) :e SNoLev (- x).
            rewrite minus_SNo_Lev u Hua.
            rewrite minus_SNo_Lev x Hx.
            exact Hub.
          - prove -x < -u. exact minus_SNo_Lt_contra u x Hua Hx Huc.
        }
        claim L1: - w = (- u) * y + (- x) * v + - (- u) * v.
        { rewrite Hwuv.
          rewrite minus_add_SNo_distr_3 (u * y) (x * v) (- (u * v))
                                        (SNo_mul_SNo u y Hua Hy)
                                        (SNo_mul_SNo x v Hx Hva)
                                        (SNo_minus_SNo (u * v) (SNo_mul_SNo u v Hua Hva)).
          f_equal.
          - prove - (u * y) = (- u) * y. symmetry. exact IHx u (SNoL_SNoS x Hx u Hu).
          - f_equal.
            + prove - (x * v) = (- x) * v. symmetry. exact IHy v (SNoL_SNoS y Hy v Hv).
            + f_equal. prove - (u * v) = (- u) * v. symmetry. exact IHxy u (SNoL_SNoS x Hx u Hu) v (SNoL_SNoS y Hy v Hv).
        }
        rewrite L1.
        prove (- u) * y + (- x) * v + - (- u) * v :e R'.
        apply HR'I2.
        + exact Lmu2.
        + exact Hv.
      }
    * { let u. assume Hu: u :e SNoR x.
        let v. assume Hv: v :e SNoR y.
        assume Hwuv: w = u * y + x * v + - u * v.
        apply SNoR_E x Hx u Hu.
        assume Hua: SNo u.
        assume Hub: SNoLev u :e SNoLev x.
        assume Huc: x < u.
        apply SNoR_E y Hy v Hv.
        assume Hva _ _.
        claim Lmu1: SNo (- u).
        { exact SNo_minus_SNo u Hua. }
        claim Lmu2: - u :e SNoL (- x).
        { apply SNoL_I (- x) (SNo_minus_SNo x Hx) (- u) Lmu1.
          - prove SNoLev (- u) :e SNoLev (- x).
            rewrite minus_SNo_Lev u Hua.
            rewrite minus_SNo_Lev x Hx.
            exact Hub.
          - prove -u < -x. exact minus_SNo_Lt_contra x u Hx Hua Huc.
        }
        claim L1: - w = (- u) * y + (- x) * v + - (- u) * v.
        { rewrite Hwuv.
          rewrite minus_add_SNo_distr_3 (u * y) (x * v) (- (u * v))
                                        (SNo_mul_SNo u y Hua Hy)
                                        (SNo_mul_SNo x v Hx Hva)
                                        (SNo_minus_SNo (u * v) (SNo_mul_SNo u v Hua Hva)).
          f_equal.
          - prove - (u * y) = (- u) * y. symmetry. exact IHx u (SNoR_SNoS x Hx u Hu).
          - f_equal.
            + prove - (x * v) = (- x) * v. symmetry. exact IHy v (SNoR_SNoS y Hy v Hv).
            + f_equal. prove - (u * v) = (- u) * v. symmetry. exact IHxy u (SNoR_SNoS x Hx u Hu) v (SNoR_SNoS y Hy v Hv).
        }
        rewrite L1.
        prove (- u) * y + (- x) * v + - (- u) * v :e R'.
        apply HR'I1.
        + exact Lmu2.
        + exact Hv.
      }
Qed.

Theorem mul_SNo_minus_distrR: forall x y, SNo x -> SNo y -> x * (- y) = - (x * y).
let x y. assume Hx Hy.
rewrite mul_SNo_com x y Hx Hy.
rewrite mul_SNo_com x (- y) Hx (SNo_minus_SNo y Hy).
exact mul_SNo_minus_distrL y x Hy Hx.
Qed.

Theorem mul_SNo_distrR : forall x y z, SNo x -> SNo y -> SNo z
  -> (x + y) * z = x * z + y * z.
set P : set -> set -> set -> prop := fun x y z => (x + y) * z = x * z + y * z.
prove forall x y z, SNo x -> SNo y -> SNo z -> P x y z.
apply SNoLev_ind3 P.
let x y z. assume Hx Hy Hz.
assume IHx: forall u :e SNoS_ (SNoLev x), (u + y) * z = u * z + y * z.
assume IHy: forall v :e SNoS_ (SNoLev y), (x + v) * z = x * z + v * z.
assume IHz: forall w :e SNoS_ (SNoLev z), (x + y) * w = x * w + y * w.
assume IHxy: forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), (u + v) * z = u * z + v * z.
assume IHxz: forall u :e SNoS_ (SNoLev x), forall w :e SNoS_ (SNoLev z), (u + y) * w = u * w + y * w.
assume IHyz: forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), (x + v) * w = x * w + v * w.
assume IHxyz: forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), (u + v) * w = u * w + v * w.
prove (x + y) * z = x * z + y * z.
apply mul_SNo_eq_3 (x + y) z (SNo_add_SNo x y Hx Hy) Hz.
let L R. assume HLR HLE HLI1 HLI2 HRE HRI1 HRI2.
assume HE: (x + y) * z = SNoCut L R.
set L1 := {w + y * z | w :e SNoL (x * z)}.
set L2 := {x * z + w | w :e SNoL (y * z)}.
set R1 := {w + y * z | w :e SNoR (x * z)}.
set R2 := {x * z + w | w :e SNoR (y * z)}.
claim Lxy: SNo (x + y).
{ exact SNo_add_SNo x y Hx Hy. }
claim Lxyz: SNo ((x + y) * z).
{ exact SNo_mul_SNo (x + y) z Lxy Hz. }
claim Lxz: SNo (x * z).
{ exact SNo_mul_SNo x z Hx Hz. }
claim Lyz: SNo (y * z).
{ exact SNo_mul_SNo y z Hy Hz. }
claim Lxzyz: SNo (x * z + y * z).
{ exact SNo_add_SNo (x * z) (y * z) Lxz Lyz. }
claim LE: x * z + y * z = SNoCut (L1 :\/: L2) (R1 :\/: R2).
{ exact add_SNo_eq (x * z) (SNo_mul_SNo x z Hx Hz) (y * z) (SNo_mul_SNo y z Hy Hz). }
rewrite HE. rewrite LE.
apply SNoCut_ext.
- exact HLR.
- exact add_SNo_SNoCutP (x * z) (y * z) (SNo_mul_SNo x z Hx Hz) (SNo_mul_SNo y z Hy Hz).
- let u. assume Hu: u :e L. rewrite <- LE.
  prove u < x * z + y * z.
  apply HLE u Hu.
  + let v. assume Hv: v :e SNoL (x + y).
    let w. assume Hw: w :e SNoL z.
    assume Hue: u = v * z + (x + y) * w + - v * w.
    rewrite Hue.
    prove v * z + (x + y) * w + - v * w < x * z + y * z.
    apply SNoL_E (x + y) Lxy v Hv.
    assume Hv1 Hv2 Hv3.
    apply SNoL_E z Hz w Hw.
    assume Hw1 Hw2 Hw3.
    claim Lxw: SNo (x * w).
    { exact SNo_mul_SNo x w Hx Hw1. }
    claim Lyw: SNo (y * w).
    { exact SNo_mul_SNo y w Hy Hw1. }
    claim Lvz: SNo (v * z).
    { exact SNo_mul_SNo v z Hv1 Hz. }
    claim Lxyw: SNo ((x + y) * w).
    { exact SNo_mul_SNo (x + y) w Lxy Hw1. }
    claim Lxwyw: SNo (x * w + y * w).
    { exact SNo_add_SNo (x * w) (y * w) Lxw Lyw. }
    claim Lvw: SNo (v * w).
    { exact SNo_mul_SNo v w Hv1 Hw1. }
    claim Lvzxwyw: SNo (v * z + x * w + y * w).
    { exact SNo_add_SNo_3 (v * z) (x * w) (y * w) Lvz Lxw Lyw. }
    claim Lxzyzvw: SNo (x * z + y * z + v * w).
    { exact SNo_add_SNo_3 (x * z) (y * z) (v * w) Lxz Lyz Lvw. }
    apply add_SNo_minus_Lt1b3 (v * z) ((x + y) * w) (v * w) (x * z + y * z)
                              Lvz Lxyw Lvw Lxzyz.
    prove v * z + (x + y) * w < (x * z + y * z) + v * w.
    rewrite IHz w (SNoL_SNoS z Hz w Hw).
    prove v * z + x * w + y * w < (x * z + y * z) + v * w.
    rewrite <- add_SNo_assoc (x * z) (y * z) (v * w) Lxz Lyz Lvw.
    prove v * z + x * w + y * w < x * z + y * z + v * w.
    apply add_SNo_SNoL_interpolate x y Hx Hy v Hv.
    * { assume H1. apply H1.
        let u. assume H1. apply H1.
        assume Hu: u :e SNoL x.
        assume Hvu: v <= u + y.
        apply SNoL_E x Hx u Hu.
        assume Hu1 Hu2 Hu3.
        claim Luw: SNo (u * w).
        { exact SNo_mul_SNo u w Hu1 Hw1. }
        claim Luz: SNo (u * z).
        { exact SNo_mul_SNo u z Hu1 Hz. }
	claim Luy: SNo (u + y).
	{ exact SNo_add_SNo u y Hu1 Hy. }
        apply add_SNo_Lt1_cancel (v * z + x * w + y * w)
                                 (u * w)
                                 (x * z + y * z + v * w)
  			         Lvzxwyw Luw Lxzyzvw.
        prove (v * z + x * w + y * w) + u * w < (x * z + y * z + v * w) + u * w.
	rewrite <- add_SNo_assoc_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw.
	rewrite <- add_SNo_assoc_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw.
        prove v * z + x * w + y * w + u * w < x * z + y * z + v * w + u * w.
        apply SNoLeLt_tra (v * z + x * w + y * w + u * w)
                          (u * z + y * z + v * w + x * w)
                          (x * z + y * z + v * w + u * w)
			  (SNo_add_SNo_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw)
			  (SNo_add_SNo_4 (u * z) (y * z) (v * w) (x * w) Luz Lyz Lvw Lxw)
			  (SNo_add_SNo_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw).
        - prove v * z + x * w + y * w + u * w <= u * z + y * z + v * w + x * w.
	  rewrite add_SNo_com_3_0_1 (v * z) (x * w) (y * w + u * w) Lvz Lxw (SNo_add_SNo (y * w) (u * w) Lyw Luw).
	  prove x * w + v * z + y * w + u * w <= u * z + y * z + v * w + x * w.
          rewrite add_SNo_rotate_4_1 (u * z) (y * z) (v * w) (x * w) Luz Lyz Lvw Lxw.
	  prove x * w + v * z + y * w + u * w <= x * w + u * z + y * z + v * w.
	  apply add_SNo_Le2 (x * w) (v * z + y * w + u * w) (u * z + y * z + v * w)
	                    Lxw
			    (SNo_add_SNo_3 (v * z) (y * w) (u * w) Lvz Lyw Luw)
			    (SNo_add_SNo_3 (u * z) (y * z) (v * w) Luz Lyz Lvw).
          prove v * z + y * w + u * w <= u * z + y * z + v * w.
          rewrite add_SNo_com (y * w) (u * w) Lyw Luw.
	  prove v * z + u * w + y * w <= u * z + y * z + v * w.
	  rewrite <- IHxz u (SNoL_SNoS x Hx u Hu) w (SNoL_SNoS z Hz w Hw).
	  prove v * z + (u + y) * w <= u * z + y * z + v * w.
	  rewrite add_SNo_assoc (u * z) (y * z) (v * w) Luz Lyz Lvw.
	  prove v * z + (u + y) * w <= (u * z + y * z) + v * w.
	  rewrite <- IHx u (SNoL_SNoS x Hx u Hu).
	  prove v * z + (u + y) * w <= (u + y) * z + v * w.
	  apply mul_SNo_Le (u + y) z v w Luy Hz Hv1 Hw1.
	  + prove v <= u + y. exact Hvu.
	  + prove w <= z. apply SNoLtLe. prove w < z. exact Hw3.
	- prove u * z + y * z + v * w + x * w < x * z + y * z + v * w + u * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (y * z) (v * w + x * w) Luz Lyz (SNo_add_SNo (v * w) (x * w) Lvw Lxw).
	  rewrite add_SNo_com_3_0_1 (x * z) (y * z) (v * w + u * w) Lxz Lyz (SNo_add_SNo (v * w) (u * w) Lvw Luw).
	  prove y * z + u * z + v * w + x * w < y * z + x * z + v * w + u * w.
	  apply add_SNo_Lt2 (y * z) (u * z + v * w + x * w) (x * z + v * w + u * w)
	                    Lyz
			    (SNo_add_SNo_3 (u * z) (v * w) (x * w) Luz Lvw Lxw)
                            (SNo_add_SNo_3 (x * z) (v * w) (u * w) Lxz Lvw Luw).
          prove u * z + v * w + x * w < x * z + v * w + u * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (v * w) (x * w) Luz Lvw Lxw.
	  rewrite add_SNo_com_3_0_1 (x * z) (v * w) (u * w) Lxz Lvw Luw.
          prove v * w + u * z + x * w < v * w + x * z + u * w.
	  apply add_SNo_Lt2 (v * w) (u * z + x * w) (x * z + u * w) Lvw
	                    (SNo_add_SNo (u * z) (x * w) Luz Lxw)
	                    (SNo_add_SNo (x * z) (u * w) Lxz Luw).
	  prove u * z + x * w < x * z + u * w.
	  exact mul_SNo_Lt x z u w Hx Hz Hu1 Hw1 Hu3 Hw3.
      }
    * { assume H1. apply H1.
        let u. assume H1. apply H1.
        assume Hu: u :e SNoL y.
        assume Hvu: v <= x + u.
        apply SNoL_E y Hy u Hu.
        assume Hu1 Hu2 Hu3.
        claim Luw: SNo (u * w).
        { exact SNo_mul_SNo u w Hu1 Hw1. }
        claim Luz: SNo (u * z).
        { exact SNo_mul_SNo u z Hu1 Hz. }
	claim Lxu: SNo (x + u).
	{ exact SNo_add_SNo x u Hx Hu1. }
        apply add_SNo_Lt1_cancel (v * z + x * w + y * w)
                                 (u * w)
                                 (x * z + y * z + v * w)
  			         Lvzxwyw Luw Lxzyzvw.
        prove (v * z + x * w + y * w) + u * w < (x * z + y * z + v * w) + u * w.
	rewrite <- add_SNo_assoc_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw.
	rewrite <- add_SNo_assoc_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw.
        prove v * z + x * w + y * w + u * w < x * z + y * z + v * w + u * w.
        apply SNoLeLt_tra (v * z + x * w + y * w + u * w)
                          (x * z + u * z + v * w + y * w)
                          (x * z + y * z + v * w + u * w)
			  (SNo_add_SNo_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw)
			  (SNo_add_SNo_4 (x * z) (u * z) (v * w) (y * w) Lxz Luz Lvw Lyw)
			  (SNo_add_SNo_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw).
        - prove v * z + x * w + y * w + u * w <= x * z + u * z + v * w + y * w.
	  rewrite add_SNo_com (y * w) (u * w) Lyw Luw.
	  prove v * z + x * w + u * w + y * w <= x * z + u * z + v * w + y * w.
	  rewrite add_SNo_rotate_4_1 (v * z) (x * w) (u * w) (y * w) Lvz Lxw Luw Lyw.
	  prove y * w + v * z + x * w + u * w <= x * z + u * z + v * w + y * w.
          rewrite add_SNo_rotate_4_1 (x * z) (u * z) (v * w) (y * w) Lxz Luz Lvw Lyw.
	  prove y * w + v * z + x * w + u * w <= y * w + x * z + u * z + v * w.
	  apply add_SNo_Le2 (y * w) (v * z + x * w + u * w) (x * z + u * z + v * w)
	                    Lyw
			    (SNo_add_SNo_3 (v * z) (x * w) (u * w) Lvz Lxw Luw)
			    (SNo_add_SNo_3 (x * z) (u * z) (v * w) Lxz Luz Lvw).
	  prove v * z + x * w + u * w <= x * z + u * z + v * w.
	  rewrite <- IHyz u (SNoL_SNoS y Hy u Hu) w (SNoL_SNoS z Hz w Hw).
	  prove v * z + (x + u) * w <= x * z + u * z + v * w.
	  rewrite add_SNo_assoc (x * z) (u * z) (v * w) Lxz Luz Lvw.
	  prove v * z + (x + u) * w <= (x * z + u * z) + v * w.
	  rewrite <- IHy u (SNoL_SNoS y Hy u Hu).
	  prove v * z + (x + u) * w <= (x + u) * z + v * w.
	  apply mul_SNo_Le (x + u) z v w Lxu Hz Hv1 Hw1.
	  + prove v <= x + u. exact Hvu.
	  + prove w <= z. apply SNoLtLe. prove w < z. exact Hw3.
	- prove x * z + u * z + v * w + y * w < x * z + y * z + v * w + u * w.
	  apply add_SNo_Lt2 (x * z) (u * z + v * w + y * w) (y * z + v * w + u * w)
	                    Lxz
			    (SNo_add_SNo_3 (u * z) (v * w) (y * w) Luz Lvw Lyw)
                            (SNo_add_SNo_3 (y * z) (v * w) (u * w) Lyz Lvw Luw).
          prove u * z + v * w + y * w < y * z + v * w + u * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (v * w) (y * w) Luz Lvw Lyw.
	  rewrite add_SNo_com_3_0_1 (y * z) (v * w) (u * w) Lyz Lvw Luw.
          prove v * w + u * z + y * w < v * w + y * z + u * w.
	  apply add_SNo_Lt2 (v * w) (u * z + y * w) (y * z + u * w) Lvw
	                    (SNo_add_SNo (u * z) (y * w) Luz Lyw)
	                    (SNo_add_SNo (y * z) (u * w) Lyz Luw).
	  prove u * z + y * w < y * z + u * w.
	  exact mul_SNo_Lt y z u w Hy Hz Hu1 Hw1 Hu3 Hw3.
      }
  + let v. assume Hv: v :e SNoR (x + y).
    let w. assume Hw: w :e SNoR z.
    assume Hue: u = v * z + (x + y) * w + - v * w.
    rewrite Hue.
    prove v * z + (x + y) * w + - v * w < x * z + y * z.
    apply SNoR_E (x + y) Lxy v Hv.
    assume Hv1 Hv2 Hv3.
    apply SNoR_E z Hz w Hw.
    assume Hw1 Hw2 Hw3.
    claim Lxw: SNo (x * w).
    { exact SNo_mul_SNo x w Hx Hw1. }
    claim Lyw: SNo (y * w).
    { exact SNo_mul_SNo y w Hy Hw1. }
    claim Lvz: SNo (v * z).
    { exact SNo_mul_SNo v z Hv1 Hz. }
    claim Lxyw: SNo ((x + y) * w).
    { exact SNo_mul_SNo (x + y) w Lxy Hw1. }
    claim Lxwyw: SNo (x * w + y * w).
    { exact SNo_add_SNo (x * w) (y * w) Lxw Lyw. }
    claim Lvw: SNo (v * w).
    { exact SNo_mul_SNo v w Hv1 Hw1. }
    claim Lvzxwyw: SNo (v * z + x * w + y * w).
    { exact SNo_add_SNo_3 (v * z) (x * w) (y * w) Lvz Lxw Lyw. }
    claim Lxzyzvw: SNo (x * z + y * z + v * w).
    { exact SNo_add_SNo_3 (x * z) (y * z) (v * w) Lxz Lyz Lvw. }
    apply add_SNo_minus_Lt1b3 (v * z) ((x + y) * w) (v * w) (x * z + y * z)
                              Lvz Lxyw Lvw Lxzyz.
    prove v * z + (x + y) * w < (x * z + y * z) + v * w.
    rewrite IHz w (SNoR_SNoS z Hz w Hw).
    prove v * z + x * w + y * w < (x * z + y * z) + v * w.
    rewrite <- add_SNo_assoc (x * z) (y * z) (v * w) Lxz Lyz Lvw.
    prove v * z + x * w + y * w < x * z + y * z + v * w.
    apply add_SNo_SNoR_interpolate x y Hx Hy v Hv.
    * { assume H1. apply H1.
        let u. assume H1. apply H1.
        assume Hu: u :e SNoR x.
        assume Hvu: u + y <= v.
        apply SNoR_E x Hx u Hu.
        assume Hu1 Hu2 Hu3.
        claim Luw: SNo (u * w).
        { exact SNo_mul_SNo u w Hu1 Hw1. }
        claim Luz: SNo (u * z).
        { exact SNo_mul_SNo u z Hu1 Hz. }
	claim Luy: SNo (u + y).
	{ exact SNo_add_SNo u y Hu1 Hy. }
        apply add_SNo_Lt1_cancel (v * z + x * w + y * w)
                                 (u * w)
                                 (x * z + y * z + v * w)
  			         Lvzxwyw Luw Lxzyzvw.
        prove (v * z + x * w + y * w) + u * w < (x * z + y * z + v * w) + u * w.
	rewrite <- add_SNo_assoc_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw.
	rewrite <- add_SNo_assoc_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw.
        prove v * z + x * w + y * w + u * w < x * z + y * z + v * w + u * w.
        apply SNoLeLt_tra (v * z + x * w + y * w + u * w)
                          (u * z + y * z + v * w + x * w)
                          (x * z + y * z + v * w + u * w)
			  (SNo_add_SNo_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw)
			  (SNo_add_SNo_4 (u * z) (y * z) (v * w) (x * w) Luz Lyz Lvw Lxw)
			  (SNo_add_SNo_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw).
        - prove v * z + x * w + y * w + u * w <= u * z + y * z + v * w + x * w.
	  rewrite add_SNo_com_3_0_1 (v * z) (x * w) (y * w + u * w) Lvz Lxw (SNo_add_SNo (y * w) (u * w) Lyw Luw).
	  prove x * w + v * z + y * w + u * w <= u * z + y * z + v * w + x * w.
          rewrite add_SNo_rotate_4_1 (u * z) (y * z) (v * w) (x * w) Luz Lyz Lvw Lxw.
	  prove x * w + v * z + y * w + u * w <= x * w + u * z + y * z + v * w.
	  apply add_SNo_Le2 (x * w) (v * z + y * w + u * w) (u * z + y * z + v * w)
	                    Lxw
			    (SNo_add_SNo_3 (v * z) (y * w) (u * w) Lvz Lyw Luw)
			    (SNo_add_SNo_3 (u * z) (y * z) (v * w) Luz Lyz Lvw).
          prove v * z + y * w + u * w <= u * z + y * z + v * w.
          rewrite add_SNo_com (y * w) (u * w) Lyw Luw.
	  prove v * z + u * w + y * w <= u * z + y * z + v * w.
	  rewrite <- IHxz u (SNoR_SNoS x Hx u Hu) w (SNoR_SNoS z Hz w Hw).
	  prove v * z + (u + y) * w <= u * z + y * z + v * w.
	  rewrite add_SNo_assoc (u * z) (y * z) (v * w) Luz Lyz Lvw.
	  prove v * z + (u + y) * w <= (u * z + y * z) + v * w.
	  rewrite <- IHx u (SNoR_SNoS x Hx u Hu).
	  prove v * z + (u + y) * w <= (u + y) * z + v * w.
	  rewrite add_SNo_com ((u + y) * z) (v * w) (SNo_mul_SNo (u + y) z Luy Hz) Lvw.
	  rewrite add_SNo_com (v * z) ((u + y) * w) Lvz (SNo_mul_SNo (u + y) w Luy Hw1).
	  apply mul_SNo_Le v w (u + y) z Hv1 Hw1 Luy Hz.
	  + prove u + y <= v. exact Hvu.
	  + prove z <= w. apply SNoLtLe. prove z < w. exact Hw3.
	- prove u * z + y * z + v * w + x * w < x * z + y * z + v * w + u * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (y * z) (v * w + x * w) Luz Lyz (SNo_add_SNo (v * w) (x * w) Lvw Lxw).
	  rewrite add_SNo_com_3_0_1 (x * z) (y * z) (v * w + u * w) Lxz Lyz (SNo_add_SNo (v * w) (u * w) Lvw Luw).
	  prove y * z + u * z + v * w + x * w < y * z + x * z + v * w + u * w.
	  apply add_SNo_Lt2 (y * z) (u * z + v * w + x * w) (x * z + v * w + u * w)
	                    Lyz
			    (SNo_add_SNo_3 (u * z) (v * w) (x * w) Luz Lvw Lxw)
                            (SNo_add_SNo_3 (x * z) (v * w) (u * w) Lxz Lvw Luw).
          prove u * z + v * w + x * w < x * z + v * w + u * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (v * w) (x * w) Luz Lvw Lxw.
	  rewrite add_SNo_com_3_0_1 (x * z) (v * w) (u * w) Lxz Lvw Luw.
          prove v * w + u * z + x * w < v * w + x * z + u * w.
	  apply add_SNo_Lt2 (v * w) (u * z + x * w) (x * z + u * w) Lvw
	                    (SNo_add_SNo (u * z) (x * w) Luz Lxw)
	                    (SNo_add_SNo (x * z) (u * w) Lxz Luw).
	  prove u * z + x * w < x * z + u * w.
	  rewrite add_SNo_com (x * z) (u * w) Lxz Luw.
	  rewrite add_SNo_com (u * z) (x * w) Luz Lxw.
	  prove x * w + u * z < u * w + x * z.
	  exact mul_SNo_Lt u w x z Hu1 Hw1 Hx Hz Hu3 Hw3.
      }
    * { assume H1. apply H1.
        let u. assume H1. apply H1.
        assume Hu: u :e SNoR y.
        assume Hvu: x + u <= v.
        apply SNoR_E y Hy u Hu.
        assume Hu1 Hu2 Hu3.
        claim Luw: SNo (u * w).
        { exact SNo_mul_SNo u w Hu1 Hw1. }
        claim Luz: SNo (u * z).
        { exact SNo_mul_SNo u z Hu1 Hz. }
	claim Lxu: SNo (x + u).
	{ exact SNo_add_SNo x u Hx Hu1. }
        apply add_SNo_Lt1_cancel (v * z + x * w + y * w)
                                 (u * w)
                                 (x * z + y * z + v * w)
  			         Lvzxwyw Luw Lxzyzvw.
        prove (v * z + x * w + y * w) + u * w < (x * z + y * z + v * w) + u * w.
	rewrite <- add_SNo_assoc_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw.
	rewrite <- add_SNo_assoc_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw.
        prove v * z + x * w + y * w + u * w < x * z + y * z + v * w + u * w.
        apply SNoLeLt_tra (v * z + x * w + y * w + u * w)
                          (x * z + u * z + v * w + y * w)
                          (x * z + y * z + v * w + u * w)
			  (SNo_add_SNo_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw)
			  (SNo_add_SNo_4 (x * z) (u * z) (v * w) (y * w) Lxz Luz Lvw Lyw)
			  (SNo_add_SNo_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw).
        - prove v * z + x * w + y * w + u * w <= x * z + u * z + v * w + y * w.
	  rewrite add_SNo_com (y * w) (u * w) Lyw Luw.
	  prove v * z + x * w + u * w + y * w <= x * z + u * z + v * w + y * w.
	  rewrite add_SNo_rotate_4_1 (v * z) (x * w) (u * w) (y * w) Lvz Lxw Luw Lyw.
	  prove y * w + v * z + x * w + u * w <= x * z + u * z + v * w + y * w.
          rewrite add_SNo_rotate_4_1 (x * z) (u * z) (v * w) (y * w) Lxz Luz Lvw Lyw.
	  prove y * w + v * z + x * w + u * w <= y * w + x * z + u * z + v * w.
	  apply add_SNo_Le2 (y * w) (v * z + x * w + u * w) (x * z + u * z + v * w)
	                    Lyw
			    (SNo_add_SNo_3 (v * z) (x * w) (u * w) Lvz Lxw Luw)
			    (SNo_add_SNo_3 (x * z) (u * z) (v * w) Lxz Luz Lvw).
	  prove v * z + x * w + u * w <= x * z + u * z + v * w.
	  rewrite <- IHyz u (SNoR_SNoS y Hy u Hu) w (SNoR_SNoS z Hz w Hw).
	  prove v * z + (x + u) * w <= x * z + u * z + v * w.
	  rewrite add_SNo_assoc (x * z) (u * z) (v * w) Lxz Luz Lvw.
	  prove v * z + (x + u) * w <= (x * z + u * z) + v * w.
	  rewrite <- IHy u (SNoR_SNoS y Hy u Hu).
	  prove v * z + (x + u) * w <= (x + u) * z + v * w.
	  rewrite add_SNo_com ((x + u) * z) (v * w) (SNo_mul_SNo (x + u) z Lxu Hz) Lvw.
	  rewrite add_SNo_com (v * z) ((x + u) * w) Lvz (SNo_mul_SNo (x + u) w Lxu Hw1).
	  apply mul_SNo_Le v w (x + u) z Hv1 Hw1 Lxu Hz.
	  + prove x + u <= v. exact Hvu.
	  + prove z <= w. apply SNoLtLe. prove z < w. exact Hw3.
	- prove x * z + u * z + v * w + y * w < x * z + y * z + v * w + u * w.
	  apply add_SNo_Lt2 (x * z) (u * z + v * w + y * w) (y * z + v * w + u * w)
	                    Lxz
			    (SNo_add_SNo_3 (u * z) (v * w) (y * w) Luz Lvw Lyw)
                            (SNo_add_SNo_3 (y * z) (v * w) (u * w) Lyz Lvw Luw).
          prove u * z + v * w + y * w < y * z + v * w + u * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (v * w) (y * w) Luz Lvw Lyw.
	  rewrite add_SNo_com_3_0_1 (y * z) (v * w) (u * w) Lyz Lvw Luw.
          prove v * w + u * z + y * w < v * w + y * z + u * w.
	  apply add_SNo_Lt2 (v * w) (u * z + y * w) (y * z + u * w) Lvw
	                    (SNo_add_SNo (u * z) (y * w) Luz Lyw)
	                    (SNo_add_SNo (y * z) (u * w) Lyz Luw).
	  prove u * z + y * w < y * z + u * w.
	  rewrite add_SNo_com (y * z) (u * w) Lyz Luw.
	  rewrite add_SNo_com (u * z) (y * w) Luz Lyw.
	  prove y * w + u * z < u * w + y * z.
	  exact mul_SNo_Lt u w y z Hu1 Hw1 Hy Hz Hu3 Hw3.
      }
- let u. assume Hu: u :e R. rewrite <- LE.
  prove x * z + y * z < u.
  apply HRE u Hu.
  + let v. assume Hv: v :e SNoL (x + y).
    let w. assume Hw: w :e SNoR z.
    assume Hue: u = v * z + (x + y) * w + - v * w.
    rewrite Hue.
    prove x * z + y * z < v * z + (x + y) * w + - v * w.
    apply SNoL_E (x + y) Lxy v Hv.
    assume Hv1 Hv2 Hv3.
    apply SNoR_E z Hz w Hw.
    assume Hw1 Hw2 Hw3.
    claim Lxw: SNo (x * w).
    { exact SNo_mul_SNo x w Hx Hw1. }
    claim Lyw: SNo (y * w).
    { exact SNo_mul_SNo y w Hy Hw1. }
    claim Lvz: SNo (v * z).
    { exact SNo_mul_SNo v z Hv1 Hz. }
    claim Lxyw: SNo ((x + y) * w).
    { exact SNo_mul_SNo (x + y) w Lxy Hw1. }
    claim Lxwyw: SNo (x * w + y * w).
    { exact SNo_add_SNo (x * w) (y * w) Lxw Lyw. }
    claim Lvw: SNo (v * w).
    { exact SNo_mul_SNo v w Hv1 Hw1. }
    claim Lvzxwyw: SNo (v * z + x * w + y * w).
    { exact SNo_add_SNo_3 (v * z) (x * w) (y * w) Lvz Lxw Lyw. }
    claim Lxzyzvw: SNo (x * z + y * z + v * w).
    { exact SNo_add_SNo_3 (x * z) (y * z) (v * w) Lxz Lyz Lvw. }
    prove x * z + y * z < v * z + (x + y) * w + - v * w.
    apply add_SNo_minus_Lt2b3 (v * z) ((x + y) * w) (v * w) (x * z + y * z)
                              Lvz Lxyw Lvw Lxzyz.
    prove (x * z + y * z) + v * w < v * z + (x + y) * w.
    rewrite IHz w (SNoR_SNoS z Hz w Hw).
    prove (x * z + y * z) + v * w < v * z + x * w + y * w.
    rewrite <- add_SNo_assoc (x * z) (y * z) (v * w) Lxz Lyz Lvw.
    prove x * z + y * z + v * w < v * z + x * w + y * w.
    apply add_SNo_SNoL_interpolate x y Hx Hy v Hv.
    * { assume H1. apply H1.
        let u. assume H1. apply H1.
        assume Hu: u :e SNoL x.
        assume Hvu: v <= u + y.
        apply SNoL_E x Hx u Hu.
        assume Hu1 Hu2 Hu3.
        claim Luw: SNo (u * w).
        { exact SNo_mul_SNo u w Hu1 Hw1. }
        claim Luz: SNo (u * z).
        { exact SNo_mul_SNo u z Hu1 Hz. }
	claim Luy: SNo (u + y).
	{ exact SNo_add_SNo u y Hu1 Hy. }
        apply add_SNo_Lt1_cancel (x * z + y * z + v * w)
                                 (u * w)
                                 (v * z + x * w + y * w)
  			         Lxzyzvw Luw Lvzxwyw.
        prove (x * z + y * z + v * w) + u * w < (v * z + x * w + y * w) + u * w.
	rewrite <- add_SNo_assoc_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw.
	rewrite <- add_SNo_assoc_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw.
        prove x * z + y * z + v * w + u * w < v * z + x * w + y * w + u * w.
        apply SNoLtLe_tra (x * z + y * z + v * w + u * w)
                          (u * z + y * z + v * w + x * w)
                          (v * z + x * w + y * w + u * w)
			  (SNo_add_SNo_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw)
			  (SNo_add_SNo_4 (u * z) (y * z) (v * w) (x * w) Luz Lyz Lvw Lxw)
			  (SNo_add_SNo_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw).
	- prove x * z + y * z + v * w + u * w < u * z + y * z + v * w + x * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (y * z) (v * w + x * w) Luz Lyz (SNo_add_SNo (v * w) (x * w) Lvw Lxw).
	  rewrite add_SNo_com_3_0_1 (x * z) (y * z) (v * w + u * w) Lxz Lyz (SNo_add_SNo (v * w) (u * w) Lvw Luw).
	  prove y * z + x * z + v * w + u * w < y * z + u * z + v * w + x * w.
	  apply add_SNo_Lt2 (y * z) (x * z + v * w + u * w) (u * z + v * w + x * w)
	                    Lyz
                            (SNo_add_SNo_3 (x * z) (v * w) (u * w) Lxz Lvw Luw)
			    (SNo_add_SNo_3 (u * z) (v * w) (x * w) Luz Lvw Lxw).
          prove x * z + v * w + u * w < u * z + v * w + x * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (v * w) (x * w) Luz Lvw Lxw.
	  rewrite add_SNo_com_3_0_1 (x * z) (v * w) (u * w) Lxz Lvw Luw.
          prove v * w + x * z + u * w < v * w + u * z + x * w.
	  apply add_SNo_Lt2 (v * w) (x * z + u * w) (u * z + x * w)
	                    Lvw
	                    (SNo_add_SNo (x * z) (u * w) Lxz Luw)
	                    (SNo_add_SNo (u * z) (x * w) Luz Lxw).
	  prove x * z + u * w < u * z + x * w.
	  rewrite add_SNo_com (x * z) (u * w) Lxz Luw.
	  rewrite add_SNo_com (u * z) (x * w) Luz Lxw.
	  exact mul_SNo_Lt x w u z Hx Hw1 Hu1 Hz Hu3 Hw3.
        - prove u * z + y * z + v * w + x * w <= v * z + x * w + y * w + u * w.
	  rewrite add_SNo_com_3_0_1 (v * z) (x * w) (y * w + u * w) Lvz Lxw (SNo_add_SNo (y * w) (u * w) Lyw Luw).
	  prove u * z + y * z + v * w + x * w <= x * w + v * z + y * w + u * w.
          rewrite add_SNo_rotate_4_1 (u * z) (y * z) (v * w) (x * w) Luz Lyz Lvw Lxw.
	  prove x * w + u * z + y * z + v * w <= x * w + v * z + y * w + u * w.
	  apply add_SNo_Le2 (x * w) (u * z + y * z + v * w) (v * z + y * w + u * w)
	                    Lxw
			    (SNo_add_SNo_3 (u * z) (y * z) (v * w) Luz Lyz Lvw)
			    (SNo_add_SNo_3 (v * z) (y * w) (u * w) Lvz Lyw Luw).
          prove u * z + y * z + v * w <= v * z + y * w + u * w.
          rewrite add_SNo_com (y * w) (u * w) Lyw Luw.
	  prove u * z + y * z + v * w <= v * z + u * w + y * w.
	  rewrite <- IHxz u (SNoL_SNoS x Hx u Hu) w (SNoR_SNoS z Hz w Hw).
	  prove u * z + y * z + v * w <= v * z + (u + y) * w.
	  rewrite add_SNo_assoc (u * z) (y * z) (v * w) Luz Lyz Lvw.
	  prove (u * z + y * z) + v * w <= v * z + (u + y) * w.
	  rewrite <- IHx u (SNoL_SNoS x Hx u Hu).
	  prove (u + y) * z + v * w <= v * z + (u + y) * w.
	  rewrite add_SNo_com ((u + y) * z) (v * w) (SNo_mul_SNo (u + y) z Luy Hz) Lvw.
	  rewrite add_SNo_com (v * z) ((u + y) * w) Lvz (SNo_mul_SNo (u + y) w Luy Hw1).
	  prove v * w + (u + y) * z  <= (u + y) * w + v * z.
	  apply mul_SNo_Le (u + y) w v z Luy Hw1 Hv1 Hz.
	  + prove v <= u + y. exact Hvu.
	  + prove z <= w. apply SNoLtLe. prove z < w. exact Hw3.
      }
    * { assume H1. apply H1.
        let u. assume H1. apply H1.
        assume Hu: u :e SNoL y.
        assume Hvu: v <= x + u.
        apply SNoL_E y Hy u Hu.
        assume Hu1 Hu2 Hu3.
        claim Luw: SNo (u * w).
        { exact SNo_mul_SNo u w Hu1 Hw1. }
        claim Luz: SNo (u * z).
        { exact SNo_mul_SNo u z Hu1 Hz. }
	claim Lxu: SNo (x + u).
	{ exact SNo_add_SNo x u Hx Hu1. }
        apply add_SNo_Lt1_cancel (x * z + y * z + v * w)
                                 (u * w)
                                 (v * z + x * w + y * w)
  			         Lxzyzvw Luw Lvzxwyw.
        prove (x * z + y * z + v * w) + u * w < (v * z + x * w + y * w) + u * w.
	rewrite <- add_SNo_assoc_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw.
	rewrite <- add_SNo_assoc_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw.
        prove x * z + y * z + v * w + u * w < v * z + x * w + y * w + u * w.
        apply SNoLtLe_tra (x * z + y * z + v * w + u * w)
                          (x * z + u * z + v * w + y * w)
                          (v * z + x * w + y * w + u * w)
			  (SNo_add_SNo_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw)
			  (SNo_add_SNo_4 (x * z) (u * z) (v * w) (y * w) Lxz Luz Lvw Lyw)
			  (SNo_add_SNo_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw).
	- prove x * z + y * z + v * w + u * w < x * z + u * z + v * w + y * w.
	  apply add_SNo_Lt2 (x * z) (y * z + v * w + u * w) (u * z + v * w + y * w)
	                    Lxz
                            (SNo_add_SNo_3 (y * z) (v * w) (u * w) Lyz Lvw Luw)
			    (SNo_add_SNo_3 (u * z) (v * w) (y * w) Luz Lvw Lyw).
          prove y * z + v * w + u * w < u * z + v * w + y * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (v * w) (y * w) Luz Lvw Lyw.
	  rewrite add_SNo_com_3_0_1 (y * z) (v * w) (u * w) Lyz Lvw Luw.
          prove v * w + y * z + u * w < v * w + u * z + y * w.
	  apply add_SNo_Lt2 (v * w) (y * z + u * w) (u * z + y * w)
	                    Lvw
	                    (SNo_add_SNo (y * z) (u * w) Lyz Luw)
	                    (SNo_add_SNo (u * z) (y * w) Luz Lyw).
	  prove y * z + u * w < u * z + y * w.
	  rewrite add_SNo_com (y * z) (u * w) Lyz Luw.
	  rewrite add_SNo_com (u * z) (y * w) Luz Lyw.
	  exact mul_SNo_Lt y w u z Hy Hw1 Hu1 Hz Hu3 Hw3.
        - prove x * z + u * z + v * w + y * w <= v * z + x * w + y * w + u * w.
	  rewrite add_SNo_com (y * w) (u * w) Lyw Luw.
	  prove x * z + u * z + v * w + y * w <= v * z + x * w + u * w + y * w.
	  rewrite add_SNo_rotate_4_1 (v * z) (x * w) (u * w) (y * w) Lvz Lxw Luw Lyw.
	  prove x * z + u * z + v * w + y * w <= y * w + v * z + x * w + u * w.
          rewrite add_SNo_rotate_4_1 (x * z) (u * z) (v * w) (y * w) Lxz Luz Lvw Lyw.
	  prove y * w + x * z + u * z + v * w <= y * w + v * z + x * w + u * w.
	  apply add_SNo_Le2 (y * w) (x * z + u * z + v * w) (v * z + x * w + u * w)
	                    Lyw
			    (SNo_add_SNo_3 (x * z) (u * z) (v * w) Lxz Luz Lvw)
			    (SNo_add_SNo_3 (v * z) (x * w) (u * w) Lvz Lxw Luw).
	  prove x * z + u * z + v * w <= v * z + x * w + u * w.
	  rewrite <- IHyz u (SNoL_SNoS y Hy u Hu) w (SNoR_SNoS z Hz w Hw).
	  prove x * z + u * z + v * w <= v * z + (x + u) * w.
	  rewrite add_SNo_assoc (x * z) (u * z) (v * w) Lxz Luz Lvw.
	  prove (x * z + u * z) + v * w <= v * z + (x + u) * w.
	  rewrite <- IHy u (SNoL_SNoS y Hy u Hu).
	  prove (x + u) * z + v * w <= v * z + (x + u) * w.
	  rewrite add_SNo_com ((x + u) * z) (v * w) (SNo_mul_SNo (x + u) z Lxu Hz) Lvw.
	  rewrite add_SNo_com (v * z) ((x + u) * w) Lvz (SNo_mul_SNo (x + u) w Lxu Hw1).
	  prove v * w + (x + u) * z  <= (x + u) * w + v * z.
	  apply mul_SNo_Le (x + u) w v z Lxu Hw1 Hv1 Hz.
	  + prove v <= x + u. exact Hvu.
	  + prove z <= w. apply SNoLtLe. prove z < w. exact Hw3.
      }
  + let v. assume Hv: v :e SNoR (x + y).
    let w. assume Hw: w :e SNoL z.
    assume Hue: u = v * z + (x + y) * w + - v * w.
    rewrite Hue.
    prove x * z + y * z < v * z + (x + y) * w + - v * w.
    apply SNoR_E (x + y) Lxy v Hv.
    assume Hv1 Hv2 Hv3.
    apply SNoL_E z Hz w Hw.
    assume Hw1 Hw2 Hw3.
    claim Lxw: SNo (x * w).
    { exact SNo_mul_SNo x w Hx Hw1. }
    claim Lyw: SNo (y * w).
    { exact SNo_mul_SNo y w Hy Hw1. }
    claim Lvz: SNo (v * z).
    { exact SNo_mul_SNo v z Hv1 Hz. }
    claim Lxyw: SNo ((x + y) * w).
    { exact SNo_mul_SNo (x + y) w Lxy Hw1. }
    claim Lxwyw: SNo (x * w + y * w).
    { exact SNo_add_SNo (x * w) (y * w) Lxw Lyw. }
    claim Lvw: SNo (v * w).
    { exact SNo_mul_SNo v w Hv1 Hw1. }
    claim Lvzxwyw: SNo (v * z + x * w + y * w).
    { exact SNo_add_SNo_3 (v * z) (x * w) (y * w) Lvz Lxw Lyw. }
    claim Lxzyzvw: SNo (x * z + y * z + v * w).
    { exact SNo_add_SNo_3 (x * z) (y * z) (v * w) Lxz Lyz Lvw. }
    prove x * z + y * z < v * z + (x + y) * w + - v * w.
    apply add_SNo_minus_Lt2b3 (v * z) ((x + y) * w) (v * w) (x * z + y * z)
                              Lvz Lxyw Lvw Lxzyz.
    prove (x * z + y * z) + v * w < v * z + (x + y) * w.
    rewrite IHz w (SNoL_SNoS z Hz w Hw).
    prove (x * z + y * z) + v * w < v * z + x * w + y * w.
    rewrite <- add_SNo_assoc (x * z) (y * z) (v * w) Lxz Lyz Lvw.
    prove x * z + y * z + v * w < v * z + x * w + y * w.
    apply add_SNo_SNoR_interpolate x y Hx Hy v Hv.
    * { assume H1. apply H1.
        let u. assume H1. apply H1.
        assume Hu: u :e SNoR x.
        assume Hvu: u + y <= v.
        apply SNoR_E x Hx u Hu.
        assume Hu1 Hu2 Hu3.
        claim Luw: SNo (u * w).
        { exact SNo_mul_SNo u w Hu1 Hw1. }
        claim Luz: SNo (u * z).
        { exact SNo_mul_SNo u z Hu1 Hz. }
	claim Luy: SNo (u + y).
	{ exact SNo_add_SNo u y Hu1 Hy. }
        apply add_SNo_Lt1_cancel (x * z + y * z + v * w)
                                 (u * w)
                                 (v * z + x * w + y * w)
  			         Lxzyzvw Luw Lvzxwyw.
        prove (x * z + y * z + v * w) + u * w < (v * z + x * w + y * w) + u * w.
	rewrite <- add_SNo_assoc_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw.
	rewrite <- add_SNo_assoc_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw.
        prove x * z + y * z + v * w + u * w < v * z + x * w + y * w + u * w.
        apply SNoLtLe_tra (x * z + y * z + v * w + u * w)
                          (u * z + y * z + v * w + x * w)
                          (v * z + x * w + y * w + u * w)
			  (SNo_add_SNo_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw)
			  (SNo_add_SNo_4 (u * z) (y * z) (v * w) (x * w) Luz Lyz Lvw Lxw)
			  (SNo_add_SNo_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw).
	- prove x * z + y * z + v * w + u * w < u * z + y * z + v * w + x * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (y * z) (v * w + x * w) Luz Lyz (SNo_add_SNo (v * w) (x * w) Lvw Lxw).
	  rewrite add_SNo_com_3_0_1 (x * z) (y * z) (v * w + u * w) Lxz Lyz (SNo_add_SNo (v * w) (u * w) Lvw Luw).
	  prove y * z + x * z + v * w + u * w < y * z + u * z + v * w + x * w.
	  apply add_SNo_Lt2 (y * z) (x * z + v * w + u * w) (u * z + v * w + x * w)
	                    Lyz
                            (SNo_add_SNo_3 (x * z) (v * w) (u * w) Lxz Lvw Luw)
			    (SNo_add_SNo_3 (u * z) (v * w) (x * w) Luz Lvw Lxw).
          prove x * z + v * w + u * w < u * z + v * w + x * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (v * w) (x * w) Luz Lvw Lxw.
	  rewrite add_SNo_com_3_0_1 (x * z) (v * w) (u * w) Lxz Lvw Luw.
          prove v * w + x * z + u * w < v * w + u * z + x * w.
	  apply add_SNo_Lt2 (v * w) (x * z + u * w) (u * z + x * w)
	                    Lvw
	                    (SNo_add_SNo (x * z) (u * w) Lxz Luw)
	                    (SNo_add_SNo (u * z) (x * w) Luz Lxw).
	  prove x * z + u * w < u * z + x * w.
	  exact mul_SNo_Lt u z x w Hu1 Hz Hx Hw1 Hu3 Hw3.
        - prove u * z + y * z + v * w + x * w <= v * z + x * w + y * w + u * w.
	  rewrite add_SNo_com_3_0_1 (v * z) (x * w) (y * w + u * w) Lvz Lxw (SNo_add_SNo (y * w) (u * w) Lyw Luw).
	  prove u * z + y * z + v * w + x * w <= x * w + v * z + y * w + u * w.
          rewrite add_SNo_rotate_4_1 (u * z) (y * z) (v * w) (x * w) Luz Lyz Lvw Lxw.
	  prove x * w + u * z + y * z + v * w <= x * w + v * z + y * w + u * w.
	  apply add_SNo_Le2 (x * w) (u * z + y * z + v * w) (v * z + y * w + u * w)
	                    Lxw
			    (SNo_add_SNo_3 (u * z) (y * z) (v * w) Luz Lyz Lvw)
			    (SNo_add_SNo_3 (v * z) (y * w) (u * w) Lvz Lyw Luw).
          prove u * z + y * z + v * w <= v * z + y * w + u * w.
          rewrite add_SNo_com (y * w) (u * w) Lyw Luw.
	  prove u * z + y * z + v * w <= v * z + u * w + y * w.
	  rewrite <- IHxz u (SNoR_SNoS x Hx u Hu) w (SNoL_SNoS z Hz w Hw).
	  prove u * z + y * z + v * w <= v * z + (u + y) * w.
	  rewrite add_SNo_assoc (u * z) (y * z) (v * w) Luz Lyz Lvw.
	  prove (u * z + y * z) + v * w <= v * z + (u + y) * w.
	  rewrite <- IHx u (SNoR_SNoS x Hx u Hu).
	  prove (u + y) * z + v * w <= v * z + (u + y) * w.
	  apply mul_SNo_Le v z (u + y) w Hv1 Hz Luy Hw1.
	  + prove u + y <= v. exact Hvu.
	  + prove w <= z. apply SNoLtLe. prove w < z. exact Hw3.
      }
    * { assume H1. apply H1.
        let u. assume H1. apply H1.
        assume Hu: u :e SNoR y.
        assume Hvu: x + u <= v.
        apply SNoR_E y Hy u Hu.
        assume Hu1 Hu2 Hu3.
        claim Luw: SNo (u * w).
        { exact SNo_mul_SNo u w Hu1 Hw1. }
        claim Luz: SNo (u * z).
        { exact SNo_mul_SNo u z Hu1 Hz. }
	claim Lxu: SNo (x + u).
	{ exact SNo_add_SNo x u Hx Hu1. }
        apply add_SNo_Lt1_cancel (x * z + y * z + v * w)
                                 (u * w)
                                 (v * z + x * w + y * w)
  			         Lxzyzvw Luw Lvzxwyw.
        prove (x * z + y * z + v * w) + u * w < (v * z + x * w + y * w) + u * w.
	rewrite <- add_SNo_assoc_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw.
	rewrite <- add_SNo_assoc_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw.
        prove x * z + y * z + v * w + u * w < v * z + x * w + y * w + u * w.
        apply SNoLtLe_tra (x * z + y * z + v * w + u * w)
                          (x * z + u * z + v * w + y * w)
                          (v * z + x * w + y * w + u * w)
			  (SNo_add_SNo_4 (x * z) (y * z) (v * w) (u * w) Lxz Lyz Lvw Luw)
			  (SNo_add_SNo_4 (x * z) (u * z) (v * w) (y * w) Lxz Luz Lvw Lyw)
			  (SNo_add_SNo_4 (v * z) (x * w) (y * w) (u * w) Lvz Lxw Lyw Luw).
	- prove x * z + y * z + v * w + u * w < x * z + u * z + v * w + y * w.
	  apply add_SNo_Lt2 (x * z) (y * z + v * w + u * w) (u * z + v * w + y * w)
	                    Lxz
                            (SNo_add_SNo_3 (y * z) (v * w) (u * w) Lyz Lvw Luw)
			    (SNo_add_SNo_3 (u * z) (v * w) (y * w) Luz Lvw Lyw).
          prove y * z + v * w + u * w < u * z + v * w + y * w.
	  rewrite add_SNo_com_3_0_1 (u * z) (v * w) (y * w) Luz Lvw Lyw.
	  rewrite add_SNo_com_3_0_1 (y * z) (v * w) (u * w) Lyz Lvw Luw.
          prove v * w + y * z + u * w < v * w + u * z + y * w.
	  apply add_SNo_Lt2 (v * w) (y * z + u * w) (u * z + y * w)
	                    Lvw
	                    (SNo_add_SNo (y * z) (u * w) Lyz Luw)
	                    (SNo_add_SNo (u * z) (y * w) Luz Lyw).
	  prove y * z + u * w < u * z + y * w.
	  exact mul_SNo_Lt u z y w Hu1 Hz Hy Hw1 Hu3 Hw3.
        - prove x * z + u * z + v * w + y * w <= v * z + x * w + y * w + u * w.
	  rewrite add_SNo_com (y * w) (u * w) Lyw Luw.
	  prove x * z + u * z + v * w + y * w <= v * z + x * w + u * w + y * w.
	  rewrite add_SNo_rotate_4_1 (v * z) (x * w) (u * w) (y * w) Lvz Lxw Luw Lyw.
	  prove x * z + u * z + v * w + y * w <= y * w + v * z + x * w + u * w.
          rewrite add_SNo_rotate_4_1 (x * z) (u * z) (v * w) (y * w) Lxz Luz Lvw Lyw.
	  prove y * w + x * z + u * z + v * w <= y * w + v * z + x * w + u * w.
	  apply add_SNo_Le2 (y * w) (x * z + u * z + v * w) (v * z + x * w + u * w)
	                    Lyw
			    (SNo_add_SNo_3 (x * z) (u * z) (v * w) Lxz Luz Lvw)
			    (SNo_add_SNo_3 (v * z) (x * w) (u * w) Lvz Lxw Luw).
	  prove x * z + u * z + v * w <= v * z + x * w + u * w.
	  rewrite <- IHyz u (SNoR_SNoS y Hy u Hu) w (SNoL_SNoS z Hz w Hw).
	  prove x * z + u * z + v * w <= v * z + (x + u) * w.
	  rewrite add_SNo_assoc (x * z) (u * z) (v * w) Lxz Luz Lvw.
	  prove (x * z + u * z) + v * w <= v * z + (x + u) * w.
	  rewrite <- IHy u (SNoR_SNoS y Hy u Hu).
	  prove (x + u) * z + v * w <= v * z + (x + u) * w.
	  apply mul_SNo_Le v z (x + u) w Hv1 Hz Lxu Hw1.
	  + prove x + u <= v. exact Hvu.
	  + prove w <= z. apply SNoLtLe. prove w < z. exact Hw3.
      }
- let u'. assume Hu': u' :e L1 :\/: L2. rewrite <- HE.
  prove u' < (x + y) * z.
  apply binunionE L1 L2 u' Hu'.
  + assume Hu': u' :e L1.
    apply ReplE_impred (SNoL (x * z)) (fun w => w + y * z) u' Hu'.
    let u. assume Hu: u :e SNoL (x * z).
    assume Hu'u: u' = u + y * z.
    rewrite Hu'u.
    prove u + y * z < (x + y) * z.
    apply SNoL_E (x * z) Lxz u Hu.
    assume Hu1 Hu2 Hu3.
    apply mul_SNo_SNoL_interpolate_impred x z Hx Hz u Hu.
    * { let v. assume Hv: v :e SNoL x.
        let w. assume Hw: w :e SNoL z.
	assume Hvw: u + v * w <= v * z + x * w.
	apply SNoL_E x Hx v Hv.
	assume Hv1 Hv2 Hv3.
	apply SNoL_E z Hz w Hw.
	assume Hw1 Hw2 Hw3.
        claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim Lvy: SNo (v + y).
	{ exact SNo_add_SNo v y Hv1 Hy. }
	claim Luvw: SNo (u + v * w).
	{ exact SNo_add_SNo u (v * w) Hu1 Lvw. }
	claim Lxyw: SNo ((x + y) * w).
	{ exact SNo_mul_SNo (x + y) w Lxy Hw1. }
        claim Lvz: SNo (v * z).
	{ exact SNo_mul_SNo v z Hv1 Hz. }
	claim Lxw: SNo (x * w).
	{ exact SNo_mul_SNo x w Hx Hw1. }
	claim Lyw: SNo (y * w).
	{ exact SNo_mul_SNo y w Hy Hw1. }
	claim Luyz: SNo (u + y * z).
	{ exact SNo_add_SNo u (y * z) Hu1 Lyz. }
	claim Lvwyw: SNo (v * w + y * w).
	{ exact SNo_add_SNo (v * w) (y * w) Lvw Lyw. }
	claim Lvzxw: SNo (v * z + x * w).
	{ exact SNo_add_SNo (v * z) (x * w) Lvz Lxw. }
        prove u + y * z < (x + y) * z.
        apply add_SNo_Lt1_cancel (u + y * z) (v * w + y * w) ((x + y) * z)
	                         Luyz Lvwyw Lxyz.
        prove (u + y * z) + v * w + y * w < (x + y) * z + v * w + y * w.
	rewrite add_SNo_com_4_inner_mid u (y * z) (v * w) (y * w) Hu1 Lyz Lvw Lyw.
	prove (u + v * w) + y * z + y * w < (x + y) * z + v * w + y * w.
        apply SNoLeLt_tra ((u + v * w) + y * z + y * w)
	                  (v * z + y * z + x * w + y * w)
	                  ((x + y) * z + v * w + y * w)
			  (SNo_add_SNo_3 (u + v * w) (y * z) (y * w) Luvw Lyz Lyw)
			  (SNo_add_SNo_4 (v * z) (y * z) (x * w) (y * w) Lvz Lyz Lxw Lyw)
			  (SNo_add_SNo_3 ((x + y) * z) (v * w) (y * w) Lxyz Lvw Lyw).
        - prove (u + v * w) + y * z + y * w <= v * z + y * z + x * w + y * w.
	  rewrite add_SNo_assoc (v * z) (y * z) (x * w + y * w)
	                        Lvz Lyz (SNo_add_SNo (x * w) (y * w) Lxw Lyw).
          prove (u + v * w) + y * z + y * w <= (v * z + y * z) + x * w + y * w.
          rewrite add_SNo_com_4_inner_mid (v * z) (y * z) (x * w) (y * w) Lvz Lyz Lxw Lyw.
	  prove (u + v * w) + y * z + y * w <= (v * z + x * w) + y * z + y * w.
	  apply add_SNo_Le1 (u + v * w) (y * z + y * w) (v * z + x * w)
	                    Luvw
			    (SNo_add_SNo (y * z) (y * w) Lyz Lyw)
			    (SNo_add_SNo (v * z) (x * w) Lvz Lxw).
          prove u + v * w <= v * z + x * w.
	  exact Hvw.
        - prove v * z + y * z + x * w + y * w < (x + y) * z + v * w + y * w.
	  rewrite <- IHz w (SNoL_SNoS z Hz w Hw).
	  prove v * z + y * z + (x + y) * w < (x + y) * z + v * w + y * w.
	  rewrite <- IHxz v (SNoL_SNoS x Hx v Hv) w (SNoL_SNoS z Hz w Hw).
	  prove v * z + y * z + (x + y) * w < (x + y) * z + (v + y) * w.
	  rewrite add_SNo_assoc (v * z) (y * z) ((x + y) * w) Lvz Lyz Lxyw.
	  rewrite <- IHx v (SNoL_SNoS x Hx v Hv).
	  prove (v + y) * z + (x + y) * w < (x + y) * z + (v + y) * w.
	  apply mul_SNo_Lt (x + y) z (v + y) w Lxy Hz Lvy Hw1.
	  + prove v + y < x + y. apply add_SNo_Lt1 v y x Hv1 Hy Hx. exact Hv3.
	  + prove w < z. exact Hw3.
      }
    * { let v. assume Hv: v :e SNoR x.
        let w. assume Hw: w :e SNoR z.
	assume Hvw: u + v * w <= v * z + x * w.
	apply SNoR_E x Hx v Hv.
	assume Hv1 Hv2 Hv3.
	apply SNoR_E z Hz w Hw.
	assume Hw1 Hw2 Hw3.
        claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim Lvy: SNo (v + y).
	{ exact SNo_add_SNo v y Hv1 Hy. }
	claim Luvw: SNo (u + v * w).
	{ exact SNo_add_SNo u (v * w) Hu1 Lvw. }
	claim Lxyw: SNo ((x + y) * w).
	{ exact SNo_mul_SNo (x + y) w Lxy Hw1. }
        claim Lvz: SNo (v * z).
	{ exact SNo_mul_SNo v z Hv1 Hz. }
	claim Lxw: SNo (x * w).
	{ exact SNo_mul_SNo x w Hx Hw1. }
	claim Lyw: SNo (y * w).
	{ exact SNo_mul_SNo y w Hy Hw1. }
	claim Luyz: SNo (u + y * z).
	{ exact SNo_add_SNo u (y * z) Hu1 Lyz. }
	claim Lvwyw: SNo (v * w + y * w).
	{ exact SNo_add_SNo (v * w) (y * w) Lvw Lyw. }
        prove u + y * z < (x + y) * z.
        apply add_SNo_Lt1_cancel (u + y * z) (v * w + y * w) ((x + y) * z)
	                         Luyz Lvwyw Lxyz.
        prove (u + y * z) + v * w + y * w < (x + y) * z + v * w + y * w.
	rewrite add_SNo_com_4_inner_mid u (y * z) (v * w) (y * w) Hu1 Lyz Lvw Lyw.
	prove (u + v * w) + y * z + y * w < (x + y) * z + v * w + y * w.
        apply SNoLeLt_tra ((u + v * w) + y * z + y * w)
	                  (v * z + y * z + x * w + y * w)
	                  ((x + y) * z + v * w + y * w)
			  (SNo_add_SNo_3 (u + v * w) (y * z) (y * w) Luvw Lyz Lyw)
			  (SNo_add_SNo_4 (v * z) (y * z) (x * w) (y * w) Lvz Lyz Lxw Lyw)
			  (SNo_add_SNo_3 ((x + y) * z) (v * w) (y * w) Lxyz Lvw Lyw).
        - prove (u + v * w) + y * z + y * w <= v * z + y * z + x * w + y * w.
	  rewrite add_SNo_assoc (v * z) (y * z) (x * w + y * w)
	                        Lvz Lyz (SNo_add_SNo (x * w) (y * w) Lxw Lyw).
          prove (u + v * w) + y * z + y * w <= (v * z + y * z) + x * w + y * w.
          rewrite add_SNo_com_4_inner_mid (v * z) (y * z) (x * w) (y * w) Lvz Lyz Lxw Lyw.
	  prove (u + v * w) + y * z + y * w <= (v * z + x * w) + y * z + y * w.
	  apply add_SNo_Le1 (u + v * w) (y * z + y * w) (v * z + x * w)
	                    Luvw
			    (SNo_add_SNo (y * z) (y * w) Lyz Lyw)
			    (SNo_add_SNo (v * z) (x * w) Lvz Lxw).
          prove u + v * w <= v * z + x * w.
	  exact Hvw.
        - prove v * z + y * z + x * w + y * w < (x + y) * z + v * w + y * w.
	  rewrite <- IHz w (SNoR_SNoS z Hz w Hw).
	  prove v * z + y * z + (x + y) * w < (x + y) * z + v * w + y * w.
	  rewrite <- IHxz v (SNoR_SNoS x Hx v Hv) w (SNoR_SNoS z Hz w Hw).
	  prove v * z + y * z + (x + y) * w < (x + y) * z + (v + y) * w.
	  rewrite add_SNo_assoc (v * z) (y * z) ((x + y) * w) Lvz Lyz Lxyw.
	  rewrite <- IHx v (SNoR_SNoS x Hx v Hv).
	  prove (v + y) * z + (x + y) * w < (x + y) * z + (v + y) * w.
	  rewrite add_SNo_com ((v + y) * z) ((x + y) * w)
	                      (SNo_mul_SNo (v + y) z Lvy Hz)
	                      Lxyw.
	  rewrite add_SNo_com ((x + y) * z) ((v + y) * w) Lxyz
  	                      (SNo_mul_SNo (v + y) w Lvy Hw1).
	  apply mul_SNo_Lt (v + y) w (x + y) z Lvy Hw1 Lxy Hz.
	  + prove x + y < v + y. apply add_SNo_Lt1 x y v Hx Hy Hv1. exact Hv3.
	  + prove z < w. exact Hw3.
      }
  + assume Hu': u' :e L2.
    apply ReplE_impred (SNoL (y * z)) (fun w => x * z + w) u' Hu'.
    let u. assume Hu: u :e SNoL (y * z).
    assume Hu'u: u' = x * z + u.
    rewrite Hu'u.
    prove x * z + u < (x + y) * z.
    apply SNoL_E (y * z) Lyz u Hu.
    assume Hu1 Hu2 Hu3.
    rewrite add_SNo_com (x * z) u Lxz Hu1.
    prove u + x * z < (x + y) * z.
    apply mul_SNo_SNoL_interpolate_impred y z Hy Hz u Hu.
    * { let v. assume Hv: v :e SNoL y.
        let w. assume Hw: w :e SNoL z.
	assume Hvw: u + v * w <= v * z + y * w.
	apply SNoL_E y Hy v Hv.
	assume Hv1 Hv2 Hv3.
	apply SNoL_E z Hz w Hw.
	assume Hw1 Hw2 Hw3.
        claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim Lxv: SNo (x + v).
	{ exact SNo_add_SNo x v Hx Hv1. }
	claim Luvw: SNo (u + v * w).
	{ exact SNo_add_SNo u (v * w) Hu1 Lvw. }
	claim Lxyw: SNo ((x + y) * w).
	{ exact SNo_mul_SNo (x + y) w Lxy Hw1. }
        claim Lvz: SNo (v * z).
	{ exact SNo_mul_SNo v z Hv1 Hz. }
	claim Lxw: SNo (x * w).
	{ exact SNo_mul_SNo x w Hx Hw1. }
	claim Lyw: SNo (y * w).
	{ exact SNo_mul_SNo y w Hy Hw1. }
	claim Luxz: SNo (u + x * z).
	{ exact SNo_add_SNo u (x * z) Hu1 Lxz. }
	claim Lvwxw: SNo (v * w + x * w).
	{ exact SNo_add_SNo (v * w) (x * w) Lvw Lxw. }
        prove u + x * z < (x + y) * z.
        apply add_SNo_Lt1_cancel (u + x * z) (v * w + x * w) ((x + y) * z)
	                         Luxz Lvwxw Lxyz.
        prove (u + x * z) + v * w + x * w < (x + y) * z + v * w + x * w.
	rewrite add_SNo_com_4_inner_mid u (x * z) (v * w) (x * w) Hu1 Lxz Lvw Lxw.
	prove (u + v * w) + x * z + x * w < (x + y) * z + v * w + x * w.
        apply SNoLeLt_tra ((u + v * w) + x * z + x * w)
	                  (v * z + x * z + x * w + y * w)
	                  ((x + y) * z + v * w + x * w)
			  (SNo_add_SNo_3 (u + v * w) (x * z) (x * w) Luvw Lxz Lxw)
			  (SNo_add_SNo_4 (v * z) (x * z) (x * w) (y * w) Lvz Lxz Lxw Lyw)
			  (SNo_add_SNo_3 ((x + y) * z) (v * w) (x * w) Lxyz Lvw Lxw).
        - prove (u + v * w) + x * z + x * w <= v * z + x * z + x * w + y * w.
	  rewrite add_SNo_assoc (v * z) (x * z) (x * w + y * w)
	                        Lvz Lxz (SNo_add_SNo (x * w) (y * w) Lxw Lyw).
          prove (u + v * w) + x * z + x * w <= (v * z + x * z) + x * w + y * w.
	  rewrite add_SNo_com (x * w) (y * w) Lxw Lyw.
          prove (u + v * w) + x * z + x * w <= (v * z + x * z) + y * w + x * w.
          rewrite add_SNo_com_4_inner_mid (v * z) (x * z) (y * w) (x * w) Lvz Lxz Lyw Lxw.
          prove (u + v * w) + x * z + x * w <= (v * z + y * w) + x * z + x * w.
	  apply add_SNo_Le1 (u + v * w) (x * z + x * w) (v * z + y * w)
	                    Luvw
			    (SNo_add_SNo (x * z) (x * w) Lxz Lxw)
			    (SNo_add_SNo (v * z) (y * w) Lvz Lyw).
          prove u + v * w <= v * z + y * w.
	  exact Hvw.
        - prove v * z + x * z + x * w + y * w < (x + y) * z + v * w + x * w.
	  rewrite <- IHz w (SNoL_SNoS z Hz w Hw).
	  prove v * z + x * z + (x + y) * w < (x + y) * z + v * w + x * w.
	  rewrite add_SNo_com (v * w) (x * w) Lvw Lxw.
	  rewrite <- IHyz v (SNoL_SNoS y Hy v Hv) w (SNoL_SNoS z Hz w Hw).
	  prove v * z + x * z + (x + y) * w < (x + y) * z + (x + v) * w.
	  rewrite add_SNo_assoc (v * z) (x * z) ((x + y) * w) Lvz Lxz Lxyw.
	  prove (v * z + x * z) + (x + y) * w < (x + y) * z + (x + v) * w.
	  rewrite add_SNo_com (v * z) (x * z) Lvz Lxz.
	  prove (x * z + v * z) + (x + y) * w < (x + y) * z + (x + v) * w.
	  rewrite <- IHy v (SNoL_SNoS y Hy v Hv).
	  prove (x + v) * z + (x + y) * w < (x + y) * z + (x + v) * w.
	  apply mul_SNo_Lt (x + y) z (x + v) w Lxy Hz Lxv Hw1.
	  + prove x + v < x + y. apply add_SNo_Lt2 x v y Hx Hv1 Hy. exact Hv3.
	  + prove w < z. exact Hw3.
      }
    * { let v. assume Hv: v :e SNoR y.
        let w. assume Hw: w :e SNoR z.
	assume Hvw: u + v * w <= v * z + y * w.
	apply SNoR_E y Hy v Hv.
	assume Hv1 Hv2 Hv3.
	apply SNoR_E z Hz w Hw.
	assume Hw1 Hw2 Hw3.
        claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim Lxv: SNo (x + v).
	{ exact SNo_add_SNo x v Hx Hv1. }
	claim Luvw: SNo (u + v * w).
	{ exact SNo_add_SNo u (v * w) Hu1 Lvw. }
	claim Lxyw: SNo ((x + y) * w).
	{ exact SNo_mul_SNo (x + y) w Lxy Hw1. }
        claim Lvz: SNo (v * z).
	{ exact SNo_mul_SNo v z Hv1 Hz. }
	claim Lxw: SNo (x * w).
	{ exact SNo_mul_SNo x w Hx Hw1. }
	claim Lyw: SNo (y * w).
	{ exact SNo_mul_SNo y w Hy Hw1. }
	claim Luxz: SNo (u + x * z).
	{ exact SNo_add_SNo u (x * z) Hu1 Lxz. }
	claim Lvwxw: SNo (v * w + x * w).
	{ exact SNo_add_SNo (v * w) (x * w) Lvw Lxw. }
	claim Lvzxw: SNo (v * z + x * w).
	{ exact SNo_add_SNo (v * z) (x * w) Lvz Lxw. }
        prove u + x * z < (x + y) * z.
        apply add_SNo_Lt1_cancel (u + x * z) (v * w + x * w) ((x + y) * z)
	                         Luxz Lvwxw Lxyz.
        prove (u + x * z) + v * w + x * w < (x + y) * z + v * w + x * w.
	rewrite add_SNo_com_4_inner_mid u (x * z) (v * w) (x * w) Hu1 Lxz Lvw Lxw.
	prove (u + v * w) + x * z + x * w < (x + y) * z + v * w + x * w.
        apply SNoLeLt_tra ((u + v * w) + x * z + x * w)
	                  (v * z + x * z + x * w + y * w)
	                  ((x + y) * z + v * w + x * w)
			  (SNo_add_SNo_3 (u + v * w) (x * z) (x * w) Luvw Lxz Lxw)
			  (SNo_add_SNo_4 (v * z) (x * z) (x * w) (y * w) Lvz Lxz Lxw Lyw)
			  (SNo_add_SNo_3 ((x + y) * z) (v * w) (x * w) Lxyz Lvw Lxw).
        - prove (u + v * w) + x * z + x * w <= v * z + x * z + x * w + y * w.
	  rewrite add_SNo_assoc (v * z) (x * z) (x * w + y * w)
	                        Lvz Lxz (SNo_add_SNo (x * w) (y * w) Lxw Lyw).
	  rewrite <- add_SNo_com (y * w) (x * w) Lyw Lxw.
          prove (u + v * w) + x * z + x * w <= (v * z + x * z) + y * w + x * w.
          rewrite add_SNo_com_4_inner_mid (v * z) (x * z) (y * w) (x * w) Lvz Lxz Lyw Lxw.
          prove (u + v * w) + x * z + x * w <= (v * z + y * w) + x * z + x * w.
	  apply add_SNo_Le1 (u + v * w) (x * z + x * w) (v * z + y * w)
	                    Luvw
			    (SNo_add_SNo (x * z) (x * w) Lxz Lxw)
			    (SNo_add_SNo (v * z) (y * w) Lvz Lyw).
          prove u + v * w <= v * z + y * w.
	  exact Hvw.
        - prove v * z + x * z + x * w + y * w < (x + y) * z + v * w + x * w.
	  rewrite <- IHz w (SNoR_SNoS z Hz w Hw).
	  prove v * z + x * z + (x + y) * w < (x + y) * z + v * w + x * w.
	  rewrite add_SNo_com (v * w) (x * w) Lvw Lxw.
	  prove v * z + x * z + (x + y) * w < (x + y) * z + x * w + v * w.
	  rewrite <- IHyz v (SNoR_SNoS y Hy v Hv) w (SNoR_SNoS z Hz w Hw).
	  prove v * z + x * z + (x + y) * w < (x + y) * z + (x + v) * w.
	  rewrite add_SNo_assoc (v * z) (x * z) ((x + y) * w) Lvz Lxz Lxyw.
	  prove (v * z + x * z) + (x + y) * w < (x + y) * z + (x + v) * w.
	  rewrite add_SNo_com (v * z) (x * z) Lvz Lxz.
	  rewrite <- IHy v (SNoR_SNoS y Hy v Hv).
	  prove (x + v) * z + (x + y) * w < (x + y) * z + (x + v) * w.
	  rewrite add_SNo_com ((x + v) * z) ((x + y) * w)
	                      (SNo_mul_SNo (x + v) z Lxv Hz)
	                      Lxyw.
	  rewrite add_SNo_com ((x + y) * z) ((x + v) * w) Lxyz
  	                      (SNo_mul_SNo (x + v) w Lxv Hw1).
	  prove (x + y) * w + (x + v) * z < (x + v) * w + (x + y) * z.
	  apply mul_SNo_Lt (x + v) w (x + y) z Lxv Hw1 Lxy Hz.
	  + prove x + y < x + v. apply add_SNo_Lt2 x y v Hx Hy Hv1. exact Hv3.
	  + prove z < w. exact Hw3.
      }
- let u'. assume Hu': u' :e R1 :\/: R2. rewrite <- HE.
  prove (x + y) * z < u'.
  apply binunionE R1 R2 u' Hu'.
  + assume Hu': u' :e R1.
    apply ReplE_impred (SNoR (x * z)) (fun w => w + y * z) u' Hu'.
    let u. assume Hu: u :e SNoR (x * z).
    assume Hu'u: u' = u + y * z.
    rewrite Hu'u.
    prove (x + y) * z < u + y * z.
    apply SNoR_E (x * z) Lxz u Hu.
    assume Hu1 Hu2 Hu3.
    apply mul_SNo_SNoR_interpolate_impred x z Hx Hz u Hu.
    * { let v. assume Hv: v :e SNoL x.
        let w. assume Hw: w :e SNoR z.
	assume Hvw: v * z + x * w <= u + v * w.
	apply SNoL_E x Hx v Hv.
	assume Hv1 Hv2 Hv3.
	apply SNoR_E z Hz w Hw.
	assume Hw1 Hw2 Hw3.
        claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim Lvy: SNo (v + y).
	{ exact SNo_add_SNo v y Hv1 Hy. }
	claim Luvw: SNo (u + v * w).
	{ exact SNo_add_SNo u (v * w) Hu1 Lvw. }
	claim Lxyw: SNo ((x + y) * w).
	{ exact SNo_mul_SNo (x + y) w Lxy Hw1. }
        claim Lvz: SNo (v * z).
	{ exact SNo_mul_SNo v z Hv1 Hz. }
	claim Lxw: SNo (x * w).
	{ exact SNo_mul_SNo x w Hx Hw1. }
	claim Lyw: SNo (y * w).
	{ exact SNo_mul_SNo y w Hy Hw1. }
	claim Luyz: SNo (u + y * z).
	{ exact SNo_add_SNo u (y * z) Hu1 Lyz. }
	claim Lvwyw: SNo (v * w + y * w).
	{ exact SNo_add_SNo (v * w) (y * w) Lvw Lyw. }
	claim Lvzxw: SNo (v * z + x * w).
	{ exact SNo_add_SNo (v * z) (x * w) Lvz Lxw. }
        prove (x + y) * z < u + y * z.
        apply add_SNo_Lt1_cancel ((x + y) * z) (v * w + y * w) (u + y * z)
	                         Lxyz Lvwyw Luyz.
        prove (x + y) * z + v * w + y * w < (u + y * z) + v * w + y * w.
	rewrite add_SNo_com_4_inner_mid u (y * z) (v * w) (y * w) Hu1 Lyz Lvw Lyw.
	prove (x + y) * z + v * w + y * w < (u + v * w) + y * z + y * w.
        apply SNoLtLe_tra ((x + y) * z + v * w + y * w)
	                  (v * z + y * z + x * w + y * w)
	                  ((u + v * w) + y * z + y * w)
			  (SNo_add_SNo_3 ((x + y) * z) (v * w) (y * w) Lxyz Lvw Lyw)
			  (SNo_add_SNo_4 (v * z) (y * z) (x * w) (y * w) Lvz Lyz Lxw Lyw)
			  (SNo_add_SNo_3 (u + v * w) (y * z) (y * w) Luvw Lyz Lyw).
        - prove (x + y) * z + v * w + y * w < v * z + y * z + x * w + y * w.
	  rewrite <- IHz w (SNoR_SNoS z Hz w Hw).
	  prove (x + y) * z + v * w + y * w < v * z + y * z + (x + y) * w.
	  rewrite <- IHxz v (SNoL_SNoS x Hx v Hv) w (SNoR_SNoS z Hz w Hw).
	  prove (x + y) * z + (v + y) * w < v * z + y * z + (x + y) * w.
	  rewrite add_SNo_assoc (v * z) (y * z) ((x + y) * w) Lvz Lyz Lxyw.
	  rewrite <- IHx v (SNoL_SNoS x Hx v Hv).
	  prove (x + y) * z + (v + y) * w < (v + y) * z + (x + y) * w.
	  rewrite add_SNo_com ((x + y) * z) ((v + y) * w)
	                      Lxyz
			      (SNo_mul_SNo (v + y) w Lvy Hw1).
	  rewrite add_SNo_com ((v + y) * z) ((x + y) * w)
	                      (SNo_mul_SNo (v + y) z Lvy Hz)
			      Lxyw.
	  prove (v + y) * w + (x + y) * z < (x + y) * w + (v + y) * z.
	  apply mul_SNo_Lt (x + y) w (v + y) z Lxy Hw1 Lvy Hz.
	  + prove v + y < x + y. apply add_SNo_Lt1 v y x Hv1 Hy Hx. exact Hv3.
	  + prove z < w. exact Hw3.
        - prove v * z + y * z + x * w + y * w <= (u + v * w) + y * z + y * w.
	  rewrite add_SNo_assoc (v * z) (y * z) (x * w + y * w)
	                        Lvz Lyz (SNo_add_SNo (x * w) (y * w) Lxw Lyw).
          prove (v * z + y * z) + x * w + y * w <= (u + v * w) + y * z + y * w.
          rewrite add_SNo_com_4_inner_mid (v * z) (y * z) (x * w) (y * w) Lvz Lyz Lxw Lyw.
	  prove (v * z + x * w) + y * z + y * w <= (u + v * w) + y * z + y * w.
	  apply add_SNo_Le1 (v * z + x * w) (y * z + y * w) (u + v * w)
			    (SNo_add_SNo (v * z) (x * w) Lvz Lxw)
			    (SNo_add_SNo (y * z) (y * w) Lyz Lyw)
	                    Luvw.
          prove v * z + x * w <= u + v * w.
	  exact Hvw.
      }
    * { let v. assume Hv: v :e SNoR x.
        let w. assume Hw: w :e SNoL z.
	assume Hvw: v * z + x * w <= u + v * w.
	apply SNoR_E x Hx v Hv.
	assume Hv1 Hv2 Hv3.
	apply SNoL_E z Hz w Hw.
	assume Hw1 Hw2 Hw3.
        claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim Lvy: SNo (v + y).
	{ exact SNo_add_SNo v y Hv1 Hy. }
	claim Luvw: SNo (u + v * w).
	{ exact SNo_add_SNo u (v * w) Hu1 Lvw. }
	claim Lxyw: SNo ((x + y) * w).
	{ exact SNo_mul_SNo (x + y) w Lxy Hw1. }
        claim Lvz: SNo (v * z).
	{ exact SNo_mul_SNo v z Hv1 Hz. }
	claim Lxw: SNo (x * w).
	{ exact SNo_mul_SNo x w Hx Hw1. }
	claim Lyw: SNo (y * w).
	{ exact SNo_mul_SNo y w Hy Hw1. }
	claim Luyz: SNo (u + y * z).
	{ exact SNo_add_SNo u (y * z) Hu1 Lyz. }
	claim Lvwyw: SNo (v * w + y * w).
	{ exact SNo_add_SNo (v * w) (y * w) Lvw Lyw. }
        prove (x + y) * z < u + y * z.
        apply add_SNo_Lt1_cancel ((x + y) * z) (v * w + y * w) (u + y * z)
	                         Lxyz Lvwyw Luyz.
        prove (x + y) * z + v * w + y * w < (u + y * z) + v * w + y * w.
	rewrite add_SNo_com_4_inner_mid u (y * z) (v * w) (y * w) Hu1 Lyz Lvw Lyw.
	prove (x + y) * z + v * w + y * w < (u + v * w) + y * z + y * w.
        apply SNoLtLe_tra ((x + y) * z + v * w + y * w)
	                  (v * z + y * z + x * w + y * w)
	                  ((u + v * w) + y * z + y * w)
			  (SNo_add_SNo_3 ((x + y) * z) (v * w) (y * w) Lxyz Lvw Lyw)
			  (SNo_add_SNo_4 (v * z) (y * z) (x * w) (y * w) Lvz Lyz Lxw Lyw)
			  (SNo_add_SNo_3 (u + v * w) (y * z) (y * w) Luvw Lyz Lyw).
        - prove (x + y) * z + v * w + y * w < v * z + y * z + x * w + y * w.
	  rewrite <- IHz w (SNoL_SNoS z Hz w Hw).
	  prove (x + y) * z + v * w + y * w < v * z + y * z + (x + y) * w.
	  rewrite <- IHxz v (SNoR_SNoS x Hx v Hv) w (SNoL_SNoS z Hz w Hw).
	  prove (x + y) * z + (v + y) * w < v * z + y * z + (x + y) * w.
	  rewrite add_SNo_assoc (v * z) (y * z) ((x + y) * w) Lvz Lyz Lxyw.
	  rewrite <- IHx v (SNoR_SNoS x Hx v Hv).
	  prove (x + y) * z + (v + y) * w < (v + y) * z + (x + y) * w.
	  apply mul_SNo_Lt (v + y) z (x + y) w Lvy Hz Lxy Hw1.
	  + prove x + y < v + y. apply add_SNo_Lt1 x y v Hx Hy Hv1. exact Hv3.
	  + prove w < z. exact Hw3.
        - prove v * z + y * z + x * w + y * w <= (u + v * w) + y * z + y * w.
	  rewrite add_SNo_assoc (v * z) (y * z) (x * w + y * w)
	                        Lvz Lyz (SNo_add_SNo (x * w) (y * w) Lxw Lyw).
          prove (v * z + y * z) + x * w + y * w <= (u + v * w) + y * z + y * w.
          rewrite add_SNo_com_4_inner_mid (v * z) (y * z) (x * w) (y * w) Lvz Lyz Lxw Lyw.
	  prove (v * z + x * w) + y * z + y * w <= (u + v * w) + y * z + y * w.
	  apply add_SNo_Le1 (v * z + x * w) (y * z + y * w) (u + v * w)
			    (SNo_add_SNo (v * z) (x * w) Lvz Lxw)
			    (SNo_add_SNo (y * z) (y * w) Lyz Lyw)
	                    Luvw.
          prove v * z + x * w <= u + v * w.
	  exact Hvw.
      }
  + assume Hu': u' :e R2.
    apply ReplE_impred (SNoR (y * z)) (fun w => x * z + w) u' Hu'.
    let u. assume Hu: u :e SNoR (y * z).
    assume Hu'u: u' = x * z + u.
    rewrite Hu'u.
    prove (x + y) * z < x * z + u.
    apply SNoR_E (y * z) Lyz u Hu.
    assume Hu1 Hu2 Hu3.
    rewrite add_SNo_com (x * z) u Lxz Hu1.
    prove (x + y) * z < u + x * z.
    apply mul_SNo_SNoR_interpolate_impred y z Hy Hz u Hu.
    * { let v. assume Hv: v :e SNoL y.
        let w. assume Hw: w :e SNoR z.
	assume Hvw: v * z + y * w <= u + v * w.
	apply SNoL_E y Hy v Hv.
	assume Hv1 Hv2 Hv3.
	apply SNoR_E z Hz w Hw.
	assume Hw1 Hw2 Hw3.
        claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim Lxv: SNo (x + v).
	{ exact SNo_add_SNo x v Hx Hv1. }
	claim Luvw: SNo (u + v * w).
	{ exact SNo_add_SNo u (v * w) Hu1 Lvw. }
	claim Lxyw: SNo ((x + y) * w).
	{ exact SNo_mul_SNo (x + y) w Lxy Hw1. }
        claim Lvz: SNo (v * z).
	{ exact SNo_mul_SNo v z Hv1 Hz. }
	claim Lxw: SNo (x * w).
	{ exact SNo_mul_SNo x w Hx Hw1. }
	claim Lyw: SNo (y * w).
	{ exact SNo_mul_SNo y w Hy Hw1. }
	claim Luxz: SNo (u + x * z).
	{ exact SNo_add_SNo u (x * z) Hu1 Lxz. }
	claim Lvwxw: SNo (v * w + x * w).
	{ exact SNo_add_SNo (v * w) (x * w) Lvw Lxw. }
        prove (x + y) * z < u + x * z.
        apply add_SNo_Lt1_cancel ((x + y) * z) (v * w + x * w) (u + x * z)
	                         Lxyz Lvwxw Luxz.
        prove (x + y) * z + v * w + x * w < (u + x * z) + v * w + x * w.
	rewrite add_SNo_com_4_inner_mid u (x * z) (v * w) (x * w) Hu1 Lxz Lvw Lxw.
	prove (x + y) * z + v * w + x * w < (u + v * w) + x * z + x * w.
        apply SNoLtLe_tra ((x + y) * z + v * w + x * w)
	                  (v * z + x * z + x * w + y * w)
	                  ((u + v * w) + x * z + x * w)
			  (SNo_add_SNo_3 ((x + y) * z) (v * w) (x * w) Lxyz Lvw Lxw)
			  (SNo_add_SNo_4 (v * z) (x * z) (x * w) (y * w) Lvz Lxz Lxw Lyw)
			  (SNo_add_SNo_3 (u + v * w) (x * z) (x * w) Luvw Lxz Lxw).
        - prove (x + y) * z + v * w + x * w < v * z + x * z + x * w + y * w.
	  rewrite <- IHz w (SNoR_SNoS z Hz w Hw).
	  prove (x + y) * z + v * w + x * w < v * z + x * z + (x + y) * w.
	  rewrite add_SNo_com (v * w) (x * w) Lvw Lxw.
	  rewrite <- IHyz v (SNoL_SNoS y Hy v Hv) w (SNoR_SNoS z Hz w Hw).
	  prove (x + y) * z + (x + v) * w < v * z + x * z + (x + y) * w.
	  rewrite add_SNo_assoc (v * z) (x * z) ((x + y) * w) Lvz Lxz Lxyw.
	  prove (x + y) * z + (x + v) * w < (v * z + x * z) + (x + y) * w.
	  rewrite add_SNo_com (v * z) (x * z) Lvz Lxz.
	  prove (x + y) * z + (x + v) * w < (x * z + v * z) + (x + y) * w.
	  rewrite <- IHy v (SNoL_SNoS y Hy v Hv).
	  prove (x + y) * z + (x + v) * w < (x + v) * z + (x + y) * w.
	  rewrite add_SNo_com ((x + y) * z) ((x + v) * w)
	                      Lxyz
			      (SNo_mul_SNo (x + v) w Lxv Hw1).
	  rewrite add_SNo_com ((x + v) * z) ((x + y) * w)
	                      (SNo_mul_SNo (x + v) z Lxv Hz)
			      Lxyw.
	  prove (x + v) * w + (x + y) * z < (x + y) * w + (x + v) * z.
	  apply mul_SNo_Lt (x + y) w (x + v) z Lxy Hw1 Lxv Hz.
	  + prove x + v < x + y. apply add_SNo_Lt2 x v y Hx Hv1 Hy. exact Hv3.
	  + prove z < w. exact Hw3.
        - prove v * z + x * z + x * w + y * w <= (u + v * w) + x * z + x * w.
	  rewrite add_SNo_assoc (v * z) (x * z) (x * w + y * w)
	                        Lvz Lxz (SNo_add_SNo (x * w) (y * w) Lxw Lyw).
          prove (v * z + x * z) + x * w + y * w <= (u + v * w) + x * z + x * w.
	  rewrite add_SNo_com (x * w) (y * w) Lxw Lyw.
          prove (v * z + x * z) + y * w + x * w <= (u + v * w) + x * z + x * w.
          rewrite add_SNo_com_4_inner_mid (v * z) (x * z) (y * w) (x * w) Lvz Lxz Lyw Lxw.
          prove (v * z + y * w) + x * z + x * w <= (u + v * w) + x * z + x * w.
	  apply add_SNo_Le1 (v * z + y * w) (x * z + x * w) (u + v * w)
			    (SNo_add_SNo (v * z) (y * w) Lvz Lyw)
			    (SNo_add_SNo (x * z) (x * w) Lxz Lxw)
	                    Luvw.
          prove v * z + y * w <= u + v * w.
	  exact Hvw.
      }
    * { let v. assume Hv: v :e SNoR y.
        let w. assume Hw: w :e SNoL z.
	assume Hvw: v * z + y * w <= u + v * w.
	apply SNoR_E y Hy v Hv.
	assume Hv1 Hv2 Hv3.
	apply SNoL_E z Hz w Hw.
	assume Hw1 Hw2 Hw3.
        claim Lvw: SNo (v * w).
	{ exact SNo_mul_SNo v w Hv1 Hw1. }
	claim Lxv: SNo (x + v).
	{ exact SNo_add_SNo x v Hx Hv1. }
	claim Luvw: SNo (u + v * w).
	{ exact SNo_add_SNo u (v * w) Hu1 Lvw. }
	claim Lxyw: SNo ((x + y) * w).
	{ exact SNo_mul_SNo (x + y) w Lxy Hw1. }
        claim Lvz: SNo (v * z).
	{ exact SNo_mul_SNo v z Hv1 Hz. }
	claim Lxw: SNo (x * w).
	{ exact SNo_mul_SNo x w Hx Hw1. }
	claim Lyw: SNo (y * w).
	{ exact SNo_mul_SNo y w Hy Hw1. }
	claim Luxz: SNo (u + x * z).
	{ exact SNo_add_SNo u (x * z) Hu1 Lxz. }
	claim Lvwxw: SNo (v * w + x * w).
	{ exact SNo_add_SNo (v * w) (x * w) Lvw Lxw. }
	claim Lvzxw: SNo (v * z + x * w).
	{ exact SNo_add_SNo (v * z) (x * w) Lvz Lxw. }
        prove (x + y) * z < u + x * z.
        apply add_SNo_Lt1_cancel ((x + y) * z) (v * w + x * w) (u + x * z)
	                         Lxyz Lvwxw Luxz.
        prove (x + y) * z + v * w + x * w < (u + x * z) + v * w + x * w.
	rewrite add_SNo_com_4_inner_mid u (x * z) (v * w) (x * w) Hu1 Lxz Lvw Lxw.
	prove (x + y) * z + v * w + x * w < (u + v * w) + x * z + x * w.
        apply SNoLtLe_tra ((x + y) * z + v * w + x * w)
	                  (v * z + x * z + x * w + y * w)
	                  ((u + v * w) + x * z + x * w)
			  (SNo_add_SNo_3 ((x + y) * z) (v * w) (x * w) Lxyz Lvw Lxw)
			  (SNo_add_SNo_4 (v * z) (x * z) (x * w) (y * w) Lvz Lxz Lxw Lyw)
			  (SNo_add_SNo_3 (u + v * w) (x * z) (x * w) Luvw Lxz Lxw).
        - prove (x + y) * z + v * w + x * w < v * z + x * z + x * w + y * w.
	  rewrite <- IHz w (SNoL_SNoS z Hz w Hw).
	  prove (x + y) * z + v * w + x * w < v * z + x * z + (x + y) * w.
	  rewrite add_SNo_com (v * w) (x * w) Lvw Lxw.
	  prove (x + y) * z + x * w + v * w < v * z + x * z + (x + y) * w.
	  rewrite <- IHyz v (SNoR_SNoS y Hy v Hv) w (SNoL_SNoS z Hz w Hw).
	  prove (x + y) * z + (x + v) * w < v * z + x * z + (x + y) * w.
	  rewrite add_SNo_assoc (v * z) (x * z) ((x + y) * w) Lvz Lxz Lxyw.
	  prove (x + y) * z + (x + v) * w < (v * z + x * z) + (x + y) * w.
	  rewrite add_SNo_com (v * z) (x * z) Lvz Lxz.
	  rewrite <- IHy v (SNoR_SNoS y Hy v Hv).
	  prove (x + y) * z + (x + v) * w < (x + v) * z + (x + y) * w.
	  rewrite add_SNo_com ((x + v) * z) ((x + y) * w)
	                      (SNo_mul_SNo (x + v) z Lxv Hz)
	                      Lxyw.
	  rewrite add_SNo_com ((x + y) * z) ((x + v) * w) Lxyz
  	                      (SNo_mul_SNo (x + v) w Lxv Hw1).
	  prove (x + v) * w + (x + y) * z < (x + y) * w + (x + v) * z.
	  rewrite add_SNo_com ((x + v) * w) ((x + y) * z)
			      (SNo_mul_SNo (x + v) w Lxv Hw1)
	                      Lxyz.
	  rewrite add_SNo_com ((x + y) * w) ((x + v) * z)
			      Lxyw
	                      (SNo_mul_SNo (x + v) z Lxv Hz).
	  prove (x + y) * z + (x + v) * w < (x + v) * z + (x + y) * w.
	  apply mul_SNo_Lt (x + v) z (x + y) w Lxv Hz Lxy Hw1.
	  + prove x + y < x + v. apply add_SNo_Lt2 x y v Hx Hy Hv1. exact Hv3.
	  + prove w < z. exact Hw3.
        - prove v * z + x * z + x * w + y * w <= (u + v * w) + x * z + x * w.
	  rewrite add_SNo_assoc (v * z) (x * z) (x * w + y * w)
	                        Lvz Lxz (SNo_add_SNo (x * w) (y * w) Lxw Lyw).
	  rewrite <- add_SNo_com (y * w) (x * w) Lyw Lxw.
          prove (v * z + x * z) + y * w + x * w <= (u + v * w) + x * z + x * w.
          rewrite add_SNo_com_4_inner_mid (v * z) (x * z) (y * w) (x * w) Lvz Lxz Lyw Lxw.
          prove (v * z + y * w) + x * z + x * w <= (u + v * w) + x * z + x * w.
	  apply add_SNo_Le1 (v * z + y * w) (x * z + x * w) (u + v * w)
			    (SNo_add_SNo (v * z) (y * w) Lvz Lyw)
			    (SNo_add_SNo (x * z) (x * w) Lxz Lxw)
	                    Luvw.
          prove v * z + y * w <= u + v * w.
	  exact Hvw.
      }
Qed.

Theorem mul_SNo_distrL : forall x y z, SNo x -> SNo y -> SNo z
  -> x * (y + z) = x * y + x * z.
let x y z. assume Hx Hy Hz.
transitivity ((y + z) * x),
             (y * x + z * x).
- exact mul_SNo_com x (y + z) Hx (SNo_add_SNo y z Hy Hz).
- exact mul_SNo_distrR y z x Hy Hz Hx.
- prove y * x + z * x = x * y + x * z.
  f_equal.
  + exact mul_SNo_com y x Hy Hx.
  + exact mul_SNo_com z x Hz Hx.
Qed.

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

Theorem mul_SNo_assoc_lem1 : forall x y z, SNo x -> SNo y -> SNo z
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
let x y z. assume Hx Hy Hz.
assume IHx IHy IHz IHxy IHxz IHyz IHxyz.
let L. assume HLE.
let u. assume Hu: u :e L.
prove u < (x * y) * z.
claim Lxy: SNo (x * y).
{ exact SNo_M x y Hx Hy. }
claim Lyz: SNo (y * z).
{ exact SNo_M y z Hy Hz. }
claim Lxyz2: SNo ((x * y) * z).
{ exact SNo_M (x * y) z Lxy Hz. }
claim L1: forall v :e SNoS_ (SNoLev x),
          forall w, SNo w ->
          forall w1 :e SNoS_ (SNoLev y),
          forall w2 :e SNoS_ (SNoLev z),
        u = v * (y * z) + x * w + - v * w
     -> v * (w1 * z + y * w2) + x * (w + w1 * w2) <= x * (w1 * z + y * w2) + v * (w + w1 * w2)
     -> (v * y + x * w1) * z + (x * y + v * w1) * w2 < (x * y + v * w1) * z + (v * y + x * w1) * w2
     -> u < (x * y) * z.
{ let v. assume Hv. let w. assume Hw. let w1. assume Hw1. let w2. assume Hw2.
  assume Hue H1 H2.
  apply SNoS_E2 (SNoLev x) (SNoLev_ordinal x Hx) v Hv.
  assume Hv1 Hv2 Hv3 Hv4.
  apply SNoS_E2 (SNoLev y) (SNoLev_ordinal y Hy) w1 Hw1.
  assume Hw11 Hw12 Hw13 Hw14.
  apply SNoS_E2 (SNoLev z) (SNoLev_ordinal z Hz) w2 Hw2.
  assume Hw21 Hw22 Hw23 Hw24.
  claim Lvyz: SNo (v * (y * z)).
  { exact SNo_M v (y * z) Hv3 Lyz. }
  claim Lxw: SNo (x * w).
  { exact SNo_M x w Hx Hw. }
  claim Lxw1: SNo (x * w1).
  { exact SNo_M x w1 Hx Hw13. }
  claim Lvw: SNo (v * w).
  { exact SNo_M v w Hv3 Hw. }
  claim Lvw1: SNo (v * w1).
  { exact SNo_M v w1 Hv3 Hw13. }
  claim Lvy: SNo (v * y).
  { exact SNo_M v y Hv3 Hy. }
  claim Lw1z: SNo (w1 * z).
  { exact SNo_M w1 z Hw13 Hz. }
  claim Lyw2: SNo (y * w2).
  { exact SNo_M y w2 Hy Hw23. }
  claim Lvw1z: SNo (v * (w1 * z)).
  { exact SNo_M v (w1 * z) Hv3 Lw1z. }
  claim Lvyw2: SNo (v * (y * w2)).
  { exact SNo_M v (y * w2) Hv3 Lyw2. }
  claim Lw1w2: SNo (w1 * w2).
  { exact SNo_M w1 w2 Hw13 Hw23. }
  claim Lxw1w2: SNo (x * (w1 * w2)).
  { exact SNo_M x (w1 * w2) Hx Lw1w2. }
  claim Lxw1z: SNo (x * (w1 * z)).
  { exact SNo_M x (w1 * z) Hx Lw1z. }
  claim Lxyw2: SNo (x * (y * w2)).
  { exact SNo_M x (y * w2) Hx Lyw2. }
  claim Lvyzxw: SNo (v * (y * z) + x * w).
  { exact SNo_add_SNo (v * (y * z)) (x * w) Lvyz Lxw. }
  claim Lxyzvw: SNo ((x * y) * z + v * w).
  { exact SNo_add_SNo ((x * y) * z) (v * w) Lxyz2 Lvw. }
  claim Lvw1w2: SNo (v * (w1 * w2)).
  { exact SNo_M v (w1 * w2) Hv3 Lw1w2. }
  claim Lww1w2: SNo (w + w1 * w2).
  { exact SNo_add_SNo w (w1 * w2) Hw Lw1w2. }
  claim Lvww1w2: SNo (v * (w + w1 * w2)).
  { exact SNo_M v (w + w1 * w2) Hv3 Lww1w2. }
  claim Lvw1zyw2: SNo (v * (w1 * z + y * w2)).
  { exact SNo_M v (w1 * z + y * w2) Hv3 (SNo_add_SNo (w1 * z) (y * w2) Lw1z Lyw2). }
  claim Lvwvw1w2: SNo (v * w + v * (w1 * w2)).
  { exact SNo_add_SNo (v * w) (v * (w1 * w2)) Lvw Lvw1w2. }
  claim Lvyzxw1zxyw2vwvw1w2: SNo (v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2)).
  { exact SNo_add_SNo_4 (v * (y * z)) (x * (w1 * z)) (x * (y * w2)) (v * w + v * (w1 * w2))
                        Lvyz Lxw1z Lxyw2 Lvwvw1w2.
  }
  claim Lvw1zvyw2xw1w2: SNo (v * (w1 * z) + v * (y * w2) + x * (w1 * w2)).
  { exact SNo_add_SNo_3 (v * (w1 * z)) (v * (y * w2)) (x * (w1 * w2)) Lvw1z Lvyw2 Lxw1w2. }
  prove u < (x * y) * z.
  rewrite Hue.
  prove (v * (y * z)) + (x * w) + - (v * w) < (x * y) * z.
  apply add_SNo_minus_Lt1b3 (v * (y * z)) (x * w) (v * w) ((x * y) * z) Lvyz Lxw Lvw Lxyz2.
  prove v * (y * z) + x * w < (x * y) * z + v * w.
  apply add_SNo_Lt1_cancel (v * (y * z) + x * w)
                           (v * (w1 * z) + v * (y * w2) + x * (w1 * w2))
                           ((x * y) * z + v * w)
                           Lvyzxw
                           Lvw1zvyw2xw1w2
                           Lxyzvw.
  prove (v * (y * z) + x * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)
      < ((x * y) * z + v * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2).
  apply SNoLeLt_tra ((v * (y * z) + x * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2))
                    (v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2))
                    (((x * y) * z + v * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)).
  - apply SNo_add_SNo.
    + exact Lvyzxw.
    + exact Lvw1zvyw2xw1w2.
  - exact Lvyzxw1zxyw2vwvw1w2.
  - apply SNo_add_SNo.
    + exact Lxyzvw.
    + exact Lvw1zvyw2xw1w2.
  - prove (v * (y * z) + x * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)
       <= v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2).
    rewrite <- add_SNo_assoc (v * (y * z)) (x * w) (v * (w1 * z) + v * (y * w2) + x * (w1 * w2)) Lvyz Lxw Lvw1zvyw2xw1w2.
    prove v * (y * z) + x * w + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)
       <= v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2).
    apply add_SNo_Le2 (v * (y * z))
                      (x * w + v * (w1 * z) + v * (y * w2) + x * (w1 * w2))
                      (x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2))
                      Lvyz
                      (SNo_add_SNo (x * w) (v * (w1 * z) + v * (y * w2) + x * (w1 * w2)) Lxw Lvw1zvyw2xw1w2)
                      (SNo_add_SNo_4 (x * (w1 * z)) (x * (y * w2)) (v * w) (v * (w1 * w2)) Lxw1z Lxyw2 Lvw Lvw1w2).
    prove x * w + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)
       <= x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2).
    rewrite add_SNo_assoc (v * (w1 * z)) (v * (y * w2)) (x * (w1 * w2)) Lvw1z Lvyw2 Lxw1w2.
    rewrite <- DL v (w1 * z) (y * w2) Hv3 Lw1z Lyw2.
    prove x * w + v * (w1 * z + y * w2) + x * (w1 * w2)
       <= x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2).
    rewrite add_SNo_com_3_0_1 (x * w) (v * (w1 * z + y * w2)) (x * (w1 * w2))
                              Lxw Lvw1zyw2 Lxw1w2.
    prove v * (w1 * z + y * w2) + x * w + x * (w1 * w2)
       <= x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2).
    rewrite <- DL x w (w1 * w2) Hx Hw Lw1w2.
    prove v * (w1 * z + y * w2) + x * (w + w1 * w2)
       <= x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2).
    rewrite <- DL v w (w1 * w2) Hv3 Hw Lw1w2.
    prove v * (w1 * z + y * w2) + x * (w + w1 * w2)
       <= x * (w1 * z) + x * (y * w2) + v * (w + w1 * w2).
    rewrite add_SNo_assoc (x * (w1 * z)) (x * (y * w2)) (v * (w + w1 * w2))
                          Lxw1z Lxyw2 Lvww1w2.
    rewrite <- DL x (w1 * z) (y * w2) Hx Lw1z Lyw2.
    prove v * (w1 * z + y * w2) + x * (w + w1 * w2)
       <= x * (w1 * z + y * w2) + v * (w + w1 * w2).
    exact H1.
  - prove v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2)
        < ((x * y) * z + v * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2).
    rewrite add_SNo_com ((x * y) * z) (v * w) Lxyz2 Lvw.
    rewrite <- add_SNo_assoc (v * w) ((x * y) * z) (v * (w1 * z) + v * (y * w2) + x * (w1 * w2))
                             Lvw Lxyz2 Lvw1zvyw2xw1w2.
    prove v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2)
        < v * w + (x * y) * z + v * (w1 * z) + v * (y * w2) + x * (w1 * w2).
    rewrite add_SNo_rotate_5_2 (v * (y * z)) (x * (w1 * z)) (x * (y * w2)) (v * w) (v * (w1 * w2))
                               Lvyz Lxw1z Lxyw2 Lvw Lvw1w2.
    prove v * w + v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2)
        < v * w + (x * y) * z + v * (w1 * z) + v * (y * w2) + x * (w1 * w2).
    apply add_SNo_Lt2 (v * w)
                      (v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2))
                      ((x * y) * z + v * (w1 * z) + v * (y * w2) + x * (w1 * w2))
                      Lvw
                      (SNo_add_SNo_4 (v * (w1 * w2)) (v * (y * z)) (x * (w1 * z)) (x * (y * w2)) Lvw1w2 Lvyz Lxw1z Lxyw2)
                      (SNo_add_SNo_4 ((x * y) * z) (v * (w1 * z)) (v * (y * w2)) (x * (w1 * w2)) Lxyz2 Lvw1z Lvyw2 Lxw1w2).
    prove v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2)
        < (x * y) * z + v * (w1 * z) + v * (y * w2) + x * (w1 * w2).
    rewrite add_SNo_assoc ((x * y) * z) (v * (w1 * z)) (v * (y * w2) + x * (w1 * w2)) Lxyz2 Lvw1z (SNo_add_SNo (v * (y * w2)) (x * (w1 * w2)) Lvyw2 Lxw1w2).
    prove v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2)
        < ((x * y) * z + v * (w1 * z)) + v * (y * w2) + x * (w1 * w2).
    rewrite IHxz v Hv w2 Hw2. rewrite IHyz w1 Hw1 w2 Hw2.
    prove v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2)
        < ((x * y) * z + v * (w1 * z)) + (v * y) * w2 + (x * w1) * w2.
    rewrite <- DR (v * y) (x * w1) w2 Lvy Lxw1 Hw23.
    prove v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2)
        < ((x * y) * z + v * (w1 * z)) + (v * y + x * w1) * w2.
    rewrite IHxy v Hv w1 Hw1.
    rewrite <- DR (x * y) (v * w1) z Lxy Lvw1 Hz.
    prove v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2)
        < (x * y + v * w1) * z + (v * y + x * w1) * w2.
    rewrite <- add_SNo_rotate_4_1 (v * (y * z)) (x * (w1 * z)) (x * (y * w2)) (v * (w1 * w2)) Lvyz Lxw1z Lxyw2 Lvw1w2.
    prove v * (y * z) + x * (w1 * z) + x * (y * w2) + v * (w1 * w2)
        < (x * y + v * w1) * z + (v * y + x * w1) * w2.
    rewrite add_SNo_assoc (v * (y * z)) (x * (w1 * z)) (x * (y * w2) + v * (w1 * w2))
                          Lvyz Lxw1z (SNo_add_SNo (x * (y * w2)) (v * (w1 * w2)) Lxyw2 Lvw1w2).
    prove (v * (y * z) + x * (w1 * z)) + x * (y * w2) + v * (w1 * w2)
        < (x * y + v * w1) * z + (v * y + x * w1) * w2.
    rewrite IHx v Hv. rewrite IHy w1 Hw1. rewrite IHz w2 Hw2.
    rewrite IHxyz v Hv w1 Hw1 w2 Hw2.
    prove ((v * y) * z + (x * w1) * z) + (x * y) * w2 + (v * w1) * w2
        < (x * y + v * w1) * z + (v * y + x * w1) * w2.
    rewrite <- DR (v * y) (x * w1) z Lvy Lxw1 Hz.
    rewrite <- DR (x * y) (v * w1) w2 Lxy Lvw1 Hw23.
    prove (v * y + x * w1) * z + (x * y + v * w1) * w2
        < (x * y + v * w1) * z + (v * y + x * w1) * w2.
    exact H2.
}
apply HLE u Hu.
+ let v. assume Hv: v :e SNoL x.
  let w. assume Hw: w :e SNoL (y * z).
  assume Hue: u = v * (y * z) + x * w + - v * w.
  apply SNoL_E x Hx v Hv.
  assume Hv1 Hv2 Hv3.
  claim Lw: SNo w.
  { apply SNoL_E (y * z) Lyz w Hw. assume H _ _. exact H. }
  apply IL y z Hy Hz w Hw.
  * { let w1. assume Hw1: w1 :e SNoL y.
      let w2. assume Hw2: w2 :e SNoL z.
      assume Hwl: w + w1 * w2 <= w1 * z + y * w2.
      apply SNoL_E y Hy w1 Hw1.
      assume Hw11 Hw12 Hw13.
      apply SNoL_E z Hz w2 Hw2.
      assume Hw21 Hw22 Hw23.
      claim Lw1z: SNo (w1 * z).
      { exact SNo_M w1 z Hw11 Hz. }
      claim Lyw2: SNo (y * w2).
      { exact SNo_M y w2 Hy Hw21. }
      claim Lw1zyw2: SNo (w1 * z + y * w2).
      { exact SNo_add_SNo (w1 * z) (y * w2) Lw1z Lyw2. }
      claim Lw1w2: SNo (w1 * w2).
      { exact SNo_M w1 w2 Hw11 Hw21. }
      claim Lww1w2: SNo (w + w1 * w2).
      { exact SNo_add_SNo w (w1 * w2) Lw Lw1w2. }
      apply L1 v (SNoL_SNoS x Hx v Hv) w Lw
               w1 (SNoL_SNoS y Hy w1 Hw1) w2 (SNoL_SNoS z Hz w2 Hw2)
               Hue.
      - prove v * (w1 * z + y * w2) + x * (w + w1 * w2) <= x * (w1 * z + y * w2) + v * (w + w1 * w2).
        apply M_Le x (w1 * z + y * w2) v (w + w1 * w2) Hx Lw1zyw2 Hv1 Lww1w2.
        + prove v <= x. apply SNoLtLe. exact Hv3.
        + prove w + w1 * w2 <= w1 * z + y * w2. exact Hwl.
      - prove (v * y + x * w1) * z + (x * y + v * w1) * w2 < (x * y + v * w1) * z + (v * y + x * w1) * w2.
        apply M_Lt (x * y + v * w1) z (v * y + x * w1) w2
                         (SNo_add_SNo (x * y) (v * w1) Lxy (SNo_M v w1 Hv1 Hw11))
                         Hz
                         (SNo_add_SNo (v * y) (x * w1) (SNo_M v y Hv1 Hy) (SNo_M x w1 Hx Hw11))
                         Hw21.
        + prove v * y + x * w1 < x * y + v * w1.
          apply M_Lt x y v w1 Hx Hy Hv1 Hw11.
          * prove v < x. exact Hv3.
          * prove w1 < y. exact Hw13.
        + prove w2 < z. exact Hw23.
    }
  * { let w1. assume Hw1: w1 :e SNoR y.
      let w2. assume Hw2: w2 :e SNoR z.
      assume Hwl: w + w1 * w2 <= w1 * z + y * w2.
      apply SNoR_E y Hy w1 Hw1.
      assume Hw11 Hw12 Hw13.
      apply SNoR_E z Hz w2 Hw2.
      assume Hw21 Hw22 Hw23.
      claim Lvy: SNo (v * y).
      { exact SNo_M v y Hv1 Hy. }
      claim Lvw1: SNo (v * w1).
      { exact SNo_M v w1 Hv1 Hw11. }
      claim Lxw1: SNo (x * w1).
      { exact SNo_M x w1 Hx Hw11. }
      claim Lw1z: SNo (w1 * z).
      { exact SNo_M w1 z Hw11 Hz. }
      claim Lyw2: SNo (y * w2).
      { exact SNo_M y w2 Hy Hw21. }
      claim Lw1zyw2: SNo (w1 * z + y * w2).
      { exact SNo_add_SNo (w1 * z) (y * w2) Lw1z Lyw2. }
      claim Lw1w2: SNo (w1 * w2).
      { exact SNo_M w1 w2 Hw11 Hw21. }
      claim Lww1w2: SNo (w + w1 * w2).
      { exact SNo_add_SNo w (w1 * w2) Lw Lw1w2. }
      apply L1 v (SNoL_SNoS x Hx v Hv) w Lw
               w1 (SNoR_SNoS y Hy w1 Hw1) w2 (SNoR_SNoS z Hz w2 Hw2)
               Hue.
      - prove v * (w1 * z + y * w2) + x * (w + w1 * w2) <= x * (w1 * z + y * w2) + v * (w + w1 * w2).
        apply M_Le x (w1 * z + y * w2) v (w + w1 * w2) Hx Lw1zyw2 Hv1 Lww1w2.
        + prove v <= x. apply SNoLtLe. exact Hv3.
        + prove w + w1 * w2 <= w1 * z + y * w2. exact Hwl.
      - prove (v * y + x * w1) * z + (x * y + v * w1) * w2 < (x * y + v * w1) * z + (v * y + x * w1) * w2.
        claim Lvyxw1: SNo (v * y + x * w1).
        { exact SNo_add_SNo (v * y) (x * w1) (SNo_M v y Hv1 Hy) (SNo_M x w1 Hx Hw11). }
        claim Lxyvw1: SNo (x * y + v * w1).
        { exact SNo_add_SNo (x * y) (v * w1) Lxy (SNo_M v w1 Hv1 Hw11). }
        claim Lvyxw1z: SNo ((v * y + x * w1) * z).
        { exact SNo_M (v * y + x * w1) z Lvyxw1 Hz. }
        claim Lxyvw1z: SNo ((x * y + v * w1) * z).
        { exact SNo_M (x * y + v * w1) z Lxyvw1 Hz. }
        claim Lvyxw1w2: SNo ((v * y + x * w1) * w2).
        { exact SNo_M (v * y + x * w1) w2 Lvyxw1 Hw21. }
        claim Lxyvw1w2: SNo ((x * y + v * w1) * w2).
        { exact SNo_M (x * y + v * w1) w2 Lxyvw1 Hw21. }
        rewrite add_SNo_com ((v * y + x * w1) * z)
                            ((x * y + v * w1) * w2)
                            Lvyxw1z Lxyvw1w2.
        rewrite add_SNo_com ((x * y + v * w1) * z)
                            ((v * y + x * w1) * w2)
                            Lxyvw1z Lvyxw1w2.
        prove (x * y + v * w1) * w2 + (v * y + x * w1) * z < (v * y + x * w1) * w2 + (x * y + v * w1) * z.
        apply M_Lt (v * y + x * w1) w2 (x * y + v * w1) z
                         Lvyxw1
                         Hw21
                         Lxyvw1
                         Hz.
        + prove x * y + v * w1 < v * y + x * w1.
          rewrite add_SNo_com (x * y) (v * w1) Lxy Lvw1.
          rewrite add_SNo_com (v * y) (x * w1) Lvy Lxw1.
          apply M_Lt x w1 v y Hx Hw11 Hv1 Hy.
          * prove v < x. exact Hv3.
          * prove y < w1. exact Hw13.
        + prove z < w2. exact Hw23.
    }
+ let v. assume Hv: v :e SNoR x.
  let w. assume Hw: w :e SNoR (y * z).
  assume Hue: u = v * (y * z) + x * w + - v * w.
  apply SNoR_E x Hx v Hv.
  assume Hv1 Hv2 Hv3.
  claim Lw: SNo w.
  { apply SNoR_E (y * z) Lyz w Hw. assume H _ _. exact H. }
  claim Lvw: SNo (v * w).
  { exact SNo_M v w Hv1 Lw. }
  apply IR y z Hy Hz w Hw.
  * { let w1. assume Hw1: w1 :e SNoL y.
      let w2. assume Hw2: w2 :e SNoR z.
      assume Hwl: w1 * z + y * w2 <= w + w1 * w2.
      apply SNoL_E y Hy w1 Hw1.
      assume Hw11 Hw12 Hw13.
      apply SNoR_E z Hz w2 Hw2.
      assume Hw21 Hw22 Hw23.
      claim Lvy: SNo (v * y).
      { exact SNo_M v y Hv1 Hy. }
      claim Lvw1: SNo (v * w1).
      { exact SNo_M v w1 Hv1 Hw11. }
      claim Lxw1: SNo (x * w1).
      { exact SNo_M x w1 Hx Hw11. }
      claim Lw1z: SNo (w1 * z).
      { exact SNo_M w1 z Hw11 Hz. }
      claim Lyw2: SNo (y * w2).
      { exact SNo_M y w2 Hy Hw21. }
      claim Lw1zyw2: SNo (w1 * z + y * w2).
      { exact SNo_add_SNo (w1 * z) (y * w2) Lw1z Lyw2. }
      claim Lw1w2: SNo (w1 * w2).
      { exact SNo_M w1 w2 Hw11 Hw21. }
      claim Lww1w2: SNo (w + w1 * w2).
      { exact SNo_add_SNo w (w1 * w2) Lw Lw1w2. }
      claim Lxww1w2: SNo (x * (w + w1 * w2)).
      { exact SNo_M x (w + w1 * w2) Hx Lww1w2. }
      claim Lvww1w2: SNo (v * (w + w1 * w2)).
      { exact SNo_M v (w + w1 * w2) Hv1 Lww1w2. }
      claim Lvw1w2: SNo (v * (w1 * w2)).
      { exact SNo_M v (w1 * w2) Hv1 Lw1w2. }
      claim Lvw1zyw2: SNo (v * (w1 * z + y * w2)).
      { exact SNo_M v (w1 * z + y * w2) Hv1 Lw1zyw2. }
      claim Lvwvw1w2: SNo (v * w + v * (w1 * w2)).
      { exact SNo_add_SNo (v * w) (v * (w1 * w2)) Lvw Lvw1w2. }
      claim Lxw1zyw2: SNo (x * (w1 * z + y * w2)).
      { exact SNo_M x (w1 * z + y * w2) Hx Lw1zyw2. }
      claim Lvyxw1: SNo (v * y + x * w1).
      { exact SNo_add_SNo (v * y) (x * w1) Lvy Lxw1. }
      claim Lxyvw1: SNo (x * y + v * w1).
      { exact SNo_add_SNo (x * y) (v * w1) Lxy Lvw1. }
      claim Lvyxw1z: SNo ((v * y + x * w1) * z).
      { exact SNo_M (v * y + x * w1) z Lvyxw1 Hz. }
      claim Lxyvw1z: SNo ((x * y + v * w1) * z).
      { exact SNo_M (x * y + v * w1) z Lxyvw1 Hz. }
      claim Lvyxw1w2: SNo ((v * y + x * w1) * w2).
      { exact SNo_M (v * y + x * w1) w2 Lvyxw1 Hw21. }
      claim Lxyvw1w2: SNo ((x * y + v * w1) * w2).
      { exact SNo_M (x * y + v * w1) w2 Lxyvw1 Hw21. }
      apply L1 v (SNoR_SNoS x Hx v Hv) w Lw
               w1 (SNoL_SNoS y Hy w1 Hw1) w2 (SNoR_SNoS z Hz w2 Hw2)
               Hue.
      - prove v * (w1 * z + y * w2) + x * (w + w1 * w2) <= x * (w1 * z + y * w2) + v * (w + w1 * w2).
        rewrite add_SNo_com (v * (w1 * z + y * w2)) (x * (w + w1 * w2)) Lvw1zyw2 Lxww1w2.
        prove x * (w + w1 * w2) + v * (w1 * z + y * w2) <= x * (w1 * z + y * w2) + v * (w + w1 * w2).
        rewrite add_SNo_com (x * (w1 * z + y * w2)) (v * (w + w1 * w2)) Lxw1zyw2 Lvww1w2.
        prove x * (w + w1 * w2) + v * (w1 * z + y * w2) <= v * (w + w1 * w2) + x * (w1 * z + y * w2).
        apply M_Le v (w + w1 * w2) x (w1 * z + y * w2) Hv1 Lww1w2 Hx Lw1zyw2.
        + prove x <= v. apply SNoLtLe. exact Hv3.
        + prove w1 * z + y * w2 <= w + w1 * w2. exact Hwl.
      - prove (v * y + x * w1) * z + (x * y + v * w1) * w2 < (x * y + v * w1) * z + (v * y + x * w1) * w2.
        rewrite add_SNo_com ((v * y + x * w1) * z) ((x * y + v * w1) * w2) Lvyxw1z Lxyvw1w2.
        rewrite add_SNo_com ((x * y + v * w1) * z) ((v * y + x * w1) * w2) Lxyvw1z Lvyxw1w2.
        prove (x * y + v * w1) * w2 + (v * y + x * w1) * z < (v * y + x * w1) * w2 + (x * y + v * w1) * z.
        apply M_Lt (v * y + x * w1) w2 (x * y + v * w1) z
                         Lvyxw1 Hw21 Lxyvw1 Hz.
        + prove x * y + v * w1 < v * y + x * w1.
          apply M_Lt v y x w1 Hv1 Hy Hx Hw11.
          * prove x < v. exact Hv3.
          * prove w1 < y. exact Hw13.
        + prove z < w2. exact Hw23.
    }
  * { let w1. assume Hw1: w1 :e SNoR y.
      let w2. assume Hw2: w2 :e SNoL z.
      assume Hwl: w1 * z + y * w2 <= w + w1 * w2.
      apply SNoR_E y Hy w1 Hw1.
      assume Hw11 Hw12 Hw13.
      apply SNoL_E z Hz w2 Hw2.
      assume Hw21 Hw22 Hw23.
      claim Lvy: SNo (v * y).
      { exact SNo_M v y Hv1 Hy. }
      claim Lvw1: SNo (v * w1).
      { exact SNo_M v w1 Hv1 Hw11. }
      claim Lxw1: SNo (x * w1).
      { exact SNo_M x w1 Hx Hw11. }
      claim Lw1z: SNo (w1 * z).
      { exact SNo_M w1 z Hw11 Hz. }
      claim Lyw2: SNo (y * w2).
      { exact SNo_M y w2 Hy Hw21. }
      claim Lw1zyw2: SNo (w1 * z + y * w2).
      { exact SNo_add_SNo (w1 * z) (y * w2) Lw1z Lyw2. }
      claim Lw1w2: SNo (w1 * w2).
      { exact SNo_M w1 w2 Hw11 Hw21. }
      claim Lww1w2: SNo (w + w1 * w2).
      { exact SNo_add_SNo w (w1 * w2) Lw Lw1w2. }
      claim Lxww1w2: SNo (x * (w + w1 * w2)).
      { exact SNo_M x (w + w1 * w2) Hx Lww1w2. }
      claim Lvww1w2: SNo (v * (w + w1 * w2)).
      { exact SNo_M v (w + w1 * w2) Hv1 Lww1w2. }
      claim Lvw1w2: SNo (v * (w1 * w2)).
      { exact SNo_M v (w1 * w2) Hv1 Lw1w2. }
      claim Lvw1zyw2: SNo (v * (w1 * z + y * w2)).
      { exact SNo_M v (w1 * z + y * w2) Hv1 Lw1zyw2. }
      claim Lvwvw1w2: SNo (v * w + v * (w1 * w2)).
      { exact SNo_add_SNo (v * w) (v * (w1 * w2)) Lvw Lvw1w2. }
      claim Lxw1zyw2: SNo (x * (w1 * z + y * w2)).
      { exact SNo_M x (w1 * z + y * w2) Hx Lw1zyw2. }
      claim Lvyxw1: SNo (v * y + x * w1).
      { exact SNo_add_SNo (v * y) (x * w1) Lvy Lxw1. }
      claim Lxyvw1: SNo (x * y + v * w1).
      { exact SNo_add_SNo (x * y) (v * w1) Lxy Lvw1. }
      claim Lvyxw1z: SNo ((v * y + x * w1) * z).
      { exact SNo_M (v * y + x * w1) z Lvyxw1 Hz. }
      claim Lxyvw1z: SNo ((x * y + v * w1) * z).
      { exact SNo_M (x * y + v * w1) z Lxyvw1 Hz. }
      claim Lvyxw1w2: SNo ((v * y + x * w1) * w2).
      { exact SNo_M (v * y + x * w1) w2 Lvyxw1 Hw21. }
      claim Lxyvw1w2: SNo ((x * y + v * w1) * w2).
      { exact SNo_M (x * y + v * w1) w2 Lxyvw1 Hw21. }
      apply L1 v (SNoR_SNoS x Hx v Hv) w Lw
               w1 (SNoR_SNoS y Hy w1 Hw1) w2 (SNoL_SNoS z Hz w2 Hw2)
               Hue.
      - prove v * (w1 * z + y * w2) + x * (w + w1 * w2) <= x * (w1 * z + y * w2) + v * (w + w1 * w2).
        rewrite add_SNo_com (v * (w1 * z + y * w2)) (x * (w + w1 * w2)) Lvw1zyw2 Lxww1w2.
        prove x * (w + w1 * w2) + v * (w1 * z + y * w2) <= x * (w1 * z + y * w2) + v * (w + w1 * w2).
        rewrite add_SNo_com (x * (w1 * z + y * w2)) (v * (w + w1 * w2)) Lxw1zyw2 Lvww1w2.
        prove x * (w + w1 * w2) + v * (w1 * z + y * w2) <= v * (w + w1 * w2) + x * (w1 * z + y * w2).
        apply M_Le v (w + w1 * w2) x (w1 * z + y * w2) Hv1 Lww1w2 Hx Lw1zyw2.
        + prove x <= v. apply SNoLtLe. exact Hv3.
        + prove w1 * z + y * w2 <= w + w1 * w2. exact Hwl.
      - prove (v * y + x * w1) * z + (x * y + v * w1) * w2 < (x * y + v * w1) * z + (v * y + x * w1) * w2.
        claim Lvyxw1: SNo (v * y + x * w1).
        { exact SNo_add_SNo (v * y) (x * w1) (SNo_M v y Hv1 Hy) (SNo_M x w1 Hx Hw11). }
        claim Lxyvw1: SNo (x * y + v * w1).
        { exact SNo_add_SNo (x * y) (v * w1) Lxy (SNo_M v w1 Hv1 Hw11). }
        apply M_Lt (x * y + v * w1) z (v * y + x * w1) w2
                         Lxyvw1 Hz
                         Lvyxw1 Hw21.
        + prove v * y + x * w1 < x * y + v * w1.
          rewrite add_SNo_com (x * y) (v * w1) Lxy Lvw1.
          rewrite add_SNo_com (v * y) (x * w1) Lvy Lxw1.
          prove x * w1 + v * y < v * w1 + x * y.
          apply M_Lt v w1 x y Hv1 Hw11 Hx Hy.
          * prove x < v. exact Hv3.
          * prove y < w1. exact Hw13.
        + prove w2 < z. exact Hw23.
    }
Qed.

Theorem mul_SNo_assoc_lem2 : forall x y z, SNo x -> SNo y -> SNo z
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
let x y z. assume Hx Hy Hz.
assume IHx IHy IHz IHxy IHxz IHyz IHxyz.
let R. assume HRE.
let u. assume Hu: u :e R.
prove (x * y) * z < u.
claim Lxy: SNo (x * y).
{ exact SNo_M x y Hx Hy. }
claim Lyz: SNo (y * z).
{ exact SNo_M y z Hy Hz. }
claim Lxyz2: SNo ((x * y) * z).
{ exact SNo_M (x * y) z Lxy Hz. }
claim L2: forall v :e SNoS_ (SNoLev x),
          forall w, SNo w ->
          forall w1 :e SNoS_ (SNoLev y),
          forall w2 :e SNoS_ (SNoLev z),
        u = v * (y * z) + x * w + - v * w
     -> x * (w1 * z + y * w2) + v * (w + w1 * w2) <= v * (w1 * z + y * w2) + x * (w + w1 * w2)
     -> (x * y + v * w1) * z + (v * y + x * w1) * w2 < (v * y + x * w1) * z + (x * y + v * w1) * w2
     -> (x * y) * z < u.
{ let v. assume Hv. let w. assume Hw. let w1. assume Hw1. let w2. assume Hw2.
  assume Hue H1 H2.
  apply SNoS_E2 (SNoLev x) (SNoLev_ordinal x Hx) v Hv.
  assume Hv1 Hv2 Hv3 Hv4.
  apply SNoS_E2 (SNoLev y) (SNoLev_ordinal y Hy) w1 Hw1.
  assume Hw11 Hw12 Hw13 Hw14.
  apply SNoS_E2 (SNoLev z) (SNoLev_ordinal z Hz) w2 Hw2.
  assume Hw21 Hw22 Hw23 Hw24.
  claim Lvyz: SNo (v * (y * z)).
  { exact SNo_M v (y * z) Hv3 Lyz. }
  claim Lxw: SNo (x * w).
  { exact SNo_M x w Hx Hw. }
  claim Lxw1: SNo (x * w1).
  { exact SNo_M x w1 Hx Hw13. }
  claim Lvw: SNo (v * w).
  { exact SNo_M v w Hv3 Hw. }
  claim Lvw1: SNo (v * w1).
  { exact SNo_M v w1 Hv3 Hw13. }
  claim Lvy: SNo (v * y).
  { exact SNo_M v y Hv3 Hy. }
  claim Lw1z: SNo (w1 * z).
  { exact SNo_M w1 z Hw13 Hz. }
  claim Lyw2: SNo (y * w2).
  { exact SNo_M y w2 Hy Hw23. }
  claim Lvw1z: SNo (v * (w1 * z)).
  { exact SNo_M v (w1 * z) Hv3 Lw1z. }
  claim Lvyw2: SNo (v * (y * w2)).
  { exact SNo_M v (y * w2) Hv3 Lyw2. }
  claim Lw1w2: SNo (w1 * w2).
  { exact SNo_M w1 w2 Hw13 Hw23. }
  claim Lxw1w2: SNo (x * (w1 * w2)).
  { exact SNo_M x (w1 * w2) Hx Lw1w2. }
  claim Lxw1z: SNo (x * (w1 * z)).
  { exact SNo_M x (w1 * z) Hx Lw1z. }
  claim Lxyw2: SNo (x * (y * w2)).
  { exact SNo_M x (y * w2) Hx Lyw2. }
  claim Lvyzxw: SNo (v * (y * z) + x * w).
  { exact SNo_add_SNo (v * (y * z)) (x * w) Lvyz Lxw. }
  claim Lxyzvw: SNo ((x * y) * z + v * w).
  { exact SNo_add_SNo ((x * y) * z) (v * w) Lxyz2 Lvw. }
  claim Lvw1w2: SNo (v * (w1 * w2)).
  { exact SNo_M v (w1 * w2) Hv3 Lw1w2. }
  claim Lww1w2: SNo (w + w1 * w2).
  { exact SNo_add_SNo w (w1 * w2) Hw Lw1w2. }
  claim Lvww1w2: SNo (v * (w + w1 * w2)).
  { exact SNo_M v (w + w1 * w2) Hv3 Lww1w2. }
  claim Lvw1zyw2: SNo (v * (w1 * z + y * w2)).
  { exact SNo_M v (w1 * z + y * w2) Hv3 (SNo_add_SNo (w1 * z) (y * w2) Lw1z Lyw2). }
  claim Lvwvw1w2: SNo (v * w + v * (w1 * w2)).
  { exact SNo_add_SNo (v * w) (v * (w1 * w2)) Lvw Lvw1w2. }
  claim Lvyzxw1zxyw2vwvw1w2: SNo (v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2)).
  { exact SNo_add_SNo_4 (v * (y * z)) (x * (w1 * z)) (x * (y * w2)) (v * w + v * (w1 * w2))
                        Lvyz Lxw1z Lxyw2 Lvwvw1w2.
  }
  claim Lvw1zvyw2xw1w2: SNo (v * (w1 * z) + v * (y * w2) + x * (w1 * w2)).
  { exact SNo_add_SNo_3 (v * (w1 * z)) (v * (y * w2)) (x * (w1 * w2)) Lvw1z Lvyw2 Lxw1w2. }
  rewrite Hue.
  apply add_SNo_minus_Lt2b3 (v * (y * z)) (x * w) (v * w) ((x * y) * z) Lvyz Lxw Lvw Lxyz2.
  prove (x * y) * z + v * w < v * (y * z) + x * w.
  apply add_SNo_Lt1_cancel ((x * y) * z + v * w)
                           (v * (w1 * z) + v * (y * w2) + x * (w1 * w2))
                           (v * (y * z) + x * w)
                           Lxyzvw
                           Lvw1zvyw2xw1w2
                           Lvyzxw.
  prove ((x * y) * z + v * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)
      < (v * (y * z) + x * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2).
  apply SNoLtLe_tra (((x * y) * z + v * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2))
                    (v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2))
                    ((v * (y * z) + x * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)).
  - apply SNo_add_SNo.
    + exact Lxyzvw.
    + exact Lvw1zvyw2xw1w2.
  - exact Lvyzxw1zxyw2vwvw1w2.
  - apply SNo_add_SNo.
    + exact Lvyzxw.
    + exact Lvw1zvyw2xw1w2.
  - prove ((x * y) * z + v * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)
        < v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2).
    rewrite add_SNo_com ((x * y) * z) (v * w) Lxyz2 Lvw.
    rewrite <- add_SNo_assoc (v * w) ((x * y) * z) (v * (w1 * z) + v * (y * w2) + x * (w1 * w2))
                             Lvw Lxyz2 Lvw1zvyw2xw1w2.
    prove v * w + (x * y) * z + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)
        < v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2).
    rewrite add_SNo_rotate_5_2 (v * (y * z)) (x * (w1 * z)) (x * (y * w2)) (v * w) (v * (w1 * w2))
                               Lvyz Lxw1z Lxyw2 Lvw Lvw1w2.
    prove v * w + (x * y) * z + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)
        < v * w + v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2).
    apply add_SNo_Lt2 (v * w)
                      ((x * y) * z + v * (w1 * z) + v * (y * w2) + x * (w1 * w2))
                      (v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2))
                      Lvw
                      (SNo_add_SNo_4 ((x * y) * z) (v * (w1 * z)) (v * (y * w2)) (x * (w1 * w2)) Lxyz2 Lvw1z Lvyw2 Lxw1w2)
                      (SNo_add_SNo_4 (v * (w1 * w2)) (v * (y * z)) (x * (w1 * z)) (x * (y * w2)) Lvw1w2 Lvyz Lxw1z Lxyw2).
    prove (x * y) * z + v * (w1 * z) + v * (y * w2) + x * (w1 * w2)
        < v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2).
    rewrite add_SNo_assoc ((x * y) * z) (v * (w1 * z)) (v * (y * w2) + x * (w1 * w2)) Lxyz2 Lvw1z (SNo_add_SNo (v * (y * w2)) (x * (w1 * w2)) Lvyw2 Lxw1w2).
    prove ((x * y) * z + v * (w1 * z)) + v * (y * w2) + x * (w1 * w2)
        < v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2).
    rewrite IHxz v Hv w2 Hw2. rewrite IHyz w1 Hw1 w2 Hw2.
    prove ((x * y) * z + v * (w1 * z)) + (v * y) * w2 + (x * w1) * w2
        < v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2).
    rewrite <- DR (v * y) (x * w1) w2 Lvy Lxw1 Hw23.
    prove ((x * y) * z + v * (w1 * z)) + (v * y + x * w1) * w2
        < v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2).
    rewrite IHxy v Hv w1 Hw1.
    rewrite <- DR (x * y) (v * w1) z Lxy Lvw1 Hz.
    prove (x * y + v * w1) * z + (v * y + x * w1) * w2
        < v * (w1 * w2) + v * (y * z) + x * (w1 * z) + x * (y * w2).
    rewrite <- add_SNo_rotate_4_1 (v * (y * z)) (x * (w1 * z)) (x * (y * w2)) (v * (w1 * w2)) Lvyz Lxw1z Lxyw2 Lvw1w2.
    prove (x * y + v * w1) * z + (v * y + x * w1) * w2
        < v * (y * z) + x * (w1 * z) + x * (y * w2) + v * (w1 * w2).
    rewrite add_SNo_assoc (v * (y * z)) (x * (w1 * z)) (x * (y * w2) + v * (w1 * w2))
                          Lvyz Lxw1z (SNo_add_SNo (x * (y * w2)) (v * (w1 * w2)) Lxyw2 Lvw1w2).
    prove (x * y + v * w1) * z + (v * y + x * w1) * w2
        < (v * (y * z) + x * (w1 * z)) + x * (y * w2) + v * (w1 * w2).
    rewrite IHx v Hv. rewrite IHy w1 Hw1. rewrite IHz w2 Hw2.
    rewrite IHxyz v Hv w1 Hw1 w2 Hw2.
    prove (x * y + v * w1) * z + (v * y + x * w1) * w2
        < ((v * y) * z + (x * w1) * z) + (x * y) * w2 + (v * w1) * w2.
    rewrite <- DR (v * y) (x * w1) z Lvy Lxw1 Hz.
    rewrite <- DR (x * y) (v * w1) w2 Lxy Lvw1 Hw23.
    prove (x * y + v * w1) * z + (v * y + x * w1) * w2
        < (v * y + x * w1) * z + (x * y + v * w1) * w2.
    exact H2.
  - prove v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2)
       <= (v * (y * z) + x * w) + v * (w1 * z) + v * (y * w2) + x * (w1 * w2).
    rewrite <- add_SNo_assoc (v * (y * z)) (x * w) (v * (w1 * z) + v * (y * w2) + x * (w1 * w2)) Lvyz Lxw Lvw1zvyw2xw1w2.
    prove v * (y * z) + x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2)
       <= v * (y * z) + x * w + v * (w1 * z) + v * (y * w2) + x * (w1 * w2).
    apply add_SNo_Le2 (v * (y * z))
                      (x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2))
                      (x * w + v * (w1 * z) + v * (y * w2) + x * (w1 * w2))
                      Lvyz
                      (SNo_add_SNo_4 (x * (w1 * z)) (x * (y * w2)) (v * w) (v * (w1 * w2)) Lxw1z Lxyw2 Lvw Lvw1w2)
                      (SNo_add_SNo (x * w) (v * (w1 * z) + v * (y * w2) + x * (w1 * w2)) Lxw Lvw1zvyw2xw1w2).
    prove x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2)
       <= x * w + v * (w1 * z) + v * (y * w2) + x * (w1 * w2).
    rewrite add_SNo_assoc (v * (w1 * z)) (v * (y * w2)) (x * (w1 * w2)) Lvw1z Lvyw2 Lxw1w2.
    rewrite <- DL v (w1 * z) (y * w2) Hv3 Lw1z Lyw2.
    prove x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2)
       <= x * w + v * (w1 * z + y * w2) + x * (w1 * w2).
    rewrite add_SNo_com_3_0_1 (x * w) (v * (w1 * z + y * w2)) (x * (w1 * w2))
                              Lxw Lvw1zyw2 Lxw1w2.
    prove x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2)
       <= v * (w1 * z + y * w2) + x * w + x * (w1 * w2).
    rewrite <- DL x w (w1 * w2) Hx Hw Lw1w2.
    prove x * (w1 * z) + x * (y * w2) + v * w + v * (w1 * w2)
       <= v * (w1 * z + y * w2) + x * (w + w1 * w2).
    rewrite <- DL v w (w1 * w2) Hv3 Hw Lw1w2.
    prove x * (w1 * z) + x * (y * w2) + v * (w + w1 * w2)
       <= v * (w1 * z + y * w2) + x * (w + w1 * w2).
    rewrite add_SNo_assoc (x * (w1 * z)) (x * (y * w2)) (v * (w + w1 * w2))
                          Lxw1z Lxyw2 Lvww1w2.
    rewrite <- DL x (w1 * z) (y * w2) Hx Lw1z Lyw2.
    prove x * (w1 * z + y * w2) + v * (w + w1 * w2)
       <= v * (w1 * z + y * w2) + x * (w + w1 * w2).
    exact H1.
}
apply HRE u Hu.
+ let v. assume Hv: v :e SNoL x.
  let w. assume Hw: w :e SNoR (y * z).
  assume Hue: u = v * (y * z) + x * w + - v * w.
  apply SNoL_E x Hx v Hv.
  assume Hv1 Hv2 Hv3.
  claim Lw: SNo w.
  { apply SNoR_E (y * z) Lyz w Hw. assume H _ _. exact H. }
  claim Lvw: SNo (v * w).
  { exact SNo_M v w Hv1 Lw. }
  claim Lvy: SNo (v * y).
  { exact SNo_M v y Hv1 Hy. }
  apply IR y z Hy Hz w Hw.
  * { let w1. assume Hw1: w1 :e SNoL y.
      let w2. assume Hw2: w2 :e SNoR z.
      assume Hwl: w1 * z + y * w2 <= w + w1 * w2.
      apply SNoL_E y Hy w1 Hw1.
      assume Hw11 Hw12 Hw13.
      apply SNoR_E z Hz w2 Hw2.
      assume Hw21 Hw22 Hw23.
      claim Lxw1: SNo (x * w1).
      { exact SNo_M x w1 Hx Hw11. }
      claim Lw1z: SNo (w1 * z).
      { exact SNo_M w1 z Hw11 Hz. }
      claim Lyw2: SNo (y * w2).
      { exact SNo_M y w2 Hy Hw21. }
      claim Lw1zyw2: SNo (w1 * z + y * w2).
      { exact SNo_add_SNo (w1 * z) (y * w2) Lw1z Lyw2. }
      claim Lw1w2: SNo (w1 * w2).
      { exact SNo_M w1 w2 Hw11 Hw21. }
      claim Lww1w2: SNo (w + w1 * w2).
      { exact SNo_add_SNo w (w1 * w2) Lw Lw1w2. }
      claim Lxww1w2: SNo (x * (w + w1 * w2)).
      { exact SNo_M x (w + w1 * w2) Hx Lww1w2. }
      claim Lvww1w2: SNo (v * (w + w1 * w2)).
      { exact SNo_M v (w + w1 * w2) Hv1 Lww1w2. }
      claim Lvw1w2: SNo (v * (w1 * w2)).
      { exact SNo_M v (w1 * w2) Hv1 Lw1w2. }
      claim Lvw1zyw2: SNo (v * (w1 * z + y * w2)).
      { exact SNo_M v (w1 * z + y * w2) Hv1 Lw1zyw2. }
      claim Lvwvw1w2: SNo (v * w + v * (w1 * w2)).
      { exact SNo_add_SNo (v * w) (v * (w1 * w2)) Lvw Lvw1w2. }
      claim Lxw1zyw2: SNo (x * (w1 * z + y * w2)).
      { exact SNo_M x (w1 * z + y * w2) Hx Lw1zyw2. }
      claim Lxyvw1: SNo (x * y + v * w1).
      { exact SNo_add_SNo (x * y) (v * w1) Lxy (SNo_M v w1 Hv1 Hw11). }
      claim Lvyxw1: SNo (v * y + x * w1).
      { exact SNo_add_SNo (v * y) (x * w1) Lvy Lxw1. }
      claim Lxyvw1z: SNo ((x * y + v * w1) * z).
      { exact SNo_M (x * y + v * w1) z Lxyvw1 Hz. }
      claim Lvyxw1z: SNo ((v * y + x * w1) * z).
      { exact SNo_M (v * y + x * w1) z Lvyxw1 Hz. }
      claim Lxyvw1: SNo (x * y + v * w1).
      { exact SNo_add_SNo (x * y) (v * w1) Lxy (SNo_M v w1 Hv1 Hw11). }
      claim Lxyvw1w2: SNo ((x * y + v * w1) * w2).
      { exact SNo_M (x * y + v * w1) w2 Lxyvw1 Hw21. }
      claim Lvyxw1w2: SNo ((v * y + x * w1) * w2).
      { exact SNo_M (v * y + x * w1) w2 Lvyxw1 Hw21. }
      apply L2 v (SNoL_SNoS x Hx v Hv) w Lw
               w1 (SNoL_SNoS y Hy w1 Hw1) w2 (SNoR_SNoS z Hz w2 Hw2)
               Hue.
      - prove x * (w1 * z + y * w2) + v * (w + w1 * w2) <= v * (w1 * z + y * w2) + x * (w + w1 * w2).
        rewrite add_SNo_com (v * (w1 * z + y * w2)) (x * (w + w1 * w2)) Lvw1zyw2 Lxww1w2.
        rewrite add_SNo_com (x * (w1 * z + y * w2)) (v * (w + w1 * w2)) Lxw1zyw2 Lvww1w2.
        prove v * (w + w1 * w2) + x * (w1 * z + y * w2) <= x * (w + w1 * w2) + v * (w1 * z + y * w2).
        apply M_Le x (w + w1 * w2) v (w1 * z + y * w2) Hx Lww1w2 Hv1 Lw1zyw2.
        + prove v <= x. apply SNoLtLe. exact Hv3.
        + exact Hwl.
      - prove (x * y + v * w1) * z + (v * y + x * w1) * w2 < (v * y + x * w1) * z + (x * y + v * w1) * w2.
        rewrite add_SNo_com ((v * y + x * w1) * z) ((x * y + v * w1) * w2) Lvyxw1z Lxyvw1w2.
        rewrite add_SNo_com ((x * y + v * w1) * z) ((v * y + x * w1) * w2) Lxyvw1z Lvyxw1w2.
        prove (v * y + x * w1) * w2 + (x * y + v * w1) * z < (x * y + v * w1) * w2 + (v * y + x * w1) * z.
        apply M_Lt (x * y + v * w1) w2 (v * y + x * w1) z
                         (SNo_add_SNo (x * y) (v * w1) Lxy (SNo_M v w1 Hv1 Hw11))
                         Hw21
                         (SNo_add_SNo (v * y) (x * w1) (SNo_M v y Hv1 Hy) (SNo_M x w1 Hx Hw11))
                         Hz.
        + prove v * y + x * w1 < x * y + v * w1.
          apply M_Lt x y v w1 Hx Hy Hv1 Hw11.
          * prove v < x. exact Hv3.
          * prove w1 < y. exact Hw13.
        + prove z < w2. exact Hw23.
    }
  * { let w1. assume Hw1: w1 :e SNoR y.
      let w2. assume Hw2: w2 :e SNoL z.
      assume Hwl: w1 * z + y * w2 <= w + w1 * w2.
      apply SNoR_E y Hy w1 Hw1.
      assume Hw11 Hw12 Hw13.
      apply SNoL_E z Hz w2 Hw2.
      assume Hw21 Hw22 Hw23.
      claim Lvy: SNo (v * y).
      { exact SNo_M v y Hv1 Hy. }
      claim Lvw1: SNo (v * w1).
      { exact SNo_M v w1 Hv1 Hw11. }
      claim Lxw1: SNo (x * w1).
      { exact SNo_M x w1 Hx Hw11. }
      claim Lw1z: SNo (w1 * z).
      { exact SNo_M w1 z Hw11 Hz. }
      claim Lyw2: SNo (y * w2).
      { exact SNo_M y w2 Hy Hw21. }
      claim Lw1zyw2: SNo (w1 * z + y * w2).
      { exact SNo_add_SNo (w1 * z) (y * w2) Lw1z Lyw2. }
      claim Lw1w2: SNo (w1 * w2).
      { exact SNo_M w1 w2 Hw11 Hw21. }
      claim Lww1w2: SNo (w + w1 * w2).
      { exact SNo_add_SNo w (w1 * w2) Lw Lw1w2. }
      claim Lvww1w2: SNo (v * (w + w1 * w2)).
      { exact SNo_M v (w + w1 * w2) Hv1 Lww1w2. }
      claim Lvw1zyw2: SNo (v * (w1 * z + y * w2)).
      { exact SNo_M v (w1 * z + y * w2) Hv1 Lw1zyw2. }
      claim Lxww1w2: SNo (x * (w + w1 * w2)).
      { exact SNo_M x (w + w1 * w2) Hx Lww1w2. }
      claim Lxw1zyw2: SNo (x * (w1 * z + y * w2)).
      { exact SNo_M x (w1 * z + y * w2) Hx Lw1zyw2. }
      apply L2 v (SNoL_SNoS x Hx v Hv) w Lw
               w1 (SNoR_SNoS y Hy w1 Hw1) w2 (SNoL_SNoS z Hz w2 Hw2)
               Hue.
      - prove x * (w1 * z + y * w2) + v * (w + w1 * w2) <= v * (w1 * z + y * w2) + x * (w + w1 * w2).
        rewrite add_SNo_com (v * (w1 * z + y * w2)) (x * (w + w1 * w2)) Lvw1zyw2 Lxww1w2.
        rewrite add_SNo_com (x * (w1 * z + y * w2)) (v * (w + w1 * w2)) Lxw1zyw2 Lvww1w2.
        apply M_Le x (w + w1 * w2) v (w1 * z + y * w2) Hx Lww1w2 Hv1 Lw1zyw2.
        + prove v <= x. apply SNoLtLe. exact Hv3.
        + exact Hwl.
      - prove (x * y + v * w1) * z + (v * y + x * w1) * w2 < (v * y + x * w1) * z + (x * y + v * w1) * w2.
        claim Lvyxw1: SNo (v * y + x * w1).
        { exact SNo_add_SNo (v * y) (x * w1) (SNo_M v y Hv1 Hy) (SNo_M x w1 Hx Hw11). }
        claim Lxyvw1: SNo (x * y + v * w1).
        { exact SNo_add_SNo (x * y) (v * w1) Lxy (SNo_M v w1 Hv1 Hw11). }
        apply M_Lt (v * y + x * w1) z (x * y + v * w1) w2
                         Lvyxw1
                         Hz
                         Lxyvw1
                         Hw21.
        + prove x * y + v * w1 < v * y + x * w1.
          rewrite add_SNo_com (x * y) (v * w1) Lxy Lvw1.
          rewrite add_SNo_com (v * y) (x * w1) Lvy Lxw1.
          apply M_Lt x w1 v y Hx Hw11 Hv1 Hy.
          * prove v < x. exact Hv3.
          * prove y < w1. exact Hw13.
        + prove w2 < z. exact Hw23.
    }
+ let v. assume Hv: v :e SNoR x.
  let w. assume Hw: w :e SNoL (y * z).
  assume Hue: u = v * (y * z) + x * w + - v * w.
  apply SNoR_E x Hx v Hv.
  assume Hv1 Hv2 Hv3.
  claim Lw: SNo w.
  { apply SNoL_E (y * z) Lyz w Hw. assume H _ _. exact H. }
  claim Lvw: SNo (v * w).
  { exact SNo_M v w Hv1 Lw. }
  apply IL y z Hy Hz w Hw.
  * { let w1. assume Hw1: w1 :e SNoL y.
      let w2. assume Hw2: w2 :e SNoL z.
      assume Hwl: w + w1 * w2 <= w1 * z + y * w2.
      apply SNoL_E y Hy w1 Hw1.
      assume Hw11 Hw12 Hw13.
      apply SNoL_E z Hz w2 Hw2.
      assume Hw21 Hw22 Hw23.
      claim Lvy: SNo (v * y).
      { exact SNo_M v y Hv1 Hy. }
      claim Lvw1: SNo (v * w1).
      { exact SNo_M v w1 Hv1 Hw11. }
      claim Lxw1: SNo (x * w1).
      { exact SNo_M x w1 Hx Hw11. }
      claim Lw1z: SNo (w1 * z).
      { exact SNo_M w1 z Hw11 Hz. }
      claim Lyw2: SNo (y * w2).
      { exact SNo_M y w2 Hy Hw21. }
      claim Lw1zyw2: SNo (w1 * z + y * w2).
      { exact SNo_add_SNo (w1 * z) (y * w2) Lw1z Lyw2. }
      claim Lw1w2: SNo (w1 * w2).
      { exact SNo_M w1 w2 Hw11 Hw21. }
      claim Lww1w2: SNo (w + w1 * w2).
      { exact SNo_add_SNo w (w1 * w2) Lw Lw1w2. }
      claim Lxww1w2: SNo (x * (w + w1 * w2)).
      { exact SNo_M x (w + w1 * w2) Hx Lww1w2. }
      claim Lvww1w2: SNo (v * (w + w1 * w2)).
      { exact SNo_M v (w + w1 * w2) Hv1 Lww1w2. }
      claim Lvw1w2: SNo (v * (w1 * w2)).
      { exact SNo_M v (w1 * w2) Hv1 Lw1w2. }
      claim Lvw1zyw2: SNo (v * (w1 * z + y * w2)).
      { exact SNo_M v (w1 * z + y * w2) Hv1 Lw1zyw2. }
      claim Lvwvw1w2: SNo (v * w + v * (w1 * w2)).
      { exact SNo_add_SNo (v * w) (v * (w1 * w2)) Lvw Lvw1w2. }
      claim Lxw1zyw2: SNo (x * (w1 * z + y * w2)).
      { exact SNo_M x (w1 * z + y * w2) Hx Lw1zyw2. }
      claim Lvyxw1: SNo (v * y + x * w1).
      { exact SNo_add_SNo (v * y) (x * w1) Lvy Lxw1. }
      claim Lxyvw1: SNo (x * y + v * w1).
      { exact SNo_add_SNo (x * y) (v * w1) Lxy Lvw1. }
      claim Lvyxw1z: SNo ((v * y + x * w1) * z).
      { exact SNo_M (v * y + x * w1) z Lvyxw1 Hz. }
      claim Lxyvw1z: SNo ((x * y + v * w1) * z).
      { exact SNo_M (x * y + v * w1) z Lxyvw1 Hz. }
      claim Lvyxw1w2: SNo ((v * y + x * w1) * w2).
      { exact SNo_M (v * y + x * w1) w2 Lvyxw1 Hw21. }
      claim Lxyvw1w2: SNo ((x * y + v * w1) * w2).
      { exact SNo_M (x * y + v * w1) w2 Lxyvw1 Hw21. }
      apply L2 v (SNoR_SNoS x Hx v Hv) w Lw
               w1 (SNoL_SNoS y Hy w1 Hw1) w2 (SNoL_SNoS z Hz w2 Hw2)
               Hue.
      - prove x * (w1 * z + y * w2) + v * (w + w1 * w2) <= v * (w1 * z + y * w2) + x * (w + w1 * w2).
        apply M_Le v (w1 * z + y * w2) x (w + w1 * w2) Hv1 Lw1zyw2 Hx Lww1w2.
        + prove x <= v. apply SNoLtLe. exact Hv3.
        + exact Hwl.
      - prove (x * y + v * w1) * z + (v * y + x * w1) * w2 < (v * y + x * w1) * z + (x * y + v * w1) * w2.
        apply M_Lt (v * y + x * w1) z (x * y + v * w1) w2
                         Lvyxw1 Hz Lxyvw1 Hw21.
        + prove x * y + v * w1 < v * y + x * w1.
          apply M_Lt v y x w1 Hv1 Hy Hx Hw11.
          * prove x < v. exact Hv3.
          * prove w1 < y. exact Hw13.
        + exact Hw23.
    }
  * { let w1. assume Hw1: w1 :e SNoR y.
      let w2. assume Hw2: w2 :e SNoR z.
      assume Hwl: w + w1 * w2 <= w1 * z + y * w2.
      apply SNoR_E y Hy w1 Hw1.
      assume Hw11 Hw12 Hw13.
      apply SNoR_E z Hz w2 Hw2.
      assume Hw21 Hw22 Hw23.
      claim Lvy: SNo (v * y).
      { exact SNo_M v y Hv1 Hy. }
      claim Lvw1: SNo (v * w1).
      { exact SNo_M v w1 Hv1 Hw11. }
      claim Lxw1: SNo (x * w1).
      { exact SNo_M x w1 Hx Hw11. }
      claim Lw1z: SNo (w1 * z).
      { exact SNo_M w1 z Hw11 Hz. }
      claim Lyw2: SNo (y * w2).
      { exact SNo_M y w2 Hy Hw21. }
      claim Lw1zyw2: SNo (w1 * z + y * w2).
      { exact SNo_add_SNo (w1 * z) (y * w2) Lw1z Lyw2. }
      claim Lw1w2: SNo (w1 * w2).
      { exact SNo_M w1 w2 Hw11 Hw21. }
      claim Lww1w2: SNo (w + w1 * w2).
      { exact SNo_add_SNo w (w1 * w2) Lw Lw1w2. }
      claim Lxww1w2: SNo (x * (w + w1 * w2)).
      { exact SNo_M x (w + w1 * w2) Hx Lww1w2. }
      claim Lvww1w2: SNo (v * (w + w1 * w2)).
      { exact SNo_M v (w + w1 * w2) Hv1 Lww1w2. }
      claim Lvw1w2: SNo (v * (w1 * w2)).
      { exact SNo_M v (w1 * w2) Hv1 Lw1w2. }
      claim Lvw1zyw2: SNo (v * (w1 * z + y * w2)).
      { exact SNo_M v (w1 * z + y * w2) Hv1 Lw1zyw2. }
      claim Lvwvw1w2: SNo (v * w + v * (w1 * w2)).
      { exact SNo_add_SNo (v * w) (v * (w1 * w2)) Lvw Lvw1w2. }
      claim Lxw1zyw2: SNo (x * (w1 * z + y * w2)).
      { exact SNo_M x (w1 * z + y * w2) Hx Lw1zyw2. }
      claim Lvyxw1: SNo (v * y + x * w1).
      { exact SNo_add_SNo (v * y) (x * w1) Lvy Lxw1. }
      claim Lxyvw1: SNo (x * y + v * w1).
      { exact SNo_add_SNo (x * y) (v * w1) Lxy Lvw1. }
      claim Lvyxw1z: SNo ((v * y + x * w1) * z).
      { exact SNo_M (v * y + x * w1) z Lvyxw1 Hz. }
      claim Lxyvw1z: SNo ((x * y + v * w1) * z).
      { exact SNo_M (x * y + v * w1) z Lxyvw1 Hz. }
      claim Lvyxw1w2: SNo ((v * y + x * w1) * w2).
      { exact SNo_M (v * y + x * w1) w2 Lvyxw1 Hw21. }
      claim Lxyvw1w2: SNo ((x * y + v * w1) * w2).
      { exact SNo_M (x * y + v * w1) w2 Lxyvw1 Hw21. }
      apply L2 v (SNoR_SNoS x Hx v Hv) w Lw
               w1 (SNoR_SNoS y Hy w1 Hw1) w2 (SNoR_SNoS z Hz w2 Hw2)
               Hue.
      - prove x * (w1 * z + y * w2) + v * (w + w1 * w2) <= v * (w1 * z + y * w2) + x * (w + w1 * w2).
        apply M_Le v (w1 * z + y * w2) x (w + w1 * w2) Hv1 Lw1zyw2 Hx Lww1w2.
        + prove x <= v. apply SNoLtLe. exact Hv3.
        + exact Hwl.
      - prove (x * y + v * w1) * z + (v * y + x * w1) * w2 < (v * y + x * w1) * z + (x * y + v * w1) * w2.
        claim Lvyxw1: SNo (v * y + x * w1).
        { exact SNo_add_SNo (v * y) (x * w1) (SNo_M v y Hv1 Hy) (SNo_M x w1 Hx Hw11). }
        claim Lxyvw1: SNo (x * y + v * w1).
        { exact SNo_add_SNo (x * y) (v * w1) Lxy (SNo_M v w1 Hv1 Hw11). }
        rewrite add_SNo_com ((v * y + x * w1) * z) ((x * y + v * w1) * w2) Lvyxw1z Lxyvw1w2.
        rewrite add_SNo_com ((x * y + v * w1) * z) ((v * y + x * w1) * w2) Lxyvw1z Lvyxw1w2.
        prove (v * y + x * w1) * w2 + (x * y + v * w1) * z < (x * y + v * w1) * w2 + (v * y + x * w1) * z.
        apply M_Lt (x * y + v * w1) w2 (v * y + x * w1) z
                         Lxyvw1 Hw21
                         Lvyxw1 Hz.
        + prove v * y + x * w1 < x * y + v * w1.
          rewrite add_SNo_com (x * y) (v * w1) Lxy Lvw1.
          rewrite add_SNo_com (v * y) (x * w1) Lvy Lxw1.
          prove x * w1 + v * y < v * w1 + x * y.
          apply M_Lt v w1 x y Hv1 Hw11 Hx Hy.
          * prove x < v. exact Hv3.
          * prove y < w1. exact Hw13.
        + exact Hw23.
    }
Qed.

End mul_SNo_assoc_lems.

Theorem mul_SNo_assoc : forall x y z, SNo x -> SNo y -> SNo z
  -> x * (y * z) = (x * y) * z.
set P : set -> set -> set -> prop := fun x y z => x * (y * z) = (x * y) * z.
prove forall x y z, SNo x -> SNo y -> SNo z -> P x y z.
apply SNoLev_ind3 P.
let x y z. assume Hx Hy Hz.
assume IHx: forall u :e SNoS_ (SNoLev x), u * (y * z) = (u * y) * z.
assume IHy: forall v :e SNoS_ (SNoLev y), x * (v * z) = (x * v) * z.
assume IHz: forall w :e SNoS_ (SNoLev z), x * (y * w) = (x * y) * w.
assume IHxy: forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), u * (v * z) = (u * v) * z.
assume IHxz: forall u :e SNoS_ (SNoLev x), forall w :e SNoS_ (SNoLev z), u * (y * w) = (u * y) * w.
assume IHyz: forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), x * (v * w) = (x * v) * w.
assume IHxyz: forall u :e SNoS_ (SNoLev x), forall v :e SNoS_ (SNoLev y), forall w :e SNoS_ (SNoLev z), u * (v * w) = (u * v) * w.
prove x * (y * z) = (x * y) * z.
claim Lxy: SNo (x * y).
{ exact SNo_mul_SNo x y Hx Hy. }
claim Lyz: SNo (y * z).
{ exact SNo_mul_SNo y z Hy Hz. }
claim Lxyz1: SNo (x * (y * z)).
{ exact SNo_mul_SNo x (y * z) Hx Lyz. }
claim Lxyz2: SNo ((x * y) * z).
{ exact SNo_mul_SNo (x * y) z Lxy Hz. }
apply mul_SNo_eq_3 x (y * z) Hx Lyz.
let L R. assume HLR HLE HLI1 HLI2 HRE HRI1 HRI2.
assume HE: x * (y * z) = SNoCut L R.
apply mul_SNo_eq_3 (x * y) z Lxy Hz.
let L' R'. assume HLR' HLE' HLI1' HLI2' HRE' HRI1' HRI2'.
assume HE': (x * y) * z = SNoCut L' R'.
rewrite HE. rewrite HE'.
prove SNoCut L R = SNoCut L' R'.
claim LIL': forall x y, SNo x -> SNo y -> forall u :e SNoL (y * x),
  forall p:prop,
      (forall v :e SNoL x, forall w :e SNoL y, u + w * v <= y * v + w * x -> p)
   -> (forall v :e SNoR x, forall w :e SNoR y, u + w * v <= y * v + w * x -> p)
   -> p.
{ let x y. assume Hx Hy. let u. assume Hu.
  let p. assume Hp1 Hp2.
  apply mul_SNo_SNoL_interpolate_impred y x Hy Hx u Hu.
  - let w. assume Hw: w :e SNoL y. let v. assume Hv: v :e SNoL x.
    apply SNoL_E y Hy w Hw.
    assume Hw1 _ _.
    apply SNoL_E x Hx v Hv.
    assume Hv1 _ _.
    prove u + w * v <= w * x + y * v -> p.
    rewrite add_SNo_com (w * x) (y * v)
                        (SNo_mul_SNo w x Hw1 Hx)
                        (SNo_mul_SNo y v Hy Hv1).
    exact Hp1 v Hv w Hw.
  - let w. assume Hw: w :e SNoR y. let v. assume Hv: v :e SNoR x.
    apply SNoR_E y Hy w Hw.
    assume Hw1 _ _.
    apply SNoR_E x Hx v Hv.
    assume Hv1 _ _.
    prove u + w * v <= w * x + y * v -> p.
    rewrite add_SNo_com (w * x) (y * v)
                        (SNo_mul_SNo w x Hw1 Hx)
                        (SNo_mul_SNo y v Hy Hv1).
    exact Hp2 v Hv w Hw.
}
claim LIR': forall x y, SNo x -> SNo y -> forall u :e SNoR (y * x),
  forall p:prop,
      (forall v :e SNoL x, forall w :e SNoR y, y * v + w * x <= u + w * v -> p)
   -> (forall v :e SNoR x, forall w :e SNoL y, y * v + w * x <= u + w * v -> p)
   -> p.
{ let x y. assume Hx Hy. let u. assume Hu.
  let p. assume Hp1 Hp2.
  apply mul_SNo_SNoR_interpolate_impred y x Hy Hx u Hu.
  - let w. assume Hw: w :e SNoL y. let v. assume Hv: v :e SNoR x.
    apply SNoL_E y Hy w Hw.
    assume Hw1 _ _.
    apply SNoR_E x Hx v Hv.
    assume Hv1 _ _.
    rewrite add_SNo_com (w * x) (y * v)
                        (SNo_mul_SNo w x Hw1 Hx)
                        (SNo_mul_SNo y v Hy Hv1).
    exact Hp2 v Hv w Hw.
  - let w. assume Hw: w :e SNoR y. let v. assume Hv: v :e SNoL x.
    apply SNoR_E y Hy w Hw.
    assume Hw1 _ _.
    apply SNoL_E x Hx v Hv.
    assume Hv1 _ _.
    rewrite add_SNo_com (w * x) (y * v)
                        (SNo_mul_SNo w x Hw1 Hx)
                        (SNo_mul_SNo y v Hy Hv1).
    exact Hp1 v Hv w Hw.
}
claim LMLt': forall x y u v, SNo x -> SNo y -> SNo u -> SNo v
      -> u < x -> v < y -> y * u + v * x < y * x + v * u.
{ let x y u v. assume Hx Hy Hu Hv Hux Hvy.
  rewrite add_SNo_com (y * u) (v * x) (SNo_mul_SNo y u Hy Hu) (SNo_mul_SNo v x Hv Hx).
  prove v * x + y * u < y * x + v * u.
  exact mul_SNo_Lt y x v u Hy Hx Hv Hu Hvy Hux.
}
claim LMLe': forall x y u v, SNo x -> SNo y -> SNo u -> SNo v
      -> u <= x -> v <= y -> y * u + v * x <= y * x + v * u.
{ let x y u v. assume Hx Hy Hu Hv Hux Hvy.
  rewrite add_SNo_com (y * u) (v * x) (SNo_mul_SNo y u Hy Hu) (SNo_mul_SNo v x Hv Hx).
  prove v * x + y * u <= y * x + v * u.
  exact mul_SNo_Le y x v u Hy Hx Hv Hu Hvy Hux.
}
claim LIHx': forall u :e SNoS_ (SNoLev x), (u * y) * z = u * (y * z).
{ let u. assume Hu. symmetry. exact IHx u Hu. }
claim LIHy': forall v :e SNoS_ (SNoLev y), (x * v) * z = x * (v * z).
{ let v. assume Hv. symmetry. exact IHy v Hv. }
claim LIHz': forall w :e SNoS_ (SNoLev z), (x * y) * w = x * (y * w).
{ let w. assume Hw. symmetry. exact IHz w Hw. }
claim LIHyx': forall v :e SNoS_ (SNoLev y), forall u :e SNoS_ (SNoLev x), (u * v) * z = u * (v * z).
{ let v. assume Hv. let u. assume Hu. symmetry.
  exact IHxy u Hu v Hv.
}
claim LIHzx': forall w :e SNoS_ (SNoLev z), forall u :e SNoS_ (SNoLev x), (u * y) * w = u * (y * w).
{ let w. assume Hw. let u. assume Hu. symmetry.
  exact IHxz u Hu w Hw.
}
claim LIHzy': forall w :e SNoS_ (SNoLev z), forall v :e SNoS_ (SNoLev y), (x * v) * w = x * (v * w).
{ let w. assume Hw. let v. assume Hv. symmetry.
  exact IHyz v Hv w Hw.
}
claim LIHzyx': forall w :e SNoS_ (SNoLev z), forall v :e SNoS_ (SNoLev y), forall u :e SNoS_ (SNoLev x), (u * v) * w = u * (v * w).
{ let w. assume Hw. let v. assume Hv. let u. assume Hu. symmetry.
  exact IHxyz u Hu v Hv w Hw.
}
apply SNoCut_ext.
- exact HLR.
- exact HLR'.
- rewrite <- HE'.
  prove forall u :e L, u < (x * y) * z.
  exact mul_SNo_assoc_lem1 mul_SNo SNo_mul_SNo mul_SNo_distrL mul_SNo_distrR
            mul_SNo_SNoL_interpolate_impred
            mul_SNo_SNoR_interpolate_impred
            mul_SNo_Lt mul_SNo_Le
            x y z Hx Hy Hz
            IHx IHy IHz IHxy IHxz IHyz IHxyz L HLE.
- rewrite <- HE'.
  prove forall u :e R, (x * y) * z < u.
  exact mul_SNo_assoc_lem2 mul_SNo SNo_mul_SNo mul_SNo_distrL mul_SNo_distrR
            mul_SNo_SNoL_interpolate_impred
            mul_SNo_SNoR_interpolate_impred
            mul_SNo_Lt mul_SNo_Le
            x y z Hx Hy Hz
            IHx IHy IHz IHxy IHxz IHyz IHxyz R HRE.
- rewrite <- HE.
  prove forall u :e L', u < x * (y * z).
  apply mul_SNo_assoc_lem1 (fun x y => y * x)
     (fun x y Hx Hy => SNo_mul_SNo y x Hy Hx)
     (fun x y z Hx Hy Hz => mul_SNo_distrR y z x Hy Hz Hx)
     (fun x y z Hx Hy Hz => mul_SNo_distrL z x y Hz Hx Hy)
     LIL' LIR' LMLt' LMLe'
     z y x Hz Hy Hx LIHz' LIHy' LIHx' LIHzy' LIHzx' LIHyx' LIHzyx'.
  prove forall u :e L',
     forall q:prop,
         (forall v :e SNoL z, forall w :e SNoL (x * y), u = (x * y) * v + w * z + - w * v -> q)
      -> (forall v :e SNoR z, forall w :e SNoR (x * y), u = (x * y) * v + w * z + - w * v -> q)
      -> q.
  let u. assume Hu. let q. assume Hq1 Hq2. apply HLE' u Hu.
  * let w. assume Hw. let v. assume Hv.
    apply SNoL_E (x * y) Lxy w Hw.
    assume Hw1 _ _.
    apply SNoL_E z Hz v Hv.
    assume Hv1 _ _.
    prove u = w * z + (x * y) * v + - w * v -> q.
    rewrite add_SNo_com_3_0_1 (w * z) ((x * y) * v) (- w * v)
                              (SNo_mul_SNo w z Hw1 Hz)
                              (SNo_mul_SNo (x * y) v Lxy Hv1)
                              (SNo_minus_SNo (w * v) (SNo_mul_SNo w v Hw1 Hv1)).
    exact Hq1 v Hv w Hw.
  * let w. assume Hw. let v. assume Hv.
    apply SNoR_E (x * y) Lxy w Hw.
    assume Hw1 _ _.
    apply SNoR_E z Hz v Hv.
    assume Hv1 _ _.
    prove u = w * z + (x * y) * v + - w * v -> q.
    rewrite add_SNo_com_3_0_1 (w * z) ((x * y) * v) (- w * v)
                              (SNo_mul_SNo w z Hw1 Hz)
                              (SNo_mul_SNo (x * y) v Lxy Hv1)
                              (SNo_minus_SNo (w * v) (SNo_mul_SNo w v Hw1 Hv1)).
    exact Hq2 v Hv w Hw.
- rewrite <- HE.
  prove forall u :e R', x * (y * z) < u.
  apply mul_SNo_assoc_lem2 (fun x y => y * x)
     (fun x y Hx Hy => SNo_mul_SNo y x Hy Hx)
     (fun x y z Hx Hy Hz => mul_SNo_distrR y z x Hy Hz Hx)
     (fun x y z Hx Hy Hz => mul_SNo_distrL z x y Hz Hx Hy)
     LIL' LIR' LMLt' LMLe'
     z y x Hz Hy Hx LIHz' LIHy' LIHx' LIHzy' LIHzx' LIHyx' LIHzyx'.
  prove forall u :e R',
     forall q:prop,
         (forall v :e SNoL z, forall w :e SNoR (x * y), u = (x * y) * v + w * z + - w * v -> q)
      -> (forall v :e SNoR z, forall w :e SNoL (x * y), u = (x * y) * v + w * z + - w * v -> q)
      -> q.
  let u. assume Hu. let q. assume Hq1 Hq2. apply HRE' u Hu.
  * let w. assume Hw. let v. assume Hv.
    apply SNoL_E (x * y) Lxy w Hw.
    assume Hw1 _ _.
    apply SNoR_E z Hz v Hv.
    assume Hv1 _ _.
    prove u = w * z + (x * y) * v + - w * v -> q.
    rewrite add_SNo_com_3_0_1 (w * z) ((x * y) * v) (- w * v)
                              (SNo_mul_SNo w z Hw1 Hz)
                              (SNo_mul_SNo (x * y) v Lxy Hv1)
                              (SNo_minus_SNo (w * v) (SNo_mul_SNo w v Hw1 Hv1)).
    exact Hq2 v Hv w Hw.
  * let w. assume Hw. let v. assume Hv.
    apply SNoR_E (x * y) Lxy w Hw.
    assume Hw1 _ _.
    apply SNoL_E z Hz v Hv.
    assume Hv1 _ _.
    prove u = w * z + (x * y) * v + - w * v -> q.
    rewrite add_SNo_com_3_0_1 (w * z) ((x * y) * v) (- w * v)
                              (SNo_mul_SNo w z Hw1 Hz)
                              (SNo_mul_SNo (x * y) v Lxy Hv1)
                              (SNo_minus_SNo (w * v) (SNo_mul_SNo w v Hw1 Hv1)).
    exact Hq1 v Hv w Hw.
Qed.

Theorem mul_nat_mul_SNo : forall n m :e omega, mul_nat n m = n * m.
let n. assume Hn: n :e omega.
claim Ln1: nat_p n.
{ exact omega_nat_p n Hn. }
claim Ln2: ordinal n.
{ exact nat_p_ordinal n Ln1. }
claim Ln3: SNo n.
{ exact ordinal_SNo n Ln2. }
claim L1: forall m, nat_p m -> mul_nat n m = n * m.
{ apply nat_ind.
  - prove mul_nat n 0 = n * 0.
    rewrite mul_SNo_zeroR n Ln3.
    prove mul_nat n 0 = 0.
    exact mul_nat_0R n.
  - let m.
    assume Hm: nat_p m.
    assume IH: mul_nat n m = n * m.
    prove mul_nat n (ordsucc m) = n * (ordsucc m).
    transitivity add_nat n (mul_nat n m),
                 n + (mul_nat n m),
                 n + (n * m).
    + exact mul_nat_SR n m Hm.
    + exact add_nat_add_SNo n Hn (mul_nat n m) (nat_p_omega (mul_nat n m) (mul_nat_p n Ln1 m Hm)).
    + f_equal. exact IH.
    + prove n + n * m = n * ordsucc m.
      symmetry.
      prove n * ordsucc m = n + n * m.
      rewrite <- add_SNo_0L m (ordinal_SNo m (nat_p_ordinal m Hm)) at 1.
      prove n * ordsucc (0 + m) = n + n * m.
      rewrite <- add_SNo_ordinal_SL 0 ordinal_Empty m (nat_p_ordinal m Hm).
      prove n * (1 + m) = n + n * m.
      rewrite mul_SNo_distrL n 1 m Ln3 SNo_1 (ordinal_SNo m (nat_p_ordinal m Hm)).
      prove n * 1 + n * m = n + n * m.
      f_equal.
      prove n * 1 = n.
      exact mul_SNo_oneR n Ln3.
}
let m. assume Hm: m :e omega.
prove mul_nat n m = n * m.
exact L1 m (omega_nat_p m Hm).
Qed.

Theorem mul_SNo_In_omega : forall n m :e omega, n * m :e omega.
let n. assume Hn. let m. assume Hm.
rewrite <- mul_nat_mul_SNo n Hn m Hm.
apply nat_p_omega. exact mul_nat_p n (omega_nat_p n Hn) m (omega_nat_p m Hm).
Qed.

Theorem mul_SNo_zeroL : forall x, SNo x -> 0 * x = 0.
let x. assume Hx.
rewrite mul_SNo_com 0 x SNo_0 Hx.
exact mul_SNo_zeroR x Hx.
Qed.

Theorem mul_SNo_oneL : forall x, SNo x -> 1 * x = x.
let x. assume Hx.
rewrite mul_SNo_com 1 x SNo_1 Hx.
exact mul_SNo_oneR x Hx.
Qed.

Theorem SNo_gt2_double_ltS: forall x, SNo x -> 1 < x -> x + 1 < 2 * x.
let x. assume Hx Hx1.
rewrite <- add_SNo_1_1_2.
prove x + 1 < (1 + 1) * x.
rewrite mul_SNo_distrR 1 1 x SNo_1 SNo_1 Hx.
rewrite mul_SNo_oneL x Hx.
prove x + 1 < x + x.
apply add_SNo_Lt2 x 1 x Hx SNo_1 Hx.
prove 1 < x.
exact Hx1.
Qed.

Theorem pos_mul_SNo_Lt : forall x y z, SNo x -> 0 < x -> SNo y -> SNo z -> y < z -> x * y < x * z.
let x y z.
assume Hx1 Hx2 Hy Hz Hyz.
prove x * y < x * z.
claim L1: 0 * z + x * y = x * y.
{ transitivity 0 + x * y.
  - f_equal. prove 0 * z = 0. exact mul_SNo_zeroL z Hz.
  - exact add_SNo_0L (x * y) (SNo_mul_SNo x y Hx1 Hy).
}
claim L2: x * z + 0 * y = x * z.
{ transitivity x * z + 0.
  - f_equal. exact mul_SNo_zeroL y Hy.
  - exact add_SNo_0R (x * z) (SNo_mul_SNo x z Hx1 Hz).
}
rewrite <- L1. rewrite <- L2.
exact mul_SNo_Lt x z 0 y Hx1 Hz SNo_0 Hy Hx2 Hyz.
Qed.

Theorem nonneg_mul_SNo_Le : forall x y z, SNo x -> 0 <= x -> SNo y -> SNo z -> y <= z -> x * y <= x * z.
let x y z.
assume Hx1 Hx2 Hy Hz Hyz.
prove x * y <= x * z.
claim L1: 0 * z + x * y = x * y.
{ transitivity 0 + x * y.
  - f_equal. prove 0 * z = 0. exact mul_SNo_zeroL z Hz.
  - exact add_SNo_0L (x * y) (SNo_mul_SNo x y Hx1 Hy).
}
claim L2: x * z + 0 * y = x * z.
{ transitivity x * z + 0.
  - f_equal. exact mul_SNo_zeroL y Hy.
  - exact add_SNo_0R (x * z) (SNo_mul_SNo x z Hx1 Hz).
}
rewrite <- L1. rewrite <- L2.
exact mul_SNo_Le x z 0 y Hx1 Hz SNo_0 Hy Hx2 Hyz.
Qed.

Theorem neg_mul_SNo_Lt : forall x y z, SNo x -> x < 0 -> SNo y -> SNo z -> z < y -> x * y < x * z.
let x y z.
assume Hx1 Hx2 Hy Hz Hzy.
prove x * y < x * z.
claim L1: x * y + 0 * z  = x * y.
{ transitivity x * y + 0.
  - f_equal. prove 0 * z = 0. exact mul_SNo_zeroL z Hz.
  - exact add_SNo_0R (x * y) (SNo_mul_SNo x y Hx1 Hy).
}
claim L2: 0 * y + x * z = x * z.
{ transitivity 0 + x * z.
  - f_equal. exact mul_SNo_zeroL y Hy.
  - exact add_SNo_0L (x * z) (SNo_mul_SNo x z Hx1 Hz).
}
rewrite <- L1. rewrite <- L2.
exact mul_SNo_Lt 0 y x z SNo_0 Hy Hx1 Hz Hx2 Hzy.
Qed.

Theorem pos_mul_SNo_Lt' : forall x y z, SNo x -> SNo y -> SNo z -> 0 < z -> x < y -> x * z < y * z.
let x y z. assume Hx Hy Hz Hzpos Hxy.
rewrite mul_SNo_com x z Hx Hz.
rewrite mul_SNo_com y z Hy Hz.
exact pos_mul_SNo_Lt z x y Hz Hzpos Hx Hy Hxy.
Qed.

Theorem mul_SNo_Lt1_pos_Lt : forall x y, SNo x -> SNo y -> x < 1 -> 0 < y -> x * y < y.
let x y. assume Hx Hy Hx1 Hy0.
rewrite <- mul_SNo_oneL y Hy at 2.
prove x * y < 1 * y.
exact pos_mul_SNo_Lt' x 1 y Hx SNo_1 Hy Hy0 Hx1.
Qed.

Theorem nonneg_mul_SNo_Le' : forall x y z, SNo x -> SNo y -> SNo z -> 0 <= z -> x <= y -> x * z <= y * z.
let x y z. assume Hx Hy Hz Hznn Hxy.
rewrite mul_SNo_com x z Hx Hz.
rewrite mul_SNo_com y z Hy Hz.
exact nonneg_mul_SNo_Le z x y Hz Hznn Hx Hy Hxy.
Qed.

Theorem mul_SNo_Le1_nonneg_Le : forall x y, SNo x -> SNo y -> x <= 1 -> 0 <= y -> x * y <= y.
let x y. assume Hx Hy Hx1 Hy0.
rewrite <- mul_SNo_oneL y Hy at 2.
prove x * y <= 1 * y.
exact nonneg_mul_SNo_Le' x 1 y Hx SNo_1 Hy Hy0 Hx1.
Qed.

Theorem pos_mul_SNo_Lt2 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> 0 < x -> 0 < y -> x < z -> y < w -> x * y < z * w.
let x y z w. assume Hx Hy Hz Hw Hxpos Hypos Hxz Hyw.
apply SNoLt_tra (x * y) (x * w) (z * w)
                (SNo_mul_SNo x y Hx Hy)
                (SNo_mul_SNo x w Hx Hw)
                (SNo_mul_SNo z w Hz Hw).
- prove x * y < x * w.
  exact pos_mul_SNo_Lt x y w Hx Hxpos Hy Hw Hyw.
- prove x * w < z * w.
  apply pos_mul_SNo_Lt' x z w Hx Hz Hw.
  + prove 0 < w.
    exact SNoLt_tra 0 y w SNo_0 Hy Hw Hypos Hyw.
  + exact Hxz.
Qed.

Theorem nonneg_mul_SNo_Le2 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> 0 <= x -> 0 <= y -> x <= z -> y <= w -> x * y <= z * w.
let x y z w. assume Hx Hy Hz Hw Hxnn Hynn Hxz Hyw.
apply SNoLe_tra (x * y) (x * w) (z * w)
                (SNo_mul_SNo x y Hx Hy)
                (SNo_mul_SNo x w Hx Hw)
                (SNo_mul_SNo z w Hz Hw).
- prove x * y <= x * w.
  exact nonneg_mul_SNo_Le x y w Hx Hxnn Hy Hw Hyw.
- prove x * w <= z * w.
  apply nonneg_mul_SNo_Le' x z w Hx Hz Hw.
  + prove 0 <= w.
    exact SNoLe_tra 0 y w SNo_0 Hy Hw Hynn Hyw.
  + exact Hxz.
Qed.

Theorem mul_SNo_pos_pos: forall x y, SNo x -> SNo y -> 0 < x -> 0 < y -> 0 < x * y.
let x y. assume Hx Hy Hx0 Hy0.
prove 0 < x * y.
rewrite <- add_SNo_0R 0 SNo_0.
prove 0 + 0 < x * y.
rewrite <- add_SNo_0R (x * y) (SNo_mul_SNo x y Hx Hy).
prove 0 + 0 < x * y + 0.
rewrite <- mul_SNo_zeroR 0 SNo_0 at 3.
rewrite <- mul_SNo_zeroR x Hx at 2.
rewrite <- mul_SNo_zeroR y Hy at 1.
prove y * 0 + x * 0 < x * y + 0 * 0.
rewrite mul_SNo_com y 0 Hy SNo_0.
prove 0 * y + x * 0 < x * y + 0 * 0.
exact mul_SNo_Lt x y 0 0 Hx Hy SNo_0 SNo_0 Hx0 Hy0.
Qed.

Theorem mul_SNo_pos_neg: forall x y, SNo x -> SNo y -> 0 < x -> y < 0 -> x * y < 0.
let x y. assume Hx Hy Hx0 Hy0.
prove x * y < 0.
rewrite <- add_SNo_0R 0 SNo_0.
rewrite <- add_SNo_0L (x * y) (SNo_mul_SNo x y Hx Hy).
prove 0 + x * y < 0 + 0.
rewrite <- mul_SNo_zeroR y Hy at 3.
rewrite <- mul_SNo_zeroR x Hx at 2.
rewrite <- mul_SNo_zeroR 0 SNo_0 at 1.
rewrite mul_SNo_com y 0 Hy SNo_0.
prove 0 * 0 + x * y < x * 0 + 0 * y.
exact mul_SNo_Lt x 0 0 y Hx SNo_0 SNo_0 Hy Hx0 Hy0.
Qed.

Theorem mul_SNo_neg_pos: forall x y, SNo x -> SNo y -> x < 0 -> 0 < y -> x * y < 0.
let x y. assume Hx Hy Hx0 Hy0.
prove x * y < 0.
rewrite <- add_SNo_0R 0 SNo_0.
rewrite <- add_SNo_0R (x * y) (SNo_mul_SNo x y Hx Hy).
prove x * y + 0 < 0 + 0.
rewrite <- mul_SNo_zeroR x Hx at 3.
rewrite <- mul_SNo_zeroR y Hy at 2.
rewrite <- mul_SNo_zeroR 0 SNo_0 at 1.
rewrite mul_SNo_com y 0 Hy SNo_0.
prove x * y + 0 * 0 < 0 * y + x * 0.
exact mul_SNo_Lt 0 y x 0 SNo_0 Hy Hx SNo_0 Hx0 Hy0.
Qed.

Theorem mul_SNo_neg_neg: forall x y, SNo x -> SNo y -> x < 0 -> y < 0 -> 0 < x * y.
let x y. assume Hx Hy Hx0 Hy0.
prove 0 < x * y.
rewrite <- add_SNo_0R 0 SNo_0.
prove 0 + 0 < x * y.
rewrite <- add_SNo_0L (x * y) (SNo_mul_SNo x y Hx Hy).
prove 0 + 0 < 0 + x * y.
rewrite <- mul_SNo_zeroR 0 SNo_0 at 3.
rewrite <- mul_SNo_zeroR y Hy at 2.
rewrite <- mul_SNo_zeroR x Hx at 1.
prove x * 0 + y * 0 < 0 * 0 + x * y.
rewrite mul_SNo_com y 0 Hy SNo_0.
prove x * 0 + 0 * y < 0 * 0 + x * y.
exact mul_SNo_Lt 0 0 x y SNo_0 SNo_0 Hx Hy Hx0 Hy0.
Qed.

Theorem mul_SNo_nonneg_nonneg: forall x y, SNo x -> SNo y -> 0 <= x -> 0 <= y -> 0 <= x * y.
let x y. assume Hx Hy Hxnn Hynn.
apply SNoLeE 0 x SNo_0 Hx Hxnn.
- assume H1: 0 < x.
  apply SNoLeE 0 y SNo_0 Hy Hynn.
  + assume H2: 0 < y.
    apply SNoLtLe.
    exact mul_SNo_pos_pos x y Hx Hy H1 H2.
  + assume H2: 0 = y.
    rewrite <- H2.
    rewrite mul_SNo_zeroR x Hx. apply SNoLe_ref.
- assume H1: 0 = x.
  rewrite <- H1.
  rewrite mul_SNo_zeroL y Hy. apply SNoLe_ref.
Qed.

Theorem mul_SNo_nonpos_pos: forall x y, SNo x -> SNo y -> x <= 0 -> 0 < y -> x * y <= 0.
let x y. assume Hx Hy Hxnp Hypos.
apply SNoLtLe_or x 0 Hx SNo_0.
- assume H1: x < 0. apply SNoLtLe. prove x * y < 0.
  exact mul_SNo_neg_pos x y Hx Hy H1 Hypos.
- assume H1: 0 <= x.
  claim L1: x = 0.
  { apply SNoLe_antisym x 0 Hx SNo_0.
    - exact Hxnp.
    - exact H1.
  }
  rewrite L1.
  prove 0 * y <= 0.
  rewrite mul_SNo_zeroL y Hy.
  apply SNoLe_ref.
Qed.

Theorem mul_SNo_nonpos_neg: forall x y, SNo x -> SNo y -> x <= 0 -> y < 0 -> 0 <= x * y.
let x y. assume Hx Hy Hxnp Hyneg.
apply SNoLtLe_or x 0 Hx SNo_0.
- assume H1: x < 0. apply SNoLtLe. prove 0 < x * y.
  exact mul_SNo_neg_neg x y Hx Hy H1 Hyneg.
- assume H1: 0 <= x.
  claim L1: x = 0.
  { apply SNoLe_antisym x 0 Hx SNo_0.
    - exact Hxnp.
    - exact H1.
  }
  rewrite L1.
  prove 0 <= 0 * y.
  rewrite mul_SNo_zeroL y Hy.
  apply SNoLe_ref.
Qed.

Theorem nonpos_mul_SNo_Le : forall x y z, SNo x -> x <= 0 -> SNo y -> SNo z -> z <= y -> x * y <= x * z.
let x y z. assume Hx Hxnp Hy Hz Hzy.
apply SNoLtLe_or x 0 Hx SNo_0.
- assume H1: x < 0.
  apply SNoLtLe_or z y Hz Hy.
  + assume H2: z < y. apply SNoLtLe. prove x * y < x * z.
    exact neg_mul_SNo_Lt x y z Hx H1 Hy Hz H2.
  + assume H2: y <= z.
    claim L1: y = z.
    { apply SNoLe_antisym y z Hy Hz.
      - exact H2.
      - exact Hzy.
    }
    rewrite L1.
    apply SNoLe_ref.
- assume H1: 0 <= x.
  claim L1: x = 0.
  { apply SNoLe_antisym x 0 Hx SNo_0.
    - exact Hxnp.
    - exact H1.
  }
  rewrite L1.
  prove 0 * y <= 0 * z.
  rewrite mul_SNo_zeroL y Hy.
  rewrite mul_SNo_zeroL z Hz.
  apply SNoLe_ref.
Qed.

Theorem SNo_sqr_nonneg : forall x, SNo x -> 0 <= x * x.
let x. assume Hx.
apply SNoLtLe_or x 0 Hx SNo_0.
- assume H1: x < 0.
  apply SNoLtLe.
  prove 0 < x * x.
  rewrite <- mul_SNo_zeroR x Hx.
  prove x * 0 < x * x.
  apply neg_mul_SNo_Lt x 0 x Hx H1 SNo_0 Hx H1.
- assume H1: 0 <= x.
  prove 0 <= x * x.
  rewrite <- mul_SNo_zeroR x Hx.
  prove x * 0 <= x * x.
  exact nonneg_mul_SNo_Le x 0 x Hx H1 SNo_0 Hx H1.
Qed.

Theorem SNo_zero_or_sqr_pos : forall x, SNo x -> x = 0 \/ 0 < x * x.
let x. assume Hx.
apply SNoLt_trichotomy_or_impred x 0 Hx SNo_0.
- assume H1: x < 0. apply orIR.
  apply mul_SNo_neg_neg.
  + exact Hx.
  + exact Hx.
  + exact H1.
  + exact H1.
- assume H1: x = 0. apply orIL. exact H1.
- assume H1: 0 < x. apply orIR.
  apply mul_SNo_pos_pos.
  + exact Hx.
  + exact Hx.
  + exact H1.
  + exact H1.
Qed.

Theorem SNo_pos_sqr_uniq: forall x y, SNo x -> SNo y -> 0 < x -> 0 < y -> x * x = y * y -> x = y.
let x y. assume Hx Hy Hxpos Hypos.
assume H1: x * x = y * y.
apply SNoLt_trichotomy_or_impred x y Hx Hy.
- assume H2: x < y. prove False.
  apply SNoLt_irref (x * x).
  prove x * x < x * x.
  rewrite H1 at 2.
  prove x * x < y * y.
  exact pos_mul_SNo_Lt2 x x y y Hx Hx Hy Hy Hxpos Hxpos H2 H2.
- assume H2: x = y. exact H2.
- assume H2: y < x. prove False.
  apply SNoLt_irref (x * x).
  prove x * x < x * x.
  rewrite H1 at 1.
  prove y * y < x * x.
  exact pos_mul_SNo_Lt2 y y x x Hy Hy Hx Hx Hypos Hypos H2 H2.
Qed.

Theorem SNo_nonneg_sqr_uniq: forall x y, SNo x -> SNo y -> 0 <= x -> 0 <= y -> x * x = y * y -> x = y.
let x y. assume Hx Hy Hxnn Hynn.
apply SNoLeE 0 x SNo_0 Hx Hxnn.
- assume H1: 0 < x.
  apply SNoLeE 0 y SNo_0 Hy Hynn.
  + assume H2: 0 < y.
    exact SNo_pos_sqr_uniq x y Hx Hy H1 H2.
  + assume H2: 0 = y. rewrite <- H2.
    rewrite mul_SNo_zeroR 0 SNo_0.
    assume H3: x * x = 0.
    prove x = 0.
    apply SNo_zero_or_sqr_pos x Hx.
    * assume H4: x = 0. exact H4.
    * assume H4: 0 < x * x. prove False. apply SNoLt_irref 0.
      prove 0 < 0. rewrite <- H3 at 2. exact H4.
- assume H1: 0 = x. rewrite <- H1.
  rewrite mul_SNo_zeroR 0 SNo_0.
  assume H2: 0 = y * y.
  prove 0 = y.
  apply SNo_zero_or_sqr_pos y Hy.
  + assume H3: y = 0. symmetry. exact H3.
  + assume H3: 0 < y * y. prove False. apply SNoLt_irref 0.
    prove 0 < 0. rewrite H2 at 2. exact H3.
Qed.

Theorem SNo_foil: forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> (x + y) * (z + w) = x * z + x * w + y * z + y * w.
let x y z w. assume Hx Hy Hz Hw.
transitivity (x + y) * z + (x + y) * w,
             (x * z + y * z) + (x + y) * w,
             (x * z + y * z) + (x * w + y * w).
- exact mul_SNo_distrL (x + y) z w (SNo_add_SNo x y Hx Hy) Hz Hw.
- f_equal. exact mul_SNo_distrR x y z Hx Hy Hz.
- f_equal. exact mul_SNo_distrR x y w Hx Hy Hw.
- prove (x * z + y * z) + (x * w + y * w)
      = x * z + (x * w + (y * z + y * w)).
  rewrite add_SNo_com_4_inner_mid (x * z) (y * z) (x * w) (y * w)
            (SNo_mul_SNo x z Hx Hz)
            (SNo_mul_SNo y z Hy Hz)
            (SNo_mul_SNo x w Hx Hw)
            (SNo_mul_SNo y w Hy Hw).
  prove (x * z + x * w) + (y * z + y * w)
      = x * z + (x * w + (y * z + y * w)).
  symmetry.
  exact add_SNo_assoc (x * z) (x * w) (y * z + y * w)
            (SNo_mul_SNo x z Hx Hz)
            (SNo_mul_SNo x w Hx Hw)
            (SNo_add_SNo (y * z) (y * w)
                 (SNo_mul_SNo y z Hy Hz)
                 (SNo_mul_SNo y w Hy Hw)).
Qed.

Theorem mul_SNo_minus_minus: forall x y, SNo x -> SNo y -> (- x) * (- y) = x * y.
let x y. assume Hx Hy.
rewrite mul_SNo_minus_distrL x (- y) Hx (SNo_minus_SNo y Hy).
prove - (x * (- y)) = x * y.
rewrite mul_SNo_minus_distrR x y Hx Hy.
prove - - (x * y) = x * y.
exact minus_SNo_invol (x * y) (SNo_mul_SNo x y Hx Hy).
Qed.

Theorem mul_SNo_com_3_0_1 : forall x y z, SNo x -> SNo y -> SNo z
  -> x * y * z = y * x * z.
let x y z.
assume Hx Hy Hz.
rewrite mul_SNo_assoc x y z Hx Hy Hz.
rewrite mul_SNo_assoc y x z Hy Hx Hz.
f_equal.
exact mul_SNo_com x y Hx Hy.
Qed.

Theorem mul_SNo_com_3b_1_2 : forall x y z, SNo x -> SNo y -> SNo z
  -> (x * y) * z = (x * z) * y.
let x y z.
assume Hx Hy Hz.
rewrite <- mul_SNo_assoc x y z Hx Hy Hz.
rewrite <- mul_SNo_assoc x z y Hx Hz Hy.
f_equal.
exact mul_SNo_com y z Hy Hz.
Qed.

Theorem mul_SNo_com_4_inner_mid : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w
  -> (x * y) * (z * w) = (x * z) * (y * w).
let x y z w.
assume Hx Hy Hz Hw.
rewrite mul_SNo_assoc (x * y) z w (SNo_mul_SNo x y Hx Hy) Hz Hw.
prove ((x * y) * z) * w = (x * z) * (y * w).
rewrite mul_SNo_com_3b_1_2 x y z Hx Hy Hz.
prove ((x * z) * y) * w = (x * z) * (y * w).
symmetry.
exact mul_SNo_assoc (x * z) y w (SNo_mul_SNo x z Hx Hz) Hy Hw.
Qed.

Theorem mul_SNo_rotate_3_1 : forall x y z, SNo x -> SNo y -> SNo z ->
  x * y * z = z * x * y.
let x y z.
assume Hx Hy Hz.
prove x * (y * z) = z * (x * y).
transitivity x * (z * y),
             (x * z) * y,
             (z * x) * y.
- f_equal. exact mul_SNo_com y z Hy Hz.
- exact mul_SNo_assoc x z y Hx Hz Hy.
- f_equal. exact mul_SNo_com x z Hx Hz.
- symmetry. exact mul_SNo_assoc z x y Hz Hx Hy.
Qed.

Theorem mul_SNo_rotate_4_1 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w ->
  x * y * z * w = w * x * y * z.
let x y z w. assume Hx Hy Hz Hw.
rewrite mul_SNo_rotate_3_1 y z w Hy Hz Hw.
prove x * w * y * z = w * x * y * z.
exact mul_SNo_com_3_0_1 x w (y * z) Hx Hw (SNo_mul_SNo y z Hy Hz).
Qed.

Theorem SNo_foil_mm: forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> (x + - y) * (z + - w) = x * z + - x * w + - y * z + y * w.
let x y z w. assume Hx Hy Hz Hw.
claim Lmy: SNo (- y).
{ exact SNo_minus_SNo y Hy. }
claim Lmw: SNo (- w).
{ exact SNo_minus_SNo w Hw. }
rewrite SNo_foil x (- y) z (- w) Hx Lmy Hz Lmw.
prove x * z + x * (- w) + (- y) * z + (- y) * (- w)
    = x * z + - x * w + - y * z + y * w.
rewrite mul_SNo_minus_minus y w Hy Hw.
rewrite mul_SNo_minus_distrL y z Hy Hz.
rewrite mul_SNo_minus_distrR x w Hx Hw.
reflexivity.
Qed.

Theorem mul_SNo_nonzero_cancel: forall x y z, SNo x -> x <> 0 -> SNo y -> SNo z -> x * y = x * z -> y = z.
let x y z. assume Hx Hxn0 Hy Hz Hxyz.
apply SNoLt_trichotomy_or_impred y z Hy Hz.
- assume H1: y < z. prove False.
  apply SNoLt_trichotomy_or_impred x 0 Hx SNo_0.
  + assume H2: x < 0.
    apply SNoLt_irref (x * y).
    prove x * y < x * y.
    rewrite Hxyz at 1.
    prove x * z < x * y.
    exact neg_mul_SNo_Lt x z y Hx H2 Hz Hy H1.
  + assume H2: x = 0. exact Hxn0 H2.
  + assume H2: 0 < x.
    apply SNoLt_irref (x * y).
    prove x * y < x * y.
    rewrite Hxyz at 2.
    prove x * y < x * z.
    exact pos_mul_SNo_Lt x y z Hx H2 Hy Hz H1.
- assume H1. exact H1.
- assume H1: z < y. prove False.
  apply SNoLt_trichotomy_or_impred x 0 Hx SNo_0.
  + assume H2: x < 0.
    apply SNoLt_irref (x * y).
    prove x * y < x * y.
    rewrite Hxyz at 2.
    prove x * y < x * z.
    exact neg_mul_SNo_Lt x y z Hx H2 Hy Hz H1.
  + assume H2: x = 0. exact Hxn0 H2.
  + assume H2: 0 < x.
    apply SNoLt_irref (x * y).
    prove x * y < x * y.
    rewrite Hxyz at 1.
    prove x * z < x * y.
    exact pos_mul_SNo_Lt x z y Hx H2 Hz Hy H1.
Qed.

Theorem mul_SNoCutP_lem : forall Lx Rx Ly Ry x y,
    SNoCutP Lx Rx
 -> SNoCutP Ly Ry
 -> x = SNoCut Lx Rx
 -> y = SNoCut Ly Ry
 -> SNoCutP ({w 0 * y + x * w 1 + - w 0 * w 1|w :e Lx :*: Ly}
              :\/:
             {z 0 * y + x * z 1 + - z 0 * z 1|z :e Rx :*: Ry})
            ({w 0 * y + x * w 1 + - w 0 * w 1|w :e Lx :*: Ry}
              :\/:
             {z 0 * y + x * z 1 + - z 0 * z 1|z :e Rx :*: Ly})
 /\ x * y
  = SNoCut ({w 0 * y + x * w 1 + - w 0 * w 1|w :e Lx :*: Ly}
             :\/:
            {z 0 * y + x * z 1 + - z 0 * z 1|z :e Rx :*: Ry})
           ({w 0 * y + x * w 1 + - w 0 * w 1|w :e Lx :*: Ry}
             :\/:
            {z 0 * y + x * z 1 + - z 0 * z 1|z :e Rx :*: Ly})
 /\ forall q:prop,
     (forall LxLy' RxRy' LxRy' RxLy',
         (forall u :e LxLy', forall p:prop, (forall w :e Lx, forall w' :e Ly, SNo w -> SNo w' -> w < x -> w' < y -> u = w * y + x * w' + - w * w' -> p) -> p)
      -> (forall w :e Lx, forall w' :e Ly, w * y + x * w' + - w * w' :e LxLy')
      -> (forall u :e RxRy', forall p:prop, (forall z :e Rx, forall z' :e Ry, SNo z -> SNo z' -> x < z -> y < z' -> u = z * y + x * z' + - z * z' -> p) -> p)
      -> (forall z :e Rx, forall z' :e Ry, z * y + x * z' + - z * z' :e RxRy')
      -> (forall u :e LxRy', forall p:prop, (forall w :e Lx, forall z :e Ry, SNo w -> SNo z -> w < x -> y < z -> u = w * y + x * z + - w * z -> p) -> p)
      -> (forall w :e Lx, forall z :e Ry, w * y + x * z + - w * z :e LxRy')
      -> (forall u :e RxLy', forall p:prop, (forall z :e Rx, forall w :e Ly, SNo z -> SNo w -> x < z -> w < y -> u = z * y + x * w + - z * w -> p) -> p)
      -> (forall z :e Rx, forall w :e Ly, z * y + x * w + - z * w :e RxLy')
      -> SNoCutP (LxLy' :\/: RxRy') (LxRy' :\/: RxLy')
      -> x * y = SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy')
      -> q)
    -> q.
let Lx Rx Ly Ry x y.
assume HLRx HLRy Hxe Hye.
apply HLRx. assume H. apply H.
assume HLRx1: forall w :e Lx, SNo w.
assume HLRx2: forall z :e Rx, SNo z.
assume HLRx3: forall w :e Lx, forall z :e Rx, w < z.
apply HLRy. assume H. apply H.
assume HLRy1: forall w :e Ly, SNo w.
assume HLRy2: forall z :e Ry, SNo z.
assume HLRy3: forall w :e Ly, forall z :e Ry, w < z.
apply SNoCutP_SNoCut_impred Lx Rx HLRx.
rewrite <- Hxe.
assume Hx1: SNo x.
assume Hx2: SNoLev x :e ordsucc ((\/_ w :e Lx, ordsucc (SNoLev w)) :\/: (\/_ z :e Rx, ordsucc (SNoLev z))).
assume Hx3: forall w :e Lx, w < x.
assume Hx4: forall z :e Rx, x < z.
assume Hx5: (forall u, SNo u -> (forall w :e Lx, w < u) -> (forall z :e Rx, u < z) -> SNoLev x c= SNoLev u /\ SNoEq_ (SNoLev x) x u).
apply SNoCutP_SNoCut_impred Ly Ry HLRy.
rewrite <- Hye.
assume Hy1: SNo y.
assume Hy2: SNoLev y :e ordsucc ((\/_ w :e Ly, ordsucc (SNoLev w)) :\/: (\/_ z :e Ry, ordsucc (SNoLev z))).
assume Hy3: forall w :e Ly, w < y.
assume Hy4: forall z :e Ry, y < z.
assume Hy5: (forall u, SNo u -> (forall w :e Ly, w < u) -> (forall z :e Ry, u < z) -> SNoLev y c= SNoLev u /\ SNoEq_ (SNoLev y) y u).
set LxLy' := {w 0 * y + x * w 1 + - w 0 * w 1|w :e Lx :*: Ly}.
set RxRy' := {z 0 * y + x * z 1 + - z 0 * z 1|z :e Rx :*: Ry}.
set LxRy' := {w 0 * y + x * w 1 + - w 0 * w 1|w :e Lx :*: Ry}.
set RxLy' := {z 0 * y + x * z 1 + - z 0 * z 1|z :e Rx :*: Ly}.
claim LxLy'E: forall u :e LxLy', forall p:prop, (forall w :e Lx, forall w' :e Ly, SNo w -> SNo w' -> w < x -> w' < y -> u = w * y + x * w' + - w * w' -> p) -> p.
{ let u. assume Hu. let p. assume Hp.
  apply ReplE_impred (Lx :*: Ly) (fun w => (w 0) * y + x * (w 1) + - (w 0) * (w 1)) u Hu.
  let ww'. assume Hww': ww' :e Lx :*: Ly.
  assume Hue: u = (ww' 0) * y + x * (ww' 1) + - (ww' 0) * (ww' 1).
  claim Lww'0: ww' 0 :e Lx.
  { exact ap0_Sigma Lx (fun _ => Ly) ww' Hww'. }
  claim Lww'1: ww' 1 :e Ly.
  { exact ap1_Sigma Lx (fun _ => Ly) ww' Hww'. }
  apply Hp (ww' 0) Lww'0 (ww' 1) Lww'1.
  - prove SNo (ww' 0). exact HLRx1 (ww' 0) Lww'0.
  - prove SNo (ww' 1). exact HLRy1 (ww' 1) Lww'1.
  - prove ww' 0 < x. exact Hx3 (ww' 0) Lww'0.
  - prove ww' 1 < y. exact Hy3 (ww' 1) Lww'1.
  - exact Hue.
}
claim LxLy'I: forall w :e Lx, forall w' :e Ly, w * y + x * w' + - w * w' :e LxLy'.
{ let w. assume Hw. let w'. assume Hw'.
  rewrite <- tuple_2_0_eq w w'.
  rewrite <- tuple_2_1_eq w w' at 2 4.
  apply ReplI (Lx :*: Ly) (fun w => w 0 * y + x * w 1 + - w 0 * w 1) (w,w').
  prove (w,w') :e Lx :*: Ly.
  exact tuple_2_setprod Lx Ly w Hw w' Hw'.
}
claim RxRy'E: forall u :e RxRy', forall p:prop, (forall z :e Rx, forall z' :e Ry, SNo z -> SNo z' -> x < z -> y < z' -> u = z * y + x * z' + - z * z' -> p) -> p.
{ let u. assume Hu. let p. assume Hp.
  apply ReplE_impred (Rx :*: Ry) (fun z => (z 0) * y + x * (z 1) + - (z 0) * (z 1)) u Hu.
  let zz'. assume Hzz': zz' :e Rx :*: Ry.
  assume Hue: u = (zz' 0) * y + x * (zz' 1) + - (zz' 0) * (zz' 1).
  claim Lzz'0: zz' 0 :e Rx.
  { exact ap0_Sigma Rx (fun _ => Ry) zz' Hzz'. }
  claim Lzz'1: zz' 1 :e Ry.
  { exact ap1_Sigma Rx (fun _ => Ry) zz' Hzz'. }
  apply Hp (zz' 0) Lzz'0 (zz' 1) Lzz'1.
  - prove SNo (zz' 0). exact HLRx2 (zz' 0) Lzz'0.
  - prove SNo (zz' 1). exact HLRy2 (zz' 1) Lzz'1.
  - prove x < zz' 0. exact Hx4 (zz' 0) Lzz'0.
  - prove y < zz' 1. exact Hy4 (zz' 1) Lzz'1.
  - exact Hue.
}
claim RxRy'I: forall z :e Rx, forall z' :e Ry, z * y + x * z' + - z * z' :e RxRy'.
{ let z. assume Hz. let z'. assume Hz'.
  rewrite <- tuple_2_0_eq z z'.
  rewrite <- tuple_2_1_eq z z' at 2 4.
  apply ReplI (Rx :*: Ry) (fun z => z 0 * y + x * z 1 + - z 0 * z 1) (z,z').
  prove (z,z') :e Rx :*: Ry.
  exact tuple_2_setprod Rx Ry z Hz z' Hz'.
}
claim LxRy'E: forall u :e LxRy', forall p:prop, (forall w :e Lx, forall z :e Ry, SNo w -> SNo z -> w < x -> y < z -> u = w * y + x * z + - w * z -> p) -> p.
{ let u. assume Hu. let p. assume Hp.
  apply ReplE_impred (Lx :*: Ry) (fun w => (w 0) * y + x * (w 1) + - (w 0) * (w 1)) u Hu.
  let wz. assume Hwz: wz :e Lx :*: Ry.
  assume Hue: u = (wz 0) * y + x * (wz 1) + - (wz 0) * (wz 1).
  claim Lwz0: wz 0 :e Lx.
  { exact ap0_Sigma Lx (fun _ => Ry) wz Hwz. }
  claim Lwz1: wz 1 :e Ry.
  { exact ap1_Sigma Lx (fun _ => Ry) wz Hwz. }
  apply Hp (wz 0) Lwz0 (wz 1) Lwz1.
  - prove SNo (wz 0). exact HLRx1 (wz 0) Lwz0.
  - prove SNo (wz 1). exact HLRy2 (wz 1) Lwz1.
  - prove wz 0 < x. exact Hx3 (wz 0) Lwz0.
  - prove y < wz 1. exact Hy4 (wz 1) Lwz1.
  - exact Hue.
}
claim LxRy'I: forall w :e Lx, forall z :e Ry, w * y + x * z + - w * z :e LxRy'.
{ let w. assume Hw. let z. assume Hz.
  rewrite <- tuple_2_0_eq w z.
  rewrite <- tuple_2_1_eq w z at 2 4.
  apply ReplI (Lx :*: Ry) (fun w => w 0 * y + x * w 1 + - w 0 * w 1) (w,z).
  prove (w,z) :e Lx :*: Ry.
  exact tuple_2_setprod Lx Ry w Hw z Hz.
}
claim RxLy'E: forall u :e RxLy', forall p:prop, (forall z :e Rx, forall w :e Ly, SNo z -> SNo w -> x < z -> w < y -> u = z * y + x * w + - z * w -> p) -> p.
{ let u. assume Hu. let p. assume Hp.
  apply ReplE_impred (Rx :*: Ly) (fun z => (z 0) * y + x * (z 1) + - (z 0) * (z 1)) u Hu.
  let zw. assume Hzw: zw :e Rx :*: Ly.
  assume Hue: u = (zw 0) * y + x * (zw 1) + - (zw 0) * (zw 1).
  claim Lzw0: zw 0 :e Rx.
  { exact ap0_Sigma Rx (fun _ => Ly) zw Hzw. }
  claim Lzw1: zw 1 :e Ly.
  { exact ap1_Sigma Rx (fun _ => Ly) zw Hzw. }
  apply Hp (zw 0) Lzw0 (zw 1) Lzw1.
  - prove SNo (zw 0). exact HLRx2 (zw 0) Lzw0.
  - prove SNo (zw 1). exact HLRy1 (zw 1) Lzw1.
  - prove x < zw 0. exact Hx4 (zw 0) Lzw0.
  - prove zw 1 < y. exact Hy3 (zw 1) Lzw1.
  - exact Hue.
}
claim RxLy'I: forall z :e Rx, forall w :e Ly, z * y + x * w + - z * w :e RxLy'.
{ let z. assume Hz. let w. assume Hw.
  rewrite <- tuple_2_0_eq z w.
  rewrite <- tuple_2_1_eq z w at 2 4.
  apply ReplI (Rx :*: Ly) (fun w => w 0 * y + x * w 1 + - w 0 * w 1) (z,w).
  prove (z,w) :e Rx :*: Ly.
  exact tuple_2_setprod Rx Ly z Hz w Hw.
}
claim L1: SNoCutP (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
{ prove (forall w :e LxLy' :\/: RxRy', SNo w)
     /\ (forall z :e LxRy' :\/: RxLy', SNo z)
     /\ (forall w :e LxLy' :\/: RxRy', forall z :e LxRy' :\/: RxLy', w < z).
  apply and3I.
  - let w. apply binunionE'.
    + assume Hw: w :e LxLy'.
      apply LxLy'E w Hw.
      let w'. assume Hw': w' :e Lx.
      let w''. assume Hw'': w'' :e Ly.
      assume Hw'1: SNo w'.
      assume Hw''1: SNo w''.
      assume Hw'2: w' < x.
      assume Hw''2: w'' < y.
      assume Hwe. rewrite Hwe.
      prove SNo (w' * y + x * w'' + - w' * w'').
      apply SNo_add_SNo_3.
      * exact SNo_mul_SNo w' y Hw'1 Hy1.
      * exact SNo_mul_SNo x w'' Hx1 Hw''1.
      * apply SNo_minus_SNo.
        exact SNo_mul_SNo w' w'' Hw'1 Hw''1.
    + assume Hw: w :e RxRy'.
      apply RxRy'E w Hw.
      let z'. assume Hz': z' :e Rx.
      let z''. assume Hz'': z'' :e Ry.
      assume Hz'1: SNo z'.
      assume Hz''1: SNo z''.
      assume Hz'2: x < z'.
      assume Hz''2: y < z''.
      assume Hwe. rewrite Hwe.
      prove SNo (z' * y + x * z'' + - z' * z'').
      apply SNo_add_SNo_3.
      * exact SNo_mul_SNo z' y Hz'1 Hy1.
      * exact SNo_mul_SNo x z'' Hx1 Hz''1.
      * apply SNo_minus_SNo.
        exact SNo_mul_SNo z' z'' Hz'1 Hz''1.
  - let z. apply binunionE'.
    + assume Hz: z :e LxRy'.
      apply LxRy'E z Hz.
      let w'. assume Hw': w' :e Lx.
      let z'. assume Hz': z' :e Ry.
      assume Hw'1: SNo w'.
      assume Hz'1: SNo z'.
      assume Hw'2: w' < x.
      assume Hz'2: y < z'.
      assume Hze. rewrite Hze.
      prove SNo (w' * y + x * z' + - w' * z').
      apply SNo_add_SNo_3.
      * exact SNo_mul_SNo w' y Hw'1 Hy1.
      * exact SNo_mul_SNo x z' Hx1 Hz'1.
      * apply SNo_minus_SNo.
        exact SNo_mul_SNo w' z' Hw'1 Hz'1.
    + assume Hz: z :e RxLy'.
      apply RxLy'E z Hz.
      let z'. assume Hz': z' :e Rx.
      let w'. assume Hw': w' :e Ly.
      assume Hz'1: SNo z'.
      assume Hw'1: SNo w'.
      assume Hz'2: x < z'.
      assume Hw'2: w' < y.
      assume Hze. rewrite Hze.
      prove SNo (z' * y + x * w' + - z' * w').
      apply SNo_add_SNo_3.
      * exact SNo_mul_SNo z' y Hz'1 Hy1.
      * exact SNo_mul_SNo x w' Hx1 Hw'1.
      * apply SNo_minus_SNo.
        exact SNo_mul_SNo z' w' Hz'1 Hw'1.
  - let w. apply binunionE'.
    + assume Hw: w :e LxLy'.
      apply LxLy'E w Hw.
      let w'. assume Hw': w' :e Lx.
      let w''. assume Hw'': w'' :e Ly.
      assume Hw'1: SNo w'.
      assume Hw''1: SNo w''.
      assume Hw'2: w' < x.
      assume Hw''2: w'' < y.
      assume Hwe. rewrite Hwe.
      let z. apply binunionE'.
      * { assume Hz: z :e LxRy'.
          apply LxRy'E z Hz.
          let w'''. assume Hw''': w''' :e Lx.
          let z'. assume Hz': z' :e Ry.
          assume Hw'''1: SNo w'''.
          assume Hz'1: SNo z'.
          assume Hw'''2: w''' < x.
          assume Hz'2: y < z'.
          assume Hze. rewrite Hze.
          prove w' * y + x * w'' + - w' * w'' < w''' * y + x * z' + - w''' * z'.
          apply add_SNo_minus_Lt12b3 (w' * y) (x * w'') (w' * w'') (w''' * y) (x * z') (w''' * z')
                       (SNo_mul_SNo w' y Hw'1 Hy1)
                       (SNo_mul_SNo x w'' Hx1 Hw''1)
                       (SNo_mul_SNo w' w'' Hw'1 Hw''1)
                       (SNo_mul_SNo w''' y Hw'''1 Hy1)
                       (SNo_mul_SNo x z' Hx1 Hz'1)
                       (SNo_mul_SNo w''' z' Hw'''1 Hz'1).
          prove w' * y + x * w'' + w''' * z' < w''' * y + x * z' + w' * w''.
          apply SNoLt_tra (w' * y + x * w'' + w''' * z')
                          (x * y + w' * w'' + w''' * z')
                          (w''' * y + x * z' + w' * w'')
                          (SNo_add_SNo_3 (w' * y) (x * w'') (w''' * z')
                              (SNo_mul_SNo w' y Hw'1 Hy1)
                              (SNo_mul_SNo x w'' Hx1 Hw''1)
                              (SNo_mul_SNo w''' z' Hw'''1 Hz'1))
                          (SNo_add_SNo_3 (x * y) (w' * w'') (w''' * z')
                              (SNo_mul_SNo x y Hx1 Hy1)
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1)
                              (SNo_mul_SNo w''' z' Hw'''1 Hz'1))
                          (SNo_add_SNo_3 (w''' * y) (x * z') (w' * w'')
                              (SNo_mul_SNo w''' y Hw'''1 Hy1)
                              (SNo_mul_SNo x z' Hx1 Hz'1)
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1)).
          - prove w' * y + x * w'' + w''' * z' < x * y + w' * w'' + w''' * z'.
            rewrite add_SNo_rotate_3_1 (w' * y) (x * w'') (w''' * z')
                              (SNo_mul_SNo w' y Hw'1 Hy1)
                              (SNo_mul_SNo x w'' Hx1 Hw''1)
                              (SNo_mul_SNo w''' z' Hw'''1 Hz'1).
            rewrite add_SNo_rotate_3_1 (x * y) (w' * w'') (w''' * z')
                              (SNo_mul_SNo x y Hx1 Hy1)
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1)
                              (SNo_mul_SNo w''' z' Hw'''1 Hz'1).
            prove w''' * z' + w' * y + x * w'' < w''' * z' + x * y + w' * w''.
            apply add_SNo_Lt2 (w''' * z') (w' * y + x * w'') (x * y + w' * w'')
                              (SNo_mul_SNo w''' z' Hw'''1 Hz'1)
                              (SNo_add_SNo (w' * y) (x * w'')
                               (SNo_mul_SNo w' y Hw'1 Hy1)
                               (SNo_mul_SNo x w'' Hx1 Hw''1))
                              (SNo_add_SNo (x * y) (w' * w'')
                               (SNo_mul_SNo x y Hx1 Hy1)
                               (SNo_mul_SNo w' w'' Hw'1 Hw''1)).
            prove w' * y + x * w'' < x * y + w' * w''.
            exact mul_SNo_Lt x y w' w'' Hx1 Hy1 Hw'1 Hw''1 Hw'2 Hw''2.
          - prove x * y + w' * w'' + w''' * z' < w''' * y + x * z' + w' * w''.
            rewrite add_SNo_com_3_0_1 (x * y) (w' * w'') (w''' * z')
                              (SNo_mul_SNo x y Hx1 Hy1)
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1)
                              (SNo_mul_SNo w''' z' Hw'''1 Hz'1).
            rewrite add_SNo_rotate_3_1 (w''' * y) (x * z') (w' * w'')
                              (SNo_mul_SNo w''' y Hw'''1 Hy1)
                              (SNo_mul_SNo x z' Hx1 Hz'1)
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1).
            prove w' * w'' + x * y + w''' * z' < w' * w'' + w''' * y + x * z'.
            apply add_SNo_Lt2 (w' * w'') (x * y + w''' * z') (w''' * y + x * z')
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1)
                              (SNo_add_SNo (x * y) (w''' * z')
                               (SNo_mul_SNo x y Hx1 Hy1)
                               (SNo_mul_SNo w''' z' Hw'''1 Hz'1))
                              (SNo_add_SNo (w''' * y) (x * z')
                               (SNo_mul_SNo w''' y Hw'''1 Hy1)
                               (SNo_mul_SNo x z' Hx1 Hz'1)).
            prove x * y + w''' * z' < w''' * y + x * z'.
            rewrite add_SNo_com (x * y) (w''' * z')
                                (SNo_mul_SNo x y Hx1 Hy1)
                                (SNo_mul_SNo w''' z' Hw'''1 Hz'1).
            rewrite add_SNo_com (w''' * y) (x * z')
                                (SNo_mul_SNo w''' y Hw'''1 Hy1)
                                (SNo_mul_SNo x z' Hx1 Hz'1).
            prove w''' * z' + x * y  < x * z' + w''' * y.
            exact mul_SNo_Lt x z' w''' y Hx1 Hz'1 Hw'''1 Hy1 Hw'''2 Hz'2.
        }
      * { assume Hz: z :e RxLy'.
          apply RxLy'E z Hz.
          let z'. assume Hz': z' :e Rx.
          let w'''. assume Hw''': w''' :e Ly.
          assume Hz'1: SNo z'.
          assume Hw'''1: SNo w'''.
          assume Hz'2: x < z'.
          assume Hw'''2: w''' < y.
          assume Hze. rewrite Hze.
          prove w' * y + x * w'' + - w' * w'' < z' * y + x * w''' + - z' * w'''.
          apply add_SNo_minus_Lt12b3 (w' * y) (x * w'') (w' * w'') (z' * y) (x * w''') (z' * w''')
                       (SNo_mul_SNo w' y Hw'1 Hy1)
                       (SNo_mul_SNo x w'' Hx1 Hw''1)
                       (SNo_mul_SNo w' w'' Hw'1 Hw''1)
                       (SNo_mul_SNo z' y Hz'1 Hy1)
                       (SNo_mul_SNo x w''' Hx1 Hw'''1)
                       (SNo_mul_SNo z' w''' Hz'1 Hw'''1).
          prove w' * y + x * w'' + z' * w''' < z' * y + x * w''' + w' * w''.
          apply SNoLt_tra (w' * y + x * w'' + z' * w''')
                          (z' * w''' + x * y + w' * w'')
                          (z' * y + x * w''' + w' * w'')
                          (SNo_add_SNo_3 (w' * y) (x * w'') (z' * w''')
                              (SNo_mul_SNo w' y Hw'1 Hy1)
                              (SNo_mul_SNo x w'' Hx1 Hw''1)
                              (SNo_mul_SNo z' w''' Hz'1 Hw'''1))
                          (SNo_add_SNo_3 (z' * w''') (x * y) (w' * w'')
                              (SNo_mul_SNo z' w''' Hz'1 Hw'''1)
                              (SNo_mul_SNo x y Hx1 Hy1)
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1))
                          (SNo_add_SNo_3 (z' * y) (x * w''') (w' * w'')
                              (SNo_mul_SNo z' y Hz'1 Hy1)
                              (SNo_mul_SNo x w''' Hx1 Hw'''1)
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1)).
          - prove w' * y + x * w'' + z' * w''' < z' * w''' + x * y + w' * w''.
            rewrite add_SNo_rotate_3_1 (w' * y) (x * w'') (z' * w''')
                              (SNo_mul_SNo w' y Hw'1 Hy1)
                              (SNo_mul_SNo x w'' Hx1 Hw''1)
                              (SNo_mul_SNo z' w''' Hz'1 Hw'''1).
            prove z' * w''' + w' * y + x * w'' < z' * w''' + x * y + w' * w''.
            apply add_SNo_Lt2 (z' * w''') (w' * y + x * w'') (x * y + w' * w'')
                              (SNo_mul_SNo z' w''' Hz'1 Hw'''1)
                              (SNo_add_SNo (w' * y) (x * w'')
                               (SNo_mul_SNo w' y Hw'1 Hy1)
                               (SNo_mul_SNo x w'' Hx1 Hw''1))
                              (SNo_add_SNo (x * y) (w' * w'')
                               (SNo_mul_SNo x y Hx1 Hy1)
                               (SNo_mul_SNo w' w'' Hw'1 Hw''1)).
            prove w' * y + x * w'' < x * y + w' * w''.
            exact mul_SNo_Lt x y w' w'' Hx1 Hy1 Hw'1 Hw''1 Hw'2 Hw''2.
          - prove z' * w''' + x * y + w' * w'' < z' * y + x * w''' + w' * w''.
            rewrite add_SNo_rotate_3_1 (z' * w''') (x * y) (w' * w'')
                              (SNo_mul_SNo z' w''' Hz'1 Hw'''1)
                              (SNo_mul_SNo x y Hx1 Hy1)
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1).
            rewrite add_SNo_rotate_3_1 (z' * y) (x * w''') (w' * w'')
                              (SNo_mul_SNo z' y Hz'1 Hy1)
                              (SNo_mul_SNo x w''' Hx1 Hw'''1)
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1).
            prove w' * w'' + z' * w''' + x * y < w' * w'' + z' * y + x * w'''.
            apply add_SNo_Lt2 (w' * w'') (z' * w''' + x * y) (z' * y + x * w''')
                              (SNo_mul_SNo w' w'' Hw'1 Hw''1)
                              (SNo_add_SNo (z' * w''') (x * y)
                               (SNo_mul_SNo z' w''' Hz'1 Hw'''1)
                               (SNo_mul_SNo x y Hx1 Hy1))
                              (SNo_add_SNo (z' * y) (x * w''')
                               (SNo_mul_SNo z' y Hz'1 Hy1)
                               (SNo_mul_SNo x w''' Hx1 Hw'''1)).
            prove z' * w''' + x * y < z' * y + x * w'''.
            rewrite add_SNo_com (z' * w''') (x * y)
                                (SNo_mul_SNo z' w''' Hz'1 Hw'''1)
                                (SNo_mul_SNo x y Hx1 Hy1).
            prove x * y + z' * w''' < z' * y + x * w'''.
            exact mul_SNo_Lt z' y x w''' Hz'1 Hy1 Hx1 Hw'''1 Hz'2 Hw'''2.
        }
    + assume Hw: w :e RxRy'.
      apply RxRy'E w Hw.
      let z'. assume Hz': z' :e Rx.
      let z''. assume Hz'': z'' :e Ry.
      assume Hz'1: SNo z'.
      assume Hz''1: SNo z''.
      assume Hz'2: x < z'.
      assume Hz''2: y < z''.
      assume Hwe. rewrite Hwe.
      let z. apply binunionE'.
      * { assume Hz: z :e LxRy'.
          apply LxRy'E z Hz.
          let w'. assume Hw': w' :e Lx.
          let z'''. assume Hz''': z''' :e Ry.
          assume Hw'1: SNo w'.
          assume Hz'''1: SNo z'''.
          assume Hw'2: w' < x.
          assume Hz'''2: y < z'''.
          assume Hze. rewrite Hze.
          prove z' * y + x * z'' + - z' * z'' < w' * y + x * z''' + - w' * z'''.
          apply add_SNo_minus_Lt12b3 (z' * y) (x * z'') (z' * z'') (w' * y) (x * z''') (w' * z''')
                       (SNo_mul_SNo z' y Hz'1 Hy1)
                       (SNo_mul_SNo x z'' Hx1 Hz''1)
                       (SNo_mul_SNo z' z'' Hz'1 Hz''1)
                       (SNo_mul_SNo w' y Hw'1 Hy1)
                       (SNo_mul_SNo x z''' Hx1 Hz'''1)
                       (SNo_mul_SNo w' z''' Hw'1 Hz'''1).
          prove z' * y + x * z'' + w' * z''' < w' * y + x * z''' + z' * z''.
          apply SNoLt_tra (z' * y + x * z'' + w' * z''')
                          (w' * z''' + z' * z'' + x * y)
                          (w' * y + x * z''' + z' * z'')
                          (SNo_add_SNo_3 (z' * y) (x * z'') (w' * z''')
                              (SNo_mul_SNo z' y Hz'1 Hy1)
                              (SNo_mul_SNo x z'' Hx1 Hz''1)
                              (SNo_mul_SNo w' z''' Hw'1 Hz'''1))
                          (SNo_add_SNo_3 (w' * z''') (z' * z'') (x * y)
                              (SNo_mul_SNo w' z''' Hw'1 Hz'''1)
                              (SNo_mul_SNo z' z'' Hz'1 Hz''1)
                              (SNo_mul_SNo x y Hx1 Hy1))
                          (SNo_add_SNo_3 (w' * y) (x * z''') (z' * z'')
                              (SNo_mul_SNo w' y Hw'1 Hy1)
                              (SNo_mul_SNo x z''' Hx1 Hz'''1)
                              (SNo_mul_SNo z' z'' Hz'1 Hz''1)).
          - prove z' * y + x * z'' + w' * z''' < w' * z''' + z' * z'' + x * y.
            rewrite add_SNo_rotate_3_1 (z' * y) (x * z'') (w' * z''')
                              (SNo_mul_SNo z' y Hz'1 Hy1)
                              (SNo_mul_SNo x z'' Hx1 Hz''1)
                              (SNo_mul_SNo w' z''' Hw'1 Hz'''1).
            prove w' * z''' + z' * y + x * z'' < w' * z''' + z' * z'' + x * y.
            apply add_SNo_Lt2 (w' * z''') (z' * y + x * z'') (z' * z'' + x * y)
                              (SNo_mul_SNo w' z''' Hw'1 Hz'''1)
                              (SNo_add_SNo (z' * y) (x * z'')
                               (SNo_mul_SNo z' y Hz'1 Hy1)
                               (SNo_mul_SNo x z'' Hx1 Hz''1))
                              (SNo_add_SNo (z' * z'') (x * y)
                               (SNo_mul_SNo z' z'' Hz'1 Hz''1)
                               (SNo_mul_SNo x y Hx1 Hy1)).
            prove z' * y + x * z'' < z' * z'' + x * y.
            rewrite add_SNo_com (z' * y) (x * z'')
                                (SNo_mul_SNo z' y Hz'1 Hy1)
                                (SNo_mul_SNo x z'' Hx1 Hz''1).
            exact mul_SNo_Lt z' z'' x y Hz'1 Hz''1 Hx1 Hy1 Hz'2 Hz''2.
          - prove w' * z''' + z' * z'' + x * y < w' * y + x * z''' + z' * z''.
            rewrite add_SNo_com_3_0_1 (w' * z''') (z' * z'') (x * y)
                              (SNo_mul_SNo w' z''' Hw'1 Hz'''1)
                              (SNo_mul_SNo z' z'' Hz'1 Hz''1)
                              (SNo_mul_SNo x y Hx1 Hy1).
            rewrite add_SNo_rotate_3_1 (w' * y) (x * z''') (z' * z'')
                              (SNo_mul_SNo w' y Hw'1 Hy1)
                              (SNo_mul_SNo x z''' Hx1 Hz'''1)
                              (SNo_mul_SNo z' z'' Hz'1 Hz''1).
            prove z' * z'' + w' * z''' + x * y < z' * z'' + w' * y + x * z'''.
            apply add_SNo_Lt2 (z' * z'') (w' * z''' + x * y) (w' * y + x * z''')
                              (SNo_mul_SNo z' z'' Hz'1 Hz''1)
                              (SNo_add_SNo (w' * z''') (x * y)
                               (SNo_mul_SNo w' z''' Hw'1 Hz'''1)
                               (SNo_mul_SNo x y Hx1 Hy1))
                              (SNo_add_SNo (w' * y) (x * z''')
                               (SNo_mul_SNo w' y Hw'1 Hy1)
                               (SNo_mul_SNo x z''' Hx1 Hz'''1)).
            prove w' * z''' + x * y < w' * y + x * z'''.
            rewrite add_SNo_com (w' * y) (x * z''')
                                (SNo_mul_SNo w' y Hw'1 Hy1)
                                (SNo_mul_SNo x z''' Hx1 Hz'''1).
            exact mul_SNo_Lt x z''' w' y Hx1 Hz'''1 Hw'1 Hy1 Hw'2 Hz'''2.
        }
      * { assume Hz: z :e RxLy'.
          apply RxLy'E z Hz.
          let z'''. assume Hz''': z''' :e Rx.
          let w'. assume Hw': w' :e Ly.
          assume Hz'''1: SNo z'''.
          assume Hw'1: SNo w'.
          assume Hz'''2: x < z'''.
          assume Hw'2: w' < y.
          assume Hze. rewrite Hze.
          prove z' * y + x * z'' + - z' * z'' < z''' * y + x * w' + - z''' * w'.
          apply add_SNo_minus_Lt12b3 (z' * y) (x * z'') (z' * z'') (z''' * y) (x * w') (z''' * w')
                       (SNo_mul_SNo z' y Hz'1 Hy1)
                       (SNo_mul_SNo x z'' Hx1 Hz''1)
                       (SNo_mul_SNo z' z'' Hz'1 Hz''1)
                       (SNo_mul_SNo z''' y Hz'''1 Hy1)
                       (SNo_mul_SNo x w' Hx1 Hw'1)
                       (SNo_mul_SNo z''' w' Hz'''1 Hw'1).
          prove z' * y + x * z'' + z''' * w' < z''' * y + x * w' + z' * z''.
          apply SNoLt_tra (z' * y + x * z'' + z''' * w')
                          (z''' * w' + z' * z'' + x * y)
                          (z''' * y + x * w' + z' * z'')        
                          (SNo_add_SNo_3 (z' * y) (x * z'') (z''' * w')
                              (SNo_mul_SNo z' y Hz'1 Hy1)
                              (SNo_mul_SNo x z'' Hx1 Hz''1)
                              (SNo_mul_SNo z''' w' Hz'''1 Hw'1))
                          (SNo_add_SNo_3 (z''' * w') (z' * z'') (x * y)
                              (SNo_mul_SNo z''' w' Hz'''1 Hw'1)
                              (SNo_mul_SNo z' z'' Hz'1 Hz''1)
                              (SNo_mul_SNo x y Hx1 Hy1))
                          (SNo_add_SNo_3 (z''' * y) (x * w') (z' * z'')
                              (SNo_mul_SNo z''' y Hz'''1 Hy1)
                              (SNo_mul_SNo x w' Hx1 Hw'1)
                              (SNo_mul_SNo z' z'' Hz'1 Hz''1)).
          - prove z' * y + x * z'' + z''' * w' < z''' * w' + z' * z'' + x * y.
            rewrite add_SNo_rotate_3_1 (z' * y) (x * z'') (z''' * w')
                              (SNo_mul_SNo z' y Hz'1 Hy1)
                              (SNo_mul_SNo x z'' Hx1 Hz''1)
                              (SNo_mul_SNo z''' w' Hz'''1 Hw'1).
            rewrite add_SNo_com (z' * y) (x * z'')
                                (SNo_mul_SNo z' y Hz'1 Hy1)
                                (SNo_mul_SNo x z'' Hx1 Hz''1).
            prove z''' * w' + x * z'' + z' * y < z''' * w' + z' * z'' + x * y.
            apply add_SNo_Lt2 (z''' * w') (x * z'' + z' * y) (z' * z'' + x * y)
                              (SNo_mul_SNo z''' w' Hz'''1 Hw'1)
                              (SNo_add_SNo (x * z'') (z' * y)
                               (SNo_mul_SNo x z'' Hx1 Hz''1)
                               (SNo_mul_SNo z' y Hz'1 Hy1))
                              (SNo_add_SNo (z' * z'') (x * y)
                               (SNo_mul_SNo z' z'' Hz'1 Hz''1)
                               (SNo_mul_SNo x y Hx1 Hy1)).
            prove x * z'' + z' * y < z' * z'' + x * y.
            exact mul_SNo_Lt z' z'' x y Hz'1 Hz''1 Hx1 Hy1 Hz'2 Hz''2.
          - prove z''' * w' + z' * z'' + x * y < z''' * y + x * w' + z' * z''.
            rewrite add_SNo_com_3_0_1 (z''' * w') (z' * z'') (x * y)
                              (SNo_mul_SNo z''' w' Hz'''1 Hw'1)
                              (SNo_mul_SNo z' z'' Hz'1 Hz''1)
                              (SNo_mul_SNo x y Hx1 Hy1).
            rewrite add_SNo_rotate_3_1 (z''' * y) (x * w') (z' * z'')
                              (SNo_mul_SNo z''' y Hz'''1 Hy1)
                              (SNo_mul_SNo x w' Hx1 Hw'1)
                              (SNo_mul_SNo z' z'' Hz'1 Hz''1).
            prove z' * z'' + z''' * w' + x * y < z' * z'' + z''' * y + x * w'.
            apply add_SNo_Lt2 (z' * z'') (z''' * w' + x * y) (z''' * y + x * w')
                              (SNo_mul_SNo z' z'' Hz'1 Hz''1)
                              (SNo_add_SNo (z''' * w') (x * y)
                               (SNo_mul_SNo z''' w' Hz'''1 Hw'1)
                               (SNo_mul_SNo x y Hx1 Hy1))
                              (SNo_add_SNo (z''' * y) (x * w')
                               (SNo_mul_SNo z''' y Hz'''1 Hy1)
                               (SNo_mul_SNo x w' Hx1 Hw'1)).
            prove z''' * w' + x * y < z''' * y + x * w'.
            rewrite add_SNo_com (z''' * w') (x * y)
                               (SNo_mul_SNo z''' w' Hz'''1 Hw'1)
                               (SNo_mul_SNo x y Hx1 Hy1).
            exact mul_SNo_Lt z''' y x w' Hz'''1 Hy1 Hx1 Hw'1 Hz'''2 Hw'2.
        }
}
claim Lxyeq: x * y = SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
{ set v := SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
  apply SNoCutP_SNoCut_impred (LxLy' :\/: RxRy') (LxRy' :\/: RxLy') L1.
  assume Hv1: SNo v.
  assume Hv2: SNoLev v :e ordsucc ((\/_ w :e LxLy' :\/: RxRy', ordsucc (SNoLev w)) :\/: (\/_ z :e LxRy' :\/: RxLy', ordsucc (SNoLev z))).
  assume Hv3: forall w :e LxLy' :\/: RxRy', w < v.
  assume Hv4: forall z :e LxRy' :\/: RxLy', v < z.
  assume Hv5: forall u, SNo u -> (forall w :e LxLy' :\/: RxRy', w < u) -> (forall z :e LxRy' :\/: RxLy', u < z) -> SNoLev v c= SNoLev u /\ SNoEq_ (SNoLev v) v u.
  apply mul_SNo_eq_3 x y Hx1 Hy1.
  let L' R'.
  assume HLR': SNoCutP L' R'.
  assume HL'E: forall u, u :e L' ->
               forall q:prop,
                  (forall w0 :e SNoL x, forall w1 :e SNoL y, u = w0 * y + x * w1 + - w0 * w1 -> q)
               -> (forall z0 :e SNoR x, forall z1 :e SNoR y, u = z0 * y + x * z1 + - z0 * z1 -> q)
               -> q.
  assume HL'I1: forall w0 :e SNoL x, forall w1 :e SNoL y, w0 * y + x * w1 + - w0 * w1 :e L'.
  assume HL'I2: forall z0 :e SNoR x, forall z1 :e SNoR y, z0 * y + x * z1 + - z0 * z1 :e L'.
  assume HR'E: forall u, u :e R' ->
               forall q:prop,
                    (forall w0 :e SNoL x, forall z1 :e SNoR y, u = w0 * y + x * z1 + - w0 * z1 -> q)
                 -> (forall z0 :e SNoR x, forall w1 :e SNoL y, u = z0 * y + x * w1 + - z0 * w1 -> q)
                 -> q.
  assume HR'I1: forall w0 :e SNoL x, forall z1 :e SNoR y, w0 * y + x * z1 + - w0 * z1 :e R'.
  assume HR'I2: forall z0 :e SNoR x, forall w1 :e SNoL y, z0 * y + x * w1 + - z0 * w1 :e R'.
  assume HLR'eq: x * y = SNoCut L' R'.
  rewrite HLR'eq.
  apply SNoCut_ext L' R' (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
  - exact HLR'.
  - exact L1.
  - prove forall w :e L', w < v.
    let w. assume Hw.
    apply HL'E w Hw.
    + let w0. assume Hw0: w0 :e SNoL x.
      let w1. assume Hw1: w1 :e SNoL y.
      assume Hwe. rewrite Hwe.
      prove w0 * y + x * w1 + - w0 * w1 < v.
      apply SNoL_E x Hx1 w0 Hw0.
      assume Hw0a Hw0b Hw0c.
      apply SNoL_E y Hy1 w1 Hw1.
      assume Hw1a Hw1b Hw1c.
      claim L2: exists w0' :e Lx, w0 <= w0'.
      { apply dneg.
        assume HC.
        claim L2a: SNoLev x c= SNoLev w0 /\ SNoEq_ (SNoLev x) x w0.
        { apply Hx5 w0 Hw0a.
          - prove forall w' :e Lx, w' < w0.
            let w'. assume Hw'.
            apply SNoLtLe_or w' w0 (HLRx1 w' Hw') Hw0a.
            + assume H. exact H.
            + assume H: w0 <= w'. prove False.
              apply HC. witness w'. apply andI.
              * exact Hw'.
              * prove w0 <= w'. exact H.
          - prove forall z' :e Rx, w0 < z'.
            let z'. assume Hz'.
            apply SNoLt_tra w0 x z' Hw0a Hx1 (HLRx2 z' Hz').
            + prove w0 < x. exact Hw0c.
            + prove x < z'. exact Hx4 z' Hz'.
        }
        apply L2a.
        assume Hxw0: SNoLev x c= SNoLev w0. assume _.
        apply In_irref (SNoLev w0).
        prove SNoLev w0 :e SNoLev w0.
        apply Hxw0. exact Hw0b.
      }
      claim L3: exists w1' :e Ly, w1 <= w1'.
      { apply dneg.
        assume HC.
        claim L3a: SNoLev y c= SNoLev w1 /\ SNoEq_ (SNoLev y) y w1.
        { apply Hy5 w1 Hw1a.
          - prove forall w' :e Ly, w' < w1.
            let w'. assume Hw'.
            apply SNoLtLe_or w' w1 (HLRy1 w' Hw') Hw1a.
            + assume H. exact H.
            + assume H: w1 <= w'. prove False.
              apply HC. witness w'. apply andI.
              * exact Hw'.
              * prove w1 <= w'. exact H.
          - prove forall z' :e Ry, w1 < z'.
            let z'. assume Hz'.
            apply SNoLt_tra w1 y z' Hw1a Hy1 (HLRy2 z' Hz').
            + prove w1 < y. exact Hw1c.
            + prove y < z'. exact Hy4 z' Hz'.
        }
        apply L3a.
        assume Hyw1: SNoLev y c= SNoLev w1. assume _.
        apply In_irref (SNoLev w1).
        prove SNoLev w1 :e SNoLev w1.
        apply Hyw1. exact Hw1b.
      }
      apply L2.
      let w0'. assume H. apply H.
      assume Hw0'1: w0' :e Lx.
      assume Hw0'2: w0 <= w0'.
      apply L3.
      let w1'. assume H. apply H.
      assume Hw1'1: w1' :e Ly.
      assume Hw1'2: w1 <= w1'.
      prove w0 * y + x * w1 + - w0 * w1 < v.
      apply SNoLeLt_tra (w0 * y + x * w1 + - w0 * w1)
                        (w0' * y + x * w1' + - w0' * w1')
                        v
                        (SNo_add_SNo_3 (w0 * y) (x * w1) (- w0 * w1)
                           (SNo_mul_SNo w0 y Hw0a Hy1)
                           (SNo_mul_SNo x w1 Hx1 Hw1a)
                           (SNo_minus_SNo (w0 * w1) (SNo_mul_SNo w0 w1 Hw0a Hw1a)))
                        (SNo_add_SNo_3 (w0' * y) (x * w1') (- w0' * w1')
                           (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                           (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                           (SNo_minus_SNo (w0' * w1') (SNo_mul_SNo w0' w1' (HLRx1 w0' Hw0'1) (HLRy1 w1' Hw1'1))))
                        Hv1.
      * { prove w0 * y + x * w1 + - w0 * w1 <= w0' * y + x * w1' + - w0' * w1'.
          apply add_SNo_minus_Le12b3 (w0 * y) (x * w1) (w0 * w1) (w0' * y) (x * w1') (w0' * w1')
                           (SNo_mul_SNo w0 y Hw0a Hy1)
                           (SNo_mul_SNo x w1 Hx1 Hw1a)
                           (SNo_mul_SNo w0 w1 Hw0a Hw1a)
                           (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                           (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                           (SNo_mul_SNo w0' w1' (HLRx1 w0' Hw0'1) (HLRy1 w1' Hw1'1)).
          prove w0 * y + x * w1 + w0' * w1' <= w0' * y + x * w1' + w0 * w1.
          apply SNoLe_tra (w0 * y + x * w1 + w0' * w1')
                          (w0 * y + x * w1' + w0' * w1)
                          (w0' * y + x * w1' + w0 * w1)
                          (SNo_add_SNo_3 (w0 * y) (x * w1) (w0' * w1')
                           (SNo_mul_SNo w0 y Hw0a Hy1)
                           (SNo_mul_SNo x w1 Hx1 Hw1a)
                           (SNo_mul_SNo w0' w1' (HLRx1 w0' Hw0'1) (HLRy1 w1' Hw1'1)))
                          (SNo_add_SNo_3 (w0 * y) (x * w1') (w0' * w1)
                           (SNo_mul_SNo w0 y Hw0a Hy1)
                           (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                           (SNo_mul_SNo w0' w1 (HLRx1 w0' Hw0'1) Hw1a))
                          (SNo_add_SNo_3 (w0' * y) (x * w1') (w0 * w1)
                           (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                           (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                           (SNo_mul_SNo w0 w1 Hw0a Hw1a)).
          - prove w0 * y + x * w1 + w0' * w1' <= w0 * y + x * w1' + w0' * w1.
            apply add_SNo_Le2 (w0 * y) (x * w1 + w0' * w1') (x * w1' + w0' * w1)
                              (SNo_mul_SNo w0 y Hw0a Hy1)
                              (SNo_add_SNo (x * w1) (w0' * w1')
                               (SNo_mul_SNo x w1 Hx1 Hw1a)
                               (SNo_mul_SNo w0' w1' (HLRx1 w0' Hw0'1) (HLRy1 w1' Hw1'1)))
                              (SNo_add_SNo (x * w1') (w0' * w1)
                               (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                               (SNo_mul_SNo w0' w1 (HLRx1 w0' Hw0'1) Hw1a)).
            prove x * w1 + w0' * w1' <= x * w1' + w0' * w1.
            rewrite add_SNo_com (x * w1) (w0' * w1')
                                (SNo_mul_SNo x w1 Hx1 Hw1a)
                                (SNo_mul_SNo w0' w1' (HLRx1 w0' Hw0'1) (HLRy1 w1' Hw1'1)).
            prove w0' * w1' + x * w1 <= x * w1' + w0' * w1.
            apply mul_SNo_Le x w1' w0' w1 Hx1 (HLRy1 w1' Hw1'1) (HLRx1 w0' Hw0'1) Hw1a.
            + prove w0' <= x. apply SNoLtLe. prove w0' < x. exact Hx3 w0' Hw0'1.
            + prove w1 <= w1'. exact Hw1'2.
          - prove w0 * y + x * w1' + w0' * w1 <= w0' * y + x * w1' + w0 * w1.
            rewrite add_SNo_com_3_0_1 (w0 * y) (x * w1') (w0' * w1)
                              (SNo_mul_SNo w0 y Hw0a Hy1)
                              (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                              (SNo_mul_SNo w0' w1 (HLRx1 w0' Hw0'1) Hw1a).
            rewrite add_SNo_com_3_0_1 (w0' * y) (x * w1') (w0 * w1)
                           (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                           (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                           (SNo_mul_SNo w0 w1 Hw0a Hw1a).
            apply add_SNo_Le2 (x * w1') (w0 * y + w0' * w1) (w0' * y + w0 * w1)
                              (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                              (SNo_add_SNo (w0 * y) (w0' * w1)
                                (SNo_mul_SNo w0 y Hw0a Hy1)
                                (SNo_mul_SNo w0' w1 (HLRx1 w0' Hw0'1) Hw1a))
                              (SNo_add_SNo (w0' * y) (w0 * w1)
                               (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                               (SNo_mul_SNo w0 w1 Hw0a Hw1a)).
            prove w0 * y + w0' * w1 <= w0' * y + w0 * w1.
            apply mul_SNo_Le w0' y w0 w1 (HLRx1 w0' Hw0'1) Hy1 Hw0a Hw1a.
            + prove w0 <= w0'. exact Hw0'2.
            + prove w1 <= y. apply SNoLtLe. exact Hw1c.
        }
      * { prove w0' * y + x * w1' + - w0' * w1' < v.
          apply Hv3.
          prove w0' * y + x * w1' + - w0' * w1' :e LxLy' :\/: RxRy'.
          apply binunionI1.
          apply LxLy'I.
          - exact Hw0'1.
          - exact Hw1'1.
        }
    + let z0. assume Hz0: z0 :e SNoR x.
      let z1. assume Hz1: z1 :e SNoR y.
      assume Hwe. rewrite Hwe.
      prove z0 * y + x * z1 + - z0 * z1 < v.
      apply SNoR_E x Hx1 z0 Hz0.
      assume Hz0a Hz0b Hz0c.
      apply SNoR_E y Hy1 z1 Hz1.
      assume Hz1a Hz1b Hz1c.
      claim L4: exists z0' :e Rx, z0' <= z0.
      { apply dneg.
        assume HC.
        claim L4a: SNoLev x c= SNoLev z0 /\ SNoEq_ (SNoLev x) x z0.
        { apply Hx5 z0 Hz0a.
          - prove forall w' :e Lx, w' < z0.
            let w'. assume Hw'.
            apply SNoLt_tra w' x z0 (HLRx1 w' Hw') Hx1 Hz0a.
            + prove w' < x. exact Hx3 w' Hw'.
            + prove x < z0. exact Hz0c.
          - prove forall z' :e Rx, z0 < z'.
            let z'. assume Hz'.
            apply SNoLtLe_or z0 z' Hz0a (HLRx2 z' Hz').
            + assume H. exact H.
            + assume H: z' <= z0. prove False.
              apply HC. witness z'. apply andI.
              * exact Hz'.
              * prove z' <= z0. exact H.
        }
        apply L4a.
        assume Hxz0: SNoLev x c= SNoLev z0. assume _.
        apply In_irref (SNoLev z0).
        prove SNoLev z0 :e SNoLev z0.
        apply Hxz0. exact Hz0b.
      }
      claim L5: exists z1' :e Ry, z1' <= z1.
      { apply dneg.
        assume HC.
        claim L5a: SNoLev y c= SNoLev z1 /\ SNoEq_ (SNoLev y) y z1.
        { apply Hy5 z1 Hz1a.
          - prove forall w' :e Ly, w' < z1.
            let w'. assume Hw'.
            apply SNoLt_tra w' y z1 (HLRy1 w' Hw') Hy1 Hz1a.
            + prove w' < y. exact Hy3 w' Hw'.
            + prove y < z1. exact Hz1c.
          - prove forall z' :e Ry, z1 < z'.
            let z'. assume Hz'.
            apply SNoLtLe_or z1 z' Hz1a (HLRy2 z' Hz').
            + assume H. exact H.
            + assume H: z' <= z1. prove False.
              apply HC. witness z'. apply andI.
              * exact Hz'.
              * prove z' <= z1. exact H.
        }
        apply L5a.
        assume Hyz1: SNoLev y c= SNoLev z1. assume _.
        apply In_irref (SNoLev z1).
        prove SNoLev z1 :e SNoLev z1.
        apply Hyz1. exact Hz1b.
      }
      apply L4.
      let z0'. assume H. apply H.
      assume Hz0'1: z0' :e Rx.
      assume Hz0'2: z0' <= z0.
      apply L5.
      let z1'. assume H. apply H.
      assume Hz1'1: z1' :e Ry.
      assume Hz1'2: z1' <= z1.
      prove z0 * y + x * z1 + - z0 * z1 < v.
      apply SNoLeLt_tra (z0 * y + x * z1 + - z0 * z1)
                        (z0' * y + x * z1' + - z0' * z1')
                        v
                        (SNo_add_SNo_3 (z0 * y) (x * z1) (- z0 * z1)
                           (SNo_mul_SNo z0 y Hz0a Hy1)
                           (SNo_mul_SNo x z1 Hx1 Hz1a)
                           (SNo_minus_SNo (z0 * z1) (SNo_mul_SNo z0 z1 Hz0a Hz1a)))
                        (SNo_add_SNo_3 (z0' * y) (x * z1') (- z0' * z1')
                           (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                           (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                           (SNo_minus_SNo (z0' * z1') (SNo_mul_SNo z0' z1' (HLRx2 z0' Hz0'1) (HLRy2 z1' Hz1'1))))
                        Hv1.
      * { prove z0 * y + x * z1 + - z0 * z1 <= z0' * y + x * z1' + - z0' * z1'.
          apply add_SNo_minus_Le12b3 (z0 * y) (x * z1) (z0 * z1) (z0' * y) (x * z1') (z0' * z1')
                           (SNo_mul_SNo z0 y Hz0a Hy1)
                           (SNo_mul_SNo x z1 Hx1 Hz1a)
                           (SNo_mul_SNo z0 z1 Hz0a Hz1a)
                           (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                           (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                           (SNo_mul_SNo z0' z1' (HLRx2 z0' Hz0'1) (HLRy2 z1' Hz1'1)).
          prove z0 * y + x * z1 + z0' * z1' <= z0' * y + x * z1' + z0 * z1.
          apply SNoLe_tra (z0 * y + x * z1 + z0' * z1')
                          (z0 * y + z0' * z1 + x * z1')
                          (z0' * y + x * z1' + z0 * z1)
                          (SNo_add_SNo_3 (z0 * y) (x * z1) (z0' * z1')
                           (SNo_mul_SNo z0 y Hz0a Hy1)
                           (SNo_mul_SNo x z1 Hx1 Hz1a)
                           (SNo_mul_SNo z0' z1' (HLRx2 z0' Hz0'1) (HLRy2 z1' Hz1'1)))
                          (SNo_add_SNo_3 (z0 * y) (z0' * z1) (x * z1')
                           (SNo_mul_SNo z0 y Hz0a Hy1)
                           (SNo_mul_SNo z0' z1 (HLRx2 z0' Hz0'1) Hz1a)
                           (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1)))
                          (SNo_add_SNo_3 (z0' * y) (x * z1') (z0 * z1)
                           (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                           (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                           (SNo_mul_SNo z0 z1 Hz0a Hz1a)).
          - prove z0 * y + x * z1 + z0' * z1' <= z0 * y + z0' * z1 + x * z1'.
            apply add_SNo_Le2 (z0 * y) (x * z1 + z0' * z1') (z0' * z1 + x * z1')
                              (SNo_mul_SNo z0 y Hz0a Hy1)
                              (SNo_add_SNo (x * z1) (z0' * z1')
                               (SNo_mul_SNo x z1 Hx1 Hz1a)
                               (SNo_mul_SNo z0' z1' (HLRx2 z0' Hz0'1) (HLRy2 z1' Hz1'1)))
                              (SNo_add_SNo (z0' * z1) (x * z1')
                               (SNo_mul_SNo z0' z1 (HLRx2 z0' Hz0'1) Hz1a)
                               (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))).
            prove x * z1 + z0' * z1' <= z0' * z1 + x * z1'.
            apply mul_SNo_Le z0' z1 x z1' (HLRx2 z0' Hz0'1) Hz1a Hx1 (HLRy2 z1' Hz1'1).
            + prove x <= z0'. apply SNoLtLe. prove x < z0'. exact Hx4 z0' Hz0'1.
            + prove z1' <= z1. exact Hz1'2.
          - prove z0 * y + z0' * z1 + x * z1' <= z0' * y + x * z1' + z0 * z1.
            rewrite add_SNo_rotate_3_1 (z0 * y) (z0' * z1) (x * z1')
                              (SNo_mul_SNo z0 y Hz0a Hy1)
                              (SNo_mul_SNo z0' z1 (HLRx2 z0' Hz0'1) Hz1a)
                              (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1)).
            rewrite add_SNo_com_3_0_1 (z0' * y) (x * z1') (z0 * z1)
                           (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                           (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                           (SNo_mul_SNo z0 z1 Hz0a Hz1a).
            prove x * z1' + z0 * y + z0' * z1 <= x * z1' + z0' * y + z0 * z1.
            apply add_SNo_Le2 (x * z1') (z0 * y + z0' * z1) (z0' * y + z0 * z1)
                              (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                              (SNo_add_SNo (z0 * y) (z0' * z1)
                                (SNo_mul_SNo z0 y Hz0a Hy1)
                                (SNo_mul_SNo z0' z1 (HLRx2 z0' Hz0'1) Hz1a))
                              (SNo_add_SNo (z0' * y) (z0 * z1)
                               (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                               (SNo_mul_SNo z0 z1 Hz0a Hz1a)).
            prove z0 * y + z0' * z1 <= z0' * y + z0 * z1.
            rewrite add_SNo_com (z0 * y) (z0' * z1) (SNo_mul_SNo z0 y Hz0a Hy1) (SNo_mul_SNo z0' z1 (HLRx2 z0' Hz0'1) Hz1a).
            rewrite add_SNo_com (z0' * y) (z0 * z1) (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1) (SNo_mul_SNo z0 z1 Hz0a Hz1a).
            apply mul_SNo_Le z0 z1 z0' y Hz0a Hz1a (HLRx2 z0' Hz0'1) Hy1.
            + prove z0' <= z0. exact Hz0'2.
            + prove y <= z1. apply SNoLtLe. exact Hz1c.
        }
      * { prove z0' * y + x * z1' + - z0' * z1' < v.
          apply Hv3.
          prove z0' * y + x * z1' + - z0' * z1' :e LxLy' :\/: RxRy'.
          apply binunionI2.
          apply RxRy'I.
          - exact Hz0'1.
          - exact Hz1'1.
        }
  - prove forall z :e R', v < z.
    let z. assume Hz.
    apply HR'E z Hz.
    + let w0. assume Hw0: w0 :e SNoL x.
      let z1. assume Hz1: z1 :e SNoR y.
      assume Hze. rewrite Hze.
      prove v < w0 * y + x * z1 + - w0 * z1.
      apply SNoL_E x Hx1 w0 Hw0.
      assume Hw0a Hw0b Hw0c.
      apply SNoR_E y Hy1 z1 Hz1.
      assume Hz1a Hz1b Hz1c.
      claim L6: exists w0' :e Lx, w0 <= w0'.
      { apply dneg.
        assume HC.
        claim L6a: SNoLev x c= SNoLev w0 /\ SNoEq_ (SNoLev x) x w0.
        { apply Hx5 w0 Hw0a.
          - prove forall w' :e Lx, w' < w0.
            let w'. assume Hw'.
            apply SNoLtLe_or w' w0 (HLRx1 w' Hw') Hw0a.
            + assume H. exact H.
            + assume H: w0 <= w'. prove False.
              apply HC. witness w'. apply andI.
              * exact Hw'.
              * prove w0 <= w'. exact H.
          - prove forall z' :e Rx, w0 < z'.
            let z'. assume Hz'.
            apply SNoLt_tra w0 x z' Hw0a Hx1 (HLRx2 z' Hz').
            + prove w0 < x. exact Hw0c.
            + prove x < z'. exact Hx4 z' Hz'.
        }
        apply L6a.
        assume Hxw0: SNoLev x c= SNoLev w0. assume _.
        apply In_irref (SNoLev w0).
        prove SNoLev w0 :e SNoLev w0.
        apply Hxw0. exact Hw0b.
      }
      claim L7: exists z1' :e Ry, z1' <= z1.
      { apply dneg.
        assume HC.
        claim L7a: SNoLev y c= SNoLev z1 /\ SNoEq_ (SNoLev y) y z1.
        { apply Hy5 z1 Hz1a.
          - prove forall w' :e Ly, w' < z1.
            let w'. assume Hw'.
            apply SNoLt_tra w' y z1 (HLRy1 w' Hw') Hy1 Hz1a.
            + prove w' < y. exact Hy3 w' Hw'.
            + prove y < z1. exact Hz1c.
          - prove forall z' :e Ry, z1 < z'.
            let z'. assume Hz'.
            apply SNoLtLe_or z1 z' Hz1a (HLRy2 z' Hz').
            + assume H. exact H.
            + assume H: z' <= z1. prove False.
              apply HC. witness z'. apply andI.
              * exact Hz'.
              * prove z' <= z1. exact H.
        }
        apply L7a.
        assume Hyz1: SNoLev y c= SNoLev z1. assume _.
        apply In_irref (SNoLev z1).
        prove SNoLev z1 :e SNoLev z1.
        apply Hyz1. exact Hz1b.
      }
      apply L6.
      let w0'. assume H. apply H.
      assume Hw0'1: w0' :e Lx.
      assume Hw0'2: w0 <= w0'.
      apply L7.
      let z1'. assume H. apply H.
      assume Hz1'1: z1' :e Ry.
      assume Hz1'2: z1' <= z1.
      prove v < w0 * y + x * z1 + - w0 * z1.
      apply SNoLtLe_tra v (w0' * y + x * z1' + - w0' * z1') (w0 * y + x * z1 + - w0 * z1)
                        Hv1
                        (SNo_add_SNo_3 (w0' * y) (x * z1') (- w0' * z1')
                                (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                                (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                                (SNo_minus_SNo (w0' * z1') (SNo_mul_SNo w0' z1' (HLRx1 w0' Hw0'1) (HLRy2 z1' Hz1'1))))
                        (SNo_add_SNo_3 (w0 * y) (x * z1) (- w0 * z1)
                                (SNo_mul_SNo w0 y Hw0a Hy1)
                                (SNo_mul_SNo x z1 Hx1 Hz1a)
                                (SNo_minus_SNo (w0 * z1) (SNo_mul_SNo w0 z1 Hw0a Hz1a))).
      * { prove v < w0' * y + x * z1' + - w0' * z1'.
          apply Hv4.
          prove w0' * y + x * z1' + - w0' * z1' :e LxRy' :\/: RxLy'.
          apply binunionI1.
          apply LxRy'I.
          - exact Hw0'1.
          - exact Hz1'1.
        }
      * { prove w0' * y + x * z1' + - w0' * z1' <= w0 * y + x * z1 + - w0 * z1.
          apply add_SNo_minus_Le12b3 (w0' * y) (x * z1') (w0' * z1') (w0 * y) (x * z1) (w0 * z1)
                           (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                           (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                           (SNo_mul_SNo w0' z1' (HLRx1 w0' Hw0'1) (HLRy2 z1' Hz1'1))
                           (SNo_mul_SNo w0 y Hw0a Hy1)
                           (SNo_mul_SNo x z1 Hx1 Hz1a)
                           (SNo_mul_SNo w0 z1 Hw0a Hz1a).
          prove w0' * y + x * z1' + w0 * z1 <= w0 * y + x * z1 + w0' * z1'.
          apply SNoLe_tra (w0' * y + x * z1' + w0 * z1)
                          (x * z1' + w0' * z1 + w0 * y)
                          (w0 * y + x * z1 + w0' * z1')
                          (SNo_add_SNo_3 (w0' * y) (x * z1') (w0 * z1)
                           (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                           (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                           (SNo_mul_SNo w0 z1 Hw0a Hz1a))
                          (SNo_add_SNo_3 (x * z1') (w0' * z1) (w0 * y)
                           (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                           (SNo_mul_SNo w0' z1 (HLRx1 w0' Hw0'1) Hz1a)
                           (SNo_mul_SNo w0 y Hw0a Hy1))
                          (SNo_add_SNo_3 (w0 * y) (x * z1) (w0' * z1')
                           (SNo_mul_SNo w0 y Hw0a Hy1)
                           (SNo_mul_SNo x z1 Hx1 Hz1a)
                           (SNo_mul_SNo w0' z1' (HLRx1 w0' Hw0'1) (HLRy2 z1' Hz1'1))).
          - prove w0' * y + x * z1' + w0 * z1 <= x * z1' + w0' * z1 + w0 * y.
            rewrite add_SNo_com_3_0_1 (w0' * y) (x * z1') (w0 * z1)
                           (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                           (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                           (SNo_mul_SNo w0 z1 Hw0a Hz1a).
            apply add_SNo_Le2 (x * z1') (w0' * y + w0 * z1) (w0' * z1 + w0 * y)
                              (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                              (SNo_add_SNo (w0' * y) (w0 * z1)
                               (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                               (SNo_mul_SNo w0 z1 Hw0a Hz1a))
                              (SNo_add_SNo (w0' * z1) (w0 * y)
                               (SNo_mul_SNo w0' z1 (HLRx1 w0' Hw0'1) Hz1a)
                               (SNo_mul_SNo w0 y Hw0a Hy1)).
            prove w0' * y + w0 * z1 <= w0' * z1 + w0 * y.
            rewrite add_SNo_com (w0' * y) (w0 * z1)
                                (SNo_mul_SNo w0' y (HLRx1 w0' Hw0'1) Hy1)
                                (SNo_mul_SNo w0 z1 Hw0a Hz1a).
            apply mul_SNo_Le w0' z1 w0 y (HLRx1 w0' Hw0'1) Hz1a Hw0a Hy1.
            + prove w0 <= w0'. exact Hw0'2.
            + prove y <= z1. apply SNoLtLe. prove y < z1. exact Hz1c.
          - prove x * z1' + w0' * z1 + w0 * y <= w0 * y + x * z1 + w0' * z1'.
            rewrite add_SNo_rotate_3_1 (x * z1') (w0' * z1) (w0 * y)
                              (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                              (SNo_mul_SNo w0' z1 (HLRx1 w0' Hw0'1) Hz1a)
                              (SNo_mul_SNo w0 y Hw0a Hy1).
            prove w0 * y + x * z1' + w0' * z1 <= w0 * y + x * z1 + w0' * z1'.
            apply add_SNo_Le2 (w0 * y) (x * z1' + w0' * z1) (x * z1 + w0' * z1')
                              (SNo_mul_SNo w0 y Hw0a Hy1)
                              (SNo_add_SNo (x * z1') (w0' * z1)
                               (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                               (SNo_mul_SNo w0' z1 (HLRx1 w0' Hw0'1) Hz1a))
                              (SNo_add_SNo (x * z1) (w0' * z1')
                               (SNo_mul_SNo x z1 Hx1 Hz1a)
                               (SNo_mul_SNo w0' z1' (HLRx1 w0' Hw0'1) (HLRy2 z1' Hz1'1))).
            prove x * z1' + w0' * z1 <= x * z1 + w0' * z1'.
            rewrite add_SNo_com (x * z1') (w0' * z1)
                                (SNo_mul_SNo x z1' Hx1 (HLRy2 z1' Hz1'1))
                                (SNo_mul_SNo w0' z1 (HLRx1 w0' Hw0'1) Hz1a).
            prove w0' * z1 + x * z1' <= x * z1 + w0' * z1'.
            apply mul_SNo_Le x z1 w0' z1' Hx1 Hz1a (HLRx1 w0' Hw0'1) (HLRy2 z1' Hz1'1).
            + prove w0' <= x. apply SNoLtLe. exact Hx3 w0' Hw0'1.
            + prove z1' <= z1. exact Hz1'2.
        }
    + let z0. assume Hz0: z0 :e SNoR x.
      let w1. assume Hw1: w1 :e SNoL y.
      assume Hze. rewrite Hze.
      prove v < z0 * y + x * w1 + - z0 * w1.
      apply SNoR_E x Hx1 z0 Hz0.
      assume Hz0a Hz0b Hz0c.
      apply SNoL_E y Hy1 w1 Hw1.
      assume Hw1a Hw1b Hw1c.
      claim L8: exists z0' :e Rx, z0' <= z0.
      { apply dneg.
        assume HC.
        claim L8a: SNoLev x c= SNoLev z0 /\ SNoEq_ (SNoLev x) x z0.
        { apply Hx5 z0 Hz0a.
          - prove forall w' :e Lx, w' < z0.
            let w'. assume Hw'.
            apply SNoLt_tra w' x z0 (HLRx1 w' Hw') Hx1 Hz0a.
            + prove w' < x. exact Hx3 w' Hw'.
            + prove x < z0. exact Hz0c.
          - prove forall z' :e Rx, z0 < z'.
            let z'. assume Hz'.
            apply SNoLtLe_or z0 z' Hz0a (HLRx2 z' Hz').
            + assume H. exact H.
            + assume H: z' <= z0. prove False.
              apply HC. witness z'. apply andI.
              * exact Hz'.
              * prove z' <= z0. exact H.
        }
        apply L8a.
        assume Hxz0: SNoLev x c= SNoLev z0. assume _.
        apply In_irref (SNoLev z0).
        prove SNoLev z0 :e SNoLev z0.
        apply Hxz0. exact Hz0b.
      }
      claim L9: exists w1' :e Ly, w1 <= w1'.
      { apply dneg.
        assume HC.
        claim L9a: SNoLev y c= SNoLev w1 /\ SNoEq_ (SNoLev y) y w1.
        { apply Hy5 w1 Hw1a.
          - prove forall w' :e Ly, w' < w1.
            let w'. assume Hw'.
            apply SNoLtLe_or w' w1 (HLRy1 w' Hw') Hw1a.
            + assume H. exact H.
            + assume H: w1 <= w'. prove False.
              apply HC. witness w'. apply andI.
              * exact Hw'.
              * prove w1 <= w'. exact H.
          - prove forall z' :e Ry, w1 < z'.
            let z'. assume Hz'.
            apply SNoLt_tra w1 y z' Hw1a Hy1 (HLRy2 z' Hz').
            + prove w1 < y. exact Hw1c.
            + prove y < z'. exact Hy4 z' Hz'.
        }
        apply L9a.
        assume Hyw1: SNoLev y c= SNoLev w1. assume _.
        apply In_irref (SNoLev w1).
        prove SNoLev w1 :e SNoLev w1.
        apply Hyw1. exact Hw1b.
      }
      apply L8.
      let z0'. assume H. apply H.
      assume Hz0'1: z0' :e Rx.
      assume Hz0'2: z0' <= z0.
      apply L9.
      let w1'. assume H. apply H.
      assume Hw1'1: w1' :e Ly.
      assume Hw1'2: w1 <= w1'.
      prove v < z0 * y + x * w1 + - z0 * w1.
      apply SNoLtLe_tra v (z0' * y + x * w1' + - z0' * w1') (z0 * y + x * w1 + - z0 * w1)
                        Hv1
                        (SNo_add_SNo_3 (z0' * y) (x * w1') (- z0' * w1')
                                (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                                (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                                (SNo_minus_SNo (z0' * w1') (SNo_mul_SNo z0' w1' (HLRx2 z0' Hz0'1) (HLRy1 w1' Hw1'1))))
                        (SNo_add_SNo_3 (z0 * y) (x * w1) (- z0 * w1)
                                (SNo_mul_SNo z0 y Hz0a Hy1)
                                (SNo_mul_SNo x w1 Hx1 Hw1a)
                                (SNo_minus_SNo (z0 * w1) (SNo_mul_SNo z0 w1 Hz0a Hw1a))).
      * { prove v < z0' * y + x * w1' + - z0' * w1'.
          apply Hv4.
          prove z0' * y + x * w1' + - z0' * w1' :e LxRy' :\/: RxLy'.
          apply binunionI2.
          apply RxLy'I.
          - exact Hz0'1.
          - exact Hw1'1.
        }
      * { prove z0' * y + x * w1' + - z0' * w1' <= z0 * y + x * w1 + - z0 * w1.
          apply add_SNo_minus_Le12b3 (z0' * y) (x * w1') (z0' * w1') (z0 * y) (x * w1) (z0 * w1)
                           (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                           (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                           (SNo_mul_SNo z0' w1' (HLRx2 z0' Hz0'1) (HLRy1 w1' Hw1'1))
                           (SNo_mul_SNo z0 y Hz0a Hy1)
                           (SNo_mul_SNo x w1 Hx1 Hw1a)
                           (SNo_mul_SNo z0 w1 Hz0a Hw1a).
          prove z0' * y + x * w1' + z0 * w1 <= z0 * y + x * w1 + z0' * w1'.
          apply SNoLe_tra (z0' * y + x * w1' + z0 * w1)
                          (z0' * y + x * w1 + z0 * w1')
                          (z0 * y + x * w1 + z0' * w1')
                          (SNo_add_SNo_3 (z0' * y) (x * w1') (z0 * w1)
                           (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                           (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                           (SNo_mul_SNo z0 w1 Hz0a Hw1a))
                          (SNo_add_SNo_3 (z0' * y) (x * w1) (z0 * w1')
                           (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                           (SNo_mul_SNo x w1 Hx1 Hw1a)
                           (SNo_mul_SNo z0 w1' Hz0a (HLRy1 w1' Hw1'1)))
                          (SNo_add_SNo_3 (z0 * y) (x * w1) (z0' * w1')
                           (SNo_mul_SNo z0 y Hz0a Hy1)
                           (SNo_mul_SNo x w1 Hx1 Hw1a)
                           (SNo_mul_SNo z0' w1' (HLRx2 z0' Hz0'1) (HLRy1 w1' Hw1'1))).
          - prove z0' * y + x * w1' + z0 * w1 <= z0' * y + x * w1 + z0 * w1'.
            apply add_SNo_Le2 (z0' * y) (x * w1' + z0 * w1) (x * w1 + z0 * w1')
                              (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                              (SNo_add_SNo (x * w1') (z0 * w1)
                               (SNo_mul_SNo x w1' Hx1 (HLRy1 w1' Hw1'1))
                               (SNo_mul_SNo z0 w1 Hz0a Hw1a))
                              (SNo_add_SNo (x * w1) (z0 * w1')
                               (SNo_mul_SNo x w1 Hx1 Hw1a)
                               (SNo_mul_SNo z0 w1' Hz0a (HLRy1 w1' Hw1'1))).
            prove x * w1' + z0 * w1 <= x * w1 + z0 * w1'.
            rewrite add_SNo_com (x * w1) (z0 * w1')
                                (SNo_mul_SNo x w1 Hx1 Hw1a)
                                (SNo_mul_SNo z0 w1' Hz0a (HLRy1 w1' Hw1'1)).
            apply mul_SNo_Le z0 w1' x w1 Hz0a (HLRy1 w1' Hw1'1) Hx1 Hw1a.
            + prove x <= z0. apply SNoLtLe. exact Hz0c.
            + prove w1 <= w1'. exact Hw1'2.
          - prove z0' * y + x * w1 + z0 * w1' <= z0 * y + x * w1 + z0' * w1'.
            rewrite add_SNo_com_3_0_1 (z0' * y) (x * w1) (z0 * w1')
                              (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                              (SNo_mul_SNo x w1 Hx1 Hw1a)
                              (SNo_mul_SNo z0 w1' Hz0a (HLRy1 w1' Hw1'1)).
            rewrite add_SNo_com_3_0_1 (z0 * y) (x * w1) (z0' * w1')
                              (SNo_mul_SNo z0 y Hz0a Hy1)
                              (SNo_mul_SNo x w1 Hx1 Hw1a)
                              (SNo_mul_SNo z0' w1' (HLRx2 z0' Hz0'1) (HLRy1 w1' Hw1'1)).
  
            prove x * w1 + z0' * y + z0 * w1' <= x * w1 + z0 * y + z0' * w1'.
            apply add_SNo_Le2 (x * w1) (z0' * y + z0 * w1') (z0 * y + z0' * w1')
                              (SNo_mul_SNo x w1 Hx1 Hw1a)
                              (SNo_add_SNo (z0' * y) (z0 * w1')
                               (SNo_mul_SNo z0' y (HLRx2 z0' Hz0'1) Hy1)
                               (SNo_mul_SNo z0 w1' Hz0a (HLRy1 w1' Hw1'1)))
                              (SNo_add_SNo (z0 * y) (z0' * w1')
                               (SNo_mul_SNo z0 y Hz0a Hy1)
                               (SNo_mul_SNo z0' w1' (HLRx2 z0' Hz0'1) (HLRy1 w1' Hw1'1))).
            prove z0' * y + z0 * w1' <= z0 * y + z0' * w1'.
            apply mul_SNo_Le z0 y z0' w1' Hz0a Hy1 (HLRx2 z0' Hz0'1) (HLRy1 w1' Hw1'1).
            + prove z0' <= z0. exact Hz0'2.
            + prove w1' <= y. apply SNoLtLe. exact Hy3 w1' Hw1'1.
        }
  - rewrite <- HLR'eq.
    prove forall w :e LxLy' :\/: RxRy', w < x * y.
    let w. apply binunionE'.
    + assume Hw: w :e LxLy'.
      apply LxLy'E w Hw.
      let w'. assume Hw': w' :e Lx.
      let w''. assume Hw'': w'' :e Ly.
      assume Hw'1: SNo w'.
      assume Hw''1: SNo w''.
      assume Hw'2: w' < x.
      assume Hw''2: w'' < y.
      assume Hwe. rewrite Hwe.
      prove w' * y + x * w'' + - w' * w'' < x * y.
      apply add_SNo_minus_Lt1b3 (w' * y) (x * w'') (w' * w'') (x * y)
                 (SNo_mul_SNo w' y Hw'1 Hy1)
                 (SNo_mul_SNo x w'' Hx1 Hw''1)
                 (SNo_mul_SNo w' w'' Hw'1 Hw''1)
                 (SNo_mul_SNo x y Hx1 Hy1).
      prove w' * y + x * w'' < x * y + w' * w''.
      exact mul_SNo_Lt x y w' w'' Hx1 Hy1 Hw'1 Hw''1 Hw'2 Hw''2.
    + assume Hw: w :e RxRy'.
      apply RxRy'E w Hw.
      let z. assume Hz: z :e Rx.
      let z'. assume Hz': z' :e Ry.
      assume Hz1: SNo z.
      assume Hz'1: SNo z'.
      assume Hz2: x < z.
      assume Hz'2: y < z'.
      assume Hwe. rewrite Hwe.
      prove z * y + x * z' + - z * z' < x * y.
      apply add_SNo_minus_Lt1b3 (z * y) (x * z') (z * z') (x * y)
                 (SNo_mul_SNo z y Hz1 Hy1)
                 (SNo_mul_SNo x z' Hx1 Hz'1)
                 (SNo_mul_SNo z z' Hz1 Hz'1)
                 (SNo_mul_SNo x y Hx1 Hy1).
      prove z * y + x * z' < x * y + z * z'.
      rewrite add_SNo_com (z * y) (x * z')
                 (SNo_mul_SNo z y Hz1 Hy1)
                 (SNo_mul_SNo x z' Hx1 Hz'1).
      rewrite add_SNo_com (x * y) (z * z')
                 (SNo_mul_SNo x y Hx1 Hy1)
                 (SNo_mul_SNo z z' Hz1 Hz'1).
      exact mul_SNo_Lt z z' x y Hz1 Hz'1 Hx1 Hy1 Hz2 Hz'2.
  - rewrite <- HLR'eq.
    prove forall z :e LxRy' :\/: RxLy', x * y < z.
    let z. apply binunionE'.
    + assume Hz: z :e LxRy'.
      apply LxRy'E z Hz.
      let w. assume Hw: w :e Lx.
      let z'. assume Hz': z' :e Ry.
      assume Hw1: SNo w.
      assume Hz'1: SNo z'.
      assume Hw2: w < x.
      assume Hz'2: y < z'.
      assume Hze. rewrite Hze.
      prove x * y < w * y + x * z' + - w * z'.
      apply add_SNo_minus_Lt2b3 (w * y) (x * z') (w * z') (x * y)
                 (SNo_mul_SNo w y Hw1 Hy1)
                 (SNo_mul_SNo x z' Hx1 Hz'1)
                 (SNo_mul_SNo w z' Hw1 Hz'1)
                 (SNo_mul_SNo x y Hx1 Hy1).
      prove x * y + w * z' < w * y + x * z'.
      rewrite add_SNo_com (x * y) (w * z')
                 (SNo_mul_SNo x y Hx1 Hy1)
                 (SNo_mul_SNo w z' Hw1 Hz'1).
      rewrite add_SNo_com (w * y) (x * z')
                 (SNo_mul_SNo w y Hw1 Hy1)
                 (SNo_mul_SNo x z' Hx1 Hz'1).
      prove w * z' + x * y < x * z' + w * y.
      exact mul_SNo_Lt x z' w y Hx1 Hz'1 Hw1 Hy1 Hw2 Hz'2.
    + assume Hz: z :e RxLy'.
      apply RxLy'E z Hz.
      let z'. assume Hz': z' :e Rx.
      let w. assume Hw: w :e Ly.
      assume Hz'1: SNo z'.
      assume Hw1: SNo w.
      assume Hz'2: x < z'.
      assume Hw2: w < y.
      assume Hze. rewrite Hze.
      prove x * y < z' * y + x * w + - z' * w.
      apply add_SNo_minus_Lt2b3 (z' * y) (x * w) (z' * w) (x * y)
                 (SNo_mul_SNo z' y Hz'1 Hy1)
                 (SNo_mul_SNo x w Hx1 Hw1)
                 (SNo_mul_SNo z' w Hz'1 Hw1)
                 (SNo_mul_SNo x y Hx1 Hy1).
      prove x * y + z' * w < z' * y + x * w.
      exact mul_SNo_Lt z' y x w Hz'1 Hy1 Hx1 Hw1 Hz'2 Hw2.
}
apply and3I.
- exact L1.
- exact Lxyeq.
- let q. assume Hq.
  apply Hq LxLy' RxRy' LxRy' RxLy'.
  + exact LxLy'E.
  + exact LxLy'I.
  + exact RxRy'E.
  + exact RxRy'I.
  + exact LxRy'E.
  + exact LxRy'I.
  + exact RxLy'E.
  + exact RxLy'I.
  + exact L1.
  + exact Lxyeq.
Qed.

Theorem mul_SNoCutP_gen : forall Lx Rx Ly Ry x y,
    SNoCutP Lx Rx
 -> SNoCutP Ly Ry
 -> x = SNoCut Lx Rx
 -> y = SNoCut Ly Ry
 -> SNoCutP ({w 0 * y + x * w 1 + - w 0 * w 1|w :e Lx :*: Ly}
              :\/:
             {z 0 * y + x * z 1 + - z 0 * z 1|z :e Rx :*: Ry})
            ({w 0 * y + x * w 1 + - w 0 * w 1|w :e Lx :*: Ry}
              :\/:
             {z 0 * y + x * z 1 + - z 0 * z 1|z :e Rx :*: Ly}).
let Lx Rx Ly Ry x y.
assume HLRx HLRy Hxe Hye.
apply mul_SNoCutP_lem Lx Rx Ly Ry x y HLRx HLRy Hxe Hye.
assume H _. apply H. assume H _. exact H.
Qed.

Theorem mul_SNoCut_eq : forall Lx Rx Ly Ry x y,
    SNoCutP Lx Rx
 -> SNoCutP Ly Ry
 -> x = SNoCut Lx Rx
 -> y = SNoCut Ly Ry
 -> x * y = SNoCut ({w 0 * y + x * w 1 + - w 0 * w 1|w :e Lx :*: Ly}
                    :\/:
                    {z 0 * y + x * z 1 + - z 0 * z 1|z :e Rx :*: Ry})
                   ({w 0 * y + x * w 1 + - w 0 * w 1|w :e Lx :*: Ry}
                    :\/:
                    {z 0 * y + x * z 1 + - z 0 * z 1|z :e Rx :*: Ly}).
let Lx Rx Ly Ry x y.
assume HLRx HLRy Hxe Hye.
apply mul_SNoCutP_lem Lx Rx Ly Ry x y HLRx HLRy Hxe Hye.
assume H _. apply H. assume _ H. exact H.
Qed.

Theorem mul_SNoCut_abs : forall Lx Rx Ly Ry x y,
    SNoCutP Lx Rx
 -> SNoCutP Ly Ry
 -> x = SNoCut Lx Rx
 -> y = SNoCut Ly Ry
 -> forall q:prop,
     (forall LxLy' RxRy' LxRy' RxLy',
         (forall u :e LxLy', forall p:prop, (forall w :e Lx, forall w' :e Ly, SNo w -> SNo w' -> w < x -> w' < y -> u = w * y + x * w' + - w * w' -> p) -> p)
      -> (forall w :e Lx, forall w' :e Ly, w * y + x * w' + - w * w' :e LxLy')
      -> (forall u :e RxRy', forall p:prop, (forall z :e Rx, forall z' :e Ry, SNo z -> SNo z' -> x < z -> y < z' -> u = z * y + x * z' + - z * z' -> p) -> p)
      -> (forall z :e Rx, forall z' :e Ry, z * y + x * z' + - z * z' :e RxRy')
      -> (forall u :e LxRy', forall p:prop, (forall w :e Lx, forall z :e Ry, SNo w -> SNo z -> w < x -> y < z -> u = w * y + x * z + - w * z -> p) -> p)
      -> (forall w :e Lx, forall z :e Ry, w * y + x * z + - w * z :e LxRy')
      -> (forall u :e RxLy', forall p:prop, (forall z :e Rx, forall w :e Ly, SNo z -> SNo w -> x < z -> w < y -> u = z * y + x * w + - z * w -> p) -> p)
      -> (forall z :e Rx, forall w :e Ly, z * y + x * w + - z * w :e RxLy')
      -> SNoCutP (LxLy' :\/: RxRy') (LxRy' :\/: RxLy')
      -> x * y = SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy')
      -> q)
    -> q.
let Lx Rx Ly Ry x y.
assume HLRx HLRy Hxe Hye.
apply mul_SNoCutP_lem Lx Rx Ly Ry x y HLRx HLRy Hxe Hye.
assume _ H. exact H.
Qed.

Theorem mul_SNo_SNoCut_SNoL_interpolate : forall Lx Rx Ly Ry,
    SNoCutP Lx Rx -> SNoCutP Ly Ry
 -> forall x y, x = SNoCut Lx Rx -> y = SNoCut Ly Ry
 -> forall u :e SNoL (x * y),
 (exists v :e Lx, exists w :e Ly, u + v * w <= v * y + x * w)
 \/
 (exists v :e Rx, exists w :e Ry, u + v * w <= v * y + x * w).
let Lx Rx Ly Ry. assume HLRx HLRy.
let x y. assume Hx Hy.
set P1 : set -> prop :=
  fun u => exists v :e Lx, exists w :e Ly, u + v * w <= v * y + x * w.
set P2 : set -> prop :=
  fun u => exists v :e Rx, exists w :e Ry, u + v * w <= v * y + x * w.
set P : set -> prop := fun u => P1 u \/ P2 u.
apply HLRx. assume H. apply H.
assume HLx HRx HLRx'.
apply HLRy. assume H. apply H.
assume HLy HRy HLRy'.
apply SNoCutP_SNoCut_impred Lx Rx HLRx.
rewrite <- Hx.
assume Hx1: SNo x.
assume Hx2: SNoLev x :e ordsucc ((\/_ x :e Lx, ordsucc (SNoLev x)) :\/: (\/_ y :e Rx, ordsucc (SNoLev y))).
assume Hx3: forall w :e Lx, w < x.
assume Hx4: forall z :e Rx, x < z.
assume Hx5: forall u, SNo u -> (forall w :e Lx, w < u) -> (forall z :e Rx, u < z) -> SNoLev x c= SNoLev u /\ SNoEq_ (SNoLev x) x u.
apply SNoCutP_SNoCut_impred Ly Ry HLRy.
rewrite <- Hy.
assume Hy1: SNo y.
assume Hy2: SNoLev y :e ordsucc ((\/_ y :e Ly, ordsucc (SNoLev y)) :\/: (\/_ y :e Ry, ordsucc (SNoLev y))).
assume Hy3: forall w :e Ly, w < y.
assume Hy4: forall z :e Ry, y < z.
assume Hy5: forall u, SNo u -> (forall w :e Ly, w < u) -> (forall z :e Ry, u < z) -> SNoLev y c= SNoLev u /\ SNoEq_ (SNoLev y) y u.
claim Lxy: SNo (x * y).
{ exact SNo_mul_SNo x y Hx1 Hy1. }
claim LI: forall u, SNo u -> SNoLev u :e SNoLev (x * y) -> u < x * y -> P u.
{ apply SNoLev_ind.
  let u.
  assume Hu1: SNo u.
  assume IH: forall z :e SNoS_ (SNoLev u), SNoLev z :e SNoLev (x * y) -> z < x * y -> P z.
  assume Hu2: SNoLev u :e SNoLev (x * y).
  assume Hu3: u < x * y.
  apply dneg.
  assume HNC: ~P u.
  claim L1: forall v :e Lx, forall w :e Ly, v * y + x * w < u + v * w.
  { let v. assume Hv. let w. assume Hw.
    claim Lv1: SNo v.
    { exact HLx v Hv. }
    claim Lw1: SNo w.
    { exact HLy w Hw. }
    apply SNoLtLe_or (v * y + x * w) (u + v * w)
           (SNo_add_SNo (v * y) (x * w) (SNo_mul_SNo v y Lv1 Hy1) (SNo_mul_SNo x w Hx1 Lw1))
           (SNo_add_SNo u (v * w) Hu1 (SNo_mul_SNo v w Lv1 Lw1)).
    - assume H. exact H.
    - assume H. apply HNC. apply orIL.
      witness v. apply andI.
      + exact Hv.
      + witness w. apply andI.
        * exact Hw.
        * exact H.
  }
  claim L2: forall v :e Rx, forall w :e Ry, v * y + x * w < u + v * w.
  { let v. assume Hv. let w. assume Hw.
    claim Lv1: SNo v.
    { exact HRx v Hv. }
    claim Lw1: SNo w.
    { exact HRy w Hw. }
    apply SNoLtLe_or (v * y + x * w) (u + v * w)
           (SNo_add_SNo (v * y) (x * w) (SNo_mul_SNo v y Lv1 Hy1) (SNo_mul_SNo x w Hx1 Lw1))
           (SNo_add_SNo u (v * w) Hu1 (SNo_mul_SNo v w Lv1 Lw1)).
    - assume H. exact H.
    - assume H. apply HNC. apply orIR.
      witness v. apply andI.
      + exact Hv.
      + witness w. apply andI.
        * exact Hw.
        * exact H.
  }
  apply SNoLt_irref u.
  apply SNoLtLe_tra u (x * y) u Hu1 Lxy Hu1 Hu3.
  prove x * y <= u.
  apply mul_SNoCut_abs Lx Rx Ly Ry x y HLRx HLRy Hx Hy.
  let LxLy' RxRy' LxRy' RxLy'.
  assume LxLy'E LxLy'I RxRy'E RxRy'I LxRy'E LxRy'I RxLy'E RxLy'I.
  assume HSC: SNoCutP (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
  assume HE: x * y = SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
  rewrite HE.
  prove SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy') <= u.
  rewrite SNo_eta u Hu1.
  prove SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy') <= SNoCut (SNoL u) (SNoR u).
  apply SNoCut_Le (LxLy' :\/: RxRy') (LxRy' :\/: RxLy') (SNoL u) (SNoR u) HSC (SNoCutP_SNoL_SNoR u Hu1).
  - prove forall z :e LxLy' :\/: RxRy', z < SNoCut (SNoL u) (SNoR u).
    let z. rewrite <- SNo_eta u Hu1.
    apply binunionE'.
    + assume Hz: z :e LxLy'.
      apply LxLy'E z Hz.
      let w0. assume Hw0. let w1. assume Hw1.
      assume Hw0a Hw1a Hw0x Hw1y Hze. rewrite Hze.
      prove w0 * y + x * w1 + - w0 * w1 < u.
      apply add_SNo_minus_Lt1b3 (w0 * y) (x * w1) (w0 * w1) u
                     (SNo_mul_SNo w0 y Hw0a Hy1)
                     (SNo_mul_SNo x w1 Hx1 Hw1a)
                     (SNo_mul_SNo w0 w1 Hw0a Hw1a)
                     Hu1.
      prove w0 * y + x * w1 < u + w0 * w1.
      apply SNoLtLe_or (w0 * y + x * w1) (u + w0 * w1)
                       (SNo_add_SNo (w0 * y) (x * w1)
                        (SNo_mul_SNo w0 y Hw0a Hy1)
                        (SNo_mul_SNo x w1 Hx1 Hw1a))
                       (SNo_add_SNo u (w0 * w1) Hu1 (SNo_mul_SNo w0 w1 Hw0a Hw1a)).
      * assume H. exact H.
      * { assume H: u + w0 * w1 <= w0 * y + x * w1.
          apply HNC.
          prove P1 u \/ P2 u.
          apply orIL.
          prove exists v :e Lx, exists w :e Ly, u + v * w <= v * y + x * w.
          witness w0. apply andI.
          - exact Hw0.
          - witness w1. apply andI.
            + exact Hw1.
            + exact H.
        }
    + assume Hz: z :e RxRy'.
      apply RxRy'E z Hz.
      let z0. assume Hz0. let z1. assume Hz1.
      assume Hz0a Hz1a Hz0x Hz1y Hze. rewrite Hze.
      prove z0 * y + x * z1 + - z0 * z1 < u.
      apply add_SNo_minus_Lt1b3 (z0 * y) (x * z1) (z0 * z1) u
                     (SNo_mul_SNo z0 y Hz0a Hy1)
                     (SNo_mul_SNo x z1 Hx1 Hz1a)
                     (SNo_mul_SNo z0 z1 Hz0a Hz1a)
                     Hu1.
      prove z0 * y + x * z1 < u + z0 * z1.
      apply SNoLtLe_or (z0 * y + x * z1) (u + z0 * z1)
                       (SNo_add_SNo (z0 * y) (x * z1)
                        (SNo_mul_SNo z0 y Hz0a Hy1)
                        (SNo_mul_SNo x z1 Hx1 Hz1a))
                       (SNo_add_SNo u (z0 * z1) Hu1 (SNo_mul_SNo z0 z1 Hz0a Hz1a)).
      * assume H. exact H.
      * { assume H: u + z0 * z1 <= z0 * y + x * z1.
          apply HNC.
          prove P1 u \/ P2 u.
          apply orIR.
          prove exists v :e Rx, exists w :e Ry, u + v * w <= v * y + x * w.
          witness z0. apply andI.
          - exact Hz0.
          - witness z1. apply andI.
            + exact Hz1.
            + exact H.
        }
  - prove forall z :e SNoR u, SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy') < z.
    let z. assume Hz: z :e SNoR u.
    rewrite <- HE.
    prove x * y < z.
    apply SNoR_E u Hu1 z Hz.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev u.
    assume Hz3: u < z.
    apply SNoLt_trichotomy_or_impred z (x * y) Hz1 Lxy.
    + assume H1: z < x * y.
      claim LPz: P z.
      { apply IH z.
        - prove z :e SNoS_ (SNoLev u). apply SNoS_I2.
          + exact Hz1.
          + exact Hu1.
          + exact Hz2.
        - prove SNoLev z :e SNoLev (x * y).
          exact ordinal_TransSet (SNoLev (x * y)) (SNoLev_ordinal (x * y) Lxy)
                                 (SNoLev u) Hu2 (SNoLev z) Hz2.
        - prove z < x * y. exact H1.
      }
      apply LPz.
      * assume H2: P1 z. apply H2.
        let v. assume H2. apply H2.
        assume Hv: v :e Lx. assume H2. apply H2.
        let w. assume H2. apply H2.
        assume Hw: w :e Ly.
        assume Hvw: z + v * w <= v * y + x * w.
        claim Lv1: SNo v.
        { exact HLx v Hv. }
        claim Lw1: SNo w.
        { exact HLy w Hw. }
        claim Lvw: SNo (v * w).
        { exact SNo_mul_SNo v w Lv1 Lw1. }
        claim L3: z + v * w < u + v * w.
        { apply SNoLeLt_tra (z + v * w) (v * y + x * w) (u + v * w)
                       (SNo_add_SNo z (v * w) Hz1 Lvw)
                       (SNo_add_SNo (v * y) (x * w)
                                    (SNo_mul_SNo v y Lv1 Hy1)
                                    (SNo_mul_SNo x w Hx1 Lw1))
                       (SNo_add_SNo u (v * w) Hu1 Lvw)
                       Hvw.
          prove v * y + x * w < u + v * w.
          exact L1 v Hv w Hw.
        }
        claim L4: z < u.
        { exact add_SNo_Lt1_cancel z (v * w) u Hz1 Lvw Hu1 L3. }
        prove False.
        apply SNoLt_irref u.
        exact SNoLt_tra u z u Hu1 Hz1 Hu1 Hz3 L4.
      * assume H2: P2 z. apply H2.
        let v. assume H2. apply H2.
        assume Hv: v :e Rx. assume H2. apply H2.
        let w. assume H2. apply H2.
        assume Hw: w :e Ry.
        assume Hvw: z + v * w <= v * y + x * w.
        claim Lv1: SNo v.
        { exact HRx v Hv. }
        claim Lw1: SNo w.
        { exact HRy w Hw. }
        claim Lvw: SNo (v * w).
        { exact SNo_mul_SNo v w Lv1 Lw1. }
        claim L5: z + v * w < u + v * w.
        { apply SNoLeLt_tra (z + v * w) (v * y + x * w) (u + v * w)
                            (SNo_add_SNo z (v * w) Hz1 Lvw)
                            (SNo_add_SNo (v * y) (x * w)
                                         (SNo_mul_SNo v y Lv1 Hy1)
                                         (SNo_mul_SNo x w Hx1 Lw1))
                            (SNo_add_SNo u (v * w) Hu1 Lvw)
                            Hvw.
          prove v * y + x * w < u + v * w.
          exact L2 v Hv w Hw.
        }
        claim L6: z < u.
        { exact add_SNo_Lt1_cancel z (v * w) u Hz1 Lvw Hu1 L5. }
        prove False.
        apply SNoLt_irref u.
        exact SNoLt_tra u z u Hu1 Hz1 Hu1 Hz3 L6.
    + assume H1: z = x * y. apply In_no2cycle (SNoLev u) (SNoLev (x * y)) Hu2.
      prove SNoLev (x * y) :e SNoLev u. rewrite <- H1. exact Hz2.
    + assume H1: x * y < z. exact H1.
}
let u.
assume Hu: u :e SNoL (x * y).
apply SNoL_E (x * y) Lxy u Hu.
assume Hu1: SNo u.
assume Hu2: SNoLev u :e SNoLev (x * y).
assume Hu3: u < x * y.
exact LI u Hu1 Hu2 Hu3.
Qed.

Theorem mul_SNo_SNoCut_SNoL_interpolate_impred : forall Lx Rx Ly Ry,
    SNoCutP Lx Rx -> SNoCutP Ly Ry
 -> forall x y, x = SNoCut Lx Rx -> y = SNoCut Ly Ry
 -> forall u :e SNoL (x * y),
    forall p:prop,
        (forall v :e Lx, forall w :e Ly, u + v * w <= v * y + x * w -> p)
     -> (forall v :e Rx, forall w :e Ry, u + v * w <= v * y + x * w -> p)
     -> p.
let Lx Rx Ly Ry. assume HLRx HLRy.
let x y. assume Hx Hy. let u. assume Hu.
let p. assume Hp1 Hp2.
apply mul_SNo_SNoCut_SNoL_interpolate Lx Rx Ly Ry HLRx HLRy x y Hx Hy u Hu.
- assume H1. apply H1.
  let v. assume H1. apply H1.
  assume Hv. assume H1. apply H1.
  let w. assume H1. apply H1.
  assume Hw Hvw.
  exact Hp1 v Hv w Hw Hvw.
- assume H1. apply H1.
  let v. assume H1. apply H1.
  assume Hv. assume H1. apply H1.
  let w. assume H1. apply H1.
  assume Hw Hvw.
  exact Hp2 v Hv w Hw Hvw.
Qed.

Theorem mul_SNo_SNoCut_SNoR_interpolate : forall Lx Rx Ly Ry,
    SNoCutP Lx Rx -> SNoCutP Ly Ry
 -> forall x y, x = SNoCut Lx Rx -> y = SNoCut Ly Ry
 -> forall u :e SNoR (x * y),
 (exists v :e Lx, exists w :e Ry, v * y + x * w <= u + v * w)
 \/
 (exists v :e Rx, exists w :e Ly, v * y + x * w <= u + v * w).
let Lx Rx Ly Ry. assume HLRx HLRy.
let x y. assume Hx Hy.
set P1 : set -> prop :=
  fun u => exists v :e Lx, exists w :e Ry, v * y + x * w <= u + v * w.
set P2 : set -> prop :=
  fun u => exists v :e Rx, exists w :e Ly, v * y + x * w <= u + v * w.
set P : set -> prop := fun u => P1 u \/ P2 u.
apply HLRx. assume H. apply H.
assume HLx HRx HLRx'.
apply HLRy. assume H. apply H.
assume HLy HRy HLRy'.
apply SNoCutP_SNoCut_impred Lx Rx HLRx.
rewrite <- Hx.
assume Hx1: SNo x.
assume Hx2: SNoLev x :e ordsucc ((\/_ x :e Lx, ordsucc (SNoLev x)) :\/: (\/_ y :e Rx, ordsucc (SNoLev y))).
assume Hx3: forall w :e Lx, w < x.
assume Hx4: forall z :e Rx, x < z.
assume Hx5: forall u, SNo u -> (forall w :e Lx, w < u) -> (forall z :e Rx, u < z) -> SNoLev x c= SNoLev u /\ SNoEq_ (SNoLev x) x u.
apply SNoCutP_SNoCut_impred Ly Ry HLRy.
rewrite <- Hy.
assume Hy1: SNo y.
assume Hy2: SNoLev y :e ordsucc ((\/_ y :e Ly, ordsucc (SNoLev y)) :\/: (\/_ y :e Ry, ordsucc (SNoLev y))).
assume Hy3: forall w :e Ly, w < y.
assume Hy4: forall z :e Ry, y < z.
assume Hy5: forall u, SNo u -> (forall w :e Ly, w < u) -> (forall z :e Ry, u < z) -> SNoLev y c= SNoLev u /\ SNoEq_ (SNoLev y) y u.
claim Lxy: SNo (x * y).
{ exact SNo_mul_SNo x y Hx1 Hy1. }
claim LI: forall u, SNo u -> SNoLev u :e SNoLev (x * y) -> x * y < u -> P u.
{ apply SNoLev_ind.
  let u.
  assume Hu1: SNo u.
  assume IH: forall z :e SNoS_ (SNoLev u), SNoLev z :e SNoLev (x * y) -> x * y < z -> P z.
  assume Hu2: SNoLev u :e SNoLev (x * y).
  assume Hu3: x * y < u.
  apply dneg.
  assume HNC: ~P u.
  claim L1: forall v :e Lx, forall w :e Ry, u + v * w < v * y + x * w.
  { let v. assume Hv. let w. assume Hw.
    claim Lv1: SNo v.
    { exact HLx v Hv. }
    claim Lw1: SNo w.
    { exact HRy w Hw. }
    apply SNoLtLe_or (u + v * w) (v * y + x * w)
           (SNo_add_SNo u (v * w) Hu1 (SNo_mul_SNo v w Lv1 Lw1))
           (SNo_add_SNo (v * y) (x * w) (SNo_mul_SNo v y Lv1 Hy1) (SNo_mul_SNo x w Hx1 Lw1)).
    - assume H. exact H.
    - assume H. apply HNC. apply orIL.
      witness v. apply andI.
      + exact Hv.
      + witness w. apply andI.
        * exact Hw.
        * exact H.
  }
  claim L2: forall v :e Rx, forall w :e Ly, u + v * w < v * y + x * w.
  { let v. assume Hv. let w. assume Hw.
    claim Lv1: SNo v.
    { exact HRx v Hv. }
    claim Lw1: SNo w.
    { exact HLy w Hw. }
    apply SNoLtLe_or (u + v * w) (v * y + x * w)
           (SNo_add_SNo u (v * w) Hu1 (SNo_mul_SNo v w Lv1 Lw1))
           (SNo_add_SNo (v * y) (x * w) (SNo_mul_SNo v y Lv1 Hy1) (SNo_mul_SNo x w Hx1 Lw1)).
    - assume H. exact H.
    - assume H. apply HNC. apply orIR.
      witness v. apply andI.
      + exact Hv.
      + witness w. apply andI.
        * exact Hw.
        * exact H.
  }
  apply SNoLt_irref (x * y).
  apply SNoLtLe_tra (x * y) u (x * y) Lxy Hu1 Lxy Hu3.
  prove u <= x * y.
  apply mul_SNoCut_abs Lx Rx Ly Ry x y HLRx HLRy Hx Hy.
  let LxLy' RxRy' LxRy' RxLy'.
  assume LxLy'E LxLy'I RxRy'E RxRy'I LxRy'E LxRy'I RxLy'E RxLy'I.
  assume HSC: SNoCutP (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
  assume HE: x * y = SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
  rewrite HE.
  prove u <= SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
  rewrite SNo_eta u Hu1.
  prove SNoCut (SNoL u) (SNoR u) <= SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
  apply SNoCut_Le (SNoL u) (SNoR u) (LxLy' :\/: RxRy') (LxRy' :\/: RxLy') (SNoCutP_SNoL_SNoR u Hu1) HSC.
  - prove forall z :e SNoL u, z < SNoCut (LxLy' :\/: RxRy') (LxRy' :\/: RxLy').
    let z. assume Hz: z :e SNoL u.
    rewrite <- HE.
    prove z < x * y.
    apply SNoL_E u Hu1 z Hz.
    assume Hz1: SNo z.
    assume Hz2: SNoLev z :e SNoLev u.
    assume Hz3: z < u.
    apply SNoLt_trichotomy_or_impred (x * y) z Lxy Hz1.
    + assume H1: x * y < z.
      claim LPz: P z.
      { apply IH z.
        - prove z :e SNoS_ (SNoLev u). apply SNoS_I2.
          + exact Hz1.
          + exact Hu1.
          + exact Hz2.
        - prove SNoLev z :e SNoLev (x * y).
          exact ordinal_TransSet (SNoLev (x * y)) (SNoLev_ordinal (x * y) Lxy)
                                 (SNoLev u) Hu2 (SNoLev z) Hz2.
        - prove x * y < z. exact H1.
      }
      apply LPz.
      * assume H2: P1 z. apply H2.
        let v. assume H2. apply H2.
        assume Hv: v :e Lx. assume H2. apply H2.
        let w. assume H2. apply H2.
        assume Hw: w :e Ry.
        assume Hvw: v * y + x * w <= z + v * w.
        claim Lv1: SNo v.
        { exact HLx v Hv. }
        claim Lw1: SNo w.
        { exact HRy w Hw. }
        claim Lvw: SNo (v * w).
        { exact SNo_mul_SNo v w Lv1 Lw1. }
        claim L3: u + v * w < z + v * w.
        { apply SNoLtLe_tra (u + v * w) (v * y + x * w) (z + v * w)
                       (SNo_add_SNo u (v * w) Hu1 Lvw)
                       (SNo_add_SNo (v * y) (x * w)
                                    (SNo_mul_SNo v y Lv1 Hy1)
                                    (SNo_mul_SNo x w Hx1 Lw1))
                       (SNo_add_SNo z (v * w) Hz1 Lvw).
          - prove u + v * w < v * y + x * w.
            exact L1 v Hv w Hw.
          - exact Hvw.
        }
        claim L4: u < z.
        { exact add_SNo_Lt1_cancel u (v * w) z Hu1 Lvw Hz1 L3. }
        prove False.
        apply SNoLt_irref u.
        exact SNoLt_tra u z u Hu1 Hz1 Hu1 L4 Hz3.
      * assume H2: P2 z. apply H2.
        let v. assume H2. apply H2.
        assume Hv: v :e Rx. assume H2. apply H2.
        let w. assume H2. apply H2.
        assume Hw: w :e Ly.
        assume Hvw: v * y + x * w <= z + v * w.
        claim Lv1: SNo v.
        { exact HRx v Hv. }
        claim Lw1: SNo w.
        { exact HLy w Hw. }
        claim Lvw: SNo (v * w).
        { exact SNo_mul_SNo v w Lv1 Lw1. }
        claim L5: u + v * w < z + v * w.
        { apply SNoLtLe_tra (u + v * w) (v * y + x * w) (z + v * w)
                            (SNo_add_SNo u (v * w) Hu1 Lvw)
                            (SNo_add_SNo (v * y) (x * w)
                                         (SNo_mul_SNo v y Lv1 Hy1)
                                         (SNo_mul_SNo x w Hx1 Lw1))
                            (SNo_add_SNo z (v * w) Hz1 Lvw).
          - prove u + v * w < v * y + x * w.
            exact L2 v Hv w Hw.
          - exact Hvw.
        }
        claim L6: u < z.
        { exact add_SNo_Lt1_cancel u (v * w) z Hu1 Lvw Hz1 L5. }
        prove False.
        apply SNoLt_irref u.
        exact SNoLt_tra u z u Hu1 Hz1 Hu1 L6 Hz3.
    + assume H1: x * y = z. apply In_no2cycle (SNoLev u) (SNoLev (x * y)) Hu2.
      prove SNoLev (x * y) :e SNoLev u. rewrite H1. exact Hz2.
    + assume H1: z < x * y. exact H1.
  - prove forall z :e LxRy' :\/: RxLy', SNoCut (SNoL u) (SNoR u) < z.
    let z. rewrite <- SNo_eta u Hu1.
    apply binunionE'.
    + assume Hz: z :e LxRy'.
      apply LxRy'E z Hz.
      let w0. assume Hw0. let w1. assume Hw1.
      assume Hw0a Hw1a Hw0x Hw1y Hze. rewrite Hze.
      prove u < w0 * y + x * w1 + - w0 * w1.
      apply add_SNo_minus_Lt2b3 (w0 * y) (x * w1) (w0 * w1) u
                     (SNo_mul_SNo w0 y Hw0a Hy1)
                     (SNo_mul_SNo x w1 Hx1 Hw1a)
                     (SNo_mul_SNo w0 w1 Hw0a Hw1a)
                     Hu1.
      prove u + w0 * w1 < w0 * y + x * w1.
      apply SNoLtLe_or (u + w0 * w1) (w0 * y + x * w1)
                       (SNo_add_SNo u (w0 * w1) Hu1 (SNo_mul_SNo w0 w1 Hw0a Hw1a))
                       (SNo_add_SNo (w0 * y) (x * w1)
                        (SNo_mul_SNo w0 y Hw0a Hy1)
                        (SNo_mul_SNo x w1 Hx1 Hw1a)).
      * assume H. exact H.
      * { assume H: w0 * y + x * w1 <= u + w0 * w1.
          apply HNC.
          prove P1 u \/ P2 u.
          apply orIL.
          prove exists v :e Lx, exists w :e Ry, v * y + x * w <= u + v * w.
          witness w0. apply andI.
          - exact Hw0.
          - witness w1. apply andI.
            + exact Hw1.
            + exact H.
        }
    + assume Hz: z :e RxLy'.
      apply RxLy'E z Hz.
      let z0. assume Hz0. let z1. assume Hz1.
      assume Hz0a Hz1a Hz0x Hz1y Hze. rewrite Hze.
      prove u < z0 * y + x * z1 + - z0 * z1.
      apply add_SNo_minus_Lt2b3 (z0 * y) (x * z1) (z0 * z1) u
                     (SNo_mul_SNo z0 y Hz0a Hy1)
                     (SNo_mul_SNo x z1 Hx1 Hz1a)
                     (SNo_mul_SNo z0 z1 Hz0a Hz1a)
                     Hu1.
      prove u + z0 * z1 < z0 * y + x * z1.
      apply SNoLtLe_or (u + z0 * z1) (z0 * y + x * z1)
                       (SNo_add_SNo u (z0 * z1) Hu1 (SNo_mul_SNo z0 z1 Hz0a Hz1a))
                       (SNo_add_SNo (z0 * y) (x * z1)
                        (SNo_mul_SNo z0 y Hz0a Hy1)
                        (SNo_mul_SNo x z1 Hx1 Hz1a)).
      * assume H. exact H.
      * { assume H: z0 * y + x * z1 <= u + z0 * z1.
          apply HNC.
          prove P1 u \/ P2 u.
          apply orIR.
          prove exists v :e Rx, exists w :e Ly, v * y + x * w <= u + v * w.
          witness z0. apply andI.
          - exact Hz0.
          - witness z1. apply andI.
            + exact Hz1.
            + exact H.
        }
}
let u.
assume Hu: u :e SNoR (x * y).
apply SNoR_E (x * y) Lxy u Hu.
assume Hu1: SNo u.
assume Hu2: SNoLev u :e SNoLev (x * y).
assume Hu3: x * y < u.
exact LI u Hu1 Hu2 Hu3.
Qed.

Theorem mul_SNo_SNoCut_SNoR_interpolate_impred : forall Lx Rx Ly Ry,
    SNoCutP Lx Rx -> SNoCutP Ly Ry
 -> forall x y, x = SNoCut Lx Rx -> y = SNoCut Ly Ry
 -> forall u :e SNoR (x * y),
    forall p:prop,
        (forall v :e Lx, forall w :e Ry, v * y + x * w <= u + v * w -> p)
     -> (forall v :e Rx, forall w :e Ly, v * y + x * w <= u + v * w -> p)
     -> p.
let Lx Rx Ly Ry. assume HLRx HLRy.
let x y. assume Hx Hy. let u. assume Hu.
let p. assume Hp1 Hp2.
apply mul_SNo_SNoCut_SNoR_interpolate Lx Rx Ly Ry HLRx HLRy x y Hx Hy u Hu.
- assume H1. apply H1.
  let v. assume H1. apply H1.
  assume Hv. assume H1. apply H1.
  let w. assume H1. apply H1.
  assume Hw Hvw.
  exact Hp1 v Hv w Hw Hvw.
- assume H1. apply H1.
  let v. assume H1. apply H1.
  assume Hv. assume H1. apply H1.
  let w. assume H1. apply H1.
  assume Hw Hvw.
  exact Hp2 v Hv w Hw Hvw.
Qed.

End SurrealMul.

Section SurrealExp.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.

Definition exp_SNo_nat : set->set->set := fun n m:set => nat_primrec 1 (fun _ r => n * r) m.

Infix ^ 342 right := exp_SNo_nat.

Theorem exp_SNo_nat_0 : forall x, SNo x -> x ^ 0 = 1.
let x. assume Hx.
exact nat_primrec_0 1 (fun _ r => x * r).
Qed.

Theorem exp_SNo_nat_S : forall x, SNo x -> forall n, nat_p n -> x ^ (ordsucc n) = x * x ^ n.
let x. assume Hx. let n. assume Hn.
exact nat_primrec_S 1 (fun _ r => x * r) n Hn.
Qed.

Theorem exp_SNo_nat_1: forall x, SNo x -> x ^ 1 = x.
let x. assume Hx.
rewrite exp_SNo_nat_S x Hx 0 nat_0.
prove x * x ^ 0 = x.
rewrite exp_SNo_nat_0 x Hx.
prove x * 1 = x.
exact mul_SNo_oneR x Hx.
Qed.

Theorem exp_SNo_nat_2 : forall x, SNo x -> x ^ 2 = x * x.
let x. assume Hx.
rewrite exp_SNo_nat_S x Hx 1 nat_1.
prove x * x ^ 1 = x * x.
f_equal.
exact exp_SNo_nat_1 x Hx.
Qed.

Theorem SNo_sqr_nonneg' : forall x, SNo x -> 0 <= x ^ 2.
let x. assume Hx.
rewrite exp_SNo_nat_2 x Hx.
exact SNo_sqr_nonneg x Hx.
Qed.

Theorem SNo_zero_or_sqr_pos' : forall x, SNo x -> x = 0 \/ 0 < x ^ 2.
let x. assume Hx.
rewrite exp_SNo_nat_2 x Hx.
exact SNo_zero_or_sqr_pos x Hx.
Qed.

Theorem SNo_exp_SNo_nat : forall x, SNo x -> forall n, nat_p n -> SNo (x ^ n).
let x. assume Hx. apply nat_ind.
- prove SNo (x ^ 0). rewrite exp_SNo_nat_0 x Hx. exact SNo_1.
- let n. assume Hn. assume IHn: SNo (x ^ n).
  prove SNo (x ^ (ordsucc n)).
  rewrite exp_SNo_nat_S x Hx n Hn.
  prove SNo (x * x ^ n).
  exact SNo_mul_SNo x (x ^ n) Hx IHn.
Qed.

Theorem nat_exp_SNo_nat : forall x, nat_p x -> forall n, nat_p n -> nat_p (x ^ n).
let x. assume Hx.
claim Lx: SNo x.
{ exact nat_p_SNo x Hx. }
apply nat_ind.
- prove nat_p (x ^ 0). rewrite exp_SNo_nat_0 x Lx. exact nat_1.
- let n. assume Hn. assume IHn: nat_p (x ^ n).
  prove nat_p (x ^ (ordsucc n)).
  rewrite exp_SNo_nat_S x Lx n Hn.
  prove nat_p (x * x ^ n).
  rewrite <- mul_nat_mul_SNo x (nat_p_omega x Hx) (x ^ n) (nat_p_omega (x ^ n) IHn).
  prove nat_p (mul_nat x (x ^ n)).
  exact mul_nat_p x Hx (x ^ n) IHn.
Qed.

Theorem eps_ordsucc_half_add : forall n, nat_p n -> eps_ (ordsucc n) + eps_ (ordsucc n) = eps_ n.
apply nat_complete_ind.
let n. assume Hn.
assume IH: forall m :e n, eps_ (ordsucc m) + eps_ (ordsucc m) = eps_ m.
claim Ln: n :e omega.
{ exact nat_p_omega n Hn. }
rewrite eps_SNoCut n Ln.
set x := eps_ (ordsucc n).
claim Lx: SNo x.
{ exact SNo_eps_ (ordsucc n) (omega_ordsucc n Ln). }
claim Lx2: 0 < x.
{ exact SNo_eps_pos (ordsucc n) (omega_ordsucc n Ln). }
rewrite add_SNo_eq x Lx x Lx.
prove SNoCut ({w + x|w :e SNoL x} :\/: {x + w|w :e SNoL x})
             ({z + x|z :e SNoR x} :\/: {x + z|z :e SNoR x})
    = SNoCut {0} {eps_ m|m :e n}.
apply SNoCut_ext ({w + x|w :e SNoL x} :\/: {x + w|w :e SNoL x})
                 ({z + x|z :e SNoR x} :\/: {x + z|z :e SNoR x})
                 {0} {eps_ m|m :e n}
                 (add_SNo_SNoCutP x x Lx Lx)
                 (eps_SNoCutP n Ln).
- claim L1: forall w :e SNoL x, w + x < eps_ n /\ x + w < eps_ n.
  { let w. assume Hw: w :e SNoL x.
    apply SNoL_E x Lx w Hw.
    assume Hw1: SNo w.
    rewrite SNoLev_eps_ (ordsucc n) (omega_ordsucc n Ln).
    assume Hw2: SNoLev w :e ordsucc (ordsucc n).
    assume Hw3: w < x.
    claim Lw0: w <= 0.
    { apply SNoLtLe_or 0 w SNo_0 Hw1.
      - assume H1: 0 < w. prove False.
        apply SNoLt_irref w.
        prove w < w.
        apply SNoLt_tra w x w Hw1 Lx Hw1 Hw3.
        prove x < w.
        apply SNo_pos_eps_Lt (ordsucc n) (nat_ordsucc n Hn) w.
        + prove w :e SNoS_ (ordsucc (ordsucc n)).
          apply SNoS_I (ordsucc (ordsucc n)) (nat_p_ordinal (ordsucc (ordsucc n)) (nat_ordsucc (ordsucc n) (nat_ordsucc n Hn))) w (SNoLev w) Hw2.
          prove SNo_ (SNoLev w) w.
          exact SNoLev_ w Hw1.
        + prove 0 < w. exact H1.
      - assume H1: w <= 0. exact H1.
    }
    claim L1a: w + x < eps_ n.
    { apply SNoLeLt_tra (w + x) (0 + x) (eps_ n).
      - exact SNo_add_SNo w x Hw1 Lx.
      - exact SNo_add_SNo 0 x SNo_0 Lx.
      - exact SNo_eps_ n Ln.
      - prove w + x <= 0 + x.
        exact add_SNo_Le1 w x 0 Hw1 Lx SNo_0 Lw0.
      - prove 0 + x < eps_ n.
        rewrite add_SNo_0L x Lx.
        prove eps_ (ordsucc n) < eps_ n.
        exact SNo_eps_decr (ordsucc n) (omega_ordsucc n Ln) n (ordsuccI2 n). 
    }
    apply andI.
    - exact L1a.
    - rewrite add_SNo_com x w Lx Hw1. exact L1a.
  }    
  let w'. assume Hw': w' :e {w + x|w :e SNoL x} :\/: {x + w|w :e SNoL x}.
  prove w' < SNoCut {0} {eps_ m|m :e n}.
  rewrite <- eps_SNoCut n Ln.
  prove w' < eps_ n.
  apply binunionE {w + x|w :e SNoL x} {x + w|w :e SNoL x} w' Hw'.
  + assume Hw': w' :e {w + x|w :e SNoL x}.
    apply ReplE_impred (SNoL x) (fun w => w + x) w' Hw'.
    let w. assume Hw1: w :e SNoL x. assume Hw2: w' = w + x.
    rewrite Hw2.
    exact andEL (w + x < eps_ n) (x + w < eps_ n) (L1 w Hw1).
  + assume Hw': w' :e {x + w|w :e SNoL x}.
    apply ReplE_impred (SNoL x) (fun w => x + w) w' Hw'.
    let w. assume Hw1: w :e SNoL x. assume Hw2: w' = x + w.
    rewrite Hw2.
    exact andER (w + x < eps_ n) (x + w < eps_ n) (L1 w Hw1).
- claim L2: forall z :e SNoR x, eps_ n < z + x /\ eps_ n < x + z.
  { let z. assume Hz: z :e SNoR x.
    apply SNoR_E x Lx z Hz.
    assume Hz1: SNo z.
    rewrite SNoLev_eps_ (ordsucc n) (omega_ordsucc n Ln).
    assume Hz2: SNoLev z :e ordsucc (ordsucc n).
    assume Hz3: x < z.
    claim L2a: eps_ n < z + x.
    { apply SNoLeLt_tra (eps_ n) z (z + x) (SNo_eps_ n Ln) Hz1.
      - exact SNo_add_SNo z x Hz1 Lx.
      - prove eps_ n <= z.
        apply SNo_pos_eps_Le n Hn z.
        + prove z :e SNoS_ (ordsucc (ordsucc n)).
          apply SNoS_I (ordsucc (ordsucc n)) (nat_p_ordinal (ordsucc (ordsucc n)) (nat_ordsucc (ordsucc n) (nat_ordsucc n Hn))) z (SNoLev z) Hz2.
          prove SNo_ (SNoLev z) z.
          exact SNoLev_ z Hz1.
        + prove 0 < z.
          apply SNoLt_tra 0 x z SNo_0 Lx Hz1.
          * prove 0 < x. exact SNo_eps_pos (ordsucc n) (omega_ordsucc n Ln).
          * prove x < z. exact Hz3.
      - prove z < z + x.
        rewrite <- add_SNo_0R z Hz1 at 1.
        prove z + 0 < z + x.
        apply add_SNo_Lt2 z 0 x Hz1 SNo_0 Lx.
        prove 0 < x. exact SNo_eps_pos (ordsucc n) (omega_ordsucc n Ln).
    }
    apply andI.
    - exact L2a.
    - rewrite add_SNo_com x z Lx Hz1. exact L2a.
  }
  let z'. assume Hz': z' :e {z + x|z :e SNoR x} :\/: {x + z|z :e SNoR x}.
  prove SNoCut {0} {eps_ m|m :e n} < z'.
  rewrite <- eps_SNoCut n Ln.
  prove eps_ n < z'.
  apply binunionE {z + x|z :e SNoR x} {x + z|z :e SNoR x} z' Hz'.
  + assume Hz': z' :e {z + x|z :e SNoR x}.
    apply ReplE_impred (SNoR x) (fun z => z + x) z' Hz'.
    let z. assume Hz1: z :e SNoR x. assume Hz2: z' = z + x.
    rewrite Hz2.
    prove eps_ n < z + x.
    exact andEL (eps_ n < z + x) (eps_ n < x + z) (L2 z Hz1).
  + assume Hz': z' :e {x + z|z :e SNoR x}.
    apply ReplE_impred (SNoR x) (fun z => x + z) z' Hz'.
    let z. assume Hz1: z :e SNoR x. assume Hz2: z' = x + z.
    rewrite Hz2.
    prove eps_ n < x + z.
    exact andER (eps_ n < z + x) (eps_ n < x + z) (L2 z Hz1).
- let w. assume Hw: w :e {0}.
  prove w < SNoCut ({w + x|w :e SNoL x} :\/: {x + w|w :e SNoL x})
                   ({z + x|z :e SNoR x} :\/: {x + z|z :e SNoR x}).
  rewrite SingE 0 w Hw.
  prove 0 < SNoCut ({w + x|w :e SNoL x} :\/: {x + w|w :e SNoL x})
                   ({z + x|z :e SNoR x} :\/: {x + z|z :e SNoR x}).
  rewrite <- add_SNo_eq x Lx x Lx.
  prove 0 < x + x.
  rewrite <- add_SNo_0L 0 SNo_0.
  prove 0 + 0 < x + x.
  exact add_SNo_Lt3 0 0 x x SNo_0 SNo_0 Lx Lx Lx2 Lx2.
- let z. assume Hz: z :e {eps_ m|m :e n}.
  prove SNoCut ({w + x|w :e SNoL x} :\/: {x + w|w :e SNoL x})
               ({z + x|z :e SNoR x} :\/: {x + z|z :e SNoR x})
      < z.
  rewrite <- add_SNo_eq x Lx x Lx.
  prove x + x < z.
  apply ReplE_impred n eps_ z Hz.
  let m. assume Hm1: m :e n. assume Hm2: z = eps_ m.
  rewrite Hm2.
  prove x + x < eps_ m.
  rewrite <- IH m Hm1.
  prove x + x < eps_ (ordsucc m) + eps_ (ordsucc m).
  set y := eps_ (ordsucc m).
  prove x + x < y + y.
  claim Lm: m :e omega.
  { apply nat_p_omega. exact nat_p_trans n Hn m Hm1. }
  claim Ly: SNo y.
  { exact SNo_eps_ (ordsucc m) (omega_ordsucc m Lm). }
  claim Lxy: x < y.
  { apply SNo_eps_decr (ordsucc n) (omega_ordsucc n Ln) (ordsucc m).
    prove ordsucc m :e ordsucc n.
    apply ordinal_ordsucc_In.
    - prove ordinal n. exact nat_p_ordinal n Hn.
    - exact Hm1.
  }
  exact add_SNo_Lt3 x x y y Lx Lx Ly Ly Lxy Lxy.
Qed.

Theorem eps_1_half_eq1 : eps_ 1 + eps_ 1 = 1.
transitivity eps_ 0.
- exact eps_ordsucc_half_add 0 nat_0.
- exact eps_0_1.
Qed.

Theorem eps_1_half_eq2 : 2 * eps_ 1 = 1.
rewrite <- add_SNo_1_1_2.
prove (1 + 1) * eps_ 1 = 1.
rewrite mul_SNo_distrR 1 1 (eps_ 1) SNo_1 SNo_1 SNo_eps_1.
prove 1 * eps_ 1 + 1 * eps_ 1 = 1.
rewrite mul_SNo_oneL (eps_ 1) SNo_eps_1.
exact eps_1_half_eq1.
Qed.

Theorem double_eps_1 : forall x y z, SNo x -> SNo y -> SNo z -> x + x = y + z -> x = eps_ 1 * (y + z).
let x y z. assume Hx Hy Hz H1.
claim Lyz: SNo (y + z).
{ exact SNo_add_SNo y z Hy Hz. }
apply mul_SNo_nonzero_cancel 2 x (eps_ 1 * (y + z)) SNo_2 neq_2_0 Hx (SNo_mul_SNo (eps_ 1) (y + z) (SNo_eps_ 1 (nat_p_omega 1 nat_1)) Lyz).
prove 2 * x = 2 * eps_ 1 * (y + z).
rewrite mul_SNo_assoc 2 (eps_ 1) (y + z) SNo_2 (SNo_eps_ 1 (nat_p_omega 1 nat_1)) Lyz.
prove 2 * x = (2 * eps_ 1) * (y + z).
rewrite eps_1_half_eq2.
prove 2 * x = 1 * (y + z).
rewrite mul_SNo_oneL (y + z) Lyz.
prove 2 * x = y + z.
rewrite <- add_SNo_1_1_2.
prove (1 + 1) * x = y + z.
rewrite mul_SNo_distrR 1 1 x SNo_1 SNo_1 Hx.
prove 1 * x + 1 * x = y + z.
rewrite mul_SNo_oneL x Hx.
prove x + x = y + z.
exact H1.
Qed.

Theorem exp_SNo_1_bd: forall x, SNo x -> 1 <= x -> forall n, nat_p n -> 1 <= x ^ n.
let x. assume Hx Hx1.
apply nat_ind.
- prove 1 <= x ^ 0. rewrite exp_SNo_nat_0 x Hx. apply SNoLe_ref.
- let n. assume Hn.
  assume IHn: 1 <= x ^ n.
  claim Lxn: SNo (x ^ n).
  { exact SNo_exp_SNo_nat x Hx n Hn. }
  prove 1 <= x ^ (ordsucc n).
  rewrite exp_SNo_nat_S x Hx n Hn.
  prove 1 <= x * x ^ n.
  rewrite <- mul_SNo_oneL 1 SNo_1.
  prove 1 * 1 <= x * x ^ n.
  apply nonneg_mul_SNo_Le2 1 1 x (x ^ n) SNo_1 SNo_1 Hx Lxn.
  + prove 0 <= 1. apply SNoLtLe. exact SNoLt_0_1.
  + prove 0 <= 1. apply SNoLtLe. exact SNoLt_0_1.
  + prove 1 <= x. exact Hx1.
  + prove 1 <= x ^ n. exact IHn.
Qed.

Theorem exp_SNo_2_bd: forall n, nat_p n -> n < 2 ^ n.
apply nat_ind.
- prove 0 < 2 ^ 0. rewrite exp_SNo_nat_0 2 SNo_2. exact SNoLt_0_1.
- let n. assume Hn.
  assume IHn: n < 2 ^ n.
  claim Ln: SNo n.
  { exact nat_p_SNo n Hn. }
  claim L2n: SNo (2 ^ n).
  { exact SNo_exp_SNo_nat 2 SNo_2 n Hn. }
  prove ordsucc n < 2 ^ (ordsucc n).
  rewrite exp_SNo_nat_S 2 SNo_2 n Hn.
  prove ordsucc n < 2 * 2 ^ n.
  rewrite <- add_SNo_1_ordsucc n (nat_p_omega n Hn).
  prove n + 1 < 2 * 2 ^ n.
  rewrite <- add_SNo_1_1_2 at 1.
  prove n + 1 < (1 + 1) * 2 ^ n.
  rewrite mul_SNo_distrR 1 1 (2 ^ n) SNo_1 SNo_1 L2n.
  prove n + 1 < 1 * 2 ^ n + 1 * 2 ^ n.
  rewrite mul_SNo_oneL (2 ^ n) L2n.
  prove n + 1 < 2 ^ n + 2 ^ n.
  apply SNoLtLe_tra (n + 1) (2 ^ n + 1) (2 ^ n + 2 ^ n)
                    (SNo_add_SNo n 1 Ln SNo_1)
                    (SNo_add_SNo (2 ^ n) 1 L2n SNo_1)
                    (SNo_add_SNo (2 ^ n) (2 ^ n) L2n L2n).
  + prove n + 1 < 2 ^ n + 1.
    exact add_SNo_Lt1 n 1 (2 ^ n) Ln SNo_1 L2n IHn.
  + prove 2 ^ n + 1 <= 2 ^ n + 2 ^ n.
    apply add_SNo_Le2 (2 ^ n) 1 (2 ^ n) L2n SNo_1 L2n.
    prove 1 <= 2 ^ n.
    apply exp_SNo_1_bd 2 SNo_2.
    * prove 1 <= 2. apply SNoLtLe. exact SNoLt_1_2.
    * exact Hn.
Qed.

Theorem mul_SNo_eps_power_2: forall n, nat_p n -> eps_ n * 2 ^ n = 1.
apply nat_ind.
- prove eps_ 0 * 2 ^ 0 = 1.
  rewrite eps_0_1. rewrite exp_SNo_nat_0 2 SNo_2.
  prove 1 * 1 = 1. exact mul_SNo_oneR 1 SNo_1.
- let n. assume Hn.
  assume IHn: eps_ n * 2 ^ n = 1.
  prove eps_ (ordsucc n) * 2 ^ (ordsucc n) = 1.
  rewrite exp_SNo_nat_S 2 SNo_2 n Hn.
  prove eps_ (ordsucc n) * (2 * 2 ^ n) = 1.
  claim LeSn: SNo (eps_ (ordsucc n)).
  { exact SNo_eps_ (ordsucc n) (nat_p_omega (ordsucc n) (nat_ordsucc n Hn)). }
  rewrite mul_SNo_assoc (eps_ (ordsucc n)) 2 (2 ^ n) LeSn SNo_2 (SNo_exp_SNo_nat 2 SNo_2 n Hn).
  prove (eps_ (ordsucc n) * 2) * 2 ^ n = 1.
  rewrite <- add_SNo_1_1_2 at 1.
  prove (eps_ (ordsucc n) * (1 + 1)) * 2 ^ n = 1.
  rewrite mul_SNo_distrL (eps_ (ordsucc n)) 1 1 LeSn SNo_1 SNo_1.
  prove ((eps_ (ordsucc n) * 1) + (eps_ (ordsucc n) * 1)) * 2 ^ n = 1.
  rewrite mul_SNo_oneR (eps_ (ordsucc n)) LeSn.
  prove (eps_ (ordsucc n) + eps_ (ordsucc n)) * 2 ^ n = 1.
  rewrite eps_ordsucc_half_add n Hn.
  prove eps_ n * 2 ^ n = 1.
  exact IHn.
Qed.

Theorem eps_bd_1 : forall n :e omega, eps_ n <= 1.
let n. assume Hn.
prove eps_ n <= 1.
rewrite <- mul_SNo_oneR (eps_ n) (SNo_eps_ n Hn).
prove eps_ n * 1 <= 1.
rewrite <- mul_SNo_eps_power_2 n (omega_nat_p n Hn) at 2.
prove eps_ n * 1 <= eps_ n * 2 ^ n.
apply nonneg_mul_SNo_Le (eps_ n) 1 (2 ^ n) (SNo_eps_ n Hn).
- prove 0 <= eps_ n. apply SNoLtLe. exact SNo_eps_pos n Hn.
- exact SNo_1.
- prove SNo (2 ^ n). apply SNo_exp_SNo_nat.
  + exact SNo_2.
  + prove nat_p n. exact omega_nat_p n Hn.
- prove 1 <= 2 ^ n. apply exp_SNo_1_bd 2 SNo_2.
  + prove 1 <= 2. apply SNoLtLe. exact SNoLt_1_2.
  + prove nat_p n. exact omega_nat_p n Hn.
Qed.

Theorem mul_SNo_eps_power_2': forall n, nat_p n -> 2 ^ n * eps_ n = 1.
let n. assume Hn.
transitivity eps_ n * 2 ^ n.
- apply mul_SNo_com.
  + exact SNo_exp_SNo_nat 2 SNo_2 n Hn.
  + exact SNo_eps_ n (nat_p_omega n Hn).
- exact mul_SNo_eps_power_2 n Hn.
Qed.

Theorem exp_SNo_nat_mul_add : forall x, SNo x -> forall m, nat_p m -> forall n, nat_p n -> x ^ m * x ^ n = x ^ (m + n).
let x. assume Hx. let m. assume Hm.
claim Lm: SNo m.
{ exact nat_p_SNo m Hm. }
apply nat_ind.
- prove x ^ m * x ^ 0 = x ^ (m + 0).
  rewrite exp_SNo_nat_0 x Hx.
  rewrite add_SNo_0R m Lm.
  exact mul_SNo_oneR (x ^ m) (SNo_exp_SNo_nat x Hx m Hm).
- let n. assume Hn: nat_p n.
  assume IHn: x ^ m * x ^ n = x ^ (m + n).
  prove x ^ m * x ^ (ordsucc n) = x ^ (m + ordsucc n).
  rewrite exp_SNo_nat_S x Hx n Hn.
  prove x ^ m * (x * x ^ n) = x ^ (m + ordsucc n).
  rewrite <- add_nat_add_SNo m (nat_p_omega m Hm) (ordsucc n) (omega_ordsucc n (nat_p_omega n Hn)).
  prove x ^ m * (x * x ^ n) = x ^ (add_nat m (ordsucc n)).
  rewrite add_nat_SR m n Hn.
  prove x ^ m * (x * x ^ n) = x ^ (ordsucc (add_nat m n)).
  rewrite exp_SNo_nat_S x Hx (add_nat m n) (add_nat_p m Hm n Hn).
  prove x ^ m * (x * x ^ n) = x * x ^ (add_nat m n).
  rewrite add_nat_add_SNo m (nat_p_omega m Hm) n (nat_p_omega n Hn).
  prove x ^ m * (x * x ^ n) = x * x ^ (m + n).
  rewrite <- IHn.
  prove x ^ m * (x * x ^ n) = x * (x ^ m * x ^ n).
  rewrite mul_SNo_assoc (x ^ m) x (x ^ n) (SNo_exp_SNo_nat x Hx m Hm) Hx (SNo_exp_SNo_nat x Hx n Hn).
  prove (x ^ m * x) * x ^ n = x * (x ^ m * x ^ n).
  rewrite mul_SNo_com (x ^ m) x (SNo_exp_SNo_nat x Hx m Hm) Hx.
  prove (x * x ^ m) * x ^ n = x * (x ^ m * x ^ n).
  symmetry.
  exact mul_SNo_assoc x (x ^ m) (x ^ n) Hx (SNo_exp_SNo_nat x Hx m Hm) (SNo_exp_SNo_nat x Hx n Hn).
Qed.

Theorem exp_SNo_nat_mul_add' : forall x, SNo x -> forall m n :e omega, x ^ m * x ^ n = x ^ (m + n).
let x. assume Hx. let m. assume Hm. let n. assume Hn.
exact exp_SNo_nat_mul_add x Hx m (omega_nat_p m Hm) n (omega_nat_p n Hn).
Qed.

Theorem exp_SNo_nat_pos : forall x, SNo x -> 0 < x -> forall n, nat_p n -> 0 < x ^ n.
let x. assume Hx Hxpos.
apply nat_ind.
- prove 0 < x ^ 0. rewrite exp_SNo_nat_0 x Hx. prove 0 < 1. exact SNoLt_0_1.
- let n. assume Hn: nat_p n.
  assume IHn: 0 < x ^ n.
  prove 0 < x ^ (ordsucc n).
  rewrite exp_SNo_nat_S x Hx n Hn.
  prove 0 < x * x ^ n.
  rewrite <- mul_SNo_zeroR x Hx.
  prove x * 0 < x * x ^ n.
  exact pos_mul_SNo_Lt x 0 (x ^ n) Hx Hxpos SNo_0 (SNo_exp_SNo_nat x Hx n Hn) IHn.
Qed.

Theorem mul_SNo_eps_eps_add_SNo: forall m n :e omega, eps_ m * eps_ n = eps_ (m + n).
let m. assume Hm. let n. assume Hn.
claim Lmn1: m + n :e omega.
{ exact add_SNo_In_omega m Hm n Hn. }
claim Lmn2: nat_p (m + n).
{ exact omega_nat_p (m + n) Lmn1. }
claim Lem: SNo (eps_ m).
{ exact SNo_eps_ m Hm. }
claim Len: SNo (eps_ n).
{ exact SNo_eps_ n Hn. }
claim Lemen: SNo (eps_ m * eps_ n).
{ exact SNo_mul_SNo (eps_ m) (eps_ n) Lem Len. }
claim Lemn: SNo (eps_ (m + n)).
{ exact SNo_eps_ (m + n) Lmn1. }
claim L2m: SNo (2 ^ m).
{ exact SNo_exp_SNo_nat 2 SNo_2 m (omega_nat_p m Hm). }
claim L2n: SNo (2 ^ n).
{ exact SNo_exp_SNo_nat 2 SNo_2 n (omega_nat_p n Hn). }
apply mul_SNo_nonzero_cancel (2 ^ (m + n)).
- prove SNo (2 ^ (m + n)).
  exact SNo_exp_SNo_nat 2 SNo_2 (m + n) Lmn2.
- prove 2 ^ (m + n) <> 0.
  assume H1: 2 ^ (m + n) = 0.
  apply SNoLt_irref 0.
  prove 0 < 0. rewrite <- H1 at 2.
  prove 0 < 2 ^ (m + n).
  exact exp_SNo_nat_pos 2 SNo_2 SNoLt_0_2 (m + n) Lmn2.
- prove SNo (eps_ m * eps_ n). exact Lemen.
- prove SNo (eps_ (m + n)). exact Lemn.
- prove 2 ^ (m + n) * (eps_ m * eps_ n) = 2 ^ (m + n) * eps_ (m + n).
  transitivity (2 ^ m * 2 ^ n) * (eps_ m * eps_ n),
               2 ^ m * (2 ^ n * (eps_ m * eps_ n)),
               2 ^ m * eps_ m,
	       1.
  + f_equal. symmetry. exact exp_SNo_nat_mul_add' 2 SNo_2 m Hm n Hn.
  + symmetry.
    exact mul_SNo_assoc (2 ^ m) (2 ^ n) (eps_ m * eps_ n) L2m L2n (SNo_mul_SNo (eps_ m) (eps_ n) Lem Len).
  + f_equal.
    prove 2 ^ n * (eps_ m * eps_ n) = eps_ m.
    transitivity (2 ^ n * eps_ n) * eps_ m, 1 * eps_ m.
    * rewrite mul_SNo_com (eps_ m) (eps_ n) Lem Len.
      exact mul_SNo_assoc (2 ^ n) (eps_ n) (eps_ m) L2n Len Lem.
    * f_equal. exact mul_SNo_eps_power_2' n (omega_nat_p n Hn).
    * exact mul_SNo_oneL (eps_ m) Lem.
  + prove 2 ^ m * eps_ m = 1. exact mul_SNo_eps_power_2' m (omega_nat_p m Hm).
  + symmetry.
    prove 2 ^ (m + n) * eps_ (m + n) = 1.
    exact mul_SNo_eps_power_2' (m + n) Lmn2.
Qed.

Theorem SNoS_omega_Lev_equip : forall n, nat_p n -> equip {x :e SNoS_ omega|SNoLev x = n} (2 ^ n).
apply nat_ind.
- prove equip {x :e SNoS_ omega|SNoLev x = 0} (2 ^ 0).
  rewrite exp_SNo_nat_0 2 SNo_2.
  prove equip {x :e SNoS_ omega|SNoLev x = 0} 1.
  apply equip_sym.
  prove exists f:set -> set, bij 1 {x :e SNoS_ omega|SNoLev x = 0} f.
  set f := fun i:set => 0.
  witness f.
  apply bijI.
  + let i. assume Hi: i :e 1.
    prove 0 :e {x :e SNoS_ omega|SNoLev x = 0}.
    apply SepI.
    * prove 0 :e SNoS_ omega.
      apply SNoS_I omega omega_ordinal 0 0 (nat_p_omega 0 nat_0).
      prove SNo_ 0 0. exact ordinal_SNo_ 0 ordinal_Empty.
    * prove SNoLev 0 = 0. exact SNoLev_0.
  + let i. assume Hi: i :e 1. let j. assume Hj: j :e 1.
    assume Hij: 0 = 0.
    prove i = j.
    apply cases_1 i Hi. apply cases_1 j Hj.
    prove 0 = 0. exact Hij. (** smaller proof than reflexivity, so use it **)
  + let x. assume Hx: x :e {x :e SNoS_ omega|SNoLev x = 0}.
    apply SepE (SNoS_ omega) (fun x => SNoLev x = 0) x Hx.
    assume Hx1: x :e SNoS_ omega.
    assume Hx2: SNoLev x = 0.
    apply SNoS_E2 omega omega_ordinal x Hx1.
    assume Hx1a: SNoLev x :e omega.
    assume Hx1b: ordinal (SNoLev x).
    assume Hx1c: SNo x.
    assume Hx1d: SNo_ (SNoLev x) x.
    claim L1: x = 0.
    { symmetry. apply SNo_eq 0 x SNo_0 Hx1c.
      - prove SNoLev 0 = SNoLev x. rewrite SNoLev_0. symmetry. exact Hx2.
      - prove SNoEq_ (SNoLev 0) 0 x. rewrite SNoLev_0.
        let alpha. assume Ha: alpha :e 0. prove False. exact EmptyE alpha Ha.
    }
    witness 0. apply andI.
    * exact In_0_1.
    * prove 0 = x. symmetry. exact L1.
- let n. assume Hn.
  assume IHn: equip {x :e SNoS_ omega|SNoLev x = n} (2 ^ n).
  prove equip {x :e SNoS_ omega|SNoLev x = ordsucc n} (2 ^ ordsucc n).
  rewrite exp_SNo_nat_S 2 SNo_2 n Hn.
  prove equip {x :e SNoS_ omega|SNoLev x = ordsucc n} (2 * 2 ^ n).
  rewrite <- add_SNo_1_1_2 at 1.
  prove equip {x :e SNoS_ omega|SNoLev x = ordsucc n} ((1 + 1) * 2 ^ n).
  rewrite mul_SNo_distrR 1 1 (2 ^ n) SNo_1 SNo_1 (SNo_exp_SNo_nat 2 SNo_2 n Hn).
  rewrite mul_SNo_oneL (2 ^ n) (SNo_exp_SNo_nat 2 SNo_2 n Hn).
  prove equip {x :e SNoS_ omega|SNoLev x = ordsucc n} (2 ^ n + 2 ^ n).
  claim L2n1: nat_p (2 ^ n).
  { exact nat_exp_SNo_nat 2 nat_2 n Hn. }
  claim L2n2: ordinal (2 ^ n).
  { apply nat_p_ordinal. exact L2n1. }
  claim L2n3: SNo (2 ^ n).
  { apply ordinal_SNo. exact L2n2. }
  claim L2n2n1: nat_p (2 ^ n + 2 ^ n).
  { apply omega_nat_p. apply add_SNo_In_omega.
    - apply nat_p_omega. exact L2n1.
    - apply nat_p_omega. exact L2n1.
  }
  claim L2n2n2: ordinal (2 ^ n + 2 ^ n).
  { apply nat_p_ordinal. exact L2n2n1. }
  claim L2n2n3: SNo (2 ^ n + 2 ^ n).
  { apply ordinal_SNo. exact L2n2n2. }
  claim L2npLt2n2n: forall m, SNo m -> m < 2 ^ n -> 2 ^ n + m < 2 ^ n + 2 ^ n.
  { let m. assume Hm H1.
    exact add_SNo_Lt2 (2 ^ n) m (2 ^ n) L2n3 Hm L2n3 H1.
  }
  claim L2nLt2n2n: 2 ^ n < 2 ^ n + 2 ^ n.
  { rewrite <- add_SNo_0R (2 ^ n) L2n3 at 1.
    prove 2 ^ n + 0 < 2 ^ n + 2 ^ n.
    apply L2npLt2n2n 0 SNo_0.
    prove 0 < 2 ^ n.
    exact exp_SNo_nat_pos 2 SNo_2 SNoLt_0_2 n Hn.
  }
  apply IHn.
  let f.
  assume Hf: bij {x :e SNoS_ omega|SNoLev x = n} (2 ^ n) f.
  apply bijE {x :e SNoS_ omega|SNoLev x = n} (2 ^ n) f Hf.
  assume Hf1: forall u :e {x :e SNoS_ omega|SNoLev x = n}, f u :e (2 ^ n).
  assume Hf2: forall u v :e {x :e SNoS_ omega|SNoLev x = n}, f u = f v -> u = v.
  assume Hf3: forall w :e 2 ^ n, exists u :e {x :e SNoS_ omega|SNoLev x = n}, f u = w.
  claim L2: forall x :e {x :e SNoS_ omega|SNoLev x = ordsucc n},
     forall p:prop,
          (SNo x
        -> SNoLev x = ordsucc n
        -> (x :/\: SNoElts_ n) :e {x :e SNoS_ omega|SNoLev x = n}
        -> SNo (x :/\: SNoElts_ n)
        -> SNoLev (x :/\: SNoElts_ n) = n
        -> p)
       -> p.
  { let x. assume Hx.
    apply SepE (SNoS_ omega) (fun x => SNoLev x = ordsucc n) x Hx.
    assume Hx HxSn.
    apply SNoS_E2 omega omega_ordinal x Hx.
    assume Hx1: SNoLev x :e omega.
    assume Hx2: ordinal (SNoLev x).
    assume Hx3: SNo x.
    assume Hx4: SNo_ (SNoLev x) x.
    let p. assume Hp.
    claim L2a: n :e SNoLev x.
    { rewrite HxSn. apply ordsuccI2. }
    claim L2b: SNoLev (x :/\: SNoElts_ n) = n.
    { exact restr_SNoLev x Hx3 n L2a. }
    apply Hp.
    - exact Hx3.
    - exact HxSn.
    - apply SepI.
      + prove (x :/\: SNoElts_ n) :e SNoS_ omega.
        apply SNoS_I omega omega_ordinal (x :/\: SNoElts_ n) n (nat_p_omega n Hn).
        prove SNo_ n (x :/\: SNoElts_ n).
        exact restr_SNo_ x Hx3 n L2a.
      + prove SNoLev (x :/\: SNoElts_ n) = n. exact L2b.
    - exact restr_SNo x Hx3 n L2a.
    - exact L2b.
  }
  claim Lf: forall u :e {x :e SNoS_ omega|SNoLev x = ordsucc n},
              forall p:prop,
                  (nat_p (f (u :/\: SNoElts_ n))
                -> ordinal (f (u :/\: SNoElts_ n))
                -> SNo (f (u :/\: SNoElts_ n))
                -> f (u :/\: SNoElts_ n) < 2 ^ n
                -> p)
               -> p.
  { let u. assume Hu. let p. assume Hp.
    apply L2 u Hu.
    assume Hu0a: SNo u.
    assume Hu0b: SNoLev u = ordsucc n.
    assume Hu1: (u :/\: SNoElts_ n) :e {x :e SNoS_ omega|SNoLev x = n}.
    assume Hu2: SNo (u :/\: SNoElts_ n).
    assume Hu3: SNoLev (u :/\: SNoElts_ n) = n.
    claim Lf1a: f (u :/\: SNoElts_ n) :e 2 ^ n.
    { exact Hf1 (u :/\: SNoElts_ n) Hu1. }
    claim Lf1b: nat_p (f (u :/\: SNoElts_ n)).
    { exact nat_p_trans (2 ^ n) L2n1 (f (u :/\: SNoElts_ n)) Lf1a. }
    claim Lf1c: ordinal (f (u :/\: SNoElts_ n)).
    { exact nat_p_ordinal (f (u :/\: SNoElts_ n)) Lf1b. }
    apply Hp.
    - exact Lf1b.
    - exact Lf1c.
    - apply ordinal_SNo. exact Lf1c.
    - apply ordinal_In_SNoLt.
      + prove ordinal (2 ^ n). exact L2n2.
      + prove f (u :/\: SNoElts_ n) :e 2 ^ n. exact Lf1a.
  }
  claim Lg: exists g:set -> set, (forall x, n :e x -> g x = f (x :/\: SNoElts_ n)) /\ (forall x, n /:e x -> g x = 2 ^ n + f (x :/\: SNoElts_ n)).
  { witness (fun x => if n :e x then f (x :/\: SNoElts_ n) else 2 ^ n + f (x :/\: SNoElts_ n)).
    apply andI.
    - let x. assume H1: n :e x.
      exact If_i_1 (n :e x) (f (x :/\: SNoElts_ n)) (2 ^ n + f (x :/\: SNoElts_ n)) H1.
    - let x. assume H1: n /:e x.
      exact If_i_0 (n :e x) (f (x :/\: SNoElts_ n)) (2 ^ n + f (x :/\: SNoElts_ n)) H1.
  }
  apply Lg. let g. assume H. apply H.
  assume Hg1: forall x, n :e x -> g x = f (x :/\: SNoElts_ n).
  assume Hg2: forall x, n /:e x -> g x = 2 ^ n + f (x :/\: SNoElts_ n).
  prove exists g:set -> set, bij {x :e SNoS_ omega|SNoLev x = ordsucc n} (2 ^ n + 2 ^ n) g.
  witness g. apply bijI.
  + let u. assume Hu: u :e {x :e SNoS_ omega|SNoLev x = ordsucc n}.
    prove g u :e 2 ^ n + 2 ^ n.
    apply L2 u Hu.
    assume Hu0a: SNo u.
    assume Hu0b: SNoLev u = ordsucc n.
    assume Hu1: (u :/\: SNoElts_ n) :e {x :e SNoS_ omega|SNoLev x = n}.
    assume Hu2: SNo (u :/\: SNoElts_ n).
    assume Hu3: SNoLev (u :/\: SNoElts_ n) = n.
    apply Lf u Hu.
    assume Lfu1: nat_p (f (u :/\: SNoElts_ n)).
    assume Lfu2: ordinal (f (u :/\: SNoElts_ n)).
    assume Lfu3: SNo (f (u :/\: SNoElts_ n)).
    assume Lfu4: f (u :/\: SNoElts_ n) < 2 ^ n.
    apply xm (n :e u).
    * assume H1: n :e u. rewrite Hg1 u H1.
      prove f (u :/\: SNoElts_ n) :e 2 ^ n + 2 ^ n.
      apply ordinal_SNoLt_In (f (u :/\: SNoElts_ n)) (2 ^ n + 2 ^ n) Lfu2 L2n2n2.
      prove f (u :/\: SNoElts_ n) < 2 ^ n + 2 ^ n.
      exact SNoLt_tra (f (u :/\: SNoElts_ n)) (2 ^ n) (2 ^ n + 2 ^ n) Lfu3 L2n3 L2n2n3 Lfu4 L2nLt2n2n.
    * assume H1: n /:e u. rewrite Hg2 u H1.
      prove 2 ^ n + f (u :/\: SNoElts_ n) :e 2 ^ n + 2 ^ n.
      apply ordinal_SNoLt_In (2 ^ n + f (u :/\: SNoElts_ n)) (2 ^ n + 2 ^ n)
                             (add_SNo_ordinal_ordinal (2 ^ n) L2n2 (f (u :/\: SNoElts_ n)) Lfu2)
                             L2n2n2.
      prove 2 ^ n + f (u :/\: SNoElts_ n) < 2 ^ n + 2 ^ n.
      exact L2npLt2n2n (f (u :/\: SNoElts_ n)) Lfu3 Lfu4.
  + let u. assume Hu: u :e {x :e SNoS_ omega|SNoLev x = ordsucc n}.
    let v. assume Hv: v :e {x :e SNoS_ omega|SNoLev x = ordsucc n}.
    apply L2 u Hu.
    assume Hu0a: SNo u.
    assume Hu0b: SNoLev u = ordsucc n.
    assume Hu1: (u :/\: SNoElts_ n) :e {x :e SNoS_ omega|SNoLev x = n}.
    assume Hu2: SNo (u :/\: SNoElts_ n).
    assume Hu3: SNoLev (u :/\: SNoElts_ n) = n.
    apply Lf u Hu.
    assume Lfu1: nat_p (f (u :/\: SNoElts_ n)).
    assume Lfu2: ordinal (f (u :/\: SNoElts_ n)).
    assume Lfu3: SNo (f (u :/\: SNoElts_ n)).
    assume Lfu4: f (u :/\: SNoElts_ n) < 2 ^ n.
    apply L2 v Hv.
    assume Hv0a: SNo v.
    assume Hv0b: SNoLev v = ordsucc n.
    assume Hv1: (v :/\: SNoElts_ n) :e {x :e SNoS_ omega|SNoLev x = n}.
    assume Hv2: SNo (v :/\: SNoElts_ n).
    assume Hv3: SNoLev (v :/\: SNoElts_ n) = n.
    apply Lf v Hv.
    assume Lfv1: nat_p (f (v :/\: SNoElts_ n)).
    assume Lfv2: ordinal (f (v :/\: SNoElts_ n)).
    assume Lfv3: SNo (f (v :/\: SNoElts_ n)).
    assume Lfv4: f (v :/\: SNoElts_ n) < 2 ^ n.
    claim LnLu: n :e SNoLev u.
    { rewrite Hu0b. apply ordsuccI2. }
    claim LnLv: n :e SNoLev v.
    { rewrite Hv0b. apply ordsuccI2. }
    apply xm (n :e u).
    * { assume H1: n :e u. rewrite Hg1 u H1.
        apply xm (n :e v).
        - assume H2: n :e v. rewrite Hg1 v H2.
          assume Hguv: f (u :/\: SNoElts_ n) = f (v :/\: SNoElts_ n).
          prove u = v.
          claim Luv: u :/\: SNoElts_ n = v :/\: SNoElts_ n.
          { exact Hf2 (u :/\: SNoElts_ n) Hu1 (v :/\: SNoElts_ n) Hv1 Hguv. }
          apply SNo_eq u v Hu0a Hv0a.
          + prove SNoLev u = SNoLev v. rewrite Hv0b. exact Hu0b.
          + prove SNoEq_ (SNoLev u) u v.
            rewrite Hu0b.
            prove SNoEq_ (ordsucc n) u v.
            let i. assume Hi: i :e ordsucc n.
            apply ordsuccE n i Hi.
            * { assume H3: i :e n.
                prove i :e u <-> i :e v.
                apply iff_trans (i :e u) (i :e u :/\: SNoElts_ n) (i :e v).
                - prove i :e u <-> i :e u :/\: SNoElts_ n.
                  apply iff_sym.
                  exact restr_SNoEq u ?? n LnLu i H3.
                - prove i :e u :/\: SNoElts_ n <-> i :e v.
                  rewrite Luv.
                  prove i :e v :/\: SNoElts_ n <-> i :e v.
                  exact restr_SNoEq v ?? n LnLv i H3.
              }
            * { assume H3: i = n. rewrite H3. apply iffI.
                - assume _. exact H2.
                - assume _. exact H1.
              }
        - assume H2: n /:e v. rewrite Hg2 v H2.
          assume Hguv: f (u :/\: SNoElts_ n) = 2 ^ n + f (v :/\: SNoElts_ n).
          prove False.
          apply SNoLt_irref (2 ^ n).
          prove 2 ^ n < 2 ^ n.
          apply SNoLeLt_tra (2 ^ n) (2 ^ n + f (v :/\: SNoElts_ n)) (2 ^ n)
                            L2n3
                            (SNo_add_SNo (2 ^ n) (f (v :/\: SNoElts_ n)) L2n3 Lfv3)
                            L2n3.
          + prove 2 ^ n <= 2 ^ n + f (v :/\: SNoElts_ n).
            rewrite <- add_SNo_0R (2 ^ n) L2n3 at 1.
            prove 2 ^ n + 0 <= 2 ^ n + f (v :/\: SNoElts_ n).
            apply add_SNo_Le2 (2 ^ n) 0 (f (v :/\: SNoElts_ n)) L2n3 SNo_0 Lfv3.
            prove 0 <= f (v :/\: SNoElts_ n).
            exact omega_nonneg (f (v :/\: SNoElts_ n)) (nat_p_omega (f (v :/\: SNoElts_ n)) Lfv1).
          + prove 2 ^ n + f (v :/\: SNoElts_ n) < 2 ^ n.
            rewrite <- Hguv. exact Lfu4.
      }
    * { assume H1: n /:e u. rewrite Hg2 u H1.
        apply xm (n :e v).
        - assume H2: n :e v. rewrite Hg1 v H2.
          assume Hguv: 2 ^ n + f (u :/\: SNoElts_ n) = f (v :/\: SNoElts_ n).
          prove False.
          apply SNoLt_irref (2 ^ n).
          prove 2 ^ n < 2 ^ n.
          apply SNoLeLt_tra (2 ^ n) (2 ^ n + f (u :/\: SNoElts_ n)) (2 ^ n)
                            L2n3
                            (SNo_add_SNo (2 ^ n) (f (u :/\: SNoElts_ n)) L2n3 Lfu3)
                            L2n3.
          + prove 2 ^ n <= 2 ^ n + f (u :/\: SNoElts_ n).
            rewrite <- add_SNo_0R (2 ^ n) L2n3 at 1.
            prove 2 ^ n + 0 <= 2 ^ n + f (u :/\: SNoElts_ n).
            apply add_SNo_Le2 (2 ^ n) 0 (f (u :/\: SNoElts_ n)) L2n3 SNo_0 Lfu3.
            prove 0 <= f (u :/\: SNoElts_ n).
            exact omega_nonneg (f (u :/\: SNoElts_ n)) (nat_p_omega (f (u :/\: SNoElts_ n)) Lfu1).
          + prove 2 ^ n + f (u :/\: SNoElts_ n) < 2 ^ n.
            rewrite Hguv. exact Lfv4.
        - assume H2: n /:e v. rewrite Hg2 v H2.
          assume Hguv: 2 ^ n + f (u :/\: SNoElts_ n) = 2 ^ n + f (v :/\: SNoElts_ n).
          prove u = v.
          claim Luv: u :/\: SNoElts_ n = v :/\: SNoElts_ n.
          { apply Hf2 (u :/\: SNoElts_ n) Hu1 (v :/\: SNoElts_ n) Hv1.
            prove f (u :/\: SNoElts_ n) = f (v :/\: SNoElts_ n).
            exact add_SNo_cancel_L (2 ^ n) (f (u :/\: SNoElts_ n)) (f (v :/\: SNoElts_ n)) L2n3 Lfu3 Lfv3 Hguv.
          }
          apply SNo_eq u v Hu0a Hv0a.
          + prove SNoLev u = SNoLev v. rewrite Hv0b. exact Hu0b.
          + prove SNoEq_ (SNoLev u) u v.
            rewrite Hu0b.
            prove SNoEq_ (ordsucc n) u v.
            let i. assume Hi: i :e ordsucc n.
            apply ordsuccE n i Hi.
            * { assume H3: i :e n.
                prove i :e u <-> i :e v.
                apply iff_trans (i :e u) (i :e u :/\: SNoElts_ n) (i :e v).
                - prove i :e u <-> i :e u :/\: SNoElts_ n.
                  apply iff_sym.
                  exact restr_SNoEq u ?? n LnLu i H3.
                - prove i :e u :/\: SNoElts_ n <-> i :e v.
                  rewrite Luv.
                  prove i :e v :/\: SNoElts_ n <-> i :e v.
                  exact restr_SNoEq v ?? n LnLv i H3.
              }
            * { assume H3: i = n. rewrite H3. apply iffI.
                - assume H4: n :e u. prove False. exact H1 H4.
                - assume H4: n :e v. prove False. exact H2 H4.
              }
      }
  + prove forall m :e 2 ^ n + 2 ^ n, exists u :e {x :e SNoS_ omega|SNoLev x = ordsucc n}, g u = m.
    let m. assume Hm: m :e 2 ^ n + 2 ^ n.
    claim Lm1: nat_p m.
    { exact nat_p_trans (2 ^ n + 2 ^ n) L2n2n1 m Hm. }
    claim Lm2: SNo m.
    { exact nat_p_SNo m Lm1. }
    apply add_SNo_omega_In_cases m (2 ^ n) (nat_p_omega (2 ^ n) L2n1) (2 ^ n) L2n1 Hm.
    * { assume H1: m :e 2 ^ n.
        apply Hf3 m H1.
        let u. assume H. apply H.
        assume Hu1: u :e {x :e SNoS_ omega|SNoLev x = n}.
        assume Hu2: f u = m.
        apply SepE (SNoS_ omega) (fun x => SNoLev x = n) u Hu1.
        assume Hu3: u :e SNoS_ omega.
        assume Hu4: SNoLev u = n.
        apply SNoS_E2 omega omega_ordinal u Hu3.
        assume Hu3a Hu3b Hu3c Hu3d.
        claim Lu1: SNo (SNo_extend1 u).
        { exact SNo_extend1_SNo u ??. }
        claim Lu2: SNoLev (SNo_extend1 u) = ordsucc n.
        { rewrite <- Hu4. exact SNo_extend1_SNoLev u ??. }
        claim Lu3: n :e SNo_extend1 u.
        { rewrite <- Hu4. exact SNo_extend1_In u ??. }
        witness (SNo_extend1 u). apply andI.
        - prove SNo_extend1 u :e {x :e SNoS_ omega|SNoLev x = ordsucc n}.
          apply SepI.
          + apply SNoS_I omega omega_ordinal (SNo_extend1 u) (ordsucc n).
            * prove ordsucc n :e omega. apply omega_ordsucc. exact nat_p_omega n Hn.
            * prove SNo_ (ordsucc n) (SNo_extend1 u).
              rewrite <- Hu4.
              prove SNo_ (ordsucc (SNoLev u)) (SNo_extend1 u).
              exact SNo_extend1_SNo_ u ??.
          + prove SNoLev (SNo_extend1 u) = ordsucc n. exact Lu2.
        - prove g (SNo_extend1 u) = m.
          rewrite Hg1 (SNo_extend1 u) Lu3.
          prove f (SNo_extend1 u :/\: SNoElts_ n) = m.
          rewrite <- Hu4.
          prove f (SNo_extend1 u :/\: SNoElts_ (SNoLev u)) = m.
          rewrite <- SNo_extend1_restr_eq u Hu3c.
          exact Hu2.
      }
    * { assume H1: m + - 2 ^ n :e 2 ^ n.
        apply Hf3 (m + - 2 ^ n) H1.
        let u. assume H. apply H.
        assume Hu1: u :e {x :e SNoS_ omega|SNoLev x = n}.
        assume Hu2: f u = m + - 2 ^ n.
        apply SepE (SNoS_ omega) (fun x => SNoLev x = n) u Hu1.
        assume Hu3: u :e SNoS_ omega.
        assume Hu4: SNoLev u = n.
        apply SNoS_E2 omega omega_ordinal u Hu3.
        assume Hu3a Hu3b Hu3c Hu3d.
        claim Lu1: SNo (SNo_extend0 u).
        { exact SNo_extend0_SNo u ??. }
        claim Lu2: SNoLev (SNo_extend0 u) = ordsucc n.
        { rewrite <- Hu4. exact SNo_extend0_SNoLev u ??. }
        claim Lu3: n /:e SNo_extend0 u.
        { rewrite <- Hu4. exact SNo_extend0_nIn u ??. }
        witness (SNo_extend0 u). apply andI.
        - prove SNo_extend0 u :e {x :e SNoS_ omega|SNoLev x = ordsucc n}.
          apply SepI.
          + apply SNoS_I omega omega_ordinal (SNo_extend0 u) (ordsucc n).
            * prove ordsucc n :e omega. apply omega_ordsucc. exact nat_p_omega n Hn.
            * prove SNo_ (ordsucc n) (SNo_extend0 u).
              rewrite <- Hu4.
              prove SNo_ (ordsucc (SNoLev u)) (SNo_extend0 u).
              exact SNo_extend0_SNo_ u ??.
          + prove SNoLev (SNo_extend0 u) = ordsucc n. exact Lu2.
        - prove g (SNo_extend0 u) = m.
          rewrite Hg2 (SNo_extend0 u) Lu3.
          prove 2 ^ n + f (SNo_extend0 u :/\: SNoElts_ n) = m.
          rewrite <- Hu4 at 2.
          prove 2 ^ n + f (SNo_extend0 u :/\: SNoElts_ (SNoLev u)) = m.
          rewrite <- SNo_extend0_restr_eq u Hu3c.
          prove 2 ^ n + f u = m.
          rewrite Hu2.
          prove 2 ^ n + (m + - 2 ^ n) = m.
          rewrite add_SNo_com (2 ^ n) (m + - 2 ^ n) L2n3 (SNo_add_SNo m (- 2 ^ n) Lm2 (SNo_minus_SNo (2 ^ n) L2n3)).
          prove (m + - 2 ^ n) + 2 ^ n = m.
          rewrite <- add_SNo_assoc m (- 2 ^ n) (2 ^ n) Lm2 (SNo_minus_SNo (2 ^ n) L2n3) L2n3.
          prove m + (- 2 ^ n + 2 ^ n) = m.
          rewrite add_SNo_minus_SNo_linv (2 ^ n) L2n3.
          prove m + 0 = m.
          exact add_SNo_0R m Lm2.
      }
Qed.

Theorem SNoS_finite : forall n :e omega, finite (SNoS_ n).
let n. assume Hn.
claim Ln: nat_p n.
{ exact omega_nat_p n Hn. }
claim Ln2: ordinal n.
{ exact nat_p_ordinal n Ln. }
claim L1: SNoS_ n = \/_ i :e n, {x :e SNoS_ omega|SNoLev x = i}.
{ apply set_ext.
  - let x. assume Hx.
    apply SNoS_E2 n Ln2 x Hx.
    assume Hx1: SNoLev x :e n.
    assume Hx2: ordinal (SNoLev x).
    assume Hx3: SNo x.
    assume Hx4: SNo_ (SNoLev x) x.
    apply famunionI n (fun i => {x :e SNoS_ omega|SNoLev x = i}) (SNoLev x) x Hx1.
    prove x :e {x' :e SNoS_ omega|SNoLev x' = SNoLev x}.
    apply SepI.
    + prove x :e SNoS_ omega.
      apply SNoS_Subq n omega Ln2 omega_ordinal.
      * prove n c= omega. exact omega_TransSet n Hn.
      * exact Hx.
    + prove SNoLev x = SNoLev x. reflexivity.
  - let x. assume Hx.
    apply famunionE_impred n (fun i => {x :e SNoS_ omega|SNoLev x = i}) x Hx.
    let i. assume Hi: i :e n.
    assume H1.
    apply SepE (SNoS_ omega) (fun x => SNoLev x = i) x H1.
    assume Hxa: x :e SNoS_ omega.
    assume Hxb: SNoLev x = i.
    prove x :e SNoS_ n.
    apply SNoS_E2 omega omega_ordinal x Hxa.
    assume Hx1: SNoLev x :e omega.
    assume Hx2: ordinal (SNoLev x).
    assume Hx3: SNo x.
    assume Hx4: SNo_ (SNoLev x) x.
    apply SNoS_I n Ln2 x (SNoLev x).
    - prove SNoLev x :e n. rewrite Hxb. exact Hi.
    - prove SNo_ (SNoLev x) x. exact Hx4.
}
rewrite L1.
prove finite (\/_ i :e n, {x :e SNoS_ omega|SNoLev x = i}).
apply famunion_nat_finite (fun i => {x :e SNoS_ omega|SNoLev x = i}) n Ln.
let i. assume Hi: i :e n.
prove finite {x :e SNoS_ omega|SNoLev x = i}.
prove exists m :e omega, equip {x :e SNoS_ omega|SNoLev x = i} m.
witness 2 ^ i.
apply andI.
- prove 2 ^ i :e omega. apply nat_p_omega.
  exact nat_exp_SNo_nat 2 nat_2 i (nat_p_trans n Ln i Hi).
- exact SNoS_omega_Lev_equip i (nat_p_trans n Ln i Hi).
Qed.

Theorem SNoS_omega_SNoL_finite : forall x :e SNoS_ omega, finite (SNoL x).
let x. assume Hx.
apply SNoS_E2 omega omega_ordinal x Hx.
assume Hx1: SNoLev x :e omega.
assume Hx2: ordinal (SNoLev x).
assume Hx3: SNo x.
assume Hx4: SNo_ (SNoLev x) x.
apply Subq_finite (SNoS_ (SNoLev x)).
- prove finite (SNoS_ (SNoLev x)).
  exact SNoS_finite (SNoLev x) Hx1.
- prove SNoL x c= SNoS_ (SNoLev x).
  let y. assume Hy.
  apply SNoL_E x Hx3 y Hy.
  assume Hy1 Hy2 Hy3.
  prove y :e SNoS_ (SNoLev x).
  apply SNoS_I2 y x ?? ??.
  prove SNoLev y :e SNoLev x.
  exact Hy2.  
Qed.

Theorem SNoS_omega_SNoR_finite : forall x :e SNoS_ omega, finite (SNoR x).
let x. assume Hx.
apply SNoS_E2 omega omega_ordinal x Hx.
assume Hx1: SNoLev x :e omega.
assume Hx2: ordinal (SNoLev x).
assume Hx3: SNo x.
assume Hx4: SNo_ (SNoLev x) x.
apply Subq_finite (SNoS_ (SNoLev x)).
- prove finite (SNoS_ (SNoLev x)).
  exact SNoS_finite (SNoLev x) Hx1.
- prove SNoR x c= SNoS_ (SNoLev x).
  let y. assume Hy.
  apply SNoR_E x Hx3 y Hy.
  assume Hy1 Hy2 Hy3.
  prove y :e SNoS_ (SNoLev x).
  apply SNoS_I2 y x ?? ??.
  prove SNoLev y :e SNoLev x.
  exact Hy2.  
Qed.

End SurrealExp.

