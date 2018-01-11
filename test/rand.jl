using Utils
using Base.Test


for rep = 1:100
    @test 40. ≤ randin(40., 50.) ≤ 50.
end