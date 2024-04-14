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
Definition u13 : set :=
 ordsucc u12.
Definition u14 : set :=
 ordsucc u13.
Definition u15 : set :=
 ordsucc u14.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition u16 : set :=
 ordsucc u15.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom missingprop_0397a08554d02eca12a49d1b016d535c1fa787322f197d101b2112b6e0f961b4 : (forall x0 : set -> set -> prop, x0 0 u2 -> x0 u4 u6 -> x0 u1 u12 -> x0 u5 u12 -> x0 u8 u12 -> x0 u9 u12 -> x0 u3 u13 -> x0 u7 u13 -> x0 u10 u13 -> x0 u2 u14 -> x0 u6 u14 -> x0 u11 u14 -> x0 0 u15 -> x0 u4 u15 -> (forall x1, x1 c= u16 -> atleastp u6 x1 -> u12 :e x1 -> u13 :e x1 -> u14 :e x1 -> (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> not (x0 x2 x3))) -> False)).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom missingprop_95c6cbd2308b27a7edcd2a1d9389b377988e902d740d05dc7c88e6b8da945ab9 : (forall x0, atleastp 3 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1))) -> x1)).
Axiom binintersectE1 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom missingprop_45d11dce2d0b092bd17c01d64c29c5885c90b43dc7cb762c6d6ada999ea508c5 : (forall x0, nat_p x0 -> (forall x1, or (atleastp x1 x0) (atleastp (ordsucc x0) x1))).
Axiom nat_2 : nat_p 2.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_5 : nat_p 5.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Axiom nat_setsum_ordsucc : (forall x0, nat_p x0 -> setsum 1 x0 = ordsucc x0).
Axiom nat_4 : nat_p 4.
Axiom missingprop_94b237fc7b7d3bf1a0a078f7d057802d281bf3c46c36fd56a85d339ac0f07170 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom missingprop_6f4f3b954cb736651074754cd4a7a9c9f8fdee5b2d9e8c774389a322e59d45f1 : (forall x0, atleastp (Sing x0) u1).
Axiom nat_3 : nat_p 3.
Axiom In_no4cycle : (forall x0 x1 x2 x3, x0 :e x1 -> x1 :e x2 -> x2 :e x3 -> x3 :e x0 -> False).
Axiom missingprop_aac233feaa0aa18324c0d692b3f19bd8318b55545ab88208c741a1f8b442a053 : 12 :e 13.
Axiom missingprop_331badb0bc2cb72fdd31f16934f9ba3896484f4038f5056bfa218c35501c067b : 13 :e 14.
Axiom missingprop_6596ffb376d868a993d672d4e104aa09f5055d54e0d97b478501a938a69c460f : 14 :e 15.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom binintersectE2 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x1).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom missingprop_9052a17aeb56f0baa5bd35ac678f9db733e32e563a9d0a61b0417ed4592a2293 : u15 = u14 -> (forall x0 : prop, x0).
Axiom In_no3cycle : (forall x0 x1 x2, x0 :e x1 -> x1 :e x2 -> x2 :e x0 -> False).
Axiom missingprop_15d8fee75ef2fcef507dcd58e078d7224460844031194a35f38ebec160a6c36c : u14 = u12 -> (forall x0 : prop, x0).
Axiom missingprop_b71ad64ae5ee6739b72b7cf6202281008bcc9edc7ad98b81f40c22a64711fdc6 : u15 = u12 -> (forall x0 : prop, x0).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom binunionI2 : (forall x0 x1 x2, x2 :e x1 -> x2 :e binunion x0 x1).
Axiom binintersectI : (forall x0 x1 x2, x2 :e x0 -> x2 :e x1 -> x2 :e binintersect x0 x1).
Axiom binunionI1 : (forall x0 x1 x2, x2 :e x0 -> x2 :e binunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom nat_In_atleastp : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> atleastp x1 x0)).
Axiom In_2_3 : 2 :e 3.
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom In_0_5 : 0 :e 5.
Axiom add_nat_0L : (forall x0, nat_p x0 -> add_nat 0 x0 = x0).
Axiom nat_12 : nat_p 12.
Axiom In_1_5 : 1 :e 5.
Axiom add_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat (ordsucc x0) x1 = ordsucc (add_nat x0 x1))).
Axiom nat_0 : nat_p 0.
Axiom In_2_5 : 2 :e 5.
Axiom nat_1 : nat_p 1.
Axiom In_3_5 : 3 :e 5.
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom cases_9 : (forall x0, x0 :e 9 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 2 -> x1 3 -> x1 4 -> x1 5 -> x1 6 -> x1 7 -> x1 8 -> x1 x0)).
Theorem missingprop_0000c65f9de36d25804b682992bd488961ddb64d511e3c734ef831a829c7802f : (forall x0 : set -> set -> prop, x0 0 u2 -> x0 u4 u6 -> x0 u1 u12 -> x0 u5 u12 -> x0 u8 u12 -> x0 u9 u12 -> x0 u3 u13 -> x0 u7 u13 -> x0 u10 u13 -> x0 u2 u14 -> x0 u6 u14 -> x0 u11 u14 -> x0 0 u15 -> x0 u4 u15 -> x0 u3 u4 -> x0 0 u7 -> x0 u10 u14 -> (forall x1, x1 c= u16 -> atleastp u6 x1 -> u12 :e x1 -> u14 :e x1 -> (forall x2, x2 :e x1 -> (forall x3, x3 :e x1 -> not (x0 x2 x3))) -> False)).
admit.
Qed.
