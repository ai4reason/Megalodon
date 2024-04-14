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
Theorem missingprop_6df806693864a23a378ddbca02cda4bb4bc233ff1daa8914d51c06eb72ff2550 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x3 (x1 x4 (x1 x2 x5)))).
admit.
Qed.
Theorem missingprop_2ce9a82c8ef9efc0240c60d5f07d019e2f7a44da8d6114bc529d6fb2d8f3a783 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x3 (x1 x4 (x1 x5 (x1 x2 x6))))).
admit.
Qed.
Theorem missingprop_515047c02fed97c50f69ea07f84c55a116d5435d48e441446058ba601add8797 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x2 x7)))))).
admit.
Qed.
Theorem missingprop_9b08836e02c4ecab23ffe407c500b75674d8128928669b1aa1e6670ede61d6f8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x2 x8))))))).
admit.
Qed.
Theorem missingprop_e032662aa31d0d7c6cd21c7ec8f978be1dee32c5d8585622c751063506e260f9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x2 x9)))))))).
admit.
Qed.
Theorem missingprop_f348ca4750d331c757263d6f373e891336185bf4dbd51b158fe78a2ebc2cf398 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x2 x10))))))))).
admit.
Qed.
Theorem missingprop_57b72403a262e58313ce568ea812ef6d89ec67b4e1a215ab6f60d964bf3d2756 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x2 x11)))))))))).
admit.
Qed.
Theorem missingprop_7e908b40c46b73fe6e5f778b7a7c4240e8f2018f37d884c13073c8fe98783893 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x2 x12))))))))))).
admit.
Qed.
Theorem missingprop_0e97487862cce1477fe8da74f93de660761987d23f188fc8df231ce3db9e9641 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x2 x13)))))))))))).
admit.
Qed.
Theorem missingprop_11e965f93428511be41c648b44c7042f42623600fd53ca75488c6932c5d19c48 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x2 x14))))))))))))).
admit.
Qed.
Theorem missingprop_efae606d63d07aba455d40b9408af75bdcea1a4817a64d8f3ad3bc26d1f64ede : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15)))))))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x2 x15)))))))))))))).
admit.
Qed.
Theorem missingprop_37d92903e137ae9ce46bab25a90fba9f18ea0282722bc2a119616e1f751e2ab0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16))))))))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x2 x16))))))))))))))).
admit.
Qed.
Theorem missingprop_94d0b31b98a7159b6a1989a2a20012fe91feafc954efeb4b06c5f395ae4c2c10 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 x17)))))))))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x2 x17)))))))))))))))).
admit.
Qed.
Theorem missingprop_8b1fc0243b622a5575ee6134bb73f6018d7ee9bbec0f5b1a2e110052a3d380e5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x0 x18 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 x18))))))))))))))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 (x1 x2 x18))))))))))))))))).
admit.
Qed.
Theorem missingprop_9551c74ff689713f6e29d6039e164b7f427808e036d50b6ddb9edf722f975820 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x4 (x1 x5 (x1 x2 (x1 x3 x6))))).
admit.
Qed.
Theorem missingprop_f0b76402e77112232d36cbd146a3e3efd40fdf823d5b935fe896a6fb8918a817 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x4 (x1 x5 (x1 x6 (x1 x2 (x1 x3 x7)))))).
admit.
Qed.
Theorem missingprop_01b85a5229069244bfc0fa2496398b6a876770b04992bb705aa6f0b7bd0f95bd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x2 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_740c326b8db1721472b91d6e71f31e53d7b507113fa83eea104f3c4efda77b24 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x6 (x1 x7 (x1 x2 (x1 x3 (x1 x4 x8))))))).
admit.
Qed.
Theorem missingprop_0c274b36c30faeabc7a40eada948bac64453f3cfe1414d1ecca06c3ef3911c56 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x2 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_daf63273c2e8477b9edf6cef026f78af065e9babd013633fbfa8a7ac3387f9d2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x2 (x1 x3 (x1 x4 x9)))))))).
admit.
Qed.
Theorem missingprop_f97b57443d5ed1511416c472fb678d0baf3b9b21807e5d36395503dd6daba884 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x2 (x1 x3 x10))))))))).
admit.
Qed.
Theorem missingprop_6d7d2d2e120740daa48bd12afabc9e02a8af91678c76e118c25f26fb09e16893 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))) = x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x2 (x1 x3 (x1 x4 x10))))))))).
admit.
Qed.
Theorem missingprop_3aca1ae3738aca7bf96e1e98ee556220a64f36c6013a730a6c9b9943f1a26968 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x10))))))) = x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x10))))))))).
admit.
Qed.
Theorem missingprop_936e5f24eaf676f4a294b0b65998f1596edd06a7c6ec9560b1010c839725cb2f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x2 (x1 x3 x11)))))))))).
admit.
Qed.
Theorem missingprop_4402c4add48ff346491c84f79be39dee9e90d48d41f25c112bf586ab9bf76ce5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))) = x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x2 (x1 x3 (x1 x4 x11)))))))))).
admit.
Qed.
Theorem missingprop_af5aac3aef3eeec3c46e5b3b287f814db64fc0e297ef7fdbd29c3be1efb9c4dc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 x11)))))))) = x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x11)))))))))).
admit.
Qed.
Theorem missingprop_26663d5997a86f2f46f7916dc16156fb574b6a5c771494d0f3dc5ee3f38e03a1 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x2 (x1 x3 x12))))))))))).
admit.
Qed.
Theorem missingprop_701691e7f1254f340e4d34a46a593d30fd37d62228bdfd63d71b309bb13aa5e9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))) = x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x2 (x1 x3 (x1 x4 x12))))))))))).
admit.
Qed.
Theorem missingprop_71482150118f9bbc66b43fb6522636e329499b09fb3294b389fd1fcc0b9cfe14 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))) = x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x12))))))))))).
admit.
Qed.
Theorem missingprop_2bc6b106702f880df4fd9f7a1d1ba98bafab386e293d7c3b4f3e568e1b1d92b5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 x12))))))))) = x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x12))))))))))).
admit.
Qed.
Theorem missingprop_85734989ce6bb46a65b82134aaa07b0fda02d03ac5494aaab1ba1af2b8a0e738 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x2 (x1 x3 x13)))))))))))).
admit.
Qed.
Theorem missingprop_dbc71d98a035c8306d57233ef43ac1dc1c3595d3ca96bfb567b2f45226c0dc37 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))) = x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x2 (x1 x3 (x1 x4 x13)))))))))))).
admit.
Qed.
Theorem missingprop_f2ecccb818e7d61bf88eb101643f26e8a36c2991f838b3eb173854a2b2a774da : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))) = x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x13)))))))))))).
admit.
Qed.
Theorem missingprop_4936822cb8effbab4922b02254f35fbca30e73922c0bfa287567cf23830b31ca : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 x13)))))))))) = x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x13)))))))))))).
admit.
Qed.
Theorem missingprop_83088b7db1e7e6e9f784934953b5360c364bc32df2307f7e01a5e58240db59f8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x2 (x1 x3 x14))))))))))))).
admit.
Qed.
Theorem missingprop_dacf7533cab8fd7c41962a33a2180f71f459d6da20ade6a3fd43208d8c1569a6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))) = x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x2 (x1 x3 (x1 x4 x14))))))))))))).
admit.
Qed.
Theorem missingprop_71fb72d65b06945bea021ca82a8e1cdbaa6ec25ec32b2880d523e0da41aa39b4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))) = x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x14))))))))))))).
admit.
Qed.
Theorem missingprop_4acbbe6e436b61b256dca59be87b2e9247a1b93e0f7696f7fb6e29292ef4eef3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))) = x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x14))))))))))))).
admit.
Qed.
Theorem missingprop_2288e99aca9f21ed754655c81c547923df5da6ff3622a9354997b57e5647adc7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 x14))))))))))) = x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x14))))))))))))).
admit.
Qed.
Theorem missingprop_6c6b2c614b3463b92eca08438c253de52f2905f5479e9a1a0ff7d56799c1874d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15)))))))))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x2 (x1 x3 x15)))))))))))))).
admit.
Qed.
Theorem missingprop_33a25bc2ffde0f257c21b71b99104bc40a086f4e7249c1f9a832592043dfc129 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15)))))))))))) = x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x2 (x1 x3 (x1 x4 x15)))))))))))))).
admit.
Qed.
Theorem missingprop_74d7c7d56171a685db0c06db2f7c96fae8d0559dfd22c38dc11e3f6dd5b7733c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15)))))))))))) = x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x15)))))))))))))).
admit.
Qed.
Theorem missingprop_2d18718fa0fb28df735541071dfda2a95214e9764ef75090c8721d555bccb552 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15)))))))))))) = x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x15)))))))))))))).
admit.
Qed.
Theorem missingprop_60ca9629c05ee84facb05f703d34ce1edf6ca7975fc26b371784251cac60954c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 x15)))))))))))) = x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x15)))))))))))))).
admit.
Qed.
Theorem missingprop_eabf3af95f1409c4c58a70650ceee3ca28f6dc1a86dcd1e0b758daff94f19e1c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16))))))))))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x2 (x1 x3 x16))))))))))))))).
admit.
Qed.
Theorem missingprop_44eca591b92c8b6e599f5ac1447222c670bdc5fd029f72b3db89b774975333f9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16))))))))))))) = x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x2 (x1 x3 (x1 x4 x16))))))))))))))).
admit.
Qed.
Theorem missingprop_480dcf34e0a80ec442e3483fc354bd675fb381077c98354bf3bc2e20e6984db9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16))))))))))))) = x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x16))))))))))))))).
admit.
Qed.
Theorem missingprop_73a78d881519ba05581f0fbcec435b61d3ccfa5063e543de06278b483597cdd2 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16))))))))))))) = x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x16))))))))))))))).
admit.
Qed.
Theorem missingprop_ba118ea91933dab1f6d754a95dbe6702f10c30a2c9648ae3f16bef1046231ec7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16))))))))))))) = x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x16))))))))))))))).
admit.
Qed.
Theorem missingprop_de69ff40a1edc9898bb14704d82f4bf7c78526de089360a108c5523c4ebc6b9b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 x16))))))))))))) = x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x16))))))))))))))).
admit.
Qed.
Theorem missingprop_3603a8039ee5b9f6c45d69faf66fa4ee81ee26ef73a76b3bbdf132360971b3ef : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 x17)))))))))))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x2 (x1 x3 x17)))))))))))))))).
admit.
Qed.
Theorem missingprop_27c63a22d508abff39496a6799b702288db523a515fbcdab0bad11bbd8b2a6ea : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 x17)))))))))))))) = x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x2 (x1 x3 (x1 x4 x17)))))))))))))))).
admit.
Qed.
Theorem missingprop_805b05b40a2d6f9e51356d587ed983f3bafc700a694814cc7cd9936b77232ec5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 x17)))))))))))))) = x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x17)))))))))))))))).
admit.
Qed.
Theorem missingprop_b166cf17b66671a0758db71634b992d3fdbbd2a986f9265c6ba5dfb9de390314 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 x17)))))))))))))) = x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x17)))))))))))))))).
admit.
Qed.
Theorem missingprop_9779167a4a8d0e2cb7212b17368febf89389df524d8f0e6f41f2b2ec8f056866 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 x17)))))))))))))) = x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x17)))))))))))))))).
admit.
Qed.
Theorem missingprop_b1c11bd122792d1d3fee9326354c461206ff0c744848c2a84837e1bae5c9057b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 x17)))))))))))))) = x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x17)))))))))))))))).
admit.
Qed.
Theorem missingprop_b5cded7c3db6298c487a9bc42775a1d64e04f70f6be7d2ae28d78fe0f232406d : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x0 x18 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 x18))))))))))))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 (x1 x2 (x1 x3 x18))))))))))))))))).
admit.
Qed.
Theorem missingprop_3b4d636fe9af414dfc29dccb3c835498e5b0a18ebb391ad6890628e1c97bc1e3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x0 x18 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 x18))))))))))))))) = x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 (x1 x2 (x1 x3 (x1 x4 x18))))))))))))))))).
admit.
Qed.
Theorem missingprop_d09b9e02a15ec92b82e2d3cb63cbb8a0f94545bcf1800ea171e27564558b6e82 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x0 x18 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 x18))))))))))))))) = x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x18))))))))))))))))).
admit.
Qed.
Theorem missingprop_a01ffbdff3c577f0658f513020ff042eeb52987c1765ced130fcd7888ca374f4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x0 x18 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 x18))))))))))))))) = x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x18))))))))))))))))).
admit.
Qed.
Theorem missingprop_6c52ed2018d70553779b4522b595a87d4e8515ecd28629b7407c0440e0a910e4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x0 x18 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 x18))))))))))))))) = x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x18))))))))))))))))).
admit.
Qed.
Theorem missingprop_6b47ddb29d6bc620954afca18f888a50d8f4d0633eeeb27c2edf66a3b9b77552 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x0 x18 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 x18))))))))))))))) = x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x18))))))))))))))))).
admit.
Qed.
Theorem missingprop_dc68865953c8239a2dbe4991d6326469f69ecdbdc82a8e9c1bb21911a963a746 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x0 x10 -> x0 x11 -> x0 x12 -> x0 x13 -> x0 x14 -> x0 x15 -> x0 x16 -> x0 x17 -> x0 x18 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 (x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 x18))))))))))))))) = x1 x10 (x1 x11 (x1 x12 (x1 x13 (x1 x14 (x1 x15 (x1 x16 (x1 x17 (x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 (x1 x9 x18))))))))))))))))).
admit.
Qed.
Theorem missingprop_17f2e534568ee7312c417497530472991cbc191bc8362198ef82a32098ba0e8c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x4 (x1 x3 (x1 x2 x5)))).
admit.
Qed.
