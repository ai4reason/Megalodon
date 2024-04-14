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
(* Parameter ordsucc "9db634daee7fc36315ddda5f5f694934869921e9c5f55e8b25c91c0a07c5cbec" "65d8837d7b0172ae830bed36c8407fcd41b7d875033d2284eb2df245b42295a6" *)
Parameter ordsucc : set -> set.
Notation Nat Empty ordsucc.
Axiom ordsucc_inj_contra : (forall x0 x1, (x0 = x1 -> (forall x2 : prop, x2)) -> ordsucc x0 = ordsucc x1 -> (forall x2 : prop, x2)).
Axiom neq_0_2 : 0 = 2 -> (forall x0 : prop, x0).
Theorem neq_1_3 : 1 = 3 -> (forall x0 : prop, x0).
admit.
Qed.
Axiom neq_1_2 : 1 = 2 -> (forall x0 : prop, x0).
Theorem neq_2_3 : 2 = 3 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_2_4 : 2 = 4 -> (forall x0 : prop, x0).
admit.
Qed.
Theorem neq_3_4 : 3 = 4 -> (forall x0 : prop, x0).
admit.
Qed.
(* Parameter nat_primrec "9161ec45669e68b6f032fc9d4d59e7cf0b3f5f860baeb243e29e767a69d600b1" "3be1c5f3e403e02caebeaf6a2b30d019be74b996581a62908316c01702a459df" *)
Parameter nat_primrec : set -> (set -> set -> set) -> set -> set.
(* Parameter CD_mul "2d405f8176162a4b16698d239105daa816849bc04ed9b4112bd45755c4b80067" "f53b0eacc4048b311cad977680319e85147a1491bc6b63f6c57aafe79efe25b9" *)
Parameter CD_mul : set -> (set -> prop) -> (set -> set) -> (set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set.
Definition CD_exp_nat : set -> (set -> prop) -> (set -> set) -> (set -> set) -> (set -> set -> set) -> (set -> set -> set) -> set -> set -> set :=
 (fun x0 : set => fun x1 : set -> prop => fun x2 x3 : set -> set => fun x4 x5 : set -> set -> set => fun x6 : set => nat_primrec 1 (fun x7 : set => CD_mul x0 x1 x2 x3 x4 x5 x6)).
Definition False : prop :=
 (forall x0 : prop, x0).
Definition not : prop -> prop :=
 (fun x0 : prop => x0 -> False).
Definition nIn : set -> set -> prop :=
 (fun x0 x1 : set => not (x0 :e x1)).
Axiom nat_primrec_0 : (forall x0, forall x1 : set -> set -> set, forall x2 : set -> set -> prop, x2 (nat_primrec x0 x1 0) x0 -> x2 x0 (nat_primrec x0 x1 0)).
Theorem CD_exp_nat_0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, forall x6, forall x7 : set -> set -> prop, x7 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 0) 1 -> x7 1 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 0))).
admit.
Qed.
(* Parameter nat_p "25c483dc8509e17d4b6cf67c5b94c2b3f3902a45c3c34582da3e29ab1dc633ab" "458be3a74fef41541068991d6ed4034dc3b5e637179369954ba21f6dff4448e4" *)
Parameter nat_p : set -> prop.
Axiom nat_primrec_S : (forall x0, forall x1 : set -> set -> set, forall x2, nat_p x2 -> nat_primrec x0 x1 (ordsucc x2) = x1 x2 (nat_primrec x0 x1 x2)).
Theorem CD_exp_nat_S : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, forall x6 x7, nat_p x7 -> CD_exp_nat x0 x1 x2 x3 x4 x5 x6 (ordsucc x7) = CD_mul x0 x1 x2 x3 x4 x5 x6 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 x7))).
admit.
Qed.
(* Parameter CD_carr "2ea55f9b30e95e7481941454eb68ac6de771c9b03bcefa870c619fd0530d5229" "0c2c093b916057b76c377fc735ca4f5cf43faac41dbd2d3dd614aec17be1e1ce" *)
Parameter CD_carr : set -> (set -> prop) -> set -> prop.
Axiom nat_0 : nat_p 0.
Axiom CD_mul_1R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x1 1 -> x2 0 = 0 -> x3 0 = 0 -> x3 1 = 1 -> (forall x6, x1 x6 -> x4 0 x6 = x6) -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 1 = x6) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 x6 1 = x6))).
Theorem CD_exp_nat_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x1 1 -> x2 0 = 0 -> x3 0 = 0 -> x3 1 = 1 -> (forall x6, x1 x6 -> x4 0 x6 = x6) -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 1 = x6) -> (forall x6, CD_carr x0 x1 x6 -> CD_exp_nat x0 x1 x2 x3 x4 x5 x6 1 = x6))).
admit.
Qed.
Axiom nat_1 : nat_p 1.
Theorem CD_exp_nat_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x1 1 -> x2 0 = 0 -> x3 0 = 0 -> x3 1 = 1 -> (forall x6, x1 x6 -> x4 0 x6 = x6) -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 1 = x6) -> (forall x6, CD_carr x0 x1 x6 -> CD_exp_nat x0 x1 x2 x3 x4 x5 x6 2 = CD_mul x0 x1 x2 x3 x4 x5 x6 x6))).
admit.
Qed.
Axiom nat_ind : (forall x0 : set -> prop, x0 0 -> (forall x1, nat_p x1 -> x0 x1 -> x0 (ordsucc x1)) -> (forall x1, nat_p x1 -> x0 x1)).
Axiom CD_carr_0ext : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> x1 0 -> (forall x2, x1 x2 -> CD_carr x0 x1 x2)).
Axiom CD_mul_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_carr x0 x1 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7)))).
Theorem CD_exp_nat_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> x1 0 -> x1 1 -> (forall x6, CD_carr x0 x1 x6 -> (forall x7, nat_p x7 -> CD_carr x0 x1 (CD_exp_nat x0 x1 x2 x3 x4 x5 x6 x7))))).
admit.
Qed.
Definition Subq : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e x0 -> x2 :e x1).
Definition TransSet : set -> prop :=
 (fun x0 : set => forall x1, x1 :e x0 -> x1 c= x0).
