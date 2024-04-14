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
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
(* Parameter u3 "e803b40f939f4fe15fb61b29ded3bee1206757349f3b808c5103467101bdab9a" "1da7b5b024a841d0694168c01df8b0cada113e9c4616f1555b257b978dff46cc" *)
Parameter u3 : set.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
(* Parameter SetAdjoin "153bff87325a9c7569e721334015eeaf79acf75a785b960eb1b46ee9a5f023f8" "1f3a09356e470bff37ef2408148f440357b92f92f9a27c828b37d777eb41ddc6" *)
Parameter SetAdjoin : set -> set -> set.
(* Parameter UPair "80aea0a41bb8a47c7340fe8af33487887119c29240a470e920d3f6642b91990d" "74243828e4e6c9c0b467551f19c2ddaebf843f72e2437cc2dea41d079a31107f" *)
Parameter UPair : set -> set -> set.
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition DirGraphOutNeighbors : set -> (set -> set -> prop) -> set -> set :=
 (fun x0 : set => fun x1 : set -> set -> prop => fun x2 : set => Sep x0 (fun x3 : set => and (x2 = x3 -> (forall x4 : prop, x4)) (x1 x2 x3))).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom missingprop_cb75c47bae3a116273752c6fc8e52c777498313f2b5b4ef43d3ceb63348e2717 : (forall x0 x1 x2 x3, forall x4 : set -> prop, x4 x0 -> x4 x1 -> x4 x2 -> x4 x3 -> (forall x5, x5 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3 -> x4 x5)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
Axiom missingprop_e153145abdef8d76c5a6e74702cb9d7f11b028f942da54501a84e1d9c7529c05 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> (forall x4, x4 :e DirGraphOutNeighbors x0 x1 x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4))))).
Axiom neq_i_sym : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> x1 = x0 -> (forall x2 : prop, x2)).
Axiom missingprop_426b271b8453605fe796f284fb15405fbff198d07b0c3dc7b8c218dee82a5c65 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 :e x0 -> (forall x3, x3 :e DirGraphOutNeighbors x0 x1 x2 -> x2 :e DirGraphOutNeighbors x0 x1 x3))).
Axiom SepE1 : (forall x0, forall x1 : set -> prop, forall x2, x2 :e Sep x0 x1 -> x2 :e x0).
Axiom binintersect_com : (forall x0 x1, forall x2 : set -> set -> prop, x2 (binintersect x0 x1) (binintersect x1 x0) -> x2 (binintersect x1 x0) (binintersect x0 x1)).
Axiom missingprop_7b54ca399582282a7040a71f9c2f008cb6ef4ffaa1dd688f4883cd33f8f6980b : (forall x0 x1 x2 x3, x3 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3).
Axiom missingprop_e4760fc821f351cd9b641f80133df8c2736e77957d5436be4e26fe6dae8c4afe : (forall x0 x1 x2 x3, x2 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3).
Axiom missingprop_4d1134395428f655c70060d89bfb8558ccadeb21955f223d5ca8f7e2fc67148c : (forall x0 x1 x2 x3, x1 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3).
Axiom missingprop_a83b0f00b7010506012eac50a37acf9397f188fab2e100b8a543b795c63cc457 : (forall x0 x1 x2 x3, x0 :e SetAdjoin (SetAdjoin (UPair x0 x1) x2) x3).
Theorem missingprop_69a9db44595939e1bddcd5bc279c628551a6750716ca8682b12653ef28485775 : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 c= x0 -> (forall x3 x4 x5 x6, x2 = SetAdjoin (SetAdjoin (UPair x3 x4) x5) x6 -> (x4 = x3 -> (forall x7 : prop, x7)) -> (x5 = x3 -> (forall x7 : prop, x7)) -> (x6 = x3 -> (forall x7 : prop, x7)) -> (x5 = x4 -> (forall x7 : prop, x7)) -> (x6 = x4 -> (forall x7 : prop, x7)) -> (x6 = x5 -> (forall x7 : prop, x7)) -> x1 x3 x4 -> x1 x4 x5 -> x1 x5 x6 -> x1 x6 x3 -> (forall x7, x7 :e binintersect (DirGraphOutNeighbors x0 x1 x3) (DirGraphOutNeighbors x0 x1 x5) -> or (x7 = x4) (x7 = x6)) -> (forall x7, x7 :e binintersect (DirGraphOutNeighbors x0 x1 x4) (DirGraphOutNeighbors x0 x1 x6) -> or (x7 = x3) (x7 = x5)) -> (forall x7, x7 :e x2 -> (forall x8, x8 :e x2 -> (x7 = x8 -> (forall x9 : prop, x9)) -> (forall x9, x9 :e binintersect (DirGraphOutNeighbors x0 x1 x7) (DirGraphOutNeighbors x0 x1 x8) -> x9 :e x2)))))).
admit.
Qed.
(* Parameter u6 "fa055287e35da0dbdfea4eda00e6036e98d3ddf3a436e0535f56582c21372e8e" "a7eb4561b2cb31701ce7ec9226931f7d9eae8f8b49a5a52f5987c7cac14cdcb3" *)
Parameter u6 : set.
Theorem missingprop_2ec58ec931f76b9ab5987777a3fb427e2545ac8e6cf5d4b7163bcc611b01a0dd : (forall x0, forall x1 : set -> set -> prop, (forall x2 x3, x1 x2 x3 -> x1 x3 x2) -> (forall x2, x2 c= x0 -> atleastp u3 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1 x3 x4))) -> (forall x2, x2 c= x0 -> atleastp u6 x2 -> not (forall x3, x3 :e x2 -> (forall x4, x4 :e x2 -> (x3 = x4 -> (forall x5 : prop, x5)) -> not (x1 x3 x4)))) -> (forall x2, x2 c= x0 -> (forall x3 x4 x5 x6, x2 = SetAdjoin (SetAdjoin (UPair x3 x4) x5) x6 -> (x4 = x3 -> (forall x7 : prop, x7)) -> (x5 = x3 -> (forall x7 : prop, x7)) -> (x6 = x3 -> (forall x7 : prop, x7)) -> (x5 = x4 -> (forall x7 : prop, x7)) -> (x6 = x4 -> (forall x7 : prop, x7)) -> (x6 = x5 -> (forall x7 : prop, x7)) -> x1 x3 x4 -> x1 x4 x5 -> x1 x5 x6 -> x1 x6 x3 -> (forall x7, x7 :e binintersect (DirGraphOutNeighbors x0 x1 x3) (DirGraphOutNeighbors x0 x1 x5) -> or (x7 = x4) (x7 = x6)) -> (forall x7, x7 :e binintersect (DirGraphOutNeighbors x0 x1 x4) (DirGraphOutNeighbors x0 x1 x6) -> or (x7 = x3) (x7 = x5)) -> (forall x7, x7 :e x2 -> (forall x8, x8 :e x2 -> (x7 = x8 -> (forall x9 : prop, x9)) -> (forall x9, x9 :e binintersect (DirGraphOutNeighbors x0 x1 x7) (DirGraphOutNeighbors x0 x1 x8) -> x9 :e x2)))))).
admit.
Qed.
