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
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Definition tuple_p : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, x2 = setsum x4 x6 -> x5) -> x5) -> x3) -> x3)).
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Axiom set_ext : (forall x0 x1, x0 c= x1 -> x1 c= x0 -> x0 = x1).
Axiom lamI : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, x3 :e x1 x2 -> setsum x2 x3 :e lam x0 x1)).
Axiom apI : (forall x0 x1 x2, setsum x1 x2 :e x0 -> x2 :e ap x0 x1).
Axiom lamE : (forall x0, forall x1 : set -> set, forall x2, x2 :e lam x0 x1 -> (forall x3 : prop, (forall x4, and (x4 :e x0) (forall x5 : prop, (forall x6, and (x6 :e x1 x4) (x2 = setsum x4 x6) -> x5) -> x5) -> x3) -> x3)).
Axiom apE : (forall x0 x1 x2, x2 :e ap x0 x1 -> setsum x1 x2 :e x0).
Theorem missingprop_214e605da056dadef5daf9b0d158a4ef0cf22c6dec72467d2b450a0dea764590 : (forall x0 x1, tuple_p x0 x1 -> x1 = lam x0 (ap x1)).
admit.
Qed.
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_b7aad2e01e1e20b64208a2fea5f9d5ca86fd809eaa2ae0b60fa6f7c4ea08bacd : (forall x0, forall x1 : set -> set, tuple_p x0 (lam x0 x1)).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition missingname_2cc59ad7dda106b509dcb1f32df804c6d8211b768f557e6c1c51cc2df6180396 : set -> (set -> set) -> set -> prop :=
 (fun x0 : set => fun x1 : set -> set => fun x2 : set => forall x3 : set -> prop, (forall x4, x4 :e x0 -> (forall x5, tuple_p (x1 x4) x5 -> (forall x6, x6 :e x1 x4 -> x3 (ap x5 x6)) -> x3 (lam 2 (fun x6 : set => If_i (x6 = 0) x4 x5)))) -> x3 x2).
