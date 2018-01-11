"random number between a and b"
function randin(a::Real, b::Real)
    -Inf < a ≤ b < Inf || DomainError()
    a + (b - a) * rand()
end


"""
Weighted random integer.
Given weights = (w1, w2, ...), returns a random integer i with probability proportional to w_i.
The weights should be 0 ≤ w_i < ∞, and do not need to sum to 1.
"""
function wrand(weights)
    wr = rand() * sum(w for w in weights)
    for (i,w) in enumerate(weights)
        @assert 0 ≤ w < Inf
        wr -= w
        if wr ≤ 0
            return i
        end
    end
end



"""
Returns a random vector x = (x1, x2, ..., xn), such that
xi ≥ 0 and sum(xi) = 1
"""
function randsimplex(n::Int) 
    # https://cs.stackexchange.com/questions/3227/uniform-sampling-from-a-simplex
    @assert n > 0
    diff(sort([0; rand(n - 1); 1]))
end


"""
Returns a random vector x = x0 * v[0] + x1 * v[1] + ... + xn * v[n]
where xi ≥ 0 and sum(xi) = 1
"""
function randsimplex(V::Vector{Vector{Float64}})
    @assert allsame(length.(V))
    X = randsimplex(length(V))
    sum(x*v for (x,v) in zip(X,V))
end
