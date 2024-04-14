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
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
(* Parameter missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 "c443f3c4c9ea0abe40dfb83286e8942213a0fa8ca0137e6f1f987227c4d6e23f" "b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494" *)
Parameter missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 : set -> set -> set -> set -> set -> set -> set -> set -> set.
Definition missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (SNo x2) (forall x3 : prop, (forall x4, and (SNo x4) (forall x5 : prop, (forall x6, and (SNo x6) (forall x7 : prop, (forall x8, and (SNo x8) (forall x9 : prop, (forall x10, and (SNo x10) (forall x11 : prop, (forall x12, and (SNo x12) (forall x13 : prop, (forall x14, and (SNo x14) (forall x15 : prop, (forall x16, and (SNo x16) (x0 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x2 x4 x6 x8 x10 x12 x14 x16) -> x15) -> x15) -> x13) -> x13) -> x11) -> x11) -> x9) -> x9) -> x7) -> x7) -> x5) -> x5) -> x3) -> x3) -> x1) -> x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_ecb826179418a88ca9938db10e4512d4b2d75d8190777ac7689e0335cc07481b : (forall x0 x1 x2 x3 x4 x5 x6 x7, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x0 x1 x2 x3 x4 x5 x6 x7)).
admit.
Qed.
Theorem missingprop_16cc7dc4f7796f789be40aad6254608e7ddbe5d6229a0e799f8706a8bb8b5e5f : (forall x0, missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 x0 -> (forall x1 : set -> prop, (forall x2 x3 x4 x5 x6 x7 x8 x9, SNo x2 -> SNo x3 -> SNo x4 -> SNo x5 -> SNo x6 -> SNo x7 -> SNo x8 -> SNo x9 -> x0 = missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x2 x3 x4 x5 x6 x7 x8 x9 -> x1 (missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 x2 x3 x4 x5 x6 x7 x8 x9)) -> x1 x0)).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition missingname_5ce1762516e9a3268c56ffe0bcb3af538ece2ac35403cc132fb97e91fe8c35a4 : set :=
 missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 0 1 0 0 0 0 0 0.
Definition missingname_f6e7656e6a1982a515432752a1cf2f6ec6faab5f14e87d55fea2fefc751df3b9 : set :=
 missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 0 0 1 0 0 0 0 0.
Definition missingname_744b2dd1a30b059c5913e1fb3f51f607a9499d54a758b27e698eea4d16f0959a : set :=
 missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 0 0 0 1 0 0 0 0.
Definition missingname_249a4ddbc658ae44293f6209f5838bd034c7c570413a0573c5cbd0c7900f9c85 : set :=
 missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 0 0 0 0 1 0 0 0.
Definition missingname_dbd4e9d092df52353a29131d6d4fa21cec19d06df1754031ac5c361410c5aade : set :=
 missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 0 0 0 0 0 1 0 0.
Definition missingname_8deb6f854a4d7a2fe3e77346d5dd00d9d4a1187278919a42fc20c6fb19b3f057 : set :=
 missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 0 0 0 0 0 0 1 0.
Definition missingname_5fe69d61f792cb61409823474135d9622cb007cc9048d6f57961508f8cd59dbf : set :=
 missingname_b114dc854f102c8e62fa1a04a8720f003e76652978adae135db46d7d2aab9494 0 0 0 0 0 0 0 1.
Axiom SNo_0 : SNo 0.
Axiom SNo_1 : SNo 1.
Theorem missingprop_995003f1e35a1b3a445e31f9f8cf52a03bc348ba423daaae3f7320377bcf88a1 : missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 missingname_5ce1762516e9a3268c56ffe0bcb3af538ece2ac35403cc132fb97e91fe8c35a4.
admit.
Qed.
Theorem missingprop_1433864f1719f345a590fec1a3815be7240e454f46124d4b8d334bb5e22ef11b : missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 missingname_f6e7656e6a1982a515432752a1cf2f6ec6faab5f14e87d55fea2fefc751df3b9.
admit.
Qed.
Theorem missingprop_905c435d8496d9a7b920f643cdb8a6c8b58d3f76e127c8c57b76f3447eb8b1bf : missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 missingname_744b2dd1a30b059c5913e1fb3f51f607a9499d54a758b27e698eea4d16f0959a.
admit.
Qed.
Theorem missingprop_98564d472f70b500f258d8b7f2d7eed2f61734bae37fbf3db657c0761c51de79 : missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 missingname_249a4ddbc658ae44293f6209f5838bd034c7c570413a0573c5cbd0c7900f9c85.
admit.
Qed.
Theorem missingprop_3900d3d9cdb8fc38c6301b83aaac06f130c98eb3b0749915f3c769b1392f9f5b : missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 missingname_dbd4e9d092df52353a29131d6d4fa21cec19d06df1754031ac5c361410c5aade.
admit.
Qed.
Theorem missingprop_9bf31098b5186ca130e547fecea58586cf99a4c2f554ef3bb0593e18e6cdeb2e : missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 missingname_8deb6f854a4d7a2fe3e77346d5dd00d9d4a1187278919a42fc20c6fb19b3f057.
admit.
Qed.
Theorem missingprop_4a8f22c2991f5e4cede3cbb26ff622e9982238f1d8f661ba319d93ae54f721ec : missingname_ecde4594d51d45f70f69c8f3bfd105cea3169c7662bf357094301b25763ae0c6 missingname_5fe69d61f792cb61409823474135d9622cb007cc9048d6f57961508f8cd59dbf.
admit.
Qed.
