class Node
  attr_reader :key, :value, :links, :depth

  def initialize(depth = 0)
    @links = []
    @depth = depth
  end

  def set(input, value_input)
    # 1 duplicate ourselves and return new copy

    case key
    when nil   then asign_to_this_node(input, value_input)
    when input then asign_to_this_node(input, value_input)
    else            asign_to_other_node(input, value_input)
    end
  end

  def duplicate
    # make a copy of this node....
    # (copy self and copy links array)
    # or...
    #  Node.new(key, value, links)
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
    # 2 - assign_to_linked_node has to return
    # a node (new node with changes made)
    # and we need to set that new node into the position of
    # the links in the new copy of ourself
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

  def keys
    keys_of_links = @links.compact.map{|node| node.keys}
    [key] + keys_of_links.flatten
  end

  def values
    values_of_links = @links.compact.map{|node| node.values}
    [value] + values_of_links.flatten
  end

end
