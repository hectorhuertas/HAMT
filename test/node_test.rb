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

  def test_it_sets_a_key_value
    @node.set('Pizza', 'Yummy')
    assert_equal 'Yummy', @node.value
  end

  def test_it_sets_other_key_value
    @node.set('Brocoli', 'Ahgg')
    assert_equal 'Ahgg', @node.value
  end

  def test_it_gets_a_value_from_its_key
    @node.set('Pizza', 'Yummy')
    assert_equal 'Yummy', @node.get('Pizza')
  end

  def test_it_gets_another_value_from_its_key
    @node.set('Brocoli', 'Ahgg')
    assert_equal 'Ahgg', @node.get('Brocoli')
  end

  def test_it_can_override_the_gets_a_key
  end

  def test_it_can_override_the_gets_another_key
  end
end