Theorem missingprop_ed3562c3cc27039b6bf218421c9238ae64a1c1c7e7329d5c626a1feffa8c1921 : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, tuple_p (x1 x2) x3 -> (forall x4, x4 :e x1 x2 -> missingname_2cc59ad7dda106b509dcb1f32df804c6d8211b768f557e6c1c51cc2df6180396 x0 x1 (ap x3 x4)) -> missingname_2cc59ad7dda106b509dcb1f32df804c6d8211b768f557e6c1c51cc2df6180396 x0 x1 (lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3)))).
admit.
Qed.
Theorem missingprop_9b1382fd828c310f237a34618b8aad95180eb391959d046ef1956fa7f3460a59 : (forall x0, forall x1 : set -> set, forall x2 : set -> prop, (forall x3, x3 :e x0 -> (forall x4, tuple_p (x1 x3) x4 -> (forall x5, x5 :e x1 x3 -> missingname_2cc59ad7dda106b509dcb1f32df804c6d8211b768f557e6c1c51cc2df6180396 x0 x1 (ap x4 x5)) -> (forall x5, x5 :e x1 x3 -> x2 (ap x4 x5)) -> x2 (lam 2 (fun x5 : set => If_i (x5 = 0) x3 x4)))) -> (forall x3, missingname_2cc59ad7dda106b509dcb1f32df804c6d8211b768f557e6c1c51cc2df6180396 x0 x1 x3 -> x2 x3)).
admit.
Qed.
(* Parameter ZF_closed "43f34d6a2314b56cb12bf5cf84f271f3f02a3e68417b09404cc73152523dbfa0" "1bd4aa0ec0b5e627dce9a8a1ddae929e58109ccbb6f4bb3d08614abf740280c0" *)
Parameter ZF_closed : set -> prop.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom ZF_ordsucc_closed : (forall x0, ZF_closed x0 -> (forall x1, x1 :e x0 -> ordsucc x1 :e x0)).
Theorem missingprop_79d5b41f0dcf32b9d9037781ca155b625d84c7a59be9fd2f760cb594e4cdaa69 : (forall x0, ZF_closed x0 -> 0 :e x0 -> (forall x1, nat_p x1 -> x1 :e x0)).
admit.
Qed.
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom missingprop_d9ae82204b18e6cf15c85d865639887282bf3ebbe7f609859927820b6a09adb1 : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> lam x1 x2 :e x0))).
Theorem missingprop_907e5d06a6b2bc734b7a7ddcb472ccf64af6b48c6f2955dc95c2cd40b0a7420f : (forall x0, TransSet x0 -> ZF_closed x0 -> (forall x1, x1 :e x0 -> (forall x2, tuple_p x1 x2 -> (forall x3, x3 :e x1 -> ap x2 x3 :e x0) -> x2 :e x0))).
admit.
Qed.
Axiom nat_2 : nat_p 2.
Axiom tuple_p_2_tuple : (forall x0 x1, tuple_p 2 (lam 2 (fun x2 : set => If_i (x2 = 0) x0 x1))).
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom tuple_2_0_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0) x0 -> x2 x0 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 0)).
Axiom tuple_2_1_eq : (forall x0 x1, forall x2 : set -> set -> prop, x2 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1) x1 -> x2 x1 (ap (lam 2 (fun x3 : set => If_i (x3 = 0) x0 x1)) 1)).
Theorem missingprop_01e489ef49a5abff8a57f5263f07314025d4dc630bb6e2f317e9171009ca8dc8 : (forall x0, TransSet x0 -> ZF_closed x0 -> 0 :e x0 -> (forall x1, x1 :e x0 -> (forall x2 : set -> set, (forall x3, x3 :e x1 -> x2 x3 :e x0) -> (forall x3, missingname_2cc59ad7dda106b509dcb1f32df804c6d8211b768f557e6c1c51cc2df6180396 x1 x2 x3 -> x3 :e x0)))).
admit.
Qed.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
(* Parameter famunion "d772b0f5d472e1ef525c5f8bd11cf6a4faed2e76d4eacfa455f4d65cc24ec792" "b3e3bf86a58af5d468d398d3acad61ccc50261f43c856a68f8594967a06ec07a" *)
Parameter famunion : set -> (set -> set) -> set.
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Definition missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 : set -> (set -> set) -> set :=
 (fun x0 : set => fun x1 : set -> set => Sep (UnivOf (UPair x0 (famunion x0 (fun x2 : set => Sing (x1 x2))))) (missingname_2cc59ad7dda106b509dcb1f32df804c6d8211b768f557e6c1c51cc2df6180396 x0 x1)).
