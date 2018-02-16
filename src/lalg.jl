import Combinatorics


"""
If M has a kernel vector with nz nonzeros, returns
a vector [i1, ..., inz] of the  indices of the nonzero
entries. Else returns a vector of zeros.
"""
function kernelnz(M::Matrix, nz::Integer)
    @assert size(M, 1) == size(M, 2) && 0 < nz ≤ size(M, 1)
    for c in Combinatorics.combinations(1 : size(M, 1), nz)
        if rank(M[c,c]) < nz
            return c
        end
    end
    return zeros(Int, nz)
end
