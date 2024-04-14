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
(* Parameter MetaCat "9b2dee6442140d530f300f187f315d389cfa416a087e15c1677d3bf02f85f063" "fd9743c836fc84a35eca7120bf513d8be118e8eff433fbcc8ca5369662cda164" *)
Parameter MetaCat : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> prop.
(* Parameter struct_e "a439fd04fdf53a240bd30662af698e730d4b04b510adff1d4a286718c31431e4" "d335d40e85580857cc0be3657b910d5bce202e0fab6875adec93e2fc5e5e57e4" *)
Parameter struct_e : set -> prop.
(* Parameter PtdSetHom "e62fb376978eab6f3a437ccbcbf7db7e720c6d825a9ac34a47cc1290a4483e8a" "d6f688b87f520e20f883436520c684182d8140f8ad0fdc595e075122f758500e" *)
Parameter PtdSetHom : set -> set -> set -> prop.
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
Axiom missingprop_f2377bbdcf1599eea76afec3fd7eab2ae5834953315849b5fb79930303088894 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_e x1) -> MetaCat x0 PtdSetHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_40d0ba44126c0ef4b7ce6bc70673aea411d7c10fd33fabd5792adb49c8054b4b : MetaCat struct_e PtdSetHom struct_id struct_comp.
admit.
Qed.
(* Parameter MetaFunctor "3f1821f85d08e8012e699b09efeb0773942fcc2adacfea48bc8f23b31eb6673d" "f35b679c6bab1e6cf0fdcf922094790594854b8da194ab1c6b10991183d51c1a" *)
Parameter MetaFunctor : (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> prop) -> (set -> set -> set -> prop) -> (set -> set) -> (set -> set -> set -> set -> set -> set) -> (set -> set) -> (set -> set -> set -> set) -> prop.
(* Parameter True "5867641425602c707eaecd5be95229f6fd709c9b58d50af108dfe27cb49ac069" "f81b3934a73154a8595135f10d1564b0719278d3976cc83da7fda60151d770da" *)
Parameter True : prop.
(* Parameter HomSet "161e94d84ccfb9b03f97f8dd48da7489affeb461b5931fee82f582ce63054de8" "de8fdf3d1593629dc04bc929fc51714e9acdbd4d4b7e5ac4f6e31798f074955a" *)
Parameter HomSet : set -> set -> set -> prop.
Axiom missingprop_7938f413b613d0d0c75ef55fa10d2044621c1f1cd2fd8d0c2e5b548d072582ea : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_e x1) -> MetaFunctor x0 PtdSetHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_4c2b4094099fef37013b374155d78dd453e247ca970c2808354ae09b555e4a83 : MetaFunctor struct_e PtdSetHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
(* Parameter struct_p "1d236ab2eeffe5c2a0b53d462ef26ecaca94bfe3e1b51cd50fc0253d7c98b44a" "b927035076bdb3f2b856017733102a46ad6a0c52f1f4808b6c0cc6bde29328b6" *)
Parameter struct_p : set -> prop.
(* Parameter UnaryPredHom "44ed079d6a65865657792e1cc515b76a1121cfdc9af8f6c21f8cc848fa700837" "5d0201189805d03fc856c2fa62f35171b88a531f7deeee6199625094c02eddd7" *)
Parameter UnaryPredHom : set -> set -> set -> prop.
Axiom missingprop_8e7946e14374f929755e19a1c44c77701625a3b4110f6a053a055efef5fccc73 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> MetaCat x0 UnaryPredHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_edb0bbc1cf315b54e2af6e88f0ad67b20f207887129fd2bc159319d8845a3b71 : MetaCat struct_p UnaryPredHom struct_id struct_comp.
admit.
Qed.
Axiom missingprop_59e3f3dce052073bbe68f49c7125d7f995693bb360ddfee771c0265ad2f4452d : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_p x1) -> MetaFunctor x0 UnaryPredHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_31890113ffae60f7b7ecb6b47676f4323e643b5df3c206911d1387bd73eaf251 : MetaFunctor struct_p UnaryPredHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
(* Parameter struct_u "5f8f4c8326fb150e4602e1f88fbe7bacc34f447e140c05d6f871baeb3b8edd0b" "df14296f07f39c656a6467de607eb3ced299a130355447584c264061b5275b93" *)
Parameter struct_u : set -> prop.
(* Parameter UnaryFuncHom "96edb4f2610efd412654278db08e16550670a674fc2dc2b8ce6e73dcc46bbeab" "9579111144263dda4d1a69686bd1cd9e0ef4ffaecf2b279cf431d0a9e36f67ab" *)
Parameter UnaryFuncHom : set -> set -> set -> prop.
Axiom missingprop_137f848bdb78f472068da9f3e5698255d8403888e1b30f209fd7da0af03ad2f1 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_u x1) -> MetaCat x0 UnaryFuncHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_5de12671ce5578185e763d350f97672aefc724365fc2efb408ee27de0205dcd6 : MetaCat struct_u UnaryFuncHom struct_id struct_comp.
admit.
Qed.
Axiom missingprop_6809a8ae9ac2e08c74bb19682836f899f1647bfb19e1beda778b023f38a68650 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_u x1) -> MetaFunctor x0 UnaryFuncHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_b3eb4d50160a20a2e10c770afabe4e97e5633c59840b9abe52afbdb5b978f3d7 : MetaFunctor struct_u UnaryFuncHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
(* Parameter struct_r "40bec47cb8d77d09a8db5316dde8cb26bd415be5a40f26f59f167843da58eb63" "2c39441e10ec56a1684beb291702e235e2a9e44db516e916d62ce426108cfd26" *)
Parameter struct_r : set -> prop.
(* Parameter BinRelnHom "352304ebb6c77dbc4e2a952e767857a98538e43de1c35fb4bcd6c99fca02ae7e" "acf0f04c6a55a143e3ed8404c0fa6b09b323d938c83532f081b47091e31c4eb3" *)
Parameter BinRelnHom : set -> set -> set -> prop.
Axiom missingprop_cbfb7b0a858ebd43603219779360cb4b49636cdfaa135c2740cff97583aabee7 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_r x1) -> MetaCat x0 BinRelnHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_c743d500597c886f8c9f734201e1e33c3ed6306ca10b5ca232711b87a9244d05 : MetaCat struct_r BinRelnHom struct_id struct_comp.
admit.
Qed.
Axiom missingprop_8faf0f6f6af4c6811dc2a9fddf49a6de91e15ce9a8949ea3d00ad9c7e8345ae0 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_r x1) -> MetaFunctor x0 BinRelnHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_697cf9d22958b9b03cfc87a57f8b554e5a1d18a1d07ae9d28ec5fd399c76edb1 : MetaFunctor struct_r BinRelnHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
(* Parameter struct_b "8362706412591cb4be4f57a479e94d2219507374d13076e2e8c6636ab9c4fc08" "54dbd3a1c5d7d09ab77e3b5f4c62ce5467ada0cf451d47ee29b7359cc44017cc" *)
Parameter struct_b : set -> prop.
(* Parameter MagmaHom "a84fd92c3d7f64da963df3dac4615300170cb17ff896ccef2f8dd00066ec3d02" "e815783558526a66c8f279c485040d57663745bc5f9348b1ebc671af74c2a305" *)
Parameter MagmaHom : set -> set -> set -> prop.
Axiom missingprop_be2503b86c1e5792746c6adc58383e3972a7c1b0d953c88e847e4de130b06873 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> MetaCat x0 MagmaHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_cb8d374538fe4eed29e0b446edf32f6afed5fe007be224a383b378d00bb23030 : MetaCat struct_b MagmaHom struct_id struct_comp.
admit.
Qed.
Axiom missingprop_5ef6db00f3c15a86c1e221d4a4c3ce606c4d873a1f90dd0b36114bf603c362c9 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b x1) -> MetaFunctor x0 MagmaHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_5098f3d7aa1bee0747c7ad185b7bbc50700af6e4461b4c8050dfa53b528813c9 : MetaFunctor struct_b MagmaHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
(* Parameter struct_c "6b9d57d639bb4c40d5626cf4d607e750e8cce237591fcc20c9faaf1e4b9791b2" "9e6b18b2a018f4fb700d2e18f2d46585471c8c96cd648d742b7dbda08c349b17" *)
Parameter struct_c : set -> prop.
(* Parameter PreContinuousHom "c0f03c208aec64069e4148d3c2de0500d5aa1784cfb14b2ca8b0b012e330b7dd" "9dfc2adb8ff80515a79ba1b90379bbd0cea718993442413b2cb120bb9bf2d4fe" *)
Parameter PreContinuousHom : set -> set -> set -> prop.
Axiom missingprop_a1cc131d97c1cb4ea1bea720376dc4603c3356b62894acb7a7ad88a6d0c56407 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_c x1) -> MetaCat x0 PreContinuousHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_4f44ef23563f367d8f9eeba28ee18b03a0e102cb5b8461a180a26553b732c5dd : MetaCat struct_c PreContinuousHom struct_id struct_comp.
admit.
Qed.
Axiom missingprop_c43bbf00058fbe34f3ecc7b49a3531eeda4c0acfd8a791089e308c67a98989de : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_c x1) -> MetaFunctor x0 PreContinuousHom (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_f3e562025558e319014f28fceefea667a747c4b0cd56d445b6c465e3f15b630f : MetaFunctor struct_c PreContinuousHom struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
(* Parameter struct_b_b_e "0dcb26ac08141ff1637a69d653711c803f750140584a4da769aefebb168b9257" "755e4e2e4854b160b8c7e63bfc53bb4f4d968d82ce993ef8c5b5c176c4d14b33" *)
Parameter struct_b_b_e : set -> prop.
(* Parameter Hom_b_b_e "65a74ed591a17d2a6a3d7082efcf2dcf55e00b35c38c988bf0c3bcef7417c289" "070862b0ccc9135ae23bdde1c11a01e0c0b72cd75efa4d430a1d263e3fdee115" *)
Parameter Hom_b_b_e : set -> set -> set -> prop.
Axiom missingprop_c7aff8a258081ead27bbcfd1253378c01beaa0edda67f8a38bea5872be2d604f : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_e x1) -> MetaCat x0 Hom_b_b_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_75b2b1f25b4e3621d0390f6cf5de5460ac7da4ec1e9d9c2b91aaf705f468b520 : MetaCat struct_b_b_e Hom_b_b_e struct_id struct_comp.
admit.
Qed.
Axiom missingprop_f8aa78094125b50fb4c2bb67306c535ef34713dd1b79d9c3a86af7333c45e8da : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_e x1) -> MetaFunctor x0 Hom_b_b_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_2095602dd4148bb5b649008a5a7c3ffc8e55ef2354e65af724933ac24fedf39c : MetaFunctor struct_b_b_e Hom_b_b_e struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
(* Parameter struct_b_b_e_e "af2850387310cf676e35267e10a14affc439a209ad200b7edc42d8142611fcd4" "7685bdf4f6436a90f8002790ede7ec64e03b146138f7d85bc11be7d287d3652b" *)
Parameter struct_b_b_e_e : set -> prop.
(* Parameter Hom_b_b_e_e "e28a50fa106e9771b4a531f323fb606ae0f38ca80387125677a2ce0395e064ba" "a11d43d40b40be26b4beae6694eb8d4748ce3fc4c449b32515fa45b747927e92" *)
Parameter Hom_b_b_e_e : set -> set -> set -> prop.
Axiom missingprop_d576838b332114c90b2af560b99977995a2da890fc52757cf56c82a16d1c86c8 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_e_e x1) -> MetaCat x0 Hom_b_b_e_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_feeda817aa373f7d98cf8961c3efc41c147e2134d5abf0815bce6a0d7b9bbb39 : MetaCat struct_b_b_e_e Hom_b_b_e_e struct_id struct_comp.
admit.
Qed.
Axiom missingprop_45b4495cd670852170dc3fe96ab30b08a69267996b7bee43e50ace860cabc334 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_e_e x1) -> MetaFunctor x0 Hom_b_b_e_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_d90dfca1752eaaf630470bda406aca16f6bf01842baf9be3b206709590f8a241 : MetaFunctor struct_b_b_e_e Hom_b_b_e_e struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
(* Parameter struct_b_b_r_e_e "08195fc95542b2be3e25b7fdef814f4e54290bd680ae0917923b0e44786a0214" "d542f60aebdbe4e018abe75d8586699fd6db6951a7fdc2bc884bfb42c0d77a22" *)
Parameter struct_b_b_r_e_e : set -> prop.
(* Parameter Hom_b_b_r_e_e "418c446fce2262b8d8aa01b8290d603fce77ec2af134e5730ce3fa40bfc92ff1" "d75651ef535ae407614897001d784e4b70fa69476f5658eb076b9a809fe4d3d5" *)
Parameter Hom_b_b_r_e_e : set -> set -> set -> prop.
Axiom missingprop_d69e51cf98d725801d3c48c79c52281c3ff7cc9a4590111d9bd4316b558f0db1 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_r_e_e x1) -> MetaCat x0 Hom_b_b_r_e_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty))).
Theorem missingprop_e1b7b448098bdade85254c2506ce375d3af118fe24e64560efe290ed9e73c36a : MetaCat struct_b_b_r_e_e Hom_b_b_r_e_e struct_id struct_comp.
admit.
Qed.
Axiom missingprop_de2d15ec1a8706291df52b9be0c3b5a1251c48871e332f302880d36281797b83 : (forall x0 : set -> prop, (forall x1, x0 x1 -> struct_b_b_r_e_e x1) -> MetaFunctor x0 Hom_b_b_r_e_e (fun x1 : set => lam_id (ap x1 Empty)) (fun x1 x2 x3 : set => lam_comp (ap x1 Empty)) (fun x1 : set => True) HomSet lam_id (fun x1 x2 x3 : set => lam_comp x1) (fun x1 : set => ap x1 Empty) (fun x1 x2 x3 : set => x3)).
Theorem missingprop_dcdc541d32a9789d1085c942e0c3768b67d6c1c2aba8bfce896fc3c0ce88856a : MetaFunctor struct_b_b_r_e_e Hom_b_b_r_e_e struct_id struct_comp (fun x0 : set => True) HomSet lam_id (fun x0 x1 x2 : set => lam_comp x0) (fun x0 : set => ap x0 Empty) (fun x0 x1 x2 : set => x2).
admit.
Qed.
