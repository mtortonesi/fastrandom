require 'securerandom'
require 'ffi'
require_relative './librandom'

module FastRandom
  class Random
    def initialize(seed = nil)
      raise ArgumentError, "Seeding not supported (yet)!" unless seed.nil?

      @state = ::FFI::MemoryPointer.new(:uint64, 2)
      @state.write_array_of_uint64([ ::SecureRandom.random_bytes(8).to_i, ::SecureRandom.random_bytes(8).to_i ])
    end

    def rand(max = nil)
      raise ArgumentError, "Max mode not supported!" unless max.nil?

      CExt::xoroshiro128plus_double(@state)
    end
  end
end
