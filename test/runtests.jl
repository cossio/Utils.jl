using Utils
using Base.Test


@test sumt(Int, i for i = 1:10 if i < 0) === 0
@test prodt(Int, i for i = 1:10 if i < 0) === 1

for rep = 1:100
    @test 40. ≤ randin(40., 50.) ≤ 50.
end