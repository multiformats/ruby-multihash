require 'multihashes/version'
require 'multicodecs'

module Multihashes
  class HashFunctionNotImplemented < StandardError; end
  class DigestLengthError < StandardError; end

  # https://github.com/multiformats/multicodec/blob/master/table.csv
  TABLE = Multicodecs.where(tag: 'multihash')
    .map { |codec| [codec.code, codec.name] }
    .to_h

  def self.encode(digest, hash_function)
    length = digest.bytesize
    key = TABLE.key hash_function
    raise HashFunctionNotImplemented, 'unknown hash function code' if key.nil?
    [TABLE.key(hash_function), length, digest].pack("CCA#{length}")
  end

  def self.decode(multihash)
    integer, length, digest = multihash.unpack('CCA*')

    if length != digest.bytesize
      raise DigestLengthError, 'digest did not match expected multihash length'
    end

    {code: integer, hash_function: TABLE[integer], length: length, digest: digest}
  end
end
