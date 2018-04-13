require 'spec_helper'

describe Rubychain::Chain do

  it "can create the Genesis Block" do
    rubychain = Rubychain::Chain.new
    expect(rubychain.genesis_block.index).to eq(0)
    expect(rubychain.genesis_block.data).to eq("Genesis Block")
  end

  it "can create the next block" do
    rubychain = Rubychain::Chain.new
    rubychain.add_next_block("Hey I'm a new block")
    expect(rubychain.blockchain.size).to eq(2)
    expect(rubychain.last_block.class).to eq(Rubychain::Block)
    expect(rubychain.last_block.data).to eq("Hey I'm a new block")
    expect(rubychain.last_block.index).to eq(1)
  end

  it "should create a blockchain" do
    rubychain = Rubychain::Chain.new
    puts "Genesis Block created: #{rubychain.genesis_block.data} : #{rubychain.genesis_block.hash}"
    10.times do |x|
      data = "Block #{x+1} has been added to the blockchain"
      rubychain.add_next_block(data)
      last_block = rubychain.last_block
      puts "#{last_block.data} : #{last_block.hash}"
    end
    expect(rubychain.blockchain.size).to eq(11)
  end

  it "should find a block with a given hash" do
    rubychain = Rubychain::Chain.new
    10.times {|x| rubychain.add_next_block("Block #{x+1} Added") }
    block5 = rubychain.blockchain[4]
    expect(rubychain.find_block(block5.hash)).to eq(block5)
  end

end
