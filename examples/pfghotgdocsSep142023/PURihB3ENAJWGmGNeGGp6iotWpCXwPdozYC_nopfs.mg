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
Definition ChurchBoolTru : set -> set -> set :=
 (fun x0 x1 : set => x0).
Definition ChurchBoolFal : set -> set -> set :=
 (fun x0 x1 : set => x1).
Theorem missingprop_af7df763fd0193d8c3e3722c850a73ec398ea041c70f9eb9b8651624239a4375 : ChurchBoolTru = (fun x1 x2 : set => x1).
admit.
Qed.
Theorem missingprop_fe36caae5784dcaccf90e3c33c4c3db05a48fc46bf7e1321a13b032e9121e798 : ChurchBoolFal = (fun x1 x2 : set => x2).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db : (set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set => or (x0 = ChurchBoolTru) (x0 = ChurchBoolFal)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Theorem missingprop_4b2c4a0487c2b1a228c5d07bbf352ffca25633bec988b0f94ee850e02347e107 : missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db ChurchBoolTru.
admit.
Qed.
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Theorem missingprop_5066d1b2b30c335c067f01ac13f147e53d00378a90e5b6ab1432446a8181f6dd : missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db ChurchBoolFal.
admit.
Qed.
Definition missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c : (set -> set -> set) -> prop :=
 (fun x0 : set -> set -> set => forall x1 : (set -> set -> set) -> (set -> set -> set) -> prop, x1 x0 ChurchBoolFal -> x1 ChurchBoolFal x0).
Definition permargs_i_1_0 : (set -> set -> set) -> set -> set -> set :=
 (fun x0 : set -> set -> set => fun x1 x2 : set => x0 x2 x1).
Definition missingname_792d152efe262dcaabf368bc6467ac057697a53fc33616f54269226b8862b39f : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set => fun x2 x3 : set => x0 x2 (x1 x2 x3)).
Definition missingname_132c332e15cb143670ab4045b0f1578af13e57d6190aa1c79e16e4c522afaa7f : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set => fun x2 x3 : set => x0 (x1 x2 x3) x3).
Definition missingname_b13bb41dfd326d0b549613c3332782ec41059394ab6982ec488452a11049045f : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set => fun x2 x3 : set => x0 x3 (x1 x2 x3)).
Definition missingname_3f722e3216ed8fcdbdfaa42fe61e6869e0e4fe9464064bd2d51c3b063940b714 : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : set -> set -> set => fun x2 x3 : set => x0 (x1 x3 x2) (x1 x2 x3)).
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom neq_0_1 : 0 = 1 -> (forall x0 : prop, x0).
Theorem missingprop_2a02b07cb2d1646750378f6f1ee4d840c838599ffd77846a5a2b747d49a8a268 : ChurchBoolTru = ChurchBoolFal -> (forall x0 : prop, x0).
admit.
Qed.
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Theorem missingprop_4db3dccc9d2b781cbc51e143c21b1ce8ea7a94ab506258592ed1c524bf6deaea : not (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c ChurchBoolTru).
admit.
Qed.
Theorem missingprop_c16a7e66d013fefc3e2d9d08fe341ba71aa55df92f5de99da11396ce50578700 : missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c ChurchBoolFal.
admit.
Qed.
(* Parameter If_i "8c8f550868df4fdc93407b979afa60092db4b1bb96087bc3c2f17fadf3f35cbf" "b8ff52f838d0ff97beb955ee0b26fad79602e1529f8a2854bda0ecd4193a8a3c" *)
Parameter If_i : prop -> set -> set -> set.
Axiom prop_ext_2 : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> x0 = x1).
Axiom dneg : (forall x0 : prop, not (not x0) -> x0).
Axiom If_i_0 : (forall x0 : prop, forall x1 x2, not x0 -> If_i x0 x1 x2 = x2).
Axiom If_i_1 : (forall x0 : prop, forall x1 x2, x0 -> If_i x0 x1 x2 = x1).
Theorem missingprop_71c6763723786f95438cfb0e9cfa65df10d21274aabcef366ef5cfe061aa1529 : (forall x0 : prop, forall x1 : prop -> prop -> prop, x1 (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (fun x2 x3 : set => If_i x0 x3 x2)) x0 -> x1 x0 (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (fun x2 x3 : set => If_i x0 x3 x2))).
admit.
Qed.
Theorem missingprop_e70c489a91a7dcfebb42335368e06435c9678382cf578964b235ed687bf7f82d : (forall x0 : set -> set -> set, missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (permargs_i_1_0 x0) -> not (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x0)).
admit.
Qed.
Theorem missingprop_23887c6c6791ed2bf5e2668f34cea8ff646aeb484406d0c3f963bfbc84f5541f : permargs_i_1_0 ChurchBoolTru = ChurchBoolFal.
admit.
Qed.
Theorem missingprop_bf87942062d8ca4647b6bea5efa5f73fcde3e42fa5decd577f85810fb9a2db81 : permargs_i_1_0 ChurchBoolFal = ChurchBoolTru.
admit.
Qed.
Axiom FalseE : False -> (forall x0 : prop, x0).
Theorem missingprop_22313e17c4c59d6d8dbe2958633ad6b7e623ac8998f7980148e06205729b37b4 : (forall x0 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (permargs_i_1_0 x0) = not (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x0)).
admit.
Qed.
Theorem missingprop_e60cd881c7ea9b0aacdf3b02255e99c384363fec424a860b94c5a3c38649498c : (forall x0 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (permargs_i_1_0 x0)).
admit.
Qed.
Theorem missingprop_07c2bdb5cd2be706366e254d45962138b1f3b0eafada1c5669b4075eca4ac19b : (forall x0 x1 : set -> set -> set, missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x0 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x1 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_792d152efe262dcaabf368bc6467ac057697a53fc33616f54269226b8862b39f x0 x1)).
admit.
Qed.
Theorem missingprop_1becf59e2b0a0d9ff1e1505a7a603dfecdbed9318a6b70349a05c972b5872736 : (forall x0 x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_792d152efe262dcaabf368bc6467ac057697a53fc33616f54269226b8862b39f x0 x1)).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem missingprop_6891c2c4cbe5dbf32677e09d76954ef64727a2786342d5026c3517fb0288e38a : (forall x0 x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_792d152efe262dcaabf368bc6467ac057697a53fc33616f54269226b8862b39f x0 x1) = and (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x0) (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x1)).
admit.
Qed.
Theorem missingprop_3b229b9e11502aa649ddc1c912619ddb1c48e5eed9d2f5f044b1a524ed6e72b2 : (forall x0 x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_132c332e15cb143670ab4045b0f1578af13e57d6190aa1c79e16e4c522afaa7f x0 x1)).
admit.
Qed.
Theorem missingprop_dc639444341820cc8ac415204064e1686ba12f18cf7044b00dab38d1f90436e3 : (forall x0 x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_132c332e15cb143670ab4045b0f1578af13e57d6190aa1c79e16e4c522afaa7f x0 x1) = or (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x0) (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x1)).
admit.
Qed.
Theorem missingprop_c29a3f13f0a73cd4d433a441dcb352d17cae3c51fffc7d7b60ef3af8d98bcdfd : (forall x0 x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_b13bb41dfd326d0b549613c3332782ec41059394ab6982ec488452a11049045f x0 x1)).
admit.
Qed.
Theorem missingprop_540ef170f8552e61b87f156d7b5a7cc49598ca87410a437fd742f8eb82c63a04 : (forall x0 x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_b13bb41dfd326d0b549613c3332782ec41059394ab6982ec488452a11049045f x0 x1) = (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x0 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x1)).
admit.
Qed.
Theorem missingprop_79548ff982945a6416517d45c3ad8c5d872f305466e806493afdd4f6a10f88f4 : (forall x0 x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_3f722e3216ed8fcdbdfaa42fe61e6869e0e4fe9464064bd2d51c3b063940b714 x0 x1)).
admit.
Qed.
Definition iff : prop -> prop -> prop :=
 (fun x0 x1 : prop => and (x0 -> x1) (x1 -> x0)).
