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
Definition missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 : (set -> set -> prop) -> set -> set -> prop :=
 (fun x0 : set -> set -> prop => fun x1 x2 : set => forall x3 : set -> set -> prop, (forall x4 x5, x0 x4 x5 -> x3 x4 x5) -> (forall x4, x3 x4 x4) -> (forall x4 x5, x3 x4 x5 -> x3 x5 x4) -> (forall x4 x5 x6, x3 x4 x5 -> x3 x5 x6 -> x3 x4 x6) -> x3 x1 x2).
Theorem missingprop_f0c6a23e8b8f78c08ee5fe27237fc8b3f56d1599a38a3401bced9c42269fcbe4 : (forall x0 : set -> set -> prop, forall x1 x2, x0 x1 x2 -> missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 x0 x1 x2).
admit.
Qed.
Definition reflexive : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1, x0 x1 x1).
Theorem missingprop_29cfbf8a9c6eed014dba54148f0cd09cea17c54902b9660d408603b8b7dcd3ba : (forall x0 : set -> set -> prop, reflexive (missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 x0)).
admit.
Qed.
Definition symmetric : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2, x0 x1 x2 -> x0 x2 x1).
Theorem missingprop_7047b95e6173122a3abb1a32266f1489e266d3c8ab3b5c6967895c784d08d3b9 : (forall x0 : set -> set -> prop, symmetric (missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 x0)).
admit.
Qed.
Definition transitive : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => forall x1 x2 x3, x0 x1 x2 -> x0 x2 x3 -> x0 x1 x3).
Theorem missingprop_b4019bc0970596b58612a8ffb42269b10648c70776df5ab173906cbf3999bbc4 : (forall x0 : set -> set -> prop, transitive (missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 x0)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition eqreln : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => and (and (reflexive x0) (symmetric x0)) (transitive x0)).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem missingprop_234a33cb9707b799343bdf00c4c5d8d95dcf8ae07386be63fdf254a2e3ad6458 : (forall x0 : set -> set -> prop, eqreln (missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 x0)).
admit.
Qed.
Definition per : (set -> set -> prop) -> prop :=
 (fun x0 : set -> set -> prop => and (symmetric x0) (transitive x0)).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_416422faec79f572f1ddd22ed75b6eea863e52e3df0f372c7505b48dcaeb1b30 : (forall x0 : set -> set -> prop, per (missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 x0)).
