require "test_helper"

class DummyProfile < CachedRestModel::Base
  include CachedRestModel::Attributes::Profile
end

class CachedRestModel::Attributes::ProfileTest < Minitest::Test
  def test_profile_in_included_model
    stub_request(:get, '/profiles/1')
      .to_return(body: 'PROFILE_RESPONSE', status: 200)

    assert 'PROFILE_RESPONSE', DummyProfile.new(1).profile

    assert_requested(:get, '/profiles/1', times: 1)
  end
end
