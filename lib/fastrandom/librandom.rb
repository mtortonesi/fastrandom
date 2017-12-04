require 'ffi'
require 'ffi-compiler/loader'

module FastRandom
  module CExt
    extend FFI::Library
    ffi_lib FFI::Compiler::Loader.find('random')
    attach_function :xoroshiro128plus, [:pointer], :uint64
    attach_function :xoroshiro128plus_double, [:pointer], :double
  end
end
