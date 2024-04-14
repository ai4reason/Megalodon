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
(* Parameter MetaCat_initial_p "469fedb3c0890bbe6f1968a679e8940fd80553c3929ed17a6b7130c588aa8e13" "a7ed72144cefda0957baa33b821766b4dfe468731094cdca6edcf0a9613fc7c8" *)
Parameter MetaCat_initial_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
(* Parameter MagmaHom "a84fd92c3d7f64da963df3dac4615300170cb17ff896ccef2f8dd00066ec3d02" "e815783558526a66c8f279c485040d57663745bc5f9348b1ebc671af74c2a305" *)
Parameter MagmaHom : set -> set -> set -> prop.
(* Parameter struct_id "ddbfe293c94f63568d97903ab92695c5b104ee51e1b7d4e7dd29a87510065054" "ac22e99093b43e0b6246d1a60c33b72b22acf28c29494701ebd52fa3ba6ac8bc" *)
Parameter struct_id : set -> set.
(* Parameter struct_comp "083de41b8563c219f20c031d31476936c0d8efb368f1cc435222350877aea8c7" "1d1c1c340eef2e4f17fd68c23ff42742c492212f4387d13a5eb5c85697990717" *)
Parameter struct_comp : set -> set -> set -> set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Axiom missingprop_bcecd31c43f08102a5dbeba9f564468d78a0f8f72c35b7e854348988607dabb0 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> x0 (pack_b Empty (fun x1 x2 : set => x1)) -> MetaCat_initial_p x0 MagmaHom struct_id struct_comp (pack_b Empty (fun x1 x2 : set => x1)) (fun x1 : set => lam Empty (fun x2 : set => x2))).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter MetaCat_terminal_p "e188a394359450645dfdce85a0b30e951da4f945117188395c3ab12bb228e33d" "fdae77d1a5079ae1a09aaeb23343f4bd6081907e9fe81a573b7244a35af0d909" *)
Parameter MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom missingprop_b85684d5d13773c983896044d4d43e914e6f740191b490f214049d237f32dd7c : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> x0 (pack_b 1 (fun x1 x2 : set => x1)) -> MetaCat_terminal_p x0 MagmaHom struct_id struct_comp (pack_b 1 (fun x1 x2 : set => x1)) (fun x1 : set => lam (ap x1 0) (fun x2 : set => 0))).
(* Parameter missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b "6c4402a34385d781c71500d4dd7eadd33a08d4201d17fb8cd84f5eee15ec3916" "4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b" *)
Parameter missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b : set -> set -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom missingprop_84b7a40932bac82c3ecf4fa49a1bea60dc509b45bddc18bf9510d8d39709513f : (forall x0, forall x1 : set -> set -> set, forall x2, forall x3 : set -> set -> set, forall x4 : set -> set -> prop, x4 (missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b (pack_b x0 x1) (pack_b x2 x3)) (pack_b (setprod x0 x2) (fun x5 x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (x1 (ap x5 0) (ap x6 0)) (x3 (ap x5 1) (ap x6 1))))) -> x4 (pack_b (setprod x0 x2) (fun x5 x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (x1 (ap x5 0) (ap x6 0)) (x3 (ap x5 1) (ap x6 1))))) (missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b (pack_b x0 x1) (pack_b x2 x3))).
(* Parameter MetaCat_product_constr_p "174a19a576b89f1308ff59f6dd7de2117117f98e28682f4bbd15fbb1975ae6f0" "8627a945e60408d81c3094008f07f651db6b692c34fa1ffa9753e39b66d38044" *)
Parameter MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_eb47bb5cd73cad8b4ef0b3375f134d111d4de0e7e5fceab966d004fbffa38e8d : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b x1 x2)) -> MetaCat_product_constr_p x0 MagmaHom struct_id struct_comp missingname_4a4f5564e1f9c7fb2b12e56a1864cd6c43fcc91411a6f3721b647c2151d1c48b (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 0)) (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 1)) (fun x1 x2 x3 x4 x5 : set => lam (ap x3 0) (fun x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (ap x4 x6) (ap x5 x6))))).
(* Parameter missingname_9375f3488fbda29540c9e42afd4900f9ea67af8ac1d360ef40205b31d0145793 "5859b297cb5cc9c269636d4463f6eea002362fffb3ed217d560882b1ce2791b0" "9375f3488fbda29540c9e42afd4900f9ea67af8ac1d360ef40205b31d0145793" *)
Parameter missingname_9375f3488fbda29540c9e42afd4900f9ea67af8ac1d360ef40205b31d0145793 : set -> set -> set -> set -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom missingprop_ac49af660090a93b0ebf613437ff5380c9f4e4f2f4d6727c5669ef6268bdbd2e : (forall x0, forall x1 : set -> set -> set, forall x2 x3 x4, forall x5 : set -> set -> prop, x5 (missingname_9375f3488fbda29540c9e42afd4900f9ea67af8ac1d360ef40205b31d0145793 (pack_b x0 x1) x2 x3 x4) (pack_b (Sep x0 (fun x6 : set => forall x7 : set -> set -> prop, x7 (ap x3 x6) (ap x4 x6) -> x7 (ap x4 x6) (ap x3 x6))) x1) -> x5 (pack_b (Sep x0 (fun x6 : set => forall x7 : set -> set -> prop, x7 (ap x3 x6) (ap x4 x6) -> x7 (ap x4 x6) (ap x3 x6))) x1) (missingname_9375f3488fbda29540c9e42afd4900f9ea67af8ac1d360ef40205b31d0145793 (pack_b x0 x1) x2 x3 x4)).
(* Parameter MetaCat_equalizer_struct_p "f937ba0b5e96a63b3b47a830a64e1aac438ba69213c231806bafe7ffe25a53f4" "57caf1876fca335969cded64be88fe97218f376b2563fa22de6892acebecd6c8" *)
Parameter MetaCat_equalizer_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_e61ba9aff4fd349c1c42f2a34d877d749901dbe2942e4d83737a99cb0fa8568b : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> (forall x1 x2 x3 x4, x0 x1 -> x0 x2 -> MagmaHom x1 x2 x3 -> MagmaHom x1 x2 x4 -> x0 (missingname_9375f3488fbda29540c9e42afd4900f9ea67af8ac1d360ef40205b31d0145793 x1 x2 x3 x4)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p x0 MagmaHom struct_id struct_comp x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Axiom In_0_1 : 0 :e 1.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_569f409550977198f5ccf4cbea4f1b769b1a85b714e9a8d2e906bfabefd07e7a : (forall x0 : set -> set, x0 0 = 0 -> bij 1 1 x0).
admit.
Qed.
Theorem missingprop_11347f861be6797c71bf1b07d5808a564dc9759de0ed5e9f4f237542cff4649a : (forall x0 x1, forall x2 x3 : set -> set, (forall x4, x4 :e x0 -> x2 x4 = x3 x4) -> bij x0 x1 x2 -> bij x0 x1 x3).
admit.
Qed.
(* Parameter unpack_b_o "0fa2c67750f22ef718feacbb3375b43caa7129d02200572180f9cfe7abf54cec" "0601c1c35ff2c84ae36acdecfae98d553546d98a227f007481baf6b962cc1dc8" *)
Parameter unpack_b_o : set -> (set -> (set -> set -> set) -> prop) -> prop.
Definition Quasigroup : set -> prop :=
 (fun x0 : set => and (struct_b x0) (unpack_b_o x0 (fun x1 : set => fun x2 : set -> set -> set => and (forall x3, x3 :e x1 -> bij x1 x1 (x2 x3)) (forall x3, x3 :e x1 -> bij x1 x1 (fun x4 : set => x2 x4 x3))))).
Axiom unpack_b_o_eq : (forall x0 : set -> (set -> set -> set) -> prop, forall x1, forall x2 : set -> set -> set, (forall x3 : set -> set -> set, (forall x4, x4 :e x1 -> (forall x5, x5 :e x1 -> x2 x4 x5 = x3 x4 x5)) -> x0 x1 x3 = x0 x1 x2) -> unpack_b_o (pack_b x1 x2) x0 = x0 x1 x2).
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Theorem missingprop_b2167d2837715e11967d084f35fa508acd069640c7a7c47aa3f84dfcaa1371b5 : (forall x0, forall x1 : set -> set -> set, forall x2 : prop -> prop -> prop, x2 (unpack_b_o (pack_b x0 x1) (fun x3 : set => fun x4 : set -> set -> set => and (forall x5, x5 :e x3 -> bij x3 x3 (x4 x5)) (forall x5, x5 :e x3 -> bij x3 x3 (fun x6 : set => x4 x6 x5)))) (and (forall x3, x3 :e x0 -> bij x0 x0 (x1 x3)) (forall x3, x3 :e x0 -> bij x0 x0 (fun x4 : set => x1 x4 x3))) -> x2 (and (forall x3, x3 :e x0 -> bij x0 x0 (x1 x3)) (forall x3, x3 :e x0 -> bij x0 x0 (fun x4 : set => x1 x4 x3))) (unpack_b_o (pack_b x0 x1) (fun x3 : set => fun x4 : set -> set -> set => and (forall x5, x5 :e x3 -> bij x3 x3 (x4 x5)) (forall x5, x5 :e x3 -> bij x3 x3 (fun x6 : set => x4 x6 x5))))).
admit.
Qed.
Axiom pack_struct_b_I : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> struct_b (pack_b x0 x1)).
Theorem missingprop_e3d260e78a123ac716d567ab700d9fc3334efbbe9012a4545cf5b7c9b546016d : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2, x2 :e x0 -> bij x0 x0 (x1 x2)) -> (forall x2, x2 :e x0 -> bij x0 x0 (fun x3 : set => x1 x3 x2)) -> Quasigroup (pack_b x0 x1)).
admit.
Qed.
Theorem missingprop_94c3be6982bd677952253aa29af894411b7bd1f90353a0d2fdecf3d31d757dbd : (forall x0, Quasigroup x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 x5 :e x2)) -> (forall x4, x4 :e x2 -> bij x2 x2 (x3 x4)) -> (forall x4, x4 :e x2 -> bij x2 x2 (fun x5 : set => x3 x5 x4)) -> x1 (pack_b x2 x3)) -> x1 x0)).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom EmptyE : (forall x0, nIn x0 0).
Theorem missingprop_b75197451c496482505e03d55f6b7281f7bfb7f61c11c48508aabdd81c33162d : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p Quasigroup MagmaHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_e8ac3e08b9ce3be0aaf05fb2ef8c9c44194b96e8a159ec88f8b2ed2e1b67b2f2 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p Quasigroup MagmaHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Axiom tuple_2_inj : (forall x0 x1 x2 x3, lam 2 (fun x5 : set => If_i (x5 = 0) x0 x1) = lam 2 (fun x5 : set => If_i (x5 = 0) x2 x3) -> and (x0 = x2) (x1 = x3)).
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Axiom tuple_2_setprod : (forall x0 x1 x2, x2 :e x0 -> (forall x3, x3 :e x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e setprod x0 x1)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Axiom tuple_2_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e lam x0 x1)).
Theorem missingprop_f456a6b28a403228d3cc02efff12ad99c90b24514643982c96a491b18d323ebe : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p Quasigroup MagmaHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom missingprop_7ee20a9b005b9d1cb4acab7f037a1615344131a99780aaa35f8fa78a1fc7660f : (forall x0 x1, forall x2 x3 : set -> set -> set, forall x4, forall x5 : prop -> prop -> prop, x5 (MagmaHom (pack_b x0 x2) (pack_b x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> ap x4 (x2 x6 x7) = x3 (ap x4 x6) (ap x4 x7)))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> (forall x7, x7 :e x0 -> ap x4 (x2 x6 x7) = x3 (ap x4 x6) (ap x4 x7)))) (MagmaHom (pack_b x0 x2) (pack_b x1 x3) x4)).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Theorem missingprop_422d84a9aa4eecb2ea178ab0e1d12e0b1a76b35e8bbf6ae00962c4b27ac61fcf : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p Quasigroup MagmaHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_9c0f3e1afa76ce315f77d47a5f99937a75bb29d19734ab916f215622174a2062 : MetaCat Quasigroup MagmaHom struct_id struct_comp.
(* Parameter MetaCat_pullback_struct_p "0aae59672cd58c2e839eeb483f6d823f8c69400c45e67edc458d965b50b1e024" "c0b415a5b0463ba8aadaf1461fdc1f965c8255153af1d823b1bbd04f8393b554" *)
Parameter MetaCat_pullback_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_9a59ecd7e83aeba0d4be9a32b55c5c57c6083b63a3b259e3f5889e4923a1993d : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p x0 x1 x2 x3 x5 x7 x9 -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4)).
Theorem missingprop_733a7a248b4b191e87a1bcd89cd59fee0c3566f1e06e9adc07d1eda9bfad3cad : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p Quasigroup MagmaHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition missingname_10b14720e230e8ddf5f0b6a250d8c3331b576763125dd3abc1a0624cfd90b4dc : set -> prop :=
 (fun x0 : set => and (struct_b x0) (unpack_b_o x0 (fun x1 : set => fun x2 : set -> set -> set => and (and (forall x3 : prop, (forall x4, and (x4 :e x1) (forall x5, x5 :e x1 -> and (x2 x5 x4 = x5) (x2 x4 x5 = x5)) -> x3) -> x3) (forall x3, x3 :e x1 -> bij x1 x1 (x2 x3))) (forall x3, x3 :e x1 -> bij x1 x1 (fun x4 : set => x2 x4 x3))))).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem missingprop_79c8405166f8f53d313e9b10a06ea6c3dfc3e70be1e0a2be4c457f6dd42e2d2d : (forall x0, forall x1 : set -> set -> set, forall x2 : prop -> prop -> prop, x2 (unpack_b_o (pack_b x0 x1) (fun x3 : set => fun x4 : set -> set -> set => and (and (forall x5 : prop, (forall x6, and (x6 :e x3) (forall x7, x7 :e x3 -> and (x4 x7 x6 = x7) (x4 x6 x7 = x7)) -> x5) -> x5) (forall x5, x5 :e x3 -> bij x3 x3 (x4 x5))) (forall x5, x5 :e x3 -> bij x3 x3 (fun x6 : set => x4 x6 x5)))) (and (and (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5, x5 :e x0 -> and (x1 x5 x4 = x5) (x1 x4 x5 = x5)) -> x3) -> x3) (forall x3, x3 :e x0 -> bij x0 x0 (x1 x3))) (forall x3, x3 :e x0 -> bij x0 x0 (fun x4 : set => x1 x4 x3))) -> x2 (and (and (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5, x5 :e x0 -> and (x1 x5 x4 = x5) (x1 x4 x5 = x5)) -> x3) -> x3) (forall x3, x3 :e x0 -> bij x0 x0 (x1 x3))) (forall x3, x3 :e x0 -> bij x0 x0 (fun x4 : set => x1 x4 x3))) (unpack_b_o (pack_b x0 x1) (fun x3 : set => fun x4 : set -> set -> set => and (and (forall x5 : prop, (forall x6, and (x6 :e x3) (forall x7, x7 :e x3 -> and (x4 x7 x6 = x7) (x4 x6 x7 = x7)) -> x5) -> x5) (forall x5, x5 :e x3 -> bij x3 x3 (x4 x5))) (forall x5, x5 :e x3 -> bij x3 x3 (fun x6 : set => x4 x6 x5))))).
admit.
Qed.
Theorem missingprop_16a3063ddfa60a14b1c6ca69023eaa9506c2f6d8adf6ca9427dd90fdc252365e : (forall x0, forall x1 : set -> set -> set, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 x3 :e x0)) -> (forall x2 : prop, (forall x3, and (x3 :e x0) (forall x4, x4 :e x0 -> and (x1 x4 x3 = x4) (x1 x3 x4 = x4)) -> x2) -> x2) -> (forall x2, x2 :e x0 -> bij x0 x0 (x1 x2)) -> (forall x2, x2 :e x0 -> bij x0 x0 (fun x3 : set => x1 x3 x2)) -> missingname_10b14720e230e8ddf5f0b6a250d8c3331b576763125dd3abc1a0624cfd90b4dc (pack_b x0 x1)).
admit.
Qed.
Theorem missingprop_96da142705befb27f4d4cbde3ddc158cfc2a72a13b66b90c3f80ad788d6509a8 : (forall x0, missingname_10b14720e230e8ddf5f0b6a250d8c3331b576763125dd3abc1a0624cfd90b4dc x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set -> set, forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> (forall x6, x6 :e x2 -> x3 x5 x6 :e x2)) -> (forall x5, x5 :e x2 -> and (x3 x5 x4 = x5) (x3 x4 x5 = x5)) -> (forall x5, x5 :e x2 -> bij x2 x2 (x3 x5)) -> (forall x5, x5 :e x2 -> bij x2 x2 (fun x6 : set => x3 x6 x5)) -> x1 (pack_b x2 x3)) -> x1 x0)).
admit.
Qed.
Theorem missingprop_7e7e143773b0f33eeef28258e9ea7ad4f0e3df39081f1ba648550eb21de3835d : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p missingname_10b14720e230e8ddf5f0b6a250d8c3331b576763125dd3abc1a0624cfd90b4dc MagmaHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_8a471b469f51e7275518bd30bccb7b4cb19e74b974b028cdf79c1d4cbc665f9e : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p missingname_10b14720e230e8ddf5f0b6a250d8c3331b576763125dd3abc1a0624cfd90b4dc MagmaHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_506ac0f9d1a76c21790b5dd767b1b8bbb959506568ba8a4211c93fda556a3d15 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p missingname_10b14720e230e8ddf5f0b6a250d8c3331b576763125dd3abc1a0624cfd90b4dc MagmaHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_0638c3b4540642ea0f15fef73263da94e2cb00310bfc6a41a9602ac5c7f1d01e : MetaCat missingname_10b14720e230e8ddf5f0b6a250d8c3331b576763125dd3abc1a0624cfd90b4dc MagmaHom struct_id struct_comp.
Theorem missingprop_995f89b7d5b86ec2b27b9070677df4485545e5fb1c3c10d37f2e33f503207f62 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p missingname_10b14720e230e8ddf5f0b6a250d8c3331b576763125dd3abc1a0624cfd90b4dc MagmaHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
