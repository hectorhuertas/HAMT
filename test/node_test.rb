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

  def test_it_inserts_a_key_value
    @node.set('Pizza', 'Yummy')
    assert_equal 'Yummy', @node.value
  end

  def test_it_inserts_other_key_value
    @node.set('Brocoli', 'Ahgg')
    assert_equal 'Ahgg', @node.value
  end

  def test_it_can_recover_a_value_from_its_key
    @node.set('Pizza', 'Yummy')
    assert_equal 'Yummy', @node.value_of('Pizza')
  end

  def test_it_can_recover_another_value_from_its_key
    @node.set('Brocoli', 'Ahgg')
    assert_equal 'Ahgg', @node.value_of('Brocoli')
  end

  def test_it_can_override_the_value_of_a_key
  end

  def test_it_can_override_the_value_of_another_key
  end
end
