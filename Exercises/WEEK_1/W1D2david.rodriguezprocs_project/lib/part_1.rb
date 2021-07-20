
def my_map(arr, &prc)
    array = []

    arr.each { |num| array << prc.call(num) }

    array
end

def my_select(arr, &prc)
    selected = []
    arr.each { |el| selected << el if prc.call(el) }
    selected
end

def my_count(arr, &prc)
    count = 0
    arr.each { |el| count += 1 if prc.call(el) }
    count
end

def my_any?(arr, &prc)
    count = 0
    arr.each { |el| count += 1 if prc.call(el) }
    count >= 1
end

def my_all?(arr, &prc)
    arr.each do |el|
        if prc.call(el) == false
            return false
        end
    end
    true
end

def my_none?(arr, &prc)
    arr.each do |el|
        if prc.call(el) == true
            return false
        end
    end
    true
end