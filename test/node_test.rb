require 'node'

class NodeTest < Minitest::Test

  def setup
    @node = Node.new
  end

  def test_it_exists
    assert Node
  end

  def test_it_is_created_without_a_key
    refute @node.key
  end

  def test_it_is_created_without_a_value
    refute  @node.value
  end


  # def test_it_is_created_with_its_e

end
