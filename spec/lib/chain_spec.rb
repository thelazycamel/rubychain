require 'spec_helper'

describe Rubychain::Chain do

  it "can create the Genesis Block" do
    rubychain = Rubychain::Chain.new
    expect(rubychain.genesis_block.index).to eq(0)
    expect(rubychain.genesis_block.data).to eq("Genesis Block")
  end

  it "can create the next block" do
    rubychain = Rubychain::Chain.new
    rubychain.add_next_block(rubychain.last_block, "Hey I'm a new block")
    myblock = rubychain.last_block
    expect(myblock.class).to eq(Rubychain::Block)
    expect(myblock.data).to eq("Hey I'm a new block")
    expect(myblock.index).to eq(1)
    expect(rubychain.blockchain.size).to eq(2)
  end

  it "should raise an error when an incorrect block is given" do
    rubychain = Rubychain::Chain.new
    fake_block = Rubychain::Block.new(123, Time.now, "Evil corp inc.", "BadHash")
    expect{rubychain.add_next_block(fake_block, "hacking for fun")}.to raise_error(Rubychain::Chain::InvalidBlockError)
  end

  it "should create a blockchain" do
    rubychain = Rubychain::Chain.new
    10.times {|x| rubychain.add_next_block(rubychain.last_block, "Adding block #{x+1}") }
    expect(rubychain.blockchain.size).to eq(11)
  end

  it "should find a block with a given hash" do
    rubychain = Rubychain::Chain.new
    10.times {|x| rubychain.add_next_block(rubychain.last_block, "Block #{x+1} Added") }
    block5 = rubychain.blockchain[4]
    expect(rubychain.find_block(block5.hash)).to eq(block5)
  end

end
