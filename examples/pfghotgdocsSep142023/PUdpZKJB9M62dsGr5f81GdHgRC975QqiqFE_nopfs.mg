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
Definition ChurchNum_3ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => forall x1 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop, x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x2) -> x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x3) -> x1 (fun x2 x3 x4 : (set -> set) -> set -> set => x4) -> x1 x0).
Definition TwoRamseyGraph_4_5_24_ChurchNums_3x8 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> set -> set -> set :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x2 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x3 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => fun x4 : set => x0 (x1 (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5))) (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5))) (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5))) (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)))) (x1 (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5))) (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5))) (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)))) (x1 (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5))) (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6))) (x2 (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5))) (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5))) (x2 (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)) (x3 (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => fun x6 : set => x6) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5) (fun x5 : set -> set => x5)))) (fun x5 : set => x4)).
Axiom missingprop_b16663a4709f3780eaa894042f5cda662025d92844722e880355abe7e12fa986 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_3ary_proj_p (fun x1 x2 x3 : (set -> set) -> set -> set => x0 x3 x1 x2)).
Axiom missingprop_5881c3490ed9d7d79e8da4ec398853ff06374776f16caecd18fd5e637a25c01e : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_3ary_proj_p (fun x1 x2 x3 : (set -> set) -> set -> set => x0 x2 x3 x1)).
Theorem missingprop_e469b4f466c9cf3f9716ac72c16d6a4547fcc07c9f7022cbace07b47e401d293 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> (forall x1 : prop, (forall x2 x3 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, (forall x4 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x4 -> ChurchNum_3ary_proj_p (x2 x4)) -> (forall x4 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x4 -> ChurchNum_3ary_proj_p (x3 x4)) -> (forall x4 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x5 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop, x5 (x2 (x3 x4)) x4 -> x5 x4 (x2 (x3 x4))) -> (forall x4 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x5 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop, x5 (x3 (x2 x4)) x4 -> x5 x4 (x3 (x2 x4))) -> (forall x4 x5 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x6 x7 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x8 : (set -> set -> set) -> (set -> set -> set) -> prop, x8 (TwoRamseyGraph_4_5_24_ChurchNums_3x8 x4 x6 x5 x7) (TwoRamseyGraph_4_5_24_ChurchNums_3x8 (x2 x4) x6 (x2 x5) x7) -> x8 (TwoRamseyGraph_4_5_24_ChurchNums_3x8 (x2 x4) x6 (x2 x5) x7) (TwoRamseyGraph_4_5_24_ChurchNums_3x8 x4 x6 x5 x7)) -> x2 x0 = (fun x5 x6 x7 : (set -> set) -> set -> set => x5) -> x1) -> x1)).
admit.
Qed.
Definition ChurchNum_8ary_proj_p : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop :=
 (fun x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set => forall x1 : (((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set) -> prop, x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x2) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x3) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x4) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x5) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x6) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x7) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x8) -> x1 (fun x2 x3 x4 x5 x6 x7 x8 x9 : (set -> set) -> set -> set => x9) -> x1 x0).
Definition False : prop :=
 (forall x0 : prop, x0).
Axiom FalseE : False -> (forall x0 : prop, x0).
Axiom missingprop_1019f796b5519c5beeeef55b1daae2de48848a97e75d217687db0a2449fd5208 : (fun x1 x2 : set => x2) = (fun x1 x2 : set => x1) -> (forall x0 : prop, x0).
Theorem missingprop_2064d925adb7ad93ca392156fe7b0a7b799e0a1ed452f931aaf6d83e86b04609 : (forall x0 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, forall x1 : ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> ((set -> set) -> set -> set) -> (set -> set) -> set -> set, ChurchNum_3ary_proj_p x0 -> ChurchNum_8ary_proj_p x1 -> TwoRamseyGraph_4_5_24_ChurchNums_3x8 (fun x3 x4 x5 : (set -> set) -> set -> set => x3) (fun x3 x4 x5 x6 x7 x8 x9 x10 : (set -> set) -> set -> set => x3) x0 x1 = (fun x3 x4 : set => x3) -> (forall x2 : prop, (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x4) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x4) -> x2) -> (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x4) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x5) -> x2) -> (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x4) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x6) -> x2) -> (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x4) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x8) -> x2) -> (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x5) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x4) -> x2) -> (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x5) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x5) -> x2) -> (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x5) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x11) -> x2) -> (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x6) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x4) -> x2) -> (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x6) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x8) -> x2) -> (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x6) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x10) -> x2) -> (x0 = (fun x4 x5 x6 : (set -> set) -> set -> set => x6) -> x1 = (fun x4 x5 x6 x7 x8 x9 x10 x11 : (set -> set) -> set -> set => x11) -> x2) -> x2)).
admit.
Qed.