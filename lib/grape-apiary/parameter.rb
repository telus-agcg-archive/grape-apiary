module GrapeApiary
  class Parameter
    attr_reader :route, :name, :settings

    delegate :route_model, :route_namespace,       to: :route
    delegate :requirement, :type, :example, :desc, to: :settings

    def initialize(route, name, options)
      @route    = route
      @name     = name
      @name     = name.scan(/\[(.*)\]/).flatten.first if name.include?('[')
      @settings = parse_options(options)
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
        required:     true,
        requirement:  'required',
        type:         'uuid',
        desc:         "the `id` of the `#{model}`",
        example:      SecureRandom.uuid
      }
    end
  end
end
