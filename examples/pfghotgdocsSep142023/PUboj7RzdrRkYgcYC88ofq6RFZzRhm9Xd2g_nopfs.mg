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
(* Parameter pack_u "9575c80a2655d3953184d74d13bd5860d4f415acbfc25d279378b4036579af65" "119d13725af3373dd508f147836c2eff5ff5acf92a1074ad6c114b181ea8a933" *)
Parameter pack_u : set -> (set -> set) -> set.
Definition struct_u : set -> prop :=
 (fun x0 : set => forall x1 : set -> prop, (forall x2, forall x3 : set -> set, (forall x4, x4 :e x2 -> x3 x4 :e x2) -> x1 (pack_u x2 x3)) -> x1 x0).
(* Parameter MetaCat_initial_p "469fedb3c0890bbe6f1968a679e8940fd80553c3929ed17a6b7130c588aa8e13" "a7ed72144cefda0957baa33b821766b4dfe468731094cdca6edcf0a9613fc7c8" *)
Parameter MetaCat_initial_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
(* Parameter UnaryFuncHom "96edb4f2610efd412654278db08e16550670a674fc2dc2b8ce6e73dcc46bbeab" "9579111144263dda4d1a69686bd1cd9e0ef4ffaecf2b279cf431d0a9e36f67ab" *)
Parameter UnaryFuncHom : set -> set -> set -> prop.
(* Parameter struct_id "ddbfe293c94f63568d97903ab92695c5b104ee51e1b7d4e7dd29a87510065054" "ac22e99093b43e0b6246d1a60c33b72b22acf28c29494701ebd52fa3ba6ac8bc" *)
Parameter struct_id : set -> set.
(* Parameter struct_comp "083de41b8563c219f20c031d31476936c0d8efb368f1cc435222350877aea8c7" "1d1c1c340eef2e4f17fd68c23ff42742c492212f4387d13a5eb5c85697990717" *)
Parameter struct_comp : set -> set -> set -> set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Axiom missingprop_c7314f2432739dec7e3d09b8b84398b3dfe5e7bfe33d21fac0129a984e9f917e : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_u x1) -> x0 (pack_u Empty (fun x1 : set => x1)) -> MetaCat_initial_p x0 UnaryFuncHom struct_id struct_comp (pack_u Empty (fun x1 : set => x1)) (fun x1 : set => lam Empty (fun x2 : set => x2))).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter MetaCat_terminal_p "e188a394359450645dfdce85a0b30e951da4f945117188395c3ab12bb228e33d" "fdae77d1a5079ae1a09aaeb23343f4bd6081907e9fe81a573b7244a35af0d909" *)
Parameter MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom missingprop_4c2c2f02b7bba52d2c2d534bff462776dfb77dde8f7d02ce4d576ba29cf94915 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_u x1) -> x0 (pack_u 1 (fun x1 : set => x1)) -> MetaCat_terminal_p x0 UnaryFuncHom struct_id struct_comp (pack_u 1 (fun x1 : set => x1)) (fun x1 : set => lam (ap x1 0) (fun x2 : set => 0))).
(* Parameter missingname_86f6b28b2b2a1b90a5036bb57cb5f553f82ab78abb048d7e2522f53d81acbd88 "61615bbcd83cd6e76a996b08056ac5bd3cd58b6c5b586478d704bf0537a4748b" "86f6b28b2b2a1b90a5036bb57cb5f553f82ab78abb048d7e2522f53d81acbd88" *)
Parameter missingname_86f6b28b2b2a1b90a5036bb57cb5f553f82ab78abb048d7e2522f53d81acbd88 : set -> set -> set.
Definition setprod : set -> set -> set :=
 (fun x0 x1 : set => lam x0 (fun x2 : set => x1)).
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom missingprop_d4e4b2b932101a362c6dcbb7a861a9344a66a83ebdf6fb8c344e912c8c3c1d9a : (forall x0, forall x1 : set -> set, forall x2, forall x3 : set -> set, forall x4 : set -> set -> prop, x4 (missingname_86f6b28b2b2a1b90a5036bb57cb5f553f82ab78abb048d7e2522f53d81acbd88 (pack_u x0 x1) (pack_u x2 x3)) (pack_u (setprod x0 x2) (fun x5 : set => lam 2 (fun x6 : set => If_i (x6 = 0) (x1 (ap x5 0)) (x3 (ap x5 1))))) -> x4 (pack_u (setprod x0 x2) (fun x5 : set => lam 2 (fun x6 : set => If_i (x6 = 0) (x1 (ap x5 0)) (x3 (ap x5 1))))) (missingname_86f6b28b2b2a1b90a5036bb57cb5f553f82ab78abb048d7e2522f53d81acbd88 (pack_u x0 x1) (pack_u x2 x3))).
(* Parameter MetaCat_product_constr_p "174a19a576b89f1308ff59f6dd7de2117117f98e28682f4bbd15fbb1975ae6f0" "8627a945e60408d81c3094008f07f651db6b692c34fa1ffa9753e39b66d38044" *)
Parameter MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_885912b9bf5d57996dd171d0ae8acb2a108c6e54f48c2b0ffc8b58f100f1bbea : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_u x1) -> (forall x1 x2, x0 x1 -> x0 x2 -> x0 (missingname_86f6b28b2b2a1b90a5036bb57cb5f553f82ab78abb048d7e2522f53d81acbd88 x1 x2)) -> MetaCat_product_constr_p x0 UnaryFuncHom struct_id struct_comp missingname_86f6b28b2b2a1b90a5036bb57cb5f553f82ab78abb048d7e2522f53d81acbd88 (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 0)) (fun x1 x2 : set => lam (setprod (ap x1 0) (ap x2 0)) (fun x3 : set => ap x3 1)) (fun x1 x2 x3 x4 x5 : set => lam (ap x3 0) (fun x6 : set => lam 2 (fun x7 : set => If_i (x7 = 0) (ap x4 x6) (ap x5 x6))))).
(* Parameter missingname_5464b7e71f123afa197a52bc970117045fff5b6a90742c9eb1ff74c34f0e0c2d "53c61dca9054178c8513437f9e74d9f9b4b0aa10fad14313f0e9d976581ab872" "5464b7e71f123afa197a52bc970117045fff5b6a90742c9eb1ff74c34f0e0c2d" *)
Parameter missingname_5464b7e71f123afa197a52bc970117045fff5b6a90742c9eb1ff74c34f0e0c2d : set -> set -> set -> set -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Axiom missingprop_f4bb4a323312a4b632fa1e16b0c97b44cc82e8e332928b09af21c3ea10e45603 : (forall x0, forall x1 : set -> set, forall x2 x3 x4, forall x5 : set -> set -> prop, x5 (missingname_5464b7e71f123afa197a52bc970117045fff5b6a90742c9eb1ff74c34f0e0c2d (pack_u x0 x1) x2 x3 x4) (pack_u (Sep x0 (fun x6 : set => forall x7 : set -> set -> prop, x7 (ap x3 x6) (ap x4 x6) -> x7 (ap x4 x6) (ap x3 x6))) x1) -> x5 (pack_u (Sep x0 (fun x6 : set => forall x7 : set -> set -> prop, x7 (ap x3 x6) (ap x4 x6) -> x7 (ap x4 x6) (ap x3 x6))) x1) (missingname_5464b7e71f123afa197a52bc970117045fff5b6a90742c9eb1ff74c34f0e0c2d (pack_u x0 x1) x2 x3 x4)).
(* Parameter MetaCat_equalizer_struct_p "f937ba0b5e96a63b3b47a830a64e1aac438ba69213c231806bafe7ffe25a53f4" "57caf1876fca335969cded64be88fe97218f376b2563fa22de6892acebecd6c8" *)
Parameter MetaCat_equalizer_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_dcc815a24b87cf3130afd70cd64a2143fe42bc8fb9cd4174cad915c8a51f1e00 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_u x1) -> (forall x1 x2 x3 x4, x0 x1 -> x0 x2 -> UnaryFuncHom x1 x2 x3 -> UnaryFuncHom x1 x2 x4 -> x0 (missingname_5464b7e71f123afa197a52bc970117045fff5b6a90742c9eb1ff74c34f0e0c2d x1 x2 x3 x4)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p x0 UnaryFuncHom struct_id struct_comp x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter unpack_u_o "22baf0455fa7619b6958e5bd762f4085bae580997860844329722650209d24bf" "eb32c2161bb5020efad8203cd45aa4738a4908823619b55963cc2fd1f9830098" *)
Parameter unpack_u_o : set -> (set -> (set -> set) -> prop) -> prop.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition SelfInjection : set -> prop :=
 (fun x0 : set => and (struct_u x0) (unpack_u_o x0 (fun x1 : set => inj x1 x1))).
