module GrapeApiary
  class Parameter
    attr_reader :route, :full_name, :name, :settings

    delegate :route_model, :route_namespace, to: :route
    delegate :requirement, :type, :documentation, :desc, to: :settings
    delegate :example, to: :documentation, allow_nil: true

    def initialize(route, name, options)
      @full_name = name
      @name      = name
      @name      = name.scan(/\[(.*)\]/).flatten.first if name.include?('[')
      @route     = route
      @settings  = parse_options(options)
    end

    def description
      "#{name} (#{requirement}, #{type}, `#{example}`) ... #{desc}"
    end

    private

    def parse_options(options)
      options = default_options(options) if options.blank?

      options[:requirement] = options[:required] ? 'required' : 'optional'

      Hashie::Mash.new(options)
    end

    def default_options(options)
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
