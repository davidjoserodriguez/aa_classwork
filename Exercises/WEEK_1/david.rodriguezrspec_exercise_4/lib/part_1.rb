def my_reject(arr, &prc)
    array = []
    arr.each do |el|
        if !prc.call(el)
            array << el
        end
    end
    array
end

def my_one?(arr, &prc)

end

def hash_select(hash, &prc)
    selected = {}

    hash.each do |k, v|
        if prc.call(k, v)
            selected[k] = v 
        end
    end
    selected
end

def xor_select(arr, prc1, prc2)

    arr.select do |ele| 
        ele if (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))
    end
end

def proc_count(n, arr)
    
    arr.count { |prc| prc.call(n) }
    
end
