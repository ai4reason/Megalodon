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
(* Parameter lam_id "00e0580a8881b84ea1ef7f67247f59ec145448a850064052345ecd4ecb637071" "6271864c471837aeded4c4e7dc37b9735f9fc4828a34ac9c7979945da815a3c7" *)
Parameter lam_id : set -> set.
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Definition struct_id : set -> set :=
 (fun x0 : set => lam_id (ap x0 Empty)).
(* Parameter lam_comp "fe600fee4888e854b519619f9d314569f986253bb2b5db02807f68aa12bf7c5a" "29d9e2fc6403a0149dee771fde6a2efc8a94f848a3566f3ccd60af2065396289" *)
Parameter lam_comp : set -> set -> set -> set.
Definition struct_comp : set -> set -> set -> set -> set -> set :=
 (fun x0 x1 x2 : set => lam_comp (ap x0 Empty)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter struct_p "1d236ab2eeffe5c2a0b53d462ef26ecaca94bfe3e1b51cd50fc0253d7c98b44a" "b927035076bdb3f2b856017733102a46ad6a0c52f1f4808b6c0cc6bde29328b6" *)
Parameter struct_p : set -> prop.
(* Parameter unpack_p_o "4b92ca0383b3989d01ddc4ec8bdf940b54163f9a29e460dfd502939eb880162f" "30f11fc88aca72af37fd2a4235aa22f28a552bbc44f1fb01f4edf7f2b7e376ac" *)
Parameter unpack_p_o : set -> (set -> (set -> prop) -> prop) -> prop.
Definition PtdPred : set -> prop :=
 (fun x0 : set => and (struct_p x0) (unpack_p_o x0 (fun x1 : set => fun x2 : set -> prop => forall x3 : prop, (forall x4, and (x4 :e x1) (x2 x4) -> x3) -> x3))).
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
(* Parameter UnaryPredHom "44ed079d6a65865657792e1cc515b76a1121cfdc9af8f6c21f8cc848fa700837" "5d0201189805d03fc856c2fa62f35171b88a531f7deeee6199625094c02eddd7" *)
Parameter UnaryPredHom : set -> set -> set -> prop.
Axiom missingprop_8e7946e14374f929755e19a1c44c77701625a3b4110f6a053a055efef5fccc73 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> MetaCat x0 UnaryPredHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_f74def15ebcd798c28df1e61a6def4cb18bc6a8807c08bb7cae966345d85be99 : MetaCat PtdPred UnaryPredHom struct_id struct_comp.
admit.
Qed.
(* Parameter MetaFunctor "3f1821f85d08e8012e699b09efeb0773942fcc2adacfea48bc8f23b31eb6673d" "f35b679c6bab1e6cf0fdcf922094790594854b8da194ab1c6b10991183d51c1a" *)
Parameter MetaFunctor : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> prop.
(* Parameter True "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" "f81b3934a73154a8595135f10d1564b0719278d3976cc83da7fda60151d770da" *)
Parameter True : prop.
(* Parameter HomSet "161e94d84ccfb9b03f97f8dd48da7489affeb461b5931fee82f582ce63054de8" "de8fdf3d1593629dc04bc929fc51714e9acdbd4d4b7e5ac4f6e31798f074955a" *)
Parameter HomSet : set -> set -> set -> prop.
Axiom missingprop_59e3f3dce052073bbe68f49c7125d7f995693bb360ddfee771c0265ad2f4452d : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> MetaFunctor x0 UnaryPredHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_996d2ca5294d954837ab194fae84867f90f5006f06aab9f6fe20cb8048b5fc59 : MetaFunctor PtdPred UnaryPredHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
(* Parameter MetaCat_initial_p "469fedb3c0890bbe6f1968a679e8940fd80553c3929ed17a6b7130c588aa8e13" "a7ed72144cefda0957baa33b821766b4dfe468731094cdca6edcf0a9613fc7c8" *)
Parameter MetaCat_initial_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
Theorem missingprop_343f3e34a0a3f86cd7882ba32bb69df2416edb4ad7b17fd0ed089747d25b340b : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_terminal_p "e188a394359450645dfdce85a0b30e951da4f945117188395c3ab12bb228e33d" "fdae77d1a5079ae1a09aaeb23343f4bd6081907e9fe81a573b7244a35af0d909" *)
Parameter MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
Theorem missingprop_a3d382262eeb653576a38b7d912965ec2c8fd2bbaf6c9b264618fda7094a7065 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_coproduct_constr_p "8f2fbe77e432c151f468828696bc88cfbde14365208ec6d40c57d57f47201c42" "9283cafc90df46790d36399d9c4a27aec79cadc0fd1a9b2f654b0465ca1d1659" *)
Parameter MetaCat_coproduct_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_dc308ee8a01bc9c118a40e3847136558e9049ce9b24530e2eed803b39708f061 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_product_constr_p "174a19a576b89f1308ff59f6dd7de2117117f98e28682f4bbd15fbb1975ae6f0" "8627a945e60408d81c3094008f07f651db6b692c34fa1ffa9753e39b66d38044" *)
Parameter MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_27a094e80b986cdf42eccdde9b4537715ea93d2b8fd49aebc0b351655f2e6700 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_coequalizer_buggy_struct_p "b635bdf22563c31dfe7ebe5ef5db6659c84c46d4448fbd36c50ffb05669d7a72" "90c303e6b6cca396b2d8ddeff62cda2c0954a43d45ad666e7b8ea21c1d8fa73a" *)
Parameter MetaCat_coequalizer_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_84fcf2809e6542f60301d60ecdc447446c4a1bbe22056ed0a0950fbfab643552 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_buggy_struct_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_equalizer_buggy_struct_p "e67bc4d0a725995ed2ec3098468550e926fee1bce25684449381d154f0ee8440" "0cc8a8cbd38e8ba1ee07ccfd5533e5863ca3585fcd0f824fb201b116adadea99" *)
Parameter MetaCat_equalizer_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_4c90844465ddf407636978781a5dd753b1670308798a2f9cc253b05474f71a3d : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_buggy_struct_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_pushout_buggy_constr_p "a40e2bf43bfaedcb235fbe9cf70798d807af253c9fbdaca746d406eede069a95" "e4ed700f88c7356f166d3aaad35c3007fde4361ccaa00c752a1b65ddb538052e" *)
Parameter MetaCat_pushout_buggy_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_80108a00da6f947238a9e3cb4730d8cf42929ea61c25816531609e6f69a47de1 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_buggy_constr_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_pullback_buggy_struct_p "d911abc76bc46c5334e7c773fdba8df1c33d0156234b37084c9e6526851c30b9" "944de6e799f202bde0a6c9ed7626d6a7b2530cb8ff1b9c9a979548e02c1a4b81" *)
Parameter MetaCat_pullback_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_31fea1a9e8ba33b032616aedc12e015a83ed71248b72f5091b2931379540d7f5 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_buggy_struct_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_exp_constr_p "9f6ce4075c92a59821f6cfbfc8f86cc2c3b8a00b532253e0c92520fca04ab97b" "b618dfe4a17334147263c506b2138f51d0d2c7b154efad7f4f29ccbe49e432f3" *)
Parameter MetaCat_exp_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set) -> prop.
Theorem missingprop_9bd4d5c9759a225b04c509687ce9c39cf37014cec87fcf869e11cc9c143f9fc1 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_subobject_classifier_buggy_p "b430b61db2900bb60168d91af644ce9e8886b53b9fc1d812f4f50f301fbaf2ad" "b25dda61a9e31c2b6c19744c16c5af120939ef77a89fe6bcea622a7b6ba6ce78" *)
Parameter MetaCat_subobject_classifier_buggy_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> (set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_4014cbc2ea01f28c07efaba53f9a7e36301543591e8bf98df32e46e86eae39bf : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_buggy_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_nno_p "5b8f1bcabb96c729d6120f7525c02179f8baf007a2bc04b7f8efb36fff497cf6" "037a74a15834f7850061137e15b24c1545b3cec27cea76d5a22e5f66ad2e9ff1" *)
Parameter MetaCat_nno_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> set -> (set -> set -> set -> set) -> prop.
Theorem missingprop_8dadcf73a4aec2fbcb980c749408777a6b815907d2b1cc9db68b34836251b75e : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p PtdPred UnaryPredHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaAdjunction_strict "be3dc11d683b255bfbd9127adb3c6087d074a17cb0e31c91d602b5ae49893e97" "c8ed7d3ad63a4a29ebc88ac0ccb02bfd5f4c0141eebc8a7a349ed7115a3a3eb9" *)
Parameter MetaAdjunction_strict : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set) -> prop.
Theorem missingprop_ee112ff57101f2dba3b3c1fbb4da27475de7bfaa3a6f4c97b4e63aa14b14ae82 : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) PtdPred UnaryPredHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 Empty) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter struct_e "a439fd04fdf53a240bd30662af698e730d4b04b510adff1d4a286718c31431e4" "d335d40e85580857cc0be3657b910d5bce202e0fab6875adec93e2fc5e5e57e4" *)
Parameter struct_e : set -> prop.
(* Parameter PtdSetHom "e62fb376978eab6f3a437ccbcbf7db7e720c6d825a9ac34a47cc1290a4483e8a" "d6f688b87f520e20f883436520c684182d8140f8ad0fdc595e075122f758500e" *)
Parameter PtdSetHom : set -> set -> set -> prop.
(* Parameter unpack_e_i "933a1383079fba002694718ec8040dc85a8cca2bd54c5066c99fff135594ad7c" "91fff70be2f95d6e5e3fe9071cbd57d006bdee7d805b0049eefb19947909cc4e" *)
Parameter unpack_e_i : set -> (set -> set -> set) -> set.
(* Parameter pack_p "3c539dbbee9d5ff440b9024180e52e9c2adde77bbaa8264d8f67d724d8c8cb25" "d5afae717eff5e7035dc846b590d96bd5a7727284f8ff94e161398c148ab897f" *)
Parameter pack_p : set -> (set -> prop) -> set.
Theorem missingprop_f195ff2e45aabd89fb68e8518cdfb24c43f7f52126b192f510cb60bcc74b7d0c : MetaFunctor struct_e PtdSetHom (fun x0 : set => lam_id (ap x0 Empty)) (fun x0 x1 x2 : set => lam_comp (ap x0 Empty)) PtdPred UnaryPredHom (fun x0 : set => lam_id (ap x0 Empty)) (fun x0 x1 x2 : set => lam_comp (ap x0 Empty)) (fun x0 : set => unpack_e_i x0 (fun x1 x2 : set => pack_p x1 (fun x3 : set => forall x4 : set -> set -> prop, x4 x3 x2 -> x4 x2 x3))) (fun x0 x1 x2 : set => x2).
Admitted.
