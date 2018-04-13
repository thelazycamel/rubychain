module Rubychain
  class Chain

    attr_reader :blockchain

    class InvalidBlockError < StandardError; end

    # Initialize a new blockchain by creating a new array with the Genesis block
    #
    def initialize
      @blockchain = [create_genesis_block]
    end

    # #add_next_block => Adds a new block to the blockchain with the given data
    # it will raise an error if the previous_block hash does not match the last_block in our blockchain
    #
    def add_next_block(prev_block, data)
      if valid_block?(prev_block)
        blockchain << next_block(data)
      else
        raise InvalidBlockError
      end
    end

    # #genesis_block => Returns the Genesis block
    #
    def genesis_block
      blockchain.first
    end

    # #last_block => Returns the last block that was added to the blockchain
    #
    def last_block
      blockchain.last
    end

    # #find_block(hash) => Returns a block from the blockchain with the given hash
    #
    def find_block(hash)
      blockchain.select{|block| block if block.hash == hash}.first
    end

    private

    def valid_block?(prev_block)
      prev_block.hash == last_block.hash
    end

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
