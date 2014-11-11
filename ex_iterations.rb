def factors(num)
  factors = []
  if num == 0
    return [0]
  end
  (1..num).each do |i|
    if num % i == 0
      factors.push(i)
    end
  end
  factors
end

# def bubble_sort(arr)
#   (0...arr.length).each do |i|
#     (0...arr.length-i).each do |j|
#       if arr[j] > arr[j-1]
#         #p arr[j], arr[i]
#
#         arr[j],arr[j-1] = arr[j-1],arr[j]
#         #p arr[j], arr[i]
#       end
#     end
#   end
#   arr
# end

def bubble_sort(arr)
  i = 0
  k = 1
   while i < arr.length
     swapped = false
     while k <arr.length
       if arr[i] > arr [k]
         arr[i],arr[k] = arr[k],arr[i]
         swapped = true
       end
       i+=1
       k+=1
     end
     if swapped == false
       return arr
     end
     i=0
     k=1
   end
 end

 def substrings(str)
   arr_substring = []
   (0...str.length).each do |i|
     (i...str.length).each do |j|
       arr_substring.push(str[i..j])
     end
   end
   result = []
   arr_substring.each do |i|
     if dict_check(i)
       result.push(i)
     end
   end
   result
 end

 def dict_check(str)

  dict = File.readlines("dictionary.txt")
  arr = []
  dict.each do |i|
    arr << i.chomp
  end
   if arr.include?(str)
     return true
   else
     return false
   end
 end
