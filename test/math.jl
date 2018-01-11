using Base.Test
import Utils


@test Utils.sumt(Int, i for i = 1:10 if i < 0) === 0
@test Utils.prodt(Int, i for i = 1:10 if i < 0) === 1
