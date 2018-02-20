# frozen_string_literal: true

module CachedRestModel
  def self.cache
    @cache ||= ActiveSupport::Cache.lookup_store :redis_store
  end
end
