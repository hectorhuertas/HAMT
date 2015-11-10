require 'node'
require 'pry'
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
    refute @node.value
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
    assert_nil @node.get("doesnt exist")
  end

  def test_it_sets_several_keys_of_different_indexes
    5.times {|pos| @node.set("key #{pos}", "value #{pos}")}
    5.times {|pos| assert_equal "value #{pos}", @node.get("key #{pos}")}
  end


  def test_it_handles_collisions_when_large_sets_of_data
    200.times {|pos| @node.set("key #{pos}", "value #{pos}")}
    200.times {|pos| assert_equal "value #{pos}", @node.get("key #{pos}")}
  end

  def test_second_level_has_more_than_one_link
    @node.set('head', '0')
    @node.set('pizza', 'Yummy')
    1000.times {|pos|  @node.set("key #{pos}", "value #{pos}")}
    pizza_links = @node.links[23].links.compact
    assert pizza_links.length > 1
    assert pizza_links.length > 2
    assert pizza_links.length > 3
  end

  def test_deeper_levels_have_more_than_one_link
    ## pick a non random path to a third level to test better
    10000.times {|pos| @node.set("key #{pos}", "value #{pos}")}
    level_1 = @node.links[rand(0..31)]
    level_2 = @node.links[rand(0..31)].links[rand(0..31)]
    level_3 = @node.links[rand(0..31)].links[rand(0..31)].links[rand(0..31)]

    assert level_1.links.compact.length > 1
    assert level_2.links.compact.length > 1
  end
    # 50.times {|pos| puts @node.find_index("key #{pos}")}

  def test_it_recovers_keys_of_tree
    100.times {|pos| @node.set("key #{pos}", "value #{pos}")}
    expected = []
    100.times {|pos| expected << "key #{pos}"}

    assert_equal expected.sort, @node.keys.sort
  end

  def test_it_recovers_values_of_tree
    100.times {|pos| @node.set("key #{pos}", "value #{pos}")}
    expected = []
    100.times {|pos| expected << "value #{pos}"}

    assert_equal expected.sort, @node.values.sort
  end

end
