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
(* Parameter and "87fba1d2da67f06ec37e7ab47c3ef935ef8137209b42e40205afb5afd835b738" "2ba7d093d496c0f2909a6e2ea3b2e4a943a97740d27d15003a815d25340b379a" *)
Parameter and : prop -> prop -> prop.
Definition inj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x0 -> (forall x4, x4 :e x0 -> x2 x3 = x2 x4 -> x3 = x4))).
Definition surj : set -> set -> (set -> set) -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => and (forall x3, x3 :e x0 -> x2 x3 :e x1) (forall x3, x3 :e x1 -> (forall x4 : prop, (forall x5, and (x5 :e x0) (x2 x5 = x3) -> x4) -> x4))).
(* Parameter omega "39cdf86d83c7136517f803d29d0c748ea45a274ccbf9b8488f9cda3e21f4b47c" "6fc30ac8f2153537e397b9ff2d9c981f80c151a73f96cf9d56ae2ee27dfd1eb2" *)
Parameter omega : set.
(* Parameter missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 "ae1e1b0c86cebae1f9b3a1770183528d91f067a075ed4218d4359926c8bac5ac" "83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198" *)
Parameter missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 : set -> set -> prop.
Definition missingname_acdba35036356b6f3f5277943f93a3d5f62a97e30846e785cd1f436a46fe2472 : set -> prop :=
 (fun x0 : set => forall x1 : prop, (forall x2, and (x2 :e omega) (missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 x0 x2) -> x1) -> x1).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition missingname_5cef7963c2ff8ab08ed9fb1a7909f692a397f7c9dd5b12a6e9a5b1fc14e360d9 : set -> prop :=
 (fun x0 : set => not (missingname_acdba35036356b6f3f5277943f93a3d5f62a97e30846e785cd1f436a46fe2472 x0)).
(* Parameter mul_nat "7a45b2539da964752f7e9409114da7fc18caef138c5d0699ec226407ece64991" "35a1ef539d3e67ef8257da2bd992638cf1225c34d637bc7d8b45cf51e0445d80" *)
Parameter mul_nat : set -> set -> set.
Definition divides_nat : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e omega) (x1 :e omega)) (forall x2 : prop, (forall x3, and (x3 :e omega) (mul_nat x0 x3 = x1) -> x2) -> x2)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
(* Parameter or "cfe97741543f37f0262568fe55abbab5772999079ff734a49f37ed123e4363d7" "9577468199161470abc0815b6a25e03706a4e61d5e628c203bf1f793606b1153" *)
Parameter or : prop -> prop -> prop.
Definition prime_nat : set -> prop :=
 (fun x0 : set => and (and (x0 :e omega) (1 :e x0)) (forall x1, x1 :e omega -> divides_nat x1 x0 -> or (x1 = 1) (x1 = x0))).
(* Parameter setminus "cc569397a7e47880ecd75c888fb7c5512aee4bcb1e7f6bd2c5f80cccd368c060" "c68e5a1f5f57bc5b6e12b423f8c24b51b48bcc32149a86fc2c30a969a15d8881" *)
Parameter setminus : set -> set -> set.
Definition coprime_nat : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e omega) (x1 :e omega)) (forall x2, x2 :e setminus omega 1 -> divides_nat x2 x0 -> divides_nat x2 x1 -> x2 = 1)).
(* Parameter add_nat "e4d45122168d3fb3f5723ffffe4d368988a1be62792f272e949c6728cec97865" "afa8ae66d018824f39cfa44fb10fe583334a7b9375ac09f92d622a4833578d1a" *)
Parameter add_nat : set -> set -> set.
Definition missingname_23f216cd4975d7a2b1380d30e7b48227ee30bb436b18413678721f3abebc9c6a : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (and (x0 :e omega) (x1 :e omega)) (x2 :e omega)) (or (forall x3 : prop, (forall x4, and (x4 :e omega) (add_nat x0 (mul_nat x4 x2) = x1) -> x3) -> x3) (forall x3 : prop, (forall x4, and (x4 :e omega) (add_nat x1 (mul_nat x4 x2) = x0) -> x3) -> x3))).
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
Definition exp_nat : set -> set -> set :=
 (fun x0 : set => nat_primrec 1 (fun x1 : set => mul_nat x0)).
Definition even_nat : set -> prop :=
 (fun x0 : set => and (x0 :e omega) (forall x1 : prop, (forall x2, and (x2 :e omega) (x0 = mul_nat 2 x2) -> x1) -> x1)).
Definition odd_nat : set -> prop :=
 (fun x0 : set => and (x0 :e omega) (forall x1, x1 :e omega -> x0 = mul_nat 2 x1 -> (forall x2 : prop, x2))).
