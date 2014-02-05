module GrapeApiary
  class Config
    class << self
      attr_accessor :host, :name, :description
      attr_writer :request_headers, :response_headers

      def request_headers
        @request_headers ||= []
      end

      def response_headers
        @response_headers ||= []
      end
    end
  end
end
