require 'byebug'

# O(n!)

def first_anagram?(str1, str2)
  perms = str1.split('').permutation.to_a
  result = perms.map { |perm| perm.join('') }
  result.include?(str2)
end


# O(n^2)

def second_anagram?(str1, str2)
  arr1 = str1.split('') #n
  arr2 = str2.split('') #n
  arr1.each_with_index do |ele, i| #n * n
    idx = arr2.find_index(ele) 
    arr2.delete_at(idx) if !idx.nil?
  end
  arr2.empty?
end


# O(n log n)

def third_anagram?(str1, str2)
  str1.split('').sort == str2.split('').sort
end




def fourth_anagram?(str1, str2)
  h1 = Hash.new(0)
  h2 = Hash.new(0)
  str1.each_char { |char| h1[char] += 1 }
  str2.each_char { |char| h2[char] += 1 }
  h1 == h2
end

def bonus_anagram?(str1, str2)
  hash = Hash.new(0)
  str1.each_char do |char|
    hash[char] += 1
  end
  str2.each_char do |char|
    hash[char] -= 1
  end
  hash.all? { |k, v| v.zero? }
end

p first_anagram?("gizmo", "sally")    #=> false
p first_anagram?("elvis", "lives")    #=> true
p second_anagram?("gizmo", "sally")    #=> false
p second_anagram?("elvis", "lives")    #=> true
p third_anagram?("gizmo", "sally")    #=> false
p third_anagram?("elvis", "lives")    #=> true
p fourth_anagram?("gizmo", "sally")    #=> false
p fourth_anagram?("elvis", "lives")    #=> true
p bonus_anagram?("gizmo", "sally")    #=> false
p bonus_anagram?("elvis", "lives")    #=> true