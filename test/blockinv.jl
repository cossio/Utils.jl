
@testset "blockinv" begin
    M = [1 2 3; 
         3 5 6; 
         7 8 9]
    @test blockinv(inv(M), [3]) ≈ [1/9]

    M = [1 2 12 1; 
         5 6 7 3; 
         9 10 11 12; 
         13 14 15 16];
    @test blockinv(inv(M), [3,4]) ≈ inv(M[[3,4], [3,4]])
    @test blockinv(inv(M), [4,3]) ≈ inv(M[[4,3], [4,3]])

    n = 6
    i = Int(n/2) + 1 : n
    for rep = 1 : 10
        M = rand(n, n)
        if abs(det(M)) > 1e-6 && abs(det(M[i,i])) > 1e-6
            if !(blockinv(inv(M), i) ≈ inv(M[i,i]))
                @show M
            end
            @test blockinv(inv(M), i) ≈ inv(M[i,i])
        end
    end

    n = 6
    i = Int(n/2) + 1 : n
    for rep = 1 : 10
        M = rand(n, n)
        M = Hermitian(0.5M + 0.5M')
        if abs(det(M)) > 1e-6 && abs(det(M[i,i])) > 1e-6
            if !(blockinv(inv(M), i) ≈ inv(M[i,i]))
                @show M
            end
            @test blockinv(inv(M), i) ≈ inv(M[i,i])
            @test blockinv(inv(M), i) isa Hermitian
        end
    end
end
