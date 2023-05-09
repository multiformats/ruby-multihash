**This project is no longer maintained and has been archived.**

# ruby-multihash

[![](https://img.shields.io/badge/project-multiformats-blue.svg?style=flat-square)](https://github.com/multiformats/multiformats)
[![](https://img.shields.io/badge/freenode-%23ipfs-blue.svg?style=flat-square)](https://webchat.freenode.net/?channels=%23ipfs)
[![](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)
[![Travis CI](https://img.shields.io/travis/multiformats/ruby-multihash.svg?style=flat-square&branch=master)](https://travis-ci.org/multiformats/ruby-multihash)
[![codecov.io](https://img.shields.io/codecov/c/github/multiformats/ruby-multihash.svg?style=flat-square&branch=master)](https://codecov.io/github/multiformats/ruby-multihash?branch=master)

> A simple [Multihash](https://github.com/multiformats/multihash) implementation for ruby.

A multihash is a digest with an embedded hash function code (and length) (['cause you never know](https://twitter.com/matthew_d_green/status/597409850381836288)). It was developed primarily for use with [IPFS](https://github.com/ipfs/ipfs), but is not specific to it.

## Install

Add this line to your application's Gemfile:

```ruby
gem 'multihashes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install multihashes

## Usage

This is a low-level library. Bring your own digest. A binary digest goes in, a binary digest goes out. To compute a sha256 multihash that would work nicely with [IPFS](https://github.com/ipfs/ipfs):

```ruby
require 'multihashes'
require 'digest'

digest = Digest::SHA256.digest 'Dade Murphy will never figure this one out'
multihash_binary_string = Multihashes.encode digest, 'sha2-256'

multihash_binary_string.unpack('H*').first # hex: "1220142711d38ca7a33c521841..."

out = Multihashes.decode multihash_binary_string
# => {:code=>18, :hash_function=>"sha2-256", :length=>32, :digest=>"\x14'\x11\xD3\x8C\xA7\xA3<R\x18Ao\x8F\xFC\xC6FH\xCAF\x16\xA6%\xB5\xE0\xA0\xAB=\xA1\x91\x1D]z"}

```

Hash function names (latest is [here](https://github.com/multiformats/multicodec/blob/master/table.csv), current `multicodec` is [here](https://github.com/SleeplessByte/ruby-multicodec/blob/master/lib/table.csv))

| code   | name           | comment |
|--------|----------------|---------|
| 0x00   | identity       | raw binary |
| 0x11   | sha1           | |
| 0x12   | sha2-256       | |
| 0x13   | sha2-512       | |
| 0x14   | sha3-512       | |
| 0x15   | sha3-384       | |
| 0x16   | sha3-256       | |
| 0x17   | sha3-224       | |
| 0x18   | shake-128      | |
| 0x19   | shake-256      | |
| 0x1a   | keccak-224     | `keccak` has variable output length. The number specifies the core length |
| 0x1b   | keccak-256     | |
| 0x1c   | keccak-384     | |
| 0x1d   | keccak-512     | |
| 0x22   | murmur3-128    | |
| 0x23   | murmur3-32     | |
| 0x56   | dbl-sha2-256   | |
| 0xd4   | md4            | |
| 0xd4   | md5            | |
| 0xd6   | bmt            | Binary Merkle Tree Hash |
| 0x1100 | x11            | |
| 0xb201 | blake2b-8      | `blake2b` consists of 64 output lengths that give different hashes |
| 0xb202 | blake2b-16     | |
| 0xb203 | blake2b-24     | |
| ...    |                | |
| 0xb23f | blake2b-504    | |
| 0xb240 | blake2b-512    | |
| 0xb241 | blake2s-8      | `blake2s` consists of 32 output lengths that give different hashes |
| 0xb242 | blake2s-16     | |
| 0xb243 | blake2s-24     | |
| ...    |                | |
| 0xb25f | blake2s-248    | |
| 0xb260 | blake2s-256    | |
| 0xb301 | skein256-8     | `skein256` consists of 32 output lengths that give different hashes |
| 0xb302 | skein256-16    | |
| 0xb303 | skein256-24    | |
| ...    |                | |
| 0xb31f | skein256-248   | |
| 0xb320 | skein256-256   | |
| 0xb321 | skein512-8     | `skein256` consists of 32 output lengths that give different hashes |
| 0xb322 | skein512-16    | |
| 0xb323 | skein512-24    | |
| ...    |                | |
| 0xb35f | skein512-504   | |
| 0xb360 | skein512-512   | |
| 0xb361 | skein1024-8    | `skein1024` consists of 128 output lengths that give different hashes |
| 0xb362 | skein1024-16   | |
| 0xb363 | skein1024-24   | |
| ...    |                | |
| 0xb3df | skein1024-1016 | |
| 0xb3e0 | skein1024-1024 | |

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`.

## Maintainers

[@kyledrake](https://github.com/kyledrake)

## Contribute

Bug reports and pull requests are welcome on GitHub at https://github.com/multiformats/ruby-multihash.

Check out our [contributing document](https://github.com/multiformats/multiformats/blob/master/contributing.md) for more information on how we work, and about contributing in general. Please be aware that all interactions related to multiformats are subject to the IPFS [Code of Conduct](https://github.com/ipfs/community/blob/master/code-of-conduct.md).

Small note: If editing the README, please conform to the [standard-readme](https://github.com/RichardLitt/standard-readme) specification.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT) © 2015 Kyle Drake.
