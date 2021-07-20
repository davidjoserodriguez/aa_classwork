require "byebug"

def some?(array, &prc)
    count = 0
    array.each { |el| count += 1 if prc.call(el) }
    count > 0
end

#p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
#p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
#p some?([8, 2]) { |n| n.even? }                                       # true
#p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
#p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
#p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        # true

def exactly?(array, n, &prc)
    count = 0
    array.each { |el| count += 1 if prc.call(el) == true }
    count == n
end

#p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
#p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
#p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
#p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
#p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
#p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
#p exactly?([4, 5], 3) { |n| n > 0 }                             # false
#p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
#p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true

def filter_out(array, &prc)
    arr = []
    array.each { |el| arr << el if !prc.call(el) }
    arr
end

# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
# p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
# p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]

def at_least?(array, n, &prc)
    count = 0
    array.each { |el| count += 1 if prc.call(el) == true }
    count >= n
end

#p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# false
#p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# false
#p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }
# true
#p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }
# true
#p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# true
#p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# false
#p at_least?([false, false, false], 3) { |bool| bool }
# false
#p at_least?([false, true, true], 3) { |bool| bool }
# false
#p at_least?([true, true, true], 3) { |bool| bool }
# true
#p at_least?([true, true, true, true], 3) { |bool| bool }
# true

def every?(array, &prc)
    array.each do |el|
        return false if !prc.call(el)
    end
    true
end
#p every?([3, 1, 11, 5]) { |n| n.even? }                                 # false
#p every?([2, 4, 4, 8]) { |n| n.even? }                                  # true
#p every?([8, 2]) { |n| n.even? }                                        # true
#p every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }  # false
#p every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }   # false
#p every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }          # true

def at_most?(array, n, &prc)
    count = 0
    array.each { |el| count += 1 if prc.call(el) == true }
    count <= n
end

#p at_most?([-4, 100, -3], 1) { |el| el > 0 }                         # true
#p at_most?([-4, -100, -3], 1) { |el| el > 0 }                        # true
#p at_most?([4, 100, -3], 1) { |el| el > 0 }                          # false
#p at_most?([4, 100, 3], 1) { |el| el > 0 }                           # false
#p at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
#p at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
#p at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }    # false

def first_index(array, &prc)
    array.each_with_index { |el, i| return i if prc.call(el) == true }
    nil 
end

#p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
#p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
#p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
#p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
#p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
#p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil

def xnor_select(array, prc1, prc2)
    select = []
    array.each do |el|
        select << el if (prc1.call(el) && prc2.call(el)) || !(prc1.call(el) || prc2.call(el))
    end
    select
end

# is_even = Proc.new { |n| n % 2 == 0 }
# is_odd = Proc.new { |n| n % 2 != 0 }
# is_positive = Proc.new { |n| n > 0 }
# p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
# p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
# p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)  

def filter_out!(array, &prc)
    array.select! { |el| !prc.call(el) }
end

# arr_1 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_1) { |x| x.odd? }
# p arr_1     # [10, 6, 2]

# arr_2 = [1, 7, 3, 5 ]
# filter_out!(arr_2) { |x| x.odd? }
# p arr_2     # []

# arr_3 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_3) { |x| x.even? }
# p arr_3     # [3, 5]

# arr_4 = [1, 7, 3, 5 ]
# filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
# p arr_4 # [1, 7, 3, 5]

def multi_map(array, n=1, &prc)
    array.map do |el|
        n.times { el = prc.call(el) }
            el
    end        
end

p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]
