class Stack
    attr_reader :array
    def initialize 
        @array = []
    end
    
    def push(el)
        self.array.push(el)
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

class Map
    def initialize
        @pairs = []
end