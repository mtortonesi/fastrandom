require "test_helper"
require "fastrandom/random"

class FastRandomTest < Minitest::Test
  @@SAMPLE_SIZE = 10_000

  def test_that_it_has_a_version_number
    refute_nil ::FastRandom::VERSION
  end

  def test_it_does_not_return_nil
    frng = FastRandom::Random.new
    samples = Array.new(@@SAMPLE_SIZE) { frng.rand }
    assert samples.all?
  end

  def test_samples_between_0_and_1
    frng = FastRandom::Random.new
    samples = Array.new(@@SAMPLE_SIZE) { frng.rand }
    assert samples.all? {|s| 0.0 < s and s < 1.0 }
  end
end
