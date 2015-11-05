# require 'digest'

class Node
  attr_reader :key, :value, :links, :depth

  def initialize(depth = 0)
    @links = []
    @depth = depth
  end

  def set(input, value_input)
    if key == input || key.nil?
      @value = value_input
      @key   = input
    else
      @links[index_of(input)] ||= Node.new(depth + 1)
      @links[index_of(input)].set(input, value_input)
    end
  end

  def get(input)
    if input == key
      @value
    else
      @links[index_of(input)].get(input)
    end
  end

  def index_of(input)
    Index.get(input, depth)
  end
end
