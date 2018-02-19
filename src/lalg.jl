import Combinatorics

"""
For every right kernel vector of M with nz nonzeros, finds
a vector [i1, ..., inz] of the  indices of the nonzero
entries. Returns an array with at most 'count' index vectors.
If 'count' is negative, finds all (default).
"""
function kernelnz(M::AbstractMatrix, nz::Integer; count::Integer = -1)
    @assert nz > 0
    M = full(M)
    ker = Vector{Vector{Int}}()
    for c in Combinatorics.combinations(1 : size(M, 2), nz)
        @assert length(c) == nz
        0 ≤ count ≤ length(ker) && break
        if rank(M[:,c]) < nz
            push!(ker, c)
        end
    end
    return ker
end


"Returns true if there is a vector v with `nz` non-zeros such that M⋅v = 0."
haskernelnz(M::AbstractMatrix, nz::Integer) = !isempty(kernelnz(M, nz; count = 1))


"""
Matrix flip around a diagonal:
   (a b     (d b
    c d) ->  c a)
"""
function transpoflip(A::Matrix)
    @assert size(A, 1) == size(A, 2)
    N = size(A, 1)
    B = [A[N + 1 - j, N + 1 - i] for i = 1 : N, j = 1 : N]
end