Axiom SepE2 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x1 x2).
Theorem missingprop_9d3883c96dd9b5c53e4f6141d750f76e58929b6b233cf6b1779125f19b767e11 : (forall x0, forall x1 : set -> set, forall x2, x2 :e missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 x0 x1 -> missingname_2cc59ad7dda106b509dcb1f32df804c6d8211b768f557e6c1c51cc2df6180396 x0 x1 x2).
admit.
Qed.
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom UnivOf_TransSet : (forall x0, TransSet (UnivOf x0)).
Axiom UnivOf_ZF_closed : (forall x0, ZF_closed (UnivOf x0)).
Axiom missingprop_1bcb0376aad766d016ee9f0693d3212cc24924141721dea50bf523c306096bab : (forall x0 x1, x1 :e UnivOf x0 -> (forall x2, x2 c= x1 -> x2 :e UnivOf x0)).
Axiom UnivOf_In : (forall x0, x0 :e UnivOf x0).
Axiom Subq_Empty : (forall x0, 0 c= x0).
Axiom famunionI : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e x0 -> x3 :e x1 x2 -> x3 :e famunion x0 x1).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom UPairI2 : (forall x0 x1, x1 :e UPair x0 x1).
Axiom UPairI1 : (forall x0 x1, x0 :e UPair x0 x1).
Theorem missingprop_a09e2d42c260dbb4e7d78819c18a31c6bb7fc9197f49b10e3eb42edd432f4e04 : (forall x0, forall x1 : set -> set, forall x2, missingname_2cc59ad7dda106b509dcb1f32df804c6d8211b768f557e6c1c51cc2df6180396 x0 x1 x2 -> x2 :e missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 x0 x1).
admit.
Qed.
Theorem missingprop_f9f7f36b256ee5022d975788009d4c406b63c7d7fc85dc77b1112d548d8ed23a : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> (forall x3, tuple_p (x1 x2) x3 -> (forall x4, x4 :e x1 x2 -> ap x3 x4 :e missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 x0 x1) -> lam 2 (fun x4 : set => If_i (x4 = 0) x2 x3) :e missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 x0 x1)).
admit.
Qed.
Theorem missingprop_65880fc9b48bb00c7fa40a7cbb81970d0089e79d340752d8478eec02a585f2ec : (forall x0, forall x1 : set -> set, forall x2 : set -> prop, (forall x3, x3 :e x0 -> (forall x4, tuple_p (x1 x3) x4 -> (forall x5, x5 :e x1 x3 -> ap x4 x5 :e missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 x0 x1) -> (forall x5, x5 :e x1 x3 -> x2 (ap x4 x5)) -> x2 (lam 2 (fun x5 : set => If_i (x5 = 0) x3 x4)))) -> (forall x3, x3 :e missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 x0 x1 -> x2 x3)).
admit.
Qed.
Definition missingname_35b91d0b9edf3632a83c30e8f2dcb5e03ee6431724e480c91fa5ef9ae88d0d2f : set -> (set -> set) -> (set -> set -> set -> set) -> set -> set -> prop :=
 (fun x0 : set => fun x1 : set -> set => fun x2 : set -> set -> set -> set => fun x3 x4 : set => forall x5 : set -> set -> prop, (forall x6, x6 :e x0 -> (forall x7, tuple_p (x1 x6) x7 -> (forall x8 : set -> set, (forall x9, x9 :e x1 x6 -> x5 (ap x7 x9) (x8 x9)) -> x5 (lam 2 (fun x9 : set => If_i (x9 = 0) x6 x7)) (x2 x6 x7 (lam (x1 x6) x8))))) -> x5 x3 x4).
