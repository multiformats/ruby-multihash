require 'multihashes/version'

module Multihashes
  class HashFunctionNotImplemented < StandardError; end
  class DigestLengthError < StandardError; end

  # https://github.com/jbenet/multihash
  TABLE = {
    0xd5 => 'md5',
    0x11 => 'sha1',
    0x12 => 'sha2-256',
    0x13 => 'sha2-512',
    0x14 => 'sha3',
    0x40 => 'blake2b',
    0x41 => 'blake2s'
  }

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
