class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each.with_index do |el, i|
      total += el.object_id * (i + 1)
    end
    total.hash
  end
end

class String
  def hash
    alpha = ("a".."z").to_a + ("A".."Z").to_a
    total = 0
    self.each_char.with_index do |char, i|
      total += alpha.index(char) * (i + 1)
    end
    total.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    alpha_bet = ("a".."z").to_a + ("A".."Z").to_a
    alpha_symbol = (:a..:z).to_a + (:A..:Z).to_a
    total = 0
    i = 0
    self.each do |k,v|
      i += 1
      # p "k:#{k} // v:#{v} // i:#{i}"
      total += (alpha_symbol.index(k) + (alpha_bet.index(v))) # nil error somewhere?
    end
    return total.hash

  end
end
