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
(* Parameter pack_p "3c539dbbee9d5ff440b9024180e52e9c2adde77bbaa8264d8f67d724d8c8cb25" "d5afae717eff5e7035dc846b590d96bd5a7727284f8ff94e161398c148ab897f" *)
Parameter pack_p : set -> (set -> prop) -> set.
Definition struct_p : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> prop, x1 (pack_p x2 x3)) -> x1 x0).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition True : prop :=
 (forall x0 : prop, x0 -> x0).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => and (Obj x4) (forall x6, Obj x6 -> and (Hom x6 x4 (x5 x6)) (forall x7, Hom x6 x4 x7 -> x7 = x5 x6))).
(* Parameter UnaryPredHom "44ed079d6a65865657792e1cc515b76a1121cfdc9af8f6c21f8cc848fa700837" "5d0201189805d03fc856c2fa62f35171b88a531f7deeee6199625094c02eddd7" *)
Parameter UnaryPredHom : set -> set -> set -> prop.
(* Parameter struct_id "ddbfe293c94f63568d97903ab92695c5b104ee51e1b7d4e7dd29a87510065054" "ac22e99093b43e0b6246d1a60c33b72b22acf28c29494701ebd52fa3ba6ac8bc" *)
Parameter struct_id : set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
Definition struct_comp : set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam_comp (ap x0 0)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Axiom pack_p_0_eq2 : (forall x0, forall x1 : set -> prop, forall x2 : set -> set -> prop, x2 x0 (ap (pack_p x0 x1) 0) -> x2 (ap (pack_p x0 x1) 0) x0).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom missingprop_63c01b8f599732ba7bc3b48c28c0f10755230e5cc9f0717c7895602d2eaf01d3 : (forall x0 x1, forall x2 x3 : set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (UnaryPredHom (pack_p x0 x2) (pack_p x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> x2 x6 -> x3 (ap x4 x6))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> x2 x6 -> x3 (ap x4 x6))) (UnaryPredHom (pack_p x0 x2) (pack_p x1 x3) x4)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom In_0_1 : 0 :e 1.
Axiom TrueI : True.
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom eq_1_Sing0 : 1 = Sing 0.
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Theorem missingprop_eaa5ecc21d9729bc79b0e5cf0bed2c98f0fc7f7f801ce2eeca3ce9b80a339bb2 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> x0 (pack_p 1 (fun x1 : set => True)) -> MetaCat_terminal_p x0 UnaryPredHom struct_id struct_comp (pack_p 1 (fun x1 : set => True)) (fun x1 : set => lam (ap x1 0) (fun x2 : set => 0))).
admit.
Qed.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Definition MetaCat_nno_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => fun x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (MetaCat_terminal_p Obj Hom Id Comp x4 x5) (Obj x6)) (Hom x4 x6 x7)) (Hom x6 x6 x8)) (forall x10 x11 x12, Obj x10 -> Hom x4 x10 x11 -> Hom x10 x10 x12 -> and (and (and (Hom x6 x10 (x9 x10 x11 x12)) (Comp x4 x6 x10 (x9 x10 x11 x12) x7 = x11)) (Comp x6 x6 x10 (x9 x10 x11 x12) x8 = Comp x6 x10 x10 x12 (x9 x10 x11 x12))) (forall x13, Hom x6 x10 x13 -> Comp x4 x6 x10 x13 x7 = x11 -> Comp x6 x6 x10 x13 x8 = Comp x6 x10 x10 x12 x13 -> x13 = x9 x10 x11 x12))).
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Axiom and5I : (forall x0 x1 x2 x3 x4 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> and (and (and (and x0 x1) x2) x3) x4).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Axiom nat_0 : nat_p 0.
Axiom omega_ordsucc : (forall x0, x0 :e omega -> ordsucc x0 :e omega).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Axiom omega_nat_p : (forall x0, x0 :e omega -> nat_p x0).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Theorem missingprop_87e4b92e864cd20cb66a704125e89f2601312b49a571aa5aeba3f0ceb096da6e : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> x0 (pack_p 1 (fun x1 : set => True)) -> x0 (pack_p omega (fun x1 : set => True)) -> MetaCat_nno_p x0 UnaryPredHom struct_id struct_comp (pack_p 1 (fun x1 : set => True)) (fun x1 : set => lam (ap x1 0) (fun x2 : set => 0)) (pack_p omega (fun x1 : set => True)) (lam 1 (fun x1 : set => 0)) (lam omega ordsucc) (fun x1 x2 x3 : set => lam omega (nat_primrec (ap x2 0) (fun x4 : set => ap x3)))).
admit.
Qed.
Axiom pack_struct_p_I : (forall x0, forall x1 : set -> prop, struct_p (pack_p x0 x1)).
Theorem missingprop_a1fc1c0965b2431ab9013d295c8738572947424115d5e38617cd4d5b8c3eab2c : MetaCat_terminal_p struct_p UnaryPredHom struct_id struct_comp (pack_p 1 (fun x0 : set => True)) (fun x0 : set => lam (ap x0 0) (fun x1 : set => 0)).
admit.
Qed.
Theorem missingprop_d129d67382b5da068e54c375218ce85c874bbf9c7d066f87c32a10d705cc89b0 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p struct_p UnaryPredHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter unpack_p_o "4b92ca0383b3989d01ddc4ec8bdf940b54163f9a29e460dfd502939eb880162f" "30f11fc88aca72af37fd2a4235aa22f28a552bbc44f1fb01f4edf7f2b7e376ac" *)
Parameter unpack_p_o : set -> (set -> (set -> prop) -> prop) -> prop.
Definition PtdPred : set -> prop :=
 (fun x0 : set => and (struct_p x0) (unpack_p_o x0 (fun x1 : set => fun x2 : set -> prop => forall x3 : prop, (forall x4, and (x4 :e x1) (x2 x4) -> x3) -> x3))).
