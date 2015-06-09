require 'test_helper'
require 'digest'

class MultihashesTest < Minitest::Test
  def setup
    @sha1_digest = Digest::SHA1.digest 'god'
    @sha256_digest = Digest::SHA256.digest 'secret'
  end

  def test_encodes_from_digest
    out = Multihashes.encode @sha1_digest, 'sha1'
    assert_equal [0x11, 20, @sha1_digest].pack('CCA*'), out
  end

  def test_decodes_from_multihash
    out = Multihashes.decode Multihashes.encode(@sha1_digest, 'sha1')
    assert_equal 0x11, out[:code]
    assert_equal 'sha1', out[:hash_function]
    assert_equal 20, out[:length]
    assert_equal @sha1_digest, out[:digest]
  end

  def test_sha256_encode_decode
    out = Multihashes.decode Multihashes.encode(@sha256_digest, 'sha2-256')
    assert_equal 0x12, out[:code]
    assert_equal 'sha2-256', out[:hash_function]
    assert_equal 32, out[:length]
    assert_equal @sha256_digest, out[:digest]
  end

  def test_missing_hash_function
    assert_raises(Multihashes::HashFunctionNotImplemented) {
      Multihashes.encode(@sha256_digest, 'derp')
    }
  end

  def test_incorrect_length
    assert_raises(Multihashes::DigestLengthError) {
      out = Multihashes.encode(@sha256_digest, 'sha2-256')
      out = out + 'a'
      Multihashes.decode(@sha256_digest)
    }
  end
end
