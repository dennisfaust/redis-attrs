class Redis
  module Attrs
    class Base
      attr_reader :klass, :name, :type

      def initialize(klass, name, type)
        @klass, @name, @type = klass, name, type
      end

      def redis
        Redis::Attrs.redis
      end

      def redis_key(id)
        raise "id attribute is required in order to properly store Redis attributes" if id.nil?
        "#{klass.redis_key_prefix}:#{id}:#{name}"
      end
    end
  end
end