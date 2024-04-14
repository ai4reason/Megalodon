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
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition In2_lexicographic : set -> set -> set -> set -> prop :=
 (fun x0 x1 x2 x3 : set => or (x1 :e x3) (and (x1 = x3) (x0 :e x2))).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Theorem missingprop_6941479821a87bc0213525579f6079e2b0a19cf04ef701e5cf38bb698686b29c : (forall x0 x1, not (In2_lexicographic x0 x1 x0 x1)).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_be56f85c82005b15f33a57ec2d9c95197bca2e634147f42190efb42df1758d2f : (forall x0 x1 x2 x3 x4 x5, TransSet x4 -> TransSet x5 -> In2_lexicographic x0 x1 x2 x3 -> In2_lexicographic x2 x3 x4 x5 -> In2_lexicographic x0 x1 x4 x5).
admit.
Qed.
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Definition u1 : set :=
 1.
Definition u2 : set :=
 ordsucc u1.
Definition u3 : set :=
 ordsucc u2.
Definition u4 : set :=
 ordsucc u3.
Definition u5 : set :=
 ordsucc u4.
Definition u6 : set :=
 ordsucc u5.
(* Parameter TwoRamseyGraph_4_6_35_a "059f268a2c9da5fcca9461e81c6b5b4f04b6ac0fbd1a18078ddbe8af58a60832" "4f4f678745170f14dee4f914c2e70b43bebb6c676dbb189a06f00b0656946a6c" *)
Parameter TwoRamseyGraph_4_6_35_a : set -> set -> set -> set -> prop.
(* Parameter ordinal "dab6e51db9653e58783a3fde73d4f2dc2637891208c92c998709e8795ba4326f" "ee28d96500ca4c012f9306ed26fad3b20524e7a89f9ac3210c88be4e6a7aed23" *)
Parameter ordinal : set -> prop.
Axiom ordinal_trichotomy_or_impred : (forall x0 x1, ordinal x0 -> ordinal x1 -> (forall x2 : prop, (x0 :e x1 -> x2) -> (x0 = x1 -> x2) -> (x1 :e x0 -> x2) -> x2)).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom missingprop_c92c0588de1ba6f1a5352aaa897a2358c5ed2f086efe24dfed8c7d8036084229 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> TwoRamseyGraph_4_6_35_a x0 x1 x0 x1)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_p_ordinal : (forall x0, nat_p x0 -> ordinal x0).
Axiom nat_p_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> nat_p x1)).
Axiom nat_6 : nat_p 6.
Theorem missingprop_f02c24ceee26ad4db1bb78c56724742e936644418211148ed46702e4190f50b8 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> (forall x2, x2 :e u6 -> (forall x3, x3 :e u6 -> not (TwoRamseyGraph_4_6_35_a x0 x1 x2 x3) -> or (In2_lexicographic x0 x1 x2 x3) (In2_lexicographic x2 x3 x0 x1))))).
admit.
Qed.
Axiom In_0_1 : 0 :e 1.
Theorem missingprop_4d2df4b7285e4193a7ff632981cc39baaa3d0be5a100d3d41cdde57be9dd53b4 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 0 x1 u1)).
admit.
Qed.
Axiom In_0_2 : 0 :e 2.
Theorem missingprop_9527396b8a23901e481b0a966932a0896f98b97092e615c58becc7e9f351c80b : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 0 x1 u2)).
admit.
Qed.
Axiom In_1_2 : 1 :e 2.
Theorem missingprop_839040d2f1510f4f16cd814b8adb34925ce9359686f5105104f3a1dd05cc3909 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u1 x1 u2)).
admit.
Qed.
Axiom In_0_3 : 0 :e 3.
Theorem missingprop_b6ec2690d14e708c1e67aa1d6bb10456ed42c033444da90789e357a9f99059f3 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 0 x1 u3)).
admit.
Qed.
Axiom In_1_3 : 1 :e 3.
Theorem missingprop_9c752ae052468560e5970f77b76cf8b4d5c653354ad347f01705f4f5905bba5c : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u1 x1 u3)).
admit.
Qed.
Axiom In_2_3 : 2 :e 3.
Theorem missingprop_905f973fc0259c5497c78be8b3f7401d68b559ad0537d286f2055b8a1417a252 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u2 x1 u3)).
admit.
Qed.
Axiom In_0_4 : 0 :e 4.
Theorem missingprop_a2011f611a57305521c23cba0e8b3eb31c10d287087c08d0a65be0cd92057966 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 0 x1 u4)).
admit.
Qed.
Axiom In_1_4 : 1 :e 4.
Theorem missingprop_d8d25fb290fd85a0c04ec9bf2c99fc3c3439387a08c72f2e1eaa425d4fad4074 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u1 x1 u4)).
admit.
Qed.
Axiom In_2_4 : 2 :e 4.
Theorem missingprop_bb5fa9a6308330fde4f18d7073e3aba68ece39e526db9e9f37eb46e022739185 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u2 x1 u4)).
admit.
Qed.
Axiom In_3_4 : 3 :e 4.
Theorem missingprop_06476e70b2818d4e739bb63f32ccf588070be94ca29360bb3fd49ac71c8c545e : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u3 x1 u4)).
admit.
Qed.
Axiom In_0_5 : 0 :e 5.
Theorem missingprop_35157388e21f6d95fffdc635f1b5ff8aeab6b40c68411d75bc363e46c218f31a : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 0 x1 u5)).
admit.
Qed.
Axiom In_1_5 : 1 :e 5.
Theorem missingprop_c44613e72e561b6e128dfab5d7eda3f1929d4a01866c7afa08498651f665491d : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u1 x1 u5)).
admit.
Qed.
Axiom In_2_5 : 2 :e 5.
Theorem missingprop_4cfd934fd4ceb5943814142befee014aba5f9744de3e00a244bb9cf126c25530 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u2 x1 u5)).
admit.
Qed.
Axiom In_3_5 : 3 :e 5.
Theorem missingprop_608086f8e1a671a45a4c1499d74f03c9e66173507742922e2a81af8f32148071 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u3 x1 u5)).
admit.
Qed.
Axiom In_4_5 : 4 :e 5.
Theorem missingprop_35e95df253e632535458ebd028964cc623857035f705ff0bdb56d02bf06c4406 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> In2_lexicographic x0 u4 x1 u5)).
admit.
Qed.
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Theorem missingprop_cdbc6277200ea99f7eefcbc0878b5c5c35ef86a6cae6f27f5a4a6562e338ad50 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u1 x1 0))).
admit.
Qed.
Theorem missingprop_c3b53ba05cb8a966e79bf7686d8a6d429b7a67f4133f758c77f7634030086a38 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u2 x1 0))).
admit.
Qed.
Theorem missingprop_daea222bde6599d08f3e1f080283f6d31c819e9d3fc672010019a0d512917af2 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u3 x1 0))).
admit.
Qed.
Theorem missingprop_3d8970394a902d267ed19d01ab818f977c770d7881a4d51a5d891efca480b273 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u4 x1 0))).
admit.
Qed.
Theorem missingprop_8a9776723da253f57832b2c3c265d876ce63c12fa6d67d3d8d5936dab1aab4e3 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u5 x1 0))).
admit.
Qed.
Theorem missingprop_45af0e5691a9cf52cd1ae085d0eece1b7e1ed1d45c8475957796d4d228b218ed : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u2 x1 u1))).
admit.
Qed.
Theorem missingprop_8565bcc6d9a8ef91f6be6cf42caf6e272701035129050cd69fe5b21172dba186 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u3 x1 u1))).
admit.
Qed.
Theorem missingprop_548e120db7c3ad799c85538d1da2c32a8b396a4e81330557d9fff3a0c19b04ef : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u4 x1 u1))).
admit.
Qed.
Theorem missingprop_36c0d8bebb09370aca4fb2922f152f8cd3276f34e2b1edda8be238e293dea7fe : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u5 x1 u1))).
admit.
Qed.
Theorem missingprop_4a4fca565643f72eb0ea67ce55df7321774bc922ef2062a3f305cdf2f3544b66 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u3 x1 u2))).
admit.
Qed.
Theorem missingprop_d83ae45108d35e0fb327786fc6fe6f8e07c44e22d565943cac2638f55d6f5bd4 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u4 x1 u2))).
admit.
Qed.
Theorem missingprop_a4165572a0e7f94ec68ad0de3bd2d67f3eda34597e66d4df7eb5bc04615eb969 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u5 x1 u2))).
admit.
Qed.
Theorem missingprop_12c2d32d3b0a4d379bfd31bb4a06b3883d1dd755619c597c44c06bb975bd9467 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u4 x1 u3))).
admit.
Qed.
Theorem missingprop_5053d8decba4824ece40f7eda6494874bc3aa6f8da6720b72135d5129b785480 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u5 x1 u3))).
admit.
Qed.
Theorem missingprop_1345ff26ac618cf0478629cefa9923bbe00d06bb23ed2cb69ede78280057e4b6 : (forall x0, x0 :e u6 -> (forall x1, x1 :e u6 -> not (In2_lexicographic x0 u5 x1 u4))).
admit.
Qed.
Theorem missingprop_bfc16a164f88f26056f003ada5e02f45034bfecc0a5ed534d81a060e182f0e03 : (forall x0, x0 :e u6 -> In2_lexicographic 0 x0 u1 x0).
admit.
Qed.
Theorem missingprop_2a8ef5fd5590d1c7d28cb4f5b6363a08035d4d3896fec8b55b80ce79a840a128 : (forall x0, x0 :e u6 -> In2_lexicographic 0 x0 u2 x0).
admit.
Qed.
Theorem missingprop_3c73fd3460bd992ecbbae3d198afcaec4e51a615a7d00c337f2ce7adebed39c3 : (forall x0, x0 :e u6 -> In2_lexicographic u1 x0 u2 x0).
admit.
Qed.
Theorem missingprop_cc73a1acffea7dbf14fec1538209e3503992cfbf93e1e827dd1117a9c47d3e46 : (forall x0, x0 :e u6 -> In2_lexicographic 0 x0 u3 x0).
admit.
Qed.
Theorem missingprop_c92db4f578fb0ed577ac85350d9ee58249ae61c67ae475d7ba0a3bcd952867a9 : (forall x0, x0 :e u6 -> In2_lexicographic u1 x0 u3 x0).
admit.
Qed.
Theorem missingprop_358d8c34c37f94f790487d98fe26d05cba3fcd6143077a3242757f2e8e155ffb : (forall x0, x0 :e u6 -> In2_lexicographic u2 x0 u3 x0).
admit.
Qed.
Theorem missingprop_bdefe9acc49977e881260690f6c43a12a84a497d89218d49571a776c08679370 : (forall x0, x0 :e u6 -> In2_lexicographic 0 x0 u4 x0).
admit.
Qed.
Theorem missingprop_5a408b4de4f5a642e13f0fbcf4f301aecc610e7a8c46322cfa70ae443f3b4cbf : (forall x0, x0 :e u6 -> In2_lexicographic u1 x0 u4 x0).
admit.
Qed.
Theorem missingprop_7903eca6d954d351a7fca90a1cdf6177d3752a8cb25cdf43ff1959b4df2e8d96 : (forall x0, x0 :e u6 -> In2_lexicographic u2 x0 u4 x0).
admit.
Qed.
Theorem missingprop_f5c777dd1a41b49bd90eda0c4b508ea601437da78eb3947211b13c0dfb528971 : (forall x0, x0 :e u6 -> In2_lexicographic u3 x0 u4 x0).
admit.
Qed.
Theorem missingprop_ad3c19417d48be0f43ff8acbe428b39d84105422307371cc6b1b8c84590651de : (forall x0, x0 :e u6 -> In2_lexicographic 0 x0 u5 x0).
admit.
Qed.
Theorem missingprop_9443ea475e4b1978e1b0ffa91826430189b4afde70de26bf4a46b3a279a12e25 : (forall x0, x0 :e u6 -> In2_lexicographic u1 x0 u5 x0).
admit.
Qed.
Theorem missingprop_239babb9f5d839087038497cc30675734595f3e1d922cd090c7abc62e5d91cbd : (forall x0, x0 :e u6 -> In2_lexicographic u2 x0 u5 x0).
admit.
Qed.
Theorem missingprop_27226603796aef9f8df5bc9108fbf51190a508a328b109a4304270eba7edf465 : (forall x0, x0 :e u6 -> In2_lexicographic u3 x0 u5 x0).
admit.
Qed.
Theorem missingprop_1c2cd3408c923e5227ad7624bc47b48d164567b7a50a87402c65c5c7f524a467 : (forall x0, x0 :e u6 -> In2_lexicographic u4 x0 u5 x0).
admit.
Qed.
Theorem missingprop_611dcd3b3d470e1006f1cce69705cb47963f241eef0bbee19351f9cc9ee88eca : (forall x0, x0 :e u6 -> not (In2_lexicographic 0 x0 0 x0)).
admit.
Qed.
Theorem missingprop_f04d41eb8e4f776924c78b479ba58135945070b176488f3e4fb4b1880369e3b9 : (forall x0, x0 :e u6 -> not (In2_lexicographic u1 x0 0 x0)).
admit.
Qed.
Theorem missingprop_3f930481fcfac5229495a8bec7c52498133922a121da53552e66848c4086826d : (forall x0, x0 :e u6 -> not (In2_lexicographic u2 x0 0 x0)).
admit.
Qed.
Theorem missingprop_07322204153a256a98cb97a1e0c8f90b4215d6376cd0af872814e287dce96776 : (forall x0, x0 :e u6 -> not (In2_lexicographic u3 x0 0 x0)).
admit.
Qed.
Theorem missingprop_33a6bc18cfd8d20cac3a782e72f02a1f3efbca4312e292180069e370e2ae77d7 : (forall x0, x0 :e u6 -> not (In2_lexicographic u4 x0 0 x0)).
admit.
Qed.
Theorem missingprop_7abc2d954f30ac1710df169c03b40c811a40b48113e2a8b55f9d7198497f4c9f : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 0 x0)).
admit.
Qed.
Theorem missingprop_6ac6d7e93a50e964968a96f66a9aa9dc3778a58cb83309544cb39a85783128c4 : (forall x0, x0 :e u6 -> not (In2_lexicographic u1 x0 u1 x0)).
admit.
Qed.
Theorem missingprop_1c227da1eb8009dbe54d36a9388ac462e3233ad6cd6eda88206a777204ef6be9 : (forall x0, x0 :e u6 -> not (In2_lexicographic u2 x0 u1 x0)).
admit.
Qed.
Theorem missingprop_e76834dc137834cd33291ca0ba7620645922e4e84be041715b9165fc9f98ecec : (forall x0, x0 :e u6 -> not (In2_lexicographic u3 x0 u1 x0)).
admit.
Qed.
Theorem missingprop_5eecaecea4203ee1bf240cb5f8d322e991cb60db8552b2499ebfec35cf4ee3c8 : (forall x0, x0 :e u6 -> not (In2_lexicographic u4 x0 u1 x0)).
admit.
Qed.
Theorem missingprop_12c43641953f27e0d07d13646ada34cbbe874fdf6c604d6f7022b856e5fc0bc2 : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 u1 x0)).
admit.
Qed.
Theorem missingprop_2a66f5e914e822d9f6f9be00d3f5d54d213d794d8fbbaf33681095fc49e1eadc : (forall x0, x0 :e u6 -> not (In2_lexicographic u2 x0 u2 x0)).
admit.
Qed.
Theorem missingprop_1915c0dc993faeb7b859336416ffe186a7006116a2145adcee4874f59e0d51d7 : (forall x0, x0 :e u6 -> not (In2_lexicographic u3 x0 u2 x0)).
admit.
Qed.
Theorem missingprop_7ce91b6a4df38a83ada9bde6b949239d219d83702596c9d8033c185efc3692b8 : (forall x0, x0 :e u6 -> not (In2_lexicographic u4 x0 u2 x0)).
admit.
Qed.
Theorem missingprop_4a7a758742c7e66af2ccc47cd7d429a60bfbc2350bdfab3ca23160a2cf23b3ea : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 u2 x0)).
admit.
Qed.
Theorem missingprop_8c0afb5e8c6029664390755a3ba7924a7cd35216a66abef2d1dd50cf115518a6 : (forall x0, x0 :e u6 -> not (In2_lexicographic u3 x0 u3 x0)).
admit.
Qed.
Theorem missingprop_4e1eedbd1c62a3475d65b5bd06b3af64f9b485605630aeab50afbee7f54f3d55 : (forall x0, x0 :e u6 -> not (In2_lexicographic u4 x0 u3 x0)).
admit.
Qed.
Theorem missingprop_d7d8ec59eecb06daee640d22d8b7e7d9116241b7a975bf6d1f70e8e7f75bb8ef : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 u3 x0)).
admit.
Qed.
Theorem missingprop_816523af5b2f9c4a4dfbc601a160296b917c39869a3f5b34c23c007b5e7728f5 : (forall x0, x0 :e u6 -> not (In2_lexicographic u4 x0 u4 x0)).
admit.
Qed.
Theorem missingprop_7394a12a1d063faeceb656d0872dad1b273f4172b47c35b9985809b936edb369 : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 u4 x0)).
admit.
Qed.
Theorem missingprop_8901814c7f627f3098e85b81c2e8d38a1404335c801ee0854d6a9883502b02b1 : (forall x0, x0 :e u6 -> not (In2_lexicographic u5 x0 u5 x0)).
admit.
Qed.
