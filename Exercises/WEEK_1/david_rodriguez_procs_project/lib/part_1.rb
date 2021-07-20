def my_map(array, &prc)
    arr = []
    array.each do |el|
        arr <<  prc.call(el)
    end
    arr
end

def my_select(array, &prc)
    arr = []
    array.each do |el|
        arr << el if prc.call(el)
    end
    arr
end

def my_count(array, &prc)
    count = 0

    array.each do |el|
        count += 1 if prc.call(el)
    end
    count 
end

def my_any?(array, &prc)
    count = 0

    array.each do |el|
        count += 1 if prc.call(el)
    end
    count >= 1
end

def my_all?(array, &prc)
    array.each do |el|
        return false if !prc.call(el)
    end
    true
end

def my_none?(array, &prc)
    array.each do |el|
        return false if prc.call(el)
    end
    true
end