admit.
Qed.
Theorem missingprop_239113fb624d55769ef25b0f2208b74225b6861556ac5c65c37184a647a25afa : (forall x0 x1 : set -> set -> prop, (forall x2 x3, x0 x2 x3 -> x1 x2 x3) -> (forall x2, x1 x2 x2) -> (forall x2 x3, missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 x0 x2 x3 -> x1 x2 x3 -> x1 x3 x2) -> (forall x2 x3 x4, missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 x0 x2 x3 -> x1 x2 x3 -> missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 x0 x3 x4 -> x1 x3 x4 -> x1 x2 x4) -> (forall x2 x3, missingname_85ab634ed22ef46755233128fc3ed530fd87da07c83549dae3fe0211761c72f6 x0 x2 x3 -> x1 x2 x3)).
admit.
Qed.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b : set -> set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 x4 : set => forall x5 : set -> set -> prop, (forall x6, x6 :e x0 -> x5 (ap x1 x6) (ap x2 x6)) -> (forall x6, x5 x6 x6) -> (forall x6 x7, x5 x6 x7 -> x5 x7 x6) -> (forall x6 x7 x8, x5 x6 x7 -> x5 x7 x8 -> x5 x6 x8) -> x5 x3 x4).
Theorem missingprop_4a9ee00be3059282c1c2c04c263a8ef11d5d96bde5e2cce739d1bcaa19845c62 : (forall x0 x1 x2 x3, x3 :e x0 -> missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2 (ap x1 x3) (ap x2 x3)).
admit.
Qed.
Theorem missingprop_f30a9971af522a7c6d48fce7503318aee70245a8fb07686f8a91c05461df8720 : (forall x0 x1 x2, reflexive (missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2)).
admit.
Qed.
Theorem missingprop_6fd31505fe5649eb2fd16580ea5d6e63ee118f3692b3972694e2469c77d587b4 : (forall x0 x1 x2, symmetric (missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2)).
admit.
Qed.
Theorem missingprop_b31e8bac4af8c42397918a9262a41224a434d0e78fc6fb9245dfb70f3b90add1 : (forall x0 x1 x2, transitive (missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2)).
admit.
Qed.
Theorem missingprop_d9d58a931eb77747b7b6b5c76cf24a3e0a9c390de5b51efeb17a41ea3ddef5d2 : (forall x0 x1 x2, eqreln (missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2)).
admit.
Qed.
Theorem missingprop_6c6bb2e866d7edc101ffbff1f8546fdc9b47eb7eb2c1acfa93f697f735be40eb : (forall x0 x1 x2, per (missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2)).
admit.
Qed.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Axiom iff_refl : (forall x0 : prop, iff x0 x0).
Axiom iff_sym : (forall x0 x1 : prop, iff x0 x1 -> iff x1 x0).
Axiom iff_trans : (forall x0 x1 x2 : prop, iff x0 x1 -> iff x1 x2 -> iff x0 x2).
Theorem missingprop_7a88d3bbe6f596fa285aee4cbafebb8affad3f59d76c42f5e20e8494a490393a : (forall x0 x1 x2, x2 :e setexp x1 x0 -> (forall x3, x3 :e setexp x1 x0 -> (forall x4 x5, missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x2 x3 x4 x5 -> iff (x4 :e x1) (x5 :e x1)))).
admit.
Qed.
Theorem missingprop_1916f79d0a2a690541de7d44f79d0ef35c7c99ea77e8fbfe9750fc3d42c80ee6 : (forall x0 x1 x2, x2 :e setexp x1 x0 -> (forall x3, x3 :e setexp x1 x0 -> (forall x4 x5, missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x2 x3 x4 x5 -> x4 :e x1 -> x5 :e x1))).
admit.
Qed.
Theorem missingprop_3316c1ce8324bf85a843581677054d3f0542fd4fa7b2fa8dbd4daa6c86adc555 : (forall x0 x1 x2, forall x3 : set -> set -> prop, (forall x4, x4 :e x0 -> x3 (ap x1 x4) (ap x2 x4)) -> (forall x4, x3 x4 x4) -> (forall x4 x5, missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2 x4 x5 -> x3 x4 x5 -> x3 x5 x4) -> (forall x4 x5 x6, missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2 x4 x5 -> x3 x4 x5 -> missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2 x5 x6 -> x3 x5 x6 -> x3 x4 x6) -> (forall x4 x5, missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2 x4 x5 -> x3 x4 x5)).
admit.
Qed.
Theorem missingprop_b2e114289e6398306b3bcae766ccda4935aee468108b07dbc421b7380a60c36b : (forall x0 x1 x2, forall x3 : set -> set, (forall x4, x4 :e x0 -> x3 (ap x1 x4) = x3 (ap x2 x4)) -> (forall x4 x5, missingname_6094462948795f28b009b77940b5e3c18129670bfd7ad7fb299c54c188c5453b x0 x1 x2 x4 x5 -> x3 x4 = x3 x5)).
admit.
Qed.
(* Parameter Subq "8a8e36b858cd07fc5e5f164d8075dc68a88221ed1e4c9f28dac4a6fdb2172e87" "81c0efe6636cef7bc8041820a3ebc8dc5fa3bc816854d8b7f507e30425fc1cef" *)
Parameter Subq : set -> set -> prop.
Definition MetaCat_coequalizer_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> set -> set -> set -> set -> set -> (set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 x6 x7 x8 x9 : set => fun x10 : set -> set -> set => and (and (and (and (and (and (and (Obj x4) (Obj x5)) (Hom x4 x5 x6)) (Hom x4 x5 x7)) (Obj x8)) (Hom x5 x8 x9)) (Comp x4 x5 x8 x9 x6 = Comp x4 x5 x8 x9 x7)) (forall x11, Obj x11 -> (forall x12, Hom x5 x11 x12 -> Comp x4 x5 x11 x12 x6 = Comp x4 x5 x11 x12 x7 -> and (and (Hom x8 x11 (x10 x11 x12)) (Comp x5 x8 x11 (x10 x11 x12) x9 = x12)) (forall x13, Hom x8 x11 x13 -> Comp x5 x8 x11 x13 x9 = x12 -> x13 = x10 x11 x12)))).
Definition MetaCat_coequalizer_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop :=
 fun Obj : set -> prop => fun Hom : set -> set -> set -> prop => fun Id : set -> set => fun Comp : set -> set -> set -> set -> set -> set => (fun x4 x5 : set -> set -> set -> set -> set => fun x6 : set -> set -> set -> set -> set -> set -> set => forall x7 x8, Obj x7 -> Obj x8 -> (forall x9 x10, Hom x7 x8 x9 -> Hom x7 x8 x10 -> MetaCat_coequalizer_p Obj Hom Id Comp x7 x8 x9 x10 (x4 x7 x8 x9 x10) (x5 x7 x8 x9 x10) (x6 x7 x8 x9 x10))).
