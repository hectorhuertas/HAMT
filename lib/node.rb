require 'digest'

class Node
  attr_reader :key, :value, :links

  def initialize
    @links = []
  end

  def set(key_input, value_input)
    if key == key_input || key.nil?
      @value = value_input
      @key   = key_input
    else
      @links[find_index(key_input)] ||= Node.new
      @links[find_index(key_input)].set(key_input, value_input)
    end
  end

  def get(key_input)
    if key_input == key
      @value
    else
      @links[find_index(key_input)].get(key_input)
    end
  end

  def find_index(key_input, depth = 0)
    (Digest::SHA1.hexdigest(key_input.to_s).to_i(16) >> 5*depth)& 31
  end
end
