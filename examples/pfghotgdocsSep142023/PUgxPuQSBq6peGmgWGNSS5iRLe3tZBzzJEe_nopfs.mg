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
Axiom missingprop_6df806693864a23a378ddbca02cda4bb4bc233ff1daa8914d51c06eb72ff2550 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x3 (x1 x4 (x1 x2 x5)))).
Theorem missingprop_90d509bd8706c145adbb622ea79d7b70b4307aa02d76a2427a59b6e040f47cdc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x5 (x1 x2 (x1 x4 (x1 x3 x6))))).
admit.
Qed.
Theorem missingprop_0a97c7a31e38b0b19952dc215c85fb9c66dff76721c74d3d3900c9ebc179d8df : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x5 (x1 x3 (x1 x4 (x1 x2 x6))))).
admit.
Qed.
Theorem missingprop_01fcd6886950395663334639e7fa0ba571c79753a62fd50292d889e3bc03b9f3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x5 (x1 x3 (x1 x2 (x1 x4 x6))))).
admit.
Qed.
Axiom missingprop_17f2e534568ee7312c417497530472991cbc191bc8362198ef82a32098ba0e8c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x1 x2 (x1 x3 (x1 x4 x5)) = x1 x4 (x1 x3 (x1 x2 x5)))).
Theorem missingprop_d1641884db76d154e71e1df1060b33199f2bfead2411925a087979281438edfa : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x5 (x1 x4 (x1 x3 (x1 x2 x6))))).
admit.
Qed.
Theorem missingprop_6d1a3b5a223578a3add2e029f6e1eed06bafbfac9279a764563d553b2fa697c4 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x5 (x1 x4 (x1 x2 (x1 x3 x6))))).
admit.
Qed.
Theorem missingprop_5d3187157b7b1096324bc8c4956a65dc04e116adcad35fc0fcbac4c7f04ef09e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x4 (x1 x2 (x1 x5 (x1 x3 x6))))).
admit.
Qed.
Theorem missingprop_309fec984ac6cc8b8adec797fb0a2d3f2693d312f2b022fd754734c930fe81be : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x3 (x1 x2 (x1 x5 (x1 x4 x6))))).
admit.
Qed.
Axiom missingprop_9551c74ff689713f6e29d6039e164b7f427808e036d50b6ddb9edf722f975820 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x4 (x1 x5 (x1 x2 (x1 x3 x6))))).
Theorem missingprop_c7a5ce18a43642e92566eaac1f11466ec2cdad1d372f890cc5f913370407cb11 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x5 (x1 x2 (x1 x6 (x1 x3 (x1 x4 x7)))))).
admit.
Qed.
Theorem missingprop_a26ed5bb6733d7903032001e43a857e129868009a38277ff0095af68e5cc2043 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x5 (x1 x2 (x1 x6 (x1 x4 (x1 x3 x7)))))).
admit.
Qed.
Theorem missingprop_cde318c627ea25c9481d49a76c0e871921dfce3bebb247ff28248f99ffb66afb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x5 (x1 x2 (x1 x4 (x1 x6 (x1 x3 x7)))))).
admit.
Qed.
Axiom missingprop_2ce9a82c8ef9efc0240c60d5f07d019e2f7a44da8d6114bc529d6fb2d8f3a783 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 x6))) = x1 x3 (x1 x4 (x1 x5 (x1 x2 x6))))).
Theorem missingprop_1eaddbf5812df8d03721cd9246ab1d0d6d216dd3f98948c4882b6c693100a389 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x4 (x1 x2 (x1 x6 (x1 x3 (x1 x5 x7)))))).
admit.
Qed.
Theorem missingprop_6cb426c27f19b8d6faf4c1790bd28bd6df76ab6d0071bd487b5a186dd112ec32 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x4 (x1 x2 (x1 x6 (x1 x5 (x1 x3 x7)))))).
admit.
Qed.
Theorem missingprop_9d53160acc2da5df9d1364b38a8b640a265d4c23adb0e10d6cfd3684b795efb6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x4 (x1 x2 (x1 x5 (x1 x6 (x1 x3 x7)))))).
admit.
Qed.
Theorem missingprop_4bdb37ff43fa5d0c3ac040d851c0fbfd251035928263b085023cb6769e51270e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x4 (x1 x2 (x1 x3 (x1 x6 (x1 x5 x7)))))).
admit.
Qed.
Axiom missingprop_f0b76402e77112232d36cbd146a3e3efd40fdf823d5b935fe896a6fb8918a817 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x4 (x1 x5 (x1 x6 (x1 x2 (x1 x3 x7)))))).
Theorem missingprop_19bbd18ba2419739fbb084c6bc2da03612493ac5e84630046877711bb40713fd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x6 (x1 x2 (x1 x7 (x1 x3 (x1 x5 (x1 x4 x8))))))).
admit.
Qed.
Theorem missingprop_c50367642f32449704fae6a397c57508388cd92398bbf6c558accd74589e5f05 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x6 (x1 x2 (x1 x7 (x1 x3 (x1 x4 (x1 x5 x8))))))).
admit.
Qed.
Theorem missingprop_99e4ab60c80542d3595d831684e689f5b5f069e95a0d0611cb8f3f8474a7a2cc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x6 (x1 x2 (x1 x7 (x1 x4 (x1 x5 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_51ff5346f14308fa53bceec27de5cadae32e279857f6653a99ad1042b8151c62 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x6 (x1 x2 (x1 x7 (x1 x4 (x1 x3 (x1 x5 x8))))))).
admit.
Qed.
Theorem missingprop_a8b7e94e87bd3ae03e1b09dc9fabe988468f00e1231690e78e87f97fb5aa2087 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x6 (x1 x2 (x1 x7 (x1 x5 (x1 x4 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_b92cd058a8eb8a3cbc44a3ee197a39ac72523c075af4b704570bb9784c4593fe : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x7 (x1 x3 (x1 x6 (x1 x4 x8))))))).
admit.
Qed.
Theorem missingprop_3d9bd0c8e428e5022fa19848312bebd195d5b7b6a8522da51a2aa712ed6ad7aa : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x7 (x1 x3 (x1 x4 (x1 x6 x8))))))).
admit.
Qed.
Theorem missingprop_4143e88360458d02b465eb463f87042db04bbe479bcd1148f64b9f5afe3aca6c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x7 (x1 x4 (x1 x6 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_7d884f4d4feaf45b78ba80ad3e2b168c3561571b0e78e36da69e17586ea0b92b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x7 (x1 x4 (x1 x3 (x1 x6 x8))))))).
admit.
Qed.
Theorem missingprop_2a6a84877d147f4b46ca383308fe713c40858c2f21e7cc3a8379d7af7041c47b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x7 (x1 x6 (x1 x4 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_2b9e12a8bf5ac80f2f6cc8273dcec7a77ab1ba1ca1bcf0bbd93557de134effd5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x7 (x1 x6 (x1 x3 (x1 x4 x8))))))).
admit.
Qed.
Theorem missingprop_d528e67a3ccf5b5b1ae800de9f80708e7749d8d9a219958a2a7c5f9b98422aad : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x6 (x1 x3 (x1 x7 (x1 x4 x8))))))).
admit.
Qed.
Theorem missingprop_df8135f8340ba2dcbb5242ac91e8130a2f2eb4dbed85387890afd2eb4d5559b9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x6 (x1 x4 (x1 x7 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_51cbeacd4442966df34cc6a1453aeaa54c6423bb44e5e026f10d1fdb96476783 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x6 (x1 x7 (x1 x4 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_af9f0f2f5d463664123c5255b320cc58a24aef7f9045b76e81f72b3f74093ab9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x6 (x1 x7 (x1 x3 (x1 x4 x8))))))).
admit.
Qed.
Theorem missingprop_f82c732fa72d39962937e1286b67fa2a4152bec52e8856103cc7fdfbb57cbfa9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x4 (x1 x3 (x1 x7 (x1 x6 x8))))))).
admit.
Qed.
Theorem missingprop_8fa1ade8c4b9726d0edb89c0e3fbe22e800a6c40f04b1f815a6b7866b39dcac7 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x4 (x1 x6 (x1 x7 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_c7fb554fc26ca70bc7ee8817b9cbb3e1b711ace5c414ee62d485723dfa3e0606 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x4 (x1 x7 (x1 x6 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_e2fd99362389e31035962e493dfb93adb0fa0b8f6fdd34ef3715f94a1855d8a9 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x4 (x1 x7 (x1 x3 (x1 x6 x8))))))).
admit.
Qed.
Theorem missingprop_94b77e1258d0fdb65853df4cfa366767af11d0c12983dc1b17e5d57584ed2974 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x5 (x1 x2 (x1 x3 (x1 x4 (x1 x7 (x1 x6 x8))))))).
admit.
Qed.
Axiom missingprop_515047c02fed97c50f69ea07f84c55a116d5435d48e441446058ba601add8797 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 x7)))) = x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x2 x7)))))).
Theorem missingprop_37566f689ee80784c76315f9e82a3acda49ac73c2564dff3c3763d2735f371cd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x7 (x1 x3 (x1 x6 (x1 x5 x8))))))).
admit.
Qed.
Theorem missingprop_e1720331dbc6a89309899b926add92036e9c9af353f8a7cdf3388eb697dcc8a5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x7 (x1 x3 (x1 x5 (x1 x6 x8))))))).
admit.
Qed.
Theorem missingprop_05b72f4092a91d5fbf4993ab9666ccf7fb0e02d35bf474c04dac120eab3c125a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x7 (x1 x5 (x1 x6 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_da70d64b1766c6755db5ed31030b5bd0e652f3514e799f7a9bb3553b569cb2e5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x7 (x1 x5 (x1 x3 (x1 x6 x8))))))).
admit.
Qed.
Theorem missingprop_091312c4fbc2c5352aa79be557626591142eb9e62a4b424dc8a4c6805c2f548b : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x7 (x1 x6 (x1 x3 (x1 x5 x8))))))).
admit.
Qed.
Theorem missingprop_397c3e33af172d2eacce390e808a403b34cba7d101fdd9bf0e98d31a0c5f681a : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x6 (x1 x3 (x1 x7 (x1 x5 x8))))))).
admit.
Qed.
Theorem missingprop_ddae318e785f3701f673e60c3f885e1bac343bfe039fe1430ca2a72a729718e5 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x6 (x1 x5 (x1 x7 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_c59c85abc2e3e4e2d5b484583a380c85a9ffca56a713d40d651063a8bae7c517 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x6 (x1 x7 (x1 x3 (x1 x5 x8))))))).
admit.
Qed.
Theorem missingprop_e3f5698dc6ee46cc69016fc6c5fb3a4ca2431549540bd41f59198c54c2b8f6d0 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x5 (x1 x3 (x1 x7 (x1 x6 x8))))))).
admit.
Qed.
Theorem missingprop_d43d7e19da0cd1404adecdc22c78fbd1f986714a390d47301ca428fc3e65bdd8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x5 (x1 x6 (x1 x7 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_6069ae8b0b32fbe8d0c19f6004186ac50f10bf90e6d978c295c02a6ec07ed1ff : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x5 (x1 x7 (x1 x6 (x1 x3 x8))))))).
admit.
Qed.
Theorem missingprop_d7d7cf155a16d3eda3bf35ba519338b3b90fad12c5f8ed9e6356892b2e79a509 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x5 (x1 x7 (x1 x3 (x1 x6 x8))))))).
admit.
Qed.
Theorem missingprop_8217de59f44ad11e1e0aab82fb795d97c5f7701d63eb5d6a8602b4c147553a62 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x3 (x1 x5 (x1 x7 (x1 x6 x8))))))).
admit.
Qed.
Theorem missingprop_584763555d880dc1e447a9358bae5cb6bd936ced57a7fcf43063755375a47d01 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x3 (x1 x6 (x1 x7 (x1 x5 x8))))))).
admit.
Qed.
Theorem missingprop_f9b0048333d04250926e632f51472a08c03618b92c59fc8e10b9ecd836fc7973 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x3 (x1 x7 (x1 x6 (x1 x5 x8))))))).
admit.
Qed.
Theorem missingprop_e30ca893a6ae22bf44990a89f362e949e9f6e42cadf5eec3fce01da416d62038 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x2 (x1 x3 (x1 x7 (x1 x5 (x1 x6 x8))))))).
admit.
Qed.
Axiom missingprop_01b85a5229069244bfc0fa2496398b6a876770b04992bb705aa6f0b7bd0f95bd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 x8))))) = x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x2 (x1 x3 x8))))))).
Theorem missingprop_50728f5dc7dd7c831784b357deaed5561276013716127fc3f2a3b51e9cd1fdfa : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x2 (x1 x4 (x1 x3 (x1 x5 x9)))))))).
admit.
Qed.
Theorem missingprop_11a8ade97f5a0f8354e3f485e579564d28b2ef70dcb00e19ead2da9418674b6c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x2 (x1 x4 (x1 x5 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_91d14cecc4094e205815d8088e00a58d6be4d3c3fe671a0f69762363aba9ba55 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x2 (x1 x3 (x1 x4 (x1 x5 x9)))))))).
admit.
Qed.
Theorem missingprop_f3178646da964a68355abe898751e0b5d9bada372f3d5bddd6b3296d64f00860 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x2 (x1 x3 (x1 x5 (x1 x4 x9)))))))).
admit.
Qed.
Theorem missingprop_9f244fd46120f349befa9a9bba5204ef6bbe0dd1a7ddf341e6733edee4708b41 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x3 (x1 x2 (x1 x4 (x1 x5 x9)))))))).
admit.
Qed.
Theorem missingprop_f0ac769711e8c730969998afe966fbcea3e8a2e56c28090306454730b918ab04 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x3 (x1 x2 (x1 x5 (x1 x4 x9)))))))).
admit.
Qed.
Theorem missingprop_cb0e4c909cdde270cef1f9b926166a93943f20e0b46527418edc9466c1b2b367 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x4 (x1 x5 (x1 x2 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_c7563418d5fcd8439504e73caa7fe08ff0d257ec9ad08f1fbcf0a5bd823f5634 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x4 (x1 x2 (x1 x3 (x1 x5 x9)))))))).
admit.
Qed.
Theorem missingprop_570841a72c4e42d8ed2b54ecf205440010378225ffd9e02182fd913321a8e079 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x4 (x1 x2 (x1 x5 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_f05ce9019b15b26dd409d7c9986acfdab7fc68e176962f77f6d1dab480bdbcfd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x5 (x1 x4 (x1 x2 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_a9570d8dcaef494faff8850bbe018f960197b25864ff4e1ef54e604786b16cae : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x5 (x1 x2 (x1 x3 (x1 x4 x9)))))))).
admit.
Qed.
Theorem missingprop_005845f820338066dc3bae3b73a77d4b2f2fe48c39ce0755a0109984ac862468 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x6 (x1 x5 (x1 x2 (x1 x4 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_a7f6145e2311a1c1a57e6644189df43d38b18074299f99ef967109c364660b1e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x2 (x1 x6 (x1 x3 (x1 x4 x9)))))))).
admit.
Qed.
Theorem missingprop_84951e42de17efad739d4d2a9461da4b41e1e08acb44075e0fead74723f70bfc : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x2 (x1 x6 (x1 x4 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_8c1c804dfce0881fe909f4c051ca2b375f85868f70f70531b61515797f69cb86 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x2 (x1 x4 (x1 x3 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_152f952bc572a9b0ec0fda5703257d72058234d116b838d9cc992e98ea639906 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x2 (x1 x4 (x1 x6 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_017fd4e7b14e009f675a02a3a5e31f8c1d789c2a76cfedf16458afdd39605113 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x2 (x1 x3 (x1 x4 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_cd985edfddb12442cb81f27c632540af376c290f1ecb3300fb25f6e6fb647a35 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x2 (x1 x3 (x1 x6 (x1 x4 x9)))))))).
admit.
Qed.
Theorem missingprop_a325d237363220c2140ee90dace48b96d959fcf07352a8f9a9d28f3977352e21 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x3 (x1 x2 (x1 x4 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_28a873fe94c3dd3e85d34357cb937ce5b9c0dd0ae4a8cf19a3153a6b5efd1243 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x3 (x1 x2 (x1 x6 (x1 x4 x9)))))))).
admit.
Qed.
Theorem missingprop_04251c39ba158e70c9ad11f6026f875e13718a644d2161341381a40f53c5110c : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x4 (x1 x6 (x1 x2 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_294c9e8fd7a248b41bd6c8491fce3b6d4bebb4b4c445c618c6b1709180e4a992 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x4 (x1 x2 (x1 x3 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_157aac7c997b7888eaa4fb9c6ac89d3c4dd642ffbe9d08c33a95d2bd639e6b58 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x4 (x1 x2 (x1 x6 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_291af4ee8f213de622121a76a39fe54de5473eabd2f2895f0cce356e5f2000dd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x6 (x1 x2 (x1 x3 (x1 x4 x9)))))))).
admit.
Qed.
Theorem missingprop_a7b77a4fe11e9c39d8a4b46f053aee560f4cdebe40df210fdc288b665cd0ddeb : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x5 (x1 x6 (x1 x2 (x1 x4 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_39bfaab23d5346b01aa68be3f2d934751fc78b76a8aaa08af42eee2aa4637b46 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x2 (x1 x6 (x1 x3 (x1 x5 x9)))))))).
admit.
Qed.
Theorem missingprop_5a466de4282b89b1ae6305c47d58b3b2565037121bd2be6c676b0e650f21c3ab : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x2 (x1 x6 (x1 x5 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_b960dacafd6975d3e4241e548e38795431ee61c501a170f292e6050ea7565d20 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x2 (x1 x5 (x1 x3 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_27bccf65decb288c309d7dc1de06787feefb8b76fd48a8eecd2bf7a40b7d80ae : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x2 (x1 x5 (x1 x6 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_94d0bcc5271722b37aa9b8f8c09b4b36aa29a0a865a23a430cb35ee8084d5039 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x2 (x1 x3 (x1 x5 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_02c71ec5bf2c2822176dc41ebb8137b3cd29e5949397c9d465263a2bd3dfe9e6 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x2 (x1 x3 (x1 x6 (x1 x5 x9)))))))).
admit.
Qed.
Theorem missingprop_0feeb7e07397e90b4f99320e46c449999fa546e44e4d63d7717a56d2242a28ed : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x3 (x1 x2 (x1 x5 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_37dcd8d0c4797a86e31a1b6051066e26c35b480fa638ce9ebd80229a34718f4e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x3 (x1 x2 (x1 x6 (x1 x5 x9)))))))).
admit.
Qed.
Theorem missingprop_6b53b9be5780b9ec25542cf77c8f78b3a28975fda2d225b1678416613fad6efd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x5 (x1 x6 (x1 x2 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_fe0af215692801165307afe9829f027bf7aebf327a9e8496ab340460a6dd6f7e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x5 (x1 x2 (x1 x3 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_5c8dc03fea137161a697d75c27ae98279edfb0a94f1f43b9baf624a217a4f6f3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x5 (x1 x2 (x1 x6 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_a1e60497d4b2783414fe108d2fd32949d9a68a917e8eba55788c20a5ad130775 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x6 (x1 x5 (x1 x2 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_1f56f0c55e13d8a3fb687dfc42fd482154c99797069b6f64669d0fe2a41acda3 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x6 (x1 x2 (x1 x3 (x1 x5 x9)))))))).
admit.
Qed.
Theorem missingprop_454077c8e66e7ba68baa6dccf73880cf715233722f560e800042fca3791e3530 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x4 (x1 x6 (x1 x2 (x1 x5 (x1 x3 x9)))))))).
admit.
Qed.
Theorem missingprop_6bf7f9cf1bad2588248face049101b076910c3579767c190df8353a2f304948e : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x3 (x1 x2 (x1 x6 (x1 x4 (x1 x5 x9)))))))).
admit.
Qed.
Theorem missingprop_09eaad707ef33fe00d8275719b07e5b20486c5eababd3664f11520b0af092ccd : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x3 (x1 x2 (x1 x6 (x1 x5 (x1 x4 x9)))))))).
admit.
Qed.
Theorem missingprop_ee476c867ce8f4a84fcaef241eaf802bde64642418b4228c0c82bd9db18bc86f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x3 (x1 x2 (x1 x5 (x1 x4 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_5d315c6a999c465567c1ead77d1343720ad560cb69e1f8d2812b4c4c436c0f58 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x3 (x1 x2 (x1 x5 (x1 x6 (x1 x4 x9)))))))).
admit.
Qed.
Theorem missingprop_5c8df7cea7cc54e5a9c3003d765148b6809eb184ed25b74fe0b196ade0b695b8 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x3 (x1 x2 (x1 x4 (x1 x5 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_3054ec9a0060584f897be12190f131f2dbe68e7cd3c2a6cd7772d498a0bad399 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x3 (x1 x2 (x1 x4 (x1 x6 (x1 x5 x9)))))))).
admit.
Qed.
Theorem missingprop_788c4bd259275356f738cda6bc710fa22879589e7a29ec2921b95737a5b1b49f : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x5 (x1 x6 x9)))))))).
admit.
Qed.
Theorem missingprop_09b7d4d98230b1538bffe56e283a2729c3251307a08c6bfa505e0ed8873e2b22 : (forall x0 : set -> prop, forall x1 : set -> set -> set, (forall x2 x3, x0 x2 -> x0 x3 -> x0 (x1 x2 x3)) -> (forall x2 x3 x4, x0 x2 -> x0 x3 -> x0 x4 -> x1 x2 (x1 x3 x4) = x1 x3 (x1 x2 x4)) -> (forall x2 x3 x4 x5 x6 x7 x8 x9, x0 x2 -> x0 x3 -> x0 x4 -> x0 x5 -> x0 x6 -> x0 x7 -> x0 x8 -> x0 x9 -> x1 x2 (x1 x3 (x1 x4 (x1 x5 (x1 x6 (x1 x7 (x1 x8 x9)))))) = x1 x7 (x1 x8 (x1 x3 (x1 x4 (x1 x2 (x1 x6 (x1 x5 x9)))))))).
admit.
Qed.
