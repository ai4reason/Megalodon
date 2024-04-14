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
(* Parameter pack_b "e007d96601771e291e9083ce21b5e97703bce4ff5257fec59b7ed3dbb05b5319" "855387af88aad68b5f942a3a97029fcd79fe0a4e781cdf546d058297f8a483ce" *)
Parameter pack_b : set -> (set -> set -> set) -> set.
Definition struct_b : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> x1 (pack_b x2 x3)) -> x1 x0).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition MetaCat_initial_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => and (Obj x4) (forall x6, Obj x6 -> and (Hom x4 x6 (x5 x6)) (forall x7, Hom x4 x6 x7 -> x7 = x5 x6))).
(* Parameter MagmaHom "a84fd92c3d7f64da963df3dac4615300170cb17ff896ccef2f8dd00066ec3d02" "e815783558526a66c8f279c485040d57663745bc5f9348b1ebc671af74c2a305" *)
Parameter MagmaHom : set -> set -> set -> prop.
(* Parameter struct_id "ddbfe293c94f63568d97903ab92695c5b104ee51e1b7d4e7dd29a87510065054" "ac22e99093b43e0b6246d1a60c33b72b22acf28c29494701ebd52fa3ba6ac8bc" *)
Parameter struct_id : set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
Definition struct_comp : set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam_comp (ap x0 Empty)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom missingprop_7ee20a9b005b9d1cb4acab7f037a1615344131a99780aaa35f8fa78a1fc7660f : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4, forall x5 : prop -> prop -> prop, x5 (MagmaHom (pack_b x0 x2) (pack_b x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> ap x4 (x2 x6 x7) = x3 (ap x4 x6) (ap x4 x7)))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> ap x4 (x2 x6 x7) = x3 (ap x4 x6) (ap x4 x7)))) (MagmaHom (pack_b x0 x2) (pack_b x1 x3) x4)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 Empty).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Theorem missingprop_bcecd31c43f08102a5dbeba9f564468d78a0f8f72c35b7e854348988607dabb0 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> x0 (pack_b Empty (fun x1 x2 : set => x1)) -> MetaCat_initial_p x0 MagmaHom struct_id struct_comp (pack_b Empty (fun x1 x2 : set => x1)) (fun x1 : set => lam Empty (fun x2 : set => x2))).
admit.
Qed.
Axiom pack_struct_b_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> struct_b (pack_b x0 x1)).
Theorem missingprop_9513dd91ec80c448a164d7be122124529288295f102d8e66870ba91681ff82c3 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p struct_b MagmaHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 : set => fun x5 : set -> set => and (Obj x4) (forall x6, Obj x6 -> and (Hom x6 x4 (x5 x6)) (forall x7, Hom x6 x4 x7 -> x7 = x5 x6))).
Axiom pack_b_0_eq2 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 x0 (ap (pack_b x0 x1) 0) -> x2 (ap (pack_b x0 x1) 0) x0).
Axiom In_0_1 : 0 :e 1.
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom eq_1_Sing0 : 1 = Sing 0.
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Theorem missingprop_b85684d5d13773c983896044d4d43e914e6f740191b490f214049d237f32dd7c : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> x0 (pack_b 1 (fun x1 x2 : set => x1)) -> MetaCat_terminal_p x0 MagmaHom struct_id struct_comp (pack_b 1 (fun x1 x2 : set => x1)) (fun x1 : set => lam (ap x1 0) (fun x2 : set => 0))).
admit.
Qed.
Theorem missingprop_20fce0677bd90d0454ad260d09f88555cfae28d87869596d59a101bd12cde55e : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p struct_b MagmaHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter unpack_b_i "2890e728fd41ee56580615f32603326f19352dda5a1deea69ef696e560d62300" "b3bb92bcc166500c6f6465bf41e67a407d3435b2ce2ac6763fb02fac8e30640e" *)
Parameter unpack_b_i : set -> (set -> (set -> set -> set) -> set) -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b : set -> set -> set :=
 (fun x0 x1 : set => unpack_b_i x0 (fun x2 : set => fun x3 : set -> set -> set => unpack_b_i x1 (fun x4 : set => fun x5 : set -> set -> set => pack_b (setprod x2 x4) (fun x6 x7 : set => lam 2 (fun x8 : set => If_i (x8 = 0) (x3 (ap x6 0) (ap x7 0)) (x5 (ap x6 1) (ap x7 1))))))).