Definition HomSet : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => x2 :e setexp x1 x0).
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
Definition lam_id : set -> set :=
 (fun x0 : set => lam x0 (fun x1 : set => x1)).
Definition lam_comp : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam x0 (fun x3 : set => ap x1 (ap x2 x3))).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
(* Parameter canonical_elt "7830817b065e5068a5d904d993bb45fa4ddb7b1157b85006099fa8b2d1698319" "24615c6078840ea77a483098ef7fecf7d2e10585bf1f31bd0c61fbaeced3ecb8" *)
Parameter canonical_elt : (set -> set -> prop) -> set -> set.
Definition quotient : (set -> set -> prop) -> set -> prop :=
 (fun x0 : set -> set -> prop => fun x1 : set => and (x0 x1 x1) (x1 = canonical_elt x0 x1)).
Axiom missingprop_9981628fee84bcf70587ffb7933bd9c35042a1a594a2ae21c28e38ea11e09d6a : (forall x0 x1 x2 x3 x4 x5 x6 x7 : prop, x0 -> x1 -> x2 -> x3 -> x4 -> x5 -> x6 -> x7 -> and (and (and (and (and (and (and x0 x1) x2) x3) x4) x5) x6) x7).
Axiom Sep_Subq : (forall x0, forall x1 : set -> prop, Sep x0 x1 c= x0).
Axiom encode_u_ext : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x1 x3 = x2 x3) -> lam x0 x1 = lam x0 x2).
Axiom beta : (forall x0, forall x1 : set -> set, forall x2, x2 :e x0 -> ap (lam x0 x1) x2 = x1 x2).
Axiom canonical_elt_eq : (forall x0 : set -> set -> prop, per x0 -> (forall x1 x2, x0 x1 x2 -> canonical_elt x0 x1 = canonical_elt x0 x2)).
Axiom lam_Pi : (forall x0, forall x1 x2 : set -> set, (forall x3, x3 :e x0 -> x2 x3 :e x1 x3) -> lam x0 x2 :e Pi x0 x1).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom canonical_elt_rel : (forall x0 : set -> set -> prop, forall x1, x0 x1 x1 -> x0 x1 (canonical_elt x0 x1)).
Axiom Pi_eta : (forall x0, forall x1 : set -> set, forall x2, x2 :e Pi x0 x1 -> lam x0 (ap x2) = x2).
Axiom SepE : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> and (x2 :e x0) (x1 x2)).
Axiom SepI : (forall x0, forall x1 : set -> prop, forall x2, x2 :e x0 -> x1 x2 -> x2 :e Sep x0 x1).
Axiom canonical_elt_idem : (forall x0 : set -> set -> prop, per x0 -> (forall x1, x0 x1 x1 -> canonical_elt x0 x1 = canonical_elt x0 (canonical_elt x0 x1))).
Theorem missingprop_fbab5c5311ed298e907b93e9630cf1fbe57c4af2835203632281bf4158a62546 : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_struct_p x0 HomSet lam_id (fun x7 x8 x9 : set => lam_comp x7) x2 x4 x6 -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Definition True : prop :=
 (forall x0 : prop, x0 -> x0).
