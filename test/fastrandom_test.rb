require "test_helper"
require "fastrandom/random"

class FastrandomTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::FastRandom::VERSION
  end

  def test_it_does_something_useful
    frng = FastRandom::Random.new
    refute_nil frng.rand
  end
end
