using Utils
using Base.Test


@test sumt(Int, i for i = 1:10 if i < 0) === 0
@test prodt(Int, i for i = 1:10 if i < 0) === 1