Theorem missingprop_412f171b3ca442889854b1b6db1f4b4c229650705be86611715b49239feb0217 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> set -> set, forall x3, x3 :e x0 -> (forall x4, tuple_p (x1 x3) x4 -> (forall x5 : set -> set, (forall x6, x6 :e x1 x3 -> missingname_35b91d0b9edf3632a83c30e8f2dcb5e03ee6431724e480c91fa5ef9ae88d0d2f x0 x1 x2 (ap x4 x6) (x5 x6)) -> missingname_35b91d0b9edf3632a83c30e8f2dcb5e03ee6431724e480c91fa5ef9ae88d0d2f x0 x1 x2 (lam 2 (fun x6 : set => If_i (x6 = 0) x3 x4)) (x2 x3 x4 (lam (x1 x3) x5))))).
admit.
Qed.
Theorem missingprop_37fd53e9c4057a35818d15278ac7ecde5930df6a5519cd34c128a3ae528343a4 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> set -> set, forall x3 : set -> set -> prop, (forall x4, x4 :e x0 -> (forall x5, tuple_p (x1 x4) x5 -> (forall x6 : set -> set, (forall x7, x7 :e x1 x4 -> missingname_35b91d0b9edf3632a83c30e8f2dcb5e03ee6431724e480c91fa5ef9ae88d0d2f x0 x1 x2 (ap x5 x7) (x6 x7)) -> (forall x7, x7 :e x1 x4 -> x3 (ap x5 x7) (x6 x7)) -> x3 (lam 2 (fun x7 : set => If_i (x7 = 0) x4 x5)) (x2 x4 x5 (lam (x1 x4) x6))))) -> (forall x4 x5, missingname_35b91d0b9edf3632a83c30e8f2dcb5e03ee6431724e480c91fa5ef9ae88d0d2f x0 x1 x2 x4 x5 -> x3 x4 x5)).
admit.
Qed.
Axiom Eps_i_ex : (forall x0 : set -> prop, (forall x1 : prop, (forall x2, x0 x2 -> x1) -> x1) -> x0 (Eps_i x0)).
Theorem missingprop_e4f6484ffbc2d471a495e328d25286ba48e9116ed79c963b7f06599e26869546 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> set -> set, forall x3, x3 :e missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 x0 x1 -> (forall x4 : prop, (forall x5, missingname_35b91d0b9edf3632a83c30e8f2dcb5e03ee6431724e480c91fa5ef9ae88d0d2f x0 x1 x2 x3 x5 -> x4) -> x4)).
admit.
Qed.
Definition missingname_ca2bee03685880db5d300f5a255e57da6e3111582936506c96f92b9f81d1cc9c : set -> (set -> set) -> (set -> set -> set -> set) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set => fun x2 : set -> set -> set -> set => fun x3 : set => Eps_i (missingname_35b91d0b9edf3632a83c30e8f2dcb5e03ee6431724e480c91fa5ef9ae88d0d2f x0 x1 x2 x3)).
Theorem missingprop_03ad61398f54e37bfd82dffa2ce54388ff5b8c10906a7eece980192a0754f675 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> set -> set, forall x3, x3 :e missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 x0 x1 -> missingname_35b91d0b9edf3632a83c30e8f2dcb5e03ee6431724e480c91fa5ef9ae88d0d2f x0 x1 x2 x3 (missingname_ca2bee03685880db5d300f5a255e57da6e3111582936506c96f92b9f81d1cc9c x0 x1 x2 x3)).
admit.
Qed.
Axiom tuple_2_inj : (forall x0 x1 x2 x3, lam 2 (fun x5 : set => If_i (x5 = 0) x0 x1) = lam 2 (fun x5 : set => If_i (x5 = 0) x2 x3) -> and (x0 = x2) (x1 = x3)).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Theorem missingprop_7a71f3a0731394e6a0eaedc69e45f2fcf8a1da06bc07aeb04d21038798d39d0f : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> set -> set, forall x3, x3 :e missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 x0 x1 -> (forall x4, missingname_35b91d0b9edf3632a83c30e8f2dcb5e03ee6431724e480c91fa5ef9ae88d0d2f x0 x1 x2 x3 x4 -> (forall x5 x6, missingname_35b91d0b9edf3632a83c30e8f2dcb5e03ee6431724e480c91fa5ef9ae88d0d2f x0 x1 x2 x5 x6 -> x3 = x5 -> x4 = x6))).
admit.
Qed.
Theorem missingprop_53d843d2a9a97b81c63442773b924466f18b73da6f4d676fc591b9f67194a702 : (forall x0, forall x1 : set -> set, forall x2 : set -> set -> set -> set, forall x3, x3 :e x0 -> (forall x4, tuple_p (x1 x3) x4 -> (forall x5, x5 :e x1 x3 -> ap x4 x5 :e missingname_b106b70535d56ec28a149e4c343c15ad35894d806d2d1fa567f0678ecb37ca88 x0 x1) -> missingname_ca2bee03685880db5d300f5a255e57da6e3111582936506c96f92b9f81d1cc9c x0 x1 x2 (lam 2 (fun x6 : set => If_i (x6 = 0) x3 x4)) = x2 x3 x4 (lam (x1 x3) (fun x6 : set => missingname_ca2bee03685880db5d300f5a255e57da6e3111582936506c96f92b9f81d1cc9c x0 x1 x2 (ap x4 x6))))).
admit.
Qed.
