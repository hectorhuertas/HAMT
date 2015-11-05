require 'digest'

module Index
  def self.get(input, depth = 0)
    get_index_of(adjust(hash_value(input), depth))
  end

  def self.get_index_of(adjusted_hash_value)
    adjusted_hash_value & 31
  end

  def self.hash_value(input)
    Digest::SHA1.hexdigest(input.to_s).to_i(16)
  end

  def self.adjust(hash_value, depth)
    hash_value >> 5 * depth
  end
end
