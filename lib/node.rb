class Node
  attr_reader :key, :value

  def set(key, value)
    @value = value
  end

  def value_of(key)
    @value
  end

end
