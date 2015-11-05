class Node
  attr_reader :key, :value

  def set(key, value)
    @value = value
  end

  def get(key)
    @value
  end

end