Axiom unpack_b_i_eq : (forall x0 : set -> (set -> set -> set) -> set, forall x1, forall x2 : set -> set -> set, (forall x3 : set -> set -> set, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x4 x5 = x3 x4 x5)) -> x0 x1 x3 = x0 x1 x2) -> unpack_b_i (pack_b x1 x2) x0 = x0 x1 x2).
Axiom pack_b_ext : (forall x0, forall x1 x2 : set -> set -> set, (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x1 x3 x4 = x2 x3 x4)) -> pack_b x0 x1 = pack_b x0 x2).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Theorem missingprop_84b7a40932bac82c3ecf4fa49a1bea60dc509b45bddc18bf9510d8d39709513f : (forall x0, forall x1 : set -> set -> set, forall x2, forall x3 : set -> set -> set, forall x4 : set -> set -> prop, x4 (missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b (pack_b x0 x1) (pack_b x2 x3)) (pack_b (setprod x0 x2) (fun x5 x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (x1 (ap x5 0) (ap x6 0)) (x3 (ap x5 1) (ap x6 1))))) -> x4 (pack_b (setprod x0 x2) (fun x5 x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (x1 (ap x5 0) (ap x6 0)) (x3 (ap x5 1) (ap x6 1))))) (missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b (pack_b x0 x1) (pack_b x2 x3))).
admit.
Qed.
Axiom tuple_2_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e lam x0 x1)).
Theorem missingprop_baf3fc1e43a364c6a747235fea11365553a8a91f3fbc9bcc7c3dbf5bc88e8597 : (forall x0 x1, struct_b x0 -> struct_b x1 -> struct_b (missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b x0 x1)).
admit.
Qed.
Definition MetaCat_product_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> (set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 : set => fun x9 : set -> set -> set -> set => and (and (and (and (and (Obj x4) (Obj x5)) (Obj x6)) (Hom x6 x4 x7)) (Hom x6 x5 x8)) (forall x10, Obj x10 -> (forall x11 x12, Hom x10 x4 x11 -> Hom x10 x5 x12 -> and (and (and (Hom x10 x6 (x9 x10 x11 x12)) (Comp x10 x6 x4 x7 (x9 x10 x11 x12) = x11)) (Comp x10 x6 x5 x8 (x9 x10 x11 x12) = x12)) (forall x13, Hom x10 x6 x13 -> Comp x10 x6 x4 x7 x13 = x11 -> Comp x10 x6 x5 x8 x13 = x12 -> x13 = x9 x10 x11 x12)))).
Definition MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 : set -> set -> set => fun x7 : set -> set -> set -> set -> set -> set => forall x8 x9, Obj x8 -> Obj x9 -> MetaCat_product_p Obj Hom Id Comp x8 x9 (x4 x8 x9) (x5 x8 x9) (x6 x8 x9) (x7 x8 x9)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom and4I : (forall x0 x1 x2 x3 : prop, x0 -> x1 -> x2 -> x3 -> and (and (and x0 x1) x2) x3).
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Axiom and6I : (forall x0 x1 x2 x3 x4 x5 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> and (and (and (and (and x0 x1) x2) x3) x4) x5).
Theorem missingprop_eb47bb5cd73cad8b4ef0b3375f134d111d4de0e7e5fceab966d004fbffa38e8d : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b x1 x2)) -> MetaCat_product_constr_p x0 MagmaHom struct_id struct_comp missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 0)) (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 1)) (fun x1 x2 x3 x4 x5 : set => lam (ap x3 0) (fun x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (ap x4 x6) (ap x5 x6))))).
admit.
Qed.
Theorem missingprop_53884a94e940093dbe9b1c1e01e2caa51e8b562388e91cfac0614b506dc49d9c : MetaCat_product_constr_p struct_b MagmaHom struct_id struct_comp missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b (fun x0 x1 : set => lam (setprod (ap x0 0) (ap x1 0)) (fun x2 : set => ap x2 0)) (fun x0 x1 : set => lam (setprod (ap x0 0) (ap x1 0)) (fun x2 : set => ap x2 1)) (fun x0 x1 x2 x3 x4 : set => lam (ap x2 0) (fun x5 : set => lam 2 (fun x6 : set => If_i (x6 = 0) (ap x3 x5) (ap x4 x5)))).
admit.
Qed.
Theorem missingprop_d64c39226526628145b86e9223e08aecec3869793d2381afbab7431e95412a95 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p struct_b MagmaHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition missingname_9375f3488fbda29540c9e42afd4900f9ea67af8ac1d360ef40205b31d0145793 : set -> set -> set -> set -> set :=
 (fun x0 x1 x2 x3 : set => unpack_b_i x0 (fun x4 : set => pack_b (Sep x4 (fun x5 : set => forall x6 : set -> set -> prop, x6 (ap x2 x5) (ap x3 x5) -> x6 (ap x3 x5) (ap x2 x5))))).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Theorem missingprop_ac49af660090a93b0ebf613437ff5380c9f4e4f2f4d6727c5669ef6268bdbd2e : (forall x0, forall x1 : set -> set -> set, forall x2 x3 x4, forall x5 : set -> set -> prop, x5 (missingname_9375f3488fbda29540c9e42afd4900f9ea67af8ac1d360ef40205b31d0145793 (pack_b x0 x1) x2 x3 x4) (pack_b (Sep x0 (fun x6 : set => forall x7 : set -> set -> prop, x7 (ap x3 x6) (ap x4 x6) -> x7 (ap x4 x6) (ap x3 x6))) x1) -> x5 (pack_b (Sep x0 (fun x6 : set => forall x7 : set -> set -> prop, x7 (ap x3 x6) (ap x4 x6) -> x7 (ap x4 x6) (ap x3 x6))) x1) (missingname_9375f3488fbda29540c9e42afd4900f9ea67af8ac1d360ef40205b31d0145793 (pack_b x0 x1) x2 x3 x4)).
