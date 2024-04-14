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
Definition Church6_p : (set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => forall x1 : (set -> set -> set -> set -> set -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 : set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 : set => x7) -> x1 x0).
Theorem missingprop_331adedb7edd49a25927b93fceb0218da7c5b54994dbd262dd5d161f43c67d7a : Church6_p (fun x0 x1 x2 x3 x4 x5 : set => x0).
admit.
Qed.
Theorem missingprop_043e4b78a0654a6683c9234d3bf7766badd8de7fbbde08ad6810ddd8a4f5acef : Church6_p (fun x0 x1 x2 x3 x4 x5 : set => x1).
admit.
Qed.
Theorem missingprop_616c991f45f4fe9d3efb0220d6bfc2b3a9576d02c827cfd1aa156159e180bc78 : Church6_p (fun x0 x1 x2 x3 x4 x5 : set => x2).
admit.
Qed.
Theorem missingprop_829cc6bcf19535104e1ef14d3c37a121ee539b24777eaff2cd61aead27db443c : Church6_p (fun x0 x1 x2 x3 x4 x5 : set => x3).
admit.
Qed.
Theorem missingprop_c2058c433a08cbd0a9de8592bbafc20a46c3ba8f1b81c7ac182023aff037fe72 : Church6_p (fun x0 x1 x2 x3 x4 x5 : set => x4).
admit.
Qed.
Theorem missingprop_4d8598615c468fd2c2438610c865b021fd567a1a56272aa5746a1a4686cd4fd4 : Church6_p (fun x0 x1 x2 x3 x4 x5 : set => x5).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
(* Parameter u2 "e6513b6b7dacfb379ee35c71b72ff5e0713f783ff08590c7fabcc4c48daf9f2e" "3bd7f72ec38573ff1d3910239a4aa349e3832908ab08202cf114451bffd7d17d" *)
Parameter u2 : set.
(* Parameter u3 "e803b40f939f4fe15fb61b29ded3bee1206757349f3b808c5103467101bdab9a" "1da7b5b024a841d0694168c01df8b0cada113e9c4616f1555b257b978dff46cc" *)
Parameter u3 : set.
(* Parameter u4 "7a516cda4555ee314bd599299eac983d7d569296583a629b47918e19d4a0f71f" "66241e5ccfbbd32429c1f14526f03d9d37590fe4ddf66171a76fae8bb5f8b113" *)
Parameter u4 : set.
(* Parameter u5 "2a783d5aa30540222437cf12bcd2250d09379447bbcfb2424ca047f449bf06b4" "81fa4107fe53377c8e9932359ab17b6be1f49b6646daa701ee0c5525e8489bca" *)
Parameter u5 : set.
Definition Church6_to_u6 : (set -> set -> set -> set -> set -> set -> set) -> set :=
 (fun x0 : set -> set -> set -> set -> set -> set -> set => x0 0 u1 u2 u3 u4 u5).
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
Axiom cases_6 : (forall x0, x0 :e u6 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 x0)).
Theorem cases_6' : (forall x0, x0 :e u6 -> (forall x1 : set -> prop, x1 0 -> x1 u1 -> x1 u2 -> x1 u3 -> x1 u4 -> x1 u5 -> x1 x0)).
admit.
Qed.
Axiom In_0_6 : 0 :e u6.
Theorem In_0_6' : 0 :e u6.
admit.
Qed.
Axiom In_1_6 : u1 :e u6.
Theorem In_1_6' : u1 :e u6.
admit.
Qed.
Axiom In_2_6 : u2 :e u6.
Theorem In_2_6' : u2 :e u6.
admit.
Qed.
Axiom In_3_6 : u3 :e u6.
Theorem In_3_6' : u3 :e u6.
admit.
Qed.
Axiom In_4_6 : u4 :e u6.
Theorem In_4_6' : u4 :e u6.
admit.
Qed.
Axiom In_5_6 : u5 :e u6.
Theorem In_5_6' : u5 :e u6.
admit.
Qed.
Theorem missingprop_4c4a30cb28bcd21744eec16e4ab4637f15035a845cbbb0ffbe052be5f3b1352d : (forall x0, x0 :e u6 -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set -> set -> set, Church6_p x2 -> x0 = Church6_to_u6 x2 -> x1) -> x1)).
admit.
Qed.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition nth_6_tuple : set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 x3 x4 x5 x6 : set => ap (lam 6 (fun x7 : set => If_i (x7 = 0) x1 (If_i (x7 = 1) x2 (If_i (x7 = 2) x3 (If_i (x7 = 3) x4 (If_i (x7 = 4) x5 x6)))))) x0).
Theorem missingprop_9b7e08ae09184abba8ddb9325aa16d2014870dc249bc73da87d3d5eaccba8f87 : (forall x0, forall x1 : set -> set -> set -> set -> set -> set -> set, (forall x2 x3 x4 x5 x6 x7, forall x8 : set -> set -> prop, x8 (nth_6_tuple x0 x2 x3 x4 x5 x6 x7) (x1 x2 x3 x4 x5 x6 x7) -> x8 (x1 x2 x3 x4 x5 x6 x7) (nth_6_tuple x0 x2 x3 x4 x5 x6 x7)) -> nth_6_tuple x0 = x1).
admit.
Qed.
Axiom tuple_6_1_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u1) x1 -> x6 x1 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u1)).
Theorem tuple_6_1_eq' : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u1) x1 -> x6 x1 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u1)).
admit.
Qed.
Axiom tuple_6_2_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u2) x2 -> x6 x2 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u2)).
Theorem tuple_6_2_eq' : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u2) x2 -> x6 x2 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u2)).
admit.
Qed.
Axiom tuple_6_3_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u3) x3 -> x6 x3 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u3)).
Theorem tuple_6_3_eq' : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u3) x3 -> x6 x3 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u3)).
admit.
Qed.
Axiom tuple_6_4_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u4) x4 -> x6 x4 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u4)).
Theorem tuple_6_4_eq' : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u4) x4 -> x6 x4 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u4)).
admit.
Qed.
Axiom tuple_6_5_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u5) x5 -> x6 x5 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u5)).
Theorem tuple_6_5_eq' : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u5) x5 -> x6 x5 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) u5)).
admit.
Qed.
Axiom tuple_6_0_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 0) x0 -> x6 x0 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 0)).
Theorem missingprop_5e063b347ef5ac56a92183cc00c589df53087ab1e0b6353a236a973dc2f46966 : nth_6_tuple 0 = (fun x1 x2 x3 x4 x5 x6 : set => x1).
admit.
Qed.
Theorem missingprop_487e017004ecabac0b8e518f0fcaf45b502b6f60f5af04ddefe015bde12eaf50 : nth_6_tuple u1 = (fun x1 x2 x3 x4 x5 x6 : set => x2).
admit.
Qed.
Theorem missingprop_9205282ef77caa3eed787eb4fa460a34079ef649c9bf4aa55e938da8cedd6fa2 : nth_6_tuple u2 = (fun x1 x2 x3 x4 x5 x6 : set => x3).
admit.
Qed.
Theorem missingprop_d77aca9102a0a7995bbfb825c57cbe3520e1f56683b5c476fb6c9389a8c86331 : nth_6_tuple u3 = (fun x1 x2 x3 x4 x5 x6 : set => x4).
admit.
Qed.
Theorem missingprop_d3b792af1adffec16ce4fc340f1433694e312f9a299dc66e7bdd660386d0095e : nth_6_tuple u4 = (fun x1 x2 x3 x4 x5 x6 : set => x5).
admit.
Qed.
Theorem missingprop_d1ab6c05d827ab2f0497648eeb2e74b0b0260f4e004a74cbc06a5c0a175e4a2a : nth_6_tuple u5 = (fun x1 x2 x3 x4 x5 x6 : set => x6).
admit.
Qed.
Theorem missingprop_1b4f2955a5c5bc9e0e05efcc9b39724ab6f1c75c28f2f476e2bc7bdba41d9061 : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> Church6_to_u6 x0 :e u6).
admit.
Qed.
Theorem missingprop_90460311f4fb47844a8dd0d64a1306416f6a25ac4d465fc1811061f42791aace : (forall x0, x0 :e u6 -> Church6_p (nth_6_tuple x0)).
admit.
Qed.
Theorem missingprop_72649fc0d609625e17ac53e25cd57a51abe86f395cd11e949eac34127a9e2ea9 : (forall x0, x0 :e u6 -> Church6_to_u6 (nth_6_tuple x0) = x0).
admit.
Qed.
Theorem missingprop_c75cff31880a89a656c47e80c0af1903547ace73a8cd84857ca0750f4ef54c4b : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> nth_6_tuple x0 = nth_6_tuple x1 -> x0 = x1)).
admit.
Qed.
Theorem missingprop_1df6cb25245842ac80f846f984ad1ab224979cc48aebddb9e27917721a4b0bdb : (forall x0 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> nth_6_tuple (Church6_to_u6 x0) = x0).
admit.
Qed.
Theorem missingprop_9a709d9bc4c6804b172f639f55b0985e23bb3f864575c5e0623f6546c0f3d120 : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set, Church6_p x0 -> Church6_p x1 -> Church6_to_u6 x0 = Church6_to_u6 x1 -> x0 = x1).
admit.
Qed.
Definition missingname_a73cef372f685ffd769a8cac150a8bfaa15c4e12197ea7767e5f8da474fc54bb : (((set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> set :=
 (fun x0 : ((set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set => lam 2 (fun x1 : set => If_i (x1 = 0) (Church6_to_u6 (x0 (fun x2 x3 : set -> set -> set -> set -> set -> set -> set => x2))) (Church6_to_u6 (x0 (fun x2 x3 : set -> set -> set -> set -> set -> set -> set => x3))))).
Definition missingname_673afb84d5709159c9ce37b899baa536c68c7aa6cf6f01c23395f80a2c106d8f : set -> ((set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 : set => fun x1 : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set => x1 (nth_6_tuple (ap x0 0)) (nth_6_tuple (ap x0 u1))).
Definition missingname_8901376d981bf1675e4ec3d12fbb42ed6654aebf150e5b3b77e320dde6bc3a6b : (((set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> prop :=
 (fun x0 : ((set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set => forall x1 : (((set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> prop, (forall x2 x3 : set -> set -> set -> set -> set -> set -> set, Church6_p x2 -> Church6_p x3 -> x1 (fun x4 : (set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set => x4 x2 x3)) -> x1 x0).
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Theorem missingprop_c63c024c80ebea1ae2a1ce4f4d7449789451a1f9acfd6f33b56d08fb42b4e01e : (forall x0 : ((set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set, missingname_8901376d981bf1675e4ec3d12fbb42ed6654aebf150e5b3b77e320dde6bc3a6b x0 -> missingname_a73cef372f685ffd769a8cac150a8bfaa15c4e12197ea7767e5f8da474fc54bb x0 :e setprod u6 u6).
admit.
Qed.
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Theorem missingprop_4872cfd4fe68da787d2677542a1abcffa31353d0b945f38dfe615885c19db8fb : (forall x0, x0 :e setprod u6 u6 -> missingname_8901376d981bf1675e4ec3d12fbb42ed6654aebf150e5b3b77e320dde6bc3a6b (missingname_673afb84d5709159c9ce37b899baa536c68c7aa6cf6f01c23395f80a2c106d8f x0)).
admit.
Qed.
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Theorem missingprop_aa5dcb13935191fcc9f974f6c2608d7b43750593633cf6cb654cb3d52a946d91 : (forall x0, x0 :e setprod u6 u6 -> missingname_a73cef372f685ffd769a8cac150a8bfaa15c4e12197ea7767e5f8da474fc54bb (missingname_673afb84d5709159c9ce37b899baa536c68c7aa6cf6f01c23395f80a2c106d8f x0) = x0).
admit.
Qed.
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Theorem missingprop_4f5b280566ea036bceb5cb473fd618ca784318e868e45845c6455d128172dc54 : (forall x0 : ((set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set, missingname_8901376d981bf1675e4ec3d12fbb42ed6654aebf150e5b3b77e320dde6bc3a6b x0 -> missingname_673afb84d5709159c9ce37b899baa536c68c7aa6cf6f01c23395f80a2c106d8f (missingname_a73cef372f685ffd769a8cac150a8bfaa15c4e12197ea7767e5f8da474fc54bb x0) = x0).
admit.
Qed.
Theorem missingprop_88072584c6fe1a9c40165ed4dac0607c781b979c1fa9e306cba36055f5c29b0d : (forall x0, x0 :e setprod u6 u6 -> (forall x1, x1 :e setprod u6 u6 -> missingname_673afb84d5709159c9ce37b899baa536c68c7aa6cf6f01c23395f80a2c106d8f x0 = missingname_673afb84d5709159c9ce37b899baa536c68c7aa6cf6f01c23395f80a2c106d8f x1 -> x0 = x1)).
admit.
Qed.
Theorem missingprop_1f83331c26d73f54da984fe43e95f386ef377f952ac80f0e899f820a775a1f31 : (forall x0 x1 : ((set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> set, missingname_8901376d981bf1675e4ec3d12fbb42ed6654aebf150e5b3b77e320dde6bc3a6b x0 -> missingname_8901376d981bf1675e4ec3d12fbb42ed6654aebf150e5b3b77e320dde6bc3a6b x1 -> missingname_a73cef372f685ffd769a8cac150a8bfaa15c4e12197ea7767e5f8da474fc54bb x0 = missingname_a73cef372f685ffd769a8cac150a8bfaa15c4e12197ea7767e5f8da474fc54bb x1 -> x0 = x1).
admit.
Qed.
