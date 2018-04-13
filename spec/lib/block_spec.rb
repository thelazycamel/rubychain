require 'spec_helper'

describe Rubychain::Block do

  it "should create a hash" do
    block = Rubychain::Block.new(0, Time.now, {test: "some data"}, "")
    expect(block.hash.class).to be(String)
  end

end
