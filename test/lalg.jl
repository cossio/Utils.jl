using Base.Test
import Utils: blockinv, kernelnz, transpoflip

@testset "kernelnz" begin
    M = [2 0 0; 0 0 0; 0 0 0]
    @test kernelnz(M, 1; count=-1) == [[2], [3]]
end


@testset "transpoflip" begin
    M = [1 2 3; 4 5 6; 7 8 9]
    @test transpoflip(M) == [9 6 3; 8 5 2; 7 4 1]
end


@testset "invupdate" begin
    for rep = 1 : 100
        X = rand(5,5); M = X' * X; iM = inv(M)
        n = rand(1:5); δ = 5(rand() - 0.5)
        M2 = copy(M); M2[n,n] += δ;
        if isposdef(M) && abs(δ * iM[n,n] + 1) > 1e-3
            @test Utils.invupdate(iM, n, δ) ≈ inv(M2)
        end
    end
end

@testset "invupdate Hermitian" begin
    for rep = 1 : 100
        X = rand(5,5); M = Hermitian(X' * X); iM = inv(M)
        n = rand(1:5); δ = 5(rand() - 0.5)
        M2 = copy(M); M2[n,n] += δ;
        if isposdef(M) && abs(δ * iM[n,n] + 1) > 1e-3
            @test Utils.invupdate(iM, n, δ) ≈ inv(M2)
            @test Utils.invupdate(iM, n, δ) isa Hermitian
        end
    end
end
