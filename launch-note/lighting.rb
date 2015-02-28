#Eric

array=[1,2,3,4,5,6]
def quick_sort(arr)
pivot = arr.pop
less_than_pivot = arr.select{|x| x < pivot}
greater_than_pivot = arr.select{|x| x > pivot}
less_than_pivot + [pivot] + greater_than_pivot
end

puts quick_sort([1,6,3,18,5])


#Gen
#quiver app
#a note book for 
# 
#