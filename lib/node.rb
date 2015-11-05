class Node
  attr_reader :key, :value

  def set(key_input, value_input)
    if key == key_input || key.nil?
      @value = value_input
      @key   = key_input
    end
  end

  def get(key_input)
    bob = key_input
    @value
  end
end
