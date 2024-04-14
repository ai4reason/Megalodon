(* Parameter Eps_i "174b78e53fc239e8c2aab4ab5a996a27e3e5741e88070dad186e05fb13f275e5" *)
Parameter Eps_i : (set->prop)->set.

Axiom Eps_i_ax : forall P:set->prop, forall x:set, P x -> P (Eps_i P).

Definition True : prop := forall p:prop, p -> p.
Definition False : prop := forall p:prop, p.

Definition not : prop -> prop := fun A:prop => A -> False.

Prefix ~ 700 := not.

Definition and : prop -> prop -> prop := fun A B:prop => forall p:prop, (A -> B -> p) -> p.

Infix /\ 780 left := and.

Definition or : prop -> prop -> prop := fun A B:prop => forall p:prop, (A -> p) -> (B -> p) -> p.

Infix \/ 785 left := or.

Definition iff : prop -> prop -> prop := fun A B:prop => and (A -> B) (B -> A).

Infix <-> 805 := iff.

Section Eq.
Variable A:SType.
Definition eq : A->A->prop := fun x y:A => forall Q:A->A->prop, Q x y -> Q y x.
Definition neq : A->A->prop := fun x y:A => ~ eq x y.
End Eq.

Infix = 502 := eq.
Infix <> 502 := neq.

Section FE.
Variable A B : SType.
Axiom func_ext : forall f g : A -> B , (forall x : A , f x = g x) -> f = g.
End FE.

Section Ex.
Variable A:SType.
Definition ex : (A->prop)->prop := fun Q:A->prop => forall P:prop, (forall x:A, Q x -> P) -> P.
End Ex.

Binder+ exists , := ex.

Axiom prop_ext : forall p q:prop, iff p q -> p = q.

Parameter In:set->set->prop.

Definition Subq : set -> set -> prop := fun A B => forall x :e A, x :e B.

Axiom set_ext : forall X Y:set, X c= Y -> Y c= X -> X = Y.

Axiom In_ind : forall P:set->prop, (forall X:set, (forall x :e X, P x) -> P X) -> forall X:set, P X.

Binder+ exists , := ex; and.

Parameter Empty : set.
Axiom EmptyAx : ~exists x:set, x :e Empty.

Parameter Union : set->set.

Axiom UnionEq : forall X x, x :e Union X <-> exists Y, x :e Y /\ Y :e X.

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

Axiom Sing_inj: forall x y, {x} = {y} -> x = y.

(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.

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

Binder \/_ , := famunion.

Axiom famunionI:forall X:set, forall F:(set->set), forall x y:set, x :e X -> y :e F x -> y :e \/_ x :e X, F x.

Axiom famunionE:forall X:set, forall F:(set->set), forall y:set, y :e (\/_ x :e X, F x) -> exists x :e X, y :e F x.

Axiom famunionE_impred : forall X : set , forall F : (set -> set) , forall y : set , y :e (\/_ x :e X , F x) -> forall p:prop, (forall x, x :e X -> y :e F x -> p) -> p.

Axiom famunion_Empty: forall F:set -> set, (\/_ x :e Empty, F x) = Empty.

Axiom famunion_Subq: forall X, forall f g:set -> set, (forall x :e X, f x c= g x) -> famunion X f c= famunion X g.

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

Infix :\: 350 := setminus.

Axiom setminusI:forall X Y z, (z :e X) -> (z /:e Y) -> z :e X :\: Y.

Axiom setminusE:forall X Y z, (z :e X :\: Y) -> z :e X /\ z /:e Y.

Axiom setminusE1:forall X Y z, (z :e X :\: Y) -> z :e X.

Axiom setminusE2:forall X Y z, (z :e X :\: Y) -> z /:e Y.

Axiom setminus_Subq:forall X Y:set, X :\: Y c= X.

Axiom setminus_Subq_contra:forall X Y Z:set, Z c= Y -> X :\: Y c= X :\: Z.

Axiom setminus_In_Power : forall A U, A :\: U :e Power A.

Axiom setminus_idr: forall X, X :\: Empty = X.

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

Axiom In_1_3: 1 :e 3.

Axiom In_2_3: 2 :e 3.

Axiom In_1_4: 1 :e 4.

Axiom In_2_4: 2 :e 4.

Axiom In_3_4: 3 :e 4.

Axiom In_1_5: 1 :e 5.

Axiom In_2_5: 2 :e 5.

Axiom In_3_5: 3 :e 5.

Axiom In_4_5: 4 :e 5.

Axiom In_1_6: 1 :e 6.

Axiom In_1_7: 1 :e 7.

Axiom In_1_8: 1 :e 8.

Definition nat_p : set->prop := fun n:set => forall p:set->prop, p 0 -> (forall x:set, p x -> p (ordsucc x)) -> p n.

Axiom nat_0 : nat_p 0.

Axiom nat_ordsucc : forall n:set, nat_p n -> nat_p (ordsucc n).

Axiom nat_1 : nat_p 1.

Axiom nat_2 : nat_p 2.

Axiom nat_3: nat_p 3.

Axiom nat_4: nat_p 4.

Axiom nat_5: nat_p 5.

Axiom nat_6: nat_p 6.

Axiom nat_7: nat_p 7.

Axiom nat_8: nat_p 8.

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

Axiom neq_1_3: 1 <> 3.

Axiom neq_2_3: 2 <> 3.

Axiom neq_2_4: 2 <> 4.

Axiom neq_3_4: 3 <> 4.

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

Definition In_rec_i_G : set -> set -> prop :=
fun X Y =>
forall R:set->set->prop,
(forall X:set, forall f:set->set, (forall x :e X, R x (f x)) -> R X (F X f)) ->
R X Y.

(* Parameter In_rec_i "f97da687c51f5a332ff57562bd465232bc70c9165b0afe0a54e6440fc4962a9f" "fac413e747a57408ad38b3855d3cde8673f86206e95ccdadff2b5babaf0c219e" *)
Parameter In_rec_i : set -> set.

Axiom In_rec_i_G_c : forall X:set, forall f:set->set, (forall x :e X, In_rec_i_G x (f x)) -> In_rec_i_G X (F X f).

Axiom In_rec_i_G_inv : forall X:set, forall Y:set, In_rec_i_G X Y -> exists f:set->set, (forall x :e X, In_rec_i_G x (f x)) /\ Y = F X f.

Hypothesis Fr:forall X:set, forall g h:set -> set, (forall x :e X, g x = h x) -> F X g = F X h.

Axiom In_rec_i_G_f : forall X:set, forall Y Z:set, In_rec_i_G X Y -> In_rec_i_G X Z -> Y = Z.

Axiom In_rec_i_G_In_rec_i : forall X:set, In_rec_i_G X (In_rec_i X).

Axiom In_rec_i_G_In_rec_i_d : forall X:set, In_rec_i_G X (F X In_rec_i).

Axiom In_rec_i_eq : forall X:set, In_rec_i X = F X In_rec_i.

End EpsilonRec_i.

Section EpsilonRec_ii.

Variable F:set -> (set -> (set -> set)) -> (set -> set).

Definition In_rec_G_ii : set -> (set -> set) -> prop :=
fun X Y =>
forall R:set->(set -> set)->prop,
(forall X:set, forall f:set->(set -> set), (forall x :e X, R x (f x)) -> R X (F X f)) ->
R X Y.

(* Parameter In_rec_ii "4d137cad40b107eb0fc2c707372525f1279575e6cadb4ebc129108161af3cedb" "f3c9abbc5074c0d68e744893a170de526469426a5e95400ae7fc81f74f412f7e" *)
Parameter In_rec_ii : set -> (set -> set).

Axiom In_rec_G_ii_c : forall X:set, forall f:set->(set -> set), (forall x :e X, In_rec_G_ii x (f x)) -> In_rec_G_ii X (F X f).

Axiom In_rec_G_ii_inv : forall X:set, forall Y:(set -> set), In_rec_G_ii X Y -> exists f:set->(set -> set), (forall x :e X, In_rec_G_ii x (f x)) /\ Y = F X f.

Hypothesis Fr:forall X:set, forall g h:set -> (set -> set), (forall x :e X, g x = h x) -> F X g = F X h.

Axiom In_rec_G_ii_f : forall X:set, forall Y Z:(set -> set), In_rec_G_ii X Y -> In_rec_G_ii X Z -> Y = Z.

Axiom In_rec_G_ii_In_rec_ii : forall X:set, In_rec_G_ii X (In_rec_ii X).

Axiom In_rec_G_ii_In_rec_ii_d : forall X:set, In_rec_G_ii X (F X In_rec_ii).

Axiom In_rec_ii_eq : forall X:set, In_rec_ii X = F X In_rec_ii.

End EpsilonRec_ii.

Section EpsilonRec_iii.

Variable F:set -> (set -> (set -> set -> set)) -> (set -> set -> set).

Definition In_rec_G_iii : set -> (set -> set -> set) -> prop :=
fun X Y =>
forall R:set->(set -> set -> set)->prop,
(forall X:set, forall f:set->(set -> set -> set), (forall x :e X, R x (f x)) -> R X (F X f)) ->
R X Y.

(* Parameter In_rec_iii "222f1b8dcfb0d2e33cc4b232e87cbcdfe5c4a2bdc5326011eb70c6c9aeefa556" "9b3a85b85e8269209d0ca8bf18ef658e56f967161bf5b7da5e193d24d345dd06" *)
Parameter In_rec_iii : set -> (set -> set -> set).

Axiom In_rec_G_iii_c : forall X:set, forall f:set->(set -> set -> set), (forall x :e X, In_rec_G_iii x (f x)) -> In_rec_G_iii X (F X f).

Axiom In_rec_G_iii_inv : forall X:set, forall Y:(set -> set -> set), In_rec_G_iii X Y -> exists f:set->(set -> set -> set), (forall x :e X, In_rec_G_iii x (f x)) /\ Y = F X f.

Hypothesis Fr:forall X:set, forall g h:set -> (set -> set -> set), (forall x :e X, g x = h x) -> F X g = F X h.

Axiom In_rec_G_iii_f : forall X:set, forall Y Z:(set -> set -> set), In_rec_G_iii X Y -> In_rec_G_iii X Z -> Y = Z.

Axiom In_rec_G_iii_In_rec_iii : forall X:set, In_rec_G_iii X (In_rec_iii X).

Axiom In_rec_G_iii_In_rec_iii_d : forall X:set, In_rec_G_iii X (F X In_rec_iii).

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

Axiom add_nat_0L : forall m:set, nat_p m -> 0+m = m.

Axiom add_nat_SL : forall n:set, nat_p n -> forall m:set, nat_p m -> ordsucc n + m = ordsucc (n+m).

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

Infix :+: 450 left := setsum.

Axiom Inj0_setsum : forall X Y x:set, x :e X -> Inj0 x :e X :+: Y.

Axiom Inj1_setsum : forall X Y y:set, y :e Y -> Inj1 y :e X :+: Y.

Axiom setsum_Inj_inv : forall X Y z:set, z :e X :+: Y -> (exists x :e X, z = Inj0 x) \/ (exists y :e Y, z = Inj1 y).

Axiom Inj0_setsum_0L : forall X:set, 0 :+: X = Inj0 X.

Axiom Subq_1_Sing0 : 1 c= {0}.

Axiom Subq_Sing0_1 : {0} c= 1.

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

Binder+ Sigma_ , := Sigma.

Axiom pair_Sigma : forall X:set, forall Y:set -> set, forall x :e X, forall y :e Y x, pair x y :e Sigma_ x :e X, Y x.

Axiom Sigma_eta_proj0_proj1 : forall X:set, forall Y:set -> set, forall z :e (Sigma_ x :e X, Y x), pair (proj0 z) (proj1 z) = z /\ proj0 z :e X /\ proj1 z :e Y (proj0 z).

Axiom proj_Sigma_eta : forall X:set, forall Y:set -> set, forall z :e (Sigma_ x :e X, Y x), pair (proj0 z) (proj1 z) = z.

Axiom proj0_Sigma : forall X:set, forall Y:set -> set, forall z:set, z :e (Sigma_ x :e X, Y x) -> proj0 z :e X.

Axiom proj1_Sigma : forall X:set, forall Y:set -> set, forall z:set, z :e (Sigma_ x :e X, Y x) -> proj1 z :e Y (proj0 z).

Axiom pair_Sigma_E1 : forall X:set, forall Y:set->set, forall x y:set, pair x y :e (Sigma_ x :e X, Y x) -> y :e Y x.

Axiom Sigma_E : forall X:set, forall Y:set->set, forall z:set, z :e (Sigma_ x :e X, Y x) -> exists x :e X, exists y :e Y x, z = pair x y.

Definition setprod : set->set->set := fun X Y:set => Sigma_ x :e X, Y.

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

Binder+ Pi_ , := Pi.

Axiom PiI : forall X:set, forall Y:set->set, forall f:set,
    (forall u :e f, pair_p u /\ u 0 :e X) -> (forall x :e X, f x :e Y x) -> f :e Pi_ x :e X, Y x.

Axiom lam_Pi : forall X:set, forall Y:set -> set, forall F:set -> set,
 (forall x :e X, F x :e Y x) -> (fun x :e X => F x) :e (Pi_ x :e X, Y x).

Axiom ap_Pi : forall X:set, forall Y:set -> set, forall f:set, forall x:set, f :e (Pi_ x :e X, Y x) -> x :e X -> f x :e Y x.

Definition setexp : set->set->set := fun X Y:set => Pi_ y :e Y, X.

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

(** Part 2 **)

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

Axiom SNo_0_eq_0: forall q, SNo_ 0 q -> q = 0.

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

(** Part 4 **)

Section SurrealMinus.

(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.

Prefix - 358 := minus_SNo.

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

(** Part 5 **)
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

Axiom add_SNoCutP_lem : forall Lx Rx Ly Ry x y,
    SNoCutP Lx Rx
 -> SNoCutP Ly Ry
 -> x = SNoCut Lx Rx
 -> y = SNoCut Ly Ry
 -> SNoCutP ({w + y|w :e Lx} :\/: {x + w|w :e Ly}) ({z + y|z :e Rx} :\/: {x + z|z :e Ry})
 /\ x + y = SNoCut ({w + y|w :e Lx} :\/: {x + w|w :e Ly}) ({z + y|z :e Rx} :\/: {x + z|z :e Ry}).

Axiom add_SNoCutP_gen : forall Lx Rx Ly Ry x y,
    SNoCutP Lx Rx
 -> SNoCutP Ly Ry
 -> x = SNoCut Lx Rx
 -> y = SNoCut Ly Ry
 -> SNoCutP ({w + y|w :e Lx} :\/: {x + w|w :e Ly}) ({z + y|z :e Rx} :\/: {x + z|z :e Ry}).

Axiom add_SNoCut_eq : forall Lx Rx Ly Ry x y,
    SNoCutP Lx Rx
 -> SNoCutP Ly Ry
 -> x = SNoCut Lx Rx
 -> y = SNoCut Ly Ry
 -> x + y = SNoCut ({w + y|w :e Lx} :\/: {x + w|w :e Ly}) ({z + y|z :e Rx} :\/: {x + z|z :e Ry}).

Axiom add_SNo_SNoCut_L_interpolate : forall Lx Rx Ly Ry x y,
    SNoCutP Lx Rx
 -> SNoCutP Ly Ry
 -> x = SNoCut Lx Rx
 -> y = SNoCut Ly Ry
 -> forall u :e SNoL (x + y), (exists v :e Lx, u <= v + y) \/ (exists v :e Ly, u <= x + v).

Axiom add_SNo_SNoCut_R_interpolate : forall Lx Rx Ly Ry x y,
    SNoCutP Lx Rx
 -> SNoCutP Ly Ry
 -> x = SNoCut Lx Rx
 -> y = SNoCut Ly Ry
 -> forall u :e SNoR (x + y), (exists v :e Rx, v + y <= u) \/ (exists v :e Ry, x + v <= u).

Axiom add_SNo_minus_Lt12b3: forall x y z w u v,
    SNo x -> SNo y -> SNo z -> SNo w -> SNo u -> SNo v
 -> x + y + v < w + u + z
 -> x + y + - z < w + u + - v.

Axiom add_SNo_Le1_cancel : forall x y z, SNo x -> SNo y -> SNo z -> x + y <= z + y -> x <= z.

Axiom add_SNo_minus_Le1b : forall x y z, SNo x -> SNo y -> SNo z -> x <= z + y -> x + - y <= z.

Axiom add_SNo_minus_Le1b3 : forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> x + y <= w + z -> x + y + - z <= w.

Axiom add_SNo_minus_Le12b3: forall x y z w u v,
    SNo x -> SNo y -> SNo z -> SNo w -> SNo u -> SNo v
 -> x + y + v <= w + u + z
 -> x + y + - z <= w + u + - v.

End SurrealAdd.

(** Part 6 **)

Infix :*: 440 left := setprod.
Infix :^: 430 left := setexp.

Section SurrealMul.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.

(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.

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

(** Part of Conway Chapter 2 Theorem 7 **)
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

Axiom SNo_gt2_double_ltS: forall x, SNo x -> 1 < x -> x + 1 < 2 * x.

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

Axiom SNo_pos_sqr_uniq: forall x y, SNo x -> SNo y -> 0 < x -> 0 < y -> x * x = y * y -> x = y.

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

Axiom mul_SNoCutP_lem : forall Lx Rx Ly Ry x y,
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

Axiom mul_SNoCutP_gen : forall Lx Rx Ly Ry x y,
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

Axiom mul_SNoCut_eq : forall Lx Rx Ly Ry x y,
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

Axiom mul_SNoCut_abs : forall Lx Rx Ly Ry x y,
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

Axiom mul_SNo_SNoCut_SNoL_interpolate : forall Lx Rx Ly Ry,
    SNoCutP Lx Rx -> SNoCutP Ly Ry
 -> forall x y, x = SNoCut Lx Rx -> y = SNoCut Ly Ry
 -> forall u :e SNoL (x * y),
 (exists v :e Lx, exists w :e Ly, u + v * w <= v * y + x * w)
 \/
 (exists v :e Rx, exists w :e Ry, u + v * w <= v * y + x * w).

Axiom mul_SNo_SNoCut_SNoL_interpolate_impred : forall Lx Rx Ly Ry,
    SNoCutP Lx Rx -> SNoCutP Ly Ry
 -> forall x y, x = SNoCut Lx Rx -> y = SNoCut Ly Ry
 -> forall u :e SNoL (x * y),
    forall p:prop,
        (forall v :e Lx, forall w :e Ly, u + v * w <= v * y + x * w -> p)
     -> (forall v :e Rx, forall w :e Ry, u + v * w <= v * y + x * w -> p)
     -> p.

Axiom mul_SNo_SNoCut_SNoR_interpolate : forall Lx Rx Ly Ry,
    SNoCutP Lx Rx -> SNoCutP Ly Ry
 -> forall x y, x = SNoCut Lx Rx -> y = SNoCut Ly Ry
 -> forall u :e SNoR (x * y),
 (exists v :e Lx, exists w :e Ry, v * y + x * w <= u + v * w)
 \/
 (exists v :e Rx, exists w :e Ly, v * y + x * w <= u + v * w).

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

Axiom exp_SNo_nat_1: forall x, SNo x -> x ^ 1 = x.

Axiom exp_SNo_nat_2 : forall x, SNo x -> x ^ 2 = x * x.

Axiom SNo_sqr_nonneg' : forall x, SNo x -> 0 <= x ^ 2.

Axiom SNo_zero_or_sqr_pos' : forall x, SNo x -> x = 0 \/ 0 < x ^ 2.

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

(** Part 7 **)
Section Int.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.

Definition int : set := omega :\/: {- n|n :e omega}.

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

(** Part 8 **)

Section SurrealDiv.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix < 490 := SNoLt.
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
Infix <= 490 := SNoLe.
Infix ^ 342 right := exp_SNo_nat.

Axiom SNoS_omega_drat_intvl : forall x :e SNoS_ omega,
  forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.

Axiom SNoS_ordsucc_omega_bdd_above : forall x :e SNoS_ (ordsucc omega), x < omega -> exists N :e omega, x < N.

Axiom SNoS_ordsucc_omega_bdd_below : forall x :e SNoS_ (ordsucc omega), - omega < x -> exists N :e omega, - N < x.

Axiom SNoS_ordsucc_omega_bdd_drat_intvl : forall x :e SNoS_ (ordsucc omega),
    - omega < x -> x < omega
 -> forall k :e omega, exists q :e SNoS_ omega, q < x /\ x < q + eps_ k.

Definition real : set := {x :e SNoS_ (ordsucc omega)| x <> omega /\ x <> - omega /\ (forall q :e SNoS_ omega, (forall k :e omega, abs_SNo (q + - x) < eps_ k) -> q = x)}.

Definition rational : set := {x :e real | exists m :e int, exists n :e omega :\: {0}, x = m :/: n}.

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

Axiom real_SNoCut_SNoS_omega: forall L R c= SNoS_ omega, SNoCutP L R
 -> L <> 0
 -> R <> 0
 -> (forall w :e L, exists w' :e L, w < w')
 -> (forall z :e R, exists z' :e R, z' < z)
 -> SNoCut L R :e real.

Axiom real_SNoCut: forall L R c= real, SNoCutP L R
 -> L <> 0
 -> R <> 0
 -> (forall w :e L, exists w' :e L, w < w')
 -> (forall z :e R, exists z' :e R, z' < z)
 -> SNoCut L R :e real.

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

Axiom nonneg_real_nat_interval: forall x :e real, 0 <= x -> exists n :e omega, n <= x /\ x < ordsucc n.

Axiom pos_real_left_approx_double: forall x :e real, 0 < x
 -> x <> 2 -> (forall m :e omega, x <> eps_ m)
 -> exists w :e SNoL_pos x, x < 2 * w.

Axiom real_recip_SNo_lem1: forall x, SNo x -> x :e real -> 0 < x ->
    recip_SNo_pos x :e real
 /\ forall k, nat_p k ->
         (SNo_recipaux x recip_SNo_pos k 0 c= real)
      /\ (SNo_recipaux x recip_SNo_pos k 1 c= real).

Axiom real_recip_SNo_pos: forall x :e real, 0 < x -> recip_SNo_pos x :e real.

Axiom real_recip_SNo: forall x :e real, recip_SNo x :e real.

Axiom real_div_SNo: forall x y :e real, x :/: y :e real.

Axiom sqrt_SNo_nonneg_0inL0: forall x, SNo x -> 0 <= x -> 0 :e SNoLev x -> 0 :e SNo_sqrtaux x sqrt_SNo_nonneg 0 0.

Axiom sqrt_SNo_nonneg_Lnonempty: forall x, SNo x -> 0 <= x -> 0 :e SNoLev x -> (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 0) <> 0.

Axiom sqrt_SNo_nonneg_Rnonempty: forall x, SNo x -> 0 <= x -> 1 :e SNoLev x -> (\/_ k :e omega, SNo_sqrtaux x sqrt_SNo_nonneg k 1) <> 0.

Axiom SNo_sqrtauxset_real: forall Y Z x, Y c= real -> Z c= real -> x :e real -> SNo_sqrtauxset Y Z x c= real.

Axiom SNo_sqrtauxset_real_nonneg: forall Y Z x, Y c= {w :e real|0 <= w} -> Z c= {z :e real|0 <= z} -> x :e real -> 0 <= x -> SNo_sqrtauxset Y Z x c= {w :e real|0 <= w}.

Axiom sqrt_SNo_nonneg_SNoS_omega: forall x :e SNoS_ omega, 0 <= x -> sqrt_SNo_nonneg x :e real.

Axiom sqrt_SNo_nonneg_real: forall x :e real, 0 <= x -> sqrt_SNo_nonneg x :e real.

Axiom real_Archimedean: forall x y :e real, 0 < x -> 0 <= y -> exists n :e omega, y <= n * x.

Axiom real_complete1: forall a b :e real :^: omega,
    (forall n :e omega, a n <= b n /\ a n <= a (ordsucc n) /\ b (ordsucc n) <= b n)
 -> exists x :e real, forall n :e omega, a n <= x /\ x <= b n.

Axiom real_complete2: forall a b :e real :^: omega,
    (forall n :e omega, a n <= b n /\ a n <= a (n + 1) /\ b (n + 1) <= b n)
 -> exists x :e real, forall n :e omega, a n <= x /\ x <= b n.

End Reals.

(** Part10b: Irrationality of sqrt of 2 **)

(** First port some basic propertiess of operations on Surreal numbers back to operations on naturals. **)
Axiom mul_nat_1R : forall x0, mul_nat x0 1 = x0.

Axiom mul_nat_asso : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2, nat_p x2 -> mul_nat (mul_nat x0 x1) x2 = mul_nat x0 (mul_nat x1 x2)))).

