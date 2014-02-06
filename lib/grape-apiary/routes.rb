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
      @resources ||= begin
        grouped_routes = routes.group_by(&:name).reject do |name, routes|
          resource_exclusion.include?(name.to_sym)
        end

        grouped_routes.map { |name, routes| Resource.new(name, routes) }
      end
    end

    def exclude?(resource)
      resource_exclusion.include?(resource.to_sym)
    end

    def routes_binding
      binding
    end
  end

  class Resource
    attr_reader :name, :routes

    def initialize(name, routes)
      @name   = name
      @routes = routes
    end
  end
end
