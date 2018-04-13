require 'digest'

module Rubychain
  class Block

    attr_reader :index, :timestamp, :data, :prev_hash, :hash

    def initialize(index, timestamp, data, prev_hash)
      @index = index
      @timestamp = timestamp
      @data = data
      @prev_hash = prev_hash
      @hash = hash_block
    end

    def hash_block
      hash_string = [index,timestamp,data,prev_hash].join
      sha = Digest::SHA1.new
      sha.update(hash_string)
      sha.hexdigest
    end

  end
end