Axiom mul_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x1 = mul_nat x1 x0)).

Axiom mul_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat (ordsucc x0) x1 = add_nat (mul_nat x0 x1) x1)).

(** Now prove we can cancel when applying mul_nat 2. **)
Axiom eps_1_half_eq3 : mul_SNo (eps_ 1) 2 = 1.

Axiom double_nat_cancel : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat 2 x0 = mul_nat 2 x1 -> x0 = x1)).

(** Next prove that if mul_nat 2 n <= n, then n is 0. **)

Axiom add_nat_Subq_L : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> x0 c= add_nat x0 x1)).
Axiom square_nat_Subq : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> x0 c= x1 -> mul_nat x0 x0 c= mul_nat x1 x1)).
Axiom ordsucc_in_double_nat_ordsucc : (forall x0, nat_p x0 -> ordsucc x0 :e mul_nat 2 (ordsucc x0)).

Axiom double_nat_Subq_0 : (forall x0, nat_p x0 -> mul_nat 2 x0 c= x0 -> x0 = 0).

(** Definitions of even and odd **)

Definition even_nat : set -> prop :=
 (fun x0 : set => and (x0 :e omega) (forall x1 : prop, (forall x2, and (x2 :e omega) (x0 = mul_nat 2 x2) -> x1) -> x1)).

Definition odd_nat : set -> prop :=
 (fun x0 : set => and (x0 :e omega) (forall x1, x1 :e omega -> x0 = mul_nat 2 x1 -> (forall x2 : prop, x2))).

(** Prove some basic results about even and odd **)

Axiom even_nat_0 : even_nat 0.

Axiom even_nat_not_odd_nat : (forall x0, even_nat x0 -> not (odd_nat x0)).

Axiom odd_nat_1 : odd_nat 1.

Axiom even_nat_double : (forall x0, nat_p x0 -> even_nat (mul_nat 2 x0)).

Axiom even_nat_S_S : (forall x0, even_nat x0 -> even_nat (ordsucc (ordsucc x0))).

Axiom even_nat_S_S_inv : (forall x0, nat_p x0 -> even_nat (ordsucc (ordsucc x0)) -> even_nat x0).

Axiom even_nat_xor_S : (forall x0, nat_p x0 -> exactly1of2 (even_nat x0) (even_nat (ordsucc x0))).

Axiom even_nat_or_odd_nat : (forall x0, nat_p x0 -> or (even_nat x0) (odd_nat x0)).

Axiom not_odd_nat_0 : not (odd_nat 0).

Axiom even_nat_odd_nat_S : (forall x0, even_nat x0 -> odd_nat (ordsucc x0)).

Axiom odd_nat_even_nat_S : (forall x0, odd_nat x0 -> even_nat (ordsucc x0)).

Axiom odd_nat_xor_odd_sum : (forall x0, odd_nat x0 -> (forall x1, nat_p x1 -> exactly1of2 (odd_nat x1) (odd_nat (add_nat x0 x1)))).

Axiom odd_nat_iff_odd_mul_nat : (forall x0, odd_nat x0 -> (forall x1, nat_p x1 -> iff (odd_nat x1) (odd_nat (mul_nat x0 x1)))).

Axiom odd_nat_mul_nat : (forall x0 x1, odd_nat x0 -> odd_nat x1 -> odd_nat (mul_nat x0 x1)).

(** If m + n = 0 for naturals m and n, then both must be 0. **)

Axiom add_nat_0_inv : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> add_nat x0 x1 = 0 -> and (x0 = 0) (x1 = 0))).

(** If m times n = 0 for naturals m and n, then one must be 0. **)

Axiom mul_nat_0_inv : (forall x0, x0 :e omega -> (forall x1, x1 :e omega -> mul_nat x0 x1 = 0 -> or (x0 = 0) (x1 = 0))).

(** If m times m = 2 times n times n for naturals m and n, then n = 0. **)

Axiom form100_1_v1_lem : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat x0 x0 = mul_nat 2 (mul_nat x1 x1) -> x1 = 0)).

(** There are no nonzero naturals m and n such that m times m = 2 times n times n. **)

Axiom form100_1_v1 : (forall x0, x0 :e setminus omega 1 -> (forall x1, x1 :e setminus omega 1 -> mul_nat x0 x0 = mul_nat 2 (mul_nat x1 x1) -> (forall x2 : prop, x2))).

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix :/: 353 := div_SNo.

Axiom sqrt_2_irrational: sqrt_SNo_nonneg 2 :e real :\: rational.

(** Part 11: Cayley Dickson **)

Section Alg.

Variable extension_tag:set.
Let ctag : set -> set := fun alpha => SetAdjoin alpha extension_tag.
Postfix '' 100 := ctag.
Definition pair_tag : set -> set -> set := fun x y => x :\/: {u ''|u :e y}.

Variable F:set -> prop.

Hypothesis extension_tag_fresh: forall x, F x -> forall u :e x, extension_tag /:e u.

Axiom ctagged_notin_F : forall x y, F x -> (y '') /:e x.

Axiom ctagged_eqE_Subq : forall x y, F x -> forall u :e x, forall v, u '' = v '' -> u c= v.

Axiom ctagged_eqE_eq : forall x y, F x -> F y -> forall u :e x, forall v :e y, u '' = v '' -> u = v.

Axiom pair_tag_prop_1_Subq : forall x1 y1 x2 y2, F x1 -> pair_tag x1 y1 = pair_tag x2 y2 -> x1 c= x2.

Axiom pair_tag_prop_1 : forall x1 y1 x2 y2, F x1 -> F x2 -> pair_tag x1 y1 = pair_tag x2 y2 -> x1 = x2.

Axiom pair_tag_prop_2_Subq : forall x1 y1 x2 y2, F y1 -> F x2 -> F y2 -> pair_tag x1 y1 = pair_tag x2 y2 -> y1 c= y2.

Axiom pair_tag_prop_2 : forall x1 y1 x2 y2, F x1 -> F y1 -> F x2 -> F y2 -> pair_tag x1 y1 = pair_tag x2 y2 -> y1 = y2.

Axiom pair_tag_0 : forall x, pair_tag x 0 = x.

Definition CD_carr: set -> prop := fun z => exists x, F x /\ exists y, F y /\ z = pair_tag x y.

Axiom CD_carr_I: forall x y, F x -> F y -> CD_carr (pair_tag x y).

Axiom CD_carr_E: forall z, CD_carr z ->
  forall p:set -> prop,
      (forall x y, F x -> F y -> z = pair_tag x y -> p (pair_tag x y))
    -> p z.

Axiom CD_carr_0ext: F 0 -> forall x, F x -> CD_carr x.

Definition CD_proj0 : set -> set := fun z => Eps_i (fun x => F x /\ exists y, F y /\ z = pair_tag x y).
Definition CD_proj1 : set -> set := fun z => Eps_i (fun y => F y /\ z = pair_tag (CD_proj0 z) y).

Let proj0 := CD_proj0.
Let proj1 := CD_proj1.
Let pa : set -> set -> set := pair_tag.

Axiom CD_proj0_1: forall z, CD_carr z -> F (proj0 z) /\ exists y, F y /\ z = pa (proj0 z) y.

Axiom CD_proj0_2: forall x y, F x -> F y -> proj0 (pa x y) = x.

Axiom CD_proj1_1: forall z, CD_carr z -> F (proj1 z) /\ z = pa (proj0 z) (proj1 z).

Axiom CD_proj1_2: forall x y, F x -> F y -> proj1 (pa x y) = y.

Axiom CD_proj0R: forall z, CD_carr z -> F (proj0 z).

Axiom CD_proj1R: forall z, CD_carr z -> F (proj1 z).

Axiom CD_proj0proj1_eta: forall z, CD_carr z -> z = pa (proj0 z) (proj1 z).

Axiom CD_proj0proj1_split: forall z w, CD_carr z -> CD_carr w -> proj0 z = proj0 w -> proj1 z = proj1 w -> z = w.

Axiom CD_proj0_F: F 0 -> forall x, F x -> CD_proj0 x = x.

Axiom CD_proj1_F: F 0 -> forall x, F x -> CD_proj1 x = 0.

Section CD_minus_conj.

Variable minus:set -> set.
Prefix - 358 := minus.

Definition CD_minus : set -> set := fun z => pa (- proj0 z) (- proj1 z).

Prefix :-: 358 := CD_minus.


Variable conj:set -> set.
Definition CD_conj : set -> set := fun z => pa (conj (proj0 z)) (- proj1 z).

End CD_minus_conj.

Section CD_add.

Variable add:set -> set -> set.
Infix + 360 right := add.

Definition CD_add : set -> set -> set := fun z w => pa (proj0 z + proj0 w) (proj1 z + proj1 w).

End CD_add.

Section CD_mul.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.

Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Definition CD_mul : set -> set -> set := fun z w => pa (proj0 z * proj0 w + - conj (proj1 w) * proj1 z) (proj1 w * proj0 z + proj1 z * conj (proj0 w)).
Infix :*: 355 right := CD_mul.

Definition CD_exp_nat : set -> set -> set := fun z m => nat_primrec 1 (fun _ r => z :*: r) m.

End CD_mul.

Section CD_minus_conj_clos.

Variable minus:set -> set.
Prefix - 358 := minus.
Prefix :-: 358 := CD_minus minus.

Hypothesis F_minus: forall x, F x -> F (- x).

Axiom CD_minus_CD: forall z, CD_carr z -> CD_carr (:-: z).

Axiom CD_minus_proj0: forall z, CD_carr z -> proj0 (:-: z) = - proj0 z.

Axiom CD_minus_proj1: forall z, CD_carr z -> proj1 (:-: z) = - proj1 z.

Variable conj:set -> set.
Postfix ' 100 := CD_conj minus conj.

Hypothesis F_conj: forall x, F x -> F (conj x).