Axiom iffI : (forall x0 x1 : prop, (x0 -> x1) -> (x1 -> x0) -> iff x0 x1).
Theorem missingprop_fd3d2e7f783867b84b25b06a9614a22d40979688c105b0eabc60f25fb84d3565 : (forall x0 x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_3f722e3216ed8fcdbdfaa42fe61e6869e0e4fe9464064bd2d51c3b063940b714 x0 x1) = iff (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x0) (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c x1)).
admit.
Qed.
Axiom iff_refl : (forall x0 : prop, iff x0 x0).
Theorem missingprop_3d0028a2d57af707e8620119bacd670d298048a922bcb35db3d1b174e76468c4 : (forall x0 x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x0 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_3f722e3216ed8fcdbdfaa42fe61e6869e0e4fe9464064bd2d51c3b063940b714 x0 x1) = (x0 = x1)).
admit.
Qed.
Definition missingname_91aba9b131a7808e8b8899f5e619d2a78fe76815c7f25b7df01c0b387c9793ec : ((set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (set -> set -> set) -> set -> set -> set => missingname_792d152efe262dcaabf368bc6467ac057697a53fc33616f54269226b8862b39f (x0 ChurchBoolTru) (x0 ChurchBoolFal)).
Definition missingname_35679a0f8445869c94133e6427c00b64926e5191b565cad2de5df35770369d95 : ((set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (set -> set -> set) -> set -> set -> set => missingname_132c332e15cb143670ab4045b0f1578af13e57d6190aa1c79e16e4c522afaa7f (x0 ChurchBoolTru) (x0 ChurchBoolFal)).
Theorem missingprop_ab4214f1a2c3a2db87f0adca5ced74f7623bce7b4515d8ff0b65e6c4b80e6cfc : (forall x0 : (set -> set -> set) -> set -> set -> set, (forall x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_91aba9b131a7808e8b8899f5e619d2a78fe76815c7f25b7df01c0b387c9793ec x0)).
admit.
Qed.
Theorem missingprop_b68b358a15caf16d5fad4af9ff92c73636fdab478a3b1e7982a0f7f63be43fee : (forall x0 : (set -> set -> set) -> set -> set -> set, (forall x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_35679a0f8445869c94133e6427c00b64926e5191b565cad2de5df35770369d95 x0)).
admit.
Qed.
Theorem missingprop_673b5a0ff482ed303e49c4de91639680dfe4eefa3123a40c753c65a98569c7a1 : (forall x0 : (set -> set -> set) -> set -> set -> set, (forall x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_91aba9b131a7808e8b8899f5e619d2a78fe76815c7f25b7df01c0b387c9793ec x0) = (forall x2 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x2 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (x0 x2))).
admit.
Qed.
Theorem missingprop_f0cbad33a378e3e85280c199dc1e363589ab8e9ee5da068efeebef66c30d2dc6 : (forall x0 : (set -> set -> set) -> set -> set -> set, (forall x1 : set -> set -> set, missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_35679a0f8445869c94133e6427c00b64926e5191b565cad2de5df35770369d95 x0) = (forall x2 : prop, (forall x3 : set -> set -> set, and (missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db x3) (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (x0 x3)) -> x2) -> x2)).
admit.
Qed.
Definition missingname_6b7c843a0ad78ff8e468206d1828ddb5a88aab5415d071258483af482b92c6b7 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set => x0 ChurchBoolTru ChurchBoolTru).
Definition missingname_19578582e28e520ae18640d2da9cfec3ac640cd755b8c49951cb91fa674e73a0 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set => x0 ChurchBoolTru ChurchBoolFal).
Definition missingname_d616e801762a7e0b9e4e1f65312c0e6fe6dbec7c6eb43b9297104e2c3939fd97 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set => x0 ChurchBoolFal ChurchBoolTru).
Definition missingname_2e12608647c99a68694a61275a0e9156460645755458f1551d68b75293953059 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set => x0 ChurchBoolFal ChurchBoolFal).
Definition missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> prop :=
 (fun x0 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => and (and (x0 = (fun x2 : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set => x2 (x0 (fun x3 x4 : set -> set -> set => x3)) (x0 (fun x3 x4 : set -> set -> set => x4)))) (missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 (fun x1 x2 : set -> set -> set => x1)))) (missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 (fun x1 x2 : set -> set -> set => x2)))).
