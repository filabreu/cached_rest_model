require "test_helper"

class Xing::CachedRestModelTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Xing::CachedRestModel::VERSION
  end
end
