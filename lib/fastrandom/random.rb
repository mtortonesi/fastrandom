require 'securerandom'
require 'ffi'
require_relative './librandom'

module FastRandom
  class Random
    def initialize(seed = nil)
      raise ArgumentError, "Seeding not supported (yet)!" unless seed.nil?

      @state = ::FFI::MemoryPointer.new(:uint64, 2)
      u64_array = ::SecureRandom.random_bytes(16).unpack('QQ')
      @state.write_array_of_uint64(u64_array)
    end

    def rand(max = nil)
      raise ArgumentError, "Max mode not supported!" unless max.nil?

      CExt::xoroshiro128plus_double(@state)
    end
  end
end
