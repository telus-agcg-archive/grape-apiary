module GrapeApiary
  class Config
    class << self
      attr_accessor :host, :name, :description
      attr_reader :request_headers, :response_headers

      def request_headers
        @request_headers ||= []
      end

      def response_headers
        @response_headers ||= []
      end

      def request_headers=(value)
        @request_headers = value
      end

      def response_headers=(value)
        @response_headers = value
      end
    end
  end
end
