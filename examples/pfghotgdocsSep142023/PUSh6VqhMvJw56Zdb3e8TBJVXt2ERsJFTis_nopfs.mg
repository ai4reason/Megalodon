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
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Theorem missingprop_4f34b0a7549bc0275fb38c3c9e43b7b2f2ad1e1d9330abf0e5514bf5a467f627 : (forall x0 : set -> set -> prop, forall x1 : set -> set, (forall x2, x2 :e u12 -> x1 x2 :e u12) -> (forall x2, x2 c= u12 -> Repl x2 x1 c= u12)).
admit.
Qed.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_205f7564d91f44600e14d9a01300a4a6c4eccc9f6c8ac7e1e9d6cc2adfffeb9a : (forall x0 : set -> set -> prop, forall x1 : set -> set, (forall x2, x2 :e u12 -> (forall x3, x3 :e u12 -> x1 x2 = x1 x3 -> x2 = x3)) -> (forall x2, x2 c= u12 -> equip x2 (Repl x2 x1))).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Theorem missingprop_aa3e8f3213d1dea111e4147a7bd958d7e4d9f1a652b7df2f0d94cdeb64f9d6bf : (forall x0 : set -> set -> prop, forall x1 : set -> set, (forall x2, x2 :e u12 -> (forall x3, x3 :e u12 -> x0 (x1 x2) (x1 x3) -> x0 x2 x3)) -> (forall x2, x2 c= u12 -> (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> not (x0 x3 x4))) -> (forall x3, x3 :e Repl x2 x1 -> (forall x4, x4 :e Repl x2 x1 -> not (x0 x3 x4))))).
admit.
Qed.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Axiom missingprop_8d334858d1804afd99b1b9082715c7f916daee31e697b66b5c752e0c8756ebae : (forall x0, atleastp u2 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (x2 = x3 -> (forall x4 : prop, x4)) -> x1)) -> x1)).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom In_8_9 : 8 :e 9.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
Axiom In_no3cycle : (forall x0 x1 x2, x0 :e x1 -> x1 :e x2 -> x2 :e x0 -> False).
Axiom missingprop_83b7b73de92238880d97107189e7acf45f9dc154df0447f816815407ccfc32b3 : 9 :e 10.
Axiom In_no4cycle : (forall x0 x1 x2 x3, x0 :e x1 -> x1 :e x2 -> x2 :e x3 -> x3 :e x0 -> False).
Axiom missingprop_ab3665aaa395ba5bc535a8f5a44f14a9771c7e237581e2ade81e4e145ecc82bc : 10 :e 11.
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom nat_12 : nat_p 12.
Axiom setminusE1 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> x2 :e x0).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Theorem missingprop_6d92d1f1dc2442370b11e307d2507ca4f85754f5689757e7fe022101bb36e82e : (forall x0 : set -> set -> prop, forall x1 : set -> set, (forall x2, x2 :e u12 -> x1 x2 :e u12) -> (forall x2, x2 :e u12 -> (forall x3, x3 :e u12 -> x1 x2 = x1 x3 -> x2 = x3)) -> (forall x2, x2 :e u12 -> (forall x3, x3 :e u12 -> x0 (x1 x2) (x1 x3) -> x0 x2 x3)) -> x1 u9 = u8 -> x1 u10 = u11 -> x1 u11 = u9 -> x0 u8 u11 -> (forall x2, x2 c= u12 -> atleastp u5 x2 -> (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> not (x0 x3 x4))) -> atleastp u2 (setminus x2 u8) -> (forall x3 : prop, (forall x4, x4 c= u12 -> atleastp u5 x4 -> (forall x5, x5 :e x4 -> (forall x6, x6 :e x4 -> not (x0 x5 x6))) -> u8 :e x4 -> u9 :e x4 -> x3) -> (forall x4, x4 c= u12 -> atleastp u5 x4 -> (forall x5, x5 :e x4 -> (forall x6, x6 :e x4 -> not (x0 x5 x6))) -> u8 :e x4 -> u10 :e x4 -> x3) -> (forall x4, x4 c= u12 -> atleastp u5 x4 -> (forall x5, x5 :e x4 -> (forall x6, x6 :e x4 -> not (x0 x5 x6))) -> u9 :e x4 -> u10 :e x4 -> x3) -> x3))).
admit.
Qed.
