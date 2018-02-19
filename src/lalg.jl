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



"""
Given the inverse matrix iM = [A B; C D] of a matrix M = [U V; W X]
(in block form), this returns inv(X). This is efficient if dim(A) ≪ dim(X), 
because it requires only the inversion of A. The indices `i`  (an iterator 
of integers) determine the sub-matrix X = M[i,i]. See: 
Bernstein, Dennis S. 2009. Matrix Mathematics: Theory, Facts, 
and Formulas. 2nd ed. Princeton Univ. Press. Eqs. 2.8.16-17.

Arguments:
    iM  matrix inverse of M
    i   index vector of the block X = M[i,i] that will be inverted
    iA  (optional) inverse of A if you have it.
"""
function blockinv end

function blockinv(iM::AbstractMatrix, i)
    @assert allunique(i) && all(1 .≤ i .≤ size(iM, 1))
    o = setdiff(1 : size(iM, 1), i)
    blockinv(iM, i, inv(iM[o,o]))
end


function blockinv(iM::AbstractMatrix, i, iA::AbstractMatrix)
    @assert allunique(i) && all(1 .≤ i .≤ size(iM, 1))
    o = setdiff(1 : size(iM, 1), i)
    
    B = iM[o,i]
    C = iM[i,o]
    D = iM[i,i]
    
    D - C * iA * B
end