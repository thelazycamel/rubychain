require 'spec_helper'

describe Rubychain::Block do

  let(:block) { Rubychain::Block.new(123, Time.now, "some data", "PreviousBlockHash") }

  it "should have an index" do
    expect(block.index).to eq(123)
  end

  it "should have a timestamp" do
    expect(block.timestamp.class).to eq(Time)
  end

  it "should have some data" do
    expect(block.data).to eq("some data")
  end

  it "should include the previous hash" do
    expect(block.prev_hash).to eq("PreviousBlockHash")
  end

  it "should create a hash" do
    expect(block.hash.class).to be(String)
  end

end