Definition nat_factorial : set -> set :=
 nat_primrec 1 (fun x0 : set => mul_nat (ordsucc x0)).
(* Parameter ap "58c1782da006f2fb2849c53d5d8425049fad551eb4f8025055d260f0c9e1fe40" "c7aaa670ef9b6f678b8cf10b13b2571e4dc1e6fde061d1f641a5fa6c30c09d46" *)
Parameter ap : set -> set -> set.
(* Parameter lam "93592da87a6f2da9f7eb0fbd449e0dc4730682572e0685b6a799ae16c236dcae" "8acbb2b5de4ab265344d713b111d82b0048c8a4bf732a67ad35f1054a4eb4642" *)
Parameter lam : set -> (set -> set) -> set.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Definition missingname_a2a94787eecf415932211db83d5a2a775d4cb8f66aa2fabf6531432170335389 : set -> set -> set :=
 (fun x0 : set => ap (nat_primrec (lam omega (fun x1 : set => If_i (x1 = 0) 1 0)) (fun x1 x2 : set => lam omega (fun x3 : set => If_i (x3 = 0) 1 (add_nat (ap x2 (Union x3)) (ap x2 x3)))) x0)).
(* Parameter Sep "f7e63d81e8f98ac9bc7864e0b01f93952ef3b0cbf9777abab27bcbd743b6b079" "f336a4ec8d55185095e45a638507748bac5384e04e0c48d008e4f6a9653e9c44" *)
Parameter Sep : set -> (set -> prop) -> set.
Definition missingname_64174d548079a4780fc36a50eff6d93818b211758184fd78a2b61c790c0d3202 : set -> set :=
 (fun x0 : set => Eps_i (fun x1 : set => and (x1 :e omega) (missingname_83e7e1dec223e576ffbd3a4af6d06d926c88390b6b4bbe5f6d4db16b20975198 x1 (Sep (ordsucc x0) (fun x2 : set => and (0 :e x2) (coprime_nat x2 x0)))))).
(* Parameter div_SNo "92a56a0f4680f62291a5420bbb5c8878605fd96283094663ba30661ca618a193" "16510b6e91dc8f8934f05b3810d2b54c286c5652cf26501797ea52c33990fa93" *)
Parameter div_SNo : set -> set -> set.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition missingname_9735b8127c20c4b92d6559ced26b4eea7539060d34ed13bc0b06efe0f6564582 : set -> set -> set :=
 (fun x0 x1 : set => div_SNo (nat_factorial x0) (mul_SNo (nat_factorial (add_SNo x0 (minus_SNo x1))) (nat_factorial x1))).
(* Parameter int_alt1 "8062568df0fbf4a27ab540f671ff8299e7069e28c0a2a74bd26c0cb9b3ed98fb" "4daffb669546d65312481b5f945330815f8f5c460c7278516e497b08a82751e5" *)
Parameter int_alt1 : set.
Definition divides_int_alt1 : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e int_alt1) (x1 :e int_alt1)) (forall x2 : prop, (forall x3, and (x3 :e int_alt1) (mul_SNo x0 x3 = x1) -> x2) -> x2)).
Definition missingname_aea710807b7901288ae25daacdd1e52348dfbe79c9a58fabb5e91c68e15a1581 : set -> set -> set -> prop :=
 (fun x0 x1 x2 : set => and (and (and (x0 :e int_alt1) (x1 :e int_alt1)) (x2 :e setminus omega 1)) (divides_int_alt1 (add_SNo x0 (minus_SNo x1)) x2)).
Definition missingname_48ca77268e35362c65956d7fd4145d07598e7a91e7ef4a1e6af043bc1202b37f : set -> set -> prop :=
 (fun x0 x1 : set => and (and (x0 :e int_alt1) (x1 :e int_alt1)) (forall x2, x2 :e setminus omega 1 -> divides_int_alt1 x2 x0 -> divides_int_alt1 x2 x1 -> x2 = 1)).
Definition exp_SNo_nat : set -> set -> set :=
 (fun x0 : set => nat_primrec 1 (fun x1 : set => mul_SNo x0)).
(* Parameter explicit_Nats "4a59caa11140eabb1b7db2d3493fe76a92b002b3b27e3dfdd313708c6c6ca78f" "3fb62f75e778736947d086a36d35ebe45a5d60bf0a340a0761ba08a396d4123a" *)
Parameter explicit_Nats : set -> set -> (set -> set) -> prop.
(* Parameter explicit_Nats_primrec "5ec40a637f9843917a81733636ffe333120e9a78db0c1236764d271d8704674a" "a61e60c0704e01255992ecc776a771ad4ef672b2ed0f4edea9713442d02c0ba9" *)
Parameter explicit_Nats_primrec : set -> set -> (set -> set) -> set -> (set -> set -> set) -> set -> set.
(* Parameter explicit_Nats_one_plus "96a3e501560225fd48b85405b64d8f27956fb33c35c2ef330600bc21c1ef0f6b" "c14dd5291f7204df5484a3c38ca94107f29d636a3cdfbd67faf1196b3bf192d6" *)
Parameter explicit_Nats_one_plus : set -> set -> (set -> set) -> set -> set -> set.
Definition explicit_Nats_one_mult_alt : set -> set -> (set -> set) -> set -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 : set => explicit_Nats_primrec x0 x1 x2 x3 (fun x4 : set => explicit_Nats_one_plus x0 x1 x2 x3)).
Definition explicit_Nats_lt : set -> set -> (set -> set) -> set -> set -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => and (and (x3 :e x0) (x4 :e x0)) (forall x5 : prop, (forall x6, and (x6 :e x0) (explicit_Nats_one_plus x0 x1 x2 x6 x3 = x4) -> x5) -> x5)).
Definition missingname_ed54c4ef894f8fc192aac4d9c397f0ccc5410f258aac72b97edead459b1ba7a0 : set -> set -> (set -> set) -> set -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 : set => and (x3 :e x0) (forall x4, x4 :e x0 -> explicit_Nats_lt x0 x1 x2 x4 x3 -> or (x4 = x1) (x4 = x3))).
Definition explicit_Nats_max_is_one : set -> set -> (set -> set) -> set -> set -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => and (and (x3 :e x0) (x4 :e x0)) (forall x5, x5 :e x0 -> explicit_Nats_lt x0 x1 x2 x5 x3 -> explicit_Nats_lt x0 x1 x2 x5 x4 -> x5 = 1)).
Definition missingname_7a13016cb85740499b2886480da5741d2b1e3717c124200ee043ce111ce12f56 : set -> set -> (set -> set) -> set -> set -> set -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 x5 : set => and (and (and (x3 :e x0) (x4 :e x0)) (x5 :e x0)) (or (or (x3 = x4) (forall x6 : prop, (forall x7, and (x7 :e x0) (explicit_Nats_one_plus x0 x1 x2 x3 (explicit_Nats_one_plus x0 x1 x2 x7 x5) = x4) -> x6) -> x6)) (forall x6 : prop, (forall x7, and (x7 :e x0) (explicit_Nats_one_plus x0 x1 x2 x4 (explicit_Nats_one_plus x0 x1 x2 x7 x5) = x3) -> x6) -> x6))).
Definition explicit_Nats_one_lt : set -> set -> (set -> set) -> set -> set -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => and (and (x3 :e x0) (x4 :e x0)) (forall x5 : prop, (forall x6, and (x6 :e x0) (explicit_Nats_one_plus x0 x1 x2 x3 x6 = x4) -> x5) -> x5)).
Definition explicit_Nats_one_le : set -> set -> (set -> set) -> set -> set -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 x4 : set => and (and (x3 :e x0) (x4 :e x0)) (or (x3 = x4) (forall x5 : prop, (forall x6, and (x6 :e x0) (explicit_Nats_one_plus x0 x1 x2 x3 x6 = x4) -> x5) -> x5))).
Definition missingname_44bd204417d2489949072e8c6ef24658350a57d73ebda706afd5060031a10d1f : set -> set -> (set -> set) -> set -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 : set => and (x3 :e x0) (forall x4 : prop, (forall x5, and (x5 :e x0) (x3 = explicit_Nats_one_plus x0 x1 x2 (x2 x1) x5) -> x4) -> x4)).
Definition missingname_b033c322cf8acbb09864b13318f3651b4dc325f5f32aef9e288eea3b19262141 : set -> set -> (set -> set) -> set -> prop :=
 (fun x0 x1 : set => fun x2 : set -> set => fun x3 : set => and (x3 :e x0) (forall x4, x4 :e x0 -> x3 = explicit_Nats_one_plus x0 x1 x2 (x2 x1) x4 -> (forall x5 : prop, x5))).
Definition missingname_ebe21cf0d4b4cc0365f2235dd4a8834b104b832943c105da7ee19dd4a2069bdf : set -> set -> (set -> set) -> set -> set :=
 (fun x0 x1 : set => fun x2 : set -> set => explicit_Nats_primrec x0 x1 x2 x1 (fun x3 x4 : set => If_i (and (x3 = x1 -> (forall x5 : prop, x5)) (explicit_Nats_max_is_one x0 x1 x2 x3 x3)) (x2 x4) x4)).
