module GrapeApiary
  class Blueprint
    attr_reader :api_class, :template

    delegate(*GrapeApiary::Config::SETTINGS, to: 'GrapeApiary::Config')

    def initialize(api_class)
      @api_class = api_class
    end

    def generate
      ERB.new(template).result(binding)
    end

    def write
      fail 'Not yet supported'
    end

    def template
      @template ||= begin
        path = File.expand_path('./templates/blueprint.md.erb', __dir__)

        File.read(path)
      end
    end

    def routes
      @routes ||= api_class.routes.map do |route|
        GrapeApiary::Route.new(route)
      end
    end

    def resources
      @resources ||= begin
        grouped_routes = routes.group_by(&:route_name).reject do |name, routes|
          resource_exclusion.include?(name.to_sym)
        end

        grouped_routes.map { |name, routes| Resource.new(name, routes) }
      end
    end

    def formatted_request_headers
      formatted_headers(GrapeApiary::Config.request_headers)
    end

    def formatted_response_headers
      formatted_headers(GrapeApiary::Config.response_headers)
    end

    def show_request_sample?(route)
      %w(PUT POST).include?(route.route_method)
    end

    def routes_binding
      binding
    end

    private

    def formatted_headers(headers)
      spacer  = "\n" + (' ' * 12)

      strings = headers.map do |header|
        key, value = *header.first

        "#{key}: #{value}"
      end

      strings.join(spacer)
    end
  end
end