(* Parameter Sing "158bae29452f8cbf276df6f8db2be0a5d20290e15eca88ffe1e7b41d211d41d7" "bd01a809e97149be7e091bf7cbb44e0c2084c018911c24e159f585455d8e6bd0" *)
Parameter Sing : set -> set.
Axiom In_no2cycle : (forall x0 x1, x0 :e x1 -> x1 :e x0 -> False).
Axiom In_0_1 : 0 :e 1.
Axiom SingE : (forall x0 x1, x1 :e Sing x0 -> x1 = x0).
Axiom SingI : (forall x0, x0 :e Sing x0).
Axiom nat_trans : (forall x0, nat_p x0 -> (forall x1, x1 :e x0 -> x1 c= x0)).
Theorem not_TransSet_Sing_tagn : (forall x0, nat_p x0 -> 1 :e x0 -> not (TransSet (Sing x0))).
admit.
Qed.
Definition and : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x1 -> x2) -> x2).
Definition ordinal : set -> prop :=
 (fun x0 : set => and (TransSet x0) (forall x1, x1 :e x0 -> TransSet x1)).
Theorem not_ordinal_Sing_tagn : (forall x0, nat_p x0 -> 1 :e x0 -> not (ordinal (Sing x0))).
admit.
Qed.
Definition or : prop -> prop -> prop :=
 (fun x0 x1 : prop => forall x2 : prop, (x0 -> x2) -> (x1 -> x2) -> x2).
Definition ExtendedSNoElt_ : set -> set -> prop :=
 (fun x0 x1 : set => forall x2, x2 :e Union x1 -> or (ordinal x2) (forall x3 : prop, (forall x4, and (x4 :e x0) (x2 = Sing x4) -> x3) -> x3)).
Axiom orIL : (forall x0 x1 : prop, x0 -> or x0 x1).
Axiom orIR : (forall x0 x1 : prop, x1 -> or x0 x1).
Axiom andI : (forall x0 x1 : prop, x0 -> x1 -> and x0 x1).
Theorem extension_SNoElt_mon : (forall x0 x1, x0 c= x1 -> (forall x2, ExtendedSNoElt_ x0 x2 -> ExtendedSNoElt_ x1 x2)).
admit.
Qed.
Axiom In_irref : (forall x0, nIn x0 x0).
Axiom Sing_inj : (forall x0 x1, Sing x0 = Sing x1 -> x0 = x1).
Axiom UnionI : (forall x0 x1 x2, x1 :e x2 -> x2 :e x0 -> x1 :e Union x0).
Theorem Sing_nat_fresh_extension : (forall x0, nat_p x0 -> 1 :e x0 -> (forall x1, ExtendedSNoElt_ x0 x1 -> (forall x2, x2 :e x1 -> nIn (Sing x0) x2))).
admit.
Qed.
(* Parameter SNo "87d7604c7ea9a2ae0537066afb358a94e6ac0cd80ba277e6b064422035a620cf" "11faa7a742daf8e4f9aaf08e90b175467e22d0e6ad3ed089af1be90cfc17314b" *)
Parameter SNo : set -> prop.
Axiom UnionE_impred : (forall x0 x1, x1 :e Union x0 -> (forall x2 : prop, (forall x3, x1 :e x3 -> x3 :e x0 -> x2) -> x2)).
(* Parameter binunion "0a445311c45f0eb3ba2217c35ecb47f122b2301b2b80124922fbf03a5c4d223e" "5e1ac4ac93257583d0e9e17d6d048ff7c0d6ccc1a69875b2a505a2d4da305784" *)
Parameter binunion : set -> set -> set.
Definition SetAdjoin : set -> set -> set :=
 (fun x0 x1 : set => binunion x0 (Sing x1)).
Definition SNoElts_ : set -> set :=
 (fun x0 : set => binunion x0 {SetAdjoin x1 (Sing 1) | x1 :e x0}).
(* Parameter exactly1of2 "3578b0d6a7b318714bc5ea889c6a38cf27f08eaccfab7edbde3cb7a350cf2d9b" "163602f90de012a7426ee39176523ca58bc964ccde619b652cb448bd678f7e21" *)
Parameter exactly1of2 : prop -> prop -> prop.
Definition SNo_ : set -> set -> prop :=
 (fun x0 x1 : set => and (x1 c= SNoElts_ x0) (forall x2, x2 :e x0 -> exactly1of2 (SetAdjoin x2 (Sing 1) :e x1) (x2 :e x1))).
(* Parameter SNoLev "bf1decfd8f4025a2271f2a64d1290eae65933d0f2f0f04b89520449195f1aeb8" "293b77d05dab711767d698fb4484aab2a884304256765be0733e6bd5348119e8" *)
Parameter SNoLev : set -> set.
Axiom SNoLev_ : (forall x0, SNo x0 -> SNo_ (SNoLev x0) x0).
Axiom binunionE : (forall x0 x1 x2, x2 :e binunion x0 x1 -> or (x2 :e x0) (x2 :e x1)).
Axiom ordinal_Hered : (forall x0, ordinal x0 -> (forall x1, x1 :e x0 -> ordinal x1)).
Axiom SNoLev_ordinal : (forall x0, SNo x0 -> ordinal (SNoLev x0)).
Axiom ReplE_impred : (forall x0, forall x1 : set -> set, forall x2, x2 :e Repl x0 x1 -> (forall x3 : prop, (forall x4, x4 :e x0 -> x2 = x1 x4 -> x3) -> x3)).
Axiom In_1_2 : 1 :e 2.
Theorem SNo_ExtendedSNoElt_2 : (forall x0, SNo x0 -> ExtendedSNoElt_ 2 x0).
admit.
Qed.
Axiom nat_2 : nat_p 2.
Theorem complex_tag_fresh : (forall x0, SNo x0 -> (forall x1, x1 :e x0 -> nIn (Sing 2) x1)).
admit.
Qed.
Definition pair_tag : set -> set -> set -> set :=
 (fun x0 x1 x2 : set => binunion x1 {SetAdjoin x3 x0 | x3 :e x2}).
