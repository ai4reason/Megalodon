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
Definition u7 : set :=
 ordsucc u6.
Definition u8 : set :=
 ordsucc u7.
Definition u9 : set :=
 ordsucc u8.
Definition u10 : set :=
 ordsucc u9.
Definition u11 : set :=
 ordsucc u10.
Definition u12 : set :=
 ordsucc u11.
(* Parameter atleastp "6f4d9bb1b2eaccdca0b575e1c5e5a35eca5ce1511aa156bebf7a824f08d1d69d" "9bb9c2b375cb29534fc7413011613fb9ae940d1603e3c4bebd1b23c164c0c6f7" *)
Parameter atleastp : set -> set -> prop.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition u13 : set :=
 ordsucc u12.
Definition u14 : set :=
 ordsucc u13.
Definition u15 : set :=
 ordsucc u14.
Definition u16 : set :=
 ordsucc u15.
Definition u17 : set :=
 ordsucc u16.
Definition TwoRamseyGraph_3_6_Church17 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set => fun x2 x3 : set => x0 (x1 x2 x2 x2 x3 x3 x3 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x2 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x2 x3 x2 x2 x3 x2 x3 x3 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x3 x2 x2 x2 x2 x3 x3 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x2 x2 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3) (x1 x3 x3 x2 x3 x2 x2 x3 x2 x3 x3 x3 x2 x2 x3 x3 x3 x3) (x1 x3 x2 x3 x3 x2 x3 x2 x2 x2 x3 x3 x3 x3 x3 x2 x3 x3) (x1 x2 x3 x3 x3 x3 x2 x2 x2 x3 x2 x3 x3 x3 x2 x3 x3 x3) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x2 x3 x3 x2 x2 x2 x3 x3 x3) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x3 x2 x2 x3 x2 x3 x3 x2 x3) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x2 x3 x3 x2 x2 x3 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x3 x3 x2 x3 x3 x2 x2 x3) (x1 x3 x2 x3 x3 x3 x2 x3 x3 x2 x2 x3 x3 x2 x3 x3 x3 x2) (x1 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x2 x3 x3 x2 x3 x3 x2) (x1 x3 x3 x2 x3 x3 x3 x2 x3 x3 x3 x2 x2 x3 x3 x2 x3 x2) (x1 x2 x3 x3 x3 x2 x3 x3 x3 x3 x2 x3 x2 x3 x3 x3 x2 x2) (x1 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x3 x2 x2 x2 x2 x2)).
(* Parameter u17_to_Church17 "2198544dc93adcfb7a0840e80ac836eba8457b7bbb3ccbbb3bc46e9112667304" "02709d69b879f00cff710051a82db11b456805f2bfe835c5d14f8c542276ac60" *)
Parameter u17_to_Church17 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set.
Definition TwoRamseyGraph_3_6_17 : set -> set -> prop :=
 (fun x0 x1 : set => x0 :e u17 -> x1 :e u17 -> TwoRamseyGraph_3_6_Church17 (u17_to_Church17 x0) (u17_to_Church17 x1) = (fun x3 x4 : set => x3)).
