class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0

  end

  def insert(key)
    if !self.include?(key)
      self[key.hash] << key
      @count += 1
    end
    if !(num_buckets > @count + 1)
      resize!
      puts "how"
    end
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key.hash].delete(key)
      @count -= 1
    end
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
    
    @store = Array.new(num_buckets * 2){ Array.new }
    
    dup.each do |bucket|
      bucket.each do |el|

        @store[el.hash] << el
      end
    end


  end
end