Axiom and3I : (forall x0 x1 x2 : prop, x0 -> x1 -> x2 -> and (and x0 x1) x2).
Theorem missingprop_50153708351b89ea01fe4eeffb39103b18c856cd6a2295bdffe9b6a1af51ccc1 : missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 missingname_6b7c843a0ad78ff8e468206d1828ddb5a88aab5415d071258483af482b92c6b7.
admit.
Qed.
Theorem missingprop_ca69d5590f16a82b3262090a8a8e845f4d382952a1b28456e8910491ba455305 : missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 missingname_19578582e28e520ae18640d2da9cfec3ac640cd755b8c49951cb91fa674e73a0.
admit.
Qed.
Theorem missingprop_8900aa9bfe05afa1f40e588aae88d401cf7435714fee66a8f40d56c6b91d7640 : missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 missingname_d616e801762a7e0b9e4e1f65312c0e6fe6dbec7c6eb43b9297104e2c3939fd97.
admit.
Qed.
Theorem missingprop_4237e1db3b44c4a64571a1c1c32c1feb5b80ca5727ff1508690c3893d070c688 : missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 missingname_2e12608647c99a68694a61275a0e9156460645755458f1551d68b75293953059.
admit.
Qed.
Definition missingname_e705adc25b2512365394b0e25f155fbe016b3b60511bfca72bbcceb2dfdbf19d : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => missingname_792d152efe262dcaabf368bc6467ac057697a53fc33616f54269226b8862b39f (missingname_3f722e3216ed8fcdbdfaa42fe61e6869e0e4fe9464064bd2d51c3b063940b714 (x0 (fun x2 x3 : set -> set -> set => x2)) (x1 (fun x2 x3 : set -> set -> set => x2))) (missingname_3f722e3216ed8fcdbdfaa42fe61e6869e0e4fe9464064bd2d51c3b063940b714 (x0 (fun x2 x3 : set -> set -> set => x3)) (x1 (fun x2 x3 : set -> set -> set => x3)))).
Definition missingname_ebd1166cec90389df647753858049cc6fd98aabc3fb4fd2dca22ac79311d7847 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set => missingname_91aba9b131a7808e8b8899f5e619d2a78fe76815c7f25b7df01c0b387c9793ec (fun x1 : set -> set -> set => missingname_91aba9b131a7808e8b8899f5e619d2a78fe76815c7f25b7df01c0b387c9793ec (fun x2 : set -> set -> set => x0 (fun x3 : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set => x3 x1 x2)))).
Definition missingname_aac1c284a47e5dd485b71b33f9d5736b411bb6383a9586a9ba39ad5e68f28afa : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set => missingname_35679a0f8445869c94133e6427c00b64926e5191b565cad2de5df35770369d95 (fun x1 : set -> set -> set => missingname_35679a0f8445869c94133e6427c00b64926e5191b565cad2de5df35770369d95 (fun x2 : set -> set -> set => x0 (fun x3 : (set -> set -> set) -> (set -> set -> set) -> set -> set -> set => x3 x1 x2)))).
Theorem missingprop_0c06dd5d44b144394d6a3ddd7a8663f6d933e9c472f59f1dc1655edf63ac023d : (forall x0 x1 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 x0 -> missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_e705adc25b2512365394b0e25f155fbe016b3b60511bfca72bbcceb2dfdbf19d x0 x1)).
admit.
Qed.
Theorem missingprop_22422e90a1d73874085e26f1507a49dad42da42b582ccb1dd9500eb92c8cb548 : (forall x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set, (forall x1 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_ebd1166cec90389df647753858049cc6fd98aabc3fb4fd2dca22ac79311d7847 x0)).
admit.
Qed.
Theorem missingprop_b8b36d1309d23573d39f50bf215614db443fee92079ecdecdfe7e2612363510b : (forall x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set, (forall x1 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_aac1c284a47e5dd485b71b33f9d5736b411bb6383a9586a9ba39ad5e68f28afa x0)).
admit.
Qed.
Theorem missingprop_2f766ca4fba18e4ffcf2933872105bdd6cbc546146efe808f87254bbe50ed160 : (forall x0 x1 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 x0 -> missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 x1 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_e705adc25b2512365394b0e25f155fbe016b3b60511bfca72bbcceb2dfdbf19d x0 x1) = (x0 = x1)).
admit.
Qed.
Theorem missingprop_fab341239b745c35a31d9a39af165a59f3b7bf553f09b5e965a8b76d704c99fb : (forall x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set, (forall x1 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_ebd1166cec90389df647753858049cc6fd98aabc3fb4fd2dca22ac79311d7847 x0) = (forall x2 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 x2 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (x0 x2))).
admit.
Qed.
Theorem missingprop_f9b5e20c634bd07d04cdde49271fdc509ca457a000f2db56fe81b30cf7b0806f : (forall x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set, (forall x1 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_aac1c284a47e5dd485b71b33f9d5736b411bb6383a9586a9ba39ad5e68f28afa x0) = (forall x2 : prop, (forall x3 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, and (missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 x3) (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (x0 x3)) -> x2) -> x2)).
admit.
Qed.
Definition missingname_7856ab35a17346778ff72e714a20078e9215318d10c246366f4f36f39b6f2ddc : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_6b7c843a0ad78ff8e468206d1828ddb5a88aab5415d071258483af482b92c6b7 missingname_6b7c843a0ad78ff8e468206d1828ddb5a88aab5415d071258483af482b92c6b7).
Definition missingname_eb8e5543e37acbd7fc3208e421b129d67161d5c2caf23d2b4cc33bc4956e40fe : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_6b7c843a0ad78ff8e468206d1828ddb5a88aab5415d071258483af482b92c6b7 missingname_19578582e28e520ae18640d2da9cfec3ac640cd755b8c49951cb91fa674e73a0).
Definition missingname_20b3857aef8d544bac0cf5d0bdb8bac91f12ea6f9ee684ecd23caed263d7821d : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_6b7c843a0ad78ff8e468206d1828ddb5a88aab5415d071258483af482b92c6b7 missingname_d616e801762a7e0b9e4e1f65312c0e6fe6dbec7c6eb43b9297104e2c3939fd97).
Definition missingname_850e4d6075efef1aba4bb910c31b9a2cacf9cab409c2d330eb8c8b328f15c002 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_6b7c843a0ad78ff8e468206d1828ddb5a88aab5415d071258483af482b92c6b7 missingname_2e12608647c99a68694a61275a0e9156460645755458f1551d68b75293953059).
Definition missingname_1dc85a2d55630326812d415e9450c8cdcc158cd7cd935036b61c36416381c186 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_19578582e28e520ae18640d2da9cfec3ac640cd755b8c49951cb91fa674e73a0 missingname_6b7c843a0ad78ff8e468206d1828ddb5a88aab5415d071258483af482b92c6b7).
Definition missingname_6f1bc79e100a3541d4a0a6b97c5636c720cb34c910b9d2b3bfb35ed00187b64a : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_19578582e28e520ae18640d2da9cfec3ac640cd755b8c49951cb91fa674e73a0 missingname_19578582e28e520ae18640d2da9cfec3ac640cd755b8c49951cb91fa674e73a0).
Definition missingname_f34993ba6842f50d93034900e7716946fd8e27e41a688f365f122cec5caab416 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_19578582e28e520ae18640d2da9cfec3ac640cd755b8c49951cb91fa674e73a0 missingname_d616e801762a7e0b9e4e1f65312c0e6fe6dbec7c6eb43b9297104e2c3939fd97).
Definition missingname_30f509f544633ef46a6274e2479156f9415b4a9f5858b8814b191864a5bbc455 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_19578582e28e520ae18640d2da9cfec3ac640cd755b8c49951cb91fa674e73a0 missingname_2e12608647c99a68694a61275a0e9156460645755458f1551d68b75293953059).
Definition missingname_f1ac4d4fd83a8257c8385fed4f7c965698fb96373779e13ac4460675bbd64a3c : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_d616e801762a7e0b9e4e1f65312c0e6fe6dbec7c6eb43b9297104e2c3939fd97 missingname_6b7c843a0ad78ff8e468206d1828ddb5a88aab5415d071258483af482b92c6b7).
Definition missingname_39d529ea5d748e166ce66e2060e9dc9b39001bcbce3c83f50627e81483fe49e0 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_d616e801762a7e0b9e4e1f65312c0e6fe6dbec7c6eb43b9297104e2c3939fd97 missingname_19578582e28e520ae18640d2da9cfec3ac640cd755b8c49951cb91fa674e73a0).
Definition missingname_dab7ccfb8224f6a417cac845071049e2e26548ac1a15607079b291792e5285af : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_d616e801762a7e0b9e4e1f65312c0e6fe6dbec7c6eb43b9297104e2c3939fd97 missingname_d616e801762a7e0b9e4e1f65312c0e6fe6dbec7c6eb43b9297104e2c3939fd97).
Definition missingname_5b8107073c0f39f1464f3360476d52fa49fc4da2e882ff69f7ce43aaa99c5801 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_d616e801762a7e0b9e4e1f65312c0e6fe6dbec7c6eb43b9297104e2c3939fd97 missingname_2e12608647c99a68694a61275a0e9156460645755458f1551d68b75293953059).
Definition missingname_154b7c06c42ba55df7f2cc6bc662297d13a4fce4c938dec68159838eb5847331 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_2e12608647c99a68694a61275a0e9156460645755458f1551d68b75293953059 missingname_6b7c843a0ad78ff8e468206d1828ddb5a88aab5415d071258483af482b92c6b7).
Definition missingname_8409c09b96326e1df304cecb6e3aaf2d5be9915a8bbdb8b8588cfd763084e85a : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_2e12608647c99a68694a61275a0e9156460645755458f1551d68b75293953059 missingname_19578582e28e520ae18640d2da9cfec3ac640cd755b8c49951cb91fa674e73a0).
Definition missingname_544593a3cb23678ca88c231fdbbf7bd0bc454dc457839d2a8418e6d578ac02d0 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_2e12608647c99a68694a61275a0e9156460645755458f1551d68b75293953059 missingname_d616e801762a7e0b9e4e1f65312c0e6fe6dbec7c6eb43b9297104e2c3939fd97).
Definition missingname_f407d023cec878de0c8b411575d1d9262549bb24c96c5ea6f7d1a8a4aa569efd : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 missingname_2e12608647c99a68694a61275a0e9156460645755458f1551d68b75293953059 missingname_2e12608647c99a68694a61275a0e9156460645755458f1551d68b75293953059).
Definition missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e : (((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> prop :=
 (fun x0 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => and (and (x0 = (fun x2 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x2 (x0 (fun x3 x4 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x3)) (x0 (fun x3 x4 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x4)))) (missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 (x0 (fun x1 x2 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x1)))) (missingname_39fd9549c17bb512eb0f99b47ad27071bb34f5e0d246d1966322bbecfcadbab8 (x0 (fun x1 x2 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x2)))).
Theorem missingprop_b5e039a78d8c0aa3a89fe9dd19383fd406d80e9c15465a9ea339d5eaa9cc2337 : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_7856ab35a17346778ff72e714a20078e9215318d10c246366f4f36f39b6f2ddc.
admit.
Qed.
Theorem missingprop_711b5d990e50afe5c469c7676dfb8995d167163f10ad20161cb2d7825958f63a : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_eb8e5543e37acbd7fc3208e421b129d67161d5c2caf23d2b4cc33bc4956e40fe.
admit.
Qed.
Theorem missingprop_58d3308e8dfbd38342fa0dbc00271ff3b7a98be7aa51c8135db7cd6dfeee9b12 : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_20b3857aef8d544bac0cf5d0bdb8bac91f12ea6f9ee684ecd23caed263d7821d.
admit.
Qed.
Theorem missingprop_721fc86ddbe3daf0d70cd3fbb7ba29cd471e16b70b9367acfa945c957f03166b : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_850e4d6075efef1aba4bb910c31b9a2cacf9cab409c2d330eb8c8b328f15c002.
admit.
Qed.
Theorem missingprop_8697e8c35d248596b372f324c81d02a98ea067ac490eccc967a46f1265d6d5cc : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_1dc85a2d55630326812d415e9450c8cdcc158cd7cd935036b61c36416381c186.
admit.
Qed.
Theorem missingprop_44f881debc65d855da92013b435dfd66db2816bf7bba9893f3b23470a939483c : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_6f1bc79e100a3541d4a0a6b97c5636c720cb34c910b9d2b3bfb35ed00187b64a.
admit.
Qed.
Theorem missingprop_e9b0f31a437e1055fa629bb8fb3e580b9e386851c8c147ea0690a0cfac1e4d99 : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_f34993ba6842f50d93034900e7716946fd8e27e41a688f365f122cec5caab416.
admit.
Qed.
Theorem missingprop_c5ae783c48fce5c54ed68af4a1456fce175ac32041145e61729dcb9026a4f906 : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_30f509f544633ef46a6274e2479156f9415b4a9f5858b8814b191864a5bbc455.
admit.
Qed.
Theorem missingprop_c6d9dcea4d0eb67704d48d0538585e1ae6f341abbfa9083cecdab4320755f922 : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_f1ac4d4fd83a8257c8385fed4f7c965698fb96373779e13ac4460675bbd64a3c.
admit.
Qed.
Theorem missingprop_83d4d967b9d5659e1fa66304909e9684164bf61729871333d21e68021de925c5 : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_39d529ea5d748e166ce66e2060e9dc9b39001bcbce3c83f50627e81483fe49e0.
admit.
Qed.
Theorem missingprop_9c6e1882341686670dd77f8d140218aac3a05c7ef6013f4c59331fc9cf565d43 : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_dab7ccfb8224f6a417cac845071049e2e26548ac1a15607079b291792e5285af.
admit.
Qed.
Theorem missingprop_a48e2eeb0f25864f2522e960529e046fb83c5ad9f215c92432462a47b18d4e26 : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_5b8107073c0f39f1464f3360476d52fa49fc4da2e882ff69f7ce43aaa99c5801.
admit.
Qed.
Theorem missingprop_7c44c1b3a3966ffafe4412538597c2ed191a4a0bec9c93dd064c9edfde57221c : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_154b7c06c42ba55df7f2cc6bc662297d13a4fce4c938dec68159838eb5847331.
admit.
Qed.
Theorem missingprop_fa5fd544e0f0d0a5bdee1f9b415db6b2534fbbcaf71254cc45dac0f6193f393d : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_8409c09b96326e1df304cecb6e3aaf2d5be9915a8bbdb8b8588cfd763084e85a.
admit.
Qed.
Theorem missingprop_610980f039ca8f121db064a2b67fbc7a98e493e2e0bbe5bc4caff575fcf54735 : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_544593a3cb23678ca88c231fdbbf7bd0bc454dc457839d2a8418e6d578ac02d0.
admit.
Qed.
Theorem missingprop_3a5ced07eeeff4b883dcf599d649beddee68b7d6e1762b9c964e21258e955dd6 : missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e missingname_f407d023cec878de0c8b411575d1d9262549bb24c96c5ea6f7d1a8a4aa569efd.
admit.
Qed.
Definition missingname_d74a556f19c7f7db320bc204eae2dacf5f0a49b57781ded155e9c4835958d943 : (((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 x1 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => missingname_792d152efe262dcaabf368bc6467ac057697a53fc33616f54269226b8862b39f (missingname_e705adc25b2512365394b0e25f155fbe016b3b60511bfca72bbcceb2dfdbf19d (x0 (fun x2 x3 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x2)) (x1 (fun x2 x3 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x2))) (missingname_e705adc25b2512365394b0e25f155fbe016b3b60511bfca72bbcceb2dfdbf19d (x0 (fun x2 x3 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x3)) (x1 (fun x2 x3 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x3)))).
Definition missingname_0e40d2537537cec70bc72b40c004c98088f7eb9b5d1617212d07424cf69c4fad : ((((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set => missingname_ebd1166cec90389df647753858049cc6fd98aabc3fb4fd2dca22ac79311d7847 (fun x1 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => missingname_ebd1166cec90389df647753858049cc6fd98aabc3fb4fd2dca22ac79311d7847 (fun x2 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 (fun x3 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x3 x1 x2)))).
Definition missingname_5ab18efbdec61cb8ac1ee871058a7ef3351776c63fdead1df7f293c391a61752 : ((((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set :=
 (fun x0 : (((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set => missingname_aac1c284a47e5dd485b71b33f9d5736b411bb6383a9586a9ba39ad5e68f28afa (fun x1 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => missingname_aac1c284a47e5dd485b71b33f9d5736b411bb6383a9586a9ba39ad5e68f28afa (fun x2 : ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x0 (fun x3 : (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set => x3 x1 x2)))).
Theorem missingprop_1e29dc7d24e938fab144c4f74145b9c32fcb17f49d77f203d2c4643a5c859777 : (forall x0 x1 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e x0 -> missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_d74a556f19c7f7db320bc204eae2dacf5f0a49b57781ded155e9c4835958d943 x0 x1)).
admit.
Qed.
Theorem missingprop_d741e6cd53e51ffb31c521a8fb7a190130167caae9c84555902b87c45e67bb78 : (forall x0 : (((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set, (forall x1 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_0e40d2537537cec70bc72b40c004c98088f7eb9b5d1617212d07424cf69c4fad x0)).
admit.
Qed.
Theorem missingprop_f0b66185931cd85f92a8a47b5f434a081f1275aa2f10a4473dcd5e8f1d700d0c : (forall x0 : (((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set, (forall x1 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (missingname_5ab18efbdec61cb8ac1ee871058a7ef3351776c63fdead1df7f293c391a61752 x0)).
admit.
Qed.
Theorem missingprop_43a84f61e79d0158ee04d60303751b349819e6a5f5358eee1cff2b678aeed33b : (forall x0 x1 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e x0 -> missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e x1 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_d74a556f19c7f7db320bc204eae2dacf5f0a49b57781ded155e9c4835958d943 x0 x1) = (x0 = x1)).
admit.
Qed.
Theorem missingprop_de6ffc88451da56a76f9fb29fdaccac5f38e585a7ff43e00472e499201f5e58b : (forall x0 : (((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set, (forall x1 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_0e40d2537537cec70bc72b40c004c98088f7eb9b5d1617212d07424cf69c4fad x0) = (forall x2 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e x2 -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (x0 x2))).
admit.
Qed.
Theorem missingprop_bad3d69bb5558f0a8e1b084bc7a1efe74bafdb03ec04d3be9a37fc661c2faa34 : (forall x0 : (((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> set -> set -> set, (forall x1 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e x1 -> missingname_dc35161fb2ec34bf4e293b173ad207112be3b1a971ffff2e3f1eba0f3f0d06db (x0 x1)) -> missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (missingname_5ab18efbdec61cb8ac1ee871058a7ef3351776c63fdead1df7f293c391a61752 x0) = (forall x2 : prop, (forall x3 : ((((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> (((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set) -> ((set -> set -> set) -> (set -> set -> set) -> set -> set -> set) -> set -> set -> set, and (missingname_0c22bb1e5c5d504556438b84d7130288a0fd3827ae12ba5fa9e6ff2347d4b46e x3) (missingname_40d6251a304e7d9278f1224122f9f524c24d69cc82e12704abf5dd29542da72c (x0 x3)) -> x2) -> x2)).
admit.
Qed.
