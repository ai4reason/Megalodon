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
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Definition empty_p : set -> prop :=
 (fun x0 : set => forall x1, nIn x1 x0).
Definition missingname_4ae83aa3c8d1afbd9b0f28e7f8e72d8a06a3472556c4f65aa77b6e57fd320efd : set -> prop :=
 (fun x0 : set => not (empty_p x0)).
Definition boolToProp : set -> prop :=
 In Empty.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition propToBool : prop -> set :=
 (fun x0 : prop => If_i x0 1 0).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
Axiom nat_0 : nat_p 0.
Axiom nat_p_omega : (forall x0, nat_p x0 -> x0 :e omega).
Theorem missingprop_87d981ec36961a0324ea5d0962fa0689e652a1a367082910c100751340d2d034 : 0 :e omega.
admit.
Qed.
Theorem missingprop_dbddf98537bf375e9963ed36d9e38f795e04c5590bf4e7080fe6ecaae0a75927 : missingname_4ae83aa3c8d1afbd9b0f28e7f8e72d8a06a3472556c4f65aa77b6e57fd320efd omega.
admit.
Qed.
(* Parameter Pi "8ab5fa18b3cb4b4b313a431cc37bdd987f036cc47f175379215f69af5977eb3b" "40f1c38f975e69e2ae664b3395551df5820b0ba6a93a228eba771fc2a4551293" *)
Parameter Pi : set -> (set -> set) -> set.
Definition setexp : set -> set -> set :=
 (fun x0 x1 : set => Pi x1 (fun x2 : set => x0)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
Axiom ap_Pi : (forall x0, forall x1 : set -> set, forall x2 x3, x2 :e Pi x0 x1 -> x3 :e x0 -> ap x2 x3 :e x1 x3).
Theorem missingprop_09f3187fe3c530515ad90a81cd9debeb9cdc8829026c9bef164bdcf00924d4a3 : (forall x0 x1 x2, x2 :e setexp x1 x0 -> (forall x3, x3 :e x0 -> ap x2 x3 :e x1)).
admit.
Qed.
Theorem missingprop_2f455b1fa69e1a00b426baf14b9946aa72b166360704166dc7da6be0350e5ba9 : (forall x0 x1 x2 x3, x3 :e setexp (setexp x2 x1) x0 -> (forall x4, x4 :e x0 -> (forall x5, x5 :e x1 -> ap (ap x3 x4) x5 :e x2))).
admit.
Qed.
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Theorem missingprop_46648e1732c713cb669b69bfbc36f5eb5224e6b538f921f99776a775fbef48e6 : (forall x0, missingname_4ae83aa3c8d1afbd9b0f28e7f8e72d8a06a3472556c4f65aa77b6e57fd320efd x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> x1) -> x1)).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom xm : (forall x0 : prop, or x0 (not x0)).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Axiom In_1_2 : 1 :e 2.
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom In_0_2 : 0 :e 2.
Theorem missingprop_4df00c9ade231348c2e69253dda647d1cabf806a0e5444be0de609114a8c5d48 : (forall x0 : prop, propToBool x0 :e 2).
admit.
Qed.
Axiom cases_2 : (forall x0, x0 :e 2 -> (forall x1 : set -> prop, x1 0 -> x1 1 -> x1 x0)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom EmptyE : (forall x0, nIn x0 0).
Theorem missingprop_650dab47efc00bdb30625a907206edcb7bc34c4f678435f3b40bb7be7de18b27 : (forall x0, x0 :e 2 -> boolToProp x0 -> x0 = 1).
admit.
Qed.
Axiom In_0_1 : 0 :e 1.
Theorem missingprop_e1256dcab380fe08e9b1efce4066630c0528a6f096750019e89e3c20a179dfe1 : (forall x0, x0 :e 2 -> not (boolToProp x0) -> x0 = 0).
admit.
Qed.
Theorem missingprop_69661730db208b6a50bcb285a5aa2bc783f97f643f19bcb9e7ad40e95db14ecf : (forall x0 : prop, x0 -> boolToProp (propToBool x0)).
admit.
Qed.
Theorem missingprop_90c21518a163b7b18453f952351ba22ec0d6780536b805d7fbfc86a20865753a : (forall x0 : prop, boolToProp (propToBool x0) -> x0).
admit.
Qed.
