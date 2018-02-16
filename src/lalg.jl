import Combinatorics

"""
For every kernel vector of M with nz nonzeros, returns
a vector [i1, ..., inz] of the  indices of the nonzero
entries. Thus returns an array of these index vectors.
Returns at most 'count' index vectors. 
If 'count' is negative, finds all.
"""
function kernelnz(M::Matrix, nz::Integer; count::Integer = 1)
    @assert size(M, 1) == size(M, 2)
    @assert 0 < nz ≤ size(M, 1)
    ker = Vector{Vector{Int}}()
    for c in Combinatorics.combinations(1 : size(M, 1), nz)
        0 ≤ count ≤ length(ker) && break
        if rank(M[c,c]) < nz
            push!(ker, c)
        end
    end
    return ker
end
