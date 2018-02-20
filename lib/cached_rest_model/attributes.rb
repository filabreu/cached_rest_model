# frozen_string_literal: true

module CachedRestModel
  module Attributes
    def self.get(endpoint)
      CachedRestModel.cache.fetch(endpoint, expires_in: 1.week) do
        uri = URI("#{::CachedRestModel::Base.host}/#{endpoint}")
        Net::HTTP.get(uri)
      end
    end
  end
end