(* Parameter binintersect "8cf6b1f490ef8eb37db39c526ab9d7c756e98b0eb12143156198f1956deb5036" "b2abd2e5215c0170efe42d2fa0fb8a62cdafe2c8fbd0d37ca14e3497e54ba729" *)
Parameter binintersect : set -> set -> set.
Axiom missingprop_95c6cbd2308b27a7edcd2a1d9389b377988e902d740d05dc7c88e6b8da945ab9 : (forall x0, atleastp 3 x0 -> (forall x1 : prop, (forall x2, x2 :e x0 -> (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> (x2 = x3 -> (forall x5 : prop, x5)) -> (x2 = x4 -> (forall x5 : prop, x5)) -> (x3 = x4 -> (forall x5 : prop, x5)) -> x1))) -> x1)).
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom binintersectE : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> and (x2 :e x0) (x2 :e x1)).
(* Parameter Church17_p "45876439a0ebffabe974dfc224bfb5fcf7cdefbe1842d969001ec0615838c25b" "2a50602e0a09f647d85d3e0968b772706a7501d07652bb47048c29a7df10757a" *)
Parameter Church17_p : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
(* Parameter Church17_lt8 "d20c7898f6bed20c2c5c2498f5ac0756d84e8e11ea47f6b6e0b8ca2759026026" "dabe1f95706bff9070b574624aec00bcc50706d76fd50e4a3929fd40311a5efa" *)
Parameter Church17_lt8 : (set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set) -> prop.
Axiom missingprop_1de520b16781fcb3c18399c4c7b22589d3753f4df4559052076db76ce0542651 : (forall x0 x1 x2 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_lt8 x0 -> Church17_lt8 x1 -> Church17_lt8 x2 -> TwoRamseyGraph_3_6_Church17 x0 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x12) = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_6_Church17 x0 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x14) = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_6_Church17 x1 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x12) = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_6_Church17 x1 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x14) = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_6_Church17 x2 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x12) = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_6_Church17 x2 (fun x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 : set => x14) = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_6_Church17 x0 x1 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_6_Church17 x0 x2 = (fun x4 x5 : set => x5) -> TwoRamseyGraph_3_6_Church17 x1 x2 = (fun x4 x5 : set => x5) -> False).
Axiom missingprop_a1e277f419507eb6211f44d9457aefea2a8b3e26b2ee84f0795856dfe97fcf6e : (forall x0, x0 :e u8 -> Church17_lt8 (u17_to_Church17 x0)).
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Axiom missingprop_46a7f5ba218e301f19d33cc265134a2df7adfd3de64e750dc665649ee8f6340d : (forall x0 x1 : set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set -> set, Church17_p x0 -> Church17_p x1 -> or (TwoRamseyGraph_3_6_Church17 x0 x1 = (fun x3 x4 : set => x3)) (TwoRamseyGraph_3_6_Church17 x0 x1 = (fun x3 x4 : set => x4))).
Axiom missingprop_c37600b80efb18922b2424c0ae3622d88c262b6e7e6fb3aa0f6bc2b0ba9f1be7 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x8).
Axiom FalseE : False -> (forall x0 : prop, x0).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom missingprop_8f7d877f09ad2d2b6bd165b15d072d92366514d5c83c4caef2b25c48dd454e7b : u17_to_Church17 u8 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x9).
Axiom missingprop_3de64cc15c614d92c317d5d39969a651d867528244eff253971f4e6ee88dced0 : Church17_p (fun x0 x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 : set => x10).
Axiom In_no3cycle : (forall x0 x1 x2, x0 :e x1 -> x1 :e x2 -> x2 :e x0 -> False).
Axiom In_8_9 : 8 :e 9.
Axiom missingprop_83b7b73de92238880d97107189e7acf45f9dc154df0447f816815407ccfc32b3 : 9 :e 10.
Axiom missingprop_c1a95e8160789154b1ae102566f570f1aea3813572fb362eeefeb21832fd0653 : u17_to_Church17 u10 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x11).
Axiom missingprop_f44342ed74648c23c8734d945bc8b2c1af5a9cb594ef51477e7844cb71f944f8 : (forall x0, x0 :e u17 -> Church17_p (u17_to_Church17 x0)).
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Axiom nat_17 : nat_p 17.
Axiom missingprop_6e6799a9f21ccdffe58af218db8306610bd1441f3fa0fcc3f6eaa957ce165f57 : u8 :e u17.
Axiom missingprop_45d11dce2d0b092bd17c01d64c29c5885c90b43dc7cb762c6d6ada999ea508c5 : (forall x0, nat_p x0 -> (forall x1, or (atleastp x1 x0) (atleastp (ordsucc x0) x1))).
Axiom nat_2 : nat_p 2.
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Axiom missingprop_8a6bdce060c93f04626730b6e01b099cc0487102a697e253c81b39b9a082262d : (forall x0, nat_p x0 -> not (atleastp (ordsucc x0) x0)).
Axiom nat_4 : nat_p 4.
Axiom atleastp_tra : (forall x0 x1 x2, atleastp x0 x1 -> atleastp x1 x2 -> atleastp x0 x2).
(* Parameter setsum "b260cb5327df5c1f762d4d3068ddb3c7cc96a9cccf7c89cee6abe113920d16f1" "afe37e3e9df1ab0b3a1c5daa589ec6a68c18bf14b3d81364ac41e1812672537a" *)
Parameter setsum : set -> set -> set.
Axiom missingprop_94b237fc7b7d3bf1a0a078f7d057802d281bf3c46c36fd56a85d339ac0f07170 : (forall x0 x1 x2 x3, atleastp x0 x2 -> atleastp x1 x3 -> (forall x4, x4 :e x0 -> nIn x4 x1) -> atleastp (binunion x0 x1) (setsum x2 x3)).
Axiom setminusE2 : (forall x0 x1 x2, x2 :e setminus x0 x1 -> nIn x2 x1).
Axiom binintersectE2 : (forall x0 x1 x2, x2 :e binintersect x0 x1 -> x2 :e x1).
(* Parameter equip "5719b3150f582144388b11e7da6c992f73c9f410c816893fdc1019f1b12097e0" "eb44199255e899126f4cd0bbf8cf2f5222a90aa4da547822cd6d81c671587877" *)
Parameter equip : set -> set -> prop.
Axiom equip_atleastp : (forall x0 x1, equip x0 x1 -> atleastp x0 x1).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Axiom missingprop_a056e7e1d4164d24a60c8047a73979083395e5609e36aaee67608ba08eded8a1 : add_nat 2 2 = 4.
Axiom equip_sym : (forall x0 x1, equip x0 x1 -> equip x1 x0).
Axiom missingprop_80fb4e499c5b9d344e7e79a37790e81cc16e6fd6cd87e88e961f3c8c4d6d418f : (forall x0 x1 x2 x3, nat_p x0 -> nat_p x1 -> equip x0 x2 -> equip x1 x3 -> equip (add_nat x0 x1) (setsum x2 x3)).
Axiom equip_ref : (forall x0, equip x0 x0).
Axiom missingprop_7319a473fd0d307c236781359af918832684b744b55bc12dd159dbca12e12419 : (forall x0 x1 x2, (forall x3, x3 :e x0 -> or (x3 = x1) (x3 = x2)) -> atleastp x0 u2).
Axiom setminusE : (forall x0 x1 x2, x2 :e setminus x0 x1 -> and (x2 :e x0) (nIn x2 x1)).
Axiom ordsuccE : (forall x0 x1, x1 :e ordsucc x0 -> or (x1 :e x0) (x1 = x0)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom missingprop_36b306548a78300032c69ad94745ff48aa8608e8a430eca548c144b9c231bda4 : u10 = u9 -> (forall x0 : prop, x0).
Axiom missingprop_08c2582e457fa5da2b4ee2676b94e0e9b149b350b636df86eee53e8e8dded2c1 : u17_to_Church17 u9 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x10).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom missingprop_e3e7876f64d57e7b4aae114d87715d9a64fc4129a1a28df53f278ae0d8499348 : u11 = u8 -> (forall x0 : prop, x0).
Axiom missingprop_adf687ac5b6c91f712b3eb1ff0c482d096f763fa394d8ea395fcfe7d367eb8f2 : u17_to_Church17 u11 = (fun x1 x2 x3 x4 x5 x6 x7 x8 x9 x10 x11 x12 x13 x14 x15 x16 x17 : set => x12).
Axiom missingprop_d80a5cdd35aff682e6edc37d56782355ff9ceaa0a69a0eeabe526b6102deafb2 : (forall x0 x1, forall x2 : set -> set -> prop, x2 x0 (binunion (setminus x0 x1) (binintersect x0 x1)) -> x2 (binunion (setminus x0 x1) (binintersect x0 x1)) x0).
Theorem missingprop_8253b61cf54670aa9b2ef8b9008829a23ced914e791a2798f72f161ed98e659a : (forall x0, x0 c= u12 -> atleastp u5 x0 -> u8 :e x0 -> u10 :e x0 -> (forall x1, x1 :e x0 -> (forall x2, x2 :e x0 -> (x1 = x2 -> (forall x3 : prop, x3)) -> not (TwoRamseyGraph_3_6_17 x1 x2))) -> False).
admit.
Qed.
