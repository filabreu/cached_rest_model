# frozen_string_literal: true

module CachedRestModel
  class Base
    def initialize(key_value)
      instance_variable_set("@#{self.class.key_name}", key_value)
    end

    def self.host
      @host
    end

    def self.host=(value)
      @host = value
    end

    def self.key_name
      @key_name ||= 'id'
    end

    def self.key_name=(value)
      @key_name = value
    end

    define_method key_name do
      instance_variable_get("@#{self.class.key_name}")
    end
  end
end
