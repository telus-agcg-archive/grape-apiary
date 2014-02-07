module GrapeApiary
  class Config
    SETTINGS = [
      :host,
      :name,
      :description,
      :request_headers,
      :response_headers,
      :example_id_type,
      :resource_exclusion
    ]

    class << self
      attr_accessor(*SETTINGS)

      def request_headers
        @request_headers ||= []
      end

      def response_headers
        @response_headers ||= []
      end

      def resource_exclusion
        @resource_exclusion ||= []
      end

      def supported_id_types
        [:integer, :uuid, :bson]
      end

      def example_id_type=(value)
        fail UnsupportedIDType unless supported_id_types.include?(value)

        if value.to_sym == :bson && !Object.const_defined?('BSON')
          fail BSONNotDefinied
        end

        @example_id_type = value
      end

      def example_id_type
        @example_id_type ||= :integer
      end

      def generate_id
        case example_id_type
        when :integer
          SecureRandom.random_number(1000)
        when :uuid
          SecureRandom.uuid
        when :bson
          BSON::ObjectId.new.to_s
        end
      end
    end
  end
end
