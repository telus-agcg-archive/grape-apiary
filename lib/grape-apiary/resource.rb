module GrapeApiary
  class Resource
    attr_reader :key, :name, :routes

    def initialize(key, routes)
      @key    = key
      @name   = key.humanize
      @routes = routes
    end

    def title
      @title ||= name.titleize
    end

    def namespaced
      @namespaced ||= routes.group_by(&:route_namespace).map do |_, routes|
        Resource.new(name, routes)
      end
    end

    def paths
      @paths ||= routes.group_by(&:route_path_without_format).map do |n, routes|
        Resource.new(name, routes)
      end
    end

    def header
      # TODO: ???
      route = routes.first

      "#{title} #{route.route_type} [#{route.route_path_without_format}]"
    end

    def sample_request
      SampleGenerator.new(self).request
    end

    def sample_response
      SampleGenerator.new(self).response
    end

    def unique_params
      # params = routes.map(&:route_params)
    end
  end
end
