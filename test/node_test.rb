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
    @node.set('pizza', 'Yummy')

    assert_equal 'Yummy', @node.value
  end

  def test_it_sets_other_key_value
    @node.set('brocoli', 'Ahgg')

    assert_equal 'Ahgg', @node.value
  end

  def test_it_gets_a_value_from_its_key
    @node.set('pizza', 'Yummy')

    assert_equal 'Yummy', @node.get('pizza')
  end

  def test_it_gets_another_value_from_its_key
    @node.set('brocoli', 'Ahgg')

    assert_equal 'Ahgg', @node.get('brocoli')
  end

  def test_it_overrides_the_value_of_a_key
    @node.set('pizza', 'Yummy')
    @node.set('pizza', 'Ahgg')

    assert_equal 'Ahgg', @node.get('pizza')

  end

  def test_it_overrides_the_value_of_another_key
    @node.set('pizza', 'Ahgg')
    @node.set('pizza', 'Yummy')

    assert_equal 'Yummy', @node.get('pizza')
  end

  def test_it_doesnt_overide_a_value_of_a_different_key
    @node.set('pizza', 'Yummy')
    @node.set('brocoli', 'Ahgg')

    assert_equal 'Yummy', @node.get('pizza')
  end

  def test_it_sets_a_second_key_value_on_its_position
    @node.set('pizza', 'Yummy')
    @node.set('brocoli', 'Ahgg')

    assert_equal 'Ahgg', @node.links[11].value
  end

  def test_it_sets_another_second_key_value_on_its_position
    @node.set('pizza', 'Yummy')
    @node.set('calzone', 'Real Yummy!')

    assert_equal 'Real Yummy!', @node.links[0].value
  end

  def test_it_gets_the_value_of_a_second_key
    @node.set('pizza', 'Yummy')
    @node.set('calzone', 'Real Yummy!')

    assert_equal 'Real Yummy!', @node.get('calzone')
  end

  def test_it_gets_the_value_of_another_second_key
    @node.set('calzone', 'Real Yummy!')
    @node.set('brocoli', 'Ahgg')

    assert_equal 'Ahgg', @node.get('brocoli')
  end

  def test_it_SHA1_hashes_a_value
    assert Digest::SHA1.hexdigest('something')
  end

  def test_it_finds_the_link_position_of_a_word
   assert_equal 0, @node.find_index('calzone')
  end

  def test_it_finds_the_link_position_of_another_word
   assert_equal 23, @node.find_index('pizza')
  end

  def test_it_finds_the_link_position_of_a_number
   assert_equal 23, @node.find_index(56)
  end


end
