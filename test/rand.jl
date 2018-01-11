using Base.Test
import Utils


for rep = 1:100
    @test 40. ≤ Utils.randin(40., 50.) ≤ 50.
    @test sum(Utils.randsimplex(10)) == 1
    @test all(Utils.randsimplex(10) .≥ 0)
end
