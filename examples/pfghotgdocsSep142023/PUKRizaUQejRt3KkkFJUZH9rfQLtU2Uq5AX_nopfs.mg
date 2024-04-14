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
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom add_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (add_nat x0 0) x0 -> x1 x0 (add_nat x0 0)).
Axiom add_nat_SR : (forall x0 x1, nat_p x1 -> add_nat x0 (ordsucc x1) = ordsucc (add_nat x0 x1)).
Axiom nat_ordsucc_in_ordsucc : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e ordsucc x0)).
Axiom add_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (add_nat x0 x1))).
Theorem missingprop_eeaa5555ccfaf9be2474522165cc658a4c21b3dcbef964c1d1aad1f792298727 : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> (forall x2, nat_p x2 -> add_nat x1 x2 :e add_nat x0 x2))).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom Subq_ref : (forall x0, x0 c= x0).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem missingprop_d410a3a5a85dee8b88026a07b7ddf206621becbaaea4930e72baeb4af5fcafdc : (forall x0 x1, nat_p x0 -> nat_p x1 -> x0 c= x1 -> (forall x2, nat_p x2 -> add_nat x0 x2 c= add_nat x1 x2)).
admit.
Qed.
Axiom add_nat_com : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> add_nat x0 x1 = add_nat x1 x0)).
Theorem missingprop_52447d35417df72c3930bddf586528d141c8a01b517a048173b612e2a2431a27 : (forall x0 x1, nat_p x0 -> nat_p x1 -> x0 c= x1 -> (forall x2, nat_p x2 -> add_nat x2 x0 c= add_nat x2 x1)).
admit.
Qed.
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Axiom mul_nat_0R : (forall x0, forall x1 : set -> set -> prop, x1 (mul_nat x0 0) 0 -> x1 0 (mul_nat x0 0)).
Axiom mul_nat_SR : (forall x0 x1, nat_p x1 -> mul_nat x0 (ordsucc x1) = add_nat x0 (mul_nat x0 x1)).
Axiom Subq_tra : (forall x0 x1 x2, x0 c= x1 -> x1 c= x2 -> x0 c= x2).
Axiom mul_nat_p : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (mul_nat x0 x1))).
Theorem missingprop_d99b106d8c3aa5eb23e015bc5d27fe6284c8a3a86f85a0911e7d46761f04ef97 : (forall x0 x1, nat_p x0 -> nat_p x1 -> x0 c= x1 -> (forall x2, nat_p x2 -> mul_nat x0 x2 c= mul_nat x1 x2)).
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition Sigma_nat : set -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => nat_primrec 0 (fun x2 x3 : set => add_nat x3 (x1 x2)) x0).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem missingprop_2ab88bc3cb73bc8bbab980b6b6fd9d920b44f54ff9f8140f78b2a17b00566385 : (forall x0 : set -> set, forall x1 : set -> set -> prop, x1 (Sigma_nat 0 x0) 0 -> x1 0 (Sigma_nat 0 x0)).
admit.
Qed.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Theorem missingprop_32bc7778cd02b216f957f8c5e9693c4b58b7ca04a4ca47b5f3adb522add7dd35 : (forall x0, nat_p x0 -> (forall x1 : set -> set, forall x2 : set -> set -> prop, x2 (Sigma_nat (ordsucc x0) x1) (add_nat (Sigma_nat x0 x1) (x1 x0)) -> x2 (add_nat (Sigma_nat x0 x1) (x1 x0)) (Sigma_nat (ordsucc x0) x1))).
admit.
Qed.
Axiom nat_0 : nat_p 0.
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_8914f504e8b65a6c655f7bd5033f3a4a1d7cd29dc463e81ddfc42596f8ffed1b : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> nat_p (x1 x2)) -> nat_p (Sigma_nat x0 x1))).
admit.
Qed.
Definition exp_nat : set -> set -> set :=
 (fun x0 : set => nat_primrec 1 (fun x1 : set => mul_nat x0)).
