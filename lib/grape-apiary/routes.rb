module GrapeApiary
  class Routes
    extend Forwardable

    attr_reader :api_class

    delegate GrapeApiary::Config::SETTINGS => 'GrapeApiary::Config'
    delegate [:routes] => :api_class

    def initialize(api_class)
      @api_class = api_class
    end

    def resources
      @resources ||= routes.reduce({}) do |resources, route|
        resources[route.name] ||= []
        resources[route.name] << route

        resources
      end
    end

    def exclude?(resource)
      resource_exclusion.include?(resource.to_sym)
    end

    def routes_binding
      binding
    end
  end
end
