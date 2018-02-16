using Base.Test
import Utils


@test Utils.sumt(Int, i for i = 1:10 if i < 0) === 0
@test Utils.prodt(Int, i for i = 1:10 if i < 0) === 1

@test Utils.simplexvol([[0., 0.], [1., 0.], [0., 1.]]) == 0.5

@test Utils.lbinomial(10, 5) ≈ 5.5294290875114233067303074602045842750830661139479