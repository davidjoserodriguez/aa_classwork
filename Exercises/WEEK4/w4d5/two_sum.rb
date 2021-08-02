require 'byebug'

def bad_two_sum?(arr, target)
    result = []
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            return true if arr[i] + arr[j] == target
        end
    end
    false
end
arr = [0, 1, 5, 7]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) 

def okay_two_sum?(arr, target)
    sorted = arr.sort 
        
end