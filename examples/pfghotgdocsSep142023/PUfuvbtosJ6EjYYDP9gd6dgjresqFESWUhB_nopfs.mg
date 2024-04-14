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
(* Parameter struct_u "5f8f4c8326fb150e4602e1f88fbe7bacc34f447e140c05d6f871baeb3b8edd0b" "df14296f07f39c656a6467de607eb3ced299a130355447584c264061b5275b93" *)
Parameter struct_u : set -> prop.
(* Parameter unpack_u_o "22baf0455fa7619b6958e5bd762f4085bae580997860844329722650209d24bf" "eb32c2161bb5020efad8203cd45aa4738a4908823619b55963cc2fd1f9830098" *)
Parameter unpack_u_o : set -> (set -> (set -> set) -> prop) -> prop.
(* Parameter bij "b2487cac08f5762d6b201f12df6bd1872b979a4baefc5f637987e633ae46675d" "76bef6a46d22f680befbd3f5ca179f517fb6d2798abc5cd2ebbbc8753d137948" *)
Parameter bij : set -> set -> (set -> set) -> prop.
Definition Permutation : set -> prop :=
 (fun x0 : set => and (struct_u x0) (unpack_u_o x0 (fun x1 : set => bij x1 x1))).
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
(* Parameter UnaryFuncHom "96edb4f2610efd412654278db08e16550670a674fc2dc2b8ce6e73dcc46bbeab" "9579111144263dda4d1a69686bd1cd9e0ef4ffaecf2b279cf431d0a9e36f67ab" *)
Parameter UnaryFuncHom : set -> set -> set -> prop.
Axiom missingprop_137f848bdb78f472068da9f3e5698255d8403888e1b30f209fd7da0af03ad2f1 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_u x1) -> MetaCat x0 UnaryFuncHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_97a117a3ef894b9fb1eb62c8aa64ff80223ce0478dc6c7c7a52d9ae80a2a2a33 : MetaCat Permutation UnaryFuncHom struct_id struct_comp.
admit.
Qed.
(* Parameter MetaFunctor "3f1821f85d08e8012e699b09efeb0773942fcc2adacfea48bc8f23b31eb6673d" "f35b679c6bab1e6cf0fdcf922094790594854b8da194ab1c6b10991183d51c1a" *)
Parameter MetaFunctor : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> prop.
(* Parameter True "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" "f81b3934a73154a8595135f10d1564b0719278d3976cc83da7fda60151d770da" *)
Parameter True : prop.
(* Parameter HomSet "161e94d84ccfb9b03f97f8dd48da7489affeb461b5931fee82f582ce63054de8" "de8fdf3d1593629dc04bc929fc51714e9acdbd4d4b7e5ac4f6e31798f074955a" *)
Parameter HomSet : set -> set -> set -> prop.
Axiom missingprop_6809a8ae9ac2e08c74bb19682836f899f1647bfb19e1beda778b023f38a68650 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_u x1) -> MetaFunctor x0 UnaryFuncHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_35386abe9393cc4bc38f571a88474fa15c8237e9c3d59300d14879c13db4b93f : MetaFunctor Permutation UnaryFuncHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
(* Parameter MetaCat_initial_p "469fedb3c0890bbe6f1968a679e8940fd80553c3929ed17a6b7130c588aa8e13" "a7ed72144cefda0957baa33b821766b4dfe468731094cdca6edcf0a9613fc7c8" *)
Parameter MetaCat_initial_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
Theorem missingprop_54ae7b8f206bcc4f0bebf8f069949bce0845082209e86ca3e522b11bb5606f9a : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_initial_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_terminal_p "e188a394359450645dfdce85a0b30e951da4f945117188395c3ab12bb228e33d" "fdae77d1a5079ae1a09aaeb23343f4bd6081907e9fe81a573b7244a35af0d909" *)
Parameter MetaCat_terminal_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> prop.
Theorem missingprop_aed94d394c0764bd3e66bb218cd2b015c318afc00a4c645b40fdd9f3373a80f3 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, MetaCat_terminal_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_coproduct_constr_p "8f2fbe77e432c151f468828696bc88cfbde14365208ec6d40c57d57f47201c42" "9283cafc90df46790d36399d9c4a27aec79cadc0fd1a9b2f654b0465ca1d1659" *)
Parameter MetaCat_coproduct_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_c5494569d397370b7c6ddbf239bfd3f294ddbd93ce4f15b8d469ce22b0ae3bc5 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_coproduct_constr_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_product_constr_p "174a19a576b89f1308ff59f6dd7de2117117f98e28682f4bbd15fbb1975ae6f0" "8627a945e60408d81c3094008f07f651db6b692c34fa1ffa9753e39b66d38044" *)
Parameter MetaCat_product_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_6b82cc4f1f3544ac2df4b4ad415f1160315dbeba5abc63ae2f7ac2467f252294 : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, MetaCat_product_constr_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_coequalizer_buggy_struct_p "b635bdf22563c31dfe7ebe5ef5db6659c84c46d4448fbd36c50ffb05669d7a72" "90c303e6b6cca396b2d8ddeff62cda2c0954a43d45ad666e7b8ea21c1d8fa73a" *)
Parameter MetaCat_coequalizer_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_8bbc2d07c778882fee711b5c6fee9e09658c0d30bbdb6ff7b88fa88c99f33b9d : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_coequalizer_buggy_struct_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_equalizer_buggy_struct_p "e67bc4d0a725995ed2ec3098468550e926fee1bce25684449381d154f0ee8440" "0cc8a8cbd38e8ba1ee07ccfd5533e5863ca3585fcd0f824fb201b116adadea99" *)
Parameter MetaCat_equalizer_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_746e1b757edb7f60553155f39754717ba3314d003531404fe4c680e0067b4590 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set -> set, MetaCat_equalizer_buggy_struct_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_pushout_buggy_constr_p "a40e2bf43bfaedcb235fbe9cf70798d807af253c9fbdaca746d406eede069a95" "e4ed700f88c7356f166d3aaad35c3007fde4361ccaa00c752a1b65ddb538052e" *)
Parameter MetaCat_pushout_buggy_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_4419a7607ee1f194e5954b9f579c5d8ded95c9ace52b1aa033f35b2c716ee75c : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pushout_buggy_constr_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_pullback_buggy_struct_p "d911abc76bc46c5334e7c773fdba8df1c33d0156234b37084c9e6526851c30b9" "944de6e799f202bde0a6c9ed7626d6a7b2530cb8ff1b9c9a979548e02c1a4b81" *)
Parameter MetaCat_pullback_buggy_struct_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_249173bee0b333ccedb43b54960f0bded82377777385d1f6bbfad92f282a9a14 : (forall x0 : prop, (forall x1 : set -> set -> set -> set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set -> set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set -> set -> set -> set, MetaCat_pullback_buggy_struct_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_exp_constr_p "9f6ce4075c92a59821f6cfbfc8f86cc2c3b8a00b532253e0c92520fca04ab97b" "b618dfe4a17334147263c506b2138f51d0d2c7b154efad7f4f29ccbe49e432f3" *)
Parameter MetaCat_exp_constr_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set -> set) -> (set -> set -> set) -> (set -> set -> set -> set -> set) -> prop.
Theorem missingprop_8586e3c29b3156d7e862eb6085b6e9590e227b505edca25992c386febe6a002f : (forall x0 : prop, (forall x1 : set -> set -> set, (forall x2 : prop, (forall x3 : set -> set -> set, (forall x4 : prop, (forall x5 : set -> set -> set, (forall x6 : prop, (forall x7 : set -> set -> set -> set -> set -> set, (forall x8 : prop, (forall x9 : set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set, (forall x12 : prop, (forall x13 : set -> set -> set -> set -> set, MetaCat_exp_constr_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 x9 x11 x13 -> x12) -> x12) -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_subobject_classifier_buggy_p "b430b61db2900bb60168d91af644ce9e8886b53b9fc1d812f4f50f301fbaf2ad" "b25dda61a9e31c2b6c19744c16c5af120939ef77a89fe6bcea622a7b6ba6ce78" *)
Parameter MetaCat_subobject_classifier_buggy_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> (set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set) -> prop.
Theorem missingprop_7a1918553525d0459f354b1db092dfe47c99efdf0ddbba2023083fd389765483 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9 : set -> set -> set -> set, (forall x10 : prop, (forall x11 : set -> set -> set -> set -> set -> set -> set, MetaCat_subobject_classifier_buggy_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaCat_nno_p "5b8f1bcabb96c729d6120f7525c02179f8baf007a2bc04b7f8efb36fff497cf6" "037a74a15834f7850061137e15b24c1545b3cec27cea76d5a22e5f66ad2e9ff1" *)
Parameter MetaCat_nno_p : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> set -> (set -> set) -> set -> set -> set -> (set -> set -> set -> set) -> prop.
Theorem missingprop_aab68163289d082793bca373cd1972fc25cba87eeef49a93c0b3e737e51cf401 : (forall x0 : prop, (forall x1, (forall x2 : prop, (forall x3 : set -> set, (forall x4 : prop, (forall x5, (forall x6 : prop, (forall x7, (forall x8 : prop, (forall x9, (forall x10 : prop, (forall x11 : set -> set -> set -> set, MetaCat_nno_p Permutation UnaryFuncHom struct_id struct_comp x1 x3 x5 x7 x9 x11 -> x10) -> x10) -> x8) -> x8) -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
(* Parameter MetaAdjunction_strict "be3dc11d683b255bfbd9127adb3c6087d074a17cb0e31c91d602b5ae49893e97" "c8ed7d3ad63a4a29ebc88ac0ccb02bfd5f4c0141eebc8a7a349ed7115a3a3eb9" *)
Parameter MetaAdjunction_strict : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> (set -> set) -> (set -> set) -> prop.
Theorem missingprop_062a2111df28734dbd6fc00744bf638fbfb93f8614e1726f0b5aa067722f7f65 : (forall x0 : prop, (forall x1 : set -> set, (forall x2 : prop, (forall x3 : set -> set -> set -> set, (forall x4 : prop, (forall x5 : set -> set, (forall x6 : prop, (forall x7 : set -> set, MetaAdjunction_strict (fun x8 : set => True) HomSet lam_id (fun x8 x9 x10 : set => lam_comp x8) Permutation UnaryFuncHom struct_id struct_comp x1 x3 (fun x8 : set => ap x8 Empty) (fun x8 x9 x10 : set => x10) x5 x7 -> x6) -> x6) -> x4) -> x4) -> x2) -> x2) -> x0) -> x0).
Admitted.
