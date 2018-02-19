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
