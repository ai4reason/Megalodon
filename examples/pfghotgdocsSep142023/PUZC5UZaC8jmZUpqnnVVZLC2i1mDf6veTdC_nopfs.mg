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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom In_0_9 : 0 :e 9.
Theorem missingprop_d949f57c5dfaf614a6f4f3766686f51d9eb716e4d0cf9f16865af268fc065aeb : 0 :e 10.
admit.
Qed.
Axiom In_1_9 : 1 :e 9.
Theorem missingprop_1b6aea42dd8dd6467e5f0150bab2b0d6533055acdd61b232a0adb5a2a42e1655 : 1 :e 10.
admit.
Qed.
Axiom In_2_9 : 2 :e 9.
Theorem missingprop_aed7facd5ca13de9e69cd6026a1d4bd988584488df9982b5f9702dc816b82279 : 2 :e 10.
admit.
Qed.
Axiom In_3_9 : 3 :e 9.
Theorem missingprop_676c401f8098489ea0734657c4430df5000c9b26ac4bcf84e71557d406b8053d : 3 :e 10.
admit.
Qed.
Axiom In_4_9 : 4 :e 9.
Theorem missingprop_ba23a99d385c96fc20e18f31e2884f35e8c8dc96acf9973b3be03f8c1bfc0b50 : 4 :e 10.
admit.
Qed.
Axiom In_5_9 : 5 :e 9.
Theorem missingprop_f92773479be56466b39b85209c949bc89027283dc3c6bdb4a9c58e34c6e67297 : 5 :e 10.
admit.
Qed.
Axiom In_6_9 : 6 :e 9.
Theorem missingprop_fd78d9827713c0f7b71247ad97a24b91bc3ec9128c1ed685c74b49de36aa650c : 6 :e 10.
admit.
Qed.
Axiom In_7_9 : 7 :e 9.
Theorem missingprop_87b45db69061c144b881c41f7f327bf6d9b09a8a4f536e01d61fa471543b3acb : 7 :e 10.
admit.
Qed.
Axiom In_8_9 : 8 :e 9.
Theorem missingprop_afbf689bc11c7ff9c9e9875ca76148f88a08e7b5261e935945ff12d04ab37d90 : 8 :e 10.
admit.
Qed.
Axiom ordsuccI2 : (forall x0, x0 :e ordsucc x0).
Theorem missingprop_83b7b73de92238880d97107189e7acf45f9dc154df0447f816815407ccfc32b3 : 9 :e 10.
admit.
Qed.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem missingprop_23b65cc9b6f637f491f31dfa7c81f829da1caeef912057ce9b7be38f5b141dca : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 0) x0 -> x10 x0 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 0)).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom neq_1_0 : 1 = 0 -> (forall x0 : prop, x0).
Theorem missingprop_20829ebd82d1317c02a531a452698886c74cb9f38324f44de105b542b55adc29 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 1) x1 -> x10 x1 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 1)).
admit.
Qed.
Axiom neq_2_0 : 2 = 0 -> (forall x0 : prop, x0).
Axiom neq_2_1 : 2 = 1 -> (forall x0 : prop, x0).
Theorem missingprop_ee58b45f5946aec8afaa28cc7f26e85793240ba10f40e51ab6ddace8f5420b1a : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 2) x2 -> x10 x2 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 2)).
admit.
Qed.
Axiom neq_3_0 : 3 = 0 -> (forall x0 : prop, x0).
Axiom neq_3_1 : 3 = 1 -> (forall x0 : prop, x0).
Axiom neq_3_2 : 3 = 2 -> (forall x0 : prop, x0).
Theorem missingprop_7ee6974ea6ce13bfe7428bed272c03509debfcda9853484064770558949e4044 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 3) x3 -> x10 x3 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 3)).
admit.
Qed.
Axiom neq_4_0 : 4 = 0 -> (forall x0 : prop, x0).
Axiom neq_4_1 : 4 = 1 -> (forall x0 : prop, x0).
Axiom neq_4_2 : 4 = 2 -> (forall x0 : prop, x0).
Axiom neq_4_3 : 4 = 3 -> (forall x0 : prop, x0).
Theorem missingprop_36fae61ac8b74e51394fbe8df813047257c978126e8b173adcedda33453acaab : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 4) x4 -> x10 x4 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 4)).
admit.
Qed.
Axiom neq_5_0 : 5 = 0 -> (forall x0 : prop, x0).
Axiom neq_5_1 : 5 = 1 -> (forall x0 : prop, x0).
Axiom neq_5_2 : 5 = 2 -> (forall x0 : prop, x0).
Axiom neq_5_3 : 5 = 3 -> (forall x0 : prop, x0).
Axiom neq_5_4 : 5 = 4 -> (forall x0 : prop, x0).
Theorem missingprop_223f56002ae536c65334b25a227ae0daecbc006cfa0dac969dc272da7dcd84cc : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 5) x5 -> x10 x5 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 5)).
admit.
Qed.
Axiom neq_6_0 : 6 = 0 -> (forall x0 : prop, x0).
Axiom neq_6_1 : 6 = 1 -> (forall x0 : prop, x0).
Axiom neq_6_2 : 6 = 2 -> (forall x0 : prop, x0).
Axiom neq_6_3 : 6 = 3 -> (forall x0 : prop, x0).
Axiom neq_6_4 : 6 = 4 -> (forall x0 : prop, x0).
Axiom neq_6_5 : 6 = 5 -> (forall x0 : prop, x0).
Theorem missingprop_f026c5c3ad585ce363f1ba98c0dbe001d7d8a1b12ba3467af84d71cf00612063 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 6) x6 -> x10 x6 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 6)).
admit.
Qed.
Axiom neq_7_0 : 7 = 0 -> (forall x0 : prop, x0).
Axiom neq_7_1 : 7 = 1 -> (forall x0 : prop, x0).
Axiom neq_7_2 : 7 = 2 -> (forall x0 : prop, x0).
Axiom neq_7_3 : 7 = 3 -> (forall x0 : prop, x0).
Axiom neq_7_4 : 7 = 4 -> (forall x0 : prop, x0).
Axiom neq_7_5 : 7 = 5 -> (forall x0 : prop, x0).
Axiom neq_7_6 : 7 = 6 -> (forall x0 : prop, x0).
Theorem missingprop_5ab54fbd2447bbf518225976c0385c76b94cefb8aee8f6d330660c9cfd5c5b6f : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 7) x7 -> x10 x7 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 7)).
admit.
Qed.
Axiom neq_8_0 : 8 = 0 -> (forall x0 : prop, x0).
Axiom neq_8_1 : 8 = 1 -> (forall x0 : prop, x0).
Axiom neq_8_2 : 8 = 2 -> (forall x0 : prop, x0).
Axiom neq_8_3 : 8 = 3 -> (forall x0 : prop, x0).
Axiom neq_8_4 : 8 = 4 -> (forall x0 : prop, x0).
Axiom neq_8_5 : 8 = 5 -> (forall x0 : prop, x0).
Axiom neq_8_6 : 8 = 6 -> (forall x0 : prop, x0).
Axiom neq_8_7 : 8 = 7 -> (forall x0 : prop, x0).
Theorem missingprop_afff31fbc91ac44375bbbf5d3ebd60e93bee2a301a50d51576f386001c55aed3 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 8) x8 -> x10 x8 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 8)).
admit.
Qed.
Axiom neq_9_0 : 9 = 0 -> (forall x0 : prop, x0).
Axiom neq_9_1 : 9 = 1 -> (forall x0 : prop, x0).
Axiom neq_9_2 : 9 = 2 -> (forall x0 : prop, x0).
Axiom neq_9_3 : 9 = 3 -> (forall x0 : prop, x0).
Axiom neq_9_4 : 9 = 4 -> (forall x0 : prop, x0).
Axiom neq_9_5 : 9 = 5 -> (forall x0 : prop, x0).
Axiom neq_9_6 : 9 = 6 -> (forall x0 : prop, x0).
Axiom neq_9_7 : 9 = 7 -> (forall x0 : prop, x0).
Axiom neq_9_8 : 9 = 8 -> (forall x0 : prop, x0).
Theorem missingprop_5b619995f25187810989fbd25b6f37ed490c603577ca29ed9ff46e7668aada07 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 9) x9 -> x10 x9 (ap (lam 10 (fun x11 : set => If_i (x11 = 0) x0 (If_i (x11 = 1) x1 (If_i (x11 = 2) x2 (If_i (x11 = 3) x3 (If_i (x11 = 4) x4 (If_i (x11 = 5) x5 (If_i (x11 = 6) x6 (If_i (x11 = 7) x7 (If_i (x11 = 8) x8 x9)))))))))) 9)).
admit.
Qed.
Definition missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 : set => lam 10 (fun x10 : set => If_i (x10 = 0) x0 (If_i (x10 = 1) x1 (If_i (x10 = 2) x2 (If_i (x10 = 3) x3 (If_i (x10 = 4) x4 (If_i (x10 = 5) x5 (If_i (x10 = 6) x6 (If_i (x10 = 7) x7 (If_i (x10 = 8) x8 x9)))))))))).
Theorem missingprop_ff5bf15679cb87d90891cb07dd782c2b5cba8cbedc1983a001d47518b2f25148 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 0) x0 -> x10 x0 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 0)).
admit.
Qed.
Theorem missingprop_e9b578ae652ff3557decb69e4c11b566789302181a493a42674951c4aaf3effe : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 1) x1 -> x10 x1 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 1)).
admit.
Qed.
Theorem missingprop_2fd867199b51d586c1477866f0fd1b494b31dc9f4642d0e3230ccd1c88d1a853 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 2) x2 -> x10 x2 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 2)).
admit.
Qed.
Theorem missingprop_5bb380826f2538a6d64f6a37d758ae084f18364491b285f24d10630eaa3cab27 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 3) x3 -> x10 x3 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 3)).
admit.
Qed.
Theorem missingprop_e404fee19f3f1de514202b6f9aa83bb25df80d2b39a9dad348cbeabb9b63cd99 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 4) x4 -> x10 x4 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 4)).
admit.
Qed.
Theorem missingprop_2ca0416cdb2cdd693f66539646356797f496b22af90b9cd3f2d1f2ef77307e6b : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 5) x5 -> x10 x5 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 5)).
admit.
Qed.
Theorem missingprop_9d7045f9f08cdd9648b6523ed6614cb029e947d8ea431ad8de1c8b23943ed324 : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 6) x6 -> x10 x6 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 6)).
admit.
Qed.
Theorem missingprop_ba16600869316efa5a49bc7fd1cd8c92be7aa16c16628a2a3394927d04aa582b : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 7) x7 -> x10 x7 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 7)).
admit.
Qed.
Theorem missingprop_d3cf81f0413f7b3bbca31a25600087714044d62a75584886b212995f57c21ecd : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 8) x8 -> x10 x8 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 8)).
admit.
Qed.
Theorem missingprop_1c46530fb8e60e0aae9dd36fdd9c2edc6f8c8f699a101958fe64ba2b03c6aacd : (forall x0 x1 x2 x3 x4 x5 x6 x7 x8 x9, forall x10 : set -> set -> prop, x10 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 9) x9 -> x10 x9 (ap (missingname_727937daf668cae3e20cd6f6c9c8ccddb089536a92cdf0829018af7dc0146228 x0 x1 x2 x3 x4 x5 x6 x7 x8 x9) 9)).
admit.
Qed.
