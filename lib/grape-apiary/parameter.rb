module GrapeApiary
  class Parameter
    attr_reader :route, :full_name, :name, :settings

    delegate :route_model, :namespace, to: :route

    def initialize(route, name, options)
      @full_name = name
      @name      = name
      @name      = name.scan(/\[(.*)\]/).flatten.first if name.include?('[')
      @route     = route
      @settings  = parse_options(options)
    end

    def requirement
      settings[:requirement]
    end

    def type
      settings[:type]
    end

    def desc
      settings[:desc]
    end

    def documentation
      settings[:documentation]
    end

    def example
      documentation ? documentation[:example] : nil
    end

    def description
      "#{name} (#{requirement}, #{type}, `#{example}`) ... #{desc}"
    end

    private

    def parse_options(options)
      options = default_options if options.blank?

      options[:requirement] = options[:required] ? 'required' : 'optional'

      options
    end

    def default_options
      model = name.include?('_id') ? name.gsub('_id', '') : route.route_model

      {
        required:       true,
        requirement:    'required',
        type:           'uuid',
        desc:           "the `id` of the `#{model}`",
        documentation:  {
          example:      GrapeApiary::Config.generate_id
        }
      }
    end
  end
end