Axiom In_0_1 : 0 :e 1.
Axiom mul_nat_SL : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> mul_nat (ordsucc x0) x1 = add_nat (mul_nat x0 x1) x1)).
Axiom missingprop_1b73e01bc234ba0e318bc9baf16604d4f0fc12bea57885439d70438de4eb7174 : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> nat_p (exp_nat x0 x1))).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom nat_ordsucc : (forall x0, nat_p x0 -> nat_p (ordsucc x0)).
Theorem missingprop_83cdda3a06866377cee00eded143ef970fcb0ce0d0b79eb3dce4bad48b291c8e : (forall x0, nat_p x0 -> (forall x1, nat_p x1 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e ordsucc x0) -> Sigma_nat x1 (fun x3 : set => mul_nat (x2 x3) (exp_nat (ordsucc x0) x3)) :e exp_nat (ordsucc x0) x1))).
admit.
Qed.
Axiom nat_1 : nat_p 1.
Theorem missingprop_c741761a4cfde6107df9be6f245ef1dfd65e8b515dba3ea0060e6a63b5817580 : (forall x0, nat_p x0 -> (forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e 2) -> Sigma_nat x0 (fun x2 : set => mul_nat (x1 x2) (exp_nat 2 x2)) :e exp_nat 2 x0)).
admit.
Qed.
Theorem missingprop_5c3848c7fda19725f11cf47a4a35757f4a061125722da80a72c32da49321b3ba : add_nat 32 1 = 33.
admit.
Qed.
Theorem missingprop_bb0ea767d8120d2adea9ad10ea34869ec9220dae095b070f3ec062610dcbd414 : add_nat 32 2 = 34.
admit.
Qed.
Axiom nat_2 : nat_p 2.
Theorem missingprop_5b092cb62a807d9c33585b545da2b2f221246c025657dde3e70dab16c598bf62 : add_nat 32 3 = 35.
admit.
Qed.
Axiom nat_3 : nat_p 3.
Theorem missingprop_b83cc8e9eb740e87541c651bb006155378ec3f4a52078db8edd25232e7730011 : add_nat 32 4 = 36.
admit.
Qed.
Axiom nat_4 : nat_p 4.
Theorem missingprop_f0ce121b5eb6d84924fb25c1b4d0e7079db51d7a7e7eda4cc571474589615431 : add_nat 32 5 = 37.
admit.
Qed.
Axiom nat_5 : nat_p 5.
Theorem missingprop_23c1935a6fb06ae99ef41d983e8ae60e692ed2bba41dcab16425c0e42eed271e : add_nat 32 6 = 38.
admit.
Qed.
Axiom nat_6 : nat_p 6.
Theorem missingprop_67e400f4b30bb7bd8e31f1f1c24e609c38974d01920a537d5a414930c48d1a00 : add_nat 32 7 = 39.
admit.
Qed.
Axiom nat_7 : nat_p 7.
Theorem missingprop_bc7bb32ef10cfe64d441ac6f7b6d6067caca25b88a2ca005e873f54e22a2dcde : add_nat 32 8 = 40.
admit.
Qed.
Axiom nat_8 : nat_p 8.
Theorem missingprop_30043a47cfcd960f683ef93381ac388ecd673db2d0f2c437edf560a333288a13 : add_nat 32 9 = 41.
admit.
Qed.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom tuple_6_5_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 5) x5 -> x6 x5 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 5)).
Axiom missingprop_6e31f7e63da1d74f4ea3ef967162bc5821029ffe1e451b13664a6e51a570dea7 : (forall x0, nat_p x0 -> mul_nat 1 x0 = x0).
Axiom tuple_6_4_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 4) x4 -> x6 x4 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 4)).
Axiom mul_nat_0L : (forall x0, nat_p x0 -> mul_nat 0 x0 = 0).
Axiom tuple_6_3_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 3) x3 -> x6 x3 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 3)).
Axiom tuple_6_2_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 2) x2 -> x6 x2 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 2)).
Axiom tuple_6_1_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 1) x1 -> x6 x1 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 1)).
Axiom tuple_6_0_eq : (forall x0 x1 x2 x3 x4 x5, forall x6 : set -> set -> prop, x6 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 0) x0 -> x6 x0 (ap (lam 6 (fun x7 : set => If_i (x7 = 0) x0 (If_i (x7 = 1) x1 (If_i (x7 = 2) x2 (If_i (x7 = 3) x3 (If_i (x7 = 4) x4 x5)))))) 0)).
Axiom missingprop_dce43ea6d63e54501c7ce27a27a4f3799fbde66446a6152326baf4c4d41aa8a0 : exp_nat 2 3 = 8.
Axiom missingprop_8e67f22739f9a01fd2d9438edd2f3f6d8d323d1fa4d050bc09f5b1af8d3b6dd7 : exp_nat 2 5 = 32.
Axiom add_nat_0L : (forall x0, nat_p x0 -> add_nat 0 x0 = x0).
Axiom missingprop_338431d9538a20654d743f8ae106061819c7ebca823a9d80d9af1e3fa036eeee : add_nat 8 1 = 9.
Axiom nat_9 : nat_p 9.
Axiom missingprop_e20297641bb65d9e51ebac2e053948365a3f53b65d223d41920ce90b2e26b533 : nat_p 32.
Theorem missingprop_1b79dfbb43b0cc3437aae6976d9ab14a8460c88de672bd4d288d42598976082b : Sigma_nat 6 (fun x1 : set => mul_nat (ap (lam 6 (fun x2 : set => If_i (x2 = 0) 1 (If_i (x2 = 1) 0 (If_i (x2 = 2) 0 (If_i (x2 = 3) 1 (If_i (x2 = 4) 0 1)))))) x1) (exp_nat 2 x1)) = 41.
admit.
Qed.
