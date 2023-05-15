Theorem Random1_197_pos: (forall X0:set, (((In X0) Empty) -> (forall X1:set, (((In X1) X0) -> (forall X2:set, (((In X2) X1) -> (exists X3:set, (forall X4:set, (((ordinal X3) -> ((and (exactly2 X3)) (not (exactly5 X4)))) -> ((((ordinal X3) -> (exactly2 X3)) -> ((atleast2 X3) -> ((((not (atleast2 (Power ((binrep (Power (Power Empty))) Empty)))) -> (X3 = X4)) -> (atleast3 X3)) -> ((and (atleast5 X2)) (not ((exactly1of2 ((SNoLt X2) ((binrep (Power (Power (Power (Power Empty))))) Empty))) (TransSet X4))))))) -> (nat_p X3))))))))))).
let X. assume HX: X :e Empty.
prove False.
exact EmptyE X HX.
Qed.
