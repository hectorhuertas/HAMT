class Node
  attr_reader :key, :value, :links, :depth

  def initialize(depth = 0)
    @links = []
    @depth = depth
  end

  def set(input, value_input)
    case key
    when nil   then asign_to_this_node(input, value_input)
    when input then asign_to_this_node(input, value_input)
    else            asign_to_other_node(input, value_input)
    end
  end

  def get(input)
    if input == key
      @value
    else
      link_of(input).get(input)
    end
  end

  def asign_to_this_node(input, value_input)
    @value = value_input
    @key   = input
  end

  def asign_to_other_node(input, value_input)
    initialize_link(input)
    asign_to_linked_node(input, value_input)
  end

  def initialize_link(input)
    @links[index_of(input)] ||= Node.new(depth + 1)
  end

  def asign_to_linked_node(input, value_input)
    link_of(input).set(input, value_input)
  end

  def link_of(input)
    @links[index_of(input)]
  end

  def index_of(input)
    Index.get(input, depth)
  end

end
