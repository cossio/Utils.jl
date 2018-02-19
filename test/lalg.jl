using Base.Test
import Utils

@testset "kernelnz" begin
    M = [2 0 0; 0 0 0; 0 0 0]
    @test Utils.kernelnz(M, 1; count=-1) == [[2], [3]]
end


@testset "transpoflip" begin
    M = [1 2 3; 4 5 6; 7 8 9]
    @test Utils.transpoflip(M) == [9 6 3; 8 5 2; 7 4 1]
end