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
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
(* Parameter PreContinuousHom "c0f03c208aec64069e4148d3c2de0500d5aa1784cfb14b2ca8b0b012e330b7dd" "9dfc2adb8ff80515a79ba1b90379bbd0cea718993442413b2cb120bb9bf2d4fe" *)
Parameter PreContinuousHom : set -> set -> set -> prop.
(* Parameter UnaryPredHom "44ed079d6a65865657792e1cc515b76a1121cfdc9af8f6c21f8cc848fa700837" "5d0201189805d03fc856c2fa62f35171b88a531f7deeee6199625094c02eddd7" *)
Parameter UnaryPredHom : set -> set -> set -> prop.
(* Parameter PtdSetHom "e62fb376978eab6f3a437ccbcbf7db7e720c6d825a9ac34a47cc1290a4483e8a" "d6f688b87f520e20f883436520c684182d8140f8ad0fdc595e075122f758500e" *)
Parameter PtdSetHom : set -> set -> set -> prop.
Definition missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (PreContinuousHom x0 x1 x2) (UnaryPredHom x0 x1 x2)) (PtdSetHom x0 x1 x2)).
(* Parameter MetaCat_initial_p "469fedb3c0890bbe6f1968a679e8940fd80553c3929ed17a6b7130c588aa8e13" "a7ed72144cefda0957baa33b821766b4dfe468731094cdca6edcf0a9613fc7c8" *)
Parameter MetaCat_initial_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
(* Parameter struct_c_p_e "bb9a233e1cfe76bcd0deb8a66ade981305b41de49e53fc6583ada8cade8ba59e" "a590c29f883bbbff15e1687f701a8e085351f71cf576ee2ad41366bdf814ad05" *)
Parameter struct_c_p_e : set -> prop.
Theorem missingprop_1639ff3b020b582bb47eb07d1d193e7a5dbc1f3a5f750127fc461768b5751118 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_terminal_p "e188a394359450645dfdce85a0b30e951da4f945117188395c3ab12bb228e33d" "fdae77d1a5079ae1a09aaeb23343f4bd6081907e9fe81a573b7244a35af0d909" *)
Parameter MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
Theorem missingprop_5d47a52ef6b9674f7265bfe04dbae330644acc6ab8f41929bf1ffc1f7de74a08 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_coproduct_constr_p "8f2fbe77e432c151f468828696bc88cfbde14365208ec6d40c57d57f47201c42" "9283cafc90df46790d36399d9c4a27aec79cadc0fd1a9b2f654b0465ca1d1659" *)
Parameter MetaCat_coproduct_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_9489a30ed5048397d7d75f722e4db443e6fdabfc7536589097d63ef332361115 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_product_constr_p "174a19a576b89f1308ff59f6dd7de2117117f98e28682f4bbd15fbb1975ae6f0" "8627a945e60408d81c3094008f07f651db6b692c34fa1ffa9753e39b66d38044" *)
Parameter MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_114117457d6cb43297a8f085efce83ea21a1524226e7659f9cfaebb9f5e0fe42 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_coequalizer_buggy_struct_p "b635bdf22563c31dfe7ebe5ef5db6659c84c46d4448fbd36c50ffb05669d7a72" "90c303e6b6cca396b2d8ddeff62cda2c0954a43d45ad666e7b8ea21c1d8fa73a" *)
Parameter MetaCat_coequalizer_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_42bb7c9df33c11f5e6f38c2427f3bf340f51065744936090be62a162cb6874b6 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_buggy_struct_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_equalizer_buggy_struct_p "e67bc4d0a725995ed2ec3098468550e926fee1bce25684449381d154f0ee8440" "0cc8a8cbd38e8ba1ee07ccfd5533e5863ca3585fcd0f824fb201b116adadea99" *)
Parameter MetaCat_equalizer_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_2101d79e49ec41fd614bf24039fe0d19fd845ed4fee29edbb1910d74ba630668 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_buggy_struct_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_pushout_buggy_constr_p "a40e2bf43bfaedcb235fbe9cf70798d807af253c9fbdaca746d406eede069a95" "e4ed700f88c7356f166d3aaad35c3007fde4361ccaa00c752a1b65ddb538052e" *)
Parameter MetaCat_pushout_buggy_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_c94467eeb97ff262aab8c32a0e9d3243d5c122c17f142784e16020bbb07b2a95 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_buggy_constr_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_pullback_buggy_struct_p "d911abc76bc46c5334e7c773fdba8df1c33d0156234b37084c9e6526851c30b9" "944de6e799f202bde0a6c9ed7626d6a7b2530cb8ff1b9c9a979548e02c1a4b81" *)
Parameter MetaCat_pullback_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_70c52f0e546b9c1044952fd1fb35d520b061a2922e1d53c1b9a87354c7db0e2d : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_buggy_struct_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_exp_constr_p "9f6ce4075c92a59821f6cfbfc8f86cc2c3b8a00b532253e0c92520fca04ab97b" "b618dfe4a17334147263c506b2138f51d0d2c7b154efad7f4f29ccbe49e432f3" *)
Parameter MetaCat_exp_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set) -> prop.
Theorem missingprop_4d1654e7169307273b2686b68461491c1e11909ec4117b69a8af47b20c2b1dae : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_subobject_classifier_buggy_p "b430b61db2900bb60168d91af644ce9e8886b53b9fc1d812f4f50f301fbaf2ad" "b25dda61a9e31c2b6c19744c16c5af120939ef77a89fe6bcea622a7b6ba6ce78" *)
Parameter MetaCat_subobject_classifier_buggy_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> (set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_ae9875fc253b988d4841a2e82b077110b1f4b372e3b838b3e1cbf5da9b834860 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_buggy_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_nno_p "5b8f1bcabb96c729d6120f7525c02179f8baf007a2bc04b7f8efb36fff497cf6" "037a74a15834f7850061137e15b24c1545b3cec27cea76d5a22e5f66ad2e9ff1" *)
Parameter MetaCat_nno_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> set -> (set -> set -> set -> set) -> prop.
Theorem missingprop_95c8b5553fb21ce171e51b1fd262d100fee454674c3282776b95dcbd7eeb0562 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaAdjunction_strict "be3dc11d683b255bfbd9127adb3c6087d074a17cb0e31c91d602b5ae49893e97" "c8ed7d3ad63a4a29ebc88ac0ccb02bfd5f4c0141eebc8a7a349ed7115a3a3eb9" *)
Parameter MetaAdjunction_strict : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set) -> prop.
(* Parameter True "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" "f81b3934a73154a8595135f10d1564b0719278d3976cc83da7fda60151d770da" *)
Parameter True : prop.
(* Parameter HomSet "161e94d84ccfb9b03f97f8dd48da7489affeb461b5931fee82f582ce63054de8" "de8fdf3d1593629dc04bc929fc51714e9acdbd4d4b7e5ac4f6e31798f074955a" *)
Parameter HomSet : set -> set -> set -> prop.
Theorem missingprop_34b1a6da5fdc193d6d6d31f2e4da1b44b4a933d6613f5cca1317287deb8c333c : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) struct_c_p_e missingname_ee312c55041c09c6bf18ce2559b727b74618528f6096df7364584877b9d1b185 struct_id struct_comp x1 x3 (fun x8 : set => ap x8 Empty) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