Definition SNo_pair : set -> set -> set :=
 pair_tag (Sing 2).
Axiom pair_tag_0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, forall x3 : set -> set -> prop, x3 (pair_tag x0 x2 0) x2 -> x3 x2 (pair_tag x0 x2 0))).
Theorem SNo_pair_0 : (forall x0, forall x1 : set -> set -> prop, x1 (SNo_pair x0 0) x0 -> x1 x0 (SNo_pair x0 0)).
admit.
Qed.
Axiom pair_tag_prop_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 x4 x5, x1 x2 -> x1 x4 -> pair_tag x0 x2 x3 = pair_tag x0 x4 x5 -> x2 = x4)).
Theorem SNo_pair_prop_1 : (forall x0 x1 x2 x3, SNo x0 -> SNo x2 -> SNo_pair x0 x1 = SNo_pair x2 x3 -> x0 = x2).
admit.
Qed.
Axiom pair_tag_prop_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 x4 x5, x1 x2 -> x1 x3 -> x1 x4 -> x1 x5 -> pair_tag x0 x2 x3 = pair_tag x0 x4 x5 -> x3 = x5)).
Theorem SNo_pair_prop_2 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> SNo_pair x0 x1 = SNo_pair x2 x3 -> x1 = x3).
admit.
Qed.
Definition CSNo : set -> prop :=
 CD_carr (Sing 2) SNo.
Axiom CD_carr_I : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> x1 x3 -> CD_carr x0 x1 (pair_tag x0 x2 x3))).
Theorem CSNo_I : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo (SNo_pair x0 x1)).
admit.
Qed.
Axiom CD_carr_E : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> (forall x3 : set -> prop, (forall x4 x5, x1 x4 -> x1 x5 -> x2 = pair_tag x0 x4 x5 -> x3 (pair_tag x0 x4 x5)) -> x3 x2))).
Theorem CSNo_E : (forall x0, CSNo x0 -> (forall x1 : set -> prop, (forall x2 x3, SNo x2 -> SNo x3 -> x0 = SNo_pair x2 x3 -> x1 (SNo_pair x2 x3)) -> x1 x0)).
admit.
Qed.
Axiom SNo_0 : SNo 0.
Theorem SNo_CSNo : (forall x0, SNo x0 -> CSNo x0).
admit.
Qed.
Theorem CSNo_0 : CSNo 0.
admit.
Qed.
Axiom SNo_1 : SNo 1.
Theorem CSNo_1 : CSNo 1.
admit.
Qed.
Axiom ordsuccI1 : (forall x0, x0 c= ordsucc x0).
Axiom In_2_3 : 2 :e 3.
Theorem CSNo_ExtendedSNoElt_3 : (forall x0, CSNo x0 -> ExtendedSNoElt_ 3 x0).
admit.
Qed.
Definition Complex_i : set :=
 SNo_pair 0 1.
(* Parameter CD_proj0 "0f0c33ee510e1a6616dae9740b87813905ab9c81cd7bba0430bb93ed78b7f32e" "e6d3c908403e809d0499044c6327107f48e159032f5d408db7c9a005219d76c5" *)
Parameter CD_proj0 : set -> (set -> prop) -> set -> set.
Definition CSNo_Re : set -> set :=
 CD_proj0 (Sing 2) SNo.
(* Parameter CD_proj1 "0e60a25c698581d33ab462b7d2f97fb3428f8ae674a065695d8fe89cdf0f35a2" "934eedf1ea050179b5169b28a60315fede0e4412cfff04a00c8c4a41e918fb4a" *)
Parameter CD_proj1 : set -> (set -> prop) -> set -> set.
Definition CSNo_Im : set -> set :=
 CD_proj1 (Sing 2) SNo.
Axiom CD_proj0_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> and (x1 (CD_proj0 x0 x1 x2)) (forall x3 : prop, (forall x4, and (x1 x4) (x2 = pair_tag x0 (CD_proj0 x0 x1 x2) x4) -> x3) -> x3))).
Theorem CSNo_Re1 : (forall x0, CSNo x0 -> and (SNo (CSNo_Re x0)) (forall x1 : prop, (forall x2, and (SNo x2) (x0 = SNo_pair (CSNo_Re x0) x2) -> x1) -> x1)).
admit.
Qed.
Axiom CD_proj0_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> x1 x3 -> CD_proj0 x0 x1 (pair_tag x0 x2 x3) = x2)).
Theorem CSNo_Re2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Re (SNo_pair x0 x1) = x0).
admit.
Qed.
Axiom CD_proj1_1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> and (x1 (CD_proj1 x0 x1 x2)) (x2 = pair_tag x0 (CD_proj0 x0 x1 x2) (CD_proj1 x0 x1 x2)))).
Theorem CSNo_Im1 : (forall x0, CSNo x0 -> and (SNo (CSNo_Im x0)) (x0 = SNo_pair (CSNo_Re x0) (CSNo_Im x0))).
admit.
Qed.
Axiom CD_proj1_2 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, x1 x2 -> x1 x3 -> CD_proj1 x0 x1 (pair_tag x0 x2 x3) = x3)).
Theorem CSNo_Im2 : (forall x0 x1, SNo x0 -> SNo x1 -> CSNo_Im (SNo_pair x0 x1) = x1).
admit.
Qed.
Axiom CD_proj0R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> x1 (CD_proj0 x0 x1 x2))).
Theorem CSNo_ReR : (forall x0, CSNo x0 -> SNo (CSNo_Re x0)).
admit.
Qed.
Axiom CD_proj1R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> x1 (CD_proj1 x0 x1 x2))).
Theorem CSNo_ImR : (forall x0, CSNo x0 -> SNo (CSNo_Im x0)).
admit.
Qed.
Axiom CD_proj0proj1_eta : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2, CD_carr x0 x1 x2 -> x2 = pair_tag x0 (CD_proj0 x0 x1 x2) (CD_proj1 x0 x1 x2))).
Theorem CSNo_ReIm : (forall x0, CSNo x0 -> x0 = SNo_pair (CSNo_Re x0) (CSNo_Im x0)).
admit.
Qed.
Axiom CD_proj0proj1_split : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3, CD_carr x0 x1 x2 -> CD_carr x0 x1 x3 -> CD_proj0 x0 x1 x2 = CD_proj0 x0 x1 x3 -> CD_proj1 x0 x1 x2 = CD_proj1 x0 x1 x3 -> x2 = x3)).
Theorem CSNo_ReIm_split : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re x0 = CSNo_Re x1 -> CSNo_Im x0 = CSNo_Im x1 -> x0 = x1).
admit.
Qed.
Definition CSNoLev : set -> set :=
 (fun x0 : set => binunion (SNoLev (CSNo_Re x0)) (SNoLev (CSNo_Im x0))).
