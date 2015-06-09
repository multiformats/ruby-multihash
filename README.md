# Multihashes

A [Multihash](https://github.com/jbenet/multihash) implementation for ruby.

A multihash is a digest with an embedded hash function code (and length) (['cause you never know](https://twitter.com/matthew_d_green/status/597409850381836288)). It was developed primarily for use with [IPFS](https://github.com/ipfs/ipfs), but is not specific to it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'multihashes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multihashes

## Usage

This is a low-level library. Bring your own digest. Binary goes in, binary goes out. To compute a sha256 multihash that would work nicely with [IPFS](https://github.com/ipfs/ipfs):

```ruby
require 'multihashes'
require 'digest'

digest = Digest::SHA256.digest 'Dade Murphy will never figure this one out'
Multihashes.encode(digest, 'sha2-256')
```

Hash function names (latest is [here](https://github.com/jbenet/multihash/blob/master/hashtable.csv))

    code name
    0x11 sha1
    0x12 sha2-256
    0x13 sha2-512
    0x14 sha3
    0x40 blake2b
    0x41 blake2s
    # 0x00-0x0f reserved for application specific functions
    # 0x10-0x3f reserved for SHA standard functions

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/neocities/multihashes.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
