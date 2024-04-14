Section Eq.
Variable A:SType.
Definition eq : A->A->prop := fun x y:A => forall Q:A->A->prop, Q x y -> Q y x.
End Eq.
Infix = 502 := eq.
Section Ex.
Variable A:SType.
Definition ex : (A->prop)->prop := fun Q:A->prop => forall P:prop, (forall x:A, Q x -> P) -> P.
End Ex.
(* Unicode exists "2203" *)
Binder+ exists , := ex.
(* Parameter Eps_i "174b78e53fc239e8c2aab4ab5a996a27e3e5741e88070dad186e05fb13f275e5" *)
Parameter Eps_i : (set->prop)->set.
Parameter In:set->set->prop.
Parameter Empty : set.
(* Unicode Union "22C3" *)
Parameter Union : set->set.
(* Unicode Power "1D4AB" *)
Parameter Power : set->set.
Parameter Repl : set -> (set -> set) -> set.
Notation Repl Repl.
Parameter UnivOf : set->set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Theorem missingprop_9d4772fd4b216ecf12253c8eec9e056f806175e3263bd85e47fb49fa773e0c6f : (forall x0, forall x1 x2 : set -> set, forall x3 : set -> set -> prop, x3 (Repl (Repl x0 x1) x2) {x2 (x1 x4) | x4 :e x0} -> x3 {x2 (x1 x4) | x4 :e x0} (Repl (Repl x0 x1) x2)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Axiom In_0_2 : 0 :e 2.
Axiom In_1_2 : 1 :e 2.
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Theorem missingprop_8d334858d1804afd99b1b9082715c7f916daee31e697b66b5c752e0c8756ebae : (forall x0, atleastp u2 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x1)) -> x1)).
admit.
Qed.
Definition u3 : set :=
 ordsucc u2.
Definition u4 : set :=
 ordsucc u3.
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
Definition u7 : set :=
 ordsucc u6.
Definition u8 : set :=
 ordsucc u7.
Definition u9 : set :=
 ordsucc u8.
Definition u10 : set :=
 ordsucc u9.
Definition u11 : set :=
 ordsucc u10.
Definition u12 : set :=
 ordsucc u11.
Definition u13 : set :=
 ordsucc u12.
Definition u14 : set :=
 ordsucc u13.
Definition u15 : set :=
 ordsucc u14.
Definition u16 : set :=
 ordsucc u15.
Theorem missingprop_fdc6eb6c556a60be1db5dd605eb083c0fa21a3cbbdd1d343d7943c737ff1d1cb : (forall x0 : set -> set -> prop, forall x1 : set -> set, (forall x2, x2 :e u16 -> x1 x2 :e u16) -> (forall x2, x2 c= u16 -> Repl x2 x1 c= u16)).
admit.
Qed.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_0bd9ce2287118c060adf7175361415bef4e7cad7f5f9f95f7b36ab518f66982a : (forall x0 : set -> set -> prop, forall x1 : set -> set, (forall x2, x2 :e u16 -> (forall x3, x3 :e u16 -> x1 x2 = x1 x3 -> x2 = x3)) -> (forall x2, x2 c= u16 -> equip x2 (Repl x2 x1))).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Theorem missingprop_9a185e0022bc187582f3854decf30ec32e870a81a13895d95cbdf7259edc9aa9 : (forall x0 : set -> set -> prop, forall x1 : set -> set, (forall x2, x2 :e u16 -> (forall x3, x3 :e u16 -> x0 (x1 x2) (x1 x3) -> x0 x2 x3)) -> (forall x2, x2 c= u16 -> (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> not (x0 x3 x4))) -> (forall x3, x3 :e Repl x2 x1 -> (forall x4, x4 :e Repl x2 x1 -> not (x0 x3 x4))))).
admit.
Qed.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom missingprop_aac233feaa0aa18324c0d692b3f19bd8318b55545ab88208c741a1f8b442a053 : 12 :e 13.
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Axiom In_no3cycle : (forall x0 x1 x2, x0 :e x1 -> x1 :e x2 -> x2 :e x0 -> False).
Axiom missingprop_331badb0bc2cb72fdd31f16934f9ba3896484f4038f5056bfa218c35501c067b : 13 :e 14.
Axiom In_no4cycle : (forall x0 x1 x2 x3, x0 :e x1 -> x1 :e x2 -> x2 :e x3 -> x3 :e x0 -> False).
Axiom missingprop_6596ffb376d868a993d672d4e104aa09f5055d54e0d97b478501a938a69c460f : 14 :e 15.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom nat_16 : nat_p 16.
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Theorem missingprop_c18b6193e550b83006174e9a39facd53a8842bb45a3743eb46ab3a970c091d9d : (forall x0 : set -> set -> prop, forall x1 : set -> set, (forall x2, x2 :e u16 -> x1 x2 :e u16) -> (forall x2, x2 :e u16 -> (forall x3, x3 :e u16 -> x1 x2 = x1 x3 -> x2 = x3)) -> (forall x2, x2 :e u16 -> (forall x3, x3 :e u16 -> x0 (x1 x2) (x1 x3) -> x0 x2 x3)) -> (forall x2, x2 :e u16 -> x1 (x1 (x1 (x1 x2))) = x2) -> x1 u12 = u13 -> x1 u13 = u14 -> x1 u14 = u15 -> x1 u15 = u12 -> (forall x2, x2 c= u16 -> atleastp u6 x2 -> (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> not (x0 x3 x4))) -> atleastp u2 (setminus x2 u12) -> (forall x3 : prop, (forall x4, x4 c= u16 -> atleastp u6 x4 -> (forall x5, x5 :e x4 -> (forall x6, x6 :e x4 -> not (x0 x5 x6))) -> u12 :e x4 -> u13 :e x4 -> x3) -> (forall x4, x4 c= u16 -> atleastp u6 x4 -> (forall x5, x5 :e x4 -> (forall x6, x6 :e x4 -> not (x0 x5 x6))) -> u12 :e x4 -> u14 :e x4 -> x3) -> x3))).
admit.
Qed.
