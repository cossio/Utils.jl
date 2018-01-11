"random number between a and b"
function randin(a::Real, b::Real)
    -Inf < a ≤ b < Inf || DomainError()
    a + (b - a) * rand()
end


"""
Weighted random integer.
Given weights weights = (w1, w2, ...), returns a random integer i with probability proportional to w_i.
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