Axiom missingprop_2576d2815b46016e5e13a9989b4e9789629d83c56ed1c92a4cda0de077a20752 : (forall x0, forall x1 : set -> prop, (forall x2 : prop, (forall x3, and (x3 :e x0) (x1 x3) -> x2) -> x2) -> PtdPred (pack_p x0 x1)).
Theorem missingprop_a5d0aa947f8c1e55796206e4c8aaf9f8c980ec2fc7094b10f4b6af00937dc827 : MetaCat_terminal_p PtdPred UnaryPredHom struct_id struct_comp (pack_p 1 (fun x0 : set => True)) (fun x0 : set => lam (ap x0 0) (fun x1 : set => 0)).
admit.
Qed.
Theorem missingprop_8dadcf73a4aec2fbcb980c749408777a6b815907d2b1cc9db68b34836251b75e : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter pack_r "39d80099e1b48aed4548f424ae4f1ff25b2d595828aff4b3a5abe232ca0348b5" "217a7f92acc207b15961c90039aa929f0bd5d9212f66ce5595c3af1dd8b9737e" *)
Parameter pack_r : set -> (set -> set -> prop) -> set.
Definition struct_r : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> prop, x1 (pack_r x2 x3)) -> x1 x0).
(* Parameter BinRelnHom "352304ebb6c77dbc4e2a952e767857a98538e43de1c35fb4bcd6c99fca02ae7e" "acf0f04c6a55a143e3ed8404c0fa6b09b323d938c83532f081b47091e31c4eb3" *)
Parameter BinRelnHom : set -> set -> set -> prop.
Axiom pack_r_0_eq2 : (forall x0, forall x1 x2 : set -> set -> prop, x2 x0 (ap (pack_r x0 x1) 0) -> x2 (ap (pack_r x0 x1) 0) x0).
Axiom missingprop_4e486761c3790f4990f398ce8c16ea7ac5915924a294f8e5b06e45030e68e983 : (forall x0 x1, forall x2 x3 : set -> set -> prop, forall x4, forall x5 : prop -> prop -> prop, x5 (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> x2 x6 x7 -> x3 (ap x4 x6) (ap x4 x7)))) (BinRelnHom (pack_r x0 x2) (pack_r x1 x3) x4)).
Theorem missingprop_9fbd349ca99a7de2fd5b1b8c248057d5d2f1603a92c67c4dc423c65d9e0a65d8 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_r x1) -> x0 (pack_r 1 (fun x1 x2 : set => True)) -> MetaCat_terminal_p x0 BinRelnHom struct_id struct_comp (pack_r 1 (fun x1 x2 : set => True)) (fun x1 : set => lam (ap x1 0) (fun x2 : set => 0))).
admit.
Qed.
Theorem missingprop_e3fb63acb1c0213d33e5570b26edc928a770a02dae8317a04707641cdd803978 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_r x1) -> x0 (pack_r 1 (fun x1 x2 : set => True)) -> x0 (pack_r omega (fun x1 x2 : set => forall x3 : set -> set -> prop, x3 x1 x2 -> x3 x2 x1)) -> MetaCat_nno_p x0 BinRelnHom struct_id struct_comp (pack_r 1 (fun x1 x2 : set => True)) (fun x1 : set => lam (ap x1 0) (fun x2 : set => 0)) (pack_r omega (fun x1 x2 : set => forall x3 : set -> set -> prop, x3 x1 x2 -> x3 x2 x1)) (lam 1 (fun x1 : set => 0)) (lam omega ordsucc) (fun x1 x2 x3 : set => lam omega (nat_primrec (ap x2 0) (fun x4 : set => ap x3)))).
admit.
Qed.
(* Parameter unpack_r_o "8d2ef9c9e522891d1fe605a62dffeab8aefb6325650e4eab14135e7eee8002c5" "e3e6af0984cda0a02912e4f3e09614b67fc0167c625954f0ead4110f52ede086" *)
Parameter unpack_r_o : set -> (set -> (set -> set -> prop) -> prop) -> prop.
Definition PER : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3)) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_b2515235786361aea7c15ac6711d5751cd13b11988163a3b347abdb56aff828a : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> PER (pack_r x0 x1)).
Theorem missingprop_6745fffeaa3fe2f1d53187bbf5eccb8125730c52ca6502c8f1e42ae268505784 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p PER BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition EquivReln : set -> prop :=
 (fun x0 : set => and (struct_r x0) (unpack_r_o x0 (fun x1 : set => fun x2 : set -> set -> prop => and (and (forall x3, x3 :e x1 -> x2 x3 x3) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> x2 x3 x4 -> x2 x4 x3))) (forall x3, x3 :e x1 -> (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x3 x4 -> x2 x4 x5 -> x2 x3 x5)))))).
Axiom missingprop_46185b99972d7cc500b0fcea77da3881e5aca4376b72d7aefbcc4420b07dadec : (forall x0, forall x1 : set -> set -> prop, (forall x2, x2 :e x0 -> x1 x2 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 -> x1 x3 x2)) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x2 x3 -> x1 x3 x4 -> x1 x2 x4))) -> EquivReln (pack_r x0 x1)).
Theorem missingprop_86f999703c959ac1a09b9a2f8c8569486819c7a0e8c3e93bae8fc39828c240f0 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p EquivReln BinRelnHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
