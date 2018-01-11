"Tests whether all elements of a collection are equal"
allsame(itr) = all(first(itr) .== itr)