using Base.Test
import Utils

@testset "kernelnz" begin
    M = [2 0 0; 0 0 0; 0 0 0]
    @test Utils.kernelnz(M, 1; count=-1) == [[2], [3]]
end