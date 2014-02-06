module GrapeApiary
  class Config
    SETTINGS = [
      :host,
      :name,
      :description,
      :request_headers,
      :response_headers,
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
    end
  end
end
