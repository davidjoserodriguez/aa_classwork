require "byebug"
class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    random = []
    length.times { random << POSSIBLE_PEGS.keys.sample }
    Code.new(random)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map { |char| char.upcase }
    else
      raise "error"
    end
  end

  def[](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end
  
  def num_exact_matches(code_instance)
    count = 0
    (0...code_instance.length).each do |i|
      count += 1 if code_instance[i] == self[i]
    end
  end

  def num_near_matches(code_instance)
    pegs = @pegs.dup
    code = code_instance.pegs.dup

    pegs.each_with_index do |peg, i|
      if peg == code[i]
        pegs[i] = nil
        code[i] = nil
      end
    end

    pegs.delete(nil)
    code.delete(nil)

    hash = Hash.new(0)

    pegs.each_with_index do |el1, i1|
      code.each_with_index do |el2, i2|
        if i1 != i2 && el1 == el2
          if !hash.has_key?(el1)
            hash[el1] += 1
          end
        end
      end
    end
    hash.values.sum
  end

  def ==(code_instance)
    code_instance == @pegs
  end

end





