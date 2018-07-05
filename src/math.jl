export sumt, prodt, xlogx, randin


"safe typed sum. Returns correct zero of correct type when iterator is empty."
function sumt(::Type{T}, itr)::T where T
    isempty(itr) ? zero(T) : sum(x::T for x in itr)::T
end


"safe typed prod. Returns correct one of correct type when iterator is empty."
function prodt(::Type{T}, itr)::T where T
    isempty(itr) ? one(T) : prod(x::T for x in itr)::T
end


"x*log(x) that gives zero when x = 0"
xlogx(x::Float64) = (warn("Use StatsFuns.xlogy instead"); xlogy(x,x))


"x*log(y) that gives zero when x = y = 0"
function xlogy(x::Float64,y::Float64)
    warn("Use StatsFuns.xlogy instead")
    y ≥ 0 || DomainError()
    x == 0 ? 0. : x * log(y)
end


"Volume of a simplex with vertices in V"
function simplexvol(V::Vector{Vector{Float64}})
    n = length(V) - 1
    @assert all(length.(V) .== n)
    abs(det(hcat((V[i] - V[end] for i = 1:n)...))) / factorial(n)
end


"log of binomial coefficient"
function lbinomial(i::Real, j::Real)
    0 ≤ i < Inf && 0 ≤ j < Inf || throw(DomainError())
    lgamma(i + 1) - lgamma(j + 1) - lgamma(i - j + 1)
end
