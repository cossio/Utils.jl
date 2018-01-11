using Base.Test
import Utils

@test Utils.allsame([1,1]) == true
@test Utils.allsame([1,2,1]) == false