Axiom unpack_u_o_eq : (forall x0 : set -> (set -> set) -> prop, forall x1, forall x2 : set -> set, (forall x3 : set -> set, (forall x4, x4 :e x1 -> x2 x4 = x3 x4) -> x0 x1 x3 = x0 x1 x2) -> unpack_u_o (pack_u x1 x2) x0 = x0 x1 x2).
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_a16c1e4668d0beb05131d186b11d5f445a514d4e4db3d676d988ae675bef6e8e : (forall x0, forall x1 : set -> set, forall x2 : prop -> prop -> prop, x2 (unpack_u_o (pack_u x0 x1) (fun x3 : set => inj x3 x3)) (inj x0 x0 x1) -> x2 (inj x0 x0 x1) (unpack_u_o (pack_u x0 x1) (fun x3 : set => inj x3 x3))).
admit.
Qed.
Axiom pack_struct_u_I : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e x0) -> struct_u (pack_u x0 x1)).
Theorem missingprop_afe4ec9c099d22c2baeaca2850cc89467409764fbc77a18c8ff75d652dbea36a : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e x0) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> SelfInjection (pack_u x0 x1)).
admit.
Qed.
Theorem missingprop_2f1d491922dcc2c2c85957b7d88dc1d40484f0719168a164b34095ed29478f03 : (forall x0, SelfInjection x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set, (forall x4, x4 :e x2 -> x3 x4 :e x2) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 = x3 x5 -> x4 = x5)) -> x1 (pack_u x2 x3)) -> x1 x0)).
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
Theorem missingprop_8f462c9c1cbffc69389d27a12f5109105a19018fe5c9253cd1cf6b43f37947e2 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p SelfInjection UnaryFuncHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom cases_1 : (forall x0, x0 :e 1 -> (forall x1 : set -> prop, x1 0 -> x1 x0)).
Theorem missingprop_ff70ce863a9f6829b01a920ea368537fc671ab9114d03d9d9a259ff393906228 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p SelfInjection UnaryFuncHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom tuple_2_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e lam x0 x1)).
Axiom ap0_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 0 :e x0).
Axiom ap1_Sigma : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> ap x2 1 :e x1 (ap x2 0)).
Axiom tuple_2_inj : (forall x0 x1 x2 x3, lam 2 (fun x5 : set => If_i (x5 = 0) x0 x1) = lam 2 (fun x5 : set => If_i (x5 = 0) x2 x3) -> and (x0 = x2) (x1 = x3)).
Axiom tuple_Sigma_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> lam 2 (fun x4 : set => If_i (x4 = 0) (ap x2 0) (ap x2 1)) = x2).
Theorem missingprop_d16054b5a46b72b66b2bb9dbc7cd666d2a1a3d3a0c3b10898d3b0033474cde18 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p SelfInjection UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Axiom missingprop_c0506b7ce99ca057359584255bdeac2239c78bf84c4390e2fc4c72ca99c22cfa : (forall x0 x1, forall x2 x3 : set -> set, forall x4, forall x5 : prop -> prop -> prop, x5 (UnaryFuncHom (pack_u x0 x2) (pack_u x1 x3) x4) (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> ap x4 (x2 x6) = x3 (ap x4 x6))) -> x5 (and (x4 :e setexp x1 x0) (forall x6, x6 :e x0 -> ap x4 (x2 x6) = x3 (ap x4 x6))) (UnaryFuncHom (pack_u x0 x2) (pack_u x1 x3) x4)).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Theorem missingprop_c671edd1a4531bd90b313e69dbf29f5cf070f1aba7fc6b5ba46ca33174251409 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p SelfInjection UnaryFuncHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_a7df09be51260a7802a2d4dba43c36f3ce14e7adc5b5c9b8b2580df2aa5ad63b : MetaCat SelfInjection UnaryFuncHom struct_id struct_comp.
(* Parameter MetaCat_pullback_struct_p "0aae59672cd58c2e839eeb483f6d823f8c69400c45e67edc458d965b50b1e024" "c0b415a5b0463ba8aadaf1461fdc1f965c8255153af1d823b1bbd04f8393b554" *)
Parameter MetaCat_pullback_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_9a59ecd7e83aeba0d4be9a32b55c5c57c6083b63a3b259e3f5889e4923a1993d : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p x0 x1 x2 x3 x5 x7 x9 -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4)).
Theorem missingprop_73858b1febb9f375a218af8933bced81c27f1f678347c69ad76d77bd6b4ab177 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p SelfInjection UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Definition bij : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
Definition Permutation : set -> prop :=
 (fun x0 : set => and (struct_u x0) (unpack_u_o x0 (fun x1 : set => bij x1 x1))).
Axiom bijI : (forall x0 x1, forall x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1) -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4)) -> (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4)) -> bij x0 x1 x2).
Theorem missingprop_00053b5be7c938cfe915b605858ea64749203ef64a80993b9d53100cf0646b4f : (forall x0, forall x1 : set -> set, forall x2 : prop -> prop -> prop, x2 (unpack_u_o (pack_u x0 x1) (fun x3 : set => bij x3 x3)) (bij x0 x0 x1) -> x2 (bij x0 x0 x1) (unpack_u_o (pack_u x0 x1) (fun x3 : set => bij x3 x3))).
admit.
Qed.
Theorem missingprop_ec657b7f97f95410adb1c5a290530d603e515202daab84a65beca23cc201c12b : (forall x0, forall x1 : set -> set, (forall x2, x2 :e x0 -> x1 x2 :e x0) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> x1 x2 = x1 x3 -> x2 = x3)) -> (forall x2, x2 :e x0 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (x1 x4 = x2) -> x3) -> x3)) -> Permutation (pack_u x0 x1)).
admit.
Qed.
Theorem missingprop_649319c4dcc255963657828f25c8a39cf12be12f1c4408c0f2d95776bca32a93 : (forall x0, Permutation x0 -> (forall x1 : set -> prop, (forall x2, forall x3 : set -> set, (forall x4, x4 :e x2 -> x3 x4 :e x2) -> (forall x4, x4 :e x2 -> (forall x5, x5 :e x2 -> x3 x4 = x3 x5 -> x4 = x5)) -> (forall x4, x4 :e x2 -> (forall x5 : prop, (forall x6, and (x6 :e x2) (x3 x6 = x4) -> x5) -> x5)) -> x1 (pack_u x2 x3)) -> x1 x0)).
admit.
Qed.
Theorem missingprop_54ae7b8f206bcc4f0bebf8f069949bce0845082209e86ca3e522b11bb5606f9a : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_aed94d394c0764bd3e66bb218cd2b015c318afc00a4c645b40fdd9f3373a80f3 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Theorem missingprop_6b82cc4f1f3544ac2df4b4ad415f1160315dbeba5abc63ae2f7ac2467f252294 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Theorem missingprop_1c2881379aebcf1eee45af594b5e1f7fde32238b1cf231bfc78f0c2f9b3e76f5 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_struct_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_97a117a3ef894b9fb1eb62c8aa64ff80223ce0478dc6c7c7a52d9ae80a2a2a33 : MetaCat Permutation UnaryFuncHom struct_id struct_comp.
Theorem missingprop_cdc68617960b2b766f5eac820d4f6f2924c27e6af9c047d8238a7f888b292c56 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_struct_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