admit.
Qed.
Definition MetaCat_equalizer_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 : set => fun x10 : set -> set -> set => and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (Hom x4 x5 x7)) (Obj x8)) (Hom x8 x4 x9)) (Comp x8 x4 x5 x6 x9 = Comp x8 x4 x5 x7 x9)) (forall x11, Obj x11 -> (forall x12, Hom x11 x4 x12 -> Comp x11 x4 x5 x6 x12 = Comp x11 x4 x5 x7 x12 -> and (and (Hom x11 x8 (x10 x11 x12)) (Comp x11 x8 x4 x9 (x10 x11 x12) = x12)) (forall x13, Hom x11 x8 x13 -> Comp x11 x8 x4 x9 x13 = x12 -> x13 = x10 x11 x12)))).
Definition MetaCat_equalizer_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 : set -> set -> set -> set -> set => fun x6 : set -> set -> set -> set -> set -> set -> set => forall x7 x8, Obj x7 -> Obj x8 -> (forall x9 x10, Hom x7 x8 x9 -> Hom x7 x8 x10 -> MetaCat_equalizer_p Obj Hom Id Comp x7 x8 x9 x10 (x4 x7 x8 x9 x10) (x5 x7 x8 x9 x10) (x6 x7 x8 x9 x10))).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Axiom missingprop_9981628fee84bcf70587ffb7933bd9c35042a1a594a2ae21c28e38ea11e09d6a : (forall x0 x1 x2 x3 x4 x5 x6 x7 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7).
Theorem missingprop_e61ba9aff4fd349c1c42f2a34d877d749901dbe2942e4d83737a99cb0fa8568b : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> (forall x1 x2 x3 x4, x0 x1 -> x0 x2 -> MagmaHom x1 x2 x3 -> MagmaHom x1 x2 x4 -> x0 (missingname_9375f3488fbda29540c9e42afd4900f9ea67af8ac1d360ef40205b31d0145793 x1 x2 x3 x4)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p x0 MagmaHom struct_id struct_comp x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Theorem missingprop_9ae50e20818be24e83feab8446d73e9df96ee358b7d80e64a0e2f213eb2bafb4 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p struct_b MagmaHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_cb8d374538fe4eed29e0b446edf32f6afed5fe007be224a383b378d00bb23030 : MetaCat struct_b MagmaHom struct_id struct_comp.
(* Parameter MetaCat_pullback_struct_p "0aae59672cd58c2e839eeb483f6d823f8c69400c45e67edc458d965b50b1e024" "c0b415a5b0463ba8aadaf1461fdc1f965c8255153af1d823b1bbd04f8393b554" *)
Parameter MetaCat_pullback_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_9a59ecd7e83aeba0d4be9a32b55c5c57c6083b63a3b259e3f5889e4923a1993d : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p x0 x1 x2 x3 x5 x7 x9 -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4)).
Theorem missingprop_7fc78e0407eeffc7336eb5bd7da3580d3da0b4efb7b75129126666b84ded661d : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p struct_b MagmaHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
