def my_reject(array, &prc)

    arr = []
    array.each do |el|
        arr << el if prc.call(el) == false
    end
    arr
end

def my_one?(array, &prc)
    count = 0

    array.each do |el|
       count += 1 if prc.call(el)
    end
    count == 1

end

def hash_select(hash, &prc)
    new_hash = Hash.new(0)
    hash.each do |k, v|
        new_hash[k] = v if prc.call(k, v)
    end
    new_hash
end

def xor_select(array, prc1, prc2)
    arr =  []

    array.each do |el|
        arr << el if (prc1.call(el) || prc2.call(el)) && (!prc1.call(el) || !prc2.call(el) )
    end

    arr
end

def proc_count(n, array)
    
    array.count { |prc| prc.call(n) }
end
