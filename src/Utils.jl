module Utils

export sumt


"safe typed sum. Returns correct zero of correct type when iterator is empty."
function sumt(::Type{T}, itr)::T where T
    isempty(itr) ? zero(T) : sum(x::T for x in itr)::T
end


"x*log(x) that gives zero when x = 0"
function xlogx(x)
    x ≥ 0 || DomainError()
    x == 0 ? zero(log(x)) : x * log(x)
end


end # module