Axiom ordinal_binunion : (forall x0 x1, ordinal x0 -> ordinal x1 -> ordinal (binunion x0 x1)).
Theorem CSNoLev_ordinal : (forall x0, CSNo x0 -> ordinal (CSNoLev x0)).
admit.
Qed.
(* Parameter CD_minus "076775e9ee366b860a11e2cb50880a08fbbbcce52aa5a1cbcf2ce9acd61308c1" "2d3588445fd168b15836ab7b6758efaf82a6f0a87ba550d8a138e77fd02b50e7" *)
Parameter CD_minus : set -> (set -> prop) -> (set -> set) -> set -> set.
(* Parameter minus_SNo "6d39c64862ac40c95c6f5e4ed5f02bb019279bfb0cda8c9bbe0e1b813b1e876c" "268a6c1da15b8fe97d37be85147bc7767b27098cdae193faac127195e8824808" *)
Parameter minus_SNo : set -> set.
Definition minus_CSNo : set -> set :=
 CD_minus (Sing 2) SNo minus_SNo.
(* Parameter CD_conj "ed5d3637676fc8f4658dd685e15ce9c2e389effe6e6ae21ea11cf574a73047aa" "b39bd24227d03dc1058ece41a05ced6e07fc86a368553c9e9cad9950e6962f94" *)
Parameter CD_conj : set -> (set -> prop) -> (set -> set) -> (set -> set) -> set -> set.
Definition conj_CSNo : set -> set :=
 CD_conj (Sing 2) SNo minus_SNo (fun x0 : set => x0).
(* Parameter CD_add "d429c24f936af1bb25bc557a30009af2fbbed57490e129c9faf2a4be3f0fa5cc" "7a5ff6ae3ec53ef0ca861a9a23a0849db2e922c9b8927dde4e2f9b8a94acda17" *)
Parameter CD_add : set -> (set -> prop) -> (set -> set -> set) -> set -> set -> set.
(* Parameter add_SNo "29b9b279a7a5b776b777d842e678a4acaf3b85b17a0223605e4cc68025e9b2a7" "127d043261bd13d57aaeb99e7d2c02cae2bd0698c0d689b03e69f1ac89b3c2c6" *)
Parameter add_SNo : set -> set -> set.
Definition add_CSNo : set -> set -> set :=
 CD_add (Sing 2) SNo add_SNo.
(* Parameter mul_SNo "f56bf39b8eea93d7f63da529dedb477ae1ab1255c645c47d8915623f364f2d6b" "48d05483e628cb37379dd5d279684d471d85c642fe63533c3ad520b84b18df9d" *)
Parameter mul_SNo : set -> set -> set.
Definition mul_CSNo : set -> set -> set :=
 CD_mul (Sing 2) SNo minus_SNo (fun x0 : set => x0) add_SNo mul_SNo.
Definition exp_CSNo_nat : set -> set -> set :=
 CD_exp_nat (Sing 2) SNo minus_SNo (fun x0 : set => x0) add_SNo mul_SNo.
(* Parameter exp_SNo_nat "6ec032f955c377b8953cff1c37d3572125487a6587167afb5fdec25c2350b3c3" "cc51438984361070fa0036749984849f690f86f00488651aabd635e92983c745" *)
Parameter exp_SNo_nat : set -> set -> set.
Definition abs_sqr_CSNo : set -> set :=
 (fun x0 : set => add_SNo (exp_SNo_nat (CSNo_Re x0) 2) (exp_SNo_nat (CSNo_Im x0) 2)).
(* Parameter div_SNo "27f4b5fe59b60da9c8b15247476d431fa3e527c47c22bad7c6d8cb3c2668e2e0" "a77cc83b548d1c105523434377d695400e899aad3044b9efb16632cbba12c5d6" *)
Parameter div_SNo : set -> set -> set.
Definition recip_CSNo : set -> set :=
 (fun x0 : set => SNo_pair (div_SNo (CSNo_Re x0) (abs_sqr_CSNo x0)) (minus_SNo (div_SNo (CSNo_Im x0) (abs_sqr_CSNo x0)))).
Definition div_CSNo : set -> set -> set :=
 (fun x0 x1 : set => mul_CSNo x0 (recip_CSNo x1)).
