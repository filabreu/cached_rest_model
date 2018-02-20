require "test_helper"

class CachedRestModel::BaseTest < Minitest::Test
  def test_method_defined_with_default_key_name
    assert_includes CachedRestModel::Base.instance_methods, :id
  end

  def test_initialize_with_default_key_name
    assert CachedRestModel::Base.new(1).id, 1
  end
end
