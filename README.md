# Rubychain

Rubychain is a very simple implementation of a blockchain for education purposes.
It is heavily inspired by the python version
which can be found here: https://dev.to/aunyks/lets-build-the-tiniest-blockchain

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubychain'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rubychain

## Usage

require 'rubychain'

## Rubychain::Chain
### Available methods


`add_next_block` => Adds a new block to the blockchain with the given data
`genesis_block` => Returns the Genesis block
`last_block` => Returns the last block that was added to the blockchain
`find_block(hash)` => Returns a block from the blockchain with the given hash
`blockchain` => Returns the whole blockchain as an array

### Exploring the blockchain

Initialize a new blockchain with a genesis block:

`rc = Rubychain::Chain.new`

`rc.add_next_block("some data")` => creates a new block with given data
`rc.genesis_block` => returns the genesis block
`rc.last_block` => returns the last block on the blockchain
`rc.find_block(hash)` => return the block with the given hash
`rc.blockchain` => [genesis_block, block2] => Returns the whole blockchain as an array

## Rubychain::Block
### Available methods

`index` => returns the blocks index
`timestamp` => returns the blocks timestamp
`data` => returns the blocks data
`prev_hash` => returns the previous blocks hash
`hash` => returns a SHA256 hash representation of all the items in the block

### Exploring a block

`myblock = rc.last_block`
or
`myblock = rc.find_block(hash)`
or directly
`myblock = Rubychain::Block.new(1, Time.now, "Hello World", "abc123")`

`myblock.index` => 1
`myblock.timestamp` => Time of creation
`myblock.data` => "Hello World"
`myblock.pre_hash` => "abc123"
`myblock.hash` => sha.hexdigest of index, timestamp, data and previous block hash


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/rubychain.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