Axiom CD_conj_CD: forall z, CD_carr z -> CD_carr (z ').

Axiom CD_conj_proj0: forall z, CD_carr z -> proj0 (z ') = conj (proj0 z).

Axiom CD_conj_proj1: forall z, CD_carr z -> proj1 (z ') = - proj1 z.

End CD_minus_conj_clos.

Section CD_add_clos.

Variable add:set -> set -> set.
Infix + 360 right := add.
Infix :+: 360 right := CD_add add.

Hypothesis F_add: forall x y, F x -> F y -> F (x + y).

Axiom CD_add_CD: forall z w, CD_carr z -> CD_carr w -> CD_carr (z :+: w).

Axiom CD_add_proj0: forall z w, CD_carr z -> CD_carr w -> proj0 (z :+: w) = proj0 z + proj0 w.

Axiom CD_add_proj1: forall z w, CD_carr z -> CD_carr w -> proj1 (z :+: w) = proj1 z + proj1 w.

End CD_add_clos.

Section CD_mul_clos.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.

Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_add: forall x y, F x -> F y -> F (x + y).
Hypothesis F_mul: forall x y, F x -> F y -> F (x * y).

Axiom CD_mul_CD: forall z w, CD_carr z -> CD_carr w -> CD_carr (z :*: w).

Axiom CD_mul_proj0: forall z w, CD_carr z -> CD_carr w -> proj0 (z :*: w) = proj0 z * proj0 w + - conj (proj1 w) * proj1 z.

Axiom CD_mul_proj1: forall z w, CD_carr z -> CD_carr w -> proj1 (z :*: w) = proj1 w * proj0 z + proj1 z * conj (proj0 w).

End CD_mul_clos.

Section CD_minus_conj_F.

Variable minus:set -> set.
Prefix - 358 := minus.
Prefix :-: 358 := CD_minus minus.

Hypothesis F_0 : F 0.
Hypothesis F_minus_0: - 0 = 0.

Axiom CD_minus_F_eq: forall x, F x -> :-: x = - x.

Variable conj:set -> set.
Postfix ' 100 := CD_conj minus conj.

Axiom CD_conj_F_eq: forall x, F x -> x ' = conj x.

End CD_minus_conj_F.

Section CD_add_F.

Variable add:set -> set -> set.
Infix + 360 right := add.

Infix :+: 360 right := CD_add add.

Hypothesis F_0 : F 0.
Hypothesis F_add_0_0: 0 + 0 = 0.

Axiom CD_add_F_eq: forall x y, F x -> F y -> x :+: y = x + y.

End CD_add_F.

Section CD_mul_F.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.

Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_0 : F 0.
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_mul: forall x y, F x -> F y -> F (x * y).
Hypothesis F_minus_0: - 0 = 0.
Hypothesis F_add_0R: forall x, F x -> x + 0 = x.
Hypothesis F_mul_0L: forall x, F x -> 0 * x = 0.
Hypothesis F_mul_0R: forall x, F x -> x * 0 = 0.

Axiom CD_mul_F_eq: forall x y, F x -> F y -> x :*: y = x * y.

End CD_mul_F.

Section CD_minus_invol.

Variable minus:set -> set.
Prefix - 358 := minus.
Prefix :-: 358 := CD_minus minus.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_minus_invol: forall x, F x -> - - x = x.

Axiom CD_minus_invol: forall z, CD_carr z -> :-: :-: z = z.

End CD_minus_invol.

Section CD_conj_invol.

Variable minus:set -> set.
Variable conj:set -> set.

Prefix - 358 := minus.
Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_minus_invol: forall x, F x -> - - x = x.
Hypothesis F_conj_invol: forall x, F x -> conj (conj x) = x.

Axiom CD_conj_invol: forall z, CD_carr z -> z ' ' = z.

End CD_conj_invol.

Section CD_conj_minus.

Variable minus:set -> set.
Variable conj:set -> set.
Prefix - 358 := minus.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_conj_minus: forall x, F x -> conj (- x) = - conj x.

Axiom CD_conj_minus: forall z, CD_carr z -> (:-: z) ' = :-: (z ').

End CD_conj_minus.

Section CD_minus_add.

Variable minus:set -> set.
Variable add:set -> set -> set.

Prefix - 358 := minus.
Infix + 360 right := add.

Prefix :-: 358 := CD_minus minus.
Infix :+: 360 right := CD_add add.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_add: forall x y, F x -> F y -> F (x + y).
Hypothesis F_minus_add: forall x y, F x -> F y -> -(x + y) = - x + - y.

Axiom CD_minus_add: forall z w, CD_carr z -> CD_carr w -> :-: (z :+: w) = :-: z :+: :-: w.

End CD_minus_add.

Section CD_conj_add.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.

Prefix - 358 := minus.
Infix + 360 right := add.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_add: forall x y, F x -> F y -> F (x + y).
Hypothesis F_minus_add: forall x y, F x -> F y -> -(x + y) = - x + - y.
Hypothesis F_conj_add: forall x y, F x -> F y -> conj (x + y) = conj x + conj y.

Axiom CD_conj_add: forall z w, CD_carr z -> CD_carr w -> (z :+: w) ' = z ' :+: w '.

End CD_conj_add.

Section CD_add_com.

Variable add:set -> set -> set.
Infix + 360 right := add.
Infix :+: 360 right := CD_add add.

Hypothesis F_add_com: forall x y, F x -> F y -> x + y = y + x.

Axiom CD_add_com: forall z w, CD_carr z -> CD_carr w -> z :+: w = w :+: z.

End CD_add_com.

Section CD_add_assoc.

Variable add:set -> set -> set.
Infix + 360 right := add.
Infix :+: 360 right := CD_add add.

Hypothesis F_add: forall x y, F x -> F y -> F (x + y).
Hypothesis F_add_assoc: forall x y z, F x -> F y -> F z -> (x + y) + z = x + (y + z).

Axiom CD_add_assoc: forall z w u, CD_carr z -> CD_carr w -> CD_carr u -> (z :+: w) :+: u = z :+: (w :+: u).

End CD_add_assoc.

Section CD_add_0R.

Variable add:set -> set -> set.
Infix + 360 right := add.
Infix :+: 360 right := CD_add add.

Hypothesis F_0: F 0.
Hypothesis F_add_0R: forall x, F x -> x + 0 = x.

Axiom CD_add_0R: forall z, CD_carr z -> z :+: 0 = z.

End CD_add_0R.

Section CD_add_0L.

Variable add:set -> set -> set.
Infix + 360 right := add.
Infix :+: 360 right := CD_add add.

Hypothesis F_0: F 0.
Hypothesis F_add_0L: forall x, F x -> 0 + x = x.

Axiom CD_add_0L: forall z, CD_carr z -> 0 :+: z = z.

End CD_add_0L.

Section CD_add_minus_linv.

Variable minus:set -> set.
Variable add:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Prefix :-: 358 := CD_minus minus.
Infix :+: 360 right := CD_add add.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_add_minus_linv: forall x, F x -> - x + x = 0.

Axiom CD_add_minus_linv : forall z, CD_carr z -> :-: z :+: z = 0.

End CD_add_minus_linv.

Section CD_add_minus_rinv.

Variable minus:set -> set.
Variable add:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Prefix :-: 358 := CD_minus minus.
Infix :+: 360 right := CD_add add.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_add_minus_rinv: forall x, F x -> x + - x = 0.

Axiom CD_add_minus_rinv : forall z, CD_carr z -> z :+: :-: z = 0.

End CD_add_minus_rinv.

Section CD_mul_0R.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_0: F 0.
Hypothesis F_minus_0: - 0 = 0.
Hypothesis F_conj_0: conj 0 = 0.
Hypothesis F_add_0_0: 0 + 0 = 0.
Hypothesis F_mul_0L: forall x, F x -> 0 * x = 0.
Hypothesis F_mul_0R: forall x, F x -> x * 0 = 0.

Axiom CD_mul_0R: forall z, CD_carr z -> z :*: 0 = 0.

End CD_mul_0R.

Section CD_mul_0L.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_0: F 0.
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_minus_0: - 0 = 0.
Hypothesis F_add_0_0: 0 + 0 = 0.
Hypothesis F_mul_0L: forall x, F x -> 0 * x = 0.
Hypothesis F_mul_0R: forall x, F x -> x * 0 = 0.

Axiom CD_mul_0L: forall z, CD_carr z -> 0 :*: z = 0.

End CD_mul_0L.

Section CD_mul_1R.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_0: F 0.
Hypothesis F_1: F 1.
Hypothesis F_minus_0: - 0 = 0.
Hypothesis F_conj_0: conj 0 = 0.
Hypothesis F_conj_1: conj 1 = 1.
Hypothesis F_add_0L: forall x, F x -> 0 + x = x.
Hypothesis F_add_0R: forall x, F x -> x + 0 = x.
Hypothesis F_mul_0L: forall x, F x -> 0 * x = 0.
Hypothesis F_mul_1R: forall x, F x -> x * 1 = x.

Axiom CD_mul_1R: forall z, CD_carr z -> z :*: 1 = z.

End CD_mul_1R.

Section CD_mul_1L.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_0: F 0.
Hypothesis F_1: F 1.
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_minus_0: - 0 = 0.
Hypothesis F_add_0R: forall x, F x -> x + 0 = x.
Hypothesis F_mul_0L: forall x, F x -> 0 * x = 0.
Hypothesis F_mul_0R: forall x, F x -> x * 0 = 0.
Hypothesis F_mul_1L: forall x, F x -> 1 * x = x.
Hypothesis F_mul_1R: forall x, F x -> x * 1 = x.

Axiom CD_mul_1L: forall z, CD_carr z -> 1 :*: z = z.

End CD_mul_1L.

Section CD_conj_mul.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_add: forall x y, F x -> F y -> F (x + y).
Hypothesis F_mul: forall x y, F x -> F y -> F (x * y).
Hypothesis F_minus_invol: forall x, F x -> - - x = x.
Hypothesis F_conj_invol: forall x, F x -> conj (conj x) = x.
Hypothesis F_conj_minus: forall x, F x -> conj (- x) = - conj x.
Hypothesis F_conj_add: forall x y, F x -> F y -> conj (x + y) = conj x + conj y.
Hypothesis F_minus_add: forall x y, F x -> F y -> -(x + y) = - x + - y.
Hypothesis F_add_com: forall x y, F x -> F y -> x + y = y + x.
Hypothesis F_conj_mul: forall x y, F x -> F y -> conj (x * y) = conj y * conj x.
Hypothesis F_minus_mul_distrR: forall x y, F x -> F y -> x * (- y) = - (x * y).
Hypothesis F_minus_mul_distrL: forall x y, F x -> F y -> (- x) * y = - (x * y).

Axiom CD_conj_mul: forall z w, CD_carr z -> CD_carr w -> (z :*: w) ' = w ' :*: z '.

End CD_conj_mul.

Section CD_add_mul_distrR.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_add: forall x y, F x -> F y -> F (x + y).
Hypothesis F_mul: forall x y, F x -> F y -> F (x * y).
Hypothesis F_minus_add: forall x y, F x -> F y -> -(x + y) = - x + - y.
Hypothesis F_add_assoc: forall x y z, F x -> F y -> F z -> (x + y) + z = x + (y + z).
Hypothesis F_add_com: forall x y, F x -> F y -> x + y = y + x.
Hypothesis F_add_mul_distrL: forall x y z, F x -> F y -> F z -> x * (y + z) = x * y + x * z.
Hypothesis F_add_mul_distrR: forall x y z, F x -> F y -> F z -> (x + y) * z = x * z + y * z.

Axiom CD_add_mul_distrR: forall z w u, CD_carr z -> CD_carr w -> CD_carr u -> (z :+: w) :*: u = z :*: u :+: w :*: u.

End CD_add_mul_distrR.

Section CD_add_mul_distrL.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_add: forall x y, F x -> F y -> F (x + y).
Hypothesis F_mul: forall x y, F x -> F y -> F (x * y).
Hypothesis F_minus_add: forall x y, F x -> F y -> -(x + y) = - x + - y.
Hypothesis F_conj_add: forall x y, F x -> F y -> conj (x + y) = conj x + conj y.
Hypothesis F_add_assoc: forall x y z, F x -> F y -> F z -> (x + y) + z = x + (y + z).
Hypothesis F_add_com: forall x y, F x -> F y -> x + y = y + x.
Hypothesis F_add_mul_distrL: forall x y z, F x -> F y -> F z -> x * (y + z) = x * y + x * z.
Hypothesis F_add_mul_distrR: forall x y z, F x -> F y -> F z -> (x + y) * z = x * z + y * z.

Axiom CD_add_mul_distrL: forall z w u, CD_carr z -> CD_carr w -> CD_carr u -> z :*: (w :+: u) = z :*: w :+: z :*: u.

End CD_add_mul_distrL.

Section CD_minus_mul_distrR.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_add: forall x y, F x -> F y -> F (x + y).
Hypothesis F_mul: forall x y, F x -> F y -> F (x * y).
Hypothesis F_conj_minus: forall x, F x -> conj (- x) = - conj x.
Hypothesis F_minus_add: forall x y, F x -> F y -> -(x + y) = - x + - y.
Hypothesis F_minus_mul_distrR: forall x y, F x -> F y -> x * (- y) = - (x * y).
Hypothesis F_minus_mul_distrL: forall x y, F x -> F y -> (- x) * y = - (x * y).

Axiom CD_minus_mul_distrR: forall z w, CD_carr z -> CD_carr w -> z :*: (:-: w) = :-: z :*: w.

End CD_minus_mul_distrR.

Section CD_minus_mul_distrL.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.
Prefix - 358 := minus.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_add: forall x y, F x -> F y -> F (x + y).
Hypothesis F_mul: forall x y, F x -> F y -> F (x * y).
Hypothesis F_minus_add: forall x y, F x -> F y -> -(x + y) = - x + - y.
Hypothesis F_minus_mul_distrR: forall x y, F x -> F y -> x * (- y) = - (x * y).
Hypothesis F_minus_mul_distrL: forall x y, F x -> F y -> (- x) * y = - (x * y).

Axiom CD_minus_mul_distrL: forall z w, CD_carr z -> CD_carr w -> (:-: z) :*: w = :-: z :*: w.

End CD_minus_mul_distrL.

Section CD_exp_nat.

Variable minus:set -> set.
Variable conj:set -> set.
Variable add:set -> set -> set.
Variable mul:set -> set -> set.

Prefix - 358 := minus.
Postfix ' 100 := conj.
Infix + 360 right := add.
Infix * 355 right := mul.

Prefix :-: 358 := CD_minus minus.
Postfix ' 100 := CD_conj minus conj.
Infix :+: 360 right := CD_add add.
Infix :*: 355 right := CD_mul minus conj add mul.
Infix ^ 342 := CD_exp_nat minus conj add mul.

Axiom CD_exp_nat_0: forall z, z ^ 0 = 1.

Axiom CD_exp_nat_S: forall z n, nat_p n -> z ^ (ordsucc n) = z :*: z ^ n.

Section CD_exp_nat_1_2.

Hypothesis F_0: F 0.
Hypothesis F_1: F 1.
Hypothesis F_minus_0: - 0 = 0.
Hypothesis F_conj_0: conj 0 = 0.
Hypothesis F_conj_1: conj 1 = 1.
Hypothesis F_add_0L: forall x, F x -> 0 + x = x.
Hypothesis F_add_0R: forall x, F x -> x + 0 = x.
Hypothesis F_mul_0L: forall x, F x -> 0 * x = 0.
Hypothesis F_mul_1R: forall x, F x -> x * 1 = x.

Axiom CD_exp_nat_1: forall z, CD_carr z -> z ^ 1 = z.

Axiom CD_exp_nat_2: forall z, CD_carr z -> z ^ 2 = z :*: z.

End CD_exp_nat_1_2.

Hypothesis F_minus: forall x, F x -> F (- x).
Hypothesis F_conj: forall x, F x -> F (conj x).
Hypothesis F_add: forall x y, F x -> F y -> F (x + y).
Hypothesis F_mul: forall x y, F x -> F y -> F (x * y).

Hypothesis F_0: F 0.
Hypothesis F_1: F 1.

Axiom CD_exp_nat_CD: forall z, CD_carr z -> forall n, nat_p n -> CD_carr (z ^ n).

End CD_exp_nat.

End Alg.

(** Part 12 **)
Section Tags.

Variable tagn:set.
Hypothesis tagn_nat: nat_p tagn.
Hypothesis tagn_1: 1 :e tagn.

Theorem not_TransSet_Sing_tagn : ~TransSet {tagn}.
assume H1: TransSet {tagn}.
claim L1: 0 :e {tagn}.
{ apply H1 tagn (SingI tagn).
  prove 0 :e tagn.
  exact nat_trans tagn tagn_nat 1 tagn_1 0 In_0_1.
}
apply In_no2cycle 0 1 In_0_1.
prove 1 :e 0.
rewrite SingE tagn 0 L1 at 2.
prove 1 :e tagn.
exact tagn_1.
Qed.

Theorem not_ordinal_Sing_tagn : ~ordinal {tagn}.
assume H1. apply H1. assume H2 _. exact not_TransSet_Sing_tagn H2.
Qed.

End Tags.

Section ExtendedSNo.

Let tag : set -> set := fun alpha => SetAdjoin alpha {1}.
Postfix ' 100 := tag.

Definition ExtendedSNoElt_:set -> set -> prop := fun n x => forall v :e Union x, ordinal v \/ exists i :e n, v = {i}.

Theorem extension_SNoElt_mon: forall M N, M c= N -> forall x, ExtendedSNoElt_ M x -> ExtendedSNoElt_ N x.
let M N. assume HMN. let x. assume Hx.
let v. assume Hv.
apply Hx v Hv.
- assume H1: ordinal v.
  prove ordinal v \/ exists i :e N, v = {i}.
  apply orIL. exact H1.
- assume H. apply H.
  let i. assume H. apply H.
  assume Hi: i :e M.
  assume H1: v = {i}.
  prove ordinal v \/ exists i :e N, v = {i}.
  apply orIR. witness i. apply andI.
  + prove i :e N. exact HMN i Hi.
  + exact H1.
Qed.

Theorem Sing_nat_fresh_extension: forall n, nat_p n -> 1 :e n -> forall x, ExtendedSNoElt_ n x -> forall u :e x, {n} /:e u.
let n.
assume Hn.
assume Hn1: 1 :e n.
let x. assume Hx.
let u. assume Hu.
assume H1: {n} :e u.
claim L1: {n} :e Union x.
{ exact UnionI x {n} u H1 Hu. }
apply Hx {n} L1.
- exact not_ordinal_Sing_tagn n Hn Hn1.
- assume H. apply H.
  let i. assume H. apply H.
  assume Hi: i :e n.
  assume H2: {n} = {i}.
  apply In_irref i.
  rewrite <- Sing_inj n i H2 at 2.
  exact Hi.
Qed.

Theorem SNo_ExtendedSNoElt_2: forall x, SNo x -> ExtendedSNoElt_ 2 x.
let x. assume Hx.
let v. assume Hv.
prove ordinal v \/ exists i :e 2, v = {i}.
apply UnionE_impred x v Hv.
let u.
assume H1: v :e u.
assume H2: u :e x.
apply SNoLev_ x Hx.
assume H3: x c= SNoElts_ (SNoLev x).
assume _.
apply binunionE (SNoLev x) {beta '|beta :e SNoLev x} u (H3 u H2).
- assume H4: u :e SNoLev x.
  claim Luo: ordinal u.
  { exact ordinal_Hered (SNoLev x) (SNoLev_ordinal x Hx) u H4. }
  prove ordinal v \/ exists i :e 2, v = {i}.
  apply orIL.
  exact ordinal_Hered u Luo v H1.
- assume H4: u :e {beta '|beta :e SNoLev x}.
  apply ReplE_impred (SNoLev x) tag u H4.
  let beta.
  assume Hb: beta :e SNoLev x.
  assume Hub: u = beta '.
  claim Lv: v :e beta '.
  { rewrite <- Hub. exact H1. }
  apply binunionE beta {{1}} v Lv.
  + assume H5: v :e beta.
    claim Lbo: ordinal beta.
    { exact ordinal_Hered (SNoLev x) (SNoLev_ordinal x Hx) beta Hb. }
    prove ordinal v \/ exists i :e 2, v = {i}.
    apply orIL.
    exact ordinal_Hered beta Lbo v H5.
  + assume H5: v :e {{1}}.
    prove ordinal v \/ exists i :e 2, v = {i}.
    apply orIR.
    witness 1. apply andI.
    * exact In_1_2.
    * prove v = {1}.
      exact SingE {1} v H5.
Qed.

End ExtendedSNo.

Section SurComplex.

Let tag : set -> set := fun alpha => SetAdjoin alpha {1}.
Postfix ' 100 := tag.

Theorem complex_tag_fresh: forall x, SNo x -> forall u :e x, {2} /:e u.
let x. assume Hx.
apply Sing_nat_fresh_extension 2 nat_2 In_1_2 x.
prove ExtendedSNoElt_ 2 x.
exact SNo_ExtendedSNoElt_2 x Hx.
Qed.

Definition SNo_pair : set -> set -> set := pair_tag {2}.

Theorem SNo_pair_0 : forall x, SNo_pair x 0 = x.
exact pair_tag_0 {2} SNo complex_tag_fresh.
Qed.

Theorem SNo_pair_prop_1 : forall x1 y1 x2 y2, SNo x1 -> SNo x2 -> SNo_pair x1 y1 = SNo_pair x2 y2 -> x1 = x2.
exact pair_tag_prop_1 {2} SNo complex_tag_fresh.
Qed.

Theorem SNo_pair_prop_2 : forall x1 y1 x2 y2, SNo x1 -> SNo y1 -> SNo x2 -> SNo y2 -> SNo_pair x1 y1 = SNo_pair x2 y2 -> y1 = y2.
exact pair_tag_prop_2 {2} SNo complex_tag_fresh.
Qed.

Definition CSNo : set -> prop := CD_carr {2} SNo.

Theorem CSNo_I : forall x y, SNo x -> SNo y -> CSNo (SNo_pair x y).
exact CD_carr_I {2} SNo complex_tag_fresh.
Qed.

Theorem CSNo_E : forall z, CSNo z ->
  forall p:set -> prop,
      (forall x y, SNo x -> SNo y -> z = SNo_pair x y -> p (SNo_pair x y))
    -> p z.
exact CD_carr_E {2} SNo complex_tag_fresh.
Qed.

Theorem SNo_CSNo : forall x, SNo x -> CSNo x.
exact CD_carr_0ext {2} SNo complex_tag_fresh SNo_0.
Qed.

Theorem CSNo_0: CSNo 0.
apply SNo_CSNo. exact SNo_0.
Qed.

Theorem CSNo_1: CSNo 1.
apply SNo_CSNo. exact SNo_1.
Qed.

Let ctag : set -> set := fun alpha => SetAdjoin alpha {2}.
Postfix '' 100 := ctag.

Theorem CSNo_ExtendedSNoElt_3: forall z, CSNo z -> ExtendedSNoElt_ 3 z.
let z. assume Hz.
apply CSNo_E z Hz.
let x y.
assume Hx: SNo x.
assume Hy: SNo y.
assume Hzxy: z = SNo_pair x y.
let v.
assume Hv: v :e Union (SNo_pair x y).
apply UnionE_impred (SNo_pair x y) v Hv.
let u.
assume H1: v :e u.
assume H2: u :e SNo_pair x y.
apply binunionE x {w ''|w :e y} u H2.
- assume H3: u :e x.
  claim L1: v :e Union x.
  { exact UnionI x v u H1 H3. }
  prove ordinal v \/ exists i :e 3, v = {i}.
  exact extension_SNoElt_mon 2 3 (ordsuccI1 2) x (SNo_ExtendedSNoElt_2 x Hx) v L1.
- assume H3: u :e {w ''|w :e y}.
  apply ReplE_impred y ctag u H3.
  let w.
  assume Hw: w :e y.
  assume H4: u = w ''.
  claim L2: v :e w ''.
  { rewrite <- H4. exact H1. }
  apply binunionE w {{2}} v L2.
  + assume H5: v :e w.
    claim L3: v :e Union y.
    { exact UnionI y v w H5 Hw. }
    exact extension_SNoElt_mon 2 3 (ordsuccI1 2) y (SNo_ExtendedSNoElt_2 y Hy) v L3.
  + assume H5: v :e {{2}}.
    prove ordinal v \/ exists i :e 3, v = {i}.
    apply orIR.
    witness 2. apply andI.
    * prove 2 :e 3. exact In_2_3.
    * prove v = {2}. exact SingE {2} v H5.
Qed.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix :/: 353 := div_SNo.
Infix ^ 342 right := exp_SNo_nat.

Definition Complex_i : set := SNo_pair 0 1.
Definition CSNo_Re : set -> set := CD_proj0 {2} SNo.
Definition CSNo_Im : set -> set := CD_proj1 {2} SNo.

Let i := Complex_i.
Let Re : set -> set := CSNo_Re.
Let Im : set -> set := CSNo_Im.
Let pa : set -> set -> set := SNo_pair.

Theorem CSNo_Re1: forall z, CSNo z -> SNo (Re z) /\ exists y, SNo y /\ z = pa (Re z) y.
exact CD_proj0_1 {2} SNo complex_tag_fresh.
Qed.

Theorem CSNo_Re2: forall x y, SNo x -> SNo y -> Re (pa x y) = x.
exact CD_proj0_2 {2} SNo complex_tag_fresh.
Qed.

Theorem CSNo_Im1: forall z, CSNo z -> SNo (Im z) /\ z = pa (Re z) (Im z).
exact CD_proj1_1 {2} SNo complex_tag_fresh.
Qed.

Theorem CSNo_Im2: forall x y, SNo x -> SNo y -> Im (pa x y) = y.
exact CD_proj1_2 {2} SNo complex_tag_fresh.
Qed.

Theorem CSNo_ReR: forall z, CSNo z -> SNo (Re z).
exact CD_proj0R {2} SNo complex_tag_fresh.
Qed.

Theorem CSNo_ImR: forall z, CSNo z -> SNo (Im z).
exact CD_proj1R {2} SNo complex_tag_fresh.
Qed.

Theorem CSNo_ReIm: forall z, CSNo z -> z = pa (Re z) (Im z).
exact CD_proj0proj1_eta {2} SNo complex_tag_fresh.
Qed.

Theorem CSNo_ReIm_split: forall z w, CSNo z -> CSNo w -> Re z = Re w -> Im z = Im w -> z = w.
exact CD_proj0proj1_split {2} SNo complex_tag_fresh.
Qed.

Definition CSNoLev : set -> set := fun z => SNoLev (Re z) :\/: SNoLev (Im z).

Theorem CSNoLev_ordinal: forall z, CSNo z -> ordinal (CSNoLev z).
let z. assume Hz.
apply CSNo_E z Hz.
let x y.
assume Hx Hy.
assume Hzxy: z = pa x y.
prove ordinal (SNoLev (Re (pa x y)) :\/: SNoLev (Im (pa x y))).
rewrite CSNo_Re2 x y Hx Hy.
rewrite CSNo_Im2 x y Hx Hy.
prove ordinal (SNoLev x :\/: SNoLev y).
exact ordinal_binunion (SNoLev x) (SNoLev y) (SNoLev_ordinal x Hx) (SNoLev_ordinal y Hy).
Qed.

Let conj : set -> set := fun x => x.

Definition minus_CSNo : set -> set := CD_minus {2} SNo minus_SNo.
Definition conj_CSNo : set -> set := CD_conj {2} SNo minus_SNo conj.
Definition add_CSNo : set -> set -> set := CD_add {2} SNo add_SNo.
Definition mul_CSNo : set -> set -> set := CD_mul {2} SNo minus_SNo conj add_SNo mul_SNo.
Definition exp_CSNo_nat : set -> set -> set := CD_exp_nat {2} SNo minus_SNo conj add_SNo mul_SNo.

Definition abs_sqr_CSNo : set -> set := fun z => Re z ^ 2 + Im z ^ 2.

Definition recip_CSNo : set -> set := fun z => pa (Re z :/: abs_sqr_CSNo z) (- (Im z :/: abs_sqr_CSNo z)).

Let plus' := add_CSNo.
Let mult' := mul_CSNo.

Prefix :-: 358 := minus_CSNo.
Postfix ' 100 := conj_CSNo.
Infix :+: 360 right := add_CSNo.
Infix :*: 355 right := mul_CSNo.
Infix :^: 355 right := exp_CSNo_nat.

Definition div_CSNo : set -> set -> set := fun z w => z :*: recip_CSNo w.

Theorem CSNo_Complex_i : CSNo i.
prove CSNo (pa 0 1).
apply CSNo_I.
- exact SNo_0.
- exact SNo_1.
Qed.

Theorem CSNo_minus_CSNo : forall z, CSNo z -> CSNo (minus_CSNo z).
exact CD_minus_CD {2} SNo complex_tag_fresh minus_SNo SNo_minus_SNo.
Qed.

Theorem minus_CSNo_CRe: forall z, CSNo z -> Re (:-: z) = - Re z.
exact CD_minus_proj0 {2} SNo complex_tag_fresh minus_SNo SNo_minus_SNo.
Qed.

Theorem minus_CSNo_CIm: forall z, CSNo z -> Im (:-: z) = - Im z.
exact CD_minus_proj1 {2} SNo complex_tag_fresh minus_SNo SNo_minus_SNo.
Qed.

Theorem CSNo_conj_CSNo : forall z, CSNo z -> CSNo (conj_CSNo z).
exact CD_conj_CD {2} SNo complex_tag_fresh minus_SNo SNo_minus_SNo conj (fun x H => H).
Qed.

Theorem conj_CSNo_CRe: forall z, CSNo z -> Re (z ') = Re z.
exact CD_conj_proj0 {2} SNo complex_tag_fresh minus_SNo SNo_minus_SNo conj (fun x H => H).
Qed.

Theorem conj_CSNo_CIm: forall z, CSNo z -> Im (z ') = - Im z.
exact CD_conj_proj1 {2} SNo complex_tag_fresh minus_SNo SNo_minus_SNo conj (fun x H => H).
Qed.

Theorem CSNo_add_CSNo : forall z w, CSNo z -> CSNo w -> CSNo (add_CSNo z w).
exact CD_add_CD {2} SNo complex_tag_fresh add_SNo SNo_add_SNo.
Qed.

Theorem CSNo_add_CSNo_3 : forall z w v, CSNo z -> CSNo w -> CSNo v -> CSNo (z :+: w :+: v).
let z w v. assume Hz Hw Hv.
apply CSNo_add_CSNo.
- exact ??.
- apply CSNo_add_CSNo.
  + exact ??.
  + exact ??.
Qed.

Theorem add_CSNo_CRe: forall z w, CSNo z -> CSNo w -> Re (plus' z w) = Re z + Re w.
exact CD_add_proj0 {2} SNo complex_tag_fresh add_SNo SNo_add_SNo.
Qed.

Theorem add_CSNo_CIm: forall z w, CSNo z -> CSNo w -> Im (plus' z w) = Im z + Im w.
exact CD_add_proj1 {2} SNo complex_tag_fresh add_SNo SNo_add_SNo.
Qed.

Theorem CSNo_mul_CSNo : forall z w, CSNo z -> CSNo w -> CSNo (z :*: w).
exact CD_mul_CD {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_minus_SNo (fun x H => H) SNo_add_SNo SNo_mul_SNo.
Qed.

Theorem CSNo_mul_CSNo_3 : forall z w v, CSNo z -> CSNo w -> CSNo v -> CSNo (z :*: w :*: v).
let z w v. assume Hz Hw Hv.
apply CSNo_mul_CSNo.
- exact ??.
- apply CSNo_mul_CSNo.
  + exact ??.
  + exact ??.
Qed.

Theorem mul_CSNo_CRe: forall z w, CSNo z -> CSNo w -> Re (mult' z w) = Re z * Re w + - (Im w * Im z).
exact CD_mul_proj0 {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_minus_SNo (fun x H => H) SNo_add_SNo SNo_mul_SNo.
Qed.

Theorem mul_CSNo_CIm: forall z w, CSNo z -> CSNo w -> Im (mult' z w) = Im w * Re z + Im z * Re w.
exact CD_mul_proj1 {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_minus_SNo (fun x H => H) SNo_add_SNo SNo_mul_SNo.
Qed.

Theorem SNo_Re: forall x, SNo x -> Re x = x.
exact CD_proj0_F {2} SNo complex_tag_fresh SNo_0.
Qed.

Theorem SNo_Im: forall x, SNo x -> Im x = 0.
exact CD_proj1_F {2} SNo complex_tag_fresh SNo_0.
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

Theorem conj_CSNo_id_SNo: forall x, SNo x -> x ' = x.
exact CD_conj_F_eq {2} SNo complex_tag_fresh minus_SNo SNo_0 minus_SNo_0 conj.
Qed.

Theorem conj_CSNo_0 : 0 ' = 0.
exact conj_CSNo_id_SNo 0 SNo_0.
Qed.

Theorem conj_CSNo_1 : 1 ' = 1.
exact conj_CSNo_id_SNo 1 SNo_1.
Qed.

Theorem conj_CSNo_i : i ' = :-: i.
apply CSNo_ReIm_split (i ') (:-: i)
                      (CSNo_conj_CSNo i CSNo_Complex_i)
                      (CSNo_minus_CSNo i CSNo_Complex_i).
- prove Re (i ') = Re (:-: i).
  rewrite conj_CSNo_CRe i CSNo_Complex_i.
  rewrite minus_CSNo_CRe i CSNo_Complex_i.
  prove Re i = - Re i.
  rewrite Re_i.
  symmetry.
  exact minus_SNo_0.
- prove Im (i ') = Im (:-: i).
  rewrite minus_CSNo_CIm i CSNo_Complex_i.
  exact conj_CSNo_CIm i CSNo_Complex_i.
Qed.

Theorem minus_CSNo_minus_SNo : forall x, SNo x -> :-: x = - x.
exact CD_minus_F_eq {2} SNo complex_tag_fresh minus_SNo SNo_0 minus_SNo_0.
Qed.

Theorem minus_CSNo_0 : :-: 0 = 0.
rewrite minus_CSNo_minus_SNo 0 SNo_0.
exact minus_SNo_0.
Qed.

Theorem add_CSNo_add_SNo: forall x y, SNo x -> SNo y -> x :+: y = x + y.
exact CD_add_F_eq {2} SNo complex_tag_fresh add_SNo SNo_0 (add_SNo_0L 0 SNo_0).
Qed.

Theorem mul_CSNo_mul_SNo: forall x y, SNo x -> SNo y -> x :*: y = x * y.
exact CD_mul_F_eq {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_0 (fun x H => H) SNo_mul_SNo minus_SNo_0 add_SNo_0R mul_SNo_zeroL mul_SNo_zeroR.
Qed.

Theorem minus_CSNo_invol : forall z, CSNo z -> :-: :-: z = z.
exact CD_minus_invol {2} SNo complex_tag_fresh minus_SNo SNo_minus_SNo minus_SNo_invol.
Qed.

Theorem conj_CSNo_invol : forall z, CSNo z -> z ' ' = z.
exact CD_conj_invol {2} SNo complex_tag_fresh minus_SNo conj SNo_minus_SNo (fun x H => H) minus_SNo_invol (fun x _ q H => H).
Qed.

Theorem conj_minus_CSNo: forall z, CSNo z -> (:-: z) ' = :-: (z ').
exact CD_conj_minus {2} SNo complex_tag_fresh minus_SNo conj SNo_minus_SNo (fun x H => H) (fun x _ q H => H).
Qed.

Theorem minus_add_CSNo: forall z w, CSNo z -> CSNo w -> :-: (z :+: w) = :-: z :+: :-: w.
exact CD_minus_add {2} SNo complex_tag_fresh minus_SNo add_SNo SNo_minus_SNo SNo_add_SNo minus_add_SNo_distr.
Qed.

Theorem conj_add_CSNo: forall z w, CSNo z -> CSNo w -> (z :+: w) ' = z ' :+: w '.
exact CD_conj_add {2} SNo complex_tag_fresh minus_SNo conj add_SNo SNo_minus_SNo (fun x H => H) SNo_add_SNo minus_add_SNo_distr (fun x y _ _ q H => H).
Qed.

Theorem add_CSNo_com : forall z w, CSNo z -> CSNo w -> z :+: w = w :+: z.
exact CD_add_com {2} SNo complex_tag_fresh add_SNo add_SNo_com.
Qed.

Theorem add_CSNo_assoc: forall z w v, CSNo z -> CSNo w -> CSNo v -> (z :+: w) :+: v = z :+: (w :+: v).
claim L1: forall x y z, SNo x -> SNo y -> SNo z -> (x + y) + z = x + (y + z).
{ let x y z. assume Hx Hy Hz. symmetry. exact add_SNo_assoc x y z Hx Hy Hz. }
apply CD_add_assoc {2} SNo complex_tag_fresh add_SNo SNo_add_SNo L1.
Qed.

Theorem add_CSNo_0L : forall z, CSNo z -> add_CSNo 0 z = z.
exact CD_add_0L {2} SNo complex_tag_fresh add_SNo SNo_0 add_SNo_0L.
Qed.

Theorem add_CSNo_0R : forall z, CSNo z -> add_CSNo z 0 = z.
exact CD_add_0R {2} SNo complex_tag_fresh add_SNo SNo_0 add_SNo_0R.
Qed.

Theorem add_CSNo_minus_CSNo_linv : forall z, CSNo z -> add_CSNo (minus_CSNo z) z = 0.
exact CD_add_minus_linv {2} SNo complex_tag_fresh minus_SNo add_SNo SNo_minus_SNo add_SNo_minus_SNo_linv.
Qed.

Theorem add_CSNo_minus_CSNo_rinv : forall z, CSNo z -> add_CSNo z (minus_CSNo z) = 0.
exact CD_add_minus_rinv {2} SNo complex_tag_fresh minus_SNo add_SNo SNo_minus_SNo add_SNo_minus_SNo_rinv.
Qed.

Theorem mul_CSNo_0R: forall z, CSNo z -> z :*: 0 = 0.
exact CD_mul_0R {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_0 minus_SNo_0 (fun q H => H) (add_SNo_0L 0 SNo_0) mul_SNo_zeroL mul_SNo_zeroR.
Qed.

Theorem mul_CSNo_0L: forall z, CSNo z -> 0 :*: z = 0.
exact CD_mul_0L {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_0 (fun x H => H) minus_SNo_0 (add_SNo_0L 0 SNo_0) mul_SNo_zeroL mul_SNo_zeroR.
Qed.

Theorem mul_CSNo_1R: forall z, CSNo z -> z :*: 1 = z.
exact CD_mul_1R {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_0 SNo_1 minus_SNo_0 (fun q H => H) (fun q H => H) add_SNo_0L add_SNo_0R mul_SNo_zeroL mul_SNo_oneR.
Qed.

Theorem mul_CSNo_1L: forall z, CSNo z -> 1 :*: z = z.
exact CD_mul_1L {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_0 SNo_1 (fun x H => H) minus_SNo_0 add_SNo_0R mul_SNo_zeroL mul_SNo_zeroR mul_SNo_oneL mul_SNo_oneR.
Qed.

Theorem conj_mul_CSNo: forall z w, CSNo z -> CSNo w -> (z :*: w) ' = w ' :*: z '.
exact CD_conj_mul {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_minus_SNo (fun z H => H) SNo_add_SNo SNo_mul_SNo minus_SNo_invol (fun x _ q H => H) (fun x _ q H => H) (fun x y _ _ q H => H) minus_add_SNo_distr add_SNo_com mul_SNo_com mul_SNo_minus_distrR mul_SNo_minus_distrL.
Qed.

Theorem mul_CSNo_distrL : forall z w u, CSNo z -> CSNo w -> CSNo u -> z :*: (w :+: u) = z :*: w :+: z :*: u.
claim L1: forall x y z, SNo x -> SNo y -> SNo z -> (x + y) + z = x + (y + z).
{ let x y z. assume Hx Hy Hz. symmetry. exact add_SNo_assoc x y z Hx Hy Hz. }
exact CD_add_mul_distrL {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_minus_SNo (fun x H => H) SNo_add_SNo SNo_mul_SNo minus_add_SNo_distr (fun x y _ _ q H => H) L1 add_SNo_com mul_SNo_distrL mul_SNo_distrR.
Qed.

Theorem mul_CSNo_distrR : forall z w u, CSNo z -> CSNo w -> CSNo u -> (z :+: w) :*: u = z :*: u :+: w :*: u.
claim L1: forall x y z, SNo x -> SNo y -> SNo z -> (x + y) + z = x + (y + z).
{ let x y z. assume Hx Hy Hz. symmetry. exact add_SNo_assoc x y z Hx Hy Hz. }
exact CD_add_mul_distrR {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_minus_SNo (fun x H => H) SNo_add_SNo SNo_mul_SNo minus_add_SNo_distr L1 add_SNo_com mul_SNo_distrL mul_SNo_distrR.
Qed.

Theorem minus_mul_CSNo_distrR: forall z w, CSNo z -> CSNo w -> z :*: (:-: w) = :-: z :*: w.
exact CD_minus_mul_distrR {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_minus_SNo (fun x H => H) SNo_add_SNo SNo_mul_SNo (fun x _ q H => H) minus_add_SNo_distr mul_SNo_minus_distrR mul_SNo_minus_distrL.
Qed.

Theorem minus_mul_CSNo_distrL: forall z w, CSNo z -> CSNo w -> (:-: z) :*: w = :-: z :*: w.
exact CD_minus_mul_distrL {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_minus_SNo (fun x H => H) SNo_add_SNo SNo_mul_SNo minus_add_SNo_distr mul_SNo_minus_distrR mul_SNo_minus_distrL.
Qed.

Theorem exp_CSNo_nat_0: forall z, z :^: 0 = 1.
exact CD_exp_nat_0 {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo.
Qed.

Theorem exp_CSNo_nat_S: forall z n, nat_p n -> z :^: (ordsucc n) = z :*: z :^: n.
exact CD_exp_nat_S {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo.
Qed.

Theorem exp_CSNo_nat_1: forall z, CSNo z -> z :^: 1 = z.
exact CD_exp_nat_1 {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_0 SNo_1 minus_SNo_0 (fun q H => H) (fun q H => H) add_SNo_0L add_SNo_0R mul_SNo_zeroL mul_SNo_oneR.
Qed.

Theorem exp_CSNo_nat_2: forall z, CSNo z -> z :^: 2 = z :*: z.
exact CD_exp_nat_2 {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_0 SNo_1 minus_SNo_0 (fun q H => H) (fun q H => H) add_SNo_0L add_SNo_0R mul_SNo_zeroL mul_SNo_oneR.
Qed.

Theorem CSNo_exp_CSNo_nat: forall z, CSNo z -> forall n, nat_p n -> CSNo (z :^: n).
exact CD_exp_nat_CD {2} SNo complex_tag_fresh minus_SNo conj add_SNo mul_SNo SNo_minus_SNo (fun x H => H) SNo_add_SNo SNo_mul_SNo SNo_0 SNo_1.
Qed.

Theorem add_SNo_rotate_4_0312: forall x y z w, SNo x -> SNo y -> SNo z -> SNo w -> (x + y) + (z + w) = (x + w) + (y + z).
let x y z w. assume Hx Hy Hz Hw.
rewrite add_SNo_com z w Hz Hw.
prove (x + y) + (w + z) = (x + w) + (y + z).
exact add_SNo_com_4_inner_mid x y w z Hx Hy Hw Hz.
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
  transitivity Re z * Re w + - (Im w * Im z),
               Re w * Re z + - (Im z * Im w).
  + exact mul_CSNo_CRe z w Hz Hw.
  + f_equal.
    * exact mul_SNo_com (Re z) (Re w) LRezR LRewR.
    * f_equal. exact mul_SNo_com (Im w) (Im z) LImwR LImzR.
  + symmetry. exact mul_CSNo_CRe w z Hw Hz.
- prove Im (mult' z w) = Im (mult' w z).
  transitivity Im w * Re z + Im z * Re w,
               Im z * Re w + Im w * Re z.
  + exact mul_CSNo_CIm z w Hz Hw.
  + exact add_SNo_com (Im w * Re z) (Im z * Re w) (SNo_mul_SNo (Im w) (Re z) LImwR LRezR) (SNo_mul_SNo (Im z) (Re w) LImzR LRewR).
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
  transitivity Re z * Re (mult' w v) + - (Im (mult' w v) * Im z),
               (Re z * Re w * Re v + - (Re z * Im v * Im w))
                 + (- Im v * Re w * Im z + - Im w * Re v * Im z),
               (Re z * Re w * Re v + - Im w * Re v * Im z)
                 + (- (Re z * Im v * Im w) + - Im v * Re w * Im z),
               Re (mult' z w) * Re v + - (Im v * Im (mult' z w)).
  + exact mul_CSNo_CRe z (mult' w v) Hz Lwv.
  + f_equal.
    * { prove Re z * Re (mult' w v) = Re z * Re w * Re v + - (Re z * Im v * Im w).
        transitivity Re z * (Re w * Re v + - (Im v * Im w)),
                     Re z * Re w * Re v + Re z * (- (Im v * Im w)).
        - f_equal. exact mul_CSNo_CRe w v Hw Hv.
	- apply mul_SNo_distrL (Re z) (Re w * Re v) (- (Im v * Im w)) LRezR (SNo_mul_SNo (Re w) (Re v) LRewR LRevR).
	  apply SNo_minus_SNo.
	  exact SNo_mul_SNo (Im v) (Im w) LImvR LImwR.
	- f_equal.
	  prove Re z * (- (Im v * Im w)) = - (Re z * Im v * Im w).
	  exact mul_SNo_minus_distrR (Re z) (Im v * Im w) LRezR (SNo_mul_SNo (Im v) (Im w) LImvR LImwR).
      }
    * { prove - (Im (mult' w v) * Im z) = - Im v * Re w * Im z + - Im w * Re v * Im z.
        transitivity - (Im v * Re w * Im z + Im w * Re v * Im z).
	- f_equal.
          prove Im (mult' w v) * Im z  = Im v * Re w * Im z + Im w * Re v * Im z.
	  transitivity (Im v * Re w + Im w * Re v) * Im z,
                       (Im v * Re w) * Im z + (Im w * Re v) * Im z.
	  + f_equal. exact mul_CSNo_CIm w v Hw Hv.
          + prove (Im v * Re w + Im w * Re v) * Im z
                = (Im v * Re w) * Im z + (Im w * Re v) * Im z.
	    exact mul_SNo_distrR (Im v * Re w) (Im w * Re v) (Im z)
                    (SNo_mul_SNo (Im v) (Re w) LImvR LRewR)
                    (SNo_mul_SNo (Im w) (Re v) LImwR LRevR)
                    LImzR.
          + f_equal.
            * symmetry. exact mul_SNo_assoc (Im v) (Re w) (Im z) ?? ?? ??.
            * symmetry. exact mul_SNo_assoc (Im w) (Re v) (Im z) ?? ?? ??.
        - prove - (Im v * Re w * Im z + Im w * Re v * Im z)
              = - Im v * Re w * Im z + - Im w * Re v * Im z.
          apply minus_add_SNo_distr.
	  + exact SNo_mul_SNo_3 (Im v) (Re w) (Im z) LImvR LRewR LImzR.
	  + exact SNo_mul_SNo_3 (Im w) (Re v) (Im z) LImwR LRevR LImzR.
      }
  + apply add_SNo_rotate_4_0312.
    * exact SNo_mul_SNo_3 (Re z) (Re w) (Re v) LRezR LRewR LRevR.
    * apply SNo_minus_SNo.
      exact SNo_mul_SNo_3 (Re z) (Im v) (Im w) LRezR LImvR LImwR.
    * apply SNo_minus_SNo.
      exact SNo_mul_SNo_3 (Im v) (Re w) (Im z) LImvR LRewR LImzR.
    * apply SNo_minus_SNo.
      exact SNo_mul_SNo_3 (Im w) (Re v) (Im z) LImwR LRevR LImzR.
  + prove (Re z * Re w * Re v + - Im w * Re v * Im z) + (- (Re z * Im v * Im w) + - Im v * Re w * Im z)
        = (Re (mult' z w) * Re v) + - (Im v * Im (mult' z w)).
    f_equal.
    * { prove Re z * Re w * Re v + - Im w * Re v * Im z = Re (mult' z w) * Re v.
        transitivity (Re z * Re w) * Re v + (- (Im w * Im z)) * Re v,
                     (Re z * Re w + - (Im w * Im z)) * Re v.
	- f_equal.
	  + prove Re z * Re w * Re v = (Re z * Re w) * Re v.
	    exact mul_SNo_assoc (Re z) (Re w) (Re v) LRezR LRewR LRevR.
	  + prove - (Im w * Re v * Im z) = (- (Im w * Im z)) * Re v.
	    transitivity - ((Im w * Im z) * Re v).
	    * { f_equal.
                transitivity (Im w * Im z * Re v).
                - f_equal. exact mul_SNo_com (Re v) (Im z) ?? ??.
                - exact mul_SNo_assoc (Im w) (Im z) (Re v) ?? ?? ??.
              }
	    * symmetry.
              prove (- (Im w * Im z)) * Re v = - ((Im w * Im z) * Re v).
	      exact mul_SNo_minus_distrL (Im w * Im z) (Re v) (SNo_mul_SNo (Im w) (Im z) LImwR LImzR) LRevR.
	- symmetry. exact mul_SNo_distrR (Re z * Re w) (- (Im w * Im z)) (Re v) (SNo_mul_SNo (Re z) (Re w) LRezR LRewR) (SNo_minus_SNo (Im w * Im z) (SNo_mul_SNo (Im w) (Im z) LImwR LImzR)) LRevR.
	- f_equal. symmetry. exact mul_CSNo_CRe z w Hz Hw.
      }
    * { prove - (Re z * Im v * Im w) + - Im v * Re w * Im z = - (Im v * Im (mult' z w)).
        transitivity - (Re z * Im v * Im w + Im v * Re w * Im z).
        - symmetry. apply minus_add_SNo_distr.
	  + exact SNo_mul_SNo_3 (Re z) (Im v) (Im w) ?? ?? ??.
	  + exact SNo_mul_SNo_3 (Im v) (Re w) (Im z) ?? ?? ??.
	- f_equal.
          prove Re z * Im v * Im w + Im v * Re w * Im z = Im v * Im (mult' z w).
          rewrite mul_SNo_com_3_0_1 (Re z) (Im v) (Im w) ?? ?? ??.
          transitivity Im v * (Re z * Im w + Re w * Im z).
          + symmetry. exact mul_SNo_distrL (Im v) (Re z * Im w) (Re w * Im z) ?? (SNo_mul_SNo (Re z) (Im w) ?? ??) (SNo_mul_SNo (Re w) (Im z) ?? ??).
          + prove Im v * (Re z * Im w + Re w * Im z) = Im v * Im (mult' z w).
            f_equal. symmetry.
            prove Im (mult' z w) = Re z * Im w + Re w * Im z.
            rewrite mul_SNo_com (Re z) (Im w) ?? ??.
            rewrite mul_SNo_com (Re w) (Im z) ?? ??.
            exact mul_CSNo_CIm z w Hz Hw.
      }
  + prove (Re (mult' z w) * Re v) + - (Im v * Im (mult' z w))
        = Re (mult' (mult' z w) v).
    symmetry.
    exact mul_CSNo_CRe (mult' z w) v Lzw Hv.
- prove Im (mult' z (mult' w v)) = Im (mult' (mult' z w) v).
  transitivity Im (mult' w v) * Re z + Im z * Re (mult' w v),
               (Im v * Re w + Im w * Re v) * Re z + Im z * (Re w * Re v + - (Im v * Im w)),
               (Im v * Re w * Re z + Im w * Re v * Re z) + (Im z * Re w * Re v + - (Im z * Im v * Im w)),
               (Im v * Re w * Re z + - (Im z * Im v * Im w)) + (Im w * Re v * Re z + Im z * Re w * Re v),
               Im v * (Re z * Re w + - (Im w * Im z)) + (Im w * Re z + Im z * Re w) * Re v,
               Im v * Re (mult' z w) + Im (mult' z w) * Re v.
  + prove Im (mult' z (mult' w v)) = Im (mult' w v) * Re z + Im z * Re (mult' w v).
    exact mul_CSNo_CIm z (mult' w v) Hz Lwv.
  + prove Im (mult' w v) * Re z + Im z * Re (mult' w v) = (Im v * Re w + Im w * Re v) * Re z + Im z * (Re w * Re v + - (Im v * Im w)).
    f_equal.
    * f_equal. exact mul_CSNo_CIm w v ?? ??.
    * f_equal. exact mul_CSNo_CRe w v ?? ??.
  + prove (Im v * Re w + Im w * Re v) * Re z + Im z * (Re w * Re v + - (Im v * Im w)) = (Im v * Re w * Re z + Im w * Re v * Re z) + (Im z * Re w * Re v + - (Im z * Im v * Im w)).
    f_equal.
    * { transitivity (Im v * Re w) * Re z + (Im w * Re v) * Re z.
        - exact mul_SNo_distrR (Im v * Re w) (Im w * Re v) (Re z) (SNo_mul_SNo (Im v) (Re w) ?? ??) (SNo_mul_SNo (Im w) (Re v) ?? ??) ??.
        - f_equal.
          + symmetry. exact mul_SNo_assoc (Im v) (Re w) (Re z) ?? ?? ??.
          + symmetry. exact mul_SNo_assoc (Im w) (Re v) (Re z) ?? ?? ??.
      }
    * { transitivity Im z * Re w * Re v + Im z * (- (Im v * Im w)).
        - apply mul_SNo_distrL (Im z) (Re w * Re v) (- (Im v * Im w)) ?? (SNo_mul_SNo (Re w) (Re v) ?? ??).
          apply SNo_minus_SNo.
          exact SNo_mul_SNo (Im v) (Im w) ?? ??.
        - f_equal.
          prove Im z * (- (Im v * Im w)) = - Im z * Im v * Im w.
          exact mul_SNo_minus_distrR (Im z) (Im v * Im w) ?? (SNo_mul_SNo (Im v) (Im w) ?? ??).
      }
  + prove (Im v * Re w * Re z + Im w * Re v * Re z) + (Im z * Re w * Re v + - (Im z * Im v * Im w)) = (Im v * Re w * Re z + - (Im z * Im v * Im w)) + (Im w * Re v * Re z + Im z * Re w * Re v).
    apply add_SNo_rotate_4_0312.
    * { apply SNo_mul_SNo_3.
        - exact ??.
        - exact ??.
        - exact ??.
      }
    * { apply SNo_mul_SNo_3.
        - exact ??.
        - exact ??.
        - exact ??.
      }
    * { apply SNo_mul_SNo_3.
        - exact ??.
        - exact ??.
        - exact ??.
      }
    * { apply SNo_minus_SNo.
        apply SNo_mul_SNo_3.
        - exact ??.
        - exact ??.
        - exact ??.
      }
  + f_equal.
    * { prove Im v * Re w * Re z + - (Im z * Im v * Im w) = Im v * (Re z * Re w + - (Im w * Im z)).
        rewrite mul_SNo_com (Re w) (Re z) ?? ??.
        rewrite mul_SNo_com (Im w) (Im z) ?? ??.
        rewrite mul_SNo_com_3_0_1 (Im z) (Im v) (Im w) ?? ?? ??.
        prove Im v * Re z * Re w + - (Im v * Im z * Im w) = Im v * (Re z * Re w + - (Im z * Im w)).
        rewrite <- mul_SNo_minus_distrR (Im v) (Im z * Im w) ?? (SNo_mul_SNo (Im z) (Im w) ?? ??).
        symmetry.
        prove Im v * (Re z * Re w + - (Im z * Im w)) = Im v * Re z * Re w + Im v * (- Im z * Im w).
        exact mul_SNo_distrL (Im v) (Re z * Re w) (- (Im z * Im w)) ??
                             (SNo_mul_SNo (Re z) (Re w) ?? ??)
                             (SNo_minus_SNo (Im z * Im w) (SNo_mul_SNo (Im z) (Im w) ?? ??)).
      }
    * { prove Im w * Re v * Re z + Im z * Re w * Re v = (Im w * Re z + Im z * Re w) * Re v.
        rewrite mul_SNo_com (Re v) (Re z) ?? ??.
        rewrite mul_SNo_assoc (Im w) (Re z) (Re v) ?? ?? ??.
        rewrite mul_SNo_assoc (Im z) (Re w) (Re v) ?? ?? ??.
        symmetry.
        exact mul_SNo_distrR (Im w * Re z) (Im z * Re w) (Re v) (SNo_mul_SNo (Im w) (Re z) ?? ??) (SNo_mul_SNo (Im z) (Re w) ?? ??) ??.
      }
  + prove Im v * (Re z * Re w + - (Im w * Im z)) + (Im w * Re z + Im z * Re w) * Re v = Im v * Re (mult' z w) + Im (mult' z w) * Re v.
    f_equal.
    * f_equal. symmetry. exact mul_CSNo_CRe z w Hz Hw.
    * f_equal. symmetry. exact mul_CSNo_CIm z w Hz Hw.
  + prove Im v * Re (mult' z w) + Im (mult' z w) * Re v = Im (mult' (mult' z w) v).
    symmetry. exact mul_CSNo_CIm (mult' z w) v Lzw Hv.
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
  prove Im i * Re i + Im i * Re i = - Im 1.
  rewrite Re_i. rewrite Im_i. rewrite Im_1.
  prove 1 * 0 + 1 * 0 = - 0.
  rewrite minus_SNo_0.
  rewrite mul_SNo_zeroR 1 SNo_1.
  prove 0 + 0 = 0.
  exact add_SNo_0L 0 SNo_0.
Qed.

Theorem SNo_abs_sqr_CSNo: forall z, CSNo z -> SNo (abs_sqr_CSNo z).
let z. assume Hz.
prove SNo (Re z ^ 2 + Im z ^ 2).
apply SNo_add_SNo.
- apply SNo_exp_SNo_nat.
  + exact CSNo_ReR z Hz.
  + exact nat_2.
- apply SNo_exp_SNo_nat.
  + exact CSNo_ImR z Hz.
  + exact nat_2.
Qed.

Theorem abs_sqr_CSNo_nonneg: forall z, CSNo z -> 0 <= abs_sqr_CSNo z.
let z. assume Hz.
set x := Re z.
set y := Im z.
claim Lx: SNo x.
{ exact CSNo_ReR z Hz. }
claim Ly: SNo y.
{ exact CSNo_ImR z Hz. }
claim Lxx: SNo (x ^ 2).
{ exact SNo_exp_SNo_nat x Lx 2 nat_2. }
claim Lyy: SNo (y ^ 2).
{ exact SNo_exp_SNo_nat y Ly 2 nat_2. }
prove 0 <= x ^ 2 + y ^ 2.
rewrite <- add_SNo_0L 0 SNo_0 at 1.
prove 0 + 0 <= x ^ 2 + y ^ 2.
apply add_SNo_Le3 0 0 (x ^ 2) (y ^ 2) SNo_0 SNo_0 Lxx Lyy.
- rewrite exp_SNo_nat_2 x Lx. exact SNo_sqr_nonneg x Lx.
- rewrite exp_SNo_nat_2 y Ly. exact SNo_sqr_nonneg y Ly.
Qed.

Theorem abs_sqr_CSNo_zero: forall z, CSNo z ->  abs_sqr_CSNo z = 0 -> z = 0.
let z. assume Hz.
set x := Re z.
set y := Im z.
set s := x ^ 2 + y ^ 2.
assume H1: s = 0.
claim Lx: SNo x.
{ exact CSNo_ReR z Hz. }
claim Ly: SNo y.
{ exact CSNo_ImR z Hz. }
claim Lxx: SNo (x ^ 2).
{ exact SNo_exp_SNo_nat x Lx 2 nat_2. }
claim Lyy: SNo (y ^ 2).
{ exact SNo_exp_SNo_nat y Ly 2 nat_2. }
claim Ls: SNo s.
{ exact SNo_add_SNo (x ^ 2) (y ^ 2) Lxx Lyy. }
prove z = 0.
apply CSNo_ReIm_split z 0 Hz CSNo_0.
- prove Re z = Re 0. rewrite Re_0.
  prove x = 0.
  apply SNo_zero_or_sqr_pos' x Lx.
  + assume H2: x = 0. exact H2.
  + assume H2: 0 < x ^ 2. prove False.
    apply SNoLt_irref 0.
    prove 0 < 0.
    rewrite <- H1 at 2.
    prove 0 < s.
    apply SNoLtLe_tra 0 (x ^ 2) s SNo_0 ?? ?? H2.
    prove x ^ 2 <= s.
    rewrite <- add_SNo_0R (x ^ 2) ?? at 1.
    prove x ^ 2 + 0 <= s.
    apply add_SNo_Le2 (x ^ 2) 0 (y ^ 2) ?? SNo_0 ??.
    prove 0 <= y ^ 2.
    apply SNo_sqr_nonneg' y Ly.
- prove Im z = Im 0. rewrite Im_0.
  prove y = 0.
  apply SNo_zero_or_sqr_pos' y Ly.
  + assume H2: y = 0. exact H2.
  + assume H2: 0 < y ^ 2. prove False.
    apply SNoLt_irref 0.
    prove 0 < 0.
    rewrite <- H1 at 2.
    prove 0 < s.
    apply SNoLtLe_tra 0 (y ^ 2) s SNo_0 ?? ?? H2.
    prove y ^ 2 <= s.
    rewrite <- add_SNo_0L (y ^ 2) ?? at 1.
    prove 0 + y ^ 2 <= s.
    apply add_SNo_Le1 0 (y ^ 2) (x ^ 2) SNo_0 ?? ??.
    prove 0 <= x ^ 2.
    apply SNo_sqr_nonneg' x Lx.
Qed.

Theorem CSNo_recip_CSNo: forall z, CSNo z -> CSNo (recip_CSNo z).
let z. assume Hz.
set s := Re z ^ 2 + Im z ^ 2.
claim LRezR: SNo (Re z).
{ exact CSNo_ReR z Hz. }
claim LImzR: SNo (Im z).
{ exact CSNo_ImR z Hz. }
claim Ls: SNo s.
{ exact SNo_abs_sqr_CSNo z Hz. }
prove CSNo (pa (Re z :/: s) (- (Im z :/: s))).
apply CSNo_I.
- prove SNo (Re z :/: s).
  apply SNo_div_SNo.
  + exact LRezR.
  + exact Ls.
- prove SNo (- (Im z :/: s)).
  apply SNo_minus_SNo.
  apply SNo_div_SNo.
  + exact LImzR.
  + exact Ls.
Qed.

Theorem CSNo_relative_recip : forall z, CSNo z -> forall u, SNo u -> (Re z ^ 2 + Im z ^ 2) * u = 1 -> z :*: (u :*: Re z :+: :-: i :*: u :*: Im z) = 1.
let z. assume Hz. let u. assume Hu.
assume Hur: (Re z ^ 2 + Im z ^ 2) * u = 1.
prove z :*: (u :*: Re z :+: :-: i :*: u :*: Im z) = 1.
claim LRezR: SNo (Re z).
{ exact CSNo_ReR z Hz. }
claim LImzR: SNo (Im z).
{ exact CSNo_ImR z Hz. }
prove z :*: (u :*: Re z :+: :-: i :*: u :*: Im z) = 1.
rewrite mul_CSNo_mul_SNo u (Re z) Hu LRezR.
rewrite mul_CSNo_mul_SNo u (Im z) Hu LImzR.
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
      + - Im (u * Re z :+: :-: i :*: u * Im z) * Im z = 1.
  rewrite add_CSNo_CRe (u * Re z) (:-: i :*: u * Im z) LuRez' LmiuImz.
  rewrite add_CSNo_CIm (u * Re z) (:-: i :*: u * Im z) LuRez' LmiuImz.
  prove Re z * (Re (u * Re z) + Re (:-: i :*: u * Im z))
      + - (Im (u * Re z) + Im (:-: i :*: u * Im z)) * Im z = 1.
  rewrite minus_CSNo_CRe (i :*: u * Im z) LiuImz.
  rewrite minus_CSNo_CIm (i :*: u * Im z) LiuImz.
  rewrite SNo_Re (u * Re z) LuRez.
  rewrite SNo_Im (u * Re z) LuRez.
  prove Re z * (u * Re z + - Re (i :*: u * Im z))
      + - (0 + - Im (i :*: u * Im z)) * Im z = 1.
  rewrite mul_CSNo_CRe i (u * Im z) CSNo_Complex_i LuImz'.
  prove Re z * (u * Re z + - (Re i * Re (u * Im z) + - Im (u * Im z) * Im i))
      + - (0 + - Im (i :*: u * Im z)) * Im z = 1.
  rewrite mul_CSNo_CIm i (u * Im z) CSNo_Complex_i LuImz'.
  prove Re z * (u * Re z + - (Re i * Re (u * Im z) + - Im (u * Im z) * Im i))
      + - (0 + - (Im (u * Im z) * Re i + Im i * Re (u * Im z))) * Im z = 1.
  rewrite Re_i. rewrite Im_i.
  prove Re z * (u * Re z + - (0 * Re (u * Im z) + - Im (u * Im z) * 1))
      + - (0 + - (Im (u * Im z) * 0 + 1 * Re (u * Im z))) * Im z = 1.
  rewrite SNo_Re (u * Im z) LuImz.
  rewrite SNo_Im (u * Im z) LuImz.
  prove Re z * (u * Re z + - (0 * (u * Im z) + - 0 * 1))
      + - (0 + - (0 * 0 + 1 * (u * Im z))) * Im z = 1.
  rewrite mul_SNo_zeroR 0 SNo_0.
  rewrite mul_SNo_zeroL (u * Im z) LuImz.
  rewrite mul_SNo_zeroL 1 SNo_1.
  prove Re z * (u * Re z + - (0 + - 0))
      + - (0 + - (0 + 1 * (u * Im z))) * Im z = 1.
  rewrite minus_SNo_0.
  rewrite add_SNo_0L 0 SNo_0.
  rewrite minus_SNo_0.
  rewrite add_SNo_0R (u * Re z) LuRez.
  prove Re z * (u * Re z)
      + - (0 + - (0 + 1 * (u * Im z))) * Im z = 1.
  rewrite mul_SNo_oneL (u * Im z) LuImz.
  prove Re z * (u * Re z)
      + - (0 + - (0 + (u * Im z))) * Im z = 1.
  rewrite add_SNo_0L (u * Im z) LuImz.
  rewrite add_SNo_0L (- u * Im z) (SNo_minus_SNo (u * Im z) LuImz).
  prove Re z * (u * Re z)
      + - (- (u * Im z)) * Im z = 1.
  rewrite <- mul_SNo_minus_distrL (- u * Im z) (Im z) (SNo_minus_SNo (u * Im z) LuImz) LImzR.
  rewrite minus_SNo_invol (u * Im z) LuImz.
  prove Re z * (u * Re z) + (u * Im z) * Im z = 1.
  rewrite mul_SNo_com_3_0_1 (Re z) u (Re z) ?? ?? ??.
  rewrite <- mul_SNo_assoc u (Im z) (Im z) ?? ?? ??.
  prove u * (Re z * Re z) + u * (Im z * Im z) = 1.
  rewrite mul_SNo_com u (Re z * Re z) ?? ??.
  rewrite mul_SNo_com u (Im z * Im z) ?? ??.
  rewrite <- mul_SNo_distrR (Re z * Re z) (Im z * Im z) u ?? ?? ??.
  rewrite <- exp_SNo_nat_2 (Re z) ??.
  rewrite <- exp_SNo_nat_2 (Im z) ??.
  exact Hur.
- prove Im (z :*: (u * Re z :+: :-: i :*: u * Im z)) = Im 1.
  rewrite mul_CSNo_CIm z (u * Re z :+: :-: i :*: u * Im z) Hz L1.
  rewrite Im_1.
  prove Im (u * Re z :+: :-: i :*: u * Im z) * Re z
      + Im z * Re (u * Re z :+: :-: i :*: u * Im z) = 0.
  rewrite add_CSNo_CRe (u * Re z) (:-: i :*: u * Im z) LuRez' LmiuImz.
  rewrite add_CSNo_CIm (u * Re z) (:-: i :*: u * Im z) LuRez' LmiuImz.
  prove (Im (u * Re z) + Im (:-: i :*: u * Im z)) * Re z
      + Im z * (Re (u * Re z) + Re (:-: i :*: u * Im z)) = 0.
  rewrite minus_CSNo_CRe (i :*: u * Im z) LiuImz.
  rewrite minus_CSNo_CIm (i :*: u * Im z) LiuImz.
  prove (Im (u * Re z) + - Im (i :*: u * Im z)) * Re z
      + Im z * (Re (u * Re z) + - Re (i :*: u * Im z)) = 0.
  rewrite SNo_Re (u * Re z) LuRez.
  rewrite SNo_Im (u * Re z) LuRez.
  prove (0 + - Im (i :*: u * Im z)) * Re z
      + Im z * ((u * Re z) + - Re (i :*: u * Im z)) = 0.
  rewrite mul_CSNo_CRe i (u * Im z) CSNo_Complex_i LuImz'.
  prove (0 + - Im (i :*: u * Im z)) * Re z
      + Im z * ((u * Re z) + - (Re i * Re (u * Im z) + - Im (u * Im z) * Im i)) = 0.
  rewrite mul_CSNo_CIm i (u * Im z) CSNo_Complex_i LuImz'.
  prove (0 + - (Im (u * Im z) * Re i + Im i * Re (u * Im z))) * Re z
      + Im z * ((u * Re z) + - (Re i * Re (u * Im z) + - Im (u * Im z) * Im i)) = 0.
  rewrite Re_i. rewrite Im_i.
  prove (0 + - (Im (u * Im z) * 0 + 1 * Re (u * Im z))) * Re z
      + Im z * ((u * Re z) + - (0 * Re (u * Im z) + - Im (u * Im z) * 1)) = 0.
  rewrite SNo_Re (u * Im z) LuImz.
  rewrite SNo_Im (u * Im z) LuImz.
  prove (0 + - (0 * 0 + 1 * (u * Im z))) * Re z
      + Im z * ((u * Re z) + - (0 * (u * Im z) + - 0 * 1)) = 0.
  rewrite mul_SNo_zeroL 0 SNo_0.
  rewrite mul_SNo_zeroL (u * Im z) ??.
  rewrite mul_SNo_zeroL 1 SNo_1.
  rewrite mul_SNo_oneL (u * Im z) ??.
  prove (0 + - (0 + u * Im z)) * Re z
      + Im z * ((u * Re z) + - (0 + - 0)) = 0.
  rewrite minus_SNo_0.
  rewrite add_SNo_0L 0 SNo_0.
  rewrite minus_SNo_0.
  rewrite add_SNo_0R (u * Re z) ??.
  rewrite add_SNo_0L (u * Im z) ??.
  prove (0 + - (u * Im z)) * Re z
      + Im z * (u * Re z) = 0.
  rewrite add_SNo_0L (- (u * Im z)) (SNo_minus_SNo (u * Im z) ??).
  prove (- (u * Im z)) * Re z
      + Im z * (u * Re z) = 0.
  rewrite mul_SNo_minus_distrL (u * Im z) (Re z) ?? ??.
  prove - (u * Im z) * Re z + Im z * u * Re z = 0.
  rewrite <- mul_SNo_assoc u (Im z) (Re z) ?? ?? ??.
  rewrite mul_SNo_com (Im z) (Re z) ?? ??.
  rewrite mul_SNo_com_3_0_1 (Im z) u (Re z) ?? ?? ??.
  prove - u * Re z * Im z + u * Im z * Re z = 0.
  rewrite mul_SNo_com (Re z) (Im z) ?? ??.
  prove - u * Im z * Re z + u * Im z * Re z = 0.
  exact add_SNo_minus_SNo_linv (u * Im z * Re z) (SNo_mul_SNo_3 u (Im z) (Re z) ?? ?? ??).
Qed.

Theorem recip_CSNo_invR : forall z, CSNo z -> z <> 0 -> z :*: recip_CSNo z = 1.
let z. assume Hz Hznz.
set x := Re z.
set y := Im z.
set s := x ^ 2 + y ^ 2.
set u := recip_SNo s.
claim Lx: SNo x.
{ exact CSNo_ReR z Hz. }
claim Ly: SNo y.
{ exact CSNo_ImR z Hz. }
claim Ls: SNo s.
{ exact SNo_abs_sqr_CSNo z Hz. }
claim LsC: CSNo s.
{ exact SNo_CSNo s Ls. }
claim Lu: SNo u.
{ exact SNo_recip_SNo s Ls. }
claim LuC: CSNo u.
{ exact SNo_CSNo u Lu. }
claim LReuS: SNo (Re u).
{ exact CSNo_ReR u LuC. }
claim LImuS: SNo (Im u).
{ exact CSNo_ImR u LuC. }
claim Luy: CSNo (u :*: y).
{ apply CSNo_mul_CSNo.
  - exact LuC.
  - apply SNo_CSNo. exact Ly.
}
claim Lsnz: s <> 0.
{ assume H1: s = 0.
  apply Hznz.
  prove z = 0.
  exact abs_sqr_CSNo_zero z Hz H1.
}
claim L1: Re (i :*: u :*: y) = 0.
{ rewrite mul_CSNo_CRe i (u :*: y) CSNo_Complex_i ??.
  prove Re i * Re (u :*: y) + - (Im (u :*: y) * Im i) = 0.
  rewrite Re_i. rewrite Im_i.
  prove 0 * Re (u :*: y) + - (Im (u :*: y) * 1) = 0.
  rewrite mul_SNo_zeroL (Re (u :*: y)) (CSNo_ReR (u :*: y) (CSNo_mul_CSNo u y LuC (SNo_CSNo y Ly))).
  rewrite mul_SNo_oneR (Im (u :*: y)) (CSNo_ImR (u :*: y) (CSNo_mul_CSNo u y LuC (SNo_CSNo y Ly))).
  prove 0 + - Im (u :*: y) = 0.
  rewrite mul_CSNo_CIm u y 
                       LuC (SNo_CSNo y Ly).
  prove 0 + - (Im y * Re u + Im u * Re y) = 0.
  rewrite SNo_Im y Ly.
  rewrite SNo_Im u Lu.
  prove 0 + - (0 * Re u + 0 * Re y) = 0.
  rewrite mul_SNo_zeroL (Re u) LReuS.
  rewrite mul_SNo_zeroL (Re y) (CSNo_ReR y (SNo_CSNo y Ly)).
  prove 0 + - (0 + 0) = 0.
  rewrite add_SNo_0L 0 SNo_0.
  rewrite minus_SNo_0.
  exact add_SNo_0L 0 SNo_0.
}
claim L2: Im (i :*: u :*: y) = u * y.
{ rewrite mul_CSNo_CIm i (u :*: y) CSNo_Complex_i ??.
  prove Im (u :*: y) * Re i + Im i * Re (u :*: y) = u * y.
  rewrite Re_i. rewrite Im_i.
  prove Im (u :*: y) * 0 + 1 * Re (u :*: y) = u * y.
  rewrite mul_SNo_zeroR (Im (u :*: y)) (CSNo_ImR (u :*: y) (CSNo_mul_CSNo u y LuC (SNo_CSNo y Ly))).
  rewrite mul_SNo_oneL (Re (u :*: y)) (CSNo_ReR (u :*: y) (CSNo_mul_CSNo u y LuC (SNo_CSNo y Ly))).
  prove 0 + Re (u :*: y) = u * y.
  rewrite mul_CSNo_mul_SNo u y Lu Ly.
  rewrite SNo_Re (u * y) (SNo_mul_SNo u y ?? ??).
  prove 0 + u * y = u * y.
  exact add_SNo_0L (u * y) (SNo_mul_SNo u y ?? ??).
}
prove z :*: pa (x :/: s) (- (y :/: s)) = 1.
transitivity (z :*: (u :*: x :+: :-: i :*: u :*: y)).
- prove z :*: pa (x :/: s) (- (y :/: s)) = z :*: (u :*: x :+: :-: i :*: u :*: y).
  f_equal.
  prove pa (x :/: s) (- (y :/: s)) = u :*: x :+: :-: i :*: u :*: y.
  apply CSNo_ReIm_split (pa (x :/: s) (- (y :/: s))) (u :*: x :+: :-: i :*: u :*: y).
  + prove CSNo (pa (x :/: s) (- (y :/: s))).
    apply CSNo_I.
    * prove SNo (x :/: s). exact SNo_div_SNo x s ?? ??.
    * apply SNo_minus_SNo.
      prove SNo (y :/: s). exact SNo_div_SNo y s ?? ??.
  + prove CSNo (u :*: x :+: :-: i :*: u :*: y).
    apply CSNo_add_CSNo.
    * exact CSNo_mul_CSNo u x LuC (SNo_CSNo x Lx).
    * { apply CSNo_minus_CSNo. apply CSNo_mul_CSNo.
        - exact CSNo_Complex_i.
        - exact CSNo_mul_CSNo u y LuC (SNo_CSNo y Ly).
      }
  + prove Re (pa (x :/: s) (- (y :/: s))) = Re (u :*: x :+: :-: i :*: u :*: y).
    rewrite CSNo_Re2 (x :/: s) (- (y :/: s))
                     (SNo_div_SNo x s Lx Ls)
                     (SNo_minus_SNo (y :/: s)
                       (SNo_div_SNo y s Ly Ls)).
    prove x :/: s = Re (u :*: x :+: :-: i :*: u :*: y).
    rewrite add_CSNo_CRe (u :*: x) (:-: i :*: u :*: y)
                         (CSNo_mul_CSNo u x LuC (SNo_CSNo x Lx))
                         (CSNo_minus_CSNo (i :*: u :*: y)
                           (CSNo_mul_CSNo i (u :*: y)
                                          CSNo_Complex_i
                                          (CSNo_mul_CSNo u y LuC (SNo_CSNo y Ly)))).
    prove x :/: s = Re (u :*: x) + Re (:-: i :*: u :*: y).
    rewrite mul_CSNo_mul_SNo u x Lu Lx.
    prove x :/: s = Re (u * x) + Re (:-: i :*: u :*: y).
    rewrite SNo_Re (u * x) (SNo_mul_SNo u x ?? ??).
    prove x :/: s = u * x + Re (:-: i :*: u :*: y).
    rewrite minus_CSNo_CRe (i :*: u :*: y)
                           (CSNo_mul_CSNo i (u :*: y)
                                          CSNo_Complex_i
                                          (CSNo_mul_CSNo u y LuC (SNo_CSNo y Ly))).
    prove x :/: s = u * x + - Re (i :*: u :*: y).
    rewrite L1.
    prove x :/: s = u * x + - 0.
    rewrite minus_SNo_0.
    prove x :/: s = u * x + 0.
    rewrite add_SNo_0R (u * x) (SNo_mul_SNo u x ?? ??).
    prove x * u = u * x.
    exact mul_SNo_com x u ?? ??.
  + prove Im (pa (x :/: s) (- (y :/: s))) = Im (u :*: x :+: :-: i :*: u :*: y).
    rewrite CSNo_Im2 (x :/: s) (- (y :/: s))
                     (SNo_div_SNo x s Lx Ls)
                     (SNo_minus_SNo (y :/: s)
                       (SNo_div_SNo y s Ly Ls)).
    rewrite add_CSNo_CIm (u :*: x) (:-: i :*: u :*: y)
                         (CSNo_mul_CSNo u x LuC (SNo_CSNo x Lx))
                         (CSNo_minus_CSNo (i :*: u :*: y)
                           (CSNo_mul_CSNo i (u :*: y)
                                          CSNo_Complex_i
                                          (CSNo_mul_CSNo u y LuC (SNo_CSNo y Ly)))).
    prove - (y :/: s) = Im (u :*: x) + Im (:-: i :*: u :*: y).
    rewrite minus_CSNo_CIm (i :*: u :*: y)
                           (CSNo_mul_CSNo i (u :*: y)
                                          CSNo_Complex_i
                                          (CSNo_mul_CSNo u y LuC (SNo_CSNo y Ly))).
    prove - (y :/: s) = Im (u :*: x) + - Im (i :*: u :*: y).
    rewrite mul_CSNo_mul_SNo u x Lu Lx.
    rewrite SNo_Im (u * x) (SNo_mul_SNo u x ?? ??).
    prove - (y :/: s) = 0 + - Im (i :*: u :*: y).
    rewrite L2.
    prove - (y :/: s) = 0 + - (u * y).
    prove - (y * u) = 0 + - (u * y).
    rewrite add_SNo_0L (- u * y) (SNo_minus_SNo (u * y) (SNo_mul_SNo u y ?? ??)).
    f_equal.
    exact mul_SNo_com y u ?? ??.
- prove z :*: (u :*: x :+: :-: i :*: u :*: y) = 1.
  apply CSNo_relative_recip z Hz u Lu.
  prove (x ^ 2 + y ^ 2) * u = 1.
  prove s * u = 1.
  exact recip_SNo_invR s Ls Lsnz.
Qed.

Theorem recip_CSNo_invL : forall z, CSNo z -> z <> 0 -> recip_CSNo z :*: z = 1.
let z. assume Hz Hznz.
rewrite mul_CSNo_com (recip_CSNo z) z (CSNo_recip_CSNo z Hz) Hz.
exact recip_CSNo_invR z Hz Hznz.
Qed.

Theorem CSNo_div_CSNo: forall z w, CSNo z -> CSNo w -> CSNo (div_CSNo z w).
let z w. assume Hz Hw.
exact CSNo_mul_CSNo z (recip_CSNo w) Hz (CSNo_recip_CSNo w Hw).
Qed.

Theorem mul_div_CSNo_invL: forall z w, CSNo z -> CSNo w -> w <> 0 -> (div_CSNo z w) :*: w = z.
let z w. assume Hz Hw Hw0.
prove (z :*: recip_CSNo w) :*: w = z.
rewrite <- mul_CSNo_assoc z (recip_CSNo w) w Hz (CSNo_recip_CSNo w Hw) Hw.
prove z :*: (recip_CSNo w :*: w) = z.
rewrite recip_CSNo_invL w Hw Hw0.
prove z :*: 1 = z.
exact mul_CSNo_1R z Hz.
Qed.

Theorem mul_div_CSNo_invR: forall z w, CSNo z -> CSNo w -> w <> 0 -> w :*: (div_CSNo z w) = z.
let z w. assume Hz Hw Hw0.
rewrite mul_CSNo_com w (div_CSNo z w) Hw (CSNo_div_CSNo z w Hz Hw).
exact mul_div_CSNo_invL z w Hz Hw Hw0.
Qed.

Theorem sqrt_SNo_nonneg_sqr_id: forall x, SNo x -> 0 <= x -> sqrt_SNo_nonneg (x ^ 2) = x.
let x. assume Hx Hxnn.
claim Lx2S: SNo (x ^ 2).
{ exact SNo_exp_SNo_nat x Hx 2 nat_2. }
claim Lx2nn: 0 <= x ^ 2.
{ rewrite exp_SNo_nat_2 x Hx. exact SNo_sqr_nonneg x Hx. }
claim Lsx2S: SNo (sqrt_SNo_nonneg (x ^ 2)).
{ exact SNo_sqrt_SNo_nonneg (x ^ 2) ?? ??. }
claim Lsx2nn: 0 <= sqrt_SNo_nonneg (x ^ 2).
{ exact sqrt_SNo_nonneg_nonneg (x ^ 2) ?? ??. }
claim Lsx22xx: sqrt_SNo_nonneg (x ^ 2) * sqrt_SNo_nonneg (x ^ 2) = x * x.
{ rewrite <- exp_SNo_nat_2 x Hx.
  exact sqrt_SNo_nonneg_sqr (x ^ 2) ?? ??.
}
apply SNoLeE 0 x SNo_0 Hx Hxnn.
- assume H1: 0 < x.
  claim L1: 0 < sqrt_SNo_nonneg (x ^ 2).
  { apply SNoLeE 0 (sqrt_SNo_nonneg (x ^ 2)) SNo_0 ?? ??.
    - assume H2: 0 < sqrt_SNo_nonneg (x ^ 2). exact H2.
    - assume H2: 0 = sqrt_SNo_nonneg (x ^ 2). prove False.
      apply SNoLt_irref 0.
      rewrite <- mul_SNo_zeroR 0 SNo_0 at 2.
      prove 0 < 0 * 0.
      rewrite H2 at 2 3. rewrite Lsx22xx.
      prove 0 < x * x.
      exact mul_SNo_pos_pos x x ?? ?? ?? ??.
  }
  apply SNoLt_trichotomy_or_impred (sqrt_SNo_nonneg (x ^ 2)) x Lsx2S Hx.
  + assume H2: sqrt_SNo_nonneg (x ^ 2) < x. prove False.
    apply SNoLt_irref (x * x).
    prove x * x < x * x.
    rewrite <- Lsx22xx at 1.
    prove sqrt_SNo_nonneg (x ^ 2) * sqrt_SNo_nonneg (x ^ 2) < x * x.
    exact pos_mul_SNo_Lt2 (sqrt_SNo_nonneg (x ^ 2)) (sqrt_SNo_nonneg (x ^ 2)) x x
                          ?? ?? ?? ?? L1 L1 H2 H2.
  + assume H2: sqrt_SNo_nonneg (x ^ 2) = x. exact H2.
  + assume H2: x < sqrt_SNo_nonneg (x ^ 2). prove False.
    apply SNoLt_irref (x * x).
    prove x * x < x * x.
    rewrite <- Lsx22xx at 2.
    prove x * x < sqrt_SNo_nonneg (x ^ 2) * sqrt_SNo_nonneg (x ^ 2).
    exact pos_mul_SNo_Lt2 x x (sqrt_SNo_nonneg (x ^ 2)) (sqrt_SNo_nonneg (x ^ 2))
                          ?? ?? ?? ?? H1 H1 H2 H2.
- assume H1: 0 = x.
  rewrite exp_SNo_nat_2 x Hx.
  rewrite <- H1.
  prove sqrt_SNo_nonneg (0 * 0) = 0.
  rewrite mul_SNo_zeroL 0 SNo_0.
  prove sqrt_SNo_nonneg 0 = 0.
  exact sqrt_SNo_nonneg_0.
Qed.

Theorem sqrt_SNo_nonneg_mon_strict: forall x y, SNo x -> SNo y -> 0 <= x -> x < y -> sqrt_SNo_nonneg x < sqrt_SNo_nonneg y.
let x y. assume Hx Hy Hxnn Hxy.
claim LsxS: SNo (sqrt_SNo_nonneg x).
{ exact SNo_sqrt_SNo_nonneg x ?? ??. }
claim Lsxnn: 0 <= sqrt_SNo_nonneg x.
{ exact sqrt_SNo_nonneg_nonneg x ?? ??. }
claim Lynn: 0 <= y.
{ apply SNoLe_tra 0 x y SNo_0 ?? ?? ??. prove x <= y. apply SNoLtLe. exact Hxy. }
claim LsyS: SNo (sqrt_SNo_nonneg y).
{ exact SNo_sqrt_SNo_nonneg y ?? ??. }
claim Lsynn: 0 <= sqrt_SNo_nonneg y.
{ exact sqrt_SNo_nonneg_nonneg y ?? ??. }
apply SNoLtLe_or (sqrt_SNo_nonneg x) (sqrt_SNo_nonneg y) ?? ??.
- assume H2. exact H2.
- assume H2: sqrt_SNo_nonneg y <= sqrt_SNo_nonneg x. prove False.
  apply SNoLt_irref x.
  prove x < x.
  apply SNoLtLe_tra x y x Hx Hy Hx Hxy.
  prove y <= x.
  rewrite <- sqrt_SNo_nonneg_sqr y ?? ??.
  rewrite <- sqrt_SNo_nonneg_sqr x ?? ??.
  prove sqrt_SNo_nonneg y * sqrt_SNo_nonneg y <= sqrt_SNo_nonneg x * sqrt_SNo_nonneg x.
  apply nonneg_mul_SNo_Le2 (sqrt_SNo_nonneg y) (sqrt_SNo_nonneg y) (sqrt_SNo_nonneg x) (sqrt_SNo_nonneg x) ?? ?? ?? ?? ?? ?? ?? ??.
Qed.

Theorem sqrt_SNo_nonneg_mon: forall x y, SNo x -> SNo y -> 0 <= x -> x <= y -> sqrt_SNo_nonneg x <= sqrt_SNo_nonneg y.
let x y. assume Hx Hy Hxnn Hxy.
apply SNoLeE x y Hx Hy Hxy.
- assume H1: x < y.
  prove sqrt_SNo_nonneg x <= sqrt_SNo_nonneg y.
  apply SNoLtLe.
  prove sqrt_SNo_nonneg x < sqrt_SNo_nonneg y.
  exact sqrt_SNo_nonneg_mon_strict x y Hx Hy Hxnn H1.
- assume H1: x = y. rewrite H1. apply SNoLe_ref.
Qed.

Theorem sqrt_SNo_nonneg_mul_SNo: forall x y, SNo x -> SNo y -> 0 <= x -> 0 <= y -> sqrt_SNo_nonneg (x * y) = sqrt_SNo_nonneg x * sqrt_SNo_nonneg y.
let x y. assume Hx Hy Hxnn Hynn.
claim LsxS: SNo (sqrt_SNo_nonneg x).
{ exact SNo_sqrt_SNo_nonneg x ?? ??. }
claim Lsxnn: 0 <= sqrt_SNo_nonneg x.
{ exact sqrt_SNo_nonneg_nonneg x ?? ??. }
claim LsyS: SNo (sqrt_SNo_nonneg y).
{ exact SNo_sqrt_SNo_nonneg y ?? ??. }
claim Lsynn: 0 <= sqrt_SNo_nonneg y.
{ exact sqrt_SNo_nonneg_nonneg y ?? ??. }
claim LsxsyS: SNo (sqrt_SNo_nonneg x * sqrt_SNo_nonneg y).
{ apply SNo_mul_SNo.
  - exact ??.
  - exact ??.
}
claim L1: (sqrt_SNo_nonneg x * sqrt_SNo_nonneg y) ^ 2 = x * y.
{ rewrite exp_SNo_nat_2 (sqrt_SNo_nonneg x * sqrt_SNo_nonneg y) ??.
  prove (sqrt_SNo_nonneg x * sqrt_SNo_nonneg y)
      * (sqrt_SNo_nonneg x * sqrt_SNo_nonneg y)
      = x * y.
  rewrite mul_SNo_com_4_inner_mid (sqrt_SNo_nonneg x) (sqrt_SNo_nonneg y) (sqrt_SNo_nonneg x) (sqrt_SNo_nonneg y) ?? ?? ?? ??.
  f_equal.
  - exact sqrt_SNo_nonneg_sqr x ?? ??.
  - exact sqrt_SNo_nonneg_sqr y ?? ??.
}
rewrite <- L1.
apply sqrt_SNo_nonneg_sqr_id.
- prove SNo (sqrt_SNo_nonneg x * sqrt_SNo_nonneg y).
  exact LsxsyS.
- prove 0 <= sqrt_SNo_nonneg x * sqrt_SNo_nonneg y.
  apply mul_SNo_nonneg_nonneg.
  + exact ??.
  + exact ??.
  + exact ??.
  + exact ??.
Qed.

Definition modulus_CSNo: set -> set := fun z => sqrt_SNo_nonneg (abs_sqr_CSNo z).

Theorem SNo_modulus_CSNo: forall z, CSNo z -> SNo (modulus_CSNo z).
let z. assume Hz.
prove SNo (sqrt_SNo_nonneg (abs_sqr_CSNo z)).
apply SNo_sqrt_SNo_nonneg.
- exact SNo_abs_sqr_CSNo z Hz.
- exact abs_sqr_CSNo_nonneg z Hz.
Qed.

Theorem modulus_CSNo_nonneg: forall z, CSNo z -> 0 <= modulus_CSNo z.
let z. assume Hz.
prove 0 <= sqrt_SNo_nonneg (abs_sqr_CSNo z).
apply sqrt_SNo_nonneg_nonneg.
- exact SNo_abs_sqr_CSNo z Hz.
- exact abs_sqr_CSNo_nonneg z Hz.
Qed.

Definition sqrt_CSNo: set -> set := fun z =>
  if Im z < 0 \/ Im z = 0 /\ Re z < 0 then
    pa (sqrt_SNo_nonneg (eps_ 1 * (Re z + modulus_CSNo z)))
       (- sqrt_SNo_nonneg (eps_ 1 * (- Re z + modulus_CSNo z)))
  else
    pa (sqrt_SNo_nonneg (eps_ 1 * (Re z + modulus_CSNo z)))
       (sqrt_SNo_nonneg (eps_ 1 * (- Re z + modulus_CSNo z))).

Theorem sqrt_CSNo_sqrt: forall z, CSNo z -> sqrt_CSNo z :^: 2 = z.
let z. assume Hz.
set x := Re z.
set y := Im z.
set gamma := (sqrt_SNo_nonneg (eps_ 1 * (x + modulus_CSNo z))).
set delta := (sqrt_SNo_nonneg (eps_ 1 * (- x + modulus_CSNo z))).
prove (if y < 0 \/ y = 0 /\ x < 0 then pa gamma (- delta) else pa gamma delta) :^: 2 = z.
claim Lx: SNo x.
{ exact CSNo_ReR z Hz. }
claim Ly: SNo y.
{ exact CSNo_ImR z Hz. }
claim Lmx: SNo (- x).
{ apply SNo_minus_SNo. exact Lx. }
claim Lmy: SNo (- y).
{ apply SNo_minus_SNo. exact Ly. }
claim LmS: SNo (modulus_CSNo z).
{ exact SNo_modulus_CSNo z Hz. }
claim Lmnn: 0 <= modulus_CSNo z.
{ exact modulus_CSNo_nonneg z Hz. }
claim Lx2S: SNo (x ^ 2).
{ exact SNo_exp_SNo_nat x Lx 2 nat_2. }
claim Ly2S: SNo (y ^ 2).
{ exact SNo_exp_SNo_nat y Ly 2 nat_2. }
claim Lx2nn: 0 <= x ^ 2.
{ rewrite exp_SNo_nat_2 x Lx. exact SNo_sqr_nonneg x Lx. }
claim Ly2nn: 0 <= y ^ 2.
{ rewrite exp_SNo_nat_2 y Ly. exact SNo_sqr_nonneg y Ly. }
claim Lx2mx2: x ^ 2 = (- x) ^ 2.
{ rewrite exp_SNo_nat_2 x Lx.
  rewrite exp_SNo_nat_2 (- x) Lmx.
  prove x * x = (- x) * (- x).
  symmetry.
  exact mul_SNo_minus_minus x x Lx Lx.
}
claim LazS: SNo (abs_sqr_CSNo z).
{ exact SNo_abs_sqr_CSNo z Hz. }
claim Laznn: 0 <= abs_sqr_CSNo z.
{ exact abs_sqr_CSNo_nonneg z Hz. }
claim Lsx2S: SNo (sqrt_SNo_nonneg (x ^ 2)).
{ exact SNo_sqrt_SNo_nonneg (x ^ 2) ?? ??. }
claim Lsx2nn: 0 <= sqrt_SNo_nonneg (x ^ 2).
{ exact sqrt_SNo_nonneg_nonneg (x ^ 2) ?? ??. }
claim Lsy2S: SNo (sqrt_SNo_nonneg (y ^ 2)).
{ exact SNo_sqrt_SNo_nonneg (y ^ 2) ?? ??. }
claim Lmgtx: x <= modulus_CSNo z.
{ prove x <= sqrt_SNo_nonneg (x ^ 2 + y ^ 2).
  apply SNoLe_tra x (sqrt_SNo_nonneg (x ^ 2)) (sqrt_SNo_nonneg (x ^ 2 + y ^ 2))
                  Lx ?? ??.
  - prove x <= sqrt_SNo_nonneg (x ^ 2).
    apply SNoLtLe_or x 0 Lx SNo_0.
    + assume H1: x < 0.
      apply SNoLe_tra x 0 (sqrt_SNo_nonneg (x ^ 2)) Lx SNo_0 ??.
      * apply SNoLtLe. exact H1.
      * prove 0 <= sqrt_SNo_nonneg (x ^ 2). exact Lsx2nn.
    + assume H1: 0 <= x.
      rewrite sqrt_SNo_nonneg_sqr_id x Lx H1.
      apply SNoLe_ref.
  - prove sqrt_SNo_nonneg (x ^ 2) <= sqrt_SNo_nonneg (x ^ 2 + y ^ 2).
    apply sqrt_SNo_nonneg_mon.
    + exact ??.
    + exact ??.
    + exact ??.
    + prove x ^ 2 <= x ^ 2 + y ^ 2.
      rewrite <- add_SNo_0R (x ^ 2) ?? at 1.
      prove x ^ 2 + 0 <= x ^ 2 + y ^ 2.
      apply add_SNo_Le2.
      * exact ??.
      * exact SNo_0.
      * exact ??.
      * exact ??.
}
claim Lmgtnx: - x <= modulus_CSNo z.
{ prove - x <= sqrt_SNo_nonneg (x ^ 2 + y ^ 2).
  apply SNoLe_tra (- x) (sqrt_SNo_nonneg (x ^ 2)) (sqrt_SNo_nonneg (x ^ 2 + y ^ 2))
                  Lmx ?? ??.
  - prove - x <= sqrt_SNo_nonneg (x ^ 2).
    apply SNoLtLe_or (- x) 0 Lmx SNo_0.
    + assume H1: - x < 0.
      apply SNoLe_tra (- x) 0 (sqrt_SNo_nonneg (x ^ 2)) Lmx SNo_0 ??.
      * apply SNoLtLe. exact H1.
      * prove 0 <= sqrt_SNo_nonneg (x ^ 2). exact Lsx2nn.
    + assume H1: 0 <= - x.
      rewrite Lx2mx2.
      rewrite sqrt_SNo_nonneg_sqr_id (- x) Lmx H1.
      apply SNoLe_ref.
  - prove sqrt_SNo_nonneg (x ^ 2) <= sqrt_SNo_nonneg (x ^ 2 + y ^ 2).
    apply sqrt_SNo_nonneg_mon.
    + exact ??.
    + exact ??.
    + exact ??.
    + prove x ^ 2 <= x ^ 2 + y ^ 2.
      rewrite <- add_SNo_0R (x ^ 2) ?? at 1.
      prove x ^ 2 + 0 <= x ^ 2 + y ^ 2.
      apply add_SNo_Le2.
      * exact ??.
      * exact SNo_0.
      * exact ??.
      * exact ??.
}
claim LaS: SNo (x + modulus_CSNo z).
{ apply SNo_add_SNo.
  - exact ??.
  - exact ??.
}
claim LmaS: SNo (- x + modulus_CSNo z).
{ apply SNo_add_SNo.
  - exact ??.
  - exact ??.
}
claim LmmS: SNo (- modulus_CSNo z).
{ apply SNo_minus_SNo. exact ??. }
claim LammS: SNo (x + - modulus_CSNo z).
{ apply SNo_add_SNo.
  - exact ??.
  - exact ??.
}
claim Le1S: SNo (eps_ 1).
{ exact SNo_eps_ 1 (nat_p_omega 1 nat_1). }
claim Le1nn: 0 <= eps_ 1.
{ apply SNoLtLe. exact SNo_eps_pos 1 (nat_p_omega 1 nat_1). }
claim Le12S: SNo (eps_ 1 ^ 2).
{ apply SNo_exp_SNo_nat.
  - exact ??.
  - exact nat_2.
}
claim Le12nn: 0 <= eps_ 1 ^ 2.
{ rewrite exp_SNo_nat_2 (eps_ 1) ??.
  apply mul_SNo_nonneg_nonneg.
  - exact ??.
  - exact ??.
  - exact ??.
  - exact ??.
}
claim Le1aS: SNo (eps_ 1 * (x + modulus_CSNo z)).
{ apply SNo_mul_SNo.
  - exact ??.
  - exact ??.
}
claim Lann: 0 <= x + modulus_CSNo z.
{ rewrite add_SNo_com x (modulus_CSNo z) ?? ??.
  prove 0 <= modulus_CSNo z + x.
  rewrite <- minus_SNo_invol x Lx.
  prove 0 <= modulus_CSNo z + - - x.
  apply add_SNo_minus_Le2b (modulus_CSNo z) (- x) 0 ?? Lmx SNo_0.
  prove 0 + - x <= modulus_CSNo z.
  rewrite add_SNo_0L (- x) Lmx.
  prove - x <= modulus_CSNo z.
  exact Lmgtnx.
}
claim Le1ann: 0 <= eps_ 1 * (x + modulus_CSNo z).
{ apply mul_SNo_nonneg_nonneg (eps_ 1) (x + modulus_CSNo z).
  - exact ??.
  - exact ??.
  - exact ??.
  - exact ??.
}
claim Le1maS: SNo (eps_ 1 * (- x + modulus_CSNo z)).
{ apply SNo_mul_SNo.
  - exact ??.
  - exact ??.
}
claim Lmann: 0 <= - x + modulus_CSNo z.
{ rewrite add_SNo_com (- x) (modulus_CSNo z) ?? ??.
  prove 0 <= modulus_CSNo z + - x.
  apply add_SNo_minus_Le2b (modulus_CSNo z) x 0 ?? Lx SNo_0.
  prove 0 + x <= modulus_CSNo z.
  rewrite add_SNo_0L x Lx.
  prove x <= modulus_CSNo z.
  exact Lmgtx.
}
claim Le1mann: 0 <= eps_ 1 * (- x + modulus_CSNo z).
{ apply mul_SNo_nonneg_nonneg (eps_ 1) (- x + modulus_CSNo z).
  - exact ??.
  - exact ??.
  - exact ??.
  - exact ??.
}
claim LmxmzxmzS: SNo ((- x + modulus_CSNo z) * (x + modulus_CSNo z)).
{ apply SNo_mul_SNo.
  - exact ??.
  - exact ??.
}
claim Lmxmzxmznn: 0 <= (- x + modulus_CSNo z) * (x + modulus_CSNo z).
{ apply mul_SNo_nonneg_nonneg.
  - exact ??.
  - exact ??.
  - exact ??.
  - exact ??.
}
claim LgammaS: SNo gamma.
{ apply SNo_sqrt_SNo_nonneg.
  - exact ??.
  - exact ??.
}
claim Lgammann: 0 <= gamma.
{ apply sqrt_SNo_nonneg_nonneg.
  - exact ??.
  - exact ??.
}
claim LdeltaS: SNo delta.
{ apply SNo_sqrt_SNo_nonneg.
  - exact ??.
  - exact ??.
}
claim Ldeltann: 0 <= delta.
{ apply sqrt_SNo_nonneg_nonneg.
  - exact ??.
  - exact ??.
}
claim LmdeltaS: SNo (- delta).
{ apply SNo_minus_SNo. exact ??. }
claim LdeltagammaS: SNo (delta * gamma).
{ apply SNo_mul_SNo.
  - exact ??.
  - exact ??.
}
claim Lpa1: CSNo (pa gamma (- delta)).
{ apply CSNo_I.
  - exact ??.
  - exact ??.
}
claim Lpa2: CSNo (pa gamma delta).
{ apply CSNo_I.
  - exact ??.
  - exact ??.
}
claim Lpa1s: CSNo (pa gamma (- delta) :^: 2).
{ apply CSNo_exp_CSNo_nat.
  - exact ??.
  - exact nat_2.
}
claim Lpa2s: CSNo (pa gamma delta :^: 2).
{ apply CSNo_exp_CSNo_nat.
  - exact ??.
  - exact nat_2.
}
claim Lgamma2eq: gamma * gamma = eps_ 1 * (x + modulus_CSNo z).
{ exact sqrt_SNo_nonneg_sqr (eps_ 1 * (x + modulus_CSNo z)) ?? ??. }
claim Ldelta2eq: delta * delta = eps_ 1 * (- x + modulus_CSNo z).
{ exact sqrt_SNo_nonneg_sqr (eps_ 1 * (- x + modulus_CSNo z)) ?? ??. }
claim Ldeltagamma: delta * gamma = eps_ 1 * sqrt_SNo_nonneg (y ^ 2).
{ apply sqrt_SNo_nonneg_mul_SNo (eps_ 1 * (- x + modulus_CSNo z)) (eps_ 1 * (x + modulus_CSNo z)) ?? ?? ?? ?? (fun u _ => u = eps_ 1 * sqrt_SNo_nonneg (y ^ 2)).
  prove sqrt_SNo_nonneg ((eps_ 1 * (- x + modulus_CSNo z)) * (eps_ 1 * (x + modulus_CSNo z))) = eps_ 1 * sqrt_SNo_nonneg (y ^ 2).
  rewrite mul_SNo_com_4_inner_mid (eps_ 1) (- x + modulus_CSNo z) (eps_ 1) (x + modulus_CSNo z) ?? ?? ?? ??.
  prove sqrt_SNo_nonneg ((eps_ 1 * eps_ 1) * ((- x + modulus_CSNo z) * (x + modulus_CSNo z))) = eps_ 1 * sqrt_SNo_nonneg (y ^ 2).
  rewrite <- exp_SNo_nat_2 (eps_ 1) ??.
  apply sqrt_SNo_nonneg_mul_SNo (eps_ 1 ^ 2) ((- x + modulus_CSNo z) * (x + modulus_CSNo z)) ?? ?? ?? ?? (fun _ v => v = eps_ 1 * sqrt_SNo_nonneg (y ^ 2)).
  prove sqrt_SNo_nonneg (eps_ 1 ^ 2) * sqrt_SNo_nonneg ((- x + modulus_CSNo z) * (x + modulus_CSNo z)) = eps_ 1 * sqrt_SNo_nonneg (y ^ 2).
  rewrite sqrt_SNo_nonneg_sqr_id (eps_ 1) ?? ??.
  prove (eps_ 1) * sqrt_SNo_nonneg ((- x + modulus_CSNo z) * (x + modulus_CSNo z)) = eps_ 1 * sqrt_SNo_nonneg (y ^ 2).
  f_equal. f_equal.
  prove (- x + modulus_CSNo z) * (x + modulus_CSNo z) = y ^ 2.
  rewrite SNo_foil (- x) (modulus_CSNo z) x (modulus_CSNo z) ?? ?? ?? ??.
  prove (- x) * x + (- x) * modulus_CSNo z + modulus_CSNo z * x + modulus_CSNo z * modulus_CSNo z = y ^ 2.
  rewrite mul_SNo_minus_distrL x (modulus_CSNo z) ?? ??.
  rewrite mul_SNo_com (modulus_CSNo z) x ?? ??.
  rewrite add_SNo_minus_L2 (x * modulus_CSNo z) (modulus_CSNo z * modulus_CSNo z)
                           (SNo_mul_SNo x (modulus_CSNo z) ?? ??)
                           (SNo_mul_SNo (modulus_CSNo z) (modulus_CSNo z) ?? ??).
  prove (- x) * x + modulus_CSNo z * modulus_CSNo z = y ^ 2.
  prove (- x) * x + sqrt_SNo_nonneg (abs_sqr_CSNo z) * sqrt_SNo_nonneg (abs_sqr_CSNo z) = y ^ 2.
  rewrite sqrt_SNo_nonneg_sqr (abs_sqr_CSNo z) ?? ??.
  prove (- x) * x + x ^ 2 + y ^ 2 = y ^ 2.
  apply mul_SNo_minus_distrL x x ?? ?? (fun _ v => v + x ^ 2 + y ^ 2 = y ^ 2).
  rewrite <- exp_SNo_nat_2 x ??.
  prove - x ^ 2 + x ^ 2 + y ^ 2 = y ^ 2.
  exact add_SNo_minus_L2 (x ^ 2) (y ^ 2) ?? ??.
}
claim Lgamma2mdelta2: gamma * gamma + - (delta * delta) = x.
{ rewrite Lgamma2eq. rewrite Ldelta2eq.
  prove eps_ 1 * (x + modulus_CSNo z) + - eps_ 1 * (- x + modulus_CSNo z) = x.
  rewrite <- mul_SNo_minus_distrR (eps_ 1) (- x + modulus_CSNo z) ?? ??.
  prove eps_ 1 * (x + modulus_CSNo z) + eps_ 1 * (- (- x + modulus_CSNo z)) = x.
  rewrite minus_add_SNo_distr (- x) (modulus_CSNo z) ?? ??.
  rewrite minus_SNo_invol x ??.
  prove eps_ 1 * (x + modulus_CSNo z) + eps_ 1 * (x + - modulus_CSNo z) = x.
  rewrite <- mul_SNo_distrL (eps_ 1) (x + modulus_CSNo z) (x + - modulus_CSNo z)
                            ?? ?? ??.
  prove eps_ 1 * ((x + modulus_CSNo z) + (x + - modulus_CSNo z)) = x.
  rewrite add_SNo_com_4_inner_mid x (modulus_CSNo z) x (- modulus_CSNo z) ?? ?? ?? ??.
  prove eps_ 1 * ((x + x) + (modulus_CSNo z + - modulus_CSNo z)) = x.
  rewrite add_SNo_minus_SNo_rinv (modulus_CSNo z) ??.
  prove eps_ 1 * ((x + x) + 0) = x.
  rewrite add_SNo_0R (x + x) (SNo_add_SNo x x ?? ??).
  prove eps_ 1 * (x + x) = x.
  rewrite mul_SNo_distrL (eps_ 1) x x ?? ?? ??.
  prove eps_ 1 * x + eps_ 1 * x = x.
  rewrite <- mul_SNo_distrR (eps_ 1) (eps_ 1) x ?? ?? ??.
  prove (eps_ 1 + eps_ 1) * x = x.
  rewrite eps_1_half_eq1.
  exact mul_SNo_oneL x ??.
}
apply SNoLt_trichotomy_or_impred y 0 Ly SNo_0.
- assume H1: y < 0.
  claim Lcase1cond: y < 0 \/ y = 0 /\ x < 0.
  { apply orIL. exact H1. }
  rewrite If_i_1 (y < 0 \/ y = 0 /\ x < 0) (pa gamma (- delta)) (pa gamma delta) Lcase1cond.
  prove pa gamma (- delta) :^: 2 = z.
  apply CSNo_ReIm_split (pa gamma (- delta) :^: 2) z ?? Hz.
  + rewrite exp_CSNo_nat_2 (pa gamma (- delta)) ??.
    prove Re (pa gamma (- delta) :*: pa gamma (- delta)) = x.
    rewrite mul_CSNo_CRe (pa gamma (- delta)) (pa gamma (- delta)) ?? ??.
    rewrite CSNo_Re2 gamma (- delta) ?? ??.
    rewrite CSNo_Im2 gamma (- delta) ?? ??.
    prove gamma * gamma + - ((- delta) * (- delta)) = x.
    rewrite mul_SNo_minus_minus delta delta ?? ??.
    prove gamma * gamma + - (delta * delta) = x.
    exact Lgamma2mdelta2.
  + rewrite exp_CSNo_nat_2 (pa gamma (- delta)) ??.
    prove Im (pa gamma (- delta) :*: pa gamma (- delta)) = y.
    rewrite mul_CSNo_CIm (pa gamma (- delta)) (pa gamma (- delta)) ?? ??.
    rewrite CSNo_Re2 gamma (- delta) ?? ??.
    rewrite CSNo_Im2 gamma (- delta) ?? ??.
    prove (- delta) * gamma + (- delta) * gamma = y.
    rewrite mul_SNo_minus_distrL delta gamma ?? ??.
    prove - delta * gamma + - delta * gamma = y.
    rewrite <- minus_add_SNo_distr (delta * gamma) (delta * gamma) ?? ??.
    prove - (delta * gamma + delta * gamma) = y.
    rewrite Ldeltagamma.
    prove - (eps_ 1 * sqrt_SNo_nonneg (y ^ 2) + eps_ 1 * sqrt_SNo_nonneg (y ^ 2)) = y.
    rewrite <- mul_SNo_distrR (eps_ 1) (eps_ 1) (sqrt_SNo_nonneg (y ^ 2)) ?? ?? ??.
    rewrite eps_1_half_eq1.
    rewrite mul_SNo_oneL (sqrt_SNo_nonneg (y ^ 2)) ??.
    prove - sqrt_SNo_nonneg (y ^ 2) = y.
    rewrite exp_SNo_nat_2 y ??.
    prove - sqrt_SNo_nonneg (y * y) = y.
    rewrite <- mul_SNo_minus_minus y y ?? ??.
    prove - sqrt_SNo_nonneg ((- y) * (- y)) = y.
    rewrite <- exp_SNo_nat_2 (- y) ??.
    prove - sqrt_SNo_nonneg ((- y) ^ 2) = y.
    claim L1: 0 <= - y.
    { apply SNoLtLe.
      prove 0 < - y.
      apply minus_SNo_Lt_contra2 y 0 ?? SNo_0.
      prove y < - 0.
      rewrite minus_SNo_0.
      exact H1.
    }
    rewrite sqrt_SNo_nonneg_sqr_id (- y) ?? ??.
    exact minus_SNo_invol y ??.
- assume H1: y = 0.
  apply SNoLtLe_or x 0 Lx SNo_0.
  + assume H2: x < 0.
    claim Lcase1cond: y < 0 \/ y = 0 /\ x < 0.
    { apply orIR. apply andI.
      - exact H1.
      - exact H2.
    }
    rewrite If_i_1 (y < 0 \/ y = 0 /\ x < 0) (pa gamma (- delta)) (pa gamma delta) Lcase1cond.
    prove pa gamma (- delta) :^: 2 = z.
    apply CSNo_ReIm_split (pa gamma (- delta) :^: 2) z ?? Hz.
    * rewrite exp_CSNo_nat_2 (pa gamma (- delta)) ??.
      prove Re (pa gamma (- delta) :*: pa gamma (- delta)) = x.
      rewrite mul_CSNo_CRe (pa gamma (- delta)) (pa gamma (- delta)) ?? ??.
      rewrite CSNo_Re2 gamma (- delta) ?? ??.
      rewrite CSNo_Im2 gamma (- delta) ?? ??.
      prove gamma * gamma + - ((- delta) * (- delta)) = x.
      rewrite mul_SNo_minus_minus delta delta ?? ??.
      prove gamma * gamma + - (delta * delta) = x.
      exact Lgamma2mdelta2.
    * rewrite exp_CSNo_nat_2 (pa gamma (- delta)) ??.
      prove Im (pa gamma (- delta) :*: pa gamma (- delta)) = y.
      rewrite mul_CSNo_CIm (pa gamma (- delta)) (pa gamma (- delta)) ?? ??.
      rewrite CSNo_Re2 gamma (- delta) ?? ??.
      rewrite CSNo_Im2 gamma (- delta) ?? ??.
      prove (- delta) * gamma + (- delta) * gamma = y.
      rewrite mul_SNo_minus_distrL delta gamma ?? ??.
      prove - delta * gamma + - delta * gamma = y.
      rewrite Ldeltagamma.
      prove - eps_ 1 * sqrt_SNo_nonneg (y ^ 2) + - eps_ 1 * sqrt_SNo_nonneg (y ^ 2) = y.
      rewrite exp_SNo_nat_2 y ??.
      rewrite H1.
      prove - eps_ 1 * sqrt_SNo_nonneg (0 * 0) + - eps_ 1 * sqrt_SNo_nonneg (0 * 0) = 0.
      rewrite mul_SNo_zeroL 0 SNo_0. rewrite sqrt_SNo_nonneg_0.
      prove - eps_ 1 * 0 + - eps_ 1 * 0 = 0.
      rewrite mul_SNo_zeroR (eps_ 1) ??.
      prove - 0 + - 0 = 0.
      rewrite minus_SNo_0.
      prove 0 + 0 = 0.
      exact add_SNo_0L 0 SNo_0.
  + assume H2: 0 <= x.
    claim Lcase2cond: ~(y < 0 \/ y = 0 /\ x < 0).
    { assume H. apply H.
      - assume H3: y < 0.
        apply SNoLt_irref y.
        prove y < y.
        rewrite H1 at 2. exact H3.
      - assume H. apply H.
        assume H3: y = 0.
        assume H4: x < 0.
        apply SNoLt_irref x.
        prove x < x.
        exact SNoLtLe_tra x 0 x ?? SNo_0 ?? H4 H2.
    }
    rewrite If_i_0 (y < 0 \/ y = 0 /\ x < 0) (pa gamma (- delta)) (pa gamma delta) Lcase2cond.
    prove pa gamma delta :^: 2 = z.
    apply CSNo_ReIm_split (pa gamma delta :^: 2) z ?? Hz.
    * rewrite exp_CSNo_nat_2 (pa gamma delta) ??.
      prove Re (pa gamma delta :*: pa gamma delta) = x.
      rewrite mul_CSNo_CRe (pa gamma delta) (pa gamma delta) ?? ??.
      rewrite CSNo_Re2 gamma delta ?? ??.
      rewrite CSNo_Im2 gamma delta ?? ??.
      prove gamma * gamma + - (delta * delta) = x.
      exact Lgamma2mdelta2.
    * rewrite exp_CSNo_nat_2 (pa gamma delta) ??.
      prove Im (pa gamma delta :*: pa gamma delta) = y.
      rewrite mul_CSNo_CIm (pa gamma delta) (pa gamma delta) ?? ??.
      rewrite CSNo_Re2 gamma delta ?? ??.
      rewrite CSNo_Im2 gamma delta ?? ??.
      prove delta * gamma + delta * gamma = y.
      rewrite Ldeltagamma.
      prove eps_ 1 * sqrt_SNo_nonneg (y ^ 2) + eps_ 1 * sqrt_SNo_nonneg (y ^ 2) = y.
      rewrite exp_SNo_nat_2 y ??.
      rewrite H1.
      prove eps_ 1 * sqrt_SNo_nonneg (0 * 0) + eps_ 1 * sqrt_SNo_nonneg (0 * 0) = 0.
      rewrite mul_SNo_zeroL 0 SNo_0. rewrite sqrt_SNo_nonneg_0.
      prove eps_ 1 * 0 + eps_ 1 * 0 = 0.
      rewrite mul_SNo_zeroR (eps_ 1) ??.
      prove 0 + 0 = 0.
      exact add_SNo_0L 0 SNo_0.
- assume H1: 0 < y.
  claim Lcase2cond: ~(y < 0 \/ y = 0 /\ x < 0).
  { assume H. apply H.
    - assume H2: y < 0.
      apply SNoLt_irref y.
      prove y < y.
      exact SNoLt_tra y 0 y ?? SNo_0 ?? H2 H1.
    - assume H. apply H.
      assume H2: y = 0.
      assume H3: x < 0.
      apply SNoLt_irref y.
      rewrite H2 at 1. exact H1.
  }
  rewrite If_i_0 (y < 0 \/ y = 0 /\ x < 0) (pa gamma (- delta)) (pa gamma delta) Lcase2cond.
  prove pa gamma delta :^: 2 = z.
  apply CSNo_ReIm_split (pa gamma delta :^: 2) z ?? Hz.
  + rewrite exp_CSNo_nat_2 (pa gamma delta) ??.
    prove Re (pa gamma delta :*: pa gamma delta) = x.
    rewrite mul_CSNo_CRe (pa gamma delta) (pa gamma delta) ?? ??.
    rewrite CSNo_Re2 gamma delta ?? ??.
    rewrite CSNo_Im2 gamma delta ?? ??.
    prove gamma * gamma + - (delta * delta) = x.
    exact Lgamma2mdelta2.
  + rewrite exp_CSNo_nat_2 (pa gamma delta) ??.
    prove Im (pa gamma delta :*: pa gamma delta) = y.
    rewrite mul_CSNo_CIm (pa gamma delta) (pa gamma delta) ?? ??.
    rewrite CSNo_Re2 gamma delta ?? ??.
    rewrite CSNo_Im2 gamma delta ?? ??.
    prove delta * gamma + delta * gamma = y.
    rewrite Ldeltagamma.
    prove eps_ 1 * sqrt_SNo_nonneg (y ^ 2) + eps_ 1 * sqrt_SNo_nonneg (y ^ 2) = y.
    rewrite <- mul_SNo_distrR (eps_ 1) (eps_ 1) (sqrt_SNo_nonneg (y ^ 2)) ?? ?? ??.
    rewrite eps_1_half_eq1.
    rewrite mul_SNo_oneL (sqrt_SNo_nonneg (y ^ 2)) ??.
    prove sqrt_SNo_nonneg (y ^ 2) = y.
    apply sqrt_SNo_nonneg_sqr_id y ??.
    prove 0 <= y.
    apply SNoLtLe. exact H1.
Qed.

End SurComplex.

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

Theorem complex_conj_CSNo : forall z :e complex, conj_CSNo z :e complex.
let z. assume Hz.
prove pa (Re z) (minus_SNo (Im z)) :e complex.
apply complex_I.
- exact complex_Re_real z Hz.
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
prove pa (add_SNo (mul_SNo (Re z) (Re w)) (minus_SNo (mul_SNo (Im w) (Im z))))
         (add_SNo (mul_SNo (Im w) (Re z)) (mul_SNo (Im z) (Re w)))
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
                  (minus_SNo (mul_SNo (Im x) (Im (pa 0 1)))))
         (add_SNo (mul_SNo (Im x) (Re (pa 0 1)))
                  (mul_SNo (Im (pa 0 1)) (Re x)))
    = pa 0 x.
rewrite real_Re_eq x Hx.
rewrite real_Im_eq x Hx.
rewrite complex_Re_eq 0 real_0 1 real_1.
rewrite complex_Im_eq 0 real_0 1 real_1.
prove pa (add_SNo (mul_SNo 0 x)
                  (minus_SNo (mul_SNo 0 1)))
         (add_SNo (mul_SNo 0 0)
                  (mul_SNo 1 x))
    = pa 0 x.
rewrite mul_SNo_zeroL x (real_SNo x Hx).
rewrite mul_SNo_zeroL 1 SNo_1.
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

Section ComplexDiv.

Prefix - 358 := minus_SNo.
Infix + 360 right := add_SNo.
Infix * 355 right := mul_SNo.
Infix :/: 353 := div_SNo.
Infix ^ 342 right := exp_SNo_nat.

Theorem complex_recip_CSNo: forall z :e complex, recip_CSNo z :e complex.
let z. assume Hz.
claim Lz: CSNo z.
{ exact complex_CSNo z Hz. }
apply complex_E z Hz.
let x. assume Hx. let y. assume Hy.
assume Hzxy: z = pa x y.
prove recip_CSNo z :e complex.
prove pa (Re z :/: (Re z ^ 2 + Im z ^ 2)) (- (Im z :/: (Re z ^ 2 + Im z ^ 2))) :e complex.
claim LRez: Re z :e real.
{ rewrite Hzxy. rewrite complex_Re_eq x Hx y Hy. exact Hx. }
claim LImz: Im z :e real.
{ rewrite Hzxy. rewrite complex_Im_eq x Hx y Hy. exact Hy. }
claim LRez2: Re z ^ 2 :e real.
{ rewrite exp_SNo_nat_2 (Re z) (CSNo_ReR z Lz).
  exact real_mul_SNo (Re z) ?? (Re z) ??.
}
claim LImz2: Im z ^ 2 :e real.
{ rewrite exp_SNo_nat_2 (Im z) (CSNo_ImR z Lz).
  exact real_mul_SNo (Im z) ?? (Im z) ??.
}
claim LRez2Imz2: Re z ^ 2 + Im z ^ 2 :e real.
{ apply real_add_SNo.
  - exact ??.
  - exact ??.
}
apply complex_I.
- prove Re z :/: (Re z ^ 2 + Im z ^ 2) :e real.
  apply real_div_SNo.
  + exact LRez.
  + exact LRez2Imz2.
- prove - (Im z :/: (Re z ^ 2 + Im z ^ 2)) :e real.
  apply real_minus_SNo. apply real_div_SNo.
  + exact LImz.
  + exact LRez2Imz2.
Qed.

Theorem complex_div_CSNo: forall z w :e complex, div_CSNo z w :e complex.
let z. assume Hz. let w. assume Hw.
exact complex_mul_CSNo z Hz (recip_CSNo w) (complex_recip_CSNo w Hw).
Qed.

End ComplexDiv.

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