Axiom TrueI : True.
Theorem missingprop_e96f8cfa8459ba8da320317d59e27dfaa43e033527a319da7d720ca224964e29 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_struct_p (fun x6 : set => True) HomSet lam_id (fun x6 x7 x8 : set => lam_comp x6) x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_1bcb0376aad766d016ee9f0693d3212cc24924141721dea50bf523c306096bab : (forall x0 x1, x1 :e UnivOf x0 -> (forall x2, x2 c= x1 -> x2 :e UnivOf x0)).
Theorem missingprop_ecf04133c09b0c47328a8a7fad3c7fa897ec89a13f398d72e824d422aa788b0f : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_struct_p (fun x6 : set => x6 :e UnivOf Empty) HomSet lam_id (fun x6 x7 x8 : set => lam_comp x6) x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Theorem missingprop_6f1bce2f0b91cc4a4b01a9a909982b70ca9997251007f0b1f3a245e92f902fcd : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_struct_p (fun x6 : set => x6 :e UnivOf (UnivOf Empty)) HomSet lam_id (fun x6 x7 x8 : set => lam_comp x6) x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
(* Parameter MetaCat_pushout_constr_p "4b0864f933a1ac571ac0fb1acffcf816273110e426dba5d21cab3ae9c7c4b22b" "6b9515512fbad9bcde62db15e567102296545e37426a6ebbf40abc917c3ca78f" *)
Parameter MetaCat_pushout_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
(* Parameter MetaCat_coproduct_constr_p "8f2fbe77e432c151f468828696bc88cfbde14365208ec6d40c57d57f47201c42" "9283cafc90df46790d36399d9c4a27aec79cadc0fd1a9b2f654b0465ca1d1659" *)
Parameter MetaCat_coproduct_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_70eb6d5c4e81105a9bb6d85a6ba8b693c19edf8ca2663bb07fea19af949fed82 : (forall x0 : set -> prop, forall x1 : set -> set -> set -> prop, forall x2 : set -> set, forall x3 : set -> set -> set -> set -> set -> set, MetaCat x0 x1 x2 x3 -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_struct_p x0 x1 x2 x3 x5 x7 x9 -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_constr_p x0 x1 x2 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4)).
Axiom missingprop_7e80016cd90eba8cfb22e412d51217cbc5f2eeece9405f5140e2181ec01c4b9a : (forall x0 : set -> prop, (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setsum x1 x2))) -> (forall x1 : prop, (forall x2 : set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set, (forall x7 : prop, (forall x8 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p x0 HomSet (fun x9 : set => lam x9 (fun x10 : set => x10)) (fun x9 x10 x11 x12 x13 : set => lam x9 (fun x14 : set => ap x12 (ap x13 x14))) x2 x4 x6 x8 -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
Theorem missingprop_29a64036aacadfa5981bdb56a631312afb7edcf6bd34cfced528e797e267ad33 : (forall x0 : set -> prop, MetaCat x0 HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) -> (forall x1, x0 x1 -> (forall x2, x2 c= x1 -> x0 x2)) -> (forall x1, x0 x1 -> (forall x2, x0 x2 -> x0 (setsum x1 x2))) -> (forall x1 : prop, (forall x2 : set -> set -> set -> set -> set -> set, (forall x3 : prop, (forall x4 : set -> set -> set -> set -> set -> set, (forall x5 : prop, (forall x6 : set -> set -> set -> set -> set -> set, (forall x7 : prop, (forall x8 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_constr_p x0 HomSet lam_id (fun x9 x10 x11 : set => lam_comp x9) x2 x4 x6 x8 -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1)).
admit.
Qed.
Axiom missingprop_dcf5739aa5fe0adc626fd983737b233fe68652dff14c53b3d75823dcf2542d41 : MetaCat (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
Axiom missingprop_2c4f22a91db29194c445bcd6d03bd4d8a28e2ca068110adc6df3c2eb893080af : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p (fun x8 : set => True) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Theorem missingprop_90aa49c07fde06fdd160a5b3c51155d31bf367155b710e50932ff69fdd179350 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_constr_p (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_3e43f750deb2d98e7d0d32ebe1012d901da879d02f0dfbd6228355bf7705c8b9 : MetaCat (fun x0 : set => x0 :e UnivOf Empty) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
Axiom missingprop_df899b7f089f31188395c67eee086d3bb63a01977fe467268600a8ed51865292 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p (fun x8 : set => x8 :e UnivOf Empty) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Theorem missingprop_3eb6ccf1a38a1075a27e4ec71f9adf6e2e449c5b9296daf54831cc589de3fc56 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_constr_p (fun x8 : set => x8 :e UnivOf Empty) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
Axiom missingprop_ea08c803821fdb965d694deab91a57c59674f0d5893e9652ca739817958ed900 : MetaCat (fun x0 : set => x0 :e UnivOf (UnivOf Empty)) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0).
Axiom missingprop_15e47c4df03b56c280c2c40875ac93a29c682865c9aaf758b6236b5102f1d6ad : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p (fun x8 : set => x8 :e UnivOf (UnivOf Empty)) HomSet (fun x8 : set => lam x8 (fun x9 : set => x9)) (fun x8 x9 x10 x11 x12 : set => lam x8 (fun x13 : set => ap x11 (ap x12 x13))) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Theorem missingprop_4222d504639a6d7d0508d769a9fb14e22c5493ac5782fc696f150f85a62734ab : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_constr_p (fun x8 : set => x8 :e UnivOf (UnivOf Empty)) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
admit.
Qed.
