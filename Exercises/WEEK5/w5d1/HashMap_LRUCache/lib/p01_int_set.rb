class MaxIntSet

  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if num > @store.length - 1 || num < 0
      raise "Out of bounds"
    end
    @store[num] = true
    true
  end

  def remove(num)
    @store[num] = false
    true
  end

  def include?(num)
    return false if @store.length < num || num < 0
    return @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)

    if !include?(num)
      self[num] << num
    end
    
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      self[num] << num
      @count += 1
    end

    if !(num_buckets > @count)
      resize!
    end

  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count -= 1
    end
    
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    dup = @store.map { |bucket| bucket.dup }

    @store = Array.new(num_buckets * 2){Array.new}

    

    dup.each do |bucket|
      bucket.each do |obj|
        self[obj] << obj
      end
    end
        
        # new_obj = obj
        # @store[i].delete(obj)
        # self.insert(obj)
  end
end
