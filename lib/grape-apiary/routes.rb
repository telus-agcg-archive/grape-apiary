module GrapeApiary
  class Routes
    extend Forwardable

    attr_reader :api_class

    delegate [:host, :name, :description] => 'GrapeApiary::Config'

    def initialize(api_class)
      @api_class = api_class
    end

    def resources
      @resources ||= []
    end

    def routes_binding
      binding
    end
  end
end