Theorem CSNo_Complex_i : CSNo Complex_i.
admit.
Qed.
Axiom CD_minus_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, CD_carr x0 x1 x3 -> CD_carr x0 x1 (CD_minus x0 x1 x2 x3)))).
Axiom SNo_minus_SNo : (forall x0, SNo x0 -> SNo (minus_SNo x0)).
Theorem CSNo_minus_CSNo : (forall x0, CSNo x0 -> CSNo (minus_CSNo x0)).
admit.
Qed.
Axiom CD_minus_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, CD_carr x0 x1 x3 -> CD_proj0 x0 x1 (CD_minus x0 x1 x2 x3) = x2 (CD_proj0 x0 x1 x3)))).
Theorem minus_CSNo_CRe : (forall x0, CSNo x0 -> CSNo_Re (minus_CSNo x0) = minus_SNo (CSNo_Re x0)).
admit.
Qed.
Axiom CD_minus_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, CD_carr x0 x1 x3 -> CD_proj1 x0 x1 (CD_minus x0 x1 x2 x3) = x2 (CD_proj1 x0 x1 x3)))).
Theorem minus_CSNo_CIm : (forall x0, CSNo x0 -> CSNo_Im (minus_CSNo x0) = minus_SNo (CSNo_Im x0)).
admit.
Qed.
Axiom CD_conj_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3 : set -> set, (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_carr x0 x1 (CD_conj x0 x1 x2 x3 x4))))).
Theorem CSNo_conj_CSNo : (forall x0, CSNo x0 -> CSNo (conj_CSNo x0)).
admit.
Qed.
Axiom CD_conj_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3 : set -> set, (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_proj0 x0 x1 (CD_conj x0 x1 x2 x3 x4) = x3 (CD_proj0 x0 x1 x4))))).
Theorem conj_CSNo_CRe : (forall x0, CSNo x0 -> CSNo_Re (conj_CSNo x0) = CSNo_Re x0).
admit.
Qed.
Axiom CD_conj_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3 : set -> set, (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_proj1 x0 x1 (CD_conj x0 x1 x2 x3 x4) = x2 (CD_proj1 x0 x1 x4))))).
Theorem conj_CSNo_CIm : (forall x0, CSNo x0 -> CSNo_Im (conj_CSNo x0) = minus_SNo (CSNo_Im x0)).
admit.
Qed.
Axiom CD_add_CD : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_carr x0 x1 (CD_add x0 x1 x2 x3 x4)))).
Axiom SNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (add_SNo x0 x1)).
Theorem CSNo_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (add_CSNo x0 x1)).
admit.
Qed.
Theorem CSNo_add_CSNo_3 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo (add_CSNo x0 (add_CSNo x1 x2))).
admit.
Qed.
Axiom CD_add_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_proj0 x0 x1 (CD_add x0 x1 x2 x3 x4) = x2 (CD_proj0 x0 x1 x3) (CD_proj0 x0 x1 x4)))).
Theorem add_CSNo_CRe : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re (add_CSNo x0 x1) = add_SNo (CSNo_Re x0) (CSNo_Re x1)).
admit.
Qed.
Axiom CD_add_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_proj1 x0 x1 (CD_add x0 x1 x2 x3 x4) = x2 (CD_proj1 x0 x1 x3) (CD_proj1 x0 x1 x4)))).
Theorem add_CSNo_CIm : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Im (add_CSNo x0 x1) = add_SNo (CSNo_Im x0) (CSNo_Im x1)).
admit.
Qed.
Axiom SNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> SNo (mul_SNo x0 x1)).
Theorem CSNo_mul_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo (mul_CSNo x0 x1)).
admit.
Qed.
Theorem CSNo_mul_CSNo_3 : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> CSNo (mul_CSNo x0 (mul_CSNo x1 x2))).
admit.
Qed.
Axiom CD_mul_proj0 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_proj0 x0 x1 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) = x4 (x5 (CD_proj0 x0 x1 x6) (CD_proj0 x0 x1 x7)) (x2 (x5 (x3 (CD_proj1 x0 x1 x7)) (CD_proj1 x0 x1 x6)))))).
Theorem mul_CSNo_CRe : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Re (mul_CSNo x0 x1) = add_SNo (mul_SNo (CSNo_Re x0) (CSNo_Re x1)) (minus_SNo (mul_SNo (CSNo_Im x1) (CSNo_Im x0)))).
admit.
Qed.
Axiom CD_mul_proj1 : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_proj1 x0 x1 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) = x4 (x5 (CD_proj1 x0 x1 x7) (CD_proj0 x0 x1 x6)) (x5 (CD_proj1 x0 x1 x6) (x3 (CD_proj0 x0 x1 x7)))))).
Theorem mul_CSNo_CIm : (forall x0 x1, CSNo x0 -> CSNo x1 -> CSNo_Im (mul_CSNo x0 x1) = add_SNo (mul_SNo (CSNo_Im x1) (CSNo_Re x0)) (mul_SNo (CSNo_Im x0) (CSNo_Re x1))).
admit.
Qed.
Axiom CD_proj0_F : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> x1 0 -> (forall x2, x1 x2 -> CD_proj0 x0 x1 x2 = x2)).
Theorem SNo_Re : (forall x0, SNo x0 -> CSNo_Re x0 = x0).
admit.
Qed.
Axiom CD_proj1_F : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> x1 0 -> (forall x2, x1 x2 -> CD_proj1 x0 x1 x2 = 0)).
Theorem SNo_Im : (forall x0, SNo x0 -> CSNo_Im x0 = 0).
admit.
Qed.
Theorem Re_0 : CSNo_Re 0 = 0.
admit.
Qed.
Theorem Im_0 : CSNo_Im 0 = 0.
admit.
Qed.
Theorem Re_1 : CSNo_Re 1 = 1.
admit.
Qed.
Theorem Im_1 : CSNo_Im 1 = 0.
admit.
Qed.
Theorem Re_i : CSNo_Re Complex_i = 0.
admit.
Qed.
Theorem Im_i : CSNo_Im Complex_i = 1.
admit.
Qed.
Axiom CD_conj_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, x1 0 -> x2 0 = 0 -> (forall x3 : set -> set, forall x4, x1 x4 -> CD_conj x0 x1 x2 x3 x4 = x3 x4))).
Axiom minus_SNo_0 : minus_SNo 0 = 0.
Theorem conj_CSNo_id_SNo : (forall x0, SNo x0 -> conj_CSNo x0 = x0).
admit.
Qed.
Theorem conj_CSNo_0 : conj_CSNo 0 = 0.
admit.
Qed.
Theorem conj_CSNo_1 : conj_CSNo 1 = 1.
admit.
Qed.
Theorem conj_CSNo_i : conj_CSNo Complex_i = minus_CSNo Complex_i.
admit.
Qed.
Axiom CD_minus_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, x1 0 -> x2 0 = 0 -> (forall x3, x1 x3 -> CD_minus x0 x1 x2 x3 = x2 x3))).
Theorem minus_CSNo_minus_SNo : (forall x0, SNo x0 -> minus_CSNo x0 = minus_SNo x0).
admit.
Qed.
Theorem minus_CSNo_0 : minus_CSNo 0 = 0.
admit.
Qed.
Axiom CD_add_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, x1 0 -> x2 0 0 = 0 -> (forall x3 x4, x1 x3 -> x1 x4 -> CD_add x0 x1 x2 x3 x4 = x2 x3 x4))).
Axiom add_SNo_0L : (forall x0, SNo x0 -> add_SNo 0 x0 = x0).
Theorem add_CSNo_add_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> add_CSNo x0 x1 = add_SNo x0 x1).
admit.
Qed.
Axiom CD_mul_F_eq : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> x2 0 = 0 -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6 x7, x1 x6 -> x1 x7 -> CD_mul x0 x1 x2 x3 x4 x5 x6 x7 = x5 x6 x7))).
Axiom add_SNo_0R : (forall x0, SNo x0 -> add_SNo x0 0 = x0).
Axiom mul_SNo_zeroL : (forall x0, SNo x0 -> mul_SNo 0 x0 = 0).
Axiom mul_SNo_zeroR : (forall x0, SNo x0 -> mul_SNo x0 0 = 0).
Theorem mul_CSNo_mul_SNo : (forall x0 x1, SNo x0 -> SNo x1 -> mul_CSNo x0 x1 = mul_SNo x0 x1).
admit.
Qed.
Axiom CD_minus_invol : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, (forall x3, x1 x3 -> x1 (x2 x3)) -> (forall x3, x1 x3 -> x2 (x2 x3) = x3) -> (forall x3, CD_carr x0 x1 x3 -> CD_minus x0 x1 x2 (CD_minus x0 x1 x2 x3) = x3))).
Axiom minus_SNo_invol : (forall x0, SNo x0 -> minus_SNo (minus_SNo x0) = x0).
Theorem minus_CSNo_invol : (forall x0, CSNo x0 -> minus_CSNo (minus_CSNo x0) = x0).
admit.
Qed.
Axiom CD_conj_invol : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, x1 x4 -> x2 (x2 x4) = x4) -> (forall x4, x1 x4 -> x3 (x3 x4) = x4) -> (forall x4, CD_carr x0 x1 x4 -> CD_conj x0 x1 x2 x3 (CD_conj x0 x1 x2 x3 x4) = x4))).
Theorem conj_CSNo_invol : (forall x0, CSNo x0 -> conj_CSNo (conj_CSNo x0) = x0).
admit.
Qed.
Axiom CD_conj_minus : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x1 (x3 x4)) -> (forall x4, x1 x4 -> x3 (x2 x4) = x2 (x3 x4)) -> (forall x4, CD_carr x0 x1 x4 -> CD_conj x0 x1 x2 x3 (CD_minus x0 x1 x2 x4) = CD_minus x0 x1 x2 (CD_conj x0 x1 x2 x3 x4)))).
Theorem conj_minus_CSNo : (forall x0, CSNo x0 -> conj_CSNo (minus_CSNo x0) = minus_CSNo (conj_CSNo x0)).
admit.
Qed.
Axiom CD_minus_add : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, forall x3 : set -> set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4 x5, x1 x4 -> x1 x5 -> x1 (x3 x4 x5)) -> (forall x4 x5, x1 x4 -> x1 x5 -> x2 (x3 x4 x5) = x3 (x2 x4) (x2 x5)) -> (forall x4 x5, CD_carr x0 x1 x4 -> CD_carr x0 x1 x5 -> CD_minus x0 x1 x2 (CD_add x0 x1 x3 x4 x5) = CD_add x0 x1 x3 (CD_minus x0 x1 x2 x4) (CD_minus x0 x1 x2 x5)))).
Axiom minus_add_SNo_distr : (forall x0 x1, SNo x0 -> SNo x1 -> minus_SNo (add_SNo x0 x1) = add_SNo (minus_SNo x0) (minus_SNo x1)).
Theorem minus_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> minus_CSNo (add_CSNo x0 x1) = add_CSNo (minus_CSNo x0) (minus_CSNo x1)).
admit.
Qed.
Axiom CD_conj_add : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 : set -> set -> set, (forall x5, x1 x5 -> x1 (x2 x5)) -> (forall x5, x1 x5 -> x1 (x3 x5)) -> (forall x5 x6, x1 x5 -> x1 x6 -> x1 (x4 x5 x6)) -> (forall x5 x6, x1 x5 -> x1 x6 -> x2 (x4 x5 x6) = x4 (x2 x5) (x2 x6)) -> (forall x5 x6, x1 x5 -> x1 x6 -> x3 (x4 x5 x6) = x4 (x3 x5) (x3 x6)) -> (forall x5 x6, CD_carr x0 x1 x5 -> CD_carr x0 x1 x6 -> CD_conj x0 x1 x2 x3 (CD_add x0 x1 x4 x5 x6) = CD_add x0 x1 x4 (CD_conj x0 x1 x2 x3 x5) (CD_conj x0 x1 x2 x3 x6)))).
Theorem conj_add_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> conj_CSNo (add_CSNo x0 x1) = add_CSNo (conj_CSNo x0) (conj_CSNo x1)).
admit.
Qed.
Axiom CD_add_com : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x2 x3 x4 = x2 x4 x3) -> (forall x3 x4, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_add x0 x1 x2 x3 x4 = CD_add x0 x1 x2 x4 x3))).
Axiom add_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> add_SNo x0 x1 = add_SNo x1 x0).
Theorem add_CSNo_com : (forall x0 x1, CSNo x0 -> CSNo x1 -> add_CSNo x0 x1 = add_CSNo x1 x0).
admit.
Qed.
Axiom CD_add_assoc : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, (forall x3 x4, x1 x3 -> x1 x4 -> x1 (x2 x3 x4)) -> (forall x3 x4 x5, x1 x3 -> x1 x4 -> x1 x5 -> x2 (x2 x3 x4) x5 = x2 x3 (x2 x4 x5)) -> (forall x3 x4 x5, CD_carr x0 x1 x3 -> CD_carr x0 x1 x4 -> CD_carr x0 x1 x5 -> CD_add x0 x1 x2 (CD_add x0 x1 x2 x3 x4) x5 = CD_add x0 x1 x2 x3 (CD_add x0 x1 x2 x4 x5)))).
Axiom add_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> add_SNo x0 (add_SNo x1 x2) = add_SNo (add_SNo x0 x1) x2).
Theorem add_CSNo_assoc : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> add_CSNo (add_CSNo x0 x1) x2 = add_CSNo x0 (add_CSNo x1 x2)).
admit.
Qed.
Axiom CD_add_0L : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, x1 0 -> (forall x3, x1 x3 -> x2 0 x3 = x3) -> (forall x3, CD_carr x0 x1 x3 -> CD_add x0 x1 x2 0 x3 = x3))).
Theorem add_CSNo_0L : (forall x0, CSNo x0 -> add_CSNo 0 x0 = x0).
admit.
Qed.
Axiom CD_add_0R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set -> set, x1 0 -> (forall x3, x1 x3 -> x2 x3 0 = x3) -> (forall x3, CD_carr x0 x1 x3 -> CD_add x0 x1 x2 x3 0 = x3))).
Theorem add_CSNo_0R : (forall x0, CSNo x0 -> add_CSNo x0 0 = x0).
admit.
Qed.
Axiom CD_add_minus_linv : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, forall x3 : set -> set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x3 (x2 x4) x4 = 0) -> (forall x4, CD_carr x0 x1 x4 -> CD_add x0 x1 x3 (CD_minus x0 x1 x2 x4) x4 = 0))).
Axiom add_SNo_minus_SNo_linv : (forall x0, SNo x0 -> add_SNo (minus_SNo x0) x0 = 0).
Theorem add_CSNo_minus_CSNo_linv : (forall x0, CSNo x0 -> add_CSNo (minus_CSNo x0) x0 = 0).
admit.
Qed.
Axiom CD_add_minus_rinv : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 : set -> set, forall x3 : set -> set -> set, (forall x4, x1 x4 -> x1 (x2 x4)) -> (forall x4, x1 x4 -> x3 x4 (x2 x4) = 0) -> (forall x4, CD_carr x0 x1 x4 -> CD_add x0 x1 x3 x4 (CD_minus x0 x1 x2 x4) = 0))).
Axiom add_SNo_minus_SNo_rinv : (forall x0, SNo x0 -> add_SNo x0 (minus_SNo x0) = 0).
Theorem add_CSNo_minus_CSNo_rinv : (forall x0, CSNo x0 -> add_CSNo x0 (minus_CSNo x0) = 0).
admit.
Qed.
Axiom CD_mul_0R : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x2 0 = 0 -> x3 0 = 0 -> x4 0 0 = 0 -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 x6 0 = 0))).
Theorem mul_CSNo_0R : (forall x0, CSNo x0 -> mul_CSNo x0 0 = 0).
admit.
Qed.
Axiom CD_mul_0L : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> (forall x6, x1 x6 -> x1 (x3 x6)) -> x2 0 = 0 -> x4 0 0 = 0 -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 0 x6 = 0))).
Theorem mul_CSNo_0L : (forall x0, CSNo x0 -> mul_CSNo 0 x0 = 0).
admit.
Qed.
Axiom mul_SNo_oneR : (forall x0, SNo x0 -> mul_SNo x0 1 = x0).
Theorem mul_CSNo_1R : (forall x0, CSNo x0 -> mul_CSNo x0 1 = x0).
admit.
Qed.
Axiom CD_mul_1L : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, x1 0 -> x1 1 -> (forall x6, x1 x6 -> x1 (x3 x6)) -> x2 0 = 0 -> (forall x6, x1 x6 -> x4 x6 0 = x6) -> (forall x6, x1 x6 -> x5 0 x6 = 0) -> (forall x6, x1 x6 -> x5 x6 0 = 0) -> (forall x6, x1 x6 -> x5 1 x6 = x6) -> (forall x6, x1 x6 -> x5 x6 1 = x6) -> (forall x6, CD_carr x0 x1 x6 -> CD_mul x0 x1 x2 x3 x4 x5 1 x6 = x6))).
Axiom mul_SNo_oneL : (forall x0, SNo x0 -> mul_SNo 1 x0 = x0).
Theorem mul_CSNo_1L : (forall x0, CSNo x0 -> mul_CSNo 1 x0 = x0).
admit.
Qed.
Axiom CD_conj_mul : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6, x1 x6 -> x2 (x2 x6) = x6) -> (forall x6, x1 x6 -> x3 (x3 x6) = x6) -> (forall x6, x1 x6 -> x3 (x2 x6) = x2 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x3 (x4 x6 x7) = x4 (x3 x6) (x3 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x4 x6 x7 = x4 x7 x6) -> (forall x6 x7, x1 x6 -> x1 x7 -> x3 (x5 x6 x7) = x5 (x3 x7) (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 x6 (x2 x7) = x2 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 (x2 x6) x7 = x2 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_conj x0 x1 x2 x3 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) = CD_mul x0 x1 x2 x3 x4 x5 (CD_conj x0 x1 x2 x3 x7) (CD_conj x0 x1 x2 x3 x6)))).
Axiom mul_SNo_com : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 x1 = mul_SNo x1 x0).
Axiom mul_SNo_minus_distrR : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo x0 (minus_SNo x1) = minus_SNo (mul_SNo x0 x1)).
Axiom mul_SNo_minus_distrL : (forall x0 x1, SNo x0 -> SNo x1 -> mul_SNo (minus_SNo x0) x1 = minus_SNo (mul_SNo x0 x1)).
Theorem conj_mul_CSNo : (forall x0 x1, CSNo x0 -> CSNo x1 -> conj_CSNo (mul_CSNo x0 x1) = mul_CSNo (conj_CSNo x1) (conj_CSNo x0)).
admit.
Qed.
Axiom CD_add_mul_distrL : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x3 (x4 x6 x7) = x4 (x3 x6) (x3 x7)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x4 (x4 x6 x7) x8 = x4 x6 (x4 x7 x8)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x4 x6 x7 = x4 x7 x6) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 x6 (x4 x7 x8) = x4 (x5 x6 x7) (x5 x6 x8)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 (x4 x6 x7) x8 = x4 (x5 x6 x8) (x5 x7 x8)) -> (forall x6 x7 x8, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_carr x0 x1 x8 -> CD_mul x0 x1 x2 x3 x4 x5 x6 (CD_add x0 x1 x4 x7 x8) = CD_add x0 x1 x4 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7) (CD_mul x0 x1 x2 x3 x4 x5 x6 x8)))).
Axiom mul_SNo_distrL : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (add_SNo x1 x2) = add_SNo (mul_SNo x0 x1) (mul_SNo x0 x2)).
Axiom mul_SNo_distrR : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo (add_SNo x0 x1) x2 = add_SNo (mul_SNo x0 x2) (mul_SNo x1 x2)).
Theorem mul_CSNo_distrL : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (add_CSNo x1 x2) = add_CSNo (mul_CSNo x0 x1) (mul_CSNo x0 x2)).
admit.
Qed.
Axiom CD_add_mul_distrR : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x4 (x4 x6 x7) x8 = x4 x6 (x4 x7 x8)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x4 x6 x7 = x4 x7 x6) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 x6 (x4 x7 x8) = x4 (x5 x6 x7) (x5 x6 x8)) -> (forall x6 x7 x8, x1 x6 -> x1 x7 -> x1 x8 -> x5 (x4 x6 x7) x8 = x4 (x5 x6 x8) (x5 x7 x8)) -> (forall x6 x7 x8, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_carr x0 x1 x8 -> CD_mul x0 x1 x2 x3 x4 x5 (CD_add x0 x1 x4 x6 x7) x8 = CD_add x0 x1 x4 (CD_mul x0 x1 x2 x3 x4 x5 x6 x8) (CD_mul x0 x1 x2 x3 x4 x5 x7 x8)))).
Theorem mul_CSNo_distrR : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo (add_CSNo x0 x1) x2 = add_CSNo (mul_CSNo x0 x2) (mul_CSNo x1 x2)).
admit.
Qed.
Axiom CD_minus_mul_distrR : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6, x1 x6 -> x3 (x2 x6) = x2 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 x6 (x2 x7) = x2 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 (x2 x6) x7 = x2 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_mul x0 x1 x2 x3 x4 x5 x6 (CD_minus x0 x1 x2 x7) = CD_minus x0 x1 x2 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7)))).
Theorem minus_mul_CSNo_distrR : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 (minus_CSNo x1) = minus_CSNo (mul_CSNo x0 x1)).
admit.
Qed.
Axiom CD_minus_mul_distrL : (forall x0, forall x1 : set -> prop, (forall x2, x1 x2 -> (forall x3, x3 :e x2 -> nIn x0 x3)) -> (forall x2 x3 : set -> set, forall x4 x5 : set -> set -> set, (forall x6, x1 x6 -> x1 (x2 x6)) -> (forall x6, x1 x6 -> x1 (x3 x6)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x4 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x1 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x2 (x4 x6 x7) = x4 (x2 x6) (x2 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 x6 (x2 x7) = x2 (x5 x6 x7)) -> (forall x6 x7, x1 x6 -> x1 x7 -> x5 (x2 x6) x7 = x2 (x5 x6 x7)) -> (forall x6 x7, CD_carr x0 x1 x6 -> CD_carr x0 x1 x7 -> CD_mul x0 x1 x2 x3 x4 x5 (CD_minus x0 x1 x2 x6) x7 = CD_minus x0 x1 x2 (CD_mul x0 x1 x2 x3 x4 x5 x6 x7)))).
Theorem minus_mul_CSNo_distrL : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo (minus_CSNo x0) x1 = minus_CSNo (mul_CSNo x0 x1)).
admit.
Qed.
Theorem exp_CSNo_nat_0 : (forall x0, forall x1 : set -> set -> prop, x1 (exp_CSNo_nat x0 0) 1 -> x1 1 (exp_CSNo_nat x0 0)).
admit.
Qed.
Theorem exp_CSNo_nat_S : (forall x0 x1, nat_p x1 -> exp_CSNo_nat x0 (ordsucc x1) = mul_CSNo x0 (exp_CSNo_nat x0 x1)).
admit.
Qed.
Theorem exp_CSNo_nat_1 : (forall x0, CSNo x0 -> exp_CSNo_nat x0 1 = x0).
admit.
Qed.
Theorem exp_CSNo_nat_2 : (forall x0, CSNo x0 -> exp_CSNo_nat x0 2 = mul_CSNo x0 x0).
admit.
Qed.
Theorem CSNo_exp_CSNo_nat : (forall x0, CSNo x0 -> (forall x1, nat_p x1 -> CSNo (exp_CSNo_nat x0 x1))).
admit.
Qed.
Axiom add_SNo_com_4_inner_mid : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x2) (add_SNo x1 x3)).
Theorem add_SNo_rotate_4_0312 : (forall x0 x1 x2 x3, SNo x0 -> SNo x1 -> SNo x2 -> SNo x3 -> add_SNo (add_SNo x0 x1) (add_SNo x2 x3) = add_SNo (add_SNo x0 x3) (add_SNo x1 x2)).
admit.
Qed.
Theorem mul_CSNo_com : (forall x0 x1, CSNo x0 -> CSNo x1 -> mul_CSNo x0 x1 = mul_CSNo x1 x0).
admit.
Qed.
Axiom mul_SNo_assoc : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo (mul_SNo x0 x1) x2).
Axiom SNo_mul_SNo_3 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> SNo (mul_SNo x0 (mul_SNo x1 x2))).
Axiom mul_SNo_com_3_0_1 : (forall x0 x1 x2, SNo x0 -> SNo x1 -> SNo x2 -> mul_SNo x0 (mul_SNo x1 x2) = mul_SNo x1 (mul_SNo x0 x2)).
Theorem mul_CSNo_assoc : (forall x0 x1 x2, CSNo x0 -> CSNo x1 -> CSNo x2 -> mul_CSNo x0 (mul_CSNo x1 x2) = mul_CSNo (mul_CSNo x0 x1) x2).
admit.
Qed.
Theorem Complex_i_sqr : mul_CSNo Complex_i Complex_i = minus_CSNo 1.
admit.
Qed.
