require 'index'

class IndexTest < Minitest::Test
  def test_it_SHA1_hashes_a_value
    assert Digest::SHA1.hexdigest('something')
  end

  def test_it_finds_the_link_position_of_a_word
    assert_equal 0, Index.get('calzone')
  end

  def test_it_finds_the_link_position_of_another_word
    assert_equal 23, Index.get('pizza')
  end

  def test_it_finds_the_link_position_of_a_number
    assert_equal 23, Index.get(56)
  end

  def test_it_indexes_a_word_depending_on_depth
    assert_equal 23, Index.get('pizza')
    assert_equal 16, Index.get('pizza', 1)
    assert_equal  0, Index.get('pizza', 2)
    assert_equal 13, Index.get('pizza', 3)
    assert_equal 28, Index.get('pizza', 4)
  end

  def test_it_indexes_another_word_depending_on_depth
    assert_equal 11, Index.get('brocoli')
    assert_equal 25, Index.get('brocoli', 1)
    assert_equal  3, Index.get('brocoli', 2)
    assert_equal  5, Index.get('brocoli', 3)
    assert_equal  5, Index.get('brocoli', 4)
  end
end
