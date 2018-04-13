module Rubychain
  class Chain

    attr_accessor :blockchain

    def initialize
      @blockchain = [create_genesis_block]
    end

    def add_next_block(data)
      blockchain << next_block(data)
    end

    def genesis_block
      blockchain.first
    end

    def last_block
      blockchain.last
    end

    private

    def next_block(data)
      index = last_block.index + 1
      timestamp = Time.now
      hash = last_block.hash
      Block.new(index, timestamp, data, hash)
    end

    def create_genesis_block()
      Block.new(0, Time.now, "Genesis Block", 0)
    end

  end
end
