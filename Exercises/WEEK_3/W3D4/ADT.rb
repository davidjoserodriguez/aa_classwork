class Stack
    attr_reader :array
    def initialize 
        @array = []
    end
    
    def push(el)
        array.push(el)
        el
    end

    def pop
        array.pop
    end

    def peek
        array.last
    end

    def size
        array.length
    end

    def empty?
        array.emtpy?
    end
    
end

class Queue
    attr_reader :array
    def initialize
        @array = []
    end

    def enqueue(el)
        array.unshift(el)
        el
    end

    def dequeue
        array.pop
    end

    def peek
        array.last
    end

end

class Node

    attr_reader :value, children

    def initialize(value, children=[])
        @value = value
        @children = children
    end

end
class Map
    def initialize
        @pairs = []
end