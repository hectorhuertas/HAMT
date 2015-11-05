require 'digest'

class Node
  attr_reader :key, :value, :links, :depth

  def initialize(depth = 0)
    @links = []
    @depth = depth
  end

  def set(key_input, value_input)
    if key == key_input || key.nil?
      @value = value_input
      @key   = key_input
    else
      @links[find_index(key_input, depth)] ||= Node.new(depth + 1)
      @links[find_index(key_input, depth)].set(key_input, value_input)
    end
  end

  def get(key_input)
    if key_input == key
      @value
    else
      @links[find_index(key_input, depth)].get(key_input)
    end
  end

  def find_index(key_input,depth=0)
    (Digest::SHA1.hexdigest(key_input.to_s).to_i(16) >> 5*depth)& 31
  end
end
