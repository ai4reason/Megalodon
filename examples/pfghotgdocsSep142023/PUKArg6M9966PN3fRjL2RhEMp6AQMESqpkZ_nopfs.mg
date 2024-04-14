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
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom Power_Subq : (forall x0 x1, x0 c= x1 -> Power x0 c= Power x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Theorem missingprop_ed9ae380d91bb4eef6a9133f8865237c6a1236bcf056f5e6c2e3787bb8a1ba4a : (forall x0, Power x0 c= Power (ordsucc x0)).
admit.
Qed.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom ReplI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> x1 x2 :e Repl x0 x1).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_3f387ff059195d2af4056f5d272ec1ab7b9f411864ac9a92b98d93f8bb66ceca : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> bij x0 (Repl x0 x1) x1).
admit.
Qed.
Definition equip : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, bij x0 x1 x3 -> x2) -> x2).
Theorem missingprop_6f924010899e62355200d41f1cef23d6373bef28ff540d0bdb872dcb6e86d39f : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> equip x0 (Repl x0 x1)).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition atleastp : set -> set -> prop :=
 (fun x0 x1 : set => forall x2 : prop, (forall x3 : set -> set, inj x0 x1 x3 -> x2) -> x2).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem missingprop_11c6158bd93dbd27daaa9a84a43404be6ccbf75f900b1e28dfa453e64ea6c96b : (forall x0 x1 x2, nIn x2 x1 -> atleastp x0 x1 -> atleastp (ordsucc x0) (binunion x1 (Sing x2))).
admit.
Qed.
Definition TwoRamseyProp_atleastp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (atleastp x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom Subq_ref : (forall x0, x0 c= x0).
Axiom atleastp_ref : (forall x0, atleastp x0 x0).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
Axiom UPairE : (forall x0 x1 x2, x0 :e UPair x1 x2 -> or (x0 = x1) (x0 = x2)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_678f269783f56623b590ce1d631178bc95b1ef296ba955ebeddcd0dc31626e86 : (forall x0, TwoRamseyProp_atleastp 2 x0 x0).
admit.
Qed.
Theorem missingprop_9555e0d9fdb2de2946ade80c5601bbc2d7d10bbfbfdf3c2a29f338ee6ac35b14 : (forall x0 x1 x2, TwoRamseyProp_atleastp x0 x1 x2 -> TwoRamseyProp_atleastp x1 x0 x2).
admit.
Qed.
Definition TwoRamseyProp : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> or (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x0 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> x3 x6 x7))) -> x4) -> x4) (forall x4 : prop, (forall x5, and (x5 c= x2) (and (equip x1 x5) (forall x6, x6 :e x5 -> (forall x7, x7 :e x5 -> (x6 = x7 -> (forall x8 : prop, x8)) -> not (x3 x6 x7)))) -> x4) -> x4)).
Theorem missingprop_7bf6e58ac0649391f8a282bfdab147c48e1bbed6549cde1b2c604e23fd97b05e : (forall x0 x1 x2, TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x1 x0 x2).
admit.
Qed.
Theorem missingprop_8aec7aa3dfe2dc8cbf1366cb9f5d8ab2c4ceeb7b1cd3cc933b26d92d53269901 : (forall x0 x1 x2, TwoRamseyProp_atleastp x0 x1 x2 -> TwoRamseyProp x0 x1 x2).
admit.
Qed.
Axiom equip_tra : (forall x0 x1 x2, equip x0 x1 -> equip x1 x2 -> equip x0 x2).
Theorem missingprop_aae4e03000d6619cc34e5a66244db6980d668b70bdfc22610af1046fd13449ea : (forall x0 x1 x2 x3, atleastp x2 x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
admit.
Qed.
Axiom Subq_atleastp : (forall x0 x1, x0 c= x1 -> atleastp x0 x1).
Theorem missingprop_5b7536e138ce2802b7ff71fe1112d72a83e0e7fe4b94027c8a3d1f1cacfae786 : (forall x0 x1 x2 x3, x2 c= x3 -> TwoRamseyProp x0 x1 x2 -> TwoRamseyProp x0 x1 x3).
admit.
Qed.